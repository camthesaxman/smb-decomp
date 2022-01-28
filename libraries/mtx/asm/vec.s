.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global PSVECNormalize
PSVECNormalize:
/* 800CA858 000C6778  C0 02 BF 58 */	lfs f0, lbl_802F6758@sda21(r2)
/* 800CA85C 000C677C  C0 22 BF 5C */	lfs f1, lbl_802F675C@sda21(r2)
/* 800CA860 000C6780  E0 43 00 00 */	psq_l f2, 0(r3), 0, qr0
/* 800CA864 000C6784  10 A2 00 B2 */	ps_mul f5, f2, f2
/* 800CA868 000C6788  E0 63 80 08 */	psq_l f3, 8(r3), 1, qr0
/* 800CA86C 000C678C  10 83 28 FA */	ps_madd f4, f3, f3, f5
/* 800CA870 000C6790  10 84 28 D4 */	ps_sum0 f4, f4, f3, f5
/* 800CA874 000C6794  10 A0 20 34 */	ps_rsqrte f5, f4
/* 800CA878 000C6798  EC C5 01 72 */	fmuls f6, f5, f5
/* 800CA87C 000C679C  EC 05 00 32 */	fmuls f0, f5, f0
/* 800CA880 000C67A0  EC C6 01 32 */	fmuls f6, f6, f4
/* 800CA884 000C67A4  EC C1 30 28 */	fsubs f6, f1, f6
/* 800CA888 000C67A8  EC A6 00 32 */	fmuls f5, f6, f0
/* 800CA88C 000C67AC  10 42 01 58 */	ps_muls0 f2, f2, f5
/* 800CA890 000C67B0  F0 44 00 00 */	psq_st f2, 0(r4), 0, qr0
/* 800CA894 000C67B4  10 63 01 58 */	ps_muls0 f3, f3, f5
/* 800CA898 000C67B8  F0 64 80 08 */	psq_st f3, 8(r4), 1, qr0
/* 800CA89C 000C67BC  4E 80 00 20 */	blr

.global PSVECCrossProduct
PSVECCrossProduct:
/* 800CA8A0 000C67C0  E0 24 00 00 */	psq_l f1, 0(r4), 0, qr0
/* 800CA8A4 000C67C4  C0 43 00 08 */	lfs f2, 8(r3)
/* 800CA8A8 000C67C8  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 800CA8AC 000C67CC  10 C1 0C A0 */	ps_merge10 f6, f1, f1
/* 800CA8B0 000C67D0  C0 64 00 08 */	lfs f3, 8(r4)
/* 800CA8B4 000C67D4  10 81 00 B2 */	ps_mul f4, f1, f2
/* 800CA8B8 000C67D8  10 E1 00 18 */	ps_muls0 f7, f1, f0
/* 800CA8BC 000C67DC  10 A0 20 F8 */	ps_msub f5, f0, f3, f4
/* 800CA8C0 000C67E0  11 00 39 B8 */	ps_msub f8, f0, f6, f7
/* 800CA8C4 000C67E4  11 25 2C E0 */	ps_merge11 f9, f5, f5
/* 800CA8C8 000C67E8  11 45 44 60 */	ps_merge01 f10, f5, f8
/* 800CA8CC 000C67EC  F1 25 80 00 */	psq_st f9, 0(r5), 1, qr0
/* 800CA8D0 000C67F0  11 40 50 50 */	ps_neg f10, f10
/* 800CA8D4 000C67F4  F1 45 00 04 */	psq_st f10, 4(r5), 0, qr0
/* 800CA8D8 000C67F8  4E 80 00 20 */	blr

.section .sdata2

.global lbl_802F6758
lbl_802F6758:
	# ROM: 0x1F0178
	.byte 0x3F, 0x00, 0x00, 0x00

.global lbl_802F675C
lbl_802F675C:
	# ROM: 0x1F017C
	.byte 0x40, 0x40, 0x00, 0x00
