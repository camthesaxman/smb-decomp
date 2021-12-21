.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKInitializeMutex
TRKInitializeMutex:
/* 8010BFE0 00107F00  38 60 00 00 */	li r3, 0
/* 8010BFE4 00107F04  4E 80 00 20 */	blr

.global TRKAcquireMutex
TRKAcquireMutex:
/* 8010BFE8 00107F08  38 60 00 00 */	li r3, 0
/* 8010BFEC 00107F0C  4E 80 00 20 */	blr

.global TRKReleaseMutex
TRKReleaseMutex:
/* 8010BFF0 00107F10  38 60 00 00 */	li r3, 0
/* 8010BFF4 00107F14  4E 80 00 20 */	blr
