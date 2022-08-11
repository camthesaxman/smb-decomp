#include <dolphin.h>

#include "__gx.h"

void GXSetTevOp(GXTevStageID id, GXTevMode mode)
{
    GXTevColorArg inputColor = GX_CC_RASC;
    GXTevAlphaArg inputAlpha = GX_CA_RASA;

    if (id != GX_TEVSTAGE0)
    {
        inputColor = GX_CC_CPREV;
        inputAlpha = GX_CA_APREV;
    }
    switch (mode)
    {
    case GX_MODULATE:
        GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_TEXC, inputColor, GX_CC_ZERO);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_TEXA, inputAlpha, GX_CA_ZERO);
        break;
    case GX_DECAL:
        GXSetTevColorIn(id, inputColor, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, inputAlpha);
        break;
    case GX_BLEND:
        GXSetTevColorIn(id, inputColor, GX_CC_ONE, GX_CC_TEXC, GX_CC_ZERO);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_TEXA, inputAlpha, GX_CA_ZERO);
        break;
    case GX_REPLACE:
        GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
        break;
    case GX_PASSCLR:
        GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, inputColor);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, inputAlpha);
        break;
    }
    GXSetTevColorOp(id, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaOp(id, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}

void GXSetTevColorIn(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d)
{
    u32 *temp_r9 = &gx->unk130[stage];

    INSERT_FIELD(*temp_r9, a, 4, 12);
    INSERT_FIELD(*temp_r9, b, 4,  8);
    INSERT_FIELD(*temp_r9, c, 4,  4);
    INSERT_FIELD(*temp_r9, d, 4,  0);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r9);
    gx->unk2 = 1;
}

void GXSetTevAlphaIn(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d)
{
    u32 *temp_r9 = &gx->unk170[stage];

    INSERT_FIELD(*temp_r9, a, 3, 13);
    INSERT_FIELD(*temp_r9, b, 3, 10);
    INSERT_FIELD(*temp_r9, c, 3,  7);
    INSERT_FIELD(*temp_r9, d, 3,  4);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r9);
    gx->unk2 = 1;
}

void GXSetTevColorOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    u32 *temp_r3 = &gx->unk130[stage];

    INSERT_FIELD(*temp_r3, op & 1, 1, 18);
    if (op <= 1)
    {
        INSERT_FIELD(*temp_r3, scale, 2, 20);
        INSERT_FIELD(*temp_r3, bias,  2, 16);
    }
    else
    {
        INSERT_FIELD(*temp_r3, (op >> 1) & 3, 2, 20);
        INSERT_FIELD(*temp_r3, 3,             2, 16);

    }
    INSERT_FIELD(*temp_r3, clamp & 0xFF, 1, 19);
    INSERT_FIELD(*temp_r3, out_reg,      2, 22);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r3);
    gx->unk2 = 1;
}

void GXSetTevAlphaOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    u32 *temp_r3 = &gx->unk170[stage];

    INSERT_FIELD(*temp_r3, op & 1, 1, 18);
    if (op <= 1)
    {
        INSERT_FIELD(*temp_r3, scale, 2, 20);
        INSERT_FIELD(*temp_r3, bias,  2, 16);
    }
    else
    {
        INSERT_FIELD(*temp_r3, (op >> 1) & 3, 2, 20);
        INSERT_FIELD(*temp_r3, 3,             2, 16);

    }
    INSERT_FIELD(*temp_r3, clamp & 0xFF, 1, 19);
    INSERT_FIELD(*temp_r3, out_reg,      2, 22);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r3);
    gx->unk2 = 1;
}

void GXSetTevColor(GXTevRegID id, GXColor color)
{
    u32 r30;
    u32 r31;

    r30 = 0;
    INSERT_FIELD(r30, color.r,     11,  0);
    INSERT_FIELD(r30, color.a,      8, 12);
    INSERT_FIELD(r30, 224 + id * 2, 8, 24);

    r31 = 0;
    INSERT_FIELD(r31, color.b,     11,  0);
    INSERT_FIELD(r31, color.g,      8, 12);
    INSERT_FIELD(r31, 225 + id * 2, 8, 24);

    GX_WRITE_U8(0x61);
    GX_WRITE_U32(r30);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(r31);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(r31);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(r31);
    gx->unk2 = 1;
}

void GXSetTevKColor(GXTevKColorID id, GXColor color)
{
    u32 r30;
    u32 r31;

    r30 = 0;
    INSERT_FIELD(r30, color.r,     11,  0);
    INSERT_FIELD(r30, color.a,      8, 12);
    INSERT_FIELD(r30, 8,            4, 20);
    INSERT_FIELD(r30, 224 + id * 2, 8, 24);

    r31 = 0;
    INSERT_FIELD(r31, color.b,     11,  0);
    INSERT_FIELD(r31, color.g,      8, 12);
    INSERT_FIELD(r31, 8,            4, 20);
    INSERT_FIELD(r31, 225 + id * 2, 8, 24);

    GX_WRITE_U8(0x61);
    GX_WRITE_U32(r30);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(r31);
    gx->unk2 = 1;
}

