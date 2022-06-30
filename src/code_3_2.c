#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "gxcache.h"
#include "gxutil.h"
#define MATHUTIL_SIN_INT_PARAM
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"

struct Struct800870EC
{
    float unk0;
    float unk4;
    float unk8;
};


void func_800870EC(int x1, int y1, int x2, int y2, struct Color3f *arg4, int unused, float arg8)
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

// size = 0xC
/*
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
*/

struct Color3f lbl_801C7948[] =
{
    {   0, 171,  40 },
    {   0,  86, 228 },
    { 255, 163,  36 },
    { 228,  13,  14 },
};

#pragma force_active on
struct Color3f lbl_801C7948_2[] =
{
    { 179, 230, 191 },
    { 179, 205, 247 },
    { 255, 228, 190 },
    { 247, 183, 183 },
};

struct Struct802B37F0_sub3
{
    s8 unk0;
    s16 unk2;
};

struct Struct802B37F0_sub3 lbl_801C7948_3[] =
{
    { 0x30, 0x00EE },
    { 0x31, 0x00F6 },
    { 0x32, 0x00CC },
    { 0x33, 0x00D1 },
};
#pragma force_active reset

s16 lbl_801C79B8[] =
{
    0x0307, 0x0302,
    0x0306, 0x0305,
    0x0304, 0x0306,
    0x0303, 0x0000,
};

struct Struct801C79C8
{
    float unk0;
    float unk4;
    float unk8;
};

struct Struct801C79C8 lbl_801C79C8[] =
{
    { 150, 64, 0 },
    { 207, 76, 0 },
    { 263, 64, 0 },
    { 319, 78, 0 },
    { 376, 64, 0 },
    { 433, 76, 0 },
    { 490, 64, 0 },
};


struct Struct802B37F0_sub
{
    s16 unk0;
    s16 unk2;
    s16 unk4;
    u8 filler6[2];
    float unk8;
    float unkC;
    float unk10;
    float unk14;
};  // size = 0x18

struct Struct802B37F0_sub2_child
{
    char unk0[4];
    u32 unk4;
    u8 filler8[4];
    u8 unkC;
    s8 unkD;
};

struct Struct802B37F0_sub2
{
    float unk0;
    float unk4;
    s32 unk8;
    struct Struct802B37F0_sub2_child *unkC;
    struct Struct802B37F0_sub2_child *unk10;
};  // size = 0x14

struct
{
    s32 unk0;
    u32 unk4;
    s32 unk8;
    float unkC;
    float unk10;
    float unk14;
    u32 unk18;
    s32 unk1C;
    struct Struct802B37F0_sub unk20[7];
    struct Struct802B37F0_sub2 unkC8[5];
    s32 unk12C;
    s32 unk130;
    struct Color3f unk134;
    struct Color3f unk140;
    struct Color3f unk14C;
    struct Color3f unk158;
    //s8 unk164;
    //u32 unk164;
    //s16 unk166;
    struct Struct802B37F0_sub3 unk164;
    void *unk168;
} lbl_802B37F0;

void *func_800AEC74();

void func_80088230(int arg0, int arg1, int arg2, struct Struct802B37F0_sub2_child *arg3);

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
                lbl_802B37F0.unk134.r = 512.0f;
                lbl_802B37F0.unk134.g = 512.0f;
                lbl_802B37F0.unk134.b = 512.0f;
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
        lbl_802B37F0.unk134.r += (lbl_802B37F0.unk140.r - lbl_802B37F0.unk134.r) * 0.045;
        lbl_802B37F0.unk134.g += (lbl_802B37F0.unk140.g - lbl_802B37F0.unk134.g) * 0.045;
        lbl_802B37F0.unk134.b += (lbl_802B37F0.unk140.b - lbl_802B37F0.unk134.b) * 0.045;
        lbl_802B37F0.unk14C.r += (lbl_802B37F0.unk158.r - lbl_802B37F0.unk14C.r) * 0.045;
        lbl_802B37F0.unk14C.g += (lbl_802B37F0.unk158.g - lbl_802B37F0.unk14C.g) * 0.045;
        lbl_802B37F0.unk14C.b += (lbl_802B37F0.unk158.b - lbl_802B37F0.unk14C.b) * 0.045;
        if (lbl_802B37F0.unk12C == 0 && lbl_802B37F0.unk10 == lbl_802B37F0.unkC && func_80088AF4() != 0)
            func_800885EC();
    }
}

