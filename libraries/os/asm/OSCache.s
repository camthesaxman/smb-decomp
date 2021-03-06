.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global DCEnable
DCEnable:
/* 800C2F1C 000BEE3C  7C 00 04 AC */	sync 0
/* 800C2F20 000BEE40  7C 70 FA A6 */	mfspr r3, 0x3f0
/* 800C2F24 000BEE44  60 63 40 00 */	ori r3, r3, 0x4000
/* 800C2F28 000BEE48  7C 70 FB A6 */	mtspr 0x3f0, r3
/* 800C2F2C 000BEE4C  4E 80 00 20 */	blr

.global DCInvalidateRange
DCInvalidateRange:
/* 800C2F30 000BEE50  28 04 00 00 */	cmplwi r4, 0
/* 800C2F34 000BEE54  4C 81 00 20 */	blelr
/* 800C2F38 000BEE58  54 65 06 FF */	clrlwi. r5, r3, 0x1b
/* 800C2F3C 000BEE5C  41 82 00 08 */	beq lbl_800C2F44
/* 800C2F40 000BEE60  38 84 00 20 */	addi r4, r4, 0x20
lbl_800C2F44:
/* 800C2F44 000BEE64  38 84 00 1F */	addi r4, r4, 0x1f
/* 800C2F48 000BEE68  54 84 D9 7E */	srwi r4, r4, 5
/* 800C2F4C 000BEE6C  7C 89 03 A6 */	mtctr r4
lbl_800C2F50:
/* 800C2F50 000BEE70  7C 00 1B AC */	dcbi 0, r3
/* 800C2F54 000BEE74  38 63 00 20 */	addi r3, r3, 0x20
/* 800C2F58 000BEE78  42 00 FF F8 */	bdnz lbl_800C2F50
/* 800C2F5C 000BEE7C  4E 80 00 20 */	blr

.global DCFlushRange
DCFlushRange:
/* 800C2F60 000BEE80  28 04 00 00 */	cmplwi r4, 0
/* 800C2F64 000BEE84  4C 81 00 20 */	blelr
/* 800C2F68 000BEE88  54 65 06 FF */	clrlwi. r5, r3, 0x1b
/* 800C2F6C 000BEE8C  41 82 00 08 */	beq lbl_800C2F74
/* 800C2F70 000BEE90  38 84 00 20 */	addi r4, r4, 0x20
lbl_800C2F74:
/* 800C2F74 000BEE94  38 84 00 1F */	addi r4, r4, 0x1f
/* 800C2F78 000BEE98  54 84 D9 7E */	srwi r4, r4, 5
/* 800C2F7C 000BEE9C  7C 89 03 A6 */	mtctr r4
lbl_800C2F80:
/* 800C2F80 000BEEA0  7C 00 18 AC */	dcbf 0, r3
/* 800C2F84 000BEEA4  38 63 00 20 */	addi r3, r3, 0x20
/* 800C2F88 000BEEA8  42 00 FF F8 */	bdnz lbl_800C2F80
/* 800C2F8C 000BEEAC  44 00 00 02 */	sc
/* 800C2F90 000BEEB0  4E 80 00 20 */	blr

.global DCStoreRange
DCStoreRange:
/* 800C2F94 000BEEB4  28 04 00 00 */	cmplwi r4, 0
/* 800C2F98 000BEEB8  4C 81 00 20 */	blelr
/* 800C2F9C 000BEEBC  54 65 06 FF */	clrlwi. r5, r3, 0x1b
/* 800C2FA0 000BEEC0  41 82 00 08 */	beq lbl_800C2FA8
/* 800C2FA4 000BEEC4  38 84 00 20 */	addi r4, r4, 0x20
lbl_800C2FA8:
/* 800C2FA8 000BEEC8  38 84 00 1F */	addi r4, r4, 0x1f
/* 800C2FAC 000BEECC  54 84 D9 7E */	srwi r4, r4, 5
/* 800C2FB0 000BEED0  7C 89 03 A6 */	mtctr r4
lbl_800C2FB4:
/* 800C2FB4 000BEED4  7C 00 18 6C */	dcbst 0, r3
/* 800C2FB8 000BEED8  38 63 00 20 */	addi r3, r3, 0x20
/* 800C2FBC 000BEEDC  42 00 FF F8 */	bdnz lbl_800C2FB4
/* 800C2FC0 000BEEE0  44 00 00 02 */	sc
/* 800C2FC4 000BEEE4  4E 80 00 20 */	blr

