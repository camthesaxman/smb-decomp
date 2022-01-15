.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRK_main
TRK_main:
/* 8010DD14 00109C34  7C 08 02 A6 */	mflr r0
/* 8010DD18 00109C38  90 01 00 04 */	stw r0, 4(r1)
/* 8010DD1C 00109C3C  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010DD20 00109C40  4B FF BF 39 */	bl TRKInitializeNub
/* 8010DD24 00109C44  3C 80 80 2F */	lis r4, TRK_mainError@ha
/* 8010DD28 00109C48  94 64 01 C0 */	stwu r3, TRK_mainError@l(r4)
/* 8010DD2C 00109C4C  80 04 00 00 */	lwz r0, 0(r4)
/* 8010DD30 00109C50  2C 00 00 00 */	cmpwi r0, 0
/* 8010DD34 00109C54  40 82 00 0C */	bne lbl_8010DD40
/* 8010DD38 00109C58  4B FF C0 19 */	bl TRKNubWelcome
/* 8010DD3C 00109C5C  4B FF BB CD */	bl TRKNubMainLoop
lbl_8010DD40:
/* 8010DD40 00109C60  4B FF BF ED */	bl TRKTerminateNub
/* 8010DD44 00109C64  3C 80 80 2F */	lis r4, TRK_mainError@ha
/* 8010DD48 00109C68  90 64 01 C0 */	stw r3, TRK_mainError@l(r4)
/* 8010DD4C 00109C6C  38 21 00 08 */	addi r1, r1, 8
/* 8010DD50 00109C70  80 01 00 04 */	lwz r0, 4(r1)
/* 8010DD54 00109C74  7C 08 03 A6 */	mtlr r0
/* 8010DD58 00109C78  4E 80 00 20 */	blr

.section .bss

.global TRK_mainError
TRK_mainError:
	.skip 0x8
