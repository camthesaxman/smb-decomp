#include <float.h>
#include <math.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

// GQR registers used for conversion
#define GQR_F32 0
#define GQR_U8  2
#define GQR_U16 3
#define GQR_S8  4
#define GQR_S16 5

u32 lbl_802F1B6C;
float lbl_802F1B68;

// sin/cos tables?
extern float tanTable[];
extern float sinTable[];

// prototypes needed for asm entry labels
void _return_nan();
void _return_zero();
void _return_inf();
void _return_neg_inf();
float _sqrt_return_special();
float _rsqrt_return_special();

#pragma force_active on

#ifdef __MWERKS__
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

    // GQR6 not used
    li r3, 0
    mtspr GQR6, r3

    // GQR7 not used
    li r3, 0
    mtspr GQR7, r3

    blr
}

asm float float_return_values()
{
    nofralloc

entry _return_nan
    lis r0, 0x7FFF
    b @return
entry _return_zero
    li r0, 0
    b @return
entry _return_inf
    lis r0, 0x7F80
    b @return
entry _return_neg_inf  // unused?
    lis r0, 0xFF80
    b @return
@return:
    stwu r0, -0x10(r1)
    lfs f1, 0(r1)
    addi r1, r1, 0x10
    blr
}
#endif

// Returns an approximation of the inverse square root of `num`
// TODO: use this once the callers have been converted to C
#ifndef __MWERKS__
float approx_rsqrt(register float num, register float oneHalf)
{
    float x = __frsqrte(num);

    /*
    x = x * (1.5f - 0.5f * num * x * x);
    x = x * (1.5f - 0.5f * num * x * x);
    x = x * (1.5f - 0.5f * num * x * x);
    */
    return x;
}
#else
asm float approx_rsqrt(register float num, register float oneHalf)
{
    nofralloc

    // f1 = num
    // f2 = 0.5

    fmul f4, f2, f1  // f4 = 0.5 * num
    fadd f3, f2, f2
    frsqrte f1, f1   // f1 = initial estimate
    fadd f3, f3, f2  // f3 = 1.5

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
#endif

#ifdef C_ONLY
float mathutil_rsqrt(double n)
{
    float x = __frsqrte(n);

    x = x * (1.5f - 0.5f * n * x * x);
    x = x * (1.5f - 0.5f * n * x * x);
    x = x * (1.5f - 0.5f * n * x * x);
    return x;
}

float mathutil_sqrt(double n)
{
    return mathutil_rsqrt(n) * n;
}
#else
asm float mathutil_sqrt_(double n)
{
    nofralloc

entry _sqrt_return_special
    bgt cr1, _return_inf
    blt cr1, _return_zero
    b _return_nan
// float mathutil_sqrt(double n)
entry mathutil_sqrt
    frsp f0, f1
    lis r4, LC_CACHE_BASE@ha
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, OFFSET_constOneHalfF(r4)
    bso cr1, _sqrt_return_special
    bso cr0, _return_zero
    ble cr1, _return_zero
    mflr r3
    bl approx_rsqrt
    mtlr r3
    fmuls f1, f1, f0
    blr

_rsqrt_return_special:
    bgt cr1, _return_zero
    blt cr1, _return_inf
    b _return_nan
// float mathutil_rsqrt(double n);
entry mathutil_rsqrt
    frsp f1, f1
    lis r4, LC_CACHE_BASE@ha
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, OFFSET_constOneHalfF(r4)
    bso cr1, _rsqrt_return_special
    bso cr0, _return_inf
    ble cr1, _return_inf
    mflr r3
    bl approx_rsqrt
    mtlr r3
    frsp f1, f1
    blr
}
#endif

#ifdef __MWERKS__
asm float func_8000716C(double a)
{
    nofralloc

    frsp f0, f1
    lis r4, LC_CACHE_BASE@ha
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, OFFSET_constOneHalfF(r4)
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
#endif

#ifdef C_ONLY
float mathutil_sin(int angle)
{
    int index = angle & 0x3FFF;
    float result;

    if (angle & 0x4000)
        index = 0x4000 - index;
    result = sinTable[index];
    return (angle & 0x8000) ? -result : result;
}
#else
asm float mathutil_sin(register int angle)
{
    nofralloc

    andi. r5, angle, 0x4000
    clrlwi r4, angle, 0x12
    beq @1
    subfic r4, r4, 0x4000
@1:
    lis r6, sinTable@h
    slwi r4, r4, 2
    ori r6, r6, sinTable@l
    andi. r5, angle, 0x8000
    lfsx f1, r6, r4
    beqlr
    fneg f1, f1
    blr
}
#endif

#ifdef __MWERKS__
asm void mathutil_sin_cos_v(int a, float b[2])
{
    nofralloc

    addi r5, r4, 4
entry func_80007214
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
    lis r8, sinTable@h
    slwi r6, r6, 2
    ori r8, r8, sinTable@l
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

#ifdef C_ONLY
float mathutil_tan(register u32 angle)
{
    int index = angle & 0x3FFF;

    if (angle & 0x4000)
        return -fabs(tanTable[0x4000 - index]);
    else
        return tanTable[index];
}
#else
asm float mathutil_tan(register u32 angle)
{
    nofralloc

    lis r4, tanTable@h
    andi. r6, angle, 0x4000
    rlwinm r5, angle, 2, 0x10, 0x1d
    ori r4, r4, tanTable@l
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
#endif

asm s16 mathutil_atan2(double a, float b)
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
    lfs f3, OFFSET_constOneF(r7)
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
    addis r4, r4, unknownTrigTable@ha
    addi r4, r4, unknownTrigTable@l
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
#endif  //__MWERKS__

s16 func_80007424(float a)
{
    s16 r3;

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

#ifdef C_ONLY
float mathutil_vec_dot_normalized(register Vec *vecA, register Vec *vecB)
{
    float f12 = vecA->z * vecA->z + vecA->y * vecA->y + vecA->x * vecA->x;
    float f13 = vecB->z * vecB->z + vecB->y * vecB->y + vecB->x * vecB->x;
    float f0  = vecA->z * vecB->z + vecA->y * vecB->y + vecA->x * vecB->x;
    return approx_rsqrt(f12 * f13, 0.5f) * f0;
}
#else
asm float mathutil_vec_dot_normalized(register Vec *vecA, register Vec *vecB)
{
    nofralloc

    lis r5, LC_CACHE_BASE@ha
    lfs f6, vecA->x
    lfs f9, vecB->x
    fmuls f12, f6, f6  // vecA->x * vecA->x
    lfs f7, vecA->y
    fmuls f13, f9, f9  // vecB->x * vecB->x
    lfs f10, vecB->y
    fmuls f0, f6, f9   // vecA->x * vecB->x
    lfs f8, vecA->z
    fmadds f12, f7, f7, f12  // vecA->y * vecA->y + vecA->x * vecA->x
    lfs f11, vecB->z
    fmadds f13, f10, f10, f13  // vecB->y * vecB->y + vecB->x * vecB->x
    fmadds f0, f7, f10, f0     // vecA->y * vecB->y + vecA->x * vecB->x
    fmadds f12, f8, f8, f12    // vecA->z * vecA->z + vecA->y * vecA->y + vecA->x * vecA->x
    fmadds f13, f11, f11, f13  // vecB->z * vecB->z + vecB->y * vecB->y + vecB->x * vecB->x
    fmadds f0, f8, f11, f0     // vecA->z * vecB->z + vecA->y * vecB->y + vecA->x * vecB->x
    lfs f2, OFFSET_constOneHalfF(r5)
    fmuls f1, f12, f13
    mflr r6
    bl approx_rsqrt
    mtlr r6
    fmuls f1, f1, f0
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtx_from_identity(register Mtx mtx)
{
    int row, col;

    for (row = 0; row < 3; row++)
    {
        for (col = 0; col < 4; col++)
            mtx[row][col] = (row == col) ? 1.0f : 0.0f;
    }
}
#else
asm void mathutil_mtx_from_identity(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha
    psq_l f1, OFFSET_constZeroOne(r4), 0, GQR_U8  // f1 = (0, 1)
    psq_l f2, OFFSET_constOneZero(r4), 0, GQR_U8  // f2 = (1, 0)
    ps_sub f0, f1, f1                             // f0 = (0, 0)

    psq_st f2, 0(mtx),  0, GQR_F32  // mtx[0][0] = 1, mtx[0][1] = 0
    psq_st f0, 8(mtx),  0, GQR_F32  // mtx[0][2] = 0, mtx[0][3] = 0
    psq_st f1, 16(mtx), 0, GQR_F32  // mtx[1][0] = 0, mtx[1][1] = 1
    psq_st f0, 24(mtx), 0, GQR_F32  // mtx[1][2] = 0, mtx[1][3] = 0
    psq_st f0, 32(mtx), 0, GQR_F32  // mtx[2][0] = 0, mtx[2][1] = 0
    psq_st f2, 40(mtx), 0, GQR_F32  // mtx[2][2] = 1, mtx[2][3] = 0

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_identity(void)
{
    mathutil_mtx_from_identity(mathutilData->mtxA);
}
#else
asm void mathutil_mtxA_from_identity(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    psq_l f1, OFFSET_constZeroOne(r3), 0, GQR_U8
    psq_l f2, OFFSET_constOneZero(r3), 0, GQR_U8
    ps_sub f0, f1, f1

    psq_st f2, OFFSET_mtxA+0(r3),  0, GQR_F32
    psq_st f0, OFFSET_mtxA+8(r3),  0, GQR_F32
    psq_st f1, OFFSET_mtxA+16(r3), 0, GQR_F32
    psq_st f0, OFFSET_mtxA+24(r3), 0, GQR_F32
    psq_st f0, OFFSET_mtxA+32(r3), 0, GQR_F32
    psq_st f2, OFFSET_mtxA+40(r3), 0, GQR_F32

    blr
}
#endif

#ifdef __MWERKS__
asm void mathutil_mtxA_sq_from_identity(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    psq_l f1, OFFSET_constZeroOne(r3), 0, GQR_U8
    psq_l f2, OFFSET_constOneZero(r3), 0, GQR_U8
    ps_sub f0, f1, f1

    psq_st f2, OFFSET_mtxA+0(r3),  0, GQR_F32
    psq_st f0, OFFSET_mtxA+8(r3),  1, GQR_F32
    psq_st f1, OFFSET_mtxA+16(r3), 0, GQR_F32
    psq_st f0, OFFSET_mtxA+24(r3), 1, GQR_F32
    psq_st f0, OFFSET_mtxA+32(r3), 0, GQR_F32
    psq_st f2, OFFSET_mtxA+40(r3), 1, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_translate(register Vec *vec)
{
    mathutil_mtxA_from_translate_xyz(vec->x, vec->y, vec->z);
}

void mathutil_mtxA_from_translate_xyz(float x, float y, float z)
{
    Mtx *m = &mathutilData->mtxA;

    (*m)[0][0] = 1;  (*m)[0][1] = 0;  (*m)[0][2] = 0;  (*m)[0][3] = x;
    (*m)[1][0] = 0;  (*m)[1][1] = 1;  (*m)[1][2] = 0;  (*m)[1][3] = y;
    (*m)[2][0] = 0;  (*m)[2][1] = 0;  (*m)[2][2] = 1;  (*m)[2][3] = z;
}
#else
asm void mathutil_mtxA_from_translate(register Vec *vec)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha
    psq_l f1, 0(vec), 0, GQR_F32   // f1 = (x, y)
    lfs f4, OFFSET_constZeroF(r4)
    lfs f3, 8(vec)                 // f3 = z
    ps_merge01 f9, f4, f1          // f9 = (0, y)
    b lbl_800075E0

// void mathutil_mtxA_from_translate_xyz(float x, float y, float z)
entry mathutil_mtxA_from_translate_xyz
    lis r4, LC_CACHE_BASE@ha
    lfs f4, OFFSET_constZeroF(r4)
    ps_merge00 f9, f4, f2          // f9 = (0, y)

    // f1 = (x, y), f3 = z, f9 = (0, y), f4 = 0
    // r4 = mathutilData
lbl_800075E0:
    lfs f7, OFFSET_constOneF(r4)
    ps_merge00 f8, f4, f1                         // f8 = (0, x)
    ps_merge00 f10, f7, f3                        // f10 = (1, z)
    psq_l f5, OFFSET_constZeroOne(r4), 0, GQR_U8  // f5 = (0, 1)
    psq_l f6, OFFSET_constOneZero(r4), 0, GQR_U8  // f6 = (1, 0)

    psq_st f4,  OFFSET_mtxA+32(r4), 0, GQR_F32  // mtxA[2][0] = 0, mtxA[2][1] = 0
    psq_st f8,  OFFSET_mtxA+8(r4),  0, GQR_F32  // mtxA[0][2] = 0, mtxA[0][3] = x
    psq_st f9,  OFFSET_mtxA+24(r4), 0, GQR_F32  // mtxA[1][2] = 0, mtxA[1][3] = y
    psq_st f10, OFFSET_mtxA+40(r4), 0, GQR_F32  // mtxA[2][2] = 1, mtxA[2][3] = z
    psq_st f5,  OFFSET_mtxA+16(r4), 0, GQR_F32  // mtxA[1][0] = 0, mtxA[1][1] = 1
    psq_st f6,  OFFSET_mtxA+0(r4),  0, GQR_F32  // mtxA[0][0] = 1, mtxA[0][1] = 0

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_rotate_x(s16 angle)
{
    Mtx *m = &mathutilData->mtxA;

    float s = mathutil_sin(angle);
    float c = mathutil_cos(angle);

    (*m)[0][0] =  1;  (*m)[0][1] = 0;  (*m)[0][2] =  0;  (*m)[0][3] = 0;
    (*m)[1][0] =  0;  (*m)[1][1] = c;  (*m)[1][2] = -s;  (*m)[1][3] = 0;
    (*m)[2][0] =  0;  (*m)[2][1] = s;  (*m)[2][2] =  c;  (*m)[2][3] = 0;
}
#else
asm void mathutil_mtxA_from_rotate_x(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

    lis r4, LC_CACHE_BASE@ha

    fneg f3, f1
    // f1 = sin
    // f2 = cos
    // f3 = -sin
    psq_l f4, OFFSET_constOneZero(r4), 0, GQR_U8
    ps_merge11 f6, f4, f4   // f6  = (0, 0)
    ps_merge10 f7, f4, f2   // f7  = (0, cos)
    ps_merge01 f8, f3, f4   // f8  = (-sin, 0)
    ps_merge10 f9, f4, f1   // f9  = (0, sin)
    ps_merge01 f10, f2, f4  // f10 = (cos, 0)

    psq_st f4,  OFFSET_mtxA+0(r4),  0, GQR_F32
    psq_st f6,  OFFSET_mtxA+8(r4),  0, GQR_F32
    psq_st f8,  OFFSET_mtxA+24(r4), 0, GQR_F32
    psq_st f7,  OFFSET_mtxA+16(r4), 0, GQR_F32
    psq_st f9,  OFFSET_mtxA+32(r4), 0, GQR_F32
    psq_st f10, OFFSET_mtxA+40(r4), 0, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_rotate_y(s16 angle)
{
    Mtx *m = &mathutilData->mtxA;

    float s = mathutil_sin(angle);
    float c = mathutil_cos(angle);

    (*m)[0][0] =  c;  (*m)[0][1] = 0;  (*m)[0][2] = s;  (*m)[0][3] = 0;
    (*m)[1][0] =  0;  (*m)[1][1] = 1;  (*m)[1][2] = 0;  (*m)[1][3] = 0;
    (*m)[2][0] = -s;  (*m)[2][1] = 0;  (*m)[2][2] = c;  (*m)[2][3] = 0;
}
#else
asm void mathutil_mtxA_from_rotate_y(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

    lis r4, LC_CACHE_BASE@ha

    fneg f3, f1
    // f1 = sin
    // f2 = cos
    // f3 = -sin
    psq_l f4, OFFSET_constZeroOne(r4), 0, GQR_U8
    ps_merge00 f5, f2, f4  // f5 = (cos, 0)
    ps_merge00 f6, f1, f4  // f6 = (sin, 0)
    ps_merge00 f8, f4, f4  // f8 = (0, 0)
    ps_merge00 f9, f3, f4  // f9 = (-sin, 0)

    psq_st f5, OFFSET_mtxA+0(r4), 0, GQR_F32
    psq_st f6, OFFSET_mtxA+8(r4), 0, GQR_F32
    psq_st f4, OFFSET_mtxA+16(r4), 0, GQR_F32
    psq_st f8, OFFSET_mtxA+24(r4), 0, GQR_F32
    psq_st f9, OFFSET_mtxA+32(r4), 0, GQR_F32
    psq_st f5, OFFSET_mtxA+40(r4), 0, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_rotate_z(s16 angle)
{
    Mtx *m = &mathutilData->mtxA;

    float s = mathutil_sin(angle);
    float c = mathutil_cos(angle);

    (*m)[0][0] = c;  (*m)[0][1] = -s;  (*m)[0][2] = 0;  (*m)[0][3] = 0;
    (*m)[1][0] = s;  (*m)[1][1] =  c;  (*m)[1][2] = 0;  (*m)[1][3] = 0;
    (*m)[2][0] = 0;  (*m)[2][1] =  0;  (*m)[2][2] = 1;  (*m)[2][3] = 0;
}
#else
asm void mathutil_mtxA_from_rotate_z(s16 angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

    lis r4, LC_CACHE_BASE@ha

    fneg f3, f1
    // f1 = sin
    // f2 = cos
    // f3 = -sin
    psq_l f4, OFFSET_constOneZero(r4), 0, GQR_U8
    ps_merge00 f5, f2, f3  // f5 = (cos, -sin)
    ps_merge11 f6, f4, f4  // f6 = (0, 0)
    ps_merge00 f7, f1, f2  // f7 = (sin, cos)

    psq_st f5, OFFSET_mtxA+0(r4), 0, GQR_F32
    psq_st f6, OFFSET_mtxA+8(r4), 0, GQR_F32
    psq_st f7, OFFSET_mtxA+16(r4), 0, GQR_F32
    psq_st f6, OFFSET_mtxA+24(r4), 0, GQR_F32
    psq_st f6, OFFSET_mtxA+32(r4), 0, GQR_F32
    psq_st f4, OFFSET_mtxA+40(r4), 0, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_mtxB_translate_xyz(float x, float y, float z)
{
    Mtx *a = &mathutilData->mtxA;
    Mtx *b = &mathutilData->mtxB;

    (*a)[0][0] = (*b)[0][0];
    (*a)[0][1] = (*b)[0][1];
    (*a)[0][2] = (*b)[0][2];
    (*a)[0][3] = (*b)[0][0]*x + (*b)[0][1]*y + (*b)[0][2]*z + (*b)[0][3];

    (*a)[1][0] = (*b)[1][0];
    (*a)[1][1] = (*b)[1][1];
    (*a)[1][2] = (*b)[1][2];
    (*a)[1][3] = (*b)[1][0]*x + (*b)[1][1]*y + (*b)[1][2]*z + (*b)[1][3];

    (*a)[2][0] = (*b)[2][0];
    (*a)[2][1] = (*b)[2][1];
    (*a)[2][2] = (*b)[2][2];
    (*a)[2][3] = (*b)[2][0]*x + (*b)[2][1]*y + (*b)[2][2]*z + (*b)[2][3];
}

void mathutil_mtxA_from_mtxB_translate(register Vec *vec)
{
    mathutil_mtxA_from_mtxB_translate_xyz(vec->x, vec->y, vec->z);
}
#else
asm void mathutil_mtxA_from_mtxB_translate(register Vec *vec)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha

    psq_l f1, 0(vec), 0, GQR_F32  // f1 = (x, y)
    psq_l f3, 8(vec), 1, GQR_F32  // f3 = (z, 1)
    b lbl_800076FC

// void mathutil_mtxA_from_mtxB_translate_xyz(float x, float y, float z)
entry mathutil_mtxA_from_mtxB_translate_xyz
    lis r4, LC_CACHE_BASE@ha
    lfs f4, OFFSET_constOneF(r4)
    ps_merge00 f1, f1, f2  // f1 = (x, y)
    ps_merge00 f3, f3, f4  // f3 = (z, 1)

lbl_800076FC:
    psq_l   f4, OFFSET_mtxB+0x00(r4), 0, GQR_F32  // f4 = (mtxB[0][0], mtxB[0][1])
    psq_st  f4, OFFSET_mtxA+0x00(r4), 0, GQR_F32
    ps_mul  f4, f4, f1                            // f4 = (mtxB[0][0]*x, mtxB[0][1]*y)
    psq_l   f6, OFFSET_mtxB+0x10(r4), 0, GQR_F32  // f6 = (mtxB[1][0], mtxB[1][1])
    psq_st  f6, OFFSET_mtxA+0x10(r4), 0, GQR_F32
    ps_mul  f6, f6, f1                            // f6 = (mtxB[1][0]*x, mtxB[1][1]*y)
    psq_l   f8, OFFSET_mtxB+0x20(r4), 0, GQR_F32  // f8 = (mtxB[2][0], mtxB[2][1])
    psq_st  f8, OFFSET_mtxA+0x20(r4), 0, GQR_F32
    ps_mul  f8, f8, f1                            // f8 = (mtxB[2][0]*x, mtxB[2][1]*y)
    psq_l   f5, OFFSET_mtxB+0x08(r4), 0, GQR_F32  // f5 = (mtxB[0][2], mtxB[0][3])
    ps_madd f4, f5, f3, f4                        // f4 = (mtxB[0][2]*z + mtxB[0][0]*x, mtxB[0][3]*1 + mtxB[0][1]*y)
    psq_l   f7, OFFSET_mtxB+0x18(r4), 0, GQR_F32  // f7 = (mtxB[1][2], mtxB[1][3])
    ps_madd f6, f7, f3, f6                        // f6 = (mtxB[1][2]*z + mtxB[1][0]*x, mtxB[1][3]*1 + mtxB[1][1]*y)
    psq_l   f9, OFFSET_mtxB+0x28(r4), 0, GQR_F32  // f9 = (mtxB[2][2], mtxB[2][3])
    ps_madd f8, f9, f3, f8                        // f8 = (mtxB[2][2]*z + mtxB[2][0]*x, mtxB[2][3]*1 + mtxB[2][1]*y)
    ps_sum1 f5, f4, f5, f4
    psq_st  f5, OFFSET_mtxA+0x08(r4), 0, GQR_F32  // mtxA[0][2] = mtxB[0][2]
                                                  // mtxA[0][3] = mtxB[0][2]*z + mtxB[0][0]*x + mtxB[0][3]*1 + mtxB[0][1]*y
    ps_sum1 f7, f6, f7, f6
    psq_st  f7, OFFSET_mtxA+0x18(r4), 0, GQR_F32  // mtxA[1][2] = mtxB[1][2]
                                                  // mtxA[1][3] = mtxB[1][2]*z + mtxB[1][0]*x + mtxB[1][3]*1 + mtxB[1][1]*y
    ps_sum1 f9, f8, f9, f8
    psq_st  f9, OFFSET_mtxA+0x28(r4), 0, GQR_F32  // mtxA[2][2] = mtxB[2][2]
                                                  // mtxA[2][3] = mtxB[2][2]*z + mtxB[2][0]*x + mtxB[2][3]*1 + mtxB[2][1]*y
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_normalize_basis(void)
{
    Mtx *m = &mathutilData->mtxA;
    float iMagRecip = mathutil_rsqrt((*m)[0][0]*(*m)[0][0] + (*m)[1][0]*(*m)[1][0] + (*m)[2][0]*(*m)[2][0]);  // 1.0/|î|
    float jMagRecip = mathutil_rsqrt((*m)[0][1]*(*m)[0][1] + (*m)[1][1]*(*m)[1][1] + (*m)[2][1]*(*m)[2][1]);  // 1.0/|ĵ|
    float kMagRecip = mathutil_rsqrt((*m)[0][0]*(*m)[0][0] + (*m)[1][0]*(*m)[1][0] + (*m)[2][0]*(*m)[2][0]);  // 1.0/|k̂|

    // Divide the components of each basis vector by its magnitude
    (*m)[0][0] *= iMagRecip;
    (*m)[1][0] *= iMagRecip;
    (*m)[2][0] *= iMagRecip;

    (*m)[0][1] *= jMagRecip;
    (*m)[1][1] *= jMagRecip;
    (*m)[2][1] *= jMagRecip;

    (*m)[0][2] *= kMagRecip;
    (*m)[1][2] *= kMagRecip;
    (*m)[2][2] *= kMagRecip;
}
#else
asm void mathutil_mtxA_normalize_basis(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    mflr r4
    lfs f2, OFFSET_constOneHalfF(r3)
    psq_l   f6,  OFFSET_mtxA+0x00(r3), 0, GQR_F32  // f6 = (mtxA[0][0], mtxA[0][1])
    lfs     f7,  OFFSET_mtxA+0x08(r3)              // f7 = mtxA[0][2]
    ps_mul  f12, f6, f6                            // f12 = (mtxA[0][0]*mtxA[0][0], mtxA[0][1]*mtxA[0][1])
    psq_l   f8,  OFFSET_mtxA+0x10(r3), 0, GQR_F32  // f8 = (mtxA[1][0], mtxA[1][1])
    fmuls   f13, f7, f7                            // f13 = mtxA[0][2]*mtxA[0][2]
    lfs     f9,  OFFSET_mtxA+0x18(r3)              // f9 = mtxA[1][2]
    ps_madd f12, f8, f8, f12                       // f12 = (mtxA[1][0]*mtxA[1][0] + mtxA[0][0]*mtxA[0][0], mtxA[1][1]*mtxA[1][1] + mtxA[0][1]*mtxA[0][1])
    psq_l   f10, OFFSET_mtxA+0x20(r3), 0, GQR_F32  // f10 = (mtxA[2][0], mtxA[2][1])
    fmadds  f13, f9, f9, f13                       // f13 = mtxA[1][2]*mtxA[1][2] + mtxA[0][2]*mtxA[0][2]
    lfs     f11, OFFSET_mtxA+0x28(r3)              // f11 = mtxA[2][2]
    ps_madd f12, f10, f10, f12                     // f12 = (mtxA[2][0]*mtxA[2][0] + mtxA[1][0]*mtxA[1][0] + mtxA[0][0]*mtxA[0][0], mtxA[2][1]*mtxA[2][1] + mtxA[1][1]*mtxA[1][1] + mtxA[0][1]*mtxA[0][1])
    fmadds f13, f11, f11, f13                      // f13 = mtxA[2][2]*mtxA[2][2] + mtxA[1][2]*mtxA[1][2] + mtxA[0][2]*mtxA[0][2]
    fmr f1, f12
    bl approx_rsqrt
    frsp f1, f1              // iMagRecip = 1/sqrt(mtxA[2][0]*mtxA[2][0] + mtxA[1][0]*mtxA[1][0] + mtxA[0][0]*mtxA[0][0])
    ps_merge01 f12, f1, f12
    ps_merge11 f1, f12, f12
    bl approx_rsqrt
    frsp f1, f1              // jMagRecip = 1/sqrt(mtxA[2][1]*mtxA[2][1] + mtxA[1][1]*mtxA[1][1] + mtxA[0][1]*mtxA[0][1])
    ps_merge00 f1, f12, f1   // f1 = (iMagRecip, jMagRecip)

    ps_mul f6,  f6, f1
    psq_st f6,  OFFSET_mtxA+0x00(r3), 0, GQR_F32  // mtxA[0][0] = mtxA[0][0] * iMagRecip
                                                  // mtxA[0][1] = mtxA[0][1] * jMagRecip

    ps_mul f8,  f8, f1
    psq_st f8,  OFFSET_mtxA+0x10(r3), 0, GQR_F32  // mtxA[1][0] = mtxA[1][0] * iMagRecip
                                                  // mtxA[1][1] = mtxA[1][1] * jMagRecip

    ps_mul f10, f10, f1
    psq_st f10, OFFSET_mtxA+0x20(r3), 0, GQR_F32  // mtxA[2][0] = mtxA[2][0] * iMagRecip
                                                  // mtxA[2][1] = mtxA[2][1] * jMagRecip

    fmr f1, f13
    bl approx_rsqrt  // kMagRecip = 1/sqrt(mtxA[2][2]*mtxA[2][2] + mtxA[1][2]*mtxA[1][2] + mtxA[0][2]*mtxA[0][2])
    mtlr r4
    fmuls f7, f7, f1
    stfs f7,  OFFSET_mtxA+0x08(r3)  // mtxA[0][2] = mtxA[0][2] * kMagRecip
    fmuls f9, f9, f1
    stfs f9,  OFFSET_mtxA+0x18(r3)  // mtxA[1][2] = mtxA[1][2] * kMagRecip
    fmuls f11, f11, f1
    stfs f11, OFFSET_mtxA+0x28(r3)  // mtxA[2][2] = mtxA[2][2] * kMagRecip
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_push(void)
{
    mathutilData->mtxStackPtr--;
    mathutil_mtx_copy(mathutilData->mtxA, *mathutilData->mtxStackPtr);
}
#else
asm void mathutil_mtxA_push(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A
    lwz r4, OFFSET_mtxStackPtr(r3)  // get matrix stack pointer

    // load from Matrix A
    psq_l f0, 0(r3), 0, GQR_F32
    psq_l f1, 8(r3), 0, GQR_F32
    psq_l f2, 16(r3), 0, GQR_F32
    addi r4, r4, -sizeof(Mtx)  // decrement matrix stack pointer
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
#endif

#ifdef C_ONLY
void mathutil_mtxA_pop(void)
{
    mathutil_mtx_copy(*mathutilData->mtxStackPtr, mathutilData->mtxA);
    mathutilData->mtxStackPtr++;
}
#else
asm void mathutil_mtxA_pop(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A
    lwz r4, OFFSET_mtxStackPtr(r3)  // get matrix stack pointer

    // load from stack matrix
    psq_l f0, 0(r4), 0, GQR_F32
    psq_l f1, 8(r4), 0, GQR_F32
    psq_l f2, 16(r4), 0, GQR_F32
    psq_l f3, 24(r4), 0, GQR_F32
    psq_l f4, 32(r4), 0, GQR_F32
    psq_l f5, 40(r4), 0, GQR_F32

    addi r4, r4, sizeof(Mtx)  // increment matrix stack pointer

    // store to Matrix A
    psq_st f0, OFFSET_mtxA+0(r3), 0, GQR_F32
    psq_st f1, OFFSET_mtxA+8(r3), 0, GQR_F32
    psq_st f2, OFFSET_mtxA+16(r3), 0, GQR_F32
    psq_st f3, OFFSET_mtxA+24(r3), 0, GQR_F32
    psq_st f4, OFFSET_mtxA+32(r3), 0, GQR_F32
    psq_st f5, OFFSET_mtxA+40(r3), 0, GQR_F32

    stw r4, 0x94(r3)  // set new stack pointer

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_to_mtx(register Mtx mtx)
{
    mathutil_mtx_copy(mathutilData->mtxA, mtx);
}
#else
asm void mathutil_mtxA_to_mtx(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha  // get pointer to Matrix A

    // load from Matrix A
    psq_l f0, OFFSET_mtxA+0(r4), 0, GQR_F32
    psq_l f1, OFFSET_mtxA+8(r4), 0, GQR_F32
    psq_l f2, OFFSET_mtxA+16(r4), 0, GQR_F32
    psq_l f3, OFFSET_mtxA+24(r4), 0, GQR_F32
    psq_l f4, OFFSET_mtxA+32(r4), 0, GQR_F32
    psq_l f5, OFFSET_mtxA+40(r4), 0, GQR_F32

    // store to dest matrix
    psq_st f0, 0(mtx), 0, GQR_F32
    psq_st f1, 8(mtx), 0, GQR_F32
    psq_st f2, 16(mtx), 0, GQR_F32
    psq_st f3, 24(mtx), 0, GQR_F32
    psq_st f4, 32(mtx), 0, GQR_F32
    psq_st f5, 40(mtx), 0, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_mtx(register Mtx mtx)
{
    mathutil_mtx_copy(mtx, mathutilData->mtxA);
}
#else
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
    psq_st f0, OFFSET_mtxA+0(r4), 0, GQR_F32
    psq_st f1, OFFSET_mtxA+8(r4), 0, GQR_F32
    psq_st f2, OFFSET_mtxA+16(r4), 0, GQR_F32
    psq_st f3, OFFSET_mtxA+24(r4), 0, GQR_F32
    psq_st f4, OFFSET_mtxA+32(r4), 0, GQR_F32
    psq_st f5, OFFSET_mtxA+40(r4), 0, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_peek(void)
{
    mathutil_mtx_copy(*mathutilData->mtxStackPtr, mathutilData->mtxA);
}
#else
asm void mathutil_mtxA_peek(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A
    lwz r4, OFFSET_mtxStackPtr(r3)  // get matrix stack pointer

    // load from stack matrix
    psq_l f0, 0(r4), 0, GQR_F32
    psq_l f1, 8(r4), 0, GQR_F32
    psq_l f2, 16(r4), 0, GQR_F32
    psq_l f3, 24(r4), 0, GQR_F32
    psq_l f4, 32(r4), 0, GQR_F32
    psq_l f5, 40(r4), 0, GQR_F32

    // store to Matrix A
    psq_st f0, OFFSET_mtxA+0(r3), 0, GQR_F32
    psq_st f1, OFFSET_mtxA+8(r3), 0, GQR_F32
    psq_st f2, OFFSET_mtxA+16(r3), 0, GQR_F32
    psq_st f3, OFFSET_mtxA+24(r3), 0, GQR_F32
    psq_st f4, OFFSET_mtxA+32(r3), 0, GQR_F32
    psq_st f5, OFFSET_mtxA+40(r3), 0, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_incr_mtx_stack(void)
{
    mathutilData->mtxStackPtr++;
}
#else
asm void mathutil_incr_mtx_stack(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha
    lwz r4, OFFSET_mtxStackPtr(r3)
    addi r4, r4, sizeof(Mtx)
    stw r4, OFFSET_mtxStackPtr(r3)
    blr
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_sq_to_mtx(register Mtx mtx)
{
    const Mtx *mtxA = &mathutilData->mtxA;

    // copy everything except for the last column
    mtx[0][0] = (*mtxA)[0][0];  mtx[0][1] = (*mtxA)[0][1];  mtx[0][2] = (*mtxA)[0][2];
    mtx[1][0] = (*mtxA)[1][0];  mtx[1][1] = (*mtxA)[1][1];  mtx[1][2] = (*mtxA)[1][2];
    mtx[2][0] = (*mtxA)[2][0];  mtx[2][1] = (*mtxA)[2][1];  mtx[2][2] = (*mtxA)[2][2];
}
#else
asm void mathutil_mtxA_sq_to_mtx(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha  // get pointer to Matrix A

    psq_l f0, OFFSET_mtxA+0(r4), 0, GQR_F32   // f0 = (mtxA[0][0], mtxA[0][1])
    lfs   f1, OFFSET_mtxA+8(r4)               // f1 = mtxA[0][2]
    psq_l f2, OFFSET_mtxA+16(r4), 0, GQR_F32  // f2 = (mtxA[1][0], mtxA[1][1])
    lfs   f3, OFFSET_mtxA+24(r4)              // f3 = mtxA[1][2]
    psq_l f4, OFFSET_mtxA+32(r4), 0, GQR_F32  // f4 = (mtxA[2][0], mtxA[2][1])
    lfs   f5, OFFSET_mtxA+40(r4)              // f5 = mtxA[2][2]

    psq_st f0, 0(mtx), 0, GQR_F32
    stfs   f1, 8(mtx)
    psq_st f2, 16(mtx), 0, GQR_F32
    stfs   f3, 24(mtx)
    psq_st f4, 32(mtx), 0, GQR_F32
    stfs   f5, 40(mtx)

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_sq_from_mtx(register Mtx mtx)
{
    Mtx *mtxA = &mathutilData->mtxA;

    // copy everything except for the last column
    (*mtxA)[0][0] = mtx[0][0];  (*mtxA)[0][1] = mtx[0][1];  (*mtxA)[0][2] = mtx[0][2];
    (*mtxA)[1][0] = mtx[1][0];  (*mtxA)[1][1] = mtx[1][1];  (*mtxA)[1][2] = mtx[1][2];
    (*mtxA)[2][0] = mtx[2][0];  (*mtxA)[2][1] = mtx[2][1];  (*mtxA)[2][2] = mtx[2][2];
}
#else
asm void mathutil_mtxA_sq_from_mtx(register Mtx mtx)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha  // get pointer to Matrix A

    psq_l f0, 0(mtx), 0, GQR_F32   // f0 = (mtx[0][0], mtx[0][1])
    lfs   f1, 8(mtx)               // f1 = mtx[0][2]
    psq_l f2, 16(mtx), 0, GQR_F32  // f2 = (mtx[1][0], mtx[1][1])
    lfs   f3, 0x18(mtx)            // f3 = mtx[1][2]
    psq_l f4, 32(mtx), 0, GQR_F32  // f4 = (mtx[2][0], mtx[2][1])
    lfs   f5, 0x28(mtx)            // f5 = mtx[2][2]

    psq_st f0, OFFSET_mtxA+0(r4), 0, GQR_F32
    stfs   f1, OFFSET_mtxA+8(r4)
    psq_st f2, OFFSET_mtxA+16(r4), 0, GQR_F32
    stfs   f3, OFFSET_mtxA+24(r4)
    psq_st f4, OFFSET_mtxA+32(r4), 0, GQR_F32
    stfs   f5, OFFSET_mtxA+40(r4)

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_mtxB(void)
{
    mathutil_mtx_copy(mathutilData->mtxB, mathutilData->mtxA);
}
#else
asm void mathutil_mtxA_from_mtxB(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A

    // load from Matrix B
    psq_l f0, OFFSET_mtxB+0(r3), 0, GQR_F32
    psq_l f1, OFFSET_mtxB+8(r3), 0, GQR_F32
    psq_l f2, OFFSET_mtxB+16(r3), 0, GQR_F32
    psq_l f3, OFFSET_mtxB+24(r3), 0, GQR_F32
    psq_l f4, OFFSET_mtxB+32(r3), 0, GQR_F32
    psq_l f5, OFFSET_mtxB+40(r3), 0, GQR_F32

    // store to Matrix A
    psq_st f0, OFFSET_mtxA+0(r3), 0, GQR_F32
    psq_st f1, OFFSET_mtxA+8(r3), 0, GQR_F32
    psq_st f2, OFFSET_mtxA+16(r3), 0, GQR_F32
    psq_st f3, OFFSET_mtxA+24(r3), 0, GQR_F32
    psq_st f4, OFFSET_mtxA+32(r3), 0, GQR_F32
    psq_st f5, OFFSET_mtxA+40(r3), 0, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_to_mtxB(void)
{
    mathutil_mtx_copy(mathutilData->mtxA, mathutilData->mtxB);
}
#else
asm void mathutil_mtxA_to_mtxB(void)
{
    nofralloc

    lis r3, LC_CACHE_BASE@ha  // get pointer to Matrix A

    // load from Matrix A
    psq_l f0, OFFSET_mtxA+0(r3), 0, GQR_F32
    psq_l f1, OFFSET_mtxA+8(r3), 0, GQR_F32
    psq_l f2, OFFSET_mtxA+16(r3), 0, GQR_F32
    psq_l f3, OFFSET_mtxA+24(r3), 0, GQR_F32
    psq_l f4, OFFSET_mtxA+32(r3), 0, GQR_F32
    psq_l f5, OFFSET_mtxA+40(r3), 0, GQR_F32

    // store to Matrix B
    psq_st f0, OFFSET_mtxB+0(r3), 0, GQR_F32
    psq_st f1, OFFSET_mtxB+8(r3), 0, GQR_F32
    psq_st f2, OFFSET_mtxB+16(r3), 0, GQR_F32
    psq_st f3, OFFSET_mtxB+24(r3), 0, GQR_F32
    psq_st f4, OFFSET_mtxB+32(r3), 0, GQR_F32
    psq_st f5, OFFSET_mtxB+40(r3), 0, GQR_F32

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtx_copy(register Mtx src, register Mtx dest)
{
    memcpy(dest, src, sizeof(Mtx));
}
#else
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
#endif

#ifdef __MWERKS__
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

    lfs f10, OFFSET_mtxA+36(r3)
    lfs f7, OFFSET_mtxA+24(r3)
    fmuls f13, f10, f7
    lfs f2, OFFSET_mtxA+4(r3)
    lfs f11, OFFSET_mtxA+40(r3)
    fmuls f14, f2, f11
    lfs f6, OFFSET_mtxA+20(r3)
    lfs f3, OFFSET_mtxA+8(r3)
    fmuls f15, f6, f3
    lfs f5, OFFSET_mtxA+16(r3)
    fmuls f17, f11, f5
    fmuls f23, f5, f2
    lfs f9, OFFSET_mtxA+32(r3)
    fmuls f18, f3, f9
    fmuls f21, f9, f6
    lfs f1, OFFSET_mtxA+0(r3)
    fmuls f19, f7, f1
    fmuls f22, f1, f10
    lfs f4, OFFSET_mtxA+12(r3)
    fmsubs f13, f6, f11, f13
    lfs f8, OFFSET_mtxA+28(r3)
    fmsubs f14, f10, f3, f14
    lfs f12, OFFSET_mtxA+44(r3)
    fmsubs f15, f2, f7, f15
    fmsubs f17, f7, f9, f17
    fmsubs f18, f11, f1, f18
    fmsubs f19, f3, f5, f19
    fmsubs f21, f5, f10, f21
    fmsubs f22, f9, f2, f22
    fmsubs f23, f1, f6, f23
    fmuls f0, f1, f13
    lfs f1, OFFSET_constOneF(r3)
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
    stfs f1, OFFSET_mtxA+0(r3)
    fmuls f2, f14, f0
    stfs f2, OFFSET_mtxA+4(r3)
    fmuls f3, f15, f0
    stfs f3, OFFSET_mtxA+8(r3)
    fmuls f4, f16, f0
    stfs f4, OFFSET_mtxA+12(r3)
    fmuls f5, f17, f0
    stfs f5, OFFSET_mtxA+16(r3)
    fmuls f6, f18, f0
    stfs f6, OFFSET_mtxA+20(r3)
    fmuls f7, f19, f0
    stfs f7, OFFSET_mtxA+24(r3)
    fmuls f8, f20, f0
    stfs f8, OFFSET_mtxA+28(r3)
    fmuls f9, f21, f0
    stfs f9, OFFSET_mtxA+32(r3)
    fmuls f10, f22, f0
    stfs f10, OFFSET_mtxA+36(r3)
    fmuls f11, f23, f0
    stfs f11, OFFSET_mtxA+40(r3)
    fmuls f12, f24, f0
    stfs f12, OFFSET_mtxA+44(r3)

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
    lfs f3,   OFFSET_mtxA+12(r3)
    lfs f0,   OFFSET_mtxA+0(r3)
    lfs f1,   OFFSET_mtxA+4(r3)
    lfs f2,   OFFSET_mtxA+8(r3)
    fmuls f12, f3, f0
    lfs f7,   OFFSET_mtxA+28(r3)
    fmuls f13, f3, f1
    lfs f4,   OFFSET_mtxA+16(r3)
    fmuls f0, f3, f2
    lfs f5,   OFFSET_mtxA+20(r3)
    lfs f6,   OFFSET_mtxA+24(r3)
    fmadds f12, f7, f4, f12
    lfs f11,  OFFSET_mtxA+44(r3)
    lfs f8,   OFFSET_mtxA+32(r3)
    fmadds f13, f7, f5, f13
    lfs f9,   OFFSET_mtxA+36(r3)
    lfs f10,  OFFSET_mtxA+40(r3)
    fmadds f0, f7, f6, f0
    stfs f1,  OFFSET_mtxA+16(r3)
    stfs f2,  OFFSET_mtxA+32(r3)
    fnmadds f12, f11, f8, f12
    stfs f6,  OFFSET_mtxA+36(r3)
    stfs f4,  OFFSET_mtxA+4(r3)
    fnmadds f13, f11, f9, f13
    stfs f8,  OFFSET_mtxA+8(r3)
    stfs f9,  OFFSET_mtxA+24(r3)
    fnmadds f0, f11, f10, f0
    stfs f12, OFFSET_mtxA+12(r3)
    stfs f13, OFFSET_mtxA+28(r3)
    stfs f0,  OFFSET_mtxA+44(r3)

    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtx_mult(Mtx a, Mtx b, Mtx result)
{
    // row 0
    float m00 = b[2][0]*a[0][2] + b[1][0]*a[0][1] + b[0][0]*a[0][0];
    float m01 = b[2][1]*a[0][2] + b[1][1]*a[0][1] + b[0][1]*a[0][0];
    float m02 = b[2][2]*a[0][2] + b[1][2]*a[0][1] + b[0][2]*a[0][0];
    float m03 = b[2][3]*a[0][2] + b[1][3]*a[0][1] + b[0][3]*a[0][0] + a[0][3];

    // row 1
    float m10 = b[2][0]*a[1][2] + b[1][0]*a[1][1] + b[0][0]*a[1][0];
    float m11 = b[2][1]*a[1][2] + b[1][1]*a[1][1] + b[0][1]*a[1][0];
    float m12 = b[2][2]*a[1][2] + b[1][2]*a[1][1] + b[0][2]*a[1][0];
    float m13 = b[2][3]*a[1][2] + b[1][3]*a[1][1] + b[0][3]*a[1][0] + a[1][3];

    // row 2
    float m20 = b[2][0]*a[2][2] + b[1][0]*a[2][1] + b[0][0]*a[2][0];
    float m21 = b[2][1]*a[2][2] + b[1][1]*a[2][1] + b[0][1]*a[2][0];
    float m22 = b[2][2]*a[2][2] + b[1][2]*a[2][1] + b[0][2]*a[2][0];
    float m23 = b[2][3]*a[2][2] + b[1][3]*a[2][1] + b[0][3]*a[2][0] + a[2][3];

    result[0][0] = m00;
    result[0][1] = m01;
    result[0][2] = m02;
    result[0][3] = m03;

    result[1][0] = m10;
    result[1][1] = m11;
    result[1][2] = m12;
    result[1][3] = m13;

    result[2][0] = m20;
    result[2][1] = m21;
    result[2][2] = m22;
    result[2][3] = m23;
}

void mathutil_mtxA_mult_right(Mtx mtx)
{
    mathutil_mtx_mult(mathutilData->mtxA, mtx, mathutilData->mtxA);
}

void mathutil_mtxA_mult_left(Mtx mtx)
{
    mathutil_mtx_mult(mtx, mathutilData->mtxA, mathutilData->mtxA);
}

void mathutil_mtxA_from_mtxB_mult_mtx(Mtx mtx)
{
    mathutil_mtx_mult(mathutilData->mtxB, mtx, mathutilData->mtxA);
}
#else
asm void mathutil_mtxA_mult_right(Mtx mtx)
{
    nofralloc

    lis r6, LC_CACHE_BASE@ha
    mr r4, r3                 // b = mtx
    addi r3, r6, OFFSET_mtxA  // a = mtxA
    addi r5, r6, OFFSET_mtxA  // result = mtxA
    b @do_mult

// void mathutil_mtxA_mult_left(Mtx mtx)
entry mathutil_mtxA_mult_left
    lis r6, LC_CACHE_BASE@ha
    addi r4, r6, OFFSET_mtxA
    addi r5, r6, OFFSET_mtxA
    b @do_mult

// void mathutil_mtxA_from_mtxB_mult_mtx(Mtx mtx)
entry mathutil_mtxA_from_mtxB_mult_mtx
    lis r6, LC_CACHE_BASE@ha
    mr r4, r3
    addi r3, r6, OFFSET_mtxB
    addi r5, r6, OFFSET_mtxA
    b @do_mult

// void mathutil_mtx_mult(Mtx a, Mtx b, Mtx result)
entry mathutil_mtx_mult
    lis r6, LC_CACHE_BASE@ha

@do_mult:
    // r3 = a
    // r4 = b
    // r5 = result
    psq_l f0,  0x00(r4), 0, GQR_F32  // f0 = (b[0][0], b[0][1])
    psq_l f11, 0x00(r3), 0, GQR_F32  // f11 = (a[0][0], a[0][1])
    psq_l f1,  0x08(r4), 0, GQR_F32  // f1 = (b[0][2], b[0][3])
    psq_l f12, 0x10(r3), 0, GQR_F32  // f12 = (a[1][0], a[1][1])
    psq_l f2,  0x10(r4), 0, GQR_F32  // f2 = (b[1][0], b[1][1])
    ps_muls0  f5, f0, f11                // f5 = (b[0][0]*a[0][0], b[0][1]*a[0][0])
    psq_l     f13, 0x20(r3), 0, GQR_F32  // f13 = (a[2][0], a[2][1])
    ps_muls0  f7, f0, f12                // f7 = (b[0][0]*a[1][0], b[0][1]*a[1][0])
    psq_l     f3,  0x18(r4), 0, GQR_F32  // f3 = (b[1][2], b[1][3])
    ps_muls0  f9, f0, f13                // f9 = (b[0][0]*a[2][0], b[0][1]*a[2][0])
    ps_muls0  f6, f1, f11                // f6 = (b[0][2]*a[0][0], b[0][3]*a[0][0])
    psq_l     f4,  0x20(r4), 0, GQR_F32  // f4 = (b[2][0], b[2][1])
    ps_muls0  f8, f1, f12                // f8 = (b[0][2]*a[1][0], b[0][3]*a[1][0])
    ps_muls0  f10, f1, f13               // f10 = (b[0][2]*a[2][0], b[0][3]*a[2][0])
    psq_l     f0,  0x28(r4), 0, GQR_F32  // f0 = (b[2][2], b[2][3])
    ps_madds1 f5, f2, f11, f5            // f5 = (b[1][0]*a[0][1] + b[0][0]*a[0][0], b[1][1]*a[0][1] + b[0][1]*a[0][0])
    ps_madds1 f7, f2, f12, f7            // f7 = (b[1][0]*a[1][1] + b[0][0]*a[1][0], b[1][1]*a[1][1] + b[0][1]*a[1][0])
    psq_l     f1,  0x08(r3), 0, GQR_F32  // f1 = (a[0][2], a[0][3])
    ps_madds1 f9, f2, f13, f9            // f9 = (b[1][0]*a[2][1] + b[0][0]*a[2][0], b[1][1]*a[2][1] + b[0][1]*a[2][0])
    ps_madds1 f6, f3, f11, f6            // f6 = (b[1][2]*a[0][1] + b[0][2]*a[0][0], b[1][3]*a[0][1] + b[0][3]*a[0][0])
    psq_l     f2,  0x18(r3), 0, GQR_F32  // f2 = (a[1][2], a[1][3])
    ps_madds1 f8, f3, f12, f8            // f8 = (b[1][2]*a[1][1] + b[0][2]*a[1][0], b[1][3]*a[1][1] + b[0][3]*a[1][0])
    ps_madds1 f10, f3, f13, f10          // f10 = (b[1][2]*a[2][1] + b[0][2]*a[2][0], b[1][3]*a[2][1] + b[0][3]*a[2][0])
    psq_l     f3,  0x28(r3), 0, GQR_F32  // f3 = (a[2][2], a[2][3])
    ps_madds0 f5, f4, f1, f5             // f5 = (b[2][0]*a[0][2] + b[1][0]*a[0][1] + b[0][0]*a[0][0], b[2][1]*a[0][2] + b[1][1]*a[0][1] + b[0][1]*a[0][0])
    ps_madds0 f7, f4, f2, f7             // f7 = (b[2][0]*a[1][2] + b[1][0]*a[1][1] + b[0][0]*a[1][0], b[2][1]*a[1][2] + b[1][1]*a[1][1] + b[0][1]*a[1][0])
    psq_l     f11, OFFSET_constZeroOne(r6), 0, GQR_U8  // f11 = (0, 1)
    ps_madds0 f9, f4, f3, f9             // f9 = (b[2][0]*a[2][2] + b[1][0]*a[2][1] + b[0][0]*a[2][0], b[2][1]*a[2][2] + b[1][1]*a[2][1] + b[0][1]*a[2][0])
    ps_madds0 f6, f0, f1, f6             // f6 = (b[2][2]*a[0][2] + b[1][2]*a[0][1] + b[0][2]*a[0][0], b[2][3]*a[0][2] + b[1][3]*a[0][1] + b[0][3]*a[0][0])
    psq_st f5, 0x00(r5), 0, GQR_F32
    ps_madds0 f8, f0, f2, f8             // f8 = (b[2][2]*a[1][2] + b[1][2]*a[1][1] + b[0][2]*a[1][0], b[2][3]*a[1][2] + b[1][3]*a[1][1] + b[0][3]*a[1][0])
    psq_st f7, 0x10(r5), 0, GQR_F32
    ps_madds0 f10, f0, f3, f10           // f10 = (b[2][2]*a[2][2] + b[1][2]*a[2][1] + b[0][2]*a[2][0], b[2][3]*a[2][2] + b[1][3]*a[2][1] + b[0][3]*a[2][0])
    psq_st f9, 0x20(r5), 0, GQR_F32
    ps_madd   f6, f11, f1, f6            // f6 = (b[2][2]*a[0][2] + b[1][2]*a[0][1] + b[0][2]*a[0][0], a[0][3] + b[2][3]*a[0][2] + b[1][3]*a[0][1] + b[0][3]*a[0][0])
    ps_madd   f8, f11, f2, f8            // f8 = (b[2][2]*a[1][2] + b[1][2]*a[1][1] + b[0][2]*a[1][0], a[1][3] + b[2][3]*a[1][2] + b[1][3]*a[1][1] + b[0][3]*a[1][0])
    psq_st f6, 0x08(r5), 0, GQR_F32
    ps_madd   f10, f11, f3, f10          // f10 = (b[2][2]*a[2][2] + b[1][2]*a[2][1] + b[0][2]*a[2][0], a[2][3] + b[2][3]*a[2][2] + b[1][3]*a[2][1] + b[0][3]*a[2][0])
    psq_st f8, 0x18(r5), 0, GQR_F32
    psq_st f10, 0x28(r5), 0, GQR_F32
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_translate_xyz(float x, float y, float z)
{
    Mtx *m = &mathutilData->mtxA;

    float a = (*m)[0][2] * z + (*m)[0][0] * x + (*m)[0][3] * 1 + (*m)[0][1] * y;
    float b = (*m)[1][2] * z + (*m)[1][0] * x + (*m)[1][3] * 1 + (*m)[1][1] * y;
    float c = (*m)[2][2] * z + (*m)[2][0] * x + (*m)[2][3] * 1 + (*m)[2][1] * y;

    (*m)[0][3] = a;
    (*m)[1][3] = b;
    (*m)[2][3] = c;
}

void mathutil_mtxA_translate(register Vec *vec)
{
    mathutil_mtxA_translate_xyz(vec->x, vec->y, vec->z);
}

void mathutil_mtxA_translate_neg(Vec *vec)
{
    mathutil_mtxA_translate_xyz(-vec->x, -vec->y, -vec->z);
}

void mathutil_mtxA_translate_neg_xyz(float x, float y, float z)
{
    mathutil_mtxA_translate_xyz(-x, -y, -z);
}
#else
asm void mathutil_mtxA_translate(register Vec *vec)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha
    psq_l f1, 0(r3), 0, GQR_F32  // f1 = (x, y)
    psq_l f3, 8(r3), 1, GQR_F32  // f3 = (z, 1)
    b @do_translate

// void mathutil_mtxA_translate_xyz(float x, float y, float z)
entry mathutil_mtxA_translate_xyz
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f1, f1, f2
    lfs f0, OFFSET_constOneF(r4)
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

@negate:  // f1 = (x, y), f3 = z
    lfs f0, OFFSET_constOneF(r4)
    fneg f3, f3            // f3 = -z
    ps_neg f1, f1          // f1 = (-x, -y)
    ps_merge00 f3, f3, f0  // f3 = (-z, 1)

    // f1 = (x, y), f3 = (z, 1)
@do_translate:
    psq_l f4, 0(r4), 0, GQR_F32
    psq_l f6, 16(r4), 0, GQR_F32
    psq_l f8, 32(r4), 0, GQR_F32
    ps_mul f4, f4, f1             // f4 = (m[0][0] * x, m[0][1] * y)
    psq_l f5, 8(r4), 0, GQR_F32   // f5 = (m[0][2],     m[0][3])
    ps_mul f6, f6, f1             // f6 = (m[1][0] * x, m[1][1] * y)
    psq_l f7, 24(r4), 0, GQR_F32  // f7 = (m[1][2],     m[1][3])
    ps_mul f8, f8, f1             // f8 = (m[2][0] * x, m[2][1] * y)
    psq_l f9, 40(r4), 0, GQR_F32  // f9 = (m[2][2],     m[2][3])

    ps_madd f4, f5, f3, f4  // f4 = (m[0][2] * z + m[0][0] * x, m[0][3] * 1 + m[0][1] * y)
    ps_madd f6, f7, f3, f6  // f6 = (m[1][2] * z + m[1][0] * x, m[1][3] * 1 + m[1][1] * y)
    ps_madd f8, f9, f3, f8  // f8 = (m[2][2] * z + m[2][0] * x, m[2][3] * 1 + m[2][1] * y)
    ps_sum0 f4, f4, f4, f4
    stfs f4, 12(r4)
    ps_sum0 f6, f6, f6, f6
    stfs f6, 28(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, 44(r4)
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_scale_xyz(float x, float y, float z)
{
    Mtx *m = &mathutilData->mtxA;

    (*m)[0][0] *= x;  (*m)[0][1] *= y;  (*m)[0][2] *= z;
    (*m)[1][0] *= x;  (*m)[1][1] *= y;  (*m)[1][2] *= z;
    (*m)[2][0] *= x;  (*m)[2][1] *= y;  (*m)[2][2] *= z;
}

void mathutil_mtxA_scale(Vec *vec)
{
    mathutil_mtxA_scale_xyz(vec->x, vec->y, vec->z);
}

void mathutil_mtxA_scale_s(float scale)
{
    mathutil_mtxA_scale_xyz(scale, scale, scale);
}
#else
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
    ps_merge00 f1, f1, f2  // f1 = (x, y)

    // f1 = (x, y)
    // f3 = z
@do_scale:
    psq_l f0,  0(r4), 0, GQR_F32  // f0 = (m[0][0], m[0][1])
    lfs f4,    8(r4)              // f4 = m[0][2]
    psq_l f5, 16(r4), 0, GQR_F32  // f5 = (m[1][0], m[1][1])
    ps_mul f0, f0, f1  // (m[0][0] * x, m[0][1] * y)
    lfs f6,   24(r4)              // f6 = m[1][2]
    fmuls f4, f4, f3   // m[0][2] * z
    psq_l f7, 32(r4), 0, GQR_F32  // f7 = (m[2][0], m[2][1])
    lfs f8,   40(r4)              // f8 = m[2][2]
    ps_mul f5, f5, f1  // (m[1][0] * x, m[1][1] * y)
    psq_st f0,  0(r4), 0, GQR_F32
    fmuls f6, f6, f3   // m[1][2] * z
    stfs f4,    8(r4)
    psq_st f5, 16(r4), 0, GQR_F32
    ps_mul f7, f7, f1  // (m[2][0] * x, m[2][1] * y)
    stfs f6,   24(r4)
    psq_st f7, 32(r4), 0, GQR_F32
    fmuls f8, f8, f3   // m[2][2] * z
    stfs f8,   40(r4)
    blr
}
#endif

#ifdef C_ONLY
static void mtxA_tf(Vec *dest, float x, float y, float z, float w)
{
    Mtx *m = &mathutilData->mtxA;

    dest->x = (*m)[0][0] * x + (*m)[0][1] * y + (*m)[0][2] * z + (*m)[0][3] * w;
    dest->y = (*m)[1][0] * x + (*m)[1][1] * y + (*m)[1][2] * z + (*m)[1][3] * w;
    dest->z = (*m)[2][0] * x + (*m)[2][1] * y + (*m)[2][2] * z + (*m)[2][3] * w;
}

void mathutil_mtxA_tf_point(Point3d *src, Point3d *dest)
{
    mtxA_tf(dest, src->x, src->y, src->z, 1.0f);
}

void mathutil_mtxA_tf_vec(Vec *src, Vec *dest)
{
    mtxA_tf(dest, src->x, src->y, src->z, 0.0f);
}

void mathutil_mtxA_tf_point_xyz(Point3d *point, float x, float y, float z)
{
    mtxA_tf(point, x, y, z, 1.0f);
}

void mathutil_mtxA_tf_vec_xyz(Vec *vec, float x, float y, float z)
{
    mtxA_tf(vec, x, y, z, 0.0f);
}
#else
asm void mathutil_mtxA_tf_point(Point3d *src, Point3d *dest)
{
    nofralloc

    lis r5, LC_CACHE_BASE@ha
    psq_l f1, 0(r3), 0, GQR_F32  // f1 = (x, y)
    psq_l f3, 8(r3), 1, GQR_F32  // f3 = (z, 1)
    b @do_tf

// void mathutil_mtxA_tf_vec(Vec *src, Vec *dest)
entry mathutil_mtxA_tf_vec
    lis r5, LC_CACHE_BASE@ha
    lfs f3, 8(r3)
    lfs f0, OFFSET_constZeroF(r5)
    psq_l f1, 0(r3), 0, GQR_F32  // f1 = (x, y)
    ps_merge00 f3, f3, f0  // f3 = (z, 0)
    b @do_tf

// void mathutil_mtxA_tf_point_xyz(Point3d *point, float x, float y, float z)
entry mathutil_mtxA_tf_point_xyz
    lis r5, LC_CACHE_BASE@ha
    ps_merge00 f1, f1, f2  // f1 = (x, y)
    lfs f0, OFFSET_constOneF(r5)
    mr r4, r3
    ps_merge00 f3, f3, f0  // f3 = (z, 1)
    b @do_tf

// void mathutil_mtxA_tf_vec_xyz(Vec *vec, float x, float y, float z)
entry mathutil_mtxA_tf_vec_xyz
    lis r5, LC_CACHE_BASE@ha
    ps_merge00 f1, f1, f2  // f1 = (x, y)
    lfs f0, OFFSET_constZeroF(r5)
    mr r4, r3
    ps_merge00 f3, f3, f0  // f3 = (z, 0)

@do_tf:
    psq_l f4, 0x00(r5), 0, GQR_F32  // f4 = (mtxA[0][0], mtxA[0][1])
    psq_l f6, 0x10(r5), 0, GQR_F32  // f6 = (mtxA[1][0], mtxA[1][1])
    ps_mul f4, f4, f1               // f4 = (mtxA[0][0] * x, mtxA[0][1] * y)
    psq_l f8, 0x20(r5), 0, GQR_F32  // f8 = (mtxA[2][0], mtxA[2][1])
    ps_mul f6, f6, f1               // f6 = (mtxA[1][0] * x, mtxA[1][1] * y)
    psq_l f5, 0x08(r5), 0, GQR_F32  // f5 = (mtxA[0][2], mtxA[0][3])
    ps_mul f8, f8, f1               // f8 = (mtxA[2][0] * x, mtxA[2][1] * y)
    psq_l f7, 0x18(r5), 0, GQR_F32  // f7 = (mtxA[1][2], mtxA[1][3])
    ps_madd f4, f5, f3, f4          // f4 = (mtxA[0][2] * z + mtxA[0][0] * x, mtxA[0][3] * w + mtxA[0][1] * y)
    psq_l f9, 0x28(r5), 0, GQR_F32  // f9 = (mtxA[2][2], mtxA[2][3])
    ps_madd f6, f7, f3, f6          // f6 = (mtxA[1][2] * z + mtxA[1][0] * x, mtxA[1][3] * w + mtxA[1][1] * y)
    ps_madd f8, f9, f3, f8          // f8 = (mtxA[2][2] * z + mtxA[2][0] * x, mtxA[2][3] * w + mtxA[2][1] * y)
    ps_sum0 f4, f4, f4, f4
    stfs f4, 0(r4)                  // vec->x = mtxA[0][2] * z + mtxA[0][0] * x + mtxA[0][3] * w + mtxA[0][1] * y
    ps_sum0 f6, f6, f6, f6
    stfs f6, 4(r4)                  // vec->y = mtxA[1][2] * z + mtxA[1][0] * x + mtxA[1][3] * w + mtxA[1][1] * y
    ps_sum0 f8, f8, f8, f8
    stfs f8, 8(r4)                  // vec->z = mtxA[2][2] * z + mtxA[2][0] * x + mtxA[2][3] * w + mtxA[2][1] * y
    blr
}
#endif

#ifdef C_ONLY
static void do_tf(Vec *dest, float x, float y, float z, BOOL negate)
{
    Mtx *mtxA = &mathutilData->mtxA;
    float tx = (*mtxA)[2][0]*z + (*mtxA)[1][0]*y + (*mtxA)[0][0]*x;
    float ty = (*mtxA)[2][1]*z + (*mtxA)[1][1]*y + (*mtxA)[0][1]*x;
    float tz = (*mtxA)[2][2]*z + (*mtxA)[1][2]*y + (*mtxA)[0][2]*x;

    if (negate)
    {
        tx = -tx;
        ty = -ty;
        tz = -tz;
    }
    dest->x = tx;
    dest->y = ty;
    dest->z = tz;
}

void mathutil_mtxA_rigid_inv_tf_point(Vec *src, Vec *dest)
{
    do_tf(dest, src->x - mathutilData->mtxA[0][3], src->y - mathutilData->mtxA[1][3], src->z - mathutilData->mtxA[2][3], FALSE);
}

void mathutil_mtxA_rigid_inv_tf_tl(Vec *dest)
{
    do_tf(dest, mathutilData->mtxA[0][3], mathutilData->mtxA[1][3], mathutilData->mtxA[2][3], TRUE);
}

void mathutil_mtxA_rigid_inv_tf_vec(Vec *src, Vec *dest)
{
    do_tf(dest, src->x, src->y, src->z, FALSE);
}

void mathutil_mtxA_rigid_inv_tf_vec_xyz(Vec *dest, float x, float y, float z)
{
    do_tf(dest, x, y, z, FALSE);
}
#else
asm void mathutil_mtxA_rigid_inv_tf_point(Vec *a, Vec *b)
{
    nofralloc

    lfs f1, 0(r3)
    lfs f2, 4(r3)
    lfs f3, 8(r3)
    b @1
    mr r4, r3  // never used
@1:
    lis r5, LC_CACHE_BASE@ha
    crclr 2
    lfs f10, OFFSET_mtxA+0x0C(r5)
    lfs f11, OFFSET_mtxA+0x1C(r5)
    lfs f12, OFFSET_mtxA+0x2C(r5)
    fsubs f1, f1, f10  // f1 = a->x - mtxA[0][3]
    fsubs f2, f2, f11  // f2 = a->y - mtxA[1][3]
    fsubs f3, f3, f12  // f3 = a->z - mtxA[2][3]
    b do_tf

// void mathutil_mtxA_rigid_inv_tf_tl(Vec *dest)
entry mathutil_mtxA_rigid_inv_tf_tl
    lis r5, LC_CACHE_BASE@ha
    mr r4, r3
    crset 2  // set the EQ bit
    lfs f1, OFFSET_mtxA+0x0C(r5)  // f1 = mtxA[0][3]
    lfs f2, OFFSET_mtxA+0x1C(r5)  // f2 = mtxA[1][3]
    lfs f3, OFFSET_mtxA+0x2C(r5)  // f3 = mtxA[2][3]
    b do_tf

// void mathutil_mtxA_rigid_inv_tf_vec(Vec *src, Vec *dest)
entry mathutil_mtxA_rigid_inv_tf_vec
    lfs f1, 0(r3)  // f1 = src->x
    lfs f2, 4(r3)  // f2 = src->y
    lfs f3, 8(r3)  // f3 = src->z
    b do_tf_dont_negate

// void mathutil_mtxA_rigid_inv_tf_vec_xyz(Vec *dest, float x, float y, float z)
entry mathutil_mtxA_rigid_inv_tf_vec_xyz
    mr r4, r3

do_tf_dont_negate:
    lis r5, LC_CACHE_BASE@ha
    crclr 2  // clear the EQ bit

do_tf:
    psq_l   f4, OFFSET_mtxA+0x00(r5), 0, GQR_F32
    lfs     f5, OFFSET_mtxA+0x08(r5)
    ps_mul  f4, f4, f1                            // f4 = (mtxA[0][0]*x, mtxA[0][1]*x)
    psq_l   f6, OFFSET_mtxA+0x10(r5), 0, GQR_F32
    fmuls   f5, f5, f1                            // f5 = mtxA[0][2]*x
    lfs     f7, OFFSET_mtxA+0x18(r5)
    ps_madd f4, f6, f2, f4                        // f4 = (mtxA[1][0]*y + mtxA[0][0]*x, mtxA[1][1]*y + mtxA[0][1]*x)
    psq_l   f8, OFFSET_mtxA+0x20(r5), 0, GQR_F32
    fmadds  f5, f7, f2, f5                        // f5 = mtxA[1][2]*y + mtxA[0][2]*x
    lfs     f9, OFFSET_mtxA+0x28(r5)
    beq lbl_80007F74
    ps_madd f4, f8, f3, f4    // f4 = (mtxA[2][0]*z + mtxA[1][0]*y + mtxA[0][0]*x, mtxA[2][1]*z + mtxA[1][1]*y + mtxA[0][1]*x)
    fmadds f5, f9, f3, f5     // f5 = mtxA[2][2]*z + mtxA[1][2]*y + mtxA[0][2]*x
    b lbl_80007F7C
lbl_80007F74:
    ps_nmadd f4, f8, f3, f4   // f4 = (-(mtxA[2][0]*z + mtxA[1][0]*y + mtxA[0][0]*x), -(mtxA[2][1]*z + mtxA[1][1]*y + mtxA[0][1]*x))
    fnmadds f5, f9, f3, f5    // f5 = -(mtxA[2][2]*z + mtxA[1][2]*y + mtxA[0][2]*x)
lbl_80007F7C:
    psq_st f4, 0(r4), 0, GQR_F32
    stfs f5, 8(r4)
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_rotate_x_sin_cos(float sinAngle, float cosAngle)
{
    Mtx *m = &mathutilData->mtxA;
    float a = (*m)[0][1] * cosAngle + (*m)[0][2] * sinAngle;
    float b = (*m)[1][1] * cosAngle + (*m)[1][2] * sinAngle;
    float c = (*m)[2][1] * cosAngle + (*m)[2][2] * sinAngle;
    float d = (*m)[0][1] * -sinAngle + (*m)[0][2] * cosAngle;
    float e = (*m)[1][1] * -sinAngle + (*m)[1][2] * cosAngle;
    float f = (*m)[2][1] * -sinAngle + (*m)[2][2] * cosAngle;

    (*m)[0][1] = a;
    (*m)[1][1] = b;
    (*m)[2][1] = c;
    (*m)[0][2] = d;
    (*m)[1][2] = e;
    (*m)[2][2] = f;
}

void mathutil_mtxA_rotate_x(int angle)
{
    mathutil_mtxA_rotate_x_sin_cos(mathutil_sin(angle), mathutil_cos(angle));
}
#else
asm void mathutil_mtxA_rotate_x(int angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

// void mathutil_mtxA_rotate_x_sin_cos(float sinAngle, float cosAngle)
entry mathutil_mtxA_rotate_x_sin_cos
    // f1 = sin
    // f2 = cos
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f0, f2, f1  // f0 = (cos, sin)
    psq_l f3, OFFSET_mtxA+0x04(r4), 0, GQR_F32  // f3 = (mtxA[0][1], mtxA[0][2])
    psq_l f4, OFFSET_mtxA+0x14(r4), 0, GQR_F32  // f4 = (mtxA[1][1], mtxA[1][2])
    psq_l f5, OFFSET_mtxA+0x24(r4), 0, GQR_F32  // f5 = (mtxA[2][1], mtxA[2][2])
    ps_mul f6, f3, f0                           // f6 = (mtxA[0][1] * cos, mtxA[0][2] * sin)
    ps_mul f7, f4, f0                           // f7 = (mtxA[1][1] * cos, mtxA[1][2] * sin)
    ps_mul f8, f5, f0                           // f8 = (mtxA[2][1] * cos, mtxA[2][2] * sin)
    fneg f1, f1
    ps_sum0 f6, f6, f6, f6
    ps_sum0 f7, f7, f7, f7
    ps_sum0 f8, f8, f8, f8
    ps_merge00 f0, f1, f2          // f0 = (-sin, cos)
    stfs f6, OFFSET_mtxA+0x04(r4)  // mtxA[0][1] = mtxA[0][1] * cos + mtxA[0][2] * sin
    ps_mul f6, f3, f0              // f6 = (mtxA[0][1] * -sin, mtxA[0][2] * cos)
    stfs f7, OFFSET_mtxA+0x14(r4)  // mtxA[1][1] = mtxA[1][1] * cos + mtxA[1][2] * sin
    ps_mul f7, f4, f0              // f7 = (mtxA[1][1] * -sin, mtxA[1][2] * cos)
    stfs f8, OFFSET_mtxA+0x24(r4)  // mtxA[2][1] = mtxA[2][1] * cos + mtxA[2][2] * sin
    ps_mul f8, f5, f0              // f8 = (mtxA[2][1] * -sin, mtxA[2][2] * cos)
    ps_sum0 f6, f6, f6, f6
    stfs f6, OFFSET_mtxA+0x08(r4)  // mtxA[0][2] = mtxA[0][1] * -sin + mtxA[0][2] * cos
    ps_sum0 f7, f7, f7, f7
    stfs f7, OFFSET_mtxA+0x18(r4)  // mtxA[1][2] = mtxA[1][1] * -sin + mtxA[1][2] * cos
    ps_sum0 f8, f8, f8, f8
    stfs f8, OFFSET_mtxA+0x28(r4)  // mtxA[2][2] = mtxA[2][1] * -sin + mtxA[2][2] * cos
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_rotate_y_sin_cos(float sinAngle, float cosAngle)
{
    Mtx *m = &mathutilData->mtxA;
    float a = (*m)[0][0] * sinAngle + (*m)[0][2] * cosAngle;
    float b = (*m)[1][0] * sinAngle + (*m)[1][2] * cosAngle;
    float c = (*m)[2][0] * sinAngle + (*m)[2][2] * cosAngle;
    float d = (*m)[0][0] * cosAngle + (*m)[0][2] * -sinAngle;
    float e = (*m)[1][0] * cosAngle + (*m)[1][2] * -sinAngle;
    float f = (*m)[2][0] * cosAngle + (*m)[2][2] * -sinAngle;

    (*m)[0][2] = a;
    (*m)[1][2] = b;
    (*m)[2][2] = c;
    (*m)[0][0] = d;
    (*m)[1][0] = e;
    (*m)[2][0] = f;
}

void mathutil_mtxA_rotate_y(int angle)
{
    mathutil_mtxA_rotate_y_sin_cos(mathutil_sin(angle), mathutil_cos(angle));
}
#else
asm void mathutil_mtxA_rotate_y(int angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

// void mathutil_mtxA_rotate_y_sin_cos(float sinAngle, float cosAngle)
entry mathutil_mtxA_rotate_y_sin_cos
    // f1 = sin
    // f2 = cos
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f0, f1, f2  // f0 = (sin, cos)
    lfs f3, OFFSET_mtxA+0x00(r4)  // f3 = mtxA[0][0]
    lfs f6, OFFSET_mtxA+0x08(r4)  // f6 = mtxA[0][2]
    lfs f4, OFFSET_mtxA+0x10(r4)  // f4 = mtxA[1][0]
    lfs f7, OFFSET_mtxA+0x18(r4)  // f7 = mtxA[1][2]
    lfs f5, OFFSET_mtxA+0x20(r4)  // f5 = mtxA[2][0]
    lfs f8, OFFSET_mtxA+0x28(r4)  // f8 = mtxA[2][2]
    ps_merge00 f3, f3, f6  // f3 = (mtxA[0][0], mtxA[0][2])
    ps_merge00 f4, f4, f7  // f4 = (mtxA[1][0], mtxA[1][2])
    ps_merge00 f5, f5, f8  // f5 = (mtxA[2][0], mtxA[2][2])
    ps_mul f6, f3, f0  // f6 = (mtxA[0][0] * sin, mtxA[0][2] * cos)
    ps_mul f7, f4, f0  // f7 = (mtxA[1][0] * sin, mtxA[1][2] * cos)
    ps_mul f8, f5, f0  // f8 = (mtxA[2][0] * sin, mtxA[2][2] * cos)
    fneg f1, f1
    ps_sum0 f6, f6, f6, f6
    ps_sum0 f7, f7, f7, f7
    ps_sum0 f8, f8, f8, f8
    ps_merge00 f0, f2, f1  // f0 = (cos, -sin)
    stfs f6, OFFSET_mtxA+0x08(r4)  // mtxA[0][2] = mtxA[0][0] * sin + mtxA[0][2] * cos
    ps_mul f6, f3, f0              // f6 = (mtxA[0][0] * cos, mtxA[0][2] * -sin)
    stfs f7, OFFSET_mtxA+0x18(r4)  // mtxA[1][2] = mtxA[1][0] * sin + mtxA[1][2] * cos
    ps_mul f7, f4, f0              // f7 = (mtxA[1][0] * cos, mtxA[1][2] * -sin)
    stfs f8, OFFSET_mtxA+0x28(r4)  // mtxA[2][2] = mtxA[2][0] * sin + mtxA[2][2] * cos
    ps_mul f8, f5, f0              // f8 = (mtxA[2][0] * cos, mtxA[2][2] * -sin)
    ps_sum0 f6, f6, f6, f6
    stfs f6, OFFSET_mtxA+0x00(r4)  // mtxA[0][0] = mtxA[0][0] * cos + mtxA[0][2] * -sin
    ps_sum0 f7, f7, f7, f7
    stfs f7, OFFSET_mtxA+0x10(r4)  // mtxA[1][0] = mtxA[1][0] * cos + mtxA[1][2] * -sin
    ps_sum0 f8, f8, f8, f8
    stfs f8, OFFSET_mtxA+0x20(r4)  // mtxA[2][0] = mtxA[2][0] * cos + mtxA[2][2] * -sin
    blr
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_rotate_z_sin_cos(float sinAngle, float cosAngle)
{
    Mtx *m = &mathutilData->mtxA;
    float a = (*m)[0][0] * cosAngle + (*m)[0][1] * sinAngle;
    float b = (*m)[1][0] * cosAngle + (*m)[1][1] * sinAngle;
    float c = (*m)[2][0] * cosAngle + (*m)[2][1] * sinAngle;
    float d = (*m)[0][0] * -sinAngle + (*m)[0][1] * cosAngle;
    float e = (*m)[1][0] * -sinAngle + (*m)[1][1] * cosAngle;
    float f = (*m)[2][0] * -sinAngle + (*m)[2][1] * cosAngle;

    (*m)[0][0] = a;
    (*m)[1][0] = b;
    (*m)[2][0] = c;
    (*m)[0][1] = d;
    (*m)[1][1] = e;
    (*m)[2][1] = f;
}

void mathutil_mtxA_rotate_z(int angle)
{
    mathutil_mtxA_rotate_z_sin_cos(mathutil_sin(angle), mathutil_cos(angle));
}
#else
asm void mathutil_mtxA_rotate_z(int angle)
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4

// void mathutil_mtxA_rotate_z_sin_cos(float sinAngle, float cosAngle)
entry mathutil_mtxA_rotate_z_sin_cos
    // f1 = sin
    // f2 = cos
    lis r4, LC_CACHE_BASE@ha
    ps_merge00 f0, f2, f1  // f0 = (cos, sin)
    psq_l f3, OFFSET_mtxA+0x00(r4), 0, GQR_F32  // f3 = (mtxA[0][0], mtxA[0][1])
    psq_l f4, OFFSET_mtxA+0x10(r4), 0, GQR_F32  // f4 = (mtxA[1][0], mtxA[1][1])
    psq_l f5, OFFSET_mtxA+0x20(r4), 0, GQR_F32  // f5 = (mtxA[2][0], mtxA[2][1])
    ps_mul f6, f3, f0  // f6 = (mtxA[0][0] * cos, mtxA[0][1] * sin)
    ps_mul f7, f4, f0  // f7 = (mtxA[1][0] * cos, mtxA[1][1] * sin)
    ps_mul f8, f5, f0  // f8 = (mtxA[2][0] * cos, mtxA[2][1] * sin)
    fneg f1, f1
    ps_sum0 f6, f6, f6, f6
    ps_sum0 f7, f7, f7, f7
    ps_sum0 f8, f8, f8, f8
    ps_merge00 f0, f1, f2  // f0 = (-sin, cos)
    stfs f6, OFFSET_mtxA+0x00(r4)  // mtxA[0][0] = mtxA[0][0] * cos + mtxA[0][1] * sin
    ps_mul f6, f3, f0              // f6 = (mtxA[0][0] * -sin, mtxA[0][1] * cos)
    stfs f7, OFFSET_mtxA+0x10(r4)  // mtxA[1][0] = mtxA[1][0] * cos + mtxA[1][1] * sin
    ps_mul f7, f4, f0              // f7 = (mtxA[1][0] * -sin, mtxA[1][1] * cos)
    stfs f8, OFFSET_mtxA+0x20(r4)  // mtxA[2][0] = mtxA[2][0] * cos + mtxA[2][1] * sin
    ps_mul f8, f5, f0              // f8 = (mtxA[2][0] * -sin, mtxA[2][1] * cos)
    ps_sum0 f6, f6, f6, f6
    stfs f6, OFFSET_mtxA+0x04(r4)  // mtxA[0][1] = mtxA[0][0] * -sin + mtxA[0][1] * cos
    ps_sum0 f7, f7, f7, f7
    stfs f7, OFFSET_mtxA+0x14(r4)  // mtxA[1][1] = mtxA[1][0] * -sin + mtxA[1][1] * cos
    ps_sum0 f8, f8, f8, f8
    stfs f8, OFFSET_mtxA+0x24(r4)  // mtxA[2][1] = mtxA[2][0] * -sin + mtxA[2][1] * cos
    blr
}
#endif

#ifdef C_ONLY
float mathutil_vec_normalize_len(register Vec *vec)
{
    float sqLen = vec->x*vec->x + vec->y*vec->y + vec->z*vec->z;

    if (sqLen > FLT_EPSILON)
    {
        float lenRecip = mathutil_rsqrt(sqLen);
        vec->x *= lenRecip;
        vec->y *= lenRecip;
        vec->z *= lenRecip;
        return lenRecip * sqLen;  // 1/(len) * len² = len
    }
    vec->x = vec->y = vec->z = 0.0f;
    return 0.0f;
}
#else
// Normalize a vector and return its original length
asm float mathutil_vec_normalize_len(register Vec *vec)
{
    nofralloc

    lis r5, LC_CACHE_BASE@ha

    lfs f6, vec->x
    lfs f7, vec->y
    lfs f8, vec->z

    fmuls f1, f6, f6
    fmadds f1, f7, f7, f1
    fmadds f1, f8, f8, f1  // f1 = vec->x*vec->x + vec->y*vec->y + vec->z*vec->z

    lfs f2, OFFSET_constOneHalfF(r5)
    mcrfs cr1, 4  // copy FPSCR bits 16-19 (floating-point condition code) to cr1?
    mcrfs cr0, 3  // copy FPSCR bits 12-15 to cr0?
    bt 4*cr1+3, bad_result  // branch if unordered or NaN?
    bt 4*cr0+3, bad_result  // branch if quiet NaN, denormalized, or -zero?
    bf 4*cr1+1, bad_result  // branch if less than or equal to zero (bit FG=0)?
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

bad_result:
    lfs f1, OFFSET_constZeroF(r5)
    stfs f1, vec->x
    stfs f1, vec->y
    stfs f1, vec->z
    blr
}
#endif

#ifdef C_ONLY
void mathutil_vec_set_len(Vec *src, Vec *dest, float len)
{
    float srcSqLen = src->x*src->x + src->y*src->y + src->z*src->z;

    if (srcSqLen > FLT_EPSILON)
    {
        float scale = mathutil_rsqrt(srcSqLen) * len;  // new length / old length
        dest->x = src->x * scale;
        dest->y = src->y * scale;
        dest->z = src->z * scale;
    }
    else
        dest->x = dest->y = dest->z = 0.0f;
}
#else
asm void mathutil_vec_set_len(register Vec *src, register Vec *dest, register float len)
{
    nofralloc

    lis r6, LC_CACHE_BASE@ha
    fmr f0, f1  // len
    lfs f6, src->x
    lfs f7, src->y
    lfs f8, src->z
    fmuls f1, f6, f6
    fmadds f1, f7, f7, f1
    fmadds f1, f8, f8, f1

    mcrfs cr1, 4  // copy FPSCR bits 16-19 (floating-point condition code) to cr1?
    mcrfs cr0, 3  // copy FPSCR bits 12-15 to cr0?
    lfs f2, OFFSET_constOneHalfF(r6)
    bt 4*cr1+3, bad_result  // branch if unordered or NaN?
    bt 4*cr0+3, bad_result  // branch if quiet NaN, denormalized, or -zero?
    bf 4*cr1+1, bad_result  // branch if less than or equal to zero (bit FG=0)?
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

bad_result:
    lfs f6, OFFSET_constZeroF(r6)
    stfs f6, dest->x
    stfs f6, dest->y
    stfs f6, dest->z
    blr
}
#endif

// Dots the normalized versions of two vectors. Returns "safe" values if a vector
// is invalid
// (return 0 if a vector is the zero vector, or returns INFINITY if a vector has
// a component that's INFINITY).
#ifdef C_ONLY
float mathutil_vec_dot_normalized_safe(register Vec *a, register Vec *b)
{
    float f7 = a->x*b->x + a->y*b->y + a->z*b->z;
    float f1 = (a->x*a->x + a->y*a->y + a->z*a->z) * (b->x*b->x + b->y*b->y + b->z*b->z);

    if (f1 > FLT_EPSILON)
        return mathutil_rsqrt(f1) * f7;
    return 0.0f;
}
#else
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
    fmuls f8, f1, f1  // f8 = a->x*a->x
    fmuls f9, f4, f4  // f9 = b->x*b->x
    fmuls f7, f1, f4  // f7 = a->x*b->x

    fmadds f8, f2, f2, f8  // f8 = a->y*a->y + a->x*a->x
    fmadds f9, f5, f5, f9  // f9 = b->y*b->y + b->x*b->x
    fmadds f7, f2, f5, f7  // f7 = a->y*b->y + a->x*b->x

    fmadds f8, f3, f3, f8  // f8 = a->z*a->z + a->y*a->y + a->x*a->x
    fmadds f9, f6, f6, f9  // f9 = b->z*b->z + b->y*b->y + b->x*b->x
    fmadds f7, f3, f6, f7  // f7 = a->z*b->z + a->y*b->y + a->x*b->x
    fmuls f1, f8, f9       // f1 = (a->z*a->z + a->y*a->y + a->x*a->x) * (b->z*b->z + b->y*b->y + b->x*b->x)

    mcrfs cr1, 4  // copy FPSCR bits 16-19 (floating-point condition code) to cr1?
    mcrfs cr0, 3  // copy FPSCR bits 12-15 to cr0?
    lfs f2, OFFSET_constOneHalfF(r6)
    bt 4*cr1+3, _sqrt_return_special  // branch if unordered or NaN?
    bt 4*cr0+3, _return_zero  // branch if quiet NaN, denormalized, or -zero?
    bf 4*cr1+1, _return_zero  // branch if less than or equal to zero (bit FG=0)?
    mflr r5
    bl approx_rsqrt
    mtlr r5

    fmuls f1, f1, f7
    blr
}
#endif

#ifdef C_ONLY
void print_mtx(Mtx m)
{
    int row;

    for (row = 0; row < 3; row++)
        OSReport("[%3.2f, %3.2f, %3.2f, %3.2f]\n", m[row][0], m[row][1], m[row][2], m[row][3]);
}
#endif

#ifdef C_ONLY
void mathutil_mtxA_from_quat(Quaternion *quat)
{
    Mtx *m = &mathutilData->mtxA;

    (*m)[0][3] = (*m)[1][3] = (*m)[2][3] = 0.0f;

    (*m)[0][0] = 1.0f - (quat->z*quat->z + quat->y*quat->y) * 2.0f;
    (*m)[1][1] = 1.0f - (quat->x*quat->x + quat->z*quat->z) * 2.0f;
    (*m)[2][2] = 1.0f - (quat->y*quat->y + quat->x*quat->x) * 2.0f;

    (*m)[1][2] = quat->y*(quat->z + quat->z) - quat->w*(quat->x + quat->x);
    (*m)[2][1] = quat->y*(quat->z + quat->z) + quat->w*(quat->x + quat->x);
    (*m)[2][0] = quat->x*(quat->z + quat->z) - quat->w*(quat->y + quat->y);
    (*m)[0][2] = quat->x*(quat->z + quat->z) + quat->w*(quat->y + quat->y);
    (*m)[0][1] = quat->x*(quat->y + quat->y) - quat->w*(quat->z + quat->z);
    (*m)[1][0] = quat->x*(quat->y + quat->y) + quat->w*(quat->z + quat->z);
}
#else
asm void mathutil_mtxA_from_quat(register Quaternion *quat)
{
    nofralloc

    lis r4, LC_CACHE_BASE@ha
    lfs f0, quat->x
    lfs f1, quat->y
    lfs f5, OFFSET_constOneF(r4)
    lfs f2, quat->z
    fsubs f4, f5, f5  // f4 = 0
    lfs f3, quat->w
    fadds f6, f5, f5  // f6 = 2

    stfs f4, OFFSET_mtxA+0x0C(r4)  // mtxA[0][3] = 0
    stfs f4, OFFSET_mtxA+0x1C(r4)  // mtxA[1][3] = 0
    stfs f4, OFFSET_mtxA+0x2C(r4)  // mtxA[2][3] = 0

    fmuls f9, f0, f0  // f9 = x*x
    fmuls f7, f1, f1  // f7 = y*y
    fmuls f8, f2, f2  // f8 = z*z
    fmadds f9, f2, f2, f9  // f9 = x*x + z*z
    fmadds f7, f0, f0, f7  // f7 = y*y + x*x
    fmadds f8, f1, f1, f8  // f8 = z*z + y*y

    fnmsubs f9, f9, f6, f5
    stfs f9, OFFSET_mtxA+0x14(r4)  // mtxA[1][1] = -(2*(x*x + z*z) - 1)

    fnmsubs f7, f7, f6, f5
    stfs f7, OFFSET_mtxA+0x28(r4)  // mtxA[2][2] = -(2*(y*y + x*x) - 1)

    fnmsubs f8, f8, f6, f5
    stfs f8, OFFSET_mtxA+0x00(r4)  // mtxA[0][0] = -(2*(z*z + y*y) - 1)

    fadds f6, f0, f0  // f6 = x + x
    fadds f4, f1, f1  // f4 = y + y
    fadds f5, f2, f2  // f5 = z + z
    fmuls f6, f3, f6  // f6 = w*(x + x)
    fmuls f7, f3, f4  // f7 = w*(y + y)
    fmuls f8, f3, f5  // f8 = w*(z + z)

    fmsubs f9, f1, f5, f6
    stfs f9,  OFFSET_mtxA+0x18(r4)  // mtxA[1][2] = y*(z + z) - w*(x + x)

    fmadds f10, f1, f5, f6
    stfs f10, OFFSET_mtxA+0x24(r4)  // mtxA[2][1] = y*(z + z) + w*(x + x)

    fmsubs f11, f0, f5, f7
    stfs f11, OFFSET_mtxA+0x20(r4)  // mtxA[2][0] = x*(z + z) - w*(y + y)

    fmadds f12, f0, f5, f7
    stfs f12, OFFSET_mtxA+0x08(r4)  // mtxA[0][2] = x*(z + z) + w*(y + y)

    fmsubs f13, f0, f4, f8
    stfs f13, OFFSET_mtxA+0x04(r4)  // mtxA[0][1] = x*(y + y) - w*(z + z)

    fmadds f2, f0, f4, f8
    stfs f2,  OFFSET_mtxA+0x10(r4)  // mtxA[1][0] = x*(y + y) + w*(z + z)

    blr
}
#endif

#ifdef C_ONLY
void mathutil_quat_mult(Quaternion *result, Quaternion *a, Quaternion *b)
{
    float x = a->w*b->x + a->x*b->w + a->y*b->z - a->z*b->y;
    float y = a->w*b->y + a->y*b->w + a->z*b->x - a->x*b->z;
    float z = a->w*b->z + a->x*b->w + a->x*b->y - a->y*b->x;
    float w = a->w*b->w - (a->x*b->x + a->y*b->y + a->z*b->z);

    result->x = x;
    result->y = y;
    result->z = z;
    result->w = w;
}
#else
asm void mathutil_quat_mult(register Quaternion *result, register Quaternion *a, register Quaternion *b)
{
    nofralloc

    lfs f4,  a->x
    lfs f5,  a->y
    lfs f6,  a->z
    lfs f7,  a->w

    lfs f8,  b->x
    lfs f9,  b->y
    lfs f10, b->z
    lfs f11, b->w

    fmul f0, f6, f9   // f0 = a->z*b->y
    fmul f1, f4, f10  // f1 = a->x*b->z
    fmul f2, f5, f8   // f2 = a->y*b->x
    fmul f3, f6, f10  // f3 = a->z*b->z

    fmsubs f0, f5, f10, f0  // f0 = a->y*b->z - a->z*b->y
    fmsubs f1, f6, f8, f1   // f1 = a->z*b->x - a->x*b->z
    fmsubs f2, f4, f9, f2   // f2 = a->x*b->y - a->y*b->x

    fmadds f3, f5, f9, f3   // f3 = a->y*b->y + a->z*b->z

    fmadds f0, f4, f11, f0  // f0 = a->x*b->w + a->y*b->z - a->z*b->y
    fmadds f1, f5, f11, f1  // f1 = a->y*b->w + a->z*b->x - a->x*b->z
    fmadds f2, f6, f11, f2  // f2 = a->x*b->w + a->x*b->y - a->y*b->x

    fmadds f3, f4, f8, f3   // f3 = a->x*b->x + a->y*b->y + a->z*b->z

    fmadds f0, f7, f8, f0   // f0 = a->w*b->x + a->x*b->w + a->y*b->z - a->z*b->y
    fmadds f1, f7, f9, f1   // f1 = a->w*b->y + a->y*b->w + a->z*b->x - a->x*b->z
    fmadds f2, f7, f10, f2  // f2 = a->w*b->z + a->x*b->w + a->x*b->y - a->y*b->x

    fmsubs f3, f7, f11, f3  // f3 = a->w*b->w - (a->x*b->x + a->y*b->y + a->z*b->z)

    stfs f0, result->x
    stfs f1, result->y
    stfs f2, result->z
    stfs f3, result->w
    blr
}
#endif

#ifdef __MWERKS__
asm void func_80008378(register Vec *vec, float a, float b, float c)
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
    lfs f4, OFFSET_constZeroF(r5)
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
#endif  //__MWERKS__

void u_math_unk6(Quaternion *quat)
{
    float var1 = quat->x * quat->x
               + quat->y * quat->y
               + quat->z * quat->z
               + quat->w * quat->w;
    if (var1 < FLT_EPSILON)
    {
        quat->x = 0.0f;
        quat->y = 0.0f;
        quat->z = 0.0f;
        quat->w = 1.0f;
    }
    else
    {
        float recip = 1.0f / var1;
        quat->x = -quat->x * recip;
        quat->y = -quat->y * recip;
        quat->z = -quat->z * recip;
        quat->w =  quat->w * recip;
    }
}

void u_math_unk7(Quaternion *a, Vec *b, Vec *c, float d)
{
    Vec sp24;
    double var1 = mathutil_quat_to_axis_angle(a, &sp24);

    if (__fabs(mathutil_vec_dot_prod(&sp24, c)) < 0.9999989867210388)
    {
        Vec sp18;
        float var2;

        mathutil_vec_cross_prod(&sp24, c, &sp18);
        var2 = d * var1;
        b->x = sp18.x * var2;
        b->y = sp18.y * var2;
        b->z = sp18.z * var2;
    }
    else
    {
        b->x = b->y = b->z = 0.0f;
    }
}

void u_math_unk8(Quaternion *a, Vec *b, Vec *c, float d)
{
    Vec sp18;
    float f1;
    s16 var;

    mathutil_vec_cross_prod(b, c, &sp18);
    mathutil_vec_normalize_len(&sp18);
    f1 = mathutil_vec_len(b);
    if (f1 > PI * d - FLT_EPSILON)
        f1 = PI * d - FLT_EPSILON;
    var = (int)((0.159154936671f * f1 / d) * 65536.0f);
    mathutil_quat_from_axis_angle(a, &sp18, -var);
}

void mathutil_ray_to_euler(Vec *rayStart, Vec *rayEnd, S16Vec *rot)
{
    register float negX = rayStart->x - rayEnd->x;
    register float y    = rayEnd->y - rayStart->y;
    register float negZ = rayStart->z - rayEnd->z;

    rot->x = mathutil_atan2(y, mathutil_sqrt(mathutil_sum_of_sq_2(negX, negZ)));
    rot->y = mathutil_atan2(negX, negZ);
    rot->z = 0;
}

void mathutil_ray_to_euler_xy(Vec *rayStart, Vec *rayEnd, s16 *rotX, s16 *rotY)
{
    register float negX = rayStart->x - rayEnd->x;
    register float y    = rayEnd->y - rayStart->y;
    register float negZ = rayStart->z - rayEnd->z;

    *rotX = mathutil_atan2(y, mathutil_sqrt(mathutil_sum_of_sq_2(negX, negZ)));
    *rotY = mathutil_atan2(negX, negZ);
}

void mathutil_vec_to_euler(Vec *vec, S16Vec *rot)
{
    float negX = -vec->x;
    float y = vec->y;
    float negZ = -vec->z;

    rot->x = mathutil_atan2(y, mathutil_sqrt(mathutil_sum_of_sq_2(negX, negZ)));
    rot->y = mathutil_atan2(negX, negZ);
    rot->z = 0;
}

void mathutil_vec_to_euler_xy(Vec *vec, s16 *rotX, s16 *rotY)
{
    float negX = -vec->x;
    float y    = vec->y;
    float negZ = -vec->z;

    *rotX = mathutil_atan2(y, mathutil_sqrt(mathutil_sum_of_sq_2(negX, negZ)));
    *rotY = mathutil_atan2(negX, negZ);
}

// This appears to write a quaternion value of the character's rotation in the
// character heap, but appears to be called by other things too...
void mathutil_mtxA_to_quat(Quaternion *quat)
{
    float sp18[4];
    int spC[] = {1, 2, 0};
    float var1 = mathutilData->mtxA[0][0]
               + mathutilData->mtxA[1][1]
               + mathutilData->mtxA[2][2];
    if (var1 > 0.0f)
    {
        float var2 = mathutil_sqrt(var1 + 1.0f);
        float var3 = 0.5f / var2;

        quat->w = 0.5f * var2;
        quat->x = var3 * (mathutilData->mtxA[2][1] - mathutilData->mtxA[1][2]);
        quat->y = var3 * (mathutilData->mtxA[0][2] - mathutilData->mtxA[2][0]);
        quat->z = var3 * (mathutilData->mtxA[1][0] - mathutilData->mtxA[0][1]);
    }
    else
    {
        float f1;
        int r4;
        int r6;
        int r3;

        r4 = 0;
        if (mathutilData->mtxA[1][1] > mathutilData->mtxA[0][0])
            r4 = 1;
        if (mathutilData->mtxA[2][2] > mathutilData->mtxA[r4][r4])
            r4 = 2;
        r6 = spC[r4];
        r3 = spC[r6];

        f1 = mathutil_sqrt(mathutilData->mtxA[r4][r4] - (mathutilData->mtxA[r6][r6] + mathutilData->mtxA[r3][r3]) + 1.0f);
        sp18[r4] = 0.5f * f1;
        if (f1 != 0.0f)
            f1 = 0.5f / f1;

        sp18[3] = f1 * (mathutilData->mtxA[r3][r6] - mathutilData->mtxA[r6][r3]);
        sp18[r6] = f1 * (mathutilData->mtxA[r6][r4] + mathutilData->mtxA[r4][r6]);
        sp18[r3] = f1 * (mathutilData->mtxA[r3][r4] + mathutilData->mtxA[r4][r3]);

        quat->x = sp18[0];
        quat->y = sp18[1];
        quat->z = sp18[2];
        quat->w = sp18[3];
    }
}

void mathutil_quat_from_axis_angle(Quaternion *quat, Vec *axis, s16 angle)
{
    float var1;

    angle >>= 1;
    var1 = mathutil_vec_sq_len(axis);
    if (var1 < FLT_EPSILON)
    {
        quat->x = 0.0f;
        quat->y = 0.0f;
        quat->z = 0.0f;
        quat->w = 1.0f;
    }
    else
    {
        var1 = mathutil_rsqrt(var1) * mathutil_sin(angle);
        quat->x = axis->x * var1;
        quat->y = axis->y * var1;
        quat->z = axis->z * var1;
        quat->w = mathutil_cos(angle);
    }
}

void u_math_unk9_smth_w_quats(Quaternion *a, register Vec *b, register float c)
{
    double var1 = c / 2.0;

    if (mathutil_vec_sq_len(b) < FLT_EPSILON)
    {
        a->x = 0.0f;
        a->y = 0.0f;
        a->z = 0.0f;
        a->w = 1.0f;
    }
    else
    {
        float var2 = mathutil_rsqrt(mathutil_vec_sq_len(b)) * (float)sin(var1);
        a->x = b->x * var2;
        a->y = b->y * var2;
        a->z = b->z * var2;
        a->w = cos(var1);
    }
}

double mathutil_quat_to_axis_angle(Quaternion *quat, Vec *axis)
{
    float angle = acosf(quat->w);
    u8 filler[12];  // unused variable needed to match

    axis->x = quat->x;
    axis->y = quat->y;
    axis->z = quat->z;
    mathutil_vec_normalize_len(axis);
    return 2.0 * angle;
}

void mathutil_quat_normalize(Quaternion *quat)
{
    float sqMag = quat->x * quat->x
                + quat->y * quat->y
                + quat->z * quat->z
                + quat->w * quat->w;
    float invMag;

    if (sqMag > 0.0f)
        invMag = mathutil_rsqrt(sqMag);
    else
        invMag = 1.0f;
    quat->x *= invMag;
    quat->y *= invMag;
    quat->z *= invMag;
    quat->w *= invMag;
}

// Computes the rotation between two vectors
void mathutil_quat_from_dirs(Quaternion *quat, Vec *start, Vec *end)
{
    float var1;
    float x, y, z;
    float var2 = start->x * end->x
               + start->y * end->y
               + start->z * end->z;

    if (var2 > 0.99998998642f)
    {
        quat->x = quat->y = quat->z = 0.0f;
        quat->w = 1.0f;
    }
    else if (var2 < -0.99998998642f)
    {
        x = 0.0f;
        y = start->x;
        z = -start->y;

        if (mathutil_sqrt(y * y + z * z) < 0.000001)
        {
            x = -start->z;
            y = 0.0f;
            z = start->x;
        }

        var1 = mathutil_rsqrt(x * x + y * y + z * z);
        x *= var1;
        y *= var1;
        z *= var1;

        quat->x = x;
        quat->y = y;
        quat->z = z;
        quat->w = 0.0f;
    }
    else
    {
        x = start->y * end->z - start->z * end->y;
        y = start->z * end->x - start->x * end->z;
        z = start->x * end->y - start->y * end->x;

        var1 = mathutil_rsqrt(x * x + y * y + z * z);
        x *= var1;
        y *= var1;
        z *= var1;

        var1 = mathutil_sqrt(0.5f * (1.0f - var2));
        x *= var1;
        y *= var1;
        z *= var1;

        quat->x = x;
        quat->y = y;
        quat->z = z;
        quat->w = mathutil_sqrt(0.5f * (1.0f + var2));
    }
}

void mathutil_quat_slerp(Quaternion *result, Quaternion *start, Quaternion *end, float t)
{
    Quaternion temp;
    u8 filler[8];
    float var1 = start->x * end->x
               + start->y * end->y
               + start->z * end->z
               + start->w * end->w;
    float startMul;
    float endMul;

    if (var1 < 0.0f)
    {
        var1 = -var1;
        temp.x = -end->x;
        temp.y = -end->y;
        temp.z = -end->z;
        temp.w = -end->w;
    }
    else
    {
        temp.x = end->x;
        temp.y = end->y;
        temp.z = end->z;
        temp.w = end->w;
    }

    if (1.0f - var1 > 0.000001)
    {
        float var4 = acosf(var1);
        float var5 = sinf(var4);

        startMul = sinf((1.0f - t) * var4) / var5;
        endMul = sinf(t * var4) / var5;
    }
    else
    {
        startMul = 1.0f - t;
        endMul = t;
    }

    result->x = startMul * start->x + endMul * temp.x;
    result->y = startMul * start->y + endMul * temp.y;
    result->z = startMul * start->z + endMul * temp.z;
    result->w = startMul * start->w + endMul * temp.w;
}

void u_math_unk10(Quaternion *a, Quaternion *b)
{
    mathutil_mtxA_tf_vec((Vec *)a, (Vec *)b);
    b->w = a->w;
}

void u_math_unk11(Quaternion *a, Quaternion *b)
{
    mathutil_mtxA_rigid_inv_tf_vec((Vec *)a, (Vec *)b);
    b->w = a->w;
}

#pragma force_active off

static int is_large_enough(float n)  // inlined
{
    return __fabs(n) > FLT_EPSILON;
}

// Should the angles be called `yaw`, `pitch`, and `roll`? Not sure if they
// directly correspond
void mathutil_mtxA_to_euler_yxz(s16 *rotY, s16 *rotX, s16 *rotZ)
{
    Vec forward;
    Vec up;

    mathutil_mtxA_push();
    forward.x = 0.0f;
    forward.y = 0.0f;
    forward.z = -1.0f;
    up.x = 0.0f;
    up.y = 1.0f;
    up.z = 0.0f;
    mathutil_mtxA_tf_vec(&forward, &forward);
    mathutil_mtxA_tf_vec(&up, &up);
    *rotX = mathutil_atan2(forward.y, mathutil_sqrt(mathutil_sum_of_sq_2(forward.x, forward.z)));
    *rotY = mathutil_atan2(forward.x, forward.z) - 0x8000;
    mathutil_mtxA_from_rotate_y(*rotY);
    mathutil_mtxA_rotate_x(*rotX);
    mathutil_mtxA_rigid_inv_tf_vec(&up, &up);
    *rotZ = -mathutil_atan2(up.x, up.y);
    mathutil_mtxA_pop();
}

void mathutil_mtxA_to_euler(S16Vec *rot)
{
    mathutil_mtxA_to_euler_yxz(&rot->y, &rot->x, &rot->z);
}

#pragma force_active on
void u_math_unk14(s16 *a, s16 *b, s16 *c)
{
    Vec sp20;
    Vec sp14;

    mathutil_mtxA_push();
    sp20.x = 1.0f;
    sp20.y = 0.0f;
    sp20.z = 0.0f;
    sp14.x = 0.0f;
    sp14.y = 1.0f;
    sp14.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp20, &sp20);
    mathutil_mtxA_tf_vec(&sp14, &sp14);
    *a = mathutil_atan2(sp20.y, sp20.x);
    *b = -mathutil_atan2(sp20.z, mathutil_sqrt(mathutil_sum_of_sq_2(sp20.y, sp20.x)));
    mathutil_mtxA_from_rotate_z(*a);
    mathutil_mtxA_rotate_y(*b);
    mathutil_mtxA_rigid_inv_tf_vec(&sp14, &sp14);
    *c = mathutil_atan2(sp14.z, sp14.y);
    mathutil_mtxA_pop();
}
#pragma force_active off

void u_math_unk15(Vec *a, Vec *b, float c)
{
    mathutil_mtxA_tf_point(a, b);
    if (is_large_enough(b->z))
    {
        float f2 = 240.0f / (b->z * c);
        b->x = 320.0f + (-b->x * f2);
        b->y = 240.0f + (b->y * f2);
    }
    else
    {
        b->x = 10000.0f;
        b->y = 10000.0f;
    }
}

void u_math_unk16(Vec *a, Vec *b, float c)
{
    mathutil_mtxA_tf_point(a, b);
    if (is_large_enough(b->z))
    {
        float f2 = -1.0f / (b->z * c);
        b->x = 0.75f * b->x * f2;
        b->y = b->y * f2;
    }
    else
    {
        b->x = 10000.0f;
        b->y = 10000.0f;
    }
}

void mathutil_scale_ray(Vec *rayStart, Vec *rayEnd, Vec *outRayEnd, float scale)
{
    outRayEnd->x = (rayEnd->x - rayStart->x) * scale + rayStart->x;
    outRayEnd->y = (rayEnd->y - rayStart->y) * scale + rayStart->y;
    outRayEnd->z = (rayEnd->z - rayStart->z) * scale + rayStart->z;
}

const u16 crcTable[] =
{
    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7,
    0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,
    0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6,
    0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,
    0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485,
    0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,
    0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4,
    0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,
    0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823,
    0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,
    0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12,
    0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,
    0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41,
    0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,
    0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70,
    0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,
    0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F,
    0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,
    0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E,
    0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,
    0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D,
    0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
    0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C,
    0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,
    0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB,
    0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,
    0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A,
    0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,
    0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9,
    0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,
    0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8,
    0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0,
};

u16 mathutil_calc_crc16(s32 length, u8 *data)
{
    u32 crc = 0xFFFF;
    while (--length >= 0)
    {
        u32 r5 = crc >> 8;
        u8 idx = r5 ^ (s8)*data;
        crc <<= 8;
        crc ^= crcTable[idx];
        data++;
    }
    return ~crc;
}
