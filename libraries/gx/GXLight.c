#include <math.h>
#include <dolphin.h>

#include "__gx.h"

// GXLightObj private fields
typedef struct
{
    u8 filler0[0xC];
    u32 color;
    f32 unk10;
    f32 unk14;
    f32 unk18;
    f32 k0;
    f32 k1;
    f32 k2;
    f32 posX;
    f32 posY;
    f32 posZ;
    f32 dirX;
    f32 dirY;
    f32 dirZ;
} __GXLightObj;

void GXInitLightAttnK(GXLightObj *lt_obj, f32 k0, f32 k1, f32 k2)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;
    __lt_obj->k0 = k0;
    __lt_obj->k1 = k1;
    __lt_obj->k2 = k2;
}

void GXInitLightSpot(GXLightObj *lt_obj, f32 cutoff, GXSpotFn spot_func)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;
    f32 temp_f1;
    f32 tempSq;
    f32 var_f5, var_f2, var_f3;

    if (cutoff <= 0.0f || cutoff > 90.0f)
        spot_func = GX_SP_OFF;

    temp_f1 = cosf((3.1415927f * cutoff) / 180.0f);

    switch (spot_func)
    {
    case GX_SP_FLAT:
        var_f5 = -1000.0f * temp_f1;
        var_f2 = 1000.0f;
        var_f3 = 0.0f;
        break;
    case GX_SP_COS:
        var_f5 = -temp_f1 / (1.0f - temp_f1);
        var_f2 = 1.0f / (1.0f - temp_f1);
        var_f3 = 0.0f;
        break;
    case GX_SP_COS2:
        var_f5 = 0.0f;
        var_f2 = -temp_f1 / (1.0f - temp_f1);
        var_f3 = 1.0f / (1.0f - temp_f1);
        break;
    case GX_SP_SHARP:
        tempSq = 1.0f - temp_f1;
        tempSq = tempSq * tempSq;
        var_f5 = (temp_f1 * (temp_f1 - 2.0f)) / tempSq;
        var_f2 = 2.0f / tempSq;
        var_f3 = -1.0f / tempSq;
        break;
    case GX_SP_RING1:
        tempSq = 1.0f - temp_f1;
        tempSq = tempSq * tempSq;
        var_f5 = (-4.0f * temp_f1) / tempSq;
        var_f2 = (4.0f * (1.0f + temp_f1)) / tempSq;
        var_f3 = -4.0f / tempSq;
        break;
    case GX_SP_RING2:
        tempSq = 1.0f - temp_f1;
        tempSq = tempSq * tempSq;
        var_f5 = 1.0f - ((2.0f * temp_f1 * temp_f1) / tempSq);
        var_f2 = (4.0f * temp_f1) / tempSq;
        var_f3 = -2.0f / tempSq;
        break;
    case GX_SP_OFF:
    default:
        var_f5 = 1.0f;
        var_f2 = 0.0f;
        var_f3 = 0.0f;
        break;
    }
    __lt_obj->unk10 = var_f5;
    __lt_obj->unk14 = var_f2;
    __lt_obj->unk18 = var_f3;
}

void GXInitLightDistAttn(GXLightObj *lt_obj, f32 ref_distance,
    f32 ref_brightness, GXDistAttnFn dist_func)
{
    f32 k0, k1, k2;

    if (ref_distance < 0.0f)
        dist_func = GX_DA_OFF;
    if (ref_brightness <= 0.0f || ref_brightness >= 1.0f)
        dist_func = GX_DA_OFF;

    switch (dist_func)
    {
    case GX_DA_GENTLE:
        k0 = 1.0f;
        k1 = (1.0f - ref_brightness) / (ref_brightness * ref_distance);
        k2 = 0.0f;
        break;
    case GX_DA_MEDIUM:
        k0 = 1.0f;
        k1 = (0.5f * (1.0f - ref_brightness)) / (ref_brightness * ref_distance);
        k2 = (0.5f * (1.0f - ref_brightness)) / (ref_brightness * ref_distance * ref_distance);
        break;
    case GX_DA_STEEP:
        k0 = 1.0f;
        k1 = 0.0f;
        k2 = (1.0f - ref_brightness) / (ref_brightness * ref_distance * ref_distance);
        break;
    case GX_DA_OFF:
    default:
        k0 = 1.0f;
        k1 = 0.0f;
        k2 = 0.0f;
        break;
    }

    GXInitLightAttnK(lt_obj, k0, k1, k2);
}

