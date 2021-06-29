.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global PPCMfmsr
PPCMfmsr:
/* 800C1700 000BD620  7C 60 00 A6 */	mfmsr r3
/* 800C1704 000BD624  4E 80 00 20 */	blr 

.global PPCMtmsr
PPCMtmsr:
/* 800C1708 000BD628  7C 60 01 24 */	mtmsr r3
/* 800C170C 000BD62C  4E 80 00 20 */	blr 

.global PPCMfhid0
PPCMfhid0:
/* 800C1710 000BD630  7C 70 FA A6 */	mfspr r3, 0x3f0
/* 800C1714 000BD634  4E 80 00 20 */	blr 

.global PPCMfl2cr
PPCMfl2cr:
/* 800C1718 000BD638  7C 79 FA A6 */	mfspr r3, 0x3f9
/* 800C171C 000BD63C  4E 80 00 20 */	blr 

.global PPCMtl2cr
PPCMtl2cr:
/* 800C1720 000BD640  7C 79 FB A6 */	mtspr 0x3f9, r3
/* 800C1724 000BD644  4E 80 00 20 */	blr 

.global PPCMtdec
PPCMtdec:
/* 800C1728 000BD648  7C 76 03 A6 */	mtspr 0x16, r3
/* 800C172C 000BD64C  4E 80 00 20 */	blr 

.global PPCSync
PPCSync:
/* 800C1730 000BD650  44 00 00 02 */	sc 
/* 800C1734 000BD654  4E 80 00 20 */	blr 

.global PPCHalt
PPCHalt:
/* 800C1738 000BD658  7C 00 04 AC */	sync 0
lbl_800C173C:
/* 800C173C 000BD65C  60 00 00 00 */	nop 
/* 800C1740 000BD660  38 60 00 00 */	li r3, 0
/* 800C1744 000BD664  60 00 00 00 */	nop 
/* 800C1748 000BD668  4B FF FF F4 */	b lbl_800C173C

.global PPCMtmmcr0
PPCMtmmcr0:
/* 800C174C 000BD66C  7C 78 EB A6 */	mtspr 0x3b8, r3
/* 800C1750 000BD670  4E 80 00 20 */	blr 

.global PPCMtmmcr1
PPCMtmmcr1:
/* 800C1754 000BD674  7C 7C EB A6 */	mtspr 0x3bc, r3
/* 800C1758 000BD678  4E 80 00 20 */	blr 

.global PPCMfpmc1
PPCMfpmc1:
/* 800C175C 000BD67C  7C 79 EA A6 */	mfspr r3, 0x3b9
/* 800C1760 000BD680  4E 80 00 20 */	blr 

.global PPCMtpmc1
PPCMtpmc1:
/* 800C1764 000BD684  7C 79 EB A6 */	mtspr 0x3b9, r3
/* 800C1768 000BD688  4E 80 00 20 */	blr 

.global PPCMtpmc2
PPCMtpmc2:
/* 800C176C 000BD68C  7C 7A EB A6 */	mtspr 0x3ba, r3
/* 800C1770 000BD690  4E 80 00 20 */	blr 

.global PPCMfpmc3
PPCMfpmc3:
/* 800C1774 000BD694  7C 7D EA A6 */	mfspr r3, 0x3bd
/* 800C1778 000BD698  4E 80 00 20 */	blr 

.global PPCMtpmc3
PPCMtpmc3:
/* 800C177C 000BD69C  7C 7D EB A6 */	mtspr 0x3bd, r3
/* 800C1780 000BD6A0  4E 80 00 20 */	blr 

.global PPCMfpmc4
PPCMfpmc4:
/* 800C1784 000BD6A4  7C 7E EA A6 */	mfspr r3, 0x3be
/* 800C1788 000BD6A8  4E 80 00 20 */	blr 

.global PPCMtpmc4
PPCMtpmc4:
/* 800C178C 000BD6AC  7C 7E EB A6 */	mtspr 0x3be, r3
/* 800C1790 000BD6B0  4E 80 00 20 */	blr 

.global PPCMfhid2
PPCMfhid2:
/* 800C1794 000BD6B4  7C 78 E2 A6 */	mfspr r3, 0x398
/* 800C1798 000BD6B8  4E 80 00 20 */	blr 

.global PPCMthid2
PPCMthid2:
/* 800C179C 000BD6BC  7C 78 E3 A6 */	mtspr 0x398, r3
/* 800C17A0 000BD6C0  4E 80 00 20 */	blr 

.global PPCMtwpar
PPCMtwpar:
/* 800C17A4 000BD6C4  7C 79 E3 A6 */	mtspr 0x399, r3
/* 800C17A8 000BD6C8  4E 80 00 20 */	blr 
