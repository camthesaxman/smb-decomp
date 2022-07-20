#include "stream/shader.hpp"

#include "../gpu.hpp"
#include "common.hpp"
#include "gx.hpp"
#include "aurora/log.hpp"

#include <optional>
#include <algorithm>

static logwrapper::Module Log("aurora::gfx::stream");

using aurora::gfx::gx::g_gxState;

#ifndef NDEBUG
static inline GXAttr next_attr(size_t begin) {
  auto iter = std::find_if(g_gxState.vtxDesc.begin() + begin, g_gxState.vtxDesc.end(),
                           [](const auto type) { return type != GX_NONE; });
  if (begin > 0 && iter == g_gxState.vtxDesc.end()) {
    // wrap around
    iter = std::find_if(g_gxState.vtxDesc.begin(), g_gxState.vtxDesc.end(),
                        [](const auto type) { return type != GX_NONE; });
  }
  return GXAttr(iter - g_gxState.vtxDesc.begin());
}
#endif

struct SStreamState {
  GXPrimitive primitive;
  u16 vertexCount = 0;
  aurora::ByteBuffer vertexBuffer;
  std::vector<u16> indices;
#ifndef NDEBUG
  GXAttr nextAttr;
#endif

  explicit SStreamState(GXPrimitive primitive, u16 numVerts, u16 vertexSize) noexcept : primitive(primitive) {
    vertexBuffer.reserve_extra(size_t(numVerts) * vertexSize);
    if (numVerts > 3 && (primitive == GX_TRIANGLEFAN || primitive == GX_TRIANGLESTRIP)) {
      indices.reserve((u32(numVerts) - 3) * 3 + 3);
    } else if (numVerts > 4 && primitive == GX_QUADS) {
      indices.reserve(u32(numVerts) / 4 * 6);
    } else {
      indices.reserve(numVerts);
    }
#ifndef NDEBUG
    nextAttr = next_attr(0);
#endif
  }
};
static std::optional<SStreamState> sStreamState;

