.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global OSReport
OSReport:
/* 800C3C20 000BFB40  7C 08 02 A6 */	mflr r0
/* 800C3C24 000BFB44  90 01 00 04 */	stw r0, 4(r1)
/* 800C3C28 000BFB48  94 21 FF 88 */	stwu r1, -0x78(r1)
/* 800C3C2C 000BFB4C  40 86 00 24 */	bne cr1, lbl_800C3C50
/* 800C3C30 000BFB50  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 800C3C34 000BFB54  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 800C3C38 000BFB58  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 800C3C3C 000BFB5C  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 800C3C40 000BFB60  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 800C3C44 000BFB64  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 800C3C48 000BFB68  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 800C3C4C 000BFB6C  D9 01 00 60 */	stfd f8, 0x60(r1)
lbl_800C3C50:
/* 800C3C50 000BFB70  90 61 00 08 */	stw r3, 8(r1)
/* 800C3C54 000BFB74  3C 00 01 00 */	lis r0, 0x100
/* 800C3C58 000BFB78  90 81 00 0C */	stw r4, 0xc(r1)
/* 800C3C5C 000BFB7C  38 81 00 6C */	addi r4, r1, 0x6c
/* 800C3C60 000BFB80  90 A1 00 10 */	stw r5, 0x10(r1)
/* 800C3C64 000BFB84  90 C1 00 14 */	stw r6, 0x14(r1)
/* 800C3C68 000BFB88  90 E1 00 18 */	stw r7, 0x18(r1)
/* 800C3C6C 000BFB8C  91 01 00 1C */	stw r8, 0x1c(r1)
/* 800C3C70 000BFB90  91 21 00 20 */	stw r9, 0x20(r1)
/* 800C3C74 000BFB94  91 41 00 24 */	stw r10, 0x24(r1)
/* 800C3C78 000BFB98  90 01 00 6C */	stw r0, 0x6c(r1)
/* 800C3C7C 000BFB9C  38 01 00 80 */	addi r0, r1, 0x80
/* 800C3C80 000BFBA0  90 01 00 70 */	stw r0, 0x70(r1)
/* 800C3C84 000BFBA4  38 01 00 08 */	addi r0, r1, 8
/* 800C3C88 000BFBA8  90 01 00 74 */	stw r0, 0x74(r1)
/* 800C3C8C 000BFBAC  48 04 10 E5 */	bl vprintf
/* 800C3C90 000BFBB0  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 800C3C94 000BFBB4  38 21 00 78 */	addi r1, r1, 0x78
/* 800C3C98 000BFBB8  7C 08 03 A6 */	mtlr r0
/* 800C3C9C 000BFBBC  4E 80 00 20 */	blr

