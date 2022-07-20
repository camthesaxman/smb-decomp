#include "gx.hpp"

#include "../gpu.hpp"
#include "common.hpp"

#include <aurora/log.hpp>
#include <absl/container/flat_hash_map.h>
#include <cfloat>
#include <cmath>

using aurora::gfx::gx::g_gxState;
static logwrapper::Module Log("aurora::gx");

template <typename T>
static inline void update_gx_state(T& val, T newVal) {
  if (val != newVal) {
    val = std::move(newVal);
    g_gxState.stateDirty = true;
  }
}
static inline aurora::Vec4<float> from_gx_color(GXColor color) {
  return {
      static_cast<float>(color.r) / 255.f,
      static_cast<float>(color.g) / 255.f,
      static_cast<float>(color.b) / 255.f,
      static_cast<float>(color.a) / 255.f,
  };
}

void GXSetNumChans(u8 num) { update_gx_state(g_gxState.numChans, num); }
void GXSetNumIndStages(u8 num) { update_gx_state(g_gxState.numIndStages, num); }
void GXSetNumTevStages(u8 num) { update_gx_state(g_gxState.numTevStages, num); }
void GXSetNumTexGens(u8 num) { update_gx_state(g_gxState.numTexGens, num); }
void GXSetTevAlphaIn(GXTevStageID stageId, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d) {
  update_gx_state(g_gxState.tevStages[stageId].alphaPass, {a, b, c, d});
}
void GXSetTevAlphaOp(GXTevStageID stageId, GXTevOp op, GXTevBias bias, GXTevScale scale, bool clamp,
                     GXTevRegID outReg) {
  update_gx_state(g_gxState.tevStages[stageId].alphaOp, {op, bias, scale, outReg, clamp});
}
void GXSetTevColorIn(GXTevStageID stageId, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d) {
  update_gx_state(g_gxState.tevStages[stageId].colorPass, {a, b, c, d});
}
void GXSetTevColorOp(GXTevStageID stageId, GXTevOp op, GXTevBias bias, GXTevScale scale, bool clamp,
                     GXTevRegID outReg) {
  update_gx_state(g_gxState.tevStages[stageId].colorOp, {op, bias, scale, outReg, clamp});
}
void GXSetTevOp(GXTevStageID id, GXTevMode mode) {
  GXTevColorArg inputColor = GX_CC_RASC;
  GXTevAlphaArg inputAlpha = GX_CA_RASA;
  if (id != GX_TEVSTAGE0) {
    inputColor = GX_CC_CPREV;
    inputAlpha = GX_CA_APREV;
  }
  switch (mode) {
  case GX_MODULATE:
    GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_TEXC, inputColor, GX_CC_ZERO);
    GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_TEXA, inputAlpha, GX_CA_ZERO);
    break;
  case GX_DECAL:
    GXSetTevColorIn(id, inputColor, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
    GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, inputAlpha);
    break;
  case GX_BLEND:
    GXSetTevColorIn(id, inputColor, GX_CC_ONE, GX_CC_TEXC, GX_CC_ZERO);
    GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_TEXA, inputAlpha, GX_CA_ZERO);
    break;
  case GX_REPLACE:
    GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
    break;
  case GX_PASSCLR:
    GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, inputColor);
    GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, inputAlpha);
    break;
  }
  GXSetTevColorOp(id, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
  GXSetTevAlphaOp(id, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}
void GXSetCullMode(GXCullMode mode) { update_gx_state(g_gxState.cullMode, mode); }
void GXSetBlendMode(GXBlendMode mode, GXBlendFactor src, GXBlendFactor dst, GXLogicOp op) {
  update_gx_state(g_gxState.blendMode, mode);
  update_gx_state(g_gxState.blendFacSrc, src);
  update_gx_state(g_gxState.blendFacDst, dst);
  update_gx_state(g_gxState.blendOp, op);
}
void GXSetZMode(bool compare_enable, GXCompare func, bool update_enable) {
  update_gx_state(g_gxState.depthCompare, compare_enable);
  update_gx_state(g_gxState.depthFunc, func);
  update_gx_state(g_gxState.depthUpdate, update_enable);
}
void GXSetTevColor(GXTevRegID id, GXColor color) {
  if (id < GX_TEVPREV || id > GX_TEVREG2) {
    Log.report(logwrapper::Fatal, FMT_STRING("bad tevreg {}"), id);
    unreachable();
  }
  update_gx_state(g_gxState.colorRegs[id], from_gx_color(color));
}
void GXSetTevKColor(GXTevKColorID id, GXColor color) {
  if (id >= GX_MAX_KCOLOR) {
    Log.report(logwrapper::Fatal, FMT_STRING("bad kcolor {}"), id);
    unreachable();
  }
  update_gx_state(g_gxState.kcolors[id], from_gx_color(color));
}
void GXSetAlphaUpdate(bool enabled) { update_gx_state(g_gxState.alphaUpdate, enabled); }
void GXSetDstAlpha(bool enabled, u8 value) {
  if (enabled) {
    update_gx_state<u32>(g_gxState.dstAlpha, value);
  } else {
    update_gx_state(g_gxState.dstAlpha, UINT32_MAX);
  }
}
void GXSetCopyClear(GXColor color, u32 depth) { update_gx_state(g_gxState.clearColor, from_gx_color(color)); }
void GXSetTevOrder(GXTevStageID id, GXTexCoordID tcid, GXTexMapID tmid, GXChannelID cid) {
  auto& stage = g_gxState.tevStages[id];
  update_gx_state(stage.texCoordId, tcid);
  update_gx_state(stage.texMapId, tmid);
  update_gx_state(stage.channelId, cid);
}
void GXSetTevKColorSel(GXTevStageID id, GXTevKColorSel sel) { update_gx_state(g_gxState.tevStages[id].kcSel, sel); }
void GXSetTevKAlphaSel(GXTevStageID id, GXTevKAlphaSel sel) { update_gx_state(g_gxState.tevStages[id].kaSel, sel); }
void GXSetChanAmbColor(GXChannelID id, GXColor color) {
  if (id < GX_COLOR0A0 || id > GX_COLOR1A1) {
    Log.report(logwrapper::Fatal, FMT_STRING("bad channel {}"), id);
    unreachable();
  }
  update_gx_state(g_gxState.colorChannelState[id - GX_COLOR0A0].ambColor, from_gx_color(color));
}
void GXSetChanMatColor(GXChannelID id, GXColor color) {
  if (id < GX_COLOR0A0 || id > GX_COLOR1A1) {
    Log.report(logwrapper::Fatal, FMT_STRING("bad channel {}"), id);
    unreachable();
  }
  update_gx_state(g_gxState.colorChannelState[id - GX_COLOR0A0].matColor, from_gx_color(color));
}
void GXSetChanCtrl(GXChannelID id, bool lightingEnabled, GXColorSrc ambSrc, GXColorSrc matSrc, u32 lightState,
                   GXDiffuseFn diffFn, GXAttnFn attnFn) {
  if (id < GX_COLOR0A0 || id > GX_COLOR1A1) {
    Log.report(logwrapper::Fatal, FMT_STRING("bad channel {}"), id);
    unreachable();
  }
  u32 idx = id - GX_COLOR0A0;
  auto& chan = g_gxState.colorChannelConfig[idx];
  update_gx_state(chan.lightingEnabled, lightingEnabled);
  update_gx_state(chan.ambSrc, ambSrc);
  update_gx_state(chan.matSrc, matSrc);
  update_gx_state(chan.diffFn, diffFn);
  update_gx_state(chan.attnFn, attnFn);
  update_gx_state(g_gxState.colorChannelState[idx].lightState, GX::LightMask{lightState});
}
void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1) {
  update_gx_state(g_gxState.alphaCompare, {comp0, ref0, op, comp1, ref1});
}
void GXSetTexCoordGen2(GXTexCoordID dst, GXTexGenType type, GXTexGenSrc src, u32 mtx, GXBool normalize, u32 postMtx) {
  if (dst < GX_TEXCOORD0 || dst > GX_TEXCOORD7) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid tex coord {}"), dst);
    unreachable();
  }
  update_gx_state(g_gxState.tcgs[dst],
                  {type, src, static_cast<GXTexMtx>(mtx), static_cast<GXPTTexMtx>(postMtx), normalize});
}
void GXLoadTexMtxImm(f32 mtx_[][4], u32 id, GXTexMtxType type) {
  if ((id < GX_TEXMTX0 || id > GX_IDENTITY) && (id < GX_PTTEXMTX0 || id > GX_PTIDENTITY)) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid tex mtx {}"), id);
    unreachable();
  }
  if (id >= GX_PTTEXMTX0) {
    if (type != GX_MTX3x4) {
      Log.report(logwrapper::Fatal, FMT_STRING("invalid pt mtx type {}"), type);
      unreachable();
    }
    const auto idx = (id - GX_PTTEXMTX0) / 3;
    const auto& mtx = *reinterpret_cast<const aurora::Mat3x4<float>*>(mtx_);
    update_gx_state<aurora::Mat4x4<float>>(g_gxState.ptTexMtxs[idx], mtx.toTransposed4x4());
  } else {
    const auto idx = (id - GX_TEXMTX0) / 3;
    switch (type) {
    case GX_MTX3x4: {
      const auto& mtx = *reinterpret_cast<const aurora::Mat3x4<float>*>(mtx_);
      update_gx_state<aurora::gfx::gx::TexMtxVariant>(g_gxState.texMtxs[idx], mtx.toTransposed4x4());
      break;
    }
    case GX_MTX2x4: {
      const auto& mtx = *reinterpret_cast<const aurora::Mat4x2<float>*>(mtx_);
      update_gx_state<aurora::gfx::gx::TexMtxVariant>(g_gxState.texMtxs[idx], mtx);
      break;
    }
    }
  }
}
void GXLoadPosMtxImm(f32 mtx_[3][4], u32 id) {
  if (id < GX_PNMTX0 || id > GX_PNMTX9) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid pn mtx {}"), id);
    unreachable();
  }
  auto& state = g_gxState.pnMtx[id / 3];
  const auto* mtx = reinterpret_cast<const aurora::Mat3x4<float>*>(mtx_);
  update_gx_state(state.pos, mtx->toTransposed4x4());
}
void GXLoadNrmMtxImm(f32 mtx_[3][4], u32 id) {
  if (id < GX_PNMTX0 || id > GX_PNMTX9) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid pn mtx {}"), id);
    unreachable();
  }
  auto& state = g_gxState.pnMtx[id / 3];
  const auto* mtx = reinterpret_cast<const aurora::Mat3x4<float>*>(mtx_);
  update_gx_state(state.nrm, mtx->toTransposed4x4());
}
void GXSetCurrentMtx(u32 id) {
  if (id < GX_PNMTX0 || id > GX_PNMTX9) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid pn mtx {}"), id);
    unreachable();
  }
  update_gx_state(g_gxState.currentPnMtx, id / 3);
}
constexpr aurora::Mat4x4<float> DepthCorrect{
    {1.f, 0.f, 0.f, 0.f},
    {0.f, 1.f, 0.f, 0.f},
    {0.f, 0.f, 0.5f, 0.5f},
    {0.f, 0.f, 0.f, 1.f},
};
void GXSetProjection(f32 mtx_[4][4], GXProjectionType type) {
  const auto& mtx = *reinterpret_cast<const aurora::Mat4x4<float>*>(mtx_);
  g_gxState.origProj = mtx;
  g_gxState.projType = type;
  if (type == GX_PERSPECTIVE) {
    update_gx_state(g_gxState.proj, DepthCorrect * mtx.transpose());
  } else {
    update_gx_state(g_gxState.proj, mtx.transpose());
  }
}
void GXSetViewportJitter(float left, float top, float width, float height, float nearZ, float farZ, u32 field) {
  aurora::gfx::set_viewport(left, top, width, height, nearZ, farZ);
}
void GXSetViewport(float left, float top, float width, float height, float nearZ, float farZ) {
  aurora::gfx::set_viewport(left, top, width, height, nearZ, farZ);
}
void GXSetScissor(u32 left, u32 top, u32 width, u32 height) { aurora::gfx::set_scissor(left, top, width, height); }
void GXSetFog(GXFogType type, float startZ, float endZ, float nearZ, float farZ, GXColor color) {
  update_gx_state(g_gxState.fog, {type, startZ, endZ, nearZ, farZ, from_gx_color(color)});
}
void GXSetFogColor(GXColor color) { update_gx_state(g_gxState.fog.color, from_gx_color(color)); }
void GXSetVtxDesc(GXAttr attr, GXAttrType type) { update_gx_state(g_gxState.vtxDesc[attr], type); }
void GXSetVtxDescv(GXVtxDescList* list) {
  g_gxState.vtxDesc.fill({});
  while (list->attr != GX_VA_NULL) {
    update_gx_state(g_gxState.vtxDesc[list->attr], list->type);
    ++list;
  }
}
void GXClearVtxDesc() { g_gxState.vtxDesc.fill({}); }
void GXSetTevSwapModeTable(GXTevSwapSel id, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue,
                           GXTevColorChan alpha) {
  if (id < GX_TEV_SWAP0 || id >= GX_MAX_TEVSWAP) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid tev swap sel {}"), id);
    unreachable();
  }
  update_gx_state(g_gxState.tevSwapTable[id], {red, green, blue, alpha});
}
void GXSetTevSwapMode(GXTevStageID stageId, GXTevSwapSel rasSel, GXTevSwapSel texSel) {
  auto& stage = g_gxState.tevStages[stageId];
  update_gx_state(stage.tevSwapRas, rasSel);
  update_gx_state(stage.tevSwapTex, texSel);
}
void GXSetLineWidth(u8 width, GXTexOffset offs) {
  // TODO
}
void GXSetTevDirect(GXTevStageID stageId) {
  auto& stage = g_gxState.tevStages[stageId];
  // TODO is this right?
  update_gx_state(stage.indTexStage, GX_INDTEXSTAGE0);
  update_gx_state(stage.indTexFormat, GX_ITF_8);
  update_gx_state(stage.indTexBiasSel, GX_ITB_NONE);
  update_gx_state(stage.indTexAlphaSel, GX_ITBA_OFF);
  update_gx_state(stage.indTexMtxId, GX_ITM_OFF);
  update_gx_state(stage.indTexWrapS, GX_ITW_OFF);
  update_gx_state(stage.indTexWrapT, GX_ITW_OFF);
  update_gx_state(stage.indTexUseOrigLOD, false);
  update_gx_state(stage.indTexAddPrev, false);
}
void GXSetVtxAttrFmt(GXVtxFmt vtxfmt, GXAttr attr, GXCompCnt cnt, GXCompType type, u8 frac) {
  if (vtxfmt < GX_VTXFMT0 || vtxfmt >= GX_MAX_VTXFMT) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid vtxfmt {}"), vtxfmt);
    unreachable();
  }
  if (attr < GX_VA_PNMTXIDX || attr >= GX_VA_MAX_ATTR) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid attr {}"), attr);
    unreachable();
  }
  auto& fmt = g_gxState.vtxFmts[vtxfmt].attrs[attr];
  update_gx_state(fmt.cnt, cnt);
  update_gx_state(fmt.type, type);
  update_gx_state(fmt.frac, frac);
}
void GXGetVtxAttrFmt(GXVtxFmt idx, GXAttr attr, GXCompCnt* compCnt, GXCompType* compType, u8* shift) {
  const auto& fmt = g_gxState.vtxFmts[idx].attrs[attr];
  *compCnt = fmt.cnt;
  *compType = fmt.type;
  *shift = fmt.frac;
}
static GXDrawDoneCallback DrawDoneCB = nullptr;
GXDrawDoneCallback GXSetDrawDoneCallback(GXDrawDoneCallback cb) {
  GXDrawDoneCallback old = DrawDoneCB;
  DrawDoneCB = cb;
  return old;
}
void GXDrawDone() {
  // TODO?
  DrawDoneCB();
}
void GXSetDrawDone() {
  // TODO?
  DrawDoneCB();
}
void GXGetProjectionv(f32* p) {
  const auto& mtx = g_gxState.origProj;
  p[0] = static_cast<float>(g_gxState.projType);
  p[1] = mtx.m0[0];
  p[3] = mtx.m1[1];
  p[5] = mtx.m2[2];
  p[6] = mtx.m2[3];
  if (g_gxState.projType == GX_ORTHOGRAPHIC) {
    p[2] = mtx.m0[3];
    p[4] = mtx.m1[3];
  } else {
    p[2] = mtx.m0[2];
    p[4] = mtx.m1[2];
  }
}

