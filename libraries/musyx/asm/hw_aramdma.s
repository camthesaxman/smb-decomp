.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global aramQueueCallback
aramQueueCallback:
/* 80100484 000FC3A4  88 6D A5 65 */	lbz r3, aramQueueValid@sda21(r13)
/* 80100488 000FC3A8  38 03 FF FF */	addi r0, r3, -1
/* 8010048C 000FC3AC  98 0D A5 65 */	stb r0, aramQueueValid@sda21(r13)
/* 80100490 000FC3B0  4E 80 00 20 */	blr

.global aramUploadData
aramUploadData:
/* 80100494 000FC3B4  7C 08 02 A6 */	mflr r0
/* 80100498 000FC3B8  3C E0 80 2F */	lis r7, lbl_802EB870@ha
/* 8010049C 000FC3BC  90 01 00 04 */	stw r0, 4(r1)
/* 801004A0 000FC3C0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801004A4 000FC3C4  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 801004A8 000FC3C8  3B 63 00 00 */	addi r27, r3, 0
/* 801004AC 000FC3CC  3B 84 00 00 */	addi r28, r4, 0
/* 801004B0 000FC3D0  3B A5 00 00 */	addi r29, r5, 0
/* 801004B4 000FC3D4  3B C6 00 00 */	addi r30, r6, 0
/* 801004B8 000FC3D8  3B E7 B8 70 */	addi r31, r7, lbl_802EB870@l
lbl_801004BC:
/* 801004BC 000FC3DC  88 0D A5 65 */	lbz r0, aramQueueValid@sda21(r13)
/* 801004C0 000FC3E0  28 00 00 10 */	cmplwi r0, 0x10
/* 801004C4 000FC3E4  40 80 FF F8 */	bge lbl_801004BC
/* 801004C8 000FC3E8  4B FC 5B F5 */	bl OSDisableInterrupts
/* 801004CC 000FC3EC  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801004D0 000FC3F0  28 1E 00 00 */	cmplwi r30, 0
/* 801004D4 000FC3F4  38 9F 00 04 */	addi r4, r31, 4
/* 801004D8 000FC3F8  54 00 28 34 */	slwi r0, r0, 5
/* 801004DC 000FC3FC  38 A0 00 2A */	li r5, 0x2a
/* 801004E0 000FC400  7C A4 01 2E */	stwx r5, r4, r0
/* 801004E4 000FC404  38 BF 00 08 */	addi r5, r31, 8
/* 801004E8 000FC408  38 E0 00 00 */	li r7, 0
/* 801004EC 000FC40C  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801004F0 000FC410  3B C3 00 00 */	addi r30, r3, 0
/* 801004F4 000FC414  54 00 28 34 */	slwi r0, r0, 5
/* 801004F8 000FC418  7C E5 01 2E */	stwx r7, r5, r0
/* 801004FC 000FC41C  41 82 00 08 */	beq lbl_80100504
/* 80100500 000FC420  38 E0 00 01 */	li r7, 1
lbl_80100504:
/* 80100504 000FC424  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100508 000FC428  3C 60 80 10 */	lis r3, aramQueueCallback@ha
/* 8010050C 000FC42C  38 DF 00 0C */	addi r6, r31, 0xc
/* 80100510 000FC430  54 00 28 34 */	slwi r0, r0, 5
/* 80100514 000FC434  7C E6 01 2E */	stwx r7, r6, r0
/* 80100518 000FC438  38 FF 00 10 */	addi r7, r31, 0x10
/* 8010051C 000FC43C  39 1F 00 14 */	addi r8, r31, 0x14
/* 80100520 000FC440  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100524 000FC444  39 3F 00 18 */	addi r9, r31, 0x18
/* 80100528 000FC448  38 63 04 84 */	addi r3, r3, aramQueueCallback@l
/* 8010052C 000FC44C  54 00 28 34 */	slwi r0, r0, 5
/* 80100530 000FC450  7F 67 01 2E */	stwx r27, r7, r0
/* 80100534 000FC454  39 5F 00 1C */	addi r10, r31, 0x1c
/* 80100538 000FC458  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 8010053C 000FC45C  54 00 28 34 */	slwi r0, r0, 5
/* 80100540 000FC460  7F 88 01 2E */	stwx r28, r8, r0
/* 80100544 000FC464  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100548 000FC468  54 00 28 34 */	slwi r0, r0, 5
/* 8010054C 000FC46C  7F A9 01 2E */	stwx r29, r9, r0
/* 80100550 000FC470  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100554 000FC474  54 00 28 34 */	slwi r0, r0, 5
/* 80100558 000FC478  7C 6A 01 2E */	stwx r3, r10, r0
/* 8010055C 000FC47C  88 6D A5 64 */	lbz r3, aramQueueWrite@sda21(r13)
/* 80100560 000FC480  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100564 000FC484  54 63 28 34 */	slwi r3, r3, 5
/* 80100568 000FC488  7C 7F 1A 14 */	add r3, r31, r3
/* 8010056C 000FC48C  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 80100570 000FC490  54 00 28 34 */	slwi r0, r0, 5
/* 80100574 000FC494  7C 84 00 2E */	lwzx r4, r4, r0
/* 80100578 000FC498  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 8010057C 000FC49C  55 6B 28 34 */	slwi r11, r11, 5
/* 80100580 000FC4A0  7C A5 58 2E */	lwzx r5, r5, r11
/* 80100584 000FC4A4  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 80100588 000FC4A8  54 00 28 34 */	slwi r0, r0, 5
/* 8010058C 000FC4AC  7C C6 00 2E */	lwzx r6, r6, r0
/* 80100590 000FC4B0  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100594 000FC4B4  55 6B 28 34 */	slwi r11, r11, 5
/* 80100598 000FC4B8  7C E7 58 2E */	lwzx r7, r7, r11
/* 8010059C 000FC4BC  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 801005A0 000FC4C0  54 00 28 34 */	slwi r0, r0, 5
/* 801005A4 000FC4C4  7D 08 00 2E */	lwzx r8, r8, r0
/* 801005A8 000FC4C8  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801005AC 000FC4CC  55 6B 28 34 */	slwi r11, r11, 5
/* 801005B0 000FC4D0  7D 29 58 2E */	lwzx r9, r9, r11
/* 801005B4 000FC4D4  54 00 28 34 */	slwi r0, r0, 5
/* 801005B8 000FC4D8  7D 4A 00 2E */	lwzx r10, r10, r0
/* 801005BC 000FC4DC  4B FD 40 61 */	bl ARQPostRequest
/* 801005C0 000FC4E0  88 8D A5 65 */	lbz r4, aramQueueValid@sda21(r13)
/* 801005C4 000FC4E4  38 7E 00 00 */	addi r3, r30, 0
/* 801005C8 000FC4E8  38 04 00 01 */	addi r0, r4, 1
/* 801005CC 000FC4EC  98 0D A5 65 */	stb r0, aramQueueValid@sda21(r13)
/* 801005D0 000FC4F0  88 8D A5 64 */	lbz r4, aramQueueWrite@sda21(r13)
/* 801005D4 000FC4F4  38 84 00 01 */	addi r4, r4, 1
/* 801005D8 000FC4F8  7C 80 26 70 */	srawi r0, r4, 4
/* 801005DC 000FC4FC  7C 00 01 94 */	addze r0, r0
/* 801005E0 000FC500  54 00 20 36 */	slwi r0, r0, 4
/* 801005E4 000FC504  7C 00 20 10 */	subfc r0, r0, r4
/* 801005E8 000FC508  98 0D A5 64 */	stb r0, aramQueueWrite@sda21(r13)
/* 801005EC 000FC50C  4B FC 5A F9 */	bl OSRestoreInterrupts
/* 801005F0 000FC510  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 801005F4 000FC514  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801005F8 000FC518  38 21 00 30 */	addi r1, r1, 0x30
/* 801005FC 000FC51C  7C 08 03 A6 */	mtlr r0
/* 80100600 000FC520  4E 80 00 20 */	blr

