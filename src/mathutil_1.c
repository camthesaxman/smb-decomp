#include <dolphin.h>

#include "global.h"

#pragma fp_contract off

void lbl_80007F3C();
extern float lbl_800070EC();
extern float lbl_80007088();
extern float func_800070B0();
extern void mathutil_sin_cos();

void lbl_80007F34();
void lbl_80007F3C();
void lbl_80007E80();
void lbl_80007DE0();
void lbl_80007E80();
void mathutil_tf_point_by_a_mtx_trans();
void mathutil_neg_tf_point_by_a_mtx_trans_v();
void mathutil_set_a_mtx_mult_by_a_mtx();
void mathutil_mult_mtx();
u32 mathutil_atan(float);
void lbl_80007080();
void lbl_80007090();

extern float lbl_802F1B68;
extern u32 lbl_802F1B6C;

float mathutil_sqrt(float);
float mathutil_rsqrt(float);

extern float lbl_80194940[];
extern float lbl_80184920[];

asm void mathutil_init(void)
{
    nofralloc

	li r3, 0
	mtspr 0x390, r3
	li r3, 4
	oris r3, r3, 4
	mtspr 0x392, r3
	li r3, 5
	oris r3, r3, 5
	mtspr 0x393, r3
	li r3, 6
	oris r3, r3, 6
	mtspr 0x394, r3
	li r3, 7
	oris r3, r3, 7
	mtspr 0x395, r3
	li r3, 0
	mtspr 0x396, r3
	li r3, 0
	mtspr 0x397, r3
	blr
entry lbl_80007080
	lis r0, 0x7fff
	b lbl_800070A0
entry lbl_80007088
	li r0, 0
	b lbl_800070A0
entry lbl_80007090
	lis r0, 0x7f80
	b lbl_800070A0
	lis r0, 0xff80
	b lbl_800070A0
lbl_800070A0:
	stwu r0, -0x10(r1)
	lfs f1, 0(r1)
	addi r1, r1, 0x10
	blr
}

asm float func_800070B0()
{
    nofralloc

	fmul f4, f2, f1
	fadd f3, f2, f2
	frsqrte f1, f1
	fadd f3, f3, f2
	fmul f5, f1, f1
	fnmsub f5, f5, f4, f3
	fmul f1, f1, f5
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

	bgt cr1, lbl_80007090
	blt cr1, lbl_80007088
	b lbl_80007080
}

asm float mathutil_sqrt(float a)
{
    nofralloc

	frsp f0, f1
	lis r4, 0xE00001A0@ha
	mcrfs cr1, 4//cr4
	mcrfs cr0, 3//cr3
	lfs f2, 0xE00001A0@l(r4)
	bso cr1, lbl_800070EC
	bso lbl_80007088
	ble cr1, lbl_80007088
	mflr r3
	bl func_800070B0
	mtlr r3
	fmuls f1, f1, f0
	blr
lbl_8000712C:
	bgt cr1, lbl_80007088
	blt cr1, lbl_80007090
	b lbl_80007080
entry mathutil_rsqrt
	frsp f1, f1
	lis r4, 0xE00001A0@ha
	mcrfs cr1, 4//cr4
	mcrfs cr0, 3//cr3
	lfs f2, 0xE00001A0@l(r4)
	bso cr1, lbl_8000712C
	bso lbl_80007090
	ble cr1, lbl_80007090
	mflr r3
	bl func_800070B0
	mtlr r3
	frsp f1, f1
	blr
}

