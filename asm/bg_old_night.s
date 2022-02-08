.include "macros.inc"

.section .text

.global bg_old_night_init
bg_old_night_init:
/* 800584C0 000543E0  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 800584C4 000543E4  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 800584C8 000543E8  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 800584CC 000543EC  80 04 00 08 */	lwz r0, 8(r4)
/* 800584D0 000543F0  90 03 00 80 */	stw r0, 0x80(r3)
/* 800584D4 000543F4  C0 02 96 A8 */	lfs f0, lbl_802F3EA8@sda21(r2)
/* 800584D8 000543F8  D0 03 00 84 */	stfs f0, 0x84(r3)
/* 800584DC 000543FC  4E 80 00 20 */	blr
.global bg_old_night_main
bg_old_night_main:
/* 800584E0 00054400  4E 80 00 20 */	blr
.global bg_old_night_finish
bg_old_night_finish:
/* 800584E4 00054404  4E 80 00 20 */	blr
.global bg_old_night_draw
bg_old_night_draw:
/* 800584E8 00054408  7C 08 02 A6 */	mflr r0
/* 800584EC 0005440C  90 01 00 04 */	stw r0, 4(r1)
/* 800584F0 00054410  94 21 FF F8 */	stwu r1, -8(r1)
/* 800584F4 00054414  80 6D 99 5C */	lwz r3, lbl_802F1B3C@sda21(r13)
/* 800584F8 00054418  38 63 00 30 */	addi r3, r3, 0x30
/* 800584FC 0005441C  4B FA F3 B5 */	bl mathutil_mtxA_from_mtx
/* 80058500 00054420  80 6D 99 1C */	lwz r3, naomiBackgroundObj@sda21(r13)
/* 80058504 00054424  80 63 00 04 */	lwz r3, 4(r3)
/* 80058508 00054428  4B FD B5 CD */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 8005850C 0005442C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80058510 00054430  38 21 00 08 */	addi r1, r1, 8
/* 80058514 00054434  7C 08 03 A6 */	mtlr r0
/* 80058518 00054438  4E 80 00 20 */	blr
.global func_8005851C
func_8005851C:
/* 8005851C 0005443C  4E 80 00 20 */	blr

.section .sdata2

    .balign 8
.global lbl_802F3EA8
lbl_802F3EA8:
	# ROM: 0x1ED8C8
	.4byte 0x3F800000
	.4byte 0
