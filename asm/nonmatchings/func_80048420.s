/* 80048420 00044340  7C 08 02 A6 */	mflr r0
/* 80048424 00044344  90 01 00 04 */	stw r0, 4(r1)
/* 80048428 00044348  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 8004842C 0004434C  BF 21 00 1C */	stmw r25, 0x1c(r1)
/* 80048430 00044350  7C 7A 1B 78 */	mr r26, r3
/* 80048434 00044354  3B 24 00 00 */	addi r25, r4, 0
/* 80048438 00044358  80 03 00 00 */	lwz r0, 0(r3)
/* 8004843C 0004435C  2C 00 FF FF */	cmpwi r0, -1
/* 80048440 00044360  41 82 00 E8 */	beq lbl_80048528
/* 80048444 00044364  80 1A 00 04 */	lwz r0, 4(r26)
/* 80048448 00044368  38 85 00 00 */	addi r4, r5, 0
/* 8004844C 0004436C  38 6D 9D 80 */	addi r3, r13, lbl_802F1F60  //@sda21
/* 80048450 00044370  54 00 07 F8 */	rlwinm r0, r0, 0, 0x1f, 0x1c
/* 80048454 00044374  90 1A 00 04 */	stw r0, 4(r26)
/* 80048458 00044378  38 A0 00 04 */	li r5, 4
/* 8004845C 0004437C  4B FB AF B9 */	bl memcpy
/* 80048460 00044380  3C 80 80 05 */	lis r4, lbl_8004853C@ha
/* 80048464 00044384  83 D9 00 20 */	lwz r30, 0x20(r25)
/* 80048468 00044388  3C 60 F9 00 */	lis r3, 0xF8FFFFFE@ha
/* 8004846C 0004438C  83 B9 00 24 */	lwz r29, 0x24(r25)
/* 80048470 00044390  3C A0 80 05 */	lis r5, lbl_8004863C@ha
/* 80048474 00044394  3B FA 00 18 */	addi r31, r26, 0x18
/* 80048478 00044398  3B 64 85 3C */	addi r27, r4, lbl_8004853C@l
/* 8004847C 0004439C  3B 45 86 3C */	addi r26, r5, lbl_8004863C@l
/* 80048480 000443A0  3B 83 FF FE */	addi r28, r3, 0xF8FFFFFE@l
/* 80048484 000443A4  48 00 00 98 */	b lbl_8004851C
lbl_80048488:
/* 80048488 000443A8  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 8004848C 000443AC  80 7F 00 4C */	lwz r3, 0x4c(r31)
/* 80048490 000443B0  2C 00 FF FE */	cmpwi r0, -2
/* 80048494 000443B4  3B 23 00 50 */	addi r25, r3, 0x50
/* 80048498 000443B8  7F 3F CA 14 */	add r25, r31, r25
/* 8004849C 000443BC  41 82 00 38 */	beq lbl_800484D4
/* 800484A0 000443C0  40 80 00 24 */	bge lbl_800484C4
/* 800484A4 000443C4  2C 00 FF FD */	cmpwi r0, -3
/* 800484A8 000443C8  40 80 00 08 */	bge lbl_800484B0
/* 800484AC 000443CC  48 00 00 18 */	b lbl_800484C4
lbl_800484B0:
/* 800484B0 000443D0  38 99 00 00 */	addi r4, r25, 0
/* 800484B4 000443D4  38 BA 00 00 */	addi r5, r26, 0
/* 800484B8 000443D8  38 7F 00 50 */	addi r3, r31, 0x50
/* 800484BC 000443DC  4B FF FA F1 */	bl u_apply_func_to_nl_disp_list_type_a
/* 800484C0 000443E0  48 00 00 14 */	b lbl_800484D4
lbl_800484C4:
/* 800484C4 000443E4  38 99 00 00 */	addi r4, r25, 0
/* 800484C8 000443E8  38 BB 00 00 */	addi r5, r27, 0
/* 800484CC 000443EC  38 7F 00 50 */	addi r3, r31, 0x50
/* 800484D0 000443F0  4B FF FA 05 */	bl u_apply_func_to_nl_disp_list_type_b
lbl_800484D4:
/* 800484D4 000443F4  80 7F 00 00 */	lwz r3, 0(r31)
/* 800484D8 000443F8  38 00 FF FD */	li r0, -3
/* 800484DC 000443FC  7C 63 E0 38 */	and r3, r3, r28
/* 800484E0 00044400  90 7F 00 00 */	stw r3, 0(r31)
/* 800484E4 00044404  80 7F 00 00 */	lwz r3, 0(r31)
/* 800484E8 00044408  64 63 02 00 */	oris r3, r3, 0x200
/* 800484EC 0004440C  60 63 00 08 */	ori r3, r3, 8
/* 800484F0 00044410  90 7F 00 00 */	stw r3, 0(r31)
/* 800484F4 00044414  80 7F 00 04 */	lwz r3, 4(r31)
/* 800484F8 00044418  54 63 02 90 */	rlwinm r3, r3, 0, 0xa, 8
/* 800484FC 0004441C  90 7F 00 04 */	stw r3, 4(r31)
/* 80048500 00044420  80 7F 00 04 */	lwz r3, 4(r31)
/* 80048504 00044424  64 63 02 00 */	oris r3, r3, 0x200
/* 80048508 00044428  90 7F 00 04 */	stw r3, 4(r31)
/* 8004850C 0004442C  93 DF 00 08 */	stw r30, 8(r31)
/* 80048510 00044430  93 BF 00 0C */	stw r29, 0xc(r31)
/* 80048514 00044434  90 1F 00 24 */	stw r0, 0x24(r31)
/* 80048518 00044438  7F 3F CB 78 */	mr r31, r25
lbl_8004851C:
/* 8004851C 0004443C  80 1F 00 00 */	lwz r0, 0(r31)
/* 80048520 00044440  2C 00 00 00 */	cmpwi r0, 0
/* 80048524 00044444  40 82 FF 64 */	bne lbl_80048488
lbl_80048528:
/* 80048528 00044448  BB 21 00 1C */	lmw r25, 0x1c(r1)
/* 8004852C 0004444C  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 80048530 00044450  38 21 00 38 */	addi r1, r1, 0x38
/* 80048534 00044454  7C 08 03 A6 */	mtlr r0
/* 80048538 00044458  4E 80 00 20 */	blr