asm float func_8000716C(float a)
{
    nofralloc

	frsp f0, f1
	lis r4, 0xE00001A0@ha
	mcrfs cr1, 4//cr4
	mcrfs cr0, 3//cr3
	lfs f2, 0xE00001A0@l(r4)
	bso cr1, lbl_800071A8
	bso lbl_800071BC
	ble cr1, lbl_800071BC
	mflr r5
	bl func_800070B0
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

asm float mathutil_sin(u32 a)
{
    nofralloc

	andi. r5, r3, 0x4000
	clrlwi r4, r3, 0x12
	beq lbl_800071F0
	subfic r4, r4, 0x4000
lbl_800071F0:
	lis r6, lbl_80184920@h
	slwi r4, r4, 2
	ori r6, r6, lbl_80184920@l
	andi. r5, r3, 0x8000
	lfsx f1, r6, r4
	beqlr
	fneg f1, f1
	blr
}

asm void mathutil_sin_cos_v()
{
    nofralloc

	addi r5, r4, 4
	crclr 6
	b lbl_80007220
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

asm float mathutil_tan(u32 a)
{
    nofralloc

	lis r4, lbl_80194940@h
	andi. r6, r3, 0x4000
	rlwinm r5, r3, 2, 0x10, 0x1d
	ori r4, r4, lbl_80194940@l
	beq lbl_8000729C
	addis r4, r4, 1
	neg r5, r5
	lfsx f1, r5, r4
	fnabs f1, f1
	blr
lbl_8000729C:
	lfsx f1, r5, r4
	blr
}

asm u32 mathutil_atan2(float a)
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
entry mathutil_atan
	frsp f1, f1
	lis r7, 0xe000
	mcrfs cr5, 4//cr4
	mcrfs cr4, 3//cr3
	bns+ cr5, lbl_80007320
	crand 9, 19, 23
	bgt cr2, lbl_80007400
	b lbl_800073DC
lbl_80007320:
	beq cr5, lbl_80007400
	lfs f3, 0x19c(r7)
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

/*
s16 func_80007424(float a)
{
    float f1;
    if (fabs(a) > 1.0)
    {
        if (a > 0.0f)
            return 0;
        else
            return -0x8000;
    }
    //lbl_80007464
    if (fabs(a) > 1.0)
    {
        if (a > 0.0f)
            return 0;
        else
            return 0x8000;
    }
    else
    {
        f1 = mathutil_sqrt(1.0f - (a * a));
        if (f1 != 0.0f)
            return 0x4000 - mathutil_atan(a / f1);
        if (a > 0.0f)
            return 0;
        else
            return 0x8000;
    }
    //lbl_800074C0
}
*/

/*
u16 func_80007424(float a)
{
    int r3;

    float f1;
    if (fabs(a) > 1.0)
    {
        if (a > 0.0f)
            return 0;
        else
            return -32768;
    }
    //lbl_80007464
    if (fabs(a) > 1.0)
    {
        if (a > 0.0f)
            r3 = 0x4000;
        else
            r3 = -16384;
    }
    else
    {
        f1 = mathutil_sqrt(1.0f - a);
        if (f1 != 0.0f)
            r3 = mathutil_atan(a / f1);
        else if (a > 0.0f)
            r3 = 0x4000;
        else
            r3 = -16384;
    }
    //lbl_800074C0
    return 0x4000 - r3;
}
*/

asm void mathutil_dot_normalized()
{
    nofralloc

	lis r5, 0xE00001A0@ha
	lfs f6, 0(r3)
	lfs f9, 0(r4)
	fmuls f12, f6, f6
	lfs f7, 4(r3)
	fmuls f13, f9, f9
	lfs f10, 4(r4)
	fmuls f0, f6, f9
	lfs f8, 8(r3)
	fmadds f12, f7, f7, f12
	lfs f11, 8(r4)
	fmadds f13, f10, f10, f13
	fmadds f0, f7, f10, f0
	fmadds f12, f8, f8, f12
	fmadds f13, f11, f11, f13
	fmadds f0, f8, f11, f0
	lfs f2, 0xE00001A0@l(r5)
	fmuls f1, f12, f13
	mflr r6
	bl func_800070B0
	mtlr r6
	fmuls f1, f1, f0
	blr
	lis r4, 0xe000
	psq_l f1, 428(r4), 0, qr2
	psq_l f2, 430(r4), 0, qr2
	ps_sub f0, f1, f1
	psq_st f2, 0(r3), 0, qr0
	psq_st f0, 8(r3), 0, qr0
	psq_st f1, 16(r3), 0, qr0
	psq_st f0, 24(r3), 0, qr0
	psq_st f0, 32(r3), 0, qr0
	psq_st f2, 40(r3), 0, qr0
	blr
}

asm void mathutil_set_a_mtx_identity()
{
    nofralloc

	lis r3, 0xe000
	psq_l f1, 428(r3), 0, qr2
	psq_l f2, 430(r3), 0, qr2
	ps_sub f0, f1, f1
	psq_st f2, 0(r3), 0, qr0
	psq_st f0, 8(r3), 0, qr0
	psq_st f1, 16(r3), 0, qr0
	psq_st f0, 24(r3), 0, qr0
	psq_st f0, 32(r3), 0, qr0
	psq_st f2, 40(r3), 0, qr0
	blr
}

asm void mathutil_set_a_mtx_identity_sq( )
{
    nofralloc

	lis r3, 0xE0000008@ha
	psq_l f1, 428(r3), 0, qr2
	psq_l f2, 430(r3), 0, qr2
	ps_sub f0, f1, f1
	psq_st f2, 0(r3), 0, qr0
	psq_st f0, 8(r3), 1, qr0
	psq_st f1, 16(r3), 0, qr0
	psq_st f0, 24(r3), 1, qr0
	psq_st f0, 32(r3), 0, qr0
	psq_st f2, 40(r3), 1, qr0
	blr
}

asm void mathutil_set_a_mtx_translate_v()
{
    nofralloc

	lis r4, 0xE0000198@ha
	psq_l f1, 0(r3), 0, qr0
	lfs f4, 0xE0000198@l(r4)
	lfs f3, 0xE0000008@l(r3)
	ps_merge01 f9, f4, f1
	b lbl_800075E0
entry mathutil_set_a_mtx_translate
	lis r4, 0xE0000198@ha
	lfs f4, 0xE0000198@l(r4)
	ps_merge00 f9, f4, f2
lbl_800075E0:
	lfs f7, 0x19c(r4)
	ps_merge00 f8, f4, f1
	ps_merge00 f10, f7, f3
	psq_l f5, 428(r4), 0, qr2
	psq_l f6, 430(r4), 0, qr2
	psq_st f4, 32(r4), 0, qr0
	psq_st f8, 8(r4), 0, qr0
	psq_st f9, 24(r4), 0, qr0
	psq_st f10, 40(r4), 0, qr0
	psq_st f5, 16(r4), 0, qr0
	psq_st f6, 0(r4), 0, qr0
	blr
}

asm void func_80007610()
{
    nofralloc
 
	mflr r4
	bl mathutil_sin_cos
	mtlr r4
	lis r4, 0xe000
	fneg f3, f1
	psq_l f4, 430(r4), 0, qr2
	ps_merge11 f6, f4, f4
	ps_merge10 f7, f4, f2
	ps_merge01 f8, f3, f4
	ps_merge10 f9, f4, f1
	ps_merge01 f10, f2, f4
	psq_st f4, 0(r4), 0, qr0
	psq_st f6, 8(r4), 0, qr0
	psq_st f8, 24(r4), 0, qr0
	psq_st f7, 16(r4), 0, qr0
	psq_st f9, 32(r4), 0, qr0
	psq_st f10, 40(r4), 0, qr0
	blr
}

asm void mathutil_set_a_mtx_rotate_y()
{
    nofralloc

	mflr r4
	bl mathutil_sin_cos
	mtlr r4
	lis r4, 0xe000
	fneg f3, f1
	psq_l f4, 428(r4), 0, qr2
	ps_merge00 f5, f2, f4
	ps_merge00 f6, f1, f4
	ps_merge00 f8, f4, f4
	ps_merge00 f9, f3, f4
	psq_st f5, 0(r4), 0, qr0
	psq_st f6, 8(r4), 0, qr0
	psq_st f4, 16(r4), 0, qr0
	psq_st f8, 24(r4), 0, qr0
	psq_st f9, 32(r4), 0, qr0
	psq_st f5, 40(r4), 0, qr0
	blr
}

asm void mathutil_set_a_mtx_rotate_z()
{
    nofralloc

	mflr r4
	bl mathutil_sin_cos
	mtlr r4
	lis r4, 0xe000
	fneg f3, f1
	psq_l f4, 430(r4), 0, qr2
	ps_merge00 f5, f2, f3
	ps_merge11 f6, f4, f4
	ps_merge00 f7, f1, f2
	psq_st f5, 0(r4), 0, qr0
	psq_st f6, 8(r4), 0, qr0
	psq_st f7, 16(r4), 0, qr0
	psq_st f6, 24(r4), 0, qr0
	psq_st f6, 32(r4), 0, qr0
	psq_st f4, 40(r4), 0, qr0
	blr
}

asm void mathutil_set_b_mtx_scale_a_mtx_by_v()
{
    nofralloc

	lis r4, 0xe000
	psq_l f1, 0(r3), 0, qr0
	psq_l f3, 8(r3), 1, qr0
	b lbl_800076FC
	lis r4, 0xE000019C@ha
	lfs f4, 0xE000019C@l(r4)
	ps_merge00 f1, f1, f2
	ps_merge00 f3, f3, f4
lbl_800076FC:
	psq_l f4, 48(r4), 0, qr0
	psq_st f4, 0(r4), 0, qr0
	ps_mul f4, f4, f1
	psq_l f6, 64(r4), 0, qr0
	psq_st f6, 16(r4), 0, qr0
	ps_mul f6, f6, f1
	psq_l f8, 80(r4), 0, qr0
	psq_st f8, 32(r4), 0, qr0
	ps_mul f8, f8, f1
	psq_l f5, 56(r4), 0, qr0
	ps_madd f4, f5, f3, f4
	psq_l f7, 72(r4), 0, qr0
	ps_madd f6, f7, f3, f6
	psq_l f9, 88(r4), 0, qr0
	ps_madd f8, f9, f3, f8
	ps_sum1 f5, f4, f5, f4
	psq_st f5, 8(r4), 0, qr0
	ps_sum1 f7, f6, f7, f6
	psq_st f7, 24(r4), 0, qr0
	ps_sum1 f9, f8, f9, f8
	psq_st f9, 40(r4), 0, qr0
	blr
}

asm void mathutil_normalize_a_mtx_quat()
{
    nofralloc

	lis r3, 0xE00001A0@ha
	mflr r4
	lfs f2, 0xE00001A0@l(r3)
	psq_l f6, 0(r3), 0, qr0
	lfs f7, 8(r3)
	ps_mul f12, f6, f6
	psq_l f8, 16(r3), 0, qr0
	fmuls f13, f7, f7
	lfs f9, 0x18(r3)
	ps_madd f12, f8, f8, f12
	psq_l f10, 32(r3), 0, qr0
	fmadds f13, f9, f9, f13
	lfs f11, 0x28(r3)
	ps_madd f12, f10, f10, f12
	fmadds f13, f11, f11, f13
	fmr f1, f12
	bl func_800070B0
	frsp f1, f1
	ps_merge01 f12, f1, f12
	ps_merge11 f1, f12, f12
	bl func_800070B0
	frsp f1, f1
	ps_merge00 f1, f12, f1
	ps_mul f6, f6, f1
	psq_st f6, 0(r3), 0, qr0
	ps_mul f8, f8, f1
	psq_st f8, 16(r3), 0, qr0
	ps_mul f10, f10, f1
	psq_st f10, 32(r3), 0, qr0
	fmr f1, f13
	bl func_800070B0
	mtlr r4
	fmuls f7, f7, f1
	stfs f7, 8(r3)
	fmuls f9, f9, f1
	stfs f9, 0x18(r3)
	fmuls f11, f11, f1
	stfs f11, 0x28(r3)
	blr
}

asm void mathutil_push_a_mtx()
{
    nofralloc

	lis r3, 0xE0000094@ha
	lwz r4, 0xE0000094@l(r3)
	psq_l f0, 0(r3), 0, qr0
	psq_l f1, 8(r3), 0, qr0
	psq_l f2, 16(r3), 0, qr0
	addi r4, r4, -48
	psq_l f3, 24(r3), 0, qr0
	psq_l f4, 32(r3), 0, qr0
	psq_l f5, 40(r3), 0, qr0
	psq_st f0, 0(r4), 0, qr0
	psq_st f1, 8(r4), 0, qr0
	psq_st f2, 16(r4), 0, qr0
	psq_st f3, 24(r4), 0, qr0
	psq_st f4, 32(r4), 0, qr0
	psq_st f5, 40(r4), 0, qr0
	stw r4, 0x94(r3)
	blr
}

asm void mathutil_pop_a_mtx()
{
    nofralloc

	lis r3, 0xE0000094@ha
	lwz r4, 0xE0000094@l(r3)
	psq_l f0, 0(r4), 0, qr0
	psq_l f1, 8(r4), 0, qr0
	psq_l f2, 16(r4), 0, qr0
	psq_l f3, 24(r4), 0, qr0
	psq_l f4, 32(r4), 0, qr0
	psq_l f5, 40(r4), 0, qr0
	addi r4, r4, 0x30
	psq_st f0, 0(r3), 0, qr0
	psq_st f1, 8(r3), 0, qr0
	psq_st f2, 16(r3), 0, qr0
	psq_st f3, 24(r3), 0, qr0
	psq_st f4, 32(r3), 0, qr0
	psq_st f5, 40(r3), 0, qr0
	stw r4, 0x94(r3)
	blr
}

asm void mathutil_get_a_mtx()
{
    nofralloc

	lis r4, 0xe000
	psq_l f0, 0(r4), 0, qr0
	psq_l f1, 8(r4), 0, qr0
	psq_l f2, 16(r4), 0, qr0
	psq_l f3, 24(r4), 0, qr0
	psq_l f4, 32(r4), 0, qr0
	psq_l f5, 40(r4), 0, qr0
	psq_st f0, 0(r3), 0, qr0
	psq_st f1, 8(r3), 0, qr0
	psq_st f2, 16(r3), 0, qr0
	psq_st f3, 24(r3), 0, qr0
	psq_st f4, 32(r3), 0, qr0
	psq_st f5, 40(r3), 0, qr0
	blr
}

asm void mathutil_set_a_mtx()
{
    nofralloc

	lis r4, 0xE0000030@ha
	psq_l f0, 0(r3), 0, qr0
	psq_l f1, 8(r3), 0, qr0
	psq_l f2, 16(r3), 0, qr0
	psq_l f3, 24(r3), 0, qr0
	psq_l f4, 32(r3), 0, qr0
	psq_l f5, 40(r3), 0, qr0
	psq_st f0, 0(r4), 0, qr0
	psq_st f1, 8(r4), 0, qr0
	psq_st f2, 16(r4), 0, qr0
	psq_st f3, 24(r4), 0, qr0
	psq_st f4, 32(r4), 0, qr0
	psq_st f5, 40(r4), 0, qr0
	blr
}

asm void mathutil_get_stack_mtx()
{
    nofralloc

	lis r3, 0xE0000094@ha
	lwz r4, 0xE0000094@l(r3)
	psq_l f0, 0(r4), 0, qr0
	psq_l f1, 8(r4), 0, qr0
	psq_l f2, 16(r4), 0, qr0
	psq_l f3, 24(r4), 0, qr0
	psq_l f4, 32(r4), 0, qr0
	psq_l f5, 40(r4), 0, qr0
	psq_st f0, 0(r3), 0, qr0
	psq_st f1, 8(r3), 0, qr0
	psq_st f2, 16(r3), 0, qr0
	psq_st f3, 24(r3), 0, qr0
	psq_st f4, 32(r3), 0, qr0
	psq_st f5, 40(r3), 0, qr0
	blr
}

asm void func_80007924()
{
    nofralloc

	lis r3, 0xE0000094@ha
	lwz r4, 0xE0000094@l(r3)
	addi r4, r4, 0xE0000030@l
	stw r4, 0x94(r3)
	blr
	blr
}

asm void mathutil_get_a_mtx_sq()
{
    nofralloc

	lis r4, 0xE0000008@ha
	psq_l f0, 0(r4), 0, qr0
	lfs f1, 0xE0000008@l(r4)
	psq_l f2, 16(r4), 0, qr0
	lfs f3, 0x18(r4)
	psq_l f4, 32(r4), 0, qr0
	lfs f5, 0x28(r4)
	psq_st f0, 0(r3), 0, qr0
	stfs f1, 8(r3)
	psq_st f2, 16(r3), 0, qr0
	stfs f3, 0x18(r3)
	psq_st f4, 32(r3), 0, qr0
	stfs f5, 0x28(r3)
	blr
}

asm void mathutil_set_a_mtx_sq()
{
    nofralloc
	lis r4, 0xE0000008@ha
	psq_l f0, 0(r3), 0, qr0
	lfs f1, 8(r3)
	psq_l f2, 16(r3), 0, qr0
	lfs f3, 0x18(r3)
	psq_l f4, 32(r3), 0, qr0
	lfs f5, 0x28(r3)
	psq_st f0, 0(r4), 0, qr0
	stfs f1, 0xE0000008@l(r4)
	psq_st f2, 16(r4), 0, qr0
	stfs f3, 0x18(r4)
	psq_st f4, 32(r4), 0, qr0
	stfs f5, 0x28(r4)
	blr
}

asm void mathutil_set_a_mtx_b_mtx()
{
    nofralloc

	lis r3, 0xe000
	psq_l f0, 48(r3), 0, qr0
	psq_l f1, 56(r3), 0, qr0
	psq_l f2, 64(r3), 0, qr0
	psq_l f3, 72(r3), 0, qr0
	psq_l f4, 80(r3), 0, qr0
	psq_l f5, 88(r3), 0, qr0
	psq_st f0, 0(r3), 0, qr0
	psq_st f1, 8(r3), 0, qr0
	psq_st f2, 16(r3), 0, qr0
	psq_st f3, 24(r3), 0, qr0
	psq_st f4, 32(r3), 0, qr0
	psq_st f5, 40(r3), 0, qr0
	blr
}

asm void mathutil_set_b_mtx_a_mtx()
{
    nofralloc
	lis r3, 0xe000
	psq_l f0, 0(r3), 0, qr0
	psq_l f1, 8(r3), 0, qr0
	psq_l f2, 16(r3), 0, qr0
	psq_l f3, 24(r3), 0, qr0
	psq_l f4, 32(r3), 0, qr0
	psq_l f5, 40(r3), 0, qr0
	psq_st f0, 48(r3), 0, qr0
	psq_st f1, 56(r3), 0, qr0
	psq_st f2, 64(r3), 0, qr0
	psq_st f3, 72(r3), 0, qr0
	psq_st f4, 80(r3), 0, qr0
	psq_st f5, 88(r3), 0, qr0
	blr
}

asm void mathutil_copy_mtx()
{
    nofralloc

	psq_l f0, 0(r3), 0, qr0
	psq_l f1, 8(r3), 0, qr0
	psq_l f2, 16(r3), 0, qr0
	psq_l f3, 24(r3), 0, qr0
	psq_l f4, 32(r3), 0, qr0
	psq_l f5, 40(r3), 0, qr0
	psq_st f0, 0(r4), 0, qr0
	psq_st f1, 8(r4), 0, qr0
	psq_st f2, 16(r4), 0, qr0
	psq_st f3, 24(r4), 0, qr0
	psq_st f4, 32(r4), 0, qr0
	psq_st f5, 40(r4), 0, qr0
	blr
}

asm void mathutil_invert_a_mtx(void)
{
    nofralloc

	lis r3, 0xE0000098@ha
	stfd f14, 0xE0000098@l(r3)
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
	lfs f10, 0x24(r3)
	lfs f7, 0x18(r3)
	fmuls f13, f10, f7
	lfs f2, 4(r3)
	lfs f11, 0x28(r3)
	fmuls f14, f2, f11
	lfs f6, 0x14(r3)
	lfs f3, 8(r3)
	fmuls f15, f6, f3
	lfs f5, 0x10(r3)
	fmuls f17, f11, f5
	fmuls f23, f5, f2
	lfs f9, 0x20(r3)
	fmuls f18, f3, f9
	fmuls f21, f9, f6
	lfs f1, 0(r3)
	fmuls f19, f7, f1
	fmuls f22, f1, f10
	lfs f4, 0xc(r3)
	fmsubs f13, f6, f11, f13
	lfs f8, 0x1c(r3)
	fmsubs f14, f10, f3, f14
	lfs f12, 0x2c(r3)
	fmsubs f15, f2, f7, f15
	fmsubs f17, f7, f9, f17
	fmsubs f18, f11, f1, f18
	fmsubs f19, f3, f5, f19
	fmsubs f21, f5, f10, f21
	fmsubs f22, f9, f2, f22
	fmsubs f23, f1, f6, f23
	fmuls f0, f1, f13
	lfs f1, 0x19c(r3)
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
	stfs f1, 0(r3)
	fmuls f2, f14, f0
	stfs f2, 4(r3)
	fmuls f3, f15, f0
	stfs f3, 8(r3)
	fmuls f4, f16, f0
	stfs f4, 0xc(r3)
	fmuls f5, f17, f0
	stfs f5, 0x10(r3)
	fmuls f6, f18, f0
	stfs f6, 0x14(r3)
	fmuls f7, f19, f0
	stfs f7, 0x18(r3)
	fmuls f8, f20, f0
	stfs f8, 0x1c(r3)
	fmuls f9, f21, f0
	stfs f9, 0x20(r3)
	fmuls f10, f22, f0
	stfs f10, 0x24(r3)
	fmuls f11, f23, f0
	stfs f11, 0x28(r3)
	fmuls f12, f24, f0
	stfs f12, 0x2c(r3)
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

asm void mathutil_transpose_a_mtx()
{
    nofralloc

	lis r3, 0xE000000C@ha
	lfs f3, 0xE000000C@l(r3)
	lfs f0, 0(r3)
	lfs f1, 4(r3)
	lfs f2, 8(r3)
	fmuls f12, f3, f0
	lfs f7, 0x1c(r3)
	fmuls f13, f3, f1
	lfs f4, 0x10(r3)
	fmuls f0, f3, f2
	lfs f5, 0x14(r3)
	lfs f6, 0x18(r3)
	fmadds f12, f7, f4, f12
	lfs f11, 0x2c(r3)
	lfs f8, 0x20(r3)
	fmadds f13, f7, f5, f13
	lfs f9, 0x24(r3)
	lfs f10, 0x28(r3)
	fmadds f0, f7, f6, f0
	stfs f1, 0x10(r3)
	stfs f2, 0x20(r3)
	fnmadds f12, f11, f8, f12
	stfs f6, 0x24(r3)
	stfs f4, 4(r3)
	fnmadds f13, f11, f9, f13
	stfs f8, 8(r3)
	stfs f9, 0x18(r3)
	fnmadds f0, f11, f10, f0
	stfs f12, 0xc(r3)
	stfs f13, 0x1c(r3)
	stfs f0, 0x2c(r3)
	blr
}

asm void mathutil_set_a_mtx_mult_a_mtx_by()
{
    nofralloc

	lis r6, 0xE0000000@ha
	mr r4, r3
	addi r3, r6, 0xE0000000@l
	addi r5, r6, 0
	b lbl_80007C7C
entry mathutil_set_a_mtx_mult_by_a_mtx
	lis r6, 0xE0000000@ha
	addi r4, r6, 0xE0000000@l
	addi r5, r6, 0
	b lbl_80007C7C
	lis r6, 0xE0000030@ha
	mr r4, r3
	addi r3, r6, 0xE0000030@l
	addi r5, r6, 0
	b lbl_80007C7C
entry mathutil_mult_mtx
	lis r6, 0xe000
lbl_80007C7C:
	psq_l f0, 0(r4), 0, qr0
	psq_l f11, 0(r3), 0, qr0
	psq_l f1, 8(r4), 0, qr0
	psq_l f12, 16(r3), 0, qr0
	psq_l f2, 16(r4), 0, qr0
	ps_muls0 f5, f0, f11
	psq_l f13, 32(r3), 0, qr0
	ps_muls0 f7, f0, f12
	psq_l f3, 24(r4), 0, qr0
	ps_muls0 f9, f0, f13
	ps_muls0 f6, f1, f11
	psq_l f4, 32(r4), 0, qr0
	ps_muls0 f8, f1, f12
	ps_muls0 f10, f1, f13
	psq_l f0, 40(r4), 0, qr0
	ps_madds1 f5, f2, f11, f5
	ps_madds1 f7, f2, f12, f7
	psq_l f1, 8(r3), 0, qr0
	ps_madds1 f9, f2, f13, f9
	ps_madds1 f6, f3, f11, f6
	psq_l f2, 24(r3), 0, qr0
	ps_madds1 f8, f3, f12, f8
	ps_madds1 f10, f3, f13, f10
	psq_l f3, 40(r3), 0, qr0
	ps_madds0 f5, f4, f1, f5
	ps_madds0 f7, f4, f2, f7
	psq_l f11, 428(r6), 0, qr2
	ps_madds0 f9, f4, f3, f9
	ps_madds0 f6, f0, f1, f6
	psq_st f5, 0(r5), 0, qr0
	ps_madds0 f8, f0, f2, f8
	psq_st f7, 16(r5), 0, qr0
	ps_madds0 f10, f0, f3, f10
	psq_st f9, 32(r5), 0, qr0
	ps_madd f6, f11, f1, f6
	ps_madd f8, f11, f2, f8
	psq_st f6, 8(r5), 0, qr0
	ps_madd f10, f11, f3, f10
	psq_st f8, 24(r5), 0, qr0
	psq_st f10, 40(r5), 0, qr0
	blr
}

asm void mathutil_tf_point_by_a_mtx_trans_v()
{
    nofralloc

	lis r4, 0xe000
	psq_l f1, 0(r3), 0, qr0
	psq_l f3, 8(r3), 1, qr0
	b lbl_80007D6C
entry mathutil_tf_point_by_a_mtx_trans
	lis r4, 0xE000019C@ha
	ps_merge00 f1, f1, f2
	lfs f0, 0xE000019C@l(r4)
	ps_merge00 f3, f3, f0
	b lbl_80007D6C
entry mathutil_neg_tf_point_by_a_mtx_trans_v
	lis r4, 0xe000
	lfs f3, 8(r3)
	psq_l f1, 0(r3), 0, qr0
	b lbl_80007D5C
	lis r4, 0xE000019C@ha
	ps_merge00 f1, f1, f2
lbl_80007D5C:
	lfs f0, 0xE000019C@l(r4)
	fneg f3, f3
	ps_neg f1, f1
	ps_merge00 f3, f3, f0
lbl_80007D6C:
	psq_l f4, 0(r4), 0, qr0
	psq_l f6, 16(r4), 0, qr0
	psq_l f8, 32(r4), 0, qr0
	ps_mul f4, f4, f1
	psq_l f5, 8(r4), 0, qr0
	ps_mul f6, f6, f1
	psq_l f7, 24(r4), 0, qr0
	ps_mul f8, f8, f1
	psq_l f9, 40(r4), 0, qr0
	ps_madd f4, f5, f3, f4
	ps_madd f6, f7, f3, f6
	ps_madd f8, f9, f3, f8
	ps_sum0 f4, f4, f4, f4
	stfs f4, 0xc(r4)
	ps_sum0 f6, f6, f6, f6
	stfs f6, 0x1c(r4)
	ps_sum0 f8, f8, f8, f8
	stfs f8, 0x2c(r4)
	blr
}

void mathutil_scale_a_mtx_sq(float a, float b);
void mathutil_scale_a_mtx_sq_s(float a);

asm void mathutil_scale_a_mtx_sq_v(Vec *a)
{
    nofralloc

	psq_l f1, 0(r3), 0, qr0
	lis r4, 0xe000
	lfs f3, 8(r3)
	b lbl_80007DE0
entry mathutil_scale_a_mtx_sq_s
	lis r4, 0xe000
	fmr f3, f1
	ps_merge00 f1, f1, f1
	b lbl_80007DE0
entry mathutil_scale_a_mtx_sq
    lis r4, 0xE0000008@ha
    ps_merge00 f1, f1, f2
entry lbl_80007DE0
    psq_l f0, 0(r4), 0, qr0
    lfs f4, 0xE0000008@l(r4)
    psq_l f5, 16(r4), 0, qr0
    ps_mul f0, f0, f1
    lfs f6, 0x18(r4)
    fmuls f4, f4, f3
    psq_l f7, 32(r4), 0, qr0
    lfs f8, 0x28(r4)
    ps_mul f5, f5, f1
    psq_st f0, 0(r4), 0, qr0
    fmuls f6, f6, f3
    stfs f4, 8(r4)
    psq_st f5, 16(r4), 0, qr0
    ps_mul f7, f7, f1
    stfs f6, 0x18(r4)
    psq_st f7, 32(r4), 0, qr0
    fmuls f8, f8, f3
    stfs f8, 0x28(r4)
    blr
}

asm void mathutil_tf_point_by_a_mtx_v(void *a, Vec *b)
{
    nofralloc

    lis r5, 0xe000
    psq_l f1, 0(r3), 0, qr0
    psq_l f3, 8(r3), 1, qr0
    b lbl_80007E80
entry mathutil_tf_vec_by_a_mtx_v
    lis r5, 0xE0000198@ha
    lfs f3, 8(r3)
    lfs f0, 0xE0000198@l(r5)
    psq_l f1, 0(r3), 0, qr0
    ps_merge00 f3, f3, f0
    b lbl_80007E80
entry mathutil_tf_point_by_a_mtx
    lis r5, 0xE000019C@ha
    ps_merge00 f1, f1, f2
    lfs f0, 0xE000019C@l(r5)
    mr r4, r3
    ps_merge00 f3, f3, f0
    b lbl_80007E80
entry mathutil_tf_vec_by_a_mtx
    lis r5, 0xE0000198@ha
    ps_merge00 f1, f1, f2
    lfs f0, 0xE0000198@l(r5)
    mr r4, r3
    ps_merge00 f3, f3, f0
entry lbl_80007E80
    psq_l f4, 0(r5), 0, qr0
    psq_l f6, 16(r5), 0, qr0
    ps_mul f4, f4, f1
    psq_l f8, 32(r5), 0, qr0
    ps_mul f6, f6, f1
    psq_l f5, 8(r5), 0, qr0
    ps_mul f8, f8, f1
    psq_l f7, 24(r5), 0, qr0
    ps_madd f4, f5, f3, f4
    psq_l f9, 40(r5), 0, qr0
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

asm void mathutil_tf_point_minus_translate_by_a_mtx_v(Vec *a)
{
    nofralloc

    lfs f1, 0(r3)
    lfs f2, 4(r3)
    lfs f3, 8(r3)
    b lbl_80007EE0
    mr r4, r3
lbl_80007EE0:
    lis r5, 0xE000000C@ha
    crclr 2
    lfs f10, 0xE000000C@l(r5)
    lfs f11, 0x1c(r5)
    lfs f12, 0x2c(r5)
    fsubs f1, f1, f10
    fsubs f2, f2, f11
    fsubs f3, f3, f12
    b lbl_80007F3C
entry mathutil_tf_neg_translate_by_a_mtx
    lis r5, 0xE000000C@ha
    mr r4, r3
    crset 2
    lfs f1, 0xE000000C@l(r5)
    lfs f2, 0x1c(r5)
    lfs f3, 0x2c(r5)
    b lbl_80007F3C
entry mathutil_tf_neg_point_by_a_mtx_v
    lfs f1, 0(r3)
    lfs f2, 4(r3)
    lfs f3, 8(r3)
    b lbl_80007F34
entry mathutil_tf_neg_point_by_a_mtx
    mr r4, r3
entry lbl_80007F34
    lis r5, 0xE0000008@ha
    crclr 2
entry lbl_80007F3C
    psq_l f4, 0(r5), 0, qr0
    lfs f5, 0xE0000008@l(r5)
    ps_mul f4, f4, f1
    psq_l f6, 16(r5), 0, qr0
    fmuls f5, f5, f1
    lfs f7, 0x18(r5)
    ps_madd f4, f6, f2, f4
    psq_l f8, 32(r5), 0, qr0
    fmadds f5, f7, f2, f5
    lfs f9, 0x28(r5)
    beq lbl_80007F74
    ps_madd f4, f8, f3, f4
    fmadds f5, f9, f3, f5
    b lbl_80007F7C
lbl_80007F74:
    ps_nmadd f4, f8, f3, f4
    fnmadds f5, f9, f3, f5
lbl_80007F7C:
    psq_st f4, 0(r4), 0, qr0
    stfs f5, 8(r4)
    blr
}

asm void mathutil_mult_a_mtx_by_rotate_x()
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4
    lis r4, 0xE0000004@ha
    ps_merge00 f0, f2, f1
    psq_l f3, 4(r4), 0, qr0
    psq_l f4, 20(r4), 0, qr0
    psq_l f5, 36(r4), 0, qr0
    ps_mul f6, f3, f0
    ps_mul f7, f4, f0
    ps_mul f8, f5, f0
    fneg f1, f1
    ps_sum0 f6, f6, f6, f6
    ps_sum0 f7, f7, f7, f7
    ps_sum0 f8, f8, f8, f8
    ps_merge00 f0, f1, f2
    stfs f6, 0xE0000004@l(r4)
    ps_mul f6, f3, f0
    stfs f7, 0x14(r4)
    ps_mul f7, f4, f0
    stfs f8, 0x24(r4)
    ps_mul f8, f5, f0
    ps_sum0 f6, f6, f6, f6
    stfs f6, 8(r4)
    ps_sum0 f7, f7, f7, f7
    stfs f7, 0x18(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, 0x28(r4)
    blr
}

void func_80008008(int unused, Mtx *b);

asm void mathutil_mult_a_mtx_by_rotate_y()
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4
entry func_80008008
    lis r4, 0xE0000000@ha
    ps_merge00 f0, f1, f2
    lfs f3, 0xE0000000@l(r4)
    lfs f6, 8(r4)
    lfs f4, 0x10(r4)
    lfs f7, 0x18(r4)
    lfs f5, 0x20(r4)
    lfs f8, 0x28(r4)
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
    stfs f6, 8(r4)
    ps_mul f6, f3, f0
    stfs f7, 0x18(r4)
    ps_mul f7, f4, f0
    stfs f8, 0x28(r4)
    ps_mul f8, f5, f0
    ps_sum0 f6, f6, f6, f6
    stfs f6, 0(r4)
    ps_sum0 f7, f7, f7, f7
    stfs f7, 0x10(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, 0x20(r4)
    blr
}

void func_80008094(int unused, Mtx *b);

asm void mathutil_mult_a_mtx_by_rotate_z()
{
    nofralloc

    mflr r4
    bl mathutil_sin_cos
    mtlr r4
entry func_80008094
    lis r4, 0xE0000000@ha
    ps_merge00 f0, f2, f1
    psq_l f3, 0(r4), 0, qr0
    psq_l f4, 16(r4), 0, qr0
    psq_l f5, 32(r4), 0, qr0
    ps_mul f6, f3, f0
    ps_mul f7, f4, f0
    ps_mul f8, f5, f0
    fneg f1, f1
    ps_sum0 f6, f6, f6, f6
    ps_sum0 f7, f7, f7, f7
    ps_sum0 f8, f8, f8, f8
    ps_merge00 f0, f1, f2
    stfs f6, 0xE0000000@l(r4)
    ps_mul f6, f3, f0
    stfs f7, 0x10(r4)
    ps_mul f7, f4, f0
    stfs f8, 0x20(r4)
    ps_mul f8, f5, f0
    ps_sum0 f6, f6, f6, f6
    stfs f6, 4(r4)
    ps_sum0 f7, f7, f7, f7
    stfs f7, 0x14(r4)
    ps_sum0 f8, f8, f8, f8
    stfs f8, 0x24(r4)
    blr
}

asm void mathutil_vec_normalize_clamp(Vec *a)
{
    nofralloc

    lis r5, 0xE00001A0@ha
    lfs f6, 0(r3)
    lfs f7, 4(r3)
    lfs f8, 8(r3)
    fmuls f1, f6, f6
    fmadds f1, f7, f7, f1
    fmadds f1, f8, f8, f1
    lfs f2, 0xE00001A0@l(r5)
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    bso cr1, lbl_80008160
    bso lbl_80008160
    ble cr1, lbl_80008160
    fmr f0, f1
    mflr r4
    bl func_800070B0
    mtlr r4
    fmuls f6, f6, f1
    stfs f6, 0(r3)
    fmuls f7, f7, f1
    stfs f7, 4(r3)
    fmuls f8, f8, f1
    stfs f8, 8(r3)
    fmuls f1, f1, f0
    blr
lbl_80008160:
    lfs f1, 0x198(r5)
    stfs f1, 0(r3)
    stfs f1, 4(r3)
    stfs f1, 8(r3)
    blr
}

asm void mathutil_vec_set_length(Vec *a, float length)
{
    nofralloc

    lis r6, 0xE00001A0@ha
    fmr f0, f1
    lfs f6, 0(r3)
    lfs f7, 4(r3)
    lfs f8, 8(r3)
    fmuls f1, f6, f6
    fmadds f1, f7, f7, f1
    fmadds f1, f8, f8, f1
    mcrfs cr1, 4//cr4
    mcrfs cr0, 3//cr3
    lfs f2, 0xE00001A0@l(r6)
    bso cr1, lbl_800081D8
    bso lbl_800081D8
    ble cr1, lbl_800081D8
    mflr r5
    bl func_800070B0
    mtlr r5
    fmuls f1, f1, f0
    fmuls f6, f6, f1
    stfs f6, 0(r4)
    fmuls f7, f7, f1
    stfs f7, 4(r4)
    fmuls f8, f8, f1
    stfs f8, 8(r4)
    blr
lbl_800081D8:
    lfs f6, 0x198(r6)
    stfs f6, 0(r4)
    stfs f6, 4(r4)
    stfs f6, 8(r4)
    blr
}

asm float mathutil_dot_clamp(Vec *a, Vec *b)
{
    nofralloc

    lfs f1, 0(r3)
    lfs f2, 4(r3)
    lfs f3, 8(r3)
    lfs f4, 0(r4)
    lfs f5, 4(r4)
    lfs f6, 8(r4)
    lis r6, 0xE00001A0@ha
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
    lfs f2, 0xE00001A0@l(r6)
    bso cr1, lbl_800070EC
    bso lbl_80007088
    ble cr1, lbl_80007088
    mflr r5
    bl func_800070B0
    mtlr r5
    fmuls f1, f1, f7
    blr
}

asm void mathutil_set_a_mtx_rotate_quat()
{
    nofralloc

    lis r4, 0xE000019C@ha
    lfs f0, 0(r3)
    lfs f1, 4(r3)
    lfs f5, 0xE000019C@l(r4)
    lfs f2, 8(r3)
    fsubs f4, f5, f5
    lfs f3, 0xc(r3)
    fadds f6, f5, f5
    stfs f4, 0xc(r4)
    stfs f4, 0x1c(r4)
    stfs f4, 0x2c(r4)
    fmuls f9, f0, f0
    fmuls f7, f1, f1
    fmuls f8, f2, f2
    fmadds f9, f2, f2, f9
    fmadds f7, f0, f0, f7
    fmadds f8, f1, f1, f8
    fnmsubs f9, f9, f6, f5
    stfs f9, 0x14(r4)
    fnmsubs f7, f7, f6, f5
    stfs f7, 0x28(r4)
    fnmsubs f8, f8, f6, f5
    stfs f8, 0(r4)
    fadds f6, f0, f0
    fadds f4, f1, f1
    fadds f5, f2, f2
    fmuls f6, f3, f6
    fmuls f7, f3, f4
    fmuls f8, f3, f5
    fmsubs f9, f1, f5, f6
    stfs f9, 0x18(r4)
    fmadds f10, f1, f5, f6
    stfs f10, 0x24(r4)
    fmsubs f11, f0, f5, f7
    stfs f11, 0x20(r4)
    fmadds f12, f0, f5, f7
    stfs f12, 8(r4)
    fmsubs f13, f0, f4, f8
    stfs f13, 4(r4)
    fmadds f2, f0, f4, f8
    stfs f2, 0x10(r4)
    blr
}

asm void mathutil_mult_quat(Quaternion *a, Quaternion *b, Quaternion *c)
{
    nofralloc

    lfs f4, 0(r4)
    lfs f5, 4(r4)
    lfs f6, 8(r4)
    lfs f7, 0xc(r4)
    lfs f8, 0(r5)
    lfs f9, 4(r5)
    lfs f10, 8(r5)
    lfs f11, 0xc(r5)
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
    stfs f0, 0(r3)
    stfs f1, 4(r3)
    stfs f2, 8(r3)
    stfs f3, 0xc(r3)
    blr
}

asm void func_80008378()
{
    nofralloc

    ps_merge00 f0, f0, f1
    ps_merge00 f1, f2, f3
    b lbl_8000838C
    psq_l f0, 0(r3), 0, qr0
    psq_l f1, 8(r3), 0, qr0
lbl_8000838C:
    lis r5, 0xE0000198@ha
    ps_mul f2, f0, f0
    ps_madd f2, f1, f1, f2
    ps_sum0 f2, f2, f2, f2
    lfs f4, 0xE0000198@l(r5)
    fcmpu cr0, f2, f4
    blt lbl_800083B4
    ps_merge00 f2, f2, f2
    ps_mul f0, f0, f2
    ps_mul f1, f1, f2
lbl_800083B4:
    psq_st f0, 0(r3), 0, qr0
    psq_st f1, 8(r3), 0, qr0
    blr
}

void func_800083C0(Quaternion *a)
{
    float f2 = a->x * a->x + a->y * a->y + a->z * a->z + a->w * a->w;
    if (f2 < 1.19209289551e-07f)
    {
        a->x = 0.0f;
        a->y = 0.0f;
        a->z = 0.0f;
        a->w = 1.0f;
    }
    else
    {
        float recip = 1.0f / f2;
        a->x = -a->x * recip;
        a->y = -a->y * recip;
        a->z = -a->z * recip;
        a->w =  a->w * recip;
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
