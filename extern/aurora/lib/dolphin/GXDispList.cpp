#include "gx.hpp"

#include "../gfx/model/shader.hpp"

void GXBeginDisplayList(void* list, u32 size) {
  // TODO
}

u32 GXEndDisplayList() {
  // TODO
  return 0;
}

void GXCallDisplayList(void* data, u32 nbytes) {
  aurora::gfx::model::queue_surface(static_cast<const u8*>(data), nbytes);
}
