# id: 6
# version: 1
# nameoffset: 0xA9, size: 0x24
# section table: 0x40, size: 0x90
# imp table: 0x11CF0
# relocs offset: 0xD3E0
# _prolog:     1:0x0
# _epilog:     1:0x50
# _unresolved: 1:0x7C
# num sections: 18
.include "macros.inc"
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x0000BDA4	flags: 1
# offset: 0x0000BE74	length: 0x00000004	flags: 0
# offset: 0x0000BE78	length: 0x00000004	flags: 0
# offset: 0x0000BE80	length: 0x000008BC	flags: 0
# offset: 0x0000C740	length: 0x00000CA0	flags: 0
# offset: 0x10000000	length: 0x000000C4	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# 1
.section .text
.global _prolog
_prolog:
/* 000000D0 7C0802A6 */ mflr r0
/* 000000D4 3C600000 */ lis r3, lbl_0000044C@ha
/* 000000D8 90010004 */ stw r0, 4(r1)
/* 000000DC 3C800000 */ lis r4, lbl_00003B6C@ha
/* 000000E0 3CA00000 */ lis r5, lbl_00004F68@ha
/* 000000E4 3CC00000 */ lis r6, lbl_00006DFC@ha
/* 000000E8 9421FFF8 */ stwu r1, -8(r1)
/* 000000EC 38630000 */ addi r3, r3, lbl_0000044C@l
/* 000000F0 38840000 */ addi r4, r4, lbl_00003B6C@l
/* 000000F4 38A50000 */ addi r5, r5, lbl_00004F68@l
/* 000000F8 38C60000 */ addi r6, r6, lbl_00006DFC@l
/* 000000FC 48000051 */ bl set_minigame_callbacks
/* 00000100 3C600000 */ lis r3, lbl_0000C7CC@ha
/* 00000104 38630000 */ addi r3, r3, lbl_0000C7CC@l
/* 00000108 48000045 */ bl puts
/* 0000010C 480000ED */ bl lbl_000001F8
/* 00000110 8001000C */ lwz r0, 0xc(r1)
/* 00000114 38210008 */ addi r1, r1, 8
/* 00000118 7C0803A6 */ mtlr r0
/* 0000011C 4E800020 */ blr 
.global _epilog
_epilog:
/* 00000120 7C0802A6 */ mflr r0
/* 00000124 90010004 */ stw r0, 4(r1)
/* 00000128 9421FFF8 */ stwu r1, -8(r1)
/* 0000012C 48000289 */ bl lbl_000003B4
/* 00000130 3C600000 */ lis r3, lbl_0000C7EC@ha
/* 00000134 38630000 */ addi r3, r3, lbl_0000C7EC@l
/* 00000138 48000015 */ bl puts
/* 0000013C 8001000C */ lwz r0, 0xc(r1)
/* 00000140 38210008 */ addi r1, r1, 8
/* 00000144 7C0803A6 */ mtlr r0
/* 00000148 4E800020 */ blr 
.global _unresolved
_unresolved:
/* 0000014C 7C0802A6 */ mflr r0
/* 00000150 3C600000 */ lis r3, lbl_0000C740@ha
/* 00000154 90010004 */ stw r0, 4(r1)
/* 00000158 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000015C 93E10014 */ stw r31, 0x14(r1)
/* 00000160 3BE30000 */ addi r31, r3, lbl_0000C740@l
/* 00000164 387F00CC */ addi r3, r31, 0xcc
/* 00000168 93C10010 */ stw r30, 0x10(r1)
/* 0000016C 93A1000C */ stw r29, 0xc(r1)
/* 00000170 4BFFFFDD */ bl puts
/* 00000174 387F00F4 */ addi r3, r31, 0xf4
/* 00000178 4BFFFFD5 */ bl puts
/* 0000017C 3BC00000 */ li r30, 0
/* 00000180 4BFFFFCD */ bl OSGetStackPointer
/* 00000184 7C7D1B78 */ mr r29, r3
/* 00000188 48000020 */ b lbl_000001A8
lbl_0000018C:
/* 0000018C 80BD0000 */ lwz r5, 0(r29)
/* 00000190 7FA4EB78 */ mr r4, r29
/* 00000194 80DD0004 */ lwz r6, 4(r29)
/* 00000198 387F011C */ addi r3, r31, 0x11c
/* 0000019C 4CC63182 */ crclr 6
/* 000001A0 4BFFFFAD */ bl printf
/* 000001A4 83BD0000 */ lwz r29, 0(r29)
lbl_000001A8:
/* 000001A8 281D0000 */ cmplwi r29, 0
/* 000001AC 4182001C */ beq lbl_000001C8
/* 000001B0 3C1D0001 */ addis r0, r29, 1
/* 000001B4 2800FFFF */ cmplwi r0, 0xffff
/* 000001B8 41820010 */ beq lbl_000001C8
/* 000001BC 281E0010 */ cmplwi r30, 0x10
/* 000001C0 3BDE0001 */ addi r30, r30, 1
/* 000001C4 4180FFC8 */ blt lbl_0000018C
lbl_000001C8:
/* 000001C8 387F0138 */ addi r3, r31, 0x138
/* 000001CC 4CC63182 */ crclr 6
/* 000001D0 38BF0148 */ addi r5, r31, 0x148
/* 000001D4 38800120 */ li r4, 0x120
/* 000001D8 4BFFFF75 */ bl OSPanic
/* 000001DC 8001001C */ lwz r0, 0x1c(r1)
/* 000001E0 83E10014 */ lwz r31, 0x14(r1)
/* 000001E4 83C10010 */ lwz r30, 0x10(r1)
/* 000001E8 7C0803A6 */ mtlr r0
/* 000001EC 83A1000C */ lwz r29, 0xc(r1)
/* 000001F0 38210018 */ addi r1, r1, 0x18
/* 000001F4 4E800020 */ blr 
lbl_000001F8:
/* 000001F8 7C0802A6 */ mflr r0
/* 000001FC 3C800000 */ lis r4, lbl_10000000@ha
/* 00000200 90010004 */ stw r0, 4(r1)
/* 00000204 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00000208 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000020C 93E10014 */ stw r31, 0x14(r1)
/* 00000210 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00000214 93C10010 */ stw r30, 0x10(r1)
/* 00000218 93A1000C */ stw r29, 0xc(r1)
/* 0000021C 3BA30000 */ addi r29, r3, lbl_0000BE80@l
/* 00000220 4BFFFF2D */ bl event_finish_all
/* 00000224 4BFFFF29 */ bl free_all_bitmap_groups_except_com
/* 00000228 4BFFFF25 */ bl func_800249D4
/* 0000022C 4BFFFF21 */ bl unload_stage
/* 00000230 3860000E */ li r3, 0xe
/* 00000234 4BFFFF19 */ bl SoundGroupLoad
/* 00000238 3C600000 */ lis r3, stageHeap@ha
/* 0000023C 38630000 */ addi r3, r3, stageHeap@l
/* 00000240 80630000 */ lwz r3, 0(r3)
/* 00000244 4BFFFF09 */ bl OSSetCurrentHeap
/* 00000248 3BC30000 */ addi r30, r3, 0
/* 0000024C 3860000B */ li r3, 0xb
/* 00000250 4BFFFEFD */ bl bitmap_load_group
/* 00000254 7FC3F378 */ mr r3, r30
/* 00000258 4BFFFEF5 */ bl OSSetCurrentHeap
/* 0000025C 4BFFFEF1 */ bl u_init_player_data_1
/* 00000260 480003E9 */ bl lbl_00000648
/* 00000264 3C800000 */ lis r4, lbl_00004024@ha
/* 00000268 3C600000 */ lis r3, lbl_802F1FD4@ha
/* 0000026C 38040000 */ addi r0, r4, lbl_00004024@l
/* 00000270 90030000 */ stw r0, lbl_802F1FD4@l(r3)
/* 00000274 3BC00000 */ li r30, 0
lbl_00000278:
/* 00000278 C03D0030 */ lfs f1, 0x30(r29)
/* 0000027C 7FC3F378 */ mr r3, r30
/* 00000280 C07D0034 */ lfs f3, 0x34(r29)
/* 00000284 FC400890 */ fmr f2, f1
/* 00000288 FC801890 */ fmr f4, f3
/* 0000028C 4BFFFEC1 */ bl setup_camera_viewport
/* 00000290 3BDE0001 */ addi r30, r30, 1
/* 00000294 2C1E0004 */ cmpwi r30, 4
/* 00000298 4180FFE0 */ blt lbl_00000278
/* 0000029C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000002A0 38830000 */ addi r4, r3, lbl_802F1FF4@l
/* 000002A4 3800FFFF */ li r0, -1
/* 000002A8 B0040000 */ sth r0, 0(r4)
/* 000002AC 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 000002B0 38000000 */ li r0, 0
/* 000002B4 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 000002B8 48000229 */ bl lbl_000004E0
/* 000002BC 38600043 */ li r3, 0x43
/* 000002C0 4BFFFE8D */ bl camera_set_state
/* 000002C4 3C800000 */ lis r4, currentBallStructPtr@ha
/* 000002C8 3C600000 */ lis r3, g_poolInfo@ha
/* 000002CC 38A40000 */ addi r5, r4, currentBallStructPtr@l
/* 000002D0 38830000 */ addi r4, r3, g_poolInfo@l
/* 000002D4 80E50000 */ lwz r7, 0(r5)
/* 000002D8 3C600000 */ lis r3, ballInfo@ha
/* 000002DC 8104000C */ lwz r8, 0xc(r4)
/* 000002E0 38030000 */ addi r0, r3, ballInfo@l
/* 000002E4 7C060378 */ mr r6, r0
/* 000002E8 39200000 */ li r9, 0
/* 000002EC 38600001 */ li r3, 1
/* 000002F0 48000024 */ b lbl_00000314
lbl_000002F4:
/* 000002F4 88080000 */ lbz r0, 0(r8)
/* 000002F8 2C000002 */ cmpwi r0, 2
/* 000002FC 4082000C */ bne lbl_00000308
/* 00000300 90C50000 */ stw r6, 0(r5)
/* 00000304 98660003 */ stb r3, 3(r6)
lbl_00000308:
/* 00000308 39290001 */ addi r9, r9, 1
/* 0000030C 38C601A4 */ addi r6, r6, 0x1a4
/* 00000310 39080001 */ addi r8, r8, 1
lbl_00000314:
/* 00000314 80040008 */ lwz r0, 8(r4)
/* 00000318 7C090000 */ cmpw r9, r0
/* 0000031C 4180FFD8 */ blt lbl_000002F4
/* 00000320 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00000324 90E30000 */ stw r7, currentBallStructPtr@l(r3)
/* 00000328 38600100 */ li r3, 0x100
/* 0000032C 38800000 */ li r4, 0
/* 00000330 38A0001E */ li r5, 0x1e
/* 00000334 4BFFFE19 */ bl start_screen_fade
/* 00000338 38600032 */ li r3, 0x32
/* 0000033C 38800000 */ li r4, 0
/* 00000340 4BFFFE0D */ bl u_play_music
/* 00000344 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000348 38830000 */ addi r4, r3, gameSubmodeRequest@l
/* 0000034C 3800009B */ li r0, 0x9b
/* 00000350 3C600000 */ lis r3, stageHeap@ha
/* 00000354 B0040000 */ sth r0, 0(r4)
/* 00000358 3BA30000 */ addi r29, r3, stageHeap@l
/* 0000035C 3FC00001 */ lis r30, 1
/* 00000360 807D0000 */ lwz r3, 0(r29)
/* 00000364 389EA00C */ addi r4, r30, -24564  ;# fixed addi
/* 00000368 4BFFFDE5 */ bl OSAllocFromHeap
/* 0000036C 907F0038 */ stw r3, 0x38(r31)
/* 00000370 389E400C */ addi r4, r30, 0x400c
/* 00000374 807D0000 */ lwz r3, 0(r29)
/* 00000378 4BFFFDD5 */ bl OSAllocFromHeap
/* 0000037C 907F003C */ stw r3, 0x3c(r31)
/* 00000380 38800400 */ li r4, 0x400
/* 00000384 807F0038 */ lwz r3, 0x38(r31)
/* 00000388 4800ABE1 */ bl lbl_0000AF68
/* 0000038C 807F003C */ lwz r3, 0x3c(r31)
/* 00000390 38800800 */ li r4, 0x800
/* 00000394 4800ABD5 */ bl lbl_0000AF68
/* 00000398 8001001C */ lwz r0, 0x1c(r1)
/* 0000039C 83E10014 */ lwz r31, 0x14(r1)
/* 000003A0 83C10010 */ lwz r30, 0x10(r1)
/* 000003A4 7C0803A6 */ mtlr r0
/* 000003A8 83A1000C */ lwz r29, 0xc(r1)
/* 000003AC 38210018 */ addi r1, r1, 0x18
/* 000003B0 4E800020 */ blr 
lbl_000003B4:
/* 000003B4 7C0802A6 */ mflr r0
/* 000003B8 90010004 */ stw r0, 4(r1)
/* 000003BC 9421FFF0 */ stwu r1, -0x10(r1)
/* 000003C0 93E1000C */ stw r31, 0xc(r1)
/* 000003C4 4BFFFD89 */ bl event_finish_all
/* 000003C8 3C800000 */ lis r4, stageHeap@ha
/* 000003CC 3C600000 */ lis r3, lbl_1000003C@ha
/* 000003D0 3BE40000 */ addi r31, r4, stageHeap@l
/* 000003D4 38830000 */ addi r4, r3, lbl_1000003C@l
/* 000003D8 807F0000 */ lwz r3, 0(r31)
/* 000003DC 80840000 */ lwz r4, 0(r4)
/* 000003E0 4BFFFD6D */ bl OSFreeToHeap
/* 000003E4 3C800000 */ lis r4, lbl_10000038@ha
/* 000003E8 807F0000 */ lwz r3, 0(r31)
/* 000003EC 38840000 */ addi r4, r4, lbl_10000038@l
/* 000003F0 80840000 */ lwz r4, 0(r4)
/* 000003F4 4BFFFD59 */ bl OSFreeToHeap
/* 000003F8 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000003FC 3BE30000 */ addi r31, r3, lbl_802F1FD0@l
/* 00000400 801F0000 */ lwz r0, 0(r31)
/* 00000404 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000408 41820014 */ beq lbl_0000041C
/* 0000040C 4BFFFD41 */ bl func_8009CC34
/* 00000410 801F0000 */ lwz r0, 0(r31)
/* 00000414 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00000418 901F0000 */ stw r0, 0(r31)
lbl_0000041C:
/* 0000041C 48000251 */ bl lbl_0000066C
/* 00000420 3860000B */ li r3, 0xb
/* 00000424 4BFFFD29 */ bl bitmap_free_group
/* 00000428 4BFFFD25 */ bl SoundGroupFree
/* 0000042C 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00000430 38000000 */ li r0, 0
/* 00000434 90030000 */ stw r0, lbl_802F1FD0@l(r3)
/* 00000438 80010014 */ lwz r0, 0x14(r1)
/* 0000043C 83E1000C */ lwz r31, 0xc(r1)
/* 00000440 38210010 */ addi r1, r1, 0x10
/* 00000444 7C0803A6 */ mtlr r0
/* 00000448 4E800020 */ blr 
lbl_0000044C:
/* 0000044C 7C0802A6 */ mflr r0
/* 00000450 3C600000 */ lis r3, gamePauseStatus@ha
/* 00000454 90010004 */ stw r0, 4(r1)
/* 00000458 9421FFF8 */ stwu r1, -8(r1)
/* 0000045C 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00000460 7000000A */ andi. r0, r0, 0xa
/* 00000464 40820008 */ bne lbl_0000046C
/* 00000468 48000015 */ bl lbl_0000047C
lbl_0000046C:
/* 0000046C 8001000C */ lwz r0, 0xc(r1)
/* 00000470 38210008 */ addi r1, r1, 8
/* 00000474 7C0803A6 */ mtlr r0
/* 00000478 4E800020 */ blr 
lbl_0000047C:
/* 0000047C 7C0802A6 */ mflr r0
/* 00000480 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00000484 90010004 */ stw r0, 4(r1)
/* 00000488 38830000 */ addi r4, r3, lbl_802F1FF4@l
/* 0000048C 9421FFF8 */ stwu r1, -8(r1)
/* 00000490 A8040000 */ lha r0, 0(r4)
/* 00000494 2C00FFFF */ cmpwi r0, -1
/* 00000498 41820014 */ beq lbl_000004AC
/* 0000049C 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 000004A0 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 000004A4 3800FFFF */ li r0, -1
/* 000004A8 B0040000 */ sth r0, 0(r4)
lbl_000004AC:
/* 000004AC 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 000004B0 A8830000 */ lha r4, lbl_802F1FF6@l(r3)
/* 000004B4 3C600000 */ lis r3, lbl_0000C748@ha
/* 000004B8 38030000 */ addi r0, r3, lbl_0000C748@l
/* 000004BC 5483103A */ slwi r3, r4, 2
/* 000004C0 7C601A14 */ add r3, r0, r3
/* 000004C4 81830000 */ lwz r12, 0(r3)
/* 000004C8 7D8803A6 */ mtlr r12
/* 000004CC 4E800021 */ blrl 
/* 000004D0 8001000C */ lwz r0, 0xc(r1)
/* 000004D4 38210008 */ addi r1, r1, 8
/* 000004D8 7C0803A6 */ mtlr r0
/* 000004DC 4E800020 */ blr 
lbl_000004E0:
/* 000004E0 7C0802A6 */ mflr r0
/* 000004E4 3C600000 */ lis r3, lbl_10000000@ha
/* 000004E8 90010004 */ stw r0, 4(r1)
/* 000004EC 39030000 */ addi r8, r3, lbl_10000000@l
/* 000004F0 3C600000 */ lis r3, lbl_802F1BFC@ha
/* 000004F4 9421FFD8 */ stwu r1, -0x28(r1)
/* 000004F8 38E30000 */ addi r7, r3, lbl_802F1BFC@l
/* 000004FC 3CC00000 */ lis r6, lbl_80285A58@ha
/* 00000500 93E10024 */ stw r31, 0x24(r1)
/* 00000504 3CA00000 */ lis r5, lbl_802F1FE4@ha
/* 00000508 3C800000 */ lis r4, lbl_80285A80@ha
/* 0000050C 93C10020 */ stw r30, 0x20(r1)
/* 00000510 38000000 */ li r0, 0
/* 00000514 39250000 */ addi r9, r5, lbl_802F1FE4@l
/* 00000518 B0080040 */ sth r0, 0x40(r8)
/* 0000051C 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00000520 38C60000 */ addi r6, r6, lbl_80285A58@l
/* 00000524 80070004 */ lwz r0, 4(r7)
/* 00000528 39840000 */ addi r12, r4, lbl_80285A80@l
/* 0000052C 38A80008 */ addi r5, r8, 8
/* 00000530 90030000 */ stw r0, lbl_802F1FD0@l(r3)
/* 00000534 38000002 */ li r0, 2
/* 00000538 3C600000 */ lis r3, lbl_80285A68@ha
/* 0000053C 7C0903A6 */ mtctr r0
/* 00000540 3BE30000 */ addi r31, r3, lbl_80285A68@l
/* 00000544 38680044 */ addi r3, r8, 0x44
/* 00000548 39480054 */ addi r10, r8, 0x54
/* 0000054C 3968005C */ addi r11, r8, 0x5c
/* 00000550 3BC00000 */ li r30, 0
lbl_00000554:
/* 00000554 38800000 */ li r4, 0
/* 00000558 90830000 */ stw r4, 0(r3)
/* 0000055C 7FC00734 */ extsh r0, r30
/* 00000560 3BDE0001 */ addi r30, r30, 1
/* 00000564 90850000 */ stw r4, 0(r5)
/* 00000568 90860000 */ stw r4, 0(r6)
/* 0000056C B0890000 */ sth r4, 0(r9)
/* 00000570 B00A0000 */ sth r0, 0(r10)
/* 00000574 B00B0000 */ sth r0, 0(r11)
/* 00000578 7FC00734 */ extsh r0, r30
/* 0000057C 3BDE0001 */ addi r30, r30, 1
/* 00000580 B08C0000 */ sth r4, 0(r12)
/* 00000584 B08C0002 */ sth r4, 2(r12)
/* 00000588 B08C0004 */ sth r4, 4(r12)
/* 0000058C B08C0006 */ sth r4, 6(r12)
/* 00000590 B08C0008 */ sth r4, 8(r12)
/* 00000594 B08C000A */ sth r4, 0xa(r12)
/* 00000598 B09F0000 */ sth r4, 0(r31)
/* 0000059C B09F0002 */ sth r4, 2(r31)
/* 000005A0 B09F0004 */ sth r4, 4(r31)
/* 000005A4 90830004 */ stw r4, 4(r3)
/* 000005A8 38630008 */ addi r3, r3, 8
/* 000005AC 90850004 */ stw r4, 4(r5)
/* 000005B0 38A50008 */ addi r5, r5, 8
/* 000005B4 90860004 */ stw r4, 4(r6)
/* 000005B8 38C60008 */ addi r6, r6, 8
/* 000005BC B0890002 */ sth r4, 2(r9)
/* 000005C0 39290004 */ addi r9, r9, 4
/* 000005C4 B00A0002 */ sth r0, 2(r10)
/* 000005C8 394A0004 */ addi r10, r10, 4
/* 000005CC B00B0002 */ sth r0, 2(r11)
/* 000005D0 396B0004 */ addi r11, r11, 4
/* 000005D4 B08C000C */ sth r4, 0xc(r12)
/* 000005D8 B08C000E */ sth r4, 0xe(r12)
/* 000005DC B08C0010 */ sth r4, 0x10(r12)
/* 000005E0 B08C0012 */ sth r4, 0x12(r12)
/* 000005E4 B08C0014 */ sth r4, 0x14(r12)
/* 000005E8 B08C0016 */ sth r4, 0x16(r12)
/* 000005EC 398C0018 */ addi r12, r12, 0x18
/* 000005F0 B09F0006 */ sth r4, 6(r31)
/* 000005F4 B09F0008 */ sth r4, 8(r31)
/* 000005F8 B09F000A */ sth r4, 0xa(r31)
/* 000005FC 3BFF000C */ addi r31, r31, 0xc
/* 00000600 4200FF54 */ bdnz lbl_00000554
/* 00000604 3C600000 */ lis r3, lbl_802F1FEC@ha
/* 00000608 B0830000 */ sth r4, lbl_802F1FEC@l(r3)
/* 0000060C 3860FFFF */ li r3, -1
/* 00000610 38000001 */ li r0, 1
/* 00000614 9068002C */ stw r3, 0x2c(r8)
/* 00000618 90680030 */ stw r3, 0x30(r8)
/* 0000061C 88670000 */ lbz r3, 0(r7)
/* 00000620 7C630774 */ extsb r3, r3
/* 00000624 B0680064 */ sth r3, 0x64(r8)
/* 00000628 B0080066 */ sth r0, 0x66(r8)
/* 0000062C 4800006D */ bl lbl_00000698
/* 00000630 8001002C */ lwz r0, 0x2c(r1)
/* 00000634 83E10024 */ lwz r31, 0x24(r1)
/* 00000638 83C10020 */ lwz r30, 0x20(r1)
/* 0000063C 7C0803A6 */ mtlr r0
/* 00000640 38210028 */ addi r1, r1, 0x28
/* 00000644 4E800020 */ blr 
lbl_00000648:
/* 00000648 7C0802A6 */ mflr r0
/* 0000064C 38600003 */ li r3, 3
/* 00000650 90010004 */ stw r0, 4(r1)
/* 00000654 9421FFF8 */ stwu r1, -8(r1)
/* 00000658 4BFFFAF5 */ bl u_load_minigame_graphics
/* 0000065C 8001000C */ lwz r0, 0xc(r1)
/* 00000660 38210008 */ addi r1, r1, 8
/* 00000664 7C0803A6 */ mtlr r0
/* 00000668 4E800020 */ blr 
lbl_0000066C:
/* 0000066C 7C0802A6 */ mflr r0
/* 00000670 90010004 */ stw r0, 4(r1)
/* 00000674 9421FFF8 */ stwu r1, -8(r1)
/* 00000678 4BFFFAD5 */ bl u_free_minigame_graphics
/* 0000067C 3C600000 */ lis r3, lbl_802F1FD4@ha
/* 00000680 38000000 */ li r0, 0
/* 00000684 90030000 */ stw r0, lbl_802F1FD4@l(r3)
/* 00000688 8001000C */ lwz r0, 0xc(r1)
/* 0000068C 38210008 */ addi r1, r1, 8
/* 00000690 7C0803A6 */ mtlr r0
/* 00000694 4E800020 */ blr 
lbl_00000698:
/* 00000698 7C0802A6 */ mflr r0
/* 0000069C 3C800000 */ lis r4, lbl_10000000@ha
/* 000006A0 90010004 */ stw r0, 4(r1)
/* 000006A4 3C600000 */ lis r3, lbl_0000C740@ha
/* 000006A8 9421FFE0 */ stwu r1, -0x20(r1)
/* 000006AC 93E1001C */ stw r31, 0x1c(r1)
/* 000006B0 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 000006B4 93C10018 */ stw r30, 0x18(r1)
/* 000006B8 3BC30000 */ addi r30, r3, lbl_0000C740@l
/* 000006BC 4BFFFA91 */ bl event_finish_all
/* 000006C0 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000006C4 38A30000 */ addi r5, r3, lbl_802F1FD0@l
/* 000006C8 80050000 */ lwz r0, 0(r5)
/* 000006CC 3C800000 */ lis r4, pauseMenuState@ha
/* 000006D0 3C600000 */ lis r3, fogInfo@ha
/* 000006D4 540006F8 */ rlwinm r0, r0, 0, 0x1b, 0x1c
/* 000006D8 90050000 */ stw r0, 0(r5)
/* 000006DC 38A40000 */ addi r5, r4, pauseMenuState@l
/* 000006E0 38630000 */ addi r3, r3, fogInfo@l
/* 000006E4 80850004 */ lwz r4, 4(r5)
/* 000006E8 38000000 */ li r0, 0
/* 000006EC 60840002 */ ori r4, r4, 2
/* 000006F0 90850004 */ stw r4, 4(r5)
/* 000006F4 9803000F */ stb r0, 0xf(r3)
/* 000006F8 A81F0040 */ lha r0, 0x40(r31)
/* 000006FC 5400083C */ slwi r0, r0, 1
/* 00000700 7C7E02AE */ lhax r3, r30, r0
/* 00000704 4BFFFA49 */ bl load_stage
/* 00000708 A87F0040 */ lha r3, 0x40(r31)
/* 0000070C 38030001 */ addi r0, r3, 1
/* 00000710 2C000003 */ cmpwi r0, 3
/* 00000714 41800010 */ blt lbl_00000724
/* 00000718 A87E0000 */ lha r3, 0(r30)
/* 0000071C 4BFFFA31 */ bl preload_stage_files
/* 00000720 48000014 */ b lbl_00000734
lbl_00000724:
/* 00000724 5460083C */ slwi r0, r3, 1
/* 00000728 7C7E0214 */ add r3, r30, r0
/* 0000072C A8630002 */ lha r3, 2(r3)
/* 00000730 4BFFFA1D */ bl preload_stage_files
lbl_00000734:
/* 00000734 801F0044 */ lwz r0, 0x44(r31)
/* 00000738 3C800000 */ lis r4, lbl_80285A58@ha
/* 0000073C 38A40000 */ addi r5, r4, lbl_80285A58@l
/* 00000740 901F0008 */ stw r0, 8(r31)
/* 00000744 38C00000 */ li r6, 0
/* 00000748 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 0000074C 90C50000 */ stw r6, 0(r5)
/* 00000750 38000001 */ li r0, 1
/* 00000754 A89F005C */ lha r4, 0x5c(r31)
/* 00000758 B09F0054 */ sth r4, 0x54(r31)
/* 0000075C 809F0048 */ lwz r4, 0x48(r31)
/* 00000760 909F000C */ stw r4, 0xc(r31)
/* 00000764 90C50004 */ stw r6, 4(r5)
/* 00000768 A89F005E */ lha r4, 0x5e(r31)
/* 0000076C B09F0056 */ sth r4, 0x56(r31)
/* 00000770 809F004C */ lwz r4, 0x4c(r31)
/* 00000774 909F0010 */ stw r4, 0x10(r31)
/* 00000778 90C50008 */ stw r6, 8(r5)
/* 0000077C A89F0060 */ lha r4, 0x60(r31)
/* 00000780 B09F0058 */ sth r4, 0x58(r31)
/* 00000784 809F0050 */ lwz r4, 0x50(r31)
/* 00000788 909F0014 */ stw r4, 0x14(r31)
/* 0000078C 90C5000C */ stw r6, 0xc(r5)
/* 00000790 A89F0062 */ lha r4, 0x62(r31)
/* 00000794 B09F005A */ sth r4, 0x5a(r31)
/* 00000798 B0DF0036 */ sth r6, 0x36(r31)
/* 0000079C B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 000007A0 80010024 */ lwz r0, 0x24(r1)
/* 000007A4 83E1001C */ lwz r31, 0x1c(r1)
/* 000007A8 83C10018 */ lwz r30, 0x18(r1)
/* 000007AC 7C0803A6 */ mtlr r0
/* 000007B0 38210020 */ addi r1, r1, 0x20
/* 000007B4 4E800020 */ blr 
lbl_000007B8:
/* 000007B8 7C0802A6 */ mflr r0
/* 000007BC 38800000 */ li r4, 0
/* 000007C0 90010004 */ stw r0, 4(r1)
/* 000007C4 38A0008C */ li r5, 0x8c
/* 000007C8 9421FF60 */ stwu r1, -0xa0(r1)
/* 000007CC 93E1009C */ stw r31, 0x9c(r1)
/* 000007D0 3861000C */ addi r3, r1, 0xc
/* 000007D4 93C10098 */ stw r30, 0x98(r1)
/* 000007D8 4BFFF975 */ bl memset
/* 000007DC 38000005 */ li r0, 5
/* 000007E0 3C600000 */ lis r3, lbl_0000C88C@ha
/* 000007E4 B0010010 */ sth r0, 0x10(r1)
/* 000007E8 3BC30000 */ addi r30, r3, lbl_0000C88C@l
/* 000007EC 3BE00000 */ li r31, 0
/* 000007F0 48000034 */ b lbl_00000824
lbl_000007F4:
/* 000007F4 809E0000 */ lwz r4, 0(r30)
/* 000007F8 3861000C */ addi r3, r1, 0xc
/* 000007FC 801E0004 */ lwz r0, 4(r30)
/* 00000800 9081002C */ stw r4, 0x2c(r1)
/* 00000804 90010030 */ stw r0, 0x30(r1)
/* 00000808 801E0008 */ lwz r0, 8(r30)
/* 0000080C 90010034 */ stw r0, 0x34(r1)
/* 00000810 A81E000C */ lha r0, 0xc(r30)
/* 00000814 B0010012 */ sth r0, 0x12(r1)
/* 00000818 9BE10068 */ stb r31, 0x68(r1)
/* 0000081C 4BFFF931 */ bl func_80068474
/* 00000820 3BDE0010 */ addi r30, r30, 0x10
lbl_00000824:
/* 00000824 A81E000C */ lha r0, 0xc(r30)
/* 00000828 2C00FFFF */ cmpwi r0, -1
/* 0000082C 4082FFC8 */ bne lbl_000007F4
/* 00000830 3C600000 */ lis r3, lbl_10000040@ha
/* 00000834 A8830000 */ lha r4, lbl_10000040@l(r3)
/* 00000838 3C600000 */ lis r3, lbl_0000CB0C@ha
/* 0000083C 38030000 */ addi r0, r3, lbl_0000CB0C@l
/* 00000840 5483103A */ slwi r3, r4, 2
/* 00000844 7C601A14 */ add r3, r0, r3
/* 00000848 83C30000 */ lwz r30, 0(r3)
/* 0000084C 3BE00000 */ li r31, 0
/* 00000850 48000034 */ b lbl_00000884
lbl_00000854:
/* 00000854 809E0000 */ lwz r4, 0(r30)
/* 00000858 3861000C */ addi r3, r1, 0xc
/* 0000085C 801E0004 */ lwz r0, 4(r30)
/* 00000860 9081002C */ stw r4, 0x2c(r1)
/* 00000864 90010030 */ stw r0, 0x30(r1)
/* 00000868 801E0008 */ lwz r0, 8(r30)
/* 0000086C 90010034 */ stw r0, 0x34(r1)
/* 00000870 A81E000C */ lha r0, 0xc(r30)
/* 00000874 B0010012 */ sth r0, 0x12(r1)
/* 00000878 9BE10068 */ stb r31, 0x68(r1)
/* 0000087C 4BFFF8D1 */ bl func_80068474
/* 00000880 3BDE0010 */ addi r30, r30, 0x10
lbl_00000884:
/* 00000884 A81E000C */ lha r0, 0xc(r30)
/* 00000888 2C00FFFF */ cmpwi r0, -1
/* 0000088C 4082FFC8 */ bne lbl_00000854
/* 00000890 4800036D */ bl lbl_00000BFC
/* 00000894 800100A4 */ lwz r0, 0xa4(r1)
/* 00000898 83E1009C */ lwz r31, 0x9c(r1)
/* 0000089C 83C10098 */ lwz r30, 0x98(r1)
/* 000008A0 7C0803A6 */ mtlr r0
/* 000008A4 382100A0 */ addi r1, r1, 0xa0
/* 000008A8 4E800020 */ blr 
lbl_000008AC:
/* 000008AC 7C0802A6 */ mflr r0
/* 000008B0 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000008B4 90010004 */ stw r0, 4(r1)
/* 000008B8 38800000 */ li r4, 0
/* 000008BC 38A0008C */ li r5, 0x8c
/* 000008C0 9421FF38 */ stwu r1, -0xc8(r1)
/* 000008C4 BF6100B4 */ stmw r27, 0xb4(r1)
/* 000008C8 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 000008CC 3861000C */ addi r3, r1, 0xc
/* 000008D0 4BFFF87D */ bl memset
/* 000008D4 38000005 */ li r0, 5
/* 000008D8 B0010010 */ sth r0, 0x10(r1)
/* 000008DC 38000004 */ li r0, 4
/* 000008E0 3C800000 */ lis r4, lbl_10000040@ha
/* 000008E4 B0010012 */ sth r0, 0x12(r1)
/* 000008E8 38000000 */ li r0, 0
/* 000008EC 3C600000 */ lis r3, lbl_0000CBCC@ha
/* 000008F0 98010068 */ stb r0, 0x68(r1)
/* 000008F4 38030000 */ addi r0, r3, lbl_0000CBCC@l
/* 000008F8 3B800000 */ li r28, 0
/* 000008FC A8640000 */ lha r3, lbl_10000040@l(r4)
/* 00000900 3FC04330 */ lis r30, 0x4330
/* 00000904 5463103A */ slwi r3, r3, 2
/* 00000908 7C601A14 */ add r3, r0, r3
/* 0000090C 83A30000 */ lwz r29, 0(r3)
lbl_00000910:
/* 00000910 3B600000 */ li r27, 0
/* 00000914 480000E8 */ b lbl_000009FC
lbl_00000918:
/* 00000918 4BFFF835 */ bl rand
/* 0000091C 6C608000 */ xoris r0, r3, 0x8000
/* 00000920 C07F0058 */ lfs f3, 0x58(r31)
/* 00000924 900100AC */ stw r0, 0xac(r1)
/* 00000928 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 0000092C C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 00000930 93C100A8 */ stw r30, 0xa8(r1)
/* 00000934 C85F0068 */ lfd f2, 0x68(r31)
/* 00000938 C80100A8 */ lfd f0, 0xa8(r1)
/* 0000093C C03D000C */ lfs f1, 0xc(r29)
/* 00000940 EC802028 */ fsubs f4, f0, f4
/* 00000944 C01D0000 */ lfs f0, 0(r29)
/* 00000948 EC641824 */ fdivs f3, f4, f3
/* 0000094C FC431028 */ fsub f2, f3, f2
/* 00000950 FC2100B2 */ fmul f1, f1, f2
/* 00000954 FC00082A */ fadd f0, f0, f1
/* 00000958 FC000018 */ frsp f0, f0
/* 0000095C D001002C */ stfs f0, 0x2c(r1)
/* 00000960 4BFFF7ED */ bl rand
/* 00000964 6C608000 */ xoris r0, r3, 0x8000
/* 00000968 C07F0058 */ lfs f3, 0x58(r31)
/* 0000096C 900100A4 */ stw r0, 0xa4(r1)
/* 00000970 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00000974 C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 00000978 93C100A0 */ stw r30, 0xa0(r1)
/* 0000097C C83F0070 */ lfd f1, 0x70(r31)
/* 00000980 C80100A0 */ lfd f0, 0xa0(r1)
/* 00000984 C85F0078 */ lfd f2, 0x78(r31)
/* 00000988 EC802028 */ fsubs f4, f0, f4
/* 0000098C C01D0004 */ lfs f0, 4(r29)
/* 00000990 FC01002A */ fadd f0, f1, f0
/* 00000994 EC241824 */ fdivs f1, f4, f3
/* 00000998 FC220072 */ fmul f1, f2, f1
/* 0000099C FC00082A */ fadd f0, f0, f1
/* 000009A0 FC000018 */ frsp f0, f0
/* 000009A4 D0010030 */ stfs f0, 0x30(r1)
/* 000009A8 4BFFF7A5 */ bl rand
/* 000009AC 6C608000 */ xoris r0, r3, 0x8000
/* 000009B0 C07F0058 */ lfs f3, 0x58(r31)
/* 000009B4 9001009C */ stw r0, 0x9c(r1)
/* 000009B8 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 000009BC C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 000009C0 3861000C */ addi r3, r1, 0xc
/* 000009C4 93C10098 */ stw r30, 0x98(r1)
/* 000009C8 C85F0068 */ lfd f2, 0x68(r31)
/* 000009CC C8010098 */ lfd f0, 0x98(r1)
/* 000009D0 C03D000C */ lfs f1, 0xc(r29)
/* 000009D4 EC802028 */ fsubs f4, f0, f4
/* 000009D8 C01D0008 */ lfs f0, 8(r29)
/* 000009DC EC641824 */ fdivs f3, f4, f3
/* 000009E0 FC431028 */ fsub f2, f3, f2
/* 000009E4 FC2100B2 */ fmul f1, f1, f2
/* 000009E8 FC00082A */ fadd f0, f0, f1
/* 000009EC FC000018 */ frsp f0, f0
/* 000009F0 D0010034 */ stfs f0, 0x34(r1)
/* 000009F4 4BFFF759 */ bl func_80068474
/* 000009F8 3B7B0001 */ addi r27, r27, 1
lbl_000009FC:
/* 000009FC 881D0010 */ lbz r0, 0x10(r29)
/* 00000A00 7C000774 */ extsb r0, r0
/* 00000A04 7C1B0000 */ cmpw r27, r0
/* 00000A08 4180FF10 */ blt lbl_00000918
/* 00000A0C 3B9C0001 */ addi r28, r28, 1
/* 00000A10 2C1C0003 */ cmpwi r28, 3
/* 00000A14 3BBD0014 */ addi r29, r29, 0x14
/* 00000A18 4180FEF8 */ blt lbl_00000910
/* 00000A1C BB6100B4 */ lmw r27, 0xb4(r1)
/* 00000A20 800100CC */ lwz r0, 0xcc(r1)
/* 00000A24 382100C8 */ addi r1, r1, 0xc8
/* 00000A28 7C0803A6 */ mtlr r0
/* 00000A2C 4E800020 */ blr 
lbl_00000A30:
/* 00000A30 7C0802A6 */ mflr r0
/* 00000A34 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00000A38 90010004 */ stw r0, 4(r1)
/* 00000A3C 38A0008C */ li r5, 0x8c
/* 00000A40 9421FF00 */ stwu r1, -0x100(r1)
/* 00000A44 DBE100F8 */ stfd f31, 0xf8(r1)
/* 00000A48 38E10024 */ addi r7, r1, 0x24
/* 00000A4C 38C10018 */ addi r6, r1, 0x18
/* 00000A50 BEE100D4 */ stmw r23, 0xd4(r1)
/* 00000A54 3BA30000 */ addi r29, r3, lbl_0000BE80@l
/* 00000A58 3C600000 */ lis r3, lbl_10000040@ha
/* 00000A5C 3BC30000 */ addi r30, r3, lbl_10000040@l
/* 00000A60 38610030 */ addi r3, r1, 0x30
/* 00000A64 809D0080 */ lwz r4, 0x80(r29)
/* 00000A68 801D0084 */ lwz r0, 0x84(r29)
/* 00000A6C 90810024 */ stw r4, 0x24(r1)
/* 00000A70 38800000 */ li r4, 0
/* 00000A74 90010028 */ stw r0, 0x28(r1)
/* 00000A78 801D0088 */ lwz r0, 0x88(r29)
/* 00000A7C 9001002C */ stw r0, 0x2c(r1)
/* 00000A80 811D008C */ lwz r8, 0x8c(r29)
/* 00000A84 801D0090 */ lwz r0, 0x90(r29)
/* 00000A88 91010018 */ stw r8, 0x18(r1)
/* 00000A8C 9001001C */ stw r0, 0x1c(r1)
/* 00000A90 801D0094 */ lwz r0, 0x94(r29)
/* 00000A94 90010020 */ stw r0, 0x20(r1)
/* 00000A98 A01D0098 */ lhz r0, 0x98(r29)
/* 00000A9C B0010014 */ sth r0, 0x14(r1)
/* 00000AA0 881D009A */ lbz r0, 0x9a(r29)
/* 00000AA4 98010016 */ stb r0, 0x16(r1)
/* 00000AA8 A81E0000 */ lha r0, 0(r30)
/* 00000AAC 5400103A */ slwi r0, r0, 2
/* 00000AB0 7F47002E */ lwzx r26, r7, r0
/* 00000AB4 7F26002E */ lwzx r25, r6, r0
/* 00000AB8 4BFFF695 */ bl memset
/* 00000ABC 38000005 */ li r0, 5
/* 00000AC0 B0010034 */ sth r0, 0x34(r1)
/* 00000AC4 3B810008 */ addi r28, r1, 8
/* 00000AC8 3B010014 */ addi r24, r1, 0x14
/* 00000ACC 3B600000 */ li r27, 0
/* 00000AD0 3FE04330 */ lis r31, 0x4330
/* 00000AD4 480000FC */ b lbl_00000BD0
lbl_00000AD8:
/* 00000AD8 4BFFF675 */ bl rand
/* 00000ADC 5460073E */ clrlwi r0, r3, 0x1c
/* 00000AE0 7C1900AE */ lbzx r0, r25, r0
/* 00000AE4 7C000774 */ extsb r0, r0
/* 00000AE8 1C000018 */ mulli r0, r0, 0x18
/* 00000AEC 7EFA0214 */ add r23, r26, r0
/* 00000AF0 C3F7000C */ lfs f31, 0xc(r23)
/* 00000AF4 4BFFF659 */ bl rand
/* 00000AF8 6C608000 */ xoris r0, r3, 0x8000
/* 00000AFC C81D0068 */ lfd f0, 0x68(r29)
/* 00000B00 900100CC */ stw r0, 0xcc(r1)
/* 00000B04 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00000B08 FC2007F2 */ fmul f1, f0, f31
/* 00000B0C C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 00000B10 93E100C8 */ stw r31, 0xc8(r1)
/* 00000B14 C05D0058 */ lfs f2, 0x58(r29)
/* 00000B18 C86100C8 */ lfd f3, 0xc8(r1)
/* 00000B1C EC632028 */ fsubs f3, f3, f4
/* 00000B20 C0170000 */ lfs f0, 0(r23)
/* 00000B24 EC431024 */ fdivs f2, f3, f2
/* 00000B28 EC5F00B2 */ fmuls f2, f31, f2
/* 00000B2C FC220828 */ fsub f1, f2, f1
/* 00000B30 FC00082A */ fadd f0, f0, f1
/* 00000B34 FC000018 */ frsp f0, f0
/* 00000B38 D0010050 */ stfs f0, 0x50(r1)
/* 00000B3C C0170004 */ lfs f0, 4(r23)
/* 00000B40 D0010054 */ stfs f0, 0x54(r1)
/* 00000B44 C3F70010 */ lfs f31, 0x10(r23)
/* 00000B48 4BFFF605 */ bl rand
/* 00000B4C 6C608000 */ xoris r0, r3, 0x8000
/* 00000B50 C81D0068 */ lfd f0, 0x68(r29)
/* 00000B54 900100C4 */ stw r0, 0xc4(r1)
/* 00000B58 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00000B5C C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 00000B60 FC2007F2 */ fmul f1, f0, f31
/* 00000B64 93E100C0 */ stw r31, 0xc0(r1)
/* 00000B68 C05D0058 */ lfs f2, 0x58(r29)
/* 00000B6C 7EE3BB78 */ mr r3, r23
/* 00000B70 C86100C0 */ lfd f3, 0xc0(r1)
/* 00000B74 EC632028 */ fsubs f3, f3, f4
/* 00000B78 C0170008 */ lfs f0, 8(r23)
/* 00000B7C 7F84E378 */ mr r4, r28
/* 00000B80 EC431024 */ fdivs f2, f3, f2
/* 00000B84 EC5F00B2 */ fmuls f2, f31, f2
/* 00000B88 FC220828 */ fsub f1, f2, f1
/* 00000B8C FC00082A */ fadd f0, f0, f1
/* 00000B90 FC000018 */ frsp f0, f0
/* 00000B94 D0010058 */ stfs f0, 0x58(r1)
/* 00000B98 80A10050 */ lwz r5, 0x50(r1)
/* 00000B9C 80010054 */ lwz r0, 0x54(r1)
/* 00000BA0 90A10008 */ stw r5, 8(r1)
/* 00000BA4 9001000C */ stw r0, 0xc(r1)
/* 00000BA8 80010058 */ lwz r0, 0x58(r1)
/* 00000BAC 90010010 */ stw r0, 0x10(r1)
/* 00000BB0 48000219 */ bl lbl_00000DC8
/* 00000BB4 7C600774 */ extsb r0, r3
/* 00000BB8 9801008C */ stb r0, 0x8c(r1)
/* 00000BBC 38000003 */ li r0, 3
/* 00000BC0 38610030 */ addi r3, r1, 0x30
/* 00000BC4 B0010036 */ sth r0, 0x36(r1)
/* 00000BC8 4BFFF585 */ bl func_80068474
/* 00000BCC 3B7B0001 */ addi r27, r27, 1
lbl_00000BD0:
/* 00000BD0 A81E0000 */ lha r0, 0(r30)
/* 00000BD4 7C1800AE */ lbzx r0, r24, r0
/* 00000BD8 7C000774 */ extsb r0, r0
/* 00000BDC 7C1B0000 */ cmpw r27, r0
/* 00000BE0 4180FEF8 */ blt lbl_00000AD8
/* 00000BE4 BAE100D4 */ lmw r23, 0xd4(r1)
/* 00000BE8 80010104 */ lwz r0, 0x104(r1)
/* 00000BEC CBE100F8 */ lfd f31, 0xf8(r1)
/* 00000BF0 38210100 */ addi r1, r1, 0x100
/* 00000BF4 7C0803A6 */ mtlr r0
/* 00000BF8 4E800020 */ blr 
lbl_00000BFC:
/* 00000BFC 7C0802A6 */ mflr r0
/* 00000C00 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00000C04 90010004 */ stw r0, 4(r1)
/* 00000C08 38A0008C */ li r5, 0x8c
/* 00000C0C 9421FF00 */ stwu r1, -0x100(r1)
/* 00000C10 DBE100F8 */ stfd f31, 0xf8(r1)
/* 00000C14 38E10024 */ addi r7, r1, 0x24
/* 00000C18 38C10018 */ addi r6, r1, 0x18
/* 00000C1C BEE100D4 */ stmw r23, 0xd4(r1)
/* 00000C20 3BA30000 */ addi r29, r3, lbl_0000BE80@l
/* 00000C24 3C600000 */ lis r3, lbl_10000040@ha
/* 00000C28 3BC30000 */ addi r30, r3, lbl_10000040@l
/* 00000C2C 38610030 */ addi r3, r1, 0x30
/* 00000C30 809D009C */ lwz r4, 0x9c(r29)
/* 00000C34 801D00A0 */ lwz r0, 0xa0(r29)
/* 00000C38 90810024 */ stw r4, 0x24(r1)
/* 00000C3C 38800000 */ li r4, 0
/* 00000C40 90010028 */ stw r0, 0x28(r1)
/* 00000C44 801D00A4 */ lwz r0, 0xa4(r29)
/* 00000C48 9001002C */ stw r0, 0x2c(r1)
/* 00000C4C 811D00A8 */ lwz r8, 0xa8(r29)
/* 00000C50 801D00AC */ lwz r0, 0xac(r29)
/* 00000C54 91010018 */ stw r8, 0x18(r1)
/* 00000C58 9001001C */ stw r0, 0x1c(r1)
/* 00000C5C 801D00B0 */ lwz r0, 0xb0(r29)
/* 00000C60 90010020 */ stw r0, 0x20(r1)
/* 00000C64 A01D00B4 */ lhz r0, 0xb4(r29)
/* 00000C68 B0010014 */ sth r0, 0x14(r1)
/* 00000C6C 881D00B6 */ lbz r0, 0xb6(r29)
/* 00000C70 98010016 */ stb r0, 0x16(r1)
/* 00000C74 A81E0000 */ lha r0, 0(r30)
/* 00000C78 5400103A */ slwi r0, r0, 2
/* 00000C7C 7F47002E */ lwzx r26, r7, r0
/* 00000C80 7F26002E */ lwzx r25, r6, r0
/* 00000C84 4BFFF4C9 */ bl memset
/* 00000C88 38000005 */ li r0, 5
/* 00000C8C B0010034 */ sth r0, 0x34(r1)
/* 00000C90 3B810008 */ addi r28, r1, 8
/* 00000C94 3B010014 */ addi r24, r1, 0x14
/* 00000C98 3B600000 */ li r27, 0
/* 00000C9C 3FE04330 */ lis r31, 0x4330
/* 00000CA0 480000FC */ b lbl_00000D9C
lbl_00000CA4:
/* 00000CA4 4BFFF4A9 */ bl rand
/* 00000CA8 5460073E */ clrlwi r0, r3, 0x1c
/* 00000CAC 7C1900AE */ lbzx r0, r25, r0
/* 00000CB0 7C000774 */ extsb r0, r0
/* 00000CB4 1C000018 */ mulli r0, r0, 0x18
/* 00000CB8 7EFA0214 */ add r23, r26, r0
/* 00000CBC C3F7000C */ lfs f31, 0xc(r23)
/* 00000CC0 4BFFF48D */ bl rand
/* 00000CC4 6C608000 */ xoris r0, r3, 0x8000
/* 00000CC8 C81D0068 */ lfd f0, 0x68(r29)
/* 00000CCC 900100CC */ stw r0, 0xcc(r1)
/* 00000CD0 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00000CD4 FC2007F2 */ fmul f1, f0, f31
/* 00000CD8 C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 00000CDC 93E100C8 */ stw r31, 0xc8(r1)
/* 00000CE0 C05D0058 */ lfs f2, 0x58(r29)
/* 00000CE4 C86100C8 */ lfd f3, 0xc8(r1)
/* 00000CE8 EC632028 */ fsubs f3, f3, f4
/* 00000CEC C0170000 */ lfs f0, 0(r23)
/* 00000CF0 EC431024 */ fdivs f2, f3, f2
/* 00000CF4 EC5F00B2 */ fmuls f2, f31, f2
/* 00000CF8 FC220828 */ fsub f1, f2, f1
/* 00000CFC FC00082A */ fadd f0, f0, f1
/* 00000D00 FC000018 */ frsp f0, f0
/* 00000D04 D0010050 */ stfs f0, 0x50(r1)
/* 00000D08 C0170004 */ lfs f0, 4(r23)
/* 00000D0C D0010054 */ stfs f0, 0x54(r1)
/* 00000D10 C3F70010 */ lfs f31, 0x10(r23)
/* 00000D14 4BFFF439 */ bl rand
/* 00000D18 6C608000 */ xoris r0, r3, 0x8000
/* 00000D1C C81D0068 */ lfd f0, 0x68(r29)
/* 00000D20 900100C4 */ stw r0, 0xc4(r1)
/* 00000D24 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00000D28 C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 00000D2C FC2007F2 */ fmul f1, f0, f31
/* 00000D30 93E100C0 */ stw r31, 0xc0(r1)
/* 00000D34 C05D0058 */ lfs f2, 0x58(r29)
/* 00000D38 7EE3BB78 */ mr r3, r23
/* 00000D3C C86100C0 */ lfd f3, 0xc0(r1)
/* 00000D40 EC632028 */ fsubs f3, f3, f4
/* 00000D44 C0170008 */ lfs f0, 8(r23)
/* 00000D48 7F84E378 */ mr r4, r28
/* 00000D4C EC431024 */ fdivs f2, f3, f2
/* 00000D50 EC5F00B2 */ fmuls f2, f31, f2
/* 00000D54 FC220828 */ fsub f1, f2, f1
/* 00000D58 FC00082A */ fadd f0, f0, f1
/* 00000D5C FC000018 */ frsp f0, f0
/* 00000D60 D0010058 */ stfs f0, 0x58(r1)
/* 00000D64 80A10050 */ lwz r5, 0x50(r1)
/* 00000D68 80010054 */ lwz r0, 0x54(r1)
/* 00000D6C 90A10008 */ stw r5, 8(r1)
/* 00000D70 9001000C */ stw r0, 0xc(r1)
/* 00000D74 80010058 */ lwz r0, 0x58(r1)
/* 00000D78 90010010 */ stw r0, 0x10(r1)
/* 00000D7C 4800004D */ bl lbl_00000DC8
/* 00000D80 7C600774 */ extsb r0, r3
/* 00000D84 9801008C */ stb r0, 0x8c(r1)
/* 00000D88 38000001 */ li r0, 1
/* 00000D8C 38610030 */ addi r3, r1, 0x30
/* 00000D90 B0010036 */ sth r0, 0x36(r1)
/* 00000D94 4BFFF3B9 */ bl func_80068474
/* 00000D98 3B7B0001 */ addi r27, r27, 1
lbl_00000D9C:
/* 00000D9C A81E0000 */ lha r0, 0(r30)
/* 00000DA0 7C1800AE */ lbzx r0, r24, r0
/* 00000DA4 7C000774 */ extsb r0, r0
/* 00000DA8 7C1B0000 */ cmpw r27, r0
/* 00000DAC 4180FEF8 */ blt lbl_00000CA4
/* 00000DB0 BAE100D4 */ lmw r23, 0xd4(r1)
/* 00000DB4 80010104 */ lwz r0, 0x104(r1)
/* 00000DB8 CBE100F8 */ lfd f31, 0xf8(r1)
/* 00000DBC 38210100 */ addi r1, r1, 0x100
/* 00000DC0 7C0803A6 */ mtlr r0
/* 00000DC4 4E800020 */ blr 
lbl_00000DC8:
/* 00000DC8 7C0802A6 */ mflr r0
/* 00000DCC 3CA00000 */ lis r5, lbl_0000C740@ha
/* 00000DD0 90010004 */ stw r0, 4(r1)
/* 00000DD4 38A50000 */ addi r5, r5, lbl_0000C740@l
/* 00000DD8 380504B0 */ addi r0, r5, 0x4b0
/* 00000DDC 9421FFA0 */ stwu r1, -0x60(r1)
/* 00000DE0 7C030040 */ cmplw r3, r0
/* 00000DE4 3CC00000 */ lis r6, lbl_0000BE80@ha
/* 00000DE8 93E1005C */ stw r31, 0x5c(r1)
/* 00000DEC 3BE60000 */ addi r31, r6, lbl_0000BE80@l
/* 00000DF0 40820058 */ bne lbl_00000E48
/* 00000DF4 C0640008 */ lfs f3, 8(r4)
/* 00000DF8 C0440000 */ lfs f2, 0(r4)
/* 00000DFC C0030008 */ lfs f0, 8(r3)
/* 00000E00 C0230000 */ lfs f1, 0(r3)
/* 00000E04 EC211028 */ fsubs f1, f1, f2
/* 00000E08 EC001828 */ fsubs f0, f0, f3
/* 00000E0C EC210072 */ fmuls f1, f1, f1
/* 00000E10 EC20083A */ fmadds f1, f0, f0, f1
/* 00000E14 4BFFF339 */ bl mathutil_sqrt
/* 00000E18 C81F00D8 */ lfd f0, 0xd8(r31)
/* 00000E1C FC010040 */ fcmpo cr0, f1, f0
/* 00000E20 4080000C */ bge lbl_00000E2C
/* 00000E24 38600004 */ li r3, 4
/* 00000E28 480001E0 */ b lbl_00001008
lbl_00000E2C:
/* 00000E2C C81F00E0 */ lfd f0, 0xe0(r31)
/* 00000E30 FC010040 */ fcmpo cr0, f1, f0
/* 00000E34 4080000C */ bge lbl_00000E40
/* 00000E38 38600003 */ li r3, 3
/* 00000E3C 480001CC */ b lbl_00001008
lbl_00000E40:
/* 00000E40 38600002 */ li r3, 2
/* 00000E44 480001C4 */ b lbl_00001008
lbl_00000E48:
/* 00000E48 38050528 */ addi r0, r5, 0x528
/* 00000E4C 7C030040 */ cmplw r3, r0
/* 00000E50 40820084 */ bne lbl_00000ED4
/* 00000E54 801F00B8 */ lwz r0, 0xb8(r31)
/* 00000E58 90010040 */ stw r0, 0x40(r1)
/* 00000E5C A01F00BC */ lhz r0, 0xbc(r31)
/* 00000E60 B0010044 */ sth r0, 0x44(r1)
/* 00000E64 C0240000 */ lfs f1, 0(r4)
/* 00000E68 C0030000 */ lfs f0, 0(r3)
/* 00000E6C EC010028 */ fsubs f0, f1, f0
/* 00000E70 D0010048 */ stfs f0, 0x48(r1)
/* 00000E74 C0240004 */ lfs f1, 4(r4)
/* 00000E78 C0030004 */ lfs f0, 4(r3)
/* 00000E7C EC010028 */ fsubs f0, f1, f0
/* 00000E80 D001004C */ stfs f0, 0x4c(r1)
/* 00000E84 C0240008 */ lfs f1, 8(r4)
/* 00000E88 C0030008 */ lfs f0, 8(r3)
/* 00000E8C EC010028 */ fsubs f0, f1, f0
/* 00000E90 D0010050 */ stfs f0, 0x50(r1)
/* 00000E94 C0210048 */ lfs f1, 0x48(r1)
/* 00000E98 C0010050 */ lfs f0, 0x50(r1)
/* 00000E9C FC200850 */ fneg f1, f1
/* 00000EA0 FC400050 */ fneg f2, f0
/* 00000EA4 4BFFF2A9 */ bl mathutil_atan2
/* 00000EA8 3C806000 */ lis r4, 0x6000
/* 00000EAC 5460043E */ clrlwi r0, r3, 0x10
/* 00000EB0 38646001 */ addi r3, r4, 0x6001
/* 00000EB4 7C030096 */ mulhw r0, r3, r0
/* 00000EB8 7C006E70 */ srawi r0, r0, 0xd
/* 00000EBC 54030FFE */ srwi r3, r0, 0x1f
/* 00000EC0 7C001A14 */ add r0, r0, r3
/* 00000EC4 5400083C */ slwi r0, r0, 1
/* 00000EC8 38610040 */ addi r3, r1, 0x40
/* 00000ECC 7C6302AE */ lhax r3, r3, r0
/* 00000ED0 48000138 */ b lbl_00001008
lbl_00000ED4:
/* 00000ED4 38050540 */ addi r0, r5, 0x540
/* 00000ED8 7C030040 */ cmplw r3, r0
/* 00000EDC 40820090 */ bne lbl_00000F6C
/* 00000EE0 80BF00C0 */ lwz r5, 0xc0(r31)
/* 00000EE4 801F00C4 */ lwz r0, 0xc4(r31)
/* 00000EE8 90A10028 */ stw r5, 0x28(r1)
/* 00000EEC 9001002C */ stw r0, 0x2c(r1)
/* 00000EF0 801F00C8 */ lwz r0, 0xc8(r31)
/* 00000EF4 90010030 */ stw r0, 0x30(r1)
/* 00000EF8 C0240000 */ lfs f1, 0(r4)
/* 00000EFC C0030000 */ lfs f0, 0(r3)
/* 00000F00 EC010028 */ fsubs f0, f1, f0
/* 00000F04 D0010034 */ stfs f0, 0x34(r1)
/* 00000F08 C0240004 */ lfs f1, 4(r4)
/* 00000F0C C0030004 */ lfs f0, 4(r3)
/* 00000F10 EC010028 */ fsubs f0, f1, f0
/* 00000F14 D0010038 */ stfs f0, 0x38(r1)
/* 00000F18 C0240008 */ lfs f1, 8(r4)
/* 00000F1C C0030008 */ lfs f0, 8(r3)
/* 00000F20 EC010028 */ fsubs f0, f1, f0
/* 00000F24 D001003C */ stfs f0, 0x3c(r1)
/* 00000F28 C0210034 */ lfs f1, 0x34(r1)
/* 00000F2C C001003C */ lfs f0, 0x3c(r1)
/* 00000F30 FC200850 */ fneg f1, f1
/* 00000F34 FC400050 */ fneg f2, f0
/* 00000F38 4BFFF215 */ bl mathutil_atan2
/* 00000F3C 3C80C003 */ lis r4, 0xc003
/* 00000F40 5460043E */ clrlwi r0, r3, 0x10
/* 00000F44 3864000D */ addi r3, r4, 0xd
/* 00000F48 7C630096 */ mulhw r3, r3, r0
/* 00000F4C 7C030214 */ add r0, r3, r0
/* 00000F50 7C006E70 */ srawi r0, r0, 0xd
/* 00000F54 54030FFE */ srwi r3, r0, 0x1f
/* 00000F58 7C001A14 */ add r0, r0, r3
/* 00000F5C 5400083C */ slwi r0, r0, 1
/* 00000F60 38610028 */ addi r3, r1, 0x28
/* 00000F64 7C6302AE */ lhax r3, r3, r0
/* 00000F68 480000A0 */ b lbl_00001008
lbl_00000F6C:
/* 00000F6C 38050558 */ addi r0, r5, 0x558
/* 00000F70 7C030040 */ cmplw r3, r0
/* 00000F74 4082008C */ bne lbl_00001000
/* 00000F78 80BF00CC */ lwz r5, 0xcc(r31)
/* 00000F7C 801F00D0 */ lwz r0, 0xd0(r31)
/* 00000F80 90A10010 */ stw r5, 0x10(r1)
/* 00000F84 90010014 */ stw r0, 0x14(r1)
/* 00000F88 801F00D4 */ lwz r0, 0xd4(r31)
/* 00000F8C 90010018 */ stw r0, 0x18(r1)
/* 00000F90 C0240000 */ lfs f1, 0(r4)
/* 00000F94 C0030000 */ lfs f0, 0(r3)
/* 00000F98 EC010028 */ fsubs f0, f1, f0
/* 00000F9C D001001C */ stfs f0, 0x1c(r1)
/* 00000FA0 C0240004 */ lfs f1, 4(r4)
/* 00000FA4 C0030004 */ lfs f0, 4(r3)
/* 00000FA8 EC010028 */ fsubs f0, f1, f0
/* 00000FAC D0010020 */ stfs f0, 0x20(r1)
/* 00000FB0 C0240008 */ lfs f1, 8(r4)
/* 00000FB4 C0030008 */ lfs f0, 8(r3)
/* 00000FB8 EC010028 */ fsubs f0, f1, f0
/* 00000FBC D0010024 */ stfs f0, 0x24(r1)
/* 00000FC0 C0010024 */ lfs f0, 0x24(r1)
/* 00000FC4 C041001C */ lfs f2, 0x1c(r1)
/* 00000FC8 FC200050 */ fneg f1, f0
/* 00000FCC 4BFFF181 */ bl mathutil_atan2
/* 00000FD0 3C80C003 */ lis r4, 0xc003
/* 00000FD4 5460043E */ clrlwi r0, r3, 0x10
/* 00000FD8 3864000D */ addi r3, r4, 0xd
/* 00000FDC 7C630096 */ mulhw r3, r3, r0
/* 00000FE0 7C030214 */ add r0, r3, r0
/* 00000FE4 7C006E70 */ srawi r0, r0, 0xd
/* 00000FE8 54030FFE */ srwi r3, r0, 0x1f
/* 00000FEC 7C001A14 */ add r0, r0, r3
/* 00000FF0 5400083C */ slwi r0, r0, 1
/* 00000FF4 38610010 */ addi r3, r1, 0x10
/* 00000FF8 7C6302AE */ lhax r3, r3, r0
/* 00000FFC 4800000C */ b lbl_00001008
lbl_00001000:
/* 00001000 88630014 */ lbz r3, 0x14(r3)
/* 00001004 7C630774 */ extsb r3, r3
lbl_00001008:
/* 00001008 80010064 */ lwz r0, 0x64(r1)
/* 0000100C 83E1005C */ lwz r31, 0x5c(r1)
/* 00001010 38210060 */ addi r1, r1, 0x60
/* 00001014 7C0803A6 */ mtlr r0
/* 00001018 4E800020 */ blr 
lbl_0000101C:
/* 0000101C 7C0802A6 */ mflr r0
/* 00001020 3C600000 */ lis r3, modeCtrl@ha
/* 00001024 90010004 */ stw r0, 4(r1)
/* 00001028 38630000 */ addi r3, r3, modeCtrl@l
/* 0000102C 3C800000 */ lis r4, lbl_10000000@ha
/* 00001030 9421FFD0 */ stwu r1, -0x30(r1)
/* 00001034 93E1002C */ stw r31, 0x2c(r1)
/* 00001038 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 0000103C 93C10028 */ stw r30, 0x28(r1)
/* 00001040 3BC3002C */ addi r30, r3, 0x2c
/* 00001044 93A10024 */ stw r29, 0x24(r1)
/* 00001048 3BA00000 */ li r29, 0
/* 0000104C 80E3002C */ lwz r7, 0x2c(r3)
/* 00001050 3C600000 */ lis r3, lbl_80285A58@ha
/* 00001054 38030000 */ addi r0, r3, lbl_80285A58@l
/* 00001058 54E5103A */ slwi r5, r7, 2
/* 0000105C 7C9F2A14 */ add r4, r31, r5
/* 00001060 7CC02A14 */ add r6, r0, r5
/* 00001064 80640044 */ lwz r3, 0x44(r4)
/* 00001068 80060000 */ lwz r0, 0(r6)
/* 0000106C 3CA00000 */ lis r5, lbl_802F1FEC@ha
/* 00001070 7C030214 */ add r0, r3, r0
/* 00001074 90040044 */ stw r0, 0x44(r4)
/* 00001078 3C600000 */ lis r3, lbl_80285A80@ha
/* 0000107C 1C87000C */ mulli r4, r7, 0xc
/* 00001080 93A60000 */ stw r29, 0(r6)
/* 00001084 38030000 */ addi r0, r3, lbl_80285A80@l
/* 00001088 B3A50000 */ sth r29, lbl_802F1FEC@l(r5)
/* 0000108C 7CA02214 */ add r5, r0, r4
/* 00001090 B3A50000 */ sth r29, 0(r5)
/* 00001094 3C600000 */ lis r3, lbl_80285A68@ha
/* 00001098 38030000 */ addi r0, r3, lbl_80285A68@l
/* 0000109C B3A50002 */ sth r29, 2(r5)
/* 000010A0 1C870006 */ mulli r4, r7, 6
/* 000010A4 B3A50004 */ sth r29, 4(r5)
/* 000010A8 7C802214 */ add r4, r0, r4
/* 000010AC B3A50006 */ sth r29, 6(r5)
/* 000010B0 386000EF */ li r3, 0xef
/* 000010B4 B3A50008 */ sth r29, 8(r5)
/* 000010B8 B3A5000A */ sth r29, 0xa(r5)
/* 000010BC B3A40000 */ sth r29, 0(r4)
/* 000010C0 B3A40002 */ sth r29, 2(r4)
/* 000010C4 B3A40004 */ sth r29, 4(r4)
/* 000010C8 4BFFF085 */ bl SoundOffID
/* 000010CC 386000F9 */ li r3, 0xf9
/* 000010D0 4BFFF07D */ bl SoundOffID
/* 000010D4 386000F3 */ li r3, 0xf3
/* 000010D8 4BFFF075 */ bl SoundOffID
/* 000010DC 38600064 */ li r3, 0x64
/* 000010E0 38800008 */ li r4, 8
/* 000010E4 4BFFF069 */ bl u_play_music
/* 000010E8 4BFFF065 */ bl u_init_player_data_2
/* 000010EC 801E0000 */ lwz r0, 0(r30)
/* 000010F0 2C000000 */ cmpwi r0, 0
/* 000010F4 40820070 */ bne lbl_00001164
/* 000010F8 A87F0066 */ lha r3, 0x66(r31)
/* 000010FC A81F0064 */ lha r0, 0x64(r31)
/* 00001100 7C030000 */ cmpw r3, r0
/* 00001104 41800038 */ blt lbl_0000113C
/* 00001108 4BFFF045 */ bl event_finish_all
/* 0000110C 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00001110 38000017 */ li r0, 0x17
/* 00001114 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 00001118 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 0000111C 3800FFFF */ li r0, -1
/* 00001120 3C600000 */ lis r3, lbl_0000C748@ha
/* 00001124 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00001128 38630000 */ addi r3, r3, lbl_0000C748@l
/* 0000112C 8183005C */ lwz r12, 0x5c(r3)
/* 00001130 7D8803A6 */ mtlr r12
/* 00001134 4E800021 */ blrl 
/* 00001138 48000078 */ b lbl_000011B0
lbl_0000113C:
/* 0000113C A87F0040 */ lha r3, 0x40(r31)
/* 00001140 38630001 */ addi r3, r3, 1
/* 00001144 7C600734 */ extsh r0, r3
/* 00001148 B07F0040 */ sth r3, 0x40(r31)
/* 0000114C 2C000003 */ cmpwi r0, 3
/* 00001150 41800008 */ blt lbl_00001158
/* 00001154 B3BF0040 */ sth r29, 0x40(r31)
lbl_00001158:
/* 00001158 A87F0066 */ lha r3, 0x66(r31)
/* 0000115C 38030001 */ addi r0, r3, 1
/* 00001160 B01F0066 */ sth r0, 0x66(r31)
lbl_00001164:
/* 00001164 4BFFF535 */ bl lbl_00000698
/* 00001168 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 0000116C 38830000 */ addi r4, r3, lbl_802F1FF4@l
/* 00001170 A8040000 */ lha r0, 0(r4)
/* 00001174 2C00FFFF */ cmpwi r0, -1
/* 00001178 41820014 */ beq lbl_0000118C
/* 0000117C 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00001180 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 00001184 3800FFFF */ li r0, -1
/* 00001188 B0040000 */ sth r0, 0(r4)
lbl_0000118C:
/* 0000118C 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00001190 A8830000 */ lha r4, lbl_802F1FF6@l(r3)
/* 00001194 3C600000 */ lis r3, lbl_0000C748@ha
/* 00001198 38030000 */ addi r0, r3, lbl_0000C748@l
/* 0000119C 5483103A */ slwi r3, r4, 2
/* 000011A0 7C601A14 */ add r3, r0, r3
/* 000011A4 81830000 */ lwz r12, 0(r3)
/* 000011A8 7D8803A6 */ mtlr r12
/* 000011AC 4E800021 */ blrl 
lbl_000011B0:
/* 000011B0 80010034 */ lwz r0, 0x34(r1)
/* 000011B4 83E1002C */ lwz r31, 0x2c(r1)
/* 000011B8 83C10028 */ lwz r30, 0x28(r1)
/* 000011BC 7C0803A6 */ mtlr r0
/* 000011C0 83A10024 */ lwz r29, 0x24(r1)
/* 000011C4 38210030 */ addi r1, r1, 0x30
/* 000011C8 4E800020 */ blr 
lbl_000011CC:
/* 000011CC 7C0802A6 */ mflr r0
/* 000011D0 3C800000 */ lis r4, lbl_10000000@ha
/* 000011D4 90010004 */ stw r0, 4(r1)
/* 000011D8 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000011DC 9421FFC0 */ stwu r1, -0x40(r1)
/* 000011E0 BF210024 */ stmw r25, 0x24(r1)
/* 000011E4 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 000011E8 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 000011EC 38600001 */ li r3, 1
/* 000011F0 4BFFEF5D */ bl event_start
/* 000011F4 38600002 */ li r3, 2
/* 000011F8 4BFFEF55 */ bl event_start
/* 000011FC 38600003 */ li r3, 3
/* 00001200 4BFFEF4D */ bl event_start
/* 00001204 38600004 */ li r3, 4
/* 00001208 4BFFEF45 */ bl event_start
/* 0000120C 38600005 */ li r3, 5
/* 00001210 4BFFEF3D */ bl event_start
/* 00001214 38600007 */ li r3, 7
/* 00001218 4BFFEF35 */ bl event_start
/* 0000121C 3860000B */ li r3, 0xb
/* 00001220 4BFFEF2D */ bl event_start
/* 00001224 3860000F */ li r3, 0xf
/* 00001228 4BFFEF25 */ bl event_start
/* 0000122C 38600010 */ li r3, 0x10
/* 00001230 4BFFEF1D */ bl event_start
/* 00001234 38600012 */ li r3, 0x12
/* 00001238 4BFFEF15 */ bl event_start
/* 0000123C 3860000D */ li r3, 0xd
/* 00001240 4BFFEF0D */ bl event_start
/* 00001244 38600014 */ li r3, 0x14
/* 00001248 4BFFEF05 */ bl event_start
/* 0000124C 38600013 */ li r3, 0x13
/* 00001250 4BFFEEFD */ bl event_start
/* 00001254 38600002 */ li r3, 2
/* 00001258 4BFFEEF5 */ bl event_suspend
/* 0000125C 48006ED9 */ bl lbl_00008134
/* 00001260 48007061 */ bl lbl_000082C0
/* 00001264 3C800000 */ lis r4, ballInfo@ha
/* 00001268 3C600000 */ lis r3, lbl_80206B80@ha
/* 0000126C 3B640000 */ addi r27, r4, ballInfo@l
/* 00001270 3B430000 */ addi r26, r3, lbl_80206B80@l
/* 00001274 3C600000 */ lis r3, lbl_000051A4@ha
/* 00001278 3C800000 */ lis r4, g_poolInfo@ha
/* 0000127C 3B830000 */ addi r28, r3, lbl_000051A4@l
/* 00001280 3BA40000 */ addi r29, r4, g_poolInfo@l
/* 00001284 3B200000 */ li r25, 0
lbl_00001288:
/* 00001288 9B3B014A */ stb r25, 0x14a(r27)
/* 0000128C 807D000C */ lwz r3, 0xc(r29)
/* 00001290 7C03C8AE */ lbzx r0, r3, r25
/* 00001294 7C000774 */ extsb r0, r0
/* 00001298 2C000002 */ cmpwi r0, 2
/* 0000129C 40820028 */ bne lbl_000012C4
/* 000012A0 809B00FC */ lwz r4, 0xfc(r27)
/* 000012A4 387C0000 */ addi r3, r28, 0
/* 000012A8 38A00005 */ li r5, 5
/* 000012AC 4BFFEEA1 */ bl func_8008D1DC
/* 000012B0 907A0000 */ stw r3, 0(r26)
/* 000012B4 38800001 */ li r4, 1
/* 000012B8 38A00000 */ li r5, 0
/* 000012BC 807B00FC */ lwz r3, 0xfc(r27)
/* 000012C0 4BFFEE8D */ bl func_8008BA2C
lbl_000012C4:
/* 000012C4 3B390001 */ addi r25, r25, 1
/* 000012C8 2C190004 */ cmpwi r25, 4
/* 000012CC 3B7B01A4 */ addi r27, r27, 0x1a4
/* 000012D0 3B5A0004 */ addi r26, r26, 4
/* 000012D4 4180FFB4 */ blt lbl_00001288
/* 000012D8 3C600000 */ lis r3, modeCtrl@ha
/* 000012DC 38630000 */ addi r3, r3, modeCtrl@l
/* 000012E0 80030024 */ lwz r0, 0x24(r3)
/* 000012E4 2C000001 */ cmpwi r0, 1
/* 000012E8 40820014 */ bne lbl_000012FC
/* 000012EC 3C600000 */ lis r3, ballInfo@ha
/* 000012F0 38630000 */ addi r3, r3, ballInfo@l
/* 000012F4 38000003 */ li r0, 3
/* 000012F8 9803014A */ stb r0, 0x14a(r3)
lbl_000012FC:
/* 000012FC C01F0030 */ lfs f0, 0x30(r31)
/* 00001300 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00001304 38000000 */ li r0, 0
/* 00001308 D0030000 */ stfs f0, lbl_802F1FDC@l(r3)
/* 0000130C 3C800000 */ lis r4, lbl_802F1FE0@ha
/* 00001310 3C600000 */ lis r3, lbl_802F1FD8@ha
/* 00001314 B01E0018 */ sth r0, 0x18(r30)
/* 00001318 B01E001A */ sth r0, 0x1a(r30)
/* 0000131C B01E001C */ sth r0, 0x1c(r30)
/* 00001320 B01E001E */ sth r0, 0x1e(r30)
/* 00001324 901E0074 */ stw r0, 0x74(r30)
/* 00001328 B0040000 */ sth r0, lbl_802F1FE0@l(r4)
/* 0000132C C01F0030 */ lfs f0, 0x30(r31)
/* 00001330 D0030000 */ stfs f0, lbl_802F1FD8@l(r3)
/* 00001334 807F0038 */ lwz r3, 0x38(r31)
/* 00001338 801F003C */ lwz r0, 0x3c(r31)
/* 0000133C 90610008 */ stw r3, 8(r1)
/* 00001340 9001000C */ stw r0, 0xc(r1)
/* 00001344 801F0040 */ lwz r0, 0x40(r31)
/* 00001348 90010010 */ stw r0, 0x10(r1)
/* 0000134C 4BFFEE01 */ bl rand
/* 00001350 54600C3C */ rlwinm r0, r3, 1, 0x10, 0x1e
/* 00001354 7C1C0734 */ extsh r28, r0
/* 00001358 4BFFEDF5 */ bl rand
/* 0000135C 6C608000 */ xoris r0, r3, 0x8000
/* 00001360 C05F0058 */ lfs f2, 0x58(r31)
/* 00001364 9001001C */ stw r0, 0x1c(r1)
/* 00001368 3C004330 */ lis r0, 0x4330
/* 0000136C 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00001370 C83F0050 */ lfd f1, 0x50(r31)
/* 00001374 90010018 */ stw r0, 0x18(r1)
/* 00001378 C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 0000137C C8610018 */ lfd f3, 0x18(r1)
/* 00001380 C81F0048 */ lfd f0, 0x48(r31)
/* 00001384 EC632028 */ fsubs f3, f3, f4
/* 00001388 EC431024 */ fdivs f2, f3, f2
/* 0000138C FC2100B2 */ fmul f1, f1, f2
/* 00001390 FC00082A */ fadd f0, f0, f1
/* 00001394 FC000018 */ frsp f0, f0
/* 00001398 D01E0028 */ stfs f0, 0x28(r30)
/* 0000139C 4BFFEDB1 */ bl mathutil_mtxA_from_identity
/* 000013A0 7F83E378 */ mr r3, r28
/* 000013A4 4BFFEDA9 */ bl mathutil_mtxA_rotate_y
/* 000013A8 C03E0028 */ lfs f1, 0x28(r30)
/* 000013AC 4BFFEDA1 */ bl mathutil_mtxA_scale_s
/* 000013B0 38610008 */ addi r3, r1, 8
/* 000013B4 389E0068 */ addi r4, r30, 0x68
/* 000013B8 4BFFED95 */ bl mathutil_mtxA_tf_vec
/* 000013BC 807E0068 */ lwz r3, 0x68(r30)
/* 000013C0 3C800000 */ lis r4, lbl_100000B8@ha
/* 000013C4 801E006C */ lwz r0, 0x6c(r30)
/* 000013C8 94640000 */ stwu r3, lbl_100000B8@l(r4)
/* 000013CC 90040004 */ stw r0, 4(r4)
/* 000013D0 801E0070 */ lwz r0, 0x70(r30)
/* 000013D4 90040008 */ stw r0, 8(r4)
/* 000013D8 4BFFF3E1 */ bl lbl_000007B8
/* 000013DC 3C600000 */ lis r3, g_poolInfo@ha
/* 000013E0 38630000 */ addi r3, r3, g_poolInfo@l
/* 000013E4 3C800000 */ lis r4, currentBallStructPtr@ha
/* 000013E8 38A40000 */ addi r5, r4, currentBallStructPtr@l
/* 000013EC 3BA3000C */ addi r29, r3, 0xc
/* 000013F0 80C50000 */ lwz r6, 0(r5)
/* 000013F4 3C800000 */ lis r4, ballInfo@ha
/* 000013F8 80E3000C */ lwz r7, 0xc(r3)
/* 000013FC 38040000 */ addi r0, r4, ballInfo@l
/* 00001400 7C040378 */ mr r4, r0
/* 00001404 3B830008 */ addi r28, r3, 8
/* 00001408 39000000 */ li r8, 0
/* 0000140C 38600002 */ li r3, 2
/* 00001410 48000024 */ b lbl_00001434
lbl_00001414:
/* 00001414 88070000 */ lbz r0, 0(r7)
/* 00001418 2C000002 */ cmpwi r0, 2
/* 0000141C 4082000C */ bne lbl_00001428
/* 00001420 90850000 */ stw r4, 0(r5)
/* 00001424 98640003 */ stb r3, 3(r4)
lbl_00001428:
/* 00001428 39080001 */ addi r8, r8, 1
/* 0000142C 388401A4 */ addi r4, r4, 0x1a4
/* 00001430 38E70001 */ addi r7, r7, 1
lbl_00001434:
/* 00001434 801C0000 */ lwz r0, 0(r28)
/* 00001438 7C080000 */ cmpw r8, r0
/* 0000143C 4180FFD8 */ blt lbl_00001414
/* 00001440 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00001444 90C30000 */ stw r6, currentBallStructPtr@l(r3)
/* 00001448 4BFFED05 */ bl ev_ball_main
/* 0000144C 3C800000 */ lis r4, lbl_00004E84@ha
/* 00001450 3C600000 */ lis r3, lbl_802F1F10@ha
/* 00001454 38040000 */ addi r0, r4, lbl_00004E84@l
/* 00001458 90030000 */ stw r0, lbl_802F1F10@l(r3)
/* 0000145C 3C600000 */ lis r3, worldInfo@ha
/* 00001460 38030000 */ addi r0, r3, worldInfo@l
/* 00001464 80BD0000 */ lwz r5, 0(r29)
/* 00001468 7C040378 */ mr r4, r0
/* 0000146C 38C00000 */ li r6, 0
/* 00001470 38600001 */ li r3, 1
/* 00001474 48000020 */ b lbl_00001494
lbl_00001478:
/* 00001478 88050000 */ lbz r0, 0(r5)
/* 0000147C 2C000002 */ cmpwi r0, 2
/* 00001480 40820008 */ bne lbl_00001488
/* 00001484 98640008 */ stb r3, 8(r4)
lbl_00001488:
/* 00001488 38C60001 */ addi r6, r6, 1
/* 0000148C 38840040 */ addi r4, r4, 0x40
/* 00001490 38A50001 */ addi r5, r5, 1
lbl_00001494:
/* 00001494 801C0000 */ lwz r0, 0(r28)
/* 00001498 7C060000 */ cmpw r6, r0
/* 0000149C 4180FFDC */ blt lbl_00001478
/* 000014A0 38600043 */ li r3, 0x43
/* 000014A4 4BFFECA9 */ bl camera_set_state
/* 000014A8 A87E0066 */ lha r3, 0x66(r30)
/* 000014AC A81E0064 */ lha r0, 0x64(r30)
/* 000014B0 7C030000 */ cmpw r3, r0
/* 000014B4 41800010 */ blt lbl_000014C4
/* 000014B8 3860020F */ li r3, 0x20f
/* 000014BC 4BFFEC91 */ bl u_play_sound_0
/* 000014C0 48000014 */ b lbl_000014D4
lbl_000014C4:
/* 000014C4 5460083C */ slwi r0, r3, 1
/* 000014C8 7C7F0214 */ add r3, r31, r0
/* 000014CC A863000E */ lha r3, 0xe(r3)
/* 000014D0 4BFFEC7D */ bl u_play_sound_0
lbl_000014D4:
/* 000014D4 3C600000 */ lis r3, pauseMenuState@ha
/* 000014D8 38630000 */ addi r3, r3, pauseMenuState@l
/* 000014DC 80030004 */ lwz r0, 4(r3)
/* 000014E0 3CA00000 */ lis r5, lbl_802F1FF0@ha
/* 000014E4 3C800000 */ lis r4, lbl_802F1FF6@ha
/* 000014E8 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 000014EC 90030004 */ stw r0, 4(r3)
/* 000014F0 38000000 */ li r0, 0
/* 000014F4 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000014F8 90050000 */ stw r0, lbl_802F1FF0@l(r5)
/* 000014FC 38000002 */ li r0, 2
/* 00001500 B0040000 */ sth r0, lbl_802F1FF6@l(r4)
/* 00001504 38830000 */ addi r4, r3, lbl_802F1FF4@l
/* 00001508 3800FFFF */ li r0, -1
/* 0000150C 3C600000 */ lis r3, lbl_0000C748@ha
/* 00001510 B0040000 */ sth r0, 0(r4)
/* 00001514 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00001518 81830008 */ lwz r12, 8(r3)
/* 0000151C 7D8803A6 */ mtlr r12
/* 00001520 4E800021 */ blrl 
/* 00001524 BB210024 */ lmw r25, 0x24(r1)
/* 00001528 80010044 */ lwz r0, 0x44(r1)
/* 0000152C 38210040 */ addi r1, r1, 0x40
/* 00001530 7C0803A6 */ mtlr r0
/* 00001534 4E800020 */ blr 
lbl_00001538:
/* 00001538 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 0000153C 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00001540 80640000 */ lwz r3, 0(r4)
/* 00001544 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 00001548 38A50000 */ addi r5, r5, currentBallStructPtr@l
/* 0000154C 80A50000 */ lwz r5, 0(r5)
/* 00001550 38030001 */ addi r0, r3, 1
/* 00001554 2C030000 */ cmpwi r3, 0
/* 00001558 90040000 */ stw r0, 0(r4)
/* 0000155C 40820040 */ bne lbl_0000159C
/* 00001560 38000017 */ li r0, 0x17
/* 00001564 98050003 */ stb r0, 3(r5)
/* 00001568 38000000 */ li r0, 0
/* 0000156C 98050148 */ stb r0, 0x148(r5)
/* 00001570 80050094 */ lwz r0, 0x94(r5)
/* 00001574 54000734 */ rlwinm r0, r0, 0, 0x1c, 0x1a
/* 00001578 90050094 */ stw r0, 0x94(r5)
/* 0000157C 806500FC */ lwz r3, 0xfc(r5)
/* 00001580 80030014 */ lwz r0, 0x14(r3)
/* 00001584 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00001588 90030014 */ stw r0, 0x14(r3)
/* 0000158C 80050094 */ lwz r0, 0x94(r5)
/* 00001590 60004000 */ ori r0, r0, 0x4000
/* 00001594 90050094 */ stw r0, 0x94(r5)
/* 00001598 4E800020 */ blr 
lbl_0000159C:
/* 0000159C 80040000 */ lwz r0, 0(r4)
/* 000015A0 2C000078 */ cmpwi r0, 0x78
/* 000015A4 4D800020 */ bltlr 
/* 000015A8 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000015AC 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 000015B0 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 000015B4 41820014 */ beq lbl_000015C8
/* 000015B8 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000015BC 38000003 */ li r0, 3
/* 000015C0 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 000015C4 4E800020 */ blr 
lbl_000015C8:
/* 000015C8 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000015CC 38000009 */ li r0, 9
/* 000015D0 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 000015D4 4E800020 */ blr 
lbl_000015D8:
/* 000015D8 7C0802A6 */ mflr r0
/* 000015DC 38A00000 */ li r5, 0
/* 000015E0 90010004 */ stw r0, 4(r1)
/* 000015E4 2C05000F */ cmpwi r5, 0xf
/* 000015E8 3C800000 */ lis r4, lbl_10000000@ha
/* 000015EC 9421FFD8 */ stwu r1, -0x28(r1)
/* 000015F0 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000015F4 93E10024 */ stw r31, 0x24(r1)
/* 000015F8 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 000015FC 93C10020 */ stw r30, 0x20(r1)
/* 00001600 3BC30000 */ addi r30, r3, lbl_0000BE80@l
/* 00001604 93A1001C */ stw r29, 0x1c(r1)
/* 00001608 93810018 */ stw r28, 0x18(r1)
/* 0000160C 4080004C */ bge lbl_00001658
/* 00001610 3860FFFF */ li r3, -1
/* 00001614 987F0078 */ stb r3, 0x78(r31)
/* 00001618 38A00008 */ li r5, 8
/* 0000161C 987F0079 */ stb r3, 0x79(r31)
/* 00001620 987F007A */ stb r3, 0x7a(r31)
/* 00001624 987F007B */ stb r3, 0x7b(r31)
/* 00001628 987F007C */ stb r3, 0x7c(r31)
/* 0000162C 987F007D */ stb r3, 0x7d(r31)
/* 00001630 987F007E */ stb r3, 0x7e(r31)
/* 00001634 987F007F */ stb r3, 0x7f(r31)
/* 00001638 4800012C */ b lbl_00001764
lbl_0000163C:
/* 0000163C 2005000F */ subfic r0, r5, 0xf
/* 00001640 2C05000F */ cmpwi r5, 0xf
/* 00001644 7C0903A6 */ mtctr r0
/* 00001648 40800010 */ bge lbl_00001658
lbl_0000164C:
/* 0000164C 98640000 */ stb r3, 0(r4)
/* 00001650 38840001 */ addi r4, r4, 1
/* 00001654 4200FFF8 */ bdnz lbl_0000164C
lbl_00001658:
/* 00001658 3800000A */ li r0, 0xa
/* 0000165C 981F0087 */ stb r0, 0x87(r31)
/* 00001660 4BFFEAED */ bl rand
/* 00001664 6C608000 */ xoris r0, r3, 0x8000
/* 00001668 C05E0058 */ lfs f2, 0x58(r30)
/* 0000166C 90010014 */ stw r0, 0x14(r1)
/* 00001670 3C004330 */ lis r0, 0x4330
/* 00001674 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00001678 C83E00F0 */ lfd f1, 0xf0(r30)
/* 0000167C 90010010 */ stw r0, 0x10(r1)
/* 00001680 C8830000 */ lfd f4, lbl_0000BEE0@l(r3)
/* 00001684 3BA00000 */ li r29, 0
/* 00001688 C8610010 */ lfd f3, 0x10(r1)
/* 0000168C C81E00E8 */ lfd f0, 0xe8(r30)
/* 00001690 EC632028 */ fsubs f3, f3, f4
/* 00001694 EC431024 */ fdivs f2, f3, f2
/* 00001698 FC2100B2 */ fmul f1, f1, f2
/* 0000169C FC00082A */ fadd f0, f0, f1
/* 000016A0 FC000018 */ frsp f0, f0
/* 000016A4 D01F0024 */ stfs f0, 0x24(r31)
/* 000016A8 B3BF0088 */ sth r29, 0x88(r31)
/* 000016AC B3BF008A */ sth r29, 0x8a(r31)
/* 000016B0 9BBF0022 */ stb r29, 0x22(r31)
/* 000016B4 9BBF0023 */ stb r29, 0x23(r31)
lbl_000016B8:
/* 000016B8 7FBE0774 */ extsb r30, r29
/* 000016BC 3B800000 */ li r28, 0
/* 000016C0 48000048 */ b lbl_00001708
lbl_000016C4:
/* 000016C4 4BFFEA89 */ bl rand
/* 000016C8 881F0087 */ lbz r0, 0x87(r31)
/* 000016CC 5464047E */ clrlwi r4, r3, 0x11
/* 000016D0 7C030774 */ extsb r3, r0
/* 000016D4 7C041BD6 */ divw r0, r4, r3
/* 000016D8 7C0019D6 */ mullw r0, r0, r3
/* 000016DC 7C002050 */ subf r0, r0, r4
/* 000016E0 7C7F0214 */ add r3, r31, r0
/* 000016E4 88030078 */ lbz r0, 0x78(r3)
/* 000016E8 38630078 */ addi r3, r3, 0x78
/* 000016EC 7C000774 */ extsb r0, r0
/* 000016F0 2C00FFFF */ cmpwi r0, -1
/* 000016F4 4082000C */ bne lbl_00001700
/* 000016F8 9BC30000 */ stb r30, 0(r3)
/* 000016FC 48000008 */ b lbl_00001704
lbl_00001700:
/* 00001700 3B9CFFFF */ addi r28, r28, -1  ;# fixed addi
lbl_00001704:
/* 00001704 3B9C0001 */ addi r28, r28, 1
lbl_00001708:
/* 00001708 2C1C0002 */ cmpwi r28, 2
/* 0000170C 4180FFB8 */ blt lbl_000016C4
/* 00001710 3BBD0001 */ addi r29, r29, 1
/* 00001714 2C1D0003 */ cmpwi r29, 3
/* 00001718 4180FFA0 */ blt lbl_000016B8
/* 0000171C 48008831 */ bl lbl_00009F4C
/* 00001720 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001724 38000000 */ li r0, 0
/* 00001728 90030000 */ stw r0, lbl_802F1FF0@l(r3)
/* 0000172C 3C800000 */ lis r4, lbl_802F1FF6@ha
/* 00001730 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00001734 901F008C */ stw r0, 0x8c(r31)
/* 00001738 38000004 */ li r0, 4
/* 0000173C B0040000 */ sth r0, lbl_802F1FF6@l(r4)
/* 00001740 38830000 */ addi r4, r3, lbl_802F1FF4@l
/* 00001744 3800FFFF */ li r0, -1
/* 00001748 3C600000 */ lis r3, lbl_0000C748@ha
/* 0000174C B0040000 */ sth r0, 0(r4)
/* 00001750 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00001754 81830010 */ lwz r12, 0x10(r3)
/* 00001758 7D8803A6 */ mtlr r12
/* 0000175C 4E800021 */ blrl 
/* 00001760 4800000C */ b lbl_0000176C
lbl_00001764:
/* 00001764 389F0080 */ addi r4, r31, 0x80
/* 00001768 4BFFFED4 */ b lbl_0000163C
lbl_0000176C:
/* 0000176C 8001002C */ lwz r0, 0x2c(r1)
/* 00001770 83E10024 */ lwz r31, 0x24(r1)
/* 00001774 83C10020 */ lwz r30, 0x20(r1)
/* 00001778 7C0803A6 */ mtlr r0
/* 0000177C 83A1001C */ lwz r29, 0x1c(r1)
/* 00001780 83810018 */ lwz r28, 0x18(r1)
/* 00001784 38210028 */ addi r1, r1, 0x28
/* 00001788 4E800020 */ blr 
lbl_0000178C:
/* 0000178C 7C0802A6 */ mflr r0
/* 00001790 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001794 90010004 */ stw r0, 4(r1)
/* 00001798 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 0000179C 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 000017A0 9421FFE0 */ stwu r1, -0x20(r1)
/* 000017A4 93E1001C */ stw r31, 0x1c(r1)
/* 000017A8 93C10018 */ stw r30, 0x18(r1)
/* 000017AC 93A10014 */ stw r29, 0x14(r1)
/* 000017B0 80640000 */ lwz r3, 0(r4)
/* 000017B4 83C50000 */ lwz r30, currentBallStructPtr@l(r5)
/* 000017B8 38030001 */ addi r0, r3, 1
/* 000017BC 3C600000 */ lis r3, lbl_10000000@ha
/* 000017C0 90040000 */ stw r0, 0(r4)
/* 000017C4 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 000017C8 A89F0088 */ lha r4, 0x88(r31)
/* 000017CC 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000017D0 3BA30000 */ addi r29, r3, lbl_0000BE80@l
/* 000017D4 2C040002 */ cmpwi r4, 2
/* 000017D8 41800010 */ blt lbl_000017E8
/* 000017DC 807F008C */ lwz r3, 0x8c(r31)
/* 000017E0 38030001 */ addi r0, r3, 1
/* 000017E4 901F008C */ stw r0, 0x8c(r31)
lbl_000017E8:
/* 000017E8 2C040002 */ cmpwi r4, 2
/* 000017EC 41820104 */ beq lbl_000018F0
/* 000017F0 40800014 */ bge lbl_00001804
/* 000017F4 2C040000 */ cmpwi r4, 0
/* 000017F8 4182001C */ beq lbl_00001814
/* 000017FC 40800084 */ bge lbl_00001880
/* 00001800 4800025C */ b lbl_00001A5C
lbl_00001804:
/* 00001804 2C040004 */ cmpwi r4, 4
/* 00001808 4182021C */ beq lbl_00001A24
/* 0000180C 40800250 */ bge lbl_00001A5C
/* 00001810 48000148 */ b lbl_00001958
lbl_00001814:
/* 00001814 881E002E */ lbz r0, 0x2e(r30)
/* 00001818 3C600000 */ lis r3, lbl_80206BD0@ha
/* 0000181C 3CA00000 */ lis r5, controllerInfo@ha
/* 00001820 7C000774 */ extsb r0, r0
/* 00001824 5404103A */ slwi r4, r0, 2
/* 00001828 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 0000182C 7C602214 */ add r3, r0, r4
/* 00001830 80030000 */ lwz r0, 0(r3)
/* 00001834 38650000 */ addi r3, r5, controllerInfo@l
/* 00001838 1C00003C */ mulli r0, r0, 0x3c
/* 0000183C 7C630214 */ add r3, r3, r0
/* 00001840 A0030018 */ lhz r0, 0x18(r3)
/* 00001844 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001848 41820014 */ beq lbl_0000185C
/* 0000184C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001850 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 00001854 2C00000F */ cmpwi r0, 0xf
/* 00001858 41810014 */ bgt lbl_0000186C
lbl_0000185C:
/* 0000185C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001860 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 00001864 2C0004B0 */ cmpwi r0, 0x4b0
/* 00001868 408101F4 */ ble lbl_00001A5C
lbl_0000186C:
/* 0000186C 38600010 */ li r3, 0x10
/* 00001870 4BFFE8DD */ bl u_play_sound_0
/* 00001874 38000001 */ li r0, 1
/* 00001878 B01F0088 */ sth r0, 0x88(r31)
/* 0000187C 480001E0 */ b lbl_00001A5C
lbl_00001880:
/* 00001880 4BFFE8CD */ bl rand
/* 00001884 6C608000 */ xoris r0, r3, 0x8000
/* 00001888 C07D0058 */ lfs f3, 0x58(r29)
/* 0000188C 9001000C */ stw r0, 0xc(r1)
/* 00001890 3C004330 */ lis r0, 0x4330
/* 00001894 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00001898 C85D0100 */ lfd f2, 0x100(r29)
/* 0000189C 90010008 */ stw r0, 8(r1)
/* 000018A0 C8A30000 */ lfd f5, lbl_0000BEE0@l(r3)
/* 000018A4 C8810008 */ lfd f4, 8(r1)
/* 000018A8 C83D00F8 */ lfd f1, 0xf8(r29)
/* 000018AC EC842828 */ fsubs f4, f4, f5
/* 000018B0 C01F0024 */ lfs f0, 0x24(r31)
/* 000018B4 EC641824 */ fdivs f3, f4, f3
/* 000018B8 FC4200F2 */ fmul f2, f2, f3
/* 000018BC FC21102A */ fadd f1, f1, f2
/* 000018C0 FC000072 */ fmul f0, f0, f1
/* 000018C4 FC000018 */ frsp f0, f0
/* 000018C8 D01F0024 */ stfs f0, 0x24(r31)
/* 000018CC C03F0024 */ lfs f1, 0x24(r31)
/* 000018D0 C81D0108 */ lfd f0, 0x108(r29)
/* 000018D4 FC010040 */ fcmpo cr0, f1, f0
/* 000018D8 40800184 */ bge lbl_00001A5C
/* 000018DC 38000002 */ li r0, 2
/* 000018E0 B01F0088 */ sth r0, 0x88(r31)
/* 000018E4 C01D0030 */ lfs f0, 0x30(r29)
/* 000018E8 D01F0024 */ stfs f0, 0x24(r31)
/* 000018EC 48000170 */ b lbl_00001A5C
lbl_000018F0:
/* 000018F0 801F008C */ lwz r0, 0x8c(r31)
/* 000018F4 2C00001E */ cmpwi r0, 0x1e
/* 000018F8 40810164 */ ble lbl_00001A5C
/* 000018FC 881F0090 */ lbz r0, 0x90(r31)
/* 00001900 7C000774 */ extsb r0, r0
/* 00001904 7C7F0214 */ add r3, r31, r0
/* 00001908 88030078 */ lbz r0, 0x78(r3)
/* 0000190C 7C000774 */ extsb r0, r0
/* 00001910 2C00FFFF */ cmpwi r0, -1
/* 00001914 41820030 */ beq lbl_00001944
/* 00001918 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 0000191C 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 00001920 80040000 */ lwz r0, 0(r4)
/* 00001924 386001A6 */ li r3, 0x1a6
/* 00001928 60000800 */ ori r0, r0, 0x800
/* 0000192C 90040000 */ stw r0, 0(r4)
/* 00001930 4BFFE81D */ bl u_play_sound_0
/* 00001934 38600000 */ li r3, 0
/* 00001938 38800008 */ li r4, 8
/* 0000193C 4BFFE811 */ bl u_play_music
/* 00001940 4800000C */ b lbl_0000194C
lbl_00001944:
/* 00001944 386001A8 */ li r3, 0x1a8
/* 00001948 4BFFE805 */ bl u_play_sound_0
lbl_0000194C:
/* 0000194C 38000003 */ li r0, 3
/* 00001950 B01F0088 */ sth r0, 0x88(r31)
/* 00001954 48000108 */ b lbl_00001A5C
lbl_00001958:
/* 00001958 801F008C */ lwz r0, 0x8c(r31)
/* 0000195C 2C00002D */ cmpwi r0, 0x2d
/* 00001960 40820038 */ bne lbl_00001998
/* 00001964 881F0090 */ lbz r0, 0x90(r31)
/* 00001968 7C000774 */ extsb r0, r0
/* 0000196C 7C7F0214 */ add r3, r31, r0
/* 00001970 88030078 */ lbz r0, 0x78(r3)
/* 00001974 7C000774 */ extsb r0, r0
/* 00001978 2C00FFFF */ cmpwi r0, -1
/* 0000197C 41820010 */ beq lbl_0000198C
/* 00001980 3860392C */ li r3, 0x392c
/* 00001984 4BFFE7C9 */ bl u_play_sound_0
/* 00001988 48000030 */ b lbl_000019B8
lbl_0000198C:
/* 0000198C 3860392E */ li r3, 0x392e
/* 00001990 4BFFE7BD */ bl u_play_sound_0
/* 00001994 48000024 */ b lbl_000019B8
lbl_00001998:
/* 00001998 2C00003C */ cmpwi r0, 0x3c
/* 0000199C 4082001C */ bne lbl_000019B8
/* 000019A0 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000019A4 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 000019A8 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 000019AC 4182000C */ beq lbl_000019B8
/* 000019B0 38600121 */ li r3, 0x121
/* 000019B4 4BFFE799 */ bl u_play_sound_0
lbl_000019B8:
/* 000019B8 801F008C */ lwz r0, 0x8c(r31)
/* 000019BC 2C0000A0 */ cmpwi r0, 0xa0
/* 000019C0 41810044 */ bgt lbl_00001A04
/* 000019C4 2C00005A */ cmpwi r0, 0x5a
/* 000019C8 40810094 */ ble lbl_00001A5C
/* 000019CC 881E002E */ lbz r0, 0x2e(r30)
/* 000019D0 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000019D4 3CA00000 */ lis r5, controllerInfo@ha
/* 000019D8 7C000774 */ extsb r0, r0
/* 000019DC 5404103A */ slwi r4, r0, 2
/* 000019E0 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000019E4 7C602214 */ add r3, r0, r4
/* 000019E8 80030000 */ lwz r0, 0(r3)
/* 000019EC 38650000 */ addi r3, r5, controllerInfo@l
/* 000019F0 1C00003C */ mulli r0, r0, 0x3c
/* 000019F4 7C630214 */ add r3, r3, r0
/* 000019F8 A0030018 */ lhz r0, 0x18(r3)
/* 000019FC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001A00 4182005C */ beq lbl_00001A5C
lbl_00001A04:
/* 00001A04 38600064 */ li r3, 0x64
/* 00001A08 38800008 */ li r4, 8
/* 00001A0C 4BFFE741 */ bl u_play_music
/* 00001A10 380000A0 */ li r0, 0xa0
/* 00001A14 901F008C */ stw r0, 0x8c(r31)
/* 00001A18 38000004 */ li r0, 4
/* 00001A1C B01F0088 */ sth r0, 0x88(r31)
/* 00001A20 4800003C */ b lbl_00001A5C
lbl_00001A24:
/* 00001A24 801F008C */ lwz r0, 0x8c(r31)
/* 00001A28 2C0000B4 */ cmpwi r0, 0xb4
/* 00001A2C 40810030 */ ble lbl_00001A5C
/* 00001A30 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00001A34 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00001A38 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 00001A3C 41820014 */ beq lbl_00001A50
/* 00001A40 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00001A44 38000005 */ li r0, 5
/* 00001A48 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00001A4C 48000010 */ b lbl_00001A5C
lbl_00001A50:
/* 00001A50 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00001A54 38000009 */ li r0, 9
/* 00001A58 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_00001A5C:
/* 00001A5C C01F0024 */ lfs f0, 0x24(r31)
/* 00001A60 A81F008A */ lha r0, 0x8a(r31)
/* 00001A64 FC00001E */ fctiwz f0, f0
/* 00001A68 D8010008 */ stfd f0, 8(r1)
/* 00001A6C 8061000C */ lwz r3, 0xc(r1)
/* 00001A70 7C030050 */ subf r0, r3, r0
/* 00001A74 B01F008A */ sth r0, 0x8a(r31)
/* 00001A78 881F0087 */ lbz r0, 0x87(r31)
/* 00001A7C A07F008A */ lhz r3, 0x8a(r31)
/* 00001A80 7C000774 */ extsb r0, r0
/* 00001A84 7C0301D6 */ mullw r0, r3, r0
/* 00001A88 7C008670 */ srawi r0, r0, 0x10
/* 00001A8C 7C000194 */ addze r0, r0
/* 00001A90 7C000774 */ extsb r0, r0
/* 00001A94 981F0090 */ stb r0, 0x90(r31)
/* 00001A98 887F0090 */ lbz r3, 0x90(r31)
/* 00001A9C 881F0022 */ lbz r0, 0x22(r31)
/* 00001AA0 7C630774 */ extsb r3, r3
/* 00001AA4 7C000774 */ extsb r0, r0
/* 00001AA8 7C030000 */ cmpw r3, r0
/* 00001AAC 41820024 */ beq lbl_00001AD0
/* 00001AB0 881F0023 */ lbz r0, 0x23(r31)
/* 00001AB4 7C000775 */ extsb. r0, r0
/* 00001AB8 40820018 */ bne lbl_00001AD0
/* 00001ABC 3C600004 */ lis r3, 4
/* 00001AC0 3863B136 */ addi r3, r3, -20170  ;# fixed addi
/* 00001AC4 4BFFE689 */ bl u_play_sound_0
/* 00001AC8 38000003 */ li r0, 3
/* 00001ACC 981F0023 */ stb r0, 0x23(r31)
lbl_00001AD0:
/* 00001AD0 887F0023 */ lbz r3, 0x23(r31)
/* 00001AD4 7C600775 */ extsb. r0, r3
/* 00001AD8 4081000C */ ble lbl_00001AE4
/* 00001ADC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00001AE0 981F0023 */ stb r0, 0x23(r31)
lbl_00001AE4:
/* 00001AE4 881F0090 */ lbz r0, 0x90(r31)
/* 00001AE8 981F0022 */ stb r0, 0x22(r31)
/* 00001AEC 80010024 */ lwz r0, 0x24(r1)
/* 00001AF0 83E1001C */ lwz r31, 0x1c(r1)
/* 00001AF4 83C10018 */ lwz r30, 0x18(r1)
/* 00001AF8 7C0803A6 */ mtlr r0
/* 00001AFC 83A10014 */ lwz r29, 0x14(r1)
/* 00001B00 38210020 */ addi r1, r1, 0x20
/* 00001B04 4E800020 */ blr 
lbl_00001B08:
/* 00001B08 7C0802A6 */ mflr r0
/* 00001B0C 3C600000 */ lis r3, lbl_10000090@ha
/* 00001B10 90010004 */ stw r0, 4(r1)
/* 00001B14 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 00001B18 9421FFF8 */ stwu r1, -8(r1)
/* 00001B1C 88030000 */ lbz r0, lbl_10000090@l(r3)
/* 00001B20 3C600000 */ lis r3, lbl_10000078@ha
/* 00001B24 7C040774 */ extsb r4, r0
/* 00001B28 38030000 */ addi r0, r3, lbl_10000078@l
/* 00001B2C 7C602214 */ add r3, r0, r4
/* 00001B30 88030000 */ lbz r0, 0(r3)
/* 00001B34 38650000 */ addi r3, r5, currentBallStructPtr@l
/* 00001B38 80630000 */ lwz r3, 0(r3)
/* 00001B3C 7C000775 */ extsb. r0, r0
/* 00001B40 41820024 */ beq lbl_00001B64
/* 00001B44 8803002E */ lbz r0, 0x2e(r3)
/* 00001B48 3C600000 */ lis r3, cameraInfo@ha
/* 00001B4C 38630000 */ addi r3, r3, cameraInfo@l
/* 00001B50 7C000774 */ extsb r0, r0
/* 00001B54 1C000284 */ mulli r0, r0, 0x284
/* 00001B58 7C630214 */ add r3, r3, r0
/* 00001B5C 38000006 */ li r0, 6
/* 00001B60 9803001F */ stb r0, 0x1f(r3)
lbl_00001B64:
/* 00001B64 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001B68 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00001B6C 38000000 */ li r0, 0
/* 00001B70 90040000 */ stw r0, 0(r4)
/* 00001B74 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00001B78 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00001B7C 38000006 */ li r0, 6
/* 00001B80 B0050000 */ sth r0, 0(r5)
/* 00001B84 3C600000 */ lis r3, lbl_0000C748@ha
/* 00001B88 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00001B8C 3800FFFF */ li r0, -1
/* 00001B90 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00001B94 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00001B98 81830018 */ lwz r12, 0x18(r3)
/* 00001B9C 7D8803A6 */ mtlr r12
/* 00001BA0 4E800021 */ blrl 
/* 00001BA4 8001000C */ lwz r0, 0xc(r1)
/* 00001BA8 38210008 */ addi r1, r1, 8
/* 00001BAC 7C0803A6 */ mtlr r0
/* 00001BB0 4E800020 */ blr 
lbl_00001BB4:
/* 00001BB4 7C0802A6 */ mflr r0
/* 00001BB8 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001BBC 90010004 */ stw r0, 4(r1)
/* 00001BC0 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00001BC4 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 00001BC8 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001BCC 93E1000C */ stw r31, 0xc(r1)
/* 00001BD0 80640000 */ lwz r3, 0(r4)
/* 00001BD4 83E50000 */ lwz r31, currentBallStructPtr@l(r5)
/* 00001BD8 38030001 */ addi r0, r3, 1
/* 00001BDC 90040000 */ stw r0, 0(r4)
/* 00001BE0 80040000 */ lwz r0, 0(r4)
/* 00001BE4 2C000014 */ cmpwi r0, 0x14
/* 00001BE8 4082000C */ bne lbl_00001BF4
/* 00001BEC 480006ED */ bl lbl_000022D8
/* 00001BF0 4800007C */ b lbl_00001C6C
lbl_00001BF4:
/* 00001BF4 2C000050 */ cmpwi r0, 0x50
/* 00001BF8 40820034 */ bne lbl_00001C2C
/* 00001BFC 881F002E */ lbz r0, 0x2e(r31)
/* 00001C00 3C600000 */ lis r3, cameraInfo@ha
/* 00001C04 38630000 */ addi r3, r3, cameraInfo@l
/* 00001C08 7C000774 */ extsb r0, r0
/* 00001C0C 1C000284 */ mulli r0, r0, 0x284
/* 00001C10 7C630214 */ add r3, r3, r0
/* 00001C14 8803001F */ lbz r0, 0x1f(r3)
/* 00001C18 2C000007 */ cmpwi r0, 7
/* 00001C1C 40820050 */ bne lbl_00001C6C
/* 00001C20 38600122 */ li r3, 0x122
/* 00001C24 4BFFE529 */ bl u_play_sound_0
/* 00001C28 48000044 */ b lbl_00001C6C
lbl_00001C2C:
/* 00001C2C 2C000078 */ cmpwi r0, 0x78
/* 00001C30 4081003C */ ble lbl_00001C6C
/* 00001C34 3C600000 */ lis r3, modeCtrl@ha
/* 00001C38 38630000 */ addi r3, r3, modeCtrl@l
/* 00001C3C 8083002C */ lwz r4, 0x2c(r3)
/* 00001C40 3C600000 */ lis r3, lbl_80285A68@ha
/* 00001C44 38030000 */ addi r0, r3, lbl_80285A68@l
/* 00001C48 1C640006 */ mulli r3, r4, 6
/* 00001C4C 7C601A14 */ add r3, r0, r3
/* 00001C50 A8030000 */ lha r0, 0(r3)
/* 00001C54 2C000000 */ cmpwi r0, 0
/* 00001C58 41820014 */ beq lbl_00001C6C
/* 00001C5C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00001C60 38000009 */ li r0, 9
/* 00001C64 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00001C68 48000068 */ b lbl_00001CD0
lbl_00001C6C:
/* 00001C6C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001C70 80C30000 */ lwz r6, lbl_802F1FF0@l(r3)
/* 00001C74 2C06003C */ cmpwi r6, 0x3c
/* 00001C78 40810058 */ ble lbl_00001CD0
/* 00001C7C 881F002E */ lbz r0, 0x2e(r31)
/* 00001C80 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00001C84 3CA00000 */ lis r5, controllerInfo@ha
/* 00001C88 7C000774 */ extsb r0, r0
/* 00001C8C 5404103A */ slwi r4, r0, 2
/* 00001C90 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00001C94 7C602214 */ add r3, r0, r4
/* 00001C98 80030000 */ lwz r0, 0(r3)
/* 00001C9C 38650000 */ addi r3, r5, controllerInfo@l
/* 00001CA0 1C00003C */ mulli r0, r0, 0x3c
/* 00001CA4 7C630214 */ add r3, r3, r0
/* 00001CA8 A0030018 */ lhz r0, 0x18(r3)
/* 00001CAC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001CB0 4082000C */ bne lbl_00001CBC
/* 00001CB4 2C06021C */ cmpwi r6, 0x21c
/* 00001CB8 40810018 */ ble lbl_00001CD0
lbl_00001CBC:
/* 00001CBC 38600122 */ li r3, 0x122
/* 00001CC0 4BFFE48D */ bl SoundOffID
/* 00001CC4 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00001CC8 38000009 */ li r0, 9
/* 00001CCC B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_00001CD0:
/* 00001CD0 80010014 */ lwz r0, 0x14(r1)
/* 00001CD4 83E1000C */ lwz r31, 0xc(r1)
/* 00001CD8 38210010 */ addi r1, r1, 0x10
/* 00001CDC 7C0803A6 */ mtlr r0
/* 00001CE0 4E800020 */ blr 
lbl_00001CE4:
/* 00001CE4 7C0802A6 */ mflr r0
/* 00001CE8 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00001CEC 90010004 */ stw r0, 4(r1)
/* 00001CF0 9421FFF8 */ stwu r1, -8(r1)
/* 00001CF4 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 00001CF8 3C600000 */ lis r3, cameraInfo@ha
/* 00001CFC 38630000 */ addi r3, r3, cameraInfo@l
/* 00001D00 8804002E */ lbz r0, 0x2e(r4)
/* 00001D04 3883001F */ addi r4, r3, 0x1f
/* 00001D08 7C000774 */ extsb r0, r0
/* 00001D0C 1C600284 */ mulli r3, r0, 0x284
/* 00001D10 7C0418AE */ lbzx r0, r4, r3
/* 00001D14 7C000774 */ extsb r0, r0
/* 00001D18 2C000001 */ cmpwi r0, 1
/* 00001D1C 4182000C */ beq lbl_00001D28
/* 00001D20 38000000 */ li r0, 0
/* 00001D24 7C0419AE */ stbx r0, r4, r3
lbl_00001D28:
/* 00001D28 3C600000 */ lis r3, modeCtrl@ha
/* 00001D2C 38630000 */ addi r3, r3, modeCtrl@l
/* 00001D30 8083002C */ lwz r4, 0x2c(r3)
/* 00001D34 3C600000 */ lis r3, lbl_802F1FE4@ha
/* 00001D38 38030000 */ addi r0, r3, lbl_802F1FE4@l
/* 00001D3C 5483083C */ slwi r3, r4, 1
/* 00001D40 7C601A14 */ add r3, r0, r3
/* 00001D44 A8030000 */ lha r0, 0(r3)
/* 00001D48 2C000000 */ cmpwi r0, 0
/* 00001D4C 40820034 */ bne lbl_00001D80
/* 00001D50 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00001D54 38000007 */ li r0, 7
/* 00001D58 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 00001D5C 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00001D60 3800FFFF */ li r0, -1
/* 00001D64 3C600000 */ lis r3, lbl_0000C748@ha
/* 00001D68 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00001D6C 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00001D70 8183001C */ lwz r12, 0x1c(r3)
/* 00001D74 7D8803A6 */ mtlr r12
/* 00001D78 4E800021 */ blrl 
/* 00001D7C 48000054 */ b lbl_00001DD0
lbl_00001D80:
/* 00001D80 3C600000 */ lis r3, lbl_10000020@ha
/* 00001D84 38830000 */ addi r4, r3, lbl_10000020@l
/* 00001D88 38000000 */ li r0, 0
/* 00001D8C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001D90 B0040000 */ sth r0, 0(r4)
/* 00001D94 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00001D98 90040000 */ stw r0, 0(r4)
/* 00001D9C 3C600000 */ lis r3, lbl_1000008C@ha
/* 00001DA0 38C0FFFF */ li r6, -1
/* 00001DA4 90C30000 */ stw r6, lbl_1000008C@l(r3)
/* 00001DA8 3CA00000 */ lis r5, lbl_802F1FF6@ha
/* 00001DAC 3800000A */ li r0, 0xa
/* 00001DB0 B0050000 */ sth r0, lbl_802F1FF6@l(r5)
/* 00001DB4 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00001DB8 3C600000 */ lis r3, lbl_0000C748@ha
/* 00001DBC B0C40000 */ sth r6, lbl_802F1FF4@l(r4)
/* 00001DC0 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00001DC4 81830028 */ lwz r12, 0x28(r3)
/* 00001DC8 7D8803A6 */ mtlr r12
/* 00001DCC 4E800021 */ blrl 
lbl_00001DD0:
/* 00001DD0 8001000C */ lwz r0, 0xc(r1)
/* 00001DD4 38210008 */ addi r1, r1, 8
/* 00001DD8 7C0803A6 */ mtlr r0
/* 00001DDC 4E800020 */ blr 
lbl_00001DE0:
/* 00001DE0 7C0802A6 */ mflr r0
/* 00001DE4 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001DE8 90010004 */ stw r0, 4(r1)
/* 00001DEC 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00001DF0 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 00001DF4 9421FF78 */ stwu r1, -0x88(r1)
/* 00001DF8 3CC00000 */ lis r6, lbl_10000000@ha
/* 00001DFC DBE10080 */ stfd f31, 0x80(r1)
/* 00001E00 DBC10078 */ stfd f30, 0x78(r1)
/* 00001E04 BF21005C */ stmw r25, 0x5c(r1)
/* 00001E08 3BA60000 */ addi r29, r6, lbl_10000000@l
/* 00001E0C 80640000 */ lwz r3, 0(r4)
/* 00001E10 83850000 */ lwz r28, currentBallStructPtr@l(r5)
/* 00001E14 3CA00000 */ lis r5, lbl_0000BE80@ha
/* 00001E18 38030001 */ addi r0, r3, 1
/* 00001E1C 90040000 */ stw r0, 0(r4)
/* 00001E20 3C600000 */ lis r3, lbl_0000C740@ha
/* 00001E24 3BC50000 */ addi r30, r5, lbl_0000BE80@l
/* 00001E28 80040000 */ lwz r0, 0(r4)
/* 00001E2C 3BE30000 */ addi r31, r3, lbl_0000C740@l
/* 00001E30 2C000014 */ cmpwi r0, 0x14
/* 00001E34 4180030C */ blt lbl_00002140
/* 00001E38 809D008C */ lwz r4, 0x8c(r29)
/* 00001E3C C3FE0110 */ lfs f31, 0x110(r30)
/* 00001E40 2C04001E */ cmpwi r4, 0x1e
/* 00001E44 C3DE0114 */ lfs f30, 0x114(r30)
/* 00001E48 40800188 */ bge lbl_00001FD0
/* 00001E4C A81D0020 */ lha r0, 0x20(r29)
/* 00001E50 2C000000 */ cmpwi r0, 0
/* 00001E54 41820014 */ beq lbl_00001E68
/* 00001E58 3C60FF81 */ lis r3, 0xff81
/* 00001E5C 3B638080 */ addi r27, r3, -32640  ;# fixed addi
/* 00001E60 3B40FF80 */ li r26, -128
/* 00001E64 48000010 */ b lbl_00001E74
lbl_00001E68:
/* 00001E68 3C60FF81 */ lis r3, 0xff81
/* 00001E6C 3B438080 */ addi r26, r3, -32640  ;# fixed addi
/* 00001E70 3B60FF80 */ li r27, -128
lbl_00001E74:
/* 00001E74 2C040000 */ cmpwi r4, 0
/* 00001E78 41800024 */ blt lbl_00001E9C
/* 00001E7C 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00001E80 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 00001E84 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00001E88 41820014 */ beq lbl_00001E9C
/* 00001E8C 3C60FF81 */ lis r3, 0xff81
/* 00001E90 38038080 */ addi r0, r3, -32640  ;# fixed addi
/* 00001E94 7F5A0038 */ and r26, r26, r0
/* 00001E98 7F7B0038 */ and r27, r27, r0
lbl_00001E9C:
/* 00001E9C C01E0034 */ lfs f0, 0x34(r30)
/* 00001EA0 3C600100 */ lis r3, 0x100
/* 00001EA4 3B23FFFF */ addi r25, r3, -1  ;# fixed addi
/* 00001EA8 D0010018 */ stfs f0, 0x18(r1)
/* 00001EAC 38C00000 */ li r6, 0
/* 00001EB0 38A0FFFF */ li r5, -1
/* 00001EB4 C01E0034 */ lfs f0, 0x34(r30)
/* 00001EB8 38800005 */ li r4, 5
/* 00001EBC 38000B31 */ li r0, 0xb31
/* 00001EC0 D001001C */ stfs f0, 0x1c(r1)
/* 00001EC4 38610008 */ addi r3, r1, 8
/* 00001EC8 C01E0030 */ lfs f0, 0x30(r30)
/* 00001ECC D0010024 */ stfs f0, 0x24(r1)
/* 00001ED0 D0010020 */ stfs f0, 0x20(r1)
/* 00001ED4 C01E0034 */ lfs f0, 0x34(r30)
/* 00001ED8 D001002C */ stfs f0, 0x2c(r1)
/* 00001EDC D0010028 */ stfs f0, 0x28(r1)
/* 00001EE0 90C10030 */ stw r6, 0x30(r1)
/* 00001EE4 90A10038 */ stw r5, 0x38(r1)
/* 00001EE8 9081003C */ stw r4, 0x3c(r1)
/* 00001EEC C01E0034 */ lfs f0, 0x34(r30)
/* 00001EF0 D0010034 */ stfs f0, 0x34(r1)
/* 00001EF4 93210040 */ stw r25, 0x40(r1)
/* 00001EF8 90C10044 */ stw r6, 0x44(r1)
/* 00001EFC C01E0118 */ lfs f0, 0x118(r30)
/* 00001F00 D0010018 */ stfs f0, 0x18(r1)
/* 00001F04 C01E011C */ lfs f0, 0x11c(r30)
/* 00001F08 D001001C */ stfs f0, 0x1c(r1)
/* 00001F0C 90010008 */ stw r0, 8(r1)
/* 00001F10 C01E0110 */ lfs f0, 0x110(r30)
/* 00001F14 D001000C */ stfs f0, 0xc(r1)
/* 00001F18 C03E0114 */ lfs f1, 0x114(r30)
/* 00001F1C C81E0120 */ lfd f0, 0x120(r30)
/* 00001F20 FC010028 */ fsub f0, f1, f0
/* 00001F24 FC000018 */ frsp f0, f0
/* 00001F28 D0010010 */ stfs f0, 0x10(r1)
/* 00001F2C C01E0128 */ lfs f0, 0x128(r30)
/* 00001F30 D0010014 */ stfs f0, 0x14(r1)
/* 00001F34 4BFFE219 */ bl draw_naomi_sprite
/* 00001F38 4BFFE215 */ bl reset_text_draw_settings
/* 00001F3C 386000B1 */ li r3, 0xb1
/* 00001F40 4BFFE20D */ bl set_text_font
/* 00001F44 3C600020 */ lis r3, 0x20
/* 00001F48 4BFFE205 */ bl func_80071B50
/* 00001F4C C81E0130 */ lfd f0, 0x130(r30)
/* 00001F50 FC40F090 */ fmr f2, f30
/* 00001F54 38790000 */ addi r3, r25, 0
/* 00001F58 4CC63242 */ crset 6
/* 00001F5C FC20F82A */ fadd f1, f0, f31
/* 00001F60 38BF05A0 */ addi r5, r31, 0x5a0
/* 00001F64 38800000 */ li r4, 0
/* 00001F68 FC200818 */ frsp f1, f1
/* 00001F6C 48008E01 */ bl lbl_0000AD6C
/* 00001F70 C83E0140 */ lfd f1, 0x140(r30)
/* 00001F74 7F43D378 */ mr r3, r26
/* 00001F78 C81E0130 */ lfd f0, 0x130(r30)
/* 00001F7C 38BF05AC */ addi r5, r31, 0x5ac
/* 00001F80 FC21F82A */ fadd f1, f1, f31
/* 00001F84 C85E0138 */ lfd f2, 0x138(r30)
/* 00001F88 FFC0F02A */ fadd f30, f0, f30
/* 00001F8C 4CC63242 */ crset 6
/* 00001F90 38800000 */ li r4, 0
/* 00001F94 FC22082A */ fadd f1, f2, f1
/* 00001F98 FC40F018 */ frsp f2, f30
/* 00001F9C FC200818 */ frsp f1, f1
/* 00001FA0 48008DCD */ bl lbl_0000AD6C
/* 00001FA4 C81E0148 */ lfd f0, 0x148(r30)
/* 00001FA8 FC40F018 */ frsp f2, f30
/* 00001FAC C83E0138 */ lfd f1, 0x138(r30)
/* 00001FB0 7F63DB78 */ mr r3, r27
/* 00001FB4 FC00F82A */ fadd f0, f0, f31
/* 00001FB8 38BF05B0 */ addi r5, r31, 0x5b0
/* 00001FBC 4CC63242 */ crset 6
/* 00001FC0 38800000 */ li r4, 0
/* 00001FC4 FC21002A */ fadd f1, f1, f0
/* 00001FC8 FC200818 */ frsp f1, f1
/* 00001FCC 48008DA1 */ bl lbl_0000AD6C
lbl_00001FD0:
/* 00001FD0 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001FD4 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 00001FD8 2C00001E */ cmpwi r0, 0x1e
/* 00001FDC 41800164 */ blt lbl_00002140
/* 00001FE0 807D008C */ lwz r3, 0x8c(r29)
/* 00001FE4 2C03FFFF */ cmpwi r3, -1
/* 00001FE8 408200F8 */ bne lbl_000020E0
/* 00001FEC 881C002E */ lbz r0, 0x2e(r28)
/* 00001FF0 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00001FF4 3CA00000 */ lis r5, controllerInfo@ha
/* 00001FF8 7C000774 */ extsb r0, r0
/* 00001FFC 5404103A */ slwi r4, r0, 2
/* 00002000 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00002004 7C602214 */ add r3, r0, r4
/* 00002008 80830000 */ lwz r4, 0(r3)
/* 0000200C 38650000 */ addi r3, r5, controllerInfo@l
/* 00002010 3BC30018 */ addi r30, r3, 0x18
/* 00002014 1C04003C */ mulli r0, r4, 0x3c
/* 00002018 7C1E022E */ lhzx r0, r30, r0
/* 0000201C 540007BF */ clrlwi. r0, r0, 0x1e
/* 00002020 40820020 */ bne lbl_00002040
/* 00002024 1C04000A */ mulli r0, r4, 0xa
/* 00002028 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000202C 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00002030 7C630214 */ add r3, r3, r0
/* 00002034 A0030004 */ lhz r0, 4(r3)
/* 00002038 540007BF */ clrlwi. r0, r0, 0x1e
/* 0000203C 41820018 */ beq lbl_00002054
lbl_00002040:
/* 00002040 38600009 */ li r3, 9
/* 00002044 4BFFE109 */ bl u_play_sound_0
/* 00002048 A81D0020 */ lha r0, 0x20(r29)
/* 0000204C 68000001 */ xori r0, r0, 1
/* 00002050 B01D0020 */ sth r0, 0x20(r29)
lbl_00002054:
/* 00002054 889C002E */ lbz r4, 0x2e(r28)
/* 00002058 3C600000 */ lis r3, lbl_80206BD0@ha
/* 0000205C 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00002060 7C830774 */ extsb r3, r4
/* 00002064 5463103A */ slwi r3, r3, 2
/* 00002068 7C601A14 */ add r3, r0, r3
/* 0000206C 80030000 */ lwz r0, 0(r3)
/* 00002070 1C00003C */ mulli r0, r0, 0x3c
/* 00002074 7C1E022E */ lhzx r0, r30, r0
/* 00002078 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000207C 418200C4 */ beq lbl_00002140
/* 00002080 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002084 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 00002088 2C000026 */ cmpwi r0, 0x26
/* 0000208C 408100B4 */ ble lbl_00002140
/* 00002090 A81D0020 */ lha r0, 0x20(r29)
/* 00002094 2C000000 */ cmpwi r0, 0
/* 00002098 41820034 */ beq lbl_000020CC
/* 0000209C 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000020A0 84030000 */ lwzu r0, lbl_802F1FD0@l(r3)
/* 000020A4 60000400 */ ori r0, r0, 0x400
/* 000020A8 90030000 */ stw r0, 0(r3)
/* 000020AC 480000B1 */ bl lbl_0000215C
/* 000020B0 48000105 */ bl lbl_000021B4
/* 000020B4 38600010 */ li r3, 0x10
/* 000020B8 4BFFE095 */ bl u_play_sound_0
/* 000020BC 38600000 */ li r3, 0
/* 000020C0 38800008 */ li r4, 8
/* 000020C4 4BFFE089 */ bl u_play_music
/* 000020C8 4800000C */ b lbl_000020D4
lbl_000020CC:
/* 000020CC 38600036 */ li r3, 0x36
/* 000020D0 4BFFE07D */ bl u_play_sound_0
lbl_000020D4:
/* 000020D4 38000000 */ li r0, 0
/* 000020D8 901D008C */ stw r0, 0x8c(r29)
/* 000020DC 48000064 */ b lbl_00002140
lbl_000020E0:
/* 000020E0 38030001 */ addi r0, r3, 1
/* 000020E4 901D008C */ stw r0, 0x8c(r29)
/* 000020E8 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000020EC 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 000020F0 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 000020F4 41820034 */ beq lbl_00002128
/* 000020F8 801D008C */ lwz r0, 0x8c(r29)
/* 000020FC 2C000014 */ cmpwi r0, 0x14
/* 00002100 40820010 */ bne lbl_00002110
/* 00002104 3860011E */ li r3, 0x11e
/* 00002108 4BFFE045 */ bl u_play_sound_0
/* 0000210C 48000034 */ b lbl_00002140
lbl_00002110:
/* 00002110 2C000073 */ cmpwi r0, 0x73
/* 00002114 4180002C */ blt lbl_00002140
/* 00002118 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 0000211C 38000007 */ li r0, 7
/* 00002120 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00002124 4800001C */ b lbl_00002140
lbl_00002128:
/* 00002128 801D008C */ lwz r0, 0x8c(r29)
/* 0000212C 2C00001E */ cmpwi r0, 0x1e
/* 00002130 41800010 */ blt lbl_00002140
/* 00002134 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00002138 38000007 */ li r0, 7
/* 0000213C B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_00002140:
/* 00002140 BB21005C */ lmw r25, 0x5c(r1)
/* 00002144 8001008C */ lwz r0, 0x8c(r1)
/* 00002148 CBE10080 */ lfd f31, 0x80(r1)
/* 0000214C CBC10078 */ lfd f30, 0x78(r1)
/* 00002150 7C0803A6 */ mtlr r0
/* 00002154 38210088 */ addi r1, r1, 0x88
/* 00002158 4E800020 */ blr 
lbl_0000215C:
/* 0000215C 3C600000 */ lis r3, modeCtrl@ha
/* 00002160 38630000 */ addi r3, r3, modeCtrl@l
/* 00002164 8083002C */ lwz r4, 0x2c(r3)
/* 00002168 3C600000 */ lis r3, lbl_802F1FE4@ha
/* 0000216C 38030000 */ addi r0, r3, lbl_802F1FE4@l
/* 00002170 5483083C */ slwi r3, r4, 1
/* 00002174 7CC01A14 */ add r6, r0, r3
/* 00002178 A8A60000 */ lha r5, 0(r6)
/* 0000217C 2C050000 */ cmpwi r5, 0
/* 00002180 41820028 */ beq lbl_000021A8
/* 00002184 1C84000C */ mulli r4, r4, 0xc
/* 00002188 3C600000 */ lis r3, lbl_80285A80@ha
/* 0000218C 38030000 */ addi r0, r3, lbl_80285A80@l
/* 00002190 7C602214 */ add r3, r0, r4
/* 00002194 54A0083C */ slwi r0, r5, 1
/* 00002198 7C830214 */ add r4, r3, r0
/* 0000219C A8640000 */ lha r3, 0(r4)
/* 000021A0 38030001 */ addi r0, r3, 1
/* 000021A4 B0040000 */ sth r0, 0(r4)
lbl_000021A8:
/* 000021A8 38000000 */ li r0, 0
/* 000021AC B0060000 */ sth r0, 0(r6)
/* 000021B0 4E800020 */ blr 
lbl_000021B4:
/* 000021B4 7C0802A6 */ mflr r0
/* 000021B8 3C600000 */ lis r3, modeCtrl@ha
/* 000021BC 90010004 */ stw r0, 4(r1)
/* 000021C0 38630000 */ addi r3, r3, modeCtrl@l
/* 000021C4 9421FFD8 */ stwu r1, -0x28(r1)
/* 000021C8 8003002C */ lwz r0, 0x2c(r3)
/* 000021CC 3C600000 */ lis r3, lbl_80285A80@ha
/* 000021D0 38630000 */ addi r3, r3, lbl_80285A80@l
/* 000021D4 1C00000C */ mulli r0, r0, 0xc
/* 000021D8 7C630214 */ add r3, r3, r0
/* 000021DC A8030002 */ lha r0, 2(r3)
/* 000021E0 2C000000 */ cmpwi r0, 0
/* 000021E4 41820088 */ beq lbl_0000226C
/* 000021E8 3C600000 */ lis r3, lbl_0000BFD0@ha
/* 000021EC 38E30000 */ addi r7, r3, lbl_0000BFD0@l
/* 000021F0 80A70000 */ lwz r5, 0(r7)
/* 000021F4 3C800000 */ lis r4, lbl_10000068@ha
/* 000021F8 80070004 */ lwz r0, 4(r7)
/* 000021FC 3C600000 */ lis r3, lbl_100000B8@ha
/* 00002200 38C40000 */ addi r6, r4, lbl_10000068@l
/* 00002204 90A10018 */ stw r5, 0x18(r1)
/* 00002208 38A30000 */ addi r5, r3, lbl_100000B8@l
/* 0000220C 386001A2 */ li r3, 0x1a2
/* 00002210 9001001C */ stw r0, 0x1c(r1)
/* 00002214 80070008 */ lwz r0, 8(r7)
/* 00002218 90010020 */ stw r0, 0x20(r1)
/* 0000221C 80010018 */ lwz r0, 0x18(r1)
/* 00002220 8081001C */ lwz r4, 0x1c(r1)
/* 00002224 90010008 */ stw r0, 8(r1)
/* 00002228 80010020 */ lwz r0, 0x20(r1)
/* 0000222C 9081000C */ stw r4, 0xc(r1)
/* 00002230 90010010 */ stw r0, 0x10(r1)
/* 00002234 80810008 */ lwz r4, 8(r1)
/* 00002238 8001000C */ lwz r0, 0xc(r1)
/* 0000223C 90860000 */ stw r4, 0(r6)
/* 00002240 90060004 */ stw r0, 4(r6)
/* 00002244 80010010 */ lwz r0, 0x10(r1)
/* 00002248 90060008 */ stw r0, 8(r6)
/* 0000224C 80810008 */ lwz r4, 8(r1)
/* 00002250 8001000C */ lwz r0, 0xc(r1)
/* 00002254 90850000 */ stw r4, 0(r5)
/* 00002258 90050004 */ stw r0, 4(r5)
/* 0000225C 80010010 */ lwz r0, 0x10(r1)
/* 00002260 90050008 */ stw r0, 8(r5)
/* 00002264 4BFFDEE9 */ bl u_play_sound_0
/* 00002268 48000060 */ b lbl_000022C8
lbl_0000226C:
/* 0000226C A8030004 */ lha r0, 4(r3)
/* 00002270 2C000000 */ cmpwi r0, 0
/* 00002274 41820010 */ beq lbl_00002284
/* 00002278 3860019D */ li r3, 0x19d
/* 0000227C 4BFFDED1 */ bl u_play_sound_0
/* 00002280 48000048 */ b lbl_000022C8
lbl_00002284:
/* 00002284 A8030008 */ lha r0, 8(r3)
/* 00002288 2C000000 */ cmpwi r0, 0
/* 0000228C 41820010 */ beq lbl_0000229C
/* 00002290 386001B6 */ li r3, 0x1b6
/* 00002294 4BFFDEB9 */ bl u_play_sound_0
/* 00002298 48000030 */ b lbl_000022C8
lbl_0000229C:
/* 0000229C A8030006 */ lha r0, 6(r3)
/* 000022A0 2C000000 */ cmpwi r0, 0
/* 000022A4 41820010 */ beq lbl_000022B4
/* 000022A8 3860019F */ li r3, 0x19f
/* 000022AC 4BFFDEA1 */ bl u_play_sound_0
/* 000022B0 48000018 */ b lbl_000022C8
lbl_000022B4:
/* 000022B4 A803000A */ lha r0, 0xa(r3)
/* 000022B8 2C000000 */ cmpwi r0, 0
/* 000022BC 4182000C */ beq lbl_000022C8
/* 000022C0 386001AC */ li r3, 0x1ac
/* 000022C4 4BFFDE89 */ bl u_play_sound_0
lbl_000022C8:
/* 000022C8 8001002C */ lwz r0, 0x2c(r1)
/* 000022CC 38210028 */ addi r1, r1, 0x28
/* 000022D0 7C0803A6 */ mtlr r0
/* 000022D4 4E800020 */ blr 
lbl_000022D8:
/* 000022D8 7C0802A6 */ mflr r0
/* 000022DC 3C600000 */ lis r3, lbl_10000090@ha
/* 000022E0 90010004 */ stw r0, 4(r1)
/* 000022E4 3C800000 */ lis r4, modeCtrl@ha
/* 000022E8 9421FFF0 */ stwu r1, -0x10(r1)
/* 000022EC 93E1000C */ stw r31, 0xc(r1)
/* 000022F0 88030000 */ lbz r0, lbl_10000090@l(r3)
/* 000022F4 38640000 */ addi r3, r4, modeCtrl@l
/* 000022F8 3BE3002C */ addi r31, r3, 0x2c
/* 000022FC 3C600000 */ lis r3, lbl_10000078@ha
/* 00002300 80BF0000 */ lwz r5, 0(r31)
/* 00002304 7C040774 */ extsb r4, r0
/* 00002308 38030000 */ addi r0, r3, lbl_10000078@l
/* 0000230C 7C602214 */ add r3, r0, r4
/* 00002310 88030000 */ lbz r0, 0(r3)
/* 00002314 3C600000 */ lis r3, lbl_80285A68@ha
/* 00002318 1C850006 */ mulli r4, r5, 6
/* 0000231C 38630000 */ addi r3, r3, lbl_80285A68@l
/* 00002320 7C000774 */ extsb r0, r0
/* 00002324 7CA32214 */ add r5, r3, r4
/* 00002328 5400083C */ slwi r0, r0, 1
/* 0000232C 7C850214 */ add r4, r5, r0
/* 00002330 A8640000 */ lha r3, 0(r4)
/* 00002334 38030001 */ addi r0, r3, 1
/* 00002338 B0040000 */ sth r0, 0(r4)
/* 0000233C A8050004 */ lha r0, 4(r5)
/* 00002340 2C000000 */ cmpwi r0, 0
/* 00002344 41820010 */ beq lbl_00002354
/* 00002348 386001B1 */ li r3, 0x1b1
/* 0000234C 4BFFDE01 */ bl u_play_sound_0
/* 00002350 4BFFE6E1 */ bl lbl_00000A30
lbl_00002354:
/* 00002354 801F0000 */ lwz r0, 0(r31)
/* 00002358 3C600000 */ lis r3, lbl_80285A68@ha
/* 0000235C 38630000 */ addi r3, r3, lbl_80285A68@l
/* 00002360 1C000006 */ mulli r0, r0, 6
/* 00002364 7C630214 */ add r3, r3, r0
/* 00002368 A8030002 */ lha r0, 2(r3)
/* 0000236C 2C000000 */ cmpwi r0, 0
/* 00002370 41820010 */ beq lbl_00002380
/* 00002374 386001AA */ li r3, 0x1aa
/* 00002378 4BFFDDD5 */ bl u_play_sound_0
/* 0000237C 4BFFE531 */ bl lbl_000008AC
lbl_00002380:
/* 00002380 809F0000 */ lwz r4, 0(r31)
/* 00002384 3C600000 */ lis r3, lbl_80285A68@ha
/* 00002388 38030000 */ addi r0, r3, lbl_80285A68@l
/* 0000238C 1C640006 */ mulli r3, r4, 6
/* 00002390 7C601A14 */ add r3, r0, r3
/* 00002394 A8030000 */ lha r0, 0(r3)
/* 00002398 2C000000 */ cmpwi r0, 0
/* 0000239C 4182000C */ beq lbl_000023A8
/* 000023A0 386001B3 */ li r3, 0x1b3
/* 000023A4 4BFFDDA9 */ bl u_play_sound_0
lbl_000023A8:
/* 000023A8 80010014 */ lwz r0, 0x14(r1)
/* 000023AC 83E1000C */ lwz r31, 0xc(r1)
/* 000023B0 38210010 */ addi r1, r1, 0x10
/* 000023B4 7C0803A6 */ mtlr r0
/* 000023B8 4E800020 */ blr 
lbl_000023BC:
/* 000023BC 7C0802A6 */ mflr r0
/* 000023C0 38600064 */ li r3, 0x64
/* 000023C4 90010004 */ stw r0, 4(r1)
/* 000023C8 38800008 */ li r4, 8
/* 000023CC 9421FFF8 */ stwu r1, -8(r1)
/* 000023D0 4BFFDD7D */ bl u_play_music
/* 000023D4 38600078 */ li r3, 0x78
/* 000023D8 4BFFDD75 */ bl hud_show_ready_banner
/* 000023DC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000023E0 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 000023E4 38000000 */ li r0, 0
/* 000023E8 90040000 */ stw r0, 0(r4)
/* 000023EC 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000023F0 38000008 */ li r0, 8
/* 000023F4 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 000023F8 8001000C */ lwz r0, 0xc(r1)
/* 000023FC 38210008 */ addi r1, r1, 8
/* 00002400 7C0803A6 */ mtlr r0
/* 00002404 4E800020 */ blr 
lbl_00002408:
/* 00002408 7C0802A6 */ mflr r0
/* 0000240C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002410 90010004 */ stw r0, 4(r1)
/* 00002414 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002418 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 0000241C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002420 80640000 */ lwz r3, 0(r4)
/* 00002424 80C50000 */ lwz r6, currentBallStructPtr@l(r5)
/* 00002428 3CA00000 */ lis r5, lbl_0000BFE0@ha
/* 0000242C 38030001 */ addi r0, r3, 1
/* 00002430 90040000 */ stw r0, 0(r4)
/* 00002434 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00002438 3C004330 */ lis r0, 0x4330
/* 0000243C 80840000 */ lwz r4, 0(r4)
/* 00002440 C8230000 */ lfd f1, lbl_0000BEE0@l(r3)
/* 00002444 6C838000 */ xoris r3, r4, 0x8000
/* 00002448 C8450000 */ lfd f2, lbl_0000BFE0@l(r5)
/* 0000244C 9061000C */ stw r3, 0xc(r1)
/* 00002450 90010008 */ stw r0, 8(r1)
/* 00002454 C8010008 */ lfd f0, 8(r1)
/* 00002458 FC000828 */ fsub f0, f0, f1
/* 0000245C FC020000 */ fcmpu cr0, f2, f0
/* 00002460 40820044 */ bne lbl_000024A4
/* 00002464 8806002E */ lbz r0, 0x2e(r6)
/* 00002468 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 0000246C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00002470 7C000774 */ extsb r0, r0
/* 00002474 38A30000 */ addi r5, r3, lbl_802F1DF8@l
/* 00002478 90050000 */ stw r0, 0(r5)
/* 0000247C 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00002480 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00002484 80A50000 */ lwz r5, 0(r5)
/* 00002488 38830000 */ addi r4, r3, lbl_802F1DFC@l
/* 0000248C 3860001E */ li r3, 0x1e
/* 00002490 54A5103A */ slwi r5, r5, 2
/* 00002494 7CA02A14 */ add r5, r0, r5
/* 00002498 80050000 */ lwz r0, 0(r5)
/* 0000249C 90040000 */ stw r0, 0(r4)
/* 000024A0 4BFFDCAD */ bl u_play_sound_0
lbl_000024A4:
/* 000024A4 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000024A8 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 000024AC 2C000078 */ cmpwi r0, 0x78
/* 000024B0 40810010 */ ble lbl_000024C0
/* 000024B4 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000024B8 3800000B */ li r0, 0xb
/* 000024BC B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_000024C0:
/* 000024C0 80010014 */ lwz r0, 0x14(r1)
/* 000024C4 38210010 */ addi r1, r1, 0x10
/* 000024C8 7C0803A6 */ mtlr r0
/* 000024CC 4E800020 */ blr 
lbl_000024D0:
/* 000024D0 7C0802A6 */ mflr r0
/* 000024D4 38600002 */ li r3, 2
/* 000024D8 90010004 */ stw r0, 4(r1)
/* 000024DC 9421FFF8 */ stwu r1, -8(r1)
/* 000024E0 4BFFDC6D */ bl event_resume
/* 000024E4 3860003C */ li r3, 0x3c
/* 000024E8 4BFFDC65 */ bl hud_show_go_banner
/* 000024EC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000024F0 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 000024F4 38000000 */ li r0, 0
/* 000024F8 90040000 */ stw r0, 0(r4)
/* 000024FC 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002500 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00002504 3800000C */ li r0, 0xc
/* 00002508 B0050000 */ sth r0, 0(r5)
/* 0000250C 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002510 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002514 3800FFFF */ li r0, -1
/* 00002518 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 0000251C 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002520 81830030 */ lwz r12, 0x30(r3)
/* 00002524 7D8803A6 */ mtlr r12
/* 00002528 4E800021 */ blrl 
/* 0000252C 8001000C */ lwz r0, 0xc(r1)
/* 00002530 38210008 */ addi r1, r1, 8
/* 00002534 7C0803A6 */ mtlr r0
/* 00002538 4E800020 */ blr 
lbl_0000253C:
/* 0000253C 7C0802A6 */ mflr r0
/* 00002540 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002544 90010004 */ stw r0, 4(r1)
/* 00002548 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 0000254C 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 00002550 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002554 93E1000C */ stw r31, 0xc(r1)
/* 00002558 80640000 */ lwz r3, 0(r4)
/* 0000255C 83E50000 */ lwz r31, currentBallStructPtr@l(r5)
/* 00002560 38030001 */ addi r0, r3, 1
/* 00002564 90040000 */ stw r0, 0(r4)
/* 00002568 3C600000 */ lis r3, lbl_80206BD0@ha
/* 0000256C 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00002570 887F002E */ lbz r3, 0x2e(r31)
/* 00002574 3C800000 */ lis r4, controllerInfo@ha
/* 00002578 38840000 */ addi r4, r4, controllerInfo@l
/* 0000257C 7C630774 */ extsb r3, r3
/* 00002580 5463103A */ slwi r3, r3, 2
/* 00002584 7C601A14 */ add r3, r0, r3
/* 00002588 80030000 */ lwz r0, 0(r3)
/* 0000258C 1C00003C */ mulli r0, r0, 0x3c
/* 00002590 7C640214 */ add r3, r4, r0
/* 00002594 A0030018 */ lhz r0, 0x18(r3)
/* 00002598 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000259C 41820060 */ beq lbl_000025FC
/* 000025A0 801F0094 */ lwz r0, 0x94(r31)
/* 000025A4 540007FF */ clrlwi. r0, r0, 0x1f
/* 000025A8 41820034 */ beq lbl_000025DC
/* 000025AC 387F001C */ addi r3, r31, 0x1c
/* 000025B0 C0230000 */ lfs f1, 0(r3)
/* 000025B4 C0430004 */ lfs f2, 4(r3)
/* 000025B8 C0030008 */ lfs f0, 8(r3)
/* 000025BC EC210072 */ fmuls f1, f1, f1
/* 000025C0 EC2208BA */ fmadds f1, f2, f2, f1
/* 000025C4 EC20083A */ fmadds f1, f0, f0, f1
/* 000025C8 4BFFDB85 */ bl mathutil_sqrt
/* 000025CC 3C600000 */ lis r3, lbl_0000BFE8@ha
/* 000025D0 C8030000 */ lfd f0, lbl_0000BFE8@l(r3)
/* 000025D4 FC010040 */ fcmpo cr0, f1, f0
/* 000025D8 41800024 */ blt lbl_000025FC
lbl_000025DC:
/* 000025DC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000025E0 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 000025E4 2C00003C */ cmpwi r0, 0x3c
/* 000025E8 40810014 */ ble lbl_000025FC
/* 000025EC 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000025F0 3800000D */ li r0, 0xd
/* 000025F4 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 000025F8 480000B0 */ b lbl_000026A8
lbl_000025FC:
/* 000025FC 3C600000 */ lis r3, lbl_10000018@ha
/* 00002600 A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00002604 2C000000 */ cmpwi r0, 0
/* 00002608 4082009C */ bne lbl_000026A4
/* 0000260C 807F00FC */ lwz r3, 0xfc(r31)
/* 00002610 80030014 */ lwz r0, 0x14(r3)
/* 00002614 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002618 4182008C */ beq lbl_000026A4
/* 0000261C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002620 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002624 3C608889 */ lis r3, 0x8889
/* 00002628 80840000 */ lwz r4, 0(r4)
/* 0000262C 38038889 */ addi r0, r3, -30583  ;# fixed addi
/* 00002630 7C002096 */ mulhw r0, r0, r4
/* 00002634 7C002214 */ add r0, r0, r4
/* 00002638 7C002670 */ srawi r0, r0, 4
/* 0000263C 54030FFE */ srwi r3, r0, 0x1f
/* 00002640 7C001A14 */ add r0, r0, r3
/* 00002644 1C00001E */ mulli r0, r0, 0x1e
/* 00002648 7C002050 */ subf r0, r0, r4
/* 0000264C 2C000001 */ cmpwi r0, 1
/* 00002650 40820054 */ bne lbl_000026A4
/* 00002654 881F002E */ lbz r0, 0x2e(r31)
/* 00002658 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 0000265C 38A30000 */ addi r5, r3, lbl_802F1DF8@l
/* 00002660 7C000774 */ extsb r0, r0
/* 00002664 90050000 */ stw r0, 0(r5)
/* 00002668 3C800000 */ lis r4, playerCharacterSelection@ha
/* 0000266C 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00002670 80850000 */ lwz r4, 0(r5)
/* 00002674 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00002678 5484103A */ slwi r4, r4, 2
/* 0000267C 7C802214 */ add r4, r0, r4
/* 00002680 80040000 */ lwz r0, 0(r4)
/* 00002684 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 00002688 4BFFDAC5 */ bl rand
/* 0000268C 3C800000 */ lis r4, lbl_0000BE80@ha
/* 00002690 5463AF3C */ rlwinm r3, r3, 0x15, 0x1c, 0x1e
/* 00002694 38040000 */ addi r0, r4, lbl_0000BE80@l
/* 00002698 7C601A14 */ add r3, r0, r3
/* 0000269C A8630000 */ lha r3, 0(r3)
/* 000026A0 4BFFDAAD */ bl u_play_sound_0
lbl_000026A4:
/* 000026A4 48002371 */ bl lbl_00004A14
lbl_000026A8:
/* 000026A8 80010014 */ lwz r0, 0x14(r1)
/* 000026AC 83E1000C */ lwz r31, 0xc(r1)
/* 000026B0 38210010 */ addi r1, r1, 0x10
/* 000026B4 7C0803A6 */ mtlr r0
/* 000026B8 4E800020 */ blr 
lbl_000026BC:
/* 000026BC 7C0802A6 */ mflr r0
/* 000026C0 3C800000 */ lis r4, lbl_0000BE80@ha
/* 000026C4 90010004 */ stw r0, 4(r1)
/* 000026C8 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000026CC 9421FFD8 */ stwu r1, -0x28(r1)
/* 000026D0 93E10024 */ stw r31, 0x24(r1)
/* 000026D4 93C10020 */ stw r30, 0x20(r1)
/* 000026D8 93A1001C */ stw r29, 0x1c(r1)
/* 000026DC 3BA40000 */ addi r29, r4, lbl_0000BE80@l
/* 000026E0 3C800000 */ lis r4, lbl_10000000@ha
/* 000026E4 C01D0180 */ lfs f0, 0x180(r29)
/* 000026E8 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 000026EC 83C30000 */ lwz r30, currentBallStructPtr@l(r3)
/* 000026F0 D01F0004 */ stfs f0, 4(r31)
/* 000026F4 807D0170 */ lwz r3, 0x170(r29)
/* 000026F8 801D0174 */ lwz r0, 0x174(r29)
/* 000026FC 90610008 */ stw r3, 8(r1)
/* 00002700 9001000C */ stw r0, 0xc(r1)
/* 00002704 807D0178 */ lwz r3, 0x178(r29)
/* 00002708 801D017C */ lwz r0, 0x17c(r29)
/* 0000270C 90610010 */ stw r3, 0x10(r1)
/* 00002710 90010014 */ stw r0, 0x14(r1)
/* 00002714 80610008 */ lwz r3, 8(r1)
/* 00002718 8001000C */ lwz r0, 0xc(r1)
/* 0000271C 907E0098 */ stw r3, 0x98(r30)
/* 00002720 901E009C */ stw r0, 0x9c(r30)
/* 00002724 80610010 */ lwz r3, 0x10(r1)
/* 00002728 80010014 */ lwz r0, 0x14(r1)
/* 0000272C 907E00A0 */ stw r3, 0xa0(r30)
/* 00002730 901E00A4 */ stw r0, 0xa4(r30)
/* 00002734 4BFFDA19 */ bl mathutil_mtxA_sq_from_identity
/* 00002738 C01E0024 */ lfs f0, 0x24(r30)
/* 0000273C C03E001C */ lfs f1, 0x1c(r30)
/* 00002740 EC210072 */ fmuls f1, f1, f1
/* 00002744 EC20083A */ fmadds f1, f0, f0, f1
/* 00002748 C81D0188 */ lfd f0, 0x188(r29)
/* 0000274C FC010040 */ fcmpo cr0, f1, f0
/* 00002750 41810010 */ bgt lbl_00002760
/* 00002754 801E0094 */ lwz r0, 0x94(r30)
/* 00002758 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000275C 41820020 */ beq lbl_0000277C
lbl_00002760:
/* 00002760 C03E001C */ lfs f1, 0x1c(r30)
/* 00002764 C01E0024 */ lfs f0, 0x24(r30)
/* 00002768 FC200850 */ fneg f1, f1
/* 0000276C FC400050 */ fneg f2, f0
/* 00002770 4BFFD9DD */ bl mathutil_atan2
/* 00002774 7C630734 */ extsh r3, r3
/* 00002778 4BFFD9D5 */ bl mathutil_mtxA_rotate_y
lbl_0000277C:
/* 0000277C 387E0030 */ addi r3, r30, 0x30
/* 00002780 4BFFD9CD */ bl mathutil_mtxA_sq_to_mtx
/* 00002784 38000001 */ li r0, 1
/* 00002788 981E0148 */ stb r0, 0x148(r30)
/* 0000278C 3C800000 */ lis r4, cameraInfo@ha
/* 00002790 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00002794 881E002E */ lbz r0, 0x2e(r30)
/* 00002798 38840000 */ addi r4, r4, cameraInfo@l
/* 0000279C 38A00002 */ li r5, 2
/* 000027A0 7C000774 */ extsb r0, r0
/* 000027A4 1C000284 */ mulli r0, r0, 0x284
/* 000027A8 7C840214 */ add r4, r4, r0
/* 000027AC 98A4001F */ stb r5, 0x1f(r4)
/* 000027B0 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 000027B4 386000F0 */ li r3, 0xf0
/* 000027B8 801E0094 */ lwz r0, 0x94(r30)
/* 000027BC 60000010 */ ori r0, r0, 0x10
/* 000027C0 901E0094 */ stw r0, 0x94(r30)
/* 000027C4 80040000 */ lwz r0, 0(r4)
/* 000027C8 60000100 */ ori r0, r0, 0x100
/* 000027CC 90040000 */ stw r0, 0(r4)
/* 000027D0 4BFFD97D */ bl u_play_sound_0
/* 000027D4 A81F0018 */ lha r0, 0x18(r31)
/* 000027D8 2C000000 */ cmpwi r0, 0
/* 000027DC 40820010 */ bne lbl_000027EC
/* 000027E0 386000EF */ li r3, 0xef
/* 000027E4 4BFFD969 */ bl u_play_sound_2
/* 000027E8 907F002C */ stw r3, 0x2c(r31)
lbl_000027EC:
/* 000027EC 889E002E */ lbz r4, 0x2e(r30)
/* 000027F0 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000027F4 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000027F8 7C830774 */ extsb r3, r4
/* 000027FC 5463103A */ slwi r3, r3, 2
/* 00002800 7C601A14 */ add r3, r0, r3
/* 00002804 80630000 */ lwz r3, 0(r3)
/* 00002808 38800001 */ li r4, 1
/* 0000280C 38A0000A */ li r5, 0xa
/* 00002810 4BFFD93D */ bl func_800B60F4
/* 00002814 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002818 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 0000281C 38000000 */ li r0, 0
/* 00002820 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00002824 90040000 */ stw r0, 0(r4)
/* 00002828 38830000 */ addi r4, r3, lbl_802F1FF4@l
/* 0000282C 3800000E */ li r0, 0xe
/* 00002830 B0040000 */ sth r0, 0(r4)
/* 00002834 A8040000 */ lha r0, 0(r4)
/* 00002838 2C00FFFF */ cmpwi r0, -1
/* 0000283C 41820014 */ beq lbl_00002850
/* 00002840 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002844 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 00002848 3800FFFF */ li r0, -1
/* 0000284C B0040000 */ sth r0, 0(r4)
lbl_00002850:
/* 00002850 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002854 A8830000 */ lha r4, lbl_802F1FF6@l(r3)
/* 00002858 3C600000 */ lis r3, lbl_0000C748@ha
/* 0000285C 38030000 */ addi r0, r3, lbl_0000C748@l
/* 00002860 5483103A */ slwi r3, r4, 2
/* 00002864 7C601A14 */ add r3, r0, r3
/* 00002868 81830000 */ lwz r12, 0(r3)
/* 0000286C 7D8803A6 */ mtlr r12
/* 00002870 4E800021 */ blrl 
/* 00002874 8001002C */ lwz r0, 0x2c(r1)
/* 00002878 83E10024 */ lwz r31, 0x24(r1)
/* 0000287C 83C10020 */ lwz r30, 0x20(r1)
/* 00002880 7C0803A6 */ mtlr r0
/* 00002884 83A1001C */ lwz r29, 0x1c(r1)
/* 00002888 38210028 */ addi r1, r1, 0x28
/* 0000288C 4E800020 */ blr 
lbl_00002890:
/* 00002890 7C0802A6 */ mflr r0
/* 00002894 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002898 90010004 */ stw r0, 4(r1)
/* 0000289C 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 000028A0 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 000028A4 9421FFF0 */ stwu r1, -0x10(r1)
/* 000028A8 93E1000C */ stw r31, 0xc(r1)
/* 000028AC 80640000 */ lwz r3, 0(r4)
/* 000028B0 83E50000 */ lwz r31, currentBallStructPtr@l(r5)
/* 000028B4 38030001 */ addi r0, r3, 1
/* 000028B8 90040000 */ stw r0, 0(r4)
/* 000028BC 80040000 */ lwz r0, 0(r4)
/* 000028C0 2C000011 */ cmpwi r0, 0x11
/* 000028C4 40820044 */ bne lbl_00002908
/* 000028C8 881F002E */ lbz r0, 0x2e(r31)
/* 000028CC 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 000028D0 3C800000 */ lis r4, playerCharacterSelection@ha
/* 000028D4 7C000774 */ extsb r0, r0
/* 000028D8 38A30000 */ addi r5, r3, lbl_802F1DF8@l
/* 000028DC 90050000 */ stw r0, 0(r5)
/* 000028E0 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 000028E4 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 000028E8 80A50000 */ lwz r5, 0(r5)
/* 000028EC 38830000 */ addi r4, r3, lbl_802F1DFC@l
/* 000028F0 3860001F */ li r3, 0x1f
/* 000028F4 54A5103A */ slwi r5, r5, 2
/* 000028F8 7CA02A14 */ add r5, r0, r5
/* 000028FC 80050000 */ lwz r0, 0(r5)
/* 00002900 90040000 */ stw r0, 0(r4)
/* 00002904 4BFFD849 */ bl u_play_sound_0
lbl_00002908:
/* 00002908 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 0000290C 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00002910 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002914 4182009C */ beq lbl_000029B0
/* 00002918 807F00FC */ lwz r3, 0xfc(r31)
/* 0000291C 80030014 */ lwz r0, 0x14(r3)
/* 00002920 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002924 4182008C */ beq lbl_000029B0
/* 00002928 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 0000292C 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002930 3C608889 */ lis r3, 0x8889
/* 00002934 80840000 */ lwz r4, 0(r4)
/* 00002938 38038889 */ addi r0, r3, -30583  ;# fixed addi
/* 0000293C 7C002096 */ mulhw r0, r0, r4
/* 00002940 7C002214 */ add r0, r0, r4
/* 00002944 7C002670 */ srawi r0, r0, 4
/* 00002948 54030FFE */ srwi r3, r0, 0x1f
/* 0000294C 7C001A14 */ add r0, r0, r3
/* 00002950 1C00001E */ mulli r0, r0, 0x1e
/* 00002954 7C002050 */ subf r0, r0, r4
/* 00002958 2C000001 */ cmpwi r0, 1
/* 0000295C 40820054 */ bne lbl_000029B0
/* 00002960 881F002E */ lbz r0, 0x2e(r31)
/* 00002964 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 00002968 38A30000 */ addi r5, r3, lbl_802F1DF8@l
/* 0000296C 7C000774 */ extsb r0, r0
/* 00002970 90050000 */ stw r0, 0(r5)
/* 00002974 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00002978 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 0000297C 80850000 */ lwz r4, 0(r5)
/* 00002980 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00002984 5484103A */ slwi r4, r4, 2
/* 00002988 7C802214 */ add r4, r0, r4
/* 0000298C 80040000 */ lwz r0, 0(r4)
/* 00002990 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 00002994 4BFFD7B9 */ bl rand
/* 00002998 3C800000 */ lis r4, lbl_0000BE80@ha
/* 0000299C 5463AF3C */ rlwinm r3, r3, 0x15, 0x1c, 0x1e
/* 000029A0 38040000 */ addi r0, r4, lbl_0000BE80@l
/* 000029A4 7C601A14 */ add r3, r0, r3
/* 000029A8 A8630000 */ lha r3, 0(r3)
/* 000029AC 4BFFD7A1 */ bl u_play_sound_0
lbl_000029B0:
/* 000029B0 881F002E */ lbz r0, 0x2e(r31)
/* 000029B4 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000029B8 3CA00000 */ lis r5, controllerInfo@ha
/* 000029BC 7C000774 */ extsb r0, r0
/* 000029C0 5404103A */ slwi r4, r0, 2
/* 000029C4 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000029C8 7C602214 */ add r3, r0, r4
/* 000029CC 80030000 */ lwz r0, 0(r3)
/* 000029D0 38650000 */ addi r3, r5, controllerInfo@l
/* 000029D4 1C00003C */ mulli r0, r0, 0x3c
/* 000029D8 7C630214 */ add r3, r3, r0
/* 000029DC A0030018 */ lhz r0, 0x18(r3)
/* 000029E0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000029E4 41820030 */ beq lbl_00002A14
/* 000029E8 3C800000 */ lis r4, lbl_802F1FDC@ha
/* 000029EC 3C600000 */ lis r3, lbl_0000C010@ha
/* 000029F0 C0240000 */ lfs f1, lbl_802F1FDC@l(r4)
/* 000029F4 C8030000 */ lfd f0, lbl_0000C010@l(r3)
/* 000029F8 FC010040 */ fcmpo cr0, f1, f0
/* 000029FC 4C411382 */ cror 2, 1, 2
/* 00002A00 40820014 */ bne lbl_00002A14
/* 00002A04 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00002A08 38000011 */ li r0, 0x11
/* 00002A0C B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00002A10 48000008 */ b lbl_00002A18
lbl_00002A14:
/* 00002A14 48002001 */ bl lbl_00004A14
lbl_00002A18:
/* 00002A18 80010014 */ lwz r0, 0x14(r1)
/* 00002A1C 83E1000C */ lwz r31, 0xc(r1)
/* 00002A20 38210010 */ addi r1, r1, 0x10
/* 00002A24 7C0803A6 */ mtlr r0
/* 00002A28 4E800020 */ blr 
lbl_00002A2C:
/* 00002A2C 7C0802A6 */ mflr r0
/* 00002A30 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00002A34 90010004 */ stw r0, 4(r1)
/* 00002A38 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 00002A3C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002A40 9421FFF8 */ stwu r1, -8(r1)
/* 00002A44 3CA00000 */ lis r5, lbl_0000BE80@ha
/* 00002A48 80040000 */ lwz r0, 0(r4)
/* 00002A4C 80C30000 */ lwz r6, currentBallStructPtr@l(r3)
/* 00002A50 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00002A54 60000020 */ ori r0, r0, 0x20
/* 00002A58 90040000 */ stw r0, 0(r4)
/* 00002A5C 38850000 */ addi r4, r5, lbl_0000BE80@l
/* 00002A60 C8040198 */ lfd f0, 0x198(r4)
/* 00002A64 C4230000 */ lfsu f1, lbl_802F1FDC@l(r3)
/* 00002A68 FC010040 */ fcmpo cr0, f1, f0
/* 00002A6C 4C411382 */ cror 2, 1, 2
/* 00002A70 4082000C */ bne lbl_00002A7C
/* 00002A74 C00401A0 */ lfs f0, 0x1a0(r4)
/* 00002A78 D0030000 */ stfs f0, 0(r3)
lbl_00002A7C:
/* 00002A7C C00401A4 */ lfs f0, 0x1a4(r4)
/* 00002A80 386000EF */ li r3, 0xef
/* 00002A84 D0060070 */ stfs f0, 0x70(r6)
/* 00002A88 4BFFD6C5 */ bl SoundOffID
/* 00002A8C 3C600000 */ lis r3, lbl_1000001E@ha
/* 00002A90 38830000 */ addi r4, r3, lbl_1000001E@l
/* 00002A94 38000000 */ li r0, 0
/* 00002A98 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002A9C B0040000 */ sth r0, 0(r4)
/* 00002AA0 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002AA4 90040000 */ stw r0, 0(r4)
/* 00002AA8 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002AAC 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00002AB0 38000010 */ li r0, 0x10
/* 00002AB4 B0050000 */ sth r0, 0(r5)
/* 00002AB8 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002ABC 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002AC0 3800FFFF */ li r0, -1
/* 00002AC4 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00002AC8 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002ACC 81830040 */ lwz r12, 0x40(r3)
/* 00002AD0 7D8803A6 */ mtlr r12
/* 00002AD4 4E800021 */ blrl 
/* 00002AD8 8001000C */ lwz r0, 0xc(r1)
/* 00002ADC 38210008 */ addi r1, r1, 8
/* 00002AE0 7C0803A6 */ mtlr r0
/* 00002AE4 4E800020 */ blr 
lbl_00002AE8:
/* 00002AE8 7C0802A6 */ mflr r0
/* 00002AEC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002AF0 90010004 */ stw r0, 4(r1)
/* 00002AF4 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002AF8 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 00002AFC 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002B00 93E1000C */ stw r31, 0xc(r1)
/* 00002B04 93C10008 */ stw r30, 8(r1)
/* 00002B08 80640000 */ lwz r3, 0(r4)
/* 00002B0C 83C50000 */ lwz r30, currentBallStructPtr@l(r5)
/* 00002B10 38030001 */ addi r0, r3, 1
/* 00002B14 90040000 */ stw r0, 0(r4)
/* 00002B18 3C600000 */ lis r3, lbl_10000000@ha
/* 00002B1C 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00002B20 881E0003 */ lbz r0, 3(r30)
/* 00002B24 7C000775 */ extsb. r0, r0
/* 00002B28 4082002C */ bne lbl_00002B54
/* 00002B2C 38600002 */ li r3, 2
/* 00002B30 4BFFD61D */ bl event_suspend
/* 00002B34 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002B38 38630000 */ addi r3, r3, lbl_80206DEC@l
/* 00002B3C 8003001C */ lwz r0, 0x1c(r3)
/* 00002B40 60000001 */ ori r0, r0, 1
/* 00002B44 9003001C */ stw r0, 0x1c(r3)
/* 00002B48 A07F001E */ lhz r3, 0x1e(r31)
/* 00002B4C 38030001 */ addi r0, r3, 1
/* 00002B50 B01F001E */ sth r0, 0x1e(r31)
lbl_00002B54:
/* 00002B54 A0DF001E */ lhz r6, 0x1e(r31)
/* 00002B58 2806001E */ cmplwi r6, 0x1e
/* 00002B5C 40820024 */ bne lbl_00002B80
/* 00002B60 48006E45 */ bl lbl_000099A4
/* 00002B64 3860016A */ li r3, 0x16a
/* 00002B68 3880016B */ li r4, 0x16b
/* 00002B6C 4BFFD5E1 */ bl func_8002BFCC
/* 00002B70 38600000 */ li r3, 0
/* 00002B74 38800008 */ li r4, 8
/* 00002B78 4BFFD5D5 */ bl u_play_music
/* 00002B7C 48000080 */ b lbl_00002BFC
lbl_00002B80:
/* 00002B80 28060078 */ cmplwi r6, 0x78
/* 00002B84 40820010 */ bne lbl_00002B94
/* 00002B88 386001AF */ li r3, 0x1af
/* 00002B8C 4BFFD5C1 */ bl u_play_sound_0
/* 00002B90 4800006C */ b lbl_00002BFC
lbl_00002B94:
/* 00002B94 280600F0 */ cmplwi r6, 0xf0
/* 00002B98 40820014 */ bne lbl_00002BAC
/* 00002B9C 38600064 */ li r3, 0x64
/* 00002BA0 38800008 */ li r4, 8
/* 00002BA4 4BFFD5A9 */ bl u_play_music
/* 00002BA8 48000054 */ b lbl_00002BFC
lbl_00002BAC:
/* 00002BAC 40810050 */ ble lbl_00002BFC
/* 00002BB0 881E002E */ lbz r0, 0x2e(r30)
/* 00002BB4 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00002BB8 3CA00000 */ lis r5, controllerInfo@ha
/* 00002BBC 7C000774 */ extsb r0, r0
/* 00002BC0 5404103A */ slwi r4, r0, 2
/* 00002BC4 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00002BC8 7C602214 */ add r3, r0, r4
/* 00002BCC 80030000 */ lwz r0, 0(r3)
/* 00002BD0 38650000 */ addi r3, r5, controllerInfo@l
/* 00002BD4 1C00003C */ mulli r0, r0, 0x3c
/* 00002BD8 7C630214 */ add r3, r3, r0
/* 00002BDC A0030018 */ lhz r0, 0x18(r3)
/* 00002BE0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002BE4 4082000C */ bne lbl_00002BF0
/* 00002BE8 280601A4 */ cmplwi r6, 0x1a4
/* 00002BEC 40810010 */ ble lbl_00002BFC
lbl_00002BF0:
/* 00002BF0 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00002BF4 38000000 */ li r0, 0
/* 00002BF8 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_00002BFC:
/* 00002BFC 48001E19 */ bl lbl_00004A14
/* 00002C00 80010014 */ lwz r0, 0x14(r1)
/* 00002C04 83E1000C */ lwz r31, 0xc(r1)
/* 00002C08 83C10008 */ lwz r30, 8(r1)
/* 00002C0C 7C0803A6 */ mtlr r0
/* 00002C10 38210010 */ addi r1, r1, 0x10
/* 00002C14 4E800020 */ blr 
lbl_00002C18:
/* 00002C18 7C0802A6 */ mflr r0
/* 00002C1C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002C20 90010004 */ stw r0, 4(r1)
/* 00002C24 3C800000 */ lis r4, lbl_10000000@ha
/* 00002C28 9421FFE8 */ stwu r1, -0x18(r1)
/* 00002C2C 93E10014 */ stw r31, 0x14(r1)
/* 00002C30 93C10010 */ stw r30, 0x10(r1)
/* 00002C34 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00002C38 93A1000C */ stw r29, 0xc(r1)
/* 00002C3C 83A30000 */ lwz r29, currentBallStructPtr@l(r3)
/* 00002C40 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00002C44 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 00002C48 38600002 */ li r3, 2
/* 00002C4C 4BFFD501 */ bl event_suspend
/* 00002C50 38000003 */ li r0, 3
/* 00002C54 3C600000 */ lis r3, modeCtrl@ha
/* 00002C58 981D0148 */ stb r0, 0x148(r29)
/* 00002C5C 38630000 */ addi r3, r3, modeCtrl@l
/* 00002C60 8003002C */ lwz r0, 0x2c(r3)
/* 00002C64 3C600000 */ lis r3, lbl_80285A80@ha
/* 00002C68 38630000 */ addi r3, r3, lbl_80285A80@l
/* 00002C6C 1C00000C */ mulli r0, r0, 0xc
/* 00002C70 7C630214 */ add r3, r3, r0
/* 00002C74 A8030008 */ lha r0, 8(r3)
/* 00002C78 2C000000 */ cmpwi r0, 0
/* 00002C7C 41820010 */ beq lbl_00002C8C
/* 00002C80 C01F01A8 */ lfs f0, 0x1a8(r31)
/* 00002C84 D01D0070 */ stfs f0, 0x70(r29)
/* 00002C88 48000024 */ b lbl_00002CAC
lbl_00002C8C:
/* 00002C8C A8030004 */ lha r0, 4(r3)
/* 00002C90 2C000000 */ cmpwi r0, 0
/* 00002C94 41820010 */ beq lbl_00002CA4
/* 00002C98 C01F01AC */ lfs f0, 0x1ac(r31)
/* 00002C9C D01D0070 */ stfs f0, 0x70(r29)
/* 00002CA0 4800000C */ b lbl_00002CAC
lbl_00002CA4:
/* 00002CA4 C01F01A4 */ lfs f0, 0x1a4(r31)
/* 00002CA8 D01D0070 */ stfs f0, 0x70(r29)
lbl_00002CAC:
/* 00002CAC 801E002C */ lwz r0, 0x2c(r30)
/* 00002CB0 2C00FFFF */ cmpwi r0, -1
/* 00002CB4 41820014 */ beq lbl_00002CC8
/* 00002CB8 5403043E */ clrlwi r3, r0, 0x10
/* 00002CBC 4BFFD491 */ bl SoundOff
/* 00002CC0 3800FFFF */ li r0, -1
/* 00002CC4 901E002C */ stw r0, 0x2c(r30)
lbl_00002CC8:
/* 00002CC8 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002CCC 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002CD0 38000000 */ li r0, 0
/* 00002CD4 90040000 */ stw r0, 0(r4)
/* 00002CD8 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002CDC 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00002CE0 38000012 */ li r0, 0x12
/* 00002CE4 B0050000 */ sth r0, 0(r5)
/* 00002CE8 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002CEC 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002CF0 3800FFFF */ li r0, -1
/* 00002CF4 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00002CF8 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002CFC 81830048 */ lwz r12, 0x48(r3)
/* 00002D00 7D8803A6 */ mtlr r12
/* 00002D04 4E800021 */ blrl 
/* 00002D08 8001001C */ lwz r0, 0x1c(r1)
/* 00002D0C 83E10014 */ lwz r31, 0x14(r1)
/* 00002D10 83C10010 */ lwz r30, 0x10(r1)
/* 00002D14 7C0803A6 */ mtlr r0
/* 00002D18 83A1000C */ lwz r29, 0xc(r1)
/* 00002D1C 38210018 */ addi r1, r1, 0x18
/* 00002D20 4E800020 */ blr 
lbl_00002D24:
/* 00002D24 7C0802A6 */ mflr r0
/* 00002D28 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002D2C 90010004 */ stw r0, 4(r1)
/* 00002D30 38A30000 */ addi r5, r3, lbl_802F1FF0@l
/* 00002D34 3C600000 */ lis r3, lbl_10000018@ha
/* 00002D38 9421FFF8 */ stwu r1, -8(r1)
/* 00002D3C 80850000 */ lwz r4, 0(r5)
/* 00002D40 38040001 */ addi r0, r4, 1
/* 00002D44 90050000 */ stw r0, 0(r5)
/* 00002D48 A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00002D4C 2C000000 */ cmpwi r0, 0
/* 00002D50 408200A0 */ bne lbl_00002DF0
/* 00002D54 3C800000 */ lis r4, lbl_0000C030@ha
/* 00002D58 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00002D5C C8240000 */ lfd f1, lbl_0000C030@l(r4)
/* 00002D60 C0030000 */ lfs f0, lbl_802F1FDC@l(r3)
/* 00002D64 FC010000 */ fcmpu cr0, f1, f0
/* 00002D68 40820088 */ bne lbl_00002DF0
/* 00002D6C 3C608889 */ lis r3, 0x8889
/* 00002D70 80850000 */ lwz r4, 0(r5)
/* 00002D74 38038889 */ addi r0, r3, -30583  ;# fixed addi
/* 00002D78 7C002096 */ mulhw r0, r0, r4
/* 00002D7C 7C002214 */ add r0, r0, r4
/* 00002D80 7C002670 */ srawi r0, r0, 4
/* 00002D84 54030FFE */ srwi r3, r0, 0x1f
/* 00002D88 7C001A14 */ add r0, r0, r3
/* 00002D8C 1C00001E */ mulli r0, r0, 0x1e
/* 00002D90 7C002050 */ subf r0, r0, r4
/* 00002D94 2C000001 */ cmpwi r0, 1
/* 00002D98 40820058 */ bne lbl_00002DF0
/* 00002D9C 3C600000 */ lis r3, modeCtrl@ha
/* 00002DA0 38830000 */ addi r4, r3, modeCtrl@l
/* 00002DA4 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 00002DA8 8004002C */ lwz r0, 0x2c(r4)
/* 00002DAC 38A30000 */ addi r5, r3, lbl_802F1DF8@l
/* 00002DB0 90050000 */ stw r0, 0(r5)
/* 00002DB4 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00002DB8 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00002DBC 80A50000 */ lwz r5, 0(r5)
/* 00002DC0 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00002DC4 54A4103A */ slwi r4, r5, 2
/* 00002DC8 7C802214 */ add r4, r0, r4
/* 00002DCC 80040000 */ lwz r0, 0(r4)
/* 00002DD0 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 00002DD4 4BFFD379 */ bl rand
/* 00002DD8 3C800000 */ lis r4, lbl_0000BE80@ha
/* 00002DDC 5463AF3C */ rlwinm r3, r3, 0x15, 0x1c, 0x1e
/* 00002DE0 38040000 */ addi r0, r4, lbl_0000BE80@l
/* 00002DE4 7C601A14 */ add r3, r0, r3
/* 00002DE8 A8630000 */ lha r3, 0(r3)
/* 00002DEC 4BFFD361 */ bl u_play_sound_0
lbl_00002DF0:
/* 00002DF0 48001C25 */ bl lbl_00004A14
/* 00002DF4 8001000C */ lwz r0, 0xc(r1)
/* 00002DF8 38210008 */ addi r1, r1, 8
/* 00002DFC 7C0803A6 */ mtlr r0
/* 00002E00 4E800020 */ blr 
lbl_00002E04:
/* 00002E04 7C0802A6 */ mflr r0
/* 00002E08 3C600000 */ lis r3, modeCtrl@ha
/* 00002E0C 90010004 */ stw r0, 4(r1)
/* 00002E10 38630000 */ addi r3, r3, modeCtrl@l
/* 00002E14 9421FFF8 */ stwu r1, -8(r1)
/* 00002E18 8003002C */ lwz r0, 0x2c(r3)
/* 00002E1C 3C600000 */ lis r3, lbl_80285A80@ha
/* 00002E20 38630000 */ addi r3, r3, lbl_80285A80@l
/* 00002E24 1C00000C */ mulli r0, r0, 0xc
/* 00002E28 7C630214 */ add r3, r3, r0
/* 00002E2C A8030004 */ lha r0, 4(r3)
/* 00002E30 2C000000 */ cmpwi r0, 0
/* 00002E34 41820010 */ beq lbl_00002E44
/* 00002E38 38600135 */ li r3, 0x135
/* 00002E3C 4BFFD311 */ bl u_play_sound_0
/* 00002E40 48000018 */ b lbl_00002E58
lbl_00002E44:
/* 00002E44 A8030008 */ lha r0, 8(r3)
/* 00002E48 2C000000 */ cmpwi r0, 0
/* 00002E4C 4182000C */ beq lbl_00002E58
/* 00002E50 38600138 */ li r3, 0x138
/* 00002E54 4BFFD2F9 */ bl u_play_sound_0
lbl_00002E58:
/* 00002E58 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002E5C 38000014 */ li r0, 0x14
/* 00002E60 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 00002E64 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002E68 3800FFFF */ li r0, -1
/* 00002E6C 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002E70 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00002E74 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002E78 81830050 */ lwz r12, 0x50(r3)
/* 00002E7C 7D8803A6 */ mtlr r12
/* 00002E80 4E800021 */ blrl 
/* 00002E84 8001000C */ lwz r0, 0xc(r1)
/* 00002E88 38210008 */ addi r1, r1, 8
/* 00002E8C 7C0803A6 */ mtlr r0
/* 00002E90 4E800020 */ blr 
lbl_00002E94:
/* 00002E94 7C0802A6 */ mflr r0
/* 00002E98 90010004 */ stw r0, 4(r1)
/* 00002E9C 9421FFF8 */ stwu r1, -8(r1)
/* 00002EA0 48001B75 */ bl lbl_00004A14
/* 00002EA4 8001000C */ lwz r0, 0xc(r1)
/* 00002EA8 38210008 */ addi r1, r1, 8
/* 00002EAC 7C0803A6 */ mtlr r0
/* 00002EB0 4E800020 */ blr 
lbl_00002EB4:
/* 00002EB4 7C0802A6 */ mflr r0
/* 00002EB8 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002EBC 90010004 */ stw r0, 4(r1)
/* 00002EC0 38630000 */ addi r3, r3, lbl_80206DEC@l
/* 00002EC4 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00002EC8 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002ECC 93E1000C */ stw r31, 0xc(r1)
/* 00002ED0 8003001C */ lwz r0, 0x1c(r3)
/* 00002ED4 83E40000 */ lwz r31, currentBallStructPtr@l(r4)
/* 00002ED8 60000001 */ ori r0, r0, 1
/* 00002EDC 9003001C */ stw r0, 0x1c(r3)
/* 00002EE0 7FE3FB78 */ mr r3, r31
/* 00002EE4 48003D11 */ bl lbl_00006BF4
/* 00002EE8 48005681 */ bl lbl_00008568
/* 00002EEC 3C600000 */ lis r3, lbl_10000074@ha
/* 00002EF0 80A30000 */ lwz r5, lbl_10000074@l(r3)
/* 00002EF4 2C050005 */ cmpwi r5, 5
/* 00002EF8 41800020 */ blt lbl_00002F18
/* 00002EFC 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00002F00 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 00002F04 80640000 */ lwz r3, 0(r4)
/* 00002F08 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00002F0C 4082000C */ bne lbl_00002F18
/* 00002F10 60600001 */ ori r0, r3, 1
/* 00002F14 90040000 */ stw r0, 0(r4)
lbl_00002F18:
/* 00002F18 2C05012C */ cmpwi r5, 0x12c
/* 00002F1C 41800010 */ blt lbl_00002F2C
/* 00002F20 386001AE */ li r3, 0x1ae
/* 00002F24 4BFFD229 */ bl u_play_sound_0
/* 00002F28 48000034 */ b lbl_00002F5C
lbl_00002F2C:
/* 00002F2C 2C050064 */ cmpwi r5, 0x64
/* 00002F30 41800010 */ blt lbl_00002F40
/* 00002F34 386001AD */ li r3, 0x1ad
/* 00002F38 4BFFD215 */ bl u_play_sound_0
/* 00002F3C 48000020 */ b lbl_00002F5C
lbl_00002F40:
/* 00002F40 2C05000A */ cmpwi r5, 0xa
/* 00002F44 41800010 */ blt lbl_00002F54
/* 00002F48 386001A0 */ li r3, 0x1a0
/* 00002F4C 4BFFD201 */ bl u_play_sound_0
/* 00002F50 4800000C */ b lbl_00002F5C
lbl_00002F54:
/* 00002F54 386001A4 */ li r3, 0x1a4
/* 00002F58 4BFFD1F5 */ bl u_play_sound_0
lbl_00002F5C:
/* 00002F5C 38600000 */ li r3, 0
/* 00002F60 38800008 */ li r4, 8
/* 00002F64 4BFFD1E9 */ bl u_play_music
/* 00002F68 386000F9 */ li r3, 0xf9
/* 00002F6C 4BFFD1E1 */ bl SoundOffID
/* 00002F70 881F002E */ lbz r0, 0x2e(r31)
/* 00002F74 3C800000 */ lis r4, cameraInfo@ha
/* 00002F78 38840000 */ addi r4, r4, cameraInfo@l
/* 00002F7C 7C000774 */ extsb r0, r0
/* 00002F80 1C000284 */ mulli r0, r0, 0x284
/* 00002F84 7C840214 */ add r4, r4, r0
/* 00002F88 38000003 */ li r0, 3
/* 00002F8C 9804001F */ stb r0, 0x1f(r4)
/* 00002F90 38000000 */ li r0, 0
/* 00002F94 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002F98 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002F9C 981F0003 */ stb r0, 3(r31)
/* 00002FA0 3C600000 */ lis r3, lbl_1000008C@ha
/* 00002FA4 90040000 */ stw r0, 0(r4)
/* 00002FA8 38C30000 */ addi r6, r3, lbl_1000008C@l
/* 00002FAC 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002FB0 90060000 */ stw r0, 0(r6)
/* 00002FB4 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00002FB8 38000016 */ li r0, 0x16
/* 00002FBC B0050000 */ sth r0, 0(r5)
/* 00002FC0 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002FC4 3800FFFF */ li r0, -1
/* 00002FC8 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002FCC B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00002FD0 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002FD4 81830058 */ lwz r12, 0x58(r3)
/* 00002FD8 7D8803A6 */ mtlr r12
/* 00002FDC 4E800021 */ blrl 
/* 00002FE0 80010014 */ lwz r0, 0x14(r1)
/* 00002FE4 83E1000C */ lwz r31, 0xc(r1)
/* 00002FE8 38210010 */ addi r1, r1, 0x10
/* 00002FEC 7C0803A6 */ mtlr r0
/* 00002FF0 4E800020 */ blr 
lbl_00002FF4:
/* 00002FF4 7C0802A6 */ mflr r0
/* 00002FF8 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002FFC 90010004 */ stw r0, 4(r1)
/* 00003000 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00003004 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 00003008 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000300C 93E1000C */ stw r31, 0xc(r1)
/* 00003010 93C10008 */ stw r30, 8(r1)
/* 00003014 80640000 */ lwz r3, 0(r4)
/* 00003018 83C50000 */ lwz r30, currentBallStructPtr@l(r5)
/* 0000301C 38030001 */ addi r0, r3, 1
/* 00003020 90040000 */ stw r0, 0(r4)
/* 00003024 3C600000 */ lis r3, lbl_10000000@ha
/* 00003028 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 0000302C 80040000 */ lwz r0, 0(r4)
/* 00003030 2C00000F */ cmpwi r0, 0xf
/* 00003034 408200A8 */ bne lbl_000030DC
/* 00003038 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 0000303C 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00003040 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00003044 40820118 */ bne lbl_0000315C
/* 00003048 881E002E */ lbz r0, 0x2e(r30)
/* 0000304C 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 00003050 38A30000 */ addi r5, r3, lbl_802F1DF8@l
/* 00003054 7C000774 */ extsb r0, r0
/* 00003058 90050000 */ stw r0, 0(r5)
/* 0000305C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00003060 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00003064 80850000 */ lwz r4, 0(r5)
/* 00003068 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 0000306C 5484103A */ slwi r4, r4, 2
/* 00003070 7C802214 */ add r4, r0, r4
/* 00003074 80040000 */ lwz r0, 0(r4)
/* 00003078 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 0000307C 801F0074 */ lwz r0, 0x74(r31)
/* 00003080 2C0001F4 */ cmpwi r0, 0x1f4
/* 00003084 41800010 */ blt lbl_00003094
/* 00003088 3860012D */ li r3, 0x12d
/* 0000308C 4BFFD0C1 */ bl u_play_sound_0
/* 00003090 480000CC */ b lbl_0000315C
lbl_00003094:
/* 00003094 2C00012C */ cmpwi r0, 0x12c
/* 00003098 41800010 */ blt lbl_000030A8
/* 0000309C 38600130 */ li r3, 0x130
/* 000030A0 4BFFD0AD */ bl u_play_sound_0
/* 000030A4 480000B8 */ b lbl_0000315C
lbl_000030A8:
/* 000030A8 2C000064 */ cmpwi r0, 0x64
/* 000030AC 41800010 */ blt lbl_000030BC
/* 000030B0 3860012F */ li r3, 0x12f
/* 000030B4 4BFFD099 */ bl u_play_sound_0
/* 000030B8 480000A4 */ b lbl_0000315C
lbl_000030BC:
/* 000030BC 2C00000A */ cmpwi r0, 0xa
/* 000030C0 41800010 */ blt lbl_000030D0
/* 000030C4 3860012E */ li r3, 0x12e
/* 000030C8 4BFFD085 */ bl u_play_sound_0
/* 000030CC 48000090 */ b lbl_0000315C
lbl_000030D0:
/* 000030D0 3860012C */ li r3, 0x12c
/* 000030D4 4BFFD079 */ bl u_play_sound_0
/* 000030D8 48000084 */ b lbl_0000315C
lbl_000030DC:
/* 000030DC 2C00001E */ cmpwi r0, 0x1e
/* 000030E0 4082007C */ bne lbl_0000315C
/* 000030E4 801F0074 */ lwz r0, 0x74(r31)
/* 000030E8 2C00012C */ cmpwi r0, 0x12c
/* 000030EC 4180001C */ blt lbl_00003108
/* 000030F0 3860015F */ li r3, 0x15f
/* 000030F4 38800160 */ li r4, 0x160
/* 000030F8 4BFFD055 */ bl func_8002BFCC
/* 000030FC 380001FE */ li r0, 0x1fe
/* 00003100 901F0094 */ stw r0, 0x94(r31)
/* 00003104 48000058 */ b lbl_0000315C
lbl_00003108:
/* 00003108 2C000064 */ cmpwi r0, 0x64
/* 0000310C 4180001C */ blt lbl_00003128
/* 00003110 38600163 */ li r3, 0x163
/* 00003114 3880015C */ li r4, 0x15c
/* 00003118 4BFFD035 */ bl func_8002BFCC
/* 0000311C 3800010E */ li r0, 0x10e
/* 00003120 901F0094 */ stw r0, 0x94(r31)
/* 00003124 48000038 */ b lbl_0000315C
lbl_00003128:
/* 00003128 2C00000A */ cmpwi r0, 0xa
/* 0000312C 4180001C */ blt lbl_00003148
/* 00003130 3860015D */ li r3, 0x15d
/* 00003134 3880015E */ li r4, 0x15e
/* 00003138 4BFFD015 */ bl func_8002BFCC
/* 0000313C 380000F0 */ li r0, 0xf0
/* 00003140 901F0094 */ stw r0, 0x94(r31)
/* 00003144 48000018 */ b lbl_0000315C
lbl_00003148:
/* 00003148 3860016A */ li r3, 0x16a
/* 0000314C 3880016B */ li r4, 0x16b
/* 00003150 4BFFCFFD */ bl func_8002BFCC
/* 00003154 380000D2 */ li r0, 0xd2
/* 00003158 901F0094 */ stw r0, 0x94(r31)
lbl_0000315C:
/* 0000315C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003160 801F0094 */ lwz r0, 0x94(r31)
/* 00003164 38630000 */ addi r3, r3, lbl_802F1FF0@l
/* 00003168 80630000 */ lwz r3, 0(r3)
/* 0000316C 7C030000 */ cmpw r3, r0
/* 00003170 40820010 */ bne lbl_00003180
/* 00003174 38600064 */ li r3, 0x64
/* 00003178 38800008 */ li r4, 8
/* 0000317C 4BFFCFD1 */ bl u_play_music
lbl_00003180:
/* 00003180 3C600000 */ lis r3, modeCtrl@ha
/* 00003184 38630000 */ addi r3, r3, modeCtrl@l
/* 00003188 8083002C */ lwz r4, 0x2c(r3)
/* 0000318C 3C600000 */ lis r3, lbl_80285A58@ha
/* 00003190 38030000 */ addi r0, r3, lbl_80285A58@l
/* 00003194 5488103A */ slwi r8, r4, 2
/* 00003198 7CE04214 */ add r7, r0, r8
/* 0000319C 80C70000 */ lwz r6, 0(r7)
/* 000031A0 2C060000 */ cmpwi r6, 0
/* 000031A4 40820014 */ bne lbl_000031B8
/* 000031A8 807F008C */ lwz r3, 0x8c(r31)
/* 000031AC 38030001 */ addi r0, r3, 1
/* 000031B0 901F008C */ stw r0, 0x8c(r31)
/* 000031B4 4800005C */ b lbl_00003210
lbl_000031B8:
/* 000031B8 881E002E */ lbz r0, 0x2e(r30)
/* 000031BC 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000031C0 3CA00000 */ lis r5, controllerInfo@ha
/* 000031C4 7C000774 */ extsb r0, r0
/* 000031C8 5404103A */ slwi r4, r0, 2
/* 000031CC 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000031D0 7C602214 */ add r3, r0, r4
/* 000031D4 80030000 */ lwz r0, 0(r3)
/* 000031D8 38650000 */ addi r3, r5, controllerInfo@l
/* 000031DC 1C00003C */ mulli r0, r0, 0x3c
/* 000031E0 7C630214 */ add r3, r3, r0
/* 000031E4 A0030018 */ lhz r0, 0x18(r3)
/* 000031E8 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000031EC 41820024 */ beq lbl_00003210
/* 000031F0 7CBF4214 */ add r5, r31, r8
/* 000031F4 80850044 */ lwz r4, 0x44(r5)
/* 000031F8 38000000 */ li r0, 0
/* 000031FC 3C600000 */ lis r3, lbl_802F1FEC@ha
/* 00003200 7C843214 */ add r4, r4, r6
/* 00003204 90850044 */ stw r4, 0x44(r5)
/* 00003208 90070000 */ stw r0, 0(r7)
/* 0000320C B0030000 */ sth r0, lbl_802F1FEC@l(r3)
lbl_00003210:
/* 00003210 801F008C */ lwz r0, 0x8c(r31)
/* 00003214 2C000014 */ cmpwi r0, 0x14
/* 00003218 40810064 */ ble lbl_0000327C
/* 0000321C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003220 80C30000 */ lwz r6, lbl_802F1FF0@l(r3)
/* 00003224 2C060078 */ cmpwi r6, 0x78
/* 00003228 40810054 */ ble lbl_0000327C
/* 0000322C 881E002E */ lbz r0, 0x2e(r30)
/* 00003230 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00003234 3CA00000 */ lis r5, controllerInfo@ha
/* 00003238 7C000774 */ extsb r0, r0
/* 0000323C 5404103A */ slwi r4, r0, 2
/* 00003240 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00003244 7C602214 */ add r3, r0, r4
/* 00003248 80030000 */ lwz r0, 0(r3)
/* 0000324C 38650000 */ addi r3, r5, controllerInfo@l
/* 00003250 1C00003C */ mulli r0, r0, 0x3c
/* 00003254 7C630214 */ add r3, r3, r0
/* 00003258 A0030018 */ lhz r0, 0x18(r3)
/* 0000325C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00003260 4082000C */ bne lbl_0000326C
/* 00003264 2C0601E0 */ cmpwi r6, 0x1e0
/* 00003268 40810014 */ ble lbl_0000327C
lbl_0000326C:
/* 0000326C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00003270 38000000 */ li r0, 0
/* 00003274 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00003278 48000008 */ b lbl_00003280
lbl_0000327C:
/* 0000327C 48001799 */ bl lbl_00004A14
lbl_00003280:
/* 00003280 80010014 */ lwz r0, 0x14(r1)
/* 00003284 83E1000C */ lwz r31, 0xc(r1)
/* 00003288 83C10008 */ lwz r30, 8(r1)
/* 0000328C 7C0803A6 */ mtlr r0
/* 00003290 38210010 */ addi r1, r1, 0x10
/* 00003294 4E800020 */ blr 
lbl_00003298:
/* 00003298 7C0802A6 */ mflr r0
/* 0000329C 3C600000 */ lis r3, lbl_10000000@ha
/* 000032A0 90010004 */ stw r0, 4(r1)
/* 000032A4 9421FFE0 */ stwu r1, -0x20(r1)
/* 000032A8 93E1001C */ stw r31, 0x1c(r1)
/* 000032AC 93C10018 */ stw r30, 0x18(r1)
/* 000032B0 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000032B4 4BFFCE99 */ bl event_finish_all
/* 000032B8 38600001 */ li r3, 1
/* 000032BC 4BFFCE91 */ bl event_start
/* 000032C0 38600004 */ li r3, 4
/* 000032C4 4BFFCE89 */ bl event_start
/* 000032C8 3860000F */ li r3, 0xf
/* 000032CC 4BFFCE81 */ bl event_start
/* 000032D0 38600010 */ li r3, 0x10
/* 000032D4 4BFFCE79 */ bl event_start
/* 000032D8 38600012 */ li r3, 0x12
/* 000032DC 4BFFCE71 */ bl event_start
/* 000032E0 38600014 */ li r3, 0x14
/* 000032E4 4BFFCE69 */ bl event_start
/* 000032E8 38600013 */ li r3, 0x13
/* 000032EC 4BFFCE61 */ bl event_start
/* 000032F0 38600043 */ li r3, 0x43
/* 000032F4 4BFFCE59 */ bl camera_set_state
/* 000032F8 3C600000 */ lis r3, cameraInfo@ha
/* 000032FC 38630000 */ addi r3, r3, cameraInfo@l
/* 00003300 38000004 */ li r0, 4
/* 00003304 9803001F */ stb r0, 0x1f(r3)
/* 00003308 3BE00000 */ li r31, 0
/* 0000330C B3FE0018 */ sth r31, 0x18(r30)
/* 00003310 93FE0098 */ stw r31, 0x98(r30)
/* 00003314 93FE009C */ stw r31, 0x9c(r30)
/* 00003318 93FE00A0 */ stw r31, 0xa0(r30)
/* 0000331C 93FE00A4 */ stw r31, 0xa4(r30)
/* 00003320 4800737D */ bl lbl_0000A69C
/* 00003324 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003328 93E30000 */ stw r31, lbl_802F1FF0@l(r3)
/* 0000332C 3C600000 */ lis r3, lbl_0000C748@ha
/* 00003330 3CA00000 */ lis r5, lbl_802F1FF6@ha
/* 00003334 93FE008C */ stw r31, 0x8c(r30)
/* 00003338 38000018 */ li r0, 0x18
/* 0000333C 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00003340 B0050000 */ sth r0, lbl_802F1FF6@l(r5)
/* 00003344 3800FFFF */ li r0, -1
/* 00003348 38630000 */ addi r3, r3, lbl_0000C748@l
/* 0000334C B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00003350 81830060 */ lwz r12, 0x60(r3)
/* 00003354 7D8803A6 */ mtlr r12
/* 00003358 4E800021 */ blrl 
/* 0000335C 80010024 */ lwz r0, 0x24(r1)
/* 00003360 83E1001C */ lwz r31, 0x1c(r1)
/* 00003364 83C10018 */ lwz r30, 0x18(r1)
/* 00003368 7C0803A6 */ mtlr r0
/* 0000336C 38210020 */ addi r1, r1, 0x20
/* 00003370 4E800020 */ blr 
lbl_00003374:
/* 00003374 7C0802A6 */ mflr r0
/* 00003378 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 0000337C 90010004 */ stw r0, 4(r1)
/* 00003380 3C800000 */ lis r4, lbl_10000000@ha
/* 00003384 9421FFE0 */ stwu r1, -0x20(r1)
/* 00003388 93E1001C */ stw r31, 0x1c(r1)
/* 0000338C 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00003390 93C10018 */ stw r30, 0x18(r1)
/* 00003394 3BC30000 */ addi r30, r3, lbl_802F1FF0@l
/* 00003398 807E0000 */ lwz r3, 0(r30)
/* 0000339C 38030001 */ addi r0, r3, 1
/* 000033A0 901E0000 */ stw r0, 0(r30)
/* 000033A4 48003971 */ bl lbl_00006D14
/* 000033A8 2C030000 */ cmpwi r3, 0
/* 000033AC 41820030 */ beq lbl_000033DC
/* 000033B0 801E0000 */ lwz r0, 0(r30)
/* 000033B4 2C000032 */ cmpwi r0, 0x32
/* 000033B8 40810024 */ ble lbl_000033DC
/* 000033BC 801F0044 */ lwz r0, 0x44(r31)
/* 000033C0 901F0098 */ stw r0, 0x98(r31)
/* 000033C4 801F0048 */ lwz r0, 0x48(r31)
/* 000033C8 901F009C */ stw r0, 0x9c(r31)
/* 000033CC 801F004C */ lwz r0, 0x4c(r31)
/* 000033D0 901F00A0 */ stw r0, 0xa0(r31)
/* 000033D4 801F0050 */ lwz r0, 0x50(r31)
/* 000033D8 901F00A4 */ stw r0, 0xa4(r31)
lbl_000033DC:
/* 000033DC 3C600000 */ lis r3, g_poolInfo@ha
/* 000033E0 38630000 */ addi r3, r3, g_poolInfo@l
/* 000033E4 8083000C */ lwz r4, 0xc(r3)
/* 000033E8 38BF0044 */ addi r5, r31, 0x44
/* 000033EC 38DF0098 */ addi r6, r31, 0x98
/* 000033F0 88040000 */ lbz r0, 0(r4)
/* 000033F4 38E00000 */ li r7, 0
/* 000033F8 7C000775 */ extsb. r0, r0
/* 000033FC 41820014 */ beq lbl_00003410
/* 00003400 80660000 */ lwz r3, 0(r6)
/* 00003404 80050000 */ lwz r0, 0(r5)
/* 00003408 7C030000 */ cmpw r3, r0
/* 0000340C 40820080 */ bne lbl_0000348C
lbl_00003410:
/* 00003410 8C040001 */ lbzu r0, 1(r4)
/* 00003414 38E00001 */ li r7, 1
/* 00003418 38A50004 */ addi r5, r5, 4
/* 0000341C 7C000775 */ extsb. r0, r0
/* 00003420 38C60004 */ addi r6, r6, 4
/* 00003424 41820014 */ beq lbl_00003438
/* 00003428 80660000 */ lwz r3, 0(r6)
/* 0000342C 80050000 */ lwz r0, 0(r5)
/* 00003430 7C030000 */ cmpw r3, r0
/* 00003434 40820058 */ bne lbl_0000348C
lbl_00003438:
/* 00003438 8C040001 */ lbzu r0, 1(r4)
/* 0000343C 38E00002 */ li r7, 2
/* 00003440 38A50004 */ addi r5, r5, 4
/* 00003444 7C000775 */ extsb. r0, r0
/* 00003448 38C60004 */ addi r6, r6, 4
/* 0000344C 41820014 */ beq lbl_00003460
/* 00003450 80660000 */ lwz r3, 0(r6)
/* 00003454 80050000 */ lwz r0, 0(r5)
/* 00003458 7C030000 */ cmpw r3, r0
/* 0000345C 40820030 */ bne lbl_0000348C
lbl_00003460:
/* 00003460 88040001 */ lbz r0, 1(r4)
/* 00003464 38E00003 */ li r7, 3
/* 00003468 38A50004 */ addi r5, r5, 4
/* 0000346C 7C000775 */ extsb. r0, r0
/* 00003470 38C60004 */ addi r6, r6, 4
/* 00003474 41820014 */ beq lbl_00003488
/* 00003478 80660000 */ lwz r3, 0(r6)
/* 0000347C 80050000 */ lwz r0, 0(r5)
/* 00003480 7C030000 */ cmpw r3, r0
/* 00003484 40820008 */ bne lbl_0000348C
lbl_00003488:
/* 00003488 38E00004 */ li r7, 4
lbl_0000348C:
/* 0000348C 2C070004 */ cmpwi r7, 4
/* 00003490 40820010 */ bne lbl_000034A0
/* 00003494 807F008C */ lwz r3, 0x8c(r31)
/* 00003498 38030001 */ addi r0, r3, 1
/* 0000349C 901F008C */ stw r0, 0x8c(r31)
lbl_000034A0:
/* 000034A0 48003875 */ bl lbl_00006D14
/* 000034A4 2C030000 */ cmpwi r3, 0
/* 000034A8 41820010 */ beq lbl_000034B8
/* 000034AC 801F008C */ lwz r0, 0x8c(r31)
/* 000034B0 2C000014 */ cmpwi r0, 0x14
/* 000034B4 41810014 */ bgt lbl_000034C8
lbl_000034B8:
/* 000034B8 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000034BC 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 000034C0 2C0002D0 */ cmpwi r0, 0x2d0
/* 000034C4 408100DC */ ble lbl_000035A0
lbl_000034C8:
/* 000034C8 3800FFFF */ li r0, -1
/* 000034CC 3C600000 */ lis r3, modeCtrl@ha
/* 000034D0 981F0034 */ stb r0, 0x34(r31)
/* 000034D4 38630000 */ addi r3, r3, modeCtrl@l
/* 000034D8 80030024 */ lwz r0, 0x24(r3)
/* 000034DC 2C000001 */ cmpwi r0, 1
/* 000034E0 408200A0 */ bne lbl_00003580
/* 000034E4 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000034E8 38630000 */ addi r3, r3, lbl_802F1FD0@l
/* 000034EC 80630000 */ lwz r3, 0(r3)
/* 000034F0 38A00000 */ li r5, 0
/* 000034F4 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 000034F8 41820008 */ beq lbl_00003500
/* 000034FC 60A50001 */ ori r5, r5, 1
lbl_00003500:
/* 00003500 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00003504 41820008 */ beq lbl_0000350C
/* 00003508 60A50002 */ ori r5, r5, 2
lbl_0000350C:
/* 0000350C A81F0064 */ lha r0, 0x64(r31)
/* 00003510 2C00000A */ cmpwi r0, 0xa
/* 00003514 4182001C */ beq lbl_00003530
/* 00003518 40800020 */ bge lbl_00003538
/* 0000351C 2C000005 */ cmpwi r0, 5
/* 00003520 41820008 */ beq lbl_00003528
/* 00003524 48000014 */ b lbl_00003538
lbl_00003528:
/* 00003528 38600006 */ li r3, 6
/* 0000352C 48000010 */ b lbl_0000353C
lbl_00003530:
/* 00003530 38600007 */ li r3, 7
/* 00003534 48000008 */ b lbl_0000353C
lbl_00003538:
/* 00003538 38600008 */ li r3, 8
lbl_0000353C:
/* 0000353C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00003540 80040000 */ lwz r0, playerCharacterSelection@l(r4)
/* 00003544 38810010 */ addi r4, r1, 0x10
/* 00003548 98010013 */ stb r0, 0x13(r1)
/* 0000354C 801F0044 */ lwz r0, 0x44(r31)
/* 00003550 B0010014 */ sth r0, 0x14(r1)
/* 00003554 98A10016 */ stb r5, 0x16(r1)
/* 00003558 4BFFCBF5 */ bl func_800AC5E0
/* 0000355C 7C600774 */ extsb r0, r3
/* 00003560 981F0034 */ stb r0, 0x34(r31)
/* 00003564 881F0034 */ lbz r0, 0x34(r31)
/* 00003568 7C000775 */ extsb. r0, r0
/* 0000356C 40800014 */ bge lbl_00003580
/* 00003570 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00003574 3800001B */ li r0, 0x1b
/* 00003578 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 0000357C 48000024 */ b lbl_000035A0
lbl_00003580:
/* 00003580 3C600000 */ lis r3, pauseMenuState@ha
/* 00003584 38830000 */ addi r4, r3, pauseMenuState@l
/* 00003588 80040004 */ lwz r0, 4(r4)
/* 0000358C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00003590 60000002 */ ori r0, r0, 2
/* 00003594 90040004 */ stw r0, 4(r4)
/* 00003598 38000019 */ li r0, 0x19
/* 0000359C B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_000035A0:
/* 000035A0 80010024 */ lwz r0, 0x24(r1)
/* 000035A4 83E1001C */ lwz r31, 0x1c(r1)
/* 000035A8 83C10018 */ lwz r30, 0x18(r1)
/* 000035AC 7C0803A6 */ mtlr r0
/* 000035B0 38210020 */ addi r1, r1, 0x20
/* 000035B4 4E800020 */ blr 
lbl_000035B8:
/* 000035B8 7C0802A6 */ mflr r0
/* 000035BC 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000035C0 90010004 */ stw r0, 4(r1)
/* 000035C4 9421FFE0 */ stwu r1, -0x20(r1)
/* 000035C8 93E1001C */ stw r31, 0x1c(r1)
/* 000035CC 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 000035D0 93C10018 */ stw r30, 0x18(r1)
/* 000035D4 93A10014 */ stw r29, 0x14(r1)
/* 000035D8 4BFFCB75 */ bl u_free_minigame_graphics
/* 000035DC 3C600000 */ lis r3, lbl_802F1FD4@ha
/* 000035E0 38000000 */ li r0, 0
/* 000035E4 90030000 */ stw r0, lbl_802F1FD4@l(r3)
/* 000035E8 4BFFCB65 */ bl event_finish_all
/* 000035EC 38600001 */ li r3, 1
/* 000035F0 4BFFCB5D */ bl event_start
/* 000035F4 38600004 */ li r3, 4
/* 000035F8 4BFFCB55 */ bl event_start
/* 000035FC 38600014 */ li r3, 0x14
/* 00003600 4BFFCB4D */ bl event_start
/* 00003604 38600013 */ li r3, 0x13
/* 00003608 4BFFCB45 */ bl event_start
/* 0000360C 38600012 */ li r3, 0x12
/* 00003610 4BFFCB3D */ bl event_start
/* 00003614 3860000F */ li r3, 0xf
/* 00003618 4BFFCB35 */ bl event_start
/* 0000361C 3860000D */ li r3, 0xd
/* 00003620 4BFFCB2D */ bl event_start
/* 00003624 38600010 */ li r3, 0x10
/* 00003628 4BFFCB25 */ bl event_start
/* 0000362C 3C600000 */ lis r3, modeCtrl@ha
/* 00003630 38630000 */ addi r3, r3, modeCtrl@l
/* 00003634 80030024 */ lwz r0, 0x24(r3)
/* 00003638 2C000001 */ cmpwi r0, 1
/* 0000363C 40820034 */ bne lbl_00003670
/* 00003640 3C600000 */ lis r3, playerCharacterSelection@ha
/* 00003644 80830000 */ lwz r4, playerCharacterSelection@l(r3)
/* 00003648 3800FFFF */ li r0, -1
/* 0000364C 3C600000 */ lis r3, lbl_10000034@ha
/* 00003650 7C840774 */ extsb r4, r4
/* 00003654 9881000C */ stb r4, 0xc(r1)
/* 00003658 9801000D */ stb r0, 0xd(r1)
/* 0000365C 9801000E */ stb r0, 0xe(r1)
/* 00003660 9801000F */ stb r0, 0xf(r1)
/* 00003664 88030000 */ lbz r0, lbl_10000034@l(r3)
/* 00003668 98010008 */ stb r0, 8(r1)
/* 0000366C 48000144 */ b lbl_000037B0
lbl_00003670:
/* 00003670 3C600000 */ lis r3, g_poolInfo@ha
/* 00003674 38830000 */ addi r4, r3, g_poolInfo@l
/* 00003678 3C600000 */ lis r3, lbl_10000044@ha
/* 0000367C 8164000C */ lwz r11, 0xc(r4)
/* 00003680 39830000 */ addi r12, r3, lbl_10000044@l
/* 00003684 38000004 */ li r0, 4
/* 00003688 3C600000 */ lis r3, playerCharacterSelection@ha
/* 0000368C 7C0903A6 */ mtctr r0
/* 00003690 39230000 */ addi r9, r3, playerCharacterSelection@l
/* 00003694 38CB0000 */ addi r6, r11, 0
/* 00003698 390C0000 */ addi r8, r12, 0
/* 0000369C 38E1000C */ addi r7, r1, 0xc
/* 000036A0 39410008 */ addi r10, r1, 8
/* 000036A4 3BC00000 */ li r30, 0
lbl_000036A8:
/* 000036A8 88060000 */ lbz r0, 0(r6)
/* 000036AC 7C000775 */ extsb. r0, r0
/* 000036B0 40820010 */ bne lbl_000036C0
/* 000036B4 3800FFFF */ li r0, -1
/* 000036B8 98070000 */ stb r0, 0(r7)
/* 000036BC 480000D8 */ b lbl_00003794
lbl_000036C0:
/* 000036C0 38000000 */ li r0, 0
/* 000036C4 80A80000 */ lwz r5, 0(r8)
/* 000036C8 7C1E0000 */ cmpw r30, r0
/* 000036CC 3BA00000 */ li r29, 0
/* 000036D0 41820020 */ beq lbl_000036F0
/* 000036D4 880B0000 */ lbz r0, 0(r11)
/* 000036D8 7C000775 */ extsb. r0, r0
/* 000036DC 41820014 */ beq lbl_000036F0
/* 000036E0 800C0000 */ lwz r0, 0(r12)
/* 000036E4 7C002800 */ cmpw r0, r5
/* 000036E8 40810008 */ ble lbl_000036F0
/* 000036EC 3BA00001 */ li r29, 1
lbl_000036F0:
/* 000036F0 38000001 */ li r0, 1
/* 000036F4 7C1E0000 */ cmpw r30, r0
/* 000036F8 386B0001 */ addi r3, r11, 1
/* 000036FC 388C0004 */ addi r4, r12, 4
/* 00003700 41820020 */ beq lbl_00003720
/* 00003704 88030000 */ lbz r0, 0(r3)
/* 00003708 7C000775 */ extsb. r0, r0
/* 0000370C 41820014 */ beq lbl_00003720
/* 00003710 80040000 */ lwz r0, 0(r4)
/* 00003714 7C002800 */ cmpw r0, r5
/* 00003718 40810008 */ ble lbl_00003720
/* 0000371C 3BBD0001 */ addi r29, r29, 1
lbl_00003720:
/* 00003720 38000002 */ li r0, 2
/* 00003724 7C1E0000 */ cmpw r30, r0
/* 00003728 38630001 */ addi r3, r3, 1
/* 0000372C 38840004 */ addi r4, r4, 4
/* 00003730 41820020 */ beq lbl_00003750
/* 00003734 88030000 */ lbz r0, 0(r3)
/* 00003738 7C000775 */ extsb. r0, r0
/* 0000373C 41820014 */ beq lbl_00003750
/* 00003740 80040000 */ lwz r0, 0(r4)
/* 00003744 7C002800 */ cmpw r0, r5
/* 00003748 40810008 */ ble lbl_00003750
/* 0000374C 3BBD0001 */ addi r29, r29, 1
lbl_00003750:
/* 00003750 38000003 */ li r0, 3
/* 00003754 7C1E0000 */ cmpw r30, r0
/* 00003758 38630001 */ addi r3, r3, 1
/* 0000375C 38840004 */ addi r4, r4, 4
/* 00003760 41820020 */ beq lbl_00003780
/* 00003764 88030000 */ lbz r0, 0(r3)
/* 00003768 7C000775 */ extsb. r0, r0
/* 0000376C 41820014 */ beq lbl_00003780
/* 00003770 80040000 */ lwz r0, 0(r4)
/* 00003774 7C002800 */ cmpw r0, r5
/* 00003778 40810008 */ ble lbl_00003780
/* 0000377C 3BBD0001 */ addi r29, r29, 1
lbl_00003780:
/* 00003780 80690000 */ lwz r3, 0(r9)
/* 00003784 7FA00774 */ extsb r0, r29
/* 00003788 7C630774 */ extsb r3, r3
/* 0000378C 98670000 */ stb r3, 0(r7)
/* 00003790 980A0000 */ stb r0, 0(r10)
lbl_00003794:
/* 00003794 38C60001 */ addi r6, r6, 1
/* 00003798 38E70001 */ addi r7, r7, 1
/* 0000379C 39080004 */ addi r8, r8, 4
/* 000037A0 39290004 */ addi r9, r9, 4
/* 000037A4 394A0001 */ addi r10, r10, 1
/* 000037A8 3BDE0001 */ addi r30, r30, 1
/* 000037AC 4200FEFC */ bdnz lbl_000036A8
lbl_000037B0:
/* 000037B0 3861000C */ addi r3, r1, 0xc
/* 000037B4 38810008 */ addi r4, r1, 8
/* 000037B8 4BFFC995 */ bl func_8009C5E4
/* 000037BC 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000037C0 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 000037C4 80040000 */ lwz r0, 0(r4)
/* 000037C8 38600046 */ li r3, 0x46
/* 000037CC 60000004 */ ori r0, r0, 4
/* 000037D0 90040000 */ stw r0, 0(r4)
/* 000037D4 4BFFC979 */ bl camera_set_state
/* 000037D8 C03F0030 */ lfs f1, 0x30(r31)
/* 000037DC C05F01B8 */ lfs f2, 0x1b8(r31)
/* 000037E0 C07F01BC */ lfs f3, 0x1bc(r31)
/* 000037E4 4BFFC969 */ bl mathutil_mtxA_from_translate_xyz
/* 000037E8 3C600001 */ lis r3, 1
/* 000037EC 38638000 */ addi r3, r3, -32768  ;# fixed addi
/* 000037F0 4BFFC95D */ bl mathutil_mtxA_rotate_y
/* 000037F4 3C600000 */ lis r3, mathutilData@ha
/* 000037F8 38630000 */ addi r3, r3, mathutilData@l
/* 000037FC 80630000 */ lwz r3, 0(r3)
/* 00003800 4BFFC94D */ bl func_8009DB40
/* 00003804 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003808 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 0000380C 38000000 */ li r0, 0
/* 00003810 90040000 */ stw r0, 0(r4)
/* 00003814 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00003818 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 0000381C 3800001A */ li r0, 0x1a
/* 00003820 B0050000 */ sth r0, 0(r5)
/* 00003824 3C600000 */ lis r3, lbl_0000C748@ha
/* 00003828 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 0000382C 3800FFFF */ li r0, -1
/* 00003830 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00003834 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00003838 81830068 */ lwz r12, 0x68(r3)
/* 0000383C 7D8803A6 */ mtlr r12
/* 00003840 4E800021 */ blrl 
/* 00003844 80010024 */ lwz r0, 0x24(r1)
/* 00003848 83E1001C */ lwz r31, 0x1c(r1)
/* 0000384C 83C10018 */ lwz r30, 0x18(r1)
/* 00003850 7C0803A6 */ mtlr r0
/* 00003854 83A10014 */ lwz r29, 0x14(r1)
/* 00003858 38210020 */ addi r1, r1, 0x20
/* 0000385C 4E800020 */ blr 
lbl_00003860:
/* 00003860 7C0802A6 */ mflr r0
/* 00003864 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003868 90010004 */ stw r0, 4(r1)
/* 0000386C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00003870 93E1000C */ stw r31, 0xc(r1)
/* 00003874 3BE30000 */ addi r31, r3, lbl_802F1FF0@l
/* 00003878 807F0000 */ lwz r3, 0(r31)
/* 0000387C 38030001 */ addi r0, r3, 1
/* 00003880 901F0000 */ stw r0, 0(r31)
/* 00003884 801F0000 */ lwz r0, 0(r31)
/* 00003888 2C00003C */ cmpwi r0, 0x3c
/* 0000388C 41800034 */ blt lbl_000038C0
/* 00003890 4BFFC8BD */ bl func_8009D794
/* 00003894 2C030000 */ cmpwi r3, 0
/* 00003898 41820028 */ beq lbl_000038C0
/* 0000389C 48003479 */ bl lbl_00006D14
/* 000038A0 2C030000 */ cmpwi r3, 0
/* 000038A4 40820010 */ bne lbl_000038B4
/* 000038A8 801F0000 */ lwz r0, 0(r31)
/* 000038AC 2C000708 */ cmpwi r0, 0x708
/* 000038B0 40810010 */ ble lbl_000038C0
lbl_000038B4:
/* 000038B4 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000038B8 3800001B */ li r0, 0x1b
/* 000038BC B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_000038C0:
/* 000038C0 80010014 */ lwz r0, 0x14(r1)
/* 000038C4 83E1000C */ lwz r31, 0xc(r1)
/* 000038C8 38210010 */ addi r1, r1, 0x10
/* 000038CC 7C0803A6 */ mtlr r0
/* 000038D0 4E800020 */ blr 
lbl_000038D4:
/* 000038D4 7C0802A6 */ mflr r0
/* 000038D8 90010004 */ stw r0, 4(r1)
/* 000038DC 9421FFC8 */ stwu r1, -0x38(r1)
/* 000038E0 93E10034 */ stw r31, 0x34(r1)
/* 000038E4 3BE00000 */ li r31, 0
/* 000038E8 93C10030 */ stw r30, 0x30(r1)
/* 000038EC 4BFFC861 */ bl u_free_minigame_graphics
/* 000038F0 3C600000 */ lis r3, lbl_802F1FD4@ha
/* 000038F4 38000000 */ li r0, 0
/* 000038F8 90030000 */ stw r0, lbl_802F1FD4@l(r3)
/* 000038FC 4BFFC851 */ bl func_8009CC34
/* 00003900 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00003904 3BC30000 */ addi r30, r3, lbl_802F1FD0@l
/* 00003908 801E0000 */ lwz r0, 0(r30)
/* 0000390C 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00003910 901E0000 */ stw r0, 0(r30)
/* 00003914 4BFFC839 */ bl event_finish_all
/* 00003918 38600010 */ li r3, 0x10
/* 0000391C 4BFFC831 */ bl event_start
/* 00003920 38600012 */ li r3, 0x12
/* 00003924 4BFFC829 */ bl event_start
/* 00003928 807E0000 */ lwz r3, 0(r30)
/* 0000392C 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00003930 41820008 */ beq lbl_00003938
/* 00003934 63FF0001 */ ori r31, r31, 1
lbl_00003938:
/* 00003938 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 0000393C 41820008 */ beq lbl_00003944
/* 00003940 63FF0002 */ ori r31, r31, 2
lbl_00003944:
/* 00003944 3C600000 */ lis r3, lbl_10000064@ha
/* 00003948 A8030000 */ lha r0, lbl_10000064@l(r3)
/* 0000394C 2C00000A */ cmpwi r0, 0xa
/* 00003950 4182001C */ beq lbl_0000396C
/* 00003954 40800020 */ bge lbl_00003974
/* 00003958 2C000005 */ cmpwi r0, 5
/* 0000395C 41820008 */ beq lbl_00003964
/* 00003960 48000014 */ b lbl_00003974
lbl_00003964:
/* 00003964 3BC00006 */ li r30, 6
/* 00003968 48000010 */ b lbl_00003978
lbl_0000396C:
/* 0000396C 3BC00007 */ li r30, 7
/* 00003970 48000008 */ b lbl_00003978
lbl_00003974:
/* 00003974 3BC00008 */ li r30, 8
lbl_00003978:
/* 00003978 3C600000 */ lis r3, g_poolInfo@ha
/* 0000397C 38630000 */ addi r3, r3, g_poolInfo@l
/* 00003980 80A3000C */ lwz r5, 0xc(r3)
/* 00003984 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00003988 3C600000 */ lis r3, lbl_10000044@ha
/* 0000398C 88050000 */ lbz r0, 0(r5)
/* 00003990 38840000 */ addi r4, r4, playerCharacterSelection@l
/* 00003994 38C10008 */ addi r6, r1, 8
/* 00003998 7C000775 */ extsb. r0, r0
/* 0000399C 38630000 */ addi r3, r3, lbl_10000044@l
/* 000039A0 4182009C */ beq lbl_00003A3C
/* 000039A4 80040000 */ lwz r0, 0(r4)
/* 000039A8 38840004 */ addi r4, r4, 4
/* 000039AC 38E30004 */ addi r7, r3, 4
/* 000039B0 9801000B */ stb r0, 0xb(r1)
/* 000039B4 38C60008 */ addi r6, r6, 8
/* 000039B8 80030000 */ lwz r0, 0(r3)
/* 000039BC B001000C */ sth r0, 0xc(r1)
/* 000039C0 9BE1000E */ stb r31, 0xe(r1)
/* 000039C4 8C050001 */ lbzu r0, 1(r5)
/* 000039C8 7C000775 */ extsb. r0, r0
/* 000039CC 41820070 */ beq lbl_00003A3C
/* 000039D0 80040000 */ lwz r0, 0(r4)
/* 000039D4 38840004 */ addi r4, r4, 4
/* 000039D8 98060003 */ stb r0, 3(r6)
/* 000039DC 80070000 */ lwz r0, 0(r7)
/* 000039E0 38E70004 */ addi r7, r7, 4
/* 000039E4 B0060004 */ sth r0, 4(r6)
/* 000039E8 9BE60006 */ stb r31, 6(r6)
/* 000039EC 38C60008 */ addi r6, r6, 8
/* 000039F0 8C050001 */ lbzu r0, 1(r5)
/* 000039F4 7C000775 */ extsb. r0, r0
/* 000039F8 41820044 */ beq lbl_00003A3C
/* 000039FC 80040000 */ lwz r0, 0(r4)
/* 00003A00 38840004 */ addi r4, r4, 4
/* 00003A04 98060003 */ stb r0, 3(r6)
/* 00003A08 80070000 */ lwz r0, 0(r7)
/* 00003A0C 38E70004 */ addi r7, r7, 4
/* 00003A10 B0060004 */ sth r0, 4(r6)
/* 00003A14 9BE60006 */ stb r31, 6(r6)
/* 00003A18 38C60008 */ addi r6, r6, 8
/* 00003A1C 88050001 */ lbz r0, 1(r5)
/* 00003A20 7C000775 */ extsb. r0, r0
/* 00003A24 41820018 */ beq lbl_00003A3C
/* 00003A28 80040000 */ lwz r0, 0(r4)
/* 00003A2C 98060003 */ stb r0, 3(r6)
/* 00003A30 80070000 */ lwz r0, 0(r7)
/* 00003A34 B0060004 */ sth r0, 4(r6)
/* 00003A38 9BE60006 */ stb r31, 6(r6)
lbl_00003A3C:
/* 00003A3C 3C600000 */ lis r3, modeCtrl@ha
/* 00003A40 38630000 */ addi r3, r3, modeCtrl@l
/* 00003A44 80A30024 */ lwz r5, 0x24(r3)
/* 00003A48 387E0000 */ addi r3, r30, 0
/* 00003A4C 38810008 */ addi r4, r1, 8
/* 00003A50 4BFFC6FD */ bl func_800AC43C
/* 00003A54 2C030000 */ cmpwi r3, 0
/* 00003A58 41820014 */ beq lbl_00003A6C
/* 00003A5C 387E0000 */ addi r3, r30, 0
/* 00003A60 38800001 */ li r4, 1
/* 00003A64 4BFFC6E9 */ bl func_800AB2A0
/* 00003A68 48000010 */ b lbl_00003A78
lbl_00003A6C:
/* 00003A6C 387E0000 */ addi r3, r30, 0
/* 00003A70 38800000 */ li r4, 0
/* 00003A74 4BFFC6D9 */ bl func_800AB2A0
lbl_00003A78:
/* 00003A78 3C600000 */ lis r3, modeCtrl@ha
/* 00003A7C 38830000 */ addi r4, r3, modeCtrl@l
/* 00003A80 38000000 */ li r0, 0
/* 00003A84 90040000 */ stw r0, 0(r4)
/* 00003A88 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00003A8C 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00003A90 3800001C */ li r0, 0x1c
/* 00003A94 B0050000 */ sth r0, 0(r5)
/* 00003A98 3C600000 */ lis r3, lbl_0000C748@ha
/* 00003A9C 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00003AA0 3800FFFF */ li r0, -1
/* 00003AA4 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00003AA8 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00003AAC 81830070 */ lwz r12, 0x70(r3)
/* 00003AB0 7D8803A6 */ mtlr r12
/* 00003AB4 4E800021 */ blrl 
/* 00003AB8 8001003C */ lwz r0, 0x3c(r1)
/* 00003ABC 83E10034 */ lwz r31, 0x34(r1)
/* 00003AC0 83C10030 */ lwz r30, 0x30(r1)
/* 00003AC4 7C0803A6 */ mtlr r0
/* 00003AC8 38210038 */ addi r1, r1, 0x38
/* 00003ACC 4E800020 */ blr 
lbl_00003AD0:
/* 00003AD0 7C0802A6 */ mflr r0
/* 00003AD4 3C600000 */ lis r3, modeCtrl@ha
/* 00003AD8 90010004 */ stw r0, 4(r1)
/* 00003ADC 9421FFF0 */ stwu r1, -0x10(r1)
/* 00003AE0 93E1000C */ stw r31, 0xc(r1)
/* 00003AE4 3BE30000 */ addi r31, r3, modeCtrl@l
/* 00003AE8 807F0000 */ lwz r3, 0(r31)
/* 00003AEC 2C030000 */ cmpwi r3, 0
/* 00003AF0 40820050 */ bne lbl_00003B40
/* 00003AF4 48003221 */ bl lbl_00006D14
/* 00003AF8 2C030000 */ cmpwi r3, 0
/* 00003AFC 4182005C */ beq lbl_00003B58
/* 00003B00 4BFFC64D */ bl func_800AB6F8
/* 00003B04 2C030000 */ cmpwi r3, 0
/* 00003B08 40820050 */ bne lbl_00003B58
/* 00003B0C 386000D1 */ li r3, 0xd1
/* 00003B10 4BFFC63D */ bl u_play_sound_0
/* 00003B14 3800003C */ li r0, 0x3c
/* 00003B18 3C600100 */ lis r3, 0x100
/* 00003B1C 901F0000 */ stw r0, 0(r31)
/* 00003B20 3883FFFF */ addi r4, r3, -1  ;# fixed addi
/* 00003B24 38600101 */ li r3, 0x101
/* 00003B28 38A0003C */ li r5, 0x3c
/* 00003B2C 4BFFC621 */ bl start_screen_fade
/* 00003B30 3860003C */ li r3, 0x3c
/* 00003B34 38800002 */ li r4, 2
/* 00003B38 4BFFC615 */ bl u_play_music
/* 00003B3C 4800001C */ b lbl_00003B58
lbl_00003B40:
/* 00003B40 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00003B44 901F0000 */ stw r0, 0(r31)
/* 00003B48 40820010 */ bne lbl_00003B58
/* 00003B4C 4BFFC601 */ bl func_800AB444
/* 00003B50 807F0028 */ lwz r3, 0x28(r31)
/* 00003B54 4BFFC5F9 */ bl func_80012434
lbl_00003B58:
/* 00003B58 80010014 */ lwz r0, 0x14(r1)
/* 00003B5C 83E1000C */ lwz r31, 0xc(r1)
/* 00003B60 38210010 */ addi r1, r1, 0x10
/* 00003B64 7C0803A6 */ mtlr r0
/* 00003B68 4E800020 */ blr 
lbl_00003B6C:
/* 00003B6C 7C0802A6 */ mflr r0
/* 00003B70 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00003B74 90010004 */ stw r0, 4(r1)
/* 00003B78 9421FFF8 */ stwu r1, -8(r1)
/* 00003B7C A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00003B80 2C00001B */ cmpwi r0, 0x1b
/* 00003B84 41820020 */ beq lbl_00003BA4
/* 00003B88 40800010 */ bge lbl_00003B98
/* 00003B8C 2C00001A */ cmpwi r0, 0x1a
/* 00003B90 4080001C */ bge lbl_00003BAC
/* 00003B94 48000010 */ b lbl_00003BA4
lbl_00003B98:
/* 00003B98 2C00001D */ cmpwi r0, 0x1d
/* 00003B9C 40800008 */ bge lbl_00003BA4
/* 00003BA0 4800002C */ b lbl_00003BCC
lbl_00003BA4:
/* 00003BA4 48000039 */ bl lbl_00003BDC
/* 00003BA8 48000024 */ b lbl_00003BCC
lbl_00003BAC:
/* 00003BAC 48000031 */ bl lbl_00003BDC
/* 00003BB0 4BFFC59D */ bl func_8009CD5C
/* 00003BB4 3C600000 */ lis r3, eventInfo@ha
/* 00003BB8 38630000 */ addi r3, r3, eventInfo@l
/* 00003BBC 88030138 */ lbz r0, 0x138(r3)
/* 00003BC0 2C000002 */ cmpwi r0, 2
/* 00003BC4 40820008 */ bne lbl_00003BCC
/* 00003BC8 4BFFC585 */ bl effect_draw
lbl_00003BCC:
/* 00003BCC 8001000C */ lwz r0, 0xc(r1)
/* 00003BD0 38210008 */ addi r1, r1, 8
/* 00003BD4 7C0803A6 */ mtlr r0
/* 00003BD8 4E800020 */ blr 
lbl_00003BDC:
/* 00003BDC 7C0802A6 */ mflr r0
/* 00003BE0 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00003BE4 90010004 */ stw r0, 4(r1)
/* 00003BE8 3C800000 */ lis r4, lbl_1000003C@ha
/* 00003BEC 3CC00000 */ lis r6, lbl_10000038@ha
/* 00003BF0 9421FF68 */ stwu r1, -0x98(r1)
/* 00003BF4 3D400000 */ lis r10, ballInfo@ha
/* 00003BF8 3D200000 */ lis r9, eventInfo@ha
/* 00003BFC BDE10054 */ stmw r15, 0x54(r1)
/* 00003C00 3AA30000 */ addi r21, r3, currentBallStructPtr@l
/* 00003C04 3DE00000 */ lis r15, lbl_0000BE80@ha
/* 00003C08 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00003C0C 3D000000 */ lis r8, currentCameraStructPtr@ha
/* 00003C10 3CE00000 */ lis r7, lbl_802F1FF6@ha
/* 00003C14 3CA00000 */ lis r5, backgroundInfo@ha
/* 00003C18 3D800000 */ lis r12, cameraInfo@ha
/* 00003C1C 3D600000 */ lis r11, g_poolInfo@ha
/* 00003C20 3A8F0000 */ addi r20, r15, lbl_0000BE80@l
/* 00003C24 3BC40000 */ addi r30, r4, lbl_1000003C@l
/* 00003C28 3A610018 */ addi r19, r1, 0x18
/* 00003C2C 3BE30000 */ addi r31, r3, unpausedFrameCounter@l
/* 00003C30 3B860000 */ addi r28, r6, lbl_10000038@l
/* 00003C34 3B0A0000 */ addi r24, r10, ballInfo@l
/* 00003C38 3B290000 */ addi r25, r9, eventInfo@l
/* 00003C3C 3B480000 */ addi r26, r8, currentCameraStructPtr@l
/* 00003C40 3B670000 */ addi r27, r7, lbl_802F1FF6@l
/* 00003C44 3BA50000 */ addi r29, r5, backgroundInfo@l
/* 00003C48 3ACC0000 */ addi r22, r12, cameraInfo@l
/* 00003C4C 82350000 */ lwz r17, 0(r21)
/* 00003C50 3AEB0000 */ addi r23, r11, g_poolInfo@l
/* 00003C54 3A400000 */ li r18, 0
/* 00003C58 3A000000 */ li r16, 0
/* 00003C5C 39E00000 */ li r15, 0
lbl_00003C60:
/* 00003C60 7C767A14 */ add r3, r22, r15
/* 00003C64 C0340030 */ lfs f1, 0x30(r20)
/* 00003C68 C0030048 */ lfs f0, 0x48(r3)
/* 00003C6C FC000840 */ fcmpo cr0, f0, f1
/* 00003C70 40810380 */ ble lbl_00003FF0
/* 00003C74 C003004C */ lfs f0, 0x4c(r3)
/* 00003C78 FC000840 */ fcmpo cr0, f0, f1
/* 00003C7C 40810374 */ ble lbl_00003FF0
/* 00003C80 8077000C */ lwz r3, 0xc(r23)
/* 00003C84 7C6390AE */ lbzx r3, r3, r18
/* 00003C88 7C600775 */ extsb. r0, r3
/* 00003C8C 41820364 */ beq lbl_00003FF0
/* 00003C90 7C600774 */ extsb r0, r3
/* 00003C94 2C000004 */ cmpwi r0, 4
/* 00003C98 41820358 */ beq lbl_00003FF0
/* 00003C9C 7C188214 */ add r0, r24, r16
/* 00003CA0 90150000 */ stw r0, 0(r21)
/* 00003CA4 7E439378 */ mr r3, r18
/* 00003CA8 4BFFC4A5 */ bl u_call_camera_apply_viewport
/* 00003CAC 4BFFC4A1 */ bl u_draw_ball_shadow
/* 00003CB0 4BFFC49D */ bl func_80054FF0
/* 00003CB4 7E439378 */ mr r3, r18
/* 00003CB8 4BFFC495 */ bl u_reset_light_group_stack
/* 00003CBC 881901E0 */ lbz r0, 0x1e0(r25)
/* 00003CC0 2C000002 */ cmpwi r0, 2
/* 00003CC4 4082000C */ bne lbl_00003CD0
/* 00003CC8 38600004 */ li r3, 4
/* 00003CCC 4BFFC481 */ bl rend_efc_draw
lbl_00003CD0:
/* 00003CD0 807A0000 */ lwz r3, 0(r26)
/* 00003CD4 C0140030 */ lfs f0, 0x30(r20)
/* 00003CD8 C0230004 */ lfs f1, 4(r3)
/* 00003CDC FC010040 */ fcmpo cr0, f1, f0
/* 00003CE0 4080002C */ bge lbl_00003D0C
/* 00003CE4 C03401C0 */ lfs f1, 0x1c0(r20)
/* 00003CE8 38600002 */ li r3, 2
/* 00003CEC C05401C4 */ lfs f2, 0x1c4(r20)
/* 00003CF0 4BFFC45D */ bl avdisp_set_fog_params
/* 00003CF4 38600000 */ li r3, 0
/* 00003CF8 38800064 */ li r4, 0x64
/* 00003CFC 38A00096 */ li r5, 0x96
/* 00003D00 4BFFC44D */ bl avdisp_set_fog_color
/* 00003D04 38600001 */ li r3, 1
/* 00003D08 4BFFC445 */ bl func_8009AC0C
lbl_00003D0C:
/* 00003D0C 88790018 */ lbz r3, 0x18(r25)
/* 00003D10 7C600774 */ extsb r0, r3
/* 00003D14 2C000002 */ cmpwi r0, 2
/* 00003D18 4182000C */ beq lbl_00003D24
/* 00003D1C 2C000004 */ cmpwi r0, 4
/* 00003D20 40820008 */ bne lbl_00003D28
lbl_00003D24:
/* 00003D24 4BFFC429 */ bl stage_draw
lbl_00003D28:
/* 00003D28 4BFFC425 */ bl func_80094A34
/* 00003D2C 881901C8 */ lbz r0, 0x1c8(r25)
/* 00003D30 2C000002 */ cmpwi r0, 2
/* 00003D34 40820018 */ bne lbl_00003D4C
/* 00003D38 C03401C8 */ lfs f1, 0x1c8(r20)
/* 00003D3C 4BFFC411 */ bl ord_tbl_set_depth_offset
/* 00003D40 4BFFC40D */ bl background_draw
/* 00003D44 C0340030 */ lfs f1, 0x30(r20)
/* 00003D48 4BFFC405 */ bl ord_tbl_set_depth_offset
lbl_00003D4C:
/* 00003D4C A81B0000 */ lha r0, 0(r27)
/* 00003D50 2C00001A */ cmpwi r0, 0x1a
/* 00003D54 4182002C */ beq lbl_00003D80
/* 00003D58 40800010 */ bge lbl_00003D68
/* 00003D5C 2C000018 */ cmpwi r0, 0x18
/* 00003D60 41820020 */ beq lbl_00003D80
/* 00003D64 4800000C */ b lbl_00003D70
lbl_00003D68:
/* 00003D68 2C00001C */ cmpwi r0, 0x1c
/* 00003D6C 41820014 */ beq lbl_00003D80
lbl_00003D70:
/* 00003D70 480006E1 */ bl lbl_00004450
/* 00003D74 480007FD */ bl lbl_00004570
/* 00003D78 480002AD */ bl lbl_00004024
/* 00003D7C 48000B45 */ bl lbl_000048C0
lbl_00003D80:
/* 00003D80 4BFFC3CD */ bl draw_monkey
/* 00003D84 881901E0 */ lbz r0, 0x1e0(r25)
/* 00003D88 2C000002 */ cmpwi r0, 2
/* 00003D8C 4082000C */ bne lbl_00003D98
/* 00003D90 38600010 */ li r3, 0x10
/* 00003D94 4BFFC3B9 */ bl rend_efc_draw
lbl_00003D98:
/* 00003D98 88190078 */ lbz r0, 0x78(r25)
/* 00003D9C 2C000002 */ cmpwi r0, 2
/* 00003DA0 40820008 */ bne lbl_00003DA8
/* 00003DA4 4BFFC3A9 */ bl item_draw
lbl_00003DA8:
/* 00003DA8 88190048 */ lbz r0, 0x48(r25)
/* 00003DAC 2C000002 */ cmpwi r0, 2
/* 00003DB0 408200B0 */ bne lbl_00003E60
/* 00003DB4 4BFFC399 */ bl ball_draw
/* 00003DB8 80750000 */ lwz r3, 0(r21)
/* 00003DBC C0140030 */ lfs f0, 0x30(r20)
/* 00003DC0 C0230008 */ lfs f1, 8(r3)
/* 00003DC4 FC010040 */ fcmpo cr0, f1, f0
/* 00003DC8 40800098 */ bge lbl_00003E60
/* 00003DCC 4BFFC381 */ bl mathutil_mtxA_push
/* 00003DD0 80750000 */ lwz r3, 0(r21)
/* 00003DD4 806300FC */ lwz r3, 0xfc(r3)
/* 00003DD8 38630060 */ addi r3, r3, 0x60
/* 00003DDC 4BFFC371 */ bl mathutil_mtxA_from_quat
/* 00003DE0 80750000 */ lwz r3, 0(r21)
/* 00003DE4 806300FC */ lwz r3, 0xfc(r3)
/* 00003DE8 80630000 */ lwz r3, 0(r3)
/* 00003DEC 3C630001 */ addis r3, r3, 1
/* 00003DF0 38638EC8 */ addi r3, r3, -28984  ;# fixed addi
/* 00003DF4 4BFFC359 */ bl mathutil_mtxA_mult_right
/* 00003DF8 C03401CC */ lfs f1, 0x1cc(r20)
/* 00003DFC 38610040 */ addi r3, r1, 0x40
/* 00003E00 C0540030 */ lfs f2, 0x30(r20)
/* 00003E04 C07401D0 */ lfs f3, 0x1d0(r20)
/* 00003E08 4BFFC345 */ bl mathutil_mtxA_tf_point_xyz
/* 00003E0C 80950000 */ lwz r4, 0(r21)
/* 00003E10 38610040 */ addi r3, r1, 0x40
/* 00003E14 C0210040 */ lfs f1, 0x40(r1)
/* 00003E18 C0040004 */ lfs f0, 4(r4)
/* 00003E1C EC01002A */ fadds f0, f1, f0
/* 00003E20 D0010040 */ stfs f0, 0x40(r1)
/* 00003E24 80950000 */ lwz r4, 0(r21)
/* 00003E28 C0210044 */ lfs f1, 0x44(r1)
/* 00003E2C C0040008 */ lfs f0, 8(r4)
/* 00003E30 EC01002A */ fadds f0, f1, f0
/* 00003E34 D0010044 */ stfs f0, 0x44(r1)
/* 00003E38 80950000 */ lwz r4, 0(r21)
/* 00003E3C C0210048 */ lfs f1, 0x48(r1)
/* 00003E40 C004000C */ lfs f0, 0xc(r4)
/* 00003E44 EC01002A */ fadds f0, f1, f0
/* 00003E48 D0010048 */ stfs f0, 0x48(r1)
/* 00003E4C 80950000 */ lwz r4, 0(r21)
/* 00003E50 80BC0000 */ lwz r5, 0(r28)
/* 00003E54 3884001C */ addi r4, r4, 0x1c
/* 00003E58 480072D9 */ bl lbl_0000B130
/* 00003E5C 4BFFC2F1 */ bl mathutil_mtxA_pop
lbl_00003E60:
/* 00003E60 88190060 */ lbz r0, 0x60(r25)
/* 00003E64 2C000002 */ cmpwi r0, 2
/* 00003E68 40820008 */ bne lbl_00003E70
/* 00003E6C 4BFFC2E1 */ bl stobj_draw
lbl_00003E70:
/* 00003E70 88190138 */ lbz r0, 0x138(r25)
/* 00003E74 2C000002 */ cmpwi r0, 2
/* 00003E78 40820008 */ bne lbl_00003E80
/* 00003E7C 4BFFC2D1 */ bl effect_draw
lbl_00003E80:
/* 00003E80 801D0008 */ lwz r0, 8(r29)
/* 00003E84 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003E88 4182000C */ beq lbl_00003E94
/* 00003E8C 7E439378 */ mr r3, r18
/* 00003E90 4BFFC2BD */ bl u_something_with_lens_flare_1
lbl_00003E94:
/* 00003E94 4BFFC2B9 */ bl draw_test_camera_target
/* 00003E98 4BFFC2B5 */ bl ord_tbl_draw_nodes
/* 00003E9C 88190048 */ lbz r0, 0x48(r25)
/* 00003EA0 2C000002 */ cmpwi r0, 2
/* 00003EA4 40820120 */ bne lbl_00003FC4
/* 00003EA8 80750000 */ lwz r3, 0(r21)
/* 00003EAC C01401D4 */ lfs f0, 0x1d4(r20)
/* 00003EB0 C0230008 */ lfs f1, 8(r3)
/* 00003EB4 FC010040 */ fcmpo cr0, f1, f0
/* 00003EB8 4080010C */ bge lbl_00003FC4
/* 00003EBC C0140030 */ lfs f0, 0x30(r20)
/* 00003EC0 FC010040 */ fcmpo cr0, f1, f0
/* 00003EC4 40810100 */ ble lbl_00003FC4
/* 00003EC8 3863001C */ addi r3, r3, 0x1c
/* 00003ECC C0230000 */ lfs f1, 0(r3)
/* 00003ED0 C0430004 */ lfs f2, 4(r3)
/* 00003ED4 C0030008 */ lfs f0, 8(r3)
/* 00003ED8 EC210072 */ fmuls f1, f1, f1
/* 00003EDC EC2208BA */ fmadds f1, f2, f2, f1
/* 00003EE0 EC20083A */ fmadds f1, f0, f0, f1
/* 00003EE4 4BFFC269 */ bl mathutil_sqrt
/* 00003EE8 C81401D8 */ lfd f0, 0x1d8(r20)
/* 00003EEC FC010040 */ fcmpo cr0, f1, f0
/* 00003EF0 408100D4 */ ble lbl_00003FC4
/* 00003EF4 80750000 */ lwz r3, 0(r21)
/* 00003EF8 38810024 */ addi r4, r1, 0x24
/* 00003EFC 38A00000 */ li r5, 0
/* 00003F00 38630004 */ addi r3, r3, 4
/* 00003F04 4BFFC249 */ bl raycast_stage_down
/* 00003F08 28030000 */ cmplwi r3, 0
/* 00003F0C 408200B8 */ bne lbl_00003FC4
/* 00003F10 80750000 */ lwz r3, 0(r21)
/* 00003F14 C0030004 */ lfs f0, 4(r3)
/* 00003F18 D0010018 */ stfs f0, 0x18(r1)
/* 00003F1C C0140030 */ lfs f0, 0x30(r20)
/* 00003F20 D001001C */ stfs f0, 0x1c(r1)
/* 00003F24 4BFFC229 */ bl mathutil_mtxA_push
/* 00003F28 80950000 */ lwz r4, 0(r21)
/* 00003F2C 38610018 */ addi r3, r1, 0x18
/* 00003F30 C004000C */ lfs f0, 0xc(r4)
/* 00003F34 D0010020 */ stfs f0, 0x20(r1)
/* 00003F38 80950000 */ lwz r4, 0(r21)
/* 00003F3C 80BE0000 */ lwz r5, 0(r30)
/* 00003F40 3884001C */ addi r4, r4, 0x1c
/* 00003F44 480076E1 */ bl lbl_0000B624
/* 00003F48 80950000 */ lwz r4, 0(r21)
/* 00003F4C 38610008 */ addi r3, r1, 8
/* 00003F50 80A400FC */ lwz r5, 0xfc(r4)
/* 00003F54 80850060 */ lwz r4, 0x60(r5)
/* 00003F58 80050064 */ lwz r0, 0x64(r5)
/* 00003F5C 90810008 */ stw r4, 8(r1)
/* 00003F60 9001000C */ stw r0, 0xc(r1)
/* 00003F64 80850068 */ lwz r4, 0x68(r5)
/* 00003F68 8005006C */ lwz r0, 0x6c(r5)
/* 00003F6C 90810010 */ stw r4, 0x10(r1)
/* 00003F70 90010014 */ stw r0, 0x14(r1)
/* 00003F74 C0140030 */ lfs f0, 0x30(r20)
/* 00003F78 D0010008 */ stfs f0, 8(r1)
/* 00003F7C C0140030 */ lfs f0, 0x30(r20)
/* 00003F80 D0010010 */ stfs f0, 0x10(r1)
/* 00003F84 4BFFC1C9 */ bl mathutil_quat_normalize
/* 00003F88 38610008 */ addi r3, r1, 8
/* 00003F8C 4BFFC1C1 */ bl mathutil_mtxA_from_quat
/* 00003F90 C0410018 */ lfs f2, 0x18(r1)
/* 00003F94 C021001C */ lfs f1, 0x1c(r1)
/* 00003F98 C0010020 */ lfs f0, 0x20(r1)
/* 00003F9C 3C60E000 */ lis r3, 0xe000
/* 00003FA0 D043000C */ stfs f2, 0xc(r3)
/* 00003FA4 D023001C */ stfs f1, 0x1c(r3)
/* 00003FA8 D003002C */ stfs f0, 0x2c(r3)
/* 00003FAC 7E639B78 */ mr r3, r19
/* 00003FB0 80950000 */ lwz r4, 0(r21)
/* 00003FB4 80BF0000 */ lwz r5, 0(r31)
/* 00003FB8 3884001C */ addi r4, r4, 0x1c
/* 00003FBC 48007B11 */ bl lbl_0000BACC
/* 00003FC0 4BFFC18D */ bl mathutil_mtxA_pop
lbl_00003FC4:
/* 00003FC4 4BFFC189 */ bl func_8009AC44
/* 00003FC8 801D0008 */ lwz r0, 8(r29)
/* 00003FCC 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003FD0 4182000C */ beq lbl_00003FDC
/* 00003FD4 7E439378 */ mr r3, r18
/* 00003FD8 4BFFC175 */ bl u_something_with_lens_flare_2
lbl_00003FDC:
/* 00003FDC 881901E0 */ lbz r0, 0x1e0(r25)
/* 00003FE0 2C000002 */ cmpwi r0, 2
/* 00003FE4 4082000C */ bne lbl_00003FF0
/* 00003FE8 38600008 */ li r3, 8
/* 00003FEC 4BFFC161 */ bl rend_efc_draw
lbl_00003FF0:
/* 00003FF0 3A520001 */ addi r18, r18, 1
/* 00003FF4 2C120004 */ cmpwi r18, 4
/* 00003FF8 3A1001A4 */ addi r16, r16, 0x1a4
/* 00003FFC 39EF0284 */ addi r15, r15, 0x284
/* 00004000 4180FC60 */ blt lbl_00003C60
/* 00004004 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004008 92230000 */ stw r17, currentBallStructPtr@l(r3)
/* 0000400C 4BFFC141 */ bl func_80017FCC
/* 00004010 B9E10054 */ lmw r15, 0x54(r1)
/* 00004014 8001009C */ lwz r0, 0x9c(r1)
/* 00004018 38210098 */ addi r1, r1, 0x98
/* 0000401C 7C0803A6 */ mtlr r0
/* 00004020 4E800020 */ blr 
lbl_00004024:
/* 00004024 7C0802A6 */ mflr r0
/* 00004028 3C600000 */ lis r3, g_poolInfo@ha
/* 0000402C 90010004 */ stw r0, 4(r1)
/* 00004030 9421FFD8 */ stwu r1, -0x28(r1)
/* 00004034 BF21000C */ stmw r25, 0xc(r1)
/* 00004038 3BC30000 */ addi r30, r3, g_poolInfo@l
/* 0000403C 3C600000 */ lis r3, ballInfo@ha
/* 00004040 38030000 */ addi r0, r3, ballInfo@l
/* 00004044 3C600000 */ lis r3, lbl_000040EC@ha
/* 00004048 7C1D0378 */ mr r29, r0
/* 0000404C 3BE30000 */ addi r31, r3, lbl_000040EC@l
/* 00004050 3B600000 */ li r27, 0
/* 00004054 839E000C */ lwz r28, 0xc(r30)
/* 00004058 48000074 */ b lbl_000040CC
lbl_0000405C:
/* 0000405C 887C0000 */ lbz r3, 0(r28)
/* 00004060 7C600775 */ extsb. r0, r3
/* 00004064 4182005C */ beq lbl_000040C0
/* 00004068 7C600774 */ extsb r0, r3
/* 0000406C 2C000004 */ cmpwi r0, 4
/* 00004070 41820050 */ beq lbl_000040C0
/* 00004074 881D0148 */ lbz r0, 0x148(r29)
/* 00004078 28000002 */ cmplwi r0, 2
/* 0000407C 4182000C */ beq lbl_00004088
/* 00004080 28000003 */ cmplwi r0, 3
/* 00004084 4082003C */ bne lbl_000040C0
lbl_00004088:
/* 00004088 4BFFC0C5 */ bl mathutil_mtxA_from_mtxB
/* 0000408C 387D0004 */ addi r3, r29, 4
/* 00004090 4BFFC0BD */ bl ord_tbl_get_entry_for_pos
/* 00004094 3B230000 */ addi r25, r3, 0
/* 00004098 38600010 */ li r3, 0x10
/* 0000409C 4BFFC0B1 */ bl ord_tbl_alloc_node
/* 000040A0 7C7A1B78 */ mr r26, r3
/* 000040A4 93E30004 */ stw r31, 4(r3)
/* 000040A8 4BFFC0A5 */ bl peek_light_group
/* 000040AC 907A0008 */ stw r3, 8(r26)
/* 000040B0 38790000 */ addi r3, r25, 0
/* 000040B4 389A0000 */ addi r4, r26, 0
/* 000040B8 937A000C */ stw r27, 0xc(r26)
/* 000040BC 4BFFC091 */ bl ord_tbl_insert_node
lbl_000040C0:
/* 000040C0 3B7B0001 */ addi r27, r27, 1
/* 000040C4 3BBD01A4 */ addi r29, r29, 0x1a4
/* 000040C8 3B9C0001 */ addi r28, r28, 1
lbl_000040CC:
/* 000040CC 801E0008 */ lwz r0, 8(r30)
/* 000040D0 7C1B0000 */ cmpw r27, r0
/* 000040D4 4180FF88 */ blt lbl_0000405C
/* 000040D8 BB21000C */ lmw r25, 0xc(r1)
/* 000040DC 8001002C */ lwz r0, 0x2c(r1)
/* 000040E0 38210028 */ addi r1, r1, 0x28
/* 000040E4 7C0803A6 */ mtlr r0
/* 000040E8 4E800020 */ blr 
lbl_000040EC:
/* 000040EC 7C0802A6 */ mflr r0
/* 000040F0 3C800000 */ lis r4, lbl_0000BE80@ha
/* 000040F4 90010004 */ stw r0, 4(r1)
/* 000040F8 3CA00000 */ lis r5, lbl_802F1FDC@ha
/* 000040FC 9421FF80 */ stwu r1, -0x80(r1)
/* 00004100 DBE10078 */ stfd f31, 0x78(r1)
/* 00004104 DBC10070 */ stfd f30, 0x70(r1)
/* 00004108 BF61005C */ stmw r27, 0x5c(r1)
/* 0000410C 3BC40000 */ addi r30, r4, lbl_0000BE80@l
/* 00004110 3C800000 */ lis r4, ballInfo@ha
/* 00004114 801E01E0 */ lwz r0, 0x1e0(r30)
/* 00004118 80DE01E4 */ lwz r6, 0x1e4(r30)
/* 0000411C 90010034 */ stw r0, 0x34(r1)
/* 00004120 38040000 */ addi r0, r4, ballInfo@l
/* 00004124 90C10038 */ stw r6, 0x38(r1)
/* 00004128 80DE01E8 */ lwz r6, 0x1e8(r30)
/* 0000412C 809E01EC */ lwz r4, 0x1ec(r30)
/* 00004130 90C1003C */ stw r6, 0x3c(r1)
/* 00004134 90810040 */ stw r4, 0x40(r1)
/* 00004138 809E01F0 */ lwz r4, 0x1f0(r30)
/* 0000413C 90810044 */ stw r4, 0x44(r1)
/* 00004140 80DE01F4 */ lwz r6, 0x1f4(r30)
/* 00004144 809E01F8 */ lwz r4, 0x1f8(r30)
/* 00004148 90C10020 */ stw r6, 0x20(r1)
/* 0000414C 90810024 */ stw r4, 0x24(r1)
/* 00004150 80DE01FC */ lwz r6, 0x1fc(r30)
/* 00004154 809E0200 */ lwz r4, 0x200(r30)
/* 00004158 90C10028 */ stw r6, 0x28(r1)
/* 0000415C 9081002C */ stw r4, 0x2c(r1)
/* 00004160 809E0204 */ lwz r4, 0x204(r30)
/* 00004164 90810030 */ stw r4, 0x30(r1)
/* 00004168 80DE0208 */ lwz r6, 0x208(r30)
/* 0000416C 809E020C */ lwz r4, 0x20c(r30)
/* 00004170 90C1000C */ stw r6, 0xc(r1)
/* 00004174 90810010 */ stw r4, 0x10(r1)
/* 00004178 80DE0210 */ lwz r6, 0x210(r30)
/* 0000417C 809E0214 */ lwz r4, 0x214(r30)
/* 00004180 90C10014 */ stw r6, 0x14(r1)
/* 00004184 90810018 */ stw r4, 0x18(r1)
/* 00004188 809E0218 */ lwz r4, 0x218(r30)
/* 0000418C 9081001C */ stw r4, 0x1c(r1)
/* 00004190 8083000C */ lwz r4, 0xc(r3)
/* 00004194 C3C50000 */ lfs f30, lbl_802F1FDC@l(r5)
/* 00004198 1C8401A4 */ mulli r4, r4, 0x1a4
/* 0000419C 80630008 */ lwz r3, 8(r3)
/* 000041A0 7FA02214 */ add r29, r0, r4
/* 000041A4 4BFFBFA9 */ bl load_light_group_cached
/* 000041A8 3C600000 */ lis r3, lbl_10000000@ha
/* 000041AC C83E0220 */ lfd f1, 0x220(r30)
/* 000041B0 C0030000 */ lfs f0, lbl_10000000@l(r3)
/* 000041B4 FC010032 */ fmul f0, f1, f0
/* 000041B8 FC00001E */ fctiwz f0, f0
/* 000041BC D8010048 */ stfd f0, 0x48(r1)
/* 000041C0 8001004C */ lwz r0, 0x4c(r1)
/* 000041C4 D8010050 */ stfd f0, 0x50(r1)
/* 000041C8 7C000734 */ extsh r0, r0
/* 000041CC 2C000600 */ cmpwi r0, 0x600
/* 000041D0 80610054 */ lwz r3, 0x54(r1)
/* 000041D4 4081000C */ ble lbl_000041E0
/* 000041D8 38600600 */ li r3, 0x600
/* 000041DC 48000014 */ b lbl_000041F0
lbl_000041E0:
/* 000041E0 7C600734 */ extsh r0, r3
/* 000041E4 2C00FE80 */ cmpwi r0, -384
/* 000041E8 40800008 */ bge lbl_000041F0
/* 000041EC 3860FE80 */ li r3, -384
lbl_000041F0:
/* 000041F0 7C630734 */ extsh r3, r3
/* 000041F4 C81E0198 */ lfd f0, 0x198(r30)
/* 000041F8 38034A00 */ addi r0, r3, 0x4a00
/* 000041FC 6C008000 */ xoris r0, r0, 0x8000
/* 00004200 9001004C */ stw r0, 0x4c(r1)
/* 00004204 3C004330 */ lis r0, 0x4330
/* 00004208 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 0000420C 90010048 */ stw r0, 0x48(r1)
/* 00004210 3C800000 */ lis r4, lbl_802F1FDC@ha
/* 00004214 C8430000 */ lfd f2, lbl_0000BEE0@l(r3)
/* 00004218 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 0000421C C8210048 */ lfd f1, 0x48(r1)
/* 00004220 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00004224 FC211028 */ fsub f1, f1, f2
/* 00004228 C0840000 */ lfs f4, lbl_802F1FDC@l(r4)
/* 0000422C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00004230 FC240072 */ fmul f1, f4, f1
/* 00004234 FC010024 */ fdiv f0, f1, f0
/* 00004238 FC00001E */ fctiwz f0, f0
/* 0000423C D8010050 */ stfd f0, 0x50(r1)
/* 00004240 83E10054 */ lwz r31, 0x54(r1)
/* 00004244 41820008 */ beq lbl_0000424C
/* 00004248 C3DE0228 */ lfs f30, 0x228(r30)
lbl_0000424C:
/* 0000424C C81E0198 */ lfd f0, 0x198(r30)
/* 00004250 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00004254 38630000 */ addi r3, r3, currentCameraStructPtr@l
/* 00004258 C87E0068 */ lfd f3, 0x68(r30)
/* 0000425C FC3E0024 */ fdiv f1, f30, f0
/* 00004260 80630000 */ lwz r3, 0(r3)
/* 00004264 C85E0238 */ lfd f2, 0x238(r30)
/* 00004268 80030204 */ lwz r0, 0x204(r3)
/* 0000426C C8BE0230 */ lfd f5, 0x230(r30)
/* 00004270 FC840024 */ fdiv f4, f4, f0
/* 00004274 5400103A */ slwi r0, r0, 2
/* 00004278 7C7D0214 */ add r3, r29, r0
/* 0000427C C003015C */ lfs f0, 0x15c(r3)
/* 00004280 FC220072 */ fmul f1, f2, f1
/* 00004284 FC030032 */ fmul f0, f3, f0
/* 00004288 FFE50132 */ fmul f31, f5, f4
/* 0000428C FFC30828 */ fsub f30, f3, f1
/* 00004290 FC23002A */ fadd f1, f3, f0
/* 00004294 FFE0F818 */ frsp f31, f31
/* 00004298 FFC0F018 */ frsp f30, f30
/* 0000429C FC200818 */ frsp f1, f1
/* 000042A0 4BFFBEAD */ bl func_8000E1A4
/* 000042A4 38600001 */ li r3, 1
/* 000042A8 38800003 */ li r4, 3
/* 000042AC 38A00000 */ li r5, 0
/* 000042B0 4BFFBE9D */ bl avdisp_set_z_mode
/* 000042B4 4BFFBE99 */ bl mathutil_mtxA_from_mtxB
/* 000042B8 387D0030 */ addi r3, r29, 0x30
/* 000042BC 4BFFBE91 */ bl mathutil_mtxA_mult_right
/* 000042C0 C03E0030 */ lfs f1, 0x30(r30)
/* 000042C4 FC40F090 */ fmr f2, f30
/* 000042C8 FC600890 */ fmr f3, f1
/* 000042CC 4BFFBE81 */ bl mathutil_mtxA_translate_xyz
/* 000042D0 4BFFBE7D */ bl mathutil_mtxA_push
/* 000042D4 C05E0030 */ lfs f2, 0x30(r30)
/* 000042D8 FC20F850 */ fneg f1, f31
/* 000042DC FC601090 */ fmr f3, f2
/* 000042E0 4BFFBE6D */ bl mathutil_mtxA_translate_xyz
/* 000042E4 7FE00734 */ extsh r0, r31
/* 000042E8 7C6000D0 */ neg r3, r0
/* 000042EC 4BFFBE61 */ bl mathutil_mtxA_rotate_z
/* 000042F0 3C600000 */ lis r3, mathutilData@ha
/* 000042F4 3B630000 */ addi r27, r3, mathutilData@l
/* 000042F8 807B0000 */ lwz r3, 0(r27)
/* 000042FC 38800000 */ li r4, 0
/* 00004300 4BFFBE4D */ bl u_gxutil_upload_some_mtx
/* 00004304 3C600000 */ lis r3, minigameGma@ha
/* 00004308 3B830000 */ addi r28, r3, minigameGma@l
/* 0000430C 807C0000 */ lwz r3, 0(r28)
/* 00004310 80630008 */ lwz r3, 8(r3)
/* 00004314 80630000 */ lwz r3, 0(r3)
/* 00004318 4BFFBE35 */ bl avdisp_draw_model_unculled_sort_none
/* 0000431C 807C0000 */ lwz r3, 0(r28)
/* 00004320 80630008 */ lwz r3, 8(r3)
/* 00004324 80630008 */ lwz r3, 8(r3)
/* 00004328 4BFFBE25 */ bl avdisp_draw_model_unculled_sort_none
/* 0000432C 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00004330 C81E01B0 */ lfd f0, 0x1b0(r30)
/* 00004334 C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 00004338 FC010040 */ fcmpo cr0, f1, f0
/* 0000433C 4081002C */ ble lbl_00004368
/* 00004340 3C600001 */ lis r3, 1
/* 00004344 38638000 */ addi r3, r3, -32768  ;# fixed addi
/* 00004348 4BFFBE05 */ bl mathutil_mtxA_rotate_y
/* 0000434C 807B0000 */ lwz r3, 0(r27)
/* 00004350 38800000 */ li r4, 0
/* 00004354 4BFFBDF9 */ bl u_gxutil_upload_some_mtx
/* 00004358 807C0000 */ lwz r3, 0(r28)
/* 0000435C 80630008 */ lwz r3, 8(r3)
/* 00004360 806300E0 */ lwz r3, 0xe0(r3)
/* 00004364 4BFFBDE9 */ bl avdisp_draw_model_unculled_sort_none
lbl_00004368:
/* 00004368 4BFFBDE5 */ bl mathutil_mtxA_pop
/* 0000436C C05E0030 */ lfs f2, 0x30(r30)
/* 00004370 FC20F890 */ fmr f1, f31
/* 00004374 FC601090 */ fmr f3, f2
/* 00004378 4BFFBDD5 */ bl mathutil_mtxA_translate_xyz
/* 0000437C 7FE30734 */ extsh r3, r31
/* 00004380 4BFFBDCD */ bl mathutil_mtxA_rotate_z
/* 00004384 3C600000 */ lis r3, mathutilData@ha
/* 00004388 38630000 */ addi r3, r3, mathutilData@l
/* 0000438C 80630000 */ lwz r3, 0(r3)
/* 00004390 38800000 */ li r4, 0
/* 00004394 4BFFBDB9 */ bl u_gxutil_upload_some_mtx
/* 00004398 881D014A */ lbz r0, 0x14a(r29)
/* 0000439C 3C600000 */ lis r3, minigameGma@ha
/* 000043A0 3BE30000 */ addi r31, r3, minigameGma@l
/* 000043A4 809F0000 */ lwz r4, 0(r31)
/* 000043A8 5400083C */ slwi r0, r0, 1
/* 000043AC 38610020 */ addi r3, r1, 0x20
/* 000043B0 7C0302AE */ lhax r0, r3, r0
/* 000043B4 80640008 */ lwz r3, 8(r4)
/* 000043B8 54001838 */ slwi r0, r0, 3
/* 000043BC 7C63002E */ lwzx r3, r3, r0
/* 000043C0 4BFFBD8D */ bl avdisp_draw_model_unculled_sort_none
/* 000043C4 881D014A */ lbz r0, 0x14a(r29)
/* 000043C8 38610034 */ addi r3, r1, 0x34
/* 000043CC 809F0000 */ lwz r4, 0(r31)
/* 000043D0 5400083C */ slwi r0, r0, 1
/* 000043D4 7C0302AE */ lhax r0, r3, r0
/* 000043D8 80640008 */ lwz r3, 8(r4)
/* 000043DC 54001838 */ slwi r0, r0, 3
/* 000043E0 7C63002E */ lwzx r3, r3, r0
/* 000043E4 4BFFBD69 */ bl avdisp_draw_model_unculled_sort_none
/* 000043E8 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 000043EC C81E01B0 */ lfd f0, 0x1b0(r30)
/* 000043F0 C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 000043F4 FC010040 */ fcmpo cr0, f1, f0
/* 000043F8 40810028 */ ble lbl_00004420
/* 000043FC 881D014A */ lbz r0, 0x14a(r29)
/* 00004400 3861000C */ addi r3, r1, 0xc
/* 00004404 809F0000 */ lwz r4, 0(r31)
/* 00004408 5400083C */ slwi r0, r0, 1
/* 0000440C 7C0302AE */ lhax r0, r3, r0
/* 00004410 80640008 */ lwz r3, 8(r4)
/* 00004414 54001838 */ slwi r0, r0, 3
/* 00004418 7C63002E */ lwzx r3, r3, r0
/* 0000441C 4BFFBD31 */ bl avdisp_draw_model_unculled_sort_none
lbl_00004420:
/* 00004420 4BFFBD2D */ bl u_reset_post_mult_color
/* 00004424 38600001 */ li r3, 1
/* 00004428 38800003 */ li r4, 3
/* 0000442C 38A00001 */ li r5, 1
/* 00004430 4BFFBD1D */ bl avdisp_set_z_mode
/* 00004434 BB61005C */ lmw r27, 0x5c(r1)
/* 00004438 80010084 */ lwz r0, 0x84(r1)
/* 0000443C CBE10078 */ lfd f31, 0x78(r1)
/* 00004440 CBC10070 */ lfd f30, 0x70(r1)
/* 00004444 7C0803A6 */ mtlr r0
/* 00004448 38210080 */ addi r1, r1, 0x80
/* 0000444C 4E800020 */ blr 
lbl_00004450:
/* 00004450 7C0802A6 */ mflr r0
/* 00004454 3C800000 */ lis r4, lbl_10000000@ha
/* 00004458 90010004 */ stw r0, 4(r1)
/* 0000445C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004460 38840000 */ addi r4, r4, lbl_10000000@l
/* 00004464 9421FFE0 */ stwu r1, -0x20(r1)
/* 00004468 DBE10018 */ stfd f31, 0x18(r1)
/* 0000446C 93E10014 */ stw r31, 0x14(r1)
/* 00004470 93C10010 */ stw r30, 0x10(r1)
/* 00004474 83E30000 */ lwz r31, currentBallStructPtr@l(r3)
/* 00004478 3C600000 */ lis r3, lbl_0000BE80@ha
/* 0000447C 3BC30000 */ addi r30, r3, lbl_0000BE80@l
/* 00004480 38640068 */ addi r3, r4, 0x68
/* 00004484 C0430000 */ lfs f2, 0(r3)
/* 00004488 C0230004 */ lfs f1, 4(r3)
/* 0000448C C0030008 */ lfs f0, 8(r3)
/* 00004490 EC4200B2 */ fmuls f2, f2, f2
/* 00004494 EC41107A */ fmadds f2, f1, f1, f2
/* 00004498 EC40103A */ fmadds f2, f0, f0, f2
/* 0000449C C81E0240 */ lfd f0, 0x240(r30)
/* 000044A0 FC020040 */ fcmpo cr0, f2, f0
/* 000044A4 418000B0 */ blt lbl_00004554
/* 000044A8 C0240068 */ lfs f1, 0x68(r4)
/* 000044AC C0440070 */ lfs f2, 0x70(r4)
/* 000044B0 4BFFBC9D */ bl mathutil_atan2
/* 000044B4 881F002E */ lbz r0, 0x2e(r31)
/* 000044B8 3C800000 */ lis r4, cameraInfo@ha
/* 000044BC 3BE30000 */ addi r31, r3, 0
/* 000044C0 C03E01CC */ lfs f1, 0x1cc(r30)
/* 000044C4 7C000774 */ extsb r0, r0
/* 000044C8 1C000284 */ mulli r0, r0, 0x284
/* 000044CC C05E0248 */ lfs f2, 0x248(r30)
/* 000044D0 C07E024C */ lfs f3, 0x24c(r30)
/* 000044D4 38640000 */ addi r3, r4, cameraInfo@l
/* 000044D8 7C630214 */ add r3, r3, r0
/* 000044DC C0830038 */ lfs f4, 0x38(r3)
/* 000044E0 3861000C */ addi r3, r1, 0xc
/* 000044E4 38810008 */ addi r4, r1, 8
/* 000044E8 480027E5 */ bl lbl_00006CCC
/* 000044EC C3FE0250 */ lfs f31, 0x250(r30)
/* 000044F0 4BFFBC5D */ bl mathutil_mtxA_from_mtxB
/* 000044F4 C05E0254 */ lfs f2, 0x254(r30)
/* 000044F8 C0210008 */ lfs f1, 8(r1)
/* 000044FC C001000C */ lfs f0, 0xc(r1)
/* 00004500 3C60E000 */ lis r3, 0xe000
/* 00004504 D003000C */ stfs f0, 0xc(r3)
/* 00004508 D023001C */ stfs f1, 0x1c(r3)
/* 0000450C D043002C */ stfs f2, 0x2c(r3)
/* 00004510 7FE30734 */ extsh r3, r31
/* 00004514 4BFFBC39 */ bl mathutil_mtxA_rotate_y
/* 00004518 FC20F890 */ fmr f1, f31
/* 0000451C 4BFFBC31 */ bl mathutil_mtxA_scale_s
/* 00004520 3C600000 */ lis r3, mathutilData@ha
/* 00004524 38630000 */ addi r3, r3, mathutilData@l
/* 00004528 80630000 */ lwz r3, 0(r3)
/* 0000452C 38800000 */ li r4, 0
/* 00004530 4BFFBC1D */ bl u_gxutil_upload_some_mtx
/* 00004534 FC20F890 */ fmr f1, f31
/* 00004538 4BFFBC15 */ bl avdisp_set_bound_sphere_scale
/* 0000453C 3C600000 */ lis r3, minigameGma@ha
/* 00004540 38630000 */ addi r3, r3, minigameGma@l
/* 00004544 80630000 */ lwz r3, 0(r3)
/* 00004548 80630008 */ lwz r3, 8(r3)
/* 0000454C 80630048 */ lwz r3, 0x48(r3)
/* 00004550 4BFFBBFD */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00004554:
/* 00004554 80010024 */ lwz r0, 0x24(r1)
/* 00004558 CBE10018 */ lfd f31, 0x18(r1)
/* 0000455C 83E10014 */ lwz r31, 0x14(r1)
/* 00004560 7C0803A6 */ mtlr r0
/* 00004564 83C10010 */ lwz r30, 0x10(r1)
/* 00004568 38210020 */ addi r1, r1, 0x20
/* 0000456C 4E800020 */ blr 
lbl_00004570:
/* 00004570 7C0802A6 */ mflr r0
/* 00004574 3C800000 */ lis r4, modeCtrl@ha
/* 00004578 90010004 */ stw r0, 4(r1)
/* 0000457C 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00004580 38840000 */ addi r4, r4, modeCtrl@l
/* 00004584 9421FF58 */ stwu r1, -0xa8(r1)
/* 00004588 DBE100A0 */ stfd f31, 0xa0(r1)
/* 0000458C DBC10098 */ stfd f30, 0x98(r1)
/* 00004590 BE410060 */ stmw r18, 0x60(r1)
/* 00004594 3B230000 */ addi r25, r3, lbl_0000BE80@l
/* 00004598 3C600000 */ lis r3, lbl_80285A68@ha
/* 0000459C 80B90258 */ lwz r5, 0x258(r25)
/* 000045A0 8019025C */ lwz r0, 0x25c(r25)
/* 000045A4 90A1001C */ stw r5, 0x1c(r1)
/* 000045A8 3CA00000 */ lis r5, lbl_10000000@ha
/* 000045AC 3B050000 */ addi r24, r5, lbl_10000000@l
/* 000045B0 90010020 */ stw r0, 0x20(r1)
/* 000045B4 38030000 */ addi r0, r3, lbl_80285A68@l
/* 000045B8 80B90260 */ lwz r5, 0x260(r25)
/* 000045BC 80790264 */ lwz r3, 0x264(r25)
/* 000045C0 90A10024 */ stw r5, 0x24(r1)
/* 000045C4 90610028 */ stw r3, 0x28(r1)
/* 000045C8 80B90268 */ lwz r5, 0x268(r25)
/* 000045CC 8079026C */ lwz r3, 0x26c(r25)
/* 000045D0 90A1002C */ stw r5, 0x2c(r1)
/* 000045D4 90610030 */ stw r3, 0x30(r1)
/* 000045D8 80790270 */ lwz r3, 0x270(r25)
/* 000045DC 90610014 */ stw r3, 0x14(r1)
/* 000045E0 A0790274 */ lhz r3, 0x274(r25)
/* 000045E4 B0610018 */ sth r3, 0x18(r1)
/* 000045E8 8064002C */ lwz r3, 0x2c(r4)
/* 000045EC 1C630006 */ mulli r3, r3, 6
/* 000045F0 7C601A14 */ add r3, r0, r3
/* 000045F4 A8030000 */ lha r0, 0(r3)
/* 000045F8 2C000000 */ cmpwi r0, 0
/* 000045FC 418202A8 */ beq lbl_000048A4
/* 00004600 A8980036 */ lha r4, 0x36(r24)
/* 00004604 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00004608 C8430000 */ lfd f2, lbl_0000BEE0@l(r3)
/* 0000460C 6C808000 */ xoris r0, r4, 0x8000
/* 00004610 C8190278 */ lfd f0, 0x278(r25)
/* 00004614 9001005C */ stw r0, 0x5c(r1)
/* 00004618 3C004330 */ lis r0, 0x4330
/* 0000461C 90010058 */ stw r0, 0x58(r1)
/* 00004620 C8210058 */ lfd f1, 0x58(r1)
/* 00004624 FC211028 */ fsub f1, f1, f2
/* 00004628 FC010040 */ fcmpo cr0, f1, f0
/* 0000462C 4080000C */ bge lbl_00004638
/* 00004630 38040001 */ addi r0, r4, 1
/* 00004634 B0180036 */ sth r0, 0x36(r24)
lbl_00004638:
/* 00004638 A8180036 */ lha r0, 0x36(r24)
/* 0000463C 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00004640 3F404330 */ lis r26, 0x4330
/* 00004644 C8230000 */ lfd f1, lbl_0000BEE0@l(r3)
/* 00004648 6C008000 */ xoris r0, r0, 0x8000
/* 0000464C 9001005C */ stw r0, 0x5c(r1)
/* 00004650 C8590288 */ lfd f2, 0x288(r25)
/* 00004654 93410058 */ stw r26, 0x58(r1)
/* 00004658 C8010058 */ lfd f0, 0x58(r1)
/* 0000465C FC000828 */ fsub f0, f0, f1
/* 00004660 FC020032 */ fmul f0, f2, f0
/* 00004664 FC00001E */ fctiwz f0, f0
/* 00004668 D8010050 */ stfd f0, 0x50(r1)
/* 0000466C 80010054 */ lwz r0, 0x54(r1)
/* 00004670 7C030734 */ extsh r3, r0
/* 00004674 4BFFBAD9 */ bl mathutil_sin
/* 00004678 C8190280 */ lfd f0, 0x280(r25)
/* 0000467C 38600001 */ li r3, 1
/* 00004680 38800003 */ li r4, 3
/* 00004684 FFE00072 */ fmul f31, f0, f1
/* 00004688 38A00000 */ li r5, 0
/* 0000468C FFE0F818 */ frsp f31, f31
/* 00004690 4BFFBABD */ bl avdisp_set_z_mode
/* 00004694 3C600000 */ lis r3, mathutilData@ha
/* 00004698 3CA00000 */ lis r5, minigameGma@ha
/* 0000469C 3C80AAAB */ lis r4, 0xaaab
/* 000046A0 3CC00000 */ lis r6, currentCameraStructPtr@ha
/* 000046A4 3A430000 */ addi r18, r3, mathutilData@l
/* 000046A8 3BA50000 */ addi r29, r5, minigameGma@l
/* 000046AC 3BC4AAAB */ addi r30, r4, -21845  ;# fixed addi
/* 000046B0 3BE10014 */ addi r31, r1, 0x14
/* 000046B4 3AE10008 */ addi r23, r1, 8
/* 000046B8 3B61001C */ addi r27, r1, 0x1c
/* 000046BC 3B860000 */ addi r28, r6, currentCameraStructPtr@l
/* 000046C0 3AC00000 */ li r22, 0
/* 000046C4 3A600000 */ li r19, 0
lbl_000046C8:
/* 000046C8 7C9B9A14 */ add r4, r27, r19
/* 000046CC 80640000 */ lwz r3, 0(r4)
/* 000046D0 80040004 */ lwz r0, 4(r4)
/* 000046D4 90610040 */ stw r3, 0x40(r1)
/* 000046D8 90010044 */ stw r0, 0x44(r1)
/* 000046DC 80040008 */ lwz r0, 8(r4)
/* 000046E0 90010048 */ stw r0, 0x48(r1)
/* 000046E4 807C0000 */ lwz r3, 0(r28)
/* 000046E8 C0210040 */ lfs f1, 0x40(r1)
/* 000046EC C0030000 */ lfs f0, 0(r3)
/* 000046F0 C0410044 */ lfs f2, 0x44(r1)
/* 000046F4 EC010028 */ fsubs f0, f1, f0
/* 000046F8 C0210048 */ lfs f1, 0x48(r1)
/* 000046FC D0010034 */ stfs f0, 0x34(r1)
/* 00004700 807C0000 */ lwz r3, 0(r28)
/* 00004704 C0030004 */ lfs f0, 4(r3)
/* 00004708 EC020028 */ fsubs f0, f2, f0
/* 0000470C D0010038 */ stfs f0, 0x38(r1)
/* 00004710 807C0000 */ lwz r3, 0(r28)
/* 00004714 C0030008 */ lfs f0, 8(r3)
/* 00004718 EC010028 */ fsubs f0, f1, f0
/* 0000471C D001003C */ stfs f0, 0x3c(r1)
/* 00004720 4BFFBA2D */ bl mathutil_mtxA_from_mtxB
/* 00004724 38610040 */ addi r3, r1, 0x40
/* 00004728 4BFFBA25 */ bl mathutil_mtxA_translate
/* 0000472C C0210034 */ lfs f1, 0x34(r1)
/* 00004730 C001003C */ lfs f0, 0x3c(r1)
/* 00004734 FC200850 */ fneg f1, f1
/* 00004738 FC400050 */ fneg f2, f0
/* 0000473C 4BFFBA11 */ bl mathutil_atan2
/* 00004740 7C630734 */ extsh r3, r3
/* 00004744 4BFFBA09 */ bl mathutil_mtxA_rotate_y
/* 00004748 C0390030 */ lfs f1, 0x30(r25)
/* 0000474C C0790290 */ lfs f3, 0x290(r25)
/* 00004750 FC400890 */ fmr f2, f1
/* 00004754 4BFFB9F9 */ bl mathutil_mtxA_translate_xyz
/* 00004758 3AA00000 */ li r21, 0
lbl_0000475C:
/* 0000475C 7C1EA816 */ mulhwu r0, r30, r21
/* 00004760 807D0000 */ lwz r3, 0(r29)
/* 00004764 C0390030 */ lfs f1, 0x30(r25)
/* 00004768 80630008 */ lwz r3, 8(r3)
/* 0000476C FC400890 */ fmr f2, f1
/* 00004770 5400F87E */ srwi r0, r0, 1
/* 00004774 C0790294 */ lfs f3, 0x294(r25)
/* 00004778 1C000003 */ mulli r0, r0, 3
/* 0000477C 7C00A850 */ subf r0, r0, r21
/* 00004780 5400083C */ slwi r0, r0, 1
/* 00004784 7C1F02AE */ lhax r0, r31, r0
/* 00004788 54001838 */ slwi r0, r0, 3
/* 0000478C 7E83002E */ lwzx r20, r3, r0
/* 00004790 4BFFB9BD */ bl mathutil_mtxA_translate_xyz
/* 00004794 4BFFB9B9 */ bl mathutil_mtxA_push
/* 00004798 38970004 */ addi r4, r23, 4
/* 0000479C 38770008 */ addi r3, r23, 8
/* 000047A0 3CA0E000 */ lis r5, 0xe000
/* 000047A4 C045000C */ lfs f2, 0xc(r5)
/* 000047A8 C025001C */ lfs f1, 0x1c(r5)
/* 000047AC C005002C */ lfs f0, 0x2c(r5)
/* 000047B0 D0410008 */ stfs f2, 8(r1)
/* 000047B4 D0240000 */ stfs f1, 0(r4)
/* 000047B8 D0030000 */ stfs f0, 0(r3)
/* 000047BC C0210008 */ lfs f1, 8(r1)
/* 000047C0 C041000C */ lfs f2, 0xc(r1)
/* 000047C4 C0010010 */ lfs f0, 0x10(r1)
/* 000047C8 EC210072 */ fmuls f1, f1, f1
/* 000047CC EC2208BA */ fmadds f1, f2, f2, f1
/* 000047D0 EC20083A */ fmadds f1, f0, f0, f1
/* 000047D4 4BFFB979 */ bl mathutil_sqrt
/* 000047D8 C01901D0 */ lfs f0, 0x1d0(r25)
/* 000047DC 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 000047E0 A8180036 */ lha r0, 0x36(r24)
/* 000047E4 EC210028 */ fsubs f1, f1, f0
/* 000047E8 C8190130 */ lfd f0, 0x130(r25)
/* 000047EC 6C008000 */ xoris r0, r0, 0x8000
/* 000047F0 C8430000 */ lfd f2, lbl_0000BEE0@l(r3)
/* 000047F4 90010054 */ stw r0, 0x54(r1)
/* 000047F8 FC210028 */ fsub f1, f1, f0
/* 000047FC C8190198 */ lfd f0, 0x198(r25)
/* 00004800 93410050 */ stw r26, 0x50(r1)
/* 00004804 C8790298 */ lfd f3, 0x298(r25)
/* 00004808 FFC10024 */ fdiv f30, f1, f0
/* 0000480C C8210050 */ lfd f1, 0x50(r1)
/* 00004810 C81901B0 */ lfd f0, 0x1b0(r25)
/* 00004814 FC211028 */ fsub f1, f1, f2
/* 00004818 FFC0F018 */ frsp f30, f30
/* 0000481C FC230072 */ fmul f1, f3, f1
/* 00004820 FFDE0072 */ fmul f30, f30, f1
/* 00004824 FFC0F018 */ frsp f30, f30
/* 00004828 FC1E0040 */ fcmpo cr0, f30, f0
/* 0000482C 40810048 */ ble lbl_00004874
/* 00004830 FC20F890 */ fmr f1, f31
/* 00004834 4BFFB919 */ bl mathutil_mtxA_scale_s
/* 00004838 FC20F890 */ fmr f1, f31
/* 0000483C 4BFFB911 */ bl avdisp_set_bound_sphere_scale
/* 00004840 80720000 */ lwz r3, 0(r18)
/* 00004844 38800000 */ li r4, 0
/* 00004848 4BFFB905 */ bl u_gxutil_upload_some_mtx
/* 0000484C C81902A0 */ lfd f0, 0x2a0(r25)
/* 00004850 FC1E0040 */ fcmpo cr0, f30, f0
/* 00004854 40800018 */ bge lbl_0000486C
/* 00004858 FC20F090 */ fmr f1, f30
/* 0000485C 4BFFB8F1 */ bl avdisp_set_alpha
/* 00004860 7E83A378 */ mr r3, r20
/* 00004864 4BFFB8E9 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00004868 4800000C */ b lbl_00004874
lbl_0000486C:
/* 0000486C 7E83A378 */ mr r3, r20
/* 00004870 4BFFB8DD */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00004874:
/* 00004874 4BFFB8D9 */ bl mathutil_mtxA_pop
/* 00004878 3AB50001 */ addi r21, r21, 1
/* 0000487C 2C15000B */ cmpwi r21, 0xb
/* 00004880 4180FEDC */ blt lbl_0000475C
/* 00004884 3AD60001 */ addi r22, r22, 1
/* 00004888 28160002 */ cmplwi r22, 2
/* 0000488C 3A73000C */ addi r19, r19, 0xc
/* 00004890 4180FE38 */ blt lbl_000046C8
/* 00004894 38600001 */ li r3, 1
/* 00004898 38800003 */ li r4, 3
/* 0000489C 38A00001 */ li r5, 1
/* 000048A0 4BFFB8AD */ bl avdisp_set_z_mode
lbl_000048A4:
/* 000048A4 BA410060 */ lmw r18, 0x60(r1)
/* 000048A8 800100AC */ lwz r0, 0xac(r1)
/* 000048AC CBE100A0 */ lfd f31, 0xa0(r1)
/* 000048B0 CBC10098 */ lfd f30, 0x98(r1)
/* 000048B4 7C0803A6 */ mtlr r0
/* 000048B8 382100A8 */ addi r1, r1, 0xa8
/* 000048BC 4E800020 */ blr 
lbl_000048C0:
/* 000048C0 7C0802A6 */ mflr r0
/* 000048C4 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000048C8 90010004 */ stw r0, 4(r1)
/* 000048CC 3C800000 */ lis r4, currentBallStructPtr@ha
/* 000048D0 9421FF88 */ stwu r1, -0x78(r1)
/* 000048D4 93E10074 */ stw r31, 0x74(r1)
/* 000048D8 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 000048DC 93C10070 */ stw r30, 0x70(r1)
/* 000048E0 807F02A8 */ lwz r3, 0x2a8(r31)
/* 000048E4 801F02AC */ lwz r0, 0x2ac(r31)
/* 000048E8 83C40000 */ lwz r30, currentBallStructPtr@l(r4)
/* 000048EC 90610048 */ stw r3, 0x48(r1)
/* 000048F0 9001004C */ stw r0, 0x4c(r1)
/* 000048F4 801F02B0 */ lwz r0, 0x2b0(r31)
/* 000048F8 90010050 */ stw r0, 0x50(r1)
/* 000048FC C03F02B4 */ lfs f1, 0x2b4(r31)
/* 00004900 FC400890 */ fmr f2, f1
/* 00004904 FC600890 */ fmr f3, f1
/* 00004908 FC800890 */ fmr f4, f1
/* 0000490C 4BFFB841 */ bl avdisp_set_post_mult_color
/* 00004910 38600001 */ li r3, 1
/* 00004914 38800003 */ li r4, 3
/* 00004918 38A00000 */ li r5, 0
/* 0000491C 4BFFB831 */ bl avdisp_set_z_mode
/* 00004920 387E0004 */ addi r3, r30, 4
/* 00004924 38810054 */ addi r4, r1, 0x54
/* 00004928 38A00000 */ li r5, 0
/* 0000492C 4BFFB821 */ bl raycast_stage_down
/* 00004930 28030000 */ cmplwi r3, 0
/* 00004934 418200A4 */ beq lbl_000049D8
/* 00004938 4BFFB815 */ bl mathutil_mtxA_from_identity
/* 0000493C C03F02B8 */ lfs f1, 0x2b8(r31)
/* 00004940 4BFFB80D */ bl mathutil_mtxA_scale_s
/* 00004944 38610008 */ addi r3, r1, 8
/* 00004948 4BFFB805 */ bl mathutil_mtxA_to_mtx
/* 0000494C 38610058 */ addi r3, r1, 0x58
/* 00004950 4BFFB7FD */ bl mathutil_mtxA_from_mtxB_translate
/* 00004954 38610008 */ addi r3, r1, 8
/* 00004958 4BFFB7F5 */ bl mathutil_mtxA_mult_left
/* 0000495C 38610008 */ addi r3, r1, 8
/* 00004960 4BFFB7ED */ bl mathutil_mtxA_to_mtx
/* 00004964 38610038 */ addi r3, r1, 0x38
/* 00004968 38810048 */ addi r4, r1, 0x48
/* 0000496C 38A10064 */ addi r5, r1, 0x64
/* 00004970 4BFFB7DD */ bl mathutil_quat_from_dirs
/* 00004974 38610038 */ addi r3, r1, 0x38
/* 00004978 4BFFB7D5 */ bl mathutil_mtxA_from_quat
/* 0000497C 38610008 */ addi r3, r1, 8
/* 00004980 4BFFB7CD */ bl mathutil_mtxA_mult_left
/* 00004984 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00004988 C81F01B0 */ lfd f0, 0x1b0(r31)
/* 0000498C C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 00004990 FC010040 */ fcmpo cr0, f1, f0
/* 00004994 40810010 */ ble lbl_000049A4
/* 00004998 C03F02BC */ lfs f1, 0x2bc(r31)
/* 0000499C 4BFFB7B1 */ bl mathutil_mtxA_scale_s
/* 000049A0 4800000C */ b lbl_000049AC
lbl_000049A4:
/* 000049A4 C03F02C0 */ lfs f1, 0x2c0(r31)
/* 000049A8 4BFFB7A5 */ bl mathutil_mtxA_scale_s
lbl_000049AC:
/* 000049AC 3C600000 */ lis r3, mathutilData@ha
/* 000049B0 38630000 */ addi r3, r3, mathutilData@l
/* 000049B4 80630000 */ lwz r3, 0(r3)
/* 000049B8 38800000 */ li r4, 0
/* 000049BC 4BFFB791 */ bl u_gxutil_upload_some_mtx
/* 000049C0 3C600000 */ lis r3, commonGma@ha
/* 000049C4 38630000 */ addi r3, r3, commonGma@l
/* 000049C8 80630000 */ lwz r3, 0(r3)
/* 000049CC 80630008 */ lwz r3, 8(r3)
/* 000049D0 80630270 */ lwz r3, 0x270(r3)
/* 000049D4 4BFFB779 */ bl avdisp_draw_model_culled_sort_none
lbl_000049D8:
/* 000049D8 C03F0034 */ lfs f1, 0x34(r31)
/* 000049DC FC400890 */ fmr f2, f1
/* 000049E0 FC600890 */ fmr f3, f1
/* 000049E4 FC800890 */ fmr f4, f1
/* 000049E8 4BFFB765 */ bl avdisp_set_post_mult_color
/* 000049EC 38600001 */ li r3, 1
/* 000049F0 38800003 */ li r4, 3
/* 000049F4 38A00001 */ li r5, 1
/* 000049F8 4BFFB755 */ bl avdisp_set_z_mode
/* 000049FC 8001007C */ lwz r0, 0x7c(r1)
/* 00004A00 83E10074 */ lwz r31, 0x74(r1)
/* 00004A04 83C10070 */ lwz r30, 0x70(r1)
/* 00004A08 7C0803A6 */ mtlr r0
/* 00004A0C 38210078 */ addi r1, r1, 0x78
/* 00004A10 4E800020 */ blr 
lbl_00004A14:
/* 00004A14 7C0802A6 */ mflr r0
/* 00004A18 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004A1C 90010004 */ stw r0, 4(r1)
/* 00004A20 9421FFE8 */ stwu r1, -0x18(r1)
/* 00004A24 93E10014 */ stw r31, 0x14(r1)
/* 00004A28 93C10010 */ stw r30, 0x10(r1)
/* 00004A2C 93A1000C */ stw r29, 0xc(r1)
/* 00004A30 93810008 */ stw r28, 8(r1)
/* 00004A34 83A30000 */ lwz r29, currentBallStructPtr@l(r3)
/* 00004A38 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00004A3C 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 00004A40 C03D0008 */ lfs f1, 8(r29)
/* 00004A44 3C600000 */ lis r3, lbl_10000000@ha
/* 00004A48 C81F02C8 */ lfd f0, 0x2c8(r31)
/* 00004A4C 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00004A50 FC010040 */ fcmpo cr0, f1, f0
/* 00004A54 41800014 */ blt lbl_00004A68
/* 00004A58 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00004A5C 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00004A60 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004A64 41820284 */ beq lbl_00004CE8
lbl_00004A68:
/* 00004A68 A81E0018 */ lha r0, 0x18(r30)
/* 00004A6C 2C000000 */ cmpwi r0, 0
/* 00004A70 40820070 */ bne lbl_00004AE0
/* 00004A74 801E002C */ lwz r0, 0x2c(r30)
/* 00004A78 2C00FFFF */ cmpwi r0, -1
/* 00004A7C 41820014 */ beq lbl_00004A90
/* 00004A80 5403043E */ clrlwi r3, r0, 0x10
/* 00004A84 4BFFB6C9 */ bl SoundOff
/* 00004A88 3800FFFF */ li r0, -1
/* 00004A8C 901E002C */ stw r0, 0x2c(r30)
lbl_00004A90:
/* 00004A90 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00004A94 A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00004A98 2C00000E */ cmpwi r0, 0xe
/* 00004A9C 40820010 */ bne lbl_00004AAC
/* 00004AA0 386000F6 */ li r3, 0xf6
/* 00004AA4 4BFFB6A9 */ bl u_play_sound_0
/* 00004AA8 4800000C */ b lbl_00004AB4
lbl_00004AAC:
/* 00004AAC 386000F5 */ li r3, 0xf5
/* 00004AB0 4BFFB69D */ bl u_play_sound_0
lbl_00004AB4:
/* 00004AB4 889D002E */ lbz r4, 0x2e(r29)
/* 00004AB8 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00004ABC 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00004AC0 7C830774 */ extsb r3, r4
/* 00004AC4 5463103A */ slwi r3, r3, 2
/* 00004AC8 7C601A14 */ add r3, r0, r3
/* 00004ACC 80630000 */ lwz r3, 0(r3)
/* 00004AD0 38800001 */ li r4, 1
/* 00004AD4 38A00014 */ li r5, 0x14
/* 00004AD8 4BFFB675 */ bl func_800B60F4
/* 00004ADC 48000080 */ b lbl_00004B5C
lbl_00004AE0:
/* 00004AE0 2C00000A */ cmpwi r0, 0xa
/* 00004AE4 40820078 */ bne lbl_00004B5C
/* 00004AE8 807D00FC */ lwz r3, 0xfc(r29)
/* 00004AEC 80030010 */ lwz r0, 0x10(r3)
/* 00004AF0 2C000002 */ cmpwi r0, 2
/* 00004AF4 4182002C */ beq lbl_00004B20
/* 00004AF8 40800010 */ bge lbl_00004B08
/* 00004AFC 2C000001 */ cmpwi r0, 1
/* 00004B00 40800014 */ bge lbl_00004B14
/* 00004B04 48000050 */ b lbl_00004B54
lbl_00004B08:
/* 00004B08 2C000004 */ cmpwi r0, 4
/* 00004B0C 40800048 */ bge lbl_00004B54
/* 00004B10 4800001C */ b lbl_00004B2C
lbl_00004B14:
/* 00004B14 386000EE */ li r3, 0xee
/* 00004B18 4BFFB635 */ bl u_play_sound_0
/* 00004B1C 48000040 */ b lbl_00004B5C
lbl_00004B20:
/* 00004B20 386000EA */ li r3, 0xea
/* 00004B24 4BFFB629 */ bl u_play_sound_0
/* 00004B28 48000034 */ b lbl_00004B5C
lbl_00004B2C:
/* 00004B2C 38600161 */ li r3, 0x161
/* 00004B30 4BFFB61D */ bl u_play_sound_1_dupe
/* 00004B34 3B830000 */ addi r28, r3, 0
/* 00004B38 5463043E */ clrlwi r3, r3, 0x10
/* 00004B3C 38800060 */ li r4, 0x60
/* 00004B40 4BFFB60D */ bl SoundRev
/* 00004B44 5783043E */ clrlwi r3, r28, 0x10
/* 00004B48 38800040 */ li r4, 0x40
/* 00004B4C 4BFFB601 */ bl SoundCho
/* 00004B50 4800000C */ b lbl_00004B5C
lbl_00004B54:
/* 00004B54 386000EC */ li r3, 0xec
/* 00004B58 4BFFB5F5 */ bl u_play_sound_0
lbl_00004B5C:
/* 00004B5C A89E0018 */ lha r4, 0x18(r30)
/* 00004B60 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00004B64 38040001 */ addi r0, r4, 1
/* 00004B68 B01E0018 */ sth r0, 0x18(r30)
/* 00004B6C 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00004B70 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004B74 40820078 */ bne lbl_00004BEC
/* 00004B78 C01D0024 */ lfs f0, 0x24(r29)
/* 00004B7C C03D001C */ lfs f1, 0x1c(r29)
/* 00004B80 EC210072 */ fmuls f1, f1, f1
/* 00004B84 EC20083A */ fmadds f1, f0, f0, f1
/* 00004B88 4BFFB5C5 */ bl mathutil_sqrt
/* 00004B8C C81F02D0 */ lfd f0, 0x2d0(r31)
/* 00004B90 FC010040 */ fcmpo cr0, f1, f0
/* 00004B94 40800014 */ bge lbl_00004BA8
/* 00004B98 C03D0008 */ lfs f1, 8(r29)
/* 00004B9C C81F02D8 */ lfd f0, 0x2d8(r31)
/* 00004BA0 FC010040 */ fcmpo cr0, f1, f0
/* 00004BA4 41800014 */ blt lbl_00004BB8
lbl_00004BA8:
/* 00004BA8 C03D0008 */ lfs f1, 8(r29)
/* 00004BAC C81F02E0 */ lfd f0, 0x2e0(r31)
/* 00004BB0 FC010040 */ fcmpo cr0, f1, f0
/* 00004BB4 40800038 */ bge lbl_00004BEC
lbl_00004BB8:
/* 00004BB8 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00004BBC 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 00004BC0 80040000 */ lwz r0, 0(r4)
/* 00004BC4 386000B4 */ li r3, 0xb4
/* 00004BC8 60000200 */ ori r0, r0, 0x200
/* 00004BCC 90040000 */ stw r0, 0(r4)
/* 00004BD0 4BFFB57D */ bl hud_show_fallout_banner
/* 00004BD4 3860016A */ li r3, 0x16a
/* 00004BD8 3880016B */ li r4, 0x16b
/* 00004BDC 4BFFB571 */ bl func_8002BFCC
/* 00004BE0 38600000 */ li r3, 0
/* 00004BE4 38800008 */ li r4, 8
/* 00004BE8 4BFFB565 */ bl u_play_music
lbl_00004BEC:
/* 00004BEC A81E001A */ lha r0, 0x1a(r30)
/* 00004BF0 2C000050 */ cmpwi r0, 0x50
/* 00004BF4 40820010 */ bne lbl_00004C04
/* 00004BF8 3860000C */ li r3, 0xc
/* 00004BFC 4BFFB551 */ bl u_play_sound_0
/* 00004C00 48000018 */ b lbl_00004C18
lbl_00004C04:
/* 00004C04 2C0000B4 */ cmpwi r0, 0xb4
/* 00004C08 40810010 */ ble lbl_00004C18
/* 00004C0C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00004C10 38000000 */ li r0, 0
/* 00004C14 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_00004C18:
/* 00004C18 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00004C1C 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00004C20 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004C24 41820010 */ beq lbl_00004C34
/* 00004C28 A87E001A */ lha r3, 0x1a(r30)
/* 00004C2C 38030001 */ addi r0, r3, 1
/* 00004C30 B01E001A */ sth r0, 0x1a(r30)
lbl_00004C34:
/* 00004C34 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00004C38 C81F01B0 */ lfd f0, 0x1b0(r31)
/* 00004C3C C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 00004C40 FC010040 */ fcmpo cr0, f1, f0
/* 00004C44 40810044 */ ble lbl_00004C88
/* 00004C48 C83F02E8 */ lfd f1, 0x2e8(r31)
/* 00004C4C C01D001C */ lfs f0, 0x1c(r29)
/* 00004C50 FC010032 */ fmul f0, f1, f0
/* 00004C54 FC000018 */ frsp f0, f0
/* 00004C58 D01D001C */ stfs f0, 0x1c(r29)
/* 00004C5C C83F02E8 */ lfd f1, 0x2e8(r31)
/* 00004C60 C01D0020 */ lfs f0, 0x20(r29)
/* 00004C64 FC010032 */ fmul f0, f1, f0
/* 00004C68 FC000018 */ frsp f0, f0
/* 00004C6C D01D0020 */ stfs f0, 0x20(r29)
/* 00004C70 C83F02E8 */ lfd f1, 0x2e8(r31)
/* 00004C74 C01D0024 */ lfs f0, 0x24(r29)
/* 00004C78 FC010032 */ fmul f0, f1, f0
/* 00004C7C FC000018 */ frsp f0, f0
/* 00004C80 D01D0024 */ stfs f0, 0x24(r29)
/* 00004C84 48000040 */ b lbl_00004CC4
lbl_00004C88:
/* 00004C88 C83F02F0 */ lfd f1, 0x2f0(r31)
/* 00004C8C C01D001C */ lfs f0, 0x1c(r29)
/* 00004C90 FC010032 */ fmul f0, f1, f0
/* 00004C94 FC000018 */ frsp f0, f0
/* 00004C98 D01D001C */ stfs f0, 0x1c(r29)
/* 00004C9C C83F02F0 */ lfd f1, 0x2f0(r31)
/* 00004CA0 C01D0020 */ lfs f0, 0x20(r29)
/* 00004CA4 FC010032 */ fmul f0, f1, f0
/* 00004CA8 FC000018 */ frsp f0, f0
/* 00004CAC D01D0020 */ stfs f0, 0x20(r29)
/* 00004CB0 C83F02F0 */ lfd f1, 0x2f0(r31)
/* 00004CB4 C01D0024 */ lfs f0, 0x24(r29)
/* 00004CB8 FC010032 */ fmul f0, f1, f0
/* 00004CBC FC000018 */ frsp f0, f0
/* 00004CC0 D01D0024 */ stfs f0, 0x24(r29)
lbl_00004CC4:
/* 00004CC4 C03D0020 */ lfs f1, 0x20(r29)
/* 00004CC8 C81F01B0 */ lfd f0, 0x1b0(r31)
/* 00004CCC FC010040 */ fcmpo cr0, f1, f0
/* 00004CD0 40800054 */ bge lbl_00004D24
/* 00004CD4 C81F02F8 */ lfd f0, 0x2f8(r31)
/* 00004CD8 FC010032 */ fmul f0, f1, f0
/* 00004CDC FC000018 */ frsp f0, f0
/* 00004CE0 D01D0020 */ stfs f0, 0x20(r29)
/* 00004CE4 48000040 */ b lbl_00004D24
lbl_00004CE8:
/* 00004CE8 A81E0018 */ lha r0, 0x18(r30)
/* 00004CEC 2C000000 */ cmpwi r0, 0
/* 00004CF0 4182002C */ beq lbl_00004D1C
/* 00004CF4 386000EE */ li r3, 0xee
/* 00004CF8 4BFFB455 */ bl SoundOffID
/* 00004CFC 386000EA */ li r3, 0xea
/* 00004D00 4BFFB44D */ bl SoundOffID
/* 00004D04 38600161 */ li r3, 0x161
/* 00004D08 4BFFB445 */ bl SoundOffID
/* 00004D0C 386000EC */ li r3, 0xec
/* 00004D10 4BFFB43D */ bl SoundOffID
/* 00004D14 38000000 */ li r0, 0
/* 00004D18 B01E0018 */ sth r0, 0x18(r30)
lbl_00004D1C:
/* 00004D1C 38000000 */ li r0, 0
/* 00004D20 B01E001A */ sth r0, 0x1a(r30)
lbl_00004D24:
/* 00004D24 C03D0008 */ lfs f1, 8(r29)
/* 00004D28 C81F0300 */ lfd f0, 0x300(r31)
/* 00004D2C FC010040 */ fcmpo cr0, f1, f0
/* 00004D30 4080002C */ bge lbl_00004D5C
/* 00004D34 A81E0018 */ lha r0, 0x18(r30)
/* 00004D38 2C000000 */ cmpwi r0, 0
/* 00004D3C 40820020 */ bne lbl_00004D5C
/* 00004D40 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00004D44 A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00004D48 2C000016 */ cmpwi r0, 0x16
/* 00004D4C 41820010 */ beq lbl_00004D5C
/* 00004D50 386000F9 */ li r3, 0xf9
/* 00004D54 4BFFB3F9 */ bl u_play_sound_0
/* 00004D58 4800000C */ b lbl_00004D64
lbl_00004D5C:
/* 00004D5C 386000F9 */ li r3, 0xf9
/* 00004D60 4BFFB3ED */ bl SoundOffID
lbl_00004D64:
/* 00004D64 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00004D68 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00004D6C 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00004D70 41820020 */ beq lbl_00004D90
/* 00004D74 801E0030 */ lwz r0, 0x30(r30)
/* 00004D78 2C00FFFF */ cmpwi r0, -1
/* 00004D7C 40820030 */ bne lbl_00004DAC
/* 00004D80 386000F3 */ li r3, 0xf3
/* 00004D84 4BFFB3C9 */ bl u_play_sound_2
/* 00004D88 907E0030 */ stw r3, 0x30(r30)
/* 00004D8C 48000020 */ b lbl_00004DAC
lbl_00004D90:
/* 00004D90 801E0030 */ lwz r0, 0x30(r30)
/* 00004D94 2C00FFFF */ cmpwi r0, -1
/* 00004D98 41820014 */ beq lbl_00004DAC
/* 00004D9C 5403043E */ clrlwi r3, r0, 0x10
/* 00004DA0 4BFFB3AD */ bl SoundOff
/* 00004DA4 3800FFFF */ li r0, -1
/* 00004DA8 901E0030 */ stw r0, 0x30(r30)
lbl_00004DAC:
/* 00004DAC 3C600000 */ lis r3, modeCtrl@ha
/* 00004DB0 38630000 */ addi r3, r3, modeCtrl@l
/* 00004DB4 8083002C */ lwz r4, 0x2c(r3)
/* 00004DB8 3C600000 */ lis r3, lbl_80285A58@ha
/* 00004DBC 38030000 */ addi r0, r3, lbl_80285A58@l
/* 00004DC0 5483103A */ slwi r3, r4, 2
/* 00004DC4 7C601A14 */ add r3, r0, r3
/* 00004DC8 80830000 */ lwz r4, 0(r3)
/* 00004DCC 2C040000 */ cmpwi r4, 0
/* 00004DD0 4081005C */ ble lbl_00004E2C
/* 00004DD4 3C600000 */ lis r3, lbl_802F1FEC@ha
/* 00004DD8 A8030000 */ lha r0, lbl_802F1FEC@l(r3)
/* 00004DDC 7CC403D6 */ divw r6, r4, r0
/* 00004DE0 2C060001 */ cmpwi r6, 1
/* 00004DE4 40800008 */ bge lbl_00004DEC
/* 00004DE8 38C00001 */ li r6, 1
lbl_00004DEC:
/* 00004DEC 3C600000 */ lis r3, modeCtrl@ha
/* 00004DF0 38A30000 */ addi r5, r3, modeCtrl@l
/* 00004DF4 8085002C */ lwz r4, 0x2c(r5)
/* 00004DF8 3C600000 */ lis r3, lbl_80285A58@ha
/* 00004DFC 38030000 */ addi r0, r3, lbl_80285A58@l
/* 00004E00 5483103A */ slwi r3, r4, 2
/* 00004E04 7C601A14 */ add r3, r0, r3
/* 00004E08 80030000 */ lwz r0, 0(r3)
/* 00004E0C 7C060050 */ subf r0, r6, r0
/* 00004E10 90030000 */ stw r0, 0(r3)
/* 00004E14 8005002C */ lwz r0, 0x2c(r5)
/* 00004E18 5400103A */ slwi r0, r0, 2
/* 00004E1C 7C7E0214 */ add r3, r30, r0
/* 00004E20 80030044 */ lwz r0, 0x44(r3)
/* 00004E24 7C003214 */ add r0, r0, r6
/* 00004E28 90030044 */ stw r0, 0x44(r3)
lbl_00004E2C:
/* 00004E2C 3C600000 */ lis r3, lbl_802F1FEC@ha
/* 00004E30 38830000 */ addi r4, r3, lbl_802F1FEC@l
/* 00004E34 A8640000 */ lha r3, 0(r4)
/* 00004E38 2C030000 */ cmpwi r3, 0
/* 00004E3C 4081000C */ ble lbl_00004E48
/* 00004E40 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004E44 B0040000 */ sth r0, 0(r4)
lbl_00004E48:
/* 00004E48 3C600000 */ lis r3, lbl_802F1FE0@ha
/* 00004E4C 38830000 */ addi r4, r3, lbl_802F1FE0@l
/* 00004E50 A8640000 */ lha r3, 0(r4)
/* 00004E54 2C030000 */ cmpwi r3, 0
/* 00004E58 4081000C */ ble lbl_00004E64
/* 00004E5C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004E60 B0040000 */ sth r0, 0(r4)
lbl_00004E64:
/* 00004E64 8001001C */ lwz r0, 0x1c(r1)
/* 00004E68 83E10014 */ lwz r31, 0x14(r1)
/* 00004E6C 83C10010 */ lwz r30, 0x10(r1)
/* 00004E70 7C0803A6 */ mtlr r0
/* 00004E74 83A1000C */ lwz r29, 0xc(r1)
/* 00004E78 83810008 */ lwz r28, 8(r1)
/* 00004E7C 38210018 */ addi r1, r1, 0x18
/* 00004E80 4E800020 */ blr 
lbl_00004E84:
/* 00004E84 7C0802A6 */ mflr r0
/* 00004E88 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00004E8C 90010004 */ stw r0, 4(r1)
/* 00004E90 9421FFF8 */ stwu r1, -8(r1)
/* 00004E94 A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00004E98 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004E9C 80A30000 */ lwz r5, currentBallStructPtr@l(r3)
/* 00004EA0 2C000010 */ cmpwi r0, 0x10
/* 00004EA4 408200B4 */ bne lbl_00004F58
/* 00004EA8 3C600000 */ lis r3, lbl_10000018@ha
/* 00004EAC A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00004EB0 2C000000 */ cmpwi r0, 0
/* 00004EB4 408200A4 */ bne lbl_00004F58
/* 00004EB8 80050094 */ lwz r0, 0x94(r5)
/* 00004EBC 540007FF */ clrlwi. r0, r0, 0x1f
/* 00004EC0 40820098 */ bne lbl_00004F58
/* 00004EC4 88050003 */ lbz r0, 3(r5)
/* 00004EC8 7C000775 */ extsb. r0, r0
/* 00004ECC 4182008C */ beq lbl_00004F58
/* 00004ED0 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00004ED4 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00004ED8 3C608889 */ lis r3, 0x8889
/* 00004EDC 80840000 */ lwz r4, 0(r4)
/* 00004EE0 38038889 */ addi r0, r3, -30583  ;# fixed addi
/* 00004EE4 7C002096 */ mulhw r0, r0, r4
/* 00004EE8 7C002214 */ add r0, r0, r4
/* 00004EEC 7C002670 */ srawi r0, r0, 4
/* 00004EF0 54030FFE */ srwi r3, r0, 0x1f
/* 00004EF4 7C001A14 */ add r0, r0, r3
/* 00004EF8 1C00001E */ mulli r0, r0, 0x1e
/* 00004EFC 7C002050 */ subf r0, r0, r4
/* 00004F00 2C000001 */ cmpwi r0, 1
/* 00004F04 40820054 */ bne lbl_00004F58
/* 00004F08 8805002E */ lbz r0, 0x2e(r5)
/* 00004F0C 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 00004F10 38A30000 */ addi r5, r3, lbl_802F1DF8@l
/* 00004F14 7C000774 */ extsb r0, r0
/* 00004F18 90050000 */ stw r0, 0(r5)
/* 00004F1C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00004F20 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00004F24 80850000 */ lwz r4, 0(r5)
/* 00004F28 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00004F2C 5484103A */ slwi r4, r4, 2
/* 00004F30 7C802214 */ add r4, r0, r4
/* 00004F34 80040000 */ lwz r0, 0(r4)
/* 00004F38 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 00004F3C 4BFFB211 */ bl rand
/* 00004F40 3C800000 */ lis r4, lbl_0000BE80@ha
/* 00004F44 5463AF3C */ rlwinm r3, r3, 0x15, 0x1c, 0x1e
/* 00004F48 38040000 */ addi r0, r4, lbl_0000BE80@l
/* 00004F4C 7C601A14 */ add r3, r0, r3
/* 00004F50 A8630000 */ lha r3, 0(r3)
/* 00004F54 4BFFB1F9 */ bl u_play_sound_0
lbl_00004F58:
/* 00004F58 8001000C */ lwz r0, 0xc(r1)
/* 00004F5C 38210008 */ addi r1, r1, 8
/* 00004F60 7C0803A6 */ mtlr r0
/* 00004F64 4E800020 */ blr 
lbl_00004F68:
/* 00004F68 7C0802A6 */ mflr r0
/* 00004F6C 3C800000 */ lis r4, lbl_0000C7BC@ha
/* 00004F70 90010004 */ stw r0, 4(r1)
/* 00004F74 38040000 */ addi r0, r4, lbl_0000C7BC@l
/* 00004F78 9421FFF8 */ stwu r1, -8(r1)
/* 00004F7C 88A30148 */ lbz r5, 0x148(r3)
/* 00004F80 54A4103A */ slwi r4, r5, 2
/* 00004F84 7C802214 */ add r4, r0, r4
/* 00004F88 81840000 */ lwz r12, 0(r4)
/* 00004F8C 7D8803A6 */ mtlr r12
/* 00004F90 4E800021 */ blrl 
/* 00004F94 48001C01 */ bl lbl_00006B94
/* 00004F98 8001000C */ lwz r0, 0xc(r1)
/* 00004F9C 38210008 */ addi r1, r1, 8
/* 00004FA0 7C0803A6 */ mtlr r0
/* 00004FA4 4E800020 */ blr 
lbl_00004FA8:
/* 00004FA8 7C0802A6 */ mflr r0
/* 00004FAC 38A00000 */ li r5, 0
/* 00004FB0 90010004 */ stw r0, 4(r1)
/* 00004FB4 9421FF90 */ stwu r1, -0x70(r1)
/* 00004FB8 93E1006C */ stw r31, 0x6c(r1)
/* 00004FBC 3BE30000 */ addi r31, r3, 0
/* 00004FC0 3881000C */ addi r4, r1, 0xc
/* 00004FC4 48001161 */ bl lbl_00006124
/* 00004FC8 387F0000 */ addi r3, r31, 0
/* 00004FCC 3881000C */ addi r4, r1, 0xc
/* 00004FD0 38A00000 */ li r5, 0
/* 00004FD4 4BFFB179 */ bl handle_ball_rotational_kinematics
/* 00004FD8 387F0000 */ addi r3, r31, 0
/* 00004FDC 3881000C */ addi r4, r1, 0xc
/* 00004FE0 38A00000 */ li r5, 0
/* 00004FE4 4BFFB169 */ bl update_ball_ape_transform
/* 00004FE8 807F0080 */ lwz r3, 0x80(r31)
/* 00004FEC 38030001 */ addi r0, r3, 1
/* 00004FF0 901F0080 */ stw r0, 0x80(r31)
/* 00004FF4 80010074 */ lwz r0, 0x74(r1)
/* 00004FF8 83E1006C */ lwz r31, 0x6c(r1)
/* 00004FFC 38210070 */ addi r1, r1, 0x70
/* 00005000 7C0803A6 */ mtlr r0
/* 00005004 4E800020 */ blr 
lbl_00005008:
/* 00005008 7C0802A6 */ mflr r0
/* 0000500C 90010004 */ stw r0, 4(r1)
/* 00005010 9421FFE8 */ stwu r1, -0x18(r1)
/* 00005014 93E10014 */ stw r31, 0x14(r1)
/* 00005018 7C7F1B78 */ mr r31, r3
/* 0000501C 480007F1 */ bl lbl_0000580C
/* 00005020 38000002 */ li r0, 2
/* 00005024 981F0148 */ stb r0, 0x148(r31)
/* 00005028 7FE3FB78 */ mr r3, r31
/* 0000502C 48000019 */ bl lbl_00005044
/* 00005030 8001001C */ lwz r0, 0x1c(r1)
/* 00005034 83E10014 */ lwz r31, 0x14(r1)
/* 00005038 38210018 */ addi r1, r1, 0x18
/* 0000503C 7C0803A6 */ mtlr r0
/* 00005040 4E800020 */ blr 
lbl_00005044:
/* 00005044 7C0802A6 */ mflr r0
/* 00005048 90010004 */ stw r0, 4(r1)
/* 0000504C 9421FF90 */ stwu r1, -0x70(r1)
/* 00005050 93E1006C */ stw r31, 0x6c(r1)
/* 00005054 7C7F1B78 */ mr r31, r3
/* 00005058 480007CD */ bl lbl_00005824
/* 0000505C 387F0000 */ addi r3, r31, 0
/* 00005060 3881000C */ addi r4, r1, 0xc
/* 00005064 38A00000 */ li r5, 0
/* 00005068 48001429 */ bl lbl_00006490
/* 0000506C 387F0000 */ addi r3, r31, 0
/* 00005070 3881000C */ addi r4, r1, 0xc
/* 00005074 38A00000 */ li r5, 0
/* 00005078 4BFFB0D5 */ bl update_ball_ape_transform
/* 0000507C 807F0080 */ lwz r3, 0x80(r31)
/* 00005080 38030001 */ addi r0, r3, 1
/* 00005084 901F0080 */ stw r0, 0x80(r31)
/* 00005088 80010074 */ lwz r0, 0x74(r1)
/* 0000508C 83E1006C */ lwz r31, 0x6c(r1)
/* 00005090 38210070 */ addi r1, r1, 0x70
/* 00005094 7C0803A6 */ mtlr r0
/* 00005098 4E800020 */ blr 
lbl_0000509C:
/* 0000509C 7C0802A6 */ mflr r0
/* 000050A0 3CA00000 */ lis r5, lbl_0000BE80@ha
/* 000050A4 90010004 */ stw r0, 4(r1)
/* 000050A8 38A50000 */ addi r5, r5, lbl_0000BE80@l
/* 000050AC 3C800000 */ lis r4, lbl_802F1FDC@ha
/* 000050B0 9421FF90 */ stwu r1, -0x70(r1)
/* 000050B4 93E1006C */ stw r31, 0x6c(r1)
/* 000050B8 7C7F1B78 */ mr r31, r3
/* 000050BC C80501B0 */ lfd f0, 0x1b0(r5)
/* 000050C0 C4240000 */ lfsu f1, lbl_802F1FDC@l(r4)
/* 000050C4 FC010040 */ fcmpo cr0, f1, f0
/* 000050C8 4081008C */ ble lbl_00005154
/* 000050CC 3C600000 */ lis r3, lbl_10000018@ha
/* 000050D0 A8030000 */ lha r0, lbl_10000018@l(r3)
/* 000050D4 2C000000 */ cmpwi r0, 0
/* 000050D8 40820018 */ bne lbl_000050F0
/* 000050DC C80502A0 */ lfd f0, 0x2a0(r5)
/* 000050E0 FC010028 */ fsub f0, f1, f0
/* 000050E4 FC000018 */ frsp f0, f0
/* 000050E8 D0040000 */ stfs f0, 0(r4)
/* 000050EC 48000014 */ b lbl_00005100
lbl_000050F0:
/* 000050F0 C8050308 */ lfd f0, 0x308(r5)
/* 000050F4 FC010028 */ fsub f0, f1, f0
/* 000050F8 FC000018 */ frsp f0, f0
/* 000050FC D0040000 */ stfs f0, 0(r4)
lbl_00005100:
/* 00005100 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00005104 C80501B0 */ lfd f0, 0x1b0(r5)
/* 00005108 38830000 */ addi r4, r3, lbl_802F1FDC@l
/* 0000510C C0240000 */ lfs f1, 0(r4)
/* 00005110 FC010040 */ fcmpo cr0, f1, f0
/* 00005114 4C401382 */ cror 2, 0, 2
/* 00005118 4082003C */ bne lbl_00005154
/* 0000511C C0050030 */ lfs f0, 0x30(r5)
/* 00005120 386000F1 */ li r3, 0xf1
/* 00005124 D0040000 */ stfs f0, 0(r4)
/* 00005128 4BFFB025 */ bl u_play_sound_0
/* 0000512C 889F002E */ lbz r4, 0x2e(r31)
/* 00005130 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00005134 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00005138 7C830774 */ extsb r3, r4
/* 0000513C 5463103A */ slwi r3, r3, 2
/* 00005140 7C601A14 */ add r3, r0, r3
/* 00005144 80630000 */ lwz r3, 0(r3)
/* 00005148 38800001 */ li r4, 1
/* 0000514C 38A0000A */ li r5, 0xa
/* 00005150 4BFFAFFD */ bl func_800B60F4
lbl_00005154:
/* 00005154 387F0000 */ addi r3, r31, 0
/* 00005158 3881000C */ addi r4, r1, 0xc
/* 0000515C 38A00000 */ li r5, 0
/* 00005160 4800153D */ bl lbl_0000669C
/* 00005164 387F0000 */ addi r3, r31, 0
/* 00005168 3881000C */ addi r4, r1, 0xc
/* 0000516C 38A00000 */ li r5, 0
/* 00005170 4BFFAFDD */ bl handle_ball_rotational_kinematics
/* 00005174 387F0000 */ addi r3, r31, 0
/* 00005178 3881000C */ addi r4, r1, 0xc
/* 0000517C 38A00000 */ li r5, 0
/* 00005180 4BFFAFCD */ bl update_ball_ape_transform
/* 00005184 807F0080 */ lwz r3, 0x80(r31)
/* 00005188 38030001 */ addi r0, r3, 1
/* 0000518C 901F0080 */ stw r0, 0x80(r31)
/* 00005190 80010074 */ lwz r0, 0x74(r1)
/* 00005194 83E1006C */ lwz r31, 0x6c(r1)
/* 00005198 38210070 */ addi r1, r1, 0x70
/* 0000519C 7C0803A6 */ mtlr r0
/* 000051A0 4E800020 */ blr 
lbl_000051A4:
/* 000051A4 7C0802A6 */ mflr r0
/* 000051A8 2C040003 */ cmpwi r4, 3
/* 000051AC 90010004 */ stw r0, 4(r1)
/* 000051B0 3CC00000 */ lis r6, lbl_0000BE80@ha
/* 000051B4 9421FFB8 */ stwu r1, -0x48(r1)
/* 000051B8 DBE10040 */ stfd f31, 0x40(r1)
/* 000051BC 93E1003C */ stw r31, 0x3c(r1)
/* 000051C0 3BE60000 */ addi r31, r6, lbl_0000BE80@l
/* 000051C4 93C10038 */ stw r30, 0x38(r1)
/* 000051C8 93A10034 */ stw r29, 0x34(r1)
/* 000051CC 7C7D1B78 */ mr r29, r3
/* 000051D0 93810030 */ stw r28, 0x30(r1)
/* 000051D4 880300C0 */ lbz r0, 0xc0(r3)
/* 000051D8 3C600000 */ lis r3, ballInfo@ha
/* 000051DC 7C000774 */ extsb r0, r0
/* 000051E0 1CA001A4 */ mulli r5, r0, 0x1a4
/* 000051E4 38030000 */ addi r0, r3, ballInfo@l
/* 000051E8 7FC02A14 */ add r30, r0, r5
/* 000051EC 41820008 */ beq lbl_000051F4
/* 000051F0 48000010 */ b lbl_00005200
lbl_000051F4:
/* 000051F4 7FA3EB78 */ mr r3, r29
/* 000051F8 4BFFAF55 */ bl u_ape_free
/* 000051FC 480001F4 */ b lbl_000053F0
lbl_00005200:
/* 00005200 3C600000 */ lis r3, gamePauseStatus@ha
/* 00005204 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00005208 7000000A */ andi. r0, r0, 0xa
/* 0000520C 408201E4 */ bne lbl_000053F0
/* 00005210 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00005214 80030000 */ lwz r0, currentBallStructPtr@l(r3)
/* 00005218 7C1E0040 */ cmplw r30, r0
/* 0000521C 408201D4 */ bne lbl_000053F0
/* 00005220 387E0004 */ addi r3, r30, 4
/* 00005224 38810010 */ addi r4, r1, 0x10
/* 00005228 38A00000 */ li r5, 0
/* 0000522C 4BFFAF21 */ bl raycast_stage_down
/* 00005230 807D0014 */ lwz r3, 0x14(r29)
/* 00005234 3800FFEC */ li r0, -20
/* 00005238 7C600038 */ and r0, r3, r0
/* 0000523C 901D0014 */ stw r0, 0x14(r29)
/* 00005240 80010010 */ lwz r0, 0x10(r1)
/* 00005244 540007FF */ clrlwi. r0, r0, 0x1f
/* 00005248 40820014 */ bne lbl_0000525C
/* 0000524C C03E0020 */ lfs f1, 0x20(r30)
/* 00005250 C01F0310 */ lfs f0, 0x310(r31)
/* 00005254 FC010040 */ fcmpo cr0, f1, f0
/* 00005258 41800028 */ blt lbl_00005280
lbl_0000525C:
/* 0000525C 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00005260 C83F01B0 */ lfd f1, 0x1b0(r31)
/* 00005264 C0030000 */ lfs f0, lbl_802F1FDC@l(r3)
/* 00005268 FC010000 */ fcmpu cr0, f1, f0
/* 0000526C 40820024 */ bne lbl_00005290
/* 00005270 3C600000 */ lis r3, lbl_10000018@ha
/* 00005274 A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00005278 2C000000 */ cmpwi r0, 0
/* 0000527C 41820014 */ beq lbl_00005290
lbl_00005280:
/* 00005280 801D0014 */ lwz r0, 0x14(r29)
/* 00005284 60000002 */ ori r0, r0, 2
/* 00005288 901D0014 */ stw r0, 0x14(r29)
/* 0000528C 4800003C */ b lbl_000052C8
lbl_00005290:
/* 00005290 387E00B8 */ addi r3, r30, 0xb8
/* 00005294 C0230000 */ lfs f1, 0(r3)
/* 00005298 C0430004 */ lfs f2, 4(r3)
/* 0000529C C0030008 */ lfs f0, 8(r3)
/* 000052A0 EC210072 */ fmuls f1, f1, f1
/* 000052A4 EC2208BA */ fmadds f1, f2, f2, f1
/* 000052A8 EC20083A */ fmadds f1, f0, f0, f1
/* 000052AC 4BFFAEA1 */ bl mathutil_sqrt
/* 000052B0 C01F0314 */ lfs f0, 0x314(r31)
/* 000052B4 FC010040 */ fcmpo cr0, f1, f0
/* 000052B8 40800010 */ bge lbl_000052C8
/* 000052BC 801D0014 */ lwz r0, 0x14(r29)
/* 000052C0 60000001 */ ori r0, r0, 1
/* 000052C4 901D0014 */ stw r0, 0x14(r29)
lbl_000052C8:
/* 000052C8 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 000052CC C81F01B0 */ lfd f0, 0x1b0(r31)
/* 000052D0 C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 000052D4 FC010040 */ fcmpo cr0, f1, f0
/* 000052D8 40810020 */ ble lbl_000052F8
/* 000052DC 387E0030 */ addi r3, r30, 0x30
/* 000052E0 4BFFAE6D */ bl mathutil_mtxA_from_mtx
/* 000052E4 3860C000 */ li r3, -16384
/* 000052E8 4BFFAE65 */ bl mathutil_mtxA_rotate_y
/* 000052EC 387D0060 */ addi r3, r29, 0x60
/* 000052F0 4BFFAE5D */ bl mathutil_mtxA_to_quat
/* 000052F4 48000058 */ b lbl_0000534C
lbl_000052F8:
/* 000052F8 801D0014 */ lwz r0, 0x14(r29)
/* 000052FC 387D0000 */ addi r3, r29, 0
/* 00005300 540007BE */ clrlwi r0, r0, 0x1e
/* 00005304 7C000034 */ cntlzw r0, r0
/* 00005308 541CD97E */ srwi r28, r0, 5
/* 0000530C 4BFFAE41 */ bl func_8003699C
/* 00005310 2C1C0000 */ cmpwi r28, 0
/* 00005314 41820014 */ beq lbl_00005328
/* 00005318 7FA3EB78 */ mr r3, r29
/* 0000531C 4BFFAE31 */ bl func_80036CAC
/* 00005320 FFE00890 */ fmr f31, f1
/* 00005324 48000028 */ b lbl_0000534C
lbl_00005328:
/* 00005328 C3FF0030 */ lfs f31, 0x30(r31)
/* 0000532C 387D0060 */ addi r3, r29, 0x60
/* 00005330 4BFFAE1D */ bl mathutil_mtxA_from_quat
/* 00005334 4BFFAE19 */ bl mathutil_mtxA_normalize_basis
/* 00005338 801D0014 */ lwz r0, 0x14(r29)
/* 0000533C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00005340 4182000C */ beq lbl_0000534C
/* 00005344 7FA3EB78 */ mr r3, r29
/* 00005348 4BFFAE05 */ bl func_80037718
lbl_0000534C:
/* 0000534C 801E0094 */ lwz r0, 0x94(r30)
/* 00005350 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00005354 41820028 */ beq lbl_0000537C
/* 00005358 387E001C */ addi r3, r30, 0x1c
/* 0000535C C0230000 */ lfs f1, 0(r3)
/* 00005360 C0430004 */ lfs f2, 4(r3)
/* 00005364 C0030008 */ lfs f0, 8(r3)
/* 00005368 EC210072 */ fmuls f1, f1, f1
/* 0000536C EC2208BA */ fmadds f1, f2, f2, f1
/* 00005370 EC20083A */ fmadds f1, f0, f0, f1
/* 00005374 4BFFADD9 */ bl mathutil_sqrt
/* 00005378 FFE00890 */ fmr f31, f1
lbl_0000537C:
/* 0000537C 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00005380 A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00005384 2C00000C */ cmpwi r0, 0xc
/* 00005388 40820010 */ bne lbl_00005398
/* 0000538C 7FA3EB78 */ mr r3, r29
/* 00005390 4BFFADBD */ bl func_80036EB8
/* 00005394 48000010 */ b lbl_000053A4
lbl_00005398:
/* 00005398 801E0094 */ lwz r0, 0x94(r30)
/* 0000539C 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 000053A0 901E0094 */ stw r0, 0x94(r30)
lbl_000053A4:
/* 000053A4 387D0060 */ addi r3, r29, 0x60
/* 000053A8 4BFFADA5 */ bl mathutil_mtxA_to_quat
/* 000053AC 7FA3EB78 */ mr r3, r29
/* 000053B0 FC20F890 */ fmr f1, f31
/* 000053B4 48000061 */ bl lbl_00005414
/* 000053B8 7FA3EB78 */ mr r3, r29
/* 000053BC 4BFFAD91 */ bl u_do_ape_anim
/* 000053C0 801D0014 */ lwz r0, 0x14(r29)
/* 000053C4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000053C8 4082000C */ bne lbl_000053D4
/* 000053CC 7FA3EB78 */ mr r3, r29
/* 000053D0 4BFFAD7D */ bl func_8003765C
lbl_000053D4:
/* 000053D4 387D0000 */ addi r3, r29, 0
/* 000053D8 389E0104 */ addi r4, r30, 0x104
/* 000053DC 4BFFAD71 */ bl func_8008C090
/* 000053E0 38000000 */ li r0, 0
/* 000053E4 901E0100 */ stw r0, 0x100(r30)
/* 000053E8 C01F0030 */ lfs f0, 0x30(r31)
/* 000053EC D01E0110 */ stfs f0, 0x110(r30)
lbl_000053F0:
/* 000053F0 8001004C */ lwz r0, 0x4c(r1)
/* 000053F4 CBE10040 */ lfd f31, 0x40(r1)
/* 000053F8 83E1003C */ lwz r31, 0x3c(r1)
/* 000053FC 7C0803A6 */ mtlr r0
/* 00005400 83C10038 */ lwz r30, 0x38(r1)
/* 00005404 83A10034 */ lwz r29, 0x34(r1)
/* 00005408 83810030 */ lwz r28, 0x30(r1)
/* 0000540C 38210048 */ addi r1, r1, 0x48
/* 00005410 4E800020 */ blr 
lbl_00005414:
/* 00005414 7C0802A6 */ mflr r0
/* 00005418 3CA00000 */ lis r5, lbl_802F1FDC@ha
/* 0000541C 90010004 */ stw r0, 4(r1)
/* 00005420 3C800000 */ lis r4, lbl_0000C030@ha
/* 00005424 9421FFD0 */ stwu r1, -0x30(r1)
/* 00005428 DBE10028 */ stfd f31, 0x28(r1)
/* 0000542C FFE00890 */ fmr f31, f1
/* 00005430 93E10024 */ stw r31, 0x24(r1)
/* 00005434 93C10020 */ stw r30, 0x20(r1)
/* 00005438 3BC00000 */ li r30, 0
/* 0000543C 93A1001C */ stw r29, 0x1c(r1)
/* 00005440 3BA00000 */ li r29, 0
/* 00005444 93810018 */ stw r28, 0x18(r1)
/* 00005448 3B830000 */ addi r28, r3, 0
/* 0000544C 880300C0 */ lbz r0, 0xc0(r3)
/* 00005450 3C600000 */ lis r3, ballInfo@ha
/* 00005454 C0250000 */ lfs f1, lbl_802F1FDC@l(r5)
/* 00005458 3CA00000 */ lis r5, lbl_10000000@ha
/* 0000545C C8040000 */ lfd f0, lbl_0000C030@l(r4)
/* 00005460 7C000774 */ extsb r0, r0
/* 00005464 1C8001A4 */ mulli r4, r0, 0x1a4
/* 00005468 FC010040 */ fcmpo cr0, f1, f0
/* 0000546C 38030000 */ addi r0, r3, ballInfo@l
/* 00005470 38A50000 */ addi r5, r5, lbl_10000000@l
/* 00005474 7C602214 */ add r3, r0, r4
/* 00005478 408100C4 */ ble lbl_0000553C
/* 0000547C 3C800000 */ lis r4, lbl_802F1FD0@ha
/* 00005480 38840000 */ addi r4, r4, lbl_802F1FD0@l
/* 00005484 80840000 */ lwz r4, 0(r4)
/* 00005488 548006B5 */ rlwinm. r0, r4, 0, 0x1a, 0x1a
/* 0000548C 41820030 */ beq lbl_000054BC
/* 00005490 80030094 */ lwz r0, 0x94(r3)
/* 00005494 3BE0000C */ li r31, 0xc
/* 00005498 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000549C 40820010 */ bne lbl_000054AC
/* 000054A0 88030003 */ lbz r0, 3(r3)
/* 000054A4 7C000775 */ extsb. r0, r0
/* 000054A8 4082000C */ bne lbl_000054B4
lbl_000054AC:
/* 000054AC 3BC00006 */ li r30, 6
/* 000054B0 48000300 */ b lbl_000057B0
lbl_000054B4:
/* 000054B4 3BC00002 */ li r30, 2
/* 000054B8 480002F8 */ b lbl_000057B0
lbl_000054BC:
/* 000054BC A8050018 */ lha r0, 0x18(r5)
/* 000054C0 2C000000 */ cmpwi r0, 0
/* 000054C4 4082000C */ bne lbl_000054D0
/* 000054C8 70800022 */ andi. r0, r4, 0x22
/* 000054CC 41820010 */ beq lbl_000054DC
lbl_000054D0:
/* 000054D0 3BE0000C */ li r31, 0xc
/* 000054D4 3BC00002 */ li r30, 2
/* 000054D8 480002D8 */ b lbl_000057B0
lbl_000054DC:
/* 000054DC 8803002E */ lbz r0, 0x2e(r3)
/* 000054E0 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000054E4 3CA00000 */ lis r5, controllerInfo@ha
/* 000054E8 7C000774 */ extsb r0, r0
/* 000054EC 5404103A */ slwi r4, r0, 2
/* 000054F0 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000054F4 7C602214 */ add r3, r0, r4
/* 000054F8 80030000 */ lwz r0, 0(r3)
/* 000054FC 38650000 */ addi r3, r5, controllerInfo@l
/* 00005500 3BE0000C */ li r31, 0xc
/* 00005504 1C00003C */ mulli r0, r0, 0x3c
/* 00005508 7C630214 */ add r3, r3, r0
/* 0000550C 88030002 */ lbz r0, 2(r3)
/* 00005510 7C000774 */ extsb r0, r0
/* 00005514 2C00FFE2 */ cmpwi r0, -30
/* 00005518 4080000C */ bge lbl_00005524
/* 0000551C 3BC00008 */ li r30, 8
/* 00005520 48000290 */ b lbl_000057B0
lbl_00005524:
/* 00005524 2C00001E */ cmpwi r0, 0x1e
/* 00005528 4081000C */ ble lbl_00005534
/* 0000552C 3BC00009 */ li r30, 9
/* 00005530 48000280 */ b lbl_000057B0
lbl_00005534:
/* 00005534 3BC00000 */ li r30, 0
/* 00005538 48000278 */ b lbl_000057B0
lbl_0000553C:
/* 0000553C 3C800000 */ lis r4, lbl_802F1FD0@ha
/* 00005540 80040000 */ lwz r0, lbl_802F1FD0@l(r4)
/* 00005544 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00005548 4182003C */ beq lbl_00005584
/* 0000554C A8050018 */ lha r0, 0x18(r5)
/* 00005550 2C000000 */ cmpwi r0, 0
/* 00005554 40820030 */ bne lbl_00005584
/* 00005558 80030094 */ lwz r0, 0x94(r3)
/* 0000555C 3BE0000C */ li r31, 0xc
/* 00005560 540007FF */ clrlwi. r0, r0, 0x1f
/* 00005564 40820010 */ bne lbl_00005574
/* 00005568 88030003 */ lbz r0, 3(r3)
/* 0000556C 7C000775 */ extsb. r0, r0
/* 00005570 4082000C */ bne lbl_0000557C
lbl_00005574:
/* 00005574 3BC00007 */ li r30, 7
/* 00005578 48000238 */ b lbl_000057B0
lbl_0000557C:
/* 0000557C 3BC00003 */ li r30, 3
/* 00005580 48000230 */ b lbl_000057B0
lbl_00005584:
/* 00005584 3C800000 */ lis r4, lbl_802F1FF6@ha
/* 00005588 A8040000 */ lha r0, lbl_802F1FF6@l(r4)
/* 0000558C 2C000016 */ cmpwi r0, 0x16
/* 00005590 40820084 */ bne lbl_00005614
/* 00005594 3C800000 */ lis r4, lbl_802F1FD0@ha
/* 00005598 80040000 */ lwz r0, lbl_802F1FD0@l(r4)
/* 0000559C 540007FF */ clrlwi. r0, r0, 0x1f
/* 000055A0 41820074 */ beq lbl_00005614
/* 000055A4 80050074 */ lwz r0, 0x74(r5)
/* 000055A8 3BE00005 */ li r31, 5
/* 000055AC 2C0001F4 */ cmpwi r0, 0x1f4
/* 000055B0 4180000C */ blt lbl_000055BC
/* 000055B4 3BC0000C */ li r30, 0xc
/* 000055B8 480001F8 */ b lbl_000057B0
lbl_000055BC:
/* 000055BC 2C00012C */ cmpwi r0, 0x12c
/* 000055C0 4180000C */ blt lbl_000055CC
/* 000055C4 3BC0000A */ li r30, 0xa
/* 000055C8 480001E8 */ b lbl_000057B0
lbl_000055CC:
/* 000055CC 2C0000C8 */ cmpwi r0, 0xc8
/* 000055D0 4180000C */ blt lbl_000055DC
/* 000055D4 3BC00008 */ li r30, 8
/* 000055D8 480001D8 */ b lbl_000057B0
lbl_000055DC:
/* 000055DC 2C000064 */ cmpwi r0, 0x64
/* 000055E0 4180000C */ blt lbl_000055EC
/* 000055E4 3BC00006 */ li r30, 6
/* 000055E8 480001C8 */ b lbl_000057B0
lbl_000055EC:
/* 000055EC 2C000032 */ cmpwi r0, 0x32
/* 000055F0 4180000C */ blt lbl_000055FC
/* 000055F4 3BC00004 */ li r30, 4
/* 000055F8 480001B8 */ b lbl_000057B0
lbl_000055FC:
/* 000055FC 2C000028 */ cmpwi r0, 0x28
/* 00005600 4180000C */ blt lbl_0000560C
/* 00005604 3BC00002 */ li r30, 2
/* 00005608 480001A8 */ b lbl_000057B0
lbl_0000560C:
/* 0000560C 3BC00000 */ li r30, 0
/* 00005610 480001A0 */ b lbl_000057B0
lbl_00005614:
/* 00005614 80BC0014 */ lwz r5, 0x14(r28)
/* 00005618 54A005EF */ rlwinm. r0, r5, 0, 0x17, 0x17
/* 0000561C 4182001C */ beq lbl_00005638
/* 00005620 387C0000 */ addi r3, r28, 0
/* 00005624 3BE00001 */ li r31, 1
/* 00005628 3BA00006 */ li r29, 6
/* 0000562C 38800000 */ li r4, 0
/* 00005630 4BFFAB1D */ bl u_switch_ape_character_lod_maybe
/* 00005634 4800017C */ b lbl_000057B0
lbl_00005638:
/* 00005638 54A00529 */ rlwinm. r0, r5, 0, 0x14, 0x14
/* 0000563C 41820010 */ beq lbl_0000564C
/* 00005640 3BE00002 */ li r31, 2
/* 00005644 3BC0000D */ li r30, 0xd
/* 00005648 48000168 */ b lbl_000057B0
lbl_0000564C:
/* 0000564C 54A0035B */ rlwinm. r0, r5, 0, 0xd, 0xd
/* 00005650 41820010 */ beq lbl_00005660
/* 00005654 3BE00002 */ li r31, 2
/* 00005658 3BC00010 */ li r30, 0x10
/* 0000565C 48000154 */ b lbl_000057B0
lbl_00005660:
/* 00005660 3C800000 */ lis r4, gameSubmode@ha
/* 00005664 A8040000 */ lha r0, gameSubmode@l(r4)
/* 00005668 2C00004B */ cmpwi r0, 0x4b
/* 0000566C 40820010 */ bne lbl_0000567C
/* 00005670 3BE00005 */ li r31, 5
/* 00005674 3BC0000C */ li r30, 0xc
/* 00005678 48000138 */ b lbl_000057B0
lbl_0000567C:
/* 0000567C 80830094 */ lwz r4, 0x94(r3)
/* 00005680 54800463 */ rlwinm. r0, r4, 0, 0x11, 0x11
/* 00005684 41820040 */ beq lbl_000056C4
/* 00005688 3C800000 */ lis r4, lbl_802F1FF0@ha
/* 0000568C 80040000 */ lwz r0, lbl_802F1FF0@l(r4)
/* 00005690 2C000018 */ cmpwi r0, 0x18
/* 00005694 41800154 */ blt lbl_000057E8
/* 00005698 60A01000 */ ori r0, r5, 0x1000
/* 0000569C 901C0014 */ stw r0, 0x14(r28)
/* 000056A0 3BE00002 */ li r31, 2
/* 000056A4 3BC0000C */ li r30, 0xc
/* 000056A8 801C0014 */ lwz r0, 0x14(r28)
/* 000056AC 540004A5 */ rlwinm. r0, r0, 0, 0x12, 0x12
/* 000056B0 41820100 */ beq lbl_000057B0
/* 000056B4 80030094 */ lwz r0, 0x94(r3)
/* 000056B8 540004A0 */ rlwinm r0, r0, 0, 0x12, 0x10
/* 000056BC 90030094 */ stw r0, 0x94(r3)
/* 000056C0 480000F0 */ b lbl_000057B0
lbl_000056C4:
/* 000056C4 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 000056C8 4182000C */ beq lbl_000056D4
/* 000056CC 3BE00003 */ li r31, 3
/* 000056D0 480000E0 */ b lbl_000057B0
lbl_000056D4:
/* 000056D4 54800421 */ rlwinm. r0, r4, 0, 0x10, 0x10
/* 000056D8 41820034 */ beq lbl_0000570C
/* 000056DC 3C600000 */ lis r3, infoWork@ha
/* 000056E0 84030000 */ lwzu r0, infoWork@l(r3)
/* 000056E4 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 000056E8 40820018 */ bne lbl_00005700
/* 000056EC A8030020 */ lha r0, 0x20(r3)
/* 000056F0 3BE00009 */ li r31, 9
/* 000056F4 540307FE */ clrlwi r3, r0, 0x1f
/* 000056F8 3BC30001 */ addi r30, r3, 1
/* 000056FC 480000B4 */ b lbl_000057B0
lbl_00005700:
/* 00005700 3BE00009 */ li r31, 9
/* 00005704 3BC00000 */ li r30, 0
/* 00005708 480000A8 */ b lbl_000057B0
lbl_0000570C:
/* 0000570C 548006B5 */ rlwinm. r0, r4, 0, 0x1a, 0x1a
/* 00005710 41820038 */ beq lbl_00005748
/* 00005714 548006F2 */ rlwinm r0, r4, 0, 0x1b, 0x19
/* 00005718 90030094 */ stw r0, 0x94(r3)
/* 0000571C 3863001C */ addi r3, r3, 0x1c
/* 00005720 3BE00004 */ li r31, 4
/* 00005724 C0230000 */ lfs f1, 0(r3)
/* 00005728 C0430004 */ lfs f2, 4(r3)
/* 0000572C C0030008 */ lfs f0, 8(r3)
/* 00005730 EC210072 */ fmuls f1, f1, f1
/* 00005734 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005738 EC20083A */ fmadds f1, f0, f0, f1
/* 0000573C 4BFFAA11 */ bl mathutil_sqrt
/* 00005740 FFE00890 */ fmr f31, f1
/* 00005744 4800006C */ b lbl_000057B0
lbl_00005748:
/* 00005748 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 0000574C 41820010 */ beq lbl_0000575C
/* 00005750 83DC0054 */ lwz r30, 0x54(r28)
/* 00005754 3BE00002 */ li r31, 2
/* 00005758 48000058 */ b lbl_000057B0
lbl_0000575C:
/* 0000575C 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00005760 4182004C */ beq lbl_000057AC
/* 00005764 548007FF */ clrlwi. r0, r4, 0x1f
/* 00005768 3BE00001 */ li r31, 1
/* 0000576C 41820034 */ beq lbl_000057A0
/* 00005770 80BC0054 */ lwz r5, 0x54(r28)
/* 00005774 3C004330 */ lis r0, 0x4330
/* 00005778 3C800000 */ lis r4, lbl_0000BEE0@ha
/* 0000577C 6CA38000 */ xoris r3, r5, 0x8000
/* 00005780 90610014 */ stw r3, 0x14(r1)
/* 00005784 38650001 */ addi r3, r5, 1
/* 00005788 907C0054 */ stw r3, 0x54(r28)
/* 0000578C 90010010 */ stw r0, 0x10(r1)
/* 00005790 C8240000 */ lfd f1, lbl_0000BEE0@l(r4)
/* 00005794 C8010010 */ lfd f0, 0x10(r1)
/* 00005798 EFE00828 */ fsubs f31, f0, f1
/* 0000579C 48000014 */ b lbl_000057B0
lbl_000057A0:
/* 000057A0 3C600000 */ lis r3, lbl_0000BEB0@ha
/* 000057A4 C3E30000 */ lfs f31, lbl_0000BEB0@l(r3)
/* 000057A8 48000008 */ b lbl_000057B0
lbl_000057AC:
/* 000057AC 3BE00000 */ li r31, 0
lbl_000057B0:
/* 000057B0 2C1F0001 */ cmpwi r31, 1
/* 000057B4 40820014 */ bne lbl_000057C8
/* 000057B8 3C600000 */ lis r3, gameSubmode@ha
/* 000057BC A8030000 */ lha r0, gameSubmode@l(r3)
/* 000057C0 2C000031 */ cmpwi r0, 0x31
/* 000057C4 4082000C */ bne lbl_000057D0
lbl_000057C8:
/* 000057C8 38000000 */ li r0, 0
/* 000057CC 901C0054 */ stw r0, 0x54(r28)
lbl_000057D0:
/* 000057D0 FC20F890 */ fmr f1, f31
/* 000057D4 387C0000 */ addi r3, r28, 0
/* 000057D8 389F0000 */ addi r4, r31, 0
/* 000057DC 38BE0000 */ addi r5, r30, 0
/* 000057E0 38DD0000 */ addi r6, r29, 0
/* 000057E4 4BFFA969 */ bl u_set_ape_anim
lbl_000057E8:
/* 000057E8 80010034 */ lwz r0, 0x34(r1)
/* 000057EC CBE10028 */ lfd f31, 0x28(r1)
/* 000057F0 83E10024 */ lwz r31, 0x24(r1)
/* 000057F4 7C0803A6 */ mtlr r0
/* 000057F8 83C10020 */ lwz r30, 0x20(r1)
/* 000057FC 83A1001C */ lwz r29, 0x1c(r1)
/* 00005800 83810018 */ lwz r28, 0x18(r1)
/* 00005804 38210030 */ addi r1, r1, 0x30
/* 00005808 4E800020 */ blr 
lbl_0000580C:
/* 0000580C 3C600000 */ lis r3, lbl_0000BEB4@ha
/* 00005810 38830000 */ addi r4, r3, lbl_0000BEB4@l
/* 00005814 C0040000 */ lfs f0, 0(r4)
/* 00005818 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 0000581C D0030000 */ stfs f0, lbl_802F1FDC@l(r3)
/* 00005820 4E800020 */ blr 
lbl_00005824:
/* 00005824 7C0802A6 */ mflr r0
/* 00005828 3C800000 */ lis r4, lbl_0000BE80@ha
/* 0000582C 90010004 */ stw r0, 4(r1)
/* 00005830 3CC00000 */ lis r6, lbl_10000000@ha
/* 00005834 9421FEF0 */ stwu r1, -0x110(r1)
/* 00005838 DBE10108 */ stfd f31, 0x108(r1)
/* 0000583C 93E10104 */ stw r31, 0x104(r1)
/* 00005840 3BE40000 */ addi r31, r4, lbl_0000BE80@l
/* 00005844 3C800000 */ lis r4, lbl_802F1FD0@ha
/* 00005848 93C10100 */ stw r30, 0x100(r1)
/* 0000584C 3BC60000 */ addi r30, r6, lbl_10000000@l
/* 00005850 93A100FC */ stw r29, 0xfc(r1)
/* 00005854 3BA30000 */ addi r29, r3, 0
/* 00005858 938100F8 */ stw r28, 0xf8(r1)
/* 0000585C 80BF0318 */ lwz r5, 0x318(r31)
/* 00005860 801F031C */ lwz r0, 0x31c(r31)
/* 00005864 90A100C8 */ stw r5, 0xc8(r1)
/* 00005868 900100CC */ stw r0, 0xcc(r1)
/* 0000586C 801F0320 */ lwz r0, 0x320(r31)
/* 00005870 900100D0 */ stw r0, 0xd0(r1)
/* 00005874 807F0324 */ lwz r3, 0x324(r31)
/* 00005878 801F0328 */ lwz r0, 0x328(r31)
/* 0000587C 906100BC */ stw r3, 0xbc(r1)
/* 00005880 900100C0 */ stw r0, 0xc0(r1)
/* 00005884 801F032C */ lwz r0, 0x32c(r31)
/* 00005888 900100C4 */ stw r0, 0xc4(r1)
/* 0000588C 807F0330 */ lwz r3, 0x330(r31)
/* 00005890 801F0334 */ lwz r0, 0x334(r31)
/* 00005894 906100B0 */ stw r3, 0xb0(r1)
/* 00005898 900100B4 */ stw r0, 0xb4(r1)
/* 0000589C 801F0338 */ lwz r0, 0x338(r31)
/* 000058A0 900100B8 */ stw r0, 0xb8(r1)
/* 000058A4 807F033C */ lwz r3, 0x33c(r31)
/* 000058A8 801F0340 */ lwz r0, 0x340(r31)
/* 000058AC 906100A4 */ stw r3, 0xa4(r1)
/* 000058B0 900100A8 */ stw r0, 0xa8(r1)
/* 000058B4 801F0344 */ lwz r0, 0x344(r31)
/* 000058B8 900100AC */ stw r0, 0xac(r1)
/* 000058BC 80040000 */ lwz r0, lbl_802F1FD0@l(r4)
/* 000058C0 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 000058C4 40820028 */ bne lbl_000058EC
/* 000058C8 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 000058CC C81F0198 */ lfd f0, 0x198(r31)
/* 000058D0 C4230000 */ lfsu f1, lbl_802F1FDC@l(r3)
/* 000058D4 FC010040 */ fcmpo cr0, f1, f0
/* 000058D8 40800014 */ bge lbl_000058EC
/* 000058DC C81F02A0 */ lfd f0, 0x2a0(r31)
/* 000058E0 FC01002A */ fadd f0, f1, f0
/* 000058E4 FC000018 */ frsp f0, f0
/* 000058E8 D0030000 */ stfs f0, 0(r3)
lbl_000058EC:
/* 000058EC 387D0030 */ addi r3, r29, 0x30
/* 000058F0 4BFFA85D */ bl mathutil_mtxA_from_mtx
/* 000058F4 386100A4 */ addi r3, r1, 0xa4
/* 000058F8 3881008C */ addi r4, r1, 0x8c
/* 000058FC 4BFFA851 */ bl mathutil_mtxA_tf_vec
/* 00005900 386100BC */ addi r3, r1, 0xbc
/* 00005904 38810074 */ addi r4, r1, 0x74
/* 00005908 4BFFA845 */ bl mathutil_mtxA_tf_vec
/* 0000590C 386100C8 */ addi r3, r1, 0xc8
/* 00005910 38810068 */ addi r4, r1, 0x68
/* 00005914 4BFFA839 */ bl mathutil_mtxA_tf_vec
/* 00005918 387D001C */ addi r3, r29, 0x1c
/* 0000591C 38810080 */ addi r4, r1, 0x80
/* 00005920 4BFFA82D */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00005924 C03D001C */ lfs f1, 0x1c(r29)
/* 00005928 C01E0068 */ lfs f0, 0x68(r30)
/* 0000592C EC010028 */ fsubs f0, f1, f0
/* 00005930 D001005C */ stfs f0, 0x5c(r1)
/* 00005934 C03D0020 */ lfs f1, 0x20(r29)
/* 00005938 C01E006C */ lfs f0, 0x6c(r30)
/* 0000593C EC010028 */ fsubs f0, f1, f0
/* 00005940 D0010060 */ stfs f0, 0x60(r1)
/* 00005944 C03D0024 */ lfs f1, 0x24(r29)
/* 00005948 C01E0070 */ lfs f0, 0x70(r30)
/* 0000594C EC010028 */ fsubs f0, f1, f0
/* 00005950 D0010064 */ stfs f0, 0x64(r1)
/* 00005954 C0A1005C */ lfs f5, 0x5c(r1)
/* 00005958 C041008C */ lfs f2, 0x8c(r1)
/* 0000595C C0810060 */ lfs f4, 0x60(r1)
/* 00005960 C0210090 */ lfs f1, 0x90(r1)
/* 00005964 C0610064 */ lfs f3, 0x64(r1)
/* 00005968 C0010094 */ lfs f0, 0x94(r1)
/* 0000596C EC4500B2 */ fmuls f2, f5, f2
/* 00005970 EC44107A */ fmadds f2, f4, f1, f2
/* 00005974 EC43103A */ fmadds f2, f3, f0, f2
/* 00005978 D05E0004 */ stfs f2, 4(r30)
/* 0000597C C03E0004 */ lfs f1, 4(r30)
/* 00005980 4BFFA7CD */ bl mathutil_sqrt
/* 00005984 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00005988 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 0000598C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00005990 41820010 */ beq lbl_000059A0
/* 00005994 C3FF0030 */ lfs f31, 0x30(r31)
/* 00005998 FC40F890 */ fmr f2, f31
/* 0000599C 4800007C */ b lbl_00005A18
lbl_000059A0:
/* 000059A0 881D002E */ lbz r0, 0x2e(r29)
/* 000059A4 3CA00000 */ lis r5, controllerInfo@ha
/* 000059A8 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000059AC 7C000774 */ extsb r0, r0
/* 000059B0 5404103A */ slwi r4, r0, 2
/* 000059B4 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000059B8 7C602214 */ add r3, r0, r4
/* 000059BC 80030000 */ lwz r0, 0(r3)
/* 000059C0 3C800000 */ lis r4, lbl_0000BEE0@ha
/* 000059C4 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 000059C8 C8840000 */ lfd f4, lbl_0000BEE0@l(r4)
/* 000059CC 1C00003C */ mulli r0, r0, 0x3c
/* 000059D0 C8430000 */ lfd f2, lbl_0000BEE0@l(r3)
/* 000059D4 38A50000 */ addi r5, r5, controllerInfo@l
/* 000059D8 7CC50214 */ add r6, r5, r0
/* 000059DC 88A60002 */ lbz r5, 2(r6)
/* 000059E0 3C604330 */ lis r3, 0x4330
/* 000059E4 88060003 */ lbz r0, 3(r6)
/* 000059E8 7CA50774 */ extsb r5, r5
/* 000059EC 7C000774 */ extsb r0, r0
/* 000059F0 6CA48000 */ xoris r4, r5, 0x8000
/* 000059F4 6C008000 */ xoris r0, r0, 0x8000
/* 000059F8 908100F4 */ stw r4, 0xf4(r1)
/* 000059FC 900100EC */ stw r0, 0xec(r1)
/* 00005A00 906100F0 */ stw r3, 0xf0(r1)
/* 00005A04 906100E8 */ stw r3, 0xe8(r1)
/* 00005A08 C86100F0 */ lfd f3, 0xf0(r1)
/* 00005A0C C80100E8 */ lfd f0, 0xe8(r1)
/* 00005A10 EFE32028 */ fsubs f31, f3, f4
/* 00005A14 EC401028 */ fsubs f2, f0, f2
lbl_00005A18:
/* 00005A18 EC420072 */ fmuls f2, f2, f1
/* 00005A1C C81F0358 */ lfd f0, 0x358(r31)
/* 00005A20 EFFF0072 */ fmuls f31, f31, f1
/* 00005A24 38610040 */ addi r3, r1, 0x40
/* 00005A28 388100C8 */ addi r4, r1, 0xc8
/* 00005A2C FC0000B2 */ fmul f0, f0, f2
/* 00005A30 FC00001E */ fctiwz f0, f0
/* 00005A34 D80100E8 */ stfd f0, 0xe8(r1)
/* 00005A38 80A100EC */ lwz r5, 0xec(r1)
/* 00005A3C 4BFFA711 */ bl mathutil_quat_from_axis_angle
/* 00005A40 C81F0360 */ lfd f0, 0x360(r31)
/* 00005A44 38610030 */ addi r3, r1, 0x30
/* 00005A48 388100B0 */ addi r4, r1, 0xb0
/* 00005A4C FC0007F2 */ fmul f0, f0, f31
/* 00005A50 FC00001E */ fctiwz f0, f0
/* 00005A54 D80100F0 */ stfd f0, 0xf0(r1)
/* 00005A58 80A100F4 */ lwz r5, 0xf4(r1)
/* 00005A5C 4BFFA6F1 */ bl mathutil_quat_from_axis_angle
/* 00005A60 38610040 */ addi r3, r1, 0x40
/* 00005A64 38830000 */ addi r4, r3, 0
/* 00005A68 38A10030 */ addi r5, r1, 0x30
/* 00005A6C 4BFFA6E1 */ bl mathutil_quat_mult
/* 00005A70 C81F0368 */ lfd f0, 0x368(r31)
/* 00005A74 38610030 */ addi r3, r1, 0x30
/* 00005A78 388100BC */ addi r4, r1, 0xbc
/* 00005A7C FC0007F2 */ fmul f0, f0, f31
/* 00005A80 FC00001E */ fctiwz f0, f0
/* 00005A84 D80100E0 */ stfd f0, 0xe0(r1)
/* 00005A88 80A100E4 */ lwz r5, 0xe4(r1)
/* 00005A8C 4BFFA6C1 */ bl mathutil_quat_from_axis_angle
/* 00005A90 38610040 */ addi r3, r1, 0x40
/* 00005A94 38830000 */ addi r4, r3, 0
/* 00005A98 38A10030 */ addi r5, r1, 0x30
/* 00005A9C 4BFFA6B1 */ bl mathutil_quat_mult
/* 00005AA0 38610040 */ addi r3, r1, 0x40
/* 00005AA4 4BFFA6A9 */ bl mathutil_mtxA_from_quat
/* 00005AA8 387D0030 */ addi r3, r29, 0x30
/* 00005AAC 4BFFA6A1 */ bl mathutil_mtxA_mult_left
/* 00005AB0 387D0030 */ addi r3, r29, 0x30
/* 00005AB4 4BFFA699 */ bl mathutil_mtxA_sq_to_mtx
/* 00005AB8 3C600000 */ lis r3, lbl_802F1FD8@ha
/* 00005ABC C81F01B0 */ lfd f0, 0x1b0(r31)
/* 00005AC0 38C30000 */ addi r6, r3, lbl_802F1FD8@l
/* 00005AC4 C0260000 */ lfs f1, 0(r6)
/* 00005AC8 FC010040 */ fcmpo cr0, f1, f0
/* 00005ACC 40810058 */ ble lbl_00005B24
/* 00005AD0 80BF0348 */ lwz r5, 0x348(r31)
/* 00005AD4 38610040 */ addi r3, r1, 0x40
/* 00005AD8 801F034C */ lwz r0, 0x34c(r31)
/* 00005ADC 38810024 */ addi r4, r1, 0x24
/* 00005AE0 90A10024 */ stw r5, 0x24(r1)
/* 00005AE4 90010028 */ stw r0, 0x28(r1)
/* 00005AE8 801F0350 */ lwz r0, 0x350(r31)
/* 00005AEC 9001002C */ stw r0, 0x2c(r1)
/* 00005AF0 C0260000 */ lfs f1, 0(r6)
/* 00005AF4 C81F0370 */ lfd f0, 0x370(r31)
/* 00005AF8 FC010032 */ fmul f0, f1, f0
/* 00005AFC FC000018 */ frsp f0, f0
/* 00005B00 D0060000 */ stfs f0, 0(r6)
/* 00005B04 C0260000 */ lfs f1, 0(r6)
/* 00005B08 4BFFA645 */ bl u_math_unk9_smth_w_quats
/* 00005B0C 38610040 */ addi r3, r1, 0x40
/* 00005B10 4BFFA63D */ bl mathutil_mtxA_from_quat
/* 00005B14 387D0030 */ addi r3, r29, 0x30
/* 00005B18 4BFFA635 */ bl mathutil_mtxA_mult_left
/* 00005B1C 387D0030 */ addi r3, r29, 0x30
/* 00005B20 4BFFA62D */ bl mathutil_mtxA_sq_to_mtx
lbl_00005B24:
/* 00005B24 3B8100C8 */ addi r28, r1, 0xc8
/* 00005B28 C0A10080 */ lfs f5, 0x80(r1)
/* 00005B2C C04100C8 */ lfs f2, 0xc8(r1)
/* 00005B30 C0810084 */ lfs f4, 0x84(r1)
/* 00005B34 C02100CC */ lfs f1, 0xcc(r1)
/* 00005B38 C0610088 */ lfs f3, 0x88(r1)
/* 00005B3C C00100D0 */ lfs f0, 0xd0(r1)
/* 00005B40 EC4500B2 */ fmuls f2, f5, f2
/* 00005B44 EC44107A */ fmadds f2, f4, f1, f2
/* 00005B48 EC43103A */ fmadds f2, f3, f0, f2
/* 00005B4C C81F0378 */ lfd f0, 0x378(r31)
/* 00005B50 38610040 */ addi r3, r1, 0x40
/* 00005B54 388100BC */ addi r4, r1, 0xbc
/* 00005B58 FC201050 */ fneg f1, f2
/* 00005B5C FC000072 */ fmul f0, f0, f1
/* 00005B60 FC00001E */ fctiwz f0, f0
/* 00005B64 D80100E0 */ stfd f0, 0xe0(r1)
/* 00005B68 80A100E4 */ lwz r5, 0xe4(r1)
/* 00005B6C 4BFFA5E1 */ bl mathutil_quat_from_axis_angle
/* 00005B70 C0A10080 */ lfs f5, 0x80(r1)
/* 00005B74 C04100BC */ lfs f2, 0xbc(r1)
/* 00005B78 C0810084 */ lfs f4, 0x84(r1)
/* 00005B7C C02100C0 */ lfs f1, 0xc0(r1)
/* 00005B80 C0610088 */ lfs f3, 0x88(r1)
/* 00005B84 C00100C4 */ lfs f0, 0xc4(r1)
/* 00005B88 ECA500B2 */ fmuls f5, f5, f2
/* 00005B8C ECA4287A */ fmadds f5, f4, f1, f5
/* 00005B90 ECA3283A */ fmadds f5, f3, f0, f5
/* 00005B94 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00005B98 C0030000 */ lfs f0, lbl_802F1FDC@l(r3)
/* 00005B9C 389C0000 */ addi r4, r28, 0
/* 00005BA0 C83F0380 */ lfd f1, 0x380(r31)
/* 00005BA4 FC210028 */ fsub f1, f1, f0
/* 00005BA8 C85F0230 */ lfd f2, 0x230(r31)
/* 00005BAC C81F0388 */ lfd f0, 0x388(r31)
/* 00005BB0 38610030 */ addi r3, r1, 0x30
/* 00005BB4 FC220072 */ fmul f1, f2, f1
/* 00005BB8 FC250072 */ fmul f1, f5, f1
/* 00005BBC FC200818 */ frsp f1, f1
/* 00005BC0 FC000072 */ fmul f0, f0, f1
/* 00005BC4 FC00001E */ fctiwz f0, f0
/* 00005BC8 D80100E8 */ stfd f0, 0xe8(r1)
/* 00005BCC 80A100EC */ lwz r5, 0xec(r1)
/* 00005BD0 4BFFA57D */ bl mathutil_quat_from_axis_angle
/* 00005BD4 38610040 */ addi r3, r1, 0x40
/* 00005BD8 38830000 */ addi r4, r3, 0
/* 00005BDC 38A10030 */ addi r5, r1, 0x30
/* 00005BE0 4BFFA56D */ bl mathutil_quat_mult
/* 00005BE4 C0A100BC */ lfs f5, 0xbc(r1)
/* 00005BE8 C0410068 */ lfs f2, 0x68(r1)
/* 00005BEC C08100C0 */ lfs f4, 0xc0(r1)
/* 00005BF0 C021006C */ lfs f1, 0x6c(r1)
/* 00005BF4 C06100C4 */ lfs f3, 0xc4(r1)
/* 00005BF8 C0010070 */ lfs f0, 0x70(r1)
/* 00005BFC EC4500B2 */ fmuls f2, f5, f2
/* 00005C00 EC44107A */ fmadds f2, f4, f1, f2
/* 00005C04 EC43103A */ fmadds f2, f3, f0, f2
/* 00005C08 C81F0390 */ lfd f0, 0x390(r31)
/* 00005C0C 38610030 */ addi r3, r1, 0x30
/* 00005C10 388100B0 */ addi r4, r1, 0xb0
/* 00005C14 FC201050 */ fneg f1, f2
/* 00005C18 FC000072 */ fmul f0, f0, f1
/* 00005C1C FC00001E */ fctiwz f0, f0
/* 00005C20 D80100F0 */ stfd f0, 0xf0(r1)
/* 00005C24 80A100F4 */ lwz r5, 0xf4(r1)
/* 00005C28 4BFFA525 */ bl mathutil_quat_from_axis_angle
/* 00005C2C 38610040 */ addi r3, r1, 0x40
/* 00005C30 38830000 */ addi r4, r3, 0
/* 00005C34 38A10030 */ addi r5, r1, 0x30
/* 00005C38 4BFFA515 */ bl mathutil_quat_mult
/* 00005C3C C0A100BC */ lfs f5, 0xbc(r1)
/* 00005C40 C041008C */ lfs f2, 0x8c(r1)
/* 00005C44 C08100C0 */ lfs f4, 0xc0(r1)
/* 00005C48 C0210090 */ lfs f1, 0x90(r1)
/* 00005C4C C06100C4 */ lfs f3, 0xc4(r1)
/* 00005C50 C0010094 */ lfs f0, 0x94(r1)
/* 00005C54 EC4500B2 */ fmuls f2, f5, f2
/* 00005C58 EC44107A */ fmadds f2, f4, f1, f2
/* 00005C5C EC43103A */ fmadds f2, f3, f0, f2
/* 00005C60 C81F0398 */ lfd f0, 0x398(r31)
/* 00005C64 389C0000 */ addi r4, r28, 0
/* 00005C68 38610030 */ addi r3, r1, 0x30
/* 00005C6C FC201050 */ fneg f1, f2
/* 00005C70 FC000072 */ fmul f0, f0, f1
/* 00005C74 FC00001E */ fctiwz f0, f0
/* 00005C78 D80100D8 */ stfd f0, 0xd8(r1)
/* 00005C7C 80A100DC */ lwz r5, 0xdc(r1)
/* 00005C80 4BFFA4CD */ bl mathutil_quat_from_axis_angle
/* 00005C84 38610040 */ addi r3, r1, 0x40
/* 00005C88 38830000 */ addi r4, r3, 0
/* 00005C8C 38A10030 */ addi r5, r1, 0x30
/* 00005C90 4BFFA4BD */ bl mathutil_quat_mult
/* 00005C94 38610040 */ addi r3, r1, 0x40
/* 00005C98 4BFFA4B5 */ bl mathutil_mtxA_from_quat
/* 00005C9C 387D0030 */ addi r3, r29, 0x30
/* 00005CA0 4BFFA4AD */ bl mathutil_mtxA_mult_left
/* 00005CA4 387D0030 */ addi r3, r29, 0x30
/* 00005CA8 4BFFA4A5 */ bl mathutil_mtxA_sq_to_mtx
/* 00005CAC 387D0030 */ addi r3, r29, 0x30
/* 00005CB0 4BFFA49D */ bl mathutil_mtxA_from_mtx
/* 00005CB4 3861005C */ addi r3, r1, 0x5c
/* 00005CB8 38810050 */ addi r4, r1, 0x50
/* 00005CBC 4BFFA491 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00005CC0 C0010058 */ lfs f0, 0x58(r1)
/* 00005CC4 C0210054 */ lfs f1, 0x54(r1)
/* 00005CC8 FC400050 */ fneg f2, f0
/* 00005CCC 4BFFA481 */ bl mathutil_atan2
/* 00005CD0 7C7C0734 */ extsh r28, r3
/* 00005CD4 5783083C */ slwi r3, r28, 1
/* 00005CD8 4BFFA475 */ bl mathutil_sin
/* 00005CDC FC000850 */ fneg f0, f1
/* 00005CE0 2C1C4000 */ cmpwi r28, 0x4000
/* 00005CE4 D01E0000 */ stfs f0, 0(r30)
/* 00005CE8 4181000C */ bgt lbl_00005CF4
/* 00005CEC 2C1CC000 */ cmpwi r28, -16384
/* 00005CF0 40800014 */ bge lbl_00005D04
lbl_00005CF4:
/* 00005CF4 C03E0000 */ lfs f1, 0(r30)
/* 00005CF8 C01F03A0 */ lfs f0, 0x3a0(r31)
/* 00005CFC EC010032 */ fmuls f0, f1, f0
/* 00005D00 D01E0000 */ stfs f0, 0(r30)
lbl_00005D04:
/* 00005D04 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00005D08 C01E0004 */ lfs f0, 4(r30)
/* 00005D0C C0630000 */ lfs f3, lbl_802F1FDC@l(r3)
/* 00005D10 387D001C */ addi r3, r29, 0x1c
/* 00005D14 C85F0198 */ lfd f2, 0x198(r31)
/* 00005D18 EC000032 */ fmuls f0, f0, f0
/* 00005D1C C03E0000 */ lfs f1, 0(r30)
/* 00005D20 FC431024 */ fdiv f2, f3, f2
/* 00005D24 C87F03A8 */ lfd f3, 0x3a8(r31)
/* 00005D28 EC010032 */ fmuls f0, f1, f0
/* 00005D2C FC020032 */ fmul f0, f2, f0
/* 00005D30 FC030032 */ fmul f0, f3, f0
/* 00005D34 FC000018 */ frsp f0, f0
/* 00005D38 D01E0000 */ stfs f0, 0(r30)
/* 00005D3C C0210074 */ lfs f1, 0x74(r1)
/* 00005D40 C01E0000 */ lfs f0, 0(r30)
/* 00005D44 EC010032 */ fmuls f0, f1, f0
/* 00005D48 D0010074 */ stfs f0, 0x74(r1)
/* 00005D4C C0210078 */ lfs f1, 0x78(r1)
/* 00005D50 C01E0000 */ lfs f0, 0(r30)
/* 00005D54 EC010032 */ fmuls f0, f1, f0
/* 00005D58 D0010078 */ stfs f0, 0x78(r1)
/* 00005D5C C021007C */ lfs f1, 0x7c(r1)
/* 00005D60 C01E0000 */ lfs f0, 0(r30)
/* 00005D64 EC010032 */ fmuls f0, f1, f0
/* 00005D68 D001007C */ stfs f0, 0x7c(r1)
/* 00005D6C C01D0004 */ lfs f0, 4(r29)
/* 00005D70 D01D0010 */ stfs f0, 0x10(r29)
/* 00005D74 C01D0008 */ lfs f0, 8(r29)
/* 00005D78 D01D0014 */ stfs f0, 0x14(r29)
/* 00005D7C C01D000C */ lfs f0, 0xc(r29)
/* 00005D80 D01D0018 */ stfs f0, 0x18(r29)
/* 00005D84 C0230000 */ lfs f1, 0(r3)
/* 00005D88 C0430004 */ lfs f2, 4(r3)
/* 00005D8C C0030008 */ lfs f0, 8(r3)
/* 00005D90 EC210072 */ fmuls f1, f1, f1
/* 00005D94 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005D98 EC20083A */ fmadds f1, f0, f0, f1
/* 00005D9C 4BFFA3B1 */ bl mathutil_sqrt
/* 00005DA0 D03D00F8 */ stfs f1, 0xf8(r29)
/* 00005DA4 801D0094 */ lwz r0, 0x94(r29)
/* 00005DA8 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00005DAC 901D0094 */ stw r0, 0x94(r29)
/* 00005DB0 C01F0030 */ lfs f0, 0x30(r31)
/* 00005DB4 D0010098 */ stfs f0, 0x98(r1)
/* 00005DB8 C01F03B0 */ lfs f0, 0x3b0(r31)
/* 00005DBC D001009C */ stfs f0, 0x9c(r1)
/* 00005DC0 C01F0030 */ lfs f0, 0x30(r31)
/* 00005DC4 D00100A0 */ stfs f0, 0xa0(r1)
/* 00005DC8 807D0094 */ lwz r3, 0x94(r29)
/* 00005DCC 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00005DD0 41820014 */ beq lbl_00005DE4
/* 00005DD4 C001009C */ lfs f0, 0x9c(r1)
/* 00005DD8 FC000050 */ fneg f0, f0
/* 00005DDC D001009C */ stfs f0, 0x9c(r1)
/* 00005DE0 48000014 */ b lbl_00005DF4
lbl_00005DE4:
/* 00005DE4 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00005DE8 4182000C */ beq lbl_00005DF4
/* 00005DEC C01F0030 */ lfs f0, 0x30(r31)
/* 00005DF0 D001009C */ stfs f0, 0x9c(r1)
lbl_00005DF4:
/* 00005DF4 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00005DF8 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00005DFC 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00005E00 40820118 */ bne lbl_00005F18
/* 00005E04 C03E0068 */ lfs f1, 0x68(r30)
/* 00005E08 387D0030 */ addi r3, r29, 0x30
/* 00005E0C C01D001C */ lfs f0, 0x1c(r29)
/* 00005E10 EC010028 */ fsubs f0, f1, f0
/* 00005E14 D0010050 */ stfs f0, 0x50(r1)
/* 00005E18 C03E006C */ lfs f1, 0x6c(r30)
/* 00005E1C C01D0020 */ lfs f0, 0x20(r29)
/* 00005E20 EC010028 */ fsubs f0, f1, f0
/* 00005E24 D0010054 */ stfs f0, 0x54(r1)
/* 00005E28 C03E0070 */ lfs f1, 0x70(r30)
/* 00005E2C C01D0024 */ lfs f0, 0x24(r29)
/* 00005E30 EC010028 */ fsubs f0, f1, f0
/* 00005E34 D0010058 */ stfs f0, 0x58(r1)
/* 00005E38 4BFFA315 */ bl mathutil_mtxA_from_mtx
/* 00005E3C 38610050 */ addi r3, r1, 0x50
/* 00005E40 38830000 */ addi r4, r3, 0
/* 00005E44 4BFFA309 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00005E48 C0210054 */ lfs f1, 0x54(r1)
/* 00005E4C 38610050 */ addi r3, r1, 0x50
/* 00005E50 C81F03B8 */ lfd f0, 0x3b8(r31)
/* 00005E54 7C641B78 */ mr r4, r3
/* 00005E58 FC010032 */ fmul f0, f1, f0
/* 00005E5C FC000018 */ frsp f0, f0
/* 00005E60 D0010054 */ stfs f0, 0x54(r1)
/* 00005E64 C0210058 */ lfs f1, 0x58(r1)
/* 00005E68 C81F03B8 */ lfd f0, 0x3b8(r31)
/* 00005E6C FC010032 */ fmul f0, f1, f0
/* 00005E70 FC000018 */ frsp f0, f0
/* 00005E74 D0010058 */ stfs f0, 0x58(r1)
/* 00005E78 4BFFA2D5 */ bl mathutil_mtxA_tf_vec
/* 00005E7C C83F03C0 */ lfd f1, 0x3c0(r31)
/* 00005E80 C0010050 */ lfs f0, 0x50(r1)
/* 00005E84 C0A10098 */ lfs f5, 0x98(r1)
/* 00005E88 FC610032 */ fmul f3, f1, f0
/* 00005E8C C0410074 */ lfs f2, 0x74(r1)
/* 00005E90 C0210078 */ lfs f1, 0x78(r1)
/* 00005E94 C001007C */ lfs f0, 0x7c(r1)
/* 00005E98 FC601818 */ frsp f3, f3
/* 00005E9C D0610050 */ stfs f3, 0x50(r1)
/* 00005EA0 C89F03C0 */ lfd f4, 0x3c0(r31)
/* 00005EA4 C0610054 */ lfs f3, 0x54(r1)
/* 00005EA8 FC6400F2 */ fmul f3, f4, f3
/* 00005EAC FC601818 */ frsp f3, f3
/* 00005EB0 D0610054 */ stfs f3, 0x54(r1)
/* 00005EB4 C89F03C0 */ lfd f4, 0x3c0(r31)
/* 00005EB8 C0610058 */ lfs f3, 0x58(r1)
/* 00005EBC FC6400F2 */ fmul f3, f4, f3
/* 00005EC0 FC601818 */ frsp f3, f3
/* 00005EC4 D0610058 */ stfs f3, 0x58(r1)
/* 00005EC8 C0610050 */ lfs f3, 0x50(r1)
/* 00005ECC C0810054 */ lfs f4, 0x54(r1)
/* 00005ED0 ECA5182A */ fadds f5, f5, f3
/* 00005ED4 C0610058 */ lfs f3, 0x58(r1)
/* 00005ED8 D0A10098 */ stfs f5, 0x98(r1)
/* 00005EDC C0A1009C */ lfs f5, 0x9c(r1)
/* 00005EE0 EC85202A */ fadds f4, f5, f4
/* 00005EE4 D081009C */ stfs f4, 0x9c(r1)
/* 00005EE8 C08100A0 */ lfs f4, 0xa0(r1)
/* 00005EEC EC64182A */ fadds f3, f4, f3
/* 00005EF0 D06100A0 */ stfs f3, 0xa0(r1)
/* 00005EF4 C0610098 */ lfs f3, 0x98(r1)
/* 00005EF8 EC43102A */ fadds f2, f3, f2
/* 00005EFC D0410098 */ stfs f2, 0x98(r1)
/* 00005F00 C041009C */ lfs f2, 0x9c(r1)
/* 00005F04 EC22082A */ fadds f1, f2, f1
/* 00005F08 D021009C */ stfs f1, 0x9c(r1)
/* 00005F0C C02100A0 */ lfs f1, 0xa0(r1)
/* 00005F10 EC01002A */ fadds f0, f1, f0
/* 00005F14 D00100A0 */ stfs f0, 0xa0(r1)
lbl_00005F18:
/* 00005F18 807D0004 */ lwz r3, 4(r29)
/* 00005F1C 801D0008 */ lwz r0, 8(r29)
/* 00005F20 90610018 */ stw r3, 0x18(r1)
/* 00005F24 9001001C */ stw r0, 0x1c(r1)
/* 00005F28 801D000C */ lwz r0, 0xc(r29)
/* 00005F2C 90010020 */ stw r0, 0x20(r1)
/* 00005F30 C01F0030 */ lfs f0, 0x30(r31)
/* 00005F34 D001001C */ stfs f0, 0x1c(r1)
/* 00005F38 C0210018 */ lfs f1, 0x18(r1)
/* 00005F3C C041001C */ lfs f2, 0x1c(r1)
/* 00005F40 C0010020 */ lfs f0, 0x20(r1)
/* 00005F44 EC210072 */ fmuls f1, f1, f1
/* 00005F48 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005F4C EC20083A */ fmadds f1, f0, f0, f1
/* 00005F50 4BFFA1FD */ bl mathutil_sqrt
/* 00005F54 C85F03C8 */ lfd f2, 0x3c8(r31)
/* 00005F58 C81F01B0 */ lfd f0, 0x1b0(r31)
/* 00005F5C FFE11028 */ fsub f31, f1, f2
/* 00005F60 FFE0F818 */ frsp f31, f31
/* 00005F64 FC1F0040 */ fcmpo cr0, f31, f0
/* 00005F68 40810124 */ ble lbl_0000608C
/* 00005F6C 389D001C */ addi r4, r29, 0x1c
/* 00005F70 387D0004 */ addi r3, r29, 4
/* 00005F74 C0C30000 */ lfs f6, 0(r3)
/* 00005F78 C0640000 */ lfs f3, 0(r4)
/* 00005F7C C0A30004 */ lfs f5, 4(r3)
/* 00005F80 C0440004 */ lfs f2, 4(r4)
/* 00005F84 C0830008 */ lfs f4, 8(r3)
/* 00005F88 C0240008 */ lfs f1, 8(r4)
/* 00005F8C EC6600F2 */ fmuls f3, f6, f3
/* 00005F90 EC6518BA */ fmadds f3, f5, f2, f3
/* 00005F94 EC64187A */ fmadds f3, f4, f1, f3
/* 00005F98 FC030040 */ fcmpo cr0, f3, f0
/* 00005F9C 40800010 */ bge lbl_00005FAC
/* 00005FA0 C81F03D0 */ lfd f0, 0x3d0(r31)
/* 00005FA4 FFFF0032 */ fmul f31, f31, f0
/* 00005FA8 FFE0F818 */ frsp f31, f31
lbl_00005FAC:
/* 00005FAC 38610018 */ addi r3, r1, 0x18
/* 00005FB0 4BFFA19D */ bl mathutil_vec_normalize_len
/* 00005FB4 FC60F850 */ fneg f3, f31
/* 00005FB8 C81F03D8 */ lfd f0, 0x3d8(r31)
/* 00005FBC 3C600000 */ lis r3, lbl_100000B8@ha
/* 00005FC0 C0810018 */ lfs f4, 0x18(r1)
/* 00005FC4 C041001C */ lfs f2, 0x1c(r1)
/* 00005FC8 FC0000F2 */ fmul f0, f0, f3
/* 00005FCC C0210020 */ lfs f1, 0x20(r1)
/* 00005FD0 38830000 */ addi r4, r3, lbl_100000B8@l
/* 00005FD4 FC040032 */ fmul f0, f4, f0
/* 00005FD8 FC000018 */ frsp f0, f0
/* 00005FDC D001000C */ stfs f0, 0xc(r1)
/* 00005FE0 C81F03D8 */ lfd f0, 0x3d8(r31)
/* 00005FE4 FC0000F2 */ fmul f0, f0, f3
/* 00005FE8 FC020032 */ fmul f0, f2, f0
/* 00005FEC FC000018 */ frsp f0, f0
/* 00005FF0 D0010010 */ stfs f0, 0x10(r1)
/* 00005FF4 C81F03D8 */ lfd f0, 0x3d8(r31)
/* 00005FF8 FC0000F2 */ fmul f0, f0, f3
/* 00005FFC FC010032 */ fmul f0, f1, f0
/* 00006000 FC000018 */ frsp f0, f0
/* 00006004 D0010014 */ stfs f0, 0x14(r1)
/* 00006008 C03D001C */ lfs f1, 0x1c(r29)
/* 0000600C C001000C */ lfs f0, 0xc(r1)
/* 00006010 EC01002A */ fadds f0, f1, f0
/* 00006014 D01D001C */ stfs f0, 0x1c(r29)
/* 00006018 C03D0020 */ lfs f1, 0x20(r29)
/* 0000601C C0010010 */ lfs f0, 0x10(r1)
/* 00006020 EC01002A */ fadds f0, f1, f0
/* 00006024 D01D0020 */ stfs f0, 0x20(r29)
/* 00006028 C03D0024 */ lfs f1, 0x24(r29)
/* 0000602C C0010014 */ lfs f0, 0x14(r1)
/* 00006030 EC01002A */ fadds f0, f1, f0
/* 00006034 D01D0024 */ stfs f0, 0x24(r29)
/* 00006038 C01E0028 */ lfs f0, 0x28(r30)
/* 0000603C C0210018 */ lfs f1, 0x18(r1)
/* 00006040 FC000050 */ fneg f0, f0
/* 00006044 EC010032 */ fmuls f0, f1, f0
/* 00006048 D01E0068 */ stfs f0, 0x68(r30)
/* 0000604C C01E0028 */ lfs f0, 0x28(r30)
/* 00006050 C021001C */ lfs f1, 0x1c(r1)
/* 00006054 FC000050 */ fneg f0, f0
/* 00006058 EC010032 */ fmuls f0, f1, f0
/* 0000605C D01E006C */ stfs f0, 0x6c(r30)
/* 00006060 C01E0028 */ lfs f0, 0x28(r30)
/* 00006064 C0210020 */ lfs f1, 0x20(r1)
/* 00006068 FC000050 */ fneg f0, f0
/* 0000606C EC010032 */ fmuls f0, f1, f0
/* 00006070 D01E0070 */ stfs f0, 0x70(r30)
/* 00006074 807E0068 */ lwz r3, 0x68(r30)
/* 00006078 801E006C */ lwz r0, 0x6c(r30)
/* 0000607C 90640000 */ stw r3, 0(r4)
/* 00006080 90040004 */ stw r0, 4(r4)
/* 00006084 801E0070 */ lwz r0, 0x70(r30)
/* 00006088 90040008 */ stw r0, 8(r4)
lbl_0000608C:
/* 0000608C 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00006090 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00006094 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00006098 41820038 */ beq lbl_000060D0
/* 0000609C C03D001C */ lfs f1, 0x1c(r29)
/* 000060A0 C81F03E0 */ lfd f0, 0x3e0(r31)
/* 000060A4 FC010032 */ fmul f0, f1, f0
/* 000060A8 FC000018 */ frsp f0, f0
/* 000060AC D01D001C */ stfs f0, 0x1c(r29)
/* 000060B0 C03D0024 */ lfs f1, 0x24(r29)
/* 000060B4 C81F03E0 */ lfd f0, 0x3e0(r31)
/* 000060B8 FC010032 */ fmul f0, f1, f0
/* 000060BC FC000018 */ frsp f0, f0
/* 000060C0 D01D0024 */ stfs f0, 0x24(r29)
/* 000060C4 C01D006C */ lfs f0, 0x6c(r29)
/* 000060C8 FC000050 */ fneg f0, f0
/* 000060CC D001009C */ stfs f0, 0x9c(r1)
lbl_000060D0:
/* 000060D0 C03D001C */ lfs f1, 0x1c(r29)
/* 000060D4 C0010098 */ lfs f0, 0x98(r1)
/* 000060D8 EC01002A */ fadds f0, f1, f0
/* 000060DC D01D001C */ stfs f0, 0x1c(r29)
/* 000060E0 C03D0020 */ lfs f1, 0x20(r29)
/* 000060E4 C001009C */ lfs f0, 0x9c(r1)
/* 000060E8 EC01002A */ fadds f0, f1, f0
/* 000060EC D01D0020 */ stfs f0, 0x20(r29)
/* 000060F0 C03D0024 */ lfs f1, 0x24(r29)
/* 000060F4 C00100A0 */ lfs f0, 0xa0(r1)
/* 000060F8 EC01002A */ fadds f0, f1, f0
/* 000060FC D01D0024 */ stfs f0, 0x24(r29)
/* 00006100 80010114 */ lwz r0, 0x114(r1)
/* 00006104 CBE10108 */ lfd f31, 0x108(r1)
/* 00006108 83E10104 */ lwz r31, 0x104(r1)
/* 0000610C 83C10100 */ lwz r30, 0x100(r1)
/* 00006110 83A100FC */ lwz r29, 0xfc(r1)
/* 00006114 838100F8 */ lwz r28, 0xf8(r1)
/* 00006118 38210110 */ addi r1, r1, 0x110
/* 0000611C 7C0803A6 */ mtlr r0
/* 00006120 4E800020 */ blr 
lbl_00006124:
/* 00006124 7C0802A6 */ mflr r0
/* 00006128 90010004 */ stw r0, 4(r1)
/* 0000612C 9421FFB8 */ stwu r1, -0x48(r1)
/* 00006130 DBE10040 */ stfd f31, 0x40(r1)
/* 00006134 93E1003C */ stw r31, 0x3c(r1)
/* 00006138 93C10038 */ stw r30, 0x38(r1)
/* 0000613C 3BC40000 */ addi r30, r4, 0
/* 00006140 93A10034 */ stw r29, 0x34(r1)
/* 00006144 7C7D1B78 */ mr r29, r3
/* 00006148 93810030 */ stw r28, 0x30(r1)
/* 0000614C 3B850000 */ addi r28, r5, 0
/* 00006150 C0030004 */ lfs f0, 4(r3)
/* 00006154 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00006158 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 0000615C D01D0010 */ stfs f0, 0x10(r29)
/* 00006160 387D001C */ addi r3, r29, 0x1c
/* 00006164 C01D0008 */ lfs f0, 8(r29)
/* 00006168 D01D0014 */ stfs f0, 0x14(r29)
/* 0000616C C01D000C */ lfs f0, 0xc(r29)
/* 00006170 D01D0018 */ stfs f0, 0x18(r29)
/* 00006174 C0230000 */ lfs f1, 0(r3)
/* 00006178 C0430004 */ lfs f2, 4(r3)
/* 0000617C C0030008 */ lfs f0, 8(r3)
/* 00006180 EC210072 */ fmuls f1, f1, f1
/* 00006184 EC2208BA */ fmadds f1, f2, f2, f1
/* 00006188 EC20083A */ fmadds f1, f0, f0, f1
/* 0000618C 4BFF9FC1 */ bl mathutil_sqrt
/* 00006190 D03D00F8 */ stfs f1, 0xf8(r29)
/* 00006194 801D0094 */ lwz r0, 0x94(r29)
/* 00006198 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 0000619C 901D0094 */ stw r0, 0x94(r29)
/* 000061A0 C01F0030 */ lfs f0, 0x30(r31)
/* 000061A4 D0010020 */ stfs f0, 0x20(r1)
/* 000061A8 C01D006C */ lfs f0, 0x6c(r29)
/* 000061AC FC000050 */ fneg f0, f0
/* 000061B0 D0010024 */ stfs f0, 0x24(r1)
/* 000061B4 C01F0030 */ lfs f0, 0x30(r31)
/* 000061B8 D0010028 */ stfs f0, 0x28(r1)
/* 000061BC 807D0094 */ lwz r3, 0x94(r29)
/* 000061C0 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 000061C4 41820014 */ beq lbl_000061D8
/* 000061C8 C0010024 */ lfs f0, 0x24(r1)
/* 000061CC FC000050 */ fneg f0, f0
/* 000061D0 D0010024 */ stfs f0, 0x24(r1)
/* 000061D4 48000014 */ b lbl_000061E8
lbl_000061D8:
/* 000061D8 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 000061DC 4182000C */ beq lbl_000061E8
/* 000061E0 C01F0030 */ lfs f0, 0x30(r31)
/* 000061E4 D0010024 */ stfs f0, 0x24(r1)
lbl_000061E8:
/* 000061E8 801D0094 */ lwz r0, 0x94(r29)
/* 000061EC 540003DF */ rlwinm. r0, r0, 0, 0xf, 0xf
/* 000061F0 40820124 */ bne lbl_00006314
/* 000061F4 3C600000 */ lis r3, gameSubmode@ha
/* 000061F8 A8030000 */ lha r0, gameSubmode@l(r3)
/* 000061FC 2C00000E */ cmpwi r0, 0xe
/* 00006200 41820114 */ beq lbl_00006314
/* 00006204 2C1C0000 */ cmpwi r28, 0
/* 00006208 4082010C */ bne lbl_00006314
/* 0000620C 801D0120 */ lwz r0, 0x120(r29)
/* 00006210 540007FF */ clrlwi. r0, r0, 0x1f
/* 00006214 41820100 */ beq lbl_00006314
/* 00006218 807D001C */ lwz r3, 0x1c(r29)
/* 0000621C 801D0020 */ lwz r0, 0x20(r29)
/* 00006220 90610014 */ stw r3, 0x14(r1)
/* 00006224 90010018 */ stw r0, 0x18(r1)
/* 00006228 801D0024 */ lwz r0, 0x24(r29)
/* 0000622C 9001001C */ stw r0, 0x1c(r1)
/* 00006230 C001001C */ lfs f0, 0x1c(r1)
/* 00006234 C0210014 */ lfs f1, 0x14(r1)
/* 00006238 EC210072 */ fmuls f1, f1, f1
/* 0000623C EC20083A */ fmadds f1, f0, f0, f1
/* 00006240 C01F03E8 */ lfs f0, 0x3e8(r31)
/* 00006244 FC010040 */ fcmpo cr0, f1, f0
/* 00006248 408100CC */ ble lbl_00006314
/* 0000624C 4BFF9F01 */ bl mathutil_sqrt
/* 00006250 C85F02A0 */ lfd f2, 0x2a0(r31)
/* 00006254 3C600000 */ lis r3, cameraInfo@ha
/* 00006258 C0010014 */ lfs f0, 0x14(r1)
/* 0000625C 3B830000 */ addi r28, r3, cameraInfo@l
/* 00006260 FC220824 */ fdiv f1, f2, f1
/* 00006264 FC200818 */ frsp f1, f1
/* 00006268 EC000072 */ fmuls f0, f0, f1
/* 0000626C D0010014 */ stfs f0, 0x14(r1)
/* 00006270 C001001C */ lfs f0, 0x1c(r1)
/* 00006274 EC000072 */ fmuls f0, f0, f1
/* 00006278 D001001C */ stfs f0, 0x1c(r1)
/* 0000627C 881D002E */ lbz r0, 0x2e(r29)
/* 00006280 7C000774 */ extsb r0, r0
/* 00006284 1C000284 */ mulli r0, r0, 0x284
/* 00006288 7C7C0214 */ add r3, r28, r0
/* 0000628C A863001A */ lha r3, 0x1a(r3)
/* 00006290 38634000 */ addi r3, r3, 0x4000
/* 00006294 4BFF9EB9 */ bl mathutil_sin
/* 00006298 881D002E */ lbz r0, 0x2e(r29)
/* 0000629C FC200850 */ fneg f1, f1
/* 000062A0 C001001C */ lfs f0, 0x1c(r1)
/* 000062A4 7C000774 */ extsb r0, r0
/* 000062A8 1C000284 */ mulli r0, r0, 0x284
/* 000062AC EFE00072 */ fmuls f31, f0, f1
/* 000062B0 7C7C0214 */ add r3, r28, r0
/* 000062B4 A863001A */ lha r3, 0x1a(r3)
/* 000062B8 4BFF9E95 */ bl mathutil_sin
/* 000062BC FC400850 */ fneg f2, f1
/* 000062C0 C0210014 */ lfs f1, 0x14(r1)
/* 000062C4 C81F01B0 */ lfd f0, 0x1b0(r31)
/* 000062C8 EC2100B2 */ fmuls f1, f1, f2
/* 000062CC EC21F82A */ fadds f1, f1, f31
/* 000062D0 FC010040 */ fcmpo cr0, f1, f0
/* 000062D4 40800040 */ bge lbl_00006314
/* 000062D8 FC200850 */ fneg f1, f1
/* 000062DC C85F03F0 */ lfd f2, 0x3f0(r31)
/* 000062E0 C87F02A0 */ lfd f3, 0x2a0(r31)
/* 000062E4 C0010020 */ lfs f0, 0x20(r1)
/* 000062E8 FC220072 */ fmul f1, f2, f1
/* 000062EC FC23082A */ fadd f1, f3, f1
/* 000062F0 FC200818 */ frsp f1, f1
/* 000062F4 EC000072 */ fmuls f0, f0, f1
/* 000062F8 D0010020 */ stfs f0, 0x20(r1)
/* 000062FC C0010024 */ lfs f0, 0x24(r1)
/* 00006300 EC000072 */ fmuls f0, f0, f1
/* 00006304 D0010024 */ stfs f0, 0x24(r1)
/* 00006308 C0010028 */ lfs f0, 0x28(r1)
/* 0000630C EC000072 */ fmuls f0, f0, f1
/* 00006310 D0010028 */ stfs f0, 0x28(r1)
lbl_00006314:
/* 00006314 4BFF9E39 */ bl mathutil_mtxA_from_identity
/* 00006318 881D002E */ lbz r0, 0x2e(r29)
/* 0000631C 3C600000 */ lis r3, worldInfo@ha
/* 00006320 3BE30000 */ addi r31, r3, worldInfo@l
/* 00006324 7C000774 */ extsb r0, r0
/* 00006328 54003032 */ slwi r0, r0, 6
/* 0000632C 7C7F0214 */ add r3, r31, r0
/* 00006330 A8630000 */ lha r3, 0(r3)
/* 00006334 4BFF9E19 */ bl mathutil_mtxA_rotate_x
/* 00006338 881D002E */ lbz r0, 0x2e(r29)
/* 0000633C 7C000774 */ extsb r0, r0
/* 00006340 54003032 */ slwi r0, r0, 6
/* 00006344 7C7F0214 */ add r3, r31, r0
/* 00006348 A8630002 */ lha r3, 2(r3)
/* 0000634C 4BFF9E01 */ bl mathutil_mtxA_rotate_z
/* 00006350 38610020 */ addi r3, r1, 0x20
/* 00006354 38830000 */ addi r4, r3, 0
/* 00006358 4BFF9DF5 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 0000635C C03D001C */ lfs f1, 0x1c(r29)
/* 00006360 7FA3EB78 */ mr r3, r29
/* 00006364 C0010020 */ lfs f0, 0x20(r1)
/* 00006368 7FC4F378 */ mr r4, r30
/* 0000636C EC01002A */ fadds f0, f1, f0
/* 00006370 D01D001C */ stfs f0, 0x1c(r29)
/* 00006374 C03D0020 */ lfs f1, 0x20(r29)
/* 00006378 C0010024 */ lfs f0, 0x24(r1)
/* 0000637C EC01002A */ fadds f0, f1, f0
/* 00006380 D01D0020 */ stfs f0, 0x20(r29)
/* 00006384 C03D0024 */ lfs f1, 0x24(r29)
/* 00006388 C0010028 */ lfs f0, 0x28(r1)
/* 0000638C EC01002A */ fadds f0, f1, f0
/* 00006390 D01D0024 */ stfs f0, 0x24(r29)
/* 00006394 C03D0004 */ lfs f1, 4(r29)
/* 00006398 C01D001C */ lfs f0, 0x1c(r29)
/* 0000639C EC01002A */ fadds f0, f1, f0
/* 000063A0 D01D0004 */ stfs f0, 4(r29)
/* 000063A4 C03D0008 */ lfs f1, 8(r29)
/* 000063A8 C01D0020 */ lfs f0, 0x20(r29)
/* 000063AC EC01002A */ fadds f0, f1, f0
/* 000063B0 D01D0008 */ stfs f0, 8(r29)
/* 000063B4 C03D000C */ lfs f1, 0xc(r29)
/* 000063B8 C01D0024 */ lfs f0, 0x24(r29)
/* 000063BC EC01002A */ fadds f0, f1, f0
/* 000063C0 D01D000C */ stfs f0, 0xc(r29)
/* 000063C4 4BFF9D89 */ bl init_physball_from_ball
/* 000063C8 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 000063CC 80830000 */ lwz r4, decodedStageLzPtr@l(r3)
/* 000063D0 7FC3F378 */ mr r3, r30
/* 000063D4 48000789 */ bl lbl_00006B5C
/* 000063D8 387D0000 */ addi r3, r29, 0
/* 000063DC 389E0000 */ addi r4, r30, 0
/* 000063E0 4BFF9D6D */ bl func_8003CB3C
/* 000063E4 801E0000 */ lwz r0, 0(r30)
/* 000063E8 540007FF */ clrlwi. r0, r0, 0x1f
/* 000063EC 41820080 */ beq lbl_0000646C
/* 000063F0 801E0050 */ lwz r0, 0x50(r30)
/* 000063F4 2C000000 */ cmpwi r0, 0
/* 000063F8 4082002C */ bne lbl_00006424
/* 000063FC C01E0044 */ lfs f0, 0x44(r30)
/* 00006400 FC000050 */ fneg f0, f0
/* 00006404 D01D0114 */ stfs f0, 0x114(r29)
/* 00006408 C01E0048 */ lfs f0, 0x48(r30)
/* 0000640C FC000050 */ fneg f0, f0
/* 00006410 D01D0118 */ stfs f0, 0x118(r29)
/* 00006414 C01E004C */ lfs f0, 0x4c(r30)
/* 00006418 FC000050 */ fneg f0, f0
/* 0000641C D01D011C */ stfs f0, 0x11c(r29)
/* 00006420 4800004C */ b lbl_0000646C
lbl_00006424:
/* 00006424 1C800084 */ mulli r4, r0, 0x84
/* 00006428 3C600000 */ lis r3, animGroups@ha
/* 0000642C 38030000 */ addi r0, r3, animGroups@l
/* 00006430 7C602214 */ add r3, r0, r4
/* 00006434 38630024 */ addi r3, r3, 0x24
/* 00006438 4BFF9D15 */ bl mathutil_mtxA_from_mtx
/* 0000643C 387E0044 */ addi r3, r30, 0x44
/* 00006440 389D0114 */ addi r4, r29, 0x114
/* 00006444 4BFF9D09 */ bl mathutil_mtxA_tf_vec
/* 00006448 C01D0114 */ lfs f0, 0x114(r29)
/* 0000644C FC000050 */ fneg f0, f0
/* 00006450 D01D0114 */ stfs f0, 0x114(r29)
/* 00006454 C01D0118 */ lfs f0, 0x118(r29)
/* 00006458 FC000050 */ fneg f0, f0
/* 0000645C D01D0118 */ stfs f0, 0x118(r29)
/* 00006460 C01D011C */ lfs f0, 0x11c(r29)
/* 00006464 FC000050 */ fneg f0, f0
/* 00006468 D01D011C */ stfs f0, 0x11c(r29)
lbl_0000646C:
/* 0000646C 8001004C */ lwz r0, 0x4c(r1)
/* 00006470 CBE10040 */ lfd f31, 0x40(r1)
/* 00006474 83E1003C */ lwz r31, 0x3c(r1)
/* 00006478 7C0803A6 */ mtlr r0
/* 0000647C 83C10038 */ lwz r30, 0x38(r1)
/* 00006480 83A10034 */ lwz r29, 0x34(r1)
/* 00006484 83810030 */ lwz r28, 0x30(r1)
/* 00006488 38210048 */ addi r1, r1, 0x48
/* 0000648C 4E800020 */ blr 
lbl_00006490:
/* 00006490 7C0802A6 */ mflr r0
/* 00006494 3CC00000 */ lis r6, lbl_10000000@ha
/* 00006498 90010004 */ stw r0, 4(r1)
/* 0000649C 3CA00000 */ lis r5, lbl_0000BE80@ha
/* 000064A0 9421FFD0 */ stwu r1, -0x30(r1)
/* 000064A4 93E1002C */ stw r31, 0x2c(r1)
/* 000064A8 3BE50000 */ addi r31, r5, lbl_0000BE80@l
/* 000064AC 93C10028 */ stw r30, 0x28(r1)
/* 000064B0 3BC60000 */ addi r30, r6, lbl_10000000@l
/* 000064B4 93A10024 */ stw r29, 0x24(r1)
/* 000064B8 7C9D2378 */ mr r29, r4
/* 000064BC 93810020 */ stw r28, 0x20(r1)
/* 000064C0 7C7C1B78 */ mr r28, r3
/* 000064C4 C0230004 */ lfs f1, 4(r3)
/* 000064C8 C003001C */ lfs f0, 0x1c(r3)
/* 000064CC EC01002A */ fadds f0, f1, f0
/* 000064D0 D01C0004 */ stfs f0, 4(r28)
/* 000064D4 C03C0008 */ lfs f1, 8(r28)
/* 000064D8 C01C0020 */ lfs f0, 0x20(r28)
/* 000064DC EC01002A */ fadds f0, f1, f0
/* 000064E0 D01C0008 */ stfs f0, 8(r28)
/* 000064E4 C03C000C */ lfs f1, 0xc(r28)
/* 000064E8 C01C0024 */ lfs f0, 0x24(r28)
/* 000064EC EC01002A */ fadds f0, f1, f0
/* 000064F0 D01C000C */ stfs f0, 0xc(r28)
/* 000064F4 480005A1 */ bl lbl_00006A94
/* 000064F8 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 000064FC 80830000 */ lwz r4, decodedStageLzPtr@l(r3)
/* 00006500 7FA3EB78 */ mr r3, r29
/* 00006504 48000659 */ bl lbl_00006B5C
/* 00006508 387C0000 */ addi r3, r28, 0
/* 0000650C 389D0000 */ addi r4, r29, 0
/* 00006510 4BFF9C3D */ bl func_8003CB3C
/* 00006514 801D0000 */ lwz r0, 0(r29)
/* 00006518 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000651C 41820158 */ beq lbl_00006674
/* 00006520 801D0050 */ lwz r0, 0x50(r29)
/* 00006524 2C000000 */ cmpwi r0, 0
/* 00006528 4082002C */ bne lbl_00006554
/* 0000652C C01D0044 */ lfs f0, 0x44(r29)
/* 00006530 FC000050 */ fneg f0, f0
/* 00006534 D01C0114 */ stfs f0, 0x114(r28)
/* 00006538 C01D0048 */ lfs f0, 0x48(r29)
/* 0000653C FC000050 */ fneg f0, f0
/* 00006540 D01C0118 */ stfs f0, 0x118(r28)
/* 00006544 C01D004C */ lfs f0, 0x4c(r29)
/* 00006548 FC000050 */ fneg f0, f0
/* 0000654C D01C011C */ stfs f0, 0x11c(r28)
/* 00006550 4800004C */ b lbl_0000659C
lbl_00006554:
/* 00006554 1C800084 */ mulli r4, r0, 0x84
/* 00006558 3C600000 */ lis r3, animGroups@ha
/* 0000655C 38030000 */ addi r0, r3, animGroups@l
/* 00006560 7C602214 */ add r3, r0, r4
/* 00006564 38630024 */ addi r3, r3, 0x24
/* 00006568 4BFF9BE5 */ bl mathutil_mtxA_from_mtx
/* 0000656C 387D0044 */ addi r3, r29, 0x44
/* 00006570 389C0114 */ addi r4, r28, 0x114
/* 00006574 4BFF9BD9 */ bl mathutil_mtxA_tf_vec
/* 00006578 C01C0114 */ lfs f0, 0x114(r28)
/* 0000657C FC000050 */ fneg f0, f0
/* 00006580 D01C0114 */ stfs f0, 0x114(r28)
/* 00006584 C01C0118 */ lfs f0, 0x118(r28)
/* 00006588 FC000050 */ fneg f0, f0
/* 0000658C D01C0118 */ stfs f0, 0x118(r28)
/* 00006590 C01C011C */ lfs f0, 0x11c(r28)
/* 00006594 FC000050 */ fneg f0, f0
/* 00006598 D01C011C */ stfs f0, 0x11c(r28)
lbl_0000659C:
/* 0000659C 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 000065A0 C81F0198 */ lfd f0, 0x198(r31)
/* 000065A4 C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 000065A8 FC010040 */ fcmpo cr0, f1, f0
/* 000065AC 4C411382 */ cror 2, 1, 2
/* 000065B0 40820038 */ bne lbl_000065E8
/* 000065B4 C03C0118 */ lfs f1, 0x118(r28)
/* 000065B8 C81F03F8 */ lfd f0, 0x3f8(r31)
/* 000065BC FC010040 */ fcmpo cr0, f1, f0
/* 000065C0 4C401382 */ cror 2, 0, 2
/* 000065C4 41820018 */ beq lbl_000065DC
/* 000065C8 C03C0008 */ lfs f1, 8(r28)
/* 000065CC C81F0400 */ lfd f0, 0x400(r31)
/* 000065D0 FC010040 */ fcmpo cr0, f1, f0
/* 000065D4 4C401382 */ cror 2, 0, 2
/* 000065D8 40820010 */ bne lbl_000065E8
lbl_000065DC:
/* 000065DC 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000065E0 3800000F */ li r0, 0xf
/* 000065E4 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_000065E8:
/* 000065E8 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000065EC 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 000065F0 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 000065F4 41820088 */ beq lbl_0000667C
/* 000065F8 80BC001C */ lwz r5, 0x1c(r28)
/* 000065FC 7FA3EB78 */ mr r3, r29
/* 00006600 801C0020 */ lwz r0, 0x20(r28)
/* 00006604 38810014 */ addi r4, r1, 0x14
/* 00006608 90A10014 */ stw r5, 0x14(r1)
/* 0000660C 90010018 */ stw r0, 0x18(r1)
/* 00006610 801C0024 */ lwz r0, 0x24(r28)
/* 00006614 9001001C */ stw r0, 0x1c(r1)
/* 00006618 4BFF9B35 */ bl func_8003BBF4
/* 0000661C C0210014 */ lfs f1, 0x14(r1)
/* 00006620 C0410018 */ lfs f2, 0x18(r1)
/* 00006624 C001001C */ lfs f0, 0x1c(r1)
/* 00006628 EC210072 */ fmuls f1, f1, f1
/* 0000662C EC2208BA */ fmadds f1, f2, f2, f1
/* 00006630 EC20083A */ fmadds f1, f0, f0, f1
/* 00006634 4BFF9B19 */ bl mathutil_sqrt
/* 00006638 C81F03B8 */ lfd f0, 0x3b8(r31)
/* 0000663C FC010040 */ fcmpo cr0, f1, f0
/* 00006640 40800010 */ bge lbl_00006650
/* 00006644 A07E001C */ lhz r3, 0x1c(r30)
/* 00006648 38030001 */ addi r0, r3, 1
/* 0000664C B01E001C */ sth r0, 0x1c(r30)
lbl_00006650:
/* 00006650 C81F0240 */ lfd f0, 0x240(r31)
/* 00006654 FC010040 */ fcmpo cr0, f1, f0
/* 00006658 41800010 */ blt lbl_00006668
/* 0000665C A01E001C */ lhz r0, 0x1c(r30)
/* 00006660 2800003C */ cmplwi r0, 0x3c
/* 00006664 40810018 */ ble lbl_0000667C
lbl_00006668:
/* 00006668 38000000 */ li r0, 0
/* 0000666C 981C0003 */ stb r0, 3(r28)
/* 00006670 4800000C */ b lbl_0000667C
lbl_00006674:
/* 00006674 38000000 */ li r0, 0
/* 00006678 B01E001C */ sth r0, 0x1c(r30)
lbl_0000667C:
/* 0000667C 80010034 */ lwz r0, 0x34(r1)
/* 00006680 83E1002C */ lwz r31, 0x2c(r1)
/* 00006684 83C10028 */ lwz r30, 0x28(r1)
/* 00006688 7C0803A6 */ mtlr r0
/* 0000668C 83A10024 */ lwz r29, 0x24(r1)
/* 00006690 83810020 */ lwz r28, 0x20(r1)
/* 00006694 38210030 */ addi r1, r1, 0x30
/* 00006698 4E800020 */ blr 
lbl_0000669C:
/* 0000669C 7C0802A6 */ mflr r0
/* 000066A0 3CA00000 */ lis r5, lbl_10000000@ha
/* 000066A4 90010004 */ stw r0, 4(r1)
/* 000066A8 9421FFB8 */ stwu r1, -0x48(r1)
/* 000066AC 93E10044 */ stw r31, 0x44(r1)
/* 000066B0 93C10040 */ stw r30, 0x40(r1)
/* 000066B4 3BC50000 */ addi r30, r5, lbl_10000000@l
/* 000066B8 93A1003C */ stw r29, 0x3c(r1)
/* 000066BC 3BA40000 */ addi r29, r4, 0
/* 000066C0 93810038 */ stw r28, 0x38(r1)
/* 000066C4 7C7C1B78 */ mr r28, r3
/* 000066C8 C0030004 */ lfs f0, 4(r3)
/* 000066CC 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000066D0 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 000066D4 D01C0010 */ stfs f0, 0x10(r28)
/* 000066D8 387C001C */ addi r3, r28, 0x1c
/* 000066DC C01C0008 */ lfs f0, 8(r28)
/* 000066E0 D01C0014 */ stfs f0, 0x14(r28)
/* 000066E4 C01C000C */ lfs f0, 0xc(r28)
/* 000066E8 D01C0018 */ stfs f0, 0x18(r28)
/* 000066EC C0230000 */ lfs f1, 0(r3)
/* 000066F0 C0430004 */ lfs f2, 4(r3)
/* 000066F4 C0030008 */ lfs f0, 8(r3)
/* 000066F8 EC210072 */ fmuls f1, f1, f1
/* 000066FC EC2208BA */ fmadds f1, f2, f2, f1
/* 00006700 EC20083A */ fmadds f1, f0, f0, f1
/* 00006704 4BFF9A49 */ bl mathutil_sqrt
/* 00006708 D03C00F8 */ stfs f1, 0xf8(r28)
/* 0000670C 801C0094 */ lwz r0, 0x94(r28)
/* 00006710 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00006714 901C0094 */ stw r0, 0x94(r28)
/* 00006718 C01F0030 */ lfs f0, 0x30(r31)
/* 0000671C D001002C */ stfs f0, 0x2c(r1)
/* 00006720 C01C006C */ lfs f0, 0x6c(r28)
/* 00006724 FC000050 */ fneg f0, f0
/* 00006728 D0010030 */ stfs f0, 0x30(r1)
/* 0000672C C01F0030 */ lfs f0, 0x30(r31)
/* 00006730 D0010034 */ stfs f0, 0x34(r1)
/* 00006734 807C0094 */ lwz r3, 0x94(r28)
/* 00006738 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 0000673C 41820014 */ beq lbl_00006750
/* 00006740 C0010030 */ lfs f0, 0x30(r1)
/* 00006744 FC000050 */ fneg f0, f0
/* 00006748 D0010030 */ stfs f0, 0x30(r1)
/* 0000674C 48000014 */ b lbl_00006760
lbl_00006750:
/* 00006750 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00006754 4182000C */ beq lbl_00006760
/* 00006758 C01F0030 */ lfs f0, 0x30(r31)
/* 0000675C D0010030 */ stfs f0, 0x30(r1)
lbl_00006760:
/* 00006760 C03C001C */ lfs f1, 0x1c(r28)
/* 00006764 7F83E378 */ mr r3, r28
/* 00006768 C001002C */ lfs f0, 0x2c(r1)
/* 0000676C 7FA4EB78 */ mr r4, r29
/* 00006770 EC01002A */ fadds f0, f1, f0
/* 00006774 D01C001C */ stfs f0, 0x1c(r28)
/* 00006778 C03C0020 */ lfs f1, 0x20(r28)
/* 0000677C C0010030 */ lfs f0, 0x30(r1)
/* 00006780 EC01002A */ fadds f0, f1, f0
/* 00006784 D01C0020 */ stfs f0, 0x20(r28)
/* 00006788 C03C0024 */ lfs f1, 0x24(r28)
/* 0000678C C0010034 */ lfs f0, 0x34(r1)
/* 00006790 EC01002A */ fadds f0, f1, f0
/* 00006794 D01C0024 */ stfs f0, 0x24(r28)
/* 00006798 C03C0004 */ lfs f1, 4(r28)
/* 0000679C C01C001C */ lfs f0, 0x1c(r28)
/* 000067A0 EC01002A */ fadds f0, f1, f0
/* 000067A4 D01C0004 */ stfs f0, 4(r28)
/* 000067A8 C03C0008 */ lfs f1, 8(r28)
/* 000067AC C01C0020 */ lfs f0, 0x20(r28)
/* 000067B0 EC01002A */ fadds f0, f1, f0
/* 000067B4 D01C0008 */ stfs f0, 8(r28)
/* 000067B8 C03C000C */ lfs f1, 0xc(r28)
/* 000067BC C01C0024 */ lfs f0, 0x24(r28)
/* 000067C0 EC01002A */ fadds f0, f1, f0
/* 000067C4 D01C000C */ stfs f0, 0xc(r28)
/* 000067C8 480002CD */ bl lbl_00006A94
/* 000067CC 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 000067D0 80830000 */ lwz r4, decodedStageLzPtr@l(r3)
/* 000067D4 7FA3EB78 */ mr r3, r29
/* 000067D8 48000385 */ bl lbl_00006B5C
/* 000067DC 387C0000 */ addi r3, r28, 0
/* 000067E0 389D0000 */ addi r4, r29, 0
/* 000067E4 4BFF9969 */ bl func_8003CB3C
/* 000067E8 801D0000 */ lwz r0, 0(r29)
/* 000067EC 540007FF */ clrlwi. r0, r0, 0x1f
/* 000067F0 408200A0 */ bne lbl_00006890
/* 000067F4 C03E0068 */ lfs f1, 0x68(r30)
/* 000067F8 C01C001C */ lfs f0, 0x1c(r28)
/* 000067FC EC010028 */ fsubs f0, f1, f0
/* 00006800 D0010020 */ stfs f0, 0x20(r1)
/* 00006804 C03E006C */ lfs f1, 0x6c(r30)
/* 00006808 C01C0020 */ lfs f0, 0x20(r28)
/* 0000680C EC010028 */ fsubs f0, f1, f0
/* 00006810 D0010024 */ stfs f0, 0x24(r1)
/* 00006814 C03E0070 */ lfs f1, 0x70(r30)
/* 00006818 C01C0024 */ lfs f0, 0x24(r28)
/* 0000681C EC010028 */ fsubs f0, f1, f0
/* 00006820 D0010028 */ stfs f0, 0x28(r1)
/* 00006824 C83F0408 */ lfd f1, 0x408(r31)
/* 00006828 C0010020 */ lfs f0, 0x20(r1)
/* 0000682C FC010032 */ fmul f0, f1, f0
/* 00006830 FC000018 */ frsp f0, f0
/* 00006834 D0010020 */ stfs f0, 0x20(r1)
/* 00006838 C83F0408 */ lfd f1, 0x408(r31)
/* 0000683C C0010024 */ lfs f0, 0x24(r1)
/* 00006840 FC010032 */ fmul f0, f1, f0
/* 00006844 FC000018 */ frsp f0, f0
/* 00006848 D0010024 */ stfs f0, 0x24(r1)
/* 0000684C C83F0408 */ lfd f1, 0x408(r31)
/* 00006850 C0010028 */ lfs f0, 0x28(r1)
/* 00006854 FC010032 */ fmul f0, f1, f0
/* 00006858 FC000018 */ frsp f0, f0
/* 0000685C D0010028 */ stfs f0, 0x28(r1)
/* 00006860 C03C001C */ lfs f1, 0x1c(r28)
/* 00006864 C0010020 */ lfs f0, 0x20(r1)
/* 00006868 EC01002A */ fadds f0, f1, f0
/* 0000686C D01C001C */ stfs f0, 0x1c(r28)
/* 00006870 C03C0020 */ lfs f1, 0x20(r28)
/* 00006874 C0010024 */ lfs f0, 0x24(r1)
/* 00006878 EC01002A */ fadds f0, f1, f0
/* 0000687C D01C0020 */ stfs f0, 0x20(r28)
/* 00006880 C03C0024 */ lfs f1, 0x24(r28)
/* 00006884 C0010028 */ lfs f0, 0x28(r1)
/* 00006888 EC01002A */ fadds f0, f1, f0
/* 0000688C D01C0024 */ stfs f0, 0x24(r28)
lbl_00006890:
/* 00006890 801D0000 */ lwz r0, 0(r29)
/* 00006894 540007FF */ clrlwi. r0, r0, 0x1f
/* 00006898 41820080 */ beq lbl_00006918
/* 0000689C 801D0050 */ lwz r0, 0x50(r29)
/* 000068A0 2C000000 */ cmpwi r0, 0
/* 000068A4 4082002C */ bne lbl_000068D0
/* 000068A8 C01D0044 */ lfs f0, 0x44(r29)
/* 000068AC FC000050 */ fneg f0, f0
/* 000068B0 D01C0114 */ stfs f0, 0x114(r28)
/* 000068B4 C01D0048 */ lfs f0, 0x48(r29)
/* 000068B8 FC000050 */ fneg f0, f0
/* 000068BC D01C0118 */ stfs f0, 0x118(r28)
/* 000068C0 C01D004C */ lfs f0, 0x4c(r29)
/* 000068C4 FC000050 */ fneg f0, f0
/* 000068C8 D01C011C */ stfs f0, 0x11c(r28)
/* 000068CC 4800004C */ b lbl_00006918
lbl_000068D0:
/* 000068D0 1C800084 */ mulli r4, r0, 0x84
/* 000068D4 3C600000 */ lis r3, animGroups@ha
/* 000068D8 38030000 */ addi r0, r3, animGroups@l
/* 000068DC 7C602214 */ add r3, r0, r4
/* 000068E0 38630024 */ addi r3, r3, 0x24
/* 000068E4 4BFF9869 */ bl mathutil_mtxA_from_mtx
/* 000068E8 387D0044 */ addi r3, r29, 0x44
/* 000068EC 389C0114 */ addi r4, r28, 0x114
/* 000068F0 4BFF985D */ bl mathutil_mtxA_tf_vec
/* 000068F4 C01C0114 */ lfs f0, 0x114(r28)
/* 000068F8 FC000050 */ fneg f0, f0
/* 000068FC D01C0114 */ stfs f0, 0x114(r28)
/* 00006900 C01C0118 */ lfs f0, 0x118(r28)
/* 00006904 FC000050 */ fneg f0, f0
/* 00006908 D01C0118 */ stfs f0, 0x118(r28)
/* 0000690C C01C011C */ lfs f0, 0x11c(r28)
/* 00006910 FC000050 */ fneg f0, f0
/* 00006914 D01C011C */ stfs f0, 0x11c(r28)
lbl_00006918:
/* 00006918 801D0000 */ lwz r0, 0(r29)
/* 0000691C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00006920 4182014C */ beq lbl_00006A6C
/* 00006924 80BC001C */ lwz r5, 0x1c(r28)
/* 00006928 7FA3EB78 */ mr r3, r29
/* 0000692C 801C0020 */ lwz r0, 0x20(r28)
/* 00006930 38810014 */ addi r4, r1, 0x14
/* 00006934 90A10014 */ stw r5, 0x14(r1)
/* 00006938 90010018 */ stw r0, 0x18(r1)
/* 0000693C 801C0024 */ lwz r0, 0x24(r28)
/* 00006940 9001001C */ stw r0, 0x1c(r1)
/* 00006944 4BFF9809 */ bl func_8003BBF4
/* 00006948 C0210014 */ lfs f1, 0x14(r1)
/* 0000694C C0410018 */ lfs f2, 0x18(r1)
/* 00006950 C001001C */ lfs f0, 0x1c(r1)
/* 00006954 EC210072 */ fmuls f1, f1, f1
/* 00006958 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000695C EC20083A */ fmadds f1, f0, f0, f1
/* 00006960 4BFF97ED */ bl mathutil_sqrt
/* 00006964 C81F03B8 */ lfd f0, 0x3b8(r31)
/* 00006968 FC010040 */ fcmpo cr0, f1, f0
/* 0000696C 40800010 */ bge lbl_0000697C
/* 00006970 A07E001C */ lhz r3, 0x1c(r30)
/* 00006974 38030001 */ addi r0, r3, 1
/* 00006978 B01E001C */ sth r0, 0x1c(r30)
lbl_0000697C:
/* 0000697C A09E001C */ lhz r4, 0x1c(r30)
/* 00006980 28040096 */ cmplwi r4, 0x96
/* 00006984 41810034 */ bgt lbl_000069B8
/* 00006988 3C600000 */ lis r3, modeCtrl@ha
/* 0000698C 38630000 */ addi r3, r3, modeCtrl@l
/* 00006990 8003002C */ lwz r0, 0x2c(r3)
/* 00006994 3C600000 */ lis r3, lbl_80285A80@ha
/* 00006998 38630000 */ addi r3, r3, lbl_80285A80@l
/* 0000699C 1C00000C */ mulli r0, r0, 0xc
/* 000069A0 7C630214 */ add r3, r3, r0
/* 000069A4 A8030008 */ lha r0, 8(r3)
/* 000069A8 2C000000 */ cmpwi r0, 0
/* 000069AC 4182001C */ beq lbl_000069C8
/* 000069B0 2804001E */ cmplwi r4, 0x1e
/* 000069B4 40810014 */ ble lbl_000069C8
lbl_000069B8:
/* 000069B8 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000069BC 38000015 */ li r0, 0x15
/* 000069C0 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 000069C4 480000B0 */ b lbl_00006A74
lbl_000069C8:
/* 000069C8 C81F0410 */ lfd f0, 0x410(r31)
/* 000069CC FC010040 */ fcmpo cr0, f1, f0
/* 000069D0 40800060 */ bge lbl_00006A30
/* 000069D4 A09E001C */ lhz r4, 0x1c(r30)
/* 000069D8 2804001C */ cmplwi r4, 0x1c
/* 000069DC 41810034 */ bgt lbl_00006A10
/* 000069E0 3C600000 */ lis r3, modeCtrl@ha
/* 000069E4 38630000 */ addi r3, r3, modeCtrl@l
/* 000069E8 8003002C */ lwz r0, 0x2c(r3)
/* 000069EC 3C600000 */ lis r3, lbl_80285A80@ha
/* 000069F0 38630000 */ addi r3, r3, lbl_80285A80@l
/* 000069F4 1C00000C */ mulli r0, r0, 0xc
/* 000069F8 7C630214 */ add r3, r3, r0
/* 000069FC A8030008 */ lha r0, 8(r3)
/* 00006A00 2C000000 */ cmpwi r0, 0
/* 00006A04 4182002C */ beq lbl_00006A30
/* 00006A08 28040008 */ cmplwi r4, 8
/* 00006A0C 40810024 */ ble lbl_00006A30
lbl_00006A10:
/* 00006A10 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00006A14 A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00006A18 2C000015 */ cmpwi r0, 0x15
/* 00006A1C 40800014 */ bge lbl_00006A30
/* 00006A20 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00006A24 38000015 */ li r0, 0x15
/* 00006A28 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00006A2C 48000048 */ b lbl_00006A74
lbl_00006A30:
/* 00006A30 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00006A34 38830000 */ addi r4, r3, lbl_802F1FF6@l
/* 00006A38 A8040000 */ lha r0, 0(r4)
/* 00006A3C 2C000012 */ cmpwi r0, 0x12
/* 00006A40 40820034 */ bne lbl_00006A74
/* 00006A44 38000013 */ li r0, 0x13
/* 00006A48 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00006A4C B4030000 */ sthu r0, lbl_802F1FF4@l(r3)
/* 00006A50 A8030000 */ lha r0, 0(r3)
/* 00006A54 2C00FFFF */ cmpwi r0, -1
/* 00006A58 4182001C */ beq lbl_00006A74
/* 00006A5C B0040000 */ sth r0, 0(r4)
/* 00006A60 3800FFFF */ li r0, -1
/* 00006A64 B0030000 */ sth r0, 0(r3)
/* 00006A68 4800000C */ b lbl_00006A74
lbl_00006A6C:
/* 00006A6C 38000000 */ li r0, 0
/* 00006A70 B01E001C */ sth r0, 0x1c(r30)
lbl_00006A74:
/* 00006A74 8001004C */ lwz r0, 0x4c(r1)
/* 00006A78 83E10044 */ lwz r31, 0x44(r1)
/* 00006A7C 83C10040 */ lwz r30, 0x40(r1)
/* 00006A80 7C0803A6 */ mtlr r0
/* 00006A84 83A1003C */ lwz r29, 0x3c(r1)
/* 00006A88 83810038 */ lwz r28, 0x38(r1)
/* 00006A8C 38210048 */ addi r1, r1, 0x48
/* 00006A90 4E800020 */ blr 
lbl_00006A94:
/* 00006A94 7C0802A6 */ mflr r0
/* 00006A98 3CA00000 */ lis r5, lbl_0000BE80@ha
/* 00006A9C 90010004 */ stw r0, 4(r1)
/* 00006AA0 9421FFE8 */ stwu r1, -0x18(r1)
/* 00006AA4 93E10014 */ stw r31, 0x14(r1)
/* 00006AA8 3BE40000 */ addi r31, r4, 0
/* 00006AAC 93C10010 */ stw r30, 0x10(r1)
/* 00006AB0 3BC50000 */ addi r30, r5, lbl_0000BE80@l
/* 00006AB4 4BFF9699 */ bl init_physball_from_ball
/* 00006AB8 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00006ABC A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00006AC0 2C000012 */ cmpwi r0, 0x12
/* 00006AC4 4180005C */ blt lbl_00006B20
/* 00006AC8 3C600000 */ lis r3, modeCtrl@ha
/* 00006ACC 38630000 */ addi r3, r3, modeCtrl@l
/* 00006AD0 8003002C */ lwz r0, 0x2c(r3)
/* 00006AD4 3C600000 */ lis r3, lbl_80285A80@ha
/* 00006AD8 38630000 */ addi r3, r3, lbl_80285A80@l
/* 00006ADC 1C00000C */ mulli r0, r0, 0xc
/* 00006AE0 7C630214 */ add r3, r3, r0
/* 00006AE4 A8030008 */ lha r0, 8(r3)
/* 00006AE8 2C000000 */ cmpwi r0, 0
/* 00006AEC 41820010 */ beq lbl_00006AFC
/* 00006AF0 C01E0418 */ lfs f0, 0x418(r30)
/* 00006AF4 D01F0054 */ stfs f0, 0x54(r31)
/* 00006AF8 4800004C */ b lbl_00006B44
lbl_00006AFC:
/* 00006AFC A8030004 */ lha r0, 4(r3)
/* 00006B00 2C000000 */ cmpwi r0, 0
/* 00006B04 41820010 */ beq lbl_00006B14
/* 00006B08 C01E041C */ lfs f0, 0x41c(r30)
/* 00006B0C D01F0054 */ stfs f0, 0x54(r31)
/* 00006B10 48000034 */ b lbl_00006B44
lbl_00006B14:
/* 00006B14 C01E0420 */ lfs f0, 0x420(r30)
/* 00006B18 D01F0054 */ stfs f0, 0x54(r31)
/* 00006B1C 48000028 */ b lbl_00006B44
lbl_00006B20:
/* 00006B20 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00006B24 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00006B28 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00006B2C 41820010 */ beq lbl_00006B3C
/* 00006B30 C01E01D0 */ lfs f0, 0x1d0(r30)
/* 00006B34 D01F0054 */ stfs f0, 0x54(r31)
/* 00006B38 4800000C */ b lbl_00006B44
lbl_00006B3C:
/* 00006B3C C01E0420 */ lfs f0, 0x420(r30)
/* 00006B40 D01F0054 */ stfs f0, 0x54(r31)
lbl_00006B44:
/* 00006B44 8001001C */ lwz r0, 0x1c(r1)
/* 00006B48 83E10014 */ lwz r31, 0x14(r1)
/* 00006B4C 83C10010 */ lwz r30, 0x10(r1)
/* 00006B50 7C0803A6 */ mtlr r0
/* 00006B54 38210018 */ addi r1, r1, 0x18
/* 00006B58 4E800020 */ blr 
lbl_00006B5C:
/* 00006B5C 7C0802A6 */ mflr r0
/* 00006B60 3CA00000 */ lis r5, currStageId@ha
/* 00006B64 90010004 */ stw r0, 4(r1)
/* 00006B68 9421FFF8 */ stwu r1, -8(r1)
/* 00006B6C A8050000 */ lha r0, currStageId@l(r5)
/* 00006B70 2C000097 */ cmpwi r0, 0x97
/* 00006B74 4082000C */ bne lbl_00006B80
/* 00006B78 4BFF95D5 */ bl stcoli_sub35
/* 00006B7C 48000008 */ b lbl_00006B84
lbl_00006B80:
/* 00006B80 4BFF95CD */ bl collide_ball_with_stage
lbl_00006B84:
/* 00006B84 8001000C */ lwz r0, 0xc(r1)
/* 00006B88 38210008 */ addi r1, r1, 8
/* 00006B8C 7C0803A6 */ mtlr r0
/* 00006B90 4E800020 */ blr 
lbl_00006B94:
/* 00006B94 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00006B98 A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00006B9C 2C00000E */ cmpwi r0, 0xe
/* 00006BA0 40820040 */ bne lbl_00006BE0
/* 00006BA4 3C800000 */ lis r4, lbl_10000004@ha
/* 00006BA8 3C600000 */ lis r3, lbl_0000C2A8@ha
/* 00006BAC C0240000 */ lfs f1, lbl_10000004@l(r4)
/* 00006BB0 C8030000 */ lfd f0, lbl_0000C2A8@l(r3)
/* 00006BB4 FC010040 */ fcmpo cr0, f1, f0
/* 00006BB8 40800028 */ bge lbl_00006BE0
/* 00006BBC 3C600000 */ lis r3, lbl_10000018@ha
/* 00006BC0 A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00006BC4 2C000000 */ cmpwi r0, 0
/* 00006BC8 40820018 */ bne lbl_00006BE0
/* 00006BCC 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00006BD0 84030000 */ lwzu r0, lbl_802F1FD0@l(r3)
/* 00006BD4 60001000 */ ori r0, r0, 0x1000
/* 00006BD8 90030000 */ stw r0, 0(r3)
/* 00006BDC 4E800020 */ blr 
lbl_00006BE0:
/* 00006BE0 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00006BE4 84030000 */ lwzu r0, lbl_802F1FD0@l(r3)
/* 00006BE8 54000524 */ rlwinm r0, r0, 0, 0x14, 0x12
/* 00006BEC 90030000 */ stw r0, 0(r3)
/* 00006BF0 4E800020 */ blr 
lbl_00006BF4:
/* 00006BF4 7C0802A6 */ mflr r0
/* 00006BF8 3C800000 */ lis r4, lbl_10000000@ha
/* 00006BFC 90010004 */ stw r0, 4(r1)
/* 00006C00 38630004 */ addi r3, r3, 4
/* 00006C04 38A00000 */ li r5, 0
/* 00006C08 9421FFD0 */ stwu r1, -0x30(r1)
/* 00006C0C 93E1002C */ stw r31, 0x2c(r1)
/* 00006C10 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00006C14 3881000C */ addi r4, r1, 0xc
/* 00006C18 93C10028 */ stw r30, 0x28(r1)
/* 00006C1C 3BC00001 */ li r30, 1
/* 00006C20 4BFF952D */ bl raycast_stage_down
/* 00006C24 28030000 */ cmplwi r3, 0
/* 00006C28 41820014 */ beq lbl_00006C3C
/* 00006C2C 8061000C */ lwz r3, 0xc(r1)
/* 00006C30 4BFF951D */ bl func_80042214
/* 00006C34 907F0074 */ stw r3, 0x74(r31)
/* 00006C38 4800000C */ b lbl_00006C44
lbl_00006C3C:
/* 00006C3C 3800000F */ li r0, 0xf
/* 00006C40 901F0074 */ stw r0, 0x74(r31)
lbl_00006C44:
/* 00006C44 3C600000 */ lis r3, modeCtrl@ha
/* 00006C48 38630000 */ addi r3, r3, modeCtrl@l
/* 00006C4C 80C3002C */ lwz r6, 0x2c(r3)
/* 00006C50 3C600000 */ lis r3, lbl_80285A80@ha
/* 00006C54 38030000 */ addi r0, r3, lbl_80285A80@l
/* 00006C58 1C66000C */ mulli r3, r6, 0xc
/* 00006C5C 7C601A14 */ add r3, r0, r3
/* 00006C60 A8030006 */ lha r0, 6(r3)
/* 00006C64 2C000000 */ cmpwi r0, 0
/* 00006C68 4182000C */ beq lbl_00006C74
/* 00006C6C 3BC00002 */ li r30, 2
/* 00006C70 48000014 */ b lbl_00006C84
lbl_00006C74:
/* 00006C74 A803000A */ lha r0, 0xa(r3)
/* 00006C78 2C000000 */ cmpwi r0, 0
/* 00006C7C 41820008 */ beq lbl_00006C84
/* 00006C80 3BC00003 */ li r30, 3
lbl_00006C84:
/* 00006C84 801F0074 */ lwz r0, 0x74(r31)
/* 00006C88 3CA00000 */ lis r5, lbl_80285A58@ha
/* 00006C8C 54C6103A */ slwi r6, r6, 2
/* 00006C90 7C80F1D6 */ mullw r4, r0, r30
/* 00006C94 38050000 */ addi r0, r5, lbl_80285A58@l
/* 00006C98 7CC03214 */ add r6, r0, r6
/* 00006C9C 80A60000 */ lwz r5, 0(r6)
/* 00006CA0 3C600000 */ lis r3, lbl_802F1FEC@ha
/* 00006CA4 380000B4 */ li r0, 0xb4
/* 00006CA8 7C852214 */ add r4, r5, r4
/* 00006CAC 90860000 */ stw r4, 0(r6)
/* 00006CB0 B0030000 */ sth r0, lbl_802F1FEC@l(r3)
/* 00006CB4 80010034 */ lwz r0, 0x34(r1)
/* 00006CB8 83E1002C */ lwz r31, 0x2c(r1)
/* 00006CBC 83C10028 */ lwz r30, 0x28(r1)
/* 00006CC0 7C0803A6 */ mtlr r0
/* 00006CC4 38210030 */ addi r1, r1, 0x30
/* 00006CC8 4E800020 */ blr 
lbl_00006CCC:
/* 00006CCC 3CA00000 */ lis r5, lbl_0000BE80@ha
/* 00006CD0 EC210132 */ fmuls f1, f1, f4
/* 00006CD4 38A50000 */ addi r5, r5, lbl_0000BE80@l
/* 00006CD8 C8850430 */ lfd f4, 0x430(r5)
/* 00006CDC C8050438 */ lfd f0, 0x438(r5)
/* 00006CE0 FC240072 */ fmul f1, f4, f1
/* 00006CE4 FC020028 */ fsub f0, f2, f0
/* 00006CE8 FC200818 */ frsp f1, f1
/* 00006CEC FC000072 */ fmul f0, f0, f1
/* 00006CF0 FC000018 */ frsp f0, f0
/* 00006CF4 D0030000 */ stfs f0, 0(r3)
/* 00006CF8 C8050440 */ lfd f0, 0x440(r5)
/* 00006CFC FC030028 */ fsub f0, f3, f0
/* 00006D00 FC000050 */ fneg f0, f0
/* 00006D04 FC000072 */ fmul f0, f0, f1
/* 00006D08 FC000018 */ frsp f0, f0
/* 00006D0C D0040000 */ stfs f0, 0(r4)
/* 00006D10 4E800020 */ blr 
lbl_00006D14:
/* 00006D14 3C600000 */ lis r3, g_poolInfo@ha
/* 00006D18 38630000 */ addi r3, r3, g_poolInfo@l
/* 00006D1C 80C3000C */ lwz r6, 0xc(r3)
/* 00006D20 3C800000 */ lis r4, lbl_80206BD0@ha
/* 00006D24 3C600000 */ lis r3, controllerInfo@ha
/* 00006D28 88060000 */ lbz r0, 0(r6)
/* 00006D2C 38A40000 */ addi r5, r4, lbl_80206BD0@l
/* 00006D30 38830000 */ addi r4, r3, controllerInfo@l
/* 00006D34 7C000775 */ extsb. r0, r0
/* 00006D38 41820024 */ beq lbl_00006D5C
/* 00006D3C 80050000 */ lwz r0, 0(r5)
/* 00006D40 1C00003C */ mulli r0, r0, 0x3c
/* 00006D44 7C640214 */ add r3, r4, r0
/* 00006D48 A0030018 */ lhz r0, 0x18(r3)
/* 00006D4C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00006D50 4182000C */ beq lbl_00006D5C
/* 00006D54 38600001 */ li r3, 1
/* 00006D58 4E800020 */ blr 
lbl_00006D5C:
/* 00006D5C 88060001 */ lbz r0, 1(r6)
/* 00006D60 38A50004 */ addi r5, r5, 4
/* 00006D64 38C60001 */ addi r6, r6, 1
/* 00006D68 7C000775 */ extsb. r0, r0
/* 00006D6C 41820024 */ beq lbl_00006D90
/* 00006D70 80050000 */ lwz r0, 0(r5)
/* 00006D74 1C00003C */ mulli r0, r0, 0x3c
/* 00006D78 7C640214 */ add r3, r4, r0
/* 00006D7C A0030018 */ lhz r0, 0x18(r3)
/* 00006D80 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00006D84 4182000C */ beq lbl_00006D90
/* 00006D88 38600001 */ li r3, 1
/* 00006D8C 4E800020 */ blr 
lbl_00006D90:
/* 00006D90 88060001 */ lbz r0, 1(r6)
/* 00006D94 38C60001 */ addi r6, r6, 1
/* 00006D98 38A50004 */ addi r5, r5, 4
/* 00006D9C 7C000775 */ extsb. r0, r0
/* 00006DA0 41820024 */ beq lbl_00006DC4
/* 00006DA4 80050000 */ lwz r0, 0(r5)
/* 00006DA8 1C00003C */ mulli r0, r0, 0x3c
/* 00006DAC 7C640214 */ add r3, r4, r0
/* 00006DB0 A0030018 */ lhz r0, 0x18(r3)
/* 00006DB4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00006DB8 4182000C */ beq lbl_00006DC4
/* 00006DBC 38600001 */ li r3, 1
/* 00006DC0 4E800020 */ blr 
lbl_00006DC4:
/* 00006DC4 88060001 */ lbz r0, 1(r6)
/* 00006DC8 38A50004 */ addi r5, r5, 4
/* 00006DCC 7C000775 */ extsb. r0, r0
/* 00006DD0 41820024 */ beq lbl_00006DF4
/* 00006DD4 80050000 */ lwz r0, 0(r5)
/* 00006DD8 1C00003C */ mulli r0, r0, 0x3c
/* 00006DDC 7C640214 */ add r3, r4, r0
/* 00006DE0 A0030018 */ lhz r0, 0x18(r3)
/* 00006DE4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00006DE8 4182000C */ beq lbl_00006DF4
/* 00006DEC 38600001 */ li r3, 1
/* 00006DF0 4E800020 */ blr 
lbl_00006DF4:
/* 00006DF4 38600000 */ li r3, 0
/* 00006DF8 4E800020 */ blr 
lbl_00006DFC:
/* 00006DFC 7C0802A6 */ mflr r0
/* 00006E00 3CA00000 */ lis r5, lbl_0000CCF8@ha
/* 00006E04 90010004 */ stw r0, 4(r1)
/* 00006E08 9421FFF8 */ stwu r1, -8(r1)
/* 00006E0C 8803001F */ lbz r0, 0x1f(r3)
/* 00006E10 7C000774 */ extsb r0, r0
/* 00006E14 5406103A */ slwi r6, r0, 2
/* 00006E18 38050000 */ addi r0, r5, lbl_0000CCF8@l
/* 00006E1C 7CA03214 */ add r5, r0, r6
/* 00006E20 81850000 */ lwz r12, 0(r5)
/* 00006E24 7D8803A6 */ mtlr r12
/* 00006E28 4E800021 */ blrl 
/* 00006E2C 8001000C */ lwz r0, 0xc(r1)
/* 00006E30 38210008 */ addi r1, r1, 8
/* 00006E34 7C0803A6 */ mtlr r0
/* 00006E38 4E800020 */ blr 
lbl_00006E3C:
/* 00006E3C 7C0802A6 */ mflr r0
/* 00006E40 3CA00000 */ lis r5, lbl_0000C2C8@ha
/* 00006E44 90010004 */ stw r0, 4(r1)
/* 00006E48 9421FFD0 */ stwu r1, -0x30(r1)
/* 00006E4C 93E1002C */ stw r31, 0x2c(r1)
/* 00006E50 93C10028 */ stw r30, 0x28(r1)
/* 00006E54 3BC50000 */ addi r30, r5, lbl_0000C2C8@l
/* 00006E58 93A10024 */ stw r29, 0x24(r1)
/* 00006E5C 3BA40000 */ addi r29, r4, 0
/* 00006E60 93810020 */ stw r28, 0x20(r1)
/* 00006E64 3B830000 */ addi r28, r3, 0
/* 00006E68 4BFF92E5 */ bl camera_clear
/* 00006E6C 3BE00000 */ li r31, 0
/* 00006E70 B3FC010C */ sth r31, 0x10c(r28)
/* 00006E74 387C000C */ addi r3, r28, 0xc
/* 00006E78 C01D0004 */ lfs f0, 4(r29)
/* 00006E7C D01C000C */ stfs f0, 0xc(r28)
/* 00006E80 C83E0000 */ lfd f1, 0(r30)
/* 00006E84 C01D0008 */ lfs f0, 8(r29)
/* 00006E88 FC01002A */ fadd f0, f1, f0
/* 00006E8C FC000018 */ frsp f0, f0
/* 00006E90 D01C0010 */ stfs f0, 0x10(r28)
/* 00006E94 C01D000C */ lfs f0, 0xc(r29)
/* 00006E98 D01C0014 */ stfs f0, 0x14(r28)
/* 00006E9C 4BFF92B1 */ bl mathutil_mtxA_from_translate
/* 00006EA0 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00006EA4 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00006EA8 80630000 */ lwz r3, 0(r3)
/* 00006EAC 80630010 */ lwz r3, 0x10(r3)
/* 00006EB0 A863000E */ lha r3, 0xe(r3)
/* 00006EB4 4BFF9299 */ bl mathutil_mtxA_rotate_y
/* 00006EB8 C01E0008 */ lfs f0, 8(r30)
/* 00006EBC 389C0000 */ addi r4, r28, 0
/* 00006EC0 38610010 */ addi r3, r1, 0x10
/* 00006EC4 D0010010 */ stfs f0, 0x10(r1)
/* 00006EC8 C01E000C */ lfs f0, 0xc(r30)
/* 00006ECC D0010014 */ stfs f0, 0x14(r1)
/* 00006ED0 C01E0010 */ lfs f0, 0x10(r30)
/* 00006ED4 D0010018 */ stfs f0, 0x18(r1)
/* 00006ED8 4BFF9275 */ bl mathutil_mtxA_tf_point
/* 00006EDC C01E0008 */ lfs f0, 8(r30)
/* 00006EE0 38610010 */ addi r3, r1, 0x10
/* 00006EE4 389C00AC */ addi r4, r28, 0xac
/* 00006EE8 D0010010 */ stfs f0, 0x10(r1)
/* 00006EEC C01E0008 */ lfs f0, 8(r30)
/* 00006EF0 D0010014 */ stfs f0, 0x14(r1)
/* 00006EF4 C01E0010 */ lfs f0, 0x10(r30)
/* 00006EF8 D0010018 */ stfs f0, 0x18(r1)
/* 00006EFC 4BFF9251 */ bl mathutil_mtxA_tf_point
/* 00006F00 C03C000C */ lfs f1, 0xc(r28)
/* 00006F04 C01C0000 */ lfs f0, 0(r28)
/* 00006F08 EC010028 */ fsubs f0, f1, f0
/* 00006F0C D0010010 */ stfs f0, 0x10(r1)
/* 00006F10 C03C0010 */ lfs f1, 0x10(r28)
/* 00006F14 C01C0004 */ lfs f0, 4(r28)
/* 00006F18 EC010028 */ fsubs f0, f1, f0
/* 00006F1C D0010014 */ stfs f0, 0x14(r1)
/* 00006F20 C03C0014 */ lfs f1, 0x14(r28)
/* 00006F24 C01C0008 */ lfs f0, 8(r28)
/* 00006F28 EC010028 */ fsubs f0, f1, f0
/* 00006F2C D0010018 */ stfs f0, 0x18(r1)
/* 00006F30 C0210010 */ lfs f1, 0x10(r1)
/* 00006F34 C0410018 */ lfs f2, 0x18(r1)
/* 00006F38 4BFF9215 */ bl mathutil_atan2
/* 00006F3C 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 00006F40 B01C001A */ sth r0, 0x1a(r28)
/* 00006F44 C0010018 */ lfs f0, 0x18(r1)
/* 00006F48 C0210010 */ lfs f1, 0x10(r1)
/* 00006F4C EC210072 */ fmuls f1, f1, f1
/* 00006F50 EC20083A */ fmadds f1, f0, f0, f1
/* 00006F54 4BFF91F9 */ bl mathutil_sqrt
/* 00006F58 FC400890 */ fmr f2, f1
/* 00006F5C C0210014 */ lfs f1, 0x14(r1)
/* 00006F60 4BFF91ED */ bl mathutil_atan2
/* 00006F64 B07C0018 */ sth r3, 0x18(r28)
/* 00006F68 38000001 */ li r0, 1
/* 00006F6C B3FC001C */ sth r31, 0x1c(r28)
/* 00006F70 981C001F */ stb r0, 0x1f(r28)
/* 00006F74 80010034 */ lwz r0, 0x34(r1)
/* 00006F78 83E1002C */ lwz r31, 0x2c(r1)
/* 00006F7C 83C10028 */ lwz r30, 0x28(r1)
/* 00006F80 83A10024 */ lwz r29, 0x24(r1)
/* 00006F84 83810020 */ lwz r28, 0x20(r1)
/* 00006F88 38210030 */ addi r1, r1, 0x30
/* 00006F8C 7C0803A6 */ mtlr r0
/* 00006F90 4E800020 */ blr 
lbl_00006F94:
/* 00006F94 7C0802A6 */ mflr r0
/* 00006F98 3CA00000 */ lis r5, gamePauseStatus@ha
/* 00006F9C 90010004 */ stw r0, 4(r1)
/* 00006FA0 9421FF98 */ stwu r1, -0x68(r1)
/* 00006FA4 BF610054 */ stmw r27, 0x54(r1)
/* 00006FA8 3B630000 */ addi r27, r3, 0
/* 00006FAC 3B840000 */ addi r28, r4, 0
/* 00006FB0 80050000 */ lwz r0, gamePauseStatus@l(r5)
/* 00006FB4 3CA00000 */ lis r5, lbl_0000C2C8@ha
/* 00006FB8 3BE50000 */ addi r31, r5, lbl_0000C2C8@l
/* 00006FBC 7000000A */ andi. r0, r0, 0xa
/* 00006FC0 40820470 */ bne lbl_00007430
/* 00006FC4 C01B0000 */ lfs f0, 0(r27)
/* 00006FC8 D001001C */ stfs f0, 0x1c(r1)
/* 00006FCC C01B0004 */ lfs f0, 4(r27)
/* 00006FD0 D0010020 */ stfs f0, 0x20(r1)
/* 00006FD4 C01B0008 */ lfs f0, 8(r27)
/* 00006FD8 D0010024 */ stfs f0, 0x24(r1)
/* 00006FDC C01B000C */ lfs f0, 0xc(r27)
/* 00006FE0 D0010010 */ stfs f0, 0x10(r1)
/* 00006FE4 C01B0010 */ lfs f0, 0x10(r27)
/* 00006FE8 D0010014 */ stfs f0, 0x14(r1)
/* 00006FEC C01B0014 */ lfs f0, 0x14(r27)
/* 00006FF0 D0010018 */ stfs f0, 0x18(r1)
/* 00006FF4 C03B00AC */ lfs f1, 0xac(r27)
/* 00006FF8 C01B000C */ lfs f0, 0xc(r27)
/* 00006FFC EC010028 */ fsubs f0, f1, f0
/* 00007000 D0010028 */ stfs f0, 0x28(r1)
/* 00007004 C03B00B0 */ lfs f1, 0xb0(r27)
/* 00007008 C01B0010 */ lfs f0, 0x10(r27)
/* 0000700C EC010028 */ fsubs f0, f1, f0
/* 00007010 D001002C */ stfs f0, 0x2c(r1)
/* 00007014 C03B00B4 */ lfs f1, 0xb4(r27)
/* 00007018 C01B0014 */ lfs f0, 0x14(r27)
/* 0000701C EC010028 */ fsubs f0, f1, f0
/* 00007020 D0010030 */ stfs f0, 0x30(r1)
/* 00007024 C0410030 */ lfs f2, 0x30(r1)
/* 00007028 C001002C */ lfs f0, 0x2c(r1)
/* 0000702C C0210028 */ lfs f1, 0x28(r1)
/* 00007030 EC210072 */ fmuls f1, f1, f1
/* 00007034 EC20083A */ fmadds f1, f0, f0, f1
/* 00007038 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000703C C01F0014 */ lfs f0, 0x14(r31)
/* 00007040 FC010040 */ fcmpo cr0, f1, f0
/* 00007044 40810030 */ ble lbl_00007074
/* 00007048 4BFF9105 */ bl mathutil_rsqrt
/* 0000704C C0010028 */ lfs f0, 0x28(r1)
/* 00007050 EC000072 */ fmuls f0, f0, f1
/* 00007054 D0010028 */ stfs f0, 0x28(r1)
/* 00007058 C001002C */ lfs f0, 0x2c(r1)
/* 0000705C EC000072 */ fmuls f0, f0, f1
/* 00007060 D001002C */ stfs f0, 0x2c(r1)
/* 00007064 C0010030 */ lfs f0, 0x30(r1)
/* 00007068 EC000072 */ fmuls f0, f0, f1
/* 0000706C D0010030 */ stfs f0, 0x30(r1)
/* 00007070 4800001C */ b lbl_0000708C
lbl_00007074:
/* 00007074 C01F000C */ lfs f0, 0xc(r31)
/* 00007078 D0010028 */ stfs f0, 0x28(r1)
/* 0000707C C01F0008 */ lfs f0, 8(r31)
/* 00007080 D001002C */ stfs f0, 0x2c(r1)
/* 00007084 C01F0008 */ lfs f0, 8(r31)
/* 00007088 D0010030 */ stfs f0, 0x30(r1)
lbl_0000708C:
/* 0000708C C85F0018 */ lfd f2, 0x18(r31)
/* 00007090 C0210028 */ lfs f1, 0x28(r1)
/* 00007094 C01B000C */ lfs f0, 0xc(r27)
/* 00007098 FC220072 */ fmul f1, f2, f1
/* 0000709C FC01002A */ fadd f0, f1, f0
/* 000070A0 FC000018 */ frsp f0, f0
/* 000070A4 D0010028 */ stfs f0, 0x28(r1)
/* 000070A8 C85F0018 */ lfd f2, 0x18(r31)
/* 000070AC C021002C */ lfs f1, 0x2c(r1)
/* 000070B0 C01B0010 */ lfs f0, 0x10(r27)
/* 000070B4 FC220072 */ fmul f1, f2, f1
/* 000070B8 FC01002A */ fadd f0, f1, f0
/* 000070BC FC000018 */ frsp f0, f0
/* 000070C0 D001002C */ stfs f0, 0x2c(r1)
/* 000070C4 C85F0018 */ lfd f2, 0x18(r31)
/* 000070C8 C0210030 */ lfs f1, 0x30(r1)
/* 000070CC C01B0014 */ lfs f0, 0x14(r27)
/* 000070D0 FC220072 */ fmul f1, f2, f1
/* 000070D4 FC01002A */ fadd f0, f1, f0
/* 000070D8 FC000018 */ frsp f0, f0
/* 000070DC D0010030 */ stfs f0, 0x30(r1)
/* 000070E0 C01C0004 */ lfs f0, 4(r28)
/* 000070E4 D01B000C */ stfs f0, 0xc(r27)
/* 000070E8 C83F0000 */ lfd f1, 0(r31)
/* 000070EC C01C0008 */ lfs f0, 8(r28)
/* 000070F0 FC01002A */ fadd f0, f1, f0
/* 000070F4 FC000018 */ frsp f0, f0
/* 000070F8 D01B0010 */ stfs f0, 0x10(r27)
/* 000070FC C01C000C */ lfs f0, 0xc(r28)
/* 00007100 D01B0014 */ stfs f0, 0x14(r27)
/* 00007104 C03B000C */ lfs f1, 0xc(r27)
/* 00007108 C0010028 */ lfs f0, 0x28(r1)
/* 0000710C EC010028 */ fsubs f0, f1, f0
/* 00007110 D0010028 */ stfs f0, 0x28(r1)
/* 00007114 C03B0010 */ lfs f1, 0x10(r27)
/* 00007118 C001002C */ lfs f0, 0x2c(r1)
/* 0000711C EC010028 */ fsubs f0, f1, f0
/* 00007120 D001002C */ stfs f0, 0x2c(r1)
/* 00007124 C03B0014 */ lfs f1, 0x14(r27)
/* 00007128 C0010030 */ lfs f0, 0x30(r1)
/* 0000712C EC010028 */ fsubs f0, f1, f0
/* 00007130 D0010030 */ stfs f0, 0x30(r1)
/* 00007134 801C0080 */ lwz r0, 0x80(r28)
/* 00007138 2C0000B4 */ cmpwi r0, 0xb4
/* 0000713C 4080000C */ bge lbl_00007148
/* 00007140 3BC00000 */ li r30, 0
/* 00007144 48000028 */ b lbl_0000716C
lbl_00007148:
/* 00007148 C0010030 */ lfs f0, 0x30(r1)
/* 0000714C C0210028 */ lfs f1, 0x28(r1)
/* 00007150 EC210072 */ fmuls f1, f1, f1
/* 00007154 EC20083A */ fmadds f1, f0, f0, f1
/* 00007158 4BFF8FF5 */ bl mathutil_sqrt
/* 0000715C FC400890 */ fmr f2, f1
/* 00007160 C021002C */ lfs f1, 0x2c(r1)
/* 00007164 4BFF8FE9 */ bl mathutil_atan2
/* 00007168 7C7E1B78 */ mr r30, r3
lbl_0000716C:
/* 0000716C C0210028 */ lfs f1, 0x28(r1)
/* 00007170 C0410030 */ lfs f2, 0x30(r1)
/* 00007174 4BFF8FD9 */ bl mathutil_atan2
/* 00007178 A81B001A */ lha r0, 0x1a(r27)
/* 0000717C 3BA38000 */ addi r29, r3, -32768  ;# fixed addi
/* 00007180 7C00E850 */ subf r0, r0, r29
/* 00007184 7C030734 */ extsh r3, r0
/* 00007188 2C03FE00 */ cmpwi r3, -512
/* 0000718C 4080000C */ bge lbl_00007198
/* 00007190 3880FE00 */ li r4, -512
/* 00007194 48000018 */ b lbl_000071AC
lbl_00007198:
/* 00007198 2C030200 */ cmpwi r3, 0x200
/* 0000719C 4081000C */ ble lbl_000071A8
/* 000071A0 38800200 */ li r4, 0x200
/* 000071A4 48000008 */ b lbl_000071AC
lbl_000071A8:
/* 000071A8 7C641B78 */ mr r4, r3
lbl_000071AC:
/* 000071AC A81B0024 */ lha r0, 0x24(r27)
/* 000071B0 A87B001A */ lha r3, 0x1a(r27)
/* 000071B4 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000071B8 7FA32214 */ add r29, r3, r4
/* 000071BC 408200EC */ bne lbl_000072A8
/* 000071C0 801C0094 */ lwz r0, 0x94(r28)
/* 000071C4 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 000071C8 408200E0 */ bne lbl_000072A8
/* 000071CC A81C0092 */ lha r0, 0x92(r28)
/* 000071D0 7C1D0050 */ subf r0, r29, r0
/* 000071D4 7C030734 */ extsh r3, r0
/* 000071D8 2C030800 */ cmpwi r3, 0x800
/* 000071DC 4081000C */ ble lbl_000071E8
/* 000071E0 3863F800 */ addi r3, r3, -2048  ;# fixed addi
/* 000071E4 48000018 */ b lbl_000071FC
lbl_000071E8:
/* 000071E8 2C03F800 */ cmpwi r3, -2048
/* 000071EC 4080000C */ bge lbl_000071F8
/* 000071F0 38630800 */ addi r3, r3, 0x800
/* 000071F4 48000008 */ b lbl_000071FC
lbl_000071F8:
/* 000071F8 38600000 */ li r3, 0
lbl_000071FC:
/* 000071FC 7C633E71 */ srawi. r3, r3, 7
/* 00007200 A89B010C */ lha r4, 0x10c(r27)
/* 00007204 4082000C */ bne lbl_00007210
/* 00007208 38800000 */ li r4, 0
/* 0000720C 48000068 */ b lbl_00007274
lbl_00007210:
/* 00007210 2C040000 */ cmpwi r4, 0
/* 00007214 4080000C */ bge lbl_00007220
/* 00007218 2C030000 */ cmpwi r3, 0
/* 0000721C 41810014 */ bgt lbl_00007230
lbl_00007220:
/* 00007220 2C040000 */ cmpwi r4, 0
/* 00007224 40810014 */ ble lbl_00007238
/* 00007228 2C030000 */ cmpwi r3, 0
/* 0000722C 4080000C */ bge lbl_00007238
lbl_00007230:
/* 00007230 38800000 */ li r4, 0
/* 00007234 48000040 */ b lbl_00007274
lbl_00007238:
/* 00007238 2C030000 */ cmpwi r3, 0
/* 0000723C 40800020 */ bge lbl_0000725C
/* 00007240 3804FFFC */ addi r0, r4, -4  ;# fixed addi
/* 00007244 7C030000 */ cmpw r3, r0
/* 00007248 4080000C */ bge lbl_00007254
/* 0000724C 3884FFFC */ addi r4, r4, -4  ;# fixed addi
/* 00007250 48000024 */ b lbl_00007274
lbl_00007254:
/* 00007254 7C641B78 */ mr r4, r3
/* 00007258 4800001C */ b lbl_00007274
lbl_0000725C:
/* 0000725C 38040004 */ addi r0, r4, 4
/* 00007260 7C030000 */ cmpw r3, r0
/* 00007264 4081000C */ ble lbl_00007270
/* 00007268 38840004 */ addi r4, r4, 4
/* 0000726C 48000008 */ b lbl_00007274
lbl_00007270:
/* 00007270 7C641B78 */ mr r4, r3
lbl_00007274:
/* 00007274 A81B001A */ lha r0, 0x1a(r27)
/* 00007278 7FBD2214 */ add r29, r29, r4
/* 0000727C 7C00E850 */ subf r0, r0, r29
/* 00007280 7C030734 */ extsh r3, r0
/* 00007284 2C03FD00 */ cmpwi r3, -768
/* 00007288 4080000C */ bge lbl_00007294
/* 0000728C 3860FD00 */ li r3, -768
/* 00007290 48000010 */ b lbl_000072A0
lbl_00007294:
/* 00007294 2C030300 */ cmpwi r3, 0x300
/* 00007298 40810008 */ ble lbl_000072A0
/* 0000729C 38600300 */ li r3, 0x300
lbl_000072A0:
/* 000072A0 A81B001A */ lha r0, 0x1a(r27)
/* 000072A4 7FA01A14 */ add r29, r0, r3
lbl_000072A8:
/* 000072A8 7FC00734 */ extsh r0, r30
/* 000072AC 2C00E000 */ cmpwi r0, -8192
/* 000072B0 4080000C */ bge lbl_000072BC
/* 000072B4 3BC0E000 */ li r30, -8192
/* 000072B8 48000010 */ b lbl_000072C8
lbl_000072BC:
/* 000072BC 2C002000 */ cmpwi r0, 0x2000
/* 000072C0 40810008 */ ble lbl_000072C8
/* 000072C4 3BC02000 */ li r30, 0x2000
lbl_000072C8:
/* 000072C8 A89B00B8 */ lha r4, 0xb8(r27)
/* 000072CC 7FC00734 */ extsh r0, r30
/* 000072D0 3C600000 */ lis r3, lbl_0000C2F0@ha
/* 000072D4 C85F0020 */ lfd f2, 0x20(r31)
/* 000072D8 7C040050 */ subf r0, r4, r0
/* 000072DC 6C008000 */ xoris r0, r0, 0x8000
/* 000072E0 C8230000 */ lfd f1, lbl_0000C2F0@l(r3)
/* 000072E4 90010044 */ stw r0, 0x44(r1)
/* 000072E8 3C004330 */ lis r0, 0x4330
/* 000072EC 6C848000 */ xoris r4, r4, 0x8000
/* 000072F0 90010040 */ stw r0, 0x40(r1)
/* 000072F4 3CA00000 */ lis r5, lbl_0000C2F0@ha
/* 000072F8 C8650000 */ lfd f3, lbl_0000C2F0@l(r5)
/* 000072FC 387B000C */ addi r3, r27, 0xc
/* 00007300 9081004C */ stw r4, 0x4c(r1)
/* 00007304 C8010040 */ lfd f0, 0x40(r1)
/* 00007308 90010048 */ stw r0, 0x48(r1)
/* 0000730C FC000828 */ fsub f0, f0, f1
/* 00007310 C8210048 */ lfd f1, 0x48(r1)
/* 00007314 FC020032 */ fmul f0, f2, f0
/* 00007318 FC211828 */ fsub f1, f1, f3
/* 0000731C FC01002A */ fadd f0, f1, f0
/* 00007320 FC00001E */ fctiwz f0, f0
/* 00007324 D8010038 */ stfd f0, 0x38(r1)
/* 00007328 8381003C */ lwz r28, 0x3c(r1)
/* 0000732C B39B00B8 */ sth r28, 0xb8(r27)
/* 00007330 4BFF8E1D */ bl mathutil_mtxA_from_translate
/* 00007334 7FA30734 */ extsh r3, r29
/* 00007338 4BFF8E15 */ bl mathutil_mtxA_rotate_y
/* 0000733C 7F830734 */ extsh r3, r28
/* 00007340 4BFF8E0D */ bl mathutil_mtxA_rotate_x
/* 00007344 C01F0008 */ lfs f0, 8(r31)
/* 00007348 38610028 */ addi r3, r1, 0x28
/* 0000734C 389B00AC */ addi r4, r27, 0xac
/* 00007350 D0010028 */ stfs f0, 0x28(r1)
/* 00007354 C01F0008 */ lfs f0, 8(r31)
/* 00007358 D001002C */ stfs f0, 0x2c(r1)
/* 0000735C C01F0010 */ lfs f0, 0x10(r31)
/* 00007360 D0010030 */ stfs f0, 0x30(r1)
/* 00007364 4BFF8DE9 */ bl mathutil_mtxA_tf_point
/* 00007368 A89B001A */ lha r4, 0x1a(r27)
/* 0000736C 3C7C0001 */ addis r3, r28, 1
/* 00007370 3803F300 */ addi r0, r3, -3328  ;# fixed addi
/* 00007374 7C64E850 */ subf r3, r4, r29
/* 00007378 B07B010C */ sth r3, 0x10c(r27)
/* 0000737C 387B000C */ addi r3, r27, 0xc
/* 00007380 B3BB001A */ sth r29, 0x1a(r27)
/* 00007384 B01B0018 */ sth r0, 0x18(r27)
/* 00007388 4BFF8DC5 */ bl mathutil_mtxA_from_translate
/* 0000738C A87B001A */ lha r3, 0x1a(r27)
/* 00007390 4BFF8DBD */ bl mathutil_mtxA_rotate_y
/* 00007394 A87B0018 */ lha r3, 0x18(r27)
/* 00007398 4BFF8DB5 */ bl mathutil_mtxA_rotate_x
/* 0000739C C01F0008 */ lfs f0, 8(r31)
/* 000073A0 D0010028 */ stfs f0, 0x28(r1)
/* 000073A4 C01F0008 */ lfs f0, 8(r31)
/* 000073A8 D001002C */ stfs f0, 0x2c(r1)
/* 000073AC C01F000C */ lfs f0, 0xc(r31)
/* 000073B0 C03F0010 */ lfs f1, 0x10(r31)
/* 000073B4 EC210072 */ fmuls f1, f1, f1
/* 000073B8 EC20083A */ fmadds f1, f0, f0, f1
/* 000073BC 4BFF8D91 */ bl mathutil_sqrt
/* 000073C0 D0210030 */ stfs f1, 0x30(r1)
/* 000073C4 389B0000 */ addi r4, r27, 0
/* 000073C8 38610028 */ addi r3, r1, 0x28
/* 000073CC 4BFF8D81 */ bl mathutil_mtxA_tf_point
/* 000073D0 C03B0000 */ lfs f1, 0(r27)
/* 000073D4 C001001C */ lfs f0, 0x1c(r1)
/* 000073D8 EC010028 */ fsubs f0, f1, f0
/* 000073DC D01B0094 */ stfs f0, 0x94(r27)
/* 000073E0 C03B0004 */ lfs f1, 4(r27)
/* 000073E4 C0010020 */ lfs f0, 0x20(r1)
/* 000073E8 EC010028 */ fsubs f0, f1, f0
/* 000073EC D01B0098 */ stfs f0, 0x98(r27)
/* 000073F0 C03B0008 */ lfs f1, 8(r27)
/* 000073F4 C0010024 */ lfs f0, 0x24(r1)
/* 000073F8 EC010028 */ fsubs f0, f1, f0
/* 000073FC D01B009C */ stfs f0, 0x9c(r27)
/* 00007400 C03B000C */ lfs f1, 0xc(r27)
/* 00007404 C0010010 */ lfs f0, 0x10(r1)
/* 00007408 EC010028 */ fsubs f0, f1, f0
/* 0000740C D01B00A0 */ stfs f0, 0xa0(r27)
/* 00007410 C03B0010 */ lfs f1, 0x10(r27)
/* 00007414 C0010014 */ lfs f0, 0x14(r1)
/* 00007418 EC010028 */ fsubs f0, f1, f0
/* 0000741C D01B00A4 */ stfs f0, 0xa4(r27)
/* 00007420 C03B0014 */ lfs f1, 0x14(r27)
/* 00007424 C0010018 */ lfs f0, 0x18(r1)
/* 00007428 EC010028 */ fsubs f0, f1, f0
/* 0000742C D01B00A8 */ stfs f0, 0xa8(r27)
lbl_00007430:
/* 00007430 BB610054 */ lmw r27, 0x54(r1)
/* 00007434 8001006C */ lwz r0, 0x6c(r1)
/* 00007438 38210068 */ addi r1, r1, 0x68
/* 0000743C 7C0803A6 */ mtlr r0
/* 00007440 4E800020 */ blr 
lbl_00007444:
/* 00007444 7C0802A6 */ mflr r0
/* 00007448 3CA00000 */ lis r5, gamePauseStatus@ha
/* 0000744C 90010004 */ stw r0, 4(r1)
/* 00007450 9421FF90 */ stwu r1, -0x70(r1)
/* 00007454 BF61005C */ stmw r27, 0x5c(r1)
/* 00007458 3B630000 */ addi r27, r3, 0
/* 0000745C 3B840000 */ addi r28, r4, 0
/* 00007460 80050000 */ lwz r0, gamePauseStatus@l(r5)
/* 00007464 3CA00000 */ lis r5, lbl_0000C2C8@ha
/* 00007468 3BE50000 */ addi r31, r5, lbl_0000C2C8@l
/* 0000746C 7000000A */ andi. r0, r0, 0xa
/* 00007470 4082059C */ bne lbl_00007A0C
/* 00007474 807B0000 */ lwz r3, 0(r27)
/* 00007478 801B0004 */ lwz r0, 4(r27)
/* 0000747C 9061001C */ stw r3, 0x1c(r1)
/* 00007480 90010020 */ stw r0, 0x20(r1)
/* 00007484 801B0008 */ lwz r0, 8(r27)
/* 00007488 90010024 */ stw r0, 0x24(r1)
/* 0000748C 807B000C */ lwz r3, 0xc(r27)
/* 00007490 801B0010 */ lwz r0, 0x10(r27)
/* 00007494 90610010 */ stw r3, 0x10(r1)
/* 00007498 90010014 */ stw r0, 0x14(r1)
/* 0000749C 801B0014 */ lwz r0, 0x14(r27)
/* 000074A0 90010018 */ stw r0, 0x18(r1)
/* 000074A4 C03B00AC */ lfs f1, 0xac(r27)
/* 000074A8 C01B000C */ lfs f0, 0xc(r27)
/* 000074AC EC010028 */ fsubs f0, f1, f0
/* 000074B0 D0010028 */ stfs f0, 0x28(r1)
/* 000074B4 C03B00B0 */ lfs f1, 0xb0(r27)
/* 000074B8 C01B0010 */ lfs f0, 0x10(r27)
/* 000074BC EC010028 */ fsubs f0, f1, f0
/* 000074C0 D001002C */ stfs f0, 0x2c(r1)
/* 000074C4 C03B00B4 */ lfs f1, 0xb4(r27)
/* 000074C8 C01B0014 */ lfs f0, 0x14(r27)
/* 000074CC EC010028 */ fsubs f0, f1, f0
/* 000074D0 D0010030 */ stfs f0, 0x30(r1)
/* 000074D4 C0410030 */ lfs f2, 0x30(r1)
/* 000074D8 C001002C */ lfs f0, 0x2c(r1)
/* 000074DC C0210028 */ lfs f1, 0x28(r1)
/* 000074E0 EC210072 */ fmuls f1, f1, f1
/* 000074E4 EC20083A */ fmadds f1, f0, f0, f1
/* 000074E8 EC2208BA */ fmadds f1, f2, f2, f1
/* 000074EC C01F0014 */ lfs f0, 0x14(r31)
/* 000074F0 FC010040 */ fcmpo cr0, f1, f0
/* 000074F4 40810030 */ ble lbl_00007524
/* 000074F8 4BFF8C55 */ bl mathutil_rsqrt
/* 000074FC C0010028 */ lfs f0, 0x28(r1)
/* 00007500 EC000072 */ fmuls f0, f0, f1
/* 00007504 D0010028 */ stfs f0, 0x28(r1)
/* 00007508 C001002C */ lfs f0, 0x2c(r1)
/* 0000750C EC000072 */ fmuls f0, f0, f1
/* 00007510 D001002C */ stfs f0, 0x2c(r1)
/* 00007514 C0010030 */ lfs f0, 0x30(r1)
/* 00007518 EC000072 */ fmuls f0, f0, f1
/* 0000751C D0010030 */ stfs f0, 0x30(r1)
/* 00007520 4800001C */ b lbl_0000753C
lbl_00007524:
/* 00007524 C01F000C */ lfs f0, 0xc(r31)
/* 00007528 D0010028 */ stfs f0, 0x28(r1)
/* 0000752C C01F0008 */ lfs f0, 8(r31)
/* 00007530 D001002C */ stfs f0, 0x2c(r1)
/* 00007534 C01F0008 */ lfs f0, 8(r31)
/* 00007538 D0010030 */ stfs f0, 0x30(r1)
lbl_0000753C:
/* 0000753C C85F0018 */ lfd f2, 0x18(r31)
/* 00007540 C0210028 */ lfs f1, 0x28(r1)
/* 00007544 C01B000C */ lfs f0, 0xc(r27)
/* 00007548 FC220072 */ fmul f1, f2, f1
/* 0000754C FC01002A */ fadd f0, f1, f0
/* 00007550 FC000018 */ frsp f0, f0
/* 00007554 D0010028 */ stfs f0, 0x28(r1)
/* 00007558 C85F0018 */ lfd f2, 0x18(r31)
/* 0000755C C021002C */ lfs f1, 0x2c(r1)
/* 00007560 C01B0010 */ lfs f0, 0x10(r27)
/* 00007564 FC220072 */ fmul f1, f2, f1
/* 00007568 FC01002A */ fadd f0, f1, f0
/* 0000756C FC000018 */ frsp f0, f0
/* 00007570 D001002C */ stfs f0, 0x2c(r1)
/* 00007574 C85F0018 */ lfd f2, 0x18(r31)
/* 00007578 C0210030 */ lfs f1, 0x30(r1)
/* 0000757C C01B0014 */ lfs f0, 0x14(r27)
/* 00007580 FC220072 */ fmul f1, f2, f1
/* 00007584 FC01002A */ fadd f0, f1, f0
/* 00007588 FC000018 */ frsp f0, f0
/* 0000758C D0010030 */ stfs f0, 0x30(r1)
/* 00007590 C01C0004 */ lfs f0, 4(r28)
/* 00007594 D01B000C */ stfs f0, 0xc(r27)
/* 00007598 C83F0000 */ lfd f1, 0(r31)
/* 0000759C C01C0008 */ lfs f0, 8(r28)
/* 000075A0 FC01002A */ fadd f0, f1, f0
/* 000075A4 FC000018 */ frsp f0, f0
/* 000075A8 D01B0010 */ stfs f0, 0x10(r27)
/* 000075AC C01C000C */ lfs f0, 0xc(r28)
/* 000075B0 D01B0014 */ stfs f0, 0x14(r27)
/* 000075B4 C03B000C */ lfs f1, 0xc(r27)
/* 000075B8 C0010028 */ lfs f0, 0x28(r1)
/* 000075BC EC010028 */ fsubs f0, f1, f0
/* 000075C0 D0010028 */ stfs f0, 0x28(r1)
/* 000075C4 C03B0010 */ lfs f1, 0x10(r27)
/* 000075C8 C001002C */ lfs f0, 0x2c(r1)
/* 000075CC EC010028 */ fsubs f0, f1, f0
/* 000075D0 D001002C */ stfs f0, 0x2c(r1)
/* 000075D4 C03B0014 */ lfs f1, 0x14(r27)
/* 000075D8 C0010030 */ lfs f0, 0x30(r1)
/* 000075DC EC010028 */ fsubs f0, f1, f0
/* 000075E0 D0010030 */ stfs f0, 0x30(r1)
/* 000075E4 801C0080 */ lwz r0, 0x80(r28)
/* 000075E8 2C00003C */ cmpwi r0, 0x3c
/* 000075EC 4080000C */ bge lbl_000075F8
/* 000075F0 3BC00000 */ li r30, 0
/* 000075F4 48000028 */ b lbl_0000761C
lbl_000075F8:
/* 000075F8 C0010030 */ lfs f0, 0x30(r1)
/* 000075FC C0210028 */ lfs f1, 0x28(r1)
/* 00007600 EC210072 */ fmuls f1, f1, f1
/* 00007604 EC20083A */ fmadds f1, f0, f0, f1
/* 00007608 4BFF8B45 */ bl mathutil_sqrt
/* 0000760C FC400890 */ fmr f2, f1
/* 00007610 C021002C */ lfs f1, 0x2c(r1)
/* 00007614 4BFF8B39 */ bl mathutil_atan2
/* 00007618 7C7E1B78 */ mr r30, r3
lbl_0000761C:
/* 0000761C C0210028 */ lfs f1, 0x28(r1)
/* 00007620 C0410030 */ lfs f2, 0x30(r1)
/* 00007624 4BFF8B29 */ bl mathutil_atan2
/* 00007628 A81B001A */ lha r0, 0x1a(r27)
/* 0000762C 3BA38000 */ addi r29, r3, -32768  ;# fixed addi
/* 00007630 7C00E850 */ subf r0, r0, r29
/* 00007634 7C030734 */ extsh r3, r0
/* 00007638 2C03FE00 */ cmpwi r3, -512
/* 0000763C 4080000C */ bge lbl_00007648
/* 00007640 3880FE00 */ li r4, -512
/* 00007644 48000018 */ b lbl_0000765C
lbl_00007648:
/* 00007648 2C030200 */ cmpwi r3, 0x200
/* 0000764C 4081000C */ ble lbl_00007658
/* 00007650 38800200 */ li r4, 0x200
/* 00007654 48000008 */ b lbl_0000765C
lbl_00007658:
/* 00007658 7C641B78 */ mr r4, r3
lbl_0000765C:
/* 0000765C A81B0024 */ lha r0, 0x24(r27)
/* 00007660 A87B001A */ lha r3, 0x1a(r27)
/* 00007664 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00007668 7FA32214 */ add r29, r3, r4
/* 0000766C 408200EC */ bne lbl_00007758
/* 00007670 801C0094 */ lwz r0, 0x94(r28)
/* 00007674 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00007678 408200E0 */ bne lbl_00007758
/* 0000767C A81C0092 */ lha r0, 0x92(r28)
/* 00007680 7C1D0050 */ subf r0, r29, r0
/* 00007684 7C030734 */ extsh r3, r0
/* 00007688 2C030800 */ cmpwi r3, 0x800
/* 0000768C 4081000C */ ble lbl_00007698
/* 00007690 3863F800 */ addi r3, r3, -2048  ;# fixed addi
/* 00007694 48000018 */ b lbl_000076AC
lbl_00007698:
/* 00007698 2C03F800 */ cmpwi r3, -2048
/* 0000769C 4080000C */ bge lbl_000076A8
/* 000076A0 38630800 */ addi r3, r3, 0x800
/* 000076A4 48000008 */ b lbl_000076AC
lbl_000076A8:
/* 000076A8 38600000 */ li r3, 0
lbl_000076AC:
/* 000076AC 7C633E71 */ srawi. r3, r3, 7
/* 000076B0 A89B010C */ lha r4, 0x10c(r27)
/* 000076B4 4082000C */ bne lbl_000076C0
/* 000076B8 38800000 */ li r4, 0
/* 000076BC 48000068 */ b lbl_00007724
lbl_000076C0:
/* 000076C0 2C040000 */ cmpwi r4, 0
/* 000076C4 4080000C */ bge lbl_000076D0
/* 000076C8 2C030000 */ cmpwi r3, 0
/* 000076CC 41810014 */ bgt lbl_000076E0
lbl_000076D0:
/* 000076D0 2C040000 */ cmpwi r4, 0
/* 000076D4 40810014 */ ble lbl_000076E8
/* 000076D8 2C030000 */ cmpwi r3, 0
/* 000076DC 4080000C */ bge lbl_000076E8
lbl_000076E0:
/* 000076E0 38800000 */ li r4, 0
/* 000076E4 48000040 */ b lbl_00007724
lbl_000076E8:
/* 000076E8 2C030000 */ cmpwi r3, 0
/* 000076EC 40800020 */ bge lbl_0000770C
/* 000076F0 3804FFFC */ addi r0, r4, -4  ;# fixed addi
/* 000076F4 7C030000 */ cmpw r3, r0
/* 000076F8 4080000C */ bge lbl_00007704
/* 000076FC 3884FFFC */ addi r4, r4, -4  ;# fixed addi
/* 00007700 48000024 */ b lbl_00007724
lbl_00007704:
/* 00007704 7C641B78 */ mr r4, r3
/* 00007708 4800001C */ b lbl_00007724
lbl_0000770C:
/* 0000770C 38040004 */ addi r0, r4, 4
/* 00007710 7C030000 */ cmpw r3, r0
/* 00007714 4081000C */ ble lbl_00007720
/* 00007718 38840004 */ addi r4, r4, 4
/* 0000771C 48000008 */ b lbl_00007724
lbl_00007720:
/* 00007720 7C641B78 */ mr r4, r3
lbl_00007724:
/* 00007724 A81B001A */ lha r0, 0x1a(r27)
/* 00007728 7FBD2214 */ add r29, r29, r4
/* 0000772C 7C00E850 */ subf r0, r0, r29
/* 00007730 7C030734 */ extsh r3, r0
/* 00007734 2C03FD00 */ cmpwi r3, -768
/* 00007738 4080000C */ bge lbl_00007744
/* 0000773C 3860FD00 */ li r3, -768
/* 00007740 48000010 */ b lbl_00007750
lbl_00007744:
/* 00007744 2C030300 */ cmpwi r3, 0x300
/* 00007748 40810008 */ ble lbl_00007750
/* 0000774C 38600300 */ li r3, 0x300
lbl_00007750:
/* 00007750 A81B001A */ lha r0, 0x1a(r27)
/* 00007754 7FA01A14 */ add r29, r0, r3
lbl_00007758:
/* 00007758 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 0000775C C01F0008 */ lfs f0, 8(r31)
/* 00007760 C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 00007764 FC010040 */ fcmpo cr0, f1, f0
/* 00007768 408100C4 */ ble lbl_0000782C
/* 0000776C A8BC002C */ lha r5, 0x2c(r28)
/* 00007770 2C054000 */ cmpwi r5, 0x4000
/* 00007774 40810014 */ ble lbl_00007788
/* 00007778 3C600001 */ lis r3, 1
/* 0000777C 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 00007780 7CA50050 */ subf r5, r5, r0
/* 00007784 48000010 */ b lbl_00007794
lbl_00007788:
/* 00007788 2C05C000 */ cmpwi r5, -16384
/* 0000778C 40800008 */ bge lbl_00007794
/* 00007790 20A58000 */ subfic r5, r5, -32768  ;# fixed addi
lbl_00007794:
/* 00007794 7CA00734 */ extsh r0, r5
/* 00007798 C89F0030 */ lfd f4, 0x30(r31)
/* 0000779C 6C008000 */ xoris r0, r0, 0x8000
/* 000077A0 A89B001C */ lha r4, 0x1c(r27)
/* 000077A4 90010054 */ stw r0, 0x54(r1)
/* 000077A8 3CC04330 */ lis r6, 0x4330
/* 000077AC 3C600000 */ lis r3, lbl_0000C2F0@ha
/* 000077B0 C85F0038 */ lfd f2, 0x38(r31)
/* 000077B4 90C10050 */ stw r6, 0x50(r1)
/* 000077B8 C8230000 */ lfd f1, lbl_0000C2F0@l(r3)
/* 000077BC 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 000077C0 C8010050 */ lfd f0, 0x50(r1)
/* 000077C4 38A30000 */ addi r5, r3, lbl_802F1FDC@l
/* 000077C8 3C600000 */ lis r3, lbl_0000C2F0@ha
/* 000077CC EC600828 */ fsubs f3, f0, f1
/* 000077D0 C0050000 */ lfs f0, 0(r5)
/* 000077D4 C8230000 */ lfd f1, lbl_0000C2F0@l(r3)
/* 000077D8 EC030032 */ fmuls f0, f3, f0
/* 000077DC FC040032 */ fmul f0, f4, f0
/* 000077E0 FC00001E */ fctiwz f0, f0
/* 000077E4 D8010048 */ stfd f0, 0x48(r1)
/* 000077E8 80A1004C */ lwz r5, 0x4c(r1)
/* 000077EC 7CA00734 */ extsh r0, r5
/* 000077F0 7C000E70 */ srawi r0, r0, 1
/* 000077F4 7C000194 */ addze r0, r0
/* 000077F8 7C040050 */ subf r0, r4, r0
/* 000077FC 6C008000 */ xoris r0, r0, 0x8000
/* 00007800 90010044 */ stw r0, 0x44(r1)
/* 00007804 90C10040 */ stw r6, 0x40(r1)
/* 00007808 C8010040 */ lfd f0, 0x40(r1)
/* 0000780C EC000828 */ fsubs f0, f0, f1
/* 00007810 FC020032 */ fmul f0, f2, f0
/* 00007814 FC00001E */ fctiwz f0, f0
/* 00007818 D8010038 */ stfd f0, 0x38(r1)
/* 0000781C 8001003C */ lwz r0, 0x3c(r1)
/* 00007820 7C040214 */ add r0, r4, r0
/* 00007824 B01B001C */ sth r0, 0x1c(r27)
/* 00007828 4800005C */ b lbl_00007884
lbl_0000782C:
/* 0000782C A81B001C */ lha r0, 0x1c(r27)
/* 00007830 3C600000 */ lis r3, lbl_0000C2F0@ha
/* 00007834 3CA00000 */ lis r5, lbl_0000C2F0@ha
/* 00007838 C8230000 */ lfd f1, lbl_0000C2F0@l(r3)
/* 0000783C 6C048000 */ xoris r4, r0, 0x8000
/* 00007840 90810044 */ stw r4, 0x44(r1)
/* 00007844 3C004330 */ lis r0, 0x4330
/* 00007848 C85F0040 */ lfd f2, 0x40(r31)
/* 0000784C 90010040 */ stw r0, 0x40(r1)
/* 00007850 C8650000 */ lfd f3, lbl_0000C2F0@l(r5)
/* 00007854 9081003C */ stw r4, 0x3c(r1)
/* 00007858 C8010040 */ lfd f0, 0x40(r1)
/* 0000785C 90010038 */ stw r0, 0x38(r1)
/* 00007860 FC000828 */ fsub f0, f0, f1
/* 00007864 C8210038 */ lfd f1, 0x38(r1)
/* 00007868 FC020032 */ fmul f0, f2, f0
/* 0000786C FC211828 */ fsub f1, f1, f3
/* 00007870 FC010028 */ fsub f0, f1, f0
/* 00007874 FC00001E */ fctiwz f0, f0
/* 00007878 D8010048 */ stfd f0, 0x48(r1)
/* 0000787C 8001004C */ lwz r0, 0x4c(r1)
/* 00007880 B01B001C */ sth r0, 0x1c(r27)
lbl_00007884:
/* 00007884 7FC00734 */ extsh r0, r30
/* 00007888 2C00E000 */ cmpwi r0, -8192
/* 0000788C 4080000C */ bge lbl_00007898
/* 00007890 3BC0E000 */ li r30, -8192
/* 00007894 48000010 */ b lbl_000078A4
lbl_00007898:
/* 00007898 2C002000 */ cmpwi r0, 0x2000
/* 0000789C 40810008 */ ble lbl_000078A4
/* 000078A0 3BC02000 */ li r30, 0x2000
lbl_000078A4:
/* 000078A4 A89B00B8 */ lha r4, 0xb8(r27)
/* 000078A8 7FC00734 */ extsh r0, r30
/* 000078AC 3C600000 */ lis r3, lbl_0000C2F0@ha
/* 000078B0 C85F0020 */ lfd f2, 0x20(r31)
/* 000078B4 7C040050 */ subf r0, r4, r0
/* 000078B8 6C008000 */ xoris r0, r0, 0x8000
/* 000078BC C8230000 */ lfd f1, lbl_0000C2F0@l(r3)
/* 000078C0 90010044 */ stw r0, 0x44(r1)
/* 000078C4 3C004330 */ lis r0, 0x4330
/* 000078C8 6C848000 */ xoris r4, r4, 0x8000
/* 000078CC 90010040 */ stw r0, 0x40(r1)
/* 000078D0 3CA00000 */ lis r5, lbl_0000C2F0@ha
/* 000078D4 C8650000 */ lfd f3, lbl_0000C2F0@l(r5)
/* 000078D8 387B000C */ addi r3, r27, 0xc
/* 000078DC 9081003C */ stw r4, 0x3c(r1)
/* 000078E0 C8010040 */ lfd f0, 0x40(r1)
/* 000078E4 90010038 */ stw r0, 0x38(r1)
/* 000078E8 FC000828 */ fsub f0, f0, f1
/* 000078EC C8210038 */ lfd f1, 0x38(r1)
/* 000078F0 FC020032 */ fmul f0, f2, f0
/* 000078F4 FC211828 */ fsub f1, f1, f3
/* 000078F8 FC01002A */ fadd f0, f1, f0
/* 000078FC FC00001E */ fctiwz f0, f0
/* 00007900 D8010048 */ stfd f0, 0x48(r1)
/* 00007904 8381004C */ lwz r28, 0x4c(r1)
/* 00007908 B39B00B8 */ sth r28, 0xb8(r27)
/* 0000790C 4BFF8841 */ bl mathutil_mtxA_from_translate
/* 00007910 7FA30734 */ extsh r3, r29
/* 00007914 4BFF8839 */ bl mathutil_mtxA_rotate_y
/* 00007918 7F830734 */ extsh r3, r28
/* 0000791C 4BFF8831 */ bl mathutil_mtxA_rotate_x
/* 00007920 C01F0008 */ lfs f0, 8(r31)
/* 00007924 38610028 */ addi r3, r1, 0x28
/* 00007928 389B00AC */ addi r4, r27, 0xac
/* 0000792C D0010028 */ stfs f0, 0x28(r1)
/* 00007930 C01F0008 */ lfs f0, 8(r31)
/* 00007934 D001002C */ stfs f0, 0x2c(r1)
/* 00007938 C01F0010 */ lfs f0, 0x10(r31)
/* 0000793C D0010030 */ stfs f0, 0x30(r1)
/* 00007940 4BFF880D */ bl mathutil_mtxA_tf_point
/* 00007944 A89B001A */ lha r4, 0x1a(r27)
/* 00007948 3C7C0001 */ addis r3, r28, 1
/* 0000794C 3803F300 */ addi r0, r3, -3328  ;# fixed addi
/* 00007950 7C64E850 */ subf r3, r4, r29
/* 00007954 B07B010C */ sth r3, 0x10c(r27)
/* 00007958 387B000C */ addi r3, r27, 0xc
/* 0000795C B3BB001A */ sth r29, 0x1a(r27)
/* 00007960 B01B0018 */ sth r0, 0x18(r27)
/* 00007964 4BFF87E9 */ bl mathutil_mtxA_from_translate
/* 00007968 A87B001A */ lha r3, 0x1a(r27)
/* 0000796C 4BFF87E1 */ bl mathutil_mtxA_rotate_y
/* 00007970 A87B0018 */ lha r3, 0x18(r27)
/* 00007974 4BFF87D9 */ bl mathutil_mtxA_rotate_x
/* 00007978 C01F0008 */ lfs f0, 8(r31)
/* 0000797C D0010028 */ stfs f0, 0x28(r1)
/* 00007980 C01F0008 */ lfs f0, 8(r31)
/* 00007984 D001002C */ stfs f0, 0x2c(r1)
/* 00007988 C01F000C */ lfs f0, 0xc(r31)
/* 0000798C C03F0010 */ lfs f1, 0x10(r31)
/* 00007990 EC210072 */ fmuls f1, f1, f1
/* 00007994 EC20083A */ fmadds f1, f0, f0, f1
/* 00007998 4BFF87B5 */ bl mathutil_sqrt
/* 0000799C D0210030 */ stfs f1, 0x30(r1)
/* 000079A0 389B0000 */ addi r4, r27, 0
/* 000079A4 38610028 */ addi r3, r1, 0x28
/* 000079A8 4BFF87A5 */ bl mathutil_mtxA_tf_point
/* 000079AC C03B0000 */ lfs f1, 0(r27)
/* 000079B0 C001001C */ lfs f0, 0x1c(r1)
/* 000079B4 EC010028 */ fsubs f0, f1, f0
/* 000079B8 D01B0094 */ stfs f0, 0x94(r27)
/* 000079BC C03B0004 */ lfs f1, 4(r27)
/* 000079C0 C0010020 */ lfs f0, 0x20(r1)
/* 000079C4 EC010028 */ fsubs f0, f1, f0
/* 000079C8 D01B0098 */ stfs f0, 0x98(r27)
/* 000079CC C03B0008 */ lfs f1, 8(r27)
/* 000079D0 C0010024 */ lfs f0, 0x24(r1)
/* 000079D4 EC010028 */ fsubs f0, f1, f0
/* 000079D8 D01B009C */ stfs f0, 0x9c(r27)
/* 000079DC C03B000C */ lfs f1, 0xc(r27)
/* 000079E0 C0010010 */ lfs f0, 0x10(r1)
/* 000079E4 EC010028 */ fsubs f0, f1, f0
/* 000079E8 D01B00A0 */ stfs f0, 0xa0(r27)
/* 000079EC C03B0010 */ lfs f1, 0x10(r27)
/* 000079F0 C0010014 */ lfs f0, 0x14(r1)
/* 000079F4 EC010028 */ fsubs f0, f1, f0
/* 000079F8 D01B00A4 */ stfs f0, 0xa4(r27)
/* 000079FC C03B0014 */ lfs f1, 0x14(r27)
/* 00007A00 C0010018 */ lfs f0, 0x18(r1)
/* 00007A04 EC010028 */ fsubs f0, f1, f0
/* 00007A08 D01B00A8 */ stfs f0, 0xa8(r27)
lbl_00007A0C:
/* 00007A0C BB61005C */ lmw r27, 0x5c(r1)
/* 00007A10 80010074 */ lwz r0, 0x74(r1)
/* 00007A14 38210070 */ addi r1, r1, 0x70
/* 00007A18 7C0803A6 */ mtlr r0
/* 00007A1C 4E800020 */ blr 
lbl_00007A20:
/* 00007A20 7C0802A6 */ mflr r0
/* 00007A24 3CA00000 */ lis r5, gamePauseStatus@ha
/* 00007A28 90010004 */ stw r0, 4(r1)
/* 00007A2C 9421FF88 */ stwu r1, -0x78(r1)
/* 00007A30 93E10074 */ stw r31, 0x74(r1)
/* 00007A34 93C10070 */ stw r30, 0x70(r1)
/* 00007A38 3BC30000 */ addi r30, r3, 0
/* 00007A3C 93A1006C */ stw r29, 0x6c(r1)
/* 00007A40 93810068 */ stw r28, 0x68(r1)
/* 00007A44 3B840000 */ addi r28, r4, 0
/* 00007A48 80050000 */ lwz r0, gamePauseStatus@l(r5)
/* 00007A4C 3CA00000 */ lis r5, lbl_0000C2C8@ha
/* 00007A50 3BE50000 */ addi r31, r5, lbl_0000C2C8@l
/* 00007A54 7000000A */ andi. r0, r0, 0xa
/* 00007A58 4082037C */ bne lbl_00007DD4
/* 00007A5C 807E0000 */ lwz r3, 0(r30)
/* 00007A60 801E0004 */ lwz r0, 4(r30)
/* 00007A64 9061001C */ stw r3, 0x1c(r1)
/* 00007A68 90010020 */ stw r0, 0x20(r1)
/* 00007A6C 801E0008 */ lwz r0, 8(r30)
/* 00007A70 90010024 */ stw r0, 0x24(r1)
/* 00007A74 807E000C */ lwz r3, 0xc(r30)
/* 00007A78 801E0010 */ lwz r0, 0x10(r30)
/* 00007A7C 90610010 */ stw r3, 0x10(r1)
/* 00007A80 90010014 */ stw r0, 0x14(r1)
/* 00007A84 801E0014 */ lwz r0, 0x14(r30)
/* 00007A88 90010018 */ stw r0, 0x18(r1)
/* 00007A8C C03E00AC */ lfs f1, 0xac(r30)
/* 00007A90 C01E000C */ lfs f0, 0xc(r30)
/* 00007A94 EC010028 */ fsubs f0, f1, f0
/* 00007A98 D0010028 */ stfs f0, 0x28(r1)
/* 00007A9C C03E00B0 */ lfs f1, 0xb0(r30)
/* 00007AA0 C01E0010 */ lfs f0, 0x10(r30)
/* 00007AA4 EC010028 */ fsubs f0, f1, f0
/* 00007AA8 D001002C */ stfs f0, 0x2c(r1)
/* 00007AAC C03E00B4 */ lfs f1, 0xb4(r30)
/* 00007AB0 C01E0014 */ lfs f0, 0x14(r30)
/* 00007AB4 EC010028 */ fsubs f0, f1, f0
/* 00007AB8 D0010030 */ stfs f0, 0x30(r1)
/* 00007ABC C0410030 */ lfs f2, 0x30(r1)
/* 00007AC0 C001002C */ lfs f0, 0x2c(r1)
/* 00007AC4 C0210028 */ lfs f1, 0x28(r1)
/* 00007AC8 EC210072 */ fmuls f1, f1, f1
/* 00007ACC EC20083A */ fmadds f1, f0, f0, f1
/* 00007AD0 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007AD4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007AD8 FC010040 */ fcmpo cr0, f1, f0
/* 00007ADC 40810030 */ ble lbl_00007B0C
/* 00007AE0 4BFF866D */ bl mathutil_rsqrt
/* 00007AE4 C0010028 */ lfs f0, 0x28(r1)
/* 00007AE8 EC000072 */ fmuls f0, f0, f1
/* 00007AEC D0010028 */ stfs f0, 0x28(r1)
/* 00007AF0 C001002C */ lfs f0, 0x2c(r1)
/* 00007AF4 EC000072 */ fmuls f0, f0, f1
/* 00007AF8 D001002C */ stfs f0, 0x2c(r1)
/* 00007AFC C0010030 */ lfs f0, 0x30(r1)
/* 00007B00 EC000072 */ fmuls f0, f0, f1
/* 00007B04 D0010030 */ stfs f0, 0x30(r1)
/* 00007B08 4800001C */ b lbl_00007B24
lbl_00007B0C:
/* 00007B0C C01F000C */ lfs f0, 0xc(r31)
/* 00007B10 D0010028 */ stfs f0, 0x28(r1)
/* 00007B14 C01F0008 */ lfs f0, 8(r31)
/* 00007B18 D001002C */ stfs f0, 0x2c(r1)
/* 00007B1C C01F0008 */ lfs f0, 8(r31)
/* 00007B20 D0010030 */ stfs f0, 0x30(r1)
lbl_00007B24:
/* 00007B24 C85F0018 */ lfd f2, 0x18(r31)
/* 00007B28 C0210028 */ lfs f1, 0x28(r1)
/* 00007B2C C01E000C */ lfs f0, 0xc(r30)
/* 00007B30 FC220072 */ fmul f1, f2, f1
/* 00007B34 FC01002A */ fadd f0, f1, f0
/* 00007B38 FC000018 */ frsp f0, f0
/* 00007B3C D0010028 */ stfs f0, 0x28(r1)
/* 00007B40 C85F0018 */ lfd f2, 0x18(r31)
/* 00007B44 C021002C */ lfs f1, 0x2c(r1)
/* 00007B48 C01E0010 */ lfs f0, 0x10(r30)
/* 00007B4C FC220072 */ fmul f1, f2, f1
/* 00007B50 FC01002A */ fadd f0, f1, f0
/* 00007B54 FC000018 */ frsp f0, f0
/* 00007B58 D001002C */ stfs f0, 0x2c(r1)
/* 00007B5C C85F0018 */ lfd f2, 0x18(r31)
/* 00007B60 C0210030 */ lfs f1, 0x30(r1)
/* 00007B64 C01E0014 */ lfs f0, 0x14(r30)
/* 00007B68 FC220072 */ fmul f1, f2, f1
/* 00007B6C FC01002A */ fadd f0, f1, f0
/* 00007B70 FC000018 */ frsp f0, f0
/* 00007B74 D0010030 */ stfs f0, 0x30(r1)
/* 00007B78 C01C0004 */ lfs f0, 4(r28)
/* 00007B7C D01E000C */ stfs f0, 0xc(r30)
/* 00007B80 C83F0000 */ lfd f1, 0(r31)
/* 00007B84 C01C0008 */ lfs f0, 8(r28)
/* 00007B88 FC01002A */ fadd f0, f1, f0
/* 00007B8C FC000018 */ frsp f0, f0
/* 00007B90 D01E0010 */ stfs f0, 0x10(r30)
/* 00007B94 C01C000C */ lfs f0, 0xc(r28)
/* 00007B98 D01E0014 */ stfs f0, 0x14(r30)
/* 00007B9C C03E000C */ lfs f1, 0xc(r30)
/* 00007BA0 C0010028 */ lfs f0, 0x28(r1)
/* 00007BA4 EC010028 */ fsubs f0, f1, f0
/* 00007BA8 D0010028 */ stfs f0, 0x28(r1)
/* 00007BAC C03E0010 */ lfs f1, 0x10(r30)
/* 00007BB0 C001002C */ lfs f0, 0x2c(r1)
/* 00007BB4 EC010028 */ fsubs f0, f1, f0
/* 00007BB8 D001002C */ stfs f0, 0x2c(r1)
/* 00007BBC C03E0014 */ lfs f1, 0x14(r30)
/* 00007BC0 C0010030 */ lfs f0, 0x30(r1)
/* 00007BC4 EC010028 */ fsubs f0, f1, f0
/* 00007BC8 D0010030 */ stfs f0, 0x30(r1)
/* 00007BCC C0010030 */ lfs f0, 0x30(r1)
/* 00007BD0 C0210028 */ lfs f1, 0x28(r1)
/* 00007BD4 EC210072 */ fmuls f1, f1, f1
/* 00007BD8 EC20083A */ fmadds f1, f0, f0, f1
/* 00007BDC 4BFF8571 */ bl mathutil_sqrt
/* 00007BE0 FC400890 */ fmr f2, f1
/* 00007BE4 C021002C */ lfs f1, 0x2c(r1)
/* 00007BE8 4BFF8565 */ bl mathutil_atan2
/* 00007BEC A89E010C */ lha r4, 0x10c(r30)
/* 00007BF0 2C040050 */ cmpwi r4, 0x50
/* 00007BF4 40800010 */ bge lbl_00007C04
/* 00007BF8 38040001 */ addi r0, r4, 1
/* 00007BFC B01E010C */ sth r0, 0x10c(r30)
/* 00007C00 4800000C */ b lbl_00007C0C
lbl_00007C04:
/* 00007C04 38000050 */ li r0, 0x50
/* 00007C08 B01E010C */ sth r0, 0x10c(r30)
lbl_00007C0C:
/* 00007C0C A81E001C */ lha r0, 0x1c(r30)
/* 00007C10 3C800000 */ lis r4, lbl_0000C2F0@ha
/* 00007C14 C8240000 */ lfd f1, lbl_0000C2F0@l(r4)
/* 00007C18 3CA00000 */ lis r5, lbl_0000C2F0@ha
/* 00007C1C 6C008000 */ xoris r0, r0, 0x8000
/* 00007C20 9001005C */ stw r0, 0x5c(r1)
/* 00007C24 3CE04330 */ lis r7, 0x4330
/* 00007C28 C8650000 */ lfd f3, lbl_0000C2F0@l(r5)
/* 00007C2C 3C800000 */ lis r4, lbl_0000C2F0@ha
/* 00007C30 90E10058 */ stw r7, 0x58(r1)
/* 00007C34 C85F0040 */ lfd f2, 0x40(r31)
/* 00007C38 3CA00000 */ lis r5, lbl_0000C2F0@ha
/* 00007C3C 90010064 */ stw r0, 0x64(r1)
/* 00007C40 7C600734 */ extsh r0, r3
/* 00007C44 C8010058 */ lfd f0, 0x58(r1)
/* 00007C48 90E10060 */ stw r7, 0x60(r1)
/* 00007C4C FC000828 */ fsub f0, f0, f1
/* 00007C50 A8DE001A */ lha r6, 0x1a(r30)
/* 00007C54 C8210060 */ lfd f1, 0x60(r1)
/* 00007C58 A87E010C */ lha r3, 0x10c(r30)
/* 00007C5C FC020032 */ fmul f0, f2, f0
/* 00007C60 7F861A14 */ add r28, r6, r3
/* 00007C64 FC211828 */ fsub f1, f1, f3
/* 00007C68 387E000C */ addi r3, r30, 0xc
/* 00007C6C FC010028 */ fsub f0, f1, f0
/* 00007C70 FC00001E */ fctiwz f0, f0
/* 00007C74 D8010050 */ stfd f0, 0x50(r1)
/* 00007C78 80C10054 */ lwz r6, 0x54(r1)
/* 00007C7C B0DE001C */ sth r6, 0x1c(r30)
/* 00007C80 A8DE00B8 */ lha r6, 0xb8(r30)
/* 00007C84 C8240000 */ lfd f1, lbl_0000C2F0@l(r4)
/* 00007C88 7C060050 */ subf r0, r6, r0
/* 00007C8C C85F0020 */ lfd f2, 0x20(r31)
/* 00007C90 6C008000 */ xoris r0, r0, 0x8000
/* 00007C94 C8650000 */ lfd f3, lbl_0000C2F0@l(r5)
/* 00007C98 90010044 */ stw r0, 0x44(r1)
/* 00007C9C 6CC08000 */ xoris r0, r6, 0x8000
/* 00007CA0 90E10040 */ stw r7, 0x40(r1)
/* 00007CA4 9001004C */ stw r0, 0x4c(r1)
/* 00007CA8 C8010040 */ lfd f0, 0x40(r1)
/* 00007CAC 90E10048 */ stw r7, 0x48(r1)
/* 00007CB0 FC000828 */ fsub f0, f0, f1
/* 00007CB4 C8210048 */ lfd f1, 0x48(r1)
/* 00007CB8 FC020032 */ fmul f0, f2, f0
/* 00007CBC FC211828 */ fsub f1, f1, f3
/* 00007CC0 FC01002A */ fadd f0, f1, f0
/* 00007CC4 FC00001E */ fctiwz f0, f0
/* 00007CC8 D8010038 */ stfd f0, 0x38(r1)
/* 00007CCC 83A1003C */ lwz r29, 0x3c(r1)
/* 00007CD0 B3BE00B8 */ sth r29, 0xb8(r30)
/* 00007CD4 4BFF8479 */ bl mathutil_mtxA_from_translate
/* 00007CD8 7F830734 */ extsh r3, r28
/* 00007CDC 4BFF8471 */ bl mathutil_mtxA_rotate_y
/* 00007CE0 7FA30734 */ extsh r3, r29
/* 00007CE4 4BFF8469 */ bl mathutil_mtxA_rotate_x
/* 00007CE8 C01F0008 */ lfs f0, 8(r31)
/* 00007CEC 38610028 */ addi r3, r1, 0x28
/* 00007CF0 389E00AC */ addi r4, r30, 0xac
/* 00007CF4 D0010028 */ stfs f0, 0x28(r1)
/* 00007CF8 C01F0008 */ lfs f0, 8(r31)
/* 00007CFC D001002C */ stfs f0, 0x2c(r1)
/* 00007D00 C01F0010 */ lfs f0, 0x10(r31)
/* 00007D04 D0010030 */ stfs f0, 0x30(r1)
/* 00007D08 4BFF8445 */ bl mathutil_mtxA_tf_point
/* 00007D0C A89E001A */ lha r4, 0x1a(r30)
/* 00007D10 3C7D0001 */ addis r3, r29, 1
/* 00007D14 3803F300 */ addi r0, r3, -3328  ;# fixed addi
/* 00007D18 7C64E050 */ subf r3, r4, r28
/* 00007D1C B07E010C */ sth r3, 0x10c(r30)
/* 00007D20 387E000C */ addi r3, r30, 0xc
/* 00007D24 B39E001A */ sth r28, 0x1a(r30)
/* 00007D28 B01E0018 */ sth r0, 0x18(r30)
/* 00007D2C 4BFF8421 */ bl mathutil_mtxA_from_translate
/* 00007D30 A87E001A */ lha r3, 0x1a(r30)
/* 00007D34 4BFF8419 */ bl mathutil_mtxA_rotate_y
/* 00007D38 A87E0018 */ lha r3, 0x18(r30)
/* 00007D3C 4BFF8411 */ bl mathutil_mtxA_rotate_x
/* 00007D40 C01F0008 */ lfs f0, 8(r31)
/* 00007D44 D0010028 */ stfs f0, 0x28(r1)
/* 00007D48 C01F0008 */ lfs f0, 8(r31)
/* 00007D4C D001002C */ stfs f0, 0x2c(r1)
/* 00007D50 C01F000C */ lfs f0, 0xc(r31)
/* 00007D54 C03F0010 */ lfs f1, 0x10(r31)
/* 00007D58 EC210072 */ fmuls f1, f1, f1
/* 00007D5C EC20083A */ fmadds f1, f0, f0, f1
/* 00007D60 4BFF83ED */ bl mathutil_sqrt
/* 00007D64 D0210030 */ stfs f1, 0x30(r1)
/* 00007D68 389E0000 */ addi r4, r30, 0
/* 00007D6C 38610028 */ addi r3, r1, 0x28
/* 00007D70 4BFF83DD */ bl mathutil_mtxA_tf_point
/* 00007D74 C03E0000 */ lfs f1, 0(r30)
/* 00007D78 C001001C */ lfs f0, 0x1c(r1)
/* 00007D7C EC010028 */ fsubs f0, f1, f0
/* 00007D80 D01E0094 */ stfs f0, 0x94(r30)
/* 00007D84 C03E0004 */ lfs f1, 4(r30)
/* 00007D88 C0010020 */ lfs f0, 0x20(r1)
/* 00007D8C EC010028 */ fsubs f0, f1, f0
/* 00007D90 D01E0098 */ stfs f0, 0x98(r30)
/* 00007D94 C03E0008 */ lfs f1, 8(r30)
/* 00007D98 C0010024 */ lfs f0, 0x24(r1)
/* 00007D9C EC010028 */ fsubs f0, f1, f0
/* 00007DA0 D01E009C */ stfs f0, 0x9c(r30)
/* 00007DA4 C03E000C */ lfs f1, 0xc(r30)
/* 00007DA8 C0010010 */ lfs f0, 0x10(r1)
/* 00007DAC EC010028 */ fsubs f0, f1, f0
/* 00007DB0 D01E00A0 */ stfs f0, 0xa0(r30)
/* 00007DB4 C03E0010 */ lfs f1, 0x10(r30)
/* 00007DB8 C0010014 */ lfs f0, 0x14(r1)
/* 00007DBC EC010028 */ fsubs f0, f1, f0
/* 00007DC0 D01E00A4 */ stfs f0, 0xa4(r30)
/* 00007DC4 C03E0014 */ lfs f1, 0x14(r30)
/* 00007DC8 C0010018 */ lfs f0, 0x18(r1)
/* 00007DCC EC010028 */ fsubs f0, f1, f0
/* 00007DD0 D01E00A8 */ stfs f0, 0xa8(r30)
lbl_00007DD4:
/* 00007DD4 8001007C */ lwz r0, 0x7c(r1)
/* 00007DD8 83E10074 */ lwz r31, 0x74(r1)
/* 00007DDC 83C10070 */ lwz r30, 0x70(r1)
/* 00007DE0 7C0803A6 */ mtlr r0
/* 00007DE4 83A1006C */ lwz r29, 0x6c(r1)
/* 00007DE8 83810068 */ lwz r28, 0x68(r1)
/* 00007DEC 38210078 */ addi r1, r1, 0x78
/* 00007DF0 4E800020 */ blr 
lbl_00007DF4:
/* 00007DF4 7C0802A6 */ mflr r0
/* 00007DF8 3C800000 */ lis r4, lbl_0000C2C8@ha
/* 00007DFC 90010004 */ stw r0, 4(r1)
/* 00007E00 38840000 */ addi r4, r4, lbl_0000C2C8@l
/* 00007E04 9421FFD8 */ stwu r1, -0x28(r1)
/* 00007E08 93E10024 */ stw r31, 0x24(r1)
/* 00007E0C 7C7F1B78 */ mr r31, r3
/* 00007E10 C0040008 */ lfs f0, 8(r4)
/* 00007E14 D0030000 */ stfs f0, 0(r3)
/* 00007E18 C0040048 */ lfs f0, 0x48(r4)
/* 00007E1C D0030004 */ stfs f0, 4(r3)
/* 00007E20 C004004C */ lfs f0, 0x4c(r4)
/* 00007E24 D0030008 */ stfs f0, 8(r3)
/* 00007E28 C0040008 */ lfs f0, 8(r4)
/* 00007E2C D003000C */ stfs f0, 0xc(r3)
/* 00007E30 C0040050 */ lfs f0, 0x50(r4)
/* 00007E34 D0030010 */ stfs f0, 0x10(r3)
/* 00007E38 C0040054 */ lfs f0, 0x54(r4)
/* 00007E3C D0030014 */ stfs f0, 0x14(r3)
/* 00007E40 C023000C */ lfs f1, 0xc(r3)
/* 00007E44 C0030000 */ lfs f0, 0(r3)
/* 00007E48 EC010028 */ fsubs f0, f1, f0
/* 00007E4C D0010010 */ stfs f0, 0x10(r1)
/* 00007E50 C0230010 */ lfs f1, 0x10(r3)
/* 00007E54 C0030004 */ lfs f0, 4(r3)
/* 00007E58 EC010028 */ fsubs f0, f1, f0
/* 00007E5C D0010014 */ stfs f0, 0x14(r1)
/* 00007E60 C0230014 */ lfs f1, 0x14(r3)
/* 00007E64 C0030008 */ lfs f0, 8(r3)
/* 00007E68 EC010028 */ fsubs f0, f1, f0
/* 00007E6C D0010018 */ stfs f0, 0x18(r1)
/* 00007E70 C0210010 */ lfs f1, 0x10(r1)
/* 00007E74 C0410018 */ lfs f2, 0x18(r1)
/* 00007E78 4BFF82D5 */ bl mathutil_atan2
/* 00007E7C 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 00007E80 B01F001A */ sth r0, 0x1a(r31)
/* 00007E84 C0010018 */ lfs f0, 0x18(r1)
/* 00007E88 C0210010 */ lfs f1, 0x10(r1)
/* 00007E8C EC210072 */ fmuls f1, f1, f1
/* 00007E90 EC20083A */ fmadds f1, f0, f0, f1
/* 00007E94 4BFF82B9 */ bl mathutil_sqrt
/* 00007E98 FC400890 */ fmr f2, f1
/* 00007E9C C0210014 */ lfs f1, 0x14(r1)
/* 00007EA0 4BFF82AD */ bl mathutil_atan2
/* 00007EA4 B07F0018 */ sth r3, 0x18(r31)
/* 00007EA8 38600000 */ li r3, 0
/* 00007EAC 38000005 */ li r0, 5
/* 00007EB0 B07F001C */ sth r3, 0x1c(r31)
/* 00007EB4 981F001F */ stb r0, 0x1f(r31)
/* 00007EB8 8001002C */ lwz r0, 0x2c(r1)
/* 00007EBC 83E10024 */ lwz r31, 0x24(r1)
/* 00007EC0 38210028 */ addi r1, r1, 0x28
/* 00007EC4 7C0803A6 */ mtlr r0
/* 00007EC8 4E800020 */ blr 
lbl_00007ECC:
/* 00007ECC 4E800020 */ blr 
lbl_00007ED0:
/* 00007ED0 7C0802A6 */ mflr r0
/* 00007ED4 90010004 */ stw r0, 4(r1)
/* 00007ED8 38000007 */ li r0, 7
/* 00007EDC 9421FFF8 */ stwu r1, -8(r1)
/* 00007EE0 9803001F */ stb r0, 0x1f(r3)
/* 00007EE4 48000015 */ bl lbl_00007EF8
/* 00007EE8 8001000C */ lwz r0, 0xc(r1)
/* 00007EEC 38210008 */ addi r1, r1, 8
/* 00007EF0 7C0803A6 */ mtlr r0
/* 00007EF4 4E800020 */ blr 
lbl_00007EF8:
/* 00007EF8 7C0802A6 */ mflr r0
/* 00007EFC 3C800000 */ lis r4, lbl_802F1FF0@ha
/* 00007F00 90010004 */ stw r0, 4(r1)
/* 00007F04 9421FFB8 */ stwu r1, -0x48(r1)
/* 00007F08 DBE10040 */ stfd f31, 0x40(r1)
/* 00007F0C BF61002C */ stmw r27, 0x2c(r1)
/* 00007F10 7C7B1B78 */ mr r27, r3
/* 00007F14 80040000 */ lwz r0, lbl_802F1FF0@l(r4)
/* 00007F18 3C800000 */ lis r4, lbl_0000C2F0@ha
/* 00007F1C C8640000 */ lfd f3, lbl_0000C2F0@l(r4)
/* 00007F20 3C800000 */ lis r4, lbl_0000C2C8@ha
/* 00007F24 6C008000 */ xoris r0, r0, 0x8000
/* 00007F28 90010024 */ stw r0, 0x24(r1)
/* 00007F2C 3BE40000 */ addi r31, r4, lbl_0000C2C8@l
/* 00007F30 3C004330 */ lis r0, 0x4330
/* 00007F34 C83F0058 */ lfd f1, 0x58(r31)
/* 00007F38 90010020 */ stw r0, 0x20(r1)
/* 00007F3C 3C800000 */ lis r4, lbl_10000040@ha
/* 00007F40 C81F0060 */ lfd f0, 0x60(r31)
/* 00007F44 C8410020 */ lfd f2, 0x20(r1)
/* 00007F48 A8040000 */ lha r0, lbl_10000040@l(r4)
/* 00007F4C 3C800000 */ lis r4, lbl_0000CCF8@ha
/* 00007F50 EC421828 */ fsubs f2, f2, f3
/* 00007F54 3BC40000 */ addi r30, r4, lbl_0000CCF8@l
/* 00007F58 5400103A */ slwi r0, r0, 2
/* 00007F5C 7C9E0214 */ add r4, r30, r0
/* 00007F60 FFE20828 */ fsub f31, f2, f1
/* 00007F64 83A40488 */ lwz r29, 0x488(r4)
/* 00007F68 83840494 */ lwz r28, 0x494(r4)
/* 00007F6C FFE0F818 */ frsp f31, f31
/* 00007F70 FC1F0040 */ fcmpo cr0, f31, f0
/* 00007F74 40800008 */ bge lbl_00007F7C
/* 00007F78 C3FF0008 */ lfs f31, 8(r31)
lbl_00007F7C:
/* 00007F7C C81F0068 */ lfd f0, 0x68(r31)
/* 00007F80 FC1F0040 */ fcmpo cr0, f31, f0
/* 00007F84 40810008 */ ble lbl_00007F8C
/* 00007F88 C3FF0070 */ lfs f31, 0x70(r31)
lbl_00007F8C:
/* 00007F8C FC20F890 */ fmr f1, f31
/* 00007F90 807D0000 */ lwz r3, 0(r29)
/* 00007F94 4BFF81B9 */ bl func_8008CDC0
/* 00007F98 D03B0000 */ stfs f1, 0(r27)
/* 00007F9C FC20F890 */ fmr f1, f31
/* 00007FA0 807D0004 */ lwz r3, 4(r29)
/* 00007FA4 4BFF81A9 */ bl func_8008CDC0
/* 00007FA8 D03B0004 */ stfs f1, 4(r27)
/* 00007FAC FC20F890 */ fmr f1, f31
/* 00007FB0 807D0008 */ lwz r3, 8(r29)
/* 00007FB4 4BFF8199 */ bl func_8008CDC0
/* 00007FB8 D03B0008 */ stfs f1, 8(r27)
/* 00007FBC FC20F890 */ fmr f1, f31
/* 00007FC0 807C0000 */ lwz r3, 0(r28)
/* 00007FC4 4BFF8189 */ bl func_8008CDC0
/* 00007FC8 D03B000C */ stfs f1, 0xc(r27)
/* 00007FCC FC20F890 */ fmr f1, f31
/* 00007FD0 807C0004 */ lwz r3, 4(r28)
/* 00007FD4 4BFF8179 */ bl func_8008CDC0
/* 00007FD8 D03B0010 */ stfs f1, 0x10(r27)
/* 00007FDC FC20F890 */ fmr f1, f31
/* 00007FE0 807C0008 */ lwz r3, 8(r28)
/* 00007FE4 4BFF8169 */ bl func_8008CDC0
/* 00007FE8 D03B0014 */ stfs f1, 0x14(r27)
/* 00007FEC 3C600000 */ lis r3, lbl_10000090@ha
/* 00007FF0 88830000 */ lbz r4, lbl_10000090@l(r3)
/* 00007FF4 3C600000 */ lis r3, lbl_10000078@ha
/* 00007FF8 38030000 */ addi r0, r3, lbl_10000078@l
/* 00007FFC 7C830774 */ extsb r3, r4
/* 00008000 7C601A14 */ add r3, r0, r3
/* 00008004 88030000 */ lbz r0, 0(r3)
/* 00008008 2C000001 */ cmpwi r0, 1
/* 0000800C 408200A0 */ bne lbl_000080AC
/* 00008010 FC20F890 */ fmr f1, f31
/* 00008014 387E04A0 */ addi r3, r30, 0x4a0
/* 00008018 4BFF8135 */ bl func_8008CDC0
/* 0000801C C05B0000 */ lfs f2, 0(r27)
/* 00008020 C01B000C */ lfs f0, 0xc(r27)
/* 00008024 C87F0078 */ lfd f3, 0x78(r31)
/* 00008028 EC020028 */ fsubs f0, f2, f0
/* 0000802C FC4100F2 */ fmul f2, f1, f3
/* 00008030 D0010010 */ stfs f0, 0x10(r1)
/* 00008034 C03B0004 */ lfs f1, 4(r27)
/* 00008038 FC401018 */ frsp f2, f2
/* 0000803C C01B0010 */ lfs f0, 0x10(r27)
/* 00008040 EC010028 */ fsubs f0, f1, f0
/* 00008044 D0010014 */ stfs f0, 0x14(r1)
/* 00008048 C03B0008 */ lfs f1, 8(r27)
/* 0000804C C01B0014 */ lfs f0, 0x14(r27)
/* 00008050 EC010028 */ fsubs f0, f1, f0
/* 00008054 D0010018 */ stfs f0, 0x18(r1)
/* 00008058 C0010010 */ lfs f0, 0x10(r1)
/* 0000805C EC0000B2 */ fmuls f0, f0, f2
/* 00008060 D0010010 */ stfs f0, 0x10(r1)
/* 00008064 C0010014 */ lfs f0, 0x14(r1)
/* 00008068 EC0000B2 */ fmuls f0, f0, f2
/* 0000806C D0010014 */ stfs f0, 0x14(r1)
/* 00008070 C0010018 */ lfs f0, 0x18(r1)
/* 00008074 EC0000B2 */ fmuls f0, f0, f2
/* 00008078 D0010018 */ stfs f0, 0x18(r1)
/* 0000807C C03B0000 */ lfs f1, 0(r27)
/* 00008080 C0010010 */ lfs f0, 0x10(r1)
/* 00008084 EC01002A */ fadds f0, f1, f0
/* 00008088 D01B0000 */ stfs f0, 0(r27)
/* 0000808C C03B0004 */ lfs f1, 4(r27)
/* 00008090 C0010014 */ lfs f0, 0x14(r1)
/* 00008094 EC01002A */ fadds f0, f1, f0
/* 00008098 D01B0004 */ stfs f0, 4(r27)
/* 0000809C C03B0008 */ lfs f1, 8(r27)
/* 000080A0 C0010018 */ lfs f0, 0x18(r1)
/* 000080A4 EC01002A */ fadds f0, f1, f0
/* 000080A8 D01B0008 */ stfs f0, 8(r27)
lbl_000080AC:
/* 000080AC C03B000C */ lfs f1, 0xc(r27)
/* 000080B0 C01B0000 */ lfs f0, 0(r27)
/* 000080B4 EC010028 */ fsubs f0, f1, f0
/* 000080B8 D0010010 */ stfs f0, 0x10(r1)
/* 000080BC C03B0010 */ lfs f1, 0x10(r27)
/* 000080C0 C01B0004 */ lfs f0, 4(r27)
/* 000080C4 EC010028 */ fsubs f0, f1, f0
/* 000080C8 D0010014 */ stfs f0, 0x14(r1)
/* 000080CC C03B0014 */ lfs f1, 0x14(r27)
/* 000080D0 C01B0008 */ lfs f0, 8(r27)
/* 000080D4 EC010028 */ fsubs f0, f1, f0
/* 000080D8 D0010018 */ stfs f0, 0x18(r1)
/* 000080DC C0210010 */ lfs f1, 0x10(r1)
/* 000080E0 C0410018 */ lfs f2, 0x18(r1)
/* 000080E4 4BFF8069 */ bl mathutil_atan2
/* 000080E8 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 000080EC B01B001A */ sth r0, 0x1a(r27)
/* 000080F0 C0010018 */ lfs f0, 0x18(r1)
/* 000080F4 C0210010 */ lfs f1, 0x10(r1)
/* 000080F8 EC210072 */ fmuls f1, f1, f1
/* 000080FC EC20083A */ fmadds f1, f0, f0, f1
/* 00008100 4BFF804D */ bl mathutil_sqrt
/* 00008104 FC400890 */ fmr f2, f1
/* 00008108 C0210014 */ lfs f1, 0x14(r1)
/* 0000810C 4BFF8041 */ bl mathutil_atan2
/* 00008110 B07B0018 */ sth r3, 0x18(r27)
/* 00008114 38000000 */ li r0, 0
/* 00008118 B01B001C */ sth r0, 0x1c(r27)
/* 0000811C 8001004C */ lwz r0, 0x4c(r1)
/* 00008120 CBE10040 */ lfd f31, 0x40(r1)
/* 00008124 BB61002C */ lmw r27, 0x2c(r1)
/* 00008128 38210048 */ addi r1, r1, 0x48
/* 0000812C 7C0803A6 */ mtlr r0
/* 00008130 4E800020 */ blr 
lbl_00008134:
/* 00008134 7C0802A6 */ mflr r0
/* 00008138 3C600000 */ lis r3, lbl_0000C348@ha
/* 0000813C 90010004 */ stw r0, 4(r1)
/* 00008140 38C30000 */ addi r6, r3, lbl_0000C348@l
/* 00008144 38600027 */ li r3, 0x27
/* 00008148 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000814C 80A60000 */ lwz r5, 0(r6)
/* 00008150 38810008 */ addi r4, r1, 8
/* 00008154 80060004 */ lwz r0, 4(r6)
/* 00008158 90A10008 */ stw r5, 8(r1)
/* 0000815C 9001000C */ stw r0, 0xc(r1)
/* 00008160 80A60008 */ lwz r5, 8(r6)
/* 00008164 8006000C */ lwz r0, 0xc(r6)
/* 00008168 90A10010 */ stw r5, 0x10(r1)
/* 0000816C 90010014 */ stw r0, 0x14(r1)
/* 00008170 4BFF7FDD */ bl effect_replace_type_funcs
/* 00008174 8001001C */ lwz r0, 0x1c(r1)
/* 00008178 38210018 */ addi r1, r1, 0x18
/* 0000817C 7C0803A6 */ mtlr r0
/* 00008180 4E800020 */ blr 
lbl_00008184:
/* 00008184 3800FFFF */ li r0, -1
/* 00008188 90030010 */ stw r0, 0x10(r3)
/* 0000818C 38000064 */ li r0, 0x64
/* 00008190 9003000C */ stw r0, 0xc(r3)
/* 00008194 4E800020 */ blr 
lbl_00008198:
/* 00008198 80C30010 */ lwz r6, 0x10(r3)
/* 0000819C 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 000081A0 3C800000 */ lis r4, lbl_0000C358@ha
/* 000081A4 38060001 */ addi r0, r6, 1
/* 000081A8 90030010 */ stw r0, 0x10(r3)
/* 000081AC 80C50000 */ lwz r6, currentBallStructPtr@l(r5)
/* 000081B0 80A60004 */ lwz r5, 4(r6)
/* 000081B4 80060008 */ lwz r0, 8(r6)
/* 000081B8 90A30034 */ stw r5, 0x34(r3)
/* 000081BC 90030038 */ stw r0, 0x38(r3)
/* 000081C0 8006000C */ lwz r0, 0xc(r6)
/* 000081C4 9003003C */ stw r0, 0x3c(r3)
/* 000081C8 C0230038 */ lfs f1, 0x38(r3)
/* 000081CC C8040000 */ lfd f0, lbl_0000C358@l(r4)
/* 000081D0 FC010028 */ fsub f0, f1, f0
/* 000081D4 FC000018 */ frsp f0, f0
/* 000081D8 D0030038 */ stfs f0, 0x38(r3)
/* 000081DC 80030010 */ lwz r0, 0x10(r3)
/* 000081E0 28000027 */ cmplwi r0, 0x27
/* 000081E4 40800034 */ bge lbl_00008218
/* 000081E8 3CA00000 */ lis r5, minigameGma@ha
/* 000081EC 80C50000 */ lwz r6, minigameGma@l(r5)
/* 000081F0 3C800000 */ lis r4, lbl_0000D1C8@ha
/* 000081F4 5405083C */ slwi r5, r0, 1
/* 000081F8 38040000 */ addi r0, r4, lbl_0000D1C8@l
/* 000081FC 7C802A14 */ add r4, r0, r5
/* 00008200 80A60008 */ lwz r5, 8(r6)
/* 00008204 A8040000 */ lha r0, 0(r4)
/* 00008208 54001838 */ slwi r0, r0, 3
/* 0000820C 7C05002E */ lwzx r0, r5, r0
/* 00008210 90030030 */ stw r0, 0x30(r3)
/* 00008214 4E800020 */ blr 
lbl_00008218:
/* 00008218 3C800000 */ lis r4, g_poolInfo@ha
/* 0000821C A8030000 */ lha r0, 0(r3)
/* 00008220 38640000 */ addi r3, r4, g_poolInfo@l
/* 00008224 8063004C */ lwz r3, 0x4c(r3)
/* 00008228 38800003 */ li r4, 3
/* 0000822C 7C8301AE */ stbx r4, r3, r0
/* 00008230 4E800020 */ blr 
lbl_00008234:
/* 00008234 7C0802A6 */ mflr r0
/* 00008238 90010004 */ stw r0, 4(r1)
/* 0000823C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00008240 93E10014 */ stw r31, 0x14(r1)
/* 00008244 3BE30000 */ addi r31, r3, 0
/* 00008248 387F0034 */ addi r3, r31, 0x34
/* 0000824C 4BFF7F01 */ bl mathutil_mtxA_from_mtxB_translate
/* 00008250 4BFF7EFD */ bl mathutil_mtxA_sq_from_identity
/* 00008254 387F0024 */ addi r3, r31, 0x24
/* 00008258 4BFF7EF5 */ bl mathutil_mtxA_scale
/* 0000825C C05F0028 */ lfs f2, 0x28(r31)
/* 00008260 C07F002C */ lfs f3, 0x2c(r31)
/* 00008264 FC021840 */ fcmpo cr0, f2, f3
/* 00008268 4081000C */ ble lbl_00008274
/* 0000826C FC001090 */ fmr f0, f2
/* 00008270 48000008 */ b lbl_00008278
lbl_00008274:
/* 00008274 FC001890 */ fmr f0, f3
lbl_00008278:
/* 00008278 C03F0024 */ lfs f1, 0x24(r31)
/* 0000827C FC010040 */ fcmpo cr0, f1, f0
/* 00008280 40810008 */ ble lbl_00008288
/* 00008284 48000018 */ b lbl_0000829C
lbl_00008288:
/* 00008288 FC021840 */ fcmpo cr0, f2, f3
/* 0000828C 40810008 */ ble lbl_00008294
/* 00008290 48000008 */ b lbl_00008298
lbl_00008294:
/* 00008294 FC401890 */ fmr f2, f3
lbl_00008298:
/* 00008298 FC201090 */ fmr f1, f2
lbl_0000829C:
/* 0000829C 4BFF7EB1 */ bl avdisp_set_bound_sphere_scale
/* 000082A0 807F0030 */ lwz r3, 0x30(r31)
/* 000082A4 4BFF7EA9 */ bl avdisp_draw_model_culled_sort_translucent
/* 000082A8 8001001C */ lwz r0, 0x1c(r1)
/* 000082AC 83E10014 */ lwz r31, 0x14(r1)
/* 000082B0 38210018 */ addi r1, r1, 0x18
/* 000082B4 7C0803A6 */ mtlr r0
/* 000082B8 4E800020 */ blr 
lbl_000082BC:
/* 000082BC 4E800020 */ blr 
lbl_000082C0:
/* 000082C0 7C0802A6 */ mflr r0
/* 000082C4 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000082C8 90010004 */ stw r0, 4(r1)
/* 000082CC 3C800000 */ lis r4, lbl_0000C360@ha
/* 000082D0 9421FFE8 */ stwu r1, -0x18(r1)
/* 000082D4 93E10014 */ stw r31, 0x14(r1)
/* 000082D8 3BE40000 */ addi r31, r4, lbl_0000C360@l
/* 000082DC 93C10010 */ stw r30, 0x10(r1)
/* 000082E0 83C30000 */ lwz r30, currentBallStructPtr@l(r3)
/* 000082E4 4BFF7E69 */ bl create_sprite
/* 000082E8 28030000 */ cmplwi r3, 0
/* 000082EC 41820034 */ beq lbl_00008320
/* 000082F0 38000001 */ li r0, 1
/* 000082F4 98030000 */ stb r0, 0(r3)
/* 000082F8 38800B3A */ li r4, 0xb3a
/* 000082FC 38000000 */ li r0, 0
/* 00008300 C01F0000 */ lfs f0, 0(r31)
/* 00008304 D0030004 */ stfs f0, 4(r3)
/* 00008308 C01F0004 */ lfs f0, 4(r31)
/* 0000830C D0030008 */ stfs f0, 8(r3)
/* 00008310 C01F0008 */ lfs f0, 8(r31)
/* 00008314 D003004C */ stfs f0, 0x4c(r3)
/* 00008318 B083003C */ sth r4, 0x3c(r3)
/* 0000831C 98030003 */ stb r0, 3(r3)
lbl_00008320:
/* 00008320 4BFF7E2D */ bl create_sprite
/* 00008324 28030000 */ cmplwi r3, 0
/* 00008328 41820020 */ beq lbl_00008348
/* 0000832C C01F000C */ lfs f0, 0xc(r31)
/* 00008330 3C800000 */ lis r4, lbl_0000893C@ha
/* 00008334 38040000 */ addi r0, r4, lbl_0000893C@l
/* 00008338 D0030004 */ stfs f0, 4(r3)
/* 0000833C C01F0004 */ lfs f0, 4(r31)
/* 00008340 D0030008 */ stfs f0, 8(r3)
/* 00008344 90030038 */ stw r0, 0x38(r3)
lbl_00008348:
/* 00008348 4BFF7E05 */ bl create_sprite
/* 0000834C 28030000 */ cmplwi r3, 0
/* 00008350 41820054 */ beq lbl_000083A4
/* 00008354 38000001 */ li r0, 1
/* 00008358 98030000 */ stb r0, 0(r3)
/* 0000835C 3C800000 */ lis r4, lbl_80118938@ha
/* 00008360 38840000 */ addi r4, r4, lbl_80118938@l
/* 00008364 C01F0010 */ lfs f0, 0x10(r31)
/* 00008368 38000000 */ li r0, 0
/* 0000836C D0030004 */ stfs f0, 4(r3)
/* 00008370 C01F0014 */ lfs f0, 0x14(r31)
/* 00008374 D0030008 */ stfs f0, 8(r3)
/* 00008378 80BE00FC */ lwz r5, 0xfc(r30)
/* 0000837C 80A50010 */ lwz r5, 0x10(r5)
/* 00008380 54A5103A */ slwi r5, r5, 2
/* 00008384 7C842A14 */ add r4, r4, r5
/* 00008388 80840000 */ lwz r4, 0(r4)
/* 0000838C B083003C */ sth r4, 0x3c(r3)
/* 00008390 98030003 */ stb r0, 3(r3)
/* 00008394 C01F0018 */ lfs f0, 0x18(r31)
/* 00008398 D0030040 */ stfs f0, 0x40(r3)
/* 0000839C C01F001C */ lfs f0, 0x1c(r31)
/* 000083A0 D0030044 */ stfs f0, 0x44(r3)
lbl_000083A4:
/* 000083A4 4BFF7DA9 */ bl create_sprite
/* 000083A8 28030000 */ cmplwi r3, 0
/* 000083AC 41820020 */ beq lbl_000083CC
/* 000083B0 C01F0020 */ lfs f0, 0x20(r31)
/* 000083B4 3C800000 */ lis r4, lbl_000089F8@ha
/* 000083B8 38040000 */ addi r0, r4, lbl_000089F8@l
/* 000083BC D0030004 */ stfs f0, 4(r3)
/* 000083C0 C01F0014 */ lfs f0, 0x14(r31)
/* 000083C4 D0030008 */ stfs f0, 8(r3)
/* 000083C8 90030038 */ stw r0, 0x38(r3)
lbl_000083CC:
/* 000083CC 3C600000 */ lis r3, lbl_100000B0@ha
/* 000083D0 38000000 */ li r0, 0
/* 000083D4 B0030000 */ sth r0, lbl_100000B0@l(r3)
/* 000083D8 4BFF7D75 */ bl create_sprite
/* 000083DC 28030000 */ cmplwi r3, 0
/* 000083E0 41820020 */ beq lbl_00008400
/* 000083E4 C01F0024 */ lfs f0, 0x24(r31)
/* 000083E8 3C800000 */ lis r4, lbl_00008C40@ha
/* 000083EC 38040000 */ addi r0, r4, lbl_00008C40@l
/* 000083F0 D0030004 */ stfs f0, 4(r3)
/* 000083F4 C01F0028 */ lfs f0, 0x28(r31)
/* 000083F8 D0030008 */ stfs f0, 8(r3)
/* 000083FC 90030038 */ stw r0, 0x38(r3)
lbl_00008400:
/* 00008400 4BFF7D4D */ bl create_sprite
/* 00008404 28030000 */ cmplwi r3, 0
/* 00008408 41820020 */ beq lbl_00008428
/* 0000840C C01F002C */ lfs f0, 0x2c(r31)
/* 00008410 3C800000 */ lis r4, lbl_000090A0@ha
/* 00008414 38040000 */ addi r0, r4, lbl_000090A0@l
/* 00008418 D0030004 */ stfs f0, 4(r3)
/* 0000841C C01F0030 */ lfs f0, 0x30(r31)
/* 00008420 D0030008 */ stfs f0, 8(r3)
/* 00008424 90030038 */ stw r0, 0x38(r3)
lbl_00008428:
/* 00008428 4BFF7D25 */ bl create_sprite
/* 0000842C 28030000 */ cmplwi r3, 0
/* 00008430 41820028 */ beq lbl_00008458
/* 00008434 38000B19 */ li r0, 0xb19
/* 00008438 B003003C */ sth r0, 0x3c(r3)
/* 0000843C 3C800000 */ lis r4, lbl_000091EC@ha
/* 00008440 38040000 */ addi r0, r4, lbl_000091EC@l
/* 00008444 C01F0034 */ lfs f0, 0x34(r31)
/* 00008448 D0030004 */ stfs f0, 4(r3)
/* 0000844C C01F0038 */ lfs f0, 0x38(r31)
/* 00008450 D0030008 */ stfs f0, 8(r3)
/* 00008454 90030038 */ stw r0, 0x38(r3)
lbl_00008458:
/* 00008458 4BFF7CF5 */ bl create_sprite
/* 0000845C 28030000 */ cmplwi r3, 0
/* 00008460 41820060 */ beq lbl_000084C0
/* 00008464 C01F003C */ lfs f0, 0x3c(r31)
/* 00008468 3C800000 */ lis r4, modeCtrl@ha
/* 0000846C 38840000 */ addi r4, r4, modeCtrl@l
/* 00008470 D0030004 */ stfs f0, 4(r3)
/* 00008474 3CC00000 */ lis r6, lbl_0000C3C0@ha
/* 00008478 3CA04330 */ lis r5, 0x4330
/* 0000847C 80040024 */ lwz r0, 0x24(r4)
/* 00008480 3C800000 */ lis r4, lbl_00009440@ha
/* 00008484 C8260000 */ lfd f1, lbl_0000C3C0@l(r6)
/* 00008488 20000004 */ subfic r0, r0, 4
/* 0000848C C85F0048 */ lfd f2, 0x48(r31)
/* 00008490 6C008000 */ xoris r0, r0, 0x8000
/* 00008494 C87F0040 */ lfd f3, 0x40(r31)
/* 00008498 9001000C */ stw r0, 0xc(r1)
/* 0000849C 38040000 */ addi r0, r4, lbl_00009440@l
/* 000084A0 90A10008 */ stw r5, 8(r1)
/* 000084A4 C8010008 */ lfd f0, 8(r1)
/* 000084A8 FC000828 */ fsub f0, f0, f1
/* 000084AC FC020032 */ fmul f0, f2, f0
/* 000084B0 FC03002A */ fadd f0, f3, f0
/* 000084B4 FC000018 */ frsp f0, f0
/* 000084B8 D0030008 */ stfs f0, 8(r3)
/* 000084BC 90030038 */ stw r0, 0x38(r3)
lbl_000084C0:
/* 000084C0 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000084C4 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 000084C8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000084CC 41820050 */ beq lbl_0000851C
/* 000084D0 4BFF7C7D */ bl create_sprite
/* 000084D4 28030000 */ cmplwi r3, 0
/* 000084D8 41820044 */ beq lbl_0000851C
/* 000084DC C01F0050 */ lfs f0, 0x50(r31)
/* 000084E0 3CA00000 */ lis r5, lbl_00009B04@ha
/* 000084E4 3C800000 */ lis r4, lbl_00009C18@ha
/* 000084E8 D0030004 */ stfs f0, 4(r3)
/* 000084EC 38A50000 */ addi r5, r5, lbl_00009B04@l
/* 000084F0 38840000 */ addi r4, r4, lbl_00009C18@l
/* 000084F4 C01F002C */ lfs f0, 0x2c(r31)
/* 000084F8 38000000 */ li r0, 0
/* 000084FC D0030008 */ stfs f0, 8(r3)
/* 00008500 90A30034 */ stw r5, 0x34(r3)
/* 00008504 90830038 */ stw r4, 0x38(r3)
/* 00008508 90030048 */ stw r0, 0x48(r3)
/* 0000850C C01F0054 */ lfs f0, 0x54(r31)
/* 00008510 D0030040 */ stfs f0, 0x40(r3)
/* 00008514 C01F0054 */ lfs f0, 0x54(r31)
/* 00008518 D0030044 */ stfs f0, 0x44(r3)
lbl_0000851C:
/* 0000851C 4BFF7C31 */ bl create_sprite
/* 00008520 28030000 */ cmplwi r3, 0
/* 00008524 4182002C */ beq lbl_00008550
/* 00008528 C01F0058 */ lfs f0, 0x58(r31)
/* 0000852C 3CA00000 */ lis r5, lbl_000097AC@ha
/* 00008530 3C800000 */ lis r4, lbl_000097C8@ha
/* 00008534 D0030004 */ stfs f0, 4(r3)
/* 00008538 38A50000 */ addi r5, r5, lbl_000097AC@l
/* 0000853C 38040000 */ addi r0, r4, lbl_000097C8@l
/* 00008540 C01F005C */ lfs f0, 0x5c(r31)
/* 00008544 D0030008 */ stfs f0, 8(r3)
/* 00008548 90A30034 */ stw r5, 0x34(r3)
/* 0000854C 90030038 */ stw r0, 0x38(r3)
lbl_00008550:
/* 00008550 8001001C */ lwz r0, 0x1c(r1)
/* 00008554 83E10014 */ lwz r31, 0x14(r1)
/* 00008558 83C10010 */ lwz r30, 0x10(r1)
/* 0000855C 7C0803A6 */ mtlr r0
/* 00008560 38210018 */ addi r1, r1, 0x18
/* 00008564 4E800020 */ blr 
lbl_00008568:
/* 00008568 7C0802A6 */ mflr r0
/* 0000856C 90010004 */ stw r0, 4(r1)
/* 00008570 9421FFF8 */ stwu r1, -8(r1)
/* 00008574 4BFF7BD9 */ bl create_sprite
/* 00008578 28030000 */ cmplwi r3, 0
/* 0000857C 41820028 */ beq lbl_000085A4
/* 00008580 3C800000 */ lis r4, lbl_0000C3C8@ha
/* 00008584 C0040000 */ lfs f0, lbl_0000C3C8@l(r4)
/* 00008588 3C800000 */ lis r4, lbl_000085B4@ha
/* 0000858C 3CA00000 */ lis r5, lbl_0000C3CC@ha
/* 00008590 D0030004 */ stfs f0, 4(r3)
/* 00008594 38040000 */ addi r0, r4, lbl_000085B4@l
/* 00008598 C0050000 */ lfs f0, lbl_0000C3CC@l(r5)
/* 0000859C D0030008 */ stfs f0, 8(r3)
/* 000085A0 90030038 */ stw r0, 0x38(r3)
lbl_000085A4:
/* 000085A4 8001000C */ lwz r0, 0xc(r1)
/* 000085A8 38210008 */ addi r1, r1, 8
/* 000085AC 7C0803A6 */ mtlr r0
/* 000085B0 4E800020 */ blr 
lbl_000085B4:
/* 000085B4 7C0802A6 */ mflr r0
/* 000085B8 3C800000 */ lis r4, lbl_0000C360@ha
/* 000085BC 90010004 */ stw r0, 4(r1)
/* 000085C0 9421FF48 */ stwu r1, -0xb8(r1)
/* 000085C4 DBE100B0 */ stfd f31, 0xb0(r1)
/* 000085C8 DBC100A8 */ stfd f30, 0xa8(r1)
/* 000085CC BF410090 */ stmw r26, 0x90(r1)
/* 000085D0 3BE40000 */ addi r31, r4, lbl_0000C360@l
/* 000085D4 3BA00001 */ li r29, 1
/* 000085D8 C3E30004 */ lfs f31, 4(r3)
/* 000085DC C3C30008 */ lfs f30, 8(r3)
/* 000085E0 4BFF7B6D */ bl reset_text_draw_settings
/* 000085E4 38600009 */ li r3, 9
/* 000085E8 4BFF7B65 */ bl set_text_font
/* 000085EC 3C600000 */ lis r3, modeCtrl@ha
/* 000085F0 38630000 */ addi r3, r3, modeCtrl@l
/* 000085F4 8003002C */ lwz r0, 0x2c(r3)
/* 000085F8 3C600000 */ lis r3, lbl_80285A80@ha
/* 000085FC 38630000 */ addi r3, r3, lbl_80285A80@l
/* 00008600 1C00000C */ mulli r0, r0, 0xc
/* 00008604 7C630214 */ add r3, r3, r0
/* 00008608 A803000A */ lha r0, 0xa(r3)
/* 0000860C 2C000000 */ cmpwi r0, 0
/* 00008610 4182000C */ beq lbl_0000861C
/* 00008614 3BA00003 */ li r29, 3
/* 00008618 48000014 */ b lbl_0000862C
lbl_0000861C:
/* 0000861C A8030006 */ lha r0, 6(r3)
/* 00008620 2C000000 */ cmpwi r0, 0
/* 00008624 41820008 */ beq lbl_0000862C
/* 00008628 3BA00002 */ li r29, 2
lbl_0000862C:
/* 0000862C 3C600000 */ lis r3, lbl_10000074@ha
/* 00008630 80030000 */ lwz r0, lbl_10000074@l(r3)
/* 00008634 7FC0E9D6 */ mullw r30, r0, r29
/* 00008638 2C1E0001 */ cmpwi r30, 1
/* 0000863C 4181000C */ bgt lbl_00008648
/* 00008640 3B800B37 */ li r28, 0xb37
/* 00008644 48000008 */ b lbl_0000864C
lbl_00008648:
/* 00008648 3B800B36 */ li r28, 0xb36
lbl_0000864C:
/* 0000864C 2C1D0001 */ cmpwi r29, 1
/* 00008650 40810138 */ ble lbl_00008788
/* 00008654 C85F0070 */ lfd f2, 0x70(r31)
/* 00008658 FC00F01E */ fctiwz f0, f30
/* 0000865C C03F0018 */ lfs f1, 0x18(r31)
/* 00008660 FC62F82A */ fadd f3, f2, f31
/* 00008664 D8010080 */ stfd f0, 0x80(r1)
/* 00008668 FC400890 */ fmr f2, f1
/* 0000866C FC00181E */ fctiwz f0, f3
/* 00008670 83410084 */ lwz r26, 0x84(r1)
/* 00008674 D8010088 */ stfd f0, 0x88(r1)
/* 00008678 8361008C */ lwz r27, 0x8c(r1)
/* 0000867C 4BFF7AD1 */ bl set_text_scale
/* 00008680 3C600100 */ lis r3, 0x100
/* 00008684 3863FF00 */ addi r3, r3, -256  ;# fixed addi
/* 00008688 4BFF7AC5 */ bl set_text_mul_color
/* 0000868C 3C600000 */ lis r3, lbl_10000074@ha
/* 00008690 38830000 */ addi r4, r3, lbl_10000074@l
/* 00008694 3C606666 */ lis r3, 0x6666
/* 00008698 80040000 */ lwz r0, 0(r4)
/* 0000869C 38836667 */ addi r4, r3, 0x6667
/* 000086A0 38A00001 */ li r5, 1
/* 000086A4 48000018 */ b lbl_000086BC
lbl_000086A8:
/* 000086A8 7C040096 */ mulhw r0, r4, r0
/* 000086AC 7C001670 */ srawi r0, r0, 2
/* 000086B0 54030FFE */ srwi r3, r0, 0x1f
/* 000086B4 7C001A14 */ add r0, r0, r3
/* 000086B8 38A50001 */ addi r5, r5, 1
lbl_000086BC:
/* 000086BC 2C00000A */ cmpwi r0, 0xa
/* 000086C0 4080FFE8 */ bge lbl_000086A8
/* 000086C4 3805FFFE */ addi r0, r5, -2  ;# fixed addi
/* 000086C8 C87F0078 */ lfd f3, 0x78(r31)
/* 000086CC 6C008000 */ xoris r0, r0, 0x8000
/* 000086D0 C09F0018 */ lfs f4, 0x18(r31)
/* 000086D4 9001008C */ stw r0, 0x8c(r1)
/* 000086D8 3CA04330 */ lis r5, 0x4330
/* 000086DC 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 000086E0 C81F0080 */ lfd f0, 0x80(r31)
/* 000086E4 90A10088 */ stw r5, 0x88(r1)
/* 000086E8 C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 000086EC 6F608000 */ xoris r0, r27, 0x8000
/* 000086F0 C8210088 */ lfd f1, 0x88(r1)
/* 000086F4 3C800000 */ lis r4, lbl_0000C3C0@ha
/* 000086F8 90010084 */ stw r0, 0x84(r1)
/* 000086FC EC211028 */ fsubs f1, f1, f2
/* 00008700 C8A40000 */ lfd f5, lbl_0000C3C0@l(r4)
/* 00008704 6F408000 */ xoris r0, r26, 0x8000
/* 00008708 90A10080 */ stw r5, 0x80(r1)
/* 0000870C 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008710 FC230072 */ fmul f1, f3, f1
/* 00008714 C8610080 */ lfd f3, 0x80(r1)
/* 00008718 9001006C */ stw r0, 0x6c(r1)
/* 0000871C 3C800000 */ lis r4, lbl_0000C3C0@ha
/* 00008720 FC632828 */ fsub f3, f3, f5
/* 00008724 FC240072 */ fmul f1, f4, f1
/* 00008728 90A10068 */ stw r5, 0x68(r1)
/* 0000872C C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 00008730 FC830828 */ fsub f4, f3, f1
/* 00008734 C8210068 */ lfd f1, 0x68(r1)
/* 00008738 C8640000 */ lfd f3, lbl_0000C3C0@l(r4)
/* 0000873C FC211028 */ fsub f1, f1, f2
/* 00008740 FC80201E */ fctiwz f4, f4
/* 00008744 FC410028 */ fsub f2, f1, f0
/* 00008748 D8810078 */ stfd f4, 0x78(r1)
/* 0000874C 8361007C */ lwz r27, 0x7c(r1)
/* 00008750 FC401018 */ frsp f2, f2
/* 00008754 6F608000 */ xoris r0, r27, 0x8000
/* 00008758 90010074 */ stw r0, 0x74(r1)
/* 0000875C 90A10070 */ stw r5, 0x70(r1)
/* 00008760 C8010070 */ lfd f0, 0x70(r1)
/* 00008764 EC201828 */ fsubs f1, f0, f3
/* 00008768 4BFF79E5 */ bl set_text_pos
/* 0000876C 3C600000 */ lis r3, lbl_10000074@ha
/* 00008770 4CC63182 */ crclr 6
/* 00008774 3CA00000 */ lis r5, lbl_0000D314@ha
/* 00008778 80830000 */ lwz r4, lbl_10000074@l(r3)
/* 0000877C 38650000 */ addi r3, r5, lbl_0000D314@l
/* 00008780 38BD0000 */ addi r5, r29, 0
/* 00008784 4BFF79C9 */ bl func_80072AC0
lbl_00008788:
/* 00008788 C05F0054 */ lfs f2, 0x54(r31)
/* 0000878C FC201090 */ fmr f1, f2
/* 00008790 4BFF79BD */ bl set_text_scale
/* 00008794 3C600100 */ lis r3, 0x100
/* 00008798 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 0000879C 4BFF79B1 */ bl set_text_mul_color
/* 000087A0 3C600000 */ lis r3, lbl_10000074@ha
/* 000087A4 38830000 */ addi r4, r3, lbl_10000074@l
/* 000087A8 3C606666 */ lis r3, 0x6666
/* 000087AC 80040000 */ lwz r0, 0(r4)
/* 000087B0 38836667 */ addi r4, r3, 0x6667
/* 000087B4 38A00001 */ li r5, 1
/* 000087B8 48000018 */ b lbl_000087D0
lbl_000087BC:
/* 000087BC 7C040096 */ mulhw r0, r4, r0
/* 000087C0 7C001670 */ srawi r0, r0, 2
/* 000087C4 54030FFE */ srwi r3, r0, 0x1f
/* 000087C8 7C001A14 */ add r0, r0, r3
/* 000087CC 38A50001 */ addi r5, r5, 1
lbl_000087D0:
/* 000087D0 2C00000A */ cmpwi r0, 0xa
/* 000087D4 4080FFE8 */ bge lbl_000087BC
/* 000087D8 3805FFFE */ addi r0, r5, -2  ;# fixed addi
/* 000087DC C87F0078 */ lfd f3, 0x78(r31)
/* 000087E0 6C008000 */ xoris r0, r0, 0x8000
/* 000087E4 C09F0054 */ lfs f4, 0x54(r31)
/* 000087E8 9001006C */ stw r0, 0x6c(r1)
/* 000087EC 3C004330 */ lis r0, 0x4330
/* 000087F0 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 000087F4 FC40F090 */ fmr f2, f30
/* 000087F8 90010068 */ stw r0, 0x68(r1)
/* 000087FC C8230000 */ lfd f1, lbl_0000C3C0@l(r3)
/* 00008800 C8010068 */ lfd f0, 0x68(r1)
/* 00008804 EC000828 */ fsubs f0, f0, f1
/* 00008808 FC030032 */ fmul f0, f3, f0
/* 0000880C FC040032 */ fmul f0, f4, f0
/* 00008810 FFFF0028 */ fsub f31, f31, f0
/* 00008814 FFE0F818 */ frsp f31, f31
/* 00008818 FC20F890 */ fmr f1, f31
/* 0000881C 4BFF7931 */ bl set_text_pos
/* 00008820 3C600000 */ lis r3, lbl_0000D320@ha
/* 00008824 4CC63182 */ crclr 6
/* 00008828 38630000 */ addi r3, r3, lbl_0000D320@l
/* 0000882C 389E0000 */ addi r4, r30, 0
/* 00008830 4BFF791D */ bl func_80072AC0
/* 00008834 3C606666 */ lis r3, 0x6666
/* 00008838 381E0000 */ addi r0, r30, 0
/* 0000883C 38836667 */ addi r4, r3, 0x6667
/* 00008840 38A00001 */ li r5, 1
/* 00008844 48000018 */ b lbl_0000885C
lbl_00008848:
/* 00008848 7C040096 */ mulhw r0, r4, r0
/* 0000884C 7C001670 */ srawi r0, r0, 2
/* 00008850 54030FFE */ srwi r3, r0, 0x1f
/* 00008854 7C001A14 */ add r0, r0, r3
/* 00008858 38A50001 */ addi r5, r5, 1
lbl_0000885C:
/* 0000885C 2C00000A */ cmpwi r0, 0xa
/* 00008860 4080FFE8 */ bge lbl_00008848
/* 00008864 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008868 C89F0088 */ lfd f4, 0x88(r31)
/* 0000886C C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 00008870 6CA08000 */ xoris r0, r5, 0x8000
/* 00008874 C83F0090 */ lfd f1, 0x90(r31)
/* 00008878 3CE04330 */ lis r7, 0x4330
/* 0000887C C01F0054 */ lfs f0, 0x54(r31)
/* 00008880 9001006C */ stw r0, 0x6c(r1)
/* 00008884 3C600100 */ lis r3, 0x100
/* 00008888 FC610032 */ fmul f3, f1, f0
/* 0000888C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00008890 D0010028 */ stfs f0, 0x28(r1)
/* 00008894 38C00000 */ li r6, 0
/* 00008898 C01F0054 */ lfs f0, 0x54(r31)
/* 0000889C D001002C */ stfs f0, 0x2c(r1)
/* 000088A0 38A0FFFF */ li r5, -1
/* 000088A4 38800005 */ li r4, 5
/* 000088A8 C01F0098 */ lfs f0, 0x98(r31)
/* 000088AC 38610018 */ addi r3, r1, 0x18
/* 000088B0 90E10068 */ stw r7, 0x68(r1)
/* 000088B4 D0010034 */ stfs f0, 0x34(r1)
/* 000088B8 C8210068 */ lfd f1, 0x68(r1)
/* 000088BC D0010030 */ stfs f0, 0x30(r1)
/* 000088C0 EC211028 */ fsubs f1, f1, f2
/* 000088C4 C01F0054 */ lfs f0, 0x54(r31)
/* 000088C8 D001003C */ stfs f0, 0x3c(r1)
/* 000088CC FC230072 */ fmul f1, f3, f1
/* 000088D0 D0010038 */ stfs f0, 0x38(r1)
/* 000088D4 90C10040 */ stw r6, 0x40(r1)
/* 000088D8 FC04082A */ fadd f0, f4, f1
/* 000088DC 90A10048 */ stw r5, 0x48(r1)
/* 000088E0 FFFF002A */ fadd f31, f31, f0
/* 000088E4 9081004C */ stw r4, 0x4c(r1)
/* 000088E8 C01F0054 */ lfs f0, 0x54(r31)
/* 000088EC FFE0F818 */ frsp f31, f31
/* 000088F0 D0010044 */ stfs f0, 0x44(r1)
/* 000088F4 90010050 */ stw r0, 0x50(r1)
/* 000088F8 90C10054 */ stw r6, 0x54(r1)
/* 000088FC 93810018 */ stw r28, 0x18(r1)
/* 00008900 D3E1001C */ stfs f31, 0x1c(r1)
/* 00008904 C81F0070 */ lfd f0, 0x70(r31)
/* 00008908 FC00F02A */ fadd f0, f0, f30
/* 0000890C FC000018 */ frsp f0, f0
/* 00008910 D0010020 */ stfs f0, 0x20(r1)
/* 00008914 C01F009C */ lfs f0, 0x9c(r31)
/* 00008918 D0010024 */ stfs f0, 0x24(r1)
/* 0000891C 4BFF7831 */ bl draw_naomi_sprite
/* 00008920 BB410090 */ lmw r26, 0x90(r1)
/* 00008924 800100BC */ lwz r0, 0xbc(r1)
/* 00008928 CBE100B0 */ lfd f31, 0xb0(r1)
/* 0000892C CBC100A8 */ lfd f30, 0xa8(r1)
/* 00008930 7C0803A6 */ mtlr r0
/* 00008934 382100B8 */ addi r1, r1, 0xb8
/* 00008938 4E800020 */ blr 
lbl_0000893C:
/* 0000893C 7C0802A6 */ mflr r0
/* 00008940 3C800000 */ lis r4, lbl_0000C360@ha
/* 00008944 90010004 */ stw r0, 4(r1)
/* 00008948 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000894C DBE10028 */ stfd f31, 0x28(r1)
/* 00008950 DBC10020 */ stfd f30, 0x20(r1)
/* 00008954 93E1001C */ stw r31, 0x1c(r1)
/* 00008958 3BE40000 */ addi r31, r4, lbl_0000C360@l
/* 0000895C C3E30004 */ lfs f31, 4(r3)
/* 00008960 C83F00A0 */ lfd f1, 0xa0(r31)
/* 00008964 C3C30008 */ lfs f30, 8(r3)
/* 00008968 C81F00A8 */ lfd f0, 0xa8(r31)
/* 0000896C FFFF082A */ fadd f31, f31, f1
/* 00008970 FFDE002A */ fadd f30, f30, f0
/* 00008974 FFE0F818 */ frsp f31, f31
/* 00008978 FFC0F018 */ frsp f30, f30
/* 0000897C 4BFF77D1 */ bl reset_text_draw_settings
/* 00008980 38600058 */ li r3, 0x58
/* 00008984 4BFF77C9 */ bl set_text_font
/* 00008988 FC20F890 */ fmr f1, f31
/* 0000898C FC40F090 */ fmr f2, f30
/* 00008990 4BFF77BD */ bl set_text_pos
/* 00008994 3C600000 */ lis r3, lbl_10000068@ha
/* 00008998 38630000 */ addi r3, r3, lbl_10000068@l
/* 0000899C C0230000 */ lfs f1, 0(r3)
/* 000089A0 C0430004 */ lfs f2, 4(r3)
/* 000089A4 C0030008 */ lfs f0, 8(r3)
/* 000089A8 EC210072 */ fmuls f1, f1, f1
/* 000089AC EC2208BA */ fmadds f1, f2, f2, f1
/* 000089B0 EC20083A */ fmadds f1, f0, f0, f1
/* 000089B4 4BFF7799 */ bl mathutil_sqrt
/* 000089B8 C81F00B0 */ lfd f0, 0xb0(r31)
/* 000089BC 3C600000 */ lis r3, lbl_0000D324@ha
/* 000089C0 4CC63182 */ crclr 6
/* 000089C4 38630000 */ addi r3, r3, lbl_0000D324@l
/* 000089C8 FC000072 */ fmul f0, f0, f1
/* 000089CC FC00001E */ fctiwz f0, f0
/* 000089D0 D8010010 */ stfd f0, 0x10(r1)
/* 000089D4 80810014 */ lwz r4, 0x14(r1)
/* 000089D8 4BFF7775 */ bl func_80072AC0
/* 000089DC 80010034 */ lwz r0, 0x34(r1)
/* 000089E0 CBE10028 */ lfd f31, 0x28(r1)
/* 000089E4 CBC10020 */ lfd f30, 0x20(r1)
/* 000089E8 7C0803A6 */ mtlr r0
/* 000089EC 83E1001C */ lwz r31, 0x1c(r1)
/* 000089F0 38210030 */ addi r1, r1, 0x30
/* 000089F4 4E800020 */ blr 
lbl_000089F8:
/* 000089F8 7C0802A6 */ mflr r0
/* 000089FC 3CA00000 */ lis r5, lbl_0000C360@ha
/* 00008A00 90010004 */ stw r0, 4(r1)
/* 00008A04 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00008A08 38C00000 */ li r6, 0
/* 00008A0C 9421FF68 */ stwu r1, -0x98(r1)
/* 00008A10 38000B09 */ li r0, 0xb09
/* 00008A14 DBE10090 */ stfd f31, 0x90(r1)
/* 00008A18 DBC10088 */ stfd f30, 0x88(r1)
/* 00008A1C BF610074 */ stmw r27, 0x74(r1)
/* 00008A20 3BC50000 */ addi r30, r5, lbl_0000C360@l
/* 00008A24 38A0FFFF */ li r5, -1
/* 00008A28 83A40000 */ lwz r29, currentBallStructPtr@l(r4)
/* 00008A2C 38800005 */ li r4, 5
/* 00008A30 C3E30004 */ lfs f31, 4(r3)
/* 00008A34 C3C30008 */ lfs f30, 8(r3)
/* 00008A38 3C600100 */ lis r3, 0x100
/* 00008A3C C01E0054 */ lfs f0, 0x54(r30)
/* 00008A40 3BE3FFFF */ addi r31, r3, -1  ;# fixed addi
/* 00008A44 3861000C */ addi r3, r1, 0xc
/* 00008A48 D001001C */ stfs f0, 0x1c(r1)
/* 00008A4C C01E0054 */ lfs f0, 0x54(r30)
/* 00008A50 D0010020 */ stfs f0, 0x20(r1)
/* 00008A54 C01E0098 */ lfs f0, 0x98(r30)
/* 00008A58 D0010028 */ stfs f0, 0x28(r1)
/* 00008A5C D0010024 */ stfs f0, 0x24(r1)
/* 00008A60 C01E0054 */ lfs f0, 0x54(r30)
/* 00008A64 D0010030 */ stfs f0, 0x30(r1)
/* 00008A68 D001002C */ stfs f0, 0x2c(r1)
/* 00008A6C 90C10034 */ stw r6, 0x34(r1)
/* 00008A70 90A1003C */ stw r5, 0x3c(r1)
/* 00008A74 90810040 */ stw r4, 0x40(r1)
/* 00008A78 C01E0054 */ lfs f0, 0x54(r30)
/* 00008A7C D0010038 */ stfs f0, 0x38(r1)
/* 00008A80 93E10044 */ stw r31, 0x44(r1)
/* 00008A84 90C10048 */ stw r6, 0x48(r1)
/* 00008A88 9001000C */ stw r0, 0xc(r1)
/* 00008A8C C81E0080 */ lfd f0, 0x80(r30)
/* 00008A90 FC00F82A */ fadd f0, f0, f31
/* 00008A94 FC000018 */ frsp f0, f0
/* 00008A98 D0010010 */ stfs f0, 0x10(r1)
/* 00008A9C C81E00B8 */ lfd f0, 0xb8(r30)
/* 00008AA0 FC00F02A */ fadd f0, f0, f30
/* 00008AA4 FC000018 */ frsp f0, f0
/* 00008AA8 D0010014 */ stfs f0, 0x14(r1)
/* 00008AAC C01E009C */ lfs f0, 0x9c(r30)
/* 00008AB0 D0010018 */ stfs f0, 0x18(r1)
/* 00008AB4 4BFF7699 */ bl draw_naomi_sprite
/* 00008AB8 3C600000 */ lis r3, modeCtrl@ha
/* 00008ABC C85E00C0 */ lfd f2, 0xc0(r30)
/* 00008AC0 38630000 */ addi r3, r3, modeCtrl@l
/* 00008AC4 8003002C */ lwz r0, 0x2c(r3)
/* 00008AC8 3B63002C */ addi r27, r3, 0x2c
/* 00008ACC 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008AD0 6C008000 */ xoris r0, r0, 0x8000
/* 00008AD4 C8230000 */ lfd f1, lbl_0000C3C0@l(r3)
/* 00008AD8 9001006C */ stw r0, 0x6c(r1)
/* 00008ADC 3F804330 */ lis r28, 0x4330
/* 00008AE0 93810068 */ stw r28, 0x68(r1)
/* 00008AE4 C8010068 */ lfd f0, 0x68(r1)
/* 00008AE8 FC000828 */ fsub f0, f0, f1
/* 00008AEC FC020032 */ fmul f0, f2, f0
/* 00008AF0 FC000018 */ frsp f0, f0
/* 00008AF4 D0010024 */ stfs f0, 0x24(r1)
/* 00008AF8 C83E00C0 */ lfd f1, 0xc0(r30)
/* 00008AFC C0010024 */ lfs f0, 0x24(r1)
/* 00008B00 FC01002A */ fadd f0, f1, f0
/* 00008B04 FC000018 */ frsp f0, f0
/* 00008B08 D001002C */ stfs f0, 0x2c(r1)
/* 00008B0C 887D014A */ lbz r3, 0x14a(r29)
/* 00008B10 48002385 */ bl lbl_0000AE94
/* 00008B14 6C608000 */ xoris r0, r3, 0x8000
/* 00008B18 C81E00C0 */ lfd f0, 0xc0(r30)
/* 00008B1C 90010064 */ stw r0, 0x64(r1)
/* 00008B20 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008B24 C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 00008B28 38000B0C */ li r0, 0xb0c
/* 00008B2C 93810060 */ stw r28, 0x60(r1)
/* 00008B30 3861000C */ addi r3, r1, 0xc
/* 00008B34 C8210060 */ lfd f1, 0x60(r1)
/* 00008B38 FC211028 */ fsub f1, f1, f2
/* 00008B3C FC000072 */ fmul f0, f0, f1
/* 00008B40 FC000018 */ frsp f0, f0
/* 00008B44 D0010028 */ stfs f0, 0x28(r1)
/* 00008B48 C83E00C0 */ lfd f1, 0xc0(r30)
/* 00008B4C C0010028 */ lfs f0, 0x28(r1)
/* 00008B50 FC01002A */ fadd f0, f1, f0
/* 00008B54 FC000018 */ frsp f0, f0
/* 00008B58 D0010030 */ stfs f0, 0x30(r1)
/* 00008B5C C01E00C8 */ lfs f0, 0xc8(r30)
/* 00008B60 D001001C */ stfs f0, 0x1c(r1)
/* 00008B64 C01E00C8 */ lfs f0, 0xc8(r30)
/* 00008B68 D0010020 */ stfs f0, 0x20(r1)
/* 00008B6C 9001000C */ stw r0, 0xc(r1)
/* 00008B70 D3E10010 */ stfs f31, 0x10(r1)
/* 00008B74 D3C10014 */ stfs f30, 0x14(r1)
/* 00008B78 C01E009C */ lfs f0, 0x9c(r30)
/* 00008B7C D0010018 */ stfs f0, 0x18(r1)
/* 00008B80 4BFF75CD */ bl draw_naomi_sprite
/* 00008B84 4BFF75C9 */ bl reset_text_draw_settings
/* 00008B88 38600053 */ li r3, 0x53
/* 00008B8C 4BFF75C1 */ bl set_text_font
/* 00008B90 C03E0008 */ lfs f1, 8(r30)
/* 00008B94 4BFF75B9 */ bl func_80071B1C
/* 00008B98 38600000 */ li r3, 0
/* 00008B9C 4BFF75B1 */ bl set_text_mul_color
/* 00008BA0 C81E00D8 */ lfd f0, 0xd8(r30)
/* 00008BA4 C85E00D0 */ lfd f2, 0xd0(r30)
/* 00008BA8 FFC0F02A */ fadd f30, f0, f30
/* 00008BAC FC22F82A */ fadd f1, f2, f31
/* 00008BB0 FC42F02A */ fadd f2, f2, f30
/* 00008BB4 FC200818 */ frsp f1, f1
/* 00008BB8 FC401018 */ frsp f2, f2
/* 00008BBC 4BFF7591 */ bl set_text_pos
/* 00008BC0 801B0000 */ lwz r0, 0(r27)
/* 00008BC4 3C600000 */ lis r3, lbl_10000044@ha
/* 00008BC8 3C800000 */ lis r4, lbl_0000D328@ha
/* 00008BCC 4CC63182 */ crclr 6
/* 00008BD0 5400103A */ slwi r0, r0, 2
/* 00008BD4 3BA30000 */ addi r29, r3, lbl_10000044@l
/* 00008BD8 7C7D0214 */ add r3, r29, r0
/* 00008BDC 3B840000 */ addi r28, r4, lbl_0000D328@l
/* 00008BE0 80830000 */ lwz r4, 0(r3)
/* 00008BE4 7F83E378 */ mr r3, r28
/* 00008BE8 4BFF7565 */ bl func_80072AC0
/* 00008BEC C03E009C */ lfs f1, 0x9c(r30)
/* 00008BF0 4BFF755D */ bl func_80071B1C
/* 00008BF4 7FE3FB78 */ mr r3, r31
/* 00008BF8 4BFF7555 */ bl set_text_mul_color
/* 00008BFC FC20F890 */ fmr f1, f31
/* 00008C00 FC40F018 */ frsp f2, f30
/* 00008C04 4BFF7549 */ bl set_text_pos
/* 00008C08 801B0000 */ lwz r0, 0(r27)
/* 00008C0C 387C0000 */ addi r3, r28, 0
/* 00008C10 4CC63182 */ crclr 6
/* 00008C14 5400103A */ slwi r0, r0, 2
/* 00008C18 7C9D0214 */ add r4, r29, r0
/* 00008C1C 80840000 */ lwz r4, 0(r4)
/* 00008C20 4BFF752D */ bl func_80072AC0
/* 00008C24 BB610074 */ lmw r27, 0x74(r1)
/* 00008C28 8001009C */ lwz r0, 0x9c(r1)
/* 00008C2C CBE10090 */ lfd f31, 0x90(r1)
/* 00008C30 CBC10088 */ lfd f30, 0x88(r1)
/* 00008C34 7C0803A6 */ mtlr r0
/* 00008C38 38210098 */ addi r1, r1, 0x98
/* 00008C3C 4E800020 */ blr 
lbl_00008C40:
/* 00008C40 7C0802A6 */ mflr r0
/* 00008C44 3C800000 */ lis r4, lbl_0000C360@ha
/* 00008C48 90010004 */ stw r0, 4(r1)
/* 00008C4C 3CC00000 */ lis r6, lbl_0000D218@ha
/* 00008C50 9421FF58 */ stwu r1, -0xa8(r1)
/* 00008C54 DBE100A0 */ stfd f31, 0xa0(r1)
/* 00008C58 DBC10098 */ stfd f30, 0x98(r1)
/* 00008C5C DBA10090 */ stfd f29, 0x90(r1)
/* 00008C60 DB810088 */ stfd f28, 0x88(r1)
/* 00008C64 DB610080 */ stfd f27, 0x80(r1)
/* 00008C68 93E1007C */ stw r31, 0x7c(r1)
/* 00008C6C 3BE40000 */ addi r31, r4, lbl_0000C360@l
/* 00008C70 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00008C74 93C10078 */ stw r30, 0x78(r1)
/* 00008C78 93A10074 */ stw r29, 0x74(r1)
/* 00008C7C 3BA60000 */ addi r29, r6, lbl_0000D218@l
/* 00008C80 93810070 */ stw r28, 0x70(r1)
/* 00008C84 83840000 */ lwz r28, currentBallStructPtr@l(r4)
/* 00008C88 3C800000 */ lis r4, lbl_802F1FD0@ha
/* 00008C8C 80BF00E0 */ lwz r5, 0xe0(r31)
/* 00008C90 801F00E4 */ lwz r0, 0xe4(r31)
/* 00008C94 90A10010 */ stw r5, 0x10(r1)
/* 00008C98 3CA00000 */ lis r5, lbl_100000A8@ha
/* 00008C9C 3BC50000 */ addi r30, r5, lbl_100000A8@l
/* 00008CA0 90010014 */ stw r0, 0x14(r1)
/* 00008CA4 80040000 */ lwz r0, lbl_802F1FD0@l(r4)
/* 00008CA8 C3E30004 */ lfs f31, 4(r3)
/* 00008CAC 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00008CB0 C3C30008 */ lfs f30, 8(r3)
/* 00008CB4 41820040 */ beq lbl_00008CF4
/* 00008CB8 A89E0008 */ lha r4, 8(r30)
/* 00008CBC 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008CC0 C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 00008CC4 6C808000 */ xoris r0, r4, 0x8000
/* 00008CC8 C81F00E8 */ lfd f0, 0xe8(r31)
/* 00008CCC 9001006C */ stw r0, 0x6c(r1)
/* 00008CD0 3C004330 */ lis r0, 0x4330
/* 00008CD4 90010068 */ stw r0, 0x68(r1)
/* 00008CD8 C8210068 */ lfd f1, 0x68(r1)
/* 00008CDC FC211028 */ fsub f1, f1, f2
/* 00008CE0 FC010040 */ fcmpo cr0, f1, f0
/* 00008CE4 40800024 */ bge lbl_00008D08
/* 00008CE8 38040001 */ addi r0, r4, 1
/* 00008CEC B01E0008 */ sth r0, 8(r30)
/* 00008CF0 48000018 */ b lbl_00008D08
lbl_00008CF4:
/* 00008CF4 A87E0008 */ lha r3, 8(r30)
/* 00008CF8 2C030000 */ cmpwi r3, 0
/* 00008CFC 4081000C */ ble lbl_00008D08
/* 00008D00 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00008D04 B01E0008 */ sth r0, 8(r30)
lbl_00008D08:
/* 00008D08 C01F0054 */ lfs f0, 0x54(r31)
/* 00008D0C 3C600100 */ lis r3, 0x100
/* 00008D10 3883FFFF */ addi r4, r3, -1  ;# fixed addi
/* 00008D14 D0010028 */ stfs f0, 0x28(r1)
/* 00008D18 38E00000 */ li r7, 0
/* 00008D1C 38C0FFFF */ li r6, -1
/* 00008D20 C01F0054 */ lfs f0, 0x54(r31)
/* 00008D24 38A00005 */ li r5, 5
/* 00008D28 38000B18 */ li r0, 0xb18
/* 00008D2C D001002C */ stfs f0, 0x2c(r1)
/* 00008D30 38610018 */ addi r3, r1, 0x18
/* 00008D34 C01F0098 */ lfs f0, 0x98(r31)
/* 00008D38 D0010034 */ stfs f0, 0x34(r1)
/* 00008D3C D0010030 */ stfs f0, 0x30(r1)
/* 00008D40 C01F0054 */ lfs f0, 0x54(r31)
/* 00008D44 D001003C */ stfs f0, 0x3c(r1)
/* 00008D48 D0010038 */ stfs f0, 0x38(r1)
/* 00008D4C 90E10040 */ stw r7, 0x40(r1)
/* 00008D50 90C10048 */ stw r6, 0x48(r1)
/* 00008D54 90A1004C */ stw r5, 0x4c(r1)
/* 00008D58 C01F0054 */ lfs f0, 0x54(r31)
/* 00008D5C D0010044 */ stfs f0, 0x44(r1)
/* 00008D60 90810050 */ stw r4, 0x50(r1)
/* 00008D64 90E10054 */ stw r7, 0x54(r1)
/* 00008D68 90010018 */ stw r0, 0x18(r1)
/* 00008D6C D3E1001C */ stfs f31, 0x1c(r1)
/* 00008D70 D3C10020 */ stfs f30, 0x20(r1)
/* 00008D74 C01F00F0 */ lfs f0, 0xf0(r31)
/* 00008D78 D0010024 */ stfs f0, 0x24(r1)
/* 00008D7C 4BFF73D1 */ bl draw_naomi_sprite
/* 00008D80 C83F0100 */ lfd f1, 0x100(r31)
/* 00008D84 C01C0008 */ lfs f0, 8(r28)
/* 00008D88 C85F00F8 */ lfd f2, 0xf8(r31)
/* 00008D8C FC210032 */ fmul f1, f1, f0
/* 00008D90 C81F0108 */ lfd f0, 0x108(r31)
/* 00008D94 FC220828 */ fsub f1, f2, f1
/* 00008D98 FF600818 */ frsp f27, f1
/* 00008D9C FC1B0040 */ fcmpo cr0, f27, f0
/* 00008DA0 40800008 */ bge lbl_00008DA8
/* 00008DA4 C37F0110 */ lfs f27, 0x110(r31)
lbl_00008DA8:
/* 00008DA8 C81F00B8 */ lfd f0, 0xb8(r31)
/* 00008DAC 38000B16 */ li r0, 0xb16
/* 00008DB0 C83F0088 */ lfd f1, 0x88(r31)
/* 00008DB4 38610018 */ addi r3, r1, 0x18
/* 00008DB8 FC1E0028 */ fsub f0, f30, f0
/* 00008DBC FFA1F82A */ fadd f29, f1, f31
/* 00008DC0 90010018 */ stw r0, 0x18(r1)
/* 00008DC4 FF80D82A */ fadd f28, f0, f27
/* 00008DC8 FFA0E818 */ frsp f29, f29
/* 00008DCC FF80E018 */ frsp f28, f28
/* 00008DD0 D3A1001C */ stfs f29, 0x1c(r1)
/* 00008DD4 D3810020 */ stfs f28, 0x20(r1)
/* 00008DD8 C01F0008 */ lfs f0, 8(r31)
/* 00008DDC D0010024 */ stfs f0, 0x24(r1)
/* 00008DE0 4BFF736D */ bl draw_naomi_sprite
/* 00008DE4 881C014A */ lbz r0, 0x14a(r28)
/* 00008DE8 38810010 */ addi r4, r1, 0x10
/* 00008DEC 38610018 */ addi r3, r1, 0x18
/* 00008DF0 5400083C */ slwi r0, r0, 1
/* 00008DF4 7C0402AE */ lhax r0, r4, r0
/* 00008DF8 90010018 */ stw r0, 0x18(r1)
/* 00008DFC C81F0118 */ lfd f0, 0x118(r31)
/* 00008E00 FC00E82A */ fadd f0, f0, f29
/* 00008E04 FC000018 */ frsp f0, f0
/* 00008E08 D001001C */ stfs f0, 0x1c(r1)
/* 00008E0C C01F0120 */ lfs f0, 0x120(r31)
/* 00008E10 EC1C0028 */ fsubs f0, f28, f0
/* 00008E14 D0010020 */ stfs f0, 0x20(r1)
/* 00008E18 C01F0008 */ lfs f0, 8(r31)
/* 00008E1C D0010024 */ stfs f0, 0x24(r1)
/* 00008E20 4BFF732D */ bl draw_naomi_sprite
/* 00008E24 A87E0008 */ lha r3, 8(r30)
/* 00008E28 7C600735 */ extsh. r0, r3
/* 00008E2C 41820084 */ beq lbl_00008EB0
/* 00008E30 6C608000 */ xoris r0, r3, 0x8000
/* 00008E34 9001006C */ stw r0, 0x6c(r1)
/* 00008E38 3860000D */ li r3, 0xd
/* 00008E3C 3C004330 */ lis r0, 0x4330
/* 00008E40 9061004C */ stw r3, 0x4c(r1)
/* 00008E44 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008E48 90010068 */ stw r0, 0x68(r1)
/* 00008E4C 38000B39 */ li r0, 0xb39
/* 00008E50 C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 00008E54 38610018 */ addi r3, r1, 0x18
/* 00008E58 C8210068 */ lfd f1, 0x68(r1)
/* 00008E5C C81F00E8 */ lfd f0, 0xe8(r31)
/* 00008E60 FC211028 */ fsub f1, f1, f2
/* 00008E64 FC010024 */ fdiv f0, f1, f0
/* 00008E68 FC000018 */ frsp f0, f0
/* 00008E6C D0010028 */ stfs f0, 0x28(r1)
/* 00008E70 C0010028 */ lfs f0, 0x28(r1)
/* 00008E74 D001002C */ stfs f0, 0x2c(r1)
/* 00008E78 90010018 */ stw r0, 0x18(r1)
/* 00008E7C C81F0128 */ lfd f0, 0x128(r31)
/* 00008E80 FC00E82A */ fadd f0, f0, f29
/* 00008E84 FC000018 */ frsp f0, f0
/* 00008E88 D001001C */ stfs f0, 0x1c(r1)
/* 00008E8C C81F0130 */ lfd f0, 0x130(r31)
/* 00008E90 FC00E02A */ fadd f0, f0, f28
/* 00008E94 FC000018 */ frsp f0, f0
/* 00008E98 D0010020 */ stfs f0, 0x20(r1)
/* 00008E9C C01F009C */ lfs f0, 0x9c(r31)
/* 00008EA0 D0010024 */ stfs f0, 0x24(r1)
/* 00008EA4 4BFF72A9 */ bl draw_naomi_sprite
/* 00008EA8 38000005 */ li r0, 5
/* 00008EAC 9001004C */ stw r0, 0x4c(r1)
lbl_00008EB0:
/* 00008EB0 C01F00C8 */ lfs f0, 0xc8(r31)
/* 00008EB4 3CA00000 */ lis r5, modeCtrl@ha
/* 00008EB8 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00008EBC D0010028 */ stfs f0, 0x28(r1)
/* 00008EC0 3C600000 */ lis r3, lbl_80118938@ha
/* 00008EC4 38A50000 */ addi r5, r5, modeCtrl@l
/* 00008EC8 C01F0138 */ lfs f0, 0x138(r31)
/* 00008ECC 38840000 */ addi r4, r4, playerCharacterSelection@l
/* 00008ED0 38030000 */ addi r0, r3, lbl_80118938@l
/* 00008ED4 D001002C */ stfs f0, 0x2c(r1)
/* 00008ED8 38610018 */ addi r3, r1, 0x18
/* 00008EDC 80A5002C */ lwz r5, 0x2c(r5)
/* 00008EE0 54A5103A */ slwi r5, r5, 2
/* 00008EE4 7C842A14 */ add r4, r4, r5
/* 00008EE8 80840000 */ lwz r4, 0(r4)
/* 00008EEC 5484103A */ slwi r4, r4, 2
/* 00008EF0 7C802214 */ add r4, r0, r4
/* 00008EF4 80040000 */ lwz r0, 0(r4)
/* 00008EF8 90010018 */ stw r0, 0x18(r1)
/* 00008EFC C01F000C */ lfs f0, 0xc(r31)
/* 00008F00 EC00E82A */ fadds f0, f0, f29
/* 00008F04 D001001C */ stfs f0, 0x1c(r1)
/* 00008F08 C01F013C */ lfs f0, 0x13c(r31)
/* 00008F0C EC1C0028 */ fsubs f0, f28, f0
/* 00008F10 D0010020 */ stfs f0, 0x20(r1)
/* 00008F14 C01F0008 */ lfs f0, 8(r31)
/* 00008F18 D0010024 */ stfs f0, 0x24(r1)
/* 00008F1C 4BFF7231 */ bl draw_naomi_sprite
/* 00008F20 C01F0140 */ lfs f0, 0x140(r31)
/* 00008F24 3BC00B15 */ li r30, 0xb15
/* 00008F28 38610018 */ addi r3, r1, 0x18
/* 00008F2C D0010028 */ stfs f0, 0x28(r1)
/* 00008F30 C01F00C8 */ lfs f0, 0xc8(r31)
/* 00008F34 D001002C */ stfs f0, 0x2c(r1)
/* 00008F38 93C10018 */ stw r30, 0x18(r1)
/* 00008F3C C81F0048 */ lfd f0, 0x48(r31)
/* 00008F40 FFFF0028 */ fsub f31, f31, f0
/* 00008F44 FF80F818 */ frsp f28, f31
/* 00008F48 D381001C */ stfs f28, 0x1c(r1)
/* 00008F4C C81F0148 */ lfd f0, 0x148(r31)
/* 00008F50 FC00F02A */ fadd f0, f0, f30
/* 00008F54 FC000018 */ frsp f0, f0
/* 00008F58 D0010020 */ stfs f0, 0x20(r1)
/* 00008F5C C01F009C */ lfs f0, 0x9c(r31)
/* 00008F60 D0010024 */ stfs f0, 0x24(r1)
/* 00008F64 4BFF71E9 */ bl draw_naomi_sprite
/* 00008F68 93C10018 */ stw r30, 0x18(r1)
/* 00008F6C 38610018 */ addi r3, r1, 0x18
/* 00008F70 D381001C */ stfs f28, 0x1c(r1)
/* 00008F74 C81F0150 */ lfd f0, 0x150(r31)
/* 00008F78 FC00F02A */ fadd f0, f0, f30
/* 00008F7C FC000018 */ frsp f0, f0
/* 00008F80 D0010020 */ stfs f0, 0x20(r1)
/* 00008F84 C01F009C */ lfs f0, 0x9c(r31)
/* 00008F88 D0010024 */ stfs f0, 0x24(r1)
/* 00008F8C 4BFF71C1 */ bl draw_naomi_sprite
/* 00008F90 93C10018 */ stw r30, 0x18(r1)
/* 00008F94 38610018 */ addi r3, r1, 0x18
/* 00008F98 D381001C */ stfs f28, 0x1c(r1)
/* 00008F9C C81F0158 */ lfd f0, 0x158(r31)
/* 00008FA0 FC00F02A */ fadd f0, f0, f30
/* 00008FA4 FC000018 */ frsp f0, f0
/* 00008FA8 D0010020 */ stfs f0, 0x20(r1)
/* 00008FAC C01F009C */ lfs f0, 0x9c(r31)
/* 00008FB0 D0010024 */ stfs f0, 0x24(r1)
/* 00008FB4 4BFF7199 */ bl draw_naomi_sprite
/* 00008FB8 4BFF7195 */ bl reset_text_draw_settings
/* 00008FBC 38600057 */ li r3, 0x57
/* 00008FC0 4BFF718D */ bl set_text_font
/* 00008FC4 C81F0148 */ lfd f0, 0x148(r31)
/* 00008FC8 FC20E090 */ fmr f1, f28
/* 00008FCC FC5E0028 */ fsub f2, f30, f0
/* 00008FD0 FC401018 */ frsp f2, f2
/* 00008FD4 4BFF7179 */ bl set_text_pos
/* 00008FD8 C81F0108 */ lfd f0, 0x108(r31)
/* 00008FDC FC1B0040 */ fcmpo cr0, f27, f0
/* 00008FE0 4C401382 */ cror 2, 0, 2
/* 00008FE4 40820034 */ bne lbl_00009018
/* 00008FE8 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00008FEC 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 00008FF0 5400EFFF */ rlwinm. r0, r0, 0x1d, 0x1f, 0x1f
/* 00008FF4 41820030 */ beq lbl_00009024
/* 00008FF8 C01C0008 */ lfs f0, 8(r28)
/* 00008FFC 387D0108 */ addi r3, r29, 0x108
/* 00009000 4CC63182 */ crclr 6
/* 00009004 FC00001E */ fctiwz f0, f0
/* 00009008 D8010068 */ stfd f0, 0x68(r1)
/* 0000900C 8081006C */ lwz r4, 0x6c(r1)
/* 00009010 4BFF713D */ bl func_80072AC0
/* 00009014 48000010 */ b lbl_00009024
lbl_00009018:
/* 00009018 387D0114 */ addi r3, r29, 0x114
/* 0000901C 4CC63182 */ crclr 6
/* 00009020 4BFF712D */ bl func_80072AC0
lbl_00009024:
/* 00009024 C81F0160 */ lfd f0, 0x160(r31)
/* 00009028 FC20F818 */ frsp f1, f31
/* 0000902C FC40F02A */ fadd f2, f0, f30
/* 00009030 FC401018 */ frsp f2, f2
/* 00009034 4BFF7119 */ bl set_text_pos
/* 00009038 387D0118 */ addi r3, r29, 0x118
/* 0000903C 4CC63182 */ crclr 6
/* 00009040 4BFF710D */ bl func_80072AC0
/* 00009044 C83F0168 */ lfd f1, 0x168(r31)
/* 00009048 C81F0170 */ lfd f0, 0x170(r31)
/* 0000904C FC21F82A */ fadd f1, f1, f31
/* 00009050 FC40F02A */ fadd f2, f0, f30
/* 00009054 FC200818 */ frsp f1, f1
/* 00009058 FC401018 */ frsp f2, f2
/* 0000905C 4BFF70F1 */ bl set_text_pos
/* 00009060 387D011C */ addi r3, r29, 0x11c
/* 00009064 4CC63182 */ crclr 6
/* 00009068 4BFF70E5 */ bl func_80072AC0
/* 0000906C 800100AC */ lwz r0, 0xac(r1)
/* 00009070 CBE100A0 */ lfd f31, 0xa0(r1)
/* 00009074 CBC10098 */ lfd f30, 0x98(r1)
/* 00009078 7C0803A6 */ mtlr r0
/* 0000907C CBA10090 */ lfd f29, 0x90(r1)
/* 00009080 CB810088 */ lfd f28, 0x88(r1)
/* 00009084 CB610080 */ lfd f27, 0x80(r1)
/* 00009088 83E1007C */ lwz r31, 0x7c(r1)
/* 0000908C 83C10078 */ lwz r30, 0x78(r1)
/* 00009090 83A10074 */ lwz r29, 0x74(r1)
/* 00009094 83810070 */ lwz r28, 0x70(r1)
/* 00009098 382100A8 */ addi r1, r1, 0xa8
/* 0000909C 4E800020 */ blr 
lbl_000090A0:
/* 000090A0 7C0802A6 */ mflr r0
/* 000090A4 3CA00000 */ lis r5, lbl_0000C360@ha
/* 000090A8 90010004 */ stw r0, 4(r1)
/* 000090AC 3C800000 */ lis r4, currentBallStructPtr@ha
/* 000090B0 38E00000 */ li r7, 0
/* 000090B4 9421FF78 */ stwu r1, -0x88(r1)
/* 000090B8 38C0FFFF */ li r6, -1
/* 000090BC 38000058 */ li r0, 0x58
/* 000090C0 DBE10080 */ stfd f31, 0x80(r1)
/* 000090C4 DBC10078 */ stfd f30, 0x78(r1)
/* 000090C8 DBA10070 */ stfd f29, 0x70(r1)
/* 000090CC 93E1006C */ stw r31, 0x6c(r1)
/* 000090D0 3BE50000 */ addi r31, r5, lbl_0000C360@l
/* 000090D4 38A00005 */ li r5, 5
/* 000090D8 93C10068 */ stw r30, 0x68(r1)
/* 000090DC C3E30004 */ lfs f31, 4(r3)
/* 000090E0 C3C30008 */ lfs f30, 8(r3)
/* 000090E4 3C600100 */ lis r3, 0x100
/* 000090E8 83C40000 */ lwz r30, currentBallStructPtr@l(r4)
/* 000090EC 3883FFFF */ addi r4, r3, -1  ;# fixed addi
/* 000090F0 C01F0054 */ lfs f0, 0x54(r31)
/* 000090F4 3861000C */ addi r3, r1, 0xc
/* 000090F8 D001001C */ stfs f0, 0x1c(r1)
/* 000090FC C01F0054 */ lfs f0, 0x54(r31)
/* 00009100 D0010020 */ stfs f0, 0x20(r1)
/* 00009104 C01F0098 */ lfs f0, 0x98(r31)
/* 00009108 D0010028 */ stfs f0, 0x28(r1)
/* 0000910C D0010024 */ stfs f0, 0x24(r1)
/* 00009110 C01F0054 */ lfs f0, 0x54(r31)
/* 00009114 D0010030 */ stfs f0, 0x30(r1)
/* 00009118 D001002C */ stfs f0, 0x2c(r1)
/* 0000911C 90E10034 */ stw r7, 0x34(r1)
/* 00009120 90C1003C */ stw r6, 0x3c(r1)
/* 00009124 90A10040 */ stw r5, 0x40(r1)
/* 00009128 C01F0054 */ lfs f0, 0x54(r31)
/* 0000912C D0010038 */ stfs f0, 0x38(r1)
/* 00009130 90810044 */ stw r4, 0x44(r1)
/* 00009134 90E10048 */ stw r7, 0x48(r1)
/* 00009138 9001000C */ stw r0, 0xc(r1)
/* 0000913C C81F0178 */ lfd f0, 0x178(r31)
/* 00009140 FC00F82A */ fadd f0, f0, f31
/* 00009144 FC000018 */ frsp f0, f0
/* 00009148 D0010010 */ stfs f0, 0x10(r1)
/* 0000914C C81F0130 */ lfd f0, 0x130(r31)
/* 00009150 FC1E0028 */ fsub f0, f30, f0
/* 00009154 FC000018 */ frsp f0, f0
/* 00009158 D0010014 */ stfs f0, 0x14(r1)
/* 0000915C C01F009C */ lfs f0, 0x9c(r31)
/* 00009160 D0010018 */ stfs f0, 0x18(r1)
/* 00009164 4BFF6FE9 */ bl draw_naomi_sprite
/* 00009168 387E001C */ addi r3, r30, 0x1c
/* 0000916C C0230000 */ lfs f1, 0(r3)
/* 00009170 C0430004 */ lfs f2, 4(r3)
/* 00009174 C0030008 */ lfs f0, 8(r3)
/* 00009178 EC210072 */ fmuls f1, f1, f1
/* 0000917C EC2208BA */ fmadds f1, f2, f2, f1
/* 00009180 EC20083A */ fmadds f1, f0, f0, f1
/* 00009184 4BFF6FC9 */ bl mathutil_sqrt
/* 00009188 FFA00890 */ fmr f29, f1
/* 0000918C 4BFF6FC1 */ bl reset_text_draw_settings
/* 00009190 38600054 */ li r3, 0x54
/* 00009194 4BFF6FB9 */ bl set_text_font
/* 00009198 FC20F890 */ fmr f1, f31
/* 0000919C FC40F090 */ fmr f2, f30
/* 000091A0 4BFF6FAD */ bl set_text_pos
/* 000091A4 C81F00B0 */ lfd f0, 0xb0(r31)
/* 000091A8 3C600000 */ lis r3, lbl_0000D338@ha
/* 000091AC 38630000 */ addi r3, r3, lbl_0000D338@l
/* 000091B0 4CC63182 */ crclr 6
/* 000091B4 FC000772 */ fmul f0, f0, f29
/* 000091B8 FC00001E */ fctiwz f0, f0
/* 000091BC D8010060 */ stfd f0, 0x60(r1)
/* 000091C0 80810064 */ lwz r4, 0x64(r1)
/* 000091C4 4BFF6F89 */ bl func_80072AC0
/* 000091C8 8001008C */ lwz r0, 0x8c(r1)
/* 000091CC CBE10080 */ lfd f31, 0x80(r1)
/* 000091D0 CBC10078 */ lfd f30, 0x78(r1)
/* 000091D4 7C0803A6 */ mtlr r0
/* 000091D8 CBA10070 */ lfd f29, 0x70(r1)
/* 000091DC 83E1006C */ lwz r31, 0x6c(r1)
/* 000091E0 83C10068 */ lwz r30, 0x68(r1)
/* 000091E4 38210088 */ addi r1, r1, 0x88
/* 000091E8 4E800020 */ blr 
lbl_000091EC:
/* 000091EC 7C0802A6 */ mflr r0
/* 000091F0 3C800000 */ lis r4, lbl_10000040@ha
/* 000091F4 90010004 */ stw r0, 4(r1)
/* 000091F8 38E0FFFF */ li r7, -1
/* 000091FC 38C00005 */ li r6, 5
/* 00009200 9421FF58 */ stwu r1, -0xa8(r1)
/* 00009204 3D000000 */ lis r8, cameraInfo@ha
/* 00009208 DBE100A0 */ stfd f31, 0xa0(r1)
/* 0000920C DBC10098 */ stfd f30, 0x98(r1)
/* 00009210 DBA10090 */ stfd f29, 0x90(r1)
/* 00009214 DB810088 */ stfd f28, 0x88(r1)
/* 00009218 BF010068 */ stmw r24, 0x68(r1)
/* 0000921C 3BE00000 */ li r31, 0
/* 00009220 C3E30004 */ lfs f31, 4(r3)
/* 00009224 C3C30008 */ lfs f30, 8(r3)
/* 00009228 3C600000 */ lis r3, currentBallStructPtr@ha
/* 0000922C A8040000 */ lha r0, lbl_10000040@l(r4)
/* 00009230 38830000 */ addi r4, r3, currentBallStructPtr@l
/* 00009234 83A40000 */ lwz r29, 0(r4)
/* 00009238 3C800000 */ lis r4, lbl_0000C360@ha
/* 0000923C 3BC40000 */ addi r30, r4, lbl_0000C360@l
/* 00009240 88BD002E */ lbz r5, 0x2e(r29)
/* 00009244 3C600000 */ lis r3, lbl_0000D2E8@ha
/* 00009248 C01E0054 */ lfs f0, 0x54(r30)
/* 0000924C 54041838 */ slwi r4, r0, 3
/* 00009250 38030000 */ addi r0, r3, lbl_0000D2E8@l
/* 00009254 7C802214 */ add r4, r0, r4
/* 00009258 83640000 */ lwz r27, 0(r4)
/* 0000925C 7CA90774 */ extsb r9, r5
/* 00009260 AB440004 */ lha r26, 4(r4)
/* 00009264 3C600100 */ lis r3, 0x100
/* 00009268 38A3FFFF */ addi r5, r3, -1  ;# fixed addi
/* 0000926C D0010028 */ stfs f0, 0x28(r1)
/* 00009270 3880000A */ li r4, 0xa
/* 00009274 38000B19 */ li r0, 0xb19
/* 00009278 C01E0054 */ lfs f0, 0x54(r30)
/* 0000927C 1D290284 */ mulli r9, r9, 0x284
/* 00009280 D001002C */ stfs f0, 0x2c(r1)
/* 00009284 38680000 */ addi r3, r8, cameraInfo@l
/* 00009288 C01E0098 */ lfs f0, 0x98(r30)
/* 0000928C 7F834A14 */ add r28, r3, r9
/* 00009290 38610018 */ addi r3, r1, 0x18
/* 00009294 D0010034 */ stfs f0, 0x34(r1)
/* 00009298 D0010030 */ stfs f0, 0x30(r1)
/* 0000929C C01E0054 */ lfs f0, 0x54(r30)
/* 000092A0 D001003C */ stfs f0, 0x3c(r1)
/* 000092A4 D0010038 */ stfs f0, 0x38(r1)
/* 000092A8 93E10040 */ stw r31, 0x40(r1)
/* 000092AC 90E10048 */ stw r7, 0x48(r1)
/* 000092B0 90C1004C */ stw r6, 0x4c(r1)
/* 000092B4 C01E0054 */ lfs f0, 0x54(r30)
/* 000092B8 D0010044 */ stfs f0, 0x44(r1)
/* 000092BC 90A10050 */ stw r5, 0x50(r1)
/* 000092C0 93E10054 */ stw r31, 0x54(r1)
/* 000092C4 9081004C */ stw r4, 0x4c(r1)
/* 000092C8 90010018 */ stw r0, 0x18(r1)
/* 000092CC D3E1001C */ stfs f31, 0x1c(r1)
/* 000092D0 D3C10020 */ stfs f30, 0x20(r1)
/* 000092D4 C01E00F0 */ lfs f0, 0xf0(r30)
/* 000092D8 D0010024 */ stfs f0, 0x24(r1)
/* 000092DC 4BFF6E71 */ bl draw_naomi_sprite
/* 000092E0 4BFF6E6D */ bl mathutil_mtxA_from_identity
/* 000092E4 A81C001A */ lha r0, 0x1a(r28)
/* 000092E8 7C6000D0 */ neg r3, r0
/* 000092EC 4BFF6E61 */ bl mathutil_mtxA_rotate_y
/* 000092F0 387D0004 */ addi r3, r29, 4
/* 000092F4 4BFF6E59 */ bl mathutil_mtxA_translate_neg
/* 000092F8 3C6000FF */ lis r3, 0xff
/* 000092FC 3BA32020 */ addi r29, r3, 0x2020
/* 00009300 3B200000 */ li r25, 0
/* 00009304 48000110 */ b lbl_00009414
lbl_00009308:
/* 00009308 7C7BFA14 */ add r3, r27, r31
/* 0000930C 3881000C */ addi r4, r1, 0xc
/* 00009310 4BFF6E3D */ bl mathutil_mtxA_tf_point
/* 00009314 C01E0098 */ lfs f0, 0x98(r30)
/* 00009318 D0010010 */ stfs f0, 0x10(r1)
/* 0000931C C0010014 */ lfs f0, 0x14(r1)
/* 00009320 C021000C */ lfs f1, 0xc(r1)
/* 00009324 EC210072 */ fmuls f1, f1, f1
/* 00009328 EC20083A */ fmadds f1, f0, f0, f1
/* 0000932C 4BFF6E21 */ bl mathutil_sqrt
/* 00009330 C81E0180 */ lfd f0, 0x180(r30)
/* 00009334 FC010040 */ fcmpo cr0, f1, f0
/* 00009338 4C411382 */ cror 2, 1, 2
/* 0000933C 4082006C */ bne lbl_000093A8
/* 00009340 3861000C */ addi r3, r1, 0xc
/* 00009344 4BFF6E09 */ bl mathutil_vec_normalize_len
/* 00009348 C83E0180 */ lfd f1, 0x180(r30)
/* 0000934C 3B000B2F */ li r24, 0xb2f
/* 00009350 C001000C */ lfs f0, 0xc(r1)
/* 00009354 FC010032 */ fmul f0, f1, f0
/* 00009358 FC000018 */ frsp f0, f0
/* 0000935C D001000C */ stfs f0, 0xc(r1)
/* 00009360 C83E0180 */ lfd f1, 0x180(r30)
/* 00009364 C0010010 */ lfs f0, 0x10(r1)
/* 00009368 FC010032 */ fmul f0, f1, f0
/* 0000936C FC000018 */ frsp f0, f0
/* 00009370 D0010010 */ stfs f0, 0x10(r1)
/* 00009374 C83E0180 */ lfd f1, 0x180(r30)
/* 00009378 C0010014 */ lfs f0, 0x14(r1)
/* 0000937C FC010032 */ fmul f0, f1, f0
/* 00009380 FC000018 */ frsp f0, f0
/* 00009384 D0010014 */ stfs f0, 0x14(r1)
/* 00009388 A81C001A */ lha r0, 0x1a(r28)
/* 0000938C 7C0000D0 */ neg r0, r0
/* 00009390 90010040 */ stw r0, 0x40(r1)
/* 00009394 C01E0054 */ lfs f0, 0x54(r30)
/* 00009398 D0010028 */ stfs f0, 0x28(r1)
/* 0000939C C01E0054 */ lfs f0, 0x54(r30)
/* 000093A0 D001002C */ stfs f0, 0x2c(r1)
/* 000093A4 4800001C */ b lbl_000093C0
lbl_000093A8:
/* 000093A8 7C7BFA14 */ add r3, r27, r31
/* 000093AC C003000C */ lfs f0, 0xc(r3)
/* 000093B0 3B000B30 */ li r24, 0xb30
/* 000093B4 D0010028 */ stfs f0, 0x28(r1)
/* 000093B8 C0010028 */ lfs f0, 0x28(r1)
/* 000093BC D001002C */ stfs f0, 0x2c(r1)
lbl_000093C0:
/* 000093C0 C85E0188 */ lfd f2, 0x188(r30)
/* 000093C4 C021000C */ lfs f1, 0xc(r1)
/* 000093C8 C0010014 */ lfs f0, 0x14(r1)
/* 000093CC FFA20072 */ fmul f29, f2, f1
/* 000093D0 FF820032 */ fmul f28, f2, f0
/* 000093D4 FFA0E818 */ frsp f29, f29
/* 000093D8 FF80E018 */ frsp f28, f28
/* 000093DC 4BFF6D71 */ bl mathutil_mtxA_push
/* 000093E0 93A10050 */ stw r29, 0x50(r1)
/* 000093E4 EC3FE82A */ fadds f1, f31, f29
/* 000093E8 EC1EE02A */ fadds f0, f30, f28
/* 000093EC 38610018 */ addi r3, r1, 0x18
/* 000093F0 93010018 */ stw r24, 0x18(r1)
/* 000093F4 D021001C */ stfs f1, 0x1c(r1)
/* 000093F8 D0010020 */ stfs f0, 0x20(r1)
/* 000093FC C01E009C */ lfs f0, 0x9c(r30)
/* 00009400 D0010024 */ stfs f0, 0x24(r1)
/* 00009404 4BFF6D49 */ bl draw_naomi_sprite
/* 00009408 4BFF6D45 */ bl mathutil_mtxA_pop
/* 0000940C 3B390001 */ addi r25, r25, 1
/* 00009410 3BFF0010 */ addi r31, r31, 0x10
lbl_00009414:
/* 00009414 7C19D000 */ cmpw r25, r26
/* 00009418 4180FEF0 */ blt lbl_00009308
/* 0000941C BB010068 */ lmw r24, 0x68(r1)
/* 00009420 800100AC */ lwz r0, 0xac(r1)
/* 00009424 CBE100A0 */ lfd f31, 0xa0(r1)
/* 00009428 CBC10098 */ lfd f30, 0x98(r1)
/* 0000942C 7C0803A6 */ mtlr r0
/* 00009430 CBA10090 */ lfd f29, 0x90(r1)
/* 00009434 CB810088 */ lfd f28, 0x88(r1)
/* 00009438 382100A8 */ addi r1, r1, 0xa8
/* 0000943C 4E800020 */ blr 
lbl_00009440:
/* 00009440 7C0802A6 */ mflr r0
/* 00009444 3C800000 */ lis r4, modeCtrl@ha
/* 00009448 90010004 */ stw r0, 4(r1)
/* 0000944C 38840000 */ addi r4, r4, modeCtrl@l
/* 00009450 9421FF40 */ stwu r1, -0xc0(r1)
/* 00009454 DBE100B8 */ stfd f31, 0xb8(r1)
/* 00009458 DBC100B0 */ stfd f30, 0xb0(r1)
/* 0000945C DBA100A8 */ stfd f29, 0xa8(r1)
/* 00009460 DB8100A0 */ stfd f28, 0xa0(r1)
/* 00009464 DB610098 */ stfd f27, 0x98(r1)
/* 00009468 BE810068 */ stmw r20, 0x68(r1)
/* 0000946C 3A840024 */ addi r20, r4, 0x24
/* 00009470 80040024 */ lwz r0, 0x24(r4)
/* 00009474 3C800000 */ lis r4, lbl_0000D218@ha
/* 00009478 C3E30004 */ lfs f31, 4(r3)
/* 0000947C 3B040000 */ addi r24, r4, lbl_0000D218@l
/* 00009480 2C000001 */ cmpwi r0, 1
/* 00009484 C3C30008 */ lfs f30, 8(r3)
/* 00009488 3C600000 */ lis r3, lbl_0000C360@ha
/* 0000948C 3B230000 */ addi r25, r3, lbl_0000C360@l
/* 00009490 40820010 */ bne lbl_000094A0
/* 00009494 C8190048 */ lfd f0, 0x48(r25)
/* 00009498 FFDE002A */ fadd f30, f30, f0
/* 0000949C FFC0F018 */ frsp f30, f30
lbl_000094A0:
/* 000094A0 C0190054 */ lfs f0, 0x54(r25)
/* 000094A4 3C600100 */ lis r3, 0x100
/* 000094A8 3BA3FFFF */ addi r29, r3, -1  ;# fixed addi
/* 000094AC D001001C */ stfs f0, 0x1c(r1)
/* 000094B0 3B400000 */ li r26, 0
/* 000094B4 3B60FFFF */ li r27, -1
/* 000094B8 C0190054 */ lfs f0, 0x54(r25)
/* 000094BC 3B800005 */ li r28, 5
/* 000094C0 38000B0F */ li r0, 0xb0f
/* 000094C4 D0010020 */ stfs f0, 0x20(r1)
/* 000094C8 3861000C */ addi r3, r1, 0xc
/* 000094CC C0190098 */ lfs f0, 0x98(r25)
/* 000094D0 D0010028 */ stfs f0, 0x28(r1)
/* 000094D4 D0010024 */ stfs f0, 0x24(r1)
/* 000094D8 C0190054 */ lfs f0, 0x54(r25)
/* 000094DC D0010030 */ stfs f0, 0x30(r1)
/* 000094E0 D001002C */ stfs f0, 0x2c(r1)
/* 000094E4 93410034 */ stw r26, 0x34(r1)
/* 000094E8 9361003C */ stw r27, 0x3c(r1)
/* 000094EC 93810040 */ stw r28, 0x40(r1)
/* 000094F0 C0190054 */ lfs f0, 0x54(r25)
/* 000094F4 D0010038 */ stfs f0, 0x38(r1)
/* 000094F8 93A10044 */ stw r29, 0x44(r1)
/* 000094FC 93410048 */ stw r26, 0x48(r1)
/* 00009500 9001000C */ stw r0, 0xc(r1)
/* 00009504 D3E10010 */ stfs f31, 0x10(r1)
/* 00009508 D3C10014 */ stfs f30, 0x14(r1)
/* 0000950C C0190008 */ lfs f0, 8(r25)
/* 00009510 D0010018 */ stfs f0, 0x18(r1)
/* 00009514 4BFF6C39 */ bl draw_naomi_sprite
/* 00009518 3C60005C */ lis r3, 0x5c
/* 0000951C 38033B1B */ addi r0, r3, 0x3b1b
/* 00009520 90010048 */ stw r0, 0x48(r1)
/* 00009524 38000B0D */ li r0, 0xb0d
/* 00009528 3861000C */ addi r3, r1, 0xc
/* 0000952C 9001000C */ stw r0, 0xc(r1)
/* 00009530 C8190190 */ lfd f0, 0x190(r25)
/* 00009534 FC00F82A */ fadd f0, f0, f31
/* 00009538 FC000018 */ frsp f0, f0
/* 0000953C D0010010 */ stfs f0, 0x10(r1)
/* 00009540 C81900D0 */ lfd f0, 0xd0(r25)
/* 00009544 FC00F02A */ fadd f0, f0, f30
/* 00009548 FFA00018 */ frsp f29, f0
/* 0000954C D3A10014 */ stfs f29, 0x14(r1)
/* 00009550 C019009C */ lfs f0, 0x9c(r25)
/* 00009554 D0010018 */ stfs f0, 0x18(r1)
/* 00009558 4BFF6BF5 */ bl draw_naomi_sprite
/* 0000955C 4BFF6BF1 */ bl reset_text_draw_settings
/* 00009560 3C60FF00 */ lis r3, 0xff00
/* 00009564 4BFF6BE9 */ bl set_text_mul_color
/* 00009568 80610048 */ lwz r3, 0x48(r1)
/* 0000956C 4BFF6BE1 */ bl set_text_add_color
/* 00009570 38600056 */ li r3, 0x56
/* 00009574 4BFF6BD9 */ bl set_text_font
/* 00009578 C8190198 */ lfd f0, 0x198(r25)
/* 0000957C FC40E890 */ fmr f2, f29
/* 00009580 FC20F82A */ fadd f1, f0, f31
/* 00009584 FC200818 */ frsp f1, f1
/* 00009588 4BFF6BC5 */ bl set_text_pos
/* 0000958C 3C600000 */ lis r3, lbl_10000066@ha
/* 00009590 4CC63182 */ crclr 6
/* 00009594 A8830000 */ lha r4, lbl_10000066@l(r3)
/* 00009598 3878010C */ addi r3, r24, 0x10c
/* 0000959C 4BFF6BB1 */ bl func_80072AC0
/* 000095A0 C0190054 */ lfs f0, 0x54(r25)
/* 000095A4 D001001C */ stfs f0, 0x1c(r1)
/* 000095A8 C0190054 */ lfs f0, 0x54(r25)
/* 000095AC D0010020 */ stfs f0, 0x20(r1)
/* 000095B0 C0190098 */ lfs f0, 0x98(r25)
/* 000095B4 D0010028 */ stfs f0, 0x28(r1)
/* 000095B8 D0010024 */ stfs f0, 0x24(r1)
/* 000095BC C0190054 */ lfs f0, 0x54(r25)
/* 000095C0 D0010030 */ stfs f0, 0x30(r1)
/* 000095C4 D001002C */ stfs f0, 0x2c(r1)
/* 000095C8 93410034 */ stw r26, 0x34(r1)
/* 000095CC 9361003C */ stw r27, 0x3c(r1)
/* 000095D0 93810040 */ stw r28, 0x40(r1)
/* 000095D4 C0190054 */ lfs f0, 0x54(r25)
/* 000095D8 D0010038 */ stfs f0, 0x38(r1)
/* 000095DC 93A10044 */ stw r29, 0x44(r1)
/* 000095E0 93410048 */ stw r26, 0x48(r1)
/* 000095E4 80140000 */ lwz r0, 0(r20)
/* 000095E8 2C000001 */ cmpwi r0, 1
/* 000095EC 40810198 */ ble lbl_00009784
/* 000095F0 3C800000 */ lis r4, lbl_1000005C@ha
/* 000095F4 3C600000 */ lis r3, lbl_0000AEE0@ha
/* 000095F8 3AE40000 */ addi r23, r4, lbl_1000005C@l
/* 000095FC 38C30000 */ addi r6, r3, lbl_0000AEE0@l
/* 00009600 38770000 */ addi r3, r23, 0
/* 00009604 38800004 */ li r4, 4
/* 00009608 38A00002 */ li r5, 2
/* 0000960C 4BFF6B41 */ bl qsort
/* 00009610 C0190054 */ lfs f0, 0x54(r25)
/* 00009614 3C800000 */ lis r4, ballInfo@ha
/* 00009618 3C600000 */ lis r3, lbl_10000044@ha
/* 0000961C D001001C */ stfs f0, 0x1c(r1)
/* 00009620 3CA00000 */ lis r5, g_poolInfo@ha
/* 00009624 3BE40000 */ addi r31, r4, ballInfo@l
/* 00009628 C0190054 */ lfs f0, 0x54(r25)
/* 0000962C 3AA30000 */ addi r21, r3, lbl_10000044@l
/* 00009630 3BC50000 */ addi r30, r5, g_poolInfo@l
/* 00009634 D0010020 */ stfs f0, 0x20(r1)
/* 00009638 3AC00000 */ li r22, 0
/* 0000963C 3E804330 */ lis r20, 0x4330
/* 00009640 C0190098 */ lfs f0, 0x98(r25)
/* 00009644 D0010028 */ stfs f0, 0x28(r1)
/* 00009648 D0010024 */ stfs f0, 0x24(r1)
/* 0000964C C0190054 */ lfs f0, 0x54(r25)
/* 00009650 D0010030 */ stfs f0, 0x30(r1)
/* 00009654 D001002C */ stfs f0, 0x2c(r1)
/* 00009658 93410034 */ stw r26, 0x34(r1)
/* 0000965C 9361003C */ stw r27, 0x3c(r1)
/* 00009660 93810040 */ stw r28, 0x40(r1)
/* 00009664 C0190054 */ lfs f0, 0x54(r25)
/* 00009668 D0010038 */ stfs f0, 0x38(r1)
/* 0000966C 93A10044 */ stw r29, 0x44(r1)
/* 00009670 93410048 */ stw r26, 0x48(r1)
/* 00009674 C83901A0 */ lfd f1, 0x1a0(r25)
/* 00009678 C81901A8 */ lfd f0, 0x1a8(r25)
/* 0000967C FFA1F82A */ fadd f29, f1, f31
/* 00009680 FF80F82A */ fadd f28, f0, f31
/* 00009684 480000F4 */ b lbl_00009778
lbl_00009688:
/* 00009688 AB570000 */ lha r26, 0(r23)
/* 0000968C 807E000C */ lwz r3, 0xc(r30)
/* 00009690 7C03D0AE */ lbzx r0, r3, r26
/* 00009694 7C000775 */ extsb. r0, r0
/* 00009698 418200D8 */ beq lbl_00009770
/* 0000969C C8190048 */ lfd f0, 0x48(r25)
/* 000096A0 1C1A01A4 */ mulli r0, r26, 0x1a4
/* 000096A4 FFDE002A */ fadd f30, f30, f0
/* 000096A8 7C7F0214 */ add r3, r31, r0
/* 000096AC 8863014A */ lbz r3, 0x14a(r3)
/* 000096B0 FFC0F018 */ frsp f30, f30
/* 000096B4 480017E1 */ bl lbl_0000AE94
/* 000096B8 6C608000 */ xoris r0, r3, 0x8000
/* 000096BC C81900C0 */ lfd f0, 0xc0(r25)
/* 000096C0 90010064 */ stw r0, 0x64(r1)
/* 000096C4 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 000096C8 C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 000096CC 38000B11 */ li r0, 0xb11
/* 000096D0 92810060 */ stw r20, 0x60(r1)
/* 000096D4 3861000C */ addi r3, r1, 0xc
/* 000096D8 C8210060 */ lfd f1, 0x60(r1)
/* 000096DC FC211028 */ fsub f1, f1, f2
/* 000096E0 FC000072 */ fmul f0, f0, f1
/* 000096E4 FC000018 */ frsp f0, f0
/* 000096E8 D0010028 */ stfs f0, 0x28(r1)
/* 000096EC C83900C0 */ lfd f1, 0xc0(r25)
/* 000096F0 C0010028 */ lfs f0, 0x28(r1)
/* 000096F4 FC01002A */ fadd f0, f1, f0
/* 000096F8 FC000018 */ frsp f0, f0
/* 000096FC D0010030 */ stfs f0, 0x30(r1)
/* 00009700 C01900C8 */ lfs f0, 0xc8(r25)
/* 00009704 D0010020 */ stfs f0, 0x20(r1)
/* 00009708 9001000C */ stw r0, 0xc(r1)
/* 0000970C D3E10010 */ stfs f31, 0x10(r1)
/* 00009710 D3C10014 */ stfs f30, 0x14(r1)
/* 00009714 C0190008 */ lfs f0, 8(r25)
/* 00009718 D0010018 */ stfs f0, 0x18(r1)
/* 0000971C 4BFF6A31 */ bl draw_naomi_sprite
/* 00009720 38600055 */ li r3, 0x55
/* 00009724 4BFF6A29 */ bl set_text_font
/* 00009728 C81901A0 */ lfd f0, 0x1a0(r25)
/* 0000972C FC20E818 */ frsp f1, f29
/* 00009730 FF60F02A */ fadd f27, f0, f30
/* 00009734 FC40D818 */ frsp f2, f27
/* 00009738 4BFF6A15 */ bl set_text_pos
/* 0000973C 38780124 */ addi r3, r24, 0x124
/* 00009740 4CC63182 */ crclr 6
/* 00009744 389A0001 */ addi r4, r26, 1
/* 00009748 4BFF6A05 */ bl func_80072AC0
/* 0000974C FC20E018 */ frsp f1, f28
/* 00009750 FC40D818 */ frsp f2, f27
/* 00009754 4BFF69F9 */ bl set_text_pos
/* 00009758 5740103A */ slwi r0, r26, 2
/* 0000975C 4CC63182 */ crclr 6
/* 00009760 7C750214 */ add r3, r21, r0
/* 00009764 80830000 */ lwz r4, 0(r3)
/* 00009768 38780110 */ addi r3, r24, 0x110
/* 0000976C 4BFF69E1 */ bl func_80072AC0
lbl_00009770:
/* 00009770 3AF70002 */ addi r23, r23, 2
/* 00009774 3AD60001 */ addi r22, r22, 1
lbl_00009778:
/* 00009778 801E0008 */ lwz r0, 8(r30)
/* 0000977C 7C160000 */ cmpw r22, r0
/* 00009780 4180FF08 */ blt lbl_00009688
lbl_00009784:
/* 00009784 BA810068 */ lmw r20, 0x68(r1)
/* 00009788 800100C4 */ lwz r0, 0xc4(r1)
/* 0000978C CBE100B8 */ lfd f31, 0xb8(r1)
/* 00009790 CBC100B0 */ lfd f30, 0xb0(r1)
/* 00009794 7C0803A6 */ mtlr r0
/* 00009798 CBA100A8 */ lfd f29, 0xa8(r1)
/* 0000979C CB8100A0 */ lfd f28, 0xa0(r1)
/* 000097A0 CB610098 */ lfd f27, 0x98(r1)
/* 000097A4 382100C0 */ addi r1, r1, 0xc0
/* 000097A8 4E800020 */ blr 
lbl_000097AC:
/* 000097AC 3C800000 */ lis r4, lbl_802F1FF6@ha
/* 000097B0 A8040000 */ lha r0, lbl_802F1FF6@l(r4)
/* 000097B4 2C000002 */ cmpwi r0, 2
/* 000097B8 4C810020 */ blelr 
/* 000097BC 38000000 */ li r0, 0
/* 000097C0 98030000 */ stb r0, 0(r3)
/* 000097C4 4E800020 */ blr 
lbl_000097C8:
/* 000097C8 7C0802A6 */ mflr r0
/* 000097CC 3C800000 */ lis r4, lbl_0000C360@ha
/* 000097D0 90010004 */ stw r0, 4(r1)
/* 000097D4 9421FFA8 */ stwu r1, -0x58(r1)
/* 000097D8 DBE10050 */ stfd f31, 0x50(r1)
/* 000097DC DBC10048 */ stfd f30, 0x48(r1)
/* 000097E0 DBA10040 */ stfd f29, 0x40(r1)
/* 000097E4 DB810038 */ stfd f28, 0x38(r1)
/* 000097E8 93E10034 */ stw r31, 0x34(r1)
/* 000097EC 3BE40000 */ addi r31, r4, lbl_0000C360@l
/* 000097F0 3C800000 */ lis r4, lbl_0000D218@ha
/* 000097F4 93C10030 */ stw r30, 0x30(r1)
/* 000097F8 3BC40000 */ addi r30, r4, lbl_0000D218@l
/* 000097FC 93A1002C */ stw r29, 0x2c(r1)
/* 00009800 93810028 */ stw r28, 0x28(r1)
/* 00009804 C3E30004 */ lfs f31, 4(r3)
/* 00009808 C3C30008 */ lfs f30, 8(r3)
/* 0000980C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00009810 FFA0F890 */ fmr f29, f31
/* 00009814 83830000 */ lwz r28, currentBallStructPtr@l(r3)
/* 00009818 C39F01B0 */ lfs f28, 0x1b0(r31)
/* 0000981C 4BFF6931 */ bl reset_text_draw_settings
/* 00009820 38600009 */ li r3, 9
/* 00009824 4BFF6929 */ bl set_text_font
/* 00009828 FC20E090 */ fmr f1, f28
/* 0000982C FC40E090 */ fmr f2, f28
/* 00009830 4BFF691D */ bl set_text_scale
/* 00009834 3C800000 */ lis r4, lbl_10000066@ha
/* 00009838 3C600000 */ lis r3, lbl_10000064@ha
/* 0000983C 38840000 */ addi r4, r4, lbl_10000066@l
/* 00009840 A8030000 */ lha r0, lbl_10000064@l(r3)
/* 00009844 A8840000 */ lha r4, 0(r4)
/* 00009848 7C040000 */ cmpw r4, r0
/* 0000984C 41800048 */ blt lbl_00009894
/* 00009850 C83F01B8 */ lfd f1, 0x1b8(r31)
/* 00009854 C81F01C0 */ lfd f0, 0x1c0(r31)
/* 00009858 FC21E82A */ fadd f1, f1, f29
/* 0000985C FC5E0028 */ fsub f2, f30, f0
/* 00009860 FC200818 */ frsp f1, f1
/* 00009864 FC401018 */ frsp f2, f2
/* 00009868 4BFF68E5 */ bl set_text_pos
/* 0000986C 387E0128 */ addi r3, r30, 0x128
/* 00009870 4BFF68DD */ bl u_draw_text
/* 00009874 C81F01C8 */ lfd f0, 0x1c8(r31)
/* 00009878 FC40F090 */ fmr f2, f30
/* 0000987C FC20E82A */ fadd f1, f0, f29
/* 00009880 FC200818 */ frsp f1, f1
/* 00009884 4BFF68C9 */ bl set_text_pos
/* 00009888 387E0130 */ addi r3, r30, 0x130
/* 0000988C 4BFF68C1 */ bl u_draw_text
/* 00009890 48000040 */ b lbl_000098D0
lbl_00009894:
/* 00009894 2C04000A */ cmpwi r4, 0xa
/* 00009898 41800018 */ blt lbl_000098B0
/* 0000989C C83F0070 */ lfd f1, 0x70(r31)
/* 000098A0 C01F01B0 */ lfs f0, 0x1b0(r31)
/* 000098A4 FC010032 */ fmul f0, f1, f0
/* 000098A8 FFBD0028 */ fsub f29, f29, f0
/* 000098AC FFA0E818 */ frsp f29, f29
lbl_000098B0:
/* 000098B0 FC20E890 */ fmr f1, f29
/* 000098B4 FC40F090 */ fmr f2, f30
/* 000098B8 4BFF6895 */ bl set_text_pos
/* 000098BC 3C600000 */ lis r3, lbl_10000066@ha
/* 000098C0 4CC63182 */ crclr 6
/* 000098C4 A8830000 */ lha r4, lbl_10000066@l(r3)
/* 000098C8 387E0138 */ addi r3, r30, 0x138
/* 000098CC 4BFF6881 */ bl func_80072AC0
lbl_000098D0:
/* 000098D0 3C600000 */ lis r3, modeCtrl@ha
/* 000098D4 3BA30000 */ addi r29, r3, modeCtrl@l
/* 000098D8 801D0024 */ lwz r0, 0x24(r29)
/* 000098DC 2C000001 */ cmpwi r0, 1
/* 000098E0 41820094 */ beq lbl_00009974
/* 000098E4 889C014A */ lbz r4, 0x14a(r28)
/* 000098E8 3C600000 */ lis r3, lbl_801B7CF8@ha
/* 000098EC 38030000 */ addi r0, r3, lbl_801B7CF8@l
/* 000098F0 C87F01D0 */ lfd f3, 0x1d0(r31)
/* 000098F4 1C64000C */ mulli r3, r4, 0xc
/* 000098F8 7C601A14 */ add r3, r0, r3
/* 000098FC C0230000 */ lfs f1, 0(r3)
/* 00009900 C0030004 */ lfs f0, 4(r3)
/* 00009904 C0430008 */ lfs f2, 8(r3)
/* 00009908 FC230072 */ fmul f1, f3, f1
/* 0000990C FC030032 */ fmul f0, f3, f0
/* 00009910 FC4300B2 */ fmul f2, f3, f2
/* 00009914 FC20081E */ fctiwz f1, f1
/* 00009918 FC00001E */ fctiwz f0, f0
/* 0000991C FC40101E */ fctiwz f2, f2
/* 00009920 D8210018 */ stfd f1, 0x18(r1)
/* 00009924 D8010010 */ stfd f0, 0x10(r1)
/* 00009928 8081001C */ lwz r4, 0x1c(r1)
/* 0000992C D8410020 */ stfd f2, 0x20(r1)
/* 00009930 80010014 */ lwz r0, 0x14(r1)
/* 00009934 80A10024 */ lwz r5, 0x24(r1)
/* 00009938 5403442E */ rlwinm r3, r0, 8, 0x10, 0x17
/* 0000993C 5083821E */ rlwimi r3, r4, 0x10, 8, 0xf
/* 00009940 50A3063E */ rlwimi r3, r5, 0, 0x18, 0x1f
/* 00009944 4BFF6809 */ bl set_text_mul_color
/* 00009948 C81F01E0 */ lfd f0, 0x1e0(r31)
/* 0000994C C03F01D8 */ lfs f1, 0x1d8(r31)
/* 00009950 FC40F02A */ fadd f2, f0, f30
/* 00009954 EC21F82A */ fadds f1, f1, f31
/* 00009958 FC401018 */ frsp f2, f2
/* 0000995C 4BFF67F1 */ bl set_text_pos
/* 00009960 809D002C */ lwz r4, 0x2c(r29)
/* 00009964 387E0144 */ addi r3, r30, 0x144
/* 00009968 4CC63182 */ crclr 6
/* 0000996C 38840001 */ addi r4, r4, 1
/* 00009970 4BFF67DD */ bl func_80072AC0
lbl_00009974:
/* 00009974 8001005C */ lwz r0, 0x5c(r1)
/* 00009978 CBE10050 */ lfd f31, 0x50(r1)
/* 0000997C CBC10048 */ lfd f30, 0x48(r1)
/* 00009980 7C0803A6 */ mtlr r0
/* 00009984 CBA10040 */ lfd f29, 0x40(r1)
/* 00009988 CB810038 */ lfd f28, 0x38(r1)
/* 0000998C 83E10034 */ lwz r31, 0x34(r1)
/* 00009990 83C10030 */ lwz r30, 0x30(r1)
/* 00009994 83A1002C */ lwz r29, 0x2c(r1)
/* 00009998 83810028 */ lwz r28, 0x28(r1)
/* 0000999C 38210058 */ addi r1, r1, 0x58
/* 000099A0 4E800020 */ blr 
lbl_000099A4:
/* 000099A4 7C0802A6 */ mflr r0
/* 000099A8 3C600000 */ lis r3, lbl_0000C360@ha
/* 000099AC 90010004 */ stw r0, 4(r1)
/* 000099B0 9421FFF0 */ stwu r1, -0x10(r1)
/* 000099B4 93E1000C */ stw r31, 0xc(r1)
/* 000099B8 3BE30000 */ addi r31, r3, lbl_0000C360@l
/* 000099BC 4BFF6791 */ bl create_sprite
/* 000099C0 7C671B79 */ or. r7, r3, r3
/* 000099C4 4182004C */ beq lbl_00009A10
/* 000099C8 C01F01E8 */ lfs f0, 0x1e8(r31)
/* 000099CC 3C600000 */ lis r3, lbl_0000D360@ha
/* 000099D0 38830000 */ addi r4, r3, lbl_0000D360@l
/* 000099D4 4CC63182 */ crclr 6
/* 000099D8 D0070004 */ stfs f0, 4(r7)
/* 000099DC 38C00000 */ li r6, 0
/* 000099E0 C01F005C */ lfs f0, 0x5c(r31)
/* 000099E4 38A00009 */ li r5, 9
/* 000099E8 38000004 */ li r0, 4
/* 000099EC D0070008 */ stfs f0, 8(r7)
/* 000099F0 3867008C */ addi r3, r7, 0x8c
/* 000099F4 98C70000 */ stb r6, 0(r7)
/* 000099F8 98A70001 */ stb r5, 1(r7)
/* 000099FC 98070003 */ stb r0, 3(r7)
/* 00009A00 80070074 */ lwz r0, 0x74(r7)
/* 00009A04 60001000 */ ori r0, r0, 0x1000
/* 00009A08 90070074 */ stw r0, 0x74(r7)
/* 00009A0C 4BFF6741 */ bl sprintf
lbl_00009A10:
/* 00009A10 4BFF673D */ bl create_sprite
/* 00009A14 28030000 */ cmplwi r3, 0
/* 00009A18 41820044 */ beq lbl_00009A5C
/* 00009A1C 38000001 */ li r0, 1
/* 00009A20 98030000 */ stb r0, 0(r3)
/* 00009A24 38800B31 */ li r4, 0xb31
/* 00009A28 38000004 */ li r0, 4
/* 00009A2C C01F00F0 */ lfs f0, 0xf0(r31)
/* 00009A30 D003004C */ stfs f0, 0x4c(r3)
/* 00009A34 B083003C */ sth r4, 0x3c(r3)
/* 00009A38 C01F01E8 */ lfs f0, 0x1e8(r31)
/* 00009A3C D0030004 */ stfs f0, 4(r3)
/* 00009A40 C01F01EC */ lfs f0, 0x1ec(r31)
/* 00009A44 D0030008 */ stfs f0, 8(r3)
/* 00009A48 C01F01F0 */ lfs f0, 0x1f0(r31)
/* 00009A4C D0030040 */ stfs f0, 0x40(r3)
/* 00009A50 C01F01F4 */ lfs f0, 0x1f4(r31)
/* 00009A54 D0030044 */ stfs f0, 0x44(r3)
/* 00009A58 98030003 */ stb r0, 3(r3)
lbl_00009A5C:
/* 00009A5C 4BFF66F1 */ bl create_sprite
/* 00009A60 28030000 */ cmplwi r3, 0
/* 00009A64 41820020 */ beq lbl_00009A84
/* 00009A68 C01F01F8 */ lfs f0, 0x1f8(r31)
/* 00009A6C 3C800000 */ lis r4, lbl_00009A98@ha
/* 00009A70 38040000 */ addi r0, r4, lbl_00009A98@l
/* 00009A74 D0030004 */ stfs f0, 4(r3)
/* 00009A78 C01F01FC */ lfs f0, 0x1fc(r31)
/* 00009A7C D0030008 */ stfs f0, 8(r3)
/* 00009A80 90030038 */ stw r0, 0x38(r3)
lbl_00009A84:
/* 00009A84 80010014 */ lwz r0, 0x14(r1)
/* 00009A88 83E1000C */ lwz r31, 0xc(r1)
/* 00009A8C 38210010 */ addi r1, r1, 0x10
/* 00009A90 7C0803A6 */ mtlr r0
/* 00009A94 4E800020 */ blr 
lbl_00009A98:
/* 00009A98 7C0802A6 */ mflr r0
/* 00009A9C 90010004 */ stw r0, 4(r1)
/* 00009AA0 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009AA4 DBE10018 */ stfd f31, 0x18(r1)
/* 00009AA8 DBC10010 */ stfd f30, 0x10(r1)
/* 00009AAC C3E30004 */ lfs f31, 4(r3)
/* 00009AB0 C3C30008 */ lfs f30, 8(r3)
/* 00009AB4 4BFF6699 */ bl reset_text_draw_settings
/* 00009AB8 386000B1 */ li r3, 0xb1
/* 00009ABC 4BFF6691 */ bl set_text_font
/* 00009AC0 3C600020 */ lis r3, 0x20
/* 00009AC4 4BFF6689 */ bl func_80071B50
/* 00009AC8 3C600000 */ lis r3, lbl_0000D368@ha
/* 00009ACC FC20F890 */ fmr f1, f31
/* 00009AD0 38A30000 */ addi r5, r3, lbl_0000D368@l
/* 00009AD4 FC40F090 */ fmr f2, f30
/* 00009AD8 3C600100 */ lis r3, 0x100
/* 00009ADC 4CC63242 */ crset 6
/* 00009AE0 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00009AE4 38800000 */ li r4, 0
/* 00009AE8 48001285 */ bl lbl_0000AD6C
/* 00009AEC 80010024 */ lwz r0, 0x24(r1)
/* 00009AF0 CBE10018 */ lfd f31, 0x18(r1)
/* 00009AF4 CBC10010 */ lfd f30, 0x10(r1)
/* 00009AF8 7C0803A6 */ mtlr r0
/* 00009AFC 38210020 */ addi r1, r1, 0x20
/* 00009B00 4E800020 */ blr 
lbl_00009B04:
/* 00009B04 9421FFD8 */ stwu r1, -0x28(r1)
/* 00009B08 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00009B0C A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00009B10 3C600000 */ lis r3, lbl_0000C360@ha
/* 00009B14 38E30000 */ addi r7, r3, lbl_0000C360@l
/* 00009B18 2C00000A */ cmpwi r0, 0xa
/* 00009B1C 4082002C */ bne lbl_00009B48
/* 00009B20 3C600000 */ lis r3, lbl_1000008C@ha
/* 00009B24 80030000 */ lwz r0, lbl_1000008C@l(r3)
/* 00009B28 2C000050 */ cmpwi r0, 0x50
/* 00009B2C 4080001C */ bge lbl_00009B48
/* 00009B30 80640048 */ lwz r3, 0x48(r4)
/* 00009B34 2C03000C */ cmpwi r3, 0xc
/* 00009B38 40800024 */ bge lbl_00009B5C
/* 00009B3C 38030001 */ addi r0, r3, 1
/* 00009B40 90040048 */ stw r0, 0x48(r4)
/* 00009B44 48000018 */ b lbl_00009B5C
lbl_00009B48:
/* 00009B48 80640048 */ lwz r3, 0x48(r4)
/* 00009B4C 2C030000 */ cmpwi r3, 0
/* 00009B50 4081000C */ ble lbl_00009B5C
/* 00009B54 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009B58 90040048 */ stw r0, 0x48(r4)
lbl_00009B5C:
/* 00009B5C 80040048 */ lwz r0, 0x48(r4)
/* 00009B60 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00009B64 C8230000 */ lfd f1, lbl_0000C3C0@l(r3)
/* 00009B68 3CC04330 */ lis r6, 0x4330
/* 00009B6C 6C008000 */ xoris r0, r0, 0x8000
/* 00009B70 90010024 */ stw r0, 0x24(r1)
/* 00009B74 3CA00000 */ lis r5, lbl_0000C3C0@ha
/* 00009B78 C8470200 */ lfd f2, 0x200(r7)
/* 00009B7C 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00009B80 90C10020 */ stw r6, 0x20(r1)
/* 00009B84 C86700B8 */ lfd f3, 0xb8(r7)
/* 00009B88 C8010020 */ lfd f0, 0x20(r1)
/* 00009B8C EC000828 */ fsubs f0, f0, f1
/* 00009B90 FC020032 */ fmul f0, f2, f0
/* 00009B94 FC03002A */ fadd f0, f3, f0
/* 00009B98 FC000018 */ frsp f0, f0
/* 00009B9C D0040040 */ stfs f0, 0x40(r4)
/* 00009BA0 C0040040 */ lfs f0, 0x40(r4)
/* 00009BA4 D0040044 */ stfs f0, 0x44(r4)
/* 00009BA8 80040048 */ lwz r0, 0x48(r4)
/* 00009BAC C8250000 */ lfd f1, lbl_0000C3C0@l(r5)
/* 00009BB0 6C008000 */ xoris r0, r0, 0x8000
/* 00009BB4 C8470210 */ lfd f2, 0x210(r7)
/* 00009BB8 9001001C */ stw r0, 0x1c(r1)
/* 00009BBC C8670208 */ lfd f3, 0x208(r7)
/* 00009BC0 90C10018 */ stw r6, 0x18(r1)
/* 00009BC4 C8010018 */ lfd f0, 0x18(r1)
/* 00009BC8 EC000828 */ fsubs f0, f0, f1
/* 00009BCC FC020032 */ fmul f0, f2, f0
/* 00009BD0 FC03002A */ fadd f0, f3, f0
/* 00009BD4 FC000018 */ frsp f0, f0
/* 00009BD8 D0040004 */ stfs f0, 4(r4)
/* 00009BDC 80040048 */ lwz r0, 0x48(r4)
/* 00009BE0 C8230000 */ lfd f1, lbl_0000C3C0@l(r3)
/* 00009BE4 6C008000 */ xoris r0, r0, 0x8000
/* 00009BE8 C8470220 */ lfd f2, 0x220(r7)
/* 00009BEC 90010014 */ stw r0, 0x14(r1)
/* 00009BF0 C8670218 */ lfd f3, 0x218(r7)
/* 00009BF4 90C10010 */ stw r6, 0x10(r1)
/* 00009BF8 C8010010 */ lfd f0, 0x10(r1)
/* 00009BFC 38210028 */ addi r1, r1, 0x28
/* 00009C00 EC000828 */ fsubs f0, f0, f1
/* 00009C04 FC020032 */ fmul f0, f2, f0
/* 00009C08 FC03002A */ fadd f0, f3, f0
/* 00009C0C FC000018 */ frsp f0, f0
/* 00009C10 D0040008 */ stfs f0, 8(r4)
/* 00009C14 4E800020 */ blr 
lbl_00009C18:
/* 00009C18 7C0802A6 */ mflr r0
/* 00009C1C 3C800000 */ lis r4, lbl_0000C360@ha
/* 00009C20 90010004 */ stw r0, 4(r1)
/* 00009C24 39800000 */ li r12, 0
/* 00009C28 3960FFFF */ li r11, -1
/* 00009C2C 9421FF38 */ stwu r1, -0xc8(r1)
/* 00009C30 38000005 */ li r0, 5
/* 00009C34 3D400100 */ lis r10, 0x100
/* 00009C38 DBE100C0 */ stfd f31, 0xc0(r1)
/* 00009C3C 3CC00000 */ lis r6, lbl_802F1FE4@ha
/* 00009C40 3CE00000 */ lis r7, lbl_80285A80@ha
/* 00009C44 DBC100B8 */ stfd f30, 0xb8(r1)
/* 00009C48 3CA000A1 */ lis r5, 0xa1
/* 00009C4C DBA100B0 */ stfd f29, 0xb0(r1)
/* 00009C50 BE410078 */ stmw r18, 0x78(r1)
/* 00009C54 3B240000 */ addi r25, r4, lbl_0000C360@l
/* 00009C58 3C800000 */ lis r4, lbl_0000D300@ha
/* 00009C5C 39240000 */ addi r9, r4, lbl_0000D300@l
/* 00009C60 3C800010 */ lis r4, 0x10
/* 00009C64 3B4AFFFF */ addi r26, r10, -1  ;# fixed addi
/* 00009C68 3A630000 */ addi r19, r3, 0
/* 00009C6C 3AE90002 */ addi r23, r9, 2
/* 00009C70 3B860000 */ addi r28, r6, lbl_802F1FE4@l
/* 00009C74 3B670000 */ addi r27, r7, lbl_80285A80@l
/* 00009C78 3BA5A0A0 */ addi r29, r5, -24416  ;# fixed addi
/* 00009C7C 3A444010 */ addi r18, r4, 0x4010
/* 00009C80 3AA00001 */ li r21, 1
/* 00009C84 3B000002 */ li r24, 2
/* 00009C88 3FE04330 */ lis r31, 0x4330
/* 00009C8C C0230040 */ lfs f1, 0x40(r3)
/* 00009C90 C8590228 */ lfd f2, 0x228(r25)
/* 00009C94 C3E30004 */ lfs f31, 4(r3)
/* 00009C98 C3C30008 */ lfs f30, 8(r3)
/* 00009C9C FC220072 */ fmul f1, f2, f1
/* 00009CA0 C0190054 */ lfs f0, 0x54(r25)
/* 00009CA4 3C600000 */ lis r3, modeCtrl@ha
/* 00009CA8 39030000 */ addi r8, r3, modeCtrl@l
/* 00009CAC D001001C */ stfs f0, 0x1c(r1)
/* 00009CB0 C0190054 */ lfs f0, 0x54(r25)
/* 00009CB4 FC20081E */ fctiwz f1, f1
/* 00009CB8 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00009CBC D0010020 */ stfs f0, 0x20(r1)
/* 00009CC0 3BC30000 */ addi r30, r3, unpausedFrameCounter@l
/* 00009CC4 3AC8002C */ addi r22, r8, 0x2c
/* 00009CC8 C0190098 */ lfs f0, 0x98(r25)
/* 00009CCC D8210070 */ stfd f1, 0x70(r1)
/* 00009CD0 D0010028 */ stfs f0, 0x28(r1)
/* 00009CD4 82810074 */ lwz r20, 0x74(r1)
/* 00009CD8 D0010024 */ stfs f0, 0x24(r1)
/* 00009CDC C0190054 */ lfs f0, 0x54(r25)
/* 00009CE0 D0010030 */ stfs f0, 0x30(r1)
/* 00009CE4 D001002C */ stfs f0, 0x2c(r1)
/* 00009CE8 91810034 */ stw r12, 0x34(r1)
/* 00009CEC 9161003C */ stw r11, 0x3c(r1)
/* 00009CF0 90010040 */ stw r0, 0x40(r1)
/* 00009CF4 C0190054 */ lfs f0, 0x54(r25)
/* 00009CF8 D0010038 */ stfs f0, 0x38(r1)
/* 00009CFC 93410044 */ stw r26, 0x44(r1)
/* 00009D00 91810048 */ stw r12, 0x48(r1)
/* 00009D04 C0130040 */ lfs f0, 0x40(r19)
/* 00009D08 D001001C */ stfs f0, 0x1c(r1)
/* 00009D0C C0130044 */ lfs f0, 0x44(r19)
/* 00009D10 D0010020 */ stfs f0, 0x20(r1)
lbl_00009D14:
/* 00009D14 80960000 */ lwz r4, 0(r22)
/* 00009D18 1C04000C */ mulli r0, r4, 0xc
/* 00009D1C 7C1B0214 */ add r0, r27, r0
/* 00009D20 7C60C214 */ add r3, r0, r24
/* 00009D24 A8030000 */ lha r0, 0(r3)
/* 00009D28 2C000000 */ cmpwi r0, 0
/* 00009D2C 41820088 */ beq lbl_00009DB4
/* 00009D30 801E0000 */ lwz r0, 0(r30)
/* 00009D34 3C600000 */ lis r3, lbl_0000C5B8@ha
/* 00009D38 C8230000 */ lfd f1, lbl_0000C5B8@l(r3)
/* 00009D3C 540006FE */ clrlwi r0, r0, 0x1b
/* 00009D40 C8B90230 */ lfd f5, 0x230(r25)
/* 00009D44 90010074 */ stw r0, 0x74(r1)
/* 00009D48 C8590238 */ lfd f2, 0x238(r25)
/* 00009D4C 93E10070 */ stw r31, 0x70(r1)
/* 00009D50 C87900D0 */ lfd f3, 0xd0(r25)
/* 00009D54 C8010070 */ lfd f0, 0x70(r1)
/* 00009D58 C89900B8 */ lfd f4, 0xb8(r25)
/* 00009D5C ECC00828 */ fsubs f6, f0, f1
/* 00009D60 C8190248 */ lfd f0, 0x248(r25)
/* 00009D64 C8390240 */ lfd f1, 0x240(r25)
/* 00009D68 FCA60172 */ fmul f5, f6, f5
/* 00009D6C FCA02818 */ frsp f5, f5
/* 00009D70 FC451028 */ fsub f2, f5, f2
/* 00009D74 FC401018 */ frsp f2, f2
/* 00009D78 FC4300B2 */ fmul f2, f3, f2
/* 00009D7C FC401210 */ fabs f2, f2
/* 00009D80 FC441028 */ fsub f2, f4, f2
/* 00009D84 FC401018 */ frsp f2, f2
/* 00009D88 FC0000B2 */ fmul f0, f0, f2
/* 00009D8C FC01002A */ fadd f0, f1, f0
/* 00009D90 FC000018 */ frsp f0, f0
/* 00009D94 FC00001E */ fctiwz f0, f0
/* 00009D98 D8010068 */ stfd f0, 0x68(r1)
/* 00009D9C 8061006C */ lwz r3, 0x6c(r1)
/* 00009DA0 5460442E */ rlwinm r0, r3, 8, 0x10, 0x17
/* 00009DA4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009DA8 5060063E */ rlwimi r0, r3, 0, 0x18, 0x1f
/* 00009DAC 90010044 */ stw r0, 0x44(r1)
/* 00009DB0 48000030 */ b lbl_00009DE0
lbl_00009DB4:
/* 00009DB4 80130048 */ lwz r0, 0x48(r19)
/* 00009DB8 2C00000C */ cmpwi r0, 0xc
/* 00009DBC 41800020 */ blt lbl_00009DDC
/* 00009DC0 5480083C */ slwi r0, r4, 1
/* 00009DC4 7C7C0214 */ add r3, r28, r0
/* 00009DC8 A8030000 */ lha r0, 0(r3)
/* 00009DCC 7C150000 */ cmpw r21, r0
/* 00009DD0 4082000C */ bne lbl_00009DDC
/* 00009DD4 93410044 */ stw r26, 0x44(r1)
/* 00009DD8 48000008 */ b lbl_00009DE0
lbl_00009DDC:
/* 00009DDC 93A10044 */ stw r29, 0x44(r1)
lbl_00009DE0:
/* 00009DE0 3815FFFF */ addi r0, r21, -1  ;# fixed addi
/* 00009DE4 A877FFFE */ lha r3, -2(r23)
/* 00009DE8 7C1401D6 */ mullw r0, r20, r0
/* 00009DEC 9061000C */ stw r3, 0xc(r1)
/* 00009DF0 6C008000 */ xoris r0, r0, 0x8000
/* 00009DF4 9001006C */ stw r0, 0x6c(r1)
/* 00009DF8 3C800000 */ lis r4, lbl_0000C3C0@ha
/* 00009DFC C8240000 */ lfd f1, lbl_0000C3C0@l(r4)
/* 00009E00 3861000C */ addi r3, r1, 0xc
/* 00009E04 93E10068 */ stw r31, 0x68(r1)
/* 00009E08 C8010068 */ lfd f0, 0x68(r1)
/* 00009E0C EC000828 */ fsubs f0, f0, f1
/* 00009E10 EFBF002A */ fadds f29, f31, f0
/* 00009E14 D3A10010 */ stfs f29, 0x10(r1)
/* 00009E18 D3C10014 */ stfs f30, 0x14(r1)
/* 00009E1C C019009C */ lfs f0, 0x9c(r25)
/* 00009E20 D0010018 */ stfs f0, 0x18(r1)
/* 00009E24 4BFF6329 */ bl draw_naomi_sprite
/* 00009E28 92410044 */ stw r18, 0x44(r1)
/* 00009E2C 80160000 */ lwz r0, 0(r22)
/* 00009E30 5400083C */ slwi r0, r0, 1
/* 00009E34 7C7C0214 */ add r3, r28, r0
/* 00009E38 A8030000 */ lha r0, 0(r3)
/* 00009E3C 7C150000 */ cmpw r21, r0
/* 00009E40 408200D8 */ bne lbl_00009F18
/* 00009E44 80130048 */ lwz r0, 0x48(r19)
/* 00009E48 2C00000C */ cmpwi r0, 0xc
/* 00009E4C 41800064 */ blt lbl_00009EB0
/* 00009E50 801E0000 */ lwz r0, 0(r30)
/* 00009E54 3C600000 */ lis r3, lbl_0000C5B8@ha
/* 00009E58 C8630000 */ lfd f3, lbl_0000C5B8@l(r3)
/* 00009E5C 540006FE */ clrlwi r0, r0, 0x1b
/* 00009E60 C8990230 */ lfd f4, 0x230(r25)
/* 00009E64 9001006C */ stw r0, 0x6c(r1)
/* 00009E68 C8390238 */ lfd f1, 0x238(r25)
/* 00009E6C 93E10068 */ stw r31, 0x68(r1)
/* 00009E70 C85900D0 */ lfd f2, 0xd0(r25)
/* 00009E74 C8010068 */ lfd f0, 0x68(r1)
/* 00009E78 ECA01828 */ fsubs f5, f0, f3
/* 00009E7C C87900B8 */ lfd f3, 0xb8(r25)
/* 00009E80 C81901D0 */ lfd f0, 0x1d0(r25)
/* 00009E84 FC850132 */ fmul f4, f5, f4
/* 00009E88 FC802018 */ frsp f4, f4
/* 00009E8C FC240828 */ fsub f1, f4, f1
/* 00009E90 FC200818 */ frsp f1, f1
/* 00009E94 FC220072 */ fmul f1, f2, f1
/* 00009E98 FC200A10 */ fabs f1, f1
/* 00009E9C FC230828 */ fsub f1, f3, f1
/* 00009EA0 FC200818 */ frsp f1, f1
/* 00009EA4 FC000072 */ fmul f0, f0, f1
/* 00009EA8 FC000018 */ frsp f0, f0
/* 00009EAC 48000008 */ b lbl_00009EB4
lbl_00009EB0:
/* 00009EB0 C0190250 */ lfs f0, 0x250(r25)
lbl_00009EB4:
/* 00009EB4 FC00001E */ fctiwz f0, f0
/* 00009EB8 38000B04 */ li r0, 0xb04
/* 00009EBC 3861000C */ addi r3, r1, 0xc
/* 00009EC0 D8010068 */ stfd f0, 0x68(r1)
/* 00009EC4 D8010070 */ stfd f0, 0x70(r1)
/* 00009EC8 8081006C */ lwz r4, 0x6c(r1)
/* 00009ECC 80A10074 */ lwz r5, 0x74(r1)
/* 00009ED0 5484063E */ clrlwi r4, r4, 0x18
/* 00009ED4 D8010060 */ stfd f0, 0x60(r1)
/* 00009ED8 20C40001 */ subfic r6, r4, 1
/* 00009EDC 80810064 */ lwz r4, 0x64(r1)
/* 00009EE0 54A5063E */ clrlwi r5, r5, 0x18
/* 00009EE4 20A50001 */ subfic r5, r5, 1
/* 00009EE8 5484442E */ rlwinm r4, r4, 8, 0x10, 0x17
/* 00009EEC 50A48BDE */ rlwimi r4, r5, 0x11, 0xf, 0xf
/* 00009EF0 50C40FFE */ rlwimi r4, r6, 1, 0x1f, 0x1f
/* 00009EF4 90810048 */ stw r4, 0x48(r1)
/* 00009EF8 9001000C */ stw r0, 0xc(r1)
/* 00009EFC D3A10010 */ stfs f29, 0x10(r1)
/* 00009F00 D3C10014 */ stfs f30, 0x14(r1)
/* 00009F04 C0190254 */ lfs f0, 0x254(r25)
/* 00009F08 D0010018 */ stfs f0, 0x18(r1)
/* 00009F0C 4BFF6241 */ bl draw_naomi_sprite
/* 00009F10 38000000 */ li r0, 0
/* 00009F14 90010048 */ stw r0, 0x48(r1)
lbl_00009F18:
/* 00009F18 3AB50001 */ addi r21, r21, 1
/* 00009F1C 2C150006 */ cmpwi r21, 6
/* 00009F20 3B180002 */ addi r24, r24, 2
/* 00009F24 3AF70002 */ addi r23, r23, 2
/* 00009F28 4180FDEC */ blt lbl_00009D14
/* 00009F2C BA410078 */ lmw r18, 0x78(r1)
/* 00009F30 800100CC */ lwz r0, 0xcc(r1)
/* 00009F34 CBE100C0 */ lfd f31, 0xc0(r1)
/* 00009F38 CBC100B8 */ lfd f30, 0xb8(r1)
/* 00009F3C 7C0803A6 */ mtlr r0
/* 00009F40 CBA100B0 */ lfd f29, 0xb0(r1)
/* 00009F44 382100C8 */ addi r1, r1, 0xc8
/* 00009F48 4E800020 */ blr 
lbl_00009F4C:
/* 00009F4C 7C0802A6 */ mflr r0
/* 00009F50 90010004 */ stw r0, 4(r1)
/* 00009F54 9421FFF8 */ stwu r1, -8(r1)
/* 00009F58 4BFF61F5 */ bl create_sprite
/* 00009F5C 28030000 */ cmplwi r3, 0
/* 00009F60 41820040 */ beq lbl_00009FA0
/* 00009F64 3C800000 */ lis r4, lbl_0000C548@ha
/* 00009F68 C0040000 */ lfs f0, lbl_0000C548@l(r4)
/* 00009F6C 3C800000 */ lis r4, lbl_0000C5C0@ha
/* 00009F70 38C40000 */ addi r6, r4, lbl_0000C5C0@l
/* 00009F74 D0030004 */ stfs f0, 4(r3)
/* 00009F78 3CA00000 */ lis r5, lbl_00009FB0@ha
/* 00009F7C 3C800000 */ lis r4, lbl_0000A098@ha
/* 00009F80 C0060000 */ lfs f0, 0(r6)
/* 00009F84 38C00000 */ li r6, 0
/* 00009F88 38A50000 */ addi r5, r5, lbl_00009FB0@l
/* 00009F8C D0030008 */ stfs f0, 8(r3)
/* 00009F90 38040000 */ addi r0, r4, lbl_0000A098@l
/* 00009F94 90C30048 */ stw r6, 0x48(r3)
/* 00009F98 90A30034 */ stw r5, 0x34(r3)
/* 00009F9C 90030038 */ stw r0, 0x38(r3)
lbl_00009FA0:
/* 00009FA0 8001000C */ lwz r0, 0xc(r1)
/* 00009FA4 38210008 */ addi r1, r1, 8
/* 00009FA8 7C0803A6 */ mtlr r0
/* 00009FAC 4E800020 */ blr 
lbl_00009FB0:
/* 00009FB0 9421FFC8 */ stwu r1, -0x38(r1)
/* 00009FB4 3CA00000 */ lis r5, lbl_802F1FF6@ha
/* 00009FB8 A8050000 */ lha r0, lbl_802F1FF6@l(r5)
/* 00009FBC 3CA00000 */ lis r5, lbl_0000C360@ha
/* 00009FC0 38E50000 */ addi r7, r5, lbl_0000C360@l
/* 00009FC4 2C000004 */ cmpwi r0, 4
/* 00009FC8 40810010 */ ble lbl_00009FD8
/* 00009FCC 38000000 */ li r0, 0
/* 00009FD0 98030000 */ stb r0, 0(r3)
/* 00009FD4 480000BC */ b lbl_0000A090
lbl_00009FD8:
/* 00009FD8 3C600000 */ lis r3, lbl_10000088@ha
/* 00009FDC A8030000 */ lha r0, lbl_10000088@l(r3)
/* 00009FE0 2C000004 */ cmpwi r0, 4
/* 00009FE4 4082001C */ bne lbl_0000A000
/* 00009FE8 80640048 */ lwz r3, 0x48(r4)
/* 00009FEC 2C030000 */ cmpwi r3, 0
/* 00009FF0 40810024 */ ble lbl_0000A014
/* 00009FF4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009FF8 90040048 */ stw r0, 0x48(r4)
/* 00009FFC 48000018 */ b lbl_0000A014
lbl_0000A000:
/* 0000A000 80640048 */ lwz r3, 0x48(r4)
/* 0000A004 2C030014 */ cmpwi r3, 0x14
/* 0000A008 4080000C */ bge lbl_0000A014
/* 0000A00C 38030001 */ addi r0, r3, 1
/* 0000A010 90040048 */ stw r0, 0x48(r4)
lbl_0000A014:
/* 0000A014 C80700B8 */ lfd f0, 0xb8(r7)
/* 0000A018 3CC04330 */ lis r6, 0x4330
/* 0000A01C 80040048 */ lwz r0, 0x48(r4)
/* 0000A020 3CA00000 */ lis r5, lbl_0000C3C0@ha
/* 0000A024 FC000018 */ frsp f0, f0
/* 0000A028 6C008000 */ xoris r0, r0, 0x8000
/* 0000A02C 90010034 */ stw r0, 0x34(r1)
/* 0000A030 D0040040 */ stfs f0, 0x40(r4)
/* 0000A034 C0040040 */ lfs f0, 0x40(r4)
/* 0000A038 90C10030 */ stw r6, 0x30(r1)
/* 0000A03C D0040044 */ stfs f0, 0x44(r4)
/* 0000A040 80040048 */ lwz r0, 0x48(r4)
/* 0000A044 C8250000 */ lfd f1, lbl_0000C3C0@l(r5)
/* 0000A048 6C008000 */ xoris r0, r0, 0x8000
/* 0000A04C C8470270 */ lfd f2, 0x270(r7)
/* 0000A050 9001002C */ stw r0, 0x2c(r1)
/* 0000A054 C8670268 */ lfd f3, 0x268(r7)
/* 0000A058 90C10028 */ stw r6, 0x28(r1)
/* 0000A05C C8010028 */ lfd f0, 0x28(r1)
/* 0000A060 EC000828 */ fsubs f0, f0, f1
/* 0000A064 FC020032 */ fmul f0, f2, f0
/* 0000A068 FC03002A */ fadd f0, f3, f0
/* 0000A06C FC000018 */ frsp f0, f0
/* 0000A070 D0040004 */ stfs f0, 4(r4)
/* 0000A074 80040048 */ lwz r0, 0x48(r4)
/* 0000A078 C8070278 */ lfd f0, 0x278(r7)
/* 0000A07C 6C008000 */ xoris r0, r0, 0x8000
/* 0000A080 FC000018 */ frsp f0, f0
/* 0000A084 90010024 */ stw r0, 0x24(r1)
/* 0000A088 90C10020 */ stw r6, 0x20(r1)
/* 0000A08C D0040008 */ stfs f0, 8(r4)
lbl_0000A090:
/* 0000A090 38210038 */ addi r1, r1, 0x38
/* 0000A094 4E800020 */ blr 
lbl_0000A098:
/* 0000A098 7C0802A6 */ mflr r0
/* 0000A09C 3C800000 */ lis r4, lbl_10000087@ha
/* 0000A0A0 90010004 */ stw r0, 4(r1)
/* 0000A0A4 9421FF38 */ stwu r1, -0xc8(r1)
/* 0000A0A8 DBE100C0 */ stfd f31, 0xc0(r1)
/* 0000A0AC DBC100B8 */ stfd f30, 0xb8(r1)
/* 0000A0B0 DBA100B0 */ stfd f29, 0xb0(r1)
/* 0000A0B4 DB8100A8 */ stfd f28, 0xa8(r1)
/* 0000A0B8 DB6100A0 */ stfd f27, 0xa0(r1)
/* 0000A0BC BE61006C */ stmw r19, 0x6c(r1)
/* 0000A0C0 3AA30000 */ addi r21, r3, 0
/* 0000A0C4 88040000 */ lbz r0, lbl_10000087@l(r4)
/* 0000A0C8 3C800000 */ lis r4, lbl_0000D218@ha
/* 0000A0CC C3C30004 */ lfs f30, 4(r3)
/* 0000A0D0 3B640000 */ addi r27, r4, lbl_0000D218@l
/* 0000A0D4 7C000774 */ extsb r0, r0
/* 0000A0D8 2C00000C */ cmpwi r0, 0xc
/* 0000A0DC C3E30008 */ lfs f31, 8(r3)
/* 0000A0E0 3C600000 */ lis r3, lbl_0000C360@ha
/* 0000A0E4 3B830000 */ addi r28, r3, lbl_0000C360@l
/* 0000A0E8 41820030 */ beq lbl_0000A118
/* 0000A0EC 40800010 */ bge lbl_0000A0FC
/* 0000A0F0 2C00000A */ cmpwi r0, 0xa
/* 0000A0F4 41820014 */ beq lbl_0000A108
/* 0000A0F8 4800003C */ b lbl_0000A134
lbl_0000A0FC:
/* 0000A0FC 2C00000F */ cmpwi r0, 0xf
/* 0000A100 41820028 */ beq lbl_0000A128
/* 0000A104 48000030 */ b lbl_0000A134
lbl_0000A108:
/* 0000A108 C39C0280 */ lfs f28, 0x280(r28)
/* 0000A10C 3B000B21 */ li r24, 0xb21
/* 0000A110 C3BC0284 */ lfs f29, 0x284(r28)
/* 0000A114 48000020 */ b lbl_0000A134
lbl_0000A118:
/* 0000A118 C39C0288 */ lfs f28, 0x288(r28)
/* 0000A11C 3B000B20 */ li r24, 0xb20
/* 0000A120 C3BC0054 */ lfs f29, 0x54(r28)
/* 0000A124 48000010 */ b lbl_0000A134
lbl_0000A128:
/* 0000A128 C39C028C */ lfs f28, 0x28c(r28)
/* 0000A12C 3B000B1F */ li r24, 0xb1f
/* 0000A130 C3BC0054 */ lfs f29, 0x54(r28)
lbl_0000A134:
/* 0000A134 C01C0054 */ lfs f0, 0x54(r28)
/* 0000A138 3E600100 */ lis r19, 0x100
/* 0000A13C 38C00000 */ li r6, 0
/* 0000A140 D0010024 */ stfs f0, 0x24(r1)
/* 0000A144 3860FFFF */ li r3, -1
/* 0000A148 38A00005 */ li r5, 5
/* 0000A14C C01C0054 */ lfs f0, 0x54(r28)
/* 0000A150 3BB3FFFF */ addi r29, r19, -1  ;# fixed addi
/* 0000A154 3880000A */ li r4, 0xa
/* 0000A158 D0010028 */ stfs f0, 0x28(r1)
/* 0000A15C 38000B22 */ li r0, 0xb22
/* 0000A160 C01C0098 */ lfs f0, 0x98(r28)
/* 0000A164 D0010030 */ stfs f0, 0x30(r1)
/* 0000A168 D001002C */ stfs f0, 0x2c(r1)
/* 0000A16C C01C0054 */ lfs f0, 0x54(r28)
/* 0000A170 D0010038 */ stfs f0, 0x38(r1)
/* 0000A174 D0010034 */ stfs f0, 0x34(r1)
/* 0000A178 90C1003C */ stw r6, 0x3c(r1)
/* 0000A17C 90610044 */ stw r3, 0x44(r1)
/* 0000A180 38610014 */ addi r3, r1, 0x14
/* 0000A184 90A10048 */ stw r5, 0x48(r1)
/* 0000A188 C01C0054 */ lfs f0, 0x54(r28)
/* 0000A18C D0010040 */ stfs f0, 0x40(r1)
/* 0000A190 93A1004C */ stw r29, 0x4c(r1)
/* 0000A194 90C10050 */ stw r6, 0x50(r1)
/* 0000A198 90810048 */ stw r4, 0x48(r1)
/* 0000A19C 90010014 */ stw r0, 0x14(r1)
/* 0000A1A0 D3C10018 */ stfs f30, 0x18(r1)
/* 0000A1A4 D3E1001C */ stfs f31, 0x1c(r1)
/* 0000A1A8 C01C00F0 */ lfs f0, 0xf0(r28)
/* 0000A1AC D0010020 */ stfs f0, 0x20(r1)
/* 0000A1B0 4BFF5F9D */ bl draw_naomi_sprite
/* 0000A1B4 38000B27 */ li r0, 0xb27
/* 0000A1B8 90010014 */ stw r0, 0x14(r1)
/* 0000A1BC 38610014 */ addi r3, r1, 0x14
/* 0000A1C0 D3C10018 */ stfs f30, 0x18(r1)
/* 0000A1C4 D3E1001C */ stfs f31, 0x1c(r1)
/* 0000A1C8 C01C0290 */ lfs f0, 0x290(r28)
/* 0000A1CC D0010020 */ stfs f0, 0x20(r1)
/* 0000A1D0 4BFF5F7D */ bl draw_naomi_sprite
/* 0000A1D4 3C600000 */ lis r3, lbl_10000078@ha
/* 0000A1D8 3B230000 */ addi r25, r3, lbl_10000078@l
/* 0000A1DC 3C600000 */ lis r3, lbl_10000087@ha
/* 0000A1E0 3B590000 */ addi r26, r25, 0
/* 0000A1E4 3A739230 */ addi r19, r19, -28112  ;# fixed addi
/* 0000A1E8 3A830000 */ addi r20, r3, lbl_10000087@l
/* 0000A1EC 3AE00000 */ li r23, 0
/* 0000A1F0 3FE00001 */ lis r31, 1
/* 0000A1F4 480000BC */ b lbl_0000A2B0
lbl_0000A1F8:
/* 0000A1F8 7C1F1BD6 */ divw r0, r31, r3
/* 0000A1FC 7C000734 */ extsh r0, r0
/* 0000A200 3BC0000E */ li r30, 0xe
/* 0000A204 93C10048 */ stw r30, 0x48(r1)
/* 0000A208 7C7701D6 */ mullw r3, r23, r0
/* 0000A20C C01C0054 */ lfs f0, 0x54(r28)
/* 0000A210 D0010024 */ stfs f0, 0x24(r1)
/* 0000A214 7C000E70 */ srawi r0, r0, 1
/* 0000A218 C01C0054 */ lfs f0, 0x54(r28)
/* 0000A21C 7C760734 */ extsh r22, r3
/* 0000A220 7C000194 */ addze r0, r0
/* 0000A224 D0010028 */ stfs f0, 0x28(r1)
/* 0000A228 7C760214 */ add r3, r22, r0
/* 0000A22C 38000B28 */ li r0, 0xb28
/* 0000A230 9061003C */ stw r3, 0x3c(r1)
/* 0000A234 38610014 */ addi r3, r1, 0x14
/* 0000A238 90010014 */ stw r0, 0x14(r1)
/* 0000A23C D3C10018 */ stfs f30, 0x18(r1)
/* 0000A240 D3E1001C */ stfs f31, 0x1c(r1)
/* 0000A244 C01C0294 */ lfs f0, 0x294(r28)
/* 0000A248 D0010020 */ stfs f0, 0x20(r1)
/* 0000A24C 4BFF5F01 */ bl draw_naomi_sprite
/* 0000A250 881A0000 */ lbz r0, 0(r26)
/* 0000A254 7C000774 */ extsb r0, r0
/* 0000A258 2C00FFFF */ cmpwi r0, -1
/* 0000A25C 4182004C */ beq lbl_0000A2A8
/* 0000A260 93C10048 */ stw r30, 0x48(r1)
/* 0000A264 3BC00000 */ li r30, 0
/* 0000A268 38610014 */ addi r3, r1, 0x14
/* 0000A26C 92C1003C */ stw r22, 0x3c(r1)
/* 0000A270 93C1004C */ stw r30, 0x4c(r1)
/* 0000A274 92610050 */ stw r19, 0x50(r1)
/* 0000A278 C01C0298 */ lfs f0, 0x298(r28)
/* 0000A27C D0010040 */ stfs f0, 0x40(r1)
/* 0000A280 93010014 */ stw r24, 0x14(r1)
/* 0000A284 D3C10018 */ stfs f30, 0x18(r1)
/* 0000A288 D3E1001C */ stfs f31, 0x1c(r1)
/* 0000A28C C01C0008 */ lfs f0, 8(r28)
/* 0000A290 D0010020 */ stfs f0, 0x20(r1)
/* 0000A294 4BFF5EB9 */ bl draw_naomi_sprite
/* 0000A298 C01C0054 */ lfs f0, 0x54(r28)
/* 0000A29C D0010040 */ stfs f0, 0x40(r1)
/* 0000A2A0 93A1004C */ stw r29, 0x4c(r1)
/* 0000A2A4 93C10050 */ stw r30, 0x50(r1)
lbl_0000A2A8:
/* 0000A2A8 3B5A0001 */ addi r26, r26, 1
/* 0000A2AC 3AF70001 */ addi r23, r23, 1
lbl_0000A2B0:
/* 0000A2B0 88740000 */ lbz r3, 0(r20)
/* 0000A2B4 7C630774 */ extsb r3, r3
/* 0000A2B8 7C171800 */ cmpw r23, r3
/* 0000A2BC 4180FF3C */ blt lbl_0000A1F8
/* 0000A2C0 3C000001 */ lis r0, 1
/* 0000A2C4 7C801BD6 */ divw r4, r0, r3
/* 0000A2C8 3800000E */ li r0, 0xe
/* 0000A2CC 90010048 */ stw r0, 0x48(r1)
/* 0000A2D0 3C600000 */ lis r3, lbl_1000008A@ha
/* 0000A2D4 38A30000 */ addi r5, r3, lbl_1000008A@l
/* 0000A2D8 C01C0054 */ lfs f0, 0x54(r28)
/* 0000A2DC 3C600000 */ lis r3, lbl_10000088@ha
/* 0000A2E0 D0010024 */ stfs f0, 0x24(r1)
/* 0000A2E4 C01C0054 */ lfs f0, 0x54(r28)
/* 0000A2E8 D0010028 */ stfs f0, 0x28(r1)
/* 0000A2EC A0A50000 */ lhz r5, 0(r5)
/* 0000A2F0 7C0523D6 */ divw r0, r5, r4
/* 0000A2F4 7C0021D6 */ mullw r0, r0, r4
/* 0000A2F8 7C002850 */ subf r0, r0, r5
/* 0000A2FC 7C002850 */ subf r0, r0, r5
/* 0000A300 5400043E */ clrlwi r0, r0, 0x10
/* 0000A304 9001003C */ stw r0, 0x3c(r1)
/* 0000A308 A8030000 */ lha r0, lbl_10000088@l(r3)
/* 0000A30C 2C000002 */ cmpwi r0, 2
/* 0000A310 40810014 */ ble lbl_0000A324
/* 0000A314 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000A318 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 0000A31C 5400F7FF */ rlwinm. r0, r0, 0x1e, 0x1f, 0x1f
/* 0000A320 4182004C */ beq lbl_0000A36C
lbl_0000A324:
/* 0000A324 C01C029C */ lfs f0, 0x29c(r28)
/* 0000A328 3EC00100 */ lis r22, 0x100
/* 0000A32C 3896E6E6 */ addi r4, r22, -6426  ;# fixed addi
/* 0000A330 D0010040 */ stfs f0, 0x40(r1)
/* 0000A334 38000000 */ li r0, 0
/* 0000A338 38610014 */ addi r3, r1, 0x14
/* 0000A33C 9081004C */ stw r4, 0x4c(r1)
/* 0000A340 90010050 */ stw r0, 0x50(r1)
/* 0000A344 93010014 */ stw r24, 0x14(r1)
/* 0000A348 D3C10018 */ stfs f30, 0x18(r1)
/* 0000A34C D3E1001C */ stfs f31, 0x1c(r1)
/* 0000A350 C01C009C */ lfs f0, 0x9c(r28)
/* 0000A354 D0010020 */ stfs f0, 0x20(r1)
/* 0000A358 4BFF5DF5 */ bl draw_naomi_sprite
/* 0000A35C C01C0054 */ lfs f0, 0x54(r28)
/* 0000A360 3816FFFF */ addi r0, r22, -1  ;# fixed addi
/* 0000A364 D0010040 */ stfs f0, 0x40(r1)
/* 0000A368 9001004C */ stw r0, 0x4c(r1)
lbl_0000A36C:
/* 0000A36C 3800000A */ li r0, 0xa
/* 0000A370 90010048 */ stw r0, 0x48(r1)
/* 0000A374 3CA00000 */ lis r5, modeCtrl@ha
/* 0000A378 3C800000 */ lis r4, playerCharacterSelection@ha
/* 0000A37C C01C0018 */ lfs f0, 0x18(r28)
/* 0000A380 3C600000 */ lis r3, lbl_80118938@ha
/* 0000A384 38A50000 */ addi r5, r5, modeCtrl@l
/* 0000A388 D0010024 */ stfs f0, 0x24(r1)
/* 0000A38C 38840000 */ addi r4, r4, playerCharacterSelection@l
/* 0000A390 38030000 */ addi r0, r3, lbl_80118938@l
/* 0000A394 C01C001C */ lfs f0, 0x1c(r28)
/* 0000A398 38610014 */ addi r3, r1, 0x14
/* 0000A39C D0010028 */ stfs f0, 0x28(r1)
/* 0000A3A0 80A5002C */ lwz r5, 0x2c(r5)
/* 0000A3A4 54A5103A */ slwi r5, r5, 2
/* 0000A3A8 7C842A14 */ add r4, r4, r5
/* 0000A3AC 80840000 */ lwz r4, 0(r4)
/* 0000A3B0 5484103A */ slwi r4, r4, 2
/* 0000A3B4 7C802214 */ add r4, r0, r4
/* 0000A3B8 80040000 */ lwz r0, 0(r4)
/* 0000A3BC 90010014 */ stw r0, 0x14(r1)
/* 0000A3C0 D3C10018 */ stfs f30, 0x18(r1)
/* 0000A3C4 D3E1001C */ stfs f31, 0x1c(r1)
/* 0000A3C8 C01C0254 */ lfs f0, 0x254(r28)
/* 0000A3CC D0010020 */ stfs f0, 0x20(r1)
/* 0000A3D0 4BFF5D7D */ bl draw_naomi_sprite
/* 0000A3D4 3C800100 */ lis r4, 0x100
/* 0000A3D8 3C600000 */ lis r3, lbl_10000087@ha
/* 0000A3DC 3BE4FFFF */ addi r31, r4, -1  ;# fixed addi
/* 0000A3E0 3AC30000 */ addi r22, r3, lbl_10000087@l
/* 0000A3E4 3B400000 */ li r26, 0
/* 0000A3E8 3FC00001 */ lis r30, 1
/* 0000A3EC 480000A4 */ b lbl_0000A490
lbl_0000A3F0:
/* 0000A3F0 7C7E03D6 */ divw r3, r30, r0
/* 0000A3F4 88190000 */ lbz r0, 0(r25)
/* 0000A3F8 7C630734 */ extsh r3, r3
/* 0000A3FC 7E7A19D6 */ mullw r19, r26, r3
/* 0000A400 7C000774 */ extsb r0, r0
/* 0000A404 2C00FFFF */ cmpwi r0, -1
/* 0000A408 41820080 */ beq lbl_0000A488
/* 0000A40C 93E1004C */ stw r31, 0x4c(r1)
/* 0000A410 38800000 */ li r4, 0
/* 0000A414 3800000A */ li r0, 0xa
/* 0000A418 90810050 */ stw r4, 0x50(r1)
/* 0000A41C 7E630734 */ extsh r3, r19
/* 0000A420 90010048 */ stw r0, 0x48(r1)
/* 0000A424 D3A10024 */ stfs f29, 0x24(r1)
/* 0000A428 D3A10028 */ stfs f29, 0x28(r1)
/* 0000A42C 9081003C */ stw r4, 0x3c(r1)
/* 0000A430 4BFF5D1D */ bl mathutil_sin
/* 0000A434 FC000850 */ fneg f0, f1
/* 0000A438 7E630734 */ extsh r3, r19
/* 0000A43C 38634000 */ addi r3, r3, 0x4000
/* 0000A440 EF7C0032 */ fmuls f27, f28, f0
/* 0000A444 4BFF5D09 */ bl mathutil_sin
/* 0000A448 88190000 */ lbz r0, 0(r25)
/* 0000A44C FC000850 */ fneg f0, f1
/* 0000A450 EC3ED82A */ fadds f1, f30, f27
/* 0000A454 38610014 */ addi r3, r1, 0x14
/* 0000A458 7C000774 */ extsb r0, r0
/* 0000A45C 5400083C */ slwi r0, r0, 1
/* 0000A460 7C9B0214 */ add r4, r27, r0
/* 0000A464 EC1C0032 */ fmuls f0, f28, f0
/* 0000A468 A80400F4 */ lha r0, 0xf4(r4)
/* 0000A46C 90010014 */ stw r0, 0x14(r1)
/* 0000A470 EC1F002A */ fadds f0, f31, f0
/* 0000A474 D0210018 */ stfs f1, 0x18(r1)
/* 0000A478 D001001C */ stfs f0, 0x1c(r1)
/* 0000A47C C01C0290 */ lfs f0, 0x290(r28)
/* 0000A480 D0010020 */ stfs f0, 0x20(r1)
/* 0000A484 4BFF5CC9 */ bl draw_naomi_sprite
lbl_0000A488:
/* 0000A488 3B390001 */ addi r25, r25, 1
/* 0000A48C 3B5A0001 */ addi r26, r26, 1
lbl_0000A490:
/* 0000A490 88160000 */ lbz r0, 0(r22)
/* 0000A494 7C000774 */ extsb r0, r0
/* 0000A498 7C1A0000 */ cmpw r26, r0
/* 0000A49C 4180FF54 */ blt lbl_0000A3F0
/* 0000A4A0 3C600000 */ lis r3, lbl_10000088@ha
/* 0000A4A4 A8030000 */ lha r0, lbl_10000088@l(r3)
/* 0000A4A8 2C000000 */ cmpwi r0, 0
/* 0000A4AC 408201C8 */ bne lbl_0000A674
/* 0000A4B0 80150048 */ lwz r0, 0x48(r21)
/* 0000A4B4 2C00000F */ cmpwi r0, 0xf
/* 0000A4B8 408101BC */ ble lbl_0000A674
/* 0000A4BC C3FC02A0 */ lfs f31, 0x2a0(r28)
/* 0000A4C0 3C600100 */ lis r3, 0x100
/* 0000A4C4 C3DC02A4 */ lfs f30, 0x2a4(r28)
/* 0000A4C8 3AE00000 */ li r23, 0
/* 0000A4CC C01C0054 */ lfs f0, 0x54(r28)
/* 0000A4D0 38A0FFFF */ li r5, -1
/* 0000A4D4 D0010024 */ stfs f0, 0x24(r1)
/* 0000A4D8 38800005 */ li r4, 5
/* 0000A4DC 3AC3FFFF */ addi r22, r3, -1  ;# fixed addi
/* 0000A4E0 C01C0054 */ lfs f0, 0x54(r28)
/* 0000A4E4 38000B31 */ li r0, 0xb31
/* 0000A4E8 38610014 */ addi r3, r1, 0x14
/* 0000A4EC D0010028 */ stfs f0, 0x28(r1)
/* 0000A4F0 C01C0098 */ lfs f0, 0x98(r28)
/* 0000A4F4 D0010030 */ stfs f0, 0x30(r1)
/* 0000A4F8 D001002C */ stfs f0, 0x2c(r1)
/* 0000A4FC C01C0054 */ lfs f0, 0x54(r28)
/* 0000A500 D0010038 */ stfs f0, 0x38(r1)
/* 0000A504 D0010034 */ stfs f0, 0x34(r1)
/* 0000A508 92E1003C */ stw r23, 0x3c(r1)
/* 0000A50C 90A10044 */ stw r5, 0x44(r1)
/* 0000A510 90810048 */ stw r4, 0x48(r1)
/* 0000A514 C01C0054 */ lfs f0, 0x54(r28)
/* 0000A518 D0010040 */ stfs f0, 0x40(r1)
/* 0000A51C 92C1004C */ stw r22, 0x4c(r1)
/* 0000A520 92E10050 */ stw r23, 0x50(r1)
/* 0000A524 C01C02A8 */ lfs f0, 0x2a8(r28)
/* 0000A528 D0010024 */ stfs f0, 0x24(r1)
/* 0000A52C C01C02AC */ lfs f0, 0x2ac(r28)
/* 0000A530 D0010028 */ stfs f0, 0x28(r1)
/* 0000A534 90010014 */ stw r0, 0x14(r1)
/* 0000A538 C03C02A0 */ lfs f1, 0x2a0(r28)
/* 0000A53C C81C02B0 */ lfd f0, 0x2b0(r28)
/* 0000A540 FC010028 */ fsub f0, f1, f0
/* 0000A544 FC000018 */ frsp f0, f0
/* 0000A548 D0010018 */ stfs f0, 0x18(r1)
/* 0000A54C C03C02A4 */ lfs f1, 0x2a4(r28)
/* 0000A550 C81C0088 */ lfd f0, 0x88(r28)
/* 0000A554 FC010028 */ fsub f0, f1, f0
/* 0000A558 FC000018 */ frsp f0, f0
/* 0000A55C D001001C */ stfs f0, 0x1c(r1)
/* 0000A560 C01C00F0 */ lfs f0, 0xf0(r28)
/* 0000A564 D0010020 */ stfs f0, 0x20(r1)
/* 0000A568 4BFF5BE5 */ bl draw_naomi_sprite
/* 0000A56C 4BFF5BE1 */ bl reset_text_draw_settings
/* 0000A570 386000B1 */ li r3, 0xb1
/* 0000A574 4BFF5BD9 */ bl set_text_font
/* 0000A578 3C600020 */ lis r3, 0x20
/* 0000A57C 4BFF5BD1 */ bl func_80071B50
/* 0000A580 FC20F890 */ fmr f1, f31
/* 0000A584 7EC3B378 */ mr r3, r22
/* 0000A588 FC40F090 */ fmr f2, f30
/* 0000A58C 38BB0164 */ addi r5, r27, 0x164
/* 0000A590 4CC63242 */ crset 6
/* 0000A594 38800000 */ li r4, 0
/* 0000A598 480007D5 */ bl lbl_0000AD6C
/* 0000A59C C81C02C0 */ lfd f0, 0x2c0(r28)
/* 0000A5A0 FC40F090 */ fmr f2, f30
/* 0000A5A4 C83C02B8 */ lfd f1, 0x2b8(r28)
/* 0000A5A8 7EC3B378 */ mr r3, r22
/* 0000A5AC FC00F82A */ fadd f0, f0, f31
/* 0000A5B0 38BB016C */ addi r5, r27, 0x16c
/* 0000A5B4 4CC63242 */ crset 6
/* 0000A5B8 38800000 */ li r4, 0
/* 0000A5BC FC21002A */ fadd f1, f1, f0
/* 0000A5C0 FC200818 */ frsp f1, f1
/* 0000A5C4 480007A9 */ bl lbl_0000AD6C
/* 0000A5C8 C87C02B8 */ lfd f3, 0x2b8(r28)
/* 0000A5CC 3AA00002 */ li r21, 2
/* 0000A5D0 C05C02A0 */ lfs f2, 0x2a0(r28)
/* 0000A5D4 38610014 */ addi r3, r1, 0x14
/* 0000A5D8 C83C0088 */ lfd f1, 0x88(r28)
/* 0000A5DC C01C0098 */ lfs f0, 0x98(r28)
/* 0000A5E0 FC43102A */ fadd f2, f3, f2
/* 0000A5E4 D001002C */ stfs f0, 0x2c(r1)
/* 0000A5E8 FF620828 */ fsub f27, f2, f1
/* 0000A5EC C01C0098 */ lfs f0, 0x98(r28)
/* 0000A5F0 D0010030 */ stfs f0, 0x30(r1)
/* 0000A5F4 FF60D818 */ frsp f27, f27
/* 0000A5F8 C01C02C8 */ lfs f0, 0x2c8(r28)
/* 0000A5FC D0010034 */ stfs f0, 0x34(r1)
/* 0000A600 C01C0018 */ lfs f0, 0x18(r28)
/* 0000A604 D0010038 */ stfs f0, 0x38(r1)
/* 0000A608 C01C02C8 */ lfs f0, 0x2c8(r28)
/* 0000A60C D0010024 */ stfs f0, 0x24(r1)
/* 0000A610 C01C0018 */ lfs f0, 0x18(r28)
/* 0000A614 D0010028 */ stfs f0, 0x28(r1)
/* 0000A618 92E1004C */ stw r23, 0x4c(r1)
/* 0000A61C 92A10014 */ stw r21, 0x14(r1)
/* 0000A620 C81C0130 */ lfd f0, 0x130(r28)
/* 0000A624 FC00D82A */ fadd f0, f0, f27
/* 0000A628 FC000018 */ frsp f0, f0
/* 0000A62C D0010018 */ stfs f0, 0x18(r1)
/* 0000A630 C83C0130 */ lfd f1, 0x130(r28)
/* 0000A634 C01C02A4 */ lfs f0, 0x2a4(r28)
/* 0000A638 FC01002A */ fadd f0, f1, f0
/* 0000A63C FC000018 */ frsp f0, f0
/* 0000A640 D001001C */ stfs f0, 0x1c(r1)
/* 0000A644 C01C0008 */ lfs f0, 8(r28)
/* 0000A648 D0010020 */ stfs f0, 0x20(r1)
/* 0000A64C 4BFF5B01 */ bl draw_naomi_sprite
/* 0000A650 92C1004C */ stw r22, 0x4c(r1)
/* 0000A654 38610014 */ addi r3, r1, 0x14
/* 0000A658 92A10014 */ stw r21, 0x14(r1)
/* 0000A65C D3610018 */ stfs f27, 0x18(r1)
/* 0000A660 C01C02A4 */ lfs f0, 0x2a4(r28)
/* 0000A664 D001001C */ stfs f0, 0x1c(r1)
/* 0000A668 C01C009C */ lfs f0, 0x9c(r28)
/* 0000A66C D0010020 */ stfs f0, 0x20(r1)
/* 0000A670 4BFF5ADD */ bl draw_naomi_sprite
lbl_0000A674:
/* 0000A674 BA61006C */ lmw r19, 0x6c(r1)
/* 0000A678 800100CC */ lwz r0, 0xcc(r1)
/* 0000A67C CBE100C0 */ lfd f31, 0xc0(r1)
/* 0000A680 CBC100B8 */ lfd f30, 0xb8(r1)
/* 0000A684 7C0803A6 */ mtlr r0
/* 0000A688 CBA100B0 */ lfd f29, 0xb0(r1)
/* 0000A68C CB8100A8 */ lfd f28, 0xa8(r1)
/* 0000A690 CB6100A0 */ lfd f27, 0xa0(r1)
/* 0000A694 382100C8 */ addi r1, r1, 0xc8
/* 0000A698 4E800020 */ blr 
lbl_0000A69C:
/* 0000A69C 7C0802A6 */ mflr r0
/* 0000A6A0 90010004 */ stw r0, 4(r1)
/* 0000A6A4 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000A6A8 BF61001C */ stmw r27, 0x1c(r1)
/* 0000A6AC 4BFF5AA1 */ bl create_sprite
/* 0000A6B0 28030000 */ cmplwi r3, 0
/* 0000A6B4 41820010 */ beq lbl_0000A6C4
/* 0000A6B8 3C800000 */ lis r4, lbl_0000A754@ha
/* 0000A6BC 38040000 */ addi r0, r4, lbl_0000A754@l
/* 0000A6C0 90030038 */ stw r0, 0x38(r3)
lbl_0000A6C4:
/* 0000A6C4 3B600000 */ li r27, 0
/* 0000A6C8 3C800000 */ lis r4, lbl_10000044@ha
/* 0000A6CC 3C600000 */ lis r3, lbl_100000A8@ha
/* 0000A6D0 3B830000 */ addi r28, r3, lbl_100000A8@l
/* 0000A6D4 3C600000 */ lis r3, lbl_0000C430@ha
/* 0000A6D8 5765103A */ slwi r5, r27, 2
/* 0000A6DC 38040000 */ addi r0, r4, lbl_10000044@l
/* 0000A6E0 7FA02A14 */ add r29, r0, r5
/* 0000A6E4 3BE30000 */ addi r31, r3, lbl_0000C430@l
/* 0000A6E8 3FC04330 */ lis r30, 0x4330
lbl_0000A6EC:
/* 0000A6EC 801D0000 */ lwz r0, 0(r29)
/* 0000A6F0 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 0000A6F4 C8230000 */ lfd f1, lbl_0000C3C0@l(r3)
/* 0000A6F8 6C008000 */ xoris r0, r0, 0x8000
/* 0000A6FC 90010014 */ stw r0, 0x14(r1)
/* 0000A700 93C10010 */ stw r30, 0x10(r1)
/* 0000A704 C8010010 */ lfd f0, 0x10(r1)
/* 0000A708 EC200828 */ fsubs f1, f0, f1
/* 0000A70C 4BFF5A41 */ bl mathutil_sqrt
/* 0000A710 C81F0000 */ lfd f0, 0(r31)
/* 0000A714 3B7B0001 */ addi r27, r27, 1
/* 0000A718 2C1B0004 */ cmpwi r27, 4
/* 0000A71C FC000072 */ fmul f0, f0, f1
/* 0000A720 3BBD0004 */ addi r29, r29, 4
/* 0000A724 FC00001E */ fctiwz f0, f0
/* 0000A728 D8010008 */ stfd f0, 8(r1)
/* 0000A72C 8061000C */ lwz r3, 0xc(r1)
/* 0000A730 3803005A */ addi r0, r3, 0x5a
/* 0000A734 B01C0000 */ sth r0, 0(r28)
/* 0000A738 3B9C0002 */ addi r28, r28, 2
/* 0000A73C 4180FFB0 */ blt lbl_0000A6EC
/* 0000A740 BB61001C */ lmw r27, 0x1c(r1)
/* 0000A744 80010034 */ lwz r0, 0x34(r1)
/* 0000A748 38210030 */ addi r1, r1, 0x30
/* 0000A74C 7C0803A6 */ mtlr r0
/* 0000A750 4E800020 */ blr 
lbl_0000A754:
/* 0000A754 7C0802A6 */ mflr r0
/* 0000A758 3CA00000 */ lis r5, lbl_10000044@ha
/* 0000A75C 90010004 */ stw r0, 4(r1)
/* 0000A760 3C800000 */ lis r4, lbl_10000098@ha
/* 0000A764 3C600000 */ lis r3, lbl_0000C360@ha
/* 0000A768 9421FF40 */ stwu r1, -0xc0(r1)
/* 0000A76C 38A50000 */ addi r5, r5, lbl_10000044@l
/* 0000A770 38840000 */ addi r4, r4, lbl_10000098@l
/* 0000A774 DBE100B8 */ stfd f31, 0xb8(r1)
/* 0000A778 39200000 */ li r9, 0
/* 0000A77C DBC100B0 */ stfd f30, 0xb0(r1)
/* 0000A780 BE210074 */ stmw r17, 0x74(r1)
/* 0000A784 3B030000 */ addi r24, r3, lbl_0000C360@l
/* 0000A788 3C600000 */ lis r3, lbl_100000A8@ha
/* 0000A78C 38E30000 */ addi r7, r3, lbl_100000A8@l
/* 0000A790 3C600000 */ lis r3, lbl_0000D218@ha
/* 0000A794 3AE30000 */ addi r23, r3, lbl_0000D218@l
/* 0000A798 801802CC */ lwz r0, 0x2cc(r24)
/* 0000A79C 80D802D0 */ lwz r6, 0x2d0(r24)
/* 0000A7A0 9001000C */ stw r0, 0xc(r1)
/* 0000A7A4 38000002 */ li r0, 2
/* 0000A7A8 7C0903A6 */ mtctr r0
/* 0000A7AC 90C10010 */ stw r6, 0x10(r1)
lbl_0000A7B0:
/* 0000A7B0 80C40000 */ lwz r6, 0(r4)
/* 0000A7B4 80650000 */ lwz r3, 0(r5)
/* 0000A7B8 7C061800 */ cmpw r6, r3
/* 0000A7BC 40800050 */ bge lbl_0000A80C
/* 0000A7C0 A8070000 */ lha r0, 0(r7)
/* 0000A7C4 7D0303D6 */ divw r8, r3, r0
/* 0000A7C8 7C083214 */ add r0, r8, r6
/* 0000A7CC 7C001800 */ cmpw r0, r3
/* 0000A7D0 4081000C */ ble lbl_0000A7DC
/* 0000A7D4 7D061850 */ subf r8, r6, r3
/* 0000A7D8 48000010 */ b lbl_0000A7E8
lbl_0000A7DC:
/* 0000A7DC 2C080001 */ cmpwi r8, 1
/* 0000A7E0 40800008 */ bge lbl_0000A7E8
/* 0000A7E4 39000001 */ li r8, 1
lbl_0000A7E8:
/* 0000A7E8 80040000 */ lwz r0, 0(r4)
/* 0000A7EC 7C004214 */ add r0, r0, r8
/* 0000A7F0 90040000 */ stw r0, 0(r4)
/* 0000A7F4 A8670000 */ lha r3, 0(r7)
/* 0000A7F8 2C030000 */ cmpwi r3, 0
/* 0000A7FC 40810018 */ ble lbl_0000A814
/* 0000A800 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000A804 B0070000 */ sth r0, 0(r7)
/* 0000A808 4800000C */ b lbl_0000A814
lbl_0000A80C:
/* 0000A80C 38000000 */ li r0, 0
/* 0000A810 B0070000 */ sth r0, 0(r7)
lbl_0000A814:
/* 0000A814 80C40004 */ lwz r6, 4(r4)
/* 0000A818 38840004 */ addi r4, r4, 4
/* 0000A81C 84650004 */ lwzu r3, 4(r5)
/* 0000A820 38E70002 */ addi r7, r7, 2
/* 0000A824 7C061800 */ cmpw r6, r3
/* 0000A828 40800050 */ bge lbl_0000A878
/* 0000A82C A8070000 */ lha r0, 0(r7)
/* 0000A830 7D0303D6 */ divw r8, r3, r0
/* 0000A834 7C083214 */ add r0, r8, r6
/* 0000A838 7C001800 */ cmpw r0, r3
/* 0000A83C 4081000C */ ble lbl_0000A848
/* 0000A840 7D061850 */ subf r8, r6, r3
/* 0000A844 48000010 */ b lbl_0000A854
lbl_0000A848:
/* 0000A848 2C080001 */ cmpwi r8, 1
/* 0000A84C 40800008 */ bge lbl_0000A854
/* 0000A850 39000001 */ li r8, 1
lbl_0000A854:
/* 0000A854 80040000 */ lwz r0, 0(r4)
/* 0000A858 7C004214 */ add r0, r0, r8
/* 0000A85C 90040000 */ stw r0, 0(r4)
/* 0000A860 A8670000 */ lha r3, 0(r7)
/* 0000A864 2C030000 */ cmpwi r3, 0
/* 0000A868 40810018 */ ble lbl_0000A880
/* 0000A86C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000A870 B0070000 */ sth r0, 0(r7)
/* 0000A874 4800000C */ b lbl_0000A880
lbl_0000A878:
/* 0000A878 38000000 */ li r0, 0
/* 0000A87C B0070000 */ sth r0, 0(r7)
lbl_0000A880:
/* 0000A880 38A50004 */ addi r5, r5, 4
/* 0000A884 38840004 */ addi r4, r4, 4
/* 0000A888 38E70002 */ addi r7, r7, 2
/* 0000A88C 39290001 */ addi r9, r9, 1
/* 0000A890 4200FF20 */ bdnz lbl_0000A7B0
/* 0000A894 C0180054 */ lfs f0, 0x54(r24)
/* 0000A898 3C600100 */ lis r3, 0x100
/* 0000A89C 3883FFFF */ addi r4, r3, -1  ;# fixed addi
/* 0000A8A0 D0010024 */ stfs f0, 0x24(r1)
/* 0000A8A4 38E00000 */ li r7, 0
/* 0000A8A8 38C0FFFF */ li r6, -1
/* 0000A8AC C0180054 */ lfs f0, 0x54(r24)
/* 0000A8B0 38A00005 */ li r5, 5
/* 0000A8B4 38000B31 */ li r0, 0xb31
/* 0000A8B8 D0010028 */ stfs f0, 0x28(r1)
/* 0000A8BC 38610014 */ addi r3, r1, 0x14
/* 0000A8C0 C0180098 */ lfs f0, 0x98(r24)
/* 0000A8C4 D0010030 */ stfs f0, 0x30(r1)
/* 0000A8C8 D001002C */ stfs f0, 0x2c(r1)
/* 0000A8CC C0180054 */ lfs f0, 0x54(r24)
/* 0000A8D0 D0010038 */ stfs f0, 0x38(r1)
/* 0000A8D4 D0010034 */ stfs f0, 0x34(r1)
/* 0000A8D8 90E1003C */ stw r7, 0x3c(r1)
/* 0000A8DC 90C10044 */ stw r6, 0x44(r1)
/* 0000A8E0 90A10048 */ stw r5, 0x48(r1)
/* 0000A8E4 C0180054 */ lfs f0, 0x54(r24)
/* 0000A8E8 D0010040 */ stfs f0, 0x40(r1)
/* 0000A8EC 9081004C */ stw r4, 0x4c(r1)
/* 0000A8F0 90E10050 */ stw r7, 0x50(r1)
/* 0000A8F4 C01802D4 */ lfs f0, 0x2d4(r24)
/* 0000A8F8 D0010024 */ stfs f0, 0x24(r1)
/* 0000A8FC C01802D8 */ lfs f0, 0x2d8(r24)
/* 0000A900 D0010028 */ stfs f0, 0x28(r1)
/* 0000A904 90010014 */ stw r0, 0x14(r1)
/* 0000A908 C0180098 */ lfs f0, 0x98(r24)
/* 0000A90C D0010018 */ stfs f0, 0x18(r1)
/* 0000A910 C01802DC */ lfs f0, 0x2dc(r24)
/* 0000A914 D001001C */ stfs f0, 0x1c(r1)
/* 0000A918 C0180008 */ lfs f0, 8(r24)
/* 0000A91C D0010020 */ stfs f0, 0x20(r1)
/* 0000A920 4BFF582D */ bl draw_naomi_sprite
/* 0000A924 C0180054 */ lfs f0, 0x54(r24)
/* 0000A928 38000B32 */ li r0, 0xb32
/* 0000A92C 38610014 */ addi r3, r1, 0x14
/* 0000A930 D0010024 */ stfs f0, 0x24(r1)
/* 0000A934 C0180054 */ lfs f0, 0x54(r24)
/* 0000A938 D0010028 */ stfs f0, 0x28(r1)
/* 0000A93C 90010014 */ stw r0, 0x14(r1)
/* 0000A940 C01802E0 */ lfs f0, 0x2e0(r24)
/* 0000A944 D0010018 */ stfs f0, 0x18(r1)
/* 0000A948 C01802E4 */ lfs f0, 0x2e4(r24)
/* 0000A94C D001001C */ stfs f0, 0x1c(r1)
/* 0000A950 C018009C */ lfs f0, 0x9c(r24)
/* 0000A954 D0010020 */ stfs f0, 0x20(r1)
/* 0000A958 4BFF57F5 */ bl draw_naomi_sprite
/* 0000A95C 38000B33 */ li r0, 0xb33
/* 0000A960 90010014 */ stw r0, 0x14(r1)
/* 0000A964 38610014 */ addi r3, r1, 0x14
/* 0000A968 C01802E8 */ lfs f0, 0x2e8(r24)
/* 0000A96C D0010018 */ stfs f0, 0x18(r1)
/* 0000A970 C01802EC */ lfs f0, 0x2ec(r24)
/* 0000A974 D001001C */ stfs f0, 0x1c(r1)
/* 0000A978 C018009C */ lfs f0, 0x9c(r24)
/* 0000A97C D0010020 */ stfs f0, 0x20(r1)
/* 0000A980 4BFF57CD */ bl draw_naomi_sprite
/* 0000A984 4BFF57C9 */ bl reset_text_draw_settings
/* 0000A988 38600059 */ li r3, 0x59
/* 0000A98C 4BFF57C1 */ bl set_text_font
/* 0000A990 3C600000 */ lis r3, lbl_10000064@ha
/* 0000A994 A8030000 */ lha r0, lbl_10000064@l(r3)
/* 0000A998 2C00000A */ cmpwi r0, 0xa
/* 0000A99C 4182004C */ beq lbl_0000A9E8
/* 0000A9A0 40800010 */ bge lbl_0000A9B0
/* 0000A9A4 2C000005 */ cmpwi r0, 5
/* 0000A9A8 41820014 */ beq lbl_0000A9BC
/* 0000A9AC 48000090 */ b lbl_0000AA3C
lbl_0000A9B0:
/* 0000A9B0 2C00000F */ cmpwi r0, 0xf
/* 0000A9B4 41820060 */ beq lbl_0000AA14
/* 0000A9B8 48000084 */ b lbl_0000AA3C
lbl_0000A9BC:
/* 0000A9BC C03802F0 */ lfs f1, 0x2f0(r24)
/* 0000A9C0 C05802EC */ lfs f2, 0x2ec(r24)
/* 0000A9C4 4BFF5789 */ bl set_text_pos
/* 0000A9C8 38770174 */ addi r3, r23, 0x174
/* 0000A9CC 4BFF5781 */ bl u_draw_text
/* 0000A9D0 C03802F4 */ lfs f1, 0x2f4(r24)
/* 0000A9D4 C05802EC */ lfs f2, 0x2ec(r24)
/* 0000A9D8 4BFF5775 */ bl set_text_pos
/* 0000A9DC 38770178 */ addi r3, r23, 0x178
/* 0000A9E0 4BFF576D */ bl u_draw_text
/* 0000A9E4 48000058 */ b lbl_0000AA3C
lbl_0000A9E8:
/* 0000A9E8 C03802F8 */ lfs f1, 0x2f8(r24)
/* 0000A9EC C05802EC */ lfs f2, 0x2ec(r24)
/* 0000A9F0 4BFF575D */ bl set_text_pos
/* 0000A9F4 38770174 */ addi r3, r23, 0x174
/* 0000A9F8 4BFF5755 */ bl u_draw_text
/* 0000A9FC C03802FC */ lfs f1, 0x2fc(r24)
/* 0000AA00 C05802EC */ lfs f2, 0x2ec(r24)
/* 0000AA04 4BFF5749 */ bl set_text_pos
/* 0000AA08 3877017C */ addi r3, r23, 0x17c
/* 0000AA0C 4BFF5741 */ bl u_draw_text
/* 0000AA10 4800002C */ b lbl_0000AA3C
lbl_0000AA14:
/* 0000AA14 C03802F8 */ lfs f1, 0x2f8(r24)
/* 0000AA18 C05802EC */ lfs f2, 0x2ec(r24)
/* 0000AA1C 4BFF5731 */ bl set_text_pos
/* 0000AA20 38770174 */ addi r3, r23, 0x174
/* 0000AA24 4BFF5729 */ bl u_draw_text
/* 0000AA28 C03802FC */ lfs f1, 0x2fc(r24)
/* 0000AA2C C05802EC */ lfs f2, 0x2ec(r24)
/* 0000AA30 4BFF571D */ bl set_text_pos
/* 0000AA34 38770180 */ addi r3, r23, 0x180
/* 0000AA38 4BFF5715 */ bl u_draw_text
lbl_0000AA3C:
/* 0000AA3C 3C600000 */ lis r3, modeCtrl@ha
/* 0000AA40 38630000 */ addi r3, r3, modeCtrl@l
/* 0000AA44 80030024 */ lwz r0, 0x24(r3)
/* 0000AA48 2C000001 */ cmpwi r0, 1
/* 0000AA4C 4181000C */ bgt lbl_0000AA58
/* 0000AA50 C3F80068 */ lfs f31, 0x68(r24)
/* 0000AA54 48000008 */ b lbl_0000AA5C
lbl_0000AA58:
/* 0000AA58 C3F802D4 */ lfs f31, 0x2d4(r24)
lbl_0000AA5C:
/* 0000AA5C 2C000002 */ cmpwi r0, 2
/* 0000AA60 4181000C */ bgt lbl_0000AA6C
/* 0000AA64 C3D80300 */ lfs f30, 0x300(r24)
/* 0000AA68 48000008 */ b lbl_0000AA70
lbl_0000AA6C:
/* 0000AA6C C3D80304 */ lfs f30, 0x304(r24)
lbl_0000AA70:
/* 0000AA70 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000AA74 3B230000 */ addi r25, r3, unpausedFrameCounter@l
/* 0000AA78 80190000 */ lwz r0, 0(r25)
/* 0000AA7C 3A600000 */ li r19, 0
/* 0000AA80 3C60AAAB */ lis r3, 0xaaab
/* 0000AA84 540AE8FE */ srwi r10, r0, 3
/* 0000AA88 3803AAAB */ addi r0, r3, -21845  ;# fixed addi
/* 0000AA8C 7C005016 */ mulhwu r0, r0, r10
/* 0000AA90 5400F0BE */ srwi r0, r0, 2
/* 0000AA94 1D200006 */ mulli r9, r0, 6
/* 0000AA98 3CE00000 */ lis r7, lbl_10000098@ha
/* 0000AA9C 3C600000 */ lis r3, playerCharacterSelection@ha
/* 0000AAA0 3AA30000 */ addi r21, r3, playerCharacterSelection@l
/* 0000AAA4 3CA00100 */ lis r5, 0x100
/* 0000AAA8 3C800000 */ lis r4, lbl_80118AC8@ha
/* 0000AAAC 3C60005C */ lis r3, 0x5c
/* 0000AAB0 3CC00000 */ lis r6, g_poolInfo@ha
/* 0000AAB4 5668103A */ slwi r8, r19, 2
/* 0000AAB8 38070000 */ addi r0, r7, lbl_10000098@l
/* 0000AABC 7E804214 */ add r20, r0, r8
/* 0000AAC0 7E495050 */ subf r18, r9, r10
/* 0000AAC4 3AC1000C */ addi r22, r1, 0xc
/* 0000AAC8 3BC5FFFF */ addi r30, r5, -1  ;# fixed addi
/* 0000AACC 3BE40000 */ addi r31, r4, lbl_80118AC8@l
/* 0000AAD0 3A233B1B */ addi r17, r3, 0x3b1b
/* 0000AAD4 3B460000 */ addi r26, r6, g_poolInfo@l
lbl_0000AAD8:
/* 0000AAD8 2C130002 */ cmpwi r19, 2
/* 0000AADC 41820028 */ beq lbl_0000AB04
/* 0000AAE0 40800010 */ bge lbl_0000AAF0
/* 0000AAE4 2C130001 */ cmpwi r19, 1
/* 0000AAE8 40800010 */ bge lbl_0000AAF8
/* 0000AAEC 48000028 */ b lbl_0000AB14
lbl_0000AAF0:
/* 0000AAF0 2C130004 */ cmpwi r19, 4
/* 0000AAF4 40800020 */ bge lbl_0000AB14
lbl_0000AAF8:
/* 0000AAF8 C0180260 */ lfs f0, 0x260(r24)
/* 0000AAFC EFFF002A */ fadds f31, f31, f0
/* 0000AB00 48000014 */ b lbl_0000AB14
lbl_0000AB04:
/* 0000AB04 C0380260 */ lfs f1, 0x260(r24)
/* 0000AB08 C0180308 */ lfs f0, 0x308(r24)
/* 0000AB0C EFFF0828 */ fsubs f31, f31, f1
/* 0000AB10 EFDE002A */ fadds f30, f30, f0
lbl_0000AB14:
/* 0000AB14 807A000C */ lwz r3, 0xc(r26)
/* 0000AB18 7C0398AE */ lbzx r0, r3, r19
/* 0000AB1C 7C000775 */ extsb. r0, r0
/* 0000AB20 41820218 */ beq lbl_0000AD38
/* 0000AB24 C0180054 */ lfs f0, 0x54(r24)
/* 0000AB28 3B600000 */ li r27, 0
/* 0000AB2C 3B80FFFF */ li r28, -1
/* 0000AB30 D0010024 */ stfs f0, 0x24(r1)
/* 0000AB34 3BA00005 */ li r29, 5
/* 0000AB38 38610014 */ addi r3, r1, 0x14
/* 0000AB3C C0180054 */ lfs f0, 0x54(r24)
/* 0000AB40 D0010028 */ stfs f0, 0x28(r1)
/* 0000AB44 C0180098 */ lfs f0, 0x98(r24)
/* 0000AB48 D0010030 */ stfs f0, 0x30(r1)
/* 0000AB4C D001002C */ stfs f0, 0x2c(r1)
/* 0000AB50 C0180054 */ lfs f0, 0x54(r24)
/* 0000AB54 D0010038 */ stfs f0, 0x38(r1)
/* 0000AB58 D0010034 */ stfs f0, 0x34(r1)
/* 0000AB5C 9361003C */ stw r27, 0x3c(r1)
/* 0000AB60 93810044 */ stw r28, 0x44(r1)
/* 0000AB64 93A10048 */ stw r29, 0x48(r1)
/* 0000AB68 C0180054 */ lfs f0, 0x54(r24)
/* 0000AB6C D0010040 */ stfs f0, 0x40(r1)
/* 0000AB70 93C1004C */ stw r30, 0x4c(r1)
/* 0000AB74 93610050 */ stw r27, 0x50(r1)
/* 0000AB78 A8160000 */ lha r0, 0(r22)
/* 0000AB7C 90010014 */ stw r0, 0x14(r1)
/* 0000AB80 D3E10018 */ stfs f31, 0x18(r1)
/* 0000AB84 D3C1001C */ stfs f30, 0x1c(r1)
/* 0000AB88 C0180008 */ lfs f0, 8(r24)
/* 0000AB8C D0010020 */ stfs f0, 0x20(r1)
/* 0000AB90 4BFF55BD */ bl draw_naomi_sprite
/* 0000AB94 38000B1A */ li r0, 0xb1a
/* 0000AB98 90010014 */ stw r0, 0x14(r1)
/* 0000AB9C 38610014 */ addi r3, r1, 0x14
/* 0000ABA0 C0180308 */ lfs f0, 0x308(r24)
/* 0000ABA4 EC00F82A */ fadds f0, f0, f31
/* 0000ABA8 D0010018 */ stfs f0, 0x18(r1)
/* 0000ABAC D3C1001C */ stfs f30, 0x1c(r1)
/* 0000ABB0 C0180008 */ lfs f0, 8(r24)
/* 0000ABB4 D0010020 */ stfs f0, 0x20(r1)
/* 0000ABB8 4BFF5595 */ bl draw_naomi_sprite
/* 0000ABBC C0180018 */ lfs f0, 0x18(r24)
/* 0000ABC0 D0010024 */ stfs f0, 0x24(r1)
/* 0000ABC4 C018001C */ lfs f0, 0x1c(r24)
/* 0000ABC8 D0010028 */ stfs f0, 0x28(r1)
/* 0000ABCC 80190000 */ lwz r0, 0(r25)
/* 0000ABD0 1C600190 */ mulli r3, r0, 0x190
/* 0000ABD4 38634000 */ addi r3, r3, 0x4000
/* 0000ABD8 4BFF5575 */ bl mathutil_sin
/* 0000ABDC C018030C */ lfs f0, 0x30c(r24)
/* 0000ABE0 3800000A */ li r0, 0xa
/* 0000ABE4 38610014 */ addi r3, r1, 0x14
/* 0000ABE8 EC000072 */ fmuls f0, f0, f1
/* 0000ABEC FC00001E */ fctiwz f0, f0
/* 0000ABF0 D8010068 */ stfd f0, 0x68(r1)
/* 0000ABF4 8081006C */ lwz r4, 0x6c(r1)
/* 0000ABF8 9081003C */ stw r4, 0x3c(r1)
/* 0000ABFC 90010048 */ stw r0, 0x48(r1)
/* 0000AC00 80150000 */ lwz r0, 0(r21)
/* 0000AC04 1C000006 */ mulli r0, r0, 6
/* 0000AC08 7C120214 */ add r0, r18, r0
/* 0000AC0C 5400103A */ slwi r0, r0, 2
/* 0000AC10 7C9F0214 */ add r4, r31, r0
/* 0000AC14 80040000 */ lwz r0, 0(r4)
/* 0000AC18 90010014 */ stw r0, 0x14(r1)
/* 0000AC1C C0180310 */ lfs f0, 0x310(r24)
/* 0000AC20 EC00F82A */ fadds f0, f0, f31
/* 0000AC24 D0010018 */ stfs f0, 0x18(r1)
/* 0000AC28 C0180314 */ lfs f0, 0x314(r24)
/* 0000AC2C EC00F02A */ fadds f0, f0, f30
/* 0000AC30 D001001C */ stfs f0, 0x1c(r1)
/* 0000AC34 C018009C */ lfs f0, 0x9c(r24)
/* 0000AC38 D0010020 */ stfs f0, 0x20(r1)
/* 0000AC3C 4BFF5511 */ bl draw_naomi_sprite
/* 0000AC40 4BFF550D */ bl reset_text_draw_settings
/* 0000AC44 C038009C */ lfs f1, 0x9c(r24)
/* 0000AC48 4BFF5505 */ bl func_80071B1C
/* 0000AC4C 38600052 */ li r3, 0x52
/* 0000AC50 4BFF54FD */ bl set_text_font
/* 0000AC54 C0380318 */ lfs f1, 0x318(r24)
/* 0000AC58 C018031C */ lfs f0, 0x31c(r24)
/* 0000AC5C EC21F82A */ fadds f1, f1, f31
/* 0000AC60 EC40F02A */ fadds f2, f0, f30
/* 0000AC64 4BFF54E9 */ bl set_text_pos
/* 0000AC68 38930000 */ addi r4, r19, 0
/* 0000AC6C 4CC63182 */ crclr 6
/* 0000AC70 38770108 */ addi r3, r23, 0x108
/* 0000AC74 4BFF54D9 */ bl func_80072AC0
/* 0000AC78 C0180054 */ lfs f0, 0x54(r24)
/* 0000AC7C 38000B09 */ li r0, 0xb09
/* 0000AC80 38610014 */ addi r3, r1, 0x14
/* 0000AC84 D0010024 */ stfs f0, 0x24(r1)
/* 0000AC88 C0180054 */ lfs f0, 0x54(r24)
/* 0000AC8C D0010028 */ stfs f0, 0x28(r1)
/* 0000AC90 C0180098 */ lfs f0, 0x98(r24)
/* 0000AC94 D0010030 */ stfs f0, 0x30(r1)
/* 0000AC98 D001002C */ stfs f0, 0x2c(r1)
/* 0000AC9C C0180054 */ lfs f0, 0x54(r24)
/* 0000ACA0 D0010038 */ stfs f0, 0x38(r1)
/* 0000ACA4 D0010034 */ stfs f0, 0x34(r1)
/* 0000ACA8 9361003C */ stw r27, 0x3c(r1)
/* 0000ACAC 93810044 */ stw r28, 0x44(r1)
/* 0000ACB0 93A10048 */ stw r29, 0x48(r1)
/* 0000ACB4 C0180054 */ lfs f0, 0x54(r24)
/* 0000ACB8 D0010040 */ stfs f0, 0x40(r1)
/* 0000ACBC 93C1004C */ stw r30, 0x4c(r1)
/* 0000ACC0 93610050 */ stw r27, 0x50(r1)
/* 0000ACC4 9361004C */ stw r27, 0x4c(r1)
/* 0000ACC8 92210050 */ stw r17, 0x50(r1)
/* 0000ACCC 90010014 */ stw r0, 0x14(r1)
/* 0000ACD0 C0180320 */ lfs f0, 0x320(r24)
/* 0000ACD4 EC00F82A */ fadds f0, f0, f31
/* 0000ACD8 D0010018 */ stfs f0, 0x18(r1)
/* 0000ACDC C0180324 */ lfs f0, 0x324(r24)
/* 0000ACE0 EC00F02A */ fadds f0, f0, f30
/* 0000ACE4 D001001C */ stfs f0, 0x1c(r1)
/* 0000ACE8 C018009C */ lfs f0, 0x9c(r24)
/* 0000ACEC D0010020 */ stfs f0, 0x20(r1)
/* 0000ACF0 4BFF545D */ bl draw_naomi_sprite
/* 0000ACF4 38600053 */ li r3, 0x53
/* 0000ACF8 4BFF5455 */ bl set_text_font
/* 0000ACFC 3C60FF00 */ lis r3, 0xff00
/* 0000AD00 4BFF544D */ bl set_text_mul_color
/* 0000AD04 80610050 */ lwz r3, 0x50(r1)
/* 0000AD08 4BFF5445 */ bl set_text_add_color
/* 0000AD0C C8380240 */ lfd f1, 0x240(r24)
/* 0000AD10 C8180328 */ lfd f0, 0x328(r24)
/* 0000AD14 FC21F82A */ fadd f1, f1, f31
/* 0000AD18 FC40F02A */ fadd f2, f0, f30
/* 0000AD1C FC200818 */ frsp f1, f1
/* 0000AD20 FC401018 */ frsp f2, f2
/* 0000AD24 4BFF5429 */ bl set_text_pos
/* 0000AD28 80940000 */ lwz r4, 0(r20)
/* 0000AD2C 38770110 */ addi r3, r23, 0x110
/* 0000AD30 4CC63182 */ crclr 6
/* 0000AD34 4BFF5419 */ bl func_80072AC0
lbl_0000AD38:
/* 0000AD38 3A730001 */ addi r19, r19, 1
/* 0000AD3C 2C130004 */ cmpwi r19, 4
/* 0000AD40 3AD60002 */ addi r22, r22, 2
/* 0000AD44 3AB50004 */ addi r21, r21, 4
/* 0000AD48 3A940004 */ addi r20, r20, 4
/* 0000AD4C 4180FD8C */ blt lbl_0000AAD8
/* 0000AD50 BA210074 */ lmw r17, 0x74(r1)
/* 0000AD54 800100C4 */ lwz r0, 0xc4(r1)
/* 0000AD58 CBE100B8 */ lfd f31, 0xb8(r1)
/* 0000AD5C CBC100B0 */ lfd f30, 0xb0(r1)
/* 0000AD60 7C0803A6 */ mtlr r0
/* 0000AD64 382100C0 */ addi r1, r1, 0xc0
/* 0000AD68 4E800020 */ blr 
lbl_0000AD6C:
/* 0000AD6C 7C0802A6 */ mflr r0
/* 0000AD70 90010004 */ stw r0, 4(r1)
/* 0000AD74 9421FF38 */ stwu r1, -0xc8(r1)
/* 0000AD78 DBE100C0 */ stfd f31, 0xc0(r1)
/* 0000AD7C DBC100B8 */ stfd f30, 0xb8(r1)
/* 0000AD80 93E100B4 */ stw r31, 0xb4(r1)
/* 0000AD84 93C100B0 */ stw r30, 0xb0(r1)
/* 0000AD88 93A100AC */ stw r29, 0xac(r1)
/* 0000AD8C 40860024 */ bne cr1, lbl_0000ADB0
/* 0000AD90 D8210028 */ stfd f1, 0x28(r1)
/* 0000AD94 D8410030 */ stfd f2, 0x30(r1)
/* 0000AD98 D8610038 */ stfd f3, 0x38(r1)
/* 0000AD9C D8810040 */ stfd f4, 0x40(r1)
/* 0000ADA0 D8A10048 */ stfd f5, 0x48(r1)
/* 0000ADA4 D8C10050 */ stfd f6, 0x50(r1)
/* 0000ADA8 D8E10058 */ stfd f7, 0x58(r1)
/* 0000ADAC D9010060 */ stfd f8, 0x60(r1)
lbl_0000ADB0:
/* 0000ADB0 90610008 */ stw r3, 8(r1)
/* 0000ADB4 3BA30000 */ addi r29, r3, 0
/* 0000ADB8 3C000302 */ lis r0, 0x302
/* 0000ADBC FFC00890 */ fmr f30, f1
/* 0000ADC0 9081000C */ stw r4, 0xc(r1)
/* 0000ADC4 3BC40000 */ addi r30, r4, 0
/* 0000ADC8 FFE01090 */ fmr f31, f2
/* 0000ADCC 90A10010 */ stw r5, 0x10(r1)
/* 0000ADD0 38850000 */ addi r4, r5, 0
/* 0000ADD4 90C10014 */ stw r6, 0x14(r1)
/* 0000ADD8 38C1009C */ addi r6, r1, 0x9c
/* 0000ADDC 38A60000 */ addi r5, r6, 0
/* 0000ADE0 90E10018 */ stw r7, 0x18(r1)
/* 0000ADE4 3CE00000 */ lis r7, lbl_0000C360@ha
/* 0000ADE8 3BE70000 */ addi r31, r7, lbl_0000C360@l
/* 0000ADEC 9101001C */ stw r8, 0x1c(r1)
/* 0000ADF0 3861007C */ addi r3, r1, 0x7c
/* 0000ADF4 91210020 */ stw r9, 0x20(r1)
/* 0000ADF8 91410024 */ stw r10, 0x24(r1)
/* 0000ADFC 9001009C */ stw r0, 0x9c(r1)
/* 0000AE00 380100D0 */ addi r0, r1, 0xd0
/* 0000AE04 900100A0 */ stw r0, 0xa0(r1)
/* 0000AE08 38010008 */ addi r0, r1, 8
/* 0000AE0C 900100A4 */ stw r0, 0xa4(r1)
/* 0000AE10 4BFF533D */ bl vsprintf
/* 0000AE14 3C60FF00 */ lis r3, 0xff00
/* 0000AE18 4BFF5335 */ bl set_text_mul_color
/* 0000AE1C C81F00D0 */ lfd f0, 0xd0(r31)
/* 0000AE20 FC20F02A */ fadd f1, f0, f30
/* 0000AE24 FC40F82A */ fadd f2, f0, f31
/* 0000AE28 FC200818 */ frsp f1, f1
/* 0000AE2C FC401018 */ frsp f2, f2
/* 0000AE30 4BFF531D */ bl set_text_pos
/* 0000AE34 C03F0008 */ lfs f1, 8(r31)
/* 0000AE38 4BFF5315 */ bl func_80071B1C
/* 0000AE3C 3861007C */ addi r3, r1, 0x7c
/* 0000AE40 4BFF530D */ bl u_draw_text
/* 0000AE44 7FA3EB78 */ mr r3, r29
/* 0000AE48 4BFF5305 */ bl set_text_mul_color
/* 0000AE4C 7FC3F378 */ mr r3, r30
/* 0000AE50 4BFF52FD */ bl set_text_add_color
/* 0000AE54 FC20F090 */ fmr f1, f30
/* 0000AE58 FC40F890 */ fmr f2, f31
/* 0000AE5C 4BFF52F1 */ bl set_text_pos
/* 0000AE60 C03F009C */ lfs f1, 0x9c(r31)
/* 0000AE64 4BFF52E9 */ bl func_80071B1C
/* 0000AE68 3861007C */ addi r3, r1, 0x7c
/* 0000AE6C 4BFF52E1 */ bl u_draw_text
/* 0000AE70 800100CC */ lwz r0, 0xcc(r1)
/* 0000AE74 CBE100C0 */ lfd f31, 0xc0(r1)
/* 0000AE78 CBC100B8 */ lfd f30, 0xb8(r1)
/* 0000AE7C 7C0803A6 */ mtlr r0
/* 0000AE80 83E100B4 */ lwz r31, 0xb4(r1)
/* 0000AE84 83C100B0 */ lwz r30, 0xb0(r1)
/* 0000AE88 83A100AC */ lwz r29, 0xac(r1)
/* 0000AE8C 382100C8 */ addi r1, r1, 0xc8
/* 0000AE90 4E800020 */ blr 
lbl_0000AE94:
/* 0000AE94 2C030002 */ cmpwi r3, 2
/* 0000AE98 41820038 */ beq lbl_0000AED0
/* 0000AE9C 40800014 */ bge lbl_0000AEB0
/* 0000AEA0 2C030000 */ cmpwi r3, 0
/* 0000AEA4 41820024 */ beq lbl_0000AEC8
/* 0000AEA8 40800018 */ bge lbl_0000AEC0
/* 0000AEAC 4800002C */ b lbl_0000AED8
lbl_0000AEB0:
/* 0000AEB0 2C030004 */ cmpwi r3, 4
/* 0000AEB4 40800024 */ bge lbl_0000AED8
/* 0000AEB8 38600000 */ li r3, 0
/* 0000AEBC 4E800020 */ blr 
lbl_0000AEC0:
/* 0000AEC0 38600001 */ li r3, 1
/* 0000AEC4 4E800020 */ blr 
lbl_0000AEC8:
/* 0000AEC8 38600002 */ li r3, 2
/* 0000AECC 4E800020 */ blr 
lbl_0000AED0:
/* 0000AED0 38600003 */ li r3, 3
/* 0000AED4 4E800020 */ blr 
lbl_0000AED8:
/* 0000AED8 38600000 */ li r3, 0
/* 0000AEDC 4E800020 */ blr 
lbl_0000AEE0:
/* 0000AEE0 A8C30000 */ lha r6, 0(r3)
/* 0000AEE4 3C600000 */ lis r3, lbl_10000044@ha
/* 0000AEE8 A8A40000 */ lha r5, 0(r4)
/* 0000AEEC 38630000 */ addi r3, r3, lbl_10000044@l
/* 0000AEF0 54C4103A */ slwi r4, r6, 2
/* 0000AEF4 54A0103A */ slwi r0, r5, 2
/* 0000AEF8 7C832214 */ add r4, r3, r4
/* 0000AEFC 7C630214 */ add r3, r3, r0
/* 0000AF00 80840000 */ lwz r4, 0(r4)
/* 0000AF04 80030000 */ lwz r0, 0(r3)
/* 0000AF08 7C040000 */ cmpw r4, r0
/* 0000AF0C 4080000C */ bge lbl_0000AF18
/* 0000AF10 38600001 */ li r3, 1
/* 0000AF14 4E800020 */ blr 
lbl_0000AF18:
/* 0000AF18 4081000C */ ble lbl_0000AF24
/* 0000AF1C 3860FFFF */ li r3, -1
/* 0000AF20 4E800020 */ blr 
lbl_0000AF24:
/* 0000AF24 3C600000 */ lis r3, lbl_10000054@ha
/* 0000AF28 54C4083C */ slwi r4, r6, 1
/* 0000AF2C 38630000 */ addi r3, r3, lbl_10000054@l
/* 0000AF30 54A0083C */ slwi r0, r5, 1
/* 0000AF34 7C832214 */ add r4, r3, r4
/* 0000AF38 7C630214 */ add r3, r3, r0
/* 0000AF3C A8840000 */ lha r4, 0(r4)
/* 0000AF40 A8030000 */ lha r0, 0(r3)
/* 0000AF44 7C040000 */ cmpw r4, r0
/* 0000AF48 4080000C */ bge lbl_0000AF54
/* 0000AF4C 3860FFFF */ li r3, -1
/* 0000AF50 4E800020 */ blr 
lbl_0000AF54:
/* 0000AF54 4081000C */ ble lbl_0000AF60
/* 0000AF58 38600001 */ li r3, 1
/* 0000AF5C 4E800020 */ blr 
lbl_0000AF60:
/* 0000AF60 38600000 */ li r3, 0
/* 0000AF64 4E800020 */ blr 
lbl_0000AF68:
/* 0000AF68 90830000 */ stw r4, 0(r3)
/* 0000AF6C 38000000 */ li r0, 0
/* 0000AF70 3CA00000 */ lis r5, lbl_0000C690@ha
/* 0000AF74 90030004 */ stw r0, 4(r3)
/* 0000AF78 28040000 */ cmplwi r4, 0
/* 0000AF7C 38C3000C */ addi r6, r3, 0xc
/* 0000AF80 C4050000 */ lfsu f0, lbl_0000C690@l(r5)
/* 0000AF84 D0030008 */ stfs f0, 8(r3)
/* 0000AF88 4C810020 */ blelr 
/* 0000AF8C 5480E8FF */ rlwinm. r0, r4, 0x1d, 3, 0x1f
/* 0000AF90 7C0903A6 */ mtctr r0
/* 0000AF94 41820054 */ beq lbl_0000AFE8
lbl_0000AF98:
/* 0000AF98 C0050000 */ lfs f0, 0(r5)
/* 0000AF9C D0060020 */ stfs f0, 0x20(r6)
/* 0000AFA0 C0050000 */ lfs f0, 0(r5)
/* 0000AFA4 D0060048 */ stfs f0, 0x48(r6)
/* 0000AFA8 C0050000 */ lfs f0, 0(r5)
/* 0000AFAC D0060070 */ stfs f0, 0x70(r6)
/* 0000AFB0 C0050000 */ lfs f0, 0(r5)
/* 0000AFB4 D0060098 */ stfs f0, 0x98(r6)
/* 0000AFB8 C0050000 */ lfs f0, 0(r5)
/* 0000AFBC D00600C0 */ stfs f0, 0xc0(r6)
/* 0000AFC0 C0050000 */ lfs f0, 0(r5)
/* 0000AFC4 D00600E8 */ stfs f0, 0xe8(r6)
/* 0000AFC8 C0050000 */ lfs f0, 0(r5)
/* 0000AFCC D0060110 */ stfs f0, 0x110(r6)
/* 0000AFD0 C0050000 */ lfs f0, 0(r5)
/* 0000AFD4 D0060138 */ stfs f0, 0x138(r6)
/* 0000AFD8 38C60140 */ addi r6, r6, 0x140
/* 0000AFDC 4200FFBC */ bdnz lbl_0000AF98
/* 0000AFE0 70840007 */ andi. r4, r4, 7
/* 0000AFE4 4D820020 */ beqlr 
lbl_0000AFE8:
/* 0000AFE8 7C8903A6 */ mtctr r4
lbl_0000AFEC:
/* 0000AFEC C0050000 */ lfs f0, 0(r5)
/* 0000AFF0 D0060020 */ stfs f0, 0x20(r6)
/* 0000AFF4 38C60028 */ addi r6, r6, 0x28
/* 0000AFF8 4200FFF4 */ bdnz lbl_0000AFEC
/* 0000AFFC 4E800020 */ blr 
lbl_0000B000:
/* 0000B000 7C0802A6 */ mflr r0
/* 0000B004 3C800000 */ lis r4, gamePauseStatus@ha
/* 0000B008 90010004 */ stw r0, 4(r1)
/* 0000B00C 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000B010 93E10014 */ stw r31, 0x14(r1)
/* 0000B014 3BE30000 */ addi r31, r3, 0
/* 0000B018 80040000 */ lwz r0, gamePauseStatus@l(r4)
/* 0000B01C 3C800000 */ lis r4, lbl_0000C690@ha
/* 0000B020 38640000 */ addi r3, r4, lbl_0000C690@l
/* 0000B024 7000000A */ andi. r0, r0, 0xa
/* 0000B028 408200D8 */ bne lbl_0000B100
/* 0000B02C C03F0000 */ lfs f1, 0(r31)
/* 0000B030 C01F000C */ lfs f0, 0xc(r31)
/* 0000B034 EC01002A */ fadds f0, f1, f0
/* 0000B038 D01F0000 */ stfs f0, 0(r31)
/* 0000B03C C03F0004 */ lfs f1, 4(r31)
/* 0000B040 C01F0010 */ lfs f0, 0x10(r31)
/* 0000B044 EC01002A */ fadds f0, f1, f0
/* 0000B048 D01F0004 */ stfs f0, 4(r31)
/* 0000B04C C03F0008 */ lfs f1, 8(r31)
/* 0000B050 C01F0014 */ lfs f0, 0x14(r31)
/* 0000B054 EC01002A */ fadds f0, f1, f0
/* 0000B058 D01F0008 */ stfs f0, 8(r31)
/* 0000B05C C03F000C */ lfs f1, 0xc(r31)
/* 0000B060 C0030004 */ lfs f0, 4(r3)
/* 0000B064 EC010032 */ fmuls f0, f1, f0
/* 0000B068 D01F000C */ stfs f0, 0xc(r31)
/* 0000B06C C03F0014 */ lfs f1, 0x14(r31)
/* 0000B070 C0030004 */ lfs f0, 4(r3)
/* 0000B074 EC010032 */ fmuls f0, f1, f0
/* 0000B078 D01F0014 */ stfs f0, 0x14(r31)
/* 0000B07C C03F0010 */ lfs f1, 0x10(r31)
/* 0000B080 C0030008 */ lfs f0, 8(r3)
/* 0000B084 FC010040 */ fcmpo cr0, f1, f0
/* 0000B088 40800014 */ bge lbl_0000B09C
/* 0000B08C C003000C */ lfs f0, 0xc(r3)
/* 0000B090 EC010032 */ fmuls f0, f1, f0
/* 0000B094 D01F0010 */ stfs f0, 0x10(r31)
/* 0000B098 48000010 */ b lbl_0000B0A8
lbl_0000B09C:
/* 0000B09C C0030010 */ lfs f0, 0x10(r3)
/* 0000B0A0 EC01002A */ fadds f0, f1, f0
/* 0000B0A4 D01F0010 */ stfs f0, 0x10(r31)
lbl_0000B0A8:
/* 0000B0A8 C03F0018 */ lfs f1, 0x18(r31)
/* 0000B0AC C0030014 */ lfs f0, 0x14(r3)
/* 0000B0B0 EC010032 */ fmuls f0, f1, f0
/* 0000B0B4 D01F0018 */ stfs f0, 0x18(r31)
/* 0000B0B8 C03F0020 */ lfs f1, 0x20(r31)
/* 0000B0BC C0030018 */ lfs f0, 0x18(r3)
/* 0000B0C0 FC010040 */ fcmpo cr0, f1, f0
/* 0000B0C4 40800014 */ bge lbl_0000B0D8
/* 0000B0C8 C03F001C */ lfs f1, 0x1c(r31)
/* 0000B0CC C003001C */ lfs f0, 0x1c(r3)
/* 0000B0D0 EC010028 */ fsubs f0, f1, f0
/* 0000B0D4 D01F001C */ stfs f0, 0x1c(r31)
lbl_0000B0D8:
/* 0000B0D8 C03F0004 */ lfs f1, 4(r31)
/* 0000B0DC C0030000 */ lfs f0, 0(r3)
/* 0000B0E0 FC010040 */ fcmpo cr0, f1, f0
/* 0000B0E4 4081000C */ ble lbl_0000B0F0
/* 0000B0E8 D01F0020 */ stfs f0, 0x20(r31)
/* 0000B0EC 48000014 */ b lbl_0000B100
lbl_0000B0F0:
/* 0000B0F0 C03F0020 */ lfs f1, 0x20(r31)
/* 0000B0F4 C0030020 */ lfs f0, 0x20(r3)
/* 0000B0F8 EC010028 */ fsubs f0, f1, f0
/* 0000B0FC D01F0020 */ stfs f0, 0x20(r31)
lbl_0000B100:
/* 0000B100 7FE3FB78 */ mr r3, r31
/* 0000B104 4BFF5049 */ bl mathutil_mtxA_from_mtxB_translate
/* 0000B108 4BFF5045 */ bl mathutil_mtxA_sq_from_identity
/* 0000B10C 38604000 */ li r3, 0x4000
/* 0000B110 4BFF503D */ bl mathutil_mtxA_rotate_x
/* 0000B114 C03F0018 */ lfs f1, 0x18(r31)
/* 0000B118 4BFF5035 */ bl mathutil_mtxA_scale_s
/* 0000B11C 8001001C */ lwz r0, 0x1c(r1)
/* 0000B120 83E10014 */ lwz r31, 0x14(r1)
/* 0000B124 38210018 */ addi r1, r1, 0x18
/* 0000B128 7C0803A6 */ mtlr r0
/* 0000B12C 4E800020 */ blr 
lbl_0000B130:
/* 0000B130 7C0802A6 */ mflr r0
/* 0000B134 3CC00000 */ lis r6, lbl_0000C690@ha
/* 0000B138 90010004 */ stw r0, 4(r1)
/* 0000B13C 9421FFA0 */ stwu r1, -0x60(r1)
/* 0000B140 DBE10058 */ stfd f31, 0x58(r1)
/* 0000B144 BEC10030 */ stmw r22, 0x30(r1)
/* 0000B148 3B860000 */ addi r28, r6, lbl_0000C690@l
/* 0000B14C 7CB82B78 */ mr r24, r5
/* 0000B150 3AC30000 */ addi r22, r3, 0
/* 0000B154 3AE40000 */ addi r23, r4, 0
/* 0000B158 38B8000C */ addi r5, r24, 0xc
/* 0000B15C C0030004 */ lfs f0, 4(r3)
/* 0000B160 3C600000 */ lis r3, minigameGma@ha
/* 0000B164 C05C0000 */ lfs f2, 0(r28)
/* 0000B168 38630000 */ addi r3, r3, minigameGma@l
/* 0000B16C 80630000 */ lwz r3, 0(r3)
/* 0000B170 FC001040 */ fcmpo cr0, f0, f2
/* 0000B174 80630008 */ lwz r3, 8(r3)
/* 0000B178 83230448 */ lwz r25, 0x448(r3)
/* 0000B17C 4081000C */ ble lbl_0000B188
/* 0000B180 FC601090 */ fmr f3, f2
/* 0000B184 48000020 */ b lbl_0000B1A4
lbl_0000B188:
/* 0000B188 C03C0024 */ lfs f1, 0x24(r28)
/* 0000B18C EC01002A */ fadds f0, f1, f0
/* 0000B190 EC000824 */ fdivs f0, f0, f1
/* 0000B194 FC001040 */ fcmpo cr0, f0, f2
/* 0000B198 FC600090 */ fmr f3, f0
/* 0000B19C 40800008 */ bge lbl_0000B1A4
/* 0000B1A0 FC601090 */ fmr f3, f2
lbl_0000B1A4:
/* 0000B1A4 3C600000 */ lis r3, gamePauseStatus@ha
/* 0000B1A8 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 0000B1AC 7000000A */ andi. r0, r0, 0xa
/* 0000B1B0 40820018 */ bne lbl_0000B1C8
/* 0000B1B4 C01C0028 */ lfs f0, 0x28(r28)
/* 0000B1B8 C0380008 */ lfs f1, 8(r24)
/* 0000B1BC EC0000F2 */ fmuls f0, f0, f3
/* 0000B1C0 EC01002A */ fadds f0, f1, f0
/* 0000B1C4 D0180008 */ stfs f0, 8(r24)
lbl_0000B1C8:
/* 0000B1C8 C01C002C */ lfs f0, 0x2c(r28)
/* 0000B1CC 3C800000 */ lis r4, mathutilData@ha
/* 0000B1D0 3C600000 */ lis r3, gamePauseStatus@ha
/* 0000B1D4 EFE000F2 */ fmuls f31, f0, f3
/* 0000B1D8 3B650000 */ addi r27, r5, 0
/* 0000B1DC 3BA40000 */ addi r29, r4, mathutilData@l
/* 0000B1E0 3BC30000 */ addi r30, r3, gamePauseStatus@l
/* 0000B1E4 3B400000 */ li r26, 0
/* 0000B1E8 3FE04330 */ lis r31, 0x4330
/* 0000B1EC 48000244 */ b lbl_0000B430
lbl_0000B1F0:
/* 0000B1F0 C03B0020 */ lfs f1, 0x20(r27)
/* 0000B1F4 C01C0000 */ lfs f0, 0(r28)
/* 0000B1F8 FC010040 */ fcmpo cr0, f1, f0
/* 0000B1FC 4081002C */ ble lbl_0000B228
/* 0000B200 7F63DB78 */ mr r3, r27
/* 0000B204 4BFFFDFD */ bl lbl_0000B000
/* 0000B208 C03B001C */ lfs f1, 0x1c(r27)
/* 0000B20C 4BFF4F41 */ bl avdisp_set_alpha
/* 0000B210 807D0000 */ lwz r3, 0(r29)
/* 0000B214 38800000 */ li r4, 0
/* 0000B218 4BFF4F35 */ bl u_gxutil_upload_some_mtx
/* 0000B21C 7F23CB78 */ mr r3, r25
/* 0000B220 4BFF4F2D */ bl avdisp_draw_model_unculled_sort_none
/* 0000B224 48000204 */ b lbl_0000B428
lbl_0000B228:
/* 0000B228 801E0000 */ lwz r0, 0(r30)
/* 0000B22C 7000000A */ andi. r0, r0, 0xa
/* 0000B230 408201F8 */ bne lbl_0000B428
/* 0000B234 C0380008 */ lfs f1, 8(r24)
/* 0000B238 C01C0020 */ lfs f0, 0x20(r28)
/* 0000B23C FC010040 */ fcmpo cr0, f1, f0
/* 0000B240 408101E8 */ ble lbl_0000B428
/* 0000B244 4BFF4F09 */ bl rand
/* 0000B248 6C608000 */ xoris r0, r3, 0x8000
/* 0000B24C C03C0034 */ lfs f1, 0x34(r28)
/* 0000B250 9001002C */ stw r0, 0x2c(r1)
/* 0000B254 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B258 C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B25C 93E10028 */ stw r31, 0x28(r1)
/* 0000B260 C05C0018 */ lfs f2, 0x18(r28)
/* 0000B264 C8610028 */ lfd f3, 0x28(r1)
/* 0000B268 C01C0030 */ lfs f0, 0x30(r28)
/* 0000B26C EC632028 */ fsubs f3, f3, f4
/* 0000B270 EC230824 */ fdivs f1, f3, f1
/* 0000B274 EC220072 */ fmuls f1, f2, f1
/* 0000B278 EC000072 */ fmuls f0, f0, f1
/* 0000B27C EC02002A */ fadds f0, f2, f0
/* 0000B280 D01B0020 */ stfs f0, 0x20(r27)
/* 0000B284 4BFF4EC9 */ bl rand
/* 0000B288 6C608000 */ xoris r0, r3, 0x8000
/* 0000B28C C03C0034 */ lfs f1, 0x34(r28)
/* 0000B290 90010024 */ stw r0, 0x24(r1)
/* 0000B294 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B298 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B29C 38000000 */ li r0, 0
/* 0000B2A0 93E10020 */ stw r31, 0x20(r1)
/* 0000B2A4 C01C0038 */ lfs f0, 0x38(r28)
/* 0000B2A8 C8410020 */ lfd f2, 0x20(r1)
/* 0000B2AC EC421828 */ fsubs f2, f2, f3
/* 0000B2B0 EC220824 */ fdivs f1, f2, f1
/* 0000B2B4 EC00082A */ fadds f0, f0, f1
/* 0000B2B8 EC1F0032 */ fmuls f0, f31, f0
/* 0000B2BC D01B0018 */ stfs f0, 0x18(r27)
/* 0000B2C0 901B0024 */ stw r0, 0x24(r27)
/* 0000B2C4 4BFF4E89 */ bl rand
/* 0000B2C8 6C608000 */ xoris r0, r3, 0x8000
/* 0000B2CC C03C0034 */ lfs f1, 0x34(r28)
/* 0000B2D0 9001001C */ stw r0, 0x1c(r1)
/* 0000B2D4 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B2D8 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B2DC 93E10018 */ stw r31, 0x18(r1)
/* 0000B2E0 C01C003C */ lfs f0, 0x3c(r28)
/* 0000B2E4 C8410018 */ lfd f2, 0x18(r1)
/* 0000B2E8 EC421828 */ fsubs f2, f2, f3
/* 0000B2EC EC220824 */ fdivs f1, f2, f1
/* 0000B2F0 FC010040 */ fcmpo cr0, f1, f0
/* 0000B2F4 40800054 */ bge lbl_0000B348
/* 0000B2F8 4BFF4E55 */ bl rand
/* 0000B2FC 6C608000 */ xoris r0, r3, 0x8000
/* 0000B300 C03C0034 */ lfs f1, 0x34(r28)
/* 0000B304 9001001C */ stw r0, 0x1c(r1)
/* 0000B308 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B30C C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B310 93E10018 */ stw r31, 0x18(r1)
/* 0000B314 C01C0040 */ lfs f0, 0x40(r28)
/* 0000B318 C8410018 */ lfd f2, 0x18(r1)
/* 0000B31C EC421828 */ fsubs f2, f2, f3
/* 0000B320 EC220824 */ fdivs f1, f2, f1
/* 0000B324 FC010040 */ fcmpo cr0, f1, f0
/* 0000B328 40800014 */ bge lbl_0000B33C
/* 0000B32C 801B0024 */ lwz r0, 0x24(r27)
/* 0000B330 60000001 */ ori r0, r0, 1
/* 0000B334 901B0024 */ stw r0, 0x24(r27)
/* 0000B338 48000010 */ b lbl_0000B348
lbl_0000B33C:
/* 0000B33C 801B0024 */ lwz r0, 0x24(r27)
/* 0000B340 60000002 */ ori r0, r0, 2
/* 0000B344 901B0024 */ stw r0, 0x24(r27)
lbl_0000B348:
/* 0000B348 80760000 */ lwz r3, 0(r22)
/* 0000B34C 80160004 */ lwz r0, 4(r22)
/* 0000B350 907B0000 */ stw r3, 0(r27)
/* 0000B354 901B0004 */ stw r0, 4(r27)
/* 0000B358 80160008 */ lwz r0, 8(r22)
/* 0000B35C 901B0008 */ stw r0, 8(r27)
/* 0000B360 C03C0044 */ lfs f1, 0x44(r28)
/* 0000B364 C0170000 */ lfs f0, 0(r23)
/* 0000B368 EC010032 */ fmuls f0, f1, f0
/* 0000B36C D01B000C */ stfs f0, 0xc(r27)
/* 0000B370 C0170004 */ lfs f0, 4(r23)
/* 0000B374 D01B0010 */ stfs f0, 0x10(r27)
/* 0000B378 C03C0044 */ lfs f1, 0x44(r28)
/* 0000B37C C0170008 */ lfs f0, 8(r23)
/* 0000B380 EC010032 */ fmuls f0, f1, f0
/* 0000B384 D01B0014 */ stfs f0, 0x14(r27)
/* 0000B388 4BFF4DC5 */ bl rand
/* 0000B38C 6C608000 */ xoris r0, r3, 0x8000
/* 0000B390 C07C0034 */ lfs f3, 0x34(r28)
/* 0000B394 9001001C */ stw r0, 0x1c(r1)
/* 0000B398 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B39C C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B3A0 93E10018 */ stw r31, 0x18(r1)
/* 0000B3A4 C05C0040 */ lfs f2, 0x40(r28)
/* 0000B3A8 C8010018 */ lfd f0, 0x18(r1)
/* 0000B3AC C03C0038 */ lfs f1, 0x38(r28)
/* 0000B3B0 EC802028 */ fsubs f4, f0, f4
/* 0000B3B4 C01B000C */ lfs f0, 0xc(r27)
/* 0000B3B8 EC641824 */ fdivs f3, f4, f3
/* 0000B3BC EC431028 */ fsubs f2, f3, f2
/* 0000B3C0 EC2100B2 */ fmuls f1, f1, f2
/* 0000B3C4 EC00082A */ fadds f0, f0, f1
/* 0000B3C8 D01B000C */ stfs f0, 0xc(r27)
/* 0000B3CC 4BFF4D81 */ bl rand
/* 0000B3D0 6C608000 */ xoris r0, r3, 0x8000
/* 0000B3D4 C07C0034 */ lfs f3, 0x34(r28)
/* 0000B3D8 90010024 */ stw r0, 0x24(r1)
/* 0000B3DC 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B3E0 C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B3E4 93E10020 */ stw r31, 0x20(r1)
/* 0000B3E8 C05C0040 */ lfs f2, 0x40(r28)
/* 0000B3EC C8010020 */ lfd f0, 0x20(r1)
/* 0000B3F0 C03C0038 */ lfs f1, 0x38(r28)
/* 0000B3F4 EC802028 */ fsubs f4, f0, f4
/* 0000B3F8 C01B0014 */ lfs f0, 0x14(r27)
/* 0000B3FC EC641824 */ fdivs f3, f4, f3
/* 0000B400 EC431028 */ fsubs f2, f3, f2
/* 0000B404 EC2100B2 */ fmuls f1, f1, f2
/* 0000B408 EC00082A */ fadds f0, f0, f1
/* 0000B40C D01B0014 */ stfs f0, 0x14(r27)
/* 0000B410 C01C0020 */ lfs f0, 0x20(r28)
/* 0000B414 D01B001C */ stfs f0, 0x1c(r27)
/* 0000B418 C0380008 */ lfs f1, 8(r24)
/* 0000B41C C01C0020 */ lfs f0, 0x20(r28)
/* 0000B420 EC010028 */ fsubs f0, f1, f0
/* 0000B424 D0180008 */ stfs f0, 8(r24)
lbl_0000B428:
/* 0000B428 3B7B0028 */ addi r27, r27, 0x28
/* 0000B42C 3B5A0001 */ addi r26, r26, 1
lbl_0000B430:
/* 0000B430 80180000 */ lwz r0, 0(r24)
/* 0000B434 7C1A0040 */ cmplw r26, r0
/* 0000B438 4180FDB8 */ blt lbl_0000B1F0
/* 0000B43C BAC10030 */ lmw r22, 0x30(r1)
/* 0000B440 80010064 */ lwz r0, 0x64(r1)
/* 0000B444 CBE10058 */ lfd f31, 0x58(r1)
/* 0000B448 38210060 */ addi r1, r1, 0x60
/* 0000B44C 7C0803A6 */ mtlr r0
/* 0000B450 4E800020 */ blr 
lbl_0000B454:
/* 0000B454 7C0802A6 */ mflr r0
/* 0000B458 3C800000 */ lis r4, gamePauseStatus@ha
/* 0000B45C 90010004 */ stw r0, 4(r1)
/* 0000B460 3CA00000 */ lis r5, lbl_100000B8@ha
/* 0000B464 9421FFB8 */ stwu r1, -0x48(r1)
/* 0000B468 93E10044 */ stw r31, 0x44(r1)
/* 0000B46C 93C10040 */ stw r30, 0x40(r1)
/* 0000B470 3BC30000 */ addi r30, r3, 0
/* 0000B474 38650000 */ addi r3, r5, lbl_100000B8@l
/* 0000B478 80040000 */ lwz r0, gamePauseStatus@l(r4)
/* 0000B47C 3C800000 */ lis r4, lbl_0000C690@ha
/* 0000B480 3BE40000 */ addi r31, r4, lbl_0000C690@l
/* 0000B484 7000000A */ andi. r0, r0, 0xa
/* 0000B488 40820064 */ bne lbl_0000B4EC
/* 0000B48C C03F003C */ lfs f1, 0x3c(r31)
/* 0000B490 C0030000 */ lfs f0, 0(r3)
/* 0000B494 C05E000C */ lfs f2, 0xc(r30)
/* 0000B498 EC010032 */ fmuls f0, f1, f0
/* 0000B49C C03E0000 */ lfs f1, 0(r30)
/* 0000B4A0 EC02002A */ fadds f0, f2, f0
/* 0000B4A4 EC01002A */ fadds f0, f1, f0
/* 0000B4A8 D01E0000 */ stfs f0, 0(r30)
/* 0000B4AC C03F003C */ lfs f1, 0x3c(r31)
/* 0000B4B0 C0030004 */ lfs f0, 4(r3)
/* 0000B4B4 C05E0010 */ lfs f2, 0x10(r30)
/* 0000B4B8 EC010032 */ fmuls f0, f1, f0
/* 0000B4BC C03E0004 */ lfs f1, 4(r30)
/* 0000B4C0 EC02002A */ fadds f0, f2, f0
/* 0000B4C4 EC01002A */ fadds f0, f1, f0
/* 0000B4C8 D01E0004 */ stfs f0, 4(r30)
/* 0000B4CC C03F003C */ lfs f1, 0x3c(r31)
/* 0000B4D0 C0030008 */ lfs f0, 8(r3)
/* 0000B4D4 C05E0014 */ lfs f2, 0x14(r30)
/* 0000B4D8 EC010032 */ fmuls f0, f1, f0
/* 0000B4DC C03E0008 */ lfs f1, 8(r30)
/* 0000B4E0 EC02002A */ fadds f0, f2, f0
/* 0000B4E4 EC01002A */ fadds f0, f1, f0
/* 0000B4E8 D01E0008 */ stfs f0, 8(r30)
lbl_0000B4EC:
/* 0000B4EC 38E000FF */ li r7, 0xff
/* 0000B4F0 98E10036 */ stb r7, 0x36(r1)
/* 0000B4F4 38000000 */ li r0, 0
/* 0000B4F8 387E000C */ addi r3, r30, 0xc
/* 0000B4FC 98E10035 */ stb r7, 0x35(r1)
/* 0000B500 3881000C */ addi r4, r1, 0xc
/* 0000B504 98E10034 */ stb r7, 0x34(r1)
/* 0000B508 C03F0050 */ lfs f1, 0x50(r31)
/* 0000B50C C01E001C */ lfs f0, 0x1c(r30)
/* 0000B510 EC010032 */ fmuls f0, f1, f0
/* 0000B514 FC00001E */ fctiwz f0, f0
/* 0000B518 D8010038 */ stfd f0, 0x38(r1)
/* 0000B51C 80A1003C */ lwz r5, 0x3c(r1)
/* 0000B520 98A10037 */ stb r5, 0x37(r1)
/* 0000B524 80DE0000 */ lwz r6, 0(r30)
/* 0000B528 80BE0004 */ lwz r5, 4(r30)
/* 0000B52C 90C10028 */ stw r6, 0x28(r1)
/* 0000B530 90A1002C */ stw r5, 0x2c(r1)
/* 0000B534 80BE0008 */ lwz r5, 8(r30)
/* 0000B538 98E10026 */ stb r7, 0x26(r1)
/* 0000B53C 98E10025 */ stb r7, 0x25(r1)
/* 0000B540 98E10024 */ stb r7, 0x24(r1)
/* 0000B544 90A10030 */ stw r5, 0x30(r1)
/* 0000B548 98010027 */ stb r0, 0x27(r1)
/* 0000B54C C03F002C */ lfs f1, 0x2c(r31)
/* 0000B550 4BFF4BFD */ bl mathutil_vec_set_len
/* 0000B554 C05E0000 */ lfs f2, 0(r30)
/* 0000B558 3C600000 */ lis r3, gamePauseStatus@ha
/* 0000B55C C001000C */ lfs f0, 0xc(r1)
/* 0000B560 C0210010 */ lfs f1, 0x10(r1)
/* 0000B564 EC420028 */ fsubs f2, f2, f0
/* 0000B568 C0010014 */ lfs f0, 0x14(r1)
/* 0000B56C D0410018 */ stfs f2, 0x18(r1)
/* 0000B570 C05E0004 */ lfs f2, 4(r30)
/* 0000B574 EC220828 */ fsubs f1, f2, f1
/* 0000B578 D021001C */ stfs f1, 0x1c(r1)
/* 0000B57C C03E0008 */ lfs f1, 8(r30)
/* 0000B580 EC010028 */ fsubs f0, f1, f0
/* 0000B584 D0010020 */ stfs f0, 0x20(r1)
/* 0000B588 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 0000B58C 7000000A */ andi. r0, r0, 0xa
/* 0000B590 4082006C */ bne lbl_0000B5FC
/* 0000B594 C03E000C */ lfs f1, 0xc(r30)
/* 0000B598 C01F0054 */ lfs f0, 0x54(r31)
/* 0000B59C EC010032 */ fmuls f0, f1, f0
/* 0000B5A0 D01E000C */ stfs f0, 0xc(r30)
/* 0000B5A4 C03E0014 */ lfs f1, 0x14(r30)
/* 0000B5A8 C01F0054 */ lfs f0, 0x54(r31)
/* 0000B5AC EC010032 */ fmuls f0, f1, f0
/* 0000B5B0 D01E0014 */ stfs f0, 0x14(r30)
/* 0000B5B4 C03E0010 */ lfs f1, 0x10(r30)
/* 0000B5B8 C01F0058 */ lfs f0, 0x58(r31)
/* 0000B5BC EC010028 */ fsubs f0, f1, f0
/* 0000B5C0 D01E0010 */ stfs f0, 0x10(r30)
/* 0000B5C4 C03E001C */ lfs f1, 0x1c(r30)
/* 0000B5C8 C01F0044 */ lfs f0, 0x44(r31)
/* 0000B5CC EC010032 */ fmuls f0, f1, f0
/* 0000B5D0 D01E001C */ stfs f0, 0x1c(r30)
/* 0000B5D4 C03E0004 */ lfs f1, 4(r30)
/* 0000B5D8 C01F0000 */ lfs f0, 0(r31)
/* 0000B5DC FC010040 */ fcmpo cr0, f1, f0
/* 0000B5E0 4080000C */ bge lbl_0000B5EC
/* 0000B5E4 D01E0020 */ stfs f0, 0x20(r30)
/* 0000B5E8 48000014 */ b lbl_0000B5FC
lbl_0000B5EC:
/* 0000B5EC C03E0020 */ lfs f1, 0x20(r30)
/* 0000B5F0 C01F0020 */ lfs f0, 0x20(r31)
/* 0000B5F4 EC010028 */ fsubs f0, f1, f0
/* 0000B5F8 D01E0020 */ stfs f0, 0x20(r30)
lbl_0000B5FC:
/* 0000B5FC 4BFF4B51 */ bl mathutil_mtxA_from_mtxB
/* 0000B600 38610028 */ addi r3, r1, 0x28
/* 0000B604 38810018 */ addi r4, r1, 0x18
/* 0000B608 4BFF4B45 */ bl gxutil_draw_line_multicolor
/* 0000B60C 8001004C */ lwz r0, 0x4c(r1)
/* 0000B610 83E10044 */ lwz r31, 0x44(r1)
/* 0000B614 83C10040 */ lwz r30, 0x40(r1)
/* 0000B618 7C0803A6 */ mtlr r0
/* 0000B61C 38210048 */ addi r1, r1, 0x48
/* 0000B620 4E800020 */ blr 
lbl_0000B624:
/* 0000B624 7C0802A6 */ mflr r0
/* 0000B628 3CC00000 */ lis r6, lbl_0000C690@ha
/* 0000B62C 90010004 */ stw r0, 4(r1)
/* 0000B630 9421FF68 */ stwu r1, -0x98(r1)
/* 0000B634 DBE10090 */ stfd f31, 0x90(r1)
/* 0000B638 BEA10064 */ stmw r21, 0x64(r1)
/* 0000B63C 3BA60000 */ addi r29, r6, lbl_0000C690@l
/* 0000B640 7CBA2B78 */ mr r26, r5
/* 0000B644 3B030000 */ addi r24, r3, 0
/* 0000B648 3B240000 */ addi r25, r4, 0
/* 0000B64C 3B7A000C */ addi r27, r26, 0xc
/* 0000B650 38610030 */ addi r3, r1, 0x30
/* 0000B654 80DD005C */ lwz r6, 0x5c(r29)
/* 0000B658 801D0060 */ lwz r0, 0x60(r29)
/* 0000B65C 90C1003C */ stw r6, 0x3c(r1)
/* 0000B660 90010040 */ stw r0, 0x40(r1)
/* 0000B664 801D0064 */ lwz r0, 0x64(r29)
/* 0000B668 90010044 */ stw r0, 0x44(r1)
/* 0000B66C 80840000 */ lwz r4, 0(r4)
/* 0000B670 80190004 */ lwz r0, 4(r25)
/* 0000B674 90810030 */ stw r4, 0x30(r1)
/* 0000B678 90010034 */ stw r0, 0x34(r1)
/* 0000B67C 80190008 */ lwz r0, 8(r25)
/* 0000B680 90010038 */ stw r0, 0x38(r1)
/* 0000B684 4BFF4AC9 */ bl mathutil_vec_normalize_len
/* 0000B688 38610020 */ addi r3, r1, 0x20
/* 0000B68C 3881003C */ addi r4, r1, 0x3c
/* 0000B690 38A10030 */ addi r5, r1, 0x30
/* 0000B694 4BFF4AB9 */ bl mathutil_quat_from_dirs
/* 0000B698 38610020 */ addi r3, r1, 0x20
/* 0000B69C 4BFF4AB1 */ bl mathutil_mtxA_from_quat
/* 0000B6A0 4BFF4AAD */ bl mathutil_mtxA_normalize_basis
/* 0000B6A4 C0390000 */ lfs f1, 0(r25)
/* 0000B6A8 C0590004 */ lfs f2, 4(r25)
/* 0000B6AC C0190008 */ lfs f0, 8(r25)
/* 0000B6B0 EC210072 */ fmuls f1, f1, f1
/* 0000B6B4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000B6B8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000B6BC 4BFF4A91 */ bl mathutil_sqrt
/* 0000B6C0 C05D0068 */ lfs f2, 0x68(r29)
/* 0000B6C4 38600014 */ li r3, 0x14
/* 0000B6C8 C01A0008 */ lfs f0, 8(r26)
/* 0000B6CC EC220072 */ fmuls f1, f2, f1
/* 0000B6D0 EC00082A */ fadds f0, f0, f1
/* 0000B6D4 D01A0008 */ stfs f0, 8(r26)
/* 0000B6D8 4BFF4A75 */ bl gxutil_set_line_width
/* 0000B6DC 38600001 */ li r3, 1
/* 0000B6E0 38800002 */ li r4, 2
/* 0000B6E4 38A00001 */ li r5, 1
/* 0000B6E8 38C0000F */ li r6, 0xf
/* 0000B6EC 4BFF4A61 */ bl gxutil_set_line_blend_params
/* 0000B6F0 3C600000 */ lis r3, gamePauseStatus@ha
/* 0000B6F4 3BC30000 */ addi r30, r3, gamePauseStatus@l
/* 0000B6F8 3B800000 */ li r28, 0
/* 0000B6FC 3AE00000 */ li r23, 0
/* 0000B700 3EC04330 */ lis r22, 0x4330
/* 0000B704 480003A4 */ b lbl_0000BAA8
lbl_0000B708:
/* 0000B708 7FFBBA14 */ add r31, r27, r23
/* 0000B70C C01D0000 */ lfs f0, 0(r29)
/* 0000B710 C03F0020 */ lfs f1, 0x20(r31)
/* 0000B714 FC010040 */ fcmpo cr0, f1, f0
/* 0000B718 40810018 */ ble lbl_0000B730
/* 0000B71C 4BFF4A31 */ bl mathutil_mtxA_push
/* 0000B720 7FE3FB78 */ mr r3, r31
/* 0000B724 4BFFFD31 */ bl lbl_0000B454
/* 0000B728 4BFF4A25 */ bl mathutil_mtxA_pop
/* 0000B72C 48000374 */ b lbl_0000BAA0
lbl_0000B730:
/* 0000B730 C03A0008 */ lfs f1, 8(r26)
/* 0000B734 C01D0020 */ lfs f0, 0x20(r29)
/* 0000B738 FC010040 */ fcmpo cr0, f1, f0
/* 0000B73C 40810364 */ ble lbl_0000BAA0
/* 0000B740 4BFF4A0D */ bl rand
/* 0000B744 6C608000 */ xoris r0, r3, 0x8000
/* 0000B748 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B74C 9001005C */ stw r0, 0x5c(r1)
/* 0000B750 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B754 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B758 38000000 */ li r0, 0
/* 0000B75C 92C10058 */ stw r22, 0x58(r1)
/* 0000B760 C01D0040 */ lfs f0, 0x40(r29)
/* 0000B764 C8410058 */ lfd f2, 0x58(r1)
/* 0000B768 901F0024 */ stw r0, 0x24(r31)
/* 0000B76C EC421828 */ fsubs f2, f2, f3
/* 0000B770 801E0000 */ lwz r0, 0(r30)
/* 0000B774 EC220824 */ fdivs f1, f2, f1
/* 0000B778 7000000A */ andi. r0, r0, 0xa
/* 0000B77C EFE10028 */ fsubs f31, f1, f0
/* 0000B780 40820044 */ bne lbl_0000B7C4
/* 0000B784 4BFF49C9 */ bl rand
/* 0000B788 6C608000 */ xoris r0, r3, 0x8000
/* 0000B78C C03D0034 */ lfs f1, 0x34(r29)
/* 0000B790 9001005C */ stw r0, 0x5c(r1)
/* 0000B794 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B798 C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B79C 92C10058 */ stw r22, 0x58(r1)
/* 0000B7A0 C05D0018 */ lfs f2, 0x18(r29)
/* 0000B7A4 C8610058 */ lfd f3, 0x58(r1)
/* 0000B7A8 C01D0030 */ lfs f0, 0x30(r29)
/* 0000B7AC EC632028 */ fsubs f3, f3, f4
/* 0000B7B0 EC230824 */ fdivs f1, f3, f1
/* 0000B7B4 EC220072 */ fmuls f1, f2, f1
/* 0000B7B8 EC000072 */ fmuls f0, f0, f1
/* 0000B7BC EC02002A */ fadds f0, f2, f0
/* 0000B7C0 D01F0020 */ stfs f0, 0x20(r31)
lbl_0000B7C4:
/* 0000B7C4 C01D0038 */ lfs f0, 0x38(r29)
/* 0000B7C8 7C7BBA14 */ add r3, r27, r23
/* 0000B7CC D0030018 */ stfs f0, 0x18(r3)
/* 0000B7D0 4BFF497D */ bl rand
/* 0000B7D4 6C608000 */ xoris r0, r3, 0x8000
/* 0000B7D8 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B7DC 9001005C */ stw r0, 0x5c(r1)
/* 0000B7E0 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B7E4 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B7E8 92C10058 */ stw r22, 0x58(r1)
/* 0000B7EC C01D0038 */ lfs f0, 0x38(r29)
/* 0000B7F0 C8410058 */ lfd f2, 0x58(r1)
/* 0000B7F4 EC421828 */ fsubs f2, f2, f3
/* 0000B7F8 EC220824 */ fdivs f1, f2, f1
/* 0000B7FC FC010040 */ fcmpo cr0, f1, f0
/* 0000B800 7C000026 */ mfcr r0
/* 0000B804 541517FF */ rlwinm. r21, r0, 2, 0x1f, 0x1f
/* 0000B808 41820070 */ beq lbl_0000B878
/* 0000B80C C01D0000 */ lfs f0, 0(r29)
/* 0000B810 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000B814 40800010 */ bge lbl_0000B824
/* 0000B818 C01D006C */ lfs f0, 0x6c(r29)
/* 0000B81C EFFF0028 */ fsubs f31, f31, f0
/* 0000B820 4800000C */ b lbl_0000B82C
lbl_0000B824:
/* 0000B824 C01D006C */ lfs f0, 0x6c(r29)
/* 0000B828 EFFF002A */ fadds f31, f31, f0
lbl_0000B82C:
/* 0000B82C D3E10014 */ stfs f31, 0x14(r1)
/* 0000B830 C01D0000 */ lfs f0, 0(r29)
/* 0000B834 D0010018 */ stfs f0, 0x18(r1)
/* 0000B838 4BFF4915 */ bl rand
/* 0000B83C 6C608000 */ xoris r0, r3, 0x8000
/* 0000B840 C05D0034 */ lfs f2, 0x34(r29)
/* 0000B844 9001005C */ stw r0, 0x5c(r1)
/* 0000B848 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B84C C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B850 92C10058 */ stw r22, 0x58(r1)
/* 0000B854 C03D003C */ lfs f1, 0x3c(r29)
/* 0000B858 C8610058 */ lfd f3, 0x58(r1)
/* 0000B85C C01D0070 */ lfs f0, 0x70(r29)
/* 0000B860 EC632028 */ fsubs f3, f3, f4
/* 0000B864 EC431024 */ fdivs f2, f3, f2
/* 0000B868 EC220828 */ fsubs f1, f2, f1
/* 0000B86C EC000072 */ fmuls f0, f0, f1
/* 0000B870 D001001C */ stfs f0, 0x1c(r1)
/* 0000B874 48000054 */ b lbl_0000B8C8
lbl_0000B878:
/* 0000B878 4BFF48D5 */ bl rand
/* 0000B87C 6C608000 */ xoris r0, r3, 0x8000
/* 0000B880 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B884 9001005C */ stw r0, 0x5c(r1)
/* 0000B888 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B88C C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B890 92C10058 */ stw r22, 0x58(r1)
/* 0000B894 C01D0040 */ lfs f0, 0x40(r29)
/* 0000B898 C8410058 */ lfd f2, 0x58(r1)
/* 0000B89C EC421828 */ fsubs f2, f2, f3
/* 0000B8A0 EC220824 */ fdivs f1, f2, f1
/* 0000B8A4 EC010028 */ fsubs f0, f1, f0
/* 0000B8A8 D0010014 */ stfs f0, 0x14(r1)
/* 0000B8AC C01D0000 */ lfs f0, 0(r29)
/* 0000B8B0 D0010018 */ stfs f0, 0x18(r1)
/* 0000B8B4 C03D006C */ lfs f1, 0x6c(r29)
/* 0000B8B8 C01D0074 */ lfs f0, 0x74(r29)
/* 0000B8BC EC2107F2 */ fmuls f1, f1, f31
/* 0000B8C0 EC010028 */ fsubs f0, f1, f0
/* 0000B8C4 D001001C */ stfs f0, 0x1c(r1)
lbl_0000B8C8:
/* 0000B8C8 38610014 */ addi r3, r1, 0x14
/* 0000B8CC 38830000 */ addi r4, r3, 0
/* 0000B8D0 4BFF487D */ bl mathutil_mtxA_tf_vec
/* 0000B8D4 C0380000 */ lfs f1, 0(r24)
/* 0000B8D8 7FFBBA14 */ add r31, r27, r23
/* 0000B8DC C0010014 */ lfs f0, 0x14(r1)
/* 0000B8E0 2C150000 */ cmpwi r21, 0
/* 0000B8E4 EC01002A */ fadds f0, f1, f0
/* 0000B8E8 7C1BBD2E */ stfsx f0, r27, r23
/* 0000B8EC C01D0000 */ lfs f0, 0(r29)
/* 0000B8F0 D01F0004 */ stfs f0, 4(r31)
/* 0000B8F4 C0380008 */ lfs f1, 8(r24)
/* 0000B8F8 C001001C */ lfs f0, 0x1c(r1)
/* 0000B8FC EC01002A */ fadds f0, f1, f0
/* 0000B900 D01F0008 */ stfs f0, 8(r31)
/* 0000B904 4182009C */ beq lbl_0000B9A0
/* 0000B908 4BFF4845 */ bl rand
/* 0000B90C 6C608000 */ xoris r0, r3, 0x8000
/* 0000B910 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B914 9001005C */ stw r0, 0x5c(r1)
/* 0000B918 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B91C C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B920 92C10058 */ stw r22, 0x58(r1)
/* 0000B924 C01D0078 */ lfs f0, 0x78(r29)
/* 0000B928 C8410058 */ lfd f2, 0x58(r1)
/* 0000B92C EC421828 */ fsubs f2, f2, f3
/* 0000B930 EC220824 */ fdivs f1, f2, f1
/* 0000B934 EC000072 */ fmuls f0, f0, f1
/* 0000B938 EC1F0032 */ fmuls f0, f31, f0
/* 0000B93C D01F000C */ stfs f0, 0xc(r31)
/* 0000B940 4BFF480D */ bl rand
/* 0000B944 6C608000 */ xoris r0, r3, 0x8000
/* 0000B948 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B94C 90010054 */ stw r0, 0x54(r1)
/* 0000B950 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B954 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B958 92C10050 */ stw r22, 0x50(r1)
/* 0000B95C C01D007C */ lfs f0, 0x7c(r29)
/* 0000B960 C8410050 */ lfd f2, 0x50(r1)
/* 0000B964 EC421828 */ fsubs f2, f2, f3
/* 0000B968 EC220824 */ fdivs f1, f2, f1
/* 0000B96C EC000072 */ fmuls f0, f0, f1
/* 0000B970 D01F0010 */ stfs f0, 0x10(r31)
/* 0000B974 C0390000 */ lfs f1, 0(r25)
/* 0000B978 C0590004 */ lfs f2, 4(r25)
/* 0000B97C C0190008 */ lfs f0, 8(r25)
/* 0000B980 EC210072 */ fmuls f1, f1, f1
/* 0000B984 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000B988 EC20083A */ fmadds f1, f0, f0, f1
/* 0000B98C 4BFF47C1 */ bl mathutil_sqrt
/* 0000B990 C01D0080 */ lfs f0, 0x80(r29)
/* 0000B994 EC000072 */ fmuls f0, f0, f1
/* 0000B998 D01F0014 */ stfs f0, 0x14(r31)
/* 0000B99C 480000D4 */ b lbl_0000BA70
lbl_0000B9A0:
/* 0000B9A0 4BFF47AD */ bl rand
/* 0000B9A4 6C608000 */ xoris r0, r3, 0x8000
/* 0000B9A8 C05D0034 */ lfs f2, 0x34(r29)
/* 0000B9AC 90010054 */ stw r0, 0x54(r1)
/* 0000B9B0 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B9B4 C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B9B8 92C10050 */ stw r22, 0x50(r1)
/* 0000B9BC C03D0038 */ lfs f1, 0x38(r29)
/* 0000B9C0 C8610050 */ lfd f3, 0x50(r1)
/* 0000B9C4 C01D003C */ lfs f0, 0x3c(r29)
/* 0000B9C8 EC632028 */ fsubs f3, f3, f4
/* 0000B9CC EC431024 */ fdivs f2, f3, f2
/* 0000B9D0 EC2100B2 */ fmuls f1, f1, f2
/* 0000B9D4 EC010028 */ fsubs f0, f1, f0
/* 0000B9D8 D01F000C */ stfs f0, 0xc(r31)
/* 0000B9DC 4BFF4771 */ bl rand
/* 0000B9E0 6C608000 */ xoris r0, r3, 0x8000
/* 0000B9E4 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B9E8 9001005C */ stw r0, 0x5c(r1)
/* 0000B9EC 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B9F0 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B9F4 92C10058 */ stw r22, 0x58(r1)
/* 0000B9F8 C01D0084 */ lfs f0, 0x84(r29)
/* 0000B9FC C8410058 */ lfd f2, 0x58(r1)
/* 0000BA00 EC421828 */ fsubs f2, f2, f3
/* 0000BA04 EC220824 */ fdivs f1, f2, f1
/* 0000BA08 EC000072 */ fmuls f0, f0, f1
/* 0000BA0C D01F0010 */ stfs f0, 0x10(r31)
/* 0000BA10 C0390000 */ lfs f1, 0(r25)
/* 0000BA14 C0590004 */ lfs f2, 4(r25)
/* 0000BA18 C0190008 */ lfs f0, 8(r25)
/* 0000BA1C EC210072 */ fmuls f1, f1, f1
/* 0000BA20 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000BA24 EC20083A */ fmadds f1, f0, f0, f1
/* 0000BA28 4BFF4725 */ bl mathutil_sqrt
/* 0000BA2C FFE00890 */ fmr f31, f1
/* 0000BA30 4BFF471D */ bl rand
/* 0000BA34 6C608000 */ xoris r0, r3, 0x8000
/* 0000BA38 C05D0034 */ lfs f2, 0x34(r29)
/* 0000BA3C 9001004C */ stw r0, 0x4c(r1)
/* 0000BA40 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000BA44 C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000BA48 92C10048 */ stw r22, 0x48(r1)
/* 0000BA4C C03D0088 */ lfs f1, 0x88(r29)
/* 0000BA50 C8610048 */ lfd f3, 0x48(r1)
/* 0000BA54 C01D0074 */ lfs f0, 0x74(r29)
/* 0000BA58 EC632028 */ fsubs f3, f3, f4
/* 0000BA5C EC431024 */ fdivs f2, f3, f2
/* 0000BA60 EC2100B2 */ fmuls f1, f1, f2
/* 0000BA64 EC010028 */ fsubs f0, f1, f0
/* 0000BA68 EC1F0032 */ fmuls f0, f31, f0
/* 0000BA6C D01F0014 */ stfs f0, 0x14(r31)
lbl_0000BA70:
/* 0000BA70 3877000C */ addi r3, r23, 0xc
/* 0000BA74 3897000C */ addi r4, r23, 0xc
/* 0000BA78 7C7B1A14 */ add r3, r27, r3
/* 0000BA7C 7C9B2214 */ add r4, r27, r4
/* 0000BA80 4BFF46CD */ bl mathutil_mtxA_tf_vec
/* 0000BA84 C01D0020 */ lfs f0, 0x20(r29)
/* 0000BA88 7C7BBA14 */ add r3, r27, r23
/* 0000BA8C D003001C */ stfs f0, 0x1c(r3)
/* 0000BA90 C03A0008 */ lfs f1, 8(r26)
/* 0000BA94 C01D0020 */ lfs f0, 0x20(r29)
/* 0000BA98 EC010028 */ fsubs f0, f1, f0
/* 0000BA9C D01A0008 */ stfs f0, 8(r26)
lbl_0000BAA0:
/* 0000BAA0 3B9C0001 */ addi r28, r28, 1
/* 0000BAA4 3AF70028 */ addi r23, r23, 0x28
lbl_0000BAA8:
/* 0000BAA8 801A0000 */ lwz r0, 0(r26)
/* 0000BAAC 7C1C0040 */ cmplw r28, r0
/* 0000BAB0 4180FC58 */ blt lbl_0000B708
/* 0000BAB4 BAA10064 */ lmw r21, 0x64(r1)
/* 0000BAB8 8001009C */ lwz r0, 0x9c(r1)
/* 0000BABC CBE10090 */ lfd f31, 0x90(r1)
/* 0000BAC0 38210098 */ addi r1, r1, 0x98
/* 0000BAC4 7C0803A6 */ mtlr r0
/* 0000BAC8 4E800020 */ blr 
lbl_0000BACC:
/* 0000BACC 7C0802A6 */ mflr r0
/* 0000BAD0 3C600000 */ lis r3, minigameGma@ha
/* 0000BAD4 90010004 */ stw r0, 4(r1)
/* 0000BAD8 38630000 */ addi r3, r3, minigameGma@l
/* 0000BADC 3CC00000 */ lis r6, lbl_0000C690@ha
/* 0000BAE0 9421FF50 */ stwu r1, -0xb0(r1)
/* 0000BAE4 DBE100A8 */ stfd f31, 0xa8(r1)
/* 0000BAE8 DBC100A0 */ stfd f30, 0xa0(r1)
/* 0000BAEC BF010080 */ stmw r24, 0x80(r1)
/* 0000BAF0 3B040000 */ addi r24, r4, 0
/* 0000BAF4 3B850000 */ addi r28, r5, 0
/* 0000BAF8 3BE60000 */ addi r31, r6, lbl_0000C690@l
/* 0000BAFC 80630000 */ lwz r3, 0(r3)
/* 0000BB00 83C30008 */ lwz r30, 8(r3)
/* 0000BB04 4BFF4649 */ bl mathutil_mtxA_push
/* 0000BB08 38610044 */ addi r3, r1, 0x44
/* 0000BB0C 4BFF4641 */ bl mathutil_mtxA_to_mtx
/* 0000BB10 4BFF463D */ bl mathutil_mtxA_from_mtxB
/* 0000BB14 38610044 */ addi r3, r1, 0x44
/* 0000BB18 4BFF4635 */ bl mathutil_mtxA_mult_right
/* 0000BB1C C0380000 */ lfs f1, 0(r24)
/* 0000BB20 C0580004 */ lfs f2, 4(r24)
/* 0000BB24 C0180008 */ lfs f0, 8(r24)
/* 0000BB28 EC210072 */ fmuls f1, f1, f1
/* 0000BB2C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000BB30 EC20083A */ fmadds f1, f0, f0, f1
/* 0000BB34 4BFF4619 */ bl mathutil_sqrt
/* 0000BB38 C01F008C */ lfs f0, 0x8c(r31)
/* 0000BB3C C05F0090 */ lfs f2, 0x90(r31)
/* 0000BB40 EFE00072 */ fmuls f31, f0, f1
/* 0000BB44 C01F0020 */ lfs f0, 0x20(r31)
/* 0000BB48 EFFF1024 */ fdivs f31, f31, f2
/* 0000BB4C FC1F0040 */ fcmpo cr0, f31, f0
/* 0000BB50 40810008 */ ble lbl_0000BB58
/* 0000BB54 FFE00090 */ fmr f31, f0
lbl_0000BB58:
/* 0000BB58 FC20F890 */ fmr f1, f31
/* 0000BB5C 4BFF45F1 */ bl avdisp_set_alpha
/* 0000BB60 4BFF45ED */ bl mathutil_mtxA_push
/* 0000BB64 3861002C */ addi r3, r1, 0x2c
/* 0000BB68 38830004 */ addi r4, r3, 4
/* 0000BB6C 38630008 */ addi r3, r3, 8
/* 0000BB70 3F20E000 */ lis r25, 0xe000
/* 0000BB74 C059000C */ lfs f2, 0xc(r25)
/* 0000BB78 C039001C */ lfs f1, 0x1c(r25)
/* 0000BB7C C019002C */ lfs f0, 0x2c(r25)
/* 0000BB80 D041002C */ stfs f2, 0x2c(r1)
/* 0000BB84 D0240000 */ stfs f1, 0(r4)
/* 0000BB88 D0030000 */ stfs f0, 0(r3)
/* 0000BB8C 38610038 */ addi r3, r1, 0x38
/* 0000BB90 C05F0000 */ lfs f2, 0(r31)
/* 0000BB94 C03F0020 */ lfs f1, 0x20(r31)
/* 0000BB98 FC601090 */ fmr f3, f2
/* 0000BB9C 4BFF45B1 */ bl mathutil_mtxA_tf_vec_xyz
/* 0000BBA0 C3C10040 */ lfs f30, 0x40(r1)
/* 0000BBA4 C0210038 */ lfs f1, 0x38(r1)
/* 0000BBA8 EC1E07B2 */ fmuls f0, f30, f30
/* 0000BBAC EC210072 */ fmuls f1, f1, f1
/* 0000BBB0 EC21002A */ fadds f1, f1, f0
/* 0000BBB4 4BFF4599 */ bl mathutil_sqrt
/* 0000BBB8 D0210038 */ stfs f1, 0x38(r1)
/* 0000BBBC 38610038 */ addi r3, r1, 0x38
/* 0000BBC0 C01F0000 */ lfs f0, 0(r31)
/* 0000BBC4 D0010040 */ stfs f0, 0x40(r1)
/* 0000BBC8 4BFF4585 */ bl mathutil_vec_normalize_len
/* 0000BBCC 4BFF4581 */ bl mathutil_mtxA_sq_from_identity
/* 0000BBD0 C021003C */ lfs f1, 0x3c(r1)
/* 0000BBD4 C0410038 */ lfs f2, 0x38(r1)
/* 0000BBD8 4BFF4575 */ bl mathutil_mtxA_rotate_z_sin_cos
/* 0000BBDC FC00F210 */ fabs f0, f30
/* 0000BBE0 C83F0098 */ lfd f1, 0x98(r31)
/* 0000BBE4 C0410034 */ lfs f2, 0x34(r1)
/* 0000BBE8 C09F0040 */ lfs f4, 0x40(r31)
/* 0000BBEC FC210032 */ fmul f1, f1, f0
/* 0000BBF0 C001002C */ lfs f0, 0x2c(r1)
/* 0000BBF4 C0610030 */ lfs f3, 0x30(r1)
/* 0000BBF8 ECA22028 */ fsubs f5, f2, f4
/* 0000BBFC C05F00A0 */ lfs f2, 0xa0(r31)
/* 0000BC00 FC200818 */ frsp f1, f1
/* 0000BC04 EC431028 */ fsubs f2, f3, f2
/* 0000BC08 EC002028 */ fsubs f0, f0, f4
/* 0000BC0C D019000C */ stfs f0, 0xc(r25)
/* 0000BC10 D059001C */ stfs f2, 0x1c(r25)
/* 0000BC14 D0B9002C */ stfs f5, 0x2c(r25)
/* 0000BC18 EC01F82A */ fadds f0, f1, f31
/* 0000BC1C C07F0020 */ lfs f3, 0x20(r31)
/* 0000BC20 EC43002A */ fadds f2, f3, f0
/* 0000BC24 4BFF4529 */ bl mathutil_mtxA_scale_xyz
/* 0000BC28 3C800000 */ lis r4, mathutilData@ha
/* 0000BC2C 3C600000 */ lis r3, lbl_0000D3A0@ha
/* 0000BC30 3B640000 */ addi r27, r4, mathutilData@l
/* 0000BC34 3B230000 */ addi r25, r3, lbl_0000D3A0@l
/* 0000BC38 3BA00000 */ li r29, 0
/* 0000BC3C 3F404330 */ lis r26, 0x4330
lbl_0000BC40:
/* 0000BC40 C03F00A0 */ lfs f1, 0xa0(r31)
/* 0000BC44 C05F0000 */ lfs f2, 0(r31)
/* 0000BC48 C07F0058 */ lfs f3, 0x58(r31)
/* 0000BC4C 4BFF4501 */ bl mathutil_mtxA_translate_xyz
/* 0000BC50 3860FC00 */ li r3, -1024
/* 0000BC54 4BFF44F9 */ bl mathutil_mtxA_rotate_z
/* 0000BC58 807B0000 */ lwz r3, 0(r27)
/* 0000BC5C 38800000 */ li r4, 0
/* 0000BC60 4BFF44ED */ bl u_gxutil_upload_some_mtx
/* 0000BC64 6FA08000 */ xoris r0, r29, 0x8000
/* 0000BC68 C01F00A8 */ lfs f0, 0xa8(r31)
/* 0000BC6C 9001007C */ stw r0, 0x7c(r1)
/* 0000BC70 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000BC74 C8430000 */ lfd f2, lbl_0000C6D8@l(r3)
/* 0000BC78 93410078 */ stw r26, 0x78(r1)
/* 0000BC7C C07F00A4 */ lfs f3, 0xa4(r31)
/* 0000BC80 C8210078 */ lfd f1, 0x78(r1)
/* 0000BC84 C09F0020 */ lfs f4, 0x20(r31)
/* 0000BC88 EC211028 */ fsubs f1, f1, f2
/* 0000BC8C EC010024 */ fdivs f0, f1, f0
/* 0000BC90 EC030032 */ fmuls f0, f3, f0
/* 0000BC94 EC240028 */ fsubs f1, f4, f0
/* 0000BC98 4BFF44B5 */ bl avdisp_set_alpha
/* 0000BC9C 578016BA */ rlwinm r0, r28, 2, 0x1a, 0x1d
/* 0000BCA0 7C790214 */ add r3, r25, r0
/* 0000BCA4 80030000 */ lwz r0, 0(r3)
/* 0000BCA8 38800002 */ li r4, 2
/* 0000BCAC 54001838 */ slwi r0, r0, 3
/* 0000BCB0 7F1E002E */ lwzx r24, r30, r0
/* 0000BCB4 7F03C378 */ mr r3, r24
/* 0000BCB8 4BFF4495 */ bl set_shape_flags_in_model
/* 0000BCBC 38780000 */ addi r3, r24, 0
/* 0000BCC0 3B9C0001 */ addi r28, r28, 1
/* 0000BCC4 4BFF4489 */ bl avdisp_draw_model_unculled_sort_none
/* 0000BCC8 3BBD0001 */ addi r29, r29, 1
/* 0000BCCC 2C1D0005 */ cmpwi r29, 5
/* 0000BCD0 4180FF70 */ blt lbl_0000BC40
/* 0000BCD4 4BFF4479 */ bl mathutil_mtxA_pop
/* 0000BCD8 4BFF4475 */ bl mathutil_mtxA_push
/* 0000BCDC 38610014 */ addi r3, r1, 0x14
/* 0000BCE0 38830004 */ addi r4, r3, 4
/* 0000BCE4 38630008 */ addi r3, r3, 8
/* 0000BCE8 3F20E000 */ lis r25, 0xe000
/* 0000BCEC C059000C */ lfs f2, 0xc(r25)
/* 0000BCF0 C039001C */ lfs f1, 0x1c(r25)
/* 0000BCF4 C019002C */ lfs f0, 0x2c(r25)
/* 0000BCF8 D0410014 */ stfs f2, 0x14(r1)
/* 0000BCFC D0240000 */ stfs f1, 0(r4)
/* 0000BD00 D0030000 */ stfs f0, 0(r3)
/* 0000BD04 38610020 */ addi r3, r1, 0x20
/* 0000BD08 C05F0000 */ lfs f2, 0(r31)
/* 0000BD0C C03F0080 */ lfs f1, 0x80(r31)
/* 0000BD10 FC601090 */ fmr f3, f2
/* 0000BD14 4BFF4439 */ bl mathutil_mtxA_tf_vec_xyz
/* 0000BD18 C3C10028 */ lfs f30, 0x28(r1)
/* 0000BD1C C0A10020 */ lfs f5, 0x20(r1)
/* 0000BD20 EC1E07B2 */ fmuls f0, f30, f30
/* 0000BD24 EC250172 */ fmuls f1, f5, f5
/* 0000BD28 EC21002A */ fadds f1, f1, f0
/* 0000BD2C 4BFF4421 */ bl mathutil_sqrt
/* 0000BD30 D0210020 */ stfs f1, 0x20(r1)
/* 0000BD34 38610020 */ addi r3, r1, 0x20
/* 0000BD38 C01F0000 */ lfs f0, 0(r31)
/* 0000BD3C D0010028 */ stfs f0, 0x28(r1)
/* 0000BD40 4BFF440D */ bl mathutil_vec_normalize_len
/* 0000BD44 4BFF4409 */ bl mathutil_mtxA_sq_from_identity
/* 0000BD48 C0210024 */ lfs f1, 0x24(r1)
/* 0000BD4C C0410020 */ lfs f2, 0x20(r1)
/* 0000BD50 4BFF43FD */ bl mathutil_mtxA_rotate_z_sin_cos
/* 0000BD54 FC00F210 */ fabs f0, f30
/* 0000BD58 C85F0098 */ lfd f2, 0x98(r31)
/* 0000BD5C C021001C */ lfs f1, 0x1c(r1)
/* 0000BD60 C07F0040 */ lfs f3, 0x40(r31)
/* 0000BD64 FCA20032 */ fmul f5, f2, f0
/* 0000BD68 C0010014 */ lfs f0, 0x14(r1)
/* 0000BD6C C0410018 */ lfs f2, 0x18(r1)
/* 0000BD70 EC811828 */ fsubs f4, f1, f3
/* 0000BD74 C03F00A0 */ lfs f1, 0xa0(r31)
/* 0000BD78 FCA02818 */ frsp f5, f5
/* 0000BD7C EC220828 */ fsubs f1, f2, f1
/* 0000BD80 EC03002A */ fadds f0, f3, f0
/* 0000BD84 D019000C */ stfs f0, 0xc(r25)
/* 0000BD88 D039001C */ stfs f1, 0x1c(r25)
/* 0000BD8C D099002C */ stfs f4, 0x2c(r25)
/* 0000BD90 EC05F82A */ fadds f0, f5, f31
/* 0000BD94 FC202850 */ fneg f1, f5
/* 0000BD98 C07F0020 */ lfs f3, 0x20(r31)
/* 0000BD9C EC43002A */ fadds f2, f3, f0
/* 0000BDA0 4BFF43AD */ bl mathutil_mtxA_scale_xyz
/* 0000BDA4 3C800000 */ lis r4, mathutilData@ha
/* 0000BDA8 3C600000 */ lis r3, lbl_0000D3A0@ha
/* 0000BDAC 3B240000 */ addi r25, r4, mathutilData@l
/* 0000BDB0 3B630000 */ addi r27, r3, lbl_0000D3A0@l
/* 0000BDB4 3BA00000 */ li r29, 0
/* 0000BDB8 3F404330 */ lis r26, 0x4330
lbl_0000BDBC:
/* 0000BDBC C03F00A0 */ lfs f1, 0xa0(r31)
/* 0000BDC0 C05F0000 */ lfs f2, 0(r31)
/* 0000BDC4 C07F0058 */ lfs f3, 0x58(r31)
/* 0000BDC8 4BFF4385 */ bl mathutil_mtxA_translate_xyz
/* 0000BDCC 3860FC00 */ li r3, -1024
/* 0000BDD0 4BFF437D */ bl mathutil_mtxA_rotate_z
/* 0000BDD4 80790000 */ lwz r3, 0(r25)
/* 0000BDD8 38800000 */ li r4, 0
/* 0000BDDC 4BFF4371 */ bl u_gxutil_upload_some_mtx
/* 0000BDE0 6FA08000 */ xoris r0, r29, 0x8000
/* 0000BDE4 C01F00A8 */ lfs f0, 0xa8(r31)
/* 0000BDE8 9001007C */ stw r0, 0x7c(r1)
/* 0000BDEC 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000BDF0 C8430000 */ lfd f2, lbl_0000C6D8@l(r3)
/* 0000BDF4 93410078 */ stw r26, 0x78(r1)
/* 0000BDF8 C07F00A4 */ lfs f3, 0xa4(r31)
/* 0000BDFC C8210078 */ lfd f1, 0x78(r1)
/* 0000BE00 C09F0020 */ lfs f4, 0x20(r31)
/* 0000BE04 EC211028 */ fsubs f1, f1, f2
/* 0000BE08 EC010024 */ fdivs f0, f1, f0
/* 0000BE0C EC030032 */ fmuls f0, f3, f0
/* 0000BE10 EC240028 */ fsubs f1, f4, f0
/* 0000BE14 4BFF4339 */ bl avdisp_set_alpha
/* 0000BE18 578016BA */ rlwinm r0, r28, 2, 0x1a, 0x1d
/* 0000BE1C 7C7B0214 */ add r3, r27, r0
/* 0000BE20 80030000 */ lwz r0, 0(r3)
/* 0000BE24 38800002 */ li r4, 2
/* 0000BE28 54001838 */ slwi r0, r0, 3
/* 0000BE2C 7F1E002E */ lwzx r24, r30, r0
/* 0000BE30 7F03C378 */ mr r3, r24
/* 0000BE34 4BFF4319 */ bl set_shape_flags_in_model
/* 0000BE38 38780000 */ addi r3, r24, 0
/* 0000BE3C 3B9C0001 */ addi r28, r28, 1
/* 0000BE40 4BFF430D */ bl avdisp_draw_model_unculled_sort_none
/* 0000BE44 3BBD0001 */ addi r29, r29, 1
/* 0000BE48 2C1D0005 */ cmpwi r29, 5
/* 0000BE4C 4180FF70 */ blt lbl_0000BDBC
/* 0000BE50 4BFF42FD */ bl mathutil_mtxA_pop
/* 0000BE54 4BFF42F9 */ bl mathutil_mtxA_pop
/* 0000BE58 BB010080 */ lmw r24, 0x80(r1)
/* 0000BE5C 800100B4 */ lwz r0, 0xb4(r1)
/* 0000BE60 CBE100A8 */ lfd f31, 0xa8(r1)
/* 0000BE64 CBC100A0 */ lfd f30, 0xa0(r1)
/* 0000BE68 7C0803A6 */ mtlr r0
/* 0000BE6C 382100B0 */ addi r1, r1, 0xb0
/* 0000BE70 4E800020 */ blr 

# 2
.section .ctors
    # 0xBE74
#    .4byte 0x00000000

# 3
.section .dtors
    # 0xBE78
#    .4byte 0x00000000

# 4
.section .rodata
.if 0
lbl_0000BE80:
    # 0xBE80
    .4byte 0x003A003B
.endif
    .4byte 0x003F0053
    .4byte 0x00540055
    .4byte 0x00560057
    .4byte 0x02000201
    .4byte 0x02020203
    .4byte 0x02040205
    .4byte 0x02060207
    .4byte 0x02080209
    .4byte 0x020A020B
    .4byte 0x020C020D
    .4byte 0x020E0000
lbl_0000BEB0:
    # 0xBEB0
    .4byte 0x00000000
lbl_0000BEB4:
    # 0xBEB4
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x00000000
    .4byte 0x3FA11111
    .4byte 0x11111111
    .4byte 0x3FBBBBBB
    .4byte 0xBBBBBBBC
    .4byte 0x46FFFE00
    .4byte 0x00000000
lbl_0000BEE0:
    # 0xBEE0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40100000
    .4byte 0x00000000
    .4byte 0x40440000
    .4byte 0x00000000
    .4byte lbl_0000CBD8
    .4byte lbl_0000CC20
    .4byte lbl_0000CC68
    .4byte lbl_0000CCB0
    .4byte lbl_0000CCC0
    .4byte lbl_0000CCD0
    .4byte 0x5A5A3C00
    .4byte lbl_0000CBD8
    .4byte lbl_0000CC20
    .4byte lbl_0000CC68
    .4byte lbl_0000CCB0
    .4byte lbl_0000CCC0
    .4byte lbl_0000CCD0
    .4byte 0x1E1E1700
    .4byte 0x0010000F
    .4byte 0x00110000
    .4byte 0x000D0009
    .4byte 0x000E000A
    .4byte 0x000B000C
    .4byte 0x00060002
    .4byte 0x00070003
    .4byte 0x00040005
    .4byte 0x40180BFB
    .4byte 0x15B573EB
    .4byte 0x402E025A
    .4byte 0xEE631F8A
    .4byte 0x40A77000
    .4byte 0x00000000
    .4byte 0x4095E000
    .4byte 0x00000000
    .4byte 0x3FEF3333
    .4byte 0x33333333
    .4byte 0x3F9EB851
    .4byte 0xEB851EB8
    .4byte 0x40518000
    .4byte 0x00000000
    .4byte 0x435C0000
    .4byte 0x43340000
    .4byte 0x41D80000
    .4byte 0x41166666
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x00000000
    .4byte 0x403E0000
    .4byte 0x00000000
    .4byte 0x402C0000
    .4byte 0x00000000
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x405E0000
    .4byte 0x00000000
lbl_0000BFD0:
    # 0xBFD0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000BFE0:
    # 0xBFE0
    .4byte 0x40580000
    .4byte 0x00000000
lbl_0000BFE8:
    # 0xBFE8
    .4byte 0x3FC1C71C
    .4byte 0x71C71C72
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3EED097B
    .4byte 0x00000000
    .4byte 0x3FA18EEC
    .4byte 0xAF953EDB
lbl_0000C010:
    # 0xC010
    .4byte 0x402AAAAA
    .4byte 0xAAAAAAAA
    .4byte 0x40340000
    .4byte 0x00000000
    .4byte 0x41800000
    .4byte 0x3E75C28F
    .4byte 0x3CA3D70A
    .4byte 0x3D8F5C29
lbl_0000C030:
    # 0xC030
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43138000
    .4byte 0x43C54000
    .4byte 0x42480000
    .4byte 0x469C4000
    .4byte 0x43C80000
    .4byte 0x3E19999A
    .4byte 0x3DCCCCCD
    .4byte 0x41700000
    .4byte 0x3F97B425
    .4byte 0xED097B42
    .4byte 0x0013000B
    .4byte 0x00210003
    .4byte 0x00110017
    .4byte 0x000F000D
    .4byte 0x00150023
    .4byte 0x0012000A
    .4byte 0x00240002
    .4byte 0x00100016
    .4byte 0x000E000C
    .4byte 0x00140022
    .4byte 0x0018001D
    .4byte 0x001A0004
    .4byte 0x001F001C
    .4byte 0x0019001E
    .4byte 0x0020001B
    .4byte 0x00000000
    .4byte 0x40F5F900
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x3FA99999
    .4byte 0x9999999A
    .4byte 0x3FE34395
    .4byte 0x810624DD
    .4byte 0x3F50624D
    .4byte 0xD2F1A9FC
    .4byte 0x42400000
    .4byte 0x43240000
    .4byte 0x3C03126F
    .4byte 0xBE19999A
    .4byte 0x00000000
    .4byte 0x42C80000
    .4byte 0xC32A0000
    .4byte 0x00000000
    .4byte 0x42C80000
    .4byte 0xC4098000
    .4byte 0x00740075
    .4byte 0x00760000
    .4byte 0x404E0000
    .4byte 0x00000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x40711111
    .4byte 0x11111111
    .4byte 0xC2FA0000
    .4byte 0x41C80000
    .4byte 0x3F911111
    .4byte 0x11111111
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x3E99999A
    .4byte 0x3F733333
    .4byte 0x3EE66666
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0xBFC99999
    .4byte 0x9999999A
    .4byte 0x3FB7B425
    .4byte 0xED097B42
    .4byte 0xC0140000
    .4byte 0x00000000
    .4byte 0xC04E0000
    .4byte 0x00000000
    .4byte 0x3FEF5C28
    .4byte 0xF5C28F5C
    .4byte 0x3FEE6666
    .4byte 0x66666666
    .4byte 0x3FECCCCC
    .4byte 0xCCCCCCCD
    .4byte 0x40140000
    .4byte 0x00000000
    .4byte 0x3FD99999
    .4byte 0x9999999A
    .4byte 0xBE0E38E4
    .4byte 0x3991A2B4
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0xC004CCCC
    .4byte 0xCCCCCCCD
    .4byte 0xC018CCCC
    .4byte 0xCCCCCCCD
    .4byte 0xBFF00000
    .4byte 0x00000000
    .4byte 0x3FEF851E
    .4byte 0xB851EB85
    .4byte 0x409C2000
    .4byte 0x00000000
    .4byte 0x40350000
    .4byte 0x00000000
    .4byte 0x40B38800
    .4byte 0x00000000
    .4byte 0x40790000
    .4byte 0x00000000
    .4byte 0x407B8000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x00000000
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0xBBB2674F
    .4byte 0x00000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x3F91EB85
    .4byte 0x1EB851EC
    .4byte 0x40A5E000
    .4byte 0x00000000
    .4byte 0x3FD33333
    .4byte 0x33333333
    .4byte 0x3F14F8B5
    .4byte 0x88E368F1
    .4byte 0x3FEEB851
    .4byte 0xEB851EB8
    .4byte 0x34000000
    .4byte 0x00000000
    .4byte 0xBFE4CCCC
    .4byte 0xCCCCCCCD
    .4byte 0xBFE99999
    .4byte 0x9999999A
    .4byte 0x40390000
    .4byte 0x00000000
    .4byte 0x3F86872B
    .4byte 0x020C49BA
    .4byte 0x3F40624D
    .4byte 0xD2F1A9FC
    .4byte 0x3F666666
    .4byte 0x3E0F5C29
    .4byte 0x3CF5C28F
    .4byte 0x00000000
lbl_0000C2A8:
    # 0xC2A8
    .4byte 0x3FD38E38
    .4byte 0xE38E38E3
    .4byte 0x3F711111
    .4byte 0x11111111
    .4byte 0x40740000
    .4byte 0x00000000
    .4byte 0x406E0000
    .4byte 0x00000000
lbl_0000C2C8:
    # 0xC2C8
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x40400000
    .4byte 0x34000000
    .4byte 0x3FE80000
    .4byte 0x00000000
    .4byte 0x3FC99999
    .4byte 0x9999999A
lbl_0000C2F0:
    # 0xC2F0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3F911111
    .4byte 0x11111111
    .4byte 0x3FA47AE1
    .4byte 0x47AE147B
    .4byte 0x3FA99999
    .4byte 0x9999999A
    .4byte 0x431D0000
    .4byte 0x43C3C000
    .4byte 0x43180000
    .4byte 0x43C10000
    .4byte 0x40490000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x407E0000
    .4byte 0x00000000
    .4byte 0x43F00000
    .4byte 0x00000000
    .4byte 0x3FF33333
    .4byte 0x33333333
    #.balign 4
lbl_0000C348:
    # 0xC348
    .4byte lbl_00008184
    .4byte lbl_00008198
    .4byte lbl_00008234
    .4byte lbl_000082BC
lbl_0000C358:
    # 0xC358
    .4byte 0x3FE00000
    .4byte 0x00000000
lbl_0000C360:
    # 0xC360
    .4byte 0x41900000
    .4byte 0x43040000
    .4byte 0x3DE147AE
    .4byte 0x41700000
    .4byte 0x41800000
    .4byte 0x41200000
    .4byte 0x3F000000
    .4byte 0x3EA66666
    .4byte 0x42A80000
    .4byte 0x42200000
    .4byte 0x43920000
    .4byte 0x41400000
    .4byte 0x43E20000
    .4byte 0x42400000
    .4byte 0x43760000
    .4byte 0x44040000
    .4byte 0x4075E000
    .4byte 0x00000000
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x43C20000
    .4byte 0x3F800000
    .4byte 0x43070000
    .4byte 0x43570000
lbl_0000C3C0:
    # 0xC3C0
    .4byte 0x43300000
    .4byte 0x80000000
lbl_0000C3C8:
    # 0xC3C8
    .4byte 0x43480000
lbl_0000C3CC:
    # 0xC3CC
    .4byte 0x432A0000
    .4byte 0x40320000
    .4byte 0x00000000
    .4byte 0x40420000
    .4byte 0x00000000
    .4byte 0x40440000
    .4byte 0x00000000
    .4byte 0x40200000
    .4byte 0x00000000
    .4byte 0x40520000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x402E0000
    .4byte 0x00000000
    .4byte 0x404B8000
    .4byte 0x00000000
    .4byte 0x4060C708
    .4byte 0xFCDDC046
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FD00000
    .4byte 0x00000000
    .4byte 0x3E800000
    .4byte 0x00000000
lbl_0000C430:
    # 0xC430
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x40330000
    .4byte 0x00000000
    .4byte 0x0B250B23
    .4byte 0x0B260B24
    .4byte 0x40340000
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x00000000
    .4byte 0x4061A000
    .4byte 0x00000000
    .4byte 0x3FE68F5C
    .4byte 0x28F5C28F
    .4byte 0xC0100000
    .4byte 0x00000000
    .4byte 0xC0800000
    .4byte 0x00000000
    .4byte 0x40220000
    .4byte 0x00000000
    .4byte 0x41980000
    .4byte 0x00000000
    .4byte 0x40490000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x3E266666
    .4byte 0x41100000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x40140000
    .4byte 0x00000000
    .4byte 0x40530000
    .4byte 0x00000000
    .4byte 0x40626000
    .4byte 0x00000000
    .4byte 0x40508000
    .4byte 0x00000000
    .4byte 0x40300000
    .4byte 0x00000000
    .4byte 0x40612000
    .4byte 0x00000000
    .4byte 0x404D0000
    .4byte 0x00000000
    .4byte 0x408F4000
    .4byte 0x00000000
    .4byte 0x3F9EB851
    .4byte 0xEB851EB8
    .4byte 0x40260000
    .4byte 0x00000000
    .4byte 0x40504000
    .4byte 0x00000000
    .4byte 0x40100000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x3F59999A
    .4byte 0x00000000
    .4byte 0x404B0000
    .4byte 0x00000000
    .4byte 0x404E0000
    .4byte 0x00000000
    .4byte 0x40418000
    .4byte 0x00000000
    .4byte 0x406FE000
    .4byte 0x00000000
    .4byte 0x42F00000
    .4byte 0x00000000
    .4byte 0x40540000
    .4byte 0x00000000
lbl_0000C548:
    # 0xC548
    .4byte 0x43A00000
    .4byte 0x43C40000
    .4byte 0x424C0000
    .4byte 0x40B00000
    .4byte 0x43080000
    .4byte 0x43BE0000
    .4byte 0x3FB55555
    .asciz "UUUU@x@"
    .balign 4
    .4byte 0x00000000
    .4byte 0xC0372AAA
    .4byte 0xAAAAAAAB
    .4byte 0x40280000
    .4byte 0x00000000
    .4byte 0x4016AAAA
    .4byte 0xAAAAAAAB
    .4byte 0x40480000
    .4byte 0x00000000
    .4byte 0x3FA00000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40604000
    .4byte 0x00000000
    .4byte 0x405F4000
    .4byte 0x00000000
    .4byte 0x437F0000
    .4byte 0x3D8F5C29
lbl_0000C5B8:
    # 0xC5B8
    .4byte 0x43300000
    .4byte 0x00000000
lbl_0000C5C0:
    # 0xC5C0
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x40890000
    .4byte 0x00000000
    .4byte 0xC0380000
    .4byte 0x00000000
    .4byte 0x406E0000
    .4byte 0x00000000
    .4byte 0x42920000
    .4byte 0x3F900000
    .4byte 0x42960000
    .4byte 0x429A0000
    .4byte 0x3DA3D70A
    .4byte 0x3DB851EC
    .4byte 0x3F333333
    .4byte 0x3F51EB85
    .4byte 0x43380000
    .4byte 0x43C30000
    .4byte 0x421C0000
    .4byte 0x40A00000
    .4byte 0x40360000
    .4byte 0x00000000
    .4byte 0x405E0000
    .4byte 0x00000000
    .4byte 0x403A0000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x0B1D0B1B
    .4byte 0x0B1E0B1C
    .4byte 0x42A00000
    .4byte 0x40C00000
    .4byte 0x41C00000
    .4byte 0x42380000
    .4byte 0x42140000
    .4byte 0x43E28000
    .4byte 0x423C0000
    .4byte 0x43D30000
    .4byte 0x43DA0000
    .4byte 0x43CF8000
    .4byte 0x43D40000
    .4byte 0x433E0000
    .4byte 0x43200000
    .4byte 0x42D00000
    .4byte 0x45000000
    .4byte 0x42680000
    .4byte 0x42280000
    .4byte 0x42300000
    .4byte 0x42840000
    .4byte 0x42CE0000
    .4byte 0x41C80000
    .4byte 0x40478000
    .4byte 0x00000000
lbl_0000C690:
    # 0xC690
    .4byte 0x00000000
    .4byte 0x3F7AE148
    .4byte 0xBDCCCCCD
    .4byte 0x3E99999A
    .4byte 0x3A83126F
    .4byte 0x3F8147AE
    .4byte 0x42700000
    .4byte 0x3C888889
    .4byte 0x3F800000
    .4byte 0x447A0000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x3FC00000
    .4byte 0x46FFFE00
    .4byte 0x3E4CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x3F000000
    .4byte 0x3F666666
lbl_0000C6D8:
    # 0xC6D8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x43660000
    .4byte 0x3F7FBE77
    .4byte 0x3C23D70A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x40E66666
    .4byte 0x3ECCCCCD
    .4byte 0x3FE66666
    .4byte 0x3F333333
    .4byte 0x3D23D70A
    .4byte 0x3E800000
    .4byte 0xBF800000
    .4byte 0x3E3851EC
    .4byte 0xBF000000
    .4byte 0x43580000
    .4byte 0x42F00000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x3CA3D70A
    .4byte 0x3F4CCCCD
    .4byte 0x40A00000

# 5
.section .data
.if 0
lbl_0000C740:
    # 0xC740
    .4byte 0x00970098
.endif
    .4byte 0x00990000
lbl_0000C748:
    # 0xC748
    .4byte lbl_0000101C
    .4byte lbl_000011CC
    .4byte lbl_00001538
    .4byte lbl_000015D8
    .4byte lbl_0000178C
    .4byte lbl_00001B08
    .4byte lbl_00001BB4
    .4byte lbl_000023BC
    .4byte lbl_00002408
    .4byte lbl_00001CE4
    .4byte lbl_00001DE0
    .4byte lbl_000024D0
    .4byte lbl_0000253C
    .4byte lbl_000026BC
    .4byte lbl_00002890
    .4byte lbl_00002A2C
    .4byte lbl_00002AE8
    .4byte lbl_00002C18
    .4byte lbl_00002D24
    .4byte lbl_00002E04
    .4byte lbl_00002E94
    .4byte lbl_00002EB4
    .4byte lbl_00002FF4
    .4byte lbl_00003298
    .4byte lbl_00003374
    .4byte lbl_000035B8
    .4byte lbl_00003860
    .4byte lbl_000038D4
    .4byte lbl_00003AD0
lbl_0000C7BC:
    # 0xC7BC
    .4byte lbl_00004FA8
    .4byte lbl_00005008
    .4byte lbl_00005044
    .4byte lbl_0000509C
lbl_0000C7CC:
    # 0xC7CC
    .asciz "RELOCATION MINI_PILOT LOADED"
    .balign 4
lbl_0000C7EC:
    # 0xC7EC
    .asciz "RELOCATION MINI_PILOT PURGED"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .balign 4
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .balign 4
    .asciz "mini_pilot.c"
    .balign 4
    .4byte 0x0A000000
lbl_0000C88C:
    # 0xC88C
    .4byte 0x40B9999A
    .4byte 0x42580000
    .4byte 0x438F0000
    .4byte 0x00000000
    .4byte 0xC0B9999A
    .4byte 0x42580000
    .4byte 0x438F0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x423B999A
    .4byte 0x438F0000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x42480000
    .4byte 0x428C0000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x428C0000
    .4byte 0x43110000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x43480000
    .4byte 0x00020000
    .4byte 0xC1700000
    .4byte 0x4278CCCD
    .4byte 0x43987333
    .4byte 0x00020000
    .4byte 0x41700000
    .4byte 0x4278CCCD
    .4byte 0x43987333
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xFFFF0000
lbl_0000C91C:
    # 0xC91C
    .4byte 0x00000000
    .4byte 0x42480000
    .4byte 0xC3A50000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x42140000
    .4byte 0xC3C08000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x422C0000
    .4byte 0xC3FC8000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x420C0000
    .4byte 0xC4150000
    .4byte 0x00020000
    .4byte 0xC29C0000
    .4byte 0x41F00000
    .4byte 0xC3928000
    .4byte 0x00020000
    .4byte 0x429C0000
    .4byte 0x41F00000
    .4byte 0xC3928000
    .4byte 0x00020000
    .4byte 0xC2A00000
    .4byte 0x41F00000
    .4byte 0xC40FC000
    .4byte 0x00020000
    .4byte 0x42A00000
    .4byte 0x41F00000
    .4byte 0xC40FC000
    .4byte 0x00020000
    .4byte 0xC1D00000
    .4byte 0x41900000
    .4byte 0xC41C4000
    .4byte 0x00020000
    .4byte 0x41D00000
    .4byte 0x41900000
    .4byte 0xC41C4000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xFFFF0000
lbl_0000C9CC:
    # 0xC9CC
    .4byte 0xC2C80000
    .4byte 0x42700000
    .4byte 0x42960000
    .4byte 0x00020000
    .4byte 0x42C80000
    .4byte 0x42700000
    .4byte 0x42960000
    .4byte 0x00020000
    .4byte 0xC32C0000
    .4byte 0x42700000
    .4byte 0xC2820000
    .4byte 0x00020000
    .4byte 0x432C0000
    .4byte 0x42700000
    .4byte 0xC2820000
    .4byte 0x00020000
    .4byte 0xC36A0000
    .4byte 0x420C0000
    .4byte 0xC3F48000
    .4byte 0x00020000
    .4byte 0x436A0000
    .4byte 0x420C0000
    .4byte 0xC3F48000
    .4byte 0x00020000
    .4byte 0xC3160000
    .4byte 0x41F00000
    .4byte 0xC4080000
    .4byte 0x00020000
    .4byte 0x43160000
    .4byte 0x41F00000
    .4byte 0xC4080000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xFFFF0000
lbl_0000CA5C:
    # 0xCA5C
    .4byte 0xC3390000
    .4byte 0x42680000
    .4byte 0x42380000
    .4byte 0x00020000
    .4byte 0x43390000
    .4byte 0x42680000
    .4byte 0x42380000
    .4byte 0x00020000
    .4byte 0xC3A90000
    .4byte 0x425C0000
    .4byte 0xC3070000
    .4byte 0x00020000
    .4byte 0x43A90000
    .4byte 0x425C0000
    .4byte 0xC3070000
    .4byte 0x00020000
    .4byte 0xC3B20000
    .4byte 0x42200000
    .4byte 0xC3C58000
    .4byte 0x00020000
    .4byte 0x43B20000
    .4byte 0x42200000
    .4byte 0xC3C58000
    .4byte 0x00020000
    .4byte 0xC3878000
    .4byte 0x42480000
    .4byte 0xC3E10000
    .4byte 0x00020000
    .4byte 0x43878000
    .4byte 0x42480000
    .4byte 0xC3E10000
    .4byte 0x00020000
    .4byte 0xC3358000
    .4byte 0x423C0000
    .4byte 0xC3FD0000
    .4byte 0x00020000
    .4byte 0x43358000
    .4byte 0x423C0000
    .4byte 0xC3FD0000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xFFFF0000
lbl_0000CB0C:
    # 0xCB0C
    .4byte lbl_0000C91C
    .4byte lbl_0000C9CC
    .4byte lbl_0000CA5C
lbl_0000CB18:
    # 0xCB18
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3480000
    .4byte 0x43480000
    .4byte 0x19000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3E10000
    .4byte 0x43160000
    .4byte 0x14000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC4228000
    .4byte 0x43020000
    .4byte 0x0E000000
lbl_0000CB54:
    # 0xCB54
    .4byte 0xC3AF0000
    .4byte 0x41700000
    .4byte 0xC3C80000
    .4byte 0x43480000
    .4byte 0x19000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3C80000
    .4byte 0x43480000
    .4byte 0x1B000000
    .4byte 0x43AF0000
    .4byte 0x41700000
    .4byte 0xC3C70000
    .4byte 0x43480000
    .4byte 0x19000000
lbl_0000CB90:
    # 0xCB90
    .4byte 0xC3F00000
    .4byte 0x41200000
    .4byte 0xC39D8000
    .4byte 0x43160000
    .4byte 0x17000000
    .4byte 0x43F00000
    .4byte 0x41200000
    .4byte 0xC39D8000
    .4byte 0x43160000
    .4byte 0x17000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC4160000
    .4byte 0x43160000
    .4byte 0x0F000000
lbl_0000CBCC:
    # 0xCBCC
    .4byte lbl_0000CB18
    .4byte lbl_0000CB54
    .4byte lbl_0000CB90
lbl_0000CBD8:
    # 0xCBD8
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3480000
    .4byte 0x42A00000
    .4byte 0x42A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3E10000
    .4byte 0x41F00000
    .4byte 0x41F00000
    .4byte 0x03000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC4228000
    .4byte 0x41C00000
    .4byte 0x420C0000
    .4byte 0x00000000
lbl_0000CC20:
    # 0xCC20
    .4byte 0xC3AF0000
    .4byte 0x41B00000
    .4byte 0xC3C80000
    .4byte 0x42440000
    .4byte 0x42440000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3C80000
    .4byte 0x42700000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x43AF0000
    .4byte 0x41A80000
    .4byte 0xC3C70000
    .4byte 0x42700000
    .4byte 0x42700000
    .4byte 0x00000000
lbl_0000CC68:
    # 0xCC68
    .4byte 0xC3F00000
    .4byte 0x41200000
    .4byte 0xC39D8000
    .4byte 0x42200000
    .4byte 0x42200000
    .4byte 0x00000000
    .4byte 0x43F00000
    .4byte 0x41200000
    .4byte 0xC39D8000
    .4byte 0x42200000
    .4byte 0x42200000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC4160000
    .4byte 0x41200000
    .4byte 0x41200000
    .4byte 0x00000000
lbl_0000CCB0:
    # 0xCCB0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00010101
    .4byte 0x01020202
lbl_0000CCC0:
    # 0xCCC0
    .4byte 0x00000000
    .4byte 0x00000101
    .4byte 0x01010101
    .4byte 0x02020202
lbl_0000CCD0:
    # 0xCCD0
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x01010101
    .4byte 0x01010202
    .asciz "USE ITEM?"
    .balign 4
    .4byte 0x59455300
    .4byte 0x4E4F0000
    .4byte 0x00000000
lbl_0000CCF8:
    # 0xCCF8
    .4byte lbl_00006E3C
    .4byte lbl_00006F94
    .4byte lbl_00007444
    .4byte lbl_00007A20
    .4byte lbl_00007DF4
    .4byte lbl_00007ECC
    .4byte lbl_00007ED0
    .4byte lbl_00007EF8
lbl_0000CD18:
    # 0xCD18
    .4byte 0x00000000
    .4byte 0x42140000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x41800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CD48:
    # 0xCD48
    .4byte 0x00000000
    .4byte 0x42100000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x41700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43147DF4
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CD78:
    # 0xCD78
    .4byte 0x00000000
    .4byte 0xC30A0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC4178000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C66A1D
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CDA8:
    # 0xCDA8
    .4byte 0x00000000
    .4byte 0x4144CCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x40D00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CDD8:
    # 0xCDD8
    .4byte 0x00000000
    .4byte 0x3FB33333
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x40D66666
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43138000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CE08:
    # 0xCE08
    .4byte 0x00000000
    .4byte 0xC3330000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC41D2CCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C4E9BA
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CE38:
    # 0xCE38
    .4byte lbl_0000CD18
    .4byte lbl_0000CD48
    .4byte lbl_0000CD78
lbl_0000CE44:
    # 0xCE44
    .4byte lbl_0000CDA8
    .4byte lbl_0000CDD8
    .4byte lbl_0000CE08
lbl_0000CE50:
    # 0xCE50
    .4byte 0x00000000
    .4byte 0x43D00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x41D80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3AC8000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CE90:
    # 0xCE90
    .4byte 0x00000000
    .4byte 0x41C80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x41B80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x42140000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43147DF4
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CED0:
    # 0xCED0
    .4byte 0x00000000
    .4byte 0xC3B80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC3A18000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3A88000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C66A1D
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CF10:
    # 0xCF10
    .4byte 0x00000000
    .4byte 0x43AD8000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC09CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3B00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CF50:
    # 0xCF50
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43138000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CF90:
    # 0xCF90
    .4byte 0x00000000
    .4byte 0xC3C30000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC3C98CCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3C98000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C4E9BA
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CFD0:
    # 0xCFD0
    .4byte lbl_0000CE50
    .4byte lbl_0000CE90
    .4byte lbl_0000CED0
lbl_0000CFDC:
    # 0xCFDC
    .4byte lbl_0000CF10
    .4byte lbl_0000CF50
    .4byte lbl_0000CF90
lbl_0000CFE8:
    # 0xCFE8
    .4byte 0x00000000
    .4byte 0x43E98000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3E70000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D028:
    # 0xD028
    .4byte 0x00000000
    .4byte 0x41B80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x415CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x41C80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43147DF4
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D068:
    # 0xD068
    .4byte 0x00000000
    .4byte 0xC3868000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC4104000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3830000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C66A1D
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D0A8:
    # 0xD0A8
    .4byte 0x00000000
    .4byte 0x43F08000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC0400000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3EF8000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D0E8:
    # 0xD0E8
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC1100000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43138000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D128:
    # 0xD128
    .4byte 0x00000000
    .4byte 0xC39C8000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC4188000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC39CD99A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C4E9BA
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D168:
    # 0xD168
    .4byte lbl_0000CFE8
    .4byte lbl_0000D028
    .4byte lbl_0000D068
lbl_0000D174:
    # 0xD174
    .4byte lbl_0000D0A8
    .4byte lbl_0000D0E8
    .4byte lbl_0000D128
    .4byte lbl_0000CE38
    .4byte lbl_0000CFD0
    .4byte lbl_0000D168
    .4byte lbl_0000CE44
    .4byte lbl_0000CFDC
    .4byte lbl_0000D174
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D1C8:
    # 0xD1C8
    .4byte 0x00260027
    .4byte 0x00280029
    .4byte 0x002A002B
    .4byte 0x002C002D
    .4byte 0x002E002F
    .4byte 0x00300031
    .4byte 0x00320033
    .4byte 0x00340035
    .4byte 0x00360037
    .4byte 0x00380039
    .4byte 0x003A003B
    .4byte 0x003C003D
    .4byte 0x003E003F
    .4byte 0x00400041
    .4byte 0x00420043
    .4byte 0x00440045
    .4byte 0x00460047
    .4byte 0x00480049
    .4byte 0x004A004B
    .4byte 0x004C0000
lbl_0000D218:
    # 0xD218
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC3480000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC3E10000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC4228000
    .4byte 0x3F4CCCCD
    .4byte 0xC3480000
    .4byte 0x00000000
    .4byte 0xC3E10000
    .4byte 0x3F19999A
    .4byte 0x43480000
    .4byte 0x00000000
    .4byte 0xC3E10000
    .4byte 0x3F19999A
lbl_0000D268:
    # 0xD268
    .4byte 0xC3AF0000
    .4byte 0x00000000
    .4byte 0xC3C80000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC3C80000
    .4byte 0x3F4CCCCD
    .4byte 0x43AF0000
    .4byte 0x00000000
    .4byte 0xC3C70000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC4228000
    .4byte 0x3F19999A
lbl_0000D2A8:
    # 0xD2A8
    .4byte 0xC3F00000
    .4byte 0x00000000
    .4byte 0xC39D8000
    .4byte 0x3F4CCCCD
    .4byte 0x43F00000
    .4byte 0x00000000
    .4byte 0xC39D8000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC3960000
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC4160000
    .4byte 0x3F4CCCCD
lbl_0000D2E8:
    # 0xD2E8
    .4byte lbl_0000D218
    .4byte 0x00050000
    .4byte lbl_0000D268
    .4byte 0x00040000
    .4byte lbl_0000D2A8
    .4byte 0x00040000
lbl_0000D300:
    # 0xD300
    .4byte 0x0B3B0B05
    .4byte 0x0B290B2A
    .4byte 0x0B2E0000
    .4byte 0x0B2C0B2D
    .4byte 0x0B2B0000
lbl_0000D314:
    # 0xD314
    .asciz "%3d X %d"
    .balign 4
lbl_0000D320:
    # 0xD320
    .4byte 0x25640000
lbl_0000D324:
    # 0xD324
    .4byte 0x25326400
lbl_0000D328:
    # 0xD328
    .4byte 0x25356400
    .4byte 0x32303000
    .4byte 0x31303000
    .4byte 0x30000000
lbl_0000D338:
    # 0xD338
    .4byte 0x25336400
    .4byte 0x25643A00
    .asciz "FINAL"
    .balign 4
    .asciz "ROUND"
    .balign 4
    .asciz "ROUND %d"
    .balign 4
    .4byte 0x25645000
lbl_0000D360:
    # 0xD360
    .asciz "MISS"
    .balign 4
lbl_0000D368:
    # 0xD368
    .asciz "CLOSE BALL AND LAND"
    .balign 4
    .asciz "PRESS"
    .balign 4
    .asciz "BUTTON"
    .balign 4
    .4byte 0x33000000
    .4byte 0x32000000
    .4byte 0x31300000
    .4byte 0x31320000
    .4byte 0x00000000
lbl_0000D3A0:
    # 0xD3A0
    .4byte 0x00000092
    .4byte 0x0000009A
    .4byte 0x0000009B
    .4byte 0x0000009C
    .4byte 0x0000009D
    .4byte 0x0000009E
    .4byte 0x0000009F
    .4byte 0x000000A0
    .4byte 0x000000A1
    .4byte 0x00000093
    .4byte 0x00000094
    .4byte 0x00000095
    .4byte 0x00000096
    .4byte 0x00000097
    .4byte 0x00000098
    .4byte 0x00000099

# 6
.section .bss
lbl_10000000:
    .skip 0x4
lbl_10000004:
    .skip 0x14
lbl_10000018:
    .skip 0x6
lbl_1000001E:
    .skip 0x2
lbl_10000020:
    .skip 0x14
lbl_10000034:
    .skip 0x4
lbl_10000038:
    .skip 0x4
lbl_1000003C:
    .skip 0x4
lbl_10000040:
    .skip 0x4
lbl_10000044:
    .skip 0x10
lbl_10000054:
    .skip 0x8
lbl_1000005C:
    .skip 0x8
lbl_10000064:
    .skip 0x2
lbl_10000066:
    .skip 0x2
lbl_10000068:
    .skip 0xC
lbl_10000074:
    .skip 0x4
lbl_10000078:
    .skip 0xF
lbl_10000087:
    .skip 0x1
lbl_10000088:
    .skip 0x2
lbl_1000008A:
    .skip 0x2
lbl_1000008C:
    .skip 0x4
lbl_10000090:
    .skip 0x8
lbl_10000098:
    .skip 0x10
lbl_100000A8:
    .skip 0x8
lbl_100000B0:
    .skip 0x8
lbl_100000B8:
    .skip 0xC

