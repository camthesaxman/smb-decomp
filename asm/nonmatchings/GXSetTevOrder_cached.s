/* 8009EFF4 0009AF14  7C 08 02 A6 */	mflr r0
/* 8009EFF8 0009AF18  90 01 00 04 */	stw r0, 4(r1)
/* 8009EFFC 0009AF1C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8009F000 0009AF20  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 8009F004 0009AF24  3B 85 00 00 */	addi r28, r5, 0
/* 8009F008 0009AF28  54 65 20 36 */	slwi r5, r3, 4
/* 8009F00C 0009AF2C  2C 1C 00 08 */	cmpwi r28, 8
/* 8009F010 0009AF30  3B E5 05 80 */	addi r31, r5, 0x580
/* 8009F014 0009AF34  3B 64 00 00 */	addi r27, r4, 0
/* 8009F018 0009AF38  3B A6 00 00 */	addi r29, r6, 0
/* 8009F01C 0009AF3C  80 ED 9F C0 */	lwz r7, gxCache     // @sda21(r13)
/* 8009F020 0009AF40  7F E7 FA 14 */	add r31, r7, r31
/* 8009F024 0009AF44  41 80 00 58 */	blt lbl_8009F07C
/* 8009F028 0009AF48  80 1F 00 00 */	lwz r0, 0(r31)
/* 8009F02C 0009AF4C  7C 00 D8 00 */	cmpw r0, r27
/* 8009F030 0009AF50  40 82 00 1C */	bne lbl_8009F04C
/* 8009F034 0009AF54  80 1F 00 04 */	lwz r0, 4(r31)
/* 8009F038 0009AF58  2C 00 00 FF */	cmpwi r0, 0xff
/* 8009F03C 0009AF5C  40 82 00 10 */	bne lbl_8009F04C
/* 8009F040 0009AF60  80 1F 00 08 */	lwz r0, 8(r31)
/* 8009F044 0009AF64  7C 00 E8 00 */	cmpw r0, r29
/* 8009F048 0009AF68  41 82 00 B0 */	beq lbl_8009F0F8
lbl_8009F04C:
/* 8009F04C 0009AF6C  38 9B 00 00 */	addi r4, r27, 0
/* 8009F050 0009AF70  38 BC 00 00 */	addi r5, r28, 0
/* 8009F054 0009AF74  38 DD 00 00 */	addi r6, r29, 0
/* 8009F058 0009AF78  48 04 39 71 */	bl GXSetTevOrder
/* 8009F05C 0009AF7C  93 7F 00 00 */	stw r27, 0(r31)
/* 8009F060 0009AF80  38 60 00 FF */	li r3, 0xff
/* 8009F064 0009AF84  38 00 00 00 */	li r0, 0
/* 8009F068 0009AF88  90 7F 00 04 */	stw r3, 4(r31)
/* 8009F06C 0009AF8C  93 BF 00 08 */	stw r29, 8(r31)
/* 8009F070 0009AF90  B0 1F 00 0C */	sth r0, 0xc(r31)
/* 8009F074 0009AF94  B0 1F 00 0E */	sth r0, 0xe(r31)
/* 8009F078 0009AF98  48 00 00 80 */	b lbl_8009F0F8
lbl_8009F07C:
/* 8009F07C 0009AF9C  80 1F 00 00 */	lwz r0, 0(r31)
/* 8009F080 0009AFA0  57 84 10 3A */	slwi r4, r28, 2
/* 8009F084 0009AFA4  3B C4 07 12 */	addi r30, r4, 0x712
/* 8009F088 0009AFA8  7C 00 D8 00 */	cmpw r0, r27
/* 8009F08C 0009AFAC  7F C7 F2 14 */	add r30, r7, r30
/* 8009F090 0009AFB0  40 82 00 3C */	bne lbl_8009F0CC
/* 8009F094 0009AFB4  80 1F 00 04 */	lwz r0, 4(r31)
/* 8009F098 0009AFB8  7C 00 E0 00 */	cmpw r0, r28
/* 8009F09C 0009AFBC  40 82 00 30 */	bne lbl_8009F0CC
/* 8009F0A0 0009AFC0  80 1F 00 08 */	lwz r0, 8(r31)
/* 8009F0A4 0009AFC4  7C 00 E8 00 */	cmpw r0, r29
/* 8009F0A8 0009AFC8  40 82 00 24 */	bne lbl_8009F0CC
/* 8009F0AC 0009AFCC  A0 9F 00 0C */	lhz r4, 0xc(r31)
/* 8009F0B0 0009AFD0  A0 1E 00 00 */	lhz r0, 0(r30)
/* 8009F0B4 0009AFD4  7C 04 00 40 */	cmplw r4, r0
/* 8009F0B8 0009AFD8  40 82 00 14 */	bne lbl_8009F0CC
/* 8009F0BC 0009AFDC  A0 9F 00 0E */	lhz r4, 0xe(r31)
/* 8009F0C0 0009AFE0  A0 1E 00 02 */	lhz r0, 2(r30)
/* 8009F0C4 0009AFE4  7C 04 00 40 */	cmplw r4, r0
/* 8009F0C8 0009AFE8  41 82 00 30 */	beq lbl_8009F0F8
lbl_8009F0CC:
/* 8009F0CC 0009AFEC  38 9B 00 00 */	addi r4, r27, 0
/* 8009F0D0 0009AFF0  38 BC 00 00 */	addi r5, r28, 0
/* 8009F0D4 0009AFF4  38 DD 00 00 */	addi r6, r29, 0
/* 8009F0D8 0009AFF8  48 04 38 F1 */	bl GXSetTevOrder
/* 8009F0DC 0009AFFC  93 7F 00 00 */	stw r27, 0(r31)
/* 8009F0E0 0009B000  93 9F 00 04 */	stw r28, 4(r31)
/* 8009F0E4 0009B004  93 BF 00 08 */	stw r29, 8(r31)
/* 8009F0E8 0009B008  A0 1E 00 00 */	lhz r0, 0(r30)
/* 8009F0EC 0009B00C  B0 1F 00 0C */	sth r0, 0xc(r31)
/* 8009F0F0 0009B010  A0 1E 00 02 */	lhz r0, 2(r30)
/* 8009F0F4 0009B014  B0 1F 00 0E */	sth r0, 0xe(r31)
lbl_8009F0F8:
/* 8009F0F8 0009B018  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 8009F0FC 0009B01C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8009F100 0009B020  38 21 00 30 */	addi r1, r1, 0x30
/* 8009F104 0009B024  7C 08 03 A6 */	mtlr r0
/* 8009F108 0009B028  4E 80 00 20 */	blr