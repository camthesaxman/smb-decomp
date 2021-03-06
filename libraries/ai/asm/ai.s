.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global AIRegisterDMACallback
AIRegisterDMACallback:
/* 800D28E4 000CE804  7C 08 02 A6 */	mflr r0
/* 800D28E8 000CE808  90 01 00 04 */	stw r0, 4(r1)
/* 800D28EC 000CE80C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800D28F0 000CE810  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800D28F4 000CE814  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800D28F8 000CE818  7C 7E 1B 78 */	mr r30, r3
/* 800D28FC 000CE81C  83 ED A2 BC */	lwz r31, __AID_Callback@sda21(r13)
/* 800D2900 000CE820  4B FF 37 BD */	bl OSDisableInterrupts
/* 800D2904 000CE824  93 CD A2 BC */	stw r30, __AID_Callback@sda21(r13)
/* 800D2908 000CE828  4B FF 37 DD */	bl OSRestoreInterrupts
/* 800D290C 000CE82C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800D2910 000CE830  7F E3 FB 78 */	mr r3, r31
/* 800D2914 000CE834  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800D2918 000CE838  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800D291C 000CE83C  7C 08 03 A6 */	mtlr r0
/* 800D2920 000CE840  38 21 00 18 */	addi r1, r1, 0x18
/* 800D2924 000CE844  4E 80 00 20 */	blr

.global AIInitDMA
AIInitDMA:
/* 800D2928 000CE848  7C 08 02 A6 */	mflr r0
/* 800D292C 000CE84C  90 01 00 04 */	stw r0, 4(r1)
/* 800D2930 000CE850  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800D2934 000CE854  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800D2938 000CE858  3B E4 00 00 */	addi r31, r4, 0
/* 800D293C 000CE85C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800D2940 000CE860  3B C3 00 00 */	addi r30, r3, 0
/* 800D2944 000CE864  4B FF 37 79 */	bl OSDisableInterrupts
/* 800D2948 000CE868  3C 80 CC 00 */	lis r4, 0xCC005030@ha
/* 800D294C 000CE86C  A0 04 50 30 */	lhz r0, 0xCC005030@l(r4)
/* 800D2950 000CE870  38 A4 50 00 */	addi r5, r4, 0x5000
/* 800D2954 000CE874  38 C4 50 00 */	addi r6, r4, 0x5000
/* 800D2958 000CE878  38 E4 50 00 */	addi r7, r4, 0x5000
/* 800D295C 000CE87C  54 04 00 2A */	rlwinm r4, r0, 0, 0, 0x15
/* 800D2960 000CE880  57 C0 84 3E */	srwi r0, r30, 0x10
/* 800D2964 000CE884  7C 80 03 78 */	or r0, r4, r0
/* 800D2968 000CE888  B0 05 00 30 */	sth r0, 0x30(r5)
/* 800D296C 000CE88C  57 C0 04 3E */	clrlwi r0, r30, 0x10
/* 800D2970 000CE890  A0 86 00 32 */	lhz r4, 0x32(r6)
/* 800D2974 000CE894  54 84 06 DE */	rlwinm r4, r4, 0, 0x1b, 0xf
/* 800D2978 000CE898  7C 80 03 78 */	or r0, r4, r0
/* 800D297C 000CE89C  B0 06 00 32 */	sth r0, 0x32(r6)
/* 800D2980 000CE8A0  57 E0 DC 3E */	rlwinm r0, r31, 0x1b, 0x10, 0x1f
/* 800D2984 000CE8A4  A0 87 00 36 */	lhz r4, 0x36(r7)
/* 800D2988 000CE8A8  54 84 00 20 */	rlwinm r4, r4, 0, 0, 0x10
/* 800D298C 000CE8AC  7C 80 03 78 */	or r0, r4, r0
/* 800D2990 000CE8B0  B0 07 00 36 */	sth r0, 0x36(r7)
/* 800D2994 000CE8B4  4B FF 37 51 */	bl OSRestoreInterrupts
/* 800D2998 000CE8B8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800D299C 000CE8BC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800D29A0 000CE8C0  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800D29A4 000CE8C4  7C 08 03 A6 */	mtlr r0
/* 800D29A8 000CE8C8  38 21 00 18 */	addi r1, r1, 0x18
/* 800D29AC 000CE8CC  4E 80 00 20 */	blr

.global AIStartDMA
AIStartDMA:
/* 800D29B0 000CE8D0  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 800D29B4 000CE8D4  38 63 50 00 */	addi r3, r3, 0xCC005000@l
/* 800D29B8 000CE8D8  A0 03 00 36 */	lhz r0, 0x36(r3)
/* 800D29BC 000CE8DC  60 00 80 00 */	ori r0, r0, 0x8000
/* 800D29C0 000CE8E0  B0 03 00 36 */	sth r0, 0x36(r3)
/* 800D29C4 000CE8E4  4E 80 00 20 */	blr

.global AIRegisterStreamCallback
AIRegisterStreamCallback:
/* 800D29C8 000CE8E8  7C 08 02 A6 */	mflr r0
/* 800D29CC 000CE8EC  90 01 00 04 */	stw r0, 4(r1)
/* 800D29D0 000CE8F0  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800D29D4 000CE8F4  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800D29D8 000CE8F8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800D29DC 000CE8FC  7C 7E 1B 78 */	mr r30, r3
/* 800D29E0 000CE900  83 ED A2 B8 */	lwz r31, __AIS_Callback@sda21(r13)
/* 800D29E4 000CE904  4B FF 36 D9 */	bl OSDisableInterrupts
/* 800D29E8 000CE908  93 CD A2 B8 */	stw r30, __AIS_Callback@sda21(r13)
/* 800D29EC 000CE90C  4B FF 36 F9 */	bl OSRestoreInterrupts
/* 800D29F0 000CE910  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800D29F4 000CE914  7F E3 FB 78 */	mr r3, r31
/* 800D29F8 000CE918  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800D29FC 000CE91C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800D2A00 000CE920  7C 08 03 A6 */	mtlr r0
/* 800D2A04 000CE924  38 21 00 18 */	addi r1, r1, 0x18
/* 800D2A08 000CE928  4E 80 00 20 */	blr

.global AIGetStreamSampleCount
AIGetStreamSampleCount:
/* 800D2A0C 000CE92C  3C 60 CC 00 */	lis r3, 0xCC006C00@ha
/* 800D2A10 000CE930  38 63 6C 00 */	addi r3, r3, 0xCC006C00@l
/* 800D2A14 000CE934  80 63 00 08 */	lwz r3, 8(r3)
/* 800D2A18 000CE938  4E 80 00 20 */	blr

.global AIResetStreamSampleCount
AIResetStreamSampleCount:
/* 800D2A1C 000CE93C  3C 60 CC 00 */	lis r3, 0xCC006C00@ha
/* 800D2A20 000CE940  80 03 6C 00 */	lwz r0, 0xCC006C00@l(r3)
/* 800D2A24 000CE944  54 00 06 F2 */	rlwinm r0, r0, 0, 0x1b, 0x19
/* 800D2A28 000CE948  60 00 00 20 */	ori r0, r0, 0x20
/* 800D2A2C 000CE94C  90 03 6C 00 */	stw r0, 0x6c00(r3)
/* 800D2A30 000CE950  4E 80 00 20 */	blr

