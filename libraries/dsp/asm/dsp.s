.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global DSPCheckMailToDSP
DSPCheckMailToDSP:
/* 800D4778 000D0698  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 800D477C 000D069C  A0 03 50 00 */	lhz r0, 0xCC005000@l(r3)
/* 800D4780 000D06A0  54 03 8F FE */	rlwinm r3, r0, 0x11, 0x1f, 0x1f
/* 800D4784 000D06A4  4E 80 00 20 */	blr

.global DSPCheckMailFromDSP
DSPCheckMailFromDSP:
/* 800D4788 000D06A8  3C 60 CC 00 */	lis r3, 0xCC005004@ha
/* 800D478C 000D06AC  A0 03 50 04 */	lhz r0, 0xCC005004@l(r3)
/* 800D4790 000D06B0  54 03 8F FE */	rlwinm r3, r0, 0x11, 0x1f, 0x1f
/* 800D4794 000D06B4  4E 80 00 20 */	blr

.global DSPReadMailFromDSP
DSPReadMailFromDSP:
/* 800D4798 000D06B8  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 800D479C 000D06BC  38 63 50 00 */	addi r3, r3, 0xCC005000@l
/* 800D47A0 000D06C0  A0 03 00 04 */	lhz r0, 4(r3)
/* 800D47A4 000D06C4  A0 63 00 06 */	lhz r3, 6(r3)
/* 800D47A8 000D06C8  50 03 80 1E */	rlwimi r3, r0, 0x10, 0, 0xf
/* 800D47AC 000D06CC  4E 80 00 20 */	blr

.global DSPSendMailToDSP
DSPSendMailToDSP:
/* 800D47B0 000D06D0  3C 80 CC 00 */	lis r4, 0xCC005000@ha
/* 800D47B4 000D06D4  54 60 84 3E */	srwi r0, r3, 0x10
/* 800D47B8 000D06D8  B0 04 50 00 */	sth r0, 0xCC005000@l(r4)
/* 800D47BC 000D06DC  B0 64 50 02 */	sth r3, 0x5002(r4)
/* 800D47C0 000D06E0  4E 80 00 20 */	blr

.global DSPInit
DSPInit:
/* 800D47C4 000D06E4  7C 08 02 A6 */	mflr r0
/* 800D47C8 000D06E8  3C 60 80 1F */	lis r3, lbl_801E88E8@ha
/* 800D47CC 000D06EC  90 01 00 04 */	stw r0, 4(r1)
/* 800D47D0 000D06F0  38 63 88 E8 */	addi r3, r3, lbl_801E88E8@l
/* 800D47D4 000D06F4  4C C6 31 82 */	crclr 6
/* 800D47D8 000D06F8  38 83 00 20 */	addi r4, r3, 0x20
/* 800D47DC 000D06FC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800D47E0 000D0700  38 A3 00 2C */	addi r5, r3, 0x2c
/* 800D47E4 000D0704  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800D47E8 000D0708  48 00 01 05 */	bl __DSP_debug_printf
/* 800D47EC 000D070C  80 0D A3 38 */	lwz r0, __DSP_init_flag@sda21(r13)
/* 800D47F0 000D0710  2C 00 00 01 */	cmpwi r0, 1
/* 800D47F4 000D0714  41 82 00 74 */	beq lbl_800D4868
/* 800D47F8 000D0718  4B FF 18 C5 */	bl OSDisableInterrupts
/* 800D47FC 000D071C  3C 80 80 0D */	lis r4, __DSPHandler@ha
/* 800D4800 000D0720  3B E3 00 00 */	addi r31, r3, 0
/* 800D4804 000D0724  38 84 49 3C */	addi r4, r4, __DSPHandler@l
/* 800D4808 000D0728  38 60 00 07 */	li r3, 7
/* 800D480C 000D072C  4B FF 18 FD */	bl __OSSetInterruptHandler
/* 800D4810 000D0730  3C 60 01 00 */	lis r3, 0x100
/* 800D4814 000D0734  4B FF 1C D1 */	bl __OSUnmaskInterrupts
/* 800D4818 000D0738  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 800D481C 000D073C  38 C3 50 00 */	addi r6, r3, 0xCC005000@l
/* 800D4820 000D0740  A0 63 50 0A */	lhz r3, 0x500a(r3)
/* 800D4824 000D0744  38 00 FF 57 */	li r0, -169
/* 800D4828 000D0748  7C 60 00 38 */	and r0, r3, r0
/* 800D482C 000D074C  60 00 08 00 */	ori r0, r0, 0x800
/* 800D4830 000D0750  B0 06 00 0A */	sth r0, 0xa(r6)
/* 800D4834 000D0754  38 A0 FF 53 */	li r5, -173
/* 800D4838 000D0758  38 80 00 00 */	li r4, 0
/* 800D483C 000D075C  A0 E6 00 0A */	lhz r7, 0xa(r6)
/* 800D4840 000D0760  38 00 00 01 */	li r0, 1
/* 800D4844 000D0764  38 7F 00 00 */	addi r3, r31, 0
/* 800D4848 000D0768  7C E5 28 38 */	and r5, r7, r5
/* 800D484C 000D076C  B0 A6 00 0A */	sth r5, 0xa(r6)
/* 800D4850 000D0770  90 8D A3 3C */	stw r4, __DSP_tmp_task@sda21(r13)
/* 800D4854 000D0774  90 8D A3 40 */	stw r4, __DSP_curr_task@sda21(r13)
/* 800D4858 000D0778  90 8D A3 44 */	stw r4, __DSP_last_task@sda21(r13)
/* 800D485C 000D077C  90 8D A3 48 */	stw r4, __DSP_first_task@sda21(r13)
/* 800D4860 000D0780  90 0D A3 38 */	stw r0, __DSP_init_flag@sda21(r13)
/* 800D4864 000D0784  4B FF 18 81 */	bl OSRestoreInterrupts
lbl_800D4868:
/* 800D4868 000D0788  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800D486C 000D078C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800D4870 000D0790  38 21 00 10 */	addi r1, r1, 0x10
/* 800D4874 000D0794  7C 08 03 A6 */	mtlr r0
/* 800D4878 000D0798  4E 80 00 20 */	blr