GXTexFmt GXGetTexObjFmt(GXTexObj* tex_obj) { return reinterpret_cast<const GXTexObj_*>(tex_obj)->fmt; }
u16 GXGetTexObjWidth(GXTexObj* tex_obj) { return reinterpret_cast<const GXTexObj_*>(tex_obj)->width; }
u16 GXGetTexObjHeight(GXTexObj* tex_obj) { return reinterpret_cast<const GXTexObj_*>(tex_obj)->height; }
void* GXGetTexObjData(GXTexObj* tex_obj) { return reinterpret_cast<const GXTexObj_*>(tex_obj)->data; }
GXTexWrapMode GXGetTexObjWrapS(GXTexObj* tex_obj) { return reinterpret_cast<const GXTexObj_*>(tex_obj)->wrapS; }
GXTexWrapMode GXGetTexObjWrapT(GXTexObj* tex_obj) { return reinterpret_cast<const GXTexObj_*>(tex_obj)->wrapT; }
GXBool GXGetTexObjMipMap(GXTexObj* tex_obj) { return reinterpret_cast<const GXTexObj_*>(tex_obj)->hasMips; }

u32 GXGetTexBufferSize(u16 width, u16 height, u32 fmt, GXBool mips, u8 maxLod) {
  s32 shiftX = 0;
  s32 shiftY = 0;
  switch (fmt) {
  case GX_TF_I4:
  case GX_TF_C4:
  case GX_TF_CMPR:
  case GX_CTF_R4:
  case GX_CTF_Z4:
    shiftX = 3;
    shiftY = 3;
    break;
  case GX_TF_I8:
  case GX_TF_IA4:
  case GX_TF_C8:
  case GX_TF_Z8:
  case GX_CTF_RA4:
  case GX_CTF_A8:
  case GX_CTF_R8:
  case GX_CTF_G8:
  case GX_CTF_B8:
  case GX_CTF_Z8M:
  case GX_CTF_Z8L:
    shiftX = 3;
    shiftY = 2;
    break;
  case GX_TF_IA8:
  case GX_TF_RGB565:
  case GX_TF_RGB5A3:
  case GX_TF_RGBA8:
  case GX_TF_C14X2:
  case GX_TF_Z16:
  case GX_TF_Z24X8:
  case GX_CTF_RA8:
  case GX_CTF_RG8:
  case GX_CTF_GB8:
  case GX_CTF_Z16L:
    shiftX = 2;
    shiftY = 2;
    break;
  default:
    break;
  }
  u32 bitSize = fmt == GX_TF_RGBA8 || fmt == GX_TF_Z24X8 ? 64 : 32;
  u32 bufLen = 0;
  if (mips) {
    while (maxLod != 0) {
      const u32 tileX = ((width + (1 << shiftX) - 1) >> shiftX);
      const u32 tileY = ((height + (1 << shiftY) - 1) >> shiftY);
      bufLen += bitSize * tileX * tileY;

      if (width == 1 && height == 1) {
        return bufLen;
      }

      width = (width < 2) ? 1 : width / 2;
      height = (height < 2) ? 1 : height / 2;
      --maxLod;
    };
  } else {
    const u32 tileX = ((width + (1 << shiftX) - 1) >> shiftX);
    const u32 tileY = ((height + (1 << shiftY) - 1) >> shiftY);
    bufLen = bitSize * tileX * tileY;
  }

  return bufLen;
}

