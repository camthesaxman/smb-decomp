bomb_frag_sprite_main:
/* 800805AC 0007C4CC  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800805B0 0007C4D0  3C A0 43 30 */	lis r5, 0x4330
/* 800805B4 0007C4D4  C0 24 00 6C */	lfs f1, 0x6c(r4)
/* 800805B8 0007C4D8  C0 02 A8 C4 */	lfs f0, lbl_802F50C4
/* 800805BC 0007C4DC  EC 01 00 32 */	fmuls f0, f1, f0
/* 800805C0 0007C4E0  D0 04 00 6C */	stfs f0, 0x6c(r4)
/* 800805C4 0007C4E4  C0 04 00 40 */	lfs f0, 0x40(r4)
/* 800805C8 0007C4E8  C0 22 A6 B0 */	lfs f1, 1.01f  //lbl_802F4EB0-_SDA2_BASE_(r2)
/* 800805CC 0007C4EC  EC 00 00 72 */	fmuls f0, f0, f1
/* 800805D0 0007C4F0  D0 04 00 40 */	stfs f0, 0x40(r4)
/* 800805D4 0007C4F4  C0 04 00 44 */	lfs f0, 0x44(r4)
/* 800805D8 0007C4F8  EC 00 00 72 */	fmuls f0, f0, f1
/* 800805DC 0007C4FC  D0 04 00 44 */	stfs f0, 0x44(r4)
/* 800805E0 0007C500  A8 E4 00 48 */	lha r7, 0x48(r4)  // r7
/* 800805E4 0007C504  C0 04 00 6C */	lfs f0, 0x6c(r4)
/* 800805E8 0007C508  6C E0 80 00 */	xoris r0, r7, 0x8000
/* 800805EC 0007C50C  A9 04 00 4A */	lha r8, 0x4a(r4)  // r8
/* 800805F0 0007C510  90 01 00 1C */	stw r0, 0x1c(r1)
/* 800805F4 0007C514  EC C0 00 32 */	fmuls f6, f0, f0  // f6 = opacity * opacity
/* 800805F8 0007C518  6D 00 80 00 */	xoris r0, r8, 0x8000
/* 800805FC 0007C51C  C0 22 A4 28 */	lfs f1, 1.0f  //lbl_802F4C28-_SDA2_BASE_(r2)
/* 80080600 0007C520  90 A1 00 18 */	stw r5, 0x18(r1)
/* 80080604 0007C524  C8 82 A4 78 */	lfd f4, 4503601774854144.0  //lbl_802F4C78-_SDA2_BASE_(r2)
/* 80080608 0007C528  90 01 00 24 */	stw r0, 0x24(r1)
/* 8008060C 0007C52C  EC 41 30 28 */	fsubs f2, f1, f6  // 1.0f - f6
/* 80080610 0007C530  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 80080614 0007C534  90 A1 00 20 */	stw r5, 0x20(r1)
/* 80080618 0007C538  EC 00 20 28 */	fsubs f0, f0, f4  // r7
/* 8008061C 0007C53C  C0 22 A8 CC */	lfs f1, lbl_802F50CC
/* 80080620 0007C540  C8 61 00 20 */	lfd f3, 0x20(r1)
/* 80080624 0007C544  C0 A2 A8 C8 */	lfs f5, lbl_802F50C8
/* 80080628 0007C548  EC 01 00 32 */	fmuls f0, f1, f0  // 0.9f * r7
/* 8008062C 0007C54C  EC 63 20 28 */	fsubs f3, f3, f4  // r8
/* 80080630 0007C550  C0 24 00 04 */	lfs f1, 4(r4)     // x
/* 80080634 0007C554  EC 00 01 B2 */	fmuls f0, f0, f6  // 0.9f * r7 * f6
/* 80080638 0007C558  EC 65 00 F2 */	fmuls f3, f5, f3  // 0.97f * r8
/* 8008063C 0007C55C  EC 01 00 2A */	fadds f0, f1, f0  // 0.9f * r7 * f6 + x
/* 80080640 0007C560  EC 23 01 B2 */	fmuls f1, f3, f6  // 0.97f * r8 * f6
/* 80080644 0007C564  D0 04 00 04 */	stfs f0, 4(r4)
/* 80080648 0007C568  EC 21 10 2A */	fadds f1, f1, f2
/* 8008064C 0007C56C  C0 04 00 08 */	lfs f0, 8(r4)
/* 80080650 0007C570  EC 00 08 2A */	fadds f0, f0, f1
/* 80080654 0007C574  D0 04 00 08 */	stfs f0, 8(r4)
/* 80080658 0007C578  B0 E4 00 48 */	sth r7, 0x48(r4)
/* 8008065C 0007C57C  B1 04 00 4A */	sth r8, 0x4a(r4)
/* 80080660 0007C580  C0 24 00 6C */	lfs f1, 0x6c(r4)
/* 80080664 0007C584  C0 02 A3 DC */	lfs f0, 0.004999999888241291f  //lbl_802F4BDC-_SDA2_BASE_(r2)
/* 80080668 0007C588  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8008066C 0007C58C  40 80 00 0C */	bge lbl_80080678
/* 80080670 0007C590  38 00 00 00 */	li r0, 0
/* 80080674 0007C594  98 03 00 00 */	stb r0, 0(r3)
lbl_80080678:
/* 80080678 0007C598  38 21 00 28 */	addi r1, r1, 0x28
/* 8008067C 0007C59C  4E 80 00 20 */	blr
