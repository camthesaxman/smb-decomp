#include <dolphin.h>

#include "global.h"
#include "gxcache.h"
#include "gxutil.h"
#include "mathutil.h"

struct Struct800870EC
{
    float unk0;
    float unk4;
    float unk8;
};

void func_800870EC(int x1, int y1, int x2, int y2, struct Color3f *arg4, float arg8)
{
    float r1, g1, b1;
    float r2, g2, b2;
    float r3, g3, b3;
    GXColor color1;
    GXColor color2;
    float z;

    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0));

    r1 = arg4->r;
    r2 = r1;
    if (r1 > 255.0f)
        r2 = 255.0f;

    g1 = arg4->g;
    g2 = g1;
    if (g1 > 255.0f)
        g2 = 255.0f;

    b1 = arg4->b;
    b2 = b1;
    if (b1 > 255.0f)
        b2 = 255.0f;

    color1.r = r2;
    color1.g = g2;
    color1.b = b2;

    r3 = r1 * 0.8;
    if (r3 > 255.0f)
        r3 = 255.0f;
    g3 = g1 * 0.7;
    if (g3 > 255.0f)
        g3 = 255.0f;
    b3 = b1 * 0.6;
    if (b3 > 255.0f)
        b3 = 255.0f;

    color2.r = r3;
    color2.g = g3;
    color2.b = b3;

    GXSetBlendMode_cached(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    {
        GXColor fogColor = {0};
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, fogColor);
    }
    {GXColor unused; unused.r = 1;}
    GXSetChanCtrl(GX_COLOR0A0, 0U, GX_SRC_VTX, GX_SRC_VTX, 0U, GX_DF_CLAMP, GX_AF_SPOT);
    GXSetCullMode_cached(GX_CULL_NONE);
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE0, GX_TEV_KASEL_1);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_RASC);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetNumTevStages_cached(1);
    GXSetNumChans(1);
    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    mathutil_mtxA_pop();
    z = -arg8;

    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3f32(x2, y1, z);
        GXColor4u8(color2.r, color2.g, color2.b, 255);
        GXPosition3f32(x1, y1, z);
        GXColor4u8(color1.r, color1.g, color1.b, 255);
        GXPosition3f32(x1, y2, z);
        GXColor4u8(color1.r, color1.g, color1.b, 255);
        GXPosition3f32(x2, y2, z);
        GXColor4u8(color2.r, color2.g, color2.b, 255);
    GXEnd();
}

u32 lbl_801C7948[] =
{
    0,
    0x432B0000,
    0x42200000,
    0,
    0x42AC0000,
    0x43640000,
    0x437F0000,
    0x43230000,
    0x42100000,
    0x43640000,
    0x41500000,
    0x41600000,
    0x43330000,
    0x43660000,
    0x433F0000,
    0x43330000,
    0x434D0000,
    0x43770000,
    0x437F0000,
    0x43640000,
    0x433E0000,
    0x43770000,
    0x43370000,
    0x43370000,
    0x300000EE,
    0x310000F6,
    0x320000CC,
    0x330000D1,
};

u32 lbl_801C79B8[] =
{
    0x03070302,
    0x03060305,
    0x03040306,
    0x03030000,
};

u32 lbl_801C79C8[] =
{
    0x43160000,
    0x42800000,
    0,
    0x434F0000,
    0x42980000,
    0,
    0x43838000,
    0x42800000,
    0,
    0x439F8000,
    0x429C0000,
    0,
    0x43BC0000,
    0x42800000,
    0,
    0x43D88000,
    0x42980000,
    0,
    0x43F50000,
    0x42800000,
    0,
};
