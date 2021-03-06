.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global GXFlush
GXFlush:
/* 800DF0AC 000DAFCC  7C 08 02 A6 */	mflr r0
/* 800DF0B0 000DAFD0  90 01 00 04 */	stw r0, 4(r1)
/* 800DF0B4 000DAFD4  94 21 FF F8 */	stwu r1, -8(r1)
/* 800DF0B8 000DAFD8  80 6D 97 C8 */	lwz r3, gx@sda21(r13)
/* 800DF0BC 000DAFDC  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800DF0C0 000DAFE0  28 00 00 00 */	cmplwi r0, 0
/* 800DF0C4 000DAFE4  41 82 00 08 */	beq lbl_800DF0CC
/* 800DF0C8 000DAFE8  48 00 05 A5 */	bl __GXSetDirtyState
lbl_800DF0CC:
/* 800DF0CC 000DAFEC  38 00 00 04 */	li r0, 4
/* 800DF0D0 000DAFF0  7C 09 03 A6 */	mtctr r0
/* 800DF0D4 000DAFF4  38 00 00 00 */	li r0, 0
/* 800DF0D8 000DAFF8  3C 60 CC 01 */	lis r3, 0xCC008000@ha
lbl_800DF0DC:
/* 800DF0DC 000DAFFC  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 800DF0E0 000DB000  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF0E4 000DB004  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF0E8 000DB008  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF0EC 000DB00C  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF0F0 000DB010  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF0F4 000DB014  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF0F8 000DB018  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF0FC 000DB01C  42 00 FF E0 */	bdnz lbl_800DF0DC
/* 800DF100 000DB020  4B FE 26 31 */	bl PPCSync
/* 800DF104 000DB024  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800DF108 000DB028  38 21 00 08 */	addi r1, r1, 8
/* 800DF10C 000DB02C  7C 08 03 A6 */	mtlr r0
/* 800DF110 000DB030  4E 80 00 20 */	blr

.global GXSetDrawSync
GXSetDrawSync:
/* 800DF114 000DB034  7C 08 02 A6 */	mflr r0
/* 800DF118 000DB038  90 01 00 04 */	stw r0, 4(r1)
/* 800DF11C 000DB03C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DF120 000DB040  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DF124 000DB044  7C 7F 1B 78 */	mr r31, r3
/* 800DF128 000DB048  4B FE 6F 95 */	bl OSDisableInterrupts
/* 800DF12C 000DB04C  38 C0 00 61 */	li r6, 0x61
/* 800DF130 000DB050  80 8D 97 C8 */	lwz r4, gx@sda21(r13)
/* 800DF134 000DB054  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800DF138 000DB058  57 E0 04 3E */	clrlwi r0, r31, 0x10
/* 800DF13C 000DB05C  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 800DF140 000DB060  64 00 48 00 */	oris r0, r0, 0x4800
/* 800DF144 000DB064  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800DF148 000DB068  54 00 00 1E */	rlwinm r0, r0, 0, 0, 0xf
/* 800DF14C 000DB06C  53 E0 04 3E */	rlwimi r0, r31, 0, 0x10, 0x1f
/* 800DF150 000DB070  54 00 02 3E */	clrlwi r0, r0, 8
/* 800DF154 000DB074  98 C5 80 00 */	stb r6, -0x8000(r5)
/* 800DF158 000DB078  64 00 47 00 */	oris r0, r0, 0x4700
/* 800DF15C 000DB07C  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800DF160 000DB080  7C 7F 1B 78 */	mr r31, r3
/* 800DF164 000DB084  80 04 04 F0 */	lwz r0, 0x4f0(r4)
/* 800DF168 000DB088  28 00 00 00 */	cmplwi r0, 0
/* 800DF16C 000DB08C  41 82 00 08 */	beq lbl_800DF174
/* 800DF170 000DB090  48 00 04 FD */	bl __GXSetDirtyState
lbl_800DF174:
/* 800DF174 000DB094  38 00 00 04 */	li r0, 4
/* 800DF178 000DB098  7C 09 03 A6 */	mtctr r0
/* 800DF17C 000DB09C  38 00 00 00 */	li r0, 0
/* 800DF180 000DB0A0  3C 60 CC 01 */	lis r3, 0xCC008000@ha
lbl_800DF184:
/* 800DF184 000DB0A4  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 800DF188 000DB0A8  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF18C 000DB0AC  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF190 000DB0B0  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF194 000DB0B4  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF198 000DB0B8  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF19C 000DB0BC  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF1A0 000DB0C0  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF1A4 000DB0C4  42 00 FF E0 */	bdnz lbl_800DF184
/* 800DF1A8 000DB0C8  4B FE 25 89 */	bl PPCSync
/* 800DF1AC 000DB0CC  7F E3 FB 78 */	mr r3, r31
/* 800DF1B0 000DB0D0  4B FE 6F 35 */	bl OSRestoreInterrupts
/* 800DF1B4 000DB0D4  80 6D 97 C8 */	lwz r3, gx@sda21(r13)
/* 800DF1B8 000DB0D8  38 00 00 01 */	li r0, 1
/* 800DF1BC 000DB0DC  B0 03 00 02 */	sth r0, 2(r3)
/* 800DF1C0 000DB0E0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DF1C4 000DB0E4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DF1C8 000DB0E8  38 21 00 18 */	addi r1, r1, 0x18
/* 800DF1CC 000DB0EC  7C 08 03 A6 */	mtlr r0
/* 800DF1D0 000DB0F0  4E 80 00 20 */	blr

