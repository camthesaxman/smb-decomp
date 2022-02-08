.include "macros.inc"

.section .text

.global bg_old_space_init
bg_old_space_init:
/* 80058520 00054440  7C 08 02 A6 */	mflr r0
/* 80058524 00054444  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 80058528 00054448  90 01 00 04 */	stw r0, 4(r1)
/* 8005852C 0005444C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80058530 00054450  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80058534 00054454  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80058538 00054458  3B C3 91 78 */	addi r30, r3, backgroundInfo@l
/* 8005853C 0005445C  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 80058540 00054460  80 04 00 08 */	lwz r0, 8(r4)
/* 80058544 00054464  90 1E 00 80 */	stw r0, 0x80(r30)
/* 80058548 00054468  C0 02 96 B0 */	lfs f0, lbl_802F3EB0@sda21(r2)
/* 8005854C 0005446C  D0 1E 00 84 */	stfs f0, 0x84(r30)
/* 80058550 00054470  48 0A E3 15 */	bl rand
/* 80058554 00054474  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80058558 00054478  C8 82 96 E0 */	lfd f4, lbl_802F3EE0@sda21(r2)
/* 8005855C 0005447C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80058560 00054480  3F E0 43 30 */	lis r31, 0x4330
/* 80058564 00054484  C0 42 96 C8 */	lfs f2, lbl_802F3EC8@sda21(r2)
/* 80058568 00054488  93 E1 00 10 */	stw r31, 0x10(r1)
/* 8005856C 0005448C  C8 22 96 C0 */	lfd f1, lbl_802F3EC0@sda21(r2)
/* 80058570 00054490  C8 61 00 10 */	lfd f3, 0x10(r1)
/* 80058574 00054494  C8 02 96 B8 */	lfd f0, lbl_802F3EB8@sda21(r2)
/* 80058578 00054498  EC 63 20 28 */	fsubs f3, f3, f4
/* 8005857C 0005449C  EC 43 10 24 */	fdivs f2, f3, f2
/* 80058580 000544A0  FC 21 00 B2 */	fmul f1, f1, f2
/* 80058584 000544A4  FC 00 08 28 */	fsub f0, f0, f1
/* 80058588 000544A8  FC 00 00 18 */	frsp f0, f0
/* 8005858C 000544AC  D0 1E 00 38 */	stfs f0, 0x38(r30)
/* 80058590 000544B0  48 0A E2 D5 */	bl rand
/* 80058594 000544B4  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80058598 000544B8  C8 82 96 E0 */	lfd f4, lbl_802F3EE0@sda21(r2)
/* 8005859C 000544BC  90 01 00 0C */	stw r0, 0xc(r1)
/* 800585A0 000544C0  C0 42 96 C8 */	lfs f2, lbl_802F3EC8@sda21(r2)
/* 800585A4 000544C4  93 E1 00 08 */	stw r31, 8(r1)
/* 800585A8 000544C8  C8 22 96 D8 */	lfd f1, lbl_802F3ED8@sda21(r2)
/* 800585AC 000544CC  C8 61 00 08 */	lfd f3, 8(r1)
/* 800585B0 000544D0  C8 02 96 D0 */	lfd f0, lbl_802F3ED0@sda21(r2)
/* 800585B4 000544D4  EC 63 20 28 */	fsubs f3, f3, f4
/* 800585B8 000544D8  EC 43 10 24 */	fdivs f2, f3, f2
/* 800585BC 000544DC  FC 21 00 B2 */	fmul f1, f1, f2
/* 800585C0 000544E0  FC 00 08 28 */	fsub f0, f0, f1
/* 800585C4 000544E4  FC 00 00 18 */	frsp f0, f0
/* 800585C8 000544E8  D0 1E 00 3C */	stfs f0, 0x3c(r30)
/* 800585CC 000544EC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800585D0 000544F0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800585D4 000544F4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800585D8 000544F8  38 21 00 20 */	addi r1, r1, 0x20
/* 800585DC 000544FC  7C 08 03 A6 */	mtlr r0
/* 800585E0 00054500  4E 80 00 20 */	blr
.global bg_old_space_main
bg_old_space_main:
/* 800585E4 00054504  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 800585E8 00054508  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 800585EC 0005450C  38 83 00 2C */	addi r4, r3, 0x2c
/* 800585F0 00054510  C0 03 00 38 */	lfs f0, 0x38(r3)
/* 800585F4 00054514  C0 23 00 2C */	lfs f1, 0x2c(r3)
/* 800585F8 00054518  EC 01 00 2A */	fadds f0, f1, f0
/* 800585FC 0005451C  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 80058600 00054520  C8 22 96 E8 */	lfd f1, lbl_802F3EE8@sda21(r2)
/* 80058604 00054524  48 00 00 14 */	b lbl_80058618
lbl_80058608:
/* 80058608 00054528  C0 04 00 00 */	lfs f0, 0(r4)
/* 8005860C 0005452C  FC 00 08 28 */	fsub f0, f0, f1
/* 80058610 00054530  FC 00 00 18 */	frsp f0, f0
/* 80058614 00054534  D0 04 00 00 */	stfs f0, 0(r4)
lbl_80058618:
/* 80058618 00054538  C0 04 00 00 */	lfs f0, 0(r4)
/* 8005861C 0005453C  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 80058620 00054540  41 81 FF E8 */	bgt lbl_80058608
/* 80058624 00054544  C8 42 96 E8 */	lfd f2, lbl_802F3EE8@sda21(r2)
/* 80058628 00054548  C8 02 96 F0 */	lfd f0, lbl_802F3EF0@sda21(r2)
/* 8005862C 0005454C  48 00 00 14 */	b lbl_80058640
lbl_80058630:
/* 80058630 00054550  C0 24 00 00 */	lfs f1, 0(r4)
/* 80058634 00054554  FC 21 10 2A */	fadd f1, f1, f2
/* 80058638 00054558  FC 20 08 18 */	frsp f1, f1
/* 8005863C 0005455C  D0 24 00 00 */	stfs f1, 0(r4)
lbl_80058640:
/* 80058640 00054560  C0 24 00 00 */	lfs f1, 0(r4)
/* 80058644 00054564  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80058648 00054568  41 80 FF E8 */	blt lbl_80058630
/* 8005864C 0005456C  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 80058650 00054570  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 80058654 00054574  38 83 00 30 */	addi r4, r3, 0x30
/* 80058658 00054578  C0 03 00 3C */	lfs f0, 0x3c(r3)
/* 8005865C 0005457C  C0 23 00 30 */	lfs f1, 0x30(r3)
/* 80058660 00054580  EC 01 00 2A */	fadds f0, f1, f0
/* 80058664 00054584  D0 03 00 30 */	stfs f0, 0x30(r3)
/* 80058668 00054588  C8 22 96 E8 */	lfd f1, lbl_802F3EE8@sda21(r2)
/* 8005866C 0005458C  48 00 00 14 */	b lbl_80058680
lbl_80058670:
/* 80058670 00054590  C0 04 00 00 */	lfs f0, 0(r4)
/* 80058674 00054594  FC 00 08 28 */	fsub f0, f0, f1
/* 80058678 00054598  FC 00 00 18 */	frsp f0, f0
/* 8005867C 0005459C  D0 04 00 00 */	stfs f0, 0(r4)
lbl_80058680:
/* 80058680 000545A0  C0 04 00 00 */	lfs f0, 0(r4)
/* 80058684 000545A4  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 80058688 000545A8  41 81 FF E8 */	bgt lbl_80058670
/* 8005868C 000545AC  C8 42 96 E8 */	lfd f2, lbl_802F3EE8@sda21(r2)
/* 80058690 000545B0  C8 02 96 F0 */	lfd f0, lbl_802F3EF0@sda21(r2)
/* 80058694 000545B4  48 00 00 14 */	b lbl_800586A8
lbl_80058698:
/* 80058698 000545B8  C0 24 00 00 */	lfs f1, 0(r4)
/* 8005869C 000545BC  FC 21 10 2A */	fadd f1, f1, f2
/* 800586A0 000545C0  FC 20 08 18 */	frsp f1, f1
/* 800586A4 000545C4  D0 24 00 00 */	stfs f1, 0(r4)
lbl_800586A8:
/* 800586A8 000545C8  C0 24 00 00 */	lfs f1, 0(r4)
/* 800586AC 000545CC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800586B0 000545D0  41 80 FF E8 */	blt lbl_80058698
/* 800586B4 000545D4  4E 80 00 20 */	blr
.global bg_old_space_finish
bg_old_space_finish:
/* 800586B8 000545D8  4E 80 00 20 */	blr
.global bg_old_space_draw
bg_old_space_draw:
/* 800586BC 000545DC  7C 08 02 A6 */	mflr r0
/* 800586C0 000545E0  90 01 00 04 */	stw r0, 4(r1)
/* 800586C4 000545E4  94 21 FF F8 */	stwu r1, -8(r1)
/* 800586C8 000545E8  80 6D 99 5C */	lwz r3, lbl_802F1B3C@sda21(r13)
/* 800586CC 000545EC  38 63 00 30 */	addi r3, r3, 0x30
/* 800586D0 000545F0  4B FA F1 E1 */	bl mathutil_mtxA_from_mtx
/* 800586D4 000545F4  80 6D 99 1C */	lwz r3, naomiBackgroundObj@sda21(r13)
/* 800586D8 000545F8  80 63 00 04 */	lwz r3, 4(r3)
/* 800586DC 000545FC  4B FD B3 F9 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 800586E0 00054600  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 800586E4 00054604  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 800586E8 00054608  80 84 00 0C */	lwz r4, 0xc(r4)
/* 800586EC 0005460C  80 A4 FF FC */	lwz r5, -4(r4)
/* 800586F0 00054610  80 A5 00 00 */	lwz r5, 0(r5)
/* 800586F4 00054614  4B FA AD 21 */	bl memcpy
/* 800586F8 00054618  3C 80 80 06 */	lis r4, lbl_8005872C@ha
/* 800586FC 0005461C  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 80058700 00054620  3C A0 80 06 */	lis r5, lbl_80058764@ha
/* 80058704 00054624  38 84 87 2C */	addi r4, r4, lbl_8005872C@l
/* 80058708 00054628  38 A5 87 64 */	addi r5, r5, lbl_80058764@l
/* 8005870C 0005462C  4B FE F7 0D */	bl g_apply_func_to_naomi_model_vertices
/* 80058710 00054630  80 6D 99 6C */	lwz r3, lbl_802F1B4C@sda21(r13)
/* 80058714 00054634  4B FD B3 E1 */	bl g_dupe_of_call_draw_naomi_model_1
/* 80058718 00054638  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8005871C 0005463C  38 21 00 08 */	addi r1, r1, 8
/* 80058720 00054640  7C 08 03 A6 */	mtlr r0
/* 80058724 00054644  4E 80 00 20 */	blr
.global func_80058728
func_80058728:
/* 80058728 00054648  4E 80 00 20 */	blr
lbl_8005872C:
/* 8005872C 0005464C  3C 80 80 1C */	lis r4, backgroundInfo@ha
/* 80058730 00054650  C0 23 00 18 */	lfs f1, 0x18(r3)
/* 80058734 00054654  38 84 91 78 */	addi r4, r4, backgroundInfo@l
/* 80058738 00054658  C0 04 00 2C */	lfs f0, 0x2c(r4)
/* 8005873C 0005465C  EC 01 00 2A */	fadds f0, f1, f0
/* 80058740 00054660  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 80058744 00054664  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 80058748 00054668  C0 04 00 30 */	lfs f0, 0x30(r4)
/* 8005874C 0005466C  EC 01 00 2A */	fadds f0, f1, f0
/* 80058750 00054670  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 80058754 00054674  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 80058758 00054678  60 00 00 01 */	ori r0, r0, 1
/* 8005875C 0005467C  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80058760 00054680  4E 80 00 20 */	blr
lbl_80058764:
/* 80058764 00054684  3C 80 80 1C */	lis r4, backgroundInfo@ha
/* 80058768 00054688  C0 23 00 18 */	lfs f1, 0x18(r3)
/* 8005876C 0005468C  38 84 91 78 */	addi r4, r4, backgroundInfo@l
/* 80058770 00054690  C0 04 00 2C */	lfs f0, 0x2c(r4)
/* 80058774 00054694  EC 01 00 2A */	fadds f0, f1, f0
/* 80058778 00054698  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 8005877C 0005469C  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 80058780 000546A0  C0 04 00 30 */	lfs f0, 0x30(r4)
/* 80058784 000546A4  EC 01 00 2A */	fadds f0, f1, f0
/* 80058788 000546A8  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 8005878C 000546AC  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 80058790 000546B0  60 00 00 01 */	ori r0, r0, 1
/* 80058794 000546B4  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80058798 000546B8  4E 80 00 20 */	blr