.global aramSyncTransferQueue
aramSyncTransferQueue:
/* 80100604 000FC524  88 0D A5 65 */	lbz r0, aramQueueValid@sda21(r13)
/* 80100608 000FC528  28 00 00 00 */	cmplwi r0, 0
/* 8010060C 000FC52C  40 82 FF F8 */	bne aramSyncTransferQueue
/* 80100610 000FC530  4E 80 00 20 */	blr

.global aramInit
aramInit:
/* 80100614 000FC534  7C 08 02 A6 */	mflr r0
/* 80100618 000FC538  3C 80 80 2F */	lis r4, lbl_802EB870@ha
/* 8010061C 000FC53C  90 01 00 04 */	stw r0, 4(r1)
/* 80100620 000FC540  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80100624 000FC544  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 80100628 000FC548  3B 63 00 00 */	addi r27, r3, 0
/* 8010062C 000FC54C  3B C4 B8 70 */	addi r30, r4, lbl_802EB870@l
/* 80100630 000FC550  4B FD 2E 61 */	bl ARGetBaseAddress
/* 80100634 000FC554  3B E3 00 00 */	addi r31, r3, 0
/* 80100638 000FC558  38 60 05 00 */	li r3, 0x500
/* 8010063C 000FC55C  48 00 0C 3D */	bl salMalloc
/* 80100640 000FC560  38 00 00 08 */	li r0, 8
/* 80100644 000FC564  7C 09 03 A6 */	mtctr r0
/* 80100648 000FC568  3B 83 00 00 */	addi r28, r3, 0
/* 8010064C 000FC56C  38 00 00 00 */	li r0, 0
lbl_80100650:
/* 80100650 000FC570  B0 03 00 00 */	sth r0, 0(r3)
/* 80100654 000FC574  B0 03 00 02 */	sth r0, 2(r3)
/* 80100658 000FC578  B0 03 00 04 */	sth r0, 4(r3)
/* 8010065C 000FC57C  B0 03 00 06 */	sth r0, 6(r3)
/* 80100660 000FC580  B0 03 00 08 */	sth r0, 8(r3)
/* 80100664 000FC584  B0 03 00 0A */	sth r0, 0xa(r3)
/* 80100668 000FC588  B0 03 00 0C */	sth r0, 0xc(r3)
/* 8010066C 000FC58C  B0 03 00 0E */	sth r0, 0xe(r3)
/* 80100670 000FC590  B0 03 00 10 */	sth r0, 0x10(r3)
/* 80100674 000FC594  B0 03 00 12 */	sth r0, 0x12(r3)
/* 80100678 000FC598  B0 03 00 14 */	sth r0, 0x14(r3)
/* 8010067C 000FC59C  B0 03 00 16 */	sth r0, 0x16(r3)
/* 80100680 000FC5A0  B0 03 00 18 */	sth r0, 0x18(r3)
/* 80100684 000FC5A4  B0 03 00 1A */	sth r0, 0x1a(r3)
/* 80100688 000FC5A8  B0 03 00 1C */	sth r0, 0x1c(r3)
/* 8010068C 000FC5AC  B0 03 00 1E */	sth r0, 0x1e(r3)
/* 80100690 000FC5B0  B0 03 00 20 */	sth r0, 0x20(r3)
/* 80100694 000FC5B4  B0 03 00 22 */	sth r0, 0x22(r3)
/* 80100698 000FC5B8  B0 03 00 24 */	sth r0, 0x24(r3)
/* 8010069C 000FC5BC  B0 03 00 26 */	sth r0, 0x26(r3)
/* 801006A0 000FC5C0  B0 03 00 28 */	sth r0, 0x28(r3)
/* 801006A4 000FC5C4  B0 03 00 2A */	sth r0, 0x2a(r3)
/* 801006A8 000FC5C8  B0 03 00 2C */	sth r0, 0x2c(r3)
/* 801006AC 000FC5CC  B0 03 00 2E */	sth r0, 0x2e(r3)
/* 801006B0 000FC5D0  B0 03 00 30 */	sth r0, 0x30(r3)
/* 801006B4 000FC5D4  B0 03 00 32 */	sth r0, 0x32(r3)
/* 801006B8 000FC5D8  B0 03 00 34 */	sth r0, 0x34(r3)
/* 801006BC 000FC5DC  B0 03 00 36 */	sth r0, 0x36(r3)
/* 801006C0 000FC5E0  B0 03 00 38 */	sth r0, 0x38(r3)
/* 801006C4 000FC5E4  B0 03 00 3A */	sth r0, 0x3a(r3)
/* 801006C8 000FC5E8  B0 03 00 3C */	sth r0, 0x3c(r3)
/* 801006CC 000FC5EC  B0 03 00 3E */	sth r0, 0x3e(r3)
/* 801006D0 000FC5F0  B0 03 00 40 */	sth r0, 0x40(r3)
/* 801006D4 000FC5F4  B0 03 00 42 */	sth r0, 0x42(r3)
/* 801006D8 000FC5F8  B0 03 00 44 */	sth r0, 0x44(r3)
/* 801006DC 000FC5FC  B0 03 00 46 */	sth r0, 0x46(r3)
/* 801006E0 000FC600  B0 03 00 48 */	sth r0, 0x48(r3)
/* 801006E4 000FC604  B0 03 00 4A */	sth r0, 0x4a(r3)
/* 801006E8 000FC608  B0 03 00 4C */	sth r0, 0x4c(r3)
/* 801006EC 000FC60C  B0 03 00 4E */	sth r0, 0x4e(r3)
/* 801006F0 000FC610  B0 03 00 50 */	sth r0, 0x50(r3)
/* 801006F4 000FC614  B0 03 00 52 */	sth r0, 0x52(r3)
/* 801006F8 000FC618  B0 03 00 54 */	sth r0, 0x54(r3)
/* 801006FC 000FC61C  B0 03 00 56 */	sth r0, 0x56(r3)
/* 80100700 000FC620  B0 03 00 58 */	sth r0, 0x58(r3)
/* 80100704 000FC624  B0 03 00 5A */	sth r0, 0x5a(r3)
/* 80100708 000FC628  B0 03 00 5C */	sth r0, 0x5c(r3)
/* 8010070C 000FC62C  B0 03 00 5E */	sth r0, 0x5e(r3)
/* 80100710 000FC630  B0 03 00 60 */	sth r0, 0x60(r3)
/* 80100714 000FC634  B0 03 00 62 */	sth r0, 0x62(r3)
/* 80100718 000FC638  B0 03 00 64 */	sth r0, 0x64(r3)
/* 8010071C 000FC63C  B0 03 00 66 */	sth r0, 0x66(r3)
/* 80100720 000FC640  B0 03 00 68 */	sth r0, 0x68(r3)
/* 80100724 000FC644  B0 03 00 6A */	sth r0, 0x6a(r3)
/* 80100728 000FC648  B0 03 00 6C */	sth r0, 0x6c(r3)
/* 8010072C 000FC64C  B0 03 00 6E */	sth r0, 0x6e(r3)
/* 80100730 000FC650  B0 03 00 70 */	sth r0, 0x70(r3)
/* 80100734 000FC654  B0 03 00 72 */	sth r0, 0x72(r3)
/* 80100738 000FC658  B0 03 00 74 */	sth r0, 0x74(r3)
/* 8010073C 000FC65C  B0 03 00 76 */	sth r0, 0x76(r3)
/* 80100740 000FC660  B0 03 00 78 */	sth r0, 0x78(r3)
/* 80100744 000FC664  B0 03 00 7A */	sth r0, 0x7a(r3)
/* 80100748 000FC668  B0 03 00 7C */	sth r0, 0x7c(r3)
/* 8010074C 000FC66C  B0 03 00 7E */	sth r0, 0x7e(r3)
/* 80100750 000FC670  B0 03 00 80 */	sth r0, 0x80(r3)
/* 80100754 000FC674  B0 03 00 82 */	sth r0, 0x82(r3)
/* 80100758 000FC678  B0 03 00 84 */	sth r0, 0x84(r3)
/* 8010075C 000FC67C  B0 03 00 86 */	sth r0, 0x86(r3)
/* 80100760 000FC680  B0 03 00 88 */	sth r0, 0x88(r3)
/* 80100764 000FC684  B0 03 00 8A */	sth r0, 0x8a(r3)
/* 80100768 000FC688  B0 03 00 8C */	sth r0, 0x8c(r3)
/* 8010076C 000FC68C  B0 03 00 8E */	sth r0, 0x8e(r3)
/* 80100770 000FC690  B0 03 00 90 */	sth r0, 0x90(r3)
/* 80100774 000FC694  B0 03 00 92 */	sth r0, 0x92(r3)
/* 80100778 000FC698  B0 03 00 94 */	sth r0, 0x94(r3)
/* 8010077C 000FC69C  B0 03 00 96 */	sth r0, 0x96(r3)
/* 80100780 000FC6A0  B0 03 00 98 */	sth r0, 0x98(r3)
/* 80100784 000FC6A4  B0 03 00 9A */	sth r0, 0x9a(r3)
/* 80100788 000FC6A8  B0 03 00 9C */	sth r0, 0x9c(r3)
/* 8010078C 000FC6AC  B0 03 00 9E */	sth r0, 0x9e(r3)
/* 80100790 000FC6B0  38 63 00 A0 */	addi r3, r3, 0xa0
/* 80100794 000FC6B4  42 00 FE BC */	bdnz lbl_80100650
/* 80100798 000FC6B8  38 7C 00 00 */	addi r3, r28, 0
/* 8010079C 000FC6BC  38 80 05 00 */	li r4, 0x500
/* 801007A0 000FC6C0  4B FC 27 C1 */	bl DCFlushRange
/* 801007A4 000FC6C4  38 00 00 00 */	li r0, 0
/* 801007A8 000FC6C8  98 0D A5 65 */	stb r0, aramQueueValid@sda21(r13)
/* 801007AC 000FC6CC  98 0D A5 64 */	stb r0, aramQueueWrite@sda21(r13)
lbl_801007B0:
/* 801007B0 000FC6D0  88 0D A5 65 */	lbz r0, aramQueueValid@sda21(r13)
/* 801007B4 000FC6D4  28 00 00 10 */	cmplwi r0, 0x10
/* 801007B8 000FC6D8  40 80 FF F8 */	bge lbl_801007B0
/* 801007BC 000FC6DC  4B FC 59 01 */	bl OSDisableInterrupts
/* 801007C0 000FC6E0  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801007C4 000FC6E4  3D 40 80 10 */	lis r10, aramQueueCallback@ha
/* 801007C8 000FC6E8  39 6A 04 84 */	addi r11, r10, aramQueueCallback@l
/* 801007CC 000FC6EC  38 9E 00 04 */	addi r4, r30, 4
/* 801007D0 000FC6F0  54 00 28 34 */	slwi r0, r0, 5
/* 801007D4 000FC6F4  38 A0 00 2A */	li r5, 0x2a
/* 801007D8 000FC6F8  7C A4 01 2E */	stwx r5, r4, r0
/* 801007DC 000FC6FC  38 BE 00 08 */	addi r5, r30, 8
/* 801007E0 000FC700  3B A0 00 00 */	li r29, 0
/* 801007E4 000FC704  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801007E8 000FC708  38 DE 00 0C */	addi r6, r30, 0xc
/* 801007EC 000FC70C  38 FE 00 10 */	addi r7, r30, 0x10
/* 801007F0 000FC710  54 00 28 34 */	slwi r0, r0, 5
/* 801007F4 000FC714  7F A5 01 2E */	stwx r29, r5, r0
/* 801007F8 000FC718  39 1E 00 14 */	addi r8, r30, 0x14
/* 801007FC 000FC71C  39 3E 00 18 */	addi r9, r30, 0x18
/* 80100800 000FC720  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100804 000FC724  39 80 05 00 */	li r12, 0x500
/* 80100808 000FC728  39 5E 00 1C */	addi r10, r30, 0x1c
/* 8010080C 000FC72C  54 00 28 34 */	slwi r0, r0, 5
/* 80100810 000FC730  7F A6 01 2E */	stwx r29, r6, r0
/* 80100814 000FC734  3B A3 00 00 */	addi r29, r3, 0
/* 80100818 000FC738  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 8010081C 000FC73C  54 00 28 34 */	slwi r0, r0, 5
/* 80100820 000FC740  7F 87 01 2E */	stwx r28, r7, r0
/* 80100824 000FC744  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100828 000FC748  54 00 28 34 */	slwi r0, r0, 5
/* 8010082C 000FC74C  7F E8 01 2E */	stwx r31, r8, r0
/* 80100830 000FC750  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100834 000FC754  54 00 28 34 */	slwi r0, r0, 5
/* 80100838 000FC758  7D 89 01 2E */	stwx r12, r9, r0
/* 8010083C 000FC75C  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100840 000FC760  54 00 28 34 */	slwi r0, r0, 5
/* 80100844 000FC764  7D 6A 01 2E */	stwx r11, r10, r0
/* 80100848 000FC768  88 6D A5 64 */	lbz r3, aramQueueWrite@sda21(r13)
/* 8010084C 000FC76C  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100850 000FC770  54 63 28 34 */	slwi r3, r3, 5
/* 80100854 000FC774  7C 7E 1A 14 */	add r3, r30, r3
/* 80100858 000FC778  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 8010085C 000FC77C  54 00 28 34 */	slwi r0, r0, 5
/* 80100860 000FC780  7C 84 00 2E */	lwzx r4, r4, r0
/* 80100864 000FC784  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100868 000FC788  55 6B 28 34 */	slwi r11, r11, 5
/* 8010086C 000FC78C  7C A5 58 2E */	lwzx r5, r5, r11
/* 80100870 000FC790  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 80100874 000FC794  54 00 28 34 */	slwi r0, r0, 5
/* 80100878 000FC798  7C C6 00 2E */	lwzx r6, r6, r0
/* 8010087C 000FC79C  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100880 000FC7A0  55 6B 28 34 */	slwi r11, r11, 5
/* 80100884 000FC7A4  7C E7 58 2E */	lwzx r7, r7, r11
/* 80100888 000FC7A8  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 8010088C 000FC7AC  54 00 28 34 */	slwi r0, r0, 5
/* 80100890 000FC7B0  7D 08 00 2E */	lwzx r8, r8, r0
/* 80100894 000FC7B4  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100898 000FC7B8  55 6B 28 34 */	slwi r11, r11, 5
/* 8010089C 000FC7BC  7D 29 58 2E */	lwzx r9, r9, r11
/* 801008A0 000FC7C0  54 00 28 34 */	slwi r0, r0, 5
/* 801008A4 000FC7C4  7D 4A 00 2E */	lwzx r10, r10, r0
/* 801008A8 000FC7C8  4B FD 3D 75 */	bl ARQPostRequest
/* 801008AC 000FC7CC  88 8D A5 65 */	lbz r4, aramQueueValid@sda21(r13)
/* 801008B0 000FC7D0  38 7D 00 00 */	addi r3, r29, 0
/* 801008B4 000FC7D4  38 04 00 01 */	addi r0, r4, 1
/* 801008B8 000FC7D8  98 0D A5 65 */	stb r0, aramQueueValid@sda21(r13)
/* 801008BC 000FC7DC  88 8D A5 64 */	lbz r4, aramQueueWrite@sda21(r13)
/* 801008C0 000FC7E0  38 84 00 01 */	addi r4, r4, 1
/* 801008C4 000FC7E4  7C 80 26 70 */	srawi r0, r4, 4
/* 801008C8 000FC7E8  7C 00 01 94 */	addze r0, r0
/* 801008CC 000FC7EC  54 00 20 36 */	slwi r0, r0, 4
/* 801008D0 000FC7F0  7C 00 20 10 */	subfc r0, r0, r4
/* 801008D4 000FC7F4  98 0D A5 64 */	stb r0, aramQueueWrite@sda21(r13)
/* 801008D8 000FC7F8  4B FC 58 0D */	bl OSRestoreInterrupts
lbl_801008DC:
/* 801008DC 000FC7FC  88 0D A5 65 */	lbz r0, aramQueueValid@sda21(r13)
/* 801008E0 000FC800  28 00 00 00 */	cmplwi r0, 0
/* 801008E4 000FC804  40 82 FF F8 */	bne lbl_801008DC
/* 801008E8 000FC808  7F 83 E3 78 */	mr r3, r28
/* 801008EC 000FC80C  48 00 09 B5 */	bl salFree
/* 801008F0 000FC810  7C 1F DA 14 */	add r0, r31, r27
/* 801008F4 000FC814  90 0D A5 58 */	stw r0, aramTop@sda21(r13)
/* 801008F8 000FC818  4B FD 2B A1 */	bl ARGetSize
/* 801008FC 000FC81C  80 0D A5 58 */	lwz r0, aramTop@sda21(r13)
/* 80100900 000FC820  7C 00 18 40 */	cmplw r0, r3
/* 80100904 000FC824  40 81 00 0C */	ble lbl_80100910
/* 80100908 000FC828  4B FD 2B 91 */	bl ARGetSize
/* 8010090C 000FC82C  90 6D A5 58 */	stw r3, aramTop@sda21(r13)
lbl_80100910:
/* 80100910 000FC830  38 1F 05 00 */	addi r0, r31, 0x500
/* 80100914 000FC834  90 0D A5 5C */	stw r0, aramWrite@sda21(r13)
/* 80100918 000FC838  48 00 01 C9 */	bl InitStreamBuffers
/* 8010091C 000FC83C  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 80100920 000FC840  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80100924 000FC844  38 21 00 30 */	addi r1, r1, 0x30
/* 80100928 000FC848  7C 08 03 A6 */	mtlr r0
/* 8010092C 000FC84C  4E 80 00 20 */	blr