.global DSPAddTask
DSPAddTask:
/* 800D487C 000D079C  7C 08 02 A6 */	mflr r0
/* 800D4880 000D07A0  90 01 00 04 */	stw r0, 4(r1)
/* 800D4884 000D07A4  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800D4888 000D07A8  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800D488C 000D07AC  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800D4890 000D07B0  7C 7E 1B 78 */	mr r30, r3
/* 800D4894 000D07B4  4B FF 18 29 */	bl OSDisableInterrupts
/* 800D4898 000D07B8  3B E3 00 00 */	addi r31, r3, 0
/* 800D489C 000D07BC  38 7E 00 00 */	addi r3, r30, 0
/* 800D48A0 000D07C0  48 00 07 ED */	bl __DSP_insert_task
/* 800D48A4 000D07C4  38 00 00 00 */	li r0, 0
/* 800D48A8 000D07C8  90 1E 00 00 */	stw r0, 0(r30)
/* 800D48AC 000D07CC  38 00 00 01 */	li r0, 1
/* 800D48B0 000D07D0  38 7F 00 00 */	addi r3, r31, 0
/* 800D48B4 000D07D4  90 1E 00 08 */	stw r0, 8(r30)
/* 800D48B8 000D07D8  4B FF 18 2D */	bl OSRestoreInterrupts
/* 800D48BC 000D07DC  80 0D A3 48 */	lwz r0, __DSP_first_task@sda21(r13)
/* 800D48C0 000D07E0  7C 1E 00 40 */	cmplw r30, r0
/* 800D48C4 000D07E4  40 82 00 0C */	bne lbl_800D48D0
/* 800D48C8 000D07E8  7F C3 F3 78 */	mr r3, r30
/* 800D48CC 000D07EC  48 00 06 35 */	bl __DSP_boot_task
lbl_800D48D0:
/* 800D48D0 000D07F0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800D48D4 000D07F4  7F C3 F3 78 */	mr r3, r30
/* 800D48D8 000D07F8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800D48DC 000D07FC  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800D48E0 000D0800  7C 08 03 A6 */	mtlr r0
/* 800D48E4 000D0804  38 21 00 18 */	addi r1, r1, 0x18
/* 800D48E8 000D0808  4E 80 00 20 */	blr

.section .data

.global lbl_801E88E8
lbl_801E88E8:
	# ROM: 0x1E58E8
glabel string_DSPInit____Build_Date___s__s_n
	.asciz "DSPInit(): Build Date: %s %s\n"
	.balign 4
glabel string_May_22_2001
	.asciz "May 22 2001"
glabel string_02_06_43
	.asciz "02:06:43"
	.balign 4

.section .sbss

.global __DSP_init_flag
__DSP_init_flag:
	.skip 0x4
.global __DSP_tmp_task
__DSP_tmp_task:
	.skip 0x4