.global DCFlushRangeNoSync
DCFlushRangeNoSync:
/* 800C2FC8 000BEEE8  28 04 00 00 */	cmplwi r4, 0
/* 800C2FCC 000BEEEC  4C 81 00 20 */	blelr
/* 800C2FD0 000BEEF0  54 65 06 FF */	clrlwi. r5, r3, 0x1b
/* 800C2FD4 000BEEF4  41 82 00 08 */	beq lbl_800C2FDC
/* 800C2FD8 000BEEF8  38 84 00 20 */	addi r4, r4, 0x20
lbl_800C2FDC:
/* 800C2FDC 000BEEFC  38 84 00 1F */	addi r4, r4, 0x1f
/* 800C2FE0 000BEF00  54 84 D9 7E */	srwi r4, r4, 5
/* 800C2FE4 000BEF04  7C 89 03 A6 */	mtctr r4
lbl_800C2FE8:
/* 800C2FE8 000BEF08  7C 00 18 AC */	dcbf 0, r3
/* 800C2FEC 000BEF0C  38 63 00 20 */	addi r3, r3, 0x20
/* 800C2FF0 000BEF10  42 00 FF F8 */	bdnz lbl_800C2FE8
/* 800C2FF4 000BEF14  4E 80 00 20 */	blr

.global DCZeroRange
DCZeroRange:
/* 800C2FF8 000BEF18  28 04 00 00 */	cmplwi r4, 0
/* 800C2FFC 000BEF1C  4C 81 00 20 */	blelr
/* 800C3000 000BEF20  54 65 06 FF */	clrlwi. r5, r3, 0x1b
/* 800C3004 000BEF24  41 82 00 08 */	beq lbl_800C300C
/* 800C3008 000BEF28  38 84 00 20 */	addi r4, r4, 0x20
lbl_800C300C:
/* 800C300C 000BEF2C  38 84 00 1F */	addi r4, r4, 0x1f
/* 800C3010 000BEF30  54 84 D9 7E */	srwi r4, r4, 5
/* 800C3014 000BEF34  7C 89 03 A6 */	mtctr r4
lbl_800C3018:
/* 800C3018 000BEF38  7C 00 18 6C */	dcbst 0, r3
/* 800C301C 000BEF3C  38 63 00 20 */	addi r3, r3, 0x20
/* 800C3020 000BEF40  42 00 FF F8 */	bdnz lbl_800C3018
/* 800C3024 000BEF44  4E 80 00 20 */	blr

.global ICInvalidateRange
ICInvalidateRange:
/* 800C3028 000BEF48  28 04 00 00 */	cmplwi r4, 0
/* 800C302C 000BEF4C  4C 81 00 20 */	blelr
/* 800C3030 000BEF50  54 65 06 FF */	clrlwi. r5, r3, 0x1b
/* 800C3034 000BEF54  41 82 00 08 */	beq lbl_800C303C
/* 800C3038 000BEF58  38 84 00 20 */	addi r4, r4, 0x20
lbl_800C303C:
/* 800C303C 000BEF5C  38 84 00 1F */	addi r4, r4, 0x1f
/* 800C3040 000BEF60  54 84 D9 7E */	srwi r4, r4, 5
/* 800C3044 000BEF64  7C 89 03 A6 */	mtctr r4
lbl_800C3048:
/* 800C3048 000BEF68  7C 00 1F AC */	icbi 0, r3
/* 800C304C 000BEF6C  38 63 00 20 */	addi r3, r3, 0x20
/* 800C3050 000BEF70  42 00 FF F8 */	bdnz lbl_800C3048
/* 800C3054 000BEF74  7C 00 04 AC */	sync 0
/* 800C3058 000BEF78  4C 00 01 2C */	isync
/* 800C305C 000BEF7C  4E 80 00 20 */	blr

.global ICFlashInvalidate
ICFlashInvalidate:
/* 800C3060 000BEF80  7C 70 FA A6 */	mfspr r3, 0x3f0
/* 800C3064 000BEF84  60 63 08 00 */	ori r3, r3, 0x800
/* 800C3068 000BEF88  7C 70 FB A6 */	mtspr 0x3f0, r3
/* 800C306C 000BEF8C  4E 80 00 20 */	blr

