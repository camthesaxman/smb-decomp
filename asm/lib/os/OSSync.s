.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __OSSystemCallVectorStart
__OSSystemCallVectorStart:
/* 800C8AFC 000C4A1C  7D 30 FA A6 */	mfspr r9, 0x3f0
/* 800C8B00 000C4A20  61 2A 00 08 */	ori r10, r9, 8
/* 800C8B04 000C4A24  7D 50 FB A6 */	mtspr 0x3f0, r10
/* 800C8B08 000C4A28  4C 00 01 2C */	isync 
/* 800C8B0C 000C4A2C  7C 00 04 AC */	sync 0
/* 800C8B10 000C4A30  7D 30 FB A6 */	mtspr 0x3f0, r9
/* 800C8B14 000C4A34  4C 00 00 64 */	rfi 

.global __OSSystemCallVectorEnd
__OSSystemCallVectorEnd:
/* 800C8B18 000C4A38  60 00 00 00 */	nop 

.global __OSInitSystemCall
__OSInitSystemCall:
/* 800C8B1C 000C4A3C  7C 08 02 A6 */	mflr r0
/* 800C8B20 000C4A40  90 01 00 04 */	stw r0, 4(r1)
/* 800C8B24 000C4A44  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800C8B28 000C4A48  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800C8B2C 000C4A4C  3C A0 80 00 */	lis r5, 0x80000C00@ha
/* 800C8B30 000C4A50  3C 80 80 0D */	lis r4, __OSSystemCallVectorStart@ha
/* 800C8B34 000C4A54  3C 60 80 0D */	lis r3, __OSSystemCallVectorEnd@ha
/* 800C8B38 000C4A58  3B E5 0C 00 */	addi r31, r5, 0x80000C00@l
/* 800C8B3C 000C4A5C  38 03 8B 18 */	addi r0, r3, __OSSystemCallVectorEnd@l
/* 800C8B40 000C4A60  38 84 8A FC */	addi r4, r4, __OSSystemCallVectorStart@l
/* 800C8B44 000C4A64  7F E3 FB 78 */	mr r3, r31
/* 800C8B48 000C4A68  7C A4 00 50 */	subf r5, r4, r0
/* 800C8B4C 000C4A6C  4B F3 A8 C9 */	bl memcpy
/* 800C8B50 000C4A70  7F E3 FB 78 */	mr r3, r31
/* 800C8B54 000C4A74  38 80 01 00 */	li r4, 0x100
/* 800C8B58 000C4A78  4B FF A4 71 */	bl DCFlushRangeNoSync
/* 800C8B5C 000C4A7C  7C 00 04 AC */	sync 0
/* 800C8B60 000C4A80  7F E3 FB 78 */	mr r3, r31
/* 800C8B64 000C4A84  38 80 01 00 */	li r4, 0x100
/* 800C8B68 000C4A88  4B FF A4 C1 */	bl ICInvalidateRange
/* 800C8B6C 000C4A8C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800C8B70 000C4A90  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800C8B74 000C4A94  38 21 00 10 */	addi r1, r1, 0x10
/* 800C8B78 000C4A98  7C 08 03 A6 */	mtlr r0
/* 800C8B7C 000C4A9C  4E 80 00 20 */	blr 
