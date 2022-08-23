# id: 1
# version: 1
# nameoffset: 0x0, size: 0x1D
# section table: 0x40, size: 0x90
# imp table: 0x1EE11
# relocs offset: 0x17499
# _prolog:     1:0x0
# _epilog:     1:0x88
# _unresolved: 1:0xB8
# num sections: 18
.include "macros.inc"
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x00011A90	flags: 1
# offset: 0x00011B60	length: 0x00000004	flags: 0
# offset: 0x00011B64	length: 0x00000004	flags: 0
# offset: 0x00011B68	length: 0x00000614	flags: 0
# offset: 0x00012180	length: 0x00005319	flags: 0
# offset: 0x10000000	length: 0x00000A18	flags: 0
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
.if 0
.global _prolog
_prolog:
/* 000000D0 7C0802A6 */ mflr r0
/* 000000D4 3C600000 */ lis r3, lbl_000030F4@ha
/* 000000D8 90010004 */ stw r0, 4(r1)
/* 000000DC 3C800000 */ lis r4, lbl_000118E4@ha
/* 000000E0 38630000 */ addi r3, r3, lbl_000030F4@l
/* 000000E4 9421FFF8 */ stwu r1, -8(r1)
/* 000000E8 38840000 */ addi r4, r4, lbl_000118E4@l
/* 000000EC 38A00000 */ li r5, 0
/* 000000F0 38C00000 */ li r6, 0
/* 000000F4 48000095 */ bl func_80012510
/* 000000F8 3C600000 */ lis r3, gameSubmode@ha
/* 000000FC A8030000 */ lha r0, gameSubmode@l(r3)
/* 00000100 2C000020 */ cmpwi r0, 0x20
/* 00000104 4182002C */ beq lbl_00000130
/* 00000108 40800010 */ bge lbl_00000118
/* 0000010C 2C00001F */ cmpwi r0, 0x1f
/* 00000110 40800014 */ bge lbl_00000124
/* 00000114 4800001C */ b lbl_00000130
lbl_00000118:
/* 00000118 2C000022 */ cmpwi r0, 0x22
/* 0000011C 40800014 */ bge lbl_00000130
/* 00000120 4800000C */ b lbl_0000012C
lbl_00000124:
/* 00000124 48002BDD */ bl lbl_00002D00
/* 00000128 48000008 */ b lbl_00000130
lbl_0000012C:
/* 0000012C 48002D95 */ bl lbl_00002EC0
lbl_00000130:
/* 00000130 3C800000 */ lis r4, gameSubmodeRequest@ha
/* 00000134 38000020 */ li r0, 0x20
/* 00000138 3C600000 */ lis r3, lbl_00012180@ha
/* 0000013C B0040000 */ sth r0, gameSubmodeRequest@l(r4)
/* 00000140 38630000 */ addi r3, r3, lbl_00012180@l
/* 00000144 48000045 */ bl puts
/* 00000148 8001000C */ lwz r0, 0xc(r1)
/* 0000014C 38210008 */ addi r1, r1, 8
/* 00000150 7C0803A6 */ mtlr r0
/* 00000154 4E800020 */ blr 
.endif
.if 0
.global _epilog
_epilog:
/* 00000158 7C0802A6 */ mflr r0
/* 0000015C 90010004 */ stw r0, 4(r1)
/* 00000160 9421FFF8 */ stwu r1, -8(r1)
/* 00000164 48000025 */ bl event_finish_all
/* 00000168 48000021 */ bl func_800249D4
/* 0000016C 3C600000 */ lis r3, lbl_0001219C@ha
/* 00000170 38630000 */ addi r3, r3, lbl_0001219C@l
/* 00000174 48000015 */ bl puts
/* 00000178 8001000C */ lwz r0, 0xc(r1)
/* 0000017C 38210008 */ addi r1, r1, 8
/* 00000180 7C0803A6 */ mtlr r0
/* 00000184 4E800020 */ blr 

.global _unresolved
_unresolved:
/* 00000188 7C0802A6 */ mflr r0
/* 0000018C 3C600000 */ lis r3, lbl_00012180@ha
/* 00000190 90010004 */ stw r0, 4(r1)
/* 00000194 9421FFE8 */ stwu r1, -0x18(r1)
/* 00000198 93E10014 */ stw r31, 0x14(r1)
/* 0000019C 3BE30000 */ addi r31, r3, lbl_00012180@l
/* 000001A0 387F0038 */ addi r3, r31, 0x38
/* 000001A4 93C10010 */ stw r30, 0x10(r1)
/* 000001A8 93A1000C */ stw r29, 0xc(r1)
/* 000001AC 4BFFFFDD */ bl puts
/* 000001B0 387F0060 */ addi r3, r31, 0x60
/* 000001B4 4BFFFFD5 */ bl puts
/* 000001B8 3BC00000 */ li r30, 0
/* 000001BC 4BFFFFCD */ bl OSGetStackPointer
/* 000001C0 7C7D1B78 */ mr r29, r3
/* 000001C4 48000020 */ b lbl_000001E4
lbl_000001C8:
/* 000001C8 80BD0000 */ lwz r5, 0(r29)
/* 000001CC 7FA4EB78 */ mr r4, r29
/* 000001D0 80DD0004 */ lwz r6, 4(r29)
/* 000001D4 387F0088 */ addi r3, r31, 0x88
/* 000001D8 4CC63182 */ crclr 6
/* 000001DC 4BFFFFAD */ bl printf
/* 000001E0 83BD0000 */ lwz r29, 0(r29)
lbl_000001E4:
/* 000001E4 281D0000 */ cmplwi r29, 0
/* 000001E8 4182001C */ beq lbl_00000204
/* 000001EC 3C1D0001 */ addis r0, r29, 1
/* 000001F0 2800FFFF */ cmplwi r0, 0xffff
/* 000001F4 41820010 */ beq lbl_00000204
/* 000001F8 281E0010 */ cmplwi r30, 0x10
/* 000001FC 3BDE0001 */ addi r30, r30, 1
/* 00000200 4180FFC8 */ blt lbl_000001C8
lbl_00000204:
/* 00000204 387F00A4 */ addi r3, r31, 0xa4
/* 00000208 4CC63182 */ crclr 6
/* 0000020C 38BF00B4 */ addi r5, r31, 0xb4
/* 00000210 38800055 */ li r4, 0x55
/* 00000214 4BFFFF75 */ bl OSPanic
/* 00000218 8001001C */ lwz r0, 0x1c(r1)
/* 0000021C 83E10014 */ lwz r31, 0x14(r1)
/* 00000220 83C10010 */ lwz r30, 0x10(r1)
/* 00000224 7C0803A6 */ mtlr r0
/* 00000228 83A1000C */ lwz r29, 0xc(r1)
/* 0000022C 38210018 */ addi r1, r1, 0x18
/* 00000230 4E800020 */ blr 

glabel lbl_00000234
/* 00000234 3C600000 */ lis r3, modeCtrl@ha
/* 00000238 38830000 */ addi r4, r3, modeCtrl@l
/* 0000023C 39200001 */ li r9, 1
/* 00000240 3C600000 */ lis r3, lbl_8027CE24@ha
/* 00000244 91240030 */ stw r9, 0x30(r4)
/* 00000248 39030000 */ addi r8, r3, lbl_8027CE24@l
/* 0000024C B1280000 */ sth r9, 0(r8)
/* 00000250 38E00000 */ li r7, 0
/* 00000254 39600000 */ li r11, 0
/* 00000258 B0E80002 */ sth r7, 2(r8)
/* 0000025C 3D400000 */ lis r10, lbl_10000000@ha
/* 00000260 3CC00000 */ lis r6, u_isCompetitionModeCourse@ha
/* 00000264 90E80004 */ stw r7, 4(r8)
/* 00000268 3CA00000 */ lis r5, lbl_801EED50@ha
/* 0000026C 3C800000 */ lis r4, lbl_802F1FB0@ha
/* 00000270 B1280008 */ sth r9, 8(r8)
/* 00000274 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00000278 2C0B0009 */ cmpwi r11, 9
/* 0000027C B0E8000A */ sth r7, 0xa(r8)
/* 00000280 394A0000 */ addi r10, r10, lbl_10000000@l
/* 00000284 90E8000C */ stw r7, 0xc(r8)
/* 00000288 B1280010 */ sth r9, 0x10(r8)
/* 0000028C B0E80012 */ sth r7, 0x12(r8)
/* 00000290 90E80014 */ stw r7, 0x14(r8)
/* 00000294 B1280018 */ sth r9, 0x18(r8)
/* 00000298 B0E8001A */ sth r7, 0x1a(r8)
/* 0000029C 90E8001C */ stw r7, 0x1c(r8)
/* 000002A0 B1280020 */ sth r9, 0x20(r8)
/* 000002A4 B0E80022 */ sth r7, 0x22(r8)
/* 000002A8 90E80024 */ stw r7, 0x24(r8)
/* 000002AC B1280028 */ sth r9, 0x28(r8)
/* 000002B0 B0E8002A */ sth r7, 0x2a(r8)
/* 000002B4 90E8002C */ stw r7, 0x2c(r8)
/* 000002B8 90E60000 */ stw r7, u_isCompetitionModeCourse@l(r6)
/* 000002BC 88050000 */ lbz r0, lbl_801EED50@l(r5)
/* 000002C0 7C000774 */ extsb r0, r0
/* 000002C4 90040000 */ stw r0, lbl_802F1FB0@l(r4)
/* 000002C8 90E30000 */ stw r7, lbl_802F1FAC@l(r3)
/* 000002CC 40800048 */ bge lbl_00000314
/* 000002D0 912A0018 */ stw r9, 0x18(r10)
/* 000002D4 39600008 */ li r11, 8
/* 000002D8 912A001C */ stw r9, 0x1c(r10)
/* 000002DC 912A0020 */ stw r9, 0x20(r10)
/* 000002E0 912A0024 */ stw r9, 0x24(r10)
/* 000002E4 912A0028 */ stw r9, 0x28(r10)
/* 000002E8 912A002C */ stw r9, 0x2c(r10)
/* 000002EC 912A0030 */ stw r9, 0x30(r10)
/* 000002F0 912A0034 */ stw r9, 0x34(r10)
/* 000002F4 48000034 */ b lbl_00000328
lbl_000002F8:
/* 000002F8 200B0009 */ subfic r0, r11, 9
/* 000002FC 2C0B0009 */ cmpwi r11, 9
/* 00000300 7C0903A6 */ mtctr r0
/* 00000304 40800010 */ bge lbl_00000314
lbl_00000308:
/* 00000308 91230000 */ stw r9, 0(r3)
/* 0000030C 38630004 */ addi r3, r3, 4
/* 00000310 4200FFF8 */ bdnz lbl_00000308
lbl_00000314:
/* 00000314 3C600000 */ lis r3, lbl_801EED98@ha
/* 00000318 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000031C 38000000 */ li r0, 0
/* 00000320 9003000C */ stw r0, 0xc(r3)
/* 00000324 4E800020 */ blr 
lbl_00000328:
/* 00000328 5560103A */ slwi r0, r11, 2
/* 0000032C 7C6A0214 */ add r3, r10, r0
/* 00000330 38630018 */ addi r3, r3, 0x18
/* 00000334 4BFFFFC4 */ b lbl_000002F8
/* 00000338 4E800020 */ blr 

glabel lbl_0000033C
/* 0000033C 7C0802A6 */ mflr r0
/* 00000340 3C600000 */ lis r3, gamePauseStatus@ha
/* 00000344 90010004 */ stw r0, 4(r1)
/* 00000348 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000034C 93E10024 */ stw r31, 0x24(r1)
/* 00000350 93C10020 */ stw r30, 0x20(r1)
/* 00000354 93A1001C */ stw r29, 0x1c(r1)
/* 00000358 93810018 */ stw r28, 0x18(r1)
/* 0000035C 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00000360 3C600000 */ lis r3, lbl_10000000@ha
/* 00000364 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00000368 7000000A */ andi. r0, r0, 0xa
/* 0000036C 40820248 */ bne lbl_000005B4
/* 00000370 4BFFFE19 */ bl func_8002FFEC
/* 00000374 38600001 */ li r3, 1
/* 00000378 4BFFFE11 */ bl event_start
/* 0000037C 38600004 */ li r3, 4
/* 00000380 4BFFFE09 */ bl event_start
/* 00000384 38600005 */ li r3, 5
/* 00000388 4BFFFE01 */ bl event_start
/* 0000038C 3860000F */ li r3, 0xf
/* 00000390 4BFFFDF9 */ bl event_start
/* 00000394 38600010 */ li r3, 0x10
/* 00000398 4BFFFDF1 */ bl event_start
/* 0000039C 38600012 */ li r3, 0x12
/* 000003A0 4BFFFDE9 */ bl event_start
/* 000003A4 3860000D */ li r3, 0xd
/* 000003A8 4BFFFDE1 */ bl event_start
/* 000003AC 38600013 */ li r3, 0x13
/* 000003B0 4BFFFDD9 */ bl event_start
/* 000003B4 38600000 */ li r3, 0
/* 000003B8 4BFFFDD1 */ bl light_init
/* 000003BC 38600034 */ li r3, 0x34
/* 000003C0 4BFFFDC9 */ bl camera_set_state
/* 000003C4 3C600000 */ lis r3, g_poolInfo@ha
/* 000003C8 38630000 */ addi r3, r3, g_poolInfo@l
/* 000003CC 38A3000C */ addi r5, r3, 0xc
/* 000003D0 8063000C */ lwz r3, 0xc(r3)
/* 000003D4 38800002 */ li r4, 2
/* 000003D8 38000000 */ li r0, 0
/* 000003DC 98830000 */ stb r4, 0(r3)
/* 000003E0 38600004 */ li r3, 4
/* 000003E4 80850000 */ lwz r4, 0(r5)
/* 000003E8 98040001 */ stb r0, 1(r4)
/* 000003EC 80850000 */ lwz r4, 0(r5)
/* 000003F0 98040002 */ stb r0, 2(r4)
/* 000003F4 80850000 */ lwz r4, 0(r5)
/* 000003F8 98040003 */ stb r0, 3(r4)
/* 000003FC 4BFFFD8D */ bl call_bitmap_load_group
/* 00000400 4800A551 */ bl lbl_0000A950
/* 00000404 3B800000 */ li r28, 0
lbl_00000408:
/* 00000408 7F83E378 */ mr r3, r28
/* 0000040C 4800E7C9 */ bl lbl_0000EBD4
/* 00000410 3B9C0001 */ addi r28, r28, 1
/* 00000414 2C1C001A */ cmpwi r28, 0x1a
/* 00000418 4180FFF0 */ blt lbl_00000408
/* 0000041C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00000420 3BA30000 */ addi r29, r3, lbl_801EEDA8@l
/* 00000424 3B800000 */ li r28, 0
/* 00000428 939D00BC */ stw r28, 0xbc(r29)
/* 0000042C 3C600000 */ lis r3, lbl_00009868@ha
/* 00000430 3BC30000 */ addi r30, r3, lbl_00009868@l
/* 00000434 939D00C0 */ stw r28, 0xc0(r29)
/* 00000438 38BE0000 */ addi r5, r30, 0
/* 0000043C 38600000 */ li r3, 0
/* 00000440 38800000 */ li r4, 0
/* 00000444 4BFFFD45 */ bl func_800380A8
/* 00000448 38BE0000 */ addi r5, r30, 0
/* 0000044C 38600001 */ li r3, 1
/* 00000450 38800001 */ li r4, 1
/* 00000454 4BFFFD35 */ bl func_800380A8
/* 00000458 38BE0000 */ addi r5, r30, 0
/* 0000045C 38600002 */ li r3, 2
/* 00000460 38800002 */ li r4, 2
/* 00000464 4BFFFD25 */ bl func_800380A8
/* 00000468 38BE0000 */ addi r5, r30, 0
/* 0000046C 38600003 */ li r3, 3
/* 00000470 38800003 */ li r4, 3
/* 00000474 4BFFFD15 */ bl func_800380A8
/* 00000478 939D0058 */ stw r28, 0x58(r29)
/* 0000047C 380000BE */ li r0, 0xbe
/* 00000480 939D005C */ stw r28, 0x5c(r29)
/* 00000484 939D0060 */ stw r28, 0x60(r29)
/* 00000488 939D0064 */ stw r28, 0x64(r29)
/* 0000048C 901F003C */ stw r0, 0x3c(r31)
/* 00000490 807F003C */ lwz r3, 0x3c(r31)
/* 00000494 4BFFFCF5 */ bl preload_stage_files
/* 00000498 38000001 */ li r0, 1
/* 0000049C 3C600000 */ lis r3, modeCtrl@ha
/* 000004A0 901F00C0 */ stw r0, 0xc0(r31)
/* 000004A4 38630000 */ addi r3, r3, modeCtrl@l
/* 000004A8 80030008 */ lwz r0, 8(r3)
/* 000004AC 540003DF */ rlwinm. r0, r0, 0, 0xf, 0xf
/* 000004B0 418200AC */ beq lbl_0000055C
/* 000004B4 80030028 */ lwz r0, 0x28(r3)
/* 000004B8 2C000004 */ cmpwi r0, 4
/* 000004BC 41820030 */ beq lbl_000004EC
/* 000004C0 40800010 */ bge lbl_000004D0
/* 000004C4 2C000003 */ cmpwi r0, 3
/* 000004C8 40800014 */ bge lbl_000004DC
/* 000004CC 48000040 */ b lbl_0000050C
lbl_000004D0:
/* 000004D0 2C000006 */ cmpwi r0, 6
/* 000004D4 40800038 */ bge lbl_0000050C
/* 000004D8 48000024 */ b lbl_000004FC
lbl_000004DC:
/* 000004DC 38600008 */ li r3, 8
/* 000004E0 38800000 */ li r4, 0
/* 000004E4 4BFFFCA5 */ bl u_play_music
/* 000004E8 480000C0 */ b lbl_000005A8
lbl_000004EC:
/* 000004EC 3860000A */ li r3, 0xa
/* 000004F0 38800000 */ li r4, 0
/* 000004F4 4BFFFC95 */ bl u_play_music
/* 000004F8 480000B0 */ b lbl_000005A8
lbl_000004FC:
/* 000004FC 3860000C */ li r3, 0xc
/* 00000500 38800000 */ li r4, 0
/* 00000504 4BFFFC85 */ bl u_play_music
/* 00000508 480000A0 */ b lbl_000005A8
lbl_0000050C:
/* 0000050C 38600006 */ li r3, 6
/* 00000510 4BFFFC79 */ bl is_minigame_unlocked
/* 00000514 2C030000 */ cmpwi r3, 0
/* 00000518 41820034 */ beq lbl_0000054C
/* 0000051C 38600007 */ li r3, 7
/* 00000520 4BFFFC69 */ bl is_minigame_unlocked
/* 00000524 2C030000 */ cmpwi r3, 0
/* 00000528 41820024 */ beq lbl_0000054C
/* 0000052C 38600008 */ li r3, 8
/* 00000530 4BFFFC59 */ bl is_minigame_unlocked
/* 00000534 2C030000 */ cmpwi r3, 0
/* 00000538 41820014 */ beq lbl_0000054C
/* 0000053C 38600006 */ li r3, 6
/* 00000540 38800000 */ li r4, 0
/* 00000544 4BFFFC45 */ bl u_play_music
/* 00000548 48000060 */ b lbl_000005A8
lbl_0000054C:
/* 0000054C 38600004 */ li r3, 4
/* 00000550 38800000 */ li r4, 0
/* 00000554 4BFFFC35 */ bl u_play_music
/* 00000558 48000050 */ b lbl_000005A8
lbl_0000055C:
/* 0000055C 38600006 */ li r3, 6
/* 00000560 4BFFFC29 */ bl is_minigame_unlocked
/* 00000564 2C030000 */ cmpwi r3, 0
/* 00000568 41820034 */ beq lbl_0000059C
/* 0000056C 38600007 */ li r3, 7
/* 00000570 4BFFFC19 */ bl is_minigame_unlocked
/* 00000574 2C030000 */ cmpwi r3, 0
/* 00000578 41820024 */ beq lbl_0000059C
/* 0000057C 38600008 */ li r3, 8
/* 00000580 4BFFFC09 */ bl is_minigame_unlocked
/* 00000584 2C030000 */ cmpwi r3, 0
/* 00000588 41820014 */ beq lbl_0000059C
/* 0000058C 38600006 */ li r3, 6
/* 00000590 38800000 */ li r4, 0
/* 00000594 4BFFFBF5 */ bl u_play_music
/* 00000598 48000010 */ b lbl_000005A8
lbl_0000059C:
/* 0000059C 38600004 */ li r3, 4
/* 000005A0 38800000 */ li r4, 0
/* 000005A4 4BFFFBE5 */ bl u_play_music
lbl_000005A8:
/* 000005A8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000005AC 38000020 */ li r0, 0x20
/* 000005B0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_000005B4:
/* 000005B4 8001002C */ lwz r0, 0x2c(r1)
/* 000005B8 83E10024 */ lwz r31, 0x24(r1)
/* 000005BC 83C10020 */ lwz r30, 0x20(r1)
/* 000005C0 7C0803A6 */ mtlr r0
/* 000005C4 83A1001C */ lwz r29, 0x1c(r1)
/* 000005C8 83810018 */ lwz r28, 0x18(r1)
/* 000005CC 38210028 */ addi r1, r1, 0x28
/* 000005D0 4E800020 */ blr

glabel lbl_000005D4
/* 000005D4 9421FFE8 */ stwu r1, -0x18(r1)
/* 000005D8 3C800000 */ lis r4, lbl_10000000@ha
/* 000005DC 28030008 */ cmplwi r3, 8
/* 000005E0 93E10014 */ stw r31, 0x14(r1)
/* 000005E4 38A40000 */ addi r5, r4, lbl_10000000@l
/* 000005E8 38C00000 */ li r6, 0
/* 000005EC 41811314 */ bgt lbl_00001900
/* 000005F0 3C800000 */ lis r4, lbl_00012238@ha
/* 000005F4 38840000 */ addi r4, r4, lbl_00012238@l
/* 000005F8 5460103A */ slwi r0, r3, 2
/* 000005FC 7C04002E */ lwzx r0, r4, r0
/* 00000600 7C0903A6 */ mtctr r0
/* 00000604 4E800420 */ bctr 
lbl_00000608:
/* 00000608 80C50004 */ lwz r6, 4(r5)
/* 0000060C 38000001 */ li r0, 1
/* 00000610 38600000 */ li r3, 0
/* 00000614 28060000 */ cmplwi r6, 0
/* 00000618 40820110 */ bne lbl_00000728
/* 0000061C 3C800000 */ lis r4, controllerInfo@ha
/* 00000620 39040000 */ addi r8, r4, controllerInfo@l
/* 00000624 A0E80030 */ lhz r7, 0x30(r8)
/* 00000628 7C040378 */ mr r4, r0
/* 0000062C 7C050378 */ mr r5, r0
/* 00000630 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000634 7C090378 */ mr r9, r0
/* 00000638 7C0A0378 */ mr r10, r0
/* 0000063C 7C0B0378 */ mr r11, r0
/* 00000640 7C0C0378 */ mr r12, r0
/* 00000644 7C1F0378 */ mr r31, r0
/* 00000648 40820014 */ bne lbl_0000065C
/* 0000064C A0E8006C */ lhz r7, 0x6c(r8)
/* 00000650 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000654 40820008 */ bne lbl_0000065C
/* 00000658 7C7F1B78 */ mr r31, r3
lbl_0000065C:
/* 0000065C 2C1F0000 */ cmpwi r31, 0
/* 00000660 4082001C */ bne lbl_0000067C
/* 00000664 3CE00000 */ lis r7, controllerInfo@ha
/* 00000668 38E70000 */ addi r7, r7, controllerInfo@l
/* 0000066C A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000670 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000674 40820008 */ bne lbl_0000067C
/* 00000678 39800000 */ li r12, 0
lbl_0000067C:
/* 0000067C 2C0C0000 */ cmpwi r12, 0
/* 00000680 4082001C */ bne lbl_0000069C
/* 00000684 3CE00000 */ lis r7, controllerInfo@ha
/* 00000688 38E70000 */ addi r7, r7, controllerInfo@l
/* 0000068C A0E700E4 */ lhz r7, 0xe4(r7)
/* 00000690 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000694 40820008 */ bne lbl_0000069C
/* 00000698 39600000 */ li r11, 0
lbl_0000069C:
/* 0000069C 2C0B0000 */ cmpwi r11, 0
/* 000006A0 4082001C */ bne lbl_000006BC
/* 000006A4 3CE00000 */ lis r7, analogButtonInfo@ha
/* 000006A8 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 000006AC A0E70008 */ lhz r7, 8(r7)
/* 000006B0 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000006B4 40820008 */ bne lbl_000006BC
/* 000006B8 39400000 */ li r10, 0
lbl_000006BC:
/* 000006BC 2C0A0000 */ cmpwi r10, 0
/* 000006C0 4082001C */ bne lbl_000006DC
/* 000006C4 3CE00000 */ lis r7, analogButtonInfo@ha
/* 000006C8 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 000006CC A0E70012 */ lhz r7, 0x12(r7)
/* 000006D0 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000006D4 40820008 */ bne lbl_000006DC
/* 000006D8 39200000 */ li r9, 0
lbl_000006DC:
/* 000006DC 2C090000 */ cmpwi r9, 0
/* 000006E0 4082001C */ bne lbl_000006FC
/* 000006E4 3CE00000 */ lis r7, analogButtonInfo@ha
/* 000006E8 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 000006EC A0E7001C */ lhz r7, 0x1c(r7)
/* 000006F0 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000006F4 40820008 */ bne lbl_000006FC
/* 000006F8 38A00000 */ li r5, 0
lbl_000006FC:
/* 000006FC 2C050000 */ cmpwi r5, 0
/* 00000700 4082001C */ bne lbl_0000071C
/* 00000704 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000708 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 0000070C A0A50026 */ lhz r5, 0x26(r5)
/* 00000710 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000714 40820008 */ bne lbl_0000071C
/* 00000718 38800000 */ li r4, 0
lbl_0000071C:
/* 0000071C 2C040000 */ cmpwi r4, 0
/* 00000720 41820008 */ beq lbl_00000728
/* 00000724 38600001 */ li r3, 1
lbl_00000728:
/* 00000728 2C030000 */ cmpwi r3, 0
/* 0000072C 40820190 */ bne lbl_000008BC
/* 00000730 28060000 */ cmplwi r6, 0
/* 00000734 38600000 */ li r3, 0
/* 00000738 41820178 */ beq lbl_000008B0
/* 0000073C 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00000740 38800001 */ li r4, 1
/* 00000744 39230000 */ addi r9, r3, 0
/* 00000748 38A40000 */ addi r5, r4, 0
/* 0000074C 39040000 */ addi r8, r4, 0
/* 00000750 41820040 */ beq lbl_00000790
/* 00000754 3CE00000 */ lis r7, controllerInfo@ha
/* 00000758 38E70000 */ addi r7, r7, controllerInfo@l
/* 0000075C A0E70030 */ lhz r7, 0x30(r7)
/* 00000760 39440000 */ addi r10, r4, 0
/* 00000764 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000768 4082001C */ bne lbl_00000784
/* 0000076C 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000770 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000774 A0E70008 */ lhz r7, 8(r7)
/* 00000778 54E707FF */ clrlwi. r7, r7, 0x1f
/* 0000077C 40820008 */ bne lbl_00000784
/* 00000780 7C6A1B78 */ mr r10, r3
lbl_00000784:
/* 00000784 2C0A0000 */ cmpwi r10, 0
/* 00000788 41820008 */ beq lbl_00000790
/* 0000078C 39200001 */ li r9, 1
lbl_00000790:
/* 00000790 2C090000 */ cmpwi r9, 0
/* 00000794 40820058 */ bne lbl_000007EC
/* 00000798 54C707BD */ rlwinm. r7, r6, 0, 0x1e, 0x1e
/* 0000079C 39200000 */ li r9, 0
/* 000007A0 41820040 */ beq lbl_000007E0
/* 000007A4 3CE00000 */ lis r7, controllerInfo@ha
/* 000007A8 38E70000 */ addi r7, r7, controllerInfo@l
/* 000007AC A0E7006C */ lhz r7, 0x6c(r7)
/* 000007B0 39400001 */ li r10, 1
/* 000007B4 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000007B8 4082001C */ bne lbl_000007D4
/* 000007BC 3CE00000 */ lis r7, analogButtonInfo@ha
/* 000007C0 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 000007C4 A0E70012 */ lhz r7, 0x12(r7)
/* 000007C8 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000007CC 40820008 */ bne lbl_000007D4
/* 000007D0 7D2A4B78 */ mr r10, r9
lbl_000007D4:
/* 000007D4 2C0A0000 */ cmpwi r10, 0
/* 000007D8 41820008 */ beq lbl_000007E0
/* 000007DC 39200001 */ li r9, 1
lbl_000007E0:
/* 000007E0 2C090000 */ cmpwi r9, 0
/* 000007E4 40820008 */ bne lbl_000007EC
/* 000007E8 39000000 */ li r8, 0
lbl_000007EC:
/* 000007EC 2C080000 */ cmpwi r8, 0
/* 000007F0 40820058 */ bne lbl_00000848
/* 000007F4 54C7077B */ rlwinm. r7, r6, 0, 0x1d, 0x1d
/* 000007F8 39000000 */ li r8, 0
/* 000007FC 41820040 */ beq lbl_0000083C
/* 00000800 3CE00000 */ lis r7, controllerInfo@ha
/* 00000804 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000808 A0E700A8 */ lhz r7, 0xa8(r7)
/* 0000080C 39200001 */ li r9, 1
/* 00000810 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000814 4082001C */ bne lbl_00000830
/* 00000818 3CE00000 */ lis r7, analogButtonInfo@ha
/* 0000081C 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000820 A0E7001C */ lhz r7, 0x1c(r7)
/* 00000824 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000828 40820008 */ bne lbl_00000830
/* 0000082C 7D094378 */ mr r9, r8
lbl_00000830:
/* 00000830 2C090000 */ cmpwi r9, 0
/* 00000834 41820008 */ beq lbl_0000083C
/* 00000838 39000001 */ li r8, 1
lbl_0000083C:
/* 0000083C 2C080000 */ cmpwi r8, 0
/* 00000840 40820008 */ bne lbl_00000848
/* 00000844 38A00000 */ li r5, 0
lbl_00000848:
/* 00000848 2C050000 */ cmpwi r5, 0
/* 0000084C 40820058 */ bne lbl_000008A4
/* 00000850 54C50739 */ rlwinm. r5, r6, 0, 0x1c, 0x1c
/* 00000854 38C00000 */ li r6, 0
/* 00000858 41820040 */ beq lbl_00000898
/* 0000085C 3CA00000 */ lis r5, controllerInfo@ha
/* 00000860 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000864 A0A500E4 */ lhz r5, 0xe4(r5)
/* 00000868 38E00001 */ li r7, 1
/* 0000086C 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000870 4082001C */ bne lbl_0000088C
/* 00000874 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000878 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 0000087C A0A50026 */ lhz r5, 0x26(r5)
/* 00000880 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000884 40820008 */ bne lbl_0000088C
/* 00000888 7CC73378 */ mr r7, r6
lbl_0000088C:
/* 0000088C 2C070000 */ cmpwi r7, 0
/* 00000890 41820008 */ beq lbl_00000898
/* 00000894 38C00001 */ li r6, 1
lbl_00000898:
/* 00000898 2C060000 */ cmpwi r6, 0
/* 0000089C 40820008 */ bne lbl_000008A4
/* 000008A0 38800000 */ li r4, 0
lbl_000008A4:
/* 000008A4 2C040000 */ cmpwi r4, 0
/* 000008A8 41820008 */ beq lbl_000008B0
/* 000008AC 38600001 */ li r3, 1
lbl_000008B0:
/* 000008B0 2C030000 */ cmpwi r3, 0
/* 000008B4 40820008 */ bne lbl_000008BC
/* 000008B8 38000000 */ li r0, 0
lbl_000008BC:
/* 000008BC 7C060378 */ mr r6, r0
/* 000008C0 48001040 */ b lbl_00001900
lbl_000008C4:
/* 000008C4 80C50004 */ lwz r6, 4(r5)
/* 000008C8 38000001 */ li r0, 1
/* 000008CC 38600000 */ li r3, 0
/* 000008D0 28060000 */ cmplwi r6, 0
/* 000008D4 40820110 */ bne lbl_000009E4
/* 000008D8 3C800000 */ lis r4, controllerInfo@ha
/* 000008DC 39040000 */ addi r8, r4, controllerInfo@l
/* 000008E0 A0E80030 */ lhz r7, 0x30(r8)
/* 000008E4 7C040378 */ mr r4, r0
/* 000008E8 7C050378 */ mr r5, r0
/* 000008EC 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 000008F0 7C090378 */ mr r9, r0
/* 000008F4 7C0A0378 */ mr r10, r0
/* 000008F8 7C0B0378 */ mr r11, r0
/* 000008FC 7C0C0378 */ mr r12, r0
/* 00000900 7C1F0378 */ mr r31, r0
/* 00000904 40820014 */ bne lbl_00000918
/* 00000908 A0E8006C */ lhz r7, 0x6c(r8)
/* 0000090C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000910 40820008 */ bne lbl_00000918
/* 00000914 7C7F1B78 */ mr r31, r3
lbl_00000918:
/* 00000918 2C1F0000 */ cmpwi r31, 0
/* 0000091C 4082001C */ bne lbl_00000938
/* 00000920 3CE00000 */ lis r7, controllerInfo@ha
/* 00000924 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000928 A0E700A8 */ lhz r7, 0xa8(r7)
/* 0000092C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000930 40820008 */ bne lbl_00000938
/* 00000934 39800000 */ li r12, 0
lbl_00000938:
/* 00000938 2C0C0000 */ cmpwi r12, 0
/* 0000093C 4082001C */ bne lbl_00000958
/* 00000940 3CE00000 */ lis r7, controllerInfo@ha
/* 00000944 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000948 A0E700E4 */ lhz r7, 0xe4(r7)
/* 0000094C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000950 40820008 */ bne lbl_00000958
/* 00000954 39600000 */ li r11, 0
lbl_00000958:
/* 00000958 2C0B0000 */ cmpwi r11, 0
/* 0000095C 4082001C */ bne lbl_00000978
/* 00000960 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000964 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000968 A0E70008 */ lhz r7, 8(r7)
/* 0000096C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000970 40820008 */ bne lbl_00000978
/* 00000974 39400000 */ li r10, 0
lbl_00000978:
/* 00000978 2C0A0000 */ cmpwi r10, 0
/* 0000097C 4082001C */ bne lbl_00000998
/* 00000980 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000984 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000988 A0E70012 */ lhz r7, 0x12(r7)
/* 0000098C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000990 40820008 */ bne lbl_00000998
/* 00000994 39200000 */ li r9, 0
lbl_00000998:
/* 00000998 2C090000 */ cmpwi r9, 0
/* 0000099C 4082001C */ bne lbl_000009B8
/* 000009A0 3CE00000 */ lis r7, analogButtonInfo@ha
/* 000009A4 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 000009A8 A0E7001C */ lhz r7, 0x1c(r7)
/* 000009AC 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 000009B0 40820008 */ bne lbl_000009B8
/* 000009B4 38A00000 */ li r5, 0
lbl_000009B8:
/* 000009B8 2C050000 */ cmpwi r5, 0
/* 000009BC 4082001C */ bne lbl_000009D8
/* 000009C0 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000009C4 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 000009C8 A0A50026 */ lhz r5, 0x26(r5)
/* 000009CC 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 000009D0 40820008 */ bne lbl_000009D8
/* 000009D4 38800000 */ li r4, 0
lbl_000009D8:
/* 000009D8 2C040000 */ cmpwi r4, 0
/* 000009DC 41820008 */ beq lbl_000009E4
/* 000009E0 38600001 */ li r3, 1
lbl_000009E4:
/* 000009E4 2C030000 */ cmpwi r3, 0
/* 000009E8 40820190 */ bne lbl_00000B78
/* 000009EC 28060000 */ cmplwi r6, 0
/* 000009F0 38600000 */ li r3, 0
/* 000009F4 41820178 */ beq lbl_00000B6C
/* 000009F8 54C407FF */ clrlwi. r4, r6, 0x1f
/* 000009FC 38800001 */ li r4, 1
/* 00000A00 39230000 */ addi r9, r3, 0
/* 00000A04 38A40000 */ addi r5, r4, 0
/* 00000A08 39040000 */ addi r8, r4, 0
/* 00000A0C 41820040 */ beq lbl_00000A4C
/* 00000A10 3CE00000 */ lis r7, controllerInfo@ha
/* 00000A14 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000A18 A0E70030 */ lhz r7, 0x30(r7)
/* 00000A1C 39440000 */ addi r10, r4, 0
/* 00000A20 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000A24 4082001C */ bne lbl_00000A40
/* 00000A28 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000A2C 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000A30 A0E70008 */ lhz r7, 8(r7)
/* 00000A34 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000A38 40820008 */ bne lbl_00000A40
/* 00000A3C 7C6A1B78 */ mr r10, r3
lbl_00000A40:
/* 00000A40 2C0A0000 */ cmpwi r10, 0
/* 00000A44 41820008 */ beq lbl_00000A4C
/* 00000A48 39200001 */ li r9, 1
lbl_00000A4C:
/* 00000A4C 2C090000 */ cmpwi r9, 0
/* 00000A50 40820058 */ bne lbl_00000AA8
/* 00000A54 54C707BD */ rlwinm. r7, r6, 0, 0x1e, 0x1e
/* 00000A58 39200000 */ li r9, 0
/* 00000A5C 41820040 */ beq lbl_00000A9C
/* 00000A60 3CE00000 */ lis r7, controllerInfo@ha
/* 00000A64 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000A68 A0E7006C */ lhz r7, 0x6c(r7)
/* 00000A6C 39400001 */ li r10, 1
/* 00000A70 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000A74 4082001C */ bne lbl_00000A90
/* 00000A78 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000A7C 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000A80 A0E70012 */ lhz r7, 0x12(r7)
/* 00000A84 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000A88 40820008 */ bne lbl_00000A90
/* 00000A8C 7D2A4B78 */ mr r10, r9
lbl_00000A90:
/* 00000A90 2C0A0000 */ cmpwi r10, 0
/* 00000A94 41820008 */ beq lbl_00000A9C
/* 00000A98 39200001 */ li r9, 1
lbl_00000A9C:
/* 00000A9C 2C090000 */ cmpwi r9, 0
/* 00000AA0 40820008 */ bne lbl_00000AA8
/* 00000AA4 39000000 */ li r8, 0
lbl_00000AA8:
/* 00000AA8 2C080000 */ cmpwi r8, 0
/* 00000AAC 40820058 */ bne lbl_00000B04
/* 00000AB0 54C7077B */ rlwinm. r7, r6, 0, 0x1d, 0x1d
/* 00000AB4 39000000 */ li r8, 0
/* 00000AB8 41820040 */ beq lbl_00000AF8
/* 00000ABC 3CE00000 */ lis r7, controllerInfo@ha
/* 00000AC0 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000AC4 A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000AC8 39200001 */ li r9, 1
/* 00000ACC 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000AD0 4082001C */ bne lbl_00000AEC
/* 00000AD4 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000AD8 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000ADC A0E7001C */ lhz r7, 0x1c(r7)
/* 00000AE0 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000AE4 40820008 */ bne lbl_00000AEC
/* 00000AE8 7D094378 */ mr r9, r8
lbl_00000AEC:
/* 00000AEC 2C090000 */ cmpwi r9, 0
/* 00000AF0 41820008 */ beq lbl_00000AF8
/* 00000AF4 39000001 */ li r8, 1
lbl_00000AF8:
/* 00000AF8 2C080000 */ cmpwi r8, 0
/* 00000AFC 40820008 */ bne lbl_00000B04
/* 00000B00 38A00000 */ li r5, 0
lbl_00000B04:
/* 00000B04 2C050000 */ cmpwi r5, 0
/* 00000B08 40820058 */ bne lbl_00000B60
/* 00000B0C 54C50739 */ rlwinm. r5, r6, 0, 0x1c, 0x1c
/* 00000B10 38C00000 */ li r6, 0
/* 00000B14 41820040 */ beq lbl_00000B54
/* 00000B18 3CA00000 */ lis r5, controllerInfo@ha
/* 00000B1C 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000B20 A0A500E4 */ lhz r5, 0xe4(r5)
/* 00000B24 38E00001 */ li r7, 1
/* 00000B28 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00000B2C 4082001C */ bne lbl_00000B48
/* 00000B30 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000B34 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00000B38 A0A50026 */ lhz r5, 0x26(r5)
/* 00000B3C 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00000B40 40820008 */ bne lbl_00000B48
/* 00000B44 7CC73378 */ mr r7, r6
lbl_00000B48:
/* 00000B48 2C070000 */ cmpwi r7, 0
/* 00000B4C 41820008 */ beq lbl_00000B54
/* 00000B50 38C00001 */ li r6, 1
lbl_00000B54:
/* 00000B54 2C060000 */ cmpwi r6, 0
/* 00000B58 40820008 */ bne lbl_00000B60
/* 00000B5C 38800000 */ li r4, 0
lbl_00000B60:
/* 00000B60 2C040000 */ cmpwi r4, 0
/* 00000B64 41820008 */ beq lbl_00000B6C
/* 00000B68 38600001 */ li r3, 1
lbl_00000B6C:
/* 00000B6C 2C030000 */ cmpwi r3, 0
/* 00000B70 40820008 */ bne lbl_00000B78
/* 00000B74 38000000 */ li r0, 0
lbl_00000B78:
/* 00000B78 7C060378 */ mr r6, r0
/* 00000B7C 48000D84 */ b lbl_00001900
lbl_00000B80:
/* 00000B80 80C50004 */ lwz r6, 4(r5)
/* 00000B84 38000001 */ li r0, 1
/* 00000B88 38600000 */ li r3, 0
/* 00000B8C 28060000 */ cmplwi r6, 0
/* 00000B90 40820110 */ bne lbl_00000CA0
/* 00000B94 3C800000 */ lis r4, controllerInfo@ha
/* 00000B98 39040000 */ addi r8, r4, controllerInfo@l
/* 00000B9C A0E80030 */ lhz r7, 0x30(r8)
/* 00000BA0 7C040378 */ mr r4, r0
/* 00000BA4 7C050378 */ mr r5, r0
/* 00000BA8 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000BAC 7C090378 */ mr r9, r0
/* 00000BB0 7C0A0378 */ mr r10, r0
/* 00000BB4 7C0B0378 */ mr r11, r0
/* 00000BB8 7C0C0378 */ mr r12, r0
/* 00000BBC 7C1F0378 */ mr r31, r0
/* 00000BC0 40820014 */ bne lbl_00000BD4
/* 00000BC4 A0E8006C */ lhz r7, 0x6c(r8)
/* 00000BC8 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000BCC 40820008 */ bne lbl_00000BD4
/* 00000BD0 7C7F1B78 */ mr r31, r3
lbl_00000BD4:
/* 00000BD4 2C1F0000 */ cmpwi r31, 0
/* 00000BD8 4082001C */ bne lbl_00000BF4
/* 00000BDC 3CE00000 */ lis r7, controllerInfo@ha
/* 00000BE0 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000BE4 A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000BE8 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000BEC 40820008 */ bne lbl_00000BF4
/* 00000BF0 39800000 */ li r12, 0
lbl_00000BF4:
/* 00000BF4 2C0C0000 */ cmpwi r12, 0
/* 00000BF8 4082001C */ bne lbl_00000C14
/* 00000BFC 3CE00000 */ lis r7, controllerInfo@ha
/* 00000C00 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000C04 A0E700E4 */ lhz r7, 0xe4(r7)
/* 00000C08 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000C0C 40820008 */ bne lbl_00000C14
/* 00000C10 39600000 */ li r11, 0
lbl_00000C14:
/* 00000C14 2C0B0000 */ cmpwi r11, 0
/* 00000C18 4082001C */ bne lbl_00000C34
/* 00000C1C 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000C20 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000C24 A0E70008 */ lhz r7, 8(r7)
/* 00000C28 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000C2C 40820008 */ bne lbl_00000C34
/* 00000C30 39400000 */ li r10, 0
lbl_00000C34:
/* 00000C34 2C0A0000 */ cmpwi r10, 0
/* 00000C38 4082001C */ bne lbl_00000C54
/* 00000C3C 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000C40 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000C44 A0E70012 */ lhz r7, 0x12(r7)
/* 00000C48 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000C4C 40820008 */ bne lbl_00000C54
/* 00000C50 39200000 */ li r9, 0
lbl_00000C54:
/* 00000C54 2C090000 */ cmpwi r9, 0
/* 00000C58 4082001C */ bne lbl_00000C74
/* 00000C5C 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000C60 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000C64 A0E7001C */ lhz r7, 0x1c(r7)
/* 00000C68 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000C6C 40820008 */ bne lbl_00000C74
/* 00000C70 38A00000 */ li r5, 0
lbl_00000C74:
/* 00000C74 2C050000 */ cmpwi r5, 0
/* 00000C78 4082001C */ bne lbl_00000C94
/* 00000C7C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000C80 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00000C84 A0A50026 */ lhz r5, 0x26(r5)
/* 00000C88 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00000C8C 40820008 */ bne lbl_00000C94
/* 00000C90 38800000 */ li r4, 0
lbl_00000C94:
/* 00000C94 2C040000 */ cmpwi r4, 0
/* 00000C98 41820008 */ beq lbl_00000CA0
/* 00000C9C 38600001 */ li r3, 1
lbl_00000CA0:
/* 00000CA0 2C030000 */ cmpwi r3, 0
/* 00000CA4 40820190 */ bne lbl_00000E34
/* 00000CA8 28060000 */ cmplwi r6, 0
/* 00000CAC 38600000 */ li r3, 0
/* 00000CB0 41820178 */ beq lbl_00000E28
/* 00000CB4 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00000CB8 38800001 */ li r4, 1
/* 00000CBC 39230000 */ addi r9, r3, 0
/* 00000CC0 38A40000 */ addi r5, r4, 0
/* 00000CC4 39040000 */ addi r8, r4, 0
/* 00000CC8 41820040 */ beq lbl_00000D08
/* 00000CCC 3CE00000 */ lis r7, controllerInfo@ha
/* 00000CD0 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000CD4 A0E70030 */ lhz r7, 0x30(r7)
/* 00000CD8 39440000 */ addi r10, r4, 0
/* 00000CDC 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000CE0 4082001C */ bne lbl_00000CFC
/* 00000CE4 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000CE8 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000CEC A0E70008 */ lhz r7, 8(r7)
/* 00000CF0 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000CF4 40820008 */ bne lbl_00000CFC
/* 00000CF8 7C6A1B78 */ mr r10, r3
lbl_00000CFC:
/* 00000CFC 2C0A0000 */ cmpwi r10, 0
/* 00000D00 41820008 */ beq lbl_00000D08
/* 00000D04 39200001 */ li r9, 1
lbl_00000D08:
/* 00000D08 2C090000 */ cmpwi r9, 0
/* 00000D0C 40820058 */ bne lbl_00000D64
/* 00000D10 54C707BD */ rlwinm. r7, r6, 0, 0x1e, 0x1e
/* 00000D14 39200000 */ li r9, 0
/* 00000D18 41820040 */ beq lbl_00000D58
/* 00000D1C 3CE00000 */ lis r7, controllerInfo@ha
/* 00000D20 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000D24 A0E7006C */ lhz r7, 0x6c(r7)
/* 00000D28 39400001 */ li r10, 1
/* 00000D2C 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000D30 4082001C */ bne lbl_00000D4C
/* 00000D34 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000D38 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000D3C A0E70012 */ lhz r7, 0x12(r7)
/* 00000D40 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000D44 40820008 */ bne lbl_00000D4C
/* 00000D48 7D2A4B78 */ mr r10, r9
lbl_00000D4C:
/* 00000D4C 2C0A0000 */ cmpwi r10, 0
/* 00000D50 41820008 */ beq lbl_00000D58
/* 00000D54 39200001 */ li r9, 1
lbl_00000D58:
/* 00000D58 2C090000 */ cmpwi r9, 0
/* 00000D5C 40820008 */ bne lbl_00000D64
/* 00000D60 39000000 */ li r8, 0
lbl_00000D64:
/* 00000D64 2C080000 */ cmpwi r8, 0
/* 00000D68 40820058 */ bne lbl_00000DC0
/* 00000D6C 54C7077B */ rlwinm. r7, r6, 0, 0x1d, 0x1d
/* 00000D70 39000000 */ li r8, 0
/* 00000D74 41820040 */ beq lbl_00000DB4
/* 00000D78 3CE00000 */ lis r7, controllerInfo@ha
/* 00000D7C 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000D80 A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000D84 39200001 */ li r9, 1
/* 00000D88 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000D8C 4082001C */ bne lbl_00000DA8
/* 00000D90 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000D94 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000D98 A0E7001C */ lhz r7, 0x1c(r7)
/* 00000D9C 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000DA0 40820008 */ bne lbl_00000DA8
/* 00000DA4 7D094378 */ mr r9, r8
lbl_00000DA8:
/* 00000DA8 2C090000 */ cmpwi r9, 0
/* 00000DAC 41820008 */ beq lbl_00000DB4
/* 00000DB0 39000001 */ li r8, 1
lbl_00000DB4:
/* 00000DB4 2C080000 */ cmpwi r8, 0
/* 00000DB8 40820008 */ bne lbl_00000DC0
/* 00000DBC 38A00000 */ li r5, 0
lbl_00000DC0:
/* 00000DC0 2C050000 */ cmpwi r5, 0
/* 00000DC4 40820058 */ bne lbl_00000E1C
/* 00000DC8 54C50739 */ rlwinm. r5, r6, 0, 0x1c, 0x1c
/* 00000DCC 38C00000 */ li r6, 0
/* 00000DD0 41820040 */ beq lbl_00000E10
/* 00000DD4 3CA00000 */ lis r5, controllerInfo@ha
/* 00000DD8 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000DDC A0A500E4 */ lhz r5, 0xe4(r5)
/* 00000DE0 38E00001 */ li r7, 1
/* 00000DE4 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00000DE8 4082001C */ bne lbl_00000E04
/* 00000DEC 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000DF0 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00000DF4 A0A50026 */ lhz r5, 0x26(r5)
/* 00000DF8 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00000DFC 40820008 */ bne lbl_00000E04
/* 00000E00 7CC73378 */ mr r7, r6
lbl_00000E04:
/* 00000E04 2C070000 */ cmpwi r7, 0
/* 00000E08 41820008 */ beq lbl_00000E10
/* 00000E0C 38C00001 */ li r6, 1
lbl_00000E10:
/* 00000E10 2C060000 */ cmpwi r6, 0
/* 00000E14 40820008 */ bne lbl_00000E1C
/* 00000E18 38800000 */ li r4, 0
lbl_00000E1C:
/* 00000E1C 2C040000 */ cmpwi r4, 0
/* 00000E20 41820008 */ beq lbl_00000E28
/* 00000E24 38600001 */ li r3, 1
lbl_00000E28:
/* 00000E28 2C030000 */ cmpwi r3, 0
/* 00000E2C 40820008 */ bne lbl_00000E34
/* 00000E30 38000000 */ li r0, 0
lbl_00000E34:
/* 00000E34 7C060378 */ mr r6, r0
/* 00000E38 48000AC8 */ b lbl_00001900
lbl_00000E3C:
/* 00000E3C 80C50004 */ lwz r6, 4(r5)
/* 00000E40 38000001 */ li r0, 1
/* 00000E44 38600000 */ li r3, 0
/* 00000E48 28060000 */ cmplwi r6, 0
/* 00000E4C 40820110 */ bne lbl_00000F5C
/* 00000E50 3C800000 */ lis r4, controllerInfo@ha
/* 00000E54 39040000 */ addi r8, r4, controllerInfo@l
/* 00000E58 A0E80030 */ lhz r7, 0x30(r8)
/* 00000E5C 7C040378 */ mr r4, r0
/* 00000E60 7C050378 */ mr r5, r0
/* 00000E64 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000E68 7C090378 */ mr r9, r0
/* 00000E6C 7C0A0378 */ mr r10, r0
/* 00000E70 7C0B0378 */ mr r11, r0
/* 00000E74 7C0C0378 */ mr r12, r0
/* 00000E78 7C1F0378 */ mr r31, r0
/* 00000E7C 40820014 */ bne lbl_00000E90
/* 00000E80 A0E8006C */ lhz r7, 0x6c(r8)
/* 00000E84 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000E88 40820008 */ bne lbl_00000E90
/* 00000E8C 7C7F1B78 */ mr r31, r3
lbl_00000E90:
/* 00000E90 2C1F0000 */ cmpwi r31, 0
/* 00000E94 4082001C */ bne lbl_00000EB0
/* 00000E98 3CE00000 */ lis r7, controllerInfo@ha
/* 00000E9C 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000EA0 A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000EA4 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000EA8 40820008 */ bne lbl_00000EB0
/* 00000EAC 39800000 */ li r12, 0
lbl_00000EB0:
/* 00000EB0 2C0C0000 */ cmpwi r12, 0
/* 00000EB4 4082001C */ bne lbl_00000ED0
/* 00000EB8 3CE00000 */ lis r7, controllerInfo@ha
/* 00000EBC 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000EC0 A0E700E4 */ lhz r7, 0xe4(r7)
/* 00000EC4 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000EC8 40820008 */ bne lbl_00000ED0
/* 00000ECC 39600000 */ li r11, 0
lbl_00000ED0:
/* 00000ED0 2C0B0000 */ cmpwi r11, 0
/* 00000ED4 4082001C */ bne lbl_00000EF0
/* 00000ED8 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000EDC 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000EE0 A0E70008 */ lhz r7, 8(r7)
/* 00000EE4 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000EE8 40820008 */ bne lbl_00000EF0
/* 00000EEC 39400000 */ li r10, 0
lbl_00000EF0:
/* 00000EF0 2C0A0000 */ cmpwi r10, 0
/* 00000EF4 4082001C */ bne lbl_00000F10
/* 00000EF8 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000EFC 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000F00 A0E70012 */ lhz r7, 0x12(r7)
/* 00000F04 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000F08 40820008 */ bne lbl_00000F10
/* 00000F0C 39200000 */ li r9, 0
lbl_00000F10:
/* 00000F10 2C090000 */ cmpwi r9, 0
/* 00000F14 4082001C */ bne lbl_00000F30
/* 00000F18 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000F1C 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000F20 A0E7001C */ lhz r7, 0x1c(r7)
/* 00000F24 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000F28 40820008 */ bne lbl_00000F30
/* 00000F2C 38A00000 */ li r5, 0
lbl_00000F30:
/* 00000F30 2C050000 */ cmpwi r5, 0
/* 00000F34 4082001C */ bne lbl_00000F50
/* 00000F38 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000F3C 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00000F40 A0A50026 */ lhz r5, 0x26(r5)
/* 00000F44 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00000F48 40820008 */ bne lbl_00000F50
/* 00000F4C 38800000 */ li r4, 0
lbl_00000F50:
/* 00000F50 2C040000 */ cmpwi r4, 0
/* 00000F54 41820008 */ beq lbl_00000F5C
/* 00000F58 38600001 */ li r3, 1
lbl_00000F5C:
/* 00000F5C 2C030000 */ cmpwi r3, 0
/* 00000F60 40820190 */ bne lbl_000010F0
/* 00000F64 28060000 */ cmplwi r6, 0
/* 00000F68 38600000 */ li r3, 0
/* 00000F6C 41820178 */ beq lbl_000010E4
/* 00000F70 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00000F74 38800001 */ li r4, 1
/* 00000F78 39230000 */ addi r9, r3, 0
/* 00000F7C 38A40000 */ addi r5, r4, 0
/* 00000F80 39040000 */ addi r8, r4, 0
/* 00000F84 41820040 */ beq lbl_00000FC4
/* 00000F88 3CE00000 */ lis r7, controllerInfo@ha
/* 00000F8C 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000F90 A0E70030 */ lhz r7, 0x30(r7)
/* 00000F94 39440000 */ addi r10, r4, 0
/* 00000F98 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000F9C 4082001C */ bne lbl_00000FB8
/* 00000FA0 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000FA4 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000FA8 A0E70008 */ lhz r7, 8(r7)
/* 00000FAC 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000FB0 40820008 */ bne lbl_00000FB8
/* 00000FB4 7C6A1B78 */ mr r10, r3
lbl_00000FB8:
/* 00000FB8 2C0A0000 */ cmpwi r10, 0
/* 00000FBC 41820008 */ beq lbl_00000FC4
/* 00000FC0 39200001 */ li r9, 1
lbl_00000FC4:
/* 00000FC4 2C090000 */ cmpwi r9, 0
/* 00000FC8 40820058 */ bne lbl_00001020
/* 00000FCC 54C707BD */ rlwinm. r7, r6, 0, 0x1e, 0x1e
/* 00000FD0 39200000 */ li r9, 0
/* 00000FD4 41820040 */ beq lbl_00001014
/* 00000FD8 3CE00000 */ lis r7, controllerInfo@ha
/* 00000FDC 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000FE0 A0E7006C */ lhz r7, 0x6c(r7)
/* 00000FE4 39400001 */ li r10, 1
/* 00000FE8 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000FEC 4082001C */ bne lbl_00001008
/* 00000FF0 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00000FF4 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00000FF8 A0E70012 */ lhz r7, 0x12(r7)
/* 00000FFC 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00001000 40820008 */ bne lbl_00001008
/* 00001004 7D2A4B78 */ mr r10, r9
lbl_00001008:
/* 00001008 2C0A0000 */ cmpwi r10, 0
/* 0000100C 41820008 */ beq lbl_00001014
/* 00001010 39200001 */ li r9, 1
lbl_00001014:
/* 00001014 2C090000 */ cmpwi r9, 0
/* 00001018 40820008 */ bne lbl_00001020
/* 0000101C 39000000 */ li r8, 0
lbl_00001020:
/* 00001020 2C080000 */ cmpwi r8, 0
/* 00001024 40820058 */ bne lbl_0000107C
/* 00001028 54C7077B */ rlwinm. r7, r6, 0, 0x1d, 0x1d
/* 0000102C 39000000 */ li r8, 0
/* 00001030 41820040 */ beq lbl_00001070
/* 00001034 3CE00000 */ lis r7, controllerInfo@ha
/* 00001038 38E70000 */ addi r7, r7, controllerInfo@l
/* 0000103C A0E700A8 */ lhz r7, 0xa8(r7)
/* 00001040 39200001 */ li r9, 1
/* 00001044 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00001048 4082001C */ bne lbl_00001064
/* 0000104C 3CE00000 */ lis r7, analogButtonInfo@ha
/* 00001050 38E70000 */ addi r7, r7, analogButtonInfo@l
/* 00001054 A0E7001C */ lhz r7, 0x1c(r7)
/* 00001058 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 0000105C 40820008 */ bne lbl_00001064
/* 00001060 7D094378 */ mr r9, r8
lbl_00001064:
/* 00001064 2C090000 */ cmpwi r9, 0
/* 00001068 41820008 */ beq lbl_00001070
/* 0000106C 39000001 */ li r8, 1
lbl_00001070:
/* 00001070 2C080000 */ cmpwi r8, 0
/* 00001074 40820008 */ bne lbl_0000107C
/* 00001078 38A00000 */ li r5, 0
lbl_0000107C:
/* 0000107C 2C050000 */ cmpwi r5, 0
/* 00001080 40820058 */ bne lbl_000010D8
/* 00001084 54C50739 */ rlwinm. r5, r6, 0, 0x1c, 0x1c
/* 00001088 38C00000 */ li r6, 0
/* 0000108C 41820040 */ beq lbl_000010CC
/* 00001090 3CA00000 */ lis r5, controllerInfo@ha
/* 00001094 38A50000 */ addi r5, r5, controllerInfo@l
/* 00001098 A0A500E4 */ lhz r5, 0xe4(r5)
/* 0000109C 38E00001 */ li r7, 1
/* 000010A0 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 000010A4 4082001C */ bne lbl_000010C0
/* 000010A8 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000010AC 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 000010B0 A0A50026 */ lhz r5, 0x26(r5)
/* 000010B4 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 000010B8 40820008 */ bne lbl_000010C0
/* 000010BC 7CC73378 */ mr r7, r6
lbl_000010C0:
/* 000010C0 2C070000 */ cmpwi r7, 0
/* 000010C4 41820008 */ beq lbl_000010CC
/* 000010C8 38C00001 */ li r6, 1
lbl_000010CC:
/* 000010CC 2C060000 */ cmpwi r6, 0
/* 000010D0 40820008 */ bne lbl_000010D8
/* 000010D4 38800000 */ li r4, 0
lbl_000010D8:
/* 000010D8 2C040000 */ cmpwi r4, 0
/* 000010DC 41820008 */ beq lbl_000010E4
/* 000010E0 38600001 */ li r3, 1
lbl_000010E4:
/* 000010E4 2C030000 */ cmpwi r3, 0
/* 000010E8 40820008 */ bne lbl_000010F0
/* 000010EC 38000000 */ li r0, 0
lbl_000010F0:
/* 000010F0 7C060378 */ mr r6, r0
/* 000010F4 4800080C */ b lbl_00001900
lbl_000010F8:
/* 000010F8 80650004 */ lwz r3, 4(r5)
/* 000010FC 38000001 */ li r0, 1
/* 00001100 38C00000 */ li r6, 0
/* 00001104 28030000 */ cmplwi r3, 0
/* 00001108 40820080 */ bne lbl_00001188
/* 0000110C 3C800000 */ lis r4, controllerInfo@ha
/* 00001110 38A40000 */ addi r5, r4, controllerInfo@l
/* 00001114 A0850018 */ lhz r4, 0x18(r5)
/* 00001118 7C070378 */ mr r7, r0
/* 0000111C 7C080378 */ mr r8, r0
/* 00001120 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001124 7C090378 */ mr r9, r0
/* 00001128 40820014 */ bne lbl_0000113C
/* 0000112C A0850054 */ lhz r4, 0x54(r5)
/* 00001130 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001134 40820008 */ bne lbl_0000113C
/* 00001138 7CC93378 */ mr r9, r6
lbl_0000113C:
/* 0000113C 2C090000 */ cmpwi r9, 0
/* 00001140 4082001C */ bne lbl_0000115C
/* 00001144 3C800000 */ lis r4, controllerInfo@ha
/* 00001148 38840000 */ addi r4, r4, controllerInfo@l
/* 0000114C A0840090 */ lhz r4, 0x90(r4)
/* 00001150 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001154 40820008 */ bne lbl_0000115C
/* 00001158 39000000 */ li r8, 0
lbl_0000115C:
/* 0000115C 2C080000 */ cmpwi r8, 0
/* 00001160 4082001C */ bne lbl_0000117C
/* 00001164 3C800000 */ lis r4, controllerInfo@ha
/* 00001168 38840000 */ addi r4, r4, controllerInfo@l
/* 0000116C A08400CC */ lhz r4, 0xcc(r4)
/* 00001170 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001174 40820008 */ bne lbl_0000117C
/* 00001178 38E00000 */ li r7, 0
lbl_0000117C:
/* 0000117C 2C070000 */ cmpwi r7, 0
/* 00001180 41820008 */ beq lbl_00001188
/* 00001184 38C00001 */ li r6, 1
lbl_00001188:
/* 00001188 2C060000 */ cmpwi r6, 0
/* 0000118C 40820100 */ bne lbl_0000128C
/* 00001190 28030000 */ cmplwi r3, 0
/* 00001194 38A00000 */ li r5, 0
/* 00001198 418200E8 */ beq lbl_00001280
/* 0000119C 546407FF */ clrlwi. r4, r3, 0x1f
/* 000011A0 38C00001 */ li r6, 1
/* 000011A4 38E60000 */ addi r7, r6, 0
/* 000011A8 39060000 */ addi r8, r6, 0
/* 000011AC 39250000 */ addi r9, r5, 0
/* 000011B0 4182001C */ beq lbl_000011CC
/* 000011B4 3C800000 */ lis r4, controllerInfo@ha
/* 000011B8 38840000 */ addi r4, r4, controllerInfo@l
/* 000011BC A0840018 */ lhz r4, 0x18(r4)
/* 000011C0 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 000011C4 41820008 */ beq lbl_000011CC
/* 000011C8 7CC93378 */ mr r9, r6
lbl_000011CC:
/* 000011CC 2C090000 */ cmpwi r9, 0
/* 000011D0 40820034 */ bne lbl_00001204
/* 000011D4 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 000011D8 39200000 */ li r9, 0
/* 000011DC 4182001C */ beq lbl_000011F8
/* 000011E0 3C800000 */ lis r4, controllerInfo@ha
/* 000011E4 38840000 */ addi r4, r4, controllerInfo@l
/* 000011E8 A0840054 */ lhz r4, 0x54(r4)
/* 000011EC 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 000011F0 41820008 */ beq lbl_000011F8
/* 000011F4 39200001 */ li r9, 1
lbl_000011F8:
/* 000011F8 2C090000 */ cmpwi r9, 0
/* 000011FC 40820008 */ bne lbl_00001204
/* 00001200 39000000 */ li r8, 0
lbl_00001204:
/* 00001204 2C080000 */ cmpwi r8, 0
/* 00001208 40820034 */ bne lbl_0000123C
/* 0000120C 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 00001210 39000000 */ li r8, 0
/* 00001214 4182001C */ beq lbl_00001230
/* 00001218 3C800000 */ lis r4, controllerInfo@ha
/* 0000121C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001220 A0840090 */ lhz r4, 0x90(r4)
/* 00001224 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001228 41820008 */ beq lbl_00001230
/* 0000122C 39000001 */ li r8, 1
lbl_00001230:
/* 00001230 2C080000 */ cmpwi r8, 0
/* 00001234 40820008 */ bne lbl_0000123C
/* 00001238 38E00000 */ li r7, 0
lbl_0000123C:
/* 0000123C 2C070000 */ cmpwi r7, 0
/* 00001240 40820034 */ bne lbl_00001274
/* 00001244 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00001248 38800000 */ li r4, 0
/* 0000124C 4182001C */ beq lbl_00001268
/* 00001250 3C600000 */ lis r3, controllerInfo@ha
/* 00001254 38630000 */ addi r3, r3, controllerInfo@l
/* 00001258 A06300CC */ lhz r3, 0xcc(r3)
/* 0000125C 54630673 */ rlwinm. r3, r3, 0, 0x19, 0x19
/* 00001260 41820008 */ beq lbl_00001268
/* 00001264 38800001 */ li r4, 1
lbl_00001268:
/* 00001268 2C040000 */ cmpwi r4, 0
/* 0000126C 40820008 */ bne lbl_00001274
/* 00001270 38C00000 */ li r6, 0
lbl_00001274:
/* 00001274 2C060000 */ cmpwi r6, 0
/* 00001278 41820008 */ beq lbl_00001280
/* 0000127C 38A00001 */ li r5, 1
lbl_00001280:
/* 00001280 2C050000 */ cmpwi r5, 0
/* 00001284 40820008 */ bne lbl_0000128C
/* 00001288 38000000 */ li r0, 0
lbl_0000128C:
/* 0000128C 7C060378 */ mr r6, r0
/* 00001290 48000670 */ b lbl_00001900
lbl_00001294:
/* 00001294 80650004 */ lwz r3, 4(r5)
/* 00001298 38000001 */ li r0, 1
/* 0000129C 38C00000 */ li r6, 0
/* 000012A0 28030000 */ cmplwi r3, 0
/* 000012A4 40820080 */ bne lbl_00001324
/* 000012A8 3C800000 */ lis r4, controllerInfo@ha
/* 000012AC 38A40000 */ addi r5, r4, controllerInfo@l
/* 000012B0 A0850018 */ lhz r4, 0x18(r5)
/* 000012B4 7C070378 */ mr r7, r0
/* 000012B8 7C080378 */ mr r8, r0
/* 000012BC 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 000012C0 7C090378 */ mr r9, r0
/* 000012C4 40820014 */ bne lbl_000012D8
/* 000012C8 A0850054 */ lhz r4, 0x54(r5)
/* 000012CC 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 000012D0 40820008 */ bne lbl_000012D8
/* 000012D4 7CC93378 */ mr r9, r6
lbl_000012D8:
/* 000012D8 2C090000 */ cmpwi r9, 0
/* 000012DC 4082001C */ bne lbl_000012F8
/* 000012E0 3C800000 */ lis r4, controllerInfo@ha
/* 000012E4 38840000 */ addi r4, r4, controllerInfo@l
/* 000012E8 A0840090 */ lhz r4, 0x90(r4)
/* 000012EC 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 000012F0 40820008 */ bne lbl_000012F8
/* 000012F4 39000000 */ li r8, 0
lbl_000012F8:
/* 000012F8 2C080000 */ cmpwi r8, 0
/* 000012FC 4082001C */ bne lbl_00001318
/* 00001300 3C800000 */ lis r4, controllerInfo@ha
/* 00001304 38840000 */ addi r4, r4, controllerInfo@l
/* 00001308 A08400CC */ lhz r4, 0xcc(r4)
/* 0000130C 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 00001310 40820008 */ bne lbl_00001318
/* 00001314 38E00000 */ li r7, 0
lbl_00001318:
/* 00001318 2C070000 */ cmpwi r7, 0
/* 0000131C 41820008 */ beq lbl_00001324
/* 00001320 38C00001 */ li r6, 1
lbl_00001324:
/* 00001324 2C060000 */ cmpwi r6, 0
/* 00001328 40820100 */ bne lbl_00001428
/* 0000132C 28030000 */ cmplwi r3, 0
/* 00001330 38A00000 */ li r5, 0
/* 00001334 418200E8 */ beq lbl_0000141C
/* 00001338 546407FF */ clrlwi. r4, r3, 0x1f
/* 0000133C 38C00001 */ li r6, 1
/* 00001340 38E60000 */ addi r7, r6, 0
/* 00001344 39060000 */ addi r8, r6, 0
/* 00001348 39250000 */ addi r9, r5, 0
/* 0000134C 4182001C */ beq lbl_00001368
/* 00001350 3C800000 */ lis r4, controllerInfo@ha
/* 00001354 38840000 */ addi r4, r4, controllerInfo@l
/* 00001358 A0840018 */ lhz r4, 0x18(r4)
/* 0000135C 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 00001360 41820008 */ beq lbl_00001368
/* 00001364 7CC93378 */ mr r9, r6
lbl_00001368:
/* 00001368 2C090000 */ cmpwi r9, 0
/* 0000136C 40820034 */ bne lbl_000013A0
/* 00001370 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 00001374 39200000 */ li r9, 0
/* 00001378 4182001C */ beq lbl_00001394
/* 0000137C 3C800000 */ lis r4, controllerInfo@ha
/* 00001380 38840000 */ addi r4, r4, controllerInfo@l
/* 00001384 A0840054 */ lhz r4, 0x54(r4)
/* 00001388 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 0000138C 41820008 */ beq lbl_00001394
/* 00001390 39200001 */ li r9, 1
lbl_00001394:
/* 00001394 2C090000 */ cmpwi r9, 0
/* 00001398 40820008 */ bne lbl_000013A0
/* 0000139C 39000000 */ li r8, 0
lbl_000013A0:
/* 000013A0 2C080000 */ cmpwi r8, 0
/* 000013A4 40820034 */ bne lbl_000013D8
/* 000013A8 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 000013AC 39000000 */ li r8, 0
/* 000013B0 4182001C */ beq lbl_000013CC
/* 000013B4 3C800000 */ lis r4, controllerInfo@ha
/* 000013B8 38840000 */ addi r4, r4, controllerInfo@l
/* 000013BC A0840090 */ lhz r4, 0x90(r4)
/* 000013C0 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 000013C4 41820008 */ beq lbl_000013CC
/* 000013C8 39000001 */ li r8, 1
lbl_000013CC:
/* 000013CC 2C080000 */ cmpwi r8, 0
/* 000013D0 40820008 */ bne lbl_000013D8
/* 000013D4 38E00000 */ li r7, 0
lbl_000013D8:
/* 000013D8 2C070000 */ cmpwi r7, 0
/* 000013DC 40820034 */ bne lbl_00001410
/* 000013E0 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 000013E4 38800000 */ li r4, 0
/* 000013E8 4182001C */ beq lbl_00001404
/* 000013EC 3C600000 */ lis r3, controllerInfo@ha
/* 000013F0 38630000 */ addi r3, r3, controllerInfo@l
/* 000013F4 A06300CC */ lhz r3, 0xcc(r3)
/* 000013F8 546306B5 */ rlwinm. r3, r3, 0, 0x1a, 0x1a
/* 000013FC 41820008 */ beq lbl_00001404
/* 00001400 38800001 */ li r4, 1
lbl_00001404:
/* 00001404 2C040000 */ cmpwi r4, 0
/* 00001408 40820008 */ bne lbl_00001410
/* 0000140C 38C00000 */ li r6, 0
lbl_00001410:
/* 00001410 2C060000 */ cmpwi r6, 0
/* 00001414 41820008 */ beq lbl_0000141C
/* 00001418 38A00001 */ li r5, 1
lbl_0000141C:
/* 0000141C 2C050000 */ cmpwi r5, 0
/* 00001420 40820008 */ bne lbl_00001428
/* 00001424 38000000 */ li r0, 0
lbl_00001428:
/* 00001428 7C060378 */ mr r6, r0
/* 0000142C 480004D4 */ b lbl_00001900
lbl_00001430:
/* 00001430 80650004 */ lwz r3, 4(r5)
/* 00001434 38000001 */ li r0, 1
/* 00001438 38C00000 */ li r6, 0
/* 0000143C 28030000 */ cmplwi r3, 0
/* 00001440 40820080 */ bne lbl_000014C0
/* 00001444 3C800000 */ lis r4, controllerInfo@ha
/* 00001448 38A40000 */ addi r5, r4, controllerInfo@l
/* 0000144C A0850018 */ lhz r4, 0x18(r5)
/* 00001450 7C070378 */ mr r7, r0
/* 00001454 7C080378 */ mr r8, r0
/* 00001458 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 0000145C 7C090378 */ mr r9, r0
/* 00001460 40820014 */ bne lbl_00001474
/* 00001464 A0850054 */ lhz r4, 0x54(r5)
/* 00001468 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 0000146C 40820008 */ bne lbl_00001474
/* 00001470 7CC93378 */ mr r9, r6
lbl_00001474:
/* 00001474 2C090000 */ cmpwi r9, 0
/* 00001478 4082001C */ bne lbl_00001494
/* 0000147C 3C800000 */ lis r4, controllerInfo@ha
/* 00001480 38840000 */ addi r4, r4, controllerInfo@l
/* 00001484 A0840090 */ lhz r4, 0x90(r4)
/* 00001488 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 0000148C 40820008 */ bne lbl_00001494
/* 00001490 39000000 */ li r8, 0
lbl_00001494:
/* 00001494 2C080000 */ cmpwi r8, 0
/* 00001498 4082001C */ bne lbl_000014B4
/* 0000149C 3C800000 */ lis r4, controllerInfo@ha
/* 000014A0 38840000 */ addi r4, r4, controllerInfo@l
/* 000014A4 A08400CC */ lhz r4, 0xcc(r4)
/* 000014A8 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 000014AC 40820008 */ bne lbl_000014B4
/* 000014B0 38E00000 */ li r7, 0
lbl_000014B4:
/* 000014B4 2C070000 */ cmpwi r7, 0
/* 000014B8 41820008 */ beq lbl_000014C0
/* 000014BC 38C00001 */ li r6, 1
lbl_000014C0:
/* 000014C0 2C060000 */ cmpwi r6, 0
/* 000014C4 40820100 */ bne lbl_000015C4
/* 000014C8 28030000 */ cmplwi r3, 0
/* 000014CC 38A00000 */ li r5, 0
/* 000014D0 418200E8 */ beq lbl_000015B8
/* 000014D4 546407FF */ clrlwi. r4, r3, 0x1f
/* 000014D8 38C00001 */ li r6, 1
/* 000014DC 38E60000 */ addi r7, r6, 0
/* 000014E0 39060000 */ addi r8, r6, 0
/* 000014E4 39250000 */ addi r9, r5, 0
/* 000014E8 4182001C */ beq lbl_00001504
/* 000014EC 3C800000 */ lis r4, controllerInfo@ha
/* 000014F0 38840000 */ addi r4, r4, controllerInfo@l
/* 000014F4 A0840018 */ lhz r4, 0x18(r4)
/* 000014F8 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 000014FC 41820008 */ beq lbl_00001504
/* 00001500 7CC93378 */ mr r9, r6
lbl_00001504:
/* 00001504 2C090000 */ cmpwi r9, 0
/* 00001508 40820034 */ bne lbl_0000153C
/* 0000150C 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 00001510 39200000 */ li r9, 0
/* 00001514 4182001C */ beq lbl_00001530
/* 00001518 3C800000 */ lis r4, controllerInfo@ha
/* 0000151C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001520 A0840054 */ lhz r4, 0x54(r4)
/* 00001524 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 00001528 41820008 */ beq lbl_00001530
/* 0000152C 39200001 */ li r9, 1
lbl_00001530:
/* 00001530 2C090000 */ cmpwi r9, 0
/* 00001534 40820008 */ bne lbl_0000153C
/* 00001538 39000000 */ li r8, 0
lbl_0000153C:
/* 0000153C 2C080000 */ cmpwi r8, 0
/* 00001540 40820034 */ bne lbl_00001574
/* 00001544 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 00001548 39000000 */ li r8, 0
/* 0000154C 4182001C */ beq lbl_00001568
/* 00001550 3C800000 */ lis r4, controllerInfo@ha
/* 00001554 38840000 */ addi r4, r4, controllerInfo@l
/* 00001558 A0840090 */ lhz r4, 0x90(r4)
/* 0000155C 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 00001560 41820008 */ beq lbl_00001568
/* 00001564 39000001 */ li r8, 1
lbl_00001568:
/* 00001568 2C080000 */ cmpwi r8, 0
/* 0000156C 40820008 */ bne lbl_00001574
/* 00001570 38E00000 */ li r7, 0
lbl_00001574:
/* 00001574 2C070000 */ cmpwi r7, 0
/* 00001578 40820034 */ bne lbl_000015AC
/* 0000157C 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00001580 38800000 */ li r4, 0
/* 00001584 4182001C */ beq lbl_000015A0
/* 00001588 3C600000 */ lis r3, controllerInfo@ha
/* 0000158C 38630000 */ addi r3, r3, controllerInfo@l
/* 00001590 A06300CC */ lhz r3, 0xcc(r3)
/* 00001594 546305EF */ rlwinm. r3, r3, 0, 0x17, 0x17
/* 00001598 41820008 */ beq lbl_000015A0
/* 0000159C 38800001 */ li r4, 1
lbl_000015A0:
/* 000015A0 2C040000 */ cmpwi r4, 0
/* 000015A4 40820008 */ bne lbl_000015AC
/* 000015A8 38C00000 */ li r6, 0
lbl_000015AC:
/* 000015AC 2C060000 */ cmpwi r6, 0
/* 000015B0 41820008 */ beq lbl_000015B8
/* 000015B4 38A00001 */ li r5, 1
lbl_000015B8:
/* 000015B8 2C050000 */ cmpwi r5, 0
/* 000015BC 40820008 */ bne lbl_000015C4
/* 000015C0 38000000 */ li r0, 0
lbl_000015C4:
/* 000015C4 7C060378 */ mr r6, r0
/* 000015C8 48000338 */ b lbl_00001900
lbl_000015CC:
/* 000015CC 80650004 */ lwz r3, 4(r5)
/* 000015D0 38000001 */ li r0, 1
/* 000015D4 38C00000 */ li r6, 0
/* 000015D8 28030000 */ cmplwi r3, 0
/* 000015DC 40820080 */ bne lbl_0000165C
/* 000015E0 3C800000 */ lis r4, controllerInfo@ha
/* 000015E4 38A40000 */ addi r5, r4, controllerInfo@l
/* 000015E8 A0850018 */ lhz r4, 0x18(r5)
/* 000015EC 7C070378 */ mr r7, r0
/* 000015F0 7C080378 */ mr r8, r0
/* 000015F4 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 000015F8 7C090378 */ mr r9, r0
/* 000015FC 40820014 */ bne lbl_00001610
/* 00001600 A0850054 */ lhz r4, 0x54(r5)
/* 00001604 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00001608 40820008 */ bne lbl_00001610
/* 0000160C 7CC93378 */ mr r9, r6
lbl_00001610:
/* 00001610 2C090000 */ cmpwi r9, 0
/* 00001614 4082001C */ bne lbl_00001630
/* 00001618 3C800000 */ lis r4, controllerInfo@ha
/* 0000161C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001620 A0840090 */ lhz r4, 0x90(r4)
/* 00001624 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00001628 40820008 */ bne lbl_00001630
/* 0000162C 39000000 */ li r8, 0
lbl_00001630:
/* 00001630 2C080000 */ cmpwi r8, 0
/* 00001634 4082001C */ bne lbl_00001650
/* 00001638 3C800000 */ lis r4, controllerInfo@ha
/* 0000163C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001640 A08400CC */ lhz r4, 0xcc(r4)
/* 00001644 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00001648 40820008 */ bne lbl_00001650
/* 0000164C 38E00000 */ li r7, 0
lbl_00001650:
/* 00001650 2C070000 */ cmpwi r7, 0
/* 00001654 41820008 */ beq lbl_0000165C
/* 00001658 38C00001 */ li r6, 1
lbl_0000165C:
/* 0000165C 2C060000 */ cmpwi r6, 0
/* 00001660 40820100 */ bne lbl_00001760
/* 00001664 28030000 */ cmplwi r3, 0
/* 00001668 38A00000 */ li r5, 0
/* 0000166C 418200E8 */ beq lbl_00001754
/* 00001670 546407FF */ clrlwi. r4, r3, 0x1f
/* 00001674 38C00001 */ li r6, 1
/* 00001678 38E60000 */ addi r7, r6, 0
/* 0000167C 39060000 */ addi r8, r6, 0
/* 00001680 39250000 */ addi r9, r5, 0
/* 00001684 4182001C */ beq lbl_000016A0
/* 00001688 3C800000 */ lis r4, controllerInfo@ha
/* 0000168C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001690 A0840018 */ lhz r4, 0x18(r4)
/* 00001694 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00001698 41820008 */ beq lbl_000016A0
/* 0000169C 7CC93378 */ mr r9, r6
lbl_000016A0:
/* 000016A0 2C090000 */ cmpwi r9, 0
/* 000016A4 40820034 */ bne lbl_000016D8
/* 000016A8 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 000016AC 39200000 */ li r9, 0
/* 000016B0 4182001C */ beq lbl_000016CC
/* 000016B4 3C800000 */ lis r4, controllerInfo@ha
/* 000016B8 38840000 */ addi r4, r4, controllerInfo@l
/* 000016BC A0840054 */ lhz r4, 0x54(r4)
/* 000016C0 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 000016C4 41820008 */ beq lbl_000016CC
/* 000016C8 39200001 */ li r9, 1
lbl_000016CC:
/* 000016CC 2C090000 */ cmpwi r9, 0
/* 000016D0 40820008 */ bne lbl_000016D8
/* 000016D4 39000000 */ li r8, 0
lbl_000016D8:
/* 000016D8 2C080000 */ cmpwi r8, 0
/* 000016DC 40820034 */ bne lbl_00001710
/* 000016E0 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 000016E4 39000000 */ li r8, 0
/* 000016E8 4182001C */ beq lbl_00001704
/* 000016EC 3C800000 */ lis r4, controllerInfo@ha
/* 000016F0 38840000 */ addi r4, r4, controllerInfo@l
/* 000016F4 A0840090 */ lhz r4, 0x90(r4)
/* 000016F8 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 000016FC 41820008 */ beq lbl_00001704
/* 00001700 39000001 */ li r8, 1
lbl_00001704:
/* 00001704 2C080000 */ cmpwi r8, 0
/* 00001708 40820008 */ bne lbl_00001710
/* 0000170C 38E00000 */ li r7, 0
lbl_00001710:
/* 00001710 2C070000 */ cmpwi r7, 0
/* 00001714 40820034 */ bne lbl_00001748
/* 00001718 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000171C 38800000 */ li r4, 0
/* 00001720 4182001C */ beq lbl_0000173C
/* 00001724 3C600000 */ lis r3, controllerInfo@ha
/* 00001728 38630000 */ addi r3, r3, controllerInfo@l
/* 0000172C A06300CC */ lhz r3, 0xcc(r3)
/* 00001730 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00001734 41820008 */ beq lbl_0000173C
/* 00001738 38800001 */ li r4, 1
lbl_0000173C:
/* 0000173C 2C040000 */ cmpwi r4, 0
/* 00001740 40820008 */ bne lbl_00001748
/* 00001744 38C00000 */ li r6, 0
lbl_00001748:
/* 00001748 2C060000 */ cmpwi r6, 0
/* 0000174C 41820008 */ beq lbl_00001754
/* 00001750 38A00001 */ li r5, 1
lbl_00001754:
/* 00001754 2C050000 */ cmpwi r5, 0
/* 00001758 40820008 */ bne lbl_00001760
/* 0000175C 38000000 */ li r0, 0
lbl_00001760:
/* 00001760 7C060378 */ mr r6, r0
/* 00001764 4800019C */ b lbl_00001900
lbl_00001768:
/* 00001768 80650004 */ lwz r3, 4(r5)
/* 0000176C 38000001 */ li r0, 1
/* 00001770 38C00000 */ li r6, 0
/* 00001774 28030000 */ cmplwi r3, 0
/* 00001778 40820080 */ bne lbl_000017F8
/* 0000177C 3C800000 */ lis r4, controllerInfo@ha
/* 00001780 38A40000 */ addi r5, r4, controllerInfo@l
/* 00001784 A0850018 */ lhz r4, 0x18(r5)
/* 00001788 7C070378 */ mr r7, r0
/* 0000178C 7C080378 */ mr r8, r0
/* 00001790 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 00001794 7C090378 */ mr r9, r0
/* 00001798 40820014 */ bne lbl_000017AC
/* 0000179C A0850054 */ lhz r4, 0x54(r5)
/* 000017A0 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 000017A4 40820008 */ bne lbl_000017AC
/* 000017A8 7CC93378 */ mr r9, r6
lbl_000017AC:
/* 000017AC 2C090000 */ cmpwi r9, 0
/* 000017B0 4082001C */ bne lbl_000017CC
/* 000017B4 3C800000 */ lis r4, controllerInfo@ha
/* 000017B8 38840000 */ addi r4, r4, controllerInfo@l
/* 000017BC A0840090 */ lhz r4, 0x90(r4)
/* 000017C0 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 000017C4 40820008 */ bne lbl_000017CC
/* 000017C8 39000000 */ li r8, 0
lbl_000017CC:
/* 000017CC 2C080000 */ cmpwi r8, 0
/* 000017D0 4082001C */ bne lbl_000017EC
/* 000017D4 3C800000 */ lis r4, controllerInfo@ha
/* 000017D8 38840000 */ addi r4, r4, controllerInfo@l
/* 000017DC A08400CC */ lhz r4, 0xcc(r4)
/* 000017E0 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 000017E4 40820008 */ bne lbl_000017EC
/* 000017E8 38E00000 */ li r7, 0
lbl_000017EC:
/* 000017EC 2C070000 */ cmpwi r7, 0
/* 000017F0 41820008 */ beq lbl_000017F8
/* 000017F4 38C00001 */ li r6, 1
lbl_000017F8:
/* 000017F8 2C060000 */ cmpwi r6, 0
/* 000017FC 40820100 */ bne lbl_000018FC
/* 00001800 28030000 */ cmplwi r3, 0
/* 00001804 38A00000 */ li r5, 0
/* 00001808 418200E8 */ beq lbl_000018F0
/* 0000180C 546407FF */ clrlwi. r4, r3, 0x1f
/* 00001810 38C00001 */ li r6, 1
/* 00001814 38E60000 */ addi r7, r6, 0
/* 00001818 39060000 */ addi r8, r6, 0
/* 0000181C 39250000 */ addi r9, r5, 0
/* 00001820 4182001C */ beq lbl_0000183C
/* 00001824 3C800000 */ lis r4, controllerInfo@ha
/* 00001828 38840000 */ addi r4, r4, controllerInfo@l
/* 0000182C A0840018 */ lhz r4, 0x18(r4)
/* 00001830 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 00001834 41820008 */ beq lbl_0000183C
/* 00001838 7CC93378 */ mr r9, r6
lbl_0000183C:
/* 0000183C 2C090000 */ cmpwi r9, 0
/* 00001840 40820034 */ bne lbl_00001874
/* 00001844 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 00001848 39200000 */ li r9, 0
/* 0000184C 4182001C */ beq lbl_00001868
/* 00001850 3C800000 */ lis r4, controllerInfo@ha
/* 00001854 38840000 */ addi r4, r4, controllerInfo@l
/* 00001858 A0840054 */ lhz r4, 0x54(r4)
/* 0000185C 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 00001860 41820008 */ beq lbl_00001868
/* 00001864 39200001 */ li r9, 1
lbl_00001868:
/* 00001868 2C090000 */ cmpwi r9, 0
/* 0000186C 40820008 */ bne lbl_00001874
/* 00001870 39000000 */ li r8, 0
lbl_00001874:
/* 00001874 2C080000 */ cmpwi r8, 0
/* 00001878 40820034 */ bne lbl_000018AC
/* 0000187C 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 00001880 39000000 */ li r8, 0
/* 00001884 4182001C */ beq lbl_000018A0
/* 00001888 3C800000 */ lis r4, controllerInfo@ha
/* 0000188C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001890 A0840090 */ lhz r4, 0x90(r4)
/* 00001894 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 00001898 41820008 */ beq lbl_000018A0
/* 0000189C 39000001 */ li r8, 1
lbl_000018A0:
/* 000018A0 2C080000 */ cmpwi r8, 0
/* 000018A4 40820008 */ bne lbl_000018AC
/* 000018A8 38E00000 */ li r7, 0
lbl_000018AC:
/* 000018AC 2C070000 */ cmpwi r7, 0
/* 000018B0 40820034 */ bne lbl_000018E4
/* 000018B4 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 000018B8 38800000 */ li r4, 0
/* 000018BC 4182001C */ beq lbl_000018D8
/* 000018C0 3C600000 */ lis r3, controllerInfo@ha
/* 000018C4 38630000 */ addi r3, r3, controllerInfo@l
/* 000018C8 A06300CC */ lhz r3, 0xcc(r3)
/* 000018CC 5463056B */ rlwinm. r3, r3, 0, 0x15, 0x15
/* 000018D0 41820008 */ beq lbl_000018D8
/* 000018D4 38800001 */ li r4, 1
lbl_000018D8:
/* 000018D8 2C040000 */ cmpwi r4, 0
/* 000018DC 40820008 */ bne lbl_000018E4
/* 000018E0 38C00000 */ li r6, 0
lbl_000018E4:
/* 000018E4 2C060000 */ cmpwi r6, 0
/* 000018E8 41820008 */ beq lbl_000018F0
/* 000018EC 38A00001 */ li r5, 1
lbl_000018F0:
/* 000018F0 2C050000 */ cmpwi r5, 0
/* 000018F4 40820008 */ bne lbl_000018FC
/* 000018F8 38000000 */ li r0, 0
lbl_000018FC:
/* 000018FC 7C060378 */ mr r6, r0
lbl_00001900:
/* 00001900 83E10014 */ lwz r31, 0x14(r1)
/* 00001904 7CC33378 */ mr r3, r6
/* 00001908 38210018 */ addi r1, r1, 0x18
/* 0000190C 4E800020 */ blr 

glabel lbl_00001910
/* 00001910 3C600000 */ lis r3, controllerInfo@ha
/* 00001914 38830000 */ addi r4, r3, controllerInfo@l
/* 00001918 8804000A */ lbz r0, 0xa(r4)
/* 0000191C 38600000 */ li r3, 0
/* 00001920 7C000775 */ extsb. r0, r0
/* 00001924 40820008 */ bne lbl_0000192C
/* 00001928 38600001 */ li r3, 1
lbl_0000192C:
/* 0000192C 3884003C */ addi r4, r4, 0x3c
/* 00001930 8804000A */ lbz r0, 0xa(r4)
/* 00001934 7C000775 */ extsb. r0, r0
/* 00001938 40820008 */ bne lbl_00001940
/* 0000193C 38630001 */ addi r3, r3, 1
lbl_00001940:
/* 00001940 88040046 */ lbz r0, 0x46(r4)
/* 00001944 3884003C */ addi r4, r4, 0x3c
/* 00001948 7C000775 */ extsb. r0, r0
/* 0000194C 40820008 */ bne lbl_00001954
/* 00001950 38630001 */ addi r3, r3, 1
lbl_00001954:
/* 00001954 88040046 */ lbz r0, 0x46(r4)
/* 00001958 7C000775 */ extsb. r0, r0
/* 0000195C 4C820020 */ bnelr 
/* 00001960 38630001 */ addi r3, r3, 1
/* 00001964 4E800020 */ blr 

glabel lbl_00001968
/* 00001968 3C600000 */ lis r3, modeCtrl@ha
/* 0000196C 38630000 */ addi r3, r3, modeCtrl@l
/* 00001970 80030028 */ lwz r0, 0x28(r3)
/* 00001974 38600000 */ li r3, 0
/* 00001978 2C000002 */ cmpwi r0, 2
/* 0000197C 41820178 */ beq lbl_00001AF4
/* 00001980 40800010 */ bge lbl_00001990
/* 00001984 2C000001 */ cmpwi r0, 1
/* 00001988 40800014 */ bge lbl_0000199C
/* 0000198C 48000168 */ b lbl_00001AF4
lbl_00001990:
/* 00001990 2C000005 */ cmpwi r0, 5
/* 00001994 40800160 */ bge lbl_00001AF4
/* 00001998 480000B8 */ b lbl_00001A50
lbl_0000199C:
/* 0000199C 3C800000 */ lis r4, controllerInfo@ha
/* 000019A0 38840000 */ addi r4, r4, controllerInfo@l
/* 000019A4 8804000A */ lbz r0, 0xa(r4)
/* 000019A8 38A00000 */ li r5, 0
/* 000019AC 7C000775 */ extsb. r0, r0
/* 000019B0 40820008 */ bne lbl_000019B8
/* 000019B4 38A00001 */ li r5, 1
lbl_000019B8:
/* 000019B8 3884003C */ addi r4, r4, 0x3c
/* 000019BC 8804000A */ lbz r0, 0xa(r4)
/* 000019C0 7C000775 */ extsb. r0, r0
/* 000019C4 40820008 */ bne lbl_000019CC
/* 000019C8 38A50001 */ addi r5, r5, 1
lbl_000019CC:
/* 000019CC 88040046 */ lbz r0, 0x46(r4)
/* 000019D0 3884003C */ addi r4, r4, 0x3c
/* 000019D4 7C000775 */ extsb. r0, r0
/* 000019D8 40820008 */ bne lbl_000019E0
/* 000019DC 38A50001 */ addi r5, r5, 1
lbl_000019E0:
/* 000019E0 88040046 */ lbz r0, 0x46(r4)
/* 000019E4 7C000775 */ extsb. r0, r0
/* 000019E8 40820008 */ bne lbl_000019F0
/* 000019EC 38A50001 */ addi r5, r5, 1
lbl_000019F0:
/* 000019F0 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 000019F4 38840000 */ addi r4, r4, lbl_801EEDA8@l
/* 000019F8 38C4003C */ addi r6, r4, 0x3c
/* 000019FC 3C800000 */ lis r4, modeCtrl@ha
/* 00001A00 90A60000 */ stw r5, 0(r6)
/* 00001A04 38840000 */ addi r4, r4, modeCtrl@l
/* 00001A08 38A40024 */ addi r5, r4, 0x24
/* 00001A0C 80860000 */ lwz r4, 0(r6)
/* 00001A10 80050000 */ lwz r0, 0(r5)
/* 00001A14 7C002000 */ cmpw r0, r4
/* 00001A18 40810008 */ ble lbl_00001A20
/* 00001A1C 90850000 */ stw r4, 0(r5)
lbl_00001A20:
/* 00001A20 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00001A24 80050000 */ lwz r0, 0(r5)
/* 00001A28 38840000 */ addi r4, r4, lbl_801EEDA8@l
/* 00001A2C 80840040 */ lwz r4, 0x40(r4)
/* 00001A30 7C002000 */ cmpw r0, r4
/* 00001A34 40800008 */ bge lbl_00001A3C
/* 00001A38 90850000 */ stw r4, 0(r5)
lbl_00001A3C:
/* 00001A3C 80060000 */ lwz r0, 0(r6)
/* 00001A40 2C000002 */ cmpwi r0, 2
/* 00001A44 4C800020 */ bgelr 
/* 00001A48 38600001 */ li r3, 1
/* 00001A4C 4E800020 */ blr 
lbl_00001A50:
/* 00001A50 3C800000 */ lis r4, controllerInfo@ha
/* 00001A54 38840000 */ addi r4, r4, controllerInfo@l
/* 00001A58 8804000A */ lbz r0, 0xa(r4)
/* 00001A5C 38A00000 */ li r5, 0
/* 00001A60 7C000775 */ extsb. r0, r0
/* 00001A64 40820008 */ bne lbl_00001A6C
/* 00001A68 38A00001 */ li r5, 1
lbl_00001A6C:
/* 00001A6C 3884003C */ addi r4, r4, 0x3c
/* 00001A70 8804000A */ lbz r0, 0xa(r4)
/* 00001A74 7C000775 */ extsb. r0, r0
/* 00001A78 40820008 */ bne lbl_00001A80
/* 00001A7C 38A50001 */ addi r5, r5, 1
lbl_00001A80:
/* 00001A80 88040046 */ lbz r0, 0x46(r4)
/* 00001A84 3884003C */ addi r4, r4, 0x3c
/* 00001A88 7C000775 */ extsb. r0, r0
/* 00001A8C 40820008 */ bne lbl_00001A94
/* 00001A90 38A50001 */ addi r5, r5, 1
lbl_00001A94:
/* 00001A94 88040046 */ lbz r0, 0x46(r4)
/* 00001A98 7C000775 */ extsb. r0, r0
/* 00001A9C 40820008 */ bne lbl_00001AA4
/* 00001AA0 38A50001 */ addi r5, r5, 1
lbl_00001AA4:
/* 00001AA4 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00001AA8 38840000 */ addi r4, r4, lbl_801EEDA8@l
/* 00001AAC 38C4003C */ addi r6, r4, 0x3c
/* 00001AB0 3C800000 */ lis r4, modeCtrl@ha
/* 00001AB4 90A60000 */ stw r5, 0(r6)
/* 00001AB8 38840000 */ addi r4, r4, modeCtrl@l
/* 00001ABC 38A40024 */ addi r5, r4, 0x24
/* 00001AC0 80860000 */ lwz r4, 0(r6)
/* 00001AC4 80050000 */ lwz r0, 0(r5)
/* 00001AC8 7C002000 */ cmpw r0, r4
/* 00001ACC 40810008 */ ble lbl_00001AD4
/* 00001AD0 90850000 */ stw r4, 0(r5)
lbl_00001AD4:
/* 00001AD4 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00001AD8 80050000 */ lwz r0, 0(r5)
/* 00001ADC 38840000 */ addi r4, r4, lbl_801EEDA8@l
/* 00001AE0 80840040 */ lwz r4, 0x40(r4)
/* 00001AE4 7C002000 */ cmpw r0, r4
/* 00001AE8 4C800020 */ bgelr 
/* 00001AEC 90850000 */ stw r4, 0(r5)
/* 00001AF0 4E800020 */ blr 
lbl_00001AF4:
/* 00001AF4 3C800000 */ lis r4, modeCtrl@ha
/* 00001AF8 38A40000 */ addi r5, r4, modeCtrl@l
/* 00001AFC 84050024 */ lwzu r0, 0x24(r5)
/* 00001B00 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00001B04 38840000 */ addi r4, r4, lbl_801EEDA8@l
/* 00001B08 8084003C */ lwz r4, 0x3c(r4)
/* 00001B0C 7C002000 */ cmpw r0, r4
/* 00001B10 40810008 */ ble lbl_00001B18
/* 00001B14 90850000 */ stw r4, 0(r5)
lbl_00001B18:
/* 00001B18 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00001B1C 80050000 */ lwz r0, 0(r5)
/* 00001B20 38840000 */ addi r4, r4, lbl_801EEDA8@l
/* 00001B24 80840040 */ lwz r4, 0x40(r4)
/* 00001B28 7C002000 */ cmpw r0, r4
/* 00001B2C 4C800020 */ bgelr 
/* 00001B30 90850000 */ stw r4, 0(r5)
/* 00001B34 4E800020 */ blr 

glabel lbl_00001B38
/* 00001B38 7C0802A6 */ mflr r0
/* 00001B3C 3C600000 */ lis r3, modeCtrl@ha
/* 00001B40 90010004 */ stw r0, 4(r1)
/* 00001B44 38630000 */ addi r3, r3, modeCtrl@l
/* 00001B48 9421FFA8 */ stwu r1, -0x58(r1)
/* 00001B4C 93E10054 */ stw r31, 0x54(r1)
/* 00001B50 3BE00000 */ li r31, 0
/* 00001B54 93C10050 */ stw r30, 0x50(r1)
/* 00001B58 93A1004C */ stw r29, 0x4c(r1)
/* 00001B5C 80030028 */ lwz r0, 0x28(r3)
/* 00001B60 2C000003 */ cmpwi r0, 3
/* 00001B64 41820090 */ beq lbl_00001BF4
/* 00001B68 40800010 */ bge lbl_00001B78
/* 00001B6C 2C000001 */ cmpwi r0, 1
/* 00001B70 41820010 */ beq lbl_00001B80
/* 00001B74 48000104 */ b lbl_00001C78
lbl_00001B78:
/* 00001B78 2C000005 */ cmpwi r0, 5
/* 00001B7C 408000FC */ bge lbl_00001C78
lbl_00001B80:
/* 00001B80 3C600000 */ lis r3, controllerInfo@ha
/* 00001B84 38630000 */ addi r3, r3, controllerInfo@l
/* 00001B88 8803000A */ lbz r0, 0xa(r3)
/* 00001B8C 38800000 */ li r4, 0
/* 00001B90 7C000775 */ extsb. r0, r0
/* 00001B94 40820008 */ bne lbl_00001B9C
/* 00001B98 38800001 */ li r4, 1
lbl_00001B9C:
/* 00001B9C 3863003C */ addi r3, r3, 0x3c
/* 00001BA0 8803000A */ lbz r0, 0xa(r3)
/* 00001BA4 7C000775 */ extsb. r0, r0
/* 00001BA8 40820008 */ bne lbl_00001BB0
/* 00001BAC 38840001 */ addi r4, r4, 1
lbl_00001BB0:
/* 00001BB0 88030046 */ lbz r0, 0x46(r3)
/* 00001BB4 3863003C */ addi r3, r3, 0x3c
/* 00001BB8 7C000775 */ extsb. r0, r0
/* 00001BBC 40820008 */ bne lbl_00001BC4
/* 00001BC0 38840001 */ addi r4, r4, 1
lbl_00001BC4:
/* 00001BC4 88030046 */ lbz r0, 0x46(r3)
/* 00001BC8 7C000775 */ extsb. r0, r0
/* 00001BCC 40820008 */ bne lbl_00001BD4
/* 00001BD0 38840001 */ addi r4, r4, 1
lbl_00001BD4:
/* 00001BD4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00001BD8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00001BDC 88030114 */ lbz r0, 0x114(r3)
/* 00001BE0 7C000774 */ extsb r0, r0
/* 00001BE4 7C002000 */ cmpw r0, r4
/* 00001BE8 41820090 */ beq lbl_00001C78
/* 00001BEC 3BE00001 */ li r31, 1
/* 00001BF0 48000088 */ b lbl_00001C78
lbl_00001BF4:
/* 00001BF4 3C600000 */ lis r3, lbl_801EED88@ha
/* 00001BF8 38630000 */ addi r3, r3, lbl_801EED88@l
/* 00001BFC 8003000C */ lwz r0, 0xc(r3)
/* 00001C00 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00001C04 40820074 */ bne lbl_00001C78
/* 00001C08 3C600000 */ lis r3, controllerInfo@ha
/* 00001C0C 38630000 */ addi r3, r3, controllerInfo@l
/* 00001C10 8803000A */ lbz r0, 0xa(r3)
/* 00001C14 38800000 */ li r4, 0
/* 00001C18 7C000775 */ extsb. r0, r0
/* 00001C1C 40820008 */ bne lbl_00001C24
/* 00001C20 38800001 */ li r4, 1
lbl_00001C24:
/* 00001C24 3863003C */ addi r3, r3, 0x3c
/* 00001C28 8803000A */ lbz r0, 0xa(r3)
/* 00001C2C 7C000775 */ extsb. r0, r0
/* 00001C30 40820008 */ bne lbl_00001C38
/* 00001C34 38840001 */ addi r4, r4, 1
lbl_00001C38:
/* 00001C38 88030046 */ lbz r0, 0x46(r3)
/* 00001C3C 3863003C */ addi r3, r3, 0x3c
/* 00001C40 7C000775 */ extsb. r0, r0
/* 00001C44 40820008 */ bne lbl_00001C4C
/* 00001C48 38840001 */ addi r4, r4, 1
lbl_00001C4C:
/* 00001C4C 88030046 */ lbz r0, 0x46(r3)
/* 00001C50 7C000775 */ extsb. r0, r0
/* 00001C54 40820008 */ bne lbl_00001C5C
/* 00001C58 38840001 */ addi r4, r4, 1
lbl_00001C5C:
/* 00001C5C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00001C60 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00001C64 88030114 */ lbz r0, 0x114(r3)
/* 00001C68 7C000774 */ extsb r0, r0
/* 00001C6C 7C002000 */ cmpw r0, r4
/* 00001C70 41820008 */ beq lbl_00001C78
/* 00001C74 3BE00001 */ li r31, 1
lbl_00001C78:
/* 00001C78 2C1F0000 */ cmpwi r31, 0
/* 00001C7C 4182008C */ beq lbl_00001D08
/* 00001C80 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00001C84 3BC30000 */ addi r30, r3, lbl_801EEDA8@l
/* 00001C88 3BBE0044 */ addi r29, r30, 0x44
/* 00001C8C 801E0044 */ lwz r0, 0x44(r30)
/* 00001C90 2C000000 */ cmpwi r0, 0
/* 00001C94 408200A4 */ bne lbl_00001D38
/* 00001C98 38610018 */ addi r3, r1, 0x18
/* 00001C9C 38800000 */ li r4, 0
/* 00001CA0 38A00028 */ li r5, 0x28
/* 00001CA4 4BFFE4E5 */ bl memset
/* 00001CA8 38000140 */ li r0, 0x140
/* 00001CAC B0010024 */ sth r0, 0x24(r1)
/* 00001CB0 38000118 */ li r0, 0x118
/* 00001CB4 38600002 */ li r3, 2
/* 00001CB8 B0010026 */ sth r0, 0x26(r1)
/* 00001CBC 3800000E */ li r0, 0xe
/* 00001CC0 38A10018 */ addi r5, r1, 0x18
/* 00001CC4 9861002D */ stb r3, 0x2d(r1)
/* 00001CC8 38600001 */ li r3, 1
/* 00001CCC 38800001 */ li r4, 1
/* 00001CD0 9801002E */ stb r0, 0x2e(r1)
/* 00001CD4 4BFFE4B5 */ bl textbox_set_properties
/* 00001CD8 3C600000 */ lis r3, lbl_0001225C@ha
/* 00001CDC 38830000 */ addi r4, r3, lbl_0001225C@l
/* 00001CE0 38600001 */ li r3, 1
/* 00001CE4 4BFFE4A5 */ bl textbox_add_text
/* 00001CE8 38000001 */ li r0, 1
/* 00001CEC 901D0000 */ stw r0, 0(r29)
/* 00001CF0 38000000 */ li r0, 0
/* 00001CF4 901E0048 */ stw r0, 0x48(r30)
/* 00001CF8 901E004C */ stw r0, 0x4c(r30)
/* 00001CFC 901E0050 */ stw r0, 0x50(r30)
/* 00001D00 901E0054 */ stw r0, 0x54(r30)
/* 00001D04 48000034 */ b lbl_00001D38
lbl_00001D08:
/* 00001D08 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00001D0C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00001D10 3BA30044 */ addi r29, r3, 0x44
/* 00001D14 80030044 */ lwz r0, 0x44(r3)
/* 00001D18 2C000000 */ cmpwi r0, 0
/* 00001D1C 4182001C */ beq lbl_00001D38
/* 00001D20 38600001 */ li r3, 1
/* 00001D24 38800014 */ li r4, 0x14
/* 00001D28 38A00000 */ li r5, 0
/* 00001D2C 4BFFE45D */ bl textbox_set_properties
/* 00001D30 38000000 */ li r0, 0
/* 00001D34 901D0000 */ stw r0, 0(r29)
lbl_00001D38:
/* 00001D38 8001005C */ lwz r0, 0x5c(r1)
/* 00001D3C 7FE3FB78 */ mr r3, r31
/* 00001D40 83E10054 */ lwz r31, 0x54(r1)
/* 00001D44 83C10050 */ lwz r30, 0x50(r1)
/* 00001D48 7C0803A6 */ mtlr r0
/* 00001D4C 83A1004C */ lwz r29, 0x4c(r1)
/* 00001D50 38210058 */ addi r1, r1, 0x58
/* 00001D54 4E800020 */ blr 

glabel lbl_00001D58
/* 00001D58 7C0802A6 */ mflr r0
/* 00001D5C 3860000A */ li r3, 0xa
/* 00001D60 90010004 */ stw r0, 4(r1)
/* 00001D64 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001D68 93E1000C */ stw r31, 0xc(r1)
/* 00001D6C 3BE00000 */ li r31, 0
/* 00001D70 4BFFE419 */ bl find_sprite_with_tag
/* 00001D74 28030000 */ cmplwi r3, 0
/* 00001D78 41820008 */ beq lbl_00001D80
/* 00001D7C 3BE00001 */ li r31, 1
lbl_00001D80:
/* 00001D80 28030000 */ cmplwi r3, 0
/* 00001D84 40820030 */ bne lbl_00001DB4
/* 00001D88 38600008 */ li r3, 8
/* 00001D8C 4BFFE849 */ bl lbl_000005D4
/* 00001D90 2C030000 */ cmpwi r3, 0
/* 00001D94 4182005C */ beq lbl_00001DF0
/* 00001D98 3860006E */ li r3, 0x6e
/* 00001D9C 4BFFE3ED */ bl u_play_sound_0
/* 00001DA0 3860000C */ li r3, 0xc
/* 00001DA4 4BFFE3E5 */ bl call_bitmap_load_group
/* 00001DA8 4BFFE3E1 */ bl func_80081F30
/* 00001DAC 3BE00001 */ li r31, 1
/* 00001DB0 48000040 */ b lbl_00001DF0
lbl_00001DB4:
/* 00001DB4 38600008 */ li r3, 8
/* 00001DB8 4BFFE81D */ bl lbl_000005D4
/* 00001DBC 2C030000 */ cmpwi r3, 0
/* 00001DC0 40820014 */ bne lbl_00001DD4
/* 00001DC4 38600007 */ li r3, 7
/* 00001DC8 4BFFE80D */ bl lbl_000005D4
/* 00001DCC 2C030000 */ cmpwi r3, 0
/* 00001DD0 41820020 */ beq lbl_00001DF0
lbl_00001DD4:
/* 00001DD4 38600070 */ li r3, 0x70
/* 00001DD8 4BFFE3B1 */ bl u_play_sound_0
/* 00001DDC 3860000A */ li r3, 0xa
/* 00001DE0 4BFFE3A9 */ bl destroy_sprite_with_tag
/* 00001DE4 3860000C */ li r3, 0xc
/* 00001DE8 4BFFE3A1 */ bl call_bitmap_free_group
/* 00001DEC 3BE00001 */ li r31, 1
lbl_00001DF0:
/* 00001DF0 3860000A */ li r3, 0xa
/* 00001DF4 4BFFE395 */ bl find_sprite_with_tag
/* 00001DF8 80010014 */ lwz r0, 0x14(r1)
/* 00001DFC 7FE3FB78 */ mr r3, r31
/* 00001E00 83E1000C */ lwz r31, 0xc(r1)
/* 00001E04 38210010 */ addi r1, r1, 0x10
/* 00001E08 7C0803A6 */ mtlr r0
/* 00001E0C 4E800020 */ blr 

glabel lbl_00001E10
/* 00001E10 7C0802A6 */ mflr r0
/* 00001E14 90010004 */ stw r0, 4(r1)
/* 00001E18 38000001 */ li r0, 1
/* 00001E1C 9421FFA8 */ stwu r1, -0x58(r1)
/* 00001E20 BEE10034 */ stmw r23, 0x34(r1)
/* 00001E24 3B260000 */ addi r25, r6, 0
/* 00001E28 3AE30000 */ addi r23, r3, 0
/* 00001E2C 2C190048 */ cmpwi r25, 0x48
/* 00001E30 3B040000 */ addi r24, r4, 0
/* 00001E34 3B450000 */ addi r26, r5, 0
/* 00001E38 7C030378 */ mr r3, r0
/* 00001E3C 90E10024 */ stw r7, 0x24(r1)
/* 00001E40 91010028 */ stw r8, 0x28(r1)
/* 00001E44 9121002C */ stw r9, 0x2c(r1)
/* 00001E48 41820010 */ beq lbl_00001E58
/* 00001E4C 2C190045 */ cmpwi r25, 0x45
/* 00001E50 41820008 */ beq lbl_00001E58
/* 00001E54 38600000 */ li r3, 0
lbl_00001E58:
/* 00001E58 2C030000 */ cmpwi r3, 0
/* 00001E5C 40820010 */ bne lbl_00001E6C
/* 00001E60 2C19004A */ cmpwi r25, 0x4a
/* 00001E64 41820008 */ beq lbl_00001E6C
/* 00001E68 38000000 */ li r0, 0
lbl_00001E6C:
/* 00001E6C 2C000000 */ cmpwi r0, 0
/* 00001E70 4182000C */ beq lbl_00001E7C
/* 00001E74 3BC00001 */ li r30, 1
/* 00001E78 48000008 */ b lbl_00001E80
lbl_00001E7C:
/* 00001E7C 3BC00002 */ li r30, 2
lbl_00001E80:
/* 00001E80 2C190032 */ cmpwi r25, 0x32
/* 00001E84 40820070 */ bne lbl_00001EF4
/* 00001E88 38600001 */ li r3, 1
/* 00001E8C 4BFFE749 */ bl lbl_000005D4
/* 00001E90 2C030000 */ cmpwi r3, 0
/* 00001E94 41820028 */ beq lbl_00001EBC
/* 00001E98 80770000 */ lwz r3, 0(r23)
/* 00001E9C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00001EA0 7C00C000 */ cmpw r0, r24
/* 00001EA4 90170000 */ stw r0, 0(r23)
/* 00001EA8 4080000C */ bge lbl_00001EB4
/* 00001EAC 7C1EC214 */ add r0, r30, r24
/* 00001EB0 90170000 */ stw r0, 0(r23)
lbl_00001EB4:
/* 00001EB4 3860006C */ li r3, 0x6c
/* 00001EB8 4BFFE2D1 */ bl u_play_sound_0
lbl_00001EBC:
/* 00001EBC 38600000 */ li r3, 0
/* 00001EC0 4BFFE715 */ bl lbl_000005D4
/* 00001EC4 2C030000 */ cmpwi r3, 0
/* 00001EC8 41820094 */ beq lbl_00001F5C
/* 00001ECC 80770000 */ lwz r3, 0(r23)
/* 00001ED0 7C1EC214 */ add r0, r30, r24
/* 00001ED4 38630001 */ addi r3, r3, 1
/* 00001ED8 7C030000 */ cmpw r3, r0
/* 00001EDC 90770000 */ stw r3, 0(r23)
/* 00001EE0 40810008 */ ble lbl_00001EE8
/* 00001EE4 93170000 */ stw r24, 0(r23)
lbl_00001EE8:
/* 00001EE8 3860006C */ li r3, 0x6c
/* 00001EEC 4BFFE29D */ bl u_play_sound_0
/* 00001EF0 4800006C */ b lbl_00001F5C
lbl_00001EF4:
/* 00001EF4 38600000 */ li r3, 0
/* 00001EF8 4BFFE6DD */ bl lbl_000005D4
/* 00001EFC 2C030000 */ cmpwi r3, 0
/* 00001F00 41820028 */ beq lbl_00001F28
/* 00001F04 80770000 */ lwz r3, 0(r23)
/* 00001F08 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00001F0C 7C00C000 */ cmpw r0, r24
/* 00001F10 90170000 */ stw r0, 0(r23)
/* 00001F14 4080000C */ bge lbl_00001F20
/* 00001F18 7C1EC214 */ add r0, r30, r24
/* 00001F1C 90170000 */ stw r0, 0(r23)
lbl_00001F20:
/* 00001F20 3860006C */ li r3, 0x6c
/* 00001F24 4BFFE265 */ bl u_play_sound_0
lbl_00001F28:
/* 00001F28 38600001 */ li r3, 1
/* 00001F2C 4BFFE6A9 */ bl lbl_000005D4
/* 00001F30 2C030000 */ cmpwi r3, 0
/* 00001F34 41820028 */ beq lbl_00001F5C
/* 00001F38 80770000 */ lwz r3, 0(r23)
/* 00001F3C 7C1EC214 */ add r0, r30, r24
/* 00001F40 38630001 */ addi r3, r3, 1
/* 00001F44 7C030000 */ cmpw r3, r0
/* 00001F48 90770000 */ stw r3, 0(r23)
/* 00001F4C 40810008 */ ble lbl_00001F54
/* 00001F50 93170000 */ stw r24, 0(r23)
lbl_00001F54:
/* 00001F54 3860006C */ li r3, 0x6c
/* 00001F58 4BFFE231 */ bl u_play_sound_0
lbl_00001F5C:
/* 00001F5C 80170000 */ lwz r0, 0(r23)
/* 00001F60 38600017 */ li r3, 0x17
/* 00001F64 7C1A0214 */ add r0, r26, r0
/* 00001F68 7F580050 */ subf r26, r24, r0
/* 00001F6C 4BFFE21D */ bl find_sprite_with_tag
/* 00001F70 28030000 */ cmplwi r3, 0
/* 00001F74 41820008 */ beq lbl_00001F7C
/* 00001F78 93430048 */ stw r26, 0x48(r3)
lbl_00001F7C:
/* 00001F7C 2C190039 */ cmpwi r25, 0x39
/* 00001F80 41820020 */ beq lbl_00001FA0
/* 00001F84 40800010 */ bge lbl_00001F94
/* 00001F88 2C190032 */ cmpwi r25, 0x32
/* 00001F8C 41820118 */ beq lbl_000020A4
/* 00001F90 480002B4 */ b lbl_00002244
lbl_00001F94:
/* 00001F94 2C19003F */ cmpwi r25, 0x3f
/* 00001F98 41820200 */ beq lbl_00002198
/* 00001F9C 480002A8 */ b lbl_00002244
lbl_00001FA0:
/* 00001FA0 80170000 */ lwz r0, 0(r23)
/* 00001FA4 2C000002 */ cmpwi r0, 2
/* 00001FA8 4082029C */ bne lbl_00002244
/* 00001FAC 3B400000 */ li r26, 0
/* 00001FB0 38600000 */ li r3, 0
/* 00001FB4 38800001 */ li r4, 1
/* 00001FB8 38A00000 */ li r5, 0
/* 00001FBC 4BFFE1CD */ bl is_floor_visited
/* 00001FC0 2C030000 */ cmpwi r3, 0
/* 00001FC4 40820034 */ bne lbl_00001FF8
/* 00001FC8 38600001 */ li r3, 1
/* 00001FCC 38800001 */ li r4, 1
/* 00001FD0 38A00000 */ li r5, 0
/* 00001FD4 4BFFE1B5 */ bl is_floor_visited
/* 00001FD8 2C030000 */ cmpwi r3, 0
/* 00001FDC 4082001C */ bne lbl_00001FF8
/* 00001FE0 38600002 */ li r3, 2
/* 00001FE4 38800001 */ li r4, 1
/* 00001FE8 38A00000 */ li r5, 0
/* 00001FEC 4BFFE19D */ bl is_floor_visited
/* 00001FF0 2C030000 */ cmpwi r3, 0
/* 00001FF4 41820008 */ beq lbl_00001FFC
lbl_00001FF8:
/* 00001FF8 3B400001 */ li r26, 1
lbl_00001FFC:
/* 00001FFC 38600006 */ li r3, 6
/* 00002000 4BFFE189 */ bl is_minigame_unlocked
/* 00002004 2C030000 */ cmpwi r3, 0
/* 00002008 41820008 */ beq lbl_00002010
/* 0000200C 3B5A0001 */ addi r26, r26, 1
lbl_00002010:
/* 00002010 38600007 */ li r3, 7
/* 00002014 4BFFE175 */ bl is_minigame_unlocked
/* 00002018 2C030000 */ cmpwi r3, 0
/* 0000201C 41820008 */ beq lbl_00002024
/* 00002020 3B5A0001 */ addi r26, r26, 1
lbl_00002024:
/* 00002024 38600008 */ li r3, 8
/* 00002028 4BFFE161 */ bl is_minigame_unlocked
/* 0000202C 2C030000 */ cmpwi r3, 0
/* 00002030 41820008 */ beq lbl_00002038
/* 00002034 3B5A0001 */ addi r26, r26, 1
lbl_00002038:
/* 00002038 4BFFE151 */ bl are_all_continues_unlocked
/* 0000203C 2C030000 */ cmpwi r3, 0
/* 00002040 41820008 */ beq lbl_00002048
/* 00002044 3B5A0001 */ addi r26, r26, 1
lbl_00002048:
/* 00002048 2C1A0000 */ cmpwi r26, 0
/* 0000204C 4081001C */ ble lbl_00002068
/* 00002050 38600017 */ li r3, 0x17
/* 00002054 4BFFE135 */ bl find_sprite_with_tag
/* 00002058 28030000 */ cmplwi r3, 0
/* 0000205C 4182000C */ beq lbl_00002068
/* 00002060 381A0013 */ addi r0, r26, 0x13
/* 00002064 90030048 */ stw r0, 0x48(r3)
lbl_00002068:
/* 00002068 2C1A0000 */ cmpwi r26, 0
/* 0000206C 418001D8 */ blt lbl_00002244
/* 00002070 2C1A0003 */ cmpwi r26, 3
/* 00002074 418101D0 */ bgt lbl_00002244
/* 00002078 3C600000 */ lis r3, g_totalPlayPoints@ha
/* 0000207C 80030000 */ lwz r0, g_totalPlayPoints@l(r3)
/* 00002080 280009C4 */ cmplwi r0, 0x9c4
/* 00002084 418001C0 */ blt lbl_00002244
/* 00002088 38600017 */ li r3, 0x17
/* 0000208C 4BFFE0FD */ bl find_sprite_with_tag
/* 00002090 28030000 */ cmplwi r3, 0
/* 00002094 418201B0 */ beq lbl_00002244
/* 00002098 38000019 */ li r0, 0x19
/* 0000209C 90030048 */ stw r0, 0x48(r3)
/* 000020A0 480001A4 */ b lbl_00002244
lbl_000020A4:
/* 000020A4 80970000 */ lwz r4, 0(r23)
/* 000020A8 2C040000 */ cmpwi r4, 0
/* 000020AC 40820078 */ bne lbl_00002124
/* 000020B0 3B400000 */ li r26, 0
/* 000020B4 38600006 */ li r3, 6
/* 000020B8 4BFFE0D1 */ bl is_minigame_unlocked
/* 000020BC 2C030000 */ cmpwi r3, 0
/* 000020C0 41820008 */ beq lbl_000020C8
/* 000020C4 3B400001 */ li r26, 1
lbl_000020C8:
/* 000020C8 38600007 */ li r3, 7
/* 000020CC 4BFFE0BD */ bl is_minigame_unlocked
/* 000020D0 2C030000 */ cmpwi r3, 0
/* 000020D4 41820008 */ beq lbl_000020DC
/* 000020D8 3B5A0001 */ addi r26, r26, 1
lbl_000020DC:
/* 000020DC 38600008 */ li r3, 8
/* 000020E0 4BFFE0A9 */ bl is_minigame_unlocked
/* 000020E4 2C030000 */ cmpwi r3, 0
/* 000020E8 41820008 */ beq lbl_000020F0
/* 000020EC 3B5A0001 */ addi r26, r26, 1
lbl_000020F0:
/* 000020F0 4BFFE099 */ bl are_all_continues_unlocked
/* 000020F4 2C030000 */ cmpwi r3, 0
/* 000020F8 41820008 */ beq lbl_00002100
/* 000020FC 3B5A0001 */ addi r26, r26, 1
lbl_00002100:
/* 00002100 2C1A0000 */ cmpwi r26, 0
/* 00002104 40810140 */ ble lbl_00002244
/* 00002108 38600017 */ li r3, 0x17
/* 0000210C 4BFFE07D */ bl find_sprite_with_tag
/* 00002110 28030000 */ cmplwi r3, 0
/* 00002114 41820130 */ beq lbl_00002244
/* 00002118 381A0005 */ addi r0, r26, 5
/* 0000211C 90030048 */ stw r0, 0x48(r3)
/* 00002120 48000124 */ b lbl_00002244
lbl_00002124:
/* 00002124 2C040001 */ cmpwi r4, 1
/* 00002128 40820034 */ bne lbl_0000215C
/* 0000212C 5480103A */ slwi r0, r4, 2
/* 00002130 38610024 */ addi r3, r1, 0x24
/* 00002134 7C03002E */ lwzx r0, r3, r0
/* 00002138 2C000000 */ cmpwi r0, 0
/* 0000213C 41820020 */ beq lbl_0000215C
/* 00002140 38600017 */ li r3, 0x17
/* 00002144 4BFFE045 */ bl find_sprite_with_tag
/* 00002148 28030000 */ cmplwi r3, 0
/* 0000214C 418200F8 */ beq lbl_00002244
/* 00002150 38000004 */ li r0, 4
/* 00002154 90030048 */ stw r0, 0x48(r3)
/* 00002158 480000EC */ b lbl_00002244
lbl_0000215C:
/* 0000215C 2C040002 */ cmpwi r4, 2
/* 00002160 408200E4 */ bne lbl_00002244
/* 00002164 80170000 */ lwz r0, 0(r23)
/* 00002168 38610024 */ addi r3, r1, 0x24
/* 0000216C 5400103A */ slwi r0, r0, 2
/* 00002170 7C03002E */ lwzx r0, r3, r0
/* 00002174 2C000000 */ cmpwi r0, 0
/* 00002178 418200CC */ beq lbl_00002244
/* 0000217C 38600017 */ li r3, 0x17
/* 00002180 4BFFE009 */ bl find_sprite_with_tag
/* 00002184 28030000 */ cmplwi r3, 0
/* 00002188 418200BC */ beq lbl_00002244
/* 0000218C 38000005 */ li r0, 5
/* 00002190 90030048 */ stw r0, 0x48(r3)
/* 00002194 480000B0 */ b lbl_00002244
lbl_00002198:
/* 00002198 3C600000 */ lis r3, g_totalPlayPoints@ha
/* 0000219C 80030000 */ lwz r0, g_totalPlayPoints@l(r3)
/* 000021A0 280009C4 */ cmplwi r0, 0x9c4
/* 000021A4 4180006C */ blt lbl_00002210
/* 000021A8 381E0001 */ addi r0, r30, 1
/* 000021AC 2C1E0000 */ cmpwi r30, 0
/* 000021B0 7C0903A6 */ mtctr r0
/* 000021B4 38810024 */ addi r4, r1, 0x24
/* 000021B8 38000002 */ li r0, 2
/* 000021BC 4180001C */ blt lbl_000021D8
lbl_000021C0:
/* 000021C0 80640000 */ lwz r3, 0(r4)
/* 000021C4 2C030000 */ cmpwi r3, 0
/* 000021C8 41820008 */ beq lbl_000021D0
/* 000021CC 90040000 */ stw r0, 0(r4)
lbl_000021D0:
/* 000021D0 38840004 */ addi r4, r4, 4
/* 000021D4 4200FFEC */ bdnz lbl_000021C0
lbl_000021D8:
/* 000021D8 80170000 */ lwz r0, 0(r23)
/* 000021DC 38610024 */ addi r3, r1, 0x24
/* 000021E0 7C180050 */ subf r0, r24, r0
/* 000021E4 5400103A */ slwi r0, r0, 2
/* 000021E8 7C03002E */ lwzx r0, r3, r0
/* 000021EC 2C000000 */ cmpwi r0, 0
/* 000021F0 41820054 */ beq lbl_00002244
/* 000021F4 38600017 */ li r3, 0x17
/* 000021F8 4BFFDF91 */ bl find_sprite_with_tag
/* 000021FC 28030000 */ cmplwi r3, 0
/* 00002200 41820044 */ beq lbl_00002244
/* 00002204 3800003D */ li r0, 0x3d
/* 00002208 90030048 */ stw r0, 0x48(r3)
/* 0000220C 48000038 */ b lbl_00002244
lbl_00002210:
/* 00002210 80170000 */ lwz r0, 0(r23)
/* 00002214 38610024 */ addi r3, r1, 0x24
/* 00002218 7C180050 */ subf r0, r24, r0
/* 0000221C 5400103A */ slwi r0, r0, 2
/* 00002220 7C03002E */ lwzx r0, r3, r0
/* 00002224 2C000000 */ cmpwi r0, 0
/* 00002228 4182001C */ beq lbl_00002244
/* 0000222C 38600017 */ li r3, 0x17
/* 00002230 4BFFDF59 */ bl find_sprite_with_tag
/* 00002234 28030000 */ cmplwi r3, 0
/* 00002238 4182000C */ beq lbl_00002244
/* 0000223C 3800003C */ li r0, 0x3c
/* 00002240 90030048 */ stw r0, 0x48(r3)
lbl_00002244:
/* 00002244 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002248 3BE30000 */ addi r31, r3, lbl_801EEDA8@l
/* 0000224C 3B9F0000 */ addi r28, r31, 0
/* 00002250 3BA10024 */ addi r29, r1, 0x24
/* 00002254 3B400000 */ li r26, 0
/* 00002258 480000E4 */ b lbl_0000233C
lbl_0000225C:
/* 0000225C 7F79D214 */ add r27, r25, r26
/* 00002260 387B0000 */ addi r3, r27, 0
/* 00002264 4BFFDF25 */ bl find_sprite_with_tag
/* 00002268 28030000 */ cmplwi r3, 0
/* 0000226C 418200C4 */ beq lbl_00002330
/* 00002270 80B70000 */ lwz r5, 0(r23)
/* 00002274 7C98D214 */ add r4, r24, r26
/* 00002278 7C052000 */ cmpw r5, r4
/* 0000227C 40820028 */ bne lbl_000022A4
/* 00002280 801D0000 */ lwz r0, 0(r29)
/* 00002284 2C000002 */ cmpwi r0, 2
/* 00002288 4082001C */ bne lbl_000022A4
/* 0000228C 3800000B */ li r0, 0xb
/* 00002290 90030048 */ stw r0, 0x48(r3)
/* 00002294 3800FFFF */ li r0, -1
/* 00002298 937F0068 */ stw r27, 0x68(r31)
/* 0000229C 901C006C */ stw r0, 0x6c(r28)
/* 000022A0 48000090 */ b lbl_00002330
lbl_000022A4:
/* 000022A4 7C052000 */ cmpw r5, r4
/* 000022A8 40820028 */ bne lbl_000022D0
/* 000022AC 801D0000 */ lwz r0, 0(r29)
/* 000022B0 2C000000 */ cmpwi r0, 0
/* 000022B4 4182001C */ beq lbl_000022D0
/* 000022B8 38000009 */ li r0, 9
/* 000022BC 90030048 */ stw r0, 0x48(r3)
/* 000022C0 3800FFFF */ li r0, -1
/* 000022C4 937F0068 */ stw r27, 0x68(r31)
/* 000022C8 901C006C */ stw r0, 0x6c(r28)
/* 000022CC 48000064 */ b lbl_00002330
lbl_000022D0:
/* 000022D0 7C052000 */ cmpw r5, r4
/* 000022D4 4082001C */ bne lbl_000022F0
/* 000022D8 38000001 */ li r0, 1
/* 000022DC 90030048 */ stw r0, 0x48(r3)
/* 000022E0 3800FFFF */ li r0, -1
/* 000022E4 937F0068 */ stw r27, 0x68(r31)
/* 000022E8 901C006C */ stw r0, 0x6c(r28)
/* 000022EC 48000044 */ b lbl_00002330
lbl_000022F0:
/* 000022F0 801D0000 */ lwz r0, 0(r29)
/* 000022F4 2C000002 */ cmpwi r0, 2
/* 000022F8 40820014 */ bne lbl_0000230C
/* 000022FC 3800000A */ li r0, 0xa
/* 00002300 90030048 */ stw r0, 0x48(r3)
/* 00002304 937C006C */ stw r27, 0x6c(r28)
/* 00002308 48000028 */ b lbl_00002330
lbl_0000230C:
/* 0000230C 2C000000 */ cmpwi r0, 0
/* 00002310 41820014 */ beq lbl_00002324
/* 00002314 38000008 */ li r0, 8
/* 00002318 90030048 */ stw r0, 0x48(r3)
/* 0000231C 937C006C */ stw r27, 0x6c(r28)
/* 00002320 48000010 */ b lbl_00002330
lbl_00002324:
/* 00002324 38000000 */ li r0, 0
/* 00002328 90030048 */ stw r0, 0x48(r3)
/* 0000232C 937C006C */ stw r27, 0x6c(r28)
lbl_00002330:
/* 00002330 3BBD0004 */ addi r29, r29, 4
/* 00002334 3B9C0004 */ addi r28, r28, 4
/* 00002338 3B5A0001 */ addi r26, r26, 1
lbl_0000233C:
/* 0000233C 7C1AF000 */ cmpw r26, r30
/* 00002340 4081FF1C */ ble lbl_0000225C
/* 00002344 BAE10034 */ lmw r23, 0x34(r1)
/* 00002348 8001005C */ lwz r0, 0x5c(r1)
/* 0000234C 38210058 */ addi r1, r1, 0x58
/* 00002350 7C0803A6 */ mtlr r0
/* 00002354 4E800020 */ blr 

glabel lbl_00002358
/* 00002358 2C030000 */ cmpwi r3, 0
/* 0000235C 4182007C */ beq lbl_000023D8
/* 00002360 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002364 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00002368 80030048 */ lwz r0, 0x48(r3)
/* 0000236C 38A00000 */ li r5, 0
/* 00002370 2C000000 */ cmpwi r0, 0
/* 00002374 41820008 */ beq lbl_0000237C
/* 00002378 38A00001 */ li r5, 1
lbl_0000237C:
/* 0000237C 38630004 */ addi r3, r3, 4
/* 00002380 80030048 */ lwz r0, 0x48(r3)
/* 00002384 2C000000 */ cmpwi r0, 0
/* 00002388 41820008 */ beq lbl_00002390
/* 0000238C 38A50001 */ addi r5, r5, 1
lbl_00002390:
/* 00002390 8003004C */ lwz r0, 0x4c(r3)
/* 00002394 38630004 */ addi r3, r3, 4
/* 00002398 2C000000 */ cmpwi r0, 0
/* 0000239C 41820008 */ beq lbl_000023A4
/* 000023A0 38A50001 */ addi r5, r5, 1
lbl_000023A4:
/* 000023A4 8003004C */ lwz r0, 0x4c(r3)
/* 000023A8 2C000000 */ cmpwi r0, 0
/* 000023AC 41820008 */ beq lbl_000023B4
/* 000023B0 38A50001 */ addi r5, r5, 1
lbl_000023B4:
/* 000023B4 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000023B8 38630000 */ addi r3, r3, lbl_80206BD0@l
/* 000023BC 54A0103A */ slwi r0, r5, 2
/* 000023C0 7C630214 */ add r3, r3, r0
/* 000023C4 8003FFFC */ lwz r0, -4(r3)
/* 000023C8 7C040000 */ cmpw r4, r0
/* 000023CC 408200B0 */ bne lbl_0000247C
/* 000023D0 38600001 */ li r3, 1
/* 000023D4 4E800020 */ blr 
lbl_000023D8:
/* 000023D8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000023DC 38A30000 */ addi r5, r3, lbl_801EEDA8@l
/* 000023E0 80050048 */ lwz r0, 0x48(r5)
/* 000023E4 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000023E8 38630000 */ addi r3, r3, lbl_80206BD0@l
/* 000023EC 2C000000 */ cmpwi r0, 0
/* 000023F0 41820018 */ beq lbl_00002408
/* 000023F4 80030000 */ lwz r0, 0(r3)
/* 000023F8 7C040000 */ cmpw r4, r0
/* 000023FC 4082000C */ bne lbl_00002408
/* 00002400 38600001 */ li r3, 1
/* 00002404 4E800020 */ blr 
lbl_00002408:
/* 00002408 38A50004 */ addi r5, r5, 4
/* 0000240C 80050048 */ lwz r0, 0x48(r5)
/* 00002410 38630004 */ addi r3, r3, 4
/* 00002414 2C000000 */ cmpwi r0, 0
/* 00002418 41820018 */ beq lbl_00002430
/* 0000241C 80030000 */ lwz r0, 0(r3)
/* 00002420 7C040000 */ cmpw r4, r0
/* 00002424 4082000C */ bne lbl_00002430
/* 00002428 38600001 */ li r3, 1
/* 0000242C 4E800020 */ blr 
lbl_00002430:
/* 00002430 8005004C */ lwz r0, 0x4c(r5)
/* 00002434 38A50004 */ addi r5, r5, 4
/* 00002438 38630004 */ addi r3, r3, 4
/* 0000243C 2C000000 */ cmpwi r0, 0
/* 00002440 41820018 */ beq lbl_00002458
/* 00002444 80030000 */ lwz r0, 0(r3)
/* 00002448 7C040000 */ cmpw r4, r0
/* 0000244C 4082000C */ bne lbl_00002458
/* 00002450 38600001 */ li r3, 1
/* 00002454 4E800020 */ blr 
lbl_00002458:
/* 00002458 8005004C */ lwz r0, 0x4c(r5)
/* 0000245C 38630004 */ addi r3, r3, 4
/* 00002460 2C000000 */ cmpwi r0, 0
/* 00002464 41820018 */ beq lbl_0000247C
/* 00002468 80030000 */ lwz r0, 0(r3)
/* 0000246C 7C040000 */ cmpw r4, r0
/* 00002470 4082000C */ bne lbl_0000247C
/* 00002474 38600001 */ li r3, 1
/* 00002478 4E800020 */ blr 
lbl_0000247C:
/* 0000247C 38600000 */ li r3, 0
/* 00002480 4E800020 */ blr 

glabel lbl_00002484
/* 00002484 7C0802A6 */ mflr r0
/* 00002488 3CC00000 */ lis r6, lbl_801EEDA8@ha
/* 0000248C 90010004 */ stw r0, 4(r1)
/* 00002490 39060000 */ addi r8, r6, lbl_801EEDA8@l
/* 00002494 39200001 */ li r9, 1
/* 00002498 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000249C 3CC00000 */ lis r6, lbl_802F1DFC@ha
/* 000024A0 93E1001C */ stw r31, 0x1c(r1)
/* 000024A4 3BE40000 */ addi r31, r4, 0
/* 000024A8 57EA103A */ slwi r10, r31, 2
/* 000024AC 93C10018 */ stw r30, 0x18(r1)
/* 000024B0 3C800000 */ lis r4, lbl_80206BD0@ha
/* 000024B4 7D085214 */ add r8, r8, r10
/* 000024B8 38E40000 */ addi r7, r4, lbl_80206BD0@l
/* 000024BC 91280048 */ stw r9, 0x48(r8)
/* 000024C0 3C800000 */ lis r4, playerCharacterSelection@ha
/* 000024C4 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 000024C8 7CE75214 */ add r7, r7, r10
/* 000024CC 90670000 */ stw r3, 0(r7)
/* 000024D0 7FC05214 */ add r30, r0, r10
/* 000024D4 3C800000 */ lis r4, lbl_802F1DF8@ha
/* 000024D8 801E0000 */ lwz r0, 0(r30)
/* 000024DC 90060000 */ stw r0, lbl_802F1DFC@l(r6)
/* 000024E0 2C000002 */ cmpwi r0, 2
/* 000024E4 90A40000 */ stw r5, lbl_802F1DF8@l(r4)
/* 000024E8 41820044 */ beq lbl_0000252C
/* 000024EC 40800014 */ bge lbl_00002500
/* 000024F0 2C000000 */ cmpwi r0, 0
/* 000024F4 41820018 */ beq lbl_0000250C
/* 000024F8 40800024 */ bge lbl_0000251C
/* 000024FC 4800004C */ b lbl_00002548
lbl_00002500:
/* 00002500 2C000004 */ cmpwi r0, 4
/* 00002504 40800044 */ bge lbl_00002548
/* 00002508 48000034 */ b lbl_0000253C
lbl_0000250C:
/* 0000250C 3C600100 */ lis r3, 0x100
/* 00002510 3863004F */ addi r3, r3, 0x4f
/* 00002514 4BFFDC75 */ bl u_play_sound_0
/* 00002518 48000030 */ b lbl_00002548
lbl_0000251C:
/* 0000251C 3C6001D8 */ lis r3, 0x1d8
/* 00002520 3863004F */ addi r3, r3, 0x4f
/* 00002524 4BFFDC65 */ bl u_play_sound_0
/* 00002528 48000020 */ b lbl_00002548
lbl_0000252C:
/* 0000252C 3C600028 */ lis r3, 0x28
/* 00002530 3863004F */ addi r3, r3, 0x4f
/* 00002534 4BFFDC55 */ bl u_play_sound_0
/* 00002538 48000010 */ b lbl_00002548
lbl_0000253C:
/* 0000253C 3C6000FC */ lis r3, 0xfc
/* 00002540 3863004F */ addi r3, r3, 0x4f
/* 00002544 4BFFDC45 */ bl u_play_sound_0
lbl_00002548:
/* 00002548 38600065 */ li r3, 0x65
/* 0000254C 4BFFDC3D */ bl u_play_sound_0
/* 00002550 80DE0000 */ lwz r6, 0(r30)
/* 00002554 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00002558 3C600000 */ lis r3, lbl_802F1C10@ha
/* 0000255C 38A40000 */ addi r5, r4, lbl_801EEDA8@l
/* 00002560 54C4103A */ slwi r4, r6, 2
/* 00002564 38030000 */ addi r0, r3, lbl_802F1C10@l
/* 00002568 7C652214 */ add r3, r5, r4
/* 0000256C 3880001E */ li r4, 0x1e
/* 00002570 90830058 */ stw r4, 0x58(r3)
/* 00002574 7CC40774 */ extsb r4, r6
/* 00002578 7C60FA14 */ add r3, r0, r31
/* 0000257C 98830004 */ stb r4, 4(r3)
/* 00002580 38600001 */ li r3, 1
/* 00002584 80010024 */ lwz r0, 0x24(r1)
/* 00002588 83E1001C */ lwz r31, 0x1c(r1)
/* 0000258C 83C10018 */ lwz r30, 0x18(r1)
/* 00002590 38210020 */ addi r1, r1, 0x20
/* 00002594 7C0803A6 */ mtlr r0
/* 00002598 4E800020 */ blr 

glabel lbl_0000259C
/* 0000259C 7C0802A6 */ mflr r0
/* 000025A0 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000025A4 90010004 */ stw r0, 4(r1)
/* 000025A8 9421FFF0 */ stwu r1, -0x10(r1)
/* 000025AC 93E1000C */ stw r31, 0xc(r1)
/* 000025B0 3BE30000 */ addi r31, r3, lbl_802F1FB4@l
/* 000025B4 807F0000 */ lwz r3, 0(r31)
/* 000025B8 38830004 */ addi r4, r3, 4
/* 000025BC 80630004 */ lwz r3, 4(r3)
/* 000025C0 54650739 */ rlwinm. r5, r3, 0, 0x1c, 0x1c
/* 000025C4 40820094 */ bne lbl_00002658
/* 000025C8 38600002 */ li r3, 2
/* 000025CC 38800001 */ li r4, 1
/* 000025D0 38A00010 */ li r5, 0x10
/* 000025D4 4BFFDBB5 */ bl is_floor_visited
/* 000025D8 2C030000 */ cmpwi r3, 0
/* 000025DC 41820018 */ beq lbl_000025F4
/* 000025E0 807F0000 */ lwz r3, 0(r31)
/* 000025E4 80030004 */ lwz r0, 4(r3)
/* 000025E8 60000018 */ ori r0, r0, 0x18
/* 000025EC 90030004 */ stw r0, 4(r3)
/* 000025F0 48000098 */ b lbl_00002688
lbl_000025F4:
/* 000025F4 38600000 */ li r3, 0
/* 000025F8 38800001 */ li r4, 1
/* 000025FC 38A00008 */ li r5, 8
/* 00002600 4BFFDB89 */ bl is_floor_visited
/* 00002604 2C030000 */ cmpwi r3, 0
/* 00002608 40820034 */ bne lbl_0000263C
/* 0000260C 38600001 */ li r3, 1
/* 00002610 38800001 */ li r4, 1
/* 00002614 38A00008 */ li r5, 8
/* 00002618 4BFFDB71 */ bl is_floor_visited
/* 0000261C 2C030000 */ cmpwi r3, 0
/* 00002620 4082001C */ bne lbl_0000263C
/* 00002624 38600002 */ li r3, 2
/* 00002628 38800001 */ li r4, 1
/* 0000262C 38A00008 */ li r5, 8
/* 00002630 4BFFDB59 */ bl is_floor_visited
/* 00002634 2C030000 */ cmpwi r3, 0
/* 00002638 41820050 */ beq lbl_00002688
lbl_0000263C:
/* 0000263C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00002640 38630000 */ addi r3, r3, lbl_802F1FB4@l
/* 00002644 80630000 */ lwz r3, 0(r3)
/* 00002648 80030004 */ lwz r0, 4(r3)
/* 0000264C 60000008 */ ori r0, r0, 8
/* 00002650 90030004 */ stw r0, 4(r3)
/* 00002654 48000034 */ b lbl_00002688
lbl_00002658:
/* 00002658 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 0000265C 4182001C */ beq lbl_00002678
/* 00002660 54600734 */ rlwinm r0, r3, 0, 0x1c, 0x1a
/* 00002664 90040000 */ stw r0, 0(r4)
/* 00002668 38000002 */ li r0, 2
/* 0000266C 807F0000 */ lwz r3, 0(r31)
/* 00002670 B0030002 */ sth r0, 2(r3)
/* 00002674 48000014 */ b lbl_00002688
lbl_00002678:
/* 00002678 28050000 */ cmplwi r5, 0
/* 0000267C 4182000C */ beq lbl_00002688
/* 00002680 54600776 */ rlwinm r0, r3, 0, 0x1d, 0x1b
/* 00002684 90040000 */ stw r0, 0(r4)
lbl_00002688:
/* 00002688 80010014 */ lwz r0, 0x14(r1)
/* 0000268C 83E1000C */ lwz r31, 0xc(r1)
/* 00002690 38210010 */ addi r1, r1, 0x10
/* 00002694 7C0803A6 */ mtlr r0
/* 00002698 4E800020 */ blr 

glabel lbl_0000269C
/* 0000269C 7C0802A6 */ mflr r0
/* 000026A0 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000026A4 90010004 */ stw r0, 4(r1)
/* 000026A8 9421FFF0 */ stwu r1, -0x10(r1)
/* 000026AC 93E1000C */ stw r31, 0xc(r1)
/* 000026B0 3BE30000 */ addi r31, r3, lbl_802F1FB4@l
/* 000026B4 807F0000 */ lwz r3, 0(r31)
/* 000026B8 38830004 */ addi r4, r3, 4
/* 000026BC 80630004 */ lwz r3, 4(r3)
/* 000026C0 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 000026C4 40820068 */ bne lbl_0000272C
/* 000026C8 38600000 */ li r3, 0
/* 000026CC 38800001 */ li r4, 1
/* 000026D0 38A00008 */ li r5, 8
/* 000026D4 4BFFDAB5 */ bl is_floor_visited
/* 000026D8 2C030000 */ cmpwi r3, 0
/* 000026DC 40820034 */ bne lbl_00002710
/* 000026E0 38600001 */ li r3, 1
/* 000026E4 38800001 */ li r4, 1
/* 000026E8 38A00008 */ li r5, 8
/* 000026EC 4BFFDA9D */ bl is_floor_visited
/* 000026F0 2C030000 */ cmpwi r3, 0
/* 000026F4 4082001C */ bne lbl_00002710
/* 000026F8 38600002 */ li r3, 2
/* 000026FC 38800001 */ li r4, 1
/* 00002700 38A00008 */ li r5, 8
/* 00002704 4BFFDA85 */ bl is_floor_visited
/* 00002708 2C030000 */ cmpwi r3, 0
/* 0000270C 4182008C */ beq lbl_00002798
lbl_00002710:
/* 00002710 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00002714 38630000 */ addi r3, r3, lbl_802F1FB4@l
/* 00002718 80630000 */ lwz r3, 0(r3)
/* 0000271C 80030004 */ lwz r0, 4(r3)
/* 00002720 60000008 */ ori r0, r0, 8
/* 00002724 90030004 */ stw r0, 4(r3)
/* 00002728 48000070 */ b lbl_00002798
lbl_0000272C:
/* 0000272C 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00002730 40820050 */ bne lbl_00002780
/* 00002734 38600002 */ li r3, 2
/* 00002738 38800001 */ li r4, 1
/* 0000273C 38A00010 */ li r5, 0x10
/* 00002740 4BFFDA49 */ bl is_floor_visited
/* 00002744 2C030000 */ cmpwi r3, 0
/* 00002748 41820018 */ beq lbl_00002760
/* 0000274C 807F0000 */ lwz r3, 0(r31)
/* 00002750 80030004 */ lwz r0, 4(r3)
/* 00002754 60000010 */ ori r0, r0, 0x10
/* 00002758 90030004 */ stw r0, 4(r3)
/* 0000275C 4800003C */ b lbl_00002798
lbl_00002760:
/* 00002760 809F0000 */ lwz r4, 0(r31)
/* 00002764 38000000 */ li r0, 0
/* 00002768 80640004 */ lwz r3, 4(r4)
/* 0000276C 54630774 */ rlwinm r3, r3, 0, 0x1d, 0x1a
/* 00002770 90640004 */ stw r3, 4(r4)
/* 00002774 807F0000 */ lwz r3, 0(r31)
/* 00002778 B0030002 */ sth r0, 2(r3)
/* 0000277C 4800001C */ b lbl_00002798
lbl_00002780:
/* 00002780 41820018 */ beq lbl_00002798
/* 00002784 54600774 */ rlwinm r0, r3, 0, 0x1d, 0x1a
/* 00002788 90040000 */ stw r0, 0(r4)
/* 0000278C 38000000 */ li r0, 0
/* 00002790 807F0000 */ lwz r3, 0(r31)
/* 00002794 B0030002 */ sth r0, 2(r3)
lbl_00002798:
/* 00002798 80010014 */ lwz r0, 0x14(r1)
/* 0000279C 83E1000C */ lwz r31, 0xc(r1)
/* 000027A0 38210010 */ addi r1, r1, 0x10
/* 000027A4 7C0803A6 */ mtlr r0
/* 000027A8 4E800020 */ blr 

glabel lbl_000027AC
/* 000027AC 7C0802A6 */ mflr r0
/* 000027B0 3860006C */ li r3, 0x6c
/* 000027B4 90010004 */ stw r0, 4(r1)
/* 000027B8 9421FFF0 */ stwu r1, -0x10(r1)
/* 000027BC 93E1000C */ stw r31, 0xc(r1)
/* 000027C0 4BFFD9C9 */ bl u_play_sound_0
/* 000027C4 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000027C8 38830000 */ addi r4, r3, lbl_802F1FB4@l
/* 000027CC 80A40000 */ lwz r5, 0(r4)
/* 000027D0 80050004 */ lwz r0, 4(r5)
/* 000027D4 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 000027D8 4182000C */ beq lbl_000027E4
/* 000027DC 4BFFFDC1 */ bl lbl_0000259C
/* 000027E0 48000028 */ b lbl_00002808
lbl_000027E4:
/* 000027E4 A8650002 */ lha r3, 2(r5)
/* 000027E8 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 000027EC 7C600735 */ extsh. r0, r3
/* 000027F0 B0650002 */ sth r3, 2(r5)
/* 000027F4 40800014 */ bge lbl_00002808
/* 000027F8 80640000 */ lwz r3, 0(r4)
/* 000027FC 38000002 */ li r0, 2
/* 00002800 B0030002 */ sth r0, 2(r3)
/* 00002804 4BFFFD99 */ bl lbl_0000259C
lbl_00002808:
/* 00002808 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 0000280C 80A30000 */ lwz r5, lbl_802F1FB4@l(r3)
/* 00002810 80650004 */ lwz r3, 4(r5)
/* 00002814 A8850002 */ lha r4, 2(r5)
/* 00002818 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 0000281C 41820008 */ beq lbl_00002824
/* 00002820 38840003 */ addi r4, r4, 3
lbl_00002824:
/* 00002824 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00002828 41820008 */ beq lbl_00002830
/* 0000282C 38840003 */ addi r4, r4, 3
lbl_00002830:
/* 00002830 3C600000 */ lis r3, lbl_10000018@ha
/* 00002834 5484103A */ slwi r4, r4, 2
/* 00002838 38030000 */ addi r0, r3, lbl_10000018@l
/* 0000283C 7C602214 */ add r3, r0, r4
/* 00002840 80030000 */ lwz r0, 0(r3)
/* 00002844 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 00002848 3BE30000 */ addi r31, r3, lbl_802F1FA8@l
/* 0000284C 7C000734 */ extsh r0, r0
/* 00002850 B0050000 */ sth r0, 0(r5)
/* 00002854 801F0000 */ lwz r0, 0(r31)
/* 00002858 2C000000 */ cmpwi r0, 0
/* 0000285C 41820034 */ beq lbl_00002890
/* 00002860 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00002864 80A30000 */ lwz r5, lbl_802F1FB4@l(r3)
/* 00002868 A8650002 */ lha r3, 2(r5)
/* 0000286C A8850000 */ lha r4, 0(r5)
/* 00002870 80A50004 */ lwz r5, 4(r5)
/* 00002874 4BFFD915 */ bl is_floor_visited
/* 00002878 2C030000 */ cmpwi r3, 0
/* 0000287C 40820014 */ bne lbl_00002890
/* 00002880 38000000 */ li r0, 0
/* 00002884 901F0000 */ stw r0, 0(r31)
/* 00002888 38600000 */ li r3, 0
/* 0000288C 48000008 */ b lbl_00002894
lbl_00002890:
/* 00002890 38600001 */ li r3, 1
lbl_00002894:
/* 00002894 80010014 */ lwz r0, 0x14(r1)
/* 00002898 83E1000C */ lwz r31, 0xc(r1)
/* 0000289C 38210010 */ addi r1, r1, 0x10
/* 000028A0 7C0803A6 */ mtlr r0
/* 000028A4 4E800020 */ blr 

glabel lbl_000028A8
/* 000028A8 7C0802A6 */ mflr r0
/* 000028AC 3860006C */ li r3, 0x6c
/* 000028B0 90010004 */ stw r0, 4(r1)
/* 000028B4 9421FFF0 */ stwu r1, -0x10(r1)
/* 000028B8 93E1000C */ stw r31, 0xc(r1)
/* 000028BC 4BFFD8CD */ bl u_play_sound_0
/* 000028C0 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000028C4 38830000 */ addi r4, r3, lbl_802F1FB4@l
/* 000028C8 80A40000 */ lwz r5, 0(r4)
/* 000028CC 80050004 */ lwz r0, 4(r5)
/* 000028D0 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 000028D4 4182000C */ beq lbl_000028E0
/* 000028D8 4BFFFDC5 */ bl lbl_0000269C
/* 000028DC 4800002C */ b lbl_00002908
lbl_000028E0:
/* 000028E0 A8650002 */ lha r3, 2(r5)
/* 000028E4 38630001 */ addi r3, r3, 1
/* 000028E8 7C600734 */ extsh r0, r3
/* 000028EC B0650002 */ sth r3, 2(r5)
/* 000028F0 2C000002 */ cmpwi r0, 2
/* 000028F4 40810014 */ ble lbl_00002908
/* 000028F8 80640000 */ lwz r3, 0(r4)
/* 000028FC 38000000 */ li r0, 0
/* 00002900 B0030002 */ sth r0, 2(r3)
/* 00002904 4BFFFD99 */ bl lbl_0000269C
lbl_00002908:
/* 00002908 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 0000290C 80A30000 */ lwz r5, lbl_802F1FB4@l(r3)
/* 00002910 80650004 */ lwz r3, 4(r5)
/* 00002914 A8850002 */ lha r4, 2(r5)
/* 00002918 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 0000291C 41820008 */ beq lbl_00002924
/* 00002920 38840003 */ addi r4, r4, 3
lbl_00002924:
/* 00002924 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00002928 41820008 */ beq lbl_00002930
/* 0000292C 38840003 */ addi r4, r4, 3
lbl_00002930:
/* 00002930 3C600000 */ lis r3, lbl_10000018@ha
/* 00002934 5484103A */ slwi r4, r4, 2
/* 00002938 38030000 */ addi r0, r3, lbl_10000018@l
/* 0000293C 7C602214 */ add r3, r0, r4
/* 00002940 80030000 */ lwz r0, 0(r3)
/* 00002944 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 00002948 3BE30000 */ addi r31, r3, lbl_802F1FA8@l
/* 0000294C 7C000734 */ extsh r0, r0
/* 00002950 B0050000 */ sth r0, 0(r5)
/* 00002954 801F0000 */ lwz r0, 0(r31)
/* 00002958 2C000000 */ cmpwi r0, 0
/* 0000295C 41820034 */ beq lbl_00002990
/* 00002960 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00002964 80A30000 */ lwz r5, lbl_802F1FB4@l(r3)
/* 00002968 A8650002 */ lha r3, 2(r5)
/* 0000296C A8850000 */ lha r4, 0(r5)
/* 00002970 80A50004 */ lwz r5, 4(r5)
/* 00002974 4BFFD815 */ bl is_floor_visited
/* 00002978 2C030000 */ cmpwi r3, 0
/* 0000297C 40820014 */ bne lbl_00002990
/* 00002980 38000000 */ li r0, 0
/* 00002984 901F0000 */ stw r0, 0(r31)
/* 00002988 38600000 */ li r3, 0
/* 0000298C 48000008 */ b lbl_00002994
lbl_00002990:
/* 00002990 38600001 */ li r3, 1
lbl_00002994:
/* 00002994 80010014 */ lwz r0, 0x14(r1)
/* 00002998 83E1000C */ lwz r31, 0xc(r1)
/* 0000299C 38210010 */ addi r1, r1, 0x10
/* 000029A0 7C0803A6 */ mtlr r0
/* 000029A4 4E800020 */ blr 

glabel lbl_000029A8
/* 000029A8 7C0802A6 */ mflr r0
/* 000029AC 38600001 */ li r3, 1
/* 000029B0 90010004 */ stw r0, 4(r1)
/* 000029B4 9421FFF0 */ stwu r1, -0x10(r1)
/* 000029B8 93E1000C */ stw r31, 0xc(r1)
/* 000029BC 4BFFD7CD */ bl event_finish
/* 000029C0 38600004 */ li r3, 4
/* 000029C4 4BFFD7C5 */ bl event_finish
/* 000029C8 38600005 */ li r3, 5
/* 000029CC 4BFFD7BD */ bl event_finish
/* 000029D0 3860000D */ li r3, 0xd
/* 000029D4 4BFFD7B5 */ bl event_finish
/* 000029D8 38600013 */ li r3, 0x13
/* 000029DC 4BFFD7AD */ bl event_finish
/* 000029E0 3C600000 */ lis r3, lbl_1000003C@ha
/* 000029E4 3BE30000 */ addi r31, r3, lbl_1000003C@l
/* 000029E8 807F0000 */ lwz r3, 0(r31)
/* 000029EC 4BFFD79D */ bl func_800569B4
/* 000029F0 807F0000 */ lwz r3, 0(r31)
/* 000029F4 4BFFD795 */ bl load_stage
/* 000029F8 38600001 */ li r3, 1
/* 000029FC 4BFFD78D */ bl event_start
/* 00002A00 38600004 */ li r3, 4
/* 00002A04 4BFFD785 */ bl event_start
/* 00002A08 38600005 */ li r3, 5
/* 00002A0C 4BFFD77D */ bl event_start
/* 00002A10 3860000D */ li r3, 0xd
/* 00002A14 4BFFD775 */ bl event_start
/* 00002A18 38600013 */ li r3, 0x13
/* 00002A1C 4BFFD76D */ bl event_start
/* 00002A20 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002A24 84030000 */ lwzu r0, lbl_801EEDA8@l(r3)
/* 00002A28 2C000014 */ cmpwi r0, 0x14
/* 00002A2C 41810040 */ bgt lbl_00002A6C
/* 00002A30 80630004 */ lwz r3, 4(r3)
/* 00002A34 2C03001A */ cmpwi r3, 0x1a
/* 00002A38 41820034 */ beq lbl_00002A6C
/* 00002A3C 2C03001B */ cmpwi r3, 0x1b
/* 00002A40 4182002C */ beq lbl_00002A6C
/* 00002A44 3803FFE0 */ addi r0, r3, -32  ;# fixed addi
/* 00002A48 28000001 */ cmplwi r0, 1
/* 00002A4C 40810020 */ ble lbl_00002A6C
/* 00002A50 3803FFDB */ addi r0, r3, -37  ;# fixed addi
/* 00002A54 28000001 */ cmplwi r0, 1
/* 00002A58 40810014 */ ble lbl_00002A6C
/* 00002A5C 2C030033 */ cmpwi r3, 0x33
/* 00002A60 4182000C */ beq lbl_00002A6C
/* 00002A64 2C030036 */ cmpwi r3, 0x36
/* 00002A68 40820020 */ bne lbl_00002A88
lbl_00002A6C:
/* 00002A6C 3860000C */ li r3, 0xc
/* 00002A70 4BFFD719 */ bl camera_set_state
/* 00002A74 3C600000 */ lis r3, currStageId@ha
/* 00002A78 38630000 */ addi r3, r3, currStageId@l
/* 00002A7C A8630000 */ lha r3, 0(r3)
/* 00002A80 4BFFD709 */ bl light_init
/* 00002A84 4800000C */ b lbl_00002A90
lbl_00002A88:
/* 00002A88 38600000 */ li r3, 0
/* 00002A8C 4BFFD6FD */ bl light_init
lbl_00002A90:
/* 00002A90 80010014 */ lwz r0, 0x14(r1)
/* 00002A94 83E1000C */ lwz r31, 0xc(r1)
/* 00002A98 38210010 */ addi r1, r1, 0x10
/* 00002A9C 7C0803A6 */ mtlr r0
/* 00002AA0 4E800020 */ blr 
.endif
glabel lbl_00002AA4
/* 00002AA4 7C0802A6 */ mflr r0
/* 00002AA8 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00002AAC 90010004 */ stw r0, 4(r1)
/* 00002AB0 38840000 */ addi r4, r4, lbl_801EEDA8@l
/* 00002AB4 9421FFE0 */ stwu r1, -0x20(r1)
/* 00002AB8 93E1001C */ stw r31, 0x1c(r1)
/* 00002ABC 93C10018 */ stw r30, 0x18(r1)
/* 00002AC0 3BC400F4 */ addi r30, r4, 0xf4
/* 00002AC4 93A10014 */ stw r29, 0x14(r1)
/* 00002AC8 3BA30000 */ addi r29, r3, 0
/* 00002ACC 3C600000 */ lis r3, lbl_10000000@ha
/* 00002AD0 93810010 */ stw r28, 0x10(r1)
/* 00002AD4 3B9DFFFE */ addi r28, r29, -2  ;# fixed addi
/* 00002AD8 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00002ADC 800400F4 */ lwz r0, 0xf4(r4)
/* 00002AE0 7C00E000 */ cmpw r0, r28
/* 00002AE4 4181005C */ bgt lbl_00002B40
/* 00002AE8 38600002 */ li r3, 2
/* 00002AEC 4BFFDAE9 */ bl lbl_000005D4
/* 00002AF0 2C030000 */ cmpwi r3, 0
/* 00002AF4 41820018 */ beq lbl_00002B0C
/* 00002AF8 807E0000 */ lwz r3, 0(r30)
/* 00002AFC 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00002B00 901E0000 */ stw r0, 0(r30)
/* 00002B04 40800008 */ bge lbl_00002B0C
/* 00002B08 939E0000 */ stw r28, 0(r30)
lbl_00002B0C:
/* 00002B0C 38600003 */ li r3, 3
/* 00002B10 4BFFDAC5 */ bl lbl_000005D4
/* 00002B14 2C030000 */ cmpwi r3, 0
/* 00002B18 41820080 */ beq lbl_00002B98
/* 00002B1C 807E0000 */ lwz r3, 0(r30)
/* 00002B20 381DFFFE */ addi r0, r29, -2  ;# fixed addi
/* 00002B24 38630001 */ addi r3, r3, 1
/* 00002B28 7C030000 */ cmpw r3, r0
/* 00002B2C 907E0000 */ stw r3, 0(r30)
/* 00002B30 40810068 */ ble lbl_00002B98
/* 00002B34 38000000 */ li r0, 0
/* 00002B38 901E0000 */ stw r0, 0(r30)
/* 00002B3C 4800005C */ b lbl_00002B98
lbl_00002B40:
/* 00002B40 38600002 */ li r3, 2
/* 00002B44 4BFFDA91 */ bl lbl_000005D4
/* 00002B48 2C030000 */ cmpwi r3, 0
/* 00002B4C 41820020 */ beq lbl_00002B6C
/* 00002B50 807E0000 */ lwz r3, 0(r30)
/* 00002B54 381DFFFF */ addi r0, r29, -1  ;# fixed addi
/* 00002B58 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00002B5C 7C030000 */ cmpw r3, r0
/* 00002B60 907E0000 */ stw r3, 0(r30)
/* 00002B64 40800008 */ bge lbl_00002B6C
/* 00002B68 93BE0000 */ stw r29, 0(r30)
lbl_00002B6C:
/* 00002B6C 38600003 */ li r3, 3
/* 00002B70 4BFFDA65 */ bl lbl_000005D4
/* 00002B74 2C030000 */ cmpwi r3, 0
/* 00002B78 41820020 */ beq lbl_00002B98
/* 00002B7C 807E0000 */ lwz r3, 0(r30)
/* 00002B80 38030001 */ addi r0, r3, 1
/* 00002B84 7C00E800 */ cmpw r0, r29
/* 00002B88 901E0000 */ stw r0, 0(r30)
/* 00002B8C 4081000C */ ble lbl_00002B98
/* 00002B90 381DFFFF */ addi r0, r29, -1  ;# fixed addi
/* 00002B94 901E0000 */ stw r0, 0(r30)
lbl_00002B98:
/* 00002B98 38600002 */ li r3, 2
/* 00002B9C 4BFFDA39 */ bl lbl_000005D4
/* 00002BA0 2C030000 */ cmpwi r3, 0
/* 00002BA4 40820014 */ bne lbl_00002BB8
/* 00002BA8 38600003 */ li r3, 3
/* 00002BAC 4BFFDA29 */ bl lbl_000005D4
/* 00002BB0 2C030000 */ cmpwi r3, 0
/* 00002BB4 41820020 */ beq lbl_00002BD4
lbl_00002BB8:
/* 00002BB8 801F0040 */ lwz r0, 0x40(r31)
/* 00002BBC 2C000001 */ cmpwi r0, 1
/* 00002BC0 4182000C */ beq lbl_00002BCC
/* 00002BC4 2C1D0002 */ cmpwi r29, 2
/* 00002BC8 4081000C */ ble lbl_00002BD4
lbl_00002BCC:
/* 00002BCC 3860006C */ li r3, 0x6c
/* 00002BD0 4BFFD5B9 */ bl u_play_sound_0
lbl_00002BD4:
/* 00002BD4 801F0040 */ lwz r0, 0x40(r31)
/* 00002BD8 2C000001 */ cmpwi r0, 1
/* 00002BDC 40820074 */ bne lbl_00002C50
/* 00002BE0 38600006 */ li r3, 6
/* 00002BE4 4BFFD9F1 */ bl lbl_000005D4
/* 00002BE8 2C030000 */ cmpwi r3, 0
/* 00002BEC 418200F4 */ beq lbl_00002CE0
/* 00002BF0 807E0000 */ lwz r3, 0(r30)
/* 00002BF4 381DFFFF */ addi r0, r29, -1  ;# fixed addi
/* 00002BF8 7C030000 */ cmpw r3, r0
/* 00002BFC 408200E4 */ bne lbl_00002CE0
/* 00002C00 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002C04 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00002C08 38000001 */ li r0, 1
/* 00002C0C 90030108 */ stw r0, 0x108(r3)
/* 00002C10 38600065 */ li r3, 0x65
/* 00002C14 801F0040 */ lwz r0, 0x40(r31)
/* 00002C18 80BE0000 */ lwz r5, 0(r30)
/* 00002C1C 5400103A */ slwi r0, r0, 2
/* 00002C20 7C9F0214 */ add r4, r31, r0
/* 00002C24 90A40044 */ stw r5, 0x44(r4)
/* 00002C28 801F0040 */ lwz r0, 0x40(r31)
/* 00002C2C 68000001 */ xori r0, r0, 1
/* 00002C30 901F0040 */ stw r0, 0x40(r31)
/* 00002C34 801F0040 */ lwz r0, 0x40(r31)
/* 00002C38 5400103A */ slwi r0, r0, 2
/* 00002C3C 7C9F0214 */ add r4, r31, r0
/* 00002C40 80040044 */ lwz r0, 0x44(r4)
/* 00002C44 901E0000 */ stw r0, 0(r30)
/* 00002C48 4BFFD541 */ bl u_play_sound_0
/* 00002C4C 48000094 */ b lbl_00002CE0
lbl_00002C50:
/* 00002C50 38600006 */ li r3, 6
/* 00002C54 4BFFD981 */ bl lbl_000005D4
/* 00002C58 2C030000 */ cmpwi r3, 0
/* 00002C5C 40820014 */ bne lbl_00002C70
/* 00002C60 38600007 */ li r3, 7
/* 00002C64 4BFFD971 */ bl lbl_000005D4
/* 00002C68 2C030000 */ cmpwi r3, 0
/* 00002C6C 41820074 */ beq lbl_00002CE0
lbl_00002C70:
/* 00002C70 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002C74 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00002C78 38000000 */ li r0, 0
/* 00002C7C 90030108 */ stw r0, 0x108(r3)
/* 00002C80 38600006 */ li r3, 6
/* 00002C84 801F0040 */ lwz r0, 0x40(r31)
/* 00002C88 80BE0000 */ lwz r5, 0(r30)
/* 00002C8C 5400103A */ slwi r0, r0, 2
/* 00002C90 7C9F0214 */ add r4, r31, r0
/* 00002C94 90A40044 */ stw r5, 0x44(r4)
/* 00002C98 801F0040 */ lwz r0, 0x40(r31)
/* 00002C9C 68000001 */ xori r0, r0, 1
/* 00002CA0 901F0040 */ stw r0, 0x40(r31)
/* 00002CA4 801F0040 */ lwz r0, 0x40(r31)
/* 00002CA8 5400103A */ slwi r0, r0, 2
/* 00002CAC 7C9F0214 */ add r4, r31, r0
/* 00002CB0 80040044 */ lwz r0, 0x44(r4)
/* 00002CB4 901E0000 */ stw r0, 0(r30)
/* 00002CB8 809E0000 */ lwz r4, 0(r30)
/* 00002CBC 38040001 */ addi r0, r4, 1
/* 00002CC0 901E0000 */ stw r0, 0(r30)
/* 00002CC4 4BFFD911 */ bl lbl_000005D4
/* 00002CC8 2C030000 */ cmpwi r3, 0
/* 00002CCC 4182000C */ beq lbl_00002CD8
/* 00002CD0 3860006A */ li r3, 0x6a
/* 00002CD4 48000008 */ b lbl_00002CDC
lbl_00002CD8:
/* 00002CD8 38600066 */ li r3, 0x66
lbl_00002CDC:
/* 00002CDC 4BFFD4AD */ bl u_play_sound_0
lbl_00002CE0:
/* 00002CE0 80010024 */ lwz r0, 0x24(r1)
/* 00002CE4 83E1001C */ lwz r31, 0x1c(r1)
/* 00002CE8 83C10018 */ lwz r30, 0x18(r1)
/* 00002CEC 7C0803A6 */ mtlr r0
/* 00002CF0 83A10014 */ lwz r29, 0x14(r1)
/* 00002CF4 83810010 */ lwz r28, 0x10(r1)
/* 00002CF8 38210020 */ addi r1, r1, 0x20
/* 00002CFC 4E800020 */ blr 

glabel lbl_00002D00
/* 00002D00 7C0802A6 */ mflr r0
/* 00002D04 3C600000 */ lis r3, gamePauseStatus@ha
/* 00002D08 90010004 */ stw r0, 4(r1)
/* 00002D0C 9421FFE0 */ stwu r1, -0x20(r1)
/* 00002D10 93E1001C */ stw r31, 0x1c(r1)
/* 00002D14 93C10018 */ stw r30, 0x18(r1)
/* 00002D18 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00002D1C 7000000A */ andi. r0, r0, 0xa
/* 00002D20 40820188 */ bne lbl_00002EA8
/* 00002D24 386000BE */ li r3, 0xbe
/* 00002D28 4BFFD461 */ bl func_800569B4
/* 00002D2C 386000BE */ li r3, 0xbe
/* 00002D30 4BFFD459 */ bl load_stage
/* 00002D34 3C600000 */ lis r3, modeCtrl@ha
/* 00002D38 38830000 */ addi r4, r3, modeCtrl@l
/* 00002D3C 38E00000 */ li r7, 0
/* 00002D40 90E40000 */ stw r7, 0(r4)
/* 00002D44 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002D48 39000000 */ li r8, 0
/* 00002D4C 90E40008 */ stw r7, 8(r4)
/* 00002D50 38C30000 */ addi r6, r3, lbl_801EEDA8@l
/* 00002D54 38000007 */ li r0, 7
/* 00002D58 90E40004 */ stw r7, 4(r4)
/* 00002D5C 38A0FFFF */ li r5, -1
/* 00002D60 2C08000A */ cmpwi r8, 0xa
/* 00002D64 90060000 */ stw r0, 0(r6)
/* 00002D68 90A60004 */ stw r5, 4(r6)
/* 00002D6C 90E60008 */ stw r7, 8(r6)
/* 00002D70 B0A6000C */ sth r5, 0xc(r6)
/* 00002D74 B0E6000E */ sth r7, 0xe(r6)
/* 00002D78 A806000E */ lha r0, 0xe(r6)
/* 00002D7C 80860000 */ lwz r4, 0(r6)
/* 00002D80 5400103A */ slwi r0, r0, 2
/* 00002D84 7C660214 */ add r3, r6, r0
/* 00002D88 90830010 */ stw r4, 0x10(r3)
/* 00002D8C 90A60068 */ stw r5, 0x68(r6)
/* 00002D90 4080006C */ bge lbl_00002DFC
/* 00002D94 90A6006C */ stw r5, 0x6c(r6)
/* 00002D98 39000008 */ li r8, 8
/* 00002D9C 90A60094 */ stw r5, 0x94(r6)
/* 00002DA0 90A60070 */ stw r5, 0x70(r6)
/* 00002DA4 90A60098 */ stw r5, 0x98(r6)
/* 00002DA8 90A60074 */ stw r5, 0x74(r6)
/* 00002DAC 90A6009C */ stw r5, 0x9c(r6)
/* 00002DB0 90A60078 */ stw r5, 0x78(r6)
/* 00002DB4 90A600A0 */ stw r5, 0xa0(r6)
/* 00002DB8 90A6007C */ stw r5, 0x7c(r6)
/* 00002DBC 90A600A4 */ stw r5, 0xa4(r6)
/* 00002DC0 90A60080 */ stw r5, 0x80(r6)
/* 00002DC4 90A600A8 */ stw r5, 0xa8(r6)
/* 00002DC8 90A60084 */ stw r5, 0x84(r6)
/* 00002DCC 90A600AC */ stw r5, 0xac(r6)
/* 00002DD0 90A60088 */ stw r5, 0x88(r6)
/* 00002DD4 90A600B0 */ stw r5, 0xb0(r6)
/* 00002DD8 480000C4 */ b lbl_00002E9C
lbl_00002DDC:
/* 00002DDC 2008000A */ subfic r0, r8, 0xa
/* 00002DE0 2C08000A */ cmpwi r8, 0xa
/* 00002DE4 7C0903A6 */ mtctr r0
/* 00002DE8 40800014 */ bge lbl_00002DFC
lbl_00002DEC:
/* 00002DEC 90A3006C */ stw r5, 0x6c(r3)
/* 00002DF0 90A30094 */ stw r5, 0x94(r3)
/* 00002DF4 38630004 */ addi r3, r3, 4
/* 00002DF8 4200FFF4 */ bdnz lbl_00002DEC
lbl_00002DFC:
/* 00002DFC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002E00 3BE30000 */ addi r31, r3, lbl_801EEDA8@l
/* 00002E04 3BC00000 */ li r30, 0
/* 00002E08 93DF0110 */ stw r30, 0x110(r31)
/* 00002E0C 4BFFEB05 */ bl lbl_00001910
/* 00002E10 38000001 */ li r0, 1
/* 00002E14 901F0040 */ stw r0, 0x40(r31)
/* 00002E18 3CA00000 */ lis r5, modeCtrl@ha
/* 00002E1C 3C800000 */ lis r4, lbl_802F1C10@ha
/* 00002E20 907F003C */ stw r3, 0x3c(r31)
/* 00002E24 38A50000 */ addi r5, r5, modeCtrl@l
/* 00002E28 38840000 */ addi r4, r4, lbl_802F1C10@l
/* 00002E2C 801F003C */ lwz r0, 0x3c(r31)
/* 00002E30 3C600000 */ lis r3, playerCharacterSelection@ha
/* 00002E34 90050024 */ stw r0, 0x24(r5)
/* 00002E38 88040004 */ lbz r0, 4(r4)
/* 00002E3C 7C000774 */ extsb r0, r0
/* 00002E40 94030000 */ stwu r0, playerCharacterSelection@l(r3)
/* 00002E44 88040005 */ lbz r0, 5(r4)
/* 00002E48 7C000774 */ extsb r0, r0
/* 00002E4C 90030004 */ stw r0, 4(r3)
/* 00002E50 88040006 */ lbz r0, 6(r4)
/* 00002E54 7C000774 */ extsb r0, r0
/* 00002E58 90030008 */ stw r0, 8(r3)
/* 00002E5C 88040007 */ lbz r0, 7(r4)
/* 00002E60 7C000774 */ extsb r0, r0
/* 00002E64 9003000C */ stw r0, 0xc(r3)
/* 00002E68 93DF0048 */ stw r30, 0x48(r31)
/* 00002E6C 93DF004C */ stw r30, 0x4c(r31)
/* 00002E70 93DF0050 */ stw r30, 0x50(r31)
/* 00002E74 93DF0054 */ stw r30, 0x54(r31)
/* 00002E78 93DF0044 */ stw r30, 0x44(r31)
/* 00002E7C 4BFFD3B9 */ bl lbl_00000234
/* 00002E80 4BFFD4BD */ bl lbl_0000033C
/* 00002E84 4BFFD305 */ bl func_800123DC
/* 00002E88 38600100 */ li r3, 0x100
/* 00002E8C 38800000 */ li r4, 0
/* 00002E90 38A0001E */ li r5, 0x1e
/* 00002E94 4BFFD2F5 */ bl start_screen_fade
/* 00002E98 48000010 */ b lbl_00002EA8
lbl_00002E9C:
/* 00002E9C 5500103A */ slwi r0, r8, 2
/* 00002EA0 7C660214 */ add r3, r6, r0
/* 00002EA4 4BFFFF38 */ b lbl_00002DDC
lbl_00002EA8:
/* 00002EA8 80010024 */ lwz r0, 0x24(r1)
/* 00002EAC 83E1001C */ lwz r31, 0x1c(r1)
/* 00002EB0 83C10018 */ lwz r30, 0x18(r1)
/* 00002EB4 7C0803A6 */ mtlr r0
/* 00002EB8 38210020 */ addi r1, r1, 0x20
/* 00002EBC 4E800020 */ blr 

glabel lbl_00002EC0
/* 00002EC0 7C0802A6 */ mflr r0
/* 00002EC4 3C600000 */ lis r3, gamePauseStatus@ha
/* 00002EC8 90010004 */ stw r0, 4(r1)
/* 00002ECC 9421FFD8 */ stwu r1, -0x28(r1)
/* 00002ED0 93E10024 */ stw r31, 0x24(r1)
/* 00002ED4 93C10020 */ stw r30, 0x20(r1)
/* 00002ED8 93A1001C */ stw r29, 0x1c(r1)
/* 00002EDC 93810018 */ stw r28, 0x18(r1)
/* 00002EE0 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00002EE4 7000000A */ andi. r0, r0, 0xa
/* 00002EE8 408201EC */ bne lbl_000030D4
/* 00002EEC 38000000 */ li r0, 0
/* 00002EF0 3C600000 */ lis r3, modeCtrl@ha
/* 00002EF4 94030000 */ stwu r0, modeCtrl@l(r3)
/* 00002EF8 3BE30008 */ addi r31, r3, 8
/* 00002EFC 80630008 */ lwz r3, 8(r3)
/* 00002F00 54600421 */ rlwinm. r0, r3, 0, 0x10, 0x10
/* 00002F04 41820048 */ beq lbl_00002F4C
/* 00002F08 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002F0C 38E30000 */ addi r7, r3, lbl_801EEDA8@l
/* 00002F10 3800FFFF */ li r0, -1
/* 00002F14 B007000C */ sth r0, 0xc(r7)
/* 00002F18 38600100 */ li r3, 0x100
/* 00002F1C 38800000 */ li r4, 0
/* 00002F20 A8C7000E */ lha r6, 0xe(r7)
/* 00002F24 38A0001E */ li r5, 0x1e
/* 00002F28 3806FFFF */ addi r0, r6, -1  ;# fixed addi
/* 00002F2C B007000E */ sth r0, 0xe(r7)
/* 00002F30 A807000E */ lha r0, 0xe(r7)
/* 00002F34 5400103A */ slwi r0, r0, 2
/* 00002F38 7CC70214 */ add r6, r7, r0
/* 00002F3C 80060010 */ lwz r0, 0x10(r6)
/* 00002F40 90070000 */ stw r0, 0(r7)
/* 00002F44 4BFFD245 */ bl start_screen_fade
/* 00002F48 48000098 */ b lbl_00002FE0
lbl_00002F4C:
/* 00002F4C 546003DF */ rlwinm. r0, r3, 0, 0xf, 0xf
/* 00002F50 4182002C */ beq lbl_00002F7C
/* 00002F54 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002F58 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00002F5C 3800FFFF */ li r0, -1
/* 00002F60 B004000C */ sth r0, 0xc(r4)
/* 00002F64 38000004 */ li r0, 4
/* 00002F68 A864000E */ lha r3, 0xe(r4)
/* 00002F6C 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00002F70 B064000E */ sth r3, 0xe(r4)
/* 00002F74 90040000 */ stw r0, 0(r4)
/* 00002F78 48000068 */ b lbl_00002FE0
lbl_00002F7C:
/* 00002F7C 54600319 */ rlwinm. r0, r3, 0, 0xc, 0xc
/* 00002F80 4182002C */ beq lbl_00002FAC
/* 00002F84 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002F88 3BC30000 */ addi r30, r3, lbl_801EEDA8@l
/* 00002F8C 3800FFFF */ li r0, -1
/* 00002F90 B01E000C */ sth r0, 0xc(r30)
/* 00002F94 38000001 */ li r0, 1
/* 00002F98 B01E000E */ sth r0, 0xe(r30)
/* 00002F9C 4BFFD299 */ bl lbl_00000234
/* 00002FA0 38000004 */ li r0, 4
/* 00002FA4 901E0000 */ stw r0, 0(r30)
/* 00002FA8 48000038 */ b lbl_00002FE0
lbl_00002FAC:
/* 00002FAC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002FB0 3BC30000 */ addi r30, r3, lbl_801EEDA8@l
/* 00002FB4 3800FFFF */ li r0, -1
/* 00002FB8 B01E000C */ sth r0, 0xc(r30)
/* 00002FBC 38000001 */ li r0, 1
/* 00002FC0 B01E000E */ sth r0, 0xe(r30)
/* 00002FC4 4BFFD271 */ bl lbl_00000234
/* 00002FC8 38000004 */ li r0, 4
/* 00002FCC 901E0000 */ stw r0, 0(r30)
/* 00002FD0 38600102 */ li r3, 0x102
/* 00002FD4 38800000 */ li r4, 0
/* 00002FD8 38A00001 */ li r5, 1
/* 00002FDC 4BFFD1AD */ bl start_screen_fade
lbl_00002FE0:
/* 00002FE0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002FE4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00002FE8 3880FFFF */ li r4, -1
/* 00002FEC 90830004 */ stw r4, 4(r3)
/* 00002FF0 38000000 */ li r0, 0
/* 00002FF4 38A00000 */ li r5, 0
/* 00002FF8 90030008 */ stw r0, 8(r3)
/* 00002FFC 2C05000A */ cmpwi r5, 0xa
/* 00003000 90830068 */ stw r4, 0x68(r3)
/* 00003004 40800048 */ bge lbl_0000304C
/* 00003008 9083006C */ stw r4, 0x6c(r3)
/* 0000300C 38A00008 */ li r5, 8
/* 00003010 90830070 */ stw r4, 0x70(r3)
/* 00003014 90830074 */ stw r4, 0x74(r3)
/* 00003018 90830078 */ stw r4, 0x78(r3)
/* 0000301C 9083007C */ stw r4, 0x7c(r3)
/* 00003020 90830080 */ stw r4, 0x80(r3)
/* 00003024 90830084 */ stw r4, 0x84(r3)
/* 00003028 90830088 */ stw r4, 0x88(r3)
/* 0000302C 4800009C */ b lbl_000030C8
lbl_00003030:
/* 00003030 2005000A */ subfic r0, r5, 0xa
/* 00003034 2C05000A */ cmpwi r5, 0xa
/* 00003038 7C0903A6 */ mtctr r0
/* 0000303C 40800010 */ bge lbl_0000304C
lbl_00003040:
/* 00003040 9083006C */ stw r4, 0x6c(r3)
/* 00003044 38630004 */ addi r3, r3, 4
/* 00003048 4200FFF8 */ bdnz lbl_00003040
lbl_0000304C:
/* 0000304C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003050 3BC30000 */ addi r30, r3, lbl_801EEDA8@l
/* 00003054 3B800000 */ li r28, 0
/* 00003058 939E0110 */ stw r28, 0x110(r30)
/* 0000305C 939E0048 */ stw r28, 0x48(r30)
/* 00003060 939E004C */ stw r28, 0x4c(r30)
/* 00003064 939E0050 */ stw r28, 0x50(r30)
/* 00003068 939E0054 */ stw r28, 0x54(r30)
/* 0000306C 939E0044 */ stw r28, 0x44(r30)
/* 00003070 4BFFD2CD */ bl lbl_0000033C
/* 00003074 939F0000 */ stw r28, 0(r31)
/* 00003078 4BFFD111 */ bl camera_setup_singleplayer_viewport
/* 0000307C 3BBE0000 */ addi r29, r30, 0
/* 00003080 3BE00007 */ li r31, 7
/* 00003084 48000030 */ b lbl_000030B4
lbl_00003088:
/* 00003088 807D0094 */ lwz r3, 0x94(r29)
/* 0000308C 2C03FFFF */ cmpwi r3, -1
/* 00003090 41820030 */ beq lbl_000030C0
/* 00003094 4BFFD0F5 */ bl find_sprite_with_tag
/* 00003098 28030000 */ cmplwi r3, 0
/* 0000309C 41820010 */ beq lbl_000030AC
/* 000030A0 93E30048 */ stw r31, 0x48(r3)
/* 000030A4 7F800774 */ extsb r0, r28
/* 000030A8 98030003 */ stb r0, 3(r3)
lbl_000030AC:
/* 000030AC 3BBD0004 */ addi r29, r29, 4
/* 000030B0 3B9C0001 */ addi r28, r28, 1
lbl_000030B4:
/* 000030B4 A81E000E */ lha r0, 0xe(r30)
/* 000030B8 7C1C0000 */ cmpw r28, r0
/* 000030BC 4180FFCC */ blt lbl_00003088
lbl_000030C0:
/* 000030C0 4BFFD0C9 */ bl func_800123DC
/* 000030C4 48000010 */ b lbl_000030D4
lbl_000030C8:
/* 000030C8 54A0103A */ slwi r0, r5, 2
/* 000030CC 7C630214 */ add r3, r3, r0
/* 000030D0 4BFFFF60 */ b lbl_00003030
lbl_000030D4:
/* 000030D4 8001002C */ lwz r0, 0x2c(r1)
/* 000030D8 83E10024 */ lwz r31, 0x24(r1)
/* 000030DC 83C10020 */ lwz r30, 0x20(r1)
/* 000030E0 7C0803A6 */ mtlr r0
/* 000030E4 83A1001C */ lwz r29, 0x1c(r1)
/* 000030E8 83810018 */ lwz r28, 0x18(r1)
/* 000030EC 38210028 */ addi r1, r1, 0x28
/* 000030F0 4E800020 */ blr 

glabel lbl_000030F4
/* 000030F4 7C0802A6 */ mflr r0
/* 000030F8 3C600000 */ lis r3, gamePauseStatus@ha
/* 000030FC 90010004 */ stw r0, 4(r1)
/* 00003100 3CA00000 */ lis r5, 0x00012238@ha ;#lbl_00012238@ha
/* 00003104 3C800000 */ lis r4, lbl_00011B68@ha
/* 00003108 9421FF28 */ stwu r1, -0xd8(r1)
/* 0000310C BDE10094 */ stmw r15, 0x94(r1)
/* 00003110 3BC50000 */ addi r30, r5, 0x00012238@l ;#lbl_00012238@l
/* 00003114 3BA40000 */ addi r29, r4, lbl_00011B68@l
/* 00003118 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 0000311C 3C600000 */ lis r3, lbl_10000000@ha
/* 00003120 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00003124 7000000A */ andi. r0, r0, 0xa
/* 00003128 4082672C */ bne lbl_00009854
/* 0000312C 38000000 */ li r0, 0
/* 00003130 3C600000 */ lis r3, controllerInfo@ha
/* 00003134 901F0000 */ stw r0, 0(r31)
/* 00003138 3B630000 */ addi r27, r3, controllerInfo@l
/* 0000313C 881B000A */ lbz r0, 0xa(r27)
/* 00003140 38800000 */ li r4, 0
/* 00003144 7C000775 */ extsb. r0, r0
/* 00003148 4082000C */ bne lbl_00003154
/* 0000314C 909F0000 */ stw r4, 0(r31)
/* 00003150 48000050 */ b lbl_000031A0
lbl_00003154:
/* 00003154 387B003C */ addi r3, r27, 0x3c
/* 00003158 881B0046 */ lbz r0, 0x46(r27)
/* 0000315C 38800001 */ li r4, 1
/* 00003160 7C000775 */ extsb. r0, r0
/* 00003164 4082000C */ bne lbl_00003170
/* 00003168 909F0000 */ stw r4, 0(r31)
/* 0000316C 48000034 */ b lbl_000031A0
lbl_00003170:
/* 00003170 88030046 */ lbz r0, 0x46(r3)
/* 00003174 38800002 */ li r4, 2
/* 00003178 3863003C */ addi r3, r3, 0x3c
/* 0000317C 7C000775 */ extsb. r0, r0
/* 00003180 4082000C */ bne lbl_0000318C
/* 00003184 909F0000 */ stw r4, 0(r31)
/* 00003188 48000018 */ b lbl_000031A0
lbl_0000318C:
/* 0000318C 88030046 */ lbz r0, 0x46(r3)
/* 00003190 38800003 */ li r4, 3
/* 00003194 7C000775 */ extsb. r0, r0
/* 00003198 40820008 */ bne lbl_000031A0
/* 0000319C 909F0000 */ stw r4, 0(r31)
lbl_000031A0:
/* 000031A0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000031A4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000031A8 80630000 */ lwz r3, 0(r3)
/* 000031AC 38000000 */ li r0, 0
/* 000031B0 2C030014 */ cmpwi r3, 0x14
/* 000031B4 40810024 */ ble lbl_000031D8
/* 000031B8 2C03001D */ cmpwi r3, 0x1d
/* 000031BC 4182001C */ beq lbl_000031D8
/* 000031C0 2C03002A */ cmpwi r3, 0x2a
/* 000031C4 41820014 */ beq lbl_000031D8
/* 000031C8 2C03002E */ cmpwi r3, 0x2e
/* 000031CC 4182000C */ beq lbl_000031D8
/* 000031D0 2C030030 */ cmpwi r3, 0x30
/* 000031D4 4082000C */ bne lbl_000031E0
lbl_000031D8:
/* 000031D8 38000000 */ li r0, 0
/* 000031DC 480000E0 */ b lbl_000032BC
lbl_000031E0:
/* 000031E0 3C600000 */ lis r3, modeCtrl@ha
/* 000031E4 38630000 */ addi r3, r3, modeCtrl@l
/* 000031E8 80830024 */ lwz r4, 0x24(r3)
/* 000031EC 7C030378 */ mr r3, r0
/* 000031F0 28040000 */ cmplwi r4, 0
/* 000031F4 408100C8 */ ble lbl_000032BC
/* 000031F8 28040008 */ cmplwi r4, 8
/* 000031FC 38E4FFF8 */ addi r7, r4, -8  ;# fixed addi
/* 00003200 40816618 */ ble lbl_00009818
/* 00003204 38A70007 */ addi r5, r7, 7
/* 00003208 54A5E8FE */ srwi r5, r5, 3
/* 0000320C 3CC00000 */ lis r6, lbl_80206BD0@ha
/* 00003210 7CA903A6 */ mtctr r5
/* 00003214 28070000 */ cmplwi r7, 0
/* 00003218 39860000 */ addi r12, r6, lbl_80206BD0@l
/* 0000321C 408165FC */ ble lbl_00009818
lbl_00003220:
/* 00003220 80AC0000 */ lwz r5, 0(r12)
/* 00003224 39600001 */ li r11, 1
/* 00003228 80CC0004 */ lwz r6, 4(r12)
/* 0000322C 38630008 */ addi r3, r3, 8
/* 00003230 7D672830 */ slw r7, r11, r5
/* 00003234 80AC0008 */ lwz r5, 8(r12)
/* 00003238 7C003B78 */ or r0, r0, r7
/* 0000323C 7D663030 */ slw r6, r11, r6
/* 00003240 812C000C */ lwz r9, 0xc(r12)
/* 00003244 810C0010 */ lwz r8, 0x10(r12)
/* 00003248 7C003378 */ or r0, r0, r6
/* 0000324C 80EC0014 */ lwz r7, 0x14(r12)
/* 00003250 7D6A2830 */ slw r10, r11, r5
/* 00003254 80CC0018 */ lwz r6, 0x18(r12)
/* 00003258 80AC001C */ lwz r5, 0x1c(r12)
/* 0000325C 7C005378 */ or r0, r0, r10
/* 00003260 7D694830 */ slw r9, r11, r9
/* 00003264 7C004B78 */ or r0, r0, r9
/* 00003268 7D684030 */ slw r8, r11, r8
/* 0000326C 7C004378 */ or r0, r0, r8
/* 00003270 7D673830 */ slw r7, r11, r7
/* 00003274 7C003B78 */ or r0, r0, r7
/* 00003278 7D663030 */ slw r6, r11, r6
/* 0000327C 7C003378 */ or r0, r0, r6
/* 00003280 7D652830 */ slw r5, r11, r5
/* 00003284 7C002B78 */ or r0, r0, r5
/* 00003288 398C0020 */ addi r12, r12, 0x20
/* 0000328C 4200FF94 */ bdnz lbl_00003220
/* 00003290 48006588 */ b lbl_00009818
lbl_00003294:
/* 00003294 7CA32050 */ subf r5, r3, r4
/* 00003298 7C032040 */ cmplw r3, r4
/* 0000329C 7CA903A6 */ mtctr r5
/* 000032A0 38800001 */ li r4, 1
/* 000032A4 40800018 */ bge lbl_000032BC
lbl_000032A8:
/* 000032A8 80660000 */ lwz r3, 0(r6)
/* 000032AC 38C60004 */ addi r6, r6, 4
/* 000032B0 7C831830 */ slw r3, r4, r3
/* 000032B4 7C001B78 */ or r0, r0, r3
/* 000032B8 4200FFF0 */ bdnz lbl_000032A8
lbl_000032BC:
/* 000032BC 901F0004 */ stw r0, 4(r31)
/* 000032C0 3AFF0008 */ addi r23, r31, 8
/* 000032C4 807F0008 */ lwz r3, 8(r31)
/* 000032C8 2C030000 */ cmpwi r3, 0
/* 000032CC 4081000C */ ble lbl_000032D8
/* 000032D0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000032D4 90170000 */ stw r0, 0(r23)
lbl_000032D8:
/* 000032D8 38970004 */ addi r4, r23, 4
/* 000032DC 80770004 */ lwz r3, 4(r23)
/* 000032E0 2C030000 */ cmpwi r3, 0
/* 000032E4 4081000C */ ble lbl_000032F0
/* 000032E8 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000032EC 90040000 */ stw r0, 0(r4)
lbl_000032F0:
/* 000032F0 84640004 */ lwzu r3, 4(r4)
/* 000032F4 2C030000 */ cmpwi r3, 0
/* 000032F8 4081000C */ ble lbl_00003304
/* 000032FC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00003300 90040000 */ stw r0, 0(r4)
lbl_00003304:
/* 00003304 84640004 */ lwzu r3, 4(r4)
/* 00003308 2C030000 */ cmpwi r3, 0
/* 0000330C 4081000C */ ble lbl_00003318
/* 00003310 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00003314 90040000 */ stw r0, 0(r4)
lbl_00003318:
/* 00003318 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000331C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003320 3B2300C0 */ addi r25, r3, 0xc0
/* 00003324 806300C0 */ lwz r3, 0xc0(r3)
/* 00003328 2C030000 */ cmpwi r3, 0
/* 0000332C 4081000C */ ble lbl_00003338
/* 00003330 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00003334 90190000 */ stw r0, 0(r25)
lbl_00003338:
/* 00003338 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000333C 38000002 */ li r0, 2
/* 00003340 3B830000 */ addi r28, r3, lbl_801EEDA8@l
/* 00003344 7C0903A6 */ mtctr r0
/* 00003348 38DC0000 */ addi r6, r28, 0
/* 0000334C 38BE0094 */ addi r5, r30, 0x94
/* 00003350 38E00000 */ li r7, 0
/* 00003354 3C804330 */ lis r4, 0x4330
lbl_00003358:
/* 00003358 C0050000 */ lfs f0, 0(r5)
/* 0000335C D00600C4 */ stfs f0, 0xc4(r6)
/* 00003360 C01D0014 */ lfs f0, 0x14(r29)
/* 00003364 D00600C8 */ stfs f0, 0xc8(r6)
/* 00003368 801C00BC */ lwz r0, 0xbc(r28)
/* 0000336C 2C000001 */ cmpwi r0, 1
/* 00003370 4082003C */ bne lbl_000033AC
/* 00003374 80190000 */ lwz r0, 0(r25)
/* 00003378 3C600000 */ lis r3, lbl_00011BC0@ha
/* 0000337C C8230000 */ lfd f1, lbl_00011BC0@l(r3)
/* 00003380 1C000003 */ mulli r0, r0, 3
/* 00003384 C85D0018 */ lfd f2, 0x18(r29)
/* 00003388 6C008000 */ xoris r0, r0, 0x8000
/* 0000338C 9001008C */ stw r0, 0x8c(r1)
/* 00003390 90810088 */ stw r4, 0x88(r1)
/* 00003394 C8010088 */ lfd f0, 0x88(r1)
/* 00003398 FC000828 */ fsub f0, f0, f1
/* 0000339C FC020028 */ fsub f0, f2, f0
/* 000033A0 FC000018 */ frsp f0, f0
/* 000033A4 D00600CC */ stfs f0, 0xcc(r6)
/* 000033A8 4800003C */ b lbl_000033E4
lbl_000033AC:
/* 000033AC 80190000 */ lwz r0, 0(r25)
/* 000033B0 3C600000 */ lis r3, lbl_00011BC0@ha
/* 000033B4 C8230000 */ lfd f1, lbl_00011BC0@l(r3)
/* 000033B8 2000000F */ subfic r0, r0, 0xf
/* 000033BC C85D0018 */ lfd f2, 0x18(r29)
/* 000033C0 1C000003 */ mulli r0, r0, 3
/* 000033C4 6C008000 */ xoris r0, r0, 0x8000
/* 000033C8 9001008C */ stw r0, 0x8c(r1)
/* 000033CC 90810088 */ stw r4, 0x88(r1)
/* 000033D0 C8010088 */ lfd f0, 0x88(r1)
/* 000033D4 FC000828 */ fsub f0, f0, f1
/* 000033D8 FC020028 */ fsub f0, f2, f0
/* 000033DC FC000018 */ frsp f0, f0
/* 000033E0 D00600CC */ stfs f0, 0xcc(r6)
lbl_000033E4:
/* 000033E4 C4050004 */ lfsu f0, 4(r5)
/* 000033E8 D00600D0 */ stfs f0, 0xd0(r6)
/* 000033EC C01D0014 */ lfs f0, 0x14(r29)
/* 000033F0 D00600D4 */ stfs f0, 0xd4(r6)
/* 000033F4 38C6000C */ addi r6, r6, 0xc
/* 000033F8 801C00BC */ lwz r0, 0xbc(r28)
/* 000033FC 2C000001 */ cmpwi r0, 1
/* 00003400 4082003C */ bne lbl_0000343C
/* 00003404 80190000 */ lwz r0, 0(r25)
/* 00003408 3C600000 */ lis r3, lbl_00011BC0@ha
/* 0000340C C8230000 */ lfd f1, lbl_00011BC0@l(r3)
/* 00003410 1C000003 */ mulli r0, r0, 3
/* 00003414 C85D0018 */ lfd f2, 0x18(r29)
/* 00003418 6C008000 */ xoris r0, r0, 0x8000
/* 0000341C 9001008C */ stw r0, 0x8c(r1)
/* 00003420 90810088 */ stw r4, 0x88(r1)
/* 00003424 C8010088 */ lfd f0, 0x88(r1)
/* 00003428 FC000828 */ fsub f0, f0, f1
/* 0000342C FC020028 */ fsub f0, f2, f0
/* 00003430 FC000018 */ frsp f0, f0
/* 00003434 D00600CC */ stfs f0, 0xcc(r6)
/* 00003438 4800003C */ b lbl_00003474
lbl_0000343C:
/* 0000343C 80190000 */ lwz r0, 0(r25)
/* 00003440 3C600000 */ lis r3, lbl_00011BC0@ha
/* 00003444 C8230000 */ lfd f1, lbl_00011BC0@l(r3)
/* 00003448 2000000F */ subfic r0, r0, 0xf
/* 0000344C C85D0018 */ lfd f2, 0x18(r29)
/* 00003450 1C000003 */ mulli r0, r0, 3
/* 00003454 6C008000 */ xoris r0, r0, 0x8000
/* 00003458 9001008C */ stw r0, 0x8c(r1)
/* 0000345C 90810088 */ stw r4, 0x88(r1)
/* 00003460 C8010088 */ lfd f0, 0x88(r1)
/* 00003464 FC000828 */ fsub f0, f0, f1
/* 00003468 FC020028 */ fsub f0, f2, f0
/* 0000346C FC000018 */ frsp f0, f0
/* 00003470 D00600CC */ stfs f0, 0xcc(r6)
lbl_00003474:
/* 00003474 38A50004 */ addi r5, r5, 4
/* 00003478 38C6000C */ addi r6, r6, 0xc
/* 0000347C 38E70001 */ addi r7, r7, 1
/* 00003480 4200FED8 */ bdnz lbl_00003358
/* 00003484 801F00C0 */ lwz r0, 0xc0(r31)
/* 00003488 2C000000 */ cmpwi r0, 0
/* 0000348C 41820048 */ beq lbl_000034D4
/* 00003490 4BFFCCF9 */ bl is_load_queue_not_empty
/* 00003494 2C030000 */ cmpwi r3, 0
/* 00003498 4082003C */ bne lbl_000034D4
/* 0000349C 38000000 */ li r0, 0
/* 000034A0 901F00C0 */ stw r0, 0xc0(r31)
/* 000034A4 3C600000 */ lis r3, currStageId@ha
/* 000034A8 809F003C */ lwz r4, 0x3c(r31)
/* 000034AC A8030000 */ lha r0, currStageId@l(r3)
/* 000034B0 7C040000 */ cmpw r4, r0
/* 000034B4 4182001C */ beq lbl_000034D0
/* 000034B8 4BFFF4F1 */ bl lbl_000029A8
/* 000034BC 3C600000 */ lis r3, lbl_801EED98@ha
/* 000034C0 38630000 */ addi r3, r3, lbl_801EED98@l
/* 000034C4 88030005 */ lbz r0, 5(r3)
/* 000034C8 9803000A */ stb r0, 0xa(r3)
/* 000034CC 48000008 */ b lbl_000034D4
lbl_000034D0:
/* 000034D0 4BFFF4D9 */ bl lbl_000029A8
lbl_000034D4:
/* 000034D4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000034D8 84030000 */ lwzu r0, lbl_801EEDA8@l(r3)
/* 000034DC 2C000001 */ cmpwi r0, 1
/* 000034E0 41820018 */ beq lbl_000034F8
/* 000034E4 80030004 */ lwz r0, 4(r3)
/* 000034E8 2C00FFFF */ cmpwi r0, -1
/* 000034EC 4182000C */ beq lbl_000034F8
/* 000034F0 38000000 */ li r0, 0
/* 000034F4 90030000 */ stw r0, 0(r3)
lbl_000034F8:
/* 000034F8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000034FC 84030000 */ lwzu r0, lbl_801EEDA8@l(r3)
/* 00003500 2C000003 */ cmpwi r0, 3
/* 00003504 41820018 */ beq lbl_0000351C
/* 00003508 80030008 */ lwz r0, 8(r3)
/* 0000350C 2C000000 */ cmpwi r0, 0
/* 00003510 4182000C */ beq lbl_0000351C
/* 00003514 38000002 */ li r0, 2
/* 00003518 90030000 */ stw r0, 0(r3)
lbl_0000351C:
/* 0000351C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003520 3A430000 */ addi r18, r3, lbl_801EEDA8@l
/* 00003524 80120000 */ lwz r0, 0(r18)
/* 00003528 2800003A */ cmplwi r0, 0x3a
/* 0000352C 41816328 */ bgt lbl_00009854
/* 00003530 3C600000 */ lis r3, lbl_00012644@ha
/* 00003534 38630000 */ addi r3, r3, lbl_00012644@l
/* 00003538 5400103A */ slwi r0, r0, 2
/* 0000353C 7C03002E */ lwzx r0, r3, r0
/* 00003540 7C0903A6 */ mtctr r0
/* 00003544 4E800420 */ bctr 
lbl_00003548:
/* 00003548 3C600000 */ lis r3, modeCtrl@ha
/* 0000354C 3800003C */ li r0, 0x3c
/* 00003550 90030000 */ stw r0, modeCtrl@l(r3)
/* 00003554 38720068 */ addi r3, r18, 0x68
/* 00003558 80630000 */ lwz r3, 0(r3)
/* 0000355C 2C03FFFF */ cmpwi r3, -1
/* 00003560 41820018 */ beq lbl_00003578
/* 00003564 4BFFCC25 */ bl find_sprite_with_tag
/* 00003568 28030000 */ cmplwi r3, 0
/* 0000356C 4182000C */ beq lbl_00003578
/* 00003570 38000003 */ li r0, 3
/* 00003574 90030048 */ stw r0, 0x48(r3)
lbl_00003578:
/* 00003578 3A200000 */ li r17, 0
/* 0000357C 3A000002 */ li r16, 2
/* 00003580 39E0FFFF */ li r15, -1
lbl_00003584:
/* 00003584 807C006C */ lwz r3, 0x6c(r28)
/* 00003588 2C03FFFF */ cmpwi r3, -1
/* 0000358C 41820018 */ beq lbl_000035A4
/* 00003590 4BFFCBF9 */ bl find_sprite_with_tag
/* 00003594 28030000 */ cmplwi r3, 0
/* 00003598 41820008 */ beq lbl_000035A0
/* 0000359C 92030048 */ stw r16, 0x48(r3)
lbl_000035A0:
/* 000035A0 91FC006C */ stw r15, 0x6c(r28)
lbl_000035A4:
/* 000035A4 3A310001 */ addi r17, r17, 1
/* 000035A8 2C11000A */ cmpwi r17, 0xa
/* 000035AC 3B9C0004 */ addi r28, r28, 4
/* 000035B0 4180FFD4 */ blt lbl_00003584
/* 000035B4 3860006A */ li r3, 0x6a
/* 000035B8 4BFFCBD1 */ bl u_play_sound_0
/* 000035BC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000035C0 38000001 */ li r0, 1
/* 000035C4 90030000 */ stw r0, lbl_801EEDA8@l(r3)
lbl_000035C8:
/* 000035C8 3C600000 */ lis r3, modeCtrl@ha
/* 000035CC 80030000 */ lwz r0, modeCtrl@l(r3)
/* 000035D0 2C00000F */ cmpwi r0, 0xf
/* 000035D4 40820058 */ bne lbl_0000362C
/* 000035D8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000035DC 39E30000 */ addi r15, r3, lbl_801EEDA8@l
/* 000035E0 3A0F0068 */ addi r16, r15, 0x68
/* 000035E4 806F0068 */ lwz r3, 0x68(r15)
/* 000035E8 4BFFCBA1 */ bl find_sprite_with_tag
/* 000035EC 28030000 */ cmplwi r3, 0
/* 000035F0 41820018 */ beq lbl_00003608
/* 000035F4 38000007 */ li r0, 7
/* 000035F8 90030048 */ stw r0, 0x48(r3)
/* 000035FC A80F000E */ lha r0, 0xe(r15)
/* 00003600 7C000774 */ extsb r0, r0
/* 00003604 98030003 */ stb r0, 3(r3)
lbl_00003608:
/* 00003608 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000360C 80B00000 */ lwz r5, 0(r16)
/* 00003610 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00003614 A864000E */ lha r3, 0xe(r4)
/* 00003618 3800FFFF */ li r0, -1
/* 0000361C 5463103A */ slwi r3, r3, 2
/* 00003620 7C641A14 */ add r3, r4, r3
/* 00003624 90A30094 */ stw r5, 0x94(r3)
/* 00003628 90100000 */ stw r0, 0(r16)
lbl_0000362C:
/* 0000362C 3C600000 */ lis r3, modeCtrl@ha
/* 00003630 38830000 */ addi r4, r3, modeCtrl@l
/* 00003634 80640000 */ lwz r3, 0(r4)
/* 00003638 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000363C 90040000 */ stw r0, 0(r4)
/* 00003640 41816214 */ bgt lbl_00009854
/* 00003644 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003648 38A30000 */ addi r5, r3, lbl_801EEDA8@l
/* 0000364C 80650004 */ lwz r3, 4(r5)
/* 00003650 3800FFFF */ li r0, -1
/* 00003654 38C5000E */ addi r6, r5, 0xe
/* 00003658 90650000 */ stw r3, 0(r5)
/* 0000365C 90050004 */ stw r0, 4(r5)
/* 00003660 A865000E */ lha r3, 0xe(r5)
/* 00003664 2C030009 */ cmpwi r3, 9
/* 00003668 418261EC */ beq lbl_00009854
/* 0000366C 38030001 */ addi r0, r3, 1
/* 00003670 B0060000 */ sth r0, 0(r6)
/* 00003674 A8060000 */ lha r0, 0(r6)
/* 00003678 80850000 */ lwz r4, 0(r5)
/* 0000367C 5400103A */ slwi r0, r0, 2
/* 00003680 7C650214 */ add r3, r5, r0
/* 00003684 90830010 */ stw r4, 0x10(r3)
/* 00003688 480061CC */ b lbl_00009854
lbl_0000368C:
/* 0000368C 3C600000 */ lis r3, modeCtrl@ha
/* 00003690 3800000F */ li r0, 0xf
/* 00003694 90030000 */ stw r0, modeCtrl@l(r3)
/* 00003698 39F20068 */ addi r15, r18, 0x68
/* 0000369C 80720068 */ lwz r3, 0x68(r18)
/* 000036A0 2C03FFFF */ cmpwi r3, -1
/* 000036A4 41820020 */ beq lbl_000036C4
/* 000036A8 4BFFCAE1 */ bl find_sprite_with_tag
/* 000036AC 28030000 */ cmplwi r3, 0
/* 000036B0 4182000C */ beq lbl_000036BC
/* 000036B4 38000002 */ li r0, 2
/* 000036B8 90030048 */ stw r0, 0x48(r3)
lbl_000036BC:
/* 000036BC 3800FFFF */ li r0, -1
/* 000036C0 900F0000 */ stw r0, 0(r15)
lbl_000036C4:
/* 000036C4 3A200000 */ li r17, 0
/* 000036C8 3A000002 */ li r16, 2
/* 000036CC 39E0FFFF */ li r15, -1
lbl_000036D0:
/* 000036D0 807C006C */ lwz r3, 0x6c(r28)
/* 000036D4 2C03FFFF */ cmpwi r3, -1
/* 000036D8 41820018 */ beq lbl_000036F0
/* 000036DC 4BFFCAAD */ bl find_sprite_with_tag
/* 000036E0 28030000 */ cmplwi r3, 0
/* 000036E4 41820008 */ beq lbl_000036EC
/* 000036E8 92030048 */ stw r16, 0x48(r3)
lbl_000036EC:
/* 000036EC 91FC006C */ stw r15, 0x6c(r28)
lbl_000036F0:
/* 000036F0 3A310001 */ addi r17, r17, 1
/* 000036F4 2C11000A */ cmpwi r17, 0xa
/* 000036F8 3B9C0004 */ addi r28, r28, 4
/* 000036FC 4180FFD4 */ blt lbl_000036D0
/* 00003700 3860006B */ li r3, 0x6b
/* 00003704 4BFFCA85 */ bl u_play_sound_0
/* 00003708 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000370C 38000003 */ li r0, 3
/* 00003710 90030000 */ stw r0, lbl_801EEDA8@l(r3)
lbl_00003714:
/* 00003714 3C600000 */ lis r3, modeCtrl@ha
/* 00003718 38830000 */ addi r4, r3, modeCtrl@l
/* 0000371C 80640000 */ lwz r3, 0(r4)
/* 00003720 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00003724 90040000 */ stw r0, 0(r4)
/* 00003728 4181612C */ bgt lbl_00009854
/* 0000372C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003730 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003734 3883000E */ addi r4, r3, 0xe
/* 00003738 A863000E */ lha r3, 0xe(r3)
/* 0000373C 2C030000 */ cmpwi r3, 0
/* 00003740 4081000C */ ble lbl_0000374C
/* 00003744 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00003748 B0040000 */ sth r0, 0(r4)
lbl_0000374C:
/* 0000374C A8040000 */ lha r0, 0(r4)
/* 00003750 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003754 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00003758 5400103A */ slwi r0, r0, 2
/* 0000375C 7C640214 */ add r3, r4, r0
/* 00003760 80630010 */ lwz r3, 0x10(r3)
/* 00003764 38000000 */ li r0, 0
/* 00003768 90640000 */ stw r3, 0(r4)
/* 0000376C 90040008 */ stw r0, 8(r4)
/* 00003770 480060E4 */ b lbl_00009854
lbl_00003774:
/* 00003774 4BFFCA15 */ bl func_8009F4C4
/* 00003778 5460063E */ clrlwi r0, r3, 0x18
/* 0000377C 28000001 */ cmplwi r0, 1
/* 00003780 40820020 */ bne lbl_000037A0
/* 00003784 38600003 */ li r3, 3
/* 00003788 4BFFCA01 */ bl func_8009F49C
/* 0000378C 38600000 */ li r3, 0
/* 00003790 4BFFC9F9 */ bl event_start
/* 00003794 38000005 */ li r0, 5
/* 00003798 90120000 */ stw r0, 0(r18)
/* 0000379C 480060B8 */ b lbl_00009854
lbl_000037A0:
/* 000037A0 38000006 */ li r0, 6
/* 000037A4 90120000 */ stw r0, 0(r18)
/* 000037A8 480060AC */ b lbl_00009854
lbl_000037AC:
/* 000037AC 3C600000 */ lis r3, eventInfo@ha
/* 000037B0 88030000 */ lbz r0, eventInfo@l(r3)
/* 000037B4 2C000002 */ cmpwi r0, 2
/* 000037B8 4182609C */ beq lbl_00009854
/* 000037BC 38000006 */ li r0, 6
/* 000037C0 90120000 */ stw r0, 0(r18)
/* 000037C4 48006090 */ b lbl_00009854
lbl_000037C8:
/* 000037C8 A812000E */ lha r0, 0xe(r18)
/* 000037CC 38600100 */ li r3, 0x100
/* 000037D0 38800000 */ li r4, 0
/* 000037D4 5400103A */ slwi r0, r0, 2
/* 000037D8 7CB20214 */ add r5, r18, r0
/* 000037DC 80050010 */ lwz r0, 0x10(r5)
/* 000037E0 38A0001E */ li r5, 0x1e
/* 000037E4 90120000 */ stw r0, 0(r18)
/* 000037E8 4BFFC9A1 */ bl start_screen_fade
/* 000037EC 48006068 */ b lbl_00009854
lbl_000037F0:
/* 000037F0 3860023A */ li r3, 0x23a
/* 000037F4 4BFFC995 */ bl u_play_sound_0
/* 000037F8 3C600000 */ lis r3, lbl_802F1C10@ha
/* 000037FC 88030000 */ lbz r0, lbl_802F1C10@l(r3)
/* 00003800 38600016 */ li r3, 0x16
/* 00003804 7C000774 */ extsb r0, r0
/* 00003808 90120038 */ stw r0, 0x38(r18)
/* 0000380C 4BFFC97D */ bl find_sprite_with_tag
/* 00003810 28030000 */ cmplwi r3, 0
/* 00003814 4182000C */ beq lbl_00003820
/* 00003818 38000003 */ li r0, 3
/* 0000381C 90030048 */ stw r0, 0x48(r3)
lbl_00003820:
/* 00003820 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003824 38000008 */ li r0, 8
/* 00003828 90030000 */ stw r0, lbl_801EEDA8@l(r3)
lbl_0000382C:
/* 0000382C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003830 39E30000 */ addi r15, r3, lbl_801EEDA8@l
/* 00003834 3A0F0038 */ addi r16, r15, 0x38
/* 00003838 38700000 */ addi r3, r16, 0
/* 0000383C 38800000 */ li r4, 0
/* 00003840 38A00011 */ li r5, 0x11
/* 00003844 38C00039 */ li r6, 0x39
/* 00003848 38E00000 */ li r7, 0
/* 0000384C 39000000 */ li r8, 0
/* 00003850 39200000 */ li r9, 0
/* 00003854 4BFFE5BD */ bl lbl_00001E10
/* 00003858 38600007 */ li r3, 7
/* 0000385C 4BFFCD79 */ bl lbl_000005D4
/* 00003860 2C030000 */ cmpwi r3, 0
/* 00003864 41820010 */ beq lbl_00003874
/* 00003868 38000037 */ li r0, 0x37
/* 0000386C 900F0000 */ stw r0, 0(r15)
/* 00003870 48005FE4 */ b lbl_00009854
lbl_00003874:
/* 00003874 38600006 */ li r3, 6
/* 00003878 4BFFCD5D */ bl lbl_000005D4
/* 0000387C 2C030000 */ cmpwi r3, 0
/* 00003880 41825FD4 */ beq lbl_00009854
/* 00003884 80900000 */ lwz r4, 0(r16)
/* 00003888 3C600000 */ lis r3, lbl_802F1C10@ha
/* 0000388C 7C800774 */ extsb r0, r4
/* 00003890 2C040001 */ cmpwi r4, 1
/* 00003894 98030000 */ stb r0, lbl_802F1C10@l(r3)
/* 00003898 41820034 */ beq lbl_000038CC
/* 0000389C 40800010 */ bge lbl_000038AC
/* 000038A0 2C040000 */ cmpwi r4, 0
/* 000038A4 40800014 */ bge lbl_000038B8
/* 000038A8 48005FAC */ b lbl_00009854
lbl_000038AC:
/* 000038AC 2C040003 */ cmpwi r4, 3
/* 000038B0 40805FA4 */ bge lbl_00009854
/* 000038B4 4800002C */ b lbl_000038E0
lbl_000038B8:
/* 000038B8 38600212 */ li r3, 0x212
/* 000038BC 4BFFC8CD */ bl u_play_sound_0
/* 000038C0 38000009 */ li r0, 9
/* 000038C4 900F0004 */ stw r0, 4(r15)
/* 000038C8 48005F8C */ b lbl_00009854
lbl_000038CC:
/* 000038CC 3860021B */ li r3, 0x21b
/* 000038D0 4BFFC8B9 */ bl u_play_sound_0
/* 000038D4 3800000B */ li r0, 0xb
/* 000038D8 900F0004 */ stw r0, 4(r15)
/* 000038DC 48005F78 */ b lbl_00009854
lbl_000038E0:
/* 000038E0 38600222 */ li r3, 0x222
/* 000038E4 4BFFC8A5 */ bl u_play_sound_0
/* 000038E8 3800000D */ li r0, 0xd
/* 000038EC 900F0004 */ stw r0, 4(r15)
/* 000038F0 48005F64 */ b lbl_00009854
lbl_000038F4:
/* 000038F4 3C600000 */ lis r3, currStageId@ha
/* 000038F8 A8030000 */ lha r0, currStageId@l(r3)
/* 000038FC 38600016 */ li r3, 0x16
/* 00003900 901F003C */ stw r0, 0x3c(r31)
/* 00003904 4BFFC885 */ bl find_sprite_with_tag
/* 00003908 28030000 */ cmplwi r3, 0
/* 0000390C 4182000C */ beq lbl_00003918
/* 00003910 38000000 */ li r0, 0
/* 00003914 90030048 */ stw r0, 0x48(r3)
lbl_00003918:
/* 00003918 3C600000 */ lis r3, lbl_802F1C10@ha
/* 0000391C 38630000 */ addi r3, r3, lbl_802F1C10@l
/* 00003920 88030001 */ lbz r0, 1(r3)
/* 00003924 3C600000 */ lis r3, modeCtrl@ha
/* 00003928 38630000 */ addi r3, r3, modeCtrl@l
/* 0000392C 7C000774 */ extsb r0, r0
/* 00003930 94030028 */ stwu r0, 0x28(r3)
/* 00003934 80030000 */ lwz r0, 0(r3)
/* 00003938 2C000002 */ cmpwi r0, 2
/* 0000393C 4081000C */ ble lbl_00003948
/* 00003940 38000000 */ li r0, 0
/* 00003944 90030000 */ stw r0, 0(r3)
lbl_00003948:
/* 00003948 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000394C 3800000A */ li r0, 0xa
/* 00003950 90030000 */ stw r0, lbl_801EEDA8@l(r3)
lbl_00003954:
/* 00003954 4BFFE405 */ bl lbl_00001D58
/* 00003958 2C030000 */ cmpwi r3, 0
/* 0000395C 40825EF8 */ bne lbl_00009854
/* 00003960 3A000000 */ li r16, 0
/* 00003964 39F00000 */ addi r15, r16, 0
/* 00003968 38600000 */ li r3, 0
/* 0000396C 38800001 */ li r4, 1
/* 00003970 38A00000 */ li r5, 0
/* 00003974 4BFFC815 */ bl is_floor_visited
/* 00003978 2C030000 */ cmpwi r3, 0
/* 0000397C 40820020 */ bne lbl_0000399C
/* 00003980 38600001 */ li r3, 1
/* 00003984 38800001 */ li r4, 1
/* 00003988 38A00000 */ li r5, 0
/* 0000398C 4BFFC7FD */ bl is_floor_visited
/* 00003990 2C030000 */ cmpwi r3, 0
/* 00003994 40820008 */ bne lbl_0000399C
/* 00003998 39E00001 */ li r15, 1
lbl_0000399C:
/* 0000399C 2C0F0000 */ cmpwi r15, 0
/* 000039A0 41820020 */ beq lbl_000039C0
/* 000039A4 38600002 */ li r3, 2
/* 000039A8 38800001 */ li r4, 1
/* 000039AC 38A00000 */ li r5, 0
/* 000039B0 4BFFC7D9 */ bl is_floor_visited
/* 000039B4 2C030000 */ cmpwi r3, 0
/* 000039B8 40820008 */ bne lbl_000039C0
/* 000039BC 3A000001 */ li r16, 1
lbl_000039C0:
/* 000039C0 3C600000 */ lis r3, modeCtrl@ha
/* 000039C4 38630000 */ addi r3, r3, modeCtrl@l
/* 000039C8 39E30028 */ addi r15, r3, 0x28
/* 000039CC 386F0000 */ addi r3, r15, 0
/* 000039D0 39100000 */ addi r8, r16, 0
/* 000039D4 39300000 */ addi r9, r16, 0
/* 000039D8 38800000 */ li r4, 0
/* 000039DC 38A00001 */ li r5, 1
/* 000039E0 38C00032 */ li r6, 0x32
/* 000039E4 38E00000 */ li r7, 0
/* 000039E8 4BFFE429 */ bl lbl_00001E10
/* 000039EC 38600007 */ li r3, 7
/* 000039F0 4BFFCBE5 */ bl lbl_000005D4
/* 000039F4 2C030000 */ cmpwi r3, 0
/* 000039F8 41820018 */ beq lbl_00003A10
/* 000039FC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003A00 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003A04 38000001 */ li r0, 1
/* 00003A08 90030008 */ stw r0, 8(r3)
/* 00003A0C 48005E48 */ b lbl_00009854
lbl_00003A10:
/* 00003A10 38600006 */ li r3, 6
/* 00003A14 4BFFCBC1 */ bl lbl_000005D4
/* 00003A18 2C030000 */ cmpwi r3, 0
/* 00003A1C 41825E38 */ beq lbl_00009854
/* 00003A20 800F0000 */ lwz r0, 0(r15)
/* 00003A24 2C000000 */ cmpwi r0, 0
/* 00003A28 4182000C */ beq lbl_00003A34
/* 00003A2C 2C100000 */ cmpwi r16, 0
/* 00003A30 40825E24 */ bne lbl_00009854
lbl_00003A34:
/* 00003A34 808F0000 */ lwz r4, 0(r15)
/* 00003A38 3C600000 */ lis r3, lbl_802F1C10@ha
/* 00003A3C 38630000 */ addi r3, r3, lbl_802F1C10@l
/* 00003A40 7C800774 */ extsb r0, r4
/* 00003A44 2C040001 */ cmpwi r4, 1
/* 00003A48 98030001 */ stb r0, 1(r3)
/* 00003A4C 4182006C */ beq lbl_00003AB8
/* 00003A50 40800010 */ bge lbl_00003A60
/* 00003A54 2C040000 */ cmpwi r4, 0
/* 00003A58 40800014 */ bge lbl_00003A6C
/* 00003A5C 48005DF8 */ b lbl_00009854
lbl_00003A60:
/* 00003A60 2C040003 */ cmpwi r4, 3
/* 00003A64 40805DF0 */ bge lbl_00009854
/* 00003A68 480000EC */ b lbl_00003B54
lbl_00003A6C:
/* 00003A6C 38600213 */ li r3, 0x213
/* 00003A70 4BFFC719 */ bl u_play_sound_0
/* 00003A74 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003A78 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003A7C 3800000F */ li r0, 0xf
/* 00003A80 90030004 */ stw r0, 4(r3)
/* 00003A84 39E00001 */ li r15, 1
/* 00003A88 38000004 */ li r0, 4
/* 00003A8C 91E30040 */ stw r15, 0x40(r3)
/* 00003A90 9003003C */ stw r0, 0x3c(r3)
/* 00003A94 4BFFDE7D */ bl lbl_00001910
/* 00003A98 3C800000 */ lis r4, modeCtrl@ha
/* 00003A9C 38840000 */ addi r4, r4, modeCtrl@l
/* 00003AA0 94640024 */ stwu r3, 0x24(r4)
/* 00003AA4 80040000 */ lwz r0, 0(r4)
/* 00003AA8 2C000001 */ cmpwi r0, 1
/* 00003AAC 40805DA8 */ bge lbl_00009854
/* 00003AB0 91E40000 */ stw r15, 0(r4)
/* 00003AB4 48005DA0 */ b lbl_00009854
lbl_00003AB8:
/* 00003AB8 38600214 */ li r3, 0x214
/* 00003ABC 4BFFC6CD */ bl u_play_sound_0
/* 00003AC0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003AC4 39E30000 */ addi r15, r3, lbl_801EEDA8@l
/* 00003AC8 3800000F */ li r0, 0xf
/* 00003ACC 900F0004 */ stw r0, 4(r15)
/* 00003AD0 4BFFDE41 */ bl lbl_00001910
/* 00003AD4 38000002 */ li r0, 2
/* 00003AD8 900F0040 */ stw r0, 0x40(r15)
/* 00003ADC 3CA00000 */ lis r5, modeCtrl@ha
/* 00003AE0 38C50000 */ addi r6, r5, modeCtrl@l
/* 00003AE4 906F003C */ stw r3, 0x3c(r15)
/* 00003AE8 3C800000 */ lis r4, lbl_801EED50@ha
/* 00003AEC 3C600000 */ lis r3, lbl_8027CE24@ha
/* 00003AF0 800F003C */ lwz r0, 0x3c(r15)
/* 00003AF4 38A40000 */ addi r5, r4, lbl_801EED50@l
/* 00003AF8 38830000 */ addi r4, r3, lbl_8027CE24@l
/* 00003AFC 90060024 */ stw r0, 0x24(r6)
/* 00003B00 80650004 */ lwz r3, 4(r5)
/* 00003B04 80050008 */ lwz r0, 8(r5)
/* 00003B08 90640000 */ stw r3, 0(r4)
/* 00003B0C 90040004 */ stw r0, 4(r4)
/* 00003B10 8065000C */ lwz r3, 0xc(r5)
/* 00003B14 80050010 */ lwz r0, 0x10(r5)
/* 00003B18 90640008 */ stw r3, 8(r4)
/* 00003B1C 9004000C */ stw r0, 0xc(r4)
/* 00003B20 80650014 */ lwz r3, 0x14(r5)
/* 00003B24 80050018 */ lwz r0, 0x18(r5)
/* 00003B28 90640010 */ stw r3, 0x10(r4)
/* 00003B2C 90040014 */ stw r0, 0x14(r4)
/* 00003B30 8065001C */ lwz r3, 0x1c(r5)
/* 00003B34 80050020 */ lwz r0, 0x20(r5)
/* 00003B38 90640018 */ stw r3, 0x18(r4)
/* 00003B3C 9004001C */ stw r0, 0x1c(r4)
/* 00003B40 80650024 */ lwz r3, 0x24(r5)
/* 00003B44 80050028 */ lwz r0, 0x28(r5)
/* 00003B48 90640020 */ stw r3, 0x20(r4)
/* 00003B4C 90040024 */ stw r0, 0x24(r4)
/* 00003B50 48005D04 */ b lbl_00009854
lbl_00003B54:
/* 00003B54 38600215 */ li r3, 0x215
/* 00003B58 4BFFC631 */ bl u_play_sound_0
/* 00003B5C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003B60 39030000 */ addi r8, r3, lbl_801EEDA8@l
/* 00003B64 38000011 */ li r0, 0x11
/* 00003B68 90080004 */ stw r0, 4(r8)
/* 00003B6C 38E00001 */ li r7, 1
/* 00003B70 3C800000 */ lis r4, modeCtrl@ha
/* 00003B74 90E80040 */ stw r7, 0x40(r8)
/* 00003B78 38C40000 */ addi r6, r4, modeCtrl@l
/* 00003B7C 3C600000 */ lis r3, lbl_802F1C04@ha
/* 00003B80 90E8003C */ stw r7, 0x3c(r8)
/* 00003B84 38830000 */ addi r4, r3, lbl_802F1C04@l
/* 00003B88 3CA00000 */ lis r5, lbl_8027CE24@ha
/* 00003B8C 8008003C */ lwz r0, 0x3c(r8)
/* 00003B90 90060024 */ stw r0, 0x24(r6)
/* 00003B94 98E80114 */ stb r7, 0x114(r8)
/* 00003B98 80640000 */ lwz r3, 0(r4)
/* 00003B9C 80040004 */ lwz r0, 4(r4)
/* 00003BA0 94650000 */ stwu r3, lbl_8027CE24@l(r5)
/* 00003BA4 90050004 */ stw r0, 4(r5)
/* 00003BA8 48005CAC */ b lbl_00009854
lbl_00003BAC:
/* 00003BAC 3C600000 */ lis r3, currStageId@ha
/* 00003BB0 A8030000 */ lha r0, currStageId@l(r3)
/* 00003BB4 38600006 */ li r3, 6
/* 00003BB8 901F003C */ stw r0, 0x3c(r31)
/* 00003BBC 4BFFC5CD */ bl is_minigame_unlocked
/* 00003BC0 2C030000 */ cmpwi r3, 0
/* 00003BC4 4182004C */ beq lbl_00003C10
/* 00003BC8 38600007 */ li r3, 7
/* 00003BCC 4BFFC5BD */ bl is_minigame_unlocked
/* 00003BD0 2C030000 */ cmpwi r3, 0
/* 00003BD4 4182003C */ beq lbl_00003C10
/* 00003BD8 38600008 */ li r3, 8
/* 00003BDC 4BFFC5AD */ bl is_minigame_unlocked
/* 00003BE0 2C030000 */ cmpwi r3, 0
/* 00003BE4 4182002C */ beq lbl_00003C10
/* 00003BE8 3C600000 */ lis r3, lbl_802014E0@ha
/* 00003BEC 38630000 */ addi r3, r3, lbl_802014E0@l
/* 00003BF0 80630000 */ lwz r3, 0(r3)
/* 00003BF4 3803FFFA */ addi r0, r3, -6  ;# fixed addi
/* 00003BF8 28000001 */ cmplwi r0, 1
/* 00003BFC 40810038 */ ble lbl_00003C34
/* 00003C00 38600007 */ li r3, 7
/* 00003C04 38800000 */ li r4, 0
/* 00003C08 4BFFC581 */ bl u_play_music
/* 00003C0C 48000028 */ b lbl_00003C34
lbl_00003C10:
/* 00003C10 3C600000 */ lis r3, lbl_802014E0@ha
/* 00003C14 38630000 */ addi r3, r3, lbl_802014E0@l
/* 00003C18 80630000 */ lwz r3, 0(r3)
/* 00003C1C 3803FFFC */ addi r0, r3, -4  ;# fixed addi
/* 00003C20 28000001 */ cmplwi r0, 1
/* 00003C24 40810010 */ ble lbl_00003C34
/* 00003C28 38600005 */ li r3, 5
/* 00003C2C 38800000 */ li r4, 0
/* 00003C30 4BFFC559 */ bl u_play_music
lbl_00003C34:
/* 00003C34 38600016 */ li r3, 0x16
/* 00003C38 4BFFC551 */ bl find_sprite_with_tag
/* 00003C3C 28030000 */ cmplwi r3, 0
/* 00003C40 4182000C */ beq lbl_00003C4C
/* 00003C44 38000009 */ li r0, 9
/* 00003C48 90030048 */ stw r0, 0x48(r3)
lbl_00003C4C:
/* 00003C4C 3C600000 */ lis r3, lbl_802F1C10@ha
/* 00003C50 38630000 */ addi r3, r3, lbl_802F1C10@l
/* 00003C54 88030001 */ lbz r0, 1(r3)
/* 00003C58 3C600000 */ lis r3, modeCtrl@ha
/* 00003C5C 38630000 */ addi r3, r3, modeCtrl@l
/* 00003C60 7C000774 */ extsb r0, r0
/* 00003C64 94030028 */ stwu r0, 0x28(r3)
/* 00003C68 80030000 */ lwz r0, 0(r3)
/* 00003C6C 2C000003 */ cmpwi r0, 3
/* 00003C70 4180000C */ blt lbl_00003C7C
/* 00003C74 2C000005 */ cmpwi r0, 5
/* 00003C78 4081000C */ ble lbl_00003C84
lbl_00003C7C:
/* 00003C7C 38000003 */ li r0, 3
/* 00003C80 90030000 */ stw r0, 0(r3)
lbl_00003C84:
/* 00003C84 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003C88 3800000C */ li r0, 0xc
/* 00003C8C 90030000 */ stw r0, lbl_801EEDA8@l(r3)
lbl_00003C90:
/* 00003C90 4BFFE0C9 */ bl lbl_00001D58
/* 00003C94 2C030000 */ cmpwi r3, 0
/* 00003C98 40825BBC */ bne lbl_00009854
/* 00003C9C 3C600000 */ lis r3, modeCtrl@ha
/* 00003CA0 3A030000 */ addi r16, r3, modeCtrl@l
/* 00003CA4 3A300028 */ addi r17, r16, 0x28
/* 00003CA8 38710000 */ addi r3, r17, 0
/* 00003CAC 38800003 */ li r4, 3
/* 00003CB0 38A0001C */ li r5, 0x1c
/* 00003CB4 38C0003C */ li r6, 0x3c
/* 00003CB8 38E00000 */ li r7, 0
/* 00003CBC 39000000 */ li r8, 0
/* 00003CC0 39200000 */ li r9, 0
/* 00003CC4 4BFFE14D */ bl lbl_00001E10
/* 00003CC8 38600007 */ li r3, 7
/* 00003CCC 4BFFC909 */ bl lbl_000005D4
/* 00003CD0 2C030000 */ cmpwi r3, 0
/* 00003CD4 41820018 */ beq lbl_00003CEC
/* 00003CD8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003CDC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003CE0 38000001 */ li r0, 1
/* 00003CE4 90030008 */ stw r0, 8(r3)
/* 00003CE8 48005B6C */ b lbl_00009854
lbl_00003CEC:
/* 00003CEC 38600006 */ li r3, 6
/* 00003CF0 4BFFC8E5 */ bl lbl_000005D4
/* 00003CF4 2C030000 */ cmpwi r3, 0
/* 00003CF8 41825B5C */ beq lbl_00009854
/* 00003CFC 80110000 */ lwz r0, 0(r17)
/* 00003D00 3C800000 */ lis r4, lbl_802F1C10@ha
/* 00003D04 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003D08 7C000774 */ extsb r0, r0
/* 00003D0C 38840000 */ addi r4, r4, lbl_802F1C10@l
/* 00003D10 98040001 */ stb r0, 1(r4)
/* 00003D14 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003D18 39E00001 */ li r15, 1
/* 00003D1C 91E30040 */ stw r15, 0x40(r3)
/* 00003D20 38000004 */ li r0, 4
/* 00003D24 9003003C */ stw r0, 0x3c(r3)
/* 00003D28 4BFFDBE9 */ bl lbl_00001910
/* 00003D2C 38900024 */ addi r4, r16, 0x24
/* 00003D30 90700024 */ stw r3, 0x24(r16)
/* 00003D34 80100024 */ lwz r0, 0x24(r16)
/* 00003D38 2C000001 */ cmpwi r0, 1
/* 00003D3C 40800008 */ bge lbl_00003D44
/* 00003D40 91E40000 */ stw r15, 0(r4)
lbl_00003D44:
/* 00003D44 80110000 */ lwz r0, 0(r17)
/* 00003D48 2C000004 */ cmpwi r0, 4
/* 00003D4C 41820048 */ beq lbl_00003D94
/* 00003D50 40800010 */ bge lbl_00003D60
/* 00003D54 2C000003 */ cmpwi r0, 3
/* 00003D58 40800014 */ bge lbl_00003D6C
/* 00003D5C 48005AF8 */ b lbl_00009854
lbl_00003D60:
/* 00003D60 2C000006 */ cmpwi r0, 6
/* 00003D64 40805AF0 */ bge lbl_00009854
/* 00003D68 48000054 */ b lbl_00003DBC
lbl_00003D6C:
/* 00003D6C 3860021C */ li r3, 0x21c
/* 00003D70 4BFFC419 */ bl u_play_sound_0
/* 00003D74 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003D78 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003D7C 3800001C */ li r0, 0x1c
/* 00003D80 90030004 */ stw r0, 4(r3)
/* 00003D84 38600008 */ li r3, 8
/* 00003D88 38800000 */ li r4, 0
/* 00003D8C 4BFFC3FD */ bl u_play_music
/* 00003D90 48005AC4 */ b lbl_00009854
lbl_00003D94:
/* 00003D94 3860021D */ li r3, 0x21d
/* 00003D98 4BFFC3F1 */ bl u_play_sound_0
/* 00003D9C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003DA0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003DA4 3800000F */ li r0, 0xf
/* 00003DA8 90030004 */ stw r0, 4(r3)
/* 00003DAC 3860000A */ li r3, 0xa
/* 00003DB0 38800000 */ li r4, 0
/* 00003DB4 4BFFC3D5 */ bl u_play_music
/* 00003DB8 48005A9C */ b lbl_00009854
lbl_00003DBC:
/* 00003DBC 3860021E */ li r3, 0x21e
/* 00003DC0 4BFFC3C9 */ bl u_play_sound_0
/* 00003DC4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003DC8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003DCC 3800000F */ li r0, 0xf
/* 00003DD0 90030004 */ stw r0, 4(r3)
/* 00003DD4 3860000C */ li r3, 0xc
/* 00003DD8 38800000 */ li r4, 0
/* 00003DDC 4BFFC3AD */ bl u_play_music
/* 00003DE0 48005A74 */ b lbl_00009854
lbl_00003DE4:
/* 00003DE4 38600006 */ li r3, 6
/* 00003DE8 4BFFC3A1 */ bl is_minigame_unlocked
/* 00003DEC 2C030000 */ cmpwi r3, 0
/* 00003DF0 4182004C */ beq lbl_00003E3C
/* 00003DF4 38600007 */ li r3, 7
/* 00003DF8 4BFFC391 */ bl is_minigame_unlocked
/* 00003DFC 2C030000 */ cmpwi r3, 0
/* 00003E00 4182003C */ beq lbl_00003E3C
/* 00003E04 38600008 */ li r3, 8
/* 00003E08 4BFFC381 */ bl is_minigame_unlocked
/* 00003E0C 2C030000 */ cmpwi r3, 0
/* 00003E10 4182002C */ beq lbl_00003E3C
/* 00003E14 3C600000 */ lis r3, lbl_802014E0@ha
/* 00003E18 38630000 */ addi r3, r3, lbl_802014E0@l
/* 00003E1C 80630000 */ lwz r3, 0(r3)
/* 00003E20 3803FFFA */ addi r0, r3, -6  ;# fixed addi
/* 00003E24 28000001 */ cmplwi r0, 1
/* 00003E28 40810038 */ ble lbl_00003E60
/* 00003E2C 38600007 */ li r3, 7
/* 00003E30 38800000 */ li r4, 0
/* 00003E34 4BFFC355 */ bl u_play_music
/* 00003E38 48000028 */ b lbl_00003E60
lbl_00003E3C:
/* 00003E3C 3C600000 */ lis r3, lbl_802014E0@ha
/* 00003E40 38630000 */ addi r3, r3, lbl_802014E0@l
/* 00003E44 80630000 */ lwz r3, 0(r3)
/* 00003E48 3803FFFC */ addi r0, r3, -4  ;# fixed addi
/* 00003E4C 28000001 */ cmplwi r0, 1
/* 00003E50 40810010 */ ble lbl_00003E60
/* 00003E54 38600005 */ li r3, 5
/* 00003E58 38800000 */ li r4, 0
/* 00003E5C 4BFFC32D */ bl u_play_music
lbl_00003E60:
/* 00003E60 38600016 */ li r3, 0x16
/* 00003E64 4BFFC325 */ bl find_sprite_with_tag
/* 00003E68 28030000 */ cmplwi r3, 0
/* 00003E6C 4182000C */ beq lbl_00003E78
/* 00003E70 38000008 */ li r0, 8
/* 00003E74 90030048 */ stw r0, 0x48(r3)
lbl_00003E78:
/* 00003E78 38600006 */ li r3, 6
/* 00003E7C 4BFFC30D */ bl is_minigame_unlocked
/* 00003E80 2C030000 */ cmpwi r3, 0
/* 00003E84 41820024 */ beq lbl_00003EA8
/* 00003E88 38600007 */ li r3, 7
/* 00003E8C 4BFFC2FD */ bl is_minigame_unlocked
/* 00003E90 2C030000 */ cmpwi r3, 0
/* 00003E94 41820014 */ beq lbl_00003EA8
/* 00003E98 38600008 */ li r3, 8
/* 00003E9C 4BFFC2ED */ bl is_minigame_unlocked
/* 00003EA0 2C030000 */ cmpwi r3, 0
/* 00003EA4 40820008 */ bne lbl_00003EAC
lbl_00003EA8:
/* 00003EA8 4800D7E1 */ bl lbl_00011688
lbl_00003EAC:
/* 00003EAC 3C600000 */ lis r3, lbl_802F1C10@ha
/* 00003EB0 38630000 */ addi r3, r3, lbl_802F1C10@l
/* 00003EB4 88030001 */ lbz r0, 1(r3)
/* 00003EB8 3C600000 */ lis r3, modeCtrl@ha
/* 00003EBC 38630000 */ addi r3, r3, modeCtrl@l
/* 00003EC0 7C000774 */ extsb r0, r0
/* 00003EC4 94030028 */ stwu r0, 0x28(r3)
/* 00003EC8 80030000 */ lwz r0, 0(r3)
/* 00003ECC 2C000006 */ cmpwi r0, 6
/* 00003ED0 4180000C */ blt lbl_00003EDC
/* 00003ED4 2C000008 */ cmpwi r0, 8
/* 00003ED8 4081000C */ ble lbl_00003EE4
lbl_00003EDC:
/* 00003EDC 38000006 */ li r0, 6
/* 00003EE0 90030000 */ stw r0, 0(r3)
lbl_00003EE4:
/* 00003EE4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003EE8 3800000E */ li r0, 0xe
/* 00003EEC 90030000 */ stw r0, lbl_801EEDA8@l(r3)
lbl_00003EF0:
/* 00003EF0 3A200000 */ li r17, 0
/* 00003EF4 3A400000 */ li r18, 0
/* 00003EF8 4BFFDE61 */ bl lbl_00001D58
/* 00003EFC 2C030000 */ cmpwi r3, 0
/* 00003F00 40825954 */ bne lbl_00009854
/* 00003F04 39E00000 */ li r15, 0
/* 00003F08 38600006 */ li r3, 6
/* 00003F0C 4BFFC27D */ bl is_minigame_unlocked
/* 00003F10 2C030000 */ cmpwi r3, 0
/* 00003F14 40820008 */ bne lbl_00003F1C
/* 00003F18 39E00001 */ li r15, 1
lbl_00003F1C:
/* 00003F1C 38600007 */ li r3, 7
/* 00003F20 4BFFC269 */ bl is_minigame_unlocked
/* 00003F24 2C030000 */ cmpwi r3, 0
/* 00003F28 40820008 */ bne lbl_00003F30
/* 00003F2C 3A200001 */ li r17, 1
lbl_00003F30:
/* 00003F30 38600008 */ li r3, 8
/* 00003F34 4BFFC255 */ bl is_minigame_unlocked
/* 00003F38 2C030000 */ cmpwi r3, 0
/* 00003F3C 40820008 */ bne lbl_00003F44
/* 00003F40 3A400001 */ li r18, 1
lbl_00003F44:
/* 00003F44 3C600000 */ lis r3, modeCtrl@ha
/* 00003F48 38630000 */ addi r3, r3, modeCtrl@l
/* 00003F4C 3A030028 */ addi r16, r3, 0x28
/* 00003F50 38700000 */ addi r3, r16, 0
/* 00003F54 38EF0000 */ addi r7, r15, 0
/* 00003F58 39110000 */ addi r8, r17, 0
/* 00003F5C 39320000 */ addi r9, r18, 0
/* 00003F60 38800006 */ li r4, 6
/* 00003F64 38A00039 */ li r5, 0x39
/* 00003F68 38C0003F */ li r6, 0x3f
/* 00003F6C 4BFFDEA5 */ bl lbl_00001E10
/* 00003F70 38600007 */ li r3, 7
/* 00003F74 4BFFC661 */ bl lbl_000005D4
/* 00003F78 2C030000 */ cmpwi r3, 0
/* 00003F7C 4182002C */ beq lbl_00003FA8
/* 00003F80 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00003F84 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00003F88 39E00001 */ li r15, 1
/* 00003F8C 91E30008 */ stw r15, 8(r3)
/* 00003F90 38600009 */ li r3, 9
/* 00003F94 4BFFC1F5 */ bl find_sprite_with_tag
/* 00003F98 28030000 */ cmplwi r3, 0
/* 00003F9C 418258B8 */ beq lbl_00009854
/* 00003FA0 91E30048 */ stw r15, 0x48(r3)
/* 00003FA4 480058B0 */ b lbl_00009854
lbl_00003FA8:
/* 00003FA8 3C600000 */ lis r3, g_totalPlayPoints@ha
/* 00003FAC 80030000 */ lwz r0, g_totalPlayPoints@l(r3)
/* 00003FB0 3A600000 */ li r19, 0
/* 00003FB4 280009C4 */ cmplwi r0, 0x9c4
/* 00003FB8 418000E4 */ blt lbl_0000409C
/* 00003FBC 38600006 */ li r3, 6
/* 00003FC0 4BFFC615 */ bl lbl_000005D4
/* 00003FC4 2C030000 */ cmpwi r3, 0
/* 00003FC8 418200D4 */ beq lbl_0000409C
/* 00003FCC 80900000 */ lwz r4, 0(r16)
/* 00003FD0 2C040006 */ cmpwi r4, 6
/* 00003FD4 40820024 */ bne lbl_00003FF8
/* 00003FD8 2C0F0000 */ cmpwi r15, 0
/* 00003FDC 4182001C */ beq lbl_00003FF8
/* 00003FE0 3C600000 */ lis r3, g_unlockFlags@ha
/* 00003FE4 8C030000 */ lbzu r0, g_unlockFlags@l(r3)
/* 00003FE8 39E00000 */ li r15, 0
/* 00003FEC 60000001 */ ori r0, r0, 1
/* 00003FF0 98030000 */ stb r0, 0(r3)
/* 00003FF4 3A600001 */ li r19, 1
lbl_00003FF8:
/* 00003FF8 2C040007 */ cmpwi r4, 7
/* 00003FFC 40820024 */ bne lbl_00004020
/* 00004000 2C110000 */ cmpwi r17, 0
/* 00004004 4182001C */ beq lbl_00004020
/* 00004008 3C600000 */ lis r3, g_unlockFlags@ha
/* 0000400C 8C030000 */ lbzu r0, g_unlockFlags@l(r3)
/* 00004010 3A200000 */ li r17, 0
/* 00004014 60000002 */ ori r0, r0, 2
/* 00004018 98030000 */ stb r0, 0(r3)
/* 0000401C 3A600001 */ li r19, 1
lbl_00004020:
/* 00004020 2C040008 */ cmpwi r4, 8
/* 00004024 40820024 */ bne lbl_00004048
/* 00004028 2C120000 */ cmpwi r18, 0
/* 0000402C 4182001C */ beq lbl_00004048
/* 00004030 3C600000 */ lis r3, g_unlockFlags@ha
/* 00004034 8C030000 */ lbzu r0, g_unlockFlags@l(r3)
/* 00004038 3A400000 */ li r18, 0
/* 0000403C 60000004 */ ori r0, r0, 4
/* 00004040 98030000 */ stb r0, 0(r3)
/* 00004044 3A600001 */ li r19, 1
lbl_00004048:
/* 00004048 2C130000 */ cmpwi r19, 0
/* 0000404C 41820050 */ beq lbl_0000409C
/* 00004050 3860016D */ li r3, 0x16d
/* 00004054 4BFFC135 */ bl u_play_sound_1
/* 00004058 4BFFC131 */ bl spend_play_points
/* 0000405C 2C0F0000 */ cmpwi r15, 0
/* 00004060 408257F4 */ bne lbl_00009854
/* 00004064 2C110000 */ cmpwi r17, 0
/* 00004068 408257EC */ bne lbl_00009854
/* 0000406C 2C120000 */ cmpwi r18, 0
/* 00004070 408257E4 */ bne lbl_00009854
/* 00004074 38600009 */ li r3, 9
/* 00004078 4BFFC111 */ bl find_sprite_with_tag
/* 0000407C 28030000 */ cmplwi r3, 0
/* 00004080 4182000C */ beq lbl_0000408C
/* 00004084 38000001 */ li r0, 1
/* 00004088 90030048 */ stw r0, 0x48(r3)
lbl_0000408C:
/* 0000408C 38600006 */ li r3, 6
/* 00004090 38800000 */ li r4, 0
/* 00004094 4BFFC0F5 */ bl u_play_music
/* 00004098 480057BC */ b lbl_00009854
lbl_0000409C:
/* 0000409C 38600006 */ li r3, 6
/* 000040A0 4BFFC535 */ bl lbl_000005D4
/* 000040A4 2C030000 */ cmpwi r3, 0
/* 000040A8 418257AC */ beq lbl_00009854
/* 000040AC 2C0F0000 */ cmpwi r15, 0
/* 000040B0 41820010 */ beq lbl_000040C0
/* 000040B4 80100000 */ lwz r0, 0(r16)
/* 000040B8 2C000006 */ cmpwi r0, 6
/* 000040BC 41825798 */ beq lbl_00009854
lbl_000040C0:
/* 000040C0 2C110000 */ cmpwi r17, 0
/* 000040C4 41820010 */ beq lbl_000040D4
/* 000040C8 80100000 */ lwz r0, 0(r16)
/* 000040CC 2C000007 */ cmpwi r0, 7
/* 000040D0 41825784 */ beq lbl_00009854
lbl_000040D4:
/* 000040D4 2C120000 */ cmpwi r18, 0
/* 000040D8 41820010 */ beq lbl_000040E8
/* 000040DC 80100000 */ lwz r0, 0(r16)
/* 000040E0 2C000008 */ cmpwi r0, 8
/* 000040E4 41825770 */ beq lbl_00009854
lbl_000040E8:
/* 000040E8 80100000 */ lwz r0, 0(r16)
/* 000040EC 3C600000 */ lis r3, lbl_802F1C10@ha
/* 000040F0 38630000 */ addi r3, r3, lbl_802F1C10@l
/* 000040F4 7C000774 */ extsb r0, r0
/* 000040F8 98030001 */ stb r0, 1(r3)
/* 000040FC 38600009 */ li r3, 9
/* 00004100 4BFFC089 */ bl find_sprite_with_tag
/* 00004104 28030000 */ cmplwi r3, 0
/* 00004108 4182000C */ beq lbl_00004114
/* 0000410C 38000001 */ li r0, 1
/* 00004110 90030048 */ stw r0, 0x48(r3)
lbl_00004114:
/* 00004114 80100000 */ lwz r0, 0(r16)
/* 00004118 2C000007 */ cmpwi r0, 7
/* 0000411C 41820048 */ beq lbl_00004164
/* 00004120 40800010 */ bge lbl_00004130
/* 00004124 2C000006 */ cmpwi r0, 6
/* 00004128 40800014 */ bge lbl_0000413C
/* 0000412C 48005728 */ b lbl_00009854
lbl_00004130:
/* 00004130 2C000009 */ cmpwi r0, 9
/* 00004134 40805720 */ bge lbl_00009854
/* 00004138 48000054 */ b lbl_0000418C
lbl_0000413C:
/* 0000413C 38600223 */ li r3, 0x223
/* 00004140 4BFFC049 */ bl u_play_sound_0
/* 00004144 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004148 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000414C 38000029 */ li r0, 0x29
/* 00004150 90030004 */ stw r0, 4(r3)
/* 00004154 3860000E */ li r3, 0xe
/* 00004158 38800000 */ li r4, 0
/* 0000415C 4BFFC02D */ bl u_play_music
/* 00004160 480056F4 */ b lbl_00009854
lbl_00004164:
/* 00004164 38600224 */ li r3, 0x224
/* 00004168 4BFFC021 */ bl u_play_sound_0
/* 0000416C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004170 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004174 3800002D */ li r0, 0x2d
/* 00004178 90030004 */ stw r0, 4(r3)
/* 0000417C 38600010 */ li r3, 0x10
/* 00004180 38800000 */ li r4, 0
/* 00004184 4BFFC005 */ bl u_play_music
/* 00004188 480056CC */ b lbl_00009854
lbl_0000418C:
/* 0000418C 38600225 */ li r3, 0x225
/* 00004190 4BFFBFF9 */ bl u_play_sound_0
/* 00004194 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004198 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000419C 3800002F */ li r0, 0x2f
/* 000041A0 90030004 */ stw r0, 4(r3)
/* 000041A4 38600012 */ li r3, 0x12
/* 000041A8 38800000 */ li r4, 0
/* 000041AC 4BFFBFDD */ bl u_play_music
/* 000041B0 480056A4 */ b lbl_00009854
lbl_000041B4:
/* 000041B4 38600016 */ li r3, 0x16
/* 000041B8 4BFFBFD1 */ bl find_sprite_with_tag
/* 000041BC 28030000 */ cmplwi r3, 0
/* 000041C0 4182000C */ beq lbl_000041CC
/* 000041C4 38000001 */ li r0, 1
/* 000041C8 90030048 */ stw r0, 0x48(r3)
lbl_000041CC:
/* 000041CC 38600017 */ li r3, 0x17
/* 000041D0 4BFFBFB9 */ bl find_sprite_with_tag
/* 000041D4 28030000 */ cmplwi r3, 0
/* 000041D8 4182004C */ beq lbl_00004224
/* 000041DC 3C800000 */ lis r4, modeCtrl@ha
/* 000041E0 38840000 */ addi r4, r4, modeCtrl@l
/* 000041E4 80040028 */ lwz r0, 0x28(r4)
/* 000041E8 2C000005 */ cmpwi r0, 5
/* 000041EC 41820030 */ beq lbl_0000421C
/* 000041F0 40800010 */ bge lbl_00004200
/* 000041F4 2C000000 */ cmpwi r0, 0
/* 000041F8 41820024 */ beq lbl_0000421C
/* 000041FC 48000014 */ b lbl_00004210
lbl_00004200:
/* 00004200 2C000009 */ cmpwi r0, 9
/* 00004204 4080000C */ bge lbl_00004210
/* 00004208 2C000007 */ cmpwi r0, 7
/* 0000420C 40800010 */ bge lbl_0000421C
lbl_00004210:
/* 00004210 38000010 */ li r0, 0x10
/* 00004214 90030048 */ stw r0, 0x48(r3)
/* 00004218 4800000C */ b lbl_00004224
lbl_0000421C:
/* 0000421C 3800000A */ li r0, 0xa
/* 00004220 90030048 */ stw r0, 0x48(r3)
lbl_00004224:
/* 00004224 3C600000 */ lis r3, lbl_802F1C10@ha
/* 00004228 38630000 */ addi r3, r3, lbl_802F1C10@l
/* 0000422C 88030002 */ lbz r0, 2(r3)
/* 00004230 7C000774 */ extsb r0, r0
/* 00004234 2C00FFFF */ cmpwi r0, -1
/* 00004238 41820010 */ beq lbl_00004248
/* 0000423C 3C600000 */ lis r3, modeCtrl@ha
/* 00004240 38630000 */ addi r3, r3, modeCtrl@l
/* 00004244 90030024 */ stw r0, 0x24(r3)
lbl_00004248:
/* 00004248 3C600000 */ lis r3, modeCtrl@ha
/* 0000424C 38630000 */ addi r3, r3, modeCtrl@l
/* 00004250 39E30028 */ addi r15, r3, 0x28
/* 00004254 80030028 */ lwz r0, 0x28(r3)
/* 00004258 2C000005 */ cmpwi r0, 5
/* 0000425C 41820020 */ beq lbl_0000427C
/* 00004260 40800024 */ bge lbl_00004284
/* 00004264 2C000004 */ cmpwi r0, 4
/* 00004268 40800008 */ bge lbl_00004270
/* 0000426C 48000018 */ b lbl_00004284
lbl_00004270:
/* 00004270 387E00A4 */ addi r3, r30, 0xa4
/* 00004274 48006455 */ bl lbl_0000A6C8
/* 00004278 4800000C */ b lbl_00004284
lbl_0000427C:
/* 0000427C 387E00B8 */ addi r3, r30, 0xb8
/* 00004280 48006449 */ bl lbl_0000A6C8
lbl_00004284:
/* 00004284 800F0000 */ lwz r0, 0(r15)
/* 00004288 2C000005 */ cmpwi r0, 5
/* 0000428C 41820040 */ beq lbl_000042CC
/* 00004290 40800064 */ bge lbl_000042F4
/* 00004294 2C000004 */ cmpwi r0, 4
/* 00004298 40800008 */ bge lbl_000042A0
/* 0000429C 48000058 */ b lbl_000042F4
lbl_000042A0:
/* 000042A0 4BFFBEE9 */ bl empty_load_queue
/* 000042A4 4BFFBEE5 */ bl empty_file_cache
/* 000042A8 387E00CC */ addi r3, r30, 0xcc
/* 000042AC 4BFFBEDD */ bl file_preload
/* 000042B0 387E00E0 */ addi r3, r30, 0xe0
/* 000042B4 4BFFBED5 */ bl file_preload
/* 000042B8 387E00F4 */ addi r3, r30, 0xf4
/* 000042BC 4BFFBECD */ bl file_preload
/* 000042C0 387E0104 */ addi r3, r30, 0x104
/* 000042C4 4BFFBEC5 */ bl file_preload
/* 000042C8 4800002C */ b lbl_000042F4
lbl_000042CC:
/* 000042CC 4BFFBEBD */ bl empty_load_queue
/* 000042D0 4BFFBEB9 */ bl empty_file_cache
/* 000042D4 38600097 */ li r3, 0x97
/* 000042D8 4BFFBEB1 */ bl preload_stage_files
/* 000042DC 387E0118 */ addi r3, r30, 0x118
/* 000042E0 4BFFBEA9 */ bl file_preload
/* 000042E4 387E012C */ addi r3, r30, 0x12c
/* 000042E8 4BFFBEA1 */ bl file_preload
/* 000042EC 387E0140 */ addi r3, r30, 0x140
/* 000042F0 4BFFBE99 */ bl file_preload
lbl_000042F4:
/* 000042F4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000042F8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000042FC 38000000 */ li r0, 0
/* 00004300 90030044 */ stw r0, 0x44(r3)
/* 00004304 38000010 */ li r0, 0x10
/* 00004308 90030000 */ stw r0, 0(r3)
lbl_0000430C:
/* 0000430C 4BFFD65D */ bl lbl_00001968
/* 00004310 7C721B79 */ or. r18, r3, r3
/* 00004314 41820070 */ beq lbl_00004384
/* 00004318 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000431C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004320 3A030044 */ addi r16, r3, 0x44
/* 00004324 80030044 */ lwz r0, 0x44(r3)
/* 00004328 2C000000 */ cmpwi r0, 0
/* 0000432C 4082011C */ bne lbl_00004448
/* 00004330 38610060 */ addi r3, r1, 0x60
/* 00004334 38800000 */ li r4, 0
/* 00004338 38A00028 */ li r5, 0x28
/* 0000433C 4BFFBE4D */ bl memset
/* 00004340 38000140 */ li r0, 0x140
/* 00004344 B001006C */ sth r0, 0x6c(r1)
/* 00004348 38000118 */ li r0, 0x118
/* 0000434C 39E00001 */ li r15, 1
/* 00004350 B001006E */ sth r0, 0x6e(r1)
/* 00004354 3800000E */ li r0, 0xe
/* 00004358 38A10060 */ addi r5, r1, 0x60
/* 0000435C 99E10075 */ stb r15, 0x75(r1)
/* 00004360 38600001 */ li r3, 1
/* 00004364 38800001 */ li r4, 1
/* 00004368 98010076 */ stb r0, 0x76(r1)
/* 0000436C 4BFFBE1D */ bl textbox_set_properties
/* 00004370 38600001 */ li r3, 1
/* 00004374 389E0150 */ addi r4, r30, 0x150
/* 00004378 4BFFBE11 */ bl textbox_add_text
/* 0000437C 91F00000 */ stw r15, 0(r16)
/* 00004380 480000C8 */ b lbl_00004448
lbl_00004384:
/* 00004384 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004388 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000438C 3A230044 */ addi r17, r3, 0x44
/* 00004390 80030044 */ lwz r0, 0x44(r3)
/* 00004394 3C600000 */ lis r3, modeCtrl@ha
/* 00004398 38630000 */ addi r3, r3, modeCtrl@l
/* 0000439C 3A030024 */ addi r16, r3, 0x24
/* 000043A0 2C000000 */ cmpwi r0, 0
/* 000043A4 81E30024 */ lwz r15, 0x24(r3)
/* 000043A8 4182001C */ beq lbl_000043C4
/* 000043AC 38600001 */ li r3, 1
/* 000043B0 38800014 */ li r4, 0x14
/* 000043B4 38A00000 */ li r5, 0
/* 000043B8 4BFFBDD1 */ bl textbox_set_properties
/* 000043BC 38000000 */ li r0, 0
/* 000043C0 90110000 */ stw r0, 0(r17)
lbl_000043C4:
/* 000043C4 38600000 */ li r3, 0
/* 000043C8 4BFFC20D */ bl lbl_000005D4
/* 000043CC 2C030000 */ cmpwi r3, 0
/* 000043D0 4182002C */ beq lbl_000043FC
/* 000043D4 80900000 */ lwz r4, 0(r16)
/* 000043D8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000043DC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000043E0 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 000043E4 90900000 */ stw r4, 0(r16)
/* 000043E8 80030040 */ lwz r0, 0x40(r3)
/* 000043EC 7C040000 */ cmpw r4, r0
/* 000043F0 4080000C */ bge lbl_000043FC
/* 000043F4 8003003C */ lwz r0, 0x3c(r3)
/* 000043F8 90100000 */ stw r0, 0(r16)
lbl_000043FC:
/* 000043FC 38600001 */ li r3, 1
/* 00004400 4BFFC1D5 */ bl lbl_000005D4
/* 00004404 2C030000 */ cmpwi r3, 0
/* 00004408 4182002C */ beq lbl_00004434
/* 0000440C 80900000 */ lwz r4, 0(r16)
/* 00004410 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004414 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004418 38840001 */ addi r4, r4, 1
/* 0000441C 90900000 */ stw r4, 0(r16)
/* 00004420 8003003C */ lwz r0, 0x3c(r3)
/* 00004424 7C040000 */ cmpw r4, r0
/* 00004428 4081000C */ ble lbl_00004434
/* 0000442C 80030040 */ lwz r0, 0x40(r3)
/* 00004430 90100000 */ stw r0, 0(r16)
lbl_00004434:
/* 00004434 80100000 */ lwz r0, 0(r16)
/* 00004438 7C0F0000 */ cmpw r15, r0
/* 0000443C 4182000C */ beq lbl_00004448
/* 00004440 3860006C */ li r3, 0x6c
/* 00004444 4BFFBD45 */ bl u_play_sound_0
lbl_00004448:
/* 00004448 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000444C 3A030000 */ addi r16, r3, lbl_801EEDA8@l
/* 00004450 3C600000 */ lis r3, modeCtrl@ha
/* 00004454 3A300004 */ addi r17, r16, 4
/* 00004458 39E30000 */ addi r15, r3, modeCtrl@l
/* 0000445C 3A600001 */ li r19, 1
lbl_00004460:
/* 00004460 80100040 */ lwz r0, 0x40(r16)
/* 00004464 2C000002 */ cmpwi r0, 2
/* 00004468 4082000C */ bne lbl_00004474
/* 0000446C 2C130001 */ cmpwi r19, 1
/* 00004470 41820088 */ beq lbl_000044F8
lbl_00004474:
/* 00004474 800F0028 */ lwz r0, 0x28(r15)
/* 00004478 2C000006 */ cmpwi r0, 6
/* 0000447C 4082000C */ bne lbl_00004488
/* 00004480 2C130002 */ cmpwi r19, 2
/* 00004484 41810074 */ bgt lbl_000044F8
lbl_00004488:
/* 00004488 38730034 */ addi r3, r19, 0x34
/* 0000448C 4BFFBCFD */ bl find_sprite_with_tag
/* 00004490 28030000 */ cmplwi r3, 0
/* 00004494 41820064 */ beq lbl_000044F8
/* 00004498 8010003C */ lwz r0, 0x3c(r16)
/* 0000449C 7C130000 */ cmpw r19, r0
/* 000044A0 4181000C */ bgt lbl_000044AC
/* 000044A4 2C120000 */ cmpwi r18, 0
/* 000044A8 41820018 */ beq lbl_000044C0
lbl_000044AC:
/* 000044AC 38000005 */ li r0, 5
/* 000044B0 90030048 */ stw r0, 0x48(r3)
/* 000044B4 38130034 */ addi r0, r19, 0x34
/* 000044B8 9011006C */ stw r0, 0x6c(r17)
/* 000044BC 4800003C */ b lbl_000044F8
lbl_000044C0:
/* 000044C0 800F0024 */ lwz r0, 0x24(r15)
/* 000044C4 7C130000 */ cmpw r19, r0
/* 000044C8 40820020 */ bne lbl_000044E8
/* 000044CC 38000001 */ li r0, 1
/* 000044D0 90030048 */ stw r0, 0x48(r3)
/* 000044D4 38730034 */ addi r3, r19, 0x34
/* 000044D8 3800FFFF */ li r0, -1
/* 000044DC 90700068 */ stw r3, 0x68(r16)
/* 000044E0 9011006C */ stw r0, 0x6c(r17)
/* 000044E4 48000014 */ b lbl_000044F8
lbl_000044E8:
/* 000044E8 38000000 */ li r0, 0
/* 000044EC 90030048 */ stw r0, 0x48(r3)
/* 000044F0 38130034 */ addi r0, r19, 0x34
/* 000044F4 9011006C */ stw r0, 0x6c(r17)
lbl_000044F8:
/* 000044F8 3A730001 */ addi r19, r19, 1
/* 000044FC 2C130005 */ cmpwi r19, 5
/* 00004500 3A310004 */ addi r17, r17, 4
/* 00004504 4180FF5C */ blt lbl_00004460
/* 00004508 3C600000 */ lis r3, modeCtrl@ha
/* 0000450C 38630000 */ addi r3, r3, modeCtrl@l
/* 00004510 3A030028 */ addi r16, r3, 0x28
/* 00004514 80030028 */ lwz r0, 0x28(r3)
/* 00004518 2C000000 */ cmpwi r0, 0
/* 0000451C 40820048 */ bne lbl_00004564
/* 00004520 80030024 */ lwz r0, 0x24(r3)
/* 00004524 2C000001 */ cmpwi r0, 1
/* 00004528 40820020 */ bne lbl_00004548
/* 0000452C 38600017 */ li r3, 0x17
/* 00004530 4BFFBC59 */ bl find_sprite_with_tag
/* 00004534 28030000 */ cmplwi r3, 0
/* 00004538 41820074 */ beq lbl_000045AC
/* 0000453C 3800000B */ li r0, 0xb
/* 00004540 90030048 */ stw r0, 0x48(r3)
/* 00004544 48000068 */ b lbl_000045AC
lbl_00004548:
/* 00004548 38600017 */ li r3, 0x17
/* 0000454C 4BFFBC3D */ bl find_sprite_with_tag
/* 00004550 28030000 */ cmplwi r3, 0
/* 00004554 41820058 */ beq lbl_000045AC
/* 00004558 3800000C */ li r0, 0xc
/* 0000455C 90030048 */ stw r0, 0x48(r3)
/* 00004560 4800004C */ b lbl_000045AC
lbl_00004564:
/* 00004564 2C000006 */ cmpwi r0, 6
/* 00004568 40820044 */ bne lbl_000045AC
/* 0000456C 80030024 */ lwz r0, 0x24(r3)
/* 00004570 2C000001 */ cmpwi r0, 1
/* 00004574 40820020 */ bne lbl_00004594
/* 00004578 38600017 */ li r3, 0x17
/* 0000457C 4BFFBC0D */ bl find_sprite_with_tag
/* 00004580 28030000 */ cmplwi r3, 0
/* 00004584 41820028 */ beq lbl_000045AC
/* 00004588 3800003E */ li r0, 0x3e
/* 0000458C 90030048 */ stw r0, 0x48(r3)
/* 00004590 4800001C */ b lbl_000045AC
lbl_00004594:
/* 00004594 38600017 */ li r3, 0x17
/* 00004598 4BFFBBF1 */ bl find_sprite_with_tag
/* 0000459C 28030000 */ cmplwi r3, 0
/* 000045A0 4182000C */ beq lbl_000045AC
/* 000045A4 3800003F */ li r0, 0x3f
/* 000045A8 90030048 */ stw r0, 0x48(r3)
lbl_000045AC:
/* 000045AC 38600007 */ li r3, 7
/* 000045B0 4BFFC025 */ bl lbl_000005D4
/* 000045B4 2C030000 */ cmpwi r3, 0
/* 000045B8 41820068 */ beq lbl_00004620
/* 000045BC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000045C0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000045C4 38000001 */ li r0, 1
/* 000045C8 90030008 */ stw r0, 8(r3)
/* 000045CC 80100000 */ lwz r0, 0(r16)
/* 000045D0 2C000006 */ cmpwi r0, 6
/* 000045D4 40800018 */ bge lbl_000045EC
/* 000045D8 2C000004 */ cmpwi r0, 4
/* 000045DC 40800008 */ bge lbl_000045E4
/* 000045E0 4800000C */ b lbl_000045EC
lbl_000045E4:
/* 000045E4 38600063 */ li r3, 0x63
/* 000045E8 4BFFBBA1 */ bl destroy_sprite_with_tag
lbl_000045EC:
/* 000045EC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000045F0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000045F4 39E30044 */ addi r15, r3, 0x44
/* 000045F8 80030044 */ lwz r0, 0x44(r3)
/* 000045FC 2C000000 */ cmpwi r0, 0
/* 00004600 41825254 */ beq lbl_00009854
/* 00004604 38600001 */ li r3, 1
/* 00004608 38800014 */ li r4, 0x14
/* 0000460C 38A00000 */ li r5, 0
/* 00004610 4BFFBB79 */ bl textbox_set_properties
/* 00004614 38000000 */ li r0, 0
/* 00004618 900F0000 */ stw r0, 0(r15)
/* 0000461C 48005238 */ b lbl_00009854
lbl_00004620:
/* 00004620 38600006 */ li r3, 6
/* 00004624 4BFFBFB1 */ bl lbl_000005D4
/* 00004628 2C030000 */ cmpwi r3, 0
/* 0000462C 41825228 */ beq lbl_00009854
/* 00004630 2C120000 */ cmpwi r18, 0
/* 00004634 41820008 */ beq lbl_0000463C
/* 00004638 4800521C */ b lbl_00009854
lbl_0000463C:
/* 0000463C 3C600000 */ lis r3, modeCtrl@ha
/* 00004640 38630000 */ addi r3, r3, modeCtrl@l
/* 00004644 80A30024 */ lwz r5, 0x24(r3)
/* 00004648 3C600000 */ lis r3, lbl_802F1C10@ha
/* 0000464C 38630000 */ addi r3, r3, lbl_802F1C10@l
/* 00004650 7CA00774 */ extsb r0, r5
/* 00004654 98030002 */ stb r0, 2(r3)
/* 00004658 38800000 */ li r4, 0
/* 0000465C 881B000A */ lbz r0, 0xa(r27)
/* 00004660 7C000775 */ extsb. r0, r0
/* 00004664 40820008 */ bne lbl_0000466C
/* 00004668 38800001 */ li r4, 1
lbl_0000466C:
/* 0000466C 387B003C */ addi r3, r27, 0x3c
/* 00004670 881B0046 */ lbz r0, 0x46(r27)
/* 00004674 7C000775 */ extsb. r0, r0
/* 00004678 40820008 */ bne lbl_00004680
/* 0000467C 38840001 */ addi r4, r4, 1
lbl_00004680:
/* 00004680 88030046 */ lbz r0, 0x46(r3)
/* 00004684 3863003C */ addi r3, r3, 0x3c
/* 00004688 7C000775 */ extsb. r0, r0
/* 0000468C 40820008 */ bne lbl_00004694
/* 00004690 38840001 */ addi r4, r4, 1
lbl_00004694:
/* 00004694 88030046 */ lbz r0, 0x46(r3)
/* 00004698 7C000775 */ extsb. r0, r0
/* 0000469C 40820008 */ bne lbl_000046A4
/* 000046A0 38840001 */ addi r4, r4, 1
lbl_000046A4:
/* 000046A4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000046A8 7C800774 */ extsb r0, r4
/* 000046AC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000046B0 98030114 */ stb r0, 0x114(r3)
/* 000046B4 80100000 */ lwz r0, 0(r16)
/* 000046B8 2C000005 */ cmpwi r0, 5
/* 000046BC 40800010 */ bge lbl_000046CC
/* 000046C0 2C000000 */ cmpwi r0, 0
/* 000046C4 41820090 */ beq lbl_00004754
/* 000046C8 48000010 */ b lbl_000046D8
lbl_000046CC:
/* 000046CC 2C000009 */ cmpwi r0, 9
/* 000046D0 40800008 */ bge lbl_000046D8
/* 000046D4 48000080 */ b lbl_00004754
lbl_000046D8:
/* 000046D8 881B000A */ lbz r0, 0xa(r27)
/* 000046DC 38600000 */ li r3, 0
/* 000046E0 7C000775 */ extsb. r0, r0
/* 000046E4 40820008 */ bne lbl_000046EC
/* 000046E8 38600001 */ li r3, 1
lbl_000046EC:
/* 000046EC 389B003C */ addi r4, r27, 0x3c
/* 000046F0 881B0046 */ lbz r0, 0x46(r27)
/* 000046F4 7C000775 */ extsb. r0, r0
/* 000046F8 40820008 */ bne lbl_00004700
/* 000046FC 38630001 */ addi r3, r3, 1
lbl_00004700:
/* 00004700 88040046 */ lbz r0, 0x46(r4)
/* 00004704 3884003C */ addi r4, r4, 0x3c
/* 00004708 7C000775 */ extsb. r0, r0
/* 0000470C 40820008 */ bne lbl_00004714
/* 00004710 38630001 */ addi r3, r3, 1
lbl_00004714:
/* 00004714 88040046 */ lbz r0, 0x46(r4)
/* 00004718 7C000775 */ extsb. r0, r0
/* 0000471C 40820008 */ bne lbl_00004724
/* 00004720 38630001 */ addi r3, r3, 1
lbl_00004724:
/* 00004724 7C051800 */ cmpw r5, r3
/* 00004728 40800018 */ bge lbl_00004740
/* 0000472C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004730 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004734 38000011 */ li r0, 0x11
/* 00004738 90030004 */ stw r0, 4(r3)
/* 0000473C 48005118 */ b lbl_00009854
lbl_00004740:
/* 00004740 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004744 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004748 38000013 */ li r0, 0x13
/* 0000474C 90030004 */ stw r0, 4(r3)
/* 00004750 48005104 */ b lbl_00009854
lbl_00004754:
/* 00004754 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004758 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000475C 38000011 */ li r0, 0x11
/* 00004760 90030004 */ stw r0, 4(r3)
/* 00004764 480050F0 */ b lbl_00009854
lbl_00004768:
/* 00004768 3C600000 */ lis r3, currStageId@ha
/* 0000476C A8030000 */ lha r0, currStageId@l(r3)
/* 00004770 38600066 */ li r3, 0x66
/* 00004774 901F003C */ stw r0, 0x3c(r31)
/* 00004778 4BFFBA11 */ bl destroy_sprite_with_tag
/* 0000477C 3C600000 */ lis r3, modeCtrl@ha
/* 00004780 38630000 */ addi r3, r3, modeCtrl@l
/* 00004784 80030028 */ lwz r0, 0x28(r3)
/* 00004788 38800000 */ li r4, 0
/* 0000478C 38A40000 */ addi r5, r4, 0
/* 00004790 2C000006 */ cmpwi r0, 6
/* 00004794 4082001C */ bne lbl_000047B0
/* 00004798 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 0000479C 38630000 */ addi r3, r3, lbl_802F1BF4@l
/* 000047A0 80030004 */ lwz r0, 4(r3)
/* 000047A4 2C000000 */ cmpwi r0, 0
/* 000047A8 40820008 */ bne lbl_000047B0
/* 000047AC 38A00001 */ li r5, 1
lbl_000047B0:
/* 000047B0 2C050000 */ cmpwi r5, 0
/* 000047B4 4182001C */ beq lbl_000047D0
/* 000047B8 3C600000 */ lis r3, modeCtrl@ha
/* 000047BC 38630000 */ addi r3, r3, modeCtrl@l
/* 000047C0 80030024 */ lwz r0, 0x24(r3)
/* 000047C4 2C000001 */ cmpwi r0, 1
/* 000047C8 40820008 */ bne lbl_000047D0
/* 000047CC 38800001 */ li r4, 1
lbl_000047D0:
/* 000047D0 2C040000 */ cmpwi r4, 0
/* 000047D4 4182000C */ beq lbl_000047E0
/* 000047D8 38800002 */ li r4, 2
/* 000047DC 48000010 */ b lbl_000047EC
lbl_000047E0:
/* 000047E0 3C600000 */ lis r3, modeCtrl@ha
/* 000047E4 38630000 */ addi r3, r3, modeCtrl@l
/* 000047E8 80830024 */ lwz r4, 0x24(r3)
lbl_000047EC:
/* 000047EC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000047F0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000047F4 5480103A */ slwi r0, r4, 2
/* 000047F8 7C630214 */ add r3, r3, r0
/* 000047FC 38000000 */ li r0, 0
/* 00004800 90030044 */ stw r0, 0x44(r3)
/* 00004804 3B440000 */ addi r26, r4, 0
/* 00004808 38600016 */ li r3, 0x16
/* 0000480C 4BFFB97D */ bl find_sprite_with_tag
/* 00004810 28030000 */ cmplwi r3, 0
/* 00004814 4182000C */ beq lbl_00004820
/* 00004818 38000002 */ li r0, 2
/* 0000481C 90030048 */ stw r0, 0x48(r3)
lbl_00004820:
/* 00004820 4800B5ED */ bl lbl_0000FE0C
/* 00004824 38600000 */ li r3, 0
/* 00004828 4BFFB961 */ bl light_init
/* 0000482C 38600034 */ li r3, 0x34
/* 00004830 4BFFB959 */ bl camera_set_state
/* 00004834 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004838 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 0000483C 38000001 */ li r0, 1
/* 00004840 900400BC */ stw r0, 0xbc(r4)
/* 00004844 3860000F */ li r3, 0xf
/* 00004848 38000012 */ li r0, 0x12
/* 0000484C 90790000 */ stw r3, 0(r25)
/* 00004850 90040000 */ stw r0, 0(r4)
lbl_00004854:
/* 00004854 4BFFD2E5 */ bl lbl_00001B38
/* 00004858 2C030000 */ cmpwi r3, 0
/* 0000485C 40820470 */ bne lbl_00004CCC
/* 00004860 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004864 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004868 38800000 */ li r4, 0
/* 0000486C 3AE30110 */ addi r23, r3, 0x110
/* 00004870 3C600000 */ lis r3, modeCtrl@ha
/* 00004874 90970000 */ stw r4, 0(r23)
/* 00004878 38630000 */ addi r3, r3, modeCtrl@l
/* 0000487C 80030028 */ lwz r0, 0x28(r3)
/* 00004880 3B030028 */ addi r24, r3, 0x28
/* 00004884 38A40000 */ addi r5, r4, 0
/* 00004888 2C000006 */ cmpwi r0, 6
/* 0000488C 4082001C */ bne lbl_000048A8
/* 00004890 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 00004894 38630000 */ addi r3, r3, lbl_802F1BF4@l
/* 00004898 80030004 */ lwz r0, 4(r3)
/* 0000489C 2C000000 */ cmpwi r0, 0
/* 000048A0 40820008 */ bne lbl_000048A8
/* 000048A4 38A00001 */ li r5, 1
lbl_000048A8:
/* 000048A8 2C050000 */ cmpwi r5, 0
/* 000048AC 4182001C */ beq lbl_000048C8
/* 000048B0 3C600000 */ lis r3, modeCtrl@ha
/* 000048B4 38630000 */ addi r3, r3, modeCtrl@l
/* 000048B8 80030024 */ lwz r0, 0x24(r3)
/* 000048BC 2C000001 */ cmpwi r0, 1
/* 000048C0 40820008 */ bne lbl_000048C8
/* 000048C4 38800001 */ li r4, 1
lbl_000048C8:
/* 000048C8 2C040000 */ cmpwi r4, 0
/* 000048CC 4182000C */ beq lbl_000048D8
/* 000048D0 3B400002 */ li r26, 2
/* 000048D4 48000010 */ b lbl_000048E4
lbl_000048D8:
/* 000048D8 3C600000 */ lis r3, modeCtrl@ha
/* 000048DC 38630000 */ addi r3, r3, modeCtrl@l
/* 000048E0 83430024 */ lwz r26, 0x24(r3)
lbl_000048E4:
/* 000048E4 80180000 */ lwz r0, 0(r24)
/* 000048E8 2C000002 */ cmpwi r0, 2
/* 000048EC 41820084 */ beq lbl_00004970
/* 000048F0 40800010 */ bge lbl_00004900
/* 000048F4 2C000001 */ cmpwi r0, 1
/* 000048F8 40800010 */ bge lbl_00004908
/* 000048FC 48000074 */ b lbl_00004970
lbl_00004900:
/* 00004900 2C000005 */ cmpwi r0, 5
/* 00004904 4080006C */ bge lbl_00004970
lbl_00004908:
/* 00004908 881B000A */ lbz r0, 0xa(r27)
/* 0000490C 38800000 */ li r4, 0
/* 00004910 7C000775 */ extsb. r0, r0
/* 00004914 40820008 */ bne lbl_0000491C
/* 00004918 38800001 */ li r4, 1
lbl_0000491C:
/* 0000491C 387B003C */ addi r3, r27, 0x3c
/* 00004920 881B0046 */ lbz r0, 0x46(r27)
/* 00004924 7C000775 */ extsb. r0, r0
/* 00004928 40820008 */ bne lbl_00004930
/* 0000492C 38840001 */ addi r4, r4, 1
lbl_00004930:
/* 00004930 88030046 */ lbz r0, 0x46(r3)
/* 00004934 3863003C */ addi r3, r3, 0x3c
/* 00004938 7C000775 */ extsb. r0, r0
/* 0000493C 40820008 */ bne lbl_00004944
/* 00004940 38840001 */ addi r4, r4, 1
lbl_00004944:
/* 00004944 88030046 */ lbz r0, 0x46(r3)
/* 00004948 7C000775 */ extsb. r0, r0
/* 0000494C 40820008 */ bne lbl_00004954
/* 00004950 38840001 */ addi r4, r4, 1
lbl_00004954:
/* 00004954 3C600000 */ lis r3, modeCtrl@ha
/* 00004958 38630000 */ addi r3, r3, modeCtrl@l
/* 0000495C 80030024 */ lwz r0, 0x24(r3)
/* 00004960 7C002000 */ cmpw r0, r4
/* 00004964 4080000C */ bge lbl_00004970
/* 00004968 38000001 */ li r0, 1
/* 0000496C 90170000 */ stw r0, 0(r23)
lbl_00004970:
/* 00004970 2C1A0000 */ cmpwi r26, 0
/* 00004974 7F4903A6 */ mtctr r26
/* 00004978 387C0000 */ addi r3, r28, 0
/* 0000497C 39000000 */ li r8, 0
/* 00004980 38800000 */ li r4, 0
/* 00004984 4081001C */ ble lbl_000049A0
lbl_00004988:
/* 00004988 80030048 */ lwz r0, 0x48(r3)
/* 0000498C 2C000000 */ cmpwi r0, 0
/* 00004990 41820008 */ beq lbl_00004998
/* 00004994 38840001 */ addi r4, r4, 1
lbl_00004998:
/* 00004998 38630004 */ addi r3, r3, 4
/* 0000499C 4200FFEC */ bdnz lbl_00004988
lbl_000049A0:
/* 000049A0 2C040000 */ cmpwi r4, 0
/* 000049A4 40810090 */ ble lbl_00004A34
/* 000049A8 38A4FFFF */ addi r5, r4, -1  ;# fixed addi
/* 000049AC 3C800000 */ lis r4, lbl_80206BD0@ha
/* 000049B0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000049B4 38000004 */ li r0, 4
/* 000049B8 54A6103A */ slwi r6, r5, 2
/* 000049BC 7C0903A6 */ mtctr r0
/* 000049C0 38840000 */ addi r4, r4, lbl_80206BD0@l
/* 000049C4 38030000 */ addi r0, r3, lbl_801EEDA8@l
/* 000049C8 7C843214 */ add r4, r4, r6
/* 000049CC 7C603214 */ add r3, r0, r6
/* 000049D0 80840000 */ lwz r4, 0(r4)
/* 000049D4 80A30048 */ lwz r5, 0x48(r3)
/* 000049D8 387B0000 */ addi r3, r27, 0
/* 000049DC 38E00000 */ li r7, 0
lbl_000049E0:
/* 000049E0 7C072000 */ cmpw r7, r4
/* 000049E4 4082003C */ bne lbl_00004A20
/* 000049E8 A0030018 */ lhz r0, 0x18(r3)
/* 000049EC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000049F0 41820030 */ beq lbl_00004A20
/* 000049F4 2C050000 */ cmpwi r5, 0
/* 000049F8 41820028 */ beq lbl_00004A20
/* 000049FC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004A00 38030000 */ addi r0, r3, lbl_801EEDA8@l
/* 00004A04 7C603214 */ add r3, r0, r6
/* 00004A08 38000000 */ li r0, 0
/* 00004A0C 90030048 */ stw r0, 0x48(r3)
/* 00004A10 38600066 */ li r3, 0x66
/* 00004A14 4BFFB775 */ bl u_play_sound_0
/* 00004A18 39000001 */ li r8, 1
/* 00004A1C 48000010 */ b lbl_00004A2C
lbl_00004A20:
/* 00004A20 3863003C */ addi r3, r3, 0x3c
/* 00004A24 38E70001 */ addi r7, r7, 1
/* 00004A28 4200FFB8 */ bdnz lbl_000049E0
lbl_00004A2C:
/* 00004A2C 2C080000 */ cmpwi r8, 0
/* 00004A30 40824E24 */ bne lbl_00009854
lbl_00004A34:
/* 00004A34 3C600000 */ lis r3, playerCharacterSelection@ha
/* 00004A38 3BC30000 */ addi r30, r3, playerCharacterSelection@l
/* 00004A3C 3AC00000 */ li r22, 0
/* 00004A40 3C800000 */ lis r4, lbl_802F1BF4@ha
/* 00004A44 3C600000 */ lis r3, modeCtrl@ha
/* 00004A48 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00004A4C 3AB60000 */ addi r21, r22, 0
/* 00004A50 3BBC0000 */ addi r29, r28, 0
/* 00004A54 3A640000 */ addi r19, r4, lbl_802F1BF4@l
/* 00004A58 3A830000 */ addi r20, r3, modeCtrl@l
/* 00004A5C 3A450000 */ addi r18, r5, analogButtonInfo@l
/* 00004A60 480001C4 */ b lbl_00004C24
lbl_00004A64:
/* 00004A64 801D0048 */ lwz r0, 0x48(r29)
/* 00004A68 2C000000 */ cmpwi r0, 0
/* 00004A6C 408201AC */ bne lbl_00004C18
/* 00004A70 3A3B0000 */ addi r17, r27, 0
/* 00004A74 3A120000 */ addi r16, r18, 0
/* 00004A78 39E00000 */ li r15, 0
lbl_00004A7C:
/* 00004A7C 8811000A */ lbz r0, 0xa(r17)
/* 00004A80 7C000775 */ extsb. r0, r0
/* 00004A84 40820104 */ bne lbl_00004B88
/* 00004A88 80170000 */ lwz r0, 0(r23)
/* 00004A8C 2C000000 */ cmpwi r0, 0
/* 00004A90 41820018 */ beq lbl_00004AA8
/* 00004A94 38600000 */ li r3, 0
/* 00004A98 388F0000 */ addi r4, r15, 0
/* 00004A9C 4BFFD8BD */ bl lbl_00002358
/* 00004AA0 2C030000 */ cmpwi r3, 0
/* 00004AA4 408200E4 */ bne lbl_00004B88
lbl_00004AA8:
/* 00004AA8 A0110030 */ lhz r0, 0x30(r17)
/* 00004AAC 540007FF */ clrlwi. r0, r0, 0x1f
/* 00004AB0 40820010 */ bne lbl_00004AC0
/* 00004AB4 A0100008 */ lhz r0, 8(r16)
/* 00004AB8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00004ABC 41820040 */ beq lbl_00004AFC
lbl_00004AC0:
/* 00004AC0 801D0048 */ lwz r0, 0x48(r29)
/* 00004AC4 2C000000 */ cmpwi r0, 0
/* 00004AC8 40820034 */ bne lbl_00004AFC
/* 00004ACC 801F0008 */ lwz r0, 8(r31)
/* 00004AD0 2C000000 */ cmpwi r0, 0
/* 00004AD4 40820028 */ bne lbl_00004AFC
/* 00004AD8 807E0000 */ lwz r3, 0(r30)
/* 00004ADC 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00004AE0 901E0000 */ stw r0, 0(r30)
/* 00004AE4 4080000C */ bge lbl_00004AF0
/* 00004AE8 38000003 */ li r0, 3
/* 00004AEC 901E0000 */ stw r0, 0(r30)
lbl_00004AF0:
/* 00004AF0 3860006C */ li r3, 0x6c
/* 00004AF4 4BFFB695 */ bl u_play_sound_0
/* 00004AF8 3AC00001 */ li r22, 1
lbl_00004AFC:
/* 00004AFC A0110030 */ lhz r0, 0x30(r17)
/* 00004B00 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00004B04 40820010 */ bne lbl_00004B14
/* 00004B08 A0100008 */ lhz r0, 8(r16)
/* 00004B0C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00004B10 41820044 */ beq lbl_00004B54
lbl_00004B14:
/* 00004B14 801D0048 */ lwz r0, 0x48(r29)
/* 00004B18 2C000000 */ cmpwi r0, 0
/* 00004B1C 40820038 */ bne lbl_00004B54
/* 00004B20 801F0008 */ lwz r0, 8(r31)
/* 00004B24 2C000000 */ cmpwi r0, 0
/* 00004B28 4082002C */ bne lbl_00004B54
/* 00004B2C 807E0000 */ lwz r3, 0(r30)
/* 00004B30 38030001 */ addi r0, r3, 1
/* 00004B34 2C000003 */ cmpwi r0, 3
/* 00004B38 901E0000 */ stw r0, 0(r30)
/* 00004B3C 4081000C */ ble lbl_00004B48
/* 00004B40 38000000 */ li r0, 0
/* 00004B44 901E0000 */ stw r0, 0(r30)
lbl_00004B48:
/* 00004B48 3860006C */ li r3, 0x6c
/* 00004B4C 4BFFB63D */ bl u_play_sound_0
/* 00004B50 3AC00001 */ li r22, 1
lbl_00004B54:
/* 00004B54 80180000 */ lwz r0, 0(r24)
/* 00004B58 2C000006 */ cmpwi r0, 6
/* 00004B5C 4082002C */ bne lbl_00004B88
/* 00004B60 80130004 */ lwz r0, 4(r19)
/* 00004B64 2C000000 */ cmpwi r0, 0
/* 00004B68 40820020 */ bne lbl_00004B88
/* 00004B6C 80140024 */ lwz r0, 0x24(r20)
/* 00004B70 2C000001 */ cmpwi r0, 1
/* 00004B74 40820014 */ bne lbl_00004B88
/* 00004B78 2C160000 */ cmpwi r22, 0
/* 00004B7C 4182000C */ beq lbl_00004B88
/* 00004B80 38000002 */ li r0, 2
/* 00004B84 98130001 */ stb r0, 1(r19)
lbl_00004B88:
/* 00004B88 39EF0001 */ addi r15, r15, 1
/* 00004B8C 2C0F0004 */ cmpwi r15, 4
/* 00004B90 3A31003C */ addi r17, r17, 0x3c
/* 00004B94 3A10000A */ addi r16, r16, 0xa
/* 00004B98 4180FEE4 */ blt lbl_00004A7C
/* 00004B9C 3A200000 */ li r17, 0
/* 00004BA0 3A1B0000 */ addi r16, r27, 0
lbl_00004BA4:
/* 00004BA4 8810000A */ lbz r0, 0xa(r16)
/* 00004BA8 7C000775 */ extsb. r0, r0
/* 00004BAC 40820054 */ bne lbl_00004C00
/* 00004BB0 80170000 */ lwz r0, 0(r23)
/* 00004BB4 2C000000 */ cmpwi r0, 0
/* 00004BB8 41820018 */ beq lbl_00004BD0
/* 00004BBC 38600000 */ li r3, 0
/* 00004BC0 38910000 */ addi r4, r17, 0
/* 00004BC4 4BFFD795 */ bl lbl_00002358
/* 00004BC8 2C030000 */ cmpwi r3, 0
/* 00004BCC 40820034 */ bne lbl_00004C00
lbl_00004BD0:
/* 00004BD0 A0100018 */ lhz r0, 0x18(r16)
/* 00004BD4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00004BD8 41820028 */ beq lbl_00004C00
/* 00004BDC 801D0048 */ lwz r0, 0x48(r29)
/* 00004BE0 2C000000 */ cmpwi r0, 0
/* 00004BE4 4082001C */ bne lbl_00004C00
/* 00004BE8 38710000 */ addi r3, r17, 0
/* 00004BEC 38950000 */ addi r4, r21, 0
/* 00004BF0 38A00000 */ li r5, 0
/* 00004BF4 4BFFD891 */ bl lbl_00002484
/* 00004BF8 7C761B78 */ mr r22, r3
/* 00004BFC 48000014 */ b lbl_00004C10
lbl_00004C00:
/* 00004C00 3A310001 */ addi r17, r17, 1
/* 00004C04 2C110004 */ cmpwi r17, 4
/* 00004C08 3A10003C */ addi r16, r16, 0x3c
/* 00004C0C 4180FF98 */ blt lbl_00004BA4
lbl_00004C10:
/* 00004C10 2C160000 */ cmpwi r22, 0
/* 00004C14 40820018 */ bne lbl_00004C2C
lbl_00004C18:
/* 00004C18 3BBD0004 */ addi r29, r29, 4
/* 00004C1C 3BDE0004 */ addi r30, r30, 4
/* 00004C20 3AB50001 */ addi r21, r21, 1
lbl_00004C24:
/* 00004C24 7C15D000 */ cmpw r21, r26
/* 00004C28 4180FE3C */ blt lbl_00004A64
lbl_00004C2C:
/* 00004C2C 80980000 */ lwz r4, 0(r24)
/* 00004C30 2C040006 */ cmpwi r4, 6
/* 00004C34 4082005C */ bne lbl_00004C90
/* 00004C38 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 00004C3C 38630000 */ addi r3, r3, lbl_802F1BF4@l
/* 00004C40 80030004 */ lwz r0, 4(r3)
/* 00004C44 2C000000 */ cmpwi r0, 0
/* 00004C48 40820048 */ bne lbl_00004C90
/* 00004C4C 3C600000 */ lis r3, modeCtrl@ha
/* 00004C50 38630000 */ addi r3, r3, modeCtrl@l
/* 00004C54 80030024 */ lwz r0, 0x24(r3)
/* 00004C58 2C000001 */ cmpwi r0, 1
/* 00004C5C 40820034 */ bne lbl_00004C90
/* 00004C60 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004C64 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004C68 80030048 */ lwz r0, 0x48(r3)
/* 00004C6C 2C000000 */ cmpwi r0, 0
/* 00004C70 41820020 */ beq lbl_00004C90
/* 00004C74 38600017 */ li r3, 0x17
/* 00004C78 4BFFB511 */ bl find_sprite_with_tag
/* 00004C7C 28030000 */ cmplwi r3, 0
/* 00004C80 4182004C */ beq lbl_00004CCC
/* 00004C84 3800000E */ li r0, 0xe
/* 00004C88 90030048 */ stw r0, 0x48(r3)
/* 00004C8C 48000040 */ b lbl_00004CCC
lbl_00004C90:
/* 00004C90 2C040007 */ cmpwi r4, 7
/* 00004C94 40820020 */ bne lbl_00004CB4
/* 00004C98 38600017 */ li r3, 0x17
/* 00004C9C 4BFFB4ED */ bl find_sprite_with_tag
/* 00004CA0 28030000 */ cmplwi r3, 0
/* 00004CA4 41820028 */ beq lbl_00004CCC
/* 00004CA8 3800000F */ li r0, 0xf
/* 00004CAC 90030048 */ stw r0, 0x48(r3)
/* 00004CB0 4800001C */ b lbl_00004CCC
lbl_00004CB4:
/* 00004CB4 38600017 */ li r3, 0x17
/* 00004CB8 4BFFB4D1 */ bl find_sprite_with_tag
/* 00004CBC 28030000 */ cmplwi r3, 0
/* 00004CC0 4182000C */ beq lbl_00004CCC
/* 00004CC4 3800000D */ li r0, 0xd
/* 00004CC8 90030048 */ stw r0, 0x48(r3)
lbl_00004CCC:
/* 00004CCC 38600007 */ li r3, 7
/* 00004CD0 4BFFB905 */ bl lbl_000005D4
/* 00004CD4 2C030000 */ cmpwi r3, 0
/* 00004CD8 41820080 */ beq lbl_00004D58
/* 00004CDC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004CE0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004CE4 80030048 */ lwz r0, 0x48(r3)
/* 00004CE8 2C000000 */ cmpwi r0, 0
/* 00004CEC 4082006C */ bne lbl_00004D58
/* 00004CF0 38000001 */ li r0, 1
/* 00004CF4 90030008 */ stw r0, 8(r3)
/* 00004CF8 39E00000 */ li r15, 0
/* 00004CFC 3A030044 */ addi r16, r3, 0x44
/* 00004D00 91E30110 */ stw r15, 0x110(r3)
/* 00004D04 80030044 */ lwz r0, 0x44(r3)
/* 00004D08 2C000000 */ cmpwi r0, 0
/* 00004D0C 41820018 */ beq lbl_00004D24
/* 00004D10 38600001 */ li r3, 1
/* 00004D14 38800014 */ li r4, 0x14
/* 00004D18 38A00000 */ li r5, 0
/* 00004D1C 4BFFB46D */ bl textbox_set_properties
/* 00004D20 91F00000 */ stw r15, 0(r16)
lbl_00004D24:
/* 00004D24 3860001D */ li r3, 0x1d
/* 00004D28 4BFFB461 */ bl find_sprite_with_tag
/* 00004D2C 28030000 */ cmplwi r3, 0
/* 00004D30 4182000C */ beq lbl_00004D3C
/* 00004D34 38000001 */ li r0, 1
/* 00004D38 90030048 */ stw r0, 0x48(r3)
lbl_00004D3C:
/* 00004D3C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004D40 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004D44 38000002 */ li r0, 2
/* 00004D48 900300BC */ stw r0, 0xbc(r3)
/* 00004D4C 3800000F */ li r0, 0xf
/* 00004D50 90190000 */ stw r0, 0(r25)
/* 00004D54 48004B00 */ b lbl_00009854
lbl_00004D58:
/* 00004D58 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004D5C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004D60 80030044 */ lwz r0, 0x44(r3)
/* 00004D64 2C000000 */ cmpwi r0, 0
/* 00004D68 40824AEC */ bne lbl_00009854
/* 00004D6C 2C1A0000 */ cmpwi r26, 0
/* 00004D70 7F4903A6 */ mtctr r26
/* 00004D74 40810018 */ ble lbl_00004D8C
lbl_00004D78:
/* 00004D78 801C0048 */ lwz r0, 0x48(r28)
/* 00004D7C 2C000000 */ cmpwi r0, 0
/* 00004D80 41824AD4 */ beq lbl_00009854
/* 00004D84 3B9C0004 */ addi r28, r28, 4
/* 00004D88 4200FFF0 */ bdnz lbl_00004D78
lbl_00004D8C:
/* 00004D8C 3C600000 */ lis r3, modeCtrl@ha
/* 00004D90 38630000 */ addi r3, r3, modeCtrl@l
/* 00004D94 80030028 */ lwz r0, 0x28(r3)
/* 00004D98 28000008 */ cmplwi r0, 8
/* 00004D9C 41814AB8 */ bgt lbl_00009854
/* 00004DA0 3C600000 */ lis r3, lbl_00012620@ha
/* 00004DA4 38630000 */ addi r3, r3, lbl_00012620@l
/* 00004DA8 5400103A */ slwi r0, r0, 2
/* 00004DAC 7C03002E */ lwzx r0, r3, r0
/* 00004DB0 7C0903A6 */ mtctr r0
/* 00004DB4 4E800420 */ bctr 
lbl_00004DB8:
/* 00004DB8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004DBC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004DC0 38000015 */ li r0, 0x15
/* 00004DC4 90030004 */ stw r0, 4(r3)
/* 00004DC8 48004A8C */ b lbl_00009854
lbl_00004DCC:
/* 00004DCC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004DD0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004DD4 38000017 */ li r0, 0x17
/* 00004DD8 90030004 */ stw r0, 4(r3)
/* 00004DDC 48004A78 */ b lbl_00009854
lbl_00004DE0:
/* 00004DE0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004DE4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004DE8 38000017 */ li r0, 0x17
/* 00004DEC 90030004 */ stw r0, 4(r3)
/* 00004DF0 48004A64 */ b lbl_00009854
lbl_00004DF4:
/* 00004DF4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004DF8 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00004DFC 80040110 */ lwz r0, 0x110(r4)
/* 00004E00 2C000000 */ cmpwi r0, 0
/* 00004E04 41820030 */ beq lbl_00004E34
/* 00004E08 3C600000 */ lis r3, lbl_801EED88@ha
/* 00004E0C 38630000 */ addi r3, r3, lbl_801EED88@l
/* 00004E10 80030008 */ lwz r0, 8(r3)
/* 00004E14 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00004E18 41820010 */ beq lbl_00004E28
/* 00004E1C 38000020 */ li r0, 0x20
/* 00004E20 90040004 */ stw r0, 4(r4)
/* 00004E24 48004A30 */ b lbl_00009854
lbl_00004E28:
/* 00004E28 3800001E */ li r0, 0x1e
/* 00004E2C 90040004 */ stw r0, 4(r4)
/* 00004E30 48004A24 */ b lbl_00009854
lbl_00004E34:
/* 00004E34 3800001E */ li r0, 0x1e
/* 00004E38 90040004 */ stw r0, 4(r4)
/* 00004E3C 48004A18 */ b lbl_00009854
lbl_00004E40:
/* 00004E40 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004E44 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004E48 38000022 */ li r0, 0x22
/* 00004E4C 90030004 */ stw r0, 4(r3)
/* 00004E50 48004A04 */ b lbl_00009854
lbl_00004E54:
/* 00004E54 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004E58 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004E5C 38000031 */ li r0, 0x31
/* 00004E60 90030004 */ stw r0, 4(r3)
/* 00004E64 480049F0 */ b lbl_00009854
lbl_00004E68:
/* 00004E68 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004E6C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004E70 3800002B */ li r0, 0x2b
/* 00004E74 90030004 */ stw r0, 4(r3)
/* 00004E78 480049DC */ b lbl_00009854
lbl_00004E7C:
/* 00004E7C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004E80 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004E84 38000027 */ li r0, 0x27
/* 00004E88 90030004 */ stw r0, 4(r3)
/* 00004E8C 480049C8 */ b lbl_00009854
lbl_00004E90:
/* 00004E90 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004E94 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00004E98 38000033 */ li r0, 0x33
/* 00004E9C 90030004 */ stw r0, 4(r3)
/* 00004EA0 480049B4 */ b lbl_00009854
lbl_00004EA4:
/* 00004EA4 3C600000 */ lis r3, currStageId@ha
/* 00004EA8 A8030000 */ lha r0, currStageId@l(r3)
/* 00004EAC 38600066 */ li r3, 0x66
/* 00004EB0 901F003C */ stw r0, 0x3c(r31)
/* 00004EB4 4BFFB2D5 */ bl destroy_sprite_with_tag
/* 00004EB8 38000000 */ li r0, 0
/* 00004EBC 90120048 */ stw r0, 0x48(r18)
/* 00004EC0 38600016 */ li r3, 0x16
/* 00004EC4 9012004C */ stw r0, 0x4c(r18)
/* 00004EC8 90120050 */ stw r0, 0x50(r18)
/* 00004ECC 90120054 */ stw r0, 0x54(r18)
/* 00004ED0 4BFFB2B9 */ bl find_sprite_with_tag
/* 00004ED4 28030000 */ cmplwi r3, 0
/* 00004ED8 4182000C */ beq lbl_00004EE4
/* 00004EDC 38000002 */ li r0, 2
/* 00004EE0 90030048 */ stw r0, 0x48(r3)
lbl_00004EE4:
/* 00004EE4 4800AF29 */ bl lbl_0000FE0C
/* 00004EE8 38600000 */ li r3, 0
/* 00004EEC 4BFFB29D */ bl light_init
/* 00004EF0 38600034 */ li r3, 0x34
/* 00004EF4 4BFFB295 */ bl camera_set_state
/* 00004EF8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00004EFC 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00004F00 38000001 */ li r0, 1
/* 00004F04 900400BC */ stw r0, 0xbc(r4)
/* 00004F08 3860000F */ li r3, 0xf
/* 00004F0C 38000014 */ li r0, 0x14
/* 00004F10 90790000 */ stw r3, 0(r25)
/* 00004F14 90040000 */ stw r0, 0(r4)
lbl_00004F18:
/* 00004F18 4BFFCC21 */ bl lbl_00001B38
/* 00004F1C 7C751B79 */ or. r21, r3, r3
/* 00004F20 408201D0 */ bne lbl_000050F0
/* 00004F24 39E00000 */ li r15, 0
/* 00004F28 3C600000 */ lis r3, modeCtrl@ha
/* 00004F2C 3A4F0000 */ addi r18, r15, 0
/* 00004F30 3A6F0000 */ addi r19, r15, 0
/* 00004F34 3A1B0000 */ addi r16, r27, 0
/* 00004F38 3A3C0000 */ addi r17, r28, 0
/* 00004F3C 3A830000 */ addi r20, r3, modeCtrl@l
/* 00004F40 48000074 */ b lbl_00004FB4
lbl_00004F44:
/* 00004F44 8810000A */ lbz r0, 0xa(r16)
/* 00004F48 7C000775 */ extsb. r0, r0
/* 00004F4C 40820060 */ bne lbl_00004FAC
/* 00004F50 A0700018 */ lhz r3, 0x18(r16)
/* 00004F54 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00004F58 41820024 */ beq lbl_00004F7C
/* 00004F5C 80110048 */ lwz r0, 0x48(r17)
/* 00004F60 2C000000 */ cmpwi r0, 0
/* 00004F64 40820018 */ bne lbl_00004F7C
/* 00004F68 38720000 */ addi r3, r18, 0
/* 00004F6C 38930000 */ addi r4, r19, 0
/* 00004F70 38B30000 */ addi r5, r19, 0
/* 00004F74 4BFFD511 */ bl lbl_00002484
/* 00004F78 4800002C */ b lbl_00004FA4
lbl_00004F7C:
/* 00004F7C 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00004F80 41820024 */ beq lbl_00004FA4
/* 00004F84 80110048 */ lwz r0, 0x48(r17)
/* 00004F88 2C000000 */ cmpwi r0, 0
/* 00004F8C 41820018 */ beq lbl_00004FA4
/* 00004F90 38000000 */ li r0, 0
/* 00004F94 90110048 */ stw r0, 0x48(r17)
/* 00004F98 38600066 */ li r3, 0x66
/* 00004F9C 4BFFB1ED */ bl u_play_sound_0
/* 00004FA0 39E00001 */ li r15, 1
lbl_00004FA4:
/* 00004FA4 3A310004 */ addi r17, r17, 4
/* 00004FA8 3A730001 */ addi r19, r19, 1
lbl_00004FAC:
/* 00004FAC 3A10003C */ addi r16, r16, 0x3c
/* 00004FB0 3A520001 */ addi r18, r18, 1
lbl_00004FB4:
/* 00004FB4 2C120004 */ cmpwi r18, 4
/* 00004FB8 40800010 */ bge lbl_00004FC8
/* 00004FBC 80140024 */ lwz r0, 0x24(r20)
/* 00004FC0 7C130000 */ cmpw r19, r0
/* 00004FC4 4180FF80 */ blt lbl_00004F44
lbl_00004FC8:
/* 00004FC8 2C0F0000 */ cmpwi r15, 0
/* 00004FCC 40824888 */ bne lbl_00009854
/* 00004FD0 3C600000 */ lis r3, playerCharacterSelection@ha
/* 00004FD4 3C800000 */ lis r4, analogButtonInfo@ha
/* 00004FD8 3A430000 */ addi r18, r3, playerCharacterSelection@l
/* 00004FDC 3A600000 */ li r19, 0
/* 00004FE0 3C600000 */ lis r3, modeCtrl@ha
/* 00004FE4 3A040000 */ addi r16, r4, analogButtonInfo@l
/* 00004FE8 39F30000 */ addi r15, r19, 0
/* 00004FEC 3A3C0000 */ addi r17, r28, 0
/* 00004FF0 3A830000 */ addi r20, r3, modeCtrl@l
/* 00004FF4 480000D0 */ b lbl_000050C4
lbl_00004FF8:
/* 00004FF8 881B000A */ lbz r0, 0xa(r27)
/* 00004FFC 7C000775 */ extsb. r0, r0
/* 00005000 408200B4 */ bne lbl_000050B4
/* 00005004 A01B0030 */ lhz r0, 0x30(r27)
/* 00005008 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000500C 40820010 */ bne lbl_0000501C
/* 00005010 A0100008 */ lhz r0, 8(r16)
/* 00005014 540007FF */ clrlwi. r0, r0, 0x1f
/* 00005018 4182003C */ beq lbl_00005054
lbl_0000501C:
/* 0000501C 80110048 */ lwz r0, 0x48(r17)
/* 00005020 2C000000 */ cmpwi r0, 0
/* 00005024 40820030 */ bne lbl_00005054
/* 00005028 80170000 */ lwz r0, 0(r23)
/* 0000502C 2C000000 */ cmpwi r0, 0
/* 00005030 40820024 */ bne lbl_00005054
/* 00005034 80720000 */ lwz r3, 0(r18)
/* 00005038 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000503C 90120000 */ stw r0, 0(r18)
/* 00005040 4080000C */ bge lbl_0000504C
/* 00005044 38000003 */ li r0, 3
/* 00005048 90120000 */ stw r0, 0(r18)
lbl_0000504C:
/* 0000504C 3860006C */ li r3, 0x6c
/* 00005050 4BFFB139 */ bl u_play_sound_0
lbl_00005054:
/* 00005054 A01B0030 */ lhz r0, 0x30(r27)
/* 00005058 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000505C 40820010 */ bne lbl_0000506C
/* 00005060 A0100008 */ lhz r0, 8(r16)
/* 00005064 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00005068 41820040 */ beq lbl_000050A8
lbl_0000506C:
/* 0000506C 80110048 */ lwz r0, 0x48(r17)
/* 00005070 2C000000 */ cmpwi r0, 0
/* 00005074 40820034 */ bne lbl_000050A8
/* 00005078 80170000 */ lwz r0, 0(r23)
/* 0000507C 2C000000 */ cmpwi r0, 0
/* 00005080 40820028 */ bne lbl_000050A8
/* 00005084 80720000 */ lwz r3, 0(r18)
/* 00005088 38030001 */ addi r0, r3, 1
/* 0000508C 2C000003 */ cmpwi r0, 3
/* 00005090 90120000 */ stw r0, 0(r18)
/* 00005094 4081000C */ ble lbl_000050A0
/* 00005098 38000000 */ li r0, 0
/* 0000509C 90120000 */ stw r0, 0(r18)
lbl_000050A0:
/* 000050A0 3860006C */ li r3, 0x6c
/* 000050A4 4BFFB0E5 */ bl u_play_sound_0
lbl_000050A8:
/* 000050A8 3A310004 */ addi r17, r17, 4
/* 000050AC 3A520004 */ addi r18, r18, 4
/* 000050B0 39EF0001 */ addi r15, r15, 1
lbl_000050B4:
/* 000050B4 3B7B003C */ addi r27, r27, 0x3c
/* 000050B8 3A10000A */ addi r16, r16, 0xa
/* 000050BC 3AF70004 */ addi r23, r23, 4
/* 000050C0 3A730001 */ addi r19, r19, 1
lbl_000050C4:
/* 000050C4 2C130004 */ cmpwi r19, 4
/* 000050C8 40800010 */ bge lbl_000050D8
/* 000050CC 80140024 */ lwz r0, 0x24(r20)
/* 000050D0 7C0F0000 */ cmpw r15, r0
/* 000050D4 4180FF24 */ blt lbl_00004FF8
lbl_000050D8:
/* 000050D8 38600017 */ li r3, 0x17
/* 000050DC 4BFFB0AD */ bl find_sprite_with_tag
/* 000050E0 28030000 */ cmplwi r3, 0
/* 000050E4 4182000C */ beq lbl_000050F0
/* 000050E8 3800000D */ li r0, 0xd
/* 000050EC 90030048 */ stw r0, 0x48(r3)
lbl_000050F0:
/* 000050F0 3C600000 */ lis r3, modeCtrl@ha
/* 000050F4 38630000 */ addi r3, r3, modeCtrl@l
/* 000050F8 39E30024 */ addi r15, r3, 0x24
/* 000050FC 80030024 */ lwz r0, 0x24(r3)
/* 00005100 387C0000 */ addi r3, r28, 0
/* 00005104 38800001 */ li r4, 1
/* 00005108 2C000000 */ cmpwi r0, 0
/* 0000510C 7C0903A6 */ mtctr r0
/* 00005110 4081001C */ ble lbl_0000512C
lbl_00005114:
/* 00005114 80030048 */ lwz r0, 0x48(r3)
/* 00005118 2C000000 */ cmpwi r0, 0
/* 0000511C 41820008 */ beq lbl_00005124
/* 00005120 38800000 */ li r4, 0
lbl_00005124:
/* 00005124 38630004 */ addi r3, r3, 4
/* 00005128 4200FFEC */ bdnz lbl_00005114
lbl_0000512C:
/* 0000512C 2C040000 */ cmpwi r4, 0
/* 00005130 41820014 */ beq lbl_00005144
/* 00005134 38600007 */ li r3, 7
/* 00005138 4BFFB49D */ bl lbl_000005D4
/* 0000513C 2C030000 */ cmpwi r3, 0
/* 00005140 4082001C */ bne lbl_0000515C
lbl_00005144:
/* 00005144 2C150000 */ cmpwi r21, 0
/* 00005148 41820080 */ beq lbl_000051C8
/* 0000514C 38600007 */ li r3, 7
/* 00005150 4BFFB485 */ bl lbl_000005D4
/* 00005154 2C030000 */ cmpwi r3, 0
/* 00005158 41820070 */ beq lbl_000051C8
lbl_0000515C:
/* 0000515C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005160 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00005164 38000001 */ li r0, 1
/* 00005168 90030008 */ stw r0, 8(r3)
/* 0000516C 39E30044 */ addi r15, r3, 0x44
/* 00005170 80030044 */ lwz r0, 0x44(r3)
/* 00005174 2C000000 */ cmpwi r0, 0
/* 00005178 4182001C */ beq lbl_00005194
/* 0000517C 38600001 */ li r3, 1
/* 00005180 38800014 */ li r4, 0x14
/* 00005184 38A00000 */ li r5, 0
/* 00005188 4BFFB001 */ bl textbox_set_properties
/* 0000518C 38000000 */ li r0, 0
/* 00005190 900F0000 */ stw r0, 0(r15)
lbl_00005194:
/* 00005194 3860001D */ li r3, 0x1d
/* 00005198 4BFFAFF1 */ bl find_sprite_with_tag
/* 0000519C 28030000 */ cmplwi r3, 0
/* 000051A0 4182000C */ beq lbl_000051AC
/* 000051A4 38000001 */ li r0, 1
/* 000051A8 90030048 */ stw r0, 0x48(r3)
lbl_000051AC:
/* 000051AC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000051B0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000051B4 38000002 */ li r0, 2
/* 000051B8 900300BC */ stw r0, 0xbc(r3)
/* 000051BC 3800000F */ li r0, 0xf
/* 000051C0 90190000 */ stw r0, 0(r25)
/* 000051C4 48004690 */ b lbl_00009854
lbl_000051C8:
/* 000051C8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000051CC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000051D0 80030044 */ lwz r0, 0x44(r3)
/* 000051D4 2C000000 */ cmpwi r0, 0
/* 000051D8 4082467C */ bne lbl_00009854
/* 000051DC 801C0048 */ lwz r0, 0x48(r28)
/* 000051E0 38800000 */ li r4, 0
/* 000051E4 2C000000 */ cmpwi r0, 0
/* 000051E8 41820008 */ beq lbl_000051F0
/* 000051EC 38800001 */ li r4, 1
lbl_000051F0:
/* 000051F0 387C0004 */ addi r3, r28, 4
/* 000051F4 801C004C */ lwz r0, 0x4c(r28)
/* 000051F8 2C000000 */ cmpwi r0, 0
/* 000051FC 41820008 */ beq lbl_00005204
/* 00005200 38840001 */ addi r4, r4, 1
lbl_00005204:
/* 00005204 8003004C */ lwz r0, 0x4c(r3)
/* 00005208 38630004 */ addi r3, r3, 4
/* 0000520C 2C000000 */ cmpwi r0, 0
/* 00005210 41820008 */ beq lbl_00005218
/* 00005214 38840001 */ addi r4, r4, 1
lbl_00005218:
/* 00005218 8003004C */ lwz r0, 0x4c(r3)
/* 0000521C 2C000000 */ cmpwi r0, 0
/* 00005220 41820008 */ beq lbl_00005228
/* 00005224 38840001 */ addi r4, r4, 1
lbl_00005228:
/* 00005228 800F0000 */ lwz r0, 0(r15)
/* 0000522C 7C040000 */ cmpw r4, r0
/* 00005230 41804624 */ blt lbl_00009854
/* 00005234 3C600000 */ lis r3, modeCtrl@ha
/* 00005238 38630000 */ addi r3, r3, modeCtrl@l
/* 0000523C 80030028 */ lwz r0, 0x28(r3)
/* 00005240 2C000004 */ cmpwi r0, 4
/* 00005244 4182007C */ beq lbl_000052C0
/* 00005248 4080001C */ bge lbl_00005264
/* 0000524C 2C000002 */ cmpwi r0, 2
/* 00005250 41824604 */ beq lbl_00009854
/* 00005254 40800030 */ bge lbl_00005284
/* 00005258 2C000001 */ cmpwi r0, 1
/* 0000525C 40800014 */ bge lbl_00005270
/* 00005260 480045F4 */ b lbl_00009854
lbl_00005264:
/* 00005264 2C000006 */ cmpwi r0, 6
/* 00005268 4182006C */ beq lbl_000052D4
/* 0000526C 480045E8 */ b lbl_00009854
lbl_00005270:
/* 00005270 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005274 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00005278 38000017 */ li r0, 0x17
/* 0000527C 90030004 */ stw r0, 4(r3)
/* 00005280 480045D4 */ b lbl_00009854
lbl_00005284:
/* 00005284 3C600000 */ lis r3, lbl_801EED88@ha
/* 00005288 38630000 */ addi r3, r3, lbl_801EED88@l
/* 0000528C 80030008 */ lwz r0, 8(r3)
/* 00005290 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00005294 41820018 */ beq lbl_000052AC
/* 00005298 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000529C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000052A0 38000020 */ li r0, 0x20
/* 000052A4 90030004 */ stw r0, 4(r3)
/* 000052A8 480045AC */ b lbl_00009854
lbl_000052AC:
/* 000052AC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000052B0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000052B4 3800001E */ li r0, 0x1e
/* 000052B8 90030004 */ stw r0, 4(r3)
/* 000052BC 48004598 */ b lbl_00009854
lbl_000052C0:
/* 000052C0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000052C4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000052C8 38000022 */ li r0, 0x22
/* 000052CC 90030004 */ stw r0, 4(r3)
/* 000052D0 48004584 */ b lbl_00009854
lbl_000052D4:
/* 000052D4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000052D8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000052DC 3800002B */ li r0, 0x2b
/* 000052E0 90030004 */ stw r0, 4(r3)
/* 000052E4 48004570 */ b lbl_00009854
lbl_000052E8:
/* 000052E8 3860001D */ li r3, 0x1d
/* 000052EC 4BFFAE9D */ bl find_sprite_with_tag
/* 000052F0 28030000 */ cmplwi r3, 0
/* 000052F4 4182000C */ beq lbl_00005300
/* 000052F8 38000001 */ li r0, 1
/* 000052FC 90030048 */ stw r0, 0x48(r3)
lbl_00005300:
/* 00005300 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005304 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00005308 38000002 */ li r0, 2
/* 0000530C 900300BC */ stw r0, 0xbc(r3)
/* 00005310 3800000F */ li r0, 0xf
/* 00005314 38600016 */ li r3, 0x16
/* 00005318 90190000 */ stw r0, 0(r25)
/* 0000531C 4BFFAE6D */ bl find_sprite_with_tag
/* 00005320 28030000 */ cmplwi r3, 0
/* 00005324 4182000C */ beq lbl_00005330
/* 00005328 38000004 */ li r0, 4
/* 0000532C 90030048 */ stw r0, 0x48(r3)
lbl_00005330:
/* 00005330 38600017 */ li r3, 0x17
/* 00005334 4BFFAE55 */ bl find_sprite_with_tag
/* 00005338 28030000 */ cmplwi r3, 0
/* 0000533C 4182000C */ beq lbl_00005348
/* 00005340 3800001A */ li r0, 0x1a
/* 00005344 90030048 */ stw r0, 0x48(r3)
lbl_00005348:
/* 00005348 3C600000 */ lis r3, lbl_802F1C0C@ha
/* 0000534C 88030000 */ lbz r0, lbl_802F1C0C@l(r3)
/* 00005350 3C600000 */ lis r3, modeCtrl@ha
/* 00005354 38630000 */ addi r3, r3, modeCtrl@l
/* 00005358 7C000774 */ extsb r0, r0
/* 0000535C 90030004 */ stw r0, 4(r3)
/* 00005360 39E30004 */ addi r15, r3, 4
/* 00005364 4800BFCD */ bl lbl_00011330
/* 00005368 806F0000 */ lwz r3, 0(r15)
/* 0000536C 38630005 */ addi r3, r3, 5
/* 00005370 4BFFAE19 */ bl find_sprite_with_tag
/* 00005374 28030000 */ cmplwi r3, 0
/* 00005378 4182000C */ beq lbl_00005384
/* 0000537C 38000002 */ li r0, 2
/* 00005380 90030048 */ stw r0, 0x48(r3)
lbl_00005384:
/* 00005384 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005388 38000016 */ li r0, 0x16
/* 0000538C 90030000 */ stw r0, lbl_801EEDA8@l(r3)
lbl_00005390:
/* 00005390 38600000 */ li r3, 0
/* 00005394 4BFFB241 */ bl lbl_000005D4
/* 00005398 2C030000 */ cmpwi r3, 0
/* 0000539C 41820068 */ beq lbl_00005404
/* 000053A0 3C600000 */ lis r3, modeCtrl@ha
/* 000053A4 38630000 */ addi r3, r3, modeCtrl@l
/* 000053A8 39E30004 */ addi r15, r3, 4
/* 000053AC 80630004 */ lwz r3, 4(r3)
/* 000053B0 38630005 */ addi r3, r3, 5
/* 000053B4 4BFFADD5 */ bl find_sprite_with_tag
/* 000053B8 28030000 */ cmplwi r3, 0
/* 000053BC 4182000C */ beq lbl_000053C8
/* 000053C0 38000001 */ li r0, 1
/* 000053C4 90030048 */ stw r0, 0x48(r3)
lbl_000053C8:
/* 000053C8 806F0000 */ lwz r3, 0(r15)
/* 000053CC 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 000053D0 900F0000 */ stw r0, 0(r15)
/* 000053D4 4080000C */ bge lbl_000053E0
/* 000053D8 38000002 */ li r0, 2
/* 000053DC 900F0000 */ stw r0, 0(r15)
lbl_000053E0:
/* 000053E0 806F0000 */ lwz r3, 0(r15)
/* 000053E4 38630005 */ addi r3, r3, 5
/* 000053E8 4BFFADA1 */ bl find_sprite_with_tag
/* 000053EC 28030000 */ cmplwi r3, 0
/* 000053F0 4182000C */ beq lbl_000053FC
/* 000053F4 38000002 */ li r0, 2
/* 000053F8 90030048 */ stw r0, 0x48(r3)
lbl_000053FC:
/* 000053FC 3860006C */ li r3, 0x6c
/* 00005400 4BFFAD89 */ bl u_play_sound_0
lbl_00005404:
/* 00005404 38600001 */ li r3, 1
/* 00005408 4BFFB1CD */ bl lbl_000005D4
/* 0000540C 2C030000 */ cmpwi r3, 0
/* 00005410 4182006C */ beq lbl_0000547C
/* 00005414 3C600000 */ lis r3, modeCtrl@ha
/* 00005418 38630000 */ addi r3, r3, modeCtrl@l
/* 0000541C 39E30004 */ addi r15, r3, 4
/* 00005420 80630004 */ lwz r3, 4(r3)
/* 00005424 38630005 */ addi r3, r3, 5
/* 00005428 4BFFAD61 */ bl find_sprite_with_tag
/* 0000542C 28030000 */ cmplwi r3, 0
/* 00005430 4182000C */ beq lbl_0000543C
/* 00005434 38000001 */ li r0, 1
/* 00005438 90030048 */ stw r0, 0x48(r3)
lbl_0000543C:
/* 0000543C 806F0000 */ lwz r3, 0(r15)
/* 00005440 38030001 */ addi r0, r3, 1
/* 00005444 2C000002 */ cmpwi r0, 2
/* 00005448 900F0000 */ stw r0, 0(r15)
/* 0000544C 4081000C */ ble lbl_00005458
/* 00005450 38000000 */ li r0, 0
/* 00005454 900F0000 */ stw r0, 0(r15)
lbl_00005458:
/* 00005458 806F0000 */ lwz r3, 0(r15)
/* 0000545C 38630005 */ addi r3, r3, 5
/* 00005460 4BFFAD29 */ bl find_sprite_with_tag
/* 00005464 28030000 */ cmplwi r3, 0
/* 00005468 4182000C */ beq lbl_00005474
/* 0000546C 38000002 */ li r0, 2
/* 00005470 90030048 */ stw r0, 0x48(r3)
lbl_00005474:
/* 00005474 3860006C */ li r3, 0x6c
/* 00005478 4BFFAD11 */ bl u_play_sound_0
lbl_0000547C:
/* 0000547C 38600007 */ li r3, 7
/* 00005480 4BFFB155 */ bl lbl_000005D4
/* 00005484 2C030000 */ cmpwi r3, 0
/* 00005488 41820040 */ beq lbl_000054C8
/* 0000548C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005490 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00005494 38000001 */ li r0, 1
/* 00005498 90030008 */ stw r0, 8(r3)
/* 0000549C 3A000000 */ li r16, 0
/* 000054A0 39E00005 */ li r15, 5
lbl_000054A4:
/* 000054A4 38700005 */ addi r3, r16, 5
/* 000054A8 4BFFACE1 */ bl find_sprite_with_tag
/* 000054AC 28030000 */ cmplwi r3, 0
/* 000054B0 41820008 */ beq lbl_000054B8
/* 000054B4 91E30048 */ stw r15, 0x48(r3)
lbl_000054B8:
/* 000054B8 3A100001 */ addi r16, r16, 1
/* 000054BC 2C100003 */ cmpwi r16, 3
/* 000054C0 4180FFE4 */ blt lbl_000054A4
/* 000054C4 48004390 */ b lbl_00009854
lbl_000054C8:
/* 000054C8 38600006 */ li r3, 6
/* 000054CC 4BFFB109 */ bl lbl_000005D4
/* 000054D0 2C030000 */ cmpwi r3, 0
/* 000054D4 41824380 */ beq lbl_00009854
/* 000054D8 3C600000 */ lis r3, modeCtrl@ha
/* 000054DC 38630000 */ addi r3, r3, modeCtrl@l
/* 000054E0 80A30004 */ lwz r5, 4(r3)
/* 000054E4 3A030004 */ addi r16, r3, 4
/* 000054E8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000054EC 3C800000 */ lis r4, lbl_802F1C0C@ha
/* 000054F0 7CA00774 */ extsb r0, r5
/* 000054F4 98040000 */ stb r0, lbl_802F1C0C@l(r4)
/* 000054F8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000054FC 38000033 */ li r0, 0x33
/* 00005500 90030004 */ stw r0, 4(r3)
/* 00005504 38650216 */ addi r3, r5, 0x216
/* 00005508 4BFFAC81 */ bl u_play_sound_0
/* 0000550C 3A200000 */ li r17, 0
lbl_00005510:
/* 00005510 80100000 */ lwz r0, 0(r16)
/* 00005514 7C110000 */ cmpw r17, r0
/* 00005518 4082000C */ bne lbl_00005524
/* 0000551C 39E00003 */ li r15, 3
/* 00005520 48000008 */ b lbl_00005528
lbl_00005524:
/* 00005524 39E00004 */ li r15, 4
lbl_00005528:
/* 00005528 38710005 */ addi r3, r17, 5
/* 0000552C 4BFFAC5D */ bl find_sprite_with_tag
/* 00005530 28030000 */ cmplwi r3, 0
/* 00005534 41820008 */ beq lbl_0000553C
/* 00005538 91E30048 */ stw r15, 0x48(r3)
lbl_0000553C:
/* 0000553C 3A310001 */ addi r17, r17, 1
/* 00005540 2C110003 */ cmpwi r17, 3
/* 00005544 4180FFCC */ blt lbl_00005510
/* 00005548 4800430C */ b lbl_00009854
lbl_0000554C:
/* 0000554C 3860001D */ li r3, 0x1d
/* 00005550 4BFFAC39 */ bl find_sprite_with_tag
/* 00005554 28030000 */ cmplwi r3, 0
/* 00005558 4182000C */ beq lbl_00005564
/* 0000555C 38000001 */ li r0, 1
/* 00005560 90030048 */ stw r0, 0x48(r3)
lbl_00005564:
/* 00005564 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005568 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000556C 38000002 */ li r0, 2
/* 00005570 900300BC */ stw r0, 0xbc(r3)
/* 00005574 3800000F */ li r0, 0xf
/* 00005578 38600016 */ li r3, 0x16
/* 0000557C 90190000 */ stw r0, 0(r25)
/* 00005580 4BFFAC09 */ bl find_sprite_with_tag
/* 00005584 28030000 */ cmplwi r3, 0
/* 00005588 4182000C */ beq lbl_00005594
/* 0000558C 38000005 */ li r0, 5
/* 00005590 90030048 */ stw r0, 0x48(r3)
lbl_00005594:
/* 00005594 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00005598 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 0000559C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000055A0 3C800000 */ lis r4, lbl_8027CE24@ha
/* 000055A4 54051838 */ slwi r5, r0, 3
/* 000055A8 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 000055AC 7C002A14 */ add r0, r0, r5
/* 000055B0 39E30000 */ addi r15, r3, lbl_802F1FB4@l
/* 000055B4 900F0000 */ stw r0, 0(r15)
/* 000055B8 806F0000 */ lwz r3, 0(r15)
/* 000055BC A8030002 */ lha r0, 2(r3)
/* 000055C0 2C000002 */ cmpwi r0, 2
/* 000055C4 40810088 */ ble lbl_0000564C
/* 000055C8 38600000 */ li r3, 0
/* 000055CC 38800001 */ li r4, 1
/* 000055D0 38A00000 */ li r5, 0
/* 000055D4 4BFFABB5 */ bl is_floor_visited
/* 000055D8 2C030000 */ cmpwi r3, 0
/* 000055DC 41820014 */ beq lbl_000055F0
/* 000055E0 806F0000 */ lwz r3, 0(r15)
/* 000055E4 38000000 */ li r0, 0
/* 000055E8 B0030002 */ sth r0, 2(r3)
/* 000055EC 48000060 */ b lbl_0000564C
lbl_000055F0:
/* 000055F0 38600001 */ li r3, 1
/* 000055F4 38800001 */ li r4, 1
/* 000055F8 38A00000 */ li r5, 0
/* 000055FC 4BFFAB8D */ bl is_floor_visited
/* 00005600 2C030000 */ cmpwi r3, 0
/* 00005604 41820014 */ beq lbl_00005618
/* 00005608 806F0000 */ lwz r3, 0(r15)
/* 0000560C 38000001 */ li r0, 1
/* 00005610 B0030002 */ sth r0, 2(r3)
/* 00005614 48000038 */ b lbl_0000564C
lbl_00005618:
/* 00005618 38600002 */ li r3, 2
/* 0000561C 38800001 */ li r4, 1
/* 00005620 38A00000 */ li r5, 0
/* 00005624 4BFFAB65 */ bl is_floor_visited
/* 00005628 2C030000 */ cmpwi r3, 0
/* 0000562C 41820014 */ beq lbl_00005640
/* 00005630 806F0000 */ lwz r3, 0(r15)
/* 00005634 38000002 */ li r0, 2
/* 00005638 B0030002 */ sth r0, 2(r3)
/* 0000563C 48000010 */ b lbl_0000564C
lbl_00005640:
/* 00005640 387E0180 */ addi r3, r30, 0x180
/* 00005644 4CC63182 */ crclr 6
/* 00005648 4BFFAB41 */ bl printf
lbl_0000564C:
/* 0000564C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00005650 39E30000 */ addi r15, r3, lbl_802F1FB4@l
/* 00005654 80AF0000 */ lwz r5, 0(r15)
/* 00005658 A8650002 */ lha r3, 2(r5)
/* 0000565C A8850000 */ lha r4, 0(r5)
/* 00005660 80A50004 */ lwz r5, 4(r5)
/* 00005664 4BFFAB25 */ bl is_floor_visited
/* 00005668 2C030000 */ cmpwi r3, 0
/* 0000566C 40820088 */ bne lbl_000056F4
/* 00005670 38600000 */ li r3, 0
/* 00005674 38800001 */ li r4, 1
/* 00005678 38A00000 */ li r5, 0
/* 0000567C 4BFFAB0D */ bl is_floor_visited
/* 00005680 2C030000 */ cmpwi r3, 0
/* 00005684 41820014 */ beq lbl_00005698
/* 00005688 806F0000 */ lwz r3, 0(r15)
/* 0000568C 38000000 */ li r0, 0
/* 00005690 B0030002 */ sth r0, 2(r3)
/* 00005694 48000060 */ b lbl_000056F4
lbl_00005698:
/* 00005698 38600001 */ li r3, 1
/* 0000569C 38800001 */ li r4, 1
/* 000056A0 38A00000 */ li r5, 0
/* 000056A4 4BFFAAE5 */ bl is_floor_visited
/* 000056A8 2C030000 */ cmpwi r3, 0
/* 000056AC 41820014 */ beq lbl_000056C0
/* 000056B0 806F0000 */ lwz r3, 0(r15)
/* 000056B4 38000001 */ li r0, 1
/* 000056B8 B0030002 */ sth r0, 2(r3)
/* 000056BC 48000038 */ b lbl_000056F4
lbl_000056C0:
/* 000056C0 38600002 */ li r3, 2
/* 000056C4 38800001 */ li r4, 1
/* 000056C8 38A00000 */ li r5, 0
/* 000056CC 4BFFAABD */ bl is_floor_visited
/* 000056D0 2C030000 */ cmpwi r3, 0
/* 000056D4 41820014 */ beq lbl_000056E8
/* 000056D8 806F0000 */ lwz r3, 0(r15)
/* 000056DC 38000002 */ li r0, 2
/* 000056E0 B0030002 */ sth r0, 2(r3)
/* 000056E4 48000010 */ b lbl_000056F4
lbl_000056E8:
/* 000056E8 387E01A0 */ addi r3, r30, 0x1a0
/* 000056EC 4CC63182 */ crclr 6
/* 000056F0 4BFFAA99 */ bl printf
lbl_000056F4:
/* 000056F4 38600017 */ li r3, 0x17
/* 000056F8 4BFFAA91 */ bl find_sprite_with_tag
/* 000056FC 28030000 */ cmplwi r3, 0
/* 00005700 4182000C */ beq lbl_0000570C
/* 00005704 38000000 */ li r0, 0
/* 00005708 90030048 */ stw r0, 0x48(r3)
lbl_0000570C:
/* 0000570C 38600018 */ li r3, 0x18
/* 00005710 4BFFAA79 */ bl find_sprite_with_tag
/* 00005714 28030000 */ cmplwi r3, 0
/* 00005718 4182000C */ beq lbl_00005724
/* 0000571C 38000001 */ li r0, 1
/* 00005720 90030048 */ stw r0, 0x48(r3)
lbl_00005724:
/* 00005724 38600019 */ li r3, 0x19
/* 00005728 4BFFAA61 */ bl find_sprite_with_tag
/* 0000572C 28030000 */ cmplwi r3, 0
/* 00005730 4182000C */ beq lbl_0000573C
/* 00005734 38000001 */ li r0, 1
/* 00005738 90030048 */ stw r0, 0x48(r3)
lbl_0000573C:
/* 0000573C 3860001B */ li r3, 0x1b
/* 00005740 4BFFAA49 */ bl find_sprite_with_tag
/* 00005744 28030000 */ cmplwi r3, 0
/* 00005748 4182000C */ beq lbl_00005754
/* 0000574C 38000001 */ li r0, 1
/* 00005750 90030048 */ stw r0, 0x48(r3)
lbl_00005754:
/* 00005754 3860001C */ li r3, 0x1c
/* 00005758 4BFFAA31 */ bl find_sprite_with_tag
/* 0000575C 28030000 */ cmplwi r3, 0
/* 00005760 4182000C */ beq lbl_0000576C
/* 00005764 38000001 */ li r0, 1
/* 00005768 90030048 */ stw r0, 0x48(r3)
lbl_0000576C:
/* 0000576C 3C600000 */ lis r3, modeCtrl@ha
/* 00005770 38630000 */ addi r3, r3, modeCtrl@l
/* 00005774 80030028 */ lwz r0, 0x28(r3)
/* 00005778 2C000002 */ cmpwi r0, 2
/* 0000577C 418202A0 */ beq lbl_00005A1C
/* 00005780 40800434 */ bge lbl_00005BB4
/* 00005784 2C000001 */ cmpwi r0, 1
/* 00005788 40800008 */ bge lbl_00005790
/* 0000578C 48000428 */ b lbl_00005BB4
lbl_00005790:
/* 00005790 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005794 38A30000 */ addi r5, r3, lbl_801EEDA8@l
/* 00005798 38000018 */ li r0, 0x18
/* 0000579C 3C600000 */ lis r3, u_isCompetitionModeCourse@ha
/* 000057A0 90050000 */ stw r0, 0(r5)
/* 000057A4 38830000 */ addi r4, r3, u_isCompetitionModeCourse@l
/* 000057A8 80040000 */ lwz r0, 0(r4)
/* 000057AC 2C000000 */ cmpwi r0, 0
/* 000057B0 4182009C */ beq lbl_0000584C
/* 000057B4 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 000057B8 39E00002 */ li r15, 2
/* 000057BC 91E30000 */ stw r15, lbl_802F1FA8@l(r3)
/* 000057C0 38600019 */ li r3, 0x19
/* 000057C4 38000000 */ li r0, 0
/* 000057C8 90650000 */ stw r3, 0(r5)
/* 000057CC 38600018 */ li r3, 0x18
/* 000057D0 90040000 */ stw r0, 0(r4)
/* 000057D4 4BFFA9B5 */ bl find_sprite_with_tag
/* 000057D8 28030000 */ cmplwi r3, 0
/* 000057DC 41820008 */ beq lbl_000057E4
/* 000057E0 91E30048 */ stw r15, 0x48(r3)
lbl_000057E4:
/* 000057E4 38600019 */ li r3, 0x19
/* 000057E8 4BFFA9A1 */ bl find_sprite_with_tag
/* 000057EC 28030000 */ cmplwi r3, 0
/* 000057F0 4182000C */ beq lbl_000057FC
/* 000057F4 38000002 */ li r0, 2
/* 000057F8 90030048 */ stw r0, 0x48(r3)
lbl_000057FC:
/* 000057FC 3860001B */ li r3, 0x1b
/* 00005800 4BFFA989 */ bl find_sprite_with_tag
/* 00005804 28030000 */ cmplwi r3, 0
/* 00005808 4182000C */ beq lbl_00005814
/* 0000580C 38000002 */ li r0, 2
/* 00005810 90030048 */ stw r0, 0x48(r3)
lbl_00005814:
/* 00005814 3860001C */ li r3, 0x1c
/* 00005818 4BFFA971 */ bl find_sprite_with_tag
/* 0000581C 28030000 */ cmplwi r3, 0
/* 00005820 4182000C */ beq lbl_0000582C
/* 00005824 38000002 */ li r0, 2
/* 00005828 90030048 */ stw r0, 0x48(r3)
lbl_0000582C:
/* 0000582C 3860000C */ li r3, 0xc
/* 00005830 4BFFA959 */ bl camera_set_state
/* 00005834 3860001B */ li r3, 0x1b
/* 00005838 4BFFA951 */ bl find_sprite_with_tag
/* 0000583C 28030000 */ cmplwi r3, 0
/* 00005840 4182000C */ beq lbl_0000584C
/* 00005844 38000001 */ li r0, 1
/* 00005848 B0030010 */ sth r0, 0x10(r3)
lbl_0000584C:
/* 0000584C 38600066 */ li r3, 0x66
/* 00005850 4BFFA939 */ bl find_sprite_with_tag
/* 00005854 28030000 */ cmplwi r3, 0
/* 00005858 4082035C */ bne lbl_00005BB4
/* 0000585C 4BFFA92D */ bl create_sprite
/* 00005860 7C751B79 */ or. r21, r3, r3
/* 00005864 418200E8 */ beq lbl_0000594C
/* 00005868 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 0000586C 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 00005870 3C800000 */ lis r4, lbl_8027CE24@ha
/* 00005874 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00005878 54051838 */ slwi r5, r0, 3
/* 0000587C 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 00005880 7C002A14 */ add r0, r0, r5
/* 00005884 94030000 */ stwu r0, lbl_802F1FB4@l(r3)
/* 00005888 80A30000 */ lwz r5, 0(r3)
/* 0000588C A8650002 */ lha r3, 2(r5)
/* 00005890 A8850000 */ lha r4, 0(r5)
/* 00005894 80A50004 */ lwz r5, 4(r5)
/* 00005898 4BFFA8F1 */ bl floor_to_stage_id
/* 0000589C 7C6F1B79 */ or. r15, r3, r3
/* 000058A0 40820008 */ bne lbl_000058A8
/* 000058A4 39E00001 */ li r15, 1
lbl_000058A8:
/* 000058A8 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000058AC 4CC63182 */ crclr 6
/* 000058B0 80E30000 */ lwz r7, lbl_802F1FB4@l(r3)
/* 000058B4 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 000058B8 80830000 */ lwz r4, lbl_802F1FAC@l(r3)
/* 000058BC 7DE87B78 */ mr r8, r15
/* 000058C0 A8A70002 */ lha r5, 2(r7)
/* 000058C4 A8C70000 */ lha r6, 0(r7)
/* 000058C8 387E01B8 */ addi r3, r30, 0x1b8
/* 000058CC 80E70004 */ lwz r7, 4(r7)
/* 000058D0 4BFFA8B9 */ bl printf
/* 000058D4 3A1F00C4 */ addi r16, r31, 0xc4
/* 000058D8 91FF003C */ stw r15, 0x3c(r31)
/* 000058DC 38700000 */ addi r3, r16, 0
/* 000058E0 389E01E8 */ addi r4, r30, 0x1e8
/* 000058E4 38AFFFFF */ addi r5, r15, -1  ;# fixed addi
/* 000058E8 38C000C0 */ li r6, 0xc0
/* 000058EC 38E00084 */ li r7, 0x84
/* 000058F0 39000005 */ li r8, 5
/* 000058F4 4BFFA895 */ bl preview_create_with_alloc_img
/* 000058F8 9215002C */ stw r16, 0x2c(r21)
/* 000058FC 38000066 */ li r0, 0x66
/* 00005900 3CA00000 */ lis r5, lbl_00009B94@ha
/* 00005904 9815000F */ stb r0, 0xf(r21)
/* 00005908 3C800000 */ lis r4, lbl_0000A3A4@ha
/* 0000590C 3C600000 */ lis r3, lbl_0000A634@ha
/* 00005910 C01D0020 */ lfs f0, 0x20(r29)
/* 00005914 38C00000 */ li r6, 0
/* 00005918 38A50000 */ addi r5, r5, lbl_00009B94@l
/* 0000591C D0150040 */ stfs f0, 0x40(r21)
/* 00005920 38840000 */ addi r4, r4, lbl_0000A3A4@l
/* 00005924 38030000 */ addi r0, r3, lbl_0000A634@l
/* 00005928 C01D0024 */ lfs f0, 0x24(r29)
/* 0000592C D0150044 */ stfs f0, 0x44(r21)
/* 00005930 91F50048 */ stw r15, 0x48(r21)
/* 00005934 B0D5003C */ sth r6, 0x3c(r21)
/* 00005938 C01D0028 */ lfs f0, 0x28(r29)
/* 0000593C D015004C */ stfs f0, 0x4c(r21)
/* 00005940 90B50034 */ stw r5, 0x34(r21)
/* 00005944 90950038 */ stw r4, 0x38(r21)
/* 00005948 90150030 */ stw r0, 0x30(r21)
lbl_0000594C:
/* 0000594C 3C600000 */ lis r3, lbl_8027CE24@ha
/* 00005950 3A830000 */ addi r20, r3, lbl_8027CE24@l
/* 00005954 3CC00000 */ lis r6, lbl_802F1FB4@ha
/* 00005958 3CA00000 */ lis r5, lbl_00009B94@ha
/* 0000595C 3C800000 */ lis r4, lbl_0000A3A4@ha
/* 00005960 3C600000 */ lis r3, lbl_0000A634@ha
/* 00005964 3ABF0138 */ addi r21, r31, 0x138
/* 00005968 3A460000 */ addi r18, r6, lbl_802F1FB4@l
/* 0000596C 3A250000 */ addi r17, r5, lbl_00009B94@l
/* 00005970 3A040000 */ addi r16, r4, lbl_0000A3A4@l
/* 00005974 39E30000 */ addi r15, r3, lbl_0000A634@l
/* 00005978 3AC00000 */ li r22, 0
lbl_0000597C:
/* 0000597C 4BFFA80D */ bl create_sprite
/* 00005980 7C731B79 */ or. r19, r3, r3
/* 00005984 41820080 */ beq lbl_00005A04
/* 00005988 92920000 */ stw r20, 0(r18)
/* 0000598C 80B20000 */ lwz r5, 0(r18)
/* 00005990 A8650002 */ lha r3, 2(r5)
/* 00005994 A8850000 */ lha r4, 0(r5)
/* 00005998 80A50004 */ lwz r5, 4(r5)
/* 0000599C 4BFFA7ED */ bl floor_to_stage_id
/* 000059A0 7C771B79 */ or. r23, r3, r3
/* 000059A4 40820008 */ bne lbl_000059AC
/* 000059A8 3AE00001 */ li r23, 1
lbl_000059AC:
/* 000059AC 38750000 */ addi r3, r21, 0
/* 000059B0 389E01FC */ addi r4, r30, 0x1fc
/* 000059B4 38B7FFFF */ addi r5, r23, -1  ;# fixed addi
/* 000059B8 38C00026 */ li r6, 0x26
/* 000059BC 38E0001A */ li r7, 0x1a
/* 000059C0 39000005 */ li r8, 5
/* 000059C4 4BFFA7C5 */ bl preview_create_with_alloc_img
/* 000059C8 92B3002C */ stw r21, 0x2c(r19)
/* 000059CC 38600066 */ li r3, 0x66
/* 000059D0 38160001 */ addi r0, r22, 1
/* 000059D4 9873000F */ stb r3, 0xf(r19)
/* 000059D8 C01D002C */ lfs f0, 0x2c(r29)
/* 000059DC D0130040 */ stfs f0, 0x40(r19)
/* 000059E0 C01D0030 */ lfs f0, 0x30(r29)
/* 000059E4 D0130044 */ stfs f0, 0x44(r19)
/* 000059E8 92F30048 */ stw r23, 0x48(r19)
/* 000059EC B013003C */ sth r0, 0x3c(r19)
/* 000059F0 C01D0028 */ lfs f0, 0x28(r29)
/* 000059F4 D013004C */ stfs f0, 0x4c(r19)
/* 000059F8 92330034 */ stw r17, 0x34(r19)
/* 000059FC 92130038 */ stw r16, 0x38(r19)
/* 00005A00 91F30030 */ stw r15, 0x30(r19)
lbl_00005A04:
/* 00005A04 3AD60001 */ addi r22, r22, 1
/* 00005A08 2C160005 */ cmpwi r22, 5
/* 00005A0C 3A940008 */ addi r20, r20, 8
/* 00005A10 3AB50074 */ addi r21, r21, 0x74
/* 00005A14 4180FF68 */ blt lbl_0000597C
/* 00005A18 4800019C */ b lbl_00005BB4
lbl_00005A1C:
/* 00005A1C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005A20 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00005A24 38000019 */ li r0, 0x19
/* 00005A28 90040000 */ stw r0, 0(r4)
/* 00005A2C 3C600000 */ lis r3, u_isCompetitionModeCourse@ha
/* 00005A30 38C00000 */ li r6, 0
/* 00005A34 90C30000 */ stw r6, u_isCompetitionModeCourse@l(r3)
/* 00005A38 3CA00000 */ lis r5, lbl_802F1FB0@ha
/* 00005A3C 38000001 */ li r0, 1
/* 00005A40 90050000 */ stw r0, lbl_802F1FB0@l(r5)
/* 00005A44 3C800000 */ lis r4, lbl_802F1FA8@ha
/* 00005A48 39E00002 */ li r15, 2
/* 00005A4C 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00005A50 91E40000 */ stw r15, lbl_802F1FA8@l(r4)
/* 00005A54 38830000 */ addi r4, r3, lbl_802F1FAC@l
/* 00005A58 90C40000 */ stw r6, 0(r4)
/* 00005A5C 38600018 */ li r3, 0x18
/* 00005A60 4BFFA729 */ bl find_sprite_with_tag
/* 00005A64 28030000 */ cmplwi r3, 0
/* 00005A68 41820008 */ beq lbl_00005A70
/* 00005A6C 91E30048 */ stw r15, 0x48(r3)
lbl_00005A70:
/* 00005A70 38600019 */ li r3, 0x19
/* 00005A74 4BFFA715 */ bl find_sprite_with_tag
/* 00005A78 28030000 */ cmplwi r3, 0
/* 00005A7C 4182000C */ beq lbl_00005A88
/* 00005A80 38000002 */ li r0, 2
/* 00005A84 90030048 */ stw r0, 0x48(r3)
lbl_00005A88:
/* 00005A88 3860001B */ li r3, 0x1b
/* 00005A8C 4BFFA6FD */ bl find_sprite_with_tag
/* 00005A90 28030000 */ cmplwi r3, 0
/* 00005A94 4182000C */ beq lbl_00005AA0
/* 00005A98 38000002 */ li r0, 2
/* 00005A9C 90030048 */ stw r0, 0x48(r3)
lbl_00005AA0:
/* 00005AA0 3860001C */ li r3, 0x1c
/* 00005AA4 4BFFA6E5 */ bl find_sprite_with_tag
/* 00005AA8 28030000 */ cmplwi r3, 0
/* 00005AAC 4182000C */ beq lbl_00005AB8
/* 00005AB0 38000000 */ li r0, 0
/* 00005AB4 90030048 */ stw r0, 0x48(r3)
lbl_00005AB8:
/* 00005AB8 3860000C */ li r3, 0xc
/* 00005ABC 4BFFA6CD */ bl camera_set_state
/* 00005AC0 38600018 */ li r3, 0x18
/* 00005AC4 4BFFA6C5 */ bl find_sprite_with_tag
/* 00005AC8 28030000 */ cmplwi r3, 0
/* 00005ACC 4182000C */ beq lbl_00005AD8
/* 00005AD0 38000003 */ li r0, 3
/* 00005AD4 90030048 */ stw r0, 0x48(r3)
lbl_00005AD8:
/* 00005AD8 3860001B */ li r3, 0x1b
/* 00005ADC 4BFFA6AD */ bl find_sprite_with_tag
/* 00005AE0 28030000 */ cmplwi r3, 0
/* 00005AE4 4182000C */ beq lbl_00005AF0
/* 00005AE8 38000001 */ li r0, 1
/* 00005AEC B0030010 */ sth r0, 0x10(r3)
lbl_00005AF0:
/* 00005AF0 38600066 */ li r3, 0x66
/* 00005AF4 4BFFA695 */ bl find_sprite_with_tag
/* 00005AF8 28030000 */ cmplwi r3, 0
/* 00005AFC 408200B8 */ bne lbl_00005BB4
/* 00005B00 4BFFA689 */ bl create_sprite
/* 00005B04 7C6F1B79 */ or. r15, r3, r3
/* 00005B08 418200AC */ beq lbl_00005BB4
/* 00005B0C 3C800000 */ lis r4, lbl_8027CE24@ha
/* 00005B10 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 00005B14 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00005B18 94030000 */ stwu r0, lbl_802F1FB4@l(r3)
/* 00005B1C 80A30000 */ lwz r5, 0(r3)
/* 00005B20 A8650002 */ lha r3, 2(r5)
/* 00005B24 A8850000 */ lha r4, 0(r5)
/* 00005B28 80A50004 */ lwz r5, 4(r5)
/* 00005B2C 4BFFA65D */ bl floor_to_stage_id
/* 00005B30 7C711B79 */ or. r17, r3, r3
/* 00005B34 40820008 */ bne lbl_00005B3C
/* 00005B38 3A200001 */ li r17, 1
lbl_00005B3C:
/* 00005B3C 3A1F00C4 */ addi r16, r31, 0xc4
/* 00005B40 923F003C */ stw r17, 0x3c(r31)
/* 00005B44 38700000 */ addi r3, r16, 0
/* 00005B48 389E0210 */ addi r4, r30, 0x210
/* 00005B4C 38B1FFFF */ addi r5, r17, -1  ;# fixed addi
/* 00005B50 38C000C0 */ li r6, 0xc0
/* 00005B54 38E000B2 */ li r7, 0xb2
/* 00005B58 39000005 */ li r8, 5
/* 00005B5C 4BFFA62D */ bl preview_create_with_alloc_img
/* 00005B60 920F002C */ stw r16, 0x2c(r15)
/* 00005B64 38000066 */ li r0, 0x66
/* 00005B68 3CA00000 */ lis r5, lbl_00009B94@ha
/* 00005B6C 980F000F */ stb r0, 0xf(r15)
/* 00005B70 3C800000 */ lis r4, lbl_0000A3A4@ha
/* 00005B74 3C600000 */ lis r3, lbl_0000A634@ha
/* 00005B78 C01D0020 */ lfs f0, 0x20(r29)
/* 00005B7C 38C00000 */ li r6, 0
/* 00005B80 38A50000 */ addi r5, r5, lbl_00009B94@l
/* 00005B84 D00F0040 */ stfs f0, 0x40(r15)
/* 00005B88 38840000 */ addi r4, r4, lbl_0000A3A4@l
/* 00005B8C 38030000 */ addi r0, r3, lbl_0000A634@l
/* 00005B90 C01D0034 */ lfs f0, 0x34(r29)
/* 00005B94 D00F0044 */ stfs f0, 0x44(r15)
/* 00005B98 922F0048 */ stw r17, 0x48(r15)
/* 00005B9C B0CF003C */ sth r6, 0x3c(r15)
/* 00005BA0 C01D0028 */ lfs f0, 0x28(r29)
/* 00005BA4 D00F004C */ stfs f0, 0x4c(r15)
/* 00005BA8 90AF0034 */ stw r5, 0x34(r15)
/* 00005BAC 908F0038 */ stw r4, 0x38(r15)
/* 00005BB0 900F0030 */ stw r0, 0x30(r15)
lbl_00005BB4:
/* 00005BB4 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00005BB8 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 00005BBC 3C800000 */ lis r4, lbl_8027CE24@ha
/* 00005BC0 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00005BC4 54051838 */ slwi r5, r0, 3
/* 00005BC8 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 00005BCC 7C002A14 */ add r0, r0, r5
/* 00005BD0 94030000 */ stwu r0, lbl_802F1FB4@l(r3)
/* 00005BD4 80A30000 */ lwz r5, 0(r3)
/* 00005BD8 A8650002 */ lha r3, 2(r5)
/* 00005BDC A8850000 */ lha r4, 0(r5)
/* 00005BE0 80A50004 */ lwz r5, 4(r5)
/* 00005BE4 4BFFA5A5 */ bl floor_to_stage_id
/* 00005BE8 907F003C */ stw r3, 0x3c(r31)
/* 00005BEC 801F003C */ lwz r0, 0x3c(r31)
/* 00005BF0 2C000000 */ cmpwi r0, 0
/* 00005BF4 40820014 */ bne lbl_00005C08
/* 00005BF8 387E0078 */ addi r3, r30, 0x78
/* 00005BFC 4CC63182 */ crclr 6
/* 00005C00 4BFFA589 */ bl printf
/* 00005C04 48003C50 */ b lbl_00009854
lbl_00005C08:
/* 00005C08 4BFFA581 */ bl empty_load_queue
/* 00005C0C 807F003C */ lwz r3, 0x3c(r31)
/* 00005C10 4BFFA579 */ bl preload_stage_files
/* 00005C14 38000001 */ li r0, 1
/* 00005C18 901F00C0 */ stw r0, 0xc0(r31)
/* 00005C1C 48003C38 */ b lbl_00009854
lbl_00005C20:
/* 00005C20 3C600000 */ lis r3, lbl_802F1FB0@ha
/* 00005C24 39E30000 */ addi r15, r3, lbl_802F1FB0@l
/* 00005C28 834F0000 */ lwz r26, 0(r15)
/* 00005C2C 38600000 */ li r3, 0
/* 00005C30 4BFFA9A5 */ bl lbl_000005D4
/* 00005C34 2C030000 */ cmpwi r3, 0
/* 00005C38 41820018 */ beq lbl_00005C50
/* 00005C3C 806F0000 */ lwz r3, 0(r15)
/* 00005C40 2C030001 */ cmpwi r3, 1
/* 00005C44 4081000C */ ble lbl_00005C50
/* 00005C48 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00005C4C 900F0000 */ stw r0, 0(r15)
lbl_00005C50:
/* 00005C50 38600001 */ li r3, 1
/* 00005C54 4BFFA981 */ bl lbl_000005D4
/* 00005C58 2C030000 */ cmpwi r3, 0
/* 00005C5C 41820020 */ beq lbl_00005C7C
/* 00005C60 3C600000 */ lis r3, lbl_802F1FB0@ha
/* 00005C64 38830000 */ addi r4, r3, lbl_802F1FB0@l
/* 00005C68 80640000 */ lwz r3, 0(r4)
/* 00005C6C 2C030005 */ cmpwi r3, 5
/* 00005C70 4080000C */ bge lbl_00005C7C
/* 00005C74 38030001 */ addi r0, r3, 1
/* 00005C78 90040000 */ stw r0, 0(r4)
lbl_00005C7C:
/* 00005C7C 3C600000 */ lis r3, lbl_802F1FB0@ha
/* 00005C80 80030000 */ lwz r0, lbl_802F1FB0@l(r3)
/* 00005C84 7C1A0000 */ cmpw r26, r0
/* 00005C88 4182000C */ beq lbl_00005C94
/* 00005C8C 3860006C */ li r3, 0x6c
/* 00005C90 4BFFA4F9 */ bl u_play_sound_0
lbl_00005C94:
/* 00005C94 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005C98 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00005C9C A803000C */ lha r0, 0xc(r3)
/* 00005CA0 39E00001 */ li r15, 1
/* 00005CA4 2C00001A */ cmpwi r0, 0x1a
/* 00005CA8 41820008 */ beq lbl_00005CB0
/* 00005CAC 48000008 */ b lbl_00005CB4
lbl_00005CB0:
/* 00005CB0 39E00000 */ li r15, 0
lbl_00005CB4:
/* 00005CB4 38600007 */ li r3, 7
/* 00005CB8 4BFFA91D */ bl lbl_000005D4
/* 00005CBC 2C030000 */ cmpwi r3, 0
/* 00005CC0 41820080 */ beq lbl_00005D40
/* 00005CC4 2C0F0000 */ cmpwi r15, 0
/* 00005CC8 41820078 */ beq lbl_00005D40
/* 00005CCC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005CD0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00005CD4 38000001 */ li r0, 1
/* 00005CD8 90030008 */ stw r0, 8(r3)
/* 00005CDC 38600018 */ li r3, 0x18
/* 00005CE0 4BFFA4A9 */ bl find_sprite_with_tag
/* 00005CE4 28030000 */ cmplwi r3, 0
/* 00005CE8 4182000C */ beq lbl_00005CF4
/* 00005CEC 38000000 */ li r0, 0
/* 00005CF0 90030048 */ stw r0, 0x48(r3)
lbl_00005CF4:
/* 00005CF4 38600019 */ li r3, 0x19
/* 00005CF8 4BFFA491 */ bl find_sprite_with_tag
/* 00005CFC 28030000 */ cmplwi r3, 0
/* 00005D00 4182000C */ beq lbl_00005D0C
/* 00005D04 38000000 */ li r0, 0
/* 00005D08 90030048 */ stw r0, 0x48(r3)
lbl_00005D0C:
/* 00005D0C 3860001B */ li r3, 0x1b
/* 00005D10 4BFFA479 */ bl find_sprite_with_tag
/* 00005D14 28030000 */ cmplwi r3, 0
/* 00005D18 4182000C */ beq lbl_00005D24
/* 00005D1C 38000000 */ li r0, 0
/* 00005D20 90030048 */ stw r0, 0x48(r3)
lbl_00005D24:
/* 00005D24 3860001C */ li r3, 0x1c
/* 00005D28 4BFFA461 */ bl find_sprite_with_tag
/* 00005D2C 28030000 */ cmplwi r3, 0
/* 00005D30 41823B24 */ beq lbl_00009854
/* 00005D34 38000000 */ li r0, 0
/* 00005D38 90030048 */ stw r0, 0x48(r3)
/* 00005D3C 48003B18 */ b lbl_00009854
lbl_00005D40:
/* 00005D40 38600006 */ li r3, 6
/* 00005D44 4BFFA891 */ bl lbl_000005D4
/* 00005D48 2C030000 */ cmpwi r3, 0
/* 00005D4C 41823B08 */ beq lbl_00009854
/* 00005D50 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00005D54 38000019 */ li r0, 0x19
/* 00005D58 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00005D5C 3860006A */ li r3, 0x6a
/* 00005D60 4BFFA429 */ bl u_play_sound_0
/* 00005D64 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 00005D68 38830000 */ addi r4, r3, lbl_802F1FA8@l
/* 00005D6C 39E00002 */ li r15, 2
/* 00005D70 91E40000 */ stw r15, 0(r4)
/* 00005D74 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00005D78 38000000 */ li r0, 0
/* 00005D7C 90030000 */ stw r0, lbl_802F1FAC@l(r3)
/* 00005D80 38600018 */ li r3, 0x18
/* 00005D84 4BFFA405 */ bl find_sprite_with_tag
/* 00005D88 28030000 */ cmplwi r3, 0
/* 00005D8C 41820008 */ beq lbl_00005D94
/* 00005D90 91E30048 */ stw r15, 0x48(r3)
lbl_00005D94:
/* 00005D94 38600019 */ li r3, 0x19
/* 00005D98 4BFFA3F1 */ bl find_sprite_with_tag
/* 00005D9C 28030000 */ cmplwi r3, 0
/* 00005DA0 4182000C */ beq lbl_00005DAC
/* 00005DA4 38000002 */ li r0, 2
/* 00005DA8 90030048 */ stw r0, 0x48(r3)
lbl_00005DAC:
/* 00005DAC 3860001B */ li r3, 0x1b
/* 00005DB0 4BFFA3D9 */ bl find_sprite_with_tag
/* 00005DB4 28030000 */ cmplwi r3, 0
/* 00005DB8 4182000C */ beq lbl_00005DC4
/* 00005DBC 38000002 */ li r0, 2
/* 00005DC0 90030048 */ stw r0, 0x48(r3)
lbl_00005DC4:
/* 00005DC4 3860001C */ li r3, 0x1c
/* 00005DC8 4BFFA3C1 */ bl find_sprite_with_tag
/* 00005DCC 28030000 */ cmplwi r3, 0
/* 00005DD0 4182000C */ beq lbl_00005DDC
/* 00005DD4 38000002 */ li r0, 2
/* 00005DD8 90030048 */ stw r0, 0x48(r3)
lbl_00005DDC:
/* 00005DDC 3860000C */ li r3, 0xc
/* 00005DE0 4BFFA3A9 */ bl camera_set_state
/* 00005DE4 3C600000 */ lis r3, lbl_802F1FB0@ha
/* 00005DE8 80030000 */ lwz r0, lbl_802F1FB0@l(r3)
/* 00005DEC 3C800000 */ lis r4, lbl_801EED50@ha
/* 00005DF0 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00005DF4 7C000774 */ extsb r0, r0
/* 00005DF8 98040000 */ stb r0, lbl_801EED50@l(r4)
/* 00005DFC 3C800000 */ lis r4, lbl_8027CE24@ha
/* 00005E00 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 00005E04 80A30000 */ lwz r5, lbl_802F1FAC@l(r3)
/* 00005E08 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00005E0C 54A41838 */ slwi r4, r5, 3
/* 00005E10 7C002214 */ add r0, r0, r4
/* 00005E14 94030000 */ stwu r0, lbl_802F1FB4@l(r3)
/* 00005E18 80A30000 */ lwz r5, 0(r3)
/* 00005E1C A8650002 */ lha r3, 2(r5)
/* 00005E20 A8850000 */ lha r4, 0(r5)
/* 00005E24 80A50004 */ lwz r5, 4(r5)
/* 00005E28 4BFFA361 */ bl is_floor_visited
/* 00005E2C 2C030000 */ cmpwi r3, 0
/* 00005E30 40823A24 */ bne lbl_00009854
/* 00005E34 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 00005E38 38000000 */ li r0, 0
/* 00005E3C 90030000 */ stw r0, lbl_802F1FA8@l(r3)
/* 00005E40 48003A14 */ b lbl_00009854
lbl_00005E44:
/* 00005E44 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00005E48 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 00005E4C 3C800000 */ lis r4, lbl_802F1FB4@ha
/* 00005E50 3C600000 */ lis r3, lbl_8027CE24@ha
/* 00005E54 54051838 */ slwi r5, r0, 3
/* 00005E58 38030000 */ addi r0, r3, lbl_8027CE24@l
/* 00005E5C 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 00005E60 7C002A14 */ add r0, r0, r5
/* 00005E64 3A040000 */ addi r16, r4, lbl_802F1FB4@l
/* 00005E68 90100000 */ stw r0, 0(r16)
/* 00005E6C 39E30000 */ addi r15, r3, lbl_802F1FA8@l
/* 00005E70 800F0000 */ lwz r0, 0(r15)
/* 00005E74 2C000000 */ cmpwi r0, 0
/* 00005E78 40820230 */ bne lbl_000060A8
/* 00005E7C 38600000 */ li r3, 0
/* 00005E80 4BFFA755 */ bl lbl_000005D4
/* 00005E84 2C030000 */ cmpwi r3, 0
/* 00005E88 40820014 */ bne lbl_00005E9C
/* 00005E8C 38600004 */ li r3, 4
/* 00005E90 4BFFA745 */ bl lbl_000005D4
/* 00005E94 2C030000 */ cmpwi r3, 0
/* 00005E98 4182000C */ beq lbl_00005EA4
lbl_00005E9C:
/* 00005E9C 4BFFC911 */ bl lbl_000027AC
/* 00005EA0 48000098 */ b lbl_00005F38
lbl_00005EA4:
/* 00005EA4 38600001 */ li r3, 1
/* 00005EA8 4BFFA72D */ bl lbl_000005D4
/* 00005EAC 2C030000 */ cmpwi r3, 0
/* 00005EB0 40820014 */ bne lbl_00005EC4
/* 00005EB4 38600005 */ li r3, 5
/* 00005EB8 4BFFA71D */ bl lbl_000005D4
/* 00005EBC 2C030000 */ cmpwi r3, 0
/* 00005EC0 4182000C */ beq lbl_00005ECC
lbl_00005EC4:
/* 00005EC4 4BFFC9E5 */ bl lbl_000028A8
/* 00005EC8 48000070 */ b lbl_00005F38
lbl_00005ECC:
/* 00005ECC 38600003 */ li r3, 3
/* 00005ED0 4BFFA705 */ bl lbl_000005D4
/* 00005ED4 2C030000 */ cmpwi r3, 0
/* 00005ED8 4182002C */ beq lbl_00005F04
/* 00005EDC 80B00000 */ lwz r5, 0(r16)
/* 00005EE0 38800001 */ li r4, 1
/* 00005EE4 A8650002 */ lha r3, 2(r5)
/* 00005EE8 80A50004 */ lwz r5, 4(r5)
/* 00005EEC 4BFFA29D */ bl is_floor_visited
/* 00005EF0 2C030000 */ cmpwi r3, 0
/* 00005EF4 41820044 */ beq lbl_00005F38
/* 00005EF8 38000001 */ li r0, 1
/* 00005EFC 900F0000 */ stw r0, 0(r15)
/* 00005F00 48000038 */ b lbl_00005F38
lbl_00005F04:
/* 00005F04 38600002 */ li r3, 2
/* 00005F08 4BFFA6CD */ bl lbl_000005D4
/* 00005F0C 2C030000 */ cmpwi r3, 0
/* 00005F10 41820028 */ beq lbl_00005F38
/* 00005F14 80B00000 */ lwz r5, 0(r16)
/* 00005F18 38800001 */ li r4, 1
/* 00005F1C A8650002 */ lha r3, 2(r5)
/* 00005F20 80A50004 */ lwz r5, 4(r5)
/* 00005F24 4BFFA265 */ bl is_floor_visited
/* 00005F28 2C030000 */ cmpwi r3, 0
/* 00005F2C 4182000C */ beq lbl_00005F38
/* 00005F30 3800FFFF */ li r0, -1
/* 00005F34 900F0000 */ stw r0, 0(r15)
lbl_00005F38:
/* 00005F38 38600007 */ li r3, 7
/* 00005F3C 4BFFA699 */ bl lbl_000005D4
/* 00005F40 2C030000 */ cmpwi r3, 0
/* 00005F44 418208A0 */ beq lbl_000067E4
/* 00005F48 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00005F4C 3A030000 */ addi r16, r3, lbl_802F1FAC@l
/* 00005F50 80100000 */ lwz r0, 0(r16)
/* 00005F54 2C000000 */ cmpwi r0, 0
/* 00005F58 4081088C */ ble lbl_000067E4
/* 00005F5C 38600066 */ li r3, 0x66
/* 00005F60 4BFFA229 */ bl u_play_sound_0
/* 00005F64 80900000 */ lwz r4, 0(r16)
/* 00005F68 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00005F6C 39E30000 */ addi r15, r3, lbl_802F1FB4@l
/* 00005F70 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 00005F74 90100000 */ stw r0, 0(r16)
/* 00005F78 80AF0000 */ lwz r5, 0(r15)
/* 00005F7C A8650002 */ lha r3, 2(r5)
/* 00005F80 A8850000 */ lha r4, 0(r5)
/* 00005F84 80A50004 */ lwz r5, 4(r5)
/* 00005F88 4BFFA201 */ bl is_floor_visited
/* 00005F8C 2C030000 */ cmpwi r3, 0
/* 00005F90 40820088 */ bne lbl_00006018
/* 00005F94 38600000 */ li r3, 0
/* 00005F98 38800001 */ li r4, 1
/* 00005F9C 38A00000 */ li r5, 0
/* 00005FA0 4BFFA1E9 */ bl is_floor_visited
/* 00005FA4 2C030000 */ cmpwi r3, 0
/* 00005FA8 41820014 */ beq lbl_00005FBC
/* 00005FAC 806F0000 */ lwz r3, 0(r15)
/* 00005FB0 38000000 */ li r0, 0
/* 00005FB4 B0030002 */ sth r0, 2(r3)
/* 00005FB8 48000060 */ b lbl_00006018
lbl_00005FBC:
/* 00005FBC 38600001 */ li r3, 1
/* 00005FC0 38800001 */ li r4, 1
/* 00005FC4 38A00000 */ li r5, 0
/* 00005FC8 4BFFA1C1 */ bl is_floor_visited
/* 00005FCC 2C030000 */ cmpwi r3, 0
/* 00005FD0 41820014 */ beq lbl_00005FE4
/* 00005FD4 806F0000 */ lwz r3, 0(r15)
/* 00005FD8 38000001 */ li r0, 1
/* 00005FDC B0030002 */ sth r0, 2(r3)
/* 00005FE0 48000038 */ b lbl_00006018
lbl_00005FE4:
/* 00005FE4 38600002 */ li r3, 2
/* 00005FE8 38800001 */ li r4, 1
/* 00005FEC 38A00000 */ li r5, 0
/* 00005FF0 4BFFA199 */ bl is_floor_visited
/* 00005FF4 2C030000 */ cmpwi r3, 0
/* 00005FF8 41820014 */ beq lbl_0000600C
/* 00005FFC 806F0000 */ lwz r3, 0(r15)
/* 00006000 38000002 */ li r0, 2
/* 00006004 B0030002 */ sth r0, 2(r3)
/* 00006008 48000010 */ b lbl_00006018
lbl_0000600C:
/* 0000600C 387E01A0 */ addi r3, r30, 0x1a0
/* 00006010 4CC63182 */ crclr 6
/* 00006014 4BFFA175 */ bl printf
lbl_00006018:
/* 00006018 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 0000601C 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 00006020 3C800000 */ lis r4, lbl_8027CE24@ha
/* 00006024 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006028 54051838 */ slwi r5, r0, 3
/* 0000602C 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 00006030 7C002A14 */ add r0, r0, r5
/* 00006034 94030000 */ stwu r0, lbl_802F1FB4@l(r3)
/* 00006038 80A30000 */ lwz r5, 0(r3)
/* 0000603C A8650002 */ lha r3, 2(r5)
/* 00006040 A8850000 */ lha r4, 0(r5)
/* 00006044 80A50004 */ lwz r5, 4(r5)
/* 00006048 4BFFA141 */ bl floor_to_stage_id
/* 0000604C 907F003C */ stw r3, 0x3c(r31)
/* 00006050 801F003C */ lwz r0, 0x3c(r31)
/* 00006054 2C000000 */ cmpwi r0, 0
/* 00006058 40820014 */ bne lbl_0000606C
/* 0000605C 387E0078 */ addi r3, r30, 0x78
/* 00006060 4CC63182 */ crclr 6
/* 00006064 4BFFA125 */ bl printf
/* 00006068 48000018 */ b lbl_00006080
lbl_0000606C:
/* 0000606C 4BFFA11D */ bl empty_load_queue
/* 00006070 807F003C */ lwz r3, 0x3c(r31)
/* 00006074 4BFFA115 */ bl preload_stage_files
/* 00006078 38000001 */ li r0, 1
/* 0000607C 901F00C0 */ stw r0, 0xc0(r31)
lbl_00006080:
/* 00006080 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00006084 80A30000 */ lwz r5, lbl_802F1FAC@l(r3)
/* 00006088 3C800000 */ lis r4, lbl_8027CE24@ha
/* 0000608C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006090 38050001 */ addi r0, r5, 1
/* 00006094 54051838 */ slwi r5, r0, 3
/* 00006098 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 0000609C 7C002A14 */ add r0, r0, r5
/* 000060A0 90030000 */ stw r0, lbl_802F1FB4@l(r3)
/* 000060A4 48000740 */ b lbl_000067E4
lbl_000060A8:
/* 000060A8 80700000 */ lwz r3, 0(r16)
/* 000060AC A8030002 */ lha r0, 2(r3)
/* 000060B0 2C000002 */ cmpwi r0, 2
/* 000060B4 40810088 */ ble lbl_0000613C
/* 000060B8 38600000 */ li r3, 0
/* 000060BC 38800001 */ li r4, 1
/* 000060C0 38A00000 */ li r5, 0
/* 000060C4 4BFFA0C5 */ bl is_floor_visited
/* 000060C8 2C030000 */ cmpwi r3, 0
/* 000060CC 41820014 */ beq lbl_000060E0
/* 000060D0 80700000 */ lwz r3, 0(r16)
/* 000060D4 38000000 */ li r0, 0
/* 000060D8 B0030002 */ sth r0, 2(r3)
/* 000060DC 48000060 */ b lbl_0000613C
lbl_000060E0:
/* 000060E0 38600001 */ li r3, 1
/* 000060E4 38800001 */ li r4, 1
/* 000060E8 38A00000 */ li r5, 0
/* 000060EC 4BFFA09D */ bl is_floor_visited
/* 000060F0 2C030000 */ cmpwi r3, 0
/* 000060F4 41820014 */ beq lbl_00006108
/* 000060F8 80700000 */ lwz r3, 0(r16)
/* 000060FC 38000001 */ li r0, 1
/* 00006100 B0030002 */ sth r0, 2(r3)
/* 00006104 48000038 */ b lbl_0000613C
lbl_00006108:
/* 00006108 38600002 */ li r3, 2
/* 0000610C 38800001 */ li r4, 1
/* 00006110 38A00000 */ li r5, 0
/* 00006114 4BFFA075 */ bl is_floor_visited
/* 00006118 2C030000 */ cmpwi r3, 0
/* 0000611C 41820014 */ beq lbl_00006130
/* 00006120 80700000 */ lwz r3, 0(r16)
/* 00006124 38000002 */ li r0, 2
/* 00006128 B0030002 */ sth r0, 2(r3)
/* 0000612C 48000010 */ b lbl_0000613C
lbl_00006130:
/* 00006130 387E0224 */ addi r3, r30, 0x224
/* 00006134 4CC63182 */ crclr 6
/* 00006138 4BFFA051 */ bl printf
lbl_0000613C:
/* 0000613C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006140 80830000 */ lwz r4, lbl_802F1FB4@l(r3)
/* 00006144 AAE40000 */ lha r23, 0(r4)
/* 00006148 A8640002 */ lha r3, 2(r4)
/* 0000614C 80A40004 */ lwz r5, 4(r4)
/* 00006150 7EE4BB78 */ mr r4, r23
/* 00006154 4BFFA035 */ bl is_floor_visited
/* 00006158 2C030000 */ cmpwi r3, 0
/* 0000615C 40820010 */ bne lbl_0000616C
/* 00006160 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 00006164 38000000 */ li r0, 0
/* 00006168 90030000 */ stw r0, lbl_802F1FA8@l(r3)
lbl_0000616C:
/* 0000616C 3B400000 */ li r26, 0
/* 00006170 38600004 */ li r3, 4
/* 00006174 4BFFA461 */ bl lbl_000005D4
/* 00006178 2C030000 */ cmpwi r3, 0
/* 0000617C 41820018 */ beq lbl_00006194
/* 00006180 4BFFC62D */ bl lbl_000027AC
/* 00006184 2C030000 */ cmpwi r3, 0
/* 00006188 4182002C */ beq lbl_000061B4
/* 0000618C 3B400001 */ li r26, 1
/* 00006190 48000024 */ b lbl_000061B4
lbl_00006194:
/* 00006194 38600005 */ li r3, 5
/* 00006198 4BFFA43D */ bl lbl_000005D4
/* 0000619C 2C030000 */ cmpwi r3, 0
/* 000061A0 41820014 */ beq lbl_000061B4
/* 000061A4 4BFFC705 */ bl lbl_000028A8
/* 000061A8 2C030000 */ cmpwi r3, 0
/* 000061AC 41820008 */ beq lbl_000061B4
/* 000061B0 3B400001 */ li r26, 1
lbl_000061B4:
/* 000061B4 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000061B8 39E30000 */ addi r15, r3, lbl_802F1FB4@l
/* 000061BC 808F0000 */ lwz r4, 0(r15)
/* 000061C0 A8640002 */ lha r3, 2(r4)
/* 000061C4 80840004 */ lwz r4, 4(r4)
/* 000061C8 4BFF9FC1 */ bl course_floor_count
/* 000061CC 80AF0000 */ lwz r5, 0(r15)
/* 000061D0 7C751B78 */ mr r21, r3
/* 000061D4 A8850000 */ lha r4, 0(r5)
/* 000061D8 2C040001 */ cmpwi r4, 1
/* 000061DC 4080000C */ bge lbl_000061E8
/* 000061E0 38800001 */ li r4, 1
/* 000061E4 48000010 */ b lbl_000061F4
lbl_000061E8:
/* 000061E8 7C04A800 */ cmpw r4, r21
/* 000061EC 40810008 */ ble lbl_000061F4
/* 000061F0 7EA4AB78 */ mr r4, r21
lbl_000061F4:
/* 000061F4 3C606666 */ lis r3, 0x6666
/* 000061F8 38036667 */ addi r0, r3, 0x6667
/* 000061FC 7C00A896 */ mulhw r0, r0, r21
/* 00006200 7C001670 */ srawi r0, r0, 2
/* 00006204 54030FFE */ srwi r3, r0, 0x1f
/* 00006208 7C001A14 */ add r0, r0, r3
/* 0000620C 7C830734 */ extsh r3, r4
/* 00006210 2C000001 */ cmpwi r0, 1
/* 00006214 B0650000 */ sth r3, 0(r5)
/* 00006218 3A20000A */ li r17, 0xa
/* 0000621C 40800008 */ bge lbl_00006224
/* 00006220 7EB1AB78 */ mr r17, r21
lbl_00006224:
/* 00006224 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 00006228 38A30000 */ addi r5, r3, lbl_802F1FA8@l
/* 0000622C 80050000 */ lwz r0, 0(r5)
/* 00006230 3B000000 */ li r24, 0
/* 00006234 2C000001 */ cmpwi r0, 1
/* 00006238 40820038 */ bne lbl_00006270
/* 0000623C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006240 80C30000 */ lwz r6, lbl_802F1FB4@l(r3)
/* 00006244 38000002 */ li r0, 2
/* 00006248 3B000001 */ li r24, 1
/* 0000624C A8660000 */ lha r3, 0(r6)
/* 00006250 3883FFFF */ addi r4, r3, -1  ;# fixed addi
/* 00006254 7C648BD6 */ divw r3, r4, r17
/* 00006258 7C6389D6 */ mullw r3, r3, r17
/* 0000625C 7C632050 */ subf r3, r3, r4
/* 00006260 38630001 */ addi r3, r3, 1
/* 00006264 B0660000 */ sth r3, 0(r6)
/* 00006268 90050000 */ stw r0, 0(r5)
/* 0000626C 48000044 */ b lbl_000062B0
lbl_00006270:
/* 00006270 2C00FFFF */ cmpwi r0, -1
/* 00006274 4082003C */ bne lbl_000062B0
/* 00006278 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 0000627C 80C30000 */ lwz r6, lbl_802F1FB4@l(r3)
/* 00006280 3800FFFE */ li r0, -2
/* 00006284 3B000001 */ li r24, 1
/* 00006288 A8660000 */ lha r3, 0(r6)
/* 0000628C 3883FFFF */ addi r4, r3, -1  ;# fixed addi
/* 00006290 7C648BD6 */ divw r3, r4, r17
/* 00006294 7C6389D6 */ mullw r3, r3, r17
/* 00006298 7C632050 */ subf r3, r3, r4
/* 0000629C 7C63AA14 */ add r3, r3, r21
/* 000062A0 38630001 */ addi r3, r3, 1
/* 000062A4 7C711850 */ subf r3, r17, r3
/* 000062A8 B0660000 */ sth r3, 0(r6)
/* 000062AC 90050000 */ stw r0, 0(r5)
lbl_000062B0:
/* 000062B0 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000062B4 3B830000 */ addi r28, r3, lbl_802F1FB4@l
/* 000062B8 809C0000 */ lwz r4, 0(r28)
/* 000062BC 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 000062C0 7E11A850 */ subf r16, r17, r21
/* 000062C4 AAC40000 */ lha r22, 0(r4)
/* 000062C8 3B230000 */ addi r25, r3, lbl_802F1FA8@l
/* 000062CC 3B71FFFF */ addi r27, r17, -1  ;# fixed addi
/* 000062D0 39E00000 */ li r15, 0
lbl_000062D4:
/* 000062D4 38600000 */ li r3, 0
/* 000062D8 4BFFA2FD */ bl lbl_000005D4
/* 000062DC 2C030000 */ cmpwi r3, 0
/* 000062E0 41820038 */ beq lbl_00006318
/* 000062E4 80BC0000 */ lwz r5, 0(r28)
/* 000062E8 A8850000 */ lha r4, 0(r5)
/* 000062EC 3864FFFF */ addi r3, r4, -1  ;# fixed addi
/* 000062F0 7C038BD6 */ divw r0, r3, r17
/* 000062F4 7C0089D6 */ mullw r0, r0, r17
/* 000062F8 7C001851 */ subf. r0, r0, r3
/* 000062FC 40820014 */ bne lbl_00006310
/* 00006300 7C712214 */ add r3, r17, r4
/* 00006304 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00006308 B0050000 */ sth r0, 0(r5)
/* 0000630C 480000E0 */ b lbl_000063EC
lbl_00006310:
/* 00006310 B0650000 */ sth r3, 0(r5)
/* 00006314 480000D8 */ b lbl_000063EC
lbl_00006318:
/* 00006318 38600001 */ li r3, 1
/* 0000631C 4BFFA2B9 */ bl lbl_000005D4
/* 00006320 2C030000 */ cmpwi r3, 0
/* 00006324 4182003C */ beq lbl_00006360
/* 00006328 80BC0000 */ lwz r5, 0(r28)
/* 0000632C A8850000 */ lha r4, 0(r5)
/* 00006330 3864FFFF */ addi r3, r4, -1  ;# fixed addi
/* 00006334 7C038BD6 */ divw r0, r3, r17
/* 00006338 7C0089D6 */ mullw r0, r0, r17
/* 0000633C 7C001850 */ subf r0, r0, r3
/* 00006340 7C1B0000 */ cmpw r27, r0
/* 00006344 40820010 */ bne lbl_00006354
/* 00006348 7C1B2050 */ subf r0, r27, r4
/* 0000634C B0050000 */ sth r0, 0(r5)
/* 00006350 4800009C */ b lbl_000063EC
lbl_00006354:
/* 00006354 38040001 */ addi r0, r4, 1
/* 00006358 B0050000 */ sth r0, 0(r5)
/* 0000635C 48000090 */ b lbl_000063EC
lbl_00006360:
/* 00006360 38600002 */ li r3, 2
/* 00006364 4BFFA271 */ bl lbl_000005D4
/* 00006368 2C030000 */ cmpwi r3, 0
/* 0000636C 4182003C */ beq lbl_000063A8
/* 00006370 807C0000 */ lwz r3, 0(r28)
/* 00006374 A8030000 */ lha r0, 0(r3)
/* 00006378 7C008800 */ cmpw r0, r17
/* 0000637C 41810020 */ bgt lbl_0000639C
/* 00006380 38000000 */ li r0, 0
/* 00006384 90190000 */ stw r0, 0(r25)
/* 00006388 3860006C */ li r3, 0x6c
/* 0000638C 4BFF9DFD */ bl u_play_sound_0
/* 00006390 807C0000 */ lwz r3, 0(r28)
/* 00006394 B2C30000 */ sth r22, 0(r3)
/* 00006398 48000054 */ b lbl_000063EC
lbl_0000639C:
/* 0000639C 7C110050 */ subf r0, r17, r0
/* 000063A0 B0030000 */ sth r0, 0(r3)
/* 000063A4 48000048 */ b lbl_000063EC
lbl_000063A8:
/* 000063A8 38600003 */ li r3, 3
/* 000063AC 4BFFA229 */ bl lbl_000005D4
/* 000063B0 2C030000 */ cmpwi r3, 0
/* 000063B4 41820038 */ beq lbl_000063EC
/* 000063B8 807C0000 */ lwz r3, 0(r28)
/* 000063BC A8030000 */ lha r0, 0(r3)
/* 000063C0 7C008000 */ cmpw r0, r16
/* 000063C4 40810020 */ ble lbl_000063E4
/* 000063C8 38000000 */ li r0, 0
/* 000063CC 90190000 */ stw r0, 0(r25)
/* 000063D0 3860006C */ li r3, 0x6c
/* 000063D4 4BFF9DB5 */ bl u_play_sound_0
/* 000063D8 807C0000 */ lwz r3, 0(r28)
/* 000063DC B2C30000 */ sth r22, 0(r3)
/* 000063E0 4800000C */ b lbl_000063EC
lbl_000063E4:
/* 000063E4 7C008A14 */ add r0, r0, r17
/* 000063E8 B0030000 */ sth r0, 0(r3)
lbl_000063EC:
/* 000063EC 807C0000 */ lwz r3, 0(r28)
/* 000063F0 A8030000 */ lha r0, 0(r3)
/* 000063F4 2C000001 */ cmpwi r0, 1
/* 000063F8 4080000C */ bge lbl_00006404
/* 000063FC 38000001 */ li r0, 1
/* 00006400 48000010 */ b lbl_00006410
lbl_00006404:
/* 00006404 7C00A800 */ cmpw r0, r21
/* 00006408 40810008 */ ble lbl_00006410
/* 0000640C 7EA0AB78 */ mr r0, r21
lbl_00006410:
/* 00006410 7C000734 */ extsh r0, r0
/* 00006414 B0030000 */ sth r0, 0(r3)
/* 00006418 80190000 */ lwz r0, 0(r25)
/* 0000641C 2C000000 */ cmpwi r0, 0
/* 00006420 4182004C */ beq lbl_0000646C
/* 00006424 80BC0000 */ lwz r5, 0(r28)
/* 00006428 A8650002 */ lha r3, 2(r5)
/* 0000642C A8850000 */ lha r4, 0(r5)
/* 00006430 80A50004 */ lwz r5, 4(r5)
/* 00006434 4BFF9D55 */ bl is_floor_visited
/* 00006438 2C030000 */ cmpwi r3, 0
/* 0000643C 40820030 */ bne lbl_0000646C
/* 00006440 39EF0001 */ addi r15, r15, 1
/* 00006444 2C0F000A */ cmpwi r15, 0xa
/* 00006448 41810024 */ bgt lbl_0000646C
/* 0000644C 80190000 */ lwz r0, 0(r25)
/* 00006450 2C00FFFE */ cmpwi r0, -2
/* 00006454 4082FE80 */ bne lbl_000062D4
/* 00006458 807C0000 */ lwz r3, 0(r28)
/* 0000645C A8030000 */ lha r0, 0(r3)
/* 00006460 7C110050 */ subf r0, r17, r0
/* 00006464 B0030000 */ sth r0, 0(r3)
/* 00006468 4BFFFE6C */ b lbl_000062D4
lbl_0000646C:
/* 0000646C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006470 38630000 */ addi r3, r3, lbl_802F1FB4@l
/* 00006474 80630000 */ lwz r3, 0(r3)
/* 00006478 A8030000 */ lha r0, 0(r3)
/* 0000647C 7C160000 */ cmpw r22, r0
/* 00006480 4082000C */ bne lbl_0000648C
/* 00006484 2C180000 */ cmpwi r24, 0
/* 00006488 4182000C */ beq lbl_00006494
lbl_0000648C:
/* 0000648C 3860006C */ li r3, 0x6c
/* 00006490 4BFF9CF9 */ bl u_play_sound_0
lbl_00006494:
/* 00006494 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006498 39E30000 */ addi r15, r3, lbl_802F1FB4@l
/* 0000649C 80AF0000 */ lwz r5, 0(r15)
/* 000064A0 A8650002 */ lha r3, 2(r5)
/* 000064A4 A8850000 */ lha r4, 0(r5)
/* 000064A8 80A50004 */ lwz r5, 4(r5)
/* 000064AC 4BFF9CDD */ bl is_floor_visited
/* 000064B0 2C030000 */ cmpwi r3, 0
/* 000064B4 4082000C */ bne lbl_000064C0
/* 000064B8 806F0000 */ lwz r3, 0(r15)
/* 000064BC B2E30000 */ sth r23, 0(r3)
lbl_000064C0:
/* 000064C0 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 000064C4 84030000 */ lwzu r0, lbl_802F1FA8@l(r3)
/* 000064C8 2C00FFFE */ cmpwi r0, -2
/* 000064CC 4082000C */ bne lbl_000064D8
/* 000064D0 38000002 */ li r0, 2
/* 000064D4 90030000 */ stw r0, 0(r3)
lbl_000064D8:
/* 000064D8 38600007 */ li r3, 7
/* 000064DC 4BFFA0F9 */ bl lbl_000005D4
/* 000064E0 2C030000 */ cmpwi r3, 0
/* 000064E4 41820164 */ beq lbl_00006648
/* 000064E8 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 000064EC 3A030000 */ addi r16, r3, lbl_802F1FAC@l
/* 000064F0 80100000 */ lwz r0, 0(r16)
/* 000064F4 2C000000 */ cmpwi r0, 0
/* 000064F8 40810150 */ ble lbl_00006648
/* 000064FC 38600066 */ li r3, 0x66
/* 00006500 4BFF9C89 */ bl u_play_sound_0
/* 00006504 80900000 */ lwz r4, 0(r16)
/* 00006508 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 0000650C 39E30000 */ addi r15, r3, lbl_802F1FB4@l
/* 00006510 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 00006514 90100000 */ stw r0, 0(r16)
/* 00006518 80AF0000 */ lwz r5, 0(r15)
/* 0000651C A8650002 */ lha r3, 2(r5)
/* 00006520 A8850000 */ lha r4, 0(r5)
/* 00006524 80A50004 */ lwz r5, 4(r5)
/* 00006528 4BFF9C61 */ bl is_floor_visited
/* 0000652C 2C030000 */ cmpwi r3, 0
/* 00006530 40820088 */ bne lbl_000065B8
/* 00006534 38600000 */ li r3, 0
/* 00006538 38800001 */ li r4, 1
/* 0000653C 38A00000 */ li r5, 0
/* 00006540 4BFF9C49 */ bl is_floor_visited
/* 00006544 2C030000 */ cmpwi r3, 0
/* 00006548 41820014 */ beq lbl_0000655C
/* 0000654C 806F0000 */ lwz r3, 0(r15)
/* 00006550 38000000 */ li r0, 0
/* 00006554 B0030002 */ sth r0, 2(r3)
/* 00006558 48000060 */ b lbl_000065B8
lbl_0000655C:
/* 0000655C 38600001 */ li r3, 1
/* 00006560 38800001 */ li r4, 1
/* 00006564 38A00000 */ li r5, 0
/* 00006568 4BFF9C21 */ bl is_floor_visited
/* 0000656C 2C030000 */ cmpwi r3, 0
/* 00006570 41820014 */ beq lbl_00006584
/* 00006574 806F0000 */ lwz r3, 0(r15)
/* 00006578 38000001 */ li r0, 1
/* 0000657C B0030002 */ sth r0, 2(r3)
/* 00006580 48000038 */ b lbl_000065B8
lbl_00006584:
/* 00006584 38600002 */ li r3, 2
/* 00006588 38800001 */ li r4, 1
/* 0000658C 38A00000 */ li r5, 0
/* 00006590 4BFF9BF9 */ bl is_floor_visited
/* 00006594 2C030000 */ cmpwi r3, 0
/* 00006598 41820014 */ beq lbl_000065AC
/* 0000659C 806F0000 */ lwz r3, 0(r15)
/* 000065A0 38000002 */ li r0, 2
/* 000065A4 B0030002 */ sth r0, 2(r3)
/* 000065A8 48000010 */ b lbl_000065B8
lbl_000065AC:
/* 000065AC 387E01A0 */ addi r3, r30, 0x1a0
/* 000065B0 4CC63182 */ crclr 6
/* 000065B4 4BFF9BD5 */ bl printf
lbl_000065B8:
/* 000065B8 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 000065BC 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 000065C0 3C800000 */ lis r4, lbl_8027CE24@ha
/* 000065C4 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000065C8 54051838 */ slwi r5, r0, 3
/* 000065CC 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 000065D0 7C002A14 */ add r0, r0, r5
/* 000065D4 94030000 */ stwu r0, lbl_802F1FB4@l(r3)
/* 000065D8 80A30000 */ lwz r5, 0(r3)
/* 000065DC A8650002 */ lha r3, 2(r5)
/* 000065E0 A8850000 */ lha r4, 0(r5)
/* 000065E4 80A50004 */ lwz r5, 4(r5)
/* 000065E8 4BFF9BA1 */ bl floor_to_stage_id
/* 000065EC 907F003C */ stw r3, 0x3c(r31)
/* 000065F0 801F003C */ lwz r0, 0x3c(r31)
/* 000065F4 2C000000 */ cmpwi r0, 0
/* 000065F8 40820014 */ bne lbl_0000660C
/* 000065FC 387E0078 */ addi r3, r30, 0x78
/* 00006600 4CC63182 */ crclr 6
/* 00006604 4BFF9B85 */ bl printf
/* 00006608 48000018 */ b lbl_00006620
lbl_0000660C:
/* 0000660C 4BFF9B7D */ bl empty_load_queue
/* 00006610 807F003C */ lwz r3, 0x3c(r31)
/* 00006614 4BFF9B75 */ bl preload_stage_files
/* 00006618 38000001 */ li r0, 1
/* 0000661C 901F00C0 */ stw r0, 0xc0(r31)
lbl_00006620:
/* 00006620 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00006624 80A30000 */ lwz r5, lbl_802F1FAC@l(r3)
/* 00006628 3C800000 */ lis r4, lbl_8027CE24@ha
/* 0000662C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006630 38050001 */ addi r0, r5, 1
/* 00006634 54051838 */ slwi r5, r0, 3
/* 00006638 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 0000663C 7C002A14 */ add r0, r0, r5
/* 00006640 90030000 */ stw r0, lbl_802F1FB4@l(r3)
/* 00006644 48003210 */ b lbl_00009854
lbl_00006648:
/* 00006648 38600006 */ li r3, 6
/* 0000664C 4BFF9F89 */ bl lbl_000005D4
/* 00006650 2C030000 */ cmpwi r3, 0
/* 00006654 418200FC */ beq lbl_00006750
/* 00006658 38600065 */ li r3, 0x65
/* 0000665C 4BFF9B2D */ bl u_play_sound_0
/* 00006660 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00006664 38A30000 */ addi r5, r3, lbl_802F1FAC@l
/* 00006668 80850000 */ lwz r4, 0(r5)
/* 0000666C 3C600000 */ lis r3, lbl_802F1FB0@ha
/* 00006670 38040001 */ addi r0, r4, 1
/* 00006674 90050000 */ stw r0, 0(r5)
/* 00006678 80A50000 */ lwz r5, 0(r5)
/* 0000667C 80E30000 */ lwz r7, lbl_802F1FB0@l(r3)
/* 00006680 7C053800 */ cmpw r5, r7
/* 00006684 4080003C */ bge lbl_000066C0
/* 00006688 3C600000 */ lis r3, lbl_8027CE24@ha
/* 0000668C 38630000 */ addi r3, r3, lbl_8027CE24@l
/* 00006690 54A41838 */ slwi r4, r5, 3
/* 00006694 7CC32214 */ add r6, r3, r4
/* 00006698 AC060002 */ lhau r0, 2(r6)
/* 0000669C 2C000002 */ cmpwi r0, 2
/* 000066A0 40810020 */ ble lbl_000066C0
/* 000066A4 7C632214 */ add r3, r3, r4
/* 000066A8 A803FFFA */ lha r0, -6(r3)
/* 000066AC B0060000 */ sth r0, 0(r6)
/* 000066B0 A803FFF8 */ lha r0, -8(r3)
/* 000066B4 B0030000 */ sth r0, 0(r3)
/* 000066B8 8003FFFC */ lwz r0, -4(r3)
/* 000066BC 90030004 */ stw r0, 4(r3)
lbl_000066C0:
/* 000066C0 7C053800 */ cmpw r5, r7
/* 000066C4 40800120 */ bge lbl_000067E4
/* 000066C8 3C800000 */ lis r4, lbl_8027CE24@ha
/* 000066CC 54A51838 */ slwi r5, r5, 3
/* 000066D0 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 000066D4 7C002A14 */ add r0, r0, r5
/* 000066D8 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000066DC 94030000 */ stwu r0, lbl_802F1FB4@l(r3)
/* 000066E0 80A30000 */ lwz r5, 0(r3)
/* 000066E4 A8650002 */ lha r3, 2(r5)
/* 000066E8 A8850000 */ lha r4, 0(r5)
/* 000066EC 80A50004 */ lwz r5, 4(r5)
/* 000066F0 4BFF9A99 */ bl floor_to_stage_id
/* 000066F4 907F003C */ stw r3, 0x3c(r31)
/* 000066F8 801F003C */ lwz r0, 0x3c(r31)
/* 000066FC 2C000000 */ cmpwi r0, 0
/* 00006700 40820014 */ bne lbl_00006714
/* 00006704 387E0078 */ addi r3, r30, 0x78
/* 00006708 4CC63182 */ crclr 6
/* 0000670C 4BFF9A7D */ bl printf
/* 00006710 48000018 */ b lbl_00006728
lbl_00006714:
/* 00006714 4BFF9A75 */ bl empty_load_queue
/* 00006718 807F003C */ lwz r3, 0x3c(r31)
/* 0000671C 4BFF9A6D */ bl preload_stage_files
/* 00006720 38000001 */ li r0, 1
/* 00006724 901F00C0 */ stw r0, 0xc0(r31)
lbl_00006728:
/* 00006728 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 0000672C 80A30000 */ lwz r5, lbl_802F1FAC@l(r3)
/* 00006730 3C800000 */ lis r4, lbl_8027CE24@ha
/* 00006734 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006738 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000673C 54051838 */ slwi r5, r0, 3
/* 00006740 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 00006744 7C002A14 */ add r0, r0, r5
/* 00006748 90030000 */ stw r0, lbl_802F1FB4@l(r3)
/* 0000674C 48000098 */ b lbl_000067E4
lbl_00006750:
/* 00006750 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 00006754 39E30000 */ addi r15, r3, lbl_802F1FB4@l
/* 00006758 80AF0000 */ lwz r5, 0(r15)
/* 0000675C A8850000 */ lha r4, 0(r5)
/* 00006760 2C040001 */ cmpwi r4, 1
/* 00006764 41800080 */ blt lbl_000067E4
/* 00006768 7C04A800 */ cmpw r4, r21
/* 0000676C 41810078 */ bgt lbl_000067E4
/* 00006770 A8650002 */ lha r3, 2(r5)
/* 00006774 80A50004 */ lwz r5, 4(r5)
/* 00006778 4BFF9A11 */ bl is_floor_visited
/* 0000677C 2C030000 */ cmpwi r3, 0
/* 00006780 41820064 */ beq lbl_000067E4
/* 00006784 80AF0000 */ lwz r5, 0(r15)
/* 00006788 A8850000 */ lha r4, 0(r5)
/* 0000678C 7C162000 */ cmpw r22, r4
/* 00006790 40820014 */ bne lbl_000067A4
/* 00006794 2C180000 */ cmpwi r24, 0
/* 00006798 4082000C */ bne lbl_000067A4
/* 0000679C 2C1A0000 */ cmpwi r26, 0
/* 000067A0 41820044 */ beq lbl_000067E4
lbl_000067A4:
/* 000067A4 A8650002 */ lha r3, 2(r5)
/* 000067A8 80A50004 */ lwz r5, 4(r5)
/* 000067AC 4BFF99DD */ bl floor_to_stage_id
/* 000067B0 907F003C */ stw r3, 0x3c(r31)
/* 000067B4 801F003C */ lwz r0, 0x3c(r31)
/* 000067B8 2C000000 */ cmpwi r0, 0
/* 000067BC 40820014 */ bne lbl_000067D0
/* 000067C0 387E0078 */ addi r3, r30, 0x78
/* 000067C4 4CC63182 */ crclr 6
/* 000067C8 4BFF99C1 */ bl printf
/* 000067CC 48000018 */ b lbl_000067E4
lbl_000067D0:
/* 000067D0 4BFF99B9 */ bl empty_load_queue
/* 000067D4 807F003C */ lwz r3, 0x3c(r31)
/* 000067D8 4BFF99B1 */ bl preload_stage_files
/* 000067DC 38000001 */ li r0, 1
/* 000067E0 901F00C0 */ stw r0, 0xc0(r31)
lbl_000067E4:
/* 000067E4 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 000067E8 38630000 */ addi r3, r3, lbl_802F1FB4@l
/* 000067EC 80630000 */ lwz r3, 0(r3)
/* 000067F0 80830004 */ lwz r4, 4(r3)
/* 000067F4 A8A30002 */ lha r5, 2(r3)
/* 000067F8 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 000067FC 41820008 */ beq lbl_00006804
/* 00006800 38A50003 */ addi r5, r5, 3
lbl_00006804:
/* 00006804 548006F7 */ rlwinm. r0, r4, 0, 0x1b, 0x1b
/* 00006808 41820008 */ beq lbl_00006810
/* 0000680C 38A50003 */ addi r5, r5, 3
lbl_00006810:
/* 00006810 54A0103A */ slwi r0, r5, 2
/* 00006814 A8A30000 */ lha r5, 0(r3)
/* 00006818 7C9F0214 */ add r4, r31, r0
/* 0000681C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00006820 90A40018 */ stw r5, 0x18(r4)
/* 00006824 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00006828 A803000C */ lha r0, 0xc(r3)
/* 0000682C 39E00001 */ li r15, 1
/* 00006830 2C000017 */ cmpwi r0, 0x17
/* 00006834 41820008 */ beq lbl_0000683C
/* 00006838 48000008 */ b lbl_00006840
lbl_0000683C:
/* 0000683C 39E00000 */ li r15, 0
lbl_00006840:
/* 00006840 38600007 */ li r3, 7
/* 00006844 4BFF9D91 */ bl lbl_000005D4
/* 00006848 2C030000 */ cmpwi r3, 0
/* 0000684C 418201D4 */ beq lbl_00006A20
/* 00006850 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00006854 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 00006858 2C000000 */ cmpwi r0, 0
/* 0000685C 408201C4 */ bne lbl_00006A20
/* 00006860 2C0F0000 */ cmpwi r15, 0
/* 00006864 418201BC */ beq lbl_00006A20
/* 00006868 3C600000 */ lis r3, modeCtrl@ha
/* 0000686C 38630000 */ addi r3, r3, modeCtrl@l
/* 00006870 80030028 */ lwz r0, 0x28(r3)
/* 00006874 2C000002 */ cmpwi r0, 2
/* 00006878 41820014 */ beq lbl_0000688C
/* 0000687C 40802FD8 */ bge lbl_00009854
/* 00006880 2C000001 */ cmpwi r0, 1
/* 00006884 408000AC */ bge lbl_00006930
/* 00006888 48002FCC */ b lbl_00009854
lbl_0000688C:
/* 0000688C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00006890 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00006894 38000001 */ li r0, 1
/* 00006898 90030008 */ stw r0, 8(r3)
/* 0000689C 38600018 */ li r3, 0x18
/* 000068A0 4BFF98E9 */ bl find_sprite_with_tag
/* 000068A4 28030000 */ cmplwi r3, 0
/* 000068A8 4182000C */ beq lbl_000068B4
/* 000068AC 38000000 */ li r0, 0
/* 000068B0 90030048 */ stw r0, 0x48(r3)
lbl_000068B4:
/* 000068B4 38600019 */ li r3, 0x19
/* 000068B8 4BFF98D1 */ bl find_sprite_with_tag
/* 000068BC 28030000 */ cmplwi r3, 0
/* 000068C0 4182000C */ beq lbl_000068CC
/* 000068C4 38000000 */ li r0, 0
/* 000068C8 90030048 */ stw r0, 0x48(r3)
lbl_000068CC:
/* 000068CC 3860001B */ li r3, 0x1b
/* 000068D0 4BFF98B9 */ bl find_sprite_with_tag
/* 000068D4 28030000 */ cmplwi r3, 0
/* 000068D8 4182000C */ beq lbl_000068E4
/* 000068DC 38000003 */ li r0, 3
/* 000068E0 90030048 */ stw r0, 0x48(r3)
lbl_000068E4:
/* 000068E4 3860001C */ li r3, 0x1c
/* 000068E8 4BFF98A1 */ bl find_sprite_with_tag
/* 000068EC 28030000 */ cmplwi r3, 0
/* 000068F0 4182000C */ beq lbl_000068FC
/* 000068F4 38000003 */ li r0, 3
/* 000068F8 90030048 */ stw r0, 0x48(r3)
lbl_000068FC:
/* 000068FC 3C600000 */ lis r3, lbl_801EED50@ha
/* 00006900 88030000 */ lbz r0, lbl_801EED50@l(r3)
/* 00006904 3C800000 */ lis r4, lbl_802F1FB0@ha
/* 00006908 3C600000 */ lis r3, lbl_8027CE24@ha
/* 0000690C 7C000774 */ extsb r0, r0
/* 00006910 90040000 */ stw r0, lbl_802F1FB0@l(r4)
/* 00006914 38830000 */ addi r4, r3, lbl_8027CE24@l
/* 00006918 3CA00000 */ lis r5, lbl_802F1C04@ha
/* 0000691C 80640000 */ lwz r3, 0(r4)
/* 00006920 80040004 */ lwz r0, 4(r4)
/* 00006924 94650000 */ stwu r3, lbl_802F1C04@l(r5)
/* 00006928 90050004 */ stw r0, 4(r5)
/* 0000692C 48002F28 */ b lbl_00009854
lbl_00006930:
/* 00006930 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00006934 38000018 */ li r0, 0x18
/* 00006938 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 0000693C 3860006B */ li r3, 0x6b
/* 00006940 4BFF9849 */ bl u_play_sound_0
/* 00006944 38600017 */ li r3, 0x17
/* 00006948 4BFF9841 */ bl find_sprite_with_tag
/* 0000694C 28030000 */ cmplwi r3, 0
/* 00006950 4182000C */ beq lbl_0000695C
/* 00006954 38000000 */ li r0, 0
/* 00006958 90030048 */ stw r0, 0x48(r3)
lbl_0000695C:
/* 0000695C 38600018 */ li r3, 0x18
/* 00006960 4BFF9829 */ bl find_sprite_with_tag
/* 00006964 28030000 */ cmplwi r3, 0
/* 00006968 4182000C */ beq lbl_00006974
/* 0000696C 38000001 */ li r0, 1
/* 00006970 90030048 */ stw r0, 0x48(r3)
lbl_00006974:
/* 00006974 38600019 */ li r3, 0x19
/* 00006978 4BFF9811 */ bl find_sprite_with_tag
/* 0000697C 28030000 */ cmplwi r3, 0
/* 00006980 4182000C */ beq lbl_0000698C
/* 00006984 38000001 */ li r0, 1
/* 00006988 90030048 */ stw r0, 0x48(r3)
lbl_0000698C:
/* 0000698C 3860001B */ li r3, 0x1b
/* 00006990 4BFF97F9 */ bl find_sprite_with_tag
/* 00006994 28030000 */ cmplwi r3, 0
/* 00006998 4182000C */ beq lbl_000069A4
/* 0000699C 38000001 */ li r0, 1
/* 000069A0 90030048 */ stw r0, 0x48(r3)
lbl_000069A4:
/* 000069A4 3860001C */ li r3, 0x1c
/* 000069A8 4BFF97E1 */ bl find_sprite_with_tag
/* 000069AC 28030000 */ cmplwi r3, 0
/* 000069B0 4182000C */ beq lbl_000069BC
/* 000069B4 38000001 */ li r0, 1
/* 000069B8 90030048 */ stw r0, 0x48(r3)
lbl_000069BC:
/* 000069BC 3C600000 */ lis r3, lbl_8027CE24@ha
/* 000069C0 38830000 */ addi r4, r3, lbl_8027CE24@l
/* 000069C4 3CA00000 */ lis r5, lbl_801EED50@ha
/* 000069C8 80640000 */ lwz r3, 0(r4)
/* 000069CC 80040004 */ lwz r0, 4(r4)
/* 000069D0 38A50000 */ addi r5, r5, lbl_801EED50@l
/* 000069D4 90650004 */ stw r3, 4(r5)
/* 000069D8 90050008 */ stw r0, 8(r5)
/* 000069DC 80640008 */ lwz r3, 8(r4)
/* 000069E0 8004000C */ lwz r0, 0xc(r4)
/* 000069E4 9065000C */ stw r3, 0xc(r5)
/* 000069E8 90050010 */ stw r0, 0x10(r5)
/* 000069EC 80640010 */ lwz r3, 0x10(r4)
/* 000069F0 80040014 */ lwz r0, 0x14(r4)
/* 000069F4 90650014 */ stw r3, 0x14(r5)
/* 000069F8 90050018 */ stw r0, 0x18(r5)
/* 000069FC 80640018 */ lwz r3, 0x18(r4)
/* 00006A00 8004001C */ lwz r0, 0x1c(r4)
/* 00006A04 9065001C */ stw r3, 0x1c(r5)
/* 00006A08 90050020 */ stw r0, 0x20(r5)
/* 00006A0C 80640020 */ lwz r3, 0x20(r4)
/* 00006A10 80040024 */ lwz r0, 0x24(r4)
/* 00006A14 90650024 */ stw r3, 0x24(r5)
/* 00006A18 90050028 */ stw r0, 0x28(r5)
/* 00006A1C 48002E38 */ b lbl_00009854
lbl_00006A20:
/* 00006A20 3C600000 */ lis r3, lbl_802F1FB0@ha
/* 00006A24 39E30000 */ addi r15, r3, lbl_802F1FB0@l
/* 00006A28 3C800000 */ lis r4, lbl_802F1FAC@ha
/* 00006A2C 800F0000 */ lwz r0, 0(r15)
/* 00006A30 80640000 */ lwz r3, lbl_802F1FAC@l(r4)
/* 00006A34 7C030000 */ cmpw r3, r0
/* 00006A38 41802E1C */ blt lbl_00009854
/* 00006A3C 4BFF974D */ bl func_80067310
/* 00006A40 3C800000 */ lis r4, u_isCompetitionModeCourse@ha
/* 00006A44 38000001 */ li r0, 1
/* 00006A48 3C600000 */ lis r3, modeCtrl@ha
/* 00006A4C 90040000 */ stw r0, u_isCompetitionModeCourse@l(r4)
/* 00006A50 38630000 */ addi r3, r3, modeCtrl@l
/* 00006A54 80030028 */ lwz r0, 0x28(r3)
/* 00006A58 3A030028 */ addi r16, r3, 0x28
/* 00006A5C 2C000001 */ cmpwi r0, 1
/* 00006A60 40820100 */ bne lbl_00006B60
/* 00006A64 808F0000 */ lwz r4, 0(r15)
/* 00006A68 38600000 */ li r3, 0
/* 00006A6C 2C040000 */ cmpwi r4, 0
/* 00006A70 40810110 */ ble lbl_00006B80
/* 00006A74 2C040008 */ cmpwi r4, 8
/* 00006A78 38C4FFF8 */ addi r6, r4, -8  ;# fixed addi
/* 00006A7C 40812DB0 */ ble lbl_0000982C
/* 00006A80 38060007 */ addi r0, r6, 7
/* 00006A84 5400E8FE */ srwi r0, r0, 3
/* 00006A88 3CA00000 */ lis r5, lbl_8027CE24@ha
/* 00006A8C 7C0903A6 */ mtctr r0
/* 00006A90 3C800000 */ lis r4, lbl_801EED50@ha
/* 00006A94 2C060000 */ cmpwi r6, 0
/* 00006A98 38A50000 */ addi r5, r5, lbl_8027CE24@l
/* 00006A9C 38E40000 */ addi r7, r4, lbl_801EED50@l
/* 00006AA0 40812D8C */ ble lbl_0000982C
lbl_00006AA4:
/* 00006AA4 80850000 */ lwz r4, 0(r5)
/* 00006AA8 38630008 */ addi r3, r3, 8
/* 00006AAC 80050004 */ lwz r0, 4(r5)
/* 00006AB0 90870004 */ stw r4, 4(r7)
/* 00006AB4 90070008 */ stw r0, 8(r7)
/* 00006AB8 80850008 */ lwz r4, 8(r5)
/* 00006ABC 8005000C */ lwz r0, 0xc(r5)
/* 00006AC0 9087000C */ stw r4, 0xc(r7)
/* 00006AC4 90070010 */ stw r0, 0x10(r7)
/* 00006AC8 80850010 */ lwz r4, 0x10(r5)
/* 00006ACC 80050014 */ lwz r0, 0x14(r5)
/* 00006AD0 90870014 */ stw r4, 0x14(r7)
/* 00006AD4 90070018 */ stw r0, 0x18(r7)
/* 00006AD8 80850018 */ lwz r4, 0x18(r5)
/* 00006ADC 8005001C */ lwz r0, 0x1c(r5)
/* 00006AE0 9087001C */ stw r4, 0x1c(r7)
/* 00006AE4 90070020 */ stw r0, 0x20(r7)
/* 00006AE8 80850020 */ lwz r4, 0x20(r5)
/* 00006AEC 80050024 */ lwz r0, 0x24(r5)
/* 00006AF0 90870024 */ stw r4, 0x24(r7)
/* 00006AF4 90070028 */ stw r0, 0x28(r7)
/* 00006AF8 80850028 */ lwz r4, 0x28(r5)
/* 00006AFC 8005002C */ lwz r0, 0x2c(r5)
/* 00006B00 9087002C */ stw r4, 0x2c(r7)
/* 00006B04 90070030 */ stw r0, 0x30(r7)
/* 00006B08 80850030 */ lwz r4, 0x30(r5)
/* 00006B0C 80050034 */ lwz r0, 0x34(r5)
/* 00006B10 90870034 */ stw r4, 0x34(r7)
/* 00006B14 90070038 */ stw r0, 0x38(r7)
/* 00006B18 80850038 */ lwz r4, 0x38(r5)
/* 00006B1C 8005003C */ lwz r0, 0x3c(r5)
/* 00006B20 38A50040 */ addi r5, r5, 0x40
/* 00006B24 9087003C */ stw r4, 0x3c(r7)
/* 00006B28 94070040 */ stwu r0, 0x40(r7)
/* 00006B2C 4200FF78 */ bdnz lbl_00006AA4
/* 00006B30 48002CFC */ b lbl_0000982C
lbl_00006B34:
/* 00006B34 7C033850 */ subf r0, r3, r7
/* 00006B38 7C033800 */ cmpw r3, r7
/* 00006B3C 7C0903A6 */ mtctr r0
/* 00006B40 40800040 */ bge lbl_00006B80
lbl_00006B44:
/* 00006B44 80640000 */ lwz r3, 0(r4)
/* 00006B48 80040004 */ lwz r0, 4(r4)
/* 00006B4C 38840008 */ addi r4, r4, 8
/* 00006B50 90650004 */ stw r3, 4(r5)
/* 00006B54 94050008 */ stwu r0, 8(r5)
/* 00006B58 4200FFEC */ bdnz lbl_00006B44
/* 00006B5C 48000024 */ b lbl_00006B80
lbl_00006B60:
/* 00006B60 3C600000 */ lis r3, lbl_8027CE24@ha
/* 00006B64 38830000 */ addi r4, r3, lbl_8027CE24@l
/* 00006B68 3CA00000 */ lis r5, lbl_802F1C04@ha
/* 00006B6C 80640000 */ lwz r3, 0(r4)
/* 00006B70 80040004 */ lwz r0, 4(r4)
/* 00006B74 38850000 */ addi r4, r5, lbl_802F1C04@l
/* 00006B78 90640000 */ stw r3, 0(r4)
/* 00006B7C 90040004 */ stw r0, 4(r4)
lbl_00006B80:
/* 00006B80 38600019 */ li r3, 0x19
/* 00006B84 4BFF9605 */ bl find_sprite_with_tag
/* 00006B88 28030000 */ cmplwi r3, 0
/* 00006B8C 4182000C */ beq lbl_00006B98
/* 00006B90 38000001 */ li r0, 1
/* 00006B94 90030048 */ stw r0, 0x48(r3)
lbl_00006B98:
/* 00006B98 80100000 */ lwz r0, 0(r16)
/* 00006B9C 2C000002 */ cmpwi r0, 2
/* 00006BA0 41820028 */ beq lbl_00006BC8
/* 00006BA4 40802CB0 */ bge lbl_00009854
/* 00006BA8 2C000001 */ cmpwi r0, 1
/* 00006BAC 40800008 */ bge lbl_00006BB4
/* 00006BB0 48002CA4 */ b lbl_00009854
lbl_00006BB4:
/* 00006BB4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00006BB8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00006BBC 3800001A */ li r0, 0x1a
/* 00006BC0 90030004 */ stw r0, 4(r3)
/* 00006BC4 48002C90 */ b lbl_00009854
lbl_00006BC8:
/* 00006BC8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00006BCC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00006BD0 38000033 */ li r0, 0x33
/* 00006BD4 90030004 */ stw r0, 4(r3)
/* 00006BD8 48002C7C */ b lbl_00009854
lbl_00006BDC:
/* 00006BDC 3860022D */ li r3, 0x22d
/* 00006BE0 4BFF95A9 */ bl u_play_sound_0
/* 00006BE4 3C600000 */ lis r3, currStageId@ha
/* 00006BE8 A8030000 */ lha r0, currStageId@l(r3)
/* 00006BEC 38600018 */ li r3, 0x18
/* 00006BF0 901F003C */ stw r0, 0x3c(r31)
/* 00006BF4 4BFF9595 */ bl find_sprite_with_tag
/* 00006BF8 28030000 */ cmplwi r3, 0
/* 00006BFC 4182000C */ beq lbl_00006C08
/* 00006C00 38000000 */ li r0, 0
/* 00006C04 90030048 */ stw r0, 0x48(r3)
lbl_00006C08:
/* 00006C08 38600019 */ li r3, 0x19
/* 00006C0C 4BFF957D */ bl find_sprite_with_tag
/* 00006C10 28030000 */ cmplwi r3, 0
/* 00006C14 4182000C */ beq lbl_00006C20
/* 00006C18 38000000 */ li r0, 0
/* 00006C1C 90030048 */ stw r0, 0x48(r3)
lbl_00006C20:
/* 00006C20 3860001B */ li r3, 0x1b
/* 00006C24 4BFF9565 */ bl find_sprite_with_tag
/* 00006C28 28030000 */ cmplwi r3, 0
/* 00006C2C 4182000C */ beq lbl_00006C38
/* 00006C30 38000003 */ li r0, 3
/* 00006C34 90030048 */ stw r0, 0x48(r3)
lbl_00006C38:
/* 00006C38 3860001C */ li r3, 0x1c
/* 00006C3C 4BFF954D */ bl find_sprite_with_tag
/* 00006C40 28030000 */ cmplwi r3, 0
/* 00006C44 4182000C */ beq lbl_00006C50
/* 00006C48 38000003 */ li r0, 3
/* 00006C4C 90030048 */ stw r0, 0x48(r3)
lbl_00006C50:
/* 00006C50 38600016 */ li r3, 0x16
/* 00006C54 4BFF9535 */ bl find_sprite_with_tag
/* 00006C58 28030000 */ cmplwi r3, 0
/* 00006C5C 4182000C */ beq lbl_00006C68
/* 00006C60 38000006 */ li r0, 6
/* 00006C64 90030048 */ stw r0, 0x48(r3)
lbl_00006C68:
/* 00006C68 3860001A */ li r3, 0x1a
/* 00006C6C 4BFF951D */ bl find_sprite_with_tag
/* 00006C70 28030000 */ cmplwi r3, 0
/* 00006C74 4182000C */ beq lbl_00006C80
/* 00006C78 38000001 */ li r0, 1
/* 00006C7C 90030048 */ stw r0, 0x48(r3)
lbl_00006C80:
/* 00006C80 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00006C84 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00006C88 38000006 */ li r0, 6
/* 00006C8C 900400F4 */ stw r0, 0xf4(r4)
/* 00006C90 38000001 */ li r0, 1
/* 00006C94 38600000 */ li r3, 0
/* 00006C98 901F0040 */ stw r0, 0x40(r31)
/* 00006C9C 3800001B */ li r0, 0x1b
/* 00006CA0 907F0044 */ stw r3, 0x44(r31)
/* 00006CA4 907F0048 */ stw r3, 0x48(r31)
/* 00006CA8 90040000 */ stw r0, 0(r4)
/* 00006CAC 48002BA8 */ b lbl_00009854
lbl_00006CB0:
/* 00006CB0 3A720108 */ addi r19, r18, 0x108
/* 00006CB4 80120108 */ lwz r0, 0x108(r18)
/* 00006CB8 3C600000 */ lis r3, lbl_801EED50@ha
/* 00006CBC 3AA30000 */ addi r21, r3, lbl_801EED50@l
/* 00006CC0 2C000000 */ cmpwi r0, 0
/* 00006CC4 4082003C */ bne lbl_00006D00
/* 00006CC8 38600006 */ li r3, 6
/* 00006CCC 4BFF9909 */ bl lbl_000005D4
/* 00006CD0 2C030000 */ cmpwi r3, 0
/* 00006CD4 41820020 */ beq lbl_00006CF4
/* 00006CD8 801200F4 */ lwz r0, 0xf4(r18)
/* 00006CDC 2C000005 */ cmpwi r0, 5
/* 00006CE0 40820014 */ bne lbl_00006CF4
/* 00006CE4 38950000 */ addi r4, r21, 0
/* 00006CE8 387F0050 */ addi r3, r31, 0x50
/* 00006CEC 38A00038 */ li r5, 0x38
/* 00006CF0 4BFF9499 */ bl memcpy
lbl_00006CF4:
/* 00006CF4 38600006 */ li r3, 6
/* 00006CF8 4BFFBDAD */ bl lbl_00002AA4
/* 00006CFC 48000368 */ b lbl_00007064
lbl_00006D00:
/* 00006D00 3A12010C */ addi r16, r18, 0x10c
/* 00006D04 38000000 */ li r0, 0
/* 00006D08 9812010C */ stb r0, 0x10c(r18)
/* 00006D0C 38600006 */ li r3, 6
/* 00006D10 4BFFBD95 */ bl lbl_00002AA4
/* 00006D14 38600007 */ li r3, 7
/* 00006D18 4BFF98BD */ bl lbl_000005D4
/* 00006D1C 2C030000 */ cmpwi r3, 0
/* 00006D20 41820018 */ beq lbl_00006D38
/* 00006D24 38750000 */ addi r3, r21, 0
/* 00006D28 389F0050 */ addi r4, r31, 0x50
/* 00006D2C 38A00038 */ li r5, 0x38
/* 00006D30 4BFF9459 */ bl memcpy
/* 00006D34 48002B20 */ b lbl_00009854
lbl_00006D38:
/* 00006D38 38600006 */ li r3, 6
/* 00006D3C 4BFF9899 */ bl lbl_000005D4
/* 00006D40 2C030000 */ cmpwi r3, 0
/* 00006D44 40822B10 */ bne lbl_00009854
/* 00006D48 3A3200F4 */ addi r17, r18, 0xf4
/* 00006D4C 801200F4 */ lwz r0, 0xf4(r18)
/* 00006D50 2C000003 */ cmpwi r0, 3
/* 00006D54 4182028C */ beq lbl_00006FE0
/* 00006D58 40800010 */ bge lbl_00006D68
/* 00006D5C 2C000000 */ cmpwi r0, 0
/* 00006D60 40800014 */ bge lbl_00006D74
/* 00006D64 48000300 */ b lbl_00007064
lbl_00006D68:
/* 00006D68 2C000005 */ cmpwi r0, 5
/* 00006D6C 408002F8 */ bge lbl_00007064
/* 00006D70 480002B4 */ b lbl_00007024
lbl_00006D74:
/* 00006D74 7C750214 */ add r3, r21, r0
/* 00006D78 88630031 */ lbz r3, 0x31(r3)
/* 00006D7C 20000003 */ subfic r0, r0, 3
/* 00006D80 7C630774 */ extsb r3, r3
/* 00006D84 7C030000 */ cmpw r3, r0
/* 00006D88 41820010 */ beq lbl_00006D98
/* 00006D8C 88100000 */ lbz r0, 0(r16)
/* 00006D90 60000001 */ ori r0, r0, 1
/* 00006D94 98100000 */ stb r0, 0(r16)
lbl_00006D98:
/* 00006D98 80110000 */ lwz r0, 0(r17)
/* 00006D9C 7C750214 */ add r3, r21, r0
/* 00006DA0 88630031 */ lbz r3, 0x31(r3)
/* 00006DA4 20000032 */ subfic r0, r0, 0x32
/* 00006DA8 7C630774 */ extsb r3, r3
/* 00006DAC 7C030000 */ cmpw r3, r0
/* 00006DB0 41820010 */ beq lbl_00006DC0
/* 00006DB4 88100000 */ lbz r0, 0(r16)
/* 00006DB8 60000002 */ ori r0, r0, 2
/* 00006DBC 98100000 */ stb r0, 0(r16)
lbl_00006DC0:
/* 00006DC0 38600001 */ li r3, 1
/* 00006DC4 4BFF9811 */ bl lbl_000005D4
/* 00006DC8 2C030000 */ cmpwi r3, 0
/* 00006DCC 40820014 */ bne lbl_00006DE0
/* 00006DD0 38600000 */ li r3, 0
/* 00006DD4 4BFF9801 */ bl lbl_000005D4
/* 00006DD8 2C030000 */ cmpwi r3, 0
/* 00006DDC 418200BC */ beq lbl_00006E98
lbl_00006DE0:
/* 00006DE0 80110000 */ lwz r0, 0(r17)
/* 00006DE4 38600001 */ li r3, 1
/* 00006DE8 7C950214 */ add r4, r21, r0
/* 00006DEC 89E40031 */ lbz r15, 0x31(r4)
/* 00006DF0 7DEF0774 */ extsb r15, r15
/* 00006DF4 4BFF97E1 */ bl lbl_000005D4
/* 00006DF8 2C030000 */ cmpwi r3, 0
/* 00006DFC 4182001C */ beq lbl_00006E18
/* 00006E00 80110000 */ lwz r0, 0(r17)
/* 00006E04 7C950214 */ add r4, r21, r0
/* 00006E08 88640031 */ lbz r3, 0x31(r4)
/* 00006E0C 38030001 */ addi r0, r3, 1
/* 00006E10 98040031 */ stb r0, 0x31(r4)
/* 00006E14 48000028 */ b lbl_00006E3C
lbl_00006E18:
/* 00006E18 38600000 */ li r3, 0
/* 00006E1C 4BFF97B9 */ bl lbl_000005D4
/* 00006E20 2C030000 */ cmpwi r3, 0
/* 00006E24 41820018 */ beq lbl_00006E3C
/* 00006E28 80110000 */ lwz r0, 0(r17)
/* 00006E2C 7C950214 */ add r4, r21, r0
/* 00006E30 88640031 */ lbz r3, 0x31(r4)
/* 00006E34 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00006E38 98040031 */ stb r0, 0x31(r4)
lbl_00006E3C:
/* 00006E3C 80110000 */ lwz r0, 0(r17)
/* 00006E40 7CB50214 */ add r5, r21, r0
/* 00006E44 8C650031 */ lbzu r3, 0x31(r5)
/* 00006E48 20800003 */ subfic r4, r0, 3
/* 00006E4C 7C630774 */ extsb r3, r3
/* 00006E50 7C032000 */ cmpw r3, r4
/* 00006E54 40800008 */ bge lbl_00006E5C
/* 00006E58 48000018 */ b lbl_00006E70
lbl_00006E5C:
/* 00006E5C 20800032 */ subfic r4, r0, 0x32
/* 00006E60 7C032000 */ cmpw r3, r4
/* 00006E64 40810008 */ ble lbl_00006E6C
/* 00006E68 48000008 */ b lbl_00006E70
lbl_00006E6C:
/* 00006E6C 7C641B78 */ mr r4, r3
lbl_00006E70:
/* 00006E70 7C800774 */ extsb r0, r4
/* 00006E74 98050000 */ stb r0, 0(r5)
/* 00006E78 80110000 */ lwz r0, 0(r17)
/* 00006E7C 7C750214 */ add r3, r21, r0
/* 00006E80 88030031 */ lbz r0, 0x31(r3)
/* 00006E84 7C000774 */ extsb r0, r0
/* 00006E88 7C0F0000 */ cmpw r15, r0
/* 00006E8C 4182000C */ beq lbl_00006E98
/* 00006E90 38600065 */ li r3, 0x65
/* 00006E94 4BFF92F5 */ bl u_play_sound_0
lbl_00006E98:
/* 00006E98 38600001 */ li r3, 1
/* 00006E9C 4BFF9739 */ bl lbl_000005D4
/* 00006EA0 2C030000 */ cmpwi r3, 0
/* 00006EA4 41820098 */ beq lbl_00006F3C
/* 00006EA8 88150034 */ lbz r0, 0x34(r21)
/* 00006EAC 38B50033 */ addi r5, r21, 0x33
/* 00006EB0 88950033 */ lbz r4, 0x33(r21)
/* 00006EB4 7C030774 */ extsb r3, r0
/* 00006EB8 7C840774 */ extsb r4, r4
/* 00006EBC 38030001 */ addi r0, r3, 1
/* 00006EC0 7C040000 */ cmpw r4, r0
/* 00006EC4 40810008 */ ble lbl_00006ECC
/* 00006EC8 48000008 */ b lbl_00006ED0
lbl_00006ECC:
/* 00006ECC 7C040378 */ mr r4, r0
lbl_00006ED0:
/* 00006ED0 7C800774 */ extsb r0, r4
/* 00006ED4 98050000 */ stb r0, 0(r5)
/* 00006ED8 38B50032 */ addi r5, r21, 0x32
/* 00006EDC 88150033 */ lbz r0, 0x33(r21)
/* 00006EE0 88950032 */ lbz r4, 0x32(r21)
/* 00006EE4 7C030774 */ extsb r3, r0
/* 00006EE8 7C840774 */ extsb r4, r4
/* 00006EEC 38030001 */ addi r0, r3, 1
/* 00006EF0 7C040000 */ cmpw r4, r0
/* 00006EF4 40810008 */ ble lbl_00006EFC
/* 00006EF8 48000008 */ b lbl_00006F00
lbl_00006EFC:
/* 00006EFC 7C040378 */ mr r4, r0
lbl_00006F00:
/* 00006F00 7C800774 */ extsb r0, r4
/* 00006F04 98050000 */ stb r0, 0(r5)
/* 00006F08 38B50031 */ addi r5, r21, 0x31
/* 00006F0C 88150032 */ lbz r0, 0x32(r21)
/* 00006F10 88950031 */ lbz r4, 0x31(r21)
/* 00006F14 7C030774 */ extsb r3, r0
/* 00006F18 7C840774 */ extsb r4, r4
/* 00006F1C 38030001 */ addi r0, r3, 1
/* 00006F20 7C040000 */ cmpw r4, r0
/* 00006F24 40810008 */ ble lbl_00006F2C
/* 00006F28 48000008 */ b lbl_00006F30
lbl_00006F2C:
/* 00006F2C 7C040378 */ mr r4, r0
lbl_00006F30:
/* 00006F30 7C800774 */ extsb r0, r4
/* 00006F34 98050000 */ stb r0, 0(r5)
/* 00006F38 4800012C */ b lbl_00007064
lbl_00006F3C:
/* 00006F3C 38600000 */ li r3, 0
/* 00006F40 4BFF9695 */ bl lbl_000005D4
/* 00006F44 2C030000 */ cmpwi r3, 0
/* 00006F48 4182011C */ beq lbl_00007064
/* 00006F4C 88150030 */ lbz r0, 0x30(r21)
/* 00006F50 38B50031 */ addi r5, r21, 0x31
/* 00006F54 88950031 */ lbz r4, 0x31(r21)
/* 00006F58 7C030774 */ extsb r3, r0
/* 00006F5C 7C840774 */ extsb r4, r4
/* 00006F60 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00006F64 7C040000 */ cmpw r4, r0
/* 00006F68 40800008 */ bge lbl_00006F70
/* 00006F6C 48000008 */ b lbl_00006F74
lbl_00006F70:
/* 00006F70 7C040378 */ mr r4, r0
lbl_00006F74:
/* 00006F74 7C800774 */ extsb r0, r4
/* 00006F78 98050000 */ stb r0, 0(r5)
/* 00006F7C 38B50032 */ addi r5, r21, 0x32
/* 00006F80 88150031 */ lbz r0, 0x31(r21)
/* 00006F84 88950032 */ lbz r4, 0x32(r21)
/* 00006F88 7C030774 */ extsb r3, r0
/* 00006F8C 7C840774 */ extsb r4, r4
/* 00006F90 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00006F94 7C040000 */ cmpw r4, r0
/* 00006F98 40800008 */ bge lbl_00006FA0
/* 00006F9C 48000008 */ b lbl_00006FA4
lbl_00006FA0:
/* 00006FA0 7C040378 */ mr r4, r0
lbl_00006FA4:
/* 00006FA4 7C800774 */ extsb r0, r4
/* 00006FA8 98050000 */ stb r0, 0(r5)
/* 00006FAC 38B50033 */ addi r5, r21, 0x33
/* 00006FB0 88150032 */ lbz r0, 0x32(r21)
/* 00006FB4 88950033 */ lbz r4, 0x33(r21)
/* 00006FB8 7C030774 */ extsb r3, r0
/* 00006FBC 7C840774 */ extsb r4, r4
/* 00006FC0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00006FC4 7C040000 */ cmpw r4, r0
/* 00006FC8 40800008 */ bge lbl_00006FD0
/* 00006FCC 48000008 */ b lbl_00006FD4
lbl_00006FD0:
/* 00006FD0 7C040378 */ mr r4, r0
lbl_00006FD4:
/* 00006FD4 7C800774 */ extsb r0, r4
/* 00006FD8 98050000 */ stb r0, 0(r5)
/* 00006FDC 48000088 */ b lbl_00007064
lbl_00006FE0:
/* 00006FE0 88100000 */ lbz r0, 0(r16)
/* 00006FE4 38600001 */ li r3, 1
/* 00006FE8 60000003 */ ori r0, r0, 3
/* 00006FEC 98100000 */ stb r0, 0(r16)
/* 00006FF0 4BFF95E5 */ bl lbl_000005D4
/* 00006FF4 2C030000 */ cmpwi r3, 0
/* 00006FF8 40820014 */ bne lbl_0000700C
/* 00006FFC 38600000 */ li r3, 0
/* 00007000 4BFF95D5 */ bl lbl_000005D4
/* 00007004 2C030000 */ cmpwi r3, 0
/* 00007008 4182005C */ beq lbl_00007064
lbl_0000700C:
/* 0000700C 8015002C */ lwz r0, 0x2c(r21)
/* 00007010 38600065 */ li r3, 0x65
/* 00007014 68000800 */ xori r0, r0, 0x800
/* 00007018 9015002C */ stw r0, 0x2c(r21)
/* 0000701C 4BFF916D */ bl u_play_sound_0
/* 00007020 48000044 */ b lbl_00007064
lbl_00007024:
/* 00007024 88100000 */ lbz r0, 0(r16)
/* 00007028 38600001 */ li r3, 1
/* 0000702C 60000003 */ ori r0, r0, 3
/* 00007030 98100000 */ stb r0, 0(r16)
/* 00007034 4BFF95A1 */ bl lbl_000005D4
/* 00007038 2C030000 */ cmpwi r3, 0
/* 0000703C 40820014 */ bne lbl_00007050
/* 00007040 38600000 */ li r3, 0
/* 00007044 4BFF9591 */ bl lbl_000005D4
/* 00007048 2C030000 */ cmpwi r3, 0
/* 0000704C 41820018 */ beq lbl_00007064
lbl_00007050:
/* 00007050 8015002C */ lwz r0, 0x2c(r21)
/* 00007054 38600065 */ li r3, 0x65
/* 00007058 68001000 */ xori r0, r0, 0x1000
/* 0000705C 9015002C */ stw r0, 0x2c(r21)
/* 00007060 4BFF9129 */ bl u_play_sound_0
lbl_00007064:
/* 00007064 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007068 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000706C 3A0300F4 */ addi r16, r3, 0xf4
/* 00007070 808300F4 */ lwz r4, 0xf4(r3)
/* 00007074 38600017 */ li r3, 0x17
/* 00007078 39E4001F */ addi r15, r4, 0x1f
/* 0000707C 4BFF910D */ bl find_sprite_with_tag
/* 00007080 28030000 */ cmplwi r3, 0
/* 00007084 41820008 */ beq lbl_0000708C
/* 00007088 91E30048 */ stw r15, 0x48(r3)
lbl_0000708C:
/* 0000708C 38600007 */ li r3, 7
/* 00007090 4BFF9545 */ bl lbl_000005D4
/* 00007094 2C030000 */ cmpwi r3, 0
/* 00007098 41820078 */ beq lbl_00007110
/* 0000709C 80130000 */ lwz r0, 0(r19)
/* 000070A0 2C000000 */ cmpwi r0, 0
/* 000070A4 4082006C */ bne lbl_00007110
/* 000070A8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000070AC 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 000070B0 38000001 */ li r0, 1
/* 000070B4 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 000070B8 90040008 */ stw r0, 8(r4)
/* 000070BC 38C30000 */ addi r6, r3, lbl_802F1FAC@l
/* 000070C0 80A60000 */ lwz r5, 0(r6)
/* 000070C4 3C600000 */ lis r3, lbl_802F1FA8@ha
/* 000070C8 38830000 */ addi r4, r3, lbl_802F1FA8@l
/* 000070CC 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 000070D0 90060000 */ stw r0, 0(r6)
/* 000070D4 38000002 */ li r0, 2
/* 000070D8 38600017 */ li r3, 0x17
/* 000070DC 90040000 */ stw r0, 0(r4)
/* 000070E0 4BFF90A9 */ bl find_sprite_with_tag
/* 000070E4 28030000 */ cmplwi r3, 0
/* 000070E8 4182000C */ beq lbl_000070F4
/* 000070EC 38000000 */ li r0, 0
/* 000070F0 90030048 */ stw r0, 0x48(r3)
lbl_000070F4:
/* 000070F4 3860001A */ li r3, 0x1a
/* 000070F8 4BFF9091 */ bl find_sprite_with_tag
/* 000070FC 28030000 */ cmplwi r3, 0
/* 00007100 41822754 */ beq lbl_00009854
/* 00007104 38000000 */ li r0, 0
/* 00007108 90030048 */ stw r0, 0x48(r3)
/* 0000710C 48002748 */ b lbl_00009854
lbl_00007110:
/* 00007110 80100000 */ lwz r0, 0(r16)
/* 00007114 2C000006 */ cmpwi r0, 6
/* 00007118 4082273C */ bne lbl_00009854
/* 0000711C 38600006 */ li r3, 6
/* 00007120 4BFF94B5 */ bl lbl_000005D4
/* 00007124 2C030000 */ cmpwi r3, 0
/* 00007128 4182272C */ beq lbl_00009854
/* 0000712C 3C600000 */ lis r3, modeCtrl@ha
/* 00007130 38630000 */ addi r3, r3, modeCtrl@l
/* 00007134 38E30008 */ addi r7, r3, 8
/* 00007138 80030008 */ lwz r0, 8(r3)
/* 0000713C 3C800000 */ lis r4, lbl_802F1CB0@ha
/* 00007140 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007144 54000564 */ rlwinm r0, r0, 0, 0x15, 0x12
/* 00007148 90070000 */ stw r0, 0(r7)
/* 0000714C 38A40000 */ addi r5, r4, lbl_802F1CB0@l
/* 00007150 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00007154 80C70000 */ lwz r6, 0(r7)
/* 00007158 38000033 */ li r0, 0x33
/* 0000715C 8095002C */ lwz r4, 0x2c(r21)
/* 00007160 7CC42378 */ or r4, r6, r4
/* 00007164 90870000 */ stw r4, 0(r7)
/* 00007168 88950030 */ lbz r4, 0x30(r21)
/* 0000716C 98850000 */ stb r4, 0(r5)
/* 00007170 88950031 */ lbz r4, 0x31(r21)
/* 00007174 98850001 */ stb r4, 1(r5)
/* 00007178 88950032 */ lbz r4, 0x32(r21)
/* 0000717C 98850002 */ stb r4, 2(r5)
/* 00007180 88950033 */ lbz r4, 0x33(r21)
/* 00007184 98850003 */ stb r4, 3(r5)
/* 00007188 88950034 */ lbz r4, 0x34(r21)
/* 0000718C 98850004 */ stb r4, 4(r5)
/* 00007190 90030004 */ stw r0, 4(r3)
/* 00007194 80070000 */ lwz r0, 0(r7)
/* 00007198 60000004 */ ori r0, r0, 4
/* 0000719C 90070000 */ stw r0, 0(r7)
/* 000071A0 480026B4 */ b lbl_00009854
lbl_000071A4:
/* 000071A4 38600016 */ li r3, 0x16
/* 000071A8 4BFF8FE1 */ bl find_sprite_with_tag
/* 000071AC 28030000 */ cmplwi r3, 0
/* 000071B0 4182000C */ beq lbl_000071BC
/* 000071B4 38000000 */ li r0, 0
/* 000071B8 90030048 */ stw r0, 0x48(r3)
lbl_000071BC:
/* 000071BC 387E023C */ addi r3, r30, 0x23c
/* 000071C0 48003509 */ bl lbl_0000A6C8
/* 000071C4 4BFF8FC5 */ bl empty_load_queue
/* 000071C8 4BFF8FC1 */ bl empty_file_cache
/* 000071CC 387E0250 */ addi r3, r30, 0x250
/* 000071D0 4BFF8FB9 */ bl file_preload
/* 000071D4 387E0260 */ addi r3, r30, 0x260
/* 000071D8 4BFF8FB1 */ bl file_preload
/* 000071DC 387E0270 */ addi r3, r30, 0x270
/* 000071E0 4BFF8FA9 */ bl file_preload
/* 000071E4 387E0280 */ addi r3, r30, 0x280
/* 000071E8 4BFF8FA1 */ bl file_preload
/* 000071EC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000071F0 3800001D */ li r0, 0x1d
/* 000071F4 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 000071F8 4800265C */ b lbl_00009854
lbl_000071FC:
/* 000071FC 3C600000 */ lis r3, lbl_801EED88@ha
/* 00007200 3AA30000 */ addi r21, r3, lbl_801EED88@l
/* 00007204 3875000C */ addi r3, r21, 0xc
/* 00007208 38800000 */ li r4, 0
/* 0000720C 38A00026 */ li r5, 0x26
/* 00007210 38C00042 */ li r6, 0x42
/* 00007214 38E00000 */ li r7, 0
/* 00007218 39000000 */ li r8, 0
/* 0000721C 39200000 */ li r9, 0
/* 00007220 4BFFABF1 */ bl lbl_00001E10
/* 00007224 38600007 */ li r3, 7
/* 00007228 4BFF93AD */ bl lbl_000005D4
/* 0000722C 2C030000 */ cmpwi r3, 0
/* 00007230 41820018 */ beq lbl_00007248
/* 00007234 38600063 */ li r3, 0x63
/* 00007238 4BFF8F51 */ bl destroy_sprite_with_tag
/* 0000723C 38000001 */ li r0, 1
/* 00007240 90120008 */ stw r0, 8(r18)
/* 00007244 48002610 */ b lbl_00009854
lbl_00007248:
/* 00007248 38600006 */ li r3, 6
/* 0000724C 4BFF9389 */ bl lbl_000005D4
/* 00007250 2C030000 */ cmpwi r3, 0
/* 00007254 41822600 */ beq lbl_00009854
/* 00007258 8015000C */ lwz r0, 0xc(r21)
/* 0000725C 2C000001 */ cmpwi r0, 1
/* 00007260 41820040 */ beq lbl_000072A0
/* 00007264 40800010 */ bge lbl_00007274
/* 00007268 2C000000 */ cmpwi r0, 0
/* 0000726C 40800014 */ bge lbl_00007280
/* 00007270 480025E4 */ b lbl_00009854
lbl_00007274:
/* 00007274 2C000003 */ cmpwi r0, 3
/* 00007278 408025DC */ bge lbl_00009854
/* 0000727C 48000058 */ b lbl_000072D4
lbl_00007280:
/* 00007280 3860021F */ li r3, 0x21f
/* 00007284 4BFF8F05 */ bl u_play_sound_0
/* 00007288 80750008 */ lwz r3, 8(r21)
/* 0000728C 3800000F */ li r0, 0xf
/* 00007290 54630774 */ rlwinm r3, r3, 0, 0x1d, 0x1a
/* 00007294 90750008 */ stw r3, 8(r21)
/* 00007298 90120004 */ stw r0, 4(r18)
/* 0000729C 480025B8 */ b lbl_00009854
lbl_000072A0:
/* 000072A0 38600085 */ li r3, 0x85
/* 000072A4 4BFF8EE5 */ bl preload_stage_files
/* 000072A8 38600220 */ li r3, 0x220
/* 000072AC 4BFF8EDD */ bl u_play_sound_0
/* 000072B0 80750008 */ lwz r3, 8(r21)
/* 000072B4 3800000F */ li r0, 0xf
/* 000072B8 60630008 */ ori r3, r3, 8
/* 000072BC 90750008 */ stw r3, 8(r21)
/* 000072C0 80750008 */ lwz r3, 8(r21)
/* 000072C4 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 000072C8 90750008 */ stw r3, 8(r21)
/* 000072CC 90120004 */ stw r0, 4(r18)
/* 000072D0 48002584 */ b lbl_00009854
lbl_000072D4:
/* 000072D4 38600221 */ li r3, 0x221
/* 000072D8 4BFF8EB1 */ bl u_play_sound_0
/* 000072DC 3C600000 */ lis r3, modeCtrl@ha
/* 000072E0 38630000 */ addi r3, r3, modeCtrl@l
/* 000072E4 38800001 */ li r4, 1
/* 000072E8 90830024 */ stw r4, 0x24(r3)
/* 000072EC 38000011 */ li r0, 0x11
/* 000072F0 98920114 */ stb r4, 0x114(r18)
/* 000072F4 80750008 */ lwz r3, 8(r21)
/* 000072F8 60630010 */ ori r3, r3, 0x10
/* 000072FC 90750008 */ stw r3, 8(r21)
/* 00007300 80750008 */ lwz r3, 8(r21)
/* 00007304 54630776 */ rlwinm r3, r3, 0, 0x1d, 0x1b
/* 00007308 90750008 */ stw r3, 8(r21)
/* 0000730C 90120004 */ stw r0, 4(r18)
/* 00007310 48002544 */ b lbl_00009854
lbl_00007314:
/* 00007314 3C600000 */ lis r3, lbl_801EED88@ha
/* 00007318 3A030000 */ addi r16, r3, lbl_801EED88@l
/* 0000731C 3860001D */ li r3, 0x1d
/* 00007320 4BFF8E69 */ bl find_sprite_with_tag
/* 00007324 28030000 */ cmplwi r3, 0
/* 00007328 4182000C */ beq lbl_00007334
/* 0000732C 38000001 */ li r0, 1
/* 00007330 90030048 */ stw r0, 0x48(r3)
lbl_00007334:
/* 00007334 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007338 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000733C 39E00002 */ li r15, 2
/* 00007340 91E300BC */ stw r15, 0xbc(r3)
/* 00007344 3800000F */ li r0, 0xf
/* 00007348 3860000C */ li r3, 0xc
/* 0000734C 90190000 */ stw r0, 0(r25)
/* 00007350 4BFF8E39 */ bl camera_set_state
/* 00007354 38600021 */ li r3, 0x21
/* 00007358 4BFF8E31 */ bl find_sprite_with_tag
/* 0000735C 28030000 */ cmplwi r3, 0
/* 00007360 41820008 */ beq lbl_00007368
/* 00007364 91E30048 */ stw r15, 0x48(r3)
lbl_00007368:
/* 00007368 88100000 */ lbz r0, 0(r16)
/* 0000736C 7C000774 */ extsb r0, r0
/* 00007370 7C1D00AE */ lbzx r0, r29, r0
/* 00007374 901F003C */ stw r0, 0x3c(r31)
/* 00007378 4BFF8E11 */ bl empty_load_queue
/* 0000737C 807F003C */ lwz r3, 0x3c(r31)
/* 00007380 4BFF8E09 */ bl preload_stage_files
/* 00007384 38000001 */ li r0, 1
/* 00007388 901F00C0 */ stw r0, 0xc0(r31)
/* 0000738C 38600016 */ li r3, 0x16
/* 00007390 4BFF8DF9 */ bl find_sprite_with_tag
/* 00007394 28030000 */ cmplwi r3, 0
/* 00007398 4182000C */ beq lbl_000073A4
/* 0000739C 38000007 */ li r0, 7
/* 000073A0 90030048 */ stw r0, 0x48(r3)
lbl_000073A4:
/* 000073A4 80100008 */ lwz r0, 8(r16)
/* 000073A8 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 000073AC 4182000C */ beq lbl_000073B8
/* 000073B0 39E0002A */ li r15, 0x2a
/* 000073B4 48000008 */ b lbl_000073BC
lbl_000073B8:
/* 000073B8 39E00029 */ li r15, 0x29
lbl_000073BC:
/* 000073BC 38600017 */ li r3, 0x17
/* 000073C0 4BFF8DC9 */ bl find_sprite_with_tag
/* 000073C4 28030000 */ cmplwi r3, 0
/* 000073C8 41820008 */ beq lbl_000073D0
/* 000073CC 91E30048 */ stw r15, 0x48(r3)
lbl_000073D0:
/* 000073D0 38600066 */ li r3, 0x66
/* 000073D4 4BFF8DB5 */ bl find_sprite_with_tag
/* 000073D8 28030000 */ cmplwi r3, 0
/* 000073DC 40820130 */ bne lbl_0000750C
/* 000073E0 3CA00000 */ lis r5, lbl_00009E40@ha
/* 000073E4 3C800000 */ lis r4, lbl_0000A4A0@ha
/* 000073E8 3C600000 */ lis r3, lbl_0000A658@ha
/* 000073EC 3A9D0000 */ addi r20, r29, 0
/* 000073F0 3A7F037C */ addi r19, r31, 0x37c
/* 000073F4 3A250000 */ addi r17, r5, lbl_00009E40@l
/* 000073F8 3A040000 */ addi r16, r4, lbl_0000A4A0@l
/* 000073FC 39E30000 */ addi r15, r3, lbl_0000A658@l
/* 00007400 3AA00000 */ li r21, 0
lbl_00007404:
/* 00007404 4BFF8D85 */ bl create_sprite
/* 00007408 7C721B79 */ or. r18, r3, r3
/* 0000740C 41820058 */ beq lbl_00007464
/* 00007410 88B40000 */ lbz r5, 0(r20)
/* 00007414 38730000 */ addi r3, r19, 0
/* 00007418 389E0294 */ addi r4, r30, 0x294
/* 0000741C 38A5FFFF */ addi r5, r5, -1  ;# fixed addi
/* 00007420 38C00060 */ li r6, 0x60
/* 00007424 38E00044 */ li r7, 0x44
/* 00007428 39000005 */ li r8, 5
/* 0000742C 4BFF8D5D */ bl preview_create_with_alloc_img
/* 00007430 9272002C */ stw r19, 0x2c(r18)
/* 00007434 38600066 */ li r3, 0x66
/* 00007438 38000001 */ li r0, 1
/* 0000743C 9872000F */ stb r3, 0xf(r18)
/* 00007440 C01D0038 */ lfs f0, 0x38(r29)
/* 00007444 D0120040 */ stfs f0, 0x40(r18)
/* 00007448 C01D003C */ lfs f0, 0x3c(r29)
/* 0000744C D0120044 */ stfs f0, 0x44(r18)
/* 00007450 92B20048 */ stw r21, 0x48(r18)
/* 00007454 B012003C */ sth r0, 0x3c(r18)
/* 00007458 92320034 */ stw r17, 0x34(r18)
/* 0000745C 92120038 */ stw r16, 0x38(r18)
/* 00007460 91F20030 */ stw r15, 0x30(r18)
lbl_00007464:
/* 00007464 3AB50001 */ addi r21, r21, 1
/* 00007468 2C150006 */ cmpwi r21, 6
/* 0000746C 3A730074 */ addi r19, r19, 0x74
/* 00007470 3A940001 */ addi r20, r20, 1
/* 00007474 4180FF90 */ blt lbl_00007404
/* 00007478 4BFF8D11 */ bl create_sprite
/* 0000747C 7C751B79 */ or. r21, r3, r3
/* 00007480 4182008C */ beq lbl_0000750C
/* 00007484 3C600000 */ lis r3, lbl_801EED88@ha
/* 00007488 39E30000 */ addi r15, r3, lbl_801EED88@l
/* 0000748C 880F0000 */ lbz r0, 0(r15)
/* 00007490 3A1F0634 */ addi r16, r31, 0x634
/* 00007494 38700000 */ addi r3, r16, 0
/* 00007498 7C000774 */ extsb r0, r0
/* 0000749C 7CBD00AE */ lbzx r5, r29, r0
/* 000074A0 389E02A8 */ addi r4, r30, 0x2a8
/* 000074A4 38C000C8 */ li r6, 0xc8
/* 000074A8 38A5FFFF */ addi r5, r5, -1  ;# fixed addi
/* 000074AC 38E0008C */ li r7, 0x8c
/* 000074B0 39000005 */ li r8, 5
/* 000074B4 4BFF8CD5 */ bl preview_create_with_alloc_img
/* 000074B8 9215002C */ stw r16, 0x2c(r21)
/* 000074BC 38000066 */ li r0, 0x66
/* 000074C0 3CA00000 */ lis r5, lbl_00009E40@ha
/* 000074C4 9815000F */ stb r0, 0xf(r21)
/* 000074C8 3C800000 */ lis r4, lbl_0000A4A0@ha
/* 000074CC 3C600000 */ lis r3, lbl_0000A658@ha
/* 000074D0 C01D0040 */ lfs f0, 0x40(r29)
/* 000074D4 38C00000 */ li r6, 0
/* 000074D8 38A50000 */ addi r5, r5, lbl_00009E40@l
/* 000074DC D0150040 */ stfs f0, 0x40(r21)
/* 000074E0 38840000 */ addi r4, r4, lbl_0000A4A0@l
/* 000074E4 38030000 */ addi r0, r3, lbl_0000A658@l
/* 000074E8 C01D0044 */ lfs f0, 0x44(r29)
/* 000074EC D0150044 */ stfs f0, 0x44(r21)
/* 000074F0 886F0000 */ lbz r3, 0(r15)
/* 000074F4 7C630774 */ extsb r3, r3
/* 000074F8 90750048 */ stw r3, 0x48(r21)
/* 000074FC B0D5003C */ sth r6, 0x3c(r21)
/* 00007500 90B50034 */ stw r5, 0x34(r21)
/* 00007504 90950038 */ stw r4, 0x38(r21)
/* 00007508 90150030 */ stw r0, 0x30(r21)
lbl_0000750C:
/* 0000750C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007510 3800001F */ li r0, 0x1f
/* 00007514 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00007518 4800233C */ b lbl_00009854
lbl_0000751C:
/* 0000751C 3C600000 */ lis r3, lbl_801EED88@ha
/* 00007520 3AA30000 */ addi r21, r3, lbl_801EED88@l
/* 00007524 88150000 */ lbz r0, 0(r21)
/* 00007528 38600000 */ li r3, 0
/* 0000752C 7C000774 */ extsb r0, r0
/* 00007530 7C0F0E70 */ srawi r15, r0, 1
/* 00007534 7DEF0194 */ addze r15, r15
/* 00007538 55EF083C */ slwi r15, r15, 1
/* 0000753C 7DEF0010 */ subfc r15, r15, r0
/* 00007540 4BFF9095 */ bl lbl_000005D4
/* 00007544 2C030000 */ cmpwi r3, 0
/* 00007548 4182002C */ beq lbl_00007574
/* 0000754C 88750000 */ lbz r3, 0(r21)
/* 00007550 3803FFFE */ addi r0, r3, -2  ;# fixed addi
/* 00007554 98150000 */ stb r0, 0(r21)
/* 00007558 88750000 */ lbz r3, 0(r21)
/* 0000755C 7C600774 */ extsb r0, r3
/* 00007560 7C007800 */ cmpw r0, r15
/* 00007564 4080008C */ bge lbl_000075F0
/* 00007568 38030006 */ addi r0, r3, 6
/* 0000756C 98150000 */ stb r0, 0(r21)
/* 00007570 48000080 */ b lbl_000075F0
lbl_00007574:
/* 00007574 38600001 */ li r3, 1
/* 00007578 4BFF905D */ bl lbl_000005D4
/* 0000757C 2C030000 */ cmpwi r3, 0
/* 00007580 41820030 */ beq lbl_000075B0
/* 00007584 88750000 */ lbz r3, 0(r21)
/* 00007588 380F0004 */ addi r0, r15, 4
/* 0000758C 38630002 */ addi r3, r3, 2
/* 00007590 98750000 */ stb r3, 0(r21)
/* 00007594 88950000 */ lbz r4, 0(r21)
/* 00007598 7C830774 */ extsb r3, r4
/* 0000759C 7C030000 */ cmpw r3, r0
/* 000075A0 40810050 */ ble lbl_000075F0
/* 000075A4 3804FFFA */ addi r0, r4, -6  ;# fixed addi
/* 000075A8 98150000 */ stb r0, 0(r21)
/* 000075AC 48000044 */ b lbl_000075F0
lbl_000075B0:
/* 000075B0 38600002 */ li r3, 2
/* 000075B4 4BFF9021 */ bl lbl_000005D4
/* 000075B8 2C030000 */ cmpwi r3, 0
/* 000075BC 40820014 */ bne lbl_000075D0
/* 000075C0 38600003 */ li r3, 3
/* 000075C4 4BFF9011 */ bl lbl_000005D4
/* 000075C8 2C030000 */ cmpwi r3, 0
/* 000075CC 41820024 */ beq lbl_000075F0
lbl_000075D0:
/* 000075D0 2C0F0000 */ cmpwi r15, 0
/* 000075D4 4182000C */ beq lbl_000075E0
/* 000075D8 3860FFFF */ li r3, -1
/* 000075DC 48000008 */ b lbl_000075E4
lbl_000075E0:
/* 000075E0 38600001 */ li r3, 1
lbl_000075E4:
/* 000075E4 88150000 */ lbz r0, 0(r21)
/* 000075E8 7C001A14 */ add r0, r0, r3
/* 000075EC 98150000 */ stb r0, 0(r21)
lbl_000075F0:
/* 000075F0 38600000 */ li r3, 0
/* 000075F4 4BFF8FE1 */ bl lbl_000005D4
/* 000075F8 2C030000 */ cmpwi r3, 0
/* 000075FC 40820034 */ bne lbl_00007630
/* 00007600 38600001 */ li r3, 1
/* 00007604 4BFF8FD1 */ bl lbl_000005D4
/* 00007608 2C030000 */ cmpwi r3, 0
/* 0000760C 40820024 */ bne lbl_00007630
/* 00007610 38600002 */ li r3, 2
/* 00007614 4BFF8FC1 */ bl lbl_000005D4
/* 00007618 2C030000 */ cmpwi r3, 0
/* 0000761C 40820014 */ bne lbl_00007630
/* 00007620 38600003 */ li r3, 3
/* 00007624 4BFF8FB1 */ bl lbl_000005D4
/* 00007628 2C030000 */ cmpwi r3, 0
/* 0000762C 41820030 */ beq lbl_0000765C
lbl_00007630:
/* 00007630 3860006C */ li r3, 0x6c
/* 00007634 4BFF8B55 */ bl u_play_sound_0
/* 00007638 88150000 */ lbz r0, 0(r21)
/* 0000763C 7C000774 */ extsb r0, r0
/* 00007640 7C1D00AE */ lbzx r0, r29, r0
/* 00007644 901F003C */ stw r0, 0x3c(r31)
/* 00007648 4BFF8B41 */ bl empty_load_queue
/* 0000764C 807F003C */ lwz r3, 0x3c(r31)
/* 00007650 4BFF8B39 */ bl preload_stage_files
/* 00007654 38000001 */ li r0, 1
/* 00007658 901F00C0 */ stw r0, 0xc0(r31)
lbl_0000765C:
/* 0000765C 38600007 */ li r3, 7
/* 00007660 4BFF8F75 */ bl lbl_000005D4
/* 00007664 2C030000 */ cmpwi r3, 0
/* 00007668 41820030 */ beq lbl_00007698
/* 0000766C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007670 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00007674 38000001 */ li r0, 1
/* 00007678 90030008 */ stw r0, 8(r3)
/* 0000767C 38600021 */ li r3, 0x21
/* 00007680 4BFF8B09 */ bl find_sprite_with_tag
/* 00007684 28030000 */ cmplwi r3, 0
/* 00007688 418221CC */ beq lbl_00009854
/* 0000768C 38000003 */ li r0, 3
/* 00007690 90030048 */ stw r0, 0x48(r3)
/* 00007694 480021C0 */ b lbl_00009854
lbl_00007698:
/* 00007698 38600006 */ li r3, 6
/* 0000769C 4BFF8F39 */ bl lbl_000005D4
/* 000076A0 2C030000 */ cmpwi r3, 0
/* 000076A4 418221B0 */ beq lbl_00009854
/* 000076A8 80150008 */ lwz r0, 8(r21)
/* 000076AC 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 000076B0 41820018 */ beq lbl_000076C8
/* 000076B4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000076B8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000076BC 38000033 */ li r0, 0x33
/* 000076C0 90030004 */ stw r0, 4(r3)
/* 000076C4 48002190 */ b lbl_00009854
lbl_000076C8:
/* 000076C8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000076CC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000076D0 38000020 */ li r0, 0x20
/* 000076D4 90030004 */ stw r0, 4(r3)
/* 000076D8 4800217C */ b lbl_00009854
lbl_000076DC:
/* 000076DC 3C600000 */ lis r3, lbl_801EED88@ha
/* 000076E0 3AA30000 */ addi r21, r3, lbl_801EED88@l
/* 000076E4 3860022D */ li r3, 0x22d
/* 000076E8 4BFF8AA1 */ bl u_play_sound_0
/* 000076EC 3C600000 */ lis r3, currStageId@ha
/* 000076F0 A8030000 */ lha r0, currStageId@l(r3)
/* 000076F4 3860001D */ li r3, 0x1d
/* 000076F8 901F003C */ stw r0, 0x3c(r31)
/* 000076FC 4BFF8A8D */ bl find_sprite_with_tag
/* 00007700 28030000 */ cmplwi r3, 0
/* 00007704 4182000C */ beq lbl_00007710
/* 00007708 38000001 */ li r0, 1
/* 0000770C 90030048 */ stw r0, 0x48(r3)
lbl_00007710:
/* 00007710 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007714 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00007718 38000002 */ li r0, 2
/* 0000771C 900300BC */ stw r0, 0xbc(r3)
/* 00007720 3800000F */ li r0, 0xf
/* 00007724 38600021 */ li r3, 0x21
/* 00007728 90190000 */ stw r0, 0(r25)
/* 0000772C 4BFF8A5D */ bl find_sprite_with_tag
/* 00007730 28030000 */ cmplwi r3, 0
/* 00007734 4182000C */ beq lbl_00007740
/* 00007738 38000003 */ li r0, 3
/* 0000773C 90030048 */ stw r0, 0x48(r3)
lbl_00007740:
/* 00007740 38600016 */ li r3, 0x16
/* 00007744 4BFF8A45 */ bl find_sprite_with_tag
/* 00007748 28030000 */ cmplwi r3, 0
/* 0000774C 4182000C */ beq lbl_00007758
/* 00007750 38000006 */ li r0, 6
/* 00007754 90030048 */ stw r0, 0x48(r3)
lbl_00007758:
/* 00007758 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000775C 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00007760 38000021 */ li r0, 0x21
/* 00007764 3C600000 */ lis r3, lbl_801EED88@ha
/* 00007768 90040000 */ stw r0, 0(r4)
/* 0000776C 38630000 */ addi r3, r3, lbl_801EED88@l
/* 00007770 80030008 */ lwz r0, 8(r3)
/* 00007774 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007778 41820030 */ beq lbl_000077A8
/* 0000777C 3860001A */ li r3, 0x1a
/* 00007780 4BFF8A09 */ bl find_sprite_with_tag
/* 00007784 28030000 */ cmplwi r3, 0
/* 00007788 4182000C */ beq lbl_00007794
/* 0000778C 38000003 */ li r0, 3
/* 00007790 90030048 */ stw r0, 0x48(r3)
lbl_00007794:
/* 00007794 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007798 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000779C 38000004 */ li r0, 4
/* 000077A0 900300F4 */ stw r0, 0xf4(r3)
/* 000077A4 4800002C */ b lbl_000077D0
lbl_000077A8:
/* 000077A8 3860001A */ li r3, 0x1a
/* 000077AC 4BFF89DD */ bl find_sprite_with_tag
/* 000077B0 28030000 */ cmplwi r3, 0
/* 000077B4 4182000C */ beq lbl_000077C0
/* 000077B8 38000002 */ li r0, 2
/* 000077BC 90030048 */ stw r0, 0x48(r3)
lbl_000077C0:
/* 000077C0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000077C4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000077C8 38000005 */ li r0, 5
/* 000077CC 900300F4 */ stw r0, 0xf4(r3)
lbl_000077D0:
/* 000077D0 38000001 */ li r0, 1
/* 000077D4 901F0040 */ stw r0, 0x40(r31)
/* 000077D8 38000000 */ li r0, 0
/* 000077DC 3C600000 */ lis r3, modeCtrl@ha
/* 000077E0 901F0044 */ stw r0, 0x44(r31)
/* 000077E4 38630000 */ addi r3, r3, modeCtrl@l
/* 000077E8 901F0048 */ stw r0, 0x48(r31)
/* 000077EC 80030024 */ lwz r0, 0x24(r3)
/* 000077F0 2C000001 */ cmpwi r0, 1
/* 000077F4 40820014 */ bne lbl_00007808
/* 000077F8 80150008 */ lwz r0, 8(r21)
/* 000077FC 60000001 */ ori r0, r0, 1
/* 00007800 90150008 */ stw r0, 8(r21)
/* 00007804 48002050 */ b lbl_00009854
lbl_00007808:
/* 00007808 2C000004 */ cmpwi r0, 4
/* 0000780C 40822048 */ bne lbl_00009854
/* 00007810 80150008 */ lwz r0, 8(r21)
/* 00007814 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 00007818 90150008 */ stw r0, 8(r21)
/* 0000781C 48002038 */ b lbl_00009854
lbl_00007820:
/* 00007820 3C600000 */ lis r3, lbl_801EED88@ha
/* 00007824 3AA30000 */ addi r21, r3, lbl_801EED88@l
/* 00007828 80150008 */ lwz r0, 8(r21)
/* 0000782C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007830 4182000C */ beq lbl_0000783C
/* 00007834 39E00004 */ li r15, 4
/* 00007838 48000008 */ b lbl_00007840
lbl_0000783C:
/* 0000783C 39E00005 */ li r15, 5
lbl_00007840:
/* 00007840 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007844 3A430000 */ addi r18, r3, lbl_801EEDA8@l
/* 00007848 80120108 */ lwz r0, 0x108(r18)
/* 0000784C 3A320108 */ addi r17, r18, 0x108
/* 00007850 2C000000 */ cmpwi r0, 0
/* 00007854 40820044 */ bne lbl_00007898
/* 00007858 38600006 */ li r3, 6
/* 0000785C 4BFF8D79 */ bl lbl_000005D4
/* 00007860 2C030000 */ cmpwi r3, 0
/* 00007864 41820028 */ beq lbl_0000788C
/* 00007868 807200F4 */ lwz r3, 0xf4(r18)
/* 0000786C 380FFFFF */ addi r0, r15, -1  ;# fixed addi
/* 00007870 7C030000 */ cmpw r3, r0
/* 00007874 40820018 */ bne lbl_0000788C
/* 00007878 3C600000 */ lis r3, lbl_801EED88@ha
/* 0000787C 38830000 */ addi r4, r3, lbl_801EED88@l
/* 00007880 387F0088 */ addi r3, r31, 0x88
/* 00007884 38A00010 */ li r5, 0x10
/* 00007888 4BFF8901 */ bl memcpy
lbl_0000788C:
/* 0000788C 7DE37B78 */ mr r3, r15
/* 00007890 4BFFB215 */ bl lbl_00002AA4
/* 00007894 48000280 */ b lbl_00007B14
lbl_00007898:
/* 00007898 3A12010C */ addi r16, r18, 0x10c
/* 0000789C 38000000 */ li r0, 0
/* 000078A0 9812010C */ stb r0, 0x10c(r18)
/* 000078A4 7DE37B78 */ mr r3, r15
/* 000078A8 4BFFB1FD */ bl lbl_00002AA4
/* 000078AC 38600007 */ li r3, 7
/* 000078B0 4BFF8D25 */ bl lbl_000005D4
/* 000078B4 2C030000 */ cmpwi r3, 0
/* 000078B8 4182001C */ beq lbl_000078D4
/* 000078BC 3C600000 */ lis r3, lbl_801EED88@ha
/* 000078C0 38630000 */ addi r3, r3, lbl_801EED88@l
/* 000078C4 389F0088 */ addi r4, r31, 0x88
/* 000078C8 38A00010 */ li r5, 0x10
/* 000078CC 4BFF88BD */ bl memcpy
/* 000078D0 48001F84 */ b lbl_00009854
lbl_000078D4:
/* 000078D4 38600006 */ li r3, 6
/* 000078D8 4BFF8CFD */ bl lbl_000005D4
/* 000078DC 2C030000 */ cmpwi r3, 0
/* 000078E0 40821F74 */ bne lbl_00009854
/* 000078E4 2C0F0004 */ cmpwi r15, 4
/* 000078E8 40820010 */ bne lbl_000078F8
/* 000078EC 807200F4 */ lwz r3, 0xf4(r18)
/* 000078F0 38030001 */ addi r0, r3, 1
/* 000078F4 48000008 */ b lbl_000078FC
lbl_000078F8:
/* 000078F8 801200F4 */ lwz r0, 0xf4(r18)
lbl_000078FC:
/* 000078FC 2C000002 */ cmpwi r0, 2
/* 00007900 41820190 */ beq lbl_00007A90
/* 00007904 40800014 */ bge lbl_00007918
/* 00007908 2C000000 */ cmpwi r0, 0
/* 0000790C 41820018 */ beq lbl_00007924
/* 00007910 40800120 */ bge lbl_00007A30
/* 00007914 48000200 */ b lbl_00007B14
lbl_00007918:
/* 00007918 2C000004 */ cmpwi r0, 4
/* 0000791C 408001F8 */ bge lbl_00007B14
/* 00007920 480001B4 */ b lbl_00007AD4
lbl_00007924:
/* 00007924 88150000 */ lbz r0, 0(r21)
/* 00007928 7C000774 */ extsb r0, r0
/* 0000792C 7C750214 */ add r3, r21, r0
/* 00007930 88030001 */ lbz r0, 1(r3)
/* 00007934 2C000001 */ cmpwi r0, 1
/* 00007938 41820010 */ beq lbl_00007948
/* 0000793C 88100000 */ lbz r0, 0(r16)
/* 00007940 60000001 */ ori r0, r0, 1
/* 00007944 98100000 */ stb r0, 0(r16)
lbl_00007948:
/* 00007948 88150000 */ lbz r0, 0(r21)
/* 0000794C 7C000774 */ extsb r0, r0
/* 00007950 7C750214 */ add r3, r21, r0
/* 00007954 88030001 */ lbz r0, 1(r3)
/* 00007958 2C000032 */ cmpwi r0, 0x32
/* 0000795C 41820010 */ beq lbl_0000796C
/* 00007960 88100000 */ lbz r0, 0(r16)
/* 00007964 60000002 */ ori r0, r0, 2
/* 00007968 98100000 */ stb r0, 0(r16)
lbl_0000796C:
/* 0000796C 88150000 */ lbz r0, 0(r21)
/* 00007970 38600000 */ li r3, 0
/* 00007974 7C000774 */ extsb r0, r0
/* 00007978 7C950214 */ add r4, r21, r0
/* 0000797C 8A040001 */ lbz r16, 1(r4)
/* 00007980 7E100774 */ extsb r16, r16
/* 00007984 4BFF8C51 */ bl lbl_000005D4
/* 00007988 2C030000 */ cmpwi r3, 0
/* 0000798C 4182001C */ beq lbl_000079A8
/* 00007990 88150000 */ lbz r0, 0(r21)
/* 00007994 7C000774 */ extsb r0, r0
/* 00007998 7C950214 */ add r4, r21, r0
/* 0000799C 88640001 */ lbz r3, 1(r4)
/* 000079A0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000079A4 98040001 */ stb r0, 1(r4)
lbl_000079A8:
/* 000079A8 38600001 */ li r3, 1
/* 000079AC 4BFF8C29 */ bl lbl_000005D4
/* 000079B0 2C030000 */ cmpwi r3, 0
/* 000079B4 4182001C */ beq lbl_000079D0
/* 000079B8 88150000 */ lbz r0, 0(r21)
/* 000079BC 7C000774 */ extsb r0, r0
/* 000079C0 7C950214 */ add r4, r21, r0
/* 000079C4 88640001 */ lbz r3, 1(r4)
/* 000079C8 38030001 */ addi r0, r3, 1
/* 000079CC 98040001 */ stb r0, 1(r4)
lbl_000079D0:
/* 000079D0 88150000 */ lbz r0, 0(r21)
/* 000079D4 7C000774 */ extsb r0, r0
/* 000079D8 7C750214 */ add r3, r21, r0
/* 000079DC 8C030001 */ lbzu r0, 1(r3)
/* 000079E0 7C000774 */ extsb r0, r0
/* 000079E4 2C000001 */ cmpwi r0, 1
/* 000079E8 4080000C */ bge lbl_000079F4
/* 000079EC 38000001 */ li r0, 1
/* 000079F0 48000010 */ b lbl_00007A00
lbl_000079F4:
/* 000079F4 2C000032 */ cmpwi r0, 0x32
/* 000079F8 40810008 */ ble lbl_00007A00
/* 000079FC 38000032 */ li r0, 0x32
lbl_00007A00:
/* 00007A00 7C000774 */ extsb r0, r0
/* 00007A04 98030000 */ stb r0, 0(r3)
/* 00007A08 88150000 */ lbz r0, 0(r21)
/* 00007A0C 7C000774 */ extsb r0, r0
/* 00007A10 7C750214 */ add r3, r21, r0
/* 00007A14 88030001 */ lbz r0, 1(r3)
/* 00007A18 7C000774 */ extsb r0, r0
/* 00007A1C 7C100000 */ cmpw r16, r0
/* 00007A20 418200F4 */ beq lbl_00007B14
/* 00007A24 38600065 */ li r3, 0x65
/* 00007A28 4BFF8761 */ bl u_play_sound_0
/* 00007A2C 480000E8 */ b lbl_00007B14
lbl_00007A30:
/* 00007A30 3C600000 */ lis r3, modeCtrl@ha
/* 00007A34 38630000 */ addi r3, r3, modeCtrl@l
/* 00007A38 80030024 */ lwz r0, 0x24(r3)
/* 00007A3C 2C000002 */ cmpwi r0, 2
/* 00007A40 4182000C */ beq lbl_00007A4C
/* 00007A44 2C000003 */ cmpwi r0, 3
/* 00007A48 408200CC */ bne lbl_00007B14
lbl_00007A4C:
/* 00007A4C 88100000 */ lbz r0, 0(r16)
/* 00007A50 38600000 */ li r3, 0
/* 00007A54 60000003 */ ori r0, r0, 3
/* 00007A58 98100000 */ stb r0, 0(r16)
/* 00007A5C 4BFF8B79 */ bl lbl_000005D4
/* 00007A60 2C030000 */ cmpwi r3, 0
/* 00007A64 40820014 */ bne lbl_00007A78
/* 00007A68 38600001 */ li r3, 1
/* 00007A6C 4BFF8B69 */ bl lbl_000005D4
/* 00007A70 2C030000 */ cmpwi r3, 0
/* 00007A74 418200A0 */ beq lbl_00007B14
lbl_00007A78:
/* 00007A78 80150008 */ lwz r0, 8(r21)
/* 00007A7C 38600065 */ li r3, 0x65
/* 00007A80 68000001 */ xori r0, r0, 1
/* 00007A84 90150008 */ stw r0, 8(r21)
/* 00007A88 4BFF8701 */ bl u_play_sound_0
/* 00007A8C 48000088 */ b lbl_00007B14
lbl_00007A90:
/* 00007A90 88100000 */ lbz r0, 0(r16)
/* 00007A94 38600000 */ li r3, 0
/* 00007A98 60000003 */ ori r0, r0, 3
/* 00007A9C 98100000 */ stb r0, 0(r16)
/* 00007AA0 4BFF8B35 */ bl lbl_000005D4
/* 00007AA4 2C030000 */ cmpwi r3, 0
/* 00007AA8 40820014 */ bne lbl_00007ABC
/* 00007AAC 38600001 */ li r3, 1
/* 00007AB0 4BFF8B25 */ bl lbl_000005D4
/* 00007AB4 2C030000 */ cmpwi r3, 0
/* 00007AB8 4182005C */ beq lbl_00007B14
lbl_00007ABC:
/* 00007ABC 80150008 */ lwz r0, 8(r21)
/* 00007AC0 38600065 */ li r3, 0x65
/* 00007AC4 68000002 */ xori r0, r0, 2
/* 00007AC8 90150008 */ stw r0, 8(r21)
/* 00007ACC 4BFF86BD */ bl u_play_sound_0
/* 00007AD0 48000044 */ b lbl_00007B14
lbl_00007AD4:
/* 00007AD4 88100000 */ lbz r0, 0(r16)
/* 00007AD8 38600000 */ li r3, 0
/* 00007ADC 60000003 */ ori r0, r0, 3
/* 00007AE0 98100000 */ stb r0, 0(r16)
/* 00007AE4 4BFF8AF1 */ bl lbl_000005D4
/* 00007AE8 2C030000 */ cmpwi r3, 0
/* 00007AEC 40820014 */ bne lbl_00007B00
/* 00007AF0 38600001 */ li r3, 1
/* 00007AF4 4BFF8AE1 */ bl lbl_000005D4
/* 00007AF8 2C030000 */ cmpwi r3, 0
/* 00007AFC 41820018 */ beq lbl_00007B14
lbl_00007B00:
/* 00007B00 80150008 */ lwz r0, 8(r21)
/* 00007B04 38600065 */ li r3, 0x65
/* 00007B08 68000004 */ xori r0, r0, 4
/* 00007B0C 90150008 */ stw r0, 8(r21)
/* 00007B10 4BFF8679 */ bl u_play_sound_0
lbl_00007B14:
/* 00007B14 2C0F0004 */ cmpwi r15, 4
/* 00007B18 40820018 */ bne lbl_00007B30
/* 00007B1C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007B20 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00007B24 806300F4 */ lwz r3, 0xf4(r3)
/* 00007B28 3A030001 */ addi r16, r3, 1
/* 00007B2C 48000010 */ b lbl_00007B3C
lbl_00007B30:
/* 00007B30 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007B34 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00007B38 820300F4 */ lwz r16, 0xf4(r3)
lbl_00007B3C:
/* 00007B3C 38600017 */ li r3, 0x17
/* 00007B40 4BFF8649 */ bl find_sprite_with_tag
/* 00007B44 28030000 */ cmplwi r3, 0
/* 00007B48 4182000C */ beq lbl_00007B54
/* 00007B4C 3810002C */ addi r0, r16, 0x2c
/* 00007B50 90030048 */ stw r0, 0x48(r3)
lbl_00007B54:
/* 00007B54 2C100001 */ cmpwi r16, 1
/* 00007B58 40820054 */ bne lbl_00007BAC
/* 00007B5C 3C600000 */ lis r3, modeCtrl@ha
/* 00007B60 38630000 */ addi r3, r3, modeCtrl@l
/* 00007B64 80030024 */ lwz r0, 0x24(r3)
/* 00007B68 2C000001 */ cmpwi r0, 1
/* 00007B6C 40820020 */ bne lbl_00007B8C
/* 00007B70 38600017 */ li r3, 0x17
/* 00007B74 4BFF8615 */ bl find_sprite_with_tag
/* 00007B78 28030000 */ cmplwi r3, 0
/* 00007B7C 41820030 */ beq lbl_00007BAC
/* 00007B80 38000032 */ li r0, 0x32
/* 00007B84 90030048 */ stw r0, 0x48(r3)
/* 00007B88 48000024 */ b lbl_00007BAC
lbl_00007B8C:
/* 00007B8C 2C000004 */ cmpwi r0, 4
/* 00007B90 4082001C */ bne lbl_00007BAC
/* 00007B94 38600017 */ li r3, 0x17
/* 00007B98 4BFF85F1 */ bl find_sprite_with_tag
/* 00007B9C 28030000 */ cmplwi r3, 0
/* 00007BA0 4182000C */ beq lbl_00007BAC
/* 00007BA4 38000033 */ li r0, 0x33
/* 00007BA8 90030048 */ stw r0, 0x48(r3)
lbl_00007BAC:
/* 00007BAC 38600007 */ li r3, 7
/* 00007BB0 4BFF8A25 */ bl lbl_000005D4
/* 00007BB4 2C030000 */ cmpwi r3, 0
/* 00007BB8 4182003C */ beq lbl_00007BF4
/* 00007BBC 80110000 */ lwz r0, 0(r17)
/* 00007BC0 2C000000 */ cmpwi r0, 0
/* 00007BC4 40820030 */ bne lbl_00007BF4
/* 00007BC8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007BCC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00007BD0 38000001 */ li r0, 1
/* 00007BD4 90030008 */ stw r0, 8(r3)
/* 00007BD8 3860001A */ li r3, 0x1a
/* 00007BDC 4BFF85AD */ bl find_sprite_with_tag
/* 00007BE0 28030000 */ cmplwi r3, 0
/* 00007BE4 41821C70 */ beq lbl_00009854
/* 00007BE8 38000000 */ li r0, 0
/* 00007BEC 90030048 */ stw r0, 0x48(r3)
/* 00007BF0 48001C64 */ b lbl_00009854
lbl_00007BF4:
/* 00007BF4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007BF8 3A030000 */ addi r16, r3, lbl_801EEDA8@l
/* 00007BFC 801000F4 */ lwz r0, 0xf4(r16)
/* 00007C00 7C007800 */ cmpw r0, r15
/* 00007C04 40821C50 */ bne lbl_00009854
/* 00007C08 38600006 */ li r3, 6
/* 00007C0C 4BFF89C9 */ bl lbl_000005D4
/* 00007C10 2C030000 */ cmpwi r3, 0
/* 00007C14 40820008 */ bne lbl_00007C1C
/* 00007C18 48001C3C */ b lbl_00009854
lbl_00007C1C:
/* 00007C1C 38000033 */ li r0, 0x33
/* 00007C20 3C600000 */ lis r3, modeCtrl@ha
/* 00007C24 90100004 */ stw r0, 4(r16)
/* 00007C28 38630000 */ addi r3, r3, modeCtrl@l
/* 00007C2C 80030008 */ lwz r0, 8(r3)
/* 00007C30 60000004 */ ori r0, r0, 4
/* 00007C34 90030008 */ stw r0, 8(r3)
/* 00007C38 48001C1C */ b lbl_00009854
lbl_00007C3C:
/* 00007C3C 3C600000 */ lis r3, lbl_801EED98@ha
/* 00007C40 3AA30000 */ addi r21, r3, lbl_801EED98@l
/* 00007C44 3860001D */ li r3, 0x1d
/* 00007C48 4BFF8541 */ bl find_sprite_with_tag
/* 00007C4C 28030000 */ cmplwi r3, 0
/* 00007C50 4182000C */ beq lbl_00007C5C
/* 00007C54 38000001 */ li r0, 1
/* 00007C58 90030048 */ stw r0, 0x48(r3)
lbl_00007C5C:
/* 00007C5C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007C60 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00007C64 38000002 */ li r0, 2
/* 00007C68 900300BC */ stw r0, 0xbc(r3)
/* 00007C6C 3800000F */ li r0, 0xf
/* 00007C70 3860000C */ li r3, 0xc
/* 00007C74 90190000 */ stw r0, 0(r25)
/* 00007C78 4BFF8511 */ bl camera_set_state
/* 00007C7C 38600022 */ li r3, 0x22
/* 00007C80 4BFF8509 */ bl find_sprite_with_tag
/* 00007C84 28030000 */ cmplwi r3, 0
/* 00007C88 4182000C */ beq lbl_00007C94
/* 00007C8C 38000001 */ li r0, 1
/* 00007C90 90030048 */ stw r0, 0x48(r3)
lbl_00007C94:
/* 00007C94 88150005 */ lbz r0, 5(r21)
/* 00007C98 7C000774 */ extsb r0, r0
/* 00007C9C 5400103A */ slwi r0, r0, 2
/* 00007CA0 7C7D0214 */ add r3, r29, r0
/* 00007CA4 80030008 */ lwz r0, 8(r3)
/* 00007CA8 901F003C */ stw r0, 0x3c(r31)
/* 00007CAC 4BFF84DD */ bl empty_load_queue
/* 00007CB0 807F003C */ lwz r3, 0x3c(r31)
/* 00007CB4 4BFF84D5 */ bl preload_stage_files
/* 00007CB8 38000001 */ li r0, 1
/* 00007CBC 901F00C0 */ stw r0, 0xc0(r31)
/* 00007CC0 38600016 */ li r3, 0x16
/* 00007CC4 88150005 */ lbz r0, 5(r21)
/* 00007CC8 9815000A */ stb r0, 0xa(r21)
/* 00007CCC 4BFF84BD */ bl find_sprite_with_tag
/* 00007CD0 28030000 */ cmplwi r3, 0
/* 00007CD4 4182000C */ beq lbl_00007CE0
/* 00007CD8 38000005 */ li r0, 5
/* 00007CDC 90030048 */ stw r0, 0x48(r3)
lbl_00007CE0:
/* 00007CE0 38600017 */ li r3, 0x17
/* 00007CE4 4BFF84A5 */ bl find_sprite_with_tag
/* 00007CE8 28030000 */ cmplwi r3, 0
/* 00007CEC 4182000C */ beq lbl_00007CF8
/* 00007CF0 38000000 */ li r0, 0
/* 00007CF4 90030048 */ stw r0, 0x48(r3)
lbl_00007CF8:
/* 00007CF8 38600018 */ li r3, 0x18
/* 00007CFC 4BFF848D */ bl find_sprite_with_tag
/* 00007D00 28030000 */ cmplwi r3, 0
/* 00007D04 4182000C */ beq lbl_00007D10
/* 00007D08 38000004 */ li r0, 4
/* 00007D0C 90030048 */ stw r0, 0x48(r3)
lbl_00007D10:
/* 00007D10 38600066 */ li r3, 0x66
/* 00007D14 4BFF8475 */ bl find_sprite_with_tag
/* 00007D18 28030000 */ cmplwi r3, 0
/* 00007D1C 4082010C */ bne lbl_00007E28
/* 00007D20 3A600000 */ li r19, 0
/* 00007D24 5660103A */ slwi r0, r19, 2
/* 00007D28 7E3D0214 */ add r17, r29, r0
/* 00007D2C 3CA00000 */ lis r5, lbl_0000A154@ha
/* 00007D30 3C800000 */ lis r4, lbl_0000A544@ha
/* 00007D34 3C600000 */ lis r3, lbl_0000A67C@ha
/* 00007D38 3A1F06A8 */ addi r16, r31, 0x6a8
/* 00007D3C 3A310008 */ addi r17, r17, 8
/* 00007D40 3A5F0804 */ addi r18, r31, 0x804
/* 00007D44 3AE50000 */ addi r23, r5, lbl_0000A154@l
/* 00007D48 3AC40000 */ addi r22, r4, lbl_0000A544@l
/* 00007D4C 3A830000 */ addi r20, r3, lbl_0000A67C@l
lbl_00007D50:
/* 00007D50 4BFF8439 */ bl create_sprite
/* 00007D54 7C6F1B79 */ or. r15, r3, r3
/* 00007D58 41820058 */ beq lbl_00007DB0
/* 00007D5C 80B10000 */ lwz r5, 0(r17)
/* 00007D60 38700000 */ addi r3, r16, 0
/* 00007D64 389E02BC */ addi r4, r30, 0x2bc
/* 00007D68 38A5FFFF */ addi r5, r5, -1  ;# fixed addi
/* 00007D6C 38C000AC */ li r6, 0xac
/* 00007D70 38E00078 */ li r7, 0x78
/* 00007D74 39000005 */ li r8, 5
/* 00007D78 4BFF8411 */ bl preview_create_with_alloc_img
/* 00007D7C 920F002C */ stw r16, 0x2c(r15)
/* 00007D80 38600066 */ li r3, 0x66
/* 00007D84 38000000 */ li r0, 0
/* 00007D88 986F000F */ stb r3, 0xf(r15)
/* 00007D8C C01D0048 */ lfs f0, 0x48(r29)
/* 00007D90 D00F0040 */ stfs f0, 0x40(r15)
/* 00007D94 C01D004C */ lfs f0, 0x4c(r29)
/* 00007D98 D00F0044 */ stfs f0, 0x44(r15)
/* 00007D9C 926F0048 */ stw r19, 0x48(r15)
/* 00007DA0 B00F003C */ sth r0, 0x3c(r15)
/* 00007DA4 92EF0034 */ stw r23, 0x34(r15)
/* 00007DA8 92CF0038 */ stw r22, 0x38(r15)
/* 00007DAC 928F0030 */ stw r20, 0x30(r15)
lbl_00007DB0:
/* 00007DB0 4BFF83D9 */ bl create_sprite
/* 00007DB4 7C6F1B79 */ or. r15, r3, r3
/* 00007DB8 41820058 */ beq lbl_00007E10
/* 00007DBC 80B10000 */ lwz r5, 0(r17)
/* 00007DC0 38720000 */ addi r3, r18, 0
/* 00007DC4 389E02D0 */ addi r4, r30, 0x2d0
/* 00007DC8 38A5FFFF */ addi r5, r5, -1  ;# fixed addi
/* 00007DCC 38C0003C */ li r6, 0x3c
/* 00007DD0 38E0002A */ li r7, 0x2a
/* 00007DD4 39000005 */ li r8, 5
/* 00007DD8 4BFF83B1 */ bl preview_create_with_alloc_img
/* 00007DDC 924F002C */ stw r18, 0x2c(r15)
/* 00007DE0 38600066 */ li r3, 0x66
/* 00007DE4 38130001 */ addi r0, r19, 1
/* 00007DE8 986F000F */ stb r3, 0xf(r15)
/* 00007DEC C01D0050 */ lfs f0, 0x50(r29)
/* 00007DF0 D00F0040 */ stfs f0, 0x40(r15)
/* 00007DF4 C01D0054 */ lfs f0, 0x54(r29)
/* 00007DF8 D00F0044 */ stfs f0, 0x44(r15)
/* 00007DFC 926F0048 */ stw r19, 0x48(r15)
/* 00007E00 B00F003C */ sth r0, 0x3c(r15)
/* 00007E04 92EF0034 */ stw r23, 0x34(r15)
/* 00007E08 92CF0038 */ stw r22, 0x38(r15)
/* 00007E0C 928F0030 */ stw r20, 0x30(r15)
lbl_00007E10:
/* 00007E10 3A730001 */ addi r19, r19, 1
/* 00007E14 2C130003 */ cmpwi r19, 3
/* 00007E18 3A100074 */ addi r16, r16, 0x74
/* 00007E1C 3A310004 */ addi r17, r17, 4
/* 00007E20 3A520074 */ addi r18, r18, 0x74
/* 00007E24 4180FF2C */ blt lbl_00007D50
lbl_00007E28:
/* 00007E28 8015000C */ lwz r0, 0xc(r21)
/* 00007E2C 2C000000 */ cmpwi r0, 0
/* 00007E30 41820064 */ beq lbl_00007E94
/* 00007E34 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007E38 38000024 */ li r0, 0x24
/* 00007E3C 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00007E40 88750009 */ lbz r3, 9(r21)
/* 00007E44 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00007E48 98150009 */ stb r0, 9(r21)
/* 00007E4C 88150004 */ lbz r0, 4(r21)
/* 00007E50 2C000001 */ cmpwi r0, 1
/* 00007E54 4082000C */ bne lbl_00007E60
/* 00007E58 39E00005 */ li r15, 5
/* 00007E5C 48000008 */ b lbl_00007E64
lbl_00007E60:
/* 00007E60 39E00006 */ li r15, 6
lbl_00007E64:
/* 00007E64 38600018 */ li r3, 0x18
/* 00007E68 4BFF8321 */ bl find_sprite_with_tag
/* 00007E6C 28030000 */ cmplwi r3, 0
/* 00007E70 41820008 */ beq lbl_00007E78
/* 00007E74 91E30048 */ stw r15, 0x48(r3)
lbl_00007E78:
/* 00007E78 38600022 */ li r3, 0x22
/* 00007E7C 4BFF830D */ bl find_sprite_with_tag
/* 00007E80 28030000 */ cmplwi r3, 0
/* 00007E84 418219D0 */ beq lbl_00009854
/* 00007E88 38000002 */ li r0, 2
/* 00007E8C 90030048 */ stw r0, 0x48(r3)
/* 00007E90 480019C4 */ b lbl_00009854
lbl_00007E94:
/* 00007E94 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007E98 38000023 */ li r0, 0x23
/* 00007E9C 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00007EA0 480019B4 */ b lbl_00009854
lbl_00007EA4:
/* 00007EA4 3C600000 */ lis r3, lbl_801EED98@ha
/* 00007EA8 3A030000 */ addi r16, r3, lbl_801EED98@l
/* 00007EAC 89F00004 */ lbz r15, 4(r16)
/* 00007EB0 38600000 */ li r3, 0
/* 00007EB4 7DEF0774 */ extsb r15, r15
/* 00007EB8 4BFF871D */ bl lbl_000005D4
/* 00007EBC 2C030000 */ cmpwi r3, 0
/* 00007EC0 4182001C */ beq lbl_00007EDC
/* 00007EC4 88700004 */ lbz r3, 4(r16)
/* 00007EC8 7C600774 */ extsb r0, r3
/* 00007ECC 2C000001 */ cmpwi r0, 1
/* 00007ED0 4081000C */ ble lbl_00007EDC
/* 00007ED4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00007ED8 98100004 */ stb r0, 4(r16)
lbl_00007EDC:
/* 00007EDC 38600001 */ li r3, 1
/* 00007EE0 4BFF86F5 */ bl lbl_000005D4
/* 00007EE4 2C030000 */ cmpwi r3, 0
/* 00007EE8 4182001C */ beq lbl_00007F04
/* 00007EEC 88700004 */ lbz r3, 4(r16)
/* 00007EF0 7C600774 */ extsb r0, r3
/* 00007EF4 2C000005 */ cmpwi r0, 5
/* 00007EF8 4080000C */ bge lbl_00007F04
/* 00007EFC 38030001 */ addi r0, r3, 1
/* 00007F00 98100004 */ stb r0, 4(r16)
lbl_00007F04:
/* 00007F04 88100004 */ lbz r0, 4(r16)
/* 00007F08 7C000774 */ extsb r0, r0
/* 00007F0C 7C0F0000 */ cmpw r15, r0
/* 00007F10 4182000C */ beq lbl_00007F1C
/* 00007F14 3860006C */ li r3, 0x6c
/* 00007F18 4BFF8271 */ bl u_play_sound_0
lbl_00007F1C:
/* 00007F1C 38600007 */ li r3, 7
/* 00007F20 4BFF86B5 */ bl lbl_000005D4
/* 00007F24 2C030000 */ cmpwi r3, 0
/* 00007F28 4182004C */ beq lbl_00007F74
/* 00007F2C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007F30 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00007F34 38000001 */ li r0, 1
/* 00007F38 90030008 */ stw r0, 8(r3)
/* 00007F3C 39E00000 */ li r15, 0
/* 00007F40 38600018 */ li r3, 0x18
/* 00007F44 91F0000C */ stw r15, 0xc(r16)
/* 00007F48 4BFF8241 */ bl find_sprite_with_tag
/* 00007F4C 28030000 */ cmplwi r3, 0
/* 00007F50 41820008 */ beq lbl_00007F58
/* 00007F54 91E30048 */ stw r15, 0x48(r3)
lbl_00007F58:
/* 00007F58 38600022 */ li r3, 0x22
/* 00007F5C 4BFF822D */ bl find_sprite_with_tag
/* 00007F60 28030000 */ cmplwi r3, 0
/* 00007F64 418218F0 */ beq lbl_00009854
/* 00007F68 38000000 */ li r0, 0
/* 00007F6C 90030048 */ stw r0, 0x48(r3)
/* 00007F70 480018E4 */ b lbl_00009854
lbl_00007F74:
/* 00007F74 38600006 */ li r3, 6
/* 00007F78 4BFF865D */ bl lbl_000005D4
/* 00007F7C 2C030000 */ cmpwi r3, 0
/* 00007F80 418218D4 */ beq lbl_00009854
/* 00007F84 3860006A */ li r3, 0x6a
/* 00007F88 4BFF8201 */ bl u_play_sound_0
/* 00007F8C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00007F90 38000024 */ li r0, 0x24
/* 00007F94 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00007F98 38000000 */ li r0, 0
/* 00007F9C 98100009 */ stb r0, 9(r16)
/* 00007FA0 88100004 */ lbz r0, 4(r16)
/* 00007FA4 2C000001 */ cmpwi r0, 1
/* 00007FA8 4082000C */ bne lbl_00007FB4
/* 00007FAC 39E00005 */ li r15, 5
/* 00007FB0 48000008 */ b lbl_00007FB8
lbl_00007FB4:
/* 00007FB4 39E00006 */ li r15, 6
lbl_00007FB8:
/* 00007FB8 38600018 */ li r3, 0x18
/* 00007FBC 4BFF81CD */ bl find_sprite_with_tag
/* 00007FC0 28030000 */ cmplwi r3, 0
/* 00007FC4 41820008 */ beq lbl_00007FCC
/* 00007FC8 91E30048 */ stw r15, 0x48(r3)
lbl_00007FCC:
/* 00007FCC 38600022 */ li r3, 0x22
/* 00007FD0 4BFF81B9 */ bl find_sprite_with_tag
/* 00007FD4 28030000 */ cmplwi r3, 0
/* 00007FD8 4182187C */ beq lbl_00009854
/* 00007FDC 38000002 */ li r0, 2
/* 00007FE0 90030048 */ stw r0, 0x48(r3)
/* 00007FE4 48001870 */ b lbl_00009854
lbl_00007FE8:
/* 00007FE8 3C600000 */ lis r3, lbl_801EED98@ha
/* 00007FEC 3AA30000 */ addi r21, r3, lbl_801EED98@l
/* 00007FF0 8A150005 */ lbz r16, 5(r21)
/* 00007FF4 38600000 */ li r3, 0
/* 00007FF8 7E100774 */ extsb r16, r16
/* 00007FFC 4BFF85D9 */ bl lbl_000005D4
/* 00008000 2C030000 */ cmpwi r3, 0
/* 00008004 41820020 */ beq lbl_00008024
/* 00008008 88750005 */ lbz r3, 5(r21)
/* 0000800C 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00008010 7C600775 */ extsb. r0, r3
/* 00008014 98750005 */ stb r3, 5(r21)
/* 00008018 4080000C */ bge lbl_00008024
/* 0000801C 38000002 */ li r0, 2
/* 00008020 98150005 */ stb r0, 5(r21)
lbl_00008024:
/* 00008024 38600001 */ li r3, 1
/* 00008028 4BFF85AD */ bl lbl_000005D4
/* 0000802C 2C030000 */ cmpwi r3, 0
/* 00008030 41820024 */ beq lbl_00008054
/* 00008034 88750005 */ lbz r3, 5(r21)
/* 00008038 38630001 */ addi r3, r3, 1
/* 0000803C 7C600774 */ extsb r0, r3
/* 00008040 98750005 */ stb r3, 5(r21)
/* 00008044 2C000002 */ cmpwi r0, 2
/* 00008048 4081000C */ ble lbl_00008054
/* 0000804C 38000000 */ li r0, 0
/* 00008050 98150005 */ stb r0, 5(r21)
lbl_00008054:
/* 00008054 38600000 */ li r3, 0
/* 00008058 4BFF857D */ bl lbl_000005D4
/* 0000805C 2C030000 */ cmpwi r3, 0
/* 00008060 40820014 */ bne lbl_00008074
/* 00008064 38600001 */ li r3, 1
/* 00008068 4BFF856D */ bl lbl_000005D4
/* 0000806C 2C030000 */ cmpwi r3, 0
/* 00008070 4182000C */ beq lbl_0000807C
lbl_00008074:
/* 00008074 3860006C */ li r3, 0x6c
/* 00008078 4BFF8111 */ bl u_play_sound_0
lbl_0000807C:
/* 0000807C 39E00000 */ li r15, 0
/* 00008080 38600007 */ li r3, 7
/* 00008084 4BFF8551 */ bl lbl_000005D4
/* 00008088 2C030000 */ cmpwi r3, 0
/* 0000808C 4182002C */ beq lbl_000080B8
/* 00008090 88150009 */ lbz r0, 9(r21)
/* 00008094 7C000775 */ extsb. r0, r0
/* 00008098 40810020 */ ble lbl_000080B8
/* 0000809C 38600066 */ li r3, 0x66
/* 000080A0 4BFF80E9 */ bl u_play_sound_0
/* 000080A4 88750009 */ lbz r3, 9(r21)
/* 000080A8 39E00001 */ li r15, 1
/* 000080AC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000080B0 98150009 */ stb r0, 9(r21)
/* 000080B4 4800003C */ b lbl_000080F0
lbl_000080B8:
/* 000080B8 38600006 */ li r3, 6
/* 000080BC 4BFF8519 */ bl lbl_000005D4
/* 000080C0 2C030000 */ cmpwi r3, 0
/* 000080C4 4182002C */ beq lbl_000080F0
/* 000080C8 38600065 */ li r3, 0x65
/* 000080CC 4BFF80BD */ bl u_play_sound_0
/* 000080D0 88150009 */ lbz r0, 9(r21)
/* 000080D4 88950005 */ lbz r4, 5(r21)
/* 000080D8 7C000774 */ extsb r0, r0
/* 000080DC 7C750214 */ add r3, r21, r0
/* 000080E0 98830006 */ stb r4, 6(r3)
/* 000080E4 88750009 */ lbz r3, 9(r21)
/* 000080E8 38030001 */ addi r0, r3, 1
/* 000080EC 98150009 */ stb r0, 9(r21)
lbl_000080F0:
/* 000080F0 88150005 */ lbz r0, 5(r21)
/* 000080F4 7C000774 */ extsb r0, r0
/* 000080F8 7C100000 */ cmpw r16, r0
/* 000080FC 41820028 */ beq lbl_00008124
/* 00008100 5400103A */ slwi r0, r0, 2
/* 00008104 7C7D0214 */ add r3, r29, r0
/* 00008108 80030008 */ lwz r0, 8(r3)
/* 0000810C 901F003C */ stw r0, 0x3c(r31)
/* 00008110 4BFF8079 */ bl empty_load_queue
/* 00008114 807F003C */ lwz r3, 0x3c(r31)
/* 00008118 4BFF8071 */ bl preload_stage_files
/* 0000811C 38000001 */ li r0, 1
/* 00008120 901F00C0 */ stw r0, 0xc0(r31)
lbl_00008124:
/* 00008124 2C0F0000 */ cmpwi r15, 0
/* 00008128 40820068 */ bne lbl_00008190
/* 0000812C 38600007 */ li r3, 7
/* 00008130 4BFF84A5 */ bl lbl_000005D4
/* 00008134 2C030000 */ cmpwi r3, 0
/* 00008138 41820058 */ beq lbl_00008190
/* 0000813C 88150009 */ lbz r0, 9(r21)
/* 00008140 7C000775 */ extsb. r0, r0
/* 00008144 4082004C */ bne lbl_00008190
/* 00008148 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000814C 38000023 */ li r0, 0x23
/* 00008150 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00008154 3860006B */ li r3, 0x6b
/* 00008158 4BFF8031 */ bl u_play_sound_0
/* 0000815C 38600018 */ li r3, 0x18
/* 00008160 4BFF8029 */ bl find_sprite_with_tag
/* 00008164 28030000 */ cmplwi r3, 0
/* 00008168 4182000C */ beq lbl_00008174
/* 0000816C 38000004 */ li r0, 4
/* 00008170 90030048 */ stw r0, 0x48(r3)
lbl_00008174:
/* 00008174 38600022 */ li r3, 0x22
/* 00008178 4BFF8011 */ bl find_sprite_with_tag
/* 0000817C 28030000 */ cmplwi r3, 0
/* 00008180 418216D4 */ beq lbl_00009854
/* 00008184 38000001 */ li r0, 1
/* 00008188 90030048 */ stw r0, 0x48(r3)
/* 0000818C 480016C8 */ b lbl_00009854
lbl_00008190:
/* 00008190 88150004 */ lbz r0, 4(r21)
/* 00008194 2C000001 */ cmpwi r0, 1
/* 00008198 4082000C */ bne lbl_000081A4
/* 0000819C 38600001 */ li r3, 1
/* 000081A0 48000008 */ b lbl_000081A8
lbl_000081A4:
/* 000081A4 38600003 */ li r3, 3
lbl_000081A8:
/* 000081A8 88150009 */ lbz r0, 9(r21)
/* 000081AC 7C000774 */ extsb r0, r0
/* 000081B0 7C001800 */ cmpw r0, r3
/* 000081B4 418016A0 */ blt lbl_00009854
/* 000081B8 38000001 */ li r0, 1
/* 000081BC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000081C0 9015000C */ stw r0, 0xc(r21)
/* 000081C4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000081C8 38000025 */ li r0, 0x25
/* 000081CC 90030004 */ stw r0, 4(r3)
/* 000081D0 48001684 */ b lbl_00009854
lbl_000081D4:
/* 000081D4 3C600000 */ lis r3, lbl_801EED98@ha
/* 000081D8 3AA30000 */ addi r21, r3, lbl_801EED98@l
/* 000081DC 3860022D */ li r3, 0x22d
/* 000081E0 4BFF7FA9 */ bl u_play_sound_0
/* 000081E4 3C600000 */ lis r3, currStageId@ha
/* 000081E8 A8030000 */ lha r0, currStageId@l(r3)
/* 000081EC 3860001D */ li r3, 0x1d
/* 000081F0 901F003C */ stw r0, 0x3c(r31)
/* 000081F4 4BFF7F95 */ bl find_sprite_with_tag
/* 000081F8 28030000 */ cmplwi r3, 0
/* 000081FC 4182000C */ beq lbl_00008208
/* 00008200 38000001 */ li r0, 1
/* 00008204 90030048 */ stw r0, 0x48(r3)
lbl_00008208:
/* 00008208 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000820C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008210 38000002 */ li r0, 2
/* 00008214 900300BC */ stw r0, 0xbc(r3)
/* 00008218 3800000F */ li r0, 0xf
/* 0000821C 38600018 */ li r3, 0x18
/* 00008220 90190000 */ stw r0, 0(r25)
/* 00008224 4BFF7F65 */ bl find_sprite_with_tag
/* 00008228 28030000 */ cmplwi r3, 0
/* 0000822C 4182000C */ beq lbl_00008238
/* 00008230 38000000 */ li r0, 0
/* 00008234 90030048 */ stw r0, 0x48(r3)
lbl_00008238:
/* 00008238 38600022 */ li r3, 0x22
/* 0000823C 4BFF7F4D */ bl find_sprite_with_tag
/* 00008240 28030000 */ cmplwi r3, 0
/* 00008244 4182000C */ beq lbl_00008250
/* 00008248 38000003 */ li r0, 3
/* 0000824C 90030048 */ stw r0, 0x48(r3)
lbl_00008250:
/* 00008250 38600016 */ li r3, 0x16
/* 00008254 4BFF7F35 */ bl find_sprite_with_tag
/* 00008258 28030000 */ cmplwi r3, 0
/* 0000825C 4182000C */ beq lbl_00008268
/* 00008260 38000006 */ li r0, 6
/* 00008264 90030048 */ stw r0, 0x48(r3)
lbl_00008268:
/* 00008268 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000826C 38000026 */ li r0, 0x26
/* 00008270 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00008274 3860001A */ li r3, 0x1a
/* 00008278 4BFF7F11 */ bl find_sprite_with_tag
/* 0000827C 28030000 */ cmplwi r3, 0
/* 00008280 4182000C */ beq lbl_0000828C
/* 00008284 38000004 */ li r0, 4
/* 00008288 90030048 */ stw r0, 0x48(r3)
lbl_0000828C:
/* 0000828C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008290 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008294 38000002 */ li r0, 2
/* 00008298 900300F4 */ stw r0, 0xf4(r3)
/* 0000829C 38000001 */ li r0, 1
/* 000082A0 3C600000 */ lis r3, modeCtrl@ha
/* 000082A4 901F0040 */ stw r0, 0x40(r31)
/* 000082A8 38000000 */ li r0, 0
/* 000082AC 38630000 */ addi r3, r3, modeCtrl@l
/* 000082B0 901F0044 */ stw r0, 0x44(r31)
/* 000082B4 901F0048 */ stw r0, 0x48(r31)
/* 000082B8 80030024 */ lwz r0, 0x24(r3)
/* 000082BC 2C000001 */ cmpwi r0, 1
/* 000082C0 40820014 */ bne lbl_000082D4
/* 000082C4 80150000 */ lwz r0, 0(r21)
/* 000082C8 60000001 */ ori r0, r0, 1
/* 000082CC 90150000 */ stw r0, 0(r21)
/* 000082D0 48001584 */ b lbl_00009854
lbl_000082D4:
/* 000082D4 2C000004 */ cmpwi r0, 4
/* 000082D8 4082157C */ bne lbl_00009854
/* 000082DC 80150000 */ lwz r0, 0(r21)
/* 000082E0 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 000082E4 90150000 */ stw r0, 0(r21)
/* 000082E8 4800156C */ b lbl_00009854
lbl_000082EC:
/* 000082EC 3A120108 */ addi r16, r18, 0x108
/* 000082F0 80120108 */ lwz r0, 0x108(r18)
/* 000082F4 3C600000 */ lis r3, lbl_801EED98@ha
/* 000082F8 39E30000 */ addi r15, r3, lbl_801EED98@l
/* 000082FC 2C000000 */ cmpwi r0, 0
/* 00008300 4082003C */ bne lbl_0000833C
/* 00008304 38600006 */ li r3, 6
/* 00008308 4BFF82CD */ bl lbl_000005D4
/* 0000830C 2C030000 */ cmpwi r3, 0
/* 00008310 41820020 */ beq lbl_00008330
/* 00008314 801200F4 */ lwz r0, 0xf4(r18)
/* 00008318 2C000001 */ cmpwi r0, 1
/* 0000831C 40820014 */ bne lbl_00008330
/* 00008320 388F0000 */ addi r4, r15, 0
/* 00008324 387F0098 */ addi r3, r31, 0x98
/* 00008328 38A00010 */ li r5, 0x10
/* 0000832C 4BFF7E5D */ bl memcpy
lbl_00008330:
/* 00008330 38600002 */ li r3, 2
/* 00008334 4BFFA771 */ bl lbl_00002AA4
/* 00008338 480000B8 */ b lbl_000083F0
lbl_0000833C:
/* 0000833C 3A32010C */ addi r17, r18, 0x10c
/* 00008340 38000000 */ li r0, 0
/* 00008344 9812010C */ stb r0, 0x10c(r18)
/* 00008348 38600002 */ li r3, 2
/* 0000834C 4BFFA759 */ bl lbl_00002AA4
/* 00008350 38600007 */ li r3, 7
/* 00008354 4BFF8281 */ bl lbl_000005D4
/* 00008358 2C030000 */ cmpwi r3, 0
/* 0000835C 41820018 */ beq lbl_00008374
/* 00008360 386F0000 */ addi r3, r15, 0
/* 00008364 389F0098 */ addi r4, r31, 0x98
/* 00008368 38A00010 */ li r5, 0x10
/* 0000836C 4BFF7E1D */ bl memcpy
/* 00008370 480014E4 */ b lbl_00009854
lbl_00008374:
/* 00008374 38600006 */ li r3, 6
/* 00008378 4BFF825D */ bl lbl_000005D4
/* 0000837C 2C030000 */ cmpwi r3, 0
/* 00008380 408214D4 */ bne lbl_00009854
/* 00008384 801200F4 */ lwz r0, 0xf4(r18)
/* 00008388 2C000000 */ cmpwi r0, 0
/* 0000838C 41820008 */ beq lbl_00008394
/* 00008390 48000060 */ b lbl_000083F0
lbl_00008394:
/* 00008394 3C600000 */ lis r3, modeCtrl@ha
/* 00008398 38630000 */ addi r3, r3, modeCtrl@l
/* 0000839C 80030024 */ lwz r0, 0x24(r3)
/* 000083A0 2C000002 */ cmpwi r0, 2
/* 000083A4 4182000C */ beq lbl_000083B0
/* 000083A8 2C000003 */ cmpwi r0, 3
/* 000083AC 40820044 */ bne lbl_000083F0
lbl_000083B0:
/* 000083B0 88110000 */ lbz r0, 0(r17)
/* 000083B4 38600000 */ li r3, 0
/* 000083B8 60000003 */ ori r0, r0, 3
/* 000083BC 98110000 */ stb r0, 0(r17)
/* 000083C0 4BFF8215 */ bl lbl_000005D4
/* 000083C4 2C030000 */ cmpwi r3, 0
/* 000083C8 40820014 */ bne lbl_000083DC
/* 000083CC 38600001 */ li r3, 1
/* 000083D0 4BFF8205 */ bl lbl_000005D4
/* 000083D4 2C030000 */ cmpwi r3, 0
/* 000083D8 41820018 */ beq lbl_000083F0
lbl_000083DC:
/* 000083DC 800F0000 */ lwz r0, 0(r15)
/* 000083E0 38600065 */ li r3, 0x65
/* 000083E4 68000001 */ xori r0, r0, 1
/* 000083E8 900F0000 */ stw r0, 0(r15)
/* 000083EC 4BFF7D9D */ bl u_play_sound_0
lbl_000083F0:
/* 000083F0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000083F4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000083F8 3A2300F4 */ addi r17, r3, 0xf4
/* 000083FC 808300F4 */ lwz r4, 0xf4(r3)
/* 00008400 38600017 */ li r3, 0x17
/* 00008404 39E40034 */ addi r15, r4, 0x34
/* 00008408 4BFF7D81 */ bl find_sprite_with_tag
/* 0000840C 28030000 */ cmplwi r3, 0
/* 00008410 41820008 */ beq lbl_00008418
/* 00008414 91E30048 */ stw r15, 0x48(r3)
lbl_00008418:
/* 00008418 80110000 */ lwz r0, 0(r17)
/* 0000841C 2C000000 */ cmpwi r0, 0
/* 00008420 40820054 */ bne lbl_00008474
/* 00008424 3C600000 */ lis r3, modeCtrl@ha
/* 00008428 38630000 */ addi r3, r3, modeCtrl@l
/* 0000842C 80030024 */ lwz r0, 0x24(r3)
/* 00008430 2C000001 */ cmpwi r0, 1
/* 00008434 40820020 */ bne lbl_00008454
/* 00008438 38600017 */ li r3, 0x17
/* 0000843C 4BFF7D4D */ bl find_sprite_with_tag
/* 00008440 28030000 */ cmplwi r3, 0
/* 00008444 41820030 */ beq lbl_00008474
/* 00008448 38000037 */ li r0, 0x37
/* 0000844C 90030048 */ stw r0, 0x48(r3)
/* 00008450 48000024 */ b lbl_00008474
lbl_00008454:
/* 00008454 2C000004 */ cmpwi r0, 4
/* 00008458 4082001C */ bne lbl_00008474
/* 0000845C 38600017 */ li r3, 0x17
/* 00008460 4BFF7D29 */ bl find_sprite_with_tag
/* 00008464 28030000 */ cmplwi r3, 0
/* 00008468 4182000C */ beq lbl_00008474
/* 0000846C 38000038 */ li r0, 0x38
/* 00008470 90030048 */ stw r0, 0x48(r3)
lbl_00008474:
/* 00008474 38600007 */ li r3, 7
/* 00008478 4BFF815D */ bl lbl_000005D4
/* 0000847C 2C030000 */ cmpwi r3, 0
/* 00008480 4182003C */ beq lbl_000084BC
/* 00008484 80100000 */ lwz r0, 0(r16)
/* 00008488 2C000000 */ cmpwi r0, 0
/* 0000848C 40820030 */ bne lbl_000084BC
/* 00008490 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008494 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008498 38000001 */ li r0, 1
/* 0000849C 90030008 */ stw r0, 8(r3)
/* 000084A0 3860001A */ li r3, 0x1a
/* 000084A4 4BFF7CE5 */ bl find_sprite_with_tag
/* 000084A8 28030000 */ cmplwi r3, 0
/* 000084AC 418213A8 */ beq lbl_00009854
/* 000084B0 38000000 */ li r0, 0
/* 000084B4 90030048 */ stw r0, 0x48(r3)
/* 000084B8 4800139C */ b lbl_00009854
lbl_000084BC:
/* 000084BC 80110000 */ lwz r0, 0(r17)
/* 000084C0 2C000002 */ cmpwi r0, 2
/* 000084C4 40821390 */ bne lbl_00009854
/* 000084C8 38600006 */ li r3, 6
/* 000084CC 4BFF8109 */ bl lbl_000005D4
/* 000084D0 2C030000 */ cmpwi r3, 0
/* 000084D4 40820008 */ bne lbl_000084DC
/* 000084D8 4800137C */ b lbl_00009854
lbl_000084DC:
/* 000084DC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000084E0 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 000084E4 38000033 */ li r0, 0x33
/* 000084E8 3C600000 */ lis r3, modeCtrl@ha
/* 000084EC 90040004 */ stw r0, 4(r4)
/* 000084F0 38630000 */ addi r3, r3, modeCtrl@l
/* 000084F4 80030008 */ lwz r0, 8(r3)
/* 000084F8 60000004 */ ori r0, r0, 4
/* 000084FC 90030008 */ stw r0, 8(r3)
/* 00008500 48001354 */ b lbl_00009854
lbl_00008504:
/* 00008504 3860022D */ li r3, 0x22d
/* 00008508 4BFF7C81 */ bl u_play_sound_0
/* 0000850C 3860001D */ li r3, 0x1d
/* 00008510 4BFF7C79 */ bl find_sprite_with_tag
/* 00008514 28030000 */ cmplwi r3, 0
/* 00008518 4182000C */ beq lbl_00008524
/* 0000851C 38000001 */ li r0, 1
/* 00008520 90030048 */ stw r0, 0x48(r3)
lbl_00008524:
/* 00008524 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008528 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000852C 38000002 */ li r0, 2
/* 00008530 900300BC */ stw r0, 0xbc(r3)
/* 00008534 3800000F */ li r0, 0xf
/* 00008538 38600016 */ li r3, 0x16
/* 0000853C 90190000 */ stw r0, 0(r25)
/* 00008540 4BFF7C49 */ bl find_sprite_with_tag
/* 00008544 28030000 */ cmplwi r3, 0
/* 00008548 4182000C */ beq lbl_00008554
/* 0000854C 38000006 */ li r0, 6
/* 00008550 90030048 */ stw r0, 0x48(r3)
lbl_00008554:
/* 00008554 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008558 38000028 */ li r0, 0x28
/* 0000855C 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00008560 3860001A */ li r3, 0x1a
/* 00008564 4BFF7C25 */ bl find_sprite_with_tag
/* 00008568 28030000 */ cmplwi r3, 0
/* 0000856C 4182000C */ beq lbl_00008578
/* 00008570 38000008 */ li r0, 8
/* 00008574 90030048 */ stw r0, 0x48(r3)
lbl_00008578:
/* 00008578 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000857C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008580 38000004 */ li r0, 4
/* 00008584 900300F4 */ stw r0, 0xf4(r3)
/* 00008588 38600001 */ li r3, 1
/* 0000858C 38000000 */ li r0, 0
/* 00008590 907F0040 */ stw r3, 0x40(r31)
/* 00008594 901F0044 */ stw r0, 0x44(r31)
/* 00008598 901F0048 */ stw r0, 0x48(r31)
/* 0000859C 480012B8 */ b lbl_00009854
lbl_000085A0:
/* 000085A0 3A320108 */ addi r17, r18, 0x108
/* 000085A4 80120108 */ lwz r0, 0x108(r18)
/* 000085A8 3C600000 */ lis r3, lbl_802F1BFC@ha
/* 000085AC 3AA30000 */ addi r21, r3, lbl_802F1BFC@l
/* 000085B0 2C000000 */ cmpwi r0, 0
/* 000085B4 4082003C */ bne lbl_000085F0
/* 000085B8 38600006 */ li r3, 6
/* 000085BC 4BFF8019 */ bl lbl_000005D4
/* 000085C0 2C030000 */ cmpwi r3, 0
/* 000085C4 41820020 */ beq lbl_000085E4
/* 000085C8 801200F4 */ lwz r0, 0xf4(r18)
/* 000085CC 2C000003 */ cmpwi r0, 3
/* 000085D0 40820014 */ bne lbl_000085E4
/* 000085D4 38950000 */ addi r4, r21, 0
/* 000085D8 387F00A8 */ addi r3, r31, 0xa8
/* 000085DC 38A00008 */ li r5, 8
/* 000085E0 4BFF7BA9 */ bl memcpy
lbl_000085E4:
/* 000085E4 38600004 */ li r3, 4
/* 000085E8 4BFFA4BD */ bl lbl_00002AA4
/* 000085EC 4800017C */ b lbl_00008768
lbl_000085F0:
/* 000085F0 3A12010C */ addi r16, r18, 0x10c
/* 000085F4 38000000 */ li r0, 0
/* 000085F8 9812010C */ stb r0, 0x10c(r18)
/* 000085FC 38600004 */ li r3, 4
/* 00008600 4BFFA4A5 */ bl lbl_00002AA4
/* 00008604 38600007 */ li r3, 7
/* 00008608 4BFF7FCD */ bl lbl_000005D4
/* 0000860C 2C030000 */ cmpwi r3, 0
/* 00008610 41820018 */ beq lbl_00008628
/* 00008614 38750000 */ addi r3, r21, 0
/* 00008618 389F00A8 */ addi r4, r31, 0xa8
/* 0000861C 38A00008 */ li r5, 8
/* 00008620 4BFF7B69 */ bl memcpy
/* 00008624 48001230 */ b lbl_00009854
lbl_00008628:
/* 00008628 38600006 */ li r3, 6
/* 0000862C 4BFF7FA9 */ bl lbl_000005D4
/* 00008630 2C030000 */ cmpwi r3, 0
/* 00008634 40821220 */ bne lbl_00009854
/* 00008638 801200F4 */ lwz r0, 0xf4(r18)
/* 0000863C 2C000001 */ cmpwi r0, 1
/* 00008640 418200A4 */ beq lbl_000086E4
/* 00008644 40800010 */ bge lbl_00008654
/* 00008648 2C000000 */ cmpwi r0, 0
/* 0000864C 40800014 */ bge lbl_00008660
/* 00008650 48000118 */ b lbl_00008768
lbl_00008654:
/* 00008654 2C000003 */ cmpwi r0, 3
/* 00008658 40800110 */ bge lbl_00008768
/* 0000865C 480000CC */ b lbl_00008728
lbl_00008660:
/* 00008660 88150000 */ lbz r0, 0(r21)
/* 00008664 7C000774 */ extsb r0, r0
/* 00008668 2C000005 */ cmpwi r0, 5
/* 0000866C 40810034 */ ble lbl_000086A0
/* 00008670 88100000 */ lbz r0, 0(r16)
/* 00008674 38600000 */ li r3, 0
/* 00008678 60000001 */ ori r0, r0, 1
/* 0000867C 98100000 */ stb r0, 0(r16)
/* 00008680 4BFF7F55 */ bl lbl_000005D4
/* 00008684 2C030000 */ cmpwi r3, 0
/* 00008688 41820018 */ beq lbl_000086A0
/* 0000868C 38600065 */ li r3, 0x65
/* 00008690 4BFF7AF9 */ bl u_play_sound_0
/* 00008694 88750000 */ lbz r3, 0(r21)
/* 00008698 3803FFFB */ addi r0, r3, -5  ;# fixed addi
/* 0000869C 98150000 */ stb r0, 0(r21)
lbl_000086A0:
/* 000086A0 88150000 */ lbz r0, 0(r21)
/* 000086A4 7C000774 */ extsb r0, r0
/* 000086A8 2C00000F */ cmpwi r0, 0xf
/* 000086AC 408000BC */ bge lbl_00008768
/* 000086B0 88100000 */ lbz r0, 0(r16)
/* 000086B4 38600001 */ li r3, 1
/* 000086B8 60000002 */ ori r0, r0, 2
/* 000086BC 98100000 */ stb r0, 0(r16)
/* 000086C0 4BFF7F15 */ bl lbl_000005D4
/* 000086C4 2C030000 */ cmpwi r3, 0
/* 000086C8 418200A0 */ beq lbl_00008768
/* 000086CC 38600065 */ li r3, 0x65
/* 000086D0 4BFF7AB9 */ bl u_play_sound_0
/* 000086D4 88750000 */ lbz r3, 0(r21)
/* 000086D8 38030005 */ addi r0, r3, 5
/* 000086DC 98150000 */ stb r0, 0(r21)
/* 000086E0 48000088 */ b lbl_00008768
lbl_000086E4:
/* 000086E4 88100000 */ lbz r0, 0(r16)
/* 000086E8 38600000 */ li r3, 0
/* 000086EC 60000003 */ ori r0, r0, 3
/* 000086F0 98100000 */ stb r0, 0(r16)
/* 000086F4 4BFF7EE1 */ bl lbl_000005D4
/* 000086F8 2C030000 */ cmpwi r3, 0
/* 000086FC 40820014 */ bne lbl_00008710
/* 00008700 38600001 */ li r3, 1
/* 00008704 4BFF7ED1 */ bl lbl_000005D4
/* 00008708 2C030000 */ cmpwi r3, 0
/* 0000870C 4182005C */ beq lbl_00008768
lbl_00008710:
/* 00008710 80150004 */ lwz r0, 4(r21)
/* 00008714 38600065 */ li r3, 0x65
/* 00008718 68000008 */ xori r0, r0, 8
/* 0000871C 90150004 */ stw r0, 4(r21)
/* 00008720 4BFF7A69 */ bl u_play_sound_0
/* 00008724 48000044 */ b lbl_00008768
lbl_00008728:
/* 00008728 88100000 */ lbz r0, 0(r16)
/* 0000872C 38600000 */ li r3, 0
/* 00008730 60000003 */ ori r0, r0, 3
/* 00008734 98100000 */ stb r0, 0(r16)
/* 00008738 4BFF7E9D */ bl lbl_000005D4
/* 0000873C 2C030000 */ cmpwi r3, 0
/* 00008740 40820014 */ bne lbl_00008754
/* 00008744 38600001 */ li r3, 1
/* 00008748 4BFF7E8D */ bl lbl_000005D4
/* 0000874C 2C030000 */ cmpwi r3, 0
/* 00008750 41820018 */ beq lbl_00008768
lbl_00008754:
/* 00008754 80150004 */ lwz r0, 4(r21)
/* 00008758 38600065 */ li r3, 0x65
/* 0000875C 68000010 */ xori r0, r0, 0x10
/* 00008760 90150004 */ stw r0, 4(r21)
/* 00008764 4BFF7A25 */ bl u_play_sound_0
lbl_00008768:
/* 00008768 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000876C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008770 3A0300F4 */ addi r16, r3, 0xf4
/* 00008774 808300F4 */ lwz r4, 0xf4(r3)
/* 00008778 38600017 */ li r3, 0x17
/* 0000877C 39E40054 */ addi r15, r4, 0x54
/* 00008780 4BFF7A09 */ bl find_sprite_with_tag
/* 00008784 28030000 */ cmplwi r3, 0
/* 00008788 41820008 */ beq lbl_00008790
/* 0000878C 91E30048 */ stw r15, 0x48(r3)
lbl_00008790:
/* 00008790 80100000 */ lwz r0, 0(r16)
/* 00008794 2C000000 */ cmpwi r0, 0
/* 00008798 40820050 */ bne lbl_000087E8
/* 0000879C 88150000 */ lbz r0, 0(r21)
/* 000087A0 7C000774 */ extsb r0, r0
/* 000087A4 2C000005 */ cmpwi r0, 5
/* 000087A8 40820020 */ bne lbl_000087C8
/* 000087AC 38600017 */ li r3, 0x17
/* 000087B0 4BFF79D9 */ bl find_sprite_with_tag
/* 000087B4 28030000 */ cmplwi r3, 0
/* 000087B8 41820030 */ beq lbl_000087E8
/* 000087BC 38000059 */ li r0, 0x59
/* 000087C0 90030048 */ stw r0, 0x48(r3)
/* 000087C4 48000024 */ b lbl_000087E8
lbl_000087C8:
/* 000087C8 2C00000F */ cmpwi r0, 0xf
/* 000087CC 4082001C */ bne lbl_000087E8
/* 000087D0 38600017 */ li r3, 0x17
/* 000087D4 4BFF79B5 */ bl find_sprite_with_tag
/* 000087D8 28030000 */ cmplwi r3, 0
/* 000087DC 4182000C */ beq lbl_000087E8
/* 000087E0 3800005A */ li r0, 0x5a
/* 000087E4 90030048 */ stw r0, 0x48(r3)
lbl_000087E8:
/* 000087E8 38600007 */ li r3, 7
/* 000087EC 4BFF7DE9 */ bl lbl_000005D4
/* 000087F0 2C030000 */ cmpwi r3, 0
/* 000087F4 4182003C */ beq lbl_00008830
/* 000087F8 80110000 */ lwz r0, 0(r17)
/* 000087FC 2C000000 */ cmpwi r0, 0
/* 00008800 40820030 */ bne lbl_00008830
/* 00008804 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008808 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000880C 38000001 */ li r0, 1
/* 00008810 90030008 */ stw r0, 8(r3)
/* 00008814 3860001A */ li r3, 0x1a
/* 00008818 4BFF7971 */ bl find_sprite_with_tag
/* 0000881C 28030000 */ cmplwi r3, 0
/* 00008820 41821034 */ beq lbl_00009854
/* 00008824 38000000 */ li r0, 0
/* 00008828 90030048 */ stw r0, 0x48(r3)
/* 0000882C 48001028 */ b lbl_00009854
lbl_00008830:
/* 00008830 80100000 */ lwz r0, 0(r16)
/* 00008834 2C000004 */ cmpwi r0, 4
/* 00008838 4082101C */ bne lbl_00009854
/* 0000883C 38600006 */ li r3, 6
/* 00008840 4BFF7D95 */ bl lbl_000005D4
/* 00008844 2C030000 */ cmpwi r3, 0
/* 00008848 40820008 */ bne lbl_00008850
/* 0000884C 48001008 */ b lbl_00009854
lbl_00008850:
/* 00008850 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008854 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00008858 38000033 */ li r0, 0x33
/* 0000885C 3C600000 */ lis r3, modeCtrl@ha
/* 00008860 90040004 */ stw r0, 4(r4)
/* 00008864 38630000 */ addi r3, r3, modeCtrl@l
/* 00008868 80030008 */ lwz r0, 8(r3)
/* 0000886C 60000004 */ ori r0, r0, 4
/* 00008870 90030008 */ stw r0, 8(r3)
/* 00008874 48000FE0 */ b lbl_00009854
lbl_00008878:
/* 00008878 38600016 */ li r3, 0x16
/* 0000887C 4BFF790D */ bl find_sprite_with_tag
/* 00008880 28030000 */ cmplwi r3, 0
/* 00008884 4182000C */ beq lbl_00008890
/* 00008888 38000000 */ li r0, 0
/* 0000888C 90030048 */ stw r0, 0x48(r3)
lbl_00008890:
/* 00008890 387E02E4 */ addi r3, r30, 0x2e4
/* 00008894 48001E35 */ bl lbl_0000A6C8
/* 00008898 4BFF78F1 */ bl empty_load_queue
/* 0000889C 4BFF78ED */ bl empty_file_cache
/* 000088A0 387E02F8 */ addi r3, r30, 0x2f8
/* 000088A4 4BFF78E5 */ bl file_preload
/* 000088A8 387E0308 */ addi r3, r30, 0x308
/* 000088AC 4BFF78DD */ bl file_preload
/* 000088B0 387E0318 */ addi r3, r30, 0x318
/* 000088B4 4BFF78D5 */ bl file_preload
/* 000088B8 386000B4 */ li r3, 0xb4
/* 000088BC 4BFF78CD */ bl preload_stage_files
/* 000088C0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000088C4 3800002A */ li r0, 0x2a
/* 000088C8 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 000088CC 48000F88 */ b lbl_00009854
lbl_000088D0:
/* 000088D0 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 000088D4 39E30000 */ addi r15, r3, lbl_802F1BF4@l
/* 000088D8 386F0004 */ addi r3, r15, 4
/* 000088DC 38800000 */ li r4, 0
/* 000088E0 38A00052 */ li r5, 0x52
/* 000088E4 38C0004A */ li r6, 0x4a
/* 000088E8 38E00000 */ li r7, 0
/* 000088EC 39000000 */ li r8, 0
/* 000088F0 39200000 */ li r9, 0
/* 000088F4 4BFF951D */ bl lbl_00001E10
/* 000088F8 38600007 */ li r3, 7
/* 000088FC 4BFF7CD9 */ bl lbl_000005D4
/* 00008900 2C030000 */ cmpwi r3, 0
/* 00008904 41820018 */ beq lbl_0000891C
/* 00008908 38600063 */ li r3, 0x63
/* 0000890C 4BFF787D */ bl destroy_sprite_with_tag
/* 00008910 38000001 */ li r0, 1
/* 00008914 90120008 */ stw r0, 8(r18)
/* 00008918 48000F3C */ b lbl_00009854
lbl_0000891C:
/* 0000891C 38600006 */ li r3, 6
/* 00008920 4BFF7CB5 */ bl lbl_000005D4
/* 00008924 2C030000 */ cmpwi r3, 0
/* 00008928 41820F2C */ beq lbl_00009854
/* 0000892C 800F0004 */ lwz r0, 4(r15)
/* 00008930 2C000001 */ cmpwi r0, 1
/* 00008934 41820058 */ beq lbl_0000898C
/* 00008938 40800F1C */ bge lbl_00009854
/* 0000893C 2C000000 */ cmpwi r0, 0
/* 00008940 40800008 */ bge lbl_00008948
/* 00008944 48000F10 */ b lbl_00009854
lbl_00008948:
/* 00008948 38600226 */ li r3, 0x226
/* 0000894C 4BFF783D */ bl u_play_sound_0
/* 00008950 3800000F */ li r0, 0xf
/* 00008954 90120004 */ stw r0, 4(r18)
/* 00008958 39E00001 */ li r15, 1
/* 0000895C 38000002 */ li r0, 2
/* 00008960 91F20040 */ stw r15, 0x40(r18)
/* 00008964 9012003C */ stw r0, 0x3c(r18)
/* 00008968 4BFF8FA9 */ bl lbl_00001910
/* 0000896C 3C800000 */ lis r4, modeCtrl@ha
/* 00008970 38840000 */ addi r4, r4, modeCtrl@l
/* 00008974 94640024 */ stwu r3, 0x24(r4)
/* 00008978 80040000 */ lwz r0, 0(r4)
/* 0000897C 2C000001 */ cmpwi r0, 1
/* 00008980 40800ED4 */ bge lbl_00009854
/* 00008984 91E40000 */ stw r15, 0(r4)
/* 00008988 48000ECC */ b lbl_00009854
lbl_0000898C:
/* 0000898C 38600227 */ li r3, 0x227
/* 00008990 4BFF77F9 */ bl u_play_sound_0
/* 00008994 38000011 */ li r0, 0x11
/* 00008998 3C600000 */ lis r3, modeCtrl@ha
/* 0000899C 90120004 */ stw r0, 4(r18)
/* 000089A0 38630000 */ addi r3, r3, modeCtrl@l
/* 000089A4 38000001 */ li r0, 1
/* 000089A8 90030024 */ stw r0, 0x24(r3)
/* 000089AC 98120114 */ stb r0, 0x114(r18)
/* 000089B0 48000EA4 */ b lbl_00009854
lbl_000089B4:
/* 000089B4 3860022D */ li r3, 0x22d
/* 000089B8 4BFF77D1 */ bl u_play_sound_0
/* 000089BC 3860001D */ li r3, 0x1d
/* 000089C0 4BFF77C9 */ bl find_sprite_with_tag
/* 000089C4 28030000 */ cmplwi r3, 0
/* 000089C8 4182000C */ beq lbl_000089D4
/* 000089CC 38000001 */ li r0, 1
/* 000089D0 90030048 */ stw r0, 0x48(r3)
lbl_000089D4:
/* 000089D4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000089D8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000089DC 38000002 */ li r0, 2
/* 000089E0 900300BC */ stw r0, 0xbc(r3)
/* 000089E4 3800000F */ li r0, 0xf
/* 000089E8 38600016 */ li r3, 0x16
/* 000089EC 90190000 */ stw r0, 0(r25)
/* 000089F0 4BFF7799 */ bl find_sprite_with_tag
/* 000089F4 28030000 */ cmplwi r3, 0
/* 000089F8 4182000C */ beq lbl_00008A04
/* 000089FC 38000006 */ li r0, 6
/* 00008A00 90030048 */ stw r0, 0x48(r3)
lbl_00008A04:
/* 00008A04 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008A08 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00008A0C 3800002C */ li r0, 0x2c
/* 00008A10 3C600000 */ lis r3, modeCtrl@ha
/* 00008A14 90040000 */ stw r0, 0(r4)
/* 00008A18 38630000 */ addi r3, r3, modeCtrl@l
/* 00008A1C 80030024 */ lwz r0, 0x24(r3)
/* 00008A20 2C000001 */ cmpwi r0, 1
/* 00008A24 40820030 */ bne lbl_00008A54
/* 00008A28 3860001A */ li r3, 0x1a
/* 00008A2C 4BFF775D */ bl find_sprite_with_tag
/* 00008A30 28030000 */ cmplwi r3, 0
/* 00008A34 4182000C */ beq lbl_00008A40
/* 00008A38 38000007 */ li r0, 7
/* 00008A3C 90030048 */ stw r0, 0x48(r3)
lbl_00008A40:
/* 00008A40 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008A44 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008A48 38000003 */ li r0, 3
/* 00008A4C 900300F4 */ stw r0, 0xf4(r3)
/* 00008A50 4800002C */ b lbl_00008A7C
lbl_00008A54:
/* 00008A54 3860001A */ li r3, 0x1a
/* 00008A58 4BFF7731 */ bl find_sprite_with_tag
/* 00008A5C 28030000 */ cmplwi r3, 0
/* 00008A60 4182000C */ beq lbl_00008A6C
/* 00008A64 38000006 */ li r0, 6
/* 00008A68 90030048 */ stw r0, 0x48(r3)
lbl_00008A6C:
/* 00008A6C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008A70 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008A74 38000002 */ li r0, 2
/* 00008A78 900300F4 */ stw r0, 0xf4(r3)
lbl_00008A7C:
/* 00008A7C 38000001 */ li r0, 1
/* 00008A80 901F0040 */ stw r0, 0x40(r31)
/* 00008A84 38000000 */ li r0, 0
/* 00008A88 901F0044 */ stw r0, 0x44(r31)
/* 00008A8C 901F0048 */ stw r0, 0x48(r31)
/* 00008A90 48000DC4 */ b lbl_00009854
lbl_00008A94:
/* 00008A94 3C600000 */ lis r3, modeCtrl@ha
/* 00008A98 38630000 */ addi r3, r3, modeCtrl@l
/* 00008A9C 3A630024 */ addi r19, r3, 0x24
/* 00008AA0 80030024 */ lwz r0, 0x24(r3)
/* 00008AA4 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 00008AA8 3AA30000 */ addi r21, r3, lbl_802F1BF4@l
/* 00008AAC 2C000001 */ cmpwi r0, 1
/* 00008AB0 4082000C */ bne lbl_00008ABC
/* 00008AB4 39E00003 */ li r15, 3
/* 00008AB8 48000008 */ b lbl_00008AC0
lbl_00008ABC:
/* 00008ABC 39E00002 */ li r15, 2
lbl_00008AC0:
/* 00008AC0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008AC4 3A430000 */ addi r18, r3, lbl_801EEDA8@l
/* 00008AC8 80120108 */ lwz r0, 0x108(r18)
/* 00008ACC 3A320108 */ addi r17, r18, 0x108
/* 00008AD0 2C000000 */ cmpwi r0, 0
/* 00008AD4 40820044 */ bne lbl_00008B18
/* 00008AD8 38600006 */ li r3, 6
/* 00008ADC 4BFF7AF9 */ bl lbl_000005D4
/* 00008AE0 2C030000 */ cmpwi r3, 0
/* 00008AE4 41820028 */ beq lbl_00008B0C
/* 00008AE8 807200F4 */ lwz r3, 0xf4(r18)
/* 00008AEC 380FFFFF */ addi r0, r15, -1  ;# fixed addi
/* 00008AF0 7C030000 */ cmpw r3, r0
/* 00008AF4 40820018 */ bne lbl_00008B0C
/* 00008AF8 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 00008AFC 38830000 */ addi r4, r3, lbl_802F1BF4@l
/* 00008B00 387F00B0 */ addi r3, r31, 0xb0
/* 00008B04 38A00008 */ li r5, 8
/* 00008B08 4BFF7681 */ bl memcpy
lbl_00008B0C:
/* 00008B0C 7DE37B78 */ mr r3, r15
/* 00008B10 4BFF9F95 */ bl lbl_00002AA4
/* 00008B14 48000178 */ b lbl_00008C8C
lbl_00008B18:
/* 00008B18 3A12010C */ addi r16, r18, 0x10c
/* 00008B1C 38000000 */ li r0, 0
/* 00008B20 9812010C */ stb r0, 0x10c(r18)
/* 00008B24 7DE37B78 */ mr r3, r15
/* 00008B28 4BFF9F7D */ bl lbl_00002AA4
/* 00008B2C 38600007 */ li r3, 7
/* 00008B30 4BFF7AA5 */ bl lbl_000005D4
/* 00008B34 2C030000 */ cmpwi r3, 0
/* 00008B38 4182001C */ beq lbl_00008B54
/* 00008B3C 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 00008B40 38630000 */ addi r3, r3, lbl_802F1BF4@l
/* 00008B44 389F00B0 */ addi r4, r31, 0xb0
/* 00008B48 38A00008 */ li r5, 8
/* 00008B4C 4BFF763D */ bl memcpy
/* 00008B50 48000D04 */ b lbl_00009854
lbl_00008B54:
/* 00008B54 38600006 */ li r3, 6
/* 00008B58 4BFF7A7D */ bl lbl_000005D4
/* 00008B5C 2C030000 */ cmpwi r3, 0
/* 00008B60 40820CF4 */ bne lbl_00009854
/* 00008B64 801200F4 */ lwz r0, 0xf4(r18)
/* 00008B68 2C000001 */ cmpwi r0, 1
/* 00008B6C 41820098 */ beq lbl_00008C04
/* 00008B70 4080011C */ bge lbl_00008C8C
/* 00008B74 2C000000 */ cmpwi r0, 0
/* 00008B78 40800008 */ bge lbl_00008B80
/* 00008B7C 48000110 */ b lbl_00008C8C
lbl_00008B80:
/* 00008B80 88150000 */ lbz r0, 0(r21)
/* 00008B84 7C000774 */ extsb r0, r0
/* 00008B88 2C000001 */ cmpwi r0, 1
/* 00008B8C 40810034 */ ble lbl_00008BC0
/* 00008B90 88100000 */ lbz r0, 0(r16)
/* 00008B94 38600000 */ li r3, 0
/* 00008B98 60000001 */ ori r0, r0, 1
/* 00008B9C 98100000 */ stb r0, 0(r16)
/* 00008BA0 4BFF7A35 */ bl lbl_000005D4
/* 00008BA4 2C030000 */ cmpwi r3, 0
/* 00008BA8 41820018 */ beq lbl_00008BC0
/* 00008BAC 88950000 */ lbz r4, 0(r21)
/* 00008BB0 38600065 */ li r3, 0x65
/* 00008BB4 3804FFFE */ addi r0, r4, -2  ;# fixed addi
/* 00008BB8 98150000 */ stb r0, 0(r21)
/* 00008BBC 4BFF75CD */ bl u_play_sound_0
lbl_00008BC0:
/* 00008BC0 88150000 */ lbz r0, 0(r21)
/* 00008BC4 7C000774 */ extsb r0, r0
/* 00008BC8 2C000063 */ cmpwi r0, 0x63
/* 00008BCC 408000C0 */ bge lbl_00008C8C
/* 00008BD0 88100000 */ lbz r0, 0(r16)
/* 00008BD4 38600001 */ li r3, 1
/* 00008BD8 60000002 */ ori r0, r0, 2
/* 00008BDC 98100000 */ stb r0, 0(r16)
/* 00008BE0 4BFF79F5 */ bl lbl_000005D4
/* 00008BE4 2C030000 */ cmpwi r3, 0
/* 00008BE8 418200A4 */ beq lbl_00008C8C
/* 00008BEC 88950000 */ lbz r4, 0(r21)
/* 00008BF0 38600065 */ li r3, 0x65
/* 00008BF4 38040002 */ addi r0, r4, 2
/* 00008BF8 98150000 */ stb r0, 0(r21)
/* 00008BFC 4BFF758D */ bl u_play_sound_0
/* 00008C00 4800008C */ b lbl_00008C8C
lbl_00008C04:
/* 00008C04 80130000 */ lwz r0, 0(r19)
/* 00008C08 2C000001 */ cmpwi r0, 1
/* 00008C0C 40820080 */ bne lbl_00008C8C
/* 00008C10 88150001 */ lbz r0, 1(r21)
/* 00008C14 7C000775 */ extsb. r0, r0
/* 00008C18 40810034 */ ble lbl_00008C4C
/* 00008C1C 88100000 */ lbz r0, 0(r16)
/* 00008C20 38600000 */ li r3, 0
/* 00008C24 60000001 */ ori r0, r0, 1
/* 00008C28 98100000 */ stb r0, 0(r16)
/* 00008C2C 4BFF79A9 */ bl lbl_000005D4
/* 00008C30 2C030000 */ cmpwi r3, 0
/* 00008C34 41820018 */ beq lbl_00008C4C
/* 00008C38 88950001 */ lbz r4, 1(r21)
/* 00008C3C 38600065 */ li r3, 0x65
/* 00008C40 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 00008C44 98150001 */ stb r0, 1(r21)
/* 00008C48 4BFF7541 */ bl u_play_sound_0
lbl_00008C4C:
/* 00008C4C 88150001 */ lbz r0, 1(r21)
/* 00008C50 7C000774 */ extsb r0, r0
/* 00008C54 2C000004 */ cmpwi r0, 4
/* 00008C58 40800034 */ bge lbl_00008C8C
/* 00008C5C 88100000 */ lbz r0, 0(r16)
/* 00008C60 38600001 */ li r3, 1
/* 00008C64 60000002 */ ori r0, r0, 2
/* 00008C68 98100000 */ stb r0, 0(r16)
/* 00008C6C 4BFF7969 */ bl lbl_000005D4
/* 00008C70 2C030000 */ cmpwi r3, 0
/* 00008C74 41820018 */ beq lbl_00008C8C
/* 00008C78 88950001 */ lbz r4, 1(r21)
/* 00008C7C 38600065 */ li r3, 0x65
/* 00008C80 38040001 */ addi r0, r4, 1
/* 00008C84 98150001 */ stb r0, 1(r21)
/* 00008C88 4BFF7501 */ bl u_play_sound_0
lbl_00008C8C:
/* 00008C8C 2C0F0003 */ cmpwi r15, 3
/* 00008C90 4082002C */ bne lbl_00008CBC
/* 00008C94 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008C98 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008C9C 808300F4 */ lwz r4, 0xf4(r3)
/* 00008CA0 38600017 */ li r3, 0x17
/* 00008CA4 3A04004C */ addi r16, r4, 0x4c
/* 00008CA8 4BFF74E1 */ bl find_sprite_with_tag
/* 00008CAC 28030000 */ cmplwi r3, 0
/* 00008CB0 41820030 */ beq lbl_00008CE0
/* 00008CB4 92030048 */ stw r16, 0x48(r3)
/* 00008CB8 48000028 */ b lbl_00008CE0
lbl_00008CBC:
/* 00008CBC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008CC0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008CC4 808300F4 */ lwz r4, 0xf4(r3)
/* 00008CC8 38600017 */ li r3, 0x17
/* 00008CCC 3A040049 */ addi r16, r4, 0x49
/* 00008CD0 4BFF74B9 */ bl find_sprite_with_tag
/* 00008CD4 28030000 */ cmplwi r3, 0
/* 00008CD8 41820008 */ beq lbl_00008CE0
/* 00008CDC 92030048 */ stw r16, 0x48(r3)
lbl_00008CE0:
/* 00008CE0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008CE4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008CE8 A803000C */ lha r0, 0xc(r3)
/* 00008CEC 3A000001 */ li r16, 1
/* 00008CF0 2C00002B */ cmpwi r0, 0x2b
/* 00008CF4 41820008 */ beq lbl_00008CFC
/* 00008CF8 48000008 */ b lbl_00008D00
lbl_00008CFC:
/* 00008CFC 3A000000 */ li r16, 0
lbl_00008D00:
/* 00008D00 38600007 */ li r3, 7
/* 00008D04 4BFF78D1 */ bl lbl_000005D4
/* 00008D08 2C030000 */ cmpwi r3, 0
/* 00008D0C 41820044 */ beq lbl_00008D50
/* 00008D10 2C100000 */ cmpwi r16, 0
/* 00008D14 4182003C */ beq lbl_00008D50
/* 00008D18 80110000 */ lwz r0, 0(r17)
/* 00008D1C 2C000000 */ cmpwi r0, 0
/* 00008D20 40820030 */ bne lbl_00008D50
/* 00008D24 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008D28 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008D2C 38000001 */ li r0, 1
/* 00008D30 90030008 */ stw r0, 8(r3)
/* 00008D34 3860001A */ li r3, 0x1a
/* 00008D38 4BFF7451 */ bl find_sprite_with_tag
/* 00008D3C 28030000 */ cmplwi r3, 0
/* 00008D40 41820B14 */ beq lbl_00009854
/* 00008D44 38000000 */ li r0, 0
/* 00008D48 90030048 */ stw r0, 0x48(r3)
/* 00008D4C 48000B08 */ b lbl_00009854
lbl_00008D50:
/* 00008D50 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008D54 3A030000 */ addi r16, r3, lbl_801EEDA8@l
/* 00008D58 801000F4 */ lwz r0, 0xf4(r16)
/* 00008D5C 7C007800 */ cmpw r0, r15
/* 00008D60 40820AF4 */ bne lbl_00009854
/* 00008D64 38600006 */ li r3, 6
/* 00008D68 4BFF786D */ bl lbl_000005D4
/* 00008D6C 2C030000 */ cmpwi r3, 0
/* 00008D70 40820008 */ bne lbl_00008D78
/* 00008D74 48000AE0 */ b lbl_00009854
lbl_00008D78:
/* 00008D78 38000033 */ li r0, 0x33
/* 00008D7C 3C600000 */ lis r3, modeCtrl@ha
/* 00008D80 90100004 */ stw r0, 4(r16)
/* 00008D84 38630000 */ addi r3, r3, modeCtrl@l
/* 00008D88 80030008 */ lwz r0, 8(r3)
/* 00008D8C 60000004 */ ori r0, r0, 4
/* 00008D90 90030008 */ stw r0, 8(r3)
/* 00008D94 48000AC0 */ b lbl_00009854
lbl_00008D98:
/* 00008D98 38600016 */ li r3, 0x16
/* 00008D9C 4BFF73ED */ bl find_sprite_with_tag
/* 00008DA0 28030000 */ cmplwi r3, 0
/* 00008DA4 4182000C */ beq lbl_00008DB0
/* 00008DA8 38000000 */ li r0, 0
/* 00008DAC 90030048 */ stw r0, 0x48(r3)
lbl_00008DB0:
/* 00008DB0 387E0328 */ addi r3, r30, 0x328
/* 00008DB4 48001915 */ bl lbl_0000A6C8
/* 00008DB8 4BFF73D1 */ bl empty_load_queue
/* 00008DBC 4BFF73CD */ bl empty_file_cache
/* 00008DC0 387E033C */ addi r3, r30, 0x33c
/* 00008DC4 4BFF73C5 */ bl file_preload
/* 00008DC8 387E034C */ addi r3, r30, 0x34c
/* 00008DCC 4BFF73BD */ bl file_preload
/* 00008DD0 387E035C */ addi r3, r30, 0x35c
/* 00008DD4 4BFF73B5 */ bl file_preload
/* 00008DD8 386000B3 */ li r3, 0xb3
/* 00008DDC 4BFF73AD */ bl preload_stage_files
/* 00008DE0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008DE4 3800002E */ li r0, 0x2e
/* 00008DE8 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00008DEC 48000A68 */ b lbl_00009854
lbl_00008DF0:
/* 00008DF0 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00008DF4 38030000 */ addi r0, r3, lbl_802F1BF0@l
/* 00008DF8 7C0F0378 */ mr r15, r0
/* 00008DFC 386F0000 */ addi r3, r15, 0
/* 00008E00 38800000 */ li r4, 0
/* 00008E04 38A00050 */ li r5, 0x50
/* 00008E08 38C00048 */ li r6, 0x48
/* 00008E0C 38E00000 */ li r7, 0
/* 00008E10 39000000 */ li r8, 0
/* 00008E14 39200000 */ li r9, 0
/* 00008E18 4BFF8FF9 */ bl lbl_00001E10
/* 00008E1C 38600007 */ li r3, 7
/* 00008E20 4BFF77B5 */ bl lbl_000005D4
/* 00008E24 2C030000 */ cmpwi r3, 0
/* 00008E28 41820018 */ beq lbl_00008E40
/* 00008E2C 38000001 */ li r0, 1
/* 00008E30 90120008 */ stw r0, 8(r18)
/* 00008E34 38600063 */ li r3, 0x63
/* 00008E38 4BFF7351 */ bl destroy_sprite_with_tag
/* 00008E3C 48000A18 */ b lbl_00009854
lbl_00008E40:
/* 00008E40 38600006 */ li r3, 6
/* 00008E44 4BFF7791 */ bl lbl_000005D4
/* 00008E48 2C030000 */ cmpwi r3, 0
/* 00008E4C 41820A08 */ beq lbl_00009854
/* 00008E50 800F0000 */ lwz r0, 0(r15)
/* 00008E54 2C000001 */ cmpwi r0, 1
/* 00008E58 41820060 */ beq lbl_00008EB8
/* 00008E5C 408009F8 */ bge lbl_00009854
/* 00008E60 2C000000 */ cmpwi r0, 0
/* 00008E64 40800008 */ bge lbl_00008E6C
/* 00008E68 480009EC */ b lbl_00009854
lbl_00008E6C:
/* 00008E6C 38600228 */ li r3, 0x228
/* 00008E70 4BFF7319 */ bl u_play_sound_0
/* 00008E74 39E00001 */ li r15, 1
/* 00008E78 91F20040 */ stw r15, 0x40(r18)
/* 00008E7C 38000004 */ li r0, 4
/* 00008E80 9012003C */ stw r0, 0x3c(r18)
/* 00008E84 4BFF8A8D */ bl lbl_00001910
/* 00008E88 3C800000 */ lis r4, modeCtrl@ha
/* 00008E8C 38840000 */ addi r4, r4, modeCtrl@l
/* 00008E90 94640024 */ stwu r3, 0x24(r4)
/* 00008E94 80040000 */ lwz r0, 0(r4)
/* 00008E98 2C000001 */ cmpwi r0, 1
/* 00008E9C 40800008 */ bge lbl_00008EA4
/* 00008EA0 91E40000 */ stw r15, 0(r4)
lbl_00008EA4:
/* 00008EA4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008EA8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00008EAC 3800000F */ li r0, 0xf
/* 00008EB0 90030004 */ stw r0, 4(r3)
/* 00008EB4 480009A0 */ b lbl_00009854
lbl_00008EB8:
/* 00008EB8 38600229 */ li r3, 0x229
/* 00008EBC 4BFF72CD */ bl u_play_sound_0
/* 00008EC0 38000011 */ li r0, 0x11
/* 00008EC4 3C600000 */ lis r3, modeCtrl@ha
/* 00008EC8 90120004 */ stw r0, 4(r18)
/* 00008ECC 38630000 */ addi r3, r3, modeCtrl@l
/* 00008ED0 38000001 */ li r0, 1
/* 00008ED4 90030024 */ stw r0, 0x24(r3)
/* 00008ED8 98120114 */ stb r0, 0x114(r18)
/* 00008EDC 48000978 */ b lbl_00009854
lbl_00008EE0:
/* 00008EE0 38600016 */ li r3, 0x16
/* 00008EE4 4BFF72A5 */ bl find_sprite_with_tag
/* 00008EE8 28030000 */ cmplwi r3, 0
/* 00008EEC 4182000C */ beq lbl_00008EF8
/* 00008EF0 38000000 */ li r0, 0
/* 00008EF4 90030048 */ stw r0, 0x48(r3)
lbl_00008EF8:
/* 00008EF8 387E036C */ addi r3, r30, 0x36c
/* 00008EFC 480017CD */ bl lbl_0000A6C8
/* 00008F00 4BFF7289 */ bl empty_load_queue
/* 00008F04 4BFF7285 */ bl empty_file_cache
/* 00008F08 387E0380 */ addi r3, r30, 0x380
/* 00008F0C 4BFF727D */ bl file_preload
/* 00008F10 387E0390 */ addi r3, r30, 0x390
/* 00008F14 4BFF7275 */ bl file_preload
/* 00008F18 387E03A0 */ addi r3, r30, 0x3a0
/* 00008F1C 4BFF726D */ bl file_preload
/* 00008F20 387E03B0 */ addi r3, r30, 0x3b0
/* 00008F24 4BFF7265 */ bl file_preload
/* 00008F28 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00008F2C 38000030 */ li r0, 0x30
/* 00008F30 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00008F34 48000920 */ b lbl_00009854
lbl_00008F38:
/* 00008F38 3C600000 */ lis r3, lbl_802F1BE8@ha
/* 00008F3C 38030000 */ addi r0, r3, lbl_802F1BE8@l
/* 00008F40 7C0F0378 */ mr r15, r0
/* 00008F44 386F0000 */ addi r3, r15, 0
/* 00008F48 38800000 */ li r4, 0
/* 00008F4C 38A00040 */ li r5, 0x40
/* 00008F50 38C00045 */ li r6, 0x45
/* 00008F54 38E00000 */ li r7, 0
/* 00008F58 39000000 */ li r8, 0
/* 00008F5C 39200000 */ li r9, 0
/* 00008F60 4BFF8EB1 */ bl lbl_00001E10
/* 00008F64 38600007 */ li r3, 7
/* 00008F68 4BFF766D */ bl lbl_000005D4
/* 00008F6C 2C030000 */ cmpwi r3, 0
/* 00008F70 41820018 */ beq lbl_00008F88
/* 00008F74 38000001 */ li r0, 1
/* 00008F78 90120008 */ stw r0, 8(r18)
/* 00008F7C 38600063 */ li r3, 0x63
/* 00008F80 4BFF7209 */ bl destroy_sprite_with_tag
/* 00008F84 480008D0 */ b lbl_00009854
lbl_00008F88:
/* 00008F88 38600006 */ li r3, 6
/* 00008F8C 4BFF7649 */ bl lbl_000005D4
/* 00008F90 2C030000 */ cmpwi r3, 0
/* 00008F94 418208C0 */ beq lbl_00009854
/* 00008F98 800F0000 */ lwz r0, 0(r15)
/* 00008F9C 2C000001 */ cmpwi r0, 1
/* 00008FA0 41820064 */ beq lbl_00009004
/* 00008FA4 40800010 */ bge lbl_00008FB4
/* 00008FA8 2C000000 */ cmpwi r0, 0
/* 00008FAC 40800014 */ bge lbl_00008FC0
/* 00008FB0 480008A4 */ b lbl_00009854
lbl_00008FB4:
/* 00008FB4 2C000003 */ cmpwi r0, 3
/* 00008FB8 4080089C */ bge lbl_00009854
/* 00008FBC 48000070 */ b lbl_0000902C
lbl_00008FC0:
/* 00008FC0 3860022A */ li r3, 0x22a
/* 00008FC4 4BFF71C5 */ bl u_play_sound_0
/* 00008FC8 3800000F */ li r0, 0xf
/* 00008FCC 90120004 */ stw r0, 4(r18)
/* 00008FD0 39E00001 */ li r15, 1
/* 00008FD4 38000004 */ li r0, 4
/* 00008FD8 91F20040 */ stw r15, 0x40(r18)
/* 00008FDC 9012003C */ stw r0, 0x3c(r18)
/* 00008FE0 4BFF8931 */ bl lbl_00001910
/* 00008FE4 3C800000 */ lis r4, modeCtrl@ha
/* 00008FE8 38840000 */ addi r4, r4, modeCtrl@l
/* 00008FEC 94640024 */ stwu r3, 0x24(r4)
/* 00008FF0 80040000 */ lwz r0, 0(r4)
/* 00008FF4 2C000001 */ cmpwi r0, 1
/* 00008FF8 4080085C */ bge lbl_00009854
/* 00008FFC 91E40000 */ stw r15, 0(r4)
/* 00009000 48000854 */ b lbl_00009854
lbl_00009004:
/* 00009004 3860022B */ li r3, 0x22b
/* 00009008 4BFF7181 */ bl u_play_sound_0
/* 0000900C 38000011 */ li r0, 0x11
/* 00009010 3C600000 */ lis r3, modeCtrl@ha
/* 00009014 90120004 */ stw r0, 4(r18)
/* 00009018 38630000 */ addi r3, r3, modeCtrl@l
/* 0000901C 38000002 */ li r0, 2
/* 00009020 90030024 */ stw r0, 0x24(r3)
/* 00009024 98120114 */ stb r0, 0x114(r18)
/* 00009028 4800082C */ b lbl_00009854
lbl_0000902C:
/* 0000902C 3800000F */ li r0, 0xf
/* 00009030 90120004 */ stw r0, 4(r18)
/* 00009034 38600002 */ li r3, 2
/* 00009038 38000004 */ li r0, 4
/* 0000903C 90720040 */ stw r3, 0x40(r18)
/* 00009040 9012003C */ stw r0, 0x3c(r18)
/* 00009044 4BFF88CD */ bl lbl_00001910
/* 00009048 3C800000 */ lis r4, modeCtrl@ha
/* 0000904C 38840000 */ addi r4, r4, modeCtrl@l
/* 00009050 94640024 */ stwu r3, 0x24(r4)
/* 00009054 80040000 */ lwz r0, 0(r4)
/* 00009058 2C000001 */ cmpwi r0, 1
/* 0000905C 408007F8 */ bge lbl_00009854
/* 00009060 38000001 */ li r0, 1
/* 00009064 90040000 */ stw r0, 0(r4)
/* 00009068 480007EC */ b lbl_00009854
lbl_0000906C:
/* 0000906C 3860022D */ li r3, 0x22d
/* 00009070 4BFF7119 */ bl u_play_sound_0
/* 00009074 3860001D */ li r3, 0x1d
/* 00009078 4BFF7111 */ bl find_sprite_with_tag
/* 0000907C 28030000 */ cmplwi r3, 0
/* 00009080 4182000C */ beq lbl_0000908C
/* 00009084 38000001 */ li r0, 1
/* 00009088 90030048 */ stw r0, 0x48(r3)
lbl_0000908C:
/* 0000908C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00009090 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00009094 38000002 */ li r0, 2
/* 00009098 900300BC */ stw r0, 0xbc(r3)
/* 0000909C 3800000F */ li r0, 0xf
/* 000090A0 38600016 */ li r3, 0x16
/* 000090A4 90190000 */ stw r0, 0(r25)
/* 000090A8 4BFF70E1 */ bl find_sprite_with_tag
/* 000090AC 28030000 */ cmplwi r3, 0
/* 000090B0 4182000C */ beq lbl_000090BC
/* 000090B4 38000006 */ li r0, 6
/* 000090B8 90030048 */ stw r0, 0x48(r3)
lbl_000090BC:
/* 000090BC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000090C0 38000032 */ li r0, 0x32
/* 000090C4 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 000090C8 3860001A */ li r3, 0x1a
/* 000090CC 4BFF70BD */ bl find_sprite_with_tag
/* 000090D0 28030000 */ cmplwi r3, 0
/* 000090D4 4182000C */ beq lbl_000090E0
/* 000090D8 38000005 */ li r0, 5
/* 000090DC 90030048 */ stw r0, 0x48(r3)
lbl_000090E0:
/* 000090E0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000090E4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000090E8 38000002 */ li r0, 2
/* 000090EC 900300F4 */ stw r0, 0xf4(r3)
/* 000090F0 38600001 */ li r3, 1
/* 000090F4 38000000 */ li r0, 0
/* 000090F8 907F0040 */ stw r3, 0x40(r31)
/* 000090FC 901F0044 */ stw r0, 0x44(r31)
/* 00009100 901F0048 */ stw r0, 0x48(r31)
/* 00009104 48000750 */ b lbl_00009854
lbl_00009108:
/* 00009108 3A120108 */ addi r16, r18, 0x108
/* 0000910C 80120108 */ lwz r0, 0x108(r18)
/* 00009110 3C600000 */ lis r3, lbl_802F1BE8@ha
/* 00009114 3AA30000 */ addi r21, r3, lbl_802F1BE8@l
/* 00009118 2C000000 */ cmpwi r0, 0
/* 0000911C 4082003C */ bne lbl_00009158
/* 00009120 38600006 */ li r3, 6
/* 00009124 4BFF74B1 */ bl lbl_000005D4
/* 00009128 2C030000 */ cmpwi r3, 0
/* 0000912C 41820020 */ beq lbl_0000914C
/* 00009130 801200F4 */ lwz r0, 0xf4(r18)
/* 00009134 2C000001 */ cmpwi r0, 1
/* 00009138 40820014 */ bne lbl_0000914C
/* 0000913C 38950000 */ addi r4, r21, 0
/* 00009140 387F00B8 */ addi r3, r31, 0xb8
/* 00009144 38A00008 */ li r5, 8
/* 00009148 4BFF7041 */ bl memcpy
lbl_0000914C:
/* 0000914C 38600002 */ li r3, 2
/* 00009150 4BFF9955 */ bl lbl_00002AA4
/* 00009154 480000D4 */ b lbl_00009228
lbl_00009158:
/* 00009158 3A32010C */ addi r17, r18, 0x10c
/* 0000915C 39E00000 */ li r15, 0
/* 00009160 99F2010C */ stb r15, 0x10c(r18)
/* 00009164 38600002 */ li r3, 2
/* 00009168 4BFF993D */ bl lbl_00002AA4
/* 0000916C 38600007 */ li r3, 7
/* 00009170 4BFF7465 */ bl lbl_000005D4
/* 00009174 2C030000 */ cmpwi r3, 0
/* 00009178 41820018 */ beq lbl_00009190
/* 0000917C 38750000 */ addi r3, r21, 0
/* 00009180 389F00B8 */ addi r4, r31, 0xb8
/* 00009184 38A00008 */ li r5, 8
/* 00009188 4BFF7001 */ bl memcpy
/* 0000918C 480006C8 */ b lbl_00009854
lbl_00009190:
/* 00009190 38600006 */ li r3, 6
/* 00009194 4BFF7441 */ bl lbl_000005D4
/* 00009198 2C030000 */ cmpwi r3, 0
/* 0000919C 408206B8 */ bne lbl_00009854
/* 000091A0 801200F4 */ lwz r0, 0xf4(r18)
/* 000091A4 2C000000 */ cmpwi r0, 0
/* 000091A8 41820008 */ beq lbl_000091B0
/* 000091AC 4800007C */ b lbl_00009228
lbl_000091B0:
/* 000091B0 88110000 */ lbz r0, 0(r17)
/* 000091B4 38600000 */ li r3, 0
/* 000091B8 60000003 */ ori r0, r0, 3
/* 000091BC 98110000 */ stb r0, 0(r17)
/* 000091C0 4BFF7415 */ bl lbl_000005D4
/* 000091C4 2C030000 */ cmpwi r3, 0
/* 000091C8 4182002C */ beq lbl_000091F4
/* 000091CC 88750004 */ lbz r3, 4(r21)
/* 000091D0 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 000091D4 7C600775 */ extsb. r0, r3
/* 000091D8 98750004 */ stb r3, 4(r21)
/* 000091DC 4080000C */ bge lbl_000091E8
/* 000091E0 38000002 */ li r0, 2
/* 000091E4 98150004 */ stb r0, 4(r21)
lbl_000091E8:
/* 000091E8 38600065 */ li r3, 0x65
/* 000091EC 4BFF6F9D */ bl u_play_sound_0
/* 000091F0 48000038 */ b lbl_00009228
lbl_000091F4:
/* 000091F4 38600001 */ li r3, 1
/* 000091F8 4BFF73DD */ bl lbl_000005D4
/* 000091FC 2C030000 */ cmpwi r3, 0
/* 00009200 41820028 */ beq lbl_00009228
/* 00009204 88750004 */ lbz r3, 4(r21)
/* 00009208 38630001 */ addi r3, r3, 1
/* 0000920C 7C600774 */ extsb r0, r3
/* 00009210 98750004 */ stb r3, 4(r21)
/* 00009214 2C000002 */ cmpwi r0, 2
/* 00009218 40810008 */ ble lbl_00009220
/* 0000921C 99F50004 */ stb r15, 4(r21)
lbl_00009220:
/* 00009220 38600065 */ li r3, 0x65
/* 00009224 4BFF6F65 */ bl u_play_sound_0
lbl_00009228:
/* 00009228 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000922C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00009230 3A2300F4 */ addi r17, r3, 0xf4
/* 00009234 808300F4 */ lwz r4, 0xf4(r3)
/* 00009238 38600017 */ li r3, 0x17
/* 0000923C 39E40043 */ addi r15, r4, 0x43
/* 00009240 4BFF6F49 */ bl find_sprite_with_tag
/* 00009244 28030000 */ cmplwi r3, 0
/* 00009248 41820008 */ beq lbl_00009250
/* 0000924C 91E30048 */ stw r15, 0x48(r3)
lbl_00009250:
/* 00009250 80110000 */ lwz r0, 0(r17)
/* 00009254 2C000000 */ cmpwi r0, 0
/* 00009258 40820078 */ bne lbl_000092D0
/* 0000925C 88150004 */ lbz r0, 4(r21)
/* 00009260 7C000774 */ extsb r0, r0
/* 00009264 2C000001 */ cmpwi r0, 1
/* 00009268 40820020 */ bne lbl_00009288
/* 0000926C 38600017 */ li r3, 0x17
/* 00009270 4BFF6F19 */ bl find_sprite_with_tag
/* 00009274 28030000 */ cmplwi r3, 0
/* 00009278 41820058 */ beq lbl_000092D0
/* 0000927C 38000046 */ li r0, 0x46
/* 00009280 90030048 */ stw r0, 0x48(r3)
/* 00009284 4800004C */ b lbl_000092D0
lbl_00009288:
/* 00009288 2C000002 */ cmpwi r0, 2
/* 0000928C 40820020 */ bne lbl_000092AC
/* 00009290 38600017 */ li r3, 0x17
/* 00009294 4BFF6EF5 */ bl find_sprite_with_tag
/* 00009298 28030000 */ cmplwi r3, 0
/* 0000929C 41820034 */ beq lbl_000092D0
/* 000092A0 38000047 */ li r0, 0x47
/* 000092A4 90030048 */ stw r0, 0x48(r3)
/* 000092A8 48000028 */ b lbl_000092D0
lbl_000092AC:
/* 000092AC 80150000 */ lwz r0, 0(r21)
/* 000092B0 2C000001 */ cmpwi r0, 1
/* 000092B4 4082001C */ bne lbl_000092D0
/* 000092B8 38600017 */ li r3, 0x17
/* 000092BC 4BFF6ECD */ bl find_sprite_with_tag
/* 000092C0 28030000 */ cmplwi r3, 0
/* 000092C4 4182000C */ beq lbl_000092D0
/* 000092C8 38000048 */ li r0, 0x48
/* 000092CC 90030048 */ stw r0, 0x48(r3)
lbl_000092D0:
/* 000092D0 38600007 */ li r3, 7
/* 000092D4 4BFF7301 */ bl lbl_000005D4
/* 000092D8 2C030000 */ cmpwi r3, 0
/* 000092DC 4182003C */ beq lbl_00009318
/* 000092E0 80100000 */ lwz r0, 0(r16)
/* 000092E4 2C000000 */ cmpwi r0, 0
/* 000092E8 40820030 */ bne lbl_00009318
/* 000092EC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000092F0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000092F4 38000001 */ li r0, 1
/* 000092F8 90030008 */ stw r0, 8(r3)
/* 000092FC 3860001A */ li r3, 0x1a
/* 00009300 4BFF6E89 */ bl find_sprite_with_tag
/* 00009304 28030000 */ cmplwi r3, 0
/* 00009308 4182054C */ beq lbl_00009854
/* 0000930C 38000000 */ li r0, 0
/* 00009310 90030048 */ stw r0, 0x48(r3)
/* 00009314 48000540 */ b lbl_00009854
lbl_00009318:
/* 00009318 80110000 */ lwz r0, 0(r17)
/* 0000931C 2C000002 */ cmpwi r0, 2
/* 00009320 40820534 */ bne lbl_00009854
/* 00009324 38600006 */ li r3, 6
/* 00009328 4BFF72AD */ bl lbl_000005D4
/* 0000932C 2C030000 */ cmpwi r3, 0
/* 00009330 40820008 */ bne lbl_00009338
/* 00009334 48000520 */ b lbl_00009854
lbl_00009338:
/* 00009338 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000933C 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 00009340 38000033 */ li r0, 0x33
/* 00009344 3C600000 */ lis r3, modeCtrl@ha
/* 00009348 90040004 */ stw r0, 4(r4)
/* 0000934C 38630000 */ addi r3, r3, modeCtrl@l
/* 00009350 80030008 */ lwz r0, 8(r3)
/* 00009354 60000004 */ ori r0, r0, 4
/* 00009358 90030008 */ stw r0, 8(r3)
/* 0000935C 88150004 */ lbz r0, 4(r21)
/* 00009360 2C000002 */ cmpwi r0, 2
/* 00009364 40820010 */ bne lbl_00009374
/* 00009368 386000A9 */ li r3, 0xa9
/* 0000936C 4BFF6E1D */ bl preload_stage_files
/* 00009370 480004E4 */ b lbl_00009854
lbl_00009374:
/* 00009374 386000A7 */ li r3, 0xa7
/* 00009378 4BFF6E11 */ bl preload_stage_files
/* 0000937C 480004D8 */ b lbl_00009854
lbl_00009380:
/* 00009380 3C600000 */ lis r3, modeCtrl@ha
/* 00009384 38A30000 */ addi r5, r3, modeCtrl@l
/* 00009388 3800003C */ li r0, 0x3c
/* 0000938C 3C600000 */ lis r3, g_poolInfo@ha
/* 00009390 90050000 */ stw r0, 0(r5)
/* 00009394 38830000 */ addi r4, r3, g_poolInfo@l
/* 00009398 38E50024 */ addi r7, r5, 0x24
/* 0000939C 39000000 */ li r8, 0
/* 000093A0 38A00002 */ li r5, 2
/* 000093A4 48000010 */ b lbl_000093B4
lbl_000093A8:
/* 000093A8 8064000C */ lwz r3, 0xc(r4)
/* 000093AC 7CA341AE */ stbx r5, r3, r8
/* 000093B0 39080001 */ addi r8, r8, 1
lbl_000093B4:
/* 000093B4 80070000 */ lwz r0, 0(r7)
/* 000093B8 7C080000 */ cmpw r8, r0
/* 000093BC 4180FFEC */ blt lbl_000093A8
/* 000093C0 2C080004 */ cmpwi r8, 4
/* 000093C4 3C600000 */ lis r3, g_poolInfo@ha
/* 000093C8 38A30000 */ addi r5, r3, g_poolInfo@l
/* 000093CC 20680004 */ subfic r3, r8, 4
/* 000093D0 38C00000 */ li r6, 0
/* 000093D4 40800090 */ bge lbl_00009464
/* 000093D8 5460E8FF */ rlwinm. r0, r3, 0x1d, 3, 0x1f
/* 000093DC 7C0903A6 */ mtctr r0
/* 000093E0 41820070 */ beq lbl_00009450
lbl_000093E4:
/* 000093E4 8085000C */ lwz r4, 0xc(r5)
/* 000093E8 7CC441AE */ stbx r6, r4, r8
/* 000093EC 39080001 */ addi r8, r8, 1
/* 000093F0 8085000C */ lwz r4, 0xc(r5)
/* 000093F4 7CC441AE */ stbx r6, r4, r8
/* 000093F8 39080001 */ addi r8, r8, 1
/* 000093FC 8085000C */ lwz r4, 0xc(r5)
/* 00009400 7CC441AE */ stbx r6, r4, r8
/* 00009404 39080001 */ addi r8, r8, 1
/* 00009408 8085000C */ lwz r4, 0xc(r5)
/* 0000940C 7CC441AE */ stbx r6, r4, r8
/* 00009410 39080001 */ addi r8, r8, 1
/* 00009414 8085000C */ lwz r4, 0xc(r5)
/* 00009418 7CC441AE */ stbx r6, r4, r8
/* 0000941C 39080001 */ addi r8, r8, 1
/* 00009420 8085000C */ lwz r4, 0xc(r5)
/* 00009424 7CC441AE */ stbx r6, r4, r8
/* 00009428 39080001 */ addi r8, r8, 1
/* 0000942C 8085000C */ lwz r4, 0xc(r5)
/* 00009430 7CC441AE */ stbx r6, r4, r8
/* 00009434 39080001 */ addi r8, r8, 1
/* 00009438 8085000C */ lwz r4, 0xc(r5)
/* 0000943C 7CC441AE */ stbx r6, r4, r8
/* 00009440 39080001 */ addi r8, r8, 1
/* 00009444 4200FFA0 */ bdnz lbl_000093E4
/* 00009448 70630007 */ andi. r3, r3, 7
/* 0000944C 41820018 */ beq lbl_00009464
lbl_00009450:
/* 00009450 7C6903A6 */ mtctr r3
lbl_00009454:
/* 00009454 8085000C */ lwz r4, 0xc(r5)
/* 00009458 7CC441AE */ stbx r6, r4, r8
/* 0000945C 39080001 */ addi r8, r8, 1
/* 00009460 4200FFF4 */ bdnz lbl_00009454
lbl_00009464:
/* 00009464 3C600000 */ lis r3, modeCtrl@ha
/* 00009468 38630000 */ addi r3, r3, modeCtrl@l
/* 0000946C 38000000 */ li r0, 0
/* 00009470 9003002C */ stw r0, 0x2c(r3)
/* 00009474 38830028 */ addi r4, r3, 0x28
/* 00009478 80030028 */ lwz r0, 0x28(r3)
/* 0000947C 2C000005 */ cmpwi r0, 5
/* 00009480 40800010 */ bge lbl_00009490
/* 00009484 2C000000 */ cmpwi r0, 0
/* 00009488 41820010 */ beq lbl_00009498
/* 0000948C 48000020 */ b lbl_000094AC
lbl_00009490:
/* 00009490 2C000009 */ cmpwi r0, 9
/* 00009494 40800018 */ bge lbl_000094AC
lbl_00009498:
/* 00009498 3C600000 */ lis r3, modeCtrl@ha
/* 0000949C 38630000 */ addi r3, r3, modeCtrl@l
/* 000094A0 38000001 */ li r0, 1
/* 000094A4 90030030 */ stw r0, 0x30(r3)
/* 000094A8 48000014 */ b lbl_000094BC
lbl_000094AC:
/* 000094AC 3C600000 */ lis r3, modeCtrl@ha
/* 000094B0 80070000 */ lwz r0, 0(r7)
/* 000094B4 38630000 */ addi r3, r3, modeCtrl@l
/* 000094B8 90030030 */ stw r0, 0x30(r3)
lbl_000094BC:
/* 000094BC 80040000 */ lwz r0, 0(r4)
/* 000094C0 2C000002 */ cmpwi r0, 2
/* 000094C4 41810034 */ bgt lbl_000094F8
/* 000094C8 3C600000 */ lis r3, modeCtrl@ha
/* 000094CC 38630000 */ addi r3, r3, modeCtrl@l
/* 000094D0 80030008 */ lwz r0, 8(r3)
/* 000094D4 60000001 */ ori r0, r0, 1
/* 000094D8 90030008 */ stw r0, 8(r3)
/* 000094DC 4BFF6CAD */ bl func_800668A0
/* 000094E0 3C600000 */ lis r3, infoWork@ha
/* 000094E4 38830000 */ addi r4, r3, infoWork@l
/* 000094E8 A804002E */ lha r0, 0x2e(r4)
/* 000094EC 3C600000 */ lis r3, loadingStageId@ha
/* 000094F0 B0030000 */ sth r0, loadingStageId@l(r3)
/* 000094F4 48000018 */ b lbl_0000950C
lbl_000094F8:
/* 000094F8 3C600000 */ lis r3, modeCtrl@ha
/* 000094FC 38630000 */ addi r3, r3, modeCtrl@l
/* 00009500 80030008 */ lwz r0, 8(r3)
/* 00009504 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 00009508 90030008 */ stw r0, 8(r3)
lbl_0000950C:
/* 0000950C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00009510 38000034 */ li r0, 0x34
/* 00009514 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00009518 4800033C */ b lbl_00009854
lbl_0000951C:
/* 0000951C 3C600000 */ lis r3, modeCtrl@ha
/* 00009520 39E30000 */ addi r15, r3, modeCtrl@l
/* 00009524 800F0000 */ lwz r0, 0(r15)
/* 00009528 2C00001E */ cmpwi r0, 0x1e
/* 0000952C 40820020 */ bne lbl_0000954C
/* 00009530 38600101 */ li r3, 0x101
/* 00009534 38800000 */ li r4, 0
/* 00009538 38A0001E */ li r5, 0x1e
/* 0000953C 4BFF6C4D */ bl start_screen_fade
/* 00009540 806F0000 */ lwz r3, 0(r15)
/* 00009544 38800002 */ li r4, 2
/* 00009548 4BFF6C41 */ bl u_play_music
lbl_0000954C:
/* 0000954C 3C600000 */ lis r3, modeCtrl@ha
/* 00009550 38830000 */ addi r4, r3, modeCtrl@l
/* 00009554 80640000 */ lwz r3, 0(r4)
/* 00009558 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000955C 90040000 */ stw r0, 0(r4)
/* 00009560 418102F4 */ bgt lbl_00009854
/* 00009564 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00009568 38000036 */ li r0, 0x36
/* 0000956C 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 00009570 480002E4 */ b lbl_00009854
lbl_00009574:
/* 00009574 3C600000 */ lis r3, eventInfo@ha
/* 00009578 88030000 */ lbz r0, eventInfo@l(r3)
/* 0000957C 2C000002 */ cmpwi r0, 2
/* 00009580 418202D4 */ beq lbl_00009854
/* 00009584 38000036 */ li r0, 0x36
/* 00009588 90120000 */ stw r0, 0(r18)
/* 0000958C 480002C8 */ b lbl_00009854
lbl_00009590:
/* 00009590 38600066 */ li r3, 0x66
/* 00009594 4BFF6BF5 */ bl destroy_sprite_with_tag
/* 00009598 3C600000 */ lis r3, lbl_802F1B7C@ha
/* 0000959C 39E30000 */ addi r15, r3, lbl_802F1B7C@l
/* 000095A0 818F0000 */ lwz r12, 0(r15)
/* 000095A4 7D8803A6 */ mtlr r12
/* 000095A8 4E800021 */ blrl 
/* 000095AC 38000000 */ li r0, 0
/* 000095B0 3C600000 */ lis r3, pauseMenuState@ha
/* 000095B4 900F0000 */ stw r0, 0(r15)
/* 000095B8 38830000 */ addi r4, r3, pauseMenuState@l
/* 000095BC 80040004 */ lwz r0, 4(r4)
/* 000095C0 3C600000 */ lis r3, modeCtrl@ha
/* 000095C4 38630000 */ addi r3, r3, modeCtrl@l
/* 000095C8 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 000095CC 90040004 */ stw r0, 4(r4)
/* 000095D0 38830028 */ addi r4, r3, 0x28
/* 000095D4 80030028 */ lwz r0, 0x28(r3)
/* 000095D8 2C000002 */ cmpwi r0, 2
/* 000095DC 4182002C */ beq lbl_00009608
/* 000095E0 40800014 */ bge lbl_000095F4
/* 000095E4 2C000000 */ cmpwi r0, 0
/* 000095E8 41820020 */ beq lbl_00009608
/* 000095EC 40800030 */ bge lbl_0000961C
/* 000095F0 48000040 */ b lbl_00009630
lbl_000095F4:
/* 000095F4 2C000009 */ cmpwi r0, 9
/* 000095F8 40800038 */ bge lbl_00009630
/* 000095FC 2C000005 */ cmpwi r0, 5
/* 00009600 40800008 */ bge lbl_00009608
/* 00009604 48000018 */ b lbl_0000961C
lbl_00009608:
/* 00009608 3C600000 */ lis r3, modeCtrl@ha
/* 0000960C 38630000 */ addi r3, r3, modeCtrl@l
/* 00009610 38000000 */ li r0, 0
/* 00009614 B0030040 */ sth r0, 0x40(r3)
/* 00009618 48000028 */ b lbl_00009640
lbl_0000961C:
/* 0000961C 3C600000 */ lis r3, modeCtrl@ha
/* 00009620 38630000 */ addi r3, r3, modeCtrl@l
/* 00009624 38000001 */ li r0, 1
/* 00009628 B0030040 */ sth r0, 0x40(r3)
/* 0000962C 48000014 */ b lbl_00009640
lbl_00009630:
/* 00009630 3C600000 */ lis r3, modeCtrl@ha
/* 00009634 38630000 */ addi r3, r3, modeCtrl@l
/* 00009638 3800FFFF */ li r0, -1
/* 0000963C B0030040 */ sth r0, 0x40(r3)
lbl_00009640:
/* 00009640 80040000 */ lwz r0, 0(r4)
/* 00009644 28000008 */ cmplwi r0, 8
/* 00009648 4181020C */ bgt lbl_00009854
/* 0000964C 3C600000 */ lis r3, lbl_000125FC@ha
/* 00009650 38630000 */ addi r3, r3, lbl_000125FC@l
/* 00009654 5400103A */ slwi r0, r0, 2
/* 00009658 7C03002E */ lwzx r0, r3, r0
/* 0000965C 7C0903A6 */ mtctr r0
/* 00009660 4E800420 */ bctr 
lbl_00009664:
/* 00009664 3C600000 */ lis r3, gameModeRequest@ha
/* 00009668 38830000 */ addi r4, r3, gameModeRequest@l
/* 0000966C 38000002 */ li r0, 2
/* 00009670 B0040000 */ sth r0, 0(r4)
/* 00009674 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00009678 3800003C */ li r0, 0x3c
/* 0000967C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00009680 480001D4 */ b lbl_00009854
lbl_00009684:
/* 00009684 3C600000 */ lis r3, gameModeRequest@ha
/* 00009688 38830000 */ addi r4, r3, gameModeRequest@l
/* 0000968C 38000004 */ li r0, 4
/* 00009690 B0040000 */ sth r0, 0(r4)
/* 00009694 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00009698 38000098 */ li r0, 0x98
/* 0000969C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000096A0 480001B4 */ b lbl_00009854
lbl_000096A4:
/* 000096A4 3C600000 */ lis r3, gameModeRequest@ha
/* 000096A8 38830000 */ addi r4, r3, gameModeRequest@l
/* 000096AC 38000004 */ li r0, 4
/* 000096B0 B0040000 */ sth r0, 0(r4)
/* 000096B4 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000096B8 38000094 */ li r0, 0x94
/* 000096BC B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000096C0 48000194 */ b lbl_00009854
lbl_000096C4:
/* 000096C4 3C600000 */ lis r3, gameModeRequest@ha
/* 000096C8 38830000 */ addi r4, r3, gameModeRequest@l
/* 000096CC 38000004 */ li r0, 4
/* 000096D0 B0040000 */ sth r0, 0(r4)
/* 000096D4 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000096D8 3800009A */ li r0, 0x9a
/* 000096DC B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000096E0 48000174 */ b lbl_00009854
lbl_000096E4:
/* 000096E4 3C600000 */ lis r3, gameModeRequest@ha
/* 000096E8 38830000 */ addi r4, r3, gameModeRequest@l
/* 000096EC 38000004 */ li r0, 4
/* 000096F0 B0040000 */ sth r0, 0(r4)
/* 000096F4 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000096F8 3800009C */ li r0, 0x9c
/* 000096FC B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00009700 48000154 */ b lbl_00009854
lbl_00009704:
/* 00009704 3C600000 */ lis r3, gameModeRequest@ha
/* 00009708 38830000 */ addi r4, r3, gameModeRequest@l
/* 0000970C 38000004 */ li r0, 4
/* 00009710 B0040000 */ sth r0, 0(r4)
/* 00009714 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00009718 38000096 */ li r0, 0x96
/* 0000971C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00009720 48000134 */ b lbl_00009854
lbl_00009724:
/* 00009724 3C600000 */ lis r3, gameModeRequest@ha
/* 00009728 38830000 */ addi r4, r3, gameModeRequest@l
/* 0000972C 38000004 */ li r0, 4
/* 00009730 B0040000 */ sth r0, 0(r4)
/* 00009734 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00009738 3800009E */ li r0, 0x9e
/* 0000973C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00009740 48000114 */ b lbl_00009854
lbl_00009744:
/* 00009744 386000D1 */ li r3, 0xd1
/* 00009748 4BFF6A41 */ bl u_play_sound_0
/* 0000974C 3C600000 */ lis r3, modeCtrl@ha
/* 00009750 3800001E */ li r0, 0x1e
/* 00009754 90030000 */ stw r0, modeCtrl@l(r3)
/* 00009758 38000038 */ li r0, 0x38
/* 0000975C 90120000 */ stw r0, 0(r18)
/* 00009760 480000F4 */ b lbl_00009854
lbl_00009764:
/* 00009764 3C600000 */ lis r3, modeCtrl@ha
/* 00009768 80030000 */ lwz r0, modeCtrl@l(r3)
/* 0000976C 2C00001E */ cmpwi r0, 0x1e
/* 00009770 40820020 */ bne lbl_00009790
/* 00009774 38600101 */ li r3, 0x101
/* 00009778 38800000 */ li r4, 0
/* 0000977C 38A0001E */ li r5, 0x1e
/* 00009780 4BFF6A09 */ bl start_screen_fade
/* 00009784 3860001E */ li r3, 0x1e
/* 00009788 38800002 */ li r4, 2
/* 0000978C 4BFF69FD */ bl u_play_music
lbl_00009790:
/* 00009790 3C600000 */ lis r3, modeCtrl@ha
/* 00009794 38830000 */ addi r4, r3, modeCtrl@l
/* 00009798 80640000 */ lwz r3, 0(r4)
/* 0000979C 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 000097A0 90040000 */ stw r0, 0(r4)
/* 000097A4 418100B0 */ bgt lbl_00009854
/* 000097A8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000097AC 3800003A */ li r0, 0x3a
/* 000097B0 90030000 */ stw r0, lbl_801EEDA8@l(r3)
/* 000097B4 480000A0 */ b lbl_00009854
lbl_000097B8:
/* 000097B8 3C600000 */ lis r3, eventInfo@ha
/* 000097BC 88030000 */ lbz r0, eventInfo@l(r3)
/* 000097C0 2C000002 */ cmpwi r0, 2
/* 000097C4 41820090 */ beq lbl_00009854
/* 000097C8 3800003A */ li r0, 0x3a
/* 000097CC 90120000 */ stw r0, 0(r18)
/* 000097D0 48000084 */ b lbl_00009854
lbl_000097D4:
/* 000097D4 3C600000 */ lis r3, lbl_802F1B7C@ha
/* 000097D8 39E30000 */ addi r15, r3, lbl_802F1B7C@l
/* 000097DC 818F0000 */ lwz r12, 0(r15)
/* 000097E0 7D8803A6 */ mtlr r12
/* 000097E4 4E800021 */ blrl 
/* 000097E8 38000000 */ li r0, 0
/* 000097EC 3C600000 */ lis r3, modeCtrl@ha
/* 000097F0 900F0000 */ stw r0, 0(r15)
/* 000097F4 38830000 */ addi r4, r3, modeCtrl@l
/* 000097F8 3C600000 */ lis r3, gameModeRequest@ha
/* 000097FC 90040010 */ stw r0, 0x10(r4)
/* 00009800 38830000 */ addi r4, r3, gameModeRequest@l
/* 00009804 B0040000 */ sth r0, 0(r4)
/* 00009808 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000980C 38000015 */ li r0, 0x15
/* 00009810 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00009814 48000040 */ b lbl_00009854
lbl_00009818:
/* 00009818 3CA00000 */ lis r5, lbl_80206BD0@ha
/* 0000981C 5466103A */ slwi r6, r3, 2
/* 00009820 38A50000 */ addi r5, r5, lbl_80206BD0@l
/* 00009824 7CC53214 */ add r6, r5, r6
/* 00009828 4BFF9A6C */ b lbl_00003294
lbl_0000982C:
/* 0000982C 3CA00000 */ lis r5, lbl_801EED50@ha
/* 00009830 3C800000 */ lis r4, lbl_802F1FB0@ha
/* 00009834 3CC00000 */ lis r6, lbl_8027CE24@ha
/* 00009838 80E40000 */ lwz r7, lbl_802F1FB0@l(r4)
/* 0000983C 54681838 */ slwi r8, r3, 3
/* 00009840 38860000 */ addi r4, r6, lbl_8027CE24@l
/* 00009844 38050000 */ addi r0, r5, lbl_801EED50@l
/* 00009848 7C844214 */ add r4, r4, r8
/* 0000984C 7CA04214 */ add r5, r0, r8
/* 00009850 4BFFD2E4 */ b lbl_00006B34
lbl_00009854:
/* 00009854 B9E10094 */ lmw r15, 0x94(r1)
/* 00009858 800100DC */ lwz r0, 0xdc(r1)
/* 0000985C 382100D8 */ addi r1, r1, 0xd8
/* 00009860 7C0803A6 */ mtlr r0
/* 00009864 4E800020 */ blr 
glabel lbl_00009868
/* 00009868 7C0802A6 */ mflr r0
/* 0000986C 3CA00000 */ lis r5, gameMode@ha
/* 00009870 90010004 */ stw r0, 4(r1)
/* 00009874 9421FFC0 */ stwu r1, -0x40(r1)
/* 00009878 93E1003C */ stw r31, 0x3c(r1)
/* 0000987C 3BE40000 */ addi r31, r4, 0
/* 00009880 20FF0003 */ subfic r7, r31, 3
/* 00009884 93C10038 */ stw r30, 0x38(r1)
/* 00009888 3C800000 */ lis r4, gameSubmodeRequest@ha
/* 0000988C 3BC30000 */ addi r30, r3, 0
/* 00009890 A8050000 */ lha r0, gameMode@l(r5)
/* 00009894 38A40000 */ addi r5, r4, gameSubmodeRequest@l
/* 00009898 3C800000 */ lis r4, gameModeRequest@ha
/* 0000989C A8A50000 */ lha r5, 0(r5)
/* 000098A0 20C00001 */ subfic r6, r0, 1
/* 000098A4 3006FFFF */ addic r0, r6, -1  ;# fixed addi
/* 000098A8 7CC03110 */ subfe r6, r0, r6
/* 000098AC A8040000 */ lha r0, gameModeRequest@l(r4)
/* 000098B0 20850022 */ subfic r4, r5, 0x22
/* 000098B4 7CE50034 */ cntlzw r5, r7
/* 000098B8 54A7D97E */ srwi r7, r5, 5
/* 000098BC 7C850034 */ cntlzw r5, r4
/* 000098C0 2080FFFF */ subfic r4, r0, -1  ;# fixed addi
/* 000098C4 3004FFFF */ addic r0, r4, -1  ;# fixed addi
/* 000098C8 7CE73378 */ or r7, r7, r6
/* 000098CC 54A5D97E */ srwi r5, r5, 5
/* 000098D0 7CE72B78 */ or r7, r7, r5
/* 000098D4 7C002110 */ subfe r0, r0, r4
/* 000098D8 7CE70379 */ or. r7, r7, r0
/* 000098DC 4182001C */ beq lbl_000098F8
/* 000098E0 7FC3F378 */ mr r3, r30
/* 000098E4 4BFF68A5 */ bl u_ape_free
/* 000098E8 2C1F0003 */ cmpwi r31, 3
/* 000098EC 41820290 */ beq lbl_00009B7C
/* 000098F0 4BFF6899 */ bl func_8008D240
/* 000098F4 48000288 */ b lbl_00009B7C
lbl_000098F8:
/* 000098F8 3C600000 */ lis r3, gamePauseStatus@ha
/* 000098FC 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00009900 7000000A */ andi. r0, r0, 0xa
/* 00009904 40820278 */ bne lbl_00009B7C
/* 00009908 809E0014 */ lwz r4, 0x14(r30)
/* 0000990C 3800FFEC */ li r0, -20
/* 00009910 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00009914 7C800038 */ and r0, r4, r0
/* 00009918 901E0014 */ stw r0, 0x14(r30)
/* 0000991C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00009920 801E0014 */ lwz r0, 0x14(r30)
/* 00009924 60000001 */ ori r0, r0, 1
/* 00009928 901E0014 */ stw r0, 0x14(r30)
/* 0000992C 800300BC */ lwz r0, 0xbc(r3)
/* 00009930 2C000001 */ cmpwi r0, 1
/* 00009934 40820014 */ bne lbl_00009948
/* 00009938 801E0014 */ lwz r0, 0x14(r30)
/* 0000993C 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00009940 901E0014 */ stw r0, 0x14(r30)
/* 00009944 48000010 */ b lbl_00009954
lbl_00009948:
/* 00009948 801E0014 */ lwz r0, 0x14(r30)
/* 0000994C 60000020 */ ori r0, r0, 0x20
/* 00009950 901E0014 */ stw r0, 0x14(r30)
lbl_00009954:
/* 00009954 801E0010 */ lwz r0, 0x10(r30)
/* 00009958 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000995C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 00009960 1C00000C */ mulli r0, r0, 0xc
/* 00009964 7C830214 */ add r4, r3, r0
/* 00009968 806400C4 */ lwz r3, 0xc4(r4)
/* 0000996C 800400C8 */ lwz r0, 0xc8(r4)
/* 00009970 907E0030 */ stw r3, 0x30(r30)
/* 00009974 901E0034 */ stw r0, 0x34(r30)
/* 00009978 800400CC */ lwz r0, 0xcc(r4)
/* 0000997C 901E0038 */ stw r0, 0x38(r30)
/* 00009980 4BFF6809 */ bl mathutil_mtxA_from_identity
/* 00009984 387E0030 */ addi r3, r30, 0x30
/* 00009988 4BFF6801 */ bl mathutil_mtxA_translate
/* 0000998C 3FE00001 */ lis r31, 1
/* 00009990 387F8000 */ addi r3, r31, -32768  ;# fixed addi
/* 00009994 4BFF67F5 */ bl mathutil_mtxA_rotate_y
/* 00009998 387FC000 */ addi r3, r31, -16384  ;# fixed addi
/* 0000999C 4BFF67ED */ bl mathutil_mtxA_rotate_y
/* 000099A0 387E0060 */ addi r3, r30, 0x60
/* 000099A4 4BFF67E5 */ bl mathutil_mtxA_to_quat
/* 000099A8 3C600000 */ lis r3, modeCtrl@ha
/* 000099AC 38630000 */ addi r3, r3, modeCtrl@l
/* 000099B0 38E30028 */ addi r7, r3, 0x28
/* 000099B4 80030028 */ lwz r0, 0x28(r3)
/* 000099B8 38800000 */ li r4, 0
/* 000099BC 38C40000 */ addi r6, r4, 0
/* 000099C0 2C000006 */ cmpwi r0, 6
/* 000099C4 38A00004 */ li r5, 4
/* 000099C8 38000000 */ li r0, 0
/* 000099CC 4082001C */ bne lbl_000099E8
/* 000099D0 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 000099D4 38630000 */ addi r3, r3, lbl_802F1BF4@l
/* 000099D8 80630004 */ lwz r3, 4(r3)
/* 000099DC 2C030000 */ cmpwi r3, 0
/* 000099E0 40820008 */ bne lbl_000099E8
/* 000099E4 38C00001 */ li r6, 1
lbl_000099E8:
/* 000099E8 2C060000 */ cmpwi r6, 0
/* 000099EC 4182001C */ beq lbl_00009A08
/* 000099F0 3C600000 */ lis r3, modeCtrl@ha
/* 000099F4 38630000 */ addi r3, r3, modeCtrl@l
/* 000099F8 80630024 */ lwz r3, 0x24(r3)
/* 000099FC 2C030001 */ cmpwi r3, 1
/* 00009A00 40820008 */ bne lbl_00009A08
/* 00009A04 38800001 */ li r4, 1
lbl_00009A08:
/* 00009A08 2C040000 */ cmpwi r4, 0
/* 00009A0C 4182000C */ beq lbl_00009A18
/* 00009A10 39000002 */ li r8, 2
/* 00009A14 48000010 */ b lbl_00009A24
lbl_00009A18:
/* 00009A18 3C600000 */ lis r3, modeCtrl@ha
/* 00009A1C 38630000 */ addi r3, r3, modeCtrl@l
/* 00009A20 81030024 */ lwz r8, 0x24(r3)
lbl_00009A24:
/* 00009A24 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00009A28 81270000 */ lwz r9, 0(r7)
/* 00009A2C 38E30000 */ addi r7, r3, lbl_801EEDA8@l
/* 00009A30 3C600000 */ lis r3, playerCharacterSelection@ha
/* 00009A34 81470110 */ lwz r10, 0x110(r7)
/* 00009A38 38830000 */ addi r4, r3, playerCharacterSelection@l
/* 00009A3C 39800000 */ li r12, 0
/* 00009A40 48000088 */ b lbl_00009AC8
lbl_00009A44:
/* 00009A44 558B103A */ slwi r11, r12, 2
/* 00009A48 80DE0010 */ lwz r6, 0x10(r30)
/* 00009A4C 7C645A14 */ add r3, r4, r11
/* 00009A50 80630000 */ lwz r3, 0(r3)
/* 00009A54 7C061800 */ cmpw r6, r3
/* 00009A58 40820008 */ bne lbl_00009A60
/* 00009A5C 38000001 */ li r0, 1
lbl_00009A60:
/* 00009A60 2C090002 */ cmpwi r9, 2
/* 00009A64 41820060 */ beq lbl_00009AC4
/* 00009A68 40800014 */ bge lbl_00009A7C
/* 00009A6C 2C090000 */ cmpwi r9, 0
/* 00009A70 41820020 */ beq lbl_00009A90
/* 00009A74 40800034 */ bge lbl_00009AA8
/* 00009A78 4800004C */ b lbl_00009AC4
lbl_00009A7C:
/* 00009A7C 2C090009 */ cmpwi r9, 9
/* 00009A80 40800044 */ bge lbl_00009AC4
/* 00009A84 2C090005 */ cmpwi r9, 5
/* 00009A88 40800008 */ bge lbl_00009A90
/* 00009A8C 4800001C */ b lbl_00009AA8
lbl_00009A90:
/* 00009A90 7C675A14 */ add r3, r7, r11
/* 00009A94 80630048 */ lwz r3, 0x48(r3)
/* 00009A98 2C030000 */ cmpwi r3, 0
/* 00009A9C 40820028 */ bne lbl_00009AC4
/* 00009AA0 7D0C4378 */ mr r12, r8
/* 00009AA4 48000020 */ b lbl_00009AC4
lbl_00009AA8:
/* 00009AA8 2C0A0000 */ cmpwi r10, 0
/* 00009AAC 41820018 */ beq lbl_00009AC4
/* 00009AB0 7C675A14 */ add r3, r7, r11
/* 00009AB4 80630048 */ lwz r3, 0x48(r3)
/* 00009AB8 2C030000 */ cmpwi r3, 0
/* 00009ABC 40820008 */ bne lbl_00009AC4
/* 00009AC0 7D0C4378 */ mr r12, r8
lbl_00009AC4:
/* 00009AC4 398C0001 */ addi r12, r12, 1
lbl_00009AC8:
/* 00009AC8 7C0C4000 */ cmpw r12, r8
/* 00009ACC 4180FF78 */ blt lbl_00009A44
/* 00009AD0 807E0010 */ lwz r3, 0x10(r30)
/* 00009AD4 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00009AD8 38840000 */ addi r4, r4, lbl_801EEDA8@l
/* 00009ADC 38C40058 */ addi r6, r4, 0x58
/* 00009AE0 5463103A */ slwi r3, r3, 2
/* 00009AE4 7C861A14 */ add r4, r6, r3
/* 00009AE8 80640000 */ lwz r3, 0(r4)
/* 00009AEC 2C030000 */ cmpwi r3, 0
/* 00009AF0 4081000C */ ble lbl_00009AFC
/* 00009AF4 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00009AF8 90640000 */ stw r3, 0(r4)
lbl_00009AFC:
/* 00009AFC 807E0010 */ lwz r3, 0x10(r30)
/* 00009B00 5463103A */ slwi r3, r3, 2
/* 00009B04 7C66182E */ lwzx r3, r6, r3
/* 00009B08 2C030000 */ cmpwi r3, 0
/* 00009B0C 4081000C */ ble lbl_00009B18
/* 00009B10 38A00001 */ li r5, 1
/* 00009B14 48000010 */ b lbl_00009B24
lbl_00009B18:
/* 00009B18 2C000000 */ cmpwi r0, 0
/* 00009B1C 40820008 */ bne lbl_00009B24
/* 00009B20 38A00005 */ li r5, 5
lbl_00009B24:
/* 00009B24 3C600000 */ lis r3, lbl_00011BD4@ha
/* 00009B28 C0230000 */ lfs f1, lbl_00011BD4@l(r3)
/* 00009B2C 387E0000 */ addi r3, r30, 0
/* 00009B30 38C50000 */ addi r6, r5, 0
/* 00009B34 38800008 */ li r4, 8
/* 00009B38 4BFF6651 */ bl u_set_ape_anim
/* 00009B3C 3C600000 */ lis r3, lbl_00011BC8@ha
/* 00009B40 38A30000 */ addi r5, r3, lbl_00011BC8@l
/* 00009B44 80850000 */ lwz r4, 0(r5)
/* 00009B48 7FC3F378 */ mr r3, r30
/* 00009B4C 80050004 */ lwz r0, 4(r5)
/* 00009B50 9081001C */ stw r4, 0x1c(r1)
/* 00009B54 90010020 */ stw r0, 0x20(r1)
/* 00009B58 80050008 */ lwz r0, 8(r5)
/* 00009B5C 90010024 */ stw r0, 0x24(r1)
/* 00009B60 8081001C */ lwz r4, 0x1c(r1)
/* 00009B64 80010020 */ lwz r0, 0x20(r1)
/* 00009B68 909E003C */ stw r4, 0x3c(r30)
/* 00009B6C 901E0040 */ stw r0, 0x40(r30)
/* 00009B70 80010024 */ lwz r0, 0x24(r1)
/* 00009B74 901E0044 */ stw r0, 0x44(r30)
/* 00009B78 4BFF6611 */ bl u_do_ape_anim
lbl_00009B7C:
/* 00009B7C 80010044 */ lwz r0, 0x44(r1)
/* 00009B80 83E1003C */ lwz r31, 0x3c(r1)
/* 00009B84 83C10038 */ lwz r30, 0x38(r1)
/* 00009B88 7C0803A6 */ mtlr r0
/* 00009B8C 38210040 */ addi r1, r1, 0x40
/* 00009B90 4E800020 */ blr 
lbl_00009B94:
/* 00009B94 7C0802A6 */ mflr r0
/* 00009B98 3C600000 */ lis r3, modeCtrl@ha
/* 00009B9C 90010004 */ stw r0, 4(r1)
/* 00009BA0 38630000 */ addi r3, r3, modeCtrl@l
/* 00009BA4 3CA00000 */ lis r5, lbl_00011B68@ha
/* 00009BA8 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009BAC 93E1001C */ stw r31, 0x1c(r1)
/* 00009BB0 3BE50000 */ addi r31, r5, lbl_00011B68@l
/* 00009BB4 93C10018 */ stw r30, 0x18(r1)
/* 00009BB8 3BC30028 */ addi r30, r3, 0x28
/* 00009BBC 93A10014 */ stw r29, 0x14(r1)
/* 00009BC0 3BA40000 */ addi r29, r4, 0
/* 00009BC4 93810010 */ stw r28, 0x10(r1)
/* 00009BC8 80030028 */ lwz r0, 0x28(r3)
/* 00009BCC 3C600000 */ lis r3, lbl_10000000@ha
/* 00009BD0 3B830000 */ addi r28, r3, lbl_10000000@l
/* 00009BD4 2C000001 */ cmpwi r0, 1
/* 00009BD8 40820074 */ bne lbl_00009C4C
/* 00009BDC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00009BE0 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 00009BE4 2C000019 */ cmpwi r0, 0x19
/* 00009BE8 40820098 */ bne lbl_00009C80
/* 00009BEC 801D0048 */ lwz r0, 0x48(r29)
/* 00009BF0 809C003C */ lwz r4, 0x3c(r28)
/* 00009BF4 7C002000 */ cmpw r0, r4
/* 00009BF8 41820088 */ beq lbl_00009C80
/* 00009BFC A0BD003C */ lhz r5, 0x3c(r29)
/* 00009C00 28050000 */ cmplwi r5, 0
/* 00009C04 4082001C */ bne lbl_00009C20
/* 00009C08 807D002C */ lwz r3, 0x2c(r29)
/* 00009C0C 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00009C10 4BFF6579 */ bl start_preview_image_read
/* 00009C14 801C003C */ lwz r0, 0x3c(r28)
/* 00009C18 901D0048 */ stw r0, 0x48(r29)
/* 00009C1C 48000064 */ b lbl_00009C80
lbl_00009C20:
/* 00009C20 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 00009C24 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 00009C28 3865FFFF */ addi r3, r5, -1  ;# fixed addi
/* 00009C2C 7C030000 */ cmpw r3, r0
/* 00009C30 40820050 */ bne lbl_00009C80
/* 00009C34 807D002C */ lwz r3, 0x2c(r29)
/* 00009C38 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00009C3C 4BFF654D */ bl start_preview_image_read
/* 00009C40 801C003C */ lwz r0, 0x3c(r28)
/* 00009C44 901D0048 */ stw r0, 0x48(r29)
/* 00009C48 48000038 */ b lbl_00009C80
lbl_00009C4C:
/* 00009C4C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00009C50 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 00009C54 2C000019 */ cmpwi r0, 0x19
/* 00009C58 40820028 */ bne lbl_00009C80
/* 00009C5C 801D0048 */ lwz r0, 0x48(r29)
/* 00009C60 809C003C */ lwz r4, 0x3c(r28)
/* 00009C64 7C002000 */ cmpw r0, r4
/* 00009C68 41820018 */ beq lbl_00009C80
/* 00009C6C 807D002C */ lwz r3, 0x2c(r29)
/* 00009C70 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00009C74 4BFF6515 */ bl start_preview_image_read
/* 00009C78 801C003C */ lwz r0, 0x3c(r28)
/* 00009C7C 901D0048 */ stw r0, 0x48(r29)
lbl_00009C80:
/* 00009C80 807D002C */ lwz r3, 0x2c(r29)
/* 00009C84 4BFF6505 */ bl u_preview_maybe_invalidate_tex_cache
/* 00009C88 A01D003C */ lhz r0, 0x3c(r29)
/* 00009C8C 28000000 */ cmplwi r0, 0
/* 00009C90 40820080 */ bne lbl_00009D10
/* 00009C94 3860001B */ li r3, 0x1b
/* 00009C98 4BFF64F1 */ bl find_sprite_with_tag
/* 00009C9C 28030000 */ cmplwi r3, 0
/* 00009CA0 41820180 */ beq lbl_00009E20
/* 00009CA4 C0230004 */ lfs f1, 4(r3)
/* 00009CA8 C81F0070 */ lfd f0, 0x70(r31)
/* 00009CAC 801E0000 */ lwz r0, 0(r30)
/* 00009CB0 FC610028 */ fsub f3, f1, f0
/* 00009CB4 2C000001 */ cmpwi r0, 1
/* 00009CB8 FC601818 */ frsp f3, f3
/* 00009CBC 40820018 */ bne lbl_00009CD4
/* 00009CC0 C0230008 */ lfs f1, 8(r3)
/* 00009CC4 C81F0078 */ lfd f0, 0x78(r31)
/* 00009CC8 FC210028 */ fsub f1, f1, f0
/* 00009CCC FC200818 */ frsp f1, f1
/* 00009CD0 4800001C */ b lbl_00009CEC
lbl_00009CD4:
/* 00009CD4 C0230008 */ lfs f1, 8(r3)
/* 00009CD8 C81F0088 */ lfd f0, 0x88(r31)
/* 00009CDC C85F0080 */ lfd f2, 0x80(r31)
/* 00009CE0 FC010028 */ fsub f0, f1, f0
/* 00009CE4 FC22002A */ fadd f1, f2, f0
/* 00009CE8 FC200818 */ frsp f1, f1
lbl_00009CEC:
/* 00009CEC C81F0090 */ lfd f0, 0x90(r31)
/* 00009CF0 FC00182A */ fadd f0, f0, f3
/* 00009CF4 FC000018 */ frsp f0, f0
/* 00009CF8 D01D0004 */ stfs f0, 4(r29)
/* 00009CFC C81F0090 */ lfd f0, 0x90(r31)
/* 00009D00 FC00082A */ fadd f0, f0, f1
/* 00009D04 FC000018 */ frsp f0, f0
/* 00009D08 D01D0008 */ stfs f0, 8(r29)
/* 00009D0C 48000114 */ b lbl_00009E20
lbl_00009D10:
/* 00009D10 3860001C */ li r3, 0x1c
/* 00009D14 4BFF6475 */ bl find_sprite_with_tag
/* 00009D18 28030000 */ cmplwi r3, 0
/* 00009D1C 41820104 */ beq lbl_00009E20
/* 00009D20 C0630004 */ lfs f3, 4(r3)
/* 00009D24 C85F0070 */ lfd f2, 0x70(r31)
/* 00009D28 C0230008 */ lfs f1, 8(r3)
/* 00009D2C C81F0098 */ lfd f0, 0x98(r31)
/* 00009D30 FC431028 */ fsub f2, f3, f2
/* 00009D34 A01D003C */ lhz r0, 0x3c(r29)
/* 00009D38 FC210028 */ fsub f1, f1, f0
/* 00009D3C 2C000003 */ cmpwi r0, 3
/* 00009D40 FC401018 */ frsp f2, f2
/* 00009D44 FC200818 */ frsp f1, f1
/* 00009D48 41820070 */ beq lbl_00009DB8
/* 00009D4C 40800014 */ bge lbl_00009D60
/* 00009D50 2C000001 */ cmpwi r0, 1
/* 00009D54 4182001C */ beq lbl_00009D70
/* 00009D58 4080003C */ bge lbl_00009D94
/* 00009D5C 480000C4 */ b lbl_00009E20
lbl_00009D60:
/* 00009D60 2C000005 */ cmpwi r0, 5
/* 00009D64 4182009C */ beq lbl_00009E00
/* 00009D68 408000B8 */ bge lbl_00009E20
/* 00009D6C 48000070 */ b lbl_00009DDC
lbl_00009D70:
/* 00009D70 C81F0080 */ lfd f0, 0x80(r31)
/* 00009D74 FC00102A */ fadd f0, f0, f2
/* 00009D78 FC000018 */ frsp f0, f0
/* 00009D7C D01D0004 */ stfs f0, 4(r29)
/* 00009D80 C81F0080 */ lfd f0, 0x80(r31)
/* 00009D84 FC00082A */ fadd f0, f0, f1
/* 00009D88 FC000018 */ frsp f0, f0
/* 00009D8C D01D0008 */ stfs f0, 8(r29)
/* 00009D90 48000090 */ b lbl_00009E20
lbl_00009D94:
/* 00009D94 C81F00A0 */ lfd f0, 0xa0(r31)
/* 00009D98 FC00102A */ fadd f0, f0, f2
/* 00009D9C FC000018 */ frsp f0, f0
/* 00009DA0 D01D0004 */ stfs f0, 4(r29)
/* 00009DA4 C81F0080 */ lfd f0, 0x80(r31)
/* 00009DA8 FC00082A */ fadd f0, f0, f1
/* 00009DAC FC000018 */ frsp f0, f0
/* 00009DB0 D01D0008 */ stfs f0, 8(r29)
/* 00009DB4 4800006C */ b lbl_00009E20
lbl_00009DB8:
/* 00009DB8 C81F00A8 */ lfd f0, 0xa8(r31)
/* 00009DBC FC00102A */ fadd f0, f0, f2
/* 00009DC0 FC000018 */ frsp f0, f0
/* 00009DC4 D01D0004 */ stfs f0, 4(r29)
/* 00009DC8 C81F0080 */ lfd f0, 0x80(r31)
/* 00009DCC FC00082A */ fadd f0, f0, f1
/* 00009DD0 FC000018 */ frsp f0, f0
/* 00009DD4 D01D0008 */ stfs f0, 8(r29)
/* 00009DD8 48000048 */ b lbl_00009E20
lbl_00009DDC:
/* 00009DDC C81F00B0 */ lfd f0, 0xb0(r31)
/* 00009DE0 FC00102A */ fadd f0, f0, f2
/* 00009DE4 FC000018 */ frsp f0, f0
/* 00009DE8 D01D0004 */ stfs f0, 4(r29)
/* 00009DEC C81F0080 */ lfd f0, 0x80(r31)
/* 00009DF0 FC00082A */ fadd f0, f0, f1
/* 00009DF4 FC000018 */ frsp f0, f0
/* 00009DF8 D01D0008 */ stfs f0, 8(r29)
/* 00009DFC 48000024 */ b lbl_00009E20
lbl_00009E00:
/* 00009E00 C81F00B8 */ lfd f0, 0xb8(r31)
/* 00009E04 FC00102A */ fadd f0, f0, f2
/* 00009E08 FC000018 */ frsp f0, f0
/* 00009E0C D01D0004 */ stfs f0, 4(r29)
/* 00009E10 C81F0080 */ lfd f0, 0x80(r31)
/* 00009E14 FC00082A */ fadd f0, f0, f1
/* 00009E18 FC000018 */ frsp f0, f0
/* 00009E1C D01D0008 */ stfs f0, 8(r29)
lbl_00009E20:
/* 00009E20 80010024 */ lwz r0, 0x24(r1)
/* 00009E24 83E1001C */ lwz r31, 0x1c(r1)
/* 00009E28 83C10018 */ lwz r30, 0x18(r1)
/* 00009E2C 7C0803A6 */ mtlr r0
/* 00009E30 83A10014 */ lwz r29, 0x14(r1)
/* 00009E34 83810010 */ lwz r28, 0x10(r1)
/* 00009E38 38210020 */ addi r1, r1, 0x20
/* 00009E3C 4E800020 */ blr 
lbl_00009E40:
/* 00009E40 7C0802A6 */ mflr r0
/* 00009E44 3C600000 */ lis r3, lbl_00011B68@ha
/* 00009E48 90010004 */ stw r0, 4(r1)
/* 00009E4C 9421FFC8 */ stwu r1, -0x38(r1)
/* 00009E50 DBE10030 */ stfd f31, 0x30(r1)
/* 00009E54 DBC10028 */ stfd f30, 0x28(r1)
/* 00009E58 93E10024 */ stw r31, 0x24(r1)
/* 00009E5C 3BE30000 */ addi r31, r3, lbl_00011B68@l
/* 00009E60 93C10020 */ stw r30, 0x20(r1)
/* 00009E64 7C9E2378 */ mr r30, r4
/* 00009E68 93A1001C */ stw r29, 0x1c(r1)
/* 00009E6C A004003C */ lhz r0, 0x3c(r4)
/* 00009E70 28000000 */ cmplwi r0, 0
/* 00009E74 4082003C */ bne lbl_00009EB0
/* 00009E78 3C600000 */ lis r3, lbl_801EED88@ha
/* 00009E7C 809E0048 */ lwz r4, 0x48(r30)
/* 00009E80 3BA30000 */ addi r29, r3, lbl_801EED88@l
/* 00009E84 881D0000 */ lbz r0, 0(r29)
/* 00009E88 7C000774 */ extsb r0, r0
/* 00009E8C 7C040000 */ cmpw r4, r0
/* 00009E90 41820020 */ beq lbl_00009EB0
/* 00009E94 7C9F00AE */ lbzx r4, r31, r0
/* 00009E98 807E002C */ lwz r3, 0x2c(r30)
/* 00009E9C 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00009EA0 4BFF62E9 */ bl start_preview_image_read
/* 00009EA4 881D0000 */ lbz r0, 0(r29)
/* 00009EA8 7C000774 */ extsb r0, r0
/* 00009EAC 901E0048 */ stw r0, 0x48(r30)
lbl_00009EB0:
/* 00009EB0 807E002C */ lwz r3, 0x2c(r30)
/* 00009EB4 4BFF62D5 */ bl u_preview_maybe_invalidate_tex_cache
/* 00009EB8 38600021 */ li r3, 0x21
/* 00009EBC 4BFF62CD */ bl find_sprite_with_tag
/* 00009EC0 28030000 */ cmplwi r3, 0
/* 00009EC4 4182026C */ beq lbl_0000A130
/* 00009EC8 C0630004 */ lfs f3, 4(r3)
/* 00009ECC C85F00C0 */ lfd f2, 0xc0(r31)
/* 00009ED0 C0230008 */ lfs f1, 8(r3)
/* 00009ED4 C81F00C8 */ lfd f0, 0xc8(r31)
/* 00009ED8 FFC31028 */ fsub f30, f3, f2
/* 00009EDC A01E003C */ lhz r0, 0x3c(r30)
/* 00009EE0 FFE10028 */ fsub f31, f1, f0
/* 00009EE4 28000000 */ cmplwi r0, 0
/* 00009EE8 FFC0F018 */ frsp f30, f30
/* 00009EEC FFE0F818 */ frsp f31, f31
/* 00009EF0 40820028 */ bne lbl_00009F18
/* 00009EF4 386000FF */ li r3, 0xff
/* 00009EF8 987E000C */ stb r3, 0xc(r30)
/* 00009EFC 38000000 */ li r0, 0
/* 00009F00 987E000D */ stb r3, 0xd(r30)
/* 00009F04 987E000E */ stb r3, 0xe(r30)
/* 00009F08 981E0070 */ stb r0, 0x70(r30)
/* 00009F0C 981E0071 */ stb r0, 0x71(r30)
/* 00009F10 981E0072 */ stb r0, 0x72(r30)
/* 00009F14 480000E0 */ b lbl_00009FF4
lbl_00009F18:
/* 00009F18 3C600000 */ lis r3, lbl_801EED88@ha
/* 00009F1C 80BE0048 */ lwz r5, 0x48(r30)
/* 00009F20 88830000 */ lbz r4, lbl_801EED88@l(r3)
/* 00009F24 7C840774 */ extsb r4, r4
/* 00009F28 7C052000 */ cmpw r5, r4
/* 00009F2C 40820048 */ bne lbl_00009F74
/* 00009F30 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00009F34 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 00009F38 2C00001F */ cmpwi r0, 0x1f
/* 00009F3C 41820038 */ beq lbl_00009F74
/* 00009F40 380000FF */ li r0, 0xff
/* 00009F44 981E000C */ stb r0, 0xc(r30)
/* 00009F48 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00009F4C 981E000D */ stb r0, 0xd(r30)
/* 00009F50 981E000E */ stb r0, 0xe(r30)
/* 00009F54 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 00009F58 54002672 */ rlwinm r0, r0, 4, 0x19, 0x19
/* 00009F5C 981E0070 */ stb r0, 0x70(r30)
/* 00009F60 881E0070 */ lbz r0, 0x70(r30)
/* 00009F64 981E0071 */ stb r0, 0x71(r30)
/* 00009F68 881E0070 */ lbz r0, 0x70(r30)
/* 00009F6C 981E0072 */ stb r0, 0x72(r30)
/* 00009F70 48000084 */ b lbl_00009FF4
lbl_00009F74:
/* 00009F74 7C052000 */ cmpw r5, r4
/* 00009F78 4082005C */ bne lbl_00009FD4
/* 00009F7C 380000FF */ li r0, 0xff
/* 00009F80 981E000C */ stb r0, 0xc(r30)
/* 00009F84 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00009F88 981E000D */ stb r0, 0xd(r30)
/* 00009F8C 981E000E */ stb r0, 0xe(r30)
/* 00009F90 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 00009F94 5403482C */ slwi r3, r0, 9
/* 00009F98 4BFF61F1 */ bl mathutil_sin
/* 00009F9C FC400A10 */ fabs f2, f1
/* 00009FA0 C83F00D8 */ lfd f1, 0xd8(r31)
/* 00009FA4 C81F00D0 */ lfd f0, 0xd0(r31)
/* 00009FA8 FC211028 */ fsub f1, f1, f2
/* 00009FAC FC000072 */ fmul f0, f0, f1
/* 00009FB0 FC00001E */ fctiwz f0, f0
/* 00009FB4 D8010010 */ stfd f0, 0x10(r1)
/* 00009FB8 80010014 */ lwz r0, 0x14(r1)
/* 00009FBC 981E0070 */ stb r0, 0x70(r30)
/* 00009FC0 881E0070 */ lbz r0, 0x70(r30)
/* 00009FC4 981E0071 */ stb r0, 0x71(r30)
/* 00009FC8 881E0070 */ lbz r0, 0x70(r30)
/* 00009FCC 981E0072 */ stb r0, 0x72(r30)
/* 00009FD0 48000024 */ b lbl_00009FF4
lbl_00009FD4:
/* 00009FD4 38600040 */ li r3, 0x40
/* 00009FD8 987E000C */ stb r3, 0xc(r30)
/* 00009FDC 38000000 */ li r0, 0
/* 00009FE0 987E000D */ stb r3, 0xd(r30)
/* 00009FE4 987E000E */ stb r3, 0xe(r30)
/* 00009FE8 981E0070 */ stb r0, 0x70(r30)
/* 00009FEC 981E0071 */ stb r0, 0x71(r30)
/* 00009FF0 981E0072 */ stb r0, 0x72(r30)
lbl_00009FF4:
/* 00009FF4 A01E003C */ lhz r0, 0x3c(r30)
/* 00009FF8 28000000 */ cmplwi r0, 0
/* 00009FFC 40820028 */ bne lbl_0000A024
/* 0000A000 C81F00E0 */ lfd f0, 0xe0(r31)
/* 0000A004 FC00F02A */ fadd f0, f0, f30
/* 0000A008 FC000018 */ frsp f0, f0
/* 0000A00C D01E0004 */ stfs f0, 4(r30)
/* 0000A010 C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A014 FC00F82A */ fadd f0, f0, f31
/* 0000A018 FC000018 */ frsp f0, f0
/* 0000A01C D01E0008 */ stfs f0, 8(r30)
/* 0000A020 48000110 */ b lbl_0000A130
lbl_0000A024:
/* 0000A024 801E0048 */ lwz r0, 0x48(r30)
/* 0000A028 2C000003 */ cmpwi r0, 3
/* 0000A02C 4182009C */ beq lbl_0000A0C8
/* 0000A030 4080001C */ bge lbl_0000A04C
/* 0000A034 2C000001 */ cmpwi r0, 1
/* 0000A038 41820048 */ beq lbl_0000A080
/* 0000A03C 40800068 */ bge lbl_0000A0A4
/* 0000A040 2C000000 */ cmpwi r0, 0
/* 0000A044 40800018 */ bge lbl_0000A05C
/* 0000A048 480000E8 */ b lbl_0000A130
lbl_0000A04C:
/* 0000A04C 2C000005 */ cmpwi r0, 5
/* 0000A050 418200C0 */ beq lbl_0000A110
/* 0000A054 408000DC */ bge lbl_0000A130
/* 0000A058 48000094 */ b lbl_0000A0EC
lbl_0000A05C:
/* 0000A05C C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A060 FC00F02A */ fadd f0, f0, f30
/* 0000A064 FC000018 */ frsp f0, f0
/* 0000A068 D01E0004 */ stfs f0, 4(r30)
/* 0000A06C C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A070 FC00F82A */ fadd f0, f0, f31
/* 0000A074 FC000018 */ frsp f0, f0
/* 0000A078 D01E0008 */ stfs f0, 8(r30)
/* 0000A07C 480000B4 */ b lbl_0000A130
lbl_0000A080:
/* 0000A080 C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A084 FC00F02A */ fadd f0, f0, f30
/* 0000A088 FC000018 */ frsp f0, f0
/* 0000A08C D01E0004 */ stfs f0, 4(r30)
/* 0000A090 C81F00C8 */ lfd f0, 0xc8(r31)
/* 0000A094 FC00F82A */ fadd f0, f0, f31
/* 0000A098 FC000018 */ frsp f0, f0
/* 0000A09C D01E0008 */ stfs f0, 8(r30)
/* 0000A0A0 48000090 */ b lbl_0000A130
lbl_0000A0A4:
/* 0000A0A4 C81F00F0 */ lfd f0, 0xf0(r31)
/* 0000A0A8 FC00F02A */ fadd f0, f0, f30
/* 0000A0AC FC000018 */ frsp f0, f0
/* 0000A0B0 D01E0004 */ stfs f0, 4(r30)
/* 0000A0B4 C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A0B8 FC00F82A */ fadd f0, f0, f31
/* 0000A0BC FC000018 */ frsp f0, f0
/* 0000A0C0 D01E0008 */ stfs f0, 8(r30)
/* 0000A0C4 4800006C */ b lbl_0000A130
lbl_0000A0C8:
/* 0000A0C8 C81F00F0 */ lfd f0, 0xf0(r31)
/* 0000A0CC FC00F02A */ fadd f0, f0, f30
/* 0000A0D0 FC000018 */ frsp f0, f0
/* 0000A0D4 D01E0004 */ stfs f0, 4(r30)
/* 0000A0D8 C81F00C8 */ lfd f0, 0xc8(r31)
/* 0000A0DC FC00F82A */ fadd f0, f0, f31
/* 0000A0E0 FC000018 */ frsp f0, f0
/* 0000A0E4 D01E0008 */ stfs f0, 8(r30)
/* 0000A0E8 48000048 */ b lbl_0000A130
lbl_0000A0EC:
/* 0000A0EC C81F00F8 */ lfd f0, 0xf8(r31)
/* 0000A0F0 FC00F02A */ fadd f0, f0, f30
/* 0000A0F4 FC000018 */ frsp f0, f0
/* 0000A0F8 D01E0004 */ stfs f0, 4(r30)
/* 0000A0FC C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A100 FC00F82A */ fadd f0, f0, f31
/* 0000A104 FC000018 */ frsp f0, f0
/* 0000A108 D01E0008 */ stfs f0, 8(r30)
/* 0000A10C 48000024 */ b lbl_0000A130
lbl_0000A110:
/* 0000A110 C81F00F8 */ lfd f0, 0xf8(r31)
/* 0000A114 FC00F02A */ fadd f0, f0, f30
/* 0000A118 FC000018 */ frsp f0, f0
/* 0000A11C D01E0004 */ stfs f0, 4(r30)
/* 0000A120 C81F00C8 */ lfd f0, 0xc8(r31)
/* 0000A124 FC00F82A */ fadd f0, f0, f31
/* 0000A128 FC000018 */ frsp f0, f0
/* 0000A12C D01E0008 */ stfs f0, 8(r30)
lbl_0000A130:
/* 0000A130 8001003C */ lwz r0, 0x3c(r1)
/* 0000A134 CBE10030 */ lfd f31, 0x30(r1)
/* 0000A138 CBC10028 */ lfd f30, 0x28(r1)
/* 0000A13C 7C0803A6 */ mtlr r0
/* 0000A140 83E10024 */ lwz r31, 0x24(r1)
/* 0000A144 83C10020 */ lwz r30, 0x20(r1)
/* 0000A148 83A1001C */ lwz r29, 0x1c(r1)
/* 0000A14C 38210038 */ addi r1, r1, 0x38
/* 0000A150 4E800020 */ blr 
lbl_0000A154:
/* 0000A154 7C0802A6 */ mflr r0
/* 0000A158 3C600000 */ lis r3, lbl_00011B68@ha
/* 0000A15C 90010004 */ stw r0, 4(r1)
/* 0000A160 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000A164 93E10014 */ stw r31, 0x14(r1)
/* 0000A168 3BE30000 */ addi r31, r3, lbl_00011B68@l
/* 0000A16C 93C10010 */ stw r30, 0x10(r1)
/* 0000A170 7C9E2378 */ mr r30, r4
/* 0000A174 A084003C */ lhz r4, 0x3c(r4)
/* 0000A178 28040000 */ cmplwi r4, 0
/* 0000A17C 4182002C */ beq lbl_0000A1A8
/* 0000A180 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000A184 38030000 */ addi r0, r3, lbl_801EED98@l
/* 0000A188 7C602214 */ add r3, r0, r4
/* 0000A18C 88830005 */ lbz r4, 5(r3)
/* 0000A190 3C600000 */ lis r3, lbl_10000804@ha
/* 0000A194 38030000 */ addi r0, r3, lbl_10000804@l
/* 0000A198 7C830774 */ extsb r3, r4
/* 0000A19C 1C630074 */ mulli r3, r3, 0x74
/* 0000A1A0 7C001A14 */ add r0, r0, r3
/* 0000A1A4 901E002C */ stw r0, 0x2c(r30)
lbl_0000A1A8:
/* 0000A1A8 807E002C */ lwz r3, 0x2c(r30)
/* 0000A1AC 4BFF5FDD */ bl u_preview_maybe_invalidate_tex_cache
/* 0000A1B0 38600022 */ li r3, 0x22
/* 0000A1B4 4BFF5FD5 */ bl find_sprite_with_tag
/* 0000A1B8 28030000 */ cmplwi r3, 0
/* 0000A1BC 418201D0 */ beq lbl_0000A38C
/* 0000A1C0 C0630004 */ lfs f3, 4(r3)
/* 0000A1C4 C85F0100 */ lfd f2, 0x100(r31)
/* 0000A1C8 C0230008 */ lfs f1, 8(r3)
/* 0000A1CC C81F0070 */ lfd f0, 0x70(r31)
/* 0000A1D0 FC431028 */ fsub f2, f3, f2
/* 0000A1D4 A01E003C */ lhz r0, 0x3c(r30)
/* 0000A1D8 FC210028 */ fsub f1, f1, f0
/* 0000A1DC 28000000 */ cmplwi r0, 0
/* 0000A1E0 FC401018 */ frsp f2, f2
/* 0000A1E4 FC200818 */ frsp f1, f1
/* 0000A1E8 41820018 */ beq lbl_0000A200
/* 0000A1EC 380000FF */ li r0, 0xff
/* 0000A1F0 981E000C */ stb r0, 0xc(r30)
/* 0000A1F4 981E000D */ stb r0, 0xd(r30)
/* 0000A1F8 981E000E */ stb r0, 0xe(r30)
/* 0000A1FC 48000068 */ b lbl_0000A264
lbl_0000A200:
/* 0000A200 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000A204 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 0000A208 2C000024 */ cmpwi r0, 0x24
/* 0000A20C 41820018 */ beq lbl_0000A224
/* 0000A210 38000040 */ li r0, 0x40
/* 0000A214 981E000C */ stb r0, 0xc(r30)
/* 0000A218 981E000D */ stb r0, 0xd(r30)
/* 0000A21C 981E000E */ stb r0, 0xe(r30)
/* 0000A220 48000044 */ b lbl_0000A264
lbl_0000A224:
/* 0000A224 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000A228 809E0048 */ lwz r4, 0x48(r30)
/* 0000A22C 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000A230 88030005 */ lbz r0, 5(r3)
/* 0000A234 7C000774 */ extsb r0, r0
/* 0000A238 7C040000 */ cmpw r4, r0
/* 0000A23C 40820018 */ bne lbl_0000A254
/* 0000A240 380000FF */ li r0, 0xff
/* 0000A244 981E000C */ stb r0, 0xc(r30)
/* 0000A248 981E000D */ stb r0, 0xd(r30)
/* 0000A24C 981E000E */ stb r0, 0xe(r30)
/* 0000A250 48000014 */ b lbl_0000A264
lbl_0000A254:
/* 0000A254 38000040 */ li r0, 0x40
/* 0000A258 981E000C */ stb r0, 0xc(r30)
/* 0000A25C 981E000D */ stb r0, 0xd(r30)
/* 0000A260 981E000E */ stb r0, 0xe(r30)
lbl_0000A264:
/* 0000A264 A01E003C */ lhz r0, 0x3c(r30)
/* 0000A268 2C000002 */ cmpwi r0, 2
/* 0000A26C 418200DC */ beq lbl_0000A348
/* 0000A270 40800014 */ bge lbl_0000A284
/* 0000A274 2C000000 */ cmpwi r0, 0
/* 0000A278 41820018 */ beq lbl_0000A290
/* 0000A27C 408000A8 */ bge lbl_0000A324
/* 0000A280 4800010C */ b lbl_0000A38C
lbl_0000A284:
/* 0000A284 2C000004 */ cmpwi r0, 4
/* 0000A288 40800104 */ bge lbl_0000A38C
/* 0000A28C 480000E0 */ b lbl_0000A36C
lbl_0000A290:
/* 0000A290 801E0048 */ lwz r0, 0x48(r30)
/* 0000A294 2C000001 */ cmpwi r0, 1
/* 0000A298 41820044 */ beq lbl_0000A2DC
/* 0000A29C 40800010 */ bge lbl_0000A2AC
/* 0000A2A0 2C000000 */ cmpwi r0, 0
/* 0000A2A4 40800014 */ bge lbl_0000A2B8
/* 0000A2A8 480000E4 */ b lbl_0000A38C
lbl_0000A2AC:
/* 0000A2AC 2C000003 */ cmpwi r0, 3
/* 0000A2B0 408000DC */ bge lbl_0000A38C
/* 0000A2B4 4800004C */ b lbl_0000A300
lbl_0000A2B8:
/* 0000A2B8 C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A2BC FC00102A */ fadd f0, f0, f2
/* 0000A2C0 FC000018 */ frsp f0, f0
/* 0000A2C4 D01E0004 */ stfs f0, 4(r30)
/* 0000A2C8 C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A2CC FC00082A */ fadd f0, f0, f1
/* 0000A2D0 FC000018 */ frsp f0, f0
/* 0000A2D4 D01E0008 */ stfs f0, 8(r30)
/* 0000A2D8 480000B4 */ b lbl_0000A38C
lbl_0000A2DC:
/* 0000A2DC C81F0108 */ lfd f0, 0x108(r31)
/* 0000A2E0 FC00102A */ fadd f0, f0, f2
/* 0000A2E4 FC000018 */ frsp f0, f0
/* 0000A2E8 D01E0004 */ stfs f0, 4(r30)
/* 0000A2EC C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A2F0 FC00082A */ fadd f0, f0, f1
/* 0000A2F4 FC000018 */ frsp f0, f0
/* 0000A2F8 D01E0008 */ stfs f0, 8(r30)
/* 0000A2FC 48000090 */ b lbl_0000A38C
lbl_0000A300:
/* 0000A300 C81F0110 */ lfd f0, 0x110(r31)
/* 0000A304 FC00102A */ fadd f0, f0, f2
/* 0000A308 FC000018 */ frsp f0, f0
/* 0000A30C D01E0004 */ stfs f0, 4(r30)
/* 0000A310 C81F00E8 */ lfd f0, 0xe8(r31)
/* 0000A314 FC00082A */ fadd f0, f0, f1
/* 0000A318 FC000018 */ frsp f0, f0
/* 0000A31C D01E0008 */ stfs f0, 8(r30)
/* 0000A320 4800006C */ b lbl_0000A38C
lbl_0000A324:
/* 0000A324 C81F0118 */ lfd f0, 0x118(r31)
/* 0000A328 FC00102A */ fadd f0, f0, f2
/* 0000A32C FC000018 */ frsp f0, f0
/* 0000A330 D01E0004 */ stfs f0, 4(r30)
/* 0000A334 C81F0120 */ lfd f0, 0x120(r31)
/* 0000A338 FC00082A */ fadd f0, f0, f1
/* 0000A33C FC000018 */ frsp f0, f0
/* 0000A340 D01E0008 */ stfs f0, 8(r30)
/* 0000A344 48000048 */ b lbl_0000A38C
lbl_0000A348:
/* 0000A348 C81F0128 */ lfd f0, 0x128(r31)
/* 0000A34C FC00102A */ fadd f0, f0, f2
/* 0000A350 FC000018 */ frsp f0, f0
/* 0000A354 D01E0004 */ stfs f0, 4(r30)
/* 0000A358 C81F0120 */ lfd f0, 0x120(r31)
/* 0000A35C FC00082A */ fadd f0, f0, f1
/* 0000A360 FC000018 */ frsp f0, f0
/* 0000A364 D01E0008 */ stfs f0, 8(r30)
/* 0000A368 48000024 */ b lbl_0000A38C
lbl_0000A36C:
/* 0000A36C C81F0130 */ lfd f0, 0x130(r31)
/* 0000A370 FC00102A */ fadd f0, f0, f2
/* 0000A374 FC000018 */ frsp f0, f0
/* 0000A378 D01E0004 */ stfs f0, 4(r30)
/* 0000A37C C81F0120 */ lfd f0, 0x120(r31)
/* 0000A380 FC00082A */ fadd f0, f0, f1
/* 0000A384 FC000018 */ frsp f0, f0
/* 0000A388 D01E0008 */ stfs f0, 8(r30)
lbl_0000A38C:
/* 0000A38C 8001001C */ lwz r0, 0x1c(r1)
/* 0000A390 83E10014 */ lwz r31, 0x14(r1)
/* 0000A394 83C10010 */ lwz r30, 0x10(r1)
/* 0000A398 7C0803A6 */ mtlr r0
/* 0000A39C 38210018 */ addi r1, r1, 0x18
/* 0000A3A0 4E800020 */ blr 
lbl_0000A3A4:
/* 0000A3A4 7C0802A6 */ mflr r0
/* 0000A3A8 7C661B78 */ mr r6, r3
/* 0000A3AC 90010004 */ stw r0, 4(r1)
/* 0000A3B0 9421FFF8 */ stwu r1, -8(r1)
/* 0000A3B4 A083003C */ lhz r4, 0x3c(r3)
/* 0000A3B8 28040000 */ cmplwi r4, 0
/* 0000A3BC 4082004C */ bne lbl_0000A408
/* 0000A3C0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000A3C4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000A3C8 80630000 */ lwz r3, 0(r3)
/* 0000A3CC 3803FFE9 */ addi r0, r3, -23  ;# fixed addi
/* 0000A3D0 28000001 */ cmplwi r0, 1
/* 0000A3D4 408100BC */ ble lbl_0000A490
/* 0000A3D8 3C600000 */ lis r3, lbl_100000C0@ha
/* 0000A3DC 80030000 */ lwz r0, lbl_100000C0@l(r3)
/* 0000A3E0 2C000000 */ cmpwi r0, 0
/* 0000A3E4 40820060 */ bne lbl_0000A444
/* 0000A3E8 3C800000 */ lis r4, lbl_80206DEC@ha
/* 0000A3EC 3C600000 */ lis r3, lbl_00011C40@ha
/* 0000A3F0 38840000 */ addi r4, r4, lbl_80206DEC@l
/* 0000A3F4 C8030000 */ lfd f0, lbl_00011C40@l(r3)
/* 0000A3F8 C0240004 */ lfs f1, 4(r4)
/* 0000A3FC FC010040 */ fcmpo cr0, f1, f0
/* 0000A400 40810044 */ ble lbl_0000A444
/* 0000A404 4800008C */ b lbl_0000A490
lbl_0000A408:
/* 0000A408 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000A40C 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000A410 80630000 */ lwz r3, 0(r3)
/* 0000A414 3803FFE9 */ addi r0, r3, -23  ;# fixed addi
/* 0000A418 28000001 */ cmplwi r0, 1
/* 0000A41C 40810074 */ ble lbl_0000A490
/* 0000A420 3C600000 */ lis r3, lbl_802F1FAC@ha
/* 0000A424 80030000 */ lwz r0, lbl_802F1FAC@l(r3)
/* 0000A428 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 0000A42C 7C040000 */ cmpw r4, r0
/* 0000A430 40800060 */ bge lbl_0000A490
/* 0000A434 3C600000 */ lis r3, lbl_802F1FB0@ha
/* 0000A438 80030000 */ lwz r0, lbl_802F1FB0@l(r3)
/* 0000A43C 7C040000 */ cmpw r4, r0
/* 0000A440 40800050 */ bge lbl_0000A490
lbl_0000A444:
/* 0000A444 8886000D */ lbz r4, 0xd(r6)
/* 0000A448 88060071 */ lbz r0, 0x71(r6)
/* 0000A44C 88A6000C */ lbz r5, 0xc(r6)
/* 0000A450 5484402E */ slwi r4, r4, 8
/* 0000A454 88660070 */ lbz r3, 0x70(r6)
/* 0000A458 5400402E */ slwi r0, r0, 8
/* 0000A45C 50A4821E */ rlwimi r4, r5, 0x10, 8, 0xf
/* 0000A460 88E6000E */ lbz r7, 0xe(r6)
/* 0000A464 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A468 88A60072 */ lbz r5, 0x72(r6)
/* 0000A46C 8066002C */ lwz r3, 0x2c(r6)
/* 0000A470 7CE42378 */ or r4, r7, r4
/* 0000A474 C0260004 */ lfs f1, 4(r6)
/* 0000A478 7CA50378 */ or r5, r5, r0
/* 0000A47C C0460008 */ lfs f2, 8(r6)
/* 0000A480 C066004C */ lfs f3, 0x4c(r6)
/* 0000A484 C0860040 */ lfs f4, 0x40(r6)
/* 0000A488 C0A60044 */ lfs f5, 0x44(r6)
/* 0000A48C 4BFF5CFD */ bl preview_draw
lbl_0000A490:
/* 0000A490 8001000C */ lwz r0, 0xc(r1)
/* 0000A494 38210008 */ addi r1, r1, 8
/* 0000A498 7C0803A6 */ mtlr r0
/* 0000A49C 4E800020 */ blr 
lbl_0000A4A0:
/* 0000A4A0 7C0802A6 */ mflr r0
/* 0000A4A4 7C671B78 */ mr r7, r3
/* 0000A4A8 90010004 */ stw r0, 4(r1)
/* 0000A4AC 9421FFF8 */ stwu r1, -8(r1)
/* 0000A4B0 A003003C */ lhz r0, 0x3c(r3)
/* 0000A4B4 28000000 */ cmplwi r0, 0
/* 0000A4B8 40820030 */ bne lbl_0000A4E8
/* 0000A4BC 3C600000 */ lis r3, lbl_100000C0@ha
/* 0000A4C0 80030000 */ lwz r0, lbl_100000C0@l(r3)
/* 0000A4C4 2C000000 */ cmpwi r0, 0
/* 0000A4C8 40820020 */ bne lbl_0000A4E8
/* 0000A4CC 3C800000 */ lis r4, lbl_80206DEC@ha
/* 0000A4D0 3C600000 */ lis r3, lbl_00011C40@ha
/* 0000A4D4 38840000 */ addi r4, r4, lbl_80206DEC@l
/* 0000A4D8 C8030000 */ lfd f0, lbl_00011C40@l(r3)
/* 0000A4DC C0240004 */ lfs f1, 4(r4)
/* 0000A4E0 FC010040 */ fcmpo cr0, f1, f0
/* 0000A4E4 41810050 */ bgt lbl_0000A534
lbl_0000A4E8:
/* 0000A4E8 8887000D */ lbz r4, 0xd(r7)
/* 0000A4EC 88070071 */ lbz r0, 0x71(r7)
/* 0000A4F0 88A7000C */ lbz r5, 0xc(r7)
/* 0000A4F4 5484402E */ slwi r4, r4, 8
/* 0000A4F8 88670070 */ lbz r3, 0x70(r7)
/* 0000A4FC 5400402E */ slwi r0, r0, 8
/* 0000A500 50A4821E */ rlwimi r4, r5, 0x10, 8, 0xf
/* 0000A504 88C7000E */ lbz r6, 0xe(r7)
/* 0000A508 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A50C 88A70072 */ lbz r5, 0x72(r7)
/* 0000A510 8067002C */ lwz r3, 0x2c(r7)
/* 0000A514 7CC42378 */ or r4, r6, r4
/* 0000A518 C0270004 */ lfs f1, 4(r7)
/* 0000A51C 7CA50378 */ or r5, r5, r0
/* 0000A520 C0470008 */ lfs f2, 8(r7)
/* 0000A524 C067004C */ lfs f3, 0x4c(r7)
/* 0000A528 C0870040 */ lfs f4, 0x40(r7)
/* 0000A52C C0A70044 */ lfs f5, 0x44(r7)
/* 0000A530 4BFF5C59 */ bl preview_draw
lbl_0000A534:
/* 0000A534 8001000C */ lwz r0, 0xc(r1)
/* 0000A538 38210008 */ addi r1, r1, 8
/* 0000A53C 7C0803A6 */ mtlr r0
/* 0000A540 4E800020 */ blr 
lbl_0000A544:
/* 0000A544 7C0802A6 */ mflr r0
/* 0000A548 7C661B78 */ mr r6, r3
/* 0000A54C 90010004 */ stw r0, 4(r1)
/* 0000A550 9421FFF8 */ stwu r1, -8(r1)
/* 0000A554 A083003C */ lhz r4, 0x3c(r3)
/* 0000A558 28040000 */ cmplwi r4, 0
/* 0000A55C 40820060 */ bne lbl_0000A5BC
/* 0000A560 3C600000 */ lis r3, lbl_100000C0@ha
/* 0000A564 80030000 */ lwz r0, lbl_100000C0@l(r3)
/* 0000A568 2C000000 */ cmpwi r0, 0
/* 0000A56C 4082006C */ bne lbl_0000A5D8
/* 0000A570 3C800000 */ lis r4, lbl_80206DEC@ha
/* 0000A574 3C600000 */ lis r3, lbl_00011C40@ha
/* 0000A578 38840000 */ addi r4, r4, lbl_80206DEC@l
/* 0000A57C C8030000 */ lfd f0, lbl_00011C40@l(r3)
/* 0000A580 C0240004 */ lfs f1, 4(r4)
/* 0000A584 FC010040 */ fcmpo cr0, f1, f0
/* 0000A588 40810050 */ ble lbl_0000A5D8
/* 0000A58C 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000A590 80860048 */ lwz r4, 0x48(r6)
/* 0000A594 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000A598 88030005 */ lbz r0, 5(r3)
/* 0000A59C 7C000774 */ extsb r0, r0
/* 0000A5A0 7C040000 */ cmpw r4, r0
/* 0000A5A4 40820034 */ bne lbl_0000A5D8
/* 0000A5A8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000A5AC 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 0000A5B0 2C000024 */ cmpwi r0, 0x24
/* 0000A5B4 40820024 */ bne lbl_0000A5D8
/* 0000A5B8 4800006C */ b lbl_0000A624
lbl_0000A5BC:
/* 0000A5BC 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000A5C0 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000A5C4 88030009 */ lbz r0, 9(r3)
/* 0000A5C8 3864FFFF */ addi r3, r4, -1  ;# fixed addi
/* 0000A5CC 7C000774 */ extsb r0, r0
/* 0000A5D0 7C030000 */ cmpw r3, r0
/* 0000A5D4 40800050 */ bge lbl_0000A624
lbl_0000A5D8:
/* 0000A5D8 8886000D */ lbz r4, 0xd(r6)
/* 0000A5DC 88060071 */ lbz r0, 0x71(r6)
/* 0000A5E0 88A6000C */ lbz r5, 0xc(r6)
/* 0000A5E4 5484402E */ slwi r4, r4, 8
/* 0000A5E8 88660070 */ lbz r3, 0x70(r6)
/* 0000A5EC 5400402E */ slwi r0, r0, 8
/* 0000A5F0 50A4821E */ rlwimi r4, r5, 0x10, 8, 0xf
/* 0000A5F4 88E6000E */ lbz r7, 0xe(r6)
/* 0000A5F8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A5FC 88A60072 */ lbz r5, 0x72(r6)
/* 0000A600 8066002C */ lwz r3, 0x2c(r6)
/* 0000A604 7CE42378 */ or r4, r7, r4
/* 0000A608 C0260004 */ lfs f1, 4(r6)
/* 0000A60C 7CA50378 */ or r5, r5, r0
/* 0000A610 C0460008 */ lfs f2, 8(r6)
/* 0000A614 C066004C */ lfs f3, 0x4c(r6)
/* 0000A618 C0860040 */ lfs f4, 0x40(r6)
/* 0000A61C C0A60044 */ lfs f5, 0x44(r6)
/* 0000A620 4BFF5B69 */ bl preview_draw
lbl_0000A624:
/* 0000A624 8001000C */ lwz r0, 0xc(r1)
/* 0000A628 38210008 */ addi r1, r1, 8
/* 0000A62C 7C0803A6 */ mtlr r0
/* 0000A630 4E800020 */ blr 
lbl_0000A634:
/* 0000A634 7C0802A6 */ mflr r0
/* 0000A638 90010004 */ stw r0, 4(r1)
/* 0000A63C 9421FFF8 */ stwu r1, -8(r1)
/* 0000A640 8063002C */ lwz r3, 0x2c(r3)
/* 0000A644 4BFF5B45 */ bl preview_free
/* 0000A648 8001000C */ lwz r0, 0xc(r1)
/* 0000A64C 38210008 */ addi r1, r1, 8
/* 0000A650 7C0803A6 */ mtlr r0
/* 0000A654 4E800020 */ blr 
lbl_0000A658:
/* 0000A658 7C0802A6 */ mflr r0
/* 0000A65C 90010004 */ stw r0, 4(r1)
/* 0000A660 9421FFF8 */ stwu r1, -8(r1)
/* 0000A664 8063002C */ lwz r3, 0x2c(r3)
/* 0000A668 4BFF5B21 */ bl preview_free
/* 0000A66C 8001000C */ lwz r0, 0xc(r1)
/* 0000A670 38210008 */ addi r1, r1, 8
/* 0000A674 7C0803A6 */ mtlr r0
/* 0000A678 4E800020 */ blr 
lbl_0000A67C:
/* 0000A67C 7C0802A6 */ mflr r0
/* 0000A680 90010004 */ stw r0, 4(r1)
/* 0000A684 9421FFF8 */ stwu r1, -8(r1)
/* 0000A688 A083003C */ lhz r4, 0x3c(r3)
/* 0000A68C 28040000 */ cmplwi r4, 0
/* 0000A690 40820010 */ bne lbl_0000A6A0
/* 0000A694 8063002C */ lwz r3, 0x2c(r3)
/* 0000A698 4BFF5AF1 */ bl preview_free
/* 0000A69C 4800001C */ b lbl_0000A6B8
lbl_0000A6A0:
/* 0000A6A0 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 0000A6A4 1C800074 */ mulli r4, r0, 0x74
/* 0000A6A8 3C600000 */ lis r3, lbl_10000804@ha
/* 0000A6AC 38030000 */ addi r0, r3, lbl_10000804@l
/* 0000A6B0 7C602214 */ add r3, r0, r4
/* 0000A6B4 4BFF5AD5 */ bl preview_free
lbl_0000A6B8:
/* 0000A6B8 8001000C */ lwz r0, 0xc(r1)
/* 0000A6BC 38210008 */ addi r1, r1, 8
/* 0000A6C0 7C0803A6 */ mtlr r0
/* 0000A6C4 4E800020 */ blr 
lbl_0000A6C8:
/* 0000A6C8 7C0802A6 */ mflr r0
/* 0000A6CC 3C800000 */ lis r4, lbl_10000000@ha
/* 0000A6D0 90010004 */ stw r0, 4(r1)
/* 0000A6D4 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000A6D8 BF610014 */ stmw r27, 0x14(r1)
/* 0000A6DC 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 0000A6E0 3C800000 */ lis r4, lbl_00011B68@ha
/* 0000A6E4 3B630000 */ addi r27, r3, 0
/* 0000A6E8 3BA40000 */ addi r29, r4, lbl_00011B68@l
/* 0000A6EC 801E09D4 */ lwz r0, 0x9d4(r30)
/* 0000A6F0 2C000000 */ cmpwi r0, 0
/* 0000A6F4 408200A8 */ bne lbl_0000A79C
/* 0000A6F8 4BFF5A91 */ bl create_sprite
/* 0000A6FC 7C7F1B79 */ or. r31, r3, r3
/* 0000A700 41820094 */ beq lbl_0000A794
/* 0000A704 3B9E0960 */ addi r28, r30, 0x960
/* 0000A708 387C0000 */ addi r3, r28, 0
/* 0000A70C 389B0000 */ addi r4, r27, 0
/* 0000A710 38A00000 */ li r5, 0
/* 0000A714 38C00280 */ li r6, 0x280
/* 0000A718 38E001E0 */ li r7, 0x1e0
/* 0000A71C 3900000E */ li r8, 0xe
/* 0000A720 4BFF5A69 */ bl preview_create
/* 0000A724 A01E0962 */ lhz r0, 0x962(r30)
/* 0000A728 3CA00000 */ lis r5, lbl_0000A7B0@ha
/* 0000A72C 3C800000 */ lis r4, lbl_0000A7D4@ha
/* 0000A730 60000002 */ ori r0, r0, 2
/* 0000A734 B01E0962 */ sth r0, 0x962(r30)
/* 0000A738 3C600000 */ lis r3, lbl_0000A840@ha
/* 0000A73C 38000063 */ li r0, 0x63
/* 0000A740 939F002C */ stw r28, 0x2c(r31)
/* 0000A744 38A50000 */ addi r5, r5, lbl_0000A7B0@l
/* 0000A748 38840000 */ addi r4, r4, lbl_0000A7D4@l
/* 0000A74C 981F000F */ stb r0, 0xf(r31)
/* 0000A750 38030000 */ addi r0, r3, lbl_0000A840@l
/* 0000A754 C01D006C */ lfs f0, 0x6c(r29)
/* 0000A758 D01F0004 */ stfs f0, 4(r31)
/* 0000A75C C01D006C */ lfs f0, 0x6c(r29)
/* 0000A760 D01F0008 */ stfs f0, 8(r31)
/* 0000A764 C01D0138 */ lfs f0, 0x138(r29)
/* 0000A768 D01F004C */ stfs f0, 0x4c(r31)
/* 0000A76C C01D013C */ lfs f0, 0x13c(r29)
/* 0000A770 D01F0040 */ stfs f0, 0x40(r31)
/* 0000A774 C01D0140 */ lfs f0, 0x140(r29)
/* 0000A778 D01F0044 */ stfs f0, 0x44(r31)
/* 0000A77C 807F0074 */ lwz r3, 0x74(r31)
/* 0000A780 64630004 */ oris r3, r3, 4
/* 0000A784 907F0074 */ stw r3, 0x74(r31)
/* 0000A788 90BF0034 */ stw r5, 0x34(r31)
/* 0000A78C 909F0038 */ stw r4, 0x38(r31)
/* 0000A790 901F0030 */ stw r0, 0x30(r31)
lbl_0000A794:
/* 0000A794 38000001 */ li r0, 1
/* 0000A798 901E09D4 */ stw r0, 0x9d4(r30)
lbl_0000A79C:
/* 0000A79C BB610014 */ lmw r27, 0x14(r1)
/* 0000A7A0 8001002C */ lwz r0, 0x2c(r1)
/* 0000A7A4 38210028 */ addi r1, r1, 0x28
/* 0000A7A8 7C0803A6 */ mtlr r0
/* 0000A7AC 4E800020 */ blr 
lbl_0000A7B0:
/* 0000A7B0 7C0802A6 */ mflr r0
/* 0000A7B4 90010004 */ stw r0, 4(r1)
/* 0000A7B8 9421FFF8 */ stwu r1, -8(r1)
/* 0000A7BC 8064002C */ lwz r3, 0x2c(r4)
/* 0000A7C0 4BFF59C9 */ bl u_preview_maybe_invalidate_tex_cache
/* 0000A7C4 8001000C */ lwz r0, 0xc(r1)
/* 0000A7C8 38210008 */ addi r1, r1, 8
/* 0000A7CC 7C0803A6 */ mtlr r0
/* 0000A7D0 4E800020 */ blr 
lbl_0000A7D4:
/* 0000A7D4 7C0802A6 */ mflr r0
/* 0000A7D8 7C671B78 */ mr r7, r3
/* 0000A7DC 90010004 */ stw r0, 4(r1)
/* 0000A7E0 9421FFF8 */ stwu r1, -8(r1)
/* 0000A7E4 8883000D */ lbz r4, 0xd(r3)
/* 0000A7E8 88A3000C */ lbz r5, 0xc(r3)
/* 0000A7EC 88070071 */ lbz r0, 0x71(r7)
/* 0000A7F0 5484402E */ slwi r4, r4, 8
/* 0000A7F4 50A4821E */ rlwimi r4, r5, 0x10, 8, 0xf
/* 0000A7F8 88C7000E */ lbz r6, 0xe(r7)
/* 0000A7FC 88630070 */ lbz r3, 0x70(r3)
/* 0000A800 5400402E */ slwi r0, r0, 8
/* 0000A804 88A70072 */ lbz r5, 0x72(r7)
/* 0000A808 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A80C 8067002C */ lwz r3, 0x2c(r7)
/* 0000A810 C0270004 */ lfs f1, 4(r7)
/* 0000A814 7CC42378 */ or r4, r6, r4
/* 0000A818 C0470008 */ lfs f2, 8(r7)
/* 0000A81C 7CA50378 */ or r5, r5, r0
/* 0000A820 C067004C */ lfs f3, 0x4c(r7)
/* 0000A824 C0870040 */ lfs f4, 0x40(r7)
/* 0000A828 C0A70044 */ lfs f5, 0x44(r7)
/* 0000A82C 4BFF595D */ bl preview_draw
/* 0000A830 8001000C */ lwz r0, 0xc(r1)
/* 0000A834 38210008 */ addi r1, r1, 8
/* 0000A838 7C0803A6 */ mtlr r0
/* 0000A83C 4E800020 */ blr 
lbl_0000A840:
/* 0000A840 7C0802A6 */ mflr r0
/* 0000A844 3C800000 */ lis r4, lbl_100009D4@ha
/* 0000A848 90010004 */ stw r0, 4(r1)
/* 0000A84C 38000000 */ li r0, 0
/* 0000A850 9421FFF8 */ stwu r1, -8(r1)
/* 0000A854 90040000 */ stw r0, lbl_100009D4@l(r4)
/* 0000A858 8063002C */ lwz r3, 0x2c(r3)
/* 0000A85C 4BFF592D */ bl preview_free
/* 0000A860 8001000C */ lwz r0, 0xc(r1)
/* 0000A864 38210008 */ addi r1, r1, 8
/* 0000A868 7C0803A6 */ mtlr r0
/* 0000A86C 4E800020 */ blr 
lbl_0000A870:
/* 0000A870 7C0802A6 */ mflr r0
/* 0000A874 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000A878 90010004 */ stw r0, 4(r1)
/* 0000A87C 38C40000 */ addi r6, r4, lbl_00011CB0@l
/* 0000A880 3880FFFF */ li r4, -1
/* 0000A884 9421FF98 */ stwu r1, -0x68(r1)
/* 0000A888 A003003C */ lhz r0, 0x3c(r3)
/* 0000A88C 9001000C */ stw r0, 0xc(r1)
/* 0000A890 38000000 */ li r0, 0
/* 0000A894 C0030004 */ lfs f0, 4(r3)
/* 0000A898 D0010010 */ stfs f0, 0x10(r1)
/* 0000A89C C0030008 */ lfs f0, 8(r3)
/* 0000A8A0 D0010014 */ stfs f0, 0x14(r1)
/* 0000A8A4 C8260000 */ lfd f1, 0(r6)
/* 0000A8A8 C003004C */ lfs f0, 0x4c(r3)
/* 0000A8AC FC01002A */ fadd f0, f1, f0
/* 0000A8B0 FC000018 */ frsp f0, f0
/* 0000A8B4 D0010018 */ stfs f0, 0x18(r1)
/* 0000A8B8 C0030040 */ lfs f0, 0x40(r3)
/* 0000A8BC D001001C */ stfs f0, 0x1c(r1)
/* 0000A8C0 C0030044 */ lfs f0, 0x44(r3)
/* 0000A8C4 D0010020 */ stfs f0, 0x20(r1)
/* 0000A8C8 C0060008 */ lfs f0, 8(r6)
/* 0000A8CC D0010024 */ stfs f0, 0x24(r1)
/* 0000A8D0 C0060008 */ lfs f0, 8(r6)
/* 0000A8D4 D0010028 */ stfs f0, 0x28(r1)
/* 0000A8D8 C006000C */ lfs f0, 0xc(r6)
/* 0000A8DC D001002C */ stfs f0, 0x2c(r1)
/* 0000A8E0 C006000C */ lfs f0, 0xc(r6)
/* 0000A8E4 D0010030 */ stfs f0, 0x30(r1)
/* 0000A8E8 A8A30068 */ lha r5, 0x68(r3)
/* 0000A8EC 90A10034 */ stw r5, 0x34(r1)
/* 0000A8F0 C003006C */ lfs f0, 0x6c(r3)
/* 0000A8F4 D0010038 */ stfs f0, 0x38(r1)
/* 0000A8F8 9081003C */ stw r4, 0x3c(r1)
/* 0000A8FC 80830074 */ lwz r4, 0x74(r3)
/* 0000A900 54840036 */ rlwinm r4, r4, 0, 0, 0x1b
/* 0000A904 6084000A */ ori r4, r4, 0xa
/* 0000A908 90810040 */ stw r4, 0x40(r1)
/* 0000A90C C003006C */ lfs f0, 0x6c(r3)
/* 0000A910 3861000C */ addi r3, r1, 0xc
/* 0000A914 C0260010 */ lfs f1, 0x10(r6)
/* 0000A918 EC010032 */ fmuls f0, f1, f0
/* 0000A91C FC00001E */ fctiwz f0, f0
/* 0000A920 D8010060 */ stfd f0, 0x60(r1)
/* 0000A924 80810064 */ lwz r4, 0x64(r1)
/* 0000A928 5484C00E */ slwi r4, r4, 0x18
/* 0000A92C 648400FF */ oris r4, r4, 0xff
/* 0000A930 6084FFFF */ ori r4, r4, 0xffff
/* 0000A934 90810044 */ stw r4, 0x44(r1)
/* 0000A938 90010048 */ stw r0, 0x48(r1)
/* 0000A93C 4BFF584D */ bl draw_naomi_sprite
/* 0000A940 8001006C */ lwz r0, 0x6c(r1)
/* 0000A944 38210068 */ addi r1, r1, 0x68
/* 0000A948 7C0803A6 */ mtlr r0
/* 0000A94C 4E800020 */ blr 
glabel lbl_0000A950
/* 0000A950 7C0802A6 */ mflr r0
/* 0000A954 3C800000 */ lis r4, lbl_00012730@ha
/* 0000A958 90010004 */ stw r0, 4(r1)
/* 0000A95C 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000A960 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000A964 93E1001C */ stw r31, 0x1c(r1)
/* 0000A968 3BE30000 */ addi r31, r3, lbl_00011CB0@l
/* 0000A96C 93C10018 */ stw r30, 0x18(r1)
/* 0000A970 3BC40000 */ addi r30, r4, lbl_00012730@l
/* 0000A974 4BFF5815 */ bl create_sprite
/* 0000A978 7C651B79 */ or. r5, r3, r3
/* 0000A97C 41820050 */ beq lbl_0000A9CC
/* 0000A980 38000001 */ li r0, 1
/* 0000A984 4CC63182 */ crclr 6
/* 0000A988 98050000 */ stb r0, 0(r5)
/* 0000A98C 38600404 */ li r3, 0x404
/* 0000A990 38000004 */ li r0, 4
/* 0000A994 B065003C */ sth r3, 0x3c(r5)
/* 0000A998 3865008C */ addi r3, r5, 0x8c
/* 0000A99C 389E00E8 */ addi r4, r30, 0xe8
/* 0000A9A0 C01F0014 */ lfs f0, 0x14(r31)
/* 0000A9A4 D0050004 */ stfs f0, 4(r5)
/* 0000A9A8 C01F0018 */ lfs f0, 0x18(r31)
/* 0000A9AC D0050008 */ stfs f0, 8(r5)
/* 0000A9B0 C01F001C */ lfs f0, 0x1c(r31)
/* 0000A9B4 D005004C */ stfs f0, 0x4c(r5)
/* 0000A9B8 98050003 */ stb r0, 3(r5)
/* 0000A9BC 80050074 */ lwz r0, 0x74(r5)
/* 0000A9C0 64000004 */ oris r0, r0, 4
/* 0000A9C4 90050074 */ stw r0, 0x74(r5)
/* 0000A9C8 4BFF57C1 */ bl sprintf
lbl_0000A9CC:
/* 0000A9CC 4BFF57BD */ bl create_sprite
/* 0000A9D0 7C671B79 */ or. r7, r3, r3
/* 0000A9D4 41820058 */ beq lbl_0000AA2C
/* 0000A9D8 38000016 */ li r0, 0x16
/* 0000A9DC 9807000F */ stb r0, 0xf(r7)
/* 0000A9E0 380000B1 */ li r0, 0xb1
/* 0000A9E4 3C600000 */ lis r3, lbl_0000AFB0@ha
/* 0000A9E8 98070001 */ stb r0, 1(r7)
/* 0000A9EC 38C00004 */ li r6, 4
/* 0000A9F0 38A0040D */ li r5, 0x40d
/* 0000A9F4 C01F0014 */ lfs f0, 0x14(r31)
/* 0000A9F8 38030000 */ addi r0, r3, lbl_0000AFB0@l
/* 0000A9FC 3867008C */ addi r3, r7, 0x8c
/* 0000AA00 D0070004 */ stfs f0, 4(r7)
/* 0000AA04 389E00EC */ addi r4, r30, 0xec
/* 0000AA08 C01F0020 */ lfs f0, 0x20(r31)
/* 0000AA0C D0070008 */ stfs f0, 8(r7)
/* 0000AA10 98C70003 */ stb r6, 3(r7)
/* 0000AA14 B0A7003C */ sth r5, 0x3c(r7)
/* 0000AA18 80A70074 */ lwz r5, 0x74(r7)
/* 0000AA1C 64A50020 */ oris r5, r5, 0x20
/* 0000AA20 90A70074 */ stw r5, 0x74(r7)
/* 0000AA24 90070038 */ stw r0, 0x38(r7)
/* 0000AA28 4BFF5761 */ bl strcpy
lbl_0000AA2C:
/* 0000AA2C 4BFF575D */ bl create_sprite
/* 0000AA30 7C691B79 */ or. r9, r3, r3
/* 0000AA34 41820060 */ beq lbl_0000AA94
/* 0000AA38 38000017 */ li r0, 0x17
/* 0000AA3C 9809000F */ stb r0, 0xf(r9)
/* 0000AA40 380000B1 */ li r0, 0xb1
/* 0000AA44 3C800000 */ lis r4, lbl_0000B0FC@ha
/* 0000AA48 98090001 */ stb r0, 1(r9)
/* 0000AA4C 3C600000 */ lis r3, lbl_0000B1C0@ha
/* 0000AA50 39000004 */ li r8, 4
/* 0000AA54 C01E0028 */ lfs f0, 0x28(r30)
/* 0000AA58 38E00011 */ li r7, 0x11
/* 0000AA5C 38C0040C */ li r6, 0x40c
/* 0000AA60 D0090004 */ stfs f0, 4(r9)
/* 0000AA64 38A40000 */ addi r5, r4, lbl_0000B0FC@l
/* 0000AA68 38030000 */ addi r0, r3, lbl_0000B1C0@l
/* 0000AA6C C01E002C */ lfs f0, 0x2c(r30)
/* 0000AA70 3869008C */ addi r3, r9, 0x8c
/* 0000AA74 389E00F4 */ addi r4, r30, 0xf4
/* 0000AA78 D0090008 */ stfs f0, 8(r9)
/* 0000AA7C 99090003 */ stb r8, 3(r9)
/* 0000AA80 90E90048 */ stw r7, 0x48(r9)
/* 0000AA84 B0C9003C */ sth r6, 0x3c(r9)
/* 0000AA88 90A90034 */ stw r5, 0x34(r9)
/* 0000AA8C 90090038 */ stw r0, 0x38(r9)
/* 0000AA90 4BFF56F9 */ bl strcpy
lbl_0000AA94:
/* 0000AA94 4BFF56F5 */ bl create_sprite
/* 0000AA98 7C691B79 */ or. r9, r3, r3
/* 0000AA9C 41820060 */ beq lbl_0000AAFC
/* 0000AAA0 38000018 */ li r0, 0x18
/* 0000AAA4 9809000F */ stb r0, 0xf(r9)
/* 0000AAA8 380000B1 */ li r0, 0xb1
/* 0000AAAC 3C800000 */ lis r4, lbl_0000B0FC@ha
/* 0000AAB0 98090001 */ stb r0, 1(r9)
/* 0000AAB4 3C600000 */ lis r3, lbl_0000B920@ha
/* 0000AAB8 39000004 */ li r8, 4
/* 0000AABC C01E0040 */ lfs f0, 0x40(r30)
/* 0000AAC0 38E00000 */ li r7, 0
/* 0000AAC4 38C00416 */ li r6, 0x416
/* 0000AAC8 D0090004 */ stfs f0, 4(r9)
/* 0000AACC 38A40000 */ addi r5, r4, lbl_0000B0FC@l
/* 0000AAD0 38030000 */ addi r0, r3, lbl_0000B920@l
/* 0000AAD4 C01E0044 */ lfs f0, 0x44(r30)
/* 0000AAD8 3869008C */ addi r3, r9, 0x8c
/* 0000AADC 389E00F8 */ addi r4, r30, 0xf8
/* 0000AAE0 D0090008 */ stfs f0, 8(r9)
/* 0000AAE4 99090003 */ stb r8, 3(r9)
/* 0000AAE8 90E90048 */ stw r7, 0x48(r9)
/* 0000AAEC B0C9003C */ sth r6, 0x3c(r9)
/* 0000AAF0 90A90034 */ stw r5, 0x34(r9)
/* 0000AAF4 90090038 */ stw r0, 0x38(r9)
/* 0000AAF8 4BFF5691 */ bl strcpy
lbl_0000AAFC:
/* 0000AAFC 4BFF568D */ bl create_sprite
/* 0000AB00 7C691B79 */ or. r9, r3, r3
/* 0000AB04 41820060 */ beq lbl_0000AB64
/* 0000AB08 38000019 */ li r0, 0x19
/* 0000AB0C 9809000F */ stb r0, 0xf(r9)
/* 0000AB10 38000036 */ li r0, 0x36
/* 0000AB14 3C800000 */ lis r4, lbl_0000B0FC@ha
/* 0000AB18 98090001 */ stb r0, 1(r9)
/* 0000AB1C 3C600000 */ lis r3, lbl_0000BEE8@ha
/* 0000AB20 39000004 */ li r8, 4
/* 0000AB24 C01E0050 */ lfs f0, 0x50(r30)
/* 0000AB28 38E00000 */ li r7, 0
/* 0000AB2C 38C00417 */ li r6, 0x417
/* 0000AB30 D0090004 */ stfs f0, 4(r9)
/* 0000AB34 38A40000 */ addi r5, r4, lbl_0000B0FC@l
/* 0000AB38 38030000 */ addi r0, r3, lbl_0000BEE8@l
/* 0000AB3C C01E0054 */ lfs f0, 0x54(r30)
/* 0000AB40 3869008C */ addi r3, r9, 0x8c
/* 0000AB44 389E0100 */ addi r4, r30, 0x100
/* 0000AB48 D0090008 */ stfs f0, 8(r9)
/* 0000AB4C 99090003 */ stb r8, 3(r9)
/* 0000AB50 90E90048 */ stw r7, 0x48(r9)
/* 0000AB54 B0C9003C */ sth r6, 0x3c(r9)
/* 0000AB58 90A90034 */ stw r5, 0x34(r9)
/* 0000AB5C 90090038 */ stw r0, 0x38(r9)
/* 0000AB60 4BFF5629 */ bl strcpy
lbl_0000AB64:
/* 0000AB64 4BFF5625 */ bl create_sprite
/* 0000AB68 7C691B79 */ or. r9, r3, r3
/* 0000AB6C 41820060 */ beq lbl_0000ABCC
/* 0000AB70 3800001A */ li r0, 0x1a
/* 0000AB74 9809000F */ stb r0, 0xf(r9)
/* 0000AB78 380000B1 */ li r0, 0xb1
/* 0000AB7C 3C800000 */ lis r4, lbl_0000B0FC@ha
/* 0000AB80 98090001 */ stb r0, 1(r9)
/* 0000AB84 3C600000 */ lis r3, lbl_0000C970@ha
/* 0000AB88 39000004 */ li r8, 4
/* 0000AB8C C01E0060 */ lfs f0, 0x60(r30)
/* 0000AB90 38E00000 */ li r7, 0
/* 0000AB94 38C00433 */ li r6, 0x433
/* 0000AB98 D0090004 */ stfs f0, 4(r9)
/* 0000AB9C 38A40000 */ addi r5, r4, lbl_0000B0FC@l
/* 0000ABA0 38030000 */ addi r0, r3, lbl_0000C970@l
/* 0000ABA4 C01E0064 */ lfs f0, 0x64(r30)
/* 0000ABA8 3869008C */ addi r3, r9, 0x8c
/* 0000ABAC 389E0108 */ addi r4, r30, 0x108
/* 0000ABB0 D0090008 */ stfs f0, 8(r9)
/* 0000ABB4 99090003 */ stb r8, 3(r9)
/* 0000ABB8 90E90048 */ stw r7, 0x48(r9)
/* 0000ABBC B0C9003C */ sth r6, 0x3c(r9)
/* 0000ABC0 90A90034 */ stw r5, 0x34(r9)
/* 0000ABC4 90090038 */ stw r0, 0x38(r9)
/* 0000ABC8 4BFF55C1 */ bl strcpy
lbl_0000ABCC:
/* 0000ABCC 4BFF55BD */ bl create_sprite
/* 0000ABD0 7C671B79 */ or. r7, r3, r3
/* 0000ABD4 418200EC */ beq lbl_0000ACC0
/* 0000ABD8 38000001 */ li r0, 1
/* 0000ABDC 98070000 */ stb r0, 0(r7)
/* 0000ABE0 3800001B */ li r0, 0x1b
/* 0000ABE4 3C600000 */ lis r3, modeCtrl@ha
/* 0000ABE8 9807000F */ stb r0, 0xf(r7)
/* 0000ABEC 38630000 */ addi r3, r3, modeCtrl@l
/* 0000ABF0 38830028 */ addi r4, r3, 0x28
/* 0000ABF4 C01E0068 */ lfs f0, 0x68(r30)
/* 0000ABF8 D0070004 */ stfs f0, 4(r7)
/* 0000ABFC 80030028 */ lwz r0, 0x28(r3)
/* 0000AC00 2C000002 */ cmpwi r0, 2
/* 0000AC04 4082000C */ bne lbl_0000AC10
/* 0000AC08 38000018 */ li r0, 0x18
/* 0000AC0C 48000008 */ b lbl_0000AC14
lbl_0000AC10:
/* 0000AC10 38000000 */ li r0, 0
lbl_0000AC14:
/* 0000AC14 6C008000 */ xoris r0, r0, 0x8000
/* 0000AC18 C05E006C */ lfs f2, 0x6c(r30)
/* 0000AC1C 90010014 */ stw r0, 0x14(r1)
/* 0000AC20 3C004330 */ lis r0, 0x4330
/* 0000AC24 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000AC28 90010010 */ stw r0, 0x10(r1)
/* 0000AC2C 38000000 */ li r0, 0
/* 0000AC30 C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000AC34 38600004 */ li r3, 4
/* 0000AC38 C8010010 */ lfd f0, 0x10(r1)
/* 0000AC3C EC000828 */ fsubs f0, f0, f1
/* 0000AC40 EC02002A */ fadds f0, f2, f0
/* 0000AC44 D0070008 */ stfs f0, 8(r7)
/* 0000AC48 98670003 */ stb r3, 3(r7)
/* 0000AC4C 90070048 */ stw r0, 0x48(r7)
/* 0000AC50 C01F000C */ lfs f0, 0xc(r31)
/* 0000AC54 D0070040 */ stfs f0, 0x40(r7)
/* 0000AC58 80040000 */ lwz r0, 0(r4)
/* 0000AC5C 2C000002 */ cmpwi r0, 2
/* 0000AC60 4082000C */ bne lbl_0000AC6C
/* 0000AC64 C81F0028 */ lfd f0, 0x28(r31)
/* 0000AC68 48000008 */ b lbl_0000AC70
lbl_0000AC6C:
/* 0000AC6C C81F0030 */ lfd f0, 0x30(r31)
lbl_0000AC70:
/* 0000AC70 FC000018 */ frsp f0, f0
/* 0000AC74 3C800000 */ lis r4, lbl_0000D39C@ha
/* 0000AC78 3C600000 */ lis r3, lbl_0000D5A8@ha
/* 0000AC7C 38000009 */ li r0, 9
/* 0000AC80 D0070044 */ stfs f0, 0x44(r7)
/* 0000AC84 38C00429 */ li r6, 0x429
/* 0000AC88 B0070010 */ sth r0, 0x10(r7)
/* 0000AC8C 38A40000 */ addi r5, r4, lbl_0000D39C@l
/* 0000AC90 38030000 */ addi r0, r3, lbl_0000D5A8@l
/* 0000AC94 B0C7003C */ sth r6, 0x3c(r7)
/* 0000AC98 3867008C */ addi r3, r7, 0x8c
/* 0000AC9C 389E0110 */ addi r4, r30, 0x110
/* 0000ACA0 C01F0038 */ lfs f0, 0x38(r31)
/* 0000ACA4 D007004C */ stfs f0, 0x4c(r7)
/* 0000ACA8 80C70074 */ lwz r6, 0x74(r7)
/* 0000ACAC 64C60004 */ oris r6, r6, 4
/* 0000ACB0 90C70074 */ stw r6, 0x74(r7)
/* 0000ACB4 90A70034 */ stw r5, 0x34(r7)
/* 0000ACB8 90070038 */ stw r0, 0x38(r7)
/* 0000ACBC 4BFF54CD */ bl strcpy
lbl_0000ACC0:
/* 0000ACC0 4BFF54C9 */ bl create_sprite
/* 0000ACC4 7C671B79 */ or. r7, r3, r3
/* 0000ACC8 41820060 */ beq lbl_0000AD28
/* 0000ACCC 380000B1 */ li r0, 0xb1
/* 0000ACD0 98070001 */ stb r0, 1(r7)
/* 0000ACD4 38000004 */ li r0, 4
/* 0000ACD8 3C800000 */ lis r4, lbl_0000E368@ha
/* 0000ACDC 98070003 */ stb r0, 3(r7)
/* 0000ACE0 3C600000 */ lis r3, lbl_0000E540@ha
/* 0000ACE4 38C00000 */ li r6, 0
/* 0000ACE8 C01F003C */ lfs f0, 0x3c(r31)
/* 0000ACEC 38A40000 */ addi r5, r4, lbl_0000E368@l
/* 0000ACF0 38030000 */ addi r0, r3, lbl_0000E540@l
/* 0000ACF4 D007004C */ stfs f0, 0x4c(r7)
/* 0000ACF8 3867008C */ addi r3, r7, 0x8c
/* 0000ACFC 389E011C */ addi r4, r30, 0x11c
/* 0000AD00 C01F0040 */ lfs f0, 0x40(r31)
/* 0000AD04 D0070040 */ stfs f0, 0x40(r7)
/* 0000AD08 C01F0040 */ lfs f0, 0x40(r31)
/* 0000AD0C D0070044 */ stfs f0, 0x44(r7)
/* 0000AD10 C01F0044 */ lfs f0, 0x44(r31)
/* 0000AD14 D007004C */ stfs f0, 0x4c(r7)
/* 0000AD18 90C70048 */ stw r6, 0x48(r7)
/* 0000AD1C 90A70034 */ stw r5, 0x34(r7)
/* 0000AD20 90070038 */ stw r0, 0x38(r7)
/* 0000AD24 4BFF5465 */ bl strcpy
lbl_0000AD28:
/* 0000AD28 4BFF5461 */ bl create_sprite
/* 0000AD2C 7C691B79 */ or. r9, r3, r3
/* 0000AD30 41820060 */ beq lbl_0000AD90
/* 0000AD34 38000001 */ li r0, 1
/* 0000AD38 98090000 */ stb r0, 0(r9)
/* 0000AD3C 3800001C */ li r0, 0x1c
/* 0000AD40 3C800000 */ lis r4, lbl_0000D7C0@ha
/* 0000AD44 9809000F */ stb r0, 0xf(r9)
/* 0000AD48 3C600000 */ lis r3, lbl_0000D82C@ha
/* 0000AD4C 39000004 */ li r8, 4
/* 0000AD50 C01E0088 */ lfs f0, 0x88(r30)
/* 0000AD54 38E00000 */ li r7, 0
/* 0000AD58 38C0042A */ li r6, 0x42a
/* 0000AD5C D0090004 */ stfs f0, 4(r9)
/* 0000AD60 38A40000 */ addi r5, r4, lbl_0000D7C0@l
/* 0000AD64 38030000 */ addi r0, r3, lbl_0000D82C@l
/* 0000AD68 C01E008C */ lfs f0, 0x8c(r30)
/* 0000AD6C 3869008C */ addi r3, r9, 0x8c
/* 0000AD70 389E012C */ addi r4, r30, 0x12c
/* 0000AD74 D0090008 */ stfs f0, 8(r9)
/* 0000AD78 99090003 */ stb r8, 3(r9)
/* 0000AD7C 90E90048 */ stw r7, 0x48(r9)
/* 0000AD80 B0C9003C */ sth r6, 0x3c(r9)
/* 0000AD84 90A90034 */ stw r5, 0x34(r9)
/* 0000AD88 90090038 */ stw r0, 0x38(r9)
/* 0000AD8C 4BFF53FD */ bl strcpy
lbl_0000AD90:
/* 0000AD90 4BFF53F9 */ bl create_sprite
/* 0000AD94 7C691B79 */ or. r9, r3, r3
/* 0000AD98 41820074 */ beq lbl_0000AE0C
/* 0000AD9C 38000001 */ li r0, 1
/* 0000ADA0 98090000 */ stb r0, 0(r9)
/* 0000ADA4 38000021 */ li r0, 0x21
/* 0000ADA8 3C800000 */ lis r4, lbl_0000DCA4@ha
/* 0000ADAC 9809000F */ stb r0, 0xf(r9)
/* 0000ADB0 3C600000 */ lis r3, lbl_0000DDF4@ha
/* 0000ADB4 39000004 */ li r8, 4
/* 0000ADB8 C01E00A8 */ lfs f0, 0xa8(r30)
/* 0000ADBC 38E00000 */ li r7, 0
/* 0000ADC0 38C00406 */ li r6, 0x406
/* 0000ADC4 D0090004 */ stfs f0, 4(r9)
/* 0000ADC8 38A40000 */ addi r5, r4, lbl_0000DCA4@l
/* 0000ADCC 38030000 */ addi r0, r3, lbl_0000DDF4@l
/* 0000ADD0 C01E00AC */ lfs f0, 0xac(r30)
/* 0000ADD4 3869008C */ addi r3, r9, 0x8c
/* 0000ADD8 389E0138 */ addi r4, r30, 0x138
/* 0000ADDC D0090008 */ stfs f0, 8(r9)
/* 0000ADE0 99090003 */ stb r8, 3(r9)
/* 0000ADE4 90E90048 */ stw r7, 0x48(r9)
/* 0000ADE8 B0C9003C */ sth r6, 0x3c(r9)
/* 0000ADEC C01F0038 */ lfs f0, 0x38(r31)
/* 0000ADF0 D009004C */ stfs f0, 0x4c(r9)
/* 0000ADF4 80C90074 */ lwz r6, 0x74(r9)
/* 0000ADF8 64C60004 */ oris r6, r6, 4
/* 0000ADFC 90C90074 */ stw r6, 0x74(r9)
/* 0000AE00 90A90034 */ stw r5, 0x34(r9)
/* 0000AE04 90090038 */ stw r0, 0x38(r9)
/* 0000AE08 4BFF5381 */ bl strcpy
lbl_0000AE0C:
/* 0000AE0C 4BFF537D */ bl create_sprite
/* 0000AE10 7C671B79 */ or. r7, r3, r3
/* 0000AE14 41820058 */ beq lbl_0000AE6C
/* 0000AE18 380000B1 */ li r0, 0xb1
/* 0000AE1C 98070001 */ stb r0, 1(r7)
/* 0000AE20 38000004 */ li r0, 4
/* 0000AE24 3C800000 */ lis r4, lbl_0000E43C@ha
/* 0000AE28 98070003 */ stb r0, 3(r7)
/* 0000AE2C 3C600000 */ lis r3, lbl_0000E540@ha
/* 0000AE30 38C00000 */ li r6, 0
/* 0000AE34 C01F0040 */ lfs f0, 0x40(r31)
/* 0000AE38 38A40000 */ addi r5, r4, lbl_0000E43C@l
/* 0000AE3C 38030000 */ addi r0, r3, lbl_0000E540@l
/* 0000AE40 D0070040 */ stfs f0, 0x40(r7)
/* 0000AE44 3867008C */ addi r3, r7, 0x8c
/* 0000AE48 389E0144 */ addi r4, r30, 0x144
/* 0000AE4C C01F0040 */ lfs f0, 0x40(r31)
/* 0000AE50 D0070044 */ stfs f0, 0x44(r7)
/* 0000AE54 C01F0044 */ lfs f0, 0x44(r31)
/* 0000AE58 D007004C */ stfs f0, 0x4c(r7)
/* 0000AE5C 90C70048 */ stw r6, 0x48(r7)
/* 0000AE60 90A70034 */ stw r5, 0x34(r7)
/* 0000AE64 90070038 */ stw r0, 0x38(r7)
/* 0000AE68 4BFF5321 */ bl strcpy
lbl_0000AE6C:
/* 0000AE6C 4BFF531D */ bl create_sprite
/* 0000AE70 7C671B79 */ or. r7, r3, r3
/* 0000AE74 41820040 */ beq lbl_0000AEB4
/* 0000AE78 38000004 */ li r0, 4
/* 0000AE7C 98070003 */ stb r0, 3(r7)
/* 0000AE80 3C800000 */ lis r4, lbl_0000E43C@ha
/* 0000AE84 3C600000 */ lis r3, lbl_0000E620@ha
/* 0000AE88 C01F0044 */ lfs f0, 0x44(r31)
/* 0000AE8C 38C00000 */ li r6, 0
/* 0000AE90 38A40000 */ addi r5, r4, lbl_0000E43C@l
/* 0000AE94 D007004C */ stfs f0, 0x4c(r7)
/* 0000AE98 38030000 */ addi r0, r3, lbl_0000E620@l
/* 0000AE9C 3867008C */ addi r3, r7, 0x8c
/* 0000AEA0 90C70048 */ stw r6, 0x48(r7)
/* 0000AEA4 389E0154 */ addi r4, r30, 0x154
/* 0000AEA8 90A70034 */ stw r5, 0x34(r7)
/* 0000AEAC 90070038 */ stw r0, 0x38(r7)
/* 0000AEB0 4BFF52D9 */ bl strcpy
lbl_0000AEB4:
/* 0000AEB4 4BFF52D5 */ bl create_sprite
/* 0000AEB8 7C691B79 */ or. r9, r3, r3
/* 0000AEBC 41820074 */ beq lbl_0000AF30
/* 0000AEC0 38000001 */ li r0, 1
/* 0000AEC4 98090000 */ stb r0, 0(r9)
/* 0000AEC8 38000022 */ li r0, 0x22
/* 0000AECC 3C800000 */ lis r4, lbl_0000DEC8@ha
/* 0000AED0 9809000F */ stb r0, 0xf(r9)
/* 0000AED4 3C600000 */ lis r3, lbl_0000E068@ha
/* 0000AED8 39000004 */ li r8, 4
/* 0000AEDC C01E00C8 */ lfs f0, 0xc8(r30)
/* 0000AEE0 38E00000 */ li r7, 0
/* 0000AEE4 38C00409 */ li r6, 0x409
/* 0000AEE8 D0090004 */ stfs f0, 4(r9)
/* 0000AEEC 38A40000 */ addi r5, r4, lbl_0000DEC8@l
/* 0000AEF0 38030000 */ addi r0, r3, lbl_0000E068@l
/* 0000AEF4 C01E00CC */ lfs f0, 0xcc(r30)
/* 0000AEF8 3869008C */ addi r3, r9, 0x8c
/* 0000AEFC 389E0168 */ addi r4, r30, 0x168
/* 0000AF00 D0090008 */ stfs f0, 8(r9)
/* 0000AF04 99090003 */ stb r8, 3(r9)
/* 0000AF08 90E90048 */ stw r7, 0x48(r9)
/* 0000AF0C B0C9003C */ sth r6, 0x3c(r9)
/* 0000AF10 C01F0038 */ lfs f0, 0x38(r31)
/* 0000AF14 D009004C */ stfs f0, 0x4c(r9)
/* 0000AF18 80C90074 */ lwz r6, 0x74(r9)
/* 0000AF1C 64C60004 */ oris r6, r6, 4
/* 0000AF20 90C90074 */ stw r6, 0x74(r9)
/* 0000AF24 90A90034 */ stw r5, 0x34(r9)
/* 0000AF28 90090038 */ stw r0, 0x38(r9)
/* 0000AF2C 4BFF525D */ bl strcpy
lbl_0000AF30:
/* 0000AF30 4BFF5259 */ bl create_sprite
/* 0000AF34 7C671B79 */ or. r7, r3, r3
/* 0000AF38 41820060 */ beq lbl_0000AF98
/* 0000AF3C 380000B1 */ li r0, 0xb1
/* 0000AF40 98070001 */ stb r0, 1(r7)
/* 0000AF44 38000004 */ li r0, 4
/* 0000AF48 3C800000 */ lis r4, lbl_0000E4BC@ha
/* 0000AF4C 98070003 */ stb r0, 3(r7)
/* 0000AF50 3C600000 */ lis r3, lbl_0000E778@ha
/* 0000AF54 38C00000 */ li r6, 0
/* 0000AF58 C01F003C */ lfs f0, 0x3c(r31)
/* 0000AF5C 38A40000 */ addi r5, r4, lbl_0000E4BC@l
/* 0000AF60 38030000 */ addi r0, r3, lbl_0000E778@l
/* 0000AF64 D007004C */ stfs f0, 0x4c(r7)
/* 0000AF68 3867008C */ addi r3, r7, 0x8c
/* 0000AF6C 389E0178 */ addi r4, r30, 0x178
/* 0000AF70 C01F0048 */ lfs f0, 0x48(r31)
/* 0000AF74 D0070040 */ stfs f0, 0x40(r7)
/* 0000AF78 C01F0048 */ lfs f0, 0x48(r31)
/* 0000AF7C D0070044 */ stfs f0, 0x44(r7)
/* 0000AF80 C01F0044 */ lfs f0, 0x44(r31)
/* 0000AF84 D007004C */ stfs f0, 0x4c(r7)
/* 0000AF88 90C70048 */ stw r6, 0x48(r7)
/* 0000AF8C 90A70034 */ stw r5, 0x34(r7)
/* 0000AF90 90070038 */ stw r0, 0x38(r7)
/* 0000AF94 4BFF51F5 */ bl strcpy
lbl_0000AF98:
/* 0000AF98 80010024 */ lwz r0, 0x24(r1)
/* 0000AF9C 83E1001C */ lwz r31, 0x1c(r1)
/* 0000AFA0 83C10018 */ lwz r30, 0x18(r1)
/* 0000AFA4 7C0803A6 */ mtlr r0
/* 0000AFA8 38210020 */ addi r1, r1, 0x20
/* 0000AFAC 4E800020 */ blr 
lbl_0000AFB0:
/* 0000AFB0 7C0802A6 */ mflr r0
/* 0000AFB4 90010004 */ stw r0, 4(r1)
/* 0000AFB8 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000AFBC 93E10034 */ stw r31, 0x34(r1)
/* 0000AFC0 7C7F1B78 */ mr r31, r3
/* 0000AFC4 93C10030 */ stw r30, 0x30(r1)
/* 0000AFC8 4BFFF8A9 */ bl lbl_0000A870
/* 0000AFCC 4BFF51BD */ bl reset_text_draw_settings
/* 0000AFD0 887F0001 */ lbz r3, 1(r31)
/* 0000AFD4 4BFF51B5 */ bl set_text_font
/* 0000AFD8 807F0074 */ lwz r3, 0x74(r31)
/* 0000AFDC 4BFF51AD */ bl func_80071B50
/* 0000AFE0 809F0048 */ lwz r4, 0x48(r31)
/* 0000AFE4 3C600000 */ lis r3, lbl_00012970@ha
/* 0000AFE8 38030000 */ addi r0, r3, lbl_00012970@l
/* 0000AFEC 5483103A */ slwi r3, r4, 2
/* 0000AFF0 7C601A14 */ add r3, r0, r3
/* 0000AFF4 80830000 */ lwz r4, 0(r3)
/* 0000AFF8 387F008C */ addi r3, r31, 0x8c
/* 0000AFFC 4BFF518D */ bl strcpy
/* 0000B000 83DF0038 */ lwz r30, 0x38(r31)
/* 0000B004 38000000 */ li r0, 0
/* 0000B008 387F0000 */ addi r3, r31, 0
/* 0000B00C 901F0038 */ stw r0, 0x38(r31)
/* 0000B010 389F0058 */ addi r4, r31, 0x58
/* 0000B014 38BF005C */ addi r5, r31, 0x5c
/* 0000B018 38DF0060 */ addi r6, r31, 0x60
/* 0000B01C 38FF0064 */ addi r7, r31, 0x64
/* 0000B020 4BFF5169 */ bl calc_sprite_bounds
/* 0000B024 3C600020 */ lis r3, 0x20
/* 0000B028 93DF0038 */ stw r30, 0x38(r31)
/* 0000B02C 38632000 */ addi r3, r3, 0x2000
/* 0000B030 4BFF5159 */ bl set_text_mul_color
/* 0000B034 80DF0058 */ lwz r6, 0x58(r31)
/* 0000B038 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000B03C 809F005C */ lwz r4, 0x5c(r31)
/* 0000B040 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B044 38C60003 */ addi r6, r6, 3
/* 0000B048 38040003 */ addi r0, r4, 3
/* 0000B04C C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000B050 6CC48000 */ xoris r4, r6, 0x8000
/* 0000B054 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B058 6C008000 */ xoris r0, r0, 0x8000
/* 0000B05C 9081002C */ stw r4, 0x2c(r1)
/* 0000B060 3FC04330 */ lis r30, 0x4330
/* 0000B064 90010024 */ stw r0, 0x24(r1)
/* 0000B068 93C10028 */ stw r30, 0x28(r1)
/* 0000B06C 93C10020 */ stw r30, 0x20(r1)
/* 0000B070 C8210028 */ lfd f1, 0x28(r1)
/* 0000B074 C8010020 */ lfd f0, 0x20(r1)
/* 0000B078 EC211828 */ fsubs f1, f1, f3
/* 0000B07C EC401028 */ fsubs f2, f0, f2
/* 0000B080 4BFF5109 */ bl set_text_pos
/* 0000B084 387F008C */ addi r3, r31, 0x8c
/* 0000B088 4BFF5101 */ bl u_draw_text
/* 0000B08C 3C600100 */ lis r3, 0x100
/* 0000B090 3863FF00 */ addi r3, r3, -256  ;# fixed addi
/* 0000B094 4BFF50F5 */ bl set_text_mul_color
/* 0000B098 809F0058 */ lwz r4, 0x58(r31)
/* 0000B09C 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000B0A0 801F005C */ lwz r0, 0x5c(r31)
/* 0000B0A4 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B0A8 6C848000 */ xoris r4, r4, 0x8000
/* 0000B0AC 6C008000 */ xoris r0, r0, 0x8000
/* 0000B0B0 9081001C */ stw r4, 0x1c(r1)
/* 0000B0B4 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000B0B8 90010014 */ stw r0, 0x14(r1)
/* 0000B0BC C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B0C0 93C10018 */ stw r30, 0x18(r1)
/* 0000B0C4 93C10010 */ stw r30, 0x10(r1)
/* 0000B0C8 C8210018 */ lfd f1, 0x18(r1)
/* 0000B0CC C8010010 */ lfd f0, 0x10(r1)
/* 0000B0D0 EC211828 */ fsubs f1, f1, f3
/* 0000B0D4 EC401028 */ fsubs f2, f0, f2
/* 0000B0D8 4BFF50B1 */ bl set_text_pos
/* 0000B0DC 387F008C */ addi r3, r31, 0x8c
/* 0000B0E0 4BFF50A9 */ bl u_draw_text
/* 0000B0E4 8001003C */ lwz r0, 0x3c(r1)
/* 0000B0E8 83E10034 */ lwz r31, 0x34(r1)
/* 0000B0EC 83C10030 */ lwz r30, 0x30(r1)
/* 0000B0F0 7C0803A6 */ mtlr r0
/* 0000B0F4 38210038 */ addi r1, r1, 0x38
/* 0000B0F8 4E800020 */ blr 
lbl_0000B0FC:
/* 0000B0FC 80040048 */ lwz r0, 0x48(r4)
/* 0000B100 3CC00000 */ lis r6, lbl_00012730@ha
/* 0000B104 8864000F */ lbz r3, 0xf(r4)
/* 0000B108 3CA00000 */ lis r5, lbl_00011CB0@ha
/* 0000B10C 2C000000 */ cmpwi r0, 0
/* 0000B110 7C630774 */ extsb r3, r3
/* 0000B114 38060000 */ addi r0, r6, lbl_00012730@l
/* 0000B118 38A50000 */ addi r5, r5, lbl_00011CB0@l
/* 0000B11C 3863FFE9 */ addi r3, r3, -23  ;# fixed addi
/* 0000B120 41820008 */ beq lbl_0000B128
/* 0000B124 48000050 */ b lbl_0000B174
lbl_0000B128:
/* 0000B128 54632036 */ slwi r3, r3, 4
/* 0000B12C C0440004 */ lfs f2, 4(r4)
/* 0000B130 7C601A14 */ add r3, r0, r3
/* 0000B134 C8250058 */ lfd f1, 0x58(r5)
/* 0000B138 C0030030 */ lfs f0, 0x30(r3)
/* 0000B13C EC001028 */ fsubs f0, f0, f2
/* 0000B140 FC010032 */ fmul f0, f1, f0
/* 0000B144 FC02002A */ fadd f0, f2, f0
/* 0000B148 FC000018 */ frsp f0, f0
/* 0000B14C D0040004 */ stfs f0, 4(r4)
/* 0000B150 C0440008 */ lfs f2, 8(r4)
/* 0000B154 C0030034 */ lfs f0, 0x34(r3)
/* 0000B158 C8250058 */ lfd f1, 0x58(r5)
/* 0000B15C EC001028 */ fsubs f0, f0, f2
/* 0000B160 FC010032 */ fmul f0, f1, f0
/* 0000B164 FC02002A */ fadd f0, f2, f0
/* 0000B168 FC000018 */ frsp f0, f0
/* 0000B16C D0040008 */ stfs f0, 8(r4)
/* 0000B170 4E800020 */ blr 
lbl_0000B174:
/* 0000B174 54632036 */ slwi r3, r3, 4
/* 0000B178 C0440004 */ lfs f2, 4(r4)
/* 0000B17C 7C601A14 */ add r3, r0, r3
/* 0000B180 C8250058 */ lfd f1, 0x58(r5)
/* 0000B184 C0030028 */ lfs f0, 0x28(r3)
/* 0000B188 EC001028 */ fsubs f0, f0, f2
/* 0000B18C FC010032 */ fmul f0, f1, f0
/* 0000B190 FC02002A */ fadd f0, f2, f0
/* 0000B194 FC000018 */ frsp f0, f0
/* 0000B198 D0040004 */ stfs f0, 4(r4)
/* 0000B19C C0440008 */ lfs f2, 8(r4)
/* 0000B1A0 C003002C */ lfs f0, 0x2c(r3)
/* 0000B1A4 C8250058 */ lfd f1, 0x58(r5)
/* 0000B1A8 EC001028 */ fsubs f0, f0, f2
/* 0000B1AC FC010032 */ fmul f0, f1, f0
/* 0000B1B0 FC02002A */ fadd f0, f2, f0
/* 0000B1B4 FC000018 */ frsp f0, f0
/* 0000B1B8 D0040008 */ stfs f0, 8(r4)
/* 0000B1BC 4E800020 */ blr 
lbl_0000B1C0:
/* 0000B1C0 7C0802A6 */ mflr r0
/* 0000B1C4 3C800000 */ lis r4, lbl_00012730@ha
/* 0000B1C8 90010004 */ stw r0, 4(r1)
/* 0000B1CC 38000000 */ li r0, 0
/* 0000B1D0 9421FF68 */ stwu r1, -0x98(r1)
/* 0000B1D4 DBE10090 */ stfd f31, 0x90(r1)
/* 0000B1D8 DBC10088 */ stfd f30, 0x88(r1)
/* 0000B1DC DBA10080 */ stfd f29, 0x80(r1)
/* 0000B1E0 BDC10038 */ stmw r14, 0x38(r1)
/* 0000B1E4 3A840000 */ addi r20, r4, lbl_00012730@l
/* 0000B1E8 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000B1EC 9001000C */ stw r0, 0xc(r1)
/* 0000B1F0 3BE30000 */ addi r31, r3, 0
/* 0000B1F4 3BC40000 */ addi r30, r4, lbl_00011CB0@l
/* 0000B1F8 39C00001 */ li r14, 1
/* 0000B1FC 4BFFF675 */ bl lbl_0000A870
/* 0000B200 3A3432CC */ addi r17, r20, 0x32cc
/* 0000B204 801F0048 */ lwz r0, 0x48(r31)
/* 0000B208 807432CC */ lwz r3, 0x32cc(r20)
/* 0000B20C 5400103A */ slwi r0, r0, 2
/* 0000B210 7C03002E */ lwzx r0, r3, r0
/* 0000B214 28000000 */ cmplwi r0, 0
/* 0000B218 418206E8 */ beq lbl_0000B900
/* 0000B21C 4BFF4F6D */ bl reset_text_draw_settings
/* 0000B220 887F0001 */ lbz r3, 1(r31)
/* 0000B224 4BFF4F65 */ bl set_text_font
/* 0000B228 3C600022 */ lis r3, 0x22
/* 0000B22C 4BFF4F5D */ bl func_80071B50
/* 0000B230 801F0048 */ lwz r0, 0x48(r31)
/* 0000B234 3A600000 */ li r19, 0
/* 0000B238 80710000 */ lwz r3, 0(r17)
/* 0000B23C 5400103A */ slwi r0, r0, 2
/* 0000B240 7C63002E */ lwzx r3, r3, r0
/* 0000B244 4800000C */ b lbl_0000B250
lbl_0000B248:
/* 0000B248 3A730001 */ addi r19, r19, 1
/* 0000B24C 38630004 */ addi r3, r3, 4
lbl_0000B250:
/* 0000B250 80030000 */ lwz r0, 0(r3)
/* 0000B254 28000000 */ cmplwi r0, 0
/* 0000B258 4082FFF0 */ bne lbl_0000B248
/* 0000B25C 3813FFFF */ addi r0, r19, -1  ;# fixed addi
/* 0000B260 C87E0060 */ lfd f3, 0x60(r30)
/* 0000B264 1C000018 */ mulli r0, r0, 0x18
/* 0000B268 C01E0040 */ lfs f0, 0x40(r30)
/* 0000B26C 6C008000 */ xoris r0, r0, 0x8000
/* 0000B270 90010034 */ stw r0, 0x34(r1)
/* 0000B274 55C0103A */ slwi r0, r14, 2
/* 0000B278 3FA04330 */ lis r29, 0x4330
/* 0000B27C 93A10030 */ stw r29, 0x30(r1)
/* 0000B280 3B800000 */ li r28, 0
/* 0000B284 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B288 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B28C 7EB40214 */ add r21, r20, r0
/* 0000B290 C8210030 */ lfd f1, 0x30(r1)
/* 0000B294 7ED40214 */ add r22, r20, r0
/* 0000B298 7DF40214 */ add r15, r20, r0
/* 0000B29C EC211028 */ fsubs f1, f1, f2
/* 0000B2A0 D01F0040 */ stfs f0, 0x40(r31)
/* 0000B2A4 3C800000 */ lis r4, lbl_801EED88@ha
/* 0000B2A8 C01E000C */ lfs f0, 0xc(r30)
/* 0000B2AC 1C130006 */ mulli r0, r19, 6
/* 0000B2B0 FC230072 */ fmul f1, f3, f1
/* 0000B2B4 D01F0044 */ stfs f0, 0x44(r31)
/* 0000B2B8 3C600000 */ lis r3, playerCharacterSelection@ha
/* 0000B2BC 3A3C0000 */ addi r17, r28, 0
/* 0000B2C0 3A5C0000 */ addi r18, r28, 0
/* 0000B2C4 FC00081E */ fctiwz f0, f1
/* 0000B2C8 5798103A */ slwi r24, r28, 2
/* 0000B2CC 3B440000 */ addi r26, r4, lbl_801EED88@l
/* 0000B2D0 3F600100 */ lis r27, 0x100
/* 0000B2D4 D8010028 */ stfd f0, 0x28(r1)
/* 0000B2D8 3DC00004 */ lis r14, 4
/* 0000B2DC 8201002C */ lwz r16, 0x2c(r1)
/* 0000B2E0 3AB532C8 */ addi r21, r21, 0x32c8
/* 0000B2E4 3AD6378C */ addi r22, r22, 0x378c
/* 0000B2E8 7E008050 */ subf r16, r0, r16
/* 0000B2EC 38030000 */ addi r0, r3, playerCharacterSelection@l
/* 0000B2F0 90010018 */ stw r0, 0x18(r1)
/* 0000B2F4 3C000067 */ lis r0, 0x67
/* 0000B2F8 39EF38D0 */ addi r15, r15, 0x38d0
/* 0000B2FC 90010010 */ stw r0, 0x10(r1)
/* 0000B300 3C0000FF */ lis r0, 0xff
/* 0000B304 90010014 */ stw r0, 0x14(r1)
/* 0000B308 3C000020 */ lis r0, 0x20
/* 0000B30C 9001001C */ stw r0, 0x1c(r1)
/* 0000B310 48000390 */ b lbl_0000B6A0
lbl_0000B314:
/* 0000B314 801F0048 */ lwz r0, 0x48(r31)
/* 0000B318 2C000029 */ cmpwi r0, 0x29
/* 0000B31C 40800010 */ bge lbl_0000B32C
/* 0000B320 2C00000E */ cmpwi r0, 0xe
/* 0000B324 418201F8 */ beq lbl_0000B51C
/* 0000B328 48000010 */ b lbl_0000B338
lbl_0000B32C:
/* 0000B32C 2C00002B */ cmpwi r0, 0x2b
/* 0000B330 40800008 */ bge lbl_0000B338
/* 0000B334 48000098 */ b lbl_0000B3CC
lbl_0000B338:
/* 0000B338 80950000 */ lwz r4, 0(r21)
/* 0000B33C 5400103A */ slwi r0, r0, 2
/* 0000B340 387F008C */ addi r3, r31, 0x8c
/* 0000B344 7C84002E */ lwzx r4, r4, r0
/* 0000B348 7C84C02E */ lwzx r4, r4, r24
/* 0000B34C 4BFF4E3D */ bl strcpy
/* 0000B350 887F0001 */ lbz r3, 1(r31)
/* 0000B354 3B3BFF00 */ addi r25, r27, -256  ;# fixed addi
/* 0000B358 389F008C */ addi r4, r31, 0x8c
/* 0000B35C 4BFF4E2D */ bl u_get_jpn_text_width
/* 0000B360 6C608000 */ xoris r0, r3, 0x8000
/* 0000B364 C81E0068 */ lfd f0, 0x68(r30)
/* 0000B368 9001002C */ stw r0, 0x2c(r1)
/* 0000B36C 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B370 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B374 93A10028 */ stw r29, 0x28(r1)
/* 0000B378 C07F0040 */ lfs f3, 0x40(r31)
/* 0000B37C C8210028 */ lfd f1, 0x28(r1)
/* 0000B380 FC211028 */ fsub f1, f1, f2
/* 0000B384 FC000824 */ fdiv f0, f0, f1
/* 0000B388 FC001840 */ fcmpo cr0, f0, f3
/* 0000B38C 40800034 */ bge lbl_0000B3C0
/* 0000B390 887F0001 */ lbz r3, 1(r31)
/* 0000B394 389F008C */ addi r4, r31, 0x8c
/* 0000B398 4BFF4DF1 */ bl u_get_jpn_text_width
/* 0000B39C 6C608000 */ xoris r0, r3, 0x8000
/* 0000B3A0 C81E0068 */ lfd f0, 0x68(r30)
/* 0000B3A4 9001002C */ stw r0, 0x2c(r1)
/* 0000B3A8 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B3AC C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B3B0 93A10028 */ stw r29, 0x28(r1)
/* 0000B3B4 C8210028 */ lfd f1, 0x28(r1)
/* 0000B3B8 FC211028 */ fsub f1, f1, f2
/* 0000B3BC FC600824 */ fdiv f3, f0, f1
lbl_0000B3C0:
/* 0000B3C0 FC001818 */ frsp f0, f3
/* 0000B3C4 D01F0040 */ stfs f0, 0x40(r31)
/* 0000B3C8 480001AC */ b lbl_0000B574
lbl_0000B3CC:
/* 0000B3CC 2C1C0000 */ cmpwi r28, 0
/* 0000B3D0 40820028 */ bne lbl_0000B3F8
/* 0000B3D4 881A0000 */ lbz r0, 0(r26)
/* 0000B3D8 387F008C */ addi r3, r31, 0x8c
/* 0000B3DC 80960000 */ lwz r4, 0(r22)
/* 0000B3E0 7C000774 */ extsb r0, r0
/* 0000B3E4 1C00000C */ mulli r0, r0, 0xc
/* 0000B3E8 7C84002E */ lwzx r4, r4, r0
/* 0000B3EC 4BFF4D9D */ bl strcpy
/* 0000B3F0 3B3B8000 */ addi r25, r27, -32768  ;# fixed addi
/* 0000B3F4 480000B0 */ b lbl_0000B4A4
lbl_0000B3F8:
/* 0000B3F8 2C1C0001 */ cmpwi r28, 1
/* 0000B3FC 4082008C */ bne lbl_0000B488
/* 0000B400 801A0008 */ lwz r0, 8(r26)
/* 0000B404 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000B408 41820028 */ beq lbl_0000B430
/* 0000B40C 881A0000 */ lbz r0, 0(r26)
/* 0000B410 387F008C */ addi r3, r31, 0x8c
/* 0000B414 80960000 */ lwz r4, 0(r22)
/* 0000B418 7C000774 */ extsb r0, r0
/* 0000B41C 1CA0000C */ mulli r5, r0, 0xc
/* 0000B420 38050008 */ addi r0, r5, 8
/* 0000B424 7C84002E */ lwzx r4, r4, r0
/* 0000B428 4BFF4D61 */ bl strcpy
/* 0000B42C 48000024 */ b lbl_0000B450
lbl_0000B430:
/* 0000B430 881A0000 */ lbz r0, 0(r26)
/* 0000B434 387F008C */ addi r3, r31, 0x8c
/* 0000B438 80960000 */ lwz r4, 0(r22)
/* 0000B43C 7C000774 */ extsb r0, r0
/* 0000B440 1CA0000C */ mulli r5, r0, 0xc
/* 0000B444 38050004 */ addi r0, r5, 4
/* 0000B448 7C84002E */ lwzx r4, r4, r0
/* 0000B44C 4BFF4D3D */ bl strcpy
lbl_0000B450:
/* 0000B450 881A0000 */ lbz r0, 0(r26)
/* 0000B454 7C000774 */ extsb r0, r0
/* 0000B458 2C000002 */ cmpwi r0, 2
/* 0000B45C 4080000C */ bge lbl_0000B468
/* 0000B460 3B2EC751 */ addi r25, r14, -14511  ;# fixed addi
/* 0000B464 48000040 */ b lbl_0000B4A4
lbl_0000B468:
/* 0000B468 2C000004 */ cmpwi r0, 4
/* 0000B46C 40800010 */ bge lbl_0000B47C
/* 0000B470 80610010 */ lwz r3, 0x10(r1)
/* 0000B474 3B23A8FF */ addi r25, r3, -22273  ;# fixed addi
/* 0000B478 4800002C */ b lbl_0000B4A4
lbl_0000B47C:
/* 0000B47C 80610014 */ lwz r3, 0x14(r1)
/* 0000B480 3B233F0C */ addi r25, r3, 0x3f0c
/* 0000B484 48000020 */ b lbl_0000B4A4
lbl_0000B488:
/* 0000B488 80950000 */ lwz r4, 0(r21)
/* 0000B48C 5400103A */ slwi r0, r0, 2
/* 0000B490 387F008C */ addi r3, r31, 0x8c
/* 0000B494 7C84002E */ lwzx r4, r4, r0
/* 0000B498 7C84C02E */ lwzx r4, r4, r24
/* 0000B49C 4BFF4CED */ bl strcpy
/* 0000B4A0 3B3BFF00 */ addi r25, r27, -256  ;# fixed addi
lbl_0000B4A4:
/* 0000B4A4 887F0001 */ lbz r3, 1(r31)
/* 0000B4A8 389F008C */ addi r4, r31, 0x8c
/* 0000B4AC 4BFF4CDD */ bl u_get_jpn_text_width
/* 0000B4B0 6C608000 */ xoris r0, r3, 0x8000
/* 0000B4B4 C81E0068 */ lfd f0, 0x68(r30)
/* 0000B4B8 9001002C */ stw r0, 0x2c(r1)
/* 0000B4BC 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B4C0 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B4C4 93A10028 */ stw r29, 0x28(r1)
/* 0000B4C8 C07F0040 */ lfs f3, 0x40(r31)
/* 0000B4CC C8210028 */ lfd f1, 0x28(r1)
/* 0000B4D0 FC211028 */ fsub f1, f1, f2
/* 0000B4D4 FC000824 */ fdiv f0, f0, f1
/* 0000B4D8 FC001840 */ fcmpo cr0, f0, f3
/* 0000B4DC 40800034 */ bge lbl_0000B510
/* 0000B4E0 887F0001 */ lbz r3, 1(r31)
/* 0000B4E4 389F008C */ addi r4, r31, 0x8c
/* 0000B4E8 4BFF4CA1 */ bl u_get_jpn_text_width
/* 0000B4EC 6C608000 */ xoris r0, r3, 0x8000
/* 0000B4F0 C81E0068 */ lfd f0, 0x68(r30)
/* 0000B4F4 9001002C */ stw r0, 0x2c(r1)
/* 0000B4F8 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B4FC C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B500 93A10028 */ stw r29, 0x28(r1)
/* 0000B504 C8210028 */ lfd f1, 0x28(r1)
/* 0000B508 FC211028 */ fsub f1, f1, f2
/* 0000B50C FC600824 */ fdiv f3, f0, f1
lbl_0000B510:
/* 0000B510 FC001818 */ frsp f0, f3
/* 0000B514 D01F0040 */ stfs f0, 0x40(r31)
/* 0000B518 4800005C */ b lbl_0000B574
lbl_0000B51C:
/* 0000B51C 2C1C0002 */ cmpwi r28, 2
/* 0000B520 40820038 */ bne lbl_0000B558
/* 0000B524 80610018 */ lwz r3, 0x18(r1)
/* 0000B528 808F0000 */ lwz r4, 0(r15)
/* 0000B52C 80030004 */ lwz r0, 4(r3)
/* 0000B530 387F008C */ addi r3, r31, 0x8c
/* 0000B534 5400103A */ slwi r0, r0, 2
/* 0000B538 7C84002E */ lwzx r4, r4, r0
/* 0000B53C 4BFF4C4D */ bl strcpy
/* 0000B540 C01E0040 */ lfs f0, 0x40(r30)
/* 0000B544 3B3B8000 */ addi r25, r27, -32768  ;# fixed addi
/* 0000B548 D01F0040 */ stfs f0, 0x40(r31)
/* 0000B54C C01E0040 */ lfs f0, 0x40(r30)
/* 0000B550 D01F0044 */ stfs f0, 0x44(r31)
/* 0000B554 48000020 */ b lbl_0000B574
lbl_0000B558:
/* 0000B558 80950000 */ lwz r4, 0(r21)
/* 0000B55C 5400103A */ slwi r0, r0, 2
/* 0000B560 387F008C */ addi r3, r31, 0x8c
/* 0000B564 7C84002E */ lwzx r4, r4, r0
/* 0000B568 7C84C02E */ lwzx r4, r4, r24
/* 0000B56C 4BFF4C1D */ bl strcpy
/* 0000B570 3B3BFF00 */ addi r25, r27, -256  ;# fixed addi
lbl_0000B574:
/* 0000B574 387F008C */ addi r3, r31, 0x8c
/* 0000B578 4BFF4C11 */ bl strlen
/* 0000B57C 28030030 */ cmplwi r3, 0x30
/* 0000B580 40810020 */ ble lbl_0000B5A0
/* 0000B584 38740000 */ addi r3, r20, 0
/* 0000B588 4CC63182 */ crclr 6
/* 0000B58C 389F008C */ addi r4, r31, 0x8c
/* 0000B590 4BFF4BF9 */ bl printf
/* 0000B594 387F008C */ addi r3, r31, 0x8c
/* 0000B598 38940020 */ addi r4, r20, 0x20
/* 0000B59C 4BFF4BED */ bl strcpy
lbl_0000B5A0:
/* 0000B5A0 82FF0038 */ lwz r23, 0x38(r31)
/* 0000B5A4 38000000 */ li r0, 0
/* 0000B5A8 387F0000 */ addi r3, r31, 0
/* 0000B5AC 901F0038 */ stw r0, 0x38(r31)
/* 0000B5B0 389F0058 */ addi r4, r31, 0x58
/* 0000B5B4 38BF005C */ addi r5, r31, 0x5c
/* 0000B5B8 38DF0060 */ addi r6, r31, 0x60
/* 0000B5BC 38FF0064 */ addi r7, r31, 0x64
/* 0000B5C0 4BFF4BC9 */ bl calc_sprite_bounds
/* 0000B5C4 92FF0038 */ stw r23, 0x38(r31)
/* 0000B5C8 7C108A14 */ add r0, r16, r17
/* 0000B5CC 7C609214 */ add r3, r0, r18
/* 0000B5D0 809F005C */ lwz r4, 0x5c(r31)
/* 0000B5D4 38030006 */ addi r0, r3, 6
/* 0000B5D8 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B5DC C03F0040 */ lfs f1, 0x40(r31)
/* 0000B5E0 7C040214 */ add r0, r4, r0
/* 0000B5E4 6C008000 */ xoris r0, r0, 0x8000
/* 0000B5E8 C8630000 */ lfd f3, lbl_00011D00@l(r3)
/* 0000B5EC 9001002C */ stw r0, 0x2c(r1)
/* 0000B5F0 C05F0044 */ lfs f2, 0x44(r31)
/* 0000B5F4 93A10028 */ stw r29, 0x28(r1)
/* 0000B5F8 C8010028 */ lfd f0, 0x28(r1)
/* 0000B5FC EFA01828 */ fsubs f29, f0, f3
/* 0000B600 4BFF4B89 */ bl set_text_scale
/* 0000B604 8061001C */ lwz r3, 0x1c(r1)
/* 0000B608 38632000 */ addi r3, r3, 0x2000
/* 0000B60C 4BFF4B7D */ bl set_text_mul_color
/* 0000B610 809F0058 */ lwz r4, 0x58(r31)
/* 0000B614 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B618 C01E0070 */ lfs f0, 0x70(r30)
/* 0000B61C 38040003 */ addi r0, r4, 3
/* 0000B620 C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000B624 6C008000 */ xoris r0, r0, 0x8000
/* 0000B628 EC40E82A */ fadds f2, f0, f29
/* 0000B62C 90010034 */ stw r0, 0x34(r1)
/* 0000B630 93A10030 */ stw r29, 0x30(r1)
/* 0000B634 C8010030 */ lfd f0, 0x30(r1)
/* 0000B638 EC200828 */ fsubs f1, f0, f1
/* 0000B63C 4BFF4B4D */ bl set_text_pos
/* 0000B640 387F008C */ addi r3, r31, 0x8c
/* 0000B644 4BFF4B45 */ bl u_draw_text
/* 0000B648 7F23CB78 */ mr r3, r25
/* 0000B64C 4BFF4B3D */ bl set_text_mul_color
/* 0000B650 801F0058 */ lwz r0, 0x58(r31)
/* 0000B654 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B658 C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000B65C FC40E890 */ fmr f2, f29
/* 0000B660 6C008000 */ xoris r0, r0, 0x8000
/* 0000B664 90010024 */ stw r0, 0x24(r1)
/* 0000B668 93A10020 */ stw r29, 0x20(r1)
/* 0000B66C C8010020 */ lfd f0, 0x20(r1)
/* 0000B670 EC200828 */ fsubs f1, f0, f1
/* 0000B674 4BFF4B15 */ bl set_text_pos
/* 0000B678 387F008C */ addi r3, r31, 0x8c
/* 0000B67C 4BFF4B0D */ bl u_draw_text
/* 0000B680 C01E0040 */ lfs f0, 0x40(r30)
/* 0000B684 3B180004 */ addi r24, r24, 4
/* 0000B688 3A310018 */ addi r17, r17, 0x18
/* 0000B68C D01F0040 */ stfs f0, 0x40(r31)
/* 0000B690 3A52000C */ addi r18, r18, 0xc
/* 0000B694 3B9C0001 */ addi r28, r28, 1
/* 0000B698 C01E000C */ lfs f0, 0xc(r30)
/* 0000B69C D01F0044 */ stfs f0, 0x44(r31)
lbl_0000B6A0:
/* 0000B6A0 7C1C9800 */ cmpw r28, r19
/* 0000B6A4 4180FC70 */ blt lbl_0000B314
/* 0000B6A8 C01E000C */ lfs f0, 0xc(r30)
/* 0000B6AC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000B6B0 D01F0040 */ stfs f0, 0x40(r31)
/* 0000B6B4 C01E000C */ lfs f0, 0xc(r30)
/* 0000B6B8 D01F0044 */ stfs f0, 0x44(r31)
/* 0000B6BC 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 0000B6C0 2C00001F */ cmpwi r0, 0x1f
/* 0000B6C4 4182023C */ beq lbl_0000B900
/* 0000B6C8 2C00000A */ cmpwi r0, 0xa
/* 0000B6CC 41820014 */ beq lbl_0000B6E0
/* 0000B6D0 2C00000C */ cmpwi r0, 0xc
/* 0000B6D4 4182000C */ beq lbl_0000B6E0
/* 0000B6D8 2C00000E */ cmpwi r0, 0xe
/* 0000B6DC 4082000C */ bne lbl_0000B6E8
lbl_0000B6E0:
/* 0000B6E0 38000001 */ li r0, 1
/* 0000B6E4 9001000C */ stw r0, 0xc(r1)
lbl_0000B6E8:
/* 0000B6E8 C03E0040 */ lfs f1, 0x40(r30)
/* 0000B6EC FC400890 */ fmr f2, f1
/* 0000B6F0 4BFF4A99 */ bl set_text_scale
/* 0000B6F4 8001000C */ lwz r0, 0xc(r1)
/* 0000B6F8 C07E0074 */ lfs f3, 0x74(r30)
/* 0000B6FC C05F0004 */ lfs f2, 4(r31)
/* 0000B700 2C000000 */ cmpwi r0, 0
/* 0000B704 C03E0078 */ lfs f1, 0x78(r30)
/* 0000B708 C01F0008 */ lfs f0, 8(r31)
/* 0000B70C EFA3102A */ fadds f29, f3, f2
/* 0000B710 EFC1002A */ fadds f30, f1, f0
/* 0000B714 41820008 */ beq lbl_0000B71C
/* 0000B718 EFDE0828 */ fsubs f30, f30, f1
lbl_0000B71C:
/* 0000B71C 387F008C */ addi r3, r31, 0x8c
/* 0000B720 389438D8 */ addi r4, r20, 0x38d8
/* 0000B724 4BFF4A65 */ bl strcpy
/* 0000B728 8001000C */ lwz r0, 0xc(r1)
/* 0000B72C 2C000000 */ cmpwi r0, 0
/* 0000B730 41820010 */ beq lbl_0000B740
/* 0000B734 387F008C */ addi r3, r31, 0x8c
/* 0000B738 389438F0 */ addi r4, r20, 0x38f0
/* 0000B73C 4BFF4A4D */ bl strcpy
lbl_0000B740:
/* 0000B740 C03E007C */ lfs f1, 0x7c(r30)
/* 0000B744 4BFF4A45 */ bl func_80071B1C
/* 0000B748 38600000 */ li r3, 0
/* 0000B74C 4BFF4A3D */ bl set_text_mul_color
/* 0000B750 C01E0070 */ lfs f0, 0x70(r30)
/* 0000B754 EFE0F02A */ fadds f31, f0, f30
/* 0000B758 EC20E82A */ fadds f1, f0, f29
/* 0000B75C FC40F890 */ fmr f2, f31
/* 0000B760 4BFF4A29 */ bl set_text_pos
/* 0000B764 387F008C */ addi r3, r31, 0x8c
/* 0000B768 4BFF4A21 */ bl u_draw_text
/* 0000B76C C03E003C */ lfs f1, 0x3c(r30)
/* 0000B770 4BFF4A19 */ bl func_80071B1C
/* 0000B774 3E200100 */ lis r17, 0x100
/* 0000B778 3871FFFF */ addi r3, r17, -1  ;# fixed addi
/* 0000B77C 4BFF4A0D */ bl set_text_mul_color
/* 0000B780 FC20E890 */ fmr f1, f29
/* 0000B784 FC40F090 */ fmr f2, f30
/* 0000B788 4BFF4A01 */ bl set_text_pos
/* 0000B78C 387F008C */ addi r3, r31, 0x8c
/* 0000B790 4BFF49F9 */ bl u_draw_text
/* 0000B794 C01E0080 */ lfs f0, 0x80(r30)
/* 0000B798 8001000C */ lwz r0, 0xc(r1)
/* 0000B79C EFBD002A */ fadds f29, f29, f0
/* 0000B7A0 2C000000 */ cmpwi r0, 0
/* 0000B7A4 41820080 */ beq lbl_0000B824
/* 0000B7A8 C03E0084 */ lfs f1, 0x84(r30)
/* 0000B7AC C05E0040 */ lfs f2, 0x40(r30)
/* 0000B7B0 4BFF49D9 */ bl set_text_scale
/* 0000B7B4 387F008C */ addi r3, r31, 0x8c
/* 0000B7B8 38943914 */ addi r4, r20, 0x3914
/* 0000B7BC 4BFF49CD */ bl strcpy
/* 0000B7C0 C03E007C */ lfs f1, 0x7c(r30)
/* 0000B7C4 4BFF49C5 */ bl func_80071B1C
/* 0000B7C8 38600000 */ li r3, 0
/* 0000B7CC 4BFF49BD */ bl set_text_mul_color
/* 0000B7D0 C01E0070 */ lfs f0, 0x70(r30)
/* 0000B7D4 FC40F890 */ fmr f2, f31
/* 0000B7D8 EC20E82A */ fadds f1, f0, f29
/* 0000B7DC 4BFF49AD */ bl set_text_pos
/* 0000B7E0 387F008C */ addi r3, r31, 0x8c
/* 0000B7E4 4BFF49A5 */ bl u_draw_text
/* 0000B7E8 C03E003C */ lfs f1, 0x3c(r30)
/* 0000B7EC 4BFF499D */ bl func_80071B1C
/* 0000B7F0 3871FF00 */ addi r3, r17, -256  ;# fixed addi
/* 0000B7F4 4BFF4995 */ bl set_text_mul_color
/* 0000B7F8 FC20E890 */ fmr f1, f29
/* 0000B7FC FC40F090 */ fmr f2, f30
/* 0000B800 4BFF4989 */ bl set_text_pos
/* 0000B804 387F008C */ addi r3, r31, 0x8c
/* 0000B808 4BFF4981 */ bl u_draw_text
/* 0000B80C C03E0040 */ lfs f1, 0x40(r30)
/* 0000B810 FC400890 */ fmr f2, f1
/* 0000B814 4BFF4975 */ bl set_text_scale
/* 0000B818 C81E0088 */ lfd f0, 0x88(r30)
/* 0000B81C FFDE002A */ fadd f30, f30, f0
/* 0000B820 FFC0F018 */ frsp f30, f30
lbl_0000B824:
/* 0000B824 C03E0084 */ lfs f1, 0x84(r30)
/* 0000B828 C05E0040 */ lfs f2, 0x40(r30)
/* 0000B82C 4BFF495D */ bl set_text_scale
/* 0000B830 387F008C */ addi r3, r31, 0x8c
/* 0000B834 38943920 */ addi r4, r20, 0x3920
/* 0000B838 4BFF4951 */ bl strcpy
/* 0000B83C C03E007C */ lfs f1, 0x7c(r30)
/* 0000B840 4BFF4949 */ bl func_80071B1C
/* 0000B844 38600000 */ li r3, 0
/* 0000B848 4BFF4941 */ bl set_text_mul_color
/* 0000B84C C01E0070 */ lfs f0, 0x70(r30)
/* 0000B850 EFE0E82A */ fadds f31, f0, f29
/* 0000B854 EC40F02A */ fadds f2, f0, f30
/* 0000B858 FC20F890 */ fmr f1, f31
/* 0000B85C 4BFF492D */ bl set_text_pos
/* 0000B860 387F008C */ addi r3, r31, 0x8c
/* 0000B864 4BFF4925 */ bl u_draw_text
/* 0000B868 C03E003C */ lfs f1, 0x3c(r30)
/* 0000B86C 4BFF491D */ bl func_80071B1C
/* 0000B870 3E200100 */ lis r17, 0x100
/* 0000B874 3871FF00 */ addi r3, r17, -256  ;# fixed addi
/* 0000B878 4BFF4911 */ bl set_text_mul_color
/* 0000B87C FC20E890 */ fmr f1, f29
/* 0000B880 FC40F090 */ fmr f2, f30
/* 0000B884 4BFF4905 */ bl set_text_pos
/* 0000B888 387F008C */ addi r3, r31, 0x8c
/* 0000B88C 4BFF48FD */ bl u_draw_text
/* 0000B890 C81E0088 */ lfd f0, 0x88(r30)
/* 0000B894 C03E0084 */ lfs f1, 0x84(r30)
/* 0000B898 FFDE002A */ fadd f30, f30, f0
/* 0000B89C C05E0040 */ lfs f2, 0x40(r30)
/* 0000B8A0 FFC0F018 */ frsp f30, f30
/* 0000B8A4 4BFF48E5 */ bl set_text_scale
/* 0000B8A8 387F008C */ addi r3, r31, 0x8c
/* 0000B8AC 3894392C */ addi r4, r20, 0x392c
/* 0000B8B0 4BFF48D9 */ bl strcpy
/* 0000B8B4 C03E007C */ lfs f1, 0x7c(r30)
/* 0000B8B8 4BFF48D1 */ bl func_80071B1C
/* 0000B8BC 38600000 */ li r3, 0
/* 0000B8C0 4BFF48C9 */ bl set_text_mul_color
/* 0000B8C4 C01E0070 */ lfs f0, 0x70(r30)
/* 0000B8C8 FC20F890 */ fmr f1, f31
/* 0000B8CC EC40F02A */ fadds f2, f0, f30
/* 0000B8D0 4BFF48B9 */ bl set_text_pos
/* 0000B8D4 387F008C */ addi r3, r31, 0x8c
/* 0000B8D8 4BFF48B1 */ bl u_draw_text
/* 0000B8DC C03E003C */ lfs f1, 0x3c(r30)
/* 0000B8E0 4BFF48A9 */ bl func_80071B1C
/* 0000B8E4 3871FF00 */ addi r3, r17, -256  ;# fixed addi
/* 0000B8E8 4BFF48A1 */ bl set_text_mul_color
/* 0000B8EC FC20E890 */ fmr f1, f29
/* 0000B8F0 FC40F090 */ fmr f2, f30
/* 0000B8F4 4BFF4895 */ bl set_text_pos
/* 0000B8F8 387F008C */ addi r3, r31, 0x8c
/* 0000B8FC 4BFF488D */ bl u_draw_text
lbl_0000B900:
/* 0000B900 B9C10038 */ lmw r14, 0x38(r1)
/* 0000B904 8001009C */ lwz r0, 0x9c(r1)
/* 0000B908 CBE10090 */ lfd f31, 0x90(r1)
/* 0000B90C CBC10088 */ lfd f30, 0x88(r1)
/* 0000B910 7C0803A6 */ mtlr r0
/* 0000B914 CBA10080 */ lfd f29, 0x80(r1)
/* 0000B918 38210098 */ addi r1, r1, 0x98
/* 0000B91C 4E800020 */ blr 
lbl_0000B920:
/* 0000B920 7C0802A6 */ mflr r0
/* 0000B924 3CA00000 */ lis r5, lbl_00012730@ha
/* 0000B928 90010004 */ stw r0, 4(r1)
/* 0000B92C 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000B930 9421FDA0 */ stwu r1, -0x260(r1)
/* 0000B934 DBE10258 */ stfd f31, 0x258(r1)
/* 0000B938 DBC10250 */ stfd f30, 0x250(r1)
/* 0000B93C BE810220 */ stmw r20, 0x220(r1)
/* 0000B940 3B030000 */ addi r24, r3, 0
/* 0000B944 3B850000 */ addi r28, r5, lbl_00012730@l
/* 0000B948 3BA40000 */ addi r29, r4, lbl_00011CB0@l
/* 0000B94C 3AA00001 */ li r21, 1
/* 0000B950 3B400008 */ li r26, 8
/* 0000B954 4BFFEF1D */ bl lbl_0000A870
/* 0000B958 80180048 */ lwz r0, 0x48(r24)
/* 0000B95C 807C3CE8 */ lwz r3, 0x3ce8(r28)
/* 0000B960 5400103A */ slwi r0, r0, 2
/* 0000B964 7C03002E */ lwzx r0, r3, r0
/* 0000B968 28000000 */ cmplwi r0, 0
/* 0000B96C 41820560 */ beq lbl_0000BECC
/* 0000B970 4BFF4819 */ bl reset_text_draw_settings
/* 0000B974 88780001 */ lbz r3, 1(r24)
/* 0000B978 4BFF4811 */ bl set_text_font
/* 0000B97C 56A0103A */ slwi r0, r21, 2
/* 0000B980 7FFC0214 */ add r31, r28, r0
/* 0000B984 3B600000 */ li r27, 0
/* 0000B988 577E103A */ slwi r30, r27, 2
/* 0000B98C 3EE04330 */ lis r23, 0x4330
/* 0000B990 3F200100 */ lis r25, 0x100
/* 0000B994 3EC00020 */ lis r22, 0x20
/* 0000B998 3BFF3CE4 */ addi r31, r31, 0x3ce4
lbl_0000B99C:
/* 0000B99C 80180048 */ lwz r0, 0x48(r24)
/* 0000B9A0 38610010 */ addi r3, r1, 0x10
/* 0000B9A4 809F0000 */ lwz r4, 0(r31)
/* 0000B9A8 5400103A */ slwi r0, r0, 2
/* 0000B9AC 7C84002E */ lwzx r4, r4, r0
/* 0000B9B0 7C84F02E */ lwzx r4, r4, r30
/* 0000B9B4 4BFF47D5 */ bl strcpy
/* 0000B9B8 2C1B0001 */ cmpwi r27, 1
/* 0000B9BC 4182003C */ beq lbl_0000B9F8
/* 0000B9C0 4080005C */ bge lbl_0000BA1C
/* 0000B9C4 2C1B0000 */ cmpwi r27, 0
/* 0000B9C8 40800008 */ bge lbl_0000B9D0
/* 0000B9CC 48000050 */ b lbl_0000BA1C
lbl_0000B9D0:
/* 0000B9D0 3879FF00 */ addi r3, r25, -256  ;# fixed addi
/* 0000B9D4 4BFF47B5 */ bl set_text_mul_color
/* 0000B9D8 C03D0090 */ lfs f1, 0x90(r29)
/* 0000B9DC C05D000C */ lfs f2, 0xc(r29)
/* 0000B9E0 4BFF47A9 */ bl set_text_scale
/* 0000B9E4 C01D0090 */ lfs f0, 0x90(r29)
/* 0000B9E8 D0180040 */ stfs f0, 0x40(r24)
/* 0000B9EC C01D000C */ lfs f0, 0xc(r29)
/* 0000B9F0 D0180044 */ stfs f0, 0x44(r24)
/* 0000B9F4 48000028 */ b lbl_0000BA1C
lbl_0000B9F8:
/* 0000B9F8 38798000 */ addi r3, r25, -32768  ;# fixed addi
/* 0000B9FC 4BFF478D */ bl set_text_mul_color
/* 0000BA00 C03D0084 */ lfs f1, 0x84(r29)
/* 0000BA04 C05D0040 */ lfs f2, 0x40(r29)
/* 0000BA08 4BFF4781 */ bl set_text_scale
/* 0000BA0C C01D0084 */ lfs f0, 0x84(r29)
/* 0000BA10 D0180040 */ stfs f0, 0x40(r24)
/* 0000BA14 C01D0040 */ lfs f0, 0x40(r29)
/* 0000BA18 D0180044 */ stfs f0, 0x44(r24)
lbl_0000BA1C:
/* 0000BA1C 2C1B0001 */ cmpwi r27, 1
/* 0000BA20 41820070 */ beq lbl_0000BA90
/* 0000BA24 408000C4 */ bge lbl_0000BAE8
/* 0000BA28 2C1B0000 */ cmpwi r27, 0
/* 0000BA2C 40800008 */ bge lbl_0000BA34
/* 0000BA30 480000B8 */ b lbl_0000BAE8
lbl_0000BA34:
/* 0000BA34 C0380008 */ lfs f1, 8(r24)
/* 0000BA38 38810010 */ addi r4, r1, 0x10
/* 0000BA3C C01D0094 */ lfs f0, 0x94(r29)
/* 0000BA40 88780001 */ lbz r3, 1(r24)
/* 0000BA44 EFE10028 */ fsubs f31, f1, f0
/* 0000BA48 4BFF4741 */ bl u_get_jpn_text_width
/* 0000BA4C 6C608000 */ xoris r0, r3, 0x8000
/* 0000BA50 C87D0098 */ lfd f3, 0x98(r29)
/* 0000BA54 9001021C */ stw r0, 0x21c(r1)
/* 0000BA58 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000BA5C C8A30000 */ lfd f5, lbl_00011D00@l(r3)
/* 0000BA60 FC40F890 */ fmr f2, f31
/* 0000BA64 92E10218 */ stw r23, 0x218(r1)
/* 0000BA68 C0380040 */ lfs f1, 0x40(r24)
/* 0000BA6C C8810218 */ lfd f4, 0x218(r1)
/* 0000BA70 C0180004 */ lfs f0, 4(r24)
/* 0000BA74 FC842828 */ fsub f4, f4, f5
/* 0000BA78 FC630132 */ fmul f3, f3, f4
/* 0000BA7C FC2100F2 */ fmul f1, f1, f3
/* 0000BA80 FC000828 */ fsub f0, f0, f1
/* 0000BA84 FC200018 */ frsp f1, f0
/* 0000BA88 4BFF4701 */ bl set_text_pos
/* 0000BA8C 4800005C */ b lbl_0000BAE8
lbl_0000BA90:
/* 0000BA90 C03D00A0 */ lfs f1, 0xa0(r29)
/* 0000BA94 38810010 */ addi r4, r1, 0x10
/* 0000BA98 C0180008 */ lfs f0, 8(r24)
/* 0000BA9C 88780001 */ lbz r3, 1(r24)
/* 0000BAA0 EFE1002A */ fadds f31, f1, f0
/* 0000BAA4 4BFF46E5 */ bl u_get_jpn_text_width
/* 0000BAA8 6C608000 */ xoris r0, r3, 0x8000
/* 0000BAAC C87D0098 */ lfd f3, 0x98(r29)
/* 0000BAB0 9001021C */ stw r0, 0x21c(r1)
/* 0000BAB4 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000BAB8 C8A30000 */ lfd f5, lbl_00011D00@l(r3)
/* 0000BABC FC40F890 */ fmr f2, f31
/* 0000BAC0 92E10218 */ stw r23, 0x218(r1)
/* 0000BAC4 C0380040 */ lfs f1, 0x40(r24)
/* 0000BAC8 C8810218 */ lfd f4, 0x218(r1)
/* 0000BACC C0180004 */ lfs f0, 4(r24)
/* 0000BAD0 FC842828 */ fsub f4, f4, f5
/* 0000BAD4 FC630132 */ fmul f3, f3, f4
/* 0000BAD8 FC2100F2 */ fmul f1, f1, f3
/* 0000BADC FC000828 */ fsub f0, f0, f1
/* 0000BAE0 FC200018 */ frsp f1, f0
/* 0000BAE4 4BFF46A5 */ bl set_text_pos
lbl_0000BAE8:
/* 0000BAE8 38610010 */ addi r3, r1, 0x10
/* 0000BAEC 4BFF469D */ bl u_draw_text
/* 0000BAF0 38762000 */ addi r3, r22, 0x2000
/* 0000BAF4 4BFF4695 */ bl set_text_mul_color
/* 0000BAF8 88780001 */ lbz r3, 1(r24)
/* 0000BAFC 38810010 */ addi r4, r1, 0x10
/* 0000BB00 4BFF4689 */ bl u_get_jpn_text_width
/* 0000BB04 6C608000 */ xoris r0, r3, 0x8000
/* 0000BB08 C01D0070 */ lfs f0, 0x70(r29)
/* 0000BB0C 9001021C */ stw r0, 0x21c(r1)
/* 0000BB10 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000BB14 C8830000 */ lfd f4, lbl_00011D00@l(r3)
/* 0000BB18 EC40F82A */ fadds f2, f0, f31
/* 0000BB1C 92E10218 */ stw r23, 0x218(r1)
/* 0000BB20 C87D0098 */ lfd f3, 0x98(r29)
/* 0000BB24 C8010218 */ lfd f0, 0x218(r1)
/* 0000BB28 C0380040 */ lfs f1, 0x40(r24)
/* 0000BB2C FC802028 */ fsub f4, f0, f4
/* 0000BB30 C0180004 */ lfs f0, 4(r24)
/* 0000BB34 FC630132 */ fmul f3, f3, f4
/* 0000BB38 FC2100F2 */ fmul f1, f1, f3
/* 0000BB3C FC000828 */ fsub f0, f0, f1
/* 0000BB40 FC200018 */ frsp f1, f0
/* 0000BB44 4BFF4645 */ bl set_text_pos
/* 0000BB48 38610010 */ addi r3, r1, 0x10
/* 0000BB4C 4BFF463D */ bl u_draw_text
/* 0000BB50 3B7B0001 */ addi r27, r27, 1
/* 0000BB54 2C1B0002 */ cmpwi r27, 2
/* 0000BB58 3BDE0004 */ addi r30, r30, 4
/* 0000BB5C 4180FE40 */ blt lbl_0000B99C
/* 0000BB60 C01D000C */ lfs f0, 0xc(r29)
/* 0000BB64 D0180040 */ stfs f0, 0x40(r24)
/* 0000BB68 C01D000C */ lfs f0, 0xc(r29)
/* 0000BB6C D0180044 */ stfs f0, 0x44(r24)
/* 0000BB70 80980048 */ lwz r4, 0x48(r24)
/* 0000BB74 2C040003 */ cmpwi r4, 3
/* 0000BB78 41820354 */ beq lbl_0000BECC
/* 0000BB7C 2C040002 */ cmpwi r4, 2
/* 0000BB80 41820030 */ beq lbl_0000BBB0
/* 0000BB84 40800010 */ bge lbl_0000BB94
/* 0000BB88 2C040001 */ cmpwi r4, 1
/* 0000BB8C 4080001C */ bge lbl_0000BBA8
/* 0000BB90 4800002C */ b lbl_0000BBBC
lbl_0000BB94:
/* 0000BB94 2C040007 */ cmpwi r4, 7
/* 0000BB98 40800024 */ bge lbl_0000BBBC
/* 0000BB9C 2C040005 */ cmpwi r4, 5
/* 0000BBA0 40800018 */ bge lbl_0000BBB8
/* 0000BBA4 48000018 */ b lbl_0000BBBC
lbl_0000BBA8:
/* 0000BBA8 3B400017 */ li r26, 0x17
/* 0000BBAC 48000010 */ b lbl_0000BBBC
lbl_0000BBB0:
/* 0000BBB0 3B40003F */ li r26, 0x3f
/* 0000BBB4 48000008 */ b lbl_0000BBBC
lbl_0000BBB8:
/* 0000BBB8 3B400044 */ li r26, 0x44
lbl_0000BBBC:
/* 0000BBBC 6F408000 */ xoris r0, r26, 0x8000
/* 0000BBC0 C0380008 */ lfs f1, 8(r24)
/* 0000BBC4 9001021C */ stw r0, 0x21c(r1)
/* 0000BBC8 3C004330 */ lis r0, 0x4330
/* 0000BBCC 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000BBD0 C01D0094 */ lfs f0, 0x94(r29)
/* 0000BBD4 90010218 */ stw r0, 0x218(r1)
/* 0000BBD8 C8630000 */ lfd f3, lbl_00011D00@l(r3)
/* 0000BBDC EFE10028 */ fsubs f31, f1, f0
/* 0000BBE0 C8410218 */ lfd f2, 0x218(r1)
/* 0000BBE4 2C040003 */ cmpwi r4, 3
/* 0000BBE8 C0980004 */ lfs f4, 4(r24)
/* 0000BBEC EC021828 */ fsubs f0, f2, f3
/* 0000BBF0 EFC4002A */ fadds f30, f4, f0
/* 0000BBF4 41820018 */ beq lbl_0000BC0C
/* 0000BBF8 40800008 */ bge lbl_0000BC00
/* 0000BBFC 48000010 */ b lbl_0000BC0C
lbl_0000BC00:
/* 0000BC00 2C040007 */ cmpwi r4, 7
/* 0000BC04 40800008 */ bge lbl_0000BC0C
/* 0000BC08 48000010 */ b lbl_0000BC18
lbl_0000BC0C:
/* 0000BC0C 3C600000 */ lis r3, lbl_802F1FB0@ha
/* 0000BC10 83230000 */ lwz r25, lbl_802F1FB0@l(r3)
/* 0000BC14 48000014 */ b lbl_0000BC28
lbl_0000BC18:
/* 0000BC18 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000BC1C 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000BC20 8B230004 */ lbz r25, 4(r3)
/* 0000BC24 7F390774 */ extsb r25, r25
lbl_0000BC28:
/* 0000BC28 3C600001 */ lis r3, 1
/* 0000BC2C 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 0000BC30 4BFF4559 */ bl set_text_mul_color
/* 0000BC34 C03D000C */ lfs f1, 0xc(r29)
/* 0000BC38 FC400890 */ fmr f2, f1
/* 0000BC3C 4BFF454D */ bl set_text_scale
/* 0000BC40 FC20F090 */ fmr f1, f30
/* 0000BC44 FC40F890 */ fmr f2, f31
/* 0000BC48 4BFF4541 */ bl set_text_pos
/* 0000BC4C 38990000 */ addi r4, r25, 0
/* 0000BC50 4CC63182 */ crclr 6
/* 0000BC54 387C3CEC */ addi r3, r28, 0x3cec
/* 0000BC58 4BFF4531 */ bl func_80072AC0
/* 0000BC5C 38602020 */ li r3, 0x2020
/* 0000BC60 4BFF4529 */ bl set_text_mul_color
/* 0000BC64 C01D0070 */ lfs f0, 0x70(r29)
/* 0000BC68 EC20F02A */ fadds f1, f0, f30
/* 0000BC6C EC40F82A */ fadds f2, f0, f31
/* 0000BC70 4BFF4519 */ bl set_text_pos
/* 0000BC74 38990000 */ addi r4, r25, 0
/* 0000BC78 4CC63182 */ crclr 6
/* 0000BC7C 387C3CEC */ addi r3, r28, 0x3cec
/* 0000BC80 4BFF4509 */ bl func_80072AC0
/* 0000BC84 80180048 */ lwz r0, 0x48(r24)
/* 0000BC88 2C000004 */ cmpwi r0, 4
/* 0000BC8C 41820014 */ beq lbl_0000BCA0
/* 0000BC90 4080007C */ bge lbl_0000BD0C
/* 0000BC94 2C000001 */ cmpwi r0, 1
/* 0000BC98 41820008 */ beq lbl_0000BCA0
/* 0000BC9C 48000070 */ b lbl_0000BD0C
lbl_0000BCA0:
/* 0000BCA0 C05D00A4 */ lfs f2, 0xa4(r29)
/* 0000BCA4 C0180004 */ lfs f0, 4(r24)
/* 0000BCA8 C03D0040 */ lfs f1, 0x40(r29)
/* 0000BCAC ECA2002A */ fadds f5, f2, f0
/* 0000BCB0 C09D00A8 */ lfs f4, 0xa8(r29)
/* 0000BCB4 C0780008 */ lfs f3, 8(r24)
/* 0000BCB8 FC400890 */ fmr f2, f1
/* 0000BCBC C01D00AC */ lfs f0, 0xac(r29)
/* 0000BCC0 EFE52028 */ fsubs f31, f5, f4
/* 0000BCC4 EFC30028 */ fsubs f30, f3, f0
/* 0000BCC8 4BFF44C1 */ bl set_text_scale
/* 0000BCCC FC20F890 */ fmr f1, f31
/* 0000BCD0 FC40F090 */ fmr f2, f30
/* 0000BCD4 4BFF44B5 */ bl set_text_pos
/* 0000BCD8 3C600100 */ lis r3, 0x100
/* 0000BCDC 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 0000BCE0 4BFF44A9 */ bl set_text_mul_color
/* 0000BCE4 387C3CF0 */ addi r3, r28, 0x3cf0
/* 0000BCE8 4BFF44A1 */ bl u_draw_text
/* 0000BCEC C01D0070 */ lfs f0, 0x70(r29)
/* 0000BCF0 EC20F82A */ fadds f1, f0, f31
/* 0000BCF4 EC40F02A */ fadds f2, f0, f30
/* 0000BCF8 4BFF4491 */ bl set_text_pos
/* 0000BCFC 38600000 */ li r3, 0
/* 0000BD00 4BFF4489 */ bl set_text_mul_color
/* 0000BD04 387C3D10 */ addi r3, r28, 0x3d10
/* 0000BD08 4BFF4481 */ bl u_draw_text
lbl_0000BD0C:
/* 0000BD0C 80180048 */ lwz r0, 0x48(r24)
/* 0000BD10 2C000005 */ cmpwi r0, 5
/* 0000BD14 40800010 */ bge lbl_0000BD24
/* 0000BD18 2C000002 */ cmpwi r0, 2
/* 0000BD1C 418201B0 */ beq lbl_0000BECC
/* 0000BD20 48000010 */ b lbl_0000BD30
lbl_0000BD24:
/* 0000BD24 2C000007 */ cmpwi r0, 7
/* 0000BD28 40800008 */ bge lbl_0000BD30
/* 0000BD2C 480001A0 */ b lbl_0000BECC
lbl_0000BD30:
/* 0000BD30 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000BD34 6F568000 */ xoris r22, r26, 0x8000
/* 0000BD38 3BC30000 */ addi r30, r3, unpausedFrameCounter@l
/* 0000BD3C 3B600000 */ li r27, 0
/* 0000BD40 3FE00001 */ lis r31, 1
/* 0000BD44 3EE04330 */ lis r23, 0x4330
/* 0000BD48 3F400020 */ lis r26, 0x20
lbl_0000BD4C:
/* 0000BD4C 80180048 */ lwz r0, 0x48(r24)
/* 0000BD50 3AA00001 */ li r21, 1
/* 0000BD54 2C000001 */ cmpwi r0, 1
/* 0000BD58 41820010 */ beq lbl_0000BD68
/* 0000BD5C 2C000004 */ cmpwi r0, 4
/* 0000BD60 41820008 */ beq lbl_0000BD68
/* 0000BD64 3AA00000 */ li r21, 0
lbl_0000BD68:
/* 0000BD68 2C150000 */ cmpwi r21, 0
/* 0000BD6C 41820034 */ beq lbl_0000BDA0
/* 0000BD70 801E0000 */ lwz r0, 0(r30)
/* 0000BD74 5403482C */ slwi r3, r0, 9
/* 0000BD78 4BFF4411 */ bl mathutil_sin
/* 0000BD7C FC400A10 */ fabs f2, f1
/* 0000BD80 C83D0030 */ lfd f1, 0x30(r29)
/* 0000BD84 C81D00B0 */ lfd f0, 0xb0(r29)
/* 0000BD88 FC211028 */ fsub f1, f1, f2
/* 0000BD8C FC000072 */ fmul f0, f0, f1
/* 0000BD90 FC00001E */ fctiwz f0, f0
/* 0000BD94 D8010218 */ stfd f0, 0x218(r1)
/* 0000BD98 8281021C */ lwz r20, 0x21c(r1)
/* 0000BD9C 48000008 */ b lbl_0000BDA4
lbl_0000BDA0:
/* 0000BDA0 3A800000 */ li r20, 0
lbl_0000BDA4:
/* 0000BDA4 2C1B0000 */ cmpwi r27, 0
/* 0000BDA8 4082000C */ bne lbl_0000BDB4
/* 0000BDAC 2C190001 */ cmpwi r25, 1
/* 0000BDB0 41820110 */ beq lbl_0000BEC0
lbl_0000BDB4:
/* 0000BDB4 2C1B0001 */ cmpwi r27, 1
/* 0000BDB8 4082000C */ bne lbl_0000BDC4
/* 0000BDBC 2C190005 */ cmpwi r25, 5
/* 0000BDC0 41820100 */ beq lbl_0000BEC0
lbl_0000BDC4:
/* 0000BDC4 2C150000 */ cmpwi r21, 0
/* 0000BDC8 418200F8 */ beq lbl_0000BEC0
/* 0000BDCC 387FFFFF */ addi r3, r31, -1  ;# fixed addi
/* 0000BDD0 4BFF43B9 */ bl set_text_mul_color
/* 0000BDD4 5683801E */ slwi r3, r20, 0x10
/* 0000BDD8 5680402E */ slwi r0, r20, 8
/* 0000BDDC 7C600378 */ or r0, r3, r0
/* 0000BDE0 7E830378 */ or r3, r20, r0
/* 0000BDE4 4BFF43A5 */ bl set_text_add_color
/* 0000BDE8 2C1B0000 */ cmpwi r27, 0
/* 0000BDEC 4082000C */ bne lbl_0000BDF8
/* 0000BDF0 3800FFE0 */ li r0, -32
/* 0000BDF4 48000008 */ b lbl_0000BDFC
lbl_0000BDF8:
/* 0000BDF8 3800001A */ li r0, 0x1a
lbl_0000BDFC:
/* 0000BDFC 92C1021C */ stw r22, 0x21c(r1)
/* 0000BE00 6C008000 */ xoris r0, r0, 0x8000
/* 0000BE04 3C800000 */ lis r4, lbl_00011D00@ha
/* 0000BE08 C03D000C */ lfs f1, 0xc(r29)
/* 0000BE0C 92E10218 */ stw r23, 0x218(r1)
/* 0000BE10 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000BE14 C8640000 */ lfd f3, lbl_00011D00@l(r4)
/* 0000BE18 90010214 */ stw r0, 0x214(r1)
/* 0000BE1C FC400890 */ fmr f2, f1
/* 0000BE20 C8010218 */ lfd f0, 0x218(r1)
/* 0000BE24 92E10210 */ stw r23, 0x210(r1)
/* 0000BE28 ECC01828 */ fsubs f6, f0, f3
/* 0000BE2C C0F80004 */ lfs f7, 4(r24)
/* 0000BE30 C8A30000 */ lfd f5, lbl_00011D00@l(r3)
/* 0000BE34 C8810210 */ lfd f4, 0x210(r1)
/* 0000BE38 ECC7302A */ fadds f6, f7, f6
/* 0000BE3C EC842828 */ fsubs f4, f4, f5
/* 0000BE40 C0780008 */ lfs f3, 8(r24)
/* 0000BE44 C01D0094 */ lfs f0, 0x94(r29)
/* 0000BE48 EFC30028 */ fsubs f30, f3, f0
/* 0000BE4C EFE6202A */ fadds f31, f6, f4
/* 0000BE50 4BFF4339 */ bl set_text_scale
/* 0000BE54 FC20F890 */ fmr f1, f31
/* 0000BE58 FC40F090 */ fmr f2, f30
/* 0000BE5C 4BFF432D */ bl set_text_pos
/* 0000BE60 2C1B0000 */ cmpwi r27, 0
/* 0000BE64 4082000C */ bne lbl_0000BE70
/* 0000BE68 389C3D30 */ addi r4, r28, 0x3d30
/* 0000BE6C 48000008 */ b lbl_0000BE74
lbl_0000BE70:
/* 0000BE70 389C3D40 */ addi r4, r28, 0x3d40
lbl_0000BE74:
/* 0000BE74 4CC63182 */ crclr 6
/* 0000BE78 387C3D50 */ addi r3, r28, 0x3d50
/* 0000BE7C 4BFF430D */ bl func_80072AC0
/* 0000BE80 38600000 */ li r3, 0
/* 0000BE84 4BFF4305 */ bl set_text_add_color
/* 0000BE88 387A2000 */ addi r3, r26, 0x2000
/* 0000BE8C 4BFF42FD */ bl set_text_mul_color
/* 0000BE90 C01D0070 */ lfs f0, 0x70(r29)
/* 0000BE94 EC20F82A */ fadds f1, f0, f31
/* 0000BE98 EC40F02A */ fadds f2, f0, f30
/* 0000BE9C 4BFF42ED */ bl set_text_pos
/* 0000BEA0 2C1B0000 */ cmpwi r27, 0
/* 0000BEA4 4082000C */ bne lbl_0000BEB0
/* 0000BEA8 389C3D30 */ addi r4, r28, 0x3d30
/* 0000BEAC 48000008 */ b lbl_0000BEB4
lbl_0000BEB0:
/* 0000BEB0 389C3D40 */ addi r4, r28, 0x3d40
lbl_0000BEB4:
/* 0000BEB4 4CC63182 */ crclr 6
/* 0000BEB8 387C3D50 */ addi r3, r28, 0x3d50
/* 0000BEBC 4BFF42CD */ bl func_80072AC0
lbl_0000BEC0:
/* 0000BEC0 3B7B0001 */ addi r27, r27, 1
/* 0000BEC4 2C1B0002 */ cmpwi r27, 2
/* 0000BEC8 4180FE84 */ blt lbl_0000BD4C
lbl_0000BECC:
/* 0000BECC BA810220 */ lmw r20, 0x220(r1)
/* 0000BED0 80010264 */ lwz r0, 0x264(r1)
/* 0000BED4 CBE10258 */ lfd f31, 0x258(r1)
/* 0000BED8 CBC10250 */ lfd f30, 0x250(r1)
/* 0000BEDC 7C0803A6 */ mtlr r0
/* 0000BEE0 38210260 */ addi r1, r1, 0x260
/* 0000BEE4 4E800020 */ blr 
lbl_0000BEE8:
/* 0000BEE8 7C0802A6 */ mflr r0
/* 0000BEEC 3C800000 */ lis r4, lbl_802F1FB0@ha
/* 0000BEF0 90010004 */ stw r0, 4(r1)
/* 0000BEF4 38840000 */ addi r4, r4, lbl_802F1FB0@l
/* 0000BEF8 3CA00000 */ lis r5, lbl_802F1FAC@ha
/* 0000BEFC 9421FF40 */ stwu r1, -0xc0(r1)
/* 0000BF00 DBE100B8 */ stfd f31, 0xb8(r1)
/* 0000BF04 DBC100B0 */ stfd f30, 0xb0(r1)
/* 0000BF08 BE210074 */ stmw r17, 0x74(r1)
/* 0000BF0C 3BC30000 */ addi r30, r3, 0
/* 0000BF10 80840000 */ lwz r4, 0(r4)
/* 0000BF14 80050000 */ lwz r0, lbl_802F1FAC@l(r5)
/* 0000BF18 38A4FFFF */ addi r5, r4, -1  ;# fixed addi
/* 0000BF1C 7C002800 */ cmpw r0, r5
/* 0000BF20 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000BF24 3BE40000 */ addi r31, r4, lbl_00011CB0@l
/* 0000BF28 40800008 */ bge lbl_0000BF30
/* 0000BF2C 48000008 */ b lbl_0000BF34
lbl_0000BF30:
/* 0000BF30 7CA02B78 */ mr r0, r5
lbl_0000BF34:
/* 0000BF34 3C800000 */ lis r4, lbl_8027CE24@ha
/* 0000BF38 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 0000BF3C 54051838 */ slwi r5, r0, 3
/* 0000BF40 38040000 */ addi r0, r4, lbl_8027CE24@l
/* 0000BF44 7C002A14 */ add r0, r0, r5
/* 0000BF48 3B030000 */ addi r24, r3, lbl_802F1FB4@l
/* 0000BF4C 90180000 */ stw r0, 0(r24)
/* 0000BF50 7FC3F378 */ mr r3, r30
/* 0000BF54 4BFFE91D */ bl lbl_0000A870
/* 0000BF58 C01E0040 */ lfs f0, 0x40(r30)
/* 0000BF5C 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000BF60 3C800000 */ lis r4, lbl_802F1FA8@ha
/* 0000BF64 D001001C */ stfs f0, 0x1c(r1)
/* 0000BF68 3A230000 */ addi r17, r3, unpausedFrameCounter@l
/* 0000BF6C 3800FFFF */ li r0, -1
/* 0000BF70 C01E0044 */ lfs f0, 0x44(r30)
/* 0000BF74 3A840000 */ addi r20, r4, lbl_802F1FA8@l
/* 0000BF78 3A400000 */ li r18, 0
/* 0000BF7C D0010020 */ stfs f0, 0x20(r1)
/* 0000BF80 3EE000C1 */ lis r23, 0xc1
/* 0000BF84 3EC00100 */ lis r22, 0x100
/* 0000BF88 C01F0008 */ lfs f0, 8(r31)
/* 0000BF8C 3EA00040 */ lis r21, 0x40
/* 0000BF90 D0010024 */ stfs f0, 0x24(r1)
/* 0000BF94 C01F0008 */ lfs f0, 8(r31)
/* 0000BF98 D0010028 */ stfs f0, 0x28(r1)
/* 0000BF9C C01F000C */ lfs f0, 0xc(r31)
/* 0000BFA0 D001002C */ stfs f0, 0x2c(r1)
/* 0000BFA4 C01F000C */ lfs f0, 0xc(r31)
/* 0000BFA8 D0010030 */ stfs f0, 0x30(r1)
/* 0000BFAC A87E0068 */ lha r3, 0x68(r30)
/* 0000BFB0 90610034 */ stw r3, 0x34(r1)
/* 0000BFB4 C01E006C */ lfs f0, 0x6c(r30)
/* 0000BFB8 D0010038 */ stfs f0, 0x38(r1)
/* 0000BFBC 9001003C */ stw r0, 0x3c(r1)
/* 0000BFC0 801E0074 */ lwz r0, 0x74(r30)
/* 0000BFC4 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 0000BFC8 6000000A */ ori r0, r0, 0xa
/* 0000BFCC 90010040 */ stw r0, 0x40(r1)
lbl_0000BFD0:
/* 0000BFD0 80980000 */ lwz r4, 0(r24)
/* 0000BFD4 7E539378 */ mr r19, r18
/* 0000BFD8 80640004 */ lwz r3, 4(r4)
/* 0000BFDC 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 0000BFE0 41820008 */ beq lbl_0000BFE8
/* 0000BFE4 3A730003 */ addi r19, r19, 3
lbl_0000BFE8:
/* 0000BFE8 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 0000BFEC 41820008 */ beq lbl_0000BFF4
/* 0000BFF0 3A600006 */ li r19, 6
lbl_0000BFF4:
/* 0000BFF4 801E0048 */ lwz r0, 0x48(r30)
/* 0000BFF8 2C000001 */ cmpwi r0, 1
/* 0000BFFC 41820010 */ beq lbl_0000C00C
/* 0000C000 A8040002 */ lha r0, 2(r4)
/* 0000C004 7C120000 */ cmpw r18, r0
/* 0000C008 41820010 */ beq lbl_0000C018
lbl_0000C00C:
/* 0000C00C 38B7C0C0 */ addi r5, r23, -16192  ;# fixed addi
/* 0000C010 38C0FFFF */ li r6, -1
/* 0000C014 4800000C */ b lbl_0000C020
lbl_0000C018:
/* 0000C018 38B6FFFF */ addi r5, r22, -1  ;# fixed addi
/* 0000C01C 7C060378 */ mr r6, r0
lbl_0000C020:
/* 0000C020 5679103A */ slwi r25, r19, 2
/* 0000C024 7C7FCA14 */ add r3, r31, r25
/* 0000C028 80630100 */ lwz r3, 0x100(r3)
/* 0000C02C 56601838 */ slwi r0, r19, 3
/* 0000C030 7C9F0214 */ add r4, r31, r0
/* 0000C034 9061000C */ stw r3, 0xc(r1)
/* 0000C038 7C069000 */ cmpw r6, r18
/* 0000C03C C05E0004 */ lfs f2, 4(r30)
/* 0000C040 C03F016C */ lfs f1, 0x16c(r31)
/* 0000C044 C00400B8 */ lfs f0, 0xb8(r4)
/* 0000C048 EC220828 */ fsubs f1, f2, f1
/* 0000C04C EC01002A */ fadds f0, f1, f0
/* 0000C050 D0010010 */ stfs f0, 0x10(r1)
/* 0000C054 C05E0008 */ lfs f2, 8(r30)
/* 0000C058 C03F0170 */ lfs f1, 0x170(r31)
/* 0000C05C C00400BC */ lfs f0, 0xbc(r4)
/* 0000C060 EC220828 */ fsubs f1, f2, f1
/* 0000C064 EC01002A */ fadds f0, f1, f0
/* 0000C068 D0010014 */ stfs f0, 0x14(r1)
/* 0000C06C 4082000C */ bne lbl_0000C078
/* 0000C070 C83F0178 */ lfd f1, 0x178(r31)
/* 0000C074 48000008 */ b lbl_0000C07C
lbl_0000C078:
/* 0000C078 C83F0180 */ lfd f1, 0x180(r31)
lbl_0000C07C:
/* 0000C07C C01E004C */ lfs f0, 0x4c(r30)
/* 0000C080 38000000 */ li r0, 0
/* 0000C084 3861000C */ addi r3, r1, 0xc
/* 0000C088 FC00082A */ fadd f0, f0, f1
/* 0000C08C FC000018 */ frsp f0, f0
/* 0000C090 D0010018 */ stfs f0, 0x18(r1)
/* 0000C094 C03F0010 */ lfs f1, 0x10(r31)
/* 0000C098 C01E006C */ lfs f0, 0x6c(r30)
/* 0000C09C EC010032 */ fmuls f0, f1, f0
/* 0000C0A0 FC00001E */ fctiwz f0, f0
/* 0000C0A4 D8010068 */ stfd f0, 0x68(r1)
/* 0000C0A8 8081006C */ lwz r4, 0x6c(r1)
/* 0000C0AC 5484C00E */ slwi r4, r4, 0x18
/* 0000C0B0 7C842B78 */ or r4, r4, r5
/* 0000C0B4 90810044 */ stw r4, 0x44(r1)
/* 0000C0B8 90010048 */ stw r0, 0x48(r1)
/* 0000C0BC 4BFF40CD */ bl draw_naomi_sprite
/* 0000C0C0 801E0048 */ lwz r0, 0x48(r30)
/* 0000C0C4 2C000001 */ cmpwi r0, 1
/* 0000C0C8 41820014 */ beq lbl_0000C0DC
/* 0000C0CC 80780000 */ lwz r3, 0(r24)
/* 0000C0D0 A8030002 */ lha r0, 2(r3)
/* 0000C0D4 7C120000 */ cmpw r18, r0
/* 0000C0D8 4182000C */ beq lbl_0000C0E4
lbl_0000C0DC:
/* 0000C0DC 38954040 */ addi r4, r21, 0x4040
/* 0000C0E0 48000008 */ b lbl_0000C0E8
lbl_0000C0E4:
/* 0000C0E4 3896FFFF */ addi r4, r22, -1  ;# fixed addi
lbl_0000C0E8:
/* 0000C0E8 7C7FCA14 */ add r3, r31, r25
/* 0000C0EC 80030148 */ lwz r0, 0x148(r3)
/* 0000C0F0 2C120000 */ cmpwi r18, 0
/* 0000C0F4 9001000C */ stw r0, 0xc(r1)
/* 0000C0F8 C0210010 */ lfs f1, 0x10(r1)
/* 0000C0FC C01F0188 */ lfs f0, 0x188(r31)
/* 0000C100 EC01002A */ fadds f0, f1, f0
/* 0000C104 D0010010 */ stfs f0, 0x10(r1)
/* 0000C108 41820014 */ beq lbl_0000C11C
/* 0000C10C 2C120002 */ cmpwi r18, 2
/* 0000C110 4182000C */ beq lbl_0000C11C
/* 0000C114 2C130006 */ cmpwi r19, 6
/* 0000C118 41800018 */ blt lbl_0000C130
lbl_0000C11C:
/* 0000C11C C0210014 */ lfs f1, 0x14(r1)
/* 0000C120 C01F0188 */ lfs f0, 0x188(r31)
/* 0000C124 EC010028 */ fsubs f0, f1, f0
/* 0000C128 D0010014 */ stfs f0, 0x14(r1)
/* 0000C12C 48000014 */ b lbl_0000C140
lbl_0000C130:
/* 0000C130 C0210014 */ lfs f1, 0x14(r1)
/* 0000C134 C01F0188 */ lfs f0, 0x188(r31)
/* 0000C138 EC01002A */ fadds f0, f1, f0
/* 0000C13C D0010014 */ stfs f0, 0x14(r1)
lbl_0000C140:
/* 0000C140 C0210018 */ lfs f1, 0x18(r1)
/* 0000C144 C81F0190 */ lfd f0, 0x190(r31)
/* 0000C148 FC010028 */ fsub f0, f1, f0
/* 0000C14C FC000018 */ frsp f0, f0
/* 0000C150 D0010018 */ stfs f0, 0x18(r1)
/* 0000C154 C03F0010 */ lfs f1, 0x10(r31)
/* 0000C158 C01E006C */ lfs f0, 0x6c(r30)
/* 0000C15C EC010032 */ fmuls f0, f1, f0
/* 0000C160 FC00001E */ fctiwz f0, f0
/* 0000C164 D8010068 */ stfd f0, 0x68(r1)
/* 0000C168 8001006C */ lwz r0, 0x6c(r1)
/* 0000C16C 5400C00E */ slwi r0, r0, 0x18
/* 0000C170 7C002378 */ or r0, r0, r4
/* 0000C174 90010044 */ stw r0, 0x44(r1)
/* 0000C178 801E0048 */ lwz r0, 0x48(r30)
/* 0000C17C 2C000002 */ cmpwi r0, 2
/* 0000C180 40820050 */ bne lbl_0000C1D0
/* 0000C184 80140000 */ lwz r0, 0(r20)
/* 0000C188 2C000000 */ cmpwi r0, 0
/* 0000C18C 40820044 */ bne lbl_0000C1D0
/* 0000C190 80780000 */ lwz r3, 0(r24)
/* 0000C194 A8030002 */ lha r0, 2(r3)
/* 0000C198 7C120000 */ cmpw r18, r0
/* 0000C19C 40820034 */ bne lbl_0000C1D0
/* 0000C1A0 80110000 */ lwz r0, 0(r17)
/* 0000C1A4 5403482C */ slwi r3, r0, 9
/* 0000C1A8 4BFF3FE1 */ bl mathutil_sin
/* 0000C1AC FC400A10 */ fabs f2, f1
/* 0000C1B0 C83F0030 */ lfd f1, 0x30(r31)
/* 0000C1B4 C81F0198 */ lfd f0, 0x198(r31)
/* 0000C1B8 FC211028 */ fsub f1, f1, f2
/* 0000C1BC FC000072 */ fmul f0, f0, f1
/* 0000C1C0 FC00001E */ fctiwz f0, f0
/* 0000C1C4 D8010068 */ stfd f0, 0x68(r1)
/* 0000C1C8 8081006C */ lwz r4, 0x6c(r1)
/* 0000C1CC 48000008 */ b lbl_0000C1D4
lbl_0000C1D0:
/* 0000C1D0 38800000 */ li r4, 0
lbl_0000C1D4:
/* 0000C1D4 5483801E */ slwi r3, r4, 0x10
/* 0000C1D8 5480402E */ slwi r0, r4, 8
/* 0000C1DC 7C600378 */ or r0, r3, r0
/* 0000C1E0 7C800378 */ or r0, r4, r0
/* 0000C1E4 90010048 */ stw r0, 0x48(r1)
/* 0000C1E8 3861000C */ addi r3, r1, 0xc
/* 0000C1EC 4BFF3F9D */ bl draw_naomi_sprite
/* 0000C1F0 3A520001 */ addi r18, r18, 1
/* 0000C1F4 2C120002 */ cmpwi r18, 2
/* 0000C1F8 4081FDD8 */ ble lbl_0000BFD0
/* 0000C1FC 3C600000 */ lis r3, modeCtrl@ha
/* 0000C200 38630000 */ addi r3, r3, modeCtrl@l
/* 0000C204 3A430008 */ addi r18, r3, 8
/* 0000C208 80030008 */ lwz r0, 8(r3)
/* 0000C20C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 0000C210 3A830000 */ addi r20, r3, lbl_802F1FB4@l
/* 0000C214 54000774 */ rlwinm r0, r0, 0, 0x1d, 0x1a
/* 0000C218 90120000 */ stw r0, 0(r18)
/* 0000C21C 80B40000 */ lwz r5, 0(r20)
/* 0000C220 80720000 */ lwz r3, 0(r18)
/* 0000C224 38850004 */ addi r4, r5, 4
/* 0000C228 80050004 */ lwz r0, 4(r5)
/* 0000C22C 7C600378 */ or r0, r3, r0
/* 0000C230 90120000 */ stw r0, 0(r18)
/* 0000C234 A8650002 */ lha r3, 2(r5)
/* 0000C238 80840000 */ lwz r4, 0(r4)
/* 0000C23C 4BFF3F4D */ bl course_floor_count
/* 0000C240 80940000 */ lwz r4, 0(r20)
/* 0000C244 7C711B78 */ mr r17, r3
/* 0000C248 80720000 */ lwz r3, 0(r18)
/* 0000C24C 80040004 */ lwz r0, 4(r4)
/* 0000C250 7C600078 */ andc r0, r3, r0
/* 0000C254 90120000 */ stw r0, 0(r18)
/* 0000C258 4BFF3F31 */ bl reset_text_draw_settings
/* 0000C25C 887E0001 */ lbz r3, 1(r30)
/* 0000C260 4BFF3F29 */ bl set_text_font
/* 0000C264 C03E004C */ lfs f1, 0x4c(r30)
/* 0000C268 C81F0058 */ lfd f0, 0x58(r31)
/* 0000C26C FC210028 */ fsub f1, f1, f0
/* 0000C270 FC200818 */ frsp f1, f1
/* 0000C274 4BFF3F15 */ bl func_80071B1C
/* 0000C278 3C600000 */ lis r3, lbl_00016484@ha
/* 0000C27C 3B830000 */ addi r28, r3, lbl_00016484@l
/* 0000C280 3CA00000 */ lis r5, lbl_802F1FA8@ha
/* 0000C284 3C800000 */ lis r4, unpausedFrameCounter@ha
/* 0000C288 3C606666 */ lis r3, 0x6666
/* 0000C28C 3AB1FFFF */ addi r21, r17, -1  ;# fixed addi
/* 0000C290 3B050000 */ addi r24, r5, lbl_802F1FA8@l
/* 0000C294 3B240000 */ addi r25, r4, unpausedFrameCounter@l
/* 0000C298 3B436667 */ addi r26, r3, 0x6667
/* 0000C29C 3A600000 */ li r19, 0
/* 0000C2A0 3EE000C1 */ lis r23, 0xc1
/* 0000C2A4 3EC00081 */ lis r22, 0x81
/* 0000C2A8 3F604330 */ lis r27, 0x4330
/* 0000C2AC 3FA00020 */ lis r29, 0x20
lbl_0000C2B0:
/* 0000C2B0 801E0048 */ lwz r0, 0x48(r30)
/* 0000C2B4 3A200000 */ li r17, 0
/* 0000C2B8 2C000001 */ cmpwi r0, 1
/* 0000C2BC 41820028 */ beq lbl_0000C2E4
/* 0000C2C0 7C13A800 */ cmpw r19, r21
/* 0000C2C4 41810020 */ bgt lbl_0000C2E4
/* 0000C2C8 80B40000 */ lwz r5, 0(r20)
/* 0000C2CC 38930001 */ addi r4, r19, 1
/* 0000C2D0 A8650002 */ lha r3, 2(r5)
/* 0000C2D4 80A50004 */ lwz r5, 4(r5)
/* 0000C2D8 4BFF3EB1 */ bl is_floor_visited
/* 0000C2DC 2C030000 */ cmpwi r3, 0
/* 0000C2E0 40820018 */ bne lbl_0000C2F8
lbl_0000C2E4:
/* 0000C2E4 38768000 */ addi r3, r22, -32768  ;# fixed addi
/* 0000C2E8 4BFF3EA1 */ bl set_text_mul_color
/* 0000C2EC C03F01A0 */ lfs f1, 0x1a0(r31)
/* 0000C2F0 4BFF3E99 */ bl set_text_opacity
/* 0000C2F4 48000014 */ b lbl_0000C308
lbl_0000C2F8:
/* 0000C2F8 3877C000 */ addi r3, r23, -16384  ;# fixed addi
/* 0000C2FC 4BFF3E8D */ bl set_text_mul_color
/* 0000C300 C03F000C */ lfs f1, 0xc(r31)
/* 0000C304 4BFF3E85 */ bl set_text_opacity
lbl_0000C308:
/* 0000C308 801E0048 */ lwz r0, 0x48(r30)
/* 0000C30C 2C000002 */ cmpwi r0, 2
/* 0000C310 40820050 */ bne lbl_0000C360
/* 0000C314 80180000 */ lwz r0, 0(r24)
/* 0000C318 2C000002 */ cmpwi r0, 2
/* 0000C31C 40820044 */ bne lbl_0000C360
/* 0000C320 80740000 */ lwz r3, 0(r20)
/* 0000C324 A8630000 */ lha r3, 0(r3)
/* 0000C328 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000C32C 7C130000 */ cmpw r19, r0
/* 0000C330 40820030 */ bne lbl_0000C360
/* 0000C334 80190000 */ lwz r0, 0(r25)
/* 0000C338 5403482C */ slwi r3, r0, 9
/* 0000C33C 4BFF3E4D */ bl mathutil_sin
/* 0000C340 FC200A10 */ fabs f1, f1
/* 0000C344 C81F00B0 */ lfd f0, 0xb0(r31)
/* 0000C348 3A200001 */ li r17, 1
/* 0000C34C FC000072 */ fmul f0, f0, f1
/* 0000C350 FC00001E */ fctiwz f0, f0
/* 0000C354 D8010068 */ stfd f0, 0x68(r1)
/* 0000C358 8241006C */ lwz r18, 0x6c(r1)
/* 0000C35C 48000008 */ b lbl_0000C364
lbl_0000C360:
/* 0000C360 3A400000 */ li r18, 0
lbl_0000C364:
/* 0000C364 5643801E */ slwi r3, r18, 0x10
/* 0000C368 5640402E */ slwi r0, r18, 8
/* 0000C36C 7C600378 */ or r0, r3, r0
/* 0000C370 7E430378 */ or r3, r18, r0
/* 0000C374 4BFF3E15 */ bl set_text_add_color
/* 0000C378 7CBA9896 */ mulhw r5, r26, r19
/* 0000C37C C07E0004 */ lfs f3, 4(r30)
/* 0000C380 C05F016C */ lfs f2, 0x16c(r31)
/* 0000C384 C03E0008 */ lfs f1, 8(r30)
/* 0000C388 C01F0170 */ lfs f0, 0x170(r31)
/* 0000C38C 7CA01670 */ srawi r0, r5, 2
/* 0000C390 EC431028 */ fsubs f2, f3, f2
/* 0000C394 54030FFE */ srwi r3, r0, 0x1f
/* 0000C398 C07F01A4 */ lfs f3, 0x1a4(r31)
/* 0000C39C 7C001A14 */ add r0, r0, r3
/* 0000C3A0 EC010028 */ fsubs f0, f1, f0
/* 0000C3A4 1C80000A */ mulli r4, r0, 0xa
/* 0000C3A8 ECA3102A */ fadds f5, f3, f2
/* 0000C3AC EC43002A */ fadds f2, f3, f0
/* 0000C3B0 7CA01670 */ srawi r0, r5, 2
/* 0000C3B4 54030FFE */ srwi r3, r0, 0x1f
/* 0000C3B8 7C001A14 */ add r0, r0, r3
/* 0000C3BC 7C849850 */ subf r4, r4, r19
/* 0000C3C0 54832834 */ slwi r3, r4, 5
/* 0000C3C4 54002834 */ slwi r0, r0, 5
/* 0000C3C8 6C638000 */ xoris r3, r3, 0x8000
/* 0000C3CC 9061006C */ stw r3, 0x6c(r1)
/* 0000C3D0 6C008000 */ xoris r0, r0, 0x8000
/* 0000C3D4 3C800000 */ lis r4, lbl_00011D00@ha
/* 0000C3D8 90010064 */ stw r0, 0x64(r1)
/* 0000C3DC 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000C3E0 C8840000 */ lfd f4, lbl_00011D00@l(r4)
/* 0000C3E4 93610068 */ stw r27, 0x68(r1)
/* 0000C3E8 C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000C3EC 93610060 */ stw r27, 0x60(r1)
/* 0000C3F0 C8610068 */ lfd f3, 0x68(r1)
/* 0000C3F4 C8010060 */ lfd f0, 0x60(r1)
/* 0000C3F8 EC632028 */ fsubs f3, f3, f4
/* 0000C3FC EC000828 */ fsubs f0, f0, f1
/* 0000C400 EFE5182A */ fadds f31, f5, f3
/* 0000C404 EFC2002A */ fadds f30, f2, f0
/* 0000C408 FC20F890 */ fmr f1, f31
/* 0000C40C FC40F090 */ fmr f2, f30
/* 0000C410 4BFF3D79 */ bl set_text_pos
/* 0000C414 387C0000 */ addi r3, r28, 0
/* 0000C418 4CC63182 */ crclr 6
/* 0000C41C 38930001 */ addi r4, r19, 1
/* 0000C420 4BFF3D69 */ bl func_80072AC0
/* 0000C424 38600000 */ li r3, 0
/* 0000C428 4BFF3D61 */ bl set_text_add_color
/* 0000C42C 387D2000 */ addi r3, r29, 0x2000
/* 0000C430 4BFF3D59 */ bl set_text_mul_color
/* 0000C434 C01F0070 */ lfs f0, 0x70(r31)
/* 0000C438 EC20F82A */ fadds f1, f0, f31
/* 0000C43C EC40F02A */ fadds f2, f0, f30
/* 0000C440 4BFF3D49 */ bl set_text_pos
/* 0000C444 387C0000 */ addi r3, r28, 0
/* 0000C448 4CC63182 */ crclr 6
/* 0000C44C 38930001 */ addi r4, r19, 1
/* 0000C450 4BFF3D39 */ bl func_80072AC0
/* 0000C454 2C110000 */ cmpwi r17, 0
/* 0000C458 41820098 */ beq lbl_0000C4F0
/* 0000C45C 38000408 */ li r0, 0x408
/* 0000C460 9001000C */ stw r0, 0xc(r1)
/* 0000C464 7E430E70 */ srawi r3, r18, 1
/* 0000C468 38030080 */ addi r0, r3, 0x80
/* 0000C46C C01F01A8 */ lfs f0, 0x1a8(r31)
/* 0000C470 5404402E */ slwi r4, r0, 8
/* 0000C474 38000000 */ li r0, 0
/* 0000C478 EC00F82A */ fadds f0, f0, f31
/* 0000C47C 3861000C */ addi r3, r1, 0xc
/* 0000C480 D0010010 */ stfs f0, 0x10(r1)
/* 0000C484 C01F01AC */ lfs f0, 0x1ac(r31)
/* 0000C488 EC00F02A */ fadds f0, f0, f30
/* 0000C48C D0010014 */ stfs f0, 0x14(r1)
/* 0000C490 C03E004C */ lfs f1, 0x4c(r30)
/* 0000C494 C81F01B0 */ lfd f0, 0x1b0(r31)
/* 0000C498 FC010028 */ fsub f0, f1, f0
/* 0000C49C FC000018 */ frsp f0, f0
/* 0000C4A0 D0010018 */ stfs f0, 0x18(r1)
/* 0000C4A4 C01F01B8 */ lfs f0, 0x1b8(r31)
/* 0000C4A8 D001001C */ stfs f0, 0x1c(r1)
/* 0000C4AC C01F01BC */ lfs f0, 0x1bc(r31)
/* 0000C4B0 D0010020 */ stfs f0, 0x20(r1)
/* 0000C4B4 C01E006C */ lfs f0, 0x6c(r30)
/* 0000C4B8 D0010038 */ stfs f0, 0x38(r1)
/* 0000C4BC C03F0010 */ lfs f1, 0x10(r31)
/* 0000C4C0 C01E006C */ lfs f0, 0x6c(r30)
/* 0000C4C4 EC010032 */ fmuls f0, f1, f0
/* 0000C4C8 FC00001E */ fctiwz f0, f0
/* 0000C4CC D8010060 */ stfd f0, 0x60(r1)
/* 0000C4D0 80A10064 */ lwz r5, 0x64(r1)
/* 0000C4D4 54A5C00E */ slwi r5, r5, 0x18
/* 0000C4D8 64A500FF */ oris r5, r5, 0xff
/* 0000C4DC 60A500FF */ ori r5, r5, 0xff
/* 0000C4E0 7CA42378 */ or r4, r5, r4
/* 0000C4E4 90810044 */ stw r4, 0x44(r1)
/* 0000C4E8 90010048 */ stw r0, 0x48(r1)
/* 0000C4EC 4BFF3C9D */ bl draw_naomi_sprite
lbl_0000C4F0:
/* 0000C4F0 3A730001 */ addi r19, r19, 1
/* 0000C4F4 2C130032 */ cmpwi r19, 0x32
/* 0000C4F8 4180FDB8 */ blt lbl_0000C2B0
/* 0000C4FC BA210074 */ lmw r17, 0x74(r1)
/* 0000C500 800100C4 */ lwz r0, 0xc4(r1)
/* 0000C504 CBE100B8 */ lfd f31, 0xb8(r1)
/* 0000C508 CBC100B0 */ lfd f30, 0xb0(r1)
/* 0000C50C 7C0803A6 */ mtlr r0
/* 0000C510 382100C0 */ addi r1, r1, 0xc0
/* 0000C514 4E800020 */ blr 
lbl_0000C518:
/* 0000C518 7C0802A6 */ mflr r0
/* 0000C51C 3CA00000 */ lis r5, lbl_00012730@ha
/* 0000C520 90010004 */ stw r0, 4(r1)
/* 0000C524 38C50000 */ addi r6, r5, lbl_00012730@l
/* 0000C528 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000C52C 80040048 */ lwz r0, 0x48(r4)
/* 0000C530 28000008 */ cmplwi r0, 8
/* 0000C534 4181042C */ bgt lbl_0000C960
/* 0000C538 3CA00000 */ lis r5, lbl_0001681C@ha
/* 0000C53C 38A50000 */ addi r5, r5, lbl_0001681C@l
/* 0000C540 5400103A */ slwi r0, r0, 2
/* 0000C544 7C05002E */ lwzx r0, r5, r0
/* 0000C548 7C0903A6 */ mtctr r0
/* 0000C54C 4E800420 */ bctr 
lbl_0000C550:
/* 0000C550 2C030003 */ cmpwi r3, 3
/* 0000C554 3CA00000 */ lis r5, lbl_801EED50@ha
/* 0000C558 38A50000 */ addi r5, r5, lbl_801EED50@l
/* 0000C55C 41820040 */ beq lbl_0000C59C
/* 0000C560 40800010 */ bge lbl_0000C570
/* 0000C564 2C030000 */ cmpwi r3, 0
/* 0000C568 40800014 */ bge lbl_0000C57C
/* 0000C56C 480003F4 */ b lbl_0000C960
lbl_0000C570:
/* 0000C570 2C030005 */ cmpwi r3, 5
/* 0000C574 408003EC */ bge lbl_0000C960
/* 0000C578 48000050 */ b lbl_0000C5C8
lbl_0000C57C:
/* 0000C57C 7C651A14 */ add r3, r5, r3
/* 0000C580 4CC63182 */ crclr 6
/* 0000C584 88A30031 */ lbz r5, 0x31(r3)
/* 0000C588 3864008C */ addi r3, r4, 0x8c
/* 0000C58C 388640DC */ addi r4, r6, 0x40dc
/* 0000C590 7CA50774 */ extsb r5, r5
/* 0000C594 4BFF3BF5 */ bl sprintf
/* 0000C598 480003C8 */ b lbl_0000C960
lbl_0000C59C:
/* 0000C59C 8005002C */ lwz r0, 0x2c(r5)
/* 0000C5A0 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 0000C5A4 4182000C */ beq lbl_0000C5B0
/* 0000C5A8 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C5AC 48000008 */ b lbl_0000C5B4
lbl_0000C5B0:
/* 0000C5B0 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C5B4:
/* 0000C5B4 3864008C */ addi r3, r4, 0x8c
/* 0000C5B8 4CC63182 */ crclr 6
/* 0000C5BC 388640E8 */ addi r4, r6, 0x40e8
/* 0000C5C0 4BFF3BC9 */ bl sprintf
/* 0000C5C4 4800039C */ b lbl_0000C960
lbl_0000C5C8:
/* 0000C5C8 8005002C */ lwz r0, 0x2c(r5)
/* 0000C5CC 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 0000C5D0 4182000C */ beq lbl_0000C5DC
/* 0000C5D4 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C5D8 48000008 */ b lbl_0000C5E0
lbl_0000C5DC:
/* 0000C5DC 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C5E0:
/* 0000C5E0 3864008C */ addi r3, r4, 0x8c
/* 0000C5E4 4CC63182 */ crclr 6
/* 0000C5E8 388640E8 */ addi r4, r6, 0x40e8
/* 0000C5EC 4BFF3B9D */ bl sprintf
/* 0000C5F0 48000370 */ b lbl_0000C960
lbl_0000C5F4:
/* 0000C5F4 2C030002 */ cmpwi r3, 2
/* 0000C5F8 3CA00000 */ lis r5, lbl_801EED88@ha
/* 0000C5FC 38A50000 */ addi r5, r5, lbl_801EED88@l
/* 0000C600 41820078 */ beq lbl_0000C678
/* 0000C604 40800014 */ bge lbl_0000C618
/* 0000C608 2C030000 */ cmpwi r3, 0
/* 0000C60C 41820018 */ beq lbl_0000C624
/* 0000C610 4080003C */ bge lbl_0000C64C
/* 0000C614 4800034C */ b lbl_0000C960
lbl_0000C618:
/* 0000C618 2C030004 */ cmpwi r3, 4
/* 0000C61C 40800344 */ bge lbl_0000C960
/* 0000C620 48000084 */ b lbl_0000C6A4
lbl_0000C624:
/* 0000C624 88050000 */ lbz r0, 0(r5)
/* 0000C628 3864008C */ addi r3, r4, 0x8c
/* 0000C62C 388640DC */ addi r4, r6, 0x40dc
/* 0000C630 4CC63182 */ crclr 6
/* 0000C634 7C000774 */ extsb r0, r0
/* 0000C638 7CA50214 */ add r5, r5, r0
/* 0000C63C 88A50001 */ lbz r5, 1(r5)
/* 0000C640 7CA50774 */ extsb r5, r5
/* 0000C644 4BFF3B45 */ bl sprintf
/* 0000C648 48000318 */ b lbl_0000C960
lbl_0000C64C:
/* 0000C64C 80050008 */ lwz r0, 8(r5)
/* 0000C650 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000C654 4182000C */ beq lbl_0000C660
/* 0000C658 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C65C 48000008 */ b lbl_0000C664
lbl_0000C660:
/* 0000C660 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C664:
/* 0000C664 3864008C */ addi r3, r4, 0x8c
/* 0000C668 4CC63182 */ crclr 6
/* 0000C66C 388640E8 */ addi r4, r6, 0x40e8
/* 0000C670 4BFF3B19 */ bl sprintf
/* 0000C674 480002EC */ b lbl_0000C960
lbl_0000C678:
/* 0000C678 80050008 */ lwz r0, 8(r5)
/* 0000C67C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000C680 4182000C */ beq lbl_0000C68C
/* 0000C684 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C688 48000008 */ b lbl_0000C690
lbl_0000C68C:
/* 0000C68C 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C690:
/* 0000C690 3864008C */ addi r3, r4, 0x8c
/* 0000C694 4CC63182 */ crclr 6
/* 0000C698 388640E8 */ addi r4, r6, 0x40e8
/* 0000C69C 4BFF3AED */ bl sprintf
/* 0000C6A0 480002C0 */ b lbl_0000C960
lbl_0000C6A4:
/* 0000C6A4 80050008 */ lwz r0, 8(r5)
/* 0000C6A8 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000C6AC 4182000C */ beq lbl_0000C6B8
/* 0000C6B0 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C6B4 48000008 */ b lbl_0000C6BC
lbl_0000C6B8:
/* 0000C6B8 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C6BC:
/* 0000C6BC 3864008C */ addi r3, r4, 0x8c
/* 0000C6C0 4CC63182 */ crclr 6
/* 0000C6C4 388640E8 */ addi r4, r6, 0x40e8
/* 0000C6C8 4BFF3AC1 */ bl sprintf
/* 0000C6CC 48000294 */ b lbl_0000C960
lbl_0000C6D0:
/* 0000C6D0 2C030001 */ cmpwi r3, 1
/* 0000C6D4 3CA00000 */ lis r5, lbl_801EED88@ha
/* 0000C6D8 38A50000 */ addi r5, r5, lbl_801EED88@l
/* 0000C6DC 4182004C */ beq lbl_0000C728
/* 0000C6E0 40800010 */ bge lbl_0000C6F0
/* 0000C6E4 2C030000 */ cmpwi r3, 0
/* 0000C6E8 40800014 */ bge lbl_0000C6FC
/* 0000C6EC 48000274 */ b lbl_0000C960
lbl_0000C6F0:
/* 0000C6F0 2C030003 */ cmpwi r3, 3
/* 0000C6F4 4080026C */ bge lbl_0000C960
/* 0000C6F8 4800005C */ b lbl_0000C754
lbl_0000C6FC:
/* 0000C6FC 80050008 */ lwz r0, 8(r5)
/* 0000C700 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000C704 4182000C */ beq lbl_0000C710
/* 0000C708 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C70C 48000008 */ b lbl_0000C714
lbl_0000C710:
/* 0000C710 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C714:
/* 0000C714 3864008C */ addi r3, r4, 0x8c
/* 0000C718 4CC63182 */ crclr 6
/* 0000C71C 388640E8 */ addi r4, r6, 0x40e8
/* 0000C720 4BFF3A69 */ bl sprintf
/* 0000C724 4800023C */ b lbl_0000C960
lbl_0000C728:
/* 0000C728 80050008 */ lwz r0, 8(r5)
/* 0000C72C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000C730 4182000C */ beq lbl_0000C73C
/* 0000C734 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C738 48000008 */ b lbl_0000C740
lbl_0000C73C:
/* 0000C73C 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C740:
/* 0000C740 3864008C */ addi r3, r4, 0x8c
/* 0000C744 4CC63182 */ crclr 6
/* 0000C748 388640E8 */ addi r4, r6, 0x40e8
/* 0000C74C 4BFF3A3D */ bl sprintf
/* 0000C750 48000210 */ b lbl_0000C960
lbl_0000C754:
/* 0000C754 80050008 */ lwz r0, 8(r5)
/* 0000C758 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000C75C 4182000C */ beq lbl_0000C768
/* 0000C760 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C764 48000008 */ b lbl_0000C76C
lbl_0000C768:
/* 0000C768 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C76C:
/* 0000C76C 3864008C */ addi r3, r4, 0x8c
/* 0000C770 4CC63182 */ crclr 6
/* 0000C774 388640E8 */ addi r4, r6, 0x40e8
/* 0000C778 4BFF3A11 */ bl sprintf
/* 0000C77C 480001E4 */ b lbl_0000C960
lbl_0000C780:
/* 0000C780 2C030000 */ cmpwi r3, 0
/* 0000C784 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000C788 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000C78C 41820008 */ beq lbl_0000C794
/* 0000C790 480001D0 */ b lbl_0000C960
lbl_0000C794:
/* 0000C794 80030000 */ lwz r0, 0(r3)
/* 0000C798 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000C79C 4182000C */ beq lbl_0000C7A8
/* 0000C7A0 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C7A4 48000008 */ b lbl_0000C7AC
lbl_0000C7A8:
/* 0000C7A8 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C7AC:
/* 0000C7AC 3864008C */ addi r3, r4, 0x8c
/* 0000C7B0 4CC63182 */ crclr 6
/* 0000C7B4 388640E8 */ addi r4, r6, 0x40e8
/* 0000C7B8 4BFF39D1 */ bl sprintf
/* 0000C7BC 480001A4 */ b lbl_0000C960
lbl_0000C7C0:
/* 0000C7C0 3CA00000 */ lis r5, lbl_00011E70@ha
/* 0000C7C4 38E50000 */ addi r7, r5, lbl_00011E70@l
/* 0000C7C8 80A70000 */ lwz r5, 0(r7)
/* 0000C7CC 3D000000 */ lis r8, lbl_802F1BE8@ha
/* 0000C7D0 80070004 */ lwz r0, 4(r7)
/* 0000C7D4 2C030000 */ cmpwi r3, 0
/* 0000C7D8 38680000 */ addi r3, r8, lbl_802F1BE8@l
/* 0000C7DC 90A10024 */ stw r5, 0x24(r1)
/* 0000C7E0 90010028 */ stw r0, 0x28(r1)
/* 0000C7E4 80070008 */ lwz r0, 8(r7)
/* 0000C7E8 9001002C */ stw r0, 0x2c(r1)
/* 0000C7EC 41820008 */ beq lbl_0000C7F4
/* 0000C7F0 48000170 */ b lbl_0000C960
lbl_0000C7F4:
/* 0000C7F4 88030004 */ lbz r0, 4(r3)
/* 0000C7F8 3864008C */ addi r3, r4, 0x8c
/* 0000C7FC 38810024 */ addi r4, r1, 0x24
/* 0000C800 4CC63182 */ crclr 6
/* 0000C804 7C000774 */ extsb r0, r0
/* 0000C808 5400103A */ slwi r0, r0, 2
/* 0000C80C 7CA4002E */ lwzx r5, r4, r0
/* 0000C810 388640E8 */ addi r4, r6, 0x40e8
/* 0000C814 4BFF3975 */ bl sprintf
/* 0000C818 48000148 */ b lbl_0000C960
lbl_0000C81C:
/* 0000C81C 2C030001 */ cmpwi r3, 1
/* 0000C820 3CA00000 */ lis r5, lbl_802F1BF4@ha
/* 0000C824 39250000 */ addi r9, r5, lbl_802F1BF4@l
/* 0000C828 41820030 */ beq lbl_0000C858
/* 0000C82C 40800134 */ bge lbl_0000C960
/* 0000C830 2C030000 */ cmpwi r3, 0
/* 0000C834 40800008 */ bge lbl_0000C83C
/* 0000C838 48000128 */ b lbl_0000C960
lbl_0000C83C:
/* 0000C83C 88A90000 */ lbz r5, 0(r9)
/* 0000C840 3864008C */ addi r3, r4, 0x8c
/* 0000C844 388640DC */ addi r4, r6, 0x40dc
/* 0000C848 4CC63182 */ crclr 6
/* 0000C84C 7CA50774 */ extsb r5, r5
/* 0000C850 4BFF3939 */ bl sprintf
/* 0000C854 4800010C */ b lbl_0000C960
lbl_0000C858:
/* 0000C858 3C600000 */ lis r3, modeCtrl@ha
/* 0000C85C 38630000 */ addi r3, r3, modeCtrl@l
/* 0000C860 80030024 */ lwz r0, 0x24(r3)
/* 0000C864 2C000001 */ cmpwi r0, 1
/* 0000C868 408200F8 */ bne lbl_0000C960
/* 0000C86C 3C600000 */ lis r3, lbl_00011E7C@ha
/* 0000C870 4CC63182 */ crclr 6
/* 0000C874 39030000 */ addi r8, r3, lbl_00011E7C@l
/* 0000C878 80E80000 */ lwz r7, 0(r8)
/* 0000C87C 3864008C */ addi r3, r4, 0x8c
/* 0000C880 80080004 */ lwz r0, 4(r8)
/* 0000C884 38A10010 */ addi r5, r1, 0x10
/* 0000C888 388640E8 */ addi r4, r6, 0x40e8
/* 0000C88C 90E10010 */ stw r7, 0x10(r1)
/* 0000C890 90010014 */ stw r0, 0x14(r1)
/* 0000C894 80C80008 */ lwz r6, 8(r8)
/* 0000C898 8008000C */ lwz r0, 0xc(r8)
/* 0000C89C 90C10018 */ stw r6, 0x18(r1)
/* 0000C8A0 9001001C */ stw r0, 0x1c(r1)
/* 0000C8A4 80080010 */ lwz r0, 0x10(r8)
/* 0000C8A8 90010020 */ stw r0, 0x20(r1)
/* 0000C8AC 88090001 */ lbz r0, 1(r9)
/* 0000C8B0 7C000774 */ extsb r0, r0
/* 0000C8B4 5400103A */ slwi r0, r0, 2
/* 0000C8B8 7CA5002E */ lwzx r5, r5, r0
/* 0000C8BC 4BFF38CD */ bl sprintf
/* 0000C8C0 480000A0 */ b lbl_0000C960
lbl_0000C8C4:
/* 0000C8C4 2C030001 */ cmpwi r3, 1
/* 0000C8C8 3CA00000 */ lis r5, lbl_802F1BFC@ha
/* 0000C8CC 38A50000 */ addi r5, r5, lbl_802F1BFC@l
/* 0000C8D0 4182003C */ beq lbl_0000C90C
/* 0000C8D4 40800010 */ bge lbl_0000C8E4
/* 0000C8D8 2C030000 */ cmpwi r3, 0
/* 0000C8DC 40800014 */ bge lbl_0000C8F0
/* 0000C8E0 48000080 */ b lbl_0000C960
lbl_0000C8E4:
/* 0000C8E4 2C030003 */ cmpwi r3, 3
/* 0000C8E8 40800078 */ bge lbl_0000C960
/* 0000C8EC 4800004C */ b lbl_0000C938
lbl_0000C8F0:
/* 0000C8F0 88A50000 */ lbz r5, 0(r5)
/* 0000C8F4 3864008C */ addi r3, r4, 0x8c
/* 0000C8F8 388640DC */ addi r4, r6, 0x40dc
/* 0000C8FC 4CC63182 */ crclr 6
/* 0000C900 7CA50774 */ extsb r5, r5
/* 0000C904 4BFF3885 */ bl sprintf
/* 0000C908 48000058 */ b lbl_0000C960
lbl_0000C90C:
/* 0000C90C 80050004 */ lwz r0, 4(r5)
/* 0000C910 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000C914 4182000C */ beq lbl_0000C920
/* 0000C918 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C91C 48000008 */ b lbl_0000C924
lbl_0000C920:
/* 0000C920 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C924:
/* 0000C924 3864008C */ addi r3, r4, 0x8c
/* 0000C928 4CC63182 */ crclr 6
/* 0000C92C 388640E8 */ addi r4, r6, 0x40e8
/* 0000C930 4BFF3859 */ bl sprintf
/* 0000C934 4800002C */ b lbl_0000C960
lbl_0000C938:
/* 0000C938 80050004 */ lwz r0, 4(r5)
/* 0000C93C 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000C940 4182000C */ beq lbl_0000C94C
/* 0000C944 38A640E0 */ addi r5, r6, 0x40e0
/* 0000C948 48000008 */ b lbl_0000C950
lbl_0000C94C:
/* 0000C94C 38A640E4 */ addi r5, r6, 0x40e4
lbl_0000C950:
/* 0000C950 3864008C */ addi r3, r4, 0x8c
/* 0000C954 4CC63182 */ crclr 6
/* 0000C958 388640E8 */ addi r4, r6, 0x40e8
/* 0000C95C 4BFF382D */ bl sprintf
lbl_0000C960:
/* 0000C960 80010034 */ lwz r0, 0x34(r1)
/* 0000C964 38210030 */ addi r1, r1, 0x30
/* 0000C968 7C0803A6 */ mtlr r0
/* 0000C96C 4E800020 */ blr 
lbl_0000C970:
/* 0000C970 7C0802A6 */ mflr r0
/* 0000C974 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000C978 90010004 */ stw r0, 4(r1)
/* 0000C97C 3800FFFF */ li r0, -1
/* 0000C980 3CA00000 */ lis r5, lbl_00012730@ha
/* 0000C984 9421FE50 */ stwu r1, -0x1b0(r1)
/* 0000C988 DBE101A8 */ stfd f31, 0x1a8(r1)
/* 0000C98C DBC101A0 */ stfd f30, 0x1a0(r1)
/* 0000C990 DBA10198 */ stfd f29, 0x198(r1)
/* 0000C994 BDC10150 */ stmw r14, 0x150(r1)
/* 0000C998 3BC40000 */ addi r30, r4, lbl_00011CB0@l
/* 0000C99C 38800000 */ li r4, 0
/* 0000C9A0 3BE30000 */ addi r31, r3, 0
/* 0000C9A4 3AA50000 */ addi r21, r5, lbl_00012730@l
/* 0000C9A8 39C00001 */ li r14, 1
/* 0000C9AC C003004C */ lfs f0, 0x4c(r3)
/* 0000C9B0 C83E01E0 */ lfd f1, 0x1e0(r30)
/* 0000C9B4 FC01002A */ fadd f0, f1, f0
/* 0000C9B8 FC000018 */ frsp f0, f0
/* 0000C9BC D00100D4 */ stfs f0, 0xd4(r1)
/* 0000C9C0 908100F0 */ stw r4, 0xf0(r1)
/* 0000C9C4 C01E0008 */ lfs f0, 8(r30)
/* 0000C9C8 D00100E0 */ stfs f0, 0xe0(r1)
/* 0000C9CC C01E0008 */ lfs f0, 8(r30)
/* 0000C9D0 D00100E4 */ stfs f0, 0xe4(r1)
/* 0000C9D4 C01E000C */ lfs f0, 0xc(r30)
/* 0000C9D8 D00100E8 */ stfs f0, 0xe8(r1)
/* 0000C9DC C01E000C */ lfs f0, 0xc(r30)
/* 0000C9E0 D00100EC */ stfs f0, 0xec(r1)
/* 0000C9E4 C01F006C */ lfs f0, 0x6c(r31)
/* 0000C9E8 D00100F4 */ stfs f0, 0xf4(r1)
/* 0000C9EC 900100F8 */ stw r0, 0xf8(r1)
/* 0000C9F0 801F0074 */ lwz r0, 0x74(r31)
/* 0000C9F4 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 0000C9F8 6000000A */ ori r0, r0, 0xa
/* 0000C9FC 900100FC */ stw r0, 0xfc(r1)
/* 0000CA00 4BFFDE71 */ bl lbl_0000A870
/* 0000CA04 3A3540A4 */ addi r17, r21, 0x40a4
/* 0000CA08 801F0048 */ lwz r0, 0x48(r31)
/* 0000CA0C 807540A4 */ lwz r3, 0x40a4(r21)
/* 0000CA10 5400103A */ slwi r0, r0, 2
/* 0000CA14 7C03002E */ lwzx r0, r3, r0
/* 0000CA18 28000000 */ cmplwi r0, 0
/* 0000CA1C 41820960 */ beq lbl_0000D37C
/* 0000CA20 4BFF3769 */ bl reset_text_draw_settings
/* 0000CA24 3C600022 */ lis r3, 0x22
/* 0000CA28 4BFF3761 */ bl func_80071B50
/* 0000CA2C 801F0048 */ lwz r0, 0x48(r31)
/* 0000CA30 3B800000 */ li r28, 0
/* 0000CA34 80910000 */ lwz r4, 0(r17)
/* 0000CA38 5403103A */ slwi r3, r0, 2
/* 0000CA3C 7C84182E */ lwzx r4, r4, r3
/* 0000CA40 4800000C */ b lbl_0000CA4C
lbl_0000CA44:
/* 0000CA44 3B9C0001 */ addi r28, r28, 1
/* 0000CA48 38840004 */ addi r4, r4, 4
lbl_0000CA4C:
/* 0000CA4C 80640000 */ lwz r3, 0(r4)
/* 0000CA50 28030000 */ cmplwi r3, 0
/* 0000CA54 4082FFF0 */ bne lbl_0000CA44
/* 0000CA58 387CFFFF */ addi r3, r28, -1  ;# fixed addi
/* 0000CA5C C85E0060 */ lfd f2, 0x60(r30)
/* 0000CA60 1C630018 */ mulli r3, r3, 0x18
/* 0000CA64 6C638000 */ xoris r3, r3, 0x8000
/* 0000CA68 9061014C */ stw r3, 0x14c(r1)
/* 0000CA6C 3C604330 */ lis r3, 0x4330
/* 0000CA70 3C800000 */ lis r4, lbl_00011D00@ha
/* 0000CA74 90610148 */ stw r3, 0x148(r1)
/* 0000CA78 2C1C0002 */ cmpwi r28, 2
/* 0000CA7C C8240000 */ lfd f1, lbl_00011D00@l(r4)
/* 0000CA80 5784083C */ slwi r4, r28, 1
/* 0000CA84 C8010148 */ lfd f0, 0x148(r1)
/* 0000CA88 EC000828 */ fsubs f0, f0, f1
/* 0000CA8C FC020032 */ fmul f0, f2, f0
/* 0000CA90 FC00001E */ fctiwz f0, f0
/* 0000CA94 D8010140 */ stfd f0, 0x140(r1)
/* 0000CA98 80610144 */ lwz r3, 0x144(r1)
/* 0000CA9C 90610118 */ stw r3, 0x118(r1)
/* 0000CAA0 80610118 */ lwz r3, 0x118(r1)
/* 0000CAA4 7C641850 */ subf r3, r4, r3
/* 0000CAA8 90610118 */ stw r3, 0x118(r1)
/* 0000CAAC 40820010 */ bne lbl_0000CABC
/* 0000CAB0 80610118 */ lwz r3, 0x118(r1)
/* 0000CAB4 3863FFFA */ addi r3, r3, -6  ;# fixed addi
/* 0000CAB8 90610118 */ stw r3, 0x118(r1)
lbl_0000CABC:
/* 0000CABC 2C000005 */ cmpwi r0, 5
/* 0000CAC0 40800018 */ bge lbl_0000CAD8
/* 0000CAC4 2C000003 */ cmpwi r0, 3
/* 0000CAC8 40800008 */ bge lbl_0000CAD0
/* 0000CACC 4800000C */ b lbl_0000CAD8
lbl_0000CAD0:
/* 0000CAD0 3A200028 */ li r17, 0x28
/* 0000CAD4 48000008 */ b lbl_0000CADC
lbl_0000CAD8:
/* 0000CAD8 3A200000 */ li r17, 0
lbl_0000CADC:
/* 0000CADC 55C0103A */ slwi r0, r14, 2
/* 0000CAE0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000CAE4 3AC30000 */ addi r22, r3, lbl_801EEDA8@l
/* 0000CAE8 7C150214 */ add r0, r21, r0
/* 0000CAEC 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000CAF0 9001011C */ stw r0, 0x11c(r1)
/* 0000CAF4 38030000 */ addi r0, r3, unpausedFrameCounter@l
/* 0000CAF8 90010138 */ stw r0, 0x138(r1)
/* 0000CAFC 3811FF04 */ addi r0, r17, -252  ;# fixed addi
/* 0000CB00 3BA00000 */ li r29, 0
/* 0000CB04 8061011C */ lwz r3, 0x11c(r1)
/* 0000CB08 90010134 */ stw r0, 0x134(r1)
/* 0000CB0C 3C000081 */ lis r0, 0x81
/* 0000CB10 9001012C */ stw r0, 0x12c(r1)
/* 0000CB14 3C0000C1 */ lis r0, 0xc1
/* 0000CB18 386340A0 */ addi r3, r3, 0x40a0
/* 0000CB1C 90010130 */ stw r0, 0x130(r1)
/* 0000CB20 3C000100 */ lis r0, 0x100
/* 0000CB24 3A5D0000 */ addi r18, r29, 0
/* 0000CB28 90010128 */ stw r0, 0x128(r1)
/* 0000CB2C 57B7103A */ slwi r23, r29, 2
/* 0000CB30 39D6010C */ addi r14, r22, 0x10c
/* 0000CB34 9061011C */ stw r3, 0x11c(r1)
/* 0000CB38 3A7600F4 */ addi r19, r22, 0xf4
/* 0000CB3C 3DE00001 */ lis r15, 1
/* 0000CB40 3F404330 */ lis r26, 0x4330
/* 0000CB44 3E000020 */ lis r16, 0x20
/* 0000CB48 480005EC */ b lbl_0000D134
lbl_0000CB4C:
/* 0000CB4C 80130000 */ lwz r0, 0(r19)
/* 0000CB50 7C1D0000 */ cmpw r29, r0
/* 0000CB54 40820010 */ bne lbl_0000CB64
/* 0000CB58 80610128 */ lwz r3, 0x128(r1)
/* 0000CB5C 3863FF00 */ addi r3, r3, -256  ;# fixed addi
/* 0000CB60 48000024 */ b lbl_0000CB84
lbl_0000CB64:
/* 0000CB64 80760108 */ lwz r3, 0x108(r22)
/* 0000CB68 2C030000 */ cmpwi r3, 0
/* 0000CB6C 41820010 */ beq lbl_0000CB7C
/* 0000CB70 8061012C */ lwz r3, 0x12c(r1)
/* 0000CB74 38638000 */ addi r3, r3, -32768  ;# fixed addi
/* 0000CB78 4800000C */ b lbl_0000CB84
lbl_0000CB7C:
/* 0000CB7C 80610130 */ lwz r3, 0x130(r1)
/* 0000CB80 3863C000 */ addi r3, r3, -16384  ;# fixed addi
lbl_0000CB84:
/* 0000CB84 7C1D0000 */ cmpw r29, r0
/* 0000CB88 3A830000 */ addi r20, r3, 0
/* 0000CB8C 4082002C */ bne lbl_0000CBB8
/* 0000CB90 80610138 */ lwz r3, 0x138(r1)
/* 0000CB94 80030000 */ lwz r0, 0(r3)
/* 0000CB98 5403482C */ slwi r3, r0, 9
/* 0000CB9C 4BFF35ED */ bl mathutil_sin
/* 0000CBA0 FC400A10 */ fabs f2, f1
/* 0000CBA4 C83E0030 */ lfd f1, 0x30(r30)
/* 0000CBA8 C81E00B0 */ lfd f0, 0xb0(r30)
/* 0000CBAC FC211028 */ fsub f1, f1, f2
/* 0000CBB0 FC200072 */ fmul f1, f0, f1
/* 0000CBB4 48000008 */ b lbl_0000CBBC
lbl_0000CBB8:
/* 0000CBB8 C83E01E8 */ lfd f1, 0x1e8(r30)
lbl_0000CBBC:
/* 0000CBBC 4BFF35CD */ bl __cvt_fp2unsigned
/* 0000CBC0 3B630000 */ addi r27, r3, 0
/* 0000CBC4 38600000 */ li r3, 0
/* 0000CBC8 4BFF35C1 */ bl set_text_add_color
/* 0000CBCC 380000B1 */ li r0, 0xb1
/* 0000CBD0 981F0001 */ stb r0, 1(r31)
/* 0000CBD4 887F0001 */ lbz r3, 1(r31)
/* 0000CBD8 4BFF35B1 */ bl set_text_font
/* 0000CBDC 8081011C */ lwz r4, 0x11c(r1)
/* 0000CBE0 387F008C */ addi r3, r31, 0x8c
/* 0000CBE4 801F0048 */ lwz r0, 0x48(r31)
/* 0000CBE8 80840000 */ lwz r4, 0(r4)
/* 0000CBEC 5400103A */ slwi r0, r0, 2
/* 0000CBF0 7C84002E */ lwzx r4, r4, r0
/* 0000CBF4 7C84B82E */ lwzx r4, r4, r23
/* 0000CBF8 4BFF3591 */ bl strcpy
/* 0000CBFC 38000001 */ li r0, 1
/* 0000CC00 981F0003 */ stb r0, 3(r31)
/* 0000CC04 389F008C */ addi r4, r31, 0x8c
/* 0000CC08 C01E000C */ lfs f0, 0xc(r30)
/* 0000CC0C D01F0040 */ stfs f0, 0x40(r31)
/* 0000CC10 887F0001 */ lbz r3, 1(r31)
/* 0000CC14 4BFF3575 */ bl u_get_jpn_text_width
/* 0000CC18 6C608000 */ xoris r0, r3, 0x8000
/* 0000CC1C C81E01F0 */ lfd f0, 0x1f0(r30)
/* 0000CC20 90010144 */ stw r0, 0x144(r1)
/* 0000CC24 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000CC28 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000CC2C 93410140 */ stw r26, 0x140(r1)
/* 0000CC30 C07F0040 */ lfs f3, 0x40(r31)
/* 0000CC34 C8210140 */ lfd f1, 0x140(r1)
/* 0000CC38 FC211028 */ fsub f1, f1, f2
/* 0000CC3C FC000824 */ fdiv f0, f0, f1
/* 0000CC40 FC001840 */ fcmpo cr0, f0, f3
/* 0000CC44 40800034 */ bge lbl_0000CC78
/* 0000CC48 887F0001 */ lbz r3, 1(r31)
/* 0000CC4C 389F008C */ addi r4, r31, 0x8c
/* 0000CC50 4BFF3539 */ bl u_get_jpn_text_width
/* 0000CC54 6C608000 */ xoris r0, r3, 0x8000
/* 0000CC58 C81E01F0 */ lfd f0, 0x1f0(r30)
/* 0000CC5C 90010144 */ stw r0, 0x144(r1)
/* 0000CC60 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000CC64 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000CC68 93410140 */ stw r26, 0x140(r1)
/* 0000CC6C C8210140 */ lfd f1, 0x140(r1)
/* 0000CC70 FC211028 */ fsub f1, f1, f2
/* 0000CC74 FC600824 */ fdiv f3, f0, f1
lbl_0000CC78:
/* 0000CC78 FC001818 */ frsp f0, f3
/* 0000CC7C 38000000 */ li r0, 0
/* 0000CC80 387F0000 */ addi r3, r31, 0
/* 0000CC84 389F0058 */ addi r4, r31, 0x58
/* 0000CC88 D01F0040 */ stfs f0, 0x40(r31)
/* 0000CC8C 38BF005C */ addi r5, r31, 0x5c
/* 0000CC90 831F0038 */ lwz r24, 0x38(r31)
/* 0000CC94 38DF0060 */ addi r6, r31, 0x60
/* 0000CC98 38FF0064 */ addi r7, r31, 0x64
/* 0000CC9C 901F0038 */ stw r0, 0x38(r31)
/* 0000CCA0 4BFF34E9 */ bl calc_sprite_bounds
/* 0000CCA4 931F0038 */ stw r24, 0x38(r31)
/* 0000CCA8 38600004 */ li r3, 4
/* 0000CCAC 80010118 */ lwz r0, 0x118(r1)
/* 0000CCB0 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000CCB4 987F0003 */ stb r3, 3(r31)
/* 0000CCB8 7C009214 */ add r0, r0, r18
/* 0000CCBC 7CE0BA14 */ add r7, r0, r23
/* 0000CCC0 809F005C */ lwz r4, 0x5c(r31)
/* 0000CCC4 80DF0058 */ lwz r6, 0x58(r31)
/* 0000CCC8 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000CCCC 80010134 */ lwz r0, 0x134(r1)
/* 0000CCD0 7C843A14 */ add r4, r4, r7
/* 0000CCD4 6C848000 */ xoris r4, r4, 0x8000
/* 0000CCD8 7C060214 */ add r0, r6, r0
/* 0000CCDC 9081014C */ stw r4, 0x14c(r1)
/* 0000CCE0 6C008000 */ xoris r0, r0, 0x8000
/* 0000CCE4 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000CCE8 90010144 */ stw r0, 0x144(r1)
/* 0000CCEC 2C1C0002 */ cmpwi r28, 2
/* 0000CCF0 C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000CCF4 93410140 */ stw r26, 0x140(r1)
/* 0000CCF8 93410148 */ stw r26, 0x148(r1)
/* 0000CCFC C8410140 */ lfd f2, 0x140(r1)
/* 0000CD00 C8010148 */ lfd f0, 0x148(r1)
/* 0000CD04 EFC21828 */ fsubs f30, f2, f3
/* 0000CD08 EFA00828 */ fsubs f29, f0, f1
/* 0000CD0C 40820014 */ bne lbl_0000CD20
/* 0000CD10 2C1D0001 */ cmpwi r29, 1
/* 0000CD14 4082000C */ bne lbl_0000CD20
/* 0000CD18 C01E01A4 */ lfs f0, 0x1a4(r30)
/* 0000CD1C EFBD002A */ fadds f29, f29, f0
lbl_0000CD20:
/* 0000CD20 80130000 */ lwz r0, 0(r19)
/* 0000CD24 7C1D0000 */ cmpw r29, r0
/* 0000CD28 40820154 */ bne lbl_0000CE7C
/* 0000CD2C 389F0000 */ addi r4, r31, 0
/* 0000CD30 3861000C */ addi r3, r1, 0xc
/* 0000CD34 38A000BC */ li r5, 0xbc
/* 0000CD38 4BFF3451 */ bl memcpy
/* 0000CD3C 387D0000 */ addi r3, r29, 0
/* 0000CD40 389F0000 */ addi r4, r31, 0
/* 0000CD44 4BFFF7D5 */ bl lbl_0000C518
/* 0000CD48 380000B0 */ li r0, 0xb0
/* 0000CD4C 981F0001 */ stb r0, 1(r31)
/* 0000CD50 3B200004 */ li r25, 4
/* 0000CD54 38000000 */ li r0, 0
/* 0000CD58 9B3F0003 */ stb r25, 3(r31)
/* 0000CD5C 387F0000 */ addi r3, r31, 0
/* 0000CD60 389F0058 */ addi r4, r31, 0x58
/* 0000CD64 80BF0038 */ lwz r5, 0x38(r31)
/* 0000CD68 38DF0060 */ addi r6, r31, 0x60
/* 0000CD6C 38FF0064 */ addi r7, r31, 0x64
/* 0000CD70 90A10124 */ stw r5, 0x124(r1)
/* 0000CD74 38BF005C */ addi r5, r31, 0x5c
/* 0000CD78 901F0038 */ stw r0, 0x38(r31)
/* 0000CD7C 4BFF340D */ bl calc_sprite_bounds
/* 0000CD80 80010124 */ lwz r0, 0x124(r1)
/* 0000CD84 901F0038 */ stw r0, 0x38(r31)
/* 0000CD88 9B3F0003 */ stb r25, 3(r31)
/* 0000CD8C 80160108 */ lwz r0, 0x108(r22)
/* 0000CD90 807F0058 */ lwz r3, 0x58(r31)
/* 0000CD94 2C000000 */ cmpwi r0, 0
/* 0000CD98 7C711850 */ subf r3, r17, r3
/* 0000CD9C 38630028 */ addi r3, r3, 0x28
/* 0000CDA0 41820010 */ beq lbl_0000CDB0
/* 0000CDA4 8816010C */ lbz r0, 0x10c(r22)
/* 0000CDA8 28000000 */ cmplwi r0, 0
/* 0000CDAC 40820008 */ bne lbl_0000CDB4
lbl_0000CDB0:
/* 0000CDB0 3B600000 */ li r27, 0
lbl_0000CDB4:
/* 0000CDB4 38030022 */ addi r0, r3, 0x22
/* 0000CDB8 6C008000 */ xoris r0, r0, 0x8000
/* 0000CDBC 90010144 */ stw r0, 0x144(r1)
/* 0000CDC0 38000408 */ li r0, 0x408
/* 0000CDC4 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000CDC8 93410140 */ stw r26, 0x140(r1)
/* 0000CDCC 5764F87E */ srwi r4, r27, 1
/* 0000CDD0 900100C8 */ stw r0, 0xc8(r1)
/* 0000CDD4 38040080 */ addi r0, r4, 0x80
/* 0000CDD8 C8010140 */ lfd f0, 0x140(r1)
/* 0000CDDC 5404402E */ slwi r4, r0, 8
/* 0000CDE0 C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000CDE4 38000000 */ li r0, 0
/* 0000CDE8 EC000828 */ fsubs f0, f0, f1
/* 0000CDEC 386100C8 */ addi r3, r1, 0xc8
/* 0000CDF0 D00100CC */ stfs f0, 0xcc(r1)
/* 0000CDF4 C01E01F8 */ lfs f0, 0x1f8(r30)
/* 0000CDF8 EC00E82A */ fadds f0, f0, f29
/* 0000CDFC D00100D0 */ stfs f0, 0xd0(r1)
/* 0000CE00 C83E0190 */ lfd f1, 0x190(r30)
/* 0000CE04 C01F004C */ lfs f0, 0x4c(r31)
/* 0000CE08 FC01002A */ fadd f0, f1, f0
/* 0000CE0C FC000018 */ frsp f0, f0
/* 0000CE10 D00100D4 */ stfs f0, 0xd4(r1)
/* 0000CE14 C01E01FC */ lfs f0, 0x1fc(r30)
/* 0000CE18 D00100D8 */ stfs f0, 0xd8(r1)
/* 0000CE1C C01E000C */ lfs f0, 0xc(r30)
/* 0000CE20 D00100DC */ stfs f0, 0xdc(r1)
/* 0000CE24 C83E0098 */ lfd f1, 0x98(r30)
/* 0000CE28 C01F006C */ lfs f0, 0x6c(r31)
/* 0000CE2C FC010032 */ fmul f0, f1, f0
/* 0000CE30 FC000018 */ frsp f0, f0
/* 0000CE34 D00100F4 */ stfs f0, 0xf4(r1)
/* 0000CE38 C03E0010 */ lfs f1, 0x10(r30)
/* 0000CE3C C01F006C */ lfs f0, 0x6c(r31)
/* 0000CE40 EC010032 */ fmuls f0, f1, f0
/* 0000CE44 FC00001E */ fctiwz f0, f0
/* 0000CE48 D8010148 */ stfd f0, 0x148(r1)
/* 0000CE4C 80A1014C */ lwz r5, 0x14c(r1)
/* 0000CE50 54A5C00E */ slwi r5, r5, 0x18
/* 0000CE54 64A500FF */ oris r5, r5, 0xff
/* 0000CE58 60A500FF */ ori r5, r5, 0xff
/* 0000CE5C 7CA42378 */ or r4, r5, r4
/* 0000CE60 90810100 */ stw r4, 0x100(r1)
/* 0000CE64 90010104 */ stw r0, 0x104(r1)
/* 0000CE68 4BFF3321 */ bl draw_naomi_sprite
/* 0000CE6C 387F0000 */ addi r3, r31, 0
/* 0000CE70 3881000C */ addi r4, r1, 0xc
/* 0000CE74 38A000BC */ li r5, 0xbc
/* 0000CE78 4BFF3311 */ bl memcpy
lbl_0000CE7C:
/* 0000CE7C C03F0040 */ lfs f1, 0x40(r31)
/* 0000CE80 C05E000C */ lfs f2, 0xc(r30)
/* 0000CE84 4BFF3305 */ bl set_text_scale
/* 0000CE88 38702000 */ addi r3, r16, 0x2000
/* 0000CE8C 4BFF32FD */ bl set_text_mul_color
/* 0000CE90 C01E0070 */ lfs f0, 0x70(r30)
/* 0000CE94 EFE0E82A */ fadds f31, f0, f29
/* 0000CE98 EC20F02A */ fadds f1, f0, f30
/* 0000CE9C FC40F890 */ fmr f2, f31
/* 0000CEA0 4BFF32E9 */ bl set_text_pos
/* 0000CEA4 387F008C */ addi r3, r31, 0x8c
/* 0000CEA8 4BFF32E1 */ bl u_draw_text
/* 0000CEAC 7E83A378 */ mr r3, r20
/* 0000CEB0 4BFF32D9 */ bl set_text_mul_color
/* 0000CEB4 FC20F090 */ fmr f1, f30
/* 0000CEB8 FC40E890 */ fmr f2, f29
/* 0000CEBC 4BFF32CD */ bl set_text_pos
/* 0000CEC0 387F008C */ addi r3, r31, 0x8c
/* 0000CEC4 4BFF32C5 */ bl u_draw_text
/* 0000CEC8 C01E000C */ lfs f0, 0xc(r30)
/* 0000CECC D01F0040 */ stfs f0, 0x40(r31)
/* 0000CED0 C03F0040 */ lfs f1, 0x40(r31)
/* 0000CED4 C05E000C */ lfs f2, 0xc(r30)
/* 0000CED8 4BFF32B1 */ bl set_text_scale
/* 0000CEDC 380000B0 */ li r0, 0xb0
/* 0000CEE0 981F0001 */ stb r0, 1(r31)
/* 0000CEE4 887F0001 */ lbz r3, 1(r31)
/* 0000CEE8 4BFF32A1 */ bl set_text_font
/* 0000CEEC 387D0000 */ addi r3, r29, 0
/* 0000CEF0 389F0000 */ addi r4, r31, 0
/* 0000CEF4 4BFFF625 */ bl lbl_0000C518
/* 0000CEF8 3B600004 */ li r27, 4
/* 0000CEFC 9B7F0003 */ stb r27, 3(r31)
/* 0000CF00 3B200000 */ li r25, 0
/* 0000CF04 387F0000 */ addi r3, r31, 0
/* 0000CF08 801F0038 */ lwz r0, 0x38(r31)
/* 0000CF0C 389F0058 */ addi r4, r31, 0x58
/* 0000CF10 38BF005C */ addi r5, r31, 0x5c
/* 0000CF14 90010120 */ stw r0, 0x120(r1)
/* 0000CF18 38DF0060 */ addi r6, r31, 0x60
/* 0000CF1C 38FF0064 */ addi r7, r31, 0x64
/* 0000CF20 933F0038 */ stw r25, 0x38(r31)
/* 0000CF24 4BFF3265 */ bl calc_sprite_bounds
/* 0000CF28 80010120 */ lwz r0, 0x120(r1)
/* 0000CF2C 3C800000 */ lis r4, lbl_00011D00@ha
/* 0000CF30 38702000 */ addi r3, r16, 0x2000
/* 0000CF34 901F0038 */ stw r0, 0x38(r31)
/* 0000CF38 9B7F0003 */ stb r27, 3(r31)
/* 0000CF3C 801F0058 */ lwz r0, 0x58(r31)
/* 0000CF40 C8240000 */ lfd f1, lbl_00011D00@l(r4)
/* 0000CF44 7C910050 */ subf r4, r17, r0
/* 0000CF48 38040028 */ addi r0, r4, 0x28
/* 0000CF4C 6C008000 */ xoris r0, r0, 0x8000
/* 0000CF50 90010144 */ stw r0, 0x144(r1)
/* 0000CF54 93410140 */ stw r26, 0x140(r1)
/* 0000CF58 C8010140 */ lfd f0, 0x140(r1)
/* 0000CF5C EFC00828 */ fsubs f30, f0, f1
/* 0000CF60 4BFF3229 */ bl set_text_mul_color
/* 0000CF64 38600000 */ li r3, 0
/* 0000CF68 4BFF3221 */ bl set_text_add_color
/* 0000CF6C C01E0070 */ lfs f0, 0x70(r30)
/* 0000CF70 FC40F890 */ fmr f2, f31
/* 0000CF74 EC20F02A */ fadds f1, f0, f30
/* 0000CF78 4BFF3211 */ bl set_text_pos
/* 0000CF7C 387F008C */ addi r3, r31, 0x8c
/* 0000CF80 4BFF3209 */ bl u_draw_text
/* 0000CF84 7E83A378 */ mr r3, r20
/* 0000CF88 4BFF3201 */ bl set_text_mul_color
/* 0000CF8C 38600000 */ li r3, 0
/* 0000CF90 4BFF31F9 */ bl set_text_add_color
/* 0000CF94 FC20F090 */ fmr f1, f30
/* 0000CF98 FC40E890 */ fmr f2, f29
/* 0000CF9C 4BFF31ED */ bl set_text_pos
/* 0000CFA0 387F008C */ addi r3, r31, 0x8c
/* 0000CFA4 4BFF31E5 */ bl u_draw_text
/* 0000CFA8 80130000 */ lwz r0, 0(r19)
/* 0000CFAC 7C1D0000 */ cmpw r29, r0
/* 0000CFB0 40820178 */ bne lbl_0000D128
/* 0000CFB4 80610138 */ lwz r3, 0x138(r1)
/* 0000CFB8 80030000 */ lwz r0, 0(r3)
/* 0000CFBC 5403482C */ slwi r3, r0, 9
/* 0000CFC0 38634000 */ addi r3, r3, 0x4000
/* 0000CFC4 4BFF31C5 */ bl mathutil_sin
/* 0000CFC8 FC600A10 */ fabs f3, f1
/* 0000CFCC C85E0030 */ lfd f2, 0x30(r30)
/* 0000CFD0 C81E00B0 */ lfd f0, 0xb0(r30)
/* 0000CFD4 C03E01A0 */ lfs f1, 0x1a0(r30)
/* 0000CFD8 FC621828 */ fsub f3, f2, f3
/* 0000CFDC C05E000C */ lfs f2, 0xc(r30)
/* 0000CFE0 FC0000F2 */ fmul f0, f0, f3
/* 0000CFE4 FC00001E */ fctiwz f0, f0
/* 0000CFE8 D8010140 */ stfd f0, 0x140(r1)
/* 0000CFEC 83610144 */ lwz r27, 0x144(r1)
/* 0000CFF0 4BFF3199 */ bl set_text_scale
/* 0000CFF4 C03E0200 */ lfs f1, 0x200(r30)
/* 0000CFF8 4BFF3191 */ bl func_80071B1C
/* 0000CFFC 880E0000 */ lbz r0, 0(r14)
/* 0000D000 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000D004 4182001C */ beq lbl_0000D020
/* 0000D008 5763801E */ slwi r3, r27, 0x10
/* 0000D00C 5760402E */ slwi r0, r27, 8
/* 0000D010 7C600378 */ or r0, r3, r0
/* 0000D014 3B0FFFFF */ addi r24, r15, -1  ;# fixed addi
/* 0000D018 7F790378 */ or r25, r27, r0
/* 0000D01C 48000008 */ b lbl_0000D024
lbl_0000D020:
/* 0000D020 3B002020 */ li r24, 0x2020
lbl_0000D024:
/* 0000D024 387F008C */ addi r3, r31, 0x8c
/* 0000D028 38953D30 */ addi r4, r21, 0x3d30
/* 0000D02C 4BFF315D */ bl strcpy
/* 0000D030 38602020 */ li r3, 0x2020
/* 0000D034 4BFF3155 */ bl set_text_mul_color
/* 0000D038 38600000 */ li r3, 0
/* 0000D03C 4BFF314D */ bl set_text_add_color
/* 0000D040 C01E0204 */ lfs f0, 0x204(r30)
/* 0000D044 FC40F890 */ fmr f2, f31
/* 0000D048 C03E0070 */ lfs f1, 0x70(r30)
/* 0000D04C EC1E0028 */ fsubs f0, f30, f0
/* 0000D050 EC21002A */ fadds f1, f1, f0
/* 0000D054 4BFF3135 */ bl set_text_pos
/* 0000D058 387F008C */ addi r3, r31, 0x8c
/* 0000D05C 4BFF312D */ bl u_draw_text
/* 0000D060 7F03C378 */ mr r3, r24
/* 0000D064 4BFF3125 */ bl set_text_mul_color
/* 0000D068 7F23CB78 */ mr r3, r25
/* 0000D06C 4BFF311D */ bl set_text_add_color
/* 0000D070 C01E0204 */ lfs f0, 0x204(r30)
/* 0000D074 FC40E890 */ fmr f2, f29
/* 0000D078 EC3E0028 */ fsubs f1, f30, f0
/* 0000D07C 4BFF310D */ bl set_text_pos
/* 0000D080 387F008C */ addi r3, r31, 0x8c
/* 0000D084 4BFF3105 */ bl u_draw_text
/* 0000D088 880E0000 */ lbz r0, 0(r14)
/* 0000D08C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D090 4182001C */ beq lbl_0000D0AC
/* 0000D094 5763801E */ slwi r3, r27, 0x10
/* 0000D098 5760402E */ slwi r0, r27, 8
/* 0000D09C 7C600378 */ or r0, r3, r0
/* 0000D0A0 3B0FFFFF */ addi r24, r15, -1  ;# fixed addi
/* 0000D0A4 7F790378 */ or r25, r27, r0
/* 0000D0A8 4800000C */ b lbl_0000D0B4
lbl_0000D0AC:
/* 0000D0AC 3B002020 */ li r24, 0x2020
/* 0000D0B0 3B200000 */ li r25, 0
lbl_0000D0B4:
/* 0000D0B4 387F008C */ addi r3, r31, 0x8c
/* 0000D0B8 38953D40 */ addi r4, r21, 0x3d40
/* 0000D0BC 4BFF30CD */ bl strcpy
/* 0000D0C0 38602020 */ li r3, 0x2020
/* 0000D0C4 4BFF30C5 */ bl set_text_mul_color
/* 0000D0C8 38600000 */ li r3, 0
/* 0000D0CC 4BFF30BD */ bl set_text_add_color
/* 0000D0D0 C01E0208 */ lfs f0, 0x208(r30)
/* 0000D0D4 FC40F890 */ fmr f2, f31
/* 0000D0D8 C03E0070 */ lfs f1, 0x70(r30)
/* 0000D0DC EFC0F02A */ fadds f30, f0, f30
/* 0000D0E0 EC21F02A */ fadds f1, f1, f30
/* 0000D0E4 4BFF30A5 */ bl set_text_pos
/* 0000D0E8 387F008C */ addi r3, r31, 0x8c
/* 0000D0EC 4BFF309D */ bl u_draw_text
/* 0000D0F0 7F03C378 */ mr r3, r24
/* 0000D0F4 4BFF3095 */ bl set_text_mul_color
/* 0000D0F8 7F23CB78 */ mr r3, r25
/* 0000D0FC 4BFF308D */ bl set_text_add_color
/* 0000D100 FC20F090 */ fmr f1, f30
/* 0000D104 FC40E890 */ fmr f2, f29
/* 0000D108 4BFF3081 */ bl set_text_pos
/* 0000D10C 387F008C */ addi r3, r31, 0x8c
/* 0000D110 4BFF3079 */ bl u_draw_text
/* 0000D114 C03E000C */ lfs f1, 0xc(r30)
/* 0000D118 FC400890 */ fmr f2, f1
/* 0000D11C 4BFF306D */ bl set_text_scale
/* 0000D120 C03E003C */ lfs f1, 0x3c(r30)
/* 0000D124 4BFF3065 */ bl func_80071B1C
lbl_0000D128:
/* 0000D128 3AF70004 */ addi r23, r23, 4
/* 0000D12C 3A520018 */ addi r18, r18, 0x18
/* 0000D130 3BBD0001 */ addi r29, r29, 1
lbl_0000D134:
/* 0000D134 7C1DE000 */ cmpw r29, r28
/* 0000D138 4180FA14 */ blt lbl_0000CB4C
/* 0000D13C 380000B1 */ li r0, 0xb1
/* 0000D140 981F0001 */ stb r0, 1(r31)
/* 0000D144 887F0001 */ lbz r3, 1(r31)
/* 0000D148 4BFF3041 */ bl set_text_font
/* 0000D14C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000D150 38A30000 */ addi r5, r3, lbl_801EEDA8@l
/* 0000D154 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000D158 3C800000 */ lis r4, modeCtrl@ha
/* 0000D15C 3BBC0000 */ addi r29, r28, 0
/* 0000D160 3AE30000 */ addi r23, r3, unpausedFrameCounter@l
/* 0000D164 3B4500F4 */ addi r26, r5, 0xf4
/* 0000D168 3A640000 */ addi r19, r4, modeCtrl@l
/* 0000D16C 3A5C0001 */ addi r18, r28, 1
/* 0000D170 3F204330 */ lis r25, 0x4330
/* 0000D174 3F000100 */ lis r24, 0x100
/* 0000D178 3EC00081 */ lis r22, 0x81
/* 0000D17C 3E800020 */ lis r20, 0x20
/* 0000D180 480001F4 */ b lbl_0000D374
lbl_0000D184:
/* 0000D184 C03E020C */ lfs f1, 0x20c(r30)
/* 0000D188 7C1DE000 */ cmpw r29, r28
/* 0000D18C C01F0004 */ lfs f0, 4(r31)
/* 0000D190 EFE1002A */ fadds f31, f1, f0
/* 0000D194 4082000C */ bne lbl_0000D1A0
/* 0000D198 3800FFC4 */ li r0, -60
/* 0000D19C 48000008 */ b lbl_0000D1A4
lbl_0000D1A0:
/* 0000D1A0 3800000A */ li r0, 0xa
lbl_0000D1A4:
/* 0000D1A4 6C038000 */ xoris r3, r0, 0x8000
/* 0000D1A8 801A0000 */ lwz r0, 0(r26)
/* 0000D1AC 90610144 */ stw r3, 0x144(r1)
/* 0000D1B0 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000D1B4 C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000D1B8 7C1D0000 */ cmpw r29, r0
/* 0000D1BC 93210140 */ stw r25, 0x140(r1)
/* 0000D1C0 C05F0008 */ lfs f2, 8(r31)
/* 0000D1C4 C8010140 */ lfd f0, 0x140(r1)
/* 0000D1C8 EC000828 */ fsubs f0, f0, f1
/* 0000D1CC EFC2002A */ fadds f30, f2, f0
/* 0000D1D0 4082005C */ bne lbl_0000D22C
/* 0000D1D4 80130008 */ lwz r0, 8(r19)
/* 0000D1D8 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000D1DC 4182002C */ beq lbl_0000D208
/* 0000D1E0 80170000 */ lwz r0, 0(r23)
/* 0000D1E4 3C600000 */ lis r3, lbl_00011EC8@ha
/* 0000D1E8 C8230000 */ lfd f1, lbl_00011EC8@l(r3)
/* 0000D1EC 5400F7FE */ rlwinm r0, r0, 0x1e, 0x1f, 0x1f
/* 0000D1F0 1C0000FF */ mulli r0, r0, 0xff
/* 0000D1F4 90010144 */ stw r0, 0x144(r1)
/* 0000D1F8 93210140 */ stw r25, 0x140(r1)
/* 0000D1FC C8010140 */ lfd f0, 0x140(r1)
/* 0000D200 FC200828 */ fsub f1, f0, f1
/* 0000D204 4800002C */ b lbl_0000D230
lbl_0000D208:
/* 0000D208 80170000 */ lwz r0, 0(r23)
/* 0000D20C 5403482C */ slwi r3, r0, 9
/* 0000D210 4BFF2F79 */ bl mathutil_sin
/* 0000D214 FC400A10 */ fabs f2, f1
/* 0000D218 C83E0030 */ lfd f1, 0x30(r30)
/* 0000D21C C81E0198 */ lfd f0, 0x198(r30)
/* 0000D220 FC211028 */ fsub f1, f1, f2
/* 0000D224 FC200072 */ fmul f1, f0, f1
/* 0000D228 48000008 */ b lbl_0000D230
lbl_0000D22C:
/* 0000D22C C83E01E8 */ lfd f1, 0x1e8(r30)
lbl_0000D230:
/* 0000D230 4BFF2F59 */ bl __cvt_fp2unsigned
/* 0000D234 801A0000 */ lwz r0, 0(r26)
/* 0000D238 7C1D0000 */ cmpw r29, r0
/* 0000D23C 4082001C */ bne lbl_0000D258
/* 0000D240 7C1DE000 */ cmpw r29, r28
/* 0000D244 4082000C */ bne lbl_0000D250
/* 0000D248 38188080 */ addi r0, r24, -32640  ;# fixed addi
/* 0000D24C 48000020 */ b lbl_0000D26C
lbl_0000D250:
/* 0000D250 381680FF */ addi r0, r22, -32513  ;# fixed addi
/* 0000D254 48000018 */ b lbl_0000D26C
lbl_0000D258:
/* 0000D258 7C1DE000 */ cmpw r29, r28
/* 0000D25C 4082000C */ bne lbl_0000D268
/* 0000D260 3C000040 */ lis r0, 0x40
/* 0000D264 48000008 */ b lbl_0000D26C
lbl_0000D268:
/* 0000D268 38000040 */ li r0, 0x40
lbl_0000D26C:
/* 0000D26C 38800407 */ li r4, 0x407
/* 0000D270 908100C8 */ stw r4, 0xc8(r1)
/* 0000D274 5465801E */ slwi r5, r3, 0x10
/* 0000D278 5464402E */ slwi r4, r3, 8
/* 0000D27C C01E0210 */ lfs f0, 0x210(r30)
/* 0000D280 7CA42378 */ or r4, r5, r4
/* 0000D284 7C642378 */ or r4, r3, r4
/* 0000D288 EC00F82A */ fadds f0, f0, f31
/* 0000D28C 386100C8 */ addi r3, r1, 0xc8
/* 0000D290 D00100CC */ stfs f0, 0xcc(r1)
/* 0000D294 C01E00AC */ lfs f0, 0xac(r30)
/* 0000D298 EC00F02A */ fadds f0, f0, f30
/* 0000D29C D00100D0 */ stfs f0, 0xd0(r1)
/* 0000D2A0 C01E000C */ lfs f0, 0xc(r30)
/* 0000D2A4 D00100D8 */ stfs f0, 0xd8(r1)
/* 0000D2A8 C01E000C */ lfs f0, 0xc(r30)
/* 0000D2AC D00100DC */ stfs f0, 0xdc(r1)
/* 0000D2B0 C01F006C */ lfs f0, 0x6c(r31)
/* 0000D2B4 D00100F4 */ stfs f0, 0xf4(r1)
/* 0000D2B8 C03E0010 */ lfs f1, 0x10(r30)
/* 0000D2BC C01F006C */ lfs f0, 0x6c(r31)
/* 0000D2C0 EC010032 */ fmuls f0, f1, f0
/* 0000D2C4 FC00001E */ fctiwz f0, f0
/* 0000D2C8 D8010140 */ stfd f0, 0x140(r1)
/* 0000D2CC 80A10144 */ lwz r5, 0x144(r1)
/* 0000D2D0 54A5C00E */ slwi r5, r5, 0x18
/* 0000D2D4 7CA00378 */ or r0, r5, r0
/* 0000D2D8 90010100 */ stw r0, 0x100(r1)
/* 0000D2DC 90810104 */ stw r4, 0x104(r1)
/* 0000D2E0 4BFF2EA9 */ bl draw_naomi_sprite
/* 0000D2E4 801A0000 */ lwz r0, 0(r26)
/* 0000D2E8 7C1D0000 */ cmpw r29, r0
/* 0000D2EC 4082000C */ bne lbl_0000D2F8
/* 0000D2F0 3B78FF00 */ addi r27, r24, -256  ;# fixed addi
/* 0000D2F4 48000008 */ b lbl_0000D2FC
lbl_0000D2F8:
/* 0000D2F8 3B768000 */ addi r27, r22, -32768  ;# fixed addi
lbl_0000D2FC:
/* 0000D2FC 7C1DE000 */ cmpw r29, r28
/* 0000D300 4082000C */ bne lbl_0000D30C
/* 0000D304 38954110 */ addi r4, r21, 0x4110
/* 0000D308 48000008 */ b lbl_0000D310
lbl_0000D30C:
/* 0000D30C 38954124 */ addi r4, r21, 0x4124
lbl_0000D310:
/* 0000D310 387F008C */ addi r3, r31, 0x8c
/* 0000D314 4BFF2E75 */ bl strcpy
/* 0000D318 C03E0040 */ lfs f1, 0x40(r30)
/* 0000D31C C05E000C */ lfs f2, 0xc(r30)
/* 0000D320 4BFF2E69 */ bl set_text_scale
/* 0000D324 38742000 */ addi r3, r20, 0x2000
/* 0000D328 4BFF2E61 */ bl set_text_mul_color
/* 0000D32C 38600000 */ li r3, 0
/* 0000D330 4BFF2E59 */ bl set_text_add_color
/* 0000D334 C01E0070 */ lfs f0, 0x70(r30)
/* 0000D338 EC20F82A */ fadds f1, f0, f31
/* 0000D33C EC40F02A */ fadds f2, f0, f30
/* 0000D340 4BFF2E49 */ bl set_text_pos
/* 0000D344 387F008C */ addi r3, r31, 0x8c
/* 0000D348 4BFF2E41 */ bl u_draw_text
/* 0000D34C 7F63DB78 */ mr r3, r27
/* 0000D350 4BFF2E39 */ bl set_text_mul_color
/* 0000D354 38600000 */ li r3, 0
/* 0000D358 4BFF2E31 */ bl set_text_add_color
/* 0000D35C FC20F890 */ fmr f1, f31
/* 0000D360 FC40F090 */ fmr f2, f30
/* 0000D364 4BFF2E25 */ bl set_text_pos
/* 0000D368 387F008C */ addi r3, r31, 0x8c
/* 0000D36C 4BFF2E1D */ bl u_draw_text
/* 0000D370 3BBD0001 */ addi r29, r29, 1
lbl_0000D374:
/* 0000D374 7C1D9000 */ cmpw r29, r18
/* 0000D378 4081FE0C */ ble lbl_0000D184
lbl_0000D37C:
/* 0000D37C B9C10150 */ lmw r14, 0x150(r1)
/* 0000D380 800101B4 */ lwz r0, 0x1b4(r1)
/* 0000D384 CBE101A8 */ lfd f31, 0x1a8(r1)
/* 0000D388 CBC101A0 */ lfd f30, 0x1a0(r1)
/* 0000D38C 7C0803A6 */ mtlr r0
/* 0000D390 CBA10198 */ lfd f29, 0x198(r1)
/* 0000D394 382101B0 */ addi r1, r1, 0x1b0
/* 0000D398 4E800020 */ blr 
lbl_0000D39C:
/* 0000D39C 7C0802A6 */ mflr r0
/* 0000D3A0 3C600000 */ lis r3, lbl_00012730@ha
/* 0000D3A4 90010004 */ stw r0, 4(r1)
/* 0000D3A8 38A30000 */ addi r5, r3, lbl_00012730@l
/* 0000D3AC 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000D3B0 93E10014 */ stw r31, 0x14(r1)
/* 0000D3B4 93C10010 */ stw r30, 0x10(r1)
/* 0000D3B8 7C9E2378 */ mr r30, r4
/* 0000D3BC 80040048 */ lwz r0, 0x48(r4)
/* 0000D3C0 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000D3C4 3BE40000 */ addi r31, r4, lbl_00011CB0@l
/* 0000D3C8 C05E0004 */ lfs f2, 4(r30)
/* 0000D3CC 54001838 */ slwi r0, r0, 3
/* 0000D3D0 7C650214 */ add r3, r5, r0
/* 0000D3D4 C83F0058 */ lfd f1, 0x58(r31)
/* 0000D3D8 C0030068 */ lfs f0, 0x68(r3)
/* 0000D3DC 3C600000 */ lis r3, modeCtrl@ha
/* 0000D3E0 38630000 */ addi r3, r3, modeCtrl@l
/* 0000D3E4 EC001028 */ fsubs f0, f0, f2
/* 0000D3E8 FC010032 */ fmul f0, f1, f0
/* 0000D3EC FC02002A */ fadd f0, f2, f0
/* 0000D3F0 FC000018 */ frsp f0, f0
/* 0000D3F4 D01E0004 */ stfs f0, 4(r30)
/* 0000D3F8 80030028 */ lwz r0, 0x28(r3)
/* 0000D3FC 2C000002 */ cmpwi r0, 2
/* 0000D400 41820008 */ beq lbl_0000D408
/* 0000D404 48000044 */ b lbl_0000D448
lbl_0000D408:
/* 0000D408 C01F02C0 */ lfs f0, 0x2c0(r31)
/* 0000D40C D01E0044 */ stfs f0, 0x44(r30)
/* 0000D410 801E0048 */ lwz r0, 0x48(r30)
/* 0000D414 C03F02C4 */ lfs f1, 0x2c4(r31)
/* 0000D418 54001838 */ slwi r0, r0, 3
/* 0000D41C C07E0008 */ lfs f3, 8(r30)
/* 0000D420 7C650214 */ add r3, r5, r0
/* 0000D424 C85F0058 */ lfd f2, 0x58(r31)
/* 0000D428 C003006C */ lfs f0, 0x6c(r3)
/* 0000D42C EC01002A */ fadds f0, f1, f0
/* 0000D430 EC001828 */ fsubs f0, f0, f3
/* 0000D434 FC020032 */ fmul f0, f2, f0
/* 0000D438 FC03002A */ fadd f0, f3, f0
/* 0000D43C FC000018 */ frsp f0, f0
/* 0000D440 D01E0008 */ stfs f0, 8(r30)
/* 0000D444 48000038 */ b lbl_0000D47C
lbl_0000D448:
/* 0000D448 C01F000C */ lfs f0, 0xc(r31)
/* 0000D44C D01E0044 */ stfs f0, 0x44(r30)
/* 0000D450 801E0048 */ lwz r0, 0x48(r30)
/* 0000D454 C05E0008 */ lfs f2, 8(r30)
/* 0000D458 54001838 */ slwi r0, r0, 3
/* 0000D45C C83F0058 */ lfd f1, 0x58(r31)
/* 0000D460 7C650214 */ add r3, r5, r0
/* 0000D464 C003006C */ lfs f0, 0x6c(r3)
/* 0000D468 EC001028 */ fsubs f0, f0, f2
/* 0000D46C FC010032 */ fmul f0, f1, f0
/* 0000D470 FC02002A */ fadd f0, f2, f0
/* 0000D474 FC000018 */ frsp f0, f0
/* 0000D478 D01E0008 */ stfs f0, 8(r30)
lbl_0000D47C:
/* 0000D47C 801E0048 */ lwz r0, 0x48(r30)
/* 0000D480 2C000004 */ cmpwi r0, 4
/* 0000D484 40800028 */ bge lbl_0000D4AC
/* 0000D488 2C000002 */ cmpwi r0, 2
/* 0000D48C 40800008 */ bge lbl_0000D494
/* 0000D490 4800001C */ b lbl_0000D4AC
lbl_0000D494:
/* 0000D494 A87E0010 */ lha r3, 0x10(r30)
/* 0000D498 2C030000 */ cmpwi r3, 0
/* 0000D49C 40810024 */ ble lbl_0000D4C0
/* 0000D4A0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000D4A4 B01E0010 */ sth r0, 0x10(r30)
/* 0000D4A8 48000018 */ b lbl_0000D4C0
lbl_0000D4AC:
/* 0000D4AC A87E0010 */ lha r3, 0x10(r30)
/* 0000D4B0 2C030009 */ cmpwi r3, 9
/* 0000D4B4 4080000C */ bge lbl_0000D4C0
/* 0000D4B8 38030001 */ addi r0, r3, 1
/* 0000D4BC B01E0010 */ sth r0, 0x10(r30)
lbl_0000D4C0:
/* 0000D4C0 38600021 */ li r3, 0x21
/* 0000D4C4 4BFF2CC5 */ bl find_sprite_with_tag
/* 0000D4C8 80030048 */ lwz r0, 0x48(r3)
/* 0000D4CC 2C000000 */ cmpwi r0, 0
/* 0000D4D0 408200C0 */ bne lbl_0000D590
/* 0000D4D4 38600022 */ li r3, 0x22
/* 0000D4D8 4BFF2CB1 */ bl find_sprite_with_tag
/* 0000D4DC 80030048 */ lwz r0, 0x48(r3)
/* 0000D4E0 2C000000 */ cmpwi r0, 0
/* 0000D4E4 408200AC */ bne lbl_0000D590
/* 0000D4E8 A81E0010 */ lha r0, 0x10(r30)
/* 0000D4EC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000D4F0 C03E0004 */ lfs f1, 4(r30)
/* 0000D4F4 38830000 */ addi r4, r3, lbl_801EEDA8@l
/* 0000D4F8 C81F02C8 */ lfd f0, 0x2c8(r31)
/* 0000D4FC 5400103A */ slwi r0, r0, 2
/* 0000D500 7C7F0214 */ add r3, r31, r0
/* 0000D504 FC210028 */ fsub f1, f1, f0
/* 0000D508 C0030220 */ lfs f0, 0x220(r3)
/* 0000D50C FC01002A */ fadd f0, f1, f0
/* 0000D510 FC000018 */ frsp f0, f0
/* 0000D514 D00400F8 */ stfs f0, 0xf8(r4)
/* 0000D518 A81E0010 */ lha r0, 0x10(r30)
/* 0000D51C 5400103A */ slwi r0, r0, 2
/* 0000D520 7C7F0214 */ add r3, r31, r0
/* 0000D524 C0030248 */ lfs f0, 0x248(r3)
/* 0000D528 D00400FC */ stfs f0, 0xfc(r4)
/* 0000D52C A81E0010 */ lha r0, 0x10(r30)
/* 0000D530 C03E0040 */ lfs f1, 0x40(r30)
/* 0000D534 5400103A */ slwi r0, r0, 2
/* 0000D538 7C7F0214 */ add r3, r31, r0
/* 0000D53C C0030270 */ lfs f0, 0x270(r3)
/* 0000D540 EC010032 */ fmuls f0, f1, f0
/* 0000D544 D0040100 */ stfs f0, 0x100(r4)
/* 0000D548 A81E0010 */ lha r0, 0x10(r30)
/* 0000D54C C03E0044 */ lfs f1, 0x44(r30)
/* 0000D550 5400103A */ slwi r0, r0, 2
/* 0000D554 7C7F0214 */ add r3, r31, r0
/* 0000D558 C0030298 */ lfs f0, 0x298(r3)
/* 0000D55C EC010032 */ fmuls f0, f1, f0
/* 0000D560 D0040104 */ stfs f0, 0x104(r4)
/* 0000D564 801E0048 */ lwz r0, 0x48(r30)
/* 0000D568 2C000003 */ cmpwi r0, 3
/* 0000D56C 40820024 */ bne lbl_0000D590
/* 0000D570 C03E0004 */ lfs f1, 4(r30)
/* 0000D574 C01F02D0 */ lfs f0, 0x2d0(r31)
/* 0000D578 FC010040 */ fcmpo cr0, f1, f0
/* 0000D57C 40810014 */ ble lbl_0000D590
/* 0000D580 38000000 */ li r0, 0
/* 0000D584 901E0048 */ stw r0, 0x48(r30)
/* 0000D588 38000009 */ li r0, 9
/* 0000D58C B01E0010 */ sth r0, 0x10(r30)
lbl_0000D590:
/* 0000D590 8001001C */ lwz r0, 0x1c(r1)
/* 0000D594 83E10014 */ lwz r31, 0x14(r1)
/* 0000D598 83C10010 */ lwz r30, 0x10(r1)
/* 0000D59C 7C0803A6 */ mtlr r0
/* 0000D5A0 38210018 */ addi r1, r1, 0x18
/* 0000D5A4 4E800020 */ blr 
lbl_0000D5A8:
/* 0000D5A8 7C0802A6 */ mflr r0
/* 0000D5AC 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000D5B0 90010004 */ stw r0, 4(r1)
/* 0000D5B4 3800FFFF */ li r0, -1
/* 0000D5B8 9421FF88 */ stwu r1, -0x78(r1)
/* 0000D5BC 93E10074 */ stw r31, 0x74(r1)
/* 0000D5C0 3BE40000 */ addi r31, r4, lbl_00011CB0@l
/* 0000D5C4 93C10070 */ stw r30, 0x70(r1)
/* 0000D5C8 3BC30000 */ addi r30, r3, 0
/* 0000D5CC 3861000C */ addi r3, r1, 0xc
/* 0000D5D0 93A1006C */ stw r29, 0x6c(r1)
/* 0000D5D4 3BA00000 */ li r29, 0
/* 0000D5D8 C01F0008 */ lfs f0, 8(r31)
/* 0000D5DC D0010024 */ stfs f0, 0x24(r1)
/* 0000D5E0 C01F0008 */ lfs f0, 8(r31)
/* 0000D5E4 D0010028 */ stfs f0, 0x28(r1)
/* 0000D5E8 C01F000C */ lfs f0, 0xc(r31)
/* 0000D5EC D001002C */ stfs f0, 0x2c(r1)
/* 0000D5F0 C01F000C */ lfs f0, 0xc(r31)
/* 0000D5F4 D0010030 */ stfs f0, 0x30(r1)
/* 0000D5F8 C01E006C */ lfs f0, 0x6c(r30)
/* 0000D5FC D0010038 */ stfs f0, 0x38(r1)
/* 0000D600 9001003C */ stw r0, 0x3c(r1)
/* 0000D604 801E0074 */ lwz r0, 0x74(r30)
/* 0000D608 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 0000D60C 6000000A */ ori r0, r0, 0xa
/* 0000D610 90010040 */ stw r0, 0x40(r1)
/* 0000D614 C03F0010 */ lfs f1, 0x10(r31)
/* 0000D618 C01E006C */ lfs f0, 0x6c(r30)
/* 0000D61C EC010032 */ fmuls f0, f1, f0
/* 0000D620 FC00001E */ fctiwz f0, f0
/* 0000D624 D8010060 */ stfd f0, 0x60(r1)
/* 0000D628 80010064 */ lwz r0, 0x64(r1)
/* 0000D62C 5400C00E */ slwi r0, r0, 0x18
/* 0000D630 640000FF */ oris r0, r0, 0xff
/* 0000D634 6000FFFF */ ori r0, r0, 0xffff
/* 0000D638 90010044 */ stw r0, 0x44(r1)
/* 0000D63C 93A10048 */ stw r29, 0x48(r1)
/* 0000D640 A01E003C */ lhz r0, 0x3c(r30)
/* 0000D644 9001000C */ stw r0, 0xc(r1)
/* 0000D648 C01E0004 */ lfs f0, 4(r30)
/* 0000D64C D0010010 */ stfs f0, 0x10(r1)
/* 0000D650 C01E0008 */ lfs f0, 8(r30)
/* 0000D654 D0010014 */ stfs f0, 0x14(r1)
/* 0000D658 C01E004C */ lfs f0, 0x4c(r30)
/* 0000D65C D0010018 */ stfs f0, 0x18(r1)
/* 0000D660 C01E0040 */ lfs f0, 0x40(r30)
/* 0000D664 D001001C */ stfs f0, 0x1c(r1)
/* 0000D668 C01E0044 */ lfs f0, 0x44(r30)
/* 0000D66C D0010020 */ stfs f0, 0x20(r1)
/* 0000D670 A81E0068 */ lha r0, 0x68(r30)
/* 0000D674 90010034 */ stw r0, 0x34(r1)
/* 0000D678 4BFF2B11 */ bl draw_naomi_sprite
/* 0000D67C A81E0010 */ lha r0, 0x10(r30)
/* 0000D680 2C000000 */ cmpwi r0, 0
/* 0000D684 40810018 */ ble lbl_0000D69C
/* 0000D688 3C600100 */ lis r3, 0x100
/* 0000D68C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000D690 90010044 */ stw r0, 0x44(r1)
/* 0000D694 93A10048 */ stw r29, 0x48(r1)
/* 0000D698 48000050 */ b lbl_0000D6E8
lbl_0000D69C:
/* 0000D69C 4BFF2AED */ bl is_load_queue_not_empty
/* 0000D6A0 2C030000 */ cmpwi r3, 0
/* 0000D6A4 41820010 */ beq lbl_0000D6B4
/* 0000D6A8 93A10044 */ stw r29, 0x44(r1)
/* 0000D6AC 93A10048 */ stw r29, 0x48(r1)
/* 0000D6B0 48000038 */ b lbl_0000D6E8
lbl_0000D6B4:
/* 0000D6B4 A81E0010 */ lha r0, 0x10(r30)
/* 0000D6B8 2C000000 */ cmpwi r0, 0
/* 0000D6BC 4082002C */ bne lbl_0000D6E8
/* 0000D6C0 3C600000 */ lis r3, backgroundInfo@ha
/* 0000D6C4 93A10044 */ stw r29, 0x44(r1)
/* 0000D6C8 38830000 */ addi r4, r3, backgroundInfo@l
/* 0000D6CC 8804000D */ lbz r0, 0xd(r4)
/* 0000D6D0 8864000C */ lbz r3, 0xc(r4)
/* 0000D6D4 5400402E */ slwi r0, r0, 8
/* 0000D6D8 8884000E */ lbz r4, 0xe(r4)
/* 0000D6DC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000D6E0 7C800378 */ or r0, r4, r0
/* 0000D6E4 90010048 */ stw r0, 0x48(r1)
lbl_0000D6E8:
/* 0000D6E8 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000D6EC 80830000 */ lwz r4, unpausedFrameCounter@l(r3)
/* 0000D6F0 5480F7FF */ rlwinm. r0, r4, 0x1e, 0x1f, 0x1f
/* 0000D6F4 4182000C */ beq lbl_0000D700
/* 0000D6F8 38000427 */ li r0, 0x427
/* 0000D6FC 48000008 */ b lbl_0000D704
lbl_0000D700:
/* 0000D700 38000431 */ li r0, 0x431
lbl_0000D704:
/* 0000D704 9001000C */ stw r0, 0xc(r1)
/* 0000D708 3C600000 */ lis r3, lbl_00012798@ha
/* 0000D70C 38630000 */ addi r3, r3, lbl_00012798@l
/* 0000D710 C03E0004 */ lfs f1, 4(r30)
/* 0000D714 C81F0030 */ lfd f0, 0x30(r31)
/* 0000D718 FC010028 */ fsub f0, f1, f0
/* 0000D71C FC000018 */ frsp f0, f0
/* 0000D720 D0010010 */ stfs f0, 0x10(r1)
/* 0000D724 C03E0008 */ lfs f1, 8(r30)
/* 0000D728 C81F02D8 */ lfd f0, 0x2d8(r31)
/* 0000D72C FC010028 */ fsub f0, f1, f0
/* 0000D730 FC000018 */ frsp f0, f0
/* 0000D734 D0010014 */ stfs f0, 0x14(r1)
/* 0000D738 C03E004C */ lfs f1, 0x4c(r30)
/* 0000D73C C81F02E0 */ lfd f0, 0x2e0(r31)
/* 0000D740 FC010028 */ fsub f0, f1, f0
/* 0000D744 FC000018 */ frsp f0, f0
/* 0000D748 D0010018 */ stfs f0, 0x18(r1)
/* 0000D74C C05E0004 */ lfs f2, 4(r30)
/* 0000D750 C0230010 */ lfs f1, 0x10(r3)
/* 0000D754 C81F02E8 */ lfd f0, 0x2e8(r31)
/* 0000D758 EC220828 */ fsubs f1, f2, f1
/* 0000D75C FC010040 */ fcmpo cr0, f1, f0
/* 0000D760 4080000C */ bge lbl_0000D76C
/* 0000D764 C83F02F0 */ lfd f1, 0x2f0(r31)
/* 0000D768 48000008 */ b lbl_0000D770
lbl_0000D76C:
/* 0000D76C C83F02F8 */ lfd f1, 0x2f8(r31)
lbl_0000D770:
/* 0000D770 C01E0040 */ lfs f0, 0x40(r30)
/* 0000D774 54807420 */ rlwinm r0, r4, 0xe, 0x10, 0x10
/* 0000D778 3861000C */ addi r3, r1, 0xc
/* 0000D77C FC000072 */ fmul f0, f0, f1
/* 0000D780 FC000018 */ frsp f0, f0
/* 0000D784 D001001C */ stfs f0, 0x1c(r1)
/* 0000D788 C83F0300 */ lfd f1, 0x300(r31)
/* 0000D78C C01E0044 */ lfs f0, 0x44(r30)
/* 0000D790 FC010032 */ fmul f0, f1, f0
/* 0000D794 FC000018 */ frsp f0, f0
/* 0000D798 D0010020 */ stfs f0, 0x20(r1)
/* 0000D79C 90010034 */ stw r0, 0x34(r1)
/* 0000D7A0 4BFF29E9 */ bl draw_naomi_sprite
/* 0000D7A4 8001007C */ lwz r0, 0x7c(r1)
/* 0000D7A8 83E10074 */ lwz r31, 0x74(r1)
/* 0000D7AC 83C10070 */ lwz r30, 0x70(r1)
/* 0000D7B0 7C0803A6 */ mtlr r0
/* 0000D7B4 83A1006C */ lwz r29, 0x6c(r1)
/* 0000D7B8 38210078 */ addi r1, r1, 0x78
/* 0000D7BC 4E800020 */ blr 
lbl_0000D7C0:
/* 0000D7C0 80040048 */ lwz r0, 0x48(r4)
/* 0000D7C4 3C600000 */ lis r3, lbl_000127B8@ha
/* 0000D7C8 3CC00000 */ lis r6, lbl_00011D08@ha
/* 0000D7CC C0440004 */ lfs f2, 4(r4)
/* 0000D7D0 54001838 */ slwi r0, r0, 3
/* 0000D7D4 38A30000 */ addi r5, r3, lbl_000127B8@l
/* 0000D7D8 7C650214 */ add r3, r5, r0
/* 0000D7DC C0030000 */ lfs f0, 0(r3)
/* 0000D7E0 38660000 */ addi r3, r6, lbl_00011D08@l
/* 0000D7E4 C8230000 */ lfd f1, 0(r3)
/* 0000D7E8 EC001028 */ fsubs f0, f0, f2
/* 0000D7EC FC010032 */ fmul f0, f1, f0
/* 0000D7F0 FC02002A */ fadd f0, f2, f0
/* 0000D7F4 FC000018 */ frsp f0, f0
/* 0000D7F8 D0040004 */ stfs f0, 4(r4)
/* 0000D7FC 80040048 */ lwz r0, 0x48(r4)
/* 0000D800 C0440008 */ lfs f2, 8(r4)
/* 0000D804 54001838 */ slwi r0, r0, 3
/* 0000D808 C8230000 */ lfd f1, 0(r3)
/* 0000D80C 7C650214 */ add r3, r5, r0
/* 0000D810 C0030004 */ lfs f0, 4(r3)
/* 0000D814 EC001028 */ fsubs f0, f0, f2
/* 0000D818 FC010032 */ fmul f0, f1, f0
/* 0000D81C FC02002A */ fadd f0, f2, f0
/* 0000D820 FC000018 */ frsp f0, f0
/* 0000D824 D0040008 */ stfs f0, 8(r4)
/* 0000D828 4E800020 */ blr 
lbl_0000D82C:
/* 0000D82C 7C0802A6 */ mflr r0
/* 0000D830 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000D834 90010004 */ stw r0, 4(r1)
/* 0000D838 3800FFFF */ li r0, -1
/* 0000D83C 9421FF30 */ stwu r1, -0xd0(r1)
/* 0000D840 DBE100C8 */ stfd f31, 0xc8(r1)
/* 0000D844 DBC100C0 */ stfd f30, 0xc0(r1)
/* 0000D848 DBA100B8 */ stfd f29, 0xb8(r1)
/* 0000D84C DB8100B0 */ stfd f28, 0xb0(r1)
/* 0000D850 DB6100A8 */ stfd f27, 0xa8(r1)
/* 0000D854 BE610074 */ stmw r19, 0x74(r1)
/* 0000D858 3B240000 */ addi r25, r4, lbl_00011CB0@l
/* 0000D85C 3A630000 */ addi r19, r3, 0
/* 0000D860 3C600000 */ lis r3, lbl_00012730@ha
/* 0000D864 3B030000 */ addi r24, r3, lbl_00012730@l
/* 0000D868 3AC00000 */ li r22, 0
/* 0000D86C 3861000C */ addi r3, r1, 0xc
/* 0000D870 C0190008 */ lfs f0, 8(r25)
/* 0000D874 D0010024 */ stfs f0, 0x24(r1)
/* 0000D878 C0190008 */ lfs f0, 8(r25)
/* 0000D87C D0010028 */ stfs f0, 0x28(r1)
/* 0000D880 C019000C */ lfs f0, 0xc(r25)
/* 0000D884 D001002C */ stfs f0, 0x2c(r1)
/* 0000D888 C019000C */ lfs f0, 0xc(r25)
/* 0000D88C D0010030 */ stfs f0, 0x30(r1)
/* 0000D890 C013006C */ lfs f0, 0x6c(r19)
/* 0000D894 D0010038 */ stfs f0, 0x38(r1)
/* 0000D898 9001003C */ stw r0, 0x3c(r1)
/* 0000D89C 80130074 */ lwz r0, 0x74(r19)
/* 0000D8A0 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 0000D8A4 6000000A */ ori r0, r0, 0xa
/* 0000D8A8 90010040 */ stw r0, 0x40(r1)
/* 0000D8AC C0390010 */ lfs f1, 0x10(r25)
/* 0000D8B0 C013006C */ lfs f0, 0x6c(r19)
/* 0000D8B4 EC010032 */ fmuls f0, f1, f0
/* 0000D8B8 FC00001E */ fctiwz f0, f0
/* 0000D8BC D8010068 */ stfd f0, 0x68(r1)
/* 0000D8C0 8001006C */ lwz r0, 0x6c(r1)
/* 0000D8C4 5400C00E */ slwi r0, r0, 0x18
/* 0000D8C8 640000FF */ oris r0, r0, 0xff
/* 0000D8CC 6000FFFF */ ori r0, r0, 0xffff
/* 0000D8D0 90010044 */ stw r0, 0x44(r1)
/* 0000D8D4 92C10048 */ stw r22, 0x48(r1)
/* 0000D8D8 A013003C */ lhz r0, 0x3c(r19)
/* 0000D8DC 9001000C */ stw r0, 0xc(r1)
/* 0000D8E0 C0130004 */ lfs f0, 4(r19)
/* 0000D8E4 D0010010 */ stfs f0, 0x10(r1)
/* 0000D8E8 C0130008 */ lfs f0, 8(r19)
/* 0000D8EC D0010014 */ stfs f0, 0x14(r1)
/* 0000D8F0 C013004C */ lfs f0, 0x4c(r19)
/* 0000D8F4 D0010018 */ stfs f0, 0x18(r1)
/* 0000D8F8 C0130040 */ lfs f0, 0x40(r19)
/* 0000D8FC D001001C */ stfs f0, 0x1c(r1)
/* 0000D900 C0130044 */ lfs f0, 0x44(r19)
/* 0000D904 D0010020 */ stfs f0, 0x20(r1)
/* 0000D908 A8130068 */ lha r0, 0x68(r19)
/* 0000D90C 90010034 */ stw r0, 0x34(r1)
/* 0000D910 4BFF2879 */ bl draw_naomi_sprite
/* 0000D914 4BFF2875 */ bl reset_text_draw_settings
/* 0000D918 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000D91C C0530004 */ lfs f2, 4(r19)
/* 0000D920 C0190308 */ lfs f0, 0x308(r25)
/* 0000D924 3B430000 */ addi r26, r3, unpausedFrameCounter@l
/* 0000D928 801A0000 */ lwz r0, 0(r26)
/* 0000D92C C0330008 */ lfs f1, 8(r19)
/* 0000D930 EFC20028 */ fsubs f30, f2, f0
/* 0000D934 C019030C */ lfs f0, 0x30c(r25)
/* 0000D938 5403482C */ slwi r3, r0, 9
/* 0000D93C EFA10028 */ fsubs f29, f1, f0
/* 0000D940 4BFF2849 */ bl mathutil_sin
/* 0000D944 FC400A10 */ fabs f2, f1
/* 0000D948 C8390310 */ lfd f1, 0x310(r25)
/* 0000D94C C01901F8 */ lfs f0, 0x1f8(r25)
/* 0000D950 3C600000 */ lis r3, lbl_8027CE24@ha
/* 0000D954 3AE30000 */ addi r23, r3, lbl_8027CE24@l
/* 0000D958 FC2100B2 */ fmul f1, f1, f2
/* 0000D95C 3C600000 */ lis r3, lbl_802F1FB4@ha
/* 0000D960 3C800000 */ lis r4, lbl_802F1FB0@ha
/* 0000D964 EFE0E82A */ fadds f31, f0, f29
/* 0000D968 3CA00000 */ lis r5, lbl_802F1FAC@ha
/* 0000D96C FC00081E */ fctiwz f0, f1
/* 0000D970 3BE30000 */ addi r31, r3, lbl_802F1FB4@l
/* 0000D974 3BA40000 */ addi r29, r4, lbl_802F1FB0@l
/* 0000D978 3B850000 */ addi r28, r5, lbl_802F1FAC@l
/* 0000D97C D8010060 */ stfd f0, 0x60(r1)
/* 0000D980 3A800000 */ li r20, 0
/* 0000D984 80010064 */ lwz r0, 0x64(r1)
/* 0000D988 3FC00100 */ lis r30, 0x100
/* 0000D98C 3F604330 */ lis r27, 0x4330
/* 0000D990 5415402E */ slwi r21, r0, 8
lbl_0000D994:
/* 0000D994 92FF0000 */ stw r23, 0(r31)
/* 0000D998 6EC08000 */ xoris r0, r22, 0x8000
/* 0000D99C 3C800000 */ lis r4, lbl_00011D00@ha
/* 0000D9A0 C0390010 */ lfs f1, 0x10(r25)
/* 0000D9A4 38600037 */ li r3, 0x37
/* 0000D9A8 C013006C */ lfs f0, 0x6c(r19)
/* 0000D9AC 90010064 */ stw r0, 0x64(r1)
/* 0000D9B0 EC010032 */ fmuls f0, f1, f0
/* 0000D9B4 C8440000 */ lfd f2, lbl_00011D00@l(r4)
/* 0000D9B8 93610060 */ stw r27, 0x60(r1)
/* 0000D9BC FC00001E */ fctiwz f0, f0
/* 0000D9C0 C8210060 */ lfd f1, 0x60(r1)
/* 0000D9C4 EC211028 */ fsubs f1, f1, f2
/* 0000D9C8 D8010068 */ stfd f0, 0x68(r1)
/* 0000D9CC 8001006C */ lwz r0, 0x6c(r1)
/* 0000D9D0 EF9E082A */ fadds f28, f30, f1
/* 0000D9D4 5400C00E */ slwi r0, r0, 0x18
/* 0000D9D8 640000FF */ oris r0, r0, 0xff
/* 0000D9DC 6000FFFF */ ori r0, r0, 0xffff
/* 0000D9E0 90010044 */ stw r0, 0x44(r1)
/* 0000D9E4 4BFF27A5 */ bl set_text_font
/* 0000D9E8 807F0000 */ lwz r3, 0(r31)
/* 0000D9EC 38800001 */ li r4, 1
/* 0000D9F0 A8030002 */ lha r0, 2(r3)
/* 0000D9F4 2C000003 */ cmpwi r0, 3
/* 0000D9F8 41820014 */ beq lbl_0000DA0C
/* 0000D9FC 801D0000 */ lwz r0, 0(r29)
/* 0000DA00 7C140000 */ cmpw r20, r0
/* 0000DA04 40800008 */ bge lbl_0000DA0C
/* 0000DA08 38800000 */ li r4, 0
lbl_0000DA0C:
/* 0000DA0C 2C040000 */ cmpwi r4, 0
/* 0000DA10 4182000C */ beq lbl_0000DA1C
/* 0000DA14 38600000 */ li r3, 0
/* 0000DA18 48000008 */ b lbl_0000DA20
lbl_0000DA1C:
/* 0000DA1C 387EFFFF */ addi r3, r30, -1  ;# fixed addi
lbl_0000DA20:
/* 0000DA20 4BFF2769 */ bl set_text_mul_color
/* 0000DA24 C0390078 */ lfs f1, 0x78(r25)
/* 0000DA28 C0190318 */ lfs f0, 0x318(r25)
/* 0000DA2C EC3C0828 */ fsubs f1, f28, f1
/* 0000DA30 EC40E82A */ fadds f2, f0, f29
/* 0000DA34 4BFF2755 */ bl set_text_pos
/* 0000DA38 807F0000 */ lwz r3, 0(r31)
/* 0000DA3C 80030004 */ lwz r0, 4(r3)
/* 0000DA40 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000DA44 41820010 */ beq lbl_0000DA54
/* 0000DA48 38784134 */ addi r3, r24, 0x4134
/* 0000DA4C 4BFF273D */ bl u_draw_text
/* 0000DA50 48000018 */ b lbl_0000DA68
lbl_0000DA54:
/* 0000DA54 A8830002 */ lha r4, 2(r3)
/* 0000DA58 38783CEC */ addi r3, r24, 0x3cec
/* 0000DA5C 4CC63182 */ crclr 6
/* 0000DA60 38840004 */ addi r4, r4, 4
/* 0000DA64 4BFF2725 */ bl func_80072AC0
lbl_0000DA68:
/* 0000DA68 801C0000 */ lwz r0, 0(r28)
/* 0000DA6C 7C140000 */ cmpw r20, r0
/* 0000DA70 41800080 */ blt lbl_0000DAF0
/* 0000DA74 38000428 */ li r0, 0x428
/* 0000DA78 9001000C */ stw r0, 0xc(r1)
/* 0000DA7C D3810010 */ stfs f28, 0x10(r1)
/* 0000DA80 D3A10014 */ stfs f29, 0x14(r1)
/* 0000DA84 C033004C */ lfs f1, 0x4c(r19)
/* 0000DA88 C8190190 */ lfd f0, 0x190(r25)
/* 0000DA8C FC010028 */ fsub f0, f1, f0
/* 0000DA90 FC000018 */ frsp f0, f0
/* 0000DA94 D0010018 */ stfs f0, 0x18(r1)
/* 0000DA98 C8390320 */ lfd f1, 0x320(r25)
/* 0000DA9C C0130040 */ lfs f0, 0x40(r19)
/* 0000DAA0 FC010032 */ fmul f0, f1, f0
/* 0000DAA4 FC000018 */ frsp f0, f0
/* 0000DAA8 D001001C */ stfs f0, 0x1c(r1)
/* 0000DAAC C8390328 */ lfd f1, 0x328(r25)
/* 0000DAB0 C0130044 */ lfs f0, 0x44(r19)
/* 0000DAB4 FC010032 */ fmul f0, f1, f0
/* 0000DAB8 FC000018 */ frsp f0, f0
/* 0000DABC D0010020 */ stfs f0, 0x20(r1)
/* 0000DAC0 801A0000 */ lwz r0, 0(r26)
/* 0000DAC4 54007420 */ rlwinm r0, r0, 0xe, 0x10, 0x10
/* 0000DAC8 90010034 */ stw r0, 0x34(r1)
/* 0000DACC 801D0000 */ lwz r0, 0(r29)
/* 0000DAD0 7C140000 */ cmpw r20, r0
/* 0000DAD4 4180000C */ blt lbl_0000DAE0
/* 0000DAD8 38000000 */ li r0, 0
/* 0000DADC 48000008 */ b lbl_0000DAE4
lbl_0000DAE0:
/* 0000DAE0 381EFFFF */ addi r0, r30, -1  ;# fixed addi
lbl_0000DAE4:
/* 0000DAE4 90010044 */ stw r0, 0x44(r1)
/* 0000DAE8 3861000C */ addi r3, r1, 0xc
/* 0000DAEC 4BFF269D */ bl draw_naomi_sprite
lbl_0000DAF0:
/* 0000DAF0 801D0000 */ lwz r0, 0(r29)
/* 0000DAF4 7C140000 */ cmpw r20, r0
/* 0000DAF8 40800170 */ bge lbl_0000DC68
/* 0000DAFC 807F0000 */ lwz r3, 0(r31)
/* 0000DB00 A8030002 */ lha r0, 2(r3)
/* 0000DB04 2C000003 */ cmpwi r0, 3
/* 0000DB08 41820160 */ beq lbl_0000DC68
/* 0000DB0C C033004C */ lfs f1, 0x4c(r19)
/* 0000DB10 C8190190 */ lfd f0, 0x190(r25)
/* 0000DB14 FC210028 */ fsub f1, f1, f0
/* 0000DB18 FC200818 */ frsp f1, f1
/* 0000DB1C 4BFF266D */ bl func_80071B1C
/* 0000DB20 387EFF00 */ addi r3, r30, -256  ;# fixed addi
/* 0000DB24 4BFF2665 */ bl set_text_mul_color
/* 0000DB28 807F0000 */ lwz r3, 0(r31)
/* 0000DB2C 80630004 */ lwz r3, 4(r3)
/* 0000DB30 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 0000DB34 41820064 */ beq lbl_0000DB98
/* 0000DB38 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 0000DB3C 4082005C */ bne lbl_0000DB98
/* 0000DB40 38600034 */ li r3, 0x34
/* 0000DB44 4BFF2645 */ bl set_text_font
/* 0000DB48 C0190078 */ lfs f0, 0x78(r25)
/* 0000DB4C C0390070 */ lfs f1, 0x70(r25)
/* 0000DB50 EC40E82A */ fadds f2, f0, f29
/* 0000DB54 C8190000 */ lfd f0, 0(r25)
/* 0000DB58 EC21E02A */ fadds f1, f1, f28
/* 0000DB5C FF620028 */ fsub f27, f2, f0
/* 0000DB60 FC40D818 */ frsp f2, f27
/* 0000DB64 4BFF2625 */ bl set_text_pos
/* 0000DB68 809F0000 */ lwz r4, 0(r31)
/* 0000DB6C 38783D54 */ addi r3, r24, 0x3d54
/* 0000DB70 4CC63182 */ crclr 6
/* 0000DB74 A8840000 */ lha r4, 0(r4)
/* 0000DB78 4BFF2611 */ bl func_80072AC0
/* 0000DB7C C0190188 */ lfs f0, 0x188(r25)
/* 0000DB80 FC40D818 */ frsp f2, f27
/* 0000DB84 EC3C0028 */ fsubs f1, f28, f0
/* 0000DB88 4BFF2601 */ bl set_text_pos
/* 0000DB8C 38784138 */ addi r3, r24, 0x4138
/* 0000DB90 4BFF25F9 */ bl u_draw_text
/* 0000DB94 4800003C */ b lbl_0000DBD0
lbl_0000DB98:
/* 0000DB98 38600035 */ li r3, 0x35
/* 0000DB9C 4BFF25ED */ bl set_text_font
/* 0000DBA0 C0590078 */ lfs f2, 0x78(r25)
/* 0000DBA4 FC20E090 */ fmr f1, f28
/* 0000DBA8 C8190000 */ lfd f0, 0(r25)
/* 0000DBAC EC42E82A */ fadds f2, f2, f29
/* 0000DBB0 FC420028 */ fsub f2, f2, f0
/* 0000DBB4 FC401018 */ frsp f2, f2
/* 0000DBB8 4BFF25D1 */ bl set_text_pos
/* 0000DBBC 809F0000 */ lwz r4, 0(r31)
/* 0000DBC0 38783D54 */ addi r3, r24, 0x3d54
/* 0000DBC4 4CC63182 */ crclr 6
/* 0000DBC8 A8840000 */ lha r4, 0(r4)
/* 0000DBCC 4BFF25BD */ bl func_80072AC0
lbl_0000DBD0:
/* 0000DBD0 80130048 */ lwz r0, 0x48(r19)
/* 0000DBD4 2C000000 */ cmpwi r0, 0
/* 0000DBD8 41820090 */ beq lbl_0000DC68
/* 0000DBDC 2C000001 */ cmpwi r0, 1
/* 0000DBE0 41820088 */ beq lbl_0000DC68
/* 0000DBE4 801C0000 */ lwz r0, 0(r28)
/* 0000DBE8 7C140000 */ cmpw r20, r0
/* 0000DBEC 4082007C */ bne lbl_0000DC68
/* 0000DBF0 C0390010 */ lfs f1, 0x10(r25)
/* 0000DBF4 38800432 */ li r4, 0x432
/* 0000DBF8 C013006C */ lfs f0, 0x6c(r19)
/* 0000DBFC 38000000 */ li r0, 0
/* 0000DC00 3861000C */ addi r3, r1, 0xc
/* 0000DC04 EC010032 */ fmuls f0, f1, f0
/* 0000DC08 FC00001E */ fctiwz f0, f0
/* 0000DC0C D8010060 */ stfd f0, 0x60(r1)
/* 0000DC10 80A10064 */ lwz r5, 0x64(r1)
/* 0000DC14 54A5C00E */ slwi r5, r5, 0x18
/* 0000DC18 64A500FF */ oris r5, r5, 0xff
/* 0000DC1C 60A500FF */ ori r5, r5, 0xff
/* 0000DC20 7CA5AB78 */ or r5, r5, r21
/* 0000DC24 90A10044 */ stw r5, 0x44(r1)
/* 0000DC28 9081000C */ stw r4, 0xc(r1)
/* 0000DC2C C019000C */ lfs f0, 0xc(r25)
/* 0000DC30 EC00E02A */ fadds f0, f0, f28
/* 0000DC34 D0010010 */ stfs f0, 0x10(r1)
/* 0000DC38 D3E10014 */ stfs f31, 0x14(r1)
/* 0000DC3C C033004C */ lfs f1, 0x4c(r19)
/* 0000DC40 C8190330 */ lfd f0, 0x330(r25)
/* 0000DC44 FC010028 */ fsub f0, f1, f0
/* 0000DC48 FC000018 */ frsp f0, f0
/* 0000DC4C D0010018 */ stfs f0, 0x18(r1)
/* 0000DC50 C019000C */ lfs f0, 0xc(r25)
/* 0000DC54 D001001C */ stfs f0, 0x1c(r1)
/* 0000DC58 C019000C */ lfs f0, 0xc(r25)
/* 0000DC5C D0010020 */ stfs f0, 0x20(r1)
/* 0000DC60 90010034 */ stw r0, 0x34(r1)
/* 0000DC64 4BFF2525 */ bl draw_naomi_sprite
lbl_0000DC68:
/* 0000DC68 3A940001 */ addi r20, r20, 1
/* 0000DC6C 2C140005 */ cmpwi r20, 5
/* 0000DC70 3AF70008 */ addi r23, r23, 8
/* 0000DC74 3AD60027 */ addi r22, r22, 0x27
/* 0000DC78 4180FD1C */ blt lbl_0000D994
/* 0000DC7C BA610074 */ lmw r19, 0x74(r1)
/* 0000DC80 800100D4 */ lwz r0, 0xd4(r1)
/* 0000DC84 CBE100C8 */ lfd f31, 0xc8(r1)
/* 0000DC88 CBC100C0 */ lfd f30, 0xc0(r1)
/* 0000DC8C 7C0803A6 */ mtlr r0
/* 0000DC90 CBA100B8 */ lfd f29, 0xb8(r1)
/* 0000DC94 CB8100B0 */ lfd f28, 0xb0(r1)
/* 0000DC98 CB6100A8 */ lfd f27, 0xa8(r1)
/* 0000DC9C 382100D0 */ addi r1, r1, 0xd0
/* 0000DCA0 4E800020 */ blr 
lbl_0000DCA4:
/* 0000DCA4 7C0802A6 */ mflr r0
/* 0000DCA8 3C600000 */ lis r3, lbl_000127D8@ha
/* 0000DCAC 90010004 */ stw r0, 4(r1)
/* 0000DCB0 3CA00000 */ lis r5, lbl_00011CB0@ha
/* 0000DCB4 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000DCB8 93E1001C */ stw r31, 0x1c(r1)
/* 0000DCBC 7C9F2378 */ mr r31, r4
/* 0000DCC0 93C10018 */ stw r30, 0x18(r1)
/* 0000DCC4 3BC50000 */ addi r30, r5, lbl_00011CB0@l
/* 0000DCC8 80040048 */ lwz r0, 0x48(r4)
/* 0000DCCC C0440004 */ lfs f2, 4(r4)
/* 0000DCD0 38830000 */ addi r4, r3, lbl_000127D8@l
/* 0000DCD4 54001838 */ slwi r0, r0, 3
/* 0000DCD8 C83E0058 */ lfd f1, 0x58(r30)
/* 0000DCDC 7C640214 */ add r3, r4, r0
/* 0000DCE0 C0030000 */ lfs f0, 0(r3)
/* 0000DCE4 3860001B */ li r3, 0x1b
/* 0000DCE8 EC001028 */ fsubs f0, f0, f2
/* 0000DCEC FC010032 */ fmul f0, f1, f0
/* 0000DCF0 FC02002A */ fadd f0, f2, f0
/* 0000DCF4 FC000018 */ frsp f0, f0
/* 0000DCF8 D01F0004 */ stfs f0, 4(r31)
/* 0000DCFC 801F0048 */ lwz r0, 0x48(r31)
/* 0000DD00 C05F0008 */ lfs f2, 8(r31)
/* 0000DD04 54001838 */ slwi r0, r0, 3
/* 0000DD08 C83E0058 */ lfd f1, 0x58(r30)
/* 0000DD0C 7C840214 */ add r4, r4, r0
/* 0000DD10 C0040004 */ lfs f0, 4(r4)
/* 0000DD14 EC001028 */ fsubs f0, f0, f2
/* 0000DD18 FC010032 */ fmul f0, f1, f0
/* 0000DD1C FC02002A */ fadd f0, f2, f0
/* 0000DD20 FC000018 */ frsp f0, f0
/* 0000DD24 D01F0008 */ stfs f0, 8(r31)
/* 0000DD28 4BFF2461 */ bl find_sprite_with_tag
/* 0000DD2C 80030048 */ lwz r0, 0x48(r3)
/* 0000DD30 2C000000 */ cmpwi r0, 0
/* 0000DD34 408200A8 */ bne lbl_0000DDDC
/* 0000DD38 38600022 */ li r3, 0x22
/* 0000DD3C 4BFF244D */ bl find_sprite_with_tag
/* 0000DD40 80030048 */ lwz r0, 0x48(r3)
/* 0000DD44 2C000000 */ cmpwi r0, 0
/* 0000DD48 40820094 */ bne lbl_0000DDDC
/* 0000DD4C C03E0338 */ lfs f1, 0x338(r30)
/* 0000DD50 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000DD54 C01F0004 */ lfs f0, 4(r31)
/* 0000DD58 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000DD5C EC01002A */ fadds f0, f1, f0
/* 0000DD60 D00300F8 */ stfs f0, 0xf8(r3)
/* 0000DD64 C01E033C */ lfs f0, 0x33c(r30)
/* 0000DD68 D00300FC */ stfs f0, 0xfc(r3)
/* 0000DD6C 801F0048 */ lwz r0, 0x48(r31)
/* 0000DD70 2C000000 */ cmpwi r0, 0
/* 0000DD74 4082000C */ bne lbl_0000DD80
/* 0000DD78 38000000 */ li r0, 0
/* 0000DD7C 48000008 */ b lbl_0000DD84
lbl_0000DD80:
/* 0000DD80 380000C8 */ li r0, 0xc8
lbl_0000DD84:
/* 0000DD84 6C008000 */ xoris r0, r0, 0x8000
/* 0000DD88 90010014 */ stw r0, 0x14(r1)
/* 0000DD8C 3C004330 */ lis r0, 0x4330
/* 0000DD90 3C800000 */ lis r4, lbl_00011D00@ha
/* 0000DD94 90010010 */ stw r0, 0x10(r1)
/* 0000DD98 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000DD9C C8240000 */ lfd f1, lbl_00011D00@l(r4)
/* 0000DDA0 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000DDA4 C8010010 */ lfd f0, 0x10(r1)
/* 0000DDA8 EC000828 */ fsubs f0, f0, f1
/* 0000DDAC D0030100 */ stfs f0, 0x100(r3)
/* 0000DDB0 C01E0340 */ lfs f0, 0x340(r30)
/* 0000DDB4 D0030104 */ stfs f0, 0x104(r3)
/* 0000DDB8 801F0048 */ lwz r0, 0x48(r31)
/* 0000DDBC 2C000003 */ cmpwi r0, 3
/* 0000DDC0 4082001C */ bne lbl_0000DDDC
/* 0000DDC4 C03F0004 */ lfs f1, 4(r31)
/* 0000DDC8 C01E0344 */ lfs f0, 0x344(r30)
/* 0000DDCC FC010040 */ fcmpo cr0, f1, f0
/* 0000DDD0 4081000C */ ble lbl_0000DDDC
/* 0000DDD4 38000000 */ li r0, 0
/* 0000DDD8 901F0048 */ stw r0, 0x48(r31)
lbl_0000DDDC:
/* 0000DDDC 80010024 */ lwz r0, 0x24(r1)
/* 0000DDE0 83E1001C */ lwz r31, 0x1c(r1)
/* 0000DDE4 83C10018 */ lwz r30, 0x18(r1)
/* 0000DDE8 7C0803A6 */ mtlr r0
/* 0000DDEC 38210020 */ addi r1, r1, 0x20
/* 0000DDF0 4E800020 */ blr 
lbl_0000DDF4:
/* 0000DDF4 7C0802A6 */ mflr r0
/* 0000DDF8 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000DDFC 90010004 */ stw r0, 4(r1)
/* 0000DE00 38A40000 */ addi r5, r4, lbl_00011CB0@l
/* 0000DE04 3880FFFF */ li r4, -1
/* 0000DE08 9421FF98 */ stwu r1, -0x68(r1)
/* 0000DE0C 38000000 */ li r0, 0
/* 0000DE10 C0050008 */ lfs f0, 8(r5)
/* 0000DE14 D0010024 */ stfs f0, 0x24(r1)
/* 0000DE18 C0050008 */ lfs f0, 8(r5)
/* 0000DE1C D0010028 */ stfs f0, 0x28(r1)
/* 0000DE20 C005000C */ lfs f0, 0xc(r5)
/* 0000DE24 D001002C */ stfs f0, 0x2c(r1)
/* 0000DE28 C005000C */ lfs f0, 0xc(r5)
/* 0000DE2C D0010030 */ stfs f0, 0x30(r1)
/* 0000DE30 C003006C */ lfs f0, 0x6c(r3)
/* 0000DE34 D0010038 */ stfs f0, 0x38(r1)
/* 0000DE38 9081003C */ stw r4, 0x3c(r1)
/* 0000DE3C 80830074 */ lwz r4, 0x74(r3)
/* 0000DE40 54840036 */ rlwinm r4, r4, 0, 0, 0x1b
/* 0000DE44 6084000A */ ori r4, r4, 0xa
/* 0000DE48 90810040 */ stw r4, 0x40(r1)
/* 0000DE4C C0250010 */ lfs f1, 0x10(r5)
/* 0000DE50 C003006C */ lfs f0, 0x6c(r3)
/* 0000DE54 EC010032 */ fmuls f0, f1, f0
/* 0000DE58 FC00001E */ fctiwz f0, f0
/* 0000DE5C D8010060 */ stfd f0, 0x60(r1)
/* 0000DE60 80810064 */ lwz r4, 0x64(r1)
/* 0000DE64 5484C00E */ slwi r4, r4, 0x18
/* 0000DE68 648400FF */ oris r4, r4, 0xff
/* 0000DE6C 6084FFFF */ ori r4, r4, 0xffff
/* 0000DE70 90810044 */ stw r4, 0x44(r1)
/* 0000DE74 90010048 */ stw r0, 0x48(r1)
/* 0000DE78 A003003C */ lhz r0, 0x3c(r3)
/* 0000DE7C 9001000C */ stw r0, 0xc(r1)
/* 0000DE80 C0030004 */ lfs f0, 4(r3)
/* 0000DE84 D0010010 */ stfs f0, 0x10(r1)
/* 0000DE88 C0030008 */ lfs f0, 8(r3)
/* 0000DE8C D0010014 */ stfs f0, 0x14(r1)
/* 0000DE90 C003004C */ lfs f0, 0x4c(r3)
/* 0000DE94 D0010018 */ stfs f0, 0x18(r1)
/* 0000DE98 C0030040 */ lfs f0, 0x40(r3)
/* 0000DE9C D001001C */ stfs f0, 0x1c(r1)
/* 0000DEA0 C0030044 */ lfs f0, 0x44(r3)
/* 0000DEA4 D0010020 */ stfs f0, 0x20(r1)
/* 0000DEA8 A8030068 */ lha r0, 0x68(r3)
/* 0000DEAC 3861000C */ addi r3, r1, 0xc
/* 0000DEB0 90010034 */ stw r0, 0x34(r1)
/* 0000DEB4 4BFF22D5 */ bl draw_naomi_sprite
/* 0000DEB8 8001006C */ lwz r0, 0x6c(r1)
/* 0000DEBC 38210068 */ addi r1, r1, 0x68
/* 0000DEC0 7C0803A6 */ mtlr r0
/* 0000DEC4 4E800020 */ blr 
lbl_0000DEC8:
/* 0000DEC8 7C0802A6 */ mflr r0
/* 0000DECC 3C600000 */ lis r3, lbl_000127F8@ha
/* 0000DED0 90010004 */ stw r0, 4(r1)
/* 0000DED4 3CA00000 */ lis r5, lbl_00011CB0@ha
/* 0000DED8 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000DEDC 93E1001C */ stw r31, 0x1c(r1)
/* 0000DEE0 3BE50000 */ addi r31, r5, lbl_00011CB0@l
/* 0000DEE4 93C10018 */ stw r30, 0x18(r1)
/* 0000DEE8 7C9E2378 */ mr r30, r4
/* 0000DEEC 80040048 */ lwz r0, 0x48(r4)
/* 0000DEF0 C0440004 */ lfs f2, 4(r4)
/* 0000DEF4 38830000 */ addi r4, r3, lbl_000127F8@l
/* 0000DEF8 54001838 */ slwi r0, r0, 3
/* 0000DEFC C83F0058 */ lfd f1, 0x58(r31)
/* 0000DF00 7C640214 */ add r3, r4, r0
/* 0000DF04 C0030000 */ lfs f0, 0(r3)
/* 0000DF08 3860001B */ li r3, 0x1b
/* 0000DF0C EC001028 */ fsubs f0, f0, f2
/* 0000DF10 FC010032 */ fmul f0, f1, f0
/* 0000DF14 FC02002A */ fadd f0, f2, f0
/* 0000DF18 FC000018 */ frsp f0, f0
/* 0000DF1C D01E0004 */ stfs f0, 4(r30)
/* 0000DF20 801E0048 */ lwz r0, 0x48(r30)
/* 0000DF24 C05E0008 */ lfs f2, 8(r30)
/* 0000DF28 54001838 */ slwi r0, r0, 3
/* 0000DF2C C83F0058 */ lfd f1, 0x58(r31)
/* 0000DF30 7C840214 */ add r4, r4, r0
/* 0000DF34 C0040004 */ lfs f0, 4(r4)
/* 0000DF38 EC001028 */ fsubs f0, f0, f2
/* 0000DF3C FC010032 */ fmul f0, f1, f0
/* 0000DF40 FC02002A */ fadd f0, f2, f0
/* 0000DF44 FC000018 */ frsp f0, f0
/* 0000DF48 D01E0008 */ stfs f0, 8(r30)
/* 0000DF4C 4BFF223D */ bl find_sprite_with_tag
/* 0000DF50 80030048 */ lwz r0, 0x48(r3)
/* 0000DF54 2C000000 */ cmpwi r0, 0
/* 0000DF58 408200F8 */ bne lbl_0000E050
/* 0000DF5C 38600021 */ li r3, 0x21
/* 0000DF60 4BFF2229 */ bl find_sprite_with_tag
/* 0000DF64 80030048 */ lwz r0, 0x48(r3)
/* 0000DF68 2C000000 */ cmpwi r0, 0
/* 0000DF6C 408200E4 */ bne lbl_0000E050
/* 0000DF70 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000DF74 C03E0004 */ lfs f1, 4(r30)
/* 0000DF78 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000DF7C C01F0348 */ lfs f0, 0x348(r31)
/* 0000DF80 8803000A */ lbz r0, 0xa(r3)
/* 0000DF84 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000DF88 EC410028 */ fsubs f2, f1, f0
/* 0000DF8C C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000DF90 7C000774 */ extsb r0, r0
/* 0000DF94 1C0000B2 */ mulli r0, r0, 0xb2
/* 0000DF98 6C008000 */ xoris r0, r0, 0x8000
/* 0000DF9C 90010014 */ stw r0, 0x14(r1)
/* 0000DFA0 3C004330 */ lis r0, 0x4330
/* 0000DFA4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000DFA8 90010010 */ stw r0, 0x10(r1)
/* 0000DFAC 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000DFB0 38000001 */ li r0, 1
/* 0000DFB4 C8010010 */ lfd f0, 0x10(r1)
/* 0000DFB8 EC000828 */ fsubs f0, f0, f1
/* 0000DFBC EC02002A */ fadds f0, f2, f0
/* 0000DFC0 D00300F8 */ stfs f0, 0xf8(r3)
/* 0000DFC4 C01F034C */ lfs f0, 0x34c(r31)
/* 0000DFC8 D00300FC */ stfs f0, 0xfc(r3)
/* 0000DFCC 807E0048 */ lwz r3, 0x48(r30)
/* 0000DFD0 2C030000 */ cmpwi r3, 0
/* 0000DFD4 41820010 */ beq lbl_0000DFE4
/* 0000DFD8 2C030001 */ cmpwi r3, 1
/* 0000DFDC 41820008 */ beq lbl_0000DFE4
/* 0000DFE0 38000000 */ li r0, 0
lbl_0000DFE4:
/* 0000DFE4 2C000000 */ cmpwi r0, 0
/* 0000DFE8 4182000C */ beq lbl_0000DFF4
/* 0000DFEC 38000000 */ li r0, 0
/* 0000DFF0 48000008 */ b lbl_0000DFF8
lbl_0000DFF4:
/* 0000DFF4 380000AC */ li r0, 0xac
lbl_0000DFF8:
/* 0000DFF8 6C008000 */ xoris r0, r0, 0x8000
/* 0000DFFC 90010014 */ stw r0, 0x14(r1)
/* 0000E000 3C004330 */ lis r0, 0x4330
/* 0000E004 3C800000 */ lis r4, lbl_00011D00@ha
/* 0000E008 90010010 */ stw r0, 0x10(r1)
/* 0000E00C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000E010 C8240000 */ lfd f1, lbl_00011D00@l(r4)
/* 0000E014 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0000E018 C8010010 */ lfd f0, 0x10(r1)
/* 0000E01C EC000828 */ fsubs f0, f0, f1
/* 0000E020 D0030100 */ stfs f0, 0x100(r3)
/* 0000E024 C01F0350 */ lfs f0, 0x350(r31)
/* 0000E028 D0030104 */ stfs f0, 0x104(r3)
/* 0000E02C 801E0048 */ lwz r0, 0x48(r30)
/* 0000E030 2C000003 */ cmpwi r0, 3
/* 0000E034 4082001C */ bne lbl_0000E050
/* 0000E038 C03E0004 */ lfs f1, 4(r30)
/* 0000E03C C01F0354 */ lfs f0, 0x354(r31)
/* 0000E040 FC010040 */ fcmpo cr0, f1, f0
/* 0000E044 4080000C */ bge lbl_0000E050
/* 0000E048 38000000 */ li r0, 0
/* 0000E04C 901E0048 */ stw r0, 0x48(r30)
lbl_0000E050:
/* 0000E050 80010024 */ lwz r0, 0x24(r1)
/* 0000E054 83E1001C */ lwz r31, 0x1c(r1)
/* 0000E058 83C10018 */ lwz r30, 0x18(r1)
/* 0000E05C 7C0803A6 */ mtlr r0
/* 0000E060 38210020 */ addi r1, r1, 0x20
/* 0000E064 4E800020 */ blr 
lbl_0000E068:
/* 0000E068 7C0802A6 */ mflr r0
/* 0000E06C 3C800000 */ lis r4, unpausedFrameCounter@ha
/* 0000E070 90010004 */ stw r0, 4(r1)
/* 0000E074 3CA00000 */ lis r5, lbl_00011CB0@ha
/* 0000E078 9421FF68 */ stwu r1, -0x98(r1)
/* 0000E07C BEE10074 */ stmw r23, 0x74(r1)
/* 0000E080 3BC40000 */ addi r30, r4, unpausedFrameCounter@l
/* 0000E084 3C800000 */ lis r4, lbl_801EED98@ha
/* 0000E088 3B030000 */ addi r24, r3, 0
/* 0000E08C 3B850000 */ addi r28, r5, lbl_00011CB0@l
/* 0000E090 3BA40000 */ addi r29, r4, lbl_801EED98@l
/* 0000E094 801E0000 */ lwz r0, 0(r30)
/* 0000E098 5403482C */ slwi r3, r0, 9
/* 0000E09C 4BFF20ED */ bl mathutil_sin
/* 0000E0A0 C85C0310 */ lfd f2, 0x310(r28)
/* 0000E0A4 FC200A10 */ fabs f1, f1
/* 0000E0A8 C01C0008 */ lfs f0, 8(r28)
/* 0000E0AC 3800FFFF */ li r0, -1
/* 0000E0B0 3B600000 */ li r27, 0
/* 0000E0B4 D0010024 */ stfs f0, 0x24(r1)
/* 0000E0B8 FC220072 */ fmul f1, f2, f1
/* 0000E0BC 3861000C */ addi r3, r1, 0xc
/* 0000E0C0 C01C0008 */ lfs f0, 8(r28)
/* 0000E0C4 D0010028 */ stfs f0, 0x28(r1)
/* 0000E0C8 FC20081E */ fctiwz f1, f1
/* 0000E0CC C01C000C */ lfs f0, 0xc(r28)
/* 0000E0D0 D001002C */ stfs f0, 0x2c(r1)
/* 0000E0D4 C01C000C */ lfs f0, 0xc(r28)
/* 0000E0D8 D8210068 */ stfd f1, 0x68(r1)
/* 0000E0DC D0010030 */ stfs f0, 0x30(r1)
/* 0000E0E0 82E1006C */ lwz r23, 0x6c(r1)
/* 0000E0E4 C018006C */ lfs f0, 0x6c(r24)
/* 0000E0E8 D0010038 */ stfs f0, 0x38(r1)
/* 0000E0EC 9001003C */ stw r0, 0x3c(r1)
/* 0000E0F0 80180074 */ lwz r0, 0x74(r24)
/* 0000E0F4 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 0000E0F8 6000000A */ ori r0, r0, 0xa
/* 0000E0FC 90010040 */ stw r0, 0x40(r1)
/* 0000E100 C03C0010 */ lfs f1, 0x10(r28)
/* 0000E104 C018006C */ lfs f0, 0x6c(r24)
/* 0000E108 EC010032 */ fmuls f0, f1, f0
/* 0000E10C FC00001E */ fctiwz f0, f0
/* 0000E110 D8010060 */ stfd f0, 0x60(r1)
/* 0000E114 80010064 */ lwz r0, 0x64(r1)
/* 0000E118 5400C00E */ slwi r0, r0, 0x18
/* 0000E11C 640000FF */ oris r0, r0, 0xff
/* 0000E120 6000FFFF */ ori r0, r0, 0xffff
/* 0000E124 90010044 */ stw r0, 0x44(r1)
/* 0000E128 93610048 */ stw r27, 0x48(r1)
/* 0000E12C A018003C */ lhz r0, 0x3c(r24)
/* 0000E130 9001000C */ stw r0, 0xc(r1)
/* 0000E134 C0180004 */ lfs f0, 4(r24)
/* 0000E138 D0010010 */ stfs f0, 0x10(r1)
/* 0000E13C C0180008 */ lfs f0, 8(r24)
/* 0000E140 D0010014 */ stfs f0, 0x14(r1)
/* 0000E144 C018004C */ lfs f0, 0x4c(r24)
/* 0000E148 D0010018 */ stfs f0, 0x18(r1)
/* 0000E14C C0180040 */ lfs f0, 0x40(r24)
/* 0000E150 D001001C */ stfs f0, 0x1c(r1)
/* 0000E154 C0180044 */ lfs f0, 0x44(r24)
/* 0000E158 D0010020 */ stfs f0, 0x20(r1)
/* 0000E15C A8180068 */ lha r0, 0x68(r24)
/* 0000E160 90010034 */ stw r0, 0x34(r1)
/* 0000E164 4BFF2025 */ bl draw_naomi_sprite
/* 0000E168 56FA442E */ rlwinm r26, r23, 8, 0x10, 0x17
/* 0000E16C 3B200000 */ li r25, 0
/* 0000E170 3EE04330 */ lis r23, 0x4330
/* 0000E174 3FE00100 */ lis r31, 0x100
lbl_0000E178:
/* 0000E178 6F608000 */ xoris r0, r27, 0x8000
/* 0000E17C 90010064 */ stw r0, 0x64(r1)
/* 0000E180 38000428 */ li r0, 0x428
/* 0000E184 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000E188 9001000C */ stw r0, 0xc(r1)
/* 0000E18C 38800000 */ li r4, 0
/* 0000E190 92E10060 */ stw r23, 0x60(r1)
/* 0000E194 C07C0358 */ lfs f3, 0x358(r28)
/* 0000E198 C0580004 */ lfs f2, 4(r24)
/* 0000E19C C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000E1A0 C8010060 */ lfd f0, 0x60(r1)
/* 0000E1A4 EC43102A */ fadds f2, f3, f2
/* 0000E1A8 EC000828 */ fsubs f0, f0, f1
/* 0000E1AC EC02002A */ fadds f0, f2, f0
/* 0000E1B0 D0010010 */ stfs f0, 0x10(r1)
/* 0000E1B4 C03C0208 */ lfs f1, 0x208(r28)
/* 0000E1B8 C0180008 */ lfs f0, 8(r24)
/* 0000E1BC EC01002A */ fadds f0, f1, f0
/* 0000E1C0 D0010014 */ stfs f0, 0x14(r1)
/* 0000E1C4 C038004C */ lfs f1, 0x4c(r24)
/* 0000E1C8 C81C0360 */ lfd f0, 0x360(r28)
/* 0000E1CC FC010028 */ fsub f0, f1, f0
/* 0000E1D0 FC000018 */ frsp f0, f0
/* 0000E1D4 D0010018 */ stfs f0, 0x18(r1)
/* 0000E1D8 C83C0368 */ lfd f1, 0x368(r28)
/* 0000E1DC C0180040 */ lfs f0, 0x40(r24)
/* 0000E1E0 FC010032 */ fmul f0, f1, f0
/* 0000E1E4 FC000018 */ frsp f0, f0
/* 0000E1E8 D001001C */ stfs f0, 0x1c(r1)
/* 0000E1EC C83C0370 */ lfd f1, 0x370(r28)
/* 0000E1F0 C0180044 */ lfs f0, 0x44(r24)
/* 0000E1F4 FC010032 */ fmul f0, f1, f0
/* 0000E1F8 FC000018 */ frsp f0, f0
/* 0000E1FC D0010020 */ stfs f0, 0x20(r1)
/* 0000E200 801E0000 */ lwz r0, 0(r30)
/* 0000E204 54007420 */ rlwinm r0, r0, 0xe, 0x10, 0x10
/* 0000E208 90010034 */ stw r0, 0x34(r1)
/* 0000E20C 881D0004 */ lbz r0, 4(r29)
/* 0000E210 2C000001 */ cmpwi r0, 1
/* 0000E214 40820010 */ bne lbl_0000E224
/* 0000E218 2C190000 */ cmpwi r25, 0
/* 0000E21C 40810008 */ ble lbl_0000E224
/* 0000E220 38800001 */ li r4, 1
lbl_0000E224:
/* 0000E224 2C040000 */ cmpwi r4, 0
/* 0000E228 4182000C */ beq lbl_0000E234
/* 0000E22C 38000000 */ li r0, 0
/* 0000E230 48000008 */ b lbl_0000E238
lbl_0000E234:
/* 0000E234 381FFFFF */ addi r0, r31, -1  ;# fixed addi
lbl_0000E238:
/* 0000E238 90010044 */ stw r0, 0x44(r1)
/* 0000E23C 3861000C */ addi r3, r1, 0xc
/* 0000E240 4BFF1F49 */ bl draw_naomi_sprite
/* 0000E244 80180048 */ lwz r0, 0x48(r24)
/* 0000E248 2C000000 */ cmpwi r0, 0
/* 0000E24C 418200F8 */ beq lbl_0000E344
/* 0000E250 2C000001 */ cmpwi r0, 1
/* 0000E254 418200F0 */ beq lbl_0000E344
/* 0000E258 881D0009 */ lbz r0, 9(r29)
/* 0000E25C 7C000774 */ extsb r0, r0
/* 0000E260 7C00C800 */ cmpw r0, r25
/* 0000E264 408200E0 */ bne lbl_0000E344
/* 0000E268 881D0004 */ lbz r0, 4(r29)
/* 0000E26C 2C000001 */ cmpwi r0, 1
/* 0000E270 4082000C */ bne lbl_0000E27C
/* 0000E274 2C190000 */ cmpwi r25, 0
/* 0000E278 418100CC */ bgt lbl_0000E344
lbl_0000E27C:
/* 0000E27C 6F608000 */ xoris r0, r27, 0x8000
/* 0000E280 90010064 */ stw r0, 0x64(r1)
/* 0000E284 38000432 */ li r0, 0x432
/* 0000E288 3C800000 */ lis r4, lbl_00011D00@ha
/* 0000E28C 9001000C */ stw r0, 0xc(r1)
/* 0000E290 38000000 */ li r0, 0
/* 0000E294 3861000C */ addi r3, r1, 0xc
/* 0000E298 92E10060 */ stw r23, 0x60(r1)
/* 0000E29C C07C0358 */ lfs f3, 0x358(r28)
/* 0000E2A0 C0580004 */ lfs f2, 4(r24)
/* 0000E2A4 C8240000 */ lfd f1, lbl_00011D00@l(r4)
/* 0000E2A8 C8010060 */ lfd f0, 0x60(r1)
/* 0000E2AC EC43102A */ fadds f2, f3, f2
/* 0000E2B0 C07C0188 */ lfs f3, 0x188(r28)
/* 0000E2B4 EC000828 */ fsubs f0, f0, f1
/* 0000E2B8 EC02002A */ fadds f0, f2, f0
/* 0000E2BC EC03002A */ fadds f0, f3, f0
/* 0000E2C0 D0010010 */ stfs f0, 0x10(r1)
/* 0000E2C4 C03C0208 */ lfs f1, 0x208(r28)
/* 0000E2C8 C0180008 */ lfs f0, 8(r24)
/* 0000E2CC C05C0188 */ lfs f2, 0x188(r28)
/* 0000E2D0 EC01002A */ fadds f0, f1, f0
/* 0000E2D4 EC02002A */ fadds f0, f2, f0
/* 0000E2D8 D0010014 */ stfs f0, 0x14(r1)
/* 0000E2DC C038004C */ lfs f1, 0x4c(r24)
/* 0000E2E0 C81C02E0 */ lfd f0, 0x2e0(r28)
/* 0000E2E4 FC010028 */ fsub f0, f1, f0
/* 0000E2E8 FC000018 */ frsp f0, f0
/* 0000E2EC D0010018 */ stfs f0, 0x18(r1)
/* 0000E2F0 C83C0378 */ lfd f1, 0x378(r28)
/* 0000E2F4 C0180040 */ lfs f0, 0x40(r24)
/* 0000E2F8 FC010032 */ fmul f0, f1, f0
/* 0000E2FC FC000018 */ frsp f0, f0
/* 0000E300 D001001C */ stfs f0, 0x1c(r1)
/* 0000E304 C0180044 */ lfs f0, 0x44(r24)
/* 0000E308 FC000018 */ frsp f0, f0
/* 0000E30C D0010020 */ stfs f0, 0x20(r1)
/* 0000E310 90010034 */ stw r0, 0x34(r1)
/* 0000E314 C03C0010 */ lfs f1, 0x10(r28)
/* 0000E318 C018006C */ lfs f0, 0x6c(r24)
/* 0000E31C EC010032 */ fmuls f0, f1, f0
/* 0000E320 FC00001E */ fctiwz f0, f0
/* 0000E324 D8010068 */ stfd f0, 0x68(r1)
/* 0000E328 8001006C */ lwz r0, 0x6c(r1)
/* 0000E32C 5400C00E */ slwi r0, r0, 0x18
/* 0000E330 640000FF */ oris r0, r0, 0xff
/* 0000E334 600000FF */ ori r0, r0, 0xff
/* 0000E338 7C00D378 */ or r0, r0, r26
/* 0000E33C 90010044 */ stw r0, 0x44(r1)
/* 0000E340 4BFF1E49 */ bl draw_naomi_sprite
lbl_0000E344:
/* 0000E344 3B390001 */ addi r25, r25, 1
/* 0000E348 2C190003 */ cmpwi r25, 3
/* 0000E34C 3B7B0042 */ addi r27, r27, 0x42
/* 0000E350 4180FE28 */ blt lbl_0000E178
/* 0000E354 BAE10074 */ lmw r23, 0x74(r1)
/* 0000E358 8001009C */ lwz r0, 0x9c(r1)
/* 0000E35C 38210098 */ addi r1, r1, 0x98
/* 0000E360 7C0803A6 */ mtlr r0
/* 0000E364 4E800020 */ blr 
lbl_0000E368:
/* 0000E368 7C0802A6 */ mflr r0
/* 0000E36C 3860001B */ li r3, 0x1b
/* 0000E370 90010004 */ stw r0, 4(r1)
/* 0000E374 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000E378 93E1001C */ stw r31, 0x1c(r1)
/* 0000E37C 3BE40000 */ addi r31, r4, 0
/* 0000E380 4BFF1E09 */ bl find_sprite_with_tag
/* 0000E384 28030000 */ cmplwi r3, 0
/* 0000E388 418200A0 */ beq lbl_0000E428
/* 0000E38C 80030048 */ lwz r0, 0x48(r3)
/* 0000E390 38A00000 */ li r5, 0
/* 0000E394 2C000002 */ cmpwi r0, 2
/* 0000E398 40820018 */ bne lbl_0000E3B0
/* 0000E39C 3C800000 */ lis r4, u_isCompetitionModeCourse@ha
/* 0000E3A0 80040000 */ lwz r0, u_isCompetitionModeCourse@l(r4)
/* 0000E3A4 2C000000 */ cmpwi r0, 0
/* 0000E3A8 40820008 */ bne lbl_0000E3B0
/* 0000E3AC 38A00001 */ li r5, 1
lbl_0000E3B0:
/* 0000E3B0 2C050000 */ cmpwi r5, 0
/* 0000E3B4 4182000C */ beq lbl_0000E3C0
/* 0000E3B8 38000001 */ li r0, 1
/* 0000E3BC 48000008 */ b lbl_0000E3C4
lbl_0000E3C0:
/* 0000E3C0 38000000 */ li r0, 0
lbl_0000E3C4:
/* 0000E3C4 901F0048 */ stw r0, 0x48(r31)
/* 0000E3C8 3C800000 */ lis r4, lbl_00011D44@ha
/* 0000E3CC C0240000 */ lfs f1, lbl_00011D44@l(r4)
/* 0000E3D0 3C800000 */ lis r4, modeCtrl@ha
/* 0000E3D4 C0030004 */ lfs f0, 4(r3)
/* 0000E3D8 38840000 */ addi r4, r4, modeCtrl@l
/* 0000E3DC EC01002A */ fadds f0, f1, f0
/* 0000E3E0 D01F0004 */ stfs f0, 4(r31)
/* 0000E3E4 80040028 */ lwz r0, 0x28(r4)
/* 0000E3E8 2C000001 */ cmpwi r0, 1
/* 0000E3EC 4082000C */ bne lbl_0000E3F8
/* 0000E3F0 3800002C */ li r0, 0x2c
/* 0000E3F4 48000008 */ b lbl_0000E3FC
lbl_0000E3F8:
/* 0000E3F8 38000042 */ li r0, 0x42
lbl_0000E3FC:
/* 0000E3FC 6C008000 */ xoris r0, r0, 0x8000
/* 0000E400 C0430008 */ lfs f2, 8(r3)
/* 0000E404 90010014 */ stw r0, 0x14(r1)
/* 0000E408 3C004330 */ lis r0, 0x4330
/* 0000E40C 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000E410 90010010 */ stw r0, 0x10(r1)
/* 0000E414 C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000E418 C8010010 */ lfd f0, 0x10(r1)
/* 0000E41C EC000828 */ fsubs f0, f0, f1
/* 0000E420 EC02002A */ fadds f0, f2, f0
/* 0000E424 D01F0008 */ stfs f0, 8(r31)
lbl_0000E428:
/* 0000E428 80010024 */ lwz r0, 0x24(r1)
/* 0000E42C 83E1001C */ lwz r31, 0x1c(r1)
/* 0000E430 38210020 */ addi r1, r1, 0x20
/* 0000E434 7C0803A6 */ mtlr r0
/* 0000E438 4E800020 */ blr 
lbl_0000E43C:
/* 0000E43C 7C0802A6 */ mflr r0
/* 0000E440 38600021 */ li r3, 0x21
/* 0000E444 90010004 */ stw r0, 4(r1)
/* 0000E448 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E44C 93E10014 */ stw r31, 0x14(r1)
/* 0000E450 3BE40000 */ addi r31, r4, 0
/* 0000E454 4BFF1D35 */ bl find_sprite_with_tag
/* 0000E458 28030000 */ cmplwi r3, 0
/* 0000E45C 4182004C */ beq lbl_0000E4A8
/* 0000E460 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 0000E464 80040000 */ lwz r0, lbl_801EEDA8@l(r4)
/* 0000E468 2C00001F */ cmpwi r0, 0x1f
/* 0000E46C 4082000C */ bne lbl_0000E478
/* 0000E470 38000001 */ li r0, 1
/* 0000E474 48000008 */ b lbl_0000E47C
lbl_0000E478:
/* 0000E478 38000000 */ li r0, 0
lbl_0000E47C:
/* 0000E47C 901F0048 */ stw r0, 0x48(r31)
/* 0000E480 3C800000 */ lis r4, lbl_00012030@ha
/* 0000E484 C0240000 */ lfs f1, lbl_00012030@l(r4)
/* 0000E488 3C800000 */ lis r4, lbl_00012034@ha
/* 0000E48C C0030004 */ lfs f0, 4(r3)
/* 0000E490 EC01002A */ fadds f0, f1, f0
/* 0000E494 D01F0004 */ stfs f0, 4(r31)
/* 0000E498 C0240000 */ lfs f1, lbl_00012034@l(r4)
/* 0000E49C C0030008 */ lfs f0, 8(r3)
/* 0000E4A0 EC01002A */ fadds f0, f1, f0
/* 0000E4A4 D01F0008 */ stfs f0, 8(r31)
lbl_0000E4A8:
/* 0000E4A8 8001001C */ lwz r0, 0x1c(r1)
/* 0000E4AC 83E10014 */ lwz r31, 0x14(r1)
/* 0000E4B0 38210018 */ addi r1, r1, 0x18
/* 0000E4B4 7C0803A6 */ mtlr r0
/* 0000E4B8 4E800020 */ blr 
lbl_0000E4BC:
/* 0000E4BC 7C0802A6 */ mflr r0
/* 0000E4C0 38600022 */ li r3, 0x22
/* 0000E4C4 90010004 */ stw r0, 4(r1)
/* 0000E4C8 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E4CC 93E10014 */ stw r31, 0x14(r1)
/* 0000E4D0 3BE40000 */ addi r31, r4, 0
/* 0000E4D4 4BFF1CB5 */ bl find_sprite_with_tag
/* 0000E4D8 28030000 */ cmplwi r3, 0
/* 0000E4DC 41820050 */ beq lbl_0000E52C
/* 0000E4E0 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 0000E4E4 80040000 */ lwz r0, lbl_801EEDA8@l(r4)
/* 0000E4E8 2C000024 */ cmpwi r0, 0x24
/* 0000E4EC 4082000C */ bne lbl_0000E4F8
/* 0000E4F0 38000001 */ li r0, 1
/* 0000E4F4 48000008 */ b lbl_0000E4FC
lbl_0000E4F8:
/* 0000E4F8 38000000 */ li r0, 0
lbl_0000E4FC:
/* 0000E4FC 901F0048 */ stw r0, 0x48(r31)
/* 0000E500 3C800000 */ lis r4, lbl_00012038@ha
/* 0000E504 38A40000 */ addi r5, r4, lbl_00012038@l
/* 0000E508 C0230004 */ lfs f1, 4(r3)
/* 0000E50C 3C800000 */ lis r4, lbl_0001203C@ha
/* 0000E510 C0050000 */ lfs f0, 0(r5)
/* 0000E514 EC010028 */ fsubs f0, f1, f0
/* 0000E518 D01F0004 */ stfs f0, 4(r31)
/* 0000E51C C0240000 */ lfs f1, lbl_0001203C@l(r4)
/* 0000E520 C0030008 */ lfs f0, 8(r3)
/* 0000E524 EC01002A */ fadds f0, f1, f0
/* 0000E528 D01F0008 */ stfs f0, 8(r31)
lbl_0000E52C:
/* 0000E52C 8001001C */ lwz r0, 0x1c(r1)
/* 0000E530 83E10014 */ lwz r31, 0x14(r1)
/* 0000E534 38210018 */ addi r1, r1, 0x18
/* 0000E538 7C0803A6 */ mtlr r0
/* 0000E53C 4E800020 */ blr 
lbl_0000E540:
/* 0000E540 7C0802A6 */ mflr r0
/* 0000E544 90010004 */ stw r0, 4(r1)
/* 0000E548 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E54C 93E10014 */ stw r31, 0x14(r1)
/* 0000E550 93C10010 */ stw r30, 0x10(r1)
/* 0000E554 7C7E1B78 */ mr r30, r3
/* 0000E558 80030048 */ lwz r0, 0x48(r3)
/* 0000E55C 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000E560 3BE30000 */ addi r31, r3, lbl_00011CB0@l
/* 0000E564 2C000000 */ cmpwi r0, 0
/* 0000E568 418200A0 */ beq lbl_0000E608
/* 0000E56C 4BFF1C1D */ bl reset_text_draw_settings
/* 0000E570 3C600022 */ lis r3, 0x22
/* 0000E574 4BFF1C15 */ bl func_80071B50
/* 0000E578 887E0001 */ lbz r3, 1(r30)
/* 0000E57C 4BFF1C0D */ bl set_text_font
/* 0000E580 C03F0040 */ lfs f1, 0x40(r31)
/* 0000E584 FC400890 */ fmr f2, f1
/* 0000E588 4BFF1C01 */ bl set_text_scale
/* 0000E58C C83F0190 */ lfd f1, 0x190(r31)
/* 0000E590 C01E004C */ lfs f0, 0x4c(r30)
/* 0000E594 FC21002A */ fadd f1, f1, f0
/* 0000E598 FC200818 */ frsp f1, f1
/* 0000E59C 4BFF1BED */ bl func_80071B1C
/* 0000E5A0 C03E0004 */ lfs f1, 4(r30)
/* 0000E5A4 C01F0390 */ lfs f0, 0x390(r31)
/* 0000E5A8 C07F0070 */ lfs f3, 0x70(r31)
/* 0000E5AC EC210028 */ fsubs f1, f1, f0
/* 0000E5B0 C01E0008 */ lfs f0, 8(r30)
/* 0000E5B4 EC43002A */ fadds f2, f3, f0
/* 0000E5B8 EC23082A */ fadds f1, f3, f1
/* 0000E5BC 4BFF1BCD */ bl set_text_pos
/* 0000E5C0 38600000 */ li r3, 0
/* 0000E5C4 4BFF1BC5 */ bl set_text_mul_color
/* 0000E5C8 3C600000 */ lis r3, lbl_00016440@ha
/* 0000E5CC 38630000 */ addi r3, r3, lbl_00016440@l
/* 0000E5D0 4BFF1BB9 */ bl u_draw_text
/* 0000E5D4 C03E004C */ lfs f1, 0x4c(r30)
/* 0000E5D8 4BFF1BB1 */ bl func_80071B1C
/* 0000E5DC C03E0004 */ lfs f1, 4(r30)
/* 0000E5E0 C01F0390 */ lfs f0, 0x390(r31)
/* 0000E5E4 C05E0008 */ lfs f2, 8(r30)
/* 0000E5E8 EC210028 */ fsubs f1, f1, f0
/* 0000E5EC 4BFF1B9D */ bl set_text_pos
/* 0000E5F0 3C600100 */ lis r3, 0x100
/* 0000E5F4 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 0000E5F8 4BFF1B91 */ bl set_text_mul_color
/* 0000E5FC 3C600000 */ lis r3, lbl_00016420@ha
/* 0000E600 38630000 */ addi r3, r3, lbl_00016420@l
/* 0000E604 4BFF1B85 */ bl u_draw_text
lbl_0000E608:
/* 0000E608 8001001C */ lwz r0, 0x1c(r1)
/* 0000E60C 83E10014 */ lwz r31, 0x14(r1)
/* 0000E610 83C10010 */ lwz r30, 0x10(r1)
/* 0000E614 7C0803A6 */ mtlr r0
/* 0000E618 38210018 */ addi r1, r1, 0x18
/* 0000E61C 4E800020 */ blr 
lbl_0000E620:
/* 0000E620 7C0802A6 */ mflr r0
/* 0000E624 38A0FFFF */ li r5, -1
/* 0000E628 90010004 */ stw r0, 4(r1)
/* 0000E62C 38800000 */ li r4, 0
/* 0000E630 38000436 */ li r0, 0x436
/* 0000E634 9421FF90 */ stwu r1, -0x70(r1)
/* 0000E638 93E1006C */ stw r31, 0x6c(r1)
/* 0000E63C 93C10068 */ stw r30, 0x68(r1)
/* 0000E640 7C7E1B78 */ mr r30, r3
/* 0000E644 C003004C */ lfs f0, 0x4c(r3)
/* 0000E648 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000E64C 3BE30000 */ addi r31, r3, lbl_00011CB0@l
/* 0000E650 D0010018 */ stfs f0, 0x18(r1)
/* 0000E654 A87E0068 */ lha r3, 0x68(r30)
/* 0000E658 90610034 */ stw r3, 0x34(r1)
/* 0000E65C 3861000C */ addi r3, r1, 0xc
/* 0000E660 C01F0008 */ lfs f0, 8(r31)
/* 0000E664 D0010024 */ stfs f0, 0x24(r1)
/* 0000E668 C01F0008 */ lfs f0, 8(r31)
/* 0000E66C D0010028 */ stfs f0, 0x28(r1)
/* 0000E670 C01F000C */ lfs f0, 0xc(r31)
/* 0000E674 D001002C */ stfs f0, 0x2c(r1)
/* 0000E678 C01F000C */ lfs f0, 0xc(r31)
/* 0000E67C D0010030 */ stfs f0, 0x30(r1)
/* 0000E680 C01E0040 */ lfs f0, 0x40(r30)
/* 0000E684 D001001C */ stfs f0, 0x1c(r1)
/* 0000E688 C01E0044 */ lfs f0, 0x44(r30)
/* 0000E68C D0010020 */ stfs f0, 0x20(r1)
/* 0000E690 C01E006C */ lfs f0, 0x6c(r30)
/* 0000E694 D0010038 */ stfs f0, 0x38(r1)
/* 0000E698 90A1003C */ stw r5, 0x3c(r1)
/* 0000E69C 80BE0074 */ lwz r5, 0x74(r30)
/* 0000E6A0 54A50036 */ rlwinm r5, r5, 0, 0, 0x1b
/* 0000E6A4 60A5000A */ ori r5, r5, 0xa
/* 0000E6A8 90A10040 */ stw r5, 0x40(r1)
/* 0000E6AC C03F0010 */ lfs f1, 0x10(r31)
/* 0000E6B0 C01E006C */ lfs f0, 0x6c(r30)
/* 0000E6B4 EC010032 */ fmuls f0, f1, f0
/* 0000E6B8 FC00001E */ fctiwz f0, f0
/* 0000E6BC D8010060 */ stfd f0, 0x60(r1)
/* 0000E6C0 80A10064 */ lwz r5, 0x64(r1)
/* 0000E6C4 54A5C00E */ slwi r5, r5, 0x18
/* 0000E6C8 64A500FF */ oris r5, r5, 0xff
/* 0000E6CC 60A5FFFF */ ori r5, r5, 0xffff
/* 0000E6D0 90A10044 */ stw r5, 0x44(r1)
/* 0000E6D4 90810048 */ stw r4, 0x48(r1)
/* 0000E6D8 9001000C */ stw r0, 0xc(r1)
/* 0000E6DC C03E0004 */ lfs f1, 4(r30)
/* 0000E6E0 C01F0394 */ lfs f0, 0x394(r31)
/* 0000E6E4 EC010028 */ fsubs f0, f1, f0
/* 0000E6E8 D0010010 */ stfs f0, 0x10(r1)
/* 0000E6EC C03E0008 */ lfs f1, 8(r30)
/* 0000E6F0 C01F0398 */ lfs f0, 0x398(r31)
/* 0000E6F4 EC010028 */ fsubs f0, f1, f0
/* 0000E6F8 D0010014 */ stfs f0, 0x14(r1)
/* 0000E6FC 4BFF1A8D */ bl draw_naomi_sprite
/* 0000E700 38000434 */ li r0, 0x434
/* 0000E704 9001000C */ stw r0, 0xc(r1)
/* 0000E708 3861000C */ addi r3, r1, 0xc
/* 0000E70C C03E0004 */ lfs f1, 4(r30)
/* 0000E710 C01F039C */ lfs f0, 0x39c(r31)
/* 0000E714 EC010028 */ fsubs f0, f1, f0
/* 0000E718 D0010010 */ stfs f0, 0x10(r1)
/* 0000E71C C03E0008 */ lfs f1, 8(r30)
/* 0000E720 C01F0398 */ lfs f0, 0x398(r31)
/* 0000E724 EC010028 */ fsubs f0, f1, f0
/* 0000E728 D0010014 */ stfs f0, 0x14(r1)
/* 0000E72C 4BFF1A5D */ bl draw_naomi_sprite
/* 0000E730 38000438 */ li r0, 0x438
/* 0000E734 9001000C */ stw r0, 0xc(r1)
/* 0000E738 3861000C */ addi r3, r1, 0xc
/* 0000E73C C03E0004 */ lfs f1, 4(r30)
/* 0000E740 C01F03A0 */ lfs f0, 0x3a0(r31)
/* 0000E744 EC010028 */ fsubs f0, f1, f0
/* 0000E748 D0010010 */ stfs f0, 0x10(r1)
/* 0000E74C C03E0008 */ lfs f1, 8(r30)
/* 0000E750 C01F0398 */ lfs f0, 0x398(r31)
/* 0000E754 EC010028 */ fsubs f0, f1, f0
/* 0000E758 D0010014 */ stfs f0, 0x14(r1)
/* 0000E75C 4BFF1A2D */ bl draw_naomi_sprite
/* 0000E760 80010074 */ lwz r0, 0x74(r1)
/* 0000E764 83E1006C */ lwz r31, 0x6c(r1)
/* 0000E768 83C10068 */ lwz r30, 0x68(r1)
/* 0000E76C 7C0803A6 */ mtlr r0
/* 0000E770 38210070 */ addi r1, r1, 0x70
/* 0000E774 4E800020 */ blr 
lbl_0000E778:
/* 0000E778 7C0802A6 */ mflr r0
/* 0000E77C 3C800000 */ lis r4, lbl_00012730@ha
/* 0000E780 90010004 */ stw r0, 4(r1)
/* 0000E784 9421FFA0 */ stwu r1, -0x60(r1)
/* 0000E788 DBE10058 */ stfd f31, 0x58(r1)
/* 0000E78C DBC10050 */ stfd f30, 0x50(r1)
/* 0000E790 BF410038 */ stmw r26, 0x38(r1)
/* 0000E794 3BA40000 */ addi r29, r4, lbl_00012730@l
/* 0000E798 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000E79C 3B630000 */ addi r27, r3, 0
/* 0000E7A0 3BC40000 */ addi r30, r4, lbl_00011CB0@l
/* 0000E7A4 3B400001 */ li r26, 1
/* 0000E7A8 4BFF19E1 */ bl reset_text_draw_settings
/* 0000E7AC 887B0001 */ lbz r3, 1(r27)
/* 0000E7B0 4BFF19D9 */ bl set_text_font
/* 0000E7B4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000E7B8 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 0000E7BC 2C000024 */ cmpwi r0, 0x24
/* 0000E7C0 40820010 */ bne lbl_0000E7D0
/* 0000E7C4 3C600100 */ lis r3, 0x100
/* 0000E7C8 3863FF00 */ addi r3, r3, -256  ;# fixed addi
/* 0000E7CC 4800000C */ b lbl_0000E7D8
lbl_0000E7D0:
/* 0000E7D0 3C600081 */ lis r3, 0x81
/* 0000E7D4 38638000 */ addi r3, r3, -32768  ;# fixed addi
lbl_0000E7D8:
/* 0000E7D8 4BFF19B1 */ bl set_text_mul_color
/* 0000E7DC C01E03A4 */ lfs f0, 0x3a4(r30)
/* 0000E7E0 D01B0040 */ stfs f0, 0x40(r27)
/* 0000E7E4 C01E0048 */ lfs f0, 0x48(r30)
/* 0000E7E8 D01B0044 */ stfs f0, 0x44(r27)
/* 0000E7EC C03B0040 */ lfs f1, 0x40(r27)
/* 0000E7F0 C05B0044 */ lfs f2, 0x44(r27)
/* 0000E7F4 4BFF1995 */ bl set_text_scale
/* 0000E7F8 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000E7FC 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000E800 3B830005 */ addi r28, r3, 5
/* 0000E804 575F103A */ slwi r31, r26, 2
/* 0000E808 88030005 */ lbz r0, 5(r3)
/* 0000E80C 7C7DFA14 */ add r3, r29, r31
/* 0000E810 7C000774 */ extsb r0, r0
/* 0000E814 806341F4 */ lwz r3, 0x41f4(r3)
/* 0000E818 5400103A */ slwi r0, r0, 2
/* 0000E81C 7C83002E */ lwzx r4, r3, r0
/* 0000E820 387B008C */ addi r3, r27, 0x8c
/* 0000E824 4BFF1965 */ bl strcpy
/* 0000E828 387B008C */ addi r3, r27, 0x8c
/* 0000E82C 4BFF195D */ bl strlen
/* 0000E830 28030030 */ cmplwi r3, 0x30
/* 0000E834 40810020 */ ble lbl_0000E854
/* 0000E838 387D0000 */ addi r3, r29, 0
/* 0000E83C 4CC63182 */ crclr 6
/* 0000E840 389B008C */ addi r4, r27, 0x8c
/* 0000E844 4BFF1945 */ bl printf
/* 0000E848 387B008C */ addi r3, r27, 0x8c
/* 0000E84C 389D0020 */ addi r4, r29, 0x20
/* 0000E850 4BFF1939 */ bl strcpy
lbl_0000E854:
/* 0000E854 835B0038 */ lwz r26, 0x38(r27)
/* 0000E858 38000000 */ li r0, 0
/* 0000E85C 387B0000 */ addi r3, r27, 0
/* 0000E860 901B0038 */ stw r0, 0x38(r27)
/* 0000E864 389B0058 */ addi r4, r27, 0x58
/* 0000E868 38BB005C */ addi r5, r27, 0x5c
/* 0000E86C 38DB0060 */ addi r6, r27, 0x60
/* 0000E870 38FB0064 */ addi r7, r27, 0x64
/* 0000E874 4BFF1915 */ bl calc_sprite_bounds
/* 0000E878 935B0038 */ stw r26, 0x38(r27)
/* 0000E87C 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000E880 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000E884 809B005C */ lwz r4, 0x5c(r27)
/* 0000E888 3F404330 */ lis r26, 0x4330
/* 0000E88C 80DB0058 */ lwz r6, 0x58(r27)
/* 0000E890 3804FFF6 */ addi r0, r4, -10  ;# fixed addi
/* 0000E894 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000E898 6CC48000 */ xoris r4, r6, 0x8000
/* 0000E89C C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000E8A0 6C008000 */ xoris r0, r0, 0x8000
/* 0000E8A4 90810034 */ stw r4, 0x34(r1)
/* 0000E8A8 9001002C */ stw r0, 0x2c(r1)
/* 0000E8AC 93410030 */ stw r26, 0x30(r1)
/* 0000E8B0 93410028 */ stw r26, 0x28(r1)
/* 0000E8B4 C8210030 */ lfd f1, 0x30(r1)
/* 0000E8B8 C8010028 */ lfd f0, 0x28(r1)
/* 0000E8BC EC211828 */ fsubs f1, f1, f3
/* 0000E8C0 EC401028 */ fsubs f2, f0, f2
/* 0000E8C4 4BFF18C5 */ bl set_text_pos
/* 0000E8C8 387B008C */ addi r3, r27, 0x8c
/* 0000E8CC 4BFF18BD */ bl u_draw_text
/* 0000E8D0 3C600020 */ lis r3, 0x20
/* 0000E8D4 38632000 */ addi r3, r3, 0x2000
/* 0000E8D8 4BFF18B1 */ bl set_text_mul_color
/* 0000E8DC 80DB0058 */ lwz r6, 0x58(r27)
/* 0000E8E0 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000E8E4 809B005C */ lwz r4, 0x5c(r27)
/* 0000E8E8 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000E8EC 38C60003 */ addi r6, r6, 3
/* 0000E8F0 3804FFF9 */ addi r0, r4, -7  ;# fixed addi
/* 0000E8F4 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000E8F8 6CC48000 */ xoris r4, r6, 0x8000
/* 0000E8FC C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000E900 6C008000 */ xoris r0, r0, 0x8000
/* 0000E904 90810024 */ stw r4, 0x24(r1)
/* 0000E908 9001001C */ stw r0, 0x1c(r1)
/* 0000E90C 93410020 */ stw r26, 0x20(r1)
/* 0000E910 93410018 */ stw r26, 0x18(r1)
/* 0000E914 C8210020 */ lfd f1, 0x20(r1)
/* 0000E918 C8010018 */ lfd f0, 0x18(r1)
/* 0000E91C EC211828 */ fsubs f1, f1, f3
/* 0000E920 EC401028 */ fsubs f2, f0, f2
/* 0000E924 4BFF1865 */ bl set_text_pos
/* 0000E928 387B008C */ addi r3, r27, 0x8c
/* 0000E92C 4BFF185D */ bl u_draw_text
/* 0000E930 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000E934 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 0000E938 2C000024 */ cmpwi r0, 0x24
/* 0000E93C 40820010 */ bne lbl_0000E94C
/* 0000E940 3C600100 */ lis r3, 0x100
/* 0000E944 3863FFC0 */ addi r3, r3, -64  ;# fixed addi
/* 0000E948 4800000C */ b lbl_0000E954
lbl_0000E94C:
/* 0000E94C 3C600081 */ lis r3, 0x81
/* 0000E950 38638060 */ addi r3, r3, -32672  ;# fixed addi
lbl_0000E954:
/* 0000E954 4BFF1835 */ bl set_text_mul_color
/* 0000E958 C03B0040 */ lfs f1, 0x40(r27)
/* 0000E95C C81E03A8 */ lfd f0, 0x3a8(r30)
/* 0000E960 FC010032 */ fmul f0, f1, f0
/* 0000E964 FC000018 */ frsp f0, f0
/* 0000E968 D01B0040 */ stfs f0, 0x40(r27)
/* 0000E96C C03B0044 */ lfs f1, 0x44(r27)
/* 0000E970 C81E03A8 */ lfd f0, 0x3a8(r30)
/* 0000E974 FC010032 */ fmul f0, f1, f0
/* 0000E978 FC000018 */ frsp f0, f0
/* 0000E97C D01B0044 */ stfs f0, 0x44(r27)
/* 0000E980 C03B0040 */ lfs f1, 0x40(r27)
/* 0000E984 C05B0044 */ lfs f2, 0x44(r27)
/* 0000E988 4BFF1801 */ bl set_text_scale
/* 0000E98C 881C0000 */ lbz r0, 0(r28)
/* 0000E990 7C7DFA14 */ add r3, r29, r31
/* 0000E994 80834324 */ lwz r4, 0x4324(r3)
/* 0000E998 387B008C */ addi r3, r27, 0x8c
/* 0000E99C 7C000774 */ extsb r0, r0
/* 0000E9A0 5400103A */ slwi r0, r0, 2
/* 0000E9A4 7C84002E */ lwzx r4, r4, r0
/* 0000E9A8 4BFF17E1 */ bl strcpy
/* 0000E9AC 387B008C */ addi r3, r27, 0x8c
/* 0000E9B0 4BFF17D9 */ bl strlen
/* 0000E9B4 28030030 */ cmplwi r3, 0x30
/* 0000E9B8 40810020 */ ble lbl_0000E9D8
/* 0000E9BC 387D0000 */ addi r3, r29, 0
/* 0000E9C0 4CC63182 */ crclr 6
/* 0000E9C4 389B008C */ addi r4, r27, 0x8c
/* 0000E9C8 4BFF17C1 */ bl printf
/* 0000E9CC 387B008C */ addi r3, r27, 0x8c
/* 0000E9D0 389D0020 */ addi r4, r29, 0x20
/* 0000E9D4 4BFF17B5 */ bl strcpy
lbl_0000E9D8:
/* 0000E9D8 835B0038 */ lwz r26, 0x38(r27)
/* 0000E9DC 38000000 */ li r0, 0
/* 0000E9E0 387B0000 */ addi r3, r27, 0
/* 0000E9E4 901B0038 */ stw r0, 0x38(r27)
/* 0000E9E8 389B0058 */ addi r4, r27, 0x58
/* 0000E9EC 38BB005C */ addi r5, r27, 0x5c
/* 0000E9F0 38DB0060 */ addi r6, r27, 0x60
/* 0000E9F4 38FB0064 */ addi r7, r27, 0x64
/* 0000E9F8 4BFF1791 */ bl calc_sprite_bounds
/* 0000E9FC 935B0038 */ stw r26, 0x38(r27)
/* 0000EA00 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000EA04 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000EA08 809B005C */ lwz r4, 0x5c(r27)
/* 0000EA0C 3FE04330 */ lis r31, 0x4330
/* 0000EA10 80DB0058 */ lwz r6, 0x58(r27)
/* 0000EA14 3804000F */ addi r0, r4, 0xf
/* 0000EA18 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000EA1C 6CC48000 */ xoris r4, r6, 0x8000
/* 0000EA20 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000EA24 6C008000 */ xoris r0, r0, 0x8000
/* 0000EA28 9081001C */ stw r4, 0x1c(r1)
/* 0000EA2C 90010024 */ stw r0, 0x24(r1)
/* 0000EA30 93E10018 */ stw r31, 0x18(r1)
/* 0000EA34 93E10020 */ stw r31, 0x20(r1)
/* 0000EA38 C8210018 */ lfd f1, 0x18(r1)
/* 0000EA3C C8010020 */ lfd f0, 0x20(r1)
/* 0000EA40 EC211828 */ fsubs f1, f1, f3
/* 0000EA44 EC401028 */ fsubs f2, f0, f2
/* 0000EA48 4BFF1741 */ bl set_text_pos
/* 0000EA4C 387B008C */ addi r3, r27, 0x8c
/* 0000EA50 4BFF1739 */ bl u_draw_text
/* 0000EA54 3C600020 */ lis r3, 0x20
/* 0000EA58 38632000 */ addi r3, r3, 0x2000
/* 0000EA5C 4BFF172D */ bl set_text_mul_color
/* 0000EA60 80DB0058 */ lwz r6, 0x58(r27)
/* 0000EA64 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000EA68 809B005C */ lwz r4, 0x5c(r27)
/* 0000EA6C 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000EA70 38C60003 */ addi r6, r6, 3
/* 0000EA74 38040012 */ addi r0, r4, 0x12
/* 0000EA78 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000EA7C 6CC48000 */ xoris r4, r6, 0x8000
/* 0000EA80 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000EA84 6C008000 */ xoris r0, r0, 0x8000
/* 0000EA88 9081002C */ stw r4, 0x2c(r1)
/* 0000EA8C 90010034 */ stw r0, 0x34(r1)
/* 0000EA90 93E10028 */ stw r31, 0x28(r1)
/* 0000EA94 93E10030 */ stw r31, 0x30(r1)
/* 0000EA98 C8210028 */ lfd f1, 0x28(r1)
/* 0000EA9C C8010030 */ lfd f0, 0x30(r1)
/* 0000EAA0 EC211828 */ fsubs f1, f1, f3
/* 0000EAA4 EC401028 */ fsubs f2, f0, f2
/* 0000EAA8 4BFF16E1 */ bl set_text_pos
/* 0000EAAC 387B008C */ addi r3, r27, 0x8c
/* 0000EAB0 4BFF16D9 */ bl u_draw_text
/* 0000EAB4 C01E0048 */ lfs f0, 0x48(r30)
/* 0000EAB8 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000EABC D01B0040 */ stfs f0, 0x40(r27)
/* 0000EAC0 C01E0048 */ lfs f0, 0x48(r30)
/* 0000EAC4 D01B0044 */ stfs f0, 0x44(r27)
/* 0000EAC8 881C0000 */ lbz r0, 0(r28)
/* 0000EACC C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000EAD0 7C000774 */ extsb r0, r0
/* 0000EAD4 C3FB0004 */ lfs f31, 4(r27)
/* 0000EAD8 1C6000B2 */ mulli r3, r0, 0xb2
/* 0000EADC C3DB0008 */ lfs f30, 8(r27)
/* 0000EAE0 3803FFD0 */ addi r0, r3, -48  ;# fixed addi
/* 0000EAE4 6C008000 */ xoris r0, r0, 0x8000
/* 0000EAE8 90010014 */ stw r0, 0x14(r1)
/* 0000EAEC 93E10010 */ stw r31, 0x10(r1)
/* 0000EAF0 C8010010 */ lfd f0, 0x10(r1)
/* 0000EAF4 EC000828 */ fsubs f0, f0, f1
/* 0000EAF8 EC1F002A */ fadds f0, f31, f0
/* 0000EAFC D01B0004 */ stfs f0, 4(r27)
/* 0000EB00 C03B0008 */ lfs f1, 8(r27)
/* 0000EB04 C01E03B0 */ lfs f0, 0x3b0(r30)
/* 0000EB08 EC01002A */ fadds f0, f1, f0
/* 0000EB0C D01B0008 */ stfs f0, 8(r27)
/* 0000EB10 801B0048 */ lwz r0, 0x48(r27)
/* 0000EB14 2C000000 */ cmpwi r0, 0
/* 0000EB18 41820098 */ beq lbl_0000EBB0
/* 0000EB1C 4BFF166D */ bl reset_text_draw_settings
/* 0000EB20 3C600022 */ lis r3, 0x22
/* 0000EB24 4BFF1665 */ bl func_80071B50
/* 0000EB28 887B0001 */ lbz r3, 1(r27)
/* 0000EB2C 4BFF165D */ bl set_text_font
/* 0000EB30 C03E0040 */ lfs f1, 0x40(r30)
/* 0000EB34 FC400890 */ fmr f2, f1
/* 0000EB38 4BFF1651 */ bl set_text_scale
/* 0000EB3C C83E0190 */ lfd f1, 0x190(r30)
/* 0000EB40 C01B004C */ lfs f0, 0x4c(r27)
/* 0000EB44 FC21002A */ fadd f1, f1, f0
/* 0000EB48 FC200818 */ frsp f1, f1
/* 0000EB4C 4BFF163D */ bl func_80071B1C
/* 0000EB50 C03B0004 */ lfs f1, 4(r27)
/* 0000EB54 C01E0390 */ lfs f0, 0x390(r30)
/* 0000EB58 C07E0070 */ lfs f3, 0x70(r30)
/* 0000EB5C EC210028 */ fsubs f1, f1, f0
/* 0000EB60 C01B0008 */ lfs f0, 8(r27)
/* 0000EB64 EC43002A */ fadds f2, f3, f0
/* 0000EB68 EC23082A */ fadds f1, f3, f1
/* 0000EB6C 4BFF161D */ bl set_text_pos
/* 0000EB70 38600000 */ li r3, 0
/* 0000EB74 4BFF1615 */ bl set_text_mul_color
/* 0000EB78 387D3D10 */ addi r3, r29, 0x3d10
/* 0000EB7C 4BFF160D */ bl u_draw_text
/* 0000EB80 C03B004C */ lfs f1, 0x4c(r27)
/* 0000EB84 4BFF1605 */ bl func_80071B1C
/* 0000EB88 C03B0004 */ lfs f1, 4(r27)
/* 0000EB8C C01E0390 */ lfs f0, 0x390(r30)
/* 0000EB90 C05B0008 */ lfs f2, 8(r27)
/* 0000EB94 EC210028 */ fsubs f1, f1, f0
/* 0000EB98 4BFF15F1 */ bl set_text_pos
/* 0000EB9C 3C600100 */ lis r3, 0x100
/* 0000EBA0 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 0000EBA4 4BFF15E5 */ bl set_text_mul_color
/* 0000EBA8 387D3CF0 */ addi r3, r29, 0x3cf0
/* 0000EBAC 4BFF15DD */ bl u_draw_text
lbl_0000EBB0:
/* 0000EBB0 D3FB0004 */ stfs f31, 4(r27)
/* 0000EBB4 D3DB0008 */ stfs f30, 8(r27)
/* 0000EBB8 BB410038 */ lmw r26, 0x38(r1)
/* 0000EBBC 80010064 */ lwz r0, 0x64(r1)
/* 0000EBC0 CBE10058 */ lfd f31, 0x58(r1)
/* 0000EBC4 CBC10050 */ lfd f30, 0x50(r1)
/* 0000EBC8 7C0803A6 */ mtlr r0
/* 0000EBCC 38210060 */ addi r1, r1, 0x60
/* 0000EBD0 4E800020 */ blr 
glabel lbl_0000EBD4
/* 0000EBD4 7C0802A6 */ mflr r0
/* 0000EBD8 3CA00000 */ lis r5, lbl_00012730@ha
/* 0000EBDC 90010004 */ stw r0, 4(r1)
/* 0000EBE0 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000EBE4 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000EBE8 93E1001C */ stw r31, 0x1c(r1)
/* 0000EBEC 3BE40000 */ addi r31, r4, lbl_00011CB0@l
/* 0000EBF0 93C10018 */ stw r30, 0x18(r1)
/* 0000EBF4 3BC50000 */ addi r30, r5, lbl_00012730@l
/* 0000EBF8 93A10014 */ stw r29, 0x14(r1)
/* 0000EBFC 3BA30000 */ addi r29, r3, 0
/* 0000EC00 4BFF1589 */ bl create_sprite
/* 0000EC04 7C691B79 */ or. r9, r3, r3
/* 0000EC08 4182008C */ beq lbl_0000EC94
/* 0000EC0C 381D0032 */ addi r0, r29, 0x32
/* 0000EC10 4CC63182 */ crclr 6
/* 0000EC14 9809000F */ stb r0, 0xf(r9)
/* 0000EC18 38000001 */ li r0, 1
/* 0000EC1C 57A31838 */ slwi r3, r29, 3
/* 0000EC20 98090000 */ stb r0, 0(r9)
/* 0000EC24 7CBE1A14 */ add r5, r30, r3
/* 0000EC28 3C800000 */ lis r4, lbl_0000ECB0@ha
/* 0000EC2C C005432C */ lfs f0, 0x432c(r5)
/* 0000EC30 38C40000 */ addi r6, r4, lbl_0000ECB0@l
/* 0000EC34 3C600000 */ lis r3, lbl_0000F788@ha
/* 0000EC38 D0090004 */ stfs f0, 4(r9)
/* 0000EC3C 38030000 */ addi r0, r3, lbl_0000F788@l
/* 0000EC40 39000000 */ li r8, 0
/* 0000EC44 C0054330 */ lfs f0, 0x4330(r5)
/* 0000EC48 38E00006 */ li r7, 6
/* 0000EC4C 38BD0000 */ addi r5, r29, 0
/* 0000EC50 D0090008 */ stfs f0, 8(r9)
/* 0000EC54 3869008C */ addi r3, r9, 0x8c
/* 0000EC58 389E43FC */ addi r4, r30, 0x43fc
/* 0000EC5C C01F03B4 */ lfs f0, 0x3b4(r31)
/* 0000EC60 D009004C */ stfs f0, 0x4c(r9)
/* 0000EC64 99090003 */ stb r8, 3(r9)
/* 0000EC68 C01F0008 */ lfs f0, 8(r31)
/* 0000EC6C D0090040 */ stfs f0, 0x40(r9)
/* 0000EC70 C01F0008 */ lfs f0, 8(r31)
/* 0000EC74 D0090044 */ stfs f0, 0x44(r9)
/* 0000EC78 C01F0008 */ lfs f0, 8(r31)
/* 0000EC7C D009006C */ stfs f0, 0x6c(r9)
/* 0000EC80 90E90048 */ stw r7, 0x48(r9)
/* 0000EC84 90C90034 */ stw r6, 0x34(r9)
/* 0000EC88 90090038 */ stw r0, 0x38(r9)
/* 0000EC8C B3A9003C */ sth r29, 0x3c(r9)
/* 0000EC90 4BFF14F9 */ bl sprintf
lbl_0000EC94:
/* 0000EC94 80010024 */ lwz r0, 0x24(r1)
/* 0000EC98 83E1001C */ lwz r31, 0x1c(r1)
/* 0000EC9C 83C10018 */ lwz r30, 0x18(r1)
/* 0000ECA0 7C0803A6 */ mtlr r0
/* 0000ECA4 83A10014 */ lwz r29, 0x14(r1)
/* 0000ECA8 38210020 */ addi r1, r1, 0x20
/* 0000ECAC 4E800020 */ blr 
lbl_0000ECB0:
/* 0000ECB0 9421FF58 */ stwu r1, -0xa8(r1)
/* 0000ECB4 3CA00000 */ lis r5, lbl_00012730@ha
/* 0000ECB8 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000ECBC 93E100A4 */ stw r31, 0xa4(r1)
/* 0000ECC0 38050000 */ addi r0, r5, lbl_00012730@l
/* 0000ECC4 38630000 */ addi r3, r3, lbl_00011CB0@l
/* 0000ECC8 80E40048 */ lwz r7, 0x48(r4)
/* 0000ECCC 2807000B */ cmplwi r7, 0xb
/* 0000ECD0 41810A90 */ bgt lbl_0000F760
/* 0000ECD4 3CA00000 */ lis r5, lbl_00016B48@ha
/* 0000ECD8 38C50000 */ addi r6, r5, lbl_00016B48@l
/* 0000ECDC 54E5103A */ slwi r5, r7, 2
/* 0000ECE0 7CA6282E */ lwzx r5, r6, r5
/* 0000ECE4 7CA903A6 */ mtctr r5
/* 0000ECE8 4E800420 */ bctr 
lbl_0000ECEC:
/* 0000ECEC A0C4003C */ lhz r6, 0x3c(r4)
/* 0000ECF0 28060003 */ cmplwi r6, 3
/* 0000ECF4 41800080 */ blt lbl_0000ED74
/* 0000ECF8 28060006 */ cmplwi r6, 6
/* 0000ECFC 41810078 */ bgt lbl_0000ED74
/* 0000ED00 3CA00000 */ lis r5, lbl_801EEDA8@ha
/* 0000ED04 38A50000 */ addi r5, r5, lbl_801EEDA8@l
/* 0000ED08 80A50040 */ lwz r5, 0x40(r5)
/* 0000ED0C 2C050002 */ cmpwi r5, 2
/* 0000ED10 40820064 */ bne lbl_0000ED74
/* 0000ED14 54C51838 */ slwi r5, r6, 3
/* 0000ED18 C00303B8 */ lfs f0, 0x3b8(r3)
/* 0000ED1C 7CA02A14 */ add r5, r0, r5
/* 0000ED20 C0640004 */ lfs f3, 4(r4)
/* 0000ED24 C025432C */ lfs f1, 0x432c(r5)
/* 0000ED28 C8430000 */ lfd f2, 0(r3)
/* 0000ED2C EC010028 */ fsubs f0, f1, f0
/* 0000ED30 EC001828 */ fsubs f0, f0, f3
/* 0000ED34 FC020032 */ fmul f0, f2, f0
/* 0000ED38 FC03002A */ fadd f0, f3, f0
/* 0000ED3C FC000018 */ frsp f0, f0
/* 0000ED40 D0040004 */ stfs f0, 4(r4)
/* 0000ED44 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000ED48 C0440008 */ lfs f2, 8(r4)
/* 0000ED4C 54A51838 */ slwi r5, r5, 3
/* 0000ED50 C8230000 */ lfd f1, 0(r3)
/* 0000ED54 7CA02A14 */ add r5, r0, r5
/* 0000ED58 C0054330 */ lfs f0, 0x4330(r5)
/* 0000ED5C EC001028 */ fsubs f0, f0, f2
/* 0000ED60 FC010032 */ fmul f0, f1, f0
/* 0000ED64 FC02002A */ fadd f0, f2, f0
/* 0000ED68 FC000018 */ frsp f0, f0
/* 0000ED6C D0040008 */ stfs f0, 8(r4)
/* 0000ED70 480000DC */ b lbl_0000EE4C
lbl_0000ED74:
/* 0000ED74 28060003 */ cmplwi r6, 3
/* 0000ED78 41800080 */ blt lbl_0000EDF8
/* 0000ED7C 28060006 */ cmplwi r6, 6
/* 0000ED80 41810078 */ bgt lbl_0000EDF8
/* 0000ED84 3CA00000 */ lis r5, modeCtrl@ha
/* 0000ED88 38A50000 */ addi r5, r5, modeCtrl@l
/* 0000ED8C 80A50028 */ lwz r5, 0x28(r5)
/* 0000ED90 2C050006 */ cmpwi r5, 6
/* 0000ED94 40820064 */ bne lbl_0000EDF8
/* 0000ED98 54C51838 */ slwi r5, r6, 3
/* 0000ED9C C02303BC */ lfs f1, 0x3bc(r3)
/* 0000EDA0 7CA02A14 */ add r5, r0, r5
/* 0000EDA4 C0640004 */ lfs f3, 4(r4)
/* 0000EDA8 C005432C */ lfs f0, 0x432c(r5)
/* 0000EDAC C8430000 */ lfd f2, 0(r3)
/* 0000EDB0 EC01002A */ fadds f0, f1, f0
/* 0000EDB4 EC001828 */ fsubs f0, f0, f3
/* 0000EDB8 FC020032 */ fmul f0, f2, f0
/* 0000EDBC FC03002A */ fadd f0, f3, f0
/* 0000EDC0 FC000018 */ frsp f0, f0
/* 0000EDC4 D0040004 */ stfs f0, 4(r4)
/* 0000EDC8 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000EDCC C0440008 */ lfs f2, 8(r4)
/* 0000EDD0 54A51838 */ slwi r5, r5, 3
/* 0000EDD4 C8230000 */ lfd f1, 0(r3)
/* 0000EDD8 7CA02A14 */ add r5, r0, r5
/* 0000EDDC C0054330 */ lfs f0, 0x4330(r5)
/* 0000EDE0 EC001028 */ fsubs f0, f0, f2
/* 0000EDE4 FC010032 */ fmul f0, f1, f0
/* 0000EDE8 FC02002A */ fadd f0, f2, f0
/* 0000EDEC FC000018 */ frsp f0, f0
/* 0000EDF0 D0040008 */ stfs f0, 8(r4)
/* 0000EDF4 48000058 */ b lbl_0000EE4C
lbl_0000EDF8:
/* 0000EDF8 54C51838 */ slwi r5, r6, 3
/* 0000EDFC C0440004 */ lfs f2, 4(r4)
/* 0000EE00 7CA02A14 */ add r5, r0, r5
/* 0000EE04 C8230000 */ lfd f1, 0(r3)
/* 0000EE08 C005432C */ lfs f0, 0x432c(r5)
/* 0000EE0C EC001028 */ fsubs f0, f0, f2
/* 0000EE10 FC010032 */ fmul f0, f1, f0
/* 0000EE14 FC02002A */ fadd f0, f2, f0
/* 0000EE18 FC000018 */ frsp f0, f0
/* 0000EE1C D0040004 */ stfs f0, 4(r4)
/* 0000EE20 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000EE24 C0440008 */ lfs f2, 8(r4)
/* 0000EE28 54A51838 */ slwi r5, r5, 3
/* 0000EE2C C8230000 */ lfd f1, 0(r3)
/* 0000EE30 7CA02A14 */ add r5, r0, r5
/* 0000EE34 C0054330 */ lfs f0, 0x4330(r5)
/* 0000EE38 EC001028 */ fsubs f0, f0, f2
/* 0000EE3C FC010032 */ fmul f0, f1, f0
/* 0000EE40 FC02002A */ fadd f0, f2, f0
/* 0000EE44 FC000018 */ frsp f0, f0
/* 0000EE48 D0040008 */ stfs f0, 8(r4)
lbl_0000EE4C:
/* 0000EE4C 88C4000C */ lbz r6, 0xc(r4)
/* 0000EE50 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000EE54 C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000EE58 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0000EE5C 20060080 */ subfic r0, r6, 0x80
/* 0000EE60 6C008000 */ xoris r0, r0, 0x8000
/* 0000EE64 90C1009C */ stw r6, 0x9c(r1)
/* 0000EE68 3D404330 */ lis r10, 0x4330
/* 0000EE6C C8650000 */ lfd f3, lbl_00011EC8@l(r5)
/* 0000EE70 90010094 */ stw r0, 0x94(r1)
/* 0000EE74 3CE00000 */ lis r7, lbl_00011D00@ha
/* 0000EE78 C8430000 */ lfd f2, 0(r3)
/* 0000EE7C 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000EE80 91410090 */ stw r10, 0x90(r1)
/* 0000EE84 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000EE88 C8010090 */ lfd f0, 0x90(r1)
/* 0000EE8C 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000EE90 91410098 */ stw r10, 0x98(r1)
/* 0000EE94 38000000 */ li r0, 0
/* 0000EE98 FC000828 */ fsub f0, f0, f1
/* 0000EE9C C8210098 */ lfd f1, 0x98(r1)
/* 0000EEA0 FC020032 */ fmul f0, f2, f0
/* 0000EEA4 FC211828 */ fsub f1, f1, f3
/* 0000EEA8 FC01002A */ fadd f0, f1, f0
/* 0000EEAC FC00001E */ fctiwz f0, f0
/* 0000EEB0 D8010088 */ stfd f0, 0x88(r1)
/* 0000EEB4 8121008C */ lwz r9, 0x8c(r1)
/* 0000EEB8 9924000C */ stb r9, 0xc(r4)
/* 0000EEBC 8924000D */ lbz r9, 0xd(r4)
/* 0000EEC0 C8270000 */ lfd f1, lbl_00011D00@l(r7)
/* 0000EEC4 20E90080 */ subfic r7, r9, 0x80
/* 0000EEC8 91210084 */ stw r9, 0x84(r1)
/* 0000EECC 6CE78000 */ xoris r7, r7, 0x8000
/* 0000EED0 C8430000 */ lfd f2, 0(r3)
/* 0000EED4 90E1007C */ stw r7, 0x7c(r1)
/* 0000EED8 C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000EEDC 91410078 */ stw r10, 0x78(r1)
/* 0000EEE0 C8010078 */ lfd f0, 0x78(r1)
/* 0000EEE4 91410080 */ stw r10, 0x80(r1)
/* 0000EEE8 FC000828 */ fsub f0, f0, f1
/* 0000EEEC C8210080 */ lfd f1, 0x80(r1)
/* 0000EEF0 FC020032 */ fmul f0, f2, f0
/* 0000EEF4 FC211828 */ fsub f1, f1, f3
/* 0000EEF8 FC01002A */ fadd f0, f1, f0
/* 0000EEFC FC00001E */ fctiwz f0, f0
/* 0000EF00 D8010070 */ stfd f0, 0x70(r1)
/* 0000EF04 80E10074 */ lwz r7, 0x74(r1)
/* 0000EF08 98E4000D */ stb r7, 0xd(r4)
/* 0000EF0C 88E4000E */ lbz r7, 0xe(r4)
/* 0000EF10 C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000EF14 20A70080 */ subfic r5, r7, 0x80
/* 0000EF18 90E1006C */ stw r7, 0x6c(r1)
/* 0000EF1C 6CA58000 */ xoris r5, r5, 0x8000
/* 0000EF20 C8430000 */ lfd f2, 0(r3)
/* 0000EF24 90A10064 */ stw r5, 0x64(r1)
/* 0000EF28 C8660000 */ lfd f3, lbl_00011EC8@l(r6)
/* 0000EF2C 91410060 */ stw r10, 0x60(r1)
/* 0000EF30 C8010060 */ lfd f0, 0x60(r1)
/* 0000EF34 91410068 */ stw r10, 0x68(r1)
/* 0000EF38 FC000828 */ fsub f0, f0, f1
/* 0000EF3C C8210068 */ lfd f1, 0x68(r1)
/* 0000EF40 FC020032 */ fmul f0, f2, f0
/* 0000EF44 FC211828 */ fsub f1, f1, f3
/* 0000EF48 FC01002A */ fadd f0, f1, f0
/* 0000EF4C FC00001E */ fctiwz f0, f0
/* 0000EF50 D8010058 */ stfd f0, 0x58(r1)
/* 0000EF54 80A1005C */ lwz r5, 0x5c(r1)
/* 0000EF58 98A4000E */ stb r5, 0xe(r4)
/* 0000EF5C 98040070 */ stb r0, 0x70(r4)
/* 0000EF60 98040071 */ stb r0, 0x71(r4)
/* 0000EF64 98040072 */ stb r0, 0x72(r4)
/* 0000EF68 C0440040 */ lfs f2, 0x40(r4)
/* 0000EF6C C80303C0 */ lfd f0, 0x3c0(r3)
/* 0000EF70 C82301B0 */ lfd f1, 0x1b0(r3)
/* 0000EF74 FC001028 */ fsub f0, f0, f2
/* 0000EF78 FC010032 */ fmul f0, f1, f0
/* 0000EF7C FC02002A */ fadd f0, f2, f0
/* 0000EF80 FC000018 */ frsp f0, f0
/* 0000EF84 D0040040 */ stfs f0, 0x40(r4)
/* 0000EF88 C0040040 */ lfs f0, 0x40(r4)
/* 0000EF8C D0040044 */ stfs f0, 0x44(r4)
/* 0000EF90 C044006C */ lfs f2, 0x6c(r4)
/* 0000EF94 C8030030 */ lfd f0, 0x30(r3)
/* 0000EF98 C8230000 */ lfd f1, 0(r3)
/* 0000EF9C FC001028 */ fsub f0, f0, f2
/* 0000EFA0 FC010032 */ fmul f0, f1, f0
/* 0000EFA4 FC02002A */ fadd f0, f2, f0
/* 0000EFA8 FC000018 */ frsp f0, f0
/* 0000EFAC D004006C */ stfs f0, 0x6c(r4)
/* 0000EFB0 480007B0 */ b lbl_0000F760
lbl_0000EFB4:
/* 0000EFB4 A0C4003C */ lhz r6, 0x3c(r4)
/* 0000EFB8 28060003 */ cmplwi r6, 3
/* 0000EFBC 41800088 */ blt lbl_0000F044
/* 0000EFC0 28060006 */ cmplwi r6, 6
/* 0000EFC4 41810080 */ bgt lbl_0000F044
/* 0000EFC8 3CA00000 */ lis r5, lbl_801EEDA8@ha
/* 0000EFCC 38A50000 */ addi r5, r5, lbl_801EEDA8@l
/* 0000EFD0 80A50040 */ lwz r5, 0x40(r5)
/* 0000EFD4 2C050002 */ cmpwi r5, 2
/* 0000EFD8 4082006C */ bne lbl_0000F044
/* 0000EFDC 54C51838 */ slwi r5, r6, 3
/* 0000EFE0 C00303B8 */ lfs f0, 0x3b8(r3)
/* 0000EFE4 7CA02A14 */ add r5, r0, r5
/* 0000EFE8 C0640004 */ lfs f3, 4(r4)
/* 0000EFEC C025432C */ lfs f1, 0x432c(r5)
/* 0000EFF0 C8430000 */ lfd f2, 0(r3)
/* 0000EFF4 EC010028 */ fsubs f0, f1, f0
/* 0000EFF8 EC001828 */ fsubs f0, f0, f3
/* 0000EFFC FC020032 */ fmul f0, f2, f0
/* 0000F000 FC03002A */ fadd f0, f3, f0
/* 0000F004 FC000018 */ frsp f0, f0
/* 0000F008 D0040004 */ stfs f0, 4(r4)
/* 0000F00C A0A4003C */ lhz r5, 0x3c(r4)
/* 0000F010 C0030094 */ lfs f0, 0x94(r3)
/* 0000F014 54A51838 */ slwi r5, r5, 3
/* 0000F018 C0640008 */ lfs f3, 8(r4)
/* 0000F01C 7CA02A14 */ add r5, r0, r5
/* 0000F020 C8430000 */ lfd f2, 0(r3)
/* 0000F024 C0254330 */ lfs f1, 0x4330(r5)
/* 0000F028 EC010028 */ fsubs f0, f1, f0
/* 0000F02C EC001828 */ fsubs f0, f0, f3
/* 0000F030 FC020032 */ fmul f0, f2, f0
/* 0000F034 FC03002A */ fadd f0, f3, f0
/* 0000F038 FC000018 */ frsp f0, f0
/* 0000F03C D0040008 */ stfs f0, 8(r4)
/* 0000F040 480000E4 */ b lbl_0000F124
lbl_0000F044:
/* 0000F044 28060003 */ cmplwi r6, 3
/* 0000F048 41800080 */ blt lbl_0000F0C8
/* 0000F04C 28060006 */ cmplwi r6, 6
/* 0000F050 41810078 */ bgt lbl_0000F0C8
/* 0000F054 3CA00000 */ lis r5, modeCtrl@ha
/* 0000F058 38A50000 */ addi r5, r5, modeCtrl@l
/* 0000F05C 80A50028 */ lwz r5, 0x28(r5)
/* 0000F060 2C050006 */ cmpwi r5, 6
/* 0000F064 40820064 */ bne lbl_0000F0C8
/* 0000F068 54C51838 */ slwi r5, r6, 3
/* 0000F06C C02303BC */ lfs f1, 0x3bc(r3)
/* 0000F070 7CA02A14 */ add r5, r0, r5
/* 0000F074 C0640004 */ lfs f3, 4(r4)
/* 0000F078 C005432C */ lfs f0, 0x432c(r5)
/* 0000F07C C8430000 */ lfd f2, 0(r3)
/* 0000F080 EC01002A */ fadds f0, f1, f0
/* 0000F084 EC001828 */ fsubs f0, f0, f3
/* 0000F088 FC020032 */ fmul f0, f2, f0
/* 0000F08C FC03002A */ fadd f0, f3, f0
/* 0000F090 FC000018 */ frsp f0, f0
/* 0000F094 D0040004 */ stfs f0, 4(r4)
/* 0000F098 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000F09C C0440008 */ lfs f2, 8(r4)
/* 0000F0A0 54A51838 */ slwi r5, r5, 3
/* 0000F0A4 C8230000 */ lfd f1, 0(r3)
/* 0000F0A8 7CA02A14 */ add r5, r0, r5
/* 0000F0AC C0054330 */ lfs f0, 0x4330(r5)
/* 0000F0B0 EC001028 */ fsubs f0, f0, f2
/* 0000F0B4 FC010032 */ fmul f0, f1, f0
/* 0000F0B8 FC02002A */ fadd f0, f2, f0
/* 0000F0BC FC000018 */ frsp f0, f0
/* 0000F0C0 D0040008 */ stfs f0, 8(r4)
/* 0000F0C4 48000060 */ b lbl_0000F124
lbl_0000F0C8:
/* 0000F0C8 54C51838 */ slwi r5, r6, 3
/* 0000F0CC C0440004 */ lfs f2, 4(r4)
/* 0000F0D0 7CA02A14 */ add r5, r0, r5
/* 0000F0D4 C8230000 */ lfd f1, 0(r3)
/* 0000F0D8 C005432C */ lfs f0, 0x432c(r5)
/* 0000F0DC EC001028 */ fsubs f0, f0, f2
/* 0000F0E0 FC010032 */ fmul f0, f1, f0
/* 0000F0E4 FC02002A */ fadd f0, f2, f0
/* 0000F0E8 FC000018 */ frsp f0, f0
/* 0000F0EC D0040004 */ stfs f0, 4(r4)
/* 0000F0F0 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000F0F4 C0030094 */ lfs f0, 0x94(r3)
/* 0000F0F8 54A51838 */ slwi r5, r5, 3
/* 0000F0FC C0640008 */ lfs f3, 8(r4)
/* 0000F100 7CA02A14 */ add r5, r0, r5
/* 0000F104 C8430000 */ lfd f2, 0(r3)
/* 0000F108 C0254330 */ lfs f1, 0x4330(r5)
/* 0000F10C EC010028 */ fsubs f0, f1, f0
/* 0000F110 EC001828 */ fsubs f0, f0, f3
/* 0000F114 FC020032 */ fmul f0, f2, f0
/* 0000F118 FC03002A */ fadd f0, f3, f0
/* 0000F11C FC000018 */ frsp f0, f0
/* 0000F120 D0040008 */ stfs f0, 8(r4)
lbl_0000F124:
/* 0000F124 88C4000C */ lbz r6, 0xc(r4)
/* 0000F128 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F12C C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000F130 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0000F134 200600FF */ subfic r0, r6, 0xff
/* 0000F138 6C008000 */ xoris r0, r0, 0x8000
/* 0000F13C 90C1005C */ stw r6, 0x5c(r1)
/* 0000F140 3D404330 */ lis r10, 0x4330
/* 0000F144 C8650000 */ lfd f3, lbl_00011EC8@l(r5)
/* 0000F148 90010064 */ stw r0, 0x64(r1)
/* 0000F14C 3CE00000 */ lis r7, lbl_00011D00@ha
/* 0000F150 C8430000 */ lfd f2, 0(r3)
/* 0000F154 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000F158 91410060 */ stw r10, 0x60(r1)
/* 0000F15C 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F160 C8010060 */ lfd f0, 0x60(r1)
/* 0000F164 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000F168 91410058 */ stw r10, 0x58(r1)
/* 0000F16C 38000000 */ li r0, 0
/* 0000F170 FC000828 */ fsub f0, f0, f1
/* 0000F174 C8210058 */ lfd f1, 0x58(r1)
/* 0000F178 FC020032 */ fmul f0, f2, f0
/* 0000F17C FC211828 */ fsub f1, f1, f3
/* 0000F180 FC01002A */ fadd f0, f1, f0
/* 0000F184 FC00001E */ fctiwz f0, f0
/* 0000F188 D8010068 */ stfd f0, 0x68(r1)
/* 0000F18C 8121006C */ lwz r9, 0x6c(r1)
/* 0000F190 9924000C */ stb r9, 0xc(r4)
/* 0000F194 8924000D */ lbz r9, 0xd(r4)
/* 0000F198 C8270000 */ lfd f1, lbl_00011D00@l(r7)
/* 0000F19C 20E900FF */ subfic r7, r9, 0xff
/* 0000F1A0 91210074 */ stw r9, 0x74(r1)
/* 0000F1A4 6CE78000 */ xoris r7, r7, 0x8000
/* 0000F1A8 C8430000 */ lfd f2, 0(r3)
/* 0000F1AC 90E1007C */ stw r7, 0x7c(r1)
/* 0000F1B0 C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000F1B4 91410078 */ stw r10, 0x78(r1)
/* 0000F1B8 C8010078 */ lfd f0, 0x78(r1)
/* 0000F1BC 91410070 */ stw r10, 0x70(r1)
/* 0000F1C0 FC000828 */ fsub f0, f0, f1
/* 0000F1C4 C8210070 */ lfd f1, 0x70(r1)
/* 0000F1C8 FC020032 */ fmul f0, f2, f0
/* 0000F1CC FC211828 */ fsub f1, f1, f3
/* 0000F1D0 FC01002A */ fadd f0, f1, f0
/* 0000F1D4 FC00001E */ fctiwz f0, f0
/* 0000F1D8 D8010080 */ stfd f0, 0x80(r1)
/* 0000F1DC 80E10084 */ lwz r7, 0x84(r1)
/* 0000F1E0 98E4000D */ stb r7, 0xd(r4)
/* 0000F1E4 88E4000E */ lbz r7, 0xe(r4)
/* 0000F1E8 C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000F1EC 20A700FF */ subfic r5, r7, 0xff
/* 0000F1F0 90E1008C */ stw r7, 0x8c(r1)
/* 0000F1F4 6CA58000 */ xoris r5, r5, 0x8000
/* 0000F1F8 C8430000 */ lfd f2, 0(r3)
/* 0000F1FC 90A10094 */ stw r5, 0x94(r1)
/* 0000F200 C8660000 */ lfd f3, lbl_00011EC8@l(r6)
/* 0000F204 91410090 */ stw r10, 0x90(r1)
/* 0000F208 C8010090 */ lfd f0, 0x90(r1)
/* 0000F20C 91410088 */ stw r10, 0x88(r1)
/* 0000F210 FC000828 */ fsub f0, f0, f1
/* 0000F214 C8210088 */ lfd f1, 0x88(r1)
/* 0000F218 FC020032 */ fmul f0, f2, f0
/* 0000F21C FC211828 */ fsub f1, f1, f3
/* 0000F220 FC01002A */ fadd f0, f1, f0
/* 0000F224 FC00001E */ fctiwz f0, f0
/* 0000F228 D8010098 */ stfd f0, 0x98(r1)
/* 0000F22C 80A1009C */ lwz r5, 0x9c(r1)
/* 0000F230 98A4000E */ stb r5, 0xe(r4)
/* 0000F234 98040070 */ stb r0, 0x70(r4)
/* 0000F238 98040071 */ stb r0, 0x71(r4)
/* 0000F23C 98040072 */ stb r0, 0x72(r4)
/* 0000F240 C0440040 */ lfs f2, 0x40(r4)
/* 0000F244 C80303C8 */ lfd f0, 0x3c8(r3)
/* 0000F248 C82301B0 */ lfd f1, 0x1b0(r3)
/* 0000F24C FC001028 */ fsub f0, f0, f2
/* 0000F250 FC010032 */ fmul f0, f1, f0
/* 0000F254 FC02002A */ fadd f0, f2, f0
/* 0000F258 FC000018 */ frsp f0, f0
/* 0000F25C D0040040 */ stfs f0, 0x40(r4)
/* 0000F260 C0040040 */ lfs f0, 0x40(r4)
/* 0000F264 D0040044 */ stfs f0, 0x44(r4)
/* 0000F268 C044006C */ lfs f2, 0x6c(r4)
/* 0000F26C C8030030 */ lfd f0, 0x30(r3)
/* 0000F270 C8230000 */ lfd f1, 0(r3)
/* 0000F274 FC001028 */ fsub f0, f0, f2
/* 0000F278 FC010032 */ fmul f0, f1, f0
/* 0000F27C FC02002A */ fadd f0, f2, f0
/* 0000F280 FC000018 */ frsp f0, f0
/* 0000F284 D004006C */ stfs f0, 0x6c(r4)
/* 0000F288 480004D8 */ b lbl_0000F760
lbl_0000F28C:
/* 0000F28C 3800000F */ li r0, 0xf
/* 0000F290 B0040010 */ sth r0, 0x10(r4)
/* 0000F294 38000004 */ li r0, 4
/* 0000F298 90040048 */ stw r0, 0x48(r4)
/* 0000F29C 480004C4 */ b lbl_0000F760
lbl_0000F2A0:
/* 0000F2A0 C0440004 */ lfs f2, 4(r4)
/* 0000F2A4 3D604330 */ lis r11, 0x4330
/* 0000F2A8 C0030014 */ lfs f0, 0x14(r3)
/* 0000F2AC 3D400000 */ lis r10, lbl_00011D00@ha
/* 0000F2B0 C8230000 */ lfd f1, 0(r3)
/* 0000F2B4 EC001028 */ fsubs f0, f0, f2
/* 0000F2B8 3D800000 */ lis r12, lbl_00011EC8@ha
/* 0000F2BC 3D000000 */ lis r8, lbl_00011D00@ha
/* 0000F2C0 3D200000 */ lis r9, lbl_00011EC8@ha
/* 0000F2C4 FC010032 */ fmul f0, f1, f0
/* 0000F2C8 3CC00000 */ lis r6, lbl_00011D00@ha
/* 0000F2CC 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 0000F2D0 3CA00000 */ lis r5, unpausedFrameCounter@ha
/* 0000F2D4 FC02002A */ fadd f0, f2, f0
/* 0000F2D8 FC000018 */ frsp f0, f0
/* 0000F2DC D0040004 */ stfs f0, 4(r4)
/* 0000F2E0 C0440008 */ lfs f2, 8(r4)
/* 0000F2E4 C00303D0 */ lfs f0, 0x3d0(r3)
/* 0000F2E8 C8230000 */ lfd f1, 0(r3)
/* 0000F2EC EC001028 */ fsubs f0, f0, f2
/* 0000F2F0 FC010032 */ fmul f0, f1, f0
/* 0000F2F4 FC02002A */ fadd f0, f2, f0
/* 0000F2F8 FC000018 */ frsp f0, f0
/* 0000F2FC D0040008 */ stfs f0, 8(r4)
/* 0000F300 8BE4000C */ lbz r31, 0xc(r4)
/* 0000F304 C82A0000 */ lfd f1, lbl_00011D00@l(r10)
/* 0000F308 201F00FF */ subfic r0, r31, 0xff
/* 0000F30C 93E1005C */ stw r31, 0x5c(r1)
/* 0000F310 6C008000 */ xoris r0, r0, 0x8000
/* 0000F314 C8430000 */ lfd f2, 0(r3)
/* 0000F318 90010064 */ stw r0, 0x64(r1)
/* 0000F31C C86C0000 */ lfd f3, lbl_00011EC8@l(r12)
/* 0000F320 91610060 */ stw r11, 0x60(r1)
/* 0000F324 C8010060 */ lfd f0, 0x60(r1)
/* 0000F328 91610058 */ stw r11, 0x58(r1)
/* 0000F32C FC000828 */ fsub f0, f0, f1
/* 0000F330 C8210058 */ lfd f1, 0x58(r1)
/* 0000F334 FC020032 */ fmul f0, f2, f0
/* 0000F338 FC211828 */ fsub f1, f1, f3
/* 0000F33C FC01002A */ fadd f0, f1, f0
/* 0000F340 FC00001E */ fctiwz f0, f0
/* 0000F344 D8010068 */ stfd f0, 0x68(r1)
/* 0000F348 8001006C */ lwz r0, 0x6c(r1)
/* 0000F34C 9804000C */ stb r0, 0xc(r4)
/* 0000F350 8944000D */ lbz r10, 0xd(r4)
/* 0000F354 C8280000 */ lfd f1, lbl_00011D00@l(r8)
/* 0000F358 200A00FF */ subfic r0, r10, 0xff
/* 0000F35C 91410074 */ stw r10, 0x74(r1)
/* 0000F360 6C008000 */ xoris r0, r0, 0x8000
/* 0000F364 C8430000 */ lfd f2, 0(r3)
/* 0000F368 9001007C */ stw r0, 0x7c(r1)
/* 0000F36C C8690000 */ lfd f3, lbl_00011EC8@l(r9)
/* 0000F370 91610078 */ stw r11, 0x78(r1)
/* 0000F374 C8010078 */ lfd f0, 0x78(r1)
/* 0000F378 91610070 */ stw r11, 0x70(r1)
/* 0000F37C FC000828 */ fsub f0, f0, f1
/* 0000F380 C8210070 */ lfd f1, 0x70(r1)
/* 0000F384 FC020032 */ fmul f0, f2, f0
/* 0000F388 FC211828 */ fsub f1, f1, f3
/* 0000F38C FC01002A */ fadd f0, f1, f0
/* 0000F390 FC00001E */ fctiwz f0, f0
/* 0000F394 D8010080 */ stfd f0, 0x80(r1)
/* 0000F398 80010084 */ lwz r0, 0x84(r1)
/* 0000F39C 9804000D */ stb r0, 0xd(r4)
/* 0000F3A0 8904000E */ lbz r8, 0xe(r4)
/* 0000F3A4 C8260000 */ lfd f1, lbl_00011D00@l(r6)
/* 0000F3A8 200800FF */ subfic r0, r8, 0xff
/* 0000F3AC 9101008C */ stw r8, 0x8c(r1)
/* 0000F3B0 6C008000 */ xoris r0, r0, 0x8000
/* 0000F3B4 C8430000 */ lfd f2, 0(r3)
/* 0000F3B8 90010094 */ stw r0, 0x94(r1)
/* 0000F3BC C8670000 */ lfd f3, lbl_00011EC8@l(r7)
/* 0000F3C0 91610090 */ stw r11, 0x90(r1)
/* 0000F3C4 C8010090 */ lfd f0, 0x90(r1)
/* 0000F3C8 91610088 */ stw r11, 0x88(r1)
/* 0000F3CC FC000828 */ fsub f0, f0, f1
/* 0000F3D0 C8210088 */ lfd f1, 0x88(r1)
/* 0000F3D4 FC020032 */ fmul f0, f2, f0
/* 0000F3D8 FC211828 */ fsub f1, f1, f3
/* 0000F3DC FC01002A */ fadd f0, f1, f0
/* 0000F3E0 FC00001E */ fctiwz f0, f0
/* 0000F3E4 D8010098 */ stfd f0, 0x98(r1)
/* 0000F3E8 8001009C */ lwz r0, 0x9c(r1)
/* 0000F3EC 9804000E */ stb r0, 0xe(r4)
/* 0000F3F0 84050000 */ lwzu r0, unpausedFrameCounter@l(r5)
/* 0000F3F4 54002E30 */ rlwinm r0, r0, 5, 0x18, 0x18
/* 0000F3F8 98040070 */ stb r0, 0x70(r4)
/* 0000F3FC 80050000 */ lwz r0, 0(r5)
/* 0000F400 54002E30 */ rlwinm r0, r0, 5, 0x18, 0x18
/* 0000F404 98040071 */ stb r0, 0x71(r4)
/* 0000F408 80050000 */ lwz r0, 0(r5)
/* 0000F40C 54002E30 */ rlwinm r0, r0, 5, 0x18, 0x18
/* 0000F410 98040072 */ stb r0, 0x72(r4)
/* 0000F414 C0440040 */ lfs f2, 0x40(r4)
/* 0000F418 C80303D8 */ lfd f0, 0x3d8(r3)
/* 0000F41C C82301B0 */ lfd f1, 0x1b0(r3)
/* 0000F420 FC001028 */ fsub f0, f0, f2
/* 0000F424 FC010032 */ fmul f0, f1, f0
/* 0000F428 FC02002A */ fadd f0, f2, f0
/* 0000F42C FC000018 */ frsp f0, f0
/* 0000F430 D0040040 */ stfs f0, 0x40(r4)
/* 0000F434 C0040040 */ lfs f0, 0x40(r4)
/* 0000F438 D0040044 */ stfs f0, 0x44(r4)
/* 0000F43C C044006C */ lfs f2, 0x6c(r4)
/* 0000F440 C8030030 */ lfd f0, 0x30(r3)
/* 0000F444 C8230000 */ lfd f1, 0(r3)
/* 0000F448 FC001028 */ fsub f0, f0, f2
/* 0000F44C FC010032 */ fmul f0, f1, f0
/* 0000F450 FC02002A */ fadd f0, f2, f0
/* 0000F454 FC000018 */ frsp f0, f0
/* 0000F458 D004006C */ stfs f0, 0x6c(r4)
/* 0000F45C 48000304 */ b lbl_0000F760
lbl_0000F460:
/* 0000F460 A8C40010 */ lha r6, 0x10(r4)
/* 0000F464 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F468 3C004330 */ lis r0, 0x4330
/* 0000F46C 38C6FFFF */ addi r6, r6, -1  ;# fixed addi
/* 0000F470 B0C40010 */ sth r6, 0x10(r4)
/* 0000F474 A8C40010 */ lha r6, 0x10(r4)
/* 0000F478 C8450000 */ lfd f2, lbl_00011D00@l(r5)
/* 0000F47C 6CC58000 */ xoris r5, r6, 0x8000
/* 0000F480 C0030094 */ lfs f0, 0x94(r3)
/* 0000F484 90A1005C */ stw r5, 0x5c(r1)
/* 0000F488 90010058 */ stw r0, 0x58(r1)
/* 0000F48C C8210058 */ lfd f1, 0x58(r1)
/* 0000F490 EC211028 */ fsubs f1, f1, f2
/* 0000F494 EC010024 */ fdivs f0, f1, f0
/* 0000F498 D004006C */ stfs f0, 0x6c(r4)
/* 0000F49C A8040010 */ lha r0, 0x10(r4)
/* 0000F4A0 2C000000 */ cmpwi r0, 0
/* 0000F4A4 408202BC */ bne lbl_0000F760
/* 0000F4A8 38000006 */ li r0, 6
/* 0000F4AC 90040048 */ stw r0, 0x48(r4)
/* 0000F4B0 480002B0 */ b lbl_0000F760
lbl_0000F4B4:
/* 0000F4B4 88A40003 */ lbz r5, 3(r4)
/* 0000F4B8 3D200000 */ lis r9, lbl_00011D00@ha
/* 0000F4BC C0440004 */ lfs f2, 4(r4)
/* 0000F4C0 3D400000 */ lis r10, lbl_00011EC8@ha
/* 0000F4C4 7CA50774 */ extsb r5, r5
/* 0000F4C8 54A5103A */ slwi r5, r5, 2
/* 0000F4CC C82302E8 */ lfd f1, 0x2e8(r3)
/* 0000F4D0 7CA02A14 */ add r5, r0, r5
/* 0000F4D4 C0054408 */ lfs f0, 0x4408(r5)
/* 0000F4D8 3C004330 */ lis r0, 0x4330
/* 0000F4DC 3CE00000 */ lis r7, lbl_00011D00@ha
/* 0000F4E0 EC001028 */ fsubs f0, f0, f2
/* 0000F4E4 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000F4E8 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F4EC 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000F4F0 FC010032 */ fmul f0, f1, f0
/* 0000F4F4 FC02002A */ fadd f0, f2, f0
/* 0000F4F8 FC000018 */ frsp f0, f0
/* 0000F4FC D0040004 */ stfs f0, 4(r4)
/* 0000F500 C0440008 */ lfs f2, 8(r4)
/* 0000F504 C00303E0 */ lfs f0, 0x3e0(r3)
/* 0000F508 C82302E8 */ lfd f1, 0x2e8(r3)
/* 0000F50C EC001028 */ fsubs f0, f0, f2
/* 0000F510 FC010032 */ fmul f0, f1, f0
/* 0000F514 FC02002A */ fadd f0, f2, f0
/* 0000F518 FC000018 */ frsp f0, f0
/* 0000F51C D0040008 */ stfs f0, 8(r4)
/* 0000F520 8964000C */ lbz r11, 0xc(r4)
/* 0000F524 C8290000 */ lfd f1, lbl_00011D00@l(r9)
/* 0000F528 212B0080 */ subfic r9, r11, 0x80
/* 0000F52C 9161005C */ stw r11, 0x5c(r1)
/* 0000F530 6D298000 */ xoris r9, r9, 0x8000
/* 0000F534 C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F538 91210064 */ stw r9, 0x64(r1)
/* 0000F53C C86A0000 */ lfd f3, lbl_00011EC8@l(r10)
/* 0000F540 90010060 */ stw r0, 0x60(r1)
/* 0000F544 C8010060 */ lfd f0, 0x60(r1)
/* 0000F548 90010058 */ stw r0, 0x58(r1)
/* 0000F54C FC000828 */ fsub f0, f0, f1
/* 0000F550 C8210058 */ lfd f1, 0x58(r1)
/* 0000F554 FC020032 */ fmul f0, f2, f0
/* 0000F558 FC211828 */ fsub f1, f1, f3
/* 0000F55C FC01002A */ fadd f0, f1, f0
/* 0000F560 FC00001E */ fctiwz f0, f0
/* 0000F564 D8010068 */ stfd f0, 0x68(r1)
/* 0000F568 8121006C */ lwz r9, 0x6c(r1)
/* 0000F56C 9924000C */ stb r9, 0xc(r4)
/* 0000F570 8924000D */ lbz r9, 0xd(r4)
/* 0000F574 C8270000 */ lfd f1, lbl_00011D00@l(r7)
/* 0000F578 20E90080 */ subfic r7, r9, 0x80
/* 0000F57C 91210074 */ stw r9, 0x74(r1)
/* 0000F580 6CE78000 */ xoris r7, r7, 0x8000
/* 0000F584 C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F588 90E1007C */ stw r7, 0x7c(r1)
/* 0000F58C C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000F590 90010078 */ stw r0, 0x78(r1)
/* 0000F594 C8010078 */ lfd f0, 0x78(r1)
/* 0000F598 90010070 */ stw r0, 0x70(r1)
/* 0000F59C FC000828 */ fsub f0, f0, f1
/* 0000F5A0 C8210070 */ lfd f1, 0x70(r1)
/* 0000F5A4 FC020032 */ fmul f0, f2, f0
/* 0000F5A8 FC211828 */ fsub f1, f1, f3
/* 0000F5AC FC01002A */ fadd f0, f1, f0
/* 0000F5B0 FC00001E */ fctiwz f0, f0
/* 0000F5B4 D8010080 */ stfd f0, 0x80(r1)
/* 0000F5B8 80E10084 */ lwz r7, 0x84(r1)
/* 0000F5BC 98E4000D */ stb r7, 0xd(r4)
/* 0000F5C0 88E4000E */ lbz r7, 0xe(r4)
/* 0000F5C4 C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000F5C8 20A70080 */ subfic r5, r7, 0x80
/* 0000F5CC 90E1008C */ stw r7, 0x8c(r1)
/* 0000F5D0 6CA58000 */ xoris r5, r5, 0x8000
/* 0000F5D4 C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F5D8 90A10094 */ stw r5, 0x94(r1)
/* 0000F5DC C8660000 */ lfd f3, lbl_00011EC8@l(r6)
/* 0000F5E0 90010090 */ stw r0, 0x90(r1)
/* 0000F5E4 C8010090 */ lfd f0, 0x90(r1)
/* 0000F5E8 90010088 */ stw r0, 0x88(r1)
/* 0000F5EC FC000828 */ fsub f0, f0, f1
/* 0000F5F0 C8210088 */ lfd f1, 0x88(r1)
/* 0000F5F4 FC020032 */ fmul f0, f2, f0
/* 0000F5F8 FC211828 */ fsub f1, f1, f3
/* 0000F5FC FC01002A */ fadd f0, f1, f0
/* 0000F600 FC00001E */ fctiwz f0, f0
/* 0000F604 D8010098 */ stfd f0, 0x98(r1)
/* 0000F608 80A1009C */ lwz r5, 0x9c(r1)
/* 0000F60C 98A4000E */ stb r5, 0xe(r4)
/* 0000F610 88E40070 */ lbz r7, 0x70(r4)
/* 0000F614 3CC00000 */ lis r6, lbl_00011D00@ha
/* 0000F618 C8260000 */ lfd f1, lbl_00011D00@l(r6)
/* 0000F61C 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000F620 7CA700D0 */ neg r5, r7
/* 0000F624 6CA58000 */ xoris r5, r5, 0x8000
/* 0000F628 90E10054 */ stw r7, 0x54(r1)
/* 0000F62C C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000F630 3CE00000 */ lis r7, lbl_00011D00@ha
/* 0000F634 90A1004C */ stw r5, 0x4c(r1)
/* 0000F638 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000F63C C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F640 90010048 */ stw r0, 0x48(r1)
/* 0000F644 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F648 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000F64C C8010048 */ lfd f0, 0x48(r1)
/* 0000F650 90010050 */ stw r0, 0x50(r1)
/* 0000F654 FC000828 */ fsub f0, f0, f1
/* 0000F658 C8210050 */ lfd f1, 0x50(r1)
/* 0000F65C FC020032 */ fmul f0, f2, f0
/* 0000F660 FC211828 */ fsub f1, f1, f3
/* 0000F664 FC01002A */ fadd f0, f1, f0
/* 0000F668 FC00001E */ fctiwz f0, f0
/* 0000F66C D8010040 */ stfd f0, 0x40(r1)
/* 0000F670 81210044 */ lwz r9, 0x44(r1)
/* 0000F674 99240070 */ stb r9, 0x70(r4)
/* 0000F678 89240071 */ lbz r9, 0x71(r4)
/* 0000F67C C8270000 */ lfd f1, lbl_00011D00@l(r7)
/* 0000F680 7CE900D0 */ neg r7, r9
/* 0000F684 9121003C */ stw r9, 0x3c(r1)
/* 0000F688 6CE78000 */ xoris r7, r7, 0x8000
/* 0000F68C C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F690 90E10034 */ stw r7, 0x34(r1)
/* 0000F694 C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000F698 90010030 */ stw r0, 0x30(r1)
/* 0000F69C C8010030 */ lfd f0, 0x30(r1)
/* 0000F6A0 90010038 */ stw r0, 0x38(r1)
/* 0000F6A4 FC000828 */ fsub f0, f0, f1
/* 0000F6A8 C8210038 */ lfd f1, 0x38(r1)
/* 0000F6AC FC020032 */ fmul f0, f2, f0
/* 0000F6B0 FC211828 */ fsub f1, f1, f3
/* 0000F6B4 FC01002A */ fadd f0, f1, f0
/* 0000F6B8 FC00001E */ fctiwz f0, f0
/* 0000F6BC D8010028 */ stfd f0, 0x28(r1)
/* 0000F6C0 80E1002C */ lwz r7, 0x2c(r1)
/* 0000F6C4 98E40071 */ stb r7, 0x71(r4)
/* 0000F6C8 88E40072 */ lbz r7, 0x72(r4)
/* 0000F6CC C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000F6D0 7CA700D0 */ neg r5, r7
/* 0000F6D4 90E10024 */ stw r7, 0x24(r1)
/* 0000F6D8 6CA58000 */ xoris r5, r5, 0x8000
/* 0000F6DC C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F6E0 90A1001C */ stw r5, 0x1c(r1)
/* 0000F6E4 C8660000 */ lfd f3, lbl_00011EC8@l(r6)
/* 0000F6E8 90010018 */ stw r0, 0x18(r1)
/* 0000F6EC C8010018 */ lfd f0, 0x18(r1)
/* 0000F6F0 90010020 */ stw r0, 0x20(r1)
/* 0000F6F4 FC000828 */ fsub f0, f0, f1
/* 0000F6F8 C8210020 */ lfd f1, 0x20(r1)
/* 0000F6FC FC020032 */ fmul f0, f2, f0
/* 0000F700 FC211828 */ fsub f1, f1, f3
/* 0000F704 FC01002A */ fadd f0, f1, f0
/* 0000F708 FC00001E */ fctiwz f0, f0
/* 0000F70C D8010010 */ stfd f0, 0x10(r1)
/* 0000F710 80010014 */ lwz r0, 0x14(r1)
/* 0000F714 98040072 */ stb r0, 0x72(r4)
/* 0000F718 C0440040 */ lfs f2, 0x40(r4)
/* 0000F71C C8030098 */ lfd f0, 0x98(r3)
/* 0000F720 C8230000 */ lfd f1, 0(r3)
/* 0000F724 FC001028 */ fsub f0, f0, f2
/* 0000F728 FC010032 */ fmul f0, f1, f0
/* 0000F72C FC02002A */ fadd f0, f2, f0
/* 0000F730 FC000018 */ frsp f0, f0
/* 0000F734 D0040040 */ stfs f0, 0x40(r4)
/* 0000F738 C0040040 */ lfs f0, 0x40(r4)
/* 0000F73C D0040044 */ stfs f0, 0x44(r4)
/* 0000F740 C044006C */ lfs f2, 0x6c(r4)
/* 0000F744 C8030030 */ lfd f0, 0x30(r3)
/* 0000F748 C82302E8 */ lfd f1, 0x2e8(r3)
/* 0000F74C FC001028 */ fsub f0, f0, f2
/* 0000F750 FC010032 */ fmul f0, f1, f0
/* 0000F754 FC02002A */ fadd f0, f2, f0
/* 0000F758 FC000018 */ frsp f0, f0
/* 0000F75C D004006C */ stfs f0, 0x6c(r4)
lbl_0000F760:
/* 0000F760 C023003C */ lfs f1, 0x3c(r3)
/* 0000F764 C004006C */ lfs f0, 0x6c(r4)
/* 0000F768 C84303E8 */ lfd f2, 0x3e8(r3)
/* 0000F76C EC010032 */ fmuls f0, f1, f0
/* 0000F770 FC020028 */ fsub f0, f2, f0
/* 0000F774 FC000018 */ frsp f0, f0
/* 0000F778 D004004C */ stfs f0, 0x4c(r4)
/* 0000F77C 83E100A4 */ lwz r31, 0xa4(r1)
/* 0000F780 382100A8 */ addi r1, r1, 0xa8
/* 0000F784 4E800020 */ blr 
lbl_0000F788:
/* 0000F788 7C0802A6 */ mflr r0
/* 0000F78C 3C800000 */ lis r4, lbl_00012730@ha
/* 0000F790 90010004 */ stw r0, 4(r1)
/* 0000F794 3800040E */ li r0, 0x40e
/* 0000F798 9421FF48 */ stwu r1, -0xb8(r1)
/* 0000F79C BF4100A0 */ stmw r26, 0xa0(r1)
/* 0000F7A0 3B430000 */ addi r26, r3, 0
/* 0000F7A4 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000F7A8 3BC30000 */ addi r30, r3, lbl_00011CB0@l
/* 0000F7AC 3BA40000 */ addi r29, r4, lbl_00012730@l
/* 0000F7B0 3861000C */ addi r3, r1, 0xc
/* 0000F7B4 9001000C */ stw r0, 0xc(r1)
/* 0000F7B8 3800FFFF */ li r0, -1
/* 0000F7BC C01A0004 */ lfs f0, 4(r26)
/* 0000F7C0 D0010010 */ stfs f0, 0x10(r1)
/* 0000F7C4 C01A0008 */ lfs f0, 8(r26)
/* 0000F7C8 D0010014 */ stfs f0, 0x14(r1)
/* 0000F7CC C01A004C */ lfs f0, 0x4c(r26)
/* 0000F7D0 D0010018 */ stfs f0, 0x18(r1)
/* 0000F7D4 C01A0040 */ lfs f0, 0x40(r26)
/* 0000F7D8 D001001C */ stfs f0, 0x1c(r1)
/* 0000F7DC C01A0044 */ lfs f0, 0x44(r26)
/* 0000F7E0 D0010020 */ stfs f0, 0x20(r1)
/* 0000F7E4 C01E0008 */ lfs f0, 8(r30)
/* 0000F7E8 D0010024 */ stfs f0, 0x24(r1)
/* 0000F7EC C01E0008 */ lfs f0, 8(r30)
/* 0000F7F0 D0010028 */ stfs f0, 0x28(r1)
/* 0000F7F4 C01E000C */ lfs f0, 0xc(r30)
/* 0000F7F8 D001002C */ stfs f0, 0x2c(r1)
/* 0000F7FC C01E000C */ lfs f0, 0xc(r30)
/* 0000F800 D0010030 */ stfs f0, 0x30(r1)
/* 0000F804 A89A0068 */ lha r4, 0x68(r26)
/* 0000F808 90810034 */ stw r4, 0x34(r1)
/* 0000F80C C01A006C */ lfs f0, 0x6c(r26)
/* 0000F810 D0010038 */ stfs f0, 0x38(r1)
/* 0000F814 9001003C */ stw r0, 0x3c(r1)
/* 0000F818 801A0074 */ lwz r0, 0x74(r26)
/* 0000F81C 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 0000F820 6000000A */ ori r0, r0, 0xa
/* 0000F824 90010040 */ stw r0, 0x40(r1)
/* 0000F828 C03E0010 */ lfs f1, 0x10(r30)
/* 0000F82C C01A006C */ lfs f0, 0x6c(r26)
/* 0000F830 881A000C */ lbz r0, 0xc(r26)
/* 0000F834 EC010032 */ fmuls f0, f1, f0
/* 0000F838 88BA000D */ lbz r5, 0xd(r26)
/* 0000F83C 88DA000E */ lbz r6, 0xe(r26)
/* 0000F840 FC00001E */ fctiwz f0, f0
/* 0000F844 D8010098 */ stfd f0, 0x98(r1)
/* 0000F848 8081009C */ lwz r4, 0x9c(r1)
/* 0000F84C 5484C00E */ slwi r4, r4, 0x18
/* 0000F850 5004821E */ rlwimi r4, r0, 0x10, 8, 0xf
/* 0000F854 50A4442E */ rlwimi r4, r5, 8, 0x10, 0x17
/* 0000F858 7CC02378 */ or r0, r6, r4
/* 0000F85C 90010044 */ stw r0, 0x44(r1)
/* 0000F860 881A0071 */ lbz r0, 0x71(r26)
/* 0000F864 889A0070 */ lbz r4, 0x70(r26)
/* 0000F868 5400402E */ slwi r0, r0, 8
/* 0000F86C 88BA0072 */ lbz r5, 0x72(r26)
/* 0000F870 5080821E */ rlwimi r0, r4, 0x10, 8, 0xf
/* 0000F874 7CA00378 */ or r0, r5, r0
/* 0000F878 90010048 */ stw r0, 0x48(r1)
/* 0000F87C 4BFF090D */ bl draw_naomi_sprite
/* 0000F880 801A0048 */ lwz r0, 0x48(r26)
/* 0000F884 2C000001 */ cmpwi r0, 1
/* 0000F888 4082005C */ bne lbl_0000F8E4
/* 0000F88C 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000F890 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 0000F894 5403482C */ slwi r3, r0, 9
/* 0000F898 4BFF08F1 */ bl mathutil_sin
/* 0000F89C FC200A10 */ fabs f1, f1
/* 0000F8A0 C81E03F0 */ lfd f0, 0x3f0(r30)
/* 0000F8A4 FC000072 */ fmul f0, f0, f1
/* 0000F8A8 FC00001E */ fctiwz f0, f0
/* 0000F8AC D8010098 */ stfd f0, 0x98(r1)
/* 0000F8B0 8001009C */ lwz r0, 0x9c(r1)
/* 0000F8B4 981A0070 */ stb r0, 0x70(r26)
/* 0000F8B8 881A0070 */ lbz r0, 0x70(r26)
/* 0000F8BC 981A0071 */ stb r0, 0x71(r26)
/* 0000F8C0 881A0070 */ lbz r0, 0x70(r26)
/* 0000F8C4 981A0072 */ stb r0, 0x72(r26)
/* 0000F8C8 881A0071 */ lbz r0, 0x71(r26)
/* 0000F8CC 887A0070 */ lbz r3, 0x70(r26)
/* 0000F8D0 5400402E */ slwi r0, r0, 8
/* 0000F8D4 889A0072 */ lbz r4, 0x72(r26)
/* 0000F8D8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000F8DC 7C800378 */ or r0, r4, r0
/* 0000F8E0 90010048 */ stw r0, 0x48(r1)
lbl_0000F8E4:
/* 0000F8E4 A01A003C */ lhz r0, 0x3c(r26)
/* 0000F8E8 3C600000 */ lis r3, bitmapGroups@ha
/* 0000F8EC 38630000 */ addi r3, r3, bitmapGroups@l
/* 0000F8F0 54002834 */ slwi r0, r0, 5
/* 0000F8F4 7F7D0214 */ add r27, r29, r0
/* 0000F8F8 801B4448 */ lwz r0, 0x4448(r27)
/* 0000F8FC 3B830010 */ addi r28, r3, 0x10
/* 0000F900 3FE04330 */ lis r31, 0x4330
/* 0000F904 9001000C */ stw r0, 0xc(r1)
/* 0000F908 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 0000F90C 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000F910 8101000C */ lwz r8, 0xc(r1)
/* 0000F914 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0000F918 C03B4450 */ lfs f1, 0x4450(r27)
/* 0000F91C 3C800000 */ lis r4, lbl_00011EC8@ha
/* 0000F920 5500C63E */ rlwinm r0, r8, 0x18, 0x18, 0x1f
/* 0000F924 C01A0040 */ lfs f0, 0x40(r26)
/* 0000F928 1C000018 */ mulli r0, r0, 0x18
/* 0000F92C C05A0004 */ lfs f2, 4(r26)
/* 0000F930 EC010032 */ fmuls f0, f1, f0
/* 0000F934 7C7C002E */ lwzx r3, r28, r0
/* 0000F938 55002536 */ rlwinm r0, r8, 4, 0x14, 0x1b
/* 0000F93C 80630004 */ lwz r3, 4(r3)
/* 0000F940 EC02002A */ fadds f0, f2, f0
/* 0000F944 7D030214 */ add r8, r3, r0
/* 0000F948 D0010010 */ stfs f0, 0x10(r1)
/* 0000F94C 3861000C */ addi r3, r1, 0xc
/* 0000F950 C03B4454 */ lfs f1, 0x4454(r27)
/* 0000F954 C01A0044 */ lfs f0, 0x44(r26)
/* 0000F958 C05A0008 */ lfs f2, 8(r26)
/* 0000F95C EC010032 */ fmuls f0, f1, f0
/* 0000F960 EC02002A */ fadds f0, f2, f0
/* 0000F964 D0010014 */ stfs f0, 0x14(r1)
/* 0000F968 C03A004C */ lfs f1, 0x4c(r26)
/* 0000F96C C81E0190 */ lfd f0, 0x190(r30)
/* 0000F970 FC010028 */ fsub f0, f1, f0
/* 0000F974 FC000018 */ frsp f0, f0
/* 0000F978 D0010018 */ stfs f0, 0x18(r1)
/* 0000F97C A0080008 */ lhz r0, 8(r8)
/* 0000F980 C8270000 */ lfd f1, lbl_00011EC8@l(r7)
/* 0000F984 9001009C */ stw r0, 0x9c(r1)
/* 0000F988 C05B4458 */ lfs f2, 0x4458(r27)
/* 0000F98C 93E10098 */ stw r31, 0x98(r1)
/* 0000F990 C8010098 */ lfd f0, 0x98(r1)
/* 0000F994 EC000828 */ fsubs f0, f0, f1
/* 0000F998 EC020024 */ fdivs f0, f2, f0
/* 0000F99C D0010024 */ stfs f0, 0x24(r1)
/* 0000F9A0 A008000A */ lhz r0, 0xa(r8)
/* 0000F9A4 C8260000 */ lfd f1, lbl_00011EC8@l(r6)
/* 0000F9A8 90010094 */ stw r0, 0x94(r1)
/* 0000F9AC C05B445C */ lfs f2, 0x445c(r27)
/* 0000F9B0 93E10090 */ stw r31, 0x90(r1)
/* 0000F9B4 C8010090 */ lfd f0, 0x90(r1)
/* 0000F9B8 EC000828 */ fsubs f0, f0, f1
/* 0000F9BC EC020024 */ fdivs f0, f2, f0
/* 0000F9C0 D0010028 */ stfs f0, 0x28(r1)
/* 0000F9C4 A0080008 */ lhz r0, 8(r8)
/* 0000F9C8 C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 0000F9CC 9001008C */ stw r0, 0x8c(r1)
/* 0000F9D0 C05B4460 */ lfs f2, 0x4460(r27)
/* 0000F9D4 93E10088 */ stw r31, 0x88(r1)
/* 0000F9D8 C0610024 */ lfs f3, 0x24(r1)
/* 0000F9DC C8010088 */ lfd f0, 0x88(r1)
/* 0000F9E0 EC000828 */ fsubs f0, f0, f1
/* 0000F9E4 EC020024 */ fdivs f0, f2, f0
/* 0000F9E8 EC03002A */ fadds f0, f3, f0
/* 0000F9EC D001002C */ stfs f0, 0x2c(r1)
/* 0000F9F0 A008000A */ lhz r0, 0xa(r8)
/* 0000F9F4 C05B4464 */ lfs f2, 0x4464(r27)
/* 0000F9F8 3B7B4448 */ addi r27, r27, 0x4448
/* 0000F9FC 90010084 */ stw r0, 0x84(r1)
/* 0000FA00 C8240000 */ lfd f1, lbl_00011EC8@l(r4)
/* 0000FA04 93E10080 */ stw r31, 0x80(r1)
/* 0000FA08 C0610028 */ lfs f3, 0x28(r1)
/* 0000FA0C C8010080 */ lfd f0, 0x80(r1)
/* 0000FA10 EC000828 */ fsubs f0, f0, f1
/* 0000FA14 EC020024 */ fdivs f0, f2, f0
/* 0000FA18 EC03002A */ fadds f0, f3, f0
/* 0000FA1C D0010030 */ stfs f0, 0x30(r1)
/* 0000FA20 C021002C */ lfs f1, 0x2c(r1)
/* 0000FA24 C0010024 */ lfs f0, 0x24(r1)
/* 0000FA28 C05A0040 */ lfs f2, 0x40(r26)
/* 0000FA2C EC010028 */ fsubs f0, f1, f0
/* 0000FA30 EC020032 */ fmuls f0, f2, f0
/* 0000FA34 D001001C */ stfs f0, 0x1c(r1)
/* 0000FA38 C0210030 */ lfs f1, 0x30(r1)
/* 0000FA3C C0010028 */ lfs f0, 0x28(r1)
/* 0000FA40 C05A0044 */ lfs f2, 0x44(r26)
/* 0000FA44 EC010028 */ fsubs f0, f1, f0
/* 0000FA48 EC020032 */ fmuls f0, f2, f0
/* 0000FA4C D0010020 */ stfs f0, 0x20(r1)
/* 0000FA50 4BFF0739 */ bl draw_naomi_sprite
/* 0000FA54 801B0004 */ lwz r0, 4(r27)
/* 0000FA58 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 0000FA5C 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000FA60 54002834 */ slwi r0, r0, 5
/* 0000FA64 7D3D0214 */ add r9, r29, r0
/* 0000FA68 80094788 */ lwz r0, 0x4788(r9)
/* 0000FA6C 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0000FA70 3C800000 */ lis r4, lbl_00011EC8@ha
/* 0000FA74 9001000C */ stw r0, 0xc(r1)
/* 0000FA78 8101000C */ lwz r8, 0xc(r1)
/* 0000FA7C C0294790 */ lfs f1, 0x4790(r9)
/* 0000FA80 5500C63E */ rlwinm r0, r8, 0x18, 0x18, 0x1f
/* 0000FA84 C01A0040 */ lfs f0, 0x40(r26)
/* 0000FA88 1C000018 */ mulli r0, r0, 0x18
/* 0000FA8C C05A0004 */ lfs f2, 4(r26)
/* 0000FA90 EC010032 */ fmuls f0, f1, f0
/* 0000FA94 7C7C002E */ lwzx r3, r28, r0
/* 0000FA98 55002536 */ rlwinm r0, r8, 4, 0x14, 0x1b
/* 0000FA9C EC02002A */ fadds f0, f2, f0
/* 0000FAA0 81030004 */ lwz r8, 4(r3)
/* 0000FAA4 3861000C */ addi r3, r1, 0xc
/* 0000FAA8 D0010010 */ stfs f0, 0x10(r1)
/* 0000FAAC 7D080214 */ add r8, r8, r0
/* 0000FAB0 C0294794 */ lfs f1, 0x4794(r9)
/* 0000FAB4 C01A0044 */ lfs f0, 0x44(r26)
/* 0000FAB8 C05A0008 */ lfs f2, 8(r26)
/* 0000FABC EC010032 */ fmuls f0, f1, f0
/* 0000FAC0 EC02002A */ fadds f0, f2, f0
/* 0000FAC4 D0010014 */ stfs f0, 0x14(r1)
/* 0000FAC8 C03A004C */ lfs f1, 0x4c(r26)
/* 0000FACC C81E0190 */ lfd f0, 0x190(r30)
/* 0000FAD0 FC010028 */ fsub f0, f1, f0
/* 0000FAD4 FC000018 */ frsp f0, f0
/* 0000FAD8 D0010018 */ stfs f0, 0x18(r1)
/* 0000FADC A0080008 */ lhz r0, 8(r8)
/* 0000FAE0 C8270000 */ lfd f1, lbl_00011EC8@l(r7)
/* 0000FAE4 9001007C */ stw r0, 0x7c(r1)
/* 0000FAE8 C0494798 */ lfs f2, 0x4798(r9)
/* 0000FAEC 93E10078 */ stw r31, 0x78(r1)
/* 0000FAF0 C8010078 */ lfd f0, 0x78(r1)
/* 0000FAF4 EC000828 */ fsubs f0, f0, f1
/* 0000FAF8 EC020024 */ fdivs f0, f2, f0
/* 0000FAFC D0010024 */ stfs f0, 0x24(r1)
/* 0000FB00 A008000A */ lhz r0, 0xa(r8)
/* 0000FB04 C8260000 */ lfd f1, lbl_00011EC8@l(r6)
/* 0000FB08 90010074 */ stw r0, 0x74(r1)
/* 0000FB0C C049479C */ lfs f2, 0x479c(r9)
/* 0000FB10 93E10070 */ stw r31, 0x70(r1)
/* 0000FB14 C8010070 */ lfd f0, 0x70(r1)
/* 0000FB18 EC000828 */ fsubs f0, f0, f1
/* 0000FB1C EC020024 */ fdivs f0, f2, f0
/* 0000FB20 D0010028 */ stfs f0, 0x28(r1)
/* 0000FB24 A0080008 */ lhz r0, 8(r8)
/* 0000FB28 C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 0000FB2C 9001006C */ stw r0, 0x6c(r1)
/* 0000FB30 C04947A0 */ lfs f2, 0x47a0(r9)
/* 0000FB34 93E10068 */ stw r31, 0x68(r1)
/* 0000FB38 C0610024 */ lfs f3, 0x24(r1)
/* 0000FB3C C8010068 */ lfd f0, 0x68(r1)
/* 0000FB40 EC000828 */ fsubs f0, f0, f1
/* 0000FB44 EC020024 */ fdivs f0, f2, f0
/* 0000FB48 EC03002A */ fadds f0, f3, f0
/* 0000FB4C D001002C */ stfs f0, 0x2c(r1)
/* 0000FB50 A008000A */ lhz r0, 0xa(r8)
/* 0000FB54 C8240000 */ lfd f1, lbl_00011EC8@l(r4)
/* 0000FB58 90010064 */ stw r0, 0x64(r1)
/* 0000FB5C C04947A4 */ lfs f2, 0x47a4(r9)
/* 0000FB60 93E10060 */ stw r31, 0x60(r1)
/* 0000FB64 C0610028 */ lfs f3, 0x28(r1)
/* 0000FB68 C8010060 */ lfd f0, 0x60(r1)
/* 0000FB6C EC000828 */ fsubs f0, f0, f1
/* 0000FB70 EC020024 */ fdivs f0, f2, f0
/* 0000FB74 EC03002A */ fadds f0, f3, f0
/* 0000FB78 D0010030 */ stfs f0, 0x30(r1)
/* 0000FB7C C021002C */ lfs f1, 0x2c(r1)
/* 0000FB80 C0010024 */ lfs f0, 0x24(r1)
/* 0000FB84 C05A0040 */ lfs f2, 0x40(r26)
/* 0000FB88 EC010028 */ fsubs f0, f1, f0
/* 0000FB8C EC020032 */ fmuls f0, f2, f0
/* 0000FB90 D001001C */ stfs f0, 0x1c(r1)
/* 0000FB94 C0210030 */ lfs f1, 0x30(r1)
/* 0000FB98 C0010028 */ lfs f0, 0x28(r1)
/* 0000FB9C C05A0044 */ lfs f2, 0x44(r26)
/* 0000FBA0 EC010028 */ fsubs f0, f1, f0
/* 0000FBA4 EC020032 */ fmuls f0, f2, f0
/* 0000FBA8 D0010020 */ stfs f0, 0x20(r1)
/* 0000FBAC 4BFF05DD */ bl draw_naomi_sprite
/* 0000FBB0 801A0048 */ lwz r0, 0x48(r26)
/* 0000FBB4 2C000001 */ cmpwi r0, 1
/* 0000FBB8 40820030 */ bne lbl_0000FBE8
/* 0000FBBC 38000000 */ li r0, 0
/* 0000FBC0 981A0070 */ stb r0, 0x70(r26)
/* 0000FBC4 981A0071 */ stb r0, 0x71(r26)
/* 0000FBC8 981A0072 */ stb r0, 0x72(r26)
/* 0000FBCC 881A0071 */ lbz r0, 0x71(r26)
/* 0000FBD0 887A0070 */ lbz r3, 0x70(r26)
/* 0000FBD4 5400402E */ slwi r0, r0, 8
/* 0000FBD8 889A0072 */ lbz r4, 0x72(r26)
/* 0000FBDC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000FBE0 7C800378 */ or r0, r4, r0
/* 0000FBE4 90010048 */ stw r0, 0x48(r1)
lbl_0000FBE8:
/* 0000FBE8 807A0048 */ lwz r3, 0x48(r26)
/* 0000FBEC 2C030005 */ cmpwi r3, 5
/* 0000FBF0 41820010 */ beq lbl_0000FC00
/* 0000FBF4 3803FFF8 */ addi r0, r3, -8  ;# fixed addi
/* 0000FBF8 28000001 */ cmplwi r0, 1
/* 0000FBFC 418100F8 */ bgt lbl_0000FCF4
lbl_0000FC00:
/* 0000FC00 38000410 */ li r0, 0x410
/* 0000FC04 9001000C */ stw r0, 0xc(r1)
/* 0000FC08 C01A0004 */ lfs f0, 4(r26)
/* 0000FC0C D0010010 */ stfs f0, 0x10(r1)
/* 0000FC10 C01A0008 */ lfs f0, 8(r26)
/* 0000FC14 D0010014 */ stfs f0, 0x14(r1)
/* 0000FC18 C03A004C */ lfs f1, 0x4c(r26)
/* 0000FC1C C81E0330 */ lfd f0, 0x330(r30)
/* 0000FC20 FC010028 */ fsub f0, f1, f0
/* 0000FC24 FC000018 */ frsp f0, f0
/* 0000FC28 D0010018 */ stfs f0, 0x18(r1)
/* 0000FC2C C83E03C8 */ lfd f1, 0x3c8(r30)
/* 0000FC30 C01A0040 */ lfs f0, 0x40(r26)
/* 0000FC34 FC010032 */ fmul f0, f1, f0
/* 0000FC38 FC000018 */ frsp f0, f0
/* 0000FC3C D001001C */ stfs f0, 0x1c(r1)
/* 0000FC40 C83E03C8 */ lfd f1, 0x3c8(r30)
/* 0000FC44 C01A0044 */ lfs f0, 0x44(r26)
/* 0000FC48 FC010032 */ fmul f0, f1, f0
/* 0000FC4C FC000018 */ frsp f0, f0
/* 0000FC50 D0010020 */ stfs f0, 0x20(r1)
/* 0000FC54 C01E0008 */ lfs f0, 8(r30)
/* 0000FC58 D0010024 */ stfs f0, 0x24(r1)
/* 0000FC5C C01E0008 */ lfs f0, 8(r30)
/* 0000FC60 D0010028 */ stfs f0, 0x28(r1)
/* 0000FC64 C01E000C */ lfs f0, 0xc(r30)
/* 0000FC68 D001002C */ stfs f0, 0x2c(r1)
/* 0000FC6C C01E000C */ lfs f0, 0xc(r30)
/* 0000FC70 D0010030 */ stfs f0, 0x30(r1)
/* 0000FC74 801A0048 */ lwz r0, 0x48(r26)
/* 0000FC78 2C000005 */ cmpwi r0, 5
/* 0000FC7C 4082000C */ bne lbl_0000FC88
/* 0000FC80 C83E0030 */ lfd f1, 0x30(r30)
/* 0000FC84 48000028 */ b lbl_0000FCAC
lbl_0000FC88:
/* 0000FC88 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000FC8C 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 0000FC90 5403482C */ slwi r3, r0, 9
/* 0000FC94 4BFF04F5 */ bl mathutil_sin
/* 0000FC98 FC400A10 */ fabs f2, f1
/* 0000FC9C C83E0400 */ lfd f1, 0x400(r30)
/* 0000FCA0 C81E03F8 */ lfd f0, 0x3f8(r30)
/* 0000FCA4 FC2100B2 */ fmul f1, f1, f2
/* 0000FCA8 FC200828 */ fsub f1, f0, f1
lbl_0000FCAC:
/* 0000FCAC C01A006C */ lfs f0, 0x6c(r26)
/* 0000FCB0 38000000 */ li r0, 0
/* 0000FCB4 3861000C */ addi r3, r1, 0xc
/* 0000FCB8 FC000072 */ fmul f0, f0, f1
/* 0000FCBC FC000018 */ frsp f0, f0
/* 0000FCC0 D0010038 */ stfs f0, 0x38(r1)
/* 0000FCC4 C03E0010 */ lfs f1, 0x10(r30)
/* 0000FCC8 C01A006C */ lfs f0, 0x6c(r26)
/* 0000FCCC EC010032 */ fmuls f0, f1, f0
/* 0000FCD0 FC00001E */ fctiwz f0, f0
/* 0000FCD4 D8010060 */ stfd f0, 0x60(r1)
/* 0000FCD8 80810064 */ lwz r4, 0x64(r1)
/* 0000FCDC 5484C00E */ slwi r4, r4, 0x18
/* 0000FCE0 648400FF */ oris r4, r4, 0xff
/* 0000FCE4 6084FFFF */ ori r4, r4, 0xffff
/* 0000FCE8 90810044 */ stw r4, 0x44(r1)
/* 0000FCEC 90010048 */ stw r0, 0x48(r1)
/* 0000FCF0 4BFF0499 */ bl draw_naomi_sprite
lbl_0000FCF4:
/* 0000FCF4 807A0048 */ lwz r3, 0x48(r26)
/* 0000FCF8 2C030005 */ cmpwi r3, 5
/* 0000FCFC 41820010 */ beq lbl_0000FD0C
/* 0000FD00 3803FFF8 */ addi r0, r3, -8  ;# fixed addi
/* 0000FD04 28000003 */ cmplwi r0, 3
/* 0000FD08 418100F0 */ bgt lbl_0000FDF8
lbl_0000FD0C:
/* 0000FD0C 881A000F */ lbz r0, 0xf(r26)
/* 0000FD10 7C000774 */ extsb r0, r0
/* 0000FD14 2C000040 */ cmpwi r0, 0x40
/* 0000FD18 41820038 */ beq lbl_0000FD50
/* 0000FD1C 40800010 */ bge lbl_0000FD2C
/* 0000FD20 2C00003F */ cmpwi r0, 0x3f
/* 0000FD24 40800018 */ bge lbl_0000FD3C
/* 0000FD28 480000D0 */ b lbl_0000FDF8
lbl_0000FD2C:
/* 0000FD2C 2C000042 */ cmpwi r0, 0x42
/* 0000FD30 408000C8 */ bge lbl_0000FDF8
/* 0000FD34 48000030 */ b lbl_0000FD64
/* 0000FD38 480000C0 */ b lbl_0000FDF8
lbl_0000FD3C:
/* 0000FD3C 38600006 */ li r3, 6
/* 0000FD40 4BFF0449 */ bl is_minigame_unlocked
/* 0000FD44 2C030000 */ cmpwi r3, 0
/* 0000FD48 4182002C */ beq lbl_0000FD74
/* 0000FD4C 480000AC */ b lbl_0000FDF8
lbl_0000FD50:
/* 0000FD50 38600007 */ li r3, 7
/* 0000FD54 4BFF0435 */ bl is_minigame_unlocked
/* 0000FD58 2C030000 */ cmpwi r3, 0
/* 0000FD5C 41820018 */ beq lbl_0000FD74
/* 0000FD60 48000098 */ b lbl_0000FDF8
lbl_0000FD64:
/* 0000FD64 38600008 */ li r3, 8
/* 0000FD68 4BFF0421 */ bl is_minigame_unlocked
/* 0000FD6C 2C030000 */ cmpwi r3, 0
/* 0000FD70 40820088 */ bne lbl_0000FDF8
lbl_0000FD74:
/* 0000FD74 4BFF0415 */ bl reset_text_draw_settings
/* 0000FD78 38600001 */ li r3, 1
/* 0000FD7C 4BFF040D */ bl set_text_font
/* 0000FD80 C85E0378 */ lfd f2, 0x378(r30)
/* 0000FD84 C03A0040 */ lfs f1, 0x40(r26)
/* 0000FD88 C01A0044 */ lfs f0, 0x44(r26)
/* 0000FD8C FC220072 */ fmul f1, f2, f1
/* 0000FD90 FC420032 */ fmul f2, f2, f0
/* 0000FD94 FC200818 */ frsp f1, f1
/* 0000FD98 FC401018 */ frsp f2, f2
/* 0000FD9C 4BFF03ED */ bl set_text_scale
/* 0000FDA0 3C600100 */ lis r3, 0x100
/* 0000FDA4 3863FF00 */ addi r3, r3, -256  ;# fixed addi
/* 0000FDA8 4BFF03E1 */ bl set_text_mul_color
/* 0000FDAC C03E003C */ lfs f1, 0x3c(r30)
/* 0000FDB0 4BFF03D9 */ bl func_80071B1C
/* 0000FDB4 C03A006C */ lfs f1, 0x6c(r26)
/* 0000FDB8 4BFF03D1 */ bl set_text_opacity
/* 0000FDBC C07E0408 */ lfs f3, 0x408(r30)
/* 0000FDC0 C05A0040 */ lfs f2, 0x40(r26)
/* 0000FDC4 C03E040C */ lfs f1, 0x40c(r30)
/* 0000FDC8 C01A0044 */ lfs f0, 0x44(r26)
/* 0000FDCC EC6300B2 */ fmuls f3, f3, f2
/* 0000FDD0 C09A0004 */ lfs f4, 4(r26)
/* 0000FDD4 EC010032 */ fmuls f0, f1, f0
/* 0000FDD8 C05A0008 */ lfs f2, 8(r26)
/* 0000FDDC EC24182A */ fadds f1, f4, f3
/* 0000FDE0 EC42002A */ fadds f2, f2, f0
/* 0000FDE4 4BFF03A5 */ bl set_text_pos
/* 0000FDE8 387D48E8 */ addi r3, r29, 0x48e8
/* 0000FDEC 4CC63182 */ crclr 6
/* 0000FDF0 388009C4 */ li r4, 0x9c4
/* 0000FDF4 4BFF0395 */ bl func_80072AC0
lbl_0000FDF8:
/* 0000FDF8 BB4100A0 */ lmw r26, 0xa0(r1)
/* 0000FDFC 800100BC */ lwz r0, 0xbc(r1)
/* 0000FE00 382100B8 */ addi r1, r1, 0xb8
/* 0000FE04 7C0803A6 */ mtlr r0
/* 0000FE08 4E800020 */ blr 
lbl_0000FE0C:
/* 0000FE0C 7C0802A6 */ mflr r0
/* 0000FE10 3C800000 */ lis r4, lbl_00012730@ha
/* 0000FE14 90010004 */ stw r0, 4(r1)
/* 0000FE18 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000FE1C 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000FE20 BF210014 */ stmw r25, 0x14(r1)
/* 0000FE24 3BC40000 */ addi r30, r4, lbl_00012730@l
/* 0000FE28 3BE30000 */ addi r31, r3, lbl_00011CB0@l
/* 0000FE2C 4BFF035D */ bl create_sprite
/* 0000FE30 7C791B79 */ or. r25, r3, r3
/* 0000FE34 41820078 */ beq lbl_0000FEAC
/* 0000FE38 3800001D */ li r0, 0x1d
/* 0000FE3C 9819000F */ stb r0, 0xf(r25)
/* 0000FE40 38000001 */ li r0, 1
/* 0000FE44 3C800000 */ lis r4, lbl_0000FF7C@ha
/* 0000FE48 98190000 */ stb r0, 0(r25)
/* 0000FE4C 3C600000 */ lis r3, lbl_00010438@ha
/* 0000FE50 39000004 */ li r8, 4
/* 0000FE54 C01F0014 */ lfs f0, 0x14(r31)
/* 0000FE58 38E00000 */ li r7, 0
/* 0000FE5C 38C0000F */ li r6, 0xf
/* 0000FE60 D0190004 */ stfs f0, 4(r25)
/* 0000FE64 38A40000 */ addi r5, r4, lbl_0000FF7C@l
/* 0000FE68 38030000 */ addi r0, r3, lbl_00010438@l
/* 0000FE6C C01F0410 */ lfs f0, 0x410(r31)
/* 0000FE70 3879008C */ addi r3, r25, 0x8c
/* 0000FE74 389E4900 */ addi r4, r30, 0x4900
/* 0000FE78 D0190008 */ stfs f0, 8(r25)
/* 0000FE7C C01F03B4 */ lfs f0, 0x3b4(r31)
/* 0000FE80 D019004C */ stfs f0, 0x4c(r25)
/* 0000FE84 99190003 */ stb r8, 3(r25)
/* 0000FE88 C01F0008 */ lfs f0, 8(r31)
/* 0000FE8C D019006C */ stfs f0, 0x6c(r25)
/* 0000FE90 90F90048 */ stw r7, 0x48(r25)
/* 0000FE94 B0D90010 */ sth r6, 0x10(r25)
/* 0000FE98 90B90034 */ stw r5, 0x34(r25)
/* 0000FE9C 90190038 */ stw r0, 0x38(r25)
/* 0000FEA0 4BFF02E9 */ bl strcpy
/* 0000FEA4 7F23CB78 */ mr r3, r25
/* 0000FEA8 4800036D */ bl lbl_00010214
lbl_0000FEAC:
/* 0000FEAC 3C600000 */ lis r3, lbl_000101BC@ha
/* 0000FEB0 3B7E48F0 */ addi r27, r30, 0x48f0
/* 0000FEB4 3BA30000 */ addi r29, r3, lbl_000101BC@l
/* 0000FEB8 3B200000 */ li r25, 0
/* 0000FEBC 3B400050 */ li r26, 0x50
/* 0000FEC0 3F804330 */ lis r28, 0x4330
lbl_0000FEC4:
/* 0000FEC4 4BFF02C5 */ bl create_sprite
/* 0000FEC8 7C681B79 */ or. r8, r3, r3
/* 0000FECC 41820088 */ beq lbl_0000FF54
/* 0000FED0 38000001 */ li r0, 1
/* 0000FED4 4CC63182 */ crclr 6
/* 0000FED8 98080000 */ stb r0, 0(r8)
/* 0000FEDC 6F408000 */ xoris r0, r26, 0x8000
/* 0000FEE0 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000FEE4 9001000C */ stw r0, 0xc(r1)
/* 0000FEE8 38E00004 */ li r7, 4
/* 0000FEEC 809B0000 */ lwz r4, 0(r27)
/* 0000FEF0 38C00000 */ li r6, 0
/* 0000FEF4 93810008 */ stw r28, 8(r1)
/* 0000FEF8 3800000F */ li r0, 0xf
/* 0000FEFC B088003C */ sth r4, 0x3c(r8)
/* 0000FF00 7F25CB78 */ mr r5, r25
/* 0000FF04 C8010008 */ lfd f0, 8(r1)
/* 0000FF08 389E490C */ addi r4, r30, 0x490c
/* 0000FF0C C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000FF10 3868008C */ addi r3, r8, 0x8c
/* 0000FF14 EC000828 */ fsubs f0, f0, f1
/* 0000FF18 D0080004 */ stfs f0, 4(r8)
/* 0000FF1C C01F0074 */ lfs f0, 0x74(r31)
/* 0000FF20 D0080008 */ stfs f0, 8(r8)
/* 0000FF24 C01F0390 */ lfs f0, 0x390(r31)
/* 0000FF28 D008004C */ stfs f0, 0x4c(r8)
/* 0000FF2C 98E80003 */ stb r7, 3(r8)
/* 0000FF30 80E80074 */ lwz r7, 0x74(r8)
/* 0000FF34 64E70004 */ oris r7, r7, 4
/* 0000FF38 90E80074 */ stw r7, 0x74(r8)
/* 0000FF3C C01F0008 */ lfs f0, 8(r31)
/* 0000FF40 D008006C */ stfs f0, 0x6c(r8)
/* 0000FF44 90C80048 */ stw r6, 0x48(r8)
/* 0000FF48 B0080010 */ sth r0, 0x10(r8)
/* 0000FF4C 93A80034 */ stw r29, 0x34(r8)
/* 0000FF50 4BFF0239 */ bl sprintf
lbl_0000FF54:
/* 0000FF54 3B390001 */ addi r25, r25, 1
/* 0000FF58 2C190004 */ cmpwi r25, 4
/* 0000FF5C 3B7B0004 */ addi r27, r27, 4
/* 0000FF60 3B5A00A0 */ addi r26, r26, 0xa0
/* 0000FF64 4180FF60 */ blt lbl_0000FEC4
/* 0000FF68 BB210014 */ lmw r25, 0x14(r1)
/* 0000FF6C 80010034 */ lwz r0, 0x34(r1)
/* 0000FF70 38210030 */ addi r1, r1, 0x30
/* 0000FF74 7C0803A6 */ mtlr r0
/* 0000FF78 4E800020 */ blr 
lbl_0000FF7C:
/* 0000FF7C 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000FF80 3CC00000 */ lis r6, lbl_00011CB0@ha
/* 0000FF84 38C60000 */ addi r6, r6, lbl_00011CB0@l
/* 0000FF88 A8A40010 */ lha r5, 0x10(r4)
/* 0000FF8C 2C050000 */ cmpwi r5, 0
/* 0000FF90 4081000C */ ble lbl_0000FF9C
/* 0000FF94 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000FF98 B0040010 */ sth r0, 0x10(r4)
lbl_0000FF9C:
/* 0000FF9C 80040048 */ lwz r0, 0x48(r4)
/* 0000FFA0 2C000001 */ cmpwi r0, 1
/* 0000FFA4 418201BC */ beq lbl_00010160
/* 0000FFA8 40800010 */ bge lbl_0000FFB8
/* 0000FFAC 2C000000 */ cmpwi r0, 0
/* 0000FFB0 40800014 */ bge lbl_0000FFC4
/* 0000FFB4 48000200 */ b lbl_000101B4
lbl_0000FFB8:
/* 0000FFB8 2C000003 */ cmpwi r0, 3
/* 0000FFBC 408001F8 */ bge lbl_000101B4
/* 0000FFC0 480001B0 */ b lbl_00010170
lbl_0000FFC4:
/* 0000FFC4 A8040010 */ lha r0, 0x10(r4)
/* 0000FFC8 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000FFCC C8450000 */ lfd f2, lbl_00011D00@l(r5)
/* 0000FFD0 3C600000 */ lis r3, lbl_100009D8@ha
/* 0000FFD4 6C008000 */ xoris r0, r0, 0x8000
/* 0000FFD8 90010014 */ stw r0, 0x14(r1)
/* 0000FFDC 3C004330 */ lis r0, 0x4330
/* 0000FFE0 C00600A8 */ lfs f0, 0xa8(r6)
/* 0000FFE4 90010010 */ stw r0, 0x10(r1)
/* 0000FFE8 C066000C */ lfs f3, 0xc(r6)
/* 0000FFEC C8210010 */ lfd f1, 0x10(r1)
/* 0000FFF0 EC211028 */ fsubs f1, f1, f2
/* 0000FFF4 EC010024 */ fdivs f0, f1, f0
/* 0000FFF8 EC030028 */ fsubs f0, f3, f0
/* 0000FFFC D004006C */ stfs f0, 0x6c(r4)
/* 00010000 C4230000 */ lfsu f1, lbl_100009D8@l(r3)
/* 00010004 C8460418 */ lfd f2, 0x418(r6)
/* 00010008 C0030004 */ lfs f0, 4(r3)
/* 0001000C C8660030 */ lfd f3, 0x30(r6)
/* 00010010 EC010028 */ fsubs f0, f1, f0
/* 00010014 C8260098 */ lfd f1, 0x98(r6)
/* 00010018 FC000210 */ fabs f0, f0
/* 0001001C FC020032 */ fmul f0, f2, f0
/* 00010020 FC030028 */ fsub f0, f3, f0
/* 00010024 FC000840 */ fcmpo cr0, f0, f1
/* 00010028 40800008 */ bge lbl_00010030
/* 0001002C 48000018 */ b lbl_00010044
lbl_00010030:
/* 00010030 FC001840 */ fcmpo cr0, f0, f3
/* 00010034 40810008 */ ble lbl_0001003C
/* 00010038 48000008 */ b lbl_00010040
lbl_0001003C:
/* 0001003C FC600090 */ fmr f3, f0
lbl_00010040:
/* 00010040 FC201890 */ fmr f1, f3
lbl_00010044:
/* 00010044 FC000818 */ frsp f0, f1
/* 00010048 38830010 */ addi r4, r3, 0x10
/* 0001004C D0030008 */ stfs f0, 8(r3)
/* 00010050 C0030000 */ lfs f0, 0(r3)
/* 00010054 D0030004 */ stfs f0, 4(r3)
/* 00010058 C0230010 */ lfs f1, 0x10(r3)
/* 0001005C C0030014 */ lfs f0, 0x14(r3)
/* 00010060 C8460418 */ lfd f2, 0x418(r6)
/* 00010064 EC010028 */ fsubs f0, f1, f0
/* 00010068 C8660030 */ lfd f3, 0x30(r6)
/* 0001006C C8260098 */ lfd f1, 0x98(r6)
/* 00010070 FC000210 */ fabs f0, f0
/* 00010074 FC020032 */ fmul f0, f2, f0
/* 00010078 FC030028 */ fsub f0, f3, f0
/* 0001007C FC000840 */ fcmpo cr0, f0, f1
/* 00010080 40800008 */ bge lbl_00010088
/* 00010084 48000018 */ b lbl_0001009C
lbl_00010088:
/* 00010088 FC001840 */ fcmpo cr0, f0, f3
/* 0001008C 40810008 */ ble lbl_00010094
/* 00010090 48000008 */ b lbl_00010098
lbl_00010094:
/* 00010094 FC600090 */ fmr f3, f0
lbl_00010098:
/* 00010098 FC201890 */ fmr f1, f3
lbl_0001009C:
/* 0001009C FC000818 */ frsp f0, f1
/* 000100A0 D0040008 */ stfs f0, 8(r4)
/* 000100A4 C0040000 */ lfs f0, 0(r4)
/* 000100A8 D0040004 */ stfs f0, 4(r4)
/* 000100AC C0240010 */ lfs f1, 0x10(r4)
/* 000100B0 C0040014 */ lfs f0, 0x14(r4)
/* 000100B4 38840010 */ addi r4, r4, 0x10
/* 000100B8 C8460418 */ lfd f2, 0x418(r6)
/* 000100BC EC010028 */ fsubs f0, f1, f0
/* 000100C0 C8660030 */ lfd f3, 0x30(r6)
/* 000100C4 C8260098 */ lfd f1, 0x98(r6)
/* 000100C8 FC000210 */ fabs f0, f0
/* 000100CC FC020032 */ fmul f0, f2, f0
/* 000100D0 FC030028 */ fsub f0, f3, f0
/* 000100D4 FC000840 */ fcmpo cr0, f0, f1
/* 000100D8 40800008 */ bge lbl_000100E0
/* 000100DC 48000018 */ b lbl_000100F4
lbl_000100E0:
/* 000100E0 FC001840 */ fcmpo cr0, f0, f3
/* 000100E4 40810008 */ ble lbl_000100EC
/* 000100E8 48000008 */ b lbl_000100F0
lbl_000100EC:
/* 000100EC FC600090 */ fmr f3, f0
lbl_000100F0:
/* 000100F0 FC201890 */ fmr f1, f3
lbl_000100F4:
/* 000100F4 FC000818 */ frsp f0, f1
/* 000100F8 D0040008 */ stfs f0, 8(r4)
/* 000100FC C0040000 */ lfs f0, 0(r4)
/* 00010100 D0040004 */ stfs f0, 4(r4)
/* 00010104 C0240010 */ lfs f1, 0x10(r4)
/* 00010108 C0040014 */ lfs f0, 0x14(r4)
/* 0001010C 38840010 */ addi r4, r4, 0x10
/* 00010110 C8460418 */ lfd f2, 0x418(r6)
/* 00010114 EC010028 */ fsubs f0, f1, f0
/* 00010118 C8660030 */ lfd f3, 0x30(r6)
/* 0001011C C8260098 */ lfd f1, 0x98(r6)
/* 00010120 FC000210 */ fabs f0, f0
/* 00010124 FC020032 */ fmul f0, f2, f0
/* 00010128 FC030028 */ fsub f0, f3, f0
/* 0001012C FC000840 */ fcmpo cr0, f0, f1
/* 00010130 40800008 */ bge lbl_00010138
/* 00010134 48000018 */ b lbl_0001014C
lbl_00010138:
/* 00010138 FC001840 */ fcmpo cr0, f0, f3
/* 0001013C 40810008 */ ble lbl_00010144
/* 00010140 48000008 */ b lbl_00010148
lbl_00010144:
/* 00010144 FC600090 */ fmr f3, f0
lbl_00010148:
/* 00010148 FC201890 */ fmr f1, f3
lbl_0001014C:
/* 0001014C FC000818 */ frsp f0, f1
/* 00010150 D0040008 */ stfs f0, 8(r4)
/* 00010154 C0040000 */ lfs f0, 0(r4)
/* 00010158 D0040004 */ stfs f0, 4(r4)
/* 0001015C 48000058 */ b lbl_000101B4
lbl_00010160:
/* 00010160 3800000F */ li r0, 0xf
/* 00010164 B0040010 */ sth r0, 0x10(r4)
/* 00010168 38000002 */ li r0, 2
/* 0001016C 90040048 */ stw r0, 0x48(r4)
lbl_00010170:
/* 00010170 A8040010 */ lha r0, 0x10(r4)
/* 00010174 3CA00000 */ lis r5, lbl_00011D00@ha
/* 00010178 C8450000 */ lfd f2, lbl_00011D00@l(r5)
/* 0001017C 6C008000 */ xoris r0, r0, 0x8000
/* 00010180 C00600A8 */ lfs f0, 0xa8(r6)
/* 00010184 90010014 */ stw r0, 0x14(r1)
/* 00010188 3C004330 */ lis r0, 0x4330
/* 0001018C 90010010 */ stw r0, 0x10(r1)
/* 00010190 C8210010 */ lfd f1, 0x10(r1)
/* 00010194 EC211028 */ fsubs f1, f1, f2
/* 00010198 EC010024 */ fdivs f0, f1, f0
/* 0001019C D004006C */ stfs f0, 0x6c(r4)
/* 000101A0 A8040010 */ lha r0, 0x10(r4)
/* 000101A4 2C000000 */ cmpwi r0, 0
/* 000101A8 4082000C */ bne lbl_000101B4
/* 000101AC 38000000 */ li r0, 0
/* 000101B0 98030000 */ stb r0, 0(r3)
lbl_000101B4:
/* 000101B4 38210018 */ addi r1, r1, 0x18
/* 000101B8 4E800020 */ blr 
lbl_000101BC:
/* 000101BC 7C0802A6 */ mflr r0
/* 000101C0 90010004 */ stw r0, 4(r1)
/* 000101C4 9421FFE8 */ stwu r1, -0x18(r1)
/* 000101C8 93E10014 */ stw r31, 0x14(r1)
/* 000101CC 3BE40000 */ addi r31, r4, 0
/* 000101D0 93C10010 */ stw r30, 0x10(r1)
/* 000101D4 3BC30000 */ addi r30, r3, 0
/* 000101D8 3860001D */ li r3, 0x1d
/* 000101DC 4BFEFFAD */ bl find_sprite_with_tag
/* 000101E0 28030000 */ cmplwi r3, 0
/* 000101E4 40820010 */ bne lbl_000101F4
/* 000101E8 38000000 */ li r0, 0
/* 000101EC 981E0000 */ stb r0, 0(r30)
/* 000101F0 4800000C */ b lbl_000101FC
lbl_000101F4:
/* 000101F4 C003006C */ lfs f0, 0x6c(r3)
/* 000101F8 D01F006C */ stfs f0, 0x6c(r31)
lbl_000101FC:
/* 000101FC 8001001C */ lwz r0, 0x1c(r1)
/* 00010200 83E10014 */ lwz r31, 0x14(r1)
/* 00010204 83C10010 */ lwz r30, 0x10(r1)
/* 00010208 7C0803A6 */ mtlr r0
/* 0001020C 38210018 */ addi r1, r1, 0x18
/* 00010210 4E800020 */ blr 
lbl_00010214:
/* 00010214 3C800000 */ lis r4, modeCtrl@ha
/* 00010218 38840000 */ addi r4, r4, modeCtrl@l
/* 0001021C 80040028 */ lwz r0, 0x28(r4)
/* 00010220 38A00000 */ li r5, 0
/* 00010224 38C50000 */ addi r6, r5, 0
/* 00010228 2C000006 */ cmpwi r0, 6
/* 0001022C 4082001C */ bne lbl_00010248
/* 00010230 3C800000 */ lis r4, lbl_802F1BF4@ha
/* 00010234 38840000 */ addi r4, r4, lbl_802F1BF4@l
/* 00010238 80040004 */ lwz r0, 4(r4)
/* 0001023C 2C000000 */ cmpwi r0, 0
/* 00010240 40820008 */ bne lbl_00010248
/* 00010244 38C00001 */ li r6, 1
lbl_00010248:
/* 00010248 2C060000 */ cmpwi r6, 0
/* 0001024C 4182001C */ beq lbl_00010268
/* 00010250 3C800000 */ lis r4, modeCtrl@ha
/* 00010254 38840000 */ addi r4, r4, modeCtrl@l
/* 00010258 80040024 */ lwz r0, 0x24(r4)
/* 0001025C 2C000001 */ cmpwi r0, 1
/* 00010260 40820008 */ bne lbl_00010268
/* 00010264 38A00001 */ li r5, 1
lbl_00010268:
/* 00010268 2C050000 */ cmpwi r5, 0
/* 0001026C 4182000C */ beq lbl_00010278
/* 00010270 39200002 */ li r9, 2
/* 00010274 48000010 */ b lbl_00010284
lbl_00010278:
/* 00010278 3C800000 */ lis r4, modeCtrl@ha
/* 0001027C 38840000 */ addi r4, r4, modeCtrl@l
/* 00010280 81240024 */ lwz r9, 0x24(r4)
lbl_00010284:
/* 00010284 3CA00000 */ lis r5, lbl_100009D8@ha
/* 00010288 39050000 */ addi r8, r5, lbl_100009D8@l
/* 0001028C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00010290 3CE00000 */ lis r7, lbl_00017048@ha
/* 00010294 39640000 */ addi r11, r4, playerCharacterSelection@l
/* 00010298 2C090000 */ cmpwi r9, 0
/* 0001029C 3809FFFF */ addi r0, r9, -1  ;# fixed addi
/* 000102A0 3CC00000 */ lis r6, lbl_00017420@ha
/* 000102A4 39880000 */ addi r12, r8, 0
/* 000102A8 3CA00000 */ lis r5, lbl_00011CB8@ha
/* 000102AC 39060000 */ addi r8, r6, lbl_00017420@l
/* 000102B0 38C50000 */ addi r6, r5, lbl_00011CB8@l
/* 000102B4 38890000 */ addi r4, r9, 0
/* 000102B8 39470000 */ addi r10, r7, lbl_00017048@l
/* 000102BC 54052036 */ slwi r5, r0, 4
/* 000102C0 4C810020 */ blelr 
/* 000102C4 5480F0BF */ rlwinm. r0, r4, 0x1e, 2, 0x1f
/* 000102C8 7C0903A6 */ mtctr r0
/* 000102CC 41820118 */ beq lbl_000103E4
lbl_000102D0:
/* 000102D0 812B0000 */ lwz r9, 0(r11)
/* 000102D4 7CE82A14 */ add r7, r8, r5
/* 000102D8 C0230040 */ lfs f1, 0x40(r3)
/* 000102DC 38A50004 */ addi r5, r5, 4
/* 000102E0 38090008 */ addi r0, r9, 8
/* 000102E4 1C000018 */ mulli r0, r0, 0x18
/* 000102E8 C0070000 */ lfs f0, 0(r7)
/* 000102EC 7D2A0214 */ add r9, r10, r0
/* 000102F0 C0490000 */ lfs f2, 0(r9)
/* 000102F4 7CE82A14 */ add r7, r8, r5
/* 000102F8 38A50004 */ addi r5, r5, 4
/* 000102FC EC220072 */ fmuls f1, f2, f1
/* 00010300 EC21002A */ fadds f1, f1, f0
/* 00010304 D02C0000 */ stfs f1, 0(r12)
/* 00010308 C00C0000 */ lfs f0, 0(r12)
/* 0001030C D00C0004 */ stfs f0, 4(r12)
/* 00010310 C0060000 */ lfs f0, 0(r6)
/* 00010314 D00C0008 */ stfs f0, 8(r12)
/* 00010318 852B0004 */ lwzu r9, 4(r11)
/* 0001031C C0070000 */ lfs f0, 0(r7)
/* 00010320 7CE82A14 */ add r7, r8, r5
/* 00010324 38090008 */ addi r0, r9, 8
/* 00010328 C0230040 */ lfs f1, 0x40(r3)
/* 0001032C 1C000018 */ mulli r0, r0, 0x18
/* 00010330 7D2A0214 */ add r9, r10, r0
/* 00010334 C0490000 */ lfs f2, 0(r9)
/* 00010338 38A50004 */ addi r5, r5, 4
/* 0001033C EC220072 */ fmuls f1, f2, f1
/* 00010340 EC21002A */ fadds f1, f1, f0
/* 00010344 D02C0010 */ stfs f1, 0x10(r12)
/* 00010348 C00C0010 */ lfs f0, 0x10(r12)
/* 0001034C D00C0014 */ stfs f0, 0x14(r12)
/* 00010350 C0060000 */ lfs f0, 0(r6)
/* 00010354 D00C0018 */ stfs f0, 0x18(r12)
/* 00010358 852B0004 */ lwzu r9, 4(r11)
/* 0001035C C0070000 */ lfs f0, 0(r7)
/* 00010360 7CE82A14 */ add r7, r8, r5
/* 00010364 38090008 */ addi r0, r9, 8
/* 00010368 C0230040 */ lfs f1, 0x40(r3)
/* 0001036C 1C000018 */ mulli r0, r0, 0x18
/* 00010370 7D2A0214 */ add r9, r10, r0
/* 00010374 C0490000 */ lfs f2, 0(r9)
/* 00010378 38A50004 */ addi r5, r5, 4
/* 0001037C EC220072 */ fmuls f1, f2, f1
/* 00010380 EC21002A */ fadds f1, f1, f0
/* 00010384 D02C0020 */ stfs f1, 0x20(r12)
/* 00010388 C00C0020 */ lfs f0, 0x20(r12)
/* 0001038C D00C0024 */ stfs f0, 0x24(r12)
/* 00010390 C0060000 */ lfs f0, 0(r6)
/* 00010394 D00C0028 */ stfs f0, 0x28(r12)
/* 00010398 852B0004 */ lwzu r9, 4(r11)
/* 0001039C C0230040 */ lfs f1, 0x40(r3)
/* 000103A0 38090008 */ addi r0, r9, 8
/* 000103A4 C0070000 */ lfs f0, 0(r7)
/* 000103A8 1C000018 */ mulli r0, r0, 0x18
/* 000103AC 7D2A0214 */ add r9, r10, r0
/* 000103B0 C0490000 */ lfs f2, 0(r9)
/* 000103B4 396B0004 */ addi r11, r11, 4
/* 000103B8 EC220072 */ fmuls f1, f2, f1
/* 000103BC EC21002A */ fadds f1, f1, f0
/* 000103C0 D02C0030 */ stfs f1, 0x30(r12)
/* 000103C4 C00C0030 */ lfs f0, 0x30(r12)
/* 000103C8 D00C0034 */ stfs f0, 0x34(r12)
/* 000103CC C0060000 */ lfs f0, 0(r6)
/* 000103D0 D00C0038 */ stfs f0, 0x38(r12)
/* 000103D4 398C0040 */ addi r12, r12, 0x40
/* 000103D8 4200FEF8 */ bdnz lbl_000102D0
/* 000103DC 70840003 */ andi. r4, r4, 3
/* 000103E0 4D820020 */ beqlr 
lbl_000103E4:
/* 000103E4 7C8903A6 */ mtctr r4
lbl_000103E8:
/* 000103E8 812B0000 */ lwz r9, 0(r11)
/* 000103EC 7CE82A14 */ add r7, r8, r5
/* 000103F0 C0230040 */ lfs f1, 0x40(r3)
/* 000103F4 396B0004 */ addi r11, r11, 4
/* 000103F8 38090008 */ addi r0, r9, 8
/* 000103FC 1C000018 */ mulli r0, r0, 0x18
/* 00010400 C0070000 */ lfs f0, 0(r7)
/* 00010404 7D2A0214 */ add r9, r10, r0
/* 00010408 C0490000 */ lfs f2, 0(r9)
/* 0001040C 38A50004 */ addi r5, r5, 4
/* 00010410 EC220072 */ fmuls f1, f2, f1
/* 00010414 EC21002A */ fadds f1, f1, f0
/* 00010418 D02C0000 */ stfs f1, 0(r12)
/* 0001041C C00C0000 */ lfs f0, 0(r12)
/* 00010420 D00C0004 */ stfs f0, 4(r12)
/* 00010424 C0060000 */ lfs f0, 0(r6)
/* 00010428 D00C0008 */ stfs f0, 8(r12)
/* 0001042C 398C0010 */ addi r12, r12, 0x10
/* 00010430 4200FFB8 */ bdnz lbl_000103E8
/* 00010434 4E800020 */ blr 
lbl_00010438:
/* 00010438 7C0802A6 */ mflr r0
/* 0001043C 3C800000 */ lis r4, modeCtrl@ha
/* 00010440 90010004 */ stw r0, 4(r1)
/* 00010444 38840000 */ addi r4, r4, modeCtrl@l
/* 00010448 38040028 */ addi r0, r4, 0x28
/* 0001044C 9421FEC0 */ stwu r1, -0x140(r1)
/* 00010450 3CA00000 */ lis r5, lbl_00012730@ha
/* 00010454 DBE10138 */ stfd f31, 0x138(r1)
/* 00010458 BDC100F0 */ stmw r14, 0xf0(r1)
/* 0001045C 3A200000 */ li r17, 0
/* 00010460 3BE30000 */ addi r31, r3, 0
/* 00010464 900100B4 */ stw r0, 0xb4(r1)
/* 00010468 38D10000 */ addi r6, r17, 0
/* 0001046C 3AE50000 */ addi r23, r5, lbl_00012730@l
/* 00010470 808100B4 */ lwz r4, 0xb4(r1)
/* 00010474 80040000 */ lwz r0, 0(r4)
/* 00010478 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0001047C 3B440000 */ addi r26, r4, lbl_00011CB0@l
/* 00010480 2C000006 */ cmpwi r0, 6
/* 00010484 4082001C */ bne lbl_000104A0
/* 00010488 3C600000 */ lis r3, lbl_802F1BF4@ha
/* 0001048C 38630000 */ addi r3, r3, lbl_802F1BF4@l
/* 00010490 80030004 */ lwz r0, 4(r3)
/* 00010494 2C000000 */ cmpwi r0, 0
/* 00010498 40820008 */ bne lbl_000104A0
/* 0001049C 38C00001 */ li r6, 1
lbl_000104A0:
/* 000104A0 2C060000 */ cmpwi r6, 0
/* 000104A4 4182001C */ beq lbl_000104C0
/* 000104A8 3C600000 */ lis r3, modeCtrl@ha
/* 000104AC 38630000 */ addi r3, r3, modeCtrl@l
/* 000104B0 80030024 */ lwz r0, 0x24(r3)
/* 000104B4 2C000001 */ cmpwi r0, 1
/* 000104B8 40820008 */ bne lbl_000104C0
/* 000104BC 3A200001 */ li r17, 1
lbl_000104C0:
/* 000104C0 2C110000 */ cmpwi r17, 0
/* 000104C4 4182000C */ beq lbl_000104D0
/* 000104C8 3AC00002 */ li r22, 2
/* 000104CC 48000010 */ b lbl_000104DC
lbl_000104D0:
/* 000104D0 3C600000 */ lis r3, modeCtrl@ha
/* 000104D4 38630000 */ addi r3, r3, modeCtrl@l
/* 000104D8 82C30024 */ lwz r22, 0x24(r3)
lbl_000104DC:
/* 000104DC 38A00000 */ li r5, 0
/* 000104E0 98BF0070 */ stb r5, 0x70(r31)
/* 000104E4 3C600000 */ lis r3, bitmapGroups@ha
/* 000104E8 38800412 */ li r4, 0x412
/* 000104EC 98BF0071 */ stb r5, 0x71(r31)
/* 000104F0 3AA30000 */ addi r21, r3, bitmapGroups@l
/* 000104F4 3800FFFF */ li r0, -1
/* 000104F8 98BF0072 */ stb r5, 0x72(r31)
/* 000104FC 3B774978 */ addi r27, r23, 0x4978
/* 00010500 3B000004 */ li r24, 4
/* 00010504 90810060 */ stw r4, 0x60(r1)
/* 00010508 3F804330 */ lis r28, 0x4330
/* 0001050C A87F0068 */ lha r3, 0x68(r31)
/* 00010510 90610088 */ stw r3, 0x88(r1)
/* 00010514 C01F006C */ lfs f0, 0x6c(r31)
/* 00010518 D001008C */ stfs f0, 0x8c(r1)
/* 0001051C 90010090 */ stw r0, 0x90(r1)
/* 00010520 801F0074 */ lwz r0, 0x74(r31)
/* 00010524 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 00010528 64000020 */ oris r0, r0, 0x20
/* 0001052C 6000000A */ ori r0, r0, 0xa
/* 00010530 90010094 */ stw r0, 0x94(r1)
/* 00010534 C03A0010 */ lfs f1, 0x10(r26)
/* 00010538 C01F006C */ lfs f0, 0x6c(r31)
/* 0001053C 88BF000C */ lbz r5, 0xc(r31)
/* 00010540 EC010032 */ fmuls f0, f1, f0
/* 00010544 889F000D */ lbz r4, 0xd(r31)
/* 00010548 881F000E */ lbz r0, 0xe(r31)
/* 0001054C FC00001E */ fctiwz f0, f0
/* 00010550 D80100E8 */ stfd f0, 0xe8(r1)
/* 00010554 806100EC */ lwz r3, 0xec(r1)
/* 00010558 5463C00E */ slwi r3, r3, 0x18
/* 0001055C 50A3821E */ rlwimi r3, r5, 0x10, 8, 0xf
/* 00010560 5083442E */ rlwimi r3, r4, 8, 0x10, 0x17
/* 00010564 7C001B78 */ or r0, r0, r3
/* 00010568 90010098 */ stw r0, 0x98(r1)
/* 0001056C 887F0071 */ lbz r3, 0x71(r31)
/* 00010570 889F0070 */ lbz r4, 0x70(r31)
/* 00010574 5463402E */ slwi r3, r3, 8
/* 00010578 881F0072 */ lbz r0, 0x72(r31)
/* 0001057C 5083821E */ rlwimi r3, r4, 0x10, 8, 0xf
/* 00010580 7C001B78 */ or r0, r0, r3
/* 00010584 9001009C */ stw r0, 0x9c(r1)
lbl_00010588:
/* 00010588 80010060 */ lwz r0, 0x60(r1)
/* 0001058C 6F098000 */ xoris r9, r24, 0x8000
/* 00010590 912100CC */ stw r9, 0xcc(r1)
/* 00010594 3C600000 */ lis r3, lbl_00011EC8@ha
/* 00010598 5404C63E */ rlwinm r4, r0, 0x18, 0x18, 0x1f
/* 0001059C 1C840018 */ mulli r4, r4, 0x18
/* 000105A0 C03B0000 */ lfs f1, 0(r27)
/* 000105A4 C01F0040 */ lfs f0, 0x40(r31)
/* 000105A8 938100C8 */ stw r28, 0xc8(r1)
/* 000105AC 7C952214 */ add r4, r21, r4
/* 000105B0 80840010 */ lwz r4, 0x10(r4)
/* 000105B4 EC010032 */ fmuls f0, f1, f0
/* 000105B8 54002536 */ rlwinm r0, r0, 4, 0x14, 0x1b
/* 000105BC 80840004 */ lwz r4, 4(r4)
/* 000105C0 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 000105C4 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 000105C8 D0010064 */ stfs f0, 0x64(r1)
/* 000105CC 7C840214 */ add r4, r4, r0
/* 000105D0 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 000105D4 C03B0004 */ lfs f1, 4(r27)
/* 000105D8 3D000000 */ lis r8, lbl_00011D00@ha
/* 000105DC C01F0044 */ lfs f0, 0x44(r31)
/* 000105E0 7F79DB78 */ mr r25, r27
/* 000105E4 EC010032 */ fmuls f0, f1, f0
/* 000105E8 D0010068 */ stfs f0, 0x68(r1)
/* 000105EC C80100C8 */ lfd f0, 0xc8(r1)
/* 000105F0 A0040008 */ lhz r0, 8(r4)
/* 000105F4 C8430000 */ lfd f2, lbl_00011EC8@l(r3)
/* 000105F8 38610060 */ addi r3, r1, 0x60
/* 000105FC 900100EC */ stw r0, 0xec(r1)
/* 00010600 C07B0008 */ lfs f3, 8(r27)
/* 00010604 938100E8 */ stw r28, 0xe8(r1)
/* 00010608 C82100E8 */ lfd f1, 0xe8(r1)
/* 0001060C EC211028 */ fsubs f1, f1, f2
/* 00010610 EC230824 */ fdivs f1, f3, f1
/* 00010614 D0210078 */ stfs f1, 0x78(r1)
/* 00010618 A004000A */ lhz r0, 0xa(r4)
/* 0001061C C8470000 */ lfd f2, lbl_00011EC8@l(r7)
/* 00010620 900100E4 */ stw r0, 0xe4(r1)
/* 00010624 C07B000C */ lfs f3, 0xc(r27)
/* 00010628 938100E0 */ stw r28, 0xe0(r1)
/* 0001062C C82100E0 */ lfd f1, 0xe0(r1)
/* 00010630 EC211028 */ fsubs f1, f1, f2
/* 00010634 EC230824 */ fdivs f1, f3, f1
/* 00010638 D021007C */ stfs f1, 0x7c(r1)
/* 0001063C A0040008 */ lhz r0, 8(r4)
/* 00010640 C8460000 */ lfd f2, lbl_00011EC8@l(r6)
/* 00010644 900100DC */ stw r0, 0xdc(r1)
/* 00010648 C07B0010 */ lfs f3, 0x10(r27)
/* 0001064C 938100D8 */ stw r28, 0xd8(r1)
/* 00010650 C0810078 */ lfs f4, 0x78(r1)
/* 00010654 C82100D8 */ lfd f1, 0xd8(r1)
/* 00010658 EC211028 */ fsubs f1, f1, f2
/* 0001065C EC230824 */ fdivs f1, f3, f1
/* 00010660 EC24082A */ fadds f1, f4, f1
/* 00010664 D0210080 */ stfs f1, 0x80(r1)
/* 00010668 A004000A */ lhz r0, 0xa(r4)
/* 0001066C C8450000 */ lfd f2, lbl_00011EC8@l(r5)
/* 00010670 900100D4 */ stw r0, 0xd4(r1)
/* 00010674 C07B0014 */ lfs f3, 0x14(r27)
/* 00010678 938100D0 */ stw r28, 0xd0(r1)
/* 0001067C C081007C */ lfs f4, 0x7c(r1)
/* 00010680 C82100D0 */ lfd f1, 0xd0(r1)
/* 00010684 EC211028 */ fsubs f1, f1, f2
/* 00010688 EC230824 */ fdivs f1, f3, f1
/* 0001068C EC24082A */ fadds f1, f4, f1
/* 00010690 D0210084 */ stfs f1, 0x84(r1)
/* 00010694 C0410080 */ lfs f2, 0x80(r1)
/* 00010698 C0210078 */ lfs f1, 0x78(r1)
/* 0001069C C07F0040 */ lfs f3, 0x40(r31)
/* 000106A0 EC220828 */ fsubs f1, f2, f1
/* 000106A4 EC230072 */ fmuls f1, f3, f1
/* 000106A8 D0210070 */ stfs f1, 0x70(r1)
/* 000106AC C0410084 */ lfs f2, 0x84(r1)
/* 000106B0 C021007C */ lfs f1, 0x7c(r1)
/* 000106B4 C07F0044 */ lfs f3, 0x44(r31)
/* 000106B8 EC220828 */ fsubs f1, f2, f1
/* 000106BC EC230072 */ fmuls f1, f3, f1
/* 000106C0 D0210074 */ stfs f1, 0x74(r1)
/* 000106C4 C8280000 */ lfd f1, lbl_00011D00@l(r8)
/* 000106C8 C85A0190 */ lfd f2, 0x190(r26)
/* 000106CC FC000828 */ fsub f0, f0, f1
/* 000106D0 C03F004C */ lfs f1, 0x4c(r31)
/* 000106D4 FC020032 */ fmul f0, f2, f0
/* 000106D8 FC010028 */ fsub f0, f1, f0
/* 000106DC FC000018 */ frsp f0, f0
/* 000106E0 D001006C */ stfs f0, 0x6c(r1)
/* 000106E4 4BFEFAA5 */ bl draw_naomi_sprite
/* 000106E8 3B180001 */ addi r24, r24, 1
/* 000106EC 2C180007 */ cmpwi r24, 7
/* 000106F0 3B7B0018 */ addi r27, r27, 0x18
/* 000106F4 4081FE94 */ ble lbl_00010588
/* 000106F8 3816FFFF */ addi r0, r22, -1  ;# fixed addi
/* 000106FC C85A0420 */ lfd f2, 0x420(r26)
/* 00010700 6C038000 */ xoris r3, r0, 0x8000
/* 00010704 906100CC */ stw r3, 0xcc(r1)
/* 00010708 3FA04330 */ lis r29, 0x4330
/* 0001070C 3C800000 */ lis r4, lbl_00011D00@ha
/* 00010710 93A100C8 */ stw r29, 0xc8(r1)
/* 00010714 3C600000 */ lis r3, bitmapGroups@ha
/* 00010718 C8240000 */ lfd f1, lbl_00011D00@l(r4)
/* 0001071C 3BD749D8 */ addi r30, r23, 0x49d8
/* 00010720 C80100C8 */ lfd f0, 0xc8(r1)
/* 00010724 5412103A */ slwi r18, r0, 2
/* 00010728 FC000828 */ fsub f0, f0, f1
/* 0001072C 3B030000 */ addi r24, r3, bitmapGroups@l
/* 00010730 3AA00008 */ li r21, 8
/* 00010734 FC020032 */ fmul f0, f2, f0
/* 00010738 FFE00018 */ frsp f31, f0
lbl_0001073C:
/* 0001073C 565B103A */ slwi r27, r18, 2
/* 00010740 3B800000 */ li r28, 0
/* 00010744 48000154 */ b lbl_00010898
lbl_00010748:
/* 00010748 80010060 */ lwz r0, 0x60(r1)
/* 0001074C 3D000000 */ lis r8, lbl_00011EC8@ha
/* 00010750 C03E0000 */ lfs f1, 0(r30)
/* 00010754 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 00010758 5403C63E */ rlwinm r3, r0, 0x18, 0x18, 0x1f
/* 0001075C 1C630018 */ mulli r3, r3, 0x18
/* 00010760 C01F0040 */ lfs f0, 0x40(r31)
/* 00010764 EC010032 */ fmuls f0, f1, f0
/* 00010768 7C781A14 */ add r3, r24, r3
/* 0001076C 80630010 */ lwz r3, 0x10(r3)
/* 00010770 54002536 */ rlwinm r0, r0, 4, 0x14, 0x1b
/* 00010774 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 00010778 80630004 */ lwz r3, 4(r3)
/* 0001077C 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 00010780 7D37DA14 */ add r9, r23, r27
/* 00010784 D0010064 */ stfs f0, 0x64(r1)
/* 00010788 7C830214 */ add r4, r3, r0
/* 0001078C 3B3E0000 */ addi r25, r30, 0
/* 00010790 C03E0004 */ lfs f1, 4(r30)
/* 00010794 38610060 */ addi r3, r1, 0x60
/* 00010798 C01F0044 */ lfs f0, 0x44(r31)
/* 0001079C EC010032 */ fmuls f0, f1, f0
/* 000107A0 D0010068 */ stfs f0, 0x68(r1)
/* 000107A4 A0040008 */ lhz r0, 8(r4)
/* 000107A8 C8280000 */ lfd f1, lbl_00011EC8@l(r8)
/* 000107AC 900100CC */ stw r0, 0xcc(r1)
/* 000107B0 C05E0008 */ lfs f2, 8(r30)
/* 000107B4 93A100C8 */ stw r29, 0xc8(r1)
/* 000107B8 C80100C8 */ lfd f0, 0xc8(r1)
/* 000107BC EC000828 */ fsubs f0, f0, f1
/* 000107C0 EC020024 */ fdivs f0, f2, f0
/* 000107C4 D0010078 */ stfs f0, 0x78(r1)
/* 000107C8 A004000A */ lhz r0, 0xa(r4)
/* 000107CC C8270000 */ lfd f1, lbl_00011EC8@l(r7)
/* 000107D0 900100D4 */ stw r0, 0xd4(r1)
/* 000107D4 C05E000C */ lfs f2, 0xc(r30)
/* 000107D8 93A100D0 */ stw r29, 0xd0(r1)
/* 000107DC C80100D0 */ lfd f0, 0xd0(r1)
/* 000107E0 EC000828 */ fsubs f0, f0, f1
/* 000107E4 EC020024 */ fdivs f0, f2, f0
/* 000107E8 D001007C */ stfs f0, 0x7c(r1)
/* 000107EC A0040008 */ lhz r0, 8(r4)
/* 000107F0 C8260000 */ lfd f1, lbl_00011EC8@l(r6)
/* 000107F4 900100DC */ stw r0, 0xdc(r1)
/* 000107F8 C05E0010 */ lfs f2, 0x10(r30)
/* 000107FC 93A100D8 */ stw r29, 0xd8(r1)
/* 00010800 C0610078 */ lfs f3, 0x78(r1)
/* 00010804 C80100D8 */ lfd f0, 0xd8(r1)
/* 00010808 EC000828 */ fsubs f0, f0, f1
/* 0001080C EC020024 */ fdivs f0, f2, f0
/* 00010810 EC03002A */ fadds f0, f3, f0
/* 00010814 D0010080 */ stfs f0, 0x80(r1)
/* 00010818 A004000A */ lhz r0, 0xa(r4)
/* 0001081C C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 00010820 900100E4 */ stw r0, 0xe4(r1)
/* 00010824 C05E0014 */ lfs f2, 0x14(r30)
/* 00010828 93A100E0 */ stw r29, 0xe0(r1)
/* 0001082C C061007C */ lfs f3, 0x7c(r1)
/* 00010830 C80100E0 */ lfd f0, 0xe0(r1)
/* 00010834 EC000828 */ fsubs f0, f0, f1
/* 00010838 EC020024 */ fdivs f0, f2, f0
/* 0001083C EC03002A */ fadds f0, f3, f0
/* 00010840 D0010084 */ stfs f0, 0x84(r1)
/* 00010844 C0210080 */ lfs f1, 0x80(r1)
/* 00010848 C0010078 */ lfs f0, 0x78(r1)
/* 0001084C C05F0040 */ lfs f2, 0x40(r31)
/* 00010850 EC010028 */ fsubs f0, f1, f0
/* 00010854 EC020032 */ fmuls f0, f2, f0
/* 00010858 D0010070 */ stfs f0, 0x70(r1)
/* 0001085C C0210084 */ lfs f1, 0x84(r1)
/* 00010860 C001007C */ lfs f0, 0x7c(r1)
/* 00010864 C05F0044 */ lfs f2, 0x44(r31)
/* 00010868 EC010028 */ fsubs f0, f1, f0
/* 0001086C EC020032 */ fmuls f0, f2, f0
/* 00010870 D0010074 */ stfs f0, 0x74(r1)
/* 00010874 C0210064 */ lfs f1, 0x64(r1)
/* 00010878 C0094CF0 */ lfs f0, 0x4cf0(r9)
/* 0001087C EC01002A */ fadds f0, f1, f0
/* 00010880 D0010064 */ stfs f0, 0x64(r1)
/* 00010884 C01F004C */ lfs f0, 0x4c(r31)
/* 00010888 D001006C */ stfs f0, 0x6c(r1)
/* 0001088C 4BFEF8FD */ bl draw_naomi_sprite
/* 00010890 3B7B0004 */ addi r27, r27, 4
/* 00010894 3B9C0001 */ addi r28, r28, 1
lbl_00010898:
/* 00010898 7C1CB000 */ cmpw r28, r22
/* 0001089C 4180FEAC */ blt lbl_00010748
/* 000108A0 80010060 */ lwz r0, 0x60(r1)
/* 000108A4 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 000108A8 C0390000 */ lfs f1, 0(r25)
/* 000108AC 3C800000 */ lis r4, lbl_00011EC8@ha
/* 000108B0 5403C63E */ rlwinm r3, r0, 0x18, 0x18, 0x1f
/* 000108B4 1C630018 */ mulli r3, r3, 0x18
/* 000108B8 C01F0040 */ lfs f0, 0x40(r31)
/* 000108BC EC010032 */ fmuls f0, f1, f0
/* 000108C0 7C781A14 */ add r3, r24, r3
/* 000108C4 80630010 */ lwz r3, 0x10(r3)
/* 000108C8 54002536 */ rlwinm r0, r0, 4, 0x14, 0x1b
/* 000108CC 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 000108D0 80630004 */ lwz r3, 4(r3)
/* 000108D4 3D000000 */ lis r8, lbl_00011EC8@ha
/* 000108D8 3920040A */ li r9, 0x40a
/* 000108DC D0010064 */ stfs f0, 0x64(r1)
/* 000108E0 7CC30214 */ add r6, r3, r0
/* 000108E4 38610060 */ addi r3, r1, 0x60
/* 000108E8 C0390004 */ lfs f1, 4(r25)
/* 000108EC C01F0044 */ lfs f0, 0x44(r31)
/* 000108F0 EC010032 */ fmuls f0, f1, f0
/* 000108F4 D0010068 */ stfs f0, 0x68(r1)
/* 000108F8 A0060008 */ lhz r0, 8(r6)
/* 000108FC C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 00010900 900100CC */ stw r0, 0xcc(r1)
/* 00010904 C0590008 */ lfs f2, 8(r25)
/* 00010908 93A100C8 */ stw r29, 0xc8(r1)
/* 0001090C C80100C8 */ lfd f0, 0xc8(r1)
/* 00010910 EC000828 */ fsubs f0, f0, f1
/* 00010914 EC020024 */ fdivs f0, f2, f0
/* 00010918 D0010078 */ stfs f0, 0x78(r1)
/* 0001091C A006000A */ lhz r0, 0xa(r6)
/* 00010920 C8240000 */ lfd f1, lbl_00011EC8@l(r4)
/* 00010924 900100D4 */ stw r0, 0xd4(r1)
/* 00010928 C059000C */ lfs f2, 0xc(r25)
/* 0001092C 93A100D0 */ stw r29, 0xd0(r1)
/* 00010930 C80100D0 */ lfd f0, 0xd0(r1)
/* 00010934 EC000828 */ fsubs f0, f0, f1
/* 00010938 EC020024 */ fdivs f0, f2, f0
/* 0001093C D001007C */ stfs f0, 0x7c(r1)
/* 00010940 A0060008 */ lhz r0, 8(r6)
/* 00010944 C8270000 */ lfd f1, lbl_00011EC8@l(r7)
/* 00010948 900100DC */ stw r0, 0xdc(r1)
/* 0001094C C0590010 */ lfs f2, 0x10(r25)
/* 00010950 93A100D8 */ stw r29, 0xd8(r1)
/* 00010954 C0610078 */ lfs f3, 0x78(r1)
/* 00010958 C80100D8 */ lfd f0, 0xd8(r1)
/* 0001095C EC000828 */ fsubs f0, f0, f1
/* 00010960 EC020024 */ fdivs f0, f2, f0
/* 00010964 EC03002A */ fadds f0, f3, f0
/* 00010968 D0010080 */ stfs f0, 0x80(r1)
/* 0001096C A006000A */ lhz r0, 0xa(r6)
/* 00010970 C8280000 */ lfd f1, lbl_00011EC8@l(r8)
/* 00010974 900100E4 */ stw r0, 0xe4(r1)
/* 00010978 C0590014 */ lfs f2, 0x14(r25)
/* 0001097C 93A100E0 */ stw r29, 0xe0(r1)
/* 00010980 C061007C */ lfs f3, 0x7c(r1)
/* 00010984 C80100E0 */ lfd f0, 0xe0(r1)
/* 00010988 EC000828 */ fsubs f0, f0, f1
/* 0001098C EC020024 */ fdivs f0, f2, f0
/* 00010990 EC03002A */ fadds f0, f3, f0
/* 00010994 D0010084 */ stfs f0, 0x84(r1)
/* 00010998 C0210080 */ lfs f1, 0x80(r1)
/* 0001099C C0010078 */ lfs f0, 0x78(r1)
/* 000109A0 C05F0040 */ lfs f2, 0x40(r31)
/* 000109A4 EC010028 */ fsubs f0, f1, f0
/* 000109A8 EC020032 */ fmuls f0, f2, f0
/* 000109AC D0010070 */ stfs f0, 0x70(r1)
/* 000109B0 C0210084 */ lfs f1, 0x84(r1)
/* 000109B4 C001007C */ lfs f0, 0x7c(r1)
/* 000109B8 C05F0044 */ lfs f2, 0x44(r31)
/* 000109BC EC010028 */ fsubs f0, f1, f0
/* 000109C0 EC020032 */ fmuls f0, f2, f0
/* 000109C4 D0010074 */ stfs f0, 0x74(r1)
/* 000109C8 91210060 */ stw r9, 0x60(r1)
/* 000109CC C01A0008 */ lfs f0, 8(r26)
/* 000109D0 D0010078 */ stfs f0, 0x78(r1)
/* 000109D4 C01A0008 */ lfs f0, 8(r26)
/* 000109D8 D001007C */ stfs f0, 0x7c(r1)
/* 000109DC C01A000C */ lfs f0, 0xc(r26)
/* 000109E0 D0010080 */ stfs f0, 0x80(r1)
/* 000109E4 C01A000C */ lfs f0, 0xc(r26)
/* 000109E8 D0010084 */ stfs f0, 0x84(r1)
/* 000109EC D3E10070 */ stfs f31, 0x70(r1)
/* 000109F0 C01A0070 */ lfs f0, 0x70(r26)
/* 000109F4 D0010074 */ stfs f0, 0x74(r1)
/* 000109F8 801F0074 */ lwz r0, 0x74(r31)
/* 000109FC 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 00010A00 6000000A */ ori r0, r0, 0xa
/* 00010A04 90010094 */ stw r0, 0x94(r1)
/* 00010A08 4BFEF781 */ bl draw_naomi_sprite
/* 00010A0C 38000412 */ li r0, 0x412
/* 00010A10 90010060 */ stw r0, 0x60(r1)
/* 00010A14 3AB50001 */ addi r21, r21, 1
/* 00010A18 2C15000B */ cmpwi r21, 0xb
/* 00010A1C 801F0074 */ lwz r0, 0x74(r31)
/* 00010A20 3BDE0018 */ addi r30, r30, 0x18
/* 00010A24 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 00010A28 64000020 */ oris r0, r0, 0x20
/* 00010A2C 6000000A */ ori r0, r0, 0xa
/* 00010A30 90010094 */ stw r0, 0x94(r1)
/* 00010A34 4081FD08 */ ble lbl_0001073C
/* 00010A38 3CC00000 */ lis r6, lbl_100009D8@ha
/* 00010A3C 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00010A40 3A040000 */ addi r16, r4, lbl_801EEDA8@l
/* 00010A44 3CA00000 */ lis r5, playerCharacterSelection@ha
/* 00010A48 38060000 */ addi r0, r6, lbl_100009D8@l
/* 00010A4C 3A650000 */ addi r19, r5, playerCharacterSelection@l
/* 00010A50 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00010A54 3BC30000 */ addi r30, r3, lbl_80206BD0@l
/* 00010A58 3C600000 */ lis r3, bitmapGroups@ha
/* 00010A5C 3C800000 */ lis r4, unpausedFrameCounter@ha
/* 00010A60 7C1C0378 */ mr r28, r0
/* 00010A64 38040000 */ addi r0, r4, unpausedFrameCounter@l
/* 00010A68 3CA00000 */ lis r5, gamePauseStatus@ha
/* 00010A6C 900100BC */ stw r0, 0xbc(r1)
/* 00010A70 38050000 */ addi r0, r5, gamePauseStatus@l
/* 00010A74 900100B8 */ stw r0, 0xb8(r1)
/* 00010A78 3B700000 */ addi r27, r16, 0
/* 00010A7C 39D74A80 */ addi r14, r23, 0x4a80
/* 00010A80 39F74C78 */ addi r15, r23, 0x4c78
/* 00010A84 3AA30000 */ addi r21, r3, bitmapGroups@l
/* 00010A88 5652103A */ slwi r18, r18, 2
/* 00010A8C 3B000000 */ li r24, 0
/* 00010A90 3A80000C */ li r20, 0xc
/* 00010A94 3FA04330 */ lis r29, 0x4330
/* 00010A98 48000878 */ b lbl_00011310
lbl_00010A9C:
/* 00010A9C 80730000 */ lwz r3, 0(r19)
/* 00010AA0 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 00010AA4 80010060 */ lwz r0, 0x60(r1)
/* 00010AA8 3C800000 */ lis r4, lbl_00011EC8@ha
/* 00010AAC 38630008 */ addi r3, r3, 8
/* 00010AB0 1CC30018 */ mulli r6, r3, 0x18
/* 00010AB4 C01F0040 */ lfs f0, 0x40(r31)
/* 00010AB8 5403C63E */ rlwinm r3, r0, 0x18, 0x18, 0x1f
/* 00010ABC 1C630018 */ mulli r3, r3, 0x18
/* 00010AC0 7F373214 */ add r25, r23, r6
/* 00010AC4 7C751A14 */ add r3, r21, r3
/* 00010AC8 C0394918 */ lfs f1, 0x4918(r25)
/* 00010ACC 80C30010 */ lwz r6, 0x10(r3)
/* 00010AD0 54002536 */ rlwinm r0, r0, 4, 0x14, 0x1b
/* 00010AD4 EC010032 */ fmuls f0, f1, f0
/* 00010AD8 3C600000 */ lis r3, lbl_00011EC8@ha
/* 00010ADC 80C60004 */ lwz r6, 4(r6)
/* 00010AE0 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 00010AE4 D0010064 */ stfs f0, 0x64(r1)
/* 00010AE8 7CC60214 */ add r6, r6, r0
/* 00010AEC C039491C */ lfs f1, 0x491c(r25)
/* 00010AF0 7D379214 */ add r9, r23, r18
/* 00010AF4 C01F0044 */ lfs f0, 0x44(r31)
/* 00010AF8 3D000000 */ lis r8, lbl_00011D00@ha
/* 00010AFC EC010032 */ fmuls f0, f1, f0
/* 00010B00 D0010068 */ stfs f0, 0x68(r1)
/* 00010B04 A0060008 */ lhz r0, 8(r6)
/* 00010B08 C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 00010B0C 900100CC */ stw r0, 0xcc(r1)
/* 00010B10 C0594920 */ lfs f2, 0x4920(r25)
/* 00010B14 93A100C8 */ stw r29, 0xc8(r1)
/* 00010B18 C80100C8 */ lfd f0, 0xc8(r1)
/* 00010B1C EC000828 */ fsubs f0, f0, f1
/* 00010B20 EC020024 */ fdivs f0, f2, f0
/* 00010B24 D0010078 */ stfs f0, 0x78(r1)
/* 00010B28 A006000A */ lhz r0, 0xa(r6)
/* 00010B2C C8240000 */ lfd f1, lbl_00011EC8@l(r4)
/* 00010B30 900100D4 */ stw r0, 0xd4(r1)
/* 00010B34 C0594924 */ lfs f2, 0x4924(r25)
/* 00010B38 93A100D0 */ stw r29, 0xd0(r1)
/* 00010B3C C80100D0 */ lfd f0, 0xd0(r1)
/* 00010B40 EC000828 */ fsubs f0, f0, f1
/* 00010B44 EC020024 */ fdivs f0, f2, f0
/* 00010B48 D001007C */ stfs f0, 0x7c(r1)
/* 00010B4C A0060008 */ lhz r0, 8(r6)
/* 00010B50 C8230000 */ lfd f1, lbl_00011EC8@l(r3)
/* 00010B54 900100DC */ stw r0, 0xdc(r1)
/* 00010B58 C0594928 */ lfs f2, 0x4928(r25)
/* 00010B5C 93A100D8 */ stw r29, 0xd8(r1)
/* 00010B60 C0610078 */ lfs f3, 0x78(r1)
/* 00010B64 C80100D8 */ lfd f0, 0xd8(r1)
/* 00010B68 EC000828 */ fsubs f0, f0, f1
/* 00010B6C EC020024 */ fdivs f0, f2, f0
/* 00010B70 EC03002A */ fadds f0, f3, f0
/* 00010B74 D0010080 */ stfs f0, 0x80(r1)
/* 00010B78 A006000A */ lhz r0, 0xa(r6)
/* 00010B7C C8270000 */ lfd f1, lbl_00011EC8@l(r7)
/* 00010B80 900100E4 */ stw r0, 0xe4(r1)
/* 00010B84 C059492C */ lfs f2, 0x492c(r25)
/* 00010B88 93A100E0 */ stw r29, 0xe0(r1)
/* 00010B8C C061007C */ lfs f3, 0x7c(r1)
/* 00010B90 C80100E0 */ lfd f0, 0xe0(r1)
/* 00010B94 EC000828 */ fsubs f0, f0, f1
/* 00010B98 EC020024 */ fdivs f0, f2, f0
/* 00010B9C EC03002A */ fadds f0, f3, f0
/* 00010BA0 D0010084 */ stfs f0, 0x84(r1)
/* 00010BA4 C0210080 */ lfs f1, 0x80(r1)
/* 00010BA8 C0010078 */ lfs f0, 0x78(r1)
/* 00010BAC C05F0040 */ lfs f2, 0x40(r31)
/* 00010BB0 EC010028 */ fsubs f0, f1, f0
/* 00010BB4 EC020032 */ fmuls f0, f2, f0
/* 00010BB8 D0010070 */ stfs f0, 0x70(r1)
/* 00010BBC C0210084 */ lfs f1, 0x84(r1)
/* 00010BC0 C001007C */ lfs f0, 0x7c(r1)
/* 00010BC4 C05F0044 */ lfs f2, 0x44(r31)
/* 00010BC8 EC010028 */ fsubs f0, f1, f0
/* 00010BCC EC020032 */ fmuls f0, f2, f0
/* 00010BD0 D0010074 */ stfs f0, 0x74(r1)
/* 00010BD4 C0094CF0 */ lfs f0, 0x4cf0(r9)
/* 00010BD8 C8280000 */ lfd f1, lbl_00011D00@l(r8)
/* 00010BDC FC00001E */ fctiwz f0, f0
/* 00010BE0 C0410064 */ lfs f2, 0x64(r1)
/* 00010BE4 D80100E8 */ stfd f0, 0xe8(r1)
/* 00010BE8 800100EC */ lwz r0, 0xec(r1)
/* 00010BEC 6C008000 */ xoris r0, r0, 0x8000
/* 00010BF0 900100C4 */ stw r0, 0xc4(r1)
/* 00010BF4 93A100C0 */ stw r29, 0xc0(r1)
/* 00010BF8 C80100C0 */ lfd f0, 0xc0(r1)
/* 00010BFC EC000828 */ fsubs f0, f0, f1
/* 00010C00 EC02002A */ fadds f0, f2, f0
/* 00010C04 D0010064 */ stfs f0, 0x64(r1)
/* 00010C08 C01F004C */ lfs f0, 0x4c(r31)
/* 00010C0C 2C160001 */ cmpwi r22, 1
/* 00010C10 D001006C */ stfs f0, 0x6c(r1)
/* 00010C14 C0010064 */ lfs f0, 0x64(r1)
/* 00010C18 C3E10068 */ lfs f31, 0x68(r1)
/* 00010C1C 4082000C */ bne lbl_00010C28
/* 00010C20 7DC77378 */ mr r7, r14
/* 00010C24 48000038 */ b lbl_00010C5C
lbl_00010C28:
/* 00010C28 2C110000 */ cmpwi r17, 0
/* 00010C2C 41820020 */ beq lbl_00010C4C
/* 00010C30 2C180001 */ cmpwi r24, 1
/* 00010C34 40820018 */ bne lbl_00010C4C
/* 00010C38 3818001C */ addi r0, r24, 0x1c
/* 00010C3C 1C000018 */ mulli r0, r0, 0x18
/* 00010C40 7CF70214 */ add r7, r23, r0
/* 00010C44 38E74918 */ addi r7, r7, 0x4918
/* 00010C48 48000014 */ b lbl_00010C5C
lbl_00010C4C:
/* 00010C4C 7C18A214 */ add r0, r24, r20
/* 00010C50 1C000018 */ mulli r0, r0, 0x18
/* 00010C54 7CF70214 */ add r7, r23, r0
/* 00010C58 38E74918 */ addi r7, r7, 0x4918
lbl_00010C5C:
/* 00010C5C 80010060 */ lwz r0, 0x60(r1)
/* 00010C60 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 00010C64 C0470000 */ lfs f2, 0(r7)
/* 00010C68 3C800000 */ lis r4, lbl_00011EC8@ha
/* 00010C6C 5403C63E */ rlwinm r3, r0, 0x18, 0x18, 0x1f
/* 00010C70 1C630018 */ mulli r3, r3, 0x18
/* 00010C74 C03F0040 */ lfs f1, 0x40(r31)
/* 00010C78 EC220072 */ fmuls f1, f2, f1
/* 00010C7C 7C751A14 */ add r3, r21, r3
/* 00010C80 80C30010 */ lwz r6, 0x10(r3)
/* 00010C84 54002536 */ rlwinm r0, r0, 4, 0x14, 0x1b
/* 00010C88 3C600000 */ lis r3, lbl_00011EC8@ha
/* 00010C8C 80C60004 */ lwz r6, 4(r6)
/* 00010C90 3D000000 */ lis r8, lbl_00011EC8@ha
/* 00010C94 D0210064 */ stfs f1, 0x64(r1)
/* 00010C98 7CC60214 */ add r6, r6, r0
/* 00010C9C C0470004 */ lfs f2, 4(r7)
/* 00010CA0 C03F0044 */ lfs f1, 0x44(r31)
/* 00010CA4 EC220072 */ fmuls f1, f2, f1
/* 00010CA8 D0210068 */ stfs f1, 0x68(r1)
/* 00010CAC A0060008 */ lhz r0, 8(r6)
/* 00010CB0 C8450000 */ lfd f2, lbl_00011EC8@l(r5)
/* 00010CB4 900100C4 */ stw r0, 0xc4(r1)
/* 00010CB8 C0670008 */ lfs f3, 8(r7)
/* 00010CBC 93A100C0 */ stw r29, 0xc0(r1)
/* 00010CC0 C82100C0 */ lfd f1, 0xc0(r1)
/* 00010CC4 EC211028 */ fsubs f1, f1, f2
/* 00010CC8 EC230824 */ fdivs f1, f3, f1
/* 00010CCC D0210078 */ stfs f1, 0x78(r1)
/* 00010CD0 A006000A */ lhz r0, 0xa(r6)
/* 00010CD4 C8440000 */ lfd f2, lbl_00011EC8@l(r4)
/* 00010CD8 900100CC */ stw r0, 0xcc(r1)
/* 00010CDC C067000C */ lfs f3, 0xc(r7)
/* 00010CE0 93A100C8 */ stw r29, 0xc8(r1)
/* 00010CE4 C82100C8 */ lfd f1, 0xc8(r1)
/* 00010CE8 EC211028 */ fsubs f1, f1, f2
/* 00010CEC EC230824 */ fdivs f1, f3, f1
/* 00010CF0 D021007C */ stfs f1, 0x7c(r1)
/* 00010CF4 A0060008 */ lhz r0, 8(r6)
/* 00010CF8 C8430000 */ lfd f2, lbl_00011EC8@l(r3)
/* 00010CFC 900100D4 */ stw r0, 0xd4(r1)
/* 00010D00 C0670010 */ lfs f3, 0x10(r7)
/* 00010D04 93A100D0 */ stw r29, 0xd0(r1)
/* 00010D08 C0810078 */ lfs f4, 0x78(r1)
/* 00010D0C C82100D0 */ lfd f1, 0xd0(r1)
/* 00010D10 806100B8 */ lwz r3, 0xb8(r1)
/* 00010D14 EC211028 */ fsubs f1, f1, f2
/* 00010D18 EC230824 */ fdivs f1, f3, f1
/* 00010D1C EC24082A */ fadds f1, f4, f1
/* 00010D20 D0210080 */ stfs f1, 0x80(r1)
/* 00010D24 A006000A */ lhz r0, 0xa(r6)
/* 00010D28 C8480000 */ lfd f2, lbl_00011EC8@l(r8)
/* 00010D2C 900100DC */ stw r0, 0xdc(r1)
/* 00010D30 C0670014 */ lfs f3, 0x14(r7)
/* 00010D34 93A100D8 */ stw r29, 0xd8(r1)
/* 00010D38 C081007C */ lfs f4, 0x7c(r1)
/* 00010D3C C82100D8 */ lfd f1, 0xd8(r1)
/* 00010D40 EC211028 */ fsubs f1, f1, f2
/* 00010D44 EC230824 */ fdivs f1, f3, f1
/* 00010D48 EC24082A */ fadds f1, f4, f1
/* 00010D4C D0210084 */ stfs f1, 0x84(r1)
/* 00010D50 C0410080 */ lfs f2, 0x80(r1)
/* 00010D54 C0210078 */ lfs f1, 0x78(r1)
/* 00010D58 C07F0040 */ lfs f3, 0x40(r31)
/* 00010D5C EC220828 */ fsubs f1, f2, f1
/* 00010D60 EC230072 */ fmuls f1, f3, f1
/* 00010D64 D0210070 */ stfs f1, 0x70(r1)
/* 00010D68 C0410084 */ lfs f2, 0x84(r1)
/* 00010D6C C021007C */ lfs f1, 0x7c(r1)
/* 00010D70 C07F0044 */ lfs f3, 0x44(r31)
/* 00010D74 EC220828 */ fsubs f1, f2, f1
/* 00010D78 EC230072 */ fmuls f1, f3, f1
/* 00010D7C D0210074 */ stfs f1, 0x74(r1)
/* 00010D80 80030000 */ lwz r0, 0(r3)
/* 00010D84 7000000A */ andi. r0, r0, 0xa
/* 00010D88 4082009C */ bne lbl_00010E24
/* 00010D8C C07C0000 */ lfs f3, 0(r28)
/* 00010D90 C03A0014 */ lfs f1, 0x14(r26)
/* 00010D94 EC401828 */ fsubs f2, f0, f3
/* 00010D98 FC020840 */ fcmpo cr0, f2, f1
/* 00010D9C 40810014 */ ble lbl_00010DB0
/* 00010DA0 C83A0428 */ lfd f1, 0x428(r26)
/* 00010DA4 FC01002A */ fadd f0, f1, f0
/* 00010DA8 FC000018 */ frsp f0, f0
/* 00010DAC 4800001C */ b lbl_00010DC8
lbl_00010DB0:
/* 00010DB0 C83A0430 */ lfd f1, 0x430(r26)
/* 00010DB4 FC020840 */ fcmpo cr0, f2, f1
/* 00010DB8 40800010 */ bge lbl_00010DC8
/* 00010DBC C83A0428 */ lfd f1, 0x428(r26)
/* 00010DC0 FC000828 */ fsub f0, f0, f1
/* 00010DC4 FC000018 */ frsp f0, f0
lbl_00010DC8:
/* 00010DC8 EC001828 */ fsubs f0, f0, f3
/* 00010DCC C83A0098 */ lfd f1, 0x98(r26)
/* 00010DD0 C05C0000 */ lfs f2, 0(r28)
/* 00010DD4 FC010032 */ fmul f0, f1, f0
/* 00010DD8 FC02002A */ fadd f0, f2, f0
/* 00010DDC FC000018 */ frsp f0, f0
/* 00010DE0 D01C0000 */ stfs f0, 0(r28)
/* 00010DE4 C05C0000 */ lfs f2, 0(r28)
/* 00010DE8 C83A0428 */ lfd f1, 0x428(r26)
/* 00010DEC FC020840 */ fcmpo cr0, f2, f1
/* 00010DF0 4C411382 */ cror 2, 1, 2
/* 00010DF4 40820014 */ bne lbl_00010E08
/* 00010DF8 FC020828 */ fsub f0, f2, f1
/* 00010DFC FC000018 */ frsp f0, f0
/* 00010E00 D01C0000 */ stfs f0, 0(r28)
/* 00010E04 48000020 */ b lbl_00010E24
lbl_00010E08:
/* 00010E08 C81A01E8 */ lfd f0, 0x1e8(r26)
/* 00010E0C FC020040 */ fcmpo cr0, f2, f0
/* 00010E10 4C401382 */ cror 2, 0, 2
/* 00010E14 40820010 */ bne lbl_00010E24
/* 00010E18 FC02082A */ fadd f0, f2, f1
/* 00010E1C FC000018 */ frsp f0, f0
/* 00010E20 D01C0000 */ stfs f0, 0(r28)
lbl_00010E24:
/* 00010E24 C01C0000 */ lfs f0, 0(r28)
/* 00010E28 3860000A */ li r3, 0xa
/* 00010E2C 38000000 */ li r0, 0
/* 00010E30 7C6903A6 */ mtctr r3
/* 00010E34 D0010064 */ stfs f0, 0x64(r1)
/* 00010E38 38A10008 */ addi r5, r1, 8
/* 00010E3C D3E10068 */ stfs f31, 0x68(r1)
/* 00010E40 38810058 */ addi r4, r1, 0x58
/* 00010E44 C03F004C */ lfs f1, 0x4c(r31)
/* 00010E48 C81A0190 */ lfd f0, 0x190(r26)
/* 00010E4C FC010028 */ fsub f0, f1, f0
/* 00010E50 FC000018 */ frsp f0, f0
/* 00010E54 D001006C */ stfs f0, 0x6c(r1)
/* 00010E58 C0210074 */ lfs f1, 0x74(r1)
/* 00010E5C C01C0008 */ lfs f0, 8(r28)
/* 00010E60 EC010032 */ fmuls f0, f1, f0
/* 00010E64 D0010074 */ stfs f0, 0x74(r1)
/* 00010E68 981F0070 */ stb r0, 0x70(r31)
/* 00010E6C 981F0071 */ stb r0, 0x71(r31)
/* 00010E70 981F0072 */ stb r0, 0x72(r31)
/* 00010E74 C03A0010 */ lfs f1, 0x10(r26)
/* 00010E78 C01F006C */ lfs f0, 0x6c(r31)
/* 00010E7C 88DF000C */ lbz r6, 0xc(r31)
/* 00010E80 EC010032 */ fmuls f0, f1, f0
/* 00010E84 881F000D */ lbz r0, 0xd(r31)
/* 00010E88 887F000E */ lbz r3, 0xe(r31)
/* 00010E8C FC00001E */ fctiwz f0, f0
/* 00010E90 D80100C0 */ stfd f0, 0xc0(r1)
/* 00010E94 80E100C4 */ lwz r7, 0xc4(r1)
/* 00010E98 54E7C00E */ slwi r7, r7, 0x18
/* 00010E9C 50C7821E */ rlwimi r7, r6, 0x10, 8, 0xf
/* 00010EA0 5007442E */ rlwimi r7, r0, 8, 0x10, 0x17
/* 00010EA4 7C603B78 */ or r0, r3, r7
/* 00010EA8 90010098 */ stw r0, 0x98(r1)
/* 00010EAC 88DF0071 */ lbz r6, 0x71(r31)
/* 00010EB0 881F0070 */ lbz r0, 0x70(r31)
/* 00010EB4 54C6402E */ slwi r6, r6, 8
/* 00010EB8 887F0072 */ lbz r3, 0x72(r31)
/* 00010EBC 5006821E */ rlwimi r6, r0, 0x10, 8, 0xf
/* 00010EC0 7C603378 */ or r0, r3, r6
/* 00010EC4 9001009C */ stw r0, 0x9c(r1)
lbl_00010EC8:
/* 00010EC8 84640008 */ lwzu r3, 8(r4)
/* 00010ECC 80040004 */ lwz r0, 4(r4)
/* 00010ED0 94650008 */ stwu r3, 8(r5)
/* 00010ED4 90050004 */ stw r0, 4(r5)
/* 00010ED8 4200FFF0 */ bdnz lbl_00010EC8
/* 00010EDC 2C110000 */ cmpwi r17, 0
/* 00010EE0 41820014 */ beq lbl_00010EF4
/* 00010EE4 2C180001 */ cmpwi r24, 1
/* 00010EE8 4082000C */ bne lbl_00010EF4
/* 00010EEC 7DE77B78 */ mr r7, r15
/* 00010EF0 48000014 */ b lbl_00010F04
lbl_00010EF4:
/* 00010EF4 38180020 */ addi r0, r24, 0x20
/* 00010EF8 1C000018 */ mulli r0, r0, 0x18
/* 00010EFC 7CF70214 */ add r7, r23, r0
/* 00010F00 38E74918 */ addi r7, r7, 0x4918
lbl_00010F04:
/* 00010F04 80010060 */ lwz r0, 0x60(r1)
/* 00010F08 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 00010F0C C0270000 */ lfs f1, 0(r7)
/* 00010F10 3C800000 */ lis r4, lbl_00011EC8@ha
/* 00010F14 5403C63E */ rlwinm r3, r0, 0x18, 0x18, 0x1f
/* 00010F18 1C630018 */ mulli r3, r3, 0x18
/* 00010F1C C01F0040 */ lfs f0, 0x40(r31)
/* 00010F20 EC010032 */ fmuls f0, f1, f0
/* 00010F24 7C751A14 */ add r3, r21, r3
/* 00010F28 80C30010 */ lwz r6, 0x10(r3)
/* 00010F2C 54002536 */ rlwinm r0, r0, 4, 0x14, 0x1b
/* 00010F30 3C600000 */ lis r3, lbl_00011EC8@ha
/* 00010F34 80C60004 */ lwz r6, 4(r6)
/* 00010F38 3D000000 */ lis r8, lbl_00011EC8@ha
/* 00010F3C D0010064 */ stfs f0, 0x64(r1)
/* 00010F40 7CC60214 */ add r6, r6, r0
/* 00010F44 C0270004 */ lfs f1, 4(r7)
/* 00010F48 C01F0044 */ lfs f0, 0x44(r31)
/* 00010F4C EC010032 */ fmuls f0, f1, f0
/* 00010F50 D0010068 */ stfs f0, 0x68(r1)
/* 00010F54 A0060008 */ lhz r0, 8(r6)
/* 00010F58 C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 00010F5C 900100C4 */ stw r0, 0xc4(r1)
/* 00010F60 C0470008 */ lfs f2, 8(r7)
/* 00010F64 93A100C0 */ stw r29, 0xc0(r1)
/* 00010F68 C80100C0 */ lfd f0, 0xc0(r1)
/* 00010F6C EC000828 */ fsubs f0, f0, f1
/* 00010F70 EC020024 */ fdivs f0, f2, f0
/* 00010F74 D0010078 */ stfs f0, 0x78(r1)
/* 00010F78 A006000A */ lhz r0, 0xa(r6)
/* 00010F7C C8240000 */ lfd f1, lbl_00011EC8@l(r4)
/* 00010F80 900100CC */ stw r0, 0xcc(r1)
/* 00010F84 C047000C */ lfs f2, 0xc(r7)
/* 00010F88 93A100C8 */ stw r29, 0xc8(r1)
/* 00010F8C C80100C8 */ lfd f0, 0xc8(r1)
/* 00010F90 EC000828 */ fsubs f0, f0, f1
/* 00010F94 EC020024 */ fdivs f0, f2, f0
/* 00010F98 D001007C */ stfs f0, 0x7c(r1)
/* 00010F9C A0060008 */ lhz r0, 8(r6)
/* 00010FA0 C8230000 */ lfd f1, lbl_00011EC8@l(r3)
/* 00010FA4 900100D4 */ stw r0, 0xd4(r1)
/* 00010FA8 C0470010 */ lfs f2, 0x10(r7)
/* 00010FAC 93A100D0 */ stw r29, 0xd0(r1)
/* 00010FB0 C0610078 */ lfs f3, 0x78(r1)
/* 00010FB4 C80100D0 */ lfd f0, 0xd0(r1)
/* 00010FB8 EC000828 */ fsubs f0, f0, f1
/* 00010FBC EC020024 */ fdivs f0, f2, f0
/* 00010FC0 EC03002A */ fadds f0, f3, f0
/* 00010FC4 D0010080 */ stfs f0, 0x80(r1)
/* 00010FC8 A006000A */ lhz r0, 0xa(r6)
/* 00010FCC C8280000 */ lfd f1, lbl_00011EC8@l(r8)
/* 00010FD0 900100DC */ stw r0, 0xdc(r1)
/* 00010FD4 C0470014 */ lfs f2, 0x14(r7)
/* 00010FD8 93A100D8 */ stw r29, 0xd8(r1)
/* 00010FDC C061007C */ lfs f3, 0x7c(r1)
/* 00010FE0 C80100D8 */ lfd f0, 0xd8(r1)
/* 00010FE4 EC000828 */ fsubs f0, f0, f1
/* 00010FE8 EC020024 */ fdivs f0, f2, f0
/* 00010FEC EC03002A */ fadds f0, f3, f0
/* 00010FF0 D0010084 */ stfs f0, 0x84(r1)
/* 00010FF4 C0210080 */ lfs f1, 0x80(r1)
/* 00010FF8 C0010078 */ lfs f0, 0x78(r1)
/* 00010FFC C05F0040 */ lfs f2, 0x40(r31)
/* 00011000 EC010028 */ fsubs f0, f1, f0
/* 00011004 EC020032 */ fmuls f0, f2, f0
/* 00011008 D0010070 */ stfs f0, 0x70(r1)
/* 0001100C C0210084 */ lfs f1, 0x84(r1)
/* 00011010 C001007C */ lfs f0, 0x7c(r1)
/* 00011014 C05F0044 */ lfs f2, 0x44(r31)
/* 00011018 EC010028 */ fsubs f0, f1, f0
/* 0001101C EC020032 */ fmuls f0, f2, f0
/* 00011020 D0010074 */ stfs f0, 0x74(r1)
/* 00011024 C0010014 */ lfs f0, 0x14(r1)
/* 00011028 D0010064 */ stfs f0, 0x64(r1)
/* 0001102C C0010018 */ lfs f0, 0x18(r1)
/* 00011030 D0010068 */ stfs f0, 0x68(r1)
/* 00011034 C83A01E0 */ lfd f1, 0x1e0(r26)
/* 00011038 C001001C */ lfs f0, 0x1c(r1)
/* 0001103C FC01002A */ fadd f0, f1, f0
/* 00011040 FC000018 */ frsp f0, f0
/* 00011044 D001006C */ stfs f0, 0x6c(r1)
/* 00011048 C0010020 */ lfs f0, 0x20(r1)
/* 0001104C D0010070 */ stfs f0, 0x70(r1)
/* 00011050 C83A0438 */ lfd f1, 0x438(r26)
/* 00011054 C0010024 */ lfs f0, 0x24(r1)
/* 00011058 FC010032 */ fmul f0, f1, f0
/* 0001105C FC000018 */ frsp f0, f0
/* 00011060 D0010074 */ stfs f0, 0x74(r1)
/* 00011064 801B0048 */ lwz r0, 0x48(r27)
/* 00011068 2C000000 */ cmpwi r0, 0
/* 0001106C 41820018 */ beq lbl_00011084
/* 00011070 38000000 */ li r0, 0
/* 00011074 981F0070 */ stb r0, 0x70(r31)
/* 00011078 981F0071 */ stb r0, 0x71(r31)
/* 0001107C 981F0072 */ stb r0, 0x72(r31)
/* 00011080 48000048 */ b lbl_000110C8
lbl_00011084:
/* 00011084 806100BC */ lwz r3, 0xbc(r1)
/* 00011088 80030000 */ lwz r0, 0(r3)
/* 0001108C 5403482C */ slwi r3, r0, 9
/* 00011090 4BFEF0F9 */ bl mathutil_sin
/* 00011094 FC400A10 */ fabs f2, f1
/* 00011098 C83A0030 */ lfd f1, 0x30(r26)
/* 0001109C C81A0198 */ lfd f0, 0x198(r26)
/* 000110A0 FC211028 */ fsub f1, f1, f2
/* 000110A4 FC000072 */ fmul f0, f0, f1
/* 000110A8 FC00001E */ fctiwz f0, f0
/* 000110AC D80100C0 */ stfd f0, 0xc0(r1)
/* 000110B0 800100C4 */ lwz r0, 0xc4(r1)
/* 000110B4 981F0070 */ stb r0, 0x70(r31)
/* 000110B8 881F0070 */ lbz r0, 0x70(r31)
/* 000110BC 981F0071 */ stb r0, 0x71(r31)
/* 000110C0 881F0070 */ lbz r0, 0x70(r31)
/* 000110C4 981F0072 */ stb r0, 0x72(r31)
lbl_000110C8:
/* 000110C8 88BF0071 */ lbz r5, 0x71(r31)
/* 000110CC 38610060 */ addi r3, r1, 0x60
/* 000110D0 881F0070 */ lbz r0, 0x70(r31)
/* 000110D4 54A5402E */ slwi r5, r5, 8
/* 000110D8 889F0072 */ lbz r4, 0x72(r31)
/* 000110DC 5005821E */ rlwimi r5, r0, 0x10, 8, 0xf
/* 000110E0 7C802B78 */ or r0, r4, r5
/* 000110E4 9001009C */ stw r0, 0x9c(r1)
/* 000110E8 4BFEF0A1 */ bl draw_naomi_sprite
/* 000110EC 3800000A */ li r0, 0xa
/* 000110F0 7C0903A6 */ mtctr r0
/* 000110F4 38810058 */ addi r4, r1, 0x58
/* 000110F8 38610008 */ addi r3, r1, 8
lbl_000110FC:
/* 000110FC 84A30008 */ lwzu r5, 8(r3)
/* 00011100 80030004 */ lwz r0, 4(r3)
/* 00011104 94A40008 */ stwu r5, 8(r4)
/* 00011108 90040004 */ stw r0, 4(r4)
/* 0001110C 4200FFF0 */ bdnz lbl_000110FC
/* 00011110 38610060 */ addi r3, r1, 0x60
/* 00011114 4BFEF075 */ bl draw_naomi_sprite
/* 00011118 801B0048 */ lwz r0, 0x48(r27)
/* 0001111C 2C000000 */ cmpwi r0, 0
/* 00011120 41820174 */ beq lbl_00011294
/* 00011124 2C110000 */ cmpwi r17, 0
/* 00011128 4182000C */ beq lbl_00011134
/* 0001112C 2C180001 */ cmpwi r24, 1
/* 00011130 41820164 */ beq lbl_00011294
lbl_00011134:
/* 00011134 807E0000 */ lwz r3, 0(r30)
/* 00011138 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0001113C 80010060 */ lwz r0, 0x60(r1)
/* 00011140 3C800000 */ lis r4, lbl_00011EC8@ha
/* 00011144 38630025 */ addi r3, r3, 0x25
/* 00011148 1CC30018 */ mulli r6, r3, 0x18
/* 0001114C C01F0040 */ lfs f0, 0x40(r31)
/* 00011150 5403C63E */ rlwinm r3, r0, 0x18, 0x18, 0x1f
/* 00011154 1C630018 */ mulli r3, r3, 0x18
/* 00011158 7CF73214 */ add r7, r23, r6
/* 0001115C 7C751A14 */ add r3, r21, r3
/* 00011160 C0274918 */ lfs f1, 0x4918(r7)
/* 00011164 80630010 */ lwz r3, 0x10(r3)
/* 00011168 54002536 */ rlwinm r0, r0, 4, 0x14, 0x1b
/* 0001116C EC010032 */ fmuls f0, f1, f0
/* 00011170 3D000000 */ lis r8, lbl_00011EC8@ha
/* 00011174 80630004 */ lwz r3, 4(r3)
/* 00011178 3D200000 */ lis r9, lbl_00011EC8@ha
/* 0001117C D0010064 */ stfs f0, 0x64(r1)
/* 00011180 7CC30214 */ add r6, r3, r0
/* 00011184 C027491C */ lfs f1, 0x491c(r7)
/* 00011188 38610060 */ addi r3, r1, 0x60
/* 0001118C C01F0044 */ lfs f0, 0x44(r31)
/* 00011190 EC010032 */ fmuls f0, f1, f0
/* 00011194 D0010068 */ stfs f0, 0x68(r1)
/* 00011198 A0060008 */ lhz r0, 8(r6)
/* 0001119C C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 000111A0 900100C4 */ stw r0, 0xc4(r1)
/* 000111A4 C0474920 */ lfs f2, 0x4920(r7)
/* 000111A8 93A100C0 */ stw r29, 0xc0(r1)
/* 000111AC C80100C0 */ lfd f0, 0xc0(r1)
/* 000111B0 EC000828 */ fsubs f0, f0, f1
/* 000111B4 EC020024 */ fdivs f0, f2, f0
/* 000111B8 D0010078 */ stfs f0, 0x78(r1)
/* 000111BC A006000A */ lhz r0, 0xa(r6)
/* 000111C0 C8240000 */ lfd f1, lbl_00011EC8@l(r4)
/* 000111C4 900100CC */ stw r0, 0xcc(r1)
/* 000111C8 C0474924 */ lfs f2, 0x4924(r7)
/* 000111CC 93A100C8 */ stw r29, 0xc8(r1)
/* 000111D0 C80100C8 */ lfd f0, 0xc8(r1)
/* 000111D4 EC000828 */ fsubs f0, f0, f1
/* 000111D8 EC020024 */ fdivs f0, f2, f0
/* 000111DC D001007C */ stfs f0, 0x7c(r1)
/* 000111E0 A0060008 */ lhz r0, 8(r6)
/* 000111E4 C8280000 */ lfd f1, lbl_00011EC8@l(r8)
/* 000111E8 900100D4 */ stw r0, 0xd4(r1)
/* 000111EC C0474928 */ lfs f2, 0x4928(r7)
/* 000111F0 93A100D0 */ stw r29, 0xd0(r1)
/* 000111F4 C0610078 */ lfs f3, 0x78(r1)
/* 000111F8 C80100D0 */ lfd f0, 0xd0(r1)
/* 000111FC EC000828 */ fsubs f0, f0, f1
/* 00011200 EC020024 */ fdivs f0, f2, f0
/* 00011204 EC03002A */ fadds f0, f3, f0
/* 00011208 D0010080 */ stfs f0, 0x80(r1)
/* 0001120C A006000A */ lhz r0, 0xa(r6)
/* 00011210 C8290000 */ lfd f1, lbl_00011EC8@l(r9)
/* 00011214 900100DC */ stw r0, 0xdc(r1)
/* 00011218 C047492C */ lfs f2, 0x492c(r7)
/* 0001121C 93A100D8 */ stw r29, 0xd8(r1)
/* 00011220 C061007C */ lfs f3, 0x7c(r1)
/* 00011224 C80100D8 */ lfd f0, 0xd8(r1)
/* 00011228 EC000828 */ fsubs f0, f0, f1
/* 0001122C EC020024 */ fdivs f0, f2, f0
/* 00011230 EC03002A */ fadds f0, f3, f0
/* 00011234 D0010084 */ stfs f0, 0x84(r1)
/* 00011238 C0210080 */ lfs f1, 0x80(r1)
/* 0001123C C0010078 */ lfs f0, 0x78(r1)
/* 00011240 C05F0040 */ lfs f2, 0x40(r31)
/* 00011244 EC010028 */ fsubs f0, f1, f0
/* 00011248 EC020032 */ fmuls f0, f2, f0
/* 0001124C D0010070 */ stfs f0, 0x70(r1)
/* 00011250 C0210084 */ lfs f1, 0x84(r1)
/* 00011254 C001007C */ lfs f0, 0x7c(r1)
/* 00011258 C05F0044 */ lfs f2, 0x44(r31)
/* 0001125C EC010028 */ fsubs f0, f1, f0
/* 00011260 EC020032 */ fmuls f0, f2, f0
/* 00011264 D0010074 */ stfs f0, 0x74(r1)
/* 00011268 C01C0000 */ lfs f0, 0(r28)
/* 0001126C D0010064 */ stfs f0, 0x64(r1)
/* 00011270 C01A0204 */ lfs f0, 0x204(r26)
/* 00011274 EC1F0028 */ fsubs f0, f31, f0
/* 00011278 D0010068 */ stfs f0, 0x68(r1)
/* 0001127C C03F004C */ lfs f1, 0x4c(r31)
/* 00011280 C81A0330 */ lfd f0, 0x330(r26)
/* 00011284 FC010028 */ fsub f0, f1, f0
/* 00011288 FC000018 */ frsp f0, f0
/* 0001128C D001006C */ stfs f0, 0x6c(r1)
/* 00011290 4BFEEEF9 */ bl draw_naomi_sprite
lbl_00011294:
/* 00011294 806100B4 */ lwz r3, 0xb4(r1)
/* 00011298 80030000 */ lwz r0, 0(r3)
/* 0001129C 2C000002 */ cmpwi r0, 2
/* 000112A0 41820054 */ beq lbl_000112F4
/* 000112A4 40800014 */ bge lbl_000112B8
/* 000112A8 2C000000 */ cmpwi r0, 0
/* 000112AC 41820020 */ beq lbl_000112CC
/* 000112B0 4080002C */ bge lbl_000112DC
/* 000112B4 48000040 */ b lbl_000112F4
lbl_000112B8:
/* 000112B8 2C000009 */ cmpwi r0, 9
/* 000112BC 40800038 */ bge lbl_000112F4
/* 000112C0 2C000005 */ cmpwi r0, 5
/* 000112C4 40800008 */ bge lbl_000112CC
/* 000112C8 48000014 */ b lbl_000112DC
lbl_000112CC:
/* 000112CC 801B0048 */ lwz r0, 0x48(r27)
/* 000112D0 2C000000 */ cmpwi r0, 0
/* 000112D4 40820020 */ bne lbl_000112F4
/* 000112D8 48000040 */ b lbl_00011318
lbl_000112DC:
/* 000112DC 80100110 */ lwz r0, 0x110(r16)
/* 000112E0 2C000000 */ cmpwi r0, 0
/* 000112E4 41820010 */ beq lbl_000112F4
/* 000112E8 801B0048 */ lwz r0, 0x48(r27)
/* 000112EC 2C000000 */ cmpwi r0, 0
/* 000112F0 41820028 */ beq lbl_00011318
lbl_000112F4:
/* 000112F4 3A730004 */ addi r19, r19, 4
/* 000112F8 3A520004 */ addi r18, r18, 4
/* 000112FC 3A940004 */ addi r20, r20, 4
/* 00011300 3B7B0004 */ addi r27, r27, 4
/* 00011304 3BDE0004 */ addi r30, r30, 4
/* 00011308 3B180001 */ addi r24, r24, 1
/* 0001130C 3B9C0010 */ addi r28, r28, 0x10
lbl_00011310:
/* 00011310 7C18B000 */ cmpw r24, r22
/* 00011314 4180F788 */ blt lbl_00010A9C
lbl_00011318:
/* 00011318 B9C100F0 */ lmw r14, 0xf0(r1)
/* 0001131C 80010144 */ lwz r0, 0x144(r1)
/* 00011320 CBE10138 */ lfd f31, 0x138(r1)
/* 00011324 38210140 */ addi r1, r1, 0x140
/* 00011328 7C0803A6 */ mtlr r0
/* 0001132C 4E800020 */ blr 
lbl_00011330:
/* 00011330 7C0802A6 */ mflr r0
/* 00011334 3C800000 */ lis r4, lbl_00011CB0@ha
/* 00011338 90010004 */ stw r0, 4(r1)
/* 0001133C 3C600000 */ lis r3, lbl_00017460@ha
/* 00011340 9421FFD0 */ stwu r1, -0x30(r1)
/* 00011344 BF210014 */ stmw r25, 0x14(r1)
/* 00011348 3B840000 */ addi r28, r4, lbl_00011CB0@l
/* 0001134C 3B430000 */ addi r26, r3, lbl_00017460@l
/* 00011350 3C800000 */ lis r4, lbl_00011424@ha
/* 00011354 3C600000 */ lis r3, lbl_0001746C@ha
/* 00011358 3B7C0440 */ addi r27, r28, 0x440
/* 0001135C 3BC40000 */ addi r30, r4, lbl_00011424@l
/* 00011360 3BE30000 */ addi r31, r3, lbl_0001746C@l
/* 00011364 3B200000 */ li r25, 0
/* 00011368 3FA04330 */ lis r29, 0x4330
lbl_0001136C:
/* 0001136C 4BFEEE1D */ bl create_sprite
/* 00011370 7C691B79 */ or. r9, r3, r3
/* 00011374 41820088 */ beq lbl_000113FC
/* 00011378 38190005 */ addi r0, r25, 5
/* 0001137C 4CC63182 */ crclr 6
/* 00011380 9809000F */ stb r0, 0xf(r9)
/* 00011384 39000001 */ li r8, 1
/* 00011388 6F238000 */ xoris r3, r25, 0x8000
/* 0001138C 99090000 */ stb r8, 0(r9)
/* 00011390 3CC00000 */ lis r6, lbl_00011D00@ha
/* 00011394 38000004 */ li r0, 4
/* 00011398 80BB0000 */ lwz r5, 0(r27)
/* 0001139C 7FE4FB78 */ mr r4, r31
/* 000113A0 9061000C */ stw r3, 0xc(r1)
/* 000113A4 3869008C */ addi r3, r9, 0x8c
/* 000113A8 B0A9003C */ sth r5, 0x3c(r9)
/* 000113AC 38B90000 */ addi r5, r25, 0
/* 000113B0 80FA0000 */ lwz r7, 0(r26)
/* 000113B4 93A10008 */ stw r29, 8(r1)
/* 000113B8 C0270000 */ lfs f1, 0(r7)
/* 000113BC C8010008 */ lfd f0, 8(r1)
/* 000113C0 D0290004 */ stfs f1, 4(r9)
/* 000113C4 C03C0494 */ lfs f1, 0x494(r28)
/* 000113C8 D0290008 */ stfs f1, 8(r9)
/* 000113CC C8260000 */ lfd f1, lbl_00011D00@l(r6)
/* 000113D0 C85C0190 */ lfd f2, 0x190(r28)
/* 000113D4 FC000828 */ fsub f0, f0, f1
/* 000113D8 C83C0000 */ lfd f1, 0(r28)
/* 000113DC FC020032 */ fmul f0, f2, f0
/* 000113E0 FC01002A */ fadd f0, f1, f0
/* 000113E4 FC000018 */ frsp f0, f0
/* 000113E8 D009004C */ stfs f0, 0x4c(r9)
/* 000113EC 98090003 */ stb r0, 3(r9)
/* 000113F0 91090048 */ stw r8, 0x48(r9)
/* 000113F4 93C90034 */ stw r30, 0x34(r9)
/* 000113F8 4BFEED91 */ bl sprintf
lbl_000113FC:
/* 000113FC 3B390001 */ addi r25, r25, 1
/* 00011400 2C190003 */ cmpwi r25, 3
/* 00011404 3B7B0004 */ addi r27, r27, 4
/* 00011408 3B5A0004 */ addi r26, r26, 4
/* 0001140C 4180FF60 */ blt lbl_0001136C
/* 00011410 BB210014 */ lmw r25, 0x14(r1)
/* 00011414 80010034 */ lwz r0, 0x34(r1)
/* 00011418 38210030 */ addi r1, r1, 0x30
/* 0001141C 7C0803A6 */ mtlr r0
/* 00011420 4E800020 */ blr 
lbl_00011424:
/* 00011424 7C0802A6 */ mflr r0
/* 00011428 3CA00000 */ lis r5, lbl_00011CB0@ha
/* 0001142C 90010004 */ stw r0, 4(r1)
/* 00011430 9421FFD8 */ stwu r1, -0x28(r1)
/* 00011434 93E10024 */ stw r31, 0x24(r1)
/* 00011438 3BE50000 */ addi r31, r5, lbl_00011CB0@l
/* 0001143C 93C10020 */ stw r30, 0x20(r1)
/* 00011440 3BC40000 */ addi r30, r4, 0
/* 00011444 C0640004 */ lfs f3, 4(r4)
/* 00011448 3C800000 */ lis r4, lbl_00012730@ha
/* 0001144C C01F0498 */ lfs f0, 0x498(r31)
/* 00011450 38A40000 */ addi r5, r4, lbl_00012730@l
/* 00011454 881E000F */ lbz r0, 0xf(r30)
/* 00011458 FC030040 */ fcmpo cr0, f3, f0
/* 0001145C 7C040774 */ extsb r4, r0
/* 00011460 38C4FFFB */ addi r6, r4, -5  ;# fixed addi
/* 00011464 4181001C */ bgt lbl_00011480
/* 00011468 C01F049C */ lfs f0, 0x49c(r31)
/* 0001146C FC030040 */ fcmpo cr0, f3, f0
/* 00011470 4080001C */ bge lbl_0001148C
/* 00011474 801E0048 */ lwz r0, 0x48(r30)
/* 00011478 2C000005 */ cmpwi r0, 5
/* 0001147C 40820010 */ bne lbl_0001148C
lbl_00011480:
/* 00011480 38000000 */ li r0, 0
/* 00011484 98030000 */ stb r0, 0(r3)
/* 00011488 480001E8 */ b lbl_00011670
lbl_0001148C:
/* 0001148C 809E0048 */ lwz r4, 0x48(r30)
/* 00011490 2C040005 */ cmpwi r4, 5
/* 00011494 41820048 */ beq lbl_000114DC
/* 00011498 40800078 */ bge lbl_00011510
/* 0001149C 2C040004 */ cmpwi r4, 4
/* 000114A0 40800008 */ bge lbl_000114A8
/* 000114A4 4800006C */ b lbl_00011510
lbl_000114A8:
/* 000114A8 54C0103A */ slwi r0, r6, 2
/* 000114AC C83F0330 */ lfd f1, 0x330(r31)
/* 000114B0 7C650214 */ add r3, r5, r0
/* 000114B4 C05E0004 */ lfs f2, 4(r30)
/* 000114B8 80634D30 */ lwz r3, 0x4d30(r3)
/* 000114BC 5480103A */ slwi r0, r4, 2
/* 000114C0 7C03042E */ lfsx f0, r3, r0
/* 000114C4 EC001828 */ fsubs f0, f0, f3
/* 000114C8 FC010032 */ fmul f0, f1, f0
/* 000114CC FC02002A */ fadd f0, f2, f0
/* 000114D0 FC000018 */ frsp f0, f0
/* 000114D4 D01E0004 */ stfs f0, 4(r30)
/* 000114D8 48000068 */ b lbl_00011540
lbl_000114DC:
/* 000114DC 54C0103A */ slwi r0, r6, 2
/* 000114E0 C83F0058 */ lfd f1, 0x58(r31)
/* 000114E4 7C650214 */ add r3, r5, r0
/* 000114E8 C05E0004 */ lfs f2, 4(r30)
/* 000114EC 80634D30 */ lwz r3, 0x4d30(r3)
/* 000114F0 5480103A */ slwi r0, r4, 2
/* 000114F4 7C03042E */ lfsx f0, r3, r0
/* 000114F8 EC001828 */ fsubs f0, f0, f3
/* 000114FC FC010032 */ fmul f0, f1, f0
/* 00011500 FC02002A */ fadd f0, f2, f0
/* 00011504 FC000018 */ frsp f0, f0
/* 00011508 D01E0004 */ stfs f0, 4(r30)
/* 0001150C 48000034 */ b lbl_00011540
lbl_00011510:
/* 00011510 54C0103A */ slwi r0, r6, 2
/* 00011514 C83F0180 */ lfd f1, 0x180(r31)
/* 00011518 7C650214 */ add r3, r5, r0
/* 0001151C C05E0004 */ lfs f2, 4(r30)
/* 00011520 80634D30 */ lwz r3, 0x4d30(r3)
/* 00011524 5480103A */ slwi r0, r4, 2
/* 00011528 7C03042E */ lfsx f0, r3, r0
/* 0001152C EC001828 */ fsubs f0, f0, f3
/* 00011530 FC010032 */ fmul f0, f1, f0
/* 00011534 FC02002A */ fadd f0, f2, f0
/* 00011538 FC000018 */ frsp f0, f0
/* 0001153C D01E0004 */ stfs f0, 4(r30)
lbl_00011540:
/* 00011540 54C0103A */ slwi r0, r6, 2
/* 00011544 C01E0004 */ lfs f0, 4(r30)
/* 00011548 7C650214 */ add r3, r5, r0
/* 0001154C C05F0358 */ lfs f2, 0x358(r31)
/* 00011550 80634D30 */ lwz r3, 0x4d30(r3)
/* 00011554 C0230004 */ lfs f1, 4(r3)
/* 00011558 EC010028 */ fsubs f0, f1, f0
/* 0001155C EC020032 */ fmuls f0, f2, f0
/* 00011560 FC00001E */ fctiwz f0, f0
/* 00011564 D8010018 */ stfd f0, 0x18(r1)
/* 00011568 8001001C */ lwz r0, 0x1c(r1)
/* 0001156C B01E0068 */ sth r0, 0x68(r30)
/* 00011570 801E0048 */ lwz r0, 0x48(r30)
/* 00011574 2C000001 */ cmpwi r0, 1
/* 00011578 41820008 */ beq lbl_00011580
/* 0001157C 48000010 */ b lbl_0001158C
lbl_00011580:
/* 00011580 38000080 */ li r0, 0x80
/* 00011584 981E000C */ stb r0, 0xc(r30)
/* 00011588 4800000C */ b lbl_00011594
lbl_0001158C:
/* 0001158C 380000FF */ li r0, 0xff
/* 00011590 981E000C */ stb r0, 0xc(r30)
lbl_00011594:
/* 00011594 881E000C */ lbz r0, 0xc(r30)
/* 00011598 981E000D */ stb r0, 0xd(r30)
/* 0001159C 881E000C */ lbz r0, 0xc(r30)
/* 000115A0 981E000E */ stb r0, 0xe(r30)
/* 000115A4 801E0048 */ lwz r0, 0x48(r30)
/* 000115A8 2C000003 */ cmpwi r0, 3
/* 000115AC 4182004C */ beq lbl_000115F8
/* 000115B0 40800094 */ bge lbl_00011644
/* 000115B4 2C000002 */ cmpwi r0, 2
/* 000115B8 40800008 */ bge lbl_000115C0
/* 000115BC 48000088 */ b lbl_00011644
lbl_000115C0:
/* 000115C0 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 000115C4 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 000115C8 5403482C */ slwi r3, r0, 9
/* 000115CC 4BFEEBBD */ bl mathutil_sin
/* 000115D0 FC400A10 */ fabs f2, f1
/* 000115D4 C83F0030 */ lfd f1, 0x30(r31)
/* 000115D8 C81F0198 */ lfd f0, 0x198(r31)
/* 000115DC FC211028 */ fsub f1, f1, f2
/* 000115E0 FC000072 */ fmul f0, f0, f1
/* 000115E4 FC00001E */ fctiwz f0, f0
/* 000115E8 D8010018 */ stfd f0, 0x18(r1)
/* 000115EC 8001001C */ lwz r0, 0x1c(r1)
/* 000115F0 981E0070 */ stb r0, 0x70(r30)
/* 000115F4 48000058 */ b lbl_0001164C
lbl_000115F8:
/* 000115F8 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 000115FC C85F0030 */ lfd f2, 0x30(r31)
/* 00011600 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 00011604 3C600000 */ lis r3, lbl_00011EC8@ha
/* 00011608 C8230000 */ lfd f1, lbl_00011EC8@l(r3)
/* 0001160C 5400F7FE */ rlwinm r0, r0, 0x1e, 0x1f, 0x1f
/* 00011610 C87F0198 */ lfd f3, 0x198(r31)
/* 00011614 9001001C */ stw r0, 0x1c(r1)
/* 00011618 3C004330 */ lis r0, 0x4330
/* 0001161C 90010018 */ stw r0, 0x18(r1)
/* 00011620 C8010018 */ lfd f0, 0x18(r1)
/* 00011624 FC000828 */ fsub f0, f0, f1
/* 00011628 FC020028 */ fsub f0, f2, f0
/* 0001162C FC030032 */ fmul f0, f3, f0
/* 00011630 FC00001E */ fctiwz f0, f0
/* 00011634 D8010010 */ stfd f0, 0x10(r1)
/* 00011638 80010014 */ lwz r0, 0x14(r1)
/* 0001163C 981E0070 */ stb r0, 0x70(r30)
/* 00011640 4800000C */ b lbl_0001164C
lbl_00011644:
/* 00011644 38000000 */ li r0, 0
/* 00011648 981E0070 */ stb r0, 0x70(r30)
lbl_0001164C:
/* 0001164C 881E0070 */ lbz r0, 0x70(r30)
/* 00011650 981E0071 */ stb r0, 0x71(r30)
/* 00011654 881E0070 */ lbz r0, 0x70(r30)
/* 00011658 981E0072 */ stb r0, 0x72(r30)
/* 0001165C 801E0048 */ lwz r0, 0x48(r30)
/* 00011660 2C000003 */ cmpwi r0, 3
/* 00011664 4082000C */ bne lbl_00011670
/* 00011668 C01F0200 */ lfs f0, 0x200(r31)
/* 0001166C D01E004C */ stfs f0, 0x4c(r30)
lbl_00011670:
/* 00011670 8001002C */ lwz r0, 0x2c(r1)
/* 00011674 83E10024 */ lwz r31, 0x24(r1)
/* 00011678 83C10020 */ lwz r30, 0x20(r1)
/* 0001167C 7C0803A6 */ mtlr r0
/* 00011680 38210028 */ addi r1, r1, 0x28
/* 00011684 4E800020 */ blr 
lbl_00011688:
/* 00011688 7C0802A6 */ mflr r0
/* 0001168C 3C600000 */ lis r3, lbl_00011CB0@ha
/* 00011690 90010004 */ stw r0, 4(r1)
/* 00011694 9421FFF0 */ stwu r1, -0x10(r1)
/* 00011698 93E1000C */ stw r31, 0xc(r1)
/* 0001169C 3BE30000 */ addi r31, r3, lbl_00011CB0@l
/* 000116A0 4BFEEAE9 */ bl create_sprite
/* 000116A4 7C691B79 */ or. r9, r3, r3
/* 000116A8 4182006C */ beq lbl_00011714
/* 000116AC 38000009 */ li r0, 9
/* 000116B0 9809000F */ stb r0, 0xf(r9)
/* 000116B4 3CC00000 */ lis r6, lbl_00011728@ha
/* 000116B8 3CA00000 */ lis r5, lbl_00011824@ha
/* 000116BC C01F0410 */ lfs f0, 0x410(r31)
/* 000116C0 3C600000 */ lis r3, lbl_00017478@ha
/* 000116C4 38830000 */ addi r4, r3, lbl_00017478@l
/* 000116C8 D0090004 */ stfs f0, 4(r9)
/* 000116CC 39000003 */ li r8, 3
/* 000116D0 38E0000F */ li r7, 0xf
/* 000116D4 C01F04A0 */ lfs f0, 0x4a0(r31)
/* 000116D8 38C60000 */ addi r6, r6, lbl_00011728@l
/* 000116DC 38050000 */ addi r0, r5, lbl_00011824@l
/* 000116E0 D0090008 */ stfs f0, 8(r9)
/* 000116E4 3869008C */ addi r3, r9, 0x8c
/* 000116E8 C01F0090 */ lfs f0, 0x90(r31)
/* 000116EC D0090040 */ stfs f0, 0x40(r9)
/* 000116F0 C01F000C */ lfs f0, 0xc(r31)
/* 000116F4 D0090044 */ stfs f0, 0x44(r9)
/* 000116F8 C01F000C */ lfs f0, 0xc(r31)
/* 000116FC D009006C */ stfs f0, 0x6c(r9)
/* 00011700 91090048 */ stw r8, 0x48(r9)
/* 00011704 B0E90010 */ sth r7, 0x10(r9)
/* 00011708 90C90034 */ stw r6, 0x34(r9)
/* 0001170C 90090038 */ stw r0, 0x38(r9)
/* 00011710 4BFEEA79 */ bl strcpy
lbl_00011714:
/* 00011714 80010014 */ lwz r0, 0x14(r1)
/* 00011718 83E1000C */ lwz r31, 0xc(r1)
/* 0001171C 38210010 */ addi r1, r1, 0x10
/* 00011720 7C0803A6 */ mtlr r0
/* 00011724 4E800020 */ blr 
lbl_00011728:
/* 00011728 9421FFE8 */ stwu r1, -0x18(r1)
/* 0001172C 3CC00000 */ lis r6, lbl_00011CB0@ha
/* 00011730 38C60000 */ addi r6, r6, lbl_00011CB0@l
/* 00011734 A8A40010 */ lha r5, 0x10(r4)
/* 00011738 2C050000 */ cmpwi r5, 0
/* 0001173C 4081000C */ ble lbl_00011748
/* 00011740 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 00011744 B0040010 */ sth r0, 0x10(r4)
lbl_00011748:
/* 00011748 80040048 */ lwz r0, 0x48(r4)
/* 0001174C 2C000002 */ cmpwi r0, 2
/* 00011750 41820034 */ beq lbl_00011784
/* 00011754 40800010 */ bge lbl_00011764
/* 00011758 2C000001 */ cmpwi r0, 1
/* 0001175C 40800014 */ bge lbl_00011770
/* 00011760 480000BC */ b lbl_0001181C
lbl_00011764:
/* 00011764 2C000004 */ cmpwi r0, 4
/* 00011768 408000B4 */ bge lbl_0001181C
/* 0001176C 48000060 */ b lbl_000117CC
lbl_00011770:
/* 00011770 3800000F */ li r0, 0xf
/* 00011774 B0040010 */ sth r0, 0x10(r4)
/* 00011778 38000002 */ li r0, 2
/* 0001177C 90040048 */ stw r0, 0x48(r4)
/* 00011780 4800009C */ b lbl_0001181C
lbl_00011784:
/* 00011784 A8040010 */ lha r0, 0x10(r4)
/* 00011788 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0001178C C8450000 */ lfd f2, lbl_00011D00@l(r5)
/* 00011790 6C008000 */ xoris r0, r0, 0x8000
/* 00011794 C00600A8 */ lfs f0, 0xa8(r6)
/* 00011798 90010014 */ stw r0, 0x14(r1)
/* 0001179C 3C004330 */ lis r0, 0x4330
/* 000117A0 90010010 */ stw r0, 0x10(r1)
/* 000117A4 C8210010 */ lfd f1, 0x10(r1)
/* 000117A8 EC211028 */ fsubs f1, f1, f2
/* 000117AC EC010024 */ fdivs f0, f1, f0
/* 000117B0 D004006C */ stfs f0, 0x6c(r4)
/* 000117B4 A8040010 */ lha r0, 0x10(r4)
/* 000117B8 2C000000 */ cmpwi r0, 0
/* 000117BC 40820060 */ bne lbl_0001181C
/* 000117C0 38000000 */ li r0, 0
/* 000117C4 98030000 */ stb r0, 0(r3)
/* 000117C8 48000054 */ b lbl_0001181C
lbl_000117CC:
/* 000117CC A8040010 */ lha r0, 0x10(r4)
/* 000117D0 3C600000 */ lis r3, lbl_00011D00@ha
/* 000117D4 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 000117D8 6C008000 */ xoris r0, r0, 0x8000
/* 000117DC C00600A8 */ lfs f0, 0xa8(r6)
/* 000117E0 90010014 */ stw r0, 0x14(r1)
/* 000117E4 3C004330 */ lis r0, 0x4330
/* 000117E8 C8660030 */ lfd f3, 0x30(r6)
/* 000117EC 90010010 */ stw r0, 0x10(r1)
/* 000117F0 C8210010 */ lfd f1, 0x10(r1)
/* 000117F4 EC211028 */ fsubs f1, f1, f2
/* 000117F8 EC010024 */ fdivs f0, f1, f0
/* 000117FC FC030028 */ fsub f0, f3, f0
/* 00011800 FC000018 */ frsp f0, f0
/* 00011804 D004006C */ stfs f0, 0x6c(r4)
/* 00011808 A8040010 */ lha r0, 0x10(r4)
/* 0001180C 2C000000 */ cmpwi r0, 0
/* 00011810 4082000C */ bne lbl_0001181C
/* 00011814 38000000 */ li r0, 0
/* 00011818 90040048 */ stw r0, 0x48(r4)
lbl_0001181C:
/* 0001181C 38210018 */ addi r1, r1, 0x18
/* 00011820 4E800020 */ blr 
lbl_00011824:
/* 00011824 7C0802A6 */ mflr r0
/* 00011828 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0001182C 90010004 */ stw r0, 4(r1)
/* 00011830 9421FFE8 */ stwu r1, -0x18(r1)
/* 00011834 93E10014 */ stw r31, 0x14(r1)
/* 00011838 3BE40000 */ addi r31, r4, lbl_00011CB0@l
/* 0001183C 93C10010 */ stw r30, 0x10(r1)
/* 00011840 3BC30000 */ addi r30, r3, 0
/* 00011844 4BFEE945 */ bl reset_text_draw_settings
/* 00011848 C03E006C */ lfs f1, 0x6c(r30)
/* 0001184C 4BFEE93D */ bl set_text_opacity
/* 00011850 386000B1 */ li r3, 0xb1
/* 00011854 4BFEE935 */ bl set_text_font
/* 00011858 38600000 */ li r3, 0
/* 0001185C 4BFEE92D */ bl set_text_mul_color
/* 00011860 C03E0040 */ lfs f1, 0x40(r30)
/* 00011864 C05E0044 */ lfs f2, 0x44(r30)
/* 00011868 4BFEE921 */ bl set_text_scale
/* 0001186C C03E0004 */ lfs f1, 4(r30)
/* 00011870 C05E0008 */ lfs f2, 8(r30)
/* 00011874 4BFEE915 */ bl set_text_pos
/* 00011878 387E008C */ addi r3, r30, 0x8c
/* 0001187C 4BFEE90D */ bl u_draw_text
/* 00011880 38600001 */ li r3, 1
/* 00011884 4BFEE905 */ bl set_text_font
/* 00011888 3C600100 */ lis r3, 0x100
/* 0001188C 3863FF00 */ addi r3, r3, -256  ;# fixed addi
/* 00011890 4BFEE8F9 */ bl set_text_mul_color
/* 00011894 C03F04A4 */ lfs f1, 0x4a4(r31)
/* 00011898 FC400890 */ fmr f2, f1
/* 0001189C 4BFEE8ED */ bl set_text_scale
/* 000118A0 C03F04A8 */ lfs f1, 0x4a8(r31)
/* 000118A4 C01E0004 */ lfs f0, 4(r30)
/* 000118A8 C05E0008 */ lfs f2, 8(r30)
/* 000118AC EC21002A */ fadds f1, f1, f0
/* 000118B0 4BFEE8D9 */ bl set_text_pos
/* 000118B4 3C600000 */ lis r3, g_totalPlayPoints@ha
/* 000118B8 4CC63182 */ crclr 6
/* 000118BC 3CA00000 */ lis r5, lbl_00017490@ha
/* 000118C0 80830000 */ lwz r4, g_totalPlayPoints@l(r3)
/* 000118C4 38650000 */ addi r3, r5, lbl_00017490@l
/* 000118C8 4BFEE8C1 */ bl func_80072AC0
/* 000118CC 8001001C */ lwz r0, 0x1c(r1)
/* 000118D0 83E10014 */ lwz r31, 0x14(r1)
/* 000118D4 83C10010 */ lwz r30, 0x10(r1)
/* 000118D8 7C0803A6 */ mtlr r0
/* 000118DC 38210018 */ addi r1, r1, 0x18
/* 000118E0 4E800020 */ blr 

glabel lbl_000118E4
/* 000118E4 7C0802A6 */ mflr r0
/* 000118E8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000118EC 90010004 */ stw r0, 4(r1)
/* 000118F0 3C800000 */ lis r4, lbl_00012160@ha
/* 000118F4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000118F8 9421FFD8 */ stwu r1, -0x28(r1)
/* 000118FC DBE10020 */ stfd f31, 0x20(r1)
/* 00011900 DBC10018 */ stfd f30, 0x18(r1)
/* 00011904 93E10014 */ stw r31, 0x14(r1)
/* 00011908 3BE40000 */ addi r31, r4, lbl_00012160@l
/* 0001190C 93C10010 */ stw r30, 0x10(r1)
/* 00011910 93A1000C */ stw r29, 0xc(r1)
/* 00011914 C81F0000 */ lfd f0, 0(r31)
/* 00011918 C02300F8 */ lfs f1, 0xf8(r3)
/* 0001191C FC010040 */ fcmpo cr0, f1, f0
/* 00011920 40800008 */ bge lbl_00011928
/* 00011924 48000008 */ b lbl_0001192C
lbl_00011928:
/* 00011928 FC200090 */ fmr f1, f0
lbl_0001192C:
/* 0001192C FFE00818 */ frsp f31, f1
/* 00011930 C01F0008 */ lfs f0, 8(r31)
/* 00011934 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00011938 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0001193C FC1F0040 */ fcmpo cr0, f31, f0
/* 00011940 C3C30100 */ lfs f30, 0x100(r3)
/* 00011944 40800030 */ bge lbl_00011974
/* 00011948 EC3EF82A */ fadds f1, f30, f31
/* 0001194C FC010040 */ fcmpo cr0, f1, f0
/* 00011950 40800008 */ bge lbl_00011958
/* 00011954 48000018 */ b lbl_0001196C
lbl_00011958:
/* 00011958 C01F000C */ lfs f0, 0xc(r31)
/* 0001195C FC010040 */ fcmpo cr0, f1, f0
/* 00011960 40810008 */ ble lbl_00011968
/* 00011964 48000008 */ b lbl_0001196C
lbl_00011968:
/* 00011968 FC000890 */ fmr f0, f1
lbl_0001196C:
/* 0001196C FFC00090 */ fmr f30, f0
/* 00011970 C3FF0008 */ lfs f31, 8(r31)
lbl_00011974:
/* 00011974 4BFEE815 */ bl is_load_queue_not_empty
/* 00011978 2C030000 */ cmpwi r3, 0
/* 0001197C 41820008 */ beq lbl_00011984
/* 00011980 C3DF0008 */ lfs f30, 8(r31)
lbl_00011984:
/* 00011984 C03F0008 */ lfs f1, 8(r31)
/* 00011988 FC01F000 */ fcmpu cr0, f1, f30
/* 0001198C 40820024 */ bne lbl_000119B0
/* 00011990 C07F0010 */ lfs f3, 0x10(r31)
/* 00011994 FC400890 */ fmr f2, f1
/* 00011998 38600000 */ li r3, 0
/* 0001199C FC801890 */ fmr f4, f3
/* 000119A0 4BFEE7E9 */ bl setup_camera_viewport
/* 000119A4 38600000 */ li r3, 0
/* 000119A8 4BFEE7E1 */ bl camera_apply_viewport
/* 000119AC 48000190 */ b lbl_00011B3C
lbl_000119B0:
/* 000119B0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000119B4 C07F000C */ lfs f3, 0xc(r31)
/* 000119B8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000119BC C09F0014 */ lfs f4, 0x14(r31)
/* 000119C0 C04300FC */ lfs f2, 0xfc(r3)
/* 000119C4 EC3F1824 */ fdivs f1, f31, f3
/* 000119C8 C0030104 */ lfs f0, 0x104(r3)
/* 000119CC 38600000 */ li r3, 0
/* 000119D0 EC422024 */ fdivs f2, f2, f4
/* 000119D4 EC7E1824 */ fdivs f3, f30, f3
/* 000119D8 EC802024 */ fdivs f4, f0, f4
/* 000119DC 4BFEE7AD */ bl setup_camera_viewport
/* 000119E0 38600000 */ li r3, 0
/* 000119E4 4BFEE7A5 */ bl camera_apply_viewport
/* 000119E8 4BFEE7A1 */ bl func_80054FF0
/* 000119EC 3C600000 */ lis r3, modeCtrl@ha
/* 000119F0 38630000 */ addi r3, r3, modeCtrl@l
/* 000119F4 80030028 */ lwz r0, 0x28(r3)
/* 000119F8 2C000004 */ cmpwi r0, 4
/* 000119FC 41820040 */ beq lbl_00011A3C
/* 00011A00 4BFEE789 */ bl mathutil_mtxA_from_mtxB
/* 00011A04 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00011A08 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00011A0C 80630000 */ lwz r3, 0(r3)
/* 00011A10 80630010 */ lwz r3, 0x10(r3)
/* 00011A14 4BFEE775 */ bl mathutil_mtxA_translate
/* 00011A18 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00011A1C 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 00011A20 5403482C */ slwi r3, r0, 9
/* 00011A24 4BFEE765 */ bl mathutil_mtxA_rotate_y
/* 00011A28 3C600000 */ lis r3, g_commonNlObj@ha
/* 00011A2C 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00011A30 80630000 */ lwz r3, 0(r3)
/* 00011A34 8063002C */ lwz r3, 0x2c(r3)
/* 00011A38 4BFEE751 */ bl nl2ngc_draw_model_sort_translucent_alt2
lbl_00011A3C:
/* 00011A3C 4BFEE74D */ bl stage_draw
/* 00011A40 3C600000 */ lis r3, eventInfo@ha
/* 00011A44 38630000 */ addi r3, r3, eventInfo@l
/* 00011A48 880301C8 */ lbz r0, 0x1c8(r3)
/* 00011A4C 2C000002 */ cmpwi r0, 2
/* 00011A50 40820018 */ bne lbl_00011A68
/* 00011A54 C03F0018 */ lfs f1, 0x18(r31)
/* 00011A58 4BFEE731 */ bl ord_tbl_set_depth_offset
/* 00011A5C 4BFEE72D */ bl background_draw
/* 00011A60 C03F0008 */ lfs f1, 8(r31)
/* 00011A64 4BFEE725 */ bl ord_tbl_set_depth_offset
lbl_00011A68:
/* 00011A68 3C600000 */ lis r3, eventInfo@ha
/* 00011A6C 38630000 */ addi r3, r3, eventInfo@l
/* 00011A70 880301E0 */ lbz r0, 0x1e0(r3)
/* 00011A74 3BC301E0 */ addi r30, r3, 0x1e0
/* 00011A78 2C000002 */ cmpwi r0, 2
/* 00011A7C 4082000C */ bne lbl_00011A88
/* 00011A80 38600010 */ li r3, 0x10
/* 00011A84 4BFEE705 */ bl rend_efc_draw
lbl_00011A88:
/* 00011A88 3C600000 */ lis r3, eventInfo@ha
/* 00011A8C 38630000 */ addi r3, r3, eventInfo@l
/* 00011A90 88030078 */ lbz r0, 0x78(r3)
/* 00011A94 2C000002 */ cmpwi r0, 2
/* 00011A98 40820008 */ bne lbl_00011AA0
/* 00011A9C 4BFEE6ED */ bl item_draw
lbl_00011AA0:
/* 00011AA0 3C600000 */ lis r3, eventInfo@ha
/* 00011AA4 38630000 */ addi r3, r3, eventInfo@l
/* 00011AA8 88030060 */ lbz r0, 0x60(r3)
/* 00011AAC 2C000002 */ cmpwi r0, 2
/* 00011AB0 40820008 */ bne lbl_00011AB8
/* 00011AB4 4BFEE6D5 */ bl stobj_draw
lbl_00011AB8:
/* 00011AB8 3C600000 */ lis r3, eventInfo@ha
/* 00011ABC 38630000 */ addi r3, r3, eventInfo@l
/* 00011AC0 88030138 */ lbz r0, 0x138(r3)
/* 00011AC4 2C000002 */ cmpwi r0, 2
/* 00011AC8 40820008 */ bne lbl_00011AD0
/* 00011ACC 4BFEE6BD */ bl effect_draw
lbl_00011AD0:
/* 00011AD0 3C600000 */ lis r3, backgroundInfo@ha
/* 00011AD4 38630000 */ addi r3, r3, backgroundInfo@l
/* 00011AD8 80030008 */ lwz r0, 8(r3)
/* 00011ADC 3BA30008 */ addi r29, r3, 8
/* 00011AE0 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011AE4 4182000C */ beq lbl_00011AF0
/* 00011AE8 38600000 */ li r3, 0
/* 00011AEC 4BFEE69D */ bl u_something_with_lens_flare_1
lbl_00011AF0:
/* 00011AF0 4BFEE699 */ bl ord_tbl_draw_nodes
/* 00011AF4 801D0000 */ lwz r0, 0(r29)
/* 00011AF8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011AFC 4182000C */ beq lbl_00011B08
/* 00011B00 38600000 */ li r3, 0
/* 00011B04 4BFEE685 */ bl u_something_with_lens_flare_2
lbl_00011B08:
/* 00011B08 881E0000 */ lbz r0, 0(r30)
/* 00011B0C 2C000002 */ cmpwi r0, 2
/* 00011B10 4082000C */ bne lbl_00011B1C
/* 00011B14 38600008 */ li r3, 8
/* 00011B18 4BFEE671 */ bl rend_efc_draw
lbl_00011B1C:
/* 00011B1C C03F0008 */ lfs f1, 8(r31)
/* 00011B20 38600000 */ li r3, 0
/* 00011B24 C07F0010 */ lfs f3, 0x10(r31)
/* 00011B28 FC400890 */ fmr f2, f1
/* 00011B2C FC801890 */ fmr f4, f3
/* 00011B30 4BFEE659 */ bl setup_camera_viewport
/* 00011B34 38600000 */ li r3, 0
/* 00011B38 4BFEE651 */ bl camera_apply_viewport
lbl_00011B3C:
/* 00011B3C 8001002C */ lwz r0, 0x2c(r1)
/* 00011B40 CBE10020 */ lfd f31, 0x20(r1)
/* 00011B44 CBC10018 */ lfd f30, 0x18(r1)
/* 00011B48 7C0803A6 */ mtlr r0
/* 00011B4C 83E10014 */ lwz r31, 0x14(r1)
/* 00011B50 83C10010 */ lwz r30, 0x10(r1)
/* 00011B54 83A1000C */ lwz r29, 0xc(r1)
/* 00011B58 38210028 */ addi r1, r1, 0x28
/* 00011B5C 4E800020 */ blr 

# 2
.section .ctors
    # 0x11B60
#    .4byte 0x00000000

# 3
.section .dtors
    # 0x11B64
#    .4byte 0x00000000

# 4
.section .rodata
lbl_00011B68:
    # 0x11B68
    .4byte 0x85888687
    .4byte 0x838A0000
    .4byte 0x0000008F
    .4byte 0x00000090
    .4byte 0x00000091
    .4byte 0x3E800000
    .4byte 0x4043A000
    .4byte 0x00000000
    .4byte 0x43400000
    .4byte 0x430E0000
    .4byte 0x3D8F5C29
    .4byte 0x42140000
    .4byte 0x41E00000
    .4byte 0x433C0000
    .4byte 0x42C00000
    .4byte 0x42900000
    .4byte 0x43480000
    .4byte 0x43160000
    .4byte 0x432C0000
    .4byte 0x43000000
    .4byte 0x42700000
    .4byte 0x42300000
lbl_00011BC0:
    # 0x11BC0
    .4byte 0x43300000
    .4byte 0x80000000
lbl_00011BC8:
    # 0x11BC8
    .4byte 0x00000000
    .4byte 0xBDF5C28F
    .4byte 0x00000000
lbl_00011BD4:
    # 0x11BD4
    .4byte 0x00000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x40530000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x40596000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x40448000
    .4byte 0x00000000
    .4byte 0x40540000
    .4byte 0x00000000
    .4byte 0x405DC000
    .4byte 0x00000000
    .4byte 0x4063C000
    .4byte 0x00000000
    .4byte 0x4070C000
    .4byte 0x00000000
    .4byte 0x40550000
    .4byte 0x00000000
    .4byte 0x40500000
    .4byte 0x00000000
lbl_00011C40:
    # 0x11C40
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x4074A000
    .4byte 0x00000000
    .4byte 0x40180000
    .4byte 0x00000000
    .4byte 0x405B0000
    .4byte 0x00000000
    .4byte 0x406A4000
    .4byte 0x00000000
    .4byte 0x40710000
    .4byte 0x00000000
    .4byte 0x40670000
    .4byte 0x00000000
    .4byte 0x4076A000
    .4byte 0x00000000
    .4byte 0x40756000
    .4byte 0x00000000
    .4byte 0x4062C000
    .4byte 0x00000000
    .4byte 0x40798000
    .4byte 0x00000000
    .4byte 0x407DA000
    .4byte 0x00000000
    .4byte 0x461B7800
    .4byte 0x44200000
    .4byte 0x43F00000
    .4byte 0x00000000
lbl_00011CB0:
    # 0x11CB0
    .4byte 0x3FB99999
    .4byte 0x9999999A
lbl_00011CB8:
    # 0x11CB8
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x437F0000
    .4byte 0x43A00000
    .4byte 0x4370199A
    .4byte 0x461C4000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x3FF570A3
    .4byte 0xD70A3D71
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x461AB000
    .4byte 0x3DCCCCCD
    .4byte 0x3F4CCCCD
    .4byte 0x3D4CCCCD
    .4byte 0x3F666666
    .4byte 0x00000000
lbl_00011D00:
    # 0x11D00
    .4byte 0x43300000
    .4byte 0x80000000
lbl_00011D08:
    # 0x11D08
    .4byte 0x3FB33333
    .4byte 0x33333333
    .4byte 0xBFE00000
    .4byte 0x00000000
    .4byte 0x40786000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x43560000
    .4byte 0x41980000
    .4byte 0x3DE147AE
    .4byte 0x41A00000
    .4byte 0x3F19999A
    .4byte 0x40333333
    .4byte 0x33333333
    .4byte 0x3F333333
lbl_00011D44:
    # 0x11D44
    .4byte 0x41F00000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40C00000
    .4byte 0x43340000
    .4byte 0x41700000
    .4byte 0x41D00000
    .4byte 0x406FE000
    .4byte 0x00000000
    .4byte 0x42600000
    .4byte 0xC0800000
    .4byte 0x43280000
    .4byte 0xC1000000
    .4byte 0x438C0000
    .4byte 0xC0800000
    .4byte 0x42600000
    .4byte 0xC0800000
    .4byte 0x43280000
    .4byte 0xC1000000
    .4byte 0x438C0000
    .4byte 0xC0800000
    .4byte 0x42880000
    .4byte 0xC0800000
    .4byte 0x42880000
    .4byte 0xC0800000
    .4byte 0x42880000
    .4byte 0xC0800000
    .4byte 0x00000418
    .4byte 0x00000423
    .4byte 0x00000424
    .4byte 0x00000418
    .4byte 0x00000423
    .4byte 0x00000424
    .4byte 0x00000419
    .4byte 0x00000419
    .4byte 0x00000419
    .4byte 0x0000041C
    .4byte 0x0000041E
    .4byte 0x00000420
    .4byte 0x00000401
    .4byte 0x00000403
    .4byte 0x00000426
    .4byte 0x00000421
    .4byte 0x00000421
    .4byte 0x00000421
    .4byte 0x0000041B
    .4byte 0x0000041D
    .4byte 0x0000041F
    .4byte 0x00000400
    .4byte 0x00000402
    .4byte 0x00000425
    .4byte 0x00000421
    .4byte 0x00000421
    .4byte 0x00000421
    .4byte 0x43280000
    .4byte 0x42B00000
    .4byte 0x00000000
    .4byte 0xBFA99999
    .4byte 0x9999999A
    .4byte 0x3FC33333
    .4byte 0x33333333
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x40600000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x41400000
    .4byte 0x41600000
    .4byte 0x41100000
    .4byte 0x3FA99999
    .4byte 0x9999999A
    .4byte 0x3FB0A3D7
    .4byte 0x3FCCCCCD
lbl_00011E70:
    # 0x11E70
    .4byte lbl_000167D8
    .4byte lbl_000167DC
    .4byte lbl_000167E0
lbl_00011E7C:
    # 0x11E7C
    .4byte lbl_000167E4
    .4byte lbl_000167EC
    .4byte lbl_000167F4
    .4byte lbl_000167FC
    .4byte lbl_00016804
    .4byte 0x3F50624D
    .4byte 0xD2F1A9FC
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x406CC000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0x40666666
    .4byte 0x3DB851EC
    .4byte 0x41800000
    .4byte 0x42900000
    .4byte 0x43060000
    .4byte 0x42440000
    .4byte 0x00000000
lbl_00011EC8:
    # 0x11EC8
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41C00000
    .4byte 0x42400000
    .4byte 0x42900000
    .4byte 0x42C00000
    .4byte 0x42C00000
    .4byte 0x43720000
    .4byte 0x43800000
    .4byte 0x43880000
    .4byte 0x43900000
    .4byte 0x43988000
    .4byte 0x43988000
    .4byte 0x43988000
    .4byte 0x43988000
    .4byte 0x43988000
    .4byte 0x43988000
    .4byte 0x43400000
    .4byte 0x43400000
    .4byte 0x43400000
    .4byte 0x43400000
    .4byte 0x43400000
    .4byte 0x430F0000
    .4byte 0x42C00000
    .4byte 0x42480000
    .4byte 0x40800000
    .4byte 0x00000000
    .4byte 0x43040000
    .4byte 0x42CC0000
    .4byte 0x428A0000
    .4byte 0x42100000
    .4byte 0x40800000
    .4byte 0x40800000
    .4byte 0x40800000
    .4byte 0x40800000
    .4byte 0x40800000
    .4byte 0x40800000
    .4byte 0x3FAB851F
    .4byte 0x41C00000
    .4byte 0x40584000
    .4byte 0x00000000
    .4byte 0x44390000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x3FC99999
    .4byte 0x9999999A
    .4byte 0x3FF0C083
    .4byte 0x126E978D
    .4byte 0x3FF0978D
    .4byte 0x4FDF3B64
    .4byte 0x3FF08B43
    .4byte 0x95810625
    .4byte 0x429C0000
    .4byte 0x41000000
    .4byte 0x405FC000
    .4byte 0x00000000
    .4byte 0x41880000
    .4byte 0x00000000
    .4byte 0x3FF1851E
    .4byte 0xB851EB85
    .4byte 0x3FF2A7EF
    .4byte 0x9DB22D0E
    .4byte 0x3F947AE1
    .4byte 0x47AE147B
    .4byte 0x42780000
    .4byte 0x43140000
    .4byte 0x430C0000
    .4byte 0x4414C000
    .4byte 0x43848000
    .4byte 0x43730000
    .4byte 0x42EE0000
    .4byte 0xC3870000
    .4byte 0x42C80000
    .4byte 0x00000000
    .4byte 0x40490000
    .4byte 0x00000000
    .4byte 0x3FFE6666
    .4byte 0x66666666
    .4byte 0x3FFD9999
    .4byte 0x9999999A
    .4byte 0x3FF80000
    .4byte 0x00000000
lbl_00012030:
    # 0x12030
    .4byte 0x43440000
lbl_00012034:
    # 0x12034
    .4byte 0x42380000
lbl_00012038:
    # 0x12038
    .4byte 0x42DC0000
lbl_0001203C:
    # 0x1203C
    .4byte 0x42800000
    .4byte 0x42200000
    .4byte 0x43CD0000
    .4byte 0x423C0000
    .4byte 0x439A0000
    .4byte 0x434E0000
    .4byte 0x3F400000
    .4byte 0x3FE66666
    .4byte 0x66666666
    .4byte 0xC2600000
    .4byte 0x3ECCCCCD
    .4byte 0x42880000
    .4byte 0x43080000
    .4byte 0x3FE80000
    .4byte 0x00000000
    .4byte 0x3FF19999
    .4byte 0x9999999A
    .4byte 0x435C0000
    .4byte 0x00000000
    .4byte 0x3FF4CCCC
    .4byte 0xCCCCCCCD
    .4byte 0x42F00000
    .4byte 0x00000000
    .4byte 0x3FD99999
    .4byte 0x9999999A
    .4byte 0x40580000
    .4byte 0x00000000
    .4byte 0x3FE99999
    .4byte 0x9999999A
    .4byte 0x3FE33333
    .4byte 0x33333333
    .4byte 0xC0A00000
    .4byte 0x421C0000
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x3FA47AE1
    .4byte 0x47AE147B
    .4byte 0x40100000
    .4byte 0x00000000
    .4byte 0x40840000
    .4byte 0x00000000
    .4byte 0xC0740000
    .4byte 0x00000000
    .4byte 0x3FF66666
    .4byte 0x66666666
    .4byte 0x0000042C
    .4byte 0x0000042B
    .4byte 0x0000042D
lbl_000120FC:
    # 0x120FC
    .4byte 0xC44F0000
    .4byte 0x43040000
    .4byte 0x43040000
    .4byte 0x43040000
    .4byte 0x44888000
    .4byte 0xC44F0000
lbl_00012114:
    # 0x12114
    .4byte 0xC4200000
    .4byte 0x43A00000
    .4byte 0x43A00000
    .4byte 0x43A00000
    .4byte 0x44A00000
    .4byte 0xC4200000
lbl_0001212C:
    # 0x1212C
    .4byte 0xC3E20000
    .4byte 0x43FE0000
    .4byte 0x43FE0000
    .4byte 0x43FE0000
    .4byte 0x44B78000
    .4byte 0xC3E20000
    .4byte 0x436A0000
    .4byte 0x44310000
    .4byte 0xC2880000
    .4byte 0x42D80000
    .4byte 0x3FC00000
    .4byte 0x43570000
    .4byte 0x00000000
lbl_00012160:
    # 0x12160
    .4byte 0x40840800
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x44200000
    .4byte 0x3F800000
    .4byte 0x43E00000
    .4byte 0x43C80000

# 5
.section .data
.if 0
lbl_00012180:
    # 0x12180
    .asciz "RELOCATION SEL_NGC LOADED"
.endif
.if 0
lbl_0001219C:
    # 0x1219C
    .asciz "RELOCATION SEL_NGC PURGED"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "sel_ngc_rel.c"
    .balign 4
    .4byte 0x0A000000
.endif
.if 0
lbl_00012238:
    # 0x12238
    .4byte lbl_00000608
    .4byte lbl_000008C4
    .4byte lbl_00000B80
    .4byte lbl_00000E3C
    .4byte lbl_000010F8
    .4byte lbl_00001294
    .4byte lbl_00001430
    .4byte lbl_000015CC
    .4byte lbl_00001768
lbl_0001225C:
    # 0x1225C
    .asciz "b/c/0xff0000/a/Please do not insert or\nb/c/0xff0000/a/disconnect the controller(s)."
.endif
blah:
    .asciz "compe stage 0 set error\n"
    .balign 4
    .4byte 0xBFCB851F
    .4byte 0xBF07AE14
    .4byte 0x3F07AE14
    .4byte 0x3FCB851F
    .asciz "spr_bg/bg_fgt.gct"
    .balign 4
    .asciz "spr_bg/bg_tgt.gct"
    .balign 4
    .asciz "init/m_fight.gma"
    .balign 4
    .asciz "init/m_fight.tpl"
    .balign 4
    .asciz "bmp/bmp_fgt.tpl"
    .asciz "snd/mkb/fight.samp"
    .balign 4
    .asciz "init/m_pilot.gma"
    .balign 4
    .asciz "init/m_pilot.tpl"
    .balign 4
    .asciz "bmp/bmp_tgt.tpl"
    .asciz "b/c/0xff0000/a/Please insert more controllers."
    .balign 4
    .asciz "compe stage init first error\n"
    .balign 4
    .asciz "compe stage chk error\n"
    .balign 4
    .asciz "PREV INIT sel:%d crs:%d stg:%d flag:%d load:%d\n"
    .asciz "preview/192x132.tpl"
    .asciz "preview/38x26.tpl"
    .balign 4
    .asciz "preview/192x178.tpl"
    .asciz "compe stage init error\n"
    .asciz "spr_bg/bg_rac.gct"
    .balign 4
    .asciz "init/m_race.gma"
    .asciz "init/m_race.tpl"
    .asciz "bmp/bmp_rac.tpl"
    .asciz "snd/mkb/race.samp"
    .balign 4
    .asciz "preview/96x68.tpl"
    .balign 4
    .asciz "preview/200x140.tpl"
    .asciz "preview/172x120.tpl"
    .asciz "preview/60x42.tpl"
    .balign 4
    .asciz "spr_bg/bg_bil.gct"
    .balign 4
    .asciz "init/m_bill.gma"
    .asciz "init/m_bill.tpl"
    .asciz "bmp/bmp_bil.tpl"
    .asciz "spr_bg/bg_bwl.gct"
    .balign 4
    .asciz "init/m_bowl.gma"
    .asciz "init/m_bowl.tpl"
    .asciz "bmp/bmp_bwl.tpl"
    .asciz "spr_bg/bg_glf.gct"
    .balign 4
    .asciz "init/m_golf.gma"
    .asciz "init/m_golf.tpl"
    .asciz "bmp/bmp_glf.tpl"
    .asciz "snd/mkb/golf.samp"
    .balign 4
lbl_000125FC:
    # 0x125FC
    .4byte lbl_00009664
    .4byte lbl_00009664
    .4byte lbl_00009664
    .4byte lbl_00009684
    .4byte lbl_000096A4
    .4byte lbl_000096C4
    .4byte lbl_000096E4
    .4byte lbl_00009704
    .4byte lbl_00009724
lbl_00012620:
    # 0x12620
    .4byte lbl_00004DB8
    .4byte lbl_00004DCC
    .4byte lbl_00004DE0
    .4byte lbl_00004DF4
    .4byte lbl_00004E40
    .4byte lbl_00004E7C
    .4byte lbl_00004E68
    .4byte lbl_00004E90
    .4byte lbl_00004E54
lbl_00012644:
    # 0x12644
    .4byte lbl_00003548
    .4byte lbl_000035C8
    .4byte lbl_0000368C
    .4byte lbl_00003714
    .4byte lbl_00003774
    .4byte lbl_000037AC
    .4byte lbl_000037C8
    .4byte lbl_000037F0
    .4byte lbl_0000382C
    .4byte lbl_000038F4
    .4byte lbl_00003954
    .4byte lbl_00003BAC
    .4byte lbl_00003C90
    .4byte lbl_00003DE4
    .4byte lbl_00003EF0
    .4byte lbl_000041B4
    .4byte lbl_0000430C
    .4byte lbl_00004768
    .4byte lbl_00004854
    .4byte lbl_00004EA4
    .4byte lbl_00004F18
    .4byte lbl_000052E8
    .4byte lbl_00005390
    .4byte lbl_0000554C
    .4byte lbl_00005C20
    .4byte lbl_00005E44
    .4byte lbl_00006BDC
    .4byte lbl_00006CB0
    .4byte lbl_000071A4
    .4byte lbl_000071FC
    .4byte lbl_00007314
    .4byte lbl_0000751C
    .4byte lbl_000076DC
    .4byte lbl_00007820
    .4byte lbl_00007C3C
    .4byte lbl_00007EA4
    .4byte lbl_00007FE8
    .4byte lbl_000081D4
    .4byte lbl_000082EC
    .4byte lbl_00008504
    .4byte lbl_000085A0
    .4byte lbl_00008878
    .4byte lbl_000088D0
    .4byte lbl_000089B4
    .4byte lbl_00008A94
    .4byte lbl_00008D98
    .4byte lbl_00008DF0
    .4byte lbl_00008EE0
    .4byte lbl_00008F38
    .4byte lbl_0000906C
    .4byte lbl_00009108
    .4byte lbl_00009380
    .4byte lbl_0000951C
    .4byte lbl_00009574
    .4byte lbl_00009590
    .4byte lbl_00009744
    .4byte lbl_00009764
    .4byte lbl_000097B8
    .4byte lbl_000097D4
lbl_00012730:
    # 0x12730
    .asciz "sel_ngc_disp str buf error : %s"
    .asciz "ERROR"
    .balign 4
    .4byte 0x43A00000
    .4byte 0x43C40000
    .4byte 0x43A00000
    .4byte 0x44180000
    .4byte 0x43A00000
    .4byte 0x43420000
    .4byte 0x44938000
    .4byte 0x43420000
    .4byte 0x435A0000
    .4byte 0x43B70000
    .4byte 0xC3A80000
    .4byte 0x43B70000
    .4byte 0x43A00000
    .4byte 0x436A0000
    .4byte 0xC4080000
    .4byte 0x436A0000
lbl_00012798:
    # 0x12798
    .4byte 0x44568000
    .4byte 0x43A60000
    .4byte 0x43F50000
    .4byte 0x43A60000
    .4byte 0x43F50000
    .4byte 0x43A60000
    .4byte 0x44568000
    .4byte 0x43A60000
lbl_000127B8:
    # 0x127B8
    .4byte 0x44568000
    .4byte 0x43D70000
    .4byte 0x43F50000
    .4byte 0x43D70000
    .4byte 0x43F50000
    .4byte 0x43D70000
    .4byte 0x44568000
    .4byte 0x43D70000
lbl_000127D8:
    # 0x127D8
    .4byte 0x44930000
    .4byte 0x436D0000
    .4byte 0x43A00000
    .4byte 0x436D0000
    .4byte 0x43A00000
    .4byte 0x436D0000
    .4byte 0x44930000
    .4byte 0x436D0000
lbl_000127F8:
    # 0x127F8
    .4byte 0xC4080000
    .4byte 0x43B10000
    .4byte 0x43A00000
    .4byte 0x43B10000
    .4byte 0x43A00000
    .4byte 0x43B10000
    .4byte 0xC4080000
    .4byte 0x43B10000
    .4byte 0x626B6700
    .asciz "title"
    .balign 4
    .4byte 0x73747200
    .asciz "str2"
    .balign 4
    .asciz "str3"
    .balign 4
    .asciz "str4"
    .balign 4
    .asciz "komado l"
    .balign 4
    .asciz "komado l str"
    .balign 4
    .asciz "komado s"
    .balign 4
    .asciz "komado race"
    .asciz "komado race str"
    .asciz "komado race class"
    .balign 4
    .asciz "komado fight"
    .balign 4
    .asciz "komado fight str"
    .balign 4
lbl_000128BC:
    # 0x128BC
    .asciz "a/Mode Select"
    .balign 4
lbl_000128CC:
    # 0x128CC
    .asciz "a/Number of Players"
lbl_000128E0:
    # 0x128E0
    .asciz "a/Character Select"
    .balign 4
lbl_000128F4:
    # 0x128F4
    .asciz "a/Game Select"
    .balign 4
lbl_00012904:
    # 0x12904
    .asciz "a/Level Select"
    .balign 4
lbl_00012914:
    # 0x12914
    .asciz "a/Stage Select"
    .balign 4
lbl_00012924:
    # 0x12924
    .asciz "a/Gameplay Settings"
lbl_00012938:
    # 0x12938
    .asciz "a/Course Select"
lbl_00012948:
    # 0x12948
    .asciz "a/Mini Game Select"
    .balign 4
lbl_0001295C:
    # 0x1295C
    .asciz "a/Party Game Select"
lbl_00012970:
    # 0x12970
    .4byte lbl_000128BC
    .4byte lbl_000128CC
    .4byte lbl_000128E0
    .4byte lbl_000128F4
    .4byte lbl_00012904
    .4byte lbl_00012914
    .4byte lbl_00012924
    .4byte lbl_00012938
    .4byte lbl_00012948
    .4byte lbl_0001295C
lbl_00012998:
    # 0x12998
    .asciz "k/MO-DOSELEKUTO"
lbl_000129A8:
    # 0x129A8
    .asciz "h/NINNZUUk/SELEKUTO"
lbl_000129BC:
    # 0x129BC
    .asciz "k/KYARAKUTA-SELEKUTO"
    .balign 4
lbl_000129D4:
    # 0x129D4
    .asciz "k/GE-MUSELEKUTO"
lbl_000129E4:
    # 0x129E4
    .asciz "k/LEBELUSELEKUTO"
    .balign 4
lbl_000129F8:
    # 0x129F8
    .asciz "k/SUTE-JISELEKUTO"
    .balign 4
lbl_00012A0C:
    # 0x12A0C
    .asciz "k/GE-MUPUREIh/SETTEI"
    .balign 4
lbl_00012A24:
    # 0x12A24
    .asciz "k/KO-SUSELEKUTO"
lbl_00012A34:
    # 0x12A34
    .asciz "k/MINIGE-MUSELEKUTO"
lbl_00012A48:
    # 0x12A48
    .asciz "k/PA-TEXI-GE-MUSELEKUTO"
    .4byte lbl_00012998
    .4byte lbl_000129A8
    .4byte lbl_000129BC
    .4byte lbl_000129D4
    .4byte lbl_000129E4
    .4byte lbl_000129F8
    .4byte lbl_00012A0C
    .4byte lbl_00012A24
    .4byte lbl_00012A34
    .4byte lbl_00012A48
lbl_00012A88:
    # 0x12A88
    .asciz "a/You can play up to 4 players by taking turns!"
lbl_00012AB8:
    # 0x12AB8
    .asciz "a/If you play single player and collect Play"
    .balign 4
lbl_00012AE8:
    # 0x12AE8
    .asciz "a/Points, you will be able to open Mini Games."
    .balign 4
lbl_00012B18:
    # 0x12B18
    .4byte lbl_00012A88
    .4byte lbl_00012AB8
    .4byte lbl_00012AE8
    .4byte 0x00000000
lbl_00012B28:
    # 0x12B28
    .asciz "a/You can play with 2-4 players simultaneously!"
lbl_00012B58:
    # 0x12B58
    .asciz "a/You can choose whatever stage you want."
    .balign 4
lbl_00012B84:
    # 0x12B84
    .asciz "a/The first person to reach the goal wins!"
    .balign 4
lbl_00012BB0:
    # 0x12BB0
    .4byte lbl_00012B28
    .4byte lbl_00012B58
    .4byte lbl_00012B84
    .4byte 0x00000000
lbl_00012BC0:
    # 0x12BC0
    .asciz "a/This mode is only for 1 player."
    .balign 4
lbl_00012BE4:
    # 0x12BE4
    .asciz "a/You can play all the stages that you've played"
    .balign 4
lbl_00012C18:
    # 0x12C18
    .asciz "a/before and practice as much as you want."
    .balign 4
lbl_00012C44:
    # 0x12C44
    .4byte lbl_00012BC0
    .4byte lbl_00012BE4
    .4byte lbl_00012C18
    .4byte 0x00000000
lbl_00012C54:
    # 0x12C54
    .asciz "a/You haven't played any stages in Normal Mode,"
lbl_00012C84:
    # 0x12C84
    .asciz "a/so you can't play this mode yet."
    .balign 4
lbl_00012CA8:
    # 0x12CA8
    .4byte lbl_00012C54
    .4byte lbl_00012C84
    .4byte 0x00000000
lbl_00012CB4:
    # 0x12CB4
    .asciz "a/so you can't practice yet."
    .balign 4
lbl_00012CD4:
    # 0x12CD4
    .4byte lbl_00012C54
    .4byte lbl_00012CB4
    .4byte 0x00000000
lbl_00012CE0:
    # 0x12CE0
    .asciz "a/More mini games will become available when"
    .balign 4
lbl_00012D10:
    # 0x12D10
    .asciz "a/you collect more Play Points playing 1 player."
    .balign 4
lbl_00012D44:
    # 0x12D44
    .4byte lbl_00012A88
    .4byte lbl_00012CE0
    .4byte lbl_00012D10
    .4byte 0x00000000
lbl_00012D54:
    # 0x12D54
    .4byte lbl_00012A88
    .4byte lbl_00012CE0
    .4byte lbl_00012D10
    .4byte 0x00000000
lbl_00012D64:
    # 0x12D64
    .asciz "a/You can take turns with up to"
lbl_00012D84:
    # 0x12D84
    .asciz "a/four players and see how fast"
lbl_00012DA4:
    # 0x12DA4
    .asciz "a/you can each reach the goal!"
    .balign 4
lbl_00012DC4:
    # 0x12DC4
    .4byte lbl_00012D64
    .4byte lbl_00012D84
    .4byte lbl_00012DA4
    .4byte 0x00000000
lbl_00012DD4:
    # 0x12DD4
    .4byte lbl_00012D64
    .4byte lbl_00012D84
    .4byte lbl_00012DA4
    .4byte 0x00000000
lbl_00012DE4:
    # 0x12DE4
    .asciz "a/You can play with up to 4 players."
    .balign 4
lbl_00012E0C:
    # 0x12E0C
    .4byte lbl_00012DE4
    .4byte 0x00000000
lbl_00012E14:
    # 0x12E14
    .asciz "a/*You will receive Play Points."
    .balign 4
lbl_00012E38:
    # 0x12E38
    .4byte lbl_00012DE4
    .4byte lbl_00012E14
    .4byte 0x00000000
lbl_00012E44:
    # 0x12E44
    .asciz "a/*You will not receive Play Points."
    .balign 4
lbl_00012E6C:
    # 0x12E6C
    .4byte lbl_00012DE4
    .4byte lbl_00012E44
    .4byte 0x00000000
lbl_00012E78:
    # 0x12E78
    .asciz "a/Please select the character"
    .balign 4
lbl_00012E98:
    # 0x12E98
    .asciz "a/you wish to use with"
    .balign 4
lbl_00012EB0:
    # 0x12EB0
    .asciz "a/your own controller."
    .balign 4
lbl_00012EC8:
    # 0x12EC8
    .4byte lbl_00012E78
    .4byte lbl_00012E98
    .4byte lbl_00012EB0
    .4byte 0x00000000
lbl_00012ED8:
    # 0x12ED8
    .asciz "a/Please select a character"
lbl_00012EF4:
    # 0x12EF4
    .asciz "a/for the COM."
    .balign 4
lbl_00012F04:
    # 0x12F04
    .4byte 0x20000000
lbl_00012F08:
    # 0x12F08
    .4byte lbl_00012ED8
    .4byte lbl_00012EF4
    .4byte lbl_00012F04
    .4byte 0x00000000
lbl_00012F18:
    # 0x12F18
    .asciz "a/you wish to use."
    .balign 4
lbl_00012F2C:
    # 0x12F2C
    .asciz "a/The game will start."
    .balign 4
lbl_00012F44:
    # 0x12F44
    .4byte lbl_00012E78
    .4byte lbl_00012F18
    .4byte lbl_00012F2C
    .4byte 0x00000000
lbl_00012F54:
    # 0x12F54
    .asciz "a/If you insert more controllers,"
    .balign 4
lbl_00012F78:
    # 0x12F78
    .asciz "a/you can play with up to 4 players."
    .balign 4
lbl_00012FA0:
    # 0x12FA0
    .4byte lbl_00012F54
    .4byte lbl_00012F78
    .4byte 0x00000000
lbl_00012FAC:
    # 0x12FAC
    .asciz "a/Make sure to guide the monkeys"
    .balign 4
lbl_00012FD0:
    # 0x12FD0
    .asciz "a/in the balls to the goal"
    .balign 4
lbl_00012FEC:
    # 0x12FEC
    .asciz "a/as quickly as possible!"
    .balign 4
lbl_00013008:
    # 0x13008
    .4byte lbl_00012FAC
    .4byte lbl_00012FD0
    .4byte lbl_00012FEC
    .4byte 0x00000000
lbl_00013018:
    # 0x13018
    .asciz "a/Besides being able to play a single player"
    .balign 4
lbl_00013048:
    # 0x13048
    .asciz "a/game, you can also play 4 player games!"
    .balign 4
lbl_00013074:
    # 0x13074
    .asciz "a/It's a great party game!"
    .balign 4
lbl_00013090:
    # 0x13090
    .4byte lbl_00013018
    .4byte lbl_00013048
    .4byte lbl_00013074
    .4byte 0x00000000
lbl_000130A0:
    # 0x130A0
    .asciz "a/If you play Normal Mode in the Main Game,"
lbl_000130CC:
    # 0x130CC
    .asciz "a/you can collect Play Points"
    .balign 4
lbl_000130EC:
    # 0x130EC
    .asciz "a/to open Mini Games."
    .balign 4
lbl_00013104:
    # 0x13104
    .4byte lbl_000130A0
    .4byte lbl_000130CC
    .4byte lbl_000130EC
    .4byte 0x00000000
lbl_00013114:
    # 0x13114
    .asciz "a/You cannot play the Mini Game yet."
    .balign 4
lbl_0001313C:
    # 0x1313C
    .asciz "a/Please play the 1 player"
    .balign 4
lbl_00013158:
    # 0x13158
    .asciz "a/Normal Mode first!"
    .balign 4
lbl_00013170:
    # 0x13170
    .4byte lbl_00013114
    .4byte lbl_0001313C
    .4byte lbl_00013158
    .4byte 0x00000000
lbl_00013180:
    # 0x13180
    .asciz "a/One mini game is available."
    .balign 4
lbl_000131A0:
    # 0x131A0
    .asciz "a/Play the 1 player Normal mode"
lbl_000131C0:
    # 0x131C0
    .asciz "a/in the Main game."
lbl_000131D4:
    # 0x131D4
    .4byte lbl_00013180
    .4byte lbl_000131A0
    .4byte lbl_000131C0
    .4byte 0x00000000
lbl_000131E4:
    # 0x131E4
    .asciz "a/Two mini game is available."
    .balign 4
lbl_00013204:
    # 0x13204
    .4byte lbl_000131E4
    .4byte lbl_000131A0
    .4byte lbl_000131C0
    .4byte 0x00000000
lbl_00013214:
    # 0x13214
    .asciz "a/Three mini games are available. When"
    .balign 4
lbl_0001323C:
    # 0x1323C
    .asciz "a/you collect more Play Points, the number of"
    .balign 4
lbl_0001326C:
    # 0x1326C
    .asciz "a/continues in the game will increase."
    .balign 4
lbl_00013294:
    # 0x13294
    .4byte lbl_00013214
    .4byte lbl_0001323C
    .4byte lbl_0001326C
    .4byte 0x00000000
lbl_000132A4:
    # 0x132A4
    .asciz "a/Three mini games that you can"
lbl_000132C4:
    # 0x132C4
    .asciz "a/play are now available."
    .balign 4
lbl_000132E0:
    # 0x132E0
    .4byte lbl_000132A4
    .4byte lbl_000132C4
    .4byte 0x00000000
lbl_000132EC:
    # 0x132EC
    .asciz "a/You have enough Play Points to"
    .balign 4
lbl_00013310:
    # 0x13310
    .asciz "a/open more mini games."
lbl_00013328:
    # 0x13328
    .4byte lbl_000132EC
    .4byte lbl_00013310
    .4byte 0x00000000
lbl_00013334:
    # 0x13334
    .asciz "a/Please select a level of difficulty."
    .balign 4
lbl_0001335C:
    # 0x1335C
    .4byte lbl_00013334
    .4byte lbl_00012F2C
    .4byte 0x00000000
lbl_00013368:
    # 0x13368
    .4byte 0x00000000
lbl_0001336C:
    # 0x1336C
    .4byte lbl_00013368
    .4byte 0x00000000
lbl_00013374:
    # 0x13374
    .asciz "a/You can do a circuit race!"
    .balign 4
lbl_00013394:
    # 0x13394
    .asciz "a/Roll the monkey balls around"
    .balign 4
lbl_000133B4:
    # 0x133B4
    .asciz "a/at high speeds!"
    .balign 4
lbl_000133C8:
    # 0x133C8
    .4byte lbl_00013374
    .4byte lbl_00013394
    .4byte lbl_000133B4
    .4byte 0x00000000
lbl_000133D8:
    # 0x133D8
    .asciz "a/1-4 players can play simultaneously!"
    .balign 4
lbl_00013400:
    # 0x13400
    .asciz "a/You punch to knock your opponents"
lbl_00013424:
    # 0x13424
    .asciz "a/off the platforms!"
    .balign 4
lbl_0001343C:
    # 0x1343C
    .4byte lbl_000133D8
    .4byte lbl_00013400
    .4byte lbl_00013424
    .4byte 0x00000000
lbl_0001344C:
    # 0x1344C
    .asciz "a/Jump off the ramp and see"
lbl_00013468:
    # 0x13468
    .asciz "a/if you can land on the target!"
    .balign 4
lbl_0001348C:
    # 0x1348C
    .4byte lbl_00012A88
    .4byte lbl_0001344C
    .4byte lbl_00013468
    .4byte 0x00000000
lbl_0001349C:
    # 0x1349C
    .asciz "a/Bananas received for coming"
    .balign 4
lbl_000134BC:
    # 0x134BC
    .asciz "a/in 1st place."
lbl_000134CC:
    # 0x134CC
    .4byte lbl_0001349C
    .4byte lbl_000134BC
    .4byte 0x00000000
lbl_000134D8:
    # 0x134D8
    .asciz "a/in 2nd place"
    .balign 4
lbl_000134E8:
    # 0x134E8
    .4byte lbl_0001349C
    .4byte lbl_000134D8
    .4byte 0x00000000
lbl_000134F4:
    # 0x134F4
    .asciz "a/in 3rd place"
    .balign 4
lbl_00013504:
    # 0x13504
    .4byte lbl_0001349C
    .4byte lbl_000134F4
    .4byte 0x00000000
lbl_00013510:
    # 0x13510
    .asciz "a/If you come in 1st place"
    .balign 4
lbl_0001352C:
    # 0x1352C
    .asciz "a/several times in a row,"
    .balign 4
lbl_00013548:
    # 0x13548
    .asciz "a/your bonus will grow."
lbl_00013560:
    # 0x13560
    .4byte lbl_00013510
    .4byte lbl_0001352C
    .4byte lbl_00013548
    .4byte 0x00000000
lbl_00013570:
    # 0x13570
    .asciz "a/The number of bananas scattered"
    .balign 4
lbl_00013594:
    # 0x13594
    .asciz "a/throughout the stage."
lbl_000135AC:
    # 0x135AC
    .asciz "a/*Bonus stages always have bananas."
    .balign 4
lbl_000135D4:
    # 0x135D4
    .4byte lbl_00013570
    .4byte lbl_00013594
    .4byte lbl_000135AC
    .4byte 0x00000000
lbl_000135E4:
    # 0x135E4
    .asciz "a/Will change the game settings."
    .balign 4
lbl_00013608:
    # 0x13608
    .4byte lbl_000135E4
    .4byte 0x00000000
lbl_00013610:
    # 0x13610
    .asciz "a/Gameplay will begin."
    .balign 4
lbl_00013628:
    # 0x13628
    .4byte lbl_00013610
    .4byte 0x00000000
lbl_00013630:
    # 0x13630
    .asciz "a/Choose any one course and race!"
    .balign 4
lbl_00013654:
    # 0x13654
    .4byte lbl_000133D8
    .4byte lbl_00013630
    .4byte 0x00000000
lbl_00013660:
    # 0x13660
    .asciz "a/Race all the courses to add up points!"
    .balign 4
lbl_0001368C:
    # 0x1368C
    .asciz "a/The player with the highest total wins!"
    .balign 4
lbl_000136B8:
    # 0x136B8
    .4byte lbl_000133D8
    .4byte lbl_00013660
    .4byte lbl_0001368C
    .4byte 0x00000000
lbl_000136C8:
    # 0x136C8
    .asciz "a/This is for 1 player only."
    .balign 4
lbl_000136E8:
    # 0x136E8
    .asciz "a/Choose any course you want and"
    .balign 4
lbl_0001370C:
    # 0x1370C
    .asciz "a/try to get the best time!"
lbl_00013728:
    # 0x13728
    .4byte lbl_000136C8
    .4byte lbl_000136E8
    .4byte lbl_0001370C
    .4byte 0x00000000
lbl_00013738:
    # 0x13738
    .asciz "a/Please select a course."
    .balign 4
lbl_00013754:
    # 0x13754
    .4byte lbl_00013368
    .4byte lbl_00013368
    .4byte lbl_00013738
    .4byte 0x00000000
lbl_00013764:
    # 0x13764
    .asciz "a/Select a course to start the game."
    .balign 4
lbl_0001378C:
    # 0x1378C
    .4byte lbl_00013368
    .4byte lbl_00013368
    .4byte lbl_00013764
    .4byte 0x00000000
lbl_0001379C:
    # 0x1379C
    .4byte lbl_00013368
    .4byte 0x00000000
lbl_000137A4:
    # 0x137A4
    .asciz "a/Number of times the players"
    .balign 4
lbl_000137C4:
    # 0x137C4
    .asciz "a/must go around the track."
lbl_000137E0:
    # 0x137E0
    .4byte lbl_000137A4
    .4byte lbl_000137C4
    .4byte 0x00000000
lbl_000137EC:
    # 0x137EC
    .asciz "a/Allows COM players to participate."
    .balign 4
lbl_00013814:
    # 0x13814
    .asciz "a/*Will become a 4 player game. All empty"
    .balign 4
lbl_00013840:
    # 0x13840
    .asciz "a/positions will be filled with COM players."
    .balign 4
lbl_00013870:
    # 0x13870
    .4byte lbl_000137EC
    .4byte lbl_00013814
    .4byte lbl_00013840
    .4byte 0x00000000
lbl_00013880:
    # 0x13880
    .asciz "a/Will slightly increase"
    .balign 4
lbl_0001389C:
    # 0x1389C
    .asciz "a/the speed of the player"
    .balign 4
lbl_000138B8:
    # 0x138B8
    .asciz "a/in last place."
    .balign 4
lbl_000138CC:
    # 0x138CC
    .4byte lbl_00013880
    .4byte lbl_0001389C
    .4byte lbl_000138B8
    .4byte 0x00000000
lbl_000138DC:
    # 0x138DC
    .asciz "a/Allows players to use items."
    .balign 4
lbl_000138FC:
    # 0x138FC
    .4byte lbl_000138DC
    .4byte 0x00000000
lbl_00013904:
    # 0x13904
    .asciz "a/Race will begin."
    .balign 4
lbl_00013918:
    # 0x13918
    .4byte lbl_00013904
    .4byte 0x00000000
lbl_00013920:
    # 0x13920
    .asciz "a/The COM players will always"
    .balign 4
lbl_00013940:
    # 0x13940
    .asciz "a/participate in 1 player games."
    .balign 4
lbl_00013964:
    # 0x13964
    .asciz "a/*Will automatically become a 4 player game."
    .balign 4
lbl_00013994:
    # 0x13994
    .4byte lbl_00013920
    .4byte lbl_00013940
    .4byte lbl_00013964
    .4byte 0x00000000
lbl_000139A4:
    # 0x139A4
    .asciz "a/COM is not available"
    .balign 4
lbl_000139BC:
    # 0x139BC
    .asciz "a/for the 4-player mode."
    .balign 4
lbl_000139D8:
    # 0x139D8
    .4byte lbl_000139A4
    .4byte lbl_000139BC
    .4byte 0x00000000
lbl_000139E4:
    # 0x139E4
    .4byte lbl_000137EC
    .4byte lbl_00013814
    .4byte lbl_00013840
    .4byte 0x00000000
lbl_000139F4:
    # 0x139F4
    .4byte lbl_00013610
    .4byte 0x00000000
lbl_000139FC:
    # 0x139FC
    .4byte lbl_00013920
    .4byte lbl_00013940
    .4byte lbl_00013964
    .4byte 0x00000000
lbl_00013A0C:
    # 0x13A0C
    .4byte lbl_000139A4
    .4byte lbl_000139BC
    .4byte 0x00000000
lbl_00013A18:
    # 0x13A18
    .asciz "a/Play billiards!"
    .balign 4
lbl_00013A2C:
    # 0x13A2C
    .asciz "a/The first person to pocket"
    .balign 4
lbl_00013A4C:
    # 0x13A4C
    .asciz "a/the 9 ball wins!"
    .balign 4
lbl_00013A60:
    # 0x13A60
    .4byte lbl_00013A18
    .4byte lbl_00013A2C
    .4byte lbl_00013A4C
    .4byte 0x00000000
lbl_00013A70:
    # 0x13A70
    .asciz "a/Guide the ball down the alley"
lbl_00013A90:
    # 0x13A90
    .asciz "a/and knock over as many pins"
    .balign 4
lbl_00013AB0:
    # 0x13AB0
    .asciz "a/as you can!"
    .balign 4
lbl_00013AC0:
    # 0x13AC0
    .4byte lbl_00013A70
    .4byte lbl_00013A90
    .4byte lbl_00013AB0
    .4byte 0x00000000
lbl_00013AD0:
    # 0x13AD0
    .asciz "a/Use the monkey balls and"
    .balign 4
lbl_00013AEC:
    # 0x13AEC
    .asciz "a/play mini golf!"
    .balign 4
lbl_00013B00:
    # 0x13B00
    .asciz "a/Try to get a hole in one!"
lbl_00013B1C:
    # 0x13B1C
    .4byte lbl_00013AD0
    .4byte lbl_00013AEC
    .4byte lbl_00013B00
    .4byte 0x00000000
lbl_00013B2C:
    # 0x13B2C
    .asciz "a/You cannot select this game yet."
    .balign 4
lbl_00013B50:
    # 0x13B50
    .asciz "a/You must get more Play Points"
lbl_00013B70:
    # 0x13B70
    .asciz "a/to unlock this game!"
    .balign 4
lbl_00013B88:
    # 0x13B88
    .4byte lbl_00013B2C
    .4byte lbl_00013B50
    .4byte lbl_00013B70
    .4byte 0x00000000
lbl_00013B98:
    # 0x13B98
    .asciz "a/You can open mini games."
    .balign 4
lbl_00013BB4:
    # 0x13BB4
    .asciz "a/You need 2500 Play Points"
lbl_00013BD0:
    # 0x13BD0
    .asciz "a/to open one mini game."
    .balign 4
lbl_00013BEC:
    # 0x13BEC
    .4byte lbl_00013B98
    .4byte lbl_00013BB4
    .4byte lbl_00013BD0
    .4byte 0x00000000
lbl_00013BFC:
    # 0x13BFC
    .asciz "a/Play against the COM."
lbl_00013C14:
    # 0x13C14
    .4byte lbl_00013BFC
    .4byte 0x00000000
lbl_00013C1C:
    # 0x13C1C
    .asciz "a/Play a 2 player game by taking turns."
lbl_00013C44:
    # 0x13C44
    .4byte lbl_00013C1C
    .4byte 0x00000000
lbl_00013C4C:
    # 0x13C4C
    .asciz "a/Up to 4 players can play taking turns! Play"
    .balign 4
lbl_00013C7C:
    # 0x13C7C
    .asciz "a/Mini Golf through all the courses, and the"
    .balign 4
lbl_00013CAC:
    # 0x13CAC
    .asciz "a/person with the least number of strokes wins!"
lbl_00013CDC:
    # 0x13CDC
    .4byte lbl_00013C4C
    .4byte lbl_00013C7C
    .4byte lbl_00013CAC
    .4byte 0x00000000
lbl_00013CEC:
    # 0x13CEC
    .asciz "a/Play a 2 player game!"
lbl_00013D04:
    # 0x13D04
    .asciz "a/The person to get the balls in the holes"
    .balign 4
lbl_00013D30:
    # 0x13D30
    .asciz "a/with the least number of strokes wins!"
    .balign 4
lbl_00013D5C:
    # 0x13D5C
    .4byte lbl_00013CEC
    .4byte lbl_00013D04
    .4byte lbl_00013D30
    .4byte 0x00000000
lbl_00013D6C:
    # 0x13D6C
    .4byte lbl_00013368
    .4byte 0x00000000
lbl_00013D74:
    # 0x13D74
    .asciz "a/Sets the number of holes to play."
lbl_00013D98:
    # 0x13D98
    .asciz "a/A full round is 18 holes."
lbl_00013DB4:
    # 0x13DB4
    .asciz "a/*Rankings included."
    .balign 4
lbl_00013DCC:
    # 0x13DCC
    .4byte lbl_00013D74
    .4byte lbl_00013D98
    .4byte lbl_00013DB4
    .4byte 0x00000000
lbl_00013DDC:
    # 0x13DDC
    .4byte lbl_00013610
    .4byte 0x00000000
lbl_00013DE4:
    # 0x13DE4
    .asciz "a/Will play the front 9 holes."
    .balign 4
lbl_00013E04:
    # 0x13E04
    .asciz "a/*No rankings."
lbl_00013E14:
    # 0x13E14
    .4byte lbl_00013D74
    .4byte lbl_00013DE4
    .4byte lbl_00013E04
    .4byte 0x00000000
lbl_00013E24:
    # 0x13E24
    .asciz "a/Will play the back 9 holes."
    .balign 4
lbl_00013E44:
    # 0x13E44
    .4byte lbl_00013D74
    .4byte lbl_00013E24
    .4byte lbl_00013E04
    .4byte 0x00000000
lbl_00013E54:
    # 0x13E54
    .4byte lbl_00013D74
    .4byte lbl_00013D98
    .4byte lbl_00013E04
    .4byte 0x00000000
lbl_00013E64:
    # 0x13E64
    .asciz "a/Select the number of sets"
lbl_00013E80:
    # 0x13E80
    .asciz "a/you wish to play."
lbl_00013E94:
    # 0x13E94
    .4byte lbl_00013E64
    .4byte lbl_00013E80
    .4byte 0x00000000
lbl_00013EA0:
    # 0x13EA0
    .asciz "a/Sets the COM difficulty level."
    .balign 4
lbl_00013EC4:
    # 0x13EC4
    .asciz "a/1 is easiest,"
lbl_00013ED4:
    # 0x13ED4
    .asciz "a/5 is the most difficult."
    .balign 4
lbl_00013EF0:
    # 0x13EF0
    .4byte lbl_00013EA0
    .4byte lbl_00013EC4
    .4byte lbl_00013ED4
    .4byte 0x00000000
lbl_00013F00:
    # 0x13F00
    .4byte lbl_00013610
    .4byte 0x00000000
lbl_00013F08:
    # 0x13F08
    .asciz "a/Up to 4 players can play taking turns!"
    .balign 4
lbl_00013F34:
    # 0x13F34
    .asciz "a/Bowl for 10 frames and add up the scores!"
lbl_00013F60:
    # 0x13F60
    .asciz "a/The player with the highest score wins!"
    .balign 4
lbl_00013F8C:
    # 0x13F8C
    .4byte lbl_00013F08
    .4byte lbl_00013F34
    .4byte lbl_00013F60
    .4byte 0x00000000
lbl_00013F9C:
    # 0x13F9C
    .asciz "a/For 1 player only."
    .balign 4
lbl_00013FB4:
    # 0x13FB4
    .asciz "a/Throw the ball down the alley and"
lbl_00013FD8:
    # 0x13FD8
    .asciz "a/knock over as many pins as you can!"
    .balign 4
lbl_00014000:
    # 0x14000
    .4byte lbl_00013F9C
    .4byte lbl_00013FB4
    .4byte lbl_00013FD8
    .4byte 0x00000000
lbl_00014010:
    # 0x14010
    .asciz "a/You can play with 2 players by taking turns!"
    .balign 4
lbl_00014040:
    # 0x14040
    .asciz "a/For single player mode,"
    .balign 4
lbl_0001405C:
    # 0x1405C
    .asciz "a/you can play against the COM!"
lbl_0001407C:
    # 0x1407C
    .4byte lbl_00014010
    .4byte lbl_00014040
    .4byte lbl_0001405C
    .4byte 0x00000000
lbl_0001408C:
    # 0x1408C
    .asciz "a/Battle against 4 COM players and"
    .balign 4
lbl_000140B0:
    # 0x140B0
    .asciz "a/see how long you can battle it out!"
    .balign 4
lbl_000140D8:
    # 0x140D8
    .4byte lbl_00013F9C
    .4byte lbl_0001408C
    .4byte lbl_000140B0
    .4byte 0x00000000
lbl_000140E8:
    # 0x140E8
    .asciz "a/Select the number of rounds"
    .balign 4
lbl_00014108:
    # 0x14108
    .4byte lbl_000140E8
    .4byte lbl_00013E80
    .4byte 0x00000000
lbl_00014114:
    # 0x14114
    .asciz "a/Allows players to use Help Items."
lbl_00014138:
    # 0x14138
    .4byte lbl_00014114
    .4byte 0x00000000
lbl_00014140:
    # 0x14140
    .asciz "a/Before each round,"
    .balign 4
lbl_00014158:
    # 0x14158
    .asciz "a/you can spin the Wheel of Danger."
lbl_0001417C:
    # 0x1417C
    .4byte lbl_00014140
    .4byte lbl_00014158
    .4byte 0x00000000
lbl_00014188:
    # 0x14188
    .4byte lbl_00013610
    .4byte 0x00000000
lbl_00014190:
    # 0x14190
    .4byte lbl_000140E8
    .4byte lbl_00013E80
    .4byte 0x00000000
lbl_0001419C:
    # 0x1419C
    .4byte lbl_000140E8
    .4byte lbl_00013E80
    .4byte 0x00000000
lbl_000141A8:
    # 0x141A8
    .4byte 0x00000000
    .4byte lbl_00012B18
    .4byte lbl_00012BB0
    .4byte lbl_00012C44
    .4byte lbl_00012CA8
    .4byte lbl_00012CD4
    .4byte lbl_00012D44
    .4byte lbl_00012D54
    .4byte lbl_00012DC4
    .4byte lbl_00012DD4
    .4byte lbl_00012E0C
    .4byte lbl_00012E38
    .4byte lbl_00012E6C
    .4byte lbl_00012EC8
    .4byte lbl_00012F08
    .4byte lbl_00012F44
    .4byte lbl_00012FA0
    .4byte lbl_00013008
    .4byte lbl_00013090
    .4byte lbl_00013104
    .4byte lbl_00013170
    .4byte lbl_000131D4
    .4byte lbl_00013204
    .4byte lbl_00013294
    .4byte lbl_000132E0
    .4byte lbl_00013328
    .4byte lbl_0001335C
    .4byte lbl_0001336C
    .4byte lbl_000133C8
    .4byte lbl_0001343C
    .4byte lbl_0001348C
    .4byte lbl_000134CC
    .4byte lbl_000134E8
    .4byte lbl_00013504
    .4byte lbl_00013560
    .4byte lbl_000135D4
    .4byte lbl_00013608
    .4byte lbl_00013628
    .4byte lbl_00013654
    .4byte lbl_000136B8
    .4byte lbl_00013728
    .4byte lbl_00013754
    .4byte lbl_0001378C
    .4byte lbl_0001379C
    .4byte lbl_000137E0
    .4byte lbl_00013870
    .4byte lbl_000138CC
    .4byte lbl_000138FC
    .4byte lbl_00013608
    .4byte lbl_00013918
    .4byte lbl_00013994
    .4byte lbl_000139D8
    .4byte lbl_000139E4
    .4byte lbl_00013608
    .4byte lbl_000139F4
    .4byte lbl_000139FC
    .4byte lbl_00013A0C
    .4byte lbl_00013A60
    .4byte lbl_00013AC0
    .4byte lbl_00013B1C
    .4byte lbl_00013B88
    .4byte lbl_00013BEC
    .4byte lbl_00013C14
    .4byte lbl_00013C44
    .4byte lbl_00013CDC
    .4byte lbl_00013D5C
    .4byte lbl_00013D6C
    .4byte lbl_00013DCC
    .4byte lbl_00013608
    .4byte lbl_00013DDC
    .4byte lbl_00013E14
    .4byte lbl_00013E44
    .4byte lbl_00013E54
    .4byte lbl_00013E94
    .4byte lbl_00013608
    .4byte lbl_00013F00
    .4byte lbl_00013E94
    .4byte lbl_00013EF0
    .4byte lbl_00013608
    .4byte lbl_00013F00
    .4byte lbl_00013F8C
    .4byte lbl_00014000
    .4byte lbl_0001407C
    .4byte lbl_000140D8
    .4byte lbl_00014108
    .4byte lbl_00014138
    .4byte lbl_0001417C
    .4byte lbl_00013608
    .4byte lbl_00014188
    .4byte lbl_00014190
    .4byte lbl_0001419C
lbl_00014314:
    # 0x14314
    .asciz "h/KOUTAIDE, 4p/NINN/h/MADEASOBEMASU."
    .balign 4
lbl_0001433C:
    # 0x1433C
    .asciz "1p/NINN/h/DEASONNDE, k/PUREIPOINNTOh/WO"
lbl_00014364:
    # 0x14364
    .asciz "h/TAMERUTOk/MINIGE-MUh/DEASOBEMASU!"
lbl_00014388:
    # 0x14388
    .4byte lbl_00014314
    .4byte lbl_0001433C
    .4byte lbl_00014364
    .4byte 0x00000000
lbl_00014398:
    # 0x14398
    .asciz "h/2~4p/NINN/h/DE, p/DOUJI/h/NIASOBEMASU!"
    .balign 4
lbl_000143C4:
    # 0x143C4
    .asciz "h/SUKINAk/SUTE-JIh/WOERABI, DAREGA"
    .balign 4
lbl_000143E8:
    # 0x143E8
    .asciz "h/1BANNNIk/GO-RUh/SURUKAp/SHOUBU/h/SIMASU!"
    .balign 4
lbl_00014414:
    # 0x14414
    .4byte lbl_00014398
    .4byte lbl_000143C4
    .4byte lbl_000143E8
    .4byte 0x00000000
lbl_00014424:
    # 0x14424
    .asciz "1p/NINN/k/PUREIh/SENNYOUDESU."
    .balign 4
lbl_00014444:
    # 0x14444
    .asciz "k/PUREIh/SITAKOTONOARUk/SUTE-JIh/WO"
lbl_00014468:
    # 0x14468
    .asciz "h/ERABI, KURIKAESIp/RENNSHUU/h/DEKIMASU."
    .balign 4
lbl_00014494:
    # 0x14494
    .4byte lbl_00014424
    .4byte lbl_00014444
    .4byte lbl_00014468
    .4byte 0x00000000
lbl_000144A4:
    # 0x144A4
    .asciz "k/NO-MARUMO-DOh/DE"
    .balign 4
lbl_000144B8:
    # 0x144B8
    .asciz "k/PUREIh/SITAk/SUTE-JIh/GANAITAME,"
    .balign 4
lbl_000144DC:
    # 0x144DC
    .asciz "h/ASOBEMASENN."
    .balign 4
lbl_000144EC:
    # 0x144EC
    .4byte lbl_000144A4
    .4byte lbl_000144B8
    .4byte lbl_000144DC
    .4byte 0x00000000
lbl_000144FC:
    # 0x144FC
    .asciz "p/RENNSHUU/h/DEKIMASENN."
    .balign 4
lbl_00014518:
    # 0x14518
    .4byte lbl_000144A4
    .4byte lbl_000144B8
    .4byte lbl_000144FC
    .4byte 0x00000000
lbl_00014528:
    # 0x14528
    .asciz "h/TAMERUTOk/MINIGE-MUh/GAHUEMASU!"
    .balign 4
lbl_0001454C:
    # 0x1454C
    .4byte lbl_00014314
    .4byte lbl_0001433C
    .4byte lbl_00014528
    .4byte 0x00000000
lbl_0001455C:
    # 0x1455C
    .4byte lbl_00014314
    .4byte lbl_0001433C
    .4byte lbl_00014528
    .4byte 0x00000000
lbl_0001456C:
    # 0x1456C
    .asciz "k/BO-RUh/WOk/KOROh/GASITE, k/GO-RUh/MADE"
    .balign 4
lbl_00014598:
    # 0x14598
    .asciz "h/HAYAKUTADORITUKIMASHOU!"
    .balign 4
lbl_000145B4:
    # 0x145B4
    .4byte lbl_00014314
    .4byte lbl_0001456C
    .4byte lbl_00014598
    .4byte 0x00000000
lbl_000145C4:
    # 0x145C4
    .4byte lbl_00014314
    .4byte lbl_0001456C
    .4byte lbl_00014598
    .4byte 0x00000000
lbl_000145D4:
    # 0x145D4
    .asciz "4p/NINN/h/MADEASOBEMASU."
    .balign 4
lbl_000145F0:
    # 0x145F0
    .4byte lbl_000145D4
    .4byte 0x00000000
lbl_000145F8:
    # 0x145F8
    .asciz "p/*/k/PUREIPOINNTOh/WO"
    .balign 4
lbl_00014610:
    # 0x14610
    .asciz "k/GETTOh/DEKIMASU."
    .balign 4
lbl_00014624:
    # 0x14624
    .4byte lbl_000145D4
    .4byte lbl_000145F8
    .4byte lbl_00014610
    .4byte 0x00000000
lbl_00014634:
    # 0x14634
    .asciz "k/GETTOh/DEKIMASENN."
    .balign 4
lbl_0001464C:
    # 0x1464C
    .4byte lbl_000145D4
    .4byte lbl_000145F8
    .4byte lbl_00014634
    .4byte 0x00000000
lbl_0001465C:
    # 0x1465C
    .asciz "p/TSUKAu/h/Uk/KYARAKUTA-h/WO"
    .balign 4
lbl_0001467C:
    # 0x1467C
    .asciz "p/JIBUNN/h/NOk/KONNTORO-RAh/DE"
    .balign 4
lbl_0001469C:
    # 0x1469C
    .asciz "h/ERANNDEKUDASAI."
    .balign 4
lbl_000146B0:
    # 0x146B0
    .4byte lbl_0001465C
    .4byte lbl_0001467C
    .4byte lbl_0001469C
    .4byte 0x00000000
lbl_000146C0:
    # 0x146C0
    .asciz "COMh/NOk/KYARAKUTA-h/WO"
lbl_000146D8:
    # 0x146D8
    .4byte lbl_000146C0
    .4byte lbl_0001469C
    .4byte lbl_00013368
    .4byte 0x00000000
lbl_000146E8:
    # 0x146E8
    .asciz "p/TSUKAu/h/Uk/KYARAKUTA-h/WO p/JIBUNN/h/NO"
    .balign 4
lbl_00014714:
    # 0x14714
    .asciz "k/KONNTORO-RAh/DEERANNDEKUDASAI."
    .balign 4
lbl_00014738:
    # 0x14738
    .asciz "k/GE-MUh/WOHAJIMEMASU."
    .balign 4
lbl_00014750:
    # 0x14750
    .4byte lbl_000146E8
    .4byte lbl_00014714
    .4byte lbl_00014738
    .4byte 0x00000000
lbl_00014760:
    # 0x14760
    .asciz "k/KONNTORO-RAh/WOSASEBA"
lbl_00014778:
    # 0x14778
    .4byte lbl_00014760
    .4byte lbl_000145D4
    .4byte 0x00000000
lbl_00014784:
    # 0x14784
    .asciz "h/Ok/SARUh/SANNNOp/HAI/h/TTAk/BO-RUh/WO"
lbl_000147AC:
    # 0x147AC
    .asciz "h/UMAKUk/KOROh/GASITE, k/GO-RUh/MADE"
    .balign 4
lbl_000147D4:
    # 0x147D4
    .asciz "h/HAYAKUTADORIp/TUku/h/KIMASHOU!"
    .balign 4
lbl_000147F8:
    # 0x147F8
    .4byte lbl_00014784
    .4byte lbl_000147AC
    .4byte lbl_000147D4
    .4byte 0x00000000
lbl_00014808:
    # 0x14808
    .asciz "1p/NINN/k/PUREIh/HAMOCHIRONNNOKOTO,"
lbl_0001482C:
    # 0x1482C
    .asciz "h/2~4p/NINN/h/MINNNAGAATUMATTAp/TOKI/MO"
lbl_00014854:
    # 0x14854
    .asciz "h/ASOBERUk/PA-TEXI-GE-MUh/DESU!"
lbl_00014874:
    # 0x14874
    .4byte lbl_00014808
    .4byte lbl_0001482C
    .4byte lbl_00014854
    .4byte 0x00000000
lbl_00014884:
    # 0x14884
    .asciz "k/MEINNGE-MUh/NOk/NO-MARUMO-DOh/WO"
    .balign 4
lbl_000148A8:
    # 0x148A8
    .4byte lbl_00014884
    .4byte lbl_0001433C
    .4byte lbl_00014364
    .4byte 0x00000000
lbl_000148B8:
    # 0x148B8
    .asciz "h/MADA, k/MINIGE-MUh/DEASOBEMASENN."
lbl_000148DC:
    # 0x148DC
    .asciz "a/1p/NINN/h/DEASOBITUDUKETEKUDASAI!"
lbl_00014900:
    # 0x14900
    .4byte lbl_000148B8
    .4byte lbl_00014884
    .4byte lbl_000148DC
    .4byte 0x00000000
lbl_00014910:
    # 0x14910
    .asciz "k/MINIGE-MUh/GA1TUARIMASU."
    .balign 4
lbl_0001492C:
    # 0x1492C
    .asciz "a/1p/NINN/h/DEMOTTOASOBIMASHOU!"
lbl_0001494C:
    # 0x1494C
    .4byte lbl_00014910
    .4byte lbl_00014884
    .4byte lbl_0001492C
    .4byte 0x00000000
lbl_0001495C:
    # 0x1495C
    .asciz "k/MINIGE-MUh/GA2TUARIMASU."
    .balign 4
lbl_00014978:
    # 0x14978
    .4byte lbl_0001495C
    .4byte lbl_00014884
    .4byte lbl_0001492C
    .4byte 0x00000000
lbl_00014988:
    # 0x14988
    .asciz "k/MINIGE-MUh/HA3TUSUBETEARIMASU."
    .balign 4
lbl_000149AC:
    # 0x149AC
    .asciz "h/SARANIk/PUREIPOINNTOh/WOTAMERUTO,"
lbl_000149D0:
    # 0x149D0
    .asciz "k/KONNTEXINYU-p/KAISUU/h/GAHUEMASU!"
lbl_000149F4:
    # 0x149F4
    .4byte lbl_00014988
    .4byte lbl_000149AC
    .4byte lbl_000149D0
    .4byte 0x00000000
lbl_00014A04:
    # 0x14A04
    .asciz "k/BO-RUh/WOTUKATTEASOBU"
lbl_00014A1C:
    # 0x14A1C
    .asciz "a/3h/TUNOk/MINIGE-MUh/DEASOBEMASU!"
    .balign 4
lbl_00014A40:
    # 0x14A40
    .4byte lbl_00014A04
    .4byte lbl_00014A1C
    .4byte 0x00000000
lbl_00014A4C:
    # 0x14A4C
    .asciz "k/PUREIPOINNTOh/GATAMARIMASITA."
lbl_00014A6C:
    # 0x14A6C
    .asciz "k/MINIGE-MUh/WOk/GETTOh/SIMASHOU!"
    .balign 4
lbl_00014A90:
    # 0x14A90
    .4byte lbl_00014A4C
    .4byte lbl_00014A6C
    .4byte 0x00000000
lbl_00014A9C:
    # 0x14A9C
    .asciz "k/LEBELUh/WOERANNDEKUDASAI."
lbl_00014AB8:
    # 0x14AB8
    .4byte lbl_00014A9C
    .4byte lbl_00014738
    .4byte 0x00000000
lbl_00014AC4:
    # 0x14AC4
    .asciz "k/PUREIh/SHITAk/SUTE-JIh/KARA"
    .balign 4
lbl_00014AE4:
    # 0x14AE4
    .asciz "k/ENNTORI-h/DEKIMASU!"
    .balign 4
lbl_00014AFC:
    # 0x14AFC
    .4byte lbl_00014AC4
    .4byte lbl_00014AE4
    .4byte 0x00000000
lbl_00014B08:
    # 0x14B08
    .asciz "k/SA-KITTOh/DEk/RE-SUh/WOSIMASU!"
    .balign 4
lbl_00014B2C:
    # 0x14B2C
    .asciz "k/HAISUPI-DOh/DEk/KOROh/GASIMASHOU!"
lbl_00014B50:
    # 0x14B50
    .4byte lbl_00014B08
    .4byte lbl_00014784
    .4byte lbl_00014B2C
    .4byte 0x00000000
lbl_00014B60:
    # 0x14B60
    .asciz "h/1~4p/NINN/h/DE, p/DOUJI/h/NIASOBEMASU."
    .balign 4
lbl_00014B8C:
    # 0x14B8C
    .asciz "k/PANNCHIh/DE, AITEWOk/RINNGUAUTO!"
    .balign 4
lbl_00014BB0:
    # 0x14BB0
    .asciz "h/MINNNADE, p/Ochiru/h/TOSIAIMASHOU!"
    .balign 4
lbl_00014BD8:
    # 0x14BD8
    .4byte lbl_00014B60
    .4byte lbl_00014B8C
    .4byte lbl_00014BB0
    .4byte 0x00000000
lbl_00014BE8:
    # 0x14BE8
    .asciz "h/SORAWOTONNDE, k/TA-GETTOh/NI"
    .balign 4
lbl_00014C08:
    # 0x14C08
    .asciz "h/UMAKUp/CHAKUCHI/h/SIMASHOU!"
    .balign 4
lbl_00014C28:
    # 0x14C28
    .4byte lbl_00014314
    .4byte lbl_00014BE8
    .4byte lbl_00014C08
    .4byte 0x00000000
lbl_00014C38:
    # 0x14C38
    .asciz "h/1p/KURAI/h/NOk/PUREIYA-h/GAMORAERU"
    .balign 4
lbl_00014C60:
    # 0x14C60
    .asciz "k/BANANAh/NOp/HONN/SUU/h/DESU."
    .balign 4
lbl_00014C80:
    # 0x14C80
    .4byte lbl_00014C38
    .4byte lbl_00014C60
    .4byte 0x00000000
lbl_00014C8C:
    # 0x14C8C
    .asciz "h/2p/KURAI/h/NOk/PUREIYA-h/GAMORAERU"
    .balign 4
lbl_00014CB4:
    # 0x14CB4
    .4byte lbl_00014C8C
    .4byte lbl_00014C60
    .4byte 0x00000000
lbl_00014CC0:
    # 0x14CC0
    .asciz "h/3p/KURAI/h/NOk/PUREIYA-h/GAMORAERU"
    .balign 4
lbl_00014CE8:
    # 0x14CE8
    .4byte lbl_00014CC0
    .4byte lbl_00014C60
    .4byte 0x00000000
lbl_00014CF4:
    # 0x14CF4
    .asciz "1p/KURAI/h/NINARITUDUKERUTO"
lbl_00014D10:
    # 0x14D10
    .asciz "h/MORAERUk/BANANAh/NOp/HONNSUU/h/GA"
lbl_00014D34:
    # 0x14D34
    .asciz "h/HUETEIKIMASU."
lbl_00014D44:
    # 0x14D44
    .4byte lbl_00014CF4
    .4byte lbl_00014D10
    .4byte lbl_00014D34
    .4byte 0x00000000
lbl_00014D54:
    # 0x14D54
    .asciz "k/SUTE-JIh/NIk/BANANAh/WOOKIMASU."
    .balign 4
lbl_00014D78:
    # 0x14D78
    .asciz "p/KOME/k/BO-NASUSUTE-JIh/NIHA"
    .balign 4
lbl_00014D98:
    # 0x14D98
    .asciz "h/ITUMOk/BANANAh/GAOITEARIMASU."
lbl_00014DB8:
    # 0x14DB8
    .4byte lbl_00014D54
    .4byte lbl_00014D78
    .4byte lbl_00014D98
    .4byte 0x00000000
lbl_00014DC8:
    # 0x14DC8
    .asciz "h/SETTEIh/WOHENNKOUSIMASU."
    .balign 4
lbl_00014DE4:
    # 0x14DE4
    .4byte lbl_00014DC8
    .4byte 0x00000000
lbl_00014DEC:
    # 0x14DEC
    .4byte lbl_00014738
    .4byte 0x00000000
lbl_00014DF4:
    # 0x14DF4
    .asciz "h/SUKINAk/KO-SUh/WOHITOTUERANNDE,"
    .balign 4
lbl_00014E18:
    # 0x14E18
    .asciz "k/RE-SUh/WOSIMASU!"
    .balign 4
lbl_00014E2C:
    # 0x14E2C
    .4byte lbl_00014B60
    .4byte lbl_00014DF4
    .4byte lbl_00014E18
    .4byte 0x00000000
lbl_00014E3C:
    # 0x14E3C
    .asciz "h/SUBETENOk/KO-SUh/DEk/RE-SUh/WOSITE,"
    .balign 4
lbl_00014E64:
    # 0x14E64
    .asciz "k/TO-TARUPOINNTOh/DEp/SHOUBU/h/SIMASU!"
    .balign 4
lbl_00014E8C:
    # 0x14E8C
    .4byte lbl_00014B60
    .4byte lbl_00014E3C
    .4byte lbl_00014E64
    .4byte 0x00000000
lbl_00014E9C:
    # 0x14E9C
    .asciz "k/BESUTOTAIMUh/WOMEZASIMASHOU!"
    .balign 4
lbl_00014EBC:
    # 0x14EBC
    .4byte lbl_00014424
    .4byte lbl_00014DF4
    .4byte lbl_00014E9C
    .4byte 0x00000000
lbl_00014ECC:
    # 0x14ECC
    .asciz "k/RE-SUKO-SUh/WOERANNDEKUDASAI."
lbl_00014EEC:
    # 0x14EEC
    .4byte lbl_00012F04
    .4byte lbl_00012F04
    .4byte lbl_00014ECC
    .4byte 0x00000000
lbl_00014EFC:
    # 0x14EFC
    .asciz "k/KO-SUh/WOERANNDEk/GE-MUSUTA-TO."
    .balign 4
lbl_00014F20:
    # 0x14F20
    .4byte lbl_00012F04
    .4byte lbl_00012F04
    .4byte lbl_00014EFC
    .4byte 0x00000000
lbl_00014F30:
    # 0x14F30
    .asciz "h/SUBETENOk/KO-SUh/WOHASITTE"
    .balign 4
lbl_00014F50:
    # 0x14F50
    .asciz "k/POINNTOh/WOKISOIMASU."
lbl_00014F68:
    # 0x14F68
    .4byte lbl_00014F30
    .4byte lbl_00014F50
    .4byte 0x00000000
lbl_00014F74:
    # 0x14F74
    .asciz "h/SHUUKAIp/SUU/h/DESU."
    .balign 4
lbl_00014F8C:
    # 0x14F8C
    .4byte lbl_00014F74
    .4byte 0x00000000
lbl_00014F94:
    # 0x14F94
    .asciz "COMh/WOSANNKASASEMASU."
    .balign 4
lbl_00014FAC:
    # 0x14FAC
    .asciz "p/KOME/a/4p/NINN/TAISENN/h/NINARIMASU."
    .balign 4
lbl_00014FD4:
    # 0x14FD4
    .asciz "p/HITO/h/IGAIHAa/COMh/NINARIMASU."
    .balign 4
lbl_00014FF8:
    # 0x14FF8
    .4byte lbl_00014F94
    .4byte lbl_00014FAC
    .4byte lbl_00014FD4
    .4byte 0x00000000
lbl_00015008:
    # 0x15008
    .asciz "h/USIRONOk/PUREIYA-h/NOk/SUPI-DOh/GA"
    .balign 4
lbl_00015030:
    # 0x15030
    .asciz "h/SUKOSIHAYAKUNARIMASU."
lbl_00015048:
    # 0x15048
    .4byte lbl_00015008
    .4byte lbl_00015030
    .4byte 0x00000000
lbl_00015054:
    # 0x15054
    .asciz "k/AITEMUh/WOp/TSUKAu/h/UKOTOGADEKIMASU."
lbl_0001507C:
    # 0x1507C
    .4byte lbl_00015054
    .4byte 0x00000000
lbl_00015084:
    # 0x15084
    .asciz "k/RE-SUh/WOHAJIMEMASU."
    .balign 4
lbl_0001509C:
    # 0x1509C
    .4byte lbl_00015084
    .4byte 0x00000000
lbl_000150A4:
    # 0x150A4
    .asciz "a/1p/NINN/k/PUREIh/NOp/TOKI/h/HA"
    .balign 4
lbl_000150C8:
    # 0x150C8
    .asciz "h/KANARAZUa/COMh/WOSANNKASASEMASU."
    .balign 4
lbl_000150EC:
    # 0x150EC
    .4byte lbl_000150A4
    .4byte lbl_000150C8
    .4byte lbl_00014FAC
    .4byte 0x00000000
lbl_000150FC:
    # 0x150FC
    .asciz "4p/NINN/k/PUREIh/NOp/TOKI/h/HA"
    .balign 4
lbl_0001511C:
    # 0x1511C
    .asciz "COMh/WOSANNKADEKIMASENN."
    .balign 4
lbl_00015138:
    # 0x15138
    .4byte lbl_000150FC
    .4byte lbl_0001511C
    .4byte 0x00000000
lbl_00015144:
    # 0x15144
    .4byte lbl_00014F94
    .4byte 0x00000000
lbl_0001514C:
    # 0x1514C
    .4byte lbl_00014738
    .4byte 0x00000000
lbl_00015154:
    # 0x15154
    .4byte lbl_000150A4
    .4byte lbl_000150C8
    .4byte lbl_00014FAC
    .4byte 0x00000000
lbl_00015164:
    # 0x15164
    .4byte lbl_000150FC
    .4byte lbl_0001511C
    .4byte 0x00000000
lbl_00015170:
    # 0x15170
    .asciz "k/BIRIYA-DOh/DEp/TAIKETSU/h/SIMASHOU!"
    .balign 4
lbl_00015198:
    # 0x15198
    .asciz "9h/BANNk/BO-RUh/WOAITEYORIp/SAKI/h/NI"
    .balign 4
lbl_000151C0:
    # 0x151C0
    .asciz "p/Ochiru/h/TOSEBAp/KACHI/h/TONARIMASU!"
    .balign 4
lbl_000151E8:
    # 0x151E8
    .4byte lbl_00015170
    .4byte lbl_00015198
    .4byte lbl_000151C0
    .4byte 0x00000000
lbl_000151F8:
    # 0x151F8
    .asciz "k/BO-RUh/WOUMAKUk/KOROh/GASITE,"
lbl_00015218:
    # 0x15218
    .asciz "k/BOURINNGUh/NOk/PINNh/WOTAKUSANN"
    .balign 4
lbl_0001523C:
    # 0x1523C
    .asciz "h/TAOSIMASHOU!"
    .balign 4
lbl_0001524C:
    # 0x1524C
    .4byte lbl_000151F8
    .4byte lbl_00015218
    .4byte lbl_0001523C
    .4byte 0x00000000
lbl_0001525C:
    # 0x1525C
    .asciz "h/Ok/SARUh/SANNNOp/HAI/h/TTAk/BO-RUh/DE"
lbl_00015284:
    # 0x15284
    .asciz "k/PATA-GORUHUh/WOSIMASU!"
    .balign 4
lbl_000152A0:
    # 0x152A0
    .asciz "k/HO-RUINNWANNh/WOMEZASIMASHOU!"
lbl_000152C0:
    # 0x152C0
    .4byte lbl_0001525C
    .4byte lbl_00015284
    .4byte lbl_000152A0
    .4byte 0x00000000
lbl_000152D0:
    # 0x152D0
    .asciz "h/MADAKONOk/GE-MUh/HAASOBEMASENN."
    .balign 4
lbl_000152F4:
    # 0x152F4
    .asciz "k/PUREIPOINNTOh/WOTAMETE"
    .balign 4
lbl_00015310:
    # 0x15310
    .asciz "k/GE-MUh/WOk/GETTOh/SITEKUDASAI!"
    .balign 4
lbl_00015334:
    # 0x15334
    .4byte lbl_000152D0
    .4byte lbl_000152F4
    .4byte lbl_00015310
    .4byte 0x00000000
lbl_00015344:
    # 0x15344
    .asciz "k/MINIGE-MUh/WOk/GETTOh/DEKIMASU!"
    .balign 4
lbl_00015368:
    # 0x15368
    .asciz "k/MINIGE-MUh/1TUNITUKI,"
lbl_00015380:
    # 0x15380
    .asciz "a/2500k/PUREIPOINNTOp/TSUKAI/h/MASU."
    .balign 4
lbl_000153A8:
    # 0x153A8
    .4byte lbl_00015344
    .4byte lbl_00015368
    .4byte lbl_00015380
    .4byte 0x00000000
lbl_000153B8:
    # 0x153B8
    .asciz "COMh/TOp/TAISENN/h/SHIMASU."
lbl_000153D4:
    # 0x153D4
    .4byte lbl_000153B8
    .4byte 0x00000000
lbl_000153DC:
    # 0x153DC
    .asciz "h/2p/NINN/h/DEKOUTAISHITEASOBIMASU."
lbl_00015400:
    # 0x15400
    .4byte lbl_000153DC
    .4byte 0x00000000
lbl_00015408:
    # 0x15408
    .asciz "k/PATA-GORUHUh/NOk/KO-SUh/WOMAWATTE"
lbl_0001542C:
    # 0x1542C
    .asciz "k/TO-TARUSUKOAh/DEp/SHOUBU/h/SIMASU!"
    .balign 4
lbl_00015454:
    # 0x15454
    .4byte lbl_00014314
    .4byte lbl_00015408
    .4byte lbl_0001542C
    .4byte 0x00000000
lbl_00015464:
    # 0x15464
    .asciz "2p/NINN/k/PUREIh/SENNYOUDESU."
    .balign 4
lbl_00015484:
    # 0x15484
    .asciz "h/AITEYORIMO, SUKUNAIDASUUDE"
    .balign 4
lbl_000154A4:
    # 0x154A4
    .asciz "k/KAPPUINNh/SASETAHOUNOp/KAchi/h/CHIDESU!"
    .balign 4
lbl_000154D0:
    # 0x154D0
    .4byte lbl_00015464
    .4byte lbl_00015484
    .4byte lbl_000154A4
    .4byte 0x00000000
lbl_000154E0:
    # 0x154E0
    .asciz "h/KOUTAIDEa/2~4p/NINN/h/MADE"
    .balign 4
lbl_00015500:
    # 0x15500
    .asciz "h/ASOBEMASU."
    .balign 4
lbl_00015510:
    # 0x15510
    .4byte lbl_000154E0
    .4byte lbl_00015500
    .4byte 0x00000000
lbl_0001551C:
    # 0x1551C
    .asciz "h/MAWARUk/HO-RUh/p/SUU/h/DESU."
    .balign 4
lbl_0001553C:
    # 0x1553C
    .asciz "1k/RAUNNDO 18HO-RUh/WOMAWARIMASU."
    .balign 4
lbl_00015560:
    # 0x15560
    .asciz "p/KOME/k/RANNKINNGUh/GAARIMASU."
lbl_00015580:
    # 0x15580
    .4byte lbl_0001551C
    .4byte lbl_0001553C
    .4byte lbl_00015560
    .4byte 0x00000000
lbl_00015590:
    # 0x15590
    .4byte lbl_00014738
    .4byte 0x00000000
lbl_00015598:
    # 0x15598
    .asciz "k/AUTO 9HO-RUh/WOMAWARIMASU."
    .balign 4
lbl_000155B8:
    # 0x155B8
    .asciz "p/KOME/k/RANNKINNGUh/HAARIMASENN."
    .balign 4
lbl_000155DC:
    # 0x155DC
    .4byte lbl_0001551C
    .4byte lbl_00015598
    .4byte lbl_000155B8
    .4byte 0x00000000
lbl_000155EC:
    # 0x155EC
    .asciz "k/INN 9HO-RUh/WOMAWARIMASU."
lbl_00015608:
    # 0x15608
    .4byte lbl_0001551C
    .4byte lbl_000155EC
    .4byte lbl_000155B8
    .4byte 0x00000000
lbl_00015618:
    # 0x15618
    .4byte lbl_0001551C
    .4byte lbl_0001553C
    .4byte lbl_000155B8
    .4byte 0x00000000
lbl_00015628:
    # 0x15628
    .asciz "p/SHOUBU/h/SURUk/SETTOp/SUU/h/DESU."
lbl_0001564C:
    # 0x1564C
    .4byte lbl_00015628
    .4byte 0x00000000
lbl_00015654:
    # 0x15654
    .asciz "a/COMh/NOk/LEBELUh/DESU."
    .balign 4
lbl_00015670:
    # 0x15670
    .4byte lbl_00015654
    .4byte 0x00000000
lbl_00015678:
    # 0x15678
    .4byte lbl_00014738
    .4byte 0x00000000
lbl_00015680:
    # 0x15680
    .asciz "10k/HURE-MUh/WONAGETE,"
    .balign 4
lbl_00015698:
    # 0x15698
    .4byte lbl_00014314
    .4byte lbl_00015680
    .4byte lbl_0001542C
    .4byte 0x00000000
lbl_000156A8:
    # 0x156A8
    .asciz "1p/KAIsuu/h/DAKENAGETE, k/RE-NNp/JYOkyuu/h/NIARU"
    .balign 4
lbl_000156DC:
    # 0x156DC
    .asciz "k/PINNh/WOSUBETETAOSIMASHOU!"
    .balign 4
lbl_000156FC:
    # 0x156FC
    .4byte lbl_00014424
    .4byte lbl_000156A8
    .4byte lbl_000156DC
    .4byte 0x00000000
lbl_0001570C:
    # 0x1570C
    .asciz "h/KOUTAIDE, 2p/NINN/h/MADEASOBEMASU."
    .balign 4
lbl_00015734:
    # 0x15734
    .asciz "1p/NINN/k/PUREIh/HAa/COMh/TOp/TAISENN/h/SIMASU!"
lbl_00015764:
    # 0x15764
    .4byte lbl_0001570C
    .4byte lbl_00015734
    .4byte 0x00000000
lbl_00015770:
    # 0x15770
    .asciz "4h/HIKINOa/COMh/TO, TUGITUGINI"
    .balign 4
lbl_00015790:
    # 0x15790
    .asciz "p/SHOUBU/h/SURUp/KACHI/NUKI/SENN/h/DESU!"
    .balign 4
lbl_000157BC:
    # 0x157BC
    .4byte lbl_00014424
    .4byte lbl_00015770
    .4byte lbl_00015790
    .4byte 0x00000000
lbl_000157CC:
    # 0x157CC
    .asciz "k/RAUNNDOp/SUU/h/DESU."
    .balign 4
lbl_000157E4:
    # 0x157E4
    .4byte lbl_000157CC
    .4byte 0x00000000
lbl_000157EC:
    # 0x157EC
    .asciz "h/OTASUKEk/AITEMUh/WO"
    .balign 4
lbl_00015804:
    # 0x15804
    .asciz "p/TSUKAu/h/UKOTOGADEKIMASU."
lbl_00015820:
    # 0x15820
    .4byte lbl_000157EC
    .4byte lbl_00015804
    .4byte 0x00000000
lbl_0001582C:
    # 0x1582C
    .asciz "k/HURAITOh/MAENI, MAIKAI"
    .balign 4
lbl_00015848:
    # 0x15848
    .asciz "h/OJYAMAk/RU-RETTOh/GADEMASU."
    .balign 4
lbl_00015868:
    # 0x15868
    .4byte lbl_0001582C
    .4byte lbl_00015848
    .4byte 0x00000000
lbl_00015874:
    # 0x15874
    .4byte lbl_00014738
    .4byte 0x00000000
lbl_0001587C:
    # 0x1587C
    .4byte lbl_000157CC
    .4byte 0x00000000
lbl_00015884:
    # 0x15884
    .4byte lbl_000157CC
    .4byte 0x00000000
lbl_0001588C:
    # 0x1588C
    .4byte 0x00000000
    .4byte lbl_00014388
    .4byte lbl_00014414
    .4byte lbl_00014494
    .4byte lbl_000144EC
    .4byte lbl_00014518
    .4byte lbl_0001454C
    .4byte lbl_0001455C
    .4byte lbl_000145B4
    .4byte lbl_000145C4
    .4byte lbl_000145F0
    .4byte lbl_00014624
    .4byte lbl_0001464C
    .4byte lbl_000146B0
    .4byte lbl_000146D8
    .4byte lbl_00014750
    .4byte lbl_00014778
    .4byte lbl_000147F8
    .4byte lbl_00014874
    .4byte lbl_000148A8
    .4byte lbl_00014900
    .4byte lbl_0001494C
    .4byte lbl_00014978
    .4byte lbl_000149F4
    .4byte lbl_00014A40
    .4byte lbl_00014A90
    .4byte lbl_00014AB8
    .4byte lbl_00014AFC
    .4byte lbl_00014B50
    .4byte lbl_00014BD8
    .4byte lbl_00014C28
    .4byte lbl_00014C80
    .4byte lbl_00014CB4
    .4byte lbl_00014CE8
    .4byte lbl_00014D44
    .4byte lbl_00014DB8
    .4byte lbl_00014DE4
    .4byte lbl_00014DEC
    .4byte lbl_00014E2C
    .4byte lbl_00014E8C
    .4byte lbl_00014EBC
    .4byte lbl_00014EEC
    .4byte lbl_00014F20
    .4byte lbl_00014F68
    .4byte lbl_00014F8C
    .4byte lbl_00014FF8
    .4byte lbl_00015048
    .4byte lbl_0001507C
    .4byte lbl_00014DE4
    .4byte lbl_0001509C
    .4byte lbl_000150EC
    .4byte lbl_00015138
    .4byte lbl_00015144
    .4byte lbl_00014DE4
    .4byte lbl_0001514C
    .4byte lbl_00015154
    .4byte lbl_00015164
    .4byte lbl_000151E8
    .4byte lbl_0001524C
    .4byte lbl_000152C0
    .4byte lbl_00015334
    .4byte lbl_000153A8
    .4byte lbl_000153D4
    .4byte lbl_00015400
    .4byte lbl_00015454
    .4byte lbl_000154D0
    .4byte lbl_00015510
    .4byte lbl_00015580
    .4byte lbl_00014DE4
    .4byte lbl_00015590
    .4byte lbl_000155DC
    .4byte lbl_00015608
    .4byte lbl_00015618
    .4byte lbl_0001564C
    .4byte lbl_00014DE4
    .4byte lbl_00015678
    .4byte lbl_0001564C
    .4byte lbl_00015670
    .4byte lbl_00014DE4
    .4byte lbl_00015678
    .4byte lbl_00015698
    .4byte lbl_000156FC
    .4byte lbl_00015764
    .4byte lbl_000157BC
    .4byte lbl_000157E4
    .4byte lbl_00015820
    .4byte lbl_00015868
    .4byte lbl_00014DE4
    .4byte lbl_00015874
    .4byte lbl_0001587C
    .4byte lbl_00015884
    .4byte lbl_0001588C
    .4byte lbl_000141A8
lbl_00015A00:
    # 0x15A00
    .asciz "a/-Jungle Circuit-"
    .balign 4
lbl_00015A14:
    # 0x15A14
    .asciz "a/Beginner Courses / Length:483miles"
    .balign 4
lbl_00015A3C:
    # 0x15A3C
    .asciz "a/Beginner Courses / LAPS:5"
lbl_00015A58:
    # 0x15A58
    .asciz "a/-Aqua Offroad-"
    .balign 4
lbl_00015A6C:
    # 0x15A6C
    .asciz "a/Beginner Courses / Length:528miles"
    .balign 4
lbl_00015A94:
    # 0x15A94
    .asciz "a/-Frozen Highway-"
    .balign 4
lbl_00015AA8:
    # 0x15AA8
    .asciz "a/Advanced Courses / Length:544miles"
    .balign 4
lbl_00015AD0:
    # 0x15AD0
    .asciz "a/Advanced Courses / LAPS:4"
lbl_00015AEC:
    # 0x15AEC
    .asciz "a/-Sky Downtown-"
    .balign 4
lbl_00015B00:
    # 0x15B00
    .asciz "a/Advanced Courses / Length:1247miles"
    .balign 4
lbl_00015B28:
    # 0x15B28
    .asciz "a/Advanced Courses / LAPS:3"
lbl_00015B44:
    # 0x15B44
    .asciz "a/-Pipe Warp Tunnel-"
    .balign 4
lbl_00015B5C:
    # 0x15B5C
    .asciz "a/Expert Courses / Length:622miles"
    .balign 4
lbl_00015B80:
    # 0x15B80
    .asciz "a/Expert Courses / LAPS:4"
    .balign 4
lbl_00015B9C:
    # 0x15B9C
    .asciz "a/-Speed Desert-"
    .balign 4
lbl_00015BB0:
    # 0x15BB0
    .asciz "a/Expert Courses / Length:1461miles"
lbl_00015BD4:
    # 0x15BD4
    .asciz "a/Expert Courses / LAPS:2"
    .balign 4
lbl_00015BF0:
    # 0x15BF0
    .4byte lbl_00015A00
    .4byte lbl_00015A14
    .4byte lbl_00015A3C
    .4byte lbl_00015A58
    .4byte lbl_00015A6C
    .4byte lbl_00015A3C
    .4byte lbl_00015A94
    .4byte lbl_00015AA8
    .4byte lbl_00015AD0
    .4byte lbl_00015AEC
    .4byte lbl_00015B00
    .4byte lbl_00015B28
    .4byte lbl_00015B44
    .4byte lbl_00015B5C
    .4byte lbl_00015B80
    .4byte lbl_00015B9C
    .4byte lbl_00015BB0
    .4byte lbl_00015BD4
lbl_00015C38:
    # 0x15C38
    .asciz "k/~JYANNGURUSA-KITTO~"
    .balign 4
lbl_00015C50:
    # 0x15C50
    .asciz "p/SHOKYUU/k/KO-SU a// h/NAGASAa/:777m"
    .balign 4
lbl_00015C78:
    # 0x15C78
    .asciz "p/SHOKYUU/k/KO-SU a// k/RAPPUp/SUU/a/:5"
lbl_00015CA0:
    # 0x15CA0
    .asciz "k/~AKUAOHURO-DO~"
    .balign 4
lbl_00015CB4:
    # 0x15CB4
    .asciz "p/SHOKYUU/k/KO-SU a// h/NAGASAa/:849m"
    .balign 4
lbl_00015CDC:
    # 0x15CDC
    .asciz "k/~HURO-ZUNNHAIUXEI~"
    .balign 4
lbl_00015CF4:
    # 0x15CF4
    .asciz "p/CHUKYUU/k/KO-SU a// h/NAGASAa/:875m"
    .balign 4
lbl_00015D1C:
    # 0x15D1C
    .asciz "p/CHUKYUU/k/KO-SU a// k/RAPPUp/SUU/a/:4"
lbl_00015D44:
    # 0x15D44
    .asciz "k/~SUKAIDAUNNTAUNN~"
lbl_00015D58:
    # 0x15D58
    .asciz "p/CHUKYUU/k/KO-SU a// h/NAGASAa/:2007m"
    .balign 4
lbl_00015D80:
    # 0x15D80
    .asciz "p/CHUKYUU/k/KO-SU a// k/RAPPUp/SUU/a/:3"
lbl_00015DA8:
    # 0x15DA8
    .asciz "k/~PAIPUWA-PUTONNNERU~"
    .balign 4
lbl_00015DC0:
    # 0x15DC0
    .asciz "p/JYOKYUU/k/KO-SU a// h/NAGASAa/:1000m"
    .balign 4
lbl_00015DE8:
    # 0x15DE8
    .asciz "p/JYOKYUU/k/KO-SU a// k/RAPPUp/SUU/a/:4"
lbl_00015E10:
    # 0x15E10
    .asciz "k/~SUPI-DODEZA-TO~"
    .balign 4
lbl_00015E24:
    # 0x15E24
    .asciz "p/JYOKYUU/k/KO-SU a// h/NAGASAa/:2351m"
    .balign 4
lbl_00015E4C:
    # 0x15E4C
    .asciz "p/JYOKYUU/k/KO-SU a// k/RAPPUp/SUU/a/:2"
lbl_00015E74:
    # 0x15E74
    .4byte lbl_00015C38
    .4byte lbl_00015C50
    .4byte lbl_00015C78
    .4byte lbl_00015CA0
    .4byte lbl_00015CB4
    .4byte lbl_00015C78
    .4byte lbl_00015CDC
    .4byte lbl_00015CF4
    .4byte lbl_00015D1C
    .4byte lbl_00015D44
    .4byte lbl_00015D58
    .4byte lbl_00015D80
    .4byte lbl_00015DA8
    .4byte lbl_00015DC0
    .4byte lbl_00015DE8
    .4byte lbl_00015E10
    .4byte lbl_00015E24
    .4byte lbl_00015E4C
    .4byte lbl_00015E74
    .4byte lbl_00015BF0
lbl_00015EC4:
    # 0x15EC4
    .asciz "a/*Good at pocketing balls."
lbl_00015EE0:
    # 0x15EE0
    .asciz "a/*Good at using walls."
lbl_00015EF8:
    # 0x15EF8
    .asciz "a/*Good at hitting the 9 ball."
    .balign 4
lbl_00015F18:
    # 0x15F18
    .asciz "a/*Good at making power shots."
    .balign 4
lbl_00015F38:
    # 0x15F38
    .4byte lbl_00015EC4
    .4byte lbl_00015EE0
    .4byte lbl_00015EF8
    .4byte lbl_00015F18
lbl_00015F48:
    # 0x15F48
    .asciz "p/*/h/KAKUJITUNIk/BO-RUh/WOp/OTO/h/SUNOGATOKUI."
lbl_00015F78:
    # 0x15F78
    .asciz "p/*/k/KUSSHONNh/WOp/TSUKAU/h/NOGATOKUI."
lbl_00015FA0:
    # 0x15FA0
    .asciz "p/*/h/9BANNNOk/BO-RUh/NIATERUNOGATOKUI."
lbl_00015FC8:
    # 0x15FC8
    .asciz "p/*/h/CHIKARADUYOIk/SHOTTOh/GATOKUI."
    .balign 4
lbl_00015FF0:
    # 0x15FF0
    .4byte lbl_00015F48
    .4byte lbl_00015F78
    .4byte lbl_00015FA0
    .4byte lbl_00015FC8
    .4byte lbl_00015FF0
    .4byte lbl_00015F38
    .asciz "p/BUTTON_A/\np/BUTTON_B/"
    .asciz "p/BUTTON_X/\np/BUTTON_A/\np/BUTTON_B/"
    .asciz "a/Lesson"
    .balign 4
    .asciz "a/Select"
    .balign 4
    .asciz "a/Cancel"
    .balign 4
lbl_00016068:
    # 0x16068
    .asciz "a/Number of match(es)?             (1~5)            "
    .balign 4
lbl_000160A0:
    # 0x160A0
    .asciz "a/You can enter any stage you have already played."
    .balign 4
lbl_000160D4:
    # 0x160D4
    .4byte lbl_00016068
    .4byte lbl_000160A0
    .4byte 0x00000000
lbl_000160E0:
    # 0x160E0
    .asciz "a/Match(es):"
    .balign 4
lbl_000160F0:
    # 0x160F0
    .4byte lbl_000160E0
    .4byte lbl_000160A0
    .4byte 0x00000000
lbl_000160FC:
    # 0x160FC
    .asciz "a/The game will start once you've selected a stage."
lbl_00016130:
    # 0x16130
    .4byte lbl_000160FC
    .4byte lbl_000160A0
    .4byte 0x00000000
lbl_0001613C:
    # 0x1613C
    .asciz "a/Number of win(s)?              (1~5)            "
    .balign 4
lbl_00016170:
    # 0x16170
    .asciz "a/Select how many wins are necessary to win."
    .balign 4
lbl_000161A0:
    # 0x161A0
    .4byte lbl_0001613C
    .4byte lbl_00016170
    .4byte 0x00000000
lbl_000161AC:
    # 0x161AC
    .asciz "a/Win(s) needed:   "
lbl_000161C0:
    # 0x161C0
    .asciz "a/Select a stage for the battle here."
    .balign 4
lbl_000161E8:
    # 0x161E8
    .4byte lbl_000161AC
    .4byte lbl_000161C0
    .4byte 0x00000000
lbl_000161F4:
    # 0x161F4
    .asciz "a/When you finish 3 stages, you will go back to the 1st stage."
    .balign 4
lbl_00016234:
    # 0x16234
    .4byte lbl_000161AC
    .4byte lbl_000161F4
    .4byte 0x00000000
lbl_00016240:
    # 0x16240
    .4byte 0x00000000
    .4byte lbl_000160D4
    .4byte lbl_000160F0
    .4byte lbl_00016130
    .4byte lbl_000161A0
    .4byte lbl_000161E8
    .4byte lbl_00016234
lbl_0001625C:
    # 0x1625C
    .asciz "p/NANNBONN/SHOUBU/h/?          (1~5)"
    .balign 4
lbl_00016284:
    # 0x16284
    .asciz "k/PUREIh/SITAk/SUTE-JIh/KARAk/ENNTORI-h/DEKIMASU"
    .balign 4
lbl_000162B8:
    # 0x162B8
    .4byte lbl_0001625C
    .4byte lbl_00016284
    .4byte 0x00000000
lbl_000162C4:
    # 0x162C4
    .asciz "h/  p/HONN/SHOUBU/"
    .balign 4
lbl_000162D8:
    # 0x162D8
    .4byte lbl_000162C4
    .4byte lbl_00016284
    .4byte 0x00000000
lbl_000162E4:
    # 0x162E4
    .asciz "k/SUTE-JIh/WOERANNDEk/GE-MUh/WOHAJIMEMASU."
    .balign 4
lbl_00016310:
    # 0x16310
    .4byte lbl_000162E4
    .4byte lbl_00016284
    .4byte 0x00000000
lbl_0001631C:
    # 0x1631C
    .asciz "p/NANNBONN/SENNSHU/h/?          (1~5)"
    .balign 4
lbl_00016344:
    # 0x16344
    .asciz "p/SAKI/h/NIp/NANNKAI/KATE/h/BAIINOKAWOKIMEMASU"
    .balign 4
lbl_00016374:
    # 0x16374
    .4byte lbl_0001631C
    .4byte lbl_00016344
    .4byte 0x00000000
lbl_00016380:
    # 0x16380
    .asciz "  p/HONN/SENNSHU/"
    .balign 4
lbl_00016394:
    # 0x16394
    .asciz "h/TATAKAUk/SUTE-JIh/WO1TUERABIMASU"
    .balign 4
lbl_000163B8:
    # 0x163B8
    .4byte lbl_00016380
    .4byte lbl_00016394
    .4byte 0x00000000
lbl_000163C4:
    # 0x163C4
    .asciz "3k/SUTE-JIh/OWARUTO1TUMENIMODORIMASU"
    .balign 4
lbl_000163EC:
    # 0x163EC
    .4byte lbl_00016380
    .4byte lbl_000163C4
    .4byte 0x00000000
lbl_000163F8:
    # 0x163F8
    .4byte 0x00000000
    .4byte lbl_000162B8
    .4byte lbl_000162D8
    .4byte lbl_00016310
    .4byte lbl_00016374
    .4byte lbl_000163B8
    .4byte lbl_000163EC
    .4byte lbl_000163F8
    .4byte lbl_00016240
    .4byte 0x25640000
lbl_00016420:
    # 0x16420
    .asciz "p/BUTTON_A/c/0xffff00/a/Select"
    .balign 4
lbl_00016440:
    # 0x16440
    .asciz "p/BUTTON_A/c/0x202000/a/Select"
    .balign 4
    .asciz "p/SANNKAKU_L/"
    .balign 4
    .asciz "p/SANNKAKU_R/"
    .balign 4
    .4byte 0x25730000
lbl_00016484:
    # 0x16484
    .asciz "%02d"
    .balign 4
lbl_0001648C:
    # 0x1648C
    .asciz "a/Bananas  1st place"
    .balign 4
lbl_000164A4:
    # 0x164A4
    .asciz "a/            2nd place"
lbl_000164BC:
    # 0x164BC
    .asciz "a/            3rd place"
lbl_000164D4:
    # 0x164D4
    .asciz "a/Consecutive win bonus"
lbl_000164EC:
    # 0x164EC
    .asciz "a/Stage bananas"
lbl_000164FC:
    # 0x164FC
    .4byte lbl_0001648C
    .4byte lbl_000164A4
    .4byte lbl_000164BC
    .4byte lbl_000164D4
    .4byte lbl_000164EC
    .4byte 0x00000000
lbl_00016514:
    # 0x16514
    .asciz "a/Number of laps"
    .balign 4
lbl_00016528:
    # 0x16528
    .asciz "a/COM"
    .balign 4
lbl_00016530:
    # 0x16530
    .asciz "a/Handicap"
    .balign 4
lbl_0001653C:
    # 0x1653C
    .asciz "a/Items"
lbl_00016544:
    # 0x16544
    .4byte lbl_00016514
    .4byte lbl_00016528
    .4byte lbl_00016530
    .4byte lbl_0001653C
    .4byte 0x00000000
lbl_00016558:
    # 0x16558
    .4byte lbl_00016528
    .4byte lbl_00016530
    .4byte lbl_0001653C
    .4byte 0x00000000
lbl_00016568:
    # 0x16568
    .4byte lbl_00016528
    .4byte 0x00000000
lbl_00016570:
    # 0x16570
    .asciz "a/Number of holes"
    .balign 4
lbl_00016584:
    # 0x16584
    .4byte lbl_00016570
    .4byte 0x00000000
lbl_0001658C:
    # 0x1658C
    .asciz "a/Number of sets"
    .balign 4
lbl_000165A0:
    # 0x165A0
    .4byte lbl_0001658C
    .4byte 0x00000000
lbl_000165A8:
    # 0x165A8
    .asciz "a/COM level"
lbl_000165B4:
    # 0x165B4
    .4byte lbl_0001658C
    .4byte lbl_000165A8
    .4byte 0x00000000
lbl_000165C0:
    # 0x165C0
    .asciz "a/Number of rounds"
    .balign 4
lbl_000165D4:
    # 0x165D4
    .asciz "a/Help Items"
    .balign 4
lbl_000165E4:
    # 0x165E4
    .asciz "a/Wheel of Danger"
    .balign 4
lbl_000165F8:
    # 0x165F8
    .4byte lbl_000165C0
    .4byte lbl_000165D4
    .4byte lbl_000165E4
    .4byte 0x00000000
lbl_00016608:
    # 0x16608
    .4byte 0x00000000
    .4byte lbl_000164FC
    .4byte lbl_00016544
    .4byte lbl_00016558
    .4byte lbl_00016568
    .4byte lbl_00016584
    .4byte lbl_000165A0
    .4byte lbl_000165B4
    .4byte lbl_000165F8
lbl_0001662C:
    # 0x1662C
    .asciz "h/MORAERUk/BANANA 1p/KURAI/"
lbl_00016648:
    # 0x16648
    .asciz "               2p/KURAI/"
    .balign 4
lbl_00016664:
    # 0x16664
    .asciz "               3p/KURAI/"
    .balign 4
lbl_00016680:
    # 0x16680
    .asciz "h/RENNSHOUk/BO-NASU"
lbl_00016694:
    # 0x16694
    .asciz "k/SUTE-JIh/NOk/BANANA"
    .balign 4
lbl_000166AC:
    # 0x166AC
    .4byte lbl_0001662C
    .4byte lbl_00016648
    .4byte lbl_00016664
    .4byte lbl_00016680
    .4byte lbl_00016694
    .4byte 0x00000000
lbl_000166C4:
    # 0x166C4
    .asciz "k/LAPPUp/KAZU/"
    .balign 4
lbl_000166D4:
    # 0x166D4
    .asciz "k/ASISUTO"
    .balign 4
lbl_000166E0:
    # 0x166E0
    .asciz "k/AITEMU"
    .balign 4
lbl_000166EC:
    # 0x166EC
    .4byte lbl_000166C4
    .4byte lbl_00016528
    .4byte lbl_000166D4
    .4byte lbl_000166E0
    .4byte 0x00000000
lbl_00016700:
    # 0x16700
    .4byte lbl_00016528
    .4byte lbl_000166D4
    .4byte lbl_000166E0
    .4byte 0x00000000
lbl_00016710:
    # 0x16710
    .4byte lbl_00016528
    .4byte 0x00000000
lbl_00016718:
    # 0x16718
    .asciz "k/HO-RUp/SUU/"
    .balign 4
lbl_00016728:
    # 0x16728
    .4byte lbl_00016718
    .4byte 0x00000000
lbl_00016730:
    # 0x16730
    .asciz "k/SETTOp/SUU/"
    .balign 4
lbl_00016740:
    # 0x16740
    .4byte lbl_00016730
    .4byte 0x00000000
lbl_00016748:
    # 0x16748
    .asciz "a/COMh/NOTUYOSA"
lbl_00016758:
    # 0x16758
    .4byte lbl_00016730
    .4byte lbl_00016748
    .4byte 0x00000000
lbl_00016764:
    # 0x16764
    .asciz "k/RAUNNDOp/SUU/"
lbl_00016774:
    # 0x16774
    .asciz "h/OTASUKEk/AITEMU"
    .balign 4
lbl_00016788:
    # 0x16788
    .asciz "h/OJYAMAk/RU-RETTO"
    .balign 4
lbl_0001679C:
    # 0x1679C
    .4byte lbl_00016764
    .4byte lbl_00016774
    .4byte lbl_00016788
    .4byte 0x00000000
lbl_000167AC:
    # 0x167AC
    .4byte 0x00000000
    .4byte lbl_000166AC
    .4byte lbl_000166EC
    .4byte lbl_00016700
    .4byte lbl_00016710
    .4byte lbl_00016728
    .4byte lbl_00016740
    .4byte lbl_00016758
    .4byte lbl_0001679C
    .4byte lbl_000167AC
    .4byte lbl_00016608
lbl_000167D8:
    # 0x167D8
    .4byte 0x20313800
lbl_000167DC:
    # 0x167DC
    .4byte 0x4F555400
lbl_000167E0:
    # 0x167E0
    .4byte 0x20494E00
lbl_000167E4:
    # 0x167E4
    .asciz "h/  1"
    .balign 4
lbl_000167EC:
    # 0x167EC
    .asciz "h/  2"
    .balign 4
lbl_000167F4:
    # 0x167F4
    .asciz "h/  3"
    .balign 4
lbl_000167FC:
    # 0x167FC
    .asciz "h/  4"
    .balign 4
lbl_00016804:
    # 0x16804
    .asciz "k/  5"
    .balign 4
    .4byte 0x25336400
    .4byte 0x204F4E00
    .4byte 0x4F464600
    .4byte 0x25337300
lbl_0001681C:
    # 0x1681C
    .4byte lbl_0000C960
    .4byte lbl_0000C550
    .4byte lbl_0000C5F4
    .4byte lbl_0000C6D0
    .4byte lbl_0000C780
    .4byte lbl_0000C7C0
    .4byte lbl_0000C81C
    .4byte lbl_0000C81C
    .4byte lbl_0000C8C4
    .asciz "a/Change\na/settings"
    .asciz "a/Game\n   Start"
    .4byte 0x33000000
    .4byte 0x3A000000
lbl_0001686C:
    # 0x1686C
    .asciz "a/Mid-Summer Jungle Square"
    .balign 4
lbl_00016888:
    # 0x16888
    .asciz "a/Cold Ice Octagon"
    .balign 4
lbl_0001689C:
    # 0x1689C
    .asciz "a/High-Flying UFO Circle"
    .balign 4
lbl_000168B8:
    # 0x168B8
    .4byte lbl_0001686C
    .4byte lbl_00016888
    .4byte lbl_0001689C
lbl_000168C4:
    # 0x168C4
    .asciz "h/MANATUNOk/JYANNGURUSUKUEA"
lbl_000168E0:
    # 0x168E0
    .asciz "h/TUMETAIk/AISUOKUTAGONN"
    .balign 4
lbl_000168FC:
    # 0x168FC
    .asciz "h/SORATOBUa/UFOk/SA-KURU"
    .balign 4
lbl_00016918:
    # 0x16918
    .4byte lbl_000168C4
    .4byte lbl_000168E0
    .4byte lbl_000168FC
    .4byte lbl_00016918
    .4byte lbl_000168B8
lbl_0001692C:
    # 0x1692C
    .asciz "a/Survive the square-shaped jungle!"
lbl_00016950:
    # 0x16950
    .asciz "a/Battle furiously on a frozen world!"
    .balign 4
lbl_00016978:
    # 0x16978
    .asciz "a/Great space battle! Can you survive?"
    .balign 4
lbl_000169A0:
    # 0x169A0
    .4byte lbl_0001692C
    .4byte lbl_00016950
    .4byte lbl_00016978
lbl_000169AC:
    # 0x169AC
    .asciz "h/SIKAKUIk/JYANNGURUh/DE, k/SABAIBARUh/SURUNODA!"
    .balign 4
lbl_000169E0:
    # 0x169E0
    .asciz "h/KOORINITOZASARETASEKAIDE, ATUKIp/TATAKAI/h/WO!"
    .balign 4
lbl_00016A14:
    # 0x16A14
    .asciz "h/UCHUUDEp/DAI/SENNSOU/k/!KIMIh/HAIKINOKORERUKA?"
    .balign 4
lbl_00016A48:
    # 0x16A48
    .4byte lbl_000169AC
    .4byte lbl_000169E0
    .4byte lbl_00016A14
    .4byte lbl_00016A48
    .4byte lbl_000169A0
    .4byte 0x430C0000
    .4byte 0x43700000
    .4byte 0x43FA0000
    .4byte 0x43700000
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x42E80000
    .4byte 0x43700000
    .4byte 0x437E0000
    .4byte 0x43700000
    .4byte 0x43C20000
    .4byte 0x43700000
    .4byte 0x44030000
    .4byte 0x43700000
    .4byte 0x430C0000
    .4byte 0x43700000
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x43FA0000
    .4byte 0x43700000
    .4byte 0x430C0000
    .4byte 0x43700000
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x43FA0000
    .4byte 0x43700000
    .4byte 0x430C0000
    .4byte 0x43700000
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x43FA0000
    .4byte 0x43700000
    .4byte 0x430C0000
    .4byte 0x43700000
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x43FA0000
    .4byte 0x43700000
    .4byte 0x43660000
    .4byte 0x43700000
    .4byte 0x43CD0000
    .4byte 0x43700000
    .4byte 0x43FA0000
    .4byte 0x43700000
    .4byte 0x43660000
    .4byte 0x43700000
    .4byte 0x43CD0000
    .4byte 0x43700000
    .4byte 0x43660000
    .4byte 0x43700000
    .4byte 0x43CD0000
    .4byte 0x43700000
    .asciz "e3 plate %d"
    .4byte 0x432A0000
    .4byte 0x43870000
    .4byte 0x43B90000
    .4byte 0x43EB0000
lbl_00016B48:
    # 0x16B48
    .4byte lbl_0000ECEC
    .4byte lbl_0000EFB4
    .4byte lbl_0000F28C
    .4byte lbl_0000F2A0
    .4byte lbl_0000F460
    .4byte lbl_0000ECEC
    .4byte lbl_0000F760
    .4byte lbl_0000F4B4
    .4byte lbl_0000ECEC
    .4byte lbl_0000EFB4
    .4byte lbl_0000ECEC
    .4byte lbl_0000EFB4
    .4byte 0x00000411
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x43140000
    .4byte 0x43900000
    .4byte 0x43080000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43660000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x43660000
    .4byte 0x00000000
    .4byte 0x43280000
    .4byte 0x42400000
    .4byte 0x0000040F
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42000000
    .4byte 0x42200000
    .4byte 0x0000040F
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x42000000
    .4byte 0x00000000
    .4byte 0x42000000
    .4byte 0x42200000
    .4byte 0x0000040F
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x42800000
    .4byte 0x00000000
    .4byte 0x42000000
    .4byte 0x42200000
    .4byte 0x0000040F
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x42C00000
    .4byte 0x00000000
    .4byte 0x42000000
    .4byte 0x42200000
    .4byte 0x00000411
    .4byte 0x0000000A
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x43990000
    .4byte 0x43100000
    .4byte 0x42BC0000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x438E0000
    .4byte 0x43900000
    .4byte 0x42E80000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x439E0000
    .4byte 0x43400000
    .4byte 0x42A40000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x439A0000
    .4byte 0x42C00000
    .4byte 0x42B80000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x43520000
    .4byte 0x42C00000
    .4byte 0x42C40000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x433A0000
    .4byte 0x43400000
    .4byte 0x43020000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x43900000
    .4byte 0x43140000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x43A80000
    .4byte 0x43100000
    .4byte 0x42400000
    .4byte 0x0000043A
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x00000000
    .4byte 0x42C00000
    .4byte 0x43520000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x430A0000
    .4byte 0x43C00000
    .4byte 0x42F00000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x439B0000
    .4byte 0x43A80000
    .4byte 0x42B40000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x00000000
    .4byte 0x43C00000
    .4byte 0x430A0000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x43380000
    .4byte 0x43100000
    .4byte 0x42F40000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000009
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x43820000
    .4byte 0x43900000
    .4byte 0x42E00000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x00000000
    .4byte 0x43400000
    .4byte 0x433A0000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x00000000
    .4byte 0x43100000
    .4byte 0x43380000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x43600000
    .4byte 0x42400000
    .4byte 0x42880000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x00000000
    .4byte 0x42400000
    .4byte 0x43600000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x43810000
    .4byte 0x43C00000
    .4byte 0x43000000
    .4byte 0x42400000
    .4byte 0x0000040F
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x42400000
    .4byte 0x43000000
    .4byte 0x42200000
    .4byte 0x0000040F
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x42B00000
    .4byte 0x43000000
    .4byte 0x42200000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x43920000
    .4byte 0x42400000
    .4byte 0x42D40000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x00000000
    .4byte 0x43700000
    .4byte 0x43180000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x43660000
    .4byte 0x43A80000
    .4byte 0x42A00000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x439A0000
    .4byte 0x42C00000
    .4byte 0x42B80000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x43180000
    .4byte 0x43700000
    .4byte 0x430A0000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x43100000
    .4byte 0x43A80000
    .4byte 0x42AC0000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x436A0000
    .4byte 0x43A80000
    .4byte 0x42F00000
    .4byte 0x42400000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x43910000
    .4byte 0x43700000
    .4byte 0x42D40000
    .4byte 0x42400000
    .asciz "%dpts"
    .balign 4
    .4byte 0x00000414
    .4byte 0x00000413
    .4byte 0x00000415
    .4byte 0x00000405
    .asciz "e3 chara"
    .balign 4
    .asciz "hanawa%d"
    .balign 4
lbl_00017048:
    # 0x17048
    .4byte 0x42A00000
    .4byte 0x43560000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43000000
    .4byte 0x43000000
    .4byte 0x43700000
    .4byte 0x43560000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43000000
    .4byte 0x43000000
    .4byte 0x43C80000
    .4byte 0x43560000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43000000
    .4byte 0x43000000
    .4byte 0x440C0000
    .4byte 0x43560000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43000000
    .4byte 0x43000000
    .4byte 0x42A00000
    .4byte 0x43860000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42900000
    .4byte 0x41C00000
    .4byte 0x43700000
    .4byte 0x43860000
    .4byte 0x00000000
    .4byte 0x41C00000
    .4byte 0x43000000
    .4byte 0x41C00000
    .4byte 0x43C80000
    .4byte 0x43860000
    .4byte 0x42900000
    .4byte 0x00000000
    .4byte 0x42C00000
    .4byte 0x41C00000
    .4byte 0x440C0000
    .4byte 0x43860000
    .4byte 0x00000000
    .4byte 0x42400000
    .4byte 0x43020000
    .4byte 0x41C00000
    .4byte 0x42A00000
    .4byte 0x439A8000
    .4byte 0x43280000
    .4byte 0x00000000
    .4byte 0x41800000
    .4byte 0x41800000
    .4byte 0x43700000
    .4byte 0x439A8000
    .4byte 0x43280000
    .4byte 0x00000000
    .4byte 0x41800000
    .4byte 0x41800000
    .4byte 0x43C80000
    .4byte 0x439A8000
    .4byte 0x43280000
    .4byte 0x00000000
    .4byte 0x41800000
    .4byte 0x41800000
    .4byte 0x440C0000
    .4byte 0x439A8000
    .4byte 0x43280000
    .4byte 0x00000000
    .4byte 0x41800000
    .4byte 0x41800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42900000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42B80000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42E00000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43040000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42200000
    .4byte 0x42900000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42200000
    .4byte 0x42B80000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42200000
    .4byte 0x42E00000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42200000
    .4byte 0x43040000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x42900000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x42B80000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x42E00000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x43040000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42F00000
    .4byte 0x42900000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42F00000
    .4byte 0x42B80000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42F00000
    .4byte 0x42E00000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42F00000
    .4byte 0x43040000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x42900000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x42B80000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x42E00000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x43040000
    .4byte 0x42200000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43180000
    .4byte 0x42200000
    .4byte 0x41E00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42200000
    .4byte 0x43180000
    .4byte 0x42200000
    .4byte 0x41E00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x43180000
    .4byte 0x42200000
    .4byte 0x41E00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42F00000
    .4byte 0x43180000
    .4byte 0x42200000
    .4byte 0x41E00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x43180000
    .4byte 0x42200000
    .4byte 0x41E00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43080000
    .4byte 0x41C00000
    .4byte 0x42000000
    .4byte 0x41C00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43280000
    .4byte 0x41C00000
    .4byte 0x42000000
    .4byte 0x41C00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43080000
    .4byte 0x42400000
    .4byte 0x42000000
    .4byte 0x41C00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43280000
    .4byte 0x42400000
    .4byte 0x42000000
    .4byte 0x41C00000
lbl_00017420:
    # 0x17420
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC1900000
    .4byte 0x41900000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC2100000
    .4byte 0x00000000
    .4byte 0x42100000
    .4byte 0x00000000
    .4byte 0xC2580000
    .4byte 0xC1900000
    .4byte 0x41900000
    .4byte 0x42580000
lbl_00017460:
    # 0x17460
    .4byte lbl_000120FC
    .4byte lbl_00012114
    .4byte lbl_0001212C
lbl_0001746C:
    # 0x1746C
    .asciz "level %d"
    .balign 4
lbl_00017478:
    # 0x17478
    .asciz "a/Current Play Points:"
    .balign 4
lbl_00017490:
    # 0x17490
    .asciz "%4dpt(s)"

# 6
.section .bss
.if 0
lbl_10000000:
    .skip 0x18
lbl_10000018:
    .skip 0x24
lbl_1000003C:
    .skip 0x84
lbl_100000C0:
    .skip 0x744
.endif
lbl_10000804:
    .skip 0x1D0
lbl_100009D4:
    .skip 0x4
lbl_100009D8:
    .skip 0x40