// Lighting
void GXInitLightAttn(GXLightObj* light_, float a0, float a1, float a2, float k0, float k1, float k2) {
  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->a0 = a0;
  light->a1 = a1;
  light->a2 = a2;
  light->k0 = k0;
  light->k1 = k1;
  light->k2 = k2;
}

void GXInitLightAttnA(GXLightObj* light_, float a0, float a1, float a2) {
  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->a0 = a0;
  light->a1 = a1;
  light->a2 = a2;
}

void GXInitLightAttnK(GXLightObj* light_, float k0, float k1, float k2) {
  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->k0 = k0;
  light->k1 = k1;
  light->k2 = k2;
}

void GXInitLightSpot(GXLightObj* light_, float cutoff, GXSpotFn spotFn) {
  if (cutoff <= 0.f || cutoff > 90.f) {
    spotFn = GX_SP_OFF;
  }

  float cr = std::cos((cutoff * M_PIF) / 180.f);
  float a0 = 1.f;
  float a1 = 0.f;
  float a2 = 0.f;
  switch (spotFn) {
  default:
    break;
  case GX_SP_FLAT:
    a0 = -1000.f * cr;
    a1 = 1000.f;
    a2 = 0.f;
    break;
  case GX_SP_COS:
    a0 = -cr / (1.f - cr);
    a1 = 1.f / (1.f - cr);
    a2 = 0.f;
    break;
  case GX_SP_COS2:
    a0 = 0.f;
    a1 = -cr / (1.f - cr);
    a2 = 1.f / (1.f - cr);
    break;
  case GX_SP_SHARP: {
    const float d = (1.f - cr) * (1.f - cr);
    a0 = cr * (cr - 2.f);
    a1 = 2.f / d;
    a2 = -1.f / d;
    break;
  }
  case GX_SP_RING1: {
    const float d = (1.f - cr) * (1.f - cr);
    a0 = 4.f * cr / d;
    a1 = 4.f * (1.f + cr) / d;
    a2 = -4.f / d;
    break;
  }
  case GX_SP_RING2: {
    const float d = (1.f - cr) * (1.f - cr);
    a0 = 1.f - 2.f * cr * cr / d;
    a1 = 4.f * cr / d;
    a2 = -2.f / d;
    break;
  }
  }

  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->a0 = a0;
  light->a1 = a1;
  light->a2 = a2;
}

void GXInitLightDistAttn(GXLightObj* light_, float refDistance, float refBrightness, GXDistAttnFn distFunc) {
  if (refDistance < 0.f || refBrightness < 0.f || refBrightness >= 1.f) {
    distFunc = GX_DA_OFF;
  }
  float k0 = 1.f;
  float k1 = 0.f;
  float k2 = 0.f;
  switch (distFunc) {
  case GX_DA_GENTLE:
    k0 = 1.0f;
    k1 = (1.0f - refBrightness) / (refBrightness * refDistance);
    k2 = 0.0f;
    break;
  case GX_DA_MEDIUM:
    k0 = 1.0f;
    k1 = 0.5f * (1.0f - refBrightness) / (refBrightness * refDistance);
    k2 = 0.5f * (1.0f - refBrightness) / (refBrightness * refDistance * refDistance);
    break;
  case GX_DA_STEEP:
    k0 = 1.0f;
    k1 = 0.0f;
    k2 = (1.0f - refBrightness) / (refBrightness * refDistance * refDistance);
    break;
  case GX_DA_OFF:
    k0 = 1.0f;
    k1 = 0.0f;
    k2 = 0.0f;
    break;
  }

  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->k0 = k0;
  light->k1 = k1;
  light->k2 = k2;
}

void GXInitLightPos(GXLightObj* light_, float x, float y, float z) {
  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->px = x;
  light->py = y;
  light->pz = z;
}

void GXInitLightDir(GXLightObj* light_, float nx, float ny, float nz) {
  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->nx = -nx;
  light->ny = -ny;
  light->nz = -nz;
}

void GXInitSpecularDir(GXLightObj* light_, float nx, float ny, float nz) {
  float hx = -nx;
  float hy = -ny;
  float hz = (-nz + 1.0f);
  float mag = ((hx * hx) + (hy * hy) + (hz * hz));
  if (mag != 0.0f) {
    mag = 1.0f / sqrtf(mag);
  }

  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->px = (nx * GX_LARGE_NUMBER);
  light->py = (ny * GX_LARGE_NUMBER);
  light->pz = (nz * GX_LARGE_NUMBER);
  light->nx = hx * mag;
  light->ny = hy * mag;
  light->nz = hz * mag;
}

void GXInitSpecularDirHA(GXLightObj* light_, float nx, float ny, float nz, float hx, float hy, float hz) {
  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->px = (nx * GX_LARGE_NUMBER);
  light->py = (ny * GX_LARGE_NUMBER);
  light->pz = (nz * GX_LARGE_NUMBER);
  light->nx = hx;
  light->ny = hy;
  light->nz = hz;
}

