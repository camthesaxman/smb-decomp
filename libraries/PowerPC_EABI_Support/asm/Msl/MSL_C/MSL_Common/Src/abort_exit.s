.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global exit
exit:
/* 80103C48 000FFB68  7C 08 02 A6 */	mflr r0
/* 80103C4C 000FFB6C  90 01 00 04 */	stw r0, 4(r1)
/* 80103C50 000FFB70  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80103C54 000FFB74  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80103C58 000FFB78  80 0D A5 D0 */	lwz r0, __aborting@sda21(r13)
/* 80103C5C 000FFB7C  2C 00 00 00 */	cmpwi r0, 0
/* 80103C60 000FFB80  40 82 00 84 */	bne lbl_80103CE4
/* 80103C64 000FFB84  3C 60 80 2F */	lis r3, lbl_802EE040@ha
/* 80103C68 000FFB88  3B E3 E0 40 */	addi r31, r3, lbl_802EE040@l
/* 80103C6C 000FFB8C  48 00 00 24 */	b lbl_80103C90
lbl_80103C70:
/* 80103C70 000FFB90  80 6D A5 D4 */	lwz r3, atexit_curr_func@sda21(r13)
/* 80103C74 000FFB94  38 63 FF FF */	addi r3, r3, -1
/* 80103C78 000FFB98  54 60 10 3A */	slwi r0, r3, 2
/* 80103C7C 000FFB9C  90 6D A5 D4 */	stw r3, atexit_curr_func@sda21(r13)
/* 80103C80 000FFBA0  7C 7F 02 14 */	add r3, r31, r0
/* 80103C84 000FFBA4  81 83 00 00 */	lwz r12, 0(r3)
/* 80103C88 000FFBA8  7D 88 03 A6 */	mtlr r12
/* 80103C8C 000FFBAC  4E 80 00 21 */	blrl
lbl_80103C90:
/* 80103C90 000FFBB0  80 0D A5 D4 */	lwz r0, atexit_curr_func@sda21(r13)
/* 80103C94 000FFBB4  2C 00 00 00 */	cmpwi r0, 0
/* 80103C98 000FFBB8  41 81 FF D8 */	bgt lbl_80103C70
/* 80103C9C 000FFBBC  4B FF F8 19 */	bl __destroy_global_chain
/* 80103CA0 000FFBC0  3C 60 80 11 */	lis r3, lbl_8010F880@ha
/* 80103CA4 000FFBC4  38 03 F8 80 */	addi r0, r3, lbl_8010F880@l
/* 80103CA8 000FFBC8  7C 1F 03 78 */	mr r31, r0
/* 80103CAC 000FFBCC  48 00 00 10 */	b lbl_80103CBC
lbl_80103CB0:
/* 80103CB0 000FFBD0  7D 88 03 A6 */	mtlr r12
/* 80103CB4 000FFBD4  4E 80 00 21 */	blrl
/* 80103CB8 000FFBD8  3B FF 00 04 */	addi r31, r31, 4
lbl_80103CBC:
/* 80103CBC 000FFBDC  81 9F 00 00 */	lwz r12, 0(r31)
/* 80103CC0 000FFBE0  28 0C 00 00 */	cmplwi r12, 0
/* 80103CC4 000FFBE4  40 82 FF EC */	bne lbl_80103CB0
/* 80103CC8 000FFBE8  81 8D A5 DC */	lwz r12, __stdio_exit@sda21(r13)
/* 80103CCC 000FFBEC  28 0C 00 00 */	cmplwi r12, 0
/* 80103CD0 000FFBF0  41 82 00 14 */	beq lbl_80103CE4
/* 80103CD4 000FFBF4  7D 88 03 A6 */	mtlr r12
/* 80103CD8 000FFBF8  4E 80 00 21 */	blrl
/* 80103CDC 000FFBFC  38 00 00 00 */	li r0, 0
/* 80103CE0 000FFC00  90 0D A5 DC */	stw r0, __stdio_exit@sda21(r13)
lbl_80103CE4:
/* 80103CE4 000FFC04  3C 60 80 2F */	lis r3, lbl_802EE140@ha
/* 80103CE8 000FFC08  3B E3 E1 40 */	addi r31, r3, lbl_802EE140@l
/* 80103CEC 000FFC0C  48 00 00 24 */	b lbl_80103D10
lbl_80103CF0:
/* 80103CF0 000FFC10  80 6D A5 D8 */	lwz r3, __atexit_curr_func@sda21(r13)
/* 80103CF4 000FFC14  38 63 FF FF */	addi r3, r3, -1
/* 80103CF8 000FFC18  54 60 10 3A */	slwi r0, r3, 2
/* 80103CFC 000FFC1C  90 6D A5 D8 */	stw r3, __atexit_curr_func@sda21(r13)
/* 80103D00 000FFC20  7C 7F 02 14 */	add r3, r31, r0
/* 80103D04 000FFC24  81 83 00 00 */	lwz r12, 0(r3)
/* 80103D08 000FFC28  7D 88 03 A6 */	mtlr r12
/* 80103D0C 000FFC2C  4E 80 00 21 */	blrl
lbl_80103D10:
/* 80103D10 000FFC30  80 0D A5 D8 */	lwz r0, __atexit_curr_func@sda21(r13)
/* 80103D14 000FFC34  2C 00 00 00 */	cmpwi r0, 0
/* 80103D18 000FFC38  41 81 FF D8 */	bgt lbl_80103CF0
/* 80103D1C 000FFC3C  48 00 07 99 */	bl __kill_critical_regions
/* 80103D20 000FFC40  81 8D A5 E0 */	lwz r12, __console_exit@sda21(r13)
/* 80103D24 000FFC44  28 0C 00 00 */	cmplwi r12, 0
/* 80103D28 000FFC48  41 82 00 14 */	beq lbl_80103D3C
/* 80103D2C 000FFC4C  7D 88 03 A6 */	mtlr r12
/* 80103D30 000FFC50  4E 80 00 21 */	blrl
/* 80103D34 000FFC54  38 00 00 00 */	li r0, 0
/* 80103D38 000FFC58  90 0D A5 E0 */	stw r0, __console_exit@sda21(r13)
lbl_80103D3C:
/* 80103D3C 000FFC5C  4B FC 63 29 */	bl _ExitProcess
/* 80103D40 000FFC60  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80103D44 000FFC64  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80103D48 000FFC68  38 21 00 18 */	addi r1, r1, 0x18
/* 80103D4C 000FFC6C  7C 08 03 A6 */	mtlr r0
/* 80103D50 000FFC70  4E 80 00 20 */	blr

.section .sbss

    .balign 8
.global __aborting
__aborting:
	.skip 0x4
.global atexit_curr_func
atexit_curr_func:
	.skip 0x4
.global __atexit_curr_func
__atexit_curr_func:
	.skip 0x4
.global __stdio_exit
__stdio_exit:
	.skip 0x4
.global __console_exit
__console_exit:
	.skip 0x8

.section .bss

    .balign 8
.global lbl_802EE040
lbl_802EE040:
	.skip 0x100
.global lbl_802EE140
lbl_802EE140:
	.skip 0x100
