.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global PSMTXIdentity
PSMTXIdentity:
/* 800CA170 000C6090  C0 02 BF 34 */	lfs f0, lbl_802F6734@sda21(r2)
/* 800CA174 000C6094  C0 22 BF 30 */	lfs f1, lbl_802F6730@sda21(r2)
/* 800CA178 000C6098  F0 03 00 08 */	psq_st f0, 8(r3), 0, qr0
/* 800CA17C 000C609C  10 40 0C 60 */	ps_merge01 f2, f0, f1
/* 800CA180 000C60A0  F0 03 00 18 */	psq_st f0, 24(r3), 0, qr0
/* 800CA184 000C60A4  10 21 04 A0 */	ps_merge10 f1, f1, f0
/* 800CA188 000C60A8  F0 03 00 20 */	psq_st f0, 32(r3), 0, qr0
/* 800CA18C 000C60AC  F0 43 00 10 */	psq_st f2, 16(r3), 0, qr0
/* 800CA190 000C60B0  F0 23 00 00 */	psq_st f1, 0(r3), 0, qr0
/* 800CA194 000C60B4  F0 23 00 28 */	psq_st f1, 40(r3), 0, qr0
/* 800CA198 000C60B8  4E 80 00 20 */	blr

glabel PSMTXCopy
/* 800CA19C 000C60BC  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 800CA1A0 000C60C0  F0 04 00 00 */	psq_st f0, 0(r4), 0, qr0
/* 800CA1A4 000C60C4  E0 23 00 08 */	psq_l f1, 8(r3), 0, qr0
/* 800CA1A8 000C60C8  F0 24 00 08 */	psq_st f1, 8(r4), 0, qr0
/* 800CA1AC 000C60CC  E0 43 00 10 */	psq_l f2, 16(r3), 0, qr0
/* 800CA1B0 000C60D0  F0 44 00 10 */	psq_st f2, 16(r4), 0, qr0
/* 800CA1B4 000C60D4  E0 63 00 18 */	psq_l f3, 24(r3), 0, qr0
/* 800CA1B8 000C60D8  F0 64 00 18 */	psq_st f3, 24(r4), 0, qr0
/* 800CA1BC 000C60DC  E0 83 00 20 */	psq_l f4, 32(r3), 0, qr0
/* 800CA1C0 000C60E0  F0 84 00 20 */	psq_st f4, 32(r4), 0, qr0
/* 800CA1C4 000C60E4  E0 A3 00 28 */	psq_l f5, 40(r3), 0, qr0
/* 800CA1C8 000C60E8  F0 A4 00 28 */	psq_st f5, 40(r4), 0, qr0
/* 800CA1CC 000C60EC  4E 80 00 20 */	blr