.global AISetStreamTrigger
AISetStreamTrigger:
/* 800D2A34 000CE954  3C 80 CC 00 */	lis r4, 0xCC006C0C@ha
/* 800D2A38 000CE958  90 64 6C 0C */	stw r3, 0xCC006C0C@l(r4)
/* 800D2A3C 000CE95C  4E 80 00 20 */	blr

.global AISetStreamPlayState
AISetStreamPlayState:
/* 800D2A40 000CE960  7C 08 02 A6 */	mflr r0
/* 800D2A44 000CE964  90 01 00 04 */	stw r0, 4(r1)
/* 800D2A48 000CE968  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800D2A4C 000CE96C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800D2A50 000CE970  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800D2A54 000CE974  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800D2A58 000CE978  7C 7D 1B 78 */	mr r29, r3
/* 800D2A5C 000CE97C  48 00 00 BD */	bl AIGetStreamPlayState
/* 800D2A60 000CE980  7C 1D 18 40 */	cmplw r29, r3
/* 800D2A64 000CE984  41 82 00 98 */	beq lbl_800D2AFC
/* 800D2A68 000CE988  48 00 02 B1 */	bl AIGetStreamSampleRate
/* 800D2A6C 000CE98C  28 03 00 00 */	cmplwi r3, 0
/* 800D2A70 000CE990  40 82 00 78 */	bne lbl_800D2AE8
/* 800D2A74 000CE994  28 1D 00 01 */	cmplwi r29, 1
/* 800D2A78 000CE998  40 82 00 70 */	bne lbl_800D2AE8
/* 800D2A7C 000CE99C  48 00 02 F5 */	bl AIGetStreamVolRight
/* 800D2A80 000CE9A0  7C 7E 1B 78 */	mr r30, r3
/* 800D2A84 000CE9A4  48 00 02 C1 */	bl AIGetStreamVolLeft
/* 800D2A88 000CE9A8  3B A3 00 00 */	addi r29, r3, 0
/* 800D2A8C 000CE9AC  38 60 00 00 */	li r3, 0
/* 800D2A90 000CE9B0  48 00 02 C5 */	bl AISetStreamVolRight
/* 800D2A94 000CE9B4  38 60 00 00 */	li r3, 0
/* 800D2A98 000CE9B8  48 00 02 91 */	bl AISetStreamVolLeft
/* 800D2A9C 000CE9BC  4B FF 36 21 */	bl OSDisableInterrupts
/* 800D2AA0 000CE9C0  7C 7F 1B 78 */	mr r31, r3
/* 800D2AA4 000CE9C4  48 00 05 A5 */	bl __AI_SRC_INIT
/* 800D2AA8 000CE9C8  3C 80 CC 00 */	lis r4, 0xCC006C00@ha
/* 800D2AAC 000CE9CC  80 04 6C 00 */	lwz r0, 0xCC006C00@l(r4)
/* 800D2AB0 000CE9D0  38 7F 00 00 */	addi r3, r31, 0
/* 800D2AB4 000CE9D4  54 00 06 F2 */	rlwinm r0, r0, 0, 0x1b, 0x19
/* 800D2AB8 000CE9D8  60 00 00 20 */	ori r0, r0, 0x20
/* 800D2ABC 000CE9DC  90 04 6C 00 */	stw r0, 0x6c00(r4)
/* 800D2AC0 000CE9E0  80 04 6C 00 */	lwz r0, 0x6c00(r4)
/* 800D2AC4 000CE9E4  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800D2AC8 000CE9E8  60 00 00 01 */	ori r0, r0, 1
/* 800D2ACC 000CE9EC  90 04 6C 00 */	stw r0, 0x6c00(r4)
/* 800D2AD0 000CE9F0  4B FF 36 15 */	bl OSRestoreInterrupts
/* 800D2AD4 000CE9F4  7F C3 F3 78 */	mr r3, r30
/* 800D2AD8 000CE9F8  48 00 02 51 */	bl AISetStreamVolLeft
/* 800D2ADC 000CE9FC  7F A3 EB 78 */	mr r3, r29
/* 800D2AE0 000CEA00  48 00 02 75 */	bl AISetStreamVolRight
/* 800D2AE4 000CEA04  48 00 00 18 */	b lbl_800D2AFC
lbl_800D2AE8:
/* 800D2AE8 000CEA08  3C 60 CC 00 */	lis r3, 0xCC006C00@ha
/* 800D2AEC 000CEA0C  80 03 6C 00 */	lwz r0, 0xCC006C00@l(r3)
/* 800D2AF0 000CEA10  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800D2AF4 000CEA14  7C 00 EB 78 */	or r0, r0, r29
/* 800D2AF8 000CEA18  90 03 6C 00 */	stw r0, 0x6c00(r3)
lbl_800D2AFC:
/* 800D2AFC 000CEA1C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800D2B00 000CEA20  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800D2B04 000CEA24  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800D2B08 000CEA28  7C 08 03 A6 */	mtlr r0
/* 800D2B0C 000CEA2C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800D2B10 000CEA30  38 21 00 20 */	addi r1, r1, 0x20
/* 800D2B14 000CEA34  4E 80 00 20 */	blr

.global AIGetStreamPlayState
AIGetStreamPlayState:
/* 800D2B18 000CEA38  3C 60 CC 00 */	lis r3, 0xCC006C00@ha
/* 800D2B1C 000CEA3C  80 03 6C 00 */	lwz r0, 0xCC006C00@l(r3)
/* 800D2B20 000CEA40  54 03 07 FE */	clrlwi r3, r0, 0x1f
/* 800D2B24 000CEA44  4E 80 00 20 */	blr

