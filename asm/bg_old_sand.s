.include "macros.inc"

.section .text

.global bg_old_sand_init
bg_old_sand_init:
/* 80059770 00055690  7C 08 02 A6 */	mflr r0
/* 80059774 00055694  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 80059778 00055698  90 01 00 04 */	stw r0, 4(r1)
/* 8005977C 0005569C  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80059780 000556A0  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80059784 000556A4  93 C1 00 20 */	stw r30, 0x20(r1)
/* 80059788 000556A8  3B C3 91 78 */	addi r30, r3, backgroundInfo@l
/* 8005978C 000556AC  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 80059790 000556B0  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80059794 000556B4  90 1E 00 80 */	stw r0, 0x80(r30)
/* 80059798 000556B8  C0 02 98 38 */	lfs f0, lbl_802F4038@sda21(r2)
/* 8005979C 000556BC  D0 1E 00 84 */	stfs f0, 0x84(r30)
/* 800597A0 000556C0  48 0A D0 C5 */	bl rand
/* 800597A4 000556C4  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 800597A8 000556C8  C8 82 98 78 */	lfd f4, lbl_802F4078@sda21(r2)
/* 800597AC 000556CC  90 01 00 1C */	stw r0, 0x1c(r1)
/* 800597B0 000556D0  3F E0 43 30 */	lis r31, 0x4330
/* 800597B4 000556D4  C0 62 98 4C */	lfs f3, lbl_802F404C@sda21(r2)
/* 800597B8 000556D8  93 E1 00 18 */	stw r31, 0x18(r1)
/* 800597BC 000556DC  C0 42 98 48 */	lfs f2, lbl_802F4048@sda21(r2)
/* 800597C0 000556E0  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 800597C4 000556E4  C8 22 98 50 */	lfd f1, lbl_802F4050@sda21(r2)
/* 800597C8 000556E8  EC 80 20 28 */	fsubs f4, f0, f4
/* 800597CC 000556EC  C8 02 98 40 */	lfd f0, lbl_802F4040@sda21(r2)
/* 800597D0 000556F0  EC 64 18 24 */	fdivs f3, f4, f3
/* 800597D4 000556F4  EC 42 00 F2 */	fmuls f2, f2, f3
/* 800597D8 000556F8  FC 22 08 24 */	fdiv f1, f2, f1
/* 800597DC 000556FC  FC 00 08 2A */	fadd f0, f0, f1
/* 800597E0 00055700  FC 00 00 18 */	frsp f0, f0
/* 800597E4 00055704  D0 1E 00 38 */	stfs f0, 0x38(r30)
/* 800597E8 00055708  48 0A D0 7D */	bl rand
/* 800597EC 0005570C  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 800597F0 00055710  C8 82 98 78 */	lfd f4, lbl_802F4078@sda21(r2)
/* 800597F4 00055714  90 01 00 14 */	stw r0, 0x14(r1)
/* 800597F8 00055718  C0 42 98 4C */	lfs f2, lbl_802F404C@sda21(r2)
/* 800597FC 0005571C  93 E1 00 10 */	stw r31, 0x10(r1)
/* 80059800 00055720  C8 22 98 60 */	lfd f1, lbl_802F4060@sda21(r2)
/* 80059804 00055724  C8 61 00 10 */	lfd f3, 0x10(r1)
/* 80059808 00055728  C8 02 98 58 */	lfd f0, lbl_802F4058@sda21(r2)
/* 8005980C 0005572C  EC 63 20 28 */	fsubs f3, f3, f4
/* 80059810 00055730  EC 43 10 24 */	fdivs f2, f3, f2
/* 80059814 00055734  FC 21 00 B2 */	fmul f1, f1, f2
/* 80059818 00055738  FC 00 08 2A */	fadd f0, f0, f1
/* 8005981C 0005573C  FC 00 00 18 */	frsp f0, f0
/* 80059820 00055740  D0 1E 00 3C */	stfs f0, 0x3c(r30)
/* 80059824 00055744  48 0A D0 41 */	bl rand
/* 80059828 00055748  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 8005982C 0005574C  C8 82 98 78 */	lfd f4, lbl_802F4078@sda21(r2)
/* 80059830 00055750  90 01 00 0C */	stw r0, 0xc(r1)
/* 80059834 00055754  C0 42 98 4C */	lfs f2, lbl_802F404C@sda21(r2)
/* 80059838 00055758  93 E1 00 08 */	stw r31, 8(r1)
/* 8005983C 0005575C  C8 22 98 70 */	lfd f1, lbl_802F4070@sda21(r2)
/* 80059840 00055760  C8 61 00 08 */	lfd f3, 8(r1)
/* 80059844 00055764  C8 02 98 68 */	lfd f0, lbl_802F4068@sda21(r2)
/* 80059848 00055768  EC 63 20 28 */	fsubs f3, f3, f4
/* 8005984C 0005576C  EC 43 10 24 */	fdivs f2, f3, f2
/* 80059850 00055770  FC 21 00 B2 */	fmul f1, f1, f2
/* 80059854 00055774  FC 00 08 2A */	fadd f0, f0, f1
/* 80059858 00055778  FC 00 00 18 */	frsp f0, f0
/* 8005985C 0005577C  D0 1E 00 40 */	stfs f0, 0x40(r30)
/* 80059860 00055780  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80059864 00055784  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 80059868 00055788  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 8005986C 0005578C  38 21 00 28 */	addi r1, r1, 0x28
/* 80059870 00055790  7C 08 03 A6 */	mtlr r0
/* 80059874 00055794  4E 80 00 20 */	blr
.global bg_old_sand_main
bg_old_sand_main:
/* 80059878 00055798  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 8005987C 0005579C  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 80059880 000557A0  38 83 00 2C */	addi r4, r3, 0x2c
/* 80059884 000557A4  C0 03 00 38 */	lfs f0, 0x38(r3)
/* 80059888 000557A8  C0 23 00 2C */	lfs f1, 0x2c(r3)
/* 8005988C 000557AC  EC 01 00 2A */	fadds f0, f1, f0
/* 80059890 000557B0  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 80059894 000557B4  C0 23 00 2C */	lfs f1, 0x2c(r3)
/* 80059898 000557B8  C0 02 98 48 */	lfs f0, lbl_802F4048@sda21(r2)
/* 8005989C 000557BC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800598A0 000557C0  40 81 00 0C */	ble lbl_800598AC
/* 800598A4 000557C4  EC 01 00 28 */	fsubs f0, f1, f0
/* 800598A8 000557C8  D0 04 00 00 */	stfs f0, 0(r4)
lbl_800598AC:
/* 800598AC 000557CC  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 800598B0 000557D0  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 800598B4 000557D4  38 83 00 30 */	addi r4, r3, 0x30
/* 800598B8 000557D8  C0 03 00 3C */	lfs f0, 0x3c(r3)
/* 800598BC 000557DC  C0 23 00 30 */	lfs f1, 0x30(r3)
/* 800598C0 000557E0  EC 01 00 2A */	fadds f0, f1, f0
/* 800598C4 000557E4  D0 03 00 30 */	stfs f0, 0x30(r3)
/* 800598C8 000557E8  C0 23 00 30 */	lfs f1, 0x30(r3)
/* 800598CC 000557EC  C8 02 98 80 */	lfd f0, lbl_802F4080@sda21(r2)
/* 800598D0 000557F0  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800598D4 000557F4  40 81 00 10 */	ble lbl_800598E4
/* 800598D8 000557F8  FC 01 00 28 */	fsub f0, f1, f0
/* 800598DC 000557FC  FC 00 00 18 */	frsp f0, f0
/* 800598E0 00055800  D0 04 00 00 */	stfs f0, 0(r4)
lbl_800598E4:
/* 800598E4 00055804  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 800598E8 00055808  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 800598EC 0005580C  38 83 00 34 */	addi r4, r3, 0x34
/* 800598F0 00055810  C0 03 00 40 */	lfs f0, 0x40(r3)
/* 800598F4 00055814  C0 23 00 34 */	lfs f1, 0x34(r3)
/* 800598F8 00055818  EC 01 00 2A */	fadds f0, f1, f0
/* 800598FC 0005581C  D0 03 00 34 */	stfs f0, 0x34(r3)
/* 80059900 00055820  C0 23 00 34 */	lfs f1, 0x34(r3)
/* 80059904 00055824  C8 02 98 80 */	lfd f0, lbl_802F4080@sda21(r2)
/* 80059908 00055828  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8005990C 0005582C  4C 81 00 20 */	blelr
/* 80059910 00055830  FC 01 00 28 */	fsub f0, f1, f0
/* 80059914 00055834  FC 00 00 18 */	frsp f0, f0
/* 80059918 00055838  D0 04 00 00 */	stfs f0, 0(r4)
/* 8005991C 0005583C  4E 80 00 20 */	blr
.global bg_old_sand_finish
bg_old_sand_finish:
/* 80059920 00055840  4E 80 00 20 */	blr
.global bg_old_sand_draw
bg_old_sand_draw:
/* 80059924 00055844  7C 08 02 A6 */	mflr r0
/* 80059928 00055848  90 01 00 04 */	stw r0, 4(r1)
/* 8005992C 0005584C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80059930 00055850  80 6D 99 5C */	lwz r3, lbl_802F1B3C@sda21(r13)
/* 80059934 00055854  38 63 00 30 */	addi r3, r3, 0x30
/* 80059938 00055858  4B FA DF 79 */	bl mathutil_mtxA_from_mtx
/* 8005993C 0005585C  80 6D 99 1C */	lwz r3, naomiBackgroundObj@sda21(r13)
/* 80059940 00055860  80 63 00 04 */	lwz r3, 4(r3)
/* 80059944 00055864  4B FD A1 91 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 80059948 00055868  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 8005994C 0005586C  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 80059950 00055870  80 84 00 08 */	lwz r4, 8(r4)
/* 80059954 00055874  80 A4 FF FC */	lwz r5, -4(r4)
/* 80059958 00055878  80 A5 00 00 */	lwz r5, 0(r5)
/* 8005995C 0005587C  4B FA 9A B9 */	bl memcpy
/* 80059960 00055880  3C 80 80 06 */	lis r4, lbl_800599FC@ha
/* 80059964 00055884  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 80059968 00055888  3C A0 80 06 */	lis r5, lbl_80059A24@ha
/* 8005996C 0005588C  38 84 99 FC */	addi r4, r4, lbl_800599FC@l
/* 80059970 00055890  38 A5 9A 24 */	addi r5, r5, lbl_80059A24@l
/* 80059974 00055894  4B FE E4 A5 */	bl g_apply_func_to_naomi_model_vertices
/* 80059978 00055898  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 8005997C 0005589C  4B FD A1 79 */	bl g_dupe_of_call_draw_naomi_model_1
/* 80059980 000558A0  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 80059984 000558A4  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 80059988 000558A8  80 84 00 10 */	lwz r4, 0x10(r4)
/* 8005998C 000558AC  80 A4 FF FC */	lwz r5, -4(r4)
/* 80059990 000558B0  80 A5 00 00 */	lwz r5, 0(r5)
/* 80059994 000558B4  4B FA 9A 81 */	bl memcpy
/* 80059998 000558B8  3C 80 80 06 */	lis r4, lbl_80059A4C@ha
/* 8005999C 000558BC  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 800599A0 000558C0  3C A0 80 06 */	lis r5, lbl_80059A74@ha
/* 800599A4 000558C4  38 84 9A 4C */	addi r4, r4, lbl_80059A4C@l
/* 800599A8 000558C8  38 A5 9A 74 */	addi r5, r5, lbl_80059A74@l
/* 800599AC 000558CC  4B FE E4 6D */	bl g_apply_func_to_naomi_model_vertices
/* 800599B0 000558D0  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 800599B4 000558D4  4B FD A1 41 */	bl g_dupe_of_call_draw_naomi_model_1
/* 800599B8 000558D8  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 800599BC 000558DC  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 800599C0 000558E0  C0 03 00 2C */	lfs f0, 0x2c(r3)
/* 800599C4 000558E4  FC 00 00 50 */	fneg f0, f0
/* 800599C8 000558E8  FC 00 00 1E */	fctiwz f0, f0
/* 800599CC 000558EC  D8 01 00 08 */	stfd f0, 8(r1)
/* 800599D0 000558F0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800599D4 000558F4  7C 03 07 34 */	extsh r3, r0
/* 800599D8 000558F8  4B FA E6 25 */	bl mathutil_mtxA_rotate_y
/* 800599DC 000558FC  80 6D 99 1C */	lwz r3, naomiBackgroundObj@sda21(r13)
/* 800599E0 00055900  80 63 00 14 */	lwz r3, 0x14(r3)
/* 800599E4 00055904  4B FD A0 F1 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 800599E8 00055908  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800599EC 0005590C  38 21 00 10 */	addi r1, r1, 0x10
/* 800599F0 00055910  7C 08 03 A6 */	mtlr r0
/* 800599F4 00055914  4E 80 00 20 */	blr
.global func_800599F8
func_800599F8:
/* 800599F8 00055918  4E 80 00 20 */	blr
lbl_800599FC:
/* 800599FC 0005591C  3C 80 80 1C */	lis r4, backgroundInfo@ha
/* 80059A00 00055920  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 80059A04 00055924  38 84 91 78 */	addi r4, r4, backgroundInfo@l
/* 80059A08 00055928  C0 04 00 30 */	lfs f0, 0x30(r4)
/* 80059A0C 0005592C  EC 01 00 2A */	fadds f0, f1, f0
/* 80059A10 00055930  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 80059A14 00055934  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 80059A18 00055938  60 00 00 01 */	ori r0, r0, 1
/* 80059A1C 0005593C  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80059A20 00055940  4E 80 00 20 */	blr
lbl_80059A24:
/* 80059A24 00055944  3C 80 80 1C */	lis r4, backgroundInfo@ha
/* 80059A28 00055948  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 80059A2C 0005594C  38 84 91 78 */	addi r4, r4, backgroundInfo@l
/* 80059A30 00055950  C0 04 00 30 */	lfs f0, 0x30(r4)
/* 80059A34 00055954  EC 01 00 2A */	fadds f0, f1, f0
/* 80059A38 00055958  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 80059A3C 0005595C  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 80059A40 00055960  60 00 00 01 */	ori r0, r0, 1
/* 80059A44 00055964  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80059A48 00055968  4E 80 00 20 */	blr
lbl_80059A4C:
/* 80059A4C 0005596C  3C 80 80 1C */	lis r4, backgroundInfo@ha
/* 80059A50 00055970  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 80059A54 00055974  38 84 91 78 */	addi r4, r4, backgroundInfo@l
/* 80059A58 00055978  C0 04 00 34 */	lfs f0, 0x34(r4)
/* 80059A5C 0005597C  EC 01 00 2A */	fadds f0, f1, f0
/* 80059A60 00055980  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 80059A64 00055984  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 80059A68 00055988  60 00 00 01 */	ori r0, r0, 1
/* 80059A6C 0005598C  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80059A70 00055990  4E 80 00 20 */	blr
lbl_80059A74:
/* 80059A74 00055994  3C 80 80 1C */	lis r4, backgroundInfo@ha
/* 80059A78 00055998  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 80059A7C 0005599C  38 84 91 78 */	addi r4, r4, backgroundInfo@l
/* 80059A80 000559A0  C0 04 00 34 */	lfs f0, 0x34(r4)
/* 80059A84 000559A4  EC 01 00 2A */	fadds f0, f1, f0
/* 80059A88 000559A8  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 80059A8C 000559AC  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 80059A90 000559B0  60 00 00 01 */	ori r0, r0, 1
/* 80059A94 000559B4  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80059A98 000559B8  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F4038
lbl_802F4038:
	# ROM: 0x1EDA58
	.4byte 0x3F800000
	.4byte 0

.global lbl_802F4040
lbl_802F4040:
	# ROM: 0x1EDA60
	.4byte 0x40411111
	.4byte 0x11111111

.global lbl_802F4048
lbl_802F4048:
	# ROM: 0x1EDA68
	.4byte 0x47800000

.global lbl_802F404C
lbl_802F404C:
	# ROM: 0x1EDA6C
	.4byte 0x46FFFE00

.global lbl_802F4050
lbl_802F4050:
	# ROM: 0x1EDA70
	.4byte 0x40AE0000
	.4byte 0

.global lbl_802F4058
lbl_802F4058:
	# ROM: 0x1EDA78
	.4byte 0x3F46C16C
	.4byte 0x16C16C17

.global lbl_802F4060
lbl_802F4060:
	# ROM: 0x1EDA80
	.4byte 0x3F36C16C
	.4byte 0x16C16C17

.global lbl_802F4068
lbl_802F4068:
	# ROM: 0x1EDA88
	.4byte 0x3F6B089A
	.4byte 0x02752546

.global lbl_802F4070
lbl_802F4070:
	# ROM: 0x1EDA90
	.4byte 0x3F40624D
	.4byte 0xD2F1A9FC

.global lbl_802F4078
lbl_802F4078:
	# ROM: 0x1EDA98
	.4byte 0x43300000
	.4byte 0x80000000

.global lbl_802F4080
lbl_802F4080:
	# ROM: 0x1EDAA0
	.4byte 0x3FF00000
	.4byte 0
