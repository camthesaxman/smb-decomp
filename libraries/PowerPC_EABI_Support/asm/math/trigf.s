.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global tanf
tanf:
/* 80108C9C 00104BBC  7C 08 02 A6 */	mflr r0
/* 80108CA0 00104BC0  90 01 00 04 */	stw r0, 4(r1)
/* 80108CA4 00104BC4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80108CA8 00104BC8  DB E1 00 18 */	stfd f31, 0x18(r1)
/* 80108CAC 00104BCC  DB C1 00 10 */	stfd f30, 0x10(r1)
/* 80108CB0 00104BD0  FF C0 08 90 */	fmr f30, f1
/* 80108CB4 00104BD4  48 00 00 2D */	bl cos__Ff
/* 80108CB8 00104BD8  FF E0 08 90 */	fmr f31, f1
/* 80108CBC 00104BDC  FC 20 F0 90 */	fmr f1, f30
/* 80108CC0 00104BE0  48 00 00 41 */	bl sin__Ff
/* 80108CC4 00104BE4  EC 21 F8 24 */	fdivs f1, f1, f31
/* 80108CC8 00104BE8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80108CCC 00104BEC  CB E1 00 18 */	lfd f31, 0x18(r1)
/* 80108CD0 00104BF0  CB C1 00 10 */	lfd f30, 0x10(r1)
/* 80108CD4 00104BF4  7C 08 03 A6 */	mtlr r0
/* 80108CD8 00104BF8  38 21 00 20 */	addi r1, r1, 0x20
/* 80108CDC 00104BFC  4E 80 00 20 */	blr

.global cos__Ff
cos__Ff:
/* 80108CE0 00104C00  7C 08 02 A6 */	mflr r0
/* 80108CE4 00104C04  90 01 00 04 */	stw r0, 4(r1)
/* 80108CE8 00104C08  94 21 FF F8 */	stwu r1, -8(r1)
/* 80108CEC 00104C0C  48 00 00 35 */	bl cosf
/* 80108CF0 00104C10  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80108CF4 00104C14  38 21 00 08 */	addi r1, r1, 8
/* 80108CF8 00104C18  7C 08 03 A6 */	mtlr r0
/* 80108CFC 00104C1C  4E 80 00 20 */	blr

.global sin__Ff
sin__Ff:
/* 80108D00 00104C20  7C 08 02 A6 */	mflr r0
/* 80108D04 00104C24  90 01 00 04 */	stw r0, 4(r1)
/* 80108D08 00104C28  94 21 FF F8 */	stwu r1, -8(r1)
/* 80108D0C 00104C2C  48 00 01 A9 */	bl sinf
/* 80108D10 00104C30  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80108D14 00104C34  38 21 00 08 */	addi r1, r1, 8
/* 80108D18 00104C38  7C 08 03 A6 */	mtlr r0
/* 80108D1C 00104C3C  4E 80 00 20 */	blr

