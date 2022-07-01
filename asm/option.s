# id: 11
# version: 1
# nameoffset: 0x157, size: 0x1C
# section table: 0x40, size: 0x88
# imp table: 0x136C8
# relocs offset: 0xE240
# _prolog:     1:0x0
# _epilog:     1:0x9C
# _unresolved: 1:0xE4
# num sections: 17
.include "macros.inc"
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000C8	length: 0x0000C15C	flags: 1
# offset: 0x0000C224	length: 0x00000004	flags: 0
# offset: 0x0000C228	length: 0x00000004	flags: 0
# offset: 0x0000C230	length: 0x00000410	flags: 0
# offset: 0x0000C640	length: 0x00001C00	flags: 0
# offset: 0x10000000	length: 0x00006F40	flags: 0
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
/* 000000C8 7C0802A6 */ mflr r0
/* 000000CC 3C600000 */ lis r3, lbl_802F2130@ha
/* 000000D0 90010004 */ stw r0, 4(r1)
/* 000000D4 38000001 */ li r0, 1
/* 000000D8 9421FFF8 */ stwu r1, -8(r1)
/* 000000DC 90030000 */ stw r0, lbl_802F2130@l(r3)
/* 000000E0 480000CD */ bl func_8002FFEC
/* 000000E4 480000C9 */ bl free_all_bitmap_groups_except_com
/* 000000E8 480000C5 */ bl func_800249D4
/* 000000EC 480000C1 */ bl unload_stage
/* 000000F0 38600000 */ li r3, 0
/* 000000F4 480000B9 */ bl light_init
/* 000000F8 480000B5 */ bl event_finish_all
/* 000000FC 38600010 */ li r3, 0x10
/* 00000100 480000AD */ bl event_start
/* 00000104 38600012 */ li r3, 0x12
/* 00000108 480000A5 */ bl event_start
/* 0000010C 38600004 */ li r3, 4
/* 00000110 4800009D */ bl call_bitmap_load_group
/* 00000114 480046BD */ bl lbl_000047D0
/* 00000118 38600100 */ li r3, 0x100
/* 0000011C 38800000 */ li r4, 0
/* 00000120 38A0001E */ li r5, 0x1e
/* 00000124 48000089 */ bl start_screen_fade
/* 00000128 3CE00000 */ lis r7, lbl_00000258@ha
/* 0000012C 3CC00000 */ lis r6, lbl_802F1B74@ha
/* 00000130 38070000 */ addi r0, r7, lbl_00000258@l
/* 00000134 3CA00000 */ lis r5, lbl_00003F10@ha
/* 00000138 90060000 */ stw r0, lbl_802F1B74@l(r6)
/* 0000013C 3C600000 */ lis r3, lbl_0000C6A8@ha
/* 00000140 3C800000 */ lis r4, lbl_802F1B70@ha
/* 00000144 38050000 */ addi r0, r5, lbl_00003F10@l
/* 00000148 90040000 */ stw r0, lbl_802F1B70@l(r4)
/* 0000014C 38630000 */ addi r3, r3, lbl_0000C6A8@l
/* 00000150 4800005D */ bl puts
/* 00000154 8001000C */ lwz r0, 0xc(r1)
/* 00000158 38210008 */ addi r1, r1, 8
/* 0000015C 7C0803A6 */ mtlr r0
/* 00000160 4E800020 */ blr 
.global _epilog
_epilog:
/* 00000164 7C0802A6 */ mflr r0
/* 00000168 90010004 */ stw r0, 4(r1)
/* 0000016C 9421FFF8 */ stwu r1, -8(r1)
/* 00000170 4800003D */ bl event_finish_all
/* 00000174 3C600000 */ lis r3, lbl_802F1B74@ha
/* 00000178 38830000 */ addi r4, r3, lbl_802F1B74@l
/* 0000017C 38000000 */ li r0, 0
/* 00000180 3C600000 */ lis r3, lbl_802F1B70@ha
/* 00000184 90040000 */ stw r0, 0(r4)
/* 00000188 38830000 */ addi r4, r3, lbl_802F1B70@l
/* 0000018C 3C600000 */ lis r3, lbl_0000C6B8@ha
/* 00000190 90040000 */ stw r0, 0(r4)
/* 00000194 38630000 */ addi r3, r3, lbl_0000C6B8@l
/* 00000198 48000015 */ bl puts
/* 0000019C 8001000C */ lwz r0, 0xc(r1)
/* 000001A0 38210008 */ addi r1, r1, 8
/* 000001A4 7C0803A6 */ mtlr r0
/* 000001A8 4E800020 */ blr 
.global _unresolved
_unresolved:
/* 000001AC 7C0802A6 */ mflr r0
/* 000001B0 3C600000 */ lis r3, lbl_0000C640@ha
/* 000001B4 90010004 */ stw r0, 4(r1)
/* 000001B8 9421FFE8 */ stwu r1, -0x18(r1)
/* 000001BC 93E10014 */ stw r31, 0x14(r1)
/* 000001C0 3BE30000 */ addi r31, r3, lbl_0000C640@l
/* 000001C4 387F0088 */ addi r3, r31, 0x88
/* 000001C8 93C10010 */ stw r30, 0x10(r1)
/* 000001CC 93A1000C */ stw r29, 0xc(r1)
/* 000001D0 4BFFFFDD */ bl puts
/* 000001D4 387F00B0 */ addi r3, r31, 0xb0
/* 000001D8 4BFFFFD5 */ bl puts
/* 000001DC 3BC00000 */ li r30, 0
/* 000001E0 4BFFFFCD */ bl OSGetStackPointer
/* 000001E4 7C7D1B78 */ mr r29, r3
/* 000001E8 48000020 */ b lbl_00000208
lbl_000001EC:
/* 000001EC 80BD0000 */ lwz r5, 0(r29)
/* 000001F0 7FA4EB78 */ mr r4, r29
/* 000001F4 80DD0004 */ lwz r6, 4(r29)
/* 000001F8 387F00D8 */ addi r3, r31, 0xd8
/* 000001FC 4CC63182 */ crclr 6
/* 00000200 4BFFFFAD */ bl printf
/* 00000204 83BD0000 */ lwz r29, 0(r29)
lbl_00000208:
/* 00000208 281D0000 */ cmplwi r29, 0
/* 0000020C 4182001C */ beq lbl_00000228
/* 00000210 3C1D0001 */ addis r0, r29, 1
/* 00000214 2800FFFF */ cmplwi r0, 0xffff
/* 00000218 41820010 */ beq lbl_00000228
/* 0000021C 281E0010 */ cmplwi r30, 0x10
/* 00000220 3BDE0001 */ addi r30, r30, 1
/* 00000224 4180FFC8 */ blt lbl_000001EC
lbl_00000228:
/* 00000228 387F00F4 */ addi r3, r31, 0xf4
/* 0000022C 4CC63182 */ crclr 6
/* 00000230 38BF0100 */ addi r5, r31, 0x100
/* 00000234 38800097 */ li r4, 0x97
/* 00000238 4BFFFF75 */ bl OSPanic
/* 0000023C 8001001C */ lwz r0, 0x1c(r1)
/* 00000240 83E10014 */ lwz r31, 0x14(r1)
/* 00000244 83C10010 */ lwz r30, 0x10(r1)
/* 00000248 7C0803A6 */ mtlr r0
/* 0000024C 83A1000C */ lwz r29, 0xc(r1)
/* 00000250 38210018 */ addi r1, r1, 0x18
/* 00000254 4E800020 */ blr 
lbl_00000258:
/* 00000258 7C0802A6 */ mflr r0
/* 0000025C 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00000260 90010004 */ stw r0, 4(r1)
/* 00000264 9421FFF8 */ stwu r1, -8(r1)
/* 00000268 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 0000026C 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000270 41820018 */ beq lbl_00000288
/* 00000274 3C600000 */ lis r3, lbl_10000000@ha
/* 00000278 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000027C 380000BF */ li r0, 0xbf
/* 00000280 98030038 */ stb r0, 0x38(r3)
/* 00000284 48000014 */ b lbl_00000298
lbl_00000288:
/* 00000288 3C600000 */ lis r3, lbl_10000000@ha
/* 0000028C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00000290 38000000 */ li r0, 0
/* 00000294 98030038 */ stb r0, 0x38(r3)
lbl_00000298:
/* 00000298 3C600000 */ lis r3, gameSubmode@ha
/* 0000029C A8830000 */ lha r4, gameSubmode@l(r3)
/* 000002A0 2C0400AD */ cmpwi r4, 0xad
/* 000002A4 4081000C */ ble lbl_000002B0
/* 000002A8 2C0400C6 */ cmpwi r4, 0xc6
/* 000002AC 41800018 */ blt lbl_000002C4
lbl_000002B0:
/* 000002B0 3C600000 */ lis r3, lbl_0000C744@ha
/* 000002B4 4CC63182 */ crclr 6
/* 000002B8 38630000 */ addi r3, r3, lbl_0000C744@l
/* 000002BC 4BFFFEF1 */ bl printf
/* 000002C0 48000024 */ b lbl_000002E4
lbl_000002C4:
/* 000002C4 3804FF52 */ addi r0, r4, -174  ;# fixed addi
/* 000002C8 3C600000 */ lis r3, lbl_0000C640@ha
/* 000002CC 5404103A */ slwi r4, r0, 2
/* 000002D0 38030000 */ addi r0, r3, lbl_0000C640@l
/* 000002D4 7C602214 */ add r3, r0, r4
/* 000002D8 81830000 */ lwz r12, 0(r3)
/* 000002DC 7D8803A6 */ mtlr r12
/* 000002E0 4E800021 */ blrl 
lbl_000002E4:
/* 000002E4 8001000C */ lwz r0, 0xc(r1)
/* 000002E8 38210008 */ addi r1, r1, 8
/* 000002EC 7C0803A6 */ mtlr r0
/* 000002F0 4E800020 */ blr 
lbl_000002F4:
/* 000002F4 7C0802A6 */ mflr r0
/* 000002F8 3C600000 */ lis r3, lbl_10000000@ha
/* 000002FC 90010004 */ stw r0, 4(r1)
/* 00000300 38630000 */ addi r3, r3, lbl_10000000@l
/* 00000304 38000000 */ li r0, 0
/* 00000308 9421FFF8 */ stwu r1, -8(r1)
/* 0000030C 98030039 */ stb r0, 0x39(r3)
/* 00000310 48004BA5 */ bl lbl_00004EB4
/* 00000314 3C600000 */ lis r3, lbl_802014E0@ha
/* 00000318 80030000 */ lwz r0, lbl_802014E0@l(r3)
/* 0000031C 2C000049 */ cmpwi r0, 0x49
/* 00000320 41820010 */ beq sel_stage_handle_input
/* 00000324 38600049 */ li r3, 0x49
/* 00000328 38800000 */ li r4, 0
/* 0000032C 4BFFFE81 */ bl u_play_music
sel_stage_handle_input:
/* 00000330 3C600000 */ lis r3, modeCtrl@ha
/* 00000334 38830000 */ addi r4, r3, modeCtrl@l
/* 00000338 80040008 */ lwz r0, 8(r4)
/* 0000033C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000340 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00000344 90040008 */ stw r0, 8(r4)
/* 00000348 380000AF */ li r0, 0xaf
/* 0000034C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000350 8001000C */ lwz r0, 0xc(r1)
/* 00000354 38210008 */ addi r1, r1, 8
/* 00000358 7C0803A6 */ mtlr r0
/* 0000035C 4E800020 */ blr 
lbl_00000360:
/* 00000360 7C0802A6 */ mflr r0
/* 00000364 3C600000 */ lis r3, modeCtrl@ha
/* 00000368 90010004 */ stw r0, 4(r1)
/* 0000036C 38C30000 */ addi r6, r3, modeCtrl@l
/* 00000370 9421FFE0 */ stwu r1, -0x20(r1)
/* 00000374 93E1001C */ stw r31, 0x1c(r1)
/* 00000378 93C10018 */ stw r30, 0x18(r1)
/* 0000037C 3BC60008 */ addi r30, r6, 8
/* 00000380 93A10014 */ stw r29, 0x14(r1)
/* 00000384 80060008 */ lwz r0, 8(r6)
/* 00000388 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000038C 40820198 */ bne lbl_00000524
/* 00000390 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000394 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00000398 A0830008 */ lhz r4, 8(r3)
/* 0000039C 3C600000 */ lis r3, lbl_10000000@ha
/* 000003A0 38630000 */ addi r3, r3, lbl_10000000@l
/* 000003A4 3BE3003C */ addi r31, r3, 0x3c
/* 000003A8 80630050 */ lwz r3, 0x50(r3)
/* 000003AC 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 000003B0 7C650774 */ extsb r5, r3
/* 000003B4 40820018 */ bne lbl_000003CC
/* 000003B8 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000003BC 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000003C0 A0030008 */ lhz r0, 8(r3)
/* 000003C4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000003C8 41820018 */ beq lbl_000003E0
lbl_000003CC:
/* 000003CC 38A50001 */ addi r5, r5, 1
/* 000003D0 7CA00774 */ extsb r0, r5
/* 000003D4 28000007 */ cmplwi r0, 7
/* 000003D8 41800008 */ blt lbl_000003E0
/* 000003DC 38A00000 */ li r5, 0
lbl_000003E0:
/* 000003E0 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 000003E4 40820018 */ bne lbl_000003FC
/* 000003E8 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000003EC 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000003F0 A0030008 */ lhz r0, 8(r3)
/* 000003F4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000003F8 41820014 */ beq lbl_0000040C
lbl_000003FC:
/* 000003FC 38A5FFFF */ addi r5, r5, -1  ;# fixed addi
/* 00000400 7CA00775 */ extsb. r0, r5
/* 00000404 40800008 */ bge lbl_0000040C
/* 00000408 38A00006 */ li r5, 6
lbl_0000040C:
/* 0000040C 801F0014 */ lwz r0, 0x14(r31)
/* 00000410 7CBD0774 */ extsb r29, r5
/* 00000414 7C1D0000 */ cmpw r29, r0
/* 00000418 41820010 */ beq lbl_00000428
/* 0000041C 3860006C */ li r3, 0x6c
/* 00000420 4BFFFD8D */ bl u_play_sound
/* 00000424 93BF0014 */ stw r29, 0x14(r31)
lbl_00000428:
/* 00000428 801F0014 */ lwz r0, 0x14(r31)
/* 0000042C 3C600000 */ lis r3, lbl_0000C7A4@ha
/* 00000430 3BA30000 */ addi r29, r3, lbl_0000C7A4@l
/* 00000434 1C00000C */ mulli r0, r0, 0xc
/* 00000438 7C7D0214 */ add r3, r29, r0
/* 0000043C 80030000 */ lwz r0, 0(r3)
/* 00000440 2C000000 */ cmpwi r0, 0
/* 00000444 41820008 */ beq lbl_0000044C
/* 00000448 48000054 */ b lbl_0000049C
lbl_0000044C:
/* 0000044C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000450 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00000454 A0030004 */ lhz r0, 4(r3)
/* 00000458 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000045C 41820040 */ beq lbl_0000049C
/* 00000460 3860006A */ li r3, 0x6a
/* 00000464 4BFFFD49 */ bl u_play_sound
/* 00000468 38600058 */ li r3, 0x58
/* 0000046C 48003D99 */ bl lbl_00004204
/* 00000470 3C600000 */ lis r3, modeCtrl@ha
/* 00000474 3800001E */ li r0, 0x1e
/* 00000478 90030000 */ stw r0, modeCtrl@l(r3)
/* 0000047C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000480 801F0014 */ lwz r0, 0x14(r31)
/* 00000484 1C00000C */ mulli r0, r0, 0xc
/* 00000488 7C9D0214 */ add r4, r29, r0
/* 0000048C 80040008 */ lwz r0, 8(r4)
/* 00000490 7C000734 */ extsh r0, r0
/* 00000494 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000498 480000C8 */ b lbl_00000560
lbl_0000049C:
/* 0000049C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000004A0 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000004A4 A0030004 */ lhz r0, 4(r3)
/* 000004A8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000004AC 418200B4 */ beq lbl_00000560
/* 000004B0 3C600000 */ lis r3, eventInfo@ha
/* 000004B4 88030000 */ lbz r0, eventInfo@l(r3)
/* 000004B8 7C000775 */ extsb. r0, r0
/* 000004BC 408200A4 */ bne lbl_00000560
/* 000004C0 3860006B */ li r3, 0x6b
/* 000004C4 4BFFFCE9 */ bl u_play_sound
/* 000004C8 4BFFFCE5 */ bl func_8009F4C4
/* 000004CC 5460063E */ clrlwi r0, r3, 0x18
/* 000004D0 28000001 */ cmplwi r0, 1
/* 000004D4 40820014 */ bne lbl_000004E8
/* 000004D8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000004DC 380000BA */ li r0, 0xba
/* 000004E0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000004E4 4800007C */ b lbl_00000560
lbl_000004E8:
/* 000004E8 3C600000 */ lis r3, modeCtrl@ha
/* 000004EC 3BE30000 */ addi r31, r3, modeCtrl@l
/* 000004F0 3800001E */ li r0, 0x1e
/* 000004F4 901F0000 */ stw r0, 0(r31)
/* 000004F8 38600101 */ li r3, 0x101
/* 000004FC 38800000 */ li r4, 0
/* 00000500 80BF0000 */ lwz r5, 0(r31)
/* 00000504 4BFFFCA9 */ bl start_screen_fade
/* 00000508 807F0000 */ lwz r3, 0(r31)
/* 0000050C 38800002 */ li r4, 2
/* 00000510 4BFFFC9D */ bl u_play_music
/* 00000514 801E0000 */ lwz r0, 0(r30)
/* 00000518 60000004 */ ori r0, r0, 4
/* 0000051C 901E0000 */ stw r0, 0(r30)
/* 00000520 48000040 */ b lbl_00000560
lbl_00000524:
/* 00000524 80660000 */ lwz r3, 0(r6)
/* 00000528 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000052C 90060000 */ stw r0, 0(r6)
/* 00000530 41810030 */ bgt lbl_00000560
/* 00000534 38A00000 */ li r5, 0
/* 00000538 90A60000 */ stw r5, 0(r6)
/* 0000053C 38000003 */ li r0, 3
/* 00000540 3C800000 */ lis r4, gameModeRequest@ha
/* 00000544 90060020 */ stw r0, 0x20(r6)
/* 00000548 38000001 */ li r0, 1
/* 0000054C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000550 90060010 */ stw r0, 0x10(r6)
/* 00000554 38000015 */ li r0, 0x15
/* 00000558 B0A40000 */ sth r5, gameModeRequest@l(r4)
/* 0000055C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00000560:
/* 00000560 80010024 */ lwz r0, 0x24(r1)
/* 00000564 83E1001C */ lwz r31, 0x1c(r1)
/* 00000568 83C10018 */ lwz r30, 0x18(r1)
/* 0000056C 7C0803A6 */ mtlr r0
/* 00000570 83A10014 */ lwz r29, 0x14(r1)
/* 00000574 38210020 */ addi r1, r1, 0x20
/* 00000578 4E800020 */ blr 
lbl_0000057C:
/* 0000057C 7C0802A6 */ mflr r0
/* 00000580 3C600000 */ lis r3, lbl_0000C6A4@ha
/* 00000584 90010004 */ stw r0, 4(r1)
/* 00000588 38630000 */ addi r3, r3, lbl_0000C6A4@l
/* 0000058C 38800000 */ li r4, 0
/* 00000590 9421FFF8 */ stwu r1, -8(r1)
/* 00000594 88630000 */ lbz r3, 0(r3)
/* 00000598 4BFFFC15 */ bl u_play_music
/* 0000059C 480079F5 */ bl lbl_00007F90
/* 000005A0 3C600000 */ lis r3, lbl_10000000@ha
/* 000005A4 38630000 */ addi r3, r3, lbl_10000000@l
/* 000005A8 3800001E */ li r0, 0x1e
/* 000005AC 900300D8 */ stw r0, 0xd8(r3)
/* 000005B0 3CC00000 */ lis r6, lbl_100001B4@ha
/* 000005B4 38000000 */ li r0, 0
/* 000005B8 3CA00000 */ lis r5, lbl_00000714@ha
/* 000005BC B0060000 */ sth r0, lbl_100001B4@l(r6)
/* 000005C0 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 000005C4 38050000 */ addi r0, r5, lbl_00000714@l
/* 000005C8 90040000 */ stw r0, lbl_802F1B7C@l(r4)
/* 000005CC 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000005D0 380000B1 */ li r0, 0xb1
/* 000005D4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000005D8 8001000C */ lwz r0, 0xc(r1)
/* 000005DC 38210008 */ addi r1, r1, 8
/* 000005E0 7C0803A6 */ mtlr r0
/* 000005E4 4E800020 */ blr 
lbl_000005E8:
/* 000005E8 7C0802A6 */ mflr r0
/* 000005EC 3C600000 */ lis r3, lbl_10000000@ha
/* 000005F0 90010004 */ stw r0, 4(r1)
/* 000005F4 9421FFF0 */ stwu r1, -0x10(r1)
/* 000005F8 93E1000C */ stw r31, 0xc(r1)
/* 000005FC 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00000600 93C10008 */ stw r30, 8(r1)
/* 00000604 3BDF00BC */ addi r30, r31, 0xbc
/* 00000608 807F00D8 */ lwz r3, 0xd8(r31)
/* 0000060C 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00000610 901F00D8 */ stw r0, 0xd8(r31)
/* 00000614 4082001C */ bne lbl_00000630
/* 00000618 3C600000 */ lis r3, lbl_0000C6A5@ha
/* 0000061C 38630000 */ addi r3, r3, lbl_0000C6A5@l
/* 00000620 88630000 */ lbz r3, 0(r3)
/* 00000624 4BFFFB89 */ bl u_play_sound
/* 00000628 3800003C */ li r0, 0x3c
/* 0000062C 901E001C */ stw r0, 0x1c(r30)
lbl_00000630:
/* 00000630 A87F01B4 */ lha r3, 0x1b4(r31)
/* 00000634 2C030000 */ cmpwi r3, 0
/* 00000638 40810044 */ ble lbl_0000067C
/* 0000063C 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00000640 7C600735 */ extsh. r0, r3
/* 00000644 B07F01B4 */ sth r3, 0x1b4(r31)
/* 00000648 418100B4 */ bgt lbl_000006FC
/* 0000064C 4BFFFB61 */ bl OSGetSoundMode
/* 00000650 28030001 */ cmplwi r3, 1
/* 00000654 4082000C */ bne lbl_00000660
/* 00000658 38600000 */ li r3, 0
/* 0000065C 48000008 */ b lbl_00000664
lbl_00000660:
/* 00000660 38600001 */ li r3, 1
lbl_00000664:
/* 00000664 4BFFFB49 */ bl func_8002DAB0
/* 00000668 3C600000 */ lis r3, lbl_0000C6A4@ha
/* 0000066C 38630000 */ addi r3, r3, lbl_0000C6A4@l
/* 00000670 88630000 */ lbz r3, 0(r3)
/* 00000674 38800000 */ li r4, 0
/* 00000678 4BFFFB35 */ bl u_play_music
lbl_0000067C:
/* 0000067C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000680 38830000 */ addi r4, r3, g_currPlayerButtons@l
/* 00000684 A0A40008 */ lhz r5, 8(r4)
/* 00000688 54A007FF */ clrlwi. r0, r5, 0x1f
/* 0000068C 40820028 */ bne lbl_000006B4
/* 00000690 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00000694 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00000698 A0630008 */ lhz r3, 8(r3)
/* 0000069C 546007FF */ clrlwi. r0, r3, 0x1f
/* 000006A0 40820014 */ bne lbl_000006B4
/* 000006A4 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 000006A8 4082000C */ bne lbl_000006B4
/* 000006AC 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 000006B0 41820024 */ beq lbl_000006D4
lbl_000006B4:
/* 000006B4 3860006C */ li r3, 0x6c
/* 000006B8 4BFFFAF5 */ bl u_play_sound
/* 000006BC 3860FFFF */ li r3, -1
/* 000006C0 38800001 */ li r4, 1
/* 000006C4 4BFFFAE9 */ bl u_play_music
/* 000006C8 38000005 */ li r0, 5
/* 000006CC B01F01B4 */ sth r0, 0x1b4(r31)
/* 000006D0 4800002C */ b lbl_000006FC
lbl_000006D4:
/* 000006D4 A0040004 */ lhz r0, 4(r4)
/* 000006D8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000006DC 41820020 */ beq lbl_000006FC
/* 000006E0 3860006B */ li r3, 0x6b
/* 000006E4 4BFFFAC9 */ bl u_play_sound
/* 000006E8 3860005C */ li r3, 0x5c
/* 000006EC 48003B75 */ bl lbl_00004260
/* 000006F0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000006F4 380000AE */ li r0, 0xae
/* 000006F8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_000006FC:
/* 000006FC 80010014 */ lwz r0, 0x14(r1)
/* 00000700 83E1000C */ lwz r31, 0xc(r1)
/* 00000704 83C10008 */ lwz r30, 8(r1)
/* 00000708 7C0803A6 */ mtlr r0
/* 0000070C 38210010 */ addi r1, r1, 0x10
/* 00000710 4E800020 */ blr 
lbl_00000714:
/* 00000714 7C0802A6 */ mflr r0
/* 00000718 3860001E */ li r3, 0x1e
/* 0000071C 90010004 */ stw r0, 4(r1)
/* 00000720 38800002 */ li r4, 2
/* 00000724 9421FFF8 */ stwu r1, -8(r1)
/* 00000728 4BFFFA85 */ bl u_play_music
/* 0000072C 8001000C */ lwz r0, 0xc(r1)
/* 00000730 38210008 */ addi r1, r1, 8
/* 00000734 7C0803A6 */ mtlr r0
/* 00000738 4E800020 */ blr 
lbl_0000073C:
/* 0000073C 7C0802A6 */ mflr r0
/* 00000740 90010004 */ stw r0, 4(r1)
/* 00000744 9421FFF8 */ stwu r1, -8(r1)
/* 00000748 4800BA01 */ bl lbl_0000C148
/* 0000074C 3C600000 */ lis r3, lbl_10000000@ha
/* 00000750 38830000 */ addi r4, r3, lbl_10000000@l
/* 00000754 38000000 */ li r0, 0
/* 00000758 90040130 */ stw r0, 0x130(r4)
/* 0000075C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000760 90040134 */ stw r0, 0x134(r4)
/* 00000764 380000B5 */ li r0, 0xb5
/* 00000768 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 0000076C 8001000C */ lwz r0, 0xc(r1)
/* 00000770 38210008 */ addi r1, r1, 8
/* 00000774 7C0803A6 */ mtlr r0
/* 00000778 4E800020 */ blr 
lbl_0000077C:
/* 0000077C 7C0802A6 */ mflr r0
/* 00000780 3C600000 */ lis r3, eventInfo@ha
/* 00000784 90010004 */ stw r0, 4(r1)
/* 00000788 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000078C 93E10014 */ stw r31, 0x14(r1)
/* 00000790 93C10010 */ stw r30, 0x10(r1)
/* 00000794 93A1000C */ stw r29, 0xc(r1)
/* 00000798 93810008 */ stw r28, 8(r1)
/* 0000079C 88030000 */ lbz r0, eventInfo@l(r3)
/* 000007A0 3C600000 */ lis r3, lbl_10000000@ha
/* 000007A4 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 000007A8 2C000002 */ cmpwi r0, 2
/* 000007AC 41820314 */ beq lbl_00000AC0
/* 000007B0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000007B4 839F0130 */ lwz r28, 0x130(r31)
/* 000007B8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000007BC A0830008 */ lhz r4, 8(r3)
/* 000007C0 3BA30008 */ addi r29, r3, 8
/* 000007C4 3BDF0130 */ addi r30, r31, 0x130
/* 000007C8 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 000007CC 38BC0000 */ addi r5, r28, 0
/* 000007D0 40820018 */ bne lbl_000007E8
/* 000007D4 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000007D8 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000007DC A0630008 */ lhz r3, 8(r3)
/* 000007E0 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 000007E4 4182001C */ beq lbl_00000800
lbl_000007E8:
/* 000007E8 2C1C0003 */ cmpwi r28, 3
/* 000007EC 4181003C */ bgt lbl_00000828
/* 000007F0 379CFFFF */ addic. r28, r28, -1  ;# fixed addi
/* 000007F4 40800034 */ bge lbl_00000828
/* 000007F8 3B800003 */ li r28, 3
/* 000007FC 4800002C */ b lbl_00000828
lbl_00000800:
/* 00000800 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00000804 4082000C */ bne lbl_00000810
/* 00000808 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000080C 4182001C */ beq lbl_00000828
lbl_00000810:
/* 00000810 2C1C0003 */ cmpwi r28, 3
/* 00000814 41810014 */ bgt lbl_00000828
/* 00000818 3B9C0001 */ addi r28, r28, 1
/* 0000081C 2C1C0003 */ cmpwi r28, 3
/* 00000820 40810008 */ ble lbl_00000828
/* 00000824 3B800000 */ li r28, 0
lbl_00000828:
/* 00000828 7C1C2800 */ cmpw r28, r5
/* 0000082C 41820010 */ beq lbl_0000083C
/* 00000830 3860006C */ li r3, 0x6c
/* 00000834 4BFFF979 */ bl u_play_sound
/* 00000838 939E0000 */ stw r28, 0(r30)
lbl_0000083C:
/* 0000083C 801E0000 */ lwz r0, 0(r30)
/* 00000840 2C000004 */ cmpwi r0, 4
/* 00000844 40800044 */ bge lbl_00000888
/* 00000848 2C000000 */ cmpwi r0, 0
/* 0000084C 40800008 */ bge lbl_00000854
/* 00000850 48000038 */ b lbl_00000888
lbl_00000854:
/* 00000854 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000858 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000085C A0030004 */ lhz r0, 4(r3)
/* 00000860 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00000864 41820024 */ beq lbl_00000888
/* 00000868 3860006B */ li r3, 0x6b
/* 0000086C 4BFFF941 */ bl u_play_sound
/* 00000870 3860005F */ li r3, 0x5f
/* 00000874 480039ED */ bl lbl_00004260
/* 00000878 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000087C 380000AE */ li r0, 0xae
/* 00000880 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000884 4800023C */ b lbl_00000AC0
lbl_00000888:
/* 00000888 2C1C0003 */ cmpwi r28, 3
/* 0000088C 4182011C */ beq lbl_000009A8
/* 00000890 4080001C */ bge lbl_000008AC
/* 00000894 2C1C0001 */ cmpwi r28, 1
/* 00000898 41820064 */ beq lbl_000008FC
/* 0000089C 408000A0 */ bge lbl_0000093C
/* 000008A0 2C1C0000 */ cmpwi r28, 0
/* 000008A4 40800018 */ bge lbl_000008BC
/* 000008A8 48000218 */ b lbl_00000AC0
lbl_000008AC:
/* 000008AC 2C1C0005 */ cmpwi r28, 5
/* 000008B0 418201EC */ beq lbl_00000A9C
/* 000008B4 4080020C */ bge lbl_00000AC0
/* 000008B8 48000120 */ b lbl_000009D8
lbl_000008BC:
/* 000008BC 38000000 */ li r0, 0
/* 000008C0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000008C4 901F0134 */ stw r0, 0x134(r31)
/* 000008C8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000008CC A0030004 */ lhz r0, 4(r3)
/* 000008D0 3BDF0134 */ addi r30, r31, 0x134
/* 000008D4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000008D8 418201E8 */ beq lbl_00000AC0
/* 000008DC 3860006A */ li r3, 0x6a
/* 000008E0 4BFFF8CD */ bl u_play_sound
/* 000008E4 801E0000 */ lwz r0, 0(r30)
/* 000008E8 5403063E */ clrlwi r3, r0, 0x18
/* 000008EC 4BFFF8C1 */ bl func_8009F49C
/* 000008F0 38600000 */ li r3, 0
/* 000008F4 4BFFF8B9 */ bl event_start
/* 000008F8 480001C8 */ b lbl_00000AC0
lbl_000008FC:
/* 000008FC 38000001 */ li r0, 1
/* 00000900 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000904 901F0134 */ stw r0, 0x134(r31)
/* 00000908 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000090C A0030004 */ lhz r0, 4(r3)
/* 00000910 3BDF0134 */ addi r30, r31, 0x134
/* 00000914 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00000918 418201A8 */ beq lbl_00000AC0
/* 0000091C 3860006A */ li r3, 0x6a
/* 00000920 4BFFF88D */ bl u_play_sound
/* 00000924 801E0000 */ lwz r0, 0(r30)
/* 00000928 5403063E */ clrlwi r3, r0, 0x18
/* 0000092C 4BFFF881 */ bl func_8009F49C
/* 00000930 38600000 */ li r3, 0
/* 00000934 4BFFF879 */ bl event_start
/* 00000938 48000188 */ b lbl_00000AC0
lbl_0000093C:
/* 0000093C 4BFFF871 */ bl func_8009F4C4
/* 00000940 A09D0000 */ lhz r4, 0(r29)
/* 00000944 547D063E */ clrlwi r29, r3, 0x18
/* 00000948 38BD0000 */ addi r5, r29, 0
/* 0000094C 548007FF */ clrlwi. r0, r4, 0x1f
/* 00000950 40820028 */ bne lbl_00000978
/* 00000954 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00000958 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000095C A0630008 */ lhz r3, 8(r3)
/* 00000960 546007FF */ clrlwi. r0, r3, 0x1f
/* 00000964 40820014 */ bne lbl_00000978
/* 00000968 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 0000096C 4082000C */ bne lbl_00000978
/* 00000970 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00000974 41820018 */ beq lbl_0000098C
lbl_00000978:
/* 00000978 2C1D0001 */ cmpwi r29, 1
/* 0000097C 4082000C */ bne lbl_00000988
/* 00000980 3BA00000 */ li r29, 0
/* 00000984 48000008 */ b lbl_0000098C
lbl_00000988:
/* 00000988 3BA00001 */ li r29, 1
lbl_0000098C:
/* 0000098C 7C05E800 */ cmpw r5, r29
/* 00000990 41820130 */ beq lbl_00000AC0
/* 00000994 38600065 */ li r3, 0x65
/* 00000998 4BFFF815 */ bl u_play_sound
/* 0000099C 57A3063E */ clrlwi r3, r29, 0x18
/* 000009A0 4BFFF80D */ bl func_8009F4CC
/* 000009A4 4800011C */ b lbl_00000AC0
lbl_000009A8:
/* 000009A8 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000009AC 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000009B0 A0030004 */ lhz r0, 4(r3)
/* 000009B4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000009B8 41820108 */ beq lbl_00000AC0
/* 000009BC 3860006A */ li r3, 0x6a
/* 000009C0 4BFFF7ED */ bl u_play_sound
/* 000009C4 38000004 */ li r0, 4
/* 000009C8 901E0000 */ stw r0, 0(r30)
/* 000009CC 38000000 */ li r0, 0
/* 000009D0 901F0138 */ stw r0, 0x138(r31)
/* 000009D4 480000EC */ b lbl_00000AC0
lbl_000009D8:
/* 000009D8 A09D0000 */ lhz r4, 0(r29)
/* 000009DC 3BBF0138 */ addi r29, r31, 0x138
/* 000009E0 80BF0138 */ lwz r5, 0x138(r31)
/* 000009E4 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 000009E8 3BE50000 */ addi r31, r5, 0
/* 000009EC 40820018 */ bne lbl_00000A04
/* 000009F0 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000009F4 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000009F8 A0630008 */ lhz r3, 8(r3)
/* 000009FC 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00000A00 4182000C */ beq lbl_00000A0C
lbl_00000A04:
/* 00000A04 3BE00000 */ li r31, 0
/* 00000A08 48000018 */ b lbl_00000A20
lbl_00000A0C:
/* 00000A0C 548007FF */ clrlwi. r0, r4, 0x1f
/* 00000A10 4082000C */ bne lbl_00000A1C
/* 00000A14 546007FF */ clrlwi. r0, r3, 0x1f
/* 00000A18 41820008 */ beq lbl_00000A20
lbl_00000A1C:
/* 00000A1C 3BE00001 */ li r31, 1
lbl_00000A20:
/* 00000A20 7C1F2800 */ cmpw r31, r5
/* 00000A24 41820010 */ beq lbl_00000A34
/* 00000A28 3860006C */ li r3, 0x6c
/* 00000A2C 4BFFF781 */ bl u_play_sound
/* 00000A30 93FD0000 */ stw r31, 0(r29)
lbl_00000A34:
/* 00000A34 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000A38 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00000A3C A0630004 */ lhz r3, 4(r3)
/* 00000A40 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00000A44 4182003C */ beq lbl_00000A80
/* 00000A48 801D0000 */ lwz r0, 0(r29)
/* 00000A4C 2C000001 */ cmpwi r0, 1
/* 00000A50 4082001C */ bne lbl_00000A6C
/* 00000A54 3860006A */ li r3, 0x6a
/* 00000A58 4BFFF755 */ bl u_play_sound
/* 00000A5C 4BFFF751 */ bl func_800A4DF0
/* 00000A60 38000005 */ li r0, 5
/* 00000A64 901E0000 */ stw r0, 0(r30)
/* 00000A68 48000058 */ b lbl_00000AC0
lbl_00000A6C:
/* 00000A6C 3860006B */ li r3, 0x6b
/* 00000A70 4BFFF73D */ bl u_play_sound
/* 00000A74 38000003 */ li r0, 3
/* 00000A78 901E0000 */ stw r0, 0(r30)
/* 00000A7C 48000044 */ b lbl_00000AC0
lbl_00000A80:
/* 00000A80 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00000A84 4182003C */ beq lbl_00000AC0
/* 00000A88 3860006B */ li r3, 0x6b
/* 00000A8C 4BFFF721 */ bl u_play_sound
/* 00000A90 38000003 */ li r0, 3
/* 00000A94 901E0000 */ stw r0, 0(r30)
/* 00000A98 48000028 */ b lbl_00000AC0
lbl_00000A9C:
/* 00000A9C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000AA0 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00000AA4 A0030004 */ lhz r0, 4(r3)
/* 00000AA8 28000000 */ cmplwi r0, 0
/* 00000AAC 41820014 */ beq lbl_00000AC0
/* 00000AB0 3860006B */ li r3, 0x6b
/* 00000AB4 4BFFF6F9 */ bl u_play_sound
/* 00000AB8 38000003 */ li r0, 3
/* 00000ABC 901E0000 */ stw r0, 0(r30)
lbl_00000AC0:
/* 00000AC0 8001001C */ lwz r0, 0x1c(r1)
/* 00000AC4 83E10014 */ lwz r31, 0x14(r1)
/* 00000AC8 83C10010 */ lwz r30, 0x10(r1)
/* 00000ACC 7C0803A6 */ mtlr r0
/* 00000AD0 83A1000C */ lwz r29, 0xc(r1)
/* 00000AD4 83810008 */ lwz r28, 8(r1)
/* 00000AD8 38210018 */ addi r1, r1, 0x18
/* 00000ADC 4E800020 */ blr 
lbl_00000AE0:
/* 00000AE0 7C0802A6 */ mflr r0
/* 00000AE4 3C600000 */ lis r3, lbl_10000000@ha
/* 00000AE8 90010004 */ stw r0, 4(r1)
/* 00000AEC 38000000 */ li r0, 0
/* 00000AF0 38800000 */ li r4, 0
/* 00000AF4 9421FF88 */ stwu r1, -0x78(r1)
/* 00000AF8 38A03000 */ li r5, 0x3000
/* 00000AFC 93E10074 */ stw r31, 0x74(r1)
/* 00000B00 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00000B04 3C600000 */ lis r3, lbl_0000C230@ha
/* 00000B08 93C10070 */ stw r30, 0x70(r1)
/* 00000B0C 3BDF015C */ addi r30, r31, 0x15c
/* 00000B10 93A1006C */ stw r29, 0x6c(r1)
/* 00000B14 3BA30000 */ addi r29, r3, lbl_0000C230@l
/* 00000B18 387F0278 */ addi r3, r31, 0x278
/* 00000B1C 981F0039 */ stb r0, 0x39(r31)
/* 00000B20 4BFFF68D */ bl memset
/* 00000B24 387F6278 */ addi r3, r31, 0x6278
/* 00000B28 38800000 */ li r4, 0
/* 00000B2C 38A00008 */ li r5, 8
/* 00000B30 4BFFF67D */ bl memset
/* 00000B34 A07D0000 */ lhz r3, 0(r29)
/* 00000B38 38000002 */ li r0, 2
/* 00000B3C 7C0903A6 */ mtctr r0
/* 00000B40 389F6280 */ addi r4, r31, 0x6280
/* 00000B44 B0610024 */ sth r3, 0x24(r1)
/* 00000B48 38BF6294 */ addi r5, r31, 0x6294
/* 00000B4C A01D0004 */ lhz r0, 4(r29)
/* 00000B50 38DF6290 */ addi r6, r31, 0x6290
/* 00000B54 38FF01B8 */ addi r7, r31, 0x1b8
/* 00000B58 B0010020 */ sth r0, 0x20(r1)
/* 00000B5C A01D0008 */ lhz r0, 8(r29)
/* 00000B60 B001001C */ sth r0, 0x1c(r1)
/* 00000B64 A01D000C */ lhz r0, 0xc(r29)
/* 00000B68 B0010018 */ sth r0, 0x18(r1)
/* 00000B6C A01D0010 */ lhz r0, 0x10(r29)
/* 00000B70 B0010014 */ sth r0, 0x14(r1)
/* 00000B74 A01D0014 */ lhz r0, 0x14(r29)
/* 00000B78 B0010010 */ sth r0, 0x10(r1)
/* 00000B7C A01D0018 */ lhz r0, 0x18(r29)
/* 00000B80 B001000C */ sth r0, 0xc(r1)
/* 00000B84 A01D001C */ lhz r0, 0x1c(r29)
/* 00000B88 B0010008 */ sth r0, 8(r1)
lbl_00000B8C:
/* 00000B8C 3BA00000 */ li r29, 0
/* 00000B90 93A40000 */ stw r29, 0(r4)
/* 00000B94 3860FF80 */ li r3, -128
/* 00000B98 98650000 */ stb r3, 0(r5)
/* 00000B9C 98660000 */ stb r3, 0(r6)
/* 00000BA0 A0010024 */ lhz r0, 0x24(r1)
/* 00000BA4 B0070000 */ sth r0, 0(r7)
/* 00000BA8 A0010020 */ lhz r0, 0x20(r1)
/* 00000BAC B0070002 */ sth r0, 2(r7)
/* 00000BB0 A001001C */ lhz r0, 0x1c(r1)
/* 00000BB4 B0070004 */ sth r0, 4(r7)
/* 00000BB8 A0010018 */ lhz r0, 0x18(r1)
/* 00000BBC B0070006 */ sth r0, 6(r7)
/* 00000BC0 A0010014 */ lhz r0, 0x14(r1)
/* 00000BC4 B0070008 */ sth r0, 8(r7)
/* 00000BC8 A0010010 */ lhz r0, 0x10(r1)
/* 00000BCC B007000A */ sth r0, 0xa(r7)
/* 00000BD0 A001000C */ lhz r0, 0xc(r1)
/* 00000BD4 B007000C */ sth r0, 0xc(r7)
/* 00000BD8 A0010008 */ lhz r0, 8(r1)
/* 00000BDC B007000E */ sth r0, 0xe(r7)
/* 00000BE0 93A40004 */ stw r29, 4(r4)
/* 00000BE4 38840008 */ addi r4, r4, 8
/* 00000BE8 98650001 */ stb r3, 1(r5)
/* 00000BEC 38A50002 */ addi r5, r5, 2
/* 00000BF0 98660001 */ stb r3, 1(r6)
/* 00000BF4 38C60002 */ addi r6, r6, 2
/* 00000BF8 A0010024 */ lhz r0, 0x24(r1)
/* 00000BFC B0070010 */ sth r0, 0x10(r7)
/* 00000C00 A0010020 */ lhz r0, 0x20(r1)
/* 00000C04 B0070012 */ sth r0, 0x12(r7)
/* 00000C08 A001001C */ lhz r0, 0x1c(r1)
/* 00000C0C B0070014 */ sth r0, 0x14(r7)
/* 00000C10 A0010018 */ lhz r0, 0x18(r1)
/* 00000C14 B0070016 */ sth r0, 0x16(r7)
/* 00000C18 A0010014 */ lhz r0, 0x14(r1)
/* 00000C1C B0070018 */ sth r0, 0x18(r7)
/* 00000C20 A0010010 */ lhz r0, 0x10(r1)
/* 00000C24 B007001A */ sth r0, 0x1a(r7)
/* 00000C28 A001000C */ lhz r0, 0xc(r1)
/* 00000C2C B007001C */ sth r0, 0x1c(r7)
/* 00000C30 A0010008 */ lhz r0, 8(r1)
/* 00000C34 B007001E */ sth r0, 0x1e(r7)
/* 00000C38 38E70020 */ addi r7, r7, 0x20
/* 00000C3C 4200FF50 */ bdnz lbl_00000B8C
/* 00000C40 387F01F8 */ addi r3, r31, 0x1f8
/* 00000C44 38800000 */ li r4, 0
/* 00000C48 38A00040 */ li r5, 0x40
/* 00000C4C 4BFFF561 */ bl memset
/* 00000C50 387F0238 */ addi r3, r31, 0x238
/* 00000C54 38800000 */ li r4, 0
/* 00000C58 38A00040 */ li r5, 0x40
/* 00000C5C 4BFFF551 */ bl memset
/* 00000C60 4800A3E1 */ bl lbl_0000B040
/* 00000C64 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000C68 380000B3 */ li r0, 0xb3
/* 00000C6C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000C70 93BE001C */ stw r29, 0x1c(r30)
/* 00000C74 93BE0018 */ stw r29, 0x18(r30)
/* 00000C78 8001007C */ lwz r0, 0x7c(r1)
/* 00000C7C 83E10074 */ lwz r31, 0x74(r1)
/* 00000C80 83C10070 */ lwz r30, 0x70(r1)
/* 00000C84 7C0803A6 */ mtlr r0
/* 00000C88 83A1006C */ lwz r29, 0x6c(r1)
/* 00000C8C 38210078 */ addi r1, r1, 0x78
/* 00000C90 4E800020 */ blr 
lbl_00000C94:
/* 00000C94 7C0802A6 */ mflr r0
/* 00000C98 3C600000 */ lis r3, gamePauseStatus@ha
/* 00000C9C 90010004 */ stw r0, 4(r1)
/* 00000CA0 3C800000 */ lis r4, lbl_0000C230@ha
/* 00000CA4 9421FF50 */ stwu r1, -0xb0(r1)
/* 00000CA8 BE410078 */ stmw r18, 0x78(r1)
/* 00000CAC 3B440000 */ addi r26, r4, lbl_0000C230@l
/* 00000CB0 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00000CB4 3C600000 */ lis r3, lbl_10000000@ha
/* 00000CB8 3B630000 */ addi r27, r3, lbl_10000000@l
/* 00000CBC 7000000A */ andi. r0, r0, 0xa
/* 00000CC0 408208C4 */ bne lbl_00001584
/* 00000CC4 3A9B015C */ addi r20, r27, 0x15c
/* 00000CC8 801B0178 */ lwz r0, 0x178(r27)
/* 00000CCC 2C000001 */ cmpwi r0, 1
/* 00000CD0 4182066C */ beq lbl_0000133C
/* 00000CD4 40800008 */ bge lbl_00000CDC
/* 00000CD8 48000014 */ b lbl_00000CEC
lbl_00000CDC:
/* 00000CDC 2C000004 */ cmpwi r0, 4
/* 00000CE0 41820880 */ beq lbl_00001560
/* 00000CE4 40800008 */ bge lbl_00000CEC
/* 00000CE8 48000844 */ b lbl_0000152C
lbl_00000CEC:
/* 00000CEC 3C600000 */ lis r3, lbl_801F3C60@ha
/* 00000CF0 3C800000 */ lis r4, controllerInfo@ha
/* 00000CF4 3A430000 */ addi r18, r3, lbl_801F3C60@l
/* 00000CF8 3A640000 */ addi r19, r4, controllerInfo@l
/* 00000CFC 3B200000 */ li r25, 0
/* 00000D00 3BE00000 */ li r31, 0
/* 00000D04 3AA00000 */ li r21, 0
/* 00000D08 3BC00000 */ li r30, 0
/* 00000D0C 3AC00000 */ li r22, 0
/* 00000D10 3BA00000 */ li r29, 0
/* 00000D14 3F804330 */ lis r28, 0x4330
lbl_00000D18:
/* 00000D18 7C73EA14 */ add r3, r19, r29
/* 00000D1C 8803000A */ lbz r0, 0xa(r3)
/* 00000D20 7C000774 */ extsb r0, r0
/* 00000D24 2C00FFFF */ cmpwi r0, -1
/* 00000D28 4182000C */ beq lbl_00000D34
/* 00000D2C 2C00FFFD */ cmpwi r0, -3
/* 00000D30 408200EC */ bne lbl_00000E1C
lbl_00000D34:
/* 00000D34 7C7BB214 */ add r3, r27, r22
/* 00000D38 38800000 */ li r4, 0
/* 00000D3C 38A00C00 */ li r5, 0xc00
/* 00000D40 38630278 */ addi r3, r3, 0x278
/* 00000D44 4BFFF469 */ bl memset
/* 00000D48 7C7BF214 */ add r3, r27, r30
/* 00000D4C 38000000 */ li r0, 0
/* 00000D50 B0036278 */ sth r0, 0x6278(r3)
/* 00000D54 7C7BAA14 */ add r3, r27, r21
/* 00000D58 7C9BCA14 */ add r4, r27, r25
/* 00000D5C 90036280 */ stw r0, 0x6280(r3)
/* 00000D60 3800FF80 */ li r0, -128
/* 00000D64 7EFBFA14 */ add r23, r27, r31
/* 00000D68 98046294 */ stb r0, 0x6294(r4)
/* 00000D6C 7EE3BB78 */ mr r3, r23
/* 00000D70 38A00010 */ li r5, 0x10
/* 00000D74 98046290 */ stb r0, 0x6290(r4)
/* 00000D78 38800000 */ li r4, 0
/* 00000D7C 386301F8 */ addi r3, r3, 0x1f8
/* 00000D80 A01A0000 */ lhz r0, 0(r26)
/* 00000D84 B0010008 */ sth r0, 8(r1)
/* 00000D88 A0010008 */ lhz r0, 8(r1)
/* 00000D8C B01701B8 */ sth r0, 0x1b8(r23)
/* 00000D90 A01A0004 */ lhz r0, 4(r26)
/* 00000D94 B001000C */ sth r0, 0xc(r1)
/* 00000D98 A001000C */ lhz r0, 0xc(r1)
/* 00000D9C B01701BA */ sth r0, 0x1ba(r23)
/* 00000DA0 A01A0008 */ lhz r0, 8(r26)
/* 00000DA4 B0010010 */ sth r0, 0x10(r1)
/* 00000DA8 A0010010 */ lhz r0, 0x10(r1)
/* 00000DAC B01701BC */ sth r0, 0x1bc(r23)
/* 00000DB0 A01A000C */ lhz r0, 0xc(r26)
/* 00000DB4 B0010014 */ sth r0, 0x14(r1)
/* 00000DB8 A0010014 */ lhz r0, 0x14(r1)
/* 00000DBC B01701BE */ sth r0, 0x1be(r23)
/* 00000DC0 A01A0010 */ lhz r0, 0x10(r26)
/* 00000DC4 B0010018 */ sth r0, 0x18(r1)
/* 00000DC8 A0010018 */ lhz r0, 0x18(r1)
/* 00000DCC B01701C0 */ sth r0, 0x1c0(r23)
/* 00000DD0 A01A0014 */ lhz r0, 0x14(r26)
/* 00000DD4 B001001C */ sth r0, 0x1c(r1)
/* 00000DD8 A001001C */ lhz r0, 0x1c(r1)
/* 00000DDC B01701C2 */ sth r0, 0x1c2(r23)
/* 00000DE0 A01A0018 */ lhz r0, 0x18(r26)
/* 00000DE4 B0010020 */ sth r0, 0x20(r1)
/* 00000DE8 A0010020 */ lhz r0, 0x20(r1)
/* 00000DEC B01701C4 */ sth r0, 0x1c4(r23)
/* 00000DF0 A01A001C */ lhz r0, 0x1c(r26)
/* 00000DF4 B0010024 */ sth r0, 0x24(r1)
/* 00000DF8 A0010024 */ lhz r0, 0x24(r1)
/* 00000DFC B01701C6 */ sth r0, 0x1c6(r23)
/* 00000E00 4BFFF3AD */ bl memset
/* 00000E04 38770000 */ addi r3, r23, 0
/* 00000E08 38800000 */ li r4, 0
/* 00000E0C 38A00010 */ li r5, 0x10
/* 00000E10 38630238 */ addi r3, r3, 0x238
/* 00000E14 4BFFF399 */ bl memset
/* 00000E18 480004AC */ b lbl_000012C4
lbl_00000E1C:
/* 00000E1C 7C92EA14 */ add r4, r18, r29
/* 00000E20 7C7BFA14 */ add r3, r27, r31
/* 00000E24 8B040002 */ lbz r24, 2(r4)
/* 00000E28 880301B8 */ lbz r0, 0x1b8(r3)
/* 00000E2C 7F180774 */ extsb r24, r24
/* 00000E30 8AE40003 */ lbz r23, 3(r4)
/* 00000E34 7C000774 */ extsb r0, r0
/* 00000E38 7C00C000 */ cmpw r0, r24
/* 00000E3C 7EF70774 */ extsb r23, r23
/* 00000E40 4080000C */ bge lbl_00000E4C
/* 00000E44 9B0301B8 */ stb r24, 0x1b8(r3)
/* 00000E48 9AE301B9 */ stb r23, 0x1b9(r3)
lbl_00000E4C:
/* 00000E4C 7C7BFA14 */ add r3, r27, r31
/* 00000E50 880301C0 */ lbz r0, 0x1c0(r3)
/* 00000E54 7C000774 */ extsb r0, r0
/* 00000E58 7C00C000 */ cmpw r0, r24
/* 00000E5C 4081000C */ ble lbl_00000E68
/* 00000E60 9B0301C0 */ stb r24, 0x1c0(r3)
/* 00000E64 9AE301C1 */ stb r23, 0x1c1(r3)
lbl_00000E68:
/* 00000E68 7C7BFA14 */ add r3, r27, r31
/* 00000E6C 880301BD */ lbz r0, 0x1bd(r3)
/* 00000E70 7C000774 */ extsb r0, r0
/* 00000E74 7C00B800 */ cmpw r0, r23
/* 00000E78 4080000C */ bge lbl_00000E84
/* 00000E7C 9B0301BC */ stb r24, 0x1bc(r3)
/* 00000E80 9AE301BD */ stb r23, 0x1bd(r3)
lbl_00000E84:
/* 00000E84 7C7BFA14 */ add r3, r27, r31
/* 00000E88 880301C5 */ lbz r0, 0x1c5(r3)
/* 00000E8C 7C000774 */ extsb r0, r0
/* 00000E90 7C00B800 */ cmpw r0, r23
/* 00000E94 4081000C */ ble lbl_00000EA0
/* 00000E98 9B0301C4 */ stb r24, 0x1c4(r3)
/* 00000E9C 9AE301C5 */ stb r23, 0x1c5(r3)
lbl_00000EA0:
/* 00000EA0 7C7BFA14 */ add r3, r27, r31
/* 00000EA4 880301F8 */ lbz r0, 0x1f8(r3)
/* 00000EA8 7C000774 */ extsb r0, r0
/* 00000EAC 7C00C000 */ cmpw r0, r24
/* 00000EB0 40800024 */ bge lbl_00000ED4
/* 00000EB4 9B030238 */ stb r24, 0x238(r3)
/* 00000EB8 7C641B78 */ mr r4, r3
/* 00000EBC 388401B8 */ addi r4, r4, 0x1b8
/* 00000EC0 9B0301F8 */ stb r24, 0x1f8(r3)
/* 00000EC4 9AE30239 */ stb r23, 0x239(r3)
/* 00000EC8 9AE301F9 */ stb r23, 0x1f9(r3)
/* 00000ECC 38630238 */ addi r3, r3, 0x238
/* 00000ED0 4BFFF2DD */ bl func_80025B1C
lbl_00000ED4:
/* 00000ED4 7C9BFA14 */ add r4, r27, r31
/* 00000ED8 88040200 */ lbz r0, 0x200(r4)
/* 00000EDC 7C000774 */ extsb r0, r0
/* 00000EE0 7C00C000 */ cmpw r0, r24
/* 00000EE4 40810020 */ ble lbl_00000F04
/* 00000EE8 9B040240 */ stb r24, 0x240(r4)
/* 00000EEC 38640240 */ addi r3, r4, 0x240
/* 00000EF0 9B040200 */ stb r24, 0x200(r4)
/* 00000EF4 9AE40241 */ stb r23, 0x241(r4)
/* 00000EF8 9AE40201 */ stb r23, 0x201(r4)
/* 00000EFC 388401B8 */ addi r4, r4, 0x1b8
/* 00000F00 4BFFF2AD */ bl func_80025B1C
lbl_00000F04:
/* 00000F04 7C9BFA14 */ add r4, r27, r31
/* 00000F08 880401FD */ lbz r0, 0x1fd(r4)
/* 00000F0C 7C000774 */ extsb r0, r0
/* 00000F10 7C00B800 */ cmpw r0, r23
/* 00000F14 40800020 */ bge lbl_00000F34
/* 00000F18 9B04023C */ stb r24, 0x23c(r4)
/* 00000F1C 3864023C */ addi r3, r4, 0x23c
/* 00000F20 9B0401FC */ stb r24, 0x1fc(r4)
/* 00000F24 9AE4023D */ stb r23, 0x23d(r4)
/* 00000F28 9AE401FD */ stb r23, 0x1fd(r4)
/* 00000F2C 388401B8 */ addi r4, r4, 0x1b8
/* 00000F30 4BFFF27D */ bl func_80025B1C
lbl_00000F34:
/* 00000F34 7C9BFA14 */ add r4, r27, r31
/* 00000F38 88040205 */ lbz r0, 0x205(r4)
/* 00000F3C 7C000774 */ extsb r0, r0
/* 00000F40 7C00B800 */ cmpw r0, r23
/* 00000F44 40810020 */ ble lbl_00000F64
/* 00000F48 9B040244 */ stb r24, 0x244(r4)
/* 00000F4C 38640244 */ addi r3, r4, 0x244
/* 00000F50 9B040204 */ stb r24, 0x204(r4)
/* 00000F54 9AE40245 */ stb r23, 0x245(r4)
/* 00000F58 9AE40205 */ stb r23, 0x205(r4)
/* 00000F5C 388401B8 */ addi r4, r4, 0x1b8
/* 00000F60 4BFFF24D */ bl func_80025B1C
lbl_00000F64:
/* 00000F64 7EE5FE70 */ srawi r5, r23, 0x1f
/* 00000F68 7F03FE70 */ srawi r3, r24, 0x1f
/* 00000F6C 7CA4BA78 */ xor r4, r5, r23
/* 00000F70 7C60C278 */ xor r0, r3, r24
/* 00000F74 7C852050 */ subf r4, r5, r4
/* 00000F78 7C030050 */ subf r0, r3, r0
/* 00000F7C 7C040050 */ subf r0, r4, r0
/* 00000F80 7C03FE70 */ srawi r3, r0, 0x1f
/* 00000F84 7C600278 */ xor r0, r3, r0
/* 00000F88 7C030050 */ subf r0, r3, r0
/* 00000F8C 2C000010 */ cmpwi r0, 0x10
/* 00000F90 40800164 */ bge lbl_000010F4
/* 00000F94 2C170000 */ cmpwi r23, 0
/* 00000F98 4081001C */ ble lbl_00000FB4
/* 00000F9C 2C180000 */ cmpwi r24, 0
/* 00000FA0 4081000C */ ble lbl_00000FAC
/* 00000FA4 38000001 */ li r0, 1
/* 00000FA8 48000020 */ b lbl_00000FC8
lbl_00000FAC:
/* 00000FAC 38000003 */ li r0, 3
/* 00000FB0 48000018 */ b lbl_00000FC8
lbl_00000FB4:
/* 00000FB4 2C180000 */ cmpwi r24, 0
/* 00000FB8 4080000C */ bge lbl_00000FC4
/* 00000FBC 38000005 */ li r0, 5
/* 00000FC0 48000008 */ b lbl_00000FC8
lbl_00000FC4:
/* 00000FC4 38000007 */ li r0, 7
lbl_00000FC8:
/* 00000FC8 7C9BFA14 */ add r4, r27, r31
/* 00000FCC 5403083C */ slwi r3, r0, 1
/* 00000FD0 7C641A14 */ add r3, r4, r3
/* 00000FD4 88C301B9 */ lbz r6, 0x1b9(r3)
/* 00000FD8 3CE00000 */ lis r7, lbl_0000C270@ha
/* 00000FDC 888301B8 */ lbz r4, 0x1b8(r3)
/* 00000FE0 3CA00000 */ lis r5, lbl_0000C270@ha
/* 00000FE4 7CC60774 */ extsb r6, r6
/* 00000FE8 7C840774 */ extsb r4, r4
/* 00000FEC C8670000 */ lfd f3, lbl_0000C270@l(r7)
/* 00000FF0 6CC68000 */ xoris r6, r6, 0x8000
/* 00000FF4 C8250000 */ lfd f1, lbl_0000C270@l(r5)
/* 00000FF8 6C848000 */ xoris r4, r4, 0x8000
/* 00000FFC 90C10074 */ stw r6, 0x74(r1)
/* 00001000 9081006C */ stw r4, 0x6c(r1)
/* 00001004 93810070 */ stw r28, 0x70(r1)
/* 00001008 93810068 */ stw r28, 0x68(r1)
/* 0000100C C8410070 */ lfd f2, 0x70(r1)
/* 00001010 C8010068 */ lfd f0, 0x68(r1)
/* 00001014 EC421828 */ fsubs f2, f2, f3
/* 00001018 EC800828 */ fsubs f4, f0, f1
/* 0000101C EC840132 */ fmuls f4, f4, f4
/* 00001020 EC8220BA */ fmadds f4, f2, f2, f4
/* 00001024 88A301F9 */ lbz r5, 0x1f9(r3)
/* 00001028 888301F8 */ lbz r4, 0x1f8(r3)
/* 0000102C 3CC00000 */ lis r6, lbl_0000C270@ha
/* 00001030 7CA50774 */ extsb r5, r5
/* 00001034 7C840774 */ extsb r4, r4
/* 00001038 C8660000 */ lfd f3, lbl_0000C270@l(r6)
/* 0000103C 6CA58000 */ xoris r5, r5, 0x8000
/* 00001040 90A10064 */ stw r5, 0x64(r1)
/* 00001044 6C848000 */ xoris r4, r4, 0x8000
/* 00001048 3CA00000 */ lis r5, lbl_0000C270@ha
/* 0000104C 9081005C */ stw r4, 0x5c(r1)
/* 00001050 C8250000 */ lfd f1, lbl_0000C270@l(r5)
/* 00001054 93810060 */ stw r28, 0x60(r1)
/* 00001058 93810058 */ stw r28, 0x58(r1)
/* 0000105C C8410060 */ lfd f2, 0x60(r1)
/* 00001060 C8010058 */ lfd f0, 0x58(r1)
/* 00001064 EC421828 */ fsubs f2, f2, f3
/* 00001068 ECA00828 */ fsubs f5, f0, f1
/* 0000106C ECA50172 */ fmuls f5, f5, f5
/* 00001070 ECA228BA */ fmadds f5, f2, f2, f5
/* 00001074 6EE58000 */ xoris r5, r23, 0x8000
/* 00001078 90A10054 */ stw r5, 0x54(r1)
/* 0000107C 6F048000 */ xoris r4, r24, 0x8000
/* 00001080 3CA00000 */ lis r5, lbl_0000C270@ha
/* 00001084 9081004C */ stw r4, 0x4c(r1)
/* 00001088 3C800000 */ lis r4, lbl_0000C270@ha
/* 0000108C C8650000 */ lfd f3, lbl_0000C270@l(r5)
/* 00001090 93810050 */ stw r28, 0x50(r1)
/* 00001094 C8240000 */ lfd f1, lbl_0000C270@l(r4)
/* 00001098 93810048 */ stw r28, 0x48(r1)
/* 0000109C C8410050 */ lfd f2, 0x50(r1)
/* 000010A0 C8010048 */ lfd f0, 0x48(r1)
/* 000010A4 EC421828 */ fsubs f2, f2, f3
/* 000010A8 EC000828 */ fsubs f0, f0, f1
/* 000010AC EC000032 */ fmuls f0, f0, f0
/* 000010B0 EC0200BA */ fmadds f0, f2, f2, f0
/* 000010B4 FC040040 */ fcmpo cr0, f4, f0
/* 000010B8 4080000C */ bge lbl_000010C4
/* 000010BC 9B0301B8 */ stb r24, 0x1b8(r3)
/* 000010C0 9AE301B9 */ stb r23, 0x1b9(r3)
lbl_000010C4:
/* 000010C4 FC050040 */ fcmpo cr0, f5, f0
/* 000010C8 4080002C */ bge lbl_000010F4
/* 000010CC 7C9BFA14 */ add r4, r27, r31
/* 000010D0 5400083C */ slwi r0, r0, 1
/* 000010D4 7C640214 */ add r3, r4, r0
/* 000010D8 9B030238 */ stb r24, 0x238(r3)
/* 000010DC 388401B8 */ addi r4, r4, 0x1b8
/* 000010E0 9B0301F8 */ stb r24, 0x1f8(r3)
/* 000010E4 9AE30239 */ stb r23, 0x239(r3)
/* 000010E8 9AE301F9 */ stb r23, 0x1f9(r3)
/* 000010EC 38630238 */ addi r3, r3, 0x238
/* 000010F0 4BFFF0BD */ bl func_80025B1C
lbl_000010F4:
/* 000010F4 9B010040 */ stb r24, 0x40(r1)
/* 000010F8 7C9BFA14 */ add r4, r27, r31
/* 000010FC 38610040 */ addi r3, r1, 0x40
/* 00001100 9AE10041 */ stb r23, 0x41(r1)
/* 00001104 388401B8 */ addi r4, r4, 0x1b8
/* 00001108 4BFFF0A5 */ bl func_80025B1C
/* 0000110C 88610040 */ lbz r3, 0x40(r1)
/* 00001110 3CC00000 */ lis r6, lbl_0000C270@ha
/* 00001114 88010041 */ lbz r0, 0x41(r1)
/* 00001118 7C9BCA14 */ add r4, r27, r25
/* 0000111C 7C650774 */ extsb r5, r3
/* 00001120 7C030774 */ extsb r3, r0
/* 00001124 88046290 */ lbz r0, 0x6290(r4)
/* 00001128 6CA58000 */ xoris r5, r5, 0x8000
/* 0000112C C8660000 */ lfd f3, lbl_0000C270@l(r6)
/* 00001130 90A1004C */ stw r5, 0x4c(r1)
/* 00001134 6C638000 */ xoris r3, r3, 0x8000
/* 00001138 3CA00000 */ lis r5, lbl_0000C270@ha
/* 0000113C C09A0038 */ lfs f4, 0x38(r26)
/* 00001140 90610054 */ stw r3, 0x54(r1)
/* 00001144 7C000774 */ extsb r0, r0
/* 00001148 C8250000 */ lfd f1, lbl_0000C270@l(r5)
/* 0000114C 93810048 */ stw r28, 0x48(r1)
/* 00001150 7C180050 */ subf r0, r24, r0
/* 00001154 7C03FE70 */ srawi r3, r0, 0x1f
/* 00001158 93810050 */ stw r28, 0x50(r1)
/* 0000115C 7C600278 */ xor r0, r3, r0
/* 00001160 C8410048 */ lfd f2, 0x48(r1)
/* 00001164 7C030050 */ subf r0, r3, r0
/* 00001168 C8010050 */ lfd f0, 0x50(r1)
/* 0000116C EC421828 */ fsubs f2, f2, f3
/* 00001170 2C000001 */ cmpwi r0, 1
/* 00001174 EC000828 */ fsubs f0, f0, f1
/* 00001178 EC4400B2 */ fmuls f2, f4, f2
/* 0000117C EC640032 */ fmuls f3, f4, f0
/* 00001180 41810024 */ bgt lbl_000011A4
/* 00001184 88046294 */ lbz r0, 0x6294(r4)
/* 00001188 7C000774 */ extsb r0, r0
/* 0000118C 7C170050 */ subf r0, r23, r0
/* 00001190 7C03FE70 */ srawi r3, r0, 0x1f
/* 00001194 7C600278 */ xor r0, r3, r0
/* 00001198 7C030050 */ subf r0, r3, r0
/* 0000119C 2C000001 */ cmpwi r0, 1
/* 000011A0 40810124 */ ble lbl_000012C4
lbl_000011A4:
/* 000011A4 7C7BCA14 */ add r3, r27, r25
/* 000011A8 9B036290 */ stb r24, 0x6290(r3)
/* 000011AC 7C9BF214 */ add r4, r27, r30
/* 000011B0 9AE36294 */ stb r23, 0x6294(r3)
/* 000011B4 A0046278 */ lhz r0, 0x6278(r4)
/* 000011B8 28000100 */ cmplwi r0, 0x100
/* 000011BC 40820018 */ bne lbl_000011D4
/* 000011C0 7C7BAA14 */ add r3, r27, r21
/* 000011C4 38000001 */ li r0, 1
/* 000011C8 90036280 */ stw r0, 0x6280(r3)
/* 000011CC 38000000 */ li r0, 0
/* 000011D0 B0046278 */ sth r0, 0x6278(r4)
lbl_000011D4:
/* 000011D4 807A0020 */ lwz r3, 0x20(r26)
/* 000011D8 6EE48000 */ xoris r4, r23, 0x8000
/* 000011DC 80FA0024 */ lwz r7, 0x24(r26)
/* 000011E0 6F008000 */ xoris r0, r24, 0x8000
/* 000011E4 9001004C */ stw r0, 0x4c(r1)
/* 000011E8 7C1BB214 */ add r0, r27, r22
/* 000011EC 90610034 */ stw r3, 0x34(r1)
/* 000011F0 7C7BF214 */ add r3, r27, r30
/* 000011F4 3CC00000 */ lis r6, lbl_0000C270@ha
/* 000011F8 90E10038 */ stw r7, 0x38(r1)
/* 000011FC 3CA00000 */ lis r5, lbl_0000C270@ha
/* 00001200 80FA0028 */ lwz r7, 0x28(r26)
/* 00001204 90810054 */ stw r4, 0x54(r1)
/* 00001208 90E1003C */ stw r7, 0x3c(r1)
/* 0000120C C01A003C */ lfs f0, 0x3c(r26)
/* 00001210 93810048 */ stw r28, 0x48(r1)
/* 00001214 EC0000B2 */ fmuls f0, f0, f2
/* 00001218 C8210048 */ lfd f1, 0x48(r1)
/* 0000121C 93810050 */ stw r28, 0x50(r1)
/* 00001220 D0010034 */ stfs f0, 0x34(r1)
/* 00001224 C8010050 */ lfd f0, 0x50(r1)
/* 00001228 C05A003C */ lfs f2, 0x3c(r26)
/* 0000122C EC4200F2 */ fmuls f2, f2, f3
/* 00001230 D0410038 */ stfs f2, 0x38(r1)
/* 00001234 A0836278 */ lhz r4, 0x6278(r3)
/* 00001238 80E10034 */ lwz r7, 0x34(r1)
/* 0000123C 1D04000C */ mulli r8, r4, 0xc
/* 00001240 80810038 */ lwz r4, 0x38(r1)
/* 00001244 7D004214 */ add r8, r0, r8
/* 00001248 90E83278 */ stw r7, 0x3278(r8)
/* 0000124C 9088327C */ stw r4, 0x327c(r8)
/* 00001250 8081003C */ lwz r4, 0x3c(r1)
/* 00001254 90883280 */ stw r4, 0x3280(r8)
/* 00001258 80FA002C */ lwz r7, 0x2c(r26)
/* 0000125C 809A0030 */ lwz r4, 0x30(r26)
/* 00001260 90E10028 */ stw r7, 0x28(r1)
/* 00001264 9081002C */ stw r4, 0x2c(r1)
/* 00001268 809A0034 */ lwz r4, 0x34(r26)
/* 0000126C 90810030 */ stw r4, 0x30(r1)
/* 00001270 C8460000 */ lfd f2, lbl_0000C270@l(r6)
/* 00001274 C07A003C */ lfs f3, 0x3c(r26)
/* 00001278 EC211028 */ fsubs f1, f1, f2
/* 0000127C EC230072 */ fmuls f1, f3, f1
/* 00001280 D0210028 */ stfs f1, 0x28(r1)
/* 00001284 C8250000 */ lfd f1, lbl_0000C270@l(r5)
/* 00001288 C05A003C */ lfs f2, 0x3c(r26)
/* 0000128C EC000828 */ fsubs f0, f0, f1
/* 00001290 EC020032 */ fmuls f0, f2, f0
/* 00001294 D001002C */ stfs f0, 0x2c(r1)
/* 00001298 A0A36278 */ lhz r5, 0x6278(r3)
/* 0000129C 38850001 */ addi r4, r5, 1
/* 000012A0 B0836278 */ sth r4, 0x6278(r3)
/* 000012A4 1CA5000C */ mulli r5, r5, 0xc
/* 000012A8 80810028 */ lwz r4, 0x28(r1)
/* 000012AC 8061002C */ lwz r3, 0x2c(r1)
/* 000012B0 7CA02A14 */ add r5, r0, r5
/* 000012B4 90850278 */ stw r4, 0x278(r5)
/* 000012B8 9065027C */ stw r3, 0x27c(r5)
/* 000012BC 80010030 */ lwz r0, 0x30(r1)
/* 000012C0 90050280 */ stw r0, 0x280(r5)
lbl_000012C4:
/* 000012C4 3B390001 */ addi r25, r25, 1
/* 000012C8 2C190004 */ cmpwi r25, 4
/* 000012CC 3BFF0010 */ addi r31, r31, 0x10
/* 000012D0 3AB50004 */ addi r21, r21, 4
/* 000012D4 3BDE0002 */ addi r30, r30, 2
/* 000012D8 3AD60C00 */ addi r22, r22, 0xc00
/* 000012DC 3BBD003C */ addi r29, r29, 0x3c
/* 000012E0 4180FA38 */ blt lbl_00000D18
/* 000012E4 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000012E8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000012EC A0630004 */ lhz r3, 4(r3)
/* 000012F0 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 000012F4 41820020 */ beq lbl_00001314
/* 000012F8 3860006A */ li r3, 0x6a
/* 000012FC 4BFFEEB1 */ bl u_play_sound
/* 00001300 38000000 */ li r0, 0
/* 00001304 90140018 */ stw r0, 0x18(r20)
/* 00001308 38000001 */ li r0, 1
/* 0000130C 9014001C */ stw r0, 0x1c(r20)
/* 00001310 48000274 */ b lbl_00001584
lbl_00001314:
/* 00001314 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00001318 4182026C */ beq lbl_00001584
/* 0000131C 38600061 */ li r3, 0x61
/* 00001320 48002F41 */ bl lbl_00004260
/* 00001324 3860006B */ li r3, 0x6b
/* 00001328 4BFFEE85 */ bl u_play_sound
/* 0000132C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00001330 380000C2 */ li r0, 0xc2
/* 00001334 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00001338 4800024C */ b lbl_00001584
lbl_0000133C:
/* 0000133C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00001340 82540018 */ lwz r18, 0x18(r20)
/* 00001344 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00001348 A0030004 */ lhz r0, 4(r3)
/* 0000134C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00001350 40820018 */ bne lbl_00001368
/* 00001354 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00001358 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000135C A0030004 */ lhz r0, 4(r3)
/* 00001360 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00001364 41820008 */ beq lbl_0000136C
lbl_00001368:
/* 00001368 3A400000 */ li r18, 0
lbl_0000136C:
/* 0000136C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00001370 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00001374 A0030004 */ lhz r0, 4(r3)
/* 00001378 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000137C 40820018 */ bne lbl_00001394
/* 00001380 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00001384 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00001388 A0030004 */ lhz r0, 4(r3)
/* 0000138C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00001390 41820008 */ beq lbl_00001398
lbl_00001394:
/* 00001394 3A400001 */ li r18, 1
lbl_00001398:
/* 00001398 80140018 */ lwz r0, 0x18(r20)
/* 0000139C 7C120000 */ cmpw r18, r0
/* 000013A0 41820010 */ beq lbl_000013B0
/* 000013A4 3860006C */ li r3, 0x6c
/* 000013A8 4BFFEE05 */ bl u_play_sound
/* 000013AC 92540018 */ stw r18, 0x18(r20)
lbl_000013B0:
/* 000013B0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000013B4 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000013B8 A0630004 */ lhz r3, 4(r3)
/* 000013BC 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 000013C0 41820150 */ beq lbl_00001510
/* 000013C4 80140018 */ lwz r0, 0x18(r20)
/* 000013C8 2C000001 */ cmpwi r0, 1
/* 000013CC 40820130 */ bne lbl_000014FC
/* 000013D0 3860006A */ li r3, 0x6a
/* 000013D4 4BFFEDD9 */ bl u_play_sound
/* 000013D8 38000004 */ li r0, 4
/* 000013DC 3C600000 */ lis r3, controllerInfo@ha
/* 000013E0 7C0903A6 */ mtctr r0
/* 000013E4 38030000 */ addi r0, r3, controllerInfo@l
/* 000013E8 38600000 */ li r3, 0
/* 000013EC 38800000 */ li r4, 0
lbl_000013F0:
/* 000013F0 7CA02214 */ add r5, r0, r4
/* 000013F4 88A5000A */ lbz r5, 0xa(r5)
/* 000013F8 7CA50774 */ extsb r5, r5
/* 000013FC 2C05FFFF */ cmpwi r5, -1
/* 00001400 418200C4 */ beq lbl_000014C4
/* 00001404 2C05FFFD */ cmpwi r5, -3
/* 00001408 418200BC */ beq lbl_000014C4
/* 0000140C 7CDB1A14 */ add r6, r27, r3
/* 00001410 88A60238 */ lbz r5, 0x238(r6)
/* 00001414 2C05003C */ cmpwi r5, 0x3c
/* 00001418 408200A0 */ bne lbl_000014B8
/* 0000141C 88A6023A */ lbz r5, 0x23a(r6)
/* 00001420 2C05003C */ cmpwi r5, 0x3c
/* 00001424 40820094 */ bne lbl_000014B8
/* 00001428 88A6023B */ lbz r5, 0x23b(r6)
/* 0000142C 2C05003C */ cmpwi r5, 0x3c
/* 00001430 40820088 */ bne lbl_000014B8
/* 00001434 88A6023D */ lbz r5, 0x23d(r6)
/* 00001438 2C05003C */ cmpwi r5, 0x3c
/* 0000143C 4082007C */ bne lbl_000014B8
/* 00001440 88A6023E */ lbz r5, 0x23e(r6)
/* 00001444 7CA50774 */ extsb r5, r5
/* 00001448 2C05FFC4 */ cmpwi r5, -60
/* 0000144C 4082006C */ bne lbl_000014B8
/* 00001450 88A6023F */ lbz r5, 0x23f(r6)
/* 00001454 2C05003C */ cmpwi r5, 0x3c
/* 00001458 40820060 */ bne lbl_000014B8
/* 0000145C 88A60240 */ lbz r5, 0x240(r6)
/* 00001460 7CA50774 */ extsb r5, r5
/* 00001464 2C05FFC4 */ cmpwi r5, -60
/* 00001468 40820050 */ bne lbl_000014B8
/* 0000146C 88A60242 */ lbz r5, 0x242(r6)
/* 00001470 7CA50774 */ extsb r5, r5
/* 00001474 2C05FFC4 */ cmpwi r5, -60
/* 00001478 40820040 */ bne lbl_000014B8
/* 0000147C 88A60243 */ lbz r5, 0x243(r6)
/* 00001480 7CA50774 */ extsb r5, r5
/* 00001484 2C05FFC4 */ cmpwi r5, -60
/* 00001488 40820030 */ bne lbl_000014B8
/* 0000148C 88A60245 */ lbz r5, 0x245(r6)
/* 00001490 7CA50774 */ extsb r5, r5
/* 00001494 2C05FFC4 */ cmpwi r5, -60
/* 00001498 40820020 */ bne lbl_000014B8
/* 0000149C 88A60246 */ lbz r5, 0x246(r6)
/* 000014A0 2C05003C */ cmpwi r5, 0x3c
/* 000014A4 40820014 */ bne lbl_000014B8
/* 000014A8 88A60247 */ lbz r5, 0x247(r6)
/* 000014AC 7CA50774 */ extsb r5, r5
/* 000014B0 2C05FFC4 */ cmpwi r5, -60
/* 000014B4 41820010 */ beq lbl_000014C4
lbl_000014B8:
/* 000014B8 38000004 */ li r0, 4
/* 000014BC 9014001C */ stw r0, 0x1c(r20)
/* 000014C0 48000010 */ b lbl_000014D0
lbl_000014C4:
/* 000014C4 38630010 */ addi r3, r3, 0x10
/* 000014C8 3884003C */ addi r4, r4, 0x3c
/* 000014CC 4200FF24 */ bdnz lbl_000013F0
lbl_000014D0:
/* 000014D0 8014001C */ lwz r0, 0x1c(r20)
/* 000014D4 2C000004 */ cmpwi r0, 4
/* 000014D8 418200AC */ beq lbl_00001584
/* 000014DC 3C600000 */ lis r3, lbl_80181B80@ha
/* 000014E0 38630000 */ addi r3, r3, lbl_80181B80@l
/* 000014E4 389B01B8 */ addi r4, r27, 0x1b8
/* 000014E8 38A00040 */ li r5, 0x40
/* 000014EC 4BFFECC1 */ bl memcpy
/* 000014F0 38000002 */ li r0, 2
/* 000014F4 9014001C */ stw r0, 0x1c(r20)
/* 000014F8 4800008C */ b lbl_00001584
lbl_000014FC:
/* 000014FC 3860006B */ li r3, 0x6b
/* 00001500 4BFFECAD */ bl u_play_sound
/* 00001504 38000003 */ li r0, 3
/* 00001508 9014001C */ stw r0, 0x1c(r20)
/* 0000150C 48000078 */ b lbl_00001584
lbl_00001510:
/* 00001510 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00001514 41820070 */ beq lbl_00001584
/* 00001518 3860006B */ li r3, 0x6b
/* 0000151C 4BFFEC91 */ bl u_play_sound
/* 00001520 38000003 */ li r0, 3
/* 00001524 9014001C */ stw r0, 0x1c(r20)
/* 00001528 4800005C */ b lbl_00001584
lbl_0000152C:
/* 0000152C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00001530 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00001534 A0030004 */ lhz r0, 4(r3)
/* 00001538 28000000 */ cmplwi r0, 0
/* 0000153C 41820048 */ beq lbl_00001584
/* 00001540 38600061 */ li r3, 0x61
/* 00001544 48002D1D */ bl lbl_00004260
/* 00001548 3860006B */ li r3, 0x6b
/* 0000154C 4BFFEC61 */ bl u_play_sound
/* 00001550 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00001554 380000C2 */ li r0, 0xc2
/* 00001558 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 0000155C 48000028 */ b lbl_00001584
lbl_00001560:
/* 00001560 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00001564 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00001568 A0030004 */ lhz r0, 4(r3)
/* 0000156C 28000000 */ cmplwi r0, 0
/* 00001570 41820014 */ beq lbl_00001584
/* 00001574 3860006B */ li r3, 0x6b
/* 00001578 4BFFEC35 */ bl u_play_sound
/* 0000157C 38000000 */ li r0, 0
/* 00001580 9014001C */ stw r0, 0x1c(r20)
lbl_00001584:
/* 00001584 BA410078 */ lmw r18, 0x78(r1)
/* 00001588 800100B4 */ lwz r0, 0xb4(r1)
/* 0000158C 382100B0 */ addi r1, r1, 0xb0
/* 00001590 7C0803A6 */ mtlr r0
/* 00001594 4E800020 */ blr 
lbl_00001598:
/* 00001598 7C0802A6 */ mflr r0
/* 0000159C 3C600000 */ lis r3, lbl_0000C230@ha
/* 000015A0 90010004 */ stw r0, 4(r1)
/* 000015A4 3800000D */ li r0, 0xd
/* 000015A8 7C0903A6 */ mtctr r0
/* 000015AC 3CC00000 */ lis r6, lbl_10000000@ha
/* 000015B0 9421FE20 */ stwu r1, -0x1e0(r1)
/* 000015B4 3CA00000 */ lis r5, lbl_0000C640@ha
/* 000015B8 BDE1019C */ stmw r15, 0x19c(r1)
/* 000015BC 3AE30000 */ addi r23, r3, lbl_0000C230@l
/* 000015C0 3B250000 */ addi r25, r5, lbl_0000C640@l
/* 000015C4 3B060000 */ addi r24, r6, lbl_10000000@l
/* 000015C8 38A10080 */ addi r5, r1, 0x80
/* 000015CC 80970050 */ lwz r4, 0x50(r23)
/* 000015D0 80770054 */ lwz r3, 0x54(r23)
/* 000015D4 908100F8 */ stw r4, 0xf8(r1)
/* 000015D8 3897005C */ addi r4, r23, 0x5c
/* 000015DC 906100FC */ stw r3, 0xfc(r1)
/* 000015E0 80770058 */ lwz r3, 0x58(r23)
/* 000015E4 8017005C */ lwz r0, 0x5c(r23)
/* 000015E8 90610100 */ stw r3, 0x100(r1)
/* 000015EC 90010104 */ stw r0, 0x104(r1)
/* 000015F0 80170060 */ lwz r0, 0x60(r23)
/* 000015F4 900100F4 */ stw r0, 0xf4(r1)
lbl_000015F8:
/* 000015F8 84640008 */ lwzu r3, 8(r4)
/* 000015FC 80040004 */ lwz r0, 4(r4)
/* 00001600 94650008 */ stwu r3, 8(r5)
/* 00001604 90050004 */ stw r0, 4(r5)
/* 00001608 4200FFF0 */ bdnz lbl_000015F8
/* 0000160C 80040008 */ lwz r0, 8(r4)
/* 00001610 3BD8015C */ addi r30, r24, 0x15c
/* 00001614 90050008 */ stw r0, 8(r5)
/* 00001618 4BFFEB95 */ bl reset_text_draw_settings
/* 0000161C 386000B1 */ li r3, 0xb1
/* 00001620 4BFFEB8D */ bl set_text_font
/* 00001624 C03901C0 */ lfs f1, 0x1c0(r25)
/* 00001628 FC400890 */ fmr f2, f1
/* 0000162C 4BFFEB81 */ bl set_text_scale
/* 00001630 3C600000 */ lis r3, gxCache@ha
/* 00001634 38630000 */ addi r3, r3, gxCache@l
/* 00001638 80630000 */ lwz r3, 0(r3)
/* 0000163C 88030008 */ lbz r0, 8(r3)
/* 00001640 28000001 */ cmplwi r0, 1
/* 00001644 4082001C */ bne lbl_00001660
/* 00001648 80030004 */ lwz r0, 4(r3)
/* 0000164C 2C000003 */ cmpwi r0, 3
/* 00001650 40820010 */ bne lbl_00001660
/* 00001654 88030000 */ lbz r0, 0(r3)
/* 00001658 28000001 */ cmplwi r0, 1
/* 0000165C 4182003C */ beq lbl_00001698
lbl_00001660:
/* 00001660 38600001 */ li r3, 1
/* 00001664 38800003 */ li r4, 3
/* 00001668 38A00001 */ li r5, 1
/* 0000166C 4BFFEB41 */ bl GXSetZMode
/* 00001670 3C600000 */ lis r3, gxCache@ha
/* 00001674 38830000 */ addi r4, r3, gxCache@l
/* 00001678 80640000 */ lwz r3, 0(r4)
/* 0000167C 38A00001 */ li r5, 1
/* 00001680 38000003 */ li r0, 3
/* 00001684 98A30000 */ stb r5, 0(r3)
/* 00001688 80640000 */ lwz r3, 0(r4)
/* 0000168C 90030004 */ stw r0, 4(r3)
/* 00001690 80640000 */ lwz r3, 0(r4)
/* 00001694 98A30008 */ stb r5, 8(r3)
lbl_00001698:
/* 00001698 4BFFEB15 */ bl mathutil_mtxA_from_identity
/* 0000169C 38600018 */ li r3, 0x18
/* 000016A0 4BFFEB0D */ bl gxutil_set_line_width
/* 000016A4 38800000 */ li r4, 0
/* 000016A8 2C040009 */ cmpwi r4, 9
/* 000016AC 4080004C */ bge lbl_000016F8
/* 000016B0 C01901B8 */ lfs f0, 0x1b8(r25)
/* 000016B4 38800008 */ li r4, 8
/* 000016B8 D0010024 */ stfs f0, 0x24(r1)
/* 000016BC D0010030 */ stfs f0, 0x30(r1)
/* 000016C0 D001003C */ stfs f0, 0x3c(r1)
/* 000016C4 D0010048 */ stfs f0, 0x48(r1)
/* 000016C8 D0010054 */ stfs f0, 0x54(r1)
/* 000016CC D0010060 */ stfs f0, 0x60(r1)
/* 000016D0 D001006C */ stfs f0, 0x6c(r1)
/* 000016D4 D0010078 */ stfs f0, 0x78(r1)
/* 000016D8 480009E0 */ b lbl_000020B8
lbl_000016DC:
/* 000016DC 20040009 */ subfic r0, r4, 9
/* 000016E0 2C040009 */ cmpwi r4, 9
/* 000016E4 7C0903A6 */ mtctr r0
/* 000016E8 40800010 */ bge lbl_000016F8
lbl_000016EC:
/* 000016EC D0030008 */ stfs f0, 8(r3)
/* 000016F0 3863000C */ addi r3, r3, 0xc
/* 000016F4 4200FFF8 */ bdnz lbl_000016EC
lbl_000016F8:
/* 000016F8 3BA00000 */ li r29, 0
/* 000016FC 3C800000 */ lis r4, lbl_801F3C60@ha
/* 00001700 3C600000 */ lis r3, controllerInfo@ha
/* 00001704 57A0103A */ slwi r0, r29, 2
/* 00001708 3BE100F8 */ addi r31, r1, 0xf8
/* 0000170C 3AA40000 */ addi r21, r4, lbl_801F3C60@l
/* 00001710 3A830000 */ addi r20, r3, controllerInfo@l
/* 00001714 3A780238 */ addi r19, r24, 0x238
/* 00001718 7FFF0214 */ add r31, r31, r0
/* 0000171C 3A41001C */ addi r18, r1, 0x1c
/* 00001720 3AC0FFFD */ li r22, -3
/* 00001724 3F604330 */ lis r27, 0x4330
/* 00001728 3F800100 */ lis r28, 0x100
/* 0000172C 3E000080 */ lis r16, 0x80
/* 00001730 3E20007F */ lis r17, 0x7f
/* 00001734 3F4000FF */ lis r26, 0xff
lbl_00001738:
/* 00001738 A81901C4 */ lha r0, 0x1c4(r25)
/* 0000173C 6ECF8000 */ xoris r15, r22, 0x8000
/* 00001740 91E1018C */ stw r15, 0x18c(r1)
/* 00001744 3C800000 */ lis r4, lbl_0000C270@ha
/* 00001748 6C008000 */ xoris r0, r0, 0x8000
/* 0000174C 90010194 */ stw r0, 0x194(r1)
/* 00001750 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001754 C03700D0 */ lfs f1, 0xd0(r23)
/* 00001758 C01901C0 */ lfs f0, 0x1c0(r25)
/* 0000175C 93610190 */ stw r27, 0x190(r1)
/* 00001760 ECE10032 */ fmuls f7, f1, f0
/* 00001764 C8640000 */ lfd f3, lbl_0000C270@l(r4)
/* 00001768 93610188 */ stw r27, 0x188(r1)
/* 0000176C C8010190 */ lfd f0, 0x190(r1)
/* 00001770 C8430000 */ lfd f2, lbl_0000C270@l(r3)
/* 00001774 C8210188 */ lfd f1, 0x188(r1)
/* 00001778 EC601828 */ fsubs f3, f0, f3
/* 0000177C C01700D8 */ lfs f0, 0xd8(r23)
/* 00001780 EC211028 */ fsubs f1, f1, f2
/* 00001784 C0B700D4 */ lfs f5, 0xd4(r23)
/* 00001788 EC0001F2 */ fmuls f0, f0, f7
/* 0000178C C8570048 */ lfd f2, 0x48(r23)
/* 00001790 EC830072 */ fmuls f4, f3, f1
/* 00001794 FC620032 */ fmul f3, f2, f0
/* 00001798 C0DE0004 */ lfs f6, 4(r30)
/* 0000179C C03700DC */ lfs f1, 0xdc(r23)
/* 000017A0 EC85202A */ fadds f4, f5, f4
/* 000017A4 FC0201F2 */ fmul f0, f2, f7
/* 000017A8 EC86202A */ fadds f4, f6, f4
/* 000017AC FC410028 */ fsub f2, f1, f0
/* 000017B0 FC241828 */ fsub f1, f4, f3
/* 000017B4 FC401018 */ frsp f2, f2
/* 000017B8 FC200818 */ frsp f1, f1
/* 000017BC 4BFFE9F1 */ bl set_text_pos
/* 000017C0 38600000 */ li r3, 0
/* 000017C4 4BFFE9E9 */ bl set_text_mul_color
/* 000017C8 387901C8 */ addi r3, r25, 0x1c8
/* 000017CC 4CC63182 */ crclr 6
/* 000017D0 389D0001 */ addi r4, r29, 1
/* 000017D4 4BFFE9D9 */ bl func_80072AC0
/* 000017D8 8815000A */ lbz r0, 0xa(r21)
/* 000017DC 7C000774 */ extsb r0, r0
/* 000017E0 2C00FFFF */ cmpwi r0, -1
/* 000017E4 408201D0 */ bne lbl_000019B4
/* 000017E8 A81901C4 */ lha r0, 0x1c4(r25)
/* 000017EC 3C800000 */ lis r4, lbl_0000C270@ha
/* 000017F0 91E10184 */ stw r15, 0x184(r1)
/* 000017F4 3C600000 */ lis r3, lbl_0000C270@ha
/* 000017F8 6C008000 */ xoris r0, r0, 0x8000
/* 000017FC 90010194 */ stw r0, 0x194(r1)
/* 00001800 C8440000 */ lfd f2, lbl_0000C270@l(r4)
/* 00001804 3C800000 */ lis r4, lbl_0000C270@ha
/* 00001808 93610190 */ stw r27, 0x190(r1)
/* 0000180C A81901C6 */ lha r0, 0x1c6(r25)
/* 00001810 C8010190 */ lfd f0, 0x190(r1)
/* 00001814 93610180 */ stw r27, 0x180(r1)
/* 00001818 6C008000 */ xoris r0, r0, 0x8000
/* 0000181C EC401028 */ fsubs f2, f0, f2
/* 00001820 C8230000 */ lfd f1, lbl_0000C270@l(r3)
/* 00001824 C8010180 */ lfd f0, 0x180(r1)
/* 00001828 9001018C */ stw r0, 0x18c(r1)
/* 0000182C EC000828 */ fsubs f0, f0, f1
/* 00001830 93610188 */ stw r27, 0x188(r1)
/* 00001834 C8840000 */ lfd f4, lbl_0000C270@l(r4)
/* 00001838 EC020032 */ fmuls f0, f2, f0
/* 0000183C C8610188 */ lfd f3, 0x188(r1)
/* 00001840 C03700D4 */ lfs f1, 0xd4(r23)
/* 00001844 EC632028 */ fsubs f3, f3, f4
/* 00001848 C0D700D0 */ lfs f6, 0xd0(r23)
/* 0000184C C0B901C0 */ lfs f5, 0x1c0(r25)
/* 00001850 EC21002A */ fadds f1, f1, f0
/* 00001854 C09700E8 */ lfs f4, 0xe8(r23)
/* 00001858 C05E0004 */ lfs f2, 4(r30)
/* 0000185C ECC60172 */ fmuls f6, f6, f5
/* 00001860 C01700EC */ lfs f0, 0xec(r23)
/* 00001864 EC64182A */ fadds f3, f4, f3
/* 00001868 C89700E0 */ lfd f4, 0xe0(r23)
/* 0000186C EC22082A */ fadds f1, f2, f1
/* 00001870 EC0001B2 */ fmuls f0, f0, f6
/* 00001874 C8570048 */ lfd f2, 0x48(r23)
/* 00001878 FCA4182A */ fadd f5, f4, f3
/* 0000187C FC64082A */ fadd f3, f4, f1
/* 00001880 FC220032 */ fmul f1, f2, f0
/* 00001884 FC601818 */ frsp f3, f3
/* 00001888 FC0201B2 */ fmul f0, f2, f6
/* 0000188C FCA02818 */ frsp f5, f5
/* 00001890 FC230828 */ fsub f1, f3, f1
/* 00001894 FC450028 */ fsub f2, f5, f0
/* 00001898 FC200818 */ frsp f1, f1
/* 0000189C FC401018 */ frsp f2, f2
/* 000018A0 4BFFE90D */ bl set_text_pos
/* 000018A4 C03700F0 */ lfs f1, 0xf0(r23)
/* 000018A8 4BFFE905 */ bl func_80071B1C
/* 000018AC 2C1D0000 */ cmpwi r29, 0
/* 000018B0 4082000C */ bne lbl_000018BC
/* 000018B4 387A7F7F */ addi r3, r26, 0x7f7f
/* 000018B8 48000028 */ b lbl_000018E0
lbl_000018BC:
/* 000018BC 2C1D0001 */ cmpwi r29, 1
/* 000018C0 4082000C */ bne lbl_000018CC
/* 000018C4 38717FFF */ addi r3, r17, 0x7fff
/* 000018C8 48000018 */ b lbl_000018E0
lbl_000018CC:
/* 000018CC 2C1D0002 */ cmpwi r29, 2
/* 000018D0 4082000C */ bne lbl_000018DC
/* 000018D4 387CFF7F */ addi r3, r28, -129  ;# fixed addi
/* 000018D8 48000008 */ b lbl_000018E0
lbl_000018DC:
/* 000018DC 3870FF7F */ addi r3, r16, -129  ;# fixed addi
lbl_000018E0:
/* 000018E0 4BFFE8CD */ bl set_text_mul_color
/* 000018E4 387901D8 */ addi r3, r25, 0x1d8
/* 000018E8 4BFFE8C5 */ bl u_draw_text
/* 000018EC A87901C4 */ lha r3, 0x1c4(r25)
/* 000018F0 6EC08000 */ xoris r0, r22, 0x8000
/* 000018F4 90010194 */ stw r0, 0x194(r1)
/* 000018F8 3C800000 */ lis r4, lbl_0000C270@ha
/* 000018FC 6C608000 */ xoris r0, r3, 0x8000
/* 00001900 9001018C */ stw r0, 0x18c(r1)
/* 00001904 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001908 C8440000 */ lfd f2, lbl_0000C270@l(r4)
/* 0000190C 3C800000 */ lis r4, lbl_0000C270@ha
/* 00001910 93610188 */ stw r27, 0x188(r1)
/* 00001914 A81901C6 */ lha r0, 0x1c6(r25)
/* 00001918 C8010188 */ lfd f0, 0x188(r1)
/* 0000191C 93610190 */ stw r27, 0x190(r1)
/* 00001920 6C008000 */ xoris r0, r0, 0x8000
/* 00001924 EC401028 */ fsubs f2, f0, f2
/* 00001928 C8230000 */ lfd f1, lbl_0000C270@l(r3)
/* 0000192C C8010190 */ lfd f0, 0x190(r1)
/* 00001930 90010184 */ stw r0, 0x184(r1)
/* 00001934 EC000828 */ fsubs f0, f0, f1
/* 00001938 C0B700D0 */ lfs f5, 0xd0(r23)
/* 0000193C C09901C0 */ lfs f4, 0x1c0(r25)
/* 00001940 EC220032 */ fmuls f1, f2, f0
/* 00001944 C07700D4 */ lfs f3, 0xd4(r23)
/* 00001948 ECE50132 */ fmuls f7, f5, f4
/* 0000194C 93610180 */ stw r27, 0x180(r1)
/* 00001950 C01700EC */ lfs f0, 0xec(r23)
/* 00001954 C8C40000 */ lfd f6, lbl_0000C270@l(r4)
/* 00001958 EC0001F2 */ fmuls f0, f0, f7
/* 0000195C C8A10180 */ lfd f5, 0x180(r1)
/* 00001960 EC63082A */ fadds f3, f3, f1
/* 00001964 C8570048 */ lfd f2, 0x48(r23)
/* 00001968 ECA53028 */ fsubs f5, f5, f6
/* 0000196C C09E0004 */ lfs f4, 4(r30)
/* 00001970 FC220032 */ fmul f1, f2, f0
/* 00001974 C0D700E8 */ lfs f6, 0xe8(r23)
/* 00001978 FC0201F2 */ fmul f0, f2, f7
/* 0000197C EC64182A */ fadds f3, f4, f3
/* 00001980 EC46282A */ fadds f2, f6, f5
/* 00001984 FC230828 */ fsub f1, f3, f1
/* 00001988 FC420028 */ fsub f2, f2, f0
/* 0000198C FC200818 */ frsp f1, f1
/* 00001990 FC401018 */ frsp f2, f2
/* 00001994 4BFFE819 */ bl set_text_pos
/* 00001998 C03700F4 */ lfs f1, 0xf4(r23)
/* 0000199C 4BFFE811 */ bl func_80071B1C
/* 000019A0 38600000 */ li r3, 0
/* 000019A4 4BFFE809 */ bl set_text_mul_color
/* 000019A8 387901D8 */ addi r3, r25, 0x1d8
/* 000019AC 4BFFE801 */ bl u_draw_text
/* 000019B0 480006E4 */ b lbl_00002094
lbl_000019B4:
/* 000019B4 801E001C */ lwz r0, 0x1c(r30)
/* 000019B8 2C000000 */ cmpwi r0, 0
/* 000019BC 418100FC */ bgt lbl_00001AB8
/* 000019C0 91E1018C */ stw r15, 0x18c(r1)
/* 000019C4 3C600000 */ lis r3, lbl_0000C270@ha
/* 000019C8 88140002 */ lbz r0, 2(r20)
/* 000019CC 3CA00000 */ lis r5, lbl_0000C270@ha
/* 000019D0 93610188 */ stw r27, 0x188(r1)
/* 000019D4 7C040774 */ extsb r4, r0
/* 000019D8 88140003 */ lbz r0, 3(r20)
/* 000019DC 6C848000 */ xoris r4, r4, 0x8000
/* 000019E0 C8230000 */ lfd f1, lbl_0000C270@l(r3)
/* 000019E4 90810184 */ stw r4, 0x184(r1)
/* 000019E8 7C000774 */ extsb r0, r0
/* 000019EC C8010188 */ lfd f0, 0x188(r1)
/* 000019F0 7C0000D0 */ neg r0, r0
/* 000019F4 91E1017C */ stw r15, 0x17c(r1)
/* 000019F8 EC000828 */ fsubs f0, f0, f1
/* 000019FC 6C008000 */ xoris r0, r0, 0x8000
/* 00001A00 93610180 */ stw r27, 0x180(r1)
/* 00001A04 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001A08 C03901BC */ lfs f1, 0x1bc(r25)
/* 00001A0C 90010194 */ stw r0, 0x194(r1)
/* 00001A10 EC810032 */ fmuls f4, f1, f0
/* 00001A14 C8650000 */ lfd f3, lbl_0000C270@l(r5)
/* 00001A18 3C800000 */ lis r4, lbl_0000C270@ha
/* 00001A1C 93610178 */ stw r27, 0x178(r1)
/* 00001A20 C8410180 */ lfd f2, 0x180(r1)
/* 00001A24 C8230000 */ lfd f1, lbl_0000C270@l(r3)
/* 00001A28 ECA21828 */ fsubs f5, f2, f3
/* 00001A2C C8010178 */ lfd f0, 0x178(r1)
/* 00001A30 93610190 */ stw r27, 0x190(r1)
/* 00001A34 EC000828 */ fsubs f0, f0, f1
/* 00001A38 C0386298 */ lfs f1, 0x6298(r24)
/* 00001A3C ECA5202A */ fadds f5, f5, f4
/* 00001A40 C8F70100 */ lfd f7, 0x100(r23)
/* 00001A44 EC010032 */ fmuls f0, f1, f0
/* 00001A48 C8640000 */ lfd f3, lbl_0000C270@l(r4)
/* 00001A4C C8410190 */ lfd f2, 0x190(r1)
/* 00001A50 FCC53824 */ fdiv f6, f5, f7
/* 00001A54 C8970108 */ lfd f4, 0x108(r23)
/* 00001A58 C91700F8 */ lfd f8, 0xf8(r23)
/* 00001A5C C8B70048 */ lfd f5, 0x48(r23)
/* 00001A60 C8370110 */ lfd f1, 0x110(r23)
/* 00001A64 EC421828 */ fsubs f2, f2, f3
/* 00001A68 C07901C0 */ lfs f3, 0x1c0(r25)
/* 00001A6C C13E0004 */ lfs f9, 4(r30)
/* 00001A70 EC02002A */ fadds f0, f2, f0
/* 00001A74 FC4400F2 */ fmul f2, f4, f3
/* 00001A78 FC003824 */ fdiv f0, f0, f7
/* 00001A7C FC080032 */ fmul f0, f8, f0
/* 00001A80 FC6801B2 */ fmul f3, f8, f6
/* 00001A84 FC8500B2 */ fmul f4, f5, f2
/* 00001A88 FC48182A */ fadd f2, f8, f3
/* 00001A8C FC01002A */ fadd f0, f1, f0
/* 00001A90 FC222028 */ fsub f1, f2, f4
/* 00001A94 FC402028 */ fsub f2, f0, f4
/* 00001A98 FC29082A */ fadd f1, f9, f1
/* 00001A9C FC401018 */ frsp f2, f2
/* 00001AA0 FC200818 */ frsp f1, f1
/* 00001AA4 4BFFE709 */ bl set_text_pos
/* 00001AA8 387CFFFF */ addi r3, r28, -1  ;# fixed addi
/* 00001AAC 4BFFE701 */ bl set_text_mul_color
/* 00001AB0 387901F4 */ addi r3, r25, 0x1f4
/* 00001AB4 4BFFE6F9 */ bl u_draw_text
lbl_00001AB8:
/* 00001AB8 C03E0004 */ lfs f1, 4(r30)
/* 00001ABC 6ECF8000 */ xoris r15, r22, 0x8000
/* 00001AC0 C81700F8 */ lfd f0, 0xf8(r23)
/* 00001AC4 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001AC8 91E1017C */ stw r15, 0x17c(r1)
/* 00001ACC FC410024 */ fdiv f2, f1, f0
/* 00001AD0 C8770100 */ lfd f3, 0x100(r23)
/* 00001AD4 93610178 */ stw r27, 0x178(r1)
/* 00001AD8 C8230000 */ lfd f1, lbl_0000C270@l(r3)
/* 00001ADC C8010178 */ lfd f0, 0x178(r1)
/* 00001AE0 EC000828 */ fsubs f0, f0, f1
/* 00001AE4 C0210088 */ lfs f1, 0x88(r1)
/* 00001AE8 FC6300B2 */ fmul f3, f3, f2
/* 00001AEC C05901BC */ lfs f2, 0x1bc(r25)
/* 00001AF0 EC020032 */ fmuls f0, f2, f0
/* 00001AF4 EC21002A */ fadds f1, f1, f0
/* 00001AF8 FC23082A */ fadd f1, f3, f1
/* 00001AFC FC200818 */ frsp f1, f1
/* 00001B00 D021001C */ stfs f1, 0x1c(r1)
/* 00001B04 C0386298 */ lfs f1, 0x6298(r24)
/* 00001B08 C041008C */ lfs f2, 0x8c(r1)
/* 00001B0C EC41102A */ fadds f2, f1, f2
/* 00001B10 D0410020 */ stfs f2, 0x20(r1)
/* 00001B14 C09E0004 */ lfs f4, 4(r30)
/* 00001B18 C87700F8 */ lfd f3, 0xf8(r23)
/* 00001B1C C0410094 */ lfs f2, 0x94(r1)
/* 00001B20 FC641824 */ fdiv f3, f4, f3
/* 00001B24 C8970100 */ lfd f4, 0x100(r23)
/* 00001B28 FC6400F2 */ fmul f3, f4, f3
/* 00001B2C EC42002A */ fadds f2, f2, f0
/* 00001B30 FC43102A */ fadd f2, f3, f2
/* 00001B34 FC401018 */ frsp f2, f2
/* 00001B38 D0410028 */ stfs f2, 0x28(r1)
/* 00001B3C C0410098 */ lfs f2, 0x98(r1)
/* 00001B40 EC41102A */ fadds f2, f1, f2
/* 00001B44 D041002C */ stfs f2, 0x2c(r1)
/* 00001B48 C09E0004 */ lfs f4, 4(r30)
/* 00001B4C C87700F8 */ lfd f3, 0xf8(r23)
/* 00001B50 C04100A0 */ lfs f2, 0xa0(r1)
/* 00001B54 FC641824 */ fdiv f3, f4, f3
/* 00001B58 C8970100 */ lfd f4, 0x100(r23)
/* 00001B5C FC6400F2 */ fmul f3, f4, f3
/* 00001B60 EC42002A */ fadds f2, f2, f0
/* 00001B64 FC43102A */ fadd f2, f3, f2
/* 00001B68 FC401018 */ frsp f2, f2
/* 00001B6C D0410034 */ stfs f2, 0x34(r1)
/* 00001B70 C04100A4 */ lfs f2, 0xa4(r1)
/* 00001B74 EC41102A */ fadds f2, f1, f2
/* 00001B78 D0410038 */ stfs f2, 0x38(r1)
/* 00001B7C C09E0004 */ lfs f4, 4(r30)
/* 00001B80 C87700F8 */ lfd f3, 0xf8(r23)
/* 00001B84 C04100AC */ lfs f2, 0xac(r1)
/* 00001B88 FC641824 */ fdiv f3, f4, f3
/* 00001B8C C8970100 */ lfd f4, 0x100(r23)
/* 00001B90 FC6400F2 */ fmul f3, f4, f3
/* 00001B94 EC42002A */ fadds f2, f2, f0
/* 00001B98 FC43102A */ fadd f2, f3, f2
/* 00001B9C FC401018 */ frsp f2, f2
/* 00001BA0 D0410040 */ stfs f2, 0x40(r1)
/* 00001BA4 C04100B0 */ lfs f2, 0xb0(r1)
/* 00001BA8 EC41102A */ fadds f2, f1, f2
/* 00001BAC D0410044 */ stfs f2, 0x44(r1)
/* 00001BB0 C09E0004 */ lfs f4, 4(r30)
/* 00001BB4 C87700F8 */ lfd f3, 0xf8(r23)
/* 00001BB8 C04100B8 */ lfs f2, 0xb8(r1)
/* 00001BBC FC641824 */ fdiv f3, f4, f3
/* 00001BC0 C8970100 */ lfd f4, 0x100(r23)
/* 00001BC4 FC6400F2 */ fmul f3, f4, f3
/* 00001BC8 EC42002A */ fadds f2, f2, f0
/* 00001BCC FC43102A */ fadd f2, f3, f2
/* 00001BD0 FC401018 */ frsp f2, f2
/* 00001BD4 D041004C */ stfs f2, 0x4c(r1)
/* 00001BD8 C04100BC */ lfs f2, 0xbc(r1)
/* 00001BDC EC41102A */ fadds f2, f1, f2
/* 00001BE0 D0410050 */ stfs f2, 0x50(r1)
/* 00001BE4 C09E0004 */ lfs f4, 4(r30)
/* 00001BE8 C87700F8 */ lfd f3, 0xf8(r23)
/* 00001BEC C04100C4 */ lfs f2, 0xc4(r1)
/* 00001BF0 FC641824 */ fdiv f3, f4, f3
/* 00001BF4 C8970100 */ lfd f4, 0x100(r23)
/* 00001BF8 FC6400F2 */ fmul f3, f4, f3
/* 00001BFC EC42002A */ fadds f2, f2, f0
/* 00001C00 FC43102A */ fadd f2, f3, f2
/* 00001C04 FC401018 */ frsp f2, f2
/* 00001C08 D0410058 */ stfs f2, 0x58(r1)
/* 00001C0C C04100C8 */ lfs f2, 0xc8(r1)
/* 00001C10 EC41102A */ fadds f2, f1, f2
/* 00001C14 D041005C */ stfs f2, 0x5c(r1)
/* 00001C18 C09E0004 */ lfs f4, 4(r30)
/* 00001C1C 7E449378 */ mr r4, r18
/* 00001C20 C87700F8 */ lfd f3, 0xf8(r23)
/* 00001C24 38A100F4 */ addi r5, r1, 0xf4
/* 00001C28 C04100D0 */ lfs f2, 0xd0(r1)
/* 00001C2C FC641824 */ fdiv f3, f4, f3
/* 00001C30 C8970100 */ lfd f4, 0x100(r23)
/* 00001C34 38600009 */ li r3, 9
/* 00001C38 FC6400F2 */ fmul f3, f4, f3
/* 00001C3C EC42002A */ fadds f2, f2, f0
/* 00001C40 FC43102A */ fadd f2, f3, f2
/* 00001C44 FC401018 */ frsp f2, f2
/* 00001C48 D0410064 */ stfs f2, 0x64(r1)
/* 00001C4C C04100D4 */ lfs f2, 0xd4(r1)
/* 00001C50 EC41102A */ fadds f2, f1, f2
/* 00001C54 D0410068 */ stfs f2, 0x68(r1)
/* 00001C58 C09E0004 */ lfs f4, 4(r30)
/* 00001C5C C87700F8 */ lfd f3, 0xf8(r23)
/* 00001C60 C04100DC */ lfs f2, 0xdc(r1)
/* 00001C64 FC641824 */ fdiv f3, f4, f3
/* 00001C68 C8970100 */ lfd f4, 0x100(r23)
/* 00001C6C FC6400F2 */ fmul f3, f4, f3
/* 00001C70 EC02002A */ fadds f0, f2, f0
/* 00001C74 FC03002A */ fadd f0, f3, f0
/* 00001C78 FC000018 */ frsp f0, f0
/* 00001C7C D0010070 */ stfs f0, 0x70(r1)
/* 00001C80 C00100E0 */ lfs f0, 0xe0(r1)
/* 00001C84 EC01002A */ fadds f0, f1, f0
/* 00001C88 D0010074 */ stfs f0, 0x74(r1)
/* 00001C8C 80C1001C */ lwz r6, 0x1c(r1)
/* 00001C90 80010020 */ lwz r0, 0x20(r1)
/* 00001C94 90C1007C */ stw r6, 0x7c(r1)
/* 00001C98 90010080 */ stw r0, 0x80(r1)
/* 00001C9C 80010024 */ lwz r0, 0x24(r1)
/* 00001CA0 90010084 */ stw r0, 0x84(r1)
/* 00001CA4 4BFFE509 */ bl gxutil_draw_line_strip
/* 00001CA8 C03E0004 */ lfs f1, 4(r30)
/* 00001CAC 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001CB0 C81700F8 */ lfd f0, 0xf8(r23)
/* 00001CB4 3CE00000 */ lis r7, lbl_0000C270@ha
/* 00001CB8 88130000 */ lbz r0, 0(r19)
/* 00001CBC FC810024 */ fdiv f4, f1, f0
/* 00001CC0 91E10184 */ stw r15, 0x184(r1)
/* 00001CC4 7C000774 */ extsb r0, r0
/* 00001CC8 C8230000 */ lfd f1, lbl_0000C270@l(r3)
/* 00001CCC 93610180 */ stw r27, 0x180(r1)
/* 00001CD0 6C008000 */ xoris r0, r0, 0x8000
/* 00001CD4 C8010180 */ lfd f0, 0x180(r1)
/* 00001CD8 9001018C */ stw r0, 0x18c(r1)
/* 00001CDC 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001CE0 C8430000 */ lfd f2, lbl_0000C270@l(r3)
/* 00001CE4 EC000828 */ fsubs f0, f0, f1
/* 00001CE8 93610188 */ stw r27, 0x188(r1)
/* 00001CEC C07901BC */ lfs f3, 0x1bc(r25)
/* 00001CF0 3CC00000 */ lis r6, lbl_0000C270@ha
/* 00001CF4 C8210188 */ lfd f1, 0x188(r1)
/* 00001CF8 C8B70100 */ lfd f5, 0x100(r23)
/* 00001CFC EC030032 */ fmuls f0, f3, f0
/* 00001D00 EC211028 */ fsubs f1, f1, f2
/* 00001D04 3CA00000 */ lis r5, lbl_0000C270@ha
/* 00001D08 FC850132 */ fmul f4, f5, f4
/* 00001D0C 3C800000 */ lis r4, lbl_0000C270@ha
/* 00001D10 EC20082A */ fadds f1, f0, f1
/* 00001D14 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001D18 FC24082A */ fadd f1, f4, f1
/* 00001D1C FC200818 */ frsp f1, f1
/* 00001D20 D021001C */ stfs f1, 0x1c(r1)
/* 00001D24 88130001 */ lbz r0, 1(r19)
/* 00001D28 C8670000 */ lfd f3, lbl_0000C270@l(r7)
/* 00001D2C 7C000774 */ extsb r0, r0
/* 00001D30 C0386298 */ lfs f1, 0x6298(r24)
/* 00001D34 6C008000 */ xoris r0, r0, 0x8000
/* 00001D38 90010194 */ stw r0, 0x194(r1)
/* 00001D3C 93610190 */ stw r27, 0x190(r1)
/* 00001D40 C8410190 */ lfd f2, 0x190(r1)
/* 00001D44 EC421828 */ fsubs f2, f2, f3
/* 00001D48 EC41102A */ fadds f2, f1, f2
/* 00001D4C D0410020 */ stfs f2, 0x20(r1)
/* 00001D50 C07E0004 */ lfs f3, 4(r30)
/* 00001D54 C85700F8 */ lfd f2, 0xf8(r23)
/* 00001D58 88130002 */ lbz r0, 2(r19)
/* 00001D5C FC431024 */ fdiv f2, f3, f2
/* 00001D60 C8970100 */ lfd f4, 0x100(r23)
/* 00001D64 7C000774 */ extsb r0, r0
/* 00001D68 C8660000 */ lfd f3, lbl_0000C270@l(r6)
/* 00001D6C 6C008000 */ xoris r0, r0, 0x8000
/* 00001D70 90010174 */ stw r0, 0x174(r1)
/* 00001D74 FC8400B2 */ fmul f4, f4, f2
/* 00001D78 93610170 */ stw r27, 0x170(r1)
/* 00001D7C C8410170 */ lfd f2, 0x170(r1)
/* 00001D80 EC421828 */ fsubs f2, f2, f3
/* 00001D84 EC40102A */ fadds f2, f0, f2
/* 00001D88 FC44102A */ fadd f2, f4, f2
/* 00001D8C FC401018 */ frsp f2, f2
/* 00001D90 D0410028 */ stfs f2, 0x28(r1)
/* 00001D94 88130003 */ lbz r0, 3(r19)
/* 00001D98 C8650000 */ lfd f3, lbl_0000C270@l(r5)
/* 00001D9C 7C000774 */ extsb r0, r0
/* 00001DA0 6C008000 */ xoris r0, r0, 0x8000
/* 00001DA4 9001016C */ stw r0, 0x16c(r1)
/* 00001DA8 93610168 */ stw r27, 0x168(r1)
/* 00001DAC C8410168 */ lfd f2, 0x168(r1)
/* 00001DB0 EC421828 */ fsubs f2, f2, f3
/* 00001DB4 EC41102A */ fadds f2, f1, f2
/* 00001DB8 D041002C */ stfs f2, 0x2c(r1)
/* 00001DBC C09E0004 */ lfs f4, 4(r30)
/* 00001DC0 C85700F8 */ lfd f2, 0xf8(r23)
/* 00001DC4 88130004 */ lbz r0, 4(r19)
/* 00001DC8 FC841024 */ fdiv f4, f4, f2
/* 00001DCC C8640000 */ lfd f3, lbl_0000C270@l(r4)
/* 00001DD0 7C000774 */ extsb r0, r0
/* 00001DD4 C8B70100 */ lfd f5, 0x100(r23)
/* 00001DD8 6C008000 */ xoris r0, r0, 0x8000
/* 00001DDC 90010164 */ stw r0, 0x164(r1)
/* 00001DE0 93610160 */ stw r27, 0x160(r1)
/* 00001DE4 C8410160 */ lfd f2, 0x160(r1)
/* 00001DE8 EC421828 */ fsubs f2, f2, f3
/* 00001DEC FC650132 */ fmul f3, f5, f4
/* 00001DF0 EC40102A */ fadds f2, f0, f2
/* 00001DF4 FC43102A */ fadd f2, f3, f2
/* 00001DF8 FC401018 */ frsp f2, f2
/* 00001DFC D0410034 */ stfs f2, 0x34(r1)
/* 00001E00 88130005 */ lbz r0, 5(r19)
/* 00001E04 C8630000 */ lfd f3, lbl_0000C270@l(r3)
/* 00001E08 7C000774 */ extsb r0, r0
/* 00001E0C 6C008000 */ xoris r0, r0, 0x8000
/* 00001E10 9001015C */ stw r0, 0x15c(r1)
/* 00001E14 93610158 */ stw r27, 0x158(r1)
/* 00001E18 C8410158 */ lfd f2, 0x158(r1)
/* 00001E1C EC421828 */ fsubs f2, f2, f3
/* 00001E20 EC41102A */ fadds f2, f1, f2
/* 00001E24 D0410038 */ stfs f2, 0x38(r1)
/* 00001E28 C07E0004 */ lfs f3, 4(r30)
/* 00001E2C 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001E30 C85700F8 */ lfd f2, 0xf8(r23)
/* 00001E34 3D000000 */ lis r8, lbl_0000C270@ha
/* 00001E38 88130006 */ lbz r0, 6(r19)
/* 00001E3C FC431024 */ fdiv f2, f3, f2
/* 00001E40 C8970100 */ lfd f4, 0x100(r23)
/* 00001E44 7C000774 */ extsb r0, r0
/* 00001E48 C8630000 */ lfd f3, lbl_0000C270@l(r3)
/* 00001E4C 6C008000 */ xoris r0, r0, 0x8000
/* 00001E50 90010154 */ stw r0, 0x154(r1)
/* 00001E54 FC8400B2 */ fmul f4, f4, f2
/* 00001E58 3CE00000 */ lis r7, lbl_0000C270@ha
/* 00001E5C 93610150 */ stw r27, 0x150(r1)
/* 00001E60 3CC00000 */ lis r6, lbl_0000C270@ha
/* 00001E64 3CA00000 */ lis r5, lbl_0000C270@ha
/* 00001E68 C8410150 */ lfd f2, 0x150(r1)
/* 00001E6C 3C800000 */ lis r4, lbl_0000C270@ha
/* 00001E70 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001E74 EC421828 */ fsubs f2, f2, f3
/* 00001E78 EC40102A */ fadds f2, f0, f2
/* 00001E7C FC44102A */ fadd f2, f4, f2
/* 00001E80 FC401018 */ frsp f2, f2
/* 00001E84 D0410040 */ stfs f2, 0x40(r1)
/* 00001E88 88130007 */ lbz r0, 7(r19)
/* 00001E8C C8680000 */ lfd f3, lbl_0000C270@l(r8)
/* 00001E90 7C000774 */ extsb r0, r0
/* 00001E94 6C008000 */ xoris r0, r0, 0x8000
/* 00001E98 9001014C */ stw r0, 0x14c(r1)
/* 00001E9C 93610148 */ stw r27, 0x148(r1)
/* 00001EA0 C8410148 */ lfd f2, 0x148(r1)
/* 00001EA4 EC421828 */ fsubs f2, f2, f3
/* 00001EA8 EC41102A */ fadds f2, f1, f2
/* 00001EAC D0410044 */ stfs f2, 0x44(r1)
/* 00001EB0 C07E0004 */ lfs f3, 4(r30)
/* 00001EB4 C85700F8 */ lfd f2, 0xf8(r23)
/* 00001EB8 88130008 */ lbz r0, 8(r19)
/* 00001EBC FC431024 */ fdiv f2, f3, f2
/* 00001EC0 C8970100 */ lfd f4, 0x100(r23)
/* 00001EC4 7C000774 */ extsb r0, r0
/* 00001EC8 C8670000 */ lfd f3, lbl_0000C270@l(r7)
/* 00001ECC 6C008000 */ xoris r0, r0, 0x8000
/* 00001ED0 90010144 */ stw r0, 0x144(r1)
/* 00001ED4 FC8400B2 */ fmul f4, f4, f2
/* 00001ED8 93610140 */ stw r27, 0x140(r1)
/* 00001EDC C8410140 */ lfd f2, 0x140(r1)
/* 00001EE0 EC421828 */ fsubs f2, f2, f3
/* 00001EE4 EC40102A */ fadds f2, f0, f2
/* 00001EE8 FC44102A */ fadd f2, f4, f2
/* 00001EEC FC401018 */ frsp f2, f2
/* 00001EF0 D041004C */ stfs f2, 0x4c(r1)
/* 00001EF4 88130009 */ lbz r0, 9(r19)
/* 00001EF8 C8660000 */ lfd f3, lbl_0000C270@l(r6)
/* 00001EFC 7C000774 */ extsb r0, r0
/* 00001F00 6C008000 */ xoris r0, r0, 0x8000
/* 00001F04 9001013C */ stw r0, 0x13c(r1)
/* 00001F08 93610138 */ stw r27, 0x138(r1)
/* 00001F0C C8410138 */ lfd f2, 0x138(r1)
/* 00001F10 EC421828 */ fsubs f2, f2, f3
/* 00001F14 EC41102A */ fadds f2, f1, f2
/* 00001F18 D0410050 */ stfs f2, 0x50(r1)
/* 00001F1C C07E0004 */ lfs f3, 4(r30)
/* 00001F20 C85700F8 */ lfd f2, 0xf8(r23)
/* 00001F24 8813000A */ lbz r0, 0xa(r19)
/* 00001F28 FC431024 */ fdiv f2, f3, f2
/* 00001F2C C8970100 */ lfd f4, 0x100(r23)
/* 00001F30 7C000774 */ extsb r0, r0
/* 00001F34 C8650000 */ lfd f3, lbl_0000C270@l(r5)
/* 00001F38 6C008000 */ xoris r0, r0, 0x8000
/* 00001F3C 90010134 */ stw r0, 0x134(r1)
/* 00001F40 FC8400B2 */ fmul f4, f4, f2
/* 00001F44 93610130 */ stw r27, 0x130(r1)
/* 00001F48 C8410130 */ lfd f2, 0x130(r1)
/* 00001F4C EC421828 */ fsubs f2, f2, f3
/* 00001F50 EC40102A */ fadds f2, f0, f2
/* 00001F54 FC44102A */ fadd f2, f4, f2
/* 00001F58 FC401018 */ frsp f2, f2
/* 00001F5C D0410058 */ stfs f2, 0x58(r1)
/* 00001F60 8813000B */ lbz r0, 0xb(r19)
/* 00001F64 C8640000 */ lfd f3, lbl_0000C270@l(r4)
/* 00001F68 7C000774 */ extsb r0, r0
/* 00001F6C 6C008000 */ xoris r0, r0, 0x8000
/* 00001F70 9001012C */ stw r0, 0x12c(r1)
/* 00001F74 93610128 */ stw r27, 0x128(r1)
/* 00001F78 C8410128 */ lfd f2, 0x128(r1)
/* 00001F7C EC421828 */ fsubs f2, f2, f3
/* 00001F80 EC41102A */ fadds f2, f1, f2
/* 00001F84 D041005C */ stfs f2, 0x5c(r1)
/* 00001F88 C09E0004 */ lfs f4, 4(r30)
/* 00001F8C C85700F8 */ lfd f2, 0xf8(r23)
/* 00001F90 8813000C */ lbz r0, 0xc(r19)
/* 00001F94 FC841024 */ fdiv f4, f4, f2
/* 00001F98 C8630000 */ lfd f3, lbl_0000C270@l(r3)
/* 00001F9C 7C000774 */ extsb r0, r0
/* 00001FA0 C8B70100 */ lfd f5, 0x100(r23)
/* 00001FA4 6C008000 */ xoris r0, r0, 0x8000
/* 00001FA8 90010124 */ stw r0, 0x124(r1)
/* 00001FAC 93610120 */ stw r27, 0x120(r1)
/* 00001FB0 C8410120 */ lfd f2, 0x120(r1)
/* 00001FB4 EC421828 */ fsubs f2, f2, f3
/* 00001FB8 FC650132 */ fmul f3, f5, f4
/* 00001FBC EC40102A */ fadds f2, f0, f2
/* 00001FC0 FC43102A */ fadd f2, f3, f2
/* 00001FC4 FC401018 */ frsp f2, f2
/* 00001FC8 D0410064 */ stfs f2, 0x64(r1)
/* 00001FCC 8813000D */ lbz r0, 0xd(r19)
/* 00001FD0 3C600000 */ lis r3, lbl_0000C270@ha
/* 00001FD4 C8630000 */ lfd f3, lbl_0000C270@l(r3)
/* 00001FD8 3CE00000 */ lis r7, lbl_0000C270@ha
/* 00001FDC 7C000774 */ extsb r0, r0
/* 00001FE0 6C008000 */ xoris r0, r0, 0x8000
/* 00001FE4 9001011C */ stw r0, 0x11c(r1)
/* 00001FE8 3CC00000 */ lis r6, lbl_0000C270@ha
/* 00001FEC 38920000 */ addi r4, r18, 0
/* 00001FF0 93610118 */ stw r27, 0x118(r1)
/* 00001FF4 38BF0000 */ addi r5, r31, 0
/* 00001FF8 38600009 */ li r3, 9
/* 00001FFC C8410118 */ lfd f2, 0x118(r1)
/* 00002000 EC421828 */ fsubs f2, f2, f3
/* 00002004 EC41102A */ fadds f2, f1, f2
/* 00002008 D0410068 */ stfs f2, 0x68(r1)
/* 0000200C C07E0004 */ lfs f3, 4(r30)
/* 00002010 C85700F8 */ lfd f2, 0xf8(r23)
/* 00002014 8813000E */ lbz r0, 0xe(r19)
/* 00002018 FC431024 */ fdiv f2, f3, f2
/* 0000201C C8970100 */ lfd f4, 0x100(r23)
/* 00002020 7C000774 */ extsb r0, r0
/* 00002024 C8670000 */ lfd f3, lbl_0000C270@l(r7)
/* 00002028 6C008000 */ xoris r0, r0, 0x8000
/* 0000202C 90010114 */ stw r0, 0x114(r1)
/* 00002030 FC8400B2 */ fmul f4, f4, f2
/* 00002034 93610110 */ stw r27, 0x110(r1)
/* 00002038 C8410110 */ lfd f2, 0x110(r1)
/* 0000203C EC421828 */ fsubs f2, f2, f3
/* 00002040 EC00102A */ fadds f0, f0, f2
/* 00002044 FC04002A */ fadd f0, f4, f0
/* 00002048 FC000018 */ frsp f0, f0
/* 0000204C D0010070 */ stfs f0, 0x70(r1)
/* 00002050 8813000F */ lbz r0, 0xf(r19)
/* 00002054 C8460000 */ lfd f2, lbl_0000C270@l(r6)
/* 00002058 7C000774 */ extsb r0, r0
/* 0000205C 6C008000 */ xoris r0, r0, 0x8000
/* 00002060 9001010C */ stw r0, 0x10c(r1)
/* 00002064 93610108 */ stw r27, 0x108(r1)
/* 00002068 C8010108 */ lfd f0, 0x108(r1)
/* 0000206C EC001028 */ fsubs f0, f0, f2
/* 00002070 EC01002A */ fadds f0, f1, f0
/* 00002074 D0010074 */ stfs f0, 0x74(r1)
/* 00002078 80C1001C */ lwz r6, 0x1c(r1)
/* 0000207C 80010020 */ lwz r0, 0x20(r1)
/* 00002080 90C1007C */ stw r6, 0x7c(r1)
/* 00002084 90010080 */ stw r0, 0x80(r1)
/* 00002088 80010024 */ lwz r0, 0x24(r1)
/* 0000208C 90010084 */ stw r0, 0x84(r1)
/* 00002090 4BFFE11D */ bl gxutil_draw_line_strip
lbl_00002094:
/* 00002094 3BBD0001 */ addi r29, r29, 1
/* 00002098 2C1D0004 */ cmpwi r29, 4
/* 0000209C 3AD60002 */ addi r22, r22, 2
/* 000020A0 3AB5003C */ addi r21, r21, 0x3c
/* 000020A4 3A94003C */ addi r20, r20, 0x3c
/* 000020A8 3A730010 */ addi r19, r19, 0x10
/* 000020AC 3BFF0004 */ addi r31, r31, 4
/* 000020B0 4180F688 */ blt lbl_00001738
/* 000020B4 48000018 */ b lbl_000020CC
lbl_000020B8:
/* 000020B8 1C04000C */ mulli r0, r4, 0xc
/* 000020BC C01901B8 */ lfs f0, 0x1b8(r25)
/* 000020C0 3861001C */ addi r3, r1, 0x1c
/* 000020C4 7C630214 */ add r3, r3, r0
/* 000020C8 4BFFF614 */ b lbl_000016DC
lbl_000020CC:
/* 000020CC B9E1019C */ lmw r15, 0x19c(r1)
/* 000020D0 800101E4 */ lwz r0, 0x1e4(r1)
/* 000020D4 382101E0 */ addi r1, r1, 0x1e0
/* 000020D8 7C0803A6 */ mtlr r0
/* 000020DC 4E800020 */ blr 
lbl_000020E0:
/* 000020E0 7C0802A6 */ mflr r0
/* 000020E4 90010004 */ stw r0, 4(r1)
/* 000020E8 9421FFF8 */ stwu r1, -8(r1)
/* 000020EC 480056A5 */ bl lbl_00007790
/* 000020F0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000020F4 380000B7 */ li r0, 0xb7
/* 000020F8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000020FC 8001000C */ lwz r0, 0xc(r1)
/* 00002100 38210008 */ addi r1, r1, 8
/* 00002104 7C0803A6 */ mtlr r0
/* 00002108 4E800020 */ blr 
lbl_0000210C:
/* 0000210C 7C0802A6 */ mflr r0
/* 00002110 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002114 90010004 */ stw r0, 4(r1)
/* 00002118 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000211C 9421FFF8 */ stwu r1, -8(r1)
/* 00002120 A0030004 */ lhz r0, 4(r3)
/* 00002124 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002128 41820020 */ beq lbl_00002148
/* 0000212C 3860006B */ li r3, 0x6b
/* 00002130 4BFFE07D */ bl u_play_sound
/* 00002134 3860005A */ li r3, 0x5a
/* 00002138 48002129 */ bl lbl_00004260
/* 0000213C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002140 380000AE */ li r0, 0xae
/* 00002144 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00002148:
/* 00002148 8001000C */ lwz r0, 0xc(r1)
/* 0000214C 38210008 */ addi r1, r1, 8
/* 00002150 7C0803A6 */ mtlr r0
/* 00002154 4E800020 */ blr 
lbl_00002158:
/* 00002158 7C0802A6 */ mflr r0
/* 0000215C 3C600000 */ lis r3, lbl_10000000@ha
/* 00002160 90010004 */ stw r0, 4(r1)
/* 00002164 38630000 */ addi r3, r3, lbl_10000000@l
/* 00002168 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000216C 93E1000C */ stw r31, 0xc(r1)
/* 00002170 3BE3009C */ addi r31, r3, 0x9c
/* 00002174 4BFFE039 */ bl func_800AB414
/* 00002178 38600042 */ li r3, 0x42
/* 0000217C 38800000 */ li r4, 0
/* 00002180 4BFFE02D */ bl u_play_music
/* 00002184 480070D9 */ bl lbl_0000925C
/* 00002188 38000000 */ li r0, 0
/* 0000218C 901F0014 */ stw r0, 0x14(r31)
/* 00002190 3C600000 */ lis r3, modeCtrl@ha
/* 00002194 38E30000 */ addi r7, r3, modeCtrl@l
/* 00002198 901F0018 */ stw r0, 0x18(r31)
/* 0000219C 3CA00000 */ lis r5, lbl_0000266C@ha
/* 000021A0 38050000 */ addi r0, r5, lbl_0000266C@l
/* 000021A4 80C70008 */ lwz r6, 8(r7)
/* 000021A8 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 000021AC 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000021B0 54C507B8 */ rlwinm r5, r6, 0, 0x1e, 0x1c
/* 000021B4 90A70008 */ stw r5, 8(r7)
/* 000021B8 90040000 */ stw r0, lbl_802F1B7C@l(r4)
/* 000021BC 380000B9 */ li r0, 0xb9
/* 000021C0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000021C4 80010014 */ lwz r0, 0x14(r1)
/* 000021C8 83E1000C */ lwz r31, 0xc(r1)
/* 000021CC 38210010 */ addi r1, r1, 0x10
/* 000021D0 7C0803A6 */ mtlr r0
/* 000021D4 4E800020 */ blr 
lbl_000021D8:
/* 000021D8 7C0802A6 */ mflr r0
/* 000021DC 3C600000 */ lis r3, modeCtrl@ha
/* 000021E0 90010004 */ stw r0, 4(r1)
/* 000021E4 38830000 */ addi r4, r3, modeCtrl@l
/* 000021E8 3C600000 */ lis r3, lbl_10000000@ha
/* 000021EC 9421FFE8 */ stwu r1, -0x18(r1)
/* 000021F0 38630000 */ addi r3, r3, lbl_10000000@l
/* 000021F4 93E10014 */ stw r31, 0x14(r1)
/* 000021F8 3BE40008 */ addi r31, r4, 8
/* 000021FC 93C10010 */ stw r30, 0x10(r1)
/* 00002200 93A1000C */ stw r29, 0xc(r1)
/* 00002204 93810008 */ stw r28, 8(r1)
/* 00002208 3B83009C */ addi r28, r3, 0x9c
/* 0000220C 80040008 */ lwz r0, 8(r4)
/* 00002210 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00002214 40820104 */ bne lbl_00002318
/* 00002218 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 0000221C 80BC0014 */ lwz r5, 0x14(r28)
/* 00002220 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002224 A0830008 */ lhz r4, 8(r3)
/* 00002228 3BA50000 */ addi r29, r5, 0
/* 0000222C 548007FF */ clrlwi. r0, r4, 0x1f
/* 00002230 40820018 */ bne lbl_00002248
/* 00002234 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002238 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000223C A0030008 */ lhz r0, 8(r3)
/* 00002240 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002244 41820010 */ beq lbl_00002254
lbl_00002248:
/* 00002248 37BDFFFF */ addic. r29, r29, -1  ;# fixed addi
/* 0000224C 40800008 */ bge lbl_00002254
/* 00002250 3BA00002 */ li r29, 2
lbl_00002254:
/* 00002254 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00002258 40820018 */ bne lbl_00002270
/* 0000225C 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002260 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002264 A0030008 */ lhz r0, 8(r3)
/* 00002268 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000226C 41820014 */ beq lbl_00002280
lbl_00002270:
/* 00002270 3BBD0001 */ addi r29, r29, 1
/* 00002274 281D0003 */ cmplwi r29, 3
/* 00002278 41800008 */ blt lbl_00002280
/* 0000227C 3BA00000 */ li r29, 0
lbl_00002280:
/* 00002280 7C1D2800 */ cmpw r29, r5
/* 00002284 41820010 */ beq lbl_00002294
/* 00002288 3860006C */ li r3, 0x6c
/* 0000228C 4BFFDF21 */ bl u_play_sound
/* 00002290 93BC0014 */ stw r29, 0x14(r28)
lbl_00002294:
/* 00002294 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002298 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000229C A0630004 */ lhz r3, 4(r3)
/* 000022A0 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 000022A4 4182004C */ beq lbl_000022F0
/* 000022A8 3860006A */ li r3, 0x6a
/* 000022AC 4BFFDF01 */ bl u_play_sound
/* 000022B0 801C0014 */ lwz r0, 0x14(r28)
/* 000022B4 2C000000 */ cmpwi r0, 0
/* 000022B8 40820014 */ bne lbl_000022CC
/* 000022BC 3C600000 */ lis r3, modeCtrl@ha
/* 000022C0 3800001E */ li r0, 0x1e
/* 000022C4 90030000 */ stw r0, modeCtrl@l(r3)
/* 000022C8 48000010 */ b lbl_000022D8
lbl_000022CC:
/* 000022CC 3C600000 */ lis r3, modeCtrl@ha
/* 000022D0 3800001E */ li r0, 0x1e
/* 000022D4 90030000 */ stw r0, modeCtrl@l(r3)
lbl_000022D8:
/* 000022D8 3860005B */ li r3, 0x5b
/* 000022DC 48001F29 */ bl lbl_00004204
/* 000022E0 801F0000 */ lwz r0, 0(r31)
/* 000022E4 60000004 */ ori r0, r0, 4
/* 000022E8 901F0000 */ stw r0, 0(r31)
/* 000022EC 48000360 */ b lbl_0000264C
lbl_000022F0:
/* 000022F0 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 000022F4 41820358 */ beq lbl_0000264C
/* 000022F8 3860006B */ li r3, 0x6b
/* 000022FC 4BFFDEB1 */ bl u_play_sound
/* 00002300 3860005B */ li r3, 0x5b
/* 00002304 48001F5D */ bl lbl_00004260
/* 00002308 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000230C 380000AE */ li r0, 0xae
/* 00002310 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002314 48000338 */ b lbl_0000264C
lbl_00002318:
/* 00002318 801C0014 */ lwz r0, 0x14(r28)
/* 0000231C 2C000000 */ cmpwi r0, 0
/* 00002320 40820170 */ bne lbl_00002490
/* 00002324 80640000 */ lwz r3, 0(r4)
/* 00002328 2C030000 */ cmpwi r3, 0
/* 0000232C 40810064 */ ble lbl_00002390
/* 00002330 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00002334 90040000 */ stw r0, 0(r4)
/* 00002338 80040000 */ lwz r0, 0(r4)
/* 0000233C 2C000000 */ cmpwi r0, 0
/* 00002340 418102A4 */ bgt lbl_000025E4
/* 00002344 3800001E */ li r0, 0x1e
/* 00002348 901C001C */ stw r0, 0x1c(r28)
/* 0000234C 38000000 */ li r0, 0
/* 00002350 3C600000 */ lis r3, stageHeap@ha
/* 00002354 901C0018 */ stw r0, 0x18(r28)
/* 00002358 38630000 */ addi r3, r3, stageHeap@l
/* 0000235C 80630000 */ lwz r3, 0(r3)
/* 00002360 4BFFDE4D */ bl OSSetCurrentHeap
/* 00002364 3BA30000 */ addi r29, r3, 0
/* 00002368 38600003 */ li r3, 3
/* 0000236C 4BFFDE41 */ bl call_bitmap_load_group
/* 00002370 7FA3EB78 */ mr r3, r29
/* 00002374 4BFFDE39 */ bl OSSetCurrentHeap
/* 00002378 4BFFDE35 */ bl func_800885EC
/* 0000237C 38600000 */ li r3, 0
/* 00002380 4BFFDE2D */ bl func_800886E0
/* 00002384 4BFFDE29 */ bl func_800AB68C
/* 00002388 4BFFDE25 */ bl func_800AB5F8
/* 0000238C 48000258 */ b lbl_000025E4
lbl_00002390:
/* 00002390 4BFFDE1D */ bl func_80088AF4
/* 00002394 2C030000 */ cmpwi r3, 0
/* 00002398 418200E0 */ beq lbl_00002478
/* 0000239C 801C001C */ lwz r0, 0x1c(r28)
/* 000023A0 2C000000 */ cmpwi r0, 0
/* 000023A4 418100D4 */ bgt lbl_00002478
/* 000023A8 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000023AC 80BC0018 */ lwz r5, 0x18(r28)
/* 000023B0 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000023B4 A0830008 */ lhz r4, 8(r3)
/* 000023B8 3BA50000 */ addi r29, r5, 0
/* 000023BC 548007FF */ clrlwi. r0, r4, 0x1f
/* 000023C0 40820020 */ bne lbl_000023E0
/* 000023C4 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000023C8 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000023CC A0030008 */ lhz r0, 8(r3)
/* 000023D0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000023D4 4082000C */ bne lbl_000023E0
/* 000023D8 54800673 */ rlwinm. r0, r4, 0, 0x19, 0x19
/* 000023DC 41820010 */ beq lbl_000023EC
lbl_000023E0:
/* 000023E0 37BDFFFF */ addic. r29, r29, -1  ;# fixed addi
/* 000023E4 40800008 */ bge lbl_000023EC
/* 000023E8 3BA00000 */ li r29, 0
lbl_000023EC:
/* 000023EC 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 000023F0 40820020 */ bne lbl_00002410
/* 000023F4 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000023F8 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000023FC A0030008 */ lhz r0, 8(r3)
/* 00002400 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002404 4082000C */ bne lbl_00002410
/* 00002408 548006B5 */ rlwinm. r0, r4, 0, 0x1a, 0x1a
/* 0000240C 41820014 */ beq lbl_00002420
lbl_00002410:
/* 00002410 3BBD0001 */ addi r29, r29, 1
/* 00002414 2C1D0003 */ cmpwi r29, 3
/* 00002418 41800008 */ blt lbl_00002420
/* 0000241C 3BA00002 */ li r29, 2
lbl_00002420:
/* 00002420 7C1D2800 */ cmpw r29, r5
/* 00002424 41820054 */ beq lbl_00002478
/* 00002428 38600065 */ li r3, 0x65
/* 0000242C 4BFFDD81 */ bl destroy_sprite_with_tag
/* 00002430 38600000 */ li r3, 0
/* 00002434 4BFFDD79 */ bl func_8008897C
/* 00002438 7FA3EB78 */ mr r3, r29
/* 0000243C 4BFFDD71 */ bl func_800886E0
/* 00002440 2C1D0001 */ cmpwi r29, 1
/* 00002444 41820020 */ beq lbl_00002464
/* 00002448 40800008 */ bge lbl_00002450
/* 0000244C 48000010 */ b lbl_0000245C
lbl_00002450:
/* 00002450 2C1D0003 */ cmpwi r29, 3
/* 00002454 40800008 */ bge lbl_0000245C
/* 00002458 48000018 */ b lbl_00002470
lbl_0000245C:
/* 0000245C 4BFFDD51 */ bl func_800AB5F8
/* 00002460 48000014 */ b lbl_00002474
lbl_00002464:
/* 00002464 4BFFDD49 */ bl func_800AB5F8
/* 00002468 4BFFDD45 */ bl func_800AB564
/* 0000246C 48000008 */ b lbl_00002474
lbl_00002470:
/* 00002470 4BFFDD3D */ bl func_800AB564
lbl_00002474:
/* 00002474 93BC0018 */ stw r29, 0x18(r28)
lbl_00002478:
/* 00002478 807C001C */ lwz r3, 0x1c(r28)
/* 0000247C 2C030000 */ cmpwi r3, 0
/* 00002480 40810164 */ ble lbl_000025E4
/* 00002484 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00002488 901C001C */ stw r0, 0x1c(r28)
/* 0000248C 48000158 */ b lbl_000025E4
lbl_00002490:
/* 00002490 80640000 */ lwz r3, 0(r4)
/* 00002494 2C030000 */ cmpwi r3, 0
/* 00002498 40810070 */ ble lbl_00002508
/* 0000249C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000024A0 90040000 */ stw r0, 0(r4)
/* 000024A4 80040000 */ lwz r0, 0(r4)
/* 000024A8 2C000000 */ cmpwi r0, 0
/* 000024AC 41810138 */ bgt lbl_000025E4
/* 000024B0 80BC0014 */ lwz r5, 0x14(r28)
/* 000024B4 38000000 */ li r0, 0
/* 000024B8 3C600000 */ lis r3, stageHeap@ha
/* 000024BC 901C0018 */ stw r0, 0x18(r28)
/* 000024C0 38630000 */ addi r3, r3, stageHeap@l
/* 000024C4 3C800000 */ lis r4, lbl_0000C850@ha
/* 000024C8 54A51838 */ slwi r5, r5, 3
/* 000024CC 80630000 */ lwz r3, 0(r3)
/* 000024D0 38040000 */ addi r0, r4, lbl_0000C850@l
/* 000024D4 7FA02A14 */ add r29, r0, r5
/* 000024D8 4BFFDCD5 */ bl OSSetCurrentHeap
/* 000024DC 80BD0000 */ lwz r5, 0(r29)
/* 000024E0 3BA30000 */ addi r29, r3, 0
/* 000024E4 801C0018 */ lwz r0, 0x18(r28)
/* 000024E8 38800000 */ li r4, 0
/* 000024EC 7C6500AE */ lbzx r3, r5, r0
/* 000024F0 7C630774 */ extsb r3, r3
/* 000024F4 4BFFDCB9 */ bl func_800AB2A0
/* 000024F8 7FA3EB78 */ mr r3, r29
/* 000024FC 4BFFDCB1 */ bl OSSetCurrentHeap
/* 00002500 4BFFDCAD */ bl func_800AB5F8
/* 00002504 480000E0 */ b lbl_000025E4
lbl_00002508:
/* 00002508 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 0000250C 80DC0018 */ lwz r6, 0x18(r28)
/* 00002510 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002514 A0A30008 */ lhz r5, 8(r3)
/* 00002518 54041838 */ slwi r4, r0, 3
/* 0000251C 3C600000 */ lis r3, lbl_0000C850@ha
/* 00002520 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00002524 38030000 */ addi r0, r3, lbl_0000C850@l
/* 00002528 3BC60000 */ addi r30, r6, 0
/* 0000252C 7FA02214 */ add r29, r0, r4
/* 00002530 40820020 */ bne lbl_00002550
/* 00002534 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002538 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000253C A0030008 */ lhz r0, 8(r3)
/* 00002540 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002544 4082000C */ bne lbl_00002550
/* 00002548 54A00673 */ rlwinm. r0, r5, 0, 0x19, 0x19
/* 0000254C 41820010 */ beq lbl_0000255C
lbl_00002550:
/* 00002550 37DEFFFF */ addic. r30, r30, -1  ;# fixed addi
/* 00002554 40800008 */ bge lbl_0000255C
/* 00002558 3BC00000 */ li r30, 0
lbl_0000255C:
/* 0000255C 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00002560 40820020 */ bne lbl_00002580
/* 00002564 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002568 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000256C A0030008 */ lhz r0, 8(r3)
/* 00002570 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002574 4082000C */ bne lbl_00002580
/* 00002578 54A006B5 */ rlwinm. r0, r5, 0, 0x1a, 0x1a
/* 0000257C 4182001C */ beq lbl_00002598
lbl_00002580:
/* 00002580 887D0004 */ lbz r3, 4(r29)
/* 00002584 3BDE0001 */ addi r30, r30, 1
/* 00002588 7C630774 */ extsb r3, r3
/* 0000258C 7C1E1800 */ cmpw r30, r3
/* 00002590 41800008 */ blt lbl_00002598
/* 00002594 3BC3FFFF */ addi r30, r3, -1  ;# fixed addi
lbl_00002598:
/* 00002598 7C1E3000 */ cmpw r30, r6
/* 0000259C 41820048 */ beq lbl_000025E4
/* 000025A0 807D0000 */ lwz r3, 0(r29)
/* 000025A4 38800000 */ li r4, 0
/* 000025A8 7C63F0AE */ lbzx r3, r3, r30
/* 000025AC 7C630774 */ extsb r3, r3
/* 000025B0 4BFFDBFD */ bl func_800AB358
/* 000025B4 2C1E0000 */ cmpwi r30, 0
/* 000025B8 41820008 */ beq lbl_000025C0
/* 000025BC 4BFFDBF1 */ bl func_800AB564
lbl_000025C0:
/* 000025C0 881D0004 */ lbz r0, 4(r29)
/* 000025C4 7C030774 */ extsb r3, r0
/* 000025C8 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000025CC 7C1E0000 */ cmpw r30, r0
/* 000025D0 40800008 */ bge lbl_000025D8
/* 000025D4 4BFFDBD9 */ bl func_800AB5F8
lbl_000025D8:
/* 000025D8 38600065 */ li r3, 0x65
/* 000025DC 4BFFDBD1 */ bl u_play_sound
/* 000025E0 93DC0018 */ stw r30, 0x18(r28)
lbl_000025E4:
/* 000025E4 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000025E8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000025EC A0030004 */ lhz r0, 4(r3)
/* 000025F0 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000025F4 41820058 */ beq lbl_0000264C
/* 000025F8 801C0014 */ lwz r0, 0x14(r28)
/* 000025FC 2C000000 */ cmpwi r0, 0
/* 00002600 40820020 */ bne lbl_00002620
/* 00002604 38600001 */ li r3, 1
/* 00002608 4BFFDBA5 */ bl func_8008897C
/* 0000260C 38600065 */ li r3, 0x65
/* 00002610 4BFFDB9D */ bl destroy_sprite_with_tag
/* 00002614 38600003 */ li r3, 3
/* 00002618 4BFFDB95 */ bl call_bitmap_free_group
/* 0000261C 48000018 */ b lbl_00002634
lbl_00002620:
/* 00002620 3C600000 */ lis r3, modeCtrl@ha
/* 00002624 80030000 */ lwz r0, modeCtrl@l(r3)
/* 00002628 2C000000 */ cmpwi r0, 0
/* 0000262C 41810008 */ bgt lbl_00002634
/* 00002630 4BFFDB7D */ bl func_800AB444
lbl_00002634:
/* 00002634 48006C29 */ bl lbl_0000925C
/* 00002638 3860006B */ li r3, 0x6b
/* 0000263C 4BFFDB71 */ bl u_play_sound
/* 00002640 801F0000 */ lwz r0, 0(r31)
/* 00002644 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00002648 901F0000 */ stw r0, 0(r31)
lbl_0000264C:
/* 0000264C 8001001C */ lwz r0, 0x1c(r1)
/* 00002650 83E10014 */ lwz r31, 0x14(r1)
/* 00002654 83C10010 */ lwz r30, 0x10(r1)
/* 00002658 7C0803A6 */ mtlr r0
/* 0000265C 83A1000C */ lwz r29, 0xc(r1)
/* 00002660 83810008 */ lwz r28, 8(r1)
/* 00002664 38210018 */ addi r1, r1, 0x18
/* 00002668 4E800020 */ blr 
lbl_0000266C:
/* 0000266C 7C0802A6 */ mflr r0
/* 00002670 3C600000 */ lis r3, modeCtrl@ha
/* 00002674 90010004 */ stw r0, 4(r1)
/* 00002678 38630000 */ addi r3, r3, modeCtrl@l
/* 0000267C 9421FFF8 */ stwu r1, -8(r1)
/* 00002680 80030008 */ lwz r0, 8(r3)
/* 00002684 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00002688 41820008 */ beq lbl_00002690
/* 0000268C 4BFFDB21 */ bl func_800AB444
lbl_00002690:
/* 00002690 8001000C */ lwz r0, 0xc(r1)
/* 00002694 38210008 */ addi r1, r1, 8
/* 00002698 7C0803A6 */ mtlr r0
/* 0000269C 4E800020 */ blr 
lbl_000026A0:
/* 000026A0 7C0802A6 */ mflr r0
/* 000026A4 3C600000 */ lis r3, lbl_10000000@ha
/* 000026A8 90010004 */ stw r0, 4(r1)
/* 000026AC 38A30000 */ addi r5, r3, lbl_10000000@l
/* 000026B0 38800000 */ li r4, 0
/* 000026B4 9421FFF8 */ stwu r1, -8(r1)
/* 000026B8 3800FFFF */ li r0, -1
/* 000026BC 3865629C */ addi r3, r5, 0x629c
/* 000026C0 90850070 */ stw r4, 0x70(r5)
/* 000026C4 9085006C */ stw r4, 0x6c(r5)
/* 000026C8 980562B0 */ stb r0, 0x62b0(r5)
/* 000026CC B085001C */ sth r4, 0x1c(r5)
/* 000026D0 80850070 */ lwz r4, 0x70(r5)
/* 000026D4 4BFFDAD9 */ bl func_8009F4B8
/* 000026D8 38600006 */ li r3, 6
/* 000026DC 4BFFDAD1 */ bl func_8009F49C
/* 000026E0 38600000 */ li r3, 0
/* 000026E4 4BFFDAC9 */ bl event_start
/* 000026E8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000026EC 380000BD */ li r0, 0xbd
/* 000026F0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000026F4 8001000C */ lwz r0, 0xc(r1)
/* 000026F8 38210008 */ addi r1, r1, 8
/* 000026FC 7C0803A6 */ mtlr r0
/* 00002700 4E800020 */ blr 
lbl_00002704:
/* 00002704 7C0802A6 */ mflr r0
/* 00002708 3C600000 */ lis r3, lbl_10000000@ha
/* 0000270C 90010004 */ stw r0, 4(r1)
/* 00002710 9421FFE0 */ stwu r1, -0x20(r1)
/* 00002714 BF61000C */ stmw r27, 0xc(r1)
/* 00002718 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 0000271C 3BDF005C */ addi r30, r31, 0x5c
/* 00002720 807F0078 */ lwz r3, 0x78(r31)
/* 00002724 2C030000 */ cmpwi r3, 0
/* 00002728 4081000C */ ble lbl_00002734
/* 0000272C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00002730 901E001C */ stw r0, 0x1c(r30)
lbl_00002734:
/* 00002734 3C600000 */ lis r3, eventInfo@ha
/* 00002738 88030000 */ lbz r0, eventInfo@l(r3)
/* 0000273C 2C000002 */ cmpwi r0, 2
/* 00002740 41820520 */ beq lbl_00002C60
/* 00002744 801E0010 */ lwz r0, 0x10(r30)
/* 00002748 28000006 */ cmplwi r0, 6
/* 0000274C 41810514 */ bgt lbl_00002C60
/* 00002750 3C600000 */ lis r3, lbl_0000C868@ha
/* 00002754 38630000 */ addi r3, r3, lbl_0000C868@l
/* 00002758 5400103A */ slwi r0, r0, 2
/* 0000275C 7C03002E */ lwzx r0, r3, r0
/* 00002760 7C0903A6 */ mtctr r0
/* 00002764 4E800420 */ bctr 
lbl_00002768:
/* 00002768 4BFFDA45 */ bl sub_8009F554
/* 0000276C 2C030000 */ cmpwi r3, 0
/* 00002770 40820028 */ bne lbl_00002798
/* 00002774 4BFFDA39 */ bl memcard_cancel_and_unmount
/* 00002778 3860006B */ li r3, 0x6b
/* 0000277C 4BFFDA31 */ bl u_play_sound
/* 00002780 38600059 */ li r3, 0x59
/* 00002784 48001ADD */ bl lbl_00004260
/* 00002788 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000278C 380000AE */ li r0, 0xae
/* 00002790 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002794 480004CC */ b lbl_00002C60
lbl_00002798:
/* 00002798 38000001 */ li r0, 1
/* 0000279C 901E0010 */ stw r0, 0x10(r30)
/* 000027A0 801E0014 */ lwz r0, 0x14(r30)
/* 000027A4 7C000734 */ extsh r0, r0
/* 000027A8 B01F001C */ sth r0, 0x1c(r31)
/* 000027AC 48004325 */ bl lbl_00006AD0
/* 000027B0 480004B0 */ b lbl_00002C60
lbl_000027B4:
/* 000027B4 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000027B8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000027BC A0030004 */ lhz r0, 4(r3)
/* 000027C0 3BA30004 */ addi r29, r3, 4
/* 000027C4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000027C8 41820028 */ beq lbl_000027F0
/* 000027CC 4BFFD9E1 */ bl memcard_cancel_and_unmount
/* 000027D0 3860006B */ li r3, 0x6b
/* 000027D4 4BFFD9D9 */ bl u_play_sound
/* 000027D8 38600059 */ li r3, 0x59
/* 000027DC 48001A85 */ bl lbl_00004260
/* 000027E0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000027E4 380000AE */ li r0, 0xae
/* 000027E8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000027EC 48000474 */ b lbl_00002C60
lbl_000027F0:
/* 000027F0 A0830008 */ lhz r4, 8(r3)
/* 000027F4 80BE0014 */ lwz r5, 0x14(r30)
/* 000027F8 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 000027FC 7CA60774 */ extsb r6, r5
/* 00002800 40820018 */ bne lbl_00002818
/* 00002804 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002808 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000280C A0630008 */ lhz r3, 8(r3)
/* 00002810 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00002814 4182003C */ beq lbl_00002850
lbl_00002818:
/* 00002818 1C060018 */ mulli r0, r6, 0x18
/* 0000281C 7C7F0214 */ add r3, r31, r0
/* 00002820 3863629C */ addi r3, r3, 0x629c
lbl_00002824:
/* 00002824 38C6FFFF */ addi r6, r6, -1  ;# fixed addi
/* 00002828 7CC00775 */ extsb. r0, r6
/* 0000282C 3863FFE8 */ addi r3, r3, -24  ;# fixed addi
/* 00002830 4080000C */ bge lbl_0000283C
/* 00002834 7CA60774 */ extsb r6, r5
/* 00002838 48000070 */ b lbl_000028A8
lbl_0000283C:
/* 0000283C 88030014 */ lbz r0, 0x14(r3)
/* 00002840 7C000774 */ extsb r0, r0
/* 00002844 2C00FFFE */ cmpwi r0, -2
/* 00002848 4182FFDC */ beq lbl_00002824
/* 0000284C 4800005C */ b lbl_000028A8
lbl_00002850:
/* 00002850 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00002854 4082000C */ bne lbl_00002860
/* 00002858 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000285C 4182004C */ beq lbl_000028A8
lbl_00002860:
/* 00002860 1C060018 */ mulli r0, r6, 0x18
/* 00002864 7C9F0214 */ add r4, r31, r0
/* 00002868 3884629C */ addi r4, r4, 0x629c
lbl_0000286C:
/* 0000286C 38C60001 */ addi r6, r6, 1
/* 00002870 7CC00774 */ extsb r0, r6
/* 00002874 1C000018 */ mulli r0, r0, 0x18
/* 00002878 7C7F0214 */ add r3, r31, r0
/* 0000287C 880362B0 */ lbz r0, 0x62b0(r3)
/* 00002880 38840018 */ addi r4, r4, 0x18
/* 00002884 7C000774 */ extsb r0, r0
/* 00002888 2C00FFFF */ cmpwi r0, -1
/* 0000288C 4082000C */ bne lbl_00002898
/* 00002890 7CA60774 */ extsb r6, r5
/* 00002894 48000014 */ b lbl_000028A8
lbl_00002898:
/* 00002898 88040014 */ lbz r0, 0x14(r4)
/* 0000289C 7C000774 */ extsb r0, r0
/* 000028A0 2C00FFFE */ cmpwi r0, -2
/* 000028A4 4182FFC8 */ beq lbl_0000286C
lbl_000028A8:
/* 000028A8 7CDC0774 */ extsb r28, r6
/* 000028AC 7C1C2800 */ cmpw r28, r5
/* 000028B0 41820010 */ beq lbl_000028C0
/* 000028B4 3860006C */ li r3, 0x6c
/* 000028B8 4BFFD8F5 */ bl u_play_sound
/* 000028BC 939E0014 */ stw r28, 0x14(r30)
lbl_000028C0:
/* 000028C0 A01D0000 */ lhz r0, 0(r29)
/* 000028C4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000028C8 41820398 */ beq lbl_00002C60
/* 000028CC 3860006A */ li r3, 0x6a
/* 000028D0 4BFFD8DD */ bl u_play_sound
/* 000028D4 38000002 */ li r0, 2
/* 000028D8 901E0010 */ stw r0, 0x10(r30)
/* 000028DC 38000000 */ li r0, 0
/* 000028E0 901E0018 */ stw r0, 0x18(r30)
/* 000028E4 4800037C */ b lbl_00002C60
lbl_000028E8:
/* 000028E8 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000028EC 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000028F0 A0030004 */ lhz r0, 4(r3)
/* 000028F4 3BA30004 */ addi r29, r3, 4
/* 000028F8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000028FC 41820018 */ beq lbl_00002914
/* 00002900 3860006B */ li r3, 0x6b
/* 00002904 4BFFD8A9 */ bl u_play_sound
/* 00002908 38000001 */ li r0, 1
/* 0000290C 901E0010 */ stw r0, 0x10(r30)
/* 00002910 48000350 */ b lbl_00002C60
lbl_00002914:
/* 00002914 A0830008 */ lhz r4, 8(r3)
/* 00002918 80BE0018 */ lwz r5, 0x18(r30)
/* 0000291C 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00002920 3B850000 */ addi r28, r5, 0
/* 00002924 40820018 */ bne lbl_0000293C
/* 00002928 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 0000292C 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002930 A0030008 */ lhz r0, 8(r3)
/* 00002934 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00002938 41820008 */ beq lbl_00002940
lbl_0000293C:
/* 0000293C 3B800000 */ li r28, 0
lbl_00002940:
/* 00002940 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00002944 40820018 */ bne lbl_0000295C
/* 00002948 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 0000294C 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002950 A0030008 */ lhz r0, 8(r3)
/* 00002954 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00002958 41820008 */ beq lbl_00002960
lbl_0000295C:
/* 0000295C 3B800001 */ li r28, 1
lbl_00002960:
/* 00002960 801E0014 */ lwz r0, 0x14(r30)
/* 00002964 1C000018 */ mulli r0, r0, 0x18
/* 00002968 7C7F0214 */ add r3, r31, r0
/* 0000296C A003629E */ lhz r0, 0x629e(r3)
/* 00002970 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002974 41820008 */ beq lbl_0000297C
/* 00002978 3B800001 */ li r28, 1
lbl_0000297C:
/* 0000297C 7C1C2800 */ cmpw r28, r5
/* 00002980 41820010 */ beq lbl_00002990
/* 00002984 3860006C */ li r3, 0x6c
/* 00002988 4BFFD825 */ bl u_play_sound
/* 0000298C 939E0018 */ stw r28, 0x18(r30)
lbl_00002990:
/* 00002990 A01D0000 */ lhz r0, 0(r29)
/* 00002994 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002998 418202C8 */ beq lbl_00002C60
/* 0000299C 3860006A */ li r3, 0x6a
/* 000029A0 4BFFD80D */ bl u_play_sound
/* 000029A4 801E0018 */ lwz r0, 0x18(r30)
/* 000029A8 2C000000 */ cmpwi r0, 0
/* 000029AC 4082002C */ bne lbl_000029D8
/* 000029B0 38600004 */ li r3, 4
/* 000029B4 4BFFD7F9 */ bl func_8009F49C
/* 000029B8 387F629C */ addi r3, r31, 0x629c
/* 000029BC 809E0014 */ lwz r4, 0x14(r30)
/* 000029C0 4BFFD7ED */ bl func_8009F4B8
/* 000029C4 38600000 */ li r3, 0
/* 000029C8 4BFFD7E5 */ bl event_start
/* 000029CC 38000003 */ li r0, 3
/* 000029D0 901E0010 */ stw r0, 0x10(r30)
/* 000029D4 4800028C */ b lbl_00002C60
lbl_000029D8:
/* 000029D8 38000001 */ li r0, 1
/* 000029DC 901F0004 */ stw r0, 4(r31)
/* 000029E0 38000005 */ li r0, 5
/* 000029E4 901E0010 */ stw r0, 0x10(r30)
/* 000029E8 48000278 */ b lbl_00002C60
lbl_000029EC:
/* 000029EC 4BFFD7C1 */ bl sub_8009F554
/* 000029F0 2C030000 */ cmpwi r3, 0
/* 000029F4 40820028 */ bne lbl_00002A1C
/* 000029F8 4BFFD7B5 */ bl memcard_cancel_and_unmount
/* 000029FC 3860006B */ li r3, 0x6b
/* 00002A00 4BFFD7AD */ bl u_play_sound
/* 00002A04 38600059 */ li r3, 0x59
/* 00002A08 48001859 */ bl lbl_00004260
/* 00002A0C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002A10 380000AE */ li r0, 0xae
/* 00002A14 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002A18 48000248 */ b lbl_00002C60
lbl_00002A1C:
/* 00002A1C 3860001E */ li r3, 0x1e
/* 00002A20 38800002 */ li r4, 2
/* 00002A24 4BFFD789 */ bl u_play_music
/* 00002A28 38600101 */ li r3, 0x101
/* 00002A2C 38800000 */ li r4, 0
/* 00002A30 38A0001E */ li r5, 0x1e
/* 00002A34 4BFFD779 */ bl start_screen_fade
/* 00002A38 3800001E */ li r0, 0x1e
/* 00002A3C 901E001C */ stw r0, 0x1c(r30)
/* 00002A40 38000004 */ li r0, 4
/* 00002A44 901E0010 */ stw r0, 0x10(r30)
/* 00002A48 48000218 */ b lbl_00002C60
lbl_00002A4C:
/* 00002A4C 801E001C */ lwz r0, 0x1c(r30)
/* 00002A50 2C000000 */ cmpwi r0, 0
/* 00002A54 4181020C */ bgt lbl_00002C60
/* 00002A58 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002A5C 380000C0 */ li r0, 0xc0
/* 00002A60 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002A64 480001FC */ b lbl_00002C60
lbl_00002A68:
/* 00002A68 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002A6C 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002A70 A0030004 */ lhz r0, 4(r3)
/* 00002A74 3BA30004 */ addi r29, r3, 4
/* 00002A78 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002A7C 41820018 */ beq lbl_00002A94
/* 00002A80 3860006B */ li r3, 0x6b
/* 00002A84 4BFFD729 */ bl u_play_sound
/* 00002A88 38000002 */ li r0, 2
/* 00002A8C 901E0010 */ stw r0, 0x10(r30)
/* 00002A90 480001D0 */ b lbl_00002C60
lbl_00002A94:
/* 00002A94 A0830008 */ lhz r4, 8(r3)
/* 00002A98 3B9F0004 */ addi r28, r31, 4
/* 00002A9C 80BF0004 */ lwz r5, 4(r31)
/* 00002AA0 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00002AA4 3B650000 */ addi r27, r5, 0
/* 00002AA8 40820018 */ bne lbl_00002AC0
/* 00002AAC 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002AB0 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002AB4 A0030008 */ lhz r0, 8(r3)
/* 00002AB8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00002ABC 41820008 */ beq lbl_00002AC4
lbl_00002AC0:
/* 00002AC0 3B600000 */ li r27, 0
lbl_00002AC4:
/* 00002AC4 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00002AC8 40820018 */ bne lbl_00002AE0
/* 00002ACC 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002AD0 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002AD4 A0030008 */ lhz r0, 8(r3)
/* 00002AD8 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00002ADC 41820008 */ beq lbl_00002AE4
lbl_00002AE0:
/* 00002AE0 3B600001 */ li r27, 1
lbl_00002AE4:
/* 00002AE4 7C1B2800 */ cmpw r27, r5
/* 00002AE8 41820010 */ beq lbl_00002AF8
/* 00002AEC 3860006C */ li r3, 0x6c
/* 00002AF0 4BFFD6BD */ bl u_play_sound
/* 00002AF4 937C0000 */ stw r27, 0(r28)
lbl_00002AF8:
/* 00002AF8 A01D0000 */ lhz r0, 0(r29)
/* 00002AFC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002B00 41820160 */ beq lbl_00002C60
/* 00002B04 801C0000 */ lwz r0, 0(r28)
/* 00002B08 2C000001 */ cmpwi r0, 1
/* 00002B0C 40820018 */ bne lbl_00002B24
/* 00002B10 3860006B */ li r3, 0x6b
/* 00002B14 4BFFD699 */ bl u_play_sound
/* 00002B18 38000002 */ li r0, 2
/* 00002B1C 901E0010 */ stw r0, 0x10(r30)
/* 00002B20 48000140 */ b lbl_00002C60
lbl_00002B24:
/* 00002B24 3860006A */ li r3, 0x6a
/* 00002B28 4BFFD685 */ bl u_play_sound
/* 00002B2C 38600007 */ li r3, 7
/* 00002B30 4BFFD67D */ bl func_8009F49C
/* 00002B34 387F629C */ addi r3, r31, 0x629c
/* 00002B38 809E0014 */ lwz r4, 0x14(r30)
/* 00002B3C 4BFFD671 */ bl func_8009F4B8
/* 00002B40 38600000 */ li r3, 0
/* 00002B44 4BFFD669 */ bl event_start
/* 00002B48 38000006 */ li r0, 6
/* 00002B4C 901E0010 */ stw r0, 0x10(r30)
/* 00002B50 48000110 */ b lbl_00002C60
lbl_00002B54:
/* 00002B54 4BFFD659 */ bl sub_8009F554
/* 00002B58 2C030000 */ cmpwi r3, 0
/* 00002B5C 40820028 */ bne lbl_00002B84
/* 00002B60 4BFFD64D */ bl memcard_cancel_and_unmount
/* 00002B64 3860006B */ li r3, 0x6b
/* 00002B68 4BFFD645 */ bl u_play_sound
/* 00002B6C 38600059 */ li r3, 0x59
/* 00002B70 480016F1 */ bl lbl_00004260
/* 00002B74 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002B78 380000AE */ li r0, 0xae
/* 00002B7C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002B80 480000E0 */ b lbl_00002C60
lbl_00002B84:
/* 00002B84 807E0014 */ lwz r3, 0x14(r30)
/* 00002B88 3880FFFE */ li r4, -2
/* 00002B8C 38000020 */ li r0, 0x20
/* 00002B90 7C660774 */ extsb r6, r3
/* 00002B94 1C660018 */ mulli r3, r6, 0x18
/* 00002B98 7C7F1A14 */ add r3, r31, r3
/* 00002B9C 988362B0 */ stb r4, 0x62b0(r3)
/* 00002BA0 389F001C */ addi r4, r31, 0x1c
/* 00002BA4 98DF003A */ stb r6, 0x3a(r31)
/* 00002BA8 981F003B */ stb r0, 0x3b(r31)
lbl_00002BAC:
/* 00002BAC A8640000 */ lha r3, 0(r4)
/* 00002BB0 7CC00774 */ extsb r0, r6
/* 00002BB4 7C001800 */ cmpw r0, r3
/* 00002BB8 4082000C */ bne lbl_00002BC4
/* 00002BBC 38030001 */ addi r0, r3, 1
/* 00002BC0 B0040000 */ sth r0, 0(r4)
lbl_00002BC4:
/* 00002BC4 38C60001 */ addi r6, r6, 1
/* 00002BC8 7CC00774 */ extsb r0, r6
/* 00002BCC 1C000018 */ mulli r0, r0, 0x18
/* 00002BD0 7C7F0214 */ add r3, r31, r0
/* 00002BD4 880362B0 */ lbz r0, 0x62b0(r3)
/* 00002BD8 7C000774 */ extsb r0, r0
/* 00002BDC 2C00FFFF */ cmpwi r0, -1
/* 00002BE0 4082004C */ bne lbl_00002C2C
/* 00002BE4 3863629C */ addi r3, r3, 0x629c
lbl_00002BE8:
/* 00002BE8 38C6FFFF */ addi r6, r6, -1  ;# fixed addi
/* 00002BEC 7CC00775 */ extsb. r0, r6
/* 00002BF0 3863FFE8 */ addi r3, r3, -24  ;# fixed addi
/* 00002BF4 40800028 */ bge lbl_00002C1C
/* 00002BF8 4BFFD5B5 */ bl memcard_cancel_and_unmount
/* 00002BFC 3860006B */ li r3, 0x6b
/* 00002C00 4BFFD5AD */ bl u_play_sound
/* 00002C04 38600059 */ li r3, 0x59
/* 00002C08 48001659 */ bl lbl_00004260
/* 00002C0C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002C10 380000AE */ li r0, 0xae
/* 00002C14 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002C18 48000048 */ b lbl_00002C60
lbl_00002C1C:
/* 00002C1C 88030014 */ lbz r0, 0x14(r3)
/* 00002C20 7C000774 */ extsb r0, r0
/* 00002C24 2C00FFFE */ cmpwi r0, -2
/* 00002C28 4182FFC0 */ beq lbl_00002BE8
lbl_00002C2C:
/* 00002C2C 7CC50774 */ extsb r5, r6
/* 00002C30 1C050018 */ mulli r0, r5, 0x18
/* 00002C34 7C7F0214 */ add r3, r31, r0
/* 00002C38 880362B0 */ lbz r0, 0x62b0(r3)
/* 00002C3C 7C000774 */ extsb r0, r0
/* 00002C40 2C00FFFE */ cmpwi r0, -2
/* 00002C44 4182FF68 */ beq lbl_00002BAC
/* 00002C48 801E0014 */ lwz r0, 0x14(r30)
/* 00002C4C 7C050000 */ cmpw r5, r0
/* 00002C50 41820008 */ beq lbl_00002C58
/* 00002C54 90BE0014 */ stw r5, 0x14(r30)
lbl_00002C58:
/* 00002C58 38000001 */ li r0, 1
/* 00002C5C 901E0010 */ stw r0, 0x10(r30)
lbl_00002C60:
/* 00002C60 BB61000C */ lmw r27, 0xc(r1)
/* 00002C64 80010024 */ lwz r0, 0x24(r1)
/* 00002C68 38210020 */ addi r1, r1, 0x20
/* 00002C6C 7C0803A6 */ mtlr r0
/* 00002C70 4E800020 */ blr 
lbl_00002C74:
/* 00002C74 7C0802A6 */ mflr r0
/* 00002C78 38600003 */ li r3, 3
/* 00002C7C 90010004 */ stw r0, 4(r1)
/* 00002C80 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002C84 93E1000C */ stw r31, 0xc(r1)
/* 00002C88 4BFFD525 */ bl func_8009F49C
/* 00002C8C 38600000 */ li r3, 0
/* 00002C90 4BFFD51D */ bl event_start
/* 00002C94 3C600000 */ lis r3, modeCtrl@ha
/* 00002C98 3BE30000 */ addi r31, r3, modeCtrl@l
/* 00002C9C 38000064 */ li r0, 0x64
/* 00002CA0 901F0000 */ stw r0, 0(r31)
/* 00002CA4 38600101 */ li r3, 0x101
/* 00002CA8 38800000 */ li r4, 0
/* 00002CAC 80BF0000 */ lwz r5, 0(r31)
/* 00002CB0 4BFFD4FD */ bl start_screen_fade
/* 00002CB4 807F0000 */ lwz r3, 0(r31)
/* 00002CB8 38800002 */ li r4, 2
/* 00002CBC 4BFFD4F1 */ bl u_play_music
/* 00002CC0 801F0008 */ lwz r0, 8(r31)
/* 00002CC4 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002CC8 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00002CCC 901F0008 */ stw r0, 8(r31)
/* 00002CD0 380000BB */ li r0, 0xbb
/* 00002CD4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002CD8 80010014 */ lwz r0, 0x14(r1)
/* 00002CDC 83E1000C */ lwz r31, 0xc(r1)
/* 00002CE0 38210010 */ addi r1, r1, 0x10
/* 00002CE4 7C0803A6 */ mtlr r0
/* 00002CE8 4E800020 */ blr 
lbl_00002CEC:
/* 00002CEC 3C600000 */ lis r3, modeCtrl@ha
/* 00002CF0 38830000 */ addi r4, r3, modeCtrl@l
/* 00002CF4 80640000 */ lwz r3, 0(r4)
/* 00002CF8 2C030000 */ cmpwi r3, 0
/* 00002CFC 4081000C */ ble lbl_00002D08
/* 00002D00 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00002D04 90040000 */ stw r0, 0(r4)
lbl_00002D08:
/* 00002D08 3C600000 */ lis r3, modeCtrl@ha
/* 00002D0C 38C30000 */ addi r6, r3, modeCtrl@l
/* 00002D10 80860008 */ lwz r4, 8(r6)
/* 00002D14 38A60008 */ addi r5, r6, 8
/* 00002D18 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00002D1C 40820020 */ bne lbl_00002D3C
/* 00002D20 3C600000 */ lis r3, eventInfo@ha
/* 00002D24 88030000 */ lbz r0, eventInfo@l(r3)
/* 00002D28 2C000002 */ cmpwi r0, 2
/* 00002D2C 4D820020 */ beqlr 
/* 00002D30 60800004 */ ori r0, r4, 4
/* 00002D34 90050000 */ stw r0, 0(r5)
/* 00002D38 4E800020 */ blr 
lbl_00002D3C:
/* 00002D3C 80060000 */ lwz r0, 0(r6)
/* 00002D40 2C000000 */ cmpwi r0, 0
/* 00002D44 4D810020 */ bgtlr 
/* 00002D48 38A00000 */ li r5, 0
/* 00002D4C 90A60000 */ stw r5, 0(r6)
/* 00002D50 38000003 */ li r0, 3
/* 00002D54 3C800000 */ lis r4, gameModeRequest@ha
/* 00002D58 90060020 */ stw r0, 0x20(r6)
/* 00002D5C 38000001 */ li r0, 1
/* 00002D60 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002D64 90060010 */ stw r0, 0x10(r6)
/* 00002D68 38000015 */ li r0, 0x15
/* 00002D6C B0A40000 */ sth r5, gameModeRequest@l(r4)
/* 00002D70 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002D74 4E800020 */ blr 
lbl_00002D78:
/* 00002D78 7C0802A6 */ mflr r0
/* 00002D7C 90010004 */ stw r0, 4(r1)
/* 00002D80 9421FFF8 */ stwu r1, -8(r1)
/* 00002D84 48005CB1 */ bl lbl_00008A34
/* 00002D88 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002D8C 380000BF */ li r0, 0xbf
/* 00002D90 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002D94 8001000C */ lwz r0, 0xc(r1)
/* 00002D98 38210008 */ addi r1, r1, 8
/* 00002D9C 7C0803A6 */ mtlr r0
/* 00002DA0 4E800020 */ blr 
lbl_00002DA4:
/* 00002DA4 7C0802A6 */ mflr r0
/* 00002DA8 3C600000 */ lis r3, modeCtrl@ha
/* 00002DAC 90010004 */ stw r0, 4(r1)
/* 00002DB0 38630000 */ addi r3, r3, modeCtrl@l
/* 00002DB4 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002DB8 93E1000C */ stw r31, 0xc(r1)
/* 00002DBC 3BE30042 */ addi r31, r3, 0x42
/* 00002DC0 93C10008 */ stw r30, 8(r1)
/* 00002DC4 88030042 */ lbz r0, 0x42(r3)
/* 00002DC8 7C030E70 */ srawi r3, r0, 1
/* 00002DCC 7C630194 */ addze r3, r3
/* 00002DD0 5463083C */ slwi r3, r3, 1
/* 00002DD4 7C630011 */ subfc. r3, r3, r0
/* 00002DD8 7C1E0378 */ mr r30, r0
/* 00002DDC 41820034 */ beq lbl_00002E10
/* 00002DE0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002DE4 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002DE8 A0630004 */ lhz r3, 4(r3)
/* 00002DEC 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002DF0 40820018 */ bne lbl_00002E08
/* 00002DF4 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002DF8 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002DFC A0630004 */ lhz r3, 4(r3)
/* 00002E00 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002E04 41820038 */ beq lbl_00002E3C
lbl_00002E08:
/* 00002E08 3BDEFFFF */ addi r30, r30, -1  ;# fixed addi
/* 00002E0C 48000030 */ b lbl_00002E3C
lbl_00002E10:
/* 00002E10 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002E14 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002E18 A0630004 */ lhz r3, 4(r3)
/* 00002E1C 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00002E20 40820018 */ bne lbl_00002E38
/* 00002E24 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002E28 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002E2C A0630004 */ lhz r3, 4(r3)
/* 00002E30 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00002E34 41820008 */ beq lbl_00002E3C
lbl_00002E38:
/* 00002E38 3BDE0001 */ addi r30, r30, 1
lbl_00002E3C:
/* 00002E3C 57C3063E */ clrlwi r3, r30, 0x18
/* 00002E40 28030002 */ cmplwi r3, 2
/* 00002E44 40800034 */ bge lbl_00002E78
/* 00002E48 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002E4C 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002E50 A0630004 */ lhz r3, 4(r3)
/* 00002E54 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 00002E58 40820018 */ bne lbl_00002E70
/* 00002E5C 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002E60 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002E64 A0630004 */ lhz r3, 4(r3)
/* 00002E68 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 00002E6C 41820038 */ beq lbl_00002EA4
lbl_00002E70:
/* 00002E70 3BDE0002 */ addi r30, r30, 2
/* 00002E74 48000030 */ b lbl_00002EA4
lbl_00002E78:
/* 00002E78 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002E7C 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002E80 A0630004 */ lhz r3, 4(r3)
/* 00002E84 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00002E88 40820018 */ bne lbl_00002EA0
/* 00002E8C 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002E90 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002E94 A0630004 */ lhz r3, 4(r3)
/* 00002E98 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00002E9C 41820008 */ beq lbl_00002EA4
lbl_00002EA0:
/* 00002EA0 3BDEFFFE */ addi r30, r30, -2  ;# fixed addi
lbl_00002EA4:
/* 00002EA4 57C3063E */ clrlwi r3, r30, 0x18
/* 00002EA8 28030003 */ cmplwi r3, 3
/* 00002EAC 40810008 */ ble lbl_00002EB4
/* 00002EB0 3BC00000 */ li r30, 0
lbl_00002EB4:
/* 00002EB4 57C3063E */ clrlwi r3, r30, 0x18
/* 00002EB8 7C030040 */ cmplw r3, r0
/* 00002EBC 41820010 */ beq lbl_00002ECC
/* 00002EC0 3860006C */ li r3, 0x6c
/* 00002EC4 4BFFD2E9 */ bl u_play_sound
/* 00002EC8 9BDF0000 */ stb r30, 0(r31)
lbl_00002ECC:
/* 00002ECC 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002ED0 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002ED4 A0030004 */ lhz r0, 4(r3)
/* 00002ED8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002EDC 41820020 */ beq lbl_00002EFC
/* 00002EE0 3860006B */ li r3, 0x6b
/* 00002EE4 4BFFD2C9 */ bl u_play_sound
/* 00002EE8 3860005D */ li r3, 0x5d
/* 00002EEC 48001375 */ bl lbl_00004260
/* 00002EF0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002EF4 380000AE */ li r0, 0xae
/* 00002EF8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00002EFC:
/* 00002EFC 80010014 */ lwz r0, 0x14(r1)
/* 00002F00 83E1000C */ lwz r31, 0xc(r1)
/* 00002F04 83C10008 */ lwz r30, 8(r1)
/* 00002F08 7C0803A6 */ mtlr r0
/* 00002F0C 38210010 */ addi r1, r1, 0x10
/* 00002F10 4E800020 */ blr 
lbl_00002F14:
/* 00002F14 7C0802A6 */ mflr r0
/* 00002F18 3C600000 */ lis r3, lbl_10000000@ha
/* 00002F1C 90010004 */ stw r0, 4(r1)
/* 00002F20 3800FFFF */ li r0, -1
/* 00002F24 3880000B */ li r4, 0xb
/* 00002F28 9421FFB8 */ stwu r1, -0x48(r1)
/* 00002F2C BF21002C */ stmw r25, 0x2c(r1)
/* 00002F30 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 00002F34 3BC00000 */ li r30, 0
/* 00002F38 3C600000 */ lis r3, lbl_80250A68@ha
/* 00002F3C 3BE30000 */ addi r31, r3, lbl_80250A68@l
/* 00002F40 3B9F0014 */ addi r28, r31, 0x14
/* 00002F44 3B5D005C */ addi r26, r29, 0x5c
/* 00002F48 B3DD6EB4 */ sth r30, 0x6eb4(r29)
/* 00002F4C B01D6EB6 */ sth r0, 0x6eb6(r29)
/* 00002F50 93DD6EB8 */ stw r30, 0x6eb8(r29)
/* 00002F54 901D6EBC */ stw r0, 0x6ebc(r29)
/* 00002F58 93DF0014 */ stw r30, 0x14(r31)
/* 00002F5C 801F0014 */ lwz r0, 0x14(r31)
/* 00002F60 5400103A */ slwi r0, r0, 2
/* 00002F64 7C7F0214 */ add r3, r31, r0
/* 00002F68 90830000 */ stw r4, 0(r3)
/* 00002F6C 801F0014 */ lwz r0, 0x14(r31)
/* 00002F70 5400103A */ slwi r0, r0, 2
/* 00002F74 7C7F0214 */ add r3, r31, r0
/* 00002F78 80630000 */ lwz r3, 0(r3)
/* 00002F7C 4BFFD231 */ bl func_8004964C
/* 00002F80 D03F0010 */ stfs f1, 0x10(r31)
/* 00002F84 3C600000 */ lis r3, lbl_0000C348@ha
/* 00002F88 3B7F0010 */ addi r27, r31, 0x10
/* 00002F8C C0030000 */ lfs f0, lbl_0000C348@l(r3)
/* 00002F90 FC000800 */ fcmpu cr0, f0, f1
/* 00002F94 40820014 */ bne lbl_00002FA8
/* 00002F98 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002F9C 380000B8 */ li r0, 0xb8
/* 00002FA0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002FA4 48000288 */ b lbl_0000322C
lbl_00002FA8:
/* 00002FA8 801C0000 */ lwz r0, 0(r28)
/* 00002FAC 389D6E9C */ addi r4, r29, 0x6e9c
/* 00002FB0 5400103A */ slwi r0, r0, 2
/* 00002FB4 7C7F0214 */ add r3, r31, r0
/* 00002FB8 80630000 */ lwz r3, 0(r3)
/* 00002FBC 4BFFD1F1 */ bl u_get_replay_info
/* 00002FC0 3C600000 */ lis r3, currStageId@ha
/* 00002FC4 881D6E9E */ lbz r0, 0x6e9e(r29)
/* 00002FC8 3B230000 */ addi r25, r3, currStageId@l
/* 00002FCC B0190000 */ sth r0, 0(r25)
/* 00002FD0 4BFFD1DD */ bl event_finish_all
/* 00002FD4 3C600000 */ lis r3, modeCtrl@ha
/* 00002FD8 38630000 */ addi r3, r3, modeCtrl@l
/* 00002FDC 93C30028 */ stw r30, 0x28(r3)
/* 00002FE0 38000001 */ li r0, 1
/* 00002FE4 90030024 */ stw r0, 0x24(r3)
/* 00002FE8 90030030 */ stw r0, 0x30(r3)
/* 00002FEC 80630024 */ lwz r3, 0x24(r3)
/* 00002FF0 4BFFD1BD */ bl camera_setup_splitscreen_viewports
/* 00002FF4 4BFFD1B9 */ bl func_80044920
/* 00002FF8 4BFFD1B5 */ bl func_8002FFEC
/* 00002FFC 38600009 */ li r3, 9
/* 00003000 4BFFD1AD */ bl event_start
/* 00003004 801C0000 */ lwz r0, 0(r28)
/* 00003008 5400103A */ slwi r0, r0, 2
/* 0000300C 7C7F0214 */ add r3, r31, r0
/* 00003010 80630000 */ lwz r3, 0(r3)
/* 00003014 4BFFD199 */ bl func_80049514
/* 00003018 3C600000 */ lis r3, infoWork@ha
/* 0000301C 3BC30000 */ addi r30, r3, infoWork@l
/* 00003020 801E0000 */ lwz r0, 0(r30)
/* 00003024 60000810 */ ori r0, r0, 0x810
/* 00003028 901E0000 */ stw r0, 0(r30)
/* 0000302C A8790000 */ lha r3, 0(r25)
/* 00003030 4BFFD17D */ bl load_stage
/* 00003034 38600001 */ li r3, 1
/* 00003038 4BFFD175 */ bl event_start
/* 0000303C 38600002 */ li r3, 2
/* 00003040 4BFFD16D */ bl event_start
/* 00003044 38600003 */ li r3, 3
/* 00003048 4BFFD165 */ bl event_start
/* 0000304C 38600004 */ li r3, 4
/* 00003050 4BFFD15D */ bl event_start
/* 00003054 38600005 */ li r3, 5
/* 00003058 4BFFD155 */ bl event_start
/* 0000305C 38600007 */ li r3, 7
/* 00003060 4BFFD14D */ bl event_start
/* 00003064 3860000E */ li r3, 0xe
/* 00003068 4BFFD145 */ bl event_start
/* 0000306C 3860000F */ li r3, 0xf
/* 00003070 4BFFD13D */ bl event_start
/* 00003074 38600010 */ li r3, 0x10
/* 00003078 4BFFD135 */ bl event_start
/* 0000307C 38600012 */ li r3, 0x12
/* 00003080 4BFFD12D */ bl event_start
/* 00003084 3860000D */ li r3, 0xd
/* 00003088 4BFFD125 */ bl event_start
/* 0000308C 38600014 */ li r3, 0x14
/* 00003090 4BFFD11D */ bl event_start
/* 00003094 38600013 */ li r3, 0x13
/* 00003098 4BFFD115 */ bl event_start
/* 0000309C 801E0000 */ lwz r0, 0(r30)
/* 000030A0 60000008 */ ori r0, r0, 8
/* 000030A4 901E0000 */ stw r0, 0(r30)
/* 000030A8 4BFFD105 */ bl rend_efc_mirror_enable
/* 000030AC 38610008 */ addi r3, r1, 8
/* 000030B0 38800000 */ li r4, 0
/* 000030B4 38A00018 */ li r5, 0x18
/* 000030B8 4BFFD0F5 */ bl memset
/* 000030BC 3C600001 */ lis r3, 1
/* 000030C0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000030C4 B001000E */ sth r0, 0xe(r1)
/* 000030C8 38A10008 */ addi r5, r1, 8
/* 000030CC 38600002 */ li r3, 2
/* 000030D0 38800003 */ li r4, 3
/* 000030D4 4BFFD0D9 */ bl rend_efc_enable
/* 000030D8 3C600000 */ lis r3, backgroundInfo@ha
/* 000030DC A8830000 */ lha r4, backgroundInfo@l(r3)
/* 000030E0 3C600000 */ lis r3, backgroundSongs@ha
/* 000030E4 38030000 */ addi r0, r3, backgroundSongs@l
/* 000030E8 5483083C */ slwi r3, r4, 1
/* 000030EC 7C601A14 */ add r3, r0, r3
/* 000030F0 A8630000 */ lha r3, 0(r3)
/* 000030F4 2C03FFFF */ cmpwi r3, -1
/* 000030F8 41820030 */ beq lbl_00003128
/* 000030FC 3C800000 */ lis r4, lbl_802014E0@ha
/* 00003100 38840000 */ addi r4, r4, lbl_802014E0@l
/* 00003104 80840000 */ lwz r4, 0(r4)
/* 00003108 7C032000 */ cmpw r3, r4
/* 0000310C 4182001C */ beq lbl_00003128
/* 00003110 38030001 */ addi r0, r3, 1
/* 00003114 7C002000 */ cmpw r0, r4
/* 00003118 41820010 */ beq lbl_00003128
/* 0000311C 38800000 */ li r4, 0
/* 00003120 4BFFD08D */ bl u_play_music
/* 00003124 48000038 */ b lbl_0000315C
lbl_00003128:
/* 00003128 3C800000 */ lis r4, lbl_802014E0@ha
/* 0000312C 80040000 */ lwz r0, lbl_802014E0@l(r4)
/* 00003130 2C00FFFF */ cmpwi r0, -1
/* 00003134 40820014 */ bne lbl_00003148
/* 00003138 38600001 */ li r3, 1
/* 0000313C 38800003 */ li r4, 3
/* 00003140 4BFFD06D */ bl u_play_music
/* 00003144 48000018 */ b lbl_0000315C
lbl_00003148:
/* 00003148 2C03FFFF */ cmpwi r3, -1
/* 0000314C 40820010 */ bne lbl_0000315C
/* 00003150 38600000 */ li r3, 0
/* 00003154 38800001 */ li r4, 1
/* 00003158 4BFFD055 */ bl u_play_music
lbl_0000315C:
/* 0000315C 809C0000 */ lwz r4, 0(r28)
/* 00003160 3C600000 */ lis r3, ballInfo@ha
/* 00003164 38030000 */ addi r0, r3, ballInfo@l
/* 00003168 1C6401A4 */ mulli r3, r4, 0x1a4
/* 0000316C 7C601A14 */ add r3, r0, r3
/* 00003170 38000009 */ li r0, 9
/* 00003174 98030003 */ stb r0, 3(r3)
/* 00003178 A87D6EB4 */ lha r3, 0x6eb4(r29)
/* 0000317C 48000A15 */ bl lbl_00003B90
/* 00003180 3C600000 */ lis r3, infoWork@ha
/* 00003184 38830000 */ addi r4, r3, infoWork@l
/* 00003188 80040000 */ lwz r0, 0(r4)
/* 0000318C 3C600000 */ lis r3, lbl_80250A68@ha
/* 00003190 3BC30000 */ addi r30, r3, lbl_80250A68@l
/* 00003194 60000010 */ ori r0, r0, 0x10
/* 00003198 90040000 */ stw r0, 0(r4)
/* 0000319C 801C0000 */ lwz r0, 0(r28)
/* 000031A0 5400103A */ slwi r0, r0, 2
/* 000031A4 7C7E0214 */ add r3, r30, r0
/* 000031A8 80630000 */ lwz r3, 0(r3)
/* 000031AC 4BFFD001 */ bl func_8004964C
/* 000031B0 D03B0000 */ stfs f1, 0(r27)
/* 000031B4 801C0000 */ lwz r0, 0(r28)
/* 000031B8 C03B0000 */ lfs f1, 0(r27)
/* 000031BC 5400103A */ slwi r0, r0, 2
/* 000031C0 7C7E0214 */ add r3, r30, r0
/* 000031C4 80630000 */ lwz r3, 0(r3)
/* 000031C8 4BFFCFE5 */ bl func_80049F90
/* 000031CC 4BFFCFE1 */ bl animate_anim_groups
/* 000031D0 38600005 */ li r3, 5
/* 000031D4 4BFFCFD9 */ bl call_bitmap_load_group
/* 000031D8 38600100 */ li r3, 0x100
/* 000031DC 38800000 */ li r4, 0
/* 000031E0 38A0001E */ li r5, 0x1e
/* 000031E4 4BFFCFC9 */ bl start_screen_fade
/* 000031E8 38000000 */ li r0, 0
/* 000031EC 901A001C */ stw r0, 0x1c(r26)
/* 000031F0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000031F4 380000C1 */ li r0, 0xc1
/* 000031F8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000031FC A01D6E9C */ lhz r0, 0x6e9c(r29)
/* 00003200 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003204 41820018 */ beq lbl_0000321C
/* 00003208 3C600000 */ lis r3, modeCtrl@ha
/* 0000320C 38630000 */ addi r3, r3, modeCtrl@l
/* 00003210 3800003C */ li r0, 0x3c
/* 00003214 90030018 */ stw r0, 0x18(r3)
/* 00003218 48000014 */ b lbl_0000322C
lbl_0000321C:
/* 0000321C 3C600000 */ lis r3, modeCtrl@ha
/* 00003220 38630000 */ addi r3, r3, modeCtrl@l
/* 00003224 380000B4 */ li r0, 0xb4
/* 00003228 90030018 */ stw r0, 0x18(r3)
lbl_0000322C:
/* 0000322C BB21002C */ lmw r25, 0x2c(r1)
/* 00003230 8001004C */ lwz r0, 0x4c(r1)
/* 00003234 38210048 */ addi r1, r1, 0x48
/* 00003238 7C0803A6 */ mtlr r0
/* 0000323C 4E800020 */ blr 
lbl_00003240:
/* 00003240 7C0802A6 */ mflr r0
/* 00003244 3C600000 */ lis r3, lbl_80250A68@ha
/* 00003248 90010004 */ stw r0, 4(r1)
/* 0000324C 3CA00000 */ lis r5, ballInfo@ha
/* 00003250 38630000 */ addi r3, r3, lbl_80250A68@l
/* 00003254 9421FFA8 */ stwu r1, -0x58(r1)
/* 00003258 3C800000 */ lis r4, cameraInfo@ha
/* 0000325C 38E50000 */ addi r7, r5, ballInfo@l
/* 00003260 BF010038 */ stmw r24, 0x38(r1)
/* 00003264 3D200000 */ lis r9, lbl_0000C230@ha
/* 00003268 3B830014 */ addi r28, r3, 0x14
/* 0000326C 38A40000 */ addi r5, r4, cameraInfo@l
/* 00003270 3BE90000 */ addi r31, r9, lbl_0000C230@l
/* 00003274 81430014 */ lwz r10, 0x14(r3)
/* 00003278 3C600000 */ lis r3, lbl_10000000@ha
/* 0000327C 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00003280 801E6EC0 */ lwz r0, 0x6ec0(r30)
/* 00003284 1D0A01A4 */ mulli r8, r10, 0x1a4
/* 00003288 1CCA0284 */ mulli r6, r10, 0x284
/* 0000328C 3C600000 */ lis r3, worldInfo@ha
/* 00003290 2C000000 */ cmpwi r0, 0
/* 00003294 55443032 */ slwi r4, r10, 6
/* 00003298 38030000 */ addi r0, r3, worldInfo@l
/* 0000329C 3BBE005C */ addi r29, r30, 0x5c
/* 000032A0 7F474214 */ add r26, r7, r8
/* 000032A4 7F653214 */ add r27, r5, r6
/* 000032A8 7F202214 */ add r25, r0, r4
/* 000032AC 41820068 */ beq lbl_00003314
/* 000032B0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000032B4 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000032B8 A0030004 */ lhz r0, 4(r3)
/* 000032BC 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 000032C0 41820020 */ beq lbl_000032E0
/* 000032C4 38000000 */ li r0, 0
/* 000032C8 901E6EC0 */ stw r0, 0x6ec0(r30)
/* 000032CC 3C600000 */ lis r3, gamePauseStatus@ha
/* 000032D0 84030000 */ lwzu r0, gamePauseStatus@l(r3)
/* 000032D4 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 000032D8 90030000 */ stw r0, 0(r3)
/* 000032DC 48000054 */ b lbl_00003330
lbl_000032E0:
/* 000032E0 A0030008 */ lhz r0, 8(r3)
/* 000032E4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000032E8 41820018 */ beq lbl_00003300
/* 000032EC 3C600000 */ lis r3, gamePauseStatus@ha
/* 000032F0 84030000 */ lwzu r0, gamePauseStatus@l(r3)
/* 000032F4 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 000032F8 90030000 */ stw r0, 0(r3)
/* 000032FC 48000034 */ b lbl_00003330
lbl_00003300:
/* 00003300 3C600000 */ lis r3, gamePauseStatus@ha
/* 00003304 84030000 */ lwzu r0, gamePauseStatus@l(r3)
/* 00003308 60000008 */ ori r0, r0, 8
/* 0000330C 90030000 */ stw r0, 0(r3)
/* 00003310 48000020 */ b lbl_00003330
lbl_00003314:
/* 00003314 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00003318 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000331C A0030004 */ lhz r0, 4(r3)
/* 00003320 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 00003324 4182000C */ beq lbl_00003330
/* 00003328 38000001 */ li r0, 1
/* 0000332C 901E6EC0 */ stw r0, 0x6ec0(r30)
lbl_00003330:
/* 00003330 807D001C */ lwz r3, 0x1c(r29)
/* 00003334 2C030000 */ cmpwi r3, 0
/* 00003338 4081000C */ ble lbl_00003344
/* 0000333C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00003340 901D001C */ stw r0, 0x1c(r29)
lbl_00003344:
/* 00003344 801D001C */ lwz r0, 0x1c(r29)
/* 00003348 2C000001 */ cmpwi r0, 1
/* 0000334C 408200E0 */ bne lbl_0000342C
/* 00003350 38000000 */ li r0, 0
/* 00003354 3C600000 */ lis r3, gamePauseStatus@ha
/* 00003358 901E6EC0 */ stw r0, 0x6ec0(r30)
/* 0000335C 38830000 */ addi r4, r3, gamePauseStatus@l
/* 00003360 80040000 */ lwz r0, 0(r4)
/* 00003364 38600000 */ li r3, 0
/* 00003368 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 0000336C 90040000 */ stw r0, 0(r4)
/* 00003370 4BFFCE3D */ bl light_init
/* 00003374 4BFFCE39 */ bl event_finish_all
/* 00003378 38600010 */ li r3, 0x10
/* 0000337C 4BFFCE31 */ bl event_start
/* 00003380 38600012 */ li r3, 0x12
/* 00003384 4BFFCE29 */ bl event_start
/* 00003388 38600005 */ li r3, 5
/* 0000338C 4BFFCE21 */ bl call_bitmap_free_group
/* 00003390 38600004 */ li r3, 4
/* 00003394 4BFFCE19 */ bl call_bitmap_load_group
/* 00003398 4BFFCE15 */ bl create_sprite
/* 0000339C 7C651B79 */ or. r5, r3, r3
/* 000033A0 41820054 */ beq lbl_000033F4
/* 000033A4 38000001 */ li r0, 1
/* 000033A8 4CC63182 */ crclr 6
/* 000033AC 98050000 */ stb r0, 0(r5)
/* 000033B0 38000404 */ li r0, 0x404
/* 000033B4 3C600000 */ lis r3, lbl_0000C884@ha
/* 000033B8 B005003C */ sth r0, 0x3c(r5)
/* 000033BC 38830000 */ addi r4, r3, lbl_0000C884@l
/* 000033C0 38000004 */ li r0, 4
/* 000033C4 C01F00D4 */ lfs f0, 0xd4(r31)
/* 000033C8 3865008C */ addi r3, r5, 0x8c
/* 000033CC D0050004 */ stfs f0, 4(r5)
/* 000033D0 C01F011C */ lfs f0, 0x11c(r31)
/* 000033D4 D0050008 */ stfs f0, 8(r5)
/* 000033D8 C01F0120 */ lfs f0, 0x120(r31)
/* 000033DC D005004C */ stfs f0, 0x4c(r5)
/* 000033E0 98050003 */ stb r0, 3(r5)
/* 000033E4 80050074 */ lwz r0, 0x74(r5)
/* 000033E8 64000004 */ oris r0, r0, 4
/* 000033EC 90050074 */ stw r0, 0x74(r5)
/* 000033F0 4BFFCDBD */ bl sprintf
lbl_000033F4:
/* 000033F4 38600049 */ li r3, 0x49
/* 000033F8 38800000 */ li r4, 0
/* 000033FC 4BFFCDB1 */ bl u_play_music
/* 00003400 38600100 */ li r3, 0x100
/* 00003404 38800000 */ li r4, 0
/* 00003408 38A0001E */ li r5, 0x1e
/* 0000340C 4BFFCDA1 */ bl start_screen_fade
/* 00003410 480036C1 */ bl lbl_00006AD0
/* 00003414 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003418 380000BD */ li r0, 0xbd
/* 0000341C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003420 38000001 */ li r0, 1
/* 00003424 901D0010 */ stw r0, 0x10(r29)
/* 00003428 4800046C */ b lbl_00003894
lbl_0000342C:
/* 0000342C 2C000000 */ cmpwi r0, 0
/* 00003430 4082004C */ bne lbl_0000347C
/* 00003434 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00003438 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000343C A0030004 */ lhz r0, 4(r3)
/* 00003440 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003444 41820038 */ beq lbl_0000347C
/* 00003448 3C600000 */ lis r3, gamePauseStatus@ha
/* 0000344C 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00003450 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003454 40820028 */ bne lbl_0000347C
/* 00003458 3800001F */ li r0, 0x1f
/* 0000345C 901D001C */ stw r0, 0x1c(r29)
/* 00003460 3860001E */ li r3, 0x1e
/* 00003464 38800002 */ li r4, 2
/* 00003468 4BFFCD45 */ bl u_play_music
/* 0000346C 38600101 */ li r3, 0x101
/* 00003470 38800000 */ li r4, 0
/* 00003474 38A0001E */ li r5, 0x1e
/* 00003478 4BFFCD35 */ bl start_screen_fade
lbl_0000347C:
/* 0000347C 881A0003 */ lbz r0, 3(r26)
/* 00003480 2C00000A */ cmpwi r0, 0xa
/* 00003484 41820010 */ beq lbl_00003494
/* 00003488 A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 0000348C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003490 40820068 */ bne lbl_000034F8
lbl_00003494:
/* 00003494 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00003498 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000349C A0A30004 */ lhz r5, 4(r3)
/* 000034A0 54A007FF */ clrlwi. r0, r5, 0x1f
/* 000034A4 41820028 */ beq lbl_000034CC
/* 000034A8 A87E6EB4 */ lha r3, 0x6eb4(r30)
/* 000034AC 389E6EB6 */ addi r4, r30, 0x6eb6
/* 000034B0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000034B4 B01E6EB6 */ sth r0, 0x6eb6(r30)
/* 000034B8 A81E6EB6 */ lha r0, 0x6eb6(r30)
/* 000034BC 2C000000 */ cmpwi r0, 0
/* 000034C0 4080000C */ bge lbl_000034CC
/* 000034C4 38000001 */ li r0, 1
/* 000034C8 B0040000 */ sth r0, 0(r4)
lbl_000034CC:
/* 000034CC 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 000034D0 41820028 */ beq lbl_000034F8
/* 000034D4 A87E6EB4 */ lha r3, 0x6eb4(r30)
/* 000034D8 389E6EB6 */ addi r4, r30, 0x6eb6
/* 000034DC 38030001 */ addi r0, r3, 1
/* 000034E0 B01E6EB6 */ sth r0, 0x6eb6(r30)
/* 000034E4 A81E6EB6 */ lha r0, 0x6eb6(r30)
/* 000034E8 2C000001 */ cmpwi r0, 1
/* 000034EC 4081000C */ ble lbl_000034F8
/* 000034F0 38000000 */ li r0, 0
/* 000034F4 B0040000 */ sth r0, 0(r4)
lbl_000034F8:
/* 000034F8 A87E6EB6 */ lha r3, 0x6eb6(r30)
/* 000034FC 3B1E6EB6 */ addi r24, r30, 0x6eb6
/* 00003500 2C03FFFF */ cmpwi r3, -1
/* 00003504 41820018 */ beq lbl_0000351C
/* 00003508 48000689 */ bl lbl_00003B90
/* 0000350C A8780000 */ lha r3, 0(r24)
/* 00003510 3800FFFF */ li r0, -1
/* 00003514 B07E6EB4 */ sth r3, 0x6eb4(r30)
/* 00003518 B0180000 */ sth r0, 0(r24)
lbl_0000351C:
/* 0000351C 807E6EB8 */ lwz r3, 0x6eb8(r30)
/* 00003520 3BBE6EB8 */ addi r29, r30, 0x6eb8
/* 00003524 546007FF */ clrlwi. r0, r3, 0x1f
/* 00003528 40820058 */ bne lbl_00003580
/* 0000352C A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 00003530 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003534 4182004C */ beq lbl_00003580
/* 00003538 881A0003 */ lbz r0, 3(r26)
/* 0000353C 2C00000A */ cmpwi r0, 0xa
/* 00003540 41820040 */ beq lbl_00003580
/* 00003544 60600001 */ ori r0, r3, 1
/* 00003548 901D0000 */ stw r0, 0(r29)
/* 0000354C 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 00003550 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 00003554 80DA00FC */ lwz r6, 0xfc(r26)
/* 00003558 38A40000 */ addi r5, r4, lbl_802F1DFC@l
/* 0000355C 38830000 */ addi r4, r3, lbl_802F1DF8@l
/* 00003560 80060010 */ lwz r0, 0x10(r6)
/* 00003564 3860001D */ li r3, 0x1d
/* 00003568 90050000 */ stw r0, 0(r5)
/* 0000356C 881A002E */ lbz r0, 0x2e(r26)
/* 00003570 7C000774 */ extsb r0, r0
/* 00003574 90040000 */ stw r0, 0(r4)
/* 00003578 4BFFCC35 */ bl func_8002B610
/* 0000357C 907E6EBC */ stw r3, 0x6ebc(r30)
lbl_00003580:
/* 00003580 A81E6EB4 */ lha r0, 0x6eb4(r30)
/* 00003584 2C000000 */ cmpwi r0, 0
/* 00003588 41820008 */ beq lbl_00003590
/* 0000358C 48000098 */ b lbl_00003624
lbl_00003590:
/* 00003590 889A0003 */ lbz r4, 3(r26)
/* 00003594 2C04000A */ cmpwi r4, 0xa
/* 00003598 4182008C */ beq lbl_00003624
/* 0000359C A07E6E9C */ lhz r3, 0x6e9c(r30)
/* 000035A0 70600081 */ andi. r0, r3, 0x81
/* 000035A4 41820030 */ beq lbl_000035D4
/* 000035A8 881B001E */ lbz r0, 0x1e(r27)
/* 000035AC 7C000774 */ extsb r0, r0
/* 000035B0 2C00000E */ cmpwi r0, 0xe
/* 000035B4 41820070 */ beq lbl_00003624
/* 000035B8 2C00000F */ cmpwi r0, 0xf
/* 000035BC 41820068 */ beq lbl_00003624
/* 000035C0 3800000E */ li r0, 0xe
/* 000035C4 981B001E */ stb r0, 0x1e(r27)
/* 000035C8 38000002 */ li r0, 2
/* 000035CC 98190008 */ stb r0, 8(r25)
/* 000035D0 48000054 */ b lbl_00003624
lbl_000035D4:
/* 000035D4 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 000035D8 41820024 */ beq lbl_000035FC
/* 000035DC 881B001E */ lbz r0, 0x1e(r27)
/* 000035E0 2C000004 */ cmpwi r0, 4
/* 000035E4 41820040 */ beq lbl_00003624
/* 000035E8 38000004 */ li r0, 4
/* 000035EC 981B001E */ stb r0, 0x1e(r27)
/* 000035F0 38000002 */ li r0, 2
/* 000035F4 98190008 */ stb r0, 8(r25)
/* 000035F8 4800002C */ b lbl_00003624
lbl_000035FC:
/* 000035FC 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00003600 41820024 */ beq lbl_00003624
/* 00003604 7C800775 */ extsb. r0, r4
/* 00003608 4182001C */ beq lbl_00003624
/* 0000360C 38000000 */ li r0, 0
/* 00003610 981A0003 */ stb r0, 3(r26)
/* 00003614 38600015 */ li r3, 0x15
/* 00003618 38000004 */ li r0, 4
/* 0000361C 987B001E */ stb r3, 0x1e(r27)
/* 00003620 98190008 */ stb r0, 8(r25)
lbl_00003624:
/* 00003624 881A0003 */ lbz r0, 3(r26)
/* 00003628 2C000004 */ cmpwi r0, 4
/* 0000362C 40820024 */ bne lbl_00003650
/* 00003630 A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 00003634 54000631 */ rlwinm. r0, r0, 0, 0x18, 0x18
/* 00003638 41820018 */ beq lbl_00003650
/* 0000363C 38000005 */ li r0, 5
/* 00003640 981A0003 */ stb r0, 3(r26)
/* 00003644 801A0094 */ lwz r0, 0x94(r26)
/* 00003648 60003500 */ ori r0, r0, 0x3500
/* 0000364C 901A0094 */ stw r0, 0x94(r26)
lbl_00003650:
/* 00003650 881A0003 */ lbz r0, 3(r26)
/* 00003654 2C00000A */ cmpwi r0, 0xa
/* 00003658 4182001C */ beq lbl_00003674
/* 0000365C 3C600000 */ lis r3, infoWork@ha
/* 00003660 38830000 */ addi r4, r3, infoWork@l
/* 00003664 80640000 */ lwz r3, 0(r4)
/* 00003668 3800F7EF */ li r0, -2065
/* 0000366C 7C600038 */ and r0, r3, r0
/* 00003670 90040000 */ stw r0, 0(r4)
lbl_00003674:
/* 00003674 3C600000 */ lis r3, gamePauseStatus@ha
/* 00003678 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 0000367C 7000000A */ andi. r0, r0, 0xa
/* 00003680 40820024 */ bne lbl_000036A4
/* 00003684 881A0003 */ lbz r0, 3(r26)
/* 00003688 2C00000A */ cmpwi r0, 0xa
/* 0000368C 41820018 */ beq lbl_000036A4
/* 00003690 3C600000 */ lis r3, modeCtrl@ha
/* 00003694 38830000 */ addi r4, r3, modeCtrl@l
/* 00003698 80640018 */ lwz r3, 0x18(r4)
/* 0000369C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000036A0 90040018 */ stw r0, 0x18(r4)
lbl_000036A4:
/* 000036A4 3C600000 */ lis r3, modeCtrl@ha
/* 000036A8 38630000 */ addi r3, r3, modeCtrl@l
/* 000036AC 3B630018 */ addi r27, r3, 0x18
/* 000036B0 80030018 */ lwz r0, 0x18(r3)
/* 000036B4 2C000000 */ cmpwi r0, 0
/* 000036B8 408001DC */ bge lbl_00003894
/* 000036BC 38600001 */ li r3, 1
/* 000036C0 4BFFCAED */ bl event_finish
/* 000036C4 38600004 */ li r3, 4
/* 000036C8 4BFFCAE5 */ bl event_finish
/* 000036CC 38600005 */ li r3, 5
/* 000036D0 4BFFCADD */ bl event_finish
/* 000036D4 3860000D */ li r3, 0xd
/* 000036D8 4BFFCAD5 */ bl event_finish
/* 000036DC 38600014 */ li r3, 0x14
/* 000036E0 4BFFCACD */ bl event_finish
/* 000036E4 38600013 */ li r3, 0x13
/* 000036E8 4BFFCAC5 */ bl event_finish
/* 000036EC 38600003 */ li r3, 3
/* 000036F0 4BFFCABD */ bl event_finish
/* 000036F4 38600012 */ li r3, 0x12
/* 000036F8 4BFFCAB5 */ bl event_finish
/* 000036FC 801C0000 */ lwz r0, 0(r28)
/* 00003700 3C600000 */ lis r3, lbl_80250A68@ha
/* 00003704 3BE30000 */ addi r31, r3, lbl_80250A68@l
/* 00003708 5400103A */ slwi r0, r0, 2
/* 0000370C 7C7F0214 */ add r3, r31, r0
/* 00003710 80630000 */ lwz r3, 0(r3)
/* 00003714 38810020 */ addi r4, r1, 0x20
/* 00003718 4BFFCA95 */ bl u_get_replay_info
/* 0000371C 801C0000 */ lwz r0, 0(r28)
/* 00003720 5400103A */ slwi r0, r0, 2
/* 00003724 7C7F0214 */ add r3, r31, r0
/* 00003728 80630000 */ lwz r3, 0(r3)
/* 0000372C 4BFFCA81 */ bl func_80049514
/* 00003730 3C600000 */ lis r3, infoWork@ha
/* 00003734 3B030000 */ addi r24, r3, infoWork@l
/* 00003738 80180000 */ lwz r0, 0(r24)
/* 0000373C 3C600000 */ lis r3, currStageId@ha
/* 00003740 3B230000 */ addi r25, r3, currStageId@l
/* 00003744 60000010 */ ori r0, r0, 0x10
/* 00003748 90180000 */ stw r0, 0(r24)
/* 0000374C A8790000 */ lha r3, 0(r25)
/* 00003750 4BFFCA5D */ bl load_stage
/* 00003754 38600001 */ li r3, 1
/* 00003758 4BFFCA55 */ bl event_start
/* 0000375C 38600004 */ li r3, 4
/* 00003760 4BFFCA4D */ bl event_start
/* 00003764 38600005 */ li r3, 5
/* 00003768 4BFFCA45 */ bl event_start
/* 0000376C 3860000D */ li r3, 0xd
/* 00003770 4BFFCA3D */ bl event_start
/* 00003774 38600014 */ li r3, 0x14
/* 00003778 4BFFCA35 */ bl event_start
/* 0000377C 38600013 */ li r3, 0x13
/* 00003780 4BFFCA2D */ bl event_start
/* 00003784 38600003 */ li r3, 3
/* 00003788 4BFFCA25 */ bl event_start
/* 0000378C 38600012 */ li r3, 0x12
/* 00003790 4BFFCA1D */ bl event_start
/* 00003794 80180000 */ lwz r0, 0(r24)
/* 00003798 60000008 */ ori r0, r0, 8
/* 0000379C 90180000 */ stw r0, 0(r24)
/* 000037A0 4BFFCA0D */ bl rend_efc_mirror_enable
/* 000037A4 38610008 */ addi r3, r1, 8
/* 000037A8 38800000 */ li r4, 0
/* 000037AC 38A00018 */ li r5, 0x18
/* 000037B0 4BFFC9FD */ bl memset
/* 000037B4 3C600001 */ lis r3, 1
/* 000037B8 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000037BC B001000E */ sth r0, 0xe(r1)
/* 000037C0 38A10008 */ addi r5, r1, 8
/* 000037C4 38600002 */ li r3, 2
/* 000037C8 38800003 */ li r4, 3
/* 000037CC 4BFFC9E1 */ bl rend_efc_enable
/* 000037D0 A8790000 */ lha r3, 0(r25)
/* 000037D4 4BFFC9D9 */ bl light_init
/* 000037D8 38000009 */ li r0, 9
/* 000037DC 981A0003 */ stb r0, 3(r26)
/* 000037E0 38000000 */ li r0, 0
/* 000037E4 901A0078 */ stw r0, 0x78(r26)
/* 000037E8 801C0000 */ lwz r0, 0(r28)
/* 000037EC 5400103A */ slwi r0, r0, 2
/* 000037F0 7C7F0214 */ add r3, r31, r0
/* 000037F4 80630000 */ lwz r3, 0(r3)
/* 000037F8 4BFFC9B5 */ bl func_8004964C
/* 000037FC D03F0010 */ stfs f1, 0x10(r31)
/* 00003800 801C0000 */ lwz r0, 0(r28)
/* 00003804 C03F0010 */ lfs f1, 0x10(r31)
/* 00003808 5400103A */ slwi r0, r0, 2
/* 0000380C 7C7F0214 */ add r3, r31, r0
/* 00003810 80630000 */ lwz r3, 0(r3)
/* 00003814 4BFFC999 */ bl func_80049F90
/* 00003818 4BFFC995 */ bl animate_anim_groups
/* 0000381C A87E6EB4 */ lha r3, 0x6eb4(r30)
/* 00003820 48000371 */ bl lbl_00003B90
/* 00003824 A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 00003828 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000382C 41820010 */ beq lbl_0000383C
/* 00003830 3800003C */ li r0, 0x3c
/* 00003834 901B0000 */ stw r0, 0(r27)
/* 00003838 4800000C */ b lbl_00003844
lbl_0000383C:
/* 0000383C 380000B4 */ li r0, 0xb4
/* 00003840 901B0000 */ stw r0, 0(r27)
lbl_00003844:
/* 00003844 801D0000 */ lwz r0, 0(r29)
/* 00003848 3B1E6EBC */ addi r24, r30, 0x6ebc
/* 0000384C 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 00003850 901D0000 */ stw r0, 0(r29)
/* 00003854 801E6EBC */ lwz r0, 0x6ebc(r30)
/* 00003858 2C00FFFF */ cmpwi r0, -1
/* 0000385C 41820038 */ beq lbl_00003894
/* 00003860 80BA00FC */ lwz r5, 0xfc(r26)
/* 00003864 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 00003868 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 0000386C 80050010 */ lwz r0, 0x10(r5)
/* 00003870 90040000 */ stw r0, lbl_802F1DFC@l(r4)
/* 00003874 881A002E */ lbz r0, 0x2e(r26)
/* 00003878 7C000774 */ extsb r0, r0
/* 0000387C 90030000 */ stw r0, lbl_802F1DF8@l(r3)
/* 00003880 80180000 */ lwz r0, 0(r24)
/* 00003884 5403043E */ clrlwi r3, r0, 0x10
/* 00003888 4BFFC925 */ bl SoundOff
/* 0000388C 3800FFFF */ li r0, -1
/* 00003890 90180000 */ stw r0, 0(r24)
lbl_00003894:
/* 00003894 BB010038 */ lmw r24, 0x38(r1)
/* 00003898 8001005C */ lwz r0, 0x5c(r1)
/* 0000389C 38210058 */ addi r1, r1, 0x58
/* 000038A0 7C0803A6 */ mtlr r0
/* 000038A4 4E800020 */ blr 
lbl_000038A8:
/* 000038A8 7C0802A6 */ mflr r0
/* 000038AC 3C600000 */ lis r3, lbl_10000000@ha
/* 000038B0 90010004 */ stw r0, 4(r1)
/* 000038B4 3C800000 */ lis r4, lbl_0000C230@ha
/* 000038B8 9421FF80 */ stwu r1, -0x80(r1)
/* 000038BC BF210064 */ stmw r25, 0x64(r1)
/* 000038C0 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000038C4 3C600000 */ lis r3, lbl_0000C640@ha
/* 000038C8 3BA40000 */ addi r29, r4, lbl_0000C230@l
/* 000038CC 3BE30000 */ addi r31, r3, lbl_0000C640@l
/* 000038D0 801E0078 */ lwz r0, 0x78(r30)
/* 000038D4 2C000000 */ cmpwi r0, 0
/* 000038D8 4081000C */ ble lbl_000038E4
/* 000038DC 2C000003 */ cmpwi r0, 3
/* 000038E0 4180029C */ blt lbl_00003B7C
lbl_000038E4:
/* 000038E4 A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 000038E8 3C800100 */ lis r4, 0x100
/* 000038EC 3B64FFFF */ addi r27, r4, -1  ;# fixed addi
/* 000038F0 540506B5 */ rlwinm. r5, r0, 0, 0x1a, 0x1a
/* 000038F4 3B800000 */ li r28, 0
/* 000038F8 41820010 */ beq lbl_00003908
/* 000038FC 3C600040 */ lis r3, 0x40
/* 00003900 3B64FF00 */ addi r27, r4, -256  ;# fixed addi
/* 00003904 3B834040 */ addi r28, r3, 0x4040
lbl_00003908:
/* 00003908 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000390C 4182001C */ beq lbl_00003928
/* 00003910 88BE6EA0 */ lbz r5, 0x6ea0(r30)
/* 00003914 38610008 */ addi r3, r1, 8
/* 00003918 389F0248 */ addi r4, r31, 0x248
/* 0000391C 4CC63182 */ crclr 6
/* 00003920 4BFFC88D */ bl sprintf
/* 00003924 48000038 */ b lbl_0000395C
lbl_00003928:
/* 00003928 2C050000 */ cmpwi r5, 0
/* 0000392C 4182001C */ beq lbl_00003948
/* 00003930 88BE6EA0 */ lbz r5, 0x6ea0(r30)
/* 00003934 38610008 */ addi r3, r1, 8
/* 00003938 389F0254 */ addi r4, r31, 0x254
/* 0000393C 4CC63182 */ crclr 6
/* 00003940 4BFFC86D */ bl sprintf
/* 00003944 48000018 */ b lbl_0000395C
lbl_00003948:
/* 00003948 88BE6EA0 */ lbz r5, 0x6ea0(r30)
/* 0000394C 38610008 */ addi r3, r1, 8
/* 00003950 389F0260 */ addi r4, r31, 0x260
/* 00003954 4CC63182 */ crclr 6
/* 00003958 4BFFC855 */ bl sprintf
lbl_0000395C:
/* 0000395C A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 00003960 3B400014 */ li r26, 0x14
/* 00003964 3B20001E */ li r25, 0x1e
/* 00003968 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000396C 40820064 */ bne lbl_000039D0
/* 00003970 4BFFC83D */ bl reset_text_draw_settings
/* 00003974 3860005D */ li r3, 0x5d
/* 00003978 4BFFC835 */ bl set_text_font
/* 0000397C C03D0124 */ lfs f1, 0x124(r29)
/* 00003980 FC400890 */ fmr f2, f1
/* 00003984 4BFFC829 */ bl set_text_scale
/* 00003988 9341005C */ stw r26, 0x5c(r1)
/* 0000398C 3C004330 */ lis r0, 0x4330
/* 00003990 3C800000 */ lis r4, lbl_0000C368@ha
/* 00003994 93210054 */ stw r25, 0x54(r1)
/* 00003998 3C600000 */ lis r3, lbl_0000C368@ha
/* 0000399C C8640000 */ lfd f3, lbl_0000C368@l(r4)
/* 000039A0 90010058 */ stw r0, 0x58(r1)
/* 000039A4 C8430000 */ lfd f2, lbl_0000C368@l(r3)
/* 000039A8 90010050 */ stw r0, 0x50(r1)
/* 000039AC C8210058 */ lfd f1, 0x58(r1)
/* 000039B0 C8010050 */ lfd f0, 0x50(r1)
/* 000039B4 EC211828 */ fsubs f1, f1, f3
/* 000039B8 EC401028 */ fsubs f2, f0, f2
/* 000039BC 4BFFC7F1 */ bl set_text_pos
/* 000039C0 887E6E9F */ lbz r3, 0x6e9f(r30)
/* 000039C4 38630034 */ addi r3, r3, 0x34
/* 000039C8 4BFFC7E5 */ bl u_draw_char
/* 000039CC 3B40003C */ li r26, 0x3c
lbl_000039D0:
/* 000039D0 38600062 */ li r3, 0x62
/* 000039D4 4BFFC7D9 */ bl set_text_font
/* 000039D8 C03D00F0 */ lfs f1, 0xf0(r29)
/* 000039DC FC400890 */ fmr f2, f1
/* 000039E0 4BFFC7CD */ bl set_text_scale
/* 000039E4 7F63DB78 */ mr r3, r27
/* 000039E8 4BFFC7C5 */ bl set_text_mul_color
/* 000039EC 7F83E378 */ mr r3, r28
/* 000039F0 4BFFC7BD */ bl set_text_add_color
/* 000039F4 38000024 */ li r0, 0x24
/* 000039F8 93410054 */ stw r26, 0x54(r1)
/* 000039FC 3F804330 */ lis r28, 0x4330
/* 00003A00 9001005C */ stw r0, 0x5c(r1)
/* 00003A04 3C800000 */ lis r4, lbl_0000C368@ha
/* 00003A08 3C600000 */ lis r3, lbl_0000C368@ha
/* 00003A0C C8640000 */ lfd f3, lbl_0000C368@l(r4)
/* 00003A10 93810050 */ stw r28, 0x50(r1)
/* 00003A14 C8430000 */ lfd f2, lbl_0000C368@l(r3)
/* 00003A18 93810058 */ stw r28, 0x58(r1)
/* 00003A1C C8210050 */ lfd f1, 0x50(r1)
/* 00003A20 C8010058 */ lfd f0, 0x58(r1)
/* 00003A24 EC211828 */ fsubs f1, f1, f3
/* 00003A28 EC401028 */ fsubs f2, f0, f2
/* 00003A2C 4BFFC781 */ bl set_text_pos
/* 00003A30 38610008 */ addi r3, r1, 8
/* 00003A34 4BFFC779 */ bl u_draw_text
/* 00003A38 80BE6EAC */ lwz r5, 0x6eac(r30)
/* 00003A3C 38610008 */ addi r3, r1, 8
/* 00003A40 389F026C */ addi r4, r31, 0x26c
/* 00003A44 4CC63182 */ crclr 6
/* 00003A48 4BFFC765 */ bl sprintf
/* 00003A4C C03D0128 */ lfs f1, 0x128(r29)
/* 00003A50 3B600014 */ li r27, 0x14
/* 00003A54 FC400890 */ fmr f2, f1
/* 00003A58 4BFFC755 */ bl set_text_scale
/* 00003A5C 3FC00100 */ lis r30, 0x100
/* 00003A60 387EFFFF */ addi r3, r30, -1  ;# fixed addi
/* 00003A64 4BFFC749 */ bl set_text_mul_color
/* 00003A68 38600000 */ li r3, 0
/* 00003A6C 4BFFC741 */ bl set_text_add_color
/* 00003A70 38000040 */ li r0, 0x40
/* 00003A74 9361004C */ stw r27, 0x4c(r1)
/* 00003A78 3C800000 */ lis r4, lbl_0000C368@ha
/* 00003A7C 90010044 */ stw r0, 0x44(r1)
/* 00003A80 3C600000 */ lis r3, lbl_0000C368@ha
/* 00003A84 C8640000 */ lfd f3, lbl_0000C368@l(r4)
/* 00003A88 93810048 */ stw r28, 0x48(r1)
/* 00003A8C C8430000 */ lfd f2, lbl_0000C368@l(r3)
/* 00003A90 93810040 */ stw r28, 0x40(r1)
/* 00003A94 C8210048 */ lfd f1, 0x48(r1)
/* 00003A98 C8010040 */ lfd f0, 0x40(r1)
/* 00003A9C EC211828 */ fsubs f1, f1, f3
/* 00003AA0 EC401028 */ fsubs f2, f0, f2
/* 00003AA4 4BFFC709 */ bl set_text_pos
/* 00003AA8 38610008 */ addi r3, r1, 8
/* 00003AAC 4BFFC701 */ bl u_draw_text
/* 00003AB0 4BFFC6FD */ bl func_8004C2C8
/* 00003AB4 7C600734 */ extsh r0, r3
/* 00003AB8 C01D012C */ lfs f0, 0x12c(r29)
/* 00003ABC 6C008000 */ xoris r0, r0, 0x8000
/* 00003AC0 4CC63242 */ crset 6
/* 00003AC4 9001003C */ stw r0, 0x3c(r1)
/* 00003AC8 3C800000 */ lis r4, lbl_0000C270@ha
/* 00003ACC C8440000 */ lfd f2, lbl_0000C270@l(r4)
/* 00003AD0 38610008 */ addi r3, r1, 8
/* 00003AD4 93810038 */ stw r28, 0x38(r1)
/* 00003AD8 389F0278 */ addi r4, r31, 0x278
/* 00003ADC C8210038 */ lfd f1, 0x38(r1)
/* 00003AE0 EC211028 */ fsubs f1, f1, f2
/* 00003AE4 EC210024 */ fdivs f1, f1, f0
/* 00003AE8 4BFFC6C5 */ bl sprintf
/* 00003AEC 38000052 */ li r0, 0x52
/* 00003AF0 93610034 */ stw r27, 0x34(r1)
/* 00003AF4 3C800000 */ lis r4, lbl_0000C368@ha
/* 00003AF8 9001002C */ stw r0, 0x2c(r1)
/* 00003AFC 3C600000 */ lis r3, lbl_0000C368@ha
/* 00003B00 C8640000 */ lfd f3, lbl_0000C368@l(r4)
/* 00003B04 93810030 */ stw r28, 0x30(r1)
/* 00003B08 C8430000 */ lfd f2, lbl_0000C368@l(r3)
/* 00003B0C 93810028 */ stw r28, 0x28(r1)
/* 00003B10 C8210030 */ lfd f1, 0x30(r1)
/* 00003B14 C8010028 */ lfd f0, 0x28(r1)
/* 00003B18 EC211828 */ fsubs f1, f1, f3
/* 00003B1C EC401028 */ fsubs f2, f0, f2
/* 00003B20 4BFFC68D */ bl set_text_pos
/* 00003B24 38610008 */ addi r3, r1, 8
/* 00003B28 4BFFC685 */ bl u_draw_text
/* 00003B2C 3C600000 */ lis r3, globalFrameCounter@ha
/* 00003B30 80030000 */ lwz r0, globalFrameCounter@l(r3)
/* 00003B34 540006B7 */ rlwinm. r0, r0, 0, 0x1a, 0x1b
/* 00003B38 41820044 */ beq lbl_00003B7C
/* 00003B3C 38610008 */ addi r3, r1, 8
/* 00003B40 4CC63182 */ crclr 6
/* 00003B44 389F0124 */ addi r4, r31, 0x124
/* 00003B48 4BFFC665 */ bl sprintf
/* 00003B4C C03D00F0 */ lfs f1, 0xf0(r29)
/* 00003B50 FC400890 */ fmr f2, f1
/* 00003B54 4BFFC659 */ bl set_text_scale
/* 00003B58 387EFFFF */ addi r3, r30, -1  ;# fixed addi
/* 00003B5C 4BFFC651 */ bl set_text_mul_color
/* 00003B60 38600000 */ li r3, 0
/* 00003B64 4BFFC649 */ bl set_text_add_color
/* 00003B68 C03D0130 */ lfs f1, 0x130(r29)
/* 00003B6C C05D0134 */ lfs f2, 0x134(r29)
/* 00003B70 4BFFC63D */ bl set_text_pos
/* 00003B74 38610008 */ addi r3, r1, 8
/* 00003B78 4BFFC635 */ bl u_draw_text
lbl_00003B7C:
/* 00003B7C BB210064 */ lmw r25, 0x64(r1)
/* 00003B80 80010084 */ lwz r0, 0x84(r1)
/* 00003B84 38210080 */ addi r1, r1, 0x80
/* 00003B88 7C0803A6 */ mtlr r0
/* 00003B8C 4E800020 */ blr 
lbl_00003B90:
/* 00003B90 7C0802A6 */ mflr r0
/* 00003B94 3C800000 */ lis r4, lbl_80250A68@ha
/* 00003B98 90010004 */ stw r0, 4(r1)
/* 00003B9C 38840000 */ addi r4, r4, lbl_80250A68@l
/* 00003BA0 2C030001 */ cmpwi r3, 1
/* 00003BA4 9421FFE8 */ stwu r1, -0x18(r1)
/* 00003BA8 93E10014 */ stw r31, 0x14(r1)
/* 00003BAC 80040014 */ lwz r0, 0x14(r4)
/* 00003BB0 3C800000 */ lis r4, worldInfo@ha
/* 00003BB4 54053032 */ slwi r5, r0, 6
/* 00003BB8 38040000 */ addi r0, r4, worldInfo@l
/* 00003BBC 7FE02A14 */ add r31, r0, r5
/* 00003BC0 41820038 */ beq lbl_00003BF8
/* 00003BC4 40800054 */ bge lbl_00003C18
/* 00003BC8 2C030000 */ cmpwi r3, 0
/* 00003BCC 40800008 */ bge lbl_00003BD4
/* 00003BD0 48000048 */ b lbl_00003C18
lbl_00003BD4:
/* 00003BD4 38600000 */ li r3, 0
/* 00003BD8 4BFFC5D5 */ bl camera_set_state
/* 00003BDC 38000008 */ li r0, 8
/* 00003BE0 981F0008 */ stb r0, 8(r31)
/* 00003BE4 3C600000 */ lis r3, infoWork@ha
/* 00003BE8 84030000 */ lwzu r0, infoWork@l(r3)
/* 00003BEC 60000800 */ ori r0, r0, 0x800
/* 00003BF0 90030000 */ stw r0, 0(r3)
/* 00003BF4 48000024 */ b lbl_00003C18
lbl_00003BF8:
/* 00003BF8 3860002C */ li r3, 0x2c
/* 00003BFC 4BFFC5B1 */ bl camera_set_state
/* 00003C00 38000006 */ li r0, 6
/* 00003C04 981F0008 */ stb r0, 8(r31)
/* 00003C08 3C600000 */ lis r3, infoWork@ha
/* 00003C0C 84030000 */ lwzu r0, infoWork@l(r3)
/* 00003C10 54000566 */ rlwinm r0, r0, 0, 0x15, 0x13
/* 00003C14 90030000 */ stw r0, 0(r3)
lbl_00003C18:
/* 00003C18 8001001C */ lwz r0, 0x1c(r1)
/* 00003C1C 83E10014 */ lwz r31, 0x14(r1)
/* 00003C20 38210018 */ addi r1, r1, 0x18
/* 00003C24 7C0803A6 */ mtlr r0
/* 00003C28 4E800020 */ blr 
lbl_00003C2C:
/* 00003C2C 7C0802A6 */ mflr r0
/* 00003C30 90010004 */ stw r0, 4(r1)
/* 00003C34 9421FFF8 */ stwu r1, -8(r1)
/* 00003C38 48005E41 */ bl lbl_00009A78
/* 00003C3C 3C600000 */ lis r3, lbl_10000000@ha
/* 00003C40 38830000 */ addi r4, r3, lbl_10000000@l
/* 00003C44 88040039 */ lbz r0, 0x39(r4)
/* 00003C48 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003C4C 7C000774 */ extsb r0, r0
/* 00003C50 90040114 */ stw r0, 0x114(r4)
/* 00003C54 380000C3 */ li r0, 0xc3
/* 00003C58 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003C5C 8001000C */ lwz r0, 0xc(r1)
/* 00003C60 38210008 */ addi r1, r1, 8
/* 00003C64 7C0803A6 */ mtlr r0
/* 00003C68 4E800020 */ blr 
lbl_00003C6C:
/* 00003C6C 7C0802A6 */ mflr r0
/* 00003C70 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00003C74 90010004 */ stw r0, 4(r1)
/* 00003C78 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00003C7C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00003C80 93E10014 */ stw r31, 0x14(r1)
/* 00003C84 93C10010 */ stw r30, 0x10(r1)
/* 00003C88 3BC30004 */ addi r30, r3, 4
/* 00003C8C 93A1000C */ stw r29, 0xc(r1)
/* 00003C90 A0830004 */ lhz r4, 4(r3)
/* 00003C94 3C600000 */ lis r3, lbl_10000000@ha
/* 00003C98 38630000 */ addi r3, r3, lbl_10000000@l
/* 00003C9C 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00003CA0 83A30114 */ lwz r29, 0x114(r3)
/* 00003CA4 3BE300FC */ addi r31, r3, 0xfc
/* 00003CA8 40820028 */ bne lbl_00003CD0
/* 00003CAC 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00003CB0 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00003CB4 A0630004 */ lhz r3, 4(r3)
/* 00003CB8 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00003CBC 40820014 */ bne lbl_00003CD0
/* 00003CC0 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00003CC4 4082000C */ bne lbl_00003CD0
/* 00003CC8 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00003CCC 41820010 */ beq lbl_00003CDC
lbl_00003CD0:
/* 00003CD0 7FA00034 */ cntlzw r0, r29
/* 00003CD4 5400D97E */ srwi r0, r0, 5
/* 00003CD8 7C1D0378 */ mr r29, r0
lbl_00003CDC:
/* 00003CDC 801F0018 */ lwz r0, 0x18(r31)
/* 00003CE0 7C1D0000 */ cmpw r29, r0
/* 00003CE4 41820010 */ beq lbl_00003CF4
/* 00003CE8 3860006C */ li r3, 0x6c
/* 00003CEC 4BFFC4C1 */ bl u_play_sound
/* 00003CF0 93BF0018 */ stw r29, 0x18(r31)
lbl_00003CF4:
/* 00003CF4 A07E0000 */ lhz r3, 0(r30)
/* 00003CF8 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00003CFC 41820050 */ beq lbl_00003D4C
/* 00003D00 3860006A */ li r3, 0x6a
/* 00003D04 4BFFC4A9 */ bl u_play_sound
/* 00003D08 801F0018 */ lwz r0, 0x18(r31)
/* 00003D0C 2C000000 */ cmpwi r0, 0
/* 00003D10 4082001C */ bne lbl_00003D2C
/* 00003D14 3860005E */ li r3, 0x5e
/* 00003D18 480004ED */ bl lbl_00004204
/* 00003D1C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003D20 380000B2 */ li r0, 0xb2
/* 00003D24 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003D28 48000048 */ b lbl_00003D70
lbl_00003D2C:
/* 00003D2C 2C000001 */ cmpwi r0, 1
/* 00003D30 40820040 */ bne lbl_00003D70
/* 00003D34 3860005E */ li r3, 0x5e
/* 00003D38 480004CD */ bl lbl_00004204
/* 00003D3C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003D40 380000C4 */ li r0, 0xc4
/* 00003D44 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003D48 48000028 */ b lbl_00003D70
lbl_00003D4C:
/* 00003D4C 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00003D50 41820020 */ beq lbl_00003D70
/* 00003D54 3860006B */ li r3, 0x6b
/* 00003D58 4BFFC455 */ bl u_play_sound
/* 00003D5C 3860005E */ li r3, 0x5e
/* 00003D60 48000501 */ bl lbl_00004260
/* 00003D64 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003D68 380000AE */ li r0, 0xae
/* 00003D6C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00003D70:
/* 00003D70 8001001C */ lwz r0, 0x1c(r1)
/* 00003D74 83E10014 */ lwz r31, 0x14(r1)
/* 00003D78 83C10010 */ lwz r30, 0x10(r1)
/* 00003D7C 7C0803A6 */ mtlr r0
/* 00003D80 83A1000C */ lwz r29, 0xc(r1)
/* 00003D84 38210018 */ addi r1, r1, 0x18
/* 00003D88 4E800020 */ blr 
lbl_00003D8C:
/* 00003D8C 7C0802A6 */ mflr r0
/* 00003D90 3C600000 */ lis r3, lbl_10000000@ha
/* 00003D94 90010004 */ stw r0, 4(r1)
/* 00003D98 38000001 */ li r0, 1
/* 00003D9C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00003DA0 93E1000C */ stw r31, 0xc(r1)
/* 00003DA4 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00003DA8 981F0039 */ stb r0, 0x39(r31)
/* 00003DAC 48006789 */ bl lbl_0000A534
/* 00003DB0 38000000 */ li r0, 0
/* 00003DB4 901F0154 */ stw r0, 0x154(r31)
/* 00003DB8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003DBC 380000C5 */ li r0, 0xc5
/* 00003DC0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003DC4 80010014 */ lwz r0, 0x14(r1)
/* 00003DC8 83E1000C */ lwz r31, 0xc(r1)
/* 00003DCC 38210010 */ addi r1, r1, 0x10
/* 00003DD0 7C0803A6 */ mtlr r0
/* 00003DD4 4E800020 */ blr 
lbl_00003DD8:
/* 00003DD8 7C0802A6 */ mflr r0
/* 00003DDC 90010004 */ stw r0, 4(r1)
/* 00003DE0 9421FFE0 */ stwu r1, -0x20(r1)
/* 00003DE4 BF61000C */ stmw r27, 0xc(r1)
/* 00003DE8 4BFFC3C5 */ bl func_800B622C
/* 00003DEC 3C800000 */ lis r4, g_currPlayerButtons@ha
/* 00003DF0 38840000 */ addi r4, r4, g_currPlayerButtons@l
/* 00003DF4 A0A40004 */ lhz r5, 4(r4)
/* 00003DF8 3BE40004 */ addi r31, r4, 4
/* 00003DFC 3C800000 */ lis r4, lbl_10000000@ha
/* 00003E00 38840000 */ addi r4, r4, lbl_10000000@l
/* 00003E04 3B640154 */ addi r27, r4, 0x154
/* 00003E08 80840154 */ lwz r4, 0x154(r4)
/* 00003E0C 3B830000 */ addi r28, r3, 0
/* 00003E10 54A00739 */ rlwinm. r0, r5, 0, 0x1c, 0x1c
/* 00003E14 3BBC0000 */ addi r29, r28, 0
/* 00003E18 3BC40000 */ addi r30, r4, 0
/* 00003E1C 40820018 */ bne lbl_00003E34
/* 00003E20 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00003E24 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00003E28 A0630004 */ lhz r3, 4(r3)
/* 00003E2C 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00003E30 41820014 */ beq lbl_00003E44
lbl_00003E34:
/* 00003E34 37DEFFFF */ addic. r30, r30, -1  ;# fixed addi
/* 00003E38 4080002C */ bge lbl_00003E64
/* 00003E3C 3BC00003 */ li r30, 3
/* 00003E40 48000024 */ b lbl_00003E64
lbl_00003E44:
/* 00003E44 54A0077B */ rlwinm. r0, r5, 0, 0x1d, 0x1d
/* 00003E48 4082000C */ bne lbl_00003E54
/* 00003E4C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00003E50 41820014 */ beq lbl_00003E64
lbl_00003E54:
/* 00003E54 3BDE0001 */ addi r30, r30, 1
/* 00003E58 2C1E0004 */ cmpwi r30, 4
/* 00003E5C 41800008 */ blt lbl_00003E64
/* 00003E60 3BC00000 */ li r30, 0
lbl_00003E64:
/* 00003E64 7C1E2000 */ cmpw r30, r4
/* 00003E68 41820010 */ beq lbl_00003E78
/* 00003E6C 3860006C */ li r3, 0x6c
/* 00003E70 4BFFC33D */ bl u_play_sound
/* 00003E74 93DB0000 */ stw r30, 0(r27)
lbl_00003E78:
/* 00003E78 A09F0000 */ lhz r4, 0(r31)
/* 00003E7C 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00003E80 40820028 */ bne lbl_00003EA8
/* 00003E84 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00003E88 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00003E8C A0630004 */ lhz r3, 4(r3)
/* 00003E90 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00003E94 40820014 */ bne lbl_00003EA8
/* 00003E98 548007FF */ clrlwi. r0, r4, 0x1f
/* 00003E9C 4082000C */ bne lbl_00003EA8
/* 00003EA0 546007FF */ clrlwi. r0, r3, 0x1f
/* 00003EA4 41820018 */ beq lbl_00003EBC
lbl_00003EA8:
/* 00003EA8 38600065 */ li r3, 0x65
/* 00003EAC 4BFFC301 */ bl u_play_sound
/* 00003EB0 38000001 */ li r0, 1
/* 00003EB4 7C00F030 */ slw r0, r0, r30
/* 00003EB8 7FBD0278 */ xor r29, r29, r0
lbl_00003EBC:
/* 00003EBC 57A3063E */ clrlwi r3, r29, 0x18
/* 00003EC0 5780063E */ clrlwi r0, r28, 0x18
/* 00003EC4 7C030040 */ cmplw r3, r0
/* 00003EC8 4182000C */ beq lbl_00003ED4
/* 00003ECC 7FA3EB78 */ mr r3, r29
/* 00003ED0 4BFFC2DD */ bl func_800B6224
lbl_00003ED4:
/* 00003ED4 A01F0000 */ lhz r0, 0(r31)
/* 00003ED8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003EDC 41820020 */ beq lbl_00003EFC
/* 00003EE0 3860006B */ li r3, 0x6b
/* 00003EE4 4BFFC2C9 */ bl u_play_sound
/* 00003EE8 38600060 */ li r3, 0x60
/* 00003EEC 48000375 */ bl lbl_00004260
/* 00003EF0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003EF4 380000C2 */ li r0, 0xc2
/* 00003EF8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00003EFC:
/* 00003EFC BB61000C */ lmw r27, 0xc(r1)
/* 00003F00 80010024 */ lwz r0, 0x24(r1)
/* 00003F04 38210020 */ addi r1, r1, 0x20
/* 00003F08 7C0803A6 */ mtlr r0
/* 00003F0C 4E800020 */ blr 
lbl_00003F10:
/* 00003F10 7C0802A6 */ mflr r0
/* 00003F14 3C600000 */ lis r3, gameSubmode@ha
/* 00003F18 90010004 */ stw r0, 4(r1)
/* 00003F1C 9421FFF8 */ stwu r1, -8(r1)
/* 00003F20 A8030000 */ lha r0, gameSubmode@l(r3)
/* 00003F24 2C0000C0 */ cmpwi r0, 0xc0
/* 00003F28 40800018 */ bge lbl_00003F40
/* 00003F2C 2C0000B4 */ cmpwi r0, 0xb4
/* 00003F30 4080002C */ bge lbl_00003F5C
/* 00003F34 2C0000B2 */ cmpwi r0, 0xb2
/* 00003F38 40800014 */ bge lbl_00003F4C
/* 00003F3C 48000020 */ b lbl_00003F5C
lbl_00003F40:
/* 00003F40 2C0000C2 */ cmpwi r0, 0xc2
/* 00003F44 40800018 */ bge lbl_00003F5C
/* 00003F48 4800000C */ b lbl_00003F54
lbl_00003F4C:
/* 00003F4C 4BFFD64D */ bl lbl_00001598
/* 00003F50 4800000C */ b lbl_00003F5C
lbl_00003F54:
/* 00003F54 4BFFC259 */ bl draw_normal_game_scene
/* 00003F58 4BFFF951 */ bl lbl_000038A8
lbl_00003F5C:
/* 00003F5C 8001000C */ lwz r0, 0xc(r1)
/* 00003F60 38210008 */ addi r1, r1, 8
/* 00003F64 7C0803A6 */ mtlr r0
/* 00003F68 4E800020 */ blr 
lbl_00003F6C:
/* 00003F6C 3803FFA8 */ addi r0, r3, -88  ;# fixed addi
/* 00003F70 28000009 */ cmplwi r0, 9
/* 00003F74 3C600000 */ lis r3, lbl_10000000@ha
/* 00003F78 38830000 */ addi r4, r3, lbl_10000000@l
/* 00003F7C 4181006C */ bgt lbl_00003FE8
/* 00003F80 3C600000 */ lis r3, lbl_0000C8C4@ha
/* 00003F84 38630000 */ addi r3, r3, lbl_0000C8C4@l
/* 00003F88 5400103A */ slwi r0, r0, 2
/* 00003F8C 7C03002E */ lwzx r0, r3, r0
/* 00003F90 7C0903A6 */ mtctr r0
/* 00003F94 4E800420 */ bctr 
lbl_00003F98:
/* 00003F98 3864003C */ addi r3, r4, 0x3c
/* 00003F9C 4E800020 */ blr 
lbl_00003FA0:
/* 00003FA0 3864005C */ addi r3, r4, 0x5c
/* 00003FA4 4E800020 */ blr 
lbl_00003FA8:
/* 00003FA8 3864007C */ addi r3, r4, 0x7c
/* 00003FAC 4E800020 */ blr 
lbl_00003FB0:
/* 00003FB0 3864009C */ addi r3, r4, 0x9c
/* 00003FB4 4E800020 */ blr 
lbl_00003FB8:
/* 00003FB8 386400BC */ addi r3, r4, 0xbc
/* 00003FBC 4E800020 */ blr 
lbl_00003FC0:
/* 00003FC0 386400DC */ addi r3, r4, 0xdc
/* 00003FC4 4E800020 */ blr 
lbl_00003FC8:
/* 00003FC8 386400FC */ addi r3, r4, 0xfc
/* 00003FCC 4E800020 */ blr 
lbl_00003FD0:
/* 00003FD0 3864011C */ addi r3, r4, 0x11c
/* 00003FD4 4E800020 */ blr 
lbl_00003FD8:
/* 00003FD8 3864013C */ addi r3, r4, 0x13c
/* 00003FDC 4E800020 */ blr 
lbl_00003FE0:
/* 00003FE0 3864015C */ addi r3, r4, 0x15c
/* 00003FE4 4E800020 */ blr 
lbl_00003FE8:
/* 00003FE8 38600000 */ li r3, 0
/* 00003FEC 4E800020 */ blr 
lbl_00003FF0:
/* 00003FF0 7C0802A6 */ mflr r0
/* 00003FF4 90010004 */ stw r0, 4(r1)
/* 00003FF8 9421FFD8 */ stwu r1, -0x28(r1)
/* 00003FFC 93E10024 */ stw r31, 0x24(r1)
/* 00004000 93C10020 */ stw r30, 0x20(r1)
/* 00004004 93A1001C */ stw r29, 0x1c(r1)
/* 00004008 7C9D2378 */ mr r29, r4
/* 0000400C 8864000F */ lbz r3, 0xf(r4)
/* 00004010 3C800000 */ lis r4, lbl_0000C370@ha
/* 00004014 3BC40000 */ addi r30, r4, lbl_0000C370@l
/* 00004018 7C630774 */ extsb r3, r3
/* 0000401C 4BFFFF51 */ bl lbl_00003F6C
/* 00004020 7C7F1B79 */ or. r31, r3, r3
/* 00004024 418201C4 */ beq lbl_000041E8
/* 00004028 881F0000 */ lbz r0, 0(r31)
/* 0000402C 7C000774 */ extsb r0, r0
/* 00004030 2C000003 */ cmpwi r0, 3
/* 00004034 418200EC */ beq lbl_00004120
/* 00004038 40800014 */ bge lbl_0000404C
/* 0000403C 2C000001 */ cmpwi r0, 1
/* 00004040 41820018 */ beq lbl_00004058
/* 00004044 40800078 */ bge lbl_000040BC
/* 00004048 4800018C */ b lbl_000041D4
lbl_0000404C:
/* 0000404C 2C000005 */ cmpwi r0, 5
/* 00004050 40800184 */ bge lbl_000041D4
/* 00004054 48000128 */ b lbl_0000417C
lbl_00004058:
/* 00004058 887F0001 */ lbz r3, 1(r31)
/* 0000405C 7C600774 */ extsb r0, r3
/* 00004060 2C00001E */ cmpwi r0, 0x1e
/* 00004064 40800048 */ bge lbl_000040AC
/* 00004068 38030001 */ addi r0, r3, 1
/* 0000406C 981F0001 */ stb r0, 1(r31)
/* 00004070 3C600000 */ lis r3, lbl_0000C380@ha
/* 00004074 3C004330 */ lis r0, 0x4330
/* 00004078 889F0001 */ lbz r4, 1(r31)
/* 0000407C C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00004080 7C830774 */ extsb r3, r4
/* 00004084 C05F0004 */ lfs f2, 4(r31)
/* 00004088 5463083C */ slwi r3, r3, 1
/* 0000408C 6C638000 */ xoris r3, r3, 0x8000
/* 00004090 90610014 */ stw r3, 0x14(r1)
/* 00004094 90010010 */ stw r0, 0x10(r1)
/* 00004098 C8010010 */ lfd f0, 0x10(r1)
/* 0000409C EC000828 */ fsubs f0, f0, f1
/* 000040A0 EC020028 */ fsubs f0, f2, f0
/* 000040A4 D01F0004 */ stfs f0, 4(r31)
/* 000040A8 4800012C */ b lbl_000041D4
lbl_000040AC:
/* 000040AC 887D000F */ lbz r3, 0xf(r29)
/* 000040B0 7C630774 */ extsb r3, r3
/* 000040B4 4BFFC0F9 */ bl destroy_sprite_with_tag
/* 000040B8 4800011C */ b lbl_000041D4
lbl_000040BC:
/* 000040BC 887F0001 */ lbz r3, 1(r31)
/* 000040C0 7C600774 */ extsb r0, r3
/* 000040C4 2C00001E */ cmpwi r0, 0x1e
/* 000040C8 40800048 */ bge lbl_00004110
/* 000040CC 38030001 */ addi r0, r3, 1
/* 000040D0 981F0001 */ stb r0, 1(r31)
/* 000040D4 3C600000 */ lis r3, lbl_0000C380@ha
/* 000040D8 3C004330 */ lis r0, 0x4330
/* 000040DC 889F0001 */ lbz r4, 1(r31)
/* 000040E0 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 000040E4 7C830774 */ extsb r3, r4
/* 000040E8 C05F0004 */ lfs f2, 4(r31)
/* 000040EC 5463083C */ slwi r3, r3, 1
/* 000040F0 6C638000 */ xoris r3, r3, 0x8000
/* 000040F4 90610014 */ stw r3, 0x14(r1)
/* 000040F8 90010010 */ stw r0, 0x10(r1)
/* 000040FC C8010010 */ lfd f0, 0x10(r1)
/* 00004100 EC000828 */ fsubs f0, f0, f1
/* 00004104 EC02002A */ fadds f0, f2, f0
/* 00004108 D01F0004 */ stfs f0, 4(r31)
/* 0000410C 480000C8 */ b lbl_000041D4
lbl_00004110:
/* 00004110 887D000F */ lbz r3, 0xf(r29)
/* 00004114 7C630774 */ extsb r3, r3
/* 00004118 4BFFC095 */ bl destroy_sprite_with_tag
/* 0000411C 480000B8 */ b lbl_000041D4
lbl_00004120:
/* 00004120 887F0001 */ lbz r3, 1(r31)
/* 00004124 7C600775 */ extsb. r0, r3
/* 00004128 40810048 */ ble lbl_00004170
/* 0000412C 7C600774 */ extsb r0, r3
/* 00004130 C05F0004 */ lfs f2, 4(r31)
/* 00004134 5400083C */ slwi r0, r0, 1
/* 00004138 6C008000 */ xoris r0, r0, 0x8000
/* 0000413C 90010014 */ stw r0, 0x14(r1)
/* 00004140 3C004330 */ lis r0, 0x4330
/* 00004144 3C600000 */ lis r3, lbl_0000C380@ha
/* 00004148 90010010 */ stw r0, 0x10(r1)
/* 0000414C C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00004150 C8010010 */ lfd f0, 0x10(r1)
/* 00004154 EC000828 */ fsubs f0, f0, f1
/* 00004158 EC02002A */ fadds f0, f2, f0
/* 0000415C D01F0004 */ stfs f0, 4(r31)
/* 00004160 887F0001 */ lbz r3, 1(r31)
/* 00004164 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004168 981F0001 */ stb r0, 1(r31)
/* 0000416C 48000068 */ b lbl_000041D4
lbl_00004170:
/* 00004170 C01E0000 */ lfs f0, 0(r30)
/* 00004174 D01F0004 */ stfs f0, 4(r31)
/* 00004178 4800005C */ b lbl_000041D4
lbl_0000417C:
/* 0000417C 887F0001 */ lbz r3, 1(r31)
/* 00004180 7C600775 */ extsb. r0, r3
/* 00004184 40810048 */ ble lbl_000041CC
/* 00004188 7C600774 */ extsb r0, r3
/* 0000418C C05F0004 */ lfs f2, 4(r31)
/* 00004190 5400083C */ slwi r0, r0, 1
/* 00004194 6C008000 */ xoris r0, r0, 0x8000
/* 00004198 90010014 */ stw r0, 0x14(r1)
/* 0000419C 3C004330 */ lis r0, 0x4330
/* 000041A0 3C600000 */ lis r3, lbl_0000C380@ha
/* 000041A4 90010010 */ stw r0, 0x10(r1)
/* 000041A8 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 000041AC C8010010 */ lfd f0, 0x10(r1)
/* 000041B0 EC000828 */ fsubs f0, f0, f1
/* 000041B4 EC020028 */ fsubs f0, f2, f0
/* 000041B8 D01F0004 */ stfs f0, 4(r31)
/* 000041BC 887F0001 */ lbz r3, 1(r31)
/* 000041C0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000041C4 981F0001 */ stb r0, 1(r31)
/* 000041C8 4800000C */ b lbl_000041D4
lbl_000041CC:
/* 000041CC C01E0000 */ lfs f0, 0(r30)
/* 000041D0 D01F0004 */ stfs f0, 4(r31)
lbl_000041D4:
/* 000041D4 C03F0008 */ lfs f1, 8(r31)
/* 000041D8 C81E0008 */ lfd f0, 8(r30)
/* 000041DC FC010032 */ fmul f0, f1, f0
/* 000041E0 FC000018 */ frsp f0, f0
/* 000041E4 D01F0008 */ stfs f0, 8(r31)
lbl_000041E8:
/* 000041E8 8001002C */ lwz r0, 0x2c(r1)
/* 000041EC 83E10024 */ lwz r31, 0x24(r1)
/* 000041F0 83C10020 */ lwz r30, 0x20(r1)
/* 000041F4 7C0803A6 */ mtlr r0
/* 000041F8 83A1001C */ lwz r29, 0x1c(r1)
/* 000041FC 38210028 */ addi r1, r1, 0x28
/* 00004200 4E800020 */ blr 
lbl_00004204:
/* 00004204 7C0802A6 */ mflr r0
/* 00004208 90010004 */ stw r0, 4(r1)
/* 0000420C 9421FFF8 */ stwu r1, -8(r1)
/* 00004210 4BFFFD5D */ bl lbl_00003F6C
/* 00004214 28030000 */ cmplwi r3, 0
/* 00004218 41820038 */ beq lbl_00004250
/* 0000421C 38000001 */ li r0, 1
/* 00004220 98030000 */ stb r0, 0(r3)
/* 00004224 3C800000 */ lis r4, lbl_0000C388@ha
/* 00004228 C0230004 */ lfs f1, 4(r3)
/* 0000422C C8040000 */ lfd f0, lbl_0000C388@l(r4)
/* 00004230 FC010040 */ fcmpo cr0, f1, f0
/* 00004234 4081001C */ ble lbl_00004250
/* 00004238 D0230008 */ stfs f1, 8(r3)
/* 0000423C 3C800000 */ lis r4, lbl_0000C370@ha
/* 00004240 38000000 */ li r0, 0
/* 00004244 C0040000 */ lfs f0, lbl_0000C370@l(r4)
/* 00004248 D0030004 */ stfs f0, 4(r3)
/* 0000424C 98030001 */ stb r0, 1(r3)
lbl_00004250:
/* 00004250 8001000C */ lwz r0, 0xc(r1)
/* 00004254 38210008 */ addi r1, r1, 8
/* 00004258 7C0803A6 */ mtlr r0
/* 0000425C 4E800020 */ blr 
lbl_00004260:
/* 00004260 7C0802A6 */ mflr r0
/* 00004264 90010004 */ stw r0, 4(r1)
/* 00004268 9421FFF8 */ stwu r1, -8(r1)
/* 0000426C 4BFFFD01 */ bl lbl_00003F6C
/* 00004270 28030000 */ cmplwi r3, 0
/* 00004274 41820038 */ beq lbl_000042AC
/* 00004278 38000002 */ li r0, 2
/* 0000427C 98030000 */ stb r0, 0(r3)
/* 00004280 3C800000 */ lis r4, lbl_0000C388@ha
/* 00004284 C0230004 */ lfs f1, 4(r3)
/* 00004288 C8040000 */ lfd f0, lbl_0000C388@l(r4)
/* 0000428C FC010040 */ fcmpo cr0, f1, f0
/* 00004290 4080001C */ bge lbl_000042AC
/* 00004294 D0230008 */ stfs f1, 8(r3)
/* 00004298 3C800000 */ lis r4, lbl_0000C370@ha
/* 0000429C 38000000 */ li r0, 0
/* 000042A0 C0040000 */ lfs f0, lbl_0000C370@l(r4)
/* 000042A4 D0030004 */ stfs f0, 4(r3)
/* 000042A8 98030001 */ stb r0, 1(r3)
lbl_000042AC:
/* 000042AC 8001000C */ lwz r0, 0xc(r1)
/* 000042B0 38210008 */ addi r1, r1, 8
/* 000042B4 7C0803A6 */ mtlr r0
/* 000042B8 4E800020 */ blr 
lbl_000042BC:
/* 000042BC 7C0802A6 */ mflr r0
/* 000042C0 90010004 */ stw r0, 4(r1)
/* 000042C4 3800000A */ li r0, 0xa
/* 000042C8 7C0903A6 */ mtctr r0
/* 000042CC 9421FF50 */ stwu r1, -0xb0(r1)
/* 000042D0 DBE100A8 */ stfd f31, 0xa8(r1)
/* 000042D4 38A1000C */ addi r5, r1, 0xc
/* 000042D8 DBC100A0 */ stfd f30, 0xa0(r1)
/* 000042DC DBA10098 */ stfd f29, 0x98(r1)
/* 000042E0 DB810090 */ stfd f28, 0x90(r1)
/* 000042E4 DB610088 */ stfd f27, 0x88(r1)
/* 000042E8 DB410080 */ stfd f26, 0x80(r1)
/* 000042EC DB210078 */ stfd f25, 0x78(r1)
/* 000042F0 DB010070 */ stfd f24, 0x70(r1)
/* 000042F4 93E1006C */ stw r31, 0x6c(r1)
/* 000042F8 93C10068 */ stw r30, 0x68(r1)
/* 000042FC 7C7E1B78 */ mr r30, r3
/* 00004300 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
/* 00004304 C0630010 */ lfs f3, 0x10(r3)
/* 00004308 C0030014 */ lfs f0, 0x14(r3)
/* 0000430C 3C600000 */ lis r3, lbl_0000C370@ha
/* 00004310 EF0100F2 */ fmuls f24, f1, f3
/* 00004314 3BE30000 */ addi r31, r3, lbl_0000C370@l
/* 00004318 EF620032 */ fmuls f27, f2, f0
lbl_0000431C:
/* 0000431C 84640008 */ lwzu r3, 8(r4)
/* 00004320 80040004 */ lwz r0, 4(r4)
/* 00004324 94650008 */ stwu r3, 8(r5)
/* 00004328 90050004 */ stw r0, 4(r5)
/* 0000432C 4200FFF0 */ bdnz lbl_0000431C
/* 00004330 C81F0038 */ lfd f0, 0x38(r31)
/* 00004334 38610014 */ addi r3, r1, 0x14
/* 00004338 FFE00824 */ fdiv f31, f0, f1
/* 0000433C FC00F818 */ frsp f0, f31
/* 00004340 D001002C */ stfs f0, 0x2c(r1)
/* 00004344 C81F0038 */ lfd f0, 0x38(r31)
/* 00004348 FFC01024 */ fdiv f30, f0, f2
/* 0000434C FC00F018 */ frsp f0, f30
/* 00004350 D0010030 */ stfs f0, 0x30(r1)
/* 00004354 C81F0040 */ lfd f0, 0x40(r31)
/* 00004358 FFA0F828 */ fsub f29, f0, f31
/* 0000435C FC00E818 */ frsp f0, f29
/* 00004360 D0010034 */ stfs f0, 0x34(r1)
/* 00004364 C81F0040 */ lfd f0, 0x40(r31)
/* 00004368 FF40F028 */ fsub f26, f0, f30
/* 0000436C FC00D018 */ frsp f0, f26
/* 00004370 D0010038 */ stfs f0, 0x38(r1)
/* 00004374 C81F0048 */ lfd f0, 0x48(r31)
/* 00004378 FC180028 */ fsub f0, f24, f0
/* 0000437C FF800824 */ fdiv f28, f0, f1
/* 00004380 FC00E018 */ frsp f0, f28
/* 00004384 D0010024 */ stfs f0, 0x24(r1)
/* 00004388 C81F0048 */ lfd f0, 0x48(r31)
/* 0000438C FC1B0028 */ fsub f0, f27, f0
/* 00004390 FF201024 */ fdiv f25, f0, f2
/* 00004394 FC00C818 */ frsp f0, f25
/* 00004398 D0010028 */ stfs f0, 0x28(r1)
/* 0000439C 4BFFBE11 */ bl draw_naomi_sprite
/* 000043A0 3800000A */ li r0, 0xa
/* 000043A4 7C0903A6 */ mtctr r0
/* 000043A8 38A1000C */ addi r5, r1, 0xc
/* 000043AC 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
lbl_000043B0:
/* 000043B0 84640008 */ lwzu r3, 8(r4)
/* 000043B4 80040004 */ lwz r0, 4(r4)
/* 000043B8 94650008 */ stwu r3, 8(r5)
/* 000043BC 90050004 */ stw r0, 4(r5)
/* 000043C0 4200FFF0 */ bdnz lbl_000043B0
/* 000043C4 C81F0058 */ lfd f0, 0x58(r31)
/* 000043C8 FC60F818 */ frsp f3, f31
/* 000043CC C09E0008 */ lfs f4, 8(r30)
/* 000043D0 FC40E818 */ frsp f2, f29
/* 000043D4 FF6006F2 */ fmul f27, f0, f27
/* 000043D8 C8BF0050 */ lfd f5, 0x50(r31)
/* 000043DC FC20F018 */ frsp f1, f30
/* 000043E0 38610014 */ addi r3, r1, 0x14
/* 000043E4 FC00E018 */ frsp f0, f28
/* 000043E8 FC84D828 */ fsub f4, f4, f27
/* 000043EC FC85202A */ fadd f4, f5, f4
/* 000043F0 FC802018 */ frsp f4, f4
/* 000043F4 D081001C */ stfs f4, 0x1c(r1)
/* 000043F8 D061002C */ stfs f3, 0x2c(r1)
/* 000043FC C07F0000 */ lfs f3, 0(r31)
/* 00004400 D0610030 */ stfs f3, 0x30(r1)
/* 00004404 D0410034 */ stfs f2, 0x34(r1)
/* 00004408 D0210038 */ stfs f1, 0x38(r1)
/* 0000440C D0010024 */ stfs f0, 0x24(r1)
/* 00004410 D0210028 */ stfs f1, 0x28(r1)
/* 00004414 4BFFBD99 */ bl draw_naomi_sprite
/* 00004418 3800000A */ li r0, 0xa
/* 0000441C 7C0903A6 */ mtctr r0
/* 00004420 38A1000C */ addi r5, r1, 0xc
/* 00004424 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
lbl_00004428:
/* 00004428 84640008 */ lwzu r3, 8(r4)
/* 0000442C 80040004 */ lwz r0, 4(r4)
/* 00004430 94650008 */ stwu r3, 8(r5)
/* 00004434 90050004 */ stw r0, 4(r5)
/* 00004438 4200FFF0 */ bdnz lbl_00004428
/* 0000443C C03E0008 */ lfs f1, 8(r30)
/* 00004440 FC80F818 */ frsp f4, f31
/* 00004444 C81F0050 */ lfd f0, 0x50(r31)
/* 00004448 FC60D018 */ frsp f3, f26
/* 0000444C FCA1D82A */ fadd f5, f1, f27
/* 00004450 FC40E818 */ frsp f2, f29
/* 00004454 FC20E018 */ frsp f1, f28
/* 00004458 38610014 */ addi r3, r1, 0x14
/* 0000445C FCA50028 */ fsub f5, f5, f0
/* 00004460 FC00F018 */ frsp f0, f30
/* 00004464 FCA02818 */ frsp f5, f5
/* 00004468 D0A1001C */ stfs f5, 0x1c(r1)
/* 0000446C D081002C */ stfs f4, 0x2c(r1)
/* 00004470 D0610030 */ stfs f3, 0x30(r1)
/* 00004474 D0410034 */ stfs f2, 0x34(r1)
/* 00004478 C05F0060 */ lfs f2, 0x60(r31)
/* 0000447C D0410038 */ stfs f2, 0x38(r1)
/* 00004480 D0210024 */ stfs f1, 0x24(r1)
/* 00004484 D0010028 */ stfs f0, 0x28(r1)
/* 00004488 4BFFBD25 */ bl draw_naomi_sprite
/* 0000448C 3800000A */ li r0, 0xa
/* 00004490 7C0903A6 */ mtctr r0
/* 00004494 38A1000C */ addi r5, r1, 0xc
/* 00004498 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
lbl_0000449C:
/* 0000449C 84640008 */ lwzu r3, 8(r4)
/* 000044A0 80040004 */ lwz r0, 4(r4)
/* 000044A4 94650008 */ stwu r3, 8(r5)
/* 000044A8 90050004 */ stw r0, 4(r5)
/* 000044AC 4200FFF0 */ bdnz lbl_0000449C
/* 000044B0 C81F0058 */ lfd f0, 0x58(r31)
/* 000044B4 FC60F018 */ frsp f3, f30
/* 000044B8 C09E0004 */ lfs f4, 4(r30)
/* 000044BC FC40F818 */ frsp f2, f31
/* 000044C0 FF800632 */ fmul f28, f0, f24
/* 000044C4 C8BF0050 */ lfd f5, 0x50(r31)
/* 000044C8 FC20D018 */ frsp f1, f26
/* 000044CC 38610014 */ addi r3, r1, 0x14
/* 000044D0 FC00C818 */ frsp f0, f25
/* 000044D4 FC84E028 */ fsub f4, f4, f28
/* 000044D8 FC85202A */ fadd f4, f5, f4
/* 000044DC FC802018 */ frsp f4, f4
/* 000044E0 D0810018 */ stfs f4, 0x18(r1)
/* 000044E4 C09F0000 */ lfs f4, 0(r31)
/* 000044E8 D081002C */ stfs f4, 0x2c(r1)
/* 000044EC D0610030 */ stfs f3, 0x30(r1)
/* 000044F0 D0410034 */ stfs f2, 0x34(r1)
/* 000044F4 D0210038 */ stfs f1, 0x38(r1)
/* 000044F8 D0410024 */ stfs f2, 0x24(r1)
/* 000044FC D0010028 */ stfs f0, 0x28(r1)
/* 00004500 4BFFBCAD */ bl draw_naomi_sprite
/* 00004504 3800000A */ li r0, 0xa
/* 00004508 7C0903A6 */ mtctr r0
/* 0000450C 38A1000C */ addi r5, r1, 0xc
/* 00004510 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
lbl_00004514:
/* 00004514 84640008 */ lwzu r3, 8(r4)
/* 00004518 80040004 */ lwz r0, 4(r4)
/* 0000451C 94650008 */ stwu r3, 8(r5)
/* 00004520 90050004 */ stw r0, 4(r5)
/* 00004524 4200FFF0 */ bdnz lbl_00004514
/* 00004528 C03E0004 */ lfs f1, 4(r30)
/* 0000452C FC80E818 */ frsp f4, f29
/* 00004530 C81F0050 */ lfd f0, 0x50(r31)
/* 00004534 FC60F018 */ frsp f3, f30
/* 00004538 FCA1E02A */ fadd f5, f1, f28
/* 0000453C FC40D018 */ frsp f2, f26
/* 00004540 FC20F818 */ frsp f1, f31
/* 00004544 38610014 */ addi r3, r1, 0x14
/* 00004548 FCA50028 */ fsub f5, f5, f0
/* 0000454C FC00C818 */ frsp f0, f25
/* 00004550 FCA02818 */ frsp f5, f5
/* 00004554 D0A10018 */ stfs f5, 0x18(r1)
/* 00004558 D081002C */ stfs f4, 0x2c(r1)
/* 0000455C D0610030 */ stfs f3, 0x30(r1)
/* 00004560 C07F0060 */ lfs f3, 0x60(r31)
/* 00004564 D0610034 */ stfs f3, 0x34(r1)
/* 00004568 D0410038 */ stfs f2, 0x38(r1)
/* 0000456C D0210024 */ stfs f1, 0x24(r1)
/* 00004570 D0010028 */ stfs f0, 0x28(r1)
/* 00004574 4BFFBC39 */ bl draw_naomi_sprite
/* 00004578 3800000A */ li r0, 0xa
/* 0000457C 7C0903A6 */ mtctr r0
/* 00004580 38A1000C */ addi r5, r1, 0xc
/* 00004584 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
lbl_00004588:
/* 00004588 84640008 */ lwzu r3, 8(r4)
/* 0000458C 80040004 */ lwz r0, 4(r4)
/* 00004590 94650008 */ stwu r3, 8(r5)
/* 00004594 90050004 */ stw r0, 4(r5)
/* 00004598 4200FFF0 */ bdnz lbl_00004588
/* 0000459C C05E0004 */ lfs f2, 4(r30)
/* 000045A0 FC20F818 */ frsp f1, f31
/* 000045A4 C87F0050 */ lfd f3, 0x50(r31)
/* 000045A8 FC00F018 */ frsp f0, f30
/* 000045AC FC42E028 */ fsub f2, f2, f28
/* 000045B0 38610014 */ addi r3, r1, 0x14
/* 000045B4 FC43102A */ fadd f2, f3, f2
/* 000045B8 FC401018 */ frsp f2, f2
/* 000045BC D0410018 */ stfs f2, 0x18(r1)
/* 000045C0 C05E0008 */ lfs f2, 8(r30)
/* 000045C4 C87F0050 */ lfd f3, 0x50(r31)
/* 000045C8 FC42D828 */ fsub f2, f2, f27
/* 000045CC FC43102A */ fadd f2, f3, f2
/* 000045D0 FC401018 */ frsp f2, f2
/* 000045D4 D041001C */ stfs f2, 0x1c(r1)
/* 000045D8 C05F0000 */ lfs f2, 0(r31)
/* 000045DC D041002C */ stfs f2, 0x2c(r1)
/* 000045E0 C05F0000 */ lfs f2, 0(r31)
/* 000045E4 D0410030 */ stfs f2, 0x30(r1)
/* 000045E8 D0210034 */ stfs f1, 0x34(r1)
/* 000045EC D0010038 */ stfs f0, 0x38(r1)
/* 000045F0 D0210024 */ stfs f1, 0x24(r1)
/* 000045F4 D0010028 */ stfs f0, 0x28(r1)
/* 000045F8 4BFFBBB5 */ bl draw_naomi_sprite
/* 000045FC 3800000A */ li r0, 0xa
/* 00004600 7C0903A6 */ mtctr r0
/* 00004604 38A1000C */ addi r5, r1, 0xc
/* 00004608 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
lbl_0000460C:
/* 0000460C 84640008 */ lwzu r3, 8(r4)
/* 00004610 80040004 */ lwz r0, 4(r4)
/* 00004614 94650008 */ stwu r3, 8(r5)
/* 00004618 90050004 */ stw r0, 4(r5)
/* 0000461C 4200FFF0 */ bdnz lbl_0000460C
/* 00004620 C01E0004 */ lfs f0, 4(r30)
/* 00004624 FC40E818 */ frsp f2, f29
/* 00004628 C87F0050 */ lfd f3, 0x50(r31)
/* 0000462C FC20F018 */ frsp f1, f30
/* 00004630 FC80E02A */ fadd f4, f0, f28
/* 00004634 FC00F818 */ frsp f0, f31
/* 00004638 38610014 */ addi r3, r1, 0x14
/* 0000463C FC641828 */ fsub f3, f4, f3
/* 00004640 FC601818 */ frsp f3, f3
/* 00004644 D0610018 */ stfs f3, 0x18(r1)
/* 00004648 C07E0008 */ lfs f3, 8(r30)
/* 0000464C C89F0050 */ lfd f4, 0x50(r31)
/* 00004650 FC63D828 */ fsub f3, f3, f27
/* 00004654 FC64182A */ fadd f3, f4, f3
/* 00004658 FC601818 */ frsp f3, f3
/* 0000465C D061001C */ stfs f3, 0x1c(r1)
/* 00004660 D041002C */ stfs f2, 0x2c(r1)
/* 00004664 C05F0000 */ lfs f2, 0(r31)
/* 00004668 D0410030 */ stfs f2, 0x30(r1)
/* 0000466C C05F0060 */ lfs f2, 0x60(r31)
/* 00004670 D0410034 */ stfs f2, 0x34(r1)
/* 00004674 D0210038 */ stfs f1, 0x38(r1)
/* 00004678 D0010024 */ stfs f0, 0x24(r1)
/* 0000467C D0210028 */ stfs f1, 0x28(r1)
/* 00004680 4BFFBB2D */ bl draw_naomi_sprite
/* 00004684 3800000A */ li r0, 0xa
/* 00004688 7C0903A6 */ mtctr r0
/* 0000468C 38A1000C */ addi r5, r1, 0xc
/* 00004690 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
lbl_00004694:
/* 00004694 84640008 */ lwzu r3, 8(r4)
/* 00004698 80040004 */ lwz r0, 4(r4)
/* 0000469C 94650008 */ stwu r3, 8(r5)
/* 000046A0 90050004 */ stw r0, 4(r5)
/* 000046A4 4200FFF0 */ bdnz lbl_00004694
/* 000046A8 C01E0004 */ lfs f0, 4(r30)
/* 000046AC FC20D018 */ frsp f1, f26
/* 000046B0 C89F0050 */ lfd f4, 0x50(r31)
/* 000046B4 FC40F818 */ frsp f2, f31
/* 000046B8 FC60E028 */ fsub f3, f0, f28
/* 000046BC FC00F018 */ frsp f0, f30
/* 000046C0 38610014 */ addi r3, r1, 0x14
/* 000046C4 FC64182A */ fadd f3, f4, f3
/* 000046C8 FC601818 */ frsp f3, f3
/* 000046CC D0610018 */ stfs f3, 0x18(r1)
/* 000046D0 C09E0008 */ lfs f4, 8(r30)
/* 000046D4 C87F0050 */ lfd f3, 0x50(r31)
/* 000046D8 FC84D82A */ fadd f4, f4, f27
/* 000046DC FC641828 */ fsub f3, f4, f3
/* 000046E0 FC601818 */ frsp f3, f3
/* 000046E4 D061001C */ stfs f3, 0x1c(r1)
/* 000046E8 C07F0000 */ lfs f3, 0(r31)
/* 000046EC D061002C */ stfs f3, 0x2c(r1)
/* 000046F0 D0210030 */ stfs f1, 0x30(r1)
/* 000046F4 D0410034 */ stfs f2, 0x34(r1)
/* 000046F8 C03F0060 */ lfs f1, 0x60(r31)
/* 000046FC D0210038 */ stfs f1, 0x38(r1)
/* 00004700 D0410024 */ stfs f2, 0x24(r1)
/* 00004704 D0010028 */ stfs f0, 0x28(r1)
/* 00004708 4BFFBAA5 */ bl draw_naomi_sprite
/* 0000470C 3800000A */ li r0, 0xa
/* 00004710 7C0903A6 */ mtctr r0
/* 00004714 38A1000C */ addi r5, r1, 0xc
/* 00004718 389EFFF8 */ addi r4, r30, -8  ;# fixed addi
lbl_0000471C:
/* 0000471C 84640008 */ lwzu r3, 8(r4)
/* 00004720 80040004 */ lwz r0, 4(r4)
/* 00004724 94650008 */ stwu r3, 8(r5)
/* 00004728 90050004 */ stw r0, 4(r5)
/* 0000472C 4200FFF0 */ bdnz lbl_0000471C
/* 00004730 C01E0004 */ lfs f0, 4(r30)
/* 00004734 FC60E818 */ frsp f3, f29
/* 00004738 C89F0050 */ lfd f4, 0x50(r31)
/* 0000473C FC40D018 */ frsp f2, f26
/* 00004740 FCA0E02A */ fadd f5, f0, f28
/* 00004744 FC20F818 */ frsp f1, f31
/* 00004748 FC00F018 */ frsp f0, f30
/* 0000474C 38610014 */ addi r3, r1, 0x14
/* 00004750 FC852028 */ fsub f4, f5, f4
/* 00004754 FC802018 */ frsp f4, f4
/* 00004758 D0810018 */ stfs f4, 0x18(r1)
/* 0000475C C0BE0008 */ lfs f5, 8(r30)
/* 00004760 C89F0050 */ lfd f4, 0x50(r31)
/* 00004764 FCA5D82A */ fadd f5, f5, f27
/* 00004768 FC852028 */ fsub f4, f5, f4
/* 0000476C FC802018 */ frsp f4, f4
/* 00004770 D081001C */ stfs f4, 0x1c(r1)
/* 00004774 D061002C */ stfs f3, 0x2c(r1)
/* 00004778 D0410030 */ stfs f2, 0x30(r1)
/* 0000477C C05F0060 */ lfs f2, 0x60(r31)
/* 00004780 D0410034 */ stfs f2, 0x34(r1)
/* 00004784 C05F0060 */ lfs f2, 0x60(r31)
/* 00004788 D0410038 */ stfs f2, 0x38(r1)
/* 0000478C D0210024 */ stfs f1, 0x24(r1)
/* 00004790 D0010028 */ stfs f0, 0x28(r1)
/* 00004794 4BFFBA19 */ bl draw_naomi_sprite
/* 00004798 800100B4 */ lwz r0, 0xb4(r1)
/* 0000479C CBE100A8 */ lfd f31, 0xa8(r1)
/* 000047A0 CBC100A0 */ lfd f30, 0xa0(r1)
/* 000047A4 7C0803A6 */ mtlr r0
/* 000047A8 CBA10098 */ lfd f29, 0x98(r1)
/* 000047AC CB810090 */ lfd f28, 0x90(r1)
/* 000047B0 CB610088 */ lfd f27, 0x88(r1)
/* 000047B4 CB410080 */ lfd f26, 0x80(r1)
/* 000047B8 CB210078 */ lfd f25, 0x78(r1)
/* 000047BC CB010070 */ lfd f24, 0x70(r1)
/* 000047C0 83E1006C */ lwz r31, 0x6c(r1)
/* 000047C4 83C10068 */ lwz r30, 0x68(r1)
/* 000047C8 382100B0 */ addi r1, r1, 0xb0
/* 000047CC 4E800020 */ blr 
lbl_000047D0:
/* 000047D0 7C0802A6 */ mflr r0
/* 000047D4 3C600000 */ lis r3, lbl_0000C370@ha
/* 000047D8 90010004 */ stw r0, 4(r1)
/* 000047DC 9421FFF0 */ stwu r1, -0x10(r1)
/* 000047E0 93E1000C */ stw r31, 0xc(r1)
/* 000047E4 3BE30000 */ addi r31, r3, lbl_0000C370@l
/* 000047E8 4BFFB9C5 */ bl create_sprite
/* 000047EC 7C651B79 */ or. r5, r3, r3
/* 000047F0 41820054 */ beq lbl_00004844
/* 000047F4 38000001 */ li r0, 1
/* 000047F8 4CC63182 */ crclr 6
/* 000047FC 98050000 */ stb r0, 0(r5)
/* 00004800 38000404 */ li r0, 0x404
/* 00004804 3C600000 */ lis r3, lbl_0000CA30@ha
/* 00004808 B005003C */ sth r0, 0x3c(r5)
/* 0000480C 38830000 */ addi r4, r3, lbl_0000CA30@l
/* 00004810 38000004 */ li r0, 4
/* 00004814 C01F0064 */ lfs f0, 0x64(r31)
/* 00004818 3865008C */ addi r3, r5, 0x8c
/* 0000481C D0050004 */ stfs f0, 4(r5)
/* 00004820 C01F0068 */ lfs f0, 0x68(r31)
/* 00004824 D0050008 */ stfs f0, 8(r5)
/* 00004828 C01F006C */ lfs f0, 0x6c(r31)
/* 0000482C D005004C */ stfs f0, 0x4c(r5)
/* 00004830 98050003 */ stb r0, 3(r5)
/* 00004834 80050074 */ lwz r0, 0x74(r5)
/* 00004838 64000004 */ oris r0, r0, 4
/* 0000483C 90050074 */ stw r0, 0x74(r5)
/* 00004840 4BFFB96D */ bl sprintf
lbl_00004844:
/* 00004844 80010014 */ lwz r0, 0x14(r1)
/* 00004848 83E1000C */ lwz r31, 0xc(r1)
/* 0000484C 38210010 */ addi r1, r1, 0x10
/* 00004850 7C0803A6 */ mtlr r0
/* 00004854 4E800020 */ blr 
lbl_00004858:
/* 00004858 7C0802A6 */ mflr r0
/* 0000485C 3CA00000 */ lis r5, lbl_0000C370@ha
/* 00004860 90010004 */ stw r0, 4(r1)
/* 00004864 9421FFE0 */ stwu r1, -0x20(r1)
/* 00004868 93E1001C */ stw r31, 0x1c(r1)
/* 0000486C 3BE50000 */ addi r31, r5, lbl_0000C370@l
/* 00004870 93C10018 */ stw r30, 0x18(r1)
/* 00004874 83C4002C */ lwz r30, 0x2c(r4)
/* 00004878 4BFFF779 */ bl lbl_00003FF0
/* 0000487C 801E0014 */ lwz r0, 0x14(r30)
/* 00004880 3C600000 */ lis r3, lbl_0000C380@ha
/* 00004884 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00004888 3C800000 */ lis r4, lbl_10000000@ha
/* 0000488C 6C008000 */ xoris r0, r0, 0x8000
/* 00004890 90010014 */ stw r0, 0x14(r1)
/* 00004894 3C004330 */ lis r0, 0x4330
/* 00004898 38640000 */ addi r3, r4, lbl_10000000@l
/* 0000489C C85F0080 */ lfd f2, 0x80(r31)
/* 000048A0 90010010 */ stw r0, 0x10(r1)
/* 000048A4 C87F0078 */ lfd f3, 0x78(r31)
/* 000048A8 C8010010 */ lfd f0, 0x10(r1)
/* 000048AC C89F0070 */ lfd f4, 0x70(r31)
/* 000048B0 FC000828 */ fsub f0, f0, f1
/* 000048B4 C4A30048 */ lfsu f5, 0x48(r3)
/* 000048B8 C83F0058 */ lfd f1, 0x58(r31)
/* 000048BC FC020032 */ fmul f0, f2, f0
/* 000048C0 FC03002A */ fadd f0, f3, f0
/* 000048C4 FC04002A */ fadd f0, f4, f0
/* 000048C8 FC002828 */ fsub f0, f0, f5
/* 000048CC FC010032 */ fmul f0, f1, f0
/* 000048D0 FC05002A */ fadd f0, f5, f0
/* 000048D4 FC000018 */ frsp f0, f0
/* 000048D8 D0030000 */ stfs f0, 0(r3)
/* 000048DC 80010024 */ lwz r0, 0x24(r1)
/* 000048E0 83E1001C */ lwz r31, 0x1c(r1)
/* 000048E4 83C10018 */ lwz r30, 0x18(r1)
/* 000048E8 7C0803A6 */ mtlr r0
/* 000048EC 38210020 */ addi r1, r1, 0x20
/* 000048F0 4E800020 */ blr 
lbl_000048F4:
/* 000048F4 7C0802A6 */ mflr r0
/* 000048F8 7C651B78 */ mr r5, r3
/* 000048FC 90010004 */ stw r0, 4(r1)
/* 00004900 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00004904 9421FF00 */ stwu r1, -0x100(r1)
/* 00004908 BF0100E0 */ stmw r24, 0xe0(r1)
/* 0000490C 3B640000 */ addi r27, r4, lbl_0000C8F0@l
/* 00004910 3C800000 */ lis r4, lbl_0000C370@ha
/* 00004914 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00004918 8863000F */ lbz r3, 0xf(r3)
/* 0000491C 83A5002C */ lwz r29, 0x2c(r5)
/* 00004920 7C630774 */ extsb r3, r3
/* 00004924 4BFFF649 */ bl lbl_00003F6C
/* 00004928 28030000 */ cmplwi r3, 0
/* 0000492C 41820040 */ beq lbl_0000496C
/* 00004930 C05F0000 */ lfs f2, 0(r31)
/* 00004934 C0230004 */ lfs f1, 4(r3)
/* 00004938 C0030008 */ lfs f0, 8(r3)
/* 0000493C FC601090 */ fmr f3, f2
/* 00004940 EC21002A */ fadds f1, f1, f0
/* 00004944 4BFFB869 */ bl mathutil_mtxA_from_translate_xyz
/* 00004948 3C600000 */ lis r3, lbl_10000000@ha
/* 0000494C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00004950 38630184 */ addi r3, r3, 0x184
/* 00004954 4BFFB859 */ bl mathutil_mtxA_to_mtx
/* 00004958 3C600000 */ lis r3, mathutilData@ha
/* 0000495C 38630000 */ addi r3, r3, mathutilData@l
/* 00004960 80630000 */ lwz r3, 0(r3)
/* 00004964 38800000 */ li r4, 0
/* 00004968 4BFFB845 */ bl GXLoadPosMtxImm
lbl_0000496C:
/* 0000496C 7F63DB78 */ mr r3, r27
/* 00004970 4BFFB83D */ bl draw_naomi_sprite
/* 00004974 387B00F0 */ addi r3, r27, 0xf0
/* 00004978 4BFFB835 */ bl draw_naomi_sprite
/* 0000497C C01F0088 */ lfs f0, 0x88(r31)
/* 00004980 3BC1009C */ addi r30, r1, 0x9c
/* 00004984 38C000B3 */ li r6, 0xb3
/* 00004988 D001005C */ stfs f0, 0x5c(r1)
/* 0000498C 388000FF */ li r4, 0xff
/* 00004990 38A00000 */ li r5, 0
/* 00004994 C01F0060 */ lfs f0, 0x60(r31)
/* 00004998 3C000020 */ lis r0, 0x20
/* 0000499C 387E0000 */ addi r3, r30, 0
/* 000049A0 D0010050 */ stfs f0, 0x50(r1)
/* 000049A4 C01F0060 */ lfs f0, 0x60(r31)
/* 000049A8 D0010054 */ stfs f0, 0x54(r1)
/* 000049AC 98C10011 */ stb r6, 0x11(r1)
/* 000049B0 9881001C */ stb r4, 0x1c(r1)
/* 000049B4 9881001D */ stb r4, 0x1d(r1)
/* 000049B8 389B0370 */ addi r4, r27, 0x370
/* 000049BC 98A1001E */ stb r5, 0x1e(r1)
/* 000049C0 98A10080 */ stb r5, 0x80(r1)
/* 000049C4 98A10081 */ stb r5, 0x81(r1)
/* 000049C8 98A10082 */ stb r5, 0x82(r1)
/* 000049CC 90010084 */ stw r0, 0x84(r1)
/* 000049D0 C01F008C */ lfs f0, 0x8c(r31)
/* 000049D4 D0010014 */ stfs f0, 0x14(r1)
/* 000049D8 C01F0090 */ lfs f0, 0x90(r31)
/* 000049DC D0010018 */ stfs f0, 0x18(r1)
/* 000049E0 4BFFB7CD */ bl strcpy
/* 000049E4 4BFFB7C9 */ bl reset_text_draw_settings
/* 000049E8 88610011 */ lbz r3, 0x11(r1)
/* 000049EC 4BFFB7C1 */ bl set_text_font
/* 000049F0 C0210050 */ lfs f1, 0x50(r1)
/* 000049F4 C0410054 */ lfs f2, 0x54(r1)
/* 000049F8 4BFFB7B5 */ bl set_text_scale
/* 000049FC 80610084 */ lwz r3, 0x84(r1)
/* 00004A00 4BFFB7AD */ bl func_80071B50
/* 00004A04 C83F0028 */ lfd f1, 0x28(r31)
/* 00004A08 C001005C */ lfs f0, 0x5c(r1)
/* 00004A0C FC21002A */ fadd f1, f1, f0
/* 00004A10 FC200818 */ frsp f1, f1
/* 00004A14 4BFFB799 */ bl func_80071B1C
/* 00004A18 38600000 */ li r3, 0
/* 00004A1C 4BFFB791 */ bl set_text_mul_color
/* 00004A20 88010081 */ lbz r0, 0x81(r1)
/* 00004A24 88610080 */ lbz r3, 0x80(r1)
/* 00004A28 5400402E */ slwi r0, r0, 8
/* 00004A2C 88810082 */ lbz r4, 0x82(r1)
/* 00004A30 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004A34 7C830378 */ or r3, r4, r0
/* 00004A38 4BFFB775 */ bl set_text_add_color
/* 00004A3C C85F0030 */ lfd f2, 0x30(r31)
/* 00004A40 C0210014 */ lfs f1, 0x14(r1)
/* 00004A44 C0010018 */ lfs f0, 0x18(r1)
/* 00004A48 FC22082A */ fadd f1, f2, f1
/* 00004A4C FC42002A */ fadd f2, f2, f0
/* 00004A50 FC200818 */ frsp f1, f1
/* 00004A54 FC401018 */ frsp f2, f2
/* 00004A58 4BFFB755 */ bl set_text_pos
/* 00004A5C 7FC3F378 */ mr r3, r30
/* 00004A60 4BFFB74D */ bl u_draw_text
/* 00004A64 C021005C */ lfs f1, 0x5c(r1)
/* 00004A68 4BFFB745 */ bl func_80071B1C
/* 00004A6C 8801001D */ lbz r0, 0x1d(r1)
/* 00004A70 8861001C */ lbz r3, 0x1c(r1)
/* 00004A74 5400402E */ slwi r0, r0, 8
/* 00004A78 8881001E */ lbz r4, 0x1e(r1)
/* 00004A7C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004A80 7C830378 */ or r3, r4, r0
/* 00004A84 4BFFB729 */ bl set_text_mul_color
/* 00004A88 88010081 */ lbz r0, 0x81(r1)
/* 00004A8C 88610080 */ lbz r3, 0x80(r1)
/* 00004A90 5400402E */ slwi r0, r0, 8
/* 00004A94 88810082 */ lbz r4, 0x82(r1)
/* 00004A98 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004A9C 7C830378 */ or r3, r4, r0
/* 00004AA0 4BFFB70D */ bl set_text_add_color
/* 00004AA4 C0210014 */ lfs f1, 0x14(r1)
/* 00004AA8 C0410018 */ lfs f2, 0x18(r1)
/* 00004AAC 4BFFB701 */ bl set_text_pos
/* 00004AB0 7FC3F378 */ mr r3, r30
/* 00004AB4 4BFFB6F9 */ bl u_draw_text
/* 00004AB8 C03F0094 */ lfs f1, 0x94(r31)
/* 00004ABC 387B00A0 */ addi r3, r27, 0xa0
/* 00004AC0 C05F0098 */ lfs f2, 0x98(r31)
/* 00004AC4 4BFFF7F9 */ bl lbl_000042BC
/* 00004AC8 C01F009C */ lfs f0, 0x9c(r31)
/* 00004ACC 3C800000 */ lis r4, lbl_10000000@ha
/* 00004AD0 38840000 */ addi r4, r4, lbl_10000000@l
/* 00004AD4 D01B0054 */ stfs f0, 0x54(r27)
/* 00004AD8 387B0050 */ addi r3, r27, 0x50
/* 00004ADC C0040048 */ lfs f0, 0x48(r4)
/* 00004AE0 D01B0058 */ stfs f0, 0x58(r27)
/* 00004AE4 4BFFB6C9 */ bl draw_naomi_sprite
/* 00004AE8 3B000000 */ li r24, 0
/* 00004AEC 5700103A */ slwi r0, r24, 2
/* 00004AF0 7F5B0214 */ add r26, r27, r0
/* 00004AF4 3F804330 */ lis r28, 0x4330
/* 00004AF8 3B5A01A0 */ addi r26, r26, 0x1a0
lbl_00004AFC:
/* 00004AFC 6F008000 */ xoris r0, r24, 0x8000
/* 00004B00 C01F00A0 */ lfs f0, 0xa0(r31)
/* 00004B04 900100DC */ stw r0, 0xdc(r1)
/* 00004B08 3C800000 */ lis r4, lbl_0000C380@ha
/* 00004B0C 38600000 */ li r3, 0
/* 00004B10 D0010014 */ stfs f0, 0x14(r1)
/* 00004B14 938100D8 */ stw r28, 0xd8(r1)
/* 00004B18 C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00004B1C C80100D8 */ lfd f0, 0xd8(r1)
/* 00004B20 C85F0080 */ lfd f2, 0x80(r31)
/* 00004B24 FC000828 */ fsub f0, f0, f1
/* 00004B28 C83F0078 */ lfd f1, 0x78(r31)
/* 00004B2C FC020032 */ fmul f0, f2, f0
/* 00004B30 FC01002A */ fadd f0, f1, f0
/* 00004B34 FC000018 */ frsp f0, f0
/* 00004B38 D0010018 */ stfs f0, 0x18(r1)
/* 00004B3C 98610080 */ stb r3, 0x80(r1)
/* 00004B40 98610081 */ stb r3, 0x81(r1)
/* 00004B44 98610082 */ stb r3, 0x82(r1)
/* 00004B48 801D0014 */ lwz r0, 0x14(r29)
/* 00004B4C 7C00C000 */ cmpw r0, r24
/* 00004B50 40820018 */ bne lbl_00004B68
/* 00004B54 380000FF */ li r0, 0xff
/* 00004B58 9801001C */ stb r0, 0x1c(r1)
/* 00004B5C 9801001D */ stb r0, 0x1d(r1)
/* 00004B60 9861001E */ stb r3, 0x1e(r1)
/* 00004B64 48000014 */ b lbl_00004B78
lbl_00004B68:
/* 00004B68 3800008F */ li r0, 0x8f
/* 00004B6C 9801001C */ stb r0, 0x1c(r1)
/* 00004B70 9801001D */ stb r0, 0x1d(r1)
/* 00004B74 9861001E */ stb r3, 0x1e(r1)
lbl_00004B78:
/* 00004B78 7FC3F378 */ mr r3, r30
/* 00004B7C 809A0000 */ lwz r4, 0(r26)
/* 00004B80 4BFFB62D */ bl strcpy
/* 00004B84 4BFFB629 */ bl reset_text_draw_settings
/* 00004B88 88610011 */ lbz r3, 0x11(r1)
/* 00004B8C 4BFFB621 */ bl set_text_font
/* 00004B90 C0210050 */ lfs f1, 0x50(r1)
/* 00004B94 C0410054 */ lfs f2, 0x54(r1)
/* 00004B98 4BFFB615 */ bl set_text_scale
/* 00004B9C 80610084 */ lwz r3, 0x84(r1)
/* 00004BA0 4BFFB60D */ bl func_80071B50
/* 00004BA4 C83F0028 */ lfd f1, 0x28(r31)
/* 00004BA8 C001005C */ lfs f0, 0x5c(r1)
/* 00004BAC FC21002A */ fadd f1, f1, f0
/* 00004BB0 FC200818 */ frsp f1, f1
/* 00004BB4 4BFFB5F9 */ bl func_80071B1C
/* 00004BB8 38600000 */ li r3, 0
/* 00004BBC 4BFFB5F1 */ bl set_text_mul_color
/* 00004BC0 88010081 */ lbz r0, 0x81(r1)
/* 00004BC4 88610080 */ lbz r3, 0x80(r1)
/* 00004BC8 5400402E */ slwi r0, r0, 8
/* 00004BCC 88810082 */ lbz r4, 0x82(r1)
/* 00004BD0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004BD4 7C830378 */ or r3, r4, r0
/* 00004BD8 4BFFB5D5 */ bl set_text_add_color
/* 00004BDC C85F0030 */ lfd f2, 0x30(r31)
/* 00004BE0 C0210014 */ lfs f1, 0x14(r1)
/* 00004BE4 C0010018 */ lfs f0, 0x18(r1)
/* 00004BE8 FC22082A */ fadd f1, f2, f1
/* 00004BEC FC42002A */ fadd f2, f2, f0
/* 00004BF0 FC200818 */ frsp f1, f1
/* 00004BF4 FC401018 */ frsp f2, f2
/* 00004BF8 4BFFB5B5 */ bl set_text_pos
/* 00004BFC 7FC3F378 */ mr r3, r30
/* 00004C00 4BFFB5AD */ bl u_draw_text
/* 00004C04 C021005C */ lfs f1, 0x5c(r1)
/* 00004C08 4BFFB5A5 */ bl func_80071B1C
/* 00004C0C 8801001D */ lbz r0, 0x1d(r1)
/* 00004C10 8861001C */ lbz r3, 0x1c(r1)
/* 00004C14 5400402E */ slwi r0, r0, 8
/* 00004C18 8881001E */ lbz r4, 0x1e(r1)
/* 00004C1C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004C20 7C830378 */ or r3, r4, r0
/* 00004C24 4BFFB589 */ bl set_text_mul_color
/* 00004C28 88010081 */ lbz r0, 0x81(r1)
/* 00004C2C 88610080 */ lbz r3, 0x80(r1)
/* 00004C30 5400402E */ slwi r0, r0, 8
/* 00004C34 88810082 */ lbz r4, 0x82(r1)
/* 00004C38 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004C3C 7C830378 */ or r3, r4, r0
/* 00004C40 4BFFB56D */ bl set_text_add_color
/* 00004C44 C0210014 */ lfs f1, 0x14(r1)
/* 00004C48 C0410018 */ lfs f2, 0x18(r1)
/* 00004C4C 4BFFB561 */ bl set_text_pos
/* 00004C50 7FC3F378 */ mr r3, r30
/* 00004C54 4BFFB559 */ bl u_draw_text
/* 00004C58 3B180001 */ addi r24, r24, 1
/* 00004C5C 28180007 */ cmplwi r24, 7
/* 00004C60 3B5A0004 */ addi r26, r26, 4
/* 00004C64 4180FE98 */ blt lbl_00004AFC
/* 00004C68 380000FF */ li r0, 0xff
/* 00004C6C 9801001C */ stb r0, 0x1c(r1)
/* 00004C70 3B000000 */ li r24, 0
/* 00004C74 7F19C378 */ mr r25, r24
/* 00004C78 9801001D */ stb r0, 0x1d(r1)
/* 00004C7C 571A1838 */ slwi r26, r24, 3
/* 00004C80 3F804330 */ lis r28, 0x4330
/* 00004C84 9B01001E */ stb r24, 0x1e(r1)
/* 00004C88 9B010080 */ stb r24, 0x80(r1)
/* 00004C8C 9B010081 */ stb r24, 0x81(r1)
/* 00004C90 9B010082 */ stb r24, 0x82(r1)
/* 00004C94 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00004C98 D0010050 */ stfs f0, 0x50(r1)
/* 00004C9C 801D0014 */ lwz r0, 0x14(r29)
/* 00004CA0 54001838 */ slwi r0, r0, 3
/* 00004CA4 7F7B0214 */ add r27, r27, r0
/* 00004CA8 3B7B0338 */ addi r27, r27, 0x338
/* 00004CAC 480001D0 */ b lbl_00004E7C
lbl_00004CB0:
/* 00004CB0 809B0000 */ lwz r4, 0(r27)
/* 00004CB4 7FC3F378 */ mr r3, r30
/* 00004CB8 7C84D02E */ lwzx r4, r4, r26
/* 00004CBC 4BFFB4F1 */ bl strcpy
/* 00004CC0 4BFFB4ED */ bl reset_text_draw_settings
/* 00004CC4 88610011 */ lbz r3, 0x11(r1)
/* 00004CC8 4BFFB4E5 */ bl set_text_font
/* 00004CCC C0210050 */ lfs f1, 0x50(r1)
/* 00004CD0 C0410054 */ lfs f2, 0x54(r1)
/* 00004CD4 4BFFB4D9 */ bl set_text_scale
/* 00004CD8 80610084 */ lwz r3, 0x84(r1)
/* 00004CDC 4BFFB4D1 */ bl func_80071B50
/* 00004CE0 C021005C */ lfs f1, 0x5c(r1)
/* 00004CE4 4BFFB4C9 */ bl func_80071B1C
/* 00004CE8 8801001D */ lbz r0, 0x1d(r1)
/* 00004CEC 8861001C */ lbz r3, 0x1c(r1)
/* 00004CF0 5400402E */ slwi r0, r0, 8
/* 00004CF4 8881001E */ lbz r4, 0x1e(r1)
/* 00004CF8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004CFC 7C830378 */ or r3, r4, r0
/* 00004D00 4BFFB4AD */ bl set_text_mul_color
/* 00004D04 88010081 */ lbz r0, 0x81(r1)
/* 00004D08 88610080 */ lbz r3, 0x80(r1)
/* 00004D0C 5400402E */ slwi r0, r0, 8
/* 00004D10 88810082 */ lbz r4, 0x82(r1)
/* 00004D14 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004D18 7C830378 */ or r3, r4, r0
/* 00004D1C 4BFFB491 */ bl set_text_add_color
/* 00004D20 7FC3F378 */ mr r3, r30
/* 00004D24 4BFFB489 */ bl u_get_text_width
/* 00004D28 C81F0058 */ lfd f0, 0x58(r31)
/* 00004D2C 6F208000 */ xoris r0, r25, 0x8000
/* 00004D30 900100D4 */ stw r0, 0xd4(r1)
/* 00004D34 3C600000 */ lis r3, lbl_0000C380@ha
/* 00004D38 FC000072 */ fmul f0, f0, f1
/* 00004D3C C85F00A8 */ lfd f2, 0xa8(r31)
/* 00004D40 3C800000 */ lis r4, lbl_0000C380@ha
/* 00004D44 938100D0 */ stw r28, 0xd0(r1)
/* 00004D48 FC220028 */ fsub f1, f2, f0
/* 00004D4C C80100D0 */ lfd f0, 0xd0(r1)
/* 00004D50 FC200818 */ frsp f1, f1
/* 00004D54 D0210014 */ stfs f1, 0x14(r1)
/* 00004D58 80BB0004 */ lwz r5, 4(r27)
/* 00004D5C C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00004D60 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 00004D64 C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 00004D68 6C008000 */ xoris r0, r0, 0x8000
/* 00004D6C FC000828 */ fsub f0, f0, f1
/* 00004D70 900100DC */ stw r0, 0xdc(r1)
/* 00004D74 C87F00B8 */ lfd f3, 0xb8(r31)
/* 00004D78 938100D8 */ stw r28, 0xd8(r1)
/* 00004D7C C89F00B0 */ lfd f4, 0xb0(r31)
/* 00004D80 C82100D8 */ lfd f1, 0xd8(r1)
/* 00004D84 FC211028 */ fsub f1, f1, f2
/* 00004D88 FC230072 */ fmul f1, f3, f1
/* 00004D8C FC240828 */ fsub f1, f4, f1
/* 00004D90 FC01002A */ fadd f0, f1, f0
/* 00004D94 FC000018 */ frsp f0, f0
/* 00004D98 D0010018 */ stfs f0, 0x18(r1)
/* 00004D9C 4BFFB411 */ bl reset_text_draw_settings
/* 00004DA0 88610011 */ lbz r3, 0x11(r1)
/* 00004DA4 4BFFB409 */ bl set_text_font
/* 00004DA8 C0210050 */ lfs f1, 0x50(r1)
/* 00004DAC C0410054 */ lfs f2, 0x54(r1)
/* 00004DB0 4BFFB3FD */ bl set_text_scale
/* 00004DB4 80610084 */ lwz r3, 0x84(r1)
/* 00004DB8 4BFFB3F5 */ bl func_80071B50
/* 00004DBC C83F0028 */ lfd f1, 0x28(r31)
/* 00004DC0 C001005C */ lfs f0, 0x5c(r1)
/* 00004DC4 FC21002A */ fadd f1, f1, f0
/* 00004DC8 FC200818 */ frsp f1, f1
/* 00004DCC 4BFFB3E1 */ bl func_80071B1C
/* 00004DD0 38600000 */ li r3, 0
/* 00004DD4 4BFFB3D9 */ bl set_text_mul_color
/* 00004DD8 88010081 */ lbz r0, 0x81(r1)
/* 00004DDC 88610080 */ lbz r3, 0x80(r1)
/* 00004DE0 5400402E */ slwi r0, r0, 8
/* 00004DE4 88810082 */ lbz r4, 0x82(r1)
/* 00004DE8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004DEC 7C830378 */ or r3, r4, r0
/* 00004DF0 4BFFB3BD */ bl set_text_add_color
/* 00004DF4 C85F0030 */ lfd f2, 0x30(r31)
/* 00004DF8 C0210014 */ lfs f1, 0x14(r1)
/* 00004DFC C0010018 */ lfs f0, 0x18(r1)
/* 00004E00 FC22082A */ fadd f1, f2, f1
/* 00004E04 FC42002A */ fadd f2, f2, f0
/* 00004E08 FC200818 */ frsp f1, f1
/* 00004E0C FC401018 */ frsp f2, f2
/* 00004E10 4BFFB39D */ bl set_text_pos
/* 00004E14 7FC3F378 */ mr r3, r30
/* 00004E18 4BFFB395 */ bl u_draw_text
/* 00004E1C C021005C */ lfs f1, 0x5c(r1)
/* 00004E20 4BFFB38D */ bl func_80071B1C
/* 00004E24 8801001D */ lbz r0, 0x1d(r1)
/* 00004E28 8861001C */ lbz r3, 0x1c(r1)
/* 00004E2C 5400402E */ slwi r0, r0, 8
/* 00004E30 8881001E */ lbz r4, 0x1e(r1)
/* 00004E34 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004E38 7C830378 */ or r3, r4, r0
/* 00004E3C 4BFFB371 */ bl set_text_mul_color
/* 00004E40 88010081 */ lbz r0, 0x81(r1)
/* 00004E44 88610080 */ lbz r3, 0x80(r1)
/* 00004E48 5400402E */ slwi r0, r0, 8
/* 00004E4C 88810082 */ lbz r4, 0x82(r1)
/* 00004E50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004E54 7C830378 */ or r3, r4, r0
/* 00004E58 4BFFB355 */ bl set_text_add_color
/* 00004E5C C0210014 */ lfs f1, 0x14(r1)
/* 00004E60 C0410018 */ lfs f2, 0x18(r1)
/* 00004E64 4BFFB349 */ bl set_text_pos
/* 00004E68 7FC3F378 */ mr r3, r30
/* 00004E6C 4BFFB341 */ bl u_draw_text
/* 00004E70 3B5A0008 */ addi r26, r26, 8
/* 00004E74 3B390020 */ addi r25, r25, 0x20
/* 00004E78 3B180001 */ addi r24, r24, 1
lbl_00004E7C:
/* 00004E7C 801B0004 */ lwz r0, 4(r27)
/* 00004E80 7C180000 */ cmpw r24, r0
/* 00004E84 4180FE2C */ blt lbl_00004CB0
/* 00004E88 4BFFB325 */ bl mathutil_mtxA_from_identity
/* 00004E8C 3C600000 */ lis r3, mathutilData@ha
/* 00004E90 38630000 */ addi r3, r3, mathutilData@l
/* 00004E94 80630000 */ lwz r3, 0(r3)
/* 00004E98 38800000 */ li r4, 0
/* 00004E9C 4BFFB311 */ bl GXLoadPosMtxImm
/* 00004EA0 BB0100E0 */ lmw r24, 0xe0(r1)
/* 00004EA4 80010104 */ lwz r0, 0x104(r1)
/* 00004EA8 38210100 */ addi r1, r1, 0x100
/* 00004EAC 7C0803A6 */ mtlr r0
/* 00004EB0 4E800020 */ blr 
lbl_00004EB4:
/* 00004EB4 7C0802A6 */ mflr r0
/* 00004EB8 3C600000 */ lis r3, lbl_0000C370@ha
/* 00004EBC 90010004 */ stw r0, 4(r1)
/* 00004EC0 9421FFE0 */ stwu r1, -0x20(r1)
/* 00004EC4 93E1001C */ stw r31, 0x1c(r1)
/* 00004EC8 93C10018 */ stw r30, 0x18(r1)
/* 00004ECC 3BC30000 */ addi r30, r3, lbl_0000C370@l
/* 00004ED0 38600058 */ li r3, 0x58
/* 00004ED4 93A10014 */ stw r29, 0x14(r1)
/* 00004ED8 4BFFB2D5 */ bl find_sprite_with_tag
/* 00004EDC 28030000 */ cmplwi r3, 0
/* 00004EE0 41820018 */ beq lbl_00004EF8
/* 00004EE4 3C600000 */ lis r3, lbl_10000000@ha
/* 00004EE8 38630000 */ addi r3, r3, lbl_10000000@l
/* 00004EEC 38000003 */ li r0, 3
/* 00004EF0 9803003C */ stb r0, 0x3c(r3)
/* 00004EF4 48000110 */ b lbl_00005004
lbl_00004EF8:
/* 00004EF8 3C600000 */ lis r3, lbl_10000000@ha
/* 00004EFC 38630000 */ addi r3, r3, lbl_10000000@l
/* 00004F00 80030180 */ lwz r0, 0x180(r3)
/* 00004F04 3BA30180 */ addi r29, r3, 0x180
/* 00004F08 3BE3003C */ addi r31, r3, 0x3c
/* 00004F0C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00004F10 41820038 */ beq lbl_00004F48
/* 00004F14 38600058 */ li r3, 0x58
/* 00004F18 4BFFF055 */ bl lbl_00003F6C
/* 00004F1C 28030000 */ cmplwi r3, 0
/* 00004F20 41820060 */ beq lbl_00004F80
/* 00004F24 38000003 */ li r0, 3
/* 00004F28 98030000 */ stb r0, 0(r3)
/* 00004F2C 3800001E */ li r0, 0x1e
/* 00004F30 98030001 */ stb r0, 1(r3)
/* 00004F34 C01E0020 */ lfs f0, 0x20(r30)
/* 00004F38 D0030004 */ stfs f0, 4(r3)
/* 00004F3C C01E0000 */ lfs f0, 0(r30)
/* 00004F40 D0030008 */ stfs f0, 8(r3)
/* 00004F44 4800003C */ b lbl_00004F80
lbl_00004F48:
/* 00004F48 38600058 */ li r3, 0x58
/* 00004F4C 4BFFF021 */ bl lbl_00003F6C
/* 00004F50 28030000 */ cmplwi r3, 0
/* 00004F54 41820020 */ beq lbl_00004F74
/* 00004F58 38000000 */ li r0, 0
/* 00004F5C 98030000 */ stb r0, 0(r3)
/* 00004F60 98030001 */ stb r0, 1(r3)
/* 00004F64 C01E0000 */ lfs f0, 0(r30)
/* 00004F68 D0030004 */ stfs f0, 4(r3)
/* 00004F6C C01E0000 */ lfs f0, 0(r30)
/* 00004F70 D0030008 */ stfs f0, 8(r3)
lbl_00004F74:
/* 00004F74 801D0000 */ lwz r0, 0(r29)
/* 00004F78 60000001 */ ori r0, r0, 1
/* 00004F7C 901D0000 */ stw r0, 0(r29)
lbl_00004F80:
/* 00004F80 801F0014 */ lwz r0, 0x14(r31)
/* 00004F84 3C800000 */ lis r4, lbl_0000C380@ha
/* 00004F88 3C600000 */ lis r3, lbl_10000000@ha
/* 00004F8C C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00004F90 6C008000 */ xoris r0, r0, 0x8000
/* 00004F94 9001000C */ stw r0, 0xc(r1)
/* 00004F98 3C004330 */ lis r0, 0x4330
/* 00004F9C C85E0080 */ lfd f2, 0x80(r30)
/* 00004FA0 38630000 */ addi r3, r3, lbl_10000000@l
/* 00004FA4 90010008 */ stw r0, 8(r1)
/* 00004FA8 C87E00C0 */ lfd f3, 0xc0(r30)
/* 00004FAC C8010008 */ lfd f0, 8(r1)
/* 00004FB0 FC000828 */ fsub f0, f0, f1
/* 00004FB4 FC020032 */ fmul f0, f2, f0
/* 00004FB8 FC03002A */ fadd f0, f3, f0
/* 00004FBC FC000018 */ frsp f0, f0
/* 00004FC0 D0030048 */ stfs f0, 0x48(r3)
/* 00004FC4 4BFFB1E9 */ bl create_sprite
/* 00004FC8 28030000 */ cmplwi r3, 0
/* 00004FCC 41820038 */ beq lbl_00005004
/* 00004FD0 38000058 */ li r0, 0x58
/* 00004FD4 3C800000 */ lis r4, lbl_00004858@ha
/* 00004FD8 9803000F */ stb r0, 0xf(r3)
/* 00004FDC 38040000 */ addi r0, r4, lbl_00004858@l
/* 00004FE0 3C800000 */ lis r4, lbl_000048F4@ha
/* 00004FE4 90030034 */ stw r0, 0x34(r3)
/* 00004FE8 38040000 */ addi r0, r4, lbl_000048F4@l
/* 00004FEC 90030038 */ stw r0, 0x38(r3)
/* 00004FF0 3C800000 */ lis r4, lbl_0000CC6C@ha
/* 00004FF4 38840000 */ addi r4, r4, lbl_0000CC6C@l
/* 00004FF8 93E3002C */ stw r31, 0x2c(r3)
/* 00004FFC 3863008C */ addi r3, r3, 0x8c
/* 00005000 4BFFB1AD */ bl strcpy
lbl_00005004:
/* 00005004 80010024 */ lwz r0, 0x24(r1)
/* 00005008 83E1001C */ lwz r31, 0x1c(r1)
/* 0000500C 83C10018 */ lwz r30, 0x18(r1)
/* 00005010 7C0803A6 */ mtlr r0
/* 00005014 83A10014 */ lwz r29, 0x14(r1)
/* 00005018 38210020 */ addi r1, r1, 0x20
/* 0000501C 4E800020 */ blr 
lbl_00005020:
/* 00005020 7C0802A6 */ mflr r0
/* 00005024 3CA00000 */ lis r5, lbl_10006EC8@ha
/* 00005028 90010004 */ stw r0, 4(r1)
/* 0000502C 9421FFE0 */ stwu r1, -0x20(r1)
/* 00005030 93E1001C */ stw r31, 0x1c(r1)
/* 00005034 3BE50000 */ addi r31, r5, lbl_10006EC8@l
/* 00005038 3CA00000 */ lis r5, lbl_0000C370@ha
/* 0000503C 93C10018 */ stw r30, 0x18(r1)
/* 00005040 93A10014 */ stw r29, 0x14(r1)
/* 00005044 3BA50000 */ addi r29, r5, lbl_0000C370@l
/* 00005048 83C4002C */ lwz r30, 0x2c(r4)
/* 0000504C 4BFFEFA5 */ bl lbl_00003FF0
/* 00005050 801E0010 */ lwz r0, 0x10(r30)
/* 00005054 C01D00C8 */ lfs f0, 0xc8(r29)
/* 00005058 2C000006 */ cmpwi r0, 6
/* 0000505C C07D00CC */ lfs f3, 0xcc(r29)
/* 00005060 4182001C */ beq lbl_0000507C
/* 00005064 4080002C */ bge lbl_00005090
/* 00005068 2C000002 */ cmpwi r0, 2
/* 0000506C 4080001C */ bge lbl_00005088
/* 00005070 2C000000 */ cmpwi r0, 0
/* 00005074 40800008 */ bge lbl_0000507C
/* 00005078 48000018 */ b lbl_00005090
lbl_0000507C:
/* 0000507C C01D0064 */ lfs f0, 0x64(r29)
/* 00005080 C07D00CC */ lfs f3, 0xcc(r29)
/* 00005084 4800000C */ b lbl_00005090
lbl_00005088:
/* 00005088 C01D00D0 */ lfs f0, 0xd0(r29)
/* 0000508C C07D00D4 */ lfs f3, 0xd4(r29)
lbl_00005090:
/* 00005090 3C600000 */ lis r3, lbl_10000000@ha
/* 00005094 C83D0028 */ lfd f1, 0x28(r29)
/* 00005098 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000509C C043000C */ lfs f2, 0xc(r3)
/* 000050A0 EC001028 */ fsubs f0, f0, f2
/* 000050A4 FC010032 */ fmul f0, f1, f0
/* 000050A8 FC02002A */ fadd f0, f2, f0
/* 000050AC FC000018 */ frsp f0, f0
/* 000050B0 D003000C */ stfs f0, 0xc(r3)
/* 000050B4 C4430010 */ lfsu f2, 0x10(r3)
/* 000050B8 C83D0028 */ lfd f1, 0x28(r29)
/* 000050BC EC031028 */ fsubs f0, f3, f2
/* 000050C0 FC010032 */ fmul f0, f1, f0
/* 000050C4 FC02002A */ fadd f0, f2, f0
/* 000050C8 FC000018 */ frsp f0, f0
/* 000050CC D0030000 */ stfs f0, 0(r3)
/* 000050D0 801E0010 */ lwz r0, 0x10(r30)
/* 000050D4 C01D00D8 */ lfs f0, 0xd8(r29)
/* 000050D8 2C000005 */ cmpwi r0, 5
/* 000050DC 41820024 */ beq lbl_00005100
/* 000050E0 40800010 */ bge lbl_000050F0
/* 000050E4 2C000000 */ cmpwi r0, 0
/* 000050E8 40800010 */ bge lbl_000050F8
/* 000050EC 48000018 */ b lbl_00005104
lbl_000050F0:
/* 000050F0 2C000007 */ cmpwi r0, 7
/* 000050F4 40800010 */ bge lbl_00005104
lbl_000050F8:
/* 000050F8 C01D00D8 */ lfs f0, 0xd8(r29)
/* 000050FC 48000008 */ b lbl_00005104
lbl_00005100:
/* 00005100 C01D00DC */ lfs f0, 0xdc(r29)
lbl_00005104:
/* 00005104 3C600000 */ lis r3, lbl_10000000@ha
/* 00005108 C83D0028 */ lfd f1, 0x28(r29)
/* 0000510C 38830000 */ addi r4, r3, lbl_10000000@l
/* 00005110 C0440014 */ lfs f2, 0x14(r4)
/* 00005114 3C600000 */ lis r3, lbl_1000629C@ha
/* 00005118 38A30000 */ addi r5, r3, lbl_1000629C@l
/* 0000511C EC001028 */ fsubs f0, f0, f2
/* 00005120 38000002 */ li r0, 2
/* 00005124 3924001E */ addi r9, r4, 0x1e
/* 00005128 3904001C */ addi r8, r4, 0x1c
/* 0000512C FC010032 */ fmul f0, f1, f0
/* 00005130 39400000 */ li r10, 0
/* 00005134 FC02002A */ fadd f0, f2, f0
/* 00005138 FC000018 */ frsp f0, f0
/* 0000513C D0040014 */ stfs f0, 0x14(r4)
/* 00005140 A864001E */ lha r3, 0x1e(r4)
/* 00005144 7C0303D6 */ divw r0, r3, r0
/* 00005148 7C000734 */ extsh r0, r0
/* 0000514C B004001E */ sth r0, 0x1e(r4)
/* 00005150 A8E4001C */ lha r7, 0x1c(r4)
/* 00005154 38C70001 */ addi r6, r7, 1
/* 00005158 1C660018 */ mulli r3, r6, 0x18
/* 0000515C 4800000C */ b lbl_00005168
lbl_00005160:
/* 00005160 38630018 */ addi r3, r3, 0x18
/* 00005164 394A0001 */ addi r10, r10, 1
lbl_00005168:
/* 00005168 7C851A14 */ add r4, r5, r3
/* 0000516C 88040014 */ lbz r0, 0x14(r4)
/* 00005170 7C000774 */ extsb r0, r0
/* 00005174 2C00FFFE */ cmpwi r0, -2
/* 00005178 4182FFE8 */ beq lbl_00005160
/* 0000517C 38C60001 */ addi r6, r6, 1
/* 00005180 7C0A3214 */ add r0, r10, r6
/* 00005184 1C600018 */ mulli r3, r0, 0x18
/* 00005188 4800000C */ b lbl_00005194
lbl_0000518C:
/* 0000518C 38630018 */ addi r3, r3, 0x18
/* 00005190 394A0001 */ addi r10, r10, 1
lbl_00005194:
/* 00005194 7C851A14 */ add r4, r5, r3
/* 00005198 88040014 */ lbz r0, 0x14(r4)
/* 0000519C 7C000774 */ extsb r0, r0
/* 000051A0 2C00FFFE */ cmpwi r0, -2
/* 000051A4 4182FFE8 */ beq lbl_0000518C
/* 000051A8 38C60001 */ addi r6, r6, 1
/* 000051AC 7C0A3214 */ add r0, r10, r6
/* 000051B0 1C600018 */ mulli r3, r0, 0x18
/* 000051B4 4800000C */ b lbl_000051C0
lbl_000051B8:
/* 000051B8 38630018 */ addi r3, r3, 0x18
/* 000051BC 394A0001 */ addi r10, r10, 1
lbl_000051C0:
/* 000051C0 7C851A14 */ add r4, r5, r3
/* 000051C4 88040014 */ lbz r0, 0x14(r4)
/* 000051C8 7C000774 */ extsb r0, r0
/* 000051CC 2C00FFFE */ cmpwi r0, -2
/* 000051D0 4182FFE8 */ beq lbl_000051B8
/* 000051D4 38C60001 */ addi r6, r6, 1
/* 000051D8 7C0A3214 */ add r0, r10, r6
/* 000051DC 1C600018 */ mulli r3, r0, 0x18
/* 000051E0 4800000C */ b lbl_000051EC
lbl_000051E4:
/* 000051E4 38630018 */ addi r3, r3, 0x18
/* 000051E8 394A0001 */ addi r10, r10, 1
lbl_000051EC:
/* 000051EC 7C851A14 */ add r4, r5, r3
/* 000051F0 88040014 */ lbz r0, 0x14(r4)
/* 000051F4 7C000774 */ extsb r0, r0
/* 000051F8 2C00FFFE */ cmpwi r0, -2
/* 000051FC 4182FFE8 */ beq lbl_000051E4
/* 00005200 38C60001 */ addi r6, r6, 1
/* 00005204 7C0A3214 */ add r0, r10, r6
/* 00005208 1C600018 */ mulli r3, r0, 0x18
/* 0000520C 4800000C */ b lbl_00005218
lbl_00005210:
/* 00005210 38630018 */ addi r3, r3, 0x18
/* 00005214 394A0001 */ addi r10, r10, 1
lbl_00005218:
/* 00005218 7C851A14 */ add r4, r5, r3
/* 0000521C 88040014 */ lbz r0, 0x14(r4)
/* 00005220 7C000774 */ extsb r0, r0
/* 00005224 2C00FFFE */ cmpwi r0, -2
/* 00005228 4182FFE8 */ beq lbl_00005210
/* 0000522C 38C60001 */ addi r6, r6, 1
/* 00005230 7C0A3214 */ add r0, r10, r6
/* 00005234 1C600018 */ mulli r3, r0, 0x18
/* 00005238 4800000C */ b lbl_00005244
lbl_0000523C:
/* 0000523C 38630018 */ addi r3, r3, 0x18
/* 00005240 394A0001 */ addi r10, r10, 1
lbl_00005244:
/* 00005244 7C851A14 */ add r4, r5, r3
/* 00005248 88040014 */ lbz r0, 0x14(r4)
/* 0000524C 7C000774 */ extsb r0, r0
/* 00005250 2C00FFFE */ cmpwi r0, -2
/* 00005254 4182FFE8 */ beq lbl_0000523C
/* 00005258 38C60001 */ addi r6, r6, 1
/* 0000525C 7C0A3214 */ add r0, r10, r6
/* 00005260 1C600018 */ mulli r3, r0, 0x18
/* 00005264 4800000C */ b lbl_00005270
lbl_00005268:
/* 00005268 38630018 */ addi r3, r3, 0x18
/* 0000526C 394A0001 */ addi r10, r10, 1
lbl_00005270:
/* 00005270 7C851A14 */ add r4, r5, r3
/* 00005274 88040014 */ lbz r0, 0x14(r4)
/* 00005278 7C000774 */ extsb r0, r0
/* 0000527C 2C00FFFE */ cmpwi r0, -2
/* 00005280 4182FFE8 */ beq lbl_00005268
/* 00005284 7C675214 */ add r3, r7, r10
/* 00005288 809E0014 */ lwz r4, 0x14(r30)
/* 0000528C 38030007 */ addi r0, r3, 7
/* 00005290 7C040000 */ cmpw r4, r0
/* 00005294 41800018 */ blt lbl_000052AC
/* 00005298 3804FFFA */ addi r0, r4, -6  ;# fixed addi
/* 0000529C 7C0A0050 */ subf r0, r10, r0
/* 000052A0 B0080000 */ sth r0, 0(r8)
/* 000052A4 38000010 */ li r0, 0x10
/* 000052A8 B0090000 */ sth r0, 0(r9)
lbl_000052AC:
/* 000052AC 807E0014 */ lwz r3, 0x14(r30)
/* 000052B0 A8080000 */ lha r0, 0(r8)
/* 000052B4 7C030000 */ cmpw r3, r0
/* 000052B8 40800014 */ bge lbl_000052CC
/* 000052BC 7C600734 */ extsh r0, r3
/* 000052C0 B0080000 */ sth r0, 0(r8)
/* 000052C4 3800FFF0 */ li r0, -16
/* 000052C8 B0090000 */ sth r0, 0(r9)
lbl_000052CC:
/* 000052CC 801E0014 */ lwz r0, 0x14(r30)
/* 000052D0 3C600000 */ lis r3, lbl_1000629C@ha
/* 000052D4 38630000 */ addi r3, r3, lbl_1000629C@l
/* 000052D8 1C000018 */ mulli r0, r0, 0x18
/* 000052DC 7C630214 */ add r3, r3, r0
/* 000052E0 A0030002 */ lhz r0, 2(r3)
/* 000052E4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000052E8 4082003C */ bne lbl_00005324
/* 000052EC 88030014 */ lbz r0, 0x14(r3)
/* 000052F0 7C000775 */ extsb. r0, r0
/* 000052F4 41800028 */ blt lbl_0000531C
/* 000052F8 801F0074 */ lwz r0, 0x74(r31)
/* 000052FC 88630004 */ lbz r3, 4(r3)
/* 00005300 7C001800 */ cmpw r0, r3
/* 00005304 41820018 */ beq lbl_0000531C
/* 00005308 907F0074 */ stw r3, 0x74(r31)
/* 0000530C 7FE3FB78 */ mr r3, r31
/* 00005310 809F0074 */ lwz r4, 0x74(r31)
/* 00005314 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00005318 4BFFAE95 */ bl start_preview_image_read
lbl_0000531C:
/* 0000531C 7FE3FB78 */ mr r3, r31
/* 00005320 4BFFAE8D */ bl u_preview_maybe_invalidate_tex_cache
lbl_00005324:
/* 00005324 80010024 */ lwz r0, 0x24(r1)
/* 00005328 83E1001C */ lwz r31, 0x1c(r1)
/* 0000532C 83C10018 */ lwz r30, 0x18(r1)
/* 00005330 7C0803A6 */ mtlr r0
/* 00005334 83A10014 */ lwz r29, 0x14(r1)
/* 00005338 38210020 */ addi r1, r1, 0x20
/* 0000533C 4E800020 */ blr 
lbl_00005340:
/* 00005340 7C0802A6 */ mflr r0
/* 00005344 7C651B78 */ mr r5, r3
/* 00005348 90010004 */ stw r0, 4(r1)
/* 0000534C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00005350 9421FE90 */ stwu r1, -0x170(r1)
/* 00005354 DBE10168 */ stfd f31, 0x168(r1)
/* 00005358 BDC10120 */ stmw r14, 0x120(r1)
/* 0000535C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 00005360 3C800000 */ lis r4, lbl_0000C370@ha
/* 00005364 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00005368 8863000F */ lbz r3, 0xf(r3)
/* 0000536C 8265002C */ lwz r19, 0x2c(r5)
/* 00005370 7C630774 */ extsb r3, r3
/* 00005374 4BFFEBF9 */ bl lbl_00003F6C
/* 00005378 28030000 */ cmplwi r3, 0
/* 0000537C 41820040 */ beq lbl_000053BC
/* 00005380 C05F0000 */ lfs f2, 0(r31)
/* 00005384 C0230004 */ lfs f1, 4(r3)
/* 00005388 C0030008 */ lfs f0, 8(r3)
/* 0000538C FC601090 */ fmr f3, f2
/* 00005390 EC21002A */ fadds f1, f1, f0
/* 00005394 4BFFAE19 */ bl mathutil_mtxA_from_translate_xyz
/* 00005398 3C600000 */ lis r3, lbl_10000000@ha
/* 0000539C 38630000 */ addi r3, r3, lbl_10000000@l
/* 000053A0 38630184 */ addi r3, r3, 0x184
/* 000053A4 4BFFAE09 */ bl mathutil_mtxA_to_mtx
/* 000053A8 3C600000 */ lis r3, mathutilData@ha
/* 000053AC 38630000 */ addi r3, r3, mathutilData@l
/* 000053B0 80630000 */ lwz r3, 0(r3)
/* 000053B4 38800000 */ li r4, 0
/* 000053B8 4BFFADF5 */ bl GXLoadPosMtxImm
lbl_000053BC:
/* 000053BC 7FA3EB78 */ mr r3, r29
/* 000053C0 4BFFADED */ bl draw_naomi_sprite
/* 000053C4 3C600000 */ lis r3, lbl_10000000@ha
/* 000053C8 39E30000 */ addi r15, r3, lbl_10000000@l
/* 000053CC 3A0F000C */ addi r16, r15, 0xc
/* 000053D0 C00F000C */ lfs f0, 0xc(r15)
/* 000053D4 387D03E8 */ addi r3, r29, 0x3e8
/* 000053D8 D01D03EC */ stfs f0, 0x3ec(r29)
/* 000053DC C03F0094 */ lfs f1, 0x94(r31)
/* 000053E0 C05F0098 */ lfs f2, 0x98(r31)
/* 000053E4 4BFFEED9 */ bl lbl_000042BC
/* 000053E8 387D00F0 */ addi r3, r29, 0xf0
/* 000053EC 4BFFADC1 */ bl draw_naomi_sprite
/* 000053F0 C01F0088 */ lfs f0, 0x88(r31)
/* 000053F4 3BC100B0 */ addi r30, r1, 0xb0
/* 000053F8 388000B3 */ li r4, 0xb3
/* 000053FC D0010070 */ stfs f0, 0x70(r1)
/* 00005400 3A200000 */ li r17, 0
/* 00005404 3C000020 */ lis r0, 0x20
/* 00005408 C01F0060 */ lfs f0, 0x60(r31)
/* 0000540C 7FC3F378 */ mr r3, r30
/* 00005410 D0010064 */ stfs f0, 0x64(r1)
/* 00005414 C01F0060 */ lfs f0, 0x60(r31)
/* 00005418 D0010068 */ stfs f0, 0x68(r1)
/* 0000541C 98810025 */ stb r4, 0x25(r1)
/* 00005420 389D0530 */ addi r4, r29, 0x530
/* 00005424 9A210094 */ stb r17, 0x94(r1)
/* 00005428 9A210095 */ stb r17, 0x95(r1)
/* 0000542C 9A210096 */ stb r17, 0x96(r1)
/* 00005430 90010098 */ stw r0, 0x98(r1)
/* 00005434 4BFFAD79 */ bl strcpy
/* 00005438 4BFFAD75 */ bl reset_text_draw_settings
/* 0000543C 88610025 */ lbz r3, 0x25(r1)
/* 00005440 4BFFAD6D */ bl set_text_font
/* 00005444 C0210064 */ lfs f1, 0x64(r1)
/* 00005448 C0410068 */ lfs f2, 0x68(r1)
/* 0000544C 4BFFAD61 */ bl set_text_scale
/* 00005450 80610098 */ lwz r3, 0x98(r1)
/* 00005454 4BFFAD59 */ bl func_80071B50
/* 00005458 C0210070 */ lfs f1, 0x70(r1)
/* 0000545C 4BFFAD51 */ bl func_80071B1C
/* 00005460 88010031 */ lbz r0, 0x31(r1)
/* 00005464 88610030 */ lbz r3, 0x30(r1)
/* 00005468 5400402E */ slwi r0, r0, 8
/* 0000546C 88810032 */ lbz r4, 0x32(r1)
/* 00005470 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005474 7C830378 */ or r3, r4, r0
/* 00005478 4BFFAD35 */ bl set_text_mul_color
/* 0000547C 88010095 */ lbz r0, 0x95(r1)
/* 00005480 88610094 */ lbz r3, 0x94(r1)
/* 00005484 5400402E */ slwi r0, r0, 8
/* 00005488 88810096 */ lbz r4, 0x96(r1)
/* 0000548C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005490 7C830378 */ or r3, r4, r0
/* 00005494 4BFFAD19 */ bl set_text_add_color
/* 00005498 7FC3F378 */ mr r3, r30
/* 0000549C 4BFFAD11 */ bl u_get_text_width
/* 000054A0 C81F0058 */ lfd f0, 0x58(r31)
/* 000054A4 39C000FF */ li r14, 0xff
/* 000054A8 C85F00A8 */ lfd f2, 0xa8(r31)
/* 000054AC FC000072 */ fmul f0, f0, f1
/* 000054B0 FC020028 */ fsub f0, f2, f0
/* 000054B4 FC000018 */ frsp f0, f0
/* 000054B8 D0010028 */ stfs f0, 0x28(r1)
/* 000054BC C01F0090 */ lfs f0, 0x90(r31)
/* 000054C0 D001002C */ stfs f0, 0x2c(r1)
/* 000054C4 99C10030 */ stb r14, 0x30(r1)
/* 000054C8 99C10031 */ stb r14, 0x31(r1)
/* 000054CC 9A210032 */ stb r17, 0x32(r1)
/* 000054D0 4BFFACDD */ bl reset_text_draw_settings
/* 000054D4 88610025 */ lbz r3, 0x25(r1)
/* 000054D8 4BFFACD5 */ bl set_text_font
/* 000054DC C0210064 */ lfs f1, 0x64(r1)
/* 000054E0 C0410068 */ lfs f2, 0x68(r1)
/* 000054E4 4BFFACC9 */ bl set_text_scale
/* 000054E8 80610098 */ lwz r3, 0x98(r1)
/* 000054EC 4BFFACC1 */ bl func_80071B50
/* 000054F0 C83F0028 */ lfd f1, 0x28(r31)
/* 000054F4 C0010070 */ lfs f0, 0x70(r1)
/* 000054F8 FC21002A */ fadd f1, f1, f0
/* 000054FC FC200818 */ frsp f1, f1
/* 00005500 4BFFACAD */ bl func_80071B1C
/* 00005504 38600000 */ li r3, 0
/* 00005508 4BFFACA5 */ bl set_text_mul_color
/* 0000550C 88010095 */ lbz r0, 0x95(r1)
/* 00005510 88610094 */ lbz r3, 0x94(r1)
/* 00005514 5400402E */ slwi r0, r0, 8
/* 00005518 88810096 */ lbz r4, 0x96(r1)
/* 0000551C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005520 7C830378 */ or r3, r4, r0
/* 00005524 4BFFAC89 */ bl set_text_add_color
/* 00005528 C85F0030 */ lfd f2, 0x30(r31)
/* 0000552C C0210028 */ lfs f1, 0x28(r1)
/* 00005530 C001002C */ lfs f0, 0x2c(r1)
/* 00005534 FC22082A */ fadd f1, f2, f1
/* 00005538 FC42002A */ fadd f2, f2, f0
/* 0000553C FC200818 */ frsp f1, f1
/* 00005540 FC401018 */ frsp f2, f2
/* 00005544 4BFFAC69 */ bl set_text_pos
/* 00005548 7FC3F378 */ mr r3, r30
/* 0000554C 4BFFAC61 */ bl u_draw_text
/* 00005550 C0210070 */ lfs f1, 0x70(r1)
/* 00005554 4BFFAC59 */ bl func_80071B1C
/* 00005558 88010031 */ lbz r0, 0x31(r1)
/* 0000555C 88610030 */ lbz r3, 0x30(r1)
/* 00005560 5400402E */ slwi r0, r0, 8
/* 00005564 88810032 */ lbz r4, 0x32(r1)
/* 00005568 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000556C 7C830378 */ or r3, r4, r0
/* 00005570 4BFFAC3D */ bl set_text_mul_color
/* 00005574 88010095 */ lbz r0, 0x95(r1)
/* 00005578 88610094 */ lbz r3, 0x94(r1)
/* 0000557C 5400402E */ slwi r0, r0, 8
/* 00005580 88810096 */ lbz r4, 0x96(r1)
/* 00005584 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005588 7C830378 */ or r3, r4, r0
/* 0000558C 4BFFAC21 */ bl set_text_add_color
/* 00005590 C0210028 */ lfs f1, 0x28(r1)
/* 00005594 C041002C */ lfs f2, 0x2c(r1)
/* 00005598 4BFFAC15 */ bl set_text_pos
/* 0000559C 7FC3F378 */ mr r3, r30
/* 000055A0 4BFFAC0D */ bl u_draw_text
/* 000055A4 C01F00E0 */ lfs f0, 0xe0(r31)
/* 000055A8 3C600000 */ lis r3, lbl_1000629C@ha
/* 000055AC 3AA30000 */ addi r21, r3, lbl_1000629C@l
/* 000055B0 D0010070 */ stfs f0, 0x70(r1)
/* 000055B4 380000B1 */ li r0, 0xb1
/* 000055B8 7EA3AB78 */ mr r3, r21
/* 000055BC 99C10030 */ stb r14, 0x30(r1)
/* 000055C0 38A00000 */ li r5, 0
/* 000055C4 38800000 */ li r4, 0
/* 000055C8 99C10031 */ stb r14, 0x31(r1)
/* 000055CC 9A210032 */ stb r17, 0x32(r1)
/* 000055D0 98010025 */ stb r0, 0x25(r1)
/* 000055D4 C0300000 */ lfs f1, 0(r16)
/* 000055D8 C81F0048 */ lfd f0, 0x48(r31)
/* 000055DC FC010028 */ fsub f0, f1, f0
/* 000055E0 FC000018 */ frsp f0, f0
/* 000055E4 D0010028 */ stfs f0, 0x28(r1)
/* 000055E8 AC0F001C */ lhau r0, 0x1c(r15)
/* 000055EC 2C000000 */ cmpwi r0, 0
/* 000055F0 7C0903A6 */ mtctr r0
/* 000055F4 40810024 */ ble lbl_00005618
lbl_000055F8:
/* 000055F8 88030014 */ lbz r0, 0x14(r3)
/* 000055FC 7C000774 */ extsb r0, r0
/* 00005600 2C00FFFE */ cmpwi r0, -2
/* 00005604 40820008 */ bne lbl_0000560C
/* 00005608 38A50001 */ addi r5, r5, 1
lbl_0000560C:
/* 0000560C 38630018 */ addi r3, r3, 0x18
/* 00005610 38840001 */ addi r4, r4, 1
/* 00005614 4200FFE4 */ bdnz lbl_000055F8
lbl_00005618:
/* 00005618 7C042800 */ cmpw r4, r5
/* 0000561C 40810138 */ ble lbl_00005754
/* 00005620 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00005624 C85F00E8 */ lfd f2, 0xe8(r31)
/* 00005628 38830000 */ addi r4, r3, unpausedFrameCounter@l
/* 0000562C 3C608889 */ lis r3, 0x8889
/* 00005630 80840000 */ lwz r4, 0(r4)
/* 00005634 38038889 */ addi r0, r3, -30583  ;# fixed addi
/* 00005638 7C002016 */ mulhwu r0, r0, r4
/* 0000563C 5400E13E */ srwi r0, r0, 4
/* 00005640 1C00001E */ mulli r0, r0, 0x1e
/* 00005644 7C002050 */ subf r0, r0, r4
/* 00005648 5400F87E */ srwi r0, r0, 1
/* 0000564C 9001011C */ stw r0, 0x11c(r1)
/* 00005650 3C004330 */ lis r0, 0x4330
/* 00005654 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 00005658 90010118 */ stw r0, 0x118(r1)
/* 0000565C 389D053C */ addi r4, r29, 0x53c
/* 00005660 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 00005664 7FC3F378 */ mr r3, r30
/* 00005668 C8010118 */ lfd f0, 0x118(r1)
/* 0000566C EC000828 */ fsubs f0, f0, f1
/* 00005670 FC020028 */ fsub f0, f2, f0
/* 00005674 FC000018 */ frsp f0, f0
/* 00005678 D001002C */ stfs f0, 0x2c(r1)
/* 0000567C 4BFFAB31 */ bl strcpy
/* 00005680 4BFFAB2D */ bl reset_text_draw_settings
/* 00005684 88610025 */ lbz r3, 0x25(r1)
/* 00005688 4BFFAB25 */ bl set_text_font
/* 0000568C C0210064 */ lfs f1, 0x64(r1)
/* 00005690 C0410068 */ lfs f2, 0x68(r1)
/* 00005694 4BFFAB19 */ bl set_text_scale
/* 00005698 80610098 */ lwz r3, 0x98(r1)
/* 0000569C 4BFFAB11 */ bl func_80071B50
/* 000056A0 C83F0028 */ lfd f1, 0x28(r31)
/* 000056A4 C0010070 */ lfs f0, 0x70(r1)
/* 000056A8 FC21002A */ fadd f1, f1, f0
/* 000056AC FC200818 */ frsp f1, f1
/* 000056B0 4BFFAAFD */ bl func_80071B1C
/* 000056B4 38600000 */ li r3, 0
/* 000056B8 4BFFAAF5 */ bl set_text_mul_color
/* 000056BC 88010095 */ lbz r0, 0x95(r1)
/* 000056C0 88610094 */ lbz r3, 0x94(r1)
/* 000056C4 5400402E */ slwi r0, r0, 8
/* 000056C8 88810096 */ lbz r4, 0x96(r1)
/* 000056CC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000056D0 7C830378 */ or r3, r4, r0
/* 000056D4 4BFFAAD9 */ bl set_text_add_color
/* 000056D8 C85F0030 */ lfd f2, 0x30(r31)
/* 000056DC C0210028 */ lfs f1, 0x28(r1)
/* 000056E0 C001002C */ lfs f0, 0x2c(r1)
/* 000056E4 FC22082A */ fadd f1, f2, f1
/* 000056E8 FC42002A */ fadd f2, f2, f0
/* 000056EC FC200818 */ frsp f1, f1
/* 000056F0 FC401018 */ frsp f2, f2
/* 000056F4 4BFFAAB9 */ bl set_text_pos
/* 000056F8 7FC3F378 */ mr r3, r30
/* 000056FC 4BFFAAB1 */ bl u_draw_text
/* 00005700 C0210070 */ lfs f1, 0x70(r1)
/* 00005704 4BFFAAA9 */ bl func_80071B1C
/* 00005708 88010031 */ lbz r0, 0x31(r1)
/* 0000570C 88610030 */ lbz r3, 0x30(r1)
/* 00005710 5400402E */ slwi r0, r0, 8
/* 00005714 88810032 */ lbz r4, 0x32(r1)
/* 00005718 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000571C 7C830378 */ or r3, r4, r0
/* 00005720 4BFFAA8D */ bl set_text_mul_color
/* 00005724 88010095 */ lbz r0, 0x95(r1)
/* 00005728 88610094 */ lbz r3, 0x94(r1)
/* 0000572C 5400402E */ slwi r0, r0, 8
/* 00005730 88810096 */ lbz r4, 0x96(r1)
/* 00005734 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005738 7C830378 */ or r3, r4, r0
/* 0000573C 4BFFAA71 */ bl set_text_add_color
/* 00005740 C0210028 */ lfs f1, 0x28(r1)
/* 00005744 C041002C */ lfs f2, 0x2c(r1)
/* 00005748 4BFFAA65 */ bl set_text_pos
/* 0000574C 7FC3F378 */ mr r3, r30
/* 00005750 4BFFAA5D */ bl u_draw_text
lbl_00005754:
/* 00005754 A80F0000 */ lha r0, 0(r15)
/* 00005758 38C00000 */ li r6, 0
/* 0000575C 3C800000 */ lis r4, lbl_1000629C@ha
/* 00005760 1C600018 */ mulli r3, r0, 0x18
/* 00005764 38E60000 */ addi r7, r6, 0
/* 00005768 38A40000 */ addi r5, r4, lbl_1000629C@l
/* 0000576C 4800001C */ b lbl_00005788
lbl_00005770:
/* 00005770 7C800774 */ extsb r0, r4
/* 00005774 2C00FFFE */ cmpwi r0, -2
/* 00005778 40820008 */ bne lbl_00005780
/* 0000577C 38C60001 */ addi r6, r6, 1
lbl_00005780:
/* 00005780 38630018 */ addi r3, r3, 0x18
/* 00005784 38E70001 */ addi r7, r7, 1
lbl_00005788:
/* 00005788 7C851A14 */ add r4, r5, r3
/* 0000578C 88840014 */ lbz r4, 0x14(r4)
/* 00005790 7C800774 */ extsb r0, r4
/* 00005794 2C00FFFF */ cmpwi r0, -1
/* 00005798 4182000C */ beq lbl_000057A4
/* 0000579C 2C07007F */ cmpwi r7, 0x7f
/* 000057A0 4180FFD0 */ blt lbl_00005770
lbl_000057A4:
/* 000057A4 7C063850 */ subf r0, r6, r7
/* 000057A8 2C000007 */ cmpwi r0, 7
/* 000057AC 40810138 */ ble lbl_000058E4
/* 000057B0 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 000057B4 C85F00F0 */ lfd f2, 0xf0(r31)
/* 000057B8 38830000 */ addi r4, r3, unpausedFrameCounter@l
/* 000057BC 3C608889 */ lis r3, 0x8889
/* 000057C0 80840000 */ lwz r4, 0(r4)
/* 000057C4 38038889 */ addi r0, r3, -30583  ;# fixed addi
/* 000057C8 7C002016 */ mulhwu r0, r0, r4
/* 000057CC 5400E13E */ srwi r0, r0, 4
/* 000057D0 1C00001E */ mulli r0, r0, 0x1e
/* 000057D4 7C002050 */ subf r0, r0, r4
/* 000057D8 5400F87E */ srwi r0, r0, 1
/* 000057DC 9001011C */ stw r0, 0x11c(r1)
/* 000057E0 3C004330 */ lis r0, 0x4330
/* 000057E4 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 000057E8 90010118 */ stw r0, 0x118(r1)
/* 000057EC 389D054C */ addi r4, r29, 0x54c
/* 000057F0 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 000057F4 7FC3F378 */ mr r3, r30
/* 000057F8 C8010118 */ lfd f0, 0x118(r1)
/* 000057FC EC000828 */ fsubs f0, f0, f1
/* 00005800 FC02002A */ fadd f0, f2, f0
/* 00005804 FC000018 */ frsp f0, f0
/* 00005808 D001002C */ stfs f0, 0x2c(r1)
/* 0000580C 4BFFA9A1 */ bl strcpy
/* 00005810 4BFFA99D */ bl reset_text_draw_settings
/* 00005814 88610025 */ lbz r3, 0x25(r1)
/* 00005818 4BFFA995 */ bl set_text_font
/* 0000581C C0210064 */ lfs f1, 0x64(r1)
/* 00005820 C0410068 */ lfs f2, 0x68(r1)
/* 00005824 4BFFA989 */ bl set_text_scale
/* 00005828 80610098 */ lwz r3, 0x98(r1)
/* 0000582C 4BFFA981 */ bl func_80071B50
/* 00005830 C83F0028 */ lfd f1, 0x28(r31)
/* 00005834 C0010070 */ lfs f0, 0x70(r1)
/* 00005838 FC21002A */ fadd f1, f1, f0
/* 0000583C FC200818 */ frsp f1, f1
/* 00005840 4BFFA96D */ bl func_80071B1C
/* 00005844 38600000 */ li r3, 0
/* 00005848 4BFFA965 */ bl set_text_mul_color
/* 0000584C 88010095 */ lbz r0, 0x95(r1)
/* 00005850 88610094 */ lbz r3, 0x94(r1)
/* 00005854 5400402E */ slwi r0, r0, 8
/* 00005858 88810096 */ lbz r4, 0x96(r1)
/* 0000585C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005860 7C830378 */ or r3, r4, r0
/* 00005864 4BFFA949 */ bl set_text_add_color
/* 00005868 C85F0030 */ lfd f2, 0x30(r31)
/* 0000586C C0210028 */ lfs f1, 0x28(r1)
/* 00005870 C001002C */ lfs f0, 0x2c(r1)
/* 00005874 FC22082A */ fadd f1, f2, f1
/* 00005878 FC42002A */ fadd f2, f2, f0
/* 0000587C FC200818 */ frsp f1, f1
/* 00005880 FC401018 */ frsp f2, f2
/* 00005884 4BFFA929 */ bl set_text_pos
/* 00005888 7FC3F378 */ mr r3, r30
/* 0000588C 4BFFA921 */ bl u_draw_text
/* 00005890 C0210070 */ lfs f1, 0x70(r1)
/* 00005894 4BFFA919 */ bl func_80071B1C
/* 00005898 88010031 */ lbz r0, 0x31(r1)
/* 0000589C 88610030 */ lbz r3, 0x30(r1)
/* 000058A0 5400402E */ slwi r0, r0, 8
/* 000058A4 88810032 */ lbz r4, 0x32(r1)
/* 000058A8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000058AC 7C830378 */ or r3, r4, r0
/* 000058B0 4BFFA8FD */ bl set_text_mul_color
/* 000058B4 88010095 */ lbz r0, 0x95(r1)
/* 000058B8 88610094 */ lbz r3, 0x94(r1)
/* 000058BC 5400402E */ slwi r0, r0, 8
/* 000058C0 88810096 */ lbz r4, 0x96(r1)
/* 000058C4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000058C8 7C830378 */ or r3, r4, r0
/* 000058CC 4BFFA8E1 */ bl set_text_add_color
/* 000058D0 C0210028 */ lfs f1, 0x28(r1)
/* 000058D4 C041002C */ lfs f2, 0x2c(r1)
/* 000058D8 4BFFA8D5 */ bl set_text_pos
/* 000058DC 7FC3F378 */ mr r3, r30
/* 000058E0 4BFFA8CD */ bl u_draw_text
lbl_000058E4:
/* 000058E4 3C600000 */ lis r3, gamePauseStatus@ha
/* 000058E8 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 000058EC 7000000A */ andi. r0, r0, 0xa
/* 000058F0 40820024 */ bne lbl_00005914
/* 000058F4 3C600000 */ lis r3, lbl_10000000@ha
/* 000058F8 38630000 */ addi r3, r3, lbl_10000000@l
/* 000058FC 3883003B */ addi r4, r3, 0x3b
/* 00005900 8863003B */ lbz r3, 0x3b(r3)
/* 00005904 7C600775 */ extsb. r0, r3
/* 00005908 4081000C */ ble lbl_00005914
/* 0000590C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00005910 98040000 */ stb r0, 0(r4)
lbl_00005914:
/* 00005914 C01F00E0 */ lfs f0, 0xe0(r31)
/* 00005918 386000FF */ li r3, 0xff
/* 0000591C 3B400000 */ li r26, 0
/* 00005920 D0010070 */ stfs f0, 0x70(r1)
/* 00005924 380000B3 */ li r0, 0xb3
/* 00005928 98610030 */ stb r3, 0x30(r1)
/* 0000592C 98610031 */ stb r3, 0x31(r1)
/* 00005930 9B410032 */ stb r26, 0x32(r1)
/* 00005934 98010025 */ stb r0, 0x25(r1)
/* 00005938 80130010 */ lwz r0, 0x10(r19)
/* 0000593C 2C000007 */ cmpwi r0, 7
/* 00005940 40800494 */ bge lbl_00005DD4
/* 00005944 2C000001 */ cmpwi r0, 1
/* 00005948 40800008 */ bge lbl_00005950
/* 0000594C 48000488 */ b lbl_00005DD4
lbl_00005950:
/* 00005950 3C600000 */ lis r3, lbl_10000000@ha
/* 00005954 3A830000 */ addi r20, r3, lbl_10000000@l
/* 00005958 3C800000 */ lis r4, lbl_1000629C@ha
/* 0000595C 3C60FF90 */ lis r3, 0xff90
/* 00005960 3B3A0000 */ addi r25, r26, 0
/* 00005964 3B640000 */ addi r27, r4, lbl_1000629C@l
/* 00005968 3B1D0438 */ addi r24, r29, 0x438
/* 0000596C 39C38F8F */ addi r14, r3, -28785  ;# fixed addi
/* 00005970 3A34003A */ addi r17, r20, 0x3a
/* 00005974 3A54001E */ addi r18, r20, 0x1e
/* 00005978 3F804330 */ lis r28, 0x4330
/* 0000597C 48000440 */ b lbl_00005DBC
lbl_00005980:
/* 00005980 A80F0000 */ lha r0, 0(r15)
/* 00005984 38600000 */ li r3, 0
/* 00005988 7C990214 */ add r4, r25, r0
/* 0000598C 7EDA2214 */ add r22, r26, r4
/* 00005990 4800000C */ b lbl_0000599C
lbl_00005994:
/* 00005994 3B5A0001 */ addi r26, r26, 1
/* 00005998 7EDA2214 */ add r22, r26, r4
lbl_0000599C:
/* 0000599C 1C160018 */ mulli r0, r22, 0x18
/* 000059A0 7EFB0214 */ add r23, r27, r0
/* 000059A4 88170014 */ lbz r0, 0x14(r23)
/* 000059A8 7C000774 */ extsb r0, r0
/* 000059AC 2C00FFFE */ cmpwi r0, -2
/* 000059B0 4182FFE4 */ beq lbl_00005994
/* 000059B4 2C00FFFF */ cmpwi r0, -1
/* 000059B8 4182041C */ beq lbl_00005DD4
/* 000059BC C0300000 */ lfs f1, 0(r16)
/* 000059C0 C81F00F8 */ lfd f0, 0xf8(r31)
/* 000059C4 FC010028 */ fsub f0, f1, f0
/* 000059C8 FC000018 */ frsp f0, f0
/* 000059CC D0010028 */ stfs f0, 0x28(r1)
/* 000059D0 88110000 */ lbz r0, 0(r17)
/* 000059D4 7C000774 */ extsb r0, r0
/* 000059D8 7C160000 */ cmpw r22, r0
/* 000059DC 40810010 */ ble lbl_000059EC
/* 000059E0 88D4003B */ lbz r6, 0x3b(r20)
/* 000059E4 7CC60774 */ extsb r6, r6
/* 000059E8 48000008 */ b lbl_000059F0
lbl_000059EC:
/* 000059EC 38C00000 */ li r6, 0
lbl_000059F0:
/* 000059F0 6F248000 */ xoris r4, r25, 0x8000
/* 000059F4 A8120000 */ lha r0, 0(r18)
/* 000059F8 9081011C */ stw r4, 0x11c(r1)
/* 000059FC 3CA00000 */ lis r5, lbl_0000C380@ha
/* 00005A00 6C048000 */ xoris r4, r0, 0x8000
/* 00005A04 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 00005A08 93810118 */ stw r28, 0x118(r1)
/* 00005A0C 6CC08000 */ xoris r0, r6, 0x8000
/* 00005A10 C85F0080 */ lfd f2, 0x80(r31)
/* 00005A14 C8010118 */ lfd f0, 0x118(r1)
/* 00005A18 3CA00000 */ lis r5, lbl_0000C380@ha
/* 00005A1C 90810114 */ stw r4, 0x114(r1)
/* 00005A20 3C800000 */ lis r4, lbl_0000C380@ha
/* 00005A24 FC000828 */ fsub f0, f0, f1
/* 00005A28 9001010C */ stw r0, 0x10c(r1)
/* 00005A2C C87F0078 */ lfd f3, 0x78(r31)
/* 00005A30 FC420032 */ fmul f2, f2, f0
/* 00005A34 93810110 */ stw r28, 0x110(r1)
/* 00005A38 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 00005A3C C8010110 */ lfd f0, 0x110(r1)
/* 00005A40 93810108 */ stw r28, 0x108(r1)
/* 00005A44 FFE3102A */ fadd f31, f3, f2
/* 00005A48 FC400828 */ fsub f2, f0, f1
/* 00005A4C C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00005A50 C8010108 */ lfd f0, 0x108(r1)
/* 00005A54 FC5F102A */ fadd f2, f31, f2
/* 00005A58 FC000828 */ fsub f0, f0, f1
/* 00005A5C FC02002A */ fadd f0, f2, f0
/* 00005A60 FC000018 */ frsp f0, f0
/* 00005A64 D001002C */ stfs f0, 0x2c(r1)
/* 00005A68 A0170002 */ lhz r0, 2(r23)
/* 00005A6C 540405EF */ rlwinm. r4, r0, 0, 0x17, 0x17
/* 00005A70 41820124 */ beq lbl_00005B94
/* 00005A74 80130014 */ lwz r0, 0x14(r19)
/* 00005A78 7C160000 */ cmpw r22, r0
/* 00005A7C 4082001C */ bne lbl_00005A98
/* 00005A80 380000FF */ li r0, 0xff
/* 00005A84 98010030 */ stb r0, 0x30(r1)
/* 00005A88 38000000 */ li r0, 0
/* 00005A8C 98010031 */ stb r0, 0x31(r1)
/* 00005A90 98010032 */ stb r0, 0x32(r1)
/* 00005A94 48000018 */ b lbl_00005AAC
lbl_00005A98:
/* 00005A98 3800008F */ li r0, 0x8f
/* 00005A9C 98010030 */ stb r0, 0x30(r1)
/* 00005AA0 38000000 */ li r0, 0
/* 00005AA4 98010031 */ stb r0, 0x31(r1)
/* 00005AA8 98010032 */ stb r0, 0x32(r1)
lbl_00005AAC:
/* 00005AAC 387E0000 */ addi r3, r30, 0
/* 00005AB0 4CC63182 */ crclr 6
/* 00005AB4 389D055C */ addi r4, r29, 0x55c
/* 00005AB8 4BFFA6F5 */ bl sprintf
/* 00005ABC 4BFFA6F1 */ bl reset_text_draw_settings
/* 00005AC0 88610025 */ lbz r3, 0x25(r1)
/* 00005AC4 4BFFA6E9 */ bl set_text_font
/* 00005AC8 C0210064 */ lfs f1, 0x64(r1)
/* 00005ACC C0410068 */ lfs f2, 0x68(r1)
/* 00005AD0 4BFFA6DD */ bl set_text_scale
/* 00005AD4 80610098 */ lwz r3, 0x98(r1)
/* 00005AD8 4BFFA6D5 */ bl func_80071B50
/* 00005ADC C83F0028 */ lfd f1, 0x28(r31)
/* 00005AE0 C0010070 */ lfs f0, 0x70(r1)
/* 00005AE4 FC21002A */ fadd f1, f1, f0
/* 00005AE8 FC200818 */ frsp f1, f1
/* 00005AEC 4BFFA6C1 */ bl func_80071B1C
/* 00005AF0 38600000 */ li r3, 0
/* 00005AF4 4BFFA6B9 */ bl set_text_mul_color
/* 00005AF8 88010095 */ lbz r0, 0x95(r1)
/* 00005AFC 88610094 */ lbz r3, 0x94(r1)
/* 00005B00 5400402E */ slwi r0, r0, 8
/* 00005B04 88810096 */ lbz r4, 0x96(r1)
/* 00005B08 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005B0C 7C830378 */ or r3, r4, r0
/* 00005B10 4BFFA69D */ bl set_text_add_color
/* 00005B14 C85F0030 */ lfd f2, 0x30(r31)
/* 00005B18 C0210028 */ lfs f1, 0x28(r1)
/* 00005B1C C001002C */ lfs f0, 0x2c(r1)
/* 00005B20 FC22082A */ fadd f1, f2, f1
/* 00005B24 FC42002A */ fadd f2, f2, f0
/* 00005B28 FC200818 */ frsp f1, f1
/* 00005B2C FC401018 */ frsp f2, f2
/* 00005B30 4BFFA67D */ bl set_text_pos
/* 00005B34 7FC3F378 */ mr r3, r30
/* 00005B38 4BFFA675 */ bl u_draw_text
/* 00005B3C C0210070 */ lfs f1, 0x70(r1)
/* 00005B40 4BFFA66D */ bl func_80071B1C
/* 00005B44 88010031 */ lbz r0, 0x31(r1)
/* 00005B48 88610030 */ lbz r3, 0x30(r1)
/* 00005B4C 5400402E */ slwi r0, r0, 8
/* 00005B50 88810032 */ lbz r4, 0x32(r1)
/* 00005B54 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005B58 7C830378 */ or r3, r4, r0
/* 00005B5C 4BFFA651 */ bl set_text_mul_color
/* 00005B60 88010095 */ lbz r0, 0x95(r1)
/* 00005B64 88610094 */ lbz r3, 0x94(r1)
/* 00005B68 5400402E */ slwi r0, r0, 8
/* 00005B6C 88810096 */ lbz r4, 0x96(r1)
/* 00005B70 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005B74 7C830378 */ or r3, r4, r0
/* 00005B78 4BFFA635 */ bl set_text_add_color
/* 00005B7C C0210028 */ lfs f1, 0x28(r1)
/* 00005B80 C041002C */ lfs f2, 0x2c(r1)
/* 00005B84 4BFFA629 */ bl set_text_pos
/* 00005B88 7FC3F378 */ mr r3, r30
/* 00005B8C 4BFFA621 */ bl u_draw_text
/* 00005B90 48000224 */ b lbl_00005DB4
lbl_00005B94:
/* 00005B94 80930014 */ lwz r4, 0x14(r19)
/* 00005B98 7C162000 */ cmpw r22, r4
/* 00005B9C 4082001C */ bne lbl_00005BB8
/* 00005BA0 38A000FF */ li r5, 0xff
/* 00005BA4 98A10030 */ stb r5, 0x30(r1)
/* 00005BA8 38800000 */ li r4, 0
/* 00005BAC 98A10031 */ stb r5, 0x31(r1)
/* 00005BB0 98810032 */ stb r4, 0x32(r1)
/* 00005BB4 48000018 */ b lbl_00005BCC
lbl_00005BB8:
/* 00005BB8 38A0008F */ li r5, 0x8f
/* 00005BBC 98A10030 */ stb r5, 0x30(r1)
/* 00005BC0 38800000 */ li r4, 0
/* 00005BC4 98A10031 */ stb r5, 0x31(r1)
/* 00005BC8 98810032 */ stb r4, 0x32(r1)
lbl_00005BCC:
/* 00005BCC 540406B5 */ rlwinm. r4, r0, 0, 0x1a, 0x1a
/* 00005BD0 38DD056C */ addi r6, r29, 0x56c
/* 00005BD4 41820008 */ beq lbl_00005BDC
/* 00005BD8 38DD0574 */ addi r6, r29, 0x574
lbl_00005BDC:
/* 00005BDC 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00005BE0 4182000C */ beq lbl_00005BEC
/* 00005BE4 38DD057C */ addi r6, r29, 0x57c
/* 00005BE8 38600001 */ li r3, 1
lbl_00005BEC:
/* 00005BEC 2C030000 */ cmpwi r3, 0
/* 00005BF0 4182000C */ beq lbl_00005BFC
/* 00005BF4 38BD0584 */ addi r5, r29, 0x584
/* 00005BF8 48000014 */ b lbl_00005C0C
lbl_00005BFC:
/* 00005BFC 88170005 */ lbz r0, 5(r23)
/* 00005C00 5400103A */ slwi r0, r0, 2
/* 00005C04 7C7D0214 */ add r3, r29, r0
/* 00005C08 80A303A0 */ lwz r5, 0x3a0(r3)
lbl_00005C0C:
/* 00005C0C 88F70006 */ lbz r7, 6(r23)
/* 00005C10 387E0000 */ addi r3, r30, 0
/* 00005C14 4CC63182 */ crclr 6
/* 00005C18 389D0588 */ addi r4, r29, 0x588
/* 00005C1C 4BFFA591 */ bl sprintf
/* 00005C20 4BFFA58D */ bl reset_text_draw_settings
/* 00005C24 88610025 */ lbz r3, 0x25(r1)
/* 00005C28 4BFFA585 */ bl set_text_font
/* 00005C2C C0210064 */ lfs f1, 0x64(r1)
/* 00005C30 C0410068 */ lfs f2, 0x68(r1)
/* 00005C34 4BFFA579 */ bl set_text_scale
/* 00005C38 80610098 */ lwz r3, 0x98(r1)
/* 00005C3C 4BFFA571 */ bl func_80071B50
/* 00005C40 C83F0028 */ lfd f1, 0x28(r31)
/* 00005C44 C0010070 */ lfs f0, 0x70(r1)
/* 00005C48 FC21002A */ fadd f1, f1, f0
/* 00005C4C FC200818 */ frsp f1, f1
/* 00005C50 4BFFA55D */ bl func_80071B1C
/* 00005C54 38600000 */ li r3, 0
/* 00005C58 4BFFA555 */ bl set_text_mul_color
/* 00005C5C 88010095 */ lbz r0, 0x95(r1)
/* 00005C60 88610094 */ lbz r3, 0x94(r1)
/* 00005C64 5400402E */ slwi r0, r0, 8
/* 00005C68 88810096 */ lbz r4, 0x96(r1)
/* 00005C6C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005C70 7C830378 */ or r3, r4, r0
/* 00005C74 4BFFA539 */ bl set_text_add_color
/* 00005C78 C85F0030 */ lfd f2, 0x30(r31)
/* 00005C7C C0210028 */ lfs f1, 0x28(r1)
/* 00005C80 C001002C */ lfs f0, 0x2c(r1)
/* 00005C84 FC22082A */ fadd f1, f2, f1
/* 00005C88 FC42002A */ fadd f2, f2, f0
/* 00005C8C FC200818 */ frsp f1, f1
/* 00005C90 FC401018 */ frsp f2, f2
/* 00005C94 4BFFA519 */ bl set_text_pos
/* 00005C98 7FC3F378 */ mr r3, r30
/* 00005C9C 4BFFA511 */ bl u_draw_text
/* 00005CA0 C0210070 */ lfs f1, 0x70(r1)
/* 00005CA4 4BFFA509 */ bl func_80071B1C
/* 00005CA8 88010031 */ lbz r0, 0x31(r1)
/* 00005CAC 88610030 */ lbz r3, 0x30(r1)
/* 00005CB0 5400402E */ slwi r0, r0, 8
/* 00005CB4 88810032 */ lbz r4, 0x32(r1)
/* 00005CB8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005CBC 7C830378 */ or r3, r4, r0
/* 00005CC0 4BFFA4ED */ bl set_text_mul_color
/* 00005CC4 88010095 */ lbz r0, 0x95(r1)
/* 00005CC8 88610094 */ lbz r3, 0x94(r1)
/* 00005CCC 5400402E */ slwi r0, r0, 8
/* 00005CD0 88810096 */ lbz r4, 0x96(r1)
/* 00005CD4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005CD8 7C830378 */ or r3, r4, r0
/* 00005CDC 4BFFA4D1 */ bl set_text_add_color
/* 00005CE0 C0210028 */ lfs f1, 0x28(r1)
/* 00005CE4 C041002C */ lfs f2, 0x2c(r1)
/* 00005CE8 4BFFA4C5 */ bl set_text_pos
/* 00005CEC 7FC3F378 */ mr r3, r30
/* 00005CF0 4BFFA4BD */ bl u_draw_text
/* 00005CF4 88170007 */ lbz r0, 7(r23)
/* 00005CF8 5400083C */ slwi r0, r0, 1
/* 00005CFC 7C7D0214 */ add r3, r29, r0
/* 00005D00 A8030488 */ lha r0, 0x488(r3)
/* 00005D04 901D0438 */ stw r0, 0x438(r29)
/* 00005D08 C0300000 */ lfs f1, 0(r16)
/* 00005D0C C81F0100 */ lfd f0, 0x100(r31)
/* 00005D10 FC010028 */ fsub f0, f1, f0
/* 00005D14 FC000018 */ frsp f0, f0
/* 00005D18 D01D043C */ stfs f0, 0x43c(r29)
/* 00005D1C 88110000 */ lbz r0, 0(r17)
/* 00005D20 7C000774 */ extsb r0, r0
/* 00005D24 7C160000 */ cmpw r22, r0
/* 00005D28 40810010 */ ble lbl_00005D38
/* 00005D2C 8814003B */ lbz r0, 0x3b(r20)
/* 00005D30 7C000774 */ extsb r0, r0
/* 00005D34 48000008 */ b lbl_00005D3C
lbl_00005D38:
/* 00005D38 38000000 */ li r0, 0
lbl_00005D3C:
/* 00005D3C A8720000 */ lha r3, 0(r18)
/* 00005D40 6C008000 */ xoris r0, r0, 0x8000
/* 00005D44 90010114 */ stw r0, 0x114(r1)
/* 00005D48 3C800000 */ lis r4, lbl_0000C380@ha
/* 00005D4C 6C608000 */ xoris r0, r3, 0x8000
/* 00005D50 9001010C */ stw r0, 0x10c(r1)
/* 00005D54 3C600000 */ lis r3, lbl_0000C380@ha
/* 00005D58 C85F0108 */ lfd f2, 0x108(r31)
/* 00005D5C 93810108 */ stw r28, 0x108(r1)
/* 00005D60 C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00005D64 FC62F82A */ fadd f3, f2, f31
/* 00005D68 C8010108 */ lfd f0, 0x108(r1)
/* 00005D6C 93810110 */ stw r28, 0x110(r1)
/* 00005D70 FC400828 */ fsub f2, f0, f1
/* 00005D74 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00005D78 C8010110 */ lfd f0, 0x110(r1)
/* 00005D7C FC43102A */ fadd f2, f3, f2
/* 00005D80 FC000828 */ fsub f0, f0, f1
/* 00005D84 FC02002A */ fadd f0, f2, f0
/* 00005D88 FC000018 */ frsp f0, f0
/* 00005D8C D0180008 */ stfs f0, 8(r24)
/* 00005D90 80130014 */ lwz r0, 0x14(r19)
/* 00005D94 7C160000 */ cmpw r22, r0
/* 00005D98 40820010 */ bne lbl_00005DA8
/* 00005D9C 3800FFFF */ li r0, -1
/* 00005DA0 90180038 */ stw r0, 0x38(r24)
/* 00005DA4 48000008 */ b lbl_00005DAC
lbl_00005DA8:
/* 00005DA8 91D80038 */ stw r14, 0x38(r24)
lbl_00005DAC:
/* 00005DAC 7F03C378 */ mr r3, r24
/* 00005DB0 4BFFA3FD */ bl draw_naomi_sprite
lbl_00005DB4:
/* 00005DB4 3AB50018 */ addi r21, r21, 0x18
/* 00005DB8 3B390001 */ addi r25, r25, 1
lbl_00005DBC:
/* 00005DBC 2C190007 */ cmpwi r25, 7
/* 00005DC0 40800014 */ bge lbl_00005DD4
/* 00005DC4 88150014 */ lbz r0, 0x14(r21)
/* 00005DC8 7C000774 */ extsb r0, r0
/* 00005DCC 2C00FFFF */ cmpwi r0, -1
/* 00005DD0 4082FBB0 */ bne lbl_00005980
lbl_00005DD4:
/* 00005DD4 C01F0088 */ lfs f0, 0x88(r31)
/* 00005DD8 3C600000 */ lis r3, lbl_10000000@ha
/* 00005DDC 38630000 */ addi r3, r3, lbl_10000000@l
/* 00005DE0 D0010070 */ stfs f0, 0x70(r1)
/* 00005DE4 3A030010 */ addi r16, r3, 0x10
/* 00005DE8 387D0490 */ addi r3, r29, 0x490
/* 00005DEC C0100000 */ lfs f0, 0(r16)
/* 00005DF0 D01D0494 */ stfs f0, 0x494(r29)
/* 00005DF4 4BFFA3B9 */ bl draw_naomi_sprite
/* 00005DF8 3A200000 */ li r17, 0
/* 00005DFC 5620103A */ slwi r0, r17, 2
/* 00005E00 7DFD0214 */ add r15, r29, r0
/* 00005E04 3DC04330 */ lis r14, 0x4330
/* 00005E08 39EF03C0 */ addi r15, r15, 0x3c0
lbl_00005E0C:
/* 00005E0C 80130018 */ lwz r0, 0x18(r19)
/* 00005E10 7C110000 */ cmpw r17, r0
/* 00005E14 4082001C */ bne lbl_00005E30
/* 00005E18 386000FF */ li r3, 0xff
/* 00005E1C 98610030 */ stb r3, 0x30(r1)
/* 00005E20 38000000 */ li r0, 0
/* 00005E24 98610031 */ stb r3, 0x31(r1)
/* 00005E28 98010032 */ stb r0, 0x32(r1)
/* 00005E2C 48000018 */ b lbl_00005E44
lbl_00005E30:
/* 00005E30 3860008F */ li r3, 0x8f
/* 00005E34 98610030 */ stb r3, 0x30(r1)
/* 00005E38 38000000 */ li r0, 0
/* 00005E3C 98610031 */ stb r3, 0x31(r1)
/* 00005E40 98010032 */ stb r0, 0x32(r1)
lbl_00005E44:
/* 00005E44 7FC3F378 */ mr r3, r30
/* 00005E48 808F0000 */ lwz r4, 0(r15)
/* 00005E4C 4BFFA361 */ bl strcpy
/* 00005E50 4BFFA35D */ bl reset_text_draw_settings
/* 00005E54 88610025 */ lbz r3, 0x25(r1)
/* 00005E58 4BFFA355 */ bl set_text_font
/* 00005E5C C0210064 */ lfs f1, 0x64(r1)
/* 00005E60 C0410068 */ lfs f2, 0x68(r1)
/* 00005E64 4BFFA349 */ bl set_text_scale
/* 00005E68 80610098 */ lwz r3, 0x98(r1)
/* 00005E6C 4BFFA341 */ bl func_80071B50
/* 00005E70 C0210070 */ lfs f1, 0x70(r1)
/* 00005E74 4BFFA339 */ bl func_80071B1C
/* 00005E78 88010031 */ lbz r0, 0x31(r1)
/* 00005E7C 88610030 */ lbz r3, 0x30(r1)
/* 00005E80 5400402E */ slwi r0, r0, 8
/* 00005E84 88810032 */ lbz r4, 0x32(r1)
/* 00005E88 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005E8C 7C830378 */ or r3, r4, r0
/* 00005E90 4BFFA31D */ bl set_text_mul_color
/* 00005E94 88010095 */ lbz r0, 0x95(r1)
/* 00005E98 88610094 */ lbz r3, 0x94(r1)
/* 00005E9C 5400402E */ slwi r0, r0, 8
/* 00005EA0 88810096 */ lbz r4, 0x96(r1)
/* 00005EA4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005EA8 7C830378 */ or r3, r4, r0
/* 00005EAC 4BFFA301 */ bl set_text_add_color
/* 00005EB0 7FC3F378 */ mr r3, r30
/* 00005EB4 4BFFA2F9 */ bl u_get_text_width
/* 00005EB8 C81F0058 */ lfd f0, 0x58(r31)
/* 00005EBC 6E208000 */ xoris r0, r17, 0x8000
/* 00005EC0 9001010C */ stw r0, 0x10c(r1)
/* 00005EC4 3C600000 */ lis r3, lbl_0000C380@ha
/* 00005EC8 FC000072 */ fmul f0, f0, f1
/* 00005ECC C0300000 */ lfs f1, 0(r16)
/* 00005ED0 91C10108 */ stw r14, 0x108(r1)
/* 00005ED4 FC210028 */ fsub f1, f1, f0
/* 00005ED8 C8010108 */ lfd f0, 0x108(r1)
/* 00005EDC FC200818 */ frsp f1, f1
/* 00005EE0 D0210028 */ stfs f1, 0x28(r1)
/* 00005EE4 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00005EE8 C85F0080 */ lfd f2, 0x80(r31)
/* 00005EEC FC000828 */ fsub f0, f0, f1
/* 00005EF0 C83F0110 */ lfd f1, 0x110(r31)
/* 00005EF4 FC020032 */ fmul f0, f2, f0
/* 00005EF8 FC01002A */ fadd f0, f1, f0
/* 00005EFC FC000018 */ frsp f0, f0
/* 00005F00 D001002C */ stfs f0, 0x2c(r1)
/* 00005F04 4BFFA2A9 */ bl reset_text_draw_settings
/* 00005F08 88610025 */ lbz r3, 0x25(r1)
/* 00005F0C 4BFFA2A1 */ bl set_text_font
/* 00005F10 C0210064 */ lfs f1, 0x64(r1)
/* 00005F14 C0410068 */ lfs f2, 0x68(r1)
/* 00005F18 4BFFA295 */ bl set_text_scale
/* 00005F1C 80610098 */ lwz r3, 0x98(r1)
/* 00005F20 4BFFA28D */ bl func_80071B50
/* 00005F24 C83F0028 */ lfd f1, 0x28(r31)
/* 00005F28 C0010070 */ lfs f0, 0x70(r1)
/* 00005F2C FC21002A */ fadd f1, f1, f0
/* 00005F30 FC200818 */ frsp f1, f1
/* 00005F34 4BFFA279 */ bl func_80071B1C
/* 00005F38 38600000 */ li r3, 0
/* 00005F3C 4BFFA271 */ bl set_text_mul_color
/* 00005F40 88010095 */ lbz r0, 0x95(r1)
/* 00005F44 88610094 */ lbz r3, 0x94(r1)
/* 00005F48 5400402E */ slwi r0, r0, 8
/* 00005F4C 88810096 */ lbz r4, 0x96(r1)
/* 00005F50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005F54 7C830378 */ or r3, r4, r0
/* 00005F58 4BFFA255 */ bl set_text_add_color
/* 00005F5C C85F0030 */ lfd f2, 0x30(r31)
/* 00005F60 C0210028 */ lfs f1, 0x28(r1)
/* 00005F64 C001002C */ lfs f0, 0x2c(r1)
/* 00005F68 FC22082A */ fadd f1, f2, f1
/* 00005F6C FC42002A */ fadd f2, f2, f0
/* 00005F70 FC200818 */ frsp f1, f1
/* 00005F74 FC401018 */ frsp f2, f2
/* 00005F78 4BFFA235 */ bl set_text_pos
/* 00005F7C 7FC3F378 */ mr r3, r30
/* 00005F80 4BFFA22D */ bl u_draw_text
/* 00005F84 C0210070 */ lfs f1, 0x70(r1)
/* 00005F88 4BFFA225 */ bl func_80071B1C
/* 00005F8C 88010031 */ lbz r0, 0x31(r1)
/* 00005F90 88610030 */ lbz r3, 0x30(r1)
/* 00005F94 5400402E */ slwi r0, r0, 8
/* 00005F98 88810032 */ lbz r4, 0x32(r1)
/* 00005F9C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005FA0 7C830378 */ or r3, r4, r0
/* 00005FA4 4BFFA209 */ bl set_text_mul_color
/* 00005FA8 88010095 */ lbz r0, 0x95(r1)
/* 00005FAC 88610094 */ lbz r3, 0x94(r1)
/* 00005FB0 5400402E */ slwi r0, r0, 8
/* 00005FB4 88810096 */ lbz r4, 0x96(r1)
/* 00005FB8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005FBC 7C830378 */ or r3, r4, r0
/* 00005FC0 4BFFA1ED */ bl set_text_add_color
/* 00005FC4 C0210028 */ lfs f1, 0x28(r1)
/* 00005FC8 C041002C */ lfs f2, 0x2c(r1)
/* 00005FCC 4BFFA1E1 */ bl set_text_pos
/* 00005FD0 7FC3F378 */ mr r3, r30
/* 00005FD4 4BFFA1D9 */ bl u_draw_text
/* 00005FD8 3A310001 */ addi r17, r17, 1
/* 00005FDC 28110002 */ cmplwi r17, 2
/* 00005FE0 39EF0004 */ addi r15, r15, 4
/* 00005FE4 4180FE28 */ blt lbl_00005E0C
/* 00005FE8 3C600000 */ lis r3, lbl_10000000@ha
/* 00005FEC 3A430000 */ addi r18, r3, lbl_10000000@l
/* 00005FF0 C0120014 */ lfs f0, 0x14(r18)
/* 00005FF4 3A120014 */ addi r16, r18, 0x14
/* 00005FF8 387D04E0 */ addi r3, r29, 0x4e0
/* 00005FFC D01D04E4 */ stfs f0, 0x4e4(r29)
/* 00006000 4BFFA1AD */ bl draw_naomi_sprite
/* 00006004 380000EF */ li r0, 0xef
/* 00006008 98010030 */ stb r0, 0x30(r1)
/* 0000600C 3800009A */ li r0, 0x9a
/* 00006010 3A200000 */ li r17, 0
/* 00006014 98010031 */ stb r0, 0x31(r1)
/* 00006018 387E0000 */ addi r3, r30, 0
/* 0000601C 389D0594 */ addi r4, r29, 0x594
/* 00006020 9A210032 */ stb r17, 0x32(r1)
/* 00006024 4BFFA189 */ bl strcpy
/* 00006028 4BFFA185 */ bl reset_text_draw_settings
/* 0000602C 88610025 */ lbz r3, 0x25(r1)
/* 00006030 4BFFA17D */ bl set_text_font
/* 00006034 C0210064 */ lfs f1, 0x64(r1)
/* 00006038 C0410068 */ lfs f2, 0x68(r1)
/* 0000603C 4BFFA171 */ bl set_text_scale
/* 00006040 80610098 */ lwz r3, 0x98(r1)
/* 00006044 4BFFA169 */ bl func_80071B50
/* 00006048 C0210070 */ lfs f1, 0x70(r1)
/* 0000604C 4BFFA161 */ bl func_80071B1C
/* 00006050 88010031 */ lbz r0, 0x31(r1)
/* 00006054 88610030 */ lbz r3, 0x30(r1)
/* 00006058 5400402E */ slwi r0, r0, 8
/* 0000605C 88810032 */ lbz r4, 0x32(r1)
/* 00006060 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006064 7C830378 */ or r3, r4, r0
/* 00006068 4BFFA145 */ bl set_text_mul_color
/* 0000606C 88010095 */ lbz r0, 0x95(r1)
/* 00006070 88610094 */ lbz r3, 0x94(r1)
/* 00006074 5400402E */ slwi r0, r0, 8
/* 00006078 88810096 */ lbz r4, 0x96(r1)
/* 0000607C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006080 7C830378 */ or r3, r4, r0
/* 00006084 4BFFA129 */ bl set_text_add_color
/* 00006088 7FC3F378 */ mr r3, r30
/* 0000608C 4BFFA121 */ bl u_get_text_width
/* 00006090 C81F0058 */ lfd f0, 0x58(r31)
/* 00006094 C0500000 */ lfs f2, 0(r16)
/* 00006098 FC000072 */ fmul f0, f0, f1
/* 0000609C FC020028 */ fsub f0, f2, f0
/* 000060A0 FC000018 */ frsp f0, f0
/* 000060A4 D0010028 */ stfs f0, 0x28(r1)
/* 000060A8 C01F00C8 */ lfs f0, 0xc8(r31)
/* 000060AC D001002C */ stfs f0, 0x2c(r1)
/* 000060B0 4BFFA0FD */ bl reset_text_draw_settings
/* 000060B4 88610025 */ lbz r3, 0x25(r1)
/* 000060B8 4BFFA0F5 */ bl set_text_font
/* 000060BC C0210064 */ lfs f1, 0x64(r1)
/* 000060C0 C0410068 */ lfs f2, 0x68(r1)
/* 000060C4 4BFFA0E9 */ bl set_text_scale
/* 000060C8 80610098 */ lwz r3, 0x98(r1)
/* 000060CC 4BFFA0E1 */ bl func_80071B50
/* 000060D0 C83F0028 */ lfd f1, 0x28(r31)
/* 000060D4 C0010070 */ lfs f0, 0x70(r1)
/* 000060D8 FC21002A */ fadd f1, f1, f0
/* 000060DC FC200818 */ frsp f1, f1
/* 000060E0 4BFFA0CD */ bl func_80071B1C
/* 000060E4 38600000 */ li r3, 0
/* 000060E8 4BFFA0C5 */ bl set_text_mul_color
/* 000060EC 88010095 */ lbz r0, 0x95(r1)
/* 000060F0 88610094 */ lbz r3, 0x94(r1)
/* 000060F4 5400402E */ slwi r0, r0, 8
/* 000060F8 88810096 */ lbz r4, 0x96(r1)
/* 000060FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006100 7C830378 */ or r3, r4, r0
/* 00006104 4BFFA0A9 */ bl set_text_add_color
/* 00006108 C85F0030 */ lfd f2, 0x30(r31)
/* 0000610C C0210028 */ lfs f1, 0x28(r1)
/* 00006110 C001002C */ lfs f0, 0x2c(r1)
/* 00006114 FC22082A */ fadd f1, f2, f1
/* 00006118 FC42002A */ fadd f2, f2, f0
/* 0000611C FC200818 */ frsp f1, f1
/* 00006120 FC401018 */ frsp f2, f2
/* 00006124 4BFFA089 */ bl set_text_pos
/* 00006128 7FC3F378 */ mr r3, r30
/* 0000612C 4BFFA081 */ bl u_draw_text
/* 00006130 C0210070 */ lfs f1, 0x70(r1)
/* 00006134 4BFFA079 */ bl func_80071B1C
/* 00006138 88010031 */ lbz r0, 0x31(r1)
/* 0000613C 88610030 */ lbz r3, 0x30(r1)
/* 00006140 5400402E */ slwi r0, r0, 8
/* 00006144 88810032 */ lbz r4, 0x32(r1)
/* 00006148 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000614C 7C830378 */ or r3, r4, r0
/* 00006150 4BFFA05D */ bl set_text_mul_color
/* 00006154 88010095 */ lbz r0, 0x95(r1)
/* 00006158 88610094 */ lbz r3, 0x94(r1)
/* 0000615C 5400402E */ slwi r0, r0, 8
/* 00006160 88810096 */ lbz r4, 0x96(r1)
/* 00006164 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006168 7C830378 */ or r3, r4, r0
/* 0000616C 4BFFA041 */ bl set_text_add_color
/* 00006170 C0210028 */ lfs f1, 0x28(r1)
/* 00006174 C041002C */ lfs f2, 0x2c(r1)
/* 00006178 4BFFA035 */ bl set_text_pos
/* 0000617C 7FC3F378 */ mr r3, r30
/* 00006180 4BFFA02D */ bl u_draw_text
/* 00006184 56201838 */ slwi r0, r17, 3
/* 00006188 7DFD0214 */ add r15, r29, r0
/* 0000618C 3DC04330 */ lis r14, 0x4330
/* 00006190 39EF03D8 */ addi r15, r15, 0x3d8
lbl_00006194:
/* 00006194 80120004 */ lwz r0, 4(r18)
/* 00006198 7C110000 */ cmpw r17, r0
/* 0000619C 4082001C */ bne lbl_000061B8
/* 000061A0 386000FF */ li r3, 0xff
/* 000061A4 98610030 */ stb r3, 0x30(r1)
/* 000061A8 38000000 */ li r0, 0
/* 000061AC 98610031 */ stb r3, 0x31(r1)
/* 000061B0 98010032 */ stb r0, 0x32(r1)
/* 000061B4 48000018 */ b lbl_000061CC
lbl_000061B8:
/* 000061B8 3860008F */ li r3, 0x8f
/* 000061BC 98610030 */ stb r3, 0x30(r1)
/* 000061C0 38000000 */ li r0, 0
/* 000061C4 98610031 */ stb r3, 0x31(r1)
/* 000061C8 98010032 */ stb r0, 0x32(r1)
lbl_000061CC:
/* 000061CC 7FC3F378 */ mr r3, r30
/* 000061D0 808F0000 */ lwz r4, 0(r15)
/* 000061D4 4BFF9FD9 */ bl strcpy
/* 000061D8 4BFF9FD5 */ bl reset_text_draw_settings
/* 000061DC 88610025 */ lbz r3, 0x25(r1)
/* 000061E0 4BFF9FCD */ bl set_text_font
/* 000061E4 C0210064 */ lfs f1, 0x64(r1)
/* 000061E8 C0410068 */ lfs f2, 0x68(r1)
/* 000061EC 4BFF9FC1 */ bl set_text_scale
/* 000061F0 80610098 */ lwz r3, 0x98(r1)
/* 000061F4 4BFF9FB9 */ bl func_80071B50
/* 000061F8 C0210070 */ lfs f1, 0x70(r1)
/* 000061FC 4BFF9FB1 */ bl func_80071B1C
/* 00006200 88010031 */ lbz r0, 0x31(r1)
/* 00006204 88610030 */ lbz r3, 0x30(r1)
/* 00006208 5400402E */ slwi r0, r0, 8
/* 0000620C 88810032 */ lbz r4, 0x32(r1)
/* 00006210 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006214 7C830378 */ or r3, r4, r0
/* 00006218 4BFF9F95 */ bl set_text_mul_color
/* 0000621C 88010095 */ lbz r0, 0x95(r1)
/* 00006220 88610094 */ lbz r3, 0x94(r1)
/* 00006224 5400402E */ slwi r0, r0, 8
/* 00006228 88810096 */ lbz r4, 0x96(r1)
/* 0000622C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006230 7C830378 */ or r3, r4, r0
/* 00006234 4BFF9F79 */ bl set_text_add_color
/* 00006238 7FC3F378 */ mr r3, r30
/* 0000623C 4BFF9F71 */ bl u_get_text_width
/* 00006240 C81F0058 */ lfd f0, 0x58(r31)
/* 00006244 6E208000 */ xoris r0, r17, 0x8000
/* 00006248 9001010C */ stw r0, 0x10c(r1)
/* 0000624C 3C600000 */ lis r3, lbl_0000C380@ha
/* 00006250 FC000072 */ fmul f0, f0, f1
/* 00006254 C0300000 */ lfs f1, 0(r16)
/* 00006258 91C10108 */ stw r14, 0x108(r1)
/* 0000625C FC210028 */ fsub f1, f1, f0
/* 00006260 C8010108 */ lfd f0, 0x108(r1)
/* 00006264 FC200818 */ frsp f1, f1
/* 00006268 D0210028 */ stfs f1, 0x28(r1)
/* 0000626C C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00006270 C85F0080 */ lfd f2, 0x80(r31)
/* 00006274 FC000828 */ fsub f0, f0, f1
/* 00006278 C83F0118 */ lfd f1, 0x118(r31)
/* 0000627C FC020032 */ fmul f0, f2, f0
/* 00006280 FC01002A */ fadd f0, f1, f0
/* 00006284 FC000018 */ frsp f0, f0
/* 00006288 D001002C */ stfs f0, 0x2c(r1)
/* 0000628C 4BFF9F21 */ bl reset_text_draw_settings
/* 00006290 88610025 */ lbz r3, 0x25(r1)
/* 00006294 4BFF9F19 */ bl set_text_font
/* 00006298 C0210064 */ lfs f1, 0x64(r1)
/* 0000629C C0410068 */ lfs f2, 0x68(r1)
/* 000062A0 4BFF9F0D */ bl set_text_scale
/* 000062A4 80610098 */ lwz r3, 0x98(r1)
/* 000062A8 4BFF9F05 */ bl func_80071B50
/* 000062AC C83F0028 */ lfd f1, 0x28(r31)
/* 000062B0 C0010070 */ lfs f0, 0x70(r1)
/* 000062B4 FC21002A */ fadd f1, f1, f0
/* 000062B8 FC200818 */ frsp f1, f1
/* 000062BC 4BFF9EF1 */ bl func_80071B1C
/* 000062C0 38600000 */ li r3, 0
/* 000062C4 4BFF9EE9 */ bl set_text_mul_color
/* 000062C8 88010095 */ lbz r0, 0x95(r1)
/* 000062CC 88610094 */ lbz r3, 0x94(r1)
/* 000062D0 5400402E */ slwi r0, r0, 8
/* 000062D4 88810096 */ lbz r4, 0x96(r1)
/* 000062D8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000062DC 7C830378 */ or r3, r4, r0
/* 000062E0 4BFF9ECD */ bl set_text_add_color
/* 000062E4 C85F0030 */ lfd f2, 0x30(r31)
/* 000062E8 C0210028 */ lfs f1, 0x28(r1)
/* 000062EC C001002C */ lfs f0, 0x2c(r1)
/* 000062F0 FC22082A */ fadd f1, f2, f1
/* 000062F4 FC42002A */ fadd f2, f2, f0
/* 000062F8 FC200818 */ frsp f1, f1
/* 000062FC FC401018 */ frsp f2, f2
/* 00006300 4BFF9EAD */ bl set_text_pos
/* 00006304 7FC3F378 */ mr r3, r30
/* 00006308 4BFF9EA5 */ bl u_draw_text
/* 0000630C C0210070 */ lfs f1, 0x70(r1)
/* 00006310 4BFF9E9D */ bl func_80071B1C
/* 00006314 88010031 */ lbz r0, 0x31(r1)
/* 00006318 88610030 */ lbz r3, 0x30(r1)
/* 0000631C 5400402E */ slwi r0, r0, 8
/* 00006320 88810032 */ lbz r4, 0x32(r1)
/* 00006324 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006328 7C830378 */ or r3, r4, r0
/* 0000632C 4BFF9E81 */ bl set_text_mul_color
/* 00006330 88010095 */ lbz r0, 0x95(r1)
/* 00006334 88610094 */ lbz r3, 0x94(r1)
/* 00006338 5400402E */ slwi r0, r0, 8
/* 0000633C 88810096 */ lbz r4, 0x96(r1)
/* 00006340 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006344 7C830378 */ or r3, r4, r0
/* 00006348 4BFF9E65 */ bl set_text_add_color
/* 0000634C C0210028 */ lfs f1, 0x28(r1)
/* 00006350 C041002C */ lfs f2, 0x2c(r1)
/* 00006354 4BFF9E59 */ bl set_text_pos
/* 00006358 7FC3F378 */ mr r3, r30
/* 0000635C 4BFF9E51 */ bl u_draw_text
/* 00006360 3A310001 */ addi r17, r17, 1
/* 00006364 28110002 */ cmplwi r17, 2
/* 00006368 39EF0008 */ addi r15, r15, 8
/* 0000636C 4180FE28 */ blt lbl_00006194
/* 00006370 80130014 */ lwz r0, 0x14(r19)
/* 00006374 3C600000 */ lis r3, lbl_1000629C@ha
/* 00006378 39C30000 */ addi r14, r3, lbl_1000629C@l
/* 0000637C 1C000018 */ mulli r0, r0, 0x18
/* 00006380 7C6E0214 */ add r3, r14, r0
/* 00006384 A0030002 */ lhz r0, 2(r3)
/* 00006388 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000638C 41820300 */ beq lbl_0000668C
/* 00006390 380000FF */ li r0, 0xff
/* 00006394 4CC63182 */ crclr 6
/* 00006398 98010030 */ stb r0, 0x30(r1)
/* 0000639C 387E0000 */ addi r3, r30, 0
/* 000063A0 389D05A4 */ addi r4, r29, 0x5a4
/* 000063A4 98010031 */ stb r0, 0x31(r1)
/* 000063A8 98010032 */ stb r0, 0x32(r1)
/* 000063AC C01F00A4 */ lfs f0, 0xa4(r31)
/* 000063B0 D0010064 */ stfs f0, 0x64(r1)
/* 000063B4 4BFF9DF9 */ bl sprintf
/* 000063B8 4BFF9DF5 */ bl reset_text_draw_settings
/* 000063BC 88610025 */ lbz r3, 0x25(r1)
/* 000063C0 4BFF9DED */ bl set_text_font
/* 000063C4 C0210064 */ lfs f1, 0x64(r1)
/* 000063C8 C0410068 */ lfs f2, 0x68(r1)
/* 000063CC 4BFF9DE1 */ bl set_text_scale
/* 000063D0 80610098 */ lwz r3, 0x98(r1)
/* 000063D4 4BFF9DD9 */ bl func_80071B50
/* 000063D8 C0210070 */ lfs f1, 0x70(r1)
/* 000063DC 4BFF9DD1 */ bl func_80071B1C
/* 000063E0 88010031 */ lbz r0, 0x31(r1)
/* 000063E4 88610030 */ lbz r3, 0x30(r1)
/* 000063E8 5400402E */ slwi r0, r0, 8
/* 000063EC 88810032 */ lbz r4, 0x32(r1)
/* 000063F0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000063F4 7C830378 */ or r3, r4, r0
/* 000063F8 4BFF9DB5 */ bl set_text_mul_color
/* 000063FC 88010095 */ lbz r0, 0x95(r1)
/* 00006400 88610094 */ lbz r3, 0x94(r1)
/* 00006404 5400402E */ slwi r0, r0, 8
/* 00006408 88810096 */ lbz r4, 0x96(r1)
/* 0000640C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006410 7C830378 */ or r3, r4, r0
/* 00006414 4BFF9D99 */ bl set_text_add_color
/* 00006418 7FC3F378 */ mr r3, r30
/* 0000641C 4BFF9D91 */ bl u_get_text_width
/* 00006420 C81F0058 */ lfd f0, 0x58(r31)
/* 00006424 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00006428 FC000072 */ fmul f0, f0, f1
/* 0000642C FC020028 */ fsub f0, f2, f0
/* 00006430 FC000018 */ frsp f0, f0
/* 00006434 D0010028 */ stfs f0, 0x28(r1)
/* 00006438 C01F0120 */ lfs f0, 0x120(r31)
/* 0000643C D001002C */ stfs f0, 0x2c(r1)
/* 00006440 4BFF9D6D */ bl reset_text_draw_settings
/* 00006444 88610025 */ lbz r3, 0x25(r1)
/* 00006448 4BFF9D65 */ bl set_text_font
/* 0000644C C0210064 */ lfs f1, 0x64(r1)
/* 00006450 C0410068 */ lfs f2, 0x68(r1)
/* 00006454 4BFF9D59 */ bl set_text_scale
/* 00006458 80610098 */ lwz r3, 0x98(r1)
/* 0000645C 4BFF9D51 */ bl func_80071B50
/* 00006460 C83F0028 */ lfd f1, 0x28(r31)
/* 00006464 C0010070 */ lfs f0, 0x70(r1)
/* 00006468 FC21002A */ fadd f1, f1, f0
/* 0000646C FC200818 */ frsp f1, f1
/* 00006470 4BFF9D3D */ bl func_80071B1C
/* 00006474 38600000 */ li r3, 0
/* 00006478 4BFF9D35 */ bl set_text_mul_color
/* 0000647C 88010095 */ lbz r0, 0x95(r1)
/* 00006480 88610094 */ lbz r3, 0x94(r1)
/* 00006484 5400402E */ slwi r0, r0, 8
/* 00006488 88810096 */ lbz r4, 0x96(r1)
/* 0000648C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006490 7C830378 */ or r3, r4, r0
/* 00006494 4BFF9D19 */ bl set_text_add_color
/* 00006498 C85F0030 */ lfd f2, 0x30(r31)
/* 0000649C C0210028 */ lfs f1, 0x28(r1)
/* 000064A0 C001002C */ lfs f0, 0x2c(r1)
/* 000064A4 FC22082A */ fadd f1, f2, f1
/* 000064A8 FC42002A */ fadd f2, f2, f0
/* 000064AC FC200818 */ frsp f1, f1
/* 000064B0 FC401018 */ frsp f2, f2
/* 000064B4 4BFF9CF9 */ bl set_text_pos
/* 000064B8 7FC3F378 */ mr r3, r30
/* 000064BC 4BFF9CF1 */ bl u_draw_text
/* 000064C0 C0210070 */ lfs f1, 0x70(r1)
/* 000064C4 4BFF9CE9 */ bl func_80071B1C
/* 000064C8 88010031 */ lbz r0, 0x31(r1)
/* 000064CC 88610030 */ lbz r3, 0x30(r1)
/* 000064D0 5400402E */ slwi r0, r0, 8
/* 000064D4 88810032 */ lbz r4, 0x32(r1)
/* 000064D8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000064DC 7C830378 */ or r3, r4, r0
/* 000064E0 4BFF9CCD */ bl set_text_mul_color
/* 000064E4 88010095 */ lbz r0, 0x95(r1)
/* 000064E8 88610094 */ lbz r3, 0x94(r1)
/* 000064EC 5400402E */ slwi r0, r0, 8
/* 000064F0 88810096 */ lbz r4, 0x96(r1)
/* 000064F4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000064F8 7C830378 */ or r3, r4, r0
/* 000064FC 4BFF9CB1 */ bl set_text_add_color
/* 00006500 C0210028 */ lfs f1, 0x28(r1)
/* 00006504 C041002C */ lfs f2, 0x2c(r1)
/* 00006508 4BFF9CA5 */ bl set_text_pos
/* 0000650C 7FC3F378 */ mr r3, r30
/* 00006510 4BFF9C9D */ bl u_draw_text
/* 00006514 387E0000 */ addi r3, r30, 0
/* 00006518 4CC63182 */ crclr 6
/* 0000651C 389D05CC */ addi r4, r29, 0x5cc
/* 00006520 4BFF9C8D */ bl sprintf
/* 00006524 4BFF9C89 */ bl reset_text_draw_settings
/* 00006528 88610025 */ lbz r3, 0x25(r1)
/* 0000652C 4BFF9C81 */ bl set_text_font
/* 00006530 C0210064 */ lfs f1, 0x64(r1)
/* 00006534 C0410068 */ lfs f2, 0x68(r1)
/* 00006538 4BFF9C75 */ bl set_text_scale
/* 0000653C 80610098 */ lwz r3, 0x98(r1)
/* 00006540 4BFF9C6D */ bl func_80071B50
/* 00006544 C0210070 */ lfs f1, 0x70(r1)
/* 00006548 4BFF9C65 */ bl func_80071B1C
/* 0000654C 88010031 */ lbz r0, 0x31(r1)
/* 00006550 88610030 */ lbz r3, 0x30(r1)
/* 00006554 5400402E */ slwi r0, r0, 8
/* 00006558 88810032 */ lbz r4, 0x32(r1)
/* 0000655C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006560 7C830378 */ or r3, r4, r0
/* 00006564 4BFF9C49 */ bl set_text_mul_color
/* 00006568 88010095 */ lbz r0, 0x95(r1)
/* 0000656C 88610094 */ lbz r3, 0x94(r1)
/* 00006570 5400402E */ slwi r0, r0, 8
/* 00006574 88810096 */ lbz r4, 0x96(r1)
/* 00006578 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000657C 7C830378 */ or r3, r4, r0
/* 00006580 4BFF9C2D */ bl set_text_add_color
/* 00006584 7FC3F378 */ mr r3, r30
/* 00006588 4BFF9C25 */ bl u_get_text_width
/* 0000658C C81F0058 */ lfd f0, 0x58(r31)
/* 00006590 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00006594 FC000072 */ fmul f0, f0, f1
/* 00006598 FC020028 */ fsub f0, f2, f0
/* 0000659C FC000018 */ frsp f0, f0
/* 000065A0 D0010028 */ stfs f0, 0x28(r1)
/* 000065A4 C01F0124 */ lfs f0, 0x124(r31)
/* 000065A8 D001002C */ stfs f0, 0x2c(r1)
/* 000065AC 4BFF9C01 */ bl reset_text_draw_settings
/* 000065B0 88610025 */ lbz r3, 0x25(r1)
/* 000065B4 4BFF9BF9 */ bl set_text_font
/* 000065B8 C0210064 */ lfs f1, 0x64(r1)
/* 000065BC C0410068 */ lfs f2, 0x68(r1)
/* 000065C0 4BFF9BED */ bl set_text_scale
/* 000065C4 80610098 */ lwz r3, 0x98(r1)
/* 000065C8 4BFF9BE5 */ bl func_80071B50
/* 000065CC C83F0028 */ lfd f1, 0x28(r31)
/* 000065D0 C0010070 */ lfs f0, 0x70(r1)
/* 000065D4 FC21002A */ fadd f1, f1, f0
/* 000065D8 FC200818 */ frsp f1, f1
/* 000065DC 4BFF9BD1 */ bl func_80071B1C
/* 000065E0 38600000 */ li r3, 0
/* 000065E4 4BFF9BC9 */ bl set_text_mul_color
/* 000065E8 88010095 */ lbz r0, 0x95(r1)
/* 000065EC 88610094 */ lbz r3, 0x94(r1)
/* 000065F0 5400402E */ slwi r0, r0, 8
/* 000065F4 88810096 */ lbz r4, 0x96(r1)
/* 000065F8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000065FC 7C830378 */ or r3, r4, r0
/* 00006600 4BFF9BAD */ bl set_text_add_color
/* 00006604 C85F0030 */ lfd f2, 0x30(r31)
/* 00006608 C0210028 */ lfs f1, 0x28(r1)
/* 0000660C C001002C */ lfs f0, 0x2c(r1)
/* 00006610 FC22082A */ fadd f1, f2, f1
/* 00006614 FC42002A */ fadd f2, f2, f0
/* 00006618 FC200818 */ frsp f1, f1
/* 0000661C FC401018 */ frsp f2, f2
/* 00006620 4BFF9B8D */ bl set_text_pos
/* 00006624 7FC3F378 */ mr r3, r30
/* 00006628 4BFF9B85 */ bl u_draw_text
/* 0000662C C0210070 */ lfs f1, 0x70(r1)
/* 00006630 4BFF9B7D */ bl func_80071B1C
/* 00006634 88010031 */ lbz r0, 0x31(r1)
/* 00006638 88610030 */ lbz r3, 0x30(r1)
/* 0000663C 5400402E */ slwi r0, r0, 8
/* 00006640 88810032 */ lbz r4, 0x32(r1)
/* 00006644 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006648 7C830378 */ or r3, r4, r0
/* 0000664C 4BFF9B61 */ bl set_text_mul_color
/* 00006650 88010095 */ lbz r0, 0x95(r1)
/* 00006654 88610094 */ lbz r3, 0x94(r1)
/* 00006658 5400402E */ slwi r0, r0, 8
/* 0000665C 88810096 */ lbz r4, 0x96(r1)
/* 00006660 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006664 7C830378 */ or r3, r4, r0
/* 00006668 4BFF9B45 */ bl set_text_add_color
/* 0000666C C0210028 */ lfs f1, 0x28(r1)
/* 00006670 C041002C */ lfs f2, 0x2c(r1)
/* 00006674 4BFF9B39 */ bl set_text_pos
/* 00006678 7FC3F378 */ mr r3, r30
/* 0000667C 4BFF9B31 */ bl u_draw_text
/* 00006680 C01F0060 */ lfs f0, 0x60(r31)
/* 00006684 D0010064 */ stfs f0, 0x64(r1)
/* 00006688 480003F0 */ b lbl_00006A78
lbl_0000668C:
/* 0000668C 380000FF */ li r0, 0xff
/* 00006690 4CC63182 */ crclr 6
/* 00006694 98010030 */ stb r0, 0x30(r1)
/* 00006698 387E0000 */ addi r3, r30, 0
/* 0000669C 389D05E8 */ addi r4, r29, 0x5e8
/* 000066A0 98010031 */ stb r0, 0x31(r1)
/* 000066A4 98010032 */ stb r0, 0x32(r1)
/* 000066A8 C01F0128 */ lfs f0, 0x128(r31)
/* 000066AC D0010028 */ stfs f0, 0x28(r1)
/* 000066B0 C01F0120 */ lfs f0, 0x120(r31)
/* 000066B4 D001002C */ stfs f0, 0x2c(r1)
/* 000066B8 80130014 */ lwz r0, 0x14(r19)
/* 000066BC 1C000018 */ mulli r0, r0, 0x18
/* 000066C0 7CAE0214 */ add r5, r14, r0
/* 000066C4 80A50008 */ lwz r5, 8(r5)
/* 000066C8 4BFF9AE5 */ bl sprintf
/* 000066CC 4BFF9AE1 */ bl reset_text_draw_settings
/* 000066D0 88610025 */ lbz r3, 0x25(r1)
/* 000066D4 4BFF9AD9 */ bl set_text_font
/* 000066D8 C0210064 */ lfs f1, 0x64(r1)
/* 000066DC C0410068 */ lfs f2, 0x68(r1)
/* 000066E0 4BFF9ACD */ bl set_text_scale
/* 000066E4 80610098 */ lwz r3, 0x98(r1)
/* 000066E8 4BFF9AC5 */ bl func_80071B50
/* 000066EC C83F0028 */ lfd f1, 0x28(r31)
/* 000066F0 C0010070 */ lfs f0, 0x70(r1)
/* 000066F4 FC21002A */ fadd f1, f1, f0
/* 000066F8 FC200818 */ frsp f1, f1
/* 000066FC 4BFF9AB1 */ bl func_80071B1C
/* 00006700 38600000 */ li r3, 0
/* 00006704 4BFF9AA9 */ bl set_text_mul_color
/* 00006708 88010095 */ lbz r0, 0x95(r1)
/* 0000670C 88610094 */ lbz r3, 0x94(r1)
/* 00006710 5400402E */ slwi r0, r0, 8
/* 00006714 88810096 */ lbz r4, 0x96(r1)
/* 00006718 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000671C 7C830378 */ or r3, r4, r0
/* 00006720 4BFF9A8D */ bl set_text_add_color
/* 00006724 C85F0030 */ lfd f2, 0x30(r31)
/* 00006728 C0210028 */ lfs f1, 0x28(r1)
/* 0000672C C001002C */ lfs f0, 0x2c(r1)
/* 00006730 FC22082A */ fadd f1, f2, f1
/* 00006734 FC42002A */ fadd f2, f2, f0
/* 00006738 FC200818 */ frsp f1, f1
/* 0000673C FC401018 */ frsp f2, f2
/* 00006740 4BFF9A6D */ bl set_text_pos
/* 00006744 7FC3F378 */ mr r3, r30
/* 00006748 4BFF9A65 */ bl u_draw_text
/* 0000674C C0210070 */ lfs f1, 0x70(r1)
/* 00006750 4BFF9A5D */ bl func_80071B1C
/* 00006754 88010031 */ lbz r0, 0x31(r1)
/* 00006758 88610030 */ lbz r3, 0x30(r1)
/* 0000675C 5400402E */ slwi r0, r0, 8
/* 00006760 88810032 */ lbz r4, 0x32(r1)
/* 00006764 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006768 7C830378 */ or r3, r4, r0
/* 0000676C 4BFF9A41 */ bl set_text_mul_color
/* 00006770 88010095 */ lbz r0, 0x95(r1)
/* 00006774 88610094 */ lbz r3, 0x94(r1)
/* 00006778 5400402E */ slwi r0, r0, 8
/* 0000677C 88810096 */ lbz r4, 0x96(r1)
/* 00006780 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006784 7C830378 */ or r3, r4, r0
/* 00006788 4BFF9A25 */ bl set_text_add_color
/* 0000678C C0210028 */ lfs f1, 0x28(r1)
/* 00006790 C041002C */ lfs f2, 0x2c(r1)
/* 00006794 4BFF9A19 */ bl set_text_pos
/* 00006798 7FC3F378 */ mr r3, r30
/* 0000679C 4BFF9A11 */ bl u_draw_text
/* 000067A0 C01F0124 */ lfs f0, 0x124(r31)
/* 000067A4 D0010028 */ stfs f0, 0x28(r1)
/* 000067A8 C01F0120 */ lfs f0, 0x120(r31)
/* 000067AC D001002C */ stfs f0, 0x2c(r1)
/* 000067B0 80130014 */ lwz r0, 0x14(r19)
/* 000067B4 1C000018 */ mulli r0, r0, 0x18
/* 000067B8 7C6E0214 */ add r3, r14, r0
/* 000067BC 80030010 */ lwz r0, 0x10(r3)
/* 000067C0 54059B7E */ srwi r5, r0, 0xd
/* 000067C4 2C050001 */ cmpwi r5, 1
/* 000067C8 4082000C */ bne lbl_000067D4
/* 000067CC 38DD0584 */ addi r6, r29, 0x584
/* 000067D0 48000008 */ b lbl_000067D8
lbl_000067D4:
/* 000067D4 38DD05F0 */ addi r6, r29, 0x5f0
lbl_000067D8:
/* 000067D8 387E0000 */ addi r3, r30, 0
/* 000067DC 4CC63182 */ crclr 6
/* 000067E0 389D05F4 */ addi r4, r29, 0x5f4
/* 000067E4 4BFF99C9 */ bl sprintf
/* 000067E8 4BFF99C5 */ bl reset_text_draw_settings
/* 000067EC 88610025 */ lbz r3, 0x25(r1)
/* 000067F0 4BFF99BD */ bl set_text_font
/* 000067F4 C0210064 */ lfs f1, 0x64(r1)
/* 000067F8 C0410068 */ lfs f2, 0x68(r1)
/* 000067FC 4BFF99B1 */ bl set_text_scale
/* 00006800 80610098 */ lwz r3, 0x98(r1)
/* 00006804 4BFF99A9 */ bl func_80071B50
/* 00006808 C83F0028 */ lfd f1, 0x28(r31)
/* 0000680C C0010070 */ lfs f0, 0x70(r1)
/* 00006810 FC21002A */ fadd f1, f1, f0
/* 00006814 FC200818 */ frsp f1, f1
/* 00006818 4BFF9995 */ bl func_80071B1C
/* 0000681C 38600000 */ li r3, 0
/* 00006820 4BFF998D */ bl set_text_mul_color
/* 00006824 88010095 */ lbz r0, 0x95(r1)
/* 00006828 88610094 */ lbz r3, 0x94(r1)
/* 0000682C 5400402E */ slwi r0, r0, 8
/* 00006830 88810096 */ lbz r4, 0x96(r1)
/* 00006834 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006838 7C830378 */ or r3, r4, r0
/* 0000683C 4BFF9971 */ bl set_text_add_color
/* 00006840 C85F0030 */ lfd f2, 0x30(r31)
/* 00006844 C0210028 */ lfs f1, 0x28(r1)
/* 00006848 C001002C */ lfs f0, 0x2c(r1)
/* 0000684C FC22082A */ fadd f1, f2, f1
/* 00006850 FC42002A */ fadd f2, f2, f0
/* 00006854 FC200818 */ frsp f1, f1
/* 00006858 FC401018 */ frsp f2, f2
/* 0000685C 4BFF9951 */ bl set_text_pos
/* 00006860 7FC3F378 */ mr r3, r30
/* 00006864 4BFF9949 */ bl u_draw_text
/* 00006868 C0210070 */ lfs f1, 0x70(r1)
/* 0000686C 4BFF9941 */ bl func_80071B1C
/* 00006870 88010031 */ lbz r0, 0x31(r1)
/* 00006874 88610030 */ lbz r3, 0x30(r1)
/* 00006878 5400402E */ slwi r0, r0, 8
/* 0000687C 88810032 */ lbz r4, 0x32(r1)
/* 00006880 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006884 7C830378 */ or r3, r4, r0
/* 00006888 4BFF9925 */ bl set_text_mul_color
/* 0000688C 88010095 */ lbz r0, 0x95(r1)
/* 00006890 88610094 */ lbz r3, 0x94(r1)
/* 00006894 5400402E */ slwi r0, r0, 8
/* 00006898 88810096 */ lbz r4, 0x96(r1)
/* 0000689C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000068A0 7C830378 */ or r3, r4, r0
/* 000068A4 4BFF9909 */ bl set_text_add_color
/* 000068A8 C0210028 */ lfs f1, 0x28(r1)
/* 000068AC C041002C */ lfs f2, 0x2c(r1)
/* 000068B0 4BFF98FD */ bl set_text_pos
/* 000068B4 7FC3F378 */ mr r3, r30
/* 000068B8 4BFF98F5 */ bl u_draw_text
/* 000068BC C01F012C */ lfs f0, 0x12c(r31)
/* 000068C0 3C600000 */ lis r3, lbl_1000629C@ha
/* 000068C4 3C808000 */ lis r4, 0x8000
/* 000068C8 D0010028 */ stfs f0, 0x28(r1)
/* 000068CC 390000B1 */ li r8, 0xb1
/* 000068D0 800400F8 */ lwz r0, 0xf8(r4)
/* 000068D4 39C30000 */ addi r14, r3, lbl_1000629C@l
/* 000068D8 C01F0124 */ lfs f0, 0x124(r31)
/* 000068DC 5407F0BE */ srwi r7, r0, 2
/* 000068E0 D001002C */ stfs f0, 0x2c(r1)
/* 000068E4 38C00000 */ li r6, 0
/* 000068E8 38A100E0 */ addi r5, r1, 0xe0
/* 000068EC 99010025 */ stb r8, 0x25(r1)
/* 000068F0 80130014 */ lwz r0, 0x14(r19)
/* 000068F4 1C000018 */ mulli r0, r0, 0x18
/* 000068F8 7C6E0214 */ add r3, r14, r0
/* 000068FC 8083000C */ lwz r4, 0xc(r3)
/* 00006900 7C6621D6 */ mullw r3, r6, r4
/* 00006904 7C072016 */ mulhwu r0, r7, r4
/* 00006908 7C630214 */ add r3, r3, r0
/* 0000690C 7C0731D6 */ mullw r0, r7, r6
/* 00006910 7C8721D6 */ mullw r4, r7, r4
/* 00006914 7C630214 */ add r3, r3, r0
/* 00006918 4BFF9895 */ bl OSTicksToCalendarTime
/* 0000691C 3C6051EC */ lis r3, 0x51ec
/* 00006920 80A100F4 */ lwz r5, 0xf4(r1)
/* 00006924 3803851F */ addi r0, r3, -31457  ;# fixed addi
/* 00006928 80C100F0 */ lwz r6, 0xf0(r1)
/* 0000692C 7C002896 */ mulhw r0, r0, r5
/* 00006930 80E100EC */ lwz r7, 0xec(r1)
/* 00006934 810100E8 */ lwz r8, 0xe8(r1)
/* 00006938 4CC63182 */ crclr 6
/* 0000693C 812100E4 */ lwz r9, 0xe4(r1)
/* 00006940 7C002E70 */ srawi r0, r0, 5
/* 00006944 54030FFE */ srwi r3, r0, 0x1f
/* 00006948 7C001A14 */ add r0, r0, r3
/* 0000694C 1C000064 */ mulli r0, r0, 0x64
/* 00006950 387E0000 */ addi r3, r30, 0
/* 00006954 389D0604 */ addi r4, r29, 0x604
/* 00006958 7CA02850 */ subf r5, r0, r5
/* 0000695C 38C60001 */ addi r6, r6, 1
/* 00006960 4BFF984D */ bl sprintf
/* 00006964 4BFF9849 */ bl reset_text_draw_settings
/* 00006968 88610025 */ lbz r3, 0x25(r1)
/* 0000696C 4BFF9841 */ bl set_text_font
/* 00006970 C0210064 */ lfs f1, 0x64(r1)
/* 00006974 C0410068 */ lfs f2, 0x68(r1)
/* 00006978 4BFF9835 */ bl set_text_scale
/* 0000697C 80610098 */ lwz r3, 0x98(r1)
/* 00006980 4BFF982D */ bl func_80071B50
/* 00006984 C83F0028 */ lfd f1, 0x28(r31)
/* 00006988 C0010070 */ lfs f0, 0x70(r1)
/* 0000698C FC21002A */ fadd f1, f1, f0
/* 00006990 FC200818 */ frsp f1, f1
/* 00006994 4BFF9819 */ bl func_80071B1C
/* 00006998 38600000 */ li r3, 0
/* 0000699C 4BFF9811 */ bl set_text_mul_color
/* 000069A0 88010095 */ lbz r0, 0x95(r1)
/* 000069A4 88610094 */ lbz r3, 0x94(r1)
/* 000069A8 5400402E */ slwi r0, r0, 8
/* 000069AC 88810096 */ lbz r4, 0x96(r1)
/* 000069B0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000069B4 7C830378 */ or r3, r4, r0
/* 000069B8 4BFF97F5 */ bl set_text_add_color
/* 000069BC C85F0030 */ lfd f2, 0x30(r31)
/* 000069C0 C0210028 */ lfs f1, 0x28(r1)
/* 000069C4 C001002C */ lfs f0, 0x2c(r1)
/* 000069C8 FC22082A */ fadd f1, f2, f1
/* 000069CC FC42002A */ fadd f2, f2, f0
/* 000069D0 FC200818 */ frsp f1, f1
/* 000069D4 FC401018 */ frsp f2, f2
/* 000069D8 4BFF97D5 */ bl set_text_pos
/* 000069DC 7FC3F378 */ mr r3, r30
/* 000069E0 4BFF97CD */ bl u_draw_text
/* 000069E4 C0210070 */ lfs f1, 0x70(r1)
/* 000069E8 4BFF97C5 */ bl func_80071B1C
/* 000069EC 88010031 */ lbz r0, 0x31(r1)
/* 000069F0 88610030 */ lbz r3, 0x30(r1)
/* 000069F4 5400402E */ slwi r0, r0, 8
/* 000069F8 88810032 */ lbz r4, 0x32(r1)
/* 000069FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006A00 7C830378 */ or r3, r4, r0
/* 00006A04 4BFF97A9 */ bl set_text_mul_color
/* 00006A08 88010095 */ lbz r0, 0x95(r1)
/* 00006A0C 88610094 */ lbz r3, 0x94(r1)
/* 00006A10 5400402E */ slwi r0, r0, 8
/* 00006A14 88810096 */ lbz r4, 0x96(r1)
/* 00006A18 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006A1C 7C830378 */ or r3, r4, r0
/* 00006A20 4BFF978D */ bl set_text_add_color
/* 00006A24 C0210028 */ lfs f1, 0x28(r1)
/* 00006A28 C041002C */ lfs f2, 0x2c(r1)
/* 00006A2C 4BFF9781 */ bl set_text_pos
/* 00006A30 7FC3F378 */ mr r3, r30
/* 00006A34 4BFF9779 */ bl u_draw_text
/* 00006A38 80130014 */ lwz r0, 0x14(r19)
/* 00006A3C 1C000018 */ mulli r0, r0, 0x18
/* 00006A40 7C6E0214 */ add r3, r14, r0
/* 00006A44 88030014 */ lbz r0, 0x14(r3)
/* 00006A48 7C000775 */ extsb. r0, r0
/* 00006A4C 4180002C */ blt lbl_00006A78
/* 00006A50 3C600000 */ lis r3, lbl_10006EC8@ha
/* 00006A54 C03F0130 */ lfs f1, 0x130(r31)
/* 00006A58 C05F0134 */ lfs f2, 0x134(r31)
/* 00006A5C 38630000 */ addi r3, r3, lbl_10006EC8@l
/* 00006A60 C07F0060 */ lfs f3, 0x60(r31)
/* 00006A64 3880FFFF */ li r4, -1
/* 00006A68 C09F0138 */ lfs f4, 0x138(r31)
/* 00006A6C C0BF013C */ lfs f5, 0x13c(r31)
/* 00006A70 38A00000 */ li r5, 0
/* 00006A74 4BFF9739 */ bl preview_draw
lbl_00006A78:
/* 00006A78 4BFF9735 */ bl mathutil_mtxA_from_identity
/* 00006A7C 3C600000 */ lis r3, mathutilData@ha
/* 00006A80 38630000 */ addi r3, r3, mathutilData@l
/* 00006A84 80630000 */ lwz r3, 0(r3)
/* 00006A88 38800000 */ li r4, 0
/* 00006A8C 4BFF9721 */ bl GXLoadPosMtxImm
/* 00006A90 B9C10120 */ lmw r14, 0x120(r1)
/* 00006A94 80010174 */ lwz r0, 0x174(r1)
/* 00006A98 CBE10168 */ lfd f31, 0x168(r1)
/* 00006A9C 38210170 */ addi r1, r1, 0x170
/* 00006AA0 7C0803A6 */ mtlr r0
/* 00006AA4 4E800020 */ blr 
lbl_00006AA8:
/* 00006AA8 7C0802A6 */ mflr r0
/* 00006AAC 3C600000 */ lis r3, lbl_10006EC8@ha
/* 00006AB0 90010004 */ stw r0, 4(r1)
/* 00006AB4 38630000 */ addi r3, r3, lbl_10006EC8@l
/* 00006AB8 9421FFF8 */ stwu r1, -8(r1)
/* 00006ABC 4BFF96F1 */ bl preview_free
/* 00006AC0 8001000C */ lwz r0, 0xc(r1)
/* 00006AC4 38210008 */ addi r1, r1, 8
/* 00006AC8 7C0803A6 */ mtlr r0
/* 00006ACC 4E800020 */ blr 
lbl_00006AD0:
/* 00006AD0 7C0802A6 */ mflr r0
/* 00006AD4 3C600000 */ lis r3, lbl_10006EC8@ha
/* 00006AD8 90010004 */ stw r0, 4(r1)
/* 00006ADC 9421FFE8 */ stwu r1, -0x18(r1)
/* 00006AE0 93E10014 */ stw r31, 0x14(r1)
/* 00006AE4 3BE30000 */ addi r31, r3, lbl_10006EC8@l
/* 00006AE8 3C600000 */ lis r3, lbl_0000C370@ha
/* 00006AEC 93C10010 */ stw r30, 0x10(r1)
/* 00006AF0 93A1000C */ stw r29, 0xc(r1)
/* 00006AF4 3BA30000 */ addi r29, r3, lbl_0000C370@l
/* 00006AF8 38600059 */ li r3, 0x59
/* 00006AFC 4BFF96B1 */ bl find_sprite_with_tag
/* 00006B00 28030000 */ cmplwi r3, 0
/* 00006B04 41820018 */ beq lbl_00006B1C
/* 00006B08 3C600000 */ lis r3, lbl_10000000@ha
/* 00006B0C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00006B10 38000004 */ li r0, 4
/* 00006B14 9803005C */ stb r0, 0x5c(r3)
/* 00006B18 48000100 */ b lbl_00006C18
lbl_00006B1C:
/* 00006B1C 3C600000 */ lis r3, lbl_10000000@ha
/* 00006B20 38630000 */ addi r3, r3, lbl_10000000@l
/* 00006B24 3BC3005C */ addi r30, r3, 0x5c
/* 00006B28 38600059 */ li r3, 0x59
/* 00006B2C 4BFFD441 */ bl lbl_00003F6C
/* 00006B30 28030000 */ cmplwi r3, 0
/* 00006B34 41820024 */ beq lbl_00006B58
/* 00006B38 38000004 */ li r0, 4
/* 00006B3C 98030000 */ stb r0, 0(r3)
/* 00006B40 3800001E */ li r0, 0x1e
/* 00006B44 98030001 */ stb r0, 1(r3)
/* 00006B48 C01D0024 */ lfs f0, 0x24(r29)
/* 00006B4C D0030004 */ stfs f0, 4(r3)
/* 00006B50 C01D0000 */ lfs f0, 0(r29)
/* 00006B54 D0030008 */ stfs f0, 8(r3)
lbl_00006B58:
/* 00006B58 3C600000 */ lis r3, lbl_10000000@ha
/* 00006B5C 38830000 */ addi r4, r3, lbl_10000000@l
/* 00006B60 38000000 */ li r0, 0
/* 00006B64 B004001E */ sth r0, 0x1e(r4)
/* 00006B68 3C600000 */ lis r3, lbl_1000629C@ha
/* 00006B6C 38630000 */ addi r3, r3, lbl_1000629C@l
/* 00006B70 C01D0064 */ lfs f0, 0x64(r29)
/* 00006B74 D004000C */ stfs f0, 0xc(r4)
/* 00006B78 C01D00CC */ lfs f0, 0xcc(r29)
/* 00006B7C D0040010 */ stfs f0, 0x10(r4)
/* 00006B80 C01D00D8 */ lfs f0, 0xd8(r29)
/* 00006B84 D0040014 */ stfs f0, 0x14(r4)
/* 00006B88 801E0014 */ lwz r0, 0x14(r30)
/* 00006B8C 1C000018 */ mulli r0, r0, 0x18
/* 00006B90 7C630214 */ add r3, r3, r0
/* 00006B94 88030014 */ lbz r0, 0x14(r3)
/* 00006B98 7C000775 */ extsb. r0, r0
/* 00006B9C 4180000C */ blt lbl_00006BA8
/* 00006BA0 88030004 */ lbz r0, 4(r3)
/* 00006BA4 901F0074 */ stw r0, 0x74(r31)
lbl_00006BA8:
/* 00006BA8 80BF0074 */ lwz r5, 0x74(r31)
/* 00006BAC 3C600000 */ lis r3, lbl_0000CF10@ha
/* 00006BB0 38830000 */ addi r4, r3, lbl_0000CF10@l
/* 00006BB4 387F0000 */ addi r3, r31, 0
/* 00006BB8 38A5FFFF */ addi r5, r5, -1  ;# fixed addi
/* 00006BBC 38C00060 */ li r6, 0x60
/* 00006BC0 38E00044 */ li r7, 0x44
/* 00006BC4 39000005 */ li r8, 5
/* 00006BC8 4BFF95E5 */ bl preview_create
/* 00006BCC 4BFF95E1 */ bl create_sprite
/* 00006BD0 28030000 */ cmplwi r3, 0
/* 00006BD4 41820044 */ beq lbl_00006C18
/* 00006BD8 38000059 */ li r0, 0x59
/* 00006BDC 3C800000 */ lis r4, lbl_00005020@ha
/* 00006BE0 9803000F */ stb r0, 0xf(r3)
/* 00006BE4 38040000 */ addi r0, r4, lbl_00005020@l
/* 00006BE8 3C800000 */ lis r4, lbl_00005340@ha
/* 00006BEC 90030034 */ stw r0, 0x34(r3)
/* 00006BF0 38040000 */ addi r0, r4, lbl_00005340@l
/* 00006BF4 3C800000 */ lis r4, lbl_00006AA8@ha
/* 00006BF8 90030038 */ stw r0, 0x38(r3)
/* 00006BFC 38040000 */ addi r0, r4, lbl_00006AA8@l
/* 00006C00 90030030 */ stw r0, 0x30(r3)
/* 00006C04 3C800000 */ lis r4, lbl_0000CC6C@ha
/* 00006C08 38840000 */ addi r4, r4, lbl_0000CC6C@l
/* 00006C0C 93C3002C */ stw r30, 0x2c(r3)
/* 00006C10 3863008C */ addi r3, r3, 0x8c
/* 00006C14 4BFF9599 */ bl strcpy
lbl_00006C18:
/* 00006C18 8001001C */ lwz r0, 0x1c(r1)
/* 00006C1C 83E10014 */ lwz r31, 0x14(r1)
/* 00006C20 83C10010 */ lwz r30, 0x10(r1)
/* 00006C24 7C0803A6 */ mtlr r0
/* 00006C28 83A1000C */ lwz r29, 0xc(r1)
/* 00006C2C 38210018 */ addi r1, r1, 0x18
/* 00006C30 4E800020 */ blr 
lbl_00006C34:
/* 00006C34 7C0802A6 */ mflr r0
/* 00006C38 90010004 */ stw r0, 4(r1)
/* 00006C3C 9421FFF8 */ stwu r1, -8(r1)
/* 00006C40 4BFFD3B1 */ bl lbl_00003FF0
/* 00006C44 8001000C */ lwz r0, 0xc(r1)
/* 00006C48 38210008 */ addi r1, r1, 8
/* 00006C4C 7C0803A6 */ mtlr r0
/* 00006C50 4E800020 */ blr 
lbl_00006C54:
/* 00006C54 7C0802A6 */ mflr r0
/* 00006C58 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00006C5C 90010004 */ stw r0, 4(r1)
/* 00006C60 9421FEF0 */ stwu r1, -0x110(r1)
/* 00006C64 DBE10108 */ stfd f31, 0x108(r1)
/* 00006C68 BEC100E0 */ stmw r22, 0xe0(r1)
/* 00006C6C 3BC40000 */ addi r30, r4, lbl_0000C8F0@l
/* 00006C70 3C800000 */ lis r4, lbl_0000C370@ha
/* 00006C74 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00006C78 8863000F */ lbz r3, 0xf(r3)
/* 00006C7C 7C630774 */ extsb r3, r3
/* 00006C80 4BFFD2ED */ bl lbl_00003F6C
/* 00006C84 28030000 */ cmplwi r3, 0
/* 00006C88 41820040 */ beq lbl_00006CC8
/* 00006C8C C05F0000 */ lfs f2, 0(r31)
/* 00006C90 C0230004 */ lfs f1, 4(r3)
/* 00006C94 C0030008 */ lfs f0, 8(r3)
/* 00006C98 FC601090 */ fmr f3, f2
/* 00006C9C EC21002A */ fadds f1, f1, f0
/* 00006CA0 4BFF950D */ bl mathutil_mtxA_from_translate_xyz
/* 00006CA4 3C600000 */ lis r3, lbl_10000000@ha
/* 00006CA8 38630000 */ addi r3, r3, lbl_10000000@l
/* 00006CAC 38630184 */ addi r3, r3, 0x184
/* 00006CB0 4BFF94FD */ bl mathutil_mtxA_to_mtx
/* 00006CB4 3C600000 */ lis r3, mathutilData@ha
/* 00006CB8 38630000 */ addi r3, r3, mathutilData@l
/* 00006CBC 80630000 */ lwz r3, 0(r3)
/* 00006CC0 38800000 */ li r4, 0
/* 00006CC4 4BFF94E9 */ bl GXLoadPosMtxImm
lbl_00006CC8:
/* 00006CC8 7FC3F378 */ mr r3, r30
/* 00006CCC 4BFF94E1 */ bl draw_naomi_sprite
/* 00006CD0 C01F0088 */ lfs f0, 0x88(r31)
/* 00006CD4 3BA100A8 */ addi r29, r1, 0xa8
/* 00006CD8 388000B3 */ li r4, 0xb3
/* 00006CDC D0010068 */ stfs f0, 0x68(r1)
/* 00006CE0 3B200000 */ li r25, 0
/* 00006CE4 3C000020 */ lis r0, 0x20
/* 00006CE8 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00006CEC 7FA3EB78 */ mr r3, r29
/* 00006CF0 D001005C */ stfs f0, 0x5c(r1)
/* 00006CF4 C01F0060 */ lfs f0, 0x60(r31)
/* 00006CF8 D0010060 */ stfs f0, 0x60(r1)
/* 00006CFC 9881001D */ stb r4, 0x1d(r1)
/* 00006D00 389E08B4 */ addi r4, r30, 0x8b4
/* 00006D04 9B21008C */ stb r25, 0x8c(r1)
/* 00006D08 9B21008D */ stb r25, 0x8d(r1)
/* 00006D0C 9B21008E */ stb r25, 0x8e(r1)
/* 00006D10 90010090 */ stw r0, 0x90(r1)
/* 00006D14 4BFF9499 */ bl strcpy
/* 00006D18 4BFF9495 */ bl reset_text_draw_settings
/* 00006D1C 8861001D */ lbz r3, 0x1d(r1)
/* 00006D20 4BFF948D */ bl set_text_font
/* 00006D24 C021005C */ lfs f1, 0x5c(r1)
/* 00006D28 C0410060 */ lfs f2, 0x60(r1)
/* 00006D2C 4BFF9481 */ bl set_text_scale
/* 00006D30 80610090 */ lwz r3, 0x90(r1)
/* 00006D34 4BFF9479 */ bl func_80071B50
/* 00006D38 C0210068 */ lfs f1, 0x68(r1)
/* 00006D3C 4BFF9471 */ bl func_80071B1C
/* 00006D40 88010029 */ lbz r0, 0x29(r1)
/* 00006D44 88610028 */ lbz r3, 0x28(r1)
/* 00006D48 5400402E */ slwi r0, r0, 8
/* 00006D4C 8881002A */ lbz r4, 0x2a(r1)
/* 00006D50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006D54 7C830378 */ or r3, r4, r0
/* 00006D58 4BFF9455 */ bl set_text_mul_color
/* 00006D5C 8801008D */ lbz r0, 0x8d(r1)
/* 00006D60 8861008C */ lbz r3, 0x8c(r1)
/* 00006D64 5400402E */ slwi r0, r0, 8
/* 00006D68 8881008E */ lbz r4, 0x8e(r1)
/* 00006D6C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006D70 7C830378 */ or r3, r4, r0
/* 00006D74 4BFF9439 */ bl set_text_add_color
/* 00006D78 7FA3EB78 */ mr r3, r29
/* 00006D7C 4BFF9431 */ bl u_get_text_width
/* 00006D80 C81F0058 */ lfd f0, 0x58(r31)
/* 00006D84 380000FF */ li r0, 0xff
/* 00006D88 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00006D8C FC000072 */ fmul f0, f0, f1
/* 00006D90 FC020028 */ fsub f0, f2, f0
/* 00006D94 FC000018 */ frsp f0, f0
/* 00006D98 D0010020 */ stfs f0, 0x20(r1)
/* 00006D9C C01F0090 */ lfs f0, 0x90(r31)
/* 00006DA0 D0010024 */ stfs f0, 0x24(r1)
/* 00006DA4 98010028 */ stb r0, 0x28(r1)
/* 00006DA8 98010029 */ stb r0, 0x29(r1)
/* 00006DAC 9B21002A */ stb r25, 0x2a(r1)
/* 00006DB0 4BFF93FD */ bl reset_text_draw_settings
/* 00006DB4 8861001D */ lbz r3, 0x1d(r1)
/* 00006DB8 4BFF93F5 */ bl set_text_font
/* 00006DBC C021005C */ lfs f1, 0x5c(r1)
/* 00006DC0 C0410060 */ lfs f2, 0x60(r1)
/* 00006DC4 4BFF93E9 */ bl set_text_scale
/* 00006DC8 80610090 */ lwz r3, 0x90(r1)
/* 00006DCC 4BFF93E1 */ bl func_80071B50
/* 00006DD0 C83F0028 */ lfd f1, 0x28(r31)
/* 00006DD4 C0010068 */ lfs f0, 0x68(r1)
/* 00006DD8 FC21002A */ fadd f1, f1, f0
/* 00006DDC FC200818 */ frsp f1, f1
/* 00006DE0 4BFF93CD */ bl func_80071B1C
/* 00006DE4 38600000 */ li r3, 0
/* 00006DE8 4BFF93C5 */ bl set_text_mul_color
/* 00006DEC 8801008D */ lbz r0, 0x8d(r1)
/* 00006DF0 8861008C */ lbz r3, 0x8c(r1)
/* 00006DF4 5400402E */ slwi r0, r0, 8
/* 00006DF8 8881008E */ lbz r4, 0x8e(r1)
/* 00006DFC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006E00 7C830378 */ or r3, r4, r0
/* 00006E04 4BFF93A9 */ bl set_text_add_color
/* 00006E08 C85F0030 */ lfd f2, 0x30(r31)
/* 00006E0C C0210020 */ lfs f1, 0x20(r1)
/* 00006E10 C0010024 */ lfs f0, 0x24(r1)
/* 00006E14 FC22082A */ fadd f1, f2, f1
/* 00006E18 FC42002A */ fadd f2, f2, f0
/* 00006E1C FC200818 */ frsp f1, f1
/* 00006E20 FC401018 */ frsp f2, f2
/* 00006E24 4BFF9389 */ bl set_text_pos
/* 00006E28 7FA3EB78 */ mr r3, r29
/* 00006E2C 4BFF9381 */ bl u_draw_text
/* 00006E30 C0210068 */ lfs f1, 0x68(r1)
/* 00006E34 4BFF9379 */ bl func_80071B1C
/* 00006E38 88010029 */ lbz r0, 0x29(r1)
/* 00006E3C 88610028 */ lbz r3, 0x28(r1)
/* 00006E40 5400402E */ slwi r0, r0, 8
/* 00006E44 8881002A */ lbz r4, 0x2a(r1)
/* 00006E48 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006E4C 7C830378 */ or r3, r4, r0
/* 00006E50 4BFF935D */ bl set_text_mul_color
/* 00006E54 8801008D */ lbz r0, 0x8d(r1)
/* 00006E58 8861008C */ lbz r3, 0x8c(r1)
/* 00006E5C 5400402E */ slwi r0, r0, 8
/* 00006E60 8881008E */ lbz r4, 0x8e(r1)
/* 00006E64 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006E68 7C830378 */ or r3, r4, r0
/* 00006E6C 4BFF9341 */ bl set_text_add_color
/* 00006E70 C0210020 */ lfs f1, 0x20(r1)
/* 00006E74 C0410024 */ lfs f2, 0x24(r1)
/* 00006E78 4BFF9335 */ bl set_text_pos
/* 00006E7C 7FA3EB78 */ mr r3, r29
/* 00006E80 4BFF932D */ bl u_draw_text
/* 00006E84 C03F0148 */ lfs f1, 0x148(r31)
/* 00006E88 387E07D0 */ addi r3, r30, 0x7d0
/* 00006E8C C05F009C */ lfs f2, 0x9c(r31)
/* 00006E90 4BFFD42D */ bl lbl_000042BC
/* 00006E94 3B200000 */ li r25, 0
/* 00006E98 5720103A */ slwi r0, r25, 2
/* 00006E9C 7F5E0214 */ add r26, r30, r0
/* 00006EA0 3F604330 */ lis r27, 0x4330
/* 00006EA4 3B5A089C */ addi r26, r26, 0x89c
lbl_00006EA8:
/* 00006EA8 6F208000 */ xoris r0, r25, 0x8000
/* 00006EAC C01F014C */ lfs f0, 0x14c(r31)
/* 00006EB0 900100DC */ stw r0, 0xdc(r1)
/* 00006EB4 3C600000 */ lis r3, lbl_0000C380@ha
/* 00006EB8 2C190000 */ cmpwi r25, 0
/* 00006EBC D0010020 */ stfs f0, 0x20(r1)
/* 00006EC0 936100D8 */ stw r27, 0xd8(r1)
/* 00006EC4 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00006EC8 C80100D8 */ lfd f0, 0xd8(r1)
/* 00006ECC C85F0080 */ lfd f2, 0x80(r31)
/* 00006ED0 FC000828 */ fsub f0, f0, f1
/* 00006ED4 C83F0150 */ lfd f1, 0x150(r31)
/* 00006ED8 FC020032 */ fmul f0, f2, f0
/* 00006EDC FC01002A */ fadd f0, f1, f0
/* 00006EE0 FC000018 */ frsp f0, f0
/* 00006EE4 D0010024 */ stfs f0, 0x24(r1)
/* 00006EE8 40820030 */ bne lbl_00006F18
/* 00006EEC 4BFF92C1 */ bl are_all_continues_unlocked
/* 00006EF0 2C030000 */ cmpwi r3, 0
/* 00006EF4 41820014 */ beq lbl_00006F08
/* 00006EF8 387D0000 */ addi r3, r29, 0
/* 00006EFC 389E08C4 */ addi r4, r30, 0x8c4
/* 00006F00 4BFF92AD */ bl strcpy
/* 00006F04 480000AC */ b lbl_00006FB0
lbl_00006F08:
/* 00006F08 7FA3EB78 */ mr r3, r29
/* 00006F0C 809A0000 */ lwz r4, 0(r26)
/* 00006F10 4BFF929D */ bl strcpy
/* 00006F14 4800009C */ b lbl_00006FB0
lbl_00006F18:
/* 00006F18 2C190001 */ cmpwi r25, 1
/* 00006F1C 40820080 */ bne lbl_00006F9C
/* 00006F20 4BFF928D */ bl are_all_continues_unlocked
/* 00006F24 2C030000 */ cmpwi r3, 0
/* 00006F28 41820014 */ beq lbl_00006F3C
/* 00006F2C 387D0000 */ addi r3, r29, 0
/* 00006F30 389E08E0 */ addi r4, r30, 0x8e0
/* 00006F34 4BFF9279 */ bl strcpy
/* 00006F38 48000078 */ b lbl_00006FB0
lbl_00006F3C:
/* 00006F3C 38600006 */ li r3, 6
/* 00006F40 4BFF926D */ bl is_minigame_unlocked
/* 00006F44 2C030000 */ cmpwi r3, 0
/* 00006F48 4182003C */ beq lbl_00006F84
/* 00006F4C 38600007 */ li r3, 7
/* 00006F50 4BFF925D */ bl is_minigame_unlocked
/* 00006F54 2C030000 */ cmpwi r3, 0
/* 00006F58 4182002C */ beq lbl_00006F84
/* 00006F5C 38600008 */ li r3, 8
/* 00006F60 4BFF924D */ bl is_minigame_unlocked
/* 00006F64 2C030000 */ cmpwi r3, 0
/* 00006F68 4182001C */ beq lbl_00006F84
/* 00006F6C 387D0000 */ addi r3, r29, 0
/* 00006F70 389E08FC */ addi r4, r30, 0x8fc
/* 00006F74 4BFF9239 */ bl strcpy
/* 00006F78 C01F0158 */ lfs f0, 0x158(r31)
/* 00006F7C D001005C */ stfs f0, 0x5c(r1)
/* 00006F80 48000030 */ b lbl_00006FB0
lbl_00006F84:
/* 00006F84 7FA3EB78 */ mr r3, r29
/* 00006F88 809A0000 */ lwz r4, 0(r26)
/* 00006F8C 4BFF9221 */ bl strcpy
/* 00006F90 C01F015C */ lfs f0, 0x15c(r31)
/* 00006F94 D001005C */ stfs f0, 0x5c(r1)
/* 00006F98 48000018 */ b lbl_00006FB0
lbl_00006F9C:
/* 00006F9C 7FA3EB78 */ mr r3, r29
/* 00006FA0 809A0000 */ lwz r4, 0(r26)
/* 00006FA4 4BFF9209 */ bl strcpy
/* 00006FA8 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00006FAC D001005C */ stfs f0, 0x5c(r1)
lbl_00006FB0:
/* 00006FB0 4BFF91FD */ bl reset_text_draw_settings
/* 00006FB4 8861001D */ lbz r3, 0x1d(r1)
/* 00006FB8 4BFF91F5 */ bl set_text_font
/* 00006FBC C021005C */ lfs f1, 0x5c(r1)
/* 00006FC0 C0410060 */ lfs f2, 0x60(r1)
/* 00006FC4 4BFF91E9 */ bl set_text_scale
/* 00006FC8 80610090 */ lwz r3, 0x90(r1)
/* 00006FCC 4BFF91E1 */ bl func_80071B50
/* 00006FD0 C83F0028 */ lfd f1, 0x28(r31)
/* 00006FD4 C0010068 */ lfs f0, 0x68(r1)
/* 00006FD8 FC21002A */ fadd f1, f1, f0
/* 00006FDC FC200818 */ frsp f1, f1
/* 00006FE0 4BFF91CD */ bl func_80071B1C
/* 00006FE4 38600000 */ li r3, 0
/* 00006FE8 4BFF91C5 */ bl set_text_mul_color
/* 00006FEC 8801008D */ lbz r0, 0x8d(r1)
/* 00006FF0 8861008C */ lbz r3, 0x8c(r1)
/* 00006FF4 5400402E */ slwi r0, r0, 8
/* 00006FF8 8881008E */ lbz r4, 0x8e(r1)
/* 00006FFC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007000 7C830378 */ or r3, r4, r0
/* 00007004 4BFF91A9 */ bl set_text_add_color
/* 00007008 C85F0030 */ lfd f2, 0x30(r31)
/* 0000700C C0210020 */ lfs f1, 0x20(r1)
/* 00007010 C0010024 */ lfs f0, 0x24(r1)
/* 00007014 FC22082A */ fadd f1, f2, f1
/* 00007018 FC42002A */ fadd f2, f2, f0
/* 0000701C FC200818 */ frsp f1, f1
/* 00007020 FC401018 */ frsp f2, f2
/* 00007024 4BFF9189 */ bl set_text_pos
/* 00007028 7FA3EB78 */ mr r3, r29
/* 0000702C 4BFF9181 */ bl u_draw_text
/* 00007030 C0210068 */ lfs f1, 0x68(r1)
/* 00007034 4BFF9179 */ bl func_80071B1C
/* 00007038 88010029 */ lbz r0, 0x29(r1)
/* 0000703C 88610028 */ lbz r3, 0x28(r1)
/* 00007040 5400402E */ slwi r0, r0, 8
/* 00007044 8881002A */ lbz r4, 0x2a(r1)
/* 00007048 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000704C 7C830378 */ or r3, r4, r0
/* 00007050 4BFF915D */ bl set_text_mul_color
/* 00007054 8801008D */ lbz r0, 0x8d(r1)
/* 00007058 8861008C */ lbz r3, 0x8c(r1)
/* 0000705C 5400402E */ slwi r0, r0, 8
/* 00007060 8881008E */ lbz r4, 0x8e(r1)
/* 00007064 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007068 7C830378 */ or r3, r4, r0
/* 0000706C 4BFF9141 */ bl set_text_add_color
/* 00007070 C0210020 */ lfs f1, 0x20(r1)
/* 00007074 C0410024 */ lfs f2, 0x24(r1)
/* 00007078 4BFF9135 */ bl set_text_pos
/* 0000707C 7FA3EB78 */ mr r3, r29
/* 00007080 4BFF912D */ bl u_draw_text
/* 00007084 3B390001 */ addi r25, r25, 1
/* 00007088 28190006 */ cmplwi r25, 6
/* 0000708C 3B5A0004 */ addi r26, r26, 4
/* 00007090 4180FE18 */ blt lbl_00006EA8
/* 00007094 C01F0160 */ lfs f0, 0x160(r31)
/* 00007098 3C600000 */ lis r3, g_totalPlayPoints@ha
/* 0000709C 380000B0 */ li r0, 0xb0
/* 000070A0 4CC63182 */ crclr 6
/* 000070A4 D0010020 */ stfs f0, 0x20(r1)
/* 000070A8 3B630000 */ addi r27, r3, g_totalPlayPoints@l
/* 000070AC C01F0164 */ lfs f0, 0x164(r31)
/* 000070B0 387D0000 */ addi r3, r29, 0
/* 000070B4 389E0930 */ addi r4, r30, 0x930
/* 000070B8 D0010024 */ stfs f0, 0x24(r1)
/* 000070BC 9801001D */ stb r0, 0x1d(r1)
/* 000070C0 80BB0000 */ lwz r5, 0(r27)
/* 000070C4 4BFF90E9 */ bl sprintf
/* 000070C8 4BFF90E5 */ bl reset_text_draw_settings
/* 000070CC 8861001D */ lbz r3, 0x1d(r1)
/* 000070D0 4BFF90DD */ bl set_text_font
/* 000070D4 C021005C */ lfs f1, 0x5c(r1)
/* 000070D8 C0410060 */ lfs f2, 0x60(r1)
/* 000070DC 4BFF90D1 */ bl set_text_scale
/* 000070E0 80610090 */ lwz r3, 0x90(r1)
/* 000070E4 4BFF90C9 */ bl func_80071B50
/* 000070E8 C83F0028 */ lfd f1, 0x28(r31)
/* 000070EC C0010068 */ lfs f0, 0x68(r1)
/* 000070F0 FC21002A */ fadd f1, f1, f0
/* 000070F4 FC200818 */ frsp f1, f1
/* 000070F8 4BFF90B5 */ bl func_80071B1C
/* 000070FC 38600000 */ li r3, 0
/* 00007100 4BFF90AD */ bl set_text_mul_color
/* 00007104 8801008D */ lbz r0, 0x8d(r1)
/* 00007108 8861008C */ lbz r3, 0x8c(r1)
/* 0000710C 5400402E */ slwi r0, r0, 8
/* 00007110 8881008E */ lbz r4, 0x8e(r1)
/* 00007114 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007118 7C830378 */ or r3, r4, r0
/* 0000711C 4BFF9091 */ bl set_text_add_color
/* 00007120 C85F0030 */ lfd f2, 0x30(r31)
/* 00007124 C0210020 */ lfs f1, 0x20(r1)
/* 00007128 C0010024 */ lfs f0, 0x24(r1)
/* 0000712C FC22082A */ fadd f1, f2, f1
/* 00007130 FC42002A */ fadd f2, f2, f0
/* 00007134 FC200818 */ frsp f1, f1
/* 00007138 FC401018 */ frsp f2, f2
/* 0000713C 4BFF9071 */ bl set_text_pos
/* 00007140 7FA3EB78 */ mr r3, r29
/* 00007144 4BFF9069 */ bl u_draw_text
/* 00007148 C0210068 */ lfs f1, 0x68(r1)
/* 0000714C 4BFF9061 */ bl func_80071B1C
/* 00007150 88010029 */ lbz r0, 0x29(r1)
/* 00007154 88610028 */ lbz r3, 0x28(r1)
/* 00007158 5400402E */ slwi r0, r0, 8
/* 0000715C 8881002A */ lbz r4, 0x2a(r1)
/* 00007160 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007164 7C830378 */ or r3, r4, r0
/* 00007168 4BFF9045 */ bl set_text_mul_color
/* 0000716C 8801008D */ lbz r0, 0x8d(r1)
/* 00007170 8861008C */ lbz r3, 0x8c(r1)
/* 00007174 5400402E */ slwi r0, r0, 8
/* 00007178 8881008E */ lbz r4, 0x8e(r1)
/* 0000717C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007180 7C830378 */ or r3, r4, r0
/* 00007184 4BFF9029 */ bl set_text_add_color
/* 00007188 C0210020 */ lfs f1, 0x20(r1)
/* 0000718C C0410024 */ lfs f2, 0x24(r1)
/* 00007190 4BFF901D */ bl set_text_pos
/* 00007194 7FA3EB78 */ mr r3, r29
/* 00007198 4BFF9015 */ bl u_draw_text
/* 0000719C 4BFF9011 */ bl are_all_continues_unlocked
/* 000071A0 2C030000 */ cmpwi r3, 0
/* 000071A4 41820108 */ beq lbl_000072AC
/* 000071A8 C01F0160 */ lfs f0, 0x160(r31)
/* 000071AC 3C600000 */ lis r3, g_maxPlayPointRecord@ha
/* 000071B0 38A30000 */ addi r5, r3, g_maxPlayPointRecord@l
/* 000071B4 4CC63182 */ crclr 6
/* 000071B8 D0010020 */ stfs f0, 0x20(r1)
/* 000071BC 7FA3EB78 */ mr r3, r29
/* 000071C0 C01F0168 */ lfs f0, 0x168(r31)
/* 000071C4 389E0930 */ addi r4, r30, 0x930
/* 000071C8 D0010024 */ stfs f0, 0x24(r1)
/* 000071CC 80A50000 */ lwz r5, 0(r5)
/* 000071D0 4BFF8FDD */ bl sprintf
/* 000071D4 4BFF8FD9 */ bl reset_text_draw_settings
/* 000071D8 8861001D */ lbz r3, 0x1d(r1)
/* 000071DC 4BFF8FD1 */ bl set_text_font
/* 000071E0 C021005C */ lfs f1, 0x5c(r1)
/* 000071E4 C0410060 */ lfs f2, 0x60(r1)
/* 000071E8 4BFF8FC5 */ bl set_text_scale
/* 000071EC 80610090 */ lwz r3, 0x90(r1)
/* 000071F0 4BFF8FBD */ bl func_80071B50
/* 000071F4 C83F0028 */ lfd f1, 0x28(r31)
/* 000071F8 C0010068 */ lfs f0, 0x68(r1)
/* 000071FC FC21002A */ fadd f1, f1, f0
/* 00007200 FC200818 */ frsp f1, f1
/* 00007204 4BFF8FA9 */ bl func_80071B1C
/* 00007208 38600000 */ li r3, 0
/* 0000720C 4BFF8FA1 */ bl set_text_mul_color
/* 00007210 8801008D */ lbz r0, 0x8d(r1)
/* 00007214 8861008C */ lbz r3, 0x8c(r1)
/* 00007218 5400402E */ slwi r0, r0, 8
/* 0000721C 8881008E */ lbz r4, 0x8e(r1)
/* 00007220 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007224 7C830378 */ or r3, r4, r0
/* 00007228 4BFF8F85 */ bl set_text_add_color
/* 0000722C C85F0030 */ lfd f2, 0x30(r31)
/* 00007230 C0210020 */ lfs f1, 0x20(r1)
/* 00007234 C0010024 */ lfs f0, 0x24(r1)
/* 00007238 FC22082A */ fadd f1, f2, f1
/* 0000723C FC42002A */ fadd f2, f2, f0
/* 00007240 FC200818 */ frsp f1, f1
/* 00007244 FC401018 */ frsp f2, f2
/* 00007248 4BFF8F65 */ bl set_text_pos
/* 0000724C 7FA3EB78 */ mr r3, r29
/* 00007250 4BFF8F5D */ bl u_draw_text
/* 00007254 C0210068 */ lfs f1, 0x68(r1)
/* 00007258 4BFF8F55 */ bl func_80071B1C
/* 0000725C 88010029 */ lbz r0, 0x29(r1)
/* 00007260 88610028 */ lbz r3, 0x28(r1)
/* 00007264 5400402E */ slwi r0, r0, 8
/* 00007268 8881002A */ lbz r4, 0x2a(r1)
/* 0000726C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007270 7C830378 */ or r3, r4, r0
/* 00007274 4BFF8F39 */ bl set_text_mul_color
/* 00007278 8801008D */ lbz r0, 0x8d(r1)
/* 0000727C 8861008C */ lbz r3, 0x8c(r1)
/* 00007280 5400402E */ slwi r0, r0, 8
/* 00007284 8881008E */ lbz r4, 0x8e(r1)
/* 00007288 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000728C 7C830378 */ or r3, r4, r0
/* 00007290 4BFF8F1D */ bl set_text_add_color
/* 00007294 C0210020 */ lfs f1, 0x20(r1)
/* 00007298 C0410024 */ lfs f2, 0x24(r1)
/* 0000729C 4BFF8F11 */ bl set_text_pos
/* 000072A0 7FA3EB78 */ mr r3, r29
/* 000072A4 4BFF8F09 */ bl u_draw_text
/* 000072A8 48000118 */ b lbl_000073C0
lbl_000072AC:
/* 000072AC 807B0000 */ lwz r3, 0(r27)
/* 000072B0 28030000 */ cmplwi r3, 0
/* 000072B4 208309C4 */ subfic r4, r3, 0x9c4
/* 000072B8 40800008 */ bge lbl_000072C0
/* 000072BC 388009C4 */ li r4, 0x9c4
lbl_000072C0:
/* 000072C0 7C852379 */ or. r5, r4, r4
/* 000072C4 40800008 */ bge lbl_000072CC
/* 000072C8 38A00000 */ li r5, 0
lbl_000072CC:
/* 000072CC C01F0160 */ lfs f0, 0x160(r31)
/* 000072D0 387D0000 */ addi r3, r29, 0
/* 000072D4 4CC63182 */ crclr 6
/* 000072D8 389E0930 */ addi r4, r30, 0x930
/* 000072DC D0010020 */ stfs f0, 0x20(r1)
/* 000072E0 C01F0168 */ lfs f0, 0x168(r31)
/* 000072E4 D0010024 */ stfs f0, 0x24(r1)
/* 000072E8 4BFF8EC5 */ bl sprintf
/* 000072EC 4BFF8EC1 */ bl reset_text_draw_settings
/* 000072F0 8861001D */ lbz r3, 0x1d(r1)
/* 000072F4 4BFF8EB9 */ bl set_text_font
/* 000072F8 C021005C */ lfs f1, 0x5c(r1)
/* 000072FC C0410060 */ lfs f2, 0x60(r1)
/* 00007300 4BFF8EAD */ bl set_text_scale
/* 00007304 80610090 */ lwz r3, 0x90(r1)
/* 00007308 4BFF8EA5 */ bl func_80071B50
/* 0000730C C83F0028 */ lfd f1, 0x28(r31)
/* 00007310 C0010068 */ lfs f0, 0x68(r1)
/* 00007314 FC21002A */ fadd f1, f1, f0
/* 00007318 FC200818 */ frsp f1, f1
/* 0000731C 4BFF8E91 */ bl func_80071B1C
/* 00007320 38600000 */ li r3, 0
/* 00007324 4BFF8E89 */ bl set_text_mul_color
/* 00007328 8801008D */ lbz r0, 0x8d(r1)
/* 0000732C 8861008C */ lbz r3, 0x8c(r1)
/* 00007330 5400402E */ slwi r0, r0, 8
/* 00007334 8881008E */ lbz r4, 0x8e(r1)
/* 00007338 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000733C 7C830378 */ or r3, r4, r0
/* 00007340 4BFF8E6D */ bl set_text_add_color
/* 00007344 C85F0030 */ lfd f2, 0x30(r31)
/* 00007348 C0210020 */ lfs f1, 0x20(r1)
/* 0000734C C0010024 */ lfs f0, 0x24(r1)
/* 00007350 FC22082A */ fadd f1, f2, f1
/* 00007354 FC42002A */ fadd f2, f2, f0
/* 00007358 FC200818 */ frsp f1, f1
/* 0000735C FC401018 */ frsp f2, f2
/* 00007360 4BFF8E4D */ bl set_text_pos
/* 00007364 7FA3EB78 */ mr r3, r29
/* 00007368 4BFF8E45 */ bl u_draw_text
/* 0000736C C0210068 */ lfs f1, 0x68(r1)
/* 00007370 4BFF8E3D */ bl func_80071B1C
/* 00007374 88010029 */ lbz r0, 0x29(r1)
/* 00007378 88610028 */ lbz r3, 0x28(r1)
/* 0000737C 5400402E */ slwi r0, r0, 8
/* 00007380 8881002A */ lbz r4, 0x2a(r1)
/* 00007384 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007388 7C830378 */ or r3, r4, r0
/* 0000738C 4BFF8E21 */ bl set_text_mul_color
/* 00007390 8801008D */ lbz r0, 0x8d(r1)
/* 00007394 8861008C */ lbz r3, 0x8c(r1)
/* 00007398 5400402E */ slwi r0, r0, 8
/* 0000739C 8881008E */ lbz r4, 0x8e(r1)
/* 000073A0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000073A4 7C830378 */ or r3, r4, r0
/* 000073A8 4BFF8E05 */ bl set_text_add_color
/* 000073AC C0210020 */ lfs f1, 0x20(r1)
/* 000073B0 C0410024 */ lfs f2, 0x24(r1)
/* 000073B4 4BFF8DF9 */ bl set_text_pos
/* 000073B8 7FA3EB78 */ mr r3, r29
/* 000073BC 4BFF8DF1 */ bl u_draw_text
lbl_000073C0:
/* 000073C0 C01F0160 */ lfs f0, 0x160(r31)
/* 000073C4 D0010020 */ stfs f0, 0x20(r1)
/* 000073C8 C01F016C */ lfs f0, 0x16c(r31)
/* 000073CC D0010024 */ stfs f0, 0x24(r1)
/* 000073D0 4BFF8DDD */ bl are_all_continues_unlocked
/* 000073D4 2C030000 */ cmpwi r3, 0
/* 000073D8 41820024 */ beq lbl_000073FC
/* 000073DC 387D0000 */ addi r3, r29, 0
/* 000073E0 389E0934 */ addi r4, r30, 0x934
/* 000073E4 4BFF8DC9 */ bl strcpy
/* 000073E8 C01F0170 */ lfs f0, 0x170(r31)
/* 000073EC 380000B3 */ li r0, 0xb3
/* 000073F0 D0010020 */ stfs f0, 0x20(r1)
/* 000073F4 9801001D */ stb r0, 0x1d(r1)
/* 000073F8 4800001C */ b lbl_00007414
lbl_000073FC:
/* 000073FC 4BFF8DB1 */ bl get_max_continues
/* 00007400 38A30000 */ addi r5, r3, 0
/* 00007404 4CC63182 */ crclr 6
/* 00007408 387D0000 */ addi r3, r29, 0
/* 0000740C 389E0930 */ addi r4, r30, 0x930
/* 00007410 4BFF8D9D */ bl sprintf
lbl_00007414:
/* 00007414 4BFF8D99 */ bl reset_text_draw_settings
/* 00007418 8861001D */ lbz r3, 0x1d(r1)
/* 0000741C 4BFF8D91 */ bl set_text_font
/* 00007420 C021005C */ lfs f1, 0x5c(r1)
/* 00007424 C0410060 */ lfs f2, 0x60(r1)
/* 00007428 4BFF8D85 */ bl set_text_scale
/* 0000742C 80610090 */ lwz r3, 0x90(r1)
/* 00007430 4BFF8D7D */ bl func_80071B50
/* 00007434 C83F0028 */ lfd f1, 0x28(r31)
/* 00007438 C0010068 */ lfs f0, 0x68(r1)
/* 0000743C FC21002A */ fadd f1, f1, f0
/* 00007440 FC200818 */ frsp f1, f1
/* 00007444 4BFF8D69 */ bl func_80071B1C
/* 00007448 38600000 */ li r3, 0
/* 0000744C 4BFF8D61 */ bl set_text_mul_color
/* 00007450 8801008D */ lbz r0, 0x8d(r1)
/* 00007454 8861008C */ lbz r3, 0x8c(r1)
/* 00007458 5400402E */ slwi r0, r0, 8
/* 0000745C 8881008E */ lbz r4, 0x8e(r1)
/* 00007460 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007464 7C830378 */ or r3, r4, r0
/* 00007468 4BFF8D45 */ bl set_text_add_color
/* 0000746C C85F0030 */ lfd f2, 0x30(r31)
/* 00007470 C0210020 */ lfs f1, 0x20(r1)
/* 00007474 C0010024 */ lfs f0, 0x24(r1)
/* 00007478 FC22082A */ fadd f1, f2, f1
/* 0000747C FC42002A */ fadd f2, f2, f0
/* 00007480 FC200818 */ frsp f1, f1
/* 00007484 FC401018 */ frsp f2, f2
/* 00007488 4BFF8D25 */ bl set_text_pos
/* 0000748C 7FA3EB78 */ mr r3, r29
/* 00007490 4BFF8D1D */ bl u_draw_text
/* 00007494 C0210068 */ lfs f1, 0x68(r1)
/* 00007498 4BFF8D15 */ bl func_80071B1C
/* 0000749C 88010029 */ lbz r0, 0x29(r1)
/* 000074A0 88610028 */ lbz r3, 0x28(r1)
/* 000074A4 5400402E */ slwi r0, r0, 8
/* 000074A8 8881002A */ lbz r4, 0x2a(r1)
/* 000074AC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000074B0 7C830378 */ or r3, r4, r0
/* 000074B4 4BFF8CF9 */ bl set_text_mul_color
/* 000074B8 8801008D */ lbz r0, 0x8d(r1)
/* 000074BC 8861008C */ lbz r3, 0x8c(r1)
/* 000074C0 5400402E */ slwi r0, r0, 8
/* 000074C4 8881008E */ lbz r4, 0x8e(r1)
/* 000074C8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000074CC 7C830378 */ or r3, r4, r0
/* 000074D0 4BFF8CDD */ bl set_text_add_color
/* 000074D4 C0210020 */ lfs f1, 0x20(r1)
/* 000074D8 C0410024 */ lfs f2, 0x24(r1)
/* 000074DC 4BFF8CD1 */ bl set_text_pos
/* 000074E0 7FA3EB78 */ mr r3, r29
/* 000074E4 4BFF8CC9 */ bl u_draw_text
/* 000074E8 3C600000 */ lis r3, lbl_10000000@ha
/* 000074EC 38630000 */ addi r3, r3, lbl_10000000@l
/* 000074F0 380000B3 */ li r0, 0xb3
/* 000074F4 3B630184 */ addi r27, r3, 0x184
/* 000074F8 9801001D */ stb r0, 0x1d(r1)
/* 000074FC 7F63DB78 */ mr r3, r27
/* 00007500 4BFF8CAD */ bl mathutil_mtxA_from_mtx
/* 00007504 C03F0174 */ lfs f1, 0x174(r31)
/* 00007508 C05F008C */ lfs f2, 0x8c(r31)
/* 0000750C C07F0000 */ lfs f3, 0(r31)
/* 00007510 4BFF8C9D */ bl mathutil_mtxA_translate_xyz
/* 00007514 C03F0178 */ lfs f1, 0x178(r31)
/* 00007518 4BFF8C95 */ bl mathutil_mtxA_scale_s
/* 0000751C 3C600000 */ lis r3, mathutilData@ha
/* 00007520 38630000 */ addi r3, r3, mathutilData@l
/* 00007524 80630000 */ lwz r3, 0(r3)
/* 00007528 38800000 */ li r4, 0
/* 0000752C 4BFF8C81 */ bl GXLoadPosMtxImm
/* 00007530 3B5E07C4 */ addi r26, r30, 0x7c4
/* 00007534 3AFE0634 */ addi r23, r30, 0x634
/* 00007538 3B1E0684 */ addi r24, r30, 0x684
/* 0000753C 3B800000 */ li r28, 0
/* 00007540 3F204330 */ lis r25, 0x4330
lbl_00007544:
/* 00007544 3AC0FFFF */ li r22, -1
/* 00007548 387C0006 */ addi r3, r28, 6
/* 0000754C 4BFF8C61 */ bl is_minigame_unlocked
/* 00007550 2C030000 */ cmpwi r3, 0
/* 00007554 40820008 */ bne lbl_0000755C
/* 00007558 3AC00000 */ li r22, 0
lbl_0000755C:
/* 0000755C 6F808000 */ xoris r0, r28, 0x8000
/* 00007560 C85F0180 */ lfd f2, 0x180(r31)
/* 00007564 900100DC */ stw r0, 0xdc(r1)
/* 00007568 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000756C C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00007570 7EE3BB78 */ mr r3, r23
/* 00007574 932100D8 */ stw r25, 0xd8(r1)
/* 00007578 C80100D8 */ lfd f0, 0xd8(r1)
/* 0000757C FC000828 */ fsub f0, f0, f1
/* 00007580 FC020032 */ fmul f0, f2, f0
/* 00007584 FFE00018 */ frsp f31, f0
/* 00007588 D3FE0638 */ stfs f31, 0x638(r30)
/* 0000758C C01F0000 */ lfs f0, 0(r31)
/* 00007590 D01E063C */ stfs f0, 0x63c(r30)
/* 00007594 92DE066C */ stw r22, 0x66c(r30)
/* 00007598 4BFF8C15 */ bl draw_naomi_sprite
/* 0000759C D3FE0688 */ stfs f31, 0x688(r30)
/* 000075A0 7F03C378 */ mr r3, r24
/* 000075A4 C01F0188 */ lfs f0, 0x188(r31)
/* 000075A8 D01E068C */ stfs f0, 0x68c(r30)
/* 000075AC 92DE06BC */ stw r22, 0x6bc(r30)
/* 000075B0 4BFF8BFD */ bl draw_naomi_sprite
/* 000075B4 807A0000 */ lwz r3, 0(r26)
/* 000075B8 D3E30004 */ stfs f31, 4(r3)
/* 000075BC C01F018C */ lfs f0, 0x18c(r31)
/* 000075C0 D0030008 */ stfs f0, 8(r3)
/* 000075C4 92C30038 */ stw r22, 0x38(r3)
/* 000075C8 4BFF8BE5 */ bl draw_naomi_sprite
/* 000075CC 3B9C0001 */ addi r28, r28, 1
/* 000075D0 2C1C0003 */ cmpwi r28, 3
/* 000075D4 3B5A0004 */ addi r26, r26, 4
/* 000075D8 4180FF6C */ blt lbl_00007544
/* 000075DC 7F63DB78 */ mr r3, r27
/* 000075E0 4BFF8BCD */ bl mathutil_mtxA_from_mtx
/* 000075E4 3C600000 */ lis r3, mathutilData@ha
/* 000075E8 3B830000 */ addi r28, r3, mathutilData@l
/* 000075EC 807C0000 */ lwz r3, 0(r28)
/* 000075F0 38800000 */ li r4, 0
/* 000075F4 4BFF8BB9 */ bl GXLoadPosMtxImm
/* 000075F8 387E00F0 */ addi r3, r30, 0xf0
/* 000075FC 4BFF8BB1 */ bl draw_naomi_sprite
/* 00007600 387D0000 */ addi r3, r29, 0
/* 00007604 389E0944 */ addi r4, r30, 0x944
/* 00007608 4BFF8BA5 */ bl strcpy
/* 0000760C 4BFF8BA1 */ bl reset_text_draw_settings
/* 00007610 8861001D */ lbz r3, 0x1d(r1)
/* 00007614 4BFF8B99 */ bl set_text_font
/* 00007618 C021005C */ lfs f1, 0x5c(r1)
/* 0000761C C0410060 */ lfs f2, 0x60(r1)
/* 00007620 4BFF8B8D */ bl set_text_scale
/* 00007624 80610090 */ lwz r3, 0x90(r1)
/* 00007628 4BFF8B85 */ bl func_80071B50
/* 0000762C C0210068 */ lfs f1, 0x68(r1)
/* 00007630 4BFF8B7D */ bl func_80071B1C
/* 00007634 88010029 */ lbz r0, 0x29(r1)
/* 00007638 88610028 */ lbz r3, 0x28(r1)
/* 0000763C 5400402E */ slwi r0, r0, 8
/* 00007640 8881002A */ lbz r4, 0x2a(r1)
/* 00007644 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007648 7C830378 */ or r3, r4, r0
/* 0000764C 4BFF8B61 */ bl set_text_mul_color
/* 00007650 8801008D */ lbz r0, 0x8d(r1)
/* 00007654 8861008C */ lbz r3, 0x8c(r1)
/* 00007658 5400402E */ slwi r0, r0, 8
/* 0000765C 8881008E */ lbz r4, 0x8e(r1)
/* 00007660 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007664 7C830378 */ or r3, r4, r0
/* 00007668 4BFF8B45 */ bl set_text_add_color
/* 0000766C 7FA3EB78 */ mr r3, r29
/* 00007670 4BFF8B3D */ bl u_get_text_width
/* 00007674 C81F0058 */ lfd f0, 0x58(r31)
/* 00007678 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000767C FC000072 */ fmul f0, f0, f1
/* 00007680 FC020028 */ fsub f0, f2, f0
/* 00007684 FC000018 */ frsp f0, f0
/* 00007688 D0010020 */ stfs f0, 0x20(r1)
/* 0000768C C01F0190 */ lfs f0, 0x190(r31)
/* 00007690 D0010024 */ stfs f0, 0x24(r1)
/* 00007694 4BFF8B19 */ bl reset_text_draw_settings
/* 00007698 8861001D */ lbz r3, 0x1d(r1)
/* 0000769C 4BFF8B11 */ bl set_text_font
/* 000076A0 C021005C */ lfs f1, 0x5c(r1)
/* 000076A4 C0410060 */ lfs f2, 0x60(r1)
/* 000076A8 4BFF8B05 */ bl set_text_scale
/* 000076AC 80610090 */ lwz r3, 0x90(r1)
/* 000076B0 4BFF8AFD */ bl func_80071B50
/* 000076B4 C83F0028 */ lfd f1, 0x28(r31)
/* 000076B8 C0010068 */ lfs f0, 0x68(r1)
/* 000076BC FC21002A */ fadd f1, f1, f0
/* 000076C0 FC200818 */ frsp f1, f1
/* 000076C4 4BFF8AE9 */ bl func_80071B1C
/* 000076C8 38600000 */ li r3, 0
/* 000076CC 4BFF8AE1 */ bl set_text_mul_color
/* 000076D0 8801008D */ lbz r0, 0x8d(r1)
/* 000076D4 8861008C */ lbz r3, 0x8c(r1)
/* 000076D8 5400402E */ slwi r0, r0, 8
/* 000076DC 8881008E */ lbz r4, 0x8e(r1)
/* 000076E0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000076E4 7C830378 */ or r3, r4, r0
/* 000076E8 4BFF8AC5 */ bl set_text_add_color
/* 000076EC C85F0030 */ lfd f2, 0x30(r31)
/* 000076F0 C0210020 */ lfs f1, 0x20(r1)
/* 000076F4 C0010024 */ lfs f0, 0x24(r1)
/* 000076F8 FC22082A */ fadd f1, f2, f1
/* 000076FC FC42002A */ fadd f2, f2, f0
/* 00007700 FC200818 */ frsp f1, f1
/* 00007704 FC401018 */ frsp f2, f2
/* 00007708 4BFF8AA5 */ bl set_text_pos
/* 0000770C 7FA3EB78 */ mr r3, r29
/* 00007710 4BFF8A9D */ bl u_draw_text
/* 00007714 C0210068 */ lfs f1, 0x68(r1)
/* 00007718 4BFF8A95 */ bl func_80071B1C
/* 0000771C 88010029 */ lbz r0, 0x29(r1)
/* 00007720 88610028 */ lbz r3, 0x28(r1)
/* 00007724 5400402E */ slwi r0, r0, 8
/* 00007728 8881002A */ lbz r4, 0x2a(r1)
/* 0000772C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007730 7C830378 */ or r3, r4, r0
/* 00007734 4BFF8A79 */ bl set_text_mul_color
/* 00007738 8801008D */ lbz r0, 0x8d(r1)
/* 0000773C 8861008C */ lbz r3, 0x8c(r1)
/* 00007740 5400402E */ slwi r0, r0, 8
/* 00007744 8881008E */ lbz r4, 0x8e(r1)
/* 00007748 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000774C 7C830378 */ or r3, r4, r0
/* 00007750 4BFF8A5D */ bl set_text_add_color
/* 00007754 C0210020 */ lfs f1, 0x20(r1)
/* 00007758 C0410024 */ lfs f2, 0x24(r1)
/* 0000775C 4BFF8A51 */ bl set_text_pos
/* 00007760 7FA3EB78 */ mr r3, r29
/* 00007764 4BFF8A49 */ bl u_draw_text
/* 00007768 4BFF8A45 */ bl mathutil_mtxA_from_identity
/* 0000776C 807C0000 */ lwz r3, 0(r28)
/* 00007770 38800000 */ li r4, 0
/* 00007774 4BFF8A39 */ bl GXLoadPosMtxImm
/* 00007778 BAC100E0 */ lmw r22, 0xe0(r1)
/* 0000777C 80010114 */ lwz r0, 0x114(r1)
/* 00007780 CBE10108 */ lfd f31, 0x108(r1)
/* 00007784 38210110 */ addi r1, r1, 0x110
/* 00007788 7C0803A6 */ mtlr r0
/* 0000778C 4E800020 */ blr 
lbl_00007790:
/* 00007790 7C0802A6 */ mflr r0
/* 00007794 3860005A */ li r3, 0x5a
/* 00007798 90010004 */ stw r0, 4(r1)
/* 0000779C 9421FFF8 */ stwu r1, -8(r1)
/* 000077A0 4BFF8A0D */ bl find_sprite_with_tag
/* 000077A4 28030000 */ cmplwi r3, 0
/* 000077A8 41820018 */ beq lbl_000077C0
/* 000077AC 3C600000 */ lis r3, lbl_10000000@ha
/* 000077B0 38630000 */ addi r3, r3, lbl_10000000@l
/* 000077B4 38000004 */ li r0, 4
/* 000077B8 9803007C */ stb r0, 0x7c(r3)
/* 000077BC 4800007C */ b lbl_00007838
lbl_000077C0:
/* 000077C0 3860005A */ li r3, 0x5a
/* 000077C4 4BFFC7A9 */ bl lbl_00003F6C
/* 000077C8 28030000 */ cmplwi r3, 0
/* 000077CC 41820030 */ beq lbl_000077FC
/* 000077D0 38000004 */ li r0, 4
/* 000077D4 98030000 */ stb r0, 0(r3)
/* 000077D8 3800001E */ li r0, 0x1e
/* 000077DC 3C800000 */ lis r4, lbl_0000C394@ha
/* 000077E0 98030001 */ stb r0, 1(r3)
/* 000077E4 38A40000 */ addi r5, r4, lbl_0000C394@l
/* 000077E8 3C800000 */ lis r4, lbl_0000C370@ha
/* 000077EC C0050000 */ lfs f0, 0(r5)
/* 000077F0 D0030004 */ stfs f0, 4(r3)
/* 000077F4 C0040000 */ lfs f0, lbl_0000C370@l(r4)
/* 000077F8 D0030008 */ stfs f0, 8(r3)
lbl_000077FC:
/* 000077FC 4BFF89B1 */ bl create_sprite
/* 00007800 28030000 */ cmplwi r3, 0
/* 00007804 41820034 */ beq lbl_00007838
/* 00007808 3800005A */ li r0, 0x5a
/* 0000780C 3C800000 */ lis r4, lbl_00006C34@ha
/* 00007810 9803000F */ stb r0, 0xf(r3)
/* 00007814 38040000 */ addi r0, r4, lbl_00006C34@l
/* 00007818 3C800000 */ lis r4, lbl_00006C54@ha
/* 0000781C 90030034 */ stw r0, 0x34(r3)
/* 00007820 38040000 */ addi r0, r4, lbl_00006C54@l
/* 00007824 3C800000 */ lis r4, lbl_0000CC6C@ha
/* 00007828 90030038 */ stw r0, 0x38(r3)
/* 0000782C 38840000 */ addi r4, r4, lbl_0000CC6C@l
/* 00007830 3863008C */ addi r3, r3, 0x8c
/* 00007834 4BFF8979 */ bl strcpy
lbl_00007838:
/* 00007838 8001000C */ lwz r0, 0xc(r1)
/* 0000783C 38210008 */ addi r1, r1, 8
/* 00007840 7C0803A6 */ mtlr r0
/* 00007844 4E800020 */ blr 
lbl_00007848:
/* 00007848 7C0802A6 */ mflr r0
/* 0000784C 90010004 */ stw r0, 4(r1)
/* 00007850 9421FFF8 */ stwu r1, -8(r1)
/* 00007854 4BFFC79D */ bl lbl_00003FF0
/* 00007858 8001000C */ lwz r0, 0xc(r1)
/* 0000785C 38210008 */ addi r1, r1, 8
/* 00007860 7C0803A6 */ mtlr r0
/* 00007864 4E800020 */ blr 
lbl_00007868:
/* 00007868 7C0802A6 */ mflr r0
/* 0000786C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00007870 90010004 */ stw r0, 4(r1)
/* 00007874 9421FF18 */ stwu r1, -0xe8(r1)
/* 00007878 BF6100D4 */ stmw r27, 0xd4(r1)
/* 0000787C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 00007880 3C800000 */ lis r4, lbl_0000C370@ha
/* 00007884 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00007888 8863000F */ lbz r3, 0xf(r3)
/* 0000788C 7C630774 */ extsb r3, r3
/* 00007890 4BFFC6DD */ bl lbl_00003F6C
/* 00007894 28030000 */ cmplwi r3, 0
/* 00007898 41820040 */ beq lbl_000078D8
/* 0000789C C05F0000 */ lfs f2, 0(r31)
/* 000078A0 C0230004 */ lfs f1, 4(r3)
/* 000078A4 C0030008 */ lfs f0, 8(r3)
/* 000078A8 FC601090 */ fmr f3, f2
/* 000078AC EC21002A */ fadds f1, f1, f0
/* 000078B0 4BFF88FD */ bl mathutil_mtxA_from_translate_xyz
/* 000078B4 3C600000 */ lis r3, lbl_10000000@ha
/* 000078B8 38630000 */ addi r3, r3, lbl_10000000@l
/* 000078BC 38630184 */ addi r3, r3, 0x184
/* 000078C0 4BFF88ED */ bl mathutil_mtxA_to_mtx
/* 000078C4 3C600000 */ lis r3, mathutilData@ha
/* 000078C8 38630000 */ addi r3, r3, mathutilData@l
/* 000078CC 80630000 */ lwz r3, 0(r3)
/* 000078D0 38800000 */ li r4, 0
/* 000078D4 4BFF88D9 */ bl GXLoadPosMtxImm
lbl_000078D8:
/* 000078D8 7FA3EB78 */ mr r3, r29
/* 000078DC 4BFF88D1 */ bl draw_naomi_sprite
/* 000078E0 C01F0088 */ lfs f0, 0x88(r31)
/* 000078E4 3BC100A0 */ addi r30, r1, 0xa0
/* 000078E8 3B6000B3 */ li r27, 0xb3
/* 000078EC D0010060 */ stfs f0, 0x60(r1)
/* 000078F0 3B800000 */ li r28, 0
/* 000078F4 3C000020 */ lis r0, 0x20
/* 000078F8 C01F0060 */ lfs f0, 0x60(r31)
/* 000078FC 7FC3F378 */ mr r3, r30
/* 00007900 389D09B0 */ addi r4, r29, 0x9b0
/* 00007904 D0010054 */ stfs f0, 0x54(r1)
/* 00007908 C01F0060 */ lfs f0, 0x60(r31)
/* 0000790C D0010058 */ stfs f0, 0x58(r1)
/* 00007910 9B610015 */ stb r27, 0x15(r1)
/* 00007914 9B810084 */ stb r28, 0x84(r1)
/* 00007918 9B810085 */ stb r28, 0x85(r1)
/* 0000791C 9B810086 */ stb r28, 0x86(r1)
/* 00007920 90010088 */ stw r0, 0x88(r1)
/* 00007924 4BFF8889 */ bl strcpy
/* 00007928 4BFF8885 */ bl reset_text_draw_settings
/* 0000792C 88610015 */ lbz r3, 0x15(r1)
/* 00007930 4BFF887D */ bl set_text_font
/* 00007934 C0210054 */ lfs f1, 0x54(r1)
/* 00007938 C0410058 */ lfs f2, 0x58(r1)
/* 0000793C 4BFF8871 */ bl set_text_scale
/* 00007940 80610088 */ lwz r3, 0x88(r1)
/* 00007944 4BFF8869 */ bl func_80071B50
/* 00007948 C0210060 */ lfs f1, 0x60(r1)
/* 0000794C 4BFF8861 */ bl func_80071B1C
/* 00007950 88010021 */ lbz r0, 0x21(r1)
/* 00007954 88610020 */ lbz r3, 0x20(r1)
/* 00007958 5400402E */ slwi r0, r0, 8
/* 0000795C 88810022 */ lbz r4, 0x22(r1)
/* 00007960 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007964 7C830378 */ or r3, r4, r0
/* 00007968 4BFF8845 */ bl set_text_mul_color
/* 0000796C 88010085 */ lbz r0, 0x85(r1)
/* 00007970 88610084 */ lbz r3, 0x84(r1)
/* 00007974 5400402E */ slwi r0, r0, 8
/* 00007978 88810086 */ lbz r4, 0x86(r1)
/* 0000797C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007980 7C830378 */ or r3, r4, r0
/* 00007984 4BFF8829 */ bl set_text_add_color
/* 00007988 7FC3F378 */ mr r3, r30
/* 0000798C 4BFF8821 */ bl u_get_text_width
/* 00007990 C81F0058 */ lfd f0, 0x58(r31)
/* 00007994 380000FF */ li r0, 0xff
/* 00007998 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000799C FC000072 */ fmul f0, f0, f1
/* 000079A0 FC020028 */ fsub f0, f2, f0
/* 000079A4 FC000018 */ frsp f0, f0
/* 000079A8 D0010018 */ stfs f0, 0x18(r1)
/* 000079AC C01F0090 */ lfs f0, 0x90(r31)
/* 000079B0 D001001C */ stfs f0, 0x1c(r1)
/* 000079B4 98010020 */ stb r0, 0x20(r1)
/* 000079B8 98010021 */ stb r0, 0x21(r1)
/* 000079BC 9B810022 */ stb r28, 0x22(r1)
/* 000079C0 4BFF87ED */ bl reset_text_draw_settings
/* 000079C4 88610015 */ lbz r3, 0x15(r1)
/* 000079C8 4BFF87E5 */ bl set_text_font
/* 000079CC C0210054 */ lfs f1, 0x54(r1)
/* 000079D0 C0410058 */ lfs f2, 0x58(r1)
/* 000079D4 4BFF87D9 */ bl set_text_scale
/* 000079D8 80610088 */ lwz r3, 0x88(r1)
/* 000079DC 4BFF87D1 */ bl func_80071B50
/* 000079E0 C83F0028 */ lfd f1, 0x28(r31)
/* 000079E4 C0010060 */ lfs f0, 0x60(r1)
/* 000079E8 FC21002A */ fadd f1, f1, f0
/* 000079EC FC200818 */ frsp f1, f1
/* 000079F0 4BFF87BD */ bl func_80071B1C
/* 000079F4 38600000 */ li r3, 0
/* 000079F8 4BFF87B5 */ bl set_text_mul_color
/* 000079FC 88010085 */ lbz r0, 0x85(r1)
/* 00007A00 88610084 */ lbz r3, 0x84(r1)
/* 00007A04 5400402E */ slwi r0, r0, 8
/* 00007A08 88810086 */ lbz r4, 0x86(r1)
/* 00007A0C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007A10 7C830378 */ or r3, r4, r0
/* 00007A14 4BFF8799 */ bl set_text_add_color
/* 00007A18 C85F0030 */ lfd f2, 0x30(r31)
/* 00007A1C C0210018 */ lfs f1, 0x18(r1)
/* 00007A20 C001001C */ lfs f0, 0x1c(r1)
/* 00007A24 FC22082A */ fadd f1, f2, f1
/* 00007A28 FC42002A */ fadd f2, f2, f0
/* 00007A2C FC200818 */ frsp f1, f1
/* 00007A30 FC401018 */ frsp f2, f2
/* 00007A34 4BFF8779 */ bl set_text_pos
/* 00007A38 7FC3F378 */ mr r3, r30
/* 00007A3C 4BFF8771 */ bl u_draw_text
/* 00007A40 C0210060 */ lfs f1, 0x60(r1)
/* 00007A44 4BFF8769 */ bl func_80071B1C
/* 00007A48 88010021 */ lbz r0, 0x21(r1)
/* 00007A4C 88610020 */ lbz r3, 0x20(r1)
/* 00007A50 5400402E */ slwi r0, r0, 8
/* 00007A54 88810022 */ lbz r4, 0x22(r1)
/* 00007A58 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007A5C 7C830378 */ or r3, r4, r0
/* 00007A60 4BFF874D */ bl set_text_mul_color
/* 00007A64 88010085 */ lbz r0, 0x85(r1)
/* 00007A68 88610084 */ lbz r3, 0x84(r1)
/* 00007A6C 5400402E */ slwi r0, r0, 8
/* 00007A70 88810086 */ lbz r4, 0x86(r1)
/* 00007A74 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007A78 7C830378 */ or r3, r4, r0
/* 00007A7C 4BFF8731 */ bl set_text_add_color
/* 00007A80 C0210018 */ lfs f1, 0x18(r1)
/* 00007A84 C041001C */ lfs f2, 0x1c(r1)
/* 00007A88 4BFF8725 */ bl set_text_pos
/* 00007A8C 7FC3F378 */ mr r3, r30
/* 00007A90 4BFF871D */ bl u_draw_text
/* 00007A94 C03F0148 */ lfs f1, 0x148(r31)
/* 00007A98 387D07D0 */ addi r3, r29, 0x7d0
/* 00007A9C C05F009C */ lfs f2, 0x9c(r31)
/* 00007AA0 4BFFC81D */ bl lbl_000042BC
/* 00007AA4 C01F0194 */ lfs f0, 0x194(r31)
/* 00007AA8 387E0000 */ addi r3, r30, 0
/* 00007AAC 389D09B8 */ addi r4, r29, 0x9b8
/* 00007AB0 D0010018 */ stfs f0, 0x18(r1)
/* 00007AB4 C01F0198 */ lfs f0, 0x198(r31)
/* 00007AB8 D001001C */ stfs f0, 0x1c(r1)
/* 00007ABC 4BFF86F1 */ bl strcpy
/* 00007AC0 4BFF86ED */ bl reset_text_draw_settings
/* 00007AC4 88610015 */ lbz r3, 0x15(r1)
/* 00007AC8 4BFF86E5 */ bl set_text_font
/* 00007ACC C0210054 */ lfs f1, 0x54(r1)
/* 00007AD0 C0410058 */ lfs f2, 0x58(r1)
/* 00007AD4 4BFF86D9 */ bl set_text_scale
/* 00007AD8 80610088 */ lwz r3, 0x88(r1)
/* 00007ADC 4BFF86D1 */ bl func_80071B50
/* 00007AE0 C83F0028 */ lfd f1, 0x28(r31)
/* 00007AE4 C0010060 */ lfs f0, 0x60(r1)
/* 00007AE8 FC21002A */ fadd f1, f1, f0
/* 00007AEC FC200818 */ frsp f1, f1
/* 00007AF0 4BFF86BD */ bl func_80071B1C
/* 00007AF4 38600000 */ li r3, 0
/* 00007AF8 4BFF86B5 */ bl set_text_mul_color
/* 00007AFC 88010085 */ lbz r0, 0x85(r1)
/* 00007B00 88610084 */ lbz r3, 0x84(r1)
/* 00007B04 5400402E */ slwi r0, r0, 8
/* 00007B08 88810086 */ lbz r4, 0x86(r1)
/* 00007B0C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007B10 7C830378 */ or r3, r4, r0
/* 00007B14 4BFF8699 */ bl set_text_add_color
/* 00007B18 C85F0030 */ lfd f2, 0x30(r31)
/* 00007B1C C0210018 */ lfs f1, 0x18(r1)
/* 00007B20 C001001C */ lfs f0, 0x1c(r1)
/* 00007B24 FC22082A */ fadd f1, f2, f1
/* 00007B28 FC42002A */ fadd f2, f2, f0
/* 00007B2C FC200818 */ frsp f1, f1
/* 00007B30 FC401018 */ frsp f2, f2
/* 00007B34 4BFF8679 */ bl set_text_pos
/* 00007B38 7FC3F378 */ mr r3, r30
/* 00007B3C 4BFF8671 */ bl u_draw_text
/* 00007B40 C0210060 */ lfs f1, 0x60(r1)
/* 00007B44 4BFF8669 */ bl func_80071B1C
/* 00007B48 88010021 */ lbz r0, 0x21(r1)
/* 00007B4C 88610020 */ lbz r3, 0x20(r1)
/* 00007B50 5400402E */ slwi r0, r0, 8
/* 00007B54 88810022 */ lbz r4, 0x22(r1)
/* 00007B58 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007B5C 7C830378 */ or r3, r4, r0
/* 00007B60 4BFF864D */ bl set_text_mul_color
/* 00007B64 88010085 */ lbz r0, 0x85(r1)
/* 00007B68 88610084 */ lbz r3, 0x84(r1)
/* 00007B6C 5400402E */ slwi r0, r0, 8
/* 00007B70 88810086 */ lbz r4, 0x86(r1)
/* 00007B74 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007B78 7C830378 */ or r3, r4, r0
/* 00007B7C 4BFF8631 */ bl set_text_add_color
/* 00007B80 C0210018 */ lfs f1, 0x18(r1)
/* 00007B84 C041001C */ lfs f2, 0x1c(r1)
/* 00007B88 4BFF8625 */ bl set_text_pos
/* 00007B8C 7FC3F378 */ mr r3, r30
/* 00007B90 4BFF861D */ bl u_draw_text
/* 00007B94 4BFF8619 */ bl OSGetSoundMode
/* 00007B98 C01F019C */ lfs f0, 0x19c(r31)
/* 00007B9C 3B830000 */ addi r28, r3, 0
/* 00007BA0 380000B0 */ li r0, 0xb0
/* 00007BA4 D0010018 */ stfs f0, 0x18(r1)
/* 00007BA8 387E0000 */ addi r3, r30, 0
/* 00007BAC 389D09C8 */ addi r4, r29, 0x9c8
/* 00007BB0 C01F0198 */ lfs f0, 0x198(r31)
/* 00007BB4 D001001C */ stfs f0, 0x1c(r1)
/* 00007BB8 C01F0158 */ lfs f0, 0x158(r31)
/* 00007BBC D0010054 */ stfs f0, 0x54(r1)
/* 00007BC0 98010015 */ stb r0, 0x15(r1)
/* 00007BC4 4BFF85E9 */ bl strcpy
/* 00007BC8 4BFF85E5 */ bl reset_text_draw_settings
/* 00007BCC 88610015 */ lbz r3, 0x15(r1)
/* 00007BD0 4BFF85DD */ bl set_text_font
/* 00007BD4 C0210054 */ lfs f1, 0x54(r1)
/* 00007BD8 C0410058 */ lfs f2, 0x58(r1)
/* 00007BDC 4BFF85D1 */ bl set_text_scale
/* 00007BE0 80610088 */ lwz r3, 0x88(r1)
/* 00007BE4 4BFF85C9 */ bl func_80071B50
/* 00007BE8 C83F0028 */ lfd f1, 0x28(r31)
/* 00007BEC C0010060 */ lfs f0, 0x60(r1)
/* 00007BF0 FC21002A */ fadd f1, f1, f0
/* 00007BF4 FC200818 */ frsp f1, f1
/* 00007BF8 4BFF85B5 */ bl func_80071B1C
/* 00007BFC 38600000 */ li r3, 0
/* 00007C00 4BFF85AD */ bl set_text_mul_color
/* 00007C04 88010085 */ lbz r0, 0x85(r1)
/* 00007C08 88610084 */ lbz r3, 0x84(r1)
/* 00007C0C 5400402E */ slwi r0, r0, 8
/* 00007C10 88810086 */ lbz r4, 0x86(r1)
/* 00007C14 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007C18 7C830378 */ or r3, r4, r0
/* 00007C1C 4BFF8591 */ bl set_text_add_color
/* 00007C20 C85F0030 */ lfd f2, 0x30(r31)
/* 00007C24 C0210018 */ lfs f1, 0x18(r1)
/* 00007C28 C001001C */ lfs f0, 0x1c(r1)
/* 00007C2C FC22082A */ fadd f1, f2, f1
/* 00007C30 FC42002A */ fadd f2, f2, f0
/* 00007C34 FC200818 */ frsp f1, f1
/* 00007C38 FC401018 */ frsp f2, f2
/* 00007C3C 4BFF8571 */ bl set_text_pos
/* 00007C40 7FC3F378 */ mr r3, r30
/* 00007C44 4BFF8569 */ bl u_draw_text
/* 00007C48 C0210060 */ lfs f1, 0x60(r1)
/* 00007C4C 4BFF8561 */ bl func_80071B1C
/* 00007C50 88010021 */ lbz r0, 0x21(r1)
/* 00007C54 88610020 */ lbz r3, 0x20(r1)
/* 00007C58 5400402E */ slwi r0, r0, 8
/* 00007C5C 88810022 */ lbz r4, 0x22(r1)
/* 00007C60 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007C64 7C830378 */ or r3, r4, r0
/* 00007C68 4BFF8545 */ bl set_text_mul_color
/* 00007C6C 88010085 */ lbz r0, 0x85(r1)
/* 00007C70 88610084 */ lbz r3, 0x84(r1)
/* 00007C74 5400402E */ slwi r0, r0, 8
/* 00007C78 88810086 */ lbz r4, 0x86(r1)
/* 00007C7C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007C80 7C830378 */ or r3, r4, r0
/* 00007C84 4BFF8529 */ bl set_text_add_color
/* 00007C88 C0210018 */ lfs f1, 0x18(r1)
/* 00007C8C C041001C */ lfs f2, 0x1c(r1)
/* 00007C90 4BFF851D */ bl set_text_pos
/* 00007C94 7FC3F378 */ mr r3, r30
/* 00007C98 4BFF8515 */ bl u_draw_text
/* 00007C9C 9B610015 */ stb r27, 0x15(r1)
/* 00007CA0 387D0960 */ addi r3, r29, 0x960
/* 00007CA4 C01F0060 */ lfs f0, 0x60(r31)
/* 00007CA8 D0010054 */ stfs f0, 0x54(r1)
/* 00007CAC C01F01A0 */ lfs f0, 0x1a0(r31)
/* 00007CB0 D01D0964 */ stfs f0, 0x964(r29)
/* 00007CB4 C01F00C8 */ lfs f0, 0xc8(r31)
/* 00007CB8 D01D0968 */ stfs f0, 0x968(r29)
/* 00007CBC C01F01A4 */ lfs f0, 0x1a4(r31)
/* 00007CC0 D01D0970 */ stfs f0, 0x970(r29)
/* 00007CC4 C01F01A8 */ lfs f0, 0x1a8(r31)
/* 00007CC8 D01D0974 */ stfs f0, 0x974(r29)
/* 00007CCC 4BFF84E1 */ bl draw_naomi_sprite
/* 00007CD0 C01F01AC */ lfs f0, 0x1ac(r31)
/* 00007CD4 281C0001 */ cmplwi r28, 1
/* 00007CD8 D0010018 */ stfs f0, 0x18(r1)
/* 00007CDC C01F0198 */ lfs f0, 0x198(r31)
/* 00007CE0 D001001C */ stfs f0, 0x1c(r1)
/* 00007CE4 40820014 */ bne lbl_00007CF8
/* 00007CE8 387E0000 */ addi r3, r30, 0
/* 00007CEC 389D09EC */ addi r4, r29, 0x9ec
/* 00007CF0 4BFF84BD */ bl strcpy
/* 00007CF4 48000010 */ b lbl_00007D04
lbl_00007CF8:
/* 00007CF8 387E0000 */ addi r3, r30, 0
/* 00007CFC 389D09F8 */ addi r4, r29, 0x9f8
/* 00007D00 4BFF84AD */ bl strcpy
lbl_00007D04:
/* 00007D04 4BFF84A9 */ bl reset_text_draw_settings
/* 00007D08 88610015 */ lbz r3, 0x15(r1)
/* 00007D0C 4BFF84A1 */ bl set_text_font
/* 00007D10 C0210054 */ lfs f1, 0x54(r1)
/* 00007D14 C0410058 */ lfs f2, 0x58(r1)
/* 00007D18 4BFF8495 */ bl set_text_scale
/* 00007D1C 80610088 */ lwz r3, 0x88(r1)
/* 00007D20 4BFF848D */ bl func_80071B50
/* 00007D24 C83F0028 */ lfd f1, 0x28(r31)
/* 00007D28 C0010060 */ lfs f0, 0x60(r1)
/* 00007D2C FC21002A */ fadd f1, f1, f0
/* 00007D30 FC200818 */ frsp f1, f1
/* 00007D34 4BFF8479 */ bl func_80071B1C
/* 00007D38 38600000 */ li r3, 0
/* 00007D3C 4BFF8471 */ bl set_text_mul_color
/* 00007D40 88010085 */ lbz r0, 0x85(r1)
/* 00007D44 88610084 */ lbz r3, 0x84(r1)
/* 00007D48 5400402E */ slwi r0, r0, 8
/* 00007D4C 88810086 */ lbz r4, 0x86(r1)
/* 00007D50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007D54 7C830378 */ or r3, r4, r0
/* 00007D58 4BFF8455 */ bl set_text_add_color
/* 00007D5C C85F0030 */ lfd f2, 0x30(r31)
/* 00007D60 C0210018 */ lfs f1, 0x18(r1)
/* 00007D64 C001001C */ lfs f0, 0x1c(r1)
/* 00007D68 FC22082A */ fadd f1, f2, f1
/* 00007D6C FC42002A */ fadd f2, f2, f0
/* 00007D70 FC200818 */ frsp f1, f1
/* 00007D74 FC401018 */ frsp f2, f2
/* 00007D78 4BFF8435 */ bl set_text_pos
/* 00007D7C 7FC3F378 */ mr r3, r30
/* 00007D80 4BFF842D */ bl u_draw_text
/* 00007D84 C0210060 */ lfs f1, 0x60(r1)
/* 00007D88 4BFF8425 */ bl func_80071B1C
/* 00007D8C 88010021 */ lbz r0, 0x21(r1)
/* 00007D90 88610020 */ lbz r3, 0x20(r1)
/* 00007D94 5400402E */ slwi r0, r0, 8
/* 00007D98 88810022 */ lbz r4, 0x22(r1)
/* 00007D9C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007DA0 7C830378 */ or r3, r4, r0
/* 00007DA4 4BFF8409 */ bl set_text_mul_color
/* 00007DA8 88010085 */ lbz r0, 0x85(r1)
/* 00007DAC 88610084 */ lbz r3, 0x84(r1)
/* 00007DB0 5400402E */ slwi r0, r0, 8
/* 00007DB4 88810086 */ lbz r4, 0x86(r1)
/* 00007DB8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007DBC 7C830378 */ or r3, r4, r0
/* 00007DC0 4BFF83ED */ bl set_text_add_color
/* 00007DC4 C0210018 */ lfs f1, 0x18(r1)
/* 00007DC8 C041001C */ lfs f2, 0x1c(r1)
/* 00007DCC 4BFF83E1 */ bl set_text_pos
/* 00007DD0 7FC3F378 */ mr r3, r30
/* 00007DD4 4BFF83D9 */ bl u_draw_text
/* 00007DD8 387D00F0 */ addi r3, r29, 0xf0
/* 00007DDC 4BFF83D1 */ bl draw_naomi_sprite
/* 00007DE0 387E0000 */ addi r3, r30, 0
/* 00007DE4 389D0A00 */ addi r4, r29, 0xa00
/* 00007DE8 4BFF83C5 */ bl strcpy
/* 00007DEC 386000FF */ li r3, 0xff
/* 00007DF0 98610020 */ stb r3, 0x20(r1)
/* 00007DF4 38000000 */ li r0, 0
/* 00007DF8 98610021 */ stb r3, 0x21(r1)
/* 00007DFC 98010022 */ stb r0, 0x22(r1)
/* 00007E00 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00007E04 D0010054 */ stfs f0, 0x54(r1)
/* 00007E08 4BFF83A5 */ bl reset_text_draw_settings
/* 00007E0C 88610015 */ lbz r3, 0x15(r1)
/* 00007E10 4BFF839D */ bl set_text_font
/* 00007E14 C0210054 */ lfs f1, 0x54(r1)
/* 00007E18 C0410058 */ lfs f2, 0x58(r1)
/* 00007E1C 4BFF8391 */ bl set_text_scale
/* 00007E20 80610088 */ lwz r3, 0x88(r1)
/* 00007E24 4BFF8389 */ bl func_80071B50
/* 00007E28 C0210060 */ lfs f1, 0x60(r1)
/* 00007E2C 4BFF8381 */ bl func_80071B1C
/* 00007E30 88010021 */ lbz r0, 0x21(r1)
/* 00007E34 88610020 */ lbz r3, 0x20(r1)
/* 00007E38 5400402E */ slwi r0, r0, 8
/* 00007E3C 88810022 */ lbz r4, 0x22(r1)
/* 00007E40 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007E44 7C830378 */ or r3, r4, r0
/* 00007E48 4BFF8365 */ bl set_text_mul_color
/* 00007E4C 88010085 */ lbz r0, 0x85(r1)
/* 00007E50 88610084 */ lbz r3, 0x84(r1)
/* 00007E54 5400402E */ slwi r0, r0, 8
/* 00007E58 88810086 */ lbz r4, 0x86(r1)
/* 00007E5C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007E60 7C830378 */ or r3, r4, r0
/* 00007E64 4BFF8349 */ bl set_text_add_color
/* 00007E68 7FC3F378 */ mr r3, r30
/* 00007E6C 4BFF8341 */ bl u_get_text_width
/* 00007E70 C81F0058 */ lfd f0, 0x58(r31)
/* 00007E74 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00007E78 FC000072 */ fmul f0, f0, f1
/* 00007E7C FC020028 */ fsub f0, f2, f0
/* 00007E80 FC000018 */ frsp f0, f0
/* 00007E84 D0010018 */ stfs f0, 0x18(r1)
/* 00007E88 C01F0190 */ lfs f0, 0x190(r31)
/* 00007E8C D001001C */ stfs f0, 0x1c(r1)
/* 00007E90 4BFF831D */ bl reset_text_draw_settings
/* 00007E94 88610015 */ lbz r3, 0x15(r1)
/* 00007E98 4BFF8315 */ bl set_text_font
/* 00007E9C C0210054 */ lfs f1, 0x54(r1)
/* 00007EA0 C0410058 */ lfs f2, 0x58(r1)
/* 00007EA4 4BFF8309 */ bl set_text_scale
/* 00007EA8 80610088 */ lwz r3, 0x88(r1)
/* 00007EAC 4BFF8301 */ bl func_80071B50
/* 00007EB0 C83F0028 */ lfd f1, 0x28(r31)
/* 00007EB4 C0010060 */ lfs f0, 0x60(r1)
/* 00007EB8 FC21002A */ fadd f1, f1, f0
/* 00007EBC FC200818 */ frsp f1, f1
/* 00007EC0 4BFF82ED */ bl func_80071B1C
/* 00007EC4 38600000 */ li r3, 0
/* 00007EC8 4BFF82E5 */ bl set_text_mul_color
/* 00007ECC 88010085 */ lbz r0, 0x85(r1)
/* 00007ED0 88610084 */ lbz r3, 0x84(r1)
/* 00007ED4 5400402E */ slwi r0, r0, 8
/* 00007ED8 88810086 */ lbz r4, 0x86(r1)
/* 00007EDC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007EE0 7C830378 */ or r3, r4, r0
/* 00007EE4 4BFF82C9 */ bl set_text_add_color
/* 00007EE8 C85F0030 */ lfd f2, 0x30(r31)
/* 00007EEC C0210018 */ lfs f1, 0x18(r1)
/* 00007EF0 C001001C */ lfs f0, 0x1c(r1)
/* 00007EF4 FC22082A */ fadd f1, f2, f1
/* 00007EF8 FC42002A */ fadd f2, f2, f0
/* 00007EFC FC200818 */ frsp f1, f1
/* 00007F00 FC401018 */ frsp f2, f2
/* 00007F04 4BFF82A9 */ bl set_text_pos
/* 00007F08 7FC3F378 */ mr r3, r30
/* 00007F0C 4BFF82A1 */ bl u_draw_text
/* 00007F10 C0210060 */ lfs f1, 0x60(r1)
/* 00007F14 4BFF8299 */ bl func_80071B1C
/* 00007F18 88010021 */ lbz r0, 0x21(r1)
/* 00007F1C 88610020 */ lbz r3, 0x20(r1)
/* 00007F20 5400402E */ slwi r0, r0, 8
/* 00007F24 88810022 */ lbz r4, 0x22(r1)
/* 00007F28 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007F2C 7C830378 */ or r3, r4, r0
/* 00007F30 4BFF827D */ bl set_text_mul_color
/* 00007F34 88010085 */ lbz r0, 0x85(r1)
/* 00007F38 88610084 */ lbz r3, 0x84(r1)
/* 00007F3C 5400402E */ slwi r0, r0, 8
/* 00007F40 88810086 */ lbz r4, 0x86(r1)
/* 00007F44 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007F48 7C830378 */ or r3, r4, r0
/* 00007F4C 4BFF8261 */ bl set_text_add_color
/* 00007F50 C0210018 */ lfs f1, 0x18(r1)
/* 00007F54 C041001C */ lfs f2, 0x1c(r1)
/* 00007F58 4BFF8255 */ bl set_text_pos
/* 00007F5C 7FC3F378 */ mr r3, r30
/* 00007F60 4BFF824D */ bl u_draw_text
/* 00007F64 4BFF8249 */ bl mathutil_mtxA_from_identity
/* 00007F68 3C600000 */ lis r3, mathutilData@ha
/* 00007F6C 38630000 */ addi r3, r3, mathutilData@l
/* 00007F70 80630000 */ lwz r3, 0(r3)
/* 00007F74 38800000 */ li r4, 0
/* 00007F78 4BFF8235 */ bl GXLoadPosMtxImm
/* 00007F7C BB6100D4 */ lmw r27, 0xd4(r1)
/* 00007F80 800100EC */ lwz r0, 0xec(r1)
/* 00007F84 382100E8 */ addi r1, r1, 0xe8
/* 00007F88 7C0803A6 */ mtlr r0
/* 00007F8C 4E800020 */ blr 
lbl_00007F90:
/* 00007F90 7C0802A6 */ mflr r0
/* 00007F94 3860005C */ li r3, 0x5c
/* 00007F98 90010004 */ stw r0, 4(r1)
/* 00007F9C 9421FFF8 */ stwu r1, -8(r1)
/* 00007FA0 4BFF820D */ bl find_sprite_with_tag
/* 00007FA4 28030000 */ cmplwi r3, 0
/* 00007FA8 41820018 */ beq lbl_00007FC0
/* 00007FAC 3C600000 */ lis r3, lbl_10000000@ha
/* 00007FB0 38630000 */ addi r3, r3, lbl_10000000@l
/* 00007FB4 38000004 */ li r0, 4
/* 00007FB8 980300BC */ stb r0, 0xbc(r3)
/* 00007FBC 4800007C */ b lbl_00008038
lbl_00007FC0:
/* 00007FC0 3860005C */ li r3, 0x5c
/* 00007FC4 4BFFBFA9 */ bl lbl_00003F6C
/* 00007FC8 28030000 */ cmplwi r3, 0
/* 00007FCC 41820030 */ beq lbl_00007FFC
/* 00007FD0 38000004 */ li r0, 4
/* 00007FD4 98030000 */ stb r0, 0(r3)
/* 00007FD8 3800001E */ li r0, 0x1e
/* 00007FDC 3C800000 */ lis r4, lbl_0000C394@ha
/* 00007FE0 98030001 */ stb r0, 1(r3)
/* 00007FE4 38A40000 */ addi r5, r4, lbl_0000C394@l
/* 00007FE8 3C800000 */ lis r4, lbl_0000C370@ha
/* 00007FEC C0050000 */ lfs f0, 0(r5)
/* 00007FF0 D0030004 */ stfs f0, 4(r3)
/* 00007FF4 C0040000 */ lfs f0, lbl_0000C370@l(r4)
/* 00007FF8 D0030008 */ stfs f0, 8(r3)
lbl_00007FFC:
/* 00007FFC 4BFF81B1 */ bl create_sprite
/* 00008000 28030000 */ cmplwi r3, 0
/* 00008004 41820034 */ beq lbl_00008038
/* 00008008 3800005C */ li r0, 0x5c
/* 0000800C 3C800000 */ lis r4, lbl_00007848@ha
/* 00008010 9803000F */ stb r0, 0xf(r3)
/* 00008014 38040000 */ addi r0, r4, lbl_00007848@l
/* 00008018 3C800000 */ lis r4, lbl_00007868@ha
/* 0000801C 90030034 */ stw r0, 0x34(r3)
/* 00008020 38040000 */ addi r0, r4, lbl_00007868@l
/* 00008024 3C800000 */ lis r4, lbl_0000D310@ha
/* 00008028 90030038 */ stw r0, 0x38(r3)
/* 0000802C 38840000 */ addi r4, r4, lbl_0000D310@l
/* 00008030 3863008C */ addi r3, r3, 0x8c
/* 00008034 4BFF8179 */ bl strcpy
lbl_00008038:
/* 00008038 8001000C */ lwz r0, 0xc(r1)
/* 0000803C 38210008 */ addi r1, r1, 8
/* 00008040 7C0803A6 */ mtlr r0
/* 00008044 4E800020 */ blr 
lbl_00008048:
/* 00008048 7C0802A6 */ mflr r0
/* 0000804C 90010004 */ stw r0, 4(r1)
/* 00008050 9421FFF8 */ stwu r1, -8(r1)
/* 00008054 4BFFBF9D */ bl lbl_00003FF0
/* 00008058 8001000C */ lwz r0, 0xc(r1)
/* 0000805C 38210008 */ addi r1, r1, 8
/* 00008060 7C0803A6 */ mtlr r0
/* 00008064 4E800020 */ blr 
lbl_00008068:
/* 00008068 7C0802A6 */ mflr r0
/* 0000806C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00008070 90010004 */ stw r0, 4(r1)
/* 00008074 9421FEB0 */ stwu r1, -0x150(r1)
/* 00008078 BE810120 */ stmw r20, 0x120(r1)
/* 0000807C 3BC40000 */ addi r30, r4, lbl_0000C8F0@l
/* 00008080 3C800000 */ lis r4, lbl_0000C370@ha
/* 00008084 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00008088 8863000F */ lbz r3, 0xf(r3)
/* 0000808C 7C630774 */ extsb r3, r3
/* 00008090 4BFFBEDD */ bl lbl_00003F6C
/* 00008094 28030000 */ cmplwi r3, 0
/* 00008098 41820040 */ beq lbl_000080D8
/* 0000809C C05F0000 */ lfs f2, 0(r31)
/* 000080A0 C0230004 */ lfs f1, 4(r3)
/* 000080A4 C0030008 */ lfs f0, 8(r3)
/* 000080A8 FC601090 */ fmr f3, f2
/* 000080AC EC21002A */ fadds f1, f1, f0
/* 000080B0 4BFF80FD */ bl mathutil_mtxA_from_translate_xyz
/* 000080B4 3C600000 */ lis r3, lbl_10000000@ha
/* 000080B8 38630000 */ addi r3, r3, lbl_10000000@l
/* 000080BC 38630184 */ addi r3, r3, 0x184
/* 000080C0 4BFF80ED */ bl mathutil_mtxA_to_mtx
/* 000080C4 3C600000 */ lis r3, mathutilData@ha
/* 000080C8 38630000 */ addi r3, r3, mathutilData@l
/* 000080CC 80630000 */ lwz r3, 0(r3)
/* 000080D0 38800000 */ li r4, 0
/* 000080D4 4BFF80D9 */ bl GXLoadPosMtxImm
lbl_000080D8:
/* 000080D8 7FC3F378 */ mr r3, r30
/* 000080DC 4BFF80D1 */ bl draw_naomi_sprite
/* 000080E0 C01F0088 */ lfs f0, 0x88(r31)
/* 000080E4 3AA100AC */ addi r21, r1, 0xac
/* 000080E8 388000B3 */ li r4, 0xb3
/* 000080EC D001006C */ stfs f0, 0x6c(r1)
/* 000080F0 3A800000 */ li r20, 0
/* 000080F4 3C000020 */ lis r0, 0x20
/* 000080F8 C01F0060 */ lfs f0, 0x60(r31)
/* 000080FC 7EA3AB78 */ mr r3, r21
/* 00008100 D0010060 */ stfs f0, 0x60(r1)
/* 00008104 C01F0060 */ lfs f0, 0x60(r31)
/* 00008108 D0010064 */ stfs f0, 0x64(r1)
/* 0000810C 98810021 */ stb r4, 0x21(r1)
/* 00008110 389E0D38 */ addi r4, r30, 0xd38
/* 00008114 9A810090 */ stb r20, 0x90(r1)
/* 00008118 9A810091 */ stb r20, 0x91(r1)
/* 0000811C 9A810092 */ stb r20, 0x92(r1)
/* 00008120 90010094 */ stw r0, 0x94(r1)
/* 00008124 C01F0060 */ lfs f0, 0x60(r31)
/* 00008128 D0010060 */ stfs f0, 0x60(r1)
/* 0000812C 4BFF8081 */ bl strcpy
/* 00008130 4BFF807D */ bl reset_text_draw_settings
/* 00008134 88610021 */ lbz r3, 0x21(r1)
/* 00008138 4BFF8075 */ bl set_text_font
/* 0000813C C0210060 */ lfs f1, 0x60(r1)
/* 00008140 C0410064 */ lfs f2, 0x64(r1)
/* 00008144 4BFF8069 */ bl set_text_scale
/* 00008148 80610094 */ lwz r3, 0x94(r1)
/* 0000814C 4BFF8061 */ bl func_80071B50
/* 00008150 C021006C */ lfs f1, 0x6c(r1)
/* 00008154 4BFF8059 */ bl func_80071B1C
/* 00008158 8801002D */ lbz r0, 0x2d(r1)
/* 0000815C 8861002C */ lbz r3, 0x2c(r1)
/* 00008160 5400402E */ slwi r0, r0, 8
/* 00008164 8881002E */ lbz r4, 0x2e(r1)
/* 00008168 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000816C 7C830378 */ or r3, r4, r0
/* 00008170 4BFF803D */ bl set_text_mul_color
/* 00008174 88010091 */ lbz r0, 0x91(r1)
/* 00008178 88610090 */ lbz r3, 0x90(r1)
/* 0000817C 5400402E */ slwi r0, r0, 8
/* 00008180 88810092 */ lbz r4, 0x92(r1)
/* 00008184 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008188 7C830378 */ or r3, r4, r0
/* 0000818C 4BFF8021 */ bl set_text_add_color
/* 00008190 7EA3AB78 */ mr r3, r21
/* 00008194 4BFF8019 */ bl u_get_text_width
/* 00008198 C81F0058 */ lfd f0, 0x58(r31)
/* 0000819C 380000FF */ li r0, 0xff
/* 000081A0 C85F00A8 */ lfd f2, 0xa8(r31)
/* 000081A4 FC000072 */ fmul f0, f0, f1
/* 000081A8 FC020028 */ fsub f0, f2, f0
/* 000081AC FC000018 */ frsp f0, f0
/* 000081B0 D0010024 */ stfs f0, 0x24(r1)
/* 000081B4 C01F0090 */ lfs f0, 0x90(r31)
/* 000081B8 D0010028 */ stfs f0, 0x28(r1)
/* 000081BC 9801002C */ stb r0, 0x2c(r1)
/* 000081C0 9801002D */ stb r0, 0x2d(r1)
/* 000081C4 9A81002E */ stb r20, 0x2e(r1)
/* 000081C8 4BFF7FE5 */ bl reset_text_draw_settings
/* 000081CC 88610021 */ lbz r3, 0x21(r1)
/* 000081D0 4BFF7FDD */ bl set_text_font
/* 000081D4 C0210060 */ lfs f1, 0x60(r1)
/* 000081D8 C0410064 */ lfs f2, 0x64(r1)
/* 000081DC 4BFF7FD1 */ bl set_text_scale
/* 000081E0 80610094 */ lwz r3, 0x94(r1)
/* 000081E4 4BFF7FC9 */ bl func_80071B50
/* 000081E8 C83F0028 */ lfd f1, 0x28(r31)
/* 000081EC C001006C */ lfs f0, 0x6c(r1)
/* 000081F0 FC21002A */ fadd f1, f1, f0
/* 000081F4 FC200818 */ frsp f1, f1
/* 000081F8 4BFF7FB5 */ bl func_80071B1C
/* 000081FC 38600000 */ li r3, 0
/* 00008200 4BFF7FAD */ bl set_text_mul_color
/* 00008204 88010091 */ lbz r0, 0x91(r1)
/* 00008208 88610090 */ lbz r3, 0x90(r1)
/* 0000820C 5400402E */ slwi r0, r0, 8
/* 00008210 88810092 */ lbz r4, 0x92(r1)
/* 00008214 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008218 7C830378 */ or r3, r4, r0
/* 0000821C 4BFF7F91 */ bl set_text_add_color
/* 00008220 C85F0030 */ lfd f2, 0x30(r31)
/* 00008224 C0210024 */ lfs f1, 0x24(r1)
/* 00008228 C0010028 */ lfs f0, 0x28(r1)
/* 0000822C FC22082A */ fadd f1, f2, f1
/* 00008230 FC42002A */ fadd f2, f2, f0
/* 00008234 FC200818 */ frsp f1, f1
/* 00008238 FC401018 */ frsp f2, f2
/* 0000823C 4BFF7F71 */ bl set_text_pos
/* 00008240 7EA3AB78 */ mr r3, r21
/* 00008244 4BFF7F69 */ bl u_draw_text
/* 00008248 C021006C */ lfs f1, 0x6c(r1)
/* 0000824C 4BFF7F61 */ bl func_80071B1C
/* 00008250 8801002D */ lbz r0, 0x2d(r1)
/* 00008254 8861002C */ lbz r3, 0x2c(r1)
/* 00008258 5400402E */ slwi r0, r0, 8
/* 0000825C 8881002E */ lbz r4, 0x2e(r1)
/* 00008260 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008264 7C830378 */ or r3, r4, r0
/* 00008268 4BFF7F45 */ bl set_text_mul_color
/* 0000826C 88010091 */ lbz r0, 0x91(r1)
/* 00008270 88610090 */ lbz r3, 0x90(r1)
/* 00008274 5400402E */ slwi r0, r0, 8
/* 00008278 88810092 */ lbz r4, 0x92(r1)
/* 0000827C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008280 7C830378 */ or r3, r4, r0
/* 00008284 4BFF7F29 */ bl set_text_add_color
/* 00008288 C0210024 */ lfs f1, 0x24(r1)
/* 0000828C C0410028 */ lfs f2, 0x28(r1)
/* 00008290 4BFF7F1D */ bl set_text_pos
/* 00008294 7EA3AB78 */ mr r3, r21
/* 00008298 4BFF7F15 */ bl u_draw_text
/* 0000829C C01F0060 */ lfs f0, 0x60(r31)
/* 000082A0 3C600000 */ lis r3, modeCtrl@ha
/* 000082A4 38630000 */ addi r3, r3, modeCtrl@l
/* 000082A8 D0010060 */ stfs f0, 0x60(r1)
/* 000082AC 380000B1 */ li r0, 0xb1
/* 000082B0 3B150000 */ addi r24, r21, 0
/* 000082B4 98010021 */ stb r0, 0x21(r1)
/* 000082B8 3BBE0CD8 */ addi r29, r30, 0xcd8
/* 000082BC 3B7E0A7C */ addi r27, r30, 0xa7c
/* 000082C0 3A9E0A2C */ addi r20, r30, 0xa2c
/* 000082C4 3B830042 */ addi r28, r3, 0x42
/* 000082C8 3B400000 */ li r26, 0
/* 000082CC 3F204330 */ lis r25, 0x4330
lbl_000082D0:
/* 000082D0 C01D0000 */ lfs f0, 0(r29)
/* 000082D4 7E83A378 */ mr r3, r20
/* 000082D8 D01E0A30 */ stfs f0, 0xa30(r30)
/* 000082DC C01D0004 */ lfs f0, 4(r29)
/* 000082E0 D01E0A34 */ stfs f0, 0xa34(r30)
/* 000082E4 4BFF7EC9 */ bl draw_naomi_sprite
/* 000082E8 881C0000 */ lbz r0, 0(r28)
/* 000082EC 7C1A0000 */ cmpw r26, r0
/* 000082F0 4082001C */ bne lbl_0000830C
/* 000082F4 386000FF */ li r3, 0xff
/* 000082F8 9861002C */ stb r3, 0x2c(r1)
/* 000082FC 38000000 */ li r0, 0
/* 00008300 9861002D */ stb r3, 0x2d(r1)
/* 00008304 9801002E */ stb r0, 0x2e(r1)
/* 00008308 48000018 */ b lbl_00008320
lbl_0000830C:
/* 0000830C 3860008F */ li r3, 0x8f
/* 00008310 9861002C */ stb r3, 0x2c(r1)
/* 00008314 38000000 */ li r0, 0
/* 00008318 9861002D */ stb r3, 0x2d(r1)
/* 0000831C 9801002E */ stb r0, 0x2e(r1)
lbl_00008320:
/* 00008320 C03D0000 */ lfs f1, 0(r29)
/* 00008324 7EA3AB78 */ mr r3, r21
/* 00008328 C01D0014 */ lfs f0, 0x14(r29)
/* 0000832C EC01002A */ fadds f0, f1, f0
/* 00008330 D0010024 */ stfs f0, 0x24(r1)
/* 00008334 C03D0004 */ lfs f1, 4(r29)
/* 00008338 C81F0048 */ lfd f0, 0x48(r31)
/* 0000833C FC010028 */ fsub f0, f1, f0
/* 00008340 FC000018 */ frsp f0, f0
/* 00008344 D0010028 */ stfs f0, 0x28(r1)
/* 00008348 809D0010 */ lwz r4, 0x10(r29)
/* 0000834C 4BFF7E61 */ bl strcpy
/* 00008350 4BFF7E5D */ bl reset_text_draw_settings
/* 00008354 88610021 */ lbz r3, 0x21(r1)
/* 00008358 4BFF7E55 */ bl set_text_font
/* 0000835C C0210060 */ lfs f1, 0x60(r1)
/* 00008360 C0410064 */ lfs f2, 0x64(r1)
/* 00008364 4BFF7E49 */ bl set_text_scale
/* 00008368 80610094 */ lwz r3, 0x94(r1)
/* 0000836C 4BFF7E41 */ bl func_80071B50
/* 00008370 C83F0028 */ lfd f1, 0x28(r31)
/* 00008374 C001006C */ lfs f0, 0x6c(r1)
/* 00008378 FC21002A */ fadd f1, f1, f0
/* 0000837C FC200818 */ frsp f1, f1
/* 00008380 4BFF7E2D */ bl func_80071B1C
/* 00008384 38600000 */ li r3, 0
/* 00008388 4BFF7E25 */ bl set_text_mul_color
/* 0000838C 88010091 */ lbz r0, 0x91(r1)
/* 00008390 88610090 */ lbz r3, 0x90(r1)
/* 00008394 5400402E */ slwi r0, r0, 8
/* 00008398 88810092 */ lbz r4, 0x92(r1)
/* 0000839C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000083A0 7C830378 */ or r3, r4, r0
/* 000083A4 4BFF7E09 */ bl set_text_add_color
/* 000083A8 C85F0030 */ lfd f2, 0x30(r31)
/* 000083AC C0210024 */ lfs f1, 0x24(r1)
/* 000083B0 C0010028 */ lfs f0, 0x28(r1)
/* 000083B4 FC22082A */ fadd f1, f2, f1
/* 000083B8 FC42002A */ fadd f2, f2, f0
/* 000083BC FC200818 */ frsp f1, f1
/* 000083C0 FC401018 */ frsp f2, f2
/* 000083C4 4BFF7DE9 */ bl set_text_pos
/* 000083C8 7EA3AB78 */ mr r3, r21
/* 000083CC 4BFF7DE1 */ bl u_draw_text
/* 000083D0 C021006C */ lfs f1, 0x6c(r1)
/* 000083D4 4BFF7DD9 */ bl func_80071B1C
/* 000083D8 8801002D */ lbz r0, 0x2d(r1)
/* 000083DC 8861002C */ lbz r3, 0x2c(r1)
/* 000083E0 5400402E */ slwi r0, r0, 8
/* 000083E4 8881002E */ lbz r4, 0x2e(r1)
/* 000083E8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000083EC 7C830378 */ or r3, r4, r0
/* 000083F0 4BFF7DBD */ bl set_text_mul_color
/* 000083F4 88010091 */ lbz r0, 0x91(r1)
/* 000083F8 88610090 */ lbz r3, 0x90(r1)
/* 000083FC 5400402E */ slwi r0, r0, 8
/* 00008400 88810092 */ lbz r4, 0x92(r1)
/* 00008404 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008408 7C830378 */ or r3, r4, r0
/* 0000840C 4BFF7DA1 */ bl set_text_add_color
/* 00008410 C0210024 */ lfs f1, 0x24(r1)
/* 00008414 C0410028 */ lfs f2, 0x28(r1)
/* 00008418 4BFF7D95 */ bl set_text_pos
/* 0000841C 7EA3AB78 */ mr r3, r21
/* 00008420 4BFF7D8D */ bl u_draw_text
/* 00008424 82FD0008 */ lwz r23, 8(r29)
/* 00008428 3AC00000 */ li r22, 0
/* 0000842C 480002C4 */ b lbl_000086F0
lbl_00008430:
/* 00008430 C83F0058 */ lfd f1, 0x58(r31)
/* 00008434 C0170008 */ lfs f0, 8(r23)
/* 00008438 C0570000 */ lfs f2, 0(r23)
/* 0000843C FC010032 */ fmul f0, f1, f0
/* 00008440 C87F01B0 */ lfd f3, 0x1b0(r31)
/* 00008444 C09D0000 */ lfs f4, 0(r29)
/* 00008448 FC02002A */ fadd f0, f2, f0
/* 0000844C FC000828 */ fsub f0, f0, f1
/* 00008450 FC030032 */ fmul f0, f3, f0
/* 00008454 FC04002A */ fadd f0, f4, f0
/* 00008458 FC000018 */ frsp f0, f0
/* 0000845C D01E0A80 */ stfs f0, 0xa80(r30)
/* 00008460 C83F0058 */ lfd f1, 0x58(r31)
/* 00008464 C017000C */ lfs f0, 0xc(r23)
/* 00008468 C0570004 */ lfs f2, 4(r23)
/* 0000846C FC010032 */ fmul f0, f1, f0
/* 00008470 C87F01B8 */ lfd f3, 0x1b8(r31)
/* 00008474 C09D0004 */ lfs f4, 4(r29)
/* 00008478 FC02002A */ fadd f0, f2, f0
/* 0000847C FC000828 */ fsub f0, f0, f1
/* 00008480 FC030032 */ fmul f0, f3, f0
/* 00008484 FC04002A */ fadd f0, f4, f0
/* 00008488 FC000018 */ frsp f0, f0
/* 0000848C D01E0A84 */ stfs f0, 0xa84(r30)
/* 00008490 C85F01B0 */ lfd f2, 0x1b0(r31)
/* 00008494 C0370008 */ lfs f1, 8(r23)
/* 00008498 C81F01C0 */ lfd f0, 0x1c0(r31)
/* 0000849C FC220072 */ fmul f1, f2, f1
/* 000084A0 FC010032 */ fmul f0, f1, f0
/* 000084A4 FC000018 */ frsp f0, f0
/* 000084A8 D01E0A8C */ stfs f0, 0xa8c(r30)
/* 000084AC C85F01B8 */ lfd f2, 0x1b8(r31)
/* 000084B0 C037000C */ lfs f1, 0xc(r23)
/* 000084B4 C81F01C0 */ lfd f0, 0x1c0(r31)
/* 000084B8 FC220072 */ fmul f1, f2, f1
/* 000084BC FC010032 */ fmul f0, f1, f0
/* 000084C0 FC000018 */ frsp f0, f0
/* 000084C4 D01E0A90 */ stfs f0, 0xa90(r30)
/* 000084C8 881C0000 */ lbz r0, 0(r28)
/* 000084CC 7C1A0000 */ cmpw r26, r0
/* 000084D0 40820010 */ bne lbl_000084E0
/* 000084D4 80170010 */ lwz r0, 0x10(r23)
/* 000084D8 901B0038 */ stw r0, 0x38(r27)
/* 000084DC 480000D0 */ b lbl_000085AC
lbl_000084E0:
/* 000084E0 80D70010 */ lwz r6, 0x10(r23)
/* 000084E4 3CA00000 */ lis r5, lbl_0000C4B0@ha
/* 000084E8 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 000084EC C8650000 */ lfd f3, lbl_0000C4B0@l(r5)
/* 000084F0 54C7463E */ srwi r7, r6, 0x18
/* 000084F4 54C0863E */ rlwinm r0, r6, 0x10, 0x18, 0x1f
/* 000084F8 90E1011C */ stw r7, 0x11c(r1)
/* 000084FC 54C4C63E */ rlwinm r4, r6, 0x18, 0x18, 0x1f
/* 00008500 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 00008504 9001010C */ stw r0, 0x10c(r1)
/* 00008508 54C6063E */ clrlwi r6, r6, 0x18
/* 0000850C C0BF0158 */ lfs f5, 0x158(r31)
/* 00008510 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 00008514 908100FC */ stw r4, 0xfc(r1)
/* 00008518 3C800000 */ lis r4, lbl_0000C4B0@ha
/* 0000851C 93210118 */ stw r25, 0x118(r1)
/* 00008520 93210108 */ stw r25, 0x108(r1)
/* 00008524 C8410118 */ lfd f2, 0x118(r1)
/* 00008528 90C100EC */ stw r6, 0xec(r1)
/* 0000852C EC421828 */ fsubs f2, f2, f3
/* 00008530 C8010108 */ lfd f0, 0x108(r1)
/* 00008534 932100F8 */ stw r25, 0xf8(r1)
/* 00008538 EC600828 */ fsubs f3, f0, f1
/* 0000853C C8240000 */ lfd f1, lbl_0000C4B0@l(r4)
/* 00008540 EC820172 */ fmuls f4, f2, f5
/* 00008544 C80100F8 */ lfd f0, 0xf8(r1)
/* 00008548 932100E8 */ stw r25, 0xe8(r1)
/* 0000854C EC400828 */ fsubs f2, f0, f1
/* 00008550 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 00008554 C80100E8 */ lfd f0, 0xe8(r1)
/* 00008558 FC80201E */ fctiwz f4, f4
/* 0000855C EC630172 */ fmuls f3, f3, f5
/* 00008560 EC000828 */ fsubs f0, f0, f1
/* 00008564 EC220172 */ fmuls f1, f2, f5
/* 00008568 D8810110 */ stfd f4, 0x110(r1)
/* 0000856C FC40181E */ fctiwz f2, f3
/* 00008570 EC000172 */ fmuls f0, f0, f5
/* 00008574 FC20081E */ fctiwz f1, f1
/* 00008578 D8410100 */ stfd f2, 0x100(r1)
/* 0000857C FC00001E */ fctiwz f0, f0
/* 00008580 80E10114 */ lwz r7, 0x114(r1)
/* 00008584 D82100F0 */ stfd f1, 0xf0(r1)
/* 00008588 80010104 */ lwz r0, 0x104(r1)
/* 0000858C D80100E0 */ stfd f0, 0xe0(r1)
/* 00008590 5400821E */ rlwinm r0, r0, 0x10, 8, 0xf
/* 00008594 808100F4 */ lwz r4, 0xf4(r1)
/* 00008598 50E0C00E */ rlwimi r0, r7, 0x18, 0, 7
/* 0000859C 80C100E4 */ lwz r6, 0xe4(r1)
/* 000085A0 5080442E */ rlwimi r0, r4, 8, 0x10, 0x17
/* 000085A4 50C0063E */ rlwimi r0, r6, 0, 0x18, 0x1f
/* 000085A8 901B0038 */ stw r0, 0x38(r27)
lbl_000085AC:
/* 000085AC 7F63DB78 */ mr r3, r27
/* 000085B0 4BFF7BFD */ bl draw_naomi_sprite
/* 000085B4 C03B0004 */ lfs f1, 4(r27)
/* 000085B8 7F03C378 */ mr r3, r24
/* 000085BC C0170018 */ lfs f0, 0x18(r23)
/* 000085C0 EC010028 */ fsubs f0, f1, f0
/* 000085C4 D0010024 */ stfs f0, 0x24(r1)
/* 000085C8 C03B0008 */ lfs f1, 8(r27)
/* 000085CC C81F0048 */ lfd f0, 0x48(r31)
/* 000085D0 FC010028 */ fsub f0, f1, f0
/* 000085D4 FC000018 */ frsp f0, f0
/* 000085D8 D0010028 */ stfs f0, 0x28(r1)
/* 000085DC 80970014 */ lwz r4, 0x14(r23)
/* 000085E0 4BFF7BCD */ bl strcpy
/* 000085E4 881C0000 */ lbz r0, 0(r28)
/* 000085E8 7C1A0000 */ cmpw r26, r0
/* 000085EC 40820018 */ bne lbl_00008604
/* 000085F0 380000FF */ li r0, 0xff
/* 000085F4 9801002C */ stb r0, 0x2c(r1)
/* 000085F8 9801002D */ stb r0, 0x2d(r1)
/* 000085FC 9801002E */ stb r0, 0x2e(r1)
/* 00008600 48000014 */ b lbl_00008614
lbl_00008604:
/* 00008604 3800008F */ li r0, 0x8f
/* 00008608 9801002C */ stb r0, 0x2c(r1)
/* 0000860C 9801002D */ stb r0, 0x2d(r1)
/* 00008610 9801002E */ stb r0, 0x2e(r1)
lbl_00008614:
/* 00008614 4BFF7B99 */ bl reset_text_draw_settings
/* 00008618 88610021 */ lbz r3, 0x21(r1)
/* 0000861C 4BFF7B91 */ bl set_text_font
/* 00008620 C0210060 */ lfs f1, 0x60(r1)
/* 00008624 C0410064 */ lfs f2, 0x64(r1)
/* 00008628 4BFF7B85 */ bl set_text_scale
/* 0000862C 80610094 */ lwz r3, 0x94(r1)
/* 00008630 4BFF7B7D */ bl func_80071B50
/* 00008634 C83F0028 */ lfd f1, 0x28(r31)
/* 00008638 C001006C */ lfs f0, 0x6c(r1)
/* 0000863C FC21002A */ fadd f1, f1, f0
/* 00008640 FC200818 */ frsp f1, f1
/* 00008644 4BFF7B69 */ bl func_80071B1C
/* 00008648 38600000 */ li r3, 0
/* 0000864C 4BFF7B61 */ bl set_text_mul_color
/* 00008650 88010091 */ lbz r0, 0x91(r1)
/* 00008654 88610090 */ lbz r3, 0x90(r1)
/* 00008658 5400402E */ slwi r0, r0, 8
/* 0000865C 88810092 */ lbz r4, 0x92(r1)
/* 00008660 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008664 7C830378 */ or r3, r4, r0
/* 00008668 4BFF7B45 */ bl set_text_add_color
/* 0000866C C85F0030 */ lfd f2, 0x30(r31)
/* 00008670 C0210024 */ lfs f1, 0x24(r1)
/* 00008674 C0010028 */ lfs f0, 0x28(r1)
/* 00008678 FC22082A */ fadd f1, f2, f1
/* 0000867C FC42002A */ fadd f2, f2, f0
/* 00008680 FC200818 */ frsp f1, f1
/* 00008684 FC401018 */ frsp f2, f2
/* 00008688 4BFF7B25 */ bl set_text_pos
/* 0000868C 7F03C378 */ mr r3, r24
/* 00008690 4BFF7B1D */ bl u_draw_text
/* 00008694 C021006C */ lfs f1, 0x6c(r1)
/* 00008698 4BFF7B15 */ bl func_80071B1C
/* 0000869C 8801002D */ lbz r0, 0x2d(r1)
/* 000086A0 8861002C */ lbz r3, 0x2c(r1)
/* 000086A4 5400402E */ slwi r0, r0, 8
/* 000086A8 8881002E */ lbz r4, 0x2e(r1)
/* 000086AC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000086B0 7C830378 */ or r3, r4, r0
/* 000086B4 4BFF7AF9 */ bl set_text_mul_color
/* 000086B8 88010091 */ lbz r0, 0x91(r1)
/* 000086BC 88610090 */ lbz r3, 0x90(r1)
/* 000086C0 5400402E */ slwi r0, r0, 8
/* 000086C4 88810092 */ lbz r4, 0x92(r1)
/* 000086C8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000086CC 7C830378 */ or r3, r4, r0
/* 000086D0 4BFF7ADD */ bl set_text_add_color
/* 000086D4 C0210024 */ lfs f1, 0x24(r1)
/* 000086D8 C0410028 */ lfs f2, 0x28(r1)
/* 000086DC 4BFF7AD1 */ bl set_text_pos
/* 000086E0 7F03C378 */ mr r3, r24
/* 000086E4 4BFF7AC9 */ bl u_draw_text
/* 000086E8 3AD60001 */ addi r22, r22, 1
/* 000086EC 3AF7001C */ addi r23, r23, 0x1c
lbl_000086F0:
/* 000086F0 801D000C */ lwz r0, 0xc(r29)
/* 000086F4 7C160000 */ cmpw r22, r0
/* 000086F8 4180FD38 */ blt lbl_00008430
/* 000086FC 3B5A0001 */ addi r26, r26, 1
/* 00008700 281A0004 */ cmplwi r26, 4
/* 00008704 3BBD0018 */ addi r29, r29, 0x18
/* 00008708 4180FBC8 */ blt lbl_000082D0
/* 0000870C 387E00F0 */ addi r3, r30, 0xf0
/* 00008710 4BFF7A9D */ bl draw_naomi_sprite
/* 00008714 380000B3 */ li r0, 0xb3
/* 00008718 98010021 */ stb r0, 0x21(r1)
/* 0000871C 38A000FF */ li r5, 0xff
/* 00008720 38000000 */ li r0, 0
/* 00008724 98A1002C */ stb r5, 0x2c(r1)
/* 00008728 38750000 */ addi r3, r21, 0
/* 0000872C 389E0D50 */ addi r4, r30, 0xd50
/* 00008730 98A1002D */ stb r5, 0x2d(r1)
/* 00008734 9801002E */ stb r0, 0x2e(r1)
/* 00008738 C01F01C8 */ lfs f0, 0x1c8(r31)
/* 0000873C D0010060 */ stfs f0, 0x60(r1)
/* 00008740 4BFF7A6D */ bl strcpy
/* 00008744 4BFF7A69 */ bl reset_text_draw_settings
/* 00008748 88610021 */ lbz r3, 0x21(r1)
/* 0000874C 4BFF7A61 */ bl set_text_font
/* 00008750 C0210060 */ lfs f1, 0x60(r1)
/* 00008754 C0410064 */ lfs f2, 0x64(r1)
/* 00008758 4BFF7A55 */ bl set_text_scale
/* 0000875C 80610094 */ lwz r3, 0x94(r1)
/* 00008760 4BFF7A4D */ bl func_80071B50
/* 00008764 C021006C */ lfs f1, 0x6c(r1)
/* 00008768 4BFF7A45 */ bl func_80071B1C
/* 0000876C 8801002D */ lbz r0, 0x2d(r1)
/* 00008770 8861002C */ lbz r3, 0x2c(r1)
/* 00008774 5400402E */ slwi r0, r0, 8
/* 00008778 8881002E */ lbz r4, 0x2e(r1)
/* 0000877C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008780 7C830378 */ or r3, r4, r0
/* 00008784 4BFF7A29 */ bl set_text_mul_color
/* 00008788 88010091 */ lbz r0, 0x91(r1)
/* 0000878C 88610090 */ lbz r3, 0x90(r1)
/* 00008790 5400402E */ slwi r0, r0, 8
/* 00008794 88810092 */ lbz r4, 0x92(r1)
/* 00008798 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000879C 7C830378 */ or r3, r4, r0
/* 000087A0 4BFF7A0D */ bl set_text_add_color
/* 000087A4 7EA3AB78 */ mr r3, r21
/* 000087A8 4BFF7A05 */ bl u_get_text_width
/* 000087AC C81F0058 */ lfd f0, 0x58(r31)
/* 000087B0 C85F00A8 */ lfd f2, 0xa8(r31)
/* 000087B4 FC000072 */ fmul f0, f0, f1
/* 000087B8 FC020028 */ fsub f0, f2, f0
/* 000087BC FC000018 */ frsp f0, f0
/* 000087C0 D0010024 */ stfs f0, 0x24(r1)
/* 000087C4 C01F0120 */ lfs f0, 0x120(r31)
/* 000087C8 D0010028 */ stfs f0, 0x28(r1)
/* 000087CC 4BFF79E1 */ bl reset_text_draw_settings
/* 000087D0 88610021 */ lbz r3, 0x21(r1)
/* 000087D4 4BFF79D9 */ bl set_text_font
/* 000087D8 C0210060 */ lfs f1, 0x60(r1)
/* 000087DC C0410064 */ lfs f2, 0x64(r1)
/* 000087E0 4BFF79CD */ bl set_text_scale
/* 000087E4 80610094 */ lwz r3, 0x94(r1)
/* 000087E8 4BFF79C5 */ bl func_80071B50
/* 000087EC C83F0028 */ lfd f1, 0x28(r31)
/* 000087F0 C001006C */ lfs f0, 0x6c(r1)
/* 000087F4 FC21002A */ fadd f1, f1, f0
/* 000087F8 FC200818 */ frsp f1, f1
/* 000087FC 4BFF79B1 */ bl func_80071B1C
/* 00008800 38600000 */ li r3, 0
/* 00008804 4BFF79A9 */ bl set_text_mul_color
/* 00008808 88010091 */ lbz r0, 0x91(r1)
/* 0000880C 88610090 */ lbz r3, 0x90(r1)
/* 00008810 5400402E */ slwi r0, r0, 8
/* 00008814 88810092 */ lbz r4, 0x92(r1)
/* 00008818 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000881C 7C830378 */ or r3, r4, r0
/* 00008820 4BFF798D */ bl set_text_add_color
/* 00008824 C85F0030 */ lfd f2, 0x30(r31)
/* 00008828 C0210024 */ lfs f1, 0x24(r1)
/* 0000882C C0010028 */ lfs f0, 0x28(r1)
/* 00008830 FC22082A */ fadd f1, f2, f1
/* 00008834 FC42002A */ fadd f2, f2, f0
/* 00008838 FC200818 */ frsp f1, f1
/* 0000883C FC401018 */ frsp f2, f2
/* 00008840 4BFF796D */ bl set_text_pos
/* 00008844 7EA3AB78 */ mr r3, r21
/* 00008848 4BFF7965 */ bl u_draw_text
/* 0000884C C021006C */ lfs f1, 0x6c(r1)
/* 00008850 4BFF795D */ bl func_80071B1C
/* 00008854 8801002D */ lbz r0, 0x2d(r1)
/* 00008858 8861002C */ lbz r3, 0x2c(r1)
/* 0000885C 5400402E */ slwi r0, r0, 8
/* 00008860 8881002E */ lbz r4, 0x2e(r1)
/* 00008864 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008868 7C830378 */ or r3, r4, r0
/* 0000886C 4BFF7941 */ bl set_text_mul_color
/* 00008870 88010091 */ lbz r0, 0x91(r1)
/* 00008874 88610090 */ lbz r3, 0x90(r1)
/* 00008878 5400402E */ slwi r0, r0, 8
/* 0000887C 88810092 */ lbz r4, 0x92(r1)
/* 00008880 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008884 7C830378 */ or r3, r4, r0
/* 00008888 4BFF7925 */ bl set_text_add_color
/* 0000888C C0210024 */ lfs f1, 0x24(r1)
/* 00008890 C0410028 */ lfs f2, 0x28(r1)
/* 00008894 4BFF7919 */ bl set_text_pos
/* 00008898 7EA3AB78 */ mr r3, r21
/* 0000889C 4BFF7911 */ bl u_draw_text
/* 000088A0 38750000 */ addi r3, r21, 0
/* 000088A4 389E0D80 */ addi r4, r30, 0xd80
/* 000088A8 4BFF7905 */ bl strcpy
/* 000088AC 4BFF7901 */ bl reset_text_draw_settings
/* 000088B0 88610021 */ lbz r3, 0x21(r1)
/* 000088B4 4BFF78F9 */ bl set_text_font
/* 000088B8 C0210060 */ lfs f1, 0x60(r1)
/* 000088BC C0410064 */ lfs f2, 0x64(r1)
/* 000088C0 4BFF78ED */ bl set_text_scale
/* 000088C4 80610094 */ lwz r3, 0x94(r1)
/* 000088C8 4BFF78E5 */ bl func_80071B50
/* 000088CC C021006C */ lfs f1, 0x6c(r1)
/* 000088D0 4BFF78DD */ bl func_80071B1C
/* 000088D4 8801002D */ lbz r0, 0x2d(r1)
/* 000088D8 8861002C */ lbz r3, 0x2c(r1)
/* 000088DC 5400402E */ slwi r0, r0, 8
/* 000088E0 8881002E */ lbz r4, 0x2e(r1)
/* 000088E4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000088E8 7C830378 */ or r3, r4, r0
/* 000088EC 4BFF78C1 */ bl set_text_mul_color
/* 000088F0 88010091 */ lbz r0, 0x91(r1)
/* 000088F4 88610090 */ lbz r3, 0x90(r1)
/* 000088F8 5400402E */ slwi r0, r0, 8
/* 000088FC 88810092 */ lbz r4, 0x92(r1)
/* 00008900 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008904 7C830378 */ or r3, r4, r0
/* 00008908 4BFF78A5 */ bl set_text_add_color
/* 0000890C 7EA3AB78 */ mr r3, r21
/* 00008910 4BFF789D */ bl u_get_text_width
/* 00008914 C81F0058 */ lfd f0, 0x58(r31)
/* 00008918 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000891C FC000072 */ fmul f0, f0, f1
/* 00008920 FC020028 */ fsub f0, f2, f0
/* 00008924 FC000018 */ frsp f0, f0
/* 00008928 D0010024 */ stfs f0, 0x24(r1)
/* 0000892C C01F01CC */ lfs f0, 0x1cc(r31)
/* 00008930 D0010028 */ stfs f0, 0x28(r1)
/* 00008934 4BFF7879 */ bl reset_text_draw_settings
/* 00008938 88610021 */ lbz r3, 0x21(r1)
/* 0000893C 4BFF7871 */ bl set_text_font
/* 00008940 C0210060 */ lfs f1, 0x60(r1)
/* 00008944 C0410064 */ lfs f2, 0x64(r1)
/* 00008948 4BFF7865 */ bl set_text_scale
/* 0000894C 80610094 */ lwz r3, 0x94(r1)
/* 00008950 4BFF785D */ bl func_80071B50
/* 00008954 C83F0028 */ lfd f1, 0x28(r31)
/* 00008958 C001006C */ lfs f0, 0x6c(r1)
/* 0000895C FC21002A */ fadd f1, f1, f0
/* 00008960 FC200818 */ frsp f1, f1
/* 00008964 4BFF7849 */ bl func_80071B1C
/* 00008968 38600000 */ li r3, 0
/* 0000896C 4BFF7841 */ bl set_text_mul_color
/* 00008970 88010091 */ lbz r0, 0x91(r1)
/* 00008974 88610090 */ lbz r3, 0x90(r1)
/* 00008978 5400402E */ slwi r0, r0, 8
/* 0000897C 88810092 */ lbz r4, 0x92(r1)
/* 00008980 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008984 7C830378 */ or r3, r4, r0
/* 00008988 4BFF7825 */ bl set_text_add_color
/* 0000898C C85F0030 */ lfd f2, 0x30(r31)
/* 00008990 C0210024 */ lfs f1, 0x24(r1)
/* 00008994 C0010028 */ lfs f0, 0x28(r1)
/* 00008998 FC22082A */ fadd f1, f2, f1
/* 0000899C FC42002A */ fadd f2, f2, f0
/* 000089A0 FC200818 */ frsp f1, f1
/* 000089A4 FC401018 */ frsp f2, f2
/* 000089A8 4BFF7805 */ bl set_text_pos
/* 000089AC 7EA3AB78 */ mr r3, r21
/* 000089B0 4BFF77FD */ bl u_draw_text
/* 000089B4 C021006C */ lfs f1, 0x6c(r1)
/* 000089B8 4BFF77F5 */ bl func_80071B1C
/* 000089BC 8801002D */ lbz r0, 0x2d(r1)
/* 000089C0 8861002C */ lbz r3, 0x2c(r1)
/* 000089C4 5400402E */ slwi r0, r0, 8
/* 000089C8 8881002E */ lbz r4, 0x2e(r1)
/* 000089CC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000089D0 7C830378 */ or r3, r4, r0
/* 000089D4 4BFF77D9 */ bl set_text_mul_color
/* 000089D8 88010091 */ lbz r0, 0x91(r1)
/* 000089DC 88610090 */ lbz r3, 0x90(r1)
/* 000089E0 5400402E */ slwi r0, r0, 8
/* 000089E4 88810092 */ lbz r4, 0x92(r1)
/* 000089E8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000089EC 7C830378 */ or r3, r4, r0
/* 000089F0 4BFF77BD */ bl set_text_add_color
/* 000089F4 C0210024 */ lfs f1, 0x24(r1)
/* 000089F8 C0410028 */ lfs f2, 0x28(r1)
/* 000089FC 4BFF77B1 */ bl set_text_pos
/* 00008A00 7EA3AB78 */ mr r3, r21
/* 00008A04 4BFF77A9 */ bl u_draw_text
/* 00008A08 4BFF77A5 */ bl mathutil_mtxA_from_identity
/* 00008A0C 3C600000 */ lis r3, mathutilData@ha
/* 00008A10 38630000 */ addi r3, r3, mathutilData@l
/* 00008A14 80630000 */ lwz r3, 0(r3)
/* 00008A18 38800000 */ li r4, 0
/* 00008A1C 4BFF7791 */ bl GXLoadPosMtxImm
/* 00008A20 BA810120 */ lmw r20, 0x120(r1)
/* 00008A24 80010154 */ lwz r0, 0x154(r1)
/* 00008A28 38210150 */ addi r1, r1, 0x150
/* 00008A2C 7C0803A6 */ mtlr r0
/* 00008A30 4E800020 */ blr 
lbl_00008A34:
/* 00008A34 7C0802A6 */ mflr r0
/* 00008A38 3860005D */ li r3, 0x5d
/* 00008A3C 90010004 */ stw r0, 4(r1)
/* 00008A40 9421FFF8 */ stwu r1, -8(r1)
/* 00008A44 4BFF7769 */ bl find_sprite_with_tag
/* 00008A48 28030000 */ cmplwi r3, 0
/* 00008A4C 41820018 */ beq lbl_00008A64
/* 00008A50 3C600000 */ lis r3, lbl_10000000@ha
/* 00008A54 38630000 */ addi r3, r3, lbl_10000000@l
/* 00008A58 38000004 */ li r0, 4
/* 00008A5C 980300DC */ stb r0, 0xdc(r3)
/* 00008A60 4800007C */ b lbl_00008ADC
lbl_00008A64:
/* 00008A64 3860005D */ li r3, 0x5d
/* 00008A68 4BFFB505 */ bl lbl_00003F6C
/* 00008A6C 28030000 */ cmplwi r3, 0
/* 00008A70 41820030 */ beq lbl_00008AA0
/* 00008A74 38000004 */ li r0, 4
/* 00008A78 98030000 */ stb r0, 0(r3)
/* 00008A7C 3800001E */ li r0, 0x1e
/* 00008A80 3C800000 */ lis r4, lbl_0000C394@ha
/* 00008A84 98030001 */ stb r0, 1(r3)
/* 00008A88 38A40000 */ addi r5, r4, lbl_0000C394@l
/* 00008A8C 3C800000 */ lis r4, lbl_0000C370@ha
/* 00008A90 C0050000 */ lfs f0, 0(r5)
/* 00008A94 D0030004 */ stfs f0, 4(r3)
/* 00008A98 C0040000 */ lfs f0, lbl_0000C370@l(r4)
/* 00008A9C D0030008 */ stfs f0, 8(r3)
lbl_00008AA0:
/* 00008AA0 4BFF770D */ bl create_sprite
/* 00008AA4 28030000 */ cmplwi r3, 0
/* 00008AA8 41820034 */ beq lbl_00008ADC
/* 00008AAC 3800005D */ li r0, 0x5d
/* 00008AB0 3C800000 */ lis r4, lbl_00008048@ha
/* 00008AB4 9803000F */ stb r0, 0xf(r3)
/* 00008AB8 38040000 */ addi r0, r4, lbl_00008048@l
/* 00008ABC 3C800000 */ lis r4, lbl_00008068@ha
/* 00008AC0 90030034 */ stw r0, 0x34(r3)
/* 00008AC4 38040000 */ addi r0, r4, lbl_00008068@l
/* 00008AC8 3C800000 */ lis r4, lbl_0000D310@ha
/* 00008ACC 90030038 */ stw r0, 0x38(r3)
/* 00008AD0 38840000 */ addi r4, r4, lbl_0000D310@l
/* 00008AD4 3863008C */ addi r3, r3, 0x8c
/* 00008AD8 4BFF76D5 */ bl strcpy
lbl_00008ADC:
/* 00008ADC 8001000C */ lwz r0, 0xc(r1)
/* 00008AE0 38210008 */ addi r1, r1, 8
/* 00008AE4 7C0803A6 */ mtlr r0
/* 00008AE8 4E800020 */ blr 
lbl_00008AEC:
/* 00008AEC 7C0802A6 */ mflr r0
/* 00008AF0 3CA00000 */ lis r5, lbl_0000C370@ha
/* 00008AF4 90010004 */ stw r0, 4(r1)
/* 00008AF8 9421FFE8 */ stwu r1, -0x18(r1)
/* 00008AFC 93E10014 */ stw r31, 0x14(r1)
/* 00008B00 3BE50000 */ addi r31, r5, lbl_0000C370@l
/* 00008B04 93C10010 */ stw r30, 0x10(r1)
/* 00008B08 83C4002C */ lwz r30, 0x2c(r4)
/* 00008B0C 4BFFB4E5 */ bl lbl_00003FF0
/* 00008B10 801E0014 */ lwz r0, 0x14(r30)
/* 00008B14 38A00000 */ li r5, 0
/* 00008B18 3C600000 */ lis r3, lbl_10000000@ha
/* 00008B1C C01F00A4 */ lfs f0, 0xa4(r31)
/* 00008B20 7C050000 */ cmpw r5, r0
/* 00008B24 C07F01D0 */ lfs f3, 0x1d0(r31)
/* 00008B28 38630000 */ addi r3, r3, lbl_10000000@l
/* 00008B2C 4082000C */ bne lbl_00008B38
/* 00008B30 C01F01D4 */ lfs f0, 0x1d4(r31)
/* 00008B34 C07F0000 */ lfs f3, 0(r31)
lbl_00008B38:
/* 00008B38 C0430020 */ lfs f2, 0x20(r3)
/* 00008B3C 38A00001 */ li r5, 1
/* 00008B40 C83F0028 */ lfd f1, 0x28(r31)
/* 00008B44 38830004 */ addi r4, r3, 4
/* 00008B48 EC001028 */ fsubs f0, f0, f2
/* 00008B4C FC010032 */ fmul f0, f1, f0
/* 00008B50 FC02002A */ fadd f0, f2, f0
/* 00008B54 FC000018 */ frsp f0, f0
/* 00008B58 D0030020 */ stfs f0, 0x20(r3)
/* 00008B5C C043002C */ lfs f2, 0x2c(r3)
/* 00008B60 C83F0028 */ lfd f1, 0x28(r31)
/* 00008B64 EC031028 */ fsubs f0, f3, f2
/* 00008B68 FC010032 */ fmul f0, f1, f0
/* 00008B6C FC02002A */ fadd f0, f2, f0
/* 00008B70 FC000018 */ frsp f0, f0
/* 00008B74 D003002C */ stfs f0, 0x2c(r3)
/* 00008B78 801E0014 */ lwz r0, 0x14(r30)
/* 00008B7C C01F00A4 */ lfs f0, 0xa4(r31)
/* 00008B80 7C050000 */ cmpw r5, r0
/* 00008B84 C07F01D0 */ lfs f3, 0x1d0(r31)
/* 00008B88 4082000C */ bne lbl_00008B94
/* 00008B8C C01F01D4 */ lfs f0, 0x1d4(r31)
/* 00008B90 C07F0000 */ lfs f3, 0(r31)
lbl_00008B94:
/* 00008B94 C0440020 */ lfs f2, 0x20(r4)
/* 00008B98 38A00002 */ li r5, 2
/* 00008B9C C83F0028 */ lfd f1, 0x28(r31)
/* 00008BA0 EC001028 */ fsubs f0, f0, f2
/* 00008BA4 FC010032 */ fmul f0, f1, f0
/* 00008BA8 FC02002A */ fadd f0, f2, f0
/* 00008BAC FC000018 */ frsp f0, f0
/* 00008BB0 D0040020 */ stfs f0, 0x20(r4)
/* 00008BB4 C044002C */ lfs f2, 0x2c(r4)
/* 00008BB8 C83F0028 */ lfd f1, 0x28(r31)
/* 00008BBC EC031028 */ fsubs f0, f3, f2
/* 00008BC0 FC010032 */ fmul f0, f1, f0
/* 00008BC4 FC02002A */ fadd f0, f2, f0
/* 00008BC8 FC000018 */ frsp f0, f0
/* 00008BCC D004002C */ stfs f0, 0x2c(r4)
/* 00008BD0 38840004 */ addi r4, r4, 4
/* 00008BD4 801E0014 */ lwz r0, 0x14(r30)
/* 00008BD8 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00008BDC 7C050000 */ cmpw r5, r0
/* 00008BE0 C07F01D0 */ lfs f3, 0x1d0(r31)
/* 00008BE4 4082000C */ bne lbl_00008BF0
/* 00008BE8 C01F01D4 */ lfs f0, 0x1d4(r31)
/* 00008BEC C07F0000 */ lfs f3, 0(r31)
lbl_00008BF0:
/* 00008BF0 C0440020 */ lfs f2, 0x20(r4)
/* 00008BF4 C83F0028 */ lfd f1, 0x28(r31)
/* 00008BF8 EC001028 */ fsubs f0, f0, f2
/* 00008BFC FC010032 */ fmul f0, f1, f0
/* 00008C00 FC02002A */ fadd f0, f2, f0
/* 00008C04 FC000018 */ frsp f0, f0
/* 00008C08 D0040020 */ stfs f0, 0x20(r4)
/* 00008C0C C044002C */ lfs f2, 0x2c(r4)
/* 00008C10 C83F0028 */ lfd f1, 0x28(r31)
/* 00008C14 EC031028 */ fsubs f0, f3, f2
/* 00008C18 FC010032 */ fmul f0, f1, f0
/* 00008C1C FC02002A */ fadd f0, f2, f0
/* 00008C20 FC000018 */ frsp f0, f0
/* 00008C24 D004002C */ stfs f0, 0x2c(r4)
/* 00008C28 8001001C */ lwz r0, 0x1c(r1)
/* 00008C2C 83E10014 */ lwz r31, 0x14(r1)
/* 00008C30 83C10010 */ lwz r30, 0x10(r1)
/* 00008C34 7C0803A6 */ mtlr r0
/* 00008C38 38210018 */ addi r1, r1, 0x18
/* 00008C3C 4E800020 */ blr 
lbl_00008C40:
/* 00008C40 7C0802A6 */ mflr r0
/* 00008C44 7C651B78 */ mr r5, r3
/* 00008C48 90010004 */ stw r0, 4(r1)
/* 00008C4C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00008C50 9421FEE0 */ stwu r1, -0x120(r1)
/* 00008C54 BE0100E0 */ stmw r16, 0xe0(r1)
/* 00008C58 3BC40000 */ addi r30, r4, lbl_0000C8F0@l
/* 00008C5C 3C800000 */ lis r4, lbl_0000C370@ha
/* 00008C60 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00008C64 8863000F */ lbz r3, 0xf(r3)
/* 00008C68 8365002C */ lwz r27, 0x2c(r5)
/* 00008C6C 7C630774 */ extsb r3, r3
/* 00008C70 4BFFB2FD */ bl lbl_00003F6C
/* 00008C74 28030000 */ cmplwi r3, 0
/* 00008C78 41820040 */ beq lbl_00008CB8
/* 00008C7C C05F0000 */ lfs f2, 0(r31)
/* 00008C80 C0230004 */ lfs f1, 4(r3)
/* 00008C84 C0030008 */ lfs f0, 8(r3)
/* 00008C88 FC601090 */ fmr f3, f2
/* 00008C8C EC21002A */ fadds f1, f1, f0
/* 00008C90 4BFF751D */ bl mathutil_mtxA_from_translate_xyz
/* 00008C94 3C600000 */ lis r3, lbl_10000000@ha
/* 00008C98 38630000 */ addi r3, r3, lbl_10000000@l
/* 00008C9C 38630184 */ addi r3, r3, 0x184
/* 00008CA0 4BFF750D */ bl mathutil_mtxA_to_mtx
/* 00008CA4 3C600000 */ lis r3, mathutilData@ha
/* 00008CA8 38630000 */ addi r3, r3, mathutilData@l
/* 00008CAC 80630000 */ lwz r3, 0(r3)
/* 00008CB0 38800000 */ li r4, 0
/* 00008CB4 4BFF74F9 */ bl GXLoadPosMtxImm
lbl_00008CB8:
/* 00008CB8 7FC3F378 */ mr r3, r30
/* 00008CBC 4BFF74F1 */ bl draw_naomi_sprite
/* 00008CC0 C01F0088 */ lfs f0, 0x88(r31)
/* 00008CC4 3BA100A0 */ addi r29, r1, 0xa0
/* 00008CC8 388000B3 */ li r4, 0xb3
/* 00008CCC D0010060 */ stfs f0, 0x60(r1)
/* 00008CD0 3A000000 */ li r16, 0
/* 00008CD4 3C000020 */ lis r0, 0x20
/* 00008CD8 C01F0060 */ lfs f0, 0x60(r31)
/* 00008CDC 7FA3EB78 */ mr r3, r29
/* 00008CE0 D0010054 */ stfs f0, 0x54(r1)
/* 00008CE4 C01F0060 */ lfs f0, 0x60(r31)
/* 00008CE8 D0010058 */ stfs f0, 0x58(r1)
/* 00008CEC 98810015 */ stb r4, 0x15(r1)
/* 00008CF0 389E104C */ addi r4, r30, 0x104c
/* 00008CF4 9A010084 */ stb r16, 0x84(r1)
/* 00008CF8 9A010085 */ stb r16, 0x85(r1)
/* 00008CFC 9A010086 */ stb r16, 0x86(r1)
/* 00008D00 90010088 */ stw r0, 0x88(r1)
/* 00008D04 4BFF74A9 */ bl strcpy
/* 00008D08 4BFF74A5 */ bl reset_text_draw_settings
/* 00008D0C 88610015 */ lbz r3, 0x15(r1)
/* 00008D10 4BFF749D */ bl set_text_font
/* 00008D14 C0210054 */ lfs f1, 0x54(r1)
/* 00008D18 C0410058 */ lfs f2, 0x58(r1)
/* 00008D1C 4BFF7491 */ bl set_text_scale
/* 00008D20 80610088 */ lwz r3, 0x88(r1)
/* 00008D24 4BFF7489 */ bl func_80071B50
/* 00008D28 C0210060 */ lfs f1, 0x60(r1)
/* 00008D2C 4BFF7481 */ bl func_80071B1C
/* 00008D30 88010021 */ lbz r0, 0x21(r1)
/* 00008D34 88610020 */ lbz r3, 0x20(r1)
/* 00008D38 5400402E */ slwi r0, r0, 8
/* 00008D3C 88810022 */ lbz r4, 0x22(r1)
/* 00008D40 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008D44 7C830378 */ or r3, r4, r0
/* 00008D48 4BFF7465 */ bl set_text_mul_color
/* 00008D4C 88010085 */ lbz r0, 0x85(r1)
/* 00008D50 88610084 */ lbz r3, 0x84(r1)
/* 00008D54 5400402E */ slwi r0, r0, 8
/* 00008D58 88810086 */ lbz r4, 0x86(r1)
/* 00008D5C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008D60 7C830378 */ or r3, r4, r0
/* 00008D64 4BFF7449 */ bl set_text_add_color
/* 00008D68 7FA3EB78 */ mr r3, r29
/* 00008D6C 4BFF7441 */ bl u_get_text_width
/* 00008D70 C81F0058 */ lfd f0, 0x58(r31)
/* 00008D74 380000FF */ li r0, 0xff
/* 00008D78 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00008D7C FC000072 */ fmul f0, f0, f1
/* 00008D80 FC020028 */ fsub f0, f2, f0
/* 00008D84 FC000018 */ frsp f0, f0
/* 00008D88 D0010018 */ stfs f0, 0x18(r1)
/* 00008D8C C01F0090 */ lfs f0, 0x90(r31)
/* 00008D90 D001001C */ stfs f0, 0x1c(r1)
/* 00008D94 98010020 */ stb r0, 0x20(r1)
/* 00008D98 98010021 */ stb r0, 0x21(r1)
/* 00008D9C 9A010022 */ stb r16, 0x22(r1)
/* 00008DA0 4BFF740D */ bl reset_text_draw_settings
/* 00008DA4 88610015 */ lbz r3, 0x15(r1)
/* 00008DA8 4BFF7405 */ bl set_text_font
/* 00008DAC C0210054 */ lfs f1, 0x54(r1)
/* 00008DB0 C0410058 */ lfs f2, 0x58(r1)
/* 00008DB4 4BFF73F9 */ bl set_text_scale
/* 00008DB8 80610088 */ lwz r3, 0x88(r1)
/* 00008DBC 4BFF73F1 */ bl func_80071B50
/* 00008DC0 C83F0028 */ lfd f1, 0x28(r31)
/* 00008DC4 C0010060 */ lfs f0, 0x60(r1)
/* 00008DC8 FC21002A */ fadd f1, f1, f0
/* 00008DCC FC200818 */ frsp f1, f1
/* 00008DD0 4BFF73DD */ bl func_80071B1C
/* 00008DD4 38600000 */ li r3, 0
/* 00008DD8 4BFF73D5 */ bl set_text_mul_color
/* 00008DDC 88010085 */ lbz r0, 0x85(r1)
/* 00008DE0 88610084 */ lbz r3, 0x84(r1)
/* 00008DE4 5400402E */ slwi r0, r0, 8
/* 00008DE8 88810086 */ lbz r4, 0x86(r1)
/* 00008DEC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008DF0 7C830378 */ or r3, r4, r0
/* 00008DF4 4BFF73B9 */ bl set_text_add_color
/* 00008DF8 C85F0030 */ lfd f2, 0x30(r31)
/* 00008DFC C0210018 */ lfs f1, 0x18(r1)
/* 00008E00 C001001C */ lfs f0, 0x1c(r1)
/* 00008E04 FC22082A */ fadd f1, f2, f1
/* 00008E08 FC42002A */ fadd f2, f2, f0
/* 00008E0C FC200818 */ frsp f1, f1
/* 00008E10 FC401018 */ frsp f2, f2
/* 00008E14 4BFF7399 */ bl set_text_pos
/* 00008E18 7FA3EB78 */ mr r3, r29
/* 00008E1C 4BFF7391 */ bl u_draw_text
/* 00008E20 C0210060 */ lfs f1, 0x60(r1)
/* 00008E24 4BFF7389 */ bl func_80071B1C
/* 00008E28 88010021 */ lbz r0, 0x21(r1)
/* 00008E2C 88610020 */ lbz r3, 0x20(r1)
/* 00008E30 5400402E */ slwi r0, r0, 8
/* 00008E34 88810022 */ lbz r4, 0x22(r1)
/* 00008E38 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008E3C 7C830378 */ or r3, r4, r0
/* 00008E40 4BFF736D */ bl set_text_mul_color
/* 00008E44 88010085 */ lbz r0, 0x85(r1)
/* 00008E48 88610084 */ lbz r3, 0x84(r1)
/* 00008E4C 5400402E */ slwi r0, r0, 8
/* 00008E50 88810086 */ lbz r4, 0x86(r1)
/* 00008E54 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008E58 7C830378 */ or r3, r4, r0
/* 00008E5C 4BFF7351 */ bl set_text_add_color
/* 00008E60 C0210018 */ lfs f1, 0x18(r1)
/* 00008E64 C041001C */ lfs f2, 0x1c(r1)
/* 00008E68 4BFF7345 */ bl set_text_pos
/* 00008E6C 7FA3EB78 */ mr r3, r29
/* 00008E70 4BFF733D */ bl u_draw_text
/* 00008E74 3B400000 */ li r26, 0
/* 00008E78 3C600000 */ lis r3, lbl_10000000@ha
/* 00008E7C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00008E80 5740103A */ slwi r0, r26, 2
/* 00008E84 3C800000 */ lis r4, mathutilData@ha
/* 00008E88 3EE0FF90 */ lis r23, 0xff90
/* 00008E8C 7E630214 */ add r19, r3, r0
/* 00008E90 3A230184 */ addi r17, r3, 0x184
/* 00008E94 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00008E98 3A5E0E94 */ addi r18, r30, 0xe94
/* 00008E9C 3AA40000 */ addi r21, r4, mathutilData@l
/* 00008EA0 3B9E0634 */ addi r28, r30, 0x634
/* 00008EA4 3AD78F8F */ addi r22, r23, -28785  ;# fixed addi
/* 00008EA8 3A030000 */ addi r16, r3, unpausedFrameCounter@l
/* 00008EAC 3E804330 */ lis r20, 0x4330
lbl_00008EB0:
/* 00008EB0 7E238B78 */ mr r3, r17
/* 00008EB4 4BFF72F9 */ bl mathutil_mtxA_from_mtx
/* 00008EB8 381AFFFF */ addi r0, r26, -1  ;# fixed addi
/* 00008EBC C83F01E0 */ lfd f1, 0x1e0(r31)
/* 00008EC0 6C008000 */ xoris r0, r0, 0x8000
/* 00008EC4 C013002C */ lfs f0, 0x2c(r19)
/* 00008EC8 900100DC */ stw r0, 0xdc(r1)
/* 00008ECC 3C600000 */ lis r3, lbl_0000C380@ha
/* 00008ED0 FC41002A */ fadd f2, f1, f0
/* 00008ED4 C8A30000 */ lfd f5, lbl_0000C380@l(r3)
/* 00008ED8 928100D8 */ stw r20, 0xd8(r1)
/* 00008EDC C8DF01D8 */ lfd f6, 0x1d8(r31)
/* 00008EE0 C88100D8 */ lfd f4, 0xd8(r1)
/* 00008EE4 C8FF00A8 */ lfd f7, 0xa8(r31)
/* 00008EE8 FC401018 */ frsp f2, f2
/* 00008EEC FC042828 */ fsub f0, f4, f5
/* 00008EF0 C07F0000 */ lfs f3, 0(r31)
/* 00008EF4 FC060032 */ fmul f0, f6, f0
/* 00008EF8 FC27002A */ fadd f1, f7, f0
/* 00008EFC FC200818 */ frsp f1, f1
/* 00008F00 4BFF72AD */ bl mathutil_mtxA_translate_xyz
/* 00008F04 C0330020 */ lfs f1, 0x20(r19)
/* 00008F08 4BFF72A5 */ bl mathutil_mtxA_scale_s
/* 00008F0C 80750000 */ lwz r3, 0(r21)
/* 00008F10 38800000 */ li r4, 0
/* 00008F14 4BFF7299 */ bl GXLoadPosMtxImm
/* 00008F18 C01F0000 */ lfs f0, 0(r31)
/* 00008F1C D01E0638 */ stfs f0, 0x638(r30)
/* 00008F20 C01F0000 */ lfs f0, 0(r31)
/* 00008F24 D01E063C */ stfs f0, 0x63c(r30)
/* 00008F28 801B0014 */ lwz r0, 0x14(r27)
/* 00008F2C 7C1A0000 */ cmpw r26, r0
/* 00008F30 40820010 */ bne lbl_00008F40
/* 00008F34 3800FFFF */ li r0, -1
/* 00008F38 901C0038 */ stw r0, 0x38(r28)
/* 00008F3C 48000008 */ b lbl_00008F44
lbl_00008F40:
/* 00008F40 92DC0038 */ stw r22, 0x38(r28)
lbl_00008F44:
/* 00008F44 7F83E378 */ mr r3, r28
/* 00008F48 4BFF7265 */ bl draw_naomi_sprite
/* 00008F4C 801B0014 */ lwz r0, 0x14(r27)
/* 00008F50 7C1A0000 */ cmpw r26, r0
/* 00008F54 40820038 */ bne lbl_00008F8C
/* 00008F58 80100000 */ lwz r0, 0(r16)
/* 00008F5C 3B20FFFF */ li r25, -1
/* 00008F60 5403482C */ slwi r3, r0, 9
/* 00008F64 4BFF7249 */ bl mathutil_sin
/* 00008F68 FC200A10 */ fabs f1, f1
/* 00008F6C C81F01E8 */ lfd f0, 0x1e8(r31)
/* 00008F70 FC200072 */ fmul f1, f0, f1
/* 00008F74 4BFF7239 */ bl __cvt_fp2unsigned
/* 00008F78 5464801E */ slwi r4, r3, 0x10
/* 00008F7C 5460402E */ slwi r0, r3, 8
/* 00008F80 7C800378 */ or r0, r4, r0
/* 00008F84 7C780378 */ or r24, r3, r0
/* 00008F88 4800000C */ b lbl_00008F94
lbl_00008F8C:
/* 00008F8C 3B378F8F */ addi r25, r23, -28785  ;# fixed addi
/* 00008F90 3B000000 */ li r24, 0
lbl_00008F94:
/* 00008F94 80720000 */ lwz r3, 0(r18)
/* 00008F98 C01F0000 */ lfs f0, 0(r31)
/* 00008F9C D0030004 */ stfs f0, 4(r3)
/* 00008FA0 C01F0188 */ lfs f0, 0x188(r31)
/* 00008FA4 D0030008 */ stfs f0, 8(r3)
/* 00008FA8 93230038 */ stw r25, 0x38(r3)
/* 00008FAC 9303003C */ stw r24, 0x3c(r3)
/* 00008FB0 4BFF71FD */ bl draw_naomi_sprite
/* 00008FB4 2C1A0000 */ cmpwi r26, 0
/* 00008FB8 4082000C */ bne lbl_00008FC4
/* 00008FBC 387E0EF0 */ addi r3, r30, 0xef0
/* 00008FC0 48000008 */ b lbl_00008FC8
lbl_00008FC4:
/* 00008FC4 387E0EA0 */ addi r3, r30, 0xea0
lbl_00008FC8:
/* 00008FC8 C01F0000 */ lfs f0, 0(r31)
/* 00008FCC D0030004 */ stfs f0, 4(r3)
/* 00008FD0 C01F018C */ lfs f0, 0x18c(r31)
/* 00008FD4 D0030008 */ stfs f0, 8(r3)
/* 00008FD8 93230038 */ stw r25, 0x38(r3)
/* 00008FDC 9303003C */ stw r24, 0x3c(r3)
/* 00008FE0 4BFF71CD */ bl draw_naomi_sprite
/* 00008FE4 3B5A0001 */ addi r26, r26, 1
/* 00008FE8 2C1A0003 */ cmpwi r26, 3
/* 00008FEC 3A730004 */ addi r19, r19, 4
/* 00008FF0 3A520004 */ addi r18, r18, 4
/* 00008FF4 4180FEBC */ blt lbl_00008EB0
/* 00008FF8 7E238B78 */ mr r3, r17
/* 00008FFC 4BFF71B1 */ bl mathutil_mtxA_from_mtx
/* 00009000 3C600000 */ lis r3, mathutilData@ha
/* 00009004 38630000 */ addi r3, r3, mathutilData@l
/* 00009008 80630000 */ lwz r3, 0(r3)
/* 0000900C 38800000 */ li r4, 0
/* 00009010 4BFF719D */ bl GXLoadPosMtxImm
/* 00009014 387E00F0 */ addi r3, r30, 0xf0
/* 00009018 4BFF7195 */ bl draw_naomi_sprite
/* 0000901C 380000FF */ li r0, 0xff
/* 00009020 98010020 */ stb r0, 0x20(r1)
/* 00009024 3A400000 */ li r18, 0
/* 00009028 56511838 */ slwi r17, r18, 3
/* 0000902C 98010021 */ stb r0, 0x21(r1)
/* 00009030 3E004330 */ lis r16, 0x4330
/* 00009034 9A410022 */ stb r18, 0x22(r1)
/* 00009038 C01F00A4 */ lfs f0, 0xa4(r31)
/* 0000903C D0010054 */ stfs f0, 0x54(r1)
/* 00009040 801B0014 */ lwz r0, 0x14(r27)
/* 00009044 54001838 */ slwi r0, r0, 3
/* 00009048 7E7E0214 */ add r19, r30, r0
/* 0000904C 3A731034 */ addi r19, r19, 0x1034
/* 00009050 480001D4 */ b lbl_00009224
lbl_00009054:
/* 00009054 80930000 */ lwz r4, 0(r19)
/* 00009058 7FA3EB78 */ mr r3, r29
/* 0000905C 7C84882E */ lwzx r4, r4, r17
/* 00009060 4BFF714D */ bl strcpy
/* 00009064 4BFF7149 */ bl reset_text_draw_settings
/* 00009068 88610015 */ lbz r3, 0x15(r1)
/* 0000906C 4BFF7141 */ bl set_text_font
/* 00009070 C0210054 */ lfs f1, 0x54(r1)
/* 00009074 C0410058 */ lfs f2, 0x58(r1)
/* 00009078 4BFF7135 */ bl set_text_scale
/* 0000907C 80610088 */ lwz r3, 0x88(r1)
/* 00009080 4BFF712D */ bl func_80071B50
/* 00009084 C0210060 */ lfs f1, 0x60(r1)
/* 00009088 4BFF7125 */ bl func_80071B1C
/* 0000908C 88010021 */ lbz r0, 0x21(r1)
/* 00009090 88610020 */ lbz r3, 0x20(r1)
/* 00009094 5400402E */ slwi r0, r0, 8
/* 00009098 88810022 */ lbz r4, 0x22(r1)
/* 0000909C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000090A0 7C830378 */ or r3, r4, r0
/* 000090A4 4BFF7109 */ bl set_text_mul_color
/* 000090A8 88010085 */ lbz r0, 0x85(r1)
/* 000090AC 88610084 */ lbz r3, 0x84(r1)
/* 000090B0 5400402E */ slwi r0, r0, 8
/* 000090B4 88810086 */ lbz r4, 0x86(r1)
/* 000090B8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000090BC 7C830378 */ or r3, r4, r0
/* 000090C0 4BFF70ED */ bl set_text_add_color
/* 000090C4 7FA3EB78 */ mr r3, r29
/* 000090C8 4BFF70E5 */ bl u_get_text_width
/* 000090CC C81F0058 */ lfd f0, 0x58(r31)
/* 000090D0 6E408000 */ xoris r0, r18, 0x8000
/* 000090D4 900100D4 */ stw r0, 0xd4(r1)
/* 000090D8 3C600000 */ lis r3, lbl_0000C380@ha
/* 000090DC FC000072 */ fmul f0, f0, f1
/* 000090E0 C83F00A8 */ lfd f1, 0xa8(r31)
/* 000090E4 3C800000 */ lis r4, lbl_0000C380@ha
/* 000090E8 920100D0 */ stw r16, 0xd0(r1)
/* 000090EC FC210028 */ fsub f1, f1, f0
/* 000090F0 C80100D0 */ lfd f0, 0xd0(r1)
/* 000090F4 FC200818 */ frsp f1, f1
/* 000090F8 D0210018 */ stfs f1, 0x18(r1)
/* 000090FC 80B30004 */ lwz r5, 4(r19)
/* 00009100 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00009104 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 00009108 C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 0000910C 6C008000 */ xoris r0, r0, 0x8000
/* 00009110 FC000828 */ fsub f0, f0, f1
/* 00009114 900100DC */ stw r0, 0xdc(r1)
/* 00009118 C83F0080 */ lfd f1, 0x80(r31)
/* 0000911C 920100D8 */ stw r16, 0xd8(r1)
/* 00009120 FC010032 */ fmul f0, f1, f0
/* 00009124 C87F00B8 */ lfd f3, 0xb8(r31)
/* 00009128 C82100D8 */ lfd f1, 0xd8(r1)
/* 0000912C C89F00B0 */ lfd f4, 0xb0(r31)
/* 00009130 FC211028 */ fsub f1, f1, f2
/* 00009134 FC230072 */ fmul f1, f3, f1
/* 00009138 FC240828 */ fsub f1, f4, f1
/* 0000913C FC01002A */ fadd f0, f1, f0
/* 00009140 FC000018 */ frsp f0, f0
/* 00009144 D001001C */ stfs f0, 0x1c(r1)
/* 00009148 4BFF7065 */ bl reset_text_draw_settings
/* 0000914C 88610015 */ lbz r3, 0x15(r1)
/* 00009150 4BFF705D */ bl set_text_font
/* 00009154 C0210054 */ lfs f1, 0x54(r1)
/* 00009158 C0410058 */ lfs f2, 0x58(r1)
/* 0000915C 4BFF7051 */ bl set_text_scale
/* 00009160 80610088 */ lwz r3, 0x88(r1)
/* 00009164 4BFF7049 */ bl func_80071B50
/* 00009168 C83F0028 */ lfd f1, 0x28(r31)
/* 0000916C C0010060 */ lfs f0, 0x60(r1)
/* 00009170 FC21002A */ fadd f1, f1, f0
/* 00009174 FC200818 */ frsp f1, f1
/* 00009178 4BFF7035 */ bl func_80071B1C
/* 0000917C 38600000 */ li r3, 0
/* 00009180 4BFF702D */ bl set_text_mul_color
/* 00009184 88010085 */ lbz r0, 0x85(r1)
/* 00009188 88610084 */ lbz r3, 0x84(r1)
/* 0000918C 5400402E */ slwi r0, r0, 8
/* 00009190 88810086 */ lbz r4, 0x86(r1)
/* 00009194 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009198 7C830378 */ or r3, r4, r0
/* 0000919C 4BFF7011 */ bl set_text_add_color
/* 000091A0 C85F0030 */ lfd f2, 0x30(r31)
/* 000091A4 C0210018 */ lfs f1, 0x18(r1)
/* 000091A8 C001001C */ lfs f0, 0x1c(r1)
/* 000091AC FC22082A */ fadd f1, f2, f1
/* 000091B0 FC42002A */ fadd f2, f2, f0
/* 000091B4 FC200818 */ frsp f1, f1
/* 000091B8 FC401018 */ frsp f2, f2
/* 000091BC 4BFF6FF1 */ bl set_text_pos
/* 000091C0 7FA3EB78 */ mr r3, r29
/* 000091C4 4BFF6FE9 */ bl u_draw_text
/* 000091C8 C0210060 */ lfs f1, 0x60(r1)
/* 000091CC 4BFF6FE1 */ bl func_80071B1C
/* 000091D0 88010021 */ lbz r0, 0x21(r1)
/* 000091D4 88610020 */ lbz r3, 0x20(r1)
/* 000091D8 5400402E */ slwi r0, r0, 8
/* 000091DC 88810022 */ lbz r4, 0x22(r1)
/* 000091E0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000091E4 7C830378 */ or r3, r4, r0
/* 000091E8 4BFF6FC5 */ bl set_text_mul_color
/* 000091EC 88010085 */ lbz r0, 0x85(r1)
/* 000091F0 88610084 */ lbz r3, 0x84(r1)
/* 000091F4 5400402E */ slwi r0, r0, 8
/* 000091F8 88810086 */ lbz r4, 0x86(r1)
/* 000091FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009200 7C830378 */ or r3, r4, r0
/* 00009204 4BFF6FA9 */ bl set_text_add_color
/* 00009208 C0210018 */ lfs f1, 0x18(r1)
/* 0000920C C041001C */ lfs f2, 0x1c(r1)
/* 00009210 4BFF6F9D */ bl set_text_pos
/* 00009214 7FA3EB78 */ mr r3, r29
/* 00009218 4BFF6F95 */ bl u_draw_text
/* 0000921C 3A310008 */ addi r17, r17, 8
/* 00009220 3A520001 */ addi r18, r18, 1
lbl_00009224:
/* 00009224 80130004 */ lwz r0, 4(r19)
/* 00009228 7C120000 */ cmpw r18, r0
/* 0000922C 4180FE28 */ blt lbl_00009054
/* 00009230 4BFF6F7D */ bl mathutil_mtxA_from_identity
/* 00009234 3C600000 */ lis r3, mathutilData@ha
/* 00009238 38630000 */ addi r3, r3, mathutilData@l
/* 0000923C 80630000 */ lwz r3, 0(r3)
/* 00009240 38800000 */ li r4, 0
/* 00009244 4BFF6F69 */ bl GXLoadPosMtxImm
/* 00009248 BA0100E0 */ lmw r16, 0xe0(r1)
/* 0000924C 80010124 */ lwz r0, 0x124(r1)
/* 00009250 38210120 */ addi r1, r1, 0x120
/* 00009254 7C0803A6 */ mtlr r0
/* 00009258 4E800020 */ blr 
lbl_0000925C:
/* 0000925C 7C0802A6 */ mflr r0
/* 00009260 3C600000 */ lis r3, lbl_0000C370@ha
/* 00009264 90010004 */ stw r0, 4(r1)
/* 00009268 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000926C 93E1001C */ stw r31, 0x1c(r1)
/* 00009270 3BE30000 */ addi r31, r3, lbl_0000C370@l
/* 00009274 3860005B */ li r3, 0x5b
/* 00009278 93C10018 */ stw r30, 0x18(r1)
/* 0000927C 4BFF6F31 */ bl find_sprite_with_tag
/* 00009280 28030000 */ cmplwi r3, 0
/* 00009284 41820030 */ beq lbl_000092B4
/* 00009288 3C600000 */ lis r3, lbl_10000000@ha
/* 0000928C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00009290 8C03009C */ lbzu r0, 0x9c(r3)
/* 00009294 2C000001 */ cmpwi r0, 1
/* 00009298 40820010 */ bne lbl_000092A8
/* 0000929C 38000003 */ li r0, 3
/* 000092A0 98030000 */ stb r0, 0(r3)
/* 000092A4 48000104 */ b lbl_000093A8
lbl_000092A8:
/* 000092A8 38000004 */ li r0, 4
/* 000092AC 98030000 */ stb r0, 0(r3)
/* 000092B0 480000F8 */ b lbl_000093A8
lbl_000092B4:
/* 000092B4 3C600000 */ lis r3, lbl_10000000@ha
/* 000092B8 38630000 */ addi r3, r3, lbl_10000000@l
/* 000092BC 8803009C */ lbz r0, 0x9c(r3)
/* 000092C0 3BC3009C */ addi r30, r3, 0x9c
/* 000092C4 2C000001 */ cmpwi r0, 1
/* 000092C8 40820038 */ bne lbl_00009300
/* 000092CC 3860005B */ li r3, 0x5b
/* 000092D0 4BFFAC9D */ bl lbl_00003F6C
/* 000092D4 28030000 */ cmplwi r3, 0
/* 000092D8 41820058 */ beq lbl_00009330
/* 000092DC 38000003 */ li r0, 3
/* 000092E0 98030000 */ stb r0, 0(r3)
/* 000092E4 3800001E */ li r0, 0x1e
/* 000092E8 98030001 */ stb r0, 1(r3)
/* 000092EC C01F0020 */ lfs f0, 0x20(r31)
/* 000092F0 D0030004 */ stfs f0, 4(r3)
/* 000092F4 C01F0000 */ lfs f0, 0(r31)
/* 000092F8 D0030008 */ stfs f0, 8(r3)
/* 000092FC 48000034 */ b lbl_00009330
lbl_00009300:
/* 00009300 3860005B */ li r3, 0x5b
/* 00009304 4BFFAC69 */ bl lbl_00003F6C
/* 00009308 28030000 */ cmplwi r3, 0
/* 0000930C 41820024 */ beq lbl_00009330
/* 00009310 38000004 */ li r0, 4
/* 00009314 98030000 */ stb r0, 0(r3)
/* 00009318 3800001E */ li r0, 0x1e
/* 0000931C 98030001 */ stb r0, 1(r3)
/* 00009320 C01F0024 */ lfs f0, 0x24(r31)
/* 00009324 D0030004 */ stfs f0, 4(r3)
/* 00009328 C01F0000 */ lfs f0, 0(r31)
/* 0000932C D0030008 */ stfs f0, 8(r3)
lbl_00009330:
/* 00009330 3C600000 */ lis r3, lbl_10000000@ha
/* 00009334 C01F0000 */ lfs f0, 0(r31)
/* 00009338 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000933C D0030020 */ stfs f0, 0x20(r3)
/* 00009340 C01F01D0 */ lfs f0, 0x1d0(r31)
/* 00009344 D003002C */ stfs f0, 0x2c(r3)
/* 00009348 C01F0000 */ lfs f0, 0(r31)
/* 0000934C D0030024 */ stfs f0, 0x24(r3)
/* 00009350 C01F01D0 */ lfs f0, 0x1d0(r31)
/* 00009354 D0030030 */ stfs f0, 0x30(r3)
/* 00009358 C01F0000 */ lfs f0, 0(r31)
/* 0000935C D0030028 */ stfs f0, 0x28(r3)
/* 00009360 C01F01D0 */ lfs f0, 0x1d0(r31)
/* 00009364 D0030034 */ stfs f0, 0x34(r3)
/* 00009368 4BFF6E45 */ bl create_sprite
/* 0000936C 28030000 */ cmplwi r3, 0
/* 00009370 41820038 */ beq lbl_000093A8
/* 00009374 3800005B */ li r0, 0x5b
/* 00009378 3C800000 */ lis r4, lbl_00008AEC@ha
/* 0000937C 9803000F */ stb r0, 0xf(r3)
/* 00009380 38040000 */ addi r0, r4, lbl_00008AEC@l
/* 00009384 3C800000 */ lis r4, lbl_00008C40@ha
/* 00009388 90030034 */ stw r0, 0x34(r3)
/* 0000938C 38040000 */ addi r0, r4, lbl_00008C40@l
/* 00009390 90030038 */ stw r0, 0x38(r3)
/* 00009394 3C800000 */ lis r4, lbl_0000D310@ha
/* 00009398 38840000 */ addi r4, r4, lbl_0000D310@l
/* 0000939C 93C3002C */ stw r30, 0x2c(r3)
/* 000093A0 3863008C */ addi r3, r3, 0x8c
/* 000093A4 4BFF6E09 */ bl strcpy
lbl_000093A8:
/* 000093A8 80010024 */ lwz r0, 0x24(r1)
/* 000093AC 83E1001C */ lwz r31, 0x1c(r1)
/* 000093B0 83C10018 */ lwz r30, 0x18(r1)
/* 000093B4 7C0803A6 */ mtlr r0
/* 000093B8 38210020 */ addi r1, r1, 0x20
/* 000093BC 4E800020 */ blr 
lbl_000093C0:
/* 000093C0 7C0802A6 */ mflr r0
/* 000093C4 3CA00000 */ lis r5, lbl_0000C370@ha
/* 000093C8 90010004 */ stw r0, 4(r1)
/* 000093CC 9421FFE0 */ stwu r1, -0x20(r1)
/* 000093D0 93E1001C */ stw r31, 0x1c(r1)
/* 000093D4 3BE50000 */ addi r31, r5, lbl_0000C370@l
/* 000093D8 93C10018 */ stw r30, 0x18(r1)
/* 000093DC 83C4002C */ lwz r30, 0x2c(r4)
/* 000093E0 4BFFAC11 */ bl lbl_00003FF0
/* 000093E4 801E0018 */ lwz r0, 0x18(r30)
/* 000093E8 3C600000 */ lis r3, lbl_0000C380@ha
/* 000093EC C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 000093F0 3C800000 */ lis r4, lbl_10000000@ha
/* 000093F4 6C008000 */ xoris r0, r0, 0x8000
/* 000093F8 90010014 */ stw r0, 0x14(r1)
/* 000093FC 3C004330 */ lis r0, 0x4330
/* 00009400 38640000 */ addi r3, r4, lbl_10000000@l
/* 00009404 C85F0080 */ lfd f2, 0x80(r31)
/* 00009408 90010010 */ stw r0, 0x10(r1)
/* 0000940C C87F01F0 */ lfd f3, 0x1f0(r31)
/* 00009410 C8010010 */ lfd f0, 0x10(r1)
/* 00009414 C4830108 */ lfsu f4, 0x108(r3)
/* 00009418 FC000828 */ fsub f0, f0, f1
/* 0000941C C83F0058 */ lfd f1, 0x58(r31)
/* 00009420 FC020032 */ fmul f0, f2, f0
/* 00009424 FC03002A */ fadd f0, f3, f0
/* 00009428 FC002028 */ fsub f0, f0, f4
/* 0000942C FC010032 */ fmul f0, f1, f0
/* 00009430 FC04002A */ fadd f0, f4, f0
/* 00009434 FC000018 */ frsp f0, f0
/* 00009438 D0030000 */ stfs f0, 0(r3)
/* 0000943C 80010024 */ lwz r0, 0x24(r1)
/* 00009440 83E1001C */ lwz r31, 0x1c(r1)
/* 00009444 83C10018 */ lwz r30, 0x18(r1)
/* 00009448 7C0803A6 */ mtlr r0
/* 0000944C 38210020 */ addi r1, r1, 0x20
/* 00009450 4E800020 */ blr 
lbl_00009454:
/* 00009454 7C0802A6 */ mflr r0
/* 00009458 7C651B78 */ mr r5, r3
/* 0000945C 90010004 */ stw r0, 4(r1)
/* 00009460 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00009464 9421FF00 */ stwu r1, -0x100(r1)
/* 00009468 BF2100E4 */ stmw r25, 0xe4(r1)
/* 0000946C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 00009470 3C800000 */ lis r4, lbl_0000C370@ha
/* 00009474 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00009478 8863000F */ lbz r3, 0xf(r3)
/* 0000947C 8385002C */ lwz r28, 0x2c(r5)
/* 00009480 7C630774 */ extsb r3, r3
/* 00009484 4BFFAAE9 */ bl lbl_00003F6C
/* 00009488 28030000 */ cmplwi r3, 0
/* 0000948C 41820040 */ beq lbl_000094CC
/* 00009490 C05F0000 */ lfs f2, 0(r31)
/* 00009494 C0230004 */ lfs f1, 4(r3)
/* 00009498 C0030008 */ lfs f0, 8(r3)
/* 0000949C FC601090 */ fmr f3, f2
/* 000094A0 EC21002A */ fadds f1, f1, f0
/* 000094A4 4BFF6D09 */ bl mathutil_mtxA_from_translate_xyz
/* 000094A8 3C600000 */ lis r3, lbl_10000000@ha
/* 000094AC 38630000 */ addi r3, r3, lbl_10000000@l
/* 000094B0 38630184 */ addi r3, r3, 0x184
/* 000094B4 4BFF6CF9 */ bl mathutil_mtxA_to_mtx
/* 000094B8 3C600000 */ lis r3, mathutilData@ha
/* 000094BC 38630000 */ addi r3, r3, mathutilData@l
/* 000094C0 80630000 */ lwz r3, 0(r3)
/* 000094C4 38800000 */ li r4, 0
/* 000094C8 4BFF6CE5 */ bl GXLoadPosMtxImm
lbl_000094CC:
/* 000094CC 7FA3EB78 */ mr r3, r29
/* 000094D0 4BFF6CDD */ bl draw_naomi_sprite
/* 000094D4 C01F0088 */ lfs f0, 0x88(r31)
/* 000094D8 3BC100A0 */ addi r30, r1, 0xa0
/* 000094DC 388000B3 */ li r4, 0xb3
/* 000094E0 D0010060 */ stfs f0, 0x60(r1)
/* 000094E4 3B200000 */ li r25, 0
/* 000094E8 3C000020 */ lis r0, 0x20
/* 000094EC C01F0060 */ lfs f0, 0x60(r31)
/* 000094F0 7FC3F378 */ mr r3, r30
/* 000094F4 D0010054 */ stfs f0, 0x54(r1)
/* 000094F8 C01F0060 */ lfs f0, 0x60(r31)
/* 000094FC D0010058 */ stfs f0, 0x58(r1)
/* 00009500 98810015 */ stb r4, 0x15(r1)
/* 00009504 389D11AC */ addi r4, r29, 0x11ac
/* 00009508 9B210084 */ stb r25, 0x84(r1)
/* 0000950C 9B210085 */ stb r25, 0x85(r1)
/* 00009510 9B210086 */ stb r25, 0x86(r1)
/* 00009514 90010088 */ stw r0, 0x88(r1)
/* 00009518 4BFF6C95 */ bl strcpy
/* 0000951C 4BFF6C91 */ bl reset_text_draw_settings
/* 00009520 88610015 */ lbz r3, 0x15(r1)
/* 00009524 4BFF6C89 */ bl set_text_font
/* 00009528 C0210054 */ lfs f1, 0x54(r1)
/* 0000952C C0410058 */ lfs f2, 0x58(r1)
/* 00009530 4BFF6C7D */ bl set_text_scale
/* 00009534 80610088 */ lwz r3, 0x88(r1)
/* 00009538 4BFF6C75 */ bl func_80071B50
/* 0000953C C0210060 */ lfs f1, 0x60(r1)
/* 00009540 4BFF6C6D */ bl func_80071B1C
/* 00009544 88010021 */ lbz r0, 0x21(r1)
/* 00009548 88610020 */ lbz r3, 0x20(r1)
/* 0000954C 5400402E */ slwi r0, r0, 8
/* 00009550 88810022 */ lbz r4, 0x22(r1)
/* 00009554 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009558 7C830378 */ or r3, r4, r0
/* 0000955C 4BFF6C51 */ bl set_text_mul_color
/* 00009560 88010085 */ lbz r0, 0x85(r1)
/* 00009564 88610084 */ lbz r3, 0x84(r1)
/* 00009568 5400402E */ slwi r0, r0, 8
/* 0000956C 88810086 */ lbz r4, 0x86(r1)
/* 00009570 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009574 7C830378 */ or r3, r4, r0
/* 00009578 4BFF6C35 */ bl set_text_add_color
/* 0000957C 7FC3F378 */ mr r3, r30
/* 00009580 4BFF6C2D */ bl u_get_text_width
/* 00009584 C81F0058 */ lfd f0, 0x58(r31)
/* 00009588 380000FF */ li r0, 0xff
/* 0000958C C85F00A8 */ lfd f2, 0xa8(r31)
/* 00009590 FC000072 */ fmul f0, f0, f1
/* 00009594 FC020028 */ fsub f0, f2, f0
/* 00009598 FC000018 */ frsp f0, f0
/* 0000959C D0010018 */ stfs f0, 0x18(r1)
/* 000095A0 C01F0090 */ lfs f0, 0x90(r31)
/* 000095A4 D001001C */ stfs f0, 0x1c(r1)
/* 000095A8 98010020 */ stb r0, 0x20(r1)
/* 000095AC 98010021 */ stb r0, 0x21(r1)
/* 000095B0 9B210022 */ stb r25, 0x22(r1)
/* 000095B4 4BFF6BF9 */ bl reset_text_draw_settings
/* 000095B8 88610015 */ lbz r3, 0x15(r1)
/* 000095BC 4BFF6BF1 */ bl set_text_font
/* 000095C0 C0210054 */ lfs f1, 0x54(r1)
/* 000095C4 C0410058 */ lfs f2, 0x58(r1)
/* 000095C8 4BFF6BE5 */ bl set_text_scale
/* 000095CC 80610088 */ lwz r3, 0x88(r1)
/* 000095D0 4BFF6BDD */ bl func_80071B50
/* 000095D4 C83F0028 */ lfd f1, 0x28(r31)
/* 000095D8 C0010060 */ lfs f0, 0x60(r1)
/* 000095DC FC21002A */ fadd f1, f1, f0
/* 000095E0 FC200818 */ frsp f1, f1
/* 000095E4 4BFF6BC9 */ bl func_80071B1C
/* 000095E8 38600000 */ li r3, 0
/* 000095EC 4BFF6BC1 */ bl set_text_mul_color
/* 000095F0 88010085 */ lbz r0, 0x85(r1)
/* 000095F4 88610084 */ lbz r3, 0x84(r1)
/* 000095F8 5400402E */ slwi r0, r0, 8
/* 000095FC 88810086 */ lbz r4, 0x86(r1)
/* 00009600 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009604 7C830378 */ or r3, r4, r0
/* 00009608 4BFF6BA5 */ bl set_text_add_color
/* 0000960C C85F0030 */ lfd f2, 0x30(r31)
/* 00009610 C0210018 */ lfs f1, 0x18(r1)
/* 00009614 C001001C */ lfs f0, 0x1c(r1)
/* 00009618 FC22082A */ fadd f1, f2, f1
/* 0000961C FC42002A */ fadd f2, f2, f0
/* 00009620 FC200818 */ frsp f1, f1
/* 00009624 FC401018 */ frsp f2, f2
/* 00009628 4BFF6B85 */ bl set_text_pos
/* 0000962C 7FC3F378 */ mr r3, r30
/* 00009630 4BFF6B7D */ bl u_draw_text
/* 00009634 C0210060 */ lfs f1, 0x60(r1)
/* 00009638 4BFF6B75 */ bl func_80071B1C
/* 0000963C 88010021 */ lbz r0, 0x21(r1)
/* 00009640 88610020 */ lbz r3, 0x20(r1)
/* 00009644 5400402E */ slwi r0, r0, 8
/* 00009648 88810022 */ lbz r4, 0x22(r1)
/* 0000964C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009650 7C830378 */ or r3, r4, r0
/* 00009654 4BFF6B59 */ bl set_text_mul_color
/* 00009658 88010085 */ lbz r0, 0x85(r1)
/* 0000965C 88610084 */ lbz r3, 0x84(r1)
/* 00009660 5400402E */ slwi r0, r0, 8
/* 00009664 88810086 */ lbz r4, 0x86(r1)
/* 00009668 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000966C 7C830378 */ or r3, r4, r0
/* 00009670 4BFF6B3D */ bl set_text_add_color
/* 00009674 C0210018 */ lfs f1, 0x18(r1)
/* 00009678 C041001C */ lfs f2, 0x1c(r1)
/* 0000967C 4BFF6B31 */ bl set_text_pos
/* 00009680 7FC3F378 */ mr r3, r30
/* 00009684 4BFF6B29 */ bl u_draw_text
/* 00009688 C01F01F8 */ lfs f0, 0x1f8(r31)
/* 0000968C 3C800000 */ lis r4, lbl_10000000@ha
/* 00009690 38840000 */ addi r4, r4, lbl_10000000@l
/* 00009694 D01D0054 */ stfs f0, 0x54(r29)
/* 00009698 387D0050 */ addi r3, r29, 0x50
/* 0000969C C0040108 */ lfs f0, 0x108(r4)
/* 000096A0 D01D0058 */ stfs f0, 0x58(r29)
/* 000096A4 4BFF6B09 */ bl draw_naomi_sprite
/* 000096A8 C03F0148 */ lfs f1, 0x148(r31)
/* 000096AC 387D1058 */ addi r3, r29, 0x1058
/* 000096B0 C05F009C */ lfs f2, 0x9c(r31)
/* 000096B4 4BFFAC09 */ bl lbl_000042BC
/* 000096B8 3B200000 */ li r25, 0
/* 000096BC 5720103A */ slwi r0, r25, 2
/* 000096C0 7F5D0214 */ add r26, r29, r0
/* 000096C4 3F604330 */ lis r27, 0x4330
/* 000096C8 3B5A11A4 */ addi r26, r26, 0x11a4
lbl_000096CC:
/* 000096CC 6F208000 */ xoris r0, r25, 0x8000
/* 000096D0 C01F01FC */ lfs f0, 0x1fc(r31)
/* 000096D4 900100DC */ stw r0, 0xdc(r1)
/* 000096D8 3C600000 */ lis r3, lbl_0000C380@ha
/* 000096DC D0010018 */ stfs f0, 0x18(r1)
/* 000096E0 936100D8 */ stw r27, 0xd8(r1)
/* 000096E4 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 000096E8 C80100D8 */ lfd f0, 0xd8(r1)
/* 000096EC C85F0080 */ lfd f2, 0x80(r31)
/* 000096F0 FC000828 */ fsub f0, f0, f1
/* 000096F4 C83F0200 */ lfd f1, 0x200(r31)
/* 000096F8 FC020032 */ fmul f0, f2, f0
/* 000096FC FC01002A */ fadd f0, f1, f0
/* 00009700 FC000018 */ frsp f0, f0
/* 00009704 D001001C */ stfs f0, 0x1c(r1)
/* 00009708 801C0018 */ lwz r0, 0x18(r28)
/* 0000970C 7C190000 */ cmpw r25, r0
/* 00009710 4082001C */ bne lbl_0000972C
/* 00009714 386000FF */ li r3, 0xff
/* 00009718 98610020 */ stb r3, 0x20(r1)
/* 0000971C 38000000 */ li r0, 0
/* 00009720 98610021 */ stb r3, 0x21(r1)
/* 00009724 98010022 */ stb r0, 0x22(r1)
/* 00009728 48000018 */ b lbl_00009740
lbl_0000972C:
/* 0000972C 3860008F */ li r3, 0x8f
/* 00009730 98610020 */ stb r3, 0x20(r1)
/* 00009734 38000000 */ li r0, 0
/* 00009738 98610021 */ stb r3, 0x21(r1)
/* 0000973C 98010022 */ stb r0, 0x22(r1)
lbl_00009740:
/* 00009740 7FC3F378 */ mr r3, r30
/* 00009744 809A0000 */ lwz r4, 0(r26)
/* 00009748 4BFF6A65 */ bl strcpy
/* 0000974C 4BFF6A61 */ bl reset_text_draw_settings
/* 00009750 88610015 */ lbz r3, 0x15(r1)
/* 00009754 4BFF6A59 */ bl set_text_font
/* 00009758 C0210054 */ lfs f1, 0x54(r1)
/* 0000975C C0410058 */ lfs f2, 0x58(r1)
/* 00009760 4BFF6A4D */ bl set_text_scale
/* 00009764 80610088 */ lwz r3, 0x88(r1)
/* 00009768 4BFF6A45 */ bl func_80071B50
/* 0000976C C83F0028 */ lfd f1, 0x28(r31)
/* 00009770 C0010060 */ lfs f0, 0x60(r1)
/* 00009774 FC21002A */ fadd f1, f1, f0
/* 00009778 FC200818 */ frsp f1, f1
/* 0000977C 4BFF6A31 */ bl func_80071B1C
/* 00009780 38600000 */ li r3, 0
/* 00009784 4BFF6A29 */ bl set_text_mul_color
/* 00009788 88010085 */ lbz r0, 0x85(r1)
/* 0000978C 88610084 */ lbz r3, 0x84(r1)
/* 00009790 5400402E */ slwi r0, r0, 8
/* 00009794 88810086 */ lbz r4, 0x86(r1)
/* 00009798 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000979C 7C830378 */ or r3, r4, r0
/* 000097A0 4BFF6A0D */ bl set_text_add_color
/* 000097A4 C85F0030 */ lfd f2, 0x30(r31)
/* 000097A8 C0210018 */ lfs f1, 0x18(r1)
/* 000097AC C001001C */ lfs f0, 0x1c(r1)
/* 000097B0 FC22082A */ fadd f1, f2, f1
/* 000097B4 FC42002A */ fadd f2, f2, f0
/* 000097B8 FC200818 */ frsp f1, f1
/* 000097BC FC401018 */ frsp f2, f2
/* 000097C0 4BFF69ED */ bl set_text_pos
/* 000097C4 7FC3F378 */ mr r3, r30
/* 000097C8 4BFF69E5 */ bl u_draw_text
/* 000097CC C0210060 */ lfs f1, 0x60(r1)
/* 000097D0 4BFF69DD */ bl func_80071B1C
/* 000097D4 88010021 */ lbz r0, 0x21(r1)
/* 000097D8 88610020 */ lbz r3, 0x20(r1)
/* 000097DC 5400402E */ slwi r0, r0, 8
/* 000097E0 88810022 */ lbz r4, 0x22(r1)
/* 000097E4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000097E8 7C830378 */ or r3, r4, r0
/* 000097EC 4BFF69C1 */ bl set_text_mul_color
/* 000097F0 88010085 */ lbz r0, 0x85(r1)
/* 000097F4 88610084 */ lbz r3, 0x84(r1)
/* 000097F8 5400402E */ slwi r0, r0, 8
/* 000097FC 88810086 */ lbz r4, 0x86(r1)
/* 00009800 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009804 7C830378 */ or r3, r4, r0
/* 00009808 4BFF69A5 */ bl set_text_add_color
/* 0000980C C0210018 */ lfs f1, 0x18(r1)
/* 00009810 C041001C */ lfs f2, 0x1c(r1)
/* 00009814 4BFF6999 */ bl set_text_pos
/* 00009818 7FC3F378 */ mr r3, r30
/* 0000981C 4BFF6991 */ bl u_draw_text
/* 00009820 3B390001 */ addi r25, r25, 1
/* 00009824 28190002 */ cmplwi r25, 2
/* 00009828 3B5A0004 */ addi r26, r26, 4
/* 0000982C 4180FEA0 */ blt lbl_000096CC
/* 00009830 387D00F0 */ addi r3, r29, 0xf0
/* 00009834 4BFF6979 */ bl draw_naomi_sprite
/* 00009838 380000FF */ li r0, 0xff
/* 0000983C 98010020 */ stb r0, 0x20(r1)
/* 00009840 3B200000 */ li r25, 0
/* 00009844 573A1838 */ slwi r26, r25, 3
/* 00009848 98010021 */ stb r0, 0x21(r1)
/* 0000984C 3F604330 */ lis r27, 0x4330
/* 00009850 9B210022 */ stb r25, 0x22(r1)
/* 00009854 C01F01C8 */ lfs f0, 0x1c8(r31)
/* 00009858 D0010054 */ stfs f0, 0x54(r1)
/* 0000985C 801C0018 */ lwz r0, 0x18(r28)
/* 00009860 54001838 */ slwi r0, r0, 3
/* 00009864 7F9D0214 */ add r28, r29, r0
/* 00009868 3B9C1164 */ addi r28, r28, 0x1164
/* 0000986C 480001D4 */ b lbl_00009A40
lbl_00009870:
/* 00009870 809C0000 */ lwz r4, 0(r28)
/* 00009874 7FC3F378 */ mr r3, r30
/* 00009878 7C84D02E */ lwzx r4, r4, r26
/* 0000987C 4BFF6931 */ bl strcpy
/* 00009880 4BFF692D */ bl reset_text_draw_settings
/* 00009884 88610015 */ lbz r3, 0x15(r1)
/* 00009888 4BFF6925 */ bl set_text_font
/* 0000988C C0210054 */ lfs f1, 0x54(r1)
/* 00009890 C0410058 */ lfs f2, 0x58(r1)
/* 00009894 4BFF6919 */ bl set_text_scale
/* 00009898 80610088 */ lwz r3, 0x88(r1)
/* 0000989C 4BFF6911 */ bl func_80071B50
/* 000098A0 C0210060 */ lfs f1, 0x60(r1)
/* 000098A4 4BFF6909 */ bl func_80071B1C
/* 000098A8 88010021 */ lbz r0, 0x21(r1)
/* 000098AC 88610020 */ lbz r3, 0x20(r1)
/* 000098B0 5400402E */ slwi r0, r0, 8
/* 000098B4 88810022 */ lbz r4, 0x22(r1)
/* 000098B8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000098BC 7C830378 */ or r3, r4, r0
/* 000098C0 4BFF68ED */ bl set_text_mul_color
/* 000098C4 88010085 */ lbz r0, 0x85(r1)
/* 000098C8 88610084 */ lbz r3, 0x84(r1)
/* 000098CC 5400402E */ slwi r0, r0, 8
/* 000098D0 88810086 */ lbz r4, 0x86(r1)
/* 000098D4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000098D8 7C830378 */ or r3, r4, r0
/* 000098DC 4BFF68D1 */ bl set_text_add_color
/* 000098E0 7FC3F378 */ mr r3, r30
/* 000098E4 4BFF68C9 */ bl u_get_text_width
/* 000098E8 C81F0058 */ lfd f0, 0x58(r31)
/* 000098EC 6F208000 */ xoris r0, r25, 0x8000
/* 000098F0 900100D4 */ stw r0, 0xd4(r1)
/* 000098F4 3C600000 */ lis r3, lbl_0000C380@ha
/* 000098F8 FC000072 */ fmul f0, f0, f1
/* 000098FC C83F00A8 */ lfd f1, 0xa8(r31)
/* 00009900 3C800000 */ lis r4, lbl_0000C380@ha
/* 00009904 936100D0 */ stw r27, 0xd0(r1)
/* 00009908 FC210028 */ fsub f1, f1, f0
/* 0000990C C80100D0 */ lfd f0, 0xd0(r1)
/* 00009910 FC200818 */ frsp f1, f1
/* 00009914 D0210018 */ stfs f1, 0x18(r1)
/* 00009918 80BC0004 */ lwz r5, 4(r28)
/* 0000991C C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00009920 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 00009924 C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 00009928 6C008000 */ xoris r0, r0, 0x8000
/* 0000992C FC000828 */ fsub f0, f0, f1
/* 00009930 900100DC */ stw r0, 0xdc(r1)
/* 00009934 C83F0080 */ lfd f1, 0x80(r31)
/* 00009938 936100D8 */ stw r27, 0xd8(r1)
/* 0000993C FC010032 */ fmul f0, f1, f0
/* 00009940 C87F00B8 */ lfd f3, 0xb8(r31)
/* 00009944 C82100D8 */ lfd f1, 0xd8(r1)
/* 00009948 C89F00B0 */ lfd f4, 0xb0(r31)
/* 0000994C FC211028 */ fsub f1, f1, f2
/* 00009950 FC230072 */ fmul f1, f3, f1
/* 00009954 FC240828 */ fsub f1, f4, f1
/* 00009958 FC01002A */ fadd f0, f1, f0
/* 0000995C FC000018 */ frsp f0, f0
/* 00009960 D001001C */ stfs f0, 0x1c(r1)
/* 00009964 4BFF6849 */ bl reset_text_draw_settings
/* 00009968 88610015 */ lbz r3, 0x15(r1)
/* 0000996C 4BFF6841 */ bl set_text_font
/* 00009970 C0210054 */ lfs f1, 0x54(r1)
/* 00009974 C0410058 */ lfs f2, 0x58(r1)
/* 00009978 4BFF6835 */ bl set_text_scale
/* 0000997C 80610088 */ lwz r3, 0x88(r1)
/* 00009980 4BFF682D */ bl func_80071B50
/* 00009984 C83F0028 */ lfd f1, 0x28(r31)
/* 00009988 C0010060 */ lfs f0, 0x60(r1)
/* 0000998C FC21002A */ fadd f1, f1, f0
/* 00009990 FC200818 */ frsp f1, f1
/* 00009994 4BFF6819 */ bl func_80071B1C
/* 00009998 38600000 */ li r3, 0
/* 0000999C 4BFF6811 */ bl set_text_mul_color
/* 000099A0 88010085 */ lbz r0, 0x85(r1)
/* 000099A4 88610084 */ lbz r3, 0x84(r1)
/* 000099A8 5400402E */ slwi r0, r0, 8
/* 000099AC 88810086 */ lbz r4, 0x86(r1)
/* 000099B0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000099B4 7C830378 */ or r3, r4, r0
/* 000099B8 4BFF67F5 */ bl set_text_add_color
/* 000099BC C85F0030 */ lfd f2, 0x30(r31)
/* 000099C0 C0210018 */ lfs f1, 0x18(r1)
/* 000099C4 C001001C */ lfs f0, 0x1c(r1)
/* 000099C8 FC22082A */ fadd f1, f2, f1
/* 000099CC FC42002A */ fadd f2, f2, f0
/* 000099D0 FC200818 */ frsp f1, f1
/* 000099D4 FC401018 */ frsp f2, f2
/* 000099D8 4BFF67D5 */ bl set_text_pos
/* 000099DC 7FC3F378 */ mr r3, r30
/* 000099E0 4BFF67CD */ bl u_draw_text
/* 000099E4 C0210060 */ lfs f1, 0x60(r1)
/* 000099E8 4BFF67C5 */ bl func_80071B1C
/* 000099EC 88010021 */ lbz r0, 0x21(r1)
/* 000099F0 88610020 */ lbz r3, 0x20(r1)
/* 000099F4 5400402E */ slwi r0, r0, 8
/* 000099F8 88810022 */ lbz r4, 0x22(r1)
/* 000099FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009A00 7C830378 */ or r3, r4, r0
/* 00009A04 4BFF67A9 */ bl set_text_mul_color
/* 00009A08 88010085 */ lbz r0, 0x85(r1)
/* 00009A0C 88610084 */ lbz r3, 0x84(r1)
/* 00009A10 5400402E */ slwi r0, r0, 8
/* 00009A14 88810086 */ lbz r4, 0x86(r1)
/* 00009A18 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009A1C 7C830378 */ or r3, r4, r0
/* 00009A20 4BFF678D */ bl set_text_add_color
/* 00009A24 C0210018 */ lfs f1, 0x18(r1)
/* 00009A28 C041001C */ lfs f2, 0x1c(r1)
/* 00009A2C 4BFF6781 */ bl set_text_pos
/* 00009A30 7FC3F378 */ mr r3, r30
/* 00009A34 4BFF6779 */ bl u_draw_text
/* 00009A38 3B5A0008 */ addi r26, r26, 8
/* 00009A3C 3B390001 */ addi r25, r25, 1
lbl_00009A40:
/* 00009A40 801C0004 */ lwz r0, 4(r28)
/* 00009A44 7C190000 */ cmpw r25, r0
/* 00009A48 4180FE28 */ blt lbl_00009870
/* 00009A4C 4BFF6761 */ bl mathutil_mtxA_from_identity
/* 00009A50 3C600000 */ lis r3, mathutilData@ha
/* 00009A54 38630000 */ addi r3, r3, mathutilData@l
/* 00009A58 80630000 */ lwz r3, 0(r3)
/* 00009A5C 38800000 */ li r4, 0
/* 00009A60 4BFF674D */ bl GXLoadPosMtxImm
/* 00009A64 BB2100E4 */ lmw r25, 0xe4(r1)
/* 00009A68 80010104 */ lwz r0, 0x104(r1)
/* 00009A6C 38210100 */ addi r1, r1, 0x100
/* 00009A70 7C0803A6 */ mtlr r0
/* 00009A74 4E800020 */ blr 
lbl_00009A78:
/* 00009A78 7C0802A6 */ mflr r0
/* 00009A7C 3C600000 */ lis r3, lbl_0000C370@ha
/* 00009A80 90010004 */ stw r0, 4(r1)
/* 00009A84 9421FFF0 */ stwu r1, -0x10(r1)
/* 00009A88 93E1000C */ stw r31, 0xc(r1)
/* 00009A8C 3BE30000 */ addi r31, r3, lbl_0000C370@l
/* 00009A90 3860005E */ li r3, 0x5e
/* 00009A94 93C10008 */ stw r30, 8(r1)
/* 00009A98 4BFF6715 */ bl find_sprite_with_tag
/* 00009A9C 28030000 */ cmplwi r3, 0
/* 00009AA0 41820030 */ beq lbl_00009AD0
/* 00009AA4 3C600000 */ lis r3, lbl_10000000@ha
/* 00009AA8 38630000 */ addi r3, r3, lbl_10000000@l
/* 00009AAC 8C0300FC */ lbzu r0, 0xfc(r3)
/* 00009AB0 2C000001 */ cmpwi r0, 1
/* 00009AB4 40820010 */ bne lbl_00009AC4
/* 00009AB8 38000003 */ li r0, 3
/* 00009ABC 98030000 */ stb r0, 0(r3)
/* 00009AC0 480000DC */ b lbl_00009B9C
lbl_00009AC4:
/* 00009AC4 38000004 */ li r0, 4
/* 00009AC8 98030000 */ stb r0, 0(r3)
/* 00009ACC 480000D0 */ b lbl_00009B9C
lbl_00009AD0:
/* 00009AD0 3C600000 */ lis r3, lbl_10000000@ha
/* 00009AD4 38630000 */ addi r3, r3, lbl_10000000@l
/* 00009AD8 880300FC */ lbz r0, 0xfc(r3)
/* 00009ADC 3BC300FC */ addi r30, r3, 0xfc
/* 00009AE0 2C000001 */ cmpwi r0, 1
/* 00009AE4 40820038 */ bne lbl_00009B1C
/* 00009AE8 3860005E */ li r3, 0x5e
/* 00009AEC 4BFFA481 */ bl lbl_00003F6C
/* 00009AF0 28030000 */ cmplwi r3, 0
/* 00009AF4 41820058 */ beq lbl_00009B4C
/* 00009AF8 38000003 */ li r0, 3
/* 00009AFC 98030000 */ stb r0, 0(r3)
/* 00009B00 3800001E */ li r0, 0x1e
/* 00009B04 98030001 */ stb r0, 1(r3)
/* 00009B08 C01F0020 */ lfs f0, 0x20(r31)
/* 00009B0C D0030004 */ stfs f0, 4(r3)
/* 00009B10 C01F0000 */ lfs f0, 0(r31)
/* 00009B14 D0030008 */ stfs f0, 8(r3)
/* 00009B18 48000034 */ b lbl_00009B4C
lbl_00009B1C:
/* 00009B1C 3860005E */ li r3, 0x5e
/* 00009B20 4BFFA44D */ bl lbl_00003F6C
/* 00009B24 28030000 */ cmplwi r3, 0
/* 00009B28 41820024 */ beq lbl_00009B4C
/* 00009B2C 38000004 */ li r0, 4
/* 00009B30 98030000 */ stb r0, 0(r3)
/* 00009B34 3800001E */ li r0, 0x1e
/* 00009B38 98030001 */ stb r0, 1(r3)
/* 00009B3C C01F0024 */ lfs f0, 0x24(r31)
/* 00009B40 D0030004 */ stfs f0, 4(r3)
/* 00009B44 C01F0000 */ lfs f0, 0(r31)
/* 00009B48 D0030008 */ stfs f0, 8(r3)
lbl_00009B4C:
/* 00009B4C 3C600000 */ lis r3, lbl_10000000@ha
/* 00009B50 C01F0208 */ lfs f0, 0x208(r31)
/* 00009B54 38630000 */ addi r3, r3, lbl_10000000@l
/* 00009B58 D0030108 */ stfs f0, 0x108(r3)
/* 00009B5C 4BFF6651 */ bl create_sprite
/* 00009B60 28030000 */ cmplwi r3, 0
/* 00009B64 41820038 */ beq lbl_00009B9C
/* 00009B68 3800005E */ li r0, 0x5e
/* 00009B6C 3C800000 */ lis r4, lbl_000093C0@ha
/* 00009B70 9803000F */ stb r0, 0xf(r3)
/* 00009B74 38040000 */ addi r0, r4, lbl_000093C0@l
/* 00009B78 3C800000 */ lis r4, lbl_00009454@ha
/* 00009B7C 90030034 */ stw r0, 0x34(r3)
/* 00009B80 38040000 */ addi r0, r4, lbl_00009454@l
/* 00009B84 90030038 */ stw r0, 0x38(r3)
/* 00009B88 3C800000 */ lis r4, lbl_0000D310@ha
/* 00009B8C 38840000 */ addi r4, r4, lbl_0000D310@l
/* 00009B90 93C3002C */ stw r30, 0x2c(r3)
/* 00009B94 3863008C */ addi r3, r3, 0x8c
/* 00009B98 4BFF6615 */ bl strcpy
lbl_00009B9C:
/* 00009B9C 80010014 */ lwz r0, 0x14(r1)
/* 00009BA0 83E1000C */ lwz r31, 0xc(r1)
/* 00009BA4 83C10008 */ lwz r30, 8(r1)
/* 00009BA8 7C0803A6 */ mtlr r0
/* 00009BAC 38210010 */ addi r1, r1, 0x10
/* 00009BB0 4E800020 */ blr 
lbl_00009BB4:
/* 00009BB4 7C0802A6 */ mflr r0
/* 00009BB8 3CA00000 */ lis r5, lbl_0000C370@ha
/* 00009BBC 90010004 */ stw r0, 4(r1)
/* 00009BC0 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009BC4 93E1001C */ stw r31, 0x1c(r1)
/* 00009BC8 3BE50000 */ addi r31, r5, lbl_0000C370@l
/* 00009BCC 4BFFA425 */ bl lbl_00003FF0
/* 00009BD0 3C600000 */ lis r3, lbl_10000000@ha
/* 00009BD4 C85F0080 */ lfd f2, 0x80(r31)
/* 00009BD8 38830000 */ addi r4, r3, lbl_10000000@l
/* 00009BDC C87F0210 */ lfd f3, 0x210(r31)
/* 00009BE0 80040154 */ lwz r0, 0x154(r4)
/* 00009BE4 3C600000 */ lis r3, lbl_0000C380@ha
/* 00009BE8 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00009BEC 6C008000 */ xoris r0, r0, 0x8000
/* 00009BF0 C4A40148 */ lfsu f5, 0x148(r4)
/* 00009BF4 90010014 */ stw r0, 0x14(r1)
/* 00009BF8 3C004330 */ lis r0, 0x4330
/* 00009BFC C89F0058 */ lfd f4, 0x58(r31)
/* 00009C00 90010010 */ stw r0, 0x10(r1)
/* 00009C04 C8010010 */ lfd f0, 0x10(r1)
/* 00009C08 FC000828 */ fsub f0, f0, f1
/* 00009C0C FC020032 */ fmul f0, f2, f0
/* 00009C10 FC03002A */ fadd f0, f3, f0
/* 00009C14 FC002828 */ fsub f0, f0, f5
/* 00009C18 FC040032 */ fmul f0, f4, f0
/* 00009C1C FC05002A */ fadd f0, f5, f0
/* 00009C20 FC000018 */ frsp f0, f0
/* 00009C24 D0040000 */ stfs f0, 0(r4)
/* 00009C28 80010024 */ lwz r0, 0x24(r1)
/* 00009C2C 83E1001C */ lwz r31, 0x1c(r1)
/* 00009C30 38210020 */ addi r1, r1, 0x20
/* 00009C34 7C0803A6 */ mtlr r0
/* 00009C38 4E800020 */ blr 
lbl_00009C3C:
/* 00009C3C 7C0802A6 */ mflr r0
/* 00009C40 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00009C44 90010004 */ stw r0, 4(r1)
/* 00009C48 9421FF00 */ stwu r1, -0x100(r1)
/* 00009C4C BF2100E4 */ stmw r25, 0xe4(r1)
/* 00009C50 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 00009C54 3C800000 */ lis r4, lbl_0000C370@ha
/* 00009C58 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00009C5C 8863000F */ lbz r3, 0xf(r3)
/* 00009C60 7C630774 */ extsb r3, r3
/* 00009C64 4BFFA309 */ bl lbl_00003F6C
/* 00009C68 28030000 */ cmplwi r3, 0
/* 00009C6C 41820040 */ beq lbl_00009CAC
/* 00009C70 C05F0000 */ lfs f2, 0(r31)
/* 00009C74 C0230004 */ lfs f1, 4(r3)
/* 00009C78 C0030008 */ lfs f0, 8(r3)
/* 00009C7C FC601090 */ fmr f3, f2
/* 00009C80 EC21002A */ fadds f1, f1, f0
/* 00009C84 4BFF6529 */ bl mathutil_mtxA_from_translate_xyz
/* 00009C88 3C600000 */ lis r3, lbl_10000000@ha
/* 00009C8C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00009C90 38630184 */ addi r3, r3, 0x184
/* 00009C94 4BFF6519 */ bl mathutil_mtxA_to_mtx
/* 00009C98 3C600000 */ lis r3, mathutilData@ha
/* 00009C9C 38630000 */ addi r3, r3, mathutilData@l
/* 00009CA0 80630000 */ lwz r3, 0(r3)
/* 00009CA4 38800000 */ li r4, 0
/* 00009CA8 4BFF6505 */ bl GXLoadPosMtxImm
lbl_00009CAC:
/* 00009CAC 7FA3EB78 */ mr r3, r29
/* 00009CB0 4BFF64FD */ bl draw_naomi_sprite
/* 00009CB4 C01F0088 */ lfs f0, 0x88(r31)
/* 00009CB8 3BC100A0 */ addi r30, r1, 0xa0
/* 00009CBC 388000B3 */ li r4, 0xb3
/* 00009CC0 D0010060 */ stfs f0, 0x60(r1)
/* 00009CC4 3B200000 */ li r25, 0
/* 00009CC8 3C000020 */ lis r0, 0x20
/* 00009CCC C01F0060 */ lfs f0, 0x60(r31)
/* 00009CD0 7FC3F378 */ mr r3, r30
/* 00009CD4 D0010054 */ stfs f0, 0x54(r1)
/* 00009CD8 C01F0060 */ lfs f0, 0x60(r31)
/* 00009CDC D0010058 */ stfs f0, 0x58(r1)
/* 00009CE0 98810015 */ stb r4, 0x15(r1)
/* 00009CE4 389D1190 */ addi r4, r29, 0x1190
/* 00009CE8 9B210084 */ stb r25, 0x84(r1)
/* 00009CEC 9B210085 */ stb r25, 0x85(r1)
/* 00009CF0 9B210086 */ stb r25, 0x86(r1)
/* 00009CF4 90010088 */ stw r0, 0x88(r1)
/* 00009CF8 4BFF64B5 */ bl strcpy
/* 00009CFC 4BFF64B1 */ bl reset_text_draw_settings
/* 00009D00 88610015 */ lbz r3, 0x15(r1)
/* 00009D04 4BFF64A9 */ bl set_text_font
/* 00009D08 C0210054 */ lfs f1, 0x54(r1)
/* 00009D0C C0410058 */ lfs f2, 0x58(r1)
/* 00009D10 4BFF649D */ bl set_text_scale
/* 00009D14 80610088 */ lwz r3, 0x88(r1)
/* 00009D18 4BFF6495 */ bl func_80071B50
/* 00009D1C C0210060 */ lfs f1, 0x60(r1)
/* 00009D20 4BFF648D */ bl func_80071B1C
/* 00009D24 88010021 */ lbz r0, 0x21(r1)
/* 00009D28 88610020 */ lbz r3, 0x20(r1)
/* 00009D2C 5400402E */ slwi r0, r0, 8
/* 00009D30 88810022 */ lbz r4, 0x22(r1)
/* 00009D34 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009D38 7C830378 */ or r3, r4, r0
/* 00009D3C 4BFF6471 */ bl set_text_mul_color
/* 00009D40 88010085 */ lbz r0, 0x85(r1)
/* 00009D44 88610084 */ lbz r3, 0x84(r1)
/* 00009D48 5400402E */ slwi r0, r0, 8
/* 00009D4C 88810086 */ lbz r4, 0x86(r1)
/* 00009D50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009D54 7C830378 */ or r3, r4, r0
/* 00009D58 4BFF6455 */ bl set_text_add_color
/* 00009D5C 7FC3F378 */ mr r3, r30
/* 00009D60 4BFF644D */ bl u_get_text_width
/* 00009D64 C81F0058 */ lfd f0, 0x58(r31)
/* 00009D68 380000FF */ li r0, 0xff
/* 00009D6C C85F00A8 */ lfd f2, 0xa8(r31)
/* 00009D70 FC000072 */ fmul f0, f0, f1
/* 00009D74 FC020028 */ fsub f0, f2, f0
/* 00009D78 FC000018 */ frsp f0, f0
/* 00009D7C D0010018 */ stfs f0, 0x18(r1)
/* 00009D80 C01F0090 */ lfs f0, 0x90(r31)
/* 00009D84 D001001C */ stfs f0, 0x1c(r1)
/* 00009D88 98010020 */ stb r0, 0x20(r1)
/* 00009D8C 98010021 */ stb r0, 0x21(r1)
/* 00009D90 9B210022 */ stb r25, 0x22(r1)
/* 00009D94 4BFF6419 */ bl reset_text_draw_settings
/* 00009D98 88610015 */ lbz r3, 0x15(r1)
/* 00009D9C 4BFF6411 */ bl set_text_font
/* 00009DA0 C0210054 */ lfs f1, 0x54(r1)
/* 00009DA4 C0410058 */ lfs f2, 0x58(r1)
/* 00009DA8 4BFF6405 */ bl set_text_scale
/* 00009DAC 80610088 */ lwz r3, 0x88(r1)
/* 00009DB0 4BFF63FD */ bl func_80071B50
/* 00009DB4 C83F0028 */ lfd f1, 0x28(r31)
/* 00009DB8 C0010060 */ lfs f0, 0x60(r1)
/* 00009DBC FC21002A */ fadd f1, f1, f0
/* 00009DC0 FC200818 */ frsp f1, f1
/* 00009DC4 4BFF63E9 */ bl func_80071B1C
/* 00009DC8 38600000 */ li r3, 0
/* 00009DCC 4BFF63E1 */ bl set_text_mul_color
/* 00009DD0 88010085 */ lbz r0, 0x85(r1)
/* 00009DD4 88610084 */ lbz r3, 0x84(r1)
/* 00009DD8 5400402E */ slwi r0, r0, 8
/* 00009DDC 88810086 */ lbz r4, 0x86(r1)
/* 00009DE0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009DE4 7C830378 */ or r3, r4, r0
/* 00009DE8 4BFF63C5 */ bl set_text_add_color
/* 00009DEC C85F0030 */ lfd f2, 0x30(r31)
/* 00009DF0 C0210018 */ lfs f1, 0x18(r1)
/* 00009DF4 C001001C */ lfs f0, 0x1c(r1)
/* 00009DF8 FC22082A */ fadd f1, f2, f1
/* 00009DFC FC42002A */ fadd f2, f2, f0
/* 00009E00 FC200818 */ frsp f1, f1
/* 00009E04 FC401018 */ frsp f2, f2
/* 00009E08 4BFF63A5 */ bl set_text_pos
/* 00009E0C 7FC3F378 */ mr r3, r30
/* 00009E10 4BFF639D */ bl u_draw_text
/* 00009E14 C0210060 */ lfs f1, 0x60(r1)
/* 00009E18 4BFF6395 */ bl func_80071B1C
/* 00009E1C 88010021 */ lbz r0, 0x21(r1)
/* 00009E20 88610020 */ lbz r3, 0x20(r1)
/* 00009E24 5400402E */ slwi r0, r0, 8
/* 00009E28 88810022 */ lbz r4, 0x22(r1)
/* 00009E2C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009E30 7C830378 */ or r3, r4, r0
/* 00009E34 4BFF6379 */ bl set_text_mul_color
/* 00009E38 88010085 */ lbz r0, 0x85(r1)
/* 00009E3C 88610084 */ lbz r3, 0x84(r1)
/* 00009E40 5400402E */ slwi r0, r0, 8
/* 00009E44 88810086 */ lbz r4, 0x86(r1)
/* 00009E48 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009E4C 7C830378 */ or r3, r4, r0
/* 00009E50 4BFF635D */ bl set_text_add_color
/* 00009E54 C0210018 */ lfs f1, 0x18(r1)
/* 00009E58 C041001C */ lfs f2, 0x1c(r1)
/* 00009E5C 4BFF6351 */ bl set_text_pos
/* 00009E60 7FC3F378 */ mr r3, r30
/* 00009E64 4BFF6349 */ bl u_draw_text
/* 00009E68 C01F0218 */ lfs f0, 0x218(r31)
/* 00009E6C 3C800000 */ lis r4, lbl_10000000@ha
/* 00009E70 3B640000 */ addi r27, r4, lbl_10000000@l
/* 00009E74 D01D0054 */ stfs f0, 0x54(r29)
/* 00009E78 387D0050 */ addi r3, r29, 0x50
/* 00009E7C C01B0148 */ lfs f0, 0x148(r27)
/* 00009E80 D01D0058 */ stfs f0, 0x58(r29)
/* 00009E84 4BFF6329 */ bl draw_naomi_sprite
/* 00009E88 387D10A8 */ addi r3, r29, 0x10a8
/* 00009E8C 4BFF6321 */ bl draw_naomi_sprite
/* 00009E90 3B400000 */ li r26, 0
/* 00009E94 3F804330 */ lis r28, 0x4330
lbl_00009E98:
/* 00009E98 6F408000 */ xoris r0, r26, 0x8000
/* 00009E9C C01F021C */ lfs f0, 0x21c(r31)
/* 00009EA0 900100DC */ stw r0, 0xdc(r1)
/* 00009EA4 3C600000 */ lis r3, lbl_0000C380@ha
/* 00009EA8 D0010018 */ stfs f0, 0x18(r1)
/* 00009EAC 938100D8 */ stw r28, 0xd8(r1)
/* 00009EB0 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00009EB4 C80100D8 */ lfd f0, 0xd8(r1)
/* 00009EB8 C85F0080 */ lfd f2, 0x80(r31)
/* 00009EBC FC000828 */ fsub f0, f0, f1
/* 00009EC0 C83F0220 */ lfd f1, 0x220(r31)
/* 00009EC4 FC020032 */ fmul f0, f2, f0
/* 00009EC8 FC01002A */ fadd f0, f1, f0
/* 00009ECC FC000018 */ frsp f0, f0
/* 00009ED0 D001001C */ stfs f0, 0x1c(r1)
/* 00009ED4 801B0154 */ lwz r0, 0x154(r27)
/* 00009ED8 7C1A0000 */ cmpw r26, r0
/* 00009EDC 4082001C */ bne lbl_00009EF8
/* 00009EE0 386000FF */ li r3, 0xff
/* 00009EE4 98610020 */ stb r3, 0x20(r1)
/* 00009EE8 38000000 */ li r0, 0
/* 00009EEC 98610021 */ stb r3, 0x21(r1)
/* 00009EF0 98010022 */ stb r0, 0x22(r1)
/* 00009EF4 48000018 */ b lbl_00009F0C
lbl_00009EF8:
/* 00009EF8 3860008F */ li r3, 0x8f
/* 00009EFC 98610020 */ stb r3, 0x20(r1)
/* 00009F00 38000000 */ li r0, 0
/* 00009F04 98610021 */ stb r3, 0x21(r1)
/* 00009F08 98010022 */ stb r0, 0x22(r1)
lbl_00009F0C:
/* 00009F0C 387E0000 */ addi r3, r30, 0
/* 00009F10 4CC63182 */ crclr 6
/* 00009F14 389D120C */ addi r4, r29, 0x120c
/* 00009F18 38BA0001 */ addi r5, r26, 1
/* 00009F1C 4BFF6291 */ bl sprintf
/* 00009F20 4BFF628D */ bl reset_text_draw_settings
/* 00009F24 88610015 */ lbz r3, 0x15(r1)
/* 00009F28 4BFF6285 */ bl set_text_font
/* 00009F2C C0210054 */ lfs f1, 0x54(r1)
/* 00009F30 C0410058 */ lfs f2, 0x58(r1)
/* 00009F34 4BFF6279 */ bl set_text_scale
/* 00009F38 80610088 */ lwz r3, 0x88(r1)
/* 00009F3C 4BFF6271 */ bl func_80071B50
/* 00009F40 C83F0028 */ lfd f1, 0x28(r31)
/* 00009F44 C0010060 */ lfs f0, 0x60(r1)
/* 00009F48 FC21002A */ fadd f1, f1, f0
/* 00009F4C FC200818 */ frsp f1, f1
/* 00009F50 4BFF625D */ bl func_80071B1C
/* 00009F54 38600000 */ li r3, 0
/* 00009F58 4BFF6255 */ bl set_text_mul_color
/* 00009F5C 88010085 */ lbz r0, 0x85(r1)
/* 00009F60 88610084 */ lbz r3, 0x84(r1)
/* 00009F64 5400402E */ slwi r0, r0, 8
/* 00009F68 88810086 */ lbz r4, 0x86(r1)
/* 00009F6C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009F70 7C830378 */ or r3, r4, r0
/* 00009F74 4BFF6239 */ bl set_text_add_color
/* 00009F78 C85F0030 */ lfd f2, 0x30(r31)
/* 00009F7C C0210018 */ lfs f1, 0x18(r1)
/* 00009F80 C001001C */ lfs f0, 0x1c(r1)
/* 00009F84 FC22082A */ fadd f1, f2, f1
/* 00009F88 FC42002A */ fadd f2, f2, f0
/* 00009F8C FC200818 */ frsp f1, f1
/* 00009F90 FC401018 */ frsp f2, f2
/* 00009F94 4BFF6219 */ bl set_text_pos
/* 00009F98 7FC3F378 */ mr r3, r30
/* 00009F9C 4BFF6211 */ bl u_draw_text
/* 00009FA0 C0210060 */ lfs f1, 0x60(r1)
/* 00009FA4 4BFF6209 */ bl func_80071B1C
/* 00009FA8 88010021 */ lbz r0, 0x21(r1)
/* 00009FAC 88610020 */ lbz r3, 0x20(r1)
/* 00009FB0 5400402E */ slwi r0, r0, 8
/* 00009FB4 88810022 */ lbz r4, 0x22(r1)
/* 00009FB8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009FBC 7C830378 */ or r3, r4, r0
/* 00009FC0 4BFF61ED */ bl set_text_mul_color
/* 00009FC4 88010085 */ lbz r0, 0x85(r1)
/* 00009FC8 88610084 */ lbz r3, 0x84(r1)
/* 00009FCC 5400402E */ slwi r0, r0, 8
/* 00009FD0 88810086 */ lbz r4, 0x86(r1)
/* 00009FD4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009FD8 7C830378 */ or r3, r4, r0
/* 00009FDC 4BFF61D1 */ bl set_text_add_color
/* 00009FE0 C0210018 */ lfs f1, 0x18(r1)
/* 00009FE4 C041001C */ lfs f2, 0x1c(r1)
/* 00009FE8 4BFF61C5 */ bl set_text_pos
/* 00009FEC 7FC3F378 */ mr r3, r30
/* 00009FF0 4BFF61BD */ bl u_draw_text
/* 00009FF4 3B5A0001 */ addi r26, r26, 1
/* 00009FF8 2C1A0004 */ cmpwi r26, 4
/* 00009FFC 4180FE9C */ blt lbl_00009E98
/* 0000A000 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A004 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A008 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000A00C C87F0228 */ lfd f3, 0x228(r31)
/* 0000A010 80030154 */ lwz r0, 0x154(r3)
/* 0000A014 3B630154 */ addi r27, r3, 0x154
/* 0000A018 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000A01C 6C008000 */ xoris r0, r0, 0x8000
/* 0000A020 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000A024 900100DC */ stw r0, 0xdc(r1)
/* 0000A028 3F804330 */ lis r28, 0x4330
/* 0000A02C 387D11BC */ addi r3, r29, 0x11bc
/* 0000A030 938100D8 */ stw r28, 0xd8(r1)
/* 0000A034 C80100D8 */ lfd f0, 0xd8(r1)
/* 0000A038 FC000828 */ fsub f0, f0, f1
/* 0000A03C FC020032 */ fmul f0, f2, f0
/* 0000A040 FC03002A */ fadd f0, f3, f0
/* 0000A044 FC000018 */ frsp f0, f0
/* 0000A048 D01D11C4 */ stfs f0, 0x11c4(r29)
/* 0000A04C 4BFF6161 */ bl draw_naomi_sprite
/* 0000A050 380000B0 */ li r0, 0xb0
/* 0000A054 98010015 */ stb r0, 0x15(r1)
/* 0000A058 3CA00000 */ lis r5, lbl_0000C380@ha
/* 0000A05C 380000FF */ li r0, 0xff
/* 0000A060 C01F0190 */ lfs f0, 0x190(r31)
/* 0000A064 3B400000 */ li r26, 0
/* 0000A068 387E0000 */ addi r3, r30, 0
/* 0000A06C D0010018 */ stfs f0, 0x18(r1)
/* 0000A070 389D121C */ addi r4, r29, 0x121c
/* 0000A074 80DB0000 */ lwz r6, 0(r27)
/* 0000A078 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 0000A07C 6CC58000 */ xoris r5, r6, 0x8000
/* 0000A080 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A084 90A100D4 */ stw r5, 0xd4(r1)
/* 0000A088 C87F0220 */ lfd f3, 0x220(r31)
/* 0000A08C 938100D0 */ stw r28, 0xd0(r1)
/* 0000A090 C80100D0 */ lfd f0, 0xd0(r1)
/* 0000A094 FC000828 */ fsub f0, f0, f1
/* 0000A098 FC020032 */ fmul f0, f2, f0
/* 0000A09C FC03002A */ fadd f0, f3, f0
/* 0000A0A0 FC000018 */ frsp f0, f0
/* 0000A0A4 D001001C */ stfs f0, 0x1c(r1)
/* 0000A0A8 98010020 */ stb r0, 0x20(r1)
/* 0000A0AC 98010021 */ stb r0, 0x21(r1)
/* 0000A0B0 9B410022 */ stb r26, 0x22(r1)
/* 0000A0B4 C01F0158 */ lfs f0, 0x158(r31)
/* 0000A0B8 D0010054 */ stfs f0, 0x54(r1)
/* 0000A0BC 4BFF60F1 */ bl strcpy
/* 0000A0C0 4BFF60ED */ bl reset_text_draw_settings
/* 0000A0C4 88610015 */ lbz r3, 0x15(r1)
/* 0000A0C8 4BFF60E5 */ bl set_text_font
/* 0000A0CC C0210054 */ lfs f1, 0x54(r1)
/* 0000A0D0 C0410058 */ lfs f2, 0x58(r1)
/* 0000A0D4 4BFF60D9 */ bl set_text_scale
/* 0000A0D8 80610088 */ lwz r3, 0x88(r1)
/* 0000A0DC 4BFF60D1 */ bl func_80071B50
/* 0000A0E0 C83F0028 */ lfd f1, 0x28(r31)
/* 0000A0E4 C0010060 */ lfs f0, 0x60(r1)
/* 0000A0E8 FC21002A */ fadd f1, f1, f0
/* 0000A0EC FC200818 */ frsp f1, f1
/* 0000A0F0 4BFF60BD */ bl func_80071B1C
/* 0000A0F4 38600000 */ li r3, 0
/* 0000A0F8 4BFF60B5 */ bl set_text_mul_color
/* 0000A0FC 88010085 */ lbz r0, 0x85(r1)
/* 0000A100 88610084 */ lbz r3, 0x84(r1)
/* 0000A104 5400402E */ slwi r0, r0, 8
/* 0000A108 88810086 */ lbz r4, 0x86(r1)
/* 0000A10C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A110 7C830378 */ or r3, r4, r0
/* 0000A114 4BFF6099 */ bl set_text_add_color
/* 0000A118 C85F0030 */ lfd f2, 0x30(r31)
/* 0000A11C C0210018 */ lfs f1, 0x18(r1)
/* 0000A120 C001001C */ lfs f0, 0x1c(r1)
/* 0000A124 FC22082A */ fadd f1, f2, f1
/* 0000A128 FC42002A */ fadd f2, f2, f0
/* 0000A12C FC200818 */ frsp f1, f1
/* 0000A130 FC401018 */ frsp f2, f2
/* 0000A134 4BFF6079 */ bl set_text_pos
/* 0000A138 7FC3F378 */ mr r3, r30
/* 0000A13C 4BFF6071 */ bl u_draw_text
/* 0000A140 C0210060 */ lfs f1, 0x60(r1)
/* 0000A144 4BFF6069 */ bl func_80071B1C
/* 0000A148 88010021 */ lbz r0, 0x21(r1)
/* 0000A14C 88610020 */ lbz r3, 0x20(r1)
/* 0000A150 5400402E */ slwi r0, r0, 8
/* 0000A154 88810022 */ lbz r4, 0x22(r1)
/* 0000A158 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A15C 7C830378 */ or r3, r4, r0
/* 0000A160 4BFF604D */ bl set_text_mul_color
/* 0000A164 88010085 */ lbz r0, 0x85(r1)
/* 0000A168 88610084 */ lbz r3, 0x84(r1)
/* 0000A16C 5400402E */ slwi r0, r0, 8
/* 0000A170 88810086 */ lbz r4, 0x86(r1)
/* 0000A174 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A178 7C830378 */ or r3, r4, r0
/* 0000A17C 4BFF6031 */ bl set_text_add_color
/* 0000A180 C0210018 */ lfs f1, 0x18(r1)
/* 0000A184 C041001C */ lfs f2, 0x1c(r1)
/* 0000A188 4BFF6025 */ bl set_text_pos
/* 0000A18C 7FC3F378 */ mr r3, r30
/* 0000A190 4BFF601D */ bl u_draw_text
/* 0000A194 C01F0060 */ lfs f0, 0x60(r31)
/* 0000A198 D0010054 */ stfs f0, 0x54(r1)
/* 0000A19C 4BFF6011 */ bl func_800B622C
/* 0000A1A0 5479063E */ clrlwi r25, r3, 0x18
lbl_0000A1A4:
/* 0000A1A4 801B0000 */ lwz r0, 0(r27)
/* 0000A1A8 7C1A0000 */ cmpw r26, r0
/* 0000A1AC 4082001C */ bne lbl_0000A1C8
/* 0000A1B0 386000FF */ li r3, 0xff
/* 0000A1B4 98610020 */ stb r3, 0x20(r1)
/* 0000A1B8 38000000 */ li r0, 0
/* 0000A1BC 98610021 */ stb r3, 0x21(r1)
/* 0000A1C0 98010022 */ stb r0, 0x22(r1)
/* 0000A1C4 48000018 */ b lbl_0000A1DC
lbl_0000A1C8:
/* 0000A1C8 3860008F */ li r3, 0x8f
/* 0000A1CC 98610020 */ stb r3, 0x20(r1)
/* 0000A1D0 38000000 */ li r0, 0
/* 0000A1D4 98610021 */ stb r3, 0x21(r1)
/* 0000A1D8 98010022 */ stb r0, 0x22(r1)
lbl_0000A1DC:
/* 0000A1DC 38000001 */ li r0, 1
/* 0000A1E0 7C00D030 */ slw r0, r0, r26
/* 0000A1E4 7F200039 */ and. r0, r25, r0
/* 0000A1E8 41820054 */ beq lbl_0000A23C
/* 0000A1EC 6F408000 */ xoris r0, r26, 0x8000
/* 0000A1F0 C01F0230 */ lfs f0, 0x230(r31)
/* 0000A1F4 900100D4 */ stw r0, 0xd4(r1)
/* 0000A1F8 3CA00000 */ lis r5, lbl_0000C380@ha
/* 0000A1FC 4CC63182 */ crclr 6
/* 0000A200 7FC3F378 */ mr r3, r30
/* 0000A204 D0010018 */ stfs f0, 0x18(r1)
/* 0000A208 389D1244 */ addi r4, r29, 0x1244
/* 0000A20C 938100D0 */ stw r28, 0xd0(r1)
/* 0000A210 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 0000A214 C80100D0 */ lfd f0, 0xd0(r1)
/* 0000A218 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A21C FC000828 */ fsub f0, f0, f1
/* 0000A220 C83F0220 */ lfd f1, 0x220(r31)
/* 0000A224 FC020032 */ fmul f0, f2, f0
/* 0000A228 FC01002A */ fadd f0, f1, f0
/* 0000A22C FC000018 */ frsp f0, f0
/* 0000A230 D001001C */ stfs f0, 0x1c(r1)
/* 0000A234 4BFF5F79 */ bl sprintf
/* 0000A238 48000050 */ b lbl_0000A288
lbl_0000A23C:
/* 0000A23C 6F408000 */ xoris r0, r26, 0x8000
/* 0000A240 C01F0234 */ lfs f0, 0x234(r31)
/* 0000A244 900100D4 */ stw r0, 0xd4(r1)
/* 0000A248 3CA00000 */ lis r5, lbl_0000C380@ha
/* 0000A24C 4CC63182 */ crclr 6
/* 0000A250 7FC3F378 */ mr r3, r30
/* 0000A254 D0010018 */ stfs f0, 0x18(r1)
/* 0000A258 389D124C */ addi r4, r29, 0x124c
/* 0000A25C 938100D0 */ stw r28, 0xd0(r1)
/* 0000A260 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 0000A264 C80100D0 */ lfd f0, 0xd0(r1)
/* 0000A268 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A26C FC000828 */ fsub f0, f0, f1
/* 0000A270 C83F0220 */ lfd f1, 0x220(r31)
/* 0000A274 FC020032 */ fmul f0, f2, f0
/* 0000A278 FC01002A */ fadd f0, f1, f0
/* 0000A27C FC000018 */ frsp f0, f0
/* 0000A280 D001001C */ stfs f0, 0x1c(r1)
/* 0000A284 4BFF5F29 */ bl sprintf
lbl_0000A288:
/* 0000A288 4BFF5F25 */ bl reset_text_draw_settings
/* 0000A28C 88610015 */ lbz r3, 0x15(r1)
/* 0000A290 4BFF5F1D */ bl set_text_font
/* 0000A294 C0210054 */ lfs f1, 0x54(r1)
/* 0000A298 C0410058 */ lfs f2, 0x58(r1)
/* 0000A29C 4BFF5F11 */ bl set_text_scale
/* 0000A2A0 80610088 */ lwz r3, 0x88(r1)
/* 0000A2A4 4BFF5F09 */ bl func_80071B50
/* 0000A2A8 C83F0028 */ lfd f1, 0x28(r31)
/* 0000A2AC C0010060 */ lfs f0, 0x60(r1)
/* 0000A2B0 FC21002A */ fadd f1, f1, f0
/* 0000A2B4 FC200818 */ frsp f1, f1
/* 0000A2B8 4BFF5EF5 */ bl func_80071B1C
/* 0000A2BC 38600000 */ li r3, 0
/* 0000A2C0 4BFF5EED */ bl set_text_mul_color
/* 0000A2C4 88010085 */ lbz r0, 0x85(r1)
/* 0000A2C8 88610084 */ lbz r3, 0x84(r1)
/* 0000A2CC 5400402E */ slwi r0, r0, 8
/* 0000A2D0 88810086 */ lbz r4, 0x86(r1)
/* 0000A2D4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A2D8 7C830378 */ or r3, r4, r0
/* 0000A2DC 4BFF5ED1 */ bl set_text_add_color
/* 0000A2E0 C85F0030 */ lfd f2, 0x30(r31)
/* 0000A2E4 C0210018 */ lfs f1, 0x18(r1)
/* 0000A2E8 C001001C */ lfs f0, 0x1c(r1)
/* 0000A2EC FC22082A */ fadd f1, f2, f1
/* 0000A2F0 FC42002A */ fadd f2, f2, f0
/* 0000A2F4 FC200818 */ frsp f1, f1
/* 0000A2F8 FC401018 */ frsp f2, f2
/* 0000A2FC 4BFF5EB1 */ bl set_text_pos
/* 0000A300 7FC3F378 */ mr r3, r30
/* 0000A304 4BFF5EA9 */ bl u_draw_text
/* 0000A308 C0210060 */ lfs f1, 0x60(r1)
/* 0000A30C 4BFF5EA1 */ bl func_80071B1C
/* 0000A310 88010021 */ lbz r0, 0x21(r1)
/* 0000A314 88610020 */ lbz r3, 0x20(r1)
/* 0000A318 5400402E */ slwi r0, r0, 8
/* 0000A31C 88810022 */ lbz r4, 0x22(r1)
/* 0000A320 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A324 7C830378 */ or r3, r4, r0
/* 0000A328 4BFF5E85 */ bl set_text_mul_color
/* 0000A32C 88010085 */ lbz r0, 0x85(r1)
/* 0000A330 88610084 */ lbz r3, 0x84(r1)
/* 0000A334 5400402E */ slwi r0, r0, 8
/* 0000A338 88810086 */ lbz r4, 0x86(r1)
/* 0000A33C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A340 7C830378 */ or r3, r4, r0
/* 0000A344 4BFF5E69 */ bl set_text_add_color
/* 0000A348 C0210018 */ lfs f1, 0x18(r1)
/* 0000A34C C041001C */ lfs f2, 0x1c(r1)
/* 0000A350 4BFF5E5D */ bl set_text_pos
/* 0000A354 7FC3F378 */ mr r3, r30
/* 0000A358 4BFF5E55 */ bl u_draw_text
/* 0000A35C 3B5A0001 */ addi r26, r26, 1
/* 0000A360 2C1A0004 */ cmpwi r26, 4
/* 0000A364 4180FE40 */ blt lbl_0000A1A4
/* 0000A368 380000B3 */ li r0, 0xb3
/* 0000A36C 98010015 */ stb r0, 0x15(r1)
/* 0000A370 387D00F0 */ addi r3, r29, 0xf0
/* 0000A374 4BFF5E39 */ bl draw_naomi_sprite
/* 0000A378 388000FF */ li r4, 0xff
/* 0000A37C 4CC63182 */ crclr 6
/* 0000A380 98810020 */ stb r4, 0x20(r1)
/* 0000A384 38000000 */ li r0, 0
/* 0000A388 387E0000 */ addi r3, r30, 0
/* 0000A38C 98810021 */ stb r4, 0x21(r1)
/* 0000A390 389D1254 */ addi r4, r29, 0x1254
/* 0000A394 98010022 */ stb r0, 0x22(r1)
/* 0000A398 C01F0178 */ lfs f0, 0x178(r31)
/* 0000A39C D0010054 */ stfs f0, 0x54(r1)
/* 0000A3A0 80BB0000 */ lwz r5, 0(r27)
/* 0000A3A4 38A50001 */ addi r5, r5, 1
/* 0000A3A8 4BFF5E05 */ bl sprintf
/* 0000A3AC 4BFF5E01 */ bl reset_text_draw_settings
/* 0000A3B0 88610015 */ lbz r3, 0x15(r1)
/* 0000A3B4 4BFF5DF9 */ bl set_text_font
/* 0000A3B8 C0210054 */ lfs f1, 0x54(r1)
/* 0000A3BC C0410058 */ lfs f2, 0x58(r1)
/* 0000A3C0 4BFF5DED */ bl set_text_scale
/* 0000A3C4 80610088 */ lwz r3, 0x88(r1)
/* 0000A3C8 4BFF5DE5 */ bl func_80071B50
/* 0000A3CC C0210060 */ lfs f1, 0x60(r1)
/* 0000A3D0 4BFF5DDD */ bl func_80071B1C
/* 0000A3D4 88010021 */ lbz r0, 0x21(r1)
/* 0000A3D8 88610020 */ lbz r3, 0x20(r1)
/* 0000A3DC 5400402E */ slwi r0, r0, 8
/* 0000A3E0 88810022 */ lbz r4, 0x22(r1)
/* 0000A3E4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A3E8 7C830378 */ or r3, r4, r0
/* 0000A3EC 4BFF5DC1 */ bl set_text_mul_color
/* 0000A3F0 88010085 */ lbz r0, 0x85(r1)
/* 0000A3F4 88610084 */ lbz r3, 0x84(r1)
/* 0000A3F8 5400402E */ slwi r0, r0, 8
/* 0000A3FC 88810086 */ lbz r4, 0x86(r1)
/* 0000A400 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A404 7C830378 */ or r3, r4, r0
/* 0000A408 4BFF5DA5 */ bl set_text_add_color
/* 0000A40C 7FC3F378 */ mr r3, r30
/* 0000A410 4BFF5D9D */ bl u_get_text_width
/* 0000A414 C81F0058 */ lfd f0, 0x58(r31)
/* 0000A418 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000A41C FC000072 */ fmul f0, f0, f1
/* 0000A420 FC020028 */ fsub f0, f2, f0
/* 0000A424 FC000018 */ frsp f0, f0
/* 0000A428 D0010018 */ stfs f0, 0x18(r1)
/* 0000A42C C01F0190 */ lfs f0, 0x190(r31)
/* 0000A430 D001001C */ stfs f0, 0x1c(r1)
/* 0000A434 4BFF5D79 */ bl reset_text_draw_settings
/* 0000A438 88610015 */ lbz r3, 0x15(r1)
/* 0000A43C 4BFF5D71 */ bl set_text_font
/* 0000A440 C0210054 */ lfs f1, 0x54(r1)
/* 0000A444 C0410058 */ lfs f2, 0x58(r1)
/* 0000A448 4BFF5D65 */ bl set_text_scale
/* 0000A44C 80610088 */ lwz r3, 0x88(r1)
/* 0000A450 4BFF5D5D */ bl func_80071B50
/* 0000A454 C83F0028 */ lfd f1, 0x28(r31)
/* 0000A458 C0010060 */ lfs f0, 0x60(r1)
/* 0000A45C FC21002A */ fadd f1, f1, f0
/* 0000A460 FC200818 */ frsp f1, f1
/* 0000A464 4BFF5D49 */ bl func_80071B1C
/* 0000A468 38600000 */ li r3, 0
/* 0000A46C 4BFF5D41 */ bl set_text_mul_color
/* 0000A470 88010085 */ lbz r0, 0x85(r1)
/* 0000A474 88610084 */ lbz r3, 0x84(r1)
/* 0000A478 5400402E */ slwi r0, r0, 8
/* 0000A47C 88810086 */ lbz r4, 0x86(r1)
/* 0000A480 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A484 7C830378 */ or r3, r4, r0
/* 0000A488 4BFF5D25 */ bl set_text_add_color
/* 0000A48C C85F0030 */ lfd f2, 0x30(r31)
/* 0000A490 C0210018 */ lfs f1, 0x18(r1)
/* 0000A494 C001001C */ lfs f0, 0x1c(r1)
/* 0000A498 FC22082A */ fadd f1, f2, f1
/* 0000A49C FC42002A */ fadd f2, f2, f0
/* 0000A4A0 FC200818 */ frsp f1, f1
/* 0000A4A4 FC401018 */ frsp f2, f2
/* 0000A4A8 4BFF5D05 */ bl set_text_pos
/* 0000A4AC 7FC3F378 */ mr r3, r30
/* 0000A4B0 4BFF5CFD */ bl u_draw_text
/* 0000A4B4 C0210060 */ lfs f1, 0x60(r1)
/* 0000A4B8 4BFF5CF5 */ bl func_80071B1C
/* 0000A4BC 88010021 */ lbz r0, 0x21(r1)
/* 0000A4C0 88610020 */ lbz r3, 0x20(r1)
/* 0000A4C4 5400402E */ slwi r0, r0, 8
/* 0000A4C8 88810022 */ lbz r4, 0x22(r1)
/* 0000A4CC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A4D0 7C830378 */ or r3, r4, r0
/* 0000A4D4 4BFF5CD9 */ bl set_text_mul_color
/* 0000A4D8 88010085 */ lbz r0, 0x85(r1)
/* 0000A4DC 88610084 */ lbz r3, 0x84(r1)
/* 0000A4E0 5400402E */ slwi r0, r0, 8
/* 0000A4E4 88810086 */ lbz r4, 0x86(r1)
/* 0000A4E8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A4EC 7C830378 */ or r3, r4, r0
/* 0000A4F0 4BFF5CBD */ bl set_text_add_color
/* 0000A4F4 C0210018 */ lfs f1, 0x18(r1)
/* 0000A4F8 C041001C */ lfs f2, 0x1c(r1)
/* 0000A4FC 4BFF5CB1 */ bl set_text_pos
/* 0000A500 7FC3F378 */ mr r3, r30
/* 0000A504 4BFF5CA9 */ bl u_draw_text
/* 0000A508 4BFF5CA5 */ bl mathutil_mtxA_from_identity
/* 0000A50C 3C600000 */ lis r3, mathutilData@ha
/* 0000A510 38630000 */ addi r3, r3, mathutilData@l
/* 0000A514 80630000 */ lwz r3, 0(r3)
/* 0000A518 38800000 */ li r4, 0
/* 0000A51C 4BFF5C91 */ bl GXLoadPosMtxImm
/* 0000A520 BB2100E4 */ lmw r25, 0xe4(r1)
/* 0000A524 80010104 */ lwz r0, 0x104(r1)
/* 0000A528 38210100 */ addi r1, r1, 0x100
/* 0000A52C 7C0803A6 */ mtlr r0
/* 0000A530 4E800020 */ blr 
lbl_0000A534:
/* 0000A534 7C0802A6 */ mflr r0
/* 0000A538 3C600000 */ lis r3, lbl_0000C370@ha
/* 0000A53C 90010004 */ stw r0, 4(r1)
/* 0000A540 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000A544 93E1000C */ stw r31, 0xc(r1)
/* 0000A548 3BE30000 */ addi r31, r3, lbl_0000C370@l
/* 0000A54C 38600060 */ li r3, 0x60
/* 0000A550 4BFF5C5D */ bl find_sprite_with_tag
/* 0000A554 28030000 */ cmplwi r3, 0
/* 0000A558 41820018 */ beq lbl_0000A570
/* 0000A55C 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A560 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000A564 38000004 */ li r0, 4
/* 0000A568 9803013C */ stb r0, 0x13c(r3)
/* 0000A56C 48000080 */ b lbl_0000A5EC
lbl_0000A570:
/* 0000A570 38600060 */ li r3, 0x60
/* 0000A574 4BFF99F9 */ bl lbl_00003F6C
/* 0000A578 28030000 */ cmplwi r3, 0
/* 0000A57C 41820024 */ beq lbl_0000A5A0
/* 0000A580 38000004 */ li r0, 4
/* 0000A584 98030000 */ stb r0, 0(r3)
/* 0000A588 3800001E */ li r0, 0x1e
/* 0000A58C 98030001 */ stb r0, 1(r3)
/* 0000A590 C01F0024 */ lfs f0, 0x24(r31)
/* 0000A594 D0030004 */ stfs f0, 4(r3)
/* 0000A598 C01F0000 */ lfs f0, 0(r31)
/* 0000A59C D0030008 */ stfs f0, 8(r3)
lbl_0000A5A0:
/* 0000A5A0 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A5A4 C01F0098 */ lfs f0, 0x98(r31)
/* 0000A5A8 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000A5AC D0030148 */ stfs f0, 0x148(r3)
/* 0000A5B0 4BFF5BFD */ bl create_sprite
/* 0000A5B4 28030000 */ cmplwi r3, 0
/* 0000A5B8 41820034 */ beq lbl_0000A5EC
/* 0000A5BC 38000060 */ li r0, 0x60
/* 0000A5C0 3C800000 */ lis r4, lbl_00009BB4@ha
/* 0000A5C4 9803000F */ stb r0, 0xf(r3)
/* 0000A5C8 38040000 */ addi r0, r4, lbl_00009BB4@l
/* 0000A5CC 3C800000 */ lis r4, lbl_00009C3C@ha
/* 0000A5D0 90030034 */ stw r0, 0x34(r3)
/* 0000A5D4 38040000 */ addi r0, r4, lbl_00009C3C@l
/* 0000A5D8 3C800000 */ lis r4, lbl_0000D310@ha
/* 0000A5DC 90030038 */ stw r0, 0x38(r3)
/* 0000A5E0 38840000 */ addi r4, r4, lbl_0000D310@l
/* 0000A5E4 3863008C */ addi r3, r3, 0x8c
/* 0000A5E8 4BFF5BC5 */ bl strcpy
lbl_0000A5EC:
/* 0000A5EC 80010014 */ lwz r0, 0x14(r1)
/* 0000A5F0 83E1000C */ lwz r31, 0xc(r1)
/* 0000A5F4 38210010 */ addi r1, r1, 0x10
/* 0000A5F8 7C0803A6 */ mtlr r0
/* 0000A5FC 4E800020 */ blr 
lbl_0000A600:
/* 0000A600 7C0802A6 */ mflr r0
/* 0000A604 3CA00000 */ lis r5, lbl_0000C370@ha
/* 0000A608 90010004 */ stw r0, 4(r1)
/* 0000A60C 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000A610 93E1001C */ stw r31, 0x1c(r1)
/* 0000A614 3BE50000 */ addi r31, r5, lbl_0000C370@l
/* 0000A618 4BFF99D9 */ bl lbl_00003FF0
/* 0000A61C 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A620 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A624 38830000 */ addi r4, r3, lbl_10000000@l
/* 0000A628 C87F0210 */ lfd f3, 0x210(r31)
/* 0000A62C 80040174 */ lwz r0, 0x174(r4)
/* 0000A630 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000A634 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000A638 6C008000 */ xoris r0, r0, 0x8000
/* 0000A63C C4A40168 */ lfsu f5, 0x168(r4)
/* 0000A640 90010014 */ stw r0, 0x14(r1)
/* 0000A644 3C004330 */ lis r0, 0x4330
/* 0000A648 C89F0058 */ lfd f4, 0x58(r31)
/* 0000A64C 90010010 */ stw r0, 0x10(r1)
/* 0000A650 C8010010 */ lfd f0, 0x10(r1)
/* 0000A654 FC000828 */ fsub f0, f0, f1
/* 0000A658 FC020032 */ fmul f0, f2, f0
/* 0000A65C FC03002A */ fadd f0, f3, f0
/* 0000A660 FC002828 */ fsub f0, f0, f5
/* 0000A664 FC040032 */ fmul f0, f4, f0
/* 0000A668 FC05002A */ fadd f0, f5, f0
/* 0000A66C FC000018 */ frsp f0, f0
/* 0000A670 D0040000 */ stfs f0, 0(r4)
/* 0000A674 80010024 */ lwz r0, 0x24(r1)
/* 0000A678 83E1001C */ lwz r31, 0x1c(r1)
/* 0000A67C 38210020 */ addi r1, r1, 0x20
/* 0000A680 7C0803A6 */ mtlr r0
/* 0000A684 4E800020 */ blr 
lbl_0000A688:
/* 0000A688 7C0802A6 */ mflr r0
/* 0000A68C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 0000A690 90010004 */ stw r0, 4(r1)
/* 0000A694 9421FEE8 */ stwu r1, -0x118(r1)
/* 0000A698 BF0100F8 */ stmw r24, 0xf8(r1)
/* 0000A69C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 0000A6A0 3C800000 */ lis r4, lbl_0000C370@ha
/* 0000A6A4 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 0000A6A8 8863000F */ lbz r3, 0xf(r3)
/* 0000A6AC 7C630774 */ extsb r3, r3
/* 0000A6B0 4BFF98BD */ bl lbl_00003F6C
/* 0000A6B4 28030000 */ cmplwi r3, 0
/* 0000A6B8 41820040 */ beq lbl_0000A6F8
/* 0000A6BC C05F0000 */ lfs f2, 0(r31)
/* 0000A6C0 C0230004 */ lfs f1, 4(r3)
/* 0000A6C4 C0030008 */ lfs f0, 8(r3)
/* 0000A6C8 FC601090 */ fmr f3, f2
/* 0000A6CC EC21002A */ fadds f1, f1, f0
/* 0000A6D0 4BFF5ADD */ bl mathutil_mtxA_from_translate_xyz
/* 0000A6D4 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A6D8 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000A6DC 38630184 */ addi r3, r3, 0x184
/* 0000A6E0 4BFF5ACD */ bl mathutil_mtxA_to_mtx
/* 0000A6E4 3C600000 */ lis r3, mathutilData@ha
/* 0000A6E8 38630000 */ addi r3, r3, mathutilData@l
/* 0000A6EC 80630000 */ lwz r3, 0(r3)
/* 0000A6F0 38800000 */ li r4, 0
/* 0000A6F4 4BFF5AB9 */ bl GXLoadPosMtxImm
lbl_0000A6F8:
/* 0000A6F8 7FA3EB78 */ mr r3, r29
/* 0000A6FC 4BFF5AB1 */ bl draw_naomi_sprite
/* 0000A700 C01F0088 */ lfs f0, 0x88(r31)
/* 0000A704 3BC100A0 */ addi r30, r1, 0xa0
/* 0000A708 388000B3 */ li r4, 0xb3
/* 0000A70C D0010060 */ stfs f0, 0x60(r1)
/* 0000A710 3B400000 */ li r26, 0
/* 0000A714 3C000020 */ lis r0, 0x20
/* 0000A718 C01F0060 */ lfs f0, 0x60(r31)
/* 0000A71C 7FC3F378 */ mr r3, r30
/* 0000A720 D0010054 */ stfs f0, 0x54(r1)
/* 0000A724 C01F0060 */ lfs f0, 0x60(r31)
/* 0000A728 D0010058 */ stfs f0, 0x58(r1)
/* 0000A72C 98810015 */ stb r4, 0x15(r1)
/* 0000A730 389D1174 */ addi r4, r29, 0x1174
/* 0000A734 9B410084 */ stb r26, 0x84(r1)
/* 0000A738 9B410085 */ stb r26, 0x85(r1)
/* 0000A73C 9B410086 */ stb r26, 0x86(r1)
/* 0000A740 90010088 */ stw r0, 0x88(r1)
/* 0000A744 4BFF5A69 */ bl strcpy
/* 0000A748 4BFF5A65 */ bl reset_text_draw_settings
/* 0000A74C 88610015 */ lbz r3, 0x15(r1)
/* 0000A750 4BFF5A5D */ bl set_text_font
/* 0000A754 C0210054 */ lfs f1, 0x54(r1)
/* 0000A758 C0410058 */ lfs f2, 0x58(r1)
/* 0000A75C 4BFF5A51 */ bl set_text_scale
/* 0000A760 80610088 */ lwz r3, 0x88(r1)
/* 0000A764 4BFF5A49 */ bl func_80071B50
/* 0000A768 C0210060 */ lfs f1, 0x60(r1)
/* 0000A76C 4BFF5A41 */ bl func_80071B1C
/* 0000A770 88010021 */ lbz r0, 0x21(r1)
/* 0000A774 88610020 */ lbz r3, 0x20(r1)
/* 0000A778 5400402E */ slwi r0, r0, 8
/* 0000A77C 88810022 */ lbz r4, 0x22(r1)
/* 0000A780 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A784 7C830378 */ or r3, r4, r0
/* 0000A788 4BFF5A25 */ bl set_text_mul_color
/* 0000A78C 88010085 */ lbz r0, 0x85(r1)
/* 0000A790 88610084 */ lbz r3, 0x84(r1)
/* 0000A794 5400402E */ slwi r0, r0, 8
/* 0000A798 88810086 */ lbz r4, 0x86(r1)
/* 0000A79C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A7A0 7C830378 */ or r3, r4, r0
/* 0000A7A4 4BFF5A09 */ bl set_text_add_color
/* 0000A7A8 7FC3F378 */ mr r3, r30
/* 0000A7AC 4BFF5A01 */ bl u_get_text_width
/* 0000A7B0 C81F0058 */ lfd f0, 0x58(r31)
/* 0000A7B4 3B6000FF */ li r27, 0xff
/* 0000A7B8 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000A7BC FC000072 */ fmul f0, f0, f1
/* 0000A7C0 FC020028 */ fsub f0, f2, f0
/* 0000A7C4 FC000018 */ frsp f0, f0
/* 0000A7C8 D0010018 */ stfs f0, 0x18(r1)
/* 0000A7CC C01F0090 */ lfs f0, 0x90(r31)
/* 0000A7D0 D001001C */ stfs f0, 0x1c(r1)
/* 0000A7D4 9B610020 */ stb r27, 0x20(r1)
/* 0000A7D8 9B610021 */ stb r27, 0x21(r1)
/* 0000A7DC 9B410022 */ stb r26, 0x22(r1)
/* 0000A7E0 4BFF59CD */ bl reset_text_draw_settings
/* 0000A7E4 88610015 */ lbz r3, 0x15(r1)
/* 0000A7E8 4BFF59C5 */ bl set_text_font
/* 0000A7EC C0210054 */ lfs f1, 0x54(r1)
/* 0000A7F0 C0410058 */ lfs f2, 0x58(r1)
/* 0000A7F4 4BFF59B9 */ bl set_text_scale
/* 0000A7F8 80610088 */ lwz r3, 0x88(r1)
/* 0000A7FC 4BFF59B1 */ bl func_80071B50
/* 0000A800 C83F0028 */ lfd f1, 0x28(r31)
/* 0000A804 C0010060 */ lfs f0, 0x60(r1)
/* 0000A808 FC21002A */ fadd f1, f1, f0
/* 0000A80C FC200818 */ frsp f1, f1
/* 0000A810 4BFF599D */ bl func_80071B1C
/* 0000A814 38600000 */ li r3, 0
/* 0000A818 4BFF5995 */ bl set_text_mul_color
/* 0000A81C 88010085 */ lbz r0, 0x85(r1)
/* 0000A820 88610084 */ lbz r3, 0x84(r1)
/* 0000A824 5400402E */ slwi r0, r0, 8
/* 0000A828 88810086 */ lbz r4, 0x86(r1)
/* 0000A82C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A830 7C830378 */ or r3, r4, r0
/* 0000A834 4BFF5979 */ bl set_text_add_color
/* 0000A838 C85F0030 */ lfd f2, 0x30(r31)
/* 0000A83C C0210018 */ lfs f1, 0x18(r1)
/* 0000A840 C001001C */ lfs f0, 0x1c(r1)
/* 0000A844 FC22082A */ fadd f1, f2, f1
/* 0000A848 FC42002A */ fadd f2, f2, f0
/* 0000A84C FC200818 */ frsp f1, f1
/* 0000A850 FC401018 */ frsp f2, f2
/* 0000A854 4BFF5959 */ bl set_text_pos
/* 0000A858 7FC3F378 */ mr r3, r30
/* 0000A85C 4BFF5951 */ bl u_draw_text
/* 0000A860 C0210060 */ lfs f1, 0x60(r1)
/* 0000A864 4BFF5949 */ bl func_80071B1C
/* 0000A868 88010021 */ lbz r0, 0x21(r1)
/* 0000A86C 88610020 */ lbz r3, 0x20(r1)
/* 0000A870 5400402E */ slwi r0, r0, 8
/* 0000A874 88810022 */ lbz r4, 0x22(r1)
/* 0000A878 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A87C 7C830378 */ or r3, r4, r0
/* 0000A880 4BFF592D */ bl set_text_mul_color
/* 0000A884 88010085 */ lbz r0, 0x85(r1)
/* 0000A888 88610084 */ lbz r3, 0x84(r1)
/* 0000A88C 5400402E */ slwi r0, r0, 8
/* 0000A890 88810086 */ lbz r4, 0x86(r1)
/* 0000A894 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A898 7C830378 */ or r3, r4, r0
/* 0000A89C 4BFF5911 */ bl set_text_add_color
/* 0000A8A0 C0210018 */ lfs f1, 0x18(r1)
/* 0000A8A4 C041001C */ lfs f2, 0x1c(r1)
/* 0000A8A8 4BFF5905 */ bl set_text_pos
/* 0000A8AC 7FC3F378 */ mr r3, r30
/* 0000A8B0 4BFF58FD */ bl u_draw_text
/* 0000A8B4 C01F0064 */ lfs f0, 0x64(r31)
/* 0000A8B8 387D128C */ addi r3, r29, 0x128c
/* 0000A8BC D01D1290 */ stfs f0, 0x1290(r29)
/* 0000A8C0 C01F0238 */ lfs f0, 0x238(r31)
/* 0000A8C4 D01D1294 */ stfs f0, 0x1294(r29)
/* 0000A8C8 C01F023C */ lfs f0, 0x23c(r31)
/* 0000A8CC D01D129C */ stfs f0, 0x129c(r29)
/* 0000A8D0 C01F015C */ lfs f0, 0x15c(r31)
/* 0000A8D4 D01D12A0 */ stfs f0, 0x12a0(r29)
/* 0000A8D8 C03F0148 */ lfs f1, 0x148(r31)
/* 0000A8DC C05F009C */ lfs f2, 0x9c(r31)
/* 0000A8E0 4BFF99DD */ bl lbl_000042BC
/* 0000A8E4 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A8E8 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000A8EC 3B830178 */ addi r28, r3, 0x178
/* 0000A8F0 80030178 */ lwz r0, 0x178(r3)
/* 0000A8F4 2C000001 */ cmpwi r0, 1
/* 0000A8F8 4082001C */ bne lbl_0000A914
/* 0000A8FC 380000EF */ li r0, 0xef
/* 0000A900 98010020 */ stb r0, 0x20(r1)
/* 0000A904 3800009A */ li r0, 0x9a
/* 0000A908 98010021 */ stb r0, 0x21(r1)
/* 0000A90C 9B410022 */ stb r26, 0x22(r1)
/* 0000A910 48000010 */ b lbl_0000A920
lbl_0000A914:
/* 0000A914 9B610020 */ stb r27, 0x20(r1)
/* 0000A918 9B610021 */ stb r27, 0x21(r1)
/* 0000A91C 9B410022 */ stb r26, 0x22(r1)
lbl_0000A920:
/* 0000A920 C01F00A4 */ lfs f0, 0xa4(r31)
/* 0000A924 3B200000 */ li r25, 0
/* 0000A928 573A1838 */ slwi r26, r25, 3
/* 0000A92C D0010054 */ stfs f0, 0x54(r1)
/* 0000A930 3F604330 */ lis r27, 0x4330
/* 0000A934 801C0000 */ lwz r0, 0(r28)
/* 0000A938 54001838 */ slwi r0, r0, 3
/* 0000A93C 7F1D0214 */ add r24, r29, r0
/* 0000A940 3B1814E4 */ addi r24, r24, 0x14e4
/* 0000A944 480001D4 */ b lbl_0000AB18
lbl_0000A948:
/* 0000A948 80980000 */ lwz r4, 0(r24)
/* 0000A94C 7FC3F378 */ mr r3, r30
/* 0000A950 7C84D02E */ lwzx r4, r4, r26
/* 0000A954 4BFF5859 */ bl strcpy
/* 0000A958 4BFF5855 */ bl reset_text_draw_settings
/* 0000A95C 88610015 */ lbz r3, 0x15(r1)
/* 0000A960 4BFF584D */ bl set_text_font
/* 0000A964 C0210054 */ lfs f1, 0x54(r1)
/* 0000A968 C0410058 */ lfs f2, 0x58(r1)
/* 0000A96C 4BFF5841 */ bl set_text_scale
/* 0000A970 80610088 */ lwz r3, 0x88(r1)
/* 0000A974 4BFF5839 */ bl func_80071B50
/* 0000A978 C0210060 */ lfs f1, 0x60(r1)
/* 0000A97C 4BFF5831 */ bl func_80071B1C
/* 0000A980 88010021 */ lbz r0, 0x21(r1)
/* 0000A984 88610020 */ lbz r3, 0x20(r1)
/* 0000A988 5400402E */ slwi r0, r0, 8
/* 0000A98C 88810022 */ lbz r4, 0x22(r1)
/* 0000A990 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A994 7C830378 */ or r3, r4, r0
/* 0000A998 4BFF5815 */ bl set_text_mul_color
/* 0000A99C 88010085 */ lbz r0, 0x85(r1)
/* 0000A9A0 88610084 */ lbz r3, 0x84(r1)
/* 0000A9A4 5400402E */ slwi r0, r0, 8
/* 0000A9A8 88810086 */ lbz r4, 0x86(r1)
/* 0000A9AC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A9B0 7C830378 */ or r3, r4, r0
/* 0000A9B4 4BFF57F9 */ bl set_text_add_color
/* 0000A9B8 7FC3F378 */ mr r3, r30
/* 0000A9BC 4BFF57F1 */ bl u_get_text_width
/* 0000A9C0 C81F0058 */ lfd f0, 0x58(r31)
/* 0000A9C4 6F208000 */ xoris r0, r25, 0x8000
/* 0000A9C8 900100EC */ stw r0, 0xec(r1)
/* 0000A9CC 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000A9D0 FC000072 */ fmul f0, f0, f1
/* 0000A9D4 C83F00A8 */ lfd f1, 0xa8(r31)
/* 0000A9D8 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000A9DC 936100E8 */ stw r27, 0xe8(r1)
/* 0000A9E0 FC210028 */ fsub f1, f1, f0
/* 0000A9E4 C80100E8 */ lfd f0, 0xe8(r1)
/* 0000A9E8 FC200818 */ frsp f1, f1
/* 0000A9EC D0210018 */ stfs f1, 0x18(r1)
/* 0000A9F0 80B80004 */ lwz r5, 4(r24)
/* 0000A9F4 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000A9F8 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000A9FC C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 0000AA00 6C008000 */ xoris r0, r0, 0x8000
/* 0000AA04 FC000828 */ fsub f0, f0, f1
/* 0000AA08 900100F4 */ stw r0, 0xf4(r1)
/* 0000AA0C C83F0080 */ lfd f1, 0x80(r31)
/* 0000AA10 936100F0 */ stw r27, 0xf0(r1)
/* 0000AA14 FC010032 */ fmul f0, f1, f0
/* 0000AA18 C87F00B8 */ lfd f3, 0xb8(r31)
/* 0000AA1C C82100F0 */ lfd f1, 0xf0(r1)
/* 0000AA20 C89F00B0 */ lfd f4, 0xb0(r31)
/* 0000AA24 FC211028 */ fsub f1, f1, f2
/* 0000AA28 FC230072 */ fmul f1, f3, f1
/* 0000AA2C FC240828 */ fsub f1, f4, f1
/* 0000AA30 FC01002A */ fadd f0, f1, f0
/* 0000AA34 FC000018 */ frsp f0, f0
/* 0000AA38 D001001C */ stfs f0, 0x1c(r1)
/* 0000AA3C 4BFF5771 */ bl reset_text_draw_settings
/* 0000AA40 88610015 */ lbz r3, 0x15(r1)
/* 0000AA44 4BFF5769 */ bl set_text_font
/* 0000AA48 C0210054 */ lfs f1, 0x54(r1)
/* 0000AA4C C0410058 */ lfs f2, 0x58(r1)
/* 0000AA50 4BFF575D */ bl set_text_scale
/* 0000AA54 80610088 */ lwz r3, 0x88(r1)
/* 0000AA58 4BFF5755 */ bl func_80071B50
/* 0000AA5C C83F0028 */ lfd f1, 0x28(r31)
/* 0000AA60 C0010060 */ lfs f0, 0x60(r1)
/* 0000AA64 FC21002A */ fadd f1, f1, f0
/* 0000AA68 FC200818 */ frsp f1, f1
/* 0000AA6C 4BFF5741 */ bl func_80071B1C
/* 0000AA70 38600000 */ li r3, 0
/* 0000AA74 4BFF5739 */ bl set_text_mul_color
/* 0000AA78 88010085 */ lbz r0, 0x85(r1)
/* 0000AA7C 88610084 */ lbz r3, 0x84(r1)
/* 0000AA80 5400402E */ slwi r0, r0, 8
/* 0000AA84 88810086 */ lbz r4, 0x86(r1)
/* 0000AA88 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AA8C 7C830378 */ or r3, r4, r0
/* 0000AA90 4BFF571D */ bl set_text_add_color
/* 0000AA94 C85F0030 */ lfd f2, 0x30(r31)
/* 0000AA98 C0210018 */ lfs f1, 0x18(r1)
/* 0000AA9C C001001C */ lfs f0, 0x1c(r1)
/* 0000AAA0 FC22082A */ fadd f1, f2, f1
/* 0000AAA4 FC42002A */ fadd f2, f2, f0
/* 0000AAA8 FC200818 */ frsp f1, f1
/* 0000AAAC FC401018 */ frsp f2, f2
/* 0000AAB0 4BFF56FD */ bl set_text_pos
/* 0000AAB4 7FC3F378 */ mr r3, r30
/* 0000AAB8 4BFF56F5 */ bl u_draw_text
/* 0000AABC C0210060 */ lfs f1, 0x60(r1)
/* 0000AAC0 4BFF56ED */ bl func_80071B1C
/* 0000AAC4 88010021 */ lbz r0, 0x21(r1)
/* 0000AAC8 88610020 */ lbz r3, 0x20(r1)
/* 0000AACC 5400402E */ slwi r0, r0, 8
/* 0000AAD0 88810022 */ lbz r4, 0x22(r1)
/* 0000AAD4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AAD8 7C830378 */ or r3, r4, r0
/* 0000AADC 4BFF56D1 */ bl set_text_mul_color
/* 0000AAE0 88010085 */ lbz r0, 0x85(r1)
/* 0000AAE4 88610084 */ lbz r3, 0x84(r1)
/* 0000AAE8 5400402E */ slwi r0, r0, 8
/* 0000AAEC 88810086 */ lbz r4, 0x86(r1)
/* 0000AAF0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AAF4 7C830378 */ or r3, r4, r0
/* 0000AAF8 4BFF56B5 */ bl set_text_add_color
/* 0000AAFC C0210018 */ lfs f1, 0x18(r1)
/* 0000AB00 C041001C */ lfs f2, 0x1c(r1)
/* 0000AB04 4BFF56A9 */ bl set_text_pos
/* 0000AB08 7FC3F378 */ mr r3, r30
/* 0000AB0C 4BFF56A1 */ bl u_draw_text
/* 0000AB10 3B5A0008 */ addi r26, r26, 8
/* 0000AB14 3B390001 */ addi r25, r25, 1
lbl_0000AB18:
/* 0000AB18 80180004 */ lwz r0, 4(r24)
/* 0000AB1C 7C190000 */ cmpw r25, r0
/* 0000AB20 4180FE28 */ blt lbl_0000A948
/* 0000AB24 80780000 */ lwz r3, 0(r24)
/* 0000AB28 381D135C */ addi r0, r29, 0x135c
/* 0000AB2C 7C030040 */ cmplw r3, r0
/* 0000AB30 4082018C */ bne lbl_0000ACBC
/* 0000AB34 380000FF */ li r0, 0xff
/* 0000AB38 98010020 */ stb r0, 0x20(r1)
/* 0000AB3C 3B000000 */ li r24, 0
/* 0000AB40 3B3D1398 */ addi r25, r29, 0x1398
/* 0000AB44 98010021 */ stb r0, 0x21(r1)
/* 0000AB48 571A1838 */ slwi r26, r24, 3
/* 0000AB4C 3F604330 */ lis r27, 0x4330
/* 0000AB50 98010022 */ stb r0, 0x22(r1)
/* 0000AB54 4800015C */ b lbl_0000ACB0
lbl_0000AB58:
/* 0000AB58 C01F0240 */ lfs f0, 0x240(r31)
/* 0000AB5C 6F008000 */ xoris r0, r24, 0x8000
/* 0000AB60 900100F4 */ stw r0, 0xf4(r1)
/* 0000AB64 3CA00000 */ lis r5, lbl_0000C380@ha
/* 0000AB68 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000AB6C D0010018 */ stfs f0, 0x18(r1)
/* 0000AB70 7FC3F378 */ mr r3, r30
/* 0000AB74 80D90004 */ lwz r6, 4(r25)
/* 0000AB78 936100F0 */ stw r27, 0xf0(r1)
/* 0000AB7C 3806FFFF */ addi r0, r6, -1  ;# fixed addi
/* 0000AB80 C8650000 */ lfd f3, lbl_0000C380@l(r5)
/* 0000AB84 6C008000 */ xoris r0, r0, 0x8000
/* 0000AB88 C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 0000AB8C 900100EC */ stw r0, 0xec(r1)
/* 0000AB90 C80100F0 */ lfd f0, 0xf0(r1)
/* 0000AB94 936100E8 */ stw r27, 0xe8(r1)
/* 0000AB98 FC000828 */ fsub f0, f0, f1
/* 0000AB9C C83F0080 */ lfd f1, 0x80(r31)
/* 0000ABA0 C84100E8 */ lfd f2, 0xe8(r1)
/* 0000ABA4 C89F00B8 */ lfd f4, 0xb8(r31)
/* 0000ABA8 FC421828 */ fsub f2, f2, f3
/* 0000ABAC FC010032 */ fmul f0, f1, f0
/* 0000ABB0 C87F00B0 */ lfd f3, 0xb0(r31)
/* 0000ABB4 FC2400B2 */ fmul f1, f4, f2
/* 0000ABB8 FC230828 */ fsub f1, f3, f1
/* 0000ABBC FC01002A */ fadd f0, f1, f0
/* 0000ABC0 FC000018 */ frsp f0, f0
/* 0000ABC4 D001001C */ stfs f0, 0x1c(r1)
/* 0000ABC8 80990000 */ lwz r4, 0(r25)
/* 0000ABCC 7C84D02E */ lwzx r4, r4, r26
/* 0000ABD0 4BFF55DD */ bl strcpy
/* 0000ABD4 4BFF55D9 */ bl reset_text_draw_settings
/* 0000ABD8 88610015 */ lbz r3, 0x15(r1)
/* 0000ABDC 4BFF55D1 */ bl set_text_font
/* 0000ABE0 C0210054 */ lfs f1, 0x54(r1)
/* 0000ABE4 C0410058 */ lfs f2, 0x58(r1)
/* 0000ABE8 4BFF55C5 */ bl set_text_scale
/* 0000ABEC 80610088 */ lwz r3, 0x88(r1)
/* 0000ABF0 4BFF55BD */ bl func_80071B50
/* 0000ABF4 C83F0028 */ lfd f1, 0x28(r31)
/* 0000ABF8 C0010060 */ lfs f0, 0x60(r1)
/* 0000ABFC FC21002A */ fadd f1, f1, f0
/* 0000AC00 FC200818 */ frsp f1, f1
/* 0000AC04 4BFF55A9 */ bl func_80071B1C
/* 0000AC08 38600000 */ li r3, 0
/* 0000AC0C 4BFF55A1 */ bl set_text_mul_color
/* 0000AC10 88010085 */ lbz r0, 0x85(r1)
/* 0000AC14 88610084 */ lbz r3, 0x84(r1)
/* 0000AC18 5400402E */ slwi r0, r0, 8
/* 0000AC1C 88810086 */ lbz r4, 0x86(r1)
/* 0000AC20 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AC24 7C830378 */ or r3, r4, r0
/* 0000AC28 4BFF5585 */ bl set_text_add_color
/* 0000AC2C C85F0030 */ lfd f2, 0x30(r31)
/* 0000AC30 C0210018 */ lfs f1, 0x18(r1)
/* 0000AC34 C001001C */ lfs f0, 0x1c(r1)
/* 0000AC38 FC22082A */ fadd f1, f2, f1
/* 0000AC3C FC42002A */ fadd f2, f2, f0
/* 0000AC40 FC200818 */ frsp f1, f1
/* 0000AC44 FC401018 */ frsp f2, f2
/* 0000AC48 4BFF5565 */ bl set_text_pos
/* 0000AC4C 7FC3F378 */ mr r3, r30
/* 0000AC50 4BFF555D */ bl u_draw_text
/* 0000AC54 C0210060 */ lfs f1, 0x60(r1)
/* 0000AC58 4BFF5555 */ bl func_80071B1C
/* 0000AC5C 88010021 */ lbz r0, 0x21(r1)
/* 0000AC60 88610020 */ lbz r3, 0x20(r1)
/* 0000AC64 5400402E */ slwi r0, r0, 8
/* 0000AC68 88810022 */ lbz r4, 0x22(r1)
/* 0000AC6C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AC70 7C830378 */ or r3, r4, r0
/* 0000AC74 4BFF5539 */ bl set_text_mul_color
/* 0000AC78 88010085 */ lbz r0, 0x85(r1)
/* 0000AC7C 88610084 */ lbz r3, 0x84(r1)
/* 0000AC80 5400402E */ slwi r0, r0, 8
/* 0000AC84 88810086 */ lbz r4, 0x86(r1)
/* 0000AC88 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AC8C 7C830378 */ or r3, r4, r0
/* 0000AC90 4BFF551D */ bl set_text_add_color
/* 0000AC94 C0210018 */ lfs f1, 0x18(r1)
/* 0000AC98 C041001C */ lfs f2, 0x1c(r1)
/* 0000AC9C 4BFF5511 */ bl set_text_pos
/* 0000ACA0 7FC3F378 */ mr r3, r30
/* 0000ACA4 4BFF5509 */ bl u_draw_text
/* 0000ACA8 3B5A0008 */ addi r26, r26, 8
/* 0000ACAC 3B180001 */ addi r24, r24, 1
lbl_0000ACB0:
/* 0000ACB0 80190004 */ lwz r0, 4(r25)
/* 0000ACB4 7C180000 */ cmpw r24, r0
/* 0000ACB8 4180FEA0 */ blt lbl_0000AB58
lbl_0000ACBC:
/* 0000ACBC C01F0060 */ lfs f0, 0x60(r31)
/* 0000ACC0 D0010054 */ stfs f0, 0x54(r1)
/* 0000ACC4 801C0000 */ lwz r0, 0(r28)
/* 0000ACC8 2C000001 */ cmpwi r0, 1
/* 0000ACCC 40820348 */ bne lbl_0000B014
/* 0000ACD0 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000ACD4 C85F0250 */ lfd f2, 0x250(r31)
/* 0000ACD8 38830000 */ addi r4, r3, unpausedFrameCounter@l
/* 0000ACDC C89F0248 */ lfd f4, 0x248(r31)
/* 0000ACE0 3C608889 */ lis r3, 0x8889
/* 0000ACE4 80840000 */ lwz r4, 0(r4)
/* 0000ACE8 38038889 */ addi r0, r3, -30583  ;# fixed addi
/* 0000ACEC 7C002016 */ mulhwu r0, r0, r4
/* 0000ACF0 5400D97E */ srwi r0, r0, 5
/* 0000ACF4 1C00003C */ mulli r0, r0, 0x3c
/* 0000ACF8 7C002050 */ subf r0, r0, r4
/* 0000ACFC 900100EC */ stw r0, 0xec(r1)
/* 0000AD00 3CA04330 */ lis r5, 0x4330
/* 0000AD04 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 0000AD08 90A100E8 */ stw r5, 0xe8(r1)
/* 0000AD0C 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000AD10 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 0000AD14 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000AD18 C80100E8 */ lfd f0, 0xe8(r1)
/* 0000AD1C C8640000 */ lfd f3, lbl_0000C380@l(r4)
/* 0000AD20 EC000828 */ fsubs f0, f0, f1
/* 0000AD24 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000AD28 FC00001E */ fctiwz f0, f0
/* 0000AD2C D80100F0 */ stfd f0, 0xf0(r1)
/* 0000AD30 800100F4 */ lwz r0, 0xf4(r1)
/* 0000AD34 6C008000 */ xoris r0, r0, 0x8000
/* 0000AD38 900100E4 */ stw r0, 0xe4(r1)
/* 0000AD3C 90A100E0 */ stw r5, 0xe0(r1)
/* 0000AD40 C80100E0 */ lfd f0, 0xe0(r1)
/* 0000AD44 FC001828 */ fsub f0, f0, f3
/* 0000AD48 FC001028 */ fsub f0, f0, f2
/* 0000AD4C FC00001E */ fctiwz f0, f0
/* 0000AD50 D80100D8 */ stfd f0, 0xd8(r1)
/* 0000AD54 800100DC */ lwz r0, 0xdc(r1)
/* 0000AD58 7C03FE70 */ srawi r3, r0, 0x1f
/* 0000AD5C 7C600278 */ xor r0, r3, r0
/* 0000AD60 7C030050 */ subf r0, r3, r0
/* 0000AD64 6C008000 */ xoris r0, r0, 0x8000
/* 0000AD68 900100D4 */ stw r0, 0xd4(r1)
/* 0000AD6C 90A100D0 */ stw r5, 0xd0(r1)
/* 0000AD70 C80100D0 */ lfd f0, 0xd0(r1)
/* 0000AD74 EC000828 */ fsubs f0, f0, f1
/* 0000AD78 FC001024 */ fdiv f0, f0, f2
/* 0000AD7C FC240032 */ fmul f1, f4, f0
/* 0000AD80 4BFF542D */ bl __cvt_fp2unsigned
/* 0000AD84 C01F0258 */ lfs f0, 0x258(r31)
/* 0000AD88 3C800000 */ lis r4, lbl_10000000@ha
/* 0000AD8C 38840000 */ addi r4, r4, lbl_10000000@l
/* 0000AD90 D0010018 */ stfs f0, 0x18(r1)
/* 0000AD94 3B440174 */ addi r26, r4, 0x174
/* 0000AD98 3B830000 */ addi r28, r3, 0
/* 0000AD9C C01F01CC */ lfs f0, 0x1cc(r31)
/* 0000ADA0 D001001C */ stfs f0, 0x1c(r1)
/* 0000ADA4 80040174 */ lwz r0, 0x174(r4)
/* 0000ADA8 2C000000 */ cmpwi r0, 0
/* 0000ADAC 40820028 */ bne lbl_0000ADD4
/* 0000ADB0 3860008F */ li r3, 0x8f
/* 0000ADB4 98610020 */ stb r3, 0x20(r1)
/* 0000ADB8 38000000 */ li r0, 0
/* 0000ADBC 98610021 */ stb r3, 0x21(r1)
/* 0000ADC0 98010022 */ stb r0, 0x22(r1)
/* 0000ADC4 98010084 */ stb r0, 0x84(r1)
/* 0000ADC8 98010085 */ stb r0, 0x85(r1)
/* 0000ADCC 98010086 */ stb r0, 0x86(r1)
/* 0000ADD0 48000024 */ b lbl_0000ADF4
lbl_0000ADD4:
/* 0000ADD4 386000FF */ li r3, 0xff
/* 0000ADD8 98610020 */ stb r3, 0x20(r1)
/* 0000ADDC 38000000 */ li r0, 0
/* 0000ADE0 98610021 */ stb r3, 0x21(r1)
/* 0000ADE4 98010022 */ stb r0, 0x22(r1)
/* 0000ADE8 9B810084 */ stb r28, 0x84(r1)
/* 0000ADEC 9B810085 */ stb r28, 0x85(r1)
/* 0000ADF0 9B810086 */ stb r28, 0x86(r1)
lbl_0000ADF4:
/* 0000ADF4 387E0000 */ addi r3, r30, 0
/* 0000ADF8 389D03C8 */ addi r4, r29, 0x3c8
/* 0000ADFC 4BFF53B1 */ bl strcpy
/* 0000AE00 4BFF53AD */ bl reset_text_draw_settings
/* 0000AE04 88610015 */ lbz r3, 0x15(r1)
/* 0000AE08 4BFF53A5 */ bl set_text_font
/* 0000AE0C C0210054 */ lfs f1, 0x54(r1)
/* 0000AE10 C0410058 */ lfs f2, 0x58(r1)
/* 0000AE14 4BFF5399 */ bl set_text_scale
/* 0000AE18 80610088 */ lwz r3, 0x88(r1)
/* 0000AE1C 4BFF5391 */ bl func_80071B50
/* 0000AE20 C83F0028 */ lfd f1, 0x28(r31)
/* 0000AE24 C0010060 */ lfs f0, 0x60(r1)
/* 0000AE28 FC21002A */ fadd f1, f1, f0
/* 0000AE2C FC200818 */ frsp f1, f1
/* 0000AE30 4BFF537D */ bl func_80071B1C
/* 0000AE34 38600000 */ li r3, 0
/* 0000AE38 4BFF5375 */ bl set_text_mul_color
/* 0000AE3C 88010085 */ lbz r0, 0x85(r1)
/* 0000AE40 88610084 */ lbz r3, 0x84(r1)
/* 0000AE44 5400402E */ slwi r0, r0, 8
/* 0000AE48 88810086 */ lbz r4, 0x86(r1)
/* 0000AE4C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AE50 7C830378 */ or r3, r4, r0
/* 0000AE54 4BFF5359 */ bl set_text_add_color
/* 0000AE58 C85F0030 */ lfd f2, 0x30(r31)
/* 0000AE5C C0210018 */ lfs f1, 0x18(r1)
/* 0000AE60 C001001C */ lfs f0, 0x1c(r1)
/* 0000AE64 FC22082A */ fadd f1, f2, f1
/* 0000AE68 FC42002A */ fadd f2, f2, f0
/* 0000AE6C FC200818 */ frsp f1, f1
/* 0000AE70 FC401018 */ frsp f2, f2
/* 0000AE74 4BFF5339 */ bl set_text_pos
/* 0000AE78 7FC3F378 */ mr r3, r30
/* 0000AE7C 4BFF5331 */ bl u_draw_text
/* 0000AE80 C0210060 */ lfs f1, 0x60(r1)
/* 0000AE84 4BFF5329 */ bl func_80071B1C
/* 0000AE88 88010021 */ lbz r0, 0x21(r1)
/* 0000AE8C 88610020 */ lbz r3, 0x20(r1)
/* 0000AE90 5400402E */ slwi r0, r0, 8
/* 0000AE94 88810022 */ lbz r4, 0x22(r1)
/* 0000AE98 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AE9C 7C830378 */ or r3, r4, r0
/* 0000AEA0 4BFF530D */ bl set_text_mul_color
/* 0000AEA4 88010085 */ lbz r0, 0x85(r1)
/* 0000AEA8 88610084 */ lbz r3, 0x84(r1)
/* 0000AEAC 5400402E */ slwi r0, r0, 8
/* 0000AEB0 88810086 */ lbz r4, 0x86(r1)
/* 0000AEB4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AEB8 7C830378 */ or r3, r4, r0
/* 0000AEBC 4BFF52F1 */ bl set_text_add_color
/* 0000AEC0 C0210018 */ lfs f1, 0x18(r1)
/* 0000AEC4 C041001C */ lfs f2, 0x1c(r1)
/* 0000AEC8 4BFF52E5 */ bl set_text_pos
/* 0000AECC 7FC3F378 */ mr r3, r30
/* 0000AED0 4BFF52DD */ bl u_draw_text
/* 0000AED4 C01F025C */ lfs f0, 0x25c(r31)
/* 0000AED8 D0010018 */ stfs f0, 0x18(r1)
/* 0000AEDC C01F01CC */ lfs f0, 0x1cc(r31)
/* 0000AEE0 D001001C */ stfs f0, 0x1c(r1)
/* 0000AEE4 801A0000 */ lwz r0, 0(r26)
/* 0000AEE8 2C000000 */ cmpwi r0, 0
/* 0000AEEC 40820028 */ bne lbl_0000AF14
/* 0000AEF0 386000FF */ li r3, 0xff
/* 0000AEF4 98610020 */ stb r3, 0x20(r1)
/* 0000AEF8 38000000 */ li r0, 0
/* 0000AEFC 98610021 */ stb r3, 0x21(r1)
/* 0000AF00 98010022 */ stb r0, 0x22(r1)
/* 0000AF04 9B810084 */ stb r28, 0x84(r1)
/* 0000AF08 9B810085 */ stb r28, 0x85(r1)
/* 0000AF0C 9B810086 */ stb r28, 0x86(r1)
/* 0000AF10 48000024 */ b lbl_0000AF34
lbl_0000AF14:
/* 0000AF14 3860008F */ li r3, 0x8f
/* 0000AF18 98610020 */ stb r3, 0x20(r1)
/* 0000AF1C 38000000 */ li r0, 0
/* 0000AF20 98610021 */ stb r3, 0x21(r1)
/* 0000AF24 98010022 */ stb r0, 0x22(r1)
/* 0000AF28 98010084 */ stb r0, 0x84(r1)
/* 0000AF2C 98010085 */ stb r0, 0x85(r1)
/* 0000AF30 98010086 */ stb r0, 0x86(r1)
lbl_0000AF34:
/* 0000AF34 387E0000 */ addi r3, r30, 0
/* 0000AF38 389D03D0 */ addi r4, r29, 0x3d0
/* 0000AF3C 4BFF5271 */ bl strcpy
/* 0000AF40 4BFF526D */ bl reset_text_draw_settings
/* 0000AF44 88610015 */ lbz r3, 0x15(r1)
/* 0000AF48 4BFF5265 */ bl set_text_font
/* 0000AF4C C0210054 */ lfs f1, 0x54(r1)
/* 0000AF50 C0410058 */ lfs f2, 0x58(r1)
/* 0000AF54 4BFF5259 */ bl set_text_scale
/* 0000AF58 80610088 */ lwz r3, 0x88(r1)
/* 0000AF5C 4BFF5251 */ bl func_80071B50
/* 0000AF60 C83F0028 */ lfd f1, 0x28(r31)
/* 0000AF64 C0010060 */ lfs f0, 0x60(r1)
/* 0000AF68 FC21002A */ fadd f1, f1, f0
/* 0000AF6C FC200818 */ frsp f1, f1
/* 0000AF70 4BFF523D */ bl func_80071B1C
/* 0000AF74 38600000 */ li r3, 0
/* 0000AF78 4BFF5235 */ bl set_text_mul_color
/* 0000AF7C 88010085 */ lbz r0, 0x85(r1)
/* 0000AF80 88610084 */ lbz r3, 0x84(r1)
/* 0000AF84 5400402E */ slwi r0, r0, 8
/* 0000AF88 88810086 */ lbz r4, 0x86(r1)
/* 0000AF8C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AF90 7C830378 */ or r3, r4, r0
/* 0000AF94 4BFF5219 */ bl set_text_add_color
/* 0000AF98 C85F0030 */ lfd f2, 0x30(r31)
/* 0000AF9C C0210018 */ lfs f1, 0x18(r1)
/* 0000AFA0 C001001C */ lfs f0, 0x1c(r1)
/* 0000AFA4 FC22082A */ fadd f1, f2, f1
/* 0000AFA8 FC42002A */ fadd f2, f2, f0
/* 0000AFAC FC200818 */ frsp f1, f1
/* 0000AFB0 FC401018 */ frsp f2, f2
/* 0000AFB4 4BFF51F9 */ bl set_text_pos
/* 0000AFB8 7FC3F378 */ mr r3, r30
/* 0000AFBC 4BFF51F1 */ bl u_draw_text
/* 0000AFC0 C0210060 */ lfs f1, 0x60(r1)
/* 0000AFC4 4BFF51E9 */ bl func_80071B1C
/* 0000AFC8 88010021 */ lbz r0, 0x21(r1)
/* 0000AFCC 88610020 */ lbz r3, 0x20(r1)
/* 0000AFD0 5400402E */ slwi r0, r0, 8
/* 0000AFD4 88810022 */ lbz r4, 0x22(r1)
/* 0000AFD8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AFDC 7C830378 */ or r3, r4, r0
/* 0000AFE0 4BFF51CD */ bl set_text_mul_color
/* 0000AFE4 88010085 */ lbz r0, 0x85(r1)
/* 0000AFE8 88610084 */ lbz r3, 0x84(r1)
/* 0000AFEC 5400402E */ slwi r0, r0, 8
/* 0000AFF0 88810086 */ lbz r4, 0x86(r1)
/* 0000AFF4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AFF8 7C830378 */ or r3, r4, r0
/* 0000AFFC 4BFF51B1 */ bl set_text_add_color
/* 0000B000 C0210018 */ lfs f1, 0x18(r1)
/* 0000B004 C041001C */ lfs f2, 0x1c(r1)
/* 0000B008 4BFF51A5 */ bl set_text_pos
/* 0000B00C 7FC3F378 */ mr r3, r30
/* 0000B010 4BFF519D */ bl u_draw_text
lbl_0000B014:
/* 0000B014 4BFF5199 */ bl mathutil_mtxA_from_identity
/* 0000B018 3C600000 */ lis r3, mathutilData@ha
/* 0000B01C 38630000 */ addi r3, r3, mathutilData@l
/* 0000B020 80630000 */ lwz r3, 0(r3)
/* 0000B024 38800000 */ li r4, 0
/* 0000B028 4BFF5185 */ bl GXLoadPosMtxImm
/* 0000B02C BB0100F8 */ lmw r24, 0xf8(r1)
/* 0000B030 8001011C */ lwz r0, 0x11c(r1)
/* 0000B034 38210118 */ addi r1, r1, 0x118
/* 0000B038 7C0803A6 */ mtlr r0
/* 0000B03C 4E800020 */ blr 
lbl_0000B040:
/* 0000B040 7C0802A6 */ mflr r0
/* 0000B044 3C600000 */ lis r3, lbl_0000C370@ha
/* 0000B048 90010004 */ stw r0, 4(r1)
/* 0000B04C 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000B050 93E1000C */ stw r31, 0xc(r1)
/* 0000B054 3BE30000 */ addi r31, r3, lbl_0000C370@l
/* 0000B058 38600061 */ li r3, 0x61
/* 0000B05C 4BFF5151 */ bl find_sprite_with_tag
/* 0000B060 28030000 */ cmplwi r3, 0
/* 0000B064 41820018 */ beq lbl_0000B07C
/* 0000B068 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B06C 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B070 38000004 */ li r0, 4
/* 0000B074 9803015C */ stb r0, 0x15c(r3)
/* 0000B078 48000080 */ b lbl_0000B0F8
lbl_0000B07C:
/* 0000B07C 38600061 */ li r3, 0x61
/* 0000B080 4BFF8EED */ bl lbl_00003F6C
/* 0000B084 28030000 */ cmplwi r3, 0
/* 0000B088 41820024 */ beq lbl_0000B0AC
/* 0000B08C 38000004 */ li r0, 4
/* 0000B090 98030000 */ stb r0, 0(r3)
/* 0000B094 3800001E */ li r0, 0x1e
/* 0000B098 98030001 */ stb r0, 1(r3)
/* 0000B09C C01F0024 */ lfs f0, 0x24(r31)
/* 0000B0A0 D0030004 */ stfs f0, 4(r3)
/* 0000B0A4 C01F0000 */ lfs f0, 0(r31)
/* 0000B0A8 D0030008 */ stfs f0, 8(r3)
lbl_0000B0AC:
/* 0000B0AC 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B0B0 C01F0098 */ lfs f0, 0x98(r31)
/* 0000B0B4 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B0B8 D0030168 */ stfs f0, 0x168(r3)
/* 0000B0BC 4BFF50F1 */ bl create_sprite
/* 0000B0C0 28030000 */ cmplwi r3, 0
/* 0000B0C4 41820034 */ beq lbl_0000B0F8
/* 0000B0C8 38000061 */ li r0, 0x61
/* 0000B0CC 3C800000 */ lis r4, lbl_0000A600@ha
/* 0000B0D0 9803000F */ stb r0, 0xf(r3)
/* 0000B0D4 38040000 */ addi r0, r4, lbl_0000A600@l
/* 0000B0D8 3C800000 */ lis r4, lbl_0000A688@ha
/* 0000B0DC 90030034 */ stw r0, 0x34(r3)
/* 0000B0E0 38040000 */ addi r0, r4, lbl_0000A688@l
/* 0000B0E4 3C800000 */ lis r4, lbl_0000D310@ha
/* 0000B0E8 90030038 */ stw r0, 0x38(r3)
/* 0000B0EC 38840000 */ addi r4, r4, lbl_0000D310@l
/* 0000B0F0 3863008C */ addi r3, r3, 0x8c
/* 0000B0F4 4BFF50B9 */ bl strcpy
lbl_0000B0F8:
/* 0000B0F8 80010014 */ lwz r0, 0x14(r1)
/* 0000B0FC 83E1000C */ lwz r31, 0xc(r1)
/* 0000B100 38210010 */ addi r1, r1, 0x10
/* 0000B104 7C0803A6 */ mtlr r0
/* 0000B108 4E800020 */ blr 
lbl_0000B10C:
/* 0000B10C 7C0802A6 */ mflr r0
/* 0000B110 3CA00000 */ lis r5, lbl_0000C370@ha
/* 0000B114 90010004 */ stw r0, 4(r1)
/* 0000B118 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000B11C 93E1001C */ stw r31, 0x1c(r1)
/* 0000B120 3BE50000 */ addi r31, r5, lbl_0000C370@l
/* 0000B124 4BFF8ECD */ bl lbl_00003FF0
/* 0000B128 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B12C 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B130 38830130 */ addi r4, r3, 0x130
/* 0000B134 80030130 */ lwz r0, 0x130(r3)
/* 0000B138 2C000003 */ cmpwi r0, 3
/* 0000B13C 40800008 */ bge lbl_0000B144
/* 0000B140 48000008 */ b lbl_0000B148
lbl_0000B144:
/* 0000B144 38000003 */ li r0, 3
lbl_0000B148:
/* 0000B148 6C008000 */ xoris r0, r0, 0x8000
/* 0000B14C C85F0080 */ lfd f2, 0x80(r31)
/* 0000B150 90010014 */ stw r0, 0x14(r1)
/* 0000B154 3C004330 */ lis r0, 0x4330
/* 0000B158 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000B15C C87F0260 */ lfd f3, 0x260(r31)
/* 0000B160 90010010 */ stw r0, 0x10(r1)
/* 0000B164 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000B168 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B16C C8010010 */ lfd f0, 0x10(r1)
/* 0000B170 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B174 C89F0058 */ lfd f4, 0x58(r31)
/* 0000B178 FC000828 */ fsub f0, f0, f1
/* 0000B17C C0230128 */ lfs f1, 0x128(r3)
/* 0000B180 FC020032 */ fmul f0, f2, f0
/* 0000B184 FC03002A */ fadd f0, f3, f0
/* 0000B188 FC000828 */ fsub f0, f0, f1
/* 0000B18C FC040032 */ fmul f0, f4, f0
/* 0000B190 FC01002A */ fadd f0, f1, f0
/* 0000B194 FC000018 */ frsp f0, f0
/* 0000B198 D0030128 */ stfs f0, 0x128(r3)
/* 0000B19C 80040000 */ lwz r0, 0(r4)
/* 0000B1A0 2C000004 */ cmpwi r0, 4
/* 0000B1A4 4182000C */ beq lbl_0000B1B0
/* 0000B1A8 2C000005 */ cmpwi r0, 5
/* 0000B1AC 40820038 */ bne lbl_0000B1E4
lbl_0000B1B0:
/* 0000B1B0 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B1B4 80040000 */ lwz r0, 0(r4)
/* 0000B1B8 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B1BC 9003012C */ stw r0, 0x12c(r3)
/* 0000B1C0 C4430018 */ lfsu f2, 0x18(r3)
/* 0000B1C4 C81F00A8 */ lfd f0, 0xa8(r31)
/* 0000B1C8 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B1CC FC001028 */ fsub f0, f0, f2
/* 0000B1D0 FC010032 */ fmul f0, f1, f0
/* 0000B1D4 FC02002A */ fadd f0, f2, f0
/* 0000B1D8 FC000018 */ frsp f0, f0
/* 0000B1DC D0030000 */ stfs f0, 0(r3)
/* 0000B1E0 48000024 */ b lbl_0000B204
lbl_0000B1E4:
/* 0000B1E4 C81F0268 */ lfd f0, 0x268(r31)
/* 0000B1E8 C4430018 */ lfsu f2, 0x18(r3)
/* 0000B1EC C83F0028 */ lfd f1, 0x28(r31)
/* 0000B1F0 FC001028 */ fsub f0, f0, f2
/* 0000B1F4 FC010032 */ fmul f0, f1, f0
/* 0000B1F8 FC02002A */ fadd f0, f2, f0
/* 0000B1FC FC000018 */ frsp f0, f0
/* 0000B200 D0030000 */ stfs f0, 0(r3)
lbl_0000B204:
/* 0000B204 80010024 */ lwz r0, 0x24(r1)
/* 0000B208 83E1001C */ lwz r31, 0x1c(r1)
/* 0000B20C 38210020 */ addi r1, r1, 0x20
/* 0000B210 7C0803A6 */ mtlr r0
/* 0000B214 4E800020 */ blr 
lbl_0000B218:
/* 0000B218 7C0802A6 */ mflr r0
/* 0000B21C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 0000B220 90010004 */ stw r0, 4(r1)
/* 0000B224 9421FED8 */ stwu r1, -0x128(r1)
/* 0000B228 BEC10100 */ stmw r22, 0x100(r1)
/* 0000B22C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 0000B230 3C800000 */ lis r4, lbl_0000C370@ha
/* 0000B234 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 0000B238 8863000F */ lbz r3, 0xf(r3)
/* 0000B23C 7C630774 */ extsb r3, r3
/* 0000B240 4BFF8D2D */ bl lbl_00003F6C
/* 0000B244 28030000 */ cmplwi r3, 0
/* 0000B248 41820040 */ beq lbl_0000B288
/* 0000B24C C05F0000 */ lfs f2, 0(r31)
/* 0000B250 C0230004 */ lfs f1, 4(r3)
/* 0000B254 C0030008 */ lfs f0, 8(r3)
/* 0000B258 FC601090 */ fmr f3, f2
/* 0000B25C EC21002A */ fadds f1, f1, f0
/* 0000B260 4BFF4F4D */ bl mathutil_mtxA_from_translate_xyz
/* 0000B264 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B268 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B26C 38630184 */ addi r3, r3, 0x184
/* 0000B270 4BFF4F3D */ bl mathutil_mtxA_to_mtx
/* 0000B274 3C600000 */ lis r3, mathutilData@ha
/* 0000B278 38630000 */ addi r3, r3, mathutilData@l
/* 0000B27C 80630000 */ lwz r3, 0(r3)
/* 0000B280 38800000 */ li r4, 0
/* 0000B284 4BFF4F29 */ bl GXLoadPosMtxImm
lbl_0000B288:
/* 0000B288 7FA3EB78 */ mr r3, r29
/* 0000B28C 4BFF4F21 */ bl draw_naomi_sprite
/* 0000B290 C01F0088 */ lfs f0, 0x88(r31)
/* 0000B294 3BC100A4 */ addi r30, r1, 0xa4
/* 0000B298 388000B3 */ li r4, 0xb3
/* 0000B29C D0010064 */ stfs f0, 0x64(r1)
/* 0000B2A0 3AC00000 */ li r22, 0
/* 0000B2A4 3C000020 */ lis r0, 0x20
/* 0000B2A8 C01F0060 */ lfs f0, 0x60(r31)
/* 0000B2AC 7FC3F378 */ mr r3, r30
/* 0000B2B0 D0010058 */ stfs f0, 0x58(r1)
/* 0000B2B4 C01F0060 */ lfs f0, 0x60(r31)
/* 0000B2B8 D001005C */ stfs f0, 0x5c(r1)
/* 0000B2BC 98810019 */ stb r4, 0x19(r1)
/* 0000B2C0 389D1918 */ addi r4, r29, 0x1918
/* 0000B2C4 9AC10088 */ stb r22, 0x88(r1)
/* 0000B2C8 9AC10089 */ stb r22, 0x89(r1)
/* 0000B2CC 9AC1008A */ stb r22, 0x8a(r1)
/* 0000B2D0 9001008C */ stw r0, 0x8c(r1)
/* 0000B2D4 4BFF4ED9 */ bl strcpy
/* 0000B2D8 4BFF4ED5 */ bl reset_text_draw_settings
/* 0000B2DC 88610019 */ lbz r3, 0x19(r1)
/* 0000B2E0 4BFF4ECD */ bl set_text_font
/* 0000B2E4 C0210058 */ lfs f1, 0x58(r1)
/* 0000B2E8 C041005C */ lfs f2, 0x5c(r1)
/* 0000B2EC 4BFF4EC1 */ bl set_text_scale
/* 0000B2F0 8061008C */ lwz r3, 0x8c(r1)
/* 0000B2F4 4BFF4EB9 */ bl func_80071B50
/* 0000B2F8 C0210064 */ lfs f1, 0x64(r1)
/* 0000B2FC 4BFF4EB1 */ bl func_80071B1C
/* 0000B300 88010025 */ lbz r0, 0x25(r1)
/* 0000B304 88610024 */ lbz r3, 0x24(r1)
/* 0000B308 5400402E */ slwi r0, r0, 8
/* 0000B30C 88810026 */ lbz r4, 0x26(r1)
/* 0000B310 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B314 7C830378 */ or r3, r4, r0
/* 0000B318 4BFF4E95 */ bl set_text_mul_color
/* 0000B31C 88010089 */ lbz r0, 0x89(r1)
/* 0000B320 88610088 */ lbz r3, 0x88(r1)
/* 0000B324 5400402E */ slwi r0, r0, 8
/* 0000B328 8881008A */ lbz r4, 0x8a(r1)
/* 0000B32C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B330 7C830378 */ or r3, r4, r0
/* 0000B334 4BFF4E79 */ bl set_text_add_color
/* 0000B338 7FC3F378 */ mr r3, r30
/* 0000B33C 4BFF4E71 */ bl u_get_text_width
/* 0000B340 C81F0058 */ lfd f0, 0x58(r31)
/* 0000B344 380000FF */ li r0, 0xff
/* 0000B348 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000B34C FC000072 */ fmul f0, f0, f1
/* 0000B350 FC020028 */ fsub f0, f2, f0
/* 0000B354 FC000018 */ frsp f0, f0
/* 0000B358 D001001C */ stfs f0, 0x1c(r1)
/* 0000B35C C01F0090 */ lfs f0, 0x90(r31)
/* 0000B360 D0010020 */ stfs f0, 0x20(r1)
/* 0000B364 98010024 */ stb r0, 0x24(r1)
/* 0000B368 98010025 */ stb r0, 0x25(r1)
/* 0000B36C 9AC10026 */ stb r22, 0x26(r1)
/* 0000B370 4BFF4E3D */ bl reset_text_draw_settings
/* 0000B374 88610019 */ lbz r3, 0x19(r1)
/* 0000B378 4BFF4E35 */ bl set_text_font
/* 0000B37C C0210058 */ lfs f1, 0x58(r1)
/* 0000B380 C041005C */ lfs f2, 0x5c(r1)
/* 0000B384 4BFF4E29 */ bl set_text_scale
/* 0000B388 8061008C */ lwz r3, 0x8c(r1)
/* 0000B38C 4BFF4E21 */ bl func_80071B50
/* 0000B390 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B394 C0010064 */ lfs f0, 0x64(r1)
/* 0000B398 FC21002A */ fadd f1, f1, f0
/* 0000B39C FC200818 */ frsp f1, f1
/* 0000B3A0 4BFF4E0D */ bl func_80071B1C
/* 0000B3A4 38600000 */ li r3, 0
/* 0000B3A8 4BFF4E05 */ bl set_text_mul_color
/* 0000B3AC 88010089 */ lbz r0, 0x89(r1)
/* 0000B3B0 88610088 */ lbz r3, 0x88(r1)
/* 0000B3B4 5400402E */ slwi r0, r0, 8
/* 0000B3B8 8881008A */ lbz r4, 0x8a(r1)
/* 0000B3BC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B3C0 7C830378 */ or r3, r4, r0
/* 0000B3C4 4BFF4DE9 */ bl set_text_add_color
/* 0000B3C8 C85F0030 */ lfd f2, 0x30(r31)
/* 0000B3CC C021001C */ lfs f1, 0x1c(r1)
/* 0000B3D0 C0010020 */ lfs f0, 0x20(r1)
/* 0000B3D4 FC22082A */ fadd f1, f2, f1
/* 0000B3D8 FC42002A */ fadd f2, f2, f0
/* 0000B3DC FC200818 */ frsp f1, f1
/* 0000B3E0 FC401018 */ frsp f2, f2
/* 0000B3E4 4BFF4DC9 */ bl set_text_pos
/* 0000B3E8 7FC3F378 */ mr r3, r30
/* 0000B3EC 4BFF4DC1 */ bl u_draw_text
/* 0000B3F0 C0210064 */ lfs f1, 0x64(r1)
/* 0000B3F4 4BFF4DB9 */ bl func_80071B1C
/* 0000B3F8 88010025 */ lbz r0, 0x25(r1)
/* 0000B3FC 88610024 */ lbz r3, 0x24(r1)
/* 0000B400 5400402E */ slwi r0, r0, 8
/* 0000B404 88810026 */ lbz r4, 0x26(r1)
/* 0000B408 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B40C 7C830378 */ or r3, r4, r0
/* 0000B410 4BFF4D9D */ bl set_text_mul_color
/* 0000B414 88010089 */ lbz r0, 0x89(r1)
/* 0000B418 88610088 */ lbz r3, 0x88(r1)
/* 0000B41C 5400402E */ slwi r0, r0, 8
/* 0000B420 8881008A */ lbz r4, 0x8a(r1)
/* 0000B424 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B428 7C830378 */ or r3, r4, r0
/* 0000B42C 4BFF4D81 */ bl set_text_add_color
/* 0000B430 C021001C */ lfs f1, 0x1c(r1)
/* 0000B434 C0410020 */ lfs f2, 0x20(r1)
/* 0000B438 4BFF4D75 */ bl set_text_pos
/* 0000B43C 7FC3F378 */ mr r3, r30
/* 0000B440 4BFF4D6D */ bl u_draw_text
/* 0000B444 C01F0064 */ lfs f0, 0x64(r31)
/* 0000B448 387D150C */ addi r3, r29, 0x150c
/* 0000B44C D01D1510 */ stfs f0, 0x1510(r29)
/* 0000B450 C01F021C */ lfs f0, 0x21c(r31)
/* 0000B454 D01D1514 */ stfs f0, 0x1514(r29)
/* 0000B458 C01F0060 */ lfs f0, 0x60(r31)
/* 0000B45C D01D151C */ stfs f0, 0x151c(r29)
/* 0000B460 C03F0148 */ lfs f1, 0x148(r31)
/* 0000B464 C05F009C */ lfs f2, 0x9c(r31)
/* 0000B468 4BFF8E55 */ bl lbl_000042BC
/* 0000B46C C01F0218 */ lfs f0, 0x218(r31)
/* 0000B470 3C800000 */ lis r4, lbl_10000000@ha
/* 0000B474 3AE40000 */ addi r23, r4, lbl_10000000@l
/* 0000B478 D01D0054 */ stfs f0, 0x54(r29)
/* 0000B47C 387D0050 */ addi r3, r29, 0x50
/* 0000B480 C0170128 */ lfs f0, 0x128(r23)
/* 0000B484 D01D0058 */ stfs f0, 0x58(r29)
/* 0000B488 4BFF4D25 */ bl draw_naomi_sprite
/* 0000B48C 3AC00000 */ li r22, 0
/* 0000B490 56C0103A */ slwi r0, r22, 2
/* 0000B494 7F7D0214 */ add r27, r29, r0
/* 0000B498 3B370130 */ addi r25, r23, 0x130
/* 0000B49C 3F404330 */ lis r26, 0x4330
/* 0000B4A0 3B7B167C */ addi r27, r27, 0x167c
lbl_0000B4A4:
/* 0000B4A4 6EC08000 */ xoris r0, r22, 0x8000
/* 0000B4A8 C01F021C */ lfs f0, 0x21c(r31)
/* 0000B4AC 900100FC */ stw r0, 0xfc(r1)
/* 0000B4B0 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000B4B4 D001001C */ stfs f0, 0x1c(r1)
/* 0000B4B8 934100F8 */ stw r26, 0xf8(r1)
/* 0000B4BC C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000B4C0 C80100F8 */ lfd f0, 0xf8(r1)
/* 0000B4C4 C85F0080 */ lfd f2, 0x80(r31)
/* 0000B4C8 FC000828 */ fsub f0, f0, f1
/* 0000B4CC C83F0270 */ lfd f1, 0x270(r31)
/* 0000B4D0 FC020032 */ fmul f0, f2, f0
/* 0000B4D4 FC01002A */ fadd f0, f1, f0
/* 0000B4D8 FC000018 */ frsp f0, f0
/* 0000B4DC D0010020 */ stfs f0, 0x20(r1)
/* 0000B4E0 80190000 */ lwz r0, 0(r25)
/* 0000B4E4 7C160000 */ cmpw r22, r0
/* 0000B4E8 41820014 */ beq lbl_0000B4FC
/* 0000B4EC 2C160003 */ cmpwi r22, 3
/* 0000B4F0 40820024 */ bne lbl_0000B514
/* 0000B4F4 2C000003 */ cmpwi r0, 3
/* 0000B4F8 4081001C */ ble lbl_0000B514
lbl_0000B4FC:
/* 0000B4FC 386000FF */ li r3, 0xff
/* 0000B500 98610024 */ stb r3, 0x24(r1)
/* 0000B504 38000000 */ li r0, 0
/* 0000B508 98610025 */ stb r3, 0x25(r1)
/* 0000B50C 98010026 */ stb r0, 0x26(r1)
/* 0000B510 48000018 */ b lbl_0000B528
lbl_0000B514:
/* 0000B514 3860008F */ li r3, 0x8f
/* 0000B518 98610024 */ stb r3, 0x24(r1)
/* 0000B51C 38000000 */ li r0, 0
/* 0000B520 98610025 */ stb r3, 0x25(r1)
/* 0000B524 98010026 */ stb r0, 0x26(r1)
lbl_0000B528:
/* 0000B528 7FC3F378 */ mr r3, r30
/* 0000B52C 809B0000 */ lwz r4, 0(r27)
/* 0000B530 4BFF4C7D */ bl strcpy
/* 0000B534 4BFF4C79 */ bl reset_text_draw_settings
/* 0000B538 88610019 */ lbz r3, 0x19(r1)
/* 0000B53C 4BFF4C71 */ bl set_text_font
/* 0000B540 C0210058 */ lfs f1, 0x58(r1)
/* 0000B544 C041005C */ lfs f2, 0x5c(r1)
/* 0000B548 4BFF4C65 */ bl set_text_scale
/* 0000B54C 8061008C */ lwz r3, 0x8c(r1)
/* 0000B550 4BFF4C5D */ bl func_80071B50
/* 0000B554 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B558 C0010064 */ lfs f0, 0x64(r1)
/* 0000B55C FC21002A */ fadd f1, f1, f0
/* 0000B560 FC200818 */ frsp f1, f1
/* 0000B564 4BFF4C49 */ bl func_80071B1C
/* 0000B568 38600000 */ li r3, 0
/* 0000B56C 4BFF4C41 */ bl set_text_mul_color
/* 0000B570 88010089 */ lbz r0, 0x89(r1)
/* 0000B574 88610088 */ lbz r3, 0x88(r1)
/* 0000B578 5400402E */ slwi r0, r0, 8
/* 0000B57C 8881008A */ lbz r4, 0x8a(r1)
/* 0000B580 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B584 7C830378 */ or r3, r4, r0
/* 0000B588 4BFF4C25 */ bl set_text_add_color
/* 0000B58C C85F0030 */ lfd f2, 0x30(r31)
/* 0000B590 C021001C */ lfs f1, 0x1c(r1)
/* 0000B594 C0010020 */ lfs f0, 0x20(r1)
/* 0000B598 FC22082A */ fadd f1, f2, f1
/* 0000B59C FC42002A */ fadd f2, f2, f0
/* 0000B5A0 FC200818 */ frsp f1, f1
/* 0000B5A4 FC401018 */ frsp f2, f2
/* 0000B5A8 4BFF4C05 */ bl set_text_pos
/* 0000B5AC 7FC3F378 */ mr r3, r30
/* 0000B5B0 4BFF4BFD */ bl u_draw_text
/* 0000B5B4 C0210064 */ lfs f1, 0x64(r1)
/* 0000B5B8 4BFF4BF5 */ bl func_80071B1C
/* 0000B5BC 88010025 */ lbz r0, 0x25(r1)
/* 0000B5C0 88610024 */ lbz r3, 0x24(r1)
/* 0000B5C4 5400402E */ slwi r0, r0, 8
/* 0000B5C8 88810026 */ lbz r4, 0x26(r1)
/* 0000B5CC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B5D0 7C830378 */ or r3, r4, r0
/* 0000B5D4 4BFF4BD9 */ bl set_text_mul_color
/* 0000B5D8 88010089 */ lbz r0, 0x89(r1)
/* 0000B5DC 88610088 */ lbz r3, 0x88(r1)
/* 0000B5E0 5400402E */ slwi r0, r0, 8
/* 0000B5E4 8881008A */ lbz r4, 0x8a(r1)
/* 0000B5E8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B5EC 7C830378 */ or r3, r4, r0
/* 0000B5F0 4BFF4BBD */ bl set_text_add_color
/* 0000B5F4 C021001C */ lfs f1, 0x1c(r1)
/* 0000B5F8 C0410020 */ lfs f2, 0x20(r1)
/* 0000B5FC 4BFF4BB1 */ bl set_text_pos
/* 0000B600 7FC3F378 */ mr r3, r30
/* 0000B604 4BFF4BA9 */ bl u_draw_text
/* 0000B608 3AD60001 */ addi r22, r22, 1
/* 0000B60C 28160004 */ cmplwi r22, 4
/* 0000B610 3B7B0004 */ addi r27, r27, 4
/* 0000B614 4180FE90 */ blt lbl_0000B4A4
/* 0000B618 380000B0 */ li r0, 0xb0
/* 0000B61C 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B620 98010019 */ stb r0, 0x19(r1)
/* 0000B624 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B628 3B830130 */ addi r28, r3, 0x130
/* 0000B62C 80030130 */ lwz r0, 0x130(r3)
/* 0000B630 2C000002 */ cmpwi r0, 2
/* 0000B634 40820120 */ bne lbl_0000B754
/* 0000B638 387D155C */ addi r3, r29, 0x155c
/* 0000B63C 4BFF4B71 */ bl draw_naomi_sprite
/* 0000B640 388000FF */ li r4, 0xff
/* 0000B644 98810024 */ stb r4, 0x24(r1)
/* 0000B648 38000000 */ li r0, 0
/* 0000B64C 387E0000 */ addi r3, r30, 0
/* 0000B650 98810025 */ stb r4, 0x25(r1)
/* 0000B654 389D1924 */ addi r4, r29, 0x1924
/* 0000B658 98010026 */ stb r0, 0x26(r1)
/* 0000B65C C01F0278 */ lfs f0, 0x278(r31)
/* 0000B660 D001001C */ stfs f0, 0x1c(r1)
/* 0000B664 C01F027C */ lfs f0, 0x27c(r31)
/* 0000B668 D0010020 */ stfs f0, 0x20(r1)
/* 0000B66C C01F0158 */ lfs f0, 0x158(r31)
/* 0000B670 D0010058 */ stfs f0, 0x58(r1)
/* 0000B674 4BFF4B39 */ bl strcpy
/* 0000B678 4BFF4B35 */ bl reset_text_draw_settings
/* 0000B67C 88610019 */ lbz r3, 0x19(r1)
/* 0000B680 4BFF4B2D */ bl set_text_font
/* 0000B684 C0210058 */ lfs f1, 0x58(r1)
/* 0000B688 C041005C */ lfs f2, 0x5c(r1)
/* 0000B68C 4BFF4B21 */ bl set_text_scale
/* 0000B690 8061008C */ lwz r3, 0x8c(r1)
/* 0000B694 4BFF4B19 */ bl func_80071B50
/* 0000B698 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B69C C0010064 */ lfs f0, 0x64(r1)
/* 0000B6A0 FC21002A */ fadd f1, f1, f0
/* 0000B6A4 FC200818 */ frsp f1, f1
/* 0000B6A8 4BFF4B05 */ bl func_80071B1C
/* 0000B6AC 38600000 */ li r3, 0
/* 0000B6B0 4BFF4AFD */ bl set_text_mul_color
/* 0000B6B4 88010089 */ lbz r0, 0x89(r1)
/* 0000B6B8 88610088 */ lbz r3, 0x88(r1)
/* 0000B6BC 5400402E */ slwi r0, r0, 8
/* 0000B6C0 8881008A */ lbz r4, 0x8a(r1)
/* 0000B6C4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B6C8 7C830378 */ or r3, r4, r0
/* 0000B6CC 4BFF4AE1 */ bl set_text_add_color
/* 0000B6D0 C85F0030 */ lfd f2, 0x30(r31)
/* 0000B6D4 C021001C */ lfs f1, 0x1c(r1)
/* 0000B6D8 C0010020 */ lfs f0, 0x20(r1)
/* 0000B6DC FC22082A */ fadd f1, f2, f1
/* 0000B6E0 FC42002A */ fadd f2, f2, f0
/* 0000B6E4 FC200818 */ frsp f1, f1
/* 0000B6E8 FC401018 */ frsp f2, f2
/* 0000B6EC 4BFF4AC1 */ bl set_text_pos
/* 0000B6F0 7FC3F378 */ mr r3, r30
/* 0000B6F4 4BFF4AB9 */ bl u_draw_text
/* 0000B6F8 C0210064 */ lfs f1, 0x64(r1)
/* 0000B6FC 4BFF4AB1 */ bl func_80071B1C
/* 0000B700 88010025 */ lbz r0, 0x25(r1)
/* 0000B704 88610024 */ lbz r3, 0x24(r1)
/* 0000B708 5400402E */ slwi r0, r0, 8
/* 0000B70C 88810026 */ lbz r4, 0x26(r1)
/* 0000B710 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B714 7C830378 */ or r3, r4, r0
/* 0000B718 4BFF4A95 */ bl set_text_mul_color
/* 0000B71C 88010089 */ lbz r0, 0x89(r1)
/* 0000B720 88610088 */ lbz r3, 0x88(r1)
/* 0000B724 5400402E */ slwi r0, r0, 8
/* 0000B728 8881008A */ lbz r4, 0x8a(r1)
/* 0000B72C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B730 7C830378 */ or r3, r4, r0
/* 0000B734 4BFF4A79 */ bl set_text_add_color
/* 0000B738 C021001C */ lfs f1, 0x1c(r1)
/* 0000B73C C0410020 */ lfs f2, 0x20(r1)
/* 0000B740 4BFF4A6D */ bl set_text_pos
/* 0000B744 7FC3F378 */ mr r3, r30
/* 0000B748 4BFF4A65 */ bl u_draw_text
/* 0000B74C C01F0060 */ lfs f0, 0x60(r31)
/* 0000B750 D0010058 */ stfs f0, 0x58(r1)
lbl_0000B754:
/* 0000B754 801C0000 */ lwz r0, 0(r28)
/* 0000B758 2C000002 */ cmpwi r0, 2
/* 0000B75C 4082001C */ bne lbl_0000B778
/* 0000B760 386000FF */ li r3, 0xff
/* 0000B764 98610024 */ stb r3, 0x24(r1)
/* 0000B768 38000000 */ li r0, 0
/* 0000B76C 98610025 */ stb r3, 0x25(r1)
/* 0000B770 98010026 */ stb r0, 0x26(r1)
/* 0000B774 48000018 */ b lbl_0000B78C
lbl_0000B778:
/* 0000B778 3860008F */ li r3, 0x8f
/* 0000B77C 98610024 */ stb r3, 0x24(r1)
/* 0000B780 38000000 */ li r0, 0
/* 0000B784 98610025 */ stb r3, 0x25(r1)
/* 0000B788 98010026 */ stb r0, 0x26(r1)
lbl_0000B78C:
/* 0000B78C 4BFF4A21 */ bl func_8009F4C4
/* 0000B790 5460063E */ clrlwi r0, r3, 0x18
/* 0000B794 28000001 */ cmplwi r0, 1
/* 0000B798 40820024 */ bne lbl_0000B7BC
/* 0000B79C C01F00DC */ lfs f0, 0xdc(r31)
/* 0000B7A0 387E0000 */ addi r3, r30, 0
/* 0000B7A4 389D1948 */ addi r4, r29, 0x1948
/* 0000B7A8 D001001C */ stfs f0, 0x1c(r1)
/* 0000B7AC C01F027C */ lfs f0, 0x27c(r31)
/* 0000B7B0 D0010020 */ stfs f0, 0x20(r1)
/* 0000B7B4 4BFF49F9 */ bl strcpy
/* 0000B7B8 48000020 */ b lbl_0000B7D8
lbl_0000B7BC:
/* 0000B7BC C01F0280 */ lfs f0, 0x280(r31)
/* 0000B7C0 387E0000 */ addi r3, r30, 0
/* 0000B7C4 389D194C */ addi r4, r29, 0x194c
/* 0000B7C8 D001001C */ stfs f0, 0x1c(r1)
/* 0000B7CC C01F027C */ lfs f0, 0x27c(r31)
/* 0000B7D0 D0010020 */ stfs f0, 0x20(r1)
/* 0000B7D4 4BFF49D9 */ bl strcpy
lbl_0000B7D8:
/* 0000B7D8 4BFF49D5 */ bl reset_text_draw_settings
/* 0000B7DC 88610019 */ lbz r3, 0x19(r1)
/* 0000B7E0 4BFF49CD */ bl set_text_font
/* 0000B7E4 C0210058 */ lfs f1, 0x58(r1)
/* 0000B7E8 C041005C */ lfs f2, 0x5c(r1)
/* 0000B7EC 4BFF49C1 */ bl set_text_scale
/* 0000B7F0 8061008C */ lwz r3, 0x8c(r1)
/* 0000B7F4 4BFF49B9 */ bl func_80071B50
/* 0000B7F8 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B7FC C0010064 */ lfs f0, 0x64(r1)
/* 0000B800 FC21002A */ fadd f1, f1, f0
/* 0000B804 FC200818 */ frsp f1, f1
/* 0000B808 4BFF49A5 */ bl func_80071B1C
/* 0000B80C 38600000 */ li r3, 0
/* 0000B810 4BFF499D */ bl set_text_mul_color
/* 0000B814 88010089 */ lbz r0, 0x89(r1)
/* 0000B818 88610088 */ lbz r3, 0x88(r1)
/* 0000B81C 5400402E */ slwi r0, r0, 8
/* 0000B820 8881008A */ lbz r4, 0x8a(r1)
/* 0000B824 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B828 7C830378 */ or r3, r4, r0
/* 0000B82C 4BFF4981 */ bl set_text_add_color
/* 0000B830 C85F0030 */ lfd f2, 0x30(r31)
/* 0000B834 C021001C */ lfs f1, 0x1c(r1)
/* 0000B838 C0010020 */ lfs f0, 0x20(r1)
/* 0000B83C FC22082A */ fadd f1, f2, f1
/* 0000B840 FC42002A */ fadd f2, f2, f0
/* 0000B844 FC200818 */ frsp f1, f1
/* 0000B848 FC401018 */ frsp f2, f2
/* 0000B84C 4BFF4961 */ bl set_text_pos
/* 0000B850 7FC3F378 */ mr r3, r30
/* 0000B854 4BFF4959 */ bl u_draw_text
/* 0000B858 C0210064 */ lfs f1, 0x64(r1)
/* 0000B85C 4BFF4951 */ bl func_80071B1C
/* 0000B860 88010025 */ lbz r0, 0x25(r1)
/* 0000B864 88610024 */ lbz r3, 0x24(r1)
/* 0000B868 5400402E */ slwi r0, r0, 8
/* 0000B86C 88810026 */ lbz r4, 0x26(r1)
/* 0000B870 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B874 7C830378 */ or r3, r4, r0
/* 0000B878 4BFF4935 */ bl set_text_mul_color
/* 0000B87C 88010089 */ lbz r0, 0x89(r1)
/* 0000B880 88610088 */ lbz r3, 0x88(r1)
/* 0000B884 5400402E */ slwi r0, r0, 8
/* 0000B888 8881008A */ lbz r4, 0x8a(r1)
/* 0000B88C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B890 7C830378 */ or r3, r4, r0
/* 0000B894 4BFF4919 */ bl set_text_add_color
/* 0000B898 C021001C */ lfs f1, 0x1c(r1)
/* 0000B89C C0410020 */ lfs f2, 0x20(r1)
/* 0000B8A0 4BFF490D */ bl set_text_pos
/* 0000B8A4 7FC3F378 */ mr r3, r30
/* 0000B8A8 4BFF4905 */ bl u_draw_text
/* 0000B8AC 380000B3 */ li r0, 0xb3
/* 0000B8B0 98010019 */ stb r0, 0x19(r1)
/* 0000B8B4 387D15AC */ addi r3, r29, 0x15ac
/* 0000B8B8 C01F0284 */ lfs f0, 0x284(r31)
/* 0000B8BC D01D15B4 */ stfs f0, 0x15b4(r29)
/* 0000B8C0 C01F0288 */ lfs f0, 0x288(r31)
/* 0000B8C4 D01D15C0 */ stfs f0, 0x15c0(r29)
/* 0000B8C8 C03F028C */ lfs f1, 0x28c(r31)
/* 0000B8CC C05F0290 */ lfs f2, 0x290(r31)
/* 0000B8D0 4BFF89ED */ bl lbl_000042BC
/* 0000B8D4 C01F0294 */ lfs f0, 0x294(r31)
/* 0000B8D8 386000FF */ li r3, 0xff
/* 0000B8DC 38000000 */ li r0, 0
/* 0000B8E0 D0010058 */ stfs f0, 0x58(r1)
/* 0000B8E4 98610024 */ stb r3, 0x24(r1)
/* 0000B8E8 98610025 */ stb r3, 0x25(r1)
/* 0000B8EC 98010026 */ stb r0, 0x26(r1)
/* 0000B8F0 801C0000 */ lwz r0, 0(r28)
/* 0000B8F4 2C000003 */ cmpwi r0, 3
/* 0000B8F8 40800008 */ bge lbl_0000B900
/* 0000B8FC 48000008 */ b lbl_0000B904
lbl_0000B900:
/* 0000B900 38000003 */ li r0, 3
lbl_0000B904:
/* 0000B904 54001838 */ slwi r0, r0, 3
/* 0000B908 7EDD0214 */ add r22, r29, r0
/* 0000B90C 3AE00000 */ li r23, 0
/* 0000B910 56FB1838 */ slwi r27, r23, 3
/* 0000B914 3F404330 */ lis r26, 0x4330
/* 0000B918 3AD618E8 */ addi r22, r22, 0x18e8
/* 0000B91C 480001D4 */ b lbl_0000BAF0
lbl_0000B920:
/* 0000B920 80960000 */ lwz r4, 0(r22)
/* 0000B924 7FC3F378 */ mr r3, r30
/* 0000B928 7C84D82E */ lwzx r4, r4, r27
/* 0000B92C 4BFF4881 */ bl strcpy
/* 0000B930 4BFF487D */ bl reset_text_draw_settings
/* 0000B934 88610019 */ lbz r3, 0x19(r1)
/* 0000B938 4BFF4875 */ bl set_text_font
/* 0000B93C C0210058 */ lfs f1, 0x58(r1)
/* 0000B940 C041005C */ lfs f2, 0x5c(r1)
/* 0000B944 4BFF4869 */ bl set_text_scale
/* 0000B948 8061008C */ lwz r3, 0x8c(r1)
/* 0000B94C 4BFF4861 */ bl func_80071B50
/* 0000B950 C0210064 */ lfs f1, 0x64(r1)
/* 0000B954 4BFF4859 */ bl func_80071B1C
/* 0000B958 88010025 */ lbz r0, 0x25(r1)
/* 0000B95C 88610024 */ lbz r3, 0x24(r1)
/* 0000B960 5400402E */ slwi r0, r0, 8
/* 0000B964 88810026 */ lbz r4, 0x26(r1)
/* 0000B968 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B96C 7C830378 */ or r3, r4, r0
/* 0000B970 4BFF483D */ bl set_text_mul_color
/* 0000B974 88010089 */ lbz r0, 0x89(r1)
/* 0000B978 88610088 */ lbz r3, 0x88(r1)
/* 0000B97C 5400402E */ slwi r0, r0, 8
/* 0000B980 8881008A */ lbz r4, 0x8a(r1)
/* 0000B984 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B988 7C830378 */ or r3, r4, r0
/* 0000B98C 4BFF4821 */ bl set_text_add_color
/* 0000B990 7FC3F378 */ mr r3, r30
/* 0000B994 4BFF4819 */ bl u_get_text_width
/* 0000B998 C81F0058 */ lfd f0, 0x58(r31)
/* 0000B99C 6EE08000 */ xoris r0, r23, 0x8000
/* 0000B9A0 900100F4 */ stw r0, 0xf4(r1)
/* 0000B9A4 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000B9A8 FC000072 */ fmul f0, f0, f1
/* 0000B9AC C83F00A8 */ lfd f1, 0xa8(r31)
/* 0000B9B0 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000B9B4 934100F0 */ stw r26, 0xf0(r1)
/* 0000B9B8 FC210028 */ fsub f1, f1, f0
/* 0000B9BC C80100F0 */ lfd f0, 0xf0(r1)
/* 0000B9C0 FC200818 */ frsp f1, f1
/* 0000B9C4 D021001C */ stfs f1, 0x1c(r1)
/* 0000B9C8 80B60004 */ lwz r5, 4(r22)
/* 0000B9CC C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000B9D0 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000B9D4 C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 0000B9D8 6C008000 */ xoris r0, r0, 0x8000
/* 0000B9DC FC000828 */ fsub f0, f0, f1
/* 0000B9E0 900100FC */ stw r0, 0xfc(r1)
/* 0000B9E4 C83F0080 */ lfd f1, 0x80(r31)
/* 0000B9E8 934100F8 */ stw r26, 0xf8(r1)
/* 0000B9EC FC010032 */ fmul f0, f1, f0
/* 0000B9F0 C87F00B8 */ lfd f3, 0xb8(r31)
/* 0000B9F4 C82100F8 */ lfd f1, 0xf8(r1)
/* 0000B9F8 C89F0298 */ lfd f4, 0x298(r31)
/* 0000B9FC FC211028 */ fsub f1, f1, f2
/* 0000BA00 FC230072 */ fmul f1, f3, f1
/* 0000BA04 FC240828 */ fsub f1, f4, f1
/* 0000BA08 FC01002A */ fadd f0, f1, f0
/* 0000BA0C FC000018 */ frsp f0, f0
/* 0000BA10 D0010020 */ stfs f0, 0x20(r1)
/* 0000BA14 4BFF4799 */ bl reset_text_draw_settings
/* 0000BA18 88610019 */ lbz r3, 0x19(r1)
/* 0000BA1C 4BFF4791 */ bl set_text_font
/* 0000BA20 C0210058 */ lfs f1, 0x58(r1)
/* 0000BA24 C041005C */ lfs f2, 0x5c(r1)
/* 0000BA28 4BFF4785 */ bl set_text_scale
/* 0000BA2C 8061008C */ lwz r3, 0x8c(r1)
/* 0000BA30 4BFF477D */ bl func_80071B50
/* 0000BA34 C83F0028 */ lfd f1, 0x28(r31)
/* 0000BA38 C0010064 */ lfs f0, 0x64(r1)
/* 0000BA3C FC21002A */ fadd f1, f1, f0
/* 0000BA40 FC200818 */ frsp f1, f1
/* 0000BA44 4BFF4769 */ bl func_80071B1C
/* 0000BA48 38600000 */ li r3, 0
/* 0000BA4C 4BFF4761 */ bl set_text_mul_color
/* 0000BA50 88010089 */ lbz r0, 0x89(r1)
/* 0000BA54 88610088 */ lbz r3, 0x88(r1)
/* 0000BA58 5400402E */ slwi r0, r0, 8
/* 0000BA5C 8881008A */ lbz r4, 0x8a(r1)
/* 0000BA60 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BA64 7C830378 */ or r3, r4, r0
/* 0000BA68 4BFF4745 */ bl set_text_add_color
/* 0000BA6C C85F0030 */ lfd f2, 0x30(r31)
/* 0000BA70 C021001C */ lfs f1, 0x1c(r1)
/* 0000BA74 C0010020 */ lfs f0, 0x20(r1)
/* 0000BA78 FC22082A */ fadd f1, f2, f1
/* 0000BA7C FC42002A */ fadd f2, f2, f0
/* 0000BA80 FC200818 */ frsp f1, f1
/* 0000BA84 FC401018 */ frsp f2, f2
/* 0000BA88 4BFF4725 */ bl set_text_pos
/* 0000BA8C 7FC3F378 */ mr r3, r30
/* 0000BA90 4BFF471D */ bl u_draw_text
/* 0000BA94 C0210064 */ lfs f1, 0x64(r1)
/* 0000BA98 4BFF4715 */ bl func_80071B1C
/* 0000BA9C 88010025 */ lbz r0, 0x25(r1)
/* 0000BAA0 88610024 */ lbz r3, 0x24(r1)
/* 0000BAA4 5400402E */ slwi r0, r0, 8
/* 0000BAA8 88810026 */ lbz r4, 0x26(r1)
/* 0000BAAC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BAB0 7C830378 */ or r3, r4, r0
/* 0000BAB4 4BFF46F9 */ bl set_text_mul_color
/* 0000BAB8 88010089 */ lbz r0, 0x89(r1)
/* 0000BABC 88610088 */ lbz r3, 0x88(r1)
/* 0000BAC0 5400402E */ slwi r0, r0, 8
/* 0000BAC4 8881008A */ lbz r4, 0x8a(r1)
/* 0000BAC8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BACC 7C830378 */ or r3, r4, r0
/* 0000BAD0 4BFF46DD */ bl set_text_add_color
/* 0000BAD4 C021001C */ lfs f1, 0x1c(r1)
/* 0000BAD8 C0410020 */ lfs f2, 0x20(r1)
/* 0000BADC 4BFF46D1 */ bl set_text_pos
/* 0000BAE0 7FC3F378 */ mr r3, r30
/* 0000BAE4 4BFF46C9 */ bl u_draw_text
/* 0000BAE8 3B7B0008 */ addi r27, r27, 8
/* 0000BAEC 3AF70001 */ addi r23, r23, 1
lbl_0000BAF0:
/* 0000BAF0 80160004 */ lwz r0, 4(r22)
/* 0000BAF4 7C170000 */ cmpw r23, r0
/* 0000BAF8 4180FE28 */ blt lbl_0000B920
/* 0000BAFC 3C600000 */ lis r3, lbl_10000000@ha
/* 0000BB00 3AC30000 */ addi r22, r3, lbl_10000000@l
/* 0000BB04 C0160018 */ lfs f0, 0x18(r22)
/* 0000BB08 3B760018 */ addi r27, r22, 0x18
/* 0000BB0C 387D15FC */ addi r3, r29, 0x15fc
/* 0000BB10 D01D1600 */ stfs f0, 0x1600(r29)
/* 0000BB14 C01F02A0 */ lfs f0, 0x2a0(r31)
/* 0000BB18 D01D160C */ stfs f0, 0x160c(r29)
/* 0000BB1C C03F028C */ lfs f1, 0x28c(r31)
/* 0000BB20 C05F0290 */ lfs f2, 0x290(r31)
/* 0000BB24 4BFF8799 */ bl lbl_000042BC
/* 0000BB28 3800008F */ li r0, 0x8f
/* 0000BB2C 98010024 */ stb r0, 0x24(r1)
/* 0000BB30 3AE00000 */ li r23, 0
/* 0000BB34 3B16012C */ addi r24, r22, 0x12c
/* 0000BB38 98010025 */ stb r0, 0x25(r1)
/* 0000BB3C 380000FF */ li r0, 0xff
/* 0000BB40 56F91838 */ slwi r25, r23, 3
/* 0000BB44 9AE10026 */ stb r23, 0x26(r1)
/* 0000BB48 3F404330 */ lis r26, 0x4330
/* 0000BB4C 9AE10088 */ stb r23, 0x88(r1)
/* 0000BB50 9AE10089 */ stb r23, 0x89(r1)
/* 0000BB54 9AE1008A */ stb r23, 0x8a(r1)
/* 0000BB58 C01F00A4 */ lfs f0, 0xa4(r31)
/* 0000BB5C D0010058 */ stfs f0, 0x58(r1)
/* 0000BB60 98010024 */ stb r0, 0x24(r1)
/* 0000BB64 98010025 */ stb r0, 0x25(r1)
/* 0000BB68 9AE10026 */ stb r23, 0x26(r1)
/* 0000BB6C 8016012C */ lwz r0, 0x12c(r22)
/* 0000BB70 54001838 */ slwi r0, r0, 3
/* 0000BB74 7EDD0214 */ add r22, r29, r0
/* 0000BB78 3AD618E8 */ addi r22, r22, 0x18e8
/* 0000BB7C 4800021C */ b lbl_0000BD98
lbl_0000BB80:
/* 0000BB80 80180000 */ lwz r0, 0(r24)
/* 0000BB84 2C000004 */ cmpwi r0, 4
/* 0000BB88 40820020 */ bne lbl_0000BBA8
/* 0000BB8C 380000EF */ li r0, 0xef
/* 0000BB90 98010024 */ stb r0, 0x24(r1)
/* 0000BB94 3860009A */ li r3, 0x9a
/* 0000BB98 38000000 */ li r0, 0
/* 0000BB9C 98610025 */ stb r3, 0x25(r1)
/* 0000BBA0 98010026 */ stb r0, 0x26(r1)
/* 0000BBA4 48000018 */ b lbl_0000BBBC
lbl_0000BBA8:
/* 0000BBA8 386000FF */ li r3, 0xff
/* 0000BBAC 98610024 */ stb r3, 0x24(r1)
/* 0000BBB0 38000000 */ li r0, 0
/* 0000BBB4 98610025 */ stb r3, 0x25(r1)
/* 0000BBB8 98010026 */ stb r0, 0x26(r1)
lbl_0000BBBC:
/* 0000BBBC 80960000 */ lwz r4, 0(r22)
/* 0000BBC0 7FC3F378 */ mr r3, r30
/* 0000BBC4 7C84C82E */ lwzx r4, r4, r25
/* 0000BBC8 4BFF45E5 */ bl strcpy
/* 0000BBCC 4BFF45E1 */ bl reset_text_draw_settings
/* 0000BBD0 88610019 */ lbz r3, 0x19(r1)
/* 0000BBD4 4BFF45D9 */ bl set_text_font
/* 0000BBD8 C0210058 */ lfs f1, 0x58(r1)
/* 0000BBDC C041005C */ lfs f2, 0x5c(r1)
/* 0000BBE0 4BFF45CD */ bl set_text_scale
/* 0000BBE4 8061008C */ lwz r3, 0x8c(r1)
/* 0000BBE8 4BFF45C5 */ bl func_80071B50
/* 0000BBEC C0210064 */ lfs f1, 0x64(r1)
/* 0000BBF0 4BFF45BD */ bl func_80071B1C
/* 0000BBF4 88010025 */ lbz r0, 0x25(r1)
/* 0000BBF8 88610024 */ lbz r3, 0x24(r1)
/* 0000BBFC 5400402E */ slwi r0, r0, 8
/* 0000BC00 88810026 */ lbz r4, 0x26(r1)
/* 0000BC04 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BC08 7C830378 */ or r3, r4, r0
/* 0000BC0C 4BFF45A1 */ bl set_text_mul_color
/* 0000BC10 88010089 */ lbz r0, 0x89(r1)
/* 0000BC14 88610088 */ lbz r3, 0x88(r1)
/* 0000BC18 5400402E */ slwi r0, r0, 8
/* 0000BC1C 8881008A */ lbz r4, 0x8a(r1)
/* 0000BC20 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BC24 7C830378 */ or r3, r4, r0
/* 0000BC28 4BFF4585 */ bl set_text_add_color
/* 0000BC2C 7FC3F378 */ mr r3, r30
/* 0000BC30 4BFF457D */ bl u_get_text_width
/* 0000BC34 C81F0058 */ lfd f0, 0x58(r31)
/* 0000BC38 6EE08000 */ xoris r0, r23, 0x8000
/* 0000BC3C 900100FC */ stw r0, 0xfc(r1)
/* 0000BC40 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000BC44 FC000072 */ fmul f0, f0, f1
/* 0000BC48 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000BC4C 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000BC50 C07B0000 */ lfs f3, 0(r27)
/* 0000BC54 934100F8 */ stw r26, 0xf8(r1)
/* 0000BC58 FC220028 */ fsub f1, f2, f0
/* 0000BC5C C80100F8 */ lfd f0, 0xf8(r1)
/* 0000BC60 FC23082A */ fadd f1, f3, f1
/* 0000BC64 FC211028 */ fsub f1, f1, f2
/* 0000BC68 FC200818 */ frsp f1, f1
/* 0000BC6C D021001C */ stfs f1, 0x1c(r1)
/* 0000BC70 80B60004 */ lwz r5, 4(r22)
/* 0000BC74 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000BC78 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000BC7C C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 0000BC80 6C008000 */ xoris r0, r0, 0x8000
/* 0000BC84 FC000828 */ fsub f0, f0, f1
/* 0000BC88 900100F4 */ stw r0, 0xf4(r1)
/* 0000BC8C C83F0080 */ lfd f1, 0x80(r31)
/* 0000BC90 934100F0 */ stw r26, 0xf0(r1)
/* 0000BC94 FC010032 */ fmul f0, f1, f0
/* 0000BC98 C87F00B8 */ lfd f3, 0xb8(r31)
/* 0000BC9C C82100F0 */ lfd f1, 0xf0(r1)
/* 0000BCA0 C89F02A8 */ lfd f4, 0x2a8(r31)
/* 0000BCA4 FC211028 */ fsub f1, f1, f2
/* 0000BCA8 FC230072 */ fmul f1, f3, f1
/* 0000BCAC FC240828 */ fsub f1, f4, f1
/* 0000BCB0 FC01002A */ fadd f0, f1, f0
/* 0000BCB4 FC000018 */ frsp f0, f0
/* 0000BCB8 D0010020 */ stfs f0, 0x20(r1)
/* 0000BCBC 4BFF44F1 */ bl reset_text_draw_settings
/* 0000BCC0 88610019 */ lbz r3, 0x19(r1)
/* 0000BCC4 4BFF44E9 */ bl set_text_font
/* 0000BCC8 C0210058 */ lfs f1, 0x58(r1)
/* 0000BCCC C041005C */ lfs f2, 0x5c(r1)
/* 0000BCD0 4BFF44DD */ bl set_text_scale
/* 0000BCD4 8061008C */ lwz r3, 0x8c(r1)
/* 0000BCD8 4BFF44D5 */ bl func_80071B50
/* 0000BCDC C83F0028 */ lfd f1, 0x28(r31)
/* 0000BCE0 C0010064 */ lfs f0, 0x64(r1)
/* 0000BCE4 FC21002A */ fadd f1, f1, f0
/* 0000BCE8 FC200818 */ frsp f1, f1
/* 0000BCEC 4BFF44C1 */ bl func_80071B1C
/* 0000BCF0 38600000 */ li r3, 0
/* 0000BCF4 4BFF44B9 */ bl set_text_mul_color
/* 0000BCF8 88010089 */ lbz r0, 0x89(r1)
/* 0000BCFC 88610088 */ lbz r3, 0x88(r1)
/* 0000BD00 5400402E */ slwi r0, r0, 8
/* 0000BD04 8881008A */ lbz r4, 0x8a(r1)
/* 0000BD08 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BD0C 7C830378 */ or r3, r4, r0
/* 0000BD10 4BFF449D */ bl set_text_add_color
/* 0000BD14 C85F0030 */ lfd f2, 0x30(r31)
/* 0000BD18 C021001C */ lfs f1, 0x1c(r1)
/* 0000BD1C C0010020 */ lfs f0, 0x20(r1)
/* 0000BD20 FC22082A */ fadd f1, f2, f1
/* 0000BD24 FC42002A */ fadd f2, f2, f0
/* 0000BD28 FC200818 */ frsp f1, f1
/* 0000BD2C FC401018 */ frsp f2, f2
/* 0000BD30 4BFF447D */ bl set_text_pos
/* 0000BD34 7FC3F378 */ mr r3, r30
/* 0000BD38 4BFF4475 */ bl u_draw_text
/* 0000BD3C C0210064 */ lfs f1, 0x64(r1)
/* 0000BD40 4BFF446D */ bl func_80071B1C
/* 0000BD44 88010025 */ lbz r0, 0x25(r1)
/* 0000BD48 88610024 */ lbz r3, 0x24(r1)
/* 0000BD4C 5400402E */ slwi r0, r0, 8
/* 0000BD50 88810026 */ lbz r4, 0x26(r1)
/* 0000BD54 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BD58 7C830378 */ or r3, r4, r0
/* 0000BD5C 4BFF4451 */ bl set_text_mul_color
/* 0000BD60 88010089 */ lbz r0, 0x89(r1)
/* 0000BD64 88610088 */ lbz r3, 0x88(r1)
/* 0000BD68 5400402E */ slwi r0, r0, 8
/* 0000BD6C 8881008A */ lbz r4, 0x8a(r1)
/* 0000BD70 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BD74 7C830378 */ or r3, r4, r0
/* 0000BD78 4BFF4435 */ bl set_text_add_color
/* 0000BD7C C021001C */ lfs f1, 0x1c(r1)
/* 0000BD80 C0410020 */ lfs f2, 0x20(r1)
/* 0000BD84 4BFF4429 */ bl set_text_pos
/* 0000BD88 7FC3F378 */ mr r3, r30
/* 0000BD8C 4BFF4421 */ bl u_draw_text
/* 0000BD90 3B390008 */ addi r25, r25, 8
/* 0000BD94 3AF70001 */ addi r23, r23, 1
lbl_0000BD98:
/* 0000BD98 80160004 */ lwz r0, 4(r22)
/* 0000BD9C 7C170000 */ cmpw r23, r0
/* 0000BDA0 4180FDE0 */ blt lbl_0000BB80
/* 0000BDA4 801C0000 */ lwz r0, 0(r28)
/* 0000BDA8 2C000004 */ cmpwi r0, 4
/* 0000BDAC 40820370 */ bne lbl_0000C11C
/* 0000BDB0 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000BDB4 C85F0250 */ lfd f2, 0x250(r31)
/* 0000BDB8 38830000 */ addi r4, r3, unpausedFrameCounter@l
/* 0000BDBC C89F0248 */ lfd f4, 0x248(r31)
/* 0000BDC0 3C608889 */ lis r3, 0x8889
/* 0000BDC4 80840000 */ lwz r4, 0(r4)
/* 0000BDC8 38038889 */ addi r0, r3, -30583  ;# fixed addi
/* 0000BDCC 7C002016 */ mulhwu r0, r0, r4
/* 0000BDD0 5400D97E */ srwi r0, r0, 5
/* 0000BDD4 1C00003C */ mulli r0, r0, 0x3c
/* 0000BDD8 7C002050 */ subf r0, r0, r4
/* 0000BDDC 900100F4 */ stw r0, 0xf4(r1)
/* 0000BDE0 3CA04330 */ lis r5, 0x4330
/* 0000BDE4 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 0000BDE8 90A100F0 */ stw r5, 0xf0(r1)
/* 0000BDEC 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000BDF0 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 0000BDF4 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000BDF8 C80100F0 */ lfd f0, 0xf0(r1)
/* 0000BDFC C8640000 */ lfd f3, lbl_0000C380@l(r4)
/* 0000BE00 EC000828 */ fsubs f0, f0, f1
/* 0000BE04 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000BE08 FC00001E */ fctiwz f0, f0
/* 0000BE0C D80100F8 */ stfd f0, 0xf8(r1)
/* 0000BE10 800100FC */ lwz r0, 0xfc(r1)
/* 0000BE14 6C008000 */ xoris r0, r0, 0x8000
/* 0000BE18 900100EC */ stw r0, 0xec(r1)
/* 0000BE1C 90A100E8 */ stw r5, 0xe8(r1)
/* 0000BE20 C80100E8 */ lfd f0, 0xe8(r1)
/* 0000BE24 FC001828 */ fsub f0, f0, f3
/* 0000BE28 FC001028 */ fsub f0, f0, f2
/* 0000BE2C FC00001E */ fctiwz f0, f0
/* 0000BE30 D80100E0 */ stfd f0, 0xe0(r1)
/* 0000BE34 800100E4 */ lwz r0, 0xe4(r1)
/* 0000BE38 7C03FE70 */ srawi r3, r0, 0x1f
/* 0000BE3C 7C600278 */ xor r0, r3, r0
/* 0000BE40 7C030050 */ subf r0, r3, r0
/* 0000BE44 6C008000 */ xoris r0, r0, 0x8000
/* 0000BE48 900100DC */ stw r0, 0xdc(r1)
/* 0000BE4C 90A100D8 */ stw r5, 0xd8(r1)
/* 0000BE50 C80100D8 */ lfd f0, 0xd8(r1)
/* 0000BE54 EC000828 */ fsubs f0, f0, f1
/* 0000BE58 FC001024 */ fdiv f0, f0, f2
/* 0000BE5C FC240032 */ fmul f1, f4, f0
/* 0000BE60 4BFF434D */ bl __cvt_fp2unsigned
/* 0000BE64 C85F02B0 */ lfd f2, 0x2b0(r31)
/* 0000BE68 3C800000 */ lis r4, lbl_10000000@ha
/* 0000BE6C C03B0000 */ lfs f1, 0(r27)
/* 0000BE70 38840000 */ addi r4, r4, lbl_10000000@l
/* 0000BE74 C81F00A8 */ lfd f0, 0xa8(r31)
/* 0000BE78 FC22082A */ fadd f1, f2, f1
/* 0000BE7C 3B040138 */ addi r24, r4, 0x138
/* 0000BE80 3B830000 */ addi r28, r3, 0
/* 0000BE84 FC010028 */ fsub f0, f1, f0
/* 0000BE88 FC000018 */ frsp f0, f0
/* 0000BE8C D001001C */ stfs f0, 0x1c(r1)
/* 0000BE90 C01F02B8 */ lfs f0, 0x2b8(r31)
/* 0000BE94 D0010020 */ stfs f0, 0x20(r1)
/* 0000BE98 80040138 */ lwz r0, 0x138(r4)
/* 0000BE9C 2C000000 */ cmpwi r0, 0
/* 0000BEA0 40820028 */ bne lbl_0000BEC8
/* 0000BEA4 3860008F */ li r3, 0x8f
/* 0000BEA8 98610024 */ stb r3, 0x24(r1)
/* 0000BEAC 38000000 */ li r0, 0
/* 0000BEB0 98610025 */ stb r3, 0x25(r1)
/* 0000BEB4 98010026 */ stb r0, 0x26(r1)
/* 0000BEB8 98010088 */ stb r0, 0x88(r1)
/* 0000BEBC 98010089 */ stb r0, 0x89(r1)
/* 0000BEC0 9801008A */ stb r0, 0x8a(r1)
/* 0000BEC4 48000024 */ b lbl_0000BEE8
lbl_0000BEC8:
/* 0000BEC8 386000FF */ li r3, 0xff
/* 0000BECC 98610024 */ stb r3, 0x24(r1)
/* 0000BED0 38000000 */ li r0, 0
/* 0000BED4 98610025 */ stb r3, 0x25(r1)
/* 0000BED8 98010026 */ stb r0, 0x26(r1)
/* 0000BEDC 9B810088 */ stb r28, 0x88(r1)
/* 0000BEE0 9B810089 */ stb r28, 0x89(r1)
/* 0000BEE4 9B81008A */ stb r28, 0x8a(r1)
lbl_0000BEE8:
/* 0000BEE8 387E0000 */ addi r3, r30, 0
/* 0000BEEC 389D03C8 */ addi r4, r29, 0x3c8
/* 0000BEF0 4BFF42BD */ bl strcpy
/* 0000BEF4 4BFF42B9 */ bl reset_text_draw_settings
/* 0000BEF8 88610019 */ lbz r3, 0x19(r1)
/* 0000BEFC 4BFF42B1 */ bl set_text_font
/* 0000BF00 C0210058 */ lfs f1, 0x58(r1)
/* 0000BF04 C041005C */ lfs f2, 0x5c(r1)
/* 0000BF08 4BFF42A5 */ bl set_text_scale
/* 0000BF0C 8061008C */ lwz r3, 0x8c(r1)
/* 0000BF10 4BFF429D */ bl func_80071B50
/* 0000BF14 C83F0028 */ lfd f1, 0x28(r31)
/* 0000BF18 C0010064 */ lfs f0, 0x64(r1)
/* 0000BF1C FC21002A */ fadd f1, f1, f0
/* 0000BF20 FC200818 */ frsp f1, f1
/* 0000BF24 4BFF4289 */ bl func_80071B1C
/* 0000BF28 38600000 */ li r3, 0
/* 0000BF2C 4BFF4281 */ bl set_text_mul_color
/* 0000BF30 88010089 */ lbz r0, 0x89(r1)
/* 0000BF34 88610088 */ lbz r3, 0x88(r1)
/* 0000BF38 5400402E */ slwi r0, r0, 8
/* 0000BF3C 8881008A */ lbz r4, 0x8a(r1)
/* 0000BF40 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BF44 7C830378 */ or r3, r4, r0
/* 0000BF48 4BFF4265 */ bl set_text_add_color
/* 0000BF4C C85F0030 */ lfd f2, 0x30(r31)
/* 0000BF50 C021001C */ lfs f1, 0x1c(r1)
/* 0000BF54 C0010020 */ lfs f0, 0x20(r1)
/* 0000BF58 FC22082A */ fadd f1, f2, f1
/* 0000BF5C FC42002A */ fadd f2, f2, f0
/* 0000BF60 FC200818 */ frsp f1, f1
/* 0000BF64 FC401018 */ frsp f2, f2
/* 0000BF68 4BFF4245 */ bl set_text_pos
/* 0000BF6C 7FC3F378 */ mr r3, r30
/* 0000BF70 4BFF423D */ bl u_draw_text
/* 0000BF74 C0210064 */ lfs f1, 0x64(r1)
/* 0000BF78 4BFF4235 */ bl func_80071B1C
/* 0000BF7C 88010025 */ lbz r0, 0x25(r1)
/* 0000BF80 88610024 */ lbz r3, 0x24(r1)
/* 0000BF84 5400402E */ slwi r0, r0, 8
/* 0000BF88 88810026 */ lbz r4, 0x26(r1)
/* 0000BF8C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BF90 7C830378 */ or r3, r4, r0
/* 0000BF94 4BFF4219 */ bl set_text_mul_color
/* 0000BF98 88010089 */ lbz r0, 0x89(r1)
/* 0000BF9C 88610088 */ lbz r3, 0x88(r1)
/* 0000BFA0 5400402E */ slwi r0, r0, 8
/* 0000BFA4 8881008A */ lbz r4, 0x8a(r1)
/* 0000BFA8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BFAC 7C830378 */ or r3, r4, r0
/* 0000BFB0 4BFF41FD */ bl set_text_add_color
/* 0000BFB4 C021001C */ lfs f1, 0x1c(r1)
/* 0000BFB8 C0410020 */ lfs f2, 0x20(r1)
/* 0000BFBC 4BFF41F1 */ bl set_text_pos
/* 0000BFC0 7FC3F378 */ mr r3, r30
/* 0000BFC4 4BFF41E9 */ bl u_draw_text
/* 0000BFC8 C85F02C0 */ lfd f2, 0x2c0(r31)
/* 0000BFCC C03B0000 */ lfs f1, 0(r27)
/* 0000BFD0 C81F00A8 */ lfd f0, 0xa8(r31)
/* 0000BFD4 FC22082A */ fadd f1, f2, f1
/* 0000BFD8 FC010028 */ fsub f0, f1, f0
/* 0000BFDC FC000018 */ frsp f0, f0
/* 0000BFE0 D001001C */ stfs f0, 0x1c(r1)
/* 0000BFE4 C01F02B8 */ lfs f0, 0x2b8(r31)
/* 0000BFE8 D0010020 */ stfs f0, 0x20(r1)
/* 0000BFEC 80180000 */ lwz r0, 0(r24)
/* 0000BFF0 2C000000 */ cmpwi r0, 0
/* 0000BFF4 40820028 */ bne lbl_0000C01C
/* 0000BFF8 386000FF */ li r3, 0xff
/* 0000BFFC 98610024 */ stb r3, 0x24(r1)
/* 0000C000 38000000 */ li r0, 0
/* 0000C004 98610025 */ stb r3, 0x25(r1)
/* 0000C008 98010026 */ stb r0, 0x26(r1)
/* 0000C00C 9B810088 */ stb r28, 0x88(r1)
/* 0000C010 9B810089 */ stb r28, 0x89(r1)
/* 0000C014 9B81008A */ stb r28, 0x8a(r1)
/* 0000C018 48000024 */ b lbl_0000C03C
lbl_0000C01C:
/* 0000C01C 3860008F */ li r3, 0x8f
/* 0000C020 98610024 */ stb r3, 0x24(r1)
/* 0000C024 38000000 */ li r0, 0
/* 0000C028 98610025 */ stb r3, 0x25(r1)
/* 0000C02C 98010026 */ stb r0, 0x26(r1)
/* 0000C030 98010088 */ stb r0, 0x88(r1)
/* 0000C034 98010089 */ stb r0, 0x89(r1)
/* 0000C038 9801008A */ stb r0, 0x8a(r1)
lbl_0000C03C:
/* 0000C03C 387E0000 */ addi r3, r30, 0
/* 0000C040 389D03D0 */ addi r4, r29, 0x3d0
/* 0000C044 4BFF4169 */ bl strcpy
/* 0000C048 4BFF4165 */ bl reset_text_draw_settings
/* 0000C04C 88610019 */ lbz r3, 0x19(r1)
/* 0000C050 4BFF415D */ bl set_text_font
/* 0000C054 C0210058 */ lfs f1, 0x58(r1)
/* 0000C058 C041005C */ lfs f2, 0x5c(r1)
/* 0000C05C 4BFF4151 */ bl set_text_scale
/* 0000C060 8061008C */ lwz r3, 0x8c(r1)
/* 0000C064 4BFF4149 */ bl func_80071B50
/* 0000C068 C83F0028 */ lfd f1, 0x28(r31)
/* 0000C06C C0010064 */ lfs f0, 0x64(r1)
/* 0000C070 FC21002A */ fadd f1, f1, f0
/* 0000C074 FC200818 */ frsp f1, f1
/* 0000C078 4BFF4135 */ bl func_80071B1C
/* 0000C07C 38600000 */ li r3, 0
/* 0000C080 4BFF412D */ bl set_text_mul_color
/* 0000C084 88010089 */ lbz r0, 0x89(r1)
/* 0000C088 88610088 */ lbz r3, 0x88(r1)
/* 0000C08C 5400402E */ slwi r0, r0, 8
/* 0000C090 8881008A */ lbz r4, 0x8a(r1)
/* 0000C094 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000C098 7C830378 */ or r3, r4, r0
/* 0000C09C 4BFF4111 */ bl set_text_add_color
/* 0000C0A0 C85F0030 */ lfd f2, 0x30(r31)
/* 0000C0A4 C021001C */ lfs f1, 0x1c(r1)
/* 0000C0A8 C0010020 */ lfs f0, 0x20(r1)
/* 0000C0AC FC22082A */ fadd f1, f2, f1
/* 0000C0B0 FC42002A */ fadd f2, f2, f0
/* 0000C0B4 FC200818 */ frsp f1, f1
/* 0000C0B8 FC401018 */ frsp f2, f2
/* 0000C0BC 4BFF40F1 */ bl set_text_pos
/* 0000C0C0 7FC3F378 */ mr r3, r30
/* 0000C0C4 4BFF40E9 */ bl u_draw_text
/* 0000C0C8 C0210064 */ lfs f1, 0x64(r1)
/* 0000C0CC 4BFF40E1 */ bl func_80071B1C
/* 0000C0D0 88010025 */ lbz r0, 0x25(r1)
/* 0000C0D4 88610024 */ lbz r3, 0x24(r1)
/* 0000C0D8 5400402E */ slwi r0, r0, 8
/* 0000C0DC 88810026 */ lbz r4, 0x26(r1)
/* 0000C0E0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000C0E4 7C830378 */ or r3, r4, r0
/* 0000C0E8 4BFF40C5 */ bl set_text_mul_color
/* 0000C0EC 88010089 */ lbz r0, 0x89(r1)
/* 0000C0F0 88610088 */ lbz r3, 0x88(r1)
/* 0000C0F4 5400402E */ slwi r0, r0, 8
/* 0000C0F8 8881008A */ lbz r4, 0x8a(r1)
/* 0000C0FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000C100 7C830378 */ or r3, r4, r0
/* 0000C104 4BFF40A9 */ bl set_text_add_color
/* 0000C108 C021001C */ lfs f1, 0x1c(r1)
/* 0000C10C C0410020 */ lfs f2, 0x20(r1)
/* 0000C110 4BFF409D */ bl set_text_pos
/* 0000C114 7FC3F378 */ mr r3, r30
/* 0000C118 4BFF4095 */ bl u_draw_text
lbl_0000C11C:
/* 0000C11C 4BFF4091 */ bl mathutil_mtxA_from_identity
/* 0000C120 3C600000 */ lis r3, mathutilData@ha
/* 0000C124 38630000 */ addi r3, r3, mathutilData@l
/* 0000C128 80630000 */ lwz r3, 0(r3)
/* 0000C12C 38800000 */ li r4, 0
/* 0000C130 4BFF407D */ bl GXLoadPosMtxImm
/* 0000C134 BAC10100 */ lmw r22, 0x100(r1)
/* 0000C138 8001012C */ lwz r0, 0x12c(r1)
/* 0000C13C 38210128 */ addi r1, r1, 0x128
/* 0000C140 7C0803A6 */ mtlr r0
/* 0000C144 4E800020 */ blr 
lbl_0000C148:
/* 0000C148 7C0802A6 */ mflr r0
/* 0000C14C 3C600000 */ lis r3, lbl_0000C370@ha
/* 0000C150 90010004 */ stw r0, 4(r1)
/* 0000C154 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000C158 93E1000C */ stw r31, 0xc(r1)
/* 0000C15C 3BE30000 */ addi r31, r3, lbl_0000C370@l
/* 0000C160 3860005F */ li r3, 0x5f
/* 0000C164 4BFF4049 */ bl find_sprite_with_tag
/* 0000C168 28030000 */ cmplwi r3, 0
/* 0000C16C 41820018 */ beq lbl_0000C184
/* 0000C170 3C600000 */ lis r3, lbl_10000000@ha
/* 0000C174 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000C178 38000004 */ li r0, 4
/* 0000C17C 9803011C */ stb r0, 0x11c(r3)
/* 0000C180 48000090 */ b lbl_0000C210
lbl_0000C184:
/* 0000C184 3860005F */ li r3, 0x5f
/* 0000C188 4BFF7DE5 */ bl lbl_00003F6C
/* 0000C18C 28030000 */ cmplwi r3, 0
/* 0000C190 41820024 */ beq lbl_0000C1B4
/* 0000C194 38000004 */ li r0, 4
/* 0000C198 98030000 */ stb r0, 0(r3)
/* 0000C19C 3800001E */ li r0, 0x1e
/* 0000C1A0 98030001 */ stb r0, 1(r3)
/* 0000C1A4 C01F0024 */ lfs f0, 0x24(r31)
/* 0000C1A8 D0030004 */ stfs f0, 4(r3)
/* 0000C1AC C01F0000 */ lfs f0, 0(r31)
/* 0000C1B0 D0030008 */ stfs f0, 8(r3)
lbl_0000C1B4:
/* 0000C1B4 3C600000 */ lis r3, lbl_10000000@ha
/* 0000C1B8 C01F02C8 */ lfs f0, 0x2c8(r31)
/* 0000C1BC 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000C1C0 D0030128 */ stfs f0, 0x128(r3)
/* 0000C1C4 38000004 */ li r0, 4
/* 0000C1C8 9003012C */ stw r0, 0x12c(r3)
/* 0000C1CC C01F02CC */ lfs f0, 0x2cc(r31)
/* 0000C1D0 D0030018 */ stfs f0, 0x18(r3)
/* 0000C1D4 4BFF3FD9 */ bl create_sprite
/* 0000C1D8 28030000 */ cmplwi r3, 0
/* 0000C1DC 41820034 */ beq lbl_0000C210
/* 0000C1E0 3800005F */ li r0, 0x5f
/* 0000C1E4 3C800000 */ lis r4, lbl_0000B10C@ha
/* 0000C1E8 9803000F */ stb r0, 0xf(r3)
/* 0000C1EC 38040000 */ addi r0, r4, lbl_0000B10C@l
/* 0000C1F0 3C800000 */ lis r4, lbl_0000B218@ha
/* 0000C1F4 90030034 */ stw r0, 0x34(r3)
/* 0000C1F8 38040000 */ addi r0, r4, lbl_0000B218@l
/* 0000C1FC 3C800000 */ lis r4, lbl_0000D310@ha
/* 0000C200 90030038 */ stw r0, 0x38(r3)
/* 0000C204 38840000 */ addi r4, r4, lbl_0000D310@l
/* 0000C208 3863008C */ addi r3, r3, 0x8c
/* 0000C20C 4BFF3FA1 */ bl strcpy
lbl_0000C210:
/* 0000C210 80010014 */ lwz r0, 0x14(r1)
/* 0000C214 83E1000C */ lwz r31, 0xc(r1)
/* 0000C218 38210010 */ addi r1, r1, 0x10
/* 0000C21C 7C0803A6 */ mtlr r0
/* 0000C220 4E800020 */ blr 

# 2
.section .ctors
    # 0xC224
#    .4byte 0x00000000

# 3
.section .dtors
    # 0xC228
#    .4byte 0x00000000

# 4
.section .rodata
.if 0
lbl_0000C230:
    # 0xC230
    .4byte 0x54000000
.endif
    .4byte 0x3B3B0000
    .4byte 0x00540000
    .4byte 0xC53B0000
    .4byte 0xAC000000
    .4byte 0xC5C50000
    .4byte 0x00AC0000
    .4byte 0x3BC50000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC0000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC0000000
    .4byte 0x3FD9999A
    .4byte 0x3C23D70A
lbl_0000C270:
    # 0xC270
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0xFF0000FF
    .4byte 0x0000FFFF
    .4byte 0xFFFF00FF
    .4byte 0x00FF00FF
    .4byte 0x000000FF
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42700000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0xC2700000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC2700000
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x42700000
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41C00000
    .4byte 0x43A00000
    .4byte 0x40E00000
    .4byte 0x43160000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x43700000
    .4byte 0x41000000
    .4byte 0x3F800000
    .4byte 0x3DCCCCCD
    .4byte 0x40740000
    .4byte 0x00000000
    .4byte 0x40733EB8
    .4byte 0x51EB851F
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x406E0000
    .4byte 0x00000000
lbl_0000C348:
    # 0xC348
    .4byte 0x00000000
    .4byte 0x4370199A
    .4byte 0x461C4000
    .4byte 0x3F000000
    .4byte 0x3F4CCCCD
    .4byte 0x42700000
    .4byte 0x43FF0000
    .4byte 0x43DC0000
lbl_0000C368:
    # 0xC368
    .4byte 0x43300000
    .4byte 0x00000000
lbl_0000C370:
    # 0xC370
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3FECCCCC
    .4byte 0xCCCCCCCD
lbl_0000C380:
    # 0xC380
    .4byte 0x43300000
    .4byte 0x80000000
lbl_0000C388:
    # 0xC388
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC4688000
lbl_0000C394:
    # 0xC394
    .4byte 0x44688000
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x40180000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x40280000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x43A00000
    .4byte 0x4370199A
    .4byte 0x461C4000
    .4byte 0x40200000
    .4byte 0x00000000
    .4byte 0x405E0000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x43820000
    .4byte 0x42380000
    .4byte 0x43A80000
    .4byte 0x43300000
    .4byte 0x43500000
    .4byte 0x43810000
    .4byte 0x3F4CCCCD
    .4byte 0x40740000
    .4byte 0x00000000
    .4byte 0x4078A000
    .4byte 0x00000000
    .4byte 0x40300000
    .4byte 0x00000000
    .4byte 0x40600000
    .4byte 0x00000000
    .4byte 0x43640000
    .4byte 0x44430000
    .4byte 0x435C0000
    .4byte 0x43F80000
    .4byte 0x44610000
    .4byte 0x43D80000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x4057C000
    .4byte 0x00000000
    .4byte 0x40754000
    .4byte 0x00000000
    .4byte 0x40550000
    .4byte 0x00000000
    .4byte 0x405E8000
    .4byte 0x00000000
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x40606000
    .4byte 0x00000000
    .4byte 0x4070E000
    .4byte 0x00000000
    .4byte 0x43BD0000
    .4byte 0x43CF0000
    .4byte 0x43660000
    .4byte 0x43870000
    .4byte 0x42CC0000
    .4byte 0x43BB0000
    .4byte 0x42C00000
    .4byte 0x42880000
lbl_0000C4B0:
    # 0xC4B0
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x43D00000
    .4byte 0x42A00000
    .4byte 0x4060E000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F19999A
    .4byte 0x43F40000
    .4byte 0x43070000
    .4byte 0x43270000
    .4byte 0x43938000
    .4byte 0x43E50000
    .4byte 0x43960000
    .4byte 0x3F28F5C3
    .4byte 0x00000000
    .4byte 0x4064E000
    .4byte 0x00000000
    .4byte 0xC1A00000
    .4byte 0x41A00000
    .4byte 0x43C50000
    .4byte 0x429C0000
    .4byte 0x43580000
    .4byte 0x43D50000
    .4byte 0x43F60000
    .4byte 0x40A00000
    .4byte 0x3FAAAAAB
    .4byte 0x43DE0000
    .4byte 0x4062CCCC
    .4byte 0xCCCCCCCD
    .4byte 0x405C0000
    .4byte 0x00000000
    .4byte 0x3FC00000
    .4byte 0x00000000
    .4byte 0x3F400000
    .4byte 0x43CD0000
    .4byte 0x42200000
    .4byte 0x3F99999A
    .4byte 0x40678000
    .4byte 0x00000000
    .4byte 0x406AC000
    .4byte 0x00000000
    .4byte 0x40580000
    .4byte 0x00000000
    .4byte 0x4069C000
    .4byte 0x00000000
    .4byte 0x42DC0000
    .4byte 0x43200000
    .4byte 0x4068C000
    .4byte 0x00000000
    .4byte 0x434E0000
    .4byte 0x00000000
    .4byte 0x40660000
    .4byte 0x00000000
    .4byte 0x43240000
    .4byte 0x43520000
    .4byte 0x40650000
    .4byte 0x00000000
    .4byte 0x4065C000
    .4byte 0x00000000
    .4byte 0x43D70000
    .4byte 0x43D10000
    .4byte 0x43CC0000
    .4byte 0x3FB5C28F
    .4byte 0x43E48000
    .4byte 0x00000000
    .4byte 0x406FE000
    .4byte 0x00000000
    .4byte 0x403E0000
    .4byte 0x00000000
    .4byte 0x43808000
    .4byte 0x43AC8000
    .4byte 0x40638000
    .4byte 0x00000000
    .4byte 0x40931000
    .4byte 0x00000000
    .4byte 0x40628000
    .4byte 0x00000000
    .4byte 0x43C60000
    .4byte 0x43540000
    .4byte 0x43D20000
    .4byte 0x43C40000
    .4byte 0x3FB33333
    .4byte 0x44080000
    .4byte 0x42B00000
    .4byte 0x3F23D70A
    .4byte 0x4077A000
    .4byte 0x00000000
    .4byte 0x3F933333
    .4byte 0x00000000
    .4byte 0x4076C000
    .4byte 0x00000000
    .4byte 0x40701000
    .4byte 0x00000000
    .4byte 0x43CE0000
    .4byte 0x00000000
    .4byte 0x40759000
    .4byte 0x00000000
    .4byte 0x42F40000
    .4byte 0x44988000

# 5
.section .data
lbl_0000C640:
    # 0xC640
    .4byte lbl_000002F4
    .4byte lbl_00000360
    .4byte lbl_0000057C
    .4byte lbl_000005E8
    .4byte lbl_00000AE0
    .4byte lbl_00000C94
    .4byte lbl_0000073C
    .4byte lbl_0000077C
    .4byte lbl_000020E0
    .4byte lbl_0000210C
    .4byte lbl_00002158
    .4byte lbl_000021D8
    .4byte lbl_00002C74
    .4byte lbl_00002CEC
    .4byte lbl_000026A0
    .4byte lbl_00002704
    .4byte lbl_00002D78
    .4byte lbl_00002DA4
    .4byte lbl_00002F14
    .4byte lbl_00003240
    .4byte lbl_00003C2C
    .4byte lbl_00003C6C
    .4byte lbl_00003D8C
    .4byte lbl_00003DD8
    .4byte 0x00000000
lbl_0000C6A4:
    # 0xC6A4
    .byte 0x02
lbl_0000C6A5:
    # 0xC6A5
    .byte 0x03, 0x00, 0x00
lbl_0000C6A8:
    # 0xC6A8
    .asciz "OPTION LOADED\n"
    .balign 4
lbl_0000C6B8:
    # 0xC6B8
    .asciz "OPTION PURGED\n"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "option.c"
    .balign 4
    .4byte 0x0A000000
lbl_0000C744:
    # 0xC744
    .asciz "sub_mode: error %d in Option"
    .balign 4
lbl_0000C764:
    # 0xC764
    .asciz "REPLAY"
    .balign 4
lbl_0000C76C:
    # 0xC76C
    .asciz "POINT"
    .balign 4
lbl_0000C774:
    # 0xC774
    .asciz "RANKING"
lbl_0000C77C:
    # 0xC77C
    .asciz "SOUND"
    .balign 4
lbl_0000C784:
    # 0xC784
    .asciz "SEPARATE MODE"
    .balign 4
lbl_0000C794:
    # 0xC794
    .4byte 0x50414400
lbl_0000C798:
    # 0xC798
    .asciz "MEMORY CARD"
lbl_0000C7A4:
    # 0xC7A4
    .4byte 0x00000000
    .4byte lbl_0000C764
    .4byte 0x000000BC
    .4byte 0x00000000
    .4byte lbl_0000C76C
    .4byte 0x000000B6
    .4byte 0x00000000
    .4byte lbl_0000C774
    .4byte 0x000000B8
    .4byte 0x00000000
    .4byte lbl_0000C77C
    .4byte 0x000000B0
    .4byte 0x00000000
    .4byte lbl_0000C784
    .4byte 0x000000BE
    .4byte 0x00000000
    .4byte lbl_0000C794
    .4byte 0x000000C2
    .4byte 0x00000000
    .4byte lbl_0000C798
    .4byte 0x000000B4
    .4byte 0xC3C80000
    .4byte 0x428C0000
    .4byte 0x3F1D0E56
    .4byte 0x0049FFF9
    .asciz "a/Controller %d"
    .asciz "a/No controller\nconnected"
    .balign 4
    .asciz "p/LEVER/"
    .balign 4
lbl_0000C840:
    # 0xC840
    .4byte 0x00010203
    .4byte 0x04050607
    .4byte 0x08000000
lbl_0000C84C:
    # 0xC84C
    .4byte 0x090A0B00
lbl_0000C850:
    # 0xC850
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_0000C840
    .4byte 0x09000000
    .4byte lbl_0000C84C
    .4byte 0x03000000
lbl_0000C868:
    # 0xC868
    .4byte lbl_00002768
    .4byte lbl_000027B4
    .4byte lbl_000028E8
    .4byte lbl_000029EC
    .4byte lbl_00002A4C
    .4byte lbl_00002A68
    .4byte lbl_00002B54
lbl_0000C884:
    # 0xC884
    .4byte 0x626B6700
    .asciz "MASTER %d"
    .balign 4
    .asciz "EXTRA %d"
    .balign 4
    .asciz "FLOOR %d"
    .balign 4
    .asciz "SCORE:%5d"
    .balign 4
    .asciz " TIME:%5.2f"
lbl_0000C8C4:
    # 0xC8C4
    .4byte lbl_00003F98
    .4byte lbl_00003FA0
    .4byte lbl_00003FA8
    .4byte lbl_00003FB0
    .4byte lbl_00003FB8
    .4byte lbl_00003FC0
    .4byte lbl_00003FC8
    .4byte lbl_00003FD0
    .4byte lbl_00003FD8
    .4byte lbl_00003FE0
    .4byte 0x00000000
lbl_0000C8F0:
    # 0xC8F0
    .4byte 0x0000040D
    .4byte 0x43A00000
    .4byte 0x42700000
    .4byte 0x40A00000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000F
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x3EA80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000417
    .4byte 0x43A00000
    .4byte 0x43640000
    .4byte 0x40A00000
    .4byte 0x3F800000
    .4byte 0x3FC00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000416
    .4byte 0x43A00000
    .4byte 0x43CC0000
    .4byte 0x40A00000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CA30:
    # 0xCA30
    .4byte 0x626B6700
lbl_0000CA34:
    # 0xCA34
    .asciz "a/Replay"
    .balign 4
lbl_0000CA40:
    # 0xCA40
    .asciz "a/Play Points"
    .balign 4
lbl_0000CA50:
    # 0xCA50
    .asciz "a/Rankings"
    .balign 4
lbl_0000CA5C:
    # 0xCA5C
    .asciz "a/Sound"
lbl_0000CA64:
    # 0xCA64
    .asciz "a/Split Screen"
    .balign 4
lbl_0000CA74:
    # 0xCA74
    .asciz "a/Controllers"
    .balign 4
lbl_0000CA84:
    # 0xCA84
    .asciz "a/Game Data"
    .4byte lbl_0000CA34
    .4byte lbl_0000CA40
    .4byte lbl_0000CA50
    .4byte lbl_0000CA5C
    .4byte lbl_0000CA64
    .4byte lbl_0000CA74
    .4byte lbl_0000CA84
lbl_0000CAAC:
    # 0xCAAC
    .asciz "a/You can watch the replays that"
    .balign 4
lbl_0000CAD0:
    # 0xCAD0
    .asciz "a/have been saved to a Memory Card."
lbl_0000CAF4:
    # 0xCAF4
    .4byte lbl_0000CAAC
    .4byte 0x00000000
    .4byte lbl_0000CAD0
    .4byte 0x00000000
lbl_0000CB04:
    # 0xCB04
    .asciz "a/Play Points information."
    .balign 4
lbl_0000CB20:
    # 0xCB20
    .4byte lbl_0000CB04
    .4byte 0x00000000
lbl_0000CB28:
    # 0xCB28
    .asciz "a/You can view the score rankings."
    .balign 4
lbl_0000CB4C:
    # 0xCB4C
    .4byte lbl_0000CB28
    .4byte 0x00000000
lbl_0000CB54:
    # 0xCB54
    .asciz "a/Sound setting."
    .balign 4
lbl_0000CB68:
    # 0xCB68
    .4byte lbl_0000CB54
    .4byte 0x00000000
lbl_0000CB70:
    # 0xCB70
    .asciz "a/Split screen settings"
lbl_0000CB88:
    # 0xCB88
    .asciz "a/for 3 player simultaneous play."
    .balign 4
lbl_0000CBAC:
    # 0xCBAC
    .4byte lbl_0000CB70
    .4byte 0x00000000
    .4byte lbl_0000CB88
    .4byte 0x00000000
lbl_0000CBBC:
    # 0xCBBC
    .asciz "a/Controller settings."
    .balign 4
lbl_0000CBD4:
    # 0xCBD4
    .4byte lbl_0000CBBC
    .4byte 0x00000000
lbl_0000CBDC:
    # 0xCBDC
    .asciz "a/You can save/load or change"
    .balign 4
lbl_0000CBFC:
    # 0xCBFC
    .asciz "a/the game data settings."
    .balign 4
lbl_0000CC18:
    # 0xCC18
    .4byte lbl_0000CBDC
    .4byte 0x00000000
    .4byte lbl_0000CBFC
    .4byte 0x00000000
    .4byte lbl_0000CAF4
    .4byte 0x00000002
    .4byte lbl_0000CB20
    .4byte 0x00000001
    .4byte lbl_0000CB4C
    .4byte 0x00000001
    .4byte lbl_0000CB68
    .4byte 0x00000001
    .4byte lbl_0000CBAC
    .4byte 0x00000002
    .4byte lbl_0000CBD4
    .4byte 0x00000001
    .4byte lbl_0000CC18
    .4byte 0x00000002
    .asciz "a/Options"
    .balign 4
lbl_0000CC6C:
    # 0xCC6C
    .asciz "menu main"
    .balign 4
lbl_0000CC78:
    # 0xCC78
    .asciz "a/BE "
    .balign 4
lbl_0000CC80:
    # 0xCC80
    .asciz "a/AD "
    .balign 4
lbl_0000CC88:
    # 0xCC88
    .asciz "a/EX "
    .balign 4
    .4byte lbl_0000CC78
    .4byte lbl_0000CC80
    .4byte lbl_0000CC88
lbl_0000CC9C:
    # 0xCC9C
    .asciz "a/Watch"
lbl_0000CCA4:
    # 0xCCA4
    .asciz "a/Delete"
    .balign 4
    .4byte lbl_0000CC9C
    .4byte lbl_0000CCA4
lbl_0000CCB8:
    # 0xCCB8
    .asciz "a/Yes"
    .balign 4
lbl_0000CCC0:
    # 0xCCC0
    .asciz "a/No"
    .balign 4
    .4byte lbl_0000CCB8
    .4byte 0x00000002
    .4byte lbl_0000CCC0
    .4byte 0x00000003
    .4byte 0x00000417
    .4byte 0x43A00000
    .4byte 0x43640000
    .4byte 0x40A00000
    .4byte 0x3F800000
    .4byte 0x3FC00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000F
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3EC33333
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000F0020
    .4byte 0x00330003
    .4byte 0x00000429
    .4byte 0x43F80000
    .4byte 0x43200000
    .4byte 0x40A00000
    .4byte 0x3F800000
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000429
    .4byte 0x43D80000
    .4byte 0x438C0000
    .4byte 0x40000000
    .4byte 0x3FD70A3D
    .4byte 0x3F6E147B
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "a/Replay"
    .balign 4
    .asciz "p/SANNKAKU_U/"
    .balign 4
    .asciz "p/SANNKAKU_B/"
    .balign 4
    .asciz "a/Damaged data"
    .balign 4
    .asciz "FLOOR"
    .balign 4
    .asciz "EXTRA"
    .balign 4
    .asciz "MASTER"
    .balign 4
lbl_0000CE74:
    # 0xCE74
    .4byte 0x00000000
    .asciz "%sa/%s %d"
    .balign 4
    .asciz "a/Are you sure?"
    .asciz "a/This Replay data has been damaged."
    .balign 4
    .asciz "a/Please erase the file."
    .balign 4
    .asciz "%6dpts."
    .4byte 0x73000000
    .asciz "a/%2dBlock%s"
    .balign 4
    .asciz "%02d/%02d/%02d %02d:%02d\n"
    .balign 4
lbl_0000CF10:
    # 0xCF10
    .asciz "preview/96x68.tpl"
    .balign 4
    .4byte 0x0000040E
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3EC28F5C
    .4byte 0x3DE38E39
    .4byte 0x00000000
    .4byte 0x3F0E38E4
    .4byte 0x3EC28F5C
    .4byte 0x3F2AAAAB
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CFC4:
    # 0xCFC4
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3EBD70A4
    .4byte 0x3DE38E39
    .4byte 0x00000000
    .4byte 0x3F2AAAAB
    .4byte 0x3EBD70A4
    .4byte 0x3F471C72
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D014:
    # 0xD014
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3EB851EC
    .4byte 0x3DE38E39
    .4byte 0x00000000
    .4byte 0x3F471C72
    .4byte 0x3EB851EC
    .4byte 0x3F638E39
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D064:
    # 0xD064
    .4byte 0x0000043A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_0000CFC4
    .4byte lbl_0000D014
    .4byte lbl_0000D064
    .4byte 0x0000005F
    .4byte 0x43A00000
    .4byte 0x43640000
    .4byte 0x40A00000
    .4byte 0x3FA3D70A
    .4byte 0x3F90A3D7
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D110:
    # 0xD110
    .asciz "a/Number of current Play Points"
lbl_0000D130:
    # 0xD130
    .asciz "a/Points needed to get the next Mini Game"
    .balign 4
lbl_0000D15C:
    # 0xD15C
    .asciz "a/Unlocked Mini Games"
    .balign 4
lbl_0000D174:
    # 0xD174
    .asciz "a/Number of continues"
    .balign 4
    .4byte lbl_0000D110
    .4byte lbl_0000D130
    .4byte lbl_0000D15C
    .4byte lbl_0000CE74
    .4byte lbl_0000CE74
    .4byte lbl_0000D174
    .asciz "a/Play Points"
    .balign 4
    .asciz "a/Newest Play Point record"
    .balign 4
    .asciz "a/Highest Play Point record"
    .asciz "Points needed to increase your number of continues"
    .balign 4
    .4byte 0x25346400
    .asciz " a/Unlimited"
    .balign 4
    .asciz "a/Play Points information"
    .balign 4
    .4byte 0x00000408
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "a/Sound"
    .asciz "a/Sound Setting"
    .asciz "p/SANNKAKU_L/         p/SANNKAKU_R/"
    .asciz "a/Stereo"
    .balign 4
    .asciz "a/ Mono"
    .asciz "a/This is the speaker setting."
    .balign 4
lbl_0000D310:
    # 0xD310
    .asciz "sound menu"
    .balign 4
    .4byte 0x00000429
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40A00000
    .4byte 0x3F4CCCCD
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000004B
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000004B
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D40C:
    # 0xD40C
    .asciz "a/1P WIDE"
    .balign 4
lbl_0000D418:
    # 0xD418
    .asciz "a/2P"
    .balign 4
lbl_0000D420:
    # 0xD420
    .asciz "a/3P"
    .balign 4
lbl_0000D428:
    # 0xD428
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0xFFFF0000
    .4byte lbl_0000D40C
    .4byte 0x42780000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFF2D65FF
    .4byte lbl_0000D418
    .4byte 0x41A00000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFFFBFF2D
    .4byte lbl_0000D420
    .4byte 0x41A00000
lbl_0000D47C:
    # 0xD47C
    .asciz "a/1P"
    .balign 4
lbl_0000D484:
    # 0xD484
    .asciz "a/2P WIDE"
    .balign 4
lbl_0000D490:
    # 0xD490
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFFFF0000
    .4byte lbl_0000D47C
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0xFF2D65FF
    .4byte lbl_0000D484
    .4byte 0x42780000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFFFBFF2D
    .4byte lbl_0000D420
    .4byte 0x41A00000
lbl_0000D4E4:
    # 0xD4E4
    .asciz "a/3P WIDE"
    .balign 4
lbl_0000D4F0:
    # 0xD4F0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFFFF0000
    .4byte lbl_0000D47C
    .4byte 0x41A00000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFF2D65FF
    .4byte lbl_0000D418
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0xFFFBFF2D
    .4byte lbl_0000D4E4
    .4byte 0x42780000
lbl_0000D544:
    # 0xD544
    .asciz "a/LIVE"
    .balign 4
lbl_0000D54C:
    # 0xD54C
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFFFF0000
    .4byte lbl_0000D47C
    .4byte 0x41A00000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFF2D65FF
    .4byte lbl_0000D418
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFFFBFF2D
    .4byte lbl_0000D420
    .4byte 0x41A00000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0x3F000000
    .4byte 0xFF2DFF57
    .4byte lbl_0000D544
    .4byte 0x42080000
lbl_0000D5BC:
    # 0xD5BC
    .asciz "a/4 SPLIT"
    .balign 4
    .4byte 0x436B0000
    .4byte 0x43260000
    .4byte lbl_0000D428
    .4byte 0x00000003
    .4byte lbl_0000D40C
    .4byte 0xC34E0000
    .4byte 0x43CA8000
    .4byte 0x43260000
    .4byte lbl_0000D490
    .4byte 0x00000003
    .4byte lbl_0000D484
    .4byte 0x42B20000
    .4byte 0x436B0000
    .4byte 0x43930000
    .4byte lbl_0000D4F0
    .4byte 0x00000003
    .4byte lbl_0000D4E4
    .4byte 0xC34E0000
    .4byte 0x43CA8000
    .4byte 0x43930000
    .4byte lbl_0000D54C
    .4byte 0x00000004
    .4byte lbl_0000D5BC
    .4byte 0x42B20000
    .asciz "a/Split screen setting"
    .balign 4
    .asciz "a/Allows you to choose the game screen layout"
    .balign 4
    .asciz "a/for 3 player simultaneous games."
    .balign 4
lbl_0000D694:
    # 0xD694
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3E70A3D7
    .4byte 0x3DE38E39
    .4byte 0x3F43D70A
    .4byte 0x3EAAAAAB
    .4byte 0x3F800000
    .4byte 0x3EE38E39
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D6E4:
    # 0xD6E4
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3E947AE1
    .4byte 0x3DE38E39
    .4byte 0x3F35C28F
    .4byte 0x3F2AAAAB
    .4byte 0x3F800000
    .4byte 0x3F471C72
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D734:
    # 0xD734
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3E51EB85
    .4byte 0x3DE38E39
    .4byte 0x3F4A3D71
    .4byte 0x3EE38E39
    .4byte 0x3F7EB852
    .4byte 0x3F0E38E4
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_0000D694
    .4byte lbl_0000D6E4
    .4byte lbl_0000D734
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3EA3D70A
    .4byte 0x3DE38E39
    .4byte 0x3F251EB8
    .4byte 0x3F638E39
    .4byte 0x3F770A3D
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000411
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3E87AE14
    .4byte 0x3DE38E39
    .4byte 0x3F39999A
    .4byte 0x3F0E38E4
    .4byte 0x3F7D70A4
    .4byte 0x3F2AAAAB
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D830:
    # 0xD830
    .asciz "a/The Main Game Normal Mode"
lbl_0000D84C:
    # 0xD84C
    .asciz "a/Beginner, Advanced and Expert rankings."
    .balign 4
lbl_0000D878:
    # 0xD878
    .4byte lbl_0000D830
    .4byte 0x00000000
    .4byte lbl_0000D84C
    .4byte 0x00000000
lbl_0000D888:
    # 0xD888
    .asciz "a/The Party Game Monkey Race and"
    .balign 4
lbl_0000D8AC:
    # 0xD8AC
    .asciz "a/Monkey Target rankings."
    .balign 4
lbl_0000D8C8:
    # 0xD8C8
    .4byte lbl_0000D888
    .4byte 0x00000000
    .4byte lbl_0000D8AC
    .4byte 0x00000000
lbl_0000D8D8:
    # 0xD8D8
    .asciz "a/The Mini Game Monkey Bowling and"
    .balign 4
lbl_0000D8FC:
    # 0xD8FC
    .asciz "a/Monkey Golf rankings."
lbl_0000D914:
    # 0xD914
    .4byte lbl_0000D8D8
    .4byte 0x00000000
    .4byte lbl_0000D8FC
    .4byte 0x00000000
    .4byte lbl_0000D878
    .4byte 0x00000002
    .4byte lbl_0000D8C8
    .4byte 0x00000002
    .4byte lbl_0000D914
    .4byte 0x00000002
    .asciz "a/Rankings"
    .balign 4
    .4byte 0x0000005F
    .4byte 0x43A00000
    .4byte 0x43640000
    .4byte 0x40A00000
    .4byte 0x3FA147AE
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000005F
    .4byte 0x43A00000
    .4byte 0x43640000
    .4byte 0x40A00000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D9E8:
    # 0xD9E8
    .asciz "a/Allows you to adjust the Control Stick."
    .balign 4
lbl_0000DA14:
    # 0xDA14
    .4byte lbl_0000D9E8
    .4byte 0x00000000
lbl_0000DA1C:
    # 0xDA1C
    .asciz "a/You can adjust the Rumble Feature settings."
    .balign 4
lbl_0000DA4C:
    # 0xDA4C
    .4byte lbl_0000DA1C
    .4byte 0x00000000
    .4byte lbl_0000DA14
    .4byte 0x00000001
    .4byte lbl_0000DA4C
    .4byte 0x00000001
lbl_0000DA64:
    # 0xDA64
    .asciz "a/Control Stick adjustment"
    .balign 4
lbl_0000DA80:
    # 0xDA80
    .asciz "a/Rumble Feature"
    .balign 4
    .4byte lbl_0000DA64
    .4byte lbl_0000DA80
    .asciz "a/Controllers"
    .balign 4
    .4byte 0x00000408
    .4byte 0x43E30000
    .4byte 0x43340000
    .4byte 0x3F000000
    .4byte 0x40800000
    .4byte 0x3FAAAAAB
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "a/Controller %d"
    .asciz "p/SANNKAKU_L/a/        p/SANNKAKU_R/"
    .balign 4
    .asciz "a/ON"
    .balign 4
    .asciz "a/OFF"
    .balign 4
    .asciz "a/Adjust the Rumble Feature settings for controller %d."
    .4byte 0x0000005F
    .4byte 0x43A00000
    .4byte 0x43CC0000
    .4byte 0x40A00000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000DBCC:
    # 0xDBCC
    .asciz "a/Please move the Control Sticks"
    .balign 4
lbl_0000DBF0:
    # 0xDBF0
    .asciz "a/for all the connected controllers around."
lbl_0000DC1C:
    # 0xDC1C
    .asciz "a/When you are finished, press the    Button."
    .balign 4
lbl_0000DC4C:
    # 0xDC4C
    .4byte lbl_0000DBCC
    .4byte 0x00000000
    .4byte lbl_0000DBF0
    .4byte 0x00000000
    .4byte lbl_0000DC1C
    .4byte 0x00000000
lbl_0000DC64:
    # 0xDC64
    .asciz "p/BUTTON_A/"
lbl_0000DC70:
    # 0xDC70
    .4byte lbl_0000CE74
    .4byte 0x00000000
    .4byte lbl_0000CE74
    .4byte 0x00000000
    .4byte lbl_0000DC64
    .4byte 0x00000000
    .4byte lbl_0000DC70
    .4byte 0x00000003
lbl_0000DC90:
    # 0xDC90
    .asciz "a/Have you finished adjusting?"
    .balign 4
lbl_0000DCB0:
    # 0xDCB0
    .4byte lbl_0000DC90
    .4byte 0x00000000
    .4byte lbl_0000CE74
    .4byte 0x00000000
lbl_0000DCC0:
    # 0xDCC0
    .asciz "a/The current settings will be used from now on."
    .balign 4
lbl_0000DCF4:
    # 0xDCF4
    .asciz "a/Please press any button."
    .balign 4
lbl_0000DD10:
    # 0xDD10
    .4byte lbl_0000DCC0
    .4byte 0x00000000
    .4byte lbl_0000DCF4
    .4byte 0x00000000
lbl_0000DD20:
    # 0xDD20
    .asciz "a/The current settings will not be used."
    .balign 4
lbl_0000DD4C:
    # 0xDD4C
    .4byte lbl_0000DD20
    .4byte 0x00000000
    .4byte lbl_0000DCF4
    .4byte 0x00000000
lbl_0000DD5C:
    # 0xDD5C
    .asciz "a/Adjustments not completed."
    .balign 4
lbl_0000DD7C:
    # 0xDD7C
    .asciz "a/Please move the Control Stick"
lbl_0000DD9C:
    # 0xDD9C
    .asciz "for all connected controllers."
    .balign 4
lbl_0000DDBC:
    # 0xDDBC
    .4byte lbl_0000DD5C
    .4byte 0x00000000
    .4byte lbl_0000DD7C
    .4byte 0x00000000
    .4byte lbl_0000DD9C
    .4byte 0x00000000
    .4byte lbl_0000DC4C
    .4byte 0x00000003
    .4byte lbl_0000DCB0
    .4byte 0x00000002
    .4byte lbl_0000DD10
    .4byte 0x00000002
    .4byte lbl_0000DD4C
    .4byte 0x00000002
    .4byte lbl_0000DDBC
    .4byte 0x00000003
    .4byte 0x0000005F
    .4byte 0x43A00000
    .4byte 0x43560000
    .4byte 0x40A00000
    .4byte 0x3FA147AE
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000408
    .4byte 0x43E40000
    .4byte 0x43600000
    .4byte 0x40000000
    .4byte 0x40800000
    .4byte 0x3FAAAAAB
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000416
    .4byte 0x43A00000
    .4byte 0x43CC0000
    .4byte 0x40A00000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000416
    .4byte 0x43A00000
    .4byte 0x43BD0000
    .4byte 0x3F000000
    .4byte 0x3F8A3D71
    .4byte 0x3FE66666
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0020000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000DF3C:
    # 0xDF3C
    .asciz "a/Load"
    .balign 4
lbl_0000DF44:
    # 0xDF44
    .asciz "a/Save"
    .balign 4
lbl_0000DF4C:
    # 0xDF4C
    .asciz "a/Autosave"
    .balign 4
lbl_0000DF58:
    # 0xDF58
    .asciz "a/Original settings"
    .4byte lbl_0000DF3C
    .4byte lbl_0000DF44
    .4byte lbl_0000DF4C
    .4byte lbl_0000DF58
lbl_0000DF7C:
    # 0xDF7C
    .asciz "a/This will load previously saved Game Data."
    .balign 4
lbl_0000DFAC:
    # 0xDFAC
    .4byte lbl_0000DF7C
    .4byte 0x00000000
lbl_0000DFB4:
    # 0xDFB4
    .asciz "a/This will save the current Game Data."
lbl_0000DFDC:
    # 0xDFDC
    .asciz "a/Even when you are just saving over an old Game Data,"
    .balign 4
lbl_0000E014:
    # 0xE014
    .asciz "a/there must be 3 free blocks on the Memory Card."
    .balign 4
lbl_0000E048:
    # 0xE048
    .4byte lbl_0000DFB4
    .4byte 0x00000000
    .4byte lbl_0000DFDC
    .4byte 0x00000000
    .4byte lbl_0000E014
    .4byte 0x00000000
lbl_0000E060:
    # 0xE060
    .asciz "a/Will automatically save your Game Data."
    .balign 4
lbl_0000E08C:
    # 0xE08C
    .4byte lbl_0000E060
    .4byte 0x00000000
    .4byte lbl_0000DFDC
    .4byte 0x00000000
    .4byte lbl_0000E014
    .4byte 0x00000000
lbl_0000E0A4:
    # 0xE0A4
    .asciz "a/This returns the Game Data back"
    .balign 4
lbl_0000E0C8:
    # 0xE0C8
    .asciz "a/to the original settings."
lbl_0000E0E4:
    # 0xE0E4
    .4byte lbl_0000E0A4
    .4byte 0x00000000
    .4byte lbl_0000E0C8
    .4byte 0x00000000
lbl_0000E0F4:
    # 0xE0F4
    .asciz "a/This will return the gameplay settings, Rankings,"
lbl_0000E128:
    # 0xE128
    .asciz "Play Points, Mini Games and number of continues"
lbl_0000E158:
    # 0xE158
    .asciz "to the original settings. Is this okay?"
lbl_0000E180:
    # 0xE180
    .4byte lbl_0000E0F4
    .4byte 0x00000000
    .4byte lbl_0000E128
    .4byte 0x00000000
    .4byte lbl_0000E158
    .4byte 0x00000000
    .4byte lbl_0000CE74
    .4byte 0x00000000
lbl_0000E1A0:
    # 0xE1A0
    .asciz "a/Game Data has been returned"
    .balign 4
lbl_0000E1C0:
    # 0xE1C0
    .4byte lbl_0000E1A0
    .4byte 0x00000000
    .4byte lbl_0000E0C8
    .4byte 0x00000000
    .4byte lbl_0000DCF4
    .4byte 0x00000000
    .4byte lbl_0000DFAC
    .4byte 0x00000001
    .4byte lbl_0000E048
    .4byte 0x00000003
    .4byte lbl_0000E08C
    .4byte 0x00000003
    .4byte lbl_0000E0E4
    .4byte 0x00000002
    .4byte lbl_0000E180
    .4byte 0x00000004
    .4byte lbl_0000E1C0
    .4byte 0x00000003
    .asciz "a/Game Data"
    .asciz "p/SANNKAKU_L/        p/SANNKAKU_R/"
    .balign 4
    .4byte 0x4F4E0000
    .4byte 0x4F464600

# 6
.section .bss
lbl_10000000:
    .skip 0x1B4
lbl_100001B4:
    .skip 0x60E8
lbl_1000629C:
    .skip 0xC2C
lbl_10006EC8:
    .skip 0x78

