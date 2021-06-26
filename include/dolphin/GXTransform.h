#ifndef _DOLPHIN_GXTRANSFORM_H_
#define _DOLPHIN_GXTRANSFORM_H_

#include <dolphin/GXEnum.h>

void GXSetProjection(f32 mtx[4][4], GXProjectionType type);
void GXSetViewport(f32 left, f32 top, f32 wd, f32 ht, f32 nearz,
    f32 farz);

#endif
