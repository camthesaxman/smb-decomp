#ifndef _DOLPHIN_GXGEOMETRY_H_
#define _DOLPHIN_GXGEOMETRY_H_

void GXSetVtxDesc(GXAttr attr, GXAttrType type);
void GXClearVtxDesc(void);
void GXSetNumTexGens(u8 nTexGens);
void GXBegin(GXPrimitive type, GXVtxFmt vtxfmt, u16 nverts);
void GXSetTexCoordGen2(GXTexCoordID dst_coord, GXTexGenType func,
    GXTexGenSrc src_param, u32 mtx, GXBool normalize, u32 postmtx);

#endif
