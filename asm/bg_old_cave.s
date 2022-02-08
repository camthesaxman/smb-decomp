.include "macros.inc"

.section .text

.global bg_old_cave_init
bg_old_cave_init:
/* 80057A3C 0005395C  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 80057A40 00053960  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 80057A44 00053964  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 80057A48 00053968  80 04 00 08 */	lwz r0, 8(r4)
/* 80057A4C 0005396C  90 03 00 80 */	stw r0, 0x80(r3)
/* 80057A50 00053970  C0 02 95 E8 */	lfs f0, lbl_802F3DE8@sda21(r2)
/* 80057A54 00053974  D0 03 00 84 */	stfs f0, 0x84(r3)
/* 80057A58 00053978  4E 80 00 20 */	blr
.global bg_old_cave_main
bg_old_cave_main:
/* 80057A5C 0005397C  4E 80 00 20 */	blr
.global bg_old_cave_finish
bg_old_cave_finish:
/* 80057A60 00053980  4E 80 00 20 */	blr
.global bg_old_cave_draw
bg_old_cave_draw:
/* 80057A64 00053984  7C 08 02 A6 */	mflr r0
/* 80057A68 00053988  90 01 00 04 */	stw r0, 4(r1)
/* 80057A6C 0005398C  94 21 FF F8 */	stwu r1, -8(r1)
/* 80057A70 00053990  80 6D 99 5C */	lwz r3, lbl_802F1B3C@sda21(r13)
/* 80057A74 00053994  38 63 00 30 */	addi r3, r3, 0x30
/* 80057A78 00053998  4B FA FE 39 */	bl mathutil_mtxA_from_mtx
/* 80057A7C 0005399C  80 6D 99 1C */	lwz r3, naomiBackgroundObj@sda21(r13)
/* 80057A80 000539A0  80 63 00 04 */	lwz r3, 4(r3)
/* 80057A84 000539A4  4B FD C0 51 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 80057A88 000539A8  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80057A8C 000539AC  38 21 00 08 */	addi r1, r1, 8
/* 80057A90 000539B0  7C 08 03 A6 */	mtlr r0
/* 80057A94 000539B4  4E 80 00 20 */	blr
.global func_80057A98
func_80057A98:
/* 80057A98 000539B8  4E 80 00 20 */	blr

.section .sdata2

    .balign 8
.global lbl_802F3DE8
lbl_802F3DE8:
	# ROM: 0x1ED808
	.4byte 0x3F800000
	.4byte 0