glabel PSMTXConcat
/* 800CA1D0 000C60F0  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800CA1D4 000C60F4  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 800CA1D8 000C60F8  D9 C1 00 08 */	stfd f14, 8(r1)
/* 800CA1DC 000C60FC  E0 C4 00 00 */	psq_l f6, 0(r4), 0, qr0
/* 800CA1E0 000C6100  3C C0 80 2F */	lis r6, Unit01@ha
/* 800CA1E4 000C6104  E0 E4 00 08 */	psq_l f7, 8(r4), 0, qr0
/* 800CA1E8 000C6108  D9 E1 00 10 */	stfd f15, 0x10(r1)
/* 800CA1EC 000C610C  38 C6 19 48 */	addi r6, r6, Unit01@l
/* 800CA1F0 000C6110  DB E1 00 28 */	stfd f31, 0x28(r1)
/* 800CA1F4 000C6114  E1 04 00 10 */	psq_l f8, 16(r4), 0, qr0
/* 800CA1F8 000C6118  11 86 00 18 */	ps_muls0 f12, f6, f0
/* 800CA1FC 000C611C  E0 43 00 10 */	psq_l f2, 16(r3), 0, qr0
/* 800CA200 000C6120  11 A7 00 18 */	ps_muls0 f13, f7, f0
/* 800CA204 000C6124  E3 E6 00 00 */	psq_l f31, 0(r6), 0, qr0
/* 800CA208 000C6128  11 C6 00 98 */	ps_muls0 f14, f6, f2
/* 800CA20C 000C612C  E1 24 00 18 */	psq_l f9, 24(r4), 0, qr0
/* 800CA210 000C6130  11 E7 00 98 */	ps_muls0 f15, f7, f2
/* 800CA214 000C6134  E0 23 00 08 */	psq_l f1, 8(r3), 0, qr0
/* 800CA218 000C6138  11 88 60 1E */	ps_madds1 f12, f8, f0, f12
/* 800CA21C 000C613C  E0 63 00 18 */	psq_l f3, 24(r3), 0, qr0
/* 800CA220 000C6140  11 C8 70 9E */	ps_madds1 f14, f8, f2, f14
/* 800CA224 000C6144  E1 44 00 20 */	psq_l f10, 32(r4), 0, qr0
/* 800CA228 000C6148  11 A9 68 1E */	ps_madds1 f13, f9, f0, f13
/* 800CA22C 000C614C  E1 64 00 28 */	psq_l f11, 40(r4), 0, qr0
/* 800CA230 000C6150  11 E9 78 9E */	ps_madds1 f15, f9, f2, f15
/* 800CA234 000C6154  E0 83 00 20 */	psq_l f4, 32(r3), 0, qr0
/* 800CA238 000C6158  E0 A3 00 28 */	psq_l f5, 40(r3), 0, qr0
/* 800CA23C 000C615C  11 8A 60 5C */	ps_madds0 f12, f10, f1, f12
/* 800CA240 000C6160  11 AB 68 5C */	ps_madds0 f13, f11, f1, f13
/* 800CA244 000C6164  11 CA 70 DC */	ps_madds0 f14, f10, f3, f14
/* 800CA248 000C6168  11 EB 78 DC */	ps_madds0 f15, f11, f3, f15
/* 800CA24C 000C616C  F1 85 00 00 */	psq_st f12, 0(r5), 0, qr0
/* 800CA250 000C6170  10 46 01 18 */	ps_muls0 f2, f6, f4
/* 800CA254 000C6174  11 BF 68 5E */	ps_madds1 f13, f31, f1, f13
/* 800CA258 000C6178  10 07 01 18 */	ps_muls0 f0, f7, f4
/* 800CA25C 000C617C  F1 C5 00 10 */	psq_st f14, 16(r5), 0, qr0
/* 800CA260 000C6180  11 FF 78 DE */	ps_madds1 f15, f31, f3, f15
/* 800CA264 000C6184  F1 A5 00 08 */	psq_st f13, 8(r5), 0, qr0
/* 800CA268 000C6188  10 48 11 1E */	ps_madds1 f2, f8, f4, f2
/* 800CA26C 000C618C  10 09 01 1E */	ps_madds1 f0, f9, f4, f0
/* 800CA270 000C6190  10 4A 11 5C */	ps_madds0 f2, f10, f5, f2
/* 800CA274 000C6194  C9 C1 00 08 */	lfd f14, 8(r1)
/* 800CA278 000C6198  F1 E5 00 18 */	psq_st f15, 24(r5), 0, qr0
/* 800CA27C 000C619C  10 0B 01 5C */	ps_madds0 f0, f11, f5, f0
/* 800CA280 000C61A0  F0 45 00 20 */	psq_st f2, 32(r5), 0, qr0
/* 800CA284 000C61A4  10 1F 01 5E */	ps_madds1 f0, f31, f5, f0
/* 800CA288 000C61A8  C9 E1 00 10 */	lfd f15, 0x10(r1)
/* 800CA28C 000C61AC  F0 05 00 28 */	psq_st f0, 40(r5), 0, qr0
/* 800CA290 000C61B0  CB E1 00 28 */	lfd f31, 0x28(r1)
/* 800CA294 000C61B4  38 21 00 40 */	addi r1, r1, 0x40
/* 800CA298 000C61B8  4E 80 00 20 */	blr