void func_80087B10(void)
{
    struct NaomiSpriteParams params;
    u8 unused[0x88];
    int var_r30;
    int var_r22;
    int y;
    int x;
    int var_r29;
    struct Struct802B37F0_sub2 *var_r28;
    struct Struct802B37F0_sub2_child *temp_r23;
    struct Struct802B37F0_sub *var_r24;

    if (lbl_802B37F0.unk1C != 0)
    {
        params.z = 1.02f;
        params.opacity = lbl_802B37F0.unkC;
        params.unk30 = 2;
        params.flags = 0xA;
        params.mulColor = RGBA(255, 255, 255, 0);
        params.addColor = 0;
        params.scaleX = 1.0f;
        params.scaleY = 1.0f;
        params.u1 = 0.0f;
        params.v1 = 0.0f;
        params.u2 = 1.0f;
        params.v2 = 1.0f;

        var_r24 = lbl_802B37F0.unk20;
        for (var_r22 = 7; var_r22 > 0; var_r22--, var_r24++)
        {
            params.bmpId = var_r24->unk0;
            params.rotation = var_r24->unk2;
            params.x = (int)var_r24->unk8;
            params.y = (int)(var_r24->unkC + lbl_802B37F0.unk14);
            draw_naomi_sprite(&params);
        }
    }

    y = 60.0f + lbl_802B37F0.unk14;
    params.bmpId = BMP_RNK_rnk_lines;
    params.z = 1.03f;
    params.rotation = 0;
    params.opacity = lbl_802B37F0.unkC;
    params.unk30 = 2;
    params.flags = 5;
    params.mulColor = RGBA(255, 255, 255, 0);
    params.addColor = 0;

    params.x = 26.0f;
    params.y = y;
    params.scaleX = 1.0f;
    params.scaleY = 0.26171875f;
    params.u1 = 0.0f;
    params.v1 = 0.26171875f;
    params.u2 = 1.0f;
    params.v2 = 0.5234375f;
    draw_naomi_sprite(&params);

    params.x = 282.0f;
    params.y = y;
    params.scaleX = 0.296875f;
    params.scaleY = 0.26171875f;
    params.u1 = 0.0f;
    params.v1 = 0.5234375f;
    params.u2 = 0.296875f;
    params.v2 = 0.78515625f;
    draw_naomi_sprite(&params);

    params.x = 358.0f;
    params.y = y;
    params.scaleX = 1.0f;
    params.scaleY = 0.26171875f;
    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 0.26171875f;
    draw_naomi_sprite(&params);

    reset_text_draw_settings();
    set_text_font(FONT_ICON_TPL);
    func_80071B1C(1.03f);
    set_text_opacity(lbl_802B37F0.unkC);
    set_text_pos(65.0f, 136.0f + lbl_802B37F0.unk14);
    u_draw_char(0x30);
    set_text_pos(180.0f, 136.0f + lbl_802B37F0.unk14);
    u_draw_char(0x31);
    set_text_pos(289.0f, 136.0f + lbl_802B37F0.unk14);
    u_draw_char(0x32);
    set_text_pos(460.0f, 136.0f + lbl_802B37F0.unk14);
    u_draw_char(0x33);
    set_text_opacity(1.0f);

    params.bmpId = BMP_RNK_rnk_lines;
    params.z = 1.03f;
    params.rotation = 0;
    params.opacity = 1.0f;
    params.unk30 = 2;
    params.flags = 5;
    params.mulColor = RGBA(255, 255, 255, 0);
    params.addColor = 0;

    var_r29 = 160.0f + lbl_802B37F0.unk14;
    var_r28 = lbl_802B37F0.unkC8;
    for (var_r30 = 0; var_r30 < 5; var_r30++, var_r29 += 46, var_r28++)
    {
        temp_r23 = var_r28->unkC;
        if (temp_r23 != NULL)
        {
            x = var_r28->unk0;
            set_text_font(FONT_ICON_RNK);
            set_text_pos(x + 0x41, var_r29);
            u_draw_char(var_r30 + 0x31);
            set_text_font(FONT_ASC_30x31);
            set_text_pos(x + 172, var_r29);
            u_draw_text(temp_r23->unk0);
            func_80088230(var_r30, x, var_r29, temp_r23);
            set_text_font(FONT_NUM_26x31);
            set_text_pos(x + 396, var_r29);
            func_80072AC0("%07d", temp_r23->unk4);

            params.x = x + 39;
            params.y = var_r29 + 0x20;
            params.scaleX = 1.0f;
            params.scaleY = 0.0234375f;
            params.u1 = 0.0f;
            params.v1 = 0.9765625f;
            params.u2 = 1.0f;
            params.v2 = 1.0f;
            draw_naomi_sprite(&params);

            params.x += 256.0f;
            params.scaleX = 0.1953125f;
            params.u1 = 0.0f;
            params.v1 = 0.9296875f;
            params.u2 = 0.1953125f;
            params.v2 = 0.953125f;
            draw_naomi_sprite(&params);

            params.x += 50.0f;
            params.scaleX = 1.0f;
            params.u1 = 0.0f;
            params.v1 = 0.953125f;
            params.u2 = 1.0f;
            params.v2 = 0.9765625f;
            draw_naomi_sprite(&params);
        }
    }

    func_800870EC(0, 448, lbl_802B37F0.unk12C, 480, &lbl_802B37F0.unk134, 0, 1.02f);
    func_800870EC(640 - lbl_802B37F0.unk12C, 0, 640, 32, &lbl_802B37F0.unk134, 0, 1.02f);
    func_800870EC(0, 448, lbl_802B37F0.unk12C, 450, &lbl_802B37F0.unk14C, 0, 1.01f);
    func_800870EC(640 - lbl_802B37F0.unk12C, 30, 640, 32, &lbl_802B37F0.unk14C, 0, 1.01f);

    bitmap_init_tev();

    params.z = 1.005f;
    params.rotation = 0;
    params.opacity = 1.0f;
    params.scaleX = 0.9609375f;
    params.scaleY = 0.06640625f;
    params.u1 = 0.0f;
    params.v1 = ((18.0f * (lbl_802B37F0.unk164.unk0 - 48)) + 0.5f) / 256.0f;
    params.u2 = 0.9609375f;
    params.v2 = params.v1 + 0.06640625f;
    params.unk30 = 2;
    params.flags = 5;
    params.mulColor = RGBA(255, 255, 255, 0);
    params.addColor = 0;
    params.bmpId = 0x311;
    params.x = 0x298 - lbl_802B37F0.unk12C;
    params.y = 7.0f;
    draw_naomi_sprite(&params);
    params.x = -24 - lbl_802B37F0.unk164.unk2 + lbl_802B37F0.unk12C;
    params.y = 455.0f;
    draw_naomi_sprite(&params);
}