.global AISetDSPSampleRate
AISetDSPSampleRate:
/* 800D2B28 000CEA48  7C 08 02 A6 */	mflr r0
/* 800D2B2C 000CEA4C  90 01 00 04 */	stw r0, 4(r1)
/* 800D2B30 000CEA50  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800D2B34 000CEA54  BF 41 00 10 */	stmw r26, 0x10(r1)
/* 800D2B38 000CEA58  7C 7A 1B 78 */	mr r26, r3
/* 800D2B3C 000CEA5C  48 00 00 CD */	bl AIGetDSPSampleRate
/* 800D2B40 000CEA60  7C 1A 18 40 */	cmplw r26, r3
/* 800D2B44 000CEA64  41 82 00 B0 */	beq lbl_800D2BF4
/* 800D2B48 000CEA68  3F E0 CC 00 */	lis r31, 0xCC006C00@ha
/* 800D2B4C 000CEA6C  80 1F 6C 00 */	lwz r0, 0xCC006C00@l(r31)
/* 800D2B50 000CEA70  28 1A 00 00 */	cmplwi r26, 0
/* 800D2B54 000CEA74  54 00 06 B0 */	rlwinm r0, r0, 0, 0x1a, 0x18
/* 800D2B58 000CEA78  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D2B5C 000CEA7C  40 82 00 98 */	bne lbl_800D2BF4
/* 800D2B60 000CEA80  48 00 01 E5 */	bl AIGetStreamVolLeft
/* 800D2B64 000CEA84  7C 7E 1B 78 */	mr r30, r3
/* 800D2B68 000CEA88  48 00 02 09 */	bl AIGetStreamVolRight
/* 800D2B6C 000CEA8C  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D2B70 000CEA90  3B A3 00 00 */	addi r29, r3, 0
/* 800D2B74 000CEA94  54 1B 07 FE */	clrlwi r27, r0, 0x1f
/* 800D2B78 000CEA98  48 00 01 A1 */	bl AIGetStreamSampleRate
/* 800D2B7C 000CEA9C  3B 83 00 00 */	addi r28, r3, 0
/* 800D2B80 000CEAA0  38 60 00 00 */	li r3, 0
/* 800D2B84 000CEAA4  48 00 01 A5 */	bl AISetStreamVolLeft
/* 800D2B88 000CEAA8  38 60 00 00 */	li r3, 0
/* 800D2B8C 000CEAAC  48 00 01 C9 */	bl AISetStreamVolRight
/* 800D2B90 000CEAB0  4B FF 35 2D */	bl OSDisableInterrupts
/* 800D2B94 000CEAB4  7C 7A 1B 78 */	mr r26, r3
/* 800D2B98 000CEAB8  48 00 04 B1 */	bl __AI_SRC_INIT
/* 800D2B9C 000CEABC  80 9F 6C 00 */	lwz r4, 0x6c00(r31)
/* 800D2BA0 000CEAC0  57 80 08 3C */	slwi r0, r28, 1
/* 800D2BA4 000CEAC4  38 7A 00 00 */	addi r3, r26, 0
/* 800D2BA8 000CEAC8  54 84 06 F2 */	rlwinm r4, r4, 0, 0x1b, 0x19
/* 800D2BAC 000CEACC  60 84 00 20 */	ori r4, r4, 0x20
/* 800D2BB0 000CEAD0  90 9F 6C 00 */	stw r4, 0x6c00(r31)
/* 800D2BB4 000CEAD4  80 9F 6C 00 */	lwz r4, 0x6c00(r31)
/* 800D2BB8 000CEAD8  54 84 07 FA */	rlwinm r4, r4, 0, 0x1f, 0x1d
/* 800D2BBC 000CEADC  7C 80 03 78 */	or r0, r4, r0
/* 800D2BC0 000CEAE0  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D2BC4 000CEAE4  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D2BC8 000CEAE8  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800D2BCC 000CEAEC  7C 00 DB 78 */	or r0, r0, r27
/* 800D2BD0 000CEAF0  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D2BD4 000CEAF4  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D2BD8 000CEAF8  60 00 00 40 */	ori r0, r0, 0x40
/* 800D2BDC 000CEAFC  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D2BE0 000CEB00  4B FF 35 05 */	bl OSRestoreInterrupts
/* 800D2BE4 000CEB04  7F C3 F3 78 */	mr r3, r30
/* 800D2BE8 000CEB08  48 00 01 41 */	bl AISetStreamVolLeft
/* 800D2BEC 000CEB0C  7F A3 EB 78 */	mr r3, r29
/* 800D2BF0 000CEB10  48 00 01 65 */	bl AISetStreamVolRight
lbl_800D2BF4:
/* 800D2BF4 000CEB14  BB 41 00 10 */	lmw r26, 0x10(r1)
/* 800D2BF8 000CEB18  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800D2BFC 000CEB1C  38 21 00 28 */	addi r1, r1, 0x28
/* 800D2C00 000CEB20  7C 08 03 A6 */	mtlr r0
/* 800D2C04 000CEB24  4E 80 00 20 */	blr

.global AIGetDSPSampleRate
AIGetDSPSampleRate:
/* 800D2C08 000CEB28  3C 60 CC 00 */	lis r3, 0xCC006C00@ha
/* 800D2C0C 000CEB2C  80 03 6C 00 */	lwz r0, 0xCC006C00@l(r3)
/* 800D2C10 000CEB30  54 00 D7 FE */	rlwinm r0, r0, 0x1a, 0x1f, 0x1f
/* 800D2C14 000CEB34  68 03 00 01 */	xori r3, r0, 1
/* 800D2C18 000CEB38  4E 80 00 20 */	blr

.global AISetStreamSampleRate
AISetStreamSampleRate:
/* 800D2C1C 000CEB3C  7C 08 02 A6 */	mflr r0
/* 800D2C20 000CEB40  28 03 00 01 */	cmplwi r3, 1
/* 800D2C24 000CEB44  90 01 00 04 */	stw r0, 4(r1)
/* 800D2C28 000CEB48  94 21 FF F8 */	stwu r1, -8(r1)
/* 800D2C2C 000CEB4C  40 82 00 08 */	bne lbl_800D2C34
/* 800D2C30 000CEB50  48 00 00 15 */	bl __AI_set_stream_sample_rate
lbl_800D2C34:
/* 800D2C34 000CEB54  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800D2C38 000CEB58  38 21 00 08 */	addi r1, r1, 8
/* 800D2C3C 000CEB5C  7C 08 03 A6 */	mtlr r0
/* 800D2C40 000CEB60  4E 80 00 20 */	blr