glabel PSMTXInverse
/* 800CA29C 000C61BC  E0 03 80 00 */	psq_l f0, 0(r3), 1, qr0
/* 800CA2A0 000C61C0  E0 23 00 04 */	psq_l f1, 4(r3), 0, qr0
/* 800CA2A4 000C61C4  E0 43 80 10 */	psq_l f2, 16(r3), 1, qr0
/* 800CA2A8 000C61C8  10 C1 04 A0 */	ps_merge10 f6, f1, f0
/* 800CA2AC 000C61CC  E0 63 00 14 */	psq_l f3, 20(r3), 0, qr0
/* 800CA2B0 000C61D0  E0 83 80 20 */	psq_l f4, 32(r3), 1, qr0
/* 800CA2B4 000C61D4  10 E3 14 A0 */	ps_merge10 f7, f3, f2
/* 800CA2B8 000C61D8  E0 A3 00 24 */	psq_l f5, 36(r3), 0, qr0
/* 800CA2BC 000C61DC  11 63 01 B2 */	ps_mul f11, f3, f6
/* 800CA2C0 000C61E0  11 A5 01 F2 */	ps_mul f13, f5, f7
/* 800CA2C4 000C61E4  11 05 24 A0 */	ps_merge10 f8, f5, f4
/* 800CA2C8 000C61E8  11 61 59 F8 */	ps_msub f11, f1, f7, f11
/* 800CA2CC 000C61EC  11 81 02 32 */	ps_mul f12, f1, f8
/* 800CA2D0 000C61F0  11 A3 6A 38 */	ps_msub f13, f3, f8, f13
/* 800CA2D4 000C61F4  11 43 01 32 */	ps_mul f10, f3, f4
/* 800CA2D8 000C61F8  11 85 61 B8 */	ps_msub f12, f5, f6, f12
/* 800CA2DC 000C61FC  11 20 01 72 */	ps_mul f9, f0, f5
/* 800CA2E0 000C6200  11 01 00 B2 */	ps_mul f8, f1, f2
/* 800CA2E4 000C6204  10 C6 30 28 */	ps_sub f6, f6, f6
/* 800CA2E8 000C6208  11 42 51 78 */	ps_msub f10, f2, f5, f10
/* 800CA2EC 000C620C  10 E0 03 72 */	ps_mul f7, f0, f13
/* 800CA2F0 000C6210  11 21 49 38 */	ps_msub f9, f1, f4, f9
/* 800CA2F4 000C6214  10 E2 3B 3A */	ps_madd f7, f2, f12, f7
/* 800CA2F8 000C6218  11 00 40 F8 */	ps_msub f8, f0, f3, f8
/* 800CA2FC 000C621C  10 E4 3A FA */	ps_madd f7, f4, f11, f7
/* 800CA300 000C6220  10 07 30 40 */	ps_cmpo0 cr0, f7, f6
/* 800CA304 000C6224  40 82 00 0C */	bne lbl_800CA310
/* 800CA308 000C6228  38 60 00 00 */	li r3, 0
/* 800CA30C 000C622C  4E 80 00 20 */	blr
lbl_800CA310:
/* 800CA310 000C6230  10 00 38 30 */	ps_res f0, f7
/* 800CA314 000C6234  10 C0 00 2A */	ps_add f6, f0, f0
/* 800CA318 000C6238  10 A0 00 32 */	ps_mul f5, f0, f0
/* 800CA31C 000C623C  10 07 31 7C */	ps_nmsub f0, f7, f5, f6
/* 800CA320 000C6240  10 C0 00 2A */	ps_add f6, f0, f0
/* 800CA324 000C6244  10 A0 00 32 */	ps_mul f5, f0, f0
/* 800CA328 000C6248  10 07 31 7C */	ps_nmsub f0, f7, f5, f6
/* 800CA32C 000C624C  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 800CA330 000C6250  11 AD 00 18 */	ps_muls0 f13, f13, f0
/* 800CA334 000C6254  C0 43 00 1C */	lfs f2, 0x1c(r3)
/* 800CA338 000C6258  11 8C 00 18 */	ps_muls0 f12, f12, f0
/* 800CA33C 000C625C  C0 63 00 2C */	lfs f3, 0x2c(r3)
/* 800CA340 000C6260  11 6B 00 18 */	ps_muls0 f11, f11, f0
/* 800CA344 000C6264  10 AD 64 20 */	ps_merge00 f5, f13, f12
/* 800CA348 000C6268  11 4A 00 18 */	ps_muls0 f10, f10, f0
/* 800CA34C 000C626C  10 8D 64 E0 */	ps_merge11 f4, f13, f12
/* 800CA350 000C6270  11 29 00 18 */	ps_muls0 f9, f9, f0
/* 800CA354 000C6274  F0 A4 00 00 */	psq_st f5, 0(r4), 0, qr0
/* 800CA358 000C6278  10 CD 00 72 */	ps_mul f6, f13, f1
/* 800CA35C 000C627C  F0 84 00 10 */	psq_st f4, 16(r4), 0, qr0
/* 800CA360 000C6280  11 08 00 18 */	ps_muls0 f8, f8, f0
/* 800CA364 000C6284  10 CC 30 BA */	ps_madd f6, f12, f2, f6
/* 800CA368 000C6288  F1 44 80 20 */	psq_st f10, 32(r4), 1, qr0
/* 800CA36C 000C628C  10 CB 30 FE */	ps_nmadd f6, f11, f3, f6
/* 800CA370 000C6290  F1 24 80 24 */	psq_st f9, 36(r4), 1, qr0
/* 800CA374 000C6294  10 EA 00 72 */	ps_mul f7, f10, f1
/* 800CA378 000C6298  10 AB 34 20 */	ps_merge00 f5, f11, f6
/* 800CA37C 000C629C  F1 04 80 28 */	psq_st f8, 40(r4), 1, qr0
/* 800CA380 000C62A0  10 8B 34 E0 */	ps_merge11 f4, f11, f6
/* 800CA384 000C62A4  F0 A4 00 08 */	psq_st f5, 8(r4), 0, qr0
/* 800CA388 000C62A8  10 E9 38 BA */	ps_madd f7, f9, f2, f7
/* 800CA38C 000C62AC  F0 84 00 18 */	psq_st f4, 24(r4), 0, qr0
/* 800CA390 000C62B0  10 E8 38 FE */	ps_nmadd f7, f8, f3, f7
/* 800CA394 000C62B4  38 60 00 01 */	li r3, 1
/* 800CA398 000C62B8  F0 E4 80 2C */	psq_st f7, 44(r4), 1, qr0
/* 800CA39C 000C62BC  4E 80 00 20 */	blr