.global aramGetZeroBuffer
aramGetZeroBuffer:
/* 80100930 000FC850  7C 08 02 A6 */	mflr r0
/* 80100934 000FC854  90 01 00 04 */	stw r0, 4(r1)
/* 80100938 000FC858  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010093C 000FC85C  4B FD 2B 55 */	bl ARGetBaseAddress
/* 80100940 000FC860  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80100944 000FC864  38 21 00 08 */	addi r1, r1, 8
/* 80100948 000FC868  7C 08 03 A6 */	mtlr r0
/* 8010094C 000FC86C  4E 80 00 20 */	blr

.global aramStoreData
aramStoreData:
/* 80100950 000FC870  7C 08 02 A6 */	mflr r0
/* 80100954 000FC874  3C A0 80 2F */	lis r5, lbl_802EB870@ha
/* 80100958 000FC878  90 01 00 04 */	stw r0, 4(r1)
/* 8010095C 000FC87C  38 04 00 1F */	addi r0, r4, 0x1f
/* 80100960 000FC880  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80100964 000FC884  BF 61 00 14 */	stmw r27, 0x14(r1)
/* 80100968 000FC888  54 1C 00 34 */	rlwinm r28, r0, 0, 0, 0x1a
/* 8010096C 000FC88C  3B 63 00 00 */	addi r27, r3, 0
/* 80100970 000FC890  38 9C 00 00 */	addi r4, r28, 0
/* 80100974 000FC894  3B E5 B8 70 */	addi r31, r5, lbl_802EB870@l
/* 80100978 000FC898  4B FC 25 E9 */	bl DCFlushRange
/* 8010097C 000FC89C  83 AD A5 5C */	lwz r29, aramWrite@sda21(r13)
lbl_80100980:
/* 80100980 000FC8A0  88 0D A5 65 */	lbz r0, aramQueueValid@sda21(r13)
/* 80100984 000FC8A4  28 00 00 10 */	cmplwi r0, 0x10
/* 80100988 000FC8A8  40 80 FF F8 */	bge lbl_80100980
/* 8010098C 000FC8AC  4B FC 57 31 */	bl OSDisableInterrupts
/* 80100990 000FC8B0  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100994 000FC8B4  3D 40 80 10 */	lis r10, aramQueueCallback@ha
/* 80100998 000FC8B8  39 6A 04 84 */	addi r11, r10, aramQueueCallback@l
/* 8010099C 000FC8BC  38 9F 00 04 */	addi r4, r31, 4
/* 801009A0 000FC8C0  54 00 28 34 */	slwi r0, r0, 5
/* 801009A4 000FC8C4  38 A0 00 2A */	li r5, 0x2a
/* 801009A8 000FC8C8  7C A4 01 2E */	stwx r5, r4, r0
/* 801009AC 000FC8CC  38 BF 00 08 */	addi r5, r31, 8
/* 801009B0 000FC8D0  39 80 00 00 */	li r12, 0
/* 801009B4 000FC8D4  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801009B8 000FC8D8  38 DF 00 0C */	addi r6, r31, 0xc
/* 801009BC 000FC8DC  38 FF 00 10 */	addi r7, r31, 0x10
/* 801009C0 000FC8E0  54 00 28 34 */	slwi r0, r0, 5
/* 801009C4 000FC8E4  7D 85 01 2E */	stwx r12, r5, r0
/* 801009C8 000FC8E8  39 1F 00 14 */	addi r8, r31, 0x14
/* 801009CC 000FC8EC  39 3F 00 18 */	addi r9, r31, 0x18
/* 801009D0 000FC8F0  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801009D4 000FC8F4  39 5F 00 1C */	addi r10, r31, 0x1c
/* 801009D8 000FC8F8  7C 7E 1B 78 */	mr r30, r3
/* 801009DC 000FC8FC  54 00 28 34 */	slwi r0, r0, 5
/* 801009E0 000FC900  7D 86 01 2E */	stwx r12, r6, r0
/* 801009E4 000FC904  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801009E8 000FC908  54 00 28 34 */	slwi r0, r0, 5
/* 801009EC 000FC90C  7F 67 01 2E */	stwx r27, r7, r0
/* 801009F0 000FC910  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 801009F4 000FC914  54 00 28 34 */	slwi r0, r0, 5
/* 801009F8 000FC918  7F A8 01 2E */	stwx r29, r8, r0
/* 801009FC 000FC91C  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100A00 000FC920  54 00 28 34 */	slwi r0, r0, 5
/* 80100A04 000FC924  7F 89 01 2E */	stwx r28, r9, r0
/* 80100A08 000FC928  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100A0C 000FC92C  54 00 28 34 */	slwi r0, r0, 5
/* 80100A10 000FC930  7D 6A 01 2E */	stwx r11, r10, r0
/* 80100A14 000FC934  88 6D A5 64 */	lbz r3, aramQueueWrite@sda21(r13)
/* 80100A18 000FC938  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100A1C 000FC93C  54 63 28 34 */	slwi r3, r3, 5
/* 80100A20 000FC940  7C 7F 1A 14 */	add r3, r31, r3
/* 80100A24 000FC944  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 80100A28 000FC948  54 00 28 34 */	slwi r0, r0, 5
/* 80100A2C 000FC94C  7C 84 00 2E */	lwzx r4, r4, r0
/* 80100A30 000FC950  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100A34 000FC954  55 6B 28 34 */	slwi r11, r11, 5
/* 80100A38 000FC958  7C A5 58 2E */	lwzx r5, r5, r11
/* 80100A3C 000FC95C  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 80100A40 000FC960  54 00 28 34 */	slwi r0, r0, 5
/* 80100A44 000FC964  7C C6 00 2E */	lwzx r6, r6, r0
/* 80100A48 000FC968  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100A4C 000FC96C  55 6B 28 34 */	slwi r11, r11, 5
/* 80100A50 000FC970  7C E7 58 2E */	lwzx r7, r7, r11
/* 80100A54 000FC974  89 6D A5 64 */	lbz r11, aramQueueWrite@sda21(r13)
/* 80100A58 000FC978  54 00 28 34 */	slwi r0, r0, 5
/* 80100A5C 000FC97C  7D 08 00 2E */	lwzx r8, r8, r0
/* 80100A60 000FC980  88 0D A5 64 */	lbz r0, aramQueueWrite@sda21(r13)
/* 80100A64 000FC984  55 6B 28 34 */	slwi r11, r11, 5
/* 80100A68 000FC988  7D 29 58 2E */	lwzx r9, r9, r11
/* 80100A6C 000FC98C  54 00 28 34 */	slwi r0, r0, 5
/* 80100A70 000FC990  7D 4A 00 2E */	lwzx r10, r10, r0
/* 80100A74 000FC994  4B FD 3B A9 */	bl ARQPostRequest
/* 80100A78 000FC998  88 8D A5 65 */	lbz r4, aramQueueValid@sda21(r13)
/* 80100A7C 000FC99C  38 7E 00 00 */	addi r3, r30, 0
/* 80100A80 000FC9A0  38 04 00 01 */	addi r0, r4, 1
/* 80100A84 000FC9A4  98 0D A5 65 */	stb r0, aramQueueValid@sda21(r13)
/* 80100A88 000FC9A8  88 8D A5 64 */	lbz r4, aramQueueWrite@sda21(r13)
/* 80100A8C 000FC9AC  38 84 00 01 */	addi r4, r4, 1
/* 80100A90 000FC9B0  7C 80 26 70 */	srawi r0, r4, 4
/* 80100A94 000FC9B4  7C 00 01 94 */	addze r0, r0
/* 80100A98 000FC9B8  54 00 20 36 */	slwi r0, r0, 4
/* 80100A9C 000FC9BC  7C 00 20 10 */	subfc r0, r0, r4
/* 80100AA0 000FC9C0  98 0D A5 64 */	stb r0, aramQueueWrite@sda21(r13)
/* 80100AA4 000FC9C4  4B FC 56 41 */	bl OSRestoreInterrupts
/* 80100AA8 000FC9C8  80 6D A5 5C */	lwz r3, aramWrite@sda21(r13)
/* 80100AAC 000FC9CC  7C 03 E2 14 */	add r0, r3, r28
/* 80100AB0 000FC9D0  90 0D A5 5C */	stw r0, aramWrite@sda21(r13)
/* 80100AB4 000FC9D4  BB 61 00 14 */	lmw r27, 0x14(r1)
/* 80100AB8 000FC9D8  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80100ABC 000FC9DC  38 21 00 28 */	addi r1, r1, 0x28
/* 80100AC0 000FC9E0  7C 08 03 A6 */	mtlr r0
/* 80100AC4 000FC9E4  4E 80 00 20 */	blr

