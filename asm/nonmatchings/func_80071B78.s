/* 80071B78 0006DA98  7C 08 02 A6 */	mflr r0
/* 80071B7C 0006DA9C  3C 80 80 29 */	lis r4, textDrawInfo@ha
/* 80071B80 0006DAA0  90 01 00 04 */	stw r0, 4(r1)
/* 80071B84 0006DAA4  3C A0 80 1C */	lis r5, fontInfo@ha
/* 80071B88 0006DAA8  38 84 CF 28 */	addi r4, r4, textDrawInfo@l
/* 80071B8C 0006DAAC  94 21 FF 38 */	stwu r1, -0xc8(r1)
/* 80071B90 0006DAB0  38 05 E4 B0 */	addi r0, r5, fontInfo@l
/* 80071B94 0006DAB4  80 C4 00 0C */	lwz r6, 0xc(r4)
/* 80071B98 0006DAB8  C8 02 A2 80 */	lfd f0, 4503601774854144.0
/* 80071B9C 0006DABC  1C A6 00 24 */	mulli r5, r6, 0x24
/* 80071BA0 0006DAC0  7C A0 2A 14 */	add r5, r0, r5
/* 80071BA4 0006DAC4  89 05 00 0C */	lbz r8, 0xc(r5)
/* 80071BA8 0006DAC8  7C 66 07 74 */	extsb r6, r3
/* 80071BAC 0006DACC  80 E5 00 04 */	lwz r7, 4(r5)
/* 80071BB0 0006DAD0  3C 00 43 30 */	lis r0, 0x4330
/* 80071BB4 0006DAD4  7D 08 07 74 */	extsb r8, r8
/* 80071BB8 0006DAD8  7C C7 30 50 */	subf r6, r7, r6
/* 80071BBC 0006DADC  A8 65 00 00 */	lha r3, 0(r5)
/* 80071BC0 0006DAE0  7C E6 43 D6 */	divw r7, r6, r8
/* 80071BC4 0006DAE4  90 61 00 10 */	stw r3, 0x10(r1)
/* 80071BC8 0006DAE8  88 65 00 20 */	lbz r3, 0x20(r5)
/* 80071BCC 0006DAEC  C0 45 00 18 */	lfs f2, 0x18(r5)
/* 80071BD0 0006DAF0  C0 64 00 04 */	lfs f3, 4(r4)
/* 80071BD4 0006DAF4  7C 63 07 74 */	extsb r3, r3
/* 80071BD8 0006DAF8  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80071BDC 0006DAFC  90 61 00 C4 */	stw r3, 0xc4(r1)
/* 80071BE0 0006DB00  7C 67 41 D6 */	mullw r3, r7, r8
/* 80071BE4 0006DB04  90 01 00 C0 */	stw r0, 0xc0(r1)
/* 80071BE8 0006DB08  C8 21 00 C0 */	lfd f1, 0xc0(r1)
/* 80071BEC 0006DB0C  7C 63 30 50 */	subf r3, r3, r6
/* 80071BF0 0006DB10  EC 21 00 28 */	fsubs f1, f1, f0
/* 80071BF4 0006DB14  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80071BF8 0006DB18  90 61 00 B4 */	stw r3, 0xb4(r1)
/* 80071BFC 0006DB1C  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 80071C00 0006DB20  EC 22 00 72 */	fmuls f1, f2, f1
/* 80071C04 0006DB24  90 61 00 AC */	stw r3, 0xac(r1)
/* 80071C08 0006DB28  EC 43 08 2A */	fadds f2, f3, f1
/* 80071C0C 0006DB2C  90 01 00 B0 */	stw r0, 0xb0(r1)
/* 80071C10 0006DB30  C8 21 00 B0 */	lfd f1, 0xb0(r1)
/* 80071C14 0006DB34  D0 41 00 14 */	stfs f2, 0x14(r1)
/* 80071C18 0006DB38  EC 81 00 28 */	fsubs f4, f1, f0
/* 80071C1C 0006DB3C  88 65 00 22 */	lbz r3, 0x22(r5)
/* 80071C20 0006DB40  C0 65 00 1C */	lfs f3, 0x1c(r5)
/* 80071C24 0006DB44  7C 63 07 74 */	extsb r3, r3
/* 80071C28 0006DB48  C0 A4 00 08 */	lfs f5, 8(r4)
/* 80071C2C 0006DB4C  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80071C30 0006DB50  90 01 00 A8 */	stw r0, 0xa8(r1)
/* 80071C34 0006DB54  90 61 00 BC */	stw r3, 0xbc(r1)
/* 80071C38 0006DB58  C8 21 00 A8 */	lfd f1, 0xa8(r1)
/* 80071C3C 0006DB5C  90 01 00 B8 */	stw r0, 0xb8(r1)
/* 80071C40 0006DB60  EC 21 00 28 */	fsubs f1, f1, f0
/* 80071C44 0006DB64  C8 41 00 B8 */	lfd f2, 0xb8(r1)
/* 80071C48 0006DB68  EC 42 00 28 */	fsubs f2, f2, f0
/* 80071C4C 0006DB6C  EC 43 00 B2 */	fmuls f2, f3, f2
/* 80071C50 0006DB70  EC 45 10 2A */	fadds f2, f5, f2
/* 80071C54 0006DB74  D0 41 00 18 */	stfs f2, 0x18(r1)
/* 80071C58 0006DB78  C0 44 00 1C */	lfs f2, 0x1c(r4)
/* 80071C5C 0006DB7C  D0 41 00 1C */	stfs f2, 0x1c(r1)
/* 80071C60 0006DB80  88 65 00 20 */	lbz r3, 0x20(r5)
/* 80071C64 0006DB84  C0 A5 00 10 */	lfs f5, 0x10(r5)
/* 80071C68 0006DB88  7C 63 07 74 */	extsb r3, r3
/* 80071C6C 0006DB8C  C0 65 00 14 */	lfs f3, 0x14(r5)
/* 80071C70 0006DB90  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80071C74 0006DB94  EC 85 01 32 */	fmuls f4, f5, f4
/* 80071C78 0006DB98  90 61 00 A4 */	stw r3, 0xa4(r1)
/* 80071C7C 0006DB9C  EC A3 00 72 */	fmuls f5, f3, f1
/* 80071C80 0006DBA0  C0 45 00 18 */	lfs f2, 0x18(r5)
/* 80071C84 0006DBA4  90 01 00 A0 */	stw r0, 0xa0(r1)
/* 80071C88 0006DBA8  C8 21 00 A0 */	lfd f1, 0xa0(r1)
/* 80071C8C 0006DBAC  EC 21 00 28 */	fsubs f1, f1, f0
/* 80071C90 0006DBB0  EC 22 00 72 */	fmuls f1, f2, f1
/* 80071C94 0006DBB4  EC 24 08 2A */	fadds f1, f4, f1
/* 80071C98 0006DBB8  D0 21 00 28 */	stfs f1, 0x28(r1)
/* 80071C9C 0006DBBC  88 65 00 22 */	lbz r3, 0x22(r5)
/* 80071CA0 0006DBC0  C0 45 00 1C */	lfs f2, 0x1c(r5)
/* 80071CA4 0006DBC4  7C 63 07 74 */	extsb r3, r3
/* 80071CA8 0006DBC8  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80071CAC 0006DBCC  90 61 00 9C */	stw r3, 0x9c(r1)
/* 80071CB0 0006DBD0  90 01 00 98 */	stw r0, 0x98(r1)
/* 80071CB4 0006DBD4  C8 21 00 98 */	lfd f1, 0x98(r1)
/* 80071CB8 0006DBD8  EC 21 00 28 */	fsubs f1, f1, f0
/* 80071CBC 0006DBDC  EC 22 00 72 */	fmuls f1, f2, f1
/* 80071CC0 0006DBE0  EC 25 08 2A */	fadds f1, f5, f1
/* 80071CC4 0006DBE4  D0 21 00 2C */	stfs f1, 0x2c(r1)
/* 80071CC8 0006DBE8  88 65 00 21 */	lbz r3, 0x21(r5)
/* 80071CCC 0006DBEC  C0 45 00 18 */	lfs f2, 0x18(r5)
/* 80071CD0 0006DBF0  7C 63 07 74 */	extsb r3, r3
/* 80071CD4 0006DBF4  C0 65 00 10 */	lfs f3, 0x10(r5)
/* 80071CD8 0006DBF8  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80071CDC 0006DBFC  90 61 00 94 */	stw r3, 0x94(r1)
/* 80071CE0 0006DC00  90 01 00 90 */	stw r0, 0x90(r1)
/* 80071CE4 0006DC04  C8 21 00 90 */	lfd f1, 0x90(r1)
/* 80071CE8 0006DC08  EC 21 00 28 */	fsubs f1, f1, f0
/* 80071CEC 0006DC0C  EC 22 00 72 */	fmuls f1, f2, f1
/* 80071CF0 0006DC10  EC 24 08 28 */	fsubs f1, f4, f1
/* 80071CF4 0006DC14  EC 23 08 2A */	fadds f1, f3, f1
/* 80071CF8 0006DC18  D0 21 00 30 */	stfs f1, 0x30(r1)
/* 80071CFC 0006DC1C  88 E5 00 23 */	lbz r7, 0x23(r5)
/* 80071D00 0006DC20  38 C0 FF FF */	li r6, -1
/* 80071D04 0006DC24  C0 65 00 1C */	lfs f3, 0x1c(r5)
/* 80071D08 0006DC28  38 61 00 10 */	addi r3, r1, 0x10
/* 80071D0C 0006DC2C  7C E7 07 74 */	extsb r7, r7
/* 80071D10 0006DC30  6C E7 80 00 */	xoris r7, r7, 0x8000
/* 80071D14 0006DC34  C0 85 00 14 */	lfs f4, 0x14(r5)
/* 80071D18 0006DC38  90 E1 00 8C */	stw r7, 0x8c(r1)
/* 80071D1C 0006DC3C  C0 22 A2 BC */	lfs f1, 255.0f
/* 80071D20 0006DC40  90 01 00 88 */	stw r0, 0x88(r1)
/* 80071D24 0006DC44  C8 41 00 88 */	lfd f2, 0x88(r1)
/* 80071D28 0006DC48  EC 42 00 28 */	fsubs f2, f2, f0
/* 80071D2C 0006DC4C  EC 43 00 B2 */	fmuls f2, f3, f2
/* 80071D30 0006DC50  EC 45 10 28 */	fsubs f2, f5, f2
/* 80071D34 0006DC54  EC 44 10 2A */	fadds f2, f4, f2
/* 80071D38 0006DC58  D0 41 00 34 */	stfs f2, 0x34(r1)
/* 80071D3C 0006DC5C  89 05 00 20 */	lbz r8, 0x20(r5)
/* 80071D40 0006DC60  88 E5 00 21 */	lbz r7, 0x21(r5)
/* 80071D44 0006DC64  7D 08 07 74 */	extsb r8, r8
/* 80071D48 0006DC68  C0 C5 00 18 */	lfs f6, 0x18(r5)
/* 80071D4C 0006DC6C  6D 08 80 00 */	xoris r8, r8, 0x8000
/* 80071D50 0006DC70  C0 85 00 10 */	lfs f4, 0x10(r5)
/* 80071D54 0006DC74  91 01 00 84 */	stw r8, 0x84(r1)
/* 80071D58 0006DC78  7C E7 07 74 */	extsb r7, r7
/* 80071D5C 0006DC7C  6C E7 80 00 */	xoris r7, r7, 0x8000
/* 80071D60 0006DC80  C0 A4 00 20 */	lfs f5, 0x20(r4)
/* 80071D64 0006DC84  90 01 00 80 */	stw r0, 0x80(r1)
/* 80071D68 0006DC88  90 E1 00 7C */	stw r7, 0x7c(r1)
/* 80071D6C 0006DC8C  C8 41 00 80 */	lfd f2, 0x80(r1)
/* 80071D70 0006DC90  90 01 00 78 */	stw r0, 0x78(r1)
/* 80071D74 0006DC94  EC 62 00 28 */	fsubs f3, f2, f0
/* 80071D78 0006DC98  C8 41 00 78 */	lfd f2, 0x78(r1)
/* 80071D7C 0006DC9C  EC 66 00 F2 */	fmuls f3, f6, f3
/* 80071D80 0006DCA0  EC 42 00 28 */	fsubs f2, f2, f0
/* 80071D84 0006DCA4  EC 64 18 28 */	fsubs f3, f4, f3
/* 80071D88 0006DCA8  EC 46 00 B2 */	fmuls f2, f6, f2
/* 80071D8C 0006DCAC  EC 43 10 28 */	fsubs f2, f3, f2
/* 80071D90 0006DCB0  EC 45 00 B2 */	fmuls f2, f5, f2
/* 80071D94 0006DCB4  D0 41 00 20 */	stfs f2, 0x20(r1)
/* 80071D98 0006DCB8  89 05 00 22 */	lbz r8, 0x22(r5)
/* 80071D9C 0006DCBC  88 E5 00 23 */	lbz r7, 0x23(r5)
/* 80071DA0 0006DCC0  7D 08 07 74 */	extsb r8, r8
/* 80071DA4 0006DCC4  C0 A5 00 1C */	lfs f5, 0x1c(r5)
/* 80071DA8 0006DCC8  6D 08 80 00 */	xoris r8, r8, 0x8000
/* 80071DAC 0006DCCC  C0 C5 00 14 */	lfs f6, 0x14(r5)
/* 80071DB0 0006DCD0  91 01 00 74 */	stw r8, 0x74(r1)
/* 80071DB4 0006DCD4  7C E7 07 74 */	extsb r7, r7
/* 80071DB8 0006DCD8  6C E7 80 00 */	xoris r7, r7, 0x8000
/* 80071DBC 0006DCDC  C0 65 00 18 */	lfs f3, 0x18(r5)
/* 80071DC0 0006DCE0  90 01 00 70 */	stw r0, 0x70(r1)
/* 80071DC4 0006DCE4  C0 E4 00 24 */	lfs f7, 0x24(r4)
/* 80071DC8 0006DCE8  90 E1 00 6C */	stw r7, 0x6c(r1)
/* 80071DCC 0006DCEC  C8 41 00 70 */	lfd f2, 0x70(r1)
/* 80071DD0 0006DCF0  90 01 00 68 */	stw r0, 0x68(r1)
/* 80071DD4 0006DCF4  EC 82 00 28 */	fsubs f4, f2, f0
/* 80071DD8 0006DCF8  C8 41 00 68 */	lfd f2, 0x68(r1)
/* 80071DDC 0006DCFC  EC 02 00 28 */	fsubs f0, f2, f0
/* 80071DE0 0006DD00  EC 85 01 32 */	fmuls f4, f5, f4
/* 80071DE4 0006DD04  EC 03 00 32 */	fmuls f0, f3, f0
/* 80071DE8 0006DD08  EC 46 20 28 */	fsubs f2, f6, f4
/* 80071DEC 0006DD0C  EC 02 00 28 */	fsubs f0, f2, f0
/* 80071DF0 0006DD10  EC 07 00 32 */	fmuls f0, f7, f0
/* 80071DF4 0006DD14  D0 01 00 24 */	stfs f0, 0x24(r1)
/* 80071DF8 0006DD18  A8 04 00 18 */	lha r0, 0x18(r4)
/* 80071DFC 0006DD1C  90 01 00 38 */	stw r0, 0x38(r1)
/* 80071E00 0006DD20  C0 04 00 28 */	lfs f0, 0x28(r4)
/* 80071E04 0006DD24  D0 01 00 3C */	stfs f0, 0x3c(r1)
/* 80071E08 0006DD28  EC 01 00 32 */	fmuls f0, f1, f0
/* 80071E0C 0006DD2C  90 C1 00 40 */	stw r6, 0x40(r1)
/* 80071E10 0006DD30  FC 00 00 1E */	fctiwz f0, f0
/* 80071E14 0006DD34  80 04 00 2C */	lwz r0, 0x2c(r4)
/* 80071E18 0006DD38  54 00 00 36 */	rlwinm r0, r0, 0, 0, 0x1b
/* 80071E1C 0006DD3C  D8 01 00 60 */	stfd f0, 0x60(r1)
/* 80071E20 0006DD40  60 00 00 05 */	ori r0, r0, 5
/* 80071E24 0006DD44  90 01 00 44 */	stw r0, 0x44(r1)
/* 80071E28 0006DD48  80 A1 00 64 */	lwz r5, 0x64(r1)
/* 80071E2C 0006DD4C  80 04 00 10 */	lwz r0, 0x10(r4)
/* 80071E30 0006DD50  54 A5 C0 0E */	slwi r5, r5, 0x18
/* 80071E34 0006DD54  7C A0 03 78 */	or r0, r5, r0
/* 80071E38 0006DD58  90 01 00 48 */	stw r0, 0x48(r1)
/* 80071E3C 0006DD5C  80 04 00 14 */	lwz r0, 0x14(r4)
/* 80071E40 0006DD60  90 01 00 4C */	stw r0, 0x4c(r1)
/* 80071E44 0006DD64  48 00 19 E5 */	bl draw_naomi_sprite
/* 80071E48 0006DD68  80 01 00 CC */	lwz r0, 0xcc(r1)
/* 80071E4C 0006DD6C  38 21 00 C8 */	addi r1, r1, 0xc8
/* 80071E50 0006DD70  7C 08 03 A6 */	mtlr r0
/* 80071E54 0006DD74  4E 80 00 20 */	blr
