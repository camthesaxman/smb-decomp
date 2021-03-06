.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKInitializeEventQueue
TRKInitializeEventQueue:
/* 801099FC 0010591C  7C 08 02 A6 */	mflr r0
/* 80109A00 00105920  3C 60 80 2F */	lis r3, gTRKEventQueue@ha
/* 80109A04 00105924  90 01 00 04 */	stw r0, 4(r1)
/* 80109A08 00105928  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80109A0C 0010592C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80109A10 00105930  3B E3 E2 40 */	addi r31, r3, gTRKEventQueue@l
/* 80109A14 00105934  38 7F 00 00 */	addi r3, r31, 0
/* 80109A18 00105938  48 00 25 C9 */	bl TRKInitializeMutex
/* 80109A1C 0010593C  7F E3 FB 78 */	mr r3, r31
/* 80109A20 00105940  48 00 25 C9 */	bl TRKAcquireMutex
/* 80109A24 00105944  38 60 00 00 */	li r3, 0
/* 80109A28 00105948  90 7F 00 04 */	stw r3, 4(r31)
/* 80109A2C 0010594C  38 00 01 00 */	li r0, 0x100
/* 80109A30 00105950  90 7F 00 08 */	stw r3, 8(r31)
/* 80109A34 00105954  7F E3 FB 78 */	mr r3, r31
/* 80109A38 00105958  90 1F 00 24 */	stw r0, 0x24(r31)
/* 80109A3C 0010595C  48 00 25 B5 */	bl TRKReleaseMutex
/* 80109A40 00105960  38 60 00 00 */	li r3, 0
/* 80109A44 00105964  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80109A48 00105968  38 21 00 10 */	addi r1, r1, 0x10
/* 80109A4C 0010596C  80 01 00 04 */	lwz r0, 4(r1)
/* 80109A50 00105970  7C 08 03 A6 */	mtlr r0
/* 80109A54 00105974  4E 80 00 20 */	blr

.global TRKCopyEvent
TRKCopyEvent:
/* 80109A58 00105978  7C 08 02 A6 */	mflr r0
/* 80109A5C 0010597C  38 A0 00 0C */	li r5, 0xc
/* 80109A60 00105980  90 01 00 04 */	stw r0, 4(r1)
/* 80109A64 00105984  94 21 FF F8 */	stwu r1, -8(r1)
/* 80109A68 00105988  4B EF 99 FD */	bl TRK_memcpy
/* 80109A6C 0010598C  38 21 00 08 */	addi r1, r1, 8
/* 80109A70 00105990  80 01 00 04 */	lwz r0, 4(r1)
/* 80109A74 00105994  7C 08 03 A6 */	mtlr r0
/* 80109A78 00105998  4E 80 00 20 */	blr

