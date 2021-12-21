.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global salMalloc
salMalloc:
/* 80101278 000FD198  7C 08 02 A6 */	mflr r0
/* 8010127C 000FD19C  90 01 00 04 */	stw r0, 4(r1)
/* 80101280 000FD1A0  94 21 FF F8 */	stwu r1, -8(r1)
/* 80101284 000FD1A4  81 8D A5 4C */	lwz r12, salHooks@sda21(r13)
/* 80101288 000FD1A8  7D 88 03 A6 */	mtlr r12
/* 8010128C 000FD1AC  4E 80 00 21 */	blrl
/* 80101290 000FD1B0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80101294 000FD1B4  38 21 00 08 */	addi r1, r1, 8
/* 80101298 000FD1B8  7C 08 03 A6 */	mtlr r0
/* 8010129C 000FD1BC  4E 80 00 20 */	blr

.global salFree
salFree:
/* 801012A0 000FD1C0  7C 08 02 A6 */	mflr r0
/* 801012A4 000FD1C4  38 8D A5 4C */	addi r4, r13, salHooks@sda21
/* 801012A8 000FD1C8  90 01 00 04 */	stw r0, 4(r1)
/* 801012AC 000FD1CC  94 21 FF F8 */	stwu r1, -8(r1)
/* 801012B0 000FD1D0  81 84 00 04 */	lwz r12, 4(r4)
/* 801012B4 000FD1D4  7D 88 03 A6 */	mtlr r12
/* 801012B8 000FD1D8  4E 80 00 21 */	blrl
/* 801012BC 000FD1DC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 801012C0 000FD1E0  38 21 00 08 */	addi r1, r1, 8
/* 801012C4 000FD1E4  7C 08 03 A6 */	mtlr r0
/* 801012C8 000FD1E8  4E 80 00 20 */	blr
