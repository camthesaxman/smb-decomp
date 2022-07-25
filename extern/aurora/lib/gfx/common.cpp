#include "common.hpp"

#include "../internal.hpp"
#include "../webgpu/gpu.hpp"
#include "model/shader.hpp"
#include "stream/shader.hpp"
#include "texture.hpp"

#include <absl/container/flat_hash_map.h>
#include <condition_variable>
#include <deque>
#include <fstream>
#include <thread>
#include <mutex>
#include <magic_enum.hpp>

namespace aurora::gfx {
static Module Log("aurora::gfx");

using webgpu::g_device;
using webgpu::g_queue;

#ifdef AURORA_GFX_DEBUG_GROUPS
std::vector<std::string> g_debugGroupStack;
#endif

constexpr uint64_t UniformBufferSize = 3145728;  // 3mb
constexpr uint64_t VertexBufferSize = 8388608;   // 8mb
constexpr uint64_t IndexBufferSize = 1048576;    // 1mb
constexpr uint64_t StorageBufferSize = 0;        // Unused
constexpr uint64_t TextureUploadSize = 25165824; // 24mb

constexpr uint64_t StagingBufferSize =
    UniformBufferSize + VertexBufferSize + IndexBufferSize + StorageBufferSize + TextureUploadSize;

struct ShaderState {
  stream::State stream;
  model::State model;
};
struct ShaderDrawCommand {
  ShaderType type;
  union {
    stream::DrawData stream;
    model::DrawData model;
  };
};
enum class CommandType {
  SetViewport,
  SetScissor,
  Draw,
};
struct Command {
  CommandType type;
#ifdef AURORA_GFX_DEBUG_GROUPS
  std::vector<std::string> debugGroupStack;
#endif
  union Data {
    struct SetViewportCommand {
      float left;
      float top;
      float width;
      float height;
      float znear;
      float zfar;

      bool operator==(const SetViewportCommand& rhs) const {
        return left == rhs.left && top == rhs.top && width == rhs.width && height == rhs.height && znear == rhs.znear &&
               zfar == rhs.zfar;
      }
      bool operator!=(const SetViewportCommand& rhs) const { return !(*this == rhs); }
    } setViewport;
    struct SetScissorCommand {
      uint32_t x;
      uint32_t y;
      uint32_t w;
      uint32_t h;

      bool operator==(const SetScissorCommand& rhs) const {
        return x == rhs.x && y == rhs.y && w == rhs.w && h == rhs.h;
      }
      bool operator!=(const SetScissorCommand& rhs) const { return !(*this == rhs); }
    } setScissor;
    ShaderDrawCommand draw;
  } data;
};
} // namespace aurora::gfx

namespace aurora {
// For types that we can't ensure are safe to hash with has_unique_object_representations,
// we create specialized methods to handle them. Note that these are highly dependent on
// the structure definition, which could easily change with Dawn updates.
template <>
inline HashType xxh3_hash(const WGPUBindGroupDescriptor& input, HashType seed) {
  constexpr auto offset = sizeof(void*) * 2; // skip nextInChain, label
  const auto hash = xxh3_hash_s(reinterpret_cast<const u8*>(&input) + offset,
                                sizeof(WGPUBindGroupDescriptor) - offset - sizeof(void*) /* skip entries */, seed);
  return xxh3_hash_s(input.entries, sizeof(WGPUBindGroupEntry) * input.entryCount, hash);
}
template <>
inline HashType xxh3_hash(const WGPUSamplerDescriptor& input, HashType seed) {
  constexpr auto offset = sizeof(void*) * 2; // skip nextInChain, label
  return xxh3_hash_s(reinterpret_cast<const u8*>(&input) + offset,
                     sizeof(WGPUSamplerDescriptor) - offset - 2 /* skip padding */, seed);
}
} // namespace aurora