.global GXSetDrawDone
GXSetDrawDone:
/* 800DF1D4 000DB0F4  7C 08 02 A6 */	mflr r0
/* 800DF1D8 000DB0F8  90 01 00 04 */	stw r0, 4(r1)
/* 800DF1DC 000DB0FC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DF1E0 000DB100  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DF1E4 000DB104  4B FE 6E D9 */	bl OSDisableInterrupts
/* 800DF1E8 000DB108  38 00 00 61 */	li r0, 0x61
/* 800DF1EC 000DB10C  80 8D 97 C8 */	lwz r4, gx@sda21(r13)
/* 800DF1F0 000DB110  3C C0 CC 01 */	lis r6, 0xCC008000@ha
/* 800DF1F4 000DB114  3C A0 45 00 */	lis r5, 0x45000002@ha
/* 800DF1F8 000DB118  98 06 80 00 */	stb r0, 0xCC008000@l(r6)
/* 800DF1FC 000DB11C  38 05 00 02 */	addi r0, r5, 0x45000002@l
/* 800DF200 000DB120  90 06 80 00 */	stw r0, -0x8000(r6)
/* 800DF204 000DB124  7C 7F 1B 78 */	mr r31, r3
/* 800DF208 000DB128  80 04 04 F0 */	lwz r0, 0x4f0(r4)
/* 800DF20C 000DB12C  28 00 00 00 */	cmplwi r0, 0
/* 800DF210 000DB130  41 82 00 08 */	beq lbl_800DF218
/* 800DF214 000DB134  48 00 04 59 */	bl __GXSetDirtyState
lbl_800DF218:
/* 800DF218 000DB138  38 00 00 04 */	li r0, 4
/* 800DF21C 000DB13C  7C 09 03 A6 */	mtctr r0
/* 800DF220 000DB140  38 00 00 00 */	li r0, 0
/* 800DF224 000DB144  3C 60 CC 01 */	lis r3, 0xCC008000@ha
lbl_800DF228:
/* 800DF228 000DB148  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 800DF22C 000DB14C  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF230 000DB150  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF234 000DB154  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF238 000DB158  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF23C 000DB15C  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF240 000DB160  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF244 000DB164  98 03 80 00 */	stb r0, -0x8000(r3)
/* 800DF248 000DB168  42 00 FF E0 */	bdnz lbl_800DF228
/* 800DF24C 000DB16C  4B FE 24 E5 */	bl PPCSync
/* 800DF250 000DB170  38 00 00 00 */	li r0, 0
/* 800DF254 000DB174  98 0D A3 98 */	stb r0, DrawDone@sda21(r13)
/* 800DF258 000DB178  7F E3 FB 78 */	mr r3, r31
/* 800DF25C 000DB17C  4B FE 6E 89 */	bl OSRestoreInterrupts
/* 800DF260 000DB180  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DF264 000DB184  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DF268 000DB188  38 21 00 18 */	addi r1, r1, 0x18
/* 800DF26C 000DB18C  7C 08 03 A6 */	mtlr r0
/* 800DF270 000DB190  4E 80 00 20 */	blr

