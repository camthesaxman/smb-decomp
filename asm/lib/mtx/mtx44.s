.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global C_MTXFrustum
C_MTXFrustum:
/* 800CA654 000C6574  ED 24 18 28 */	fsubs f9, f4, f3
/* 800CA658 000C6578  C1 42 BF 40 */	lfs f10, lbl_802F6740-_SDA2_BASE_(r2)
/* 800CA65C 000C657C  EC 01 10 28 */	fsubs f0, f1, f2
/* 800CA660 000C6580  C1 02 BF 44 */	lfs f8, lbl_802F6744-_SDA2_BASE_(r2)
/* 800CA664 000C6584  EC E6 28 28 */	fsubs f7, f6, f5
/* 800CA668 000C6588  ED 6A 48 24 */	fdivs f11, f10, f9
/* 800CA66C 000C658C  ED 08 01 72 */	fmuls f8, f8, f5
/* 800CA670 000C6590  ED 2A 00 24 */	fdivs f9, f10, f0
/* 800CA674 000C6594  EC 08 02 F2 */	fmuls f0, f8, f11
/* 800CA678 000C6598  EC 64 18 2A */	fadds f3, f4, f3
/* 800CA67C 000C659C  EC 41 10 2A */	fadds f2, f1, f2
/* 800CA680 000C65A0  D0 03 00 00 */	stfs f0, 0(r3)
/* 800CA684 000C65A4  EC 06 01 72 */	fmuls f0, f6, f5
/* 800CA688 000C65A8  EC CA 38 24 */	fdivs f6, f10, f7
/* 800CA68C 000C65AC  C0 82 BF 48 */	lfs f4, lbl_802F6748-_SDA2_BASE_(r2)
/* 800CA690 000C65B0  D0 83 00 04 */	stfs f4, 4(r3)
/* 800CA694 000C65B4  EC 6B 00 F2 */	fmuls f3, f11, f3
/* 800CA698 000C65B8  FC 20 28 50 */	fneg f1, f5
/* 800CA69C 000C65BC  FC 00 00 50 */	fneg f0, f0
/* 800CA6A0 000C65C0  D0 63 00 08 */	stfs f3, 8(r3)
/* 800CA6A4 000C65C4  EC 68 02 72 */	fmuls f3, f8, f9
/* 800CA6A8 000C65C8  EC 49 00 B2 */	fmuls f2, f9, f2
/* 800CA6AC 000C65CC  D0 83 00 0C */	stfs f4, 0xc(r3)
/* 800CA6B0 000C65D0  EC 21 01 B2 */	fmuls f1, f1, f6
/* 800CA6B4 000C65D4  D0 83 00 10 */	stfs f4, 0x10(r3)
/* 800CA6B8 000C65D8  EC 06 00 32 */	fmuls f0, f6, f0
/* 800CA6BC 000C65DC  D0 63 00 14 */	stfs f3, 0x14(r3)
/* 800CA6C0 000C65E0  D0 43 00 18 */	stfs f2, 0x18(r3)
/* 800CA6C4 000C65E4  D0 83 00 1C */	stfs f4, 0x1c(r3)
/* 800CA6C8 000C65E8  D0 83 00 20 */	stfs f4, 0x20(r3)
/* 800CA6CC 000C65EC  D0 83 00 24 */	stfs f4, 0x24(r3)
/* 800CA6D0 000C65F0  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 800CA6D4 000C65F4  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 800CA6D8 000C65F8  D0 83 00 30 */	stfs f4, 0x30(r3)
/* 800CA6DC 000C65FC  D0 83 00 34 */	stfs f4, 0x34(r3)
/* 800CA6E0 000C6600  C0 02 BF 4C */	lfs f0, lbl_802F674C-_SDA2_BASE_(r2)
/* 800CA6E4 000C6604  D0 03 00 38 */	stfs f0, 0x38(r3)
/* 800CA6E8 000C6608  D0 83 00 3C */	stfs f4, 0x3c(r3)
/* 800CA6EC 000C660C  4E 80 00 20 */	blr 

