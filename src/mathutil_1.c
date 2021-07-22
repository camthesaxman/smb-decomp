#include <dolphin.h>

#include "global.h"

#define LC_CACHE_BASE 0xE0000000

// See struct MathutilData
#define OFFSET_MTX_A          0x00
#define OFFSET_MTX_B          0x30
#define OFFSET_MTX_STACK_PTR  0x94
#define OFFSET_CONST_ZERO     0x198
#define OFFSET_CONST_ONE      0x19C
#define OFFSET_CONST_ONE_HALF 0x1A0
#define OFFSET_UNK1AC         0x1AC
#define OFFSET_UNK1AE         0x1AE

extern float lbl_802F1B68;
extern u32 lbl_802F1B6C;

// sin/cos tables?
extern float lbl_80194940[];
extern float lbl_80184920[];

// prototypes needed for asm entry labels
void _return_nan();
void _return_zero();
void _return_inf();

asm void mathutil_init(void)
{
    nofralloc

    // Initialize Graphic Quantization Registers for use with paired single instructions

    // Use GQR0 for float (no-op) conversion
    li r3, 0
    mtspr GQR0, r3

    // Use GQR2 for u8 conversion
    li r3, 4
    oris r3, r3, 4
    mtspr GQR2, r3

    // Use GQR3 for u16 conversion
    li r3, 5
    oris r3, r3, 5
    mtspr GQR3, r3

    // Use GQR4 for s8 conversion
    li r3, 6
    oris r3, r3, 6
    mtspr GQR4, r3

    // Use GQR5 for s16 conversion
    li r3, 7
    oris r3, r3, 7
    mtspr GQR5, r3

    li r3, 0
    mtspr GQR6, r3

    li r3, 0
    mtspr GQR7, r3

    blr

entry _return_nan
    lis r0, 0x7FFF
    b @return
entry _return_zero
    li r0, 0
    b @return
entry _return_inf
    lis r0, 0x7F80
    b @return
// unused?
    lis r0, 0xFF80
    b @return
@return:
    stwu r0, -0x10(r1)
    lfs f1, 0(r1)
    addi r1, r1, 0x10
    blr
}

asm float approx_rsqrt(register float num, register float oneHalf)
{
    nofralloc

    fmul f4, oneHalf, num  // f4 = 0.5 * num
    fadd f3, oneHalf, oneHalf
    frsqrte f1, num        // f1 = initial estimate
    fadd f3, f3, oneHalf   // f3 = 1.5

    // Perform 3 iterations of Newton's Method to get a better approximation
    // xₙ₊₁ = xₙ * (1.5 - 0.5 * num * xₙ²)

    fmul f5, f1, f1        // f5 = x * x
    fnmsub f5, f5, f4, f3  // f5 = -(0.5 * num * x * x - 1.5)
    fmul f1, f1, f5        // x = x * (1.5 - 0.5 * num * x * x)

    fmul f5, f1, f1
    fnmsub f5, f5, f4, f3
    fmul f1, f1, f5

    fmul f5, f1, f1
    fnmsub f5, f5, f4, f3
    fmul f1, f1, f5

    blr
    blr
}

asm float lbl_800070EC()
{
    nofralloc

    bgt cr1, _return_inf
    blt cr1, _return_zero
    b _return_nan
}

asm float mathutil_sqrt(double n)
{
    nofralloc

    frsp f0, f1
    lis r4, LC_CACHE_BASE@ha
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, OFFSET_CONST_ONE_HALF(r4)
    bso cr1, lbl_800070EC
    bso _return_zero
    ble cr1, _return_zero
    mflr r3
    bl approx_rsqrt
    mtlr r3
    fmuls f1, f1, f0
    blr

lbl_8000712C:
    bgt cr1, _return_zero
    blt cr1, _return_inf
    b _return_nan

entry mathutil_rsqrt
    frsp f1, f1
    lis r4, LC_CACHE_BASE@ha
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, OFFSET_CONST_ONE_HALF(r4)
    bso cr1, lbl_8000712C
    bso _return_inf
    ble cr1, _return_inf
    mflr r3
    bl approx_rsqrt
    mtlr r3
    frsp f1, f1
    blr
}

asm float func_8000716C(double a)
{
    nofralloc

    frsp f0, f1
    lis r4, LC_CACHE_BASE@ha
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, OFFSET_CONST_ONE_HALF(r4)
    bso cr1, lbl_800071A8
    bso lbl_800071BC
    ble cr1, lbl_800071BC
    mflr r5
    bl approx_rsqrt
    mtlr r5
    fmuls f0, f1, f0
    frsp f1, f1
    stfs f0, 0(r3)
    blr
lbl_800071A8:
    bgt+ cr1, lbl_800071BC
    blt+ cr1, lbl_800071C8
    lis r5, 0x7fff
    lis r6, 0x7fff
    b lbl_800071D0
lbl_800071BC:
    li r5, 0
    lis r6, 0x7f80
    b lbl_800071D0
lbl_800071C8:
    lis r5, 0x7f80
    li r6, 0
lbl_800071D0:
    stw r5, 0(r3)
    stw r6, 0x98(r4)
    lfs f1, 0x98(r4)
    blr
}

asm float mathutil_sin(register u32 angle)
{
    nofralloc

    andi. r5, angle, 0x4000
    clrlwi r4, angle, 0x12
    beq @1
    subfic r4, r4, 0x4000
@1:
    lis r6, lbl_80184920@h
    slwi r4, r4, 2
    ori r6, r6, lbl_80184920@l
    andi. r5, angle, 0x8000
    lfsx f1, r6, r4
    beqlr
    fneg f1, f1
    blr
}

asm void mathutil_sin_cos_v(s16 a, float *b)
{
    nofralloc

    addi r5, r4, 4
    crclr 6
    b lbl_80007220

// void mathutil_sin_cos(s16 angle)
entry mathutil_sin_cos
    crset 6
lbl_80007220:
    rlwinm r8, r3, 0x10, 0, 1
    clrlwi r6, r3, 0x12
    mtcrf 0x80, r8
    crxor 2, 0, 1
    ble lbl_80007238
    subfic r6, r6, 0x4000
lbl_80007238:
    subfic r7, r6, 0x4000
    lis r8, lbl_80184920@h
    slwi r6, r6, 2
    ori r8, r8, lbl_80184920@l
    slwi r7, r7, 2
    lfsx f1, r8, r6
    lfsx f2, r8, r7
    bge lbl_8000725C
    fnabs f1, f1
lbl_8000725C:
    bne lbl_80007264
    fnabs f2, f2
lbl_80007264:
    beqlr cr1
    stfs f1, 0(r4)
    stfs f2, 0(r5)
    blr
}

asm float mathutil_tan(register u32 angle)
{
    nofralloc

    lis r4, lbl_80194940@h
    andi. r6, angle, 0x4000
    rlwinm r5, angle, 2, 0x10, 0x1d
    ori r4, r4, lbl_80194940@l
    beq @1
    addis r4, r4, 1
    neg r5, r5
    lfsx f1, r5, r4
    fnabs f1, f1
    blr
@1:
    lfsx f1, r5, r4
    blr
}