.global ICEnable
ICEnable:
/* 800C3070 000BEF90  4C 00 01 2C */	isync
/* 800C3074 000BEF94  7C 70 FA A6 */	mfspr r3, 0x3f0
/* 800C3078 000BEF98  60 63 80 00 */	ori r3, r3, 0x8000
/* 800C307C 000BEF9C  7C 70 FB A6 */	mtspr 0x3f0, r3
/* 800C3080 000BEFA0  4E 80 00 20 */	blr

.global __LCEnable
__LCEnable:
/* 800C3084 000BEFA4  7C A0 00 A6 */	mfmsr r5
/* 800C3088 000BEFA8  60 A5 10 00 */	ori r5, r5, 0x1000
/* 800C308C 000BEFAC  7C A0 01 24 */	mtmsr r5
/* 800C3090 000BEFB0  3C 60 80 00 */	lis r3, 0x80000020@ha
/* 800C3094 000BEFB4  38 80 04 00 */	li r4, 0x400
/* 800C3098 000BEFB8  7C 89 03 A6 */	mtctr r4
lbl_800C309C:
/* 800C309C 000BEFBC  7C 00 1A 2C */	dcbt 0, r3
/* 800C30A0 000BEFC0  7C 00 18 6C */	dcbst 0, r3
/* 800C30A4 000BEFC4  38 63 00 20 */	addi r3, r3, 0x80000020@l
/* 800C30A8 000BEFC8  42 00 FF F4 */	bdnz lbl_800C309C
/* 800C30AC 000BEFCC  7C 98 E2 A6 */	mfspr r4, 0x398
/* 800C30B0 000BEFD0  64 84 10 0F */	oris r4, r4, 0x100f
/* 800C30B4 000BEFD4  7C 98 E3 A6 */	mtspr 0x398, r4
/* 800C30B8 000BEFD8  60 00 00 00 */	nop
/* 800C30BC 000BEFDC  60 00 00 00 */	nop
/* 800C30C0 000BEFE0  60 00 00 00 */	nop
/* 800C30C4 000BEFE4  60 00 00 00 */	nop
/* 800C30C8 000BEFE8  60 00 00 00 */	nop
/* 800C30CC 000BEFEC  60 00 00 00 */	nop
/* 800C30D0 000BEFF0  60 00 00 00 */	nop
/* 800C30D4 000BEFF4  60 00 00 00 */	nop
/* 800C30D8 000BEFF8  60 00 00 00 */	nop
/* 800C30DC 000BEFFC  60 00 00 00 */	nop
/* 800C30E0 000BF000  60 00 00 00 */	nop
/* 800C30E4 000BF004  60 00 00 00 */	nop
/* 800C30E8 000BF008  3C 60 E0 00 */	lis r3, 0xE0000002@h
/* 800C30EC 000BF00C  60 63 00 02 */	ori r3, r3, 0xE0000002@l
/* 800C30F0 000BF010  7C 7F 83 A6 */	mtdbatl 3, r3
/* 800C30F4 000BF014  60 63 01 FE */	ori r3, r3, 0x1fe
/* 800C30F8 000BF018  7C 7E 83 A6 */	mtdbatu 3, r3
/* 800C30FC 000BF01C  4C 00 01 2C */	isync
/* 800C3100 000BF020  3C 60 E0 00 */	lis r3, 0xE0000020@ha
/* 800C3104 000BF024  38 C0 02 00 */	li r6, 0x200
/* 800C3108 000BF028  7C C9 03 A6 */	mtctr r6
/* 800C310C 000BF02C  38 C0 00 00 */	li r6, 0
lbl_800C3110:
/* 800C3110 000BF030  10 06 1F EC */	dcbz_l r6, r3
/* 800C3114 000BF034  38 63 00 20 */	addi r3, r3, 0xE0000020@l
/* 800C3118 000BF038  42 00 FF F8 */	bdnz lbl_800C3110
/* 800C311C 000BF03C  60 00 00 00 */	nop
/* 800C3120 000BF040  60 00 00 00 */	nop
/* 800C3124 000BF044  60 00 00 00 */	nop
/* 800C3128 000BF048  60 00 00 00 */	nop
/* 800C312C 000BF04C  60 00 00 00 */	nop
/* 800C3130 000BF050  60 00 00 00 */	nop
/* 800C3134 000BF054  60 00 00 00 */	nop
/* 800C3138 000BF058  60 00 00 00 */	nop
/* 800C313C 000BF05C  60 00 00 00 */	nop
/* 800C3140 000BF060  60 00 00 00 */	nop
/* 800C3144 000BF064  60 00 00 00 */	nop
/* 800C3148 000BF068  60 00 00 00 */	nop
/* 800C314C 000BF06C  4E 80 00 20 */	blr

