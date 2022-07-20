#ifndef _DOLPHIN_GXTEXTURE_H_
#define _DOLPHIN_GXTEXTURE_H_

#include "GXEnum.h"
#include "GXStruct.h"

void GXInitTexObj(GXTexObj *obj, void *image_ptr, u16 width, u16 height,
    GXTexFmt format, GXTexWrapMode wrap_s, GXTexWrapMode wrap_t, GXBool mipmap);
void GXInitTexObjLOD(GXTexObj *obj, GXTexFilter min_filt, GXTexFilter mag_filt,
    f32 min_lod, f32 max_lod, f32 lod_bias, GXBool bias_clamp,
    GXBool do_edge_lod, GXAnisotropy max_aniso );
void GXLoadTexObj(GXTexObj *obj, GXTexMapID id);
u32 GXGetTexBufferSize(u16 width, u16 height, u32 format, GXBool mipmap,
    u8 max_lod);
void GXInvalidateTexAll(void);
void GXInitTexObjWrapMode(GXTexObj *obj, GXTexWrapMode s, GXTexWrapMode t);

#endif
