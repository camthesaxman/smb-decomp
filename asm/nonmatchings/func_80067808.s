/* 80067808 00063728  7C 08 02 A6 */	mflr r0
/* 8006780C 0006372C  3C 60 80 1F */	lis r3, modeCtrl@ha
/* 80067810 00063730  90 01 00 04 */	stw r0, 4(r1)
/* 80067814 00063734  38 63 EC 20 */	addi r3, r3, modeCtrl@l
/* 80067818 00063738  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 8006781C 0006373C  BF 21 00 2C */	stmw r25, 0x2c(r1)
/* 80067820 00063740  3B C3 00 2C */	addi r30, r3, 0x2c
/* 80067824 00063744  3B A3 00 28 */	addi r29, r3, 0x28
/* 80067828 00063748  80 03 00 28 */	lwz r0, 0x28(r3)
/* 8006782C 0006374C  3C 60 80 28 */	lis r3, lbl_8027CC58@ha
/* 80067830 00063750  83 7E 00 00 */	lwz r27, 0(r30)
/* 80067834 00063754  3B E3 CC 58 */	addi r31, r3, lbl_8027CC58@l
/* 80067838 00063758  2C 00 00 00 */	cmpwi r0, 0
/* 8006783C 0006375C  40 82 00 08 */	bne lbl_80067844
/* 80067840 00063760  4B FA F9 21 */	bl get_next_player
lbl_80067844:
/* 80067844 00063764  1C 1B 00 6C */	mulli r0, r27, 0x6c
/* 80067848 00063768  3C 60 80 1F */	lis r3, infoWork@ha
/* 8006784C 0006376C  38 63 3A 58 */	addi r3, r3, infoWork@l
/* 80067850 00063770  3B 63 00 20 */	addi r27, r3, 0x20
/* 80067854 00063774  7F 9F 02 14 */	add r28, r31, r0
/* 80067858 00063778  A8 63 00 20 */	lha r3, 0x20(r3)
/* 8006785C 0006377C  80 1C 00 00 */	lwz r0, 0(r28)
/* 80067860 00063780  7C 03 00 00 */	cmpw r3, r0
/* 80067864 00063784  40 82 00 94 */	bne lbl_800678F8
/* 80067868 00063788  80 1D 00 00 */	lwz r0, 0(r29)
/* 8006786C 0006378C  83 7E 00 00 */	lwz r27, 0(r30)
/* 80067870 00063790  2C 00 00 00 */	cmpwi r0, 0
/* 80067874 00063794  40 82 00 0C */	bne lbl_80067880
/* 80067878 00063798  4B FA F8 E9 */	bl get_next_player
/* 8006787C 0006379C  48 00 00 08 */	b lbl_80067884
lbl_80067880:
/* 80067880 000637A0  7F 63 DB 78 */	mr r3, r27
lbl_80067884:
/* 80067884 000637A4  1C 03 00 6C */	mulli r0, r3, 0x6c
/* 80067888 000637A8  7C 1B 18 00 */	cmpw r27, r3
/* 8006788C 000637AC  7C 7F 02 14 */	add r3, r31, r0
/* 80067890 000637B0  40 82 00 24 */	bne lbl_800678B4
/* 80067894 000637B4  1C 1B 00 6C */	mulli r0, r27, 0x6c
/* 80067898 000637B8  7C 7F 02 14 */	add r3, r31, r0
/* 8006789C 000637BC  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800678A0 000637C0  3C 60 80 1F */	lis r3, infoWork@ha
/* 800678A4 000637C4  38 63 3A 58 */	addi r3, r3, infoWork@l
/* 800678A8 000637C8  7C 00 07 34 */	extsh r0, r0
/* 800678AC 000637CC  B0 03 00 32 */	sth r0, 0x32(r3)
/* 800678B0 000637D0  48 00 02 10 */	b lbl_80067AC0
lbl_800678B4:
/* 800678B4 000637D4  A8 03 00 22 */	lha r0, 0x22(r3)
/* 800678B8 000637D8  2C 00 FF FF */	cmpwi r0, -1
/* 800678BC 000637DC  40 82 00 1C */	bne lbl_800678D8
/* 800678C0 000637E0  80 03 00 04 */	lwz r0, 4(r3)
/* 800678C4 000637E4  3C 60 80 1F */	lis r3, infoWork@ha
/* 800678C8 000637E8  38 63 3A 58 */	addi r3, r3, infoWork@l
/* 800678CC 000637EC  7C 00 07 34 */	extsh r0, r0
/* 800678D0 000637F0  B0 03 00 32 */	sth r0, 0x32(r3)
/* 800678D4 000637F4  48 00 01 EC */	b lbl_80067AC0
lbl_800678D8:
/* 800678D8 000637F8  54 00 18 38 */	slwi r0, r0, 3
/* 800678DC 000637FC  7C 63 02 14 */	add r3, r3, r0
/* 800678E0 00063800  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800678E4 00063804  3C 60 80 1F */	lis r3, infoWork@ha
/* 800678E8 00063808  38 63 3A 58 */	addi r3, r3, infoWork@l
/* 800678EC 0006380C  7C 00 07 34 */	extsh r0, r0
/* 800678F0 00063810  B0 03 00 32 */	sth r0, 0x32(r3)
/* 800678F4 00063814  48 00 01 CC */	b lbl_80067AC0
lbl_800678F8:
/* 800678F8 00063818  3B 40 00 01 */	li r26, 1
/* 800678FC 0006381C  3B 3C 00 24 */	addi r25, r28, 0x24
lbl_80067900:
/* 80067900 00063820  80 19 00 00 */	lwz r0, 0(r25)
/* 80067904 00063824  2C 00 00 00 */	cmpwi r0, 0
/* 80067908 00063828  41 82 00 14 */	beq lbl_8006791C
/* 8006790C 0006382C  38 99 00 00 */	addi r4, r25, 0
/* 80067910 00063830  38 79 00 24 */	addi r3, r25, 0x24
/* 80067914 00063834  38 A0 00 24 */	li r5, 0x24
/* 80067918 00063838  4B F9 BA FD */	bl memcpy
lbl_8006791C:
/* 8006791C 0006383C  37 5A FF FF */	addic. r26, r26, -1
/* 80067920 00063840  3B 39 FF DC */	addi r25, r25, -36
/* 80067924 00063844  40 80 FF DC */	bge lbl_80067900
/* 80067928 00063848  A8 7B 00 00 */	lha r3, 0(r27)
/* 8006792C 0006384C  38 E0 00 00 */	li r7, 0
/* 80067930 00063850  38 00 FF FF */	li r0, -1
/* 80067934 00063854  90 7C 00 00 */	stw r3, 0(r28)
/* 80067938 00063858  7F 86 E3 78 */	mr r6, r28
/* 8006793C 0006385C  A8 6D 9D 78 */	lha r3, currStageId  //@sda21(r13)
/* 80067940 00063860  90 7C 00 04 */	stw r3, 4(r28)
/* 80067944 00063864  90 FC 00 08 */	stw r7, 8(r28)
/* 80067948 00063868  90 1C 00 0C */	stw r0, 0xc(r28)
/* 8006794C 0006386C  90 FC 00 10 */	stw r7, 0x10(r28)
/* 80067950 00063870  90 1C 00 14 */	stw r0, 0x14(r28)
/* 80067954 00063874  90 FC 00 18 */	stw r7, 0x18(r28)
/* 80067958 00063878  90 1C 00 1C */	stw r0, 0x1c(r28)
/* 8006795C 0006387C  81 0D 9D B8 */	lwz r8, lbl_802F1F98  //@sda21(r13)
/* 80067960 00063880  48 00 00 B0 */	b lbl_80067A10
lbl_80067964:
/* 80067964 00063884  28 03 00 02 */	cmplwi r3, 2
/* 80067968 00063888  40 82 00 10 */	bne lbl_80067978
/* 8006796C 0006388C  88 08 00 01 */	lbz r0, 1(r8)
/* 80067970 00063890  28 00 00 00 */	cmplwi r0, 0
/* 80067974 00063894  41 82 00 B0 */	beq lbl_80067A24
lbl_80067978:
/* 80067978 00063898  28 03 00 01 */	cmplwi r3, 1
/* 8006797C 0006389C  40 82 00 90 */	bne lbl_80067A0C
/* 80067980 000638A0  88 08 00 01 */	lbz r0, 1(r8)
/* 80067984 000638A4  2C 00 00 00 */	cmpwi r0, 0
/* 80067988 000638A8  41 82 00 14 */	beq lbl_8006799C
/* 8006798C 000638AC  41 80 00 10 */	blt lbl_8006799C
/* 80067990 000638B0  2C 00 00 03 */	cmpwi r0, 3
/* 80067994 000638B4  40 80 00 08 */	bge lbl_8006799C
/* 80067998 000638B8  48 00 00 60 */	b lbl_800679F8
lbl_8006799C:
/* 8006799C 000638BC  A8 7B 00 00 */	lha r3, 0(r27)
/* 800679A0 000638C0  38 80 FF FF */	li r4, -1
/* 800679A4 000638C4  80 08 00 04 */	lwz r0, 4(r8)
/* 800679A8 000638C8  7C 03 02 14 */	add r0, r3, r0
/* 800679AC 000638CC  90 06 00 08 */	stw r0, 8(r6)
/* 800679B0 000638D0  80 A8 00 04 */	lwz r5, 4(r8)
/* 800679B4 000638D4  80 6D 9D B8 */	lwz r3, lbl_802F1F98  //@sda21(r13)
/* 800679B8 000638D8  48 00 00 2C */	b lbl_800679E4
lbl_800679BC:
/* 800679BC 000638DC  28 00 00 02 */	cmplwi r0, 2
/* 800679C0 000638E0  40 82 00 20 */	bne lbl_800679E0
/* 800679C4 000638E4  88 03 00 01 */	lbz r0, 1(r3)
/* 800679C8 000638E8  28 00 00 00 */	cmplwi r0, 0
/* 800679CC 000638EC  40 82 00 14 */	bne lbl_800679E0
/* 800679D0 000638F0  34 A5 FF FF */	addic. r5, r5, -1
/* 800679D4 000638F4  41 81 00 0C */	bgt lbl_800679E0
/* 800679D8 000638F8  80 83 00 04 */	lwz r4, 4(r3)
/* 800679DC 000638FC  48 00 00 14 */	b lbl_800679F0
lbl_800679E0:
/* 800679E0 00063900  38 63 00 1C */	addi r3, r3, 0x1c
lbl_800679E4:
/* 800679E4 00063904  88 03 00 00 */	lbz r0, 0(r3)
/* 800679E8 00063908  28 00 00 03 */	cmplwi r0, 3
/* 800679EC 0006390C  40 82 FF D0 */	bne lbl_800679BC
lbl_800679F0:
/* 800679F0 00063910  90 86 00 0C */	stw r4, 0xc(r6)
/* 800679F4 00063914  48 00 00 10 */	b lbl_80067A04
lbl_800679F8:
/* 800679F8 00063918  38 00 FF FF */	li r0, -1
/* 800679FC 0006391C  90 06 00 08 */	stw r0, 8(r6)
/* 80067A00 00063920  90 06 00 0C */	stw r0, 0xc(r6)
lbl_80067A04:
/* 80067A04 00063924  38 C6 00 08 */	addi r6, r6, 8
/* 80067A08 00063928  38 E7 00 01 */	addi r7, r7, 1
lbl_80067A0C:
/* 80067A0C 0006392C  39 08 00 1C */	addi r8, r8, 0x1c
lbl_80067A10:
/* 80067A10 00063930  2C 07 00 03 */	cmpwi r7, 3
/* 80067A14 00063934  40 80 00 10 */	bge lbl_80067A24
/* 80067A18 00063938  88 68 00 00 */	lbz r3, 0(r8)
/* 80067A1C 0006393C  28 03 00 03 */	cmplwi r3, 3
/* 80067A20 00063940  40 82 FF 44 */	bne lbl_80067964
lbl_80067A24:
/* 80067A24 00063944  7C E0 07 34 */	extsh r0, r7
/* 80067A28 00063948  B0 1C 00 20 */	sth r0, 0x20(r28)
/* 80067A2C 0006394C  38 00 FF FF */	li r0, -1
/* 80067A30 00063950  B0 1C 00 22 */	sth r0, 0x22(r28)
/* 80067A34 00063954  80 1D 00 00 */	lwz r0, 0(r29)
/* 80067A38 00063958  83 7E 00 00 */	lwz r27, 0(r30)
/* 80067A3C 0006395C  2C 00 00 00 */	cmpwi r0, 0
/* 80067A40 00063960  40 82 00 0C */	bne lbl_80067A4C
/* 80067A44 00063964  4B FA F7 1D */	bl get_next_player
/* 80067A48 00063968  48 00 00 08 */	b lbl_80067A50
lbl_80067A4C:
/* 80067A4C 0006396C  7F 63 DB 78 */	mr r3, r27
lbl_80067A50:
/* 80067A50 00063970  1C 03 00 6C */	mulli r0, r3, 0x6c
/* 80067A54 00063974  7C 1B 18 00 */	cmpw r27, r3
/* 80067A58 00063978  7C 7F 02 14 */	add r3, r31, r0
/* 80067A5C 0006397C  40 82 00 24 */	bne lbl_80067A80
/* 80067A60 00063980  1C 1B 00 6C */	mulli r0, r27, 0x6c
/* 80067A64 00063984  7C 7F 02 14 */	add r3, r31, r0
/* 80067A68 00063988  80 03 00 0C */	lwz r0, 0xc(r3)
/* 80067A6C 0006398C  3C 60 80 1F */	lis r3, infoWork@ha
/* 80067A70 00063990  38 63 3A 58 */	addi r3, r3, infoWork@l
/* 80067A74 00063994  7C 00 07 34 */	extsh r0, r0
/* 80067A78 00063998  B0 03 00 32 */	sth r0, 0x32(r3)
/* 80067A7C 0006399C  48 00 00 44 */	b lbl_80067AC0
lbl_80067A80:
/* 80067A80 000639A0  A8 03 00 22 */	lha r0, 0x22(r3)
/* 80067A84 000639A4  2C 00 FF FF */	cmpwi r0, -1
/* 80067A88 000639A8  40 82 00 1C */	bne lbl_80067AA4
/* 80067A8C 000639AC  80 03 00 04 */	lwz r0, 4(r3)
/* 80067A90 000639B0  3C 60 80 1F */	lis r3, infoWork@ha
/* 80067A94 000639B4  38 63 3A 58 */	addi r3, r3, infoWork@l
/* 80067A98 000639B8  7C 00 07 34 */	extsh r0, r0
/* 80067A9C 000639BC  B0 03 00 32 */	sth r0, 0x32(r3)
/* 80067AA0 000639C0  48 00 00 20 */	b lbl_80067AC0
lbl_80067AA4:
/* 80067AA4 000639C4  54 00 18 38 */	slwi r0, r0, 3
/* 80067AA8 000639C8  7C 63 02 14 */	add r3, r3, r0
/* 80067AAC 000639CC  80 03 00 0C */	lwz r0, 0xc(r3)
/* 80067AB0 000639D0  3C 60 80 1F */	lis r3, infoWork@ha
/* 80067AB4 000639D4  38 63 3A 58 */	addi r3, r3, infoWork@l
/* 80067AB8 000639D8  7C 00 07 34 */	extsh r0, r0
/* 80067ABC 000639DC  B0 03 00 32 */	sth r0, 0x32(r3)
lbl_80067AC0:
/* 80067AC0 000639E0  BB 21 00 2C */	lmw r25, 0x2c(r1)
/* 80067AC4 000639E4  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 80067AC8 000639E8  38 21 00 48 */	addi r1, r1, 0x48
/* 80067ACC 000639EC  7C 08 03 A6 */	mtlr r0
/* 80067AD0 000639F0  4E 80 00 20 */	blr