void func_80088230(int arg0, int arg1, int arg2, struct Struct802B37F0_sub2_child *arg3)
{
    struct NaomiSpriteParams params;
    char text[8];
    double x = (float)arg1;
    float  y = (float)arg2;
    float temp_f29;
    s32 r, g, b;
    u8 unused[4];
    int len;
    s16 var;

    params.z = 1.03f;
    params.rotation = 0;
    params.opacity = 1.0f;
    params.unk30 = 2;
    params.flags = 0x20005;
    params.mulColor = RGBA(255, 255, 255, 0);
    params.addColor = 0;

    switch (arg3->unkD)
    {
    case 0:
        set_text_font(FONT_NUM_26x31);
        if (arg3->unkC == 0xFF)
        {
            set_text_pos(302.0 + x, y);
            u_draw_text("--");
            return;
        }
        sprintf(text, "%d", arg3->unkC);
        len = strlen(text);
        set_text_pos(328.0 + x - len * 13.0, y);
        u_draw_text(text);
        break;
    case 1:
        set_text_font(FONT_NUM_26x31);
        sprintf(text, "%d", arg3->unkC);
        set_text_pos(32.0 + (x = 328.0 + x - 29.0), y);
        u_draw_text(text);
        params.bmpId = BMP_RNK_rnk_ex_icon;
        params.x = x;
        params.y = y;
        params.scaleX = 0.96875f;
        params.scaleY = 0.96875f;
        params.u1 = 0.0f;
        params.v1 = 0.0f;
        params.u2 = 0.96875f;
        params.v2 = 0.96875f;
        draw_naomi_sprite(&params);
        break;
    default:
        func_80073E00(BMP_RNK_rnk_ex2_icon, 1, 1);
        x = 328.0 + x;
        params.bmpId = BMP_RNK_rnk_ex2_icon;
        params.x = x - 47.0;
        params.y = y;
        params.scaleX = 0.7265625f;
        params.scaleY = 0.96875f;
        params.u1 = 0.0f;
        params.v1 = 0.0f;
        params.u2 = params.u1 + 0.7265625;
        params.v2 = 0.96875f;
        var = ((unpausedFrameCounter << 10) + arg0);
        temp_f29 = 384.0 * (mathutil_sin(var) - 0.5);
        if (temp_f29 > 0.0)
        {
            if (temp_f29 < 128.0f)
                set_text_opacity(1.0f - (0.0078125f * temp_f29));
            else
                set_text_opacity(0.0f);
            r = (int)temp_f29 - 0;
            g = (int)temp_f29 - 24;
            b = (int)temp_f29 - 64;
            if (r < 0)
                r = 0;
            else if (r > 255)
                r = 255;
            if (g < 0)
                g = 0;
            else if (g > 255)
                g = 255;
            if (b < 0)
                b = 0;
            else if (b > 255)
                b = 255;
            params.addColor = RGBA(r, g, b, 0);
        }
        draw_naomi_sprite(&params);
        sprintf(text, "%d", arg3->unkC);
        len = strlen(text);
        set_text_pos(x - len * 13.0, y);
        func_80071B1C(0.09f);
        u_draw_text(text);
        set_text_opacity(1.0f);
        break;
    }
}