.global C_MTXPerspective
C_MTXPerspective:
/* 800CA6F0 000C6610  7C 08 02 A6 */	mflr r0
/* 800CA6F4 000C6614  90 01 00 04 */	stw r0, 4(r1)
/* 800CA6F8 000C6618  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800CA6FC 000C661C  DB E1 00 38 */	stfd f31, 0x38(r1)
/* 800CA700 000C6620  FF E0 20 90 */	fmr f31, f4
/* 800CA704 000C6624  DB C1 00 30 */	stfd f30, 0x30(r1)
/* 800CA708 000C6628  FF C0 18 90 */	fmr f30, f3
/* 800CA70C 000C662C  DB A1 00 28 */	stfd f29, 0x28(r1)
/* 800CA710 000C6630  FF A0 10 90 */	fmr f29, f2
/* 800CA714 000C6634  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800CA718 000C6638  7C 7F 1B 78 */	mr r31, r3
/* 800CA71C 000C663C  C0 A2 BF 50 */	lfs f5, lbl_802F6750-_SDA2_BASE_(r2)
/* 800CA720 000C6640  C0 02 BF 54 */	lfs f0, lbl_802F6754-_SDA2_BASE_(r2)
/* 800CA724 000C6644  EC 25 00 72 */	fmuls f1, f5, f1
/* 800CA728 000C6648  EC 20 00 72 */	fmuls f1, f0, f1
/* 800CA72C 000C664C  48 03 E5 71 */	bl tanf
/* 800CA730 000C6650  C0 62 BF 40 */	lfs f3, lbl_802F6740-_SDA2_BASE_(r2)
/* 800CA734 000C6654  EC 5F F0 28 */	fsubs f2, f31, f30
/* 800CA738 000C6658  EC 1F 07 B2 */	fmuls f0, f31, f30
/* 800CA73C 000C665C  EC 83 08 24 */	fdivs f4, f3, f1
/* 800CA740 000C6660  EC 24 E8 24 */	fdivs f1, f4, f29
/* 800CA744 000C6664  D0 3F 00 00 */	stfs f1, 0(r31)
/* 800CA748 000C6668  EC 63 10 24 */	fdivs f3, f3, f2
/* 800CA74C 000C666C  C0 42 BF 48 */	lfs f2, lbl_802F6748-_SDA2_BASE_(r2)
/* 800CA750 000C6670  D0 5F 00 04 */	stfs f2, 4(r31)
/* 800CA754 000C6674  D0 5F 00 08 */	stfs f2, 8(r31)
/* 800CA758 000C6678  D0 5F 00 0C */	stfs f2, 0xc(r31)
/* 800CA75C 000C667C  D0 5F 00 10 */	stfs f2, 0x10(r31)
/* 800CA760 000C6680  FC 20 F0 50 */	fneg f1, f30
/* 800CA764 000C6684  FC 00 00 50 */	fneg f0, f0
/* 800CA768 000C6688  D0 9F 00 14 */	stfs f4, 0x14(r31)
/* 800CA76C 000C668C  EC 21 00 F2 */	fmuls f1, f1, f3
/* 800CA770 000C6690  D0 5F 00 18 */	stfs f2, 0x18(r31)
/* 800CA774 000C6694  EC 03 00 32 */	fmuls f0, f3, f0
/* 800CA778 000C6698  D0 5F 00 1C */	stfs f2, 0x1c(r31)
/* 800CA77C 000C669C  D0 5F 00 20 */	stfs f2, 0x20(r31)
/* 800CA780 000C66A0  D0 5F 00 24 */	stfs f2, 0x24(r31)
/* 800CA784 000C66A4  D0 3F 00 28 */	stfs f1, 0x28(r31)
/* 800CA788 000C66A8  D0 1F 00 2C */	stfs f0, 0x2c(r31)
/* 800CA78C 000C66AC  D0 5F 00 30 */	stfs f2, 0x30(r31)
/* 800CA790 000C66B0  D0 5F 00 34 */	stfs f2, 0x34(r31)
/* 800CA794 000C66B4  C0 02 BF 4C */	lfs f0, lbl_802F674C-_SDA2_BASE_(r2)
/* 800CA798 000C66B8  D0 1F 00 38 */	stfs f0, 0x38(r31)
/* 800CA79C 000C66BC  D0 5F 00 3C */	stfs f2, 0x3c(r31)
/* 800CA7A0 000C66C0  80 01 00 44 */	lwz r0, 0x44(r1)
/* 800CA7A4 000C66C4  CB E1 00 38 */	lfd f31, 0x38(r1)
/* 800CA7A8 000C66C8  CB C1 00 30 */	lfd f30, 0x30(r1)
/* 800CA7AC 000C66CC  CB A1 00 28 */	lfd f29, 0x28(r1)
/* 800CA7B0 000C66D0  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800CA7B4 000C66D4  38 21 00 40 */	addi r1, r1, 0x40
/* 800CA7B8 000C66D8  7C 08 03 A6 */	mtlr r0
/* 800CA7BC 000C66DC  4E 80 00 20 */	blr 