void GXInitLightColor(GXLightObj* light_, GXColor col) {
  auto* light = reinterpret_cast<GXLightObj_*>(light_);
  light->color = col;
}

void GXLoadLightObjImm(GXLightObj* light_, GXLightID id) {
  u32 idx = std::log2<u32>(id);
  aurora::gfx::Light realLight;
  auto* light = reinterpret_cast<const GXLightObj_*>(light_);
  realLight.pos = {light->px, light->py, light->pz};
  realLight.dir = {light->nx, light->ny, light->nz};
  realLight.cosAtt = {light->a0, light->a1, light->a2};
  realLight.distAtt = {light->k0, light->k1, light->k2};
  realLight.color = from_gx_color(light->color);
  update_gx_state(g_gxState.lights[idx], realLight);
}

/* TODO Figure out a way to implement this, requires GXSetArray */
void GXLoadLightObjIndx(u32 index, GXLightID) {}

void GXGetLightAttnA(GXLightObj* light_, float* a0, float* a1, float* a2) {
  auto* light = reinterpret_cast<const GXLightObj_*>(light_);
  *a0 = light->a0;
  *a1 = light->a1;
  *a2 = light->a2;
}

void GXGetLightAttnK(GXLightObj* light_, float* k0, float* k1, float* k2) {
  auto* light = reinterpret_cast<const GXLightObj_*>(light_);
  *k0 = light->k0;
  *k1 = light->k1;
  *k2 = light->k2;
}

void GXGetLightPos(GXLightObj* light_, float* x, float* y, float* z) {
  auto* light = reinterpret_cast<const GXLightObj_*>(light_);
  *x = light->px;
  *z = light->py;
  *z = light->pz;
}

void GXGetLightDir(GXLightObj* light_, float* nx, float* ny, float* nz) {
  auto* light = reinterpret_cast<const GXLightObj_*>(light_);
  *nx = -light->nx;
  *ny = -light->ny;
  *nz = -light->nz;
}

void GXGetLightColor(GXLightObj* light_, GXColor* col) {
  auto* light = reinterpret_cast<const GXLightObj_*>(light_);
  *col = light->color;
}

// Indirect Texturing
void GXSetTevIndirect(GXTevStageID tevStage, GXIndTexStageID indStage, GXIndTexFormat fmt, GXIndTexBiasSel biasSel,
                      GXIndTexMtxID matrixSel, GXIndTexWrap wrapS, GXIndTexWrap wrapT, GXBool addPrev, GXBool indLod,
                      GXIndTexAlphaSel alphaSel) {
  auto& stage = g_gxState.tevStages[tevStage];
  update_gx_state(stage.indTexStage, indStage);
  update_gx_state(stage.indTexFormat, fmt);
  update_gx_state(stage.indTexBiasSel, biasSel);
  update_gx_state(stage.indTexAlphaSel, alphaSel);
  update_gx_state(stage.indTexMtxId, matrixSel);
  update_gx_state(stage.indTexWrapS, wrapS);
  update_gx_state(stage.indTexWrapT, wrapT);
  update_gx_state(stage.indTexAddPrev, addPrev);
  update_gx_state(stage.indTexUseOrigLOD, indLod);
}
void GXSetIndTexOrder(GXIndTexStageID indStage, GXTexCoordID texCoord, GXTexMapID texMap) {
  auto& stage = g_gxState.indStages[indStage];
  update_gx_state(stage.texCoordId, texCoord);
  update_gx_state(stage.texMapId, texMap);
}
void GXSetIndTexCoordScale(GXIndTexStageID indStage, GXIndTexScale scaleS, GXIndTexScale scaleT) {
  auto& stage = g_gxState.indStages[indStage];
  update_gx_state(stage.scaleS, scaleS);
  update_gx_state(stage.scaleT, scaleT);
}
void GXSetIndTexMtx(GXIndTexMtxID id, f32 offset[2][3], s8 scaleExp) {
  if (id < GX_ITM_0 || id > GX_ITM_2) {
    Log.report(logwrapper::Fatal, FMT_STRING("invalid ind tex mtx ID {}"), id);
  }
  update_gx_state(g_gxState.indTexMtxs[id - 1], {*reinterpret_cast<const aurora::Mat3x2<float>*>(offset), scaleExp});
}

void GXInitTexObj(GXTexObj* obj_, void* data, u16 width, u16 height, GXTexFmt format, GXTexWrapMode wrapS,
                  GXTexWrapMode wrapT, GXBool mipmap) {
  memset(obj_, 0, sizeof(GXTexObj));
  auto* obj = reinterpret_cast<GXTexObj_*>(obj_);
  obj->data = data;
  obj->width = width;
  obj->height = height;
  obj->fmt = format;
  obj->wrapS = wrapS;
  obj->wrapT = wrapT;
  obj->hasMips = mipmap;
  // TODO default values?
  obj->minFilter = GX_LINEAR;
  obj->magFilter = GX_LINEAR;
  obj->minLod = 0.f;
  obj->maxLod = 0.f;
  obj->lodBias = 0.f;
  obj->biasClamp = false;
  obj->doEdgeLod = false;
  obj->maxAniso = GX_ANISO_4;
  obj->tlut = GX_TLUT0;
  obj->dataInvalidated = true;
}
void GXInitTexObjResolved(GXTexObj* obj_, u32 bindIdx, GXTexFmt format, GXTexWrapMode wrapS, GXTexWrapMode wrapT,
                          GXTlut tlut) {
  auto* obj = reinterpret_cast<GXTexObj_*>(obj_);
  const auto& ref = aurora::gfx::g_resolvedTextures[bindIdx];
  obj->ref = ref;
  obj->data = nullptr;
  obj->dataSize = 0;
  obj->width = ref->size.width;
  obj->height = ref->size.height;
  obj->fmt = format;
  obj->wrapS = wrapS;
  obj->wrapT = wrapT;
  obj->hasMips = false;
  obj->tlut = tlut;
  // TODO default values?
  obj->minFilter = GX_LINEAR;
  obj->magFilter = GX_LINEAR;
  obj->minLod = 0.f;
  obj->maxLod = 0.f;
  obj->lodBias = 0.f;
  obj->biasClamp = false;
  obj->doEdgeLod = false;
  obj->maxAniso = GX_ANISO_4;
  obj->dataInvalidated = false;
}
void GXInitTexObjLOD(GXTexObj* obj_, GXTexFilter minFilt, GXTexFilter magFilt, float minLod, float maxLod,
                     float lodBias, GXBool biasClamp, GXBool doEdgeLod, GXAnisotropy maxAniso) {
  auto* obj = reinterpret_cast<GXTexObj_*>(obj_);
  obj->minFilter = minFilt;
  obj->magFilter = magFilt;
  obj->minLod = minLod;
  obj->maxLod = maxLod;
  obj->lodBias = lodBias;
  obj->biasClamp = biasClamp;
  obj->doEdgeLod = doEdgeLod;
  obj->maxAniso = maxAniso;
}
void GXInitTexObjCI(GXTexObj* obj_, void* data, u16 width, u16 height, GXCITexFmt format, GXTexWrapMode wrapS,
                    GXTexWrapMode wrapT, GXBool mipmap, u32 tlut) {
  auto* obj = reinterpret_cast<GXTexObj_*>(obj_);
  obj->data = data;
  obj->width = width;
  obj->height = height;
  obj->fmt = static_cast<GXTexFmt>(format);
  obj->wrapS = wrapS;
  obj->wrapT = wrapT;
  obj->hasMips = mipmap;
  obj->tlut = static_cast<GXTlut>(tlut);
  // TODO default values?
  obj->minFilter = GX_LINEAR;
  obj->magFilter = GX_LINEAR;
  obj->minLod = 0.f;
  obj->maxLod = 0.f;
  obj->lodBias = 0.f;
  obj->biasClamp = false;
  obj->doEdgeLod = false;
  obj->maxAniso = GX_ANISO_4;
  obj->dataInvalidated = true;
}
void GXInitTexObjData(GXTexObj* obj_, void* data) {
  auto* obj = reinterpret_cast<GXTexObj_*>(obj_);
  obj->data = data;
  obj->dataInvalidated = true;
}
void GXInitTexObjWrapMode(GXTexObj* obj_, GXTexWrapMode wrapS, GXTexWrapMode wrapT) {
  auto* obj = reinterpret_cast<GXTexObj_*>(obj_);
  obj->wrapS = wrapS;
  obj->wrapT = wrapT;
}
void GXInitTexObjTlut(GXTexObj* obj_, u32 tlut) {
  auto* obj = reinterpret_cast<GXTexObj_*>(obj_);
  obj->tlut = static_cast<GXTlut>(tlut);
}
void GXLoadTexObj(GXTexObj* obj_, GXTexMapID id) {
  auto* obj = reinterpret_cast<GXTexObj_*>(obj_);
  if (!obj->ref) {
    obj->ref =
        aurora::gfx::new_dynamic_texture_2d(obj->width, obj->height, u32(obj->minLod) + 1, obj->fmt, "GXLoadTexObj");
  }
  if (obj->dataInvalidated) {
    aurora::gfx::write_texture(*obj->ref, {static_cast<const u8*>(obj->data), UINT32_MAX /* TODO */});
    obj->dataInvalidated = false;
  }
  g_gxState.textures[id] = {*obj};
  // TODO stateDirty?
}