void GXBegin(GXPrimitive primitive, GXVtxFmt vtxFmt, u16 nVerts) {
#ifndef NDEBUG
  if (sStreamState) {
    Log.report(logwrapper::Fatal, FMT_STRING("Stream began twice!"));
    unreachable();
  }
#endif
  uint16_t vertexSize = 0;
  for (GXAttr attr{}; const auto type : g_gxState.vtxDesc) {
    if (type == GX_DIRECT) {
      if (attr == GX_VA_POS || attr == GX_VA_NRM) {
        vertexSize += 12;
      } else if (attr == GX_VA_CLR0 || attr == GX_VA_CLR1) {
        vertexSize += 16;
      } else if (attr >= GX_VA_TEX0 && attr <= GX_VA_TEX7) {
        vertexSize += 8;
      } else {
        Log.report(logwrapper::Fatal, FMT_STRING("don't know how to handle attr {}"), attr);
        unreachable();
      }
    } else if (type == GX_INDEX8 || type == GX_INDEX16) {
      vertexSize += 2;
    }
    attr = GXAttr(attr + 1);
  }
  if (vertexSize == 0) {
    Log.report(logwrapper::Fatal, FMT_STRING("no vtx attributes enabled?"));
    unreachable();
  }
  sStreamState.emplace(primitive, nVerts, vertexSize);
}
static inline void check_attr_order(GXAttr attr) noexcept {
#ifndef NDEBUG
  if (!sStreamState) {
    Log.report(logwrapper::Fatal, FMT_STRING("Stream not started!"));
    unreachable();
  }
  if (sStreamState->nextAttr != attr) {
    Log.report(logwrapper::Fatal, FMT_STRING("bad attribute order: {}, expected {}"), attr, sStreamState->nextAttr);
    unreachable();
  }
  sStreamState->nextAttr = next_attr(attr + 1);
#endif
}
void GXPosition3f32(float x, float y, float z) {
  check_attr_order(GX_VA_POS);
  auto& state = *sStreamState;
  state.vertexBuffer.append(&x, sizeof(float));
  state.vertexBuffer.append(&y, sizeof(float));
  state.vertexBuffer.append(&z, sizeof(float));
  if (state.primitive == GX_TRIANGLES || state.vertexCount < 3) {
    // pass
  } else if (state.primitive == GX_TRIANGLEFAN) {
    state.indices.push_back(0);
    state.indices.push_back(state.vertexCount - 1);
  } else if (state.primitive == GX_TRIANGLESTRIP) {
    if ((state.vertexCount & 1) == 0) {
      state.indices.push_back(state.vertexCount - 2);
      state.indices.push_back(state.vertexCount - 1);
    } else {
      state.indices.push_back(state.vertexCount - 1);
      state.indices.push_back(state.vertexCount - 2);
    }
  } else if (state.primitive == GX_QUADS) {
    if ((state.vertexCount & 3) == 3) {
      state.indices.push_back(state.vertexCount - 3);
      state.indices.push_back(state.vertexCount - 1);
    }
  }
  state.indices.push_back(state.vertexCount);
  ++state.vertexCount;
}
void GXPosition3s16(s16 x, s16 y, s16 z) {
  // TODO frac
  GXPosition3f32(x, y, z);
}
void GXNormal3f32(float x, float y, float z) {
  check_attr_order(GX_VA_NRM);
  sStreamState->vertexBuffer.append(&x, 4);
  sStreamState->vertexBuffer.append(&y, 4);
  sStreamState->vertexBuffer.append(&z, 4);
}
void GXColor4f32(float r, float g, float b, float a) {
  check_attr_order(GX_VA_CLR0);
  sStreamState->vertexBuffer.append(&r, 4);
  sStreamState->vertexBuffer.append(&g, 4);
  sStreamState->vertexBuffer.append(&b, 4);
  sStreamState->vertexBuffer.append(&a, 4);
}
void GXColor4u8(u8 r, u8 g, u8 b, u8 a) {
  GXColor4f32(static_cast<float>(r) / 255.f, static_cast<float>(g) / 255.f, static_cast<float>(b) / 255.f,
              static_cast<float>(a) / 255.f);
}
void GXTexCoord2f32(float u, float v) {
  check_attr_order(GX_VA_TEX0);
  sStreamState->vertexBuffer.append(&u, 4);
  sStreamState->vertexBuffer.append(&v, 4);
}
void GXTexCoord2s16(s16 s, s16 t) {
  // TODO frac
  GXTexCoord2f32(s, t);
}
void GXPosition1x16(u16 idx) {
  check_attr_order(GX_VA_POS);
  // keep aligned
  if (sStreamState->vertexBuffer.size() % 4 != 0) {
    sStreamState->vertexBuffer.append_zeroes(4 - (sStreamState->vertexBuffer.size() % 4));
  }
  sStreamState->vertexBuffer.append(&idx, 2);
}
void GXEnd() {
  if (sStreamState->vertexCount == 0) {
    sStreamState.reset();
    return;
  }
  const auto vertRange = aurora::gfx::push_verts(sStreamState->vertexBuffer.data(), sStreamState->vertexBuffer.size());
  const auto indexRange = aurora::gfx::push_indices(aurora::ArrayRef{sStreamState->indices});
  aurora::gfx::stream::PipelineConfig config{};
  populate_pipeline_config(config, GX_TRIANGLES);
  const auto info = aurora::gfx::gx::build_shader_info(config.shaderConfig);
  const auto pipeline = aurora::gfx::pipeline_ref(config);
  aurora::gfx::push_draw_command(aurora::gfx::stream::DrawData{
      .pipeline = pipeline,
      .vertRange = vertRange,
      .uniformRange = build_uniform(info),
      .indexRange = indexRange,
      .indexCount = static_cast<uint32_t>(sStreamState->indices.size()),
      .bindGroups = aurora::gfx::gx::build_bind_groups(info, config.shaderConfig, {}),
      .dstAlpha = g_gxState.dstAlpha,
  });
  sStreamState.reset();
}