asm u32 mathutil_atan2(double angle)
{
    nofralloc

    mfcr r6
    frsp f2, f2
    mcrfs cr7, 4//cr4
    mcrfs cr6, 3//cr3
    frsp f1, f1
    bso cr7, lbl_800073B4
    mcrfs cr5, 4//cr4
    mcrfs cr4, 3//cr3
    bso cr5, lbl_800073BC
    bne+ cr7, lbl_800072D4
    bne+ cr5, lbl_800072D4
    b lbl_80007400
lbl_800072D4:
    crxor 12, 20, 28
    fabs f3, f2
    fabs f4, f1
    fcmpu cr0, f3, f4
    beq lbl_80007408
    bgt lbl_800072F4
    fabs f3, f1
    fabs f4, f2
lbl_800072F4:
    crmove 15, 0
    fdivs f5, f4, f3
    b lbl_80007344

// u32 mathutil_atan(double angle)
entry mathutil_atan
    frsp f1, f1
    lis r7, LC_CACHE_BASE@ha
    mcrfs cr5, 4//cr4
    mcrfs cr4, 3//cr3
    bns+ cr5, lbl_80007320
    crand 9, 19, 23
    bgt cr2, lbl_80007400
    b lbl_800073DC
lbl_80007320:
    beq cr5, lbl_80007400
    lfs f3, OFFSET_CONST_ONE(r7)
    fabs f5, f1
    crmove 12, 20
    fcmpu cr0, f5, f3
    beq lbl_80007408
    blt lbl_80007340
    fdivs f5, f3, f5
lbl_80007340:
    crmove 15, 1

lbl_80007344:
    stfs f5, lbl_802F1B68
    lwz r3, lbl_802F1B68
    clrlwi r5, r3, 9
    oris r5, r5, 0x80
    rlwinm r4, r3, 9, 0x18, 0x1f
    subfic r4, r4, 0x87
    rlwinm. r0, r4, 0, 0, 0x1a
    beq lbl_80007368
    ori r4, r4, 0x20
lbl_80007368:
    srw r4, r5, r4
    rlwinm r4, r4, 0, 0x11, 0x1c
    addis r4, r4, 0x801a
    addi r4, r4, 0x4960
    lfs f3, 0(r4)
    lfs f4, 4(r4)
    fmadds f5, f5, f3, f4
    fctiw f5, f5
    stfd f5, lbl_802F1B68
    lwz r3, lbl_802F1B6C
    bns cr3, lbl_80007398
    subfic r3, r3, 0x4000
lbl_80007398:
    bge cr3, lbl_800073A8
    neg r3, r3
    addi r3, r3, -32768
    addis r3, r3, 1
lbl_800073A8:
    bge cr5, lbl_800073B0
    addi r3, r3, -32768
lbl_800073B0:
    b lbl_80007418
lbl_800073B4:
    mcrfs cr5, 4//cr4
    mcrfs cr4, 3//cr3
lbl_800073BC:
    crand 8, 27, 31
    blt cr2, lbl_80007400
    crand 9, 19, 23
    bgt cr2, lbl_80007400
    bns cr7, lbl_800073DC
    bns cr5, lbl_800073F0
    crxor 12, 20, 28
    b lbl_80007408
lbl_800073DC:
    crxor 12, 20, 28
    mfcr r3
    rlwinm r3, r3, 0x1c, 0x10, 0x10
    ori r3, r3, 0x4000
    b lbl_80007418
lbl_800073F0:
    crxor 12, 20, 28
    mfcr r3
    rlwinm r3, r3, 0x1c, 0x10, 0x10
    b lbl_80007418
lbl_80007400:
    li r3, 0
    b lbl_8000741C
lbl_80007408:
    crmove 21, 12
    mfcr r3
    rlwinm r3, r3, 4, 0x10, 0x11
    ori r3, r3, 0x2000
lbl_80007418:
    extsh r3, r3
lbl_8000741C:
    mtcrf 0xff, r6
    blr
}

#pragma fp_contract off

u32 func_80007424(float a)
{
    u32 r3;

    if (__fabs(a) > 1.0)
    {
        if (a > 0.0f)
            return 0;
        else
            return -0x8000;
    }
    if (__fabs(a) > 1.0)  // uh... we already checked that.
    {
        if (a > 0.0f)
            r3 = 0x4000;
        else
            r3 = -0x4000;
    }
    else
    {
        float f1 = mathutil_sqrt(1.0f - (a * a));
        if (f1 != 0.0f)
            r3 = mathutil_atan(a / f1);
        else if (a > 0.0f)
            r3 = 0x4000;
        else
            r3 = -0x4000;
    }
    return (0x4000 - r3) & 0xFFFF;
}

asm void mathutil_vec_dot_normalized(register Vec *vecA, register Vec *vecB)
{
    nofralloc

    lis r5, LC_CACHE_BASE@ha
    lfs f6, vecA->x
    lfs f9, vecB->x
    fmuls f12, f6, f6
    lfs f7, vecA->y
    fmuls f13, f9, f9
    lfs f10, vecB->y
    fmuls f0, f6, f9
    lfs f8, vecA->z
    fmadds f12, f7, f7, f12
    lfs f11, vecB->z
    fmadds f13, f10, f10, f13
    fmadds f0, f7, f10, f0
    fmadds f12, f8, f8, f12
    fmadds f13, f11, f11, f13
    fmadds f0, f8, f11, f0
    lfs f2, OFFSET_CONST_ONE_HALF(r5)
    fmuls f1, f12, f13
    mflr r6
    bl approx_rsqrt
    mtlr r6
    fmuls f1, f1, f0
    blr
}

