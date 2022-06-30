.include "macros.inc"

.section .text

.global func_800AC718
func_800AC718:
/* 800AC718 000A8638  7C 08 02 A6 */	mflr r0
/* 800AC71C 000A863C  3C 80 01 00 */	lis r4, 0x00FFFFFF@ha
/* 800AC720 000A8640  90 01 00 04 */	stw r0, 4(r1)
/* 800AC724 000A8644  38 84 FF FF */	addi r4, r4, 0x00FFFFFF@l
/* 800AC728 000A8648  94 21 FF 40 */	stwu r1, -0xc0(r1)
/* 800AC72C 000A864C  DB E1 00 B8 */	stfd f31, 0xb8(r1)
/* 800AC730 000A8650  38 A1 00 4C */	addi r5, r1, 0x4c
/* 800AC734 000A8654  DB C1 00 B0 */	stfd f30, 0xb0(r1)
/* 800AC738 000A8658  DB A1 00 A8 */	stfd f29, 0xa8(r1)
/* 800AC73C 000A865C  DB 81 00 A0 */	stfd f28, 0xa0(r1)
/* 800AC740 000A8660  DB 61 00 98 */	stfd f27, 0x98(r1)
/* 800AC744 000A8664  DB 41 00 90 */	stfd f26, 0x90(r1)
/* 800AC748 000A8668  93 E1 00 8C */	stw r31, 0x8c(r1)
/* 800AC74C 000A866C  93 C1 00 88 */	stw r30, 0x88(r1)
/* 800AC750 000A8670  93 A1 00 84 */	stw r29, 0x84(r1)
/* 800AC754 000A8674  93 81 00 80 */	stw r28, 0x80(r1)
/* 800AC758 000A8678  3B 83 00 00 */	addi r28, r3, 0
/* 800AC75C 000A867C  38 65 00 00 */	addi r3, r5, 0
/* 800AC760 000A8680  80 02 B6 C8 */	lwz r0, lbl_802F5EC8@sda21(r2)
/* 800AC764 000A8684  90 01 00 4C */	stw r0, 0x4c(r1)
/* 800AC768 000A8688  48 03 38 75 */	bl GXSetCopyClear
/* 800AC76C 000A868C  2C 1C 00 00 */	cmpwi r28, 0
/* 800AC770 000A8690  41 80 02 7C */	blt lbl_800AC9EC
/* 800AC774 000A8694  38 60 00 00 */	li r3, 0
/* 800AC778 000A8698  4B F7 9B 95 */	bl bitmap_is_group_loaded
/* 800AC77C 000A869C  2C 03 00 00 */	cmpwi r3, 0
/* 800AC780 000A86A0  41 82 01 40 */	beq lbl_800AC8C0
/* 800AC784 000A86A4  4B F7 9C 21 */	bl bitmap_init_tev
/* 800AC788 000A86A8  4B F5 AD DD */	bl mathutil_mtxA_from_identity
/* 800AC78C 000A86AC  80 6D 99 80 */	lwz r3, mathutilData@sda21(r13)
/* 800AC790 000A86B0  38 80 00 00 */	li r4, 0
/* 800AC794 000A86B4  48 03 7D ED */	bl GXLoadPosMtxImm
/* 800AC798 000A86B8  C0 22 B6 78 */	lfs f1, lbl_802F5E78@sda21(r2)
/* 800AC79C 000A86BC  38 61 00 0C */	addi r3, r1, 0xc
/* 800AC7A0 000A86C0  C0 42 B6 7C */	lfs f2, lbl_802F5E7C@sda21(r2)
/* 800AC7A4 000A86C4  FC 60 08 90 */	fmr f3, f1
/* 800AC7A8 000A86C8  C0 82 B6 80 */	lfs f4, lbl_802F5E80@sda21(r2)
/* 800AC7AC 000A86CC  FC A0 08 90 */	fmr f5, f1
/* 800AC7B0 000A86D0  C0 C2 B6 84 */	lfs f6, lbl_802F5E84@sda21(r2)
/* 800AC7B4 000A86D4  48 01 E0 0D */	bl C_MTXOrtho
/* 800AC7B8 000A86D8  38 61 00 0C */	addi r3, r1, 0xc
/* 800AC7BC 000A86DC  38 80 00 01 */	li r4, 1
/* 800AC7C0 000A86E0  48 03 7B E9 */	bl GXSetProjection
/* 800AC7C4 000A86E4  80 6D 9B 24 */	lwz r3, lbl_802F1D04@sda21(r13)
/* 800AC7C8 000A86E8  38 00 00 04 */	li r0, 4
/* 800AC7CC 000A86EC  90 6D A0 1C */	stw r3, lbl_802F21FC@sda21(r13)
/* 800AC7D0 000A86F0  90 0D 9B 24 */	stw r0, lbl_802F1D04@sda21(r13)
/* 800AC7D4 000A86F4  4B FC 52 B9 */	bl reset_text_draw_settings
/* 800AC7D8 000A86F8  38 60 00 B3 */	li r3, 0xb3
/* 800AC7DC 000A86FC  4B FC 52 F9 */	bl set_text_font
/* 800AC7E0 000A8700  C0 22 B6 88 */	lfs f1, lbl_802F5E88@sda21(r2)
/* 800AC7E4 000A8704  4B FC 53 39 */	bl func_80071B1C
/* 800AC7E8 000A8708  3C 60 00 20 */	lis r3, 0x20
/* 800AC7EC 000A870C  4B FC 53 65 */	bl func_80071B50
/* 800AC7F0 000A8710  C0 22 B6 8C */	lfs f1, lbl_802F5E8C@sda21(r2)
/* 800AC7F4 000A8714  C0 42 B6 90 */	lfs f2, lbl_802F5E90@sda21(r2)
/* 800AC7F8 000A8718  4B FC 53 35 */	bl set_text_scale
/* 800AC7FC 000A871C  3C 60 80 1D */	lis r3, lbl_801D6894@ha
/* 800AC800 000A8720  CB E2 B6 A0 */	lfd f31, lbl_802F5EA0@sda21(r2)
/* 800AC804 000A8724  3B C0 00 00 */	li r30, 0
/* 800AC808 000A8728  CB C2 B6 98 */	lfd f30, lbl_802F5E98@sda21(r2)
/* 800AC80C 000A872C  57 84 18 38 */	slwi r4, r28, 3
/* 800AC810 000A8730  CB A2 B6 A8 */	lfd f29, lbl_802F5EA8@sda21(r2)
/* 800AC814 000A8734  38 03 68 94 */	addi r0, r3, lbl_801D6894@l
/* 800AC818 000A8738  CB 82 B6 B0 */	lfd f28, lbl_802F5EB0@sda21(r2)
/* 800AC81C 000A873C  CB 62 B6 C0 */	lfd f27, lbl_802F5EC0@sda21(r2)
/* 800AC820 000A8740  7F A0 22 14 */	add r29, r0, r4
/* 800AC824 000A8744  CB 42 B6 B8 */	lfd f26, lbl_802F5EB8@sda21(r2)
/* 800AC828 000A8748  57 DC 18 38 */	slwi r28, r30, 3
/* 800AC82C 000A874C  3F E0 43 30 */	lis r31, 0x4330
/* 800AC830 000A8750  48 00 00 78 */	b lbl_800AC8A8
lbl_800AC834:
/* 800AC834 000A8754  80 7D 00 00 */	lwz r3, 0(r29)
/* 800AC838 000A8758  7C 63 E0 2E */	lwzx r3, r3, r28
/* 800AC83C 000A875C  4B FC 5E 6D */	bl u_get_text_width
/* 800AC840 000A8760  80 7D 00 04 */	lwz r3, 4(r29)
/* 800AC844 000A8764  6F C0 80 00 */	xoris r0, r30, 0x8000
/* 800AC848 000A8768  90 01 00 74 */	stw r0, 0x74(r1)
/* 800AC84C 000A876C  FC 1F 00 72 */	fmul f0, f31, f1
/* 800AC850 000A8770  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 800AC854 000A8774  90 01 00 7C */	stw r0, 0x7c(r1)
/* 800AC858 000A8778  93 E1 00 78 */	stw r31, 0x78(r1)
/* 800AC85C 000A877C  FC 3E 00 28 */	fsub f1, f30, f0
/* 800AC860 000A8780  C8 01 00 78 */	lfd f0, 0x78(r1)
/* 800AC864 000A8784  93 E1 00 70 */	stw r31, 0x70(r1)
/* 800AC868 000A8788  FC 20 08 18 */	frsp f1, f1
/* 800AC86C 000A878C  FC 40 D8 28 */	fsub f2, f0, f27
/* 800AC870 000A8790  C8 01 00 70 */	lfd f0, 0x70(r1)
/* 800AC874 000A8794  FC 5C 00 B2 */	fmul f2, f28, f2
/* 800AC878 000A8798  FC 00 D8 28 */	fsub f0, f0, f27
/* 800AC87C 000A879C  FC 5D 10 28 */	fsub f2, f29, f2
/* 800AC880 000A87A0  FC 1A 00 32 */	fmul f0, f26, f0
/* 800AC884 000A87A4  FC 42 00 2A */	fadd f2, f2, f0
/* 800AC888 000A87A8  FC 40 10 18 */	frsp f2, f2
/* 800AC88C 000A87AC  4B FC 52 D5 */	bl set_text_pos
/* 800AC890 000A87B0  80 7D 00 00 */	lwz r3, 0(r29)
/* 800AC894 000A87B4  4C C6 31 82 */	crclr 6
/* 800AC898 000A87B8  7C 63 E0 2E */	lwzx r3, r3, r28
/* 800AC89C 000A87BC  4B FC 62 25 */	bl func_80072AC0
/* 800AC8A0 000A87C0  3B 9C 00 08 */	addi r28, r28, 8
/* 800AC8A4 000A87C4  3B DE 00 01 */	addi r30, r30, 1
lbl_800AC8A8:
/* 800AC8A8 000A87C8  80 1D 00 04 */	lwz r0, 4(r29)
/* 800AC8AC 000A87CC  7C 1E 00 00 */	cmpw r30, r0
/* 800AC8B0 000A87D0  41 80 FF 84 */	blt lbl_800AC834
/* 800AC8B4 000A87D4  80 0D A0 1C */	lwz r0, lbl_802F21FC@sda21(r13)
/* 800AC8B8 000A87D8  90 0D 9B 24 */	stw r0, lbl_802F1D04@sda21(r13)
/* 800AC8BC 000A87DC  48 00 01 30 */	b lbl_800AC9EC
lbl_800AC8C0:
/* 800AC8C0 000A87E0  80 0D A0 18 */	lwz r0, lbl_802F21F8@sda21(r13)
/* 800AC8C4 000A87E4  2C 00 00 00 */	cmpwi r0, 0
/* 800AC8C8 000A87E8  40 82 00 30 */	bne lbl_800AC8F8
/* 800AC8CC 000A87EC  80 6D 99 4C */	lwz r3, mainHeap@sda21(r13)
/* 800AC8D0 000A87F0  48 01 5F 75 */	bl OSSetCurrentHeap
/* 800AC8D4 000A87F4  7C 7D 1B 78 */	mr r29, r3
/* 800AC8D8 000A87F8  4B FF 88 FD */	bl DEMOInitROMFont
/* 800AC8DC 000A87FC  38 60 00 16 */	li r3, 0x16
/* 800AC8E0 000A8800  38 80 FF FF */	li r4, -1
/* 800AC8E4 000A8804  4B FF 89 B9 */	bl DEMOSetROMFontSize
/* 800AC8E8 000A8808  7F A3 EB 78 */	mr r3, r29
/* 800AC8EC 000A880C  48 01 5F 59 */	bl OSSetCurrentHeap
/* 800AC8F0 000A8810  38 00 00 01 */	li r0, 1
/* 800AC8F4 000A8814  90 0D A0 18 */	stw r0, lbl_802F21F8@sda21(r13)
lbl_800AC8F8:
/* 800AC8F8 000A8818  38 60 00 02 */	li r3, 2
/* 800AC8FC 000A881C  38 80 02 80 */	li r4, 0x280
/* 800AC900 000A8820  38 A0 01 C0 */	li r5, 0x1c0
/* 800AC904 000A8824  4B FF 86 8D */	bl DEMOInitCaption
/* 800AC908 000A8828  3C 60 80 1D */	lis r3, lbl_801D6A50@ha
/* 800AC90C 000A882C  CB 42 B6 C0 */	lfd f26, lbl_802F5EC0@sda21(r2)
/* 800AC910 000A8830  3B A0 00 00 */	li r29, 0
/* 800AC914 000A8834  CB 62 B6 A0 */	lfd f27, lbl_802F5EA0@sda21(r2)
/* 800AC918 000A8838  57 84 18 38 */	slwi r4, r28, 3
/* 800AC91C 000A883C  CB 82 B6 98 */	lfd f28, lbl_802F5E98@sda21(r2)
/* 800AC920 000A8840  38 03 6A 50 */	addi r0, r3, lbl_801D6A50@l
/* 800AC924 000A8844  CB A2 B6 A8 */	lfd f29, lbl_802F5EA8@sda21(r2)
/* 800AC928 000A8848  CB C2 B6 B0 */	lfd f30, lbl_802F5EB0@sda21(r2)
/* 800AC92C 000A884C  7F C0 22 14 */	add r30, r0, r4
/* 800AC930 000A8850  CB E2 B6 B8 */	lfd f31, lbl_802F5EB8@sda21(r2)
/* 800AC934 000A8854  57 BC 18 38 */	slwi r28, r29, 3
/* 800AC938 000A8858  3F E0 43 30 */	lis r31, 0x4330
/* 800AC93C 000A885C  48 00 00 A4 */	b lbl_800AC9E0
lbl_800AC940:
/* 800AC940 000A8860  80 7E 00 00 */	lwz r3, 0(r30)
/* 800AC944 000A8864  7C 63 E0 2E */	lwzx r3, r3, r28
/* 800AC948 000A8868  4B FF 8D 4D */	bl DEMOGetRFTextWidth
/* 800AC94C 000A886C  80 9E 00 04 */	lwz r4, 4(r30)
/* 800AC950 000A8870  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 800AC954 000A8874  6F A0 80 00 */	xoris r0, r29, 0x8000
/* 800AC958 000A8878  90 61 00 74 */	stw r3, 0x74(r1)
/* 800AC95C 000A887C  6C 83 80 00 */	xoris r3, r4, 0x8000
/* 800AC960 000A8880  90 61 00 7C */	stw r3, 0x7c(r1)
/* 800AC964 000A8884  4C C6 31 82 */	crclr 6
/* 800AC968 000A8888  80 7E 00 00 */	lwz r3, 0(r30)
/* 800AC96C 000A888C  38 A0 00 01 */	li r5, 1
/* 800AC970 000A8890  93 E1 00 78 */	stw r31, 0x78(r1)
/* 800AC974 000A8894  7C C3 E0 2E */	lwzx r6, r3, r28
/* 800AC978 000A8898  90 01 00 6C */	stw r0, 0x6c(r1)
/* 800AC97C 000A889C  C8 01 00 78 */	lfd f0, 0x78(r1)
/* 800AC980 000A88A0  93 E1 00 70 */	stw r31, 0x70(r1)
/* 800AC984 000A88A4  FC 20 D0 28 */	fsub f1, f0, f26
/* 800AC988 000A88A8  93 E1 00 68 */	stw r31, 0x68(r1)
/* 800AC98C 000A88AC  C8 41 00 70 */	lfd f2, 0x70(r1)
/* 800AC990 000A88B0  C8 01 00 68 */	lfd f0, 0x68(r1)
/* 800AC994 000A88B4  FC 3E 00 72 */	fmul f1, f30, f1
/* 800AC998 000A88B8  FC 42 D0 28 */	fsub f2, f2, f26
/* 800AC99C 000A88BC  FC 00 D0 28 */	fsub f0, f0, f26
/* 800AC9A0 000A88C0  FC 3D 08 28 */	fsub f1, f29, f1
/* 800AC9A4 000A88C4  FC 5B 00 B2 */	fmul f2, f27, f2
/* 800AC9A8 000A88C8  FC 1F 00 32 */	fmul f0, f31, f0
/* 800AC9AC 000A88CC  FC 5C 10 28 */	fsub f2, f28, f2
/* 800AC9B0 000A88D0  FC 01 00 2A */	fadd f0, f1, f0
/* 800AC9B4 000A88D4  FC 40 10 18 */	frsp f2, f2
/* 800AC9B8 000A88D8  FC 00 00 18 */	frsp f0, f0
/* 800AC9BC 000A88DC  FC 20 10 1E */	fctiwz f1, f2
/* 800AC9C0 000A88E0  FC 00 00 1E */	fctiwz f0, f0
/* 800AC9C4 000A88E4  D8 21 00 60 */	stfd f1, 0x60(r1)
/* 800AC9C8 000A88E8  D8 01 00 58 */	stfd f0, 0x58(r1)
/* 800AC9CC 000A88EC  80 61 00 64 */	lwz r3, 0x64(r1)
/* 800AC9D0 000A88F0  80 81 00 5C */	lwz r4, 0x5c(r1)
/* 800AC9D4 000A88F4  4B FF 8B FD */	bl DEMORFPrintf
/* 800AC9D8 000A88F8  3B 9C 00 08 */	addi r28, r28, 8
/* 800AC9DC 000A88FC  3B BD 00 01 */	addi r29, r29, 1
lbl_800AC9E0:
/* 800AC9E0 000A8900  80 1E 00 04 */	lwz r0, 4(r30)
/* 800AC9E4 000A8904  7C 1D 00 00 */	cmpw r29, r0
/* 800AC9E8 000A8908  41 80 FF 58 */	blt lbl_800AC940
lbl_800AC9EC:
/* 800AC9EC 000A890C  4B F7 64 25 */	bl gpwait_main
/* 800AC9F0 000A8910  4B F7 64 C5 */	bl syncwait_main
/* 800AC9F4 000A8914  80 6D 99 58 */	lwz r3, globalFrameCounter@sda21(r13)
/* 800AC9F8 000A8918  38 03 00 01 */	addi r0, r3, 1
/* 800AC9FC 000A891C  90 0D 99 58 */	stw r0, globalFrameCounter@sda21(r13)
/* 800ACA00 000A8920  4B F7 62 B5 */	bl beginframe_main
/* 800ACA04 000A8924  4B F8 11 35 */	bl func_8002DB38
/* 800ACA08 000A8928  80 01 00 C4 */	lwz r0, 0xc4(r1)
/* 800ACA0C 000A892C  CB E1 00 B8 */	lfd f31, 0xb8(r1)
/* 800ACA10 000A8930  CB C1 00 B0 */	lfd f30, 0xb0(r1)
/* 800ACA14 000A8934  7C 08 03 A6 */	mtlr r0
/* 800ACA18 000A8938  CB A1 00 A8 */	lfd f29, 0xa8(r1)
/* 800ACA1C 000A893C  CB 81 00 A0 */	lfd f28, 0xa0(r1)
/* 800ACA20 000A8940  CB 61 00 98 */	lfd f27, 0x98(r1)
/* 800ACA24 000A8944  CB 41 00 90 */	lfd f26, 0x90(r1)
/* 800ACA28 000A8948  83 E1 00 8C */	lwz r31, 0x8c(r1)
/* 800ACA2C 000A894C  83 C1 00 88 */	lwz r30, 0x88(r1)
/* 800ACA30 000A8950  83 A1 00 84 */	lwz r29, 0x84(r1)
/* 800ACA34 000A8954  83 81 00 80 */	lwz r28, 0x80(r1)
/* 800ACA38 000A8958  38 21 00 C0 */	addi r1, r1, 0xc0
/* 800ACA3C 000A895C  4E 80 00 20 */	blr