void GXInitLightPos(GXLightObj *lt_obj, f32 x, f32 y, f32 z)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    __lt_obj->posX = x;
    __lt_obj->posY = y;
    __lt_obj->posZ = z;
}

void GXGetLightPos(GXLightObj *lt_obj, f32 *x, f32 *y, f32 *z)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    *x = __lt_obj->posX;
    *y = __lt_obj->posY;
    *z = __lt_obj->posZ;
}

void GXInitLightDir(GXLightObj *lt_obj, f32 nx, f32 ny, f32 nz)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    __lt_obj->dirX = -nx;
    __lt_obj->dirY = -ny;
    __lt_obj->dirZ = -nz;
}

void GXInitLightColor(GXLightObj *lt_obj, GXColor color)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    __lt_obj->color = (color.r << 24)
                    | (color.g << 16)
                    | (color.b << 8)
                    | color.a;
}

void GXGetLightColor(GXLightObj *lt_obj, GXColor *color)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    color->r = __lt_obj->color >> 24;
    color->g = __lt_obj->color >> 16;
    color->b = __lt_obj->color >> 8;
    color->a = __lt_obj->color;
}

void GXLoadLightObjImm(GXLightObj *lt_obj, GXLightID light)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;
    u32 var_r0;

    switch (light)
    {
    case GX_LIGHT0:
        var_r0 = 0;
        break;
    case GX_LIGHT1:
        var_r0 = 1;
        break;
    case GX_LIGHT2:
        var_r0 = 2;
        break;
    case GX_LIGHT3:
        var_r0 = 3;
        break;
    case GX_LIGHT4:
        var_r0 = 4;
        break;
    case GX_LIGHT5:
        var_r0 = 5;
        break;
    case GX_LIGHT6:
        var_r0 = 6;
        break;
    case GX_LIGHT7:
        var_r0 = 7;
        break;
    default:
        var_r0 = 0;
        break;
    }

    GX_WRITE_U8(0x10);
    GX_WRITE_U32(((var_r0 * 0x10) + 0x600) | 0xF0000);
    GX_WRITE_U32(0);
    GX_WRITE_U32(0);
    GX_WRITE_U32(0);
    GX_WRITE_U32(__lt_obj->color);
    GX_WRITE_F32(__lt_obj->unk10);
    GX_WRITE_F32(__lt_obj->unk14);
    GX_WRITE_F32(__lt_obj->unk18);
    GX_WRITE_F32(__lt_obj->k0);
    GX_WRITE_F32(__lt_obj->k1);
    GX_WRITE_F32(__lt_obj->k2);
    GX_WRITE_F32(__lt_obj->posX);
    GX_WRITE_F32(__lt_obj->posY);
    GX_WRITE_F32(__lt_obj->posZ);
    GX_WRITE_F32(__lt_obj->dirX);
    GX_WRITE_F32(__lt_obj->dirY);
    GX_WRITE_F32(__lt_obj->dirZ);

    gx->unk2 = 0;
}