void GXInitTlutObj(GXTlutObj* obj_, const void* data, GXTlutFmt format, u16 entries) {
  GXTexFmt texFmt;
  switch (format) {
  case GX_TL_IA8:
    texFmt = GX_TF_IA8;
    break;
  case GX_TL_RGB565:
    texFmt = GX_TF_RGB565;
    break;
  case GX_TL_RGB5A3:
    texFmt = GX_TF_RGB5A3;
    break;
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("invalid tlut format {}"), format);
    unreachable();
  }
  auto* obj = reinterpret_cast<GXTlutObj_*>(obj_);
  obj->ref = aurora::gfx::new_static_texture_2d(
      entries, 1, 1, texFmt, aurora::ArrayRef{static_cast<const u8*>(data), static_cast<size_t>(entries) * 2},
      "GXInitTlutObj");
}
void GXLoadTlut(const GXTlutObj* obj_, GXTlut idx) {
  g_gxState.tluts[idx] = *reinterpret_cast<const GXTlutObj_*>(obj_);
  // TODO stateDirty?
}
void GXSetColorUpdate(GXBool enabled) { update_gx_state(g_gxState.colorUpdate, enabled); }
void GXSetTevColorS10(GXTevRegID id, const GXColorS10& color) {
  update_gx_state(g_gxState.colorRegs[id], aurora::Vec4<float>{
                                               static_cast<float>(color.r) / 1023.f,
                                               static_cast<float>(color.g) / 1023.f,
                                               static_cast<float>(color.b) / 1023.f,
                                               static_cast<float>(color.a) / 1023.f,
                                           });
}
void GXInvalidateTexAll() {
  // no-op?
}
void GXSetTexCopySrc(u16 left, u16 top, u16 wd, u16 ht) {
  // TODO
}
void GXSetTexCopyDst(u16 wd, u16 ht, GXTexFmt fmt, GXBool mipmap) {
  // TODO
}
void GXCopyTex(void* dest, GXBool clear) {
  // TODO
}
void GXSetZCompLoc(GXBool before_tex) {
  // TODO
}

namespace aurora::gfx {
static logwrapper::Module Log("aurora::gfx::gx");

namespace gx {
using gpu::g_device;
using gpu::g_graphicsConfig;

GXState g_gxState;

const TextureBind& get_texture(GXTexMapID id) noexcept { return g_gxState.textures[static_cast<size_t>(id)]; }

static inline wgpu::BlendFactor to_blend_factor(GXBlendFactor fac, bool isDst) {
  switch (fac) {
  case GX_BL_ZERO:
    return wgpu::BlendFactor::Zero;
  case GX_BL_ONE:
    return wgpu::BlendFactor::One;
  case GX_BL_SRCCLR: // + GX_BL_DSTCLR
    if (isDst) {
      return wgpu::BlendFactor::Dst;
    } else {
      return wgpu::BlendFactor::Src;
    }
  case GX_BL_INVSRCCLR: // + GX_BL_INVDSTCLR
    if (isDst) {
      return wgpu::BlendFactor::OneMinusDst;
    } else {
      return wgpu::BlendFactor::OneMinusSrc;
    }
  case GX_BL_SRCALPHA:
    return wgpu::BlendFactor::SrcAlpha;
  case GX_BL_INVSRCALPHA:
    return wgpu::BlendFactor::OneMinusSrcAlpha;
  case GX_BL_DSTALPHA:
    return wgpu::BlendFactor::DstAlpha;
  case GX_BL_INVDSTALPHA:
    return wgpu::BlendFactor::OneMinusDstAlpha;
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("invalid blend factor {}"), fac);
    unreachable();
  }
}

static inline wgpu::CompareFunction to_compare_function(GXCompare func) {
  switch (func) {
  case GX_NEVER:
    return wgpu::CompareFunction::Never;
  case GX_LESS:
    return wgpu::CompareFunction::Less;
  case GX_EQUAL:
    return wgpu::CompareFunction::Equal;
  case GX_LEQUAL:
    return wgpu::CompareFunction::LessEqual;
  case GX_GREATER:
    return wgpu::CompareFunction::Greater;
  case GX_NEQUAL:
    return wgpu::CompareFunction::NotEqual;
  case GX_GEQUAL:
    return wgpu::CompareFunction::GreaterEqual;
  case GX_ALWAYS:
    return wgpu::CompareFunction::Always;
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("invalid depth fn {}"), func);
    unreachable();
  }
}

static inline wgpu::BlendState to_blend_state(GXBlendMode mode, GXBlendFactor srcFac, GXBlendFactor dstFac,
                                              GXLogicOp op, u32 dstAlpha) {
  wgpu::BlendComponent colorBlendComponent;
  switch (mode) {
  case GX_BM_NONE:
    colorBlendComponent = {
        .operation = wgpu::BlendOperation::Add,
        .srcFactor = wgpu::BlendFactor::One,
        .dstFactor = wgpu::BlendFactor::Zero,
    };
    break;
  case GX_BM_BLEND:
    colorBlendComponent = {
        .operation = wgpu::BlendOperation::Add,
        .srcFactor = to_blend_factor(srcFac, false),
        .dstFactor = to_blend_factor(dstFac, true),
    };
    break;
  case GX_BM_SUBTRACT:
    colorBlendComponent = {
        .operation = wgpu::BlendOperation::ReverseSubtract,
        .srcFactor = wgpu::BlendFactor::One,
        .dstFactor = wgpu::BlendFactor::One,
    };
    break;
  case GX_BM_LOGIC:
    switch (op) {
    case GX_LO_CLEAR:
      colorBlendComponent = {
          .operation = wgpu::BlendOperation::Add,
          .srcFactor = wgpu::BlendFactor::Zero,
          .dstFactor = wgpu::BlendFactor::Zero,
      };
      break;
    case GX_LO_COPY:
      colorBlendComponent = {
          .operation = wgpu::BlendOperation::Add,
          .srcFactor = wgpu::BlendFactor::One,
          .dstFactor = wgpu::BlendFactor::Zero,
      };
      break;
    case GX_LO_NOOP:
      colorBlendComponent = {
          .operation = wgpu::BlendOperation::Add,
          .srcFactor = wgpu::BlendFactor::Zero,
          .dstFactor = wgpu::BlendFactor::One,
      };
      break;
    default:
      Log.report(logwrapper::Fatal, FMT_STRING("unsupported logic op {}"), op);
      unreachable();
    }
    break;
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("unsupported blend mode {}"), mode);
    unreachable();
  }
  wgpu::BlendComponent alphaBlendComponent{
      .operation = wgpu::BlendOperation::Add,
      .srcFactor = wgpu::BlendFactor::One,
      .dstFactor = wgpu::BlendFactor::Zero,
  };
  if (dstAlpha != UINT32_MAX) {
    alphaBlendComponent = wgpu::BlendComponent{
        .operation = wgpu::BlendOperation::Add,
        .srcFactor = wgpu::BlendFactor::Constant,
        .dstFactor = wgpu::BlendFactor::Zero,
    };
  }
  return {
      .color = colorBlendComponent,
      .alpha = alphaBlendComponent,
  };
}