#ifdef NONMATCHING
void func_800885EC(void)
{
    int i;
    struct Struct802B37F0_sub *var;
    struct Struct801C79C8 *var2;
    s16 *var3;

    lbl_802B37F0.unk0 = 0;
    lbl_802B37F0.unk4 = 0;
    lbl_802B37F0.unk1C = 0;

    var2 = lbl_801C79C8;
    var = lbl_802B37F0.unk20;
    var3 = lbl_801C79B8;

    for (i = 0; i < 7; i++, var++)
    {
        var2 = &lbl_801C79C8[i];
        var->unk0 = var3[i];
        var->unk8 = lbl_801C79C8[i].unk0;
        var->unk10 = lbl_801C79C8[i].unk4;
        !var2;
    }
    !var;
    lbl_802B37F0.unkC = 0.0f;
    lbl_802B37F0.unk10 = 0.0f;
    lbl_802B37F0.unk12C = 0;
    lbl_802B37F0.unk130 = 0;
}
#else
asm void func_800885EC(void)
{
    nofralloc
#include "../asm/nonmatchings/func_800885EC.s"
}
#pragma peephole on
#endif

void lbl_800889AC(s8 *, struct Sprite *);
void lbl_800889F0(struct Sprite *);

void func_800886E0(int arg0)
{
    int temp_r31;
    struct Sprite *sprite;
    struct Struct802B37F0_sub2_child *temp_r4;
    struct Struct802B37F0_sub2 *temp_r5;
    int i;
    int var;

    temp_r31 = !lbl_802B37F0.unk0;
    if (lbl_802B37F0.unk0 == 0)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->mainFunc = lbl_800889AC;
            sprite->drawFunc = lbl_800889F0;
            strcpy(sprite->text, "RANKING");
        }
    }
    lbl_802B37F0.unk0 = 1;
    lbl_802B37F0.unk4 = 1;
    lbl_802B37F0.unk140 = lbl_801C7948[arg0];
    lbl_802B37F0.unk158 = lbl_801C7948_2[arg0];
    lbl_802B37F0.unk164 = lbl_801C7948_3[arg0];
    switch (gameMode)
    {
    case 5:
        lbl_802B37F0.unk14 = 32.0f;
        lbl_802B37F0.unk18 = 1;
        break;
    default:
        lbl_802B37F0.unk14 = 0.0f;
        lbl_802B37F0.unk18 = 0;
        break;
    }
    lbl_802B37F0.unk168 = func_800AEC74(arg0, 0);

    var = 0;
    temp_r5 = lbl_802B37F0.unkC8;
    temp_r4 = lbl_802B37F0.unk168;
    for (i = 0; i < 5; i++, temp_r5++, temp_r4++)
    {
        temp_r5->unk8 = var;
        if (temp_r31 != 0)
        {
            temp_r5->unkC = temp_r4;
            temp_r5->unk10 = 0;
            temp_r5->unk4 = 640.0f;
            temp_r5->unk0 = temp_r5->unk4;
        }
        else if (temp_r5->unkC != 0)
            temp_r5->unk10 = temp_r4;
        else
            temp_r5->unkC = temp_r4;
        var += 12;
    }
}