.global TRKGetNextEvent
TRKGetNextEvent:
/* 80109A7C 0010599C  7C 08 02 A6 */	mflr r0
/* 80109A80 001059A0  3C 80 80 2F */	lis r4, gTRKEventQueue@ha
/* 80109A84 001059A4  90 01 00 04 */	stw r0, 4(r1)
/* 80109A88 001059A8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80109A8C 001059AC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80109A90 001059B0  3B E4 E2 40 */	addi r31, r4, gTRKEventQueue@l
/* 80109A94 001059B4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80109A98 001059B8  93 A1 00 0C */	stw r29, 0xc(r1)
/* 80109A9C 001059BC  3B A0 00 00 */	li r29, 0
/* 80109AA0 001059C0  93 81 00 08 */	stw r28, 8(r1)
/* 80109AA4 001059C4  3B 83 00 00 */	addi r28, r3, 0
/* 80109AA8 001059C8  38 7F 00 00 */	addi r3, r31, 0
/* 80109AAC 001059CC  48 00 25 3D */	bl TRKAcquireMutex
/* 80109AB0 001059D0  3B DF 00 04 */	addi r30, r31, 4
/* 80109AB4 001059D4  80 1F 00 04 */	lwz r0, 4(r31)
/* 80109AB8 001059D8  2C 00 00 00 */	cmpwi r0, 0
/* 80109ABC 001059DC  40 81 00 50 */	ble lbl_80109B0C
/* 80109AC0 001059E0  3B BF 00 08 */	addi r29, r31, 8
/* 80109AC4 001059E4  80 1F 00 08 */	lwz r0, 8(r31)
/* 80109AC8 001059E8  38 7C 00 00 */	addi r3, r28, 0
/* 80109ACC 001059EC  1C 00 00 0C */	mulli r0, r0, 0xc
/* 80109AD0 001059F0  7C 9F 02 14 */	add r4, r31, r0
/* 80109AD4 001059F4  38 84 00 0C */	addi r4, r4, 0xc
/* 80109AD8 001059F8  4B FF FF 81 */	bl TRKCopyEvent
/* 80109ADC 001059FC  80 7E 00 00 */	lwz r3, 0(r30)
/* 80109AE0 00105A00  38 03 FF FF */	addi r0, r3, -1
/* 80109AE4 00105A04  90 1E 00 00 */	stw r0, 0(r30)
/* 80109AE8 00105A08  80 7D 00 00 */	lwz r3, 0(r29)
/* 80109AEC 00105A0C  38 03 00 01 */	addi r0, r3, 1
/* 80109AF0 00105A10  90 1D 00 00 */	stw r0, 0(r29)
/* 80109AF4 00105A14  80 1D 00 00 */	lwz r0, 0(r29)
/* 80109AF8 00105A18  2C 00 00 02 */	cmpwi r0, 2
/* 80109AFC 00105A1C  40 82 00 0C */	bne lbl_80109B08
/* 80109B00 00105A20  38 00 00 00 */	li r0, 0
/* 80109B04 00105A24  90 1D 00 00 */	stw r0, 0(r29)
lbl_80109B08:
/* 80109B08 00105A28  3B A0 00 01 */	li r29, 1
lbl_80109B0C:
/* 80109B0C 00105A2C  3C 60 80 2F */	lis r3, gTRKEventQueue@ha
/* 80109B10 00105A30  38 63 E2 40 */	addi r3, r3, gTRKEventQueue@l
/* 80109B14 00105A34  48 00 24 DD */	bl TRKReleaseMutex
/* 80109B18 00105A38  7F A3 EB 78 */	mr r3, r29
/* 80109B1C 00105A3C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80109B20 00105A40  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80109B24 00105A44  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 80109B28 00105A48  83 81 00 08 */	lwz r28, 8(r1)
/* 80109B2C 00105A4C  38 21 00 18 */	addi r1, r1, 0x18
/* 80109B30 00105A50  80 01 00 04 */	lwz r0, 4(r1)
/* 80109B34 00105A54  7C 08 03 A6 */	mtlr r0
/* 80109B38 00105A58  4E 80 00 20 */	blr

