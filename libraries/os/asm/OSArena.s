.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global OSGetArenaHi
OSGetArenaHi:
/* 800C2C90 000BEBB0  80 6D A1 18 */	lwz r3, __OSArenaHi@sda21(r13)
/* 800C2C94 000BEBB4  4E 80 00 20 */	blr

.global OSGetArenaLo
OSGetArenaLo:
/* 800C2C98 000BEBB8  80 6D 97 50 */	lwz r3, __OSArenaLo@sda21(r13)
/* 800C2C9C 000BEBBC  4E 80 00 20 */	blr

.global OSSetArenaHi
OSSetArenaHi:
/* 800C2CA0 000BEBC0  90 6D A1 18 */	stw r3, __OSArenaHi@sda21(r13)
/* 800C2CA4 000BEBC4  4E 80 00 20 */	blr

.global OSSetArenaLo
OSSetArenaLo:
/* 800C2CA8 000BEBC8  90 6D 97 50 */	stw r3, __OSArenaLo@sda21(r13)
/* 800C2CAC 000BEBCC  4E 80 00 20 */	blr

.section .sdata

.global __OSArenaLo
__OSArenaLo:
	# ROM: 0x1EC070
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.4byte 0

.section .sbss

.global __OSArenaHi
__OSArenaHi:
	.skip 0x8
