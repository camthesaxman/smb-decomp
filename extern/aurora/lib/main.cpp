#include <aurora/aurora.hpp>

extern "C" {
void gc_main();
void gc_mainloop();
}

struct Application : aurora::AppDelegate {
  void onAppLaunched() noexcept override { gc_main(); }
  bool onAppIdle(float dt) noexcept override {
    return true;
  }
  void onAppDraw() noexcept override { gc_mainloop(); }
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
