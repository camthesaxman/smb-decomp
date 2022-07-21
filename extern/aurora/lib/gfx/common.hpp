#pragma once
#include <aurora/gfx.hpp>

#include <type_traits>
#include <utility>
#include <cstring>

#include <dawn/webgpu_cpp.h>
#include <xxhash_impl.h>

#ifndef ALIGN
#define ALIGN(x, a) (((x) + ((a)-1)) & ~((a)-1))
#endif

namespace aurora {
#if INTPTR_MAX == INT32_MAX
using HashType = XXH32_hash_t;
#else
using HashType = XXH64_hash_t;
#endif
static inline HashType xxh3_hash_s(const void* input, size_t len, HashType seed = 0) {
  return static_cast<HashType>(XXH3_64bits_withSeed(input, len, seed));
}
template <typename T>
static inline HashType xxh3_hash(const T& input, HashType seed = 0) {
  // Validate that the type has no padding bytes, which can easily cause
  // hash mismatches. This also disallows floats, but that's okay for us.
  static_assert(std::has_unique_object_representations_v<T>);
  return xxh3_hash_s(&input, sizeof(T), seed);
}

class ByteBuffer {
public:
  ByteBuffer() noexcept = default;
  explicit ByteBuffer(size_t size) noexcept
  : m_data(static_cast<u8*>(calloc(1, size))), m_length(size), m_capacity(size) {}
  explicit ByteBuffer(u8* data, size_t size) noexcept
  : m_data(data), m_length(0), m_capacity(size), m_owned(false) {}
  ~ByteBuffer() noexcept {
    if (m_data != nullptr && m_owned) {
      free(m_data);
    }
  }
  ByteBuffer(ByteBuffer&& rhs) noexcept
  : m_data(rhs.m_data), m_length(rhs.m_length), m_capacity(rhs.m_capacity), m_owned(rhs.m_owned) {
    rhs.m_data = nullptr;
    rhs.m_length = 0;
    rhs.m_capacity = 0;
    rhs.m_owned = true;
  }
  ByteBuffer& operator=(ByteBuffer&& rhs) noexcept {
    if (m_data != nullptr && m_owned) {
      free(m_data);
    }
    m_data = rhs.m_data;
    m_length = rhs.m_length;
    m_capacity = rhs.m_capacity;
    m_owned = rhs.m_owned;
    rhs.m_data = nullptr;
    rhs.m_length = 0;
    rhs.m_capacity = 0;
    rhs.m_owned = true;
    return *this;
  }
  ByteBuffer(ByteBuffer const&) = delete;
  ByteBuffer& operator=(ByteBuffer const&) = delete;

  [[nodiscard]] u8* data() noexcept { return m_data; }
  [[nodiscard]] const u8* data() const noexcept { return m_data; }
  [[nodiscard]] size_t size() const noexcept { return m_length; }
  [[nodiscard]] bool empty() const noexcept { return m_length == 0; }

  void append(const void* data, size_t size) {
    resize(m_length + size, false);
    memcpy(m_data + m_length, data, size);
    m_length += size;
  }

  void append_zeroes(size_t size) {
    resize(m_length + size, true);
    m_length += size;
  }

  void clear() {
    if (m_data != nullptr && m_owned) {
      free(m_data);
    }
    m_data = nullptr;
    m_length = 0;
    m_capacity = 0;
    m_owned = true;
  }

  void reserve_extra(size_t size) { resize(m_length + size, true); }

private:
  u8* m_data = nullptr;
  size_t m_length = 0;
  size_t m_capacity = 0;
  bool m_owned = true;

  void resize(size_t size, bool zeroed) {
    if (size == 0) {
      clear();
    } else if (m_data == nullptr) {
      if (zeroed) {
        m_data = static_cast<u8*>(calloc(1, size));
      } else {
        m_data = static_cast<u8*>(malloc(size));
      }
      m_owned = true;
    } else if (size > m_capacity) {
      if (!m_owned) {
        abort();
      }
      m_data = static_cast<u8*>(realloc(m_data, size));
      if (zeroed) {
        memset(m_data + m_capacity, 0, size - m_capacity);
      }
    } else {
      return;
    }
    m_capacity = size;
  }
};
} // namespace aurora

namespace aurora::gfx {
extern wgpu::Buffer g_vertexBuffer;
extern wgpu::Buffer g_uniformBuffer;
extern wgpu::Buffer g_indexBuffer;
extern wgpu::Buffer g_storageBuffer;
extern size_t g_staticStorageLastSize;
struct TextureUpload {
  wgpu::TextureDataLayout layout;
  wgpu::ImageCopyTexture tex;
  wgpu::Extent3D size;