.global __AI_set_stream_sample_rate
__AI_set_stream_sample_rate:
/* 800D2C44 000CEB64  7C 08 02 A6 */	mflr r0
/* 800D2C48 000CEB68  90 01 00 04 */	stw r0, 4(r1)
/* 800D2C4C 000CEB6C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800D2C50 000CEB70  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 800D2C54 000CEB74  7C 79 1B 78 */	mr r25, r3
/* 800D2C58 000CEB78  48 00 00 C1 */	bl AIGetStreamSampleRate
/* 800D2C5C 000CEB7C  7C 19 18 40 */	cmplw r25, r3
/* 800D2C60 000CEB80  41 82 00 A4 */	beq lbl_800D2D04
/* 800D2C64 000CEB84  3F E0 CC 00 */	lis r31, 0xCC006C00@ha
/* 800D2C68 000CEB88  80 1F 6C 00 */	lwz r0, 0xCC006C00@l(r31)
/* 800D2C6C 000CEB8C  54 00 07 FE */	clrlwi r0, r0, 0x1f
/* 800D2C70 000CEB90  7C 1D 03 78 */	mr r29, r0
/* 800D2C74 000CEB94  48 00 00 D1 */	bl AIGetStreamVolLeft
/* 800D2C78 000CEB98  7C 7C 1B 78 */	mr r28, r3
/* 800D2C7C 000CEB9C  48 00 00 F5 */	bl AIGetStreamVolRight
/* 800D2C80 000CEBA0  3B 63 00 00 */	addi r27, r3, 0
/* 800D2C84 000CEBA4  38 60 00 00 */	li r3, 0
/* 800D2C88 000CEBA8  48 00 00 CD */	bl AISetStreamVolRight
/* 800D2C8C 000CEBAC  38 60 00 00 */	li r3, 0
/* 800D2C90 000CEBB0  48 00 00 99 */	bl AISetStreamVolLeft
/* 800D2C94 000CEBB4  80 7F 6C 00 */	lwz r3, 0x6c00(r31)
/* 800D2C98 000CEBB8  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D2C9C 000CEBBC  54 7A 06 72 */	rlwinm r26, r3, 0, 0x19, 0x19
/* 800D2CA0 000CEBC0  54 00 06 B0 */	rlwinm r0, r0, 0, 0x1a, 0x18
/* 800D2CA4 000CEBC4  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D2CA8 000CEBC8  4B FF 34 15 */	bl OSDisableInterrupts
/* 800D2CAC 000CEBCC  7C 7E 1B 78 */	mr r30, r3
/* 800D2CB0 000CEBD0  48 00 03 99 */	bl __AI_SRC_INIT
/* 800D2CB4 000CEBD4  80 9F 6C 00 */	lwz r4, 0x6c00(r31)
/* 800D2CB8 000CEBD8  57 20 08 3C */	slwi r0, r25, 1
/* 800D2CBC 000CEBDC  38 7E 00 00 */	addi r3, r30, 0
/* 800D2CC0 000CEBE0  7C 84 D3 78 */	or r4, r4, r26
/* 800D2CC4 000CEBE4  90 9F 6C 00 */	stw r4, 0x6c00(r31)
/* 800D2CC8 000CEBE8  80 9F 6C 00 */	lwz r4, 0x6c00(r31)
/* 800D2CCC 000CEBEC  54 84 06 F2 */	rlwinm r4, r4, 0, 0x1b, 0x19
/* 800D2CD0 000CEBF0  60 84 00 20 */	ori r4, r4, 0x20
/* 800D2CD4 000CEBF4  90 9F 6C 00 */	stw r4, 0x6c00(r31)
/* 800D2CD8 000CEBF8  80 9F 6C 00 */	lwz r4, 0x6c00(r31)
/* 800D2CDC 000CEBFC  54 84 07 FA */	rlwinm r4, r4, 0, 0x1f, 0x1d
/* 800D2CE0 000CEC00  7C 80 03 78 */	or r0, r4, r0
/* 800D2CE4 000CEC04  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D2CE8 000CEC08  4B FF 33 FD */	bl OSRestoreInterrupts
/* 800D2CEC 000CEC0C  7F A3 EB 78 */	mr r3, r29
/* 800D2CF0 000CEC10  4B FF FD 51 */	bl AISetStreamPlayState
/* 800D2CF4 000CEC14  7F 83 E3 78 */	mr r3, r28
/* 800D2CF8 000CEC18  48 00 00 31 */	bl AISetStreamVolLeft
/* 800D2CFC 000CEC1C  7F 63 DB 78 */	mr r3, r27
/* 800D2D00 000CEC20  48 00 00 55 */	bl AISetStreamVolRight
lbl_800D2D04:
/* 800D2D04 000CEC24  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 800D2D08 000CEC28  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800D2D0C 000CEC2C  38 21 00 30 */	addi r1, r1, 0x30
/* 800D2D10 000CEC30  7C 08 03 A6 */	mtlr r0
/* 800D2D14 000CEC34  4E 80 00 20 */	blr

.global AIGetStreamSampleRate
AIGetStreamSampleRate:
/* 800D2D18 000CEC38  3C 60 CC 00 */	lis r3, 0xCC006C00@ha
/* 800D2D1C 000CEC3C  80 03 6C 00 */	lwz r0, 0xCC006C00@l(r3)
/* 800D2D20 000CEC40  54 03 FF FE */	rlwinm r3, r0, 0x1f, 0x1f, 0x1f
/* 800D2D24 000CEC44  4E 80 00 20 */	blr

.global AISetStreamVolLeft
AISetStreamVolLeft:
/* 800D2D28 000CEC48  3C 80 CC 00 */	lis r4, 0xCC006C00@ha
/* 800D2D2C 000CEC4C  38 84 6C 00 */	addi r4, r4, 0xCC006C00@l
/* 800D2D30 000CEC50  80 04 00 04 */	lwz r0, 4(r4)
/* 800D2D34 000CEC54  54 00 00 2E */	rlwinm r0, r0, 0, 0, 0x17
/* 800D2D38 000CEC58  50 60 06 3E */	rlwimi r0, r3, 0, 0x18, 0x1f
/* 800D2D3C 000CEC5C  90 04 00 04 */	stw r0, 4(r4)
/* 800D2D40 000CEC60  4E 80 00 20 */	blr

.global AIGetStreamVolLeft
AIGetStreamVolLeft:
/* 800D2D44 000CEC64  3C 60 CC 00 */	lis r3, 0xCC006C04@ha
/* 800D2D48 000CEC68  80 03 6C 04 */	lwz r0, 0xCC006C04@l(r3)
/* 800D2D4C 000CEC6C  54 03 06 3E */	clrlwi r3, r0, 0x18
/* 800D2D50 000CEC70  4E 80 00 20 */	blr

.global AISetStreamVolRight
AISetStreamVolRight:
/* 800D2D54 000CEC74  3C 80 CC 00 */	lis r4, 0xCC006C00@ha
/* 800D2D58 000CEC78  38 84 6C 00 */	addi r4, r4, 0xCC006C00@l
/* 800D2D5C 000CEC7C  80 04 00 04 */	lwz r0, 4(r4)
/* 800D2D60 000CEC80  54 00 06 1E */	rlwinm r0, r0, 0, 0x18, 0xf
/* 800D2D64 000CEC84  50 60 44 2E */	rlwimi r0, r3, 8, 0x10, 0x17
/* 800D2D68 000CEC88  90 04 00 04 */	stw r0, 4(r4)
/* 800D2D6C 000CEC8C  4E 80 00 20 */	blr

.global AIGetStreamVolRight
AIGetStreamVolRight:
/* 800D2D70 000CEC90  3C 60 CC 00 */	lis r3, 0xCC006C04@ha
/* 800D2D74 000CEC94  80 03 6C 04 */	lwz r0, 0xCC006C04@l(r3)
/* 800D2D78 000CEC98  54 03 C6 3E */	rlwinm r3, r0, 0x18, 0x18, 0x1f
/* 800D2D7C 000CEC9C  4E 80 00 20 */	blr

.global AIInit
AIInit:
/* 800D2D80 000CECA0  7C 08 02 A6 */	mflr r0
/* 800D2D84 000CECA4  90 01 00 04 */	stw r0, 4(r1)
/* 800D2D88 000CECA8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800D2D8C 000CECAC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800D2D90 000CECB0  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800D2D94 000CECB4  3B C3 00 00 */	addi r30, r3, 0
/* 800D2D98 000CECB8  80 0D A2 C8 */	lwz r0, __AI_init_flag@sda21(r13)
/* 800D2D9C 000CECBC  2C 00 00 01 */	cmpwi r0, 1
/* 800D2DA0 000CECC0  41 82 01 2C */	beq lbl_800D2ECC
/* 800D2DA4 000CECC4  3C 60 80 00 */	lis r3, 0x800000F8@ha
/* 800D2DA8 000CECC8  80 03 00 F8 */	lwz r0, 0x800000F8@l(r3)
/* 800D2DAC 000CECCC  3C 60 43 1C */	lis r3, 0x431BDE83@ha
/* 800D2DB0 000CECD0  3C 80 00 01 */	lis r4, 0x0000A428@ha
/* 800D2DB4 000CECD4  54 00 F0 BE */	srwi r0, r0, 2
/* 800D2DB8 000CECD8  38 63 DE 83 */	addi r3, r3, 0x431BDE83@l
/* 800D2DBC 000CECDC  7C 03 00 16 */	mulhwu r0, r3, r0
/* 800D2DC0 000CECE0  54 09 8B FE */	srwi r9, r0, 0xf
/* 800D2DC4 000CECE4  38 A4 A4 28 */	addi r5, r4, 0x0000A428@l
/* 800D2DC8 000CECE8  38 64 A4 10 */	addi r3, r4, -23536
/* 800D2DCC 000CECEC  38 04 F6 18 */	addi r0, r4, -2536
/* 800D2DD0 000CECF0  3C 80 10 62 */	lis r4, 0x10624DD3@ha
/* 800D2DD4 000CECF4  7C E9 29 D6 */	mullw r7, r9, r5
/* 800D2DD8 000CECF8  39 44 4D D3 */	addi r10, r4, 0x10624DD3@l
/* 800D2DDC 000CECFC  7C A9 19 D6 */	mullw r5, r9, r3
/* 800D2DE0 000CED00  7C 89 01 D6 */	mullw r4, r9, r0
/* 800D2DE4 000CED04  1D 09 7B 24 */	mulli r8, r9, 0x7b24
/* 800D2DE8 000CED08  1C 69 0B B8 */	mulli r3, r9, 0xbb8
/* 800D2DEC 000CED0C  7D 0A 40 16 */	mulhwu r8, r10, r8
/* 800D2DF0 000CED10  7C EA 38 16 */	mulhwu r7, r10, r7
/* 800D2DF4 000CED14  7C AA 28 16 */	mulhwu r5, r10, r5
/* 800D2DF8 000CED18  7C 8A 20 16 */	mulhwu r4, r10, r4
/* 800D2DFC 000CED1C  7C 6A 18 16 */	mulhwu r3, r10, r3
/* 800D2E00 000CED20  55 08 BA 7E */	srwi r8, r8, 9
/* 800D2E04 000CED24  54 E7 BA 7E */	srwi r7, r7, 9
/* 800D2E08 000CED28  91 0D A2 D4 */	stw r8, lbl_802F24B4@sda21(r13)
/* 800D2E0C 000CED2C  54 A5 BA 7E */	srwi r5, r5, 9
/* 800D2E10 000CED30  54 84 BA 7E */	srwi r4, r4, 9
/* 800D2E14 000CED34  90 ED A2 DC */	stw r7, lbl_802F24BC@sda21(r13)
/* 800D2E18 000CED38  3B E0 00 00 */	li r31, 0
/* 800D2E1C 000CED3C  54 63 BA 7E */	srwi r3, r3, 9
/* 800D2E20 000CED40  90 AD A2 E4 */	stw r5, lbl_802F24C4@sda21(r13)
/* 800D2E24 000CED44  3C C0 CC 00 */	lis r6, 0xCC006C00@ha
/* 800D2E28 000CED48  90 6D A2 F4 */	stw r3, lbl_802F24D4@sda21(r13)
/* 800D2E2C 000CED4C  38 60 00 01 */	li r3, 1
/* 800D2E30 000CED50  80 06 6C 00 */	lwz r0, 0xCC006C00@l(r6)
/* 800D2E34 000CED54  90 8D A2 EC */	stw r4, lbl_802F24CC@sda21(r13)
/* 800D2E38 000CED58  54 00 06 F2 */	rlwinm r0, r0, 0, 0x1b, 0x19
/* 800D2E3C 000CED5C  60 00 00 20 */	ori r0, r0, 0x20
/* 800D2E40 000CED60  93 ED A2 D0 */	stw r31, bound_32KHz@sda21(r13)
/* 800D2E44 000CED64  93 ED A2 D8 */	stw r31, bound_48KHz@sda21(r13)
/* 800D2E48 000CED68  93 ED A2 E0 */	stw r31, min_wait@sda21(r13)
/* 800D2E4C 000CED6C  93 ED A2 E8 */	stw r31, max_wait@sda21(r13)
/* 800D2E50 000CED70  93 ED A2 F0 */	stw r31, buffer@sda21(r13)
/* 800D2E54 000CED74  80 A6 6C 04 */	lwz r5, 0x6c04(r6)
/* 800D2E58 000CED78  90 06 6C 00 */	stw r0, 0x6c00(r6)
/* 800D2E5C 000CED7C  54 A0 06 1E */	rlwinm r0, r5, 0, 0x18, 0xf
/* 800D2E60 000CED80  60 00 00 00 */	nop
/* 800D2E64 000CED84  90 06 6C 04 */	stw r0, 0x6c04(r6)
/* 800D2E68 000CED88  80 06 6C 04 */	lwz r0, 0x6c04(r6)
/* 800D2E6C 000CED8C  54 00 00 2E */	rlwinm r0, r0, 0, 0, 0x17
/* 800D2E70 000CED90  60 00 00 00 */	nop
/* 800D2E74 000CED94  90 06 6C 04 */	stw r0, 0x6c04(r6)
/* 800D2E78 000CED98  93 E6 6C 0C */	stw r31, 0x6c0c(r6)
/* 800D2E7C 000CED9C  4B FF FD C9 */	bl __AI_set_stream_sample_rate
/* 800D2E80 000CEDA0  38 60 00 00 */	li r3, 0
/* 800D2E84 000CEDA4  4B FF FC A5 */	bl AISetDSPSampleRate
/* 800D2E88 000CEDA8  3C 60 80 0D */	lis r3, __AIDHandler@ha
/* 800D2E8C 000CEDAC  93 ED A2 B8 */	stw r31, __AIS_Callback@sda21(r13)
/* 800D2E90 000CEDB0  38 83 2F 60 */	addi r4, r3, __AIDHandler@l
/* 800D2E94 000CEDB4  93 ED A2 BC */	stw r31, __AID_Callback@sda21(r13)
/* 800D2E98 000CEDB8  38 60 00 05 */	li r3, 5
/* 800D2E9C 000CEDBC  93 CD A2 C0 */	stw r30, __CallbackStack@sda21(r13)
/* 800D2EA0 000CEDC0  4B FF 32 69 */	bl __OSSetInterruptHandler
/* 800D2EA4 000CEDC4  3C 60 04 00 */	lis r3, 0x400
/* 800D2EA8 000CEDC8  4B FF 36 3D */	bl __OSUnmaskInterrupts
/* 800D2EAC 000CEDCC  3C 60 80 0D */	lis r3, __AISHandler@ha
/* 800D2EB0 000CEDD0  38 83 2E E4 */	addi r4, r3, __AISHandler@l
/* 800D2EB4 000CEDD4  38 60 00 08 */	li r3, 8
/* 800D2EB8 000CEDD8  4B FF 32 51 */	bl __OSSetInterruptHandler
/* 800D2EBC 000CEDDC  3C 60 00 80 */	lis r3, 0x80
/* 800D2EC0 000CEDE0  4B FF 36 25 */	bl __OSUnmaskInterrupts
/* 800D2EC4 000CEDE4  38 00 00 01 */	li r0, 1
/* 800D2EC8 000CEDE8  90 0D A2 C8 */	stw r0, __AI_init_flag@sda21(r13)
lbl_800D2ECC:
/* 800D2ECC 000CEDEC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800D2ED0 000CEDF0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800D2ED4 000CEDF4  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800D2ED8 000CEDF8  7C 08 03 A6 */	mtlr r0
/* 800D2EDC 000CEDFC  38 21 00 18 */	addi r1, r1, 0x18
/* 800D2EE0 000CEE00  4E 80 00 20 */	blr

