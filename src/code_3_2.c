#include <stdlib.h>
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

struct Struct802B37F0_sub
{
    u8 filler0[2];
    s16 unk2;
    s16 unk4;
    u8 filler6[0xC-0x6];
    float unkC;
    float unk10;
    float unk14;
};  // size = 0x18

struct Struct802B37F0_sub2
{
    float unk0;
    float unk4;
    s32 unk8;
    u32 unkC;
    u32 unk10;
};  // size = 0x14

struct
{
    u8 filler0[4];
    u32 unk4;
    s32 unk8;
    float unkC;
    float unk10;
    u8 filler14[4];
    u32 unk18;
    s32 unk1C;
    struct Struct802B37F0_sub unk20[7];
    struct Struct802B37F0_sub2 unkC8[5];
    s32 unk12C;
    s32 unk130;
    float unk134;
    float unk138;
    float unk13C;
    float unk140;
    float unk144;
    float unk148;
    float unk14C;
    float unk150;
    float unk154;
    float unk158;
    float unk15C;
    float unk160;
    u8 filler164[0x16C-0x164];
} lbl_802B37F0;

void func_800874B0(void)
{
    int i;
    struct Struct802B37F0_sub2 *temp_r3;
    struct Struct802B37F0_sub *var_r28;
    struct Struct802B37F0_sub *var_r29;

    if (!(gamePauseStatus & 0xA))
    {
        switch (lbl_802B37F0.unk4)
        {
        case 1:
            if (lbl_802B37F0.unk12C == 0)
            {
                if (lbl_802B37F0.unk18 & 1)
                    lbl_802B37F0.unk4 = 3;
                else
                {
                    lbl_802B37F0.unk4 = 2;
                    lbl_802B37F0.unk8 = 0x5A;
                }
                lbl_802B37F0.unk134 = 512.0f;
                lbl_802B37F0.unk138 = 512.0f;
                lbl_802B37F0.unk13C = 512.0f;
            }
            else
                lbl_802B37F0.unk4 = 3;
            lbl_802B37F0.unk130 = 0x280;
            break;
        case 2:
            lbl_802B37F0.unk8--;
            if (lbl_802B37F0.unk8 < 0)
                lbl_802B37F0.unk4 = 3;
            break;
        case 3:
            if (lbl_802B37F0.unk1C != 0)
                lbl_802B37F0.unk4 = 5;
            else
            {
                lbl_802B37F0.unk4 = 4;
                lbl_802B37F0.unk8 = 0;
                lbl_802B37F0.unk1C = 1;
                var_r28 = lbl_802B37F0.unk20;
                for (i = 7; i > 0; i--, var_r28++)
                {
                    var_r28->unk2 = rand() & 0x7FFF;
                    var_r28->unk4 = ((rand() & 0x3FFF) - 0x1FFF);
                    var_r28->unkC = -32.0 + -128.0 * (rand() / 32767.0f);
                    var_r28->unk14 = 16.0 * (rand() / 32767.0f);
                }
            }
            lbl_802B37F0.unk10 = 1.0f;
            break;
        case 4:
            lbl_802B37F0.unk8--;
            if (lbl_802B37F0.unk8 < 0)
                lbl_802B37F0.unk4 = 5;
            break;
        case 5:
            lbl_802B37F0.unk4 = 7;
            temp_r3 = lbl_802B37F0.unkC8;
            for (i = 0; i < 5; i++, temp_r3++)
            {
                if (temp_r3->unk0 == 640.0f)
                {
                    temp_r3->unk8 = i * 12;
                    temp_r3->unk4 = 0.0f;
                }
            }
            break;
        case 8:
            lbl_802B37F0.unk4 = 0;
            lbl_802B37F0.unk130 = 0;
            lbl_802B37F0.unk10 = 0.0f;
            func_80088A10();
            break;
        }
        if (lbl_802B37F0.unk1C != 0)
        {
            var_r29 = lbl_802B37F0.unk20;
            for (i = 7; i > 0; i--, var_r29++)
            {
                var_r29->unk14 += 0.512;
                var_r29->unkC += var_r29->unk14;
                var_r29->unk4 -= var_r29->unk4 >> 5;
                var_r29->unk2 += var_r29->unk4;
                if (var_r29->unkC > var_r29->unk10)
                {
                    var_r29->unkC = var_r29->unk10;
                    if (var_r29->unk14 > 0.0)
                        var_r29->unk14 *= -0.15 * (3.0 - mathutil_sin(var_r29->unk2 + 0x4000));
                    if (var_r29->unk2 > -16 && var_r29->unk2 < 16)
                    {
                        if (var_r29->unk2 < 0)
                            var_r29->unk2++;
                        else if (var_r29->unk2 > 0)
                            var_r29->unk2--;
                    }
                    else
                        var_r29->unk2 -= var_r29->unk2 >> 4;
                    var_r29->unk4 >>= 2;
                    var_r29->unk4 -= var_r29->unk2 >> 4;
                }
            }
        }

        if (lbl_802B37F0.unkC > lbl_802B37F0.unk10)
        {
            lbl_802B37F0.unkC -= 0.03333333333333333;
            if (lbl_802B37F0.unkC < lbl_802B37F0.unk10)
                lbl_802B37F0.unkC = lbl_802B37F0.unk10;
        }
        else if (lbl_802B37F0.unkC < lbl_802B37F0.unk10)
        {
            lbl_802B37F0.unkC += 0.03333333333333333;
            if (lbl_802B37F0.unkC > lbl_802B37F0.unk10)
                lbl_802B37F0.unkC = lbl_802B37F0.unk10;
        }

        temp_r3 = lbl_802B37F0.unkC8;
        for (i = 0; i < 5; i++, temp_r3++)
        {
            if (temp_r3->unkC != 0)
            {
                if (temp_r3->unk8 > 0)
                    temp_r3->unk8--;
                else
                {
                    if (temp_r3->unk10 != 0)
                        temp_r3->unk4 = -562.0f;
                    if (temp_r3->unk0 > temp_r3->unk4)
                    {
                        temp_r3->unk0 -= 21.333333333333332;
                        if (temp_r3->unk0 < temp_r3->unk4)
                            temp_r3->unk0 = temp_r3->unk4;
                    }
                    else if (temp_r3->unk0 < temp_r3->unk4)
                    {
                        temp_r3->unk0 += 21.333333333333332;
                        if (temp_r3->unk0 > temp_r3->unk4)
                            temp_r3->unk0 = temp_r3->unk4;
                    }
                    if (temp_r3->unk0 == -562.0f)
                    {
                        temp_r3->unk0 = 640.0f;
                        temp_r3->unk4 = 0.0f;
                        temp_r3->unkC = temp_r3->unk10;
                        temp_r3->unk10 = 0;
                        temp_r3->unk8 = 0;
                    }
                }
            }
        }
        if (lbl_802B37F0.unk12C < lbl_802B37F0.unk130)
        {
            lbl_802B37F0.unk12C += 0x15;
            if (lbl_802B37F0.unk12C > lbl_802B37F0.unk130)
                lbl_802B37F0.unk12C = lbl_802B37F0.unk130;
        }
        else if (lbl_802B37F0.unk12C > lbl_802B37F0.unk130)
        {
            lbl_802B37F0.unk12C -= 0x15;
            if (lbl_802B37F0.unk12C < lbl_802B37F0.unk130)
                lbl_802B37F0.unk12C = lbl_802B37F0.unk130;
        }
        lbl_802B37F0.unk134 += (lbl_802B37F0.unk140 - lbl_802B37F0.unk134) * 0.045;
        lbl_802B37F0.unk138 += (lbl_802B37F0.unk144 - lbl_802B37F0.unk138) * 0.045;
        lbl_802B37F0.unk13C += (lbl_802B37F0.unk148 - lbl_802B37F0.unk13C) * 0.045;
        lbl_802B37F0.unk14C += (lbl_802B37F0.unk158 - lbl_802B37F0.unk14C) * 0.045;
        lbl_802B37F0.unk150 += (lbl_802B37F0.unk15C - lbl_802B37F0.unk150) * 0.045;
        lbl_802B37F0.unk154 += (lbl_802B37F0.unk160 - lbl_802B37F0.unk154) * 0.045;
        if (lbl_802B37F0.unk12C == 0 && lbl_802B37F0.unk10 == lbl_802B37F0.unkC && func_80088AF4() != 0)
            func_800885EC();
    }
}
