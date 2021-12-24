.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global DBInit
DBInit:
/* 800CA084 000C5FA4  3C 80 80 00 */	lis r4, 0x80000040@ha
/* 800CA088 000C5FA8  38 04 00 40 */	addi r0, r4, 0x80000040@l
/* 800CA08C 000C5FAC  3C 60 80 0D */	lis r3, __DBExceptionDestination@ha
/* 800CA090 000C5FB0  90 0D A1 80 */	stw r0, __DBInterface@sda21(r13)
/* 800CA094 000C5FB4  38 63 A0 F4 */	addi r3, r3, __DBExceptionDestination@l
/* 800CA098 000C5FB8  3C 03 80 00 */	addis r0, r3, 0x8000
/* 800CA09C 000C5FBC  90 04 00 48 */	stw r0, 0x48(r4)
/* 800CA0A0 000C5FC0  38 00 00 01 */	li r0, 1
/* 800CA0A4 000C5FC4  90 0D A1 84 */	stw r0, DBVerbose@sda21(r13)
/* 800CA0A8 000C5FC8  4E 80 00 20 */	blr

.global __DBExceptionDestinationAux
__DBExceptionDestinationAux:
/* 800CA0AC 000C5FCC  7C 08 02 A6 */	mflr r0
/* 800CA0B0 000C5FD0  3C 60 80 1E */	lis r3, lbl_801E7578@ha
/* 800CA0B4 000C5FD4  90 01 00 04 */	stw r0, 4(r1)
/* 800CA0B8 000C5FD8  38 63 75 78 */	addi r3, r3, lbl_801E7578@l
/* 800CA0BC 000C5FDC  4C C6 31 82 */	crclr 6
/* 800CA0C0 000C5FE0  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800CA0C4 000C5FE4  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800CA0C8 000C5FE8  80 80 00 C0 */	lwz r4, 0xc0(0)
/* 800CA0CC 000C5FEC  3F E4 80 00 */	addis r31, r4, 0x8000
/* 800CA0D0 000C5FF0  4B FF 9B 51 */	bl OSReport
/* 800CA0D4 000C5FF4  7F E3 FB 78 */	mr r3, r31
/* 800CA0D8 000C5FF8  4B FF 97 D5 */	bl OSDumpContext
/* 800CA0DC 000C5FFC  4B FF 76 5D */	bl PPCHalt
/* 800CA0E0 000C6000  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800CA0E4 000C6004  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800CA0E8 000C6008  38 21 00 18 */	addi r1, r1, 0x18
/* 800CA0EC 000C600C  7C 08 03 A6 */	mtlr r0
/* 800CA0F0 000C6010  4E 80 00 20 */	blr

.global __DBExceptionDestination
__DBExceptionDestination:
/* 800CA0F4 000C6014  7C 60 00 A6 */	mfmsr r3
/* 800CA0F8 000C6018  60 63 00 30 */	ori r3, r3, 0x30
/* 800CA0FC 000C601C  7C 60 01 24 */	mtmsr r3
/* 800CA100 000C6020  4B FF FF AC */	b __DBExceptionDestinationAux

.global __DBIsExceptionMarked
__DBIsExceptionMarked:
/* 800CA104 000C6024  80 8D A1 80 */	lwz r4, __DBInterface@sda21(r13)
/* 800CA108 000C6028  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 800CA10C 000C602C  38 60 00 01 */	li r3, 1
/* 800CA110 000C6030  80 84 00 04 */	lwz r4, 4(r4)
/* 800CA114 000C6034  7C 60 00 30 */	slw r0, r3, r0
/* 800CA118 000C6038  7C 83 00 38 */	and r3, r4, r0
/* 800CA11C 000C603C  4E 80 00 20 */	blr

.global DBPrintf
DBPrintf:
/* 800CA120 000C6040  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 800CA124 000C6044  40 86 00 24 */	bne cr1, lbl_800CA148
/* 800CA128 000C6048  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 800CA12C 000C604C  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 800CA130 000C6050  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 800CA134 000C6054  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 800CA138 000C6058  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 800CA13C 000C605C  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 800CA140 000C6060  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 800CA144 000C6064  D9 01 00 60 */	stfd f8, 0x60(r1)
lbl_800CA148:
/* 800CA148 000C6068  90 61 00 08 */	stw r3, 8(r1)
/* 800CA14C 000C606C  90 81 00 0C */	stw r4, 0xc(r1)
/* 800CA150 000C6070  90 A1 00 10 */	stw r5, 0x10(r1)
/* 800CA154 000C6074  90 C1 00 14 */	stw r6, 0x14(r1)
/* 800CA158 000C6078  90 E1 00 18 */	stw r7, 0x18(r1)
/* 800CA15C 000C607C  91 01 00 1C */	stw r8, 0x1c(r1)
/* 800CA160 000C6080  91 21 00 20 */	stw r9, 0x20(r1)
/* 800CA164 000C6084  91 41 00 24 */	stw r10, 0x24(r1)
/* 800CA168 000C6088  38 21 00 70 */	addi r1, r1, 0x70
/* 800CA16C 000C608C  4E 80 00 20 */	blr

.section .data

.global lbl_801E7578
lbl_801E7578:
	# ROM: 0x1E4578
glabel string_DBExceptionDestination_n
	.asciz "DBExceptionDestination\n"
