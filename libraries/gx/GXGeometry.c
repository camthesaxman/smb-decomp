#include <dolphin.h>

#include "__gx.h"

static void __GXSetGenMode(void);

void __GXSetDirtyState(void)
{
    if (gx->unk4F0 & 1)
        __GXSetSUTexSize();
    if (gx->unk4F0 & 2)
        __GXUpdateBPMask();
    if (gx->unk4F0 & 4)
        __GXSetGenMode();
    if (gx->unk4F0 & 8)
        __GXSetVCD();
    if (gx->unk4F0 & 0x10)
        __GXSetVAT();
    gx->unk4F0 = 0;
}

void GXBegin(GXPrimitive type, GXVtxFmt vtxfmt, u16 nverts)
{
    if (gx->unk4F0 != 0)
        __GXSetDirtyState();
    if (*(u32 *)gx != 0)
        __GXSendFlushPrim();
    GX_WRITE_U8(vtxfmt | type);
    GX_WRITE_U16(nverts);
}

void __GXSendFlushPrim(void)
{
    u32 temp_r7 = gx->unk0 * gx->unk4;
    int i;

    GX_WRITE_U8(GX_DRAW_TRIANGLE_STRIP);
    GX_WRITE_U16(gx->unk0);
    for (i = 0; i < temp_r7; i += 4)
        GX_WRITE_U32(0);
    gx->unk2 = 0;
}

void GXSetLineWidth(u8 width, GXTexOffset texOffsets)
{
    INSERT_FIELD(gx->unk7C, width,      8,  0);
    INSERT_FIELD(gx->unk7C, texOffsets, 3, 16);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(gx->unk7C);
    gx->unk2 = 1;
}

void GXSetPointSize(u8 pointSize, GXTexOffset texOffsets)
{
    INSERT_FIELD(gx->unk7C, pointSize,  8,  8);
    INSERT_FIELD(gx->unk7C, texOffsets, 3, 19);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(gx->unk7C);
    gx->unk2 = 1;
}

void GXEnableTexOffsets(GXTexCoordID coord, GXBool line_enable, GXBool point_enable)
{
    INSERT_FIELD(gx->unkB8[coord], line_enable,  1, 18);
    INSERT_FIELD(gx->unkB8[coord], point_enable, 1, 19);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(gx->unkB8[coord]);
    gx->unk2 = 1;
}

void GXSetCullMode(GXCullMode mode)
{
    switch (mode)
    {
    case GX_CULL_FRONT:
        mode = GX_CULL_BACK;
        break;
    case GX_CULL_BACK:
        mode = GX_CULL_FRONT;
        break;
    }
    INSERT_FIELD(gx->unk204, mode, 2, 14);
    gx->unk4F0 |= 4;
}

void GXSetCoPlanar(GXBool enable)
{
    INSERT_FIELD(gx->unk204, enable, 1, 19);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(0xFE080000);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(gx->unk204);
}

static void __GXSetGenMode(void)
{
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(gx->unk204);
    gx->unk2 = 1;
}