.global GXDrawDone
GXDrawDone:
/* 800DF274 000DB194  7C 08 02 A6 */	mflr r0
/* 800DF278 000DB198  90 01 00 04 */	stw r0, 4(r1)
/* 800DF27C 000DB19C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DF280 000DB1A0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DF284 000DB1A4  4B FE 6E 39 */	bl OSDisableInterrupts
/* 800DF288 000DB1A8  38 00 00 61 */	li r0, 0x61
/* 800DF28C 000DB1AC  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800DF290 000DB1B0  3C 80 45 00 */	lis r4, 0x45000002@ha
/* 800DF294 000DB1B4  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800DF298 000DB1B8  38 04 00 02 */	addi r0, r4, 0x45000002@l
/* 800DF29C 000DB1BC  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800DF2A0 000DB1C0  7C 7F 1B 78 */	mr r31, r3
/* 800DF2A4 000DB1C4  4B FF FE 09 */	bl GXFlush
/* 800DF2A8 000DB1C8  38 00 00 00 */	li r0, 0
/* 800DF2AC 000DB1CC  98 0D A3 98 */	stb r0, DrawDone@sda21(r13)
/* 800DF2B0 000DB1D0  7F E3 FB 78 */	mr r3, r31
/* 800DF2B4 000DB1D4  4B FE 6E 31 */	bl OSRestoreInterrupts
/* 800DF2B8 000DB1D8  4B FE 6E 05 */	bl OSDisableInterrupts
/* 800DF2BC 000DB1DC  7C 7F 1B 78 */	mr r31, r3
/* 800DF2C0 000DB1E0  48 00 00 0C */	b lbl_800DF2CC
lbl_800DF2C4:
/* 800DF2C4 000DB1E4  38 6D A3 9C */	addi r3, r13, FinishQueue@sda21
/* 800DF2C8 000DB1E8  4B FE A4 C5 */	bl OSSleepThread
lbl_800DF2CC:
/* 800DF2CC 000DB1EC  88 0D A3 98 */	lbz r0, DrawDone@sda21(r13)
/* 800DF2D0 000DB1F0  28 00 00 00 */	cmplwi r0, 0
/* 800DF2D4 000DB1F4  41 82 FF F0 */	beq lbl_800DF2C4
/* 800DF2D8 000DB1F8  7F E3 FB 78 */	mr r3, r31
/* 800DF2DC 000DB1FC  4B FE 6E 09 */	bl OSRestoreInterrupts
/* 800DF2E0 000DB200  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DF2E4 000DB204  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DF2E8 000DB208  38 21 00 18 */	addi r1, r1, 0x18
/* 800DF2EC 000DB20C  7C 08 03 A6 */	mtlr r0
/* 800DF2F0 000DB210  4E 80 00 20 */	blr

glabel GXPixModeSync
/* 800DF2F4 000DB214  38 00 00 61 */	li r0, 0x61
/* 800DF2F8 000DB218  80 8D 97 C8 */	lwz r4, gx@sda21(r13)
/* 800DF2FC 000DB21C  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800DF300 000DB220  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800DF304 000DB224  38 00 00 01 */	li r0, 1
/* 800DF308 000DB228  80 64 01 DC */	lwz r3, 0x1dc(r4)
/* 800DF30C 000DB22C  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800DF310 000DB230  B0 04 00 02 */	sth r0, 2(r4)
/* 800DF314 000DB234  4E 80 00 20 */	blr