.global cosf
cosf:
/* 80108D20 00104C40  7C 08 02 A6 */	mflr r0
/* 80108D24 00104C44  3C 60 80 1F */	lis r3, lbl_801ED300@ha
/* 80108D28 00104C48  90 01 00 04 */	stw r0, 4(r1)
/* 80108D2C 00104C4C  38 63 D3 00 */	addi r3, r3, lbl_801ED300@l
/* 80108D30 00104C50  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80108D34 00104C54  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 80108D38 00104C58  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80108D3C 00104C5C  D0 21 00 08 */	stfs f1, 8(r1)
/* 80108D40 00104C60  C0 02 C4 38 */	lfs f0, lbl_802F6C38-_SDA2_BASE_(r2)
/* 80108D44 00104C64  80 01 00 08 */	lwz r0, 8(r1)
/* 80108D48 00104C68  C0 C1 00 08 */	lfs f6, 8(r1)
/* 80108D4C 00104C6C  54 00 00 01 */	rlwinm. r0, r0, 0, 0, 0
/* 80108D50 00104C70  EC 20 01 B2 */	fmuls f1, f0, f6
/* 80108D54 00104C74  41 82 00 1C */	beq lbl_80108D70
/* 80108D58 00104C78  C0 02 C4 3C */	lfs f0, lbl_802F6C3C-_SDA2_BASE_(r2)
/* 80108D5C 00104C7C  EC 01 00 28 */	fsubs f0, f1, f0
/* 80108D60 00104C80  FC 00 00 1E */	fctiwz f0, f0
/* 80108D64 00104C84  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 80108D68 00104C88  80 81 00 14 */	lwz r4, 0x14(r1)
/* 80108D6C 00104C8C  48 00 00 18 */	b lbl_80108D84
lbl_80108D70:
/* 80108D70 00104C90  C0 02 C4 3C */	lfs f0, lbl_802F6C3C-_SDA2_BASE_(r2)
/* 80108D74 00104C94  EC 00 08 2A */	fadds f0, f0, f1
/* 80108D78 00104C98  FC 00 00 1E */	fctiwz f0, f0
/* 80108D7C 00104C9C  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 80108D80 00104CA0  80 81 00 14 */	lwz r4, 0x14(r1)
lbl_80108D84:
/* 80108D84 00104CA4  54 80 08 3C */	slwi r0, r4, 1
/* 80108D88 00104CA8  C8 22 C4 48 */	lfd f1, lbl_802F6C48-_SDA2_BASE_(r2)
/* 80108D8C 00104CAC  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80108D90 00104CB0  C0 43 00 00 */	lfs f2, 0(r3)
/* 80108D94 00104CB4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80108D98 00104CB8  3C 00 43 30 */	lis r0, 0x4330
/* 80108D9C 00104CBC  C0 63 00 04 */	lfs f3, 4(r3)
/* 80108DA0 00104CC0  54 9F 07 BE */	clrlwi r31, r4, 0x1e
/* 80108DA4 00104CC4  90 01 00 10 */	stw r0, 0x10(r1)
/* 80108DA8 00104CC8  C0 83 00 08 */	lfs f4, 8(r3)
/* 80108DAC 00104CCC  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 80108DB0 00104CD0  C0 A3 00 0C */	lfs f5, 0xc(r3)
/* 80108DB4 00104CD4  EC 00 08 28 */	fsubs f0, f0, f1
/* 80108DB8 00104CD8  EC 06 00 28 */	fsubs f0, f6, f0
/* 80108DBC 00104CDC  EC 02 01 BA */	fmadds f0, f2, f6, f0
/* 80108DC0 00104CE0  EC 03 01 BA */	fmadds f0, f3, f6, f0
/* 80108DC4 00104CE4  EC 04 01 BA */	fmadds f0, f4, f6, f0
/* 80108DC8 00104CE8  EF E5 01 BA */	fmadds f31, f5, f6, f0
/* 80108DCC 00104CEC  FC 20 F8 90 */	fmr f1, f31
/* 80108DD0 00104CF0  4B FF FB FD */	bl fabsf__Ff
/* 80108DD4 00104CF4  C0 02 C4 40 */	lfs f0, lbl_802F6C40-_SDA2_BASE_(r2)
/* 80108DD8 00104CF8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80108DDC 00104CFC  40 80 00 24 */	bge lbl_80108E00
/* 80108DE0 00104D00  3C 60 80 1F */	lis r3, __sincos_on_quadrant@ha
/* 80108DE4 00104D04  57 E4 18 38 */	slwi r4, r31, 3
/* 80108DE8 00104D08  38 03 D5 14 */	addi r0, r3, __sincos_on_quadrant@l
/* 80108DEC 00104D0C  7C 60 22 14 */	add r3, r0, r4
/* 80108DF0 00104D10  C0 23 00 00 */	lfs f1, 0(r3)
/* 80108DF4 00104D14  C0 03 00 04 */	lfs f0, 4(r3)
/* 80108DF8 00104D18  EC 3F 00 7C */	fnmsubs f1, f31, f1, f0
/* 80108DFC 00104D1C  48 00 00 A0 */	b lbl_80108E9C
lbl_80108E00:
/* 80108E00 00104D20  57 E0 07 FF */	clrlwi. r0, r31, 0x1f
/* 80108E04 00104D24  EC 9F 07 F2 */	fmuls f4, f31, f31
/* 80108E08 00104D28  41 82 00 50 */	beq lbl_80108E58
/* 80108E0C 00104D2C  3C 60 80 1F */	lis r3, __sincos_poly@ha
/* 80108E10 00104D30  38 83 D5 34 */	addi r4, r3, __sincos_poly@l
/* 80108E14 00104D34  C0 44 00 04 */	lfs f2, 4(r4)
/* 80108E18 00104D38  3C 60 80 1F */	lis r3, __sincos_on_quadrant@ha
/* 80108E1C 00104D3C  C0 24 00 0C */	lfs f1, 0xc(r4)
/* 80108E20 00104D40  38 03 D5 14 */	addi r0, r3, __sincos_on_quadrant@l
/* 80108E24 00104D44  C0 04 00 14 */	lfs f0, 0x14(r4)
/* 80108E28 00104D48  EC 62 09 3A */	fmadds f3, f2, f4, f1
/* 80108E2C 00104D4C  C0 44 00 1C */	lfs f2, 0x1c(r4)
/* 80108E30 00104D50  C0 24 00 24 */	lfs f1, 0x24(r4)
/* 80108E34 00104D54  57 E4 18 38 */	slwi r4, r31, 3
/* 80108E38 00104D58  7C 60 22 14 */	add r3, r0, r4
/* 80108E3C 00104D5C  EC 64 00 FA */	fmadds f3, f4, f3, f0
/* 80108E40 00104D60  C0 03 00 00 */	lfs f0, 0(r3)
/* 80108E44 00104D64  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 80108E48 00104D68  EC 24 08 BE */	fnmadds f1, f4, f2, f1
/* 80108E4C 00104D6C  EC 3F 00 72 */	fmuls f1, f31, f1
/* 80108E50 00104D70  EC 21 00 32 */	fmuls f1, f1, f0
/* 80108E54 00104D74  48 00 00 48 */	b lbl_80108E9C
lbl_80108E58:
/* 80108E58 00104D78  3C 60 80 1F */	lis r3, __sincos_poly@ha
/* 80108E5C 00104D7C  38 83 D5 34 */	addi r4, r3, __sincos_poly@l
/* 80108E60 00104D80  C0 44 00 00 */	lfs f2, 0(r4)
/* 80108E64 00104D84  3C 60 80 1F */	lis r3, __sincos_on_quadrant@ha
/* 80108E68 00104D88  C0 24 00 08 */	lfs f1, 8(r4)
/* 80108E6C 00104D8C  38 63 D5 14 */	addi r3, r3, __sincos_on_quadrant@l
/* 80108E70 00104D90  57 E0 18 38 */	slwi r0, r31, 3
/* 80108E74 00104D94  EC 62 09 3A */	fmadds f3, f2, f4, f1
/* 80108E78 00104D98  C0 04 00 10 */	lfs f0, 0x10(r4)
/* 80108E7C 00104D9C  C0 44 00 18 */	lfs f2, 0x18(r4)
/* 80108E80 00104DA0  7C 63 02 14 */	add r3, r3, r0
/* 80108E84 00104DA4  C0 24 00 20 */	lfs f1, 0x20(r4)
/* 80108E88 00104DA8  EC 64 00 FA */	fmadds f3, f4, f3, f0
/* 80108E8C 00104DAC  C0 03 00 04 */	lfs f0, 4(r3)
/* 80108E90 00104DB0  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 80108E94 00104DB4  EC 24 08 BA */	fmadds f1, f4, f2, f1
/* 80108E98 00104DB8  EC 21 00 32 */	fmuls f1, f1, f0
lbl_80108E9C:
/* 80108E9C 00104DBC  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80108EA0 00104DC0  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 80108EA4 00104DC4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80108EA8 00104DC8  7C 08 03 A6 */	mtlr r0
/* 80108EAC 00104DCC  38 21 00 28 */	addi r1, r1, 0x28
/* 80108EB0 00104DD0  4E 80 00 20 */	blr

