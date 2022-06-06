#include <dolphin.h>

#include "__gx.h"

#define qr0 0

float force_lbl_802F6868() { return 0.5f; }

void GXSetProjection(f32 mtx[4][4], GXProjectionType type)
{
    gx->unk420 = type;
    gx->unk424 = mtx[0][0];
    gx->unk42C = mtx[1][1];
    gx->unk434 = mtx[2][2];
    gx->unk438 = mtx[2][3];
    if (type == GX_ORTHOGRAPHIC)
    {
        gx->unk428 = mtx[0][3];
        gx->unk430 = mtx[1][3];
    }
    else
    {
        gx->unk428 = mtx[0][2];
        gx->unk430 = mtx[1][2];
    }
    GX_WRITE_U8(0x10);
    GX_WRITE_U32(0x00061020);
    GX_WRITE_F32(gx->unk424);
    GX_WRITE_F32(gx->unk428);
    GX_WRITE_F32(gx->unk42C);
    GX_WRITE_F32(gx->unk430);
    GX_WRITE_F32(gx->unk434);
    GX_WRITE_F32(gx->unk438);
    GX_WRITE_U32(gx->unk420);
    gx->unk2 = 0;
}

void GXGetProjectionv(f32 *p)
{
    p[0] = gx->unk420;
    p[1] = gx->unk424;
    p[2] = gx->unk428;
    p[3] = gx->unk42C;
    p[4] = gx->unk430;
    p[5] = gx->unk434;
    p[6] = gx->unk438;
}

#ifdef __MWERKS__
asm void WriteMTXPS4x3(register f32 src[3][4], register volatile f32 *dest)
{
    psq_l f0, 0x00(src), 0, qr0
    psq_l f1, 0x08(src), 0, qr0
    psq_l f2, 0x10(src), 0, qr0
    psq_l f3, 0x18(src), 0, qr0
    psq_l f4, 0x20(src), 0, qr0
    psq_l f5, 0x28(src), 0, qr0
    psq_st f0, 0(dest), 0, qr0
    psq_st f1, 0(dest), 0, qr0
    psq_st f2, 0(dest), 0, qr0
    psq_st f3, 0(dest), 0, qr0
    psq_st f4, 0(dest), 0, qr0
    psq_st f5, 0(dest), 0, qr0
}

asm void WriteMTXPS3x3from3x4(register f32 src[3][4], register volatile f32 *dest)
{
    psq_l f0, 0x00(src), 0, qr0
    lfs   f1, 0x08(src)
    psq_l f2, 0x10(src), 0, qr0
    lfs   f3, 0x18(src)
    psq_l f4, 0x20(src), 0, qr0
    lfs   f5, 0x28(src)
    psq_st f0, 0(dest), 0, qr0
    stfs   f1, 0(dest)
    psq_st f2, 0(dest), 0, qr0
    stfs   f3, 0(dest)
    psq_st f4, 0(dest), 0, qr0
    stfs   f5, 0(dest)
}

asm void WriteMTXPS4x2(register f32 src[2][4], register volatile f32 *dest)
{
    psq_l f0, 0x00(src), 0, qr0
    psq_l f1, 0x08(src), 0, qr0
    psq_l f2, 0x10(src), 0, qr0
    psq_l f3, 0x18(src), 0, qr0
    psq_st f0, 0(dest), 0, qr0
    psq_st f1, 0(dest), 0, qr0
    psq_st f2, 0(dest), 0, qr0
    psq_st f3, 0(dest), 0, qr0
}
#else
void WriteMTXPS4x3(f32 src[3][4], volatile f32 *dest)
{
    int row, col;
    for (row = 0; row < 3; row++)
    {
        for (col = 0; col < 4; col++)
            *dest = src[row][col];
    }
}

void WriteMTXPS3x3from3x4(f32 src[3][4], volatile f32 *dest)
{
    int row, col;
    for (row = 0; row < 3; row++)
    {
        for (col = 0; col < 3; col++)
            *dest = src[row][col];
    }
}

void WriteMTXPS4x2(f32 src[2][4], volatile f32 *dest)
{
    int row, col;
    for (row = 0; row < 2; row++)
    {
        for (col = 0; col < 4; col++)
            *dest = src[row][col];
    }
}
#endif

void GXLoadPosMtxImm(f32 mtx[3][4], u32 id)
{
    GX_WRITE_U8(0x10);
    GX_WRITE_U32(0x000B0000 | (id * 4));
    WriteMTXPS4x3(mtx, &GXWGFifo.f32);
}

void GXLoadNrmMtxImm(f32 mtx[3][4], u32 id)
{
    GX_WRITE_U8(0x10);
    GX_WRITE_U32(0x00080000 | (0x400 + id * 3));
    WriteMTXPS3x3from3x4(mtx, &GXWGFifo.f32);
}