static inline wgpu::ColorWriteMask to_write_mask(bool colorUpdate, bool alphaUpdate) {
  auto writeMask = wgpu::ColorWriteMask::None;
  if (colorUpdate) {
    writeMask |= wgpu::ColorWriteMask::Red | wgpu::ColorWriteMask::Green | wgpu::ColorWriteMask::Blue;
  }
  if (alphaUpdate) {
    writeMask |= wgpu::ColorWriteMask::Alpha;
  }
  return writeMask;
}

static inline wgpu::PrimitiveState to_primitive_state(GXPrimitive gx_prim, GXCullMode gx_cullMode) {
  wgpu::PrimitiveTopology primitive = wgpu::PrimitiveTopology::TriangleList;
  switch (gx_prim) {
  case GX_TRIANGLES:
    break;
  case GX_TRIANGLESTRIP:
    primitive = wgpu::PrimitiveTopology::TriangleStrip;
    break;
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("Unsupported primitive type {}"), gx_prim);
    unreachable();
  }
  wgpu::CullMode cullMode = wgpu::CullMode::None;
  switch (gx_cullMode) {
  case GX_CULL_FRONT:
    cullMode = wgpu::CullMode::Front;
    break;
  case GX_CULL_BACK:
    cullMode = wgpu::CullMode::Back;
    break;
  case GX_CULL_NONE:
    break;
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("Unsupported cull mode {}"), gx_cullMode);
    unreachable();
  }
  return {
      .topology = primitive,
      .frontFace = wgpu::FrontFace::CW,
      .cullMode = cullMode,
  };
}

wgpu::RenderPipeline build_pipeline(const PipelineConfig& config, const ShaderInfo& info,
                                    ArrayRef<wgpu::VertexBufferLayout> vtxBuffers, wgpu::ShaderModule shader,
                                    zstring_view label) noexcept {
  const auto depthStencil = wgpu::DepthStencilState{
      .format = g_graphicsConfig.depthFormat,
      .depthWriteEnabled = config.depthUpdate,
      .depthCompare = to_compare_function(config.depthFunc),
  };
  const auto blendState =
      to_blend_state(config.blendMode, config.blendFacSrc, config.blendFacDst, config.blendOp, config.dstAlpha);
  const std::array colorTargets{wgpu::ColorTargetState{
      .format = g_graphicsConfig.colorFormat,
      .blend = &blendState,
      .writeMask = to_write_mask(config.colorUpdate, config.alphaUpdate),
  }};
  const auto fragmentState = wgpu::FragmentState{
      .module = shader,
      .entryPoint = "fs_main",
      .targetCount = colorTargets.size(),
      .targets = colorTargets.data(),
  };
  auto layouts = build_bind_group_layouts(info, config.shaderConfig);
  const std::array bindGroupLayouts{
      std::move(layouts.uniformLayout),
      std::move(layouts.samplerLayout),
      std::move(layouts.textureLayout),
  };
  const auto pipelineLayoutDescriptor = wgpu::PipelineLayoutDescriptor{
      .label = "GX Pipeline Layout",
      .bindGroupLayoutCount = static_cast<uint32_t>(info.sampledTextures.any() ? bindGroupLayouts.size() : 1),
      .bindGroupLayouts = bindGroupLayouts.data(),
  };
  auto pipelineLayout = g_device.CreatePipelineLayout(&pipelineLayoutDescriptor);
  const auto descriptor = wgpu::RenderPipelineDescriptor{
      .label = label.c_str(),
      .layout = std::move(pipelineLayout),
      .vertex =
          {
              .module = std::move(shader),
              .entryPoint = "vs_main",
              .bufferCount = static_cast<uint32_t>(vtxBuffers.size()),
              .buffers = vtxBuffers.data(),
          },
      .primitive = to_primitive_state(config.primitive, config.cullMode),
      .depthStencil = &depthStencil,
      .multisample =
          wgpu::MultisampleState{
              .count = g_graphicsConfig.msaaSamples,
          },
      .fragment = &fragmentState,
  };
  return g_device.CreateRenderPipeline(&descriptor);
}

void populate_pipeline_config(PipelineConfig& config, GXPrimitive primitive) noexcept {
  config.shaderConfig.fogType = g_gxState.fog.type;
  config.shaderConfig.vtxAttrs = g_gxState.vtxDesc;
  config.shaderConfig.tevSwapTable = g_gxState.tevSwapTable;
  for (u8 i = 0; i < g_gxState.numTevStages; ++i) {
    config.shaderConfig.tevStages[i] = g_gxState.tevStages[i];
  }
  config.shaderConfig.tevStageCount = g_gxState.numTevStages;
  for (u8 i = 0; i < g_gxState.numChans; ++i) {
    const auto& cc = g_gxState.colorChannelConfig[i];
    if (g_gxState.colorChannelState[i].lightState.any() && cc.lightingEnabled) {
      config.shaderConfig.colorChannels[i] = cc;
    } else {
      // Only matSrc matters when lighting disabled
      config.shaderConfig.colorChannels[i] = {
          .matSrc = cc.matSrc,
      };
    }
  }
  for (u8 i = 0; i < g_gxState.numTexGens; ++i) {
    config.shaderConfig.tcgs[i] = g_gxState.tcgs[i];
  }
  if (g_gxState.alphaCompare) {
    config.shaderConfig.alphaCompare = g_gxState.alphaCompare;
  }
  config.shaderConfig.indexedAttributeCount =
      std::count_if(config.shaderConfig.vtxAttrs.begin(), config.shaderConfig.vtxAttrs.end(),
                    [](const auto type) { return type == GX_INDEX8 || type == GX_INDEX16; });
  for (u8 i = 0; i < MaxTextures; ++i) {
    const auto& bind = g_gxState.textures[i];
    TextureConfig texConfig{};
    if (bind.texObj.ref) {
      if (requires_copy_conversion(bind.texObj)) {
        texConfig.copyFmt = bind.texObj.ref->gxFormat;
      }
      if (requires_load_conversion(bind.texObj)) {
        texConfig.loadFmt = bind.texObj.fmt;
      }
      texConfig.renderTex = bind.texObj.ref->isRenderTexture;
    }
    config.shaderConfig.textureConfig[i] = texConfig;
  }
  config = {
      .shaderConfig = config.shaderConfig,
      .primitive = primitive,
      .depthFunc = g_gxState.depthFunc,
      .cullMode = g_gxState.cullMode,
      .blendMode = g_gxState.blendMode,
      .blendFacSrc = g_gxState.blendFacSrc,
      .blendFacDst = g_gxState.blendFacDst,
      .blendOp = g_gxState.blendOp,
      .dstAlpha = g_gxState.dstAlpha,
      .depthCompare = g_gxState.depthCompare,
      .depthUpdate = g_gxState.depthUpdate,
      .alphaUpdate = g_gxState.alphaUpdate,
      .colorUpdate = g_gxState.colorUpdate,
  };
}