.global aramRemoveData
aramRemoveData:
/* 80100AC8 000FC9E8  38 64 00 1F */	addi r3, r4, 0x1f
/* 80100ACC 000FC9EC  80 0D A5 5C */	lwz r0, aramWrite@sda21(r13)
/* 80100AD0 000FC9F0  54 63 00 34 */	rlwinm r3, r3, 0, 0, 0x1a
/* 80100AD4 000FC9F4  7C 03 00 50 */	subf r0, r3, r0
/* 80100AD8 000FC9F8  90 0D A5 5C */	stw r0, aramWrite@sda21(r13)
/* 80100ADC 000FC9FC  4E 80 00 20 */	blr

.global InitStreamBuffers
InitStreamBuffers:
/* 80100AE0 000FCA00  3C 60 80 2F */	lis r3, lbl_802EB870@ha
/* 80100AE4 000FCA04  38 C3 B8 70 */	addi r6, r3, lbl_802EB870@l
/* 80100AE8 000FCA08  38 80 00 00 */	li r4, 0
/* 80100AEC 000FCA0C  38 66 02 00 */	addi r3, r6, 0x200
/* 80100AF0 000FCA10  90 8D A5 68 */	stw r4, aramUsedStreamBuffers@sda21(r13)
/* 80100AF4 000FCA14  38 00 00 07 */	li r0, 7
/* 80100AF8 000FCA18  90 8D A5 6C */	stw r4, aramFreeStreamBuffers@sda21(r13)
/* 80100AFC 000FCA1C  7C 09 03 A6 */	mtctr r0
/* 80100B00 000FCA20  38 E6 02 10 */	addi r7, r6, 0x210
/* 80100B04 000FCA24  90 6D A5 70 */	stw r3, aramIdleStreamBuffers@sda21(r13)
/* 80100B08 000FCA28  39 00 00 01 */	li r8, 1
lbl_80100B0C:
/* 80100B0C 000FCA2C  90 E7 FF F0 */	stw r7, -0x10(r7)
/* 80100B10 000FCA30  38 07 00 10 */	addi r0, r7, 0x10
/* 80100B14 000FCA34  38 67 00 20 */	addi r3, r7, 0x20
/* 80100B18 000FCA38  90 07 00 00 */	stw r0, 0(r7)
/* 80100B1C 000FCA3C  38 07 00 30 */	addi r0, r7, 0x30
/* 80100B20 000FCA40  38 A7 00 40 */	addi r5, r7, 0x40
/* 80100B24 000FCA44  90 67 00 10 */	stw r3, 0x10(r7)
/* 80100B28 000FCA48  38 87 00 50 */	addi r4, r7, 0x50
/* 80100B2C 000FCA4C  38 67 00 60 */	addi r3, r7, 0x60
/* 80100B30 000FCA50  90 07 00 20 */	stw r0, 0x20(r7)
/* 80100B34 000FCA54  38 07 00 70 */	addi r0, r7, 0x70
/* 80100B38 000FCA58  39 08 00 08 */	addi r8, r8, 8
/* 80100B3C 000FCA5C  90 A7 00 30 */	stw r5, 0x30(r7)
/* 80100B40 000FCA60  90 87 00 40 */	stw r4, 0x40(r7)
/* 80100B44 000FCA64  90 67 00 50 */	stw r3, 0x50(r7)
/* 80100B48 000FCA68  90 07 00 60 */	stw r0, 0x60(r7)
/* 80100B4C 000FCA6C  38 E7 00 80 */	addi r7, r7, 0x80
/* 80100B50 000FCA70  42 00 FF BC */	bdnz lbl_80100B0C
/* 80100B54 000FCA74  48 00 00 40 */	b lbl_80100B94
lbl_80100B58:
/* 80100B58 000FCA78  20 08 00 40 */	subfic r0, r8, 0x40
/* 80100B5C 000FCA7C  28 08 00 40 */	cmplwi r8, 0x40
/* 80100B60 000FCA80  7C 09 03 A6 */	mtctr r0
/* 80100B64 000FCA84  40 80 00 14 */	bge lbl_80100B78
lbl_80100B68:
/* 80100B68 000FCA88  90 63 FF F0 */	stw r3, -0x10(r3)
/* 80100B6C 000FCA8C  38 63 00 10 */	addi r3, r3, 0x10
/* 80100B70 000FCA90  39 08 00 01 */	addi r8, r8, 1
/* 80100B74 000FCA94  42 00 FF F4 */	bdnz lbl_80100B68
lbl_80100B78:
/* 80100B78 000FCA98  55 00 20 36 */	slwi r0, r8, 4
/* 80100B7C 000FCA9C  7C 66 02 14 */	add r3, r6, r0
/* 80100B80 000FCAA0  38 00 00 00 */	li r0, 0
/* 80100B84 000FCAA4  90 03 01 F0 */	stw r0, 0x1f0(r3)
/* 80100B88 000FCAA8  80 0D A5 58 */	lwz r0, aramTop@sda21(r13)
/* 80100B8C 000FCAAC  90 0D A5 60 */	stw r0, aramStream@sda21(r13)
/* 80100B90 000FCAB0  4E 80 00 20 */	blr
lbl_80100B94:
/* 80100B94 000FCAB4  55 00 20 36 */	slwi r0, r8, 4
/* 80100B98 000FCAB8  7C 66 02 14 */	add r3, r6, r0
/* 80100B9C 000FCABC  38 63 02 00 */	addi r3, r3, 0x200
/* 80100BA0 000FCAC0  4B FF FF B8 */	b lbl_80100B58
/* 80100BA4 000FCAC4  4E 80 00 20 */	blr