.global sinf
sinf:
/* 80108EB4 00104DD4  7C 08 02 A6 */	mflr r0
/* 80108EB8 00104DD8  3C 60 80 1F */	lis r3, lbl_801ED300@ha
/* 80108EBC 00104DDC  90 01 00 04 */	stw r0, 4(r1)
/* 80108EC0 00104DE0  38 63 D3 00 */	addi r3, r3, lbl_801ED300@l
/* 80108EC4 00104DE4  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80108EC8 00104DE8  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 80108ECC 00104DEC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80108ED0 00104DF0  D0 21 00 08 */	stfs f1, 8(r1)
/* 80108ED4 00104DF4  C0 02 C4 38 */	lfs f0, lbl_802F6C38-_SDA2_BASE_(r2)
/* 80108ED8 00104DF8  80 01 00 08 */	lwz r0, 8(r1)
/* 80108EDC 00104DFC  C0 C1 00 08 */	lfs f6, 8(r1)
/* 80108EE0 00104E00  54 00 00 01 */	rlwinm. r0, r0, 0, 0, 0
/* 80108EE4 00104E04  EC 20 01 B2 */	fmuls f1, f0, f6
/* 80108EE8 00104E08  41 82 00 1C */	beq lbl_80108F04
/* 80108EEC 00104E0C  C0 02 C4 3C */	lfs f0, lbl_802F6C3C-_SDA2_BASE_(r2)
/* 80108EF0 00104E10  EC 01 00 28 */	fsubs f0, f1, f0
/* 80108EF4 00104E14  FC 00 00 1E */	fctiwz f0, f0
/* 80108EF8 00104E18  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 80108EFC 00104E1C  80 81 00 14 */	lwz r4, 0x14(r1)
/* 80108F00 00104E20  48 00 00 18 */	b lbl_80108F18
lbl_80108F04:
/* 80108F04 00104E24  C0 02 C4 3C */	lfs f0, lbl_802F6C3C-_SDA2_BASE_(r2)
/* 80108F08 00104E28  EC 00 08 2A */	fadds f0, f0, f1
/* 80108F0C 00104E2C  FC 00 00 1E */	fctiwz f0, f0
/* 80108F10 00104E30  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 80108F14 00104E34  80 81 00 14 */	lwz r4, 0x14(r1)
lbl_80108F18:
/* 80108F18 00104E38  54 80 08 3C */	slwi r0, r4, 1
/* 80108F1C 00104E3C  C8 22 C4 48 */	lfd f1, lbl_802F6C48-_SDA2_BASE_(r2)
/* 80108F20 00104E40  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80108F24 00104E44  C0 43 00 00 */	lfs f2, 0(r3)
/* 80108F28 00104E48  90 01 00 14 */	stw r0, 0x14(r1)
/* 80108F2C 00104E4C  3C 00 43 30 */	lis r0, 0x4330
/* 80108F30 00104E50  C0 63 00 04 */	lfs f3, 4(r3)
/* 80108F34 00104E54  54 9F 07 BE */	clrlwi r31, r4, 0x1e
/* 80108F38 00104E58  90 01 00 10 */	stw r0, 0x10(r1)
/* 80108F3C 00104E5C  C0 83 00 08 */	lfs f4, 8(r3)
/* 80108F40 00104E60  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 80108F44 00104E64  C0 A3 00 0C */	lfs f5, 0xc(r3)
/* 80108F48 00104E68  EC 00 08 28 */	fsubs f0, f0, f1
/* 80108F4C 00104E6C  EC 06 00 28 */	fsubs f0, f6, f0
/* 80108F50 00104E70  EC 02 01 BA */	fmadds f0, f2, f6, f0
/* 80108F54 00104E74  EC 03 01 BA */	fmadds f0, f3, f6, f0
/* 80108F58 00104E78  EC 04 01 BA */	fmadds f0, f4, f6, f0
/* 80108F5C 00104E7C  EF E5 01 BA */	fmadds f31, f5, f6, f0
/* 80108F60 00104E80  FC 20 F8 90 */	fmr f1, f31
/* 80108F64 00104E84  4B FF FA 69 */	bl fabsf__Ff
/* 80108F68 00104E88  C0 02 C4 40 */	lfs f0, lbl_802F6C40-_SDA2_BASE_(r2)
/* 80108F6C 00104E8C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80108F70 00104E90  40 80 00 34 */	bge lbl_80108FA4
/* 80108F74 00104E94  3C 60 80 1F */	lis r3, __sincos_on_quadrant@ha
/* 80108F78 00104E98  57 E4 18 38 */	slwi r4, r31, 3
/* 80108F7C 00104E9C  38 03 D5 14 */	addi r0, r3, __sincos_on_quadrant@l
/* 80108F80 00104EA0  7C 60 22 14 */	add r3, r0, r4
/* 80108F84 00104EA4  C0 23 00 04 */	lfs f1, 4(r3)
/* 80108F88 00104EA8  3C 80 80 1F */	lis r4, __sincos_poly@ha
/* 80108F8C 00104EAC  38 84 D5 34 */	addi r4, r4, __sincos_poly@l
/* 80108F90 00104EB0  C0 03 00 00 */	lfs f0, 0(r3)
/* 80108F94 00104EB4  EC 3F 00 72 */	fmuls f1, f31, f1
/* 80108F98 00104EB8  C0 44 00 24 */	lfs f2, 0x24(r4)
/* 80108F9C 00104EBC  EC 22 00 7A */	fmadds f1, f2, f1, f0
/* 80108FA0 00104EC0  48 00 00 A0 */	b lbl_80109040
lbl_80108FA4:
/* 80108FA4 00104EC4  57 E0 07 FF */	clrlwi. r0, r31, 0x1f
/* 80108FA8 00104EC8  EC 9F 07 F2 */	fmuls f4, f31, f31
/* 80108FAC 00104ECC  41 82 00 4C */	beq lbl_80108FF8
/* 80108FB0 00104ED0  3C 60 80 1F */	lis r3, __sincos_poly@ha
/* 80108FB4 00104ED4  38 83 D5 34 */	addi r4, r3, __sincos_poly@l
/* 80108FB8 00104ED8  C0 44 00 00 */	lfs f2, 0(r4)
/* 80108FBC 00104EDC  3C 60 80 1F */	lis r3, __sincos_on_quadrant@ha
/* 80108FC0 00104EE0  C0 24 00 08 */	lfs f1, 8(r4)
/* 80108FC4 00104EE4  38 03 D5 14 */	addi r0, r3, __sincos_on_quadrant@l
/* 80108FC8 00104EE8  C0 04 00 10 */	lfs f0, 0x10(r4)
/* 80108FCC 00104EEC  EC 62 09 3A */	fmadds f3, f2, f4, f1
/* 80108FD0 00104EF0  C0 44 00 18 */	lfs f2, 0x18(r4)
/* 80108FD4 00104EF4  C0 24 00 20 */	lfs f1, 0x20(r4)
/* 80108FD8 00104EF8  57 E4 18 38 */	slwi r4, r31, 3
/* 80108FDC 00104EFC  7C 60 22 14 */	add r3, r0, r4
/* 80108FE0 00104F00  EC 64 00 FA */	fmadds f3, f4, f3, f0
/* 80108FE4 00104F04  C0 03 00 00 */	lfs f0, 0(r3)
/* 80108FE8 00104F08  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 80108FEC 00104F0C  EC 24 08 BA */	fmadds f1, f4, f2, f1
/* 80108FF0 00104F10  EC 21 00 32 */	fmuls f1, f1, f0
/* 80108FF4 00104F14  48 00 00 4C */	b lbl_80109040
lbl_80108FF8:
/* 80108FF8 00104F18  3C 60 80 1F */	lis r3, __sincos_poly@ha
/* 80108FFC 00104F1C  38 83 D5 34 */	addi r4, r3, __sincos_poly@l
/* 80109000 00104F20  C0 44 00 04 */	lfs f2, 4(r4)
/* 80109004 00104F24  3C 60 80 1F */	lis r3, __sincos_on_quadrant@ha
/* 80109008 00104F28  C0 24 00 0C */	lfs f1, 0xc(r4)
/* 8010900C 00104F2C  38 63 D5 14 */	addi r3, r3, __sincos_on_quadrant@l
/* 80109010 00104F30  57 E0 18 38 */	slwi r0, r31, 3
/* 80109014 00104F34  EC 62 09 3A */	fmadds f3, f2, f4, f1
/* 80109018 00104F38  C0 04 00 14 */	lfs f0, 0x14(r4)
/* 8010901C 00104F3C  C0 44 00 1C */	lfs f2, 0x1c(r4)
/* 80109020 00104F40  7C 63 02 14 */	add r3, r3, r0
/* 80109024 00104F44  C0 24 00 24 */	lfs f1, 0x24(r4)
/* 80109028 00104F48  EC 64 00 FA */	fmadds f3, f4, f3, f0
/* 8010902C 00104F4C  C0 03 00 04 */	lfs f0, 4(r3)
/* 80109030 00104F50  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 80109034 00104F54  EC 24 08 BA */	fmadds f1, f4, f2, f1
/* 80109038 00104F58  EC 3F 00 72 */	fmuls f1, f31, f1
/* 8010903C 00104F5C  EC 21 00 32 */	fmuls f1, f1, f0
lbl_80109040:
/* 80109040 00104F60  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80109044 00104F64  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 80109048 00104F68  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8010904C 00104F6C  7C 08 03 A6 */	mtlr r0
/* 80109050 00104F70  38 21 00 28 */	addi r1, r1, 0x28
/* 80109054 00104F74  4E 80 00 20 */	blr

