.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global tolower
tolower:
/* 801044B8 001003D8  2C 03 FF FF */	cmpwi r3, -1
/* 801044BC 001003DC  40 82 00 0C */	bne lbl_801044C8
/* 801044C0 001003E0  38 60 FF FF */	li r3, -1
/* 801044C4 001003E4  4E 80 00 20 */	blr 
lbl_801044C8:
/* 801044C8 001003E8  3C 80 80 17 */	lis r4, lbl_80171F60@ha
/* 801044CC 001003EC  54 63 06 3E */	clrlwi r3, r3, 0x18
/* 801044D0 001003F0  38 04 1F 60 */	addi r0, r4, lbl_80171F60@l
/* 801044D4 001003F4  7C 60 1A 14 */	add r3, r0, r3
/* 801044D8 001003F8  88 63 00 00 */	lbz r3, 0(r3)
/* 801044DC 001003FC  4E 80 00 20 */	blr 