.global LCEnable
LCEnable:
/* 800C3150 000BF070  7C 08 02 A6 */	mflr r0
/* 800C3154 000BF074  90 01 00 04 */	stw r0, 4(r1)
/* 800C3158 000BF078  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800C315C 000BF07C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800C3160 000BF080  48 00 2F 5D */	bl OSDisableInterrupts
/* 800C3164 000BF084  7C 7F 1B 78 */	mr r31, r3
/* 800C3168 000BF088  4B FF FF 1D */	bl __LCEnable
/* 800C316C 000BF08C  7F E3 FB 78 */	mr r3, r31
/* 800C3170 000BF090  48 00 2F 75 */	bl OSRestoreInterrupts
/* 800C3174 000BF094  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800C3178 000BF098  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800C317C 000BF09C  38 21 00 10 */	addi r1, r1, 0x10
/* 800C3180 000BF0A0  7C 08 03 A6 */	mtlr r0
/* 800C3184 000BF0A4  4E 80 00 20 */	blr

.global L2GlobalInvalidate
L2GlobalInvalidate:
/* 800C3188 000BF0A8  7C 08 02 A6 */	mflr r0
/* 800C318C 000BF0AC  90 01 00 04 */	stw r0, 4(r1)
/* 800C3190 000BF0B0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800C3194 000BF0B4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800C3198 000BF0B8  7C 00 04 AC */	sync 0
/* 800C319C 000BF0BC  4B FF E5 7D */	bl PPCMfl2cr
/* 800C31A0 000BF0C0  54 63 00 7E */	clrlwi r3, r3, 1
/* 800C31A4 000BF0C4  4B FF E5 7D */	bl PPCMtl2cr
/* 800C31A8 000BF0C8  7C 00 04 AC */	sync 0
/* 800C31AC 000BF0CC  4B FF E5 6D */	bl PPCMfl2cr
/* 800C31B0 000BF0D0  64 63 00 20 */	oris r3, r3, 0x20
/* 800C31B4 000BF0D4  4B FF E5 6D */	bl PPCMtl2cr
/* 800C31B8 000BF0D8  48 00 00 04 */	b lbl_800C31BC
lbl_800C31BC:
/* 800C31BC 000BF0DC  48 00 00 04 */	b lbl_800C31C0
lbl_800C31C0:
/* 800C31C0 000BF0E0  4B FF E5 59 */	bl PPCMfl2cr
/* 800C31C4 000BF0E4  54 60 07 FE */	clrlwi r0, r3, 0x1f
/* 800C31C8 000BF0E8  28 00 00 00 */	cmplwi r0, 0
/* 800C31CC 000BF0EC  40 82 FF F4 */	bne lbl_800C31C0
/* 800C31D0 000BF0F0  4B FF E5 49 */	bl PPCMfl2cr
/* 800C31D4 000BF0F4  54 63 02 D2 */	rlwinm r3, r3, 0, 0xb, 9
/* 800C31D8 000BF0F8  4B FF E5 49 */	bl PPCMtl2cr
/* 800C31DC 000BF0FC  48 00 00 04 */	b lbl_800C31E0
lbl_800C31E0:
/* 800C31E0 000BF100  3C 60 80 1E */	lis r3, lbl_801E62C8@ha
/* 800C31E4 000BF104  3B E3 62 C8 */	addi r31, r3, lbl_801E62C8@l
/* 800C31E8 000BF108  48 00 00 04 */	b lbl_800C31EC
lbl_800C31EC:
/* 800C31EC 000BF10C  48 00 00 10 */	b lbl_800C31FC
lbl_800C31F0:
/* 800C31F0 000BF110  7F E3 FB 78 */	mr r3, r31
/* 800C31F4 000BF114  4C C6 31 82 */	crclr 6
/* 800C31F8 000BF118  48 00 6F 29 */	bl DBPrintf
lbl_800C31FC:
/* 800C31FC 000BF11C  4B FF E5 1D */	bl PPCMfl2cr
/* 800C3200 000BF120  54 60 07 FE */	clrlwi r0, r3, 0x1f
/* 800C3204 000BF124  28 00 00 00 */	cmplwi r0, 0
/* 800C3208 000BF128  40 82 FF E8 */	bne lbl_800C31F0
/* 800C320C 000BF12C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800C3210 000BF130  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800C3214 000BF134  38 21 00 10 */	addi r1, r1, 0x10
/* 800C3218 000BF138  7C 08 03 A6 */	mtlr r0
/* 800C321C 000BF13C  4E 80 00 20 */	blr

