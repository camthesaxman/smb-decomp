#ifndef _SRC_TEVUTIL_H_
#define _SRC_TEVUTIL_H_

#include <dolphin/gx.h>

u32 tevutil_init(void);
void GXSetCullMode_cached(GXCullMode mode);
void GXSetCullMode_cached_init(GXCullMode mode, struct ZMode *_ZMode);
void GXSetBlendMode_cached(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
void GXSetBlendMode_cached_init(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
void GXSetTevSwapModeTable_cached_init(GXTevSwapSel id, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha);
void GXSetTevSwapMode_cached(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel);
void GXSetTevSwapMode_cached_init(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel);
void GXSetFog_cached(GXFogType type, float startz, float endz, float nearz, float farz, GXColor color);
void GXSetFog_cached_init(GXFogType type, float startz, float endz, float nearz, float farz, GXColor color);
void GXSetColorUpdate_cached(u32 update_enable);
void GXSetColorUpdate_cached_init(u32 update_enable);
void GXSetAlphaUpdate_cached_init(u32 update_enable);
void GXSetZCompLoc_cached(u32 before_tex);
void GXSetZCompLoc_from_cache(void);
void GXSetZCompLoc_cached_init(u32 before_tex);
void GXSetTevColorIn_cached(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d);
void GXSetTevColorIn_cached_init(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d);
void GXSetTevAlphaIn_cached(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d);
void GXSetTevAlphaIn_cached_init(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d);
void GXSetTevColorOp_cached(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, u32 clamp, GXTevRegID out_reg);
void GXSetTevColorOp_cached_init(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
void GXSetTevAlphaOp_cached(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
void GXSetTevAlphaOp_cached_init(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
void func_8009EA30(GXTevStageID stage, int param_2);
void GXSetTevOrder_cached(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color);
void GXSetTevOrder_cached_init(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color);
void GXSetTevKColorSel_cached(GXTevStageID stage, GXTevKColorSel sel);
void GXSetTevKColorSel_cached_init(GXTevStageID stage, GXTevKColorSel sel);
void GXSetTevKAlphaSel_cached(GXTevStageID stage, GXTevKAlphaSel sel);
void GXSetTevKAlphaSel_cached_init(GXTevStageID stage, GXTevKAlphaSel sel);
void GXSetNumTevStages_cached(u8 nStages);
void GXSetNumTevStages_from_cache(void);
void GXSetTevKColor_cached(GXTevKColorID id, GXColor color);
void GXSetTevKColor_cached_init(GXTevKColorID id, GXColor color);
void GXLoadTexObj_cached(GXTexObj *obj, GXTexMapID id);

#endif
