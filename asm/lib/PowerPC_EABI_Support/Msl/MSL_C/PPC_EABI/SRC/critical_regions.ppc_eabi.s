.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __kill_critical_regions
__kill_critical_regions:
/* 801044B4 001003D4  4E 80 00 20 */	blr 
