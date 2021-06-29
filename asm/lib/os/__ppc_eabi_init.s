.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __init_user
__init_user:
/* 800C9FF0 000C5F10  7C 08 02 A6 */	mflr r0
/* 800C9FF4 000C5F14  90 01 00 04 */	stw r0, 4(r1)
/* 800C9FF8 000C5F18  94 21 FF F8 */	stwu r1, -8(r1)
/* 800C9FFC 000C5F1C  48 00 00 15 */	bl __init_cpp
/* 800CA000 000C5F20  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800CA004 000C5F24  38 21 00 08 */	addi r1, r1, 8
/* 800CA008 000C5F28  7C 08 03 A6 */	mtlr r0
/* 800CA00C 000C5F2C  4E 80 00 20 */	blr 

.global __init_cpp
__init_cpp:
/* 800CA010 000C5F30  7C 08 02 A6 */	mflr r0
/* 800CA014 000C5F34  90 01 00 04 */	stw r0, 4(r1)
/* 800CA018 000C5F38  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800CA01C 000C5F3C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800CA020 000C5F40  3C 60 80 11 */	lis r3, __init_cpp_exceptions_reference@ha
/* 800CA024 000C5F44  38 03 F8 60 */	addi r0, r3, __init_cpp_exceptions_reference@l
/* 800CA028 000C5F48  7C 1F 03 78 */	mr r31, r0
/* 800CA02C 000C5F4C  48 00 00 04 */	b lbl_800CA030
lbl_800CA030:
/* 800CA030 000C5F50  48 00 00 04 */	b lbl_800CA034
lbl_800CA034:
/* 800CA034 000C5F54  48 00 00 10 */	b lbl_800CA044
lbl_800CA038:
/* 800CA038 000C5F58  7D 88 03 A6 */	mtlr r12
/* 800CA03C 000C5F5C  4E 80 00 21 */	blrl 
/* 800CA040 000C5F60  3B FF 00 04 */	addi r31, r31, 4
lbl_800CA044:
/* 800CA044 000C5F64  81 9F 00 00 */	lwz r12, 0(r31)
/* 800CA048 000C5F68  28 0C 00 00 */	cmplwi r12, 0
/* 800CA04C 000C5F6C  40 82 FF EC */	bne lbl_800CA038
/* 800CA050 000C5F70  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800CA054 000C5F74  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800CA058 000C5F78  38 21 00 10 */	addi r1, r1, 0x10
/* 800CA05C 000C5F7C  7C 08 03 A6 */	mtlr r0
/* 800CA060 000C5F80  4E 80 00 20 */	blr 

.global _ExitProcess
_ExitProcess:
/* 800CA064 000C5F84  7C 08 02 A6 */	mflr r0
/* 800CA068 000C5F88  90 01 00 04 */	stw r0, 4(r1)
/* 800CA06C 000C5F8C  94 21 FF F8 */	stwu r1, -8(r1)
/* 800CA070 000C5F90  4B FF 76 C9 */	bl PPCHalt
/* 800CA074 000C5F94  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800CA078 000C5F98  38 21 00 08 */	addi r1, r1, 8
/* 800CA07C 000C5F9C  7C 08 03 A6 */	mtlr r0
/* 800CA080 000C5FA0  4E 80 00 20 */	blr 