.global C_MTXOrtho
C_MTXOrtho:
/* 800CA7C0 000C66E0  ED 04 18 28 */	fsubs f8, f4, f3
/* 800CA7C4 000C66E4  C1 22 BF 40 */	lfs f9, lbl_802F6740-_SDA2_BASE_(r2)
/* 800CA7C8 000C66E8  EC 01 10 28 */	fsubs f0, f1, f2
/* 800CA7CC 000C66EC  C0 E2 BF 44 */	lfs f7, lbl_802F6744-_SDA2_BASE_(r2)
/* 800CA7D0 000C66F0  EC 64 18 2A */	fadds f3, f4, f3
/* 800CA7D4 000C66F4  ED 49 40 24 */	fdivs f10, f9, f8
/* 800CA7D8 000C66F8  ED 09 00 24 */	fdivs f8, f9, f0
/* 800CA7DC 000C66FC  EC 87 02 B2 */	fmuls f4, f7, f10
/* 800CA7E0 000C6700  FC 60 18 50 */	fneg f3, f3
/* 800CA7E4 000C6704  EC 06 28 28 */	fsubs f0, f6, f5
/* 800CA7E8 000C6708  D0 83 00 00 */	stfs f4, 0(r3)
/* 800CA7EC 000C670C  EC 21 10 2A */	fadds f1, f1, f2
/* 800CA7F0 000C6710  EC 4A 00 F2 */	fmuls f2, f10, f3
/* 800CA7F4 000C6714  C0 62 BF 48 */	lfs f3, lbl_802F6748-_SDA2_BASE_(r2)
/* 800CA7F8 000C6718  FC 20 08 50 */	fneg f1, f1
/* 800CA7FC 000C671C  D0 63 00 04 */	stfs f3, 4(r3)
/* 800CA800 000C6720  EC 89 00 24 */	fdivs f4, f9, f0
/* 800CA804 000C6724  D0 63 00 08 */	stfs f3, 8(r3)
/* 800CA808 000C6728  D0 43 00 0C */	stfs f2, 0xc(r3)
/* 800CA80C 000C672C  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 800CA810 000C6730  EC 47 02 32 */	fmuls f2, f7, f8
/* 800CA814 000C6734  FC 00 30 50 */	fneg f0, f6
/* 800CA818 000C6738  EC 28 00 72 */	fmuls f1, f8, f1
/* 800CA81C 000C673C  D0 43 00 14 */	stfs f2, 0x14(r3)
/* 800CA820 000C6740  EC 00 01 32 */	fmuls f0, f0, f4
/* 800CA824 000C6744  D0 63 00 18 */	stfs f3, 0x18(r3)
/* 800CA828 000C6748  D0 23 00 1C */	stfs f1, 0x1c(r3)
/* 800CA82C 000C674C  D0 63 00 20 */	stfs f3, 0x20(r3)
/* 800CA830 000C6750  D0 63 00 24 */	stfs f3, 0x24(r3)
/* 800CA834 000C6754  C0 22 BF 4C */	lfs f1, lbl_802F674C-_SDA2_BASE_(r2)
/* 800CA838 000C6758  EC 21 01 32 */	fmuls f1, f1, f4
/* 800CA83C 000C675C  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 800CA840 000C6760  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 800CA844 000C6764  D0 63 00 30 */	stfs f3, 0x30(r3)
/* 800CA848 000C6768  D0 63 00 34 */	stfs f3, 0x34(r3)
/* 800CA84C 000C676C  D0 63 00 38 */	stfs f3, 0x38(r3)
/* 800CA850 000C6770  D1 23 00 3C */	stfs f9, 0x3c(r3)
/* 800CA854 000C6774  4E 80 00 20 */	blr 