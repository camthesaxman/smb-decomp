.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global srand
srand:
/* 8010685C 0010277C  90 6D 98 C8 */	stw r3, next@sda21(r13)
/* 80106860 00102780  4E 80 00 20 */	blr

.global rand
rand:
/* 80106864 00102784  3C 60 41 C6 */	lis r3, 0x41C64E6D@ha
/* 80106868 00102788  80 8D 98 C8 */	lwz r4, next@sda21(r13)
/* 8010686C 0010278C  38 03 4E 6D */	addi r0, r3, 0x41C64E6D@l
/* 80106870 00102790  7C 64 01 D6 */	mullw r3, r4, r0
/* 80106874 00102794  38 03 30 39 */	addi r0, r3, 0x3039
/* 80106878 00102798  90 0D 98 C8 */	stw r0, next@sda21(r13)
/* 8010687C 0010279C  80 0D 98 C8 */	lwz r0, next@sda21(r13)
/* 80106880 001027A0  54 03 84 7E */	rlwinm r3, r0, 0x10, 0x11, 0x1f
/* 80106884 001027A4  4E 80 00 20 */	blr

.section .sdata

.global next
next:
	# ROM: 0x1EC1E8
	.byte 0x00, 0x00, 0x00, 0x01
	.4byte 0
