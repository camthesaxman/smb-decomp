.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKInitializeDispatcher
TRKInitializeDispatcher:
/* 8010A828 00106748  3C 60 80 2F */	lis r3, gTRKDispatchTableSize@ha
/* 8010A82C 0010674C  38 00 00 20 */	li r0, 0x20
/* 8010A830 00106750  90 03 FC 38 */	stw r0, gTRKDispatchTableSize@l(r3)
/* 8010A834 00106754  38 60 00 00 */	li r3, 0
/* 8010A838 00106758  4E 80 00 20 */	blr

.global TRKDispatchMessage
TRKDispatchMessage:
/* 8010A83C 0010675C  7C 08 02 A6 */	mflr r0
/* 8010A840 00106760  38 80 00 00 */	li r4, 0
/* 8010A844 00106764  90 01 00 04 */	stw r0, 4(r1)
/* 8010A848 00106768  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A84C 0010676C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A850 00106770  3B E0 05 00 */	li r31, 0x500
/* 8010A854 00106774  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A858 00106778  3B C3 00 00 */	addi r30, r3, 0
/* 8010A85C 0010677C  4B FF F7 A9 */	bl TRKSetBufferPosition
/* 8010A860 00106780  38 7E 00 00 */	addi r3, r30, 0
/* 8010A864 00106784  38 81 00 08 */	addi r4, r1, 8
/* 8010A868 00106788  4B FF FB 21 */	bl TRKReadBuffer1_ui8
/* 8010A86C 0010678C  3C 60 80 2F */	lis r3, gTRKDispatchTableSize@ha
/* 8010A870 00106790  88 81 00 08 */	lbz r4, 8(r1)
/* 8010A874 00106794  80 03 FC 38 */	lwz r0, gTRKDispatchTableSize@l(r3)
/* 8010A878 00106798  7C 04 00 40 */	cmplw r4, r0
/* 8010A87C 0010679C  40 80 00 28 */	bge lbl_8010A8A4
/* 8010A880 001067A0  3C 60 80 1F */	lis r3, lbl_801ED7A8@ha
/* 8010A884 001067A4  54 84 10 3A */	slwi r4, r4, 2
/* 8010A888 001067A8  38 03 D7 A8 */	addi r0, r3, lbl_801ED7A8@l
/* 8010A88C 001067AC  7C 60 22 14 */	add r3, r0, r4
/* 8010A890 001067B0  81 83 00 00 */	lwz r12, 0(r3)
/* 8010A894 001067B4  38 7E 00 00 */	addi r3, r30, 0
/* 8010A898 001067B8  7D 88 03 A6 */	mtlr r12
/* 8010A89C 001067BC  4E 80 00 21 */	blrl
/* 8010A8A0 001067C0  7C 7F 1B 78 */	mr r31, r3
lbl_8010A8A4:
/* 8010A8A4 001067C4  7F E3 FB 78 */	mr r3, r31
/* 8010A8A8 001067C8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A8AC 001067CC  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A8B0 001067D0  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A8B4 001067D4  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A8B8 001067D8  7C 08 03 A6 */	mtlr r0
/* 8010A8BC 001067DC  4E 80 00 20 */	blr

.section .data

.global lbl_801ED7A8
lbl_801ED7A8:
	# ROM: 0x1EA7A8
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoConnect  ;# ptr
	.4byte TRKDoDisconnect  ;# ptr
	.4byte TRKDoReset  ;# ptr
	.4byte TRKDoVersions  ;# ptr
	.4byte TRKDoSupportmedia  ;# ptr
	.4byte TRKDoCPUType  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoReadMemory  ;# ptr
	.4byte TRKDoWriteMemory  ;# ptr
	.4byte TRKDoReadRegisters  ;# ptr
	.4byte TRKDoWriteRegisters  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoFlushCache  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoContinue  ;# ptr
	.4byte TRKDoStep  ;# ptr
	.4byte TRKDoStop  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte TRKDoUnsupported  ;# ptr
	.4byte 0
	.4byte 0

.section .bss

.global gTRKDispatchTableSize
gTRKDispatchTableSize:
	.skip 0x8
