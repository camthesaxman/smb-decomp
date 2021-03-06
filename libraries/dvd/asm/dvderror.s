.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __DVDStoreErrorCode
__DVDStoreErrorCode:
/* 800CEA6C 000CA98C  7C 08 02 A6 */	mflr r0
/* 800CEA70 000CA990  90 01 00 04 */	stw r0, 4(r1)
/* 800CEA74 000CA994  3C 03 FE DD */	addis r0, r3, 0xfedd
/* 800CEA78 000CA998  28 00 45 67 */	cmplwi r0, 0x4567
/* 800CEA7C 000CA99C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800CEA80 000CA9A0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800CEA84 000CA9A4  40 82 00 0C */	bne lbl_800CEA90
/* 800CEA88 000CA9A8  3B E0 00 FF */	li r31, 0xff
/* 800CEA8C 000CA9AC  48 00 01 14 */	b lbl_800CEBA0
lbl_800CEA90:
/* 800CEA90 000CA9B0  28 00 45 68 */	cmplwi r0, 0x4568
/* 800CEA94 000CA9B4  40 82 00 0C */	bne lbl_800CEAA0
/* 800CEA98 000CA9B8  3B E0 00 FE */	li r31, 0xfe
/* 800CEA9C 000CA9BC  48 00 01 04 */	b lbl_800CEBA0
lbl_800CEAA0:
/* 800CEAA0 000CA9C0  38 00 00 02 */	li r0, 2
/* 800CEAA4 000CA9C4  3C 80 80 1E */	lis r4, lbl_801E7A60@ha
/* 800CEAA8 000CA9C8  7C 09 03 A6 */	mtctr r0
/* 800CEAAC 000CA9CC  38 C4 7A 60 */	addi r6, r4, lbl_801E7A60@l
/* 800CEAB0 000CA9D0  54 64 46 3E */	srwi r4, r3, 0x18
/* 800CEAB4 000CA9D4  54 63 02 3E */	clrlwi r3, r3, 8
/* 800CEAB8 000CA9D8  38 A0 00 00 */	li r5, 0
lbl_800CEABC:
/* 800CEABC 000CA9DC  80 06 00 00 */	lwz r0, 0(r6)
/* 800CEAC0 000CA9E0  7C 03 00 40 */	cmplw r3, r0
/* 800CEAC4 000CA9E4  40 82 00 0C */	bne lbl_800CEAD0
/* 800CEAC8 000CA9E8  54 A3 06 3E */	clrlwi r3, r5, 0x18
/* 800CEACC 000CA9EC  48 00 00 BC */	b lbl_800CEB88
lbl_800CEAD0:
/* 800CEAD0 000CA9F0  84 06 00 04 */	lwzu r0, 4(r6)
/* 800CEAD4 000CA9F4  38 A5 00 01 */	addi r5, r5, 1
/* 800CEAD8 000CA9F8  7C 03 00 40 */	cmplw r3, r0
/* 800CEADC 000CA9FC  40 82 00 0C */	bne lbl_800CEAE8
/* 800CEAE0 000CAA00  54 A3 06 3E */	clrlwi r3, r5, 0x18
/* 800CEAE4 000CAA04  48 00 00 A4 */	b lbl_800CEB88
lbl_800CEAE8:
/* 800CEAE8 000CAA08  84 06 00 04 */	lwzu r0, 4(r6)
/* 800CEAEC 000CAA0C  38 A5 00 01 */	addi r5, r5, 1
/* 800CEAF0 000CAA10  7C 03 00 40 */	cmplw r3, r0
/* 800CEAF4 000CAA14  40 82 00 0C */	bne lbl_800CEB00
/* 800CEAF8 000CAA18  54 A3 06 3E */	clrlwi r3, r5, 0x18
/* 800CEAFC 000CAA1C  48 00 00 8C */	b lbl_800CEB88
lbl_800CEB00:
/* 800CEB00 000CAA20  84 06 00 04 */	lwzu r0, 4(r6)
/* 800CEB04 000CAA24  38 A5 00 01 */	addi r5, r5, 1
/* 800CEB08 000CAA28  7C 03 00 40 */	cmplw r3, r0
/* 800CEB0C 000CAA2C  40 82 00 0C */	bne lbl_800CEB18
/* 800CEB10 000CAA30  54 A3 06 3E */	clrlwi r3, r5, 0x18
/* 800CEB14 000CAA34  48 00 00 74 */	b lbl_800CEB88
lbl_800CEB18:
/* 800CEB18 000CAA38  84 06 00 04 */	lwzu r0, 4(r6)
/* 800CEB1C 000CAA3C  38 A5 00 01 */	addi r5, r5, 1
/* 800CEB20 000CAA40  7C 03 00 40 */	cmplw r3, r0
/* 800CEB24 000CAA44  40 82 00 0C */	bne lbl_800CEB30
/* 800CEB28 000CAA48  54 A3 06 3E */	clrlwi r3, r5, 0x18
/* 800CEB2C 000CAA4C  48 00 00 5C */	b lbl_800CEB88
lbl_800CEB30:
/* 800CEB30 000CAA50  84 06 00 04 */	lwzu r0, 4(r6)
/* 800CEB34 000CAA54  38 A5 00 01 */	addi r5, r5, 1
/* 800CEB38 000CAA58  7C 03 00 40 */	cmplw r3, r0
/* 800CEB3C 000CAA5C  40 82 00 0C */	bne lbl_800CEB48
/* 800CEB40 000CAA60  54 A3 06 3E */	clrlwi r3, r5, 0x18
/* 800CEB44 000CAA64  48 00 00 44 */	b lbl_800CEB88
lbl_800CEB48:
/* 800CEB48 000CAA68  84 06 00 04 */	lwzu r0, 4(r6)
/* 800CEB4C 000CAA6C  38 A5 00 01 */	addi r5, r5, 1
/* 800CEB50 000CAA70  7C 03 00 40 */	cmplw r3, r0
/* 800CEB54 000CAA74  40 82 00 0C */	bne lbl_800CEB60
/* 800CEB58 000CAA78  54 A3 06 3E */	clrlwi r3, r5, 0x18
/* 800CEB5C 000CAA7C  48 00 00 2C */	b lbl_800CEB88
lbl_800CEB60:
/* 800CEB60 000CAA80  84 06 00 04 */	lwzu r0, 4(r6)
/* 800CEB64 000CAA84  38 A5 00 01 */	addi r5, r5, 1
/* 800CEB68 000CAA88  7C 03 00 40 */	cmplw r3, r0
/* 800CEB6C 000CAA8C  40 82 00 0C */	bne lbl_800CEB78
/* 800CEB70 000CAA90  54 A3 06 3E */	clrlwi r3, r5, 0x18
/* 800CEB74 000CAA94  48 00 00 14 */	b lbl_800CEB88
lbl_800CEB78:
/* 800CEB78 000CAA98  38 C6 00 04 */	addi r6, r6, 4
/* 800CEB7C 000CAA9C  38 A5 00 01 */	addi r5, r5, 1
/* 800CEB80 000CAAA0  42 00 FF 3C */	bdnz lbl_800CEABC
/* 800CEB84 000CAAA4  38 60 00 1D */	li r3, 0x1d
lbl_800CEB88:
/* 800CEB88 000CAAA8  28 04 00 06 */	cmplwi r4, 6
/* 800CEB8C 000CAAAC  41 80 00 08 */	blt lbl_800CEB94
/* 800CEB90 000CAAB0  38 80 00 06 */	li r4, 6
lbl_800CEB94:
/* 800CEB94 000CAAB4  1C 04 00 1E */	mulli r0, r4, 0x1e
/* 800CEB98 000CAAB8  54 63 06 3E */	clrlwi r3, r3, 0x18
/* 800CEB9C 000CAABC  7F E3 02 14 */	add r31, r3, r0
lbl_800CEBA0:
/* 800CEBA0 000CAAC0  4B FF 8F D9 */	bl __OSLockSramEx
/* 800CEBA4 000CAAC4  9B E3 00 24 */	stb r31, 0x24(r3)
/* 800CEBA8 000CAAC8  38 60 00 01 */	li r3, 1
/* 800CEBAC 000CAACC  4B FF 93 55 */	bl __OSUnlockSramEx
/* 800CEBB0 000CAAD0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800CEBB4 000CAAD4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800CEBB8 000CAAD8  38 21 00 20 */	addi r1, r1, 0x20
/* 800CEBBC 000CAADC  7C 08 03 A6 */	mtlr r0
/* 800CEBC0 000CAAE0  4E 80 00 20 */	blr

.section .data

.global lbl_801E7A60
lbl_801E7A60:
	# ROM: 0x1E4A60
	.4byte 0
	.4byte 0x00023A00
	.4byte 0x00062800
	.4byte 0x00030200
	.4byte 0x00031100
	.4byte 0x00052000
	.4byte 0x00052001
	.4byte 0x00052100
	.4byte 0x00052400
	.4byte 0x00052401
	.4byte 0x00052402
	.4byte 0x000B5A01
	.4byte 0x00056300
	.4byte 0x00020401
	.4byte 0x00020400
	.4byte 0x00040800