void func_8008897C(int arg0)
{
    if (lbl_802B37F0.unk0 != 0)
    {
        if (arg0 != 0)
            lbl_802B37F0.unk0 = 0;
        else
            lbl_802B37F0.unk4 = 8;
    }
}

void lbl_800889AC(s8 *arg0, struct Sprite *sprite)
{
    func_800874B0();
    if (lbl_802B37F0.unk0 == 0)
        *arg0 = 0;
}

void lbl_800889F0(struct Sprite *sprite)
{
    func_80087B10();
}

void func_80088A10(void)
{
    struct Struct802B37F0_sub2 *temp_r4;
    int i;
    int var;

    var = 0;
    temp_r4 = lbl_802B37F0.unkC8;
    for (i = 0; i < 5; i++, temp_r4++)
    {
        temp_r4->unk4 = -562.0f;
        temp_r4->unk10 = 0;
        if (temp_r4->unk0 == 0.0f && temp_r4->unk8 == 0)
            temp_r4->unk8 = var;
        var += 12;
    }
}

int func_80088AF4(void)
{
    struct Struct802B37F0_sub2 *temp_r3;
    int i;
    int var = TRUE;

    temp_r3 = lbl_802B37F0.unkC8;
    for (i = 0; i < 5; i++, temp_r3++)
    {
        if (temp_r3->unkC != NULL
         && temp_r3->unk4 != temp_r3->unk0
         && temp_r3->unk8 <= 0)
        {
            var = FALSE;
            break;
        }
    }
    if (!var)
        return FALSE;
    else
        return TRUE;
}

int func_80088C18(void)
{
    return lbl_802B37F0.unk12C;
}

void lbl_80088CB0(s8 *, struct Sprite *);