.global __AISHandler
__AISHandler:
/* 800D2EE4 000CEE04  7C 08 02 A6 */	mflr r0
/* 800D2EE8 000CEE08  90 01 00 04 */	stw r0, 4(r1)
/* 800D2EEC 000CEE0C  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 800D2EF0 000CEE10  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 800D2EF4 000CEE14  3F E0 CC 00 */	lis r31, 0xCC006C00@ha
/* 800D2EF8 000CEE18  80 1F 6C 00 */	lwz r0, 0xCC006C00@l(r31)
/* 800D2EFC 000CEE1C  38 61 00 10 */	addi r3, r1, 0x10
/* 800D2F00 000CEE20  93 C1 02 D8 */	stw r30, 0x2d8(r1)
/* 800D2F04 000CEE24  60 00 00 08 */	ori r0, r0, 8
/* 800D2F08 000CEE28  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D2F0C 000CEE2C  3B C4 00 00 */	addi r30, r4, 0
/* 800D2F10 000CEE30  4B FF 09 79 */	bl OSClearContext
/* 800D2F14 000CEE34  38 61 00 10 */	addi r3, r1, 0x10
/* 800D2F18 000CEE38  4B FF 07 A9 */	bl OSSetCurrentContext
/* 800D2F1C 000CEE3C  81 8D A2 B8 */	lwz r12, __AIS_Callback@sda21(r13)
/* 800D2F20 000CEE40  28 0C 00 00 */	cmplwi r12, 0
/* 800D2F24 000CEE44  41 82 00 14 */	beq lbl_800D2F38
/* 800D2F28 000CEE48  38 7F 6C 00 */	addi r3, r31, 0x6c00
/* 800D2F2C 000CEE4C  7D 88 03 A6 */	mtlr r12
/* 800D2F30 000CEE50  80 63 00 08 */	lwz r3, 8(r3)
/* 800D2F34 000CEE54  4E 80 00 21 */	blrl
lbl_800D2F38:
/* 800D2F38 000CEE58  38 61 00 10 */	addi r3, r1, 0x10
/* 800D2F3C 000CEE5C  4B FF 09 4D */	bl OSClearContext
/* 800D2F40 000CEE60  7F C3 F3 78 */	mr r3, r30
/* 800D2F44 000CEE64  4B FF 07 7D */	bl OSSetCurrentContext
/* 800D2F48 000CEE68  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 800D2F4C 000CEE6C  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 800D2F50 000CEE70  83 C1 02 D8 */	lwz r30, 0x2d8(r1)
/* 800D2F54 000CEE74  7C 08 03 A6 */	mtlr r0
/* 800D2F58 000CEE78  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 800D2F5C 000CEE7C  4E 80 00 20 */	blr

.global __AIDHandler
__AIDHandler:
/* 800D2F60 000CEE80  7C 08 02 A6 */	mflr r0
/* 800D2F64 000CEE84  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 800D2F68 000CEE88  90 01 00 04 */	stw r0, 4(r1)
/* 800D2F6C 000CEE8C  38 63 50 00 */	addi r3, r3, 0xCC005000@l
/* 800D2F70 000CEE90  38 00 FF 5F */	li r0, -161
/* 800D2F74 000CEE94  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 800D2F78 000CEE98  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 800D2F7C 000CEE9C  3B E4 00 00 */	addi r31, r4, 0
/* 800D2F80 000CEEA0  A0 A3 00 0A */	lhz r5, 0xa(r3)
/* 800D2F84 000CEEA4  7C A0 00 38 */	and r0, r5, r0
/* 800D2F88 000CEEA8  60 00 00 08 */	ori r0, r0, 8
/* 800D2F8C 000CEEAC  B0 03 00 0A */	sth r0, 0xa(r3)
/* 800D2F90 000CEEB0  38 61 00 10 */	addi r3, r1, 0x10
/* 800D2F94 000CEEB4  4B FF 08 F5 */	bl OSClearContext
/* 800D2F98 000CEEB8  38 61 00 10 */	addi r3, r1, 0x10
/* 800D2F9C 000CEEBC  4B FF 07 25 */	bl OSSetCurrentContext
/* 800D2FA0 000CEEC0  80 6D A2 BC */	lwz r3, __AID_Callback@sda21(r13)
/* 800D2FA4 000CEEC4  28 03 00 00 */	cmplwi r3, 0
/* 800D2FA8 000CEEC8  41 82 00 24 */	beq lbl_800D2FCC
/* 800D2FAC 000CEECC  80 0D A2 C0 */	lwz r0, __CallbackStack@sda21(r13)
/* 800D2FB0 000CEED0  28 00 00 00 */	cmplwi r0, 0
/* 800D2FB4 000CEED4  41 82 00 0C */	beq lbl_800D2FC0
/* 800D2FB8 000CEED8  48 00 00 39 */	bl __AICallbackStackSwitch
/* 800D2FBC 000CEEDC  48 00 00 10 */	b lbl_800D2FCC
lbl_800D2FC0:
/* 800D2FC0 000CEEE0  39 83 00 00 */	addi r12, r3, 0
/* 800D2FC4 000CEEE4  7D 88 03 A6 */	mtlr r12
/* 800D2FC8 000CEEE8  4E 80 00 21 */	blrl
lbl_800D2FCC:
/* 800D2FCC 000CEEEC  38 61 00 10 */	addi r3, r1, 0x10
/* 800D2FD0 000CEEF0  4B FF 08 B9 */	bl OSClearContext
/* 800D2FD4 000CEEF4  7F E3 FB 78 */	mr r3, r31
/* 800D2FD8 000CEEF8  4B FF 06 E9 */	bl OSSetCurrentContext
/* 800D2FDC 000CEEFC  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 800D2FE0 000CEF00  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 800D2FE4 000CEF04  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 800D2FE8 000CEF08  7C 08 03 A6 */	mtlr r0
/* 800D2FEC 000CEF0C  4E 80 00 20 */	blr