.global C_MTXScale
C_MTXScale:
/* 800CA3A0 000C62C0  D0 23 00 00 */	stfs f1, 0(r3)
/* 800CA3A4 000C62C4  C0 02 BF 34 */	lfs f0, lbl_802F6734@sda21(r2)
/* 800CA3A8 000C62C8  D0 03 00 04 */	stfs f0, 4(r3)
/* 800CA3AC 000C62CC  D0 03 00 08 */	stfs f0, 8(r3)
/* 800CA3B0 000C62D0  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 800CA3B4 000C62D4  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 800CA3B8 000C62D8  D0 43 00 14 */	stfs f2, 0x14(r3)
/* 800CA3BC 000C62DC  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 800CA3C0 000C62E0  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 800CA3C4 000C62E4  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 800CA3C8 000C62E8  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 800CA3CC 000C62EC  D0 63 00 28 */	stfs f3, 0x28(r3)
/* 800CA3D0 000C62F0  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 800CA3D4 000C62F4  4E 80 00 20 */	blr

.global C_MTXQuat
C_MTXQuat:
/* 800CA3D8 000C62F8  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800CA3DC 000C62FC  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 800CA3E0 000C6300  DB C1 00 18 */	stfd f30, 0x18(r1)
/* 800CA3E4 000C6304  DB A1 00 10 */	stfd f29, 0x10(r1)
/* 800CA3E8 000C6308  C0 A4 00 00 */	lfs f5, 0(r4)
/* 800CA3EC 000C630C  C0 84 00 04 */	lfs f4, 4(r4)
/* 800CA3F0 000C6310  EC 25 01 72 */	fmuls f1, f5, f5
/* 800CA3F4 000C6314  C0 C4 00 08 */	lfs f6, 8(r4)
/* 800CA3F8 000C6318  EC 04 01 32 */	fmuls f0, f4, f4
/* 800CA3FC 000C631C  C1 04 00 0C */	lfs f8, 0xc(r4)
/* 800CA400 000C6320  EC 46 01 B2 */	fmuls f2, f6, f6
/* 800CA404 000C6324  EC 01 00 2A */	fadds f0, f1, f0
/* 800CA408 000C6328  C0 62 BF 38 */	lfs f3, lbl_802F6738@sda21(r2)
/* 800CA40C 000C632C  EC 28 02 32 */	fmuls f1, f8, f8
/* 800CA410 000C6330  C0 E2 BF 30 */	lfs f7, lbl_802F6730@sda21(r2)
/* 800CA414 000C6334  EC 02 00 2A */	fadds f0, f2, f0
/* 800CA418 000C6338  EC 01 00 2A */	fadds f0, f1, f0
/* 800CA41C 000C633C  EC 03 00 24 */	fdivs f0, f3, f0
/* 800CA420 000C6340  ED 46 00 32 */	fmuls f10, f6, f0
/* 800CA424 000C6344  EC 24 00 32 */	fmuls f1, f4, f0
/* 800CA428 000C6348  ED 25 00 32 */	fmuls f9, f5, f0
/* 800CA42C 000C634C  EF A6 02 B2 */	fmuls f29, f6, f10
/* 800CA430 000C6350  EF C4 00 72 */	fmuls f30, f4, f1
/* 800CA434 000C6354  ED 85 02 72 */	fmuls f12, f5, f9
/* 800CA438 000C6358  EC C8 02 B2 */	fmuls f6, f8, f10
/* 800CA43C 000C635C  ED A5 00 72 */	fmuls f13, f5, f1
/* 800CA440 000C6360  EC 1E E8 2A */	fadds f0, f30, f29
/* 800CA444 000C6364  ED 68 00 72 */	fmuls f11, f8, f1
/* 800CA448 000C6368  EF E5 02 B2 */	fmuls f31, f5, f10
/* 800CA44C 000C636C  EC 07 00 28 */	fsubs f0, f7, f0
/* 800CA450 000C6370  EC 6D 30 28 */	fsubs f3, f13, f6
/* 800CA454 000C6374  EC 5F 58 2A */	fadds f2, f31, f11
/* 800CA458 000C6378  D0 03 00 00 */	stfs f0, 0(r3)
/* 800CA45C 000C637C  EC 2C E8 2A */	fadds f1, f12, f29
/* 800CA460 000C6380  EC 0C F0 2A */	fadds f0, f12, f30
/* 800CA464 000C6384  D0 63 00 04 */	stfs f3, 4(r3)
/* 800CA468 000C6388  EC AD 30 2A */	fadds f5, f13, f6
/* 800CA46C 000C638C  D0 43 00 08 */	stfs f2, 8(r3)
/* 800CA470 000C6390  ED 08 02 72 */	fmuls f8, f8, f9
/* 800CA474 000C6394  ED 24 02 B2 */	fmuls f9, f4, f10
/* 800CA478 000C6398  C0 C2 BF 34 */	lfs f6, lbl_802F6734@sda21(r2)
/* 800CA47C 000C639C  EC 87 08 28 */	fsubs f4, f7, f1
/* 800CA480 000C63A0  D0 C3 00 0C */	stfs f6, 0xc(r3)
/* 800CA484 000C63A4  EC 69 40 28 */	fsubs f3, f9, f8
/* 800CA488 000C63A8  EC 5F 58 28 */	fsubs f2, f31, f11
/* 800CA48C 000C63AC  D0 A3 00 10 */	stfs f5, 0x10(r3)
/* 800CA490 000C63B0  EC 29 40 2A */	fadds f1, f9, f8
/* 800CA494 000C63B4  D0 83 00 14 */	stfs f4, 0x14(r3)
/* 800CA498 000C63B8  EC 07 00 28 */	fsubs f0, f7, f0
/* 800CA49C 000C63BC  D0 63 00 18 */	stfs f3, 0x18(r3)
/* 800CA4A0 000C63C0  D0 C3 00 1C */	stfs f6, 0x1c(r3)
/* 800CA4A4 000C63C4  D0 43 00 20 */	stfs f2, 0x20(r3)
/* 800CA4A8 000C63C8  D0 23 00 24 */	stfs f1, 0x24(r3)
/* 800CA4AC 000C63CC  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 800CA4B0 000C63D0  D0 C3 00 2C */	stfs f6, 0x2c(r3)
/* 800CA4B4 000C63D4  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 800CA4B8 000C63D8  CB C1 00 18 */	lfd f30, 0x18(r1)
/* 800CA4BC 000C63DC  CB A1 00 10 */	lfd f29, 0x10(r1)
/* 800CA4C0 000C63E0  38 21 00 28 */	addi r1, r1, 0x28
/* 800CA4C4 000C63E4  4E 80 00 20 */	blr

