#ifndef DOLPHIN_GXPIXEL_H
#define DOLPHIN_GXPIXEL_H

#include <dolphin/gx/GXEnum.h>

#ifdef __cplusplus
extern "C" {
#endif

void GXSetFog(GXFogType type, f32 startz, f32 endz, f32 nearz, f32 farz, GXColor color);
// ? GXSetFogRangeAdj();
void GXSetBlendMode(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
void GXSetColorUpdate(GXBool update_enable);
void GXSetAlphaUpdate(GXBool update_enable);
void GXSetZMode(GXBool compare_enable, GXCompare func, GXBool update_enable);
void GXSetZCompLoc(GXBool before_tex);
// ? GXSetPixelFmt();
void GXSetDither(GXBool dither);
// ? GXSetDstAlpha();
// ? GXSetFieldMask();
// ? GXSetFieldMode();

#ifdef __cplusplus
}
#endif

#endif