.global __AICallbackStackSwitch
__AICallbackStackSwitch:
/* 800D2FF0 000CEF10  7C 08 02 A6 */	mflr r0
/* 800D2FF4 000CEF14  90 01 00 04 */	stw r0, 4(r1)
/* 800D2FF8 000CEF18  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800D2FFC 000CEF1C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800D3000 000CEF20  7C 7F 1B 78 */	mr r31, r3
/* 800D3004 000CEF24  3C A0 80 2F */	lis r5, __OldStack@ha
/* 800D3008 000CEF28  38 A5 24 A4 */	addi r5, r5, __OldStack@l
/* 800D300C 000CEF2C  90 25 00 00 */	stw r1, 0(r5)
/* 800D3010 000CEF30  3C A0 80 2F */	lis r5, __CallbackStack@ha
/* 800D3014 000CEF34  38 A5 24 A0 */	addi r5, r5, __CallbackStack@l
/* 800D3018 000CEF38  80 25 00 00 */	lwz r1, 0(r5)
/* 800D301C 000CEF3C  38 21 FF F8 */	addi r1, r1, -8
/* 800D3020 000CEF40  7F E8 03 A6 */	mtlr r31
/* 800D3024 000CEF44  4E 80 00 21 */	blrl
/* 800D3028 000CEF48  3C A0 80 2F */	lis r5, __OldStack@ha
/* 800D302C 000CEF4C  38 A5 24 A4 */	addi r5, r5, __OldStack@l
/* 800D3030 000CEF50  80 25 00 00 */	lwz r1, 0(r5)
/* 800D3034 000CEF54  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800D3038 000CEF58  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800D303C 000CEF5C  38 21 00 18 */	addi r1, r1, 0x18
/* 800D3040 000CEF60  7C 08 03 A6 */	mtlr r0
/* 800D3044 000CEF64  4E 80 00 20 */	blr

