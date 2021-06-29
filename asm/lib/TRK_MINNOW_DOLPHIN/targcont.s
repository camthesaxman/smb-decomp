.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKTargetContinue
TRKTargetContinue:
/* 8010E0B4 00109FD4  7C 08 02 A6 */	mflr r0
/* 8010E0B8 00109FD8  38 60 00 00 */	li r3, 0
/* 8010E0BC 00109FDC  90 01 00 04 */	stw r0, 4(r1)
/* 8010E0C0 00109FE0  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010E0C4 00109FE4  4B FF F3 8D */	bl TRKTargetSetStopped
/* 8010E0C8 00109FE8  4B FF FF 99 */	bl UnreserveEXI2Port
/* 8010E0CC 00109FEC  4B FF ED 81 */	bl TRKSwapAndGo
/* 8010E0D0 00109FF0  4B FF FF 61 */	bl ReserveEXI2Port
/* 8010E0D4 00109FF4  38 60 00 00 */	li r3, 0
/* 8010E0D8 00109FF8  38 21 00 08 */	addi r1, r1, 8
/* 8010E0DC 00109FFC  80 01 00 04 */	lwz r0, 4(r1)
/* 8010E0E0 0010A000  7C 08 03 A6 */	mtlr r0
/* 8010E0E4 0010A004  4E 80 00 20 */	blr 
