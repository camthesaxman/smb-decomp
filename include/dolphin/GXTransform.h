#ifndef _DOLPHIN_GXTRANSFORM_H_
#define _DOLPHIN_GXTRANSFORM_H_

#include <dolphin/GXEnum.h>

#define GX_PROJECTION_SZ  7

void GXSetProjection(f32 mtx[4][4], GXProjectionType type);
void GXSetViewport(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz);
void GXLoadPosMtxImm(f32 mtx[3][4], u32 id);
void GXLoadNrmMtxImm(f32 mtx[3][4], u32 id);
void GXLoadTexMtxImm(f32 mtx[][4], u32 id, GXTexMtxType type);
void GXSetCurrentMtx(u32 id);
void GXSetViewportJitter(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz, u32 field);

#endif
