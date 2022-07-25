#include "gx.hpp"

#include <optional>

void GXSetVtxDesc(GXAttr attr, GXAttrType type) { update_gx_state(g_gxState.vtxDesc[attr], type); }

void GXSetVtxDescv(GXVtxDescList* list) {
  g_gxState.vtxDesc.fill({});
  while (list->attr != GX_VA_NULL) {
    update_gx_state(g_gxState.vtxDesc[list->attr], list->type);
    ++list;
  }
}

void GXClearVtxDesc() { g_gxState.vtxDesc.fill({}); }

void GXSetVtxAttrFmt(GXVtxFmt vtxfmt, GXAttr attr, GXCompCnt cnt, GXCompType type, u8 frac) {
  if (vtxfmt < GX_VTXFMT0 || vtxfmt >= GX_MAX_VTXFMT) {
    Log.report(LOG_FATAL, FMT_STRING("invalid vtxfmt {}"), vtxfmt);
    unreachable();
  }
  if (attr < GX_VA_PNMTXIDX || attr >= GX_VA_MAX_ATTR) {
    Log.report(LOG_FATAL, FMT_STRING("invalid attr {}"), attr);
    unreachable();
  }
  auto& fmt = g_gxState.vtxFmts[vtxfmt].attrs[attr];
  update_gx_state(fmt.cnt, cnt);
  update_gx_state(fmt.type, type);
  update_gx_state(fmt.frac, frac);
}

// TODO GXSetVtxAttrFmtv

static const std::vector<aurora::Vec4<f32>>* vtxData;
static const std::vector<aurora::Vec4<f32>>* nrmData;
static const std::vector<aurora::Vec2<f32>>* tc0Data;
static const std::vector<aurora::Vec2<f32>>* tc1Data;
static std::optional<aurora::gfx::Range> cachedVtxRange;
static std::optional<aurora::gfx::Range> cachedNrmRange;
static std::optional<aurora::gfx::Range> cachedTc1Range;
static std::optional<aurora::gfx::Range> cachedTc0Range;

template <typename Vec>
static inline void cache_array(const void* data, Vec*& outPtr, std::optional<aurora::gfx::Range>& outRange, u8 stride) {
  Vec* vecPtr = static_cast<Vec*>(data);
  outPtr = vecPtr;
  outRange.reset();
}

void GXSetArray(GXAttr attr, void* data, u8 stride) {
  switch (attr) {
  case GX_VA_POS:
    cache_array(data, vtxData, cachedVtxRange, stride);
    break;
  case GX_VA_NRM:
    cache_array(data, nrmData, cachedNrmRange, stride);
    break;
  case GX_VA_TEX0:
    cache_array(data, tc0Data, cachedTc1Range, stride);
    break;
  case GX_VA_TEX1:
    cache_array(data, tc1Data, cachedTc0Range, stride);
    break;
  default:
    Log.report(LOG_FATAL, FMT_STRING("GXSetArray: invalid attr {}"), attr);
    unreachable();
  }
}

// TODO move GXBegin, GXEnd here

void GXSetTexCoordGen2(GXTexCoordID dst, GXTexGenType type, GXTexGenSrc src, u32 mtx, GXBool normalize, u32 postMtx) {
  if (dst < GX_TEXCOORD0 || dst > GX_TEXCOORD7) {
    Log.report(LOG_FATAL, FMT_STRING("invalid tex coord {}"), dst);
    unreachable();
  }
  update_gx_state(g_gxState.tcgs[dst],
                  {type, src, static_cast<GXTexMtx>(mtx), static_cast<GXPTTexMtx>(postMtx), normalize});
}

void GXSetNumTexGens(u8 num) { update_gx_state(g_gxState.numTexGens, num); }

// TODO GXInvalidateVtxCache

void GXSetLineWidth(u8 width, GXTexOffset offs) {
  // TODO
}

// TODO GXSetPointSize
// TODO GXEnableTexOffsets