Range build_uniform(const ShaderInfo& info) noexcept {
  auto [buf, range] = map_uniform(info.uniformSize);
  {
    buf.append(&g_gxState.pnMtx[g_gxState.currentPnMtx], 128);
    buf.append(&g_gxState.proj, 64);
  }
  for (int i = 0; i < info.loadsTevReg.size(); ++i) {
    if (!info.loadsTevReg.test(i)) {
      continue;
    }
    buf.append(&g_gxState.colorRegs[i], 16);
  }
  for (int i = 0; i < info.sampledColorChannels.size(); ++i) {
    if (!info.sampledColorChannels.test(i)) {
      continue;
    }
    buf.append(&g_gxState.colorChannelState[i].ambColor, 16);
    buf.append(&g_gxState.colorChannelState[i].matColor, 16);

    if (g_gxState.colorChannelConfig[i].lightingEnabled) {
      int addedLights = 0;
      const auto& lightState = g_gxState.colorChannelState[i].lightState;
      u32 state = lightState.to_ulong();
      buf.append(&lightState, sizeof(u32));
      buf.append_zeroes(12); // alignment
      for (int li = 0; li < lightState.size(); ++li) {
        if (!lightState.test(li)) {
          continue;
        }
        const auto& light = g_gxState.lights[li];
        static_assert(sizeof(Light) == 80);
        buf.append(&light, sizeof(Light));
        ++addedLights;
      }
      constexpr Light emptyLight{};
      for (int li = addedLights; li < GX::MaxLights; ++li) {
        buf.append(&emptyLight, sizeof(Light));
      }
    }
  }
  for (int i = 0; i < info.sampledKColors.size(); ++i) {
    if (!info.sampledKColors.test(i)) {
      continue;
    }
    buf.append(&g_gxState.kcolors[i], 16);
  }
  for (int i = 0; i < info.usesTexMtx.size(); ++i) {
    if (!info.usesTexMtx.test(i)) {
      continue;
    }
    switch (info.texMtxTypes[i]) {
    case GX_TG_MTX2x4:
      if (std::holds_alternative<Mat4x2<float>>(g_gxState.texMtxs[i])) {
        buf.append(&std::get<Mat4x2<float>>(g_gxState.texMtxs[i]), 32);
      } else {
        Log.report(logwrapper::Fatal, FMT_STRING("expected 2x4 mtx in idx {}"), i);
        unreachable();
      }
      break;
    case GX_TG_MTX3x4:
      if (std::holds_alternative<Mat4x4<float>>(g_gxState.texMtxs[i])) {
        const auto& mat = std::get<Mat4x4<float>>(g_gxState.texMtxs[i]);
        buf.append(&mat, 64);
      } else {
        Log.report(logwrapper::Fatal, FMT_STRING("expected 3x4 mtx in idx {}"), i);
        buf.append(&Mat4x4_Identity, 64);
      }
      break;
    default:
      Log.report(logwrapper::Fatal, FMT_STRING("unhandled tex mtx type {}"), info.texMtxTypes[i]);
      unreachable();
    }
  }
  for (int i = 0; i < info.usesPTTexMtx.size(); ++i) {
    if (!info.usesPTTexMtx.test(i)) {
      continue;
    }
    buf.append(&g_gxState.ptTexMtxs[i], 64);
  }
  if (info.usesFog) {
    const auto& state = g_gxState.fog;
    struct Fog {
      Vec4<float> color = state.color;
      float a = 0.f;
      float b = 0.5f;
      float c = 0.f;
      float pad = FLT_MAX;
    } fog{};
    static_assert(sizeof(Fog) == 32);
    if (state.nearZ != state.farZ && state.startZ != state.endZ) {
      const float depthRange = state.farZ - state.nearZ;
      const float fogRange = state.endZ - state.startZ;
      fog.a = (state.farZ * state.nearZ) / (depthRange * fogRange);
      fog.b = state.farZ / depthRange;
      fog.c = state.startZ / fogRange;
    }
    buf.append(&fog, 32);
  }
  for (int i = 0; i < info.sampledTextures.size(); ++i) {
    if (!info.sampledTextures.test(i)) {
      continue;
    }
    const auto& tex = get_texture(static_cast<GXTexMapID>(i));
    if (!tex) {
      Log.report(logwrapper::Fatal, FMT_STRING("unbound texture {}"), i);
      unreachable();
    }
    buf.append(&tex.texObj.lodBias, 4);
  }
  return range;
}

static absl::flat_hash_map<u32, wgpu::BindGroupLayout> sUniformBindGroupLayouts;
static absl::flat_hash_map<u32, std::pair<wgpu::BindGroupLayout, wgpu::BindGroupLayout>> sTextureBindGroupLayouts;

GXBindGroups build_bind_groups(const ShaderInfo& info, const ShaderConfig& config,
                               const BindGroupRanges& ranges) noexcept {
  const auto layouts = build_bind_group_layouts(info, config);

  const std::array uniformEntries{
      wgpu::BindGroupEntry{
          .binding = 0,
          .buffer = g_uniformBuffer,
          .size = info.uniformSize,
      },
      // Vertices
      wgpu::BindGroupEntry{
          .binding = 1,
          .buffer = g_storageBuffer,
          .size = ranges.vtxDataRange.size,
      },
      // Normals
      wgpu::BindGroupEntry{
          .binding = 2,
          .buffer = g_storageBuffer,
          .size = ranges.nrmDataRange.size,
      },
      // Packed UVs
      wgpu::BindGroupEntry{
          .binding = 3,
          .buffer = g_storageBuffer,
          .size = ranges.packedTcDataRange.size,
      },
      // UVs
      wgpu::BindGroupEntry{
          .binding = 4,
          .buffer = g_storageBuffer,
          .size = ranges.tcDataRange.size,
      },
  };
  std::array<wgpu::BindGroupEntry, MaxTextures> samplerEntries;
  std::array<wgpu::BindGroupEntry, MaxTextures * 2> textureEntries;
  u32 samplerCount = 0;
  u32 textureCount = 0;
  for (u32 i = 0; i < info.sampledTextures.size(); ++i) {
    if (!info.sampledTextures.test(i)) {
      continue;
    }
    const auto& tex = g_gxState.textures[i];
    if (!tex) {
      Log.report(logwrapper::Fatal, FMT_STRING("unbound texture {}"), i);
      unreachable();
    }
    samplerEntries[samplerCount] = {
        .binding = samplerCount,
        .sampler = sampler_ref(tex.get_descriptor()),
    };
    ++samplerCount;
    textureEntries[textureCount] = {
        .binding = textureCount,
        .textureView = tex.texObj.ref->view,
    };
    ++textureCount;
    // Load palette
    const auto& texConfig = config.textureConfig[i];
    if (is_palette_format(texConfig.loadFmt)) {
      u32 tlut = tex.texObj.tlut;
      if (tlut < GX_TLUT0 || tlut > GX_TLUT7) {
        Log.report(logwrapper::Fatal, FMT_STRING("tlut out of bounds {}"), tlut);
        unreachable();
      } else if (!g_gxState.tluts[tlut].ref) {
        Log.report(logwrapper::Fatal, FMT_STRING("tlut unbound {}"), tlut);
        unreachable();
      }
      textureEntries[textureCount] = {
          .binding = textureCount,
          .textureView = g_gxState.tluts[tlut].ref->view,
      };
      ++textureCount;
    }
  }
  return {
      .uniformBindGroup = bind_group_ref(wgpu::BindGroupDescriptor{
          .label = "GX Uniform Bind Group",
          .layout = layouts.uniformLayout,
          .entryCount = static_cast<uint32_t>(config.indexedAttributeCount > 0 ? uniformEntries.size() : 1),
          .entries = uniformEntries.data(),
      }),
      .samplerBindGroup = bind_group_ref(wgpu::BindGroupDescriptor{
          .label = "GX Sampler Bind Group",
          .layout = layouts.samplerLayout,
          .entryCount = samplerCount,
          .entries = samplerEntries.data(),
      }),
      .textureBindGroup = bind_group_ref(wgpu::BindGroupDescriptor{
          .label = "GX Texture Bind Group",
          .layout = layouts.textureLayout,
          .entryCount = textureCount,
          .entries = textureEntries.data(),
      }),
  };
}