#ifdef NONMATCHING
//https://decomp.me/scratch/gjNN1
void GXSetChanAmbColor(GXChannelID chan, GXColor amb_color)
{
    s32 var_r3;
    u32 var_r7;

    switch (chan)
    {
    case GX_COLOR0:
        var_r3 = 0;
        //var_r7 = ((amb_color.r << 0x18) & ~0xFFFFFF) | ((((amb_color.g << 0x10) & ~0xFFFF) | (((gx->unkA8[0] & ~0xFF00) | ((amb_color.b << 8) & 0xFF00)) & 0xFFFF)) & 0xFFFFFF);
        var_r7 = (gx->unkA8[0] & 0xFF) | ((amb_color.b << 8) & 0xFF00) | ((amb_color.g << 16) & 0xFF0000) | ((amb_color.r << 24) & 0xFF000000);
        break;
    case GX_COLOR1:
        var_r3 = 1;
        //var_r7 = ((amb_color.r << 0x18) & ~0xFFFFFF) | ((((amb_color.g << 0x10) & ~0xFFFF) | (((gx->unkA8[1] & ~0xFF00) | ((amb_color.b << 8) & 0xFF00)) & 0xFFFF)) & 0xFFFFFF);
        var_r7 = (gx->unkA8[1] & 0xFF) | ((amb_color.b << 8) & 0xFF00) | ((amb_color.g << 16) & 0xFF0000) | ((amb_color.r << 24) & 0xFF000000);
        break;
    case GX_ALPHA0:
        var_r3 = 0;
        var_r7 = (amb_color.a & ~0xFFFFFF00) | (gx->unkA8[0] & 0xFFFFFF00);
        break;
    case GX_ALPHA1:
        var_r3 = 1;
        var_r7 = (amb_color.a & ~0xFFFFFF00) | (gx->unkA8[1] & 0xFFFFFF00);
        break;
    case GX_COLOR0A0:
        var_r3 = 0;
        var_r7 = (amb_color.a & 0xFF) | ((amb_color.b << 8) & 0xFF00) | ((amb_color.g << 16) & 0xFF0000) | ((amb_color.r << 24) & 0xFF000000);
        //var_r7 = ((amb_color.r << 0x18) & ~0xFFFFFF) | ((((amb_color.g << 0x10) & ~0xFFFF) | ((((amb_color.b << 8) & ~0xFF) | (amb_color.a & 0xFF)) & 0xFFFF)) & 0xFFFFFF);
        break;
    case GX_COLOR1A1:
        var_r3 = 1;
        //var_r7 = ((amb_color.r << 0x18) & ~0xFFFFFF) | ((((amb_color.g << 0x10) & ~0xFFFF) | ((((amb_color.b << 8) & ~0xFF) | (amb_color.a & 0xFF)) & 0xFFFF)) & 0xFFFFFF);
        //var_r7 = (amb_color.r << 24) | (amb_color.g << 16) | (amb_color.b << 8) | (amb_color.a);
        var_r7 = amb_color.r << 24;
        var_r7 |= amb_color.g << 16;
        var_r7 |= amb_color.b << 8;
        var_r7 |= amb_color.a;
        break;
    default:
        return;
    }

    GX_WRITE_U8(0x10);
    GX_WRITE_U32(var_r3 + 0x100A);
    GX_WRITE_U32(var_r7);
    gx->unk2 = 0;
    gx->unkA8[var_r3] = var_r7;
}
#else
asm void GXSetChanAmbColor(GXChannelID chan, GXColor amb_color)
{
    nofralloc
#include "../asm/nonmatchings/GXSetChanAmbColor.s"
}
#pragma peephole on
#endif

#ifdef NONMATCHING
void GXSetChanMatColor(GXChannelID chan, GXColor mat_color)
{
    u32 var_r3;
    u32 var_r7;
    u32 var_r0;
    u32 var_r6;
    u32 var_r4;
    u8 r, g, b;

    switch (chan)
    {
    case GX_COLOR0:
        var_r3 = 0;
        var_r7 = ((mat_color.r << 0x18) & ~0xFFFFFF) | ((((mat_color.g << 0x10) & ~0xFFFF) | (((gx->unkB0[0] & ~0xFF00) | ((mat_color.b << 8) & 0xFF00)) & 0xFFFF)) & 0xFFFFFF);
        break;
    case GX_COLOR1:
        var_r3 = 1;
        var_r7 = ((mat_color.r << 0x18) & ~0xFFFFFF) | ((((mat_color.g << 0x10) & ~0xFFFF) | (((gx->unkB0[1] & ~0xFF00) | ((mat_color.b << 8) & 0xFF00)) & 0xFFFF)) & 0xFFFFFF);
        break;
    case GX_ALPHA0:
        var_r3 = 0;
        var_r7 = (mat_color.a & ~0xFFFFFF00) | (gx->unkB0[0] & 0xFFFFFF00);
        break;
    case GX_ALPHA1:
        var_r3 = 1;
        var_r7 = (mat_color.a & ~0xFFFFFF00) | (gx->unkB0[1] & 0xFFFFFF00);
        break;
    case GX_COLOR0A0:
        var_r3 = 0;
        var_r7 = ((mat_color.r << 0x18) & ~0xFFFFFF) | ((((mat_color.g << 0x10) & ~0xFFFF) | ((((mat_color.b << 8) & ~0xFF) | (mat_color.a & 0xFF)) & 0xFFFF)) & 0xFFFFFF);
        break;
    case GX_COLOR1A1:
        var_r3 = 1;
        var_r7 = ((mat_color.r << 0x18) & ~0xFFFFFF) | ((((mat_color.g << 0x10) & ~0xFFFF) | ((((mat_color.b << 8) & ~0xFF) | (mat_color.a & 0xFF)) & 0xFFFF)) & 0xFFFFFF);
        //var_r7 = (mat_color.b << 8) | (mat_color.g << 16) | (mat_color.r << 24) | (mat_color.a);
        break;
    default:
        return;
    }

    GX_WRITE_U8(0x10);
    GX_WRITE_U32(var_r3 + 0x100C);
    GX_WRITE_U32(var_r7);
    gx->unk2 = 0;
    gx->unkB0[var_r3] = var_r7;
}
#else
asm void GXSetChanMatColor(GXChannelID chan, GXColor mat_color)
{
    nofralloc
#include "../asm/nonmatchings/GXSetChanMatColor.s"
}
#pragma peephole on
#endif