  TextureUpload(wgpu::TextureDataLayout layout, wgpu::ImageCopyTexture tex, wgpu::Extent3D size) noexcept
  : layout(std::move(layout)), tex(std::move(tex)), size(std::move(size)) {}
};
extern std::vector<TextureUpload> g_textureUploads;

constexpr GXTexFmt InvalidTextureFormat = static_cast<GXTexFmt>(-1);
struct TextureRef {
  wgpu::Texture texture;
  wgpu::TextureView view;
  wgpu::Extent3D size;
  wgpu::TextureFormat format;
  u32 mipCount;
  GXTexFmt gxFormat;
  bool isRenderTexture; // :shrug: for now

  TextureRef(wgpu::Texture&& texture, wgpu::TextureView&& view, wgpu::Extent3D size, wgpu::TextureFormat format,
             u32 mipCount, GXTexFmt gxFormat, bool isRenderTexture)
  : texture(std::move(texture))
  , view(std::move(view))
  , size(size)
  , format(format)
  , mipCount(mipCount)
  , gxFormat(gxFormat)
  , isRenderTexture(isRenderTexture) {}
};

using BindGroupRef = HashType;
using PipelineRef = HashType;
using SamplerRef = HashType;
using ShaderRef = HashType;
struct Range {
  u32 offset;
  u32 size;
  bool isStatic;
};
static inline u32 storage_offset(Range range) {
  return range.isStatic ? range.offset : range.offset + g_staticStorageLastSize;
}

enum class ShaderType {
  MoviePlayer,
  Stream,
  Model,
};

void initialize();
void shutdown();

void begin_frame();
void end_frame(const wgpu::CommandEncoder& cmd);
void render(wgpu::CommandEncoder& cmd);
void render_pass(const wgpu::RenderPassEncoder& pass, u32 idx);
void map_staging_buffer();

Range push_verts(const u8* data, size_t length);
template <typename T>
static inline Range push_verts(ArrayRef<T> data) {
  return push_verts(reinterpret_cast<const u8*>(data.data()), data.size() * sizeof(T));
}
Range push_indices(const u8* data, size_t length);
template <typename T>
static inline Range push_indices(ArrayRef<T> data) {
  return push_indices(reinterpret_cast<const u8*>(data.data()), data.size() * sizeof(T));
}
Range push_uniform(const u8* data, size_t length);
template <typename T>
static inline Range push_uniform(const T& data) {
  return push_uniform(reinterpret_cast<const u8*>(&data), sizeof(T));
}
Range push_storage(const u8* data, size_t length);
template <typename T>
static inline Range push_storage(ArrayRef<T> data) {
  return push_storage(reinterpret_cast<const u8*>(data.data()), data.size() * sizeof(T));
}
template <typename T>
static inline Range push_storage(const T& data) {
  return push_storage(reinterpret_cast<const u8*>(&data), sizeof(T));
}
Range push_static_storage(const u8* data, size_t length);
template <typename T>
static inline Range push_static_storage(ArrayRef<T> data) {
  return push_static_storage(reinterpret_cast<const u8*>(data.data()), data.size() * sizeof(T));
}
template <typename T>
static inline Range push_static_storage(const T& data) {
  return push_static_storage(reinterpret_cast<const u8*>(&data), sizeof(T));
}
Range push_texture_data(const u8* data, size_t length, u32 bytesPerRow, u32 rowsPerImage);
std::pair<ByteBuffer, Range> map_verts(size_t length);
std::pair<ByteBuffer, Range> map_indices(size_t length);
std::pair<ByteBuffer, Range> map_uniform(size_t length);
std::pair<ByteBuffer, Range> map_storage(size_t length);

template <typename State>
const State& get_state();
template <typename DrawData>
void push_draw_command(DrawData data);

template <typename PipelineConfig>
PipelineRef pipeline_ref(PipelineConfig config);
bool bind_pipeline(PipelineRef ref, const wgpu::RenderPassEncoder& pass);

BindGroupRef bind_group_ref(const wgpu::BindGroupDescriptor& descriptor);
const wgpu::BindGroup& find_bind_group(BindGroupRef id);

const wgpu::Sampler& sampler_ref(const wgpu::SamplerDescriptor& descriptor);

u32 align_uniform(u32 value);
} // namespace aurora::gfx
