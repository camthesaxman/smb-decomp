.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __kernel_sin
__kernel_sin:
/* 801083B8 001042D8  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 801083BC 001042DC  3C 00 3E 40 */	lis r0, 0x3e40
/* 801083C0 001042E0  D8 21 00 08 */	stfd f1, 8(r1)
/* 801083C4 001042E4  80 81 00 08 */	lwz r4, 8(r1)
/* 801083C8 001042E8  54 84 00 7E */	clrlwi r4, r4, 1
/* 801083CC 001042EC  7C 04 00 00 */	cmpw r4, r0
/* 801083D0 001042F0  40 80 00 20 */	bge lbl_801083F0
/* 801083D4 001042F4  C8 21 00 08 */	lfd f1, 8(r1)
/* 801083D8 001042F8  FC 00 08 1E */	fctiwz f0, f1
/* 801083DC 001042FC  D8 01 00 20 */	stfd f0, 0x20(r1)
/* 801083E0 00104300  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801083E4 00104304  2C 00 00 00 */	cmpwi r0, 0
/* 801083E8 00104308  40 82 00 08 */	bne lbl_801083F0
/* 801083EC 0010430C  48 00 00 68 */	b lbl_80108454
lbl_801083F0:
/* 801083F0 00104310  C8 C1 00 08 */	lfd f6, 8(r1)
/* 801083F4 00104314  2C 03 00 00 */	cmpwi r3, 0
/* 801083F8 00104318  C8 A2 C3 B0 */	lfd f5, lbl_802F6BB0-_SDA2_BASE_(r2)
/* 801083FC 0010431C  FC E6 01 B2 */	fmul f7, f6, f6
/* 80108400 00104320  C8 82 C3 A8 */	lfd f4, lbl_802F6BA8-_SDA2_BASE_(r2)
/* 80108404 00104324  C8 62 C3 A0 */	lfd f3, lbl_802F6BA0-_SDA2_BASE_(r2)
/* 80108408 00104328  C8 22 C3 98 */	lfd f1, lbl_802F6B98-_SDA2_BASE_(r2)
/* 8010840C 0010432C  C8 02 C3 90 */	lfd f0, lbl_802F6B90-_SDA2_BASE_(r2)
/* 80108410 00104330  FC 85 21 FA */	fmadd f4, f5, f7, f4
/* 80108414 00104334  FC A7 01 B2 */	fmul f5, f7, f6
/* 80108418 00104338  FC 67 19 3A */	fmadd f3, f7, f4, f3
/* 8010841C 0010433C  FC 27 08 FA */	fmadd f1, f7, f3, f1
/* 80108420 00104340  FC 27 00 7A */	fmadd f1, f7, f1, f0
/* 80108424 00104344  40 82 00 14 */	bne lbl_80108438
/* 80108428 00104348  C8 02 C3 B8 */	lfd f0, lbl_802F6BB8-_SDA2_BASE_(r2)
/* 8010842C 0010434C  FC 07 00 7A */	fmadd f0, f7, f1, f0
/* 80108430 00104350  FC 25 30 3A */	fmadd f1, f5, f0, f6
/* 80108434 00104354  48 00 00 20 */	b lbl_80108454
lbl_80108438:
/* 80108438 00104358  FC 05 00 72 */	fmul f0, f5, f1
/* 8010843C 0010435C  C8 22 C3 C0 */	lfd f1, lbl_802F6BC0-_SDA2_BASE_(r2)
/* 80108440 00104360  C8 62 C3 B8 */	lfd f3, lbl_802F6BB8-_SDA2_BASE_(r2)
/* 80108444 00104364  FC 01 00 B8 */	fmsub f0, f1, f2, f0
/* 80108448 00104368  FC 07 10 38 */	fmsub f0, f7, f0, f2
/* 8010844C 0010436C  FC 03 01 7C */	fnmsub f0, f3, f5, f0
/* 80108450 00104370  FC 26 00 28 */	fsub f1, f6, f0
lbl_80108454:
/* 80108454 00104374  38 21 00 28 */	addi r1, r1, 0x28
/* 80108458 00104378  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F6B90
lbl_802F6B90:
	# ROM: 0x1F05B0
	.byte 0x3F, 0x81, 0x11, 0x11
	.byte 0x11, 0x10, 0xF8, 0xA6

.global lbl_802F6B98
lbl_802F6B98:
	# ROM: 0x1F05B8
	.byte 0xBF, 0x2A, 0x01, 0xA0
	.byte 0x19, 0xC1, 0x61, 0xD5

.global lbl_802F6BA0
lbl_802F6BA0:
	# ROM: 0x1F05C0
	.byte 0x3E, 0xC7, 0x1D, 0xE3
	.byte 0x57, 0xB1, 0xFE, 0x7D

.global lbl_802F6BA8
lbl_802F6BA8:
	# ROM: 0x1F05C8
	.byte 0xBE, 0x5A, 0xE5, 0xE6
	.byte 0x8A, 0x2B, 0x9C, 0xEB

.global lbl_802F6BB0
lbl_802F6BB0:
	# ROM: 0x1F05D0
	.byte 0x3D, 0xE5, 0xD9, 0x3A
	.byte 0x5A, 0xCF, 0xD5, 0x7C

.global lbl_802F6BB8
lbl_802F6BB8:
	# ROM: 0x1F05D8
	.byte 0xBF, 0xC5, 0x55, 0x55
	.byte 0x55, 0x55, 0x55, 0x49

.global lbl_802F6BC0
lbl_802F6BC0:
	# ROM: 0x1F05E0
	.byte 0x3F, 0xE0, 0x00, 0x00
	.4byte 0
