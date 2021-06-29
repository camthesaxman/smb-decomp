.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKMessageSend
TRKMessageSend:
/* 80109DEC 00105D0C  7C 08 02 A6 */	mflr r0
/* 80109DF0 00105D10  90 01 00 04 */	stw r0, 4(r1)
/* 80109DF4 00105D14  94 21 FF F8 */	stwu r1, -8(r1)
/* 80109DF8 00105D18  80 83 00 08 */	lwz r4, 8(r3)
/* 80109DFC 00105D1C  38 63 00 10 */	addi r3, r3, 0x10
/* 80109E00 00105D20  48 00 41 ED */	bl TRKWriteUARTN
/* 80109E04 00105D24  38 21 00 08 */	addi r1, r1, 8
/* 80109E08 00105D28  80 01 00 04 */	lwz r0, 4(r1)
/* 80109E0C 00105D2C  7C 08 03 A6 */	mtlr r0
/* 80109E10 00105D30  4E 80 00 20 */	blr 