.global func_800ACA40
func_800ACA40:
/* 800ACA40 000A8960  7C 08 02 A6 */	mflr r0
/* 800ACA44 000A8964  3C 60 80 1D */	lis r3, lbl_801D6A78@ha
/* 800ACA48 000A8968  90 01 00 04 */	stw r0, 4(r1)
/* 800ACA4C 000A896C  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 800ACA50 000A8970  93 E1 00 44 */	stw r31, 0x44(r1)
/* 800ACA54 000A8974  3B E3 6A 78 */	addi r31, r3, lbl_801D6A78@l
/* 800ACA58 000A8978  93 C1 00 40 */	stw r30, 0x40(r1)
/* 800ACA5C 000A897C  93 A1 00 3C */	stw r29, 0x3c(r1)
/* 800ACA60 000A8980  3B A0 00 00 */	li r29, 0
/* 800ACA64 000A8984  93 81 00 38 */	stw r28, 0x38(r1)
/* 800ACA68 000A8988  3B 80 FF FF */	li r28, -1
lbl_800ACA6C:
/* 800ACA6C 000A898C  2C 1D 00 00 */	cmpwi r29, 0
/* 800ACA70 000A8990  40 81 00 18 */	ble lbl_800ACA88
/* 800ACA74 000A8994  38 61 00 08 */	addi r3, r1, 8
/* 800ACA78 000A8998  4B F7 86 E1 */	bl func_80025158
/* 800ACA7C 000A899C  38 61 00 08 */	addi r3, r1, 8
/* 800ACA80 000A89A0  4B F7 8F 79 */	bl handle_reset_input
/* 800ACA84 000A89A4  48 00 96 11 */	bl ev_vibration_dest
lbl_800ACA88:
/* 800ACA88 000A89A8  48 02 17 F9 */	bl DVDGetDriveStatus
/* 800ACA8C 000A89AC  3B C3 00 00 */	addi r30, r3, 0
/* 800ACA90 000A89B0  38 1E 00 01 */	addi r0, r30, 1
/* 800ACA94 000A89B4  28 00 00 0C */	cmplwi r0, 0xc
/* 800ACA98 000A89B8  41 81 00 38 */	bgt lbl_800ACAD0
/* 800ACA9C 000A89BC  54 00 10 3A */	slwi r0, r0, 2
/* 800ACAA0 000A89C0  7C 1F 00 2E */	lwzx r0, r31, r0
/* 800ACAA4 000A89C4  7C 09 03 A6 */	mtctr r0
/* 800ACAA8 000A89C8  4E 80 04 20 */	bctr
.global lbl_800ACAAC
lbl_800ACAAC:
/* 800ACAAC 000A89CC  3B 80 00 01 */	li r28, 1
/* 800ACAB0 000A89D0  48 00 00 20 */	b lbl_800ACAD0
.global lbl_800ACAB4
lbl_800ACAB4:
/* 800ACAB4 000A89D4  3B 80 00 00 */	li r28, 0
/* 800ACAB8 000A89D8  48 00 00 18 */	b lbl_800ACAD0
.global lbl_800ACABC
lbl_800ACABC:
/* 800ACABC 000A89DC  3B 80 00 02 */	li r28, 2
/* 800ACAC0 000A89E0  48 00 00 10 */	b lbl_800ACAD0
.global lbl_800ACAC4
lbl_800ACAC4:
/* 800ACAC4 000A89E4  3B 80 00 03 */	li r28, 3
/* 800ACAC8 000A89E8  48 00 00 08 */	b lbl_800ACAD0
.global lbl_800ACACC
lbl_800ACACC:
/* 800ACACC 000A89EC  3B 80 FF FF */	li r28, -1
lbl_800ACAD0:
.global lbl_800ACAD0
/* 800ACAD0 000A89F0  2C 1C 00 00 */	cmpwi r28, 0
/* 800ACAD4 000A89F4  41 80 00 0C */	blt lbl_800ACAE0
/* 800ACAD8 000A89F8  7F 83 E3 78 */	mr r3, r28
/* 800ACADC 000A89FC  4B FF FC 3D */	bl func_800AC718
lbl_800ACAE0:
/* 800ACAE0 000A8A00  2C 1D 00 3C */	cmpwi r29, 0x3c
/* 800ACAE4 000A8A04  40 80 00 08 */	bge lbl_800ACAEC
/* 800ACAE8 000A8A08  3B BD 00 01 */	addi r29, r29, 1
lbl_800ACAEC:
/* 800ACAEC 000A8A0C  2C 1E 00 00 */	cmpwi r30, 0
/* 800ACAF0 000A8A10  41 82 00 14 */	beq lbl_800ACB04
/* 800ACAF4 000A8A14  2C 1E 00 01 */	cmpwi r30, 1
/* 800ACAF8 000A8A18  41 82 00 0C */	beq lbl_800ACB04
/* 800ACAFC 000A8A1C  2C 1E FF FF */	cmpwi r30, -1
/* 800ACB00 000A8A20  40 82 FF 6C */	bne lbl_800ACA6C
lbl_800ACB04:
/* 800ACB04 000A8A24  2C 1E FF FF */	cmpwi r30, -1
/* 800ACB08 000A8A28  40 82 00 14 */	bne lbl_800ACB1C
/* 800ACB0C 000A8A2C  4B F7 80 89 */	bl input_main
lbl_800ACB10:
/* 800ACB10 000A8A30  38 60 00 04 */	li r3, 4
/* 800ACB14 000A8A34  4B FF FC 05 */	bl func_800AC718
/* 800ACB18 000A8A38  4B FF FF F8 */	b lbl_800ACB10
lbl_800ACB1C:
/* 800ACB1C 000A8A3C  2C 1D 00 01 */	cmpwi r29, 1
/* 800ACB20 000A8A40  40 81 00 14 */	ble lbl_800ACB34
/* 800ACB24 000A8A44  80 0D A0 24 */	lwz r0, lbl_802F2204@sda21(r13)
/* 800ACB28 000A8A48  60 00 00 01 */	ori r0, r0, 1
/* 800ACB2C 000A8A4C  90 0D A0 24 */	stw r0, lbl_802F2204@sda21(r13)
/* 800ACB30 000A8A50  48 00 00 10 */	b lbl_800ACB40
lbl_800ACB34:
/* 800ACB34 000A8A54  80 0D A0 24 */	lwz r0, lbl_802F2204@sda21(r13)
/* 800ACB38 000A8A58  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800ACB3C 000A8A5C  90 0D A0 24 */	stw r0, lbl_802F2204@sda21(r13)
lbl_800ACB40:
/* 800ACB40 000A8A60  80 0D A0 24 */	lwz r0, lbl_802F2204@sda21(r13)
/* 800ACB44 000A8A64  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800ACB48 000A8A68  41 82 00 08 */	beq lbl_800ACB50
/* 800ACB4C 000A8A6C  4B F8 10 79 */	bl func_8002DBC4
lbl_800ACB50:
/* 800ACB50 000A8A70  80 0D A0 18 */	lwz r0, lbl_802F21F8@sda21(r13)
/* 800ACB54 000A8A74  2C 00 00 00 */	cmpwi r0, 0
/* 800ACB58 000A8A78  41 82 00 28 */	beq lbl_800ACB80
/* 800ACB5C 000A8A7C  80 6D 99 4C */	lwz r3, mainHeap@sda21(r13)
/* 800ACB60 000A8A80  48 01 5C E5 */	bl OSSetCurrentHeap
/* 800ACB64 000A8A84  7C 7E 1B 78 */	mr r30, r3
/* 800ACB68 000A8A88  4B FF 8B 9D */	bl func_800A5704
/* 800ACB6C 000A8A8C  7F C3 F3 78 */	mr r3, r30
/* 800ACB70 000A8A90  48 01 5C D5 */	bl OSSetCurrentHeap
/* 800ACB74 000A8A94  4B FF 12 D1 */	bl gxcache_init
/* 800ACB78 000A8A98  38 00 00 00 */	li r0, 0
/* 800ACB7C 000A8A9C  90 0D A0 18 */	stw r0, lbl_802F21F8@sda21(r13)
lbl_800ACB80:
/* 800ACB80 000A8AA0  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800ACB84 000A8AA4  83 E1 00 44 */	lwz r31, 0x44(r1)
/* 800ACB88 000A8AA8  83 C1 00 40 */	lwz r30, 0x40(r1)
/* 800ACB8C 000A8AAC  7C 08 03 A6 */	mtlr r0
/* 800ACB90 000A8AB0  83 A1 00 3C */	lwz r29, 0x3c(r1)
/* 800ACB94 000A8AB4  83 81 00 38 */	lwz r28, 0x38(r1)
/* 800ACB98 000A8AB8  38 21 00 48 */	addi r1, r1, 0x48
/* 800ACB9C 000A8ABC  4E 80 00 20 */	blr

