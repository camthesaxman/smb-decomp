.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global Run
Run:
/* 800C7098 000C2FB8  7C 08 02 A6 */	mflr r0
/* 800C709C 000C2FBC  90 01 00 04 */	stw r0, 4(r1)
/* 800C70A0 000C2FC0  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800C70A4 000C2FC4  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800C70A8 000C2FC8  7C 7F 1B 78 */	mr r31, r3
/* 800C70AC 000C2FCC  4B FF F0 11 */	bl OSDisableInterrupts
/* 800C70B0 000C2FD0  4B FF BF B1 */	bl ICFlashInvalidate
/* 800C70B4 000C2FD4  7C 00 04 AC */	sync 0
/* 800C70B8 000C2FD8  4C 00 01 2C */	isync
/* 800C70BC 000C2FDC  7F E8 03 A6 */	mtlr r31
/* 800C70C0 000C2FE0  4E 80 00 20 */	blr
/* 800C70C4 000C2FE4  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800C70C8 000C2FE8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800C70CC 000C2FEC  38 21 00 18 */	addi r1, r1, 0x18
/* 800C70D0 000C2FF0  7C 08 03 A6 */	mtlr r0
/* 800C70D4 000C2FF4  4E 80 00 20 */	blr

.global Callback
Callback:
/* 800C70D8 000C2FF8  38 00 00 01 */	li r0, 1
/* 800C70DC 000C2FFC  90 0D A1 38 */	stw r0, Prepared@sda21(r13)
/* 800C70E0 000C3000  4E 80 00 20 */	blr