.global __AI_SRC_INIT
__AI_SRC_INIT:
/* 800D3048 000CEF68  7C 08 02 A6 */	mflr r0
/* 800D304C 000CEF6C  90 01 00 04 */	stw r0, 4(r1)
/* 800D3050 000CEF70  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800D3054 000CEF74  BF 41 00 18 */	stmw r26, 0x18(r1)
/* 800D3058 000CEF78  38 80 00 00 */	li r4, 0
/* 800D305C 000CEF7C  38 60 00 00 */	li r3, 0
/* 800D3060 000CEF80  38 00 00 00 */	li r0, 0
/* 800D3064 000CEF84  3B 80 00 00 */	li r28, 0
/* 800D3068 000CEF88  3B A0 00 00 */	li r29, 0
/* 800D306C 000CEF8C  48 00 00 04 */	b lbl_800D3070
lbl_800D3070:
/* 800D3070 000CEF90  3F E0 CC 00 */	lis r31, 0xcc00
/* 800D3074 000CEF94  48 00 00 04 */	b lbl_800D3078
lbl_800D3078:
/* 800D3078 000CEF98  48 00 01 64 */	b lbl_800D31DC
lbl_800D307C:
/* 800D307C 000CEF9C  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D3080 000CEFA0  3B DF 6C 00 */	addi r30, r31, 0x6c00
/* 800D3084 000CEFA4  3B DE 00 08 */	addi r30, r30, 8
/* 800D3088 000CEFA8  54 00 06 F2 */	rlwinm r0, r0, 0, 0x1b, 0x19
/* 800D308C 000CEFAC  60 00 00 20 */	ori r0, r0, 0x20
/* 800D3090 000CEFB0  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D3094 000CEFB4  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D3098 000CEFB8  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 800D309C 000CEFBC  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D30A0 000CEFC0  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D30A4 000CEFC4  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800D30A8 000CEFC8  60 00 00 01 */	ori r0, r0, 1
/* 800D30AC 000CEFCC  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D30B0 000CEFD0  80 7E 00 00 */	lwz r3, 0(r30)
/* 800D30B4 000CEFD4  48 00 00 04 */	b lbl_800D30B8
lbl_800D30B8:
/* 800D30B8 000CEFD8  48 00 00 04 */	b lbl_800D30BC
lbl_800D30BC:
/* 800D30BC 000CEFDC  80 1E 00 00 */	lwz r0, 0(r30)
/* 800D30C0 000CEFE0  7C 03 00 40 */	cmplw r3, r0
/* 800D30C4 000CEFE4  41 82 FF F8 */	beq lbl_800D30BC
/* 800D30C8 000CEFE8  4B FF 68 B5 */	bl OSGetTime
/* 800D30CC 000CEFEC  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D30D0 000CEFF0  7C 9A 23 78 */	mr r26, r4
/* 800D30D4 000CEFF4  7C 7B 1B 78 */	mr r27, r3
/* 800D30D8 000CEFF8  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 800D30DC 000CEFFC  60 00 00 02 */	ori r0, r0, 2
/* 800D30E0 000CF000  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D30E4 000CF004  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D30E8 000CF008  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800D30EC 000CF00C  60 00 00 01 */	ori r0, r0, 1
/* 800D30F0 000CF010  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D30F4 000CF014  80 7E 00 00 */	lwz r3, 0(r30)
/* 800D30F8 000CF018  48 00 00 04 */	b lbl_800D30FC
lbl_800D30FC:
/* 800D30FC 000CF01C  48 00 00 04 */	b lbl_800D3100
lbl_800D3100:
/* 800D3100 000CF020  80 1E 00 00 */	lwz r0, 0(r30)
/* 800D3104 000CF024  7C 03 00 40 */	cmplw r3, r0
/* 800D3108 000CF028  41 82 FF F8 */	beq lbl_800D3100
/* 800D310C 000CF02C  4B FF 68 71 */	bl OSGetTime
/* 800D3110 000CF030  7D 1A 20 10 */	subfc r8, r26, r4
/* 800D3114 000CF034  81 8D A2 D4 */	lwz r12, lbl_802F24B4@sda21(r13)
/* 800D3118 000CF038  80 BF 6C 00 */	lwz r5, 0x6c00(r31)
/* 800D311C 000CF03C  7C FB 19 10 */	subfe r7, r27, r3
/* 800D3120 000CF040  81 4D A2 F4 */	lwz r10, lbl_802F24D4@sda21(r13)
/* 800D3124 000CF044  6C E7 80 00 */	xoris r7, r7, 0x8000
/* 800D3128 000CF048  54 A5 07 FA */	rlwinm r5, r5, 0, 0x1f, 0x1d
/* 800D312C 000CF04C  81 6D A2 D0 */	lwz r11, bound_32KHz@sda21(r13)
/* 800D3130 000CF050  7C CA 60 10 */	subfc r6, r10, r12
/* 800D3134 000CF054  81 2D A2 F0 */	lwz r9, buffer@sda21(r13)
/* 800D3138 000CF058  90 BF 6C 00 */	stw r5, 0x6c00(r31)
/* 800D313C 000CF05C  7C 09 59 10 */	subfe r0, r9, r11
/* 800D3140 000CF060  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 800D3144 000CF064  7C 06 40 10 */	subfc r0, r6, r8
/* 800D3148 000CF068  80 1F 6C 00 */	lwz r0, 0x6c00(r31)
/* 800D314C 000CF06C  7C A5 39 10 */	subfe r5, r5, r7
/* 800D3150 000CF070  7C A7 39 10 */	subfe r5, r7, r7
/* 800D3154 000CF074  7C A5 00 D0 */	neg r5, r5
/* 800D3158 000CF078  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800D315C 000CF07C  2C 05 00 00 */	cmpwi r5, 0
/* 800D3160 000CF080  90 1F 6C 00 */	stw r0, 0x6c00(r31)
/* 800D3164 000CF084  41 82 00 14 */	beq lbl_800D3178
/* 800D3168 000CF088  83 AD A2 E0 */	lwz r29, min_wait@sda21(r13)
/* 800D316C 000CF08C  38 00 00 01 */	li r0, 1
/* 800D3170 000CF090  83 8D A2 E4 */	lwz r28, lbl_802F24C4@sda21(r13)
/* 800D3174 000CF094  48 00 00 68 */	b lbl_800D31DC
lbl_800D3178:
/* 800D3178 000CF098  7C CC 50 14 */	addc r6, r12, r10
/* 800D317C 000CF09C  7C 0B 49 14 */	adde r0, r11, r9
/* 800D3180 000CF0A0  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 800D3184 000CF0A4  7C 06 40 10 */	subfc r0, r6, r8
/* 800D3188 000CF0A8  7C A5 39 10 */	subfe r5, r5, r7
/* 800D318C 000CF0AC  7C A7 39 10 */	subfe r5, r7, r7
/* 800D3190 000CF0B0  7C A5 00 D0 */	neg r5, r5
/* 800D3194 000CF0B4  2C 05 00 00 */	cmpwi r5, 0
/* 800D3198 000CF0B8  40 82 00 40 */	bne lbl_800D31D8
/* 800D319C 000CF0BC  80 AD A2 DC */	lwz r5, lbl_802F24BC@sda21(r13)
/* 800D31A0 000CF0C0  80 0D A2 D8 */	lwz r0, bound_48KHz@sda21(r13)
/* 800D31A4 000CF0C4  7C CA 28 10 */	subfc r6, r10, r5
/* 800D31A8 000CF0C8  7C 09 01 10 */	subfe r0, r9, r0
/* 800D31AC 000CF0CC  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 800D31B0 000CF0D0  7C 06 40 10 */	subfc r0, r6, r8
/* 800D31B4 000CF0D4  7C A5 39 10 */	subfe r5, r5, r7
/* 800D31B8 000CF0D8  7C A7 39 10 */	subfe r5, r7, r7
/* 800D31BC 000CF0DC  7C A5 00 D0 */	neg r5, r5
/* 800D31C0 000CF0E0  2C 05 00 00 */	cmpwi r5, 0
/* 800D31C4 000CF0E4  41 82 00 14 */	beq lbl_800D31D8
/* 800D31C8 000CF0E8  83 AD A2 E8 */	lwz r29, max_wait@sda21(r13)
/* 800D31CC 000CF0EC  38 00 00 01 */	li r0, 1
/* 800D31D0 000CF0F0  83 8D A2 EC */	lwz r28, lbl_802F24CC@sda21(r13)
/* 800D31D4 000CF0F4  48 00 00 08 */	b lbl_800D31DC
lbl_800D31D8:
/* 800D31D8 000CF0F8  38 00 00 00 */	li r0, 0
lbl_800D31DC:
/* 800D31DC 000CF0FC  28 00 00 00 */	cmplwi r0, 0
/* 800D31E0 000CF100  41 82 FE 9C */	beq lbl_800D307C
/* 800D31E4 000CF104  7F 64 E0 14 */	addc r27, r4, r28
/* 800D31E8 000CF108  7F 43 E9 14 */	adde r26, r3, r29
/* 800D31EC 000CF10C  48 00 00 04 */	b lbl_800D31F0
lbl_800D31F0:
/* 800D31F0 000CF110  48 00 00 04 */	b lbl_800D31F4
lbl_800D31F4:
/* 800D31F4 000CF114  4B FF 67 89 */	bl OSGetTime
/* 800D31F8 000CF118  6C 65 80 00 */	xoris r5, r3, 0x8000
/* 800D31FC 000CF11C  6F 43 80 00 */	xoris r3, r26, 0x8000
/* 800D3200 000CF120  7C 1B 20 10 */	subfc r0, r27, r4
/* 800D3204 000CF124  7C 63 29 10 */	subfe r3, r3, r5
/* 800D3208 000CF128  7C 65 29 10 */	subfe r3, r5, r5
/* 800D320C 000CF12C  7C 63 00 D0 */	neg r3, r3
/* 800D3210 000CF130  2C 03 00 00 */	cmpwi r3, 0
/* 800D3214 000CF134  40 82 FF E0 */	bne lbl_800D31F4
/* 800D3218 000CF138  BB 41 00 18 */	lmw r26, 0x18(r1)
/* 800D321C 000CF13C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800D3220 000CF140  38 21 00 30 */	addi r1, r1, 0x30
/* 800D3224 000CF144  7C 08 03 A6 */	mtlr r0
/* 800D3228 000CF148  4E 80 00 20 */	blr

.section .sbss

.global __AIS_Callback
__AIS_Callback:
	.skip 0x4
.global __AID_Callback
__AID_Callback:
	.skip 0x4
.global __CallbackStack
__CallbackStack:
	.skip 0x4
.global __OldStack
__OldStack:
	.skip 0x4
.global __AI_init_flag
__AI_init_flag:
	.skip 0x8
.global bound_32KHz
bound_32KHz:
	.skip 0x4
.global lbl_802F24B4
lbl_802F24B4:
	.skip 0x4
.global bound_48KHz
bound_48KHz:
	.skip 0x4
.global lbl_802F24BC
lbl_802F24BC:
	.skip 0x4
.global min_wait
min_wait:
	.skip 0x4
.global lbl_802F24C4
lbl_802F24C4:
	.skip 0x4
.global max_wait
max_wait:
	.skip 0x4
.global lbl_802F24CC
lbl_802F24CC:
	.skip 0x4
.global buffer
buffer:
	.skip 0x4
.global lbl_802F24D4
lbl_802F24D4:
	.skip 0x4