lbl_800ACBA0:
/* 800ACBA0 000A8AC0  2C 03 00 00 */	cmpwi r3, 0
/* 800ACBA4 000A8AC4  40 80 00 0C */	bge lbl_800ACBB0
/* 800ACBA8 000A8AC8  90 6D A0 20 */	stw r3, lbl_802F2200@sda21(r13)
/* 800ACBAC 000A8ACC  4E 80 00 20 */	blr
lbl_800ACBB0:
/* 800ACBB0 000A8AD0  38 00 00 00 */	li r0, 0
/* 800ACBB4 000A8AD4  90 0D A0 20 */	stw r0, lbl_802F2200@sda21(r13)
/* 800ACBB8 000A8AD8  4E 80 00 20 */	blr

.global u_read_dvd_file
u_read_dvd_file:
/* 800ACBBC 000A8ADC  7C 08 02 A6 */	mflr r0
/* 800ACBC0 000A8AE0  3C E0 80 0B */	lis r7, lbl_800ACBA0@ha
/* 800ACBC4 000A8AE4  90 01 00 04 */	stw r0, 4(r1)
/* 800ACBC8 000A8AE8  38 00 00 01 */	li r0, 1
/* 800ACBCC 000A8AEC  38 E7 CB A0 */	addi r7, r7, lbl_800ACBA0@l
/* 800ACBD0 000A8AF0  94 21 FF A8 */	stwu r1, -0x58(r1)
/* 800ACBD4 000A8AF4  39 00 00 02 */	li r8, 2
/* 800ACBD8 000A8AF8  93 E1 00 54 */	stw r31, 0x54(r1)
/* 800ACBDC 000A8AFC  93 C1 00 50 */	stw r30, 0x50(r1)
/* 800ACBE0 000A8B00  3B C0 00 00 */	li r30, 0
/* 800ACBE4 000A8B04  93 A1 00 4C */	stw r29, 0x4c(r1)
/* 800ACBE8 000A8B08  3B A3 00 00 */	addi r29, r3, 0
/* 800ACBEC 000A8B0C  90 0D A0 20 */	stw r0, lbl_802F2200@sda21(r13)
/* 800ACBF0 000A8B10  48 01 F2 3D */	bl DVDReadAsyncPrio
/* 800ACBF4 000A8B14  3C 60 80 1D */	lis r3, lbl_801D6AAC@ha
/* 800ACBF8 000A8B18  3B E3 6A AC */	addi r31, r3, lbl_801D6AAC@l
lbl_800ACBFC:
/* 800ACBFC 000A8B1C  2C 1E 00 00 */	cmpwi r30, 0
/* 800ACC00 000A8B20  41 82 00 18 */	beq lbl_800ACC18
/* 800ACC04 000A8B24  38 61 00 18 */	addi r3, r1, 0x18
/* 800ACC08 000A8B28  4B F7 85 51 */	bl func_80025158
/* 800ACC0C 000A8B2C  38 61 00 18 */	addi r3, r1, 0x18
/* 800ACC10 000A8B30  4B F7 8D E9 */	bl handle_reset_input
/* 800ACC14 000A8B34  48 00 94 81 */	bl ev_vibration_dest
lbl_800ACC18:
/* 800ACC18 000A8B38  48 02 16 69 */	bl DVDGetDriveStatus
/* 800ACC1C 000A8B3C  38 03 00 01 */	addi r0, r3, 1
/* 800ACC20 000A8B40  28 00 00 0C */	cmplwi r0, 0xc
/* 800ACC24 000A8B44  41 81 00 4C */	bgt lbl_800ACC70
/* 800ACC28 000A8B48  54 00 10 3A */	slwi r0, r0, 2
/* 800ACC2C 000A8B4C  7C 1F 00 2E */	lwzx r0, r31, r0
/* 800ACC30 000A8B50  7C 09 03 A6 */	mtctr r0
/* 800ACC34 000A8B54  4E 80 04 20 */	bctr
.global lbl_800ACC38
lbl_800ACC38:
/* 800ACC38 000A8B58  38 60 00 00 */	li r3, 0
/* 800ACC3C 000A8B5C  4B FF FA DD */	bl func_800AC718
/* 800ACC40 000A8B60  48 00 00 30 */	b lbl_800ACC70
.global lbl_800ACC44
lbl_800ACC44:
/* 800ACC44 000A8B64  38 60 00 01 */	li r3, 1
/* 800ACC48 000A8B68  4B FF FA D1 */	bl func_800AC718
/* 800ACC4C 000A8B6C  48 00 00 24 */	b lbl_800ACC70
.global lbl_800ACC50
lbl_800ACC50:
/* 800ACC50 000A8B70  38 60 00 02 */	li r3, 2
/* 800ACC54 000A8B74  4B FF FA C5 */	bl func_800AC718
/* 800ACC58 000A8B78  48 00 00 18 */	b lbl_800ACC70
.global lbl_800ACC5C
lbl_800ACC5C:
/* 800ACC5C 000A8B7C  38 60 00 03 */	li r3, 3
/* 800ACC60 000A8B80  4B FF FA B9 */	bl func_800AC718
/* 800ACC64 000A8B84  48 00 00 0C */	b lbl_800ACC70
.global lbl_800ACC68
lbl_800ACC68:
/* 800ACC68 000A8B88  38 60 00 04 */	li r3, 4
/* 800ACC6C 000A8B8C  4B FF FA AD */	bl func_800AC718
lbl_800ACC70:
.global lbl_800ACC70
/* 800ACC70 000A8B90  80 0D A0 20 */	lwz r0, lbl_802F2200@sda21(r13)
/* 800ACC74 000A8B94  3B C0 00 01 */	li r30, 1
/* 800ACC78 000A8B98  2C 00 00 01 */	cmpwi r0, 1
/* 800ACC7C 000A8B9C  41 82 FF 80 */	beq lbl_800ACBFC
/* 800ACC80 000A8BA0  80 0D A0 20 */	lwz r0, lbl_802F2200@sda21(r13)
/* 800ACC84 000A8BA4  2C 00 00 00 */	cmpwi r0, 0
/* 800ACC88 000A8BA8  40 80 00 14 */	bge lbl_800ACC9C
lbl_800ACC8C:
/* 800ACC8C 000A8BAC  4B F7 7F 09 */	bl input_main
/* 800ACC90 000A8BB0  38 60 00 04 */	li r3, 4
/* 800ACC94 000A8BB4  4B FF FA 85 */	bl func_800AC718
/* 800ACC98 000A8BB8  4B FF FF F4 */	b lbl_800ACC8C
lbl_800ACC9C:
/* 800ACC9C 000A8BBC  80 0D A0 18 */	lwz r0, lbl_802F21F8@sda21(r13)
/* 800ACCA0 000A8BC0  2C 00 00 00 */	cmpwi r0, 0
/* 800ACCA4 000A8BC4  41 82 00 28 */	beq lbl_800ACCCC
/* 800ACCA8 000A8BC8  80 6D 99 4C */	lwz r3, mainHeap@sda21(r13)
/* 800ACCAC 000A8BCC  48 01 5B 99 */	bl OSSetCurrentHeap
/* 800ACCB0 000A8BD0  7C 7F 1B 78 */	mr r31, r3
/* 800ACCB4 000A8BD4  4B FF 8A 51 */	bl func_800A5704
/* 800ACCB8 000A8BD8  7F E3 FB 78 */	mr r3, r31
/* 800ACCBC 000A8BDC  48 01 5B 89 */	bl OSSetCurrentHeap
/* 800ACCC0 000A8BE0  4B FF 11 85 */	bl gxcache_init
/* 800ACCC4 000A8BE4  38 00 00 00 */	li r0, 0
/* 800ACCC8 000A8BE8  90 0D A0 18 */	stw r0, lbl_802F21F8@sda21(r13)
lbl_800ACCCC:
/* 800ACCCC 000A8BEC  80 01 00 5C */	lwz r0, 0x5c(r1)
/* 800ACCD0 000A8BF0  80 7D 00 34 */	lwz r3, 0x34(r29)
/* 800ACCD4 000A8BF4  83 E1 00 54 */	lwz r31, 0x54(r1)
/* 800ACCD8 000A8BF8  7C 08 03 A6 */	mtlr r0
/* 800ACCDC 000A8BFC  83 C1 00 50 */	lwz r30, 0x50(r1)
/* 800ACCE0 000A8C00  83 A1 00 4C */	lwz r29, 0x4c(r1)
/* 800ACCE4 000A8C04  38 21 00 58 */	addi r1, r1, 0x58
/* 800ACCE8 000A8C08  4E 80 00 20 */	blr