.global GXPokeAlphaMode
GXPokeAlphaMode:
/* 800DF318 000DB238  80 AD A3 68 */	lwz r5, __peReg@sda21(r13)
/* 800DF31C 000DB23C  54 80 06 3E */	clrlwi r0, r4, 0x18
/* 800DF320 000DB240  50 60 40 2E */	rlwimi r0, r3, 8, 0, 0x17
/* 800DF324 000DB244  B0 05 00 06 */	sth r0, 6(r5)
/* 800DF328 000DB248  4E 80 00 20 */	blr

.global GXPokeAlphaRead
GXPokeAlphaRead:
/* 800DF32C 000DB24C  54 60 07 B8 */	rlwinm r0, r3, 0, 0x1e, 0x1c
/* 800DF330 000DB250  80 6D A3 68 */	lwz r3, __peReg@sda21(r13)
/* 800DF334 000DB254  60 00 00 04 */	ori r0, r0, 4
/* 800DF338 000DB258  B0 03 00 08 */	sth r0, 8(r3)
/* 800DF33C 000DB25C  4E 80 00 20 */	blr

.global GXPokeAlphaUpdate
GXPokeAlphaUpdate:
/* 800DF340 000DB260  80 8D A3 68 */	lwz r4, __peReg@sda21(r13)
/* 800DF344 000DB264  54 60 25 36 */	rlwinm r0, r3, 4, 0x14, 0x1b
/* 800DF348 000DB268  A4 64 00 02 */	lhzu r3, 2(r4)
/* 800DF34C 000DB26C  54 63 07 34 */	rlwinm r3, r3, 0, 0x1c, 0x1a
/* 800DF350 000DB270  7C 60 03 78 */	or r0, r3, r0
/* 800DF354 000DB274  B0 04 00 00 */	sth r0, 0(r4)
/* 800DF358 000DB278  4E 80 00 20 */	blr

.global GXPokeBlendMode
GXPokeBlendMode:
/* 800DF35C 000DB27C  80 ED A3 68 */	lwz r7, __peReg@sda21(r13)
/* 800DF360 000DB280  2C 03 00 01 */	cmpwi r3, 1
/* 800DF364 000DB284  39 20 00 01 */	li r9, 1
/* 800DF368 000DB288  39 47 00 02 */	addi r10, r7, 2
/* 800DF36C 000DB28C  A0 E7 00 02 */	lhz r7, 2(r7)
/* 800DF370 000DB290  41 82 00 10 */	beq lbl_800DF380
/* 800DF374 000DB294  2C 03 00 03 */	cmpwi r3, 3
/* 800DF378 000DB298  41 82 00 08 */	beq lbl_800DF380
/* 800DF37C 000DB29C  39 20 00 00 */	li r9, 0
lbl_800DF380:
/* 800DF380 000DB2A0  54 E8 00 3C */	rlwinm r8, r7, 0, 0, 0x1e
/* 800DF384 000DB2A4  20 03 00 03 */	subfic r0, r3, 3
/* 800DF388 000DB2A8  7C 07 00 34 */	cntlzw r7, r0
/* 800DF38C 000DB2AC  20 03 00 02 */	subfic r0, r3, 2
/* 800DF390 000DB2B0  7D 08 4B 78 */	or r8, r8, r9
/* 800DF394 000DB2B4  7C 00 00 34 */	cntlzw r0, r0
/* 800DF398 000DB2B8  55 08 05 66 */	rlwinm r8, r8, 0, 0x15, 0x13
/* 800DF39C 000DB2BC  54 E3 30 28 */	rlwinm r3, r7, 6, 0, 0x14
/* 800DF3A0 000DB2C0  7D 03 1B 78 */	or r3, r8, r3
/* 800DF3A4 000DB2C4  54 63 07 FA */	rlwinm r3, r3, 0, 0x1f, 0x1d
/* 800DF3A8 000DB2C8  54 00 E1 3C */	rlwinm r0, r0, 0x1c, 4, 0x1e
/* 800DF3AC 000DB2CC  7C 60 03 78 */	or r0, r3, r0
/* 800DF3B0 000DB2D0  54 03 05 1E */	rlwinm r3, r0, 0, 0x14, 0xf
/* 800DF3B4 000DB2D4  54 C0 60 26 */	slwi r0, r6, 0xc
/* 800DF3B8 000DB2D8  7C 60 03 78 */	or r0, r3, r0
/* 800DF3BC 000DB2DC  54 03 06 28 */	rlwinm r3, r0, 0, 0x18, 0x14
/* 800DF3C0 000DB2E0  54 80 40 2E */	slwi r0, r4, 8
/* 800DF3C4 000DB2E4  7C 60 03 78 */	or r0, r3, r0
/* 800DF3C8 000DB2E8  54 03 06 EE */	rlwinm r3, r0, 0, 0x1b, 0x17
/* 800DF3CC 000DB2EC  54 A0 28 34 */	slwi r0, r5, 5
/* 800DF3D0 000DB2F0  7C 60 03 78 */	or r0, r3, r0
/* 800DF3D4 000DB2F4  54 00 02 3E */	clrlwi r0, r0, 8
/* 800DF3D8 000DB2F8  64 00 41 00 */	oris r0, r0, 0x4100
/* 800DF3DC 000DB2FC  B0 0A 00 00 */	sth r0, 0(r10)
/* 800DF3E0 000DB300  4E 80 00 20 */	blr

.global GXPokeColorUpdate
GXPokeColorUpdate:
/* 800DF3E4 000DB304  80 8D A3 68 */	lwz r4, __peReg@sda21(r13)
/* 800DF3E8 000DB308  54 60 1D 78 */	rlwinm r0, r3, 3, 0x15, 0x1c
/* 800DF3EC 000DB30C  A4 64 00 02 */	lhzu r3, 2(r4)
/* 800DF3F0 000DB310  54 63 07 76 */	rlwinm r3, r3, 0, 0x1d, 0x1b
/* 800DF3F4 000DB314  7C 60 03 78 */	or r0, r3, r0
/* 800DF3F8 000DB318  B0 04 00 00 */	sth r0, 0(r4)
/* 800DF3FC 000DB31C  4E 80 00 20 */	blr

.global GXPokeDstAlpha
GXPokeDstAlpha:
/* 800DF400 000DB320  80 AD A3 68 */	lwz r5, __peReg@sda21(r13)
/* 800DF404 000DB324  54 60 44 2E */	rlwinm r0, r3, 8, 0x10, 0x17
/* 800DF408 000DB328  50 80 06 3E */	rlwimi r0, r4, 0, 0x18, 0x1f
/* 800DF40C 000DB32C  B0 05 00 04 */	sth r0, 4(r5)
/* 800DF410 000DB330  4E 80 00 20 */	blr

.global GXPokeDither
GXPokeDither:
/* 800DF414 000DB334  80 8D A3 68 */	lwz r4, __peReg@sda21(r13)
/* 800DF418 000DB338  54 60 15 BA */	rlwinm r0, r3, 2, 0x16, 0x1d
/* 800DF41C 000DB33C  A4 64 00 02 */	lhzu r3, 2(r4)
/* 800DF420 000DB340  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 800DF424 000DB344  7C 60 03 78 */	or r0, r3, r0
/* 800DF428 000DB348  B0 04 00 00 */	sth r0, 0(r4)
/* 800DF42C 000DB34C  4E 80 00 20 */	blr

.global GXPokeZMode
GXPokeZMode:
/* 800DF430 000DB350  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 800DF434 000DB354  80 6D A3 68 */	lwz r3, __peReg@sda21(r13)
/* 800DF438 000DB358  54 06 07 F6 */	rlwinm r6, r0, 0, 0x1f, 0x1b
/* 800DF43C 000DB35C  54 80 08 3C */	slwi r0, r4, 1
/* 800DF440 000DB360  7C C0 03 78 */	or r0, r6, r0
/* 800DF444 000DB364  54 04 07 34 */	rlwinm r4, r0, 0, 0x1c, 0x1a
/* 800DF448 000DB368  54 A0 25 36 */	rlwinm r0, r5, 4, 0x14, 0x1b
/* 800DF44C 000DB36C  7C 80 03 78 */	or r0, r4, r0
/* 800DF450 000DB370  B0 03 00 00 */	sth r0, 0(r3)
/* 800DF454 000DB374  4E 80 00 20 */	blr

.global GXSetDrawSyncCallback
GXSetDrawSyncCallback:
/* 800DF458 000DB378  7C 08 02 A6 */	mflr r0
/* 800DF45C 000DB37C  90 01 00 04 */	stw r0, 4(r1)
/* 800DF460 000DB380  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DF464 000DB384  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DF468 000DB388  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800DF46C 000DB38C  7C 7E 1B 78 */	mr r30, r3
/* 800DF470 000DB390  83 ED A3 90 */	lwz r31, TokenCB@sda21(r13)
/* 800DF474 000DB394  4B FE 6C 49 */	bl OSDisableInterrupts
/* 800DF478 000DB398  93 CD A3 90 */	stw r30, TokenCB@sda21(r13)
/* 800DF47C 000DB39C  4B FE 6C 69 */	bl OSRestoreInterrupts
/* 800DF480 000DB3A0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DF484 000DB3A4  7F E3 FB 78 */	mr r3, r31
/* 800DF488 000DB3A8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DF48C 000DB3AC  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800DF490 000DB3B0  7C 08 03 A6 */	mtlr r0
/* 800DF494 000DB3B4  38 21 00 18 */	addi r1, r1, 0x18
/* 800DF498 000DB3B8  4E 80 00 20 */	blr

.global GXTokenInterruptHandler
GXTokenInterruptHandler:
/* 800DF49C 000DB3BC  7C 08 02 A6 */	mflr r0
/* 800DF4A0 000DB3C0  90 01 00 04 */	stw r0, 4(r1)
/* 800DF4A4 000DB3C4  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 800DF4A8 000DB3C8  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 800DF4AC 000DB3CC  93 C1 02 D8 */	stw r30, 0x2d8(r1)
/* 800DF4B0 000DB3D0  7C 9E 23 78 */	mr r30, r4
/* 800DF4B4 000DB3D4  80 0D A3 90 */	lwz r0, TokenCB@sda21(r13)
/* 800DF4B8 000DB3D8  80 6D A3 68 */	lwz r3, __peReg@sda21(r13)
/* 800DF4BC 000DB3DC  28 00 00 00 */	cmplwi r0, 0
/* 800DF4C0 000DB3E0  A3 E3 00 0E */	lhz r31, 0xe(r3)
/* 800DF4C4 000DB3E4  41 82 00 34 */	beq lbl_800DF4F8
/* 800DF4C8 000DB3E8  38 61 00 10 */	addi r3, r1, 0x10
/* 800DF4CC 000DB3EC  4B FE 43 BD */	bl OSClearContext
/* 800DF4D0 000DB3F0  38 61 00 10 */	addi r3, r1, 0x10
/* 800DF4D4 000DB3F4  4B FE 41 ED */	bl OSSetCurrentContext
/* 800DF4D8 000DB3F8  81 8D A3 90 */	lwz r12, TokenCB@sda21(r13)
/* 800DF4DC 000DB3FC  38 7F 00 00 */	addi r3, r31, 0
/* 800DF4E0 000DB400  7D 88 03 A6 */	mtlr r12
/* 800DF4E4 000DB404  4E 80 00 21 */	blrl
/* 800DF4E8 000DB408  38 61 00 10 */	addi r3, r1, 0x10
/* 800DF4EC 000DB40C  4B FE 43 9D */	bl OSClearContext
/* 800DF4F0 000DB410  7F C3 F3 78 */	mr r3, r30
/* 800DF4F4 000DB414  4B FE 41 CD */	bl OSSetCurrentContext
lbl_800DF4F8:
/* 800DF4F8 000DB418  80 6D A3 68 */	lwz r3, __peReg@sda21(r13)
/* 800DF4FC 000DB41C  A4 03 00 0A */	lhzu r0, 0xa(r3)
/* 800DF500 000DB420  54 00 07 B8 */	rlwinm r0, r0, 0, 0x1e, 0x1c
/* 800DF504 000DB424  60 00 00 04 */	ori r0, r0, 4
/* 800DF508 000DB428  B0 03 00 00 */	sth r0, 0(r3)
/* 800DF50C 000DB42C  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 800DF510 000DB430  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 800DF514 000DB434  83 C1 02 D8 */	lwz r30, 0x2d8(r1)
/* 800DF518 000DB438  7C 08 03 A6 */	mtlr r0
/* 800DF51C 000DB43C  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 800DF520 000DB440  4E 80 00 20 */	blr

