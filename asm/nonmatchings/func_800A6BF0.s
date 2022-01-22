/* 800A6BF0 000A2B10  7C 08 02 A6 */	mflr r0
/* 800A6BF4 000A2B14  3C 60 80 20 */	lis r3, movableStageParts@ha
/* 800A6BF8 000A2B18  90 01 00 04 */	stw r0, 4(r1)
/* 800A6BFC 000A2B1C  38 03 6E 48 */	addi r0, r3, movableStageParts@l
/* 800A6C00 000A2B20  3C 60 80 21 */	lis r3, lbl_8020ADC8@ha
/* 800A6C04 000A2B24  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 800A6C08 000A2B28  DB E1 00 88 */	stfd f31, 0x88(r1)
/* 800A6C0C 000A2B2C  DB C1 00 80 */	stfd f30, 0x80(r1)
/* 800A6C10 000A2B30  DB A1 00 78 */	stfd f29, 0x78(r1)
/* 800A6C14 000A2B34  DB 81 00 70 */	stfd f28, 0x70(r1)
/* 800A6C18 000A2B38  DB 61 00 68 */	stfd f27, 0x68(r1)
/* 800A6C1C 000A2B3C  BE E1 00 44 */	stmw r23, 0x44(r1)
/* 800A6C20 000A2B40  3B 40 00 00 */	li r26, 0
/* 800A6C24 000A2B44  1C 9A 00 84 */	mulli r4, r26, 0x84
/* 800A6C28 000A2B48  7F C0 22 14 */	add r30, r0, r4
/* 800A6C2C 000A2B4C  3A E3 AD C8 */	addi r23, r3, lbl_8020ADC8@l
/* 800A6C30 000A2B50  3B E0 00 00 */	li r31, 0  
/* 800A6C34 000A2B54  48 00 01 80 */	b lbl_800A6DB4
lbl_800A6C38:
/* 800A6C38 000A2B58  80 6D 9D 50 */	lwz r3, decodedStageLzPtr  // @sda21(r13)
/* 800A6C3C 000A2B5C  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800A6C40 000A2B60  7C 60 FA 14 */	add r3, r0, r31
/* 800A6C44 000A2B64  83 63 00 40 */	lwz r27, 0x40(r3)
/* 800A6C48 000A2B68  83 03 00 3C */	lwz r24, 0x3c(r3)
/* 800A6C4C 000A2B6C  4B F6 0D 61 */	bl mathutil_mtxA_from_mtxB
/* 800A6C50 000A2B70  2C 1A 00 00 */	cmpwi r26, 0
/* 800A6C54 000A2B74  40 81 00 0C */	ble lbl_800A6C60
/* 800A6C58 000A2B78  38 7E 00 24 */	addi r3, r30, 0x24
/* 800A6C5C 000A2B7C  4B F6 0F E5 */	bl mathutil_mtxA_mult_right
lbl_800A6C60:
/* 800A6C60 000A2B80  38 61 00 08 */	addi r3, r1, 8
/* 800A6C64 000A2B84  4B F6 0C 15 */	bl mathutil_mtxA_to_mtx
/* 800A6C68 000A2B88  3B 20 00 00 */	li r25, 0
/* 800A6C6C 000A2B8C  48 00 01 34 */	b lbl_800A6DA0
lbl_800A6C70:
/* 800A6C70 000A2B90  38 61 00 08 */	addi r3, r1, 8
/* 800A6C74 000A2B94  4B F6 0C 3D */	bl mathutil_mtxA_from_mtx
/* 800A6C78 000A2B98  7F 63 DB 78 */	mr r3, r27
/* 800A6C7C 000A2B9C  4B F6 10 A5 */	bl mathutil_mtxA_translate
/* 800A6C80 000A2BA0  A8 7B 00 10 */	lha r3, 0x10(r27)
/* 800A6C84 000A2BA4  4B F6 14 05 */	bl mathutil_mtxA_rotate_z
/* 800A6C88 000A2BA8  A8 7B 00 0E */	lha r3, 0xe(r27)
/* 800A6C8C 000A2BAC  4B F6 13 71 */	bl mathutil_mtxA_rotate_y
/* 800A6C90 000A2BB0  A8 7B 00 0C */	lha r3, 0xc(r27)
/* 800A6C94 000A2BB4  4B F6 12 F5 */	bl mathutil_mtxA_rotate_x
/* 800A6C98 000A2BB8  88 1B 00 12 */	lbz r0, 0x12(r27)
/* 800A6C9C 000A2BBC  7C 00 07 74 */	extsb r0, r0
/* 800A6CA0 000A2BC0  2C 00 00 52 */	cmpwi r0, 0x52
/* 800A6CA4 000A2BC4  41 82 00 20 */	beq lbl_800A6CC4
/* 800A6CA8 000A2BC8  40 80 00 0C */	bge lbl_800A6CB4
/* 800A6CAC 000A2BCC  2C 00 00 47 */	cmpwi r0, 0x47
/* 800A6CB0 000A2BD0  41 82 00 0C */	beq lbl_800A6CBC
lbl_800A6CB4:  
/* 800A6CB4 000A2BD4  83 97 00 00 */	lwz r28, 0(r23)
/* 800A6CB8 000A2BD8  48 00 00 10 */	b lbl_800A6CC8
lbl_800A6CBC:  
/* 800A6CBC 000A2BDC  83 97 00 04 */	lwz r28, 4(r23)
/* 800A6CC0 000A2BE0  48 00 00 08 */	b lbl_800A6CC8
lbl_800A6CC4:  
/* 800A6CC4 000A2BE4  83 97 00 08 */	lwz r28, 8(r23)
lbl_800A6CC8:
/* 800A6CC8 000A2BE8  28 1C 00 00 */	cmplwi r28, 0
/* 800A6CCC 000A2BEC  41 82 00 18 */	beq lbl_800A6CE4
/* 800A6CD0 000A2BF0  80 6D 99 80 */	lwz r3, mathutilData  // @sda21(r13)
/* 800A6CD4 000A2BF4  38 80 00 00 */	li r4, 0
/* 800A6CD8 000A2BF8  4B FF 3D 4D */	bl g_gxutil_upload_some_mtx
/* 800A6CDC 000A2BFC  7F 83 E3 78 */	mr r3, r28
/* 800A6CE0 000A2C00  4B FE 77 59 */	bl g_avdisp_maybe_draw_model_1
lbl_800A6CE4:
/* 800A6CE4 000A2C04  80 6D 99 24 */	lwz r3, naomiCommonObj  // @sda21(r13)
/* 800A6CE8 000A2C08  80 63 00 3C */	lwz r3, 0x3c(r3)
/* 800A6CEC 000A2C0C  4B F8 A5 25 */	bl g_draw_naomi_model_and_do_other_stuff
/* 800A6CF0 000A2C10  4B F6 0B 01 */	bl mathutil_mtxA_push
/* 800A6CF4 000A2C14  C0 22 B3 B4 */	lfs f1, lbl_802F5BB4  // -_SDA2_BASE_(r2)
/* 800A6CF8 000A2C18  C0 42 B4 2C */	lfs f2, lbl_802F5C2C  // -_SDA2_BASE_(r2)
/* 800A6CFC 000A2C1C  FC 60 08 90 */	fmr f3, f1
/* 800A6D00 000A2C20  4B F6 10 31 */	bl mathutil_mtxA_translate_xyz
/* 800A6D04 000A2C24  80 6D 99 80 */	lwz r3, mathutilData  // @sda21(r13)
/* 800A6D08 000A2C28  38 80 00 00 */	li r4, 0
/* 800A6D0C 000A2C2C  4B FF 3D 19 */	bl g_gxutil_upload_some_mtx
/* 800A6D10 000A2C30  80 6D 9A E8 */	lwz r3, commonGma  // @sda21(r13)
/* 800A6D14 000A2C34  80 63 00 08 */	lwz r3, 8(r3)
/* 800A6D18 000A2C38  80 63 01 00 */	lwz r3, 0x100(r3)
/* 800A6D1C 000A2C3C  4B FE 77 1D */	bl g_avdisp_maybe_draw_model_1
/* 800A6D20 000A2C40  4B F6 0B 15 */	bl mathutil_mtxA_pop
/* 800A6D24 000A2C44  4B F6 0A CD */	bl mathutil_mtxA_push
/* 800A6D28 000A2C48  80 6D 99 24 */	lwz r3, naomiCommonObj  // @sda21(r13)
/* 800A6D2C 000A2C4C  80 63 00 78 */	lwz r3, 0x78(r3)
/* 800A6D30 000A2C50  4B F8 CD A5 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 800A6D34 000A2C54  C0 42 B3 B4 */	lfs f2, lbl_802F5BB4  // -_SDA2_BASE_(r2)
/* 800A6D38 000A2C58  C0 22 B4 30 */	lfs f1, lbl_802F5C30  // -_SDA2_BASE_(r2)
/* 800A6D3C 000A2C5C  FC 60 10 90 */	fmr f3, f2
/* 800A6D40 000A2C60  4B F6 0F F1 */	bl mathutil_mtxA_translate_xyz
/* 800A6D44 000A2C64  80 6D 99 24 */	lwz r3, naomiCommonObj  // @sda21(r13)
/* 800A6D48 000A2C68  80 63 00 78 */	lwz r3, 0x78(r3)
/* 800A6D4C 000A2C6C  4B F8 CD 89 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 800A6D50 000A2C70  4B F6 0A E5 */	bl mathutil_mtxA_pop
/* 800A6D54 000A2C74  80 6D 99 24 */	lwz r3, naomiCommonObj  // @sda21(r13)
/* 800A6D58 000A2C78  80 63 00 50 */	lwz r3, 0x50(r3)
/* 800A6D5C 000A2C7C  4B F8 CD 79 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 800A6D60 000A2C80  C0 42 B3 B4 */	lfs f2, lbl_802F5BB4  // -_SDA2_BASE_(r2)
/* 800A6D64 000A2C84  C0 22 B4 34 */	lfs f1, lbl_802F5C34  // -_SDA2_BASE_(r2)
/* 800A6D68 000A2C88  FC 60 10 90 */	fmr f3, f2
/* 800A6D6C 000A2C8C  4B F6 0F C5 */	bl mathutil_mtxA_translate_xyz
/* 800A6D70 000A2C90  80 6D 99 24 */	lwz r3, naomiCommonObj  // @sda21(r13)
/* 800A6D74 000A2C94  80 63 00 50 */	lwz r3, 0x50(r3)
/* 800A6D78 000A2C98  4B F8 CD 5D */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 800A6D7C 000A2C9C  C0 42 B3 B4 */	lfs f2, lbl_802F5BB4  // -_SDA2_BASE_(r2)
/* 800A6D80 000A2CA0  C0 22 B4 34 */	lfs f1, lbl_802F5C34  // -_SDA2_BASE_(r2)
/* 800A6D84 000A2CA4  FC 60 10 90 */	fmr f3, f2
/* 800A6D88 000A2CA8  4B F6 0F A9 */	bl mathutil_mtxA_translate_xyz
/* 800A6D8C 000A2CAC  80 6D 99 24 */	lwz r3, naomiCommonObj  // @sda21(r13)
/* 800A6D90 000A2CB0  80 63 00 50 */	lwz r3, 0x50(r3)
/* 800A6D94 000A2CB4  4B F8 CD 41 */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 800A6D98 000A2CB8  3B 39 00 01 */	addi r25, r25, 1
/* 800A6D9C 000A2CBC  3B 7B 00 14 */	addi r27, r27, 0x14
lbl_800A6DA0:
/* 800A6DA0 000A2CC0  7C 19 C0 00 */	cmpw r25, r24
/* 800A6DA4 000A2CC4  41 80 FE CC */	blt lbl_800A6C70
/* 800A6DA8 000A2CC8  3B FF 00 C4 */	addi r31, r31, 0xc4
/* 800A6DAC 000A2CCC  3B DE 00 84 */	addi r30, r30, 0x84
/* 800A6DB0 000A2CD0  3B 5A 00 01 */	addi r26, r26, 1
lbl_800A6DB4:
/* 800A6DB4 000A2CD4  80 0D 9D 68 */	lwz r0, movableStagePartCount  // @sda21(r13)
/* 800A6DB8 000A2CD8  7C 1A 00 00 */	cmpw r26, r0
/* 800A6DBC 000A2CDC  41 80 FE 7C */	blt lbl_800A6C38
/* 800A6DC0 000A2CE0  3B 40 00 00 */	li r26, 0
/* 800A6DC4 000A2CE4  1C 9A 00 84 */	mulli r4, r26, 0x84
/* 800A6DC8 000A2CE8  3C 60 80 20 */	lis r3, movableStageParts@ha
/* 800A6DCC 000A2CEC  38 03 6E 48 */	addi r0, r3, movableStageParts@l
/* 800A6DD0 000A2CF0  3C 60 80 29 */	lis r3, lbl_8028C0B0@ha
/* 800A6DD4 000A2CF4  7F 20 22 14 */	add r25, r0, r4
/* 800A6DD8 000A2CF8  3B 1A 00 00 */	addi r24, r26, 0
/* 800A6DDC 000A2CFC  3A E3 C0 B0 */	addi r23, r3, lbl_8028C0B0@l
/* 800A6DE0 000A2D00  48 00 00 A4 */	b lbl_800A6E84
lbl_800A6DE4:
/* 800A6DE4 000A2D04  80 6D 9D 50 */	lwz r3, decodedStageLzPtr  // @sda21(r13)
/* 800A6DE8 000A2D08  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800A6DEC 000A2D0C  7C 60 C2 14 */	add r3, r0, r24
/* 800A6DF0 000A2D10  83 A3 00 50 */	lwz r29, 0x50(r3)
/* 800A6DF4 000A2D14  83 63 00 4C */	lwz r27, 0x4c(r3)
/* 800A6DF8 000A2D18  4B F6 0B B5 */	bl mathutil_mtxA_from_mtxB
/* 800A6DFC 000A2D1C  2C 1A 00 00 */	cmpwi r26, 0
/* 800A6E00 000A2D20  40 81 00 0C */	ble lbl_800A6E0C
/* 800A6E04 000A2D24  38 79 00 24 */	addi r3, r25, 0x24
/* 800A6E08 000A2D28  4B F6 0E 39 */	bl mathutil_mtxA_mult_right
lbl_800A6E0C:
/* 800A6E0C 000A2D2C  38 61 00 08 */	addi r3, r1, 8
/* 800A6E10 000A2D30  4B F6 0A 69 */	bl mathutil_mtxA_to_mtx
/* 800A6E14 000A2D34  3B 80 00 00 */	li r28, 0
/* 800A6E18 000A2D38  48 00 00 58 */	b lbl_800A6E70
lbl_800A6E1C:
/* 800A6E1C 000A2D3C  38 61 00 08 */	addi r3, r1, 8
/* 800A6E20 000A2D40  4B F6 0A 91 */	bl mathutil_mtxA_from_mtx
/* 800A6E24 000A2D44  7F A3 EB 78 */	mr r3, r29
/* 800A6E28 000A2D48  4B F6 0E F9 */	bl mathutil_mtxA_translate
/* 800A6E2C 000A2D4C  A8 7D 00 10 */	lha r3, 0x10(r29)
/* 800A6E30 000A2D50  4B F6 12 59 */	bl mathutil_mtxA_rotate_z
/* 800A6E34 000A2D54  A8 7D 00 0E */	lha r3, 0xe(r29)
/* 800A6E38 000A2D58  4B F6 11 C5 */	bl mathutil_mtxA_rotate_y
/* 800A6E3C 000A2D5C  A8 7D 00 0C */	lha r3, 0xc(r29)
/* 800A6E40 000A2D60  4B F6 11 49 */	bl mathutil_mtxA_rotate_x
/* 800A6E44 000A2D64  80 6D A0 00 */	lwz r3, stageViewInfo  // @sda21(r13)
/* 800A6E48 000A2D68  A8 03 00 1E */	lha r0, 0x1e(r3)
/* 800A6E4C 000A2D6C  54 03 40 2E */	slwi r3, r0, 8
/* 800A6E50 000A2D70  4B F6 11 AD */	bl mathutil_mtxA_rotate_y
/* 800A6E54 000A2D74  80 6D 99 80 */	lwz r3, mathutilData  // @sda21(r13)
/* 800A6E58 000A2D78  38 80 00 00 */	li r4, 0
/* 800A6E5C 000A2D7C  4B FF 3B C9 */	bl g_gxutil_upload_some_mtx
/* 800A6E60 000A2D80  80 77 00 14 */	lwz r3, 0x14(r23)
/* 800A6E64 000A2D84  4B FE 75 D5 */	bl g_avdisp_maybe_draw_model_1
/* 800A6E68 000A2D88  3B 9C 00 01 */	addi r28, r28, 1
/* 800A6E6C 000A2D8C  3B BD 00 20 */	addi r29, r29, 0x20
lbl_800A6E70:
/* 800A6E70 000A2D90  7C 1C D8 00 */	cmpw r28, r27
/* 800A6E74 000A2D94  41 80 FF A8 */	blt lbl_800A6E1C
/* 800A6E78 000A2D98  3B 18 00 C4 */	addi r24, r24, 0xc4
/* 800A6E7C 000A2D9C  3B 39 00 84 */	addi r25, r25, 0x84
/* 800A6E80 000A2DA0  3B 5A 00 01 */	addi r26, r26, 1
lbl_800A6E84:
/* 800A6E84 000A2DA4  80 0D 9D 68 */	lwz r0, movableStagePartCount  // @sda21(r13)
/* 800A6E88 000A2DA8  7C 1A 00 00 */	cmpw r26, r0
/* 800A6E8C 000A2DAC  41 80 FF 58 */	blt lbl_800A6DE4
/* 800A6E90 000A2DB0  3B A0 00 00 */	li r29, 0
/* 800A6E94 000A2DB4  CB 62 B3 C0 */	lfd f27, lbl_802F5BC0  // -_SDA2_BASE_(r2)
/* 800A6E98 000A2DB8  1C 9D 00 84 */	mulli r4, r29, 0x84
/* 800A6E9C 000A2DBC  C3 82 B4 38 */	lfs f28, lbl_802F5C38  // -_SDA2_BASE_(r2)
/* 800A6EA0 000A2DC0  CB A2 B3 F0 */	lfd f29, lbl_802F5BF0  // -_SDA2_BASE_(r2)
/* 800A6EA4 000A2DC4  CB C2 B3 98 */	lfd f30, lbl_802F5B98  // -_SDA2_BASE_(r2)
/* 800A6EA8 000A2DC8  3C 60 80 20 */	lis r3, movableStageParts@ha
/* 800A6EAC 000A2DCC  38 03 6E 48 */	addi r0, r3, movableStageParts@l
/* 800A6EB0 000A2DD0  CB E2 B4 40 */	lfd f31, lbl_802F5C40  // -_SDA2_BASE_(r2)
/* 800A6EB4 000A2DD4  3C 60 88 89 */	lis r3, 0x88888889@ha
/* 800A6EB8 000A2DD8  7F E0 22 14 */	add r31, r0, r4
/* 800A6EBC 000A2DDC  3B DD 00 00 */	addi r30, r29, 0
/* 800A6EC0 000A2DE0  3A E3 88 89 */	addi r23, r3, 0x88888889@l
/* 800A6EC4 000A2DE4  3B 40 00 00 */	li r26, 0
/* 800A6EC8 000A2DE8  3F 00 43 30 */	lis r24, 0x4330
/* 800A6ECC 000A2DEC  48 00 01 20 */	b lbl_800A6FEC
lbl_800A6ED0:
/* 800A6ED0 000A2DF0  80 6D 9D 50 */	lwz r3, decodedStageLzPtr  // @sda21(r13)
/* 800A6ED4 000A2DF4  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800A6ED8 000A2DF8  7C 60 F2 14 */	add r3, r0, r30
/* 800A6EDC 000A2DFC  83 23 00 58 */	lwz r25, 0x58(r3)
/* 800A6EE0 000A2E00  83 83 00 54 */	lwz r28, 0x54(r3)
/* 800A6EE4 000A2E04  4B F6 0A C9 */	bl mathutil_mtxA_from_mtxB
/* 800A6EE8 000A2E08  2C 1D 00 00 */	cmpwi r29, 0
/* 800A6EEC 000A2E0C  40 81 00 0C */	ble lbl_800A6EF8
/* 800A6EF0 000A2E10  38 7F 00 24 */	addi r3, r31, 0x24
/* 800A6EF4 000A2E14  4B F6 0D 4D */	bl mathutil_mtxA_mult_right
lbl_800A6EF8:
/* 800A6EF8 000A2E18  38 61 00 08 */	addi r3, r1, 8
/* 800A6EFC 000A2E1C  4B F6 09 7D */	bl mathutil_mtxA_to_mtx
/* 800A6F00 000A2E20  3B 60 00 00 */	li r27, 0
/* 800A6F04 000A2E24  48 00 00 D4 */	b lbl_800A6FD8
lbl_800A6F08:
/* 800A6F08 000A2E28  38 61 00 08 */	addi r3, r1, 8
/* 800A6F0C 000A2E2C  4B F6 09 A5 */	bl mathutil_mtxA_from_mtx
/* 800A6F10 000A2E30  7F 23 CB 78 */	mr r3, r25
/* 800A6F14 000A2E34  4B F6 0E 0D */	bl mathutil_mtxA_translate
/* 800A6F18 000A2E38  A8 79 00 10 */	lha r3, 0x10(r25)
/* 800A6F1C 000A2E3C  4B F6 11 6D */	bl mathutil_mtxA_rotate_z
/* 800A6F20 000A2E40  A8 79 00 0E */	lha r3, 0xe(r25)
/* 800A6F24 000A2E44  4B F6 10 D9 */	bl mathutil_mtxA_rotate_y
/* 800A6F28 000A2E48  A8 79 00 0C */	lha r3, 0xc(r25)
/* 800A6F2C 000A2E4C  4B F6 10 5D */	bl mathutil_mtxA_rotate_x
/* 800A6F30 000A2E50  80 8D 9D 50 */	lwz r4, decodedStageLzPtr  // @sda21(r13)
/* 800A6F34 000A2E54  38 A0 00 3C */	li r5, 0x3c
/* 800A6F38 000A2E58  80 6D A0 00 */	lwz r3, stageViewInfo  // @sda21(r13)
/* 800A6F3C 000A2E5C  80 84 00 30 */	lwz r4, 0x30(r4)
/* 800A6F40 000A2E60  A8 03 00 1E */	lha r0, 0x1e(r3)
/* 800A6F44 000A2E64  7C 65 23 D6 */	divw r3, r5, r4    
/* 800A6F48 000A2E68  7C 7A 19 D6 */	mullw r3, r26, r3  
/* 800A6F4C 000A2E6C  7C 83 00 50 */	subf r4, r3, r0    
/* 800A6F50 000A2E70  7C 17 20 96 */	mulhw r0, r23, r4
/* 800A6F54 000A2E74  7C 00 22 14 */	add r0, r0, r4
/* 800A6F58 000A2E78  7C 00 2E 70 */	srawi r0, r0, 5    
/* 800A6F5C 000A2E7C  54 03 0F FE */	srwi r3, r0, 0x1f
/* 800A6F60 000A2E80  7C 00 1A 14 */	add r0, r0, r3
/* 800A6F64 000A2E84  1C 00 00 3C */	mulli r0, r0, 0x3c
/* 800A6F68 000A2E88  7C 00 20 50 */	subf r0, r0, r4
/* 800A6F6C 000A2E8C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800A6F70 000A2E90  90 01 00 3C */	stw r0, 0x3c(r1)
/* 800A6F74 000A2E94  93 01 00 38 */	stw r24, 0x38(r1)
/* 800A6F78 000A2E98  C8 01 00 38 */	lfd f0, 0x38(r1)
/* 800A6F7C 000A2E9C  EC 00 D8 28 */	fsubs f0, f0, f27  
/* 800A6F80 000A2EA0  EC 00 E0 24 */	fdivs f0, f0, f28  
/* 800A6F84 000A2EA4  FC 1D 00 32 */	fmul f0, f29, f0   
/* 800A6F88 000A2EA8  FC 00 00 18 */	frsp f0, f0
/* 800A6F8C 000A2EAC  FC 00 F0 40 */	fcmpo cr0, f0, f30  
/* 800A6F90 000A2EB0  4C 41 13 82 */	cror 2, 1, 2
/* 800A6F94 000A2EB4  40 82 00 0C */	bne lbl_800A6FA0
/* 800A6F98 000A2EB8  FC 1D 00 28 */	fsub f0, f29, f0
/* 800A6F9C 000A2EBC  FC 00 00 18 */	frsp f0, f0
lbl_800A6FA0:
/* 800A6FA0 000A2EC0  FC 00 00 50 */	fneg f0, f0
/* 800A6FA4 000A2EC4  C0 22 B3 B4 */	lfs f1, lbl_802F5BB4  // -_SDA2_BASE_(r2)
/* 800A6FA8 000A2EC8  FC 40 08 90 */	fmr f2, f1
/* 800A6FAC 000A2ECC  FC 7F 00 32 */	fmul f3, f31, f0
/* 800A6FB0 000A2ED0  FC 60 18 18 */	frsp f3, f3
/* 800A6FB4 000A2ED4  4B F6 0D 7D */	bl mathutil_mtxA_translate_xyz
/* 800A6FB8 000A2ED8  80 6D 99 80 */	lwz r3, mathutilData  // @sda21(r13)
/* 800A6FBC 000A2EDC  38 80 00 00 */	li r4, 0
/* 800A6FC0 000A2EE0  4B FF 3A 65 */	bl g_gxutil_upload_some_mtx
/* 800A6FC4 000A2EE4  80 6D 9E 1C */	lwz r3, lbl_802F1FFC  // @sda21(r13)
/* 800A6FC8 000A2EE8  4B FE 74 71 */	bl g_avdisp_maybe_draw_model_1
/* 800A6FCC 000A2EEC  3B 5A 00 01 */	addi r26, r26, 1
/* 800A6FD0 000A2EF0  3B 7B 00 01 */	addi r27, r27, 1
/* 800A6FD4 000A2EF4  3B 39 00 20 */	addi r25, r25, 0x20
lbl_800A6FD8:
/* 800A6FD8 000A2EF8  7C 1B E0 00 */	cmpw r27, r28
/* 800A6FDC 000A2EFC  41 80 FF 2C */	blt lbl_800A6F08
/* 800A6FE0 000A2F00  3B DE 00 C4 */	addi r30, r30, 0xc4
/* 800A6FE4 000A2F04  3B FF 00 84 */	addi r31, r31, 0x84
/* 800A6FE8 000A2F08  3B BD 00 01 */	addi r29, r29, 1
lbl_800A6FEC:
/* 800A6FEC 000A2F0C  80 0D 9D 68 */	lwz r0, movableStagePartCount  // @sda21(r13)
/* 800A6FF0 000A2F10  7C 1D 00 00 */	cmpw r29, r0
/* 800A6FF4 000A2F14  41 80 FE DC */	blt lbl_800A6ED0
/* 800A6FF8 000A2F18  BA E1 00 44 */	lmw r23, 0x44(r1)
/* 800A6FFC 000A2F1C  80 01 00 94 */	lwz r0, 0x94(r1)
/* 800A7000 000A2F20  CB E1 00 88 */	lfd f31, 0x88(r1)
/* 800A7004 000A2F24  CB C1 00 80 */	lfd f30, 0x80(r1)
/* 800A7008 000A2F28  7C 08 03 A6 */	mtlr r0
/* 800A700C 000A2F2C  CB A1 00 78 */	lfd f29, 0x78(r1)
/* 800A7010 000A2F30  CB 81 00 70 */	lfd f28, 0x70(r1)
/* 800A7014 000A2F34  CB 61 00 68 */	lfd f27, 0x68(r1)
/* 800A7018 000A2F38  38 21 00 90 */	addi r1, r1, 0x90
/* 800A701C 000A2F3C  4E 80 00 20 */	blr