.global DMAErrorHandler
DMAErrorHandler:
/* 800C3220 000BF140  7C 08 02 A6 */	mflr r0
/* 800C3224 000BF144  90 01 00 04 */	stw r0, 4(r1)
/* 800C3228 000BF148  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 800C322C 000BF14C  93 E1 00 7C */	stw r31, 0x7c(r1)
/* 800C3230 000BF150  93 C1 00 78 */	stw r30, 0x78(r1)
/* 800C3234 000BF154  93 A1 00 74 */	stw r29, 0x74(r1)
/* 800C3238 000BF158  40 86 00 24 */	bne cr1, lbl_800C325C
/* 800C323C 000BF15C  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 800C3240 000BF160  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 800C3244 000BF164  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 800C3248 000BF168  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 800C324C 000BF16C  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 800C3250 000BF170  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 800C3254 000BF174  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 800C3258 000BF178  D9 01 00 60 */	stfd f8, 0x60(r1)
lbl_800C325C:
/* 800C325C 000BF17C  90 61 00 08 */	stw r3, 8(r1)
/* 800C3260 000BF180  90 81 00 0C */	stw r4, 0xc(r1)
/* 800C3264 000BF184  90 A1 00 10 */	stw r5, 0x10(r1)
/* 800C3268 000BF188  90 C1 00 14 */	stw r6, 0x14(r1)
/* 800C326C 000BF18C  90 E1 00 18 */	stw r7, 0x18(r1)
/* 800C3270 000BF190  91 01 00 1C */	stw r8, 0x1c(r1)
/* 800C3274 000BF194  91 21 00 20 */	stw r9, 0x20(r1)
/* 800C3278 000BF198  91 41 00 24 */	stw r10, 0x24(r1)
/* 800C327C 000BF19C  7C 9D 23 78 */	mr r29, r4
/* 800C3280 000BF1A0  3C 60 80 1E */	lis r3, lbl_801E62C8@ha
/* 800C3284 000BF1A4  3B E3 62 C8 */	addi r31, r3, lbl_801E62C8@l
/* 800C3288 000BF1A8  4B FF E5 0D */	bl PPCMfhid2
/* 800C328C 000BF1AC  7C 7E 1B 78 */	mr r30, r3
/* 800C3290 000BF1B0  4C C6 31 82 */	crclr 6
/* 800C3294 000BF1B4  38 7F 00 2C */	addi r3, r31, 0x2c
/* 800C3298 000BF1B8  48 00 09 89 */	bl OSReport
/* 800C329C 000BF1BC  80 BD 01 9C */	lwz r5, 0x19c(r29)
/* 800C32A0 000BF1C0  7F C4 F3 78 */	mr r4, r30
/* 800C32A4 000BF1C4  38 7F 00 44 */	addi r3, r31, 0x44
/* 800C32A8 000BF1C8  4C C6 31 82 */	crclr 6
/* 800C32AC 000BF1CC  48 00 09 75 */	bl OSReport
/* 800C32B0 000BF1D0  57 C0 02 16 */	rlwinm r0, r30, 0, 8, 0xb
/* 800C32B4 000BF1D4  28 00 00 00 */	cmplwi r0, 0
/* 800C32B8 000BF1D8  41 82 00 14 */	beq lbl_800C32CC
/* 800C32BC 000BF1DC  80 1D 01 9C */	lwz r0, 0x19c(r29)
/* 800C32C0 000BF1E0  54 00 02 94 */	rlwinm r0, r0, 0, 0xa, 0xa
/* 800C32C4 000BF1E4  28 00 00 00 */	cmplwi r0, 0
/* 800C32C8 000BF1E8  40 82 00 1C */	bne lbl_800C32E4
lbl_800C32CC:
/* 800C32CC 000BF1EC  38 7F 00 60 */	addi r3, r31, 0x60
/* 800C32D0 000BF1F0  4C C6 31 82 */	crclr 6
/* 800C32D4 000BF1F4  48 00 09 4D */	bl OSReport
/* 800C32D8 000BF1F8  7F A3 EB 78 */	mr r3, r29
/* 800C32DC 000BF1FC  48 00 05 D1 */	bl OSDumpContext
/* 800C32E0 000BF200  4B FF E4 59 */	bl PPCHalt
lbl_800C32E4:
/* 800C32E4 000BF204  38 7F 00 90 */	addi r3, r31, 0x90
/* 800C32E8 000BF208  4C C6 31 82 */	crclr 6
/* 800C32EC 000BF20C  48 00 09 35 */	bl OSReport
/* 800C32F0 000BF210  38 7F 00 CC */	addi r3, r31, 0xcc
/* 800C32F4 000BF214  4C C6 31 82 */	crclr 6
/* 800C32F8 000BF218  48 00 09 29 */	bl OSReport
/* 800C32FC 000BF21C  57 C0 02 10 */	rlwinm r0, r30, 0, 8, 8
/* 800C3300 000BF220  28 00 00 00 */	cmplwi r0, 0
/* 800C3304 000BF224  41 82 00 10 */	beq lbl_800C3314
/* 800C3308 000BF228  38 7F 01 04 */	addi r3, r31, 0x104
/* 800C330C 000BF22C  4C C6 31 82 */	crclr 6
/* 800C3310 000BF230  48 00 09 11 */	bl OSReport
lbl_800C3314:
/* 800C3314 000BF234  57 C0 02 52 */	rlwinm r0, r30, 0, 9, 9
/* 800C3318 000BF238  28 00 00 00 */	cmplwi r0, 0
/* 800C331C 000BF23C  41 82 00 10 */	beq lbl_800C332C
/* 800C3320 000BF240  38 7F 01 44 */	addi r3, r31, 0x144
/* 800C3324 000BF244  4C C6 31 82 */	crclr 6
/* 800C3328 000BF248  48 00 08 F9 */	bl OSReport
lbl_800C332C:
/* 800C332C 000BF24C  57 C0 02 94 */	rlwinm r0, r30, 0, 0xa, 0xa
/* 800C3330 000BF250  28 00 00 00 */	cmplwi r0, 0
/* 800C3334 000BF254  41 82 00 10 */	beq lbl_800C3344
/* 800C3338 000BF258  38 7F 01 70 */	addi r3, r31, 0x170
/* 800C333C 000BF25C  4C C6 31 82 */	crclr 6
/* 800C3340 000BF260  48 00 08 E1 */	bl OSReport
lbl_800C3344:
/* 800C3344 000BF264  57 C0 02 D6 */	rlwinm r0, r30, 0, 0xb, 0xb
/* 800C3348 000BF268  28 00 00 00 */	cmplwi r0, 0
/* 800C334C 000BF26C  41 82 00 10 */	beq lbl_800C335C
/* 800C3350 000BF270  38 7F 01 90 */	addi r3, r31, 0x190
/* 800C3354 000BF274  4C C6 31 82 */	crclr 6
/* 800C3358 000BF278  48 00 08 C9 */	bl OSReport
lbl_800C335C:
/* 800C335C 000BF27C  7F C3 F3 78 */	mr r3, r30
/* 800C3360 000BF280  4B FF E4 3D */	bl PPCMthid2
/* 800C3364 000BF284  80 01 00 84 */	lwz r0, 0x84(r1)
/* 800C3368 000BF288  83 E1 00 7C */	lwz r31, 0x7c(r1)
/* 800C336C 000BF28C  83 C1 00 78 */	lwz r30, 0x78(r1)
/* 800C3370 000BF290  7C 08 03 A6 */	mtlr r0
/* 800C3374 000BF294  83 A1 00 74 */	lwz r29, 0x74(r1)
/* 800C3378 000BF298  38 21 00 80 */	addi r1, r1, 0x80
/* 800C337C 000BF29C  4E 80 00 20 */	blr