.global aramAllocateStreamBuffer
aramAllocateStreamBuffer:
/* 80100BA8 000FCAC8  38 03 00 1F */	addi r0, r3, 0x1f
/* 80100BAC 000FCACC  80 6D A5 6C */	lwz r3, aramFreeStreamBuffers@sda21(r13)
/* 80100BB0 000FCAD0  54 07 00 34 */	rlwinm r7, r0, 0, 0, 0x1a
/* 80100BB4 000FCAD4  38 A0 00 00 */	li r5, 0
/* 80100BB8 000FCAD8  38 80 00 00 */	li r4, 0
/* 80100BBC 000FCADC  38 C0 FF FF */	li r6, -1
/* 80100BC0 000FCAE0  48 00 00 34 */	b lbl_80100BF4
lbl_80100BC4:
/* 80100BC4 000FCAE4  80 03 00 0C */	lwz r0, 0xc(r3)
/* 80100BC8 000FCAE8  7C 00 38 40 */	cmplw r0, r7
/* 80100BCC 000FCAEC  40 82 00 0C */	bne lbl_80100BD8
/* 80100BD0 000FCAF0  7C 65 1B 78 */	mr r5, r3
/* 80100BD4 000FCAF4  48 00 00 28 */	b lbl_80100BFC
lbl_80100BD8:
/* 80100BD8 000FCAF8  40 81 00 14 */	ble lbl_80100BEC
/* 80100BDC 000FCAFC  7C 06 00 40 */	cmplw r6, r0
/* 80100BE0 000FCB00  40 81 00 0C */	ble lbl_80100BEC
/* 80100BE4 000FCB04  38 A3 00 00 */	addi r5, r3, 0
/* 80100BE8 000FCB08  7C 06 03 78 */	mr r6, r0
lbl_80100BEC:
/* 80100BEC 000FCB0C  7C 64 1B 78 */	mr r4, r3
/* 80100BF0 000FCB10  80 63 00 00 */	lwz r3, 0(r3)
lbl_80100BF4:
/* 80100BF4 000FCB14  28 03 00 00 */	cmplwi r3, 0
/* 80100BF8 000FCB18  40 82 FF CC */	bne lbl_80100BC4
lbl_80100BFC:
/* 80100BFC 000FCB1C  28 05 00 00 */	cmplwi r5, 0
/* 80100C00 000FCB20  40 82 00 5C */	bne lbl_80100C5C
/* 80100C04 000FCB24  80 8D A5 70 */	lwz r4, aramIdleStreamBuffers@sda21(r13)
/* 80100C08 000FCB28  28 04 00 00 */	cmplwi r4, 0
/* 80100C0C 000FCB2C  41 82 00 7C */	beq lbl_80100C88
/* 80100C10 000FCB30  80 6D A5 60 */	lwz r3, aramStream@sda21(r13)
/* 80100C14 000FCB34  80 0D A5 5C */	lwz r0, aramWrite@sda21(r13)
/* 80100C18 000FCB38  7C 67 18 50 */	subf r3, r7, r3
/* 80100C1C 000FCB3C  7C 03 00 40 */	cmplw r3, r0
/* 80100C20 000FCB40  41 80 00 68 */	blt lbl_80100C88
/* 80100C24 000FCB44  80 04 00 00 */	lwz r0, 0(r4)
/* 80100C28 000FCB48  7C 85 23 78 */	mr r5, r4
/* 80100C2C 000FCB4C  90 0D A5 70 */	stw r0, aramIdleStreamBuffers@sda21(r13)
/* 80100C30 000FCB50  90 E4 00 0C */	stw r7, 0xc(r4)
/* 80100C34 000FCB54  90 E4 00 08 */	stw r7, 8(r4)
/* 80100C38 000FCB58  80 0D A5 60 */	lwz r0, aramStream@sda21(r13)
/* 80100C3C 000FCB5C  7C 07 00 50 */	subf r0, r7, r0
/* 80100C40 000FCB60  90 0D A5 60 */	stw r0, aramStream@sda21(r13)
/* 80100C44 000FCB64  80 0D A5 60 */	lwz r0, aramStream@sda21(r13)
/* 80100C48 000FCB68  90 04 00 04 */	stw r0, 4(r4)
/* 80100C4C 000FCB6C  80 0D A5 68 */	lwz r0, aramUsedStreamBuffers@sda21(r13)
/* 80100C50 000FCB70  90 04 00 00 */	stw r0, 0(r4)
/* 80100C54 000FCB74  90 8D A5 68 */	stw r4, aramUsedStreamBuffers@sda21(r13)
/* 80100C58 000FCB78  48 00 00 30 */	b lbl_80100C88
lbl_80100C5C:
/* 80100C5C 000FCB7C  28 04 00 00 */	cmplwi r4, 0
/* 80100C60 000FCB80  41 82 00 10 */	beq lbl_80100C70
/* 80100C64 000FCB84  80 05 00 00 */	lwz r0, 0(r5)
/* 80100C68 000FCB88  90 04 00 00 */	stw r0, 0(r4)
/* 80100C6C 000FCB8C  48 00 00 0C */	b lbl_80100C78
lbl_80100C70:
/* 80100C70 000FCB90  80 05 00 00 */	lwz r0, 0(r5)
/* 80100C74 000FCB94  90 0D A5 6C */	stw r0, aramFreeStreamBuffers@sda21(r13)
lbl_80100C78:
/* 80100C78 000FCB98  90 E5 00 08 */	stw r7, 8(r5)
/* 80100C7C 000FCB9C  80 0D A5 68 */	lwz r0, aramUsedStreamBuffers@sda21(r13)
/* 80100C80 000FCBA0  90 05 00 00 */	stw r0, 0(r5)
/* 80100C84 000FCBA4  90 AD A5 68 */	stw r5, aramUsedStreamBuffers@sda21(r13)
lbl_80100C88:
/* 80100C88 000FCBA8  28 05 00 00 */	cmplwi r5, 0
/* 80100C8C 000FCBAC  40 82 00 0C */	bne lbl_80100C98
/* 80100C90 000FCBB0  38 60 00 FF */	li r3, 0xff
/* 80100C94 000FCBB4  4E 80 00 20 */	blr
lbl_80100C98:
/* 80100C98 000FCBB8  3C 60 80 2F */	lis r3, lbl_802EBA70@ha
/* 80100C9C 000FCBBC  38 03 BA 70 */	addi r0, r3, lbl_802EBA70@l
/* 80100CA0 000FCBC0  7C 00 28 50 */	subf r0, r0, r5
/* 80100CA4 000FCBC4  7C 00 26 70 */	srawi r0, r0, 4
/* 80100CA8 000FCBC8  7C 00 01 94 */	addze r0, r0
/* 80100CAC 000FCBCC  54 03 06 3E */	clrlwi r3, r0, 0x18
/* 80100CB0 000FCBD0  4E 80 00 20 */	blr

