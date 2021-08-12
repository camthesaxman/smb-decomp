#ifndef _DOLPHIN_GXGEOMETRY_H_
#define _DOLPHIN_GXGEOMETRY_H_

void GXSetVtxDesc(GXAttr attr, GXAttrType type);
void GXClearVtxDesc(void);
void GXSetVtxAttrFmt(GXVtxFmt vtxfmt, GXAttr attr, GXCompCnt cnt,
    GXCompType type, u8 frac);
void GXSetNumTexGens(u8 nTexGens);
void GXBegin(GXPrimitive type, GXVtxFmt vtxfmt, u16 nverts);
void GXSetTexCoordGen2(GXTexCoordID dst_coord, GXTexGenType func,
    GXTexGenSrc src_param, u32 mtx, GXBool normalize, u32 postmtx);
void GXSetLineWidth(u8 width, GXTexOffset texOffsets);

static inline void GXSetTexCoordGen(GXTexCoordID dst_coord, GXTexGenType func,
    GXTexGenSrc src_param, u32 mtx)
{
    GXSetTexCoordGen2(dst_coord, func, src_param, mtx, GX_FALSE, GX_PTIDENTITY);
}

#endif