.global __OSCacheInit
__OSCacheInit:
/* 800C3380 000BF2A0  7C 08 02 A6 */	mflr r0
/* 800C3384 000BF2A4  90 01 00 04 */	stw r0, 4(r1)
/* 800C3388 000BF2A8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800C338C 000BF2AC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800C3390 000BF2B0  93 C1 00 08 */	stw r30, 8(r1)
/* 800C3394 000BF2B4  3C 60 80 1E */	lis r3, lbl_801E62C8@ha
/* 800C3398 000BF2B8  3B E3 62 C8 */	addi r31, r3, lbl_801E62C8@l
/* 800C339C 000BF2BC  4B FF E3 75 */	bl PPCMfhid0
/* 800C33A0 000BF2C0  54 60 04 20 */	rlwinm r0, r3, 0, 0x10, 0x10
/* 800C33A4 000BF2C4  28 00 00 00 */	cmplwi r0, 0
/* 800C33A8 000BF2C8  40 82 00 14 */	bne lbl_800C33BC
/* 800C33AC 000BF2CC  4B FF FC C5 */	bl ICEnable
/* 800C33B0 000BF2D0  38 7F 01 AC */	addi r3, r31, 0x1ac
/* 800C33B4 000BF2D4  4C C6 31 82 */	crclr 6
/* 800C33B8 000BF2D8  48 00 6D 69 */	bl DBPrintf
lbl_800C33BC:
/* 800C33BC 000BF2DC  4B FF E3 55 */	bl PPCMfhid0
/* 800C33C0 000BF2E0  54 60 04 62 */	rlwinm r0, r3, 0, 0x11, 0x11
/* 800C33C4 000BF2E4  28 00 00 00 */	cmplwi r0, 0
/* 800C33C8 000BF2E8  40 82 00 14 */	bne lbl_800C33DC
/* 800C33CC 000BF2EC  4B FF FB 51 */	bl DCEnable
/* 800C33D0 000BF2F0  38 7F 01 C8 */	addi r3, r31, 0x1c8
/* 800C33D4 000BF2F4  4C C6 31 82 */	crclr 6
/* 800C33D8 000BF2F8  48 00 6D 49 */	bl DBPrintf
lbl_800C33DC:
/* 800C33DC 000BF2FC  4B FF E3 3D */	bl PPCMfl2cr
/* 800C33E0 000BF300  54 60 00 00 */	rlwinm r0, r3, 0, 0, 0
/* 800C33E4 000BF304  28 00 00 00 */	cmplwi r0, 0
/* 800C33E8 000BF308  40 82 00 58 */	bne lbl_800C3440
/* 800C33EC 000BF30C  4B FF E3 15 */	bl PPCMfmsr
/* 800C33F0 000BF310  7C 7E 1B 78 */	mr r30, r3
/* 800C33F4 000BF314  7C 00 04 AC */	sync 0
/* 800C33F8 000BF318  38 60 00 30 */	li r3, 0x30
/* 800C33FC 000BF31C  4B FF E3 0D */	bl PPCMtmsr
/* 800C3400 000BF320  7C 00 04 AC */	sync 0
/* 800C3404 000BF324  7C 00 04 AC */	sync 0
/* 800C3408 000BF328  4B FF E3 11 */	bl PPCMfl2cr
/* 800C340C 000BF32C  54 63 00 7E */	clrlwi r3, r3, 1
/* 800C3410 000BF330  4B FF E3 11 */	bl PPCMtl2cr
/* 800C3414 000BF334  7C 00 04 AC */	sync 0
/* 800C3418 000BF338  4B FF FD 71 */	bl L2GlobalInvalidate
/* 800C341C 000BF33C  7F C3 F3 78 */	mr r3, r30
/* 800C3420 000BF340  4B FF E2 E9 */	bl PPCMtmsr
/* 800C3424 000BF344  4B FF E2 F5 */	bl PPCMfl2cr
/* 800C3428 000BF348  64 60 80 00 */	oris r0, r3, 0x8000
/* 800C342C 000BF34C  54 03 02 D2 */	rlwinm r3, r0, 0, 0xb, 9
/* 800C3430 000BF350  4B FF E2 F1 */	bl PPCMtl2cr
/* 800C3434 000BF354  38 7F 01 E4 */	addi r3, r31, 0x1e4
/* 800C3438 000BF358  4C C6 31 82 */	crclr 6
/* 800C343C 000BF35C  48 00 6C E5 */	bl DBPrintf
lbl_800C3440:
/* 800C3440 000BF360  3C 60 80 0C */	lis r3, DMAErrorHandler@ha
/* 800C3444 000BF364  38 83 32 20 */	addi r4, r3, DMAErrorHandler@l
/* 800C3448 000BF368  38 60 00 01 */	li r3, 1
/* 800C344C 000BF36C  48 00 09 81 */	bl OSSetErrorHandler
/* 800C3450 000BF370  38 7F 01 FC */	addi r3, r31, 0x1fc
/* 800C3454 000BF374  4C C6 31 82 */	crclr 6
/* 800C3458 000BF378  48 00 6C C9 */	bl DBPrintf
/* 800C345C 000BF37C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800C3460 000BF380  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800C3464 000BF384  83 C1 00 08 */	lwz r30, 8(r1)
/* 800C3468 000BF388  7C 08 03 A6 */	mtlr r0
/* 800C346C 000BF38C  38 21 00 10 */	addi r1, r1, 0x10
/* 800C3470 000BF390  4E 80 00 20 */	blr