void GXSetCurrentMtx(u32 id)
{
    gx->unk80 = (gx->unk80 & ~0x3F) | id;
    __GXSetMatrixIndex(0);
}

void GXLoadTexMtxImm(f32 mtx[][4], u32 id, GXTexMtxType type)
{
    u32 var_r4;
    u32 var_r7;

    if (id >= 64)
        var_r7 = ((id - 64) * 4) + 0x500;
    else
        var_r7 = id * 4;

    if (type == GX_MTX2x4)
        var_r4 = 8;
    else
        var_r4 = 12;

    GX_WRITE_U8(0x10);
    GX_WRITE_U32(var_r7 | ((var_r4 - 1) << 0x10));
    if (type == GX_MTX3x4)
        WriteMTXPS4x3(mtx, &GXWGFifo.f32);
    else
        WriteMTXPS4x2(mtx, &GXWGFifo.f32);
}

void GXSetViewportJitter(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz, u32 field)
{
    f32 temp_f31;
    f32 temp_f30;
    f32 temp_f29;
    f32 temp_f28;
    f32 temp_f27;
    f32 temp_f26;
    u8 unused[8];

    if (field == 0)
        top -= 0.5f;

    temp_f31 = wd / 2.0f;
    temp_f29 = -ht / 2.0f;
    temp_f27 = 340.0f + (left + wd / 2.0f);
    temp_f26 = 340.0f + (top + ht / 2.0f);
    temp_f30 = 16777215.0f * farz;
    temp_f28 = temp_f30 - (16777215.0f * nearz);
    gx->unk43C = left;
    gx->unk440 = top;
    gx->unk444 = wd;
    gx->unk448 = ht;
    gx->unk44C = nearz;
    gx->unk450 = farz;
    if (gx->unk454 != 0)
        __GXSetRange(nearz, gx->unk458);
    GX_WRITE_U8(0x10);
    GX_WRITE_U32(0x0005101A);
    GX_WRITE_F32(temp_f31);
    GX_WRITE_F32(temp_f29);
    GX_WRITE_F32(temp_f28);
    GX_WRITE_F32(temp_f27);
    GX_WRITE_F32(temp_f26);
    GX_WRITE_F32(temp_f30);
    gx->unk2 = 0;
}

void GXSetViewport(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz)
{
    GXSetViewportJitter(left, top, wd, ht, nearz, farz, 1);
}

void GXSetScissor(u32 left, u32 top, u32 wd, u32 ht)
{
    u32 temp_r8 = 340 + left;
    u32 temp_r4 = 340 + top;

    gx->unkF8 = (gx->unkF8 & 0xFFFFF800) | temp_r4;
    gx->unkF8 = (gx->unkF8 & 0xFF800FFF) | (temp_r8 << 12);
    gx->unkFC = (gx->unkFC & 0xFFFFF800) | (temp_r4 + ht - 1);
    gx->unkFC = (gx->unkFC & 0xFF800FFF) | ((temp_r8 + wd - 1) << 12);

    GX_WRITE_U8(0x61);
    GX_WRITE_U32(gx->unkF8);
    GX_WRITE_U8(0x61);
    GX_WRITE_U32(gx->unkFC);
    gx->unk2 = 1;
}

void GXSetScissorBoxOffset(s32 x_off, s32 y_off)
{
    u32 var1 = (u32)(340 + x_off) / 2;
    u32 var2 = (u32)(340 + y_off) / 2;
    u32 r5;

    GX_WRITE_U8(0x61);
    r5 = ((var1 & 0xFFF003FF) | (var2 << 10)) & 0xFFFFFF;
    r5 |= 0x59000000;
    GX_WRITE_U32(r5);
    gx->unk2 = 1;
}

void GXSetClipMode(GXClipMode mode)
{
    GX_WRITE_U8(0x10);
    GX_WRITE_U32(0x00001005);
    GX_WRITE_U32(mode);
    gx->unk2 = 0;
}

void __GXSetMatrixIndex(int arg0)
{
    if (arg0 < 5)
    {
        GX_WRITE_U8(8);
        GX_WRITE_U8(0x30);
        GX_WRITE_U32(gx->unk80);
        GX_WRITE_U8(0x10);
        GX_WRITE_U32(0x1018);
        GX_WRITE_U32(gx->unk80);
    }
    else
    {
        GX_WRITE_U8(8);
        GX_WRITE_U8(0x40);
        GX_WRITE_U32(gx->unk84);
        GX_WRITE_U8(0x10);
        GX_WRITE_U32(0x1019);
        GX_WRITE_U32(gx->unk84);
    }
    gx->unk2 = 0;
}
