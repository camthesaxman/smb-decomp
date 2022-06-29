#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "gxcache.h"
#include "gxutil.h"
#define MATHUTIL_SIN_INT_PARAM
#include "mathutil.h"
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
    u8 filler0[4];
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
    float unk140;
    float unk144;
    float unk148;
    struct Color3f unk14C;
    float unk158;
    float unk15C;
    float unk160;
    s8 unk164;
    s16 unk166;
    u8 filler168[4];
} lbl_802B37F0;

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
        lbl_802B37F0.unk134.r += (lbl_802B37F0.unk140 - lbl_802B37F0.unk134.r) * 0.045;
        lbl_802B37F0.unk134.g += (lbl_802B37F0.unk144 - lbl_802B37F0.unk134.g) * 0.045;
        lbl_802B37F0.unk134.b += (lbl_802B37F0.unk148 - lbl_802B37F0.unk134.b) * 0.045;
        lbl_802B37F0.unk14C.r += (lbl_802B37F0.unk158 - lbl_802B37F0.unk14C.r) * 0.045;
        lbl_802B37F0.unk14C.g += (lbl_802B37F0.unk15C - lbl_802B37F0.unk14C.g) * 0.045;
        lbl_802B37F0.unk14C.b += (lbl_802B37F0.unk160 - lbl_802B37F0.unk14C.b) * 0.045;
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
    params.v1 = ((18.0f * (lbl_802B37F0.unk164 - 48)) + 0.5f) / 256.0f;
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
    params.x = -24 - lbl_802B37F0.unk166 + lbl_802B37F0.unk12C;
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