.global TRKPostEvent
TRKPostEvent:
/* 80109B3C 00105A5C  7C 08 02 A6 */	mflr r0
/* 80109B40 00105A60  3C 80 80 2F */	lis r4, gTRKEventQueue@ha
/* 80109B44 00105A64  90 01 00 04 */	stw r0, 4(r1)
/* 80109B48 00105A68  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80109B4C 00105A6C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80109B50 00105A70  3B E3 00 00 */	addi r31, r3, 0
/* 80109B54 00105A74  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80109B58 00105A78  3B C4 E2 40 */	addi r30, r4, gTRKEventQueue@l
/* 80109B5C 00105A7C  38 7E 00 00 */	addi r3, r30, 0
/* 80109B60 00105A80  93 A1 00 0C */	stw r29, 0xc(r1)
/* 80109B64 00105A84  93 81 00 08 */	stw r28, 8(r1)
/* 80109B68 00105A88  3B 80 00 00 */	li r28, 0
/* 80109B6C 00105A8C  48 00 24 7D */	bl TRKAcquireMutex
/* 80109B70 00105A90  3B BE 00 04 */	addi r29, r30, 4
/* 80109B74 00105A94  80 7E 00 04 */	lwz r3, 4(r30)
/* 80109B78 00105A98  2C 03 00 02 */	cmpwi r3, 2
/* 80109B7C 00105A9C  40 82 00 0C */	bne lbl_80109B88
/* 80109B80 00105AA0  3B 80 01 00 */	li r28, 0x100
/* 80109B84 00105AA4  48 00 00 68 */	b lbl_80109BEC
lbl_80109B88:
/* 80109B88 00105AA8  80 1E 00 08 */	lwz r0, 8(r30)
/* 80109B8C 00105AAC  38 9F 00 00 */	addi r4, r31, 0
/* 80109B90 00105AB0  7C 00 1A 14 */	add r0, r0, r3
/* 80109B94 00105AB4  7C 03 0E 70 */	srawi r3, r0, 1
/* 80109B98 00105AB8  7C 63 01 94 */	addze r3, r3
/* 80109B9C 00105ABC  54 63 08 3C */	slwi r3, r3, 1
/* 80109BA0 00105AC0  7C 63 00 10 */	subfc r3, r3, r0
/* 80109BA4 00105AC4  1C 03 00 0C */	mulli r0, r3, 0xc
/* 80109BA8 00105AC8  7F FE 02 14 */	add r31, r30, r0
/* 80109BAC 00105ACC  38 7F 00 0C */	addi r3, r31, 0xc
/* 80109BB0 00105AD0  4B FF FE A9 */	bl TRKCopyEvent
/* 80109BB4 00105AD4  38 9E 00 24 */	addi r4, r30, 0x24
/* 80109BB8 00105AD8  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80109BBC 00105ADC  90 1F 00 10 */	stw r0, 0x10(r31)
/* 80109BC0 00105AE0  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 80109BC4 00105AE4  38 03 00 01 */	addi r0, r3, 1
/* 80109BC8 00105AE8  90 1E 00 24 */	stw r0, 0x24(r30)
/* 80109BCC 00105AEC  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80109BD0 00105AF0  28 00 01 00 */	cmplwi r0, 0x100
/* 80109BD4 00105AF4  40 80 00 0C */	bge lbl_80109BE0
/* 80109BD8 00105AF8  38 00 01 00 */	li r0, 0x100
/* 80109BDC 00105AFC  90 04 00 00 */	stw r0, 0(r4)
lbl_80109BE0:
/* 80109BE0 00105B00  80 7D 00 00 */	lwz r3, 0(r29)
/* 80109BE4 00105B04  38 03 00 01 */	addi r0, r3, 1
/* 80109BE8 00105B08  90 1D 00 00 */	stw r0, 0(r29)
lbl_80109BEC:
/* 80109BEC 00105B0C  3C 60 80 2F */	lis r3, gTRKEventQueue@ha
/* 80109BF0 00105B10  38 63 E2 40 */	addi r3, r3, gTRKEventQueue@l
/* 80109BF4 00105B14  48 00 23 FD */	bl TRKReleaseMutex
/* 80109BF8 00105B18  7F 83 E3 78 */	mr r3, r28
/* 80109BFC 00105B1C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80109C00 00105B20  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80109C04 00105B24  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 80109C08 00105B28  83 81 00 08 */	lwz r28, 8(r1)
/* 80109C0C 00105B2C  38 21 00 18 */	addi r1, r1, 0x18
/* 80109C10 00105B30  80 01 00 04 */	lwz r0, 4(r1)
/* 80109C14 00105B34  7C 08 03 A6 */	mtlr r0
/* 80109C18 00105B38  4E 80 00 20 */	blr

.global TRKConstructEvent
TRKConstructEvent:
/* 80109C1C 00105B3C  98 83 00 00 */	stb r4, 0(r3)
/* 80109C20 00105B40  38 80 00 00 */	li r4, 0
/* 80109C24 00105B44  38 00 FF FF */	li r0, -1
/* 80109C28 00105B48  90 83 00 04 */	stw r4, 4(r3)
/* 80109C2C 00105B4C  90 03 00 08 */	stw r0, 8(r3)
/* 80109C30 00105B50  4E 80 00 20 */	blr

.global TRKDestructEvent
TRKDestructEvent:
/* 80109C34 00105B54  7C 08 02 A6 */	mflr r0
/* 80109C38 00105B58  90 01 00 04 */	stw r0, 4(r1)
/* 80109C3C 00105B5C  94 21 FF F8 */	stwu r1, -8(r1)
/* 80109C40 00105B60  80 63 00 08 */	lwz r3, 8(r3)
/* 80109C44 00105B64  48 00 03 19 */	bl TRKReleaseBuffer
/* 80109C48 00105B68  38 21 00 08 */	addi r1, r1, 8
/* 80109C4C 00105B6C  80 01 00 04 */	lwz r0, 4(r1)
/* 80109C50 00105B70  7C 08 03 A6 */	mtlr r0
/* 80109C54 00105B74  4E 80 00 20 */	blr

.section .bss

.global gTRKEventQueue
gTRKEventQueue:
	.skip 0x28