void func_80088C28(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = 1;
        sprite->tag = 3;
        sprite->x = 8.0f;
        sprite->y = 8.0f;
        sprite->mulR = 0xFF;
        sprite->mulG = 0xFF;
        sprite->mulB = 0xFF;
        sprite->textAlign = 0;
        sprite->bmpId = 0x30C;
        sprite->unk4C = 0.26f;
        sprite->mainFunc = lbl_80088CB0;
        strcpy(sprite->text, "RNK TITILE");
    }
}

struct
{
    s32 unk0;  // 0x16C
    u32 unk4;  // 0x170
    float unk8;  // 0x174
    float unkC;  // 0x178
    float unk10;  // 0x17C
    float unk14;  // 0x180
    s16 unk18;  // 0x184
    u8 filler1A[2];
    struct ReplayInfo unk1C;
    u32 unk34;  // 0x1A0
    u32 unk38;  // 0x1A4
    char unk3C[0x64-0x3C];  // 0x1A8
} lbl_802B395C;

void lbl_80088CB0(s8 *arg0, struct Sprite *sprite)
{
    float temp_f4 = lbl_802B37F0.unk12C;

    if (128.0 + sprite->x > 640.0 - temp_f4)
    {
        sprite->x = 640.0 - temp_f4 - 128.0;
        sprite->rotation += 0x400;
    }
    if (temp_f4 >= 640.0)
        *arg0 = 0;
}

void func_80088D44(void)
{
    int len;

    lbl_802B395C.unk34 = 0xFFFFFF;
    lbl_802B395C.unk38 = 0;
    if (lbl_802B395C.unk1C.flags & 0x20)
    {
        lbl_802B395C.unk34 = 0xFFFF00;
        lbl_802B395C.unk38 = 0x404040;
    }
    if (lbl_802B395C.unk1C.flags & 0x40)
        sprintf(lbl_802B395C.unk3C, "MASTER %d", lbl_802B395C.unk1C.floorNum);
    else if (lbl_802B395C.unk1C.flags & 0x20)
        sprintf(lbl_802B395C.unk3C, "EXTRA %d", lbl_802B395C.unk1C.floorNum);
    else
        sprintf(lbl_802B395C.unk3C, "FLOOR %d", lbl_802B395C.unk1C.floorNum);
    lbl_802B395C.unk14 = 40.0 + (float)strlen(lbl_802B395C.unk3C) * 20.0;
    len = strlen(lbl_802B395C.unk3C) * 20;
    lbl_802B395C.unk14 = 40.0 + (float)len;
}

void func_80088E90(void)
{
    lbl_802B395C.unk0 = 0;
    lbl_802B395C.unk4 = 1;
    lbl_802B395C.unk18 = lbl_80250A68.unk0[lbl_80250A68.unk14];
    u_get_replay_info(lbl_802B395C.unk18, &lbl_802B395C.unk1C);
    func_80088D44();
    lbl_802B395C.unk8 = -lbl_802B395C.unk14;
    lbl_802B395C.unkC = 0.0f;
    lbl_802B395C.unk10 = lbl_802B395C.unk8;
}

void lbl_80089070(s8 *, struct Sprite *);
void lbl_800890B4(struct Sprite *);

void func_80088F18(void)
{
    s32 temp_r31;
    struct Sprite *sprite;

    temp_r31 = !lbl_802B395C.unk0;
    if (lbl_802B395C.unk0 == 0)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->mainFunc = lbl_80089070;
            sprite->drawFunc = lbl_800890B4;
            strcpy(sprite->text, "RANKING");
        }
    }
    lbl_802B395C.unk0 = 1;
    lbl_802B395C.unk4 = 1;
    if (temp_r31 != 0)
    {
        lbl_802B395C.unk18 = lbl_80250A68.unk0[lbl_80250A68.unk14];
        u_get_replay_info(lbl_802B395C.unk18, &lbl_802B395C.unk1C);
        func_80088D44();
    }
}