.global OSPanic
OSPanic:
/* 800C3CA0 000BFBC0  7C 08 02 A6 */	mflr r0
/* 800C3CA4 000BFBC4  90 01 00 04 */	stw r0, 4(r1)
/* 800C3CA8 000BFBC8  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 800C3CAC 000BFBCC  93 E1 00 8C */	stw r31, 0x8c(r1)
/* 800C3CB0 000BFBD0  93 C1 00 88 */	stw r30, 0x88(r1)
/* 800C3CB4 000BFBD4  93 A1 00 84 */	stw r29, 0x84(r1)
/* 800C3CB8 000BFBD8  93 81 00 80 */	stw r28, 0x80(r1)
/* 800C3CBC 000BFBDC  40 86 00 24 */	bne cr1, lbl_800C3CE0
/* 800C3CC0 000BFBE0  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 800C3CC4 000BFBE4  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 800C3CC8 000BFBE8  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 800C3CCC 000BFBEC  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 800C3CD0 000BFBF0  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 800C3CD4 000BFBF4  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 800C3CD8 000BFBF8  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 800C3CDC 000BFBFC  D9 01 00 60 */	stfd f8, 0x60(r1)
lbl_800C3CE0:
/* 800C3CE0 000BFC00  90 61 00 08 */	stw r3, 8(r1)
/* 800C3CE4 000BFC04  3B 83 00 00 */	addi r28, r3, 0
/* 800C3CE8 000BFC08  3B C4 00 00 */	addi r30, r4, 0
/* 800C3CEC 000BFC0C  90 81 00 0C */	stw r4, 0xc(r1)
/* 800C3CF0 000BFC10  3B A5 00 00 */	addi r29, r5, 0
/* 800C3CF4 000BFC14  90 A1 00 10 */	stw r5, 0x10(r1)
/* 800C3CF8 000BFC18  90 C1 00 14 */	stw r6, 0x14(r1)
/* 800C3CFC 000BFC1C  3C C0 80 1E */	lis r6, lbl_801E66D0@ha
/* 800C3D00 000BFC20  3B E6 66 D0 */	addi r31, r6, lbl_801E66D0@l
/* 800C3D04 000BFC24  90 E1 00 18 */	stw r7, 0x18(r1)
/* 800C3D08 000BFC28  91 01 00 1C */	stw r8, 0x1c(r1)
/* 800C3D0C 000BFC2C  91 21 00 20 */	stw r9, 0x20(r1)
/* 800C3D10 000BFC30  91 41 00 24 */	stw r10, 0x24(r1)
/* 800C3D14 000BFC34  48 00 23 A9 */	bl OSDisableInterrupts
/* 800C3D18 000BFC38  3C 00 03 00 */	lis r0, 0x300
/* 800C3D1C 000BFC3C  90 01 00 74 */	stw r0, 0x74(r1)
/* 800C3D20 000BFC40  38 01 00 98 */	addi r0, r1, 0x98
/* 800C3D24 000BFC44  38 81 00 74 */	addi r4, r1, 0x74
/* 800C3D28 000BFC48  90 01 00 78 */	stw r0, 0x78(r1)
/* 800C3D2C 000BFC4C  38 01 00 08 */	addi r0, r1, 8
/* 800C3D30 000BFC50  38 7D 00 00 */	addi r3, r29, 0
/* 800C3D34 000BFC54  90 01 00 7C */	stw r0, 0x7c(r1)
/* 800C3D38 000BFC58  48 04 10 39 */	bl vprintf
/* 800C3D3C 000BFC5C  38 7F 00 00 */	addi r3, r31, 0
/* 800C3D40 000BFC60  4C C6 31 82 */	crclr 6
/* 800C3D44 000BFC64  38 9C 00 00 */	addi r4, r28, 0
/* 800C3D48 000BFC68  38 BE 00 00 */	addi r5, r30, 0
/* 800C3D4C 000BFC6C  4B FF FE D5 */	bl OSReport
/* 800C3D50 000BFC70  38 7F 00 18 */	addi r3, r31, 0x18
/* 800C3D54 000BFC74  4C C6 31 82 */	crclr 6
/* 800C3D58 000BFC78  4B FF FE C9 */	bl OSReport
/* 800C3D5C 000BFC7C  3B C0 00 00 */	li r30, 0
/* 800C3D60 000BFC80  4B FF FB 21 */	bl OSGetStackPointer
/* 800C3D64 000BFC84  7C 7D 1B 78 */	mr r29, r3
/* 800C3D68 000BFC88  48 00 00 20 */	b lbl_800C3D88
lbl_800C3D6C:
/* 800C3D6C 000BFC8C  80 BD 00 00 */	lwz r5, 0(r29)
/* 800C3D70 000BFC90  7F A4 EB 78 */	mr r4, r29
/* 800C3D74 000BFC94  80 DD 00 04 */	lwz r6, 4(r29)
/* 800C3D78 000BFC98  38 7F 00 40 */	addi r3, r31, 0x40
/* 800C3D7C 000BFC9C  4C C6 31 82 */	crclr 6
/* 800C3D80 000BFCA0  4B FF FE A1 */	bl OSReport
/* 800C3D84 000BFCA4  83 BD 00 00 */	lwz r29, 0(r29)
lbl_800C3D88:
/* 800C3D88 000BFCA8  28 1D 00 00 */	cmplwi r29, 0
/* 800C3D8C 000BFCAC  41 82 00 1C */	beq lbl_800C3DA8
/* 800C3D90 000BFCB0  3C 1D 00 01 */	addis r0, r29, 1
/* 800C3D94 000BFCB4  28 00 FF FF */	cmplwi r0, 0xffff
/* 800C3D98 000BFCB8  41 82 00 10 */	beq lbl_800C3DA8
/* 800C3D9C 000BFCBC  28 1E 00 10 */	cmplwi r30, 0x10
/* 800C3DA0 000BFCC0  3B DE 00 01 */	addi r30, r30, 1
/* 800C3DA4 000BFCC4  41 80 FF C8 */	blt lbl_800C3D6C
lbl_800C3DA8:
/* 800C3DA8 000BFCC8  4B FF D9 91 */	bl PPCHalt
/* 800C3DAC 000BFCCC  80 01 00 94 */	lwz r0, 0x94(r1)
/* 800C3DB0 000BFCD0  83 E1 00 8C */	lwz r31, 0x8c(r1)
/* 800C3DB4 000BFCD4  83 C1 00 88 */	lwz r30, 0x88(r1)
/* 800C3DB8 000BFCD8  7C 08 03 A6 */	mtlr r0
/* 800C3DBC 000BFCDC  83 A1 00 84 */	lwz r29, 0x84(r1)
/* 800C3DC0 000BFCE0  83 81 00 80 */	lwz r28, 0x80(r1)
/* 800C3DC4 000BFCE4  38 21 00 90 */	addi r1, r1, 0x90
/* 800C3DC8 000BFCE8  4E 80 00 20 */	blr