.global GXSetDrawDoneCallback
GXSetDrawDoneCallback:
/* 800DF524 000DB444  7C 08 02 A6 */	mflr r0
/* 800DF528 000DB448  90 01 00 04 */	stw r0, 4(r1)
/* 800DF52C 000DB44C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DF530 000DB450  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DF534 000DB454  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800DF538 000DB458  7C 7E 1B 78 */	mr r30, r3
/* 800DF53C 000DB45C  83 ED A3 94 */	lwz r31, DrawDoneCB@sda21(r13)
/* 800DF540 000DB460  4B FE 6B 7D */	bl OSDisableInterrupts
/* 800DF544 000DB464  93 CD A3 94 */	stw r30, DrawDoneCB@sda21(r13)
/* 800DF548 000DB468  4B FE 6B 9D */	bl OSRestoreInterrupts
/* 800DF54C 000DB46C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DF550 000DB470  7F E3 FB 78 */	mr r3, r31
/* 800DF554 000DB474  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DF558 000DB478  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800DF55C 000DB47C  7C 08 03 A6 */	mtlr r0
/* 800DF560 000DB480  38 21 00 18 */	addi r1, r1, 0x18
/* 800DF564 000DB484  4E 80 00 20 */	blr

.global GXFinishInterruptHandler
GXFinishInterruptHandler:
/* 800DF568 000DB488  7C 08 02 A6 */	mflr r0
/* 800DF56C 000DB48C  38 60 00 01 */	li r3, 1
/* 800DF570 000DB490  90 01 00 04 */	stw r0, 4(r1)
/* 800DF574 000DB494  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 800DF578 000DB498  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 800DF57C 000DB49C  3B E4 00 00 */	addi r31, r4, 0
/* 800DF580 000DB4A0  80 AD A3 68 */	lwz r5, __peReg@sda21(r13)
/* 800DF584 000DB4A4  A0 05 00 0A */	lhz r0, 0xa(r5)
/* 800DF588 000DB4A8  54 00 07 76 */	rlwinm r0, r0, 0, 0x1d, 0x1b
/* 800DF58C 000DB4AC  60 00 00 08 */	ori r0, r0, 8
/* 800DF590 000DB4B0  B0 05 00 0A */	sth r0, 0xa(r5)
/* 800DF594 000DB4B4  80 0D A3 94 */	lwz r0, DrawDoneCB@sda21(r13)
/* 800DF598 000DB4B8  98 6D A3 98 */	stb r3, DrawDone@sda21(r13)
/* 800DF59C 000DB4BC  28 00 00 00 */	cmplwi r0, 0
/* 800DF5A0 000DB4C0  41 82 00 30 */	beq lbl_800DF5D0
/* 800DF5A4 000DB4C4  38 61 00 10 */	addi r3, r1, 0x10
/* 800DF5A8 000DB4C8  4B FE 42 E1 */	bl OSClearContext
/* 800DF5AC 000DB4CC  38 61 00 10 */	addi r3, r1, 0x10
/* 800DF5B0 000DB4D0  4B FE 41 11 */	bl OSSetCurrentContext
/* 800DF5B4 000DB4D4  81 8D A3 94 */	lwz r12, DrawDoneCB@sda21(r13)
/* 800DF5B8 000DB4D8  7D 88 03 A6 */	mtlr r12
/* 800DF5BC 000DB4DC  4E 80 00 21 */	blrl
/* 800DF5C0 000DB4E0  38 61 00 10 */	addi r3, r1, 0x10
/* 800DF5C4 000DB4E4  4B FE 42 C5 */	bl OSClearContext
/* 800DF5C8 000DB4E8  7F E3 FB 78 */	mr r3, r31
/* 800DF5CC 000DB4EC  4B FE 40 F5 */	bl OSSetCurrentContext
lbl_800DF5D0:
/* 800DF5D0 000DB4F0  38 6D A3 9C */	addi r3, r13, FinishQueue@sda21
/* 800DF5D4 000DB4F4  4B FE A2 A5 */	bl OSWakeupThread
/* 800DF5D8 000DB4F8  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 800DF5DC 000DB4FC  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 800DF5E0 000DB500  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 800DF5E4 000DB504  7C 08 03 A6 */	mtlr r0
/* 800DF5E8 000DB508  4E 80 00 20 */	blr

