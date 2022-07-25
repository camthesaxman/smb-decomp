#include "gx.hpp"

void GXSetNumIndStages(u8 num) { update_gx_state(g_gxState.numIndStages, num); }

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
    Log.report(LOG_FATAL, FMT_STRING("invalid ind tex mtx ID {}"), id);
  }
  update_gx_state(g_gxState.indTexMtxs[id - 1], {*reinterpret_cast<const aurora::Mat3x2<float>*>(offset), scaleExp});
}

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

// TODO GXSetTevIndWarp
// TODO GXSetTevIndTile
// TODO GXSetTevIndBumpST
// TODO GXSetTevIndBumpXYZ
// TODO GXSetTevIndRepeat