.section .data

.global lbl_801E62C8
lbl_801E62C8:
	# ROM: 0x1E32C8
glabel string_____L2_INVALIDATE___SHOULD_NEVER_HAPPEN_n
	.asciz ">>> L2 INVALIDATE : SHOULD NEVER HAPPEN\n"
	.balign 4
glabel string_Machine_check_received_n
	.asciz "Machine check received\n"
glabel string_HID2___0x_x___SRR1___0x_x_n
	.asciz "HID2 = 0x%x   SRR1 = 0x%x\n"
	.balign 4
glabel string_Machine_check_was_not_DMA_locked_cache_related_n
	.asciz "Machine check was not DMA/locked cache related\n"
glabel string_DMAErrorHandler____An_error_occurred_while_processing_DMA__n
	.asciz "DMAErrorHandler(): An error occurred while processing DMA.\n"
glabel string_The_following_errors_have_been_detected_and_cleared___n
	.asciz "The following errors have been detected and cleared :\n"
	.balign 4
glabel string__t__Requested_a_locked_cache_tag_that_was_already_in_the_cache_n
	.asciz "\t- Requested a locked cache tag that was already in the cache\n"
	.balign 4
glabel string__t__DMA_attempted_to_access_normal_cache_n
	.asciz "\t- DMA attempted to access normal cache\n"
	.balign 4
