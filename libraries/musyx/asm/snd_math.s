.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global salApplyMatrix
salApplyMatrix:
/* 800FD6B4 000F95D4  C0 63 00 00 */	lfs f3, 0(r3)
/* 800FD6B8 000F95D8  C0 44 00 00 */	lfs f2, 0(r4)
/* 800FD6BC 000F95DC  C0 23 00 04 */	lfs f1, 4(r3)
/* 800FD6C0 000F95E0  C0 04 00 04 */	lfs f0, 4(r4)
/* 800FD6C4 000F95E4  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800FD6C8 000F95E8  C0 63 00 08 */	lfs f3, 8(r3)
/* 800FD6CC 000F95EC  EC 01 00 32 */	fmuls f0, f1, f0
/* 800FD6D0 000F95F0  C0 24 00 08 */	lfs f1, 8(r4)
/* 800FD6D4 000F95F4  C0 83 00 24 */	lfs f4, 0x24(r3)
/* 800FD6D8 000F95F8  EC 23 00 72 */	fmuls f1, f3, f1
/* 800FD6DC 000F95FC  EC 02 00 2A */	fadds f0, f2, f0
/* 800FD6E0 000F9600  EC 01 00 2A */	fadds f0, f1, f0
/* 800FD6E4 000F9604  EC 04 00 2A */	fadds f0, f4, f0
/* 800FD6E8 000F9608  D0 05 00 00 */	stfs f0, 0(r5)
/* 800FD6EC 000F960C  C0 63 00 0C */	lfs f3, 0xc(r3)
/* 800FD6F0 000F9610  C0 44 00 00 */	lfs f2, 0(r4)
/* 800FD6F4 000F9614  C0 23 00 10 */	lfs f1, 0x10(r3)
/* 800FD6F8 000F9618  C0 04 00 04 */	lfs f0, 4(r4)
/* 800FD6FC 000F961C  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800FD700 000F9620  C0 63 00 14 */	lfs f3, 0x14(r3)
/* 800FD704 000F9624  EC 01 00 32 */	fmuls f0, f1, f0
/* 800FD708 000F9628  C0 24 00 08 */	lfs f1, 8(r4)
/* 800FD70C 000F962C  C0 83 00 28 */	lfs f4, 0x28(r3)
/* 800FD710 000F9630  EC 23 00 72 */	fmuls f1, f3, f1
/* 800FD714 000F9634  EC 02 00 2A */	fadds f0, f2, f0
/* 800FD718 000F9638  EC 01 00 2A */	fadds f0, f1, f0
/* 800FD71C 000F963C  EC 04 00 2A */	fadds f0, f4, f0
/* 800FD720 000F9640  D0 05 00 04 */	stfs f0, 4(r5)
/* 800FD724 000F9644  C0 63 00 18 */	lfs f3, 0x18(r3)
/* 800FD728 000F9648  C0 44 00 00 */	lfs f2, 0(r4)
/* 800FD72C 000F964C  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 800FD730 000F9650  C0 04 00 04 */	lfs f0, 4(r4)
/* 800FD734 000F9654  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800FD738 000F9658  C0 63 00 20 */	lfs f3, 0x20(r3)
/* 800FD73C 000F965C  EC 01 00 32 */	fmuls f0, f1, f0
/* 800FD740 000F9660  C0 24 00 08 */	lfs f1, 8(r4)
/* 800FD744 000F9664  C0 83 00 2C */	lfs f4, 0x2c(r3)
/* 800FD748 000F9668  EC 23 00 72 */	fmuls f1, f3, f1
/* 800FD74C 000F966C  EC 02 00 2A */	fadds f0, f2, f0
/* 800FD750 000F9670  EC 01 00 2A */	fadds f0, f1, f0
/* 800FD754 000F9674  EC 04 00 2A */	fadds f0, f4, f0
/* 800FD758 000F9678  D0 05 00 08 */	stfs f0, 8(r5)
/* 800FD75C 000F967C  4E 80 00 20 */	blr