.global init_loading_gct
init_loading_gct:
/* 800ACCEC 000A8C0C  7C 08 02 A6 */	mflr r0
/* 800ACCF0 000A8C10  3C 60 80 1D */	lis r3, lbl_801D6AE0@ha
/* 800ACCF4 000A8C14  90 01 00 04 */	stw r0, 4(r1)
/* 800ACCF8 000A8C18  38 83 6A E0 */	addi r4, r3, lbl_801D6AE0@l
/* 800ACCFC 000A8C1C  38 A0 00 00 */	li r5, 0
/* 800ACD00 000A8C20  94 21 FF 38 */	stwu r1, -0xc8(r1)
/* 800ACD04 000A8C24  38 C0 02 80 */	li r6, 0x280
/* 800ACD08 000A8C28  38 E0 01 E0 */	li r7, 0x1e0
/* 800ACD0C 000A8C2C  93 E1 00 C4 */	stw r31, 0xc4(r1)
/* 800ACD10 000A8C30  38 61 00 48 */	addi r3, r1, 0x48
/* 800ACD14 000A8C34  39 00 00 0E */	li r8, 0xe
/* 800ACD18 000A8C38  48 00 02 15 */	bl preview_create
/* 800ACD1C 000A8C3C  38 61 00 48 */	addi r3, r1, 0x48
/* 800ACD20 000A8C40  48 00 03 51 */	bl u_preview_wait_then_do_something
/* 800ACD24 000A8C44  3B E0 00 00 */	li r31, 0
lbl_800ACD28:
/* 800ACD28 000A8C48  4B F7 5F 8D */	bl beginframe_main
/* 800ACD2C 000A8C4C  4B F5 A8 39 */	bl mathutil_mtxA_from_identity
/* 800ACD30 000A8C50  80 6D 99 80 */	lwz r3, mathutilData@sda21(r13)
/* 800ACD34 000A8C54  38 80 00 00 */	li r4, 0
/* 800ACD38 000A8C58  48 03 78 49 */	bl GXLoadPosMtxImm
/* 800ACD3C 000A8C5C  C0 22 B6 78 */	lfs f1, lbl_802F5E78@sda21(r2)
/* 800ACD40 000A8C60  38 61 00 08 */	addi r3, r1, 8
/* 800ACD44 000A8C64  C0 42 B6 7C */	lfs f2, lbl_802F5E7C@sda21(r2)
/* 800ACD48 000A8C68  FC 60 08 90 */	fmr f3, f1
/* 800ACD4C 000A8C6C  C0 82 B6 80 */	lfs f4, lbl_802F5E80@sda21(r2)
/* 800ACD50 000A8C70  FC A0 08 90 */	fmr f5, f1
/* 800ACD54 000A8C74  C0 C2 B6 84 */	lfs f6, lbl_802F5E84@sda21(r2)
/* 800ACD58 000A8C78  48 01 DA 69 */	bl C_MTXOrtho
/* 800ACD5C 000A8C7C  38 61 00 08 */	addi r3, r1, 8
/* 800ACD60 000A8C80  38 80 00 01 */	li r4, 1
/* 800ACD64 000A8C84  48 03 76 45 */	bl GXSetProjection
/* 800ACD68 000A8C88  4B F7 96 3D */	bl bitmap_init_tev
/* 800ACD6C 000A8C8C  C0 22 B6 78 */	lfs f1, lbl_802F5E78@sda21(r2)
/* 800ACD70 000A8C90  38 61 00 48 */	addi r3, r1, 0x48
/* 800ACD74 000A8C94  C0 62 B6 CC */	lfs f3, lbl_802F5ECC@sda21(r2)
/* 800ACD78 000A8C98  38 80 FF FF */	li r4, -1
/* 800ACD7C 000A8C9C  FC 40 08 90 */	fmr f2, f1
/* 800ACD80 000A8CA0  C0 82 B6 80 */	lfs f4, lbl_802F5E80@sda21(r2)
/* 800ACD84 000A8CA4  38 A0 00 00 */	li r5, 0
/* 800ACD88 000A8CA8  C0 A2 B6 7C */	lfs f5, lbl_802F5E7C@sda21(r2)
/* 800ACD8C 000A8CAC  48 00 03 F5 */	bl func_800AD180
/* 800ACD90 000A8CB0  4B F7 60 81 */	bl gpwait_main
/* 800ACD94 000A8CB4  4B F7 61 21 */	bl syncwait_main
/* 800ACD98 000A8CB8  3B FF 00 01 */	addi r31, r31, 1
/* 800ACD9C 000A8CBC  2C 1F 00 05 */	cmpwi r31, 5
/* 800ACDA0 000A8CC0  41 80 FF 88 */	blt lbl_800ACD28
/* 800ACDA4 000A8CC4  38 61 00 48 */	addi r3, r1, 0x48
/* 800ACDA8 000A8CC8  48 00 03 51 */	bl preview_free
/* 800ACDAC 000A8CCC  4B F7 5F 09 */	bl beginframe_main
/* 800ACDB0 000A8CD0  4B F7 60 61 */	bl gpwait_main
/* 800ACDB4 000A8CD4  4B F7 61 01 */	bl syncwait_main
/* 800ACDB8 000A8CD8  80 01 00 CC */	lwz r0, 0xcc(r1)
/* 800ACDBC 000A8CDC  83 E1 00 C4 */	lwz r31, 0xc4(r1)
/* 800ACDC0 000A8CE0  38 21 00 C8 */	addi r1, r1, 0xc8
/* 800ACDC4 000A8CE4  7C 08 03 A6 */	mtlr r0
/* 800ACDC8 000A8CE8  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F5E78
lbl_802F5E78:
	# ROM: 0x1EF898
	.4byte 0

.global lbl_802F5E7C
lbl_802F5E7C:
	# ROM: 0x1EF89C
	.4byte 0x43F00000

.global lbl_802F5E80
lbl_802F5E80:
	# ROM: 0x1EF8A0
	.4byte 0x44200000

.global lbl_802F5E84
lbl_802F5E84:
	# ROM: 0x1EF8A4
	.4byte 0x469C4000

.global lbl_802F5E88
lbl_802F5E88:
	# ROM: 0x1EF8A8
	.4byte 0x3C03126F

.global lbl_802F5E8C
lbl_802F5E8C:
	# ROM: 0x1EF8AC
	.4byte 0x3F4CCCCD

.global lbl_802F5E90
lbl_802F5E90:
	# ROM: 0x1EF8B0
	.4byte 0x3F800000
	.4byte 0

.global lbl_802F5E98
lbl_802F5E98:
	# ROM: 0x1EF8B8
	.4byte 0x40740000
	.4byte 0

.global lbl_802F5EA0
lbl_802F5EA0:
	# ROM: 0x1EF8C0
	.4byte 0x3FE00000
	.4byte 0

.global lbl_802F5EA8
lbl_802F5EA8:
	# ROM: 0x1EF8C8
	.4byte 0x406E0000
	.4byte 0

.global lbl_802F5EB0
lbl_802F5EB0:
	# ROM: 0x1EF8D0
	.4byte 0x40280000
	.4byte 0

.global lbl_802F5EB8
lbl_802F5EB8:
	# ROM: 0x1EF8D8
	.4byte 0x40380000
	.4byte 0

.global lbl_802F5EC0
lbl_802F5EC0:
	# ROM: 0x1EF8E0
	.4byte 0x43300000
	.4byte 0x80000000

.global lbl_802F5EC8
lbl_802F5EC8:
	# ROM: 0x1EF8E8
	.4byte 0x000000FF

.global lbl_802F5ECC
lbl_802F5ECC:
	# ROM: 0x1EF8EC
	.4byte 0x3F000000

.section .data

glabel string_a_Please_close_the_Disc_Cover_
	.asciz "a/Please close the Disc Cover."
	.balign 4
glabel string_a_Please_insert
	.asciz "a/Please insert"
glabel string_a_the_Super_Monkey_Ball_Game_Disc_
	.asciz "a/the Super Monkey Ball Game Disc."
	.balign 4
glabel lbl_801D6744
	.4byte string_a_Please_insert  ;# ptr
	.4byte 0
	.4byte string_a_the_Super_Monkey_Ball_Game_Disc_  ;# ptr
	.4byte 0
glabel lbl_801D6754
	.4byte string_a_Please_insert  ;# ptr
	.4byte 0
	.4byte string_a_the_Super_Monkey_Ball_Game_Disc_  ;# ptr
	.4byte 0
glabel string_a_Could_not_read_Game_Disc_
	.asciz "a/Could not read Game Disc."
glabel string_a_Please_see_the_Instruction_Booklet_for_details_
	.asciz "a/Please see the Instruction Booklet for details."
	.balign 4
glabel lbl_801D67B4
	.4byte string_a_Could_not_read_Game_Disc_  ;# ptr
	.4byte 0
	.4byte lbl_802F1720  ;# ptr
	.4byte 0
	.4byte string_a_Please_see_the_Instruction_Booklet_for_details_  ;# ptr
	.4byte 0
glabel string_a_An_error_has_occurred_
	.asciz "a/An error has occurred."
	.balign 4
glabel string_a_Press_the_POWER_Button_to_turn_off
	.asciz "a/Press the POWER Button to turn off"
	.balign 4
glabel string_a_the_Nintendo_GameCube_tm_
	.asciz "a/the Nintendo GameCube tm."
glabel string_a_Follow_the_instructions_in_the_Instruction_Booklet_
	.asciz "a/Follow the instructions in the Instruction Booklet."
	.balign 4
glabel lbl_801D6864
	.4byte string_a_An_error_has_occurred_  ;# ptr
	.4byte 0
	.4byte lbl_802F1720  ;# ptr
	.4byte 0
	.4byte string_a_Press_the_POWER_Button_to_turn_off  ;# ptr
	.4byte 0
	.4byte string_a_the_Nintendo_GameCube_tm_  ;# ptr
	.4byte 0
	.4byte lbl_802F1720  ;# ptr
	.4byte 0
	.4byte string_a_Follow_the_instructions_in_the_Instruction_Booklet_  ;# ptr
	.4byte 0

.global lbl_801D6894
lbl_801D6894:
	# ROM: 0x1D3894
	.4byte lbl_802F1718  ;# ptr
	.4byte 0x00000001
	.4byte lbl_801D6744  ;# ptr
	.4byte 0x00000002
	.4byte lbl_801D6754  ;# ptr
	.4byte 0x00000002
	.4byte lbl_801D67B4  ;# ptr
	.4byte 0x00000003
	.4byte lbl_801D6864  ;# ptr
	.4byte 0x00000006
glabel string_Please_close_the_Disc_Cover_
	.asciz "Please close the Disc Cover."
	.balign 4
glabel string_Please_insert
	.asciz "Please insert"
	.balign 4
glabel string_the_Super_Monkey_Ball_Game_Disc_
	.asciz "the Super Monkey Ball Game Disc."
	.balign 4
glabel lbl_801D6910
	.4byte string_Please_insert  ;# ptr
	.4byte 0
	.4byte string_the_Super_Monkey_Ball_Game_Disc_  ;# ptr
	.4byte 0
glabel lbl_801D6920
	.4byte string_Please_insert  ;# ptr
	.4byte 0
	.4byte string_the_Super_Monkey_Ball_Game_Disc_  ;# ptr
	.4byte 0
glabel string_Could_not_read_Game_Disc_
	.asciz "Could not read Game Disc."
	.balign 4
glabel string_Please_see_the_Instruction_Booklet_for_details_
	.asciz "Please see the Instruction Booklet for details."
glabel lbl_801D697C
	.4byte string_Could_not_read_Game_Disc_  ;# ptr
	.4byte 0
	.4byte lbl_802F1720  ;# ptr
	.4byte 0
	.4byte string_Please_see_the_Instruction_Booklet_for_details_  ;# ptr
	.4byte 0
glabel string_An_error_has_occurred_
	.asciz "An error has occurred."
	.balign 4
glabel string_Press_the_POWER_Button_to_turn_off
	.asciz "Press the POWER Button to turn off"
	.balign 4
glabel string_the_Nintendo_GameCube_tm_
	.asciz "the Nintendo GameCube tm."
	.balign 4
glabel string_Follow_the_instructions_in_the_Instruction_Booklet_
	.asciz "Follow the instructions in the Instruction Booklet."
glabel lbl_801D6A20
	.4byte string_An_error_has_occurred_  ;# ptr
	.4byte 0
	.4byte lbl_802F1720  ;# ptr
	.4byte 0
	.4byte string_Press_the_POWER_Button_to_turn_off  ;# ptr
	.4byte 0
	.4byte string_the_Nintendo_GameCube_tm_  ;# ptr
	.4byte 0
	.4byte lbl_802F1720  ;# ptr
	.4byte 0
	.4byte string_Follow_the_instructions_in_the_Instruction_Booklet_  ;# ptr
	.4byte 0

.global lbl_801D6A50
lbl_801D6A50:
	# ROM: 0x1D3A50
	.4byte lbl_802F1724  ;# ptr
	.4byte 0x00000001
	.4byte lbl_801D6910  ;# ptr
	.4byte 0x00000002
	.4byte lbl_801D6920  ;# ptr
	.4byte 0x00000002
	.4byte lbl_801D697C  ;# ptr
	.4byte 0x00000003
	.4byte lbl_801D6A20  ;# ptr
	.4byte 0x00000006

.global lbl_801D6A78
lbl_801D6A78:
	# ROM: 0x1D3A78
	.4byte lbl_800ACACC  ;# ptr
	.4byte lbl_800ACACC  ;# ptr
	.4byte lbl_800ACACC  ;# ptr
	.4byte lbl_800ACAD0  ;# ptr
	.4byte lbl_800ACAD0  ;# ptr
	.4byte lbl_800ACAAC  ;# ptr
	.4byte lbl_800ACAB4  ;# ptr
	.4byte lbl_800ACABC  ;# ptr
	.4byte lbl_800ACAD0  ;# ptr
	.4byte lbl_800ACAD0  ;# ptr
	.4byte lbl_800ACAD0  ;# ptr
	.4byte lbl_800ACAD0  ;# ptr
	.4byte lbl_800ACAC4  ;# ptr

.global lbl_801D6AAC
lbl_801D6AAC:
	# ROM: 0x1D3AAC
	.4byte lbl_800ACC68  ;# ptr
	.4byte lbl_800ACC70  ;# ptr
	.4byte lbl_800ACC70  ;# ptr
	.4byte lbl_800ACC70  ;# ptr
	.4byte lbl_800ACC70  ;# ptr
	.4byte lbl_800ACC44  ;# ptr
	.4byte lbl_800ACC38  ;# ptr
	.4byte lbl_800ACC50  ;# ptr
	.4byte lbl_800ACC70  ;# ptr
	.4byte lbl_800ACC70  ;# ptr
	.4byte lbl_800ACC70  ;# ptr
	.4byte lbl_800ACC70  ;# ptr
	.4byte lbl_800ACC5C  ;# ptr

.global lbl_801D6AE0
lbl_801D6AE0:
	# ROM: 0x1D3AE0
glabel string_loading_gct
	.asciz "loading.gct"
	.4byte 0

.section .sdata

glabel lbl_802F1718
	.4byte string_a_Please_close_the_Disc_Cover_  ;# ptr
	.4byte 0
glabel lbl_802F1720
	.4byte 0
glabel lbl_802F1724
	.4byte string_Please_close_the_Disc_Cover_  ;# ptr
	.4byte 0
	.4byte 0
glabel string_FONT_A
	.asciz "FONT_A"
	.balign 4
glabel string_FONT_B
	.asciz "FONT_B"
	.balign 4
glabel string_FONT_C
	.asciz "FONT_C"
	.balign 4
glabel string_FONT_D
	.asciz "FONT_D"
	.balign 4
glabel string_FONT_E
	.asciz "FONT_E"
	.balign 4
glabel string_FONT_F
	.asciz "FONT_F"
	.balign 4
glabel string_FONT_G
	.asciz "FONT_G"
	.balign 4
glabel string_FONT_H
	.asciz "FONT_H"
	.balign 4
glabel string_FONT_I
	.asciz "FONT_I"
	.balign 4
glabel string_FONT_J
	.asciz "FONT_J"
	.balign 4
glabel string_FONT_K
	.asciz "FONT_K"
	.balign 4
glabel string_FONT_L
	.asciz "FONT_L"
	.balign 4
glabel string_FONT_M
	.asciz "FONT_M"
	.balign 4
glabel string_FONT_N
	.asciz "FONT_N"
	.balign 4
glabel string_FONT_O
	.asciz "FONT_O"
	.balign 4
glabel string_FONT_P
	.asciz "FONT_P"
	.balign 4
glabel string_FONT_Q
	.asciz "FONT_Q"
	.balign 4
glabel string_FONT_R
	.asciz "FONT_R"
	.balign 4
glabel string_FONT_S
	.asciz "FONT_S"
	.balign 4
glabel string_FONT_T
	.asciz "FONT_T"
	.balign 4
glabel string_FONT_U
	.asciz "FONT_U"
	.balign 4
glabel string_FONT_V
	.asciz "FONT_V"
	.balign 4
glabel string_FONT_W
	.asciz "FONT_W"
	.balign 4
glabel string_FONT_X
	.asciz "FONT_X"
	.balign 4
glabel string_FONT_Y
	.asciz "FONT_Y"
	.balign 4
glabel string_FONT_Z
	.asciz "FONT_Z"
	.balign 4
glabel lbl_802F1800
	.4byte 0x53455800
glabel lbl_802F1804
	.4byte 0x58585800
glabel lbl_802F1808
	.4byte 0x58582000
glabel lbl_802F180C
	.4byte 0x58580000
glabel lbl_802F1810
	.4byte 0x20585800
glabel lbl_802F1814
	.4byte 0x58205800

.global lbl_802F1818
lbl_802F1818:
	# ROM: 0x1EBF58
glabel string_BUTTON
	.asciz "BUTTON"
	.balign 4

.global lbl_802F1820
lbl_802F1820:
	# ROM: 0x1EBF60
	.4byte 0x412E5600

.global lbl_802F1824
lbl_802F1824:
	# ROM: 0x1EBF64
	.4byte 0x2D2D2D00

.global lbl_802F1828
lbl_802F1828:
	# ROM: 0x1EBF68
glabel string__07d_2
	.asciz "%07d"
	.balign 4
glabel lbl_802F1830
	.4byte 0x4E414700
glabel lbl_802F1834
	.4byte 0x40524900
glabel lbl_802F1838
	.4byte 0x53484F00
glabel lbl_802F183C
	.4byte 0x53414B00
glabel lbl_802F1840
	.4byte 0x4A414D00
glabel lbl_802F1844
	.4byte 0x4D4B4100
glabel lbl_802F1848
	.4byte 0x4F444100
glabel lbl_802F184C
	.4byte 0x4D2E5300
glabel lbl_802F1850
	.4byte 0x482E4500
glabel lbl_802F1854
	.4byte 0x4A554E00
glabel lbl_802F1858
	.4byte 0x592E5300
glabel lbl_802F185C
	.4byte 0x41474500
glabel string_Bonobo
	.asciz "Bonobo"
	.balign 4
glabel string_Gorilla
	.asciz "Gorilla"
glabel string_Aye_Aye
	.asciz "Aye-Aye"
glabel string_Potto
	.asciz "Potto"
	.balign 4
glabel string_Avahi
	.asciz "Avahi"
	.balign 4
glabel string_Indris
	.asciz "Indris"
	.balign 4

.global lbl_802F1890
lbl_802F1890:
	# ROM: 0x1EBFD0
glabel string_STAFF
	.asciz "STAFF"
	.balign 4

.global lbl_802F1898
lbl_802F1898:
	# ROM: 0x1EBFD8
glabel string_SUPER
	.asciz "SUPER"
	.balign 4

.global lbl_802F18A0
lbl_802F18A0:
	# ROM: 0x1EBFE0
glabel string_READY_2
	.asciz "READY"
	.balign 4

.global lbl_802F18A8
lbl_802F18A8:
	# ROM: 0x1EBFE8
glabel string_GOAL_2
	.asciz "GOAL"
	.balign 4

.global lbl_802F18B0
lbl_802F18B0:
	# ROM: 0x1EBFF0
	.4byte 0x25730000

.global lbl_802F18B4
lbl_802F18B4:
	# ROM: 0x1EBFF4
	.4byte 0x25640000

.global lbl_802F18B8
lbl_802F18B8:
	# ROM: 0x1EBFF8
	.4byte 0x0F000000
	.4byte 0

.global lbl_802F18C0
lbl_802F18C0:
	# ROM: 0x1EC000
	.4byte 0x00EA0102
	.4byte 0x01420173

.global lbl_802F18C8
lbl_802F18C8:
	# ROM: 0x1EC008
	.4byte 0x00B70102
	.4byte 0x0141018B

.global lbl_802F18D0
lbl_802F18D0:
	# ROM: 0x1EC010
	.4byte 0x00EC0115
	.4byte 0x016D0173

.global lbl_802F18D8
lbl_802F18D8:
	# ROM: 0x1EC018
	.4byte 0x00B500FF
	.4byte 0x01380192

.global lbl_802F18E0
lbl_802F18E0:
	# ROM: 0x1EC020
	.4byte 0x00EA0102
	.4byte 0x016D0173

.global lbl_802F18E8
lbl_802F18E8:
	# ROM: 0x1EC028
	.4byte 0x00E40127
	.4byte 0x014A0000

.global lbl_802F18F0
lbl_802F18F0:
	# ROM: 0x1EC030
	.4byte 0x00E80101
	.4byte 0x016B0000

.global lbl_802F18F8
lbl_802F18F8:
	# ROM: 0x1EC038
	.4byte 0x00E80102
	.4byte 0x016D0000
glabel string_of__b_
	.asciz "of %b!"
	.balign 4
glabel string_Oh_wow_
	.asciz "Oh wow!"
glabel string__point
	.asciz " point"
	.balign 4
glabel string__points
	.asciz " points"
glabel lbl_802F1920
	.4byte 0
	.4byte 0
