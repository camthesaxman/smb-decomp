.include "macros.inc"

.section .text

.global bg_old_sunset_init
bg_old_sunset_init:
/* 8005879C 000546BC  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 800587A0 000546C0  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 800587A4 000546C4  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 800587A8 000546C8  80 04 00 08 */	lwz r0, 8(r4)
/* 800587AC 000546CC  90 03 00 80 */	stw r0, 0x80(r3)
/* 800587B0 000546D0  C0 02 96 F8 */	lfs f0, lbl_802F3EF8@sda21(r2)
/* 800587B4 000546D4  D0 03 00 84 */	stfs f0, 0x84(r3)
/* 800587B8 000546D8  4E 80 00 20 */	blr
.global bg_old_sunset_main
bg_old_sunset_main:
/* 800587BC 000546DC  4E 80 00 20 */	blr
.global bg_old_sunset_finish
bg_old_sunset_finish:
/* 800587C0 000546E0  4E 80 00 20 */	blr
.global bg_old_sunset_draw
bg_old_sunset_draw:
/* 800587C4 000546E4  7C 08 02 A6 */	mflr r0
/* 800587C8 000546E8  90 01 00 04 */	stw r0, 4(r1)
/* 800587CC 000546EC  94 21 FF F8 */	stwu r1, -8(r1)
/* 800587D0 000546F0  80 6D 99 5C */	lwz r3, lbl_802F1B3C@sda21(r13)
/* 800587D4 000546F4  38 63 00 30 */	addi r3, r3, 0x30
/* 800587D8 000546F8  4B FA F0 D9 */	bl mathutil_mtxA_from_mtx
/* 800587DC 000546FC  80 6D 99 1C */	lwz r3, naomiBackgroundObj@sda21(r13)
/* 800587E0 00054700  80 63 00 04 */	lwz r3, 4(r3)
/* 800587E4 00054704  4B FD B2 F1 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 800587E8 00054708  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800587EC 0005470C  38 21 00 08 */	addi r1, r1, 8
/* 800587F0 00054710  7C 08 03 A6 */	mtlr r0
/* 800587F4 00054714  4E 80 00 20 */	blr
.global func_800587F8
func_800587F8:
/* 800587F8 00054718  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F3EF8
lbl_802F3EF8:
	# ROM: 0x1ED918
	.4byte 0x3F800000
	.4byte 0
