#ifndef DOLPHIN_GXBUMP_H
#define DOLPHIN_GXBUMP_H

#include <dolphin/gx/GXEnum.h>

#ifdef __cplusplus
extern "C" {
#endif

extern void GXSetTevDirect(GXTevStageID tev_stage);
extern void GXSetNumIndStages(u8 nIndStages);
extern void GXSetIndTexMtx(GXIndTexMtxID mtx_sel, f32 offset[2][3], s8 scale_exp);
extern void GXSetIndTexOrder(GXIndTexStageID ind_stage, GXTexCoordID tex_coord, GXTexMapID tex_map);
extern void GXSetTevIndirect(GXTevStageID tev_stage, GXIndTexStageID ind_stage, GXIndTexFormat format,
                             GXIndTexBiasSel bias_sel, GXIndTexMtxID matrix_sel, GXIndTexWrap wrap_s,
                             GXIndTexWrap wrap_t, GXBool add_prev, GXBool ind_lod, GXIndTexAlphaSel alpha_sel);

#ifdef __cplusplus
}
#endif

#endif