void func_80088FD4(int arg0)
{
    if (arg0 != 0)
        func_80088E90();
    else
        lbl_802B395C.unk4 = 4;
}

void func_800890D4(void);

void lbl_80089070(s8 *arg0, struct Sprite *sprite)
{
    func_800890D4();
    if (lbl_802B395C.unk0 == 0)
        *arg0 = 0;
}

void func_8008923C(void);

void lbl_800890B4(struct Sprite *sprite)
{
    func_8008923C();
}

void func_800890D4(void)
{
    float temp_f1;

    switch (lbl_802B395C.unk4)
    {
    case 1:
        lbl_802B395C.unk4 = 2;
        lbl_802B395C.unk10 = 8.0f;
        break;
    case 2:
        if (lbl_802B395C.unk18 != lbl_80250A68.unk0[lbl_80250A68.unk14])
        {
            lbl_802B395C.unk4 = 3;
            lbl_802B395C.unk10 = -lbl_802B395C.unk14;
        }
        break;
    case 3:
        if (lbl_802B395C.unk8 == lbl_802B395C.unk10)
        {
            lbl_802B395C.unk4 = 1;
            lbl_802B395C.unk18 = lbl_80250A68.unk0[lbl_80250A68.unk14];
            u_get_replay_info(lbl_802B395C.unk18, &lbl_802B395C.unk1C);
            func_80088D44();
        }
        break;
    case 4:
        lbl_802B395C.unk4 = 0;
        lbl_802B395C.unk10 = -lbl_802B395C.unk14;
        break;
    }
    temp_f1 = lbl_802B395C.unk10;
    if (lbl_802B395C.unk8 > temp_f1)
    {
        lbl_802B395C.unk8 -= 10.666666666666666;
        if (lbl_802B395C.unk8 < temp_f1)
            lbl_802B395C.unk8 = temp_f1;
    }
    else if (lbl_802B395C.unk8 < temp_f1)
    {
        lbl_802B395C.unk8 += 10.666666666666666;
        if (lbl_802B395C.unk8 > temp_f1)
            lbl_802B395C.unk8 = temp_f1;
    }
}

void func_8008923C(void)
{
    float var_f31 = lbl_802B395C.unk8;
    float f30 = 8.0f;
    float var_f29;

    if (var_f31 + lbl_802B395C.unk14 > 640.0 - lbl_802B37F0.unk12C)
        var_f31 = (float)(640.0 - lbl_802B37F0.unk12C) - lbl_802B395C.unk14;
    var_f29 = 4.0f + var_f31;
    if (!(lbl_802B395C.unk1C.flags & 0x40))
    {
        reset_text_draw_settings();
        set_text_font(0x5D);
        set_text_scale(0.5f, 0.5f);
        set_text_pos(var_f31, f30 + 4.0f);
        u_draw_char(lbl_802B395C.unk1C.difficulty + 0x34);
        var_f29 = 40.0f + var_f31;
    }
    set_text_font(0x62);
    set_text_scale(1.0f, 1.0f);
    set_text_mul_color(lbl_802B395C.unk34);
    set_text_add_color(lbl_802B395C.unk38);
    set_text_pos(var_f29, f30);
    u_draw_text(lbl_802B395C.unk3C);
    f30 += 20.0f;
    reset_text_draw_settings();
    set_text_font(1);
    set_text_pos(40.0f + var_f31, f30);
    if (lbl_802B395C.unk1C.unk6[0] != 0)
    {
        set_text_mul_color(0xFF8000U);
        set_text_add_color(0x403030U);
        func_80072AC0("%s", lbl_802B395C.unk1C.unk6);
        set_text_mul_color(0xFFFFFFU);
        set_text_add_color(0U);
        u_draw_text("'S ");
    }
    func_80072AC0("REPLAY");
}