.global aramGetStreamBufferAddress
aramGetStreamBufferAddress:
/* 80100CB4 000FCBD4  28 04 00 00 */	cmplwi r4, 0
/* 80100CB8 000FCBD8  41 82 00 1C */	beq lbl_80100CD4
/* 80100CBC 000FCBDC  3C A0 80 2F */	lis r5, lbl_802EBA70@ha
/* 80100CC0 000FCBE0  38 A5 BA 70 */	addi r5, r5, lbl_802EBA70@l
/* 80100CC4 000FCBE4  54 60 25 36 */	rlwinm r0, r3, 4, 0x14, 0x1b
/* 80100CC8 000FCBE8  7C A5 02 14 */	add r5, r5, r0
/* 80100CCC 000FCBEC  80 05 00 08 */	lwz r0, 8(r5)
/* 80100CD0 000FCBF0  90 04 00 00 */	stw r0, 0(r4)
lbl_80100CD4:
/* 80100CD4 000FCBF4  3C 80 80 2F */	lis r4, lbl_802EBA70@ha
/* 80100CD8 000FCBF8  38 84 BA 70 */	addi r4, r4, lbl_802EBA70@l
/* 80100CDC 000FCBFC  54 60 25 36 */	rlwinm r0, r3, 4, 0x14, 0x1b
/* 80100CE0 000FCC00  7C 64 02 14 */	add r3, r4, r0
/* 80100CE4 000FCC04  80 63 00 04 */	lwz r3, 4(r3)
/* 80100CE8 000FCC08  4E 80 00 20 */	blr

