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
/* 800AC760 000A8680  80 02 B6 C8 */	lwz r0, lbl_802F5EC8  //@sda21(r2)
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
/* 800AC78C 000A86AC  80 6D 99 80 */	lwz r3, mathutilData  //@sda21(r13)
/* 800AC790 000A86B0  38 80 00 00 */	li r4, 0
/* 800AC794 000A86B4  48 03 7D ED */	bl GXLoadPosMtxImm
/* 800AC798 000A86B8  C0 22 B6 78 */	lfs f1, 0.0f  //lbl_802F5E78@sda21(r2)
/* 800AC79C 000A86BC  38 61 00 0C */	addi r3, r1, 0xc
/* 800AC7A0 000A86C0  C0 42 B6 7C */	lfs f2, 480.0f  //lbl_802F5E7C@sda21(r2)
/* 800AC7A4 000A86C4  FC 60 08 90 */	fmr f3, f1
/* 800AC7A8 000A86C8  C0 82 B6 80 */	lfs f4, 640.0f  //lbl_802F5E80@sda21(r2)
/* 800AC7AC 000A86CC  FC A0 08 90 */	fmr f5, f1
/* 800AC7B0 000A86D0  C0 C2 B6 84 */	lfs f6, 20000.0f  //lbl_802F5E84@sda21(r2)
/* 800AC7B4 000A86D4  48 01 E0 0D */	bl C_MTXOrtho
/* 800AC7B8 000A86D8  38 61 00 0C */	addi r3, r1, 0xc
/* 800AC7BC 000A86DC  38 80 00 01 */	li r4, 1
/* 800AC7C0 000A86E0  48 03 7B E9 */	bl GXSetProjection
/* 800AC7C4 000A86E4  80 6D 9B 24 */	lwz r3, lbl_802F1D04  //@sda21(r13)
/* 800AC7C8 000A86E8  38 00 00 04 */	li r0, 4
/* 800AC7CC 000A86EC  90 6D A0 1C */	stw r3, lbl_802F21FC  //@sda21(r13)
/* 800AC7D0 000A86F0  90 0D 9B 24 */	stw r0, lbl_802F1D04  //@sda21(r13)
/* 800AC7D4 000A86F4  4B FC 52 B9 */	bl reset_text_draw_settings
/* 800AC7D8 000A86F8  38 60 00 B3 */	li r3, 0xb3
/* 800AC7DC 000A86FC  4B FC 52 F9 */	bl set_text_font
/* 800AC7E0 000A8700  C0 22 B6 88 */	lfs f1, 0.008f //lbl_802F5E88@sda21(r2)
/* 800AC7E4 000A8704  4B FC 53 39 */	bl func_80071B1C
/* 800AC7E8 000A8708  3C 60 00 20 */	lis r3, 0x20
/* 800AC7EC 000A870C  4B FC 53 65 */	bl func_80071B50
/* 800AC7F0 000A8710  C0 22 B6 8C */	lfs f1, 0.8f  //lbl_802F5E8C@sda21(r2)
/* 800AC7F4 000A8714  C0 42 B6 90 */	lfs f2, 1.0f  //lbl_802F5E90@sda21(r2)
/* 800AC7F8 000A8718  4B FC 53 35 */	bl set_text_scale
/* 800AC7FC 000A871C  3C 60 80 1D */	lis r3, s_errMessages@ha
/* 800AC800 000A8720  CB E2 B6 A0 */	lfd f31, 0.5  //lbl_802F5EA0@sda21(r2)
/* 800AC804 000A8724  3B C0 00 00 */	li r30, 0
/* 800AC808 000A8728  CB C2 B6 98 */	lfd f30, 320.0  //lbl_802F5E98@sda21(r2)
/* 800AC80C 000A872C  57 84 18 38 */	slwi r4, r28, 3
/* 800AC810 000A8730  CB A2 B6 A8 */	lfd f29, 240.0  //lbl_802F5EA8@sda21(r2)
/* 800AC814 000A8734  38 03 68 94 */	addi r0, r3, s_errMessages@l
/* 800AC818 000A8738  CB 82 B6 B0 */	lfd f28, 12.0  //lbl_802F5EB0@sda21(r2)
/* 800AC81C 000A873C  CB 62 B6 C0 */	lfd f27, 4503601774854144.0  //lbl_802F5EC0@sda21(r2)
/* 800AC820 000A8740  7F A0 22 14 */	add r29, r0, r4
/* 800AC824 000A8744  CB 42 B6 B8 */	lfd f26, 24.0  //lbl_802F5EB8@sda21(r2)
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
/* 800AC8B4 000A87D4  80 0D A0 1C */	lwz r0, lbl_802F21FC  //@sda21(r13)
/* 800AC8B8 000A87D8  90 0D 9B 24 */	stw r0, lbl_802F1D04  //@sda21(r13)
/* 800AC8BC 000A87DC  48 00 01 30 */	b lbl_800AC9EC
lbl_800AC8C0:
/* 800AC8C0 000A87E0  80 0D A0 18 */	lwz r0, lbl_802F21F8  //@sda21(r13)
/* 800AC8C4 000A87E4  2C 00 00 00 */	cmpwi r0, 0
/* 800AC8C8 000A87E8  40 82 00 30 */	bne lbl_800AC8F8
/* 800AC8CC 000A87EC  80 6D 99 4C */	lwz r3, mainHeap  //@sda21(r13)
/* 800AC8D0 000A87F0  48 01 5F 75 */	bl OSSetCurrentHeap
/* 800AC8D4 000A87F4  7C 7D 1B 78 */	mr r29, r3
/* 800AC8D8 000A87F8  4B FF 88 FD */	bl DEMOInitROMFont
/* 800AC8DC 000A87FC  38 60 00 16 */	li r3, 0x16
/* 800AC8E0 000A8800  38 80 FF FF */	li r4, -1
/* 800AC8E4 000A8804  4B FF 89 B9 */	bl DEMOSetROMFontSize
/* 800AC8E8 000A8808  7F A3 EB 78 */	mr r3, r29
/* 800AC8EC 000A880C  48 01 5F 59 */	bl OSSetCurrentHeap
/* 800AC8F0 000A8810  38 00 00 01 */	li r0, 1
/* 800AC8F4 000A8814  90 0D A0 18 */	stw r0, lbl_802F21F8  //@sda21(r13)
lbl_800AC8F8:
/* 800AC8F8 000A8818  38 60 00 02 */	li r3, 2
/* 800AC8FC 000A881C  38 80 02 80 */	li r4, 0x280
/* 800AC900 000A8820  38 A0 01 C0 */	li r5, 0x1c0
/* 800AC904 000A8824  4B FF 86 8D */	bl DEMOInitCaption
/* 800AC908 000A8828  3C 60 80 1D */	lis r3, s_errMessagesDemoFont@ha
/* 800AC90C 000A882C  CB 42 B6 C0 */	lfd f26, 4503601774854144.0  //lbl_802F5EC0@sda21(r2)
/* 800AC910 000A8830  3B A0 00 00 */	li r29, 0
/* 800AC914 000A8834  CB 62 B6 A0 */	lfd f27, 0.5  //lbl_802F5EA0@sda21(r2)
/* 800AC918 000A8838  57 84 18 38 */	slwi r4, r28, 3
/* 800AC91C 000A883C  CB 82 B6 98 */	lfd f28, 320.0  //lbl_802F5E98@sda21(r2)
/* 800AC920 000A8840  38 03 6A 50 */	addi r0, r3, s_errMessagesDemoFont@l
/* 800AC924 000A8844  CB A2 B6 A8 */	lfd f29, 240.0  //lbl_802F5EA8@sda21(r2)
/* 800AC928 000A8848  CB C2 B6 B0 */	lfd f30, 12.0  //lbl_802F5EB0@sda21(r2)
/* 800AC92C 000A884C  7F C0 22 14 */	add r30, r0, r4
/* 800AC930 000A8850  CB E2 B6 B8 */	lfd f31, 24.0  //lbl_802F5EB8@sda21(r2)
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
/* 800AC9F4 000A8914  80 6D 99 58 */	lwz r3, globalFrameCounter  //@sda21(r13)
/* 800AC9F8 000A8918  38 03 00 01 */	addi r0, r3, 1
/* 800AC9FC 000A891C  90 0D 99 58 */	stw r0, globalFrameCounter  //@sda21(r13)
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