.global salNormalizeVector
salNormalizeVector:
/* 800FD760 000F9680  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800FD764 000F9684  C0 23 00 00 */	lfs f1, 0(r3)
/* 800FD768 000F9688  C0 03 00 04 */	lfs f0, 4(r3)
/* 800FD76C 000F968C  EC 41 00 72 */	fmuls f2, f1, f1
/* 800FD770 000F9690  C0 63 00 08 */	lfs f3, 8(r3)
/* 800FD774 000F9694  EC 20 00 32 */	fmuls f1, f0, f0
/* 800FD778 000F9698  C0 02 C2 08 */	lfs f0, lbl_802F6A08@sda21(r2)
/* 800FD77C 000F969C  EC 63 00 F2 */	fmuls f3, f3, f3
/* 800FD780 000F96A0  EC 22 08 2A */	fadds f1, f2, f1
/* 800FD784 000F96A4  EC 23 08 2A */	fadds f1, f3, f1
/* 800FD788 000F96A8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800FD78C 000F96AC  40 81 00 5C */	ble lbl_800FD7E8
/* 800FD790 000F96B0  FC 40 08 34 */	frsqrte f2, f1
/* 800FD794 000F96B4  C8 82 C2 10 */	lfd f4, lbl_802F6A10@sda21(r2)
/* 800FD798 000F96B8  C8 62 C2 18 */	lfd f3, lbl_802F6A18@sda21(r2)
/* 800FD79C 000F96BC  FC 02 00 B2 */	fmul f0, f2, f2
/* 800FD7A0 000F96C0  FC 44 00 B2 */	fmul f2, f4, f2
/* 800FD7A4 000F96C4  FC 01 00 32 */	fmul f0, f1, f0
/* 800FD7A8 000F96C8  FC 03 00 28 */	fsub f0, f3, f0
/* 800FD7AC 000F96CC  FC 42 00 32 */	fmul f2, f2, f0
/* 800FD7B0 000F96D0  FC 02 00 B2 */	fmul f0, f2, f2
/* 800FD7B4 000F96D4  FC 44 00 B2 */	fmul f2, f4, f2
/* 800FD7B8 000F96D8  FC 01 00 32 */	fmul f0, f1, f0
/* 800FD7BC 000F96DC  FC 03 00 28 */	fsub f0, f3, f0
/* 800FD7C0 000F96E0  FC 42 00 32 */	fmul f2, f2, f0
/* 800FD7C4 000F96E4  FC 02 00 B2 */	fmul f0, f2, f2
/* 800FD7C8 000F96E8  FC 44 00 B2 */	fmul f2, f4, f2
/* 800FD7CC 000F96EC  FC 01 00 32 */	fmul f0, f1, f0
/* 800FD7D0 000F96F0  FC 03 00 28 */	fsub f0, f3, f0
/* 800FD7D4 000F96F4  FC 02 00 32 */	fmul f0, f2, f0
/* 800FD7D8 000F96F8  FC 01 00 32 */	fmul f0, f1, f0
/* 800FD7DC 000F96FC  FC 00 00 18 */	frsp f0, f0
/* 800FD7E0 000F9700  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 800FD7E4 000F9704  C0 21 00 0C */	lfs f1, 0xc(r1)
lbl_800FD7E8:
/* 800FD7E8 000F9708  C0 03 00 00 */	lfs f0, 0(r3)
/* 800FD7EC 000F970C  38 21 00 18 */	addi r1, r1, 0x18
/* 800FD7F0 000F9710  EC 00 08 24 */	fdivs f0, f0, f1
/* 800FD7F4 000F9714  D0 03 00 00 */	stfs f0, 0(r3)
/* 800FD7F8 000F9718  C0 03 00 04 */	lfs f0, 4(r3)
/* 800FD7FC 000F971C  EC 00 08 24 */	fdivs f0, f0, f1
/* 800FD800 000F9720  D0 03 00 04 */	stfs f0, 4(r3)
/* 800FD804 000F9724  C0 03 00 08 */	lfs f0, 8(r3)
/* 800FD808 000F9728  EC 00 08 24 */	fdivs f0, f0, f1
/* 800FD80C 000F972C  D0 03 00 08 */	stfs f0, 8(r3)
/* 800FD810 000F9730  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F6A08
lbl_802F6A08:
	# ROM: 0x1F0428
	.4byte 0
	.4byte 0

.global lbl_802F6A10
lbl_802F6A10:
	# ROM: 0x1F0430
	.byte 0x3F, 0xE0, 0x00, 0x00
	.4byte 0

.global lbl_802F6A18
lbl_802F6A18:
	# ROM: 0x1F0438
	.byte 0x40, 0x08, 0x00, 0x00
	.4byte 0