.section .sdata2

    .balign 8
.global lbl_802F3EB0
lbl_802F3EB0:
	# ROM: 0x1ED8D0
	.4byte 0x3F800000
	.4byte 0

.global lbl_802F3EB8
lbl_802F3EB8:
	# ROM: 0x1ED8D8
	.4byte 0x3F46C16C
	.4byte 0x16C16C17

.global lbl_802F3EC0
lbl_802F3EC0:
	# ROM: 0x1ED8E0
	.4byte 0x3F56C16C
	.4byte 0x16C16C17

.global lbl_802F3EC8
lbl_802F3EC8:
	# ROM: 0x1ED8E8
	.4byte 0x46FFFE00
	.4byte 0

.global lbl_802F3ED0
lbl_802F3ED0:
	# ROM: 0x1ED8F0
	.4byte 0xBF36C16C
	.4byte 0x16C16C17

.global lbl_802F3ED8
lbl_802F3ED8:
	# ROM: 0x1ED8F8
	.4byte 0x3F26C16C
	.4byte 0x16C16C17

.global lbl_802F3EE0
lbl_802F3EE0:
	# ROM: 0x1ED900
	.4byte 0x43300000
	.4byte 0x80000000

.global lbl_802F3EE8
lbl_802F3EE8:
	# ROM: 0x1ED908
	.4byte 0x3FF00000
	.4byte 0

.global lbl_802F3EF0
lbl_802F3EF0:
	# ROM: 0x1ED910
	.4byte 0
	.4byte 0