.global aramFreeStreamBuffer
aramFreeStreamBuffer:
/* 80100CEC 000FCC0C  3C 80 80 2F */	lis r4, lbl_802EBA70@ha
/* 80100CF0 000FCC10  80 AD A5 68 */	lwz r5, aramUsedStreamBuffers@sda21(r13)
/* 80100CF4 000FCC14  54 63 25 36 */	rlwinm r3, r3, 4, 0x14, 0x1b
/* 80100CF8 000FCC18  38 04 BA 70 */	addi r0, r4, lbl_802EBA70@l
/* 80100CFC 000FCC1C  7C 80 1A 14 */	add r4, r0, r3
/* 80100D00 000FCC20  38 60 00 00 */	li r3, 0
/* 80100D04 000FCC24  48 00 00 34 */	b lbl_80100D38
lbl_80100D08:
/* 80100D08 000FCC28  7C 05 20 40 */	cmplw r5, r4
/* 80100D0C 000FCC2C  40 82 00 24 */	bne lbl_80100D30
/* 80100D10 000FCC30  28 03 00 00 */	cmplwi r3, 0
/* 80100D14 000FCC34  41 82 00 10 */	beq lbl_80100D24
/* 80100D18 000FCC38  80 04 00 00 */	lwz r0, 0(r4)
/* 80100D1C 000FCC3C  90 03 00 00 */	stw r0, 0(r3)
/* 80100D20 000FCC40  48 00 00 20 */	b lbl_80100D40
lbl_80100D24:
/* 80100D24 000FCC44  80 04 00 00 */	lwz r0, 0(r4)
/* 80100D28 000FCC48  90 0D A5 68 */	stw r0, aramUsedStreamBuffers@sda21(r13)
/* 80100D2C 000FCC4C  48 00 00 14 */	b lbl_80100D40
lbl_80100D30:
/* 80100D30 000FCC50  7C A3 2B 78 */	mr r3, r5
/* 80100D34 000FCC54  80 A5 00 00 */	lwz r5, 0(r5)
lbl_80100D38:
/* 80100D38 000FCC58  28 05 00 00 */	cmplwi r5, 0
/* 80100D3C 000FCC5C  40 82 FF CC */	bne lbl_80100D08
lbl_80100D40:
/* 80100D40 000FCC60  80 64 00 04 */	lwz r3, 4(r4)
/* 80100D44 000FCC64  80 0D A5 60 */	lwz r0, aramStream@sda21(r13)
/* 80100D48 000FCC68  7C 03 00 40 */	cmplw r3, r0
/* 80100D4C 000FCC6C  40 82 00 8C */	bne lbl_80100DD8
/* 80100D50 000FCC70  80 0D A5 70 */	lwz r0, aramIdleStreamBuffers@sda21(r13)
/* 80100D54 000FCC74  38 A0 FF FF */	li r5, -1
/* 80100D58 000FCC78  90 04 00 00 */	stw r0, 0(r4)
/* 80100D5C 000FCC7C  90 8D A5 70 */	stw r4, aramIdleStreamBuffers@sda21(r13)
/* 80100D60 000FCC80  80 6D A5 68 */	lwz r3, aramUsedStreamBuffers@sda21(r13)
/* 80100D64 000FCC84  48 00 00 18 */	b lbl_80100D7C
lbl_80100D68:
/* 80100D68 000FCC88  80 03 00 04 */	lwz r0, 4(r3)
/* 80100D6C 000FCC8C  7C 00 28 40 */	cmplw r0, r5
/* 80100D70 000FCC90  41 81 00 08 */	bgt lbl_80100D78
/* 80100D74 000FCC94  7C 05 03 78 */	mr r5, r0
lbl_80100D78:
/* 80100D78 000FCC98  80 63 00 00 */	lwz r3, 0(r3)
lbl_80100D7C:
/* 80100D7C 000FCC9C  28 03 00 00 */	cmplwi r3, 0
/* 80100D80 000FCCA0  40 82 FF E8 */	bne lbl_80100D68
/* 80100D84 000FCCA4  80 8D A5 6C */	lwz r4, aramFreeStreamBuffers@sda21(r13)
/* 80100D88 000FCCA8  48 00 00 28 */	b lbl_80100DB0
lbl_80100D8C:
/* 80100D8C 000FCCAC  80 04 00 04 */	lwz r0, 4(r4)
/* 80100D90 000FCCB0  80 64 00 00 */	lwz r3, 0(r4)
/* 80100D94 000FCCB4  7C 00 28 40 */	cmplw r0, r5
/* 80100D98 000FCCB8  40 80 00 14 */	bge lbl_80100DAC
/* 80100D9C 000FCCBC  90 6D A5 6C */	stw r3, aramFreeStreamBuffers@sda21(r13)
/* 80100DA0 000FCCC0  80 0D A5 70 */	lwz r0, aramIdleStreamBuffers@sda21(r13)
/* 80100DA4 000FCCC4  90 04 00 00 */	stw r0, 0(r4)
/* 80100DA8 000FCCC8  90 8D A5 70 */	stw r4, aramIdleStreamBuffers@sda21(r13)
lbl_80100DAC:
/* 80100DAC 000FCCCC  7C 64 1B 78 */	mr r4, r3
lbl_80100DB0:
/* 80100DB0 000FCCD0  28 04 00 00 */	cmplwi r4, 0
/* 80100DB4 000FCCD4  40 82 FF D8 */	bne lbl_80100D8C
/* 80100DB8 000FCCD8  3C 05 00 01 */	addis r0, r5, 1
/* 80100DBC 000FCCDC  28 00 FF FF */	cmplwi r0, 0xffff
/* 80100DC0 000FCCE0  41 82 00 0C */	beq lbl_80100DCC
/* 80100DC4 000FCCE4  7C A0 2B 78 */	mr r0, r5
/* 80100DC8 000FCCE8  48 00 00 08 */	b lbl_80100DD0
lbl_80100DCC:
/* 80100DCC 000FCCEC  80 0D A5 58 */	lwz r0, aramTop@sda21(r13)
lbl_80100DD0:
/* 80100DD0 000FCCF0  90 0D A5 60 */	stw r0, aramStream@sda21(r13)
/* 80100DD4 000FCCF4  4E 80 00 20 */	blr
lbl_80100DD8:
/* 80100DD8 000FCCF8  80 0D A5 6C */	lwz r0, aramFreeStreamBuffers@sda21(r13)
/* 80100DDC 000FCCFC  90 04 00 00 */	stw r0, 0(r4)
/* 80100DE0 000FCD00  90 8D A5 6C */	stw r4, aramFreeStreamBuffers@sda21(r13)
/* 80100DE4 000FCD04  4E 80 00 20 */	blr

.section .sbss

.global aramTop
aramTop:
	.skip 0x4
.global aramWrite
aramWrite:
	.skip 0x4
.global aramStream
aramStream:
	.skip 0x4
.global aramQueueWrite
aramQueueWrite:
	.skip 0x1
.global aramQueueValid
aramQueueValid:
	.skip 0x3
.global aramUsedStreamBuffers
aramUsedStreamBuffers:
	.skip 0x4
.global aramFreeStreamBuffers
aramFreeStreamBuffers:
	.skip 0x4
.global aramIdleStreamBuffers
aramIdleStreamBuffers:
	.skip 0x8

.section .bss

.global lbl_802EB870
lbl_802EB870:
	.skip 0x200
.global lbl_802EBA70
lbl_802EBA70:
	.skip 0x410
