.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __destroy_global_chain
__destroy_global_chain:
/* 801034B4 000FF3D4  7C 08 02 A6 */	mflr r0
/* 801034B8 000FF3D8  90 01 00 04 */	stw r0, 4(r1)
/* 801034BC 000FF3DC  94 21 FF F8 */	stwu r1, -8(r1)
/* 801034C0 000FF3E0  48 00 00 20 */	b lbl_801034E0
lbl_801034C4:
/* 801034C4 000FF3E4  80 03 00 00 */	lwz r0, 0(r3)
/* 801034C8 000FF3E8  38 80 FF FF */	li r4, -1
/* 801034CC 000FF3EC  90 0D A5 C8 */	stw r0, __global_destructor_chain-_SDA_BASE_(r13)
/* 801034D0 000FF3F0  81 83 00 04 */	lwz r12, 4(r3)
/* 801034D4 000FF3F4  80 63 00 08 */	lwz r3, 8(r3)
/* 801034D8 000FF3F8  7D 88 03 A6 */	mtlr r12
/* 801034DC 000FF3FC  4E 80 00 21 */	blrl 
lbl_801034E0:
/* 801034E0 000FF400  80 6D A5 C8 */	lwz r3, __global_destructor_chain-_SDA_BASE_(r13)
/* 801034E4 000FF404  28 03 00 00 */	cmplwi r3, 0
/* 801034E8 000FF408  40 82 FF DC */	bne lbl_801034C4
/* 801034EC 000FF40C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 801034F0 000FF410  38 21 00 08 */	addi r1, r1, 8
/* 801034F4 000FF414  7C 08 03 A6 */	mtlr r0
/* 801034F8 000FF418  4E 80 00 20 */	blr 