void GXSetNumChans(u8 nChans)
{
    u32 nChans_ = nChans;

    gx->unk204 = (gx->unk204 & 0xFFFFFF8F) | ((nChans_ << 4) & 0xFF0);
    GX_WRITE_U8(0x10);
    GX_WRITE_U32(0x1009);
    GX_WRITE_U32(nChans_);
    gx->unk4F0 |= 4;
}

#define INSERT_FIELD(reg, value, nbits, shift) \
do \
{ \
    (reg) = ((u32)(reg) & ~(((1<<(nbits))-1) << (shift))) | ((u32)(value) << (shift)); \
} while (0)

void GXSetChanCtrl(GXChannelID chan, GXBool enable, GXColorSrc amb_src,
    GXColorSrc mat_src, u32 light_mask, GXDiffuseFn diff_fn, GXAttnFn attn_fn)
{
    u32 reg;
    int r26;

    if (chan == 4)
        r26 = 0;
    else if (chan == 5)
        r26 = 1;
    else
        r26 = chan;

    reg = 0;
    //                value                          nbits  shift
    INSERT_FIELD(reg, enable,                            1,     1);
    INSERT_FIELD(reg, mat_src,                           1,     0);
    INSERT_FIELD(reg, amb_src,                           1,     6);
    INSERT_FIELD(reg, (light_mask & GX_LIGHT0) != 0,     1,     2);
    INSERT_FIELD(reg, (light_mask & GX_LIGHT1) != 0,     1,     3);
    INSERT_FIELD(reg, (light_mask & GX_LIGHT2) != 0,     1,     4);
    INSERT_FIELD(reg, (light_mask & GX_LIGHT3) != 0,     1,     5);
    INSERT_FIELD(reg, (light_mask & GX_LIGHT4) != 0,     1,    11);
    INSERT_FIELD(reg, (light_mask & GX_LIGHT5) != 0,     1,    12);
    INSERT_FIELD(reg, (light_mask & GX_LIGHT6) != 0,     1,    13);
    INSERT_FIELD(reg, (light_mask & GX_LIGHT7) != 0,     1,    14);
    INSERT_FIELD(reg, (attn_fn == 0) ? 0 : diff_fn,      2,     7);
    INSERT_FIELD(reg, (attn_fn != 2),                    1,     9);
    INSERT_FIELD(reg, (attn_fn != 0),                    1,    10);

    GX_WRITE_U8(0x10);
    GX_WRITE_U32(0x1000 + (r26 + 14));
    GX_WRITE_U32(reg);
    gx->unk2 = 0;
    if (chan == GX_COLOR0A0)
    {
        GX_WRITE_U8(0x10);
        GX_WRITE_U32(0x1000 + 16);
        GX_WRITE_U32(reg);
    }
    else if (chan == GX_COLOR1A1)
    {
        GX_WRITE_U8(0x10);
        GX_WRITE_U32(0x1000 + 17);
        GX_WRITE_U32(reg);
    }
}