.global __GXPEInit
__GXPEInit:
/* 800DF5EC 000DB50C  7C 08 02 A6 */	mflr r0
/* 800DF5F0 000DB510  3C 60 80 0E */	lis r3, GXTokenInterruptHandler@ha
/* 800DF5F4 000DB514  90 01 00 04 */	stw r0, 4(r1)
/* 800DF5F8 000DB518  38 83 F4 9C */	addi r4, r3, GXTokenInterruptHandler@l
/* 800DF5FC 000DB51C  38 60 00 12 */	li r3, 0x12
/* 800DF600 000DB520  94 21 FF F8 */	stwu r1, -8(r1)
/* 800DF604 000DB524  4B FE 6B 05 */	bl __OSSetInterruptHandler
/* 800DF608 000DB528  3C 60 80 0E */	lis r3, GXFinishInterruptHandler@ha
/* 800DF60C 000DB52C  38 83 F5 68 */	addi r4, r3, GXFinishInterruptHandler@l
/* 800DF610 000DB530  38 60 00 13 */	li r3, 0x13
/* 800DF614 000DB534  4B FE 6A F5 */	bl __OSSetInterruptHandler
/* 800DF618 000DB538  38 6D A3 9C */	addi r3, r13, FinishQueue@sda21
/* 800DF61C 000DB53C  4B FE 96 8D */	bl OSInitThreadQueue
/* 800DF620 000DB540  38 60 20 00 */	li r3, 0x2000
/* 800DF624 000DB544  4B FE 6E C1 */	bl __OSUnmaskInterrupts
/* 800DF628 000DB548  38 60 10 00 */	li r3, 0x1000
/* 800DF62C 000DB54C  4B FE 6E B9 */	bl __OSUnmaskInterrupts
/* 800DF630 000DB550  80 6D A3 68 */	lwz r3, __peReg@sda21(r13)
/* 800DF634 000DB554  A4 03 00 0A */	lhzu r0, 0xa(r3)
/* 800DF638 000DB558  54 00 07 B8 */	rlwinm r0, r0, 0, 0x1e, 0x1c
/* 800DF63C 000DB55C  60 00 00 04 */	ori r0, r0, 4
/* 800DF640 000DB560  54 00 07 76 */	rlwinm r0, r0, 0, 0x1d, 0x1b
/* 800DF644 000DB564  60 00 00 08 */	ori r0, r0, 8
/* 800DF648 000DB568  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800DF64C 000DB56C  60 00 00 01 */	ori r0, r0, 1
/* 800DF650 000DB570  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 800DF654 000DB574  60 00 00 02 */	ori r0, r0, 2
/* 800DF658 000DB578  B0 03 00 00 */	sth r0, 0(r3)
/* 800DF65C 000DB57C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800DF660 000DB580  38 21 00 08 */	addi r1, r1, 8
/* 800DF664 000DB584  7C 08 03 A6 */	mtlr r0
/* 800DF668 000DB588  4E 80 00 20 */	blr

.section .sbss

	.balign 8
.global TokenCB
TokenCB:
	.skip 0x4
.global DrawDoneCB
DrawDoneCB:
	.skip 0x4
.global DrawDone
DrawDone:
	.skip 0x4
.global FinishQueue
FinishQueue:
	.skip 0xC