.global C_MTXLookAt
C_MTXLookAt:
/* 800CA4C8 000C63E8  7C 08 02 A6 */	mflr r0
/* 800CA4CC 000C63EC  90 01 00 04 */	stw r0, 4(r1)
/* 800CA4D0 000C63F0  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 800CA4D4 000C63F4  93 E1 00 4C */	stw r31, 0x4c(r1)
/* 800CA4D8 000C63F8  93 C1 00 48 */	stw r30, 0x48(r1)
/* 800CA4DC 000C63FC  93 A1 00 44 */	stw r29, 0x44(r1)
/* 800CA4E0 000C6400  7C 7D 1B 78 */	mr r29, r3
/* 800CA4E4 000C6404  7C 9E 23 78 */	mr r30, r4
/* 800CA4E8 000C6408  7C BF 2B 78 */	mr r31, r5
/* 800CA4EC 000C640C  C0 3E 00 00 */	lfs f1, 0(r30)
/* 800CA4F0 000C6410  38 61 00 30 */	addi r3, r1, 0x30
/* 800CA4F4 000C6414  C0 06 00 00 */	lfs f0, 0(r6)
/* 800CA4F8 000C6418  7C 64 1B 78 */	mr r4, r3
/* 800CA4FC 000C641C  EC 01 00 28 */	fsubs f0, f1, f0
/* 800CA500 000C6420  D0 01 00 30 */	stfs f0, 0x30(r1)
/* 800CA504 000C6424  C0 3E 00 04 */	lfs f1, 4(r30)
/* 800CA508 000C6428  C0 06 00 04 */	lfs f0, 4(r6)
/* 800CA50C 000C642C  EC 01 00 28 */	fsubs f0, f1, f0
/* 800CA510 000C6430  D0 01 00 34 */	stfs f0, 0x34(r1)
/* 800CA514 000C6434  C0 3E 00 08 */	lfs f1, 8(r30)
/* 800CA518 000C6438  C0 06 00 08 */	lfs f0, 8(r6)
/* 800CA51C 000C643C  EC 01 00 28 */	fsubs f0, f1, f0
/* 800CA520 000C6440  D0 01 00 38 */	stfs f0, 0x38(r1)
/* 800CA524 000C6444  48 00 03 35 */	bl PSVECNormalize
/* 800CA528 000C6448  7F E3 FB 78 */	mr r3, r31
/* 800CA52C 000C644C  38 81 00 30 */	addi r4, r1, 0x30
/* 800CA530 000C6450  38 A1 00 24 */	addi r5, r1, 0x24
/* 800CA534 000C6454  48 00 03 6D */	bl PSVECCrossProduct
/* 800CA538 000C6458  38 61 00 24 */	addi r3, r1, 0x24
/* 800CA53C 000C645C  7C 64 1B 78 */	mr r4, r3
/* 800CA540 000C6460  48 00 03 19 */	bl PSVECNormalize
/* 800CA544 000C6464  38 61 00 30 */	addi r3, r1, 0x30
/* 800CA548 000C6468  38 81 00 24 */	addi r4, r1, 0x24
/* 800CA54C 000C646C  38 A1 00 18 */	addi r5, r1, 0x18
/* 800CA550 000C6470  48 00 03 51 */	bl PSVECCrossProduct
/* 800CA554 000C6474  C0 01 00 24 */	lfs f0, 0x24(r1)
/* 800CA558 000C6478  D0 1D 00 00 */	stfs f0, 0(r29)
/* 800CA55C 000C647C  C0 01 00 28 */	lfs f0, 0x28(r1)
/* 800CA560 000C6480  D0 1D 00 04 */	stfs f0, 4(r29)
/* 800CA564 000C6484  C0 01 00 2C */	lfs f0, 0x2c(r1)
/* 800CA568 000C6488  D0 1D 00 08 */	stfs f0, 8(r29)
/* 800CA56C 000C648C  C0 7E 00 00 */	lfs f3, 0(r30)
/* 800CA570 000C6490  C0 41 00 24 */	lfs f2, 0x24(r1)
/* 800CA574 000C6494  C0 3E 00 04 */	lfs f1, 4(r30)
/* 800CA578 000C6498  C0 01 00 28 */	lfs f0, 0x28(r1)
/* 800CA57C 000C649C  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800CA580 000C64A0  C0 7E 00 08 */	lfs f3, 8(r30)
/* 800CA584 000C64A4  EC 01 00 32 */	fmuls f0, f1, f0
/* 800CA588 000C64A8  C0 21 00 2C */	lfs f1, 0x2c(r1)
/* 800CA58C 000C64AC  EC 23 00 72 */	fmuls f1, f3, f1
/* 800CA590 000C64B0  EC 02 00 2A */	fadds f0, f2, f0
/* 800CA594 000C64B4  EC 01 00 2A */	fadds f0, f1, f0
/* 800CA598 000C64B8  FC 00 00 50 */	fneg f0, f0
/* 800CA59C 000C64BC  D0 1D 00 0C */	stfs f0, 0xc(r29)
/* 800CA5A0 000C64C0  C0 01 00 18 */	lfs f0, 0x18(r1)
/* 800CA5A4 000C64C4  D0 1D 00 10 */	stfs f0, 0x10(r29)
/* 800CA5A8 000C64C8  C0 01 00 1C */	lfs f0, 0x1c(r1)
/* 800CA5AC 000C64CC  D0 1D 00 14 */	stfs f0, 0x14(r29)
/* 800CA5B0 000C64D0  C0 01 00 20 */	lfs f0, 0x20(r1)
/* 800CA5B4 000C64D4  D0 1D 00 18 */	stfs f0, 0x18(r29)
/* 800CA5B8 000C64D8  C0 7E 00 00 */	lfs f3, 0(r30)
/* 800CA5BC 000C64DC  C0 41 00 18 */	lfs f2, 0x18(r1)
/* 800CA5C0 000C64E0  C0 3E 00 04 */	lfs f1, 4(r30)
/* 800CA5C4 000C64E4  C0 01 00 1C */	lfs f0, 0x1c(r1)
/* 800CA5C8 000C64E8  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800CA5CC 000C64EC  C0 7E 00 08 */	lfs f3, 8(r30)
/* 800CA5D0 000C64F0  EC 01 00 32 */	fmuls f0, f1, f0
/* 800CA5D4 000C64F4  C0 21 00 20 */	lfs f1, 0x20(r1)
/* 800CA5D8 000C64F8  EC 23 00 72 */	fmuls f1, f3, f1
/* 800CA5DC 000C64FC  EC 02 00 2A */	fadds f0, f2, f0
/* 800CA5E0 000C6500  EC 01 00 2A */	fadds f0, f1, f0
/* 800CA5E4 000C6504  FC 00 00 50 */	fneg f0, f0
/* 800CA5E8 000C6508  D0 1D 00 1C */	stfs f0, 0x1c(r29)
/* 800CA5EC 000C650C  C0 01 00 30 */	lfs f0, 0x30(r1)
/* 800CA5F0 000C6510  D0 1D 00 20 */	stfs f0, 0x20(r29)
/* 800CA5F4 000C6514  C0 01 00 34 */	lfs f0, 0x34(r1)
/* 800CA5F8 000C6518  D0 1D 00 24 */	stfs f0, 0x24(r29)
/* 800CA5FC 000C651C  C0 01 00 38 */	lfs f0, 0x38(r1)
/* 800CA600 000C6520  D0 1D 00 28 */	stfs f0, 0x28(r29)
/* 800CA604 000C6524  C0 7E 00 00 */	lfs f3, 0(r30)
/* 800CA608 000C6528  C0 41 00 30 */	lfs f2, 0x30(r1)
/* 800CA60C 000C652C  C0 3E 00 04 */	lfs f1, 4(r30)
/* 800CA610 000C6530  C0 01 00 34 */	lfs f0, 0x34(r1)
/* 800CA614 000C6534  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800CA618 000C6538  C0 7E 00 08 */	lfs f3, 8(r30)
/* 800CA61C 000C653C  EC 01 00 32 */	fmuls f0, f1, f0
/* 800CA620 000C6540  C0 21 00 38 */	lfs f1, 0x38(r1)
/* 800CA624 000C6544  EC 23 00 72 */	fmuls f1, f3, f1
/* 800CA628 000C6548  EC 02 00 2A */	fadds f0, f2, f0
/* 800CA62C 000C654C  EC 01 00 2A */	fadds f0, f1, f0
/* 800CA630 000C6550  FC 00 00 50 */	fneg f0, f0
/* 800CA634 000C6554  D0 1D 00 2C */	stfs f0, 0x2c(r29)
/* 800CA638 000C6558  80 01 00 54 */	lwz r0, 0x54(r1)
/* 800CA63C 000C655C  83 E1 00 4C */	lwz r31, 0x4c(r1)
/* 800CA640 000C6560  83 C1 00 48 */	lwz r30, 0x48(r1)
/* 800CA644 000C6564  7C 08 03 A6 */	mtlr r0
/* 800CA648 000C6568  83 A1 00 44 */	lwz r29, 0x44(r1)
/* 800CA64C 000C656C  38 21 00 50 */	addi r1, r1, 0x50
/* 800CA650 000C6570  4E 80 00 20 */	blr

.section .sdata

.global Unit01
Unit01:
	# ROM: 0x1EC088
	.4byte 0
	.4byte 0x3F800000

.section .sdata2

.global lbl_802F6730
lbl_802F6730:
	# ROM: 0x1F0150
	.4byte 0x3F800000

.global lbl_802F6734
lbl_802F6734:
	# ROM: 0x1F0154
	.4byte 0

.global lbl_802F6738
lbl_802F6738:
	# ROM: 0x1F0158
	.4byte 0x40000000
	.4byte 0