.global OSSetErrorHandler
OSSetErrorHandler:
/* 800C3DCC 000BFCEC  3C A0 80 2C */	lis r5, OSErrorTable@ha
/* 800C3DD0 000BFCF0  54 63 13 BA */	rlwinm r3, r3, 2, 0xe, 0x1d
/* 800C3DD4 000BFCF4  38 05 6B E8 */	addi r0, r5, OSErrorTable@l
/* 800C3DD8 000BFCF8  7C A0 1A 14 */	add r5, r0, r3
/* 800C3DDC 000BFCFC  80 65 00 00 */	lwz r3, 0(r5)
/* 800C3DE0 000BFD00  90 85 00 00 */	stw r4, 0(r5)
/* 800C3DE4 000BFD04  4E 80 00 20 */	blr

.global __OSUnhandledException
__OSUnhandledException:
/* 800C3DE8 000BFD08  7C 08 02 A6 */	mflr r0
/* 800C3DEC 000BFD0C  90 01 00 04 */	stw r0, 4(r1)
/* 800C3DF0 000BFD10  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800C3DF4 000BFD14  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 800C3DF8 000BFD18  7C 9C 23 78 */	mr r28, r4
/* 800C3DFC 000BFD1C  3B 63 00 00 */	addi r27, r3, 0
/* 800C3E00 000BFD20  3B A5 00 00 */	addi r29, r5, 0
/* 800C3E04 000BFD24  3B C6 00 00 */	addi r30, r6, 0
/* 800C3E08 000BFD28  80 04 01 9C */	lwz r0, 0x19c(r4)
/* 800C3E0C 000BFD2C  3C 80 80 1E */	lis r4, lbl_801E66D0@ha
/* 800C3E10 000BFD30  3B E4 66 D0 */	addi r31, r4, lbl_801E66D0@l
/* 800C3E14 000BFD34  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 800C3E18 000BFD38  40 82 00 18 */	bne lbl_800C3E30
/* 800C3E1C 000BFD3C  38 7F 00 5C */	addi r3, r31, 0x5c
/* 800C3E20 000BFD40  4C C6 31 82 */	crclr 6
/* 800C3E24 000BFD44  57 64 06 3E */	clrlwi r4, r27, 0x18
/* 800C3E28 000BFD48  4B FF FD F9 */	bl OSReport
/* 800C3E2C 000BFD4C  48 00 00 68 */	b lbl_800C3E94
lbl_800C3E30:
/* 800C3E30 000BFD50  57 63 06 3E */	clrlwi r3, r27, 0x18
/* 800C3E34 000BFD54  3C 80 80 2C */	lis r4, OSErrorTable@ha
/* 800C3E38 000BFD58  57 65 15 BA */	rlwinm r5, r27, 2, 0x16, 0x1d
/* 800C3E3C 000BFD5C  38 04 6B E8 */	addi r0, r4, OSErrorTable@l
/* 800C3E40 000BFD60  7C 80 2A 14 */	add r4, r0, r5
/* 800C3E44 000BFD64  81 84 00 00 */	lwz r12, 0(r4)
/* 800C3E48 000BFD68  28 0C 00 00 */	cmplwi r12, 0
/* 800C3E4C 000BFD6C  41 82 00 24 */	beq lbl_800C3E70
/* 800C3E50 000BFD70  7D 88 03 A6 */	mtlr r12
/* 800C3E54 000BFD74  38 9C 00 00 */	addi r4, r28, 0
/* 800C3E58 000BFD78  38 BD 00 00 */	addi r5, r29, 0
/* 800C3E5C 000BFD7C  4C C6 31 82 */	crclr 6
/* 800C3E60 000BFD80  38 DE 00 00 */	addi r6, r30, 0
/* 800C3E64 000BFD84  4E 80 00 21 */	blrl
/* 800C3E68 000BFD88  7F 83 E3 78 */	mr r3, r28
/* 800C3E6C 000BFD8C  4B FF F9 3D */	bl OSLoadContext
lbl_800C3E70:
/* 800C3E70 000BFD90  57 60 06 3E */	clrlwi r0, r27, 0x18
/* 800C3E74 000BFD94  28 00 00 08 */	cmplwi r0, 8
/* 800C3E78 000BFD98  40 82 00 0C */	bne lbl_800C3E84
/* 800C3E7C 000BFD9C  7F 83 E3 78 */	mr r3, r28
/* 800C3E80 000BFDA0  4B FF F9 29 */	bl OSLoadContext
lbl_800C3E84:
/* 800C3E84 000BFDA4  38 7F 00 7C */	addi r3, r31, 0x7c
/* 800C3E88 000BFDA8  4C C6 31 82 */	crclr 6
/* 800C3E8C 000BFDAC  57 64 06 3E */	clrlwi r4, r27, 0x18
/* 800C3E90 000BFDB0  4B FF FD 91 */	bl OSReport
lbl_800C3E94:
/* 800C3E94 000BFDB4  38 6D 97 58 */	addi r3, r13, lbl_802F1938@sda21
/* 800C3E98 000BFDB8  4C C6 31 82 */	crclr 6
/* 800C3E9C 000BFDBC  4B FF FD 85 */	bl OSReport
/* 800C3EA0 000BFDC0  7F 83 E3 78 */	mr r3, r28
/* 800C3EA4 000BFDC4  4B FF FA 09 */	bl OSDumpContext
/* 800C3EA8 000BFDC8  38 9D 00 00 */	addi r4, r29, 0
/* 800C3EAC 000BFDCC  4C C6 31 82 */	crclr 6
/* 800C3EB0 000BFDD0  38 BE 00 00 */	addi r5, r30, 0
/* 800C3EB4 000BFDD4  38 7F 00 94 */	addi r3, r31, 0x94
/* 800C3EB8 000BFDD8  4B FF FD 69 */	bl OSReport
/* 800C3EBC 000BFDDC  57 60 06 3E */	clrlwi r0, r27, 0x18
/* 800C3EC0 000BFDE0  2C 00 00 04 */	cmpwi r0, 4
/* 800C3EC4 000BFDE4  41 82 00 80 */	beq lbl_800C3F44
/* 800C3EC8 000BFDE8  40 80 00 14 */	bge lbl_800C3EDC
/* 800C3ECC 000BFDEC  2C 00 00 02 */	cmpwi r0, 2
/* 800C3ED0 000BFDF0  41 82 00 1C */	beq lbl_800C3EEC
/* 800C3ED4 000BFDF4  40 80 00 30 */	bge lbl_800C3F04
/* 800C3ED8 000BFDF8  48 00 00 6C */	b lbl_800C3F44
lbl_800C3EDC:
/* 800C3EDC 000BFDFC  2C 00 00 06 */	cmpwi r0, 6
/* 800C3EE0 000BFE00  41 82 00 50 */	beq lbl_800C3F30
/* 800C3EE4 000BFE04  40 80 00 60 */	bge lbl_800C3F44
/* 800C3EE8 000BFE08  48 00 00 30 */	b lbl_800C3F18
lbl_800C3EEC:
/* 800C3EEC 000BFE0C  80 9C 01 98 */	lwz r4, 0x198(r28)
/* 800C3EF0 000BFE10  38 BE 00 00 */	addi r5, r30, 0
/* 800C3EF4 000BFE14  38 7F 00 C4 */	addi r3, r31, 0xc4
/* 800C3EF8 000BFE18  4C C6 31 82 */	crclr 6
/* 800C3EFC 000BFE1C  4B FF FD 25 */	bl OSReport
/* 800C3F00 000BFE20  48 00 00 44 */	b lbl_800C3F44
lbl_800C3F04:
/* 800C3F04 000BFE24  80 9C 01 98 */	lwz r4, 0x198(r28)
/* 800C3F08 000BFE28  38 7F 01 24 */	addi r3, r31, 0x124
/* 800C3F0C 000BFE2C  4C C6 31 82 */	crclr 6
/* 800C3F10 000BFE30  4B FF FD 11 */	bl OSReport
/* 800C3F14 000BFE34  48 00 00 30 */	b lbl_800C3F44
lbl_800C3F18:
/* 800C3F18 000BFE38  80 9C 01 98 */	lwz r4, 0x198(r28)
/* 800C3F1C 000BFE3C  38 BE 00 00 */	addi r5, r30, 0
/* 800C3F20 000BFE40  38 7F 01 70 */	addi r3, r31, 0x170
/* 800C3F24 000BFE44  4C C6 31 82 */	crclr 6
/* 800C3F28 000BFE48  4B FF FC F9 */	bl OSReport
/* 800C3F2C 000BFE4C  48 00 00 18 */	b lbl_800C3F44
lbl_800C3F30:
/* 800C3F30 000BFE50  80 9C 01 98 */	lwz r4, 0x198(r28)
/* 800C3F34 000BFE54  38 BE 00 00 */	addi r5, r30, 0
/* 800C3F38 000BFE58  38 7F 01 D4 */	addi r3, r31, 0x1d4
/* 800C3F3C 000BFE5C  4C C6 31 82 */	crclr 6
/* 800C3F40 000BFE60  4B FF FC E1 */	bl OSReport
lbl_800C3F44:
/* 800C3F44 000BFE64  4B FF D7 F5 */	bl PPCHalt
/* 800C3F48 000BFE68  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 800C3F4C 000BFE6C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800C3F50 000BFE70  38 21 00 30 */	addi r1, r1, 0x30
/* 800C3F54 000BFE74  7C 08 03 A6 */	mtlr r0
/* 800C3F58 000BFE78  4E 80 00 20 */	blr

