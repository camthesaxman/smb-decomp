#ifndef _DOLPHIN_GXGET_H_
#define _DOLPHIN_GXGET_H_

GXBool GXGetTexObjMipMap(GXTexObj *tex_obj);
GXTexFmt GXGetTexObjFmt(GXTexObj *tex_obj);
u16 GXGetTexObjHeight(GXTexObj *tex_obj);
u16 GXGetTexObjWidth(GXTexObj *tex_obj);
void *GXGetTexObjData(GXTexObj *tex_obj);
void GXGetProjectionv(f32 *p);

#endif
