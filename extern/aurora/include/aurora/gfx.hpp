#pragma once

#include "common.hpp"

#define TARGET_PC
#include "../../include/dolphin/gx.h"

#include <bit>
#include <cstdint>
#include <utility>
#include <memory>

namespace metaforce {
enum class ETexelFormat {
  Invalid = -1,
  I4 = 0,
  I8 = 1,
  IA4 = 2,
  IA8 = 3,
  C4 = 4,
  C8 = 5,
  C14X2 = 6,
  RGB565 = 7,
  RGB5A3 = 8,
  RGBA8 = 9,
  CMPR = 10,
  // Metaforce addition: non-converting formats
  RGBA8PC = 11,
  R8PC = 12,
};

enum class EStreamFlagBits : u8 {
  fHasNormal = 0x1,
  fHasColor = 0x2,
  fHasTexture = 0x4,
};
using EStreamFlags = Flags<EStreamFlagBits>;
} // namespace metaforce

namespace aurora::gfx {
struct TextureRef;
using TextureHandle = std::shared_ptr<TextureRef>;

// TODO this is a bad place for this...
extern std::vector<TextureHandle> g_resolvedTextures;

struct ClipRect {
  int32_t x;
  int32_t y;
  int32_t width;
  int32_t height;
};

struct Light {
  Vec4<float> pos{0.f, 0.f, 0.f};
  Vec4<float> dir{0.f, 0.f, -1.f};
  Vec4<float> color{0.f, 0.f, 0.f, 1.f};
  Vec4<float> cosAtt{1.f, 0.f, 0.f};
  Vec4<float> distAtt{1.f, 0.f, 0.f};

  bool operator==(const Light& rhs) const {
    return pos == rhs.pos && dir == rhs.dir && color == rhs.color && cosAtt == rhs.cosAtt && distAtt == rhs.distAtt;
  }
};

#ifndef NDEBUG
#define AURORA_GFX_DEBUG_GROUPS
#endif
void push_debug_group(zstring_view label) noexcept;
void pop_debug_group() noexcept;
struct ScopedDebugGroup {
  inline ScopedDebugGroup(zstring_view label) noexcept { push_debug_group(label); }
  inline ~ScopedDebugGroup() noexcept { pop_debug_group(); }
};

void set_viewport(float left, float top, float width, float height, float znear, float zfar) noexcept;
void set_scissor(u32 x, u32 y, u32 w, u32 h) noexcept;

void resolve_color(const ClipRect& rect, u32 bindIdx, GXTexFmt fmt, bool clear_depth) noexcept;
void resolve_depth(const ClipRect& rect, u32 bindIdx, GXTexFmt fmt) noexcept;

void queue_movie_player(const TextureHandle& tex_y, const TextureHandle& tex_u, const TextureHandle& tex_v, float h_pad,
                        float v_pad) noexcept;

TextureHandle new_static_texture_2d(u32 width, u32 height, u32 mips, GXTexFmt format,
                                    ArrayRef<u8> data, zstring_view label) noexcept;
TextureHandle new_dynamic_texture_2d(u32 width, u32 height, u32 mips, GXTexFmt format,
                                     zstring_view label) noexcept;
TextureHandle new_render_texture(u32 width, u32 height, GXTexFmt fmt, zstring_view label) noexcept;
void write_texture(const TextureRef& handle, ArrayRef<u8> data) noexcept;
} // namespace aurora::gfx
