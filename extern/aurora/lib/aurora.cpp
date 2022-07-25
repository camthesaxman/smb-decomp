#include <aurora/aurora.h>

#include "internal.hpp"
#include "gfx/common.hpp"
#include "gfx/gx.hpp"
#include "webgpu/gpu.hpp"
#include "input.hpp"
#include "imgui.hpp"
#include "window.hpp"

#include <algorithm>
#include <imgui.h>
#include <magic_enum.hpp>
#include <SDL_filesystem.h>

namespace aurora {
static Module Log("aurora");

AuroraConfig g_config;

// GPU
using webgpu::g_device;
using webgpu::g_frameBuffer;
using webgpu::g_queue;
using webgpu::g_swapChain;

constexpr std::array PreferredBackendOrder{
#ifdef DAWN_ENABLE_BACKEND_D3D12
//    BACKEND_D3D12,
#endif
#ifdef DAWN_ENABLE_BACKEND_METAL
    BACKEND_METAL,
#endif
#ifdef DAWN_ENABLE_BACKEND_VULKAN
    BACKEND_VULKAN,
#endif
#ifdef DAWN_ENABLE_BACKEND_DESKTOP_GL
    BACKEND_OPENGL,
#endif
#ifdef DAWN_ENABLE_BACKEND_OPENGLES
    BACKEND_OPENGLES,
#endif
#ifdef DAWN_ENABLE_BACKEND_NULL
    BACKEND_NULL,
#endif
};

static bool g_initialFrame = false;

static AuroraInfo initialize(int argc, char* argv[], const AuroraConfig& config) noexcept {
  g_config = config;
  if (g_config.appName == nullptr) {
    g_config.appName = "Aurora";
  }
  if (g_config.configPath == nullptr) {
    g_config.configPath = SDL_GetPrefPath(nullptr, g_config.appName);
  }
  if (g_config.msaa == 0) {
    g_config.msaa = 1;
  }
  if (g_config.maxTextureAnisotropy == 0) {
    g_config.maxTextureAnisotropy = 16;
  }
  window::initialize();

  /* Attempt to create a window using the calling application's desired backend */
  AuroraBackend selectedBackend = config.desiredBackend;
  bool windowCreated = false;
  if (selectedBackend != BACKEND_AUTO && window::create_window(selectedBackend)) {
    if (webgpu::initialize(selectedBackend)) {
      windowCreated = true;
    } else {
      window::destroy_window();
    }
  }

  if (!windowCreated) {
    for (const auto backendType : PreferredBackendOrder) {
      selectedBackend = backendType;
      if (!window::create_window(selectedBackend)) {
        continue;
      }
      if (webgpu::initialize(selectedBackend)) {
        windowCreated = true;
        break;
      } else {
        window::destroy_window();
      }
    }
  }

  if (!windowCreated) {
    Log.report(LOG_FATAL, FMT_STRING("Error creating window: {}"), SDL_GetError());
    unreachable();
  }

  // Initialize SDL_Renderer for ImGui when we can't use a Dawn backend
  if (webgpu::g_backendType == WGPUBackendType_Null) {
    if (!window::create_renderer()) {
      Log.report(LOG_FATAL, FMT_STRING("Failed to initialize SDL renderer: {}"), SDL_GetError());
      unreachable();
    }
  }

  window::show_window();
  gfx::initialize();

  imgui::create_context();
  const auto size = window::get_window_size();
  Log.report(LOG_INFO, FMT_STRING("Using framebuffer size {}x{} scale {}"), size.fb_width, size.fb_height, size.scale);
  if (g_config.imGuiInitCallback != nullptr) {
    g_config.imGuiInitCallback(&size);
  }
  imgui::initialize();

  if (aurora_begin_frame()) {
    g_initialFrame = true;
  }
  return {
      .backend = selectedBackend,
      .configPath = g_config.configPath,
      .windowSize = size,
  };
}

static WGPUTextureView g_currentView = nullptr;

static void shutdown() noexcept {
  if (g_currentView != nullptr) {
    wgpuTextureViewRelease(g_currentView);
    g_currentView = nullptr;
  }
  imgui::shutdown();
  gfx::shutdown();
  webgpu::shutdown();
  window::shutdown();
}

static const AuroraEvent* update() noexcept {
  if (g_initialFrame) {
    aurora_end_frame();
    g_initialFrame = false;
  }
  const auto* events = window::poll_events();
  imgui::new_frame(window::get_window_size());
  return events;
}

static bool begin_frame() noexcept {
  g_currentView = wgpuSwapChainGetCurrentTextureView(g_swapChain);
  if (!g_currentView) {
    ImGui::EndFrame();
    // Force swapchain recreation
    const auto size = window::get_window_size();
    webgpu::resize_swapchain(size.fb_width, size.fb_height, true);
    return false;
  }
  gfx::begin_frame();
  return true;
}

static void end_frame() noexcept {
  const auto encoderDescriptor = WGPUCommandEncoderDescriptor{
      .label = "Redraw encoder",
  };
  auto encoder = wgpuDeviceCreateCommandEncoder(g_device, &encoderDescriptor);
  gfx::end_frame(encoder);
  gfx::render(encoder);
  {
    const std::array attachments{
        WGPURenderPassColorAttachment{
            .view = g_currentView,
            .loadOp = WGPULoadOp_Clear,
            .storeOp = WGPUStoreOp_Store,
        },
    };
    const WGPURenderPassDescriptor renderPassDescriptor{
        .label = "Post render pass",
        .colorAttachmentCount = attachments.size(),
        .colorAttachments = attachments.data(),
    };
    auto pass = wgpuCommandEncoderBeginRenderPass(encoder, &renderPassDescriptor);
    // Copy EFB -> XFB (swapchain)
    wgpuRenderPassEncoderSetPipeline(pass, webgpu::g_CopyPipeline);
    wgpuRenderPassEncoderSetBindGroup(pass, 0, webgpu::g_CopyBindGroup, 0, nullptr);
    wgpuRenderPassEncoderDraw(pass, 3, 1, 0, 0);
    if (!g_initialFrame) {
      // Render ImGui
      imgui::render(pass);
    }
    wgpuRenderPassEncoderEnd(pass);
    wgpuRenderPassEncoderRelease(pass);
  }
  const WGPUCommandBufferDescriptor cmdBufDescriptor{.label = "Redraw command buffer"};
  const auto buffer = wgpuCommandEncoderFinish(encoder, &cmdBufDescriptor);
  wgpuQueueSubmit(g_queue, 1, &buffer);
  wgpuCommandBufferRelease(buffer);
  wgpuCommandEncoderRelease(encoder);
  wgpuSwapChainPresent(g_swapChain);
  wgpuTextureViewRelease(g_currentView);
  g_currentView = nullptr;
  if (!g_initialFrame) {
    ImGui::EndFrame();
  }
}
} // namespace aurora

// C API bindings
AuroraInfo aurora_initialize(int argc, char* argv[], const AuroraConfig* config) {
  return aurora::initialize(argc, argv, *config);
}
void aurora_shutdown() { aurora::shutdown(); }
const AuroraEvent* aurora_update() { return aurora::update(); }
bool aurora_begin_frame() { return aurora::begin_frame(); }
void aurora_end_frame() { aurora::end_frame(); }