.global __OSReboot
__OSReboot:
/* 800C70E4 000C3004  7C 08 02 A6 */	mflr r0
/* 800C70E8 000C3008  90 01 00 04 */	stw r0, 4(r1)
/* 800C70EC 000C300C  94 21 FC B8 */	stwu r1, -0x348(r1)
/* 800C70F0 000C3010  93 E1 03 44 */	stw r31, 0x344(r1)
/* 800C70F4 000C3014  93 C1 03 40 */	stw r30, 0x340(r1)
/* 800C70F8 000C3018  93 A1 03 3C */	stw r29, 0x33c(r1)
/* 800C70FC 000C301C  7C 7D 1B 78 */	mr r29, r3
/* 800C7100 000C3020  3C 60 80 2C */	lis r3, Header@ha
/* 800C7104 000C3024  3B C3 6C E0 */	addi r30, r3, Header@l
/* 800C7108 000C3028  4B FF EF B5 */	bl OSDisableInterrupts
/* 800C710C 000C302C  3F E0 81 80 */	lis r31, 0x817FFFFC@ha
/* 800C7110 000C3030  38 60 00 00 */	li r3, 0
/* 800C7114 000C3034  93 BF FF FC */	stw r29, 0x817FFFFC@l(r31)
/* 800C7118 000C3038  38 00 00 01 */	li r0, 1
/* 800C711C 000C303C  3C 80 80 00 */	lis r4, 0x800030E2@ha
/* 800C7120 000C3040  90 7F FF F8 */	stw r3, -8(r31)
/* 800C7124 000C3044  38 61 00 70 */	addi r3, r1, 0x70
/* 800C7128 000C3048  98 04 30 E2 */	stb r0, 0x800030E2@l(r4)
/* 800C712C 000C304C  4B FF C7 5D */	bl OSClearContext
/* 800C7130 000C3050  38 61 00 70 */	addi r3, r1, 0x70
/* 800C7134 000C3054  4B FF C5 8D */	bl OSSetCurrentContext
/* 800C7138 000C3058  48 00 50 31 */	bl DVDInit
/* 800C713C 000C305C  3C 60 80 0C */	lis r3, Callback@ha
/* 800C7140 000C3060  38 63 70 D8 */	addi r3, r3, Callback@l
/* 800C7144 000C3064  48 00 76 15 */	bl __DVDPrepareResetAsync
/* 800C7148 000C3068  48 00 75 2D */	bl DVDCheckDisk
/* 800C714C 000C306C  2C 03 00 00 */	cmpwi r3, 0
/* 800C7150 000C3070  40 82 00 0C */	bne lbl_800C715C
/* 800C7154 000C3074  80 7F FF FC */	lwz r3, -4(r31)
/* 800C7158 000C3078  48 00 02 31 */	bl __OSDoHotReset
lbl_800C715C:
/* 800C715C 000C307C  38 60 FF E0 */	li r3, -32
/* 800C7160 000C3080  4B FF F2 FD */	bl __OSMaskInterrupts
/* 800C7164 000C3084  38 60 04 00 */	li r3, 0x400
/* 800C7168 000C3088  4B FF F3 7D */	bl __OSUnmaskInterrupts
/* 800C716C 000C308C  4B FF EF 65 */	bl OSEnableInterrupts
/* 800C7170 000C3090  48 00 00 04 */	b lbl_800C7174
lbl_800C7174:
/* 800C7174 000C3094  48 00 00 04 */	b lbl_800C7178
lbl_800C7178:
/* 800C7178 000C3098  80 0D A1 38 */	lwz r0, Prepared@sda21(r13)
/* 800C717C 000C309C  2C 00 00 00 */	cmpwi r0, 0
/* 800C7180 000C30A0  41 82 FF F8 */	beq lbl_800C7178
/* 800C7184 000C30A4  7F C4 F3 78 */	mr r4, r30
/* 800C7188 000C30A8  38 61 00 40 */	addi r3, r1, 0x40
/* 800C718C 000C30AC  38 A0 00 20 */	li r5, 0x20
/* 800C7190 000C30B0  38 C0 24 40 */	li r6, 0x2440
/* 800C7194 000C30B4  38 E0 00 00 */	li r7, 0
/* 800C7198 000C30B8  48 00 6B 4D */	bl DVDReadAbsAsyncForBS
/* 800C719C 000C30BC  3F E0 81 80 */	lis r31, 0x8180
/* 800C71A0 000C30C0  48 00 00 04 */	b lbl_800C71A4
lbl_800C71A4:
/* 800C71A4 000C30C4  48 00 00 04 */	b lbl_800C71A8
lbl_800C71A8:
/* 800C71A8 000C30C8  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800C71AC 000C30CC  2C 00 00 01 */	cmpwi r0, 1
/* 800C71B0 000C30D0  41 82 FF F8 */	beq lbl_800C71A8
/* 800C71B4 000C30D4  40 80 00 14 */	bge lbl_800C71C8
/* 800C71B8 000C30D8  2C 00 FF FF */	cmpwi r0, -1
/* 800C71BC 000C30DC  41 82 00 18 */	beq lbl_800C71D4
/* 800C71C0 000C30E0  40 80 00 20 */	bge lbl_800C71E0
/* 800C71C4 000C30E4  4B FF FF E4 */	b lbl_800C71A8
lbl_800C71C8:
/* 800C71C8 000C30E8  2C 00 00 0C */	cmpwi r0, 0xc
/* 800C71CC 000C30EC  40 80 FF DC */	bge lbl_800C71A8
/* 800C71D0 000C30F0  48 00 00 04 */	b lbl_800C71D4
lbl_800C71D4:
/* 800C71D4 000C30F4  80 7F FF FC */	lwz r3, -4(r31)
/* 800C71D8 000C30F8  48 00 01 B1 */	bl __OSDoHotReset
/* 800C71DC 000C30FC  4B FF FF CC */	b lbl_800C71A8
lbl_800C71E0:
/* 800C71E0 000C3100  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 800C71E4 000C3104  80 9E 00 14 */	lwz r4, 0x14(r30)
/* 800C71E8 000C3108  38 03 00 1F */	addi r0, r3, 0x1f
/* 800C71EC 000C310C  38 84 00 20 */	addi r4, r4, 0x20
/* 800C71F0 000C3110  54 1E 00 34 */	rlwinm r30, r0, 0, 0, 0x1a
/* 800C71F4 000C3114  48 00 00 04 */	b lbl_800C71F8
lbl_800C71F8:
/* 800C71F8 000C3118  48 00 00 04 */	b lbl_800C71FC
lbl_800C71FC:
/* 800C71FC 000C311C  80 0D A1 38 */	lwz r0, Prepared@sda21(r13)
/* 800C7200 000C3120  2C 00 00 00 */	cmpwi r0, 0
/* 800C7204 000C3124  41 82 FF F8 */	beq lbl_800C71FC
/* 800C7208 000C3128  7F C5 F3 78 */	mr r5, r30
/* 800C720C 000C312C  38 61 00 10 */	addi r3, r1, 0x10
/* 800C7210 000C3130  38 C4 24 40 */	addi r6, r4, 0x2440
/* 800C7214 000C3134  3C 80 81 30 */	lis r4, 0x8130
/* 800C7218 000C3138  38 E0 00 00 */	li r7, 0
/* 800C721C 000C313C  48 00 6A C9 */	bl DVDReadAbsAsyncForBS
/* 800C7220 000C3140  3F E0 81 80 */	lis r31, 0x8180
/* 800C7224 000C3144  48 00 00 04 */	b lbl_800C7228
lbl_800C7228:
/* 800C7228 000C3148  48 00 00 04 */	b lbl_800C722C
lbl_800C722C:
/* 800C722C 000C314C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800C7230 000C3150  2C 00 00 01 */	cmpwi r0, 1
/* 800C7234 000C3154  41 82 FF F8 */	beq lbl_800C722C
/* 800C7238 000C3158  40 80 00 14 */	bge lbl_800C724C
/* 800C723C 000C315C  2C 00 FF FF */	cmpwi r0, -1
/* 800C7240 000C3160  41 82 00 18 */	beq lbl_800C7258
/* 800C7244 000C3164  40 80 00 20 */	bge lbl_800C7264
/* 800C7248 000C3168  4B FF FF E4 */	b lbl_800C722C
lbl_800C724C:
/* 800C724C 000C316C  2C 00 00 0C */	cmpwi r0, 0xc
/* 800C7250 000C3170  40 80 FF DC */	bge lbl_800C722C
/* 800C7254 000C3174  48 00 00 04 */	b lbl_800C7258
lbl_800C7258:
/* 800C7258 000C3178  80 7F FF FC */	lwz r3, -4(r31)
/* 800C725C 000C317C  48 00 01 2D */	bl __OSDoHotReset
/* 800C7260 000C3180  4B FF FF CC */	b lbl_800C722C
lbl_800C7264:
/* 800C7264 000C3184  3C 60 81 30 */	lis r3, 0x8130
/* 800C7268 000C3188  7F C4 F3 78 */	mr r4, r30
/* 800C726C 000C318C  4B FF BD BD */	bl ICInvalidateRange
/* 800C7270 000C3190  3C 60 81 30 */	lis r3, 0x8130
/* 800C7274 000C3194  4B FF FE 25 */	bl Run
/* 800C7278 000C3198  80 01 03 4C */	lwz r0, 0x34c(r1)
/* 800C727C 000C319C  83 E1 03 44 */	lwz r31, 0x344(r1)
/* 800C7280 000C31A0  83 C1 03 40 */	lwz r30, 0x340(r1)
/* 800C7284 000C31A4  7C 08 03 A6 */	mtlr r0
/* 800C7288 000C31A8  83 A1 03 3C */	lwz r29, 0x33c(r1)
/* 800C728C 000C31AC  38 21 03 48 */	addi r1, r1, 0x348
/* 800C7290 000C31B0  4E 80 00 20 */	blr

.section .sbss

.global Prepared
Prepared:
	.skip 0x8

.section .bss

.global Header
Header:
	.skip 0x20
