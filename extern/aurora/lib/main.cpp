#include <aurora/aurora.hpp>
#include <aurora/imgui.hpp>
#include <aurora/log.hpp>

#include <atomic>

using namespace std::string_view_literals;

extern "C" {
void gc_main();
void gc_mainloop();
}

namespace aurora::gfx {
extern std::atomic_uint32_t queuedPipelines;
extern std::atomic_uint32_t createdPipelines;

extern size_t g_lastVertSize;
extern size_t g_lastUniformSize;
extern size_t g_lastIndexSize;
extern size_t g_lastStorageSize;
} // namespace aurora::gfx

static void SetOverlayWindowLocation(int corner) {
  const ImGuiViewport* viewport = ImGui::GetMainViewport();
  ImVec2 workPos = viewport->WorkPos; // Use work area to avoid menu-bar/task-bar, if any!
  ImVec2 workSize = viewport->WorkSize;
  ImVec2 windowPos;
  ImVec2 windowPosPivot;
  constexpr float padding = 10.0f;
  windowPos.x = (corner & 1) != 0 ? (workPos.x + workSize.x - padding) : (workPos.x + padding);
  windowPos.y = (corner & 2) != 0 ? (workPos.y + workSize.y - padding) : (workPos.y + padding);
  windowPosPivot.x = (corner & 1) != 0 ? 1.0f : 0.0f;
  windowPosPivot.y = (corner & 2) != 0 ? 1.0f : 0.0f;
  ImGui::SetNextWindowPos(windowPos, ImGuiCond_Always, windowPosPivot);
}

static void ImGuiStringViewText(std::string_view text) {
  // begin()/end() do not work on MSVC
  ImGui::TextUnformatted(text.data(), text.data() + text.size());
}

static std::string BytesToString(size_t bytes) {
  constexpr std::array suffixes{"B"sv, "KB"sv, "MB"sv, "GB"sv, "TB"sv, "PB"sv, "EB"sv};
  u32 s = 0;
  auto count = static_cast<double>(bytes);
  while (count >= 1024.0 && s < 7) {
    s++;
    count /= 1024.0;
  }
  if (count - floor(count) == 0.0) {
    return fmt::format(FMT_STRING("{}{}"), static_cast<size_t>(count), suffixes[s]);
  }
  return fmt::format(FMT_STRING("{:.1f}{}"), count, suffixes[s]);
}

struct Application : aurora::AppDelegate {
  bool m_frameRate = true;
  bool m_pipelineInfo = true;
  int m_debugOverlayCorner = 0; // top-left

  void onAppLaunched() noexcept override { gc_main(); }
  bool onAppIdle(float dt) noexcept override { return true; }
  void onAppDraw() noexcept override {
    gc_mainloop();

    ImGuiIO& io = ImGui::GetIO();
    ImGuiWindowFlags windowFlags = ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_AlwaysAutoResize |
                                   ImGuiWindowFlags_NoFocusOnAppearing | ImGuiWindowFlags_NoNav;
    if (m_debugOverlayCorner != -1) {
      SetOverlayWindowLocation(m_debugOverlayCorner);
      windowFlags |= ImGuiWindowFlags_NoMove;
    }
    ImGui::SetNextWindowBgAlpha(0.65f);
    if (ImGui::Begin("Debug Overlay", nullptr, windowFlags)) {
      bool hasPrevious = false;

      if (m_frameRate) {
        if (hasPrevious) {
          ImGui::Separator();
        }
        hasPrevious = true;

        ImGuiStringViewText(fmt::format(FMT_STRING("FPS: {:.1f}\n"), io.Framerate));
      }
      if (m_pipelineInfo) {
        if (hasPrevious) {
          ImGui::Separator();
        }
        hasPrevious = true;

        ImGuiStringViewText(fmt::format(FMT_STRING("Queued pipelines: {}\n"), aurora::gfx::queuedPipelines));
        ImGuiStringViewText(fmt::format(FMT_STRING("Done pipelines:   {}\n"), aurora::gfx::createdPipelines));
        ImGuiStringViewText(
            fmt::format(FMT_STRING("Vertex size:      {}\n"), BytesToString(aurora::gfx::g_lastVertSize)));
        ImGuiStringViewText(
            fmt::format(FMT_STRING("Uniform size:     {}\n"), BytesToString(aurora::gfx::g_lastUniformSize)));
        ImGuiStringViewText(
            fmt::format(FMT_STRING("Index size:       {}\n"), BytesToString(aurora::gfx::g_lastIndexSize)));
        ImGuiStringViewText(
            fmt::format(FMT_STRING("Storage size:     {}\n"), BytesToString(aurora::gfx::g_lastStorageSize)));
        ImGuiStringViewText(fmt::format(FMT_STRING("Total:            {}\n"),
                                        BytesToString(aurora::gfx::g_lastVertSize + aurora::gfx::g_lastUniformSize +
                                                      aurora::gfx::g_lastIndexSize + aurora::gfx::g_lastStorageSize)));
      }
    }
    ImGui::End();
  }
  void onAppPostDraw() noexcept override {}
  void onAppWindowResized(const aurora::WindowSize& size) noexcept override {}
  void onAppWindowMoved(int32_t x, int32_t y) noexcept override {}
  void onAppDisplayScaleChanged(float scale) noexcept override {}
  void onAppExiting() noexcept override {}

  // ImGui
  void onImGuiInit(float scale) noexcept override {}
  void onImGuiAddTextures() noexcept override {}

  // Input
  void onCharKeyDown(u8 charCode, aurora::ModifierKey mods, bool isRepeat) noexcept override {}
  void onCharKeyUp(u8 charCode, aurora::ModifierKey mods) noexcept override {}
  void onSpecialKeyDown(aurora::SpecialKey key, aurora::ModifierKey mods, bool isRepeat) noexcept override {}
  void onSpecialKeyUp(aurora::SpecialKey key, aurora::ModifierKey mods) noexcept override {}
  void onModifierKeyDown(aurora::ModifierKey mods, bool isRepeat) noexcept override {}
  void onModifierKeyUp(aurora::ModifierKey mods) noexcept override {}
  void onTextInput(const std::string& input) noexcept override {}
  void onMouseMove(int32_t x, int32_t y, int32_t xrel, int32_t yrel, aurora::MouseButton state) noexcept override {}
  void onMouseButtonDown(int32_t x, int32_t y, aurora::MouseButton button, int32_t clicks) noexcept override {}
  void onMouseButtonUp(int32_t x, int32_t y, aurora::MouseButton button) noexcept override {}

  // Controller
  void onControllerAdded(u32 which) noexcept override {}
  void onControllerRemoved(u32 which) noexcept override {}
  void onControllerButton(u32 which, aurora::ControllerButton button, bool pressed) noexcept override {}
  void onControllerAxis(u32 which, aurora::ControllerAxis axis, int16_t value) noexcept override {}
};

int main(int argc, char** argv) {
  auto app = std::make_unique<Application>();
  aurora::app_run(std::move(app), {}, argc, argv, "");
}
