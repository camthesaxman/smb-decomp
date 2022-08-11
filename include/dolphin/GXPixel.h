#ifndef _DOLPHIN_GXPIXEL_H_
#define _DOLPHIN_GXPIXEL_H_

#include <dolphin/GXEnum.h>

// 0x800E2B9C
void GXSetFog(GXFogType type, f32 startz, f32 endz, f32 nearz, f32 farz, GXColor color);
// 0x800E2D50
// ? GXSetFogRangeAdj();
// 0x800E2E50
void GXSetBlendMode(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
// 0x800E2F54
void GXSetColorUpdate(GXBool update_enable);
// 0x800E2F94
void GXSetAlphaUpdate(GXBool update_enable);
// 0x800E2FD4
void GXSetZMode(GXBool compare_enable, GXCompare func, GXBool update_enable);
// 0x800E304C
void GXSetZCompLoc(GXBool before_tex);
// 0x800E308C
// ? GXSetPixelFmt();
// 0x800E319C
void GXSetDither(GXBool dither);
// 0x800E31DC
// ? GXSetDstAlpha();
// 0x800E3230
// ? GXSetFieldMask();
// 0x800E3268
// ? GXSetFieldMode();

#endif