.section .data

.global lbl_801E66D0
lbl_801E66D0:
	# ROM: 0x1E36D0
glabel string__in__
	.asciz " in \"%s\" on line %d.\n"
	.balign 4
glabel string__nAddress_______Back_Chain____LR_Save_n_2
	.asciz "\nAddress:      Back Chain    LR Save\n"
	.balign 4
glabel string_0x_08x____0x_08x____0x_08x_n_2
	.asciz "0x%08x:   0x%08x    0x%08x\n"
glabel string_Non_recoverable_Exception__d
	.asciz "Non-recoverable Exception %d"
	.balign 4
glabel string_Unhandled_Exception__d
	.asciz "Unhandled Exception %d"
	.balign 4
glabel string__nDSISR__0x_08x___________________DAR____0x_08x_n
	.asciz "\nDSISR= 0x%08x                   DAR  = 0x%08x\n"
glabel string__nInstruction_at_0x_x__read_from_SRR0__attempted_to_access_invalid_address_0x_x__read_from_DAR__n
	.asciz "\nInstruction at 0x%x (read from SRR0) attempted to access invalid address 0x%x (read from DAR)\n"
glabel string__nAttempted_to_fetch_instruction_from_invalid_address_0x_x__read_from_SRR0__n
	.asciz "\nAttempted to fetch instruction from invalid address 0x%x (read from SRR0)\n"
glabel string__nInstruction_at_0x_x__read_from_SRR0__attempted_to_access_unaligned_address_0x_x__read_from_DAR__n
	.asciz "\nInstruction at 0x%x (read from SRR0) attempted to access unaligned address 0x%x (read from DAR)\n"
	.balign 4
glabel string__nProgram_exception___Possible_illegal_instruction_operation_at_or_around_0x_x__read_from_SRR0__n
	.asciz "\nProgram exception : Possible illegal instruction/operation at or around 0x%x (read from SRR0)\n"
	.4byte 0

.section .sdata

.global lbl_802F1938
lbl_802F1938:
	# ROM: 0x1EC078
	.byte 0x0A, 0x00, 0x00, 0x00
	.4byte 0

.section .bss

.global OSErrorTable
OSErrorTable:
	.skip 0x40