void GXSetTevKColorSel(GXTevStageID stage, GXTevKColorSel sel)
{
    u32 *temp_r7 = &gx->unk1B0[stage >> 1];

    if (stage & 1)
        INSERT_FIELD(*temp_r7, sel, 5, 14);
    else
        INSERT_FIELD(*temp_r7, sel, 5, 4);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r7);
    gx->unk2 = 1;
}

void GXSetTevKAlphaSel(GXTevStageID stage, GXTevKAlphaSel sel)
{
    u32 *temp_r7 = &gx->unk1B0[stage >> 1];

    if (stage & 1)
        INSERT_FIELD(*temp_r7, sel, 5, 19);
    else
        INSERT_FIELD(*temp_r7, sel, 5, 9);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r7);
    gx->unk2 = 1;
}

void GXSetTevSwapMode(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    u32 *temp_r7 = &gx->unk170[stage];

    INSERT_FIELD(*temp_r7, ras_sel, 2, 0);
    INSERT_FIELD(*temp_r7, tex_sel, 2, 2);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r7);
    gx->unk2 = 1;
}

void GXSetTevSwapModeTable(GXTevSwapSel table, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha)
{
    int index1 = table * 2;
    int index2 = table * 2 + 1;
    u32 *temp_r11;

    temp_r11 = &gx->unk1B0[index1];
    INSERT_FIELD(*temp_r11, red,   2, 0);
    INSERT_FIELD(*temp_r11, green, 2, 2);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r11);

    temp_r11 = &gx->unk1B0[index2];
    INSERT_FIELD(*temp_r11, blue,  2, 0);
    INSERT_FIELD(*temp_r11, alpha, 2, 2);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r11);

    gx->unk2 = 1;
}

void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1)
{
    u32 reg = 0;

    INSERT_FIELD(reg, ref0,  8,  0);
    INSERT_FIELD(reg, ref1,  8,  8);
    INSERT_FIELD(reg, comp0, 3, 16);
    INSERT_FIELD(reg, comp1, 3, 19);
    INSERT_FIELD(reg, op,    2, 22);
    INSERT_FIELD(reg, 0xF3,  8, 24);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(reg);
    gx->unk2 = 1;
}

void GXSetZTexture(GXZTexOp op,GXTexFmt fmt, u32 bias)
{
    u32 reg1 = 0;
    u32 reg2 = 0;
    int var_r6;

    INSERT_FIELD(reg1, bias, 24,  0);
    INSERT_FIELD(reg1, 0xF4,  8, 24);
    switch (fmt)
    {
    case GX_TF_Z8:
        var_r6 = 0;
        break;
    case GX_TF_Z16:
        var_r6 = 1;
        break;
    case GX_TF_Z24X8:
        var_r6 = 2;
        break;
    default:
        var_r6 = 2;
        break;
    }
    INSERT_FIELD(reg2, var_r6, 2,  0);
    INSERT_FIELD(reg2, op,     2,  2);
    INSERT_FIELD(reg2, 0xF5,   8, 24);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(reg1);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(reg2);
    gx->unk2 = 1;
}

u32 lbl_801E9198[] = { 0, 1, 0, 1, 0, 1, 7, 5, 6, 0 };

void GXSetTevOrder(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color)
{
    u32 *temp_r7 = &gx->unk100[stage / 2];
    int var_r0;
    int var_r4;
    u32 temp_r10;
    int var_r9;

    gx->unk49C[stage] = map;
    temp_r10 = map & ~0x100;
    var_r9 = temp_r10 >= 8 ? 0 : temp_r10;
    if (coord >= 8)
        coord = GX_TEXCOORD0;
    if (stage & 1)
    {
        INSERT_FIELD(*temp_r7, var_r9, 3, 12);
        INSERT_FIELD(*temp_r7, coord,  3, 15);
        var_r0 = (color == GX_COLOR_NULL) ? 7 : lbl_801E9198[color];
        INSERT_FIELD(*temp_r7, var_r0, 3, 19);
        var_r4 = (map != GX_TEXMAP_NULL && !(map & 0x100));
        INSERT_FIELD(*temp_r7, var_r4, 1, 18);
    }
    else
    {
        INSERT_FIELD(*temp_r7, var_r9, 3, 0);
        INSERT_FIELD(*temp_r7, coord,  3, 3);
        var_r0 = (color == GX_COLOR_NULL) ? 7 : lbl_801E9198[color];
        INSERT_FIELD(*temp_r7, var_r0, 3, 7);
        var_r4 = (map != GX_TEXMAP_NULL && !(map & 0x100));
        INSERT_FIELD(*temp_r7, var_r4, 1, 6);
    }
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(*temp_r7);
    gx->unk2 = 1;
    gx->unk4F0 |= 1;
}

void GXSetNumTevStages(u8 nStages)
{
    INSERT_FIELD(gx->unk204, nStages - 1, 4, 10);
    gx->unk4F0 |= 4;
}
