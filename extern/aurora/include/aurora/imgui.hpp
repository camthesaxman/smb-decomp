#pragma once

#include "common.hpp"

#include <imgui.h>

namespace aurora::imgui {
ImTextureID add_texture(u32 width, u32 height, ArrayRef<u8> data) noexcept;
} // namespace aurora::imgui