glabel string__t__DMA_missed_in_data_cache_n
	.asciz "\t- DMA missed in data cache\n"
	.balign 4
glabel string__t__DMA_queue_overflowed_n
	.asciz "\t- DMA queue overflowed\n"
	.balign 4
glabel string_L1_i_caches_initialized_n
	.asciz "L1 i-caches initialized\n"
	.balign 4
glabel string_L1_d_caches_initialized_n
	.asciz "L1 d-caches initialized\n"
	.balign 4
glabel string_L2_cache_initialized_n
	.asciz "L2 cache initialized\n"
	.balign 4
glabel string_Locked_cache_machine_check_handler_installed_n
	.asciz "Locked cache machine check handler installed\n"
	.balign 4
	.4byte 0

.global lbl_801E64F8
lbl_801E64F8:
	# ROM: 0x1E34F8
glabel string___________________________Context_0x_08x___________________________n
	.asciz "------------------------- Context 0x%08x -------------------------\n"
glabel string_r__2d____0x_08x___14d___r__2d____0x_08x___14d__n
	.asciz "r%-2d  = 0x%08x (%14d)  r%-2d  = 0x%08x (%14d)\n"
glabel string_LR_____0x_08x___________________CR_____0x_08x_n
	.asciz "LR   = 0x%08x                   CR   = 0x%08x\n"
	.balign 4
glabel string_SRR0___0x_08x___________________SRR1___0x_08x_n
	.asciz "SRR0 = 0x%08x                   SRR1 = 0x%08x\n"
	.balign 4
glabel string__nGQRs___________n
	.asciz "\nGQRs----------\n"
	.balign 4
glabel string_gqr_d___0x_08x__t_gqr_d___0x_08x_n
	.asciz "gqr%d = 0x%08x \t gqr%d = 0x%08x\n"
	.balign 4
glabel string__n_nFPRs___________n
	.asciz "\n\nFPRs----------\n"
	.balign 4
glabel string_fr_d__t___d__t_fr_d__t___d_n
	.asciz "fr%d \t= %d \t fr%d \t= %d\n"
	.balign 4
glabel string__n_nPSFs___________n
	.asciz "\n\nPSFs----------\n"
	.balign 4
glabel string_ps_d__t__0x_x__t_ps_d__t__0x_x_n
	.asciz "ps%d \t= 0x%x \t ps%d \t= 0x%x\n"
	.balign 4
glabel string__nAddress_______Back_Chain____LR_Save_n
	.asciz "\nAddress:      Back Chain    LR Save\n"
	.balign 4
glabel string_0x_08x____0x_08x____0x_08x_n
	.asciz "0x%08x:   0x%08x    0x%08x\n"

.global lbl_801E66AC
lbl_801E66AC:
	# ROM: 0x1E36AC
glabel string_FPU_unavailable_handler_installed_n
	.asciz "FPU-unavailable handler installed\n"
	.balign 4
