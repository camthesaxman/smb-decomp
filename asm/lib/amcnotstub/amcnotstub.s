.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global AMC_IsStub
AMC_IsStub:
/* 8010F84C 0010B76C  38 60 00 00 */	li r3, 0
/* 8010F850 0010B770  4E 80 00 20 */	blr

.global Hu_IsStub
Hu_IsStub:
/* 8010F854 0010B774  38 60 00 00 */	li r3, 0
/* 8010F858 0010B778  4E 80 00 20 */	blr
/* 8010F85C 0010B77C  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