namespace aurora::gfx {
using NewPipelineCallback = std::function<WGPURenderPipeline()>;
std::mutex g_pipelineMutex;
static bool g_hasPipelineThread = false;
static std::thread g_pipelineThread;
static std::atomic_bool g_pipelineThreadEnd;
static std::condition_variable g_pipelineCv;
static absl::flat_hash_map<PipelineRef, WGPURenderPipeline> g_pipelines;
static std::deque<std::pair<PipelineRef, NewPipelineCallback>> g_queuedPipelines;
static absl::flat_hash_map<BindGroupRef, WGPUBindGroup> g_cachedBindGroups;
static absl::flat_hash_map<SamplerRef, WGPUSampler> g_cachedSamplers;
std::atomic_uint32_t queuedPipelines;
std::atomic_uint32_t createdPipelines;

static ByteBuffer g_verts;
static ByteBuffer g_uniforms;
static ByteBuffer g_indices;
static ByteBuffer g_storage;
static ByteBuffer g_staticStorage;
static ByteBuffer g_textureUpload;
WGPUBuffer g_vertexBuffer;
WGPUBuffer g_uniformBuffer;
WGPUBuffer g_indexBuffer;
WGPUBuffer g_storageBuffer;
size_t g_staticStorageLastSize = 0;
static std::array<WGPUBuffer, 3> g_stagingBuffers;
static WGPUSupportedLimits g_cachedLimits;

static ShaderState g_state;
static PipelineRef g_currentPipeline;

using CommandList = std::vector<Command>;
struct ClipRect {
  int32_t x;
  int32_t y;
  int32_t width;
  int32_t height;
};
struct RenderPass {
  u32 resolveTarget = UINT32_MAX;
  ClipRect resolveRect;
  Vec4<float> clearColor{0.f, 0.f, 0.f, 0.f};
  CommandList commands;
  bool clear = true;
};
static std::vector<RenderPass> g_renderPasses;
static u32 g_currentRenderPass = UINT32_MAX;
std::vector<TextureHandle> g_resolvedTextures;
std::vector<TextureUpload> g_textureUploads;

static ByteBuffer g_serializedPipelines{};
static u32 g_serializedPipelineCount = 0;

template <typename PipelineConfig>
static void serialize_pipeline_config(ShaderType type, const PipelineConfig& config) {
  static_assert(std::has_unique_object_representations_v<PipelineConfig>);
  g_serializedPipelines.append(&type, sizeof(type));
  const u32 configSize = sizeof(config);
  g_serializedPipelines.append(&configSize, sizeof(configSize));
  g_serializedPipelines.append(&config, configSize);
  ++g_serializedPipelineCount;
}

template <typename PipelineConfig>
static PipelineRef find_pipeline(ShaderType type, const PipelineConfig& config, NewPipelineCallback&& cb,
                                 bool serialize = true) {
  PipelineRef hash = xxh3_hash(config, static_cast<HashType>(type));
  bool found = false;
  {
    std::scoped_lock guard{g_pipelineMutex};
    found = g_pipelines.contains(hash);
    if (!found) {
      if (g_hasPipelineThread) {
        const auto ref =
            std::find_if(g_queuedPipelines.begin(), g_queuedPipelines.end(), [=](auto v) { return v.first == hash; });
        if (ref != g_queuedPipelines.end()) {
          found = true;
        }
      } else {
        g_pipelines.try_emplace(hash, cb());
        if (serialize) {
          serialize_pipeline_config(type, config);
        }
        found = true;
      }
    }
    if (!found) {
      g_queuedPipelines.emplace_back(std::pair{hash, std::move(cb)});
      if (serialize) {
        serialize_pipeline_config(type, config);
      }
    }
  }
  if (!found) {
    g_pipelineCv.notify_one();
    queuedPipelines++;
  }
  return hash;
}

static inline void push_command(CommandType type, const Command::Data& data) {
  if (g_currentRenderPass == UINT32_MAX) {
    Log.report(LOG_WARNING, FMT_STRING("Dropping command {}"), magic_enum::enum_name(type));
    return;
  }
  g_renderPasses[g_currentRenderPass].commands.push_back({
      .type = type,
#ifdef AURORA_GFX_DEBUG_GROUPS
      .debugGroupStack = g_debugGroupStack,
#endif
      .data = data,
  });
}

static void push_draw_command(ShaderDrawCommand data) { push_command(CommandType::Draw, Command::Data{.draw = data}); }

static Command::Data::SetViewportCommand g_cachedViewport;
void set_viewport(float left, float top, float width, float height, float znear, float zfar) noexcept {
  Command::Data::SetViewportCommand cmd{left, top, width, height, znear, zfar};
  if (cmd != g_cachedViewport) {
    push_command(CommandType::SetViewport, Command::Data{.setViewport = cmd});
    g_cachedViewport = cmd;
  }
}
static Command::Data::SetScissorCommand g_cachedScissor;
void set_scissor(uint32_t x, uint32_t y, uint32_t w, uint32_t h) noexcept {
  Command::Data::SetScissorCommand cmd{x, y, w, h};
  if (cmd != g_cachedScissor) {
    push_command(CommandType::SetScissor, Command::Data{.setScissor = cmd});
    g_cachedScissor = cmd;
  }
}

static inline bool operator==(const WGPUExtent3D& lhs, const WGPUExtent3D& rhs) {
  return lhs.width == rhs.width && lhs.height == rhs.height && lhs.depthOrArrayLayers == rhs.depthOrArrayLayers;
}
static inline bool operator!=(const WGPUExtent3D& lhs, const WGPUExtent3D& rhs) { return !(lhs == rhs); }

void resolve_color(const ClipRect& rect, uint32_t bind, GXTexFmt fmt, bool clear_depth) noexcept {
  if (g_resolvedTextures.size() < bind + 1) {
    g_resolvedTextures.resize(bind + 1);
  }
  const WGPUExtent3D size{
      .width = static_cast<uint32_t>(rect.width),
      .height = static_cast<uint32_t>(rect.height),
      .depthOrArrayLayers = 1,
  };
  if (!g_resolvedTextures[bind] || g_resolvedTextures[bind]->size != size) {
    g_resolvedTextures[bind] = new_render_texture(rect.width, rect.height, fmt, "Resolved Texture");
  }
  auto& currentPass = g_renderPasses[g_currentRenderPass];
  currentPass.resolveTarget = bind;
  currentPass.resolveRect = rect;
  auto& newPass = g_renderPasses.emplace_back();
  newPass.clearColor = gx::g_gxState.clearColor;
  newPass.clear = false; // TODO
  ++g_currentRenderPass;
}

template <>
const stream::State& get_state() {
  return g_state.stream;
}
template <>
void push_draw_command(stream::DrawData data) {
  push_draw_command(ShaderDrawCommand{.type = ShaderType::Stream, .stream = data});
}
template <>
PipelineRef pipeline_ref(stream::PipelineConfig config) {
  return find_pipeline(ShaderType::Stream, config, [=]() { return create_pipeline(g_state.stream, config); });
}

template <>
void push_draw_command(model::DrawData data) {
  push_draw_command(ShaderDrawCommand{.type = ShaderType::Model, .model = data});
}
template <>
PipelineRef pipeline_ref(model::PipelineConfig config) {
  return find_pipeline(ShaderType::Model, config, [=]() { return create_pipeline(g_state.model, config); });
}

static void pipeline_worker() {
  bool hasMore = false;
  while (true) {
    std::pair<PipelineRef, NewPipelineCallback> cb;
    {
      std::unique_lock lock{g_pipelineMutex};
      if (!hasMore) {
        g_pipelineCv.wait(lock, [] { return !g_queuedPipelines.empty() || g_pipelineThreadEnd; });
      }
      if (g_pipelineThreadEnd) {
        break;
      }
      cb = std::move(g_queuedPipelines.front());
    }
    auto result = cb.second();
    // std::this_thread::sleep_for(std::chrono::milliseconds{1500});
    {
      std::scoped_lock lock{g_pipelineMutex};
      if (!g_pipelines.try_emplace(cb.first, std::move(result)).second) {
        Log.report(LOG_FATAL, FMT_STRING("Duplicate pipeline {}"), cb.first);
        unreachable();
      }
      g_queuedPipelines.pop_front();
      hasMore = !g_queuedPipelines.empty();
    }
    createdPipelines++;
    queuedPipelines--;
  }
}

void initialize() {
  // No async pipelines for OpenGL (ES)
  if (webgpu::g_backendType == WGPUBackendType_OpenGL || webgpu::g_backendType == WGPUBackendType_OpenGLES) {
    g_hasPipelineThread = false;
  } else {
    g_pipelineThreadEnd = false;
    g_pipelineThread = std::thread(pipeline_worker);
    g_hasPipelineThread = true;
  }

  // For uniform & storage buffer offset alignments
  wgpuDeviceGetLimits(g_device, &g_cachedLimits);

  const auto createBuffer = [](WGPUBuffer& out, WGPUBufferUsageFlags usage, uint64_t size, const char* label) {
    if (size <= 0) {
      return;
    }
    const WGPUBufferDescriptor descriptor{
        .label = label,
        .usage = usage,
        .size = size,
    };
    out = wgpuDeviceCreateBuffer(g_device, &descriptor);
  };
  createBuffer(g_uniformBuffer, WGPUBufferUsage_Uniform | WGPUBufferUsage_CopyDst, UniformBufferSize,
               "Shared Uniform Buffer");
  createBuffer(g_vertexBuffer, WGPUBufferUsage_Vertex | WGPUBufferUsage_CopyDst, VertexBufferSize,
               "Shared Vertex Buffer");
  createBuffer(g_indexBuffer, WGPUBufferUsage_Index | WGPUBufferUsage_CopyDst, IndexBufferSize, "Shared Index Buffer");
  createBuffer(g_storageBuffer, WGPUBufferUsage_Storage | WGPUBufferUsage_CopyDst, StorageBufferSize,
               "Shared Storage Buffer");
  for (int i = 0; i < g_stagingBuffers.size(); ++i) {
    const auto label = fmt::format(FMT_STRING("Staging Buffer {}"), i);
    createBuffer(g_stagingBuffers[i], WGPUBufferUsage_MapWrite | WGPUBufferUsage_CopySrc, StagingBufferSize,
                 label.c_str());
  }
  map_staging_buffer();

  g_state.stream = stream::construct_state();
  g_state.model = model::construct_state();

  {
    // Load serialized pipeline cache
    std::string path = std::string{g_config.configPath} + "/pipeline_cache.bin";
    std::ifstream file(path, std::ios::in | std::ios::binary | std::ios::ate);
    if (file) {
      const auto size = file.tellg();
      file.seekg(0, std::ios::beg);
      constexpr size_t headerSize = sizeof(g_serializedPipelineCount);
      if (size != -1 && size > headerSize) {
        g_serializedPipelines.append_zeroes(size_t(size) - headerSize);
        file.read(reinterpret_cast<char*>(&g_serializedPipelineCount), headerSize);
        file.read(reinterpret_cast<char*>(g_serializedPipelines.data()), size_t(size) - headerSize);
      }
    }
  }
  if (g_serializedPipelineCount > 0) {
    size_t offset = 0;
    while (offset < g_serializedPipelines.size()) {
      ShaderType type = *reinterpret_cast<const ShaderType*>(g_serializedPipelines.data() + offset);
      offset += sizeof(ShaderType);
      u32 size = *reinterpret_cast<const u32*>(g_serializedPipelines.data() + offset);
      offset += sizeof(u32);
      switch (type) {
      case ShaderType::Stream: {
        if (size != sizeof(stream::PipelineConfig)) {
          break;
        }
        const auto config = *reinterpret_cast<const stream::PipelineConfig*>(g_serializedPipelines.data() + offset);
        if (config.version != gx::GXPipelineConfigVersion) {
          break;
        }
        find_pipeline(
            type, config, [=]() { return stream::create_pipeline(g_state.stream, config); }, false);
      } break;
      case ShaderType::Model: {
        if (size != sizeof(model::PipelineConfig)) {
          break;
        }
        const auto config = *reinterpret_cast<const model::PipelineConfig*>(g_serializedPipelines.data() + offset);
        if (config.version != gx::GXPipelineConfigVersion) {
          break;
        }
        find_pipeline(
            type, config, [=]() { return model::create_pipeline(g_state.model, config); }, false);
      } break;
      default:
        Log.report(LOG_WARNING, FMT_STRING("Unknown pipeline type {}"), static_cast<int>(type));
        break;
      }
      offset += size;
    }
  }
}

void shutdown() {
  if (g_hasPipelineThread) {
    g_pipelineThreadEnd = true;
    g_pipelineCv.notify_all();
    g_pipelineThread.join();
  }

  {
    // Write serialized pipelines to file
    const auto path = std::string{g_config.configPath} + "pipeline_cache.bin";
    std::ofstream file(path, std::ios::out | std::ios::trunc | std::ios::binary);
    if (file) {
      file.write(reinterpret_cast<const char*>(&g_serializedPipelineCount), sizeof(g_serializedPipelineCount));
      file.write(reinterpret_cast<const char*>(g_serializedPipelines.data()), g_serializedPipelines.size());
    }
    g_serializedPipelines.clear();
    g_serializedPipelineCount = 0;
  }

  gx::shutdown();

  g_resolvedTextures.clear();
  g_textureUploads.clear();
  for (const auto& item : g_cachedBindGroups) {
    wgpuBindGroupRelease(item.second);
  }
  g_cachedBindGroups.clear();
  for (const auto& item : g_cachedSamplers) {
    wgpuSamplerRelease(item.second);
  }
  g_cachedSamplers.clear();
  for (const auto& item : g_pipelines) {
    wgpuRenderPipelineRelease(item.second);
  }
  g_pipelines.clear();
  g_queuedPipelines.clear();
  if (g_vertexBuffer != nullptr) {
    wgpuBufferDestroy(g_vertexBuffer);
    g_vertexBuffer = nullptr;
  }
  if (g_uniformBuffer != nullptr) {
    wgpuBufferDestroy(g_uniformBuffer);
    g_uniformBuffer = nullptr;
  }
  if (g_indexBuffer != nullptr) {
    wgpuBufferDestroy(g_indexBuffer);
    g_indexBuffer = nullptr;
  }
  if (g_storageBuffer != nullptr) {
    wgpuBufferDestroy(g_storageBuffer);
    g_storageBuffer = nullptr;
  }
  for (auto& item : g_stagingBuffers) {
    if (item != nullptr) {
      wgpuBufferDestroy(item);
    }
    item = nullptr;
  }
  g_renderPasses.clear();
  g_currentRenderPass = UINT32_MAX;

  g_state = {};

  queuedPipelines = 0;
  createdPipelines = 0;
}

static size_t currentStagingBuffer = 0;
static bool bufferMapped = false;
void map_staging_buffer() {
  bufferMapped = false;
  wgpuBufferMapAsync(
      g_stagingBuffers[currentStagingBuffer], WGPUMapMode_Write, 0, StagingBufferSize,
      [](WGPUBufferMapAsyncStatus status, void* userdata) {
        if (status == WGPUBufferMapAsyncStatus_DestroyedBeforeCallback) {
          return;
        } else if (status != WGPUBufferMapAsyncStatus_Success) {
          Log.report(LOG_FATAL, FMT_STRING("Buffer mapping failed: {}"), status);
          unreachable();
        }
        *static_cast<bool*>(userdata) = true;
      },
      &bufferMapped);
}

void begin_frame() {
  while (!bufferMapped) {
    wgpuDeviceTick(g_device);
  }
  size_t bufferOffset = 0;
  auto& stagingBuf = g_stagingBuffers[currentStagingBuffer];
  const auto mapBuffer = [&](ByteBuffer& buf, uint64_t size) {
    if (size <= 0) {
      return;
    }
    buf = ByteBuffer{static_cast<u8*>(wgpuBufferGetMappedRange(stagingBuf, bufferOffset, size)),
                     static_cast<size_t>(size)};
    bufferOffset += size;
  };
  mapBuffer(g_verts, VertexBufferSize);
  mapBuffer(g_uniforms, UniformBufferSize);
  mapBuffer(g_indices, IndexBufferSize);
  mapBuffer(g_storage, StorageBufferSize);
  mapBuffer(g_textureUpload, TextureUploadSize);

  g_renderPasses.emplace_back();
  g_renderPasses[0].clearColor = gx::g_gxState.clearColor;
  g_currentRenderPass = 0;
  push_command(CommandType::SetViewport,
               Command::Data{.setViewport = {g_cachedViewport.left, g_cachedViewport.top, g_cachedViewport.width,
                                             g_cachedViewport.height, g_cachedViewport.znear, g_cachedViewport.zfar}});
  push_command(CommandType::SetScissor, Command::Data{.setScissor = {g_cachedScissor.x, g_cachedScissor.y,
                                                                     g_cachedScissor.w, g_cachedScissor.h}});
}

// for imgui debug
size_t g_lastVertSize;
size_t g_lastUniformSize;
size_t g_lastIndexSize;
size_t g_lastStorageSize;

void end_frame(WGPUCommandEncoder cmd) {
  uint64_t bufferOffset = 0;
  const auto writeBuffer = [&](ByteBuffer& buf, WGPUBuffer& out, uint64_t size, std::string_view label) {
    const auto writeSize = buf.size(); // Only need to copy this many bytes
    if (writeSize > 0) {
      wgpuCommandEncoderCopyBufferToBuffer(cmd, g_stagingBuffers[currentStagingBuffer], bufferOffset, out, 0,
                                           writeSize);
      buf.clear();
    }
    bufferOffset += size;
    return writeSize;
  };
  wgpuBufferUnmap(g_stagingBuffers[currentStagingBuffer]);
  g_lastVertSize = writeBuffer(g_verts, g_vertexBuffer, VertexBufferSize, "Vertex");
  g_lastUniformSize = writeBuffer(g_uniforms, g_uniformBuffer, UniformBufferSize, "Uniform");
  g_lastIndexSize = writeBuffer(g_indices, g_indexBuffer, IndexBufferSize, "Index");
  g_lastStorageSize = writeBuffer(g_storage, g_storageBuffer, StorageBufferSize, "Storage");
  {
    // Perform texture copies
    for (const auto& item : g_textureUploads) {
      const WGPUImageCopyBuffer buf{
          .layout =
              WGPUTextureDataLayout{
                  .offset = item.layout.offset + bufferOffset,
                  .bytesPerRow = ALIGN(item.layout.bytesPerRow, 256),
                  .rowsPerImage = item.layout.rowsPerImage,
              },
          .buffer = g_stagingBuffers[currentStagingBuffer],
      };
      wgpuCommandEncoderCopyBufferToTexture(cmd, &buf, &item.tex, &item.size);
    }
    g_textureUploads.clear();
    g_textureUpload.clear();
  }
  currentStagingBuffer = (currentStagingBuffer + 1) % g_stagingBuffers.size();
  map_staging_buffer();
  g_currentRenderPass = UINT32_MAX;
}

void render(WGPUCommandEncoder cmd) {
  for (u32 i = 0; i < g_renderPasses.size(); ++i) {
    const auto& passInfo = g_renderPasses[i];
    bool finalPass = i == g_renderPasses.size() - 1;
    if (finalPass && passInfo.resolveTarget != UINT32_MAX) {
      Log.report(LOG_FATAL, FMT_STRING("Final render pass must not have resolve target"));
      unreachable();
    }
    const std::array attachments{
        WGPURenderPassColorAttachment{
            .view = webgpu::g_frameBuffer.view,
            .resolveTarget = webgpu::g_graphicsConfig.msaaSamples > 1 ? webgpu::g_frameBufferResolved.view : nullptr,
            .loadOp = passInfo.clear ? WGPULoadOp_Clear : WGPULoadOp_Load,
            .storeOp = WGPUStoreOp_Store,
            .clearColor = {NAN, NAN, NAN, NAN},
            .clearValue =
                {
                    .r = passInfo.clearColor.x(),
                    .g = passInfo.clearColor.y(),
                    .b = passInfo.clearColor.z(),
                    .a = passInfo.clearColor.w(),
                },
        },
    };
    const WGPURenderPassDepthStencilAttachment depthStencilAttachment{
        .view = webgpu::g_depthBuffer.view,
        .depthLoadOp = passInfo.clear ? WGPULoadOp_Clear : WGPULoadOp_Load,
        .depthStoreOp = WGPUStoreOp_Store,
        .clearDepth = NAN,
        .depthClearValue = 1.f,
    };
    const auto label = fmt::format(FMT_STRING("Render pass {}"), i);
    const WGPURenderPassDescriptor renderPassDescriptor{
        .label = label.c_str(),
        .colorAttachmentCount = attachments.size(),
        .colorAttachments = attachments.data(),
        .depthStencilAttachment = &depthStencilAttachment,
    };
    auto pass = wgpuCommandEncoderBeginRenderPass(cmd, &renderPassDescriptor);
    render_pass(pass, i);
    wgpuRenderPassEncoderEnd(pass);
    wgpuRenderPassEncoderRelease(pass);

    if (passInfo.resolveTarget != UINT32_MAX) {
      WGPUImageCopyTexture src{
          .origin =
              WGPUOrigin3D{
                  .x = static_cast<uint32_t>(passInfo.resolveRect.x),
                  .y = static_cast<uint32_t>(passInfo.resolveRect.y),
              },
      };
      if (webgpu::g_graphicsConfig.msaaSamples > 1) {
        src.texture = webgpu::g_frameBufferResolved.texture;
      } else {
        src.texture = webgpu::g_frameBuffer.texture;
      }
      auto& target = g_resolvedTextures[passInfo.resolveTarget];
      const WGPUImageCopyTexture dst{
          .texture = target->texture,
      };
      const WGPUExtent3D size{
          .width = static_cast<uint32_t>(passInfo.resolveRect.width),
          .height = static_cast<uint32_t>(passInfo.resolveRect.height),
          .depthOrArrayLayers = 1,
      };
      wgpuCommandEncoderCopyTextureToTexture(cmd, &src, &dst, &size);
    }
  }
  g_renderPasses.clear();
}

void render_pass(WGPURenderPassEncoder pass, u32 idx) {
  g_currentPipeline = UINTPTR_MAX;
#ifdef AURORA_GFX_DEBUG_GROUPS
  std::vector<std::string> lastDebugGroupStack;
#endif

  for (const auto& cmd : g_renderPasses[idx].commands) {
#ifdef AURORA_GFX_DEBUG_GROUPS
    {
      size_t firstDiff = lastDebugGroupStack.size();
      for (size_t i = 0; i < lastDebugGroupStack.size(); ++i) {
        if (i >= cmd.debugGroupStack.size() || cmd.debugGroupStack[i] != lastDebugGroupStack[i]) {
          firstDiff = i;
          break;
        }
      }
      for (size_t i = firstDiff; i < lastDebugGroupStack.size(); ++i) {
        wgpuRenderPassEncoderPopDebugGroup(pass);
      }
      for (size_t i = firstDiff; i < cmd.debugGroupStack.size(); ++i) {
        wgpuRenderPassEncoderPushDebugGroup(pass, cmd.debugGroupStack[i].c_str());
      }
      lastDebugGroupStack = cmd.debugGroupStack;
    }
#endif
    switch (cmd.type) {
    case CommandType::SetViewport: {
      const auto& vp = cmd.data.setViewport;
      wgpuRenderPassEncoderSetViewport(pass, vp.left, vp.top, vp.width, vp.height, vp.znear, vp.zfar);
    } break;
    case CommandType::SetScissor: {
      const auto& sc = cmd.data.setScissor;
      wgpuRenderPassEncoderSetScissorRect(pass, sc.x, sc.y, sc.w, sc.h);
    } break;
    case CommandType::Draw: {
      const auto& draw = cmd.data.draw;
      switch (draw.type) {
      case ShaderType::Stream:
        stream::render(g_state.stream, draw.stream, pass);
        break;
      case ShaderType::Model:
        model::render(g_state.model, draw.model, pass);
        break;
      }
    } break;
    }
  }

#ifdef AURORA_GFX_DEBUG_GROUPS
  for (size_t i = 0; i < lastDebugGroupStack.size(); ++i) {
    wgpuRenderPassEncoderPopDebugGroup(pass);
  }
#endif
}

bool bind_pipeline(PipelineRef ref, WGPURenderPassEncoder pass) {
  if (ref == g_currentPipeline) {
    return true;
  }
  std::lock_guard guard{g_pipelineMutex};
  const auto it = g_pipelines.find(ref);
  if (it == g_pipelines.end()) {
    return false;
  }
  wgpuRenderPassEncoderSetPipeline(pass, it->second);
  g_currentPipeline = ref;
  return true;
}

static inline Range push(ByteBuffer& target, const uint8_t* data, size_t length, size_t alignment) {
  size_t padding = 0;
  if (alignment != 0) {
    padding = alignment - length % alignment;
  }
  auto begin = target.size();
  if (length == 0) {
    length = alignment;
    target.append_zeroes(alignment);
  } else {
    target.append(data, length);
    if (padding > 0) {
      target.append_zeroes(padding);
    }
  }
  return {static_cast<uint32_t>(begin), static_cast<uint32_t>(length + padding)};
}
static inline Range map(ByteBuffer& target, size_t length, size_t alignment) {
  size_t padding = 0;
  if (alignment != 0) {
    padding = alignment - length % alignment;
  }
  if (length == 0) {
    length = alignment;
  }
  auto begin = target.size();
  target.append_zeroes(length + padding);
  return {static_cast<uint32_t>(begin), static_cast<uint32_t>(length + padding)};
}
Range push_verts(const uint8_t* data, size_t length) { return push(g_verts, data, length, 4); }
Range push_indices(const uint8_t* data, size_t length) { return push(g_indices, data, length, 4); }
Range push_uniform(const uint8_t* data, size_t length) {
  return push(g_uniforms, data, length, g_cachedLimits.limits.minUniformBufferOffsetAlignment);
}
Range push_storage(const uint8_t* data, size_t length) {
  return push(g_storage, data, length, g_cachedLimits.limits.minStorageBufferOffsetAlignment);
}
Range push_static_storage(const uint8_t* data, size_t length) {
  auto range = push(g_staticStorage, data, length, g_cachedLimits.limits.minStorageBufferOffsetAlignment);
  range.isStatic = true;
  return range;
}
Range push_texture_data(const uint8_t* data, size_t length, u32 bytesPerRow, u32 rowsPerImage) {
  // For CopyBufferToTexture, we need an alignment of 256 per row (see Dawn kTextureBytesPerRowAlignment)
  const auto copyBytesPerRow = ALIGN(bytesPerRow, 256);
  const auto range = map(g_textureUpload, copyBytesPerRow * rowsPerImage, 0);
  u8* dst = g_textureUpload.data() + range.offset;
  for (u32 i = 0; i < rowsPerImage; ++i) {
    memcpy(dst, data, bytesPerRow);
    data += bytesPerRow;
    dst += copyBytesPerRow;
  }
  return range;
}
std::pair<ByteBuffer, Range> map_verts(size_t length) {
  const auto range = map(g_verts, length, 4);
  return {ByteBuffer{g_verts.data() + range.offset, range.size}, range};
}
std::pair<ByteBuffer, Range> map_indices(size_t length) {
  const auto range = map(g_indices, length, 4);
  return {ByteBuffer{g_indices.data() + range.offset, range.size}, range};
}
std::pair<ByteBuffer, Range> map_uniform(size_t length) {
  const auto range = map(g_uniforms, length, g_cachedLimits.limits.minUniformBufferOffsetAlignment);
  return {ByteBuffer{g_uniforms.data() + range.offset, range.size}, range};
}
std::pair<ByteBuffer, Range> map_storage(size_t length) {
  const auto range = map(g_storage, length, g_cachedLimits.limits.minStorageBufferOffsetAlignment);
  return {ByteBuffer{g_storage.data() + range.offset, range.size}, range};
}

BindGroupRef bind_group_ref(const WGPUBindGroupDescriptor& descriptor) {
  const auto id = xxh3_hash(descriptor);
  if (!g_cachedBindGroups.contains(id)) {
    g_cachedBindGroups.try_emplace(id, wgpuDeviceCreateBindGroup(g_device, &descriptor));
  }
  return id;
}
WGPUBindGroup find_bind_group(BindGroupRef id) {
  const auto it = g_cachedBindGroups.find(id);
  if (it == g_cachedBindGroups.end()) {
    Log.report(LOG_FATAL, FMT_STRING("get_bind_group: failed to locate {}"), id);
    unreachable();
  }
  return it->second;
}

WGPUSampler sampler_ref(const WGPUSamplerDescriptor& descriptor) {
  const auto id = xxh3_hash(descriptor);
  auto it = g_cachedSamplers.find(id);
  if (it == g_cachedSamplers.end()) {
    it = g_cachedSamplers.try_emplace(id, wgpuDeviceCreateSampler(g_device, &descriptor)).first;
  }
  return it->second;
}

uint32_t align_uniform(uint32_t value) { return ALIGN(value, g_cachedLimits.limits.minUniformBufferOffsetAlignment); }

void push_debug_group(const char* label) noexcept {
#ifdef AURORA_GFX_DEBUG_GROUPS
  g_debugGroupStack.emplace_back(label);
#endif
}
void pop_debug_group() noexcept {
#ifdef AURORA_GFX_DEBUG_GROUPS
  g_debugGroupStack.pop_back();
#endif
}
} // namespace aurora::gfx