asm void mathutil_mtx_from_identity(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha
    psq_l f1, OFFSET_UNK1AC(r4), 0, GQR_U8
    psq_l f2, OFFSET_UNK1AE(r4), 0, GQR_U8
    ps_sub f0, f1, f1

    psq_st f2, 0(mtx),  0, GQR_F32
    psq_st f0, 8(mtx),  0, GQR_F32
    psq_st f1, 16(mtx), 0, GQR_F32
    psq_st f0, 24(mtx), 0, GQR_F32
    psq_st f0, 32(mtx), 0, GQR_F32
    psq_st f2, 40(mtx), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_from_identity(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    psq_l f1, OFFSET_UNK1AC(r3), 0, GQR_U8
    psq_l f2, OFFSET_UNK1AE(r3), 0, GQR_U8
    ps_sub f0, f1, f1

    psq_st f2, OFFSET_MTX_A+0(r3),  0, GQR_F32
    psq_st f0, OFFSET_MTX_A+8(r3),  0, GQR_F32
    psq_st f1, OFFSET_MTX_A+16(r3), 0, GQR_F32
    psq_st f0, OFFSET_MTX_A+24(r3), 0, GQR_F32
    psq_st f0, OFFSET_MTX_A+32(r3), 0, GQR_F32
    psq_st f2, OFFSET_MTX_A+40(r3), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_sq_from_identity(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    psq_l f1, OFFSET_UNK1AC(r3), 0, GQR_U8
    psq_l f2, OFFSET_UNK1AE(r3), 0, GQR_U8
    ps_sub f0, f1, f1

    psq_st f2, OFFSET_MTX_A+0(r3),  0, GQR_F32
    psq_st f0, OFFSET_MTX_A+8(r3),  1, GQR_F32
    psq_st f1, OFFSET_MTX_A+16(r3), 0, GQR_F32
    psq_st f0, OFFSET_MTX_A+24(r3), 1, GQR_F32
    psq_st f0, OFFSET_MTX_A+32(r3), 0, GQR_F32
    psq_st f2, OFFSET_MTX_A+40(r3), 1, GQR_F32

    blr
}

asm void mathutil_mtxA_from_translate(register Vec *vec)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha
    psq_l f1, 0(vec), 0, GQR_F32
    lfs f4, OFFSET_CONST_ZERO(r4)
    lfs f3, 8(vec)
    ps_merge01 f9, f4, f1
    b lbl_800075E0

// void mathutil_mtxA_from_translate_xyz(float x, float y, float z)
entry mathutil_mtxA_from_translate_xyz
    lis r4, LC_CACHE_BASE@ha
    lfs f4, OFFSET_CONST_ZERO(r4)
    ps_merge00 f9, f4, f2

lbl_800075E0:
    lfs f7, OFFSET_CONST_ONE(r4)
    ps_merge00 f8, f4, f1
    ps_merge00 f10, f7, f3
    psq_l f5, OFFSET_UNK1AC(r4), 0, GQR_U8
    psq_l f6, OFFSET_UNK1AE(r4), 0, GQR_U8

    psq_st f4,  OFFSET_MTX_A+32(r4), 0, GQR_F32
    psq_st f8,  OFFSET_MTX_A+8(r4),  0, GQR_F32
    psq_st f9,  OFFSET_MTX_A+24(r4), 0, GQR_F32
    psq_st f10, OFFSET_MTX_A+40(r4), 0, GQR_F32
    psq_st f5,  OFFSET_MTX_A+16(r4), 0, GQR_F32
    psq_st f6,  OFFSET_MTX_A+0(r4),  0, GQR_F32

    blr
}

asm void mathutil_mtxA_from_rotate_x(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

    lis r4, LC_CACHE_BASE@ha

    fneg f3, f1
    psq_l f4, OFFSET_UNK1AE(r4), 0, GQR_U8
    ps_merge11 f6, f4, f4
    ps_merge10 f7, f4, f2
    ps_merge01 f8, f3, f4
    ps_merge10 f9, f4, f1
    ps_merge01 f10, f2, f4

    psq_st f4,  OFFSET_MTX_A+0(r4),  0, GQR_F32
    psq_st f6,  OFFSET_MTX_A+8(r4),  0, GQR_F32
    psq_st f8,  OFFSET_MTX_A+24(r4), 0, GQR_F32
    psq_st f7,  OFFSET_MTX_A+16(r4), 0, GQR_F32
    psq_st f9,  OFFSET_MTX_A+32(r4), 0, GQR_F32
    psq_st f10, OFFSET_MTX_A+40(r4), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_from_rotate_y(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

    lis r4, LC_CACHE_BASE@ha

    fneg f3, f1
    psq_l f4, OFFSET_UNK1AC(r4), 0, GQR_U8
    ps_merge00 f5, f2, f4
    ps_merge00 f6, f1, f4
    ps_merge00 f8, f4, f4
    ps_merge00 f9, f3, f4

    psq_st f5, OFFSET_MTX_A+0(r4), 0, GQR_F32
    psq_st f6, OFFSET_MTX_A+8(r4), 0, GQR_F32
    psq_st f4, OFFSET_MTX_A+16(r4), 0, GQR_F32
    psq_st f8, OFFSET_MTX_A+24(r4), 0, GQR_F32
    psq_st f9, OFFSET_MTX_A+32(r4), 0, GQR_F32
    psq_st f5, OFFSET_MTX_A+40(r4), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_from_rotate_z(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

    lis r4, LC_CACHE_BASE@ha

    fneg f3, f1
    psq_l f4, OFFSET_UNK1AE(r4), 0, GQR_U8
    ps_merge00 f5, f2, f3
    ps_merge11 f6, f4, f4
    ps_merge00 f7, f1, f2

    psq_st f5, OFFSET_MTX_A+0(r4), 0, GQR_F32
    psq_st f6, OFFSET_MTX_A+8(r4), 0, GQR_F32
    psq_st f7, OFFSET_MTX_A+16(r4), 0, GQR_F32
    psq_st f6, OFFSET_MTX_A+24(r4), 0, GQR_F32
    psq_st f6, OFFSET_MTX_A+32(r4), 0, GQR_F32
    psq_st f4, OFFSET_MTX_A+40(r4), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_from_mtxB_translate(register Vec *vec)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha

    psq_l f1, 0(vec), 0, GQR_F32
    psq_l f3, 8(vec), 1, GQR_F32
    b lbl_800076FC

// void mathutil_mtxA_from_mtxB_translate_xyz(float x, float y, float z)
entry mathutil_mtxA_from_mtxB_translate_xyz
    lis r4, LC_CACHE_BASE@ha

    lfs f4, OFFSET_CONST_ONE(r4)
    ps_merge00 f1, f1, f2
    ps_merge00 f3, f3, f4

lbl_800076FC:
    psq_l   f4, OFFSET_MTX_B+0(r4), 0, GQR_F32
    psq_st  f4, OFFSET_MTX_A+0(r4), 0, GQR_F32
    ps_mul  f4, f4, f1
    psq_l   f6, OFFSET_MTX_B+16(r4), 0, GQR_F32
    psq_st  f6, OFFSET_MTX_A+16(r4), 0, GQR_F32
    ps_mul  f6, f6, f1
    psq_l   f8, OFFSET_MTX_B+32(r4), 0, GQR_F32
    psq_st  f8, OFFSET_MTX_A+32(r4), 0, GQR_F32
    ps_mul  f8, f8, f1
    psq_l   f5, OFFSET_MTX_B+8(r4), 0, GQR_F32
    ps_madd f4, f5, f3, f4
    psq_l   f7, OFFSET_MTX_B+24(r4), 0, GQR_F32
    ps_madd f6, f7, f3, f6
    psq_l   f9, OFFSET_MTX_B+40(r4), 0, GQR_F32
    ps_madd f8, f9, f3, f8
    ps_sum1 f5, f4, f5, f4
    psq_st  f5, OFFSET_MTX_A+8(r4), 0, GQR_F32
    ps_sum1 f7, f6, f7, f6
    psq_st  f7, OFFSET_MTX_A+24(r4), 0, GQR_F32
    ps_sum1 f9, f8, f9, f8
    psq_st  f9, OFFSET_MTX_A+40(r4), 0, GQR_F32
    blr
}

asm void mathutil_mtxA_normalize_basis(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    mflr r4
    lfs f2, OFFSET_CONST_ONE_HALF(r3)
    psq_l f6, OFFSET_MTX_A+0(r3), 0, GQR_F32
    lfs f7, OFFSET_MTX_A+8(r3)
    ps_mul f12, f6, f6
    psq_l f8, OFFSET_MTX_A+16(r3), 0, GQR_F32
    fmuls f13, f7, f7
    lfs f9, OFFSET_MTX_A+24(r3)
    ps_madd f12, f8, f8, f12
    psq_l f10, OFFSET_MTX_A+32(r3), 0, GQR_F32
    fmadds f13, f9, f9, f13
    lfs f11, OFFSET_MTX_A+40(r3)
    ps_madd f12, f10, f10, f12
    fmadds f13, f11, f11, f13
    fmr f1, f12
    bl approx_rsqrt
    frsp f1, f1
    ps_merge01 f12, f1, f12
    ps_merge11 f1, f12, f12
    bl approx_rsqrt
    frsp f1, f1
    ps_merge00 f1, f12, f1
    ps_mul f6, f6, f1
    psq_st f6, OFFSET_MTX_A+0(r3), 0, GQR_F32
    ps_mul f8, f8, f1
    psq_st f8, OFFSET_MTX_A+16(r3), 0, GQR_F32
    ps_mul f10, f10, f1
    psq_st f10, OFFSET_MTX_A+32(r3), 0, GQR_F32
    fmr f1, f13
    bl approx_rsqrt
    mtlr r4
    fmuls f7, f7, f1
    stfs f7, OFFSET_MTX_A+8(r3)
    fmuls f9, f9, f1
    stfs f9, OFFSET_MTX_A+24(r3)
    fmuls f11, f11, f1
    stfs f11, OFFSET_MTX_A+40(r3)
    blr
}

asm void mathutil_mtxA_push(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A
    lwz r4, OFFSET_MTX_STACK_PTR(r3)  // get matrix stack pointer

    // load from Matrix A
    psq_l f0, 0(r3), 0, GQR_F32
    psq_l f1, 8(r3), 0, GQR_F32
    psq_l f2, 16(r3), 0, GQR_F32
    addi r4, r4, -48  // increment matrix stack pointer
    psq_l f3, 24(r3), 0, GQR_F32
    psq_l f4, 32(r3), 0, GQR_F32
    psq_l f5, 40(r3), 0, GQR_F32

    // store to stack matrix
    psq_st f0, 0(r4), 0, GQR_F32
    psq_st f1, 8(r4), 0, GQR_F32
    psq_st f2, 16(r4), 0, GQR_F32
    psq_st f3, 24(r4), 0, GQR_F32
    psq_st f4, 32(r4), 0, GQR_F32
    psq_st f5, 40(r4), 0, GQR_F32

    stw r4, 0x94(r3)  // set new stack pointer

    blr
}

asm void mathutil_mtxA_pop(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A
    lwz r4, OFFSET_MTX_STACK_PTR(r3)  // get matrix stack pointer

    // load from stack matrix
    psq_l f0, 0(r4), 0, GQR_F32
    psq_l f1, 8(r4), 0, GQR_F32
    psq_l f2, 16(r4), 0, GQR_F32
    psq_l f3, 24(r4), 0, GQR_F32
    psq_l f4, 32(r4), 0, GQR_F32
    psq_l f5, 40(r4), 0, GQR_F32

    addi r4, r4, sizeof(Mtx)  // increment matrix stack pointer

    // store to Matrix A
    psq_st f0, OFFSET_MTX_A+0(r3), 0, GQR_F32
    psq_st f1, OFFSET_MTX_A+8(r3), 0, GQR_F32
    psq_st f2, OFFSET_MTX_A+16(r3), 0, GQR_F32
    psq_st f3, OFFSET_MTX_A+24(r3), 0, GQR_F32
    psq_st f4, OFFSET_MTX_A+32(r3), 0, GQR_F32
    psq_st f5, OFFSET_MTX_A+40(r3), 0, GQR_F32

    stw r4, 0x94(r3)  // set new stack pointer

    blr
}

asm void mathutil_mtxA_to_mtx(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha  // get pointer to Matrix A

    // load from Matrix A
    psq_l f0, OFFSET_MTX_A+0(r4), 0, GQR_F32
    psq_l f1, OFFSET_MTX_A+8(r4), 0, GQR_F32
    psq_l f2, OFFSET_MTX_A+16(r4), 0, GQR_F32
    psq_l f3, OFFSET_MTX_A+24(r4), 0, GQR_F32
    psq_l f4, OFFSET_MTX_A+32(r4), 0, GQR_F32
    psq_l f5, OFFSET_MTX_A+40(r4), 0, GQR_F32

    // store to dest matrix
    psq_st f0, 0(mtx), 0, GQR_F32
    psq_st f1, 8(mtx), 0, GQR_F32
    psq_st f2, 16(mtx), 0, GQR_F32
    psq_st f3, 24(mtx), 0, GQR_F32
    psq_st f4, 32(mtx), 0, GQR_F32
    psq_st f5, 40(mtx), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_from_mtx(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha  // get pointer to Matrix A

    // load from src matrix
    psq_l f0, 0(mtx), 0, GQR_F32
    psq_l f1, 8(mtx), 0, GQR_F32
    psq_l f2, 16(mtx), 0, GQR_F32
    psq_l f3, 24(mtx), 0, GQR_F32
    psq_l f4, 32(mtx), 0, GQR_F32
    psq_l f5, 40(mtx), 0, GQR_F32

    // store to Matrix A
    psq_st f0, OFFSET_MTX_A+0(r4), 0, GQR_F32
    psq_st f1, OFFSET_MTX_A+8(r4), 0, GQR_F32
    psq_st f2, OFFSET_MTX_A+16(r4), 0, GQR_F32
    psq_st f3, OFFSET_MTX_A+24(r4), 0, GQR_F32
    psq_st f4, OFFSET_MTX_A+32(r4), 0, GQR_F32
    psq_st f5, OFFSET_MTX_A+40(r4), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_peek(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A
    lwz r4, OFFSET_MTX_STACK_PTR(r3)  // get matrix stack pointer

    // load from stack matrix
    psq_l f0, 0(r4), 0, GQR_F32
    psq_l f1, 8(r4), 0, GQR_F32
    psq_l f2, 16(r4), 0, GQR_F32
    psq_l f3, 24(r4), 0, GQR_F32
    psq_l f4, 32(r4), 0, GQR_F32
    psq_l f5, 40(r4), 0, GQR_F32

    // store to Matrix A
    psq_st f0, OFFSET_MTX_A+0(r3), 0, GQR_F32
    psq_st f1, OFFSET_MTX_A+8(r3), 0, GQR_F32
    psq_st f2, OFFSET_MTX_A+16(r3), 0, GQR_F32
    psq_st f3, OFFSET_MTX_A+24(r3), 0, GQR_F32
    psq_st f4, OFFSET_MTX_A+32(r3), 0, GQR_F32
    psq_st f5, OFFSET_MTX_A+40(r3), 0, GQR_F32

    blr
}

asm void func_80007924(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    lwz r4, OFFSET_MTX_STACK_PTR(r3)
    addi r4, r4, sizeof(Mtx)
    stw r4, OFFSET_MTX_STACK_PTR(r3)
    blr
    blr
}

asm void mathutil_mtxA_sq_to_mtx(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha  // get pointer to Matrix A

    psq_l f0, OFFSET_MTX_A+0(r4), 0, GQR_F32
    lfs   f1, OFFSET_MTX_A+8(r4)
    psq_l f2, OFFSET_MTX_A+16(r4), 0, GQR_F32
    lfs   f3, OFFSET_MTX_A+24(r4)
    psq_l f4, OFFSET_MTX_A+32(r4), 0, GQR_F32
    lfs   f5, OFFSET_MTX_A+40(r4)

    psq_st f0, 0(mtx), 0, GQR_F32
    stfs   f1, 8(mtx)
    psq_st f2, 16(mtx), 0, GQR_F32
    stfs   f3, 24(mtx)
    psq_st f4, 32(mtx), 0, GQR_F32
    stfs   f5, 40(mtx)

    blr
}

asm void mathutil_mtxA_sq_from_mtx(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha  // get pointer to Matrix A

    psq_l f0, 0(mtx), 0, GQR_F32
    lfs   f1, 8(mtx)
    psq_l f2, 16(mtx), 0, GQR_F32
    lfs   f3, 0x18(mtx)
    psq_l f4, 32(mtx), 0, GQR_F32
    lfs   f5, 0x28(mtx)

    psq_st f0, OFFSET_MTX_A+0(r4), 0, GQR_F32
    stfs   f1, OFFSET_MTX_A+8(r4)
    psq_st f2, OFFSET_MTX_A+16(r4), 0, GQR_F32
    stfs   f3, OFFSET_MTX_A+24(r4)
    psq_st f4, OFFSET_MTX_A+32(r4), 0, GQR_F32
    stfs   f5, OFFSET_MTX_A+40(r4)

    blr
}

asm void mathutil_mtxA_from_mtxB(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A

    // load from Matrix B
    psq_l f0, OFFSET_MTX_B+0(r3), 0, GQR_F32
    psq_l f1, OFFSET_MTX_B+8(r3), 0, GQR_F32
    psq_l f2, OFFSET_MTX_B+16(r3), 0, GQR_F32
    psq_l f3, OFFSET_MTX_B+24(r3), 0, GQR_F32
    psq_l f4, OFFSET_MTX_B+32(r3), 0, GQR_F32
    psq_l f5, OFFSET_MTX_B+40(r3), 0, GQR_F32

    // store to Matrix A
    psq_st f0, OFFSET_MTX_A+0(r3), 0, GQR_F32
    psq_st f1, OFFSET_MTX_A+8(r3), 0, GQR_F32
    psq_st f2, OFFSET_MTX_A+16(r3), 0, GQR_F32
    psq_st f3, OFFSET_MTX_A+24(r3), 0, GQR_F32
    psq_st f4, OFFSET_MTX_A+32(r3), 0, GQR_F32
    psq_st f5, OFFSET_MTX_A+40(r3), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_to_mtxB(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A

    // load from Matrix A
    psq_l f0, OFFSET_MTX_A+0(r3), 0, GQR_F32
    psq_l f1, OFFSET_MTX_A+8(r3), 0, GQR_F32
    psq_l f2, OFFSET_MTX_A+16(r3), 0, GQR_F32
    psq_l f3, OFFSET_MTX_A+24(r3), 0, GQR_F32
    psq_l f4, OFFSET_MTX_A+32(r3), 0, GQR_F32
    psq_l f5, OFFSET_MTX_A+40(r3), 0, GQR_F32

    // store to Matrix B
    psq_st f0, OFFSET_MTX_B+0(r3), 0, GQR_F32
    psq_st f1, OFFSET_MTX_B+8(r3), 0, GQR_F32
    psq_st f2, OFFSET_MTX_B+16(r3), 0, GQR_F32
    psq_st f3, OFFSET_MTX_B+24(r3), 0, GQR_F32
    psq_st f4, OFFSET_MTX_B+32(r3), 0, GQR_F32
    psq_st f5, OFFSET_MTX_B+40(r3), 0, GQR_F32

    blr
}

asm void mathutil_mtx_copy(register Mtx src, register Mtx dest)
{
    nofralloc

    // load from src matrix
    psq_l f0, 0(src), 0, GQR_F32
    psq_l f1, 8(src), 0, GQR_F32
    psq_l f2, 16(src), 0, GQR_F32
    psq_l f3, 24(src), 0, GQR_F32
    psq_l f4, 32(src), 0, GQR_F32
    psq_l f5, 40(src), 0, GQR_F32

    // store to dest matrix
    psq_st f0, 0(dest), 0, GQR_F32
    psq_st f1, 8(dest), 0, GQR_F32
    psq_st f2, 16(dest), 0, GQR_F32
    psq_st f3, 24(dest), 0, GQR_F32
    psq_st f4, 32(dest), 0, GQR_F32
    psq_st f5, 40(dest), 0, GQR_F32

    blr
}

asm void mathutil_mtxA_invert(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha

    stfd f14, 0x98(r3)
    stfd f15, 0xa0(r3)
    stfd f16, 0xa8(r3)
    stfd f17, 0xb0(r3)
    stfd f18, 0xb8(r3)
    stfd f19, 0xc0(r3)
    stfd f20, 0xc8(r3)
    stfd f21, 0xd0(r3)
    stfd f22, 0xd8(r3)
    stfd f23, 0xe0(r3)
    stfd f24, 0xe8(r3)

    lfs f10, OFFSET_MTX_A+36(r3)
    lfs f7, OFFSET_MTX_A+24(r3)
    fmuls f13, f10, f7
    lfs f2, OFFSET_MTX_A+4(r3)
    lfs f11, OFFSET_MTX_A+40(r3)
    fmuls f14, f2, f11
    lfs f6, OFFSET_MTX_A+20(r3)
    lfs f3, OFFSET_MTX_A+8(r3)
    fmuls f15, f6, f3
    lfs f5, OFFSET_MTX_A+16(r3)
    fmuls f17, f11, f5
    fmuls f23, f5, f2
    lfs f9, OFFSET_MTX_A+32(r3)
    fmuls f18, f3, f9
    fmuls f21, f9, f6
    lfs f1, OFFSET_MTX_A+0(r3)
    fmuls f19, f7, f1
    fmuls f22, f1, f10
    lfs f4, OFFSET_MTX_A+12(r3)
    fmsubs f13, f6, f11, f13
    lfs f8, OFFSET_MTX_A+28(r3)
    fmsubs f14, f10, f3, f14
    lfs f12, OFFSET_MTX_A+44(r3)
    fmsubs f15, f2, f7, f15
    fmsubs f17, f7, f9, f17
    fmsubs f18, f11, f1, f18
    fmsubs f19, f3, f5, f19
    fmsubs f21, f5, f10, f21
    fmsubs f22, f9, f2, f22
    fmsubs f23, f1, f6, f23
    fmuls f0, f1, f13
    lfs f1, OFFSET_CONST_ONE(r3)
    fmuls f16, f4, f13
    fmuls f20, f4, f17
    fmadds f0, f5, f14, f0
    fmuls f24, f4, f21
    fmadds f16, f8, f14, f16
    fmadds f0, f9, f15, f0
    fmadds f20, f8, f18, f20
    fmadds f24, f8, f22, f24
    fdivs f0, f1, f0
    fnmadds f16, f12, f15, f16
    fnmadds f20, f12, f19, f20
    fnmadds f24, f12, f23, f24
    fmuls f1, f13, f0
    stfs f1, OFFSET_MTX_A+0(r3)
    fmuls f2, f14, f0
    stfs f2, OFFSET_MTX_A+4(r3)
    fmuls f3, f15, f0
    stfs f3, OFFSET_MTX_A+8(r3)
    fmuls f4, f16, f0
    stfs f4, OFFSET_MTX_A+12(r3)
    fmuls f5, f17, f0
    stfs f5, OFFSET_MTX_A+16(r3)
    fmuls f6, f18, f0
    stfs f6, OFFSET_MTX_A+20(r3)
    fmuls f7, f19, f0
    stfs f7, OFFSET_MTX_A+24(r3)
    fmuls f8, f20, f0
    stfs f8, OFFSET_MTX_A+28(r3)
    fmuls f9, f21, f0
    stfs f9, OFFSET_MTX_A+32(r3)
    fmuls f10, f22, f0
    stfs f10, OFFSET_MTX_A+36(r3)
    fmuls f11, f23, f0
    stfs f11, OFFSET_MTX_A+40(r3)
    fmuls f12, f24, f0
    stfs f12, OFFSET_MTX_A+44(r3)

    lfd f14, 0x98(r3)
    lfd f15, 0xa0(r3)
    lfd f16, 0xa8(r3)
    lfd f17, 0xb0(r3)
    lfd f18, 0xb8(r3)
    lfd f19, 0xc0(r3)
    lfd f20, 0xc8(r3)
    lfd f21, 0xd0(r3)
    lfd f22, 0xd8(r3)
    lfd f23, 0xe0(r3)
    lfd f24, 0xe8(r3)
    blr
}

asm void mathutil_mtxA_rigid_invert(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    lfs f3,   OFFSET_MTX_A+12(r3)
    lfs f0,   OFFSET_MTX_A+0(r3)
    lfs f1,   OFFSET_MTX_A+4(r3)
    lfs f2,   OFFSET_MTX_A+8(r3)
    fmuls f12, f3, f0
    lfs f7,   OFFSET_MTX_A+28(r3)
    fmuls f13, f3, f1
    lfs f4,   OFFSET_MTX_A+16(r3)
    fmuls f0, f3, f2
    lfs f5,   OFFSET_MTX_A+20(r3)
    lfs f6,   OFFSET_MTX_A+24(r3)
    fmadds f12, f7, f4, f12
    lfs f11,  OFFSET_MTX_A+44(r3)
    lfs f8,   OFFSET_MTX_A+32(r3)
    fmadds f13, f7, f5, f13
    lfs f9,   OFFSET_MTX_A+36(r3)
    lfs f10,  OFFSET_MTX_A+40(r3)
    fmadds f0, f7, f6, f0
    stfs f1,  OFFSET_MTX_A+16(r3)
    stfs f2,  OFFSET_MTX_A+32(r3)
    fnmadds f12, f11, f8, f12
    stfs f6,  OFFSET_MTX_A+36(r3)
    stfs f4,  OFFSET_MTX_A+4(r3)
    fnmadds f13, f11, f9, f13
    stfs f8,  OFFSET_MTX_A+8(r3)
    stfs f9,  OFFSET_MTX_A+24(r3)
    fnmadds f0, f11, f10, f0
    stfs f12, OFFSET_MTX_A+12(r3)
    stfs f13, OFFSET_MTX_A+28(r3)
    stfs f0,  OFFSET_MTX_A+44(r3)

    blr
}

asm void mathutil_mtxA_mult_right(Mtx mtx)
{
    nofralloc

    lis r6, LC_CACHE_BASE@ha
    mr r4, r3
    addi r3, r6, OFFSET_MTX_A
    addi r5, r6, OFFSET_MTX_A
    b @do_mult

// void mathutil_mtxA_mult_left(Mtx mtx)
entry mathutil_mtxA_mult_left
    lis r6, LC_CACHE_BASE@ha
    addi r4, r6, OFFSET_MTX_A
    addi r5, r6, OFFSET_MTX_A
    b @do_mult

// void mathutil_mtxA_from_mtxB_mult_mtx(Mtx mtx)
entry mathutil_mtxA_from_mtxB_mult_mtx
    lis r6, LC_CACHE_BASE@ha
    mr r4, r3
    addi r3, r6, OFFSET_MTX_B
    addi r5, r6, OFFSET_MTX_A
    b @do_mult

// void mathutil_mtx_mult(Mtx a, Mtx b, Mtx c)
entry mathutil_mtx_mult
    lis r6, LC_CACHE_BASE@ha

@do_mult:
    psq_l f0, 0(r4), 0, GQR_F32
    psq_l f11, 0(r3), 0, GQR_F32
    psq_l f1, 8(r4), 0, GQR_F32
    psq_l f12, 16(r3), 0, GQR_F32
    psq_l f2, 16(r4), 0, GQR_F32
    ps_muls0 f5, f0, f11
    psq_l f13, 32(r3), 0, GQR_F32
    ps_muls0 f7, f0, f12
    psq_l f3, 24(r4), 0, GQR_F32
    ps_muls0 f9, f0, f13
    ps_muls0 f6, f1, f11
    psq_l f4, 32(r4), 0, GQR_F32
    ps_muls0 f8, f1, f12
    ps_muls0 f10, f1, f13
    psq_l f0, 40(r4), 0, GQR_F32
    ps_madds1 f5, f2, f11, f5
    ps_madds1 f7, f2, f12, f7
    psq_l f1, 8(r3), 0, GQR_F32
    ps_madds1 f9, f2, f13, f9
    ps_madds1 f6, f3, f11, f6
    psq_l f2, 24(r3), 0, GQR_F32
    ps_madds1 f8, f3, f12, f8
    ps_madds1 f10, f3, f13, f10
    psq_l f3, 40(r3), 0, GQR_F32
    ps_madds0 f5, f4, f1, f5
    ps_madds0 f7, f4, f2, f7
    psq_l f11, 428(r6), 0, GQR_U8
    ps_madds0 f9, f4, f3, f9
    ps_madds0 f6, f0, f1, f6
    psq_st f5, 0(r5), 0, GQR_F32
    ps_madds0 f8, f0, f2, f8
    psq_st f7, 16(r5), 0, GQR_F32
    ps_madds0 f10, f0, f3, f10
    psq_st f9, 32(r5), 0, GQR_F32
    ps_madd f6, f11, f1, f6
    ps_madd f8, f11, f2, f8
    psq_st f6, 8(r5), 0, GQR_F32
    ps_madd f10, f11, f3, f10
    psq_st f8, 24(r5), 0, GQR_F32
    psq_st f10, 40(r5), 0, GQR_F32
    blr
}

asm void mathutil_mtxA_translate(register Vec *vec)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha
    psq_l f1, 0(r3), 0, GQR_F32
    psq_l f3, 8(r3), 1, GQR_F32
    b @do_translate

// void mathutil_mtxA_translate_xyz(float x, float y, float z)
entry mathutil_mtxA_translate_xyz
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f1, f1, f2
    lfs f0, OFFSET_CONST_ONE(r4)
    ps_merge00 f3, f3, f0
    b @do_translate

// void mathutil_mtxA_translate_neg(Vec *vec)
entry mathutil_mtxA_translate_neg
    lis r4, LC_CACHE_BASE@ha
    lfs f3, 8(r3)
    psq_l f1, 0(r3), 0, GQR_F32
    b @negate

// void mathutil_mtxA_translate_neg_xyz(float x, float y, float z)
entry mathutil_mtxA_translate_neg_xyz
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f1, f1, f2

@negate:
    lfs f0, OFFSET_CONST_ONE(r4)
    fneg f3, f3
    ps_neg f1, f1
    ps_merge00 f3, f3, f0

@do_translate:
    psq_l f4, 0(r4), 0, GQR_F32
    psq_l f6, 16(r4), 0, GQR_F32
    psq_l f8, 32(r4), 0, GQR_F32
    ps_mul f4, f4, f1
    psq_l f5, 8(r4), 0, GQR_F32
    ps_mul f6, f6, f1
    psq_l f7, 24(r4), 0, GQR_F32
    ps_mul f8, f8, f1
    psq_l f9, 40(r4), 0, GQR_F32
    ps_madd f4, f5, f3, f4
    ps_madd f6, f7, f3, f6
    ps_madd f8, f9, f3, f8
    ps_sum0 f4, f4, f4, f4
    stfs f4, 12(r4)
    ps_sum0 f6, f6, f6, f6
    stfs f6, 28(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, 44(r4)
    blr
}

asm void mathutil_mtxA_scale(Vec *vec)
{
    nofralloc

    psq_l f1, 0(r3), 0, GQR_F32
    lis r4, LC_CACHE_BASE@ha
    lfs f3, 8(r3)
    b @do_scale

// void mathutil_mtxA_scale_s(float scale)
entry mathutil_mtxA_scale_s
    lis r4, LC_CACHE_BASE@ha
    fmr f3, f1
    ps_merge00 f1, f1, f1
    b @do_scale

// void mathutil_mtxA_scale_xyz(float x, float y, float z)
entry mathutil_mtxA_scale_xyz
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f1, f1, f2

@do_scale:
    psq_l f0, 0(r4), 0, GQR_F32
    lfs f4, 8(r4)
    psq_l f5, 16(r4), 0, GQR_F32
    ps_mul f0, f0, f1
    lfs f6, 24(r4)
    fmuls f4, f4, f3
    psq_l f7, 32(r4), 0, GQR_F32
    lfs f8, 40(r4)
    ps_mul f5, f5, f1
    psq_st f0, 0(r4), 0, GQR_F32
    fmuls f6, f6, f3
    stfs f4, 8(r4)
    psq_st f5, 16(r4), 0, GQR_F32
    ps_mul f7, f7, f1
    stfs f6, 24(r4)
    psq_st f7, 32(r4), 0, GQR_F32
    fmuls f8, f8, f3
    stfs f8, 40(r4)
    blr
}

asm void mathutil_mtxA_tf_point(Vec *src, Vec *dest)
{
    nofralloc

    lis r5, LC_CACHE_BASE@ha
    psq_l f1, 0(r3), 0, GQR_F32
    psq_l f3, 8(r3), 1, GQR_F32
    b @do_tf

// void mathutil_mtxA_tf_vec(Vec *vec)
entry mathutil_mtxA_tf_vec
    lis r5, LC_CACHE_BASE@ha
    lfs f3, 8(r3)
    lfs f0, OFFSET_CONST_ZERO(r5)
    psq_l f1, 0(r3), 0, GQR_F32
    ps_merge00 f3, f3, f0
    b @do_tf

// void mathutil_mtxA_tf_point_xyz(Vec *vec)
entry mathutil_mtxA_tf_point_xyz
    lis r5, LC_CACHE_BASE@ha
    ps_merge00 f1, f1, f2
    lfs f0, OFFSET_CONST_ONE(r5)
    mr r4, r3
    ps_merge00 f3, f3, f0
    b @do_tf

// void mathutil_mtxA_tf_vec_xyz(Vec *vec)
entry mathutil_mtxA_tf_vec_xyz
    lis r5, LC_CACHE_BASE@ha
    ps_merge00 f1, f1, f2
    lfs f0, OFFSET_CONST_ZERO(r5)
    mr r4, r3
    ps_merge00 f3, f3, f0

@do_tf:
    psq_l f4, 0(r5), 0, GQR_F32
    psq_l f6, 16(r5), 0, GQR_F32
    ps_mul f4, f4, f1
    psq_l f8, 32(r5), 0, GQR_F32
    ps_mul f6, f6, f1
    psq_l f5, 8(r5), 0, GQR_F32
    ps_mul f8, f8, f1
    psq_l f7, 24(r5), 0, GQR_F32
    ps_madd f4, f5, f3, f4
    psq_l f9, 40(r5), 0, GQR_F32
    ps_madd f6, f7, f3, f6
    ps_madd f8, f9, f3, f8
    ps_sum0 f4, f4, f4, f4
    stfs f4, 0(r4)
    ps_sum0 f6, f6, f6, f6
    stfs f6, 4(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, 8(r4)
    blr
}

asm void mathutil_mtxA_rigid_inv_tf_point(Vec *vec)
{
    nofralloc

    lfs f1, 0(r3)
    lfs f2, 4(r3)
    lfs f3, 8(r3)
    b lbl_80007EE0
    mr r4, r3
lbl_80007EE0:
    lis r5, LC_CACHE_BASE@ha
    crclr 2
    lfs f10, 12(r5)
    lfs f11, 28(r5)
    lfs f12, 44(r5)
    fsubs f1, f1, f10
    fsubs f2, f2, f11
    fsubs f3, f3, f12
    b lbl_80007F3C

// void mathutil_mtxA_rigid_inv_tf_tl(Vec *dest)
entry mathutil_mtxA_rigid_inv_tf_tl
    lis r5, LC_CACHE_BASE@ha
    mr r4, r3
    crset 2
    lfs f1, 12(r5)
    lfs f2, 28(r5)
    lfs f3, 44(r5)
    b lbl_80007F3C

// void mathutil_mtxA_rigid_inv_tf_vec(Vec *src, Vec *dest)
entry mathutil_mtxA_rigid_inv_tf_vec
    lfs f1, 0(r3)
    lfs f2, 4(r3)
    lfs f3, 8(r3)
    b lbl_80007F34

// void mathutil_mtxA_rigid_inv_tf_vec_xyz(float x, float y, float z)
entry mathutil_mtxA_rigid_inv_tf_vec_xyz
    mr r4, r3

lbl_80007F34:
    lis r5, LC_CACHE_BASE@ha
    crclr 2

lbl_80007F3C:
    psq_l f4, 0(r5), 0, GQR_F32
    lfs f5, 8(r5)
    ps_mul f4, f4, f1
    psq_l f6, 16(r5), 0, GQR_F32
    fmuls f5, f5, f1
    lfs f7, 24(r5)
    ps_madd f4, f6, f2, f4
    psq_l f8, 32(r5), 0, GQR_F32
    fmadds f5, f7, f2, f5
    lfs f9, 40(r5)
    beq lbl_80007F74
    ps_madd f4, f8, f3, f4
    fmadds f5, f9, f3, f5
    b lbl_80007F7C
lbl_80007F74:
    ps_nmadd f4, f8, f3, f4
    fnmadds f5, f9, f3, f5
lbl_80007F7C:
    psq_st f4, 0(r4), 0, GQR_F32
    stfs f5, 8(r4)
    blr
}

asm void mathutil_mtxA_rotate_x(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f0, f2, f1
    psq_l f3, OFFSET_MTX_A+4(r4), 0, GQR_F32
    psq_l f4, OFFSET_MTX_A+20(r4), 0, GQR_F32
    psq_l f5, OFFSET_MTX_A+36(r4), 0, GQR_F32
    ps_mul f6, f3, f0
    ps_mul f7, f4, f0
    ps_mul f8, f5, f0
    fneg f1, f1
    ps_sum0 f6, f6, f6, f6
    ps_sum0 f7, f7, f7, f7
    ps_sum0 f8, f8, f8, f8
    ps_merge00 f0, f1, f2
    stfs f6, OFFSET_MTX_A+4(r4)
    ps_mul f6, f3, f0
    stfs f7, OFFSET_MTX_A+20(r4)
    ps_mul f7, f4, f0
    stfs f8, OFFSET_MTX_A+36(r4)
    ps_mul f8, f5, f0
    ps_sum0 f6, f6, f6, f6
    stfs f6, OFFSET_MTX_A+8(r4)
    ps_sum0 f7, f7, f7, f7
    stfs f7, OFFSET_MTX_A+24(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, OFFSET_MTX_A+40(r4)
    blr
}

asm void mathutil_mtxA_rotate_y(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

// void mathutil_mtxA_rotate_y_sin_cos(float sinAngle, float cosAngle)
entry mathutil_mtxA_rotate_y_sin_cos
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f0, f1, f2
    lfs f3, OFFSET_MTX_A+0(r4)
    lfs f6, OFFSET_MTX_A+8(r4)
    lfs f4, OFFSET_MTX_A+16(r4)
    lfs f7, OFFSET_MTX_A+24(r4)
    lfs f5, OFFSET_MTX_A+32(r4)
    lfs f8, OFFSET_MTX_A+40(r4)
    ps_merge00 f3, f3, f6
    ps_merge00 f4, f4, f7
    ps_merge00 f5, f5, f8
    ps_mul f6, f3, f0
    ps_mul f7, f4, f0
    ps_mul f8, f5, f0
    fneg f1, f1
    ps_sum0 f6, f6, f6, f6
    ps_sum0 f7, f7, f7, f7
    ps_sum0 f8, f8, f8, f8
    ps_merge00 f0, f2, f1
    stfs f6, OFFSET_MTX_A+8(r4)
    ps_mul f6, f3, f0
    stfs f7, OFFSET_MTX_A+24(r4)
    ps_mul f7, f4, f0
    stfs f8, OFFSET_MTX_A+40(r4)
    ps_mul f8, f5, f0
    ps_sum0 f6, f6, f6, f6
    stfs f6, OFFSET_MTX_A+0(r4)
    ps_sum0 f7, f7, f7, f7
    stfs f7, OFFSET_MTX_A+16(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, OFFSET_MTX_A+32(r4)
    blr
}

asm void mathutil_mtxA_rotate_z(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

// void mathutil_mtxA_rotate_z_sin_cos(float sinAngle, float cosAngle)
entry mathutil_mtxA_rotate_z_sin_cos
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f0, f2, f1
    psq_l f3, OFFSET_MTX_A+0(r4), 0, GQR_F32
    psq_l f4, OFFSET_MTX_A+16(r4), 0, GQR_F32
    psq_l f5, OFFSET_MTX_A+32(r4), 0, GQR_F32
    ps_mul f6, f3, f0
    ps_mul f7, f4, f0
    ps_mul f8, f5, f0
    fneg f1, f1
    ps_sum0 f6, f6, f6, f6
    ps_sum0 f7, f7, f7, f7
    ps_sum0 f8, f8, f8, f8
    ps_merge00 f0, f1, f2
    stfs f6, OFFSET_MTX_A+0(r4)
    ps_mul f6, f3, f0
    stfs f7, OFFSET_MTX_A+16(r4)
    ps_mul f7, f4, f0
    stfs f8, OFFSET_MTX_A+32(r4)
    ps_mul f8, f5, f0
    ps_sum0 f6, f6, f6, f6
    stfs f6, OFFSET_MTX_A+4(r4)
    ps_sum0 f7, f7, f7, f7
    stfs f7, OFFSET_MTX_A+20(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, OFFSET_MTX_A+36(r4)
    blr
}

// Normalize a vector and return its original length
asm void mathutil_vec_normalize_len(register Vec *vec)
{
    nofralloc

    lis r5, LC_CACHE_BASE@ha

    lfs f6, vec->x
    lfs f7, vec->y
    lfs f8, vec->z

    fmuls f1, f6, f6
    fmadds f1, f7, f7, f1
    fmadds f1, f8, f8, f1  // f1 = vec->x*vec->x + vec->y*vec->y + vec->z*vec->z

    lfs f2, OFFSET_CONST_ONE_HALF(r5)
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    bso cr1, lbl_80008160
    bso lbl_80008160
    ble cr1, lbl_80008160
    fmr f0, f1
    mflr r4
    bl approx_rsqrt
    mtlr r4

    // divide each component by magnitude
    fmuls f6, f6, f1
    stfs f6, vec->x
    fmuls f7, f7, f1
    stfs f7, vec->y
    fmuls f8, f8, f1
    stfs f8, vec->z
    fmuls f1, f1, f0
    blr

lbl_80008160:
    lfs f1, OFFSET_CONST_ZERO(r5)
    stfs f1, vec->x
    stfs f1, vec->y
    stfs f1, vec->z
    blr
}

asm void mathutil_vec_set_len(register Vec *src, register Vec *dest, register float len)
{
    nofralloc

    lis r6, LC_CACHE_BASE@ha
    fmr f0, len
    lfs f6, src->x
    lfs f7, src->y
    lfs f8, src->z
    fmuls f1, f6, f6
    fmadds f1, f7, f7, f1
    fmadds f1, f8, f8, f1

    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, OFFSET_CONST_ONE_HALF(r6)
    bso cr1, lbl_800081D8
    bso lbl_800081D8
    ble cr1, lbl_800081D8
    mflr r5
    bl approx_rsqrt
    mtlr r5

    fmuls f1, f1, f0
    fmuls f6, f6, f1
    stfs f6, dest->x
    fmuls f7, f7, f1
    stfs f7, dest->y
    fmuls f8, f8, f1
    stfs f8, dest->z
    blr

lbl_800081D8:
    lfs f6, OFFSET_CONST_ZERO(r6)
    stfs f6, dest->x
    stfs f6, dest->y
    stfs f6, dest->z
    blr
}

// Dots the normalized versions of two vectors. Returns "safe" values if a vector
// is invalid
// (return 0 if a vector is the zero vector, or returns INFINITY if a vector has
// a component that's INFINITY).
asm float mathutil_vec_dot_normalized_safe(register Vec *a, register Vec *b)
{
    nofralloc

    lfs f1, a->x
    lfs f2, a->y
    lfs f3, a->z
    lfs f4, b->x
    lfs f5, b->y
    lfs f6, b->z
    lis r6, LC_CACHE_BASE@ha
    fmuls f8, f1, f1
    fmuls f9, f4, f4
    fmuls f7, f1, f4
    fmadds f8, f2, f2, f8
    fmadds f9, f5, f5, f9
    fmadds f7, f2, f5, f7
    fmadds f8, f3, f3, f8
    fmadds f9, f6, f6, f9
    fmadds f7, f3, f6, f7
    fmuls f1, f8, f9

    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, OFFSET_CONST_ONE_HALF(r6)
    bso cr1, lbl_800070EC
    bso _return_zero
    ble cr1, _return_zero
    mflr r5
    bl approx_rsqrt
    mtlr r5

    fmuls f1, f1, f7
    blr
}

asm void mathutil_mtxA_from_quat(register Quaternion *q)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha
    lfs f0, q->x
    lfs f1, q->y
    lfs f5, OFFSET_CONST_ONE(r4)
    lfs f2, q->z
    fsubs f4, f5, f5
    lfs f3, q->w
    fadds f6, f5, f5
    stfs f4, OFFSET_MTX_A+12(r4)
    stfs f4, OFFSET_MTX_A+28(r4)
    stfs f4, OFFSET_MTX_A+44(r4)
    fmuls f9, f0, f0
    fmuls f7, f1, f1
    fmuls f8, f2, f2
    fmadds f9, f2, f2, f9
    fmadds f7, f0, f0, f7
    fmadds f8, f1, f1, f8
    fnmsubs f9, f9, f6, f5
    stfs f9, OFFSET_MTX_A+20(r4)
    fnmsubs f7, f7, f6, f5
    stfs f7, OFFSET_MTX_A+40(r4)
    fnmsubs f8, f8, f6, f5
    stfs f8, OFFSET_MTX_A+0(r4)
    fadds f6, f0, f0
    fadds f4, f1, f1
    fadds f5, f2, f2
    fmuls f6, f3, f6
    fmuls f7, f3, f4
    fmuls f8, f3, f5
    fmsubs f9, f1, f5, f6
    stfs f9,  OFFSET_MTX_A+24(r4)
    fmadds f10, f1, f5, f6
    stfs f10, OFFSET_MTX_A+36(r4)
    fmsubs f11, f0, f5, f7
    stfs f11, OFFSET_MTX_A+32(r4)
    fmadds f12, f0, f5, f7
    stfs f12, OFFSET_MTX_A+8(r4)
    fmsubs f13, f0, f4, f8
    stfs f13, OFFSET_MTX_A+4(r4)
    fmadds f2, f0, f4, f8
    stfs f2,  OFFSET_MTX_A+16(r4)
    blr
}

asm void mathutil_quat_mult(register Quaternion *a, register Quaternion *b, register Quaternion *c)
{
    nofralloc

    lfs f4, b->x
    lfs f5, b->y
    lfs f6, b->z
    lfs f7, b->w

    lfs f8,  c->x
    lfs f9,  c->y
    lfs f10, c->z
    lfs f11, c->w

    fmul f0, f6, f9
    fmul f1, f4, f10
    fmul f2, f5, f8
    fmul f3, f6, f10
    fmsubs f0, f5, f10, f0
    fmsubs f1, f6, f8, f1
    fmsubs f2, f4, f9, f2
    fmadds f3, f5, f9, f3
    fmadds f0, f4, f11, f0
    fmadds f1, f5, f11, f1
    fmadds f2, f6, f11, f2
    fmadds f3, f4, f8, f3
    fmadds f0, f7, f8, f0
    fmadds f1, f7, f9, f1
    fmadds f2, f7, f10, f2
    fmsubs f3, f7, f11, f3

    stfs f0, a->x
    stfs f1, a->y
    stfs f2, a->z
    stfs f3, a->w
    blr
}

asm void func_80008378(float a, float b, float c)
{
    nofralloc

    ps_merge00 f0, f0, f1
    ps_merge00 f1, f2, f3
    b lbl_8000838C
    psq_l f0, 0(r3), 0, GQR_F32
    psq_l f1, 8(r3), 0, GQR_F32
lbl_8000838C:
    lis r5, LC_CACHE_BASE@ha
    ps_mul f2, f0, f0
    ps_madd f2, f1, f1, f2
    ps_sum0 f2, f2, f2, f2
    lfs f4, OFFSET_CONST_ZERO(r5)
    fcmpu cr0, f2, f4
    blt lbl_800083B4
    ps_merge00 f2, f2, f2
    ps_mul f0, f0, f2
    ps_mul f1, f1, f2
lbl_800083B4:
    psq_st f0, 0(r3), 0, GQR_F32
    psq_st f1, 8(r3), 0, GQR_F32
    blr
}

void g_math_unk6(Quaternion *q)
{
    float f2 = q->x * q->x + q->y * q->y + q->z * q->z + q->w * q->w;
    if (f2 < 1.19209289551e-07f)
    {
        q->x = 0.0f;
        q->y = 0.0f;
        q->z = 0.0f;
        q->w = 1.0f;
    }
    else
    {
        float recip = 1.0f / f2;
        q->x = -q->x * recip;
        q->y = -q->y * recip;
        q->z = -q->z * recip;
        q->w =  q->w * recip;
    }
}

void mathutil_normalize_vec_clamp_length();

/*
void func_80008458(void *a, void *b, void *c)
{
    Vec sp24;

    mathutil_normalize_vec_clamp_length(a, &sp24);

}
*/