.global __sinit_trigf_c
__sinit_trigf_c:
/* 80109058 00104F78  3C 60 80 17 */	lis r3, lbl_80172300@ha
/* 8010905C 00104F7C  38 83 23 00 */	addi r4, r3, lbl_80172300@l
/* 80109060 00104F80  C0 04 00 00 */	lfs f0, 0(r4)
/* 80109064 00104F84  3C 60 80 1F */	lis r3, lbl_801ED300@ha
/* 80109068 00104F88  D4 03 D3 00 */	stfsu f0, lbl_801ED300@l(r3)
/* 8010906C 00104F8C  C0 04 00 04 */	lfs f0, 4(r4)
/* 80109070 00104F90  D0 03 00 04 */	stfs f0, 4(r3)
/* 80109074 00104F94  C0 04 00 08 */	lfs f0, 8(r4)
/* 80109078 00104F98  D0 03 00 08 */	stfs f0, 8(r3)
/* 8010907C 00104F9C  C0 04 00 0C */	lfs f0, 0xc(r4)
/* 80109080 00104FA0  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 80109084 00104FA4  4E 80 00 20 */	blr

glabel sqrt
/* 80109088 00104FA8  C8 02 C4 50 */	lfd f0, lbl_802F6C50-_SDA2_BASE_(r2)
/* 8010908C 00104FAC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80109090 00104FB0  40 81 00 58 */	ble lbl_801090E8
/* 80109094 00104FB4  FC 40 08 34 */	frsqrte f2, f1
/* 80109098 00104FB8  C8 82 C4 58 */	lfd f4, lbl_802F6C58-_SDA2_BASE_(r2)
/* 8010909C 00104FBC  C8 62 C4 60 */	lfd f3, lbl_802F6C60-_SDA2_BASE_(r2)
/* 801090A0 00104FC0  FC 02 00 B2 */	fmul f0, f2, f2
/* 801090A4 00104FC4  FC 44 00 B2 */	fmul f2, f4, f2
/* 801090A8 00104FC8  FC 01 18 3C */	fnmsub f0, f1, f0, f3
/* 801090AC 00104FCC  FC 42 00 32 */	fmul f2, f2, f0
/* 801090B0 00104FD0  FC 02 00 B2 */	fmul f0, f2, f2
/* 801090B4 00104FD4  FC 44 00 B2 */	fmul f2, f4, f2
/* 801090B8 00104FD8  FC 01 18 3C */	fnmsub f0, f1, f0, f3
/* 801090BC 00104FDC  FC 42 00 32 */	fmul f2, f2, f0
/* 801090C0 00104FE0  FC 02 00 B2 */	fmul f0, f2, f2
/* 801090C4 00104FE4  FC 44 00 B2 */	fmul f2, f4, f2
/* 801090C8 00104FE8  FC 01 18 3C */	fnmsub f0, f1, f0, f3
/* 801090CC 00104FEC  FC 42 00 32 */	fmul f2, f2, f0
/* 801090D0 00104FF0  FC 02 00 B2 */	fmul f0, f2, f2
/* 801090D4 00104FF4  FC 44 00 B2 */	fmul f2, f4, f2
/* 801090D8 00104FF8  FC 01 18 3C */	fnmsub f0, f1, f0, f3
/* 801090DC 00104FFC  FC 02 00 32 */	fmul f0, f2, f0
/* 801090E0 00105000  FC 21 00 32 */	fmul f1, f1, f0
/* 801090E4 00105004  4E 80 00 20 */	blr
lbl_801090E8:
/* 801090E8 00105008  FC 00 08 00 */	fcmpu cr0, f0, f1
/* 801090EC 0010500C  40 82 00 0C */	bne lbl_801090F8
/* 801090F0 00105010  FC 20 00 90 */	fmr f1, f0
/* 801090F4 00105014  4E 80 00 20 */	blr
lbl_801090F8:
/* 801090F8 00105018  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 801090FC 0010501C  41 82 00 10 */	beq lbl_8010910C
/* 80109100 00105020  3C 60 80 1F */	lis r3, __float_nan@ha
/* 80109104 00105024  C0 23 D2 F8 */	lfs f1, __float_nan@l(r3)
/* 80109108 00105028  4E 80 00 20 */	blr
lbl_8010910C:
/* 8010910C 0010502C  3C 60 80 1F */	lis r3, __float_huge@ha
/* 80109110 00105030  C0 23 D2 FC */	lfs f1, __float_huge@l(r3)
/* 80109114 00105034  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F6C38
lbl_802F6C38:
	# ROM: 0x1F0658
	.byte 0x3F, 0x22, 0xF9, 0x83

.global lbl_802F6C3C
lbl_802F6C3C:
	# ROM: 0x1F065C
	.byte 0x3F, 0x00, 0x00, 0x00

.global lbl_802F6C40
lbl_802F6C40:
	# ROM: 0x1F0660
	.byte 0x39, 0xB5, 0x04, 0xF3
	.4byte 0

.global lbl_802F6C48
lbl_802F6C48:
	# ROM: 0x1F0668
	.byte 0x43, 0x30, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00

.global lbl_802F6C50
lbl_802F6C50:
	# ROM: 0x1F0670
	.4byte 0
	.4byte 0

.global lbl_802F6C58
lbl_802F6C58:
	# ROM: 0x1F0678
	.byte 0x3F, 0xE0, 0x00, 0x00
	.4byte 0

.global lbl_802F6C60
lbl_802F6C60:
	# ROM: 0x1F0680
	.byte 0x40, 0x08, 0x00, 0x00
	.4byte 0

.section .rodata

.global lbl_80172300
lbl_80172300:
	# ROM: 0x16F300
	.byte 0x3E, 0x80, 0x00, 0x00
	.byte 0x3C, 0xBE, 0x60, 0x80
	.byte 0x34, 0x37, 0x22, 0x00
	.byte 0x2D, 0xA4, 0x41, 0x52

.section .data

.global lbl_801ED300
lbl_801ED300:
	# ROM: 0x1EA300
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
