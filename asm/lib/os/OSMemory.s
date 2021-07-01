.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global OSGetPhysicalMemSize
OSGetPhysicalMemSize:
/* 800C701C 000C2F3C  3C 60 80 00 */	lis r3, 0x80000028@ha
/* 800C7020 000C2F40  80 63 00 28 */	lwz r3, 0x80000028@l(r3)
/* 800C7024 000C2F44  4E 80 00 20 */	blr
