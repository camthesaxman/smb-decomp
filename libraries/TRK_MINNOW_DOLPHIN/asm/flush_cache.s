.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRK_flush_cache
TRK_flush_cache:
/* 8010C0D0 00107FF0  3C A0 FF FF */	lis r5, 0xFFFFFFF1@h
/* 8010C0D4 00107FF4  60 A5 FF F1 */	ori r5, r5, 0xFFFFFFF1@l
/* 8010C0D8 00107FF8  7C A5 18 38 */	and r5, r5, r3
/* 8010C0DC 00107FFC  7C 65 18 50 */	subf r3, r5, r3
/* 8010C0E0 00108000  7C 84 1A 14 */	add r4, r4, r3
lbl_8010C0E4:
/* 8010C0E4 00108004  7C 00 28 6C */	dcbst 0, r5
/* 8010C0E8 00108008  7C 00 28 AC */	dcbf 0, r5
/* 8010C0EC 0010800C  7C 00 04 AC */	sync 0
/* 8010C0F0 00108010  7C 00 2F AC */	icbi 0, r5
/* 8010C0F4 00108014  30 A5 00 08 */	addic r5, r5, 8
/* 8010C0F8 00108018  34 84 FF F8 */	addic. r4, r4, -8
/* 8010C0FC 0010801C  40 80 FF E8 */	bge lbl_8010C0E4
/* 8010C100 00108020  4C 00 01 2C */	isync
/* 8010C104 00108024  4E 80 00 20 */	blr
