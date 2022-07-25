#pragma once

#include <dawn/native/DawnNative.h>
#include <webgpu/webgpu.h>

struct SDL_Window;

namespace aurora::webgpu::utils {

class BackendBinding {
public:
  virtual ~BackendBinding() = default;

  virtual uint64_t GetSwapChainImplementation() = 0;
  virtual WGPUTextureFormat GetPreferredSwapChainTextureFormat() = 0;

protected:
  BackendBinding(SDL_Window* window, WGPUDevice device);

  SDL_Window* m_window = nullptr;
  WGPUDevice m_device = nullptr;
};

bool DiscoverAdapter(dawn::native::Instance* instance, SDL_Window* window, WGPUBackendType type);
BackendBinding* CreateBinding(WGPUBackendType type, SDL_Window* window, WGPUDevice device);

} // namespace aurora::webgpu::utils
