/* 8006CA1C 0006893C  7C 08 02 A6 */	mflr r0
/* 8006CA20 00068940  90 01 00 04 */	stw r0, 4(r1)
/* 8006CA24 00068944  38 00 00 00 */	li r0, 0
/* 8006CA28 00068948  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 8006CA2C 0006894C  93 E1 00 44 */	stw r31, 0x44(r1)
/* 8006CA30 00068950  93 C1 00 40 */	stw r30, 0x40(r1)
/* 8006CA34 00068954  3B C3 00 00 */	addi r30, r3, 0
/* 8006CA38 00068958  B0 03 00 0C */	sth r0, 0xc(r3)
/* 8006CA3C 0006895C  38 00 FF FF */	li r0, -1
/* 8006CA40 00068960  38 7E 00 58 */	addi r3, r30, 0x58
/* 8006CA44 00068964  80 9E 00 08 */	lwz r4, 8(r30)
/* 8006CA48 00068968  60 84 00 02 */	ori r4, r4, 2
/* 8006CA4C 0006896C  90 9E 00 08 */	stw r4, 8(r30)
/* 8006CA50 00068970  80 8D 99 24 */	lwz r4, g_commonNlObj  // (r13)
/* 8006CA54 00068974  80 84 00 3C */	lwz r4, 0x3c(r4)
/* 8006CA58 00068978  90 9E 00 54 */	stw r4, 0x54(r30)
/* 8006CA5C 0006897C  C0 02 A0 F0 */	lfs f0, 1.3125f  // lbl_802F48F0-_SDA2_BASE_(r2)
/* 8006CA60 00068980  D0 1E 00 34 */	stfs f0, 0x34(r30)
/* 8006CA64 00068984  80 DE 00 54 */	lwz r6, 0x54(r30)
/* 8006CA68 00068988  80 A6 00 08 */	lwz r5, 8(r6)
/* 8006CA6C 0006898C  80 86 00 0C */	lwz r4, 0xc(r6)
/* 8006CA70 00068990  90 BE 00 10 */	stw r5, 0x10(r30)
/* 8006CA74 00068994  90 9E 00 14 */	stw r4, 0x14(r30)
/* 8006CA78 00068998  80 86 00 10 */	lwz r4, 0x10(r6)
/* 8006CA7C 0006899C  90 9E 00 18 */	stw r4, 0x18(r30)
/* 8006CA80 000689A0  83 FE 00 A4 */	lwz r31, 0xa4(r30)
/* 8006CA84 000689A4  93 DF 00 14 */	stw r30, 0x14(r31)
/* 8006CA88 000689A8  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8006CA8C 000689AC  4B F9 AB 31 */	bl mathutil_mtxA_from_translate
/* 8006CA90 000689B0  A8 7E 00 74 */	lha r3, 0x74(r30)
/* 8006CA94 000689B4  4B F9 B5 F5 */	bl mathutil_mtxA_rotate_z
/* 8006CA98 000689B8  A8 7E 00 72 */	lha r3, 0x72(r30)
/* 8006CA9C 000689BC  4B F9 B5 61 */	bl mathutil_mtxA_rotate_y
/* 8006CAA0 000689C0  A8 7E 00 70 */	lha r3, 0x70(r30)
/* 8006CAA4 000689C4  4B F9 B4 E5 */	bl mathutil_mtxA_rotate_x
/* 8006CAA8 000689C8  38 7E 00 10 */	addi r3, r30, 0x10
/* 8006CAAC 000689CC  38 81 00 28 */	addi r4, r1, 0x28
/* 8006CAB0 000689D0  4B F9 B3 7D */	bl mathutil_mtxA_tf_point
/* 8006CAB4 000689D4  4B F9 AD 3D */	bl mathutil_mtxA_push
/* 8006CAB8 000689D8  38 61 00 28 */	addi r3, r1, 0x28
/* 8006CABC 000689DC  38 81 00 0C */	addi r4, r1, 0xc
/* 8006CAC0 000689E0  38 A0 00 00 */	li r5, 0
/* 8006CAC4 000689E4  4B FD 30 85 */	bl raycast_stage_down
/* 8006CAC8 000689E8  4B F9 AD 6D */	bl mathutil_mtxA_pop
/* 8006CACC 000689EC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8006CAD0 000689F0  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8006CAD4 000689F4  41 82 00 28 */	beq lbl_8006CAFC
/* 8006CAD8 000689F8  38 61 00 10 */	addi r3, r1, 0x10
/* 8006CADC 000689FC  38 81 00 28 */	addi r4, r1, 0x28
/* 8006CAE0 00068A00  4B F9 B3 ED */	bl mathutil_mtxA_rigid_inv_tf_point
/* 8006CAE4 00068A04  C8 22 A0 F8 */	lfd f1, 0.002  // lbl_802F48F8-_SDA2_BASE_(r2)
/* 8006CAE8 00068A08  C0 01 00 2C */	lfs f0, 0x2c(r1)
/* 8006CAEC 00068A0C  FC 01 00 2A */	fadd f0, f1, f0
/* 8006CAF0 00068A10  FC 00 00 18 */	frsp f0, f0
/* 8006CAF4 00068A14  D0 1F 00 04 */	stfs f0, 4(r31)
/* 8006CAF8 00068A18  48 00 00 0C */	b lbl_8006CB04
lbl_8006CAFC:
/* 8006CAFC 00068A1C  C0 02 A1 00 */	lfs f0, 0.0020000000949949026f  // lbl_802F4900-_SDA2_BASE_(r2)
/* 8006CB00 00068A20  D0 1F 00 04 */	stfs f0, 4(r31)
lbl_8006CB04:
/* 8006CB04 00068A24  38 00 00 02 */	li r0, 2
/* 8006CB08 00068A28  C1 7E 00 14 */	lfs f11, 0x14(r30)
/* 8006CB0C 00068A2C  7C 09 03 A6 */	mtctr r0
/* 8006CB10 00068A30  C9 22 A1 20 */	lfd f9, 4503601774854144.0  // lbl_802F4920-_SDA2_BASE_(r2)
/* 8006CB14 00068A34  C0 C2 A1 04 */	lfs f6, 7.0f  // lbl_802F4904-_SDA2_BASE_(r2)
/* 8006CB18 00068A38  38 FF 00 18 */	addi r7, r31, 0x18
/* 8006CB1C 00068A3C  C8 A2 A1 08 */	lfd f5, 1.75  // lbl_802F4908-_SDA2_BASE_(r2)
/* 8006CB20 00068A40  C8 82 A1 10 */	lfd f4, 0.875  // lbl_802F4910-_SDA2_BASE_(r2)
/* 8006CB24 00068A44  38 C0 00 08 */	li r6, 8
/* 8006CB28 00068A48  C0 42 A0 E8 */	lfs f2, 0.0f  // lbl_802F48E8-_SDA2_BASE_(r2)
/* 8006CB2C 00068A4C  3C 60 43 30 */	lis r3, 0x4330
/* 8006CB30 00068A50  C0 22 A1 18 */	lfs f1, 1.0f   //lbl_802F4918-_SDA2_BASE_(r2)
/* 8006CB34 00068A54  C0 02 A1 1C */	lfs f0, 0.22499999403953552f  // lbl_802F491C-_SDA2_BASE_(r2)
lbl_8006CB38:
/* 8006CB38 00068A58  38 A6 FF FF */	addi r5, r6, -1
/* 8006CB3C 00068A5C  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8006CB40 00068A60  90 81 00 3C */	stw r4, 0x3c(r1)
/* 8006CB44 00068A64  38 A6 FF FE */	addi r5, r6, -2
/* 8006CB48 00068A68  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8006CB4C 00068A6C  90 61 00 38 */	stw r3, 0x38(r1)
/* 8006CB50 00068A70  38 A6 FF FD */	addi r5, r6, -3
/* 8006CB54 00068A74  38 00 00 06 */	li r0, 6
/* 8006CB58 00068A78  C9 01 00 38 */	lfd f8, 0x38(r1)
/* 8006CB5C 00068A7C  EC E8 48 28 */	fsubs f7, f8, f9
/* 8006CB60 00068A80  90 81 00 3C */	stw r4, 0x3c(r1)
/* 8006CB64 00068A84  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8006CB68 00068A88  90 61 00 38 */	stw r3, 0x38(r1)
/* 8006CB6C 00068A8C  38 A6 FF FC */	addi r5, r6, -4
/* 8006CB70 00068A90  ED 47 30 24 */	fdivs f10, f7, f6
/* 8006CB74 00068A94  C9 01 00 38 */	lfd f8, 0x38(r1)
/* 8006CB78 00068A98  38 C6 FF FC */	addi r6, r6, -4
/* 8006CB7C 00068A9C  90 81 00 3C */	stw r4, 0x3c(r1)
/* 8006CB80 00068AA0  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8006CB84 00068AA4  FC 65 02 B2 */	fmul f3, f5, f10
/* 8006CB88 00068AA8  90 61 00 38 */	stw r3, 0x38(r1)
/* 8006CB8C 00068AAC  EC E8 48 28 */	fsubs f7, f8, f9
/* 8006CB90 00068AB0  C9 01 00 38 */	lfd f8, 0x38(r1)
/* 8006CB94 00068AB4  FC 63 20 28 */	fsub f3, f3, f4
/* 8006CB98 00068AB8  90 81 00 3C */	stw r4, 0x3c(r1)
/* 8006CB9C 00068ABC  FC 60 18 18 */	frsp f3, f3
/* 8006CBA0 00068AC0  90 61 00 38 */	stw r3, 0x38(r1)
/* 8006CBA4 00068AC4  D0 67 00 00 */	stfs f3, 0(r7)
/* 8006CBA8 00068AC8  D1 67 00 04 */	stfs f11, 4(r7)
/* 8006CBAC 00068ACC  D0 47 00 08 */	stfs f2, 8(r7)
/* 8006CBB0 00068AD0  D1 47 00 18 */	stfs f10, 0x18(r7)
/* 8006CBB4 00068AD4  ED 47 30 24 */	fdivs f10, f7, f6
/* 8006CBB8 00068AD8  D0 47 00 0C */	stfs f2, 0xc(r7)
/* 8006CBBC 00068ADC  D0 47 00 10 */	stfs f2, 0x10(r7)
/* 8006CBC0 00068AE0  D0 27 00 14 */	stfs f1, 0x14(r7)
/* 8006CBC4 00068AE4  D0 47 00 1C */	stfs f2, 0x1c(r7)
/* 8006CBC8 00068AE8  FC 65 02 B2 */	fmul f3, f5, f10
/* 8006CBCC 00068AEC  D0 47 00 20 */	stfs f2, 0x20(r7)
/* 8006CBD0 00068AF0  D0 47 00 24 */	stfs f2, 0x24(r7)
/* 8006CBD4 00068AF4  EC E8 48 28 */	fsubs f7, f8, f9
/* 8006CBD8 00068AF8  C9 01 00 38 */	lfd f8, 0x38(r1)
/* 8006CBDC 00068AFC  FC 63 20 28 */	fsub f3, f3, f4
/* 8006CBE0 00068B00  90 07 00 28 */	stw r0, 0x28(r7)
/* 8006CBE4 00068B04  D0 07 00 2C */	stfs f0, 0x2c(r7)
/* 8006CBE8 00068B08  FC 60 18 18 */	frsp f3, f3
/* 8006CBEC 00068B0C  D0 67 00 30 */	stfs f3, 0x30(r7)
/* 8006CBF0 00068B10  D1 67 00 34 */	stfs f11, 0x34(r7)
/* 8006CBF4 00068B14  D0 47 00 38 */	stfs f2, 0x38(r7)
/* 8006CBF8 00068B18  D1 47 00 48 */	stfs f10, 0x48(r7)
/* 8006CBFC 00068B1C  ED 47 30 24 */	fdivs f10, f7, f6
/* 8006CC00 00068B20  D0 47 00 3C */	stfs f2, 0x3c(r7)
/* 8006CC04 00068B24  D0 47 00 40 */	stfs f2, 0x40(r7)
/* 8006CC08 00068B28  D0 27 00 44 */	stfs f1, 0x44(r7)
/* 8006CC0C 00068B2C  D0 47 00 4C */	stfs f2, 0x4c(r7)
/* 8006CC10 00068B30  FC 65 02 B2 */	fmul f3, f5, f10
/* 8006CC14 00068B34  D0 47 00 50 */	stfs f2, 0x50(r7)
/* 8006CC18 00068B38  D0 47 00 54 */	stfs f2, 0x54(r7)
/* 8006CC1C 00068B3C  EC E8 48 28 */	fsubs f7, f8, f9
/* 8006CC20 00068B40  FC 63 20 28 */	fsub f3, f3, f4
/* 8006CC24 00068B44  90 07 00 58 */	stw r0, 0x58(r7)
/* 8006CC28 00068B48  FC 60 18 18 */	frsp f3, f3
/* 8006CC2C 00068B4C  D0 07 00 5C */	stfs f0, 0x5c(r7)
/* 8006CC30 00068B50  D0 67 00 60 */	stfs f3, 0x60(r7)
/* 8006CC34 00068B54  D1 67 00 64 */	stfs f11, 0x64(r7)
/* 8006CC38 00068B58  D0 47 00 68 */	stfs f2, 0x68(r7)
/* 8006CC3C 00068B5C  D1 47 00 78 */	stfs f10, 0x78(r7)
/* 8006CC40 00068B60  ED 47 30 24 */	fdivs f10, f7, f6
/* 8006CC44 00068B64  D0 47 00 6C */	stfs f2, 0x6c(r7)
/* 8006CC48 00068B68  D0 47 00 70 */	stfs f2, 0x70(r7)
/* 8006CC4C 00068B6C  D0 27 00 74 */	stfs f1, 0x74(r7)
/* 8006CC50 00068B70  D0 47 00 7C */	stfs f2, 0x7c(r7)
/* 8006CC54 00068B74  FC 65 02 B2 */	fmul f3, f5, f10
/* 8006CC58 00068B78  D0 47 00 80 */	stfs f2, 0x80(r7)
/* 8006CC5C 00068B7C  D0 47 00 84 */	stfs f2, 0x84(r7)
/* 8006CC60 00068B80  FC 63 20 28 */	fsub f3, f3, f4
/* 8006CC64 00068B84  90 07 00 88 */	stw r0, 0x88(r7)
/* 8006CC68 00068B88  D0 07 00 8C */	stfs f0, 0x8c(r7)
/* 8006CC6C 00068B8C  FC 60 18 18 */	frsp f3, f3
/* 8006CC70 00068B90  D0 67 00 90 */	stfs f3, 0x90(r7)
/* 8006CC74 00068B94  D1 67 00 94 */	stfs f11, 0x94(r7)
/* 8006CC78 00068B98  D0 47 00 98 */	stfs f2, 0x98(r7)
/* 8006CC7C 00068B9C  D1 47 00 A8 */	stfs f10, 0xa8(r7)
/* 8006CC80 00068BA0  D0 47 00 9C */	stfs f2, 0x9c(r7)
/* 8006CC84 00068BA4  D0 47 00 A0 */	stfs f2, 0xa0(r7)
/* 8006CC88 00068BA8  D0 27 00 A4 */	stfs f1, 0xa4(r7)
/* 8006CC8C 00068BAC  D0 47 00 AC */	stfs f2, 0xac(r7)
/* 8006CC90 00068BB0  D0 47 00 B0 */	stfs f2, 0xb0(r7)
/* 8006CC94 00068BB4  D0 47 00 B4 */	stfs f2, 0xb4(r7)
/* 8006CC98 00068BB8  90 07 00 B8 */	stw r0, 0xb8(r7)
/* 8006CC9C 00068BBC  D0 07 00 BC */	stfs f0, 0xbc(r7)
/* 8006CCA0 00068BC0  38 E7 00 C0 */	addi r7, r7, 0xc0
/* 8006CCA4 00068BC4  42 00 FE 94 */	bdnz lbl_8006CB38
/* 8006CCA8 00068BC8  80 1F 00 40 */	lwz r0, 0x40(r31)
/* 8006CCAC 00068BCC  3C 60 80 1C */	lis r3, smallLCDModelIDs@ha
/* 8006CCB0 00068BD0  38 A3 E4 20 */	addi r5, r3, smallLCDModelIDs@l
/* 8006CCB4 00068BD4  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8006CCB8 00068BD8  90 1F 00 40 */	stw r0, 0x40(r31)
/* 8006CCBC 00068BDC  3C 60 80 29 */	lis r3, smallLCDModels@ha
/* 8006CCC0 00068BE0  38 83 CE D8 */	addi r4, r3, smallLCDModels@l
/* 8006CCC4 00068BE4  80 1F 00 40 */	lwz r0, 0x40(r31)
/* 8006CCC8 00068BE8  60 00 00 01 */	ori r0, r0, 1
/* 8006CCCC 00068BEC  90 1F 00 40 */	stw r0, 0x40(r31)
/* 8006CCD0 00068BF0  80 1F 01 90 */	lwz r0, 0x190(r31)
/* 8006CCD4 00068BF4  54 00 07 B8 */	rlwinm r0, r0, 0, 0x1e, 0x1c
/* 8006CCD8 00068BF8  90 1F 01 90 */	stw r0, 0x190(r31)
/* 8006CCDC 00068BFC  80 1F 01 90 */	lwz r0, 0x190(r31)
/* 8006CCE0 00068C00  60 00 00 01 */	ori r0, r0, 1
/* 8006CCE4 00068C04  90 1F 01 90 */	stw r0, 0x190(r31)
/* 8006CCE8 00068C08  D1 7F 00 08 */	stfs f11, 8(r31)
/* 8006CCEC 00068C0C  D1 7F 00 0C */	stfs f11, 0xc(r31)
/* 8006CCF0 00068C10  A8 05 00 00 */	lha r0, 0(r5)
/* 8006CCF4 00068C14  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CCF8 00068C18  54 00 10 3A */	slwi r0, r0, 2
/* 8006CCFC 00068C1C  7C 63 02 14 */	add r3, r3, r0
/* 8006CD00 00068C20  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CD04 00068C24  90 04 00 00 */	stw r0, 0(r4)
/* 8006CD08 00068C28  A8 05 00 02 */	lha r0, 2(r5)
/* 8006CD0C 00068C2C  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CD10 00068C30  54 00 10 3A */	slwi r0, r0, 2
/* 8006CD14 00068C34  7C 63 02 14 */	add r3, r3, r0
/* 8006CD18 00068C38  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CD1C 00068C3C  90 04 00 04 */	stw r0, 4(r4)
/* 8006CD20 00068C40  A8 05 00 04 */	lha r0, 4(r5)
/* 8006CD24 00068C44  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CD28 00068C48  54 00 10 3A */	slwi r0, r0, 2
/* 8006CD2C 00068C4C  7C 63 02 14 */	add r3, r3, r0
/* 8006CD30 00068C50  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CD34 00068C54  90 04 00 08 */	stw r0, 8(r4)
/* 8006CD38 00068C58  A8 05 00 06 */	lha r0, 6(r5)
/* 8006CD3C 00068C5C  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CD40 00068C60  54 00 10 3A */	slwi r0, r0, 2
/* 8006CD44 00068C64  7C 63 02 14 */	add r3, r3, r0
/* 8006CD48 00068C68  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CD4C 00068C6C  90 04 00 0C */	stw r0, 0xc(r4)
/* 8006CD50 00068C70  A8 05 00 08 */	lha r0, 8(r5)
/* 8006CD54 00068C74  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CD58 00068C78  54 00 10 3A */	slwi r0, r0, 2
/* 8006CD5C 00068C7C  7C 63 02 14 */	add r3, r3, r0
/* 8006CD60 00068C80  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CD64 00068C84  90 04 00 10 */	stw r0, 0x10(r4)
/* 8006CD68 00068C88  A8 05 00 0A */	lha r0, 0xa(r5)
/* 8006CD6C 00068C8C  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CD70 00068C90  54 00 10 3A */	slwi r0, r0, 2
/* 8006CD74 00068C94  7C 63 02 14 */	add r3, r3, r0
/* 8006CD78 00068C98  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CD7C 00068C9C  90 04 00 14 */	stw r0, 0x14(r4)
/* 8006CD80 00068CA0  A8 05 00 0C */	lha r0, 0xc(r5)
/* 8006CD84 00068CA4  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CD88 00068CA8  54 00 10 3A */	slwi r0, r0, 2
/* 8006CD8C 00068CAC  7C 63 02 14 */	add r3, r3, r0
/* 8006CD90 00068CB0  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CD94 00068CB4  90 04 00 18 */	stw r0, 0x18(r4)
/* 8006CD98 00068CB8  A8 05 00 0E */	lha r0, 0xe(r5)
/* 8006CD9C 00068CBC  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CDA0 00068CC0  54 00 10 3A */	slwi r0, r0, 2
/* 8006CDA4 00068CC4  7C 63 02 14 */	add r3, r3, r0
/* 8006CDA8 00068CC8  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CDAC 00068CCC  90 04 00 1C */	stw r0, 0x1c(r4)
/* 8006CDB0 00068CD0  A8 05 00 10 */	lha r0, 0x10(r5)
/* 8006CDB4 00068CD4  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CDB8 00068CD8  54 00 10 3A */	slwi r0, r0, 2
/* 8006CDBC 00068CDC  7C 63 02 14 */	add r3, r3, r0
/* 8006CDC0 00068CE0  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CDC4 00068CE4  90 04 00 20 */	stw r0, 0x20(r4)
/* 8006CDC8 00068CE8  A8 05 00 12 */	lha r0, 0x12(r5)
/* 8006CDCC 00068CEC  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CDD0 00068CF0  54 00 10 3A */	slwi r0, r0, 2
/* 8006CDD4 00068CF4  7C 63 02 14 */	add r3, r3, r0
/* 8006CDD8 00068CF8  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CDDC 00068CFC  90 04 00 24 */	stw r0, 0x24(r4)
/* 8006CDE0 00068D00  3C 80 80 1C */	lis r4, largeLCDModelIDs@ha
/* 8006CDE4 00068D04  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CDE8 00068D08  38 A4 E4 34 */	addi r5, r4, largeLCDModelIDs@l
/* 8006CDEC 00068D0C  A8 05 00 00 */	lha r0, 0(r5)
/* 8006CDF0 00068D10  3C 80 80 29 */	lis r4, largeLCDModels@ha
/* 8006CDF4 00068D14  54 00 10 3A */	slwi r0, r0, 2
/* 8006CDF8 00068D18  7C 63 02 14 */	add r3, r3, r0
/* 8006CDFC 00068D1C  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CE00 00068D20  94 04 CF 00 */	stwu r0, largeLCDModels@l(r4)
/* 8006CE04 00068D24  AC 05 00 02 */	lhau r0, 2(r5)
/* 8006CE08 00068D28  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CE0C 00068D2C  54 00 10 3A */	slwi r0, r0, 2
/* 8006CE10 00068D30  7C 63 02 14 */	add r3, r3, r0
/* 8006CE14 00068D34  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CE18 00068D38  90 04 00 04 */	stw r0, 4(r4)
/* 8006CE1C 00068D3C  A8 05 00 02 */	lha r0, 2(r5)
/* 8006CE20 00068D40  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CE24 00068D44  54 00 10 3A */	slwi r0, r0, 2
/* 8006CE28 00068D48  7C 63 02 14 */	add r3, r3, r0
/* 8006CE2C 00068D4C  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CE30 00068D50  90 04 00 08 */	stw r0, 8(r4)
/* 8006CE34 00068D54  A8 05 00 04 */	lha r0, 4(r5)
/* 8006CE38 00068D58  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CE3C 00068D5C  54 00 10 3A */	slwi r0, r0, 2
/* 8006CE40 00068D60  7C 63 02 14 */	add r3, r3, r0
/* 8006CE44 00068D64  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CE48 00068D68  90 04 00 0C */	stw r0, 0xc(r4)
/* 8006CE4C 00068D6C  A8 05 00 06 */	lha r0, 6(r5)
/* 8006CE50 00068D70  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CE54 00068D74  54 00 10 3A */	slwi r0, r0, 2
/* 8006CE58 00068D78  7C 63 02 14 */	add r3, r3, r0
/* 8006CE5C 00068D7C  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CE60 00068D80  90 04 00 10 */	stw r0, 0x10(r4)
/* 8006CE64 00068D84  A8 05 00 08 */	lha r0, 8(r5)
/* 8006CE68 00068D88  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CE6C 00068D8C  54 00 10 3A */	slwi r0, r0, 2
/* 8006CE70 00068D90  7C 63 02 14 */	add r3, r3, r0
/* 8006CE74 00068D94  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CE78 00068D98  90 04 00 14 */	stw r0, 0x14(r4)
/* 8006CE7C 00068D9C  A8 05 00 0A */	lha r0, 0xa(r5)
/* 8006CE80 00068DA0  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CE84 00068DA4  54 00 10 3A */	slwi r0, r0, 2
/* 8006CE88 00068DA8  7C 63 02 14 */	add r3, r3, r0
/* 8006CE8C 00068DAC  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CE90 00068DB0  90 04 00 18 */	stw r0, 0x18(r4)
/* 8006CE94 00068DB4  A8 05 00 0C */	lha r0, 0xc(r5)
/* 8006CE98 00068DB8  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CE9C 00068DBC  54 00 10 3A */	slwi r0, r0, 2
/* 8006CEA0 00068DC0  7C 63 02 14 */	add r3, r3, r0
/* 8006CEA4 00068DC4  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CEA8 00068DC8  90 04 00 1C */	stw r0, 0x1c(r4)
/* 8006CEAC 00068DCC  A8 05 00 0E */	lha r0, 0xe(r5)
/* 8006CEB0 00068DD0  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CEB4 00068DD4  54 00 10 3A */	slwi r0, r0, 2
/* 8006CEB8 00068DD8  7C 63 02 14 */	add r3, r3, r0
/* 8006CEBC 00068DDC  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CEC0 00068DE0  90 04 00 20 */	stw r0, 0x20(r4)
/* 8006CEC4 00068DE4  A8 05 00 10 */	lha r0, 0x10(r5)
/* 8006CEC8 00068DE8  80 6D 99 24 */	lwz r3, g_commonNlObj  // (r13)
/* 8006CECC 00068DEC  54 00 10 3A */	slwi r0, r0, 2
/* 8006CED0 00068DF0  7C 63 02 14 */	add r3, r3, r0
/* 8006CED4 00068DF4  80 03 00 04 */	lwz r0, 4(r3)
/* 8006CED8 00068DF8  90 04 00 24 */	stw r0, 0x24(r4)
/* 8006CEDC 00068DFC  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 8006CEE0 00068E00  83 E1 00 44 */	lwz r31, 0x44(r1)
/* 8006CEE4 00068E04  83 C1 00 40 */	lwz r30, 0x40(r1)
/* 8006CEE8 00068E08  7C 08 03 A6 */	mtlr r0
/* 8006CEEC 00068E0C  38 21 00 48 */	addi r1, r1, 0x48
/* 8006CEF0 00068E10  4E 80 00 20 */	blr