GXBindGroupLayouts build_bind_group_layouts(const ShaderInfo& info, const ShaderConfig& config) noexcept {
  GXBindGroupLayouts out;
  u32 uniformSizeKey = info.uniformSize + (config.indexedAttributeCount > 0 ? 1 : 0);
  const auto uniformIt = sUniformBindGroupLayouts.find(uniformSizeKey);
  if (uniformIt != sUniformBindGroupLayouts.end()) {
    out.uniformLayout = uniformIt->second;
  } else {
    const std::array uniformLayoutEntries{
        wgpu::BindGroupLayoutEntry{
            .binding = 0,
            .visibility = wgpu::ShaderStage::Vertex | wgpu::ShaderStage::Fragment,
            .buffer =
                wgpu::BufferBindingLayout{
                    .type = wgpu::BufferBindingType::Uniform,
                    .hasDynamicOffset = true,
                    .minBindingSize = info.uniformSize,
                },
        },
        wgpu::BindGroupLayoutEntry{
            .binding = 1,
            .visibility = wgpu::ShaderStage::Vertex,
            .buffer =
                {
                    .type = wgpu::BufferBindingType::ReadOnlyStorage,
                    .hasDynamicOffset = true,
                },
        },
        wgpu::BindGroupLayoutEntry{
            .binding = 2,
            .visibility = wgpu::ShaderStage::Vertex,
            .buffer =
                {
                    .type = wgpu::BufferBindingType::ReadOnlyStorage,
                    .hasDynamicOffset = true,
                },
        },
        wgpu::BindGroupLayoutEntry{
            .binding = 3,
            .visibility = wgpu::ShaderStage::Vertex,
            .buffer =
                {
                    .type = wgpu::BufferBindingType::ReadOnlyStorage,
                    .hasDynamicOffset = true,
                },
        },
        wgpu::BindGroupLayoutEntry{
            .binding = 4,
            .visibility = wgpu::ShaderStage::Vertex,
            .buffer =
                {
                    .type = wgpu::BufferBindingType::ReadOnlyStorage,
                    .hasDynamicOffset = true,
                },
        },
    };
    const auto uniformLayoutDescriptor = wgpu::BindGroupLayoutDescriptor{
        .label = "GX Uniform Bind Group Layout",
        .entryCount = static_cast<uint32_t>(config.indexedAttributeCount > 0 ? uniformLayoutEntries.size() : 1),
        .entries = uniformLayoutEntries.data(),
    };
    out.uniformLayout = g_device.CreateBindGroupLayout(&uniformLayoutDescriptor);
    sUniformBindGroupLayouts.try_emplace(uniformSizeKey, out.uniformLayout);
  }

  //  u32 textureCount = info.sampledTextures.count();
  //  const auto textureIt = sTextureBindGroupLayouts.find(textureCount);
  //  if (textureIt != sTextureBindGroupLayouts.end()) {
  //    const auto& [sl, tl] = textureIt->second;
  //    out.samplerLayout = sl;
  //    out.textureLayout = tl;
  //  } else {
  u32 numSamplers = 0;
  u32 numTextures = 0;
  std::array<wgpu::BindGroupLayoutEntry, MaxTextures> samplerEntries;
  std::array<wgpu::BindGroupLayoutEntry, MaxTextures * 2> textureEntries;
  for (u32 i = 0; i < info.sampledTextures.size(); ++i) {
    if (!info.sampledTextures.test(i)) {
      continue;
    }
    const auto& texConfig = config.textureConfig[i];
    bool copyAsPalette = is_palette_format(texConfig.copyFmt);
    bool loadAsPalette = is_palette_format(texConfig.loadFmt);
    samplerEntries[numSamplers] = {
        .binding = numSamplers,
        .visibility = wgpu::ShaderStage::Fragment,
        .sampler = {.type = copyAsPalette && loadAsPalette ? wgpu::SamplerBindingType::NonFiltering
                                                           : wgpu::SamplerBindingType::Filtering},
    };
    ++numSamplers;
    if (loadAsPalette) {
      textureEntries[numTextures] = {
          .binding = numTextures,
          .visibility = wgpu::ShaderStage::Fragment,
          .texture =
              {
                  .sampleType = copyAsPalette ? wgpu::TextureSampleType::Sint : wgpu::TextureSampleType::Float,
                  .viewDimension = wgpu::TextureViewDimension::e2D,
              },
      };
      ++numTextures;
      textureEntries[numTextures] = {
          .binding = numTextures,
          .visibility = wgpu::ShaderStage::Fragment,
          .texture =
              {
                  .sampleType = wgpu::TextureSampleType::Float,
                  .viewDimension = wgpu::TextureViewDimension::e2D,
              },
      };
      ++numTextures;
    } else {
      textureEntries[numTextures] = {
          .binding = numTextures,
          .visibility = wgpu::ShaderStage::Fragment,
          .texture =
              {
                  .sampleType = wgpu::TextureSampleType::Float,
                  .viewDimension = wgpu::TextureViewDimension::e2D,
              },
      };
      ++numTextures;
    }
  }
  {
    const wgpu::BindGroupLayoutDescriptor descriptor{
        .label = "GX Sampler Bind Group Layout",
        .entryCount = numSamplers,
        .entries = samplerEntries.data(),
    };
    out.samplerLayout = g_device.CreateBindGroupLayout(&descriptor);
  }
  {
    const wgpu::BindGroupLayoutDescriptor descriptor{
        .label = "GX Texture Bind Group Layout",
        .entryCount = numTextures,
        .entries = textureEntries.data(),
    };
    out.textureLayout = g_device.CreateBindGroupLayout(&descriptor);
  }
  //    sTextureBindGroupLayouts.try_emplace(textureCount, out.samplerLayout, out.textureLayout);
  //  }
  return out;
}

// TODO this is awkward
extern absl::flat_hash_map<ShaderRef, std::pair<wgpu::ShaderModule, gx::ShaderInfo>> g_gxCachedShaders;
void shutdown() noexcept {
  // TODO we should probably store this all in g_state.gx instead
  sUniformBindGroupLayouts.clear();
  sTextureBindGroupLayouts.clear();
  for (auto& item : g_gxState.textures) {
    item.texObj.ref.reset();
  }
  for (auto& item : g_gxState.tluts) {
    item.ref.reset();
  }
  g_gxCachedShaders.clear();
}

static wgpu::AddressMode wgpu_address_mode(GXTexWrapMode mode) {
  switch (mode) {
  case GX_CLAMP:
    return wgpu::AddressMode::ClampToEdge;
  case GX_REPEAT:
    return wgpu::AddressMode::Repeat;
  case GX_MIRROR:
    return wgpu::AddressMode::MirrorRepeat;
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("invalid wrap mode {}"), mode);
    unreachable();
  }
}
static std::pair<wgpu::FilterMode, wgpu::FilterMode> wgpu_filter_mode(GXTexFilter filter) {
  switch (filter) {
  case GX_NEAR:
    return {wgpu::FilterMode::Nearest, wgpu::FilterMode::Linear};
  case GX_LINEAR:
    return {wgpu::FilterMode::Linear, wgpu::FilterMode::Linear};
  case GX_NEAR_MIP_NEAR:
    return {wgpu::FilterMode::Nearest, wgpu::FilterMode::Nearest};
  case GX_LIN_MIP_NEAR:
    return {wgpu::FilterMode::Linear, wgpu::FilterMode::Nearest};
  case GX_NEAR_MIP_LIN:
    return {wgpu::FilterMode::Nearest, wgpu::FilterMode::Linear};
  case GX_LIN_MIP_LIN:
    return {wgpu::FilterMode::Linear, wgpu::FilterMode::Linear};
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("invalid filter mode {}"), filter);
    unreachable();
  }
}
static u16 wgpu_aniso(GXAnisotropy aniso) {
  switch (aniso) {
  case GX_ANISO_1:
    return 1;
  case GX_ANISO_2:
    return std::max<u16>(g_graphicsConfig.textureAnisotropy / 2, 1);
  case GX_ANISO_4:
    return std::max<u16>(g_graphicsConfig.textureAnisotropy, 1);
  default:
    Log.report(logwrapper::Fatal, FMT_STRING("invalid aniso mode {}"), aniso);
    unreachable();
  }
}
wgpu::SamplerDescriptor TextureBind::get_descriptor() const noexcept {
  if (requires_copy_conversion(texObj) && is_palette_format(texObj.ref->gxFormat)) {
    return {
        .label = "Generated Non-Filtering Sampler",
        .addressModeU = wgpu_address_mode(texObj.wrapS),
        .addressModeV = wgpu_address_mode(texObj.wrapT),
        .addressModeW = wgpu::AddressMode::Repeat,
        .magFilter = wgpu::FilterMode::Nearest,
        .minFilter = wgpu::FilterMode::Nearest,
        .mipmapFilter = wgpu::FilterMode::Nearest,
        .maxAnisotropy = 1,
    };
  }
  const auto [minFilter, mipFilter] = wgpu_filter_mode(texObj.minFilter);
  const auto [magFilter, _] = wgpu_filter_mode(texObj.magFilter);
  return {
      .label = "Generated Filtering Sampler",
      .addressModeU = wgpu_address_mode(texObj.wrapS),
      .addressModeV = wgpu_address_mode(texObj.wrapT),
      .addressModeW = wgpu::AddressMode::Repeat,
      .magFilter = magFilter,
      .minFilter = minFilter,
      .mipmapFilter = mipFilter,
      .maxAnisotropy = wgpu_aniso(texObj.maxAniso),
  };
}
} // namespace gx
} // namespace aurora::gfx
