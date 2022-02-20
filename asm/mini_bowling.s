# id: 4
# version: 1
# nameoffset: 0x5F, size: 0x26
# section table: 0x40, size: 0x90
# imp table: 0x19108
# relocs offset: 0x154C8
# _prolog:     1:0x0
# _epilog:     1:0x64
# _unresolved: 1:0x90
# num sections: 18
.include "macros.inc"
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x0000EF44	flags: 1
# offset: 0x0000F014	length: 0x00000004	flags: 0
# offset: 0x0000F018	length: 0x00000004	flags: 0
# offset: 0x0000F020	length: 0x00005F00	flags: 0
# offset: 0x00014F20	length: 0x000005A8	flags: 0
# offset: 0x10000000	length: 0x0001B288	flags: 0
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
/* 000000D4 3C600000 */ lis r3, lbl_00000718@ha
/* 000000D8 90010004 */ stw r0, 4(r1)
/* 000000DC 3C800000 */ lis r4, lbl_000009EC@ha
/* 000000E0 3CA00000 */ lis r5, lbl_00000F98@ha
/* 000000E4 3CC00000 */ lis r6, lbl_00007878@ha
/* 000000E8 9421FFF8 */ stwu r1, -8(r1)
/* 000000EC 3CE00000 */ lis r7, lbl_0000871C@ha
/* 000000F0 38630000 */ addi r3, r3, lbl_00000718@l
/* 000000F4 38840000 */ addi r4, r4, lbl_000009EC@l
/* 000000F8 38A50000 */ addi r5, r5, lbl_00000F98@l
/* 000000FC 38C60000 */ addi r6, r6, lbl_00007878@l
/* 00000100 38E70000 */ addi r7, r7, lbl_0000871C@l
/* 00000104 4800005D */ bl func_80093AA0
/* 00000108 48000105 */ bl lbl_0000020C
/* 0000010C 3C800000 */ lis r4, gameSubmodeRequest@ha
/* 00000110 38000097 */ li r0, 0x97
/* 00000114 3C600000 */ lis r3, lbl_00015024@ha
/* 00000118 B0040000 */ sth r0, gameSubmodeRequest@l(r4)
/* 0000011C 38630000 */ addi r3, r3, lbl_00015024@l
/* 00000120 48000041 */ bl puts
/* 00000124 8001000C */ lwz r0, 0xc(r1)
/* 00000128 38210008 */ addi r1, r1, 8
/* 0000012C 7C0803A6 */ mtlr r0
/* 00000130 4E800020 */ blr 
.global _epilog
_epilog:
/* 00000134 7C0802A6 */ mflr r0
/* 00000138 90010004 */ stw r0, 4(r1)
/* 0000013C 9421FFF8 */ stwu r1, -8(r1)
/* 00000140 48001749 */ bl lbl_00001888
/* 00000144 3C600000 */ lis r3, lbl_00015040@ha
/* 00000148 38630000 */ addi r3, r3, lbl_00015040@l
/* 0000014C 48000015 */ bl puts
/* 00000150 8001000C */ lwz r0, 0xc(r1)
/* 00000154 38210008 */ addi r1, r1, 8
/* 00000158 7C0803A6 */ mtlr r0
/* 0000015C 4E800020 */ blr 
.global _unresolved
_unresolved:
/* 00000160 7C0802A6 */ mflr r0
/* 00000164 3C600000 */ lis r3, lbl_00014F20@ha
/* 00000168 90010004 */ stw r0, 4(r1)
/* 0000016C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00000170 93E10014 */ stw r31, 0x14(r1)
/* 00000174 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00000178 387F013C */ addi r3, r31, 0x13c
/* 0000017C 93C10010 */ stw r30, 0x10(r1)
/* 00000180 93A1000C */ stw r29, 0xc(r1)
/* 00000184 4BFFFFDD */ bl puts
/* 00000188 387F0164 */ addi r3, r31, 0x164
/* 0000018C 4BFFFFD5 */ bl puts
/* 00000190 3BC00000 */ li r30, 0
/* 00000194 4BFFFFCD */ bl OSGetStackPointer
/* 00000198 7C7D1B78 */ mr r29, r3
/* 0000019C 48000020 */ b lbl_000001BC
lbl_000001A0:
/* 000001A0 80BD0000 */ lwz r5, 0(r29)
/* 000001A4 7FA4EB78 */ mr r4, r29
/* 000001A8 80DD0004 */ lwz r6, 4(r29)
/* 000001AC 387F018C */ addi r3, r31, 0x18c
/* 000001B0 4CC63182 */ crclr 6
/* 000001B4 4BFFFFAD */ bl printf
/* 000001B8 83BD0000 */ lwz r29, 0(r29)
lbl_000001BC:
/* 000001BC 281D0000 */ cmplwi r29, 0
/* 000001C0 4182001C */ beq lbl_000001DC
/* 000001C4 3C1D0001 */ addis r0, r29, 1
/* 000001C8 2800FFFF */ cmplwi r0, 0xffff
/* 000001CC 41820010 */ beq lbl_000001DC
/* 000001D0 281E0010 */ cmplwi r30, 0x10
/* 000001D4 3BDE0001 */ addi r30, r30, 1
/* 000001D8 4180FFC8 */ blt lbl_000001A0
lbl_000001DC:
/* 000001DC 387F01A8 */ addi r3, r31, 0x1a8
/* 000001E0 4CC63182 */ crclr 6
/* 000001E4 38BF01B8 */ addi r5, r31, 0x1b8
/* 000001E8 3880019F */ li r4, 0x19f
/* 000001EC 4BFFFF75 */ bl OSPanic
/* 000001F0 8001001C */ lwz r0, 0x1c(r1)
/* 000001F4 83E10014 */ lwz r31, 0x14(r1)
/* 000001F8 83C10010 */ lwz r30, 0x10(r1)
/* 000001FC 7C0803A6 */ mtlr r0
/* 00000200 83A1000C */ lwz r29, 0xc(r1)
/* 00000204 38210018 */ addi r1, r1, 0x18
/* 00000208 4E800020 */ blr 
lbl_0000020C:
/* 0000020C 7C0802A6 */ mflr r0
/* 00000210 3CA00000 */ lis r5, lbl_10000000@ha
/* 00000214 90010004 */ stw r0, 4(r1)
/* 00000218 3C800000 */ lis r4, lbl_0000F020@ha
/* 0000021C 3C600000 */ lis r3, lbl_00014F20@ha
/* 00000220 9421FFC8 */ stwu r1, -0x38(r1)
/* 00000224 BF010018 */ stmw r24, 0x18(r1)
/* 00000228 3BA50000 */ addi r29, r5, lbl_10000000@l
/* 0000022C 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 00000230 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00000234 4BFFFF2D */ bl event_finish_all
/* 00000238 4BFFFF29 */ bl free_all_bitmap_groups_except_com
/* 0000023C 4BFFFF25 */ bl func_800249D4
/* 00000240 3860000A */ li r3, 0xa
/* 00000244 4BFFFF1D */ bl func_80029228
/* 00000248 4BFFFF19 */ bl func_80044920
/* 0000024C 386000B3 */ li r3, 0xb3
/* 00000250 4BFFFF11 */ bl load_stage
/* 00000254 38600004 */ li r3, 4
/* 00000258 4BFFFF09 */ bl g_load_minigame_graphics
/* 0000025C 38600006 */ li r3, 6
/* 00000260 4BFFFF01 */ bl call_bitmap_load_group
/* 00000264 3C800000 */ lis r4, lbl_00001888@ha
/* 00000268 3C600000 */ lis r3, lbl_802F1B7C@ha
/* 0000026C 38040000 */ addi r0, r4, lbl_00001888@l
/* 00000270 90030000 */ stw r0, lbl_802F1B7C@l(r3)
/* 00000274 38600001 */ li r3, 1
/* 00000278 4BFFFEE9 */ bl event_start
/* 0000027C 38600002 */ li r3, 2
/* 00000280 4BFFFEE1 */ bl event_start
/* 00000284 38600003 */ li r3, 3
/* 00000288 4BFFFED9 */ bl event_start
/* 0000028C 38600004 */ li r3, 4
/* 00000290 4BFFFED1 */ bl event_start
/* 00000294 38600009 */ li r3, 9
/* 00000298 4BFFFEC9 */ bl event_start
/* 0000029C 3860000F */ li r3, 0xf
/* 000002A0 4BFFFEC1 */ bl event_start
/* 000002A4 38600010 */ li r3, 0x10
/* 000002A8 4BFFFEB9 */ bl event_start
/* 000002AC 38600012 */ li r3, 0x12
/* 000002B0 4BFFFEB1 */ bl event_start
/* 000002B4 3860000D */ li r3, 0xd
/* 000002B8 4BFFFEA9 */ bl event_start
/* 000002BC 38600013 */ li r3, 0x13
/* 000002C0 4BFFFEA1 */ bl event_start
/* 000002C4 38600014 */ li r3, 0x14
/* 000002C8 4BFFFE99 */ bl event_start
/* 000002CC 3860000B */ li r3, 0xb
/* 000002D0 4BFFFE91 */ bl event_start
/* 000002D4 386000B3 */ li r3, 0xb3
/* 000002D8 4BFFFE89 */ bl func_80021DB4
/* 000002DC 4BFFFE85 */ bl func_800972CC
/* 000002E0 3C600000 */ lis r3, lbl_80206DEC@ha
/* 000002E4 38830000 */ addi r4, r3, lbl_80206DEC@l
/* 000002E8 8064001C */ lwz r3, 0x1c(r4)
/* 000002EC 38000000 */ li r0, 0
/* 000002F0 60630001 */ ori r3, r3, 1
/* 000002F4 9064001C */ stw r3, 0x1c(r4)
/* 000002F8 90040000 */ stw r0, 0(r4)
/* 000002FC 4BFFFE65 */ bl func_800171E0
/* 00000300 3C600000 */ lis r3, spritePoolInfo@ha
/* 00000304 38630000 */ addi r3, r3, spritePoolInfo@l
/* 00000308 3C800000 */ lis r4, currentBallStructPtr@ha
/* 0000030C 38A40000 */ addi r5, r4, currentBallStructPtr@l
/* 00000310 3B83000C */ addi r28, r3, 0xc
/* 00000314 80E50000 */ lwz r7, 0(r5)
/* 00000318 3C800000 */ lis r4, ballInfo@ha
/* 0000031C 8103000C */ lwz r8, 0xc(r3)
/* 00000320 38040000 */ addi r0, r4, ballInfo@l
/* 00000324 7C060378 */ mr r6, r0
/* 00000328 38830008 */ addi r4, r3, 8
/* 0000032C 39200000 */ li r9, 0
/* 00000330 38600001 */ li r3, 1
/* 00000334 48000024 */ b lbl_00000358
lbl_00000338:
/* 00000338 88080000 */ lbz r0, 0(r8)
/* 0000033C 2C000002 */ cmpwi r0, 2
/* 00000340 4082000C */ bne lbl_0000034C
/* 00000344 90C50000 */ stw r6, 0(r5)
/* 00000348 98660003 */ stb r3, 3(r6)
lbl_0000034C:
/* 0000034C 39290001 */ addi r9, r9, 1
/* 00000350 38C601A4 */ addi r6, r6, 0x1a4
/* 00000354 39080001 */ addi r8, r8, 1
lbl_00000358:
/* 00000358 80040000 */ lwz r0, 0(r4)
/* 0000035C 7C090000 */ cmpw r9, r0
/* 00000360 4180FFD8 */ blt lbl_00000338
/* 00000364 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00000368 90E30000 */ stw r7, currentBallStructPtr@l(r3)
/* 0000036C 3C600000 */ lis r3, worldInfo@ha
/* 00000370 38030000 */ addi r0, r3, worldInfo@l
/* 00000374 80DC0000 */ lwz r6, 0(r28)
/* 00000378 7C050378 */ mr r5, r0
/* 0000037C 38E00000 */ li r7, 0
/* 00000380 38600001 */ li r3, 1
/* 00000384 48000020 */ b lbl_000003A4
lbl_00000388:
/* 00000388 88060000 */ lbz r0, 0(r6)
/* 0000038C 2C000002 */ cmpwi r0, 2
/* 00000390 40820008 */ bne lbl_00000398
/* 00000394 98650008 */ stb r3, 8(r5)
lbl_00000398:
/* 00000398 38E70001 */ addi r7, r7, 1
/* 0000039C 38A50040 */ addi r5, r5, 0x40
/* 000003A0 38C60001 */ addi r6, r6, 1
lbl_000003A4:
/* 000003A4 80040000 */ lwz r0, 0(r4)
/* 000003A8 7C070000 */ cmpw r7, r0
/* 000003AC 4180FFDC */ blt lbl_00000388
/* 000003B0 3B000000 */ li r24, 0
/* 000003B4 3C600000 */ lis r3, ballInfo@ha
/* 000003B8 38030000 */ addi r0, r3, ballInfo@l
/* 000003BC 1C9801A4 */ mulli r4, r24, 0x1a4
/* 000003C0 3C600000 */ lis r3, lbl_80206B80@ha
/* 000003C4 3B230000 */ addi r25, r3, lbl_80206B80@l
/* 000003C8 3C600000 */ lis r3, lbl_000066C4@ha
/* 000003CC 7F402214 */ add r26, r0, r4
/* 000003D0 3B630000 */ addi r27, r3, lbl_000066C4@l
lbl_000003D4:
/* 000003D4 807C0000 */ lwz r3, 0(r28)
/* 000003D8 7C03C0AE */ lbzx r0, r3, r24
/* 000003DC 7C000775 */ extsb. r0, r0
/* 000003E0 41820018 */ beq lbl_000003F8
/* 000003E4 809A00FC */ lwz r4, 0xfc(r26)
/* 000003E8 387B0000 */ addi r3, r27, 0
/* 000003EC 38A00005 */ li r5, 5
/* 000003F0 4BFFFD71 */ bl func_8008D1DC
/* 000003F4 90790000 */ stw r3, 0(r25)
lbl_000003F8:
/* 000003F8 3B180001 */ addi r24, r24, 1
/* 000003FC 2C180004 */ cmpwi r24, 4
/* 00000400 3B5A01A4 */ addi r26, r26, 0x1a4
/* 00000404 3B390004 */ addi r25, r25, 4
/* 00000408 4180FFCC */ blt lbl_000003D4
/* 0000040C 3860003D */ li r3, 0x3d
/* 00000410 4BFFFD51 */ bl camera_set_state
/* 00000414 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00000418 38830000 */ addi r4, r3, currentCameraStructPtr@l
/* 0000041C 3C600000 */ lis r3, cameraInfo@ha
/* 00000420 80C40000 */ lwz r6, 0(r4)
/* 00000424 38630000 */ addi r3, r3, cameraInfo@l
/* 00000428 90640000 */ stw r3, 0(r4)
/* 0000042C 3B200000 */ li r25, 0
/* 00000430 38000009 */ li r0, 9
/* 00000434 9B23001F */ stb r25, 0x1f(r3)
/* 00000438 38A30284 */ addi r5, r3, 0x284
/* 0000043C 98030026 */ stb r0, 0x26(r3)
/* 00000440 90A40000 */ stw r5, 0(r4)
/* 00000444 38A50284 */ addi r5, r5, 0x284
/* 00000448 9B2302A3 */ stb r25, 0x2a3(r3)
/* 0000044C 980302AA */ stb r0, 0x2aa(r3)
/* 00000450 90A40000 */ stw r5, 0(r4)
/* 00000454 9B25001F */ stb r25, 0x1f(r5)
/* 00000458 98050026 */ stb r0, 0x26(r5)
/* 0000045C 38A50284 */ addi r5, r5, 0x284
/* 00000460 90A40000 */ stw r5, 0(r4)
/* 00000464 9B25001F */ stb r25, 0x1f(r5)
/* 00000468 98050026 */ stb r0, 0x26(r5)
/* 0000046C 90C40000 */ stw r6, 0(r4)
lbl_00000470:
/* 00000470 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000474 7F23CB78 */ mr r3, r25
/* 00000478 C07E1C9C */ lfs f3, 0x1c9c(r30)
/* 0000047C FC400890 */ fmr f2, f1
/* 00000480 FC801890 */ fmr f4, f3
/* 00000484 4BFFFCDD */ bl setup_camera_viewport
/* 00000488 3B390001 */ addi r25, r25, 1
/* 0000048C 2C190004 */ cmpwi r25, 4
/* 00000490 4180FFE0 */ blt lbl_00000470
/* 00000494 4BFFFCCD */ bl func_80022F14
/* 00000498 389D000C */ addi r4, r29, 0xc
/* 0000049C 38E00000 */ li r7, 0
/* 000004A0 38A0000A */ li r5, 0xa
/* 000004A4 38C00015 */ li r6, 0x15
lbl_000004A8:
/* 000004A8 38600000 */ li r3, 0
/* 000004AC 90640000 */ stw r3, 0(r4)
/* 000004B0 39000001 */ li r8, 1
/* 000004B4 38000001 */ li r0, 1
/* 000004B8 B0640004 */ sth r3, 4(r4)
/* 000004BC 2C08000B */ cmpwi r8, 0xb
/* 000004C0 98040006 */ stb r0, 6(r4)
/* 000004C4 98040007 */ stb r0, 7(r4)
/* 000004C8 98640008 */ stb r3, 8(r4)
/* 000004CC 98640009 */ stb r3, 9(r4)
/* 000004D0 B064000A */ sth r3, 0xa(r4)
/* 000004D4 40800058 */ bge lbl_0000052C
/* 000004D8 2C050008 */ cmpwi r5, 8
/* 000004DC 40810214 */ ble lbl_000006F0
/* 000004E0 3800FFFF */ li r0, -1
/* 000004E4 B004000C */ sth r0, 0xc(r4)
/* 000004E8 39000009 */ li r8, 9
/* 000004EC B004000E */ sth r0, 0xe(r4)
/* 000004F0 B0040010 */ sth r0, 0x10(r4)
/* 000004F4 B0040012 */ sth r0, 0x12(r4)
/* 000004F8 B0040014 */ sth r0, 0x14(r4)
/* 000004FC B0040016 */ sth r0, 0x16(r4)
/* 00000500 B0040018 */ sth r0, 0x18(r4)
/* 00000504 B004001A */ sth r0, 0x1a(r4)
/* 00000508 480001E8 */ b lbl_000006F0
lbl_0000050C:
/* 0000050C 2008000B */ subfic r0, r8, 0xb
/* 00000510 2C08000B */ cmpwi r8, 0xb
/* 00000514 7C0903A6 */ mtctr r0
/* 00000518 3800FFFF */ li r0, -1
/* 0000051C 40800010 */ bge lbl_0000052C
lbl_00000520:
/* 00000520 B003000A */ sth r0, 0xa(r3)
/* 00000524 38630002 */ addi r3, r3, 2
/* 00000528 4200FFF8 */ bdnz lbl_00000520
lbl_0000052C:
/* 0000052C 39000000 */ li r8, 0
/* 00000530 2C080015 */ cmpwi r8, 0x15
/* 00000534 408000B8 */ bge lbl_000005EC
/* 00000538 2C060008 */ cmpwi r6, 8
/* 0000053C 408101C0 */ ble lbl_000006FC
/* 00000540 99040020 */ stb r8, 0x20(r4)
/* 00000544 99040035 */ stb r8, 0x35(r4)
/* 00000548 99040021 */ stb r8, 0x21(r4)
/* 0000054C 99040036 */ stb r8, 0x36(r4)
/* 00000550 99040022 */ stb r8, 0x22(r4)
/* 00000554 99040037 */ stb r8, 0x37(r4)
/* 00000558 99040023 */ stb r8, 0x23(r4)
/* 0000055C 99040038 */ stb r8, 0x38(r4)
/* 00000560 99040024 */ stb r8, 0x24(r4)
/* 00000564 99040039 */ stb r8, 0x39(r4)
/* 00000568 99040025 */ stb r8, 0x25(r4)
/* 0000056C 9904003A */ stb r8, 0x3a(r4)
/* 00000570 99040026 */ stb r8, 0x26(r4)
/* 00000574 9904003B */ stb r8, 0x3b(r4)
/* 00000578 99040027 */ stb r8, 0x27(r4)
/* 0000057C 9904003C */ stb r8, 0x3c(r4)
/* 00000580 99040028 */ stb r8, 0x28(r4)
/* 00000584 9904003D */ stb r8, 0x3d(r4)
/* 00000588 99040029 */ stb r8, 0x29(r4)
/* 0000058C 9904003E */ stb r8, 0x3e(r4)
/* 00000590 9904002A */ stb r8, 0x2a(r4)
/* 00000594 9904003F */ stb r8, 0x3f(r4)
/* 00000598 9904002B */ stb r8, 0x2b(r4)
/* 0000059C 99040040 */ stb r8, 0x40(r4)
/* 000005A0 9904002C */ stb r8, 0x2c(r4)
/* 000005A4 99040041 */ stb r8, 0x41(r4)
/* 000005A8 9904002D */ stb r8, 0x2d(r4)
/* 000005AC 99040042 */ stb r8, 0x42(r4)
/* 000005B0 9904002E */ stb r8, 0x2e(r4)
/* 000005B4 99040043 */ stb r8, 0x43(r4)
/* 000005B8 9904002F */ stb r8, 0x2f(r4)
/* 000005BC 99040044 */ stb r8, 0x44(r4)
/* 000005C0 39000010 */ li r8, 0x10
/* 000005C4 48000138 */ b lbl_000006FC
lbl_000005C8:
/* 000005C8 20080015 */ subfic r0, r8, 0x15
/* 000005CC 2C080015 */ cmpwi r8, 0x15
/* 000005D0 7C0903A6 */ mtctr r0
/* 000005D4 38000000 */ li r0, 0
/* 000005D8 40800014 */ bge lbl_000005EC
lbl_000005DC:
/* 000005DC 98030020 */ stb r0, 0x20(r3)
/* 000005E0 98030035 */ stb r0, 0x35(r3)
/* 000005E4 38630001 */ addi r3, r3, 1
/* 000005E8 4200FFF4 */ bdnz lbl_000005DC
lbl_000005EC:
/* 000005EC 38E70001 */ addi r7, r7, 1
/* 000005F0 2C070004 */ cmpwi r7, 4
/* 000005F4 3884004C */ addi r4, r4, 0x4c
/* 000005F8 4180FEB0 */ blt lbl_000004A8
/* 000005FC 38C00000 */ li r6, 0
/* 00000600 B0DD013C */ sth r6, 0x13c(r29)
/* 00000604 3B800001 */ li r28, 1
/* 00000608 3800000B */ li r0, 0xb
/* 0000060C 98DD013E */ stb r6, 0x13e(r29)
/* 00000610 38600100 */ li r3, 0x100
/* 00000614 38800000 */ li r4, 0
/* 00000618 9B9F0008 */ stb r28, 8(r31)
/* 0000061C 38A0001E */ li r5, 0x1e
/* 00000620 B0DD0004 */ sth r6, 4(r29)
/* 00000624 98DD0006 */ stb r6, 6(r29)
/* 00000628 98DD0007 */ stb r6, 7(r29)
/* 0000062C 981D0008 */ stb r0, 8(r29)
/* 00000630 90DD0144 */ stw r6, 0x144(r29)
/* 00000634 4BFFFB2D */ bl g_start_screen_fade
/* 00000638 3800FFFF */ li r0, -1
/* 0000063C 901F000C */ stw r0, 0xc(r31)
/* 00000640 38600036 */ li r3, 0x36
/* 00000644 38800000 */ li r4, 0
/* 00000648 4BFFFB19 */ bl g_play_music
/* 0000064C 4800A1BD */ bl lbl_0000A808
/* 00000650 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00000654 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 00000658 2C000000 */ cmpwi r0, 0
/* 0000065C 4082001C */ bne lbl_00000678
/* 00000660 939F0000 */ stw r28, 0(r31)
/* 00000664 38600021 */ li r3, 0x21
/* 00000668 38002710 */ li r0, 0x2710
/* 0000066C 907F0004 */ stw r3, 4(r31)
/* 00000670 901D0000 */ stw r0, 0(r29)
/* 00000674 48000020 */ b lbl_00000694
lbl_00000678:
/* 00000678 38000800 */ li r0, 0x800
/* 0000067C 3C600001 */ lis r3, 1
/* 00000680 901F0000 */ stw r0, 0(r31)
/* 00000684 38038001 */ addi r0, r3, -32767  ;# fixed addi
/* 00000688 901F0004 */ stw r0, 4(r31)
/* 0000068C 38002710 */ li r0, 0x2710
/* 00000690 901D0000 */ stw r0, 0(r29)
lbl_00000694:
/* 00000694 3C600000 */ lis r3, ballInfo@ha
/* 00000698 3B830000 */ addi r28, r3, ballInfo@l
/* 0000069C 389C0000 */ addi r4, r28, 0
/* 000006A0 38600000 */ li r3, 0
/* 000006A4 480072C1 */ bl lbl_00007964
/* 000006A8 38600000 */ li r3, 0
/* 000006AC 4800ADB5 */ bl lbl_0000B460
/* 000006B0 389C0000 */ addi r4, r28, 0
/* 000006B4 38600001 */ li r3, 1
/* 000006B8 480072AD */ bl lbl_00007964
/* 000006BC 38600001 */ li r3, 1
/* 000006C0 4800ADA1 */ bl lbl_0000B460
/* 000006C4 3B800000 */ li r28, 0
/* 000006C8 9B9D013F */ stb r28, 0x13f(r29)
/* 000006CC 9B9D0140 */ stb r28, 0x140(r29)
/* 000006D0 480090E5 */ bl lbl_000097B4
/* 000006D4 3800FFFF */ li r0, -1
/* 000006D8 981D0148 */ stb r0, 0x148(r29)
/* 000006DC 981D0149 */ stb r0, 0x149(r29)
/* 000006E0 981D014A */ stb r0, 0x14a(r29)
/* 000006E4 981D014B */ stb r0, 0x14b(r29)
/* 000006E8 9B9D014C */ stb r28, 0x14c(r29)
/* 000006EC 48000018 */ b lbl_00000704
lbl_000006F0:
/* 000006F0 5500083C */ slwi r0, r8, 1
/* 000006F4 7C640214 */ add r3, r4, r0
/* 000006F8 4BFFFE14 */ b lbl_0000050C
lbl_000006FC:
/* 000006FC 7C644214 */ add r3, r4, r8
/* 00000700 4BFFFEC8 */ b lbl_000005C8
lbl_00000704:
/* 00000704 BB010018 */ lmw r24, 0x18(r1)
/* 00000708 8001003C */ lwz r0, 0x3c(r1)
/* 0000070C 38210038 */ addi r1, r1, 0x38
/* 00000710 7C0803A6 */ mtlr r0
/* 00000714 4E800020 */ blr 
lbl_00000718:
/* 00000718 7C0802A6 */ mflr r0
/* 0000071C 3C800000 */ lis r4, lbl_10000000@ha
/* 00000720 90010004 */ stw r0, 4(r1)
/* 00000724 3C600000 */ lis r3, lbl_00014F20@ha
/* 00000728 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000072C 93E1001C */ stw r31, 0x1c(r1)
/* 00000730 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00000734 93C10018 */ stw r30, 0x18(r1)
/* 00000738 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 0000073C 48006F95 */ bl lbl_000076D0
/* 00000740 3C600000 */ lis r3, gamePauseStatus@ha
/* 00000744 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00000748 7000000A */ andi. r0, r0, 0xa
/* 0000074C 40820288 */ bne lbl_000009D4
/* 00000750 807E0000 */ lwz r3, 0(r30)
/* 00000754 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00000758 901E0000 */ stw r0, 0(r30)
/* 0000075C 801F0000 */ lwz r0, 0(r31)
/* 00000760 2C000080 */ cmpwi r0, 0x80
/* 00000764 418200EC */ beq lbl_00000850
/* 00000768 4080005C */ bge lbl_000007C4
/* 0000076C 2C000008 */ cmpwi r0, 8
/* 00000770 418200C0 */ beq lbl_00000830
/* 00000774 4080002C */ bge lbl_000007A0
/* 00000778 2C000003 */ cmpwi r0, 3
/* 0000077C 41820114 */ beq lbl_00000890
/* 00000780 40800014 */ bge lbl_00000794
/* 00000784 2C000001 */ cmpwi r0, 1
/* 00000788 41820090 */ beq lbl_00000818
/* 0000078C 40800094 */ bge lbl_00000820
/* 00000790 48000100 */ b lbl_00000890
lbl_00000794:
/* 00000794 2C000005 */ cmpwi r0, 5
/* 00000798 408000F8 */ bge lbl_00000890
/* 0000079C 4800008C */ b lbl_00000828
lbl_000007A0:
/* 000007A0 2C000020 */ cmpwi r0, 0x20
/* 000007A4 4182009C */ beq lbl_00000840
/* 000007A8 40800010 */ bge lbl_000007B8
/* 000007AC 2C000010 */ cmpwi r0, 0x10
/* 000007B0 41820088 */ beq lbl_00000838
/* 000007B4 480000DC */ b lbl_00000890
lbl_000007B8:
/* 000007B8 2C000040 */ cmpwi r0, 0x40
/* 000007BC 4182008C */ beq lbl_00000848
/* 000007C0 480000D0 */ b lbl_00000890
lbl_000007C4:
/* 000007C4 2C000800 */ cmpwi r0, 0x800
/* 000007C8 418200A8 */ beq lbl_00000870
/* 000007CC 40800028 */ bge lbl_000007F4
/* 000007D0 2C000200 */ cmpwi r0, 0x200
/* 000007D4 4182008C */ beq lbl_00000860
/* 000007D8 40800010 */ bge lbl_000007E8
/* 000007DC 2C000100 */ cmpwi r0, 0x100
/* 000007E0 41820078 */ beq lbl_00000858
/* 000007E4 480000AC */ b lbl_00000890
lbl_000007E8:
/* 000007E8 2C000400 */ cmpwi r0, 0x400
/* 000007EC 4182007C */ beq lbl_00000868
/* 000007F0 480000A0 */ b lbl_00000890
lbl_000007F4:
/* 000007F4 2C002000 */ cmpwi r0, 0x2000
/* 000007F8 41820088 */ beq lbl_00000880
/* 000007FC 40800010 */ bge lbl_0000080C
/* 00000800 2C001000 */ cmpwi r0, 0x1000
/* 00000804 41820074 */ beq lbl_00000878
/* 00000808 48000088 */ b lbl_00000890
lbl_0000080C:
/* 0000080C 2C004000 */ cmpwi r0, 0x4000
/* 00000810 41820078 */ beq lbl_00000888
/* 00000814 4800007C */ b lbl_00000890
lbl_00000818:
/* 00000818 480010F1 */ bl lbl_00001908
/* 0000081C 4800007C */ b lbl_00000898
lbl_00000820:
/* 00000820 480012F5 */ bl lbl_00001B14
/* 00000824 48000074 */ b lbl_00000898
lbl_00000828:
/* 00000828 4800145D */ bl lbl_00001C84
/* 0000082C 4800006C */ b lbl_00000898
lbl_00000830:
/* 00000830 480016ED */ bl lbl_00001F1C
/* 00000834 48000064 */ b lbl_00000898
lbl_00000838:
/* 00000838 4800197D */ bl lbl_000021B4
/* 0000083C 4800005C */ b lbl_00000898
lbl_00000840:
/* 00000840 48001C15 */ bl lbl_00002454
/* 00000844 48000054 */ b lbl_00000898
lbl_00000848:
/* 00000848 48001F69 */ bl lbl_000027B0
/* 0000084C 4800004C */ b lbl_00000898
lbl_00000850:
/* 00000850 48002591 */ bl lbl_00002DE0
/* 00000854 48000044 */ b lbl_00000898
lbl_00000858:
/* 00000858 48002D1D */ bl lbl_00003574
/* 0000085C 4800003C */ b lbl_00000898
lbl_00000860:
/* 00000860 480031B1 */ bl lbl_00003A10
/* 00000864 48000034 */ b lbl_00000898
lbl_00000868:
/* 00000868 480034BD */ bl lbl_00003D24
/* 0000086C 4800002C */ b lbl_00000898
lbl_00000870:
/* 00000870 48003551 */ bl lbl_00003DC0
/* 00000874 48000024 */ b lbl_00000898
lbl_00000878:
/* 00000878 48003A2D */ bl lbl_000042A4
/* 0000087C 4800001C */ b lbl_00000898
lbl_00000880:
/* 00000880 48003D69 */ bl lbl_000045E8
/* 00000884 48000014 */ b lbl_00000898
lbl_00000888:
/* 00000888 48004351 */ bl lbl_00004BD8
/* 0000088C 4800000C */ b lbl_00000898
lbl_00000890:
/* 00000890 38000001 */ li r0, 1
/* 00000894 901F0000 */ stw r0, 0(r31)
lbl_00000898:
/* 00000898 3C600000 */ lis r3, currentBallStructPtr@ha
/* 0000089C 80A30000 */ lwz r5, currentBallStructPtr@l(r3)
/* 000008A0 3C800000 */ lis r4, lbl_00010CC0@ha
/* 000008A4 3C600000 */ lis r3, lbl_00010CC8@ha
/* 000008A8 C8240000 */ lfd f1, lbl_00010CC0@l(r4)
/* 000008AC C045000C */ lfs f2, 0xc(r5)
/* 000008B0 C8030000 */ lfd f0, lbl_00010CC8@l(r3)
/* 000008B4 FC2100B2 */ fmul f1, f1, f2
/* 000008B8 FC0000B2 */ fmul f0, f0, f2
/* 000008BC FC20081E */ fctiwz f1, f1
/* 000008C0 FC00001E */ fctiwz f0, f0
/* 000008C4 D8210010 */ stfd f1, 0x10(r1)
/* 000008C8 D8010008 */ stfd f0, 8(r1)
/* 000008CC 80610014 */ lwz r3, 0x14(r1)
/* 000008D0 8081000C */ lwz r4, 0xc(r1)
/* 000008D4 4BFFF88D */ bl func_8002CA38
/* 000008D8 807E0144 */ lwz r3, 0x144(r30)
/* 000008DC 2C030000 */ cmpwi r3, 0
/* 000008E0 4081000C */ ble lbl_000008EC
/* 000008E4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000008E8 901E0144 */ stw r0, 0x144(r30)
lbl_000008EC:
/* 000008EC 80DF0000 */ lwz r6, 0(r31)
/* 000008F0 28060200 */ cmplwi r6, 0x200
/* 000008F4 418200E0 */ beq lbl_000009D4
/* 000008F8 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 000008FC 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 00000900 2C000001 */ cmpwi r0, 1
/* 00000904 418200C0 */ beq lbl_000009C4
/* 00000908 3C600000 */ lis r3, currentBallStructPtr@ha
/* 0000090C 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 00000910 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00000914 3CA00000 */ lis r5, controllerInfo@ha
/* 00000918 8884002E */ lbz r4, 0x2e(r4)
/* 0000091C 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00000920 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000924 7C830774 */ extsb r3, r4
/* 00000928 5463103A */ slwi r3, r3, 2
/* 0000092C 7C601A14 */ add r3, r0, r3
/* 00000930 80030000 */ lwz r0, 0(r3)
/* 00000934 1C00003C */ mulli r0, r0, 0x3c
/* 00000938 7C650214 */ add r3, r5, r0
/* 0000093C A0030018 */ lhz r0, 0x18(r3)
/* 00000940 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 00000944 41820038 */ beq lbl_0000097C
/* 00000948 801F0004 */ lwz r0, 4(r31)
/* 0000094C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00000950 4182002C */ beq lbl_0000097C
/* 00000954 54C005EF */ rlwinm. r0, r6, 0, 0x17, 0x17
/* 00000958 40820024 */ bne lbl_0000097C
/* 0000095C 881F0008 */ lbz r0, 8(r31)
/* 00000960 38600098 */ li r3, 0x98
/* 00000964 7C000774 */ extsb r0, r0
/* 00000968 7C000034 */ cntlzw r0, r0
/* 0000096C 5400D97E */ srwi r0, r0, 5
/* 00000970 7C000774 */ extsb r0, r0
/* 00000974 981F0008 */ stb r0, 8(r31)
/* 00000978 4BFFF7E9 */ bl g_play_sound
lbl_0000097C:
/* 0000097C 889F0008 */ lbz r4, 8(r31)
/* 00000980 7C800775 */ extsb. r0, r4
/* 00000984 41820020 */ beq lbl_000009A4
/* 00000988 887F0009 */ lbz r3, 9(r31)
/* 0000098C 7C600774 */ extsb r0, r3
/* 00000990 2C000003 */ cmpwi r0, 3
/* 00000994 40810010 */ ble lbl_000009A4
/* 00000998 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000099C 981F0009 */ stb r0, 9(r31)
/* 000009A0 48000024 */ b lbl_000009C4
lbl_000009A4:
/* 000009A4 7C800775 */ extsb. r0, r4
/* 000009A8 4082001C */ bne lbl_000009C4
/* 000009AC 887F0009 */ lbz r3, 9(r31)
/* 000009B0 7C600774 */ extsb r0, r3
/* 000009B4 2C00000A */ cmpwi r0, 0xa
/* 000009B8 4080000C */ bge lbl_000009C4
/* 000009BC 38030001 */ addi r0, r3, 1
/* 000009C0 981F0009 */ stb r0, 9(r31)
lbl_000009C4:
/* 000009C4 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000009C8 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 000009CC 80630000 */ lwz r3, 0(r3)
/* 000009D0 48009EA9 */ bl lbl_0000A878
lbl_000009D4:
/* 000009D4 80010024 */ lwz r0, 0x24(r1)
/* 000009D8 83E1001C */ lwz r31, 0x1c(r1)
/* 000009DC 83C10018 */ lwz r30, 0x18(r1)
/* 000009E0 7C0803A6 */ mtlr r0
/* 000009E4 38210020 */ addi r1, r1, 0x20
/* 000009E8 4E800020 */ blr 
lbl_000009EC:
/* 000009EC 7C0802A6 */ mflr r0
/* 000009F0 3C600000 */ lis r3, lbl_10000000@ha
/* 000009F4 90010004 */ stw r0, 4(r1)
/* 000009F8 3C800000 */ lis r4, lbl_0000F020@ha
/* 000009FC 9421FFA0 */ stwu r1, -0x60(r1)
/* 00000A00 BF410048 */ stmw r26, 0x48(r1)
/* 00000A04 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 00000A08 3C600000 */ lis r3, lbl_00014F20@ha
/* 00000A0C 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 00000A10 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00000A14 801D0144 */ lwz r0, 0x144(r29)
/* 00000A18 2C000000 */ cmpwi r0, 0
/* 00000A1C 4082000C */ bne lbl_00000A28
/* 00000A20 3B400000 */ li r26, 0
/* 00000A24 480000AC */ b lbl_00000AD0
lbl_00000A28:
/* 00000A28 2C00003C */ cmpwi r0, 0x3c
/* 00000A2C 4080003C */ bge lbl_00000A68
/* 00000A30 6C008000 */ xoris r0, r0, 0x8000
/* 00000A34 C05E1CB0 */ lfs f2, 0x1cb0(r30)
/* 00000A38 90010044 */ stw r0, 0x44(r1)
/* 00000A3C 3C004330 */ lis r0, 0x4330
/* 00000A40 3C600000 */ lis r3, lbl_00010D58@ha
/* 00000A44 90010040 */ stw r0, 0x40(r1)
/* 00000A48 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00000A4C C8010040 */ lfd f0, 0x40(r1)
/* 00000A50 EC000828 */ fsubs f0, f0, f1
/* 00000A54 EC020032 */ fmuls f0, f2, f0
/* 00000A58 FC00001E */ fctiwz f0, f0
/* 00000A5C D8010038 */ stfd f0, 0x38(r1)
/* 00000A60 8341003C */ lwz r26, 0x3c(r1)
/* 00000A64 4800006C */ b lbl_00000AD0
lbl_00000A68:
/* 00000A68 6C038000 */ xoris r3, r0, 0x8000
/* 00000A6C C81E1CB8 */ lfd f0, 0x1cb8(r30)
/* 00000A70 9061003C */ stw r3, 0x3c(r1)
/* 00000A74 3C004330 */ lis r0, 0x4330
/* 00000A78 3C800000 */ lis r4, lbl_00010D58@ha
/* 00000A7C 90010038 */ stw r0, 0x38(r1)
/* 00000A80 C8440000 */ lfd f2, lbl_00010D58@l(r4)
/* 00000A84 C8210038 */ lfd f1, 0x38(r1)
/* 00000A88 FC211028 */ fsub f1, f1, f2
/* 00000A8C FC010040 */ fcmpo cr0, f1, f0
/* 00000A90 4081003C */ ble lbl_00000ACC
/* 00000A94 9061003C */ stw r3, 0x3c(r1)
/* 00000A98 3C600000 */ lis r3, lbl_00010D58@ha
/* 00000A9C C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00000AA0 90010038 */ stw r0, 0x38(r1)
/* 00000AA4 C85E1CC8 */ lfd f2, 0x1cc8(r30)
/* 00000AA8 C8010038 */ lfd f0, 0x38(r1)
/* 00000AAC C87E1CC0 */ lfd f3, 0x1cc0(r30)
/* 00000AB0 FC000828 */ fsub f0, f0, f1
/* 00000AB4 FC020028 */ fsub f0, f2, f0
/* 00000AB8 FC030032 */ fmul f0, f3, f0
/* 00000ABC FC00001E */ fctiwz f0, f0
/* 00000AC0 D8010040 */ stfd f0, 0x40(r1)
/* 00000AC4 83410044 */ lwz r26, 0x44(r1)
/* 00000AC8 48000008 */ b lbl_00000AD0
lbl_00000ACC:
/* 00000ACC 3B406000 */ li r26, 0x6000
lbl_00000AD0:
/* 00000AD0 4BFFF691 */ bl mathutil_mtxA_from_mtxB
/* 00000AD4 C03E1CD0 */ lfs f1, 0x1cd0(r30)
/* 00000AD8 C05E1CD4 */ lfs f2, 0x1cd4(r30)
/* 00000ADC C07E1CD8 */ lfs f3, 0x1cd8(r30)
/* 00000AE0 4BFFF681 */ bl mathutil_mtxA_translate_xyz
/* 00000AE4 7F5A0734 */ extsh r26, r26
/* 00000AE8 7C7A00D0 */ neg r3, r26
/* 00000AEC 4BFFF675 */ bl mathutil_mtxA_rotate_y
/* 00000AF0 3C600000 */ lis r3, mathutilData@ha
/* 00000AF4 3B630000 */ addi r27, r3, mathutilData@l
/* 00000AF8 807B0000 */ lwz r3, 0(r27)
/* 00000AFC 38800000 */ li r4, 0
/* 00000B00 4BFFF661 */ bl GXLoadPosMtxImm
/* 00000B04 807B0000 */ lwz r3, 0(r27)
/* 00000B08 38800000 */ li r4, 0
/* 00000B0C 4BFFF655 */ bl GXLoadNrmMtxImm
/* 00000B10 3C600000 */ lis r3, minigameGma@ha
/* 00000B14 3B830000 */ addi r28, r3, minigameGma@l
/* 00000B18 807C0000 */ lwz r3, 0(r28)
/* 00000B1C 80630008 */ lwz r3, 8(r3)
/* 00000B20 80630018 */ lwz r3, 0x18(r3)
/* 00000B24 4BFFF63D */ bl g_avdisp_maybe_draw_model_1
/* 00000B28 4BFFF639 */ bl mathutil_mtxA_from_mtxB
/* 00000B2C C03E1CDC */ lfs f1, 0x1cdc(r30)
/* 00000B30 C05E1CD4 */ lfs f2, 0x1cd4(r30)
/* 00000B34 C07E1CD8 */ lfs f3, 0x1cd8(r30)
/* 00000B38 4BFFF629 */ bl mathutil_mtxA_translate_xyz
/* 00000B3C 7F43D378 */ mr r3, r26
/* 00000B40 4BFFF621 */ bl mathutil_mtxA_rotate_y
/* 00000B44 807B0000 */ lwz r3, 0(r27)
/* 00000B48 38800000 */ li r4, 0
/* 00000B4C 4BFFF615 */ bl GXLoadPosMtxImm
/* 00000B50 807B0000 */ lwz r3, 0(r27)
/* 00000B54 38800000 */ li r4, 0
/* 00000B58 4BFFF609 */ bl GXLoadNrmMtxImm
/* 00000B5C 807C0000 */ lwz r3, 0(r28)
/* 00000B60 80630008 */ lwz r3, 8(r3)
/* 00000B64 80630020 */ lwz r3, 0x20(r3)
/* 00000B68 4BFFF5F9 */ bl g_avdisp_maybe_draw_model_1
/* 00000B6C 801F0004 */ lwz r0, 4(r31)
/* 00000B70 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00000B74 41820108 */ beq lbl_00000C7C
/* 00000B78 3C600000 */ lis r3, lbl_801EEC90@ha
/* 00000B7C 80030000 */ lwz r0, lbl_801EEC90@l(r3)
/* 00000B80 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000B84 40820400 */ bne lbl_00000F84
/* 00000B88 3C600000 */ lis r3, cameraInfo@ha
/* 00000B8C C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000B90 38630000 */ addi r3, r3, cameraInfo@l
/* 00000B94 C0030048 */ lfs f0, 0x48(r3)
/* 00000B98 3C800000 */ lis r4, spritePoolInfo@ha
/* 00000B9C 38840000 */ addi r4, r4, spritePoolInfo@l
/* 00000BA0 FC000840 */ fcmpo cr0, f0, f1
/* 00000BA4 8084000C */ lwz r4, 0xc(r4)
/* 00000BA8 88840000 */ lbz r4, 0(r4)
/* 00000BAC 408100C8 */ ble lbl_00000C74
/* 00000BB0 C003004C */ lfs f0, 0x4c(r3)
/* 00000BB4 FC000840 */ fcmpo cr0, f0, f1
/* 00000BB8 408100BC */ ble lbl_00000C74
/* 00000BBC 7C800775 */ extsb. r0, r4
/* 00000BC0 418200B4 */ beq lbl_00000C74
/* 00000BC4 7C800774 */ extsb r0, r4
/* 00000BC8 2C000004 */ cmpwi r0, 4
/* 00000BCC 418200A8 */ beq lbl_00000C74
/* 00000BD0 38600000 */ li r3, 0
/* 00000BD4 4BFFF58D */ bl func_80018648
/* 00000BD8 4BFFF589 */ bl g_draw_ball_shadow
/* 00000BDC 4BFFF585 */ bl func_80054FF0
/* 00000BE0 38600000 */ li r3, 0
/* 00000BE4 4BFFF57D */ bl func_800225C0
/* 00000BE8 4BFFF579 */ bl func_8009CD5C
/* 00000BEC 3C600000 */ lis r3, eventInfo@ha
/* 00000BF0 38630000 */ addi r3, r3, eventInfo@l
/* 00000BF4 88030018 */ lbz r0, 0x18(r3)
/* 00000BF8 7C000774 */ extsb r0, r0
/* 00000BFC 2C000002 */ cmpwi r0, 2
/* 00000C00 4182000C */ beq lbl_00000C0C
/* 00000C04 2C000004 */ cmpwi r0, 4
/* 00000C08 40820008 */ bne lbl_00000C10
lbl_00000C0C:
/* 00000C0C 4BFFF555 */ bl stage_draw
lbl_00000C10:
/* 00000C10 3C600000 */ lis r3, eventInfo@ha
/* 00000C14 38630000 */ addi r3, r3, eventInfo@l
/* 00000C18 880301C8 */ lbz r0, 0x1c8(r3)
/* 00000C1C 2C000002 */ cmpwi r0, 2
/* 00000C20 40820018 */ bne lbl_00000C38
/* 00000C24 C03E1CE0 */ lfs f1, 0x1ce0(r30)
/* 00000C28 4BFFF539 */ bl ord_tbl_set_depth_offset
/* 00000C2C 4BFFF535 */ bl background_draw
/* 00000C30 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000C34 4BFFF52D */ bl ord_tbl_set_depth_offset
lbl_00000C38:
/* 00000C38 3C600000 */ lis r3, eventInfo@ha
/* 00000C3C 38630000 */ addi r3, r3, eventInfo@l
/* 00000C40 880301E0 */ lbz r0, 0x1e0(r3)
/* 00000C44 3B4301E0 */ addi r26, r3, 0x1e0
/* 00000C48 2C000002 */ cmpwi r0, 2
/* 00000C4C 4082000C */ bne lbl_00000C58
/* 00000C50 38600010 */ li r3, 0x10
/* 00000C54 4BFFF50D */ bl func_80095398
lbl_00000C58:
/* 00000C58 4BFFF509 */ bl draw_test_camera_target
/* 00000C5C 881A0000 */ lbz r0, 0(r26)
/* 00000C60 2C000002 */ cmpwi r0, 2
/* 00000C64 4082000C */ bne lbl_00000C70
/* 00000C68 38600008 */ li r3, 8
/* 00000C6C 4BFFF4F5 */ bl func_80095398
lbl_00000C70:
/* 00000C70 480090A9 */ bl lbl_00009D18
lbl_00000C74:
/* 00000C74 4BFFF4ED */ bl func_80017FCC
/* 00000C78 4800030C */ b lbl_00000F84
lbl_00000C7C:
/* 00000C7C 3C600000 */ lis r3, modeCtrl@ha
/* 00000C80 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000C84 38630000 */ addi r3, r3, modeCtrl@l
/* 00000C88 8063002C */ lwz r3, 0x2c(r3)
/* 00000C8C 3C800000 */ lis r4, cameraInfo@ha
/* 00000C90 38040000 */ addi r0, r4, cameraInfo@l
/* 00000C94 1C830284 */ mulli r4, r3, 0x284
/* 00000C98 7C802214 */ add r4, r0, r4
/* 00000C9C C0040048 */ lfs f0, 0x48(r4)
/* 00000CA0 FC000840 */ fcmpo cr0, f0, f1
/* 00000CA4 408102E0 */ ble lbl_00000F84
/* 00000CA8 C004004C */ lfs f0, 0x4c(r4)
/* 00000CAC FC000840 */ fcmpo cr0, f0, f1
/* 00000CB0 41810008 */ bgt lbl_00000CB8
/* 00000CB4 480002D0 */ b lbl_00000F84
lbl_00000CB8:
/* 00000CB8 3C800000 */ lis r4, spritePoolInfo@ha
/* 00000CBC 38840000 */ addi r4, r4, spritePoolInfo@l
/* 00000CC0 8084000C */ lwz r4, 0xc(r4)
/* 00000CC4 7C8418AE */ lbzx r4, r4, r3
/* 00000CC8 7C800775 */ extsb. r0, r4
/* 00000CCC 418202B8 */ beq lbl_00000F84
/* 00000CD0 7C800774 */ extsb r0, r4
/* 00000CD4 2C000004 */ cmpwi r0, 4
/* 00000CD8 418202AC */ beq lbl_00000F84
/* 00000CDC 4BFFF485 */ bl func_80018648
/* 00000CE0 801F0004 */ lwz r0, 4(r31)
/* 00000CE4 54000463 */ rlwinm. r0, r0, 0, 0x11, 0x11
/* 00000CE8 41820108 */ beq lbl_00000DF0
/* 00000CEC 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00000CF0 3B830000 */ addi r28, r3, currentBallStructPtr@l
/* 00000CF4 807C0000 */ lwz r3, 0(r28)
/* 00000CF8 806300FC */ lwz r3, 0xfc(r3)
/* 00000CFC 38630060 */ addi r3, r3, 0x60
/* 00000D00 4BFFF461 */ bl mathutil_mtxA_from_quat
/* 00000D04 38610008 */ addi r3, r1, 8
/* 00000D08 4BFFF459 */ bl mathutil_mtxA_to_mtx
/* 00000D0C 4BFFF455 */ bl mathutil_mtxA_from_mtxB
/* 00000D10 807C0000 */ lwz r3, 0(r28)
/* 00000D14 806300FC */ lwz r3, 0xfc(r3)
/* 00000D18 38630030 */ addi r3, r3, 0x30
/* 00000D1C 4BFFF445 */ bl mathutil_mtxA_translate
/* 00000D20 38610008 */ addi r3, r1, 8
/* 00000D24 4BFFF43D */ bl mathutil_mtxA_mult_right
/* 00000D28 807C0000 */ lwz r3, 0(r28)
/* 00000D2C 806300FC */ lwz r3, 0xfc(r3)
/* 00000D30 80030010 */ lwz r0, 0x10(r3)
/* 00000D34 2C000003 */ cmpwi r0, 3
/* 00000D38 40820040 */ bne lbl_00000D78
/* 00000D3C C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000D40 C05E1CE4 */ lfs f2, 0x1ce4(r30)
/* 00000D44 FC600890 */ fmr f3, f1
/* 00000D48 4BFFF419 */ bl mathutil_mtxA_translate_xyz
/* 00000D4C 807C0000 */ lwz r3, 0(r28)
/* 00000D50 806300FC */ lwz r3, 0xfc(r3)
/* 00000D54 80630000 */ lwz r3, 0(r3)
/* 00000D58 3C630001 */ addis r3, r3, 1
/* 00000D5C 3863A4F8 */ addi r3, r3, -23304  ;# fixed addi
/* 00000D60 4BFFF401 */ bl mathutil_mtxA_mult_right
/* 00000D64 C03E1CE8 */ lfs f1, 0x1ce8(r30)
/* 00000D68 C05E1CEC */ lfs f2, 0x1cec(r30)
/* 00000D6C C07E1CF0 */ lfs f3, 0x1cf0(r30)
/* 00000D70 4BFFF3F1 */ bl mathutil_mtxA_translate_xyz
/* 00000D74 4800003C */ b lbl_00000DB0
lbl_00000D78:
/* 00000D78 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000D7C C05E1CF4 */ lfs f2, 0x1cf4(r30)
/* 00000D80 FC600890 */ fmr f3, f1
/* 00000D84 4BFFF3DD */ bl mathutil_mtxA_translate_xyz
/* 00000D88 807C0000 */ lwz r3, 0(r28)
/* 00000D8C 806300FC */ lwz r3, 0xfc(r3)
/* 00000D90 80630000 */ lwz r3, 0(r3)
/* 00000D94 3C630001 */ addis r3, r3, 1
/* 00000D98 3863A4F8 */ addi r3, r3, -23304  ;# fixed addi
/* 00000D9C 4BFFF3C5 */ bl mathutil_mtxA_mult_right
/* 00000DA0 C03E1CF8 */ lfs f1, 0x1cf8(r30)
/* 00000DA4 C05E1CEC */ lfs f2, 0x1cec(r30)
/* 00000DA8 C07E1CF0 */ lfs f3, 0x1cf0(r30)
/* 00000DAC 4BFFF3B5 */ bl mathutil_mtxA_translate_xyz
lbl_00000DB0:
/* 00000DB0 C03E1CFC */ lfs f1, 0x1cfc(r30)
/* 00000DB4 4BFFF3AD */ bl mathutil_mtxA_scale_s
/* 00000DB8 3C600000 */ lis r3, mathutilData@ha
/* 00000DBC 3B830000 */ addi r28, r3, mathutilData@l
/* 00000DC0 807C0000 */ lwz r3, 0(r28)
/* 00000DC4 38800000 */ li r4, 0
/* 00000DC8 4BFFF399 */ bl GXLoadPosMtxImm
/* 00000DCC 807C0000 */ lwz r3, 0(r28)
/* 00000DD0 38800000 */ li r4, 0
/* 00000DD4 4BFFF38D */ bl GXLoadNrmMtxImm
/* 00000DD8 3C600000 */ lis r3, minigameGma@ha
/* 00000DDC 38630000 */ addi r3, r3, minigameGma@l
/* 00000DE0 80630000 */ lwz r3, 0(r3)
/* 00000DE4 80630008 */ lwz r3, 8(r3)
/* 00000DE8 80630008 */ lwz r3, 8(r3)
/* 00000DEC 4BFFF375 */ bl g_avdisp_maybe_draw_model_1
lbl_00000DF0:
/* 00000DF0 801F0004 */ lwz r0, 4(r31)
/* 00000DF4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000DF8 41820174 */ beq lbl_00000F6C
/* 00000DFC 4BFFF365 */ bl mathutil_mtxA_from_mtxB
/* 00000E00 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00000E04 C05E1C98 */ lfs f2, 0x1c98(r30)
/* 00000E08 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00000E0C C07E1D00 */ lfs f3, 0x1d00(r30)
/* 00000E10 80630000 */ lwz r3, 0(r3)
/* 00000E14 C0230004 */ lfs f1, 4(r3)
/* 00000E18 4BFFF349 */ bl mathutil_mtxA_translate_xyz
/* 00000E1C C03E1D04 */ lfs f1, 0x1d04(r30)
/* 00000E20 4BFFF341 */ bl mathutil_mtxA_scale_s
/* 00000E24 C03E1D08 */ lfs f1, 0x1d08(r30)
/* 00000E28 C01D0168 */ lfs f0, 0x168(r29)
/* 00000E2C EC010032 */ fmuls f0, f1, f0
/* 00000E30 FC00001E */ fctiwz f0, f0
/* 00000E34 D8010038 */ stfd f0, 0x38(r1)
/* 00000E38 8061003C */ lwz r3, 0x3c(r1)
/* 00000E3C 4BFFF325 */ bl mathutil_mtxA_rotate_y
/* 00000E40 3C600000 */ lis r3, mathutilData@ha
/* 00000E44 3BE30000 */ addi r31, r3, mathutilData@l
/* 00000E48 807F0000 */ lwz r3, 0(r31)
/* 00000E4C 38800000 */ li r4, 0
/* 00000E50 4BFFF311 */ bl GXLoadPosMtxImm
/* 00000E54 807F0000 */ lwz r3, 0(r31)
/* 00000E58 38800000 */ li r4, 0
/* 00000E5C 4BFFF305 */ bl GXLoadNrmMtxImm
/* 00000E60 3C600000 */ lis r3, commonGma@ha
/* 00000E64 3B830000 */ addi r28, r3, commonGma@l
/* 00000E68 807C0000 */ lwz r3, 0(r28)
/* 00000E6C 80630008 */ lwz r3, 8(r3)
/* 00000E70 806305A8 */ lwz r3, 0x5a8(r3)
/* 00000E74 4BFFF2ED */ bl g_avdisp_maybe_draw_model_1
/* 00000E78 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00000E7C C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000E80 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 00000E84 3C600000 */ lis r3, lbl_00010D60@ha
/* 00000E88 3FA04330 */ lis r29, 0x4330
/* 00000E8C C8630000 */ lfd f3, lbl_00010D60@l(r3)
/* 00000E90 5400073E */ clrlwi r0, r0, 0x1c
/* 00000E94 90010044 */ stw r0, 0x44(r1)
/* 00000E98 FC400890 */ fmr f2, f1
/* 00000E9C C89E1D18 */ lfd f4, 0x1d18(r30)
/* 00000EA0 93A10040 */ stw r29, 0x40(r1)
/* 00000EA4 C8BE1D10 */ lfd f5, 0x1d10(r30)
/* 00000EA8 C8010040 */ lfd f0, 0x40(r1)
/* 00000EAC FC001828 */ fsub f0, f0, f3
/* 00000EB0 FC040032 */ fmul f0, f4, f0
/* 00000EB4 FC650028 */ fsub f3, f5, f0
/* 00000EB8 FC601818 */ frsp f3, f3
/* 00000EBC 4BFFF2A5 */ bl mathutil_mtxA_translate_xyz
/* 00000EC0 807F0000 */ lwz r3, 0(r31)
/* 00000EC4 38800000 */ li r4, 0
/* 00000EC8 4BFFF299 */ bl GXLoadPosMtxImm
/* 00000ECC 807F0000 */ lwz r3, 0(r31)
/* 00000ED0 38800000 */ li r4, 0
/* 00000ED4 4BFFF28D */ bl GXLoadNrmMtxImm
/* 00000ED8 C03E1C9C */ lfs f1, 0x1c9c(r30)
/* 00000EDC 4BFFF285 */ bl g_avdisp_set_alpha
/* 00000EE0 807C0000 */ lwz r3, 0(r28)
/* 00000EE4 80630008 */ lwz r3, 8(r3)
/* 00000EE8 806305F8 */ lwz r3, 0x5f8(r3)
/* 00000EEC 4BFFF275 */ bl g_avdisp_maybe_draw_model_1
/* 00000EF0 3B400001 */ li r26, 1
lbl_00000EF4:
/* 00000EF4 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000EF8 C07E1D20 */ lfs f3, 0x1d20(r30)
/* 00000EFC FC400890 */ fmr f2, f1
/* 00000F00 4BFFF261 */ bl mathutil_mtxA_translate_xyz
/* 00000F04 807F0000 */ lwz r3, 0(r31)
/* 00000F08 38800000 */ li r4, 0
/* 00000F0C 4BFFF255 */ bl GXLoadPosMtxImm
/* 00000F10 807F0000 */ lwz r3, 0(r31)
/* 00000F14 38800000 */ li r4, 0
/* 00000F18 4BFFF249 */ bl GXLoadNrmMtxImm
/* 00000F1C 6F408000 */ xoris r0, r26, 0x8000
/* 00000F20 C85E1D30 */ lfd f2, 0x1d30(r30)
/* 00000F24 9001003C */ stw r0, 0x3c(r1)
/* 00000F28 3C600000 */ lis r3, lbl_00010D58@ha
/* 00000F2C C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00000F30 93A10038 */ stw r29, 0x38(r1)
/* 00000F34 C87E1D28 */ lfd f3, 0x1d28(r30)
/* 00000F38 C8010038 */ lfd f0, 0x38(r1)
/* 00000F3C FC000828 */ fsub f0, f0, f1
/* 00000F40 FC020032 */ fmul f0, f2, f0
/* 00000F44 FC230028 */ fsub f1, f3, f0
/* 00000F48 FC200818 */ frsp f1, f1
/* 00000F4C 4BFFF215 */ bl g_avdisp_set_alpha
/* 00000F50 807C0000 */ lwz r3, 0(r28)
/* 00000F54 80630008 */ lwz r3, 8(r3)
/* 00000F58 806305F8 */ lwz r3, 0x5f8(r3)
/* 00000F5C 4BFFF205 */ bl g_avdisp_maybe_draw_model_1
/* 00000F60 3B5A0001 */ addi r26, r26, 1
/* 00000F64 2C1A0014 */ cmpwi r26, 0x14
/* 00000F68 4180FF8C */ blt lbl_00000EF4
lbl_00000F6C:
/* 00000F6C 48009B41 */ bl lbl_0000AAAC
/* 00000F70 3C600000 */ lis r3, lbl_801EEC90@ha
/* 00000F74 80030000 */ lwz r0, lbl_801EEC90@l(r3)
/* 00000F78 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000F7C 40820008 */ bne lbl_00000F84
/* 00000F80 4BFFF1E1 */ bl draw_normal_game_scene
lbl_00000F84:
/* 00000F84 BB410048 */ lmw r26, 0x48(r1)
/* 00000F88 80010064 */ lwz r0, 0x64(r1)
/* 00000F8C 38210060 */ addi r1, r1, 0x60
/* 00000F90 7C0803A6 */ mtlr r0
/* 00000F94 4E800020 */ blr 
lbl_00000F98:
/* 00000F98 7C0802A6 */ mflr r0
/* 00000F9C 3C600000 */ lis r3, lbl_00014F20@ha
/* 00000FA0 90010004 */ stw r0, 4(r1)
/* 00000FA4 9421FEA0 */ stwu r1, -0x160(r1)
/* 00000FA8 DBE10158 */ stfd f31, 0x158(r1)
/* 00000FAC DBC10150 */ stfd f30, 0x150(r1)
/* 00000FB0 BF410138 */ stmw r26, 0x138(r1)
/* 00000FB4 3BC30000 */ addi r30, r3, lbl_00014F20@l
/* 00000FB8 3C600000 */ lis r3, lbl_0000F020@ha
/* 00000FBC 3B830000 */ addi r28, r3, lbl_0000F020@l
/* 00000FC0 3C600000 */ lis r3, lbl_10000000@ha
/* 00000FC4 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 00000FC8 809E0004 */ lwz r4, 4(r30)
/* 00000FCC 548004A7 */ rlwinm. r0, r4, 0, 0x12, 0x13
/* 00000FD0 4082089C */ bne lbl_0000186C
/* 00000FD4 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00000FD8 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 00000FDC 2C000001 */ cmpwi r0, 1
/* 00000FE0 408202B0 */ bne lbl_00001290
/* 00000FE4 801E0000 */ lwz r0, 0(r30)
/* 00000FE8 70006100 */ andi. r0, r0, 0x6100
/* 00000FEC 40820300 */ bne lbl_000012EC
/* 00000FF0 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00000FF4 80C30000 */ lwz r6, currentBallStructPtr@l(r3)
/* 00000FF8 3800000A */ li r0, 0xa
/* 00000FFC 7C0903A6 */ mtctr r0
/* 00001000 38A100C4 */ addi r5, r1, 0xc4
/* 00001004 8806014A */ lbz r0, 0x14a(r6)
/* 00001008 1C000050 */ mulli r0, r0, 0x50
/* 0000100C 7C7C0214 */ add r3, r28, r0
/* 00001010 38830408 */ addi r4, r3, 0x408
lbl_00001014:
/* 00001014 84640008 */ lwzu r3, 8(r4)
/* 00001018 80040004 */ lwz r0, 4(r4)
/* 0000101C 94650008 */ stwu r3, 8(r5)
/* 00001020 90050004 */ stw r0, 4(r5)
/* 00001024 4200FFF0 */ bdnz lbl_00001014
/* 00001028 806600FC */ lwz r3, 0xfc(r6)
/* 0000102C 3800000A */ li r0, 0xa
/* 00001030 7C0903A6 */ mtctr r0
/* 00001034 38A10074 */ addi r5, r1, 0x74
/* 00001038 80030010 */ lwz r0, 0x10(r3)
/* 0000103C 1C000050 */ mulli r0, r0, 0x50
/* 00001040 7C7C0214 */ add r3, r28, r0
/* 00001044 38830548 */ addi r4, r3, 0x548
lbl_00001048:
/* 00001048 84640008 */ lwzu r3, 8(r4)
/* 0000104C 80040004 */ lwz r0, 4(r4)
/* 00001050 94650008 */ stwu r3, 8(r5)
/* 00001054 90050004 */ stw r0, 4(r5)
/* 00001058 4200FFF0 */ bdnz lbl_00001048
/* 0000105C 4BFFF105 */ bl func_80071A8C
/* 00001060 386000B1 */ li r3, 0xb1
/* 00001064 4BFFF0FD */ bl func_80071AD4
/* 00001068 3C600000 */ lis r3, gamePauseStatus@ha
/* 0000106C 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00001070 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00001074 4082000C */ bne lbl_00001080
/* 00001078 3C600020 */ lis r3, 0x20
/* 0000107C 4BFFF0E5 */ bl func_80071B50
lbl_00001080:
/* 00001080 C03C1D48 */ lfs f1, 0x1d48(r28)
/* 00001084 3C600100 */ lis r3, 0x100
/* 00001088 3863FF00 */ addi r3, r3, -256  ;# fixed addi
/* 0000108C FC400890 */ fmr f2, f1
/* 00001090 389E01BC */ addi r4, r30, 0x1bc
/* 00001094 48005DD1 */ bl lbl_00006E64
/* 00001098 C04100DC */ lfs f2, 0xdc(r1)
/* 0000109C 3C600000 */ lis r3, lbl_00010D58@ha
/* 000010A0 C81C1D50 */ lfd f0, 0x1d50(r28)
/* 000010A4 3CA04330 */ lis r5, 0x4330
/* 000010A8 C021008C */ lfs f1, 0x8c(r1)
/* 000010AC FC020032 */ fmul f0, f2, f0
/* 000010B0 3C800000 */ lis r4, lbl_00010D58@ha
/* 000010B4 3B7D0008 */ addi r27, r29, 8
/* 000010B8 3B400000 */ li r26, 0
/* 000010BC FC000018 */ frsp f0, f0
/* 000010C0 D00100DC */ stfs f0, 0xdc(r1)
/* 000010C4 C04100E0 */ lfs f2, 0xe0(r1)
/* 000010C8 C81C1D50 */ lfd f0, 0x1d50(r28)
/* 000010CC FC020032 */ fmul f0, f2, f0
/* 000010D0 FC000018 */ frsp f0, f0
/* 000010D4 D00100E0 */ stfs f0, 0xe0(r1)
/* 000010D8 C81C1D50 */ lfd f0, 0x1d50(r28)
/* 000010DC FC010032 */ fmul f0, f1, f0
/* 000010E0 FC000018 */ frsp f0, f0
/* 000010E4 D001008C */ stfs f0, 0x8c(r1)
/* 000010E8 C0210090 */ lfs f1, 0x90(r1)
/* 000010EC C81C1D50 */ lfd f0, 0x1d50(r28)
/* 000010F0 FC010032 */ fmul f0, f1, f0
/* 000010F4 FC000018 */ frsp f0, f0
/* 000010F8 D0010090 */ stfs f0, 0x90(r1)
/* 000010FC 881D0008 */ lbz r0, 8(r29)
/* 00001100 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00001104 7C060774 */ extsb r6, r0
/* 00001108 54C32036 */ slwi r3, r6, 4
/* 0000110C 380300C8 */ addi r0, r3, 0xc8
/* 00001110 6C008000 */ xoris r0, r0, 0x8000
/* 00001114 90010134 */ stw r0, 0x134(r1)
/* 00001118 6CC08000 */ xoris r0, r6, 0x8000
/* 0000111C 1C66000C */ mulli r3, r6, 0xc
/* 00001120 90A10130 */ stw r5, 0x130(r1)
/* 00001124 C8010130 */ lfd f0, 0x130(r1)
/* 00001128 5466063E */ clrlwi r6, r3, 0x18
/* 0000112C 9001012C */ stw r0, 0x12c(r1)
/* 00001130 5460442E */ rlwinm r0, r3, 8, 0x10, 0x17
/* 00001134 EC200828 */ fsubs f1, f0, f1
/* 00001138 90A10128 */ stw r5, 0x128(r1)
/* 0000113C 5463821E */ rlwinm r3, r3, 0x10, 8, 0xf
/* 00001140 7C003214 */ add r0, r0, r6
/* 00001144 D0210080 */ stfs f1, 0x80(r1)
/* 00001148 C8010128 */ lfd f0, 0x128(r1)
/* 0000114C 7C630214 */ add r3, r3, r0
/* 00001150 D02100D0 */ stfs f1, 0xd0(r1)
/* 00001154 C03C1D58 */ lfs f1, 0x1d58(r28)
/* 00001158 D0210084 */ stfs f1, 0x84(r1)
/* 0000115C D02100D4 */ stfs f1, 0xd4(r1)
/* 00001160 C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00001164 C85C1D60 */ lfd f2, 0x1d60(r28)
/* 00001168 FC000828 */ fsub f0, f0, f1
/* 0000116C C02100D8 */ lfs f1, 0xd8(r1)
/* 00001170 FC020032 */ fmul f0, f2, f0
/* 00001174 FC01002A */ fadd f0, f1, f0
/* 00001178 FC000018 */ frsp f0, f0
/* 0000117C D00100D8 */ stfs f0, 0xd8(r1)
/* 00001180 C02100D8 */ lfs f1, 0xd8(r1)
/* 00001184 C81C1D68 */ lfd f0, 0x1d68(r28)
/* 00001188 FC010028 */ fsub f0, f1, f0
/* 0000118C FC000018 */ frsp f0, f0
/* 00001190 D0010088 */ stfs f0, 0x88(r1)
/* 00001194 80010104 */ lwz r0, 0x104(r1)
/* 00001198 7C030050 */ subf r0, r3, r0
/* 0000119C 90010104 */ stw r0, 0x104(r1)
/* 000011A0 80010104 */ lwz r0, 0x104(r1)
/* 000011A4 900100B4 */ stw r0, 0xb4(r1)
/* 000011A8 48000080 */ b lbl_00001228
lbl_000011AC:
/* 000011AC C02100D0 */ lfs f1, 0xd0(r1)
/* 000011B0 386100CC */ addi r3, r1, 0xcc
/* 000011B4 C01C1D48 */ lfs f0, 0x1d48(r28)
/* 000011B8 EC010028 */ fsubs f0, f1, f0
/* 000011BC D00100D0 */ stfs f0, 0xd0(r1)
/* 000011C0 C02100D8 */ lfs f1, 0xd8(r1)
/* 000011C4 C81C1D60 */ lfd f0, 0x1d60(r28)
/* 000011C8 FC010028 */ fsub f0, f1, f0
/* 000011CC FC000018 */ frsp f0, f0
/* 000011D0 D00100D8 */ stfs f0, 0xd8(r1)
/* 000011D4 80810104 */ lwz r4, 0x104(r1)
/* 000011D8 3C84000C */ addis r4, r4, 0xc
/* 000011DC 38040C0C */ addi r0, r4, 0xc0c
/* 000011E0 90010104 */ stw r0, 0x104(r1)
/* 000011E4 4BFFEF7D */ bl draw_naomi_sprite
/* 000011E8 C0210080 */ lfs f1, 0x80(r1)
/* 000011EC 3861007C */ addi r3, r1, 0x7c
/* 000011F0 C01C1D48 */ lfs f0, 0x1d48(r28)
/* 000011F4 EC010028 */ fsubs f0, f1, f0
/* 000011F8 D0010080 */ stfs f0, 0x80(r1)
/* 000011FC C0210088 */ lfs f1, 0x88(r1)
/* 00001200 C81C1D60 */ lfd f0, 0x1d60(r28)
/* 00001204 FC010028 */ fsub f0, f1, f0
/* 00001208 FC000018 */ frsp f0, f0
/* 0000120C D0010088 */ stfs f0, 0x88(r1)
/* 00001210 808100B4 */ lwz r4, 0xb4(r1)
/* 00001214 3C84000C */ addis r4, r4, 0xc
/* 00001218 38040C0C */ addi r0, r4, 0xc0c
/* 0000121C 900100B4 */ stw r0, 0xb4(r1)
/* 00001220 4BFFEF41 */ bl draw_naomi_sprite
/* 00001224 3B5A0001 */ addi r26, r26, 1
lbl_00001228:
/* 00001228 88BB0000 */ lbz r5, 0(r27)
/* 0000122C 7CA50774 */ extsb r5, r5
/* 00001230 7C1A2800 */ cmpw r26, r5
/* 00001234 4180FF78 */ blt lbl_000011AC
/* 00001238 4CC63182 */ crclr 6
/* 0000123C 38610078 */ addi r3, r1, 0x78
/* 00001240 389E01C8 */ addi r4, r30, 0x1c8
/* 00001244 4BFFEF1D */ bl sprintf
/* 00001248 881B0000 */ lbz r0, 0(r27)
/* 0000124C 3C600000 */ lis r3, lbl_00010D58@ha
/* 00001250 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00001254 3C600100 */ lis r3, 0x100
/* 00001258 7C000774 */ extsb r0, r0
/* 0000125C 54042036 */ slwi r4, r0, 4
/* 00001260 C05C1D48 */ lfs f2, 0x1d48(r28)
/* 00001264 380400C8 */ addi r0, r4, 0xc8
/* 00001268 6C008000 */ xoris r0, r0, 0x8000
/* 0000126C 9001012C */ stw r0, 0x12c(r1)
/* 00001270 3C004330 */ lis r0, 0x4330
/* 00001274 3863FF00 */ addi r3, r3, -256  ;# fixed addi
/* 00001278 90010128 */ stw r0, 0x128(r1)
/* 0000127C 38810078 */ addi r4, r1, 0x78
/* 00001280 C8010128 */ lfd f0, 0x128(r1)
/* 00001284 EC200828 */ fsubs f1, f0, f1
/* 00001288 48005BDD */ bl lbl_00006E64
/* 0000128C 48000060 */ b lbl_000012EC
lbl_00001290:
/* 00001290 548007FF */ clrlwi. r0, r4, 0x1f
/* 00001294 41820058 */ beq lbl_000012EC
/* 00001298 54800529 */ rlwinm. r0, r4, 0, 0x14, 0x14
/* 0000129C 41820044 */ beq lbl_000012E0
/* 000012A0 3C600000 */ lis r3, modeCtrl@ha
/* 000012A4 C03C1D70 */ lfs f1, 0x1d70(r28)
/* 000012A8 38630000 */ addi r3, r3, modeCtrl@l
/* 000012AC 80030024 */ lwz r0, 0x24(r3)
/* 000012B0 3C600000 */ lis r3, lbl_00010D58@ha
/* 000012B4 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 000012B8 1C00000F */ mulli r0, r0, 0xf
/* 000012BC 200000EE */ subfic r0, r0, 0xee
/* 000012C0 6C008000 */ xoris r0, r0, 0x8000
/* 000012C4 9001012C */ stw r0, 0x12c(r1)
/* 000012C8 3C004330 */ lis r0, 0x4330
/* 000012CC 90010128 */ stw r0, 0x128(r1)
/* 000012D0 C8010128 */ lfd f0, 0x128(r1)
/* 000012D4 EC401028 */ fsubs f2, f0, f2
/* 000012D8 48004835 */ bl lbl_00005B0C
/* 000012DC 48000010 */ b lbl_000012EC
lbl_000012E0:
/* 000012E0 C03C1D48 */ lfs f1, 0x1d48(r28)
/* 000012E4 FC400890 */ fmr f2, f1
/* 000012E8 48004825 */ bl lbl_00005B0C
lbl_000012EC:
/* 000012EC 801E0004 */ lwz r0, 4(r30)
/* 000012F0 54000421 */ rlwinm. r0, r0, 0, 0x10, 0x10
/* 000012F4 41820008 */ beq lbl_000012FC
/* 000012F8 48005C15 */ bl lbl_00006F0C
lbl_000012FC:
/* 000012FC 801E0004 */ lwz r0, 4(r30)
/* 00001300 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00001304 41820048 */ beq lbl_0000134C
/* 00001308 387C09B0 */ addi r3, r28, 0x9b0
/* 0000130C 4BFFEE55 */ bl draw_naomi_sprite
/* 00001310 3BE00000 */ li r31, 0
/* 00001314 1C1F0050 */ mulli r0, r31, 0x50
/* 00001318 7F7C0214 */ add r27, r28, r0
/* 0000131C 3B400001 */ li r26, 1
/* 00001320 3B7B0A00 */ addi r27, r27, 0xa00
lbl_00001324:
/* 00001324 A07D013C */ lhz r3, 0x13c(r29)
/* 00001328 7F40F830 */ slw r0, r26, r31
/* 0000132C 7C600039 */ and. r0, r3, r0
/* 00001330 4182000C */ beq lbl_0000133C
/* 00001334 7F63DB78 */ mr r3, r27
/* 00001338 4BFFEE29 */ bl draw_naomi_sprite
lbl_0000133C:
/* 0000133C 3BFF0001 */ addi r31, r31, 1
/* 00001340 281F000A */ cmplwi r31, 0xa
/* 00001344 3B7B0050 */ addi r27, r27, 0x50
/* 00001348 4180FFDC */ blt lbl_00001324
lbl_0000134C:
/* 0000134C 801E0004 */ lwz r0, 4(r30)
/* 00001350 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00001354 4182000C */ beq lbl_00001360
/* 00001358 C03D0170 */ lfs f1, 0x170(r29)
/* 0000135C 48004209 */ bl lbl_00005564
lbl_00001360:
/* 00001360 801E0004 */ lwz r0, 4(r30)
/* 00001364 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 00001368 41820148 */ beq lbl_000014B0
/* 0000136C 387C00A0 */ addi r3, r28, 0xa0
/* 00001370 4BFFEDF1 */ bl draw_naomi_sprite
/* 00001374 3800000A */ li r0, 0xa
/* 00001378 7C0903A6 */ mtctr r0
/* 0000137C 38A10020 */ addi r5, r1, 0x20
/* 00001380 389C00E8 */ addi r4, r28, 0xe8
lbl_00001384:
/* 00001384 84640008 */ lwzu r3, 8(r4)
/* 00001388 80040004 */ lwz r0, 4(r4)
/* 0000138C 94650008 */ stwu r3, 8(r5)
/* 00001390 90050004 */ stw r0, 4(r5)
/* 00001394 4200FFF0 */ bdnz lbl_00001384
/* 00001398 C01D016C */ lfs f0, 0x16c(r29)
/* 0000139C 38610028 */ addi r3, r1, 0x28
/* 000013A0 D0010048 */ stfs f0, 0x48(r1)
/* 000013A4 D0010038 */ stfs f0, 0x38(r1)
/* 000013A8 4BFFEDB9 */ bl draw_naomi_sprite
/* 000013AC 3B400000 */ li r26, 0
/* 000013B0 3B7A0000 */ addi r27, r26, 0
/* 000013B4 3FE04330 */ lis r31, 0x4330
lbl_000013B8:
/* 000013B8 6F408000 */ xoris r0, r26, 0x8000
/* 000013BC C85C1D78 */ lfd f2, 0x1d78(r28)
/* 000013C0 9001012C */ stw r0, 0x12c(r1)
/* 000013C4 3C600000 */ lis r3, lbl_00010D58@ha
/* 000013C8 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 000013CC 93E10128 */ stw r31, 0x128(r1)
/* 000013D0 C07D016C */ lfs f3, 0x16c(r29)
/* 000013D4 C8010128 */ lfd f0, 0x128(r1)
/* 000013D8 FC000828 */ fsub f0, f0, f1
/* 000013DC FC020032 */ fmul f0, f2, f0
/* 000013E0 FC030040 */ fcmpo cr0, f3, f0
/* 000013E4 418000CC */ blt lbl_000014B0
/* 000013E8 3800000A */ li r0, 0xa
/* 000013EC 7C0903A6 */ mtctr r0
/* 000013F0 38A10020 */ addi r5, r1, 0x20
/* 000013F4 389C0138 */ addi r4, r28, 0x138
lbl_000013F8:
/* 000013F8 84640008 */ lwzu r3, 8(r4)
/* 000013FC 80040004 */ lwz r0, 4(r4)
/* 00001400 94650008 */ stwu r3, 8(r5)
/* 00001404 90050004 */ stw r0, 4(r5)
/* 00001408 4200FFF0 */ bdnz lbl_000013F8
/* 0000140C 381A0001 */ addi r0, r26, 1
/* 00001410 C85C1D78 */ lfd f2, 0x1d78(r28)
/* 00001414 6C008000 */ xoris r0, r0, 0x8000
/* 00001418 9001012C */ stw r0, 0x12c(r1)
/* 0000141C 3C600000 */ lis r3, lbl_00010D58@ha
/* 00001420 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00001424 93E10128 */ stw r31, 0x128(r1)
/* 00001428 C8010128 */ lfd f0, 0x128(r1)
/* 0000142C FC000828 */ fsub f0, f0, f1
/* 00001430 FC020032 */ fmul f0, f2, f0
/* 00001434 FC030040 */ fcmpo cr0, f3, f0
/* 00001438 40800038 */ bge lbl_00001470
/* 0000143C 6F408000 */ xoris r0, r26, 0x8000
/* 00001440 C81C1D80 */ lfd f0, 0x1d80(r28)
/* 00001444 9001012C */ stw r0, 0x12c(r1)
/* 00001448 3C600000 */ lis r3, lbl_00010D58@ha
/* 0000144C FC4000F2 */ fmul f2, f0, f3
/* 00001450 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00001454 93E10128 */ stw r31, 0x128(r1)
/* 00001458 C8010128 */ lfd f0, 0x128(r1)
/* 0000145C FC000828 */ fsub f0, f0, f1
/* 00001460 FC020028 */ fsub f0, f2, f0
/* 00001464 FC000018 */ frsp f0, f0
/* 00001468 D0010038 */ stfs f0, 0x38(r1)
/* 0000146C D001003C */ stfs f0, 0x3c(r1)
lbl_00001470:
/* 00001470 6F608000 */ xoris r0, r27, 0x8000
/* 00001474 C041002C */ lfs f2, 0x2c(r1)
/* 00001478 9001012C */ stw r0, 0x12c(r1)
/* 0000147C 3C800000 */ lis r4, lbl_00010D58@ha
/* 00001480 C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00001484 38610028 */ addi r3, r1, 0x28
/* 00001488 93E10128 */ stw r31, 0x128(r1)
/* 0000148C C8010128 */ lfd f0, 0x128(r1)
/* 00001490 EC000828 */ fsubs f0, f0, f1
/* 00001494 EC02002A */ fadds f0, f2, f0
/* 00001498 D001002C */ stfs f0, 0x2c(r1)
/* 0000149C 4BFFECC5 */ bl draw_naomi_sprite
/* 000014A0 3B5A0001 */ addi r26, r26, 1
/* 000014A4 2C1A0016 */ cmpwi r26, 0x16
/* 000014A8 3B7B000E */ addi r27, r27, 0xe
/* 000014AC 4180FF0C */ blt lbl_000013B8
lbl_000014B0:
/* 000014B0 801E0004 */ lwz r0, 4(r30)
/* 000014B4 70000390 */ andi. r0, r0, 0x390
/* 000014B8 41820294 */ beq lbl_0000174C
/* 000014BC 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 000014C0 C85C1DA0 */ lfd f2, 0x1da0(r28)
/* 000014C4 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 000014C8 3C600000 */ lis r3, lbl_00010D60@ha
/* 000014CC C8230000 */ lfd f1, lbl_00010D60@l(r3)
/* 000014D0 9001012C */ stw r0, 0x12c(r1)
/* 000014D4 3C004330 */ lis r0, 0x4330
/* 000014D8 90010128 */ stw r0, 0x128(r1)
/* 000014DC C8010128 */ lfd f0, 0x128(r1)
/* 000014E0 FC000828 */ fsub f0, f0, f1
/* 000014E4 FC020032 */ fmul f0, f2, f0
/* 000014E8 FC00001E */ fctiwz f0, f0
/* 000014EC D8010130 */ stfd f0, 0x130(r1)
/* 000014F0 80610134 */ lwz r3, 0x134(r1)
/* 000014F4 4BFFEC6D */ bl mathutil_sin
/* 000014F8 C81C1D98 */ lfd f0, 0x1d98(r28)
/* 000014FC C85C1D90 */ lfd f2, 0x1d90(r28)
/* 00001500 FC200072 */ fmul f1, f0, f1
/* 00001504 C81C1D88 */ lfd f0, 0x1d88(r28)
/* 00001508 FC22082A */ fadd f1, f2, f1
/* 0000150C FC000072 */ fmul f0, f0, f1
/* 00001510 FC00001E */ fctiwz f0, f0
/* 00001514 D8010120 */ stfd f0, 0x120(r1)
/* 00001518 83410124 */ lwz r26, 0x124(r1)
/* 0000151C 4BFFEC45 */ bl func_80071A8C
/* 00001520 386000B1 */ li r3, 0xb1
/* 00001524 4BFFEC3D */ bl func_80071AD4
/* 00001528 3C600000 */ lis r3, gamePauseStatus@ha
/* 0000152C 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00001530 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00001534 4082000C */ bne lbl_00001540
/* 00001538 3C600020 */ lis r3, 0x20
/* 0000153C 4BFFEC25 */ bl func_80071B50
lbl_00001540:
/* 00001540 801E0004 */ lwz r0, 4(r30)
/* 00001544 54000631 */ rlwinm. r0, r0, 0, 0x18, 0x18
/* 00001548 41820104 */ beq lbl_0000164C
/* 0000154C 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00001550 C05C1DA8 */ lfs f2, 0x1da8(r28)
/* 00001554 80830000 */ lwz r4, unpausedFrameCounter@l(r3)
/* 00001558 3C600000 */ lis r3, lbl_00010D60@ha
/* 0000155C C8230000 */ lfd f1, lbl_00010D60@l(r3)
/* 00001560 3C600000 */ lis r3, lbl_00010D60@ha
/* 00001564 9081012C */ stw r4, 0x12c(r1)
/* 00001568 3C004330 */ lis r0, 0x4330
/* 0000156C C8630000 */ lfd f3, lbl_00010D60@l(r3)
/* 00001570 90010128 */ stw r0, 0x128(r1)
/* 00001574 5484FF3E */ rlwinm r4, r4, 0x1f, 0x1c, 0x1f
/* 00001578 C8010128 */ lfd f0, 0x128(r1)
/* 0000157C 90810124 */ stw r4, 0x124(r1)
/* 00001580 EC000828 */ fsubs f0, f0, f1
/* 00001584 90010120 */ stw r0, 0x120(r1)
/* 00001588 EC020032 */ fmuls f0, f2, f0
/* 0000158C C8210120 */ lfd f1, 0x120(r1)
/* 00001590 EFE11828 */ fsubs f31, f1, f3
/* 00001594 FC00001E */ fctiwz f0, f0
/* 00001598 D8010130 */ stfd f0, 0x130(r1)
/* 0000159C 80610134 */ lwz r3, 0x134(r1)
/* 000015A0 4BFFEBC1 */ bl mathutil_sin
/* 000015A4 FC000890 */ fmr f0, f1
/* 000015A8 5743821E */ rlwinm r3, r26, 0x10, 8, 0xf
/* 000015AC 3FE30001 */ addis r31, r3, 1
/* 000015B0 C03C1DAC */ lfs f1, 0x1dac(r28)
/* 000015B4 3F600100 */ lis r27, 0x100
/* 000015B8 FFC00090 */ fmr f30, f0
/* 000015BC C05C1DB0 */ lfs f2, 0x1db0(r28)
/* 000015C0 3BFFFFFF */ addi r31, r31, -1  ;# fixed addi
/* 000015C4 387BFFFF */ addi r3, r27, -1  ;# fixed addi
/* 000015C8 389E01CC */ addi r4, r30, 0x1cc
/* 000015CC 48005899 */ bl lbl_00006E64
/* 000015D0 C03C1DB4 */ lfs f1, 0x1db4(r28)
/* 000015D4 7FE3FB78 */ mr r3, r31
/* 000015D8 C05C1DB0 */ lfs f2, 0x1db0(r28)
/* 000015DC 389E01D8 */ addi r4, r30, 0x1d8
/* 000015E0 48005885 */ bl lbl_00006E64
/* 000015E4 C03C1DAC */ lfs f1, 0x1dac(r28)
/* 000015E8 387BFFFF */ addi r3, r27, -1  ;# fixed addi
/* 000015EC C05C1DB8 */ lfs f2, 0x1db8(r28)
/* 000015F0 389E01E0 */ addi r4, r30, 0x1e0
/* 000015F4 48005871 */ bl lbl_00006E64
/* 000015F8 C03C1DB4 */ lfs f1, 0x1db4(r28)
/* 000015FC 7FE3FB78 */ mr r3, r31
/* 00001600 C05C1DB8 */ lfs f2, 0x1db8(r28)
/* 00001604 389E01EC */ addi r4, r30, 0x1ec
/* 00001608 4800585D */ bl lbl_00006E64
/* 0000160C C03C1DB4 */ lfs f1, 0x1db4(r28)
/* 00001610 7FE3FB78 */ mr r3, r31
/* 00001614 C05C1DBC */ lfs f2, 0x1dbc(r28)
/* 00001618 389E01F8 */ addi r4, r30, 0x1f8
/* 0000161C 48005849 */ bl lbl_00006E64
/* 00001620 C81C1DC0 */ lfd f0, 0x1dc0(r28)
/* 00001624 FC1E0040 */ fcmpo cr0, f30, f0
/* 00001628 40810024 */ ble lbl_0000164C
/* 0000162C FC20F090 */ fmr f1, f30
/* 00001630 4BFFEB31 */ bl func_80071B40
/* 00001634 C01C1DCC */ lfs f0, 0x1dcc(r28)
/* 00001638 7FE3FB78 */ mr r3, r31
/* 0000163C C03C1DC8 */ lfs f1, 0x1dc8(r28)
/* 00001640 389E0200 */ addi r4, r30, 0x200
/* 00001644 EC40F82A */ fadds f2, f0, f31
/* 00001648 4800581D */ bl lbl_00006E64
lbl_0000164C:
/* 0000164C 801E0004 */ lwz r0, 4(r30)
/* 00001650 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001654 41820050 */ beq lbl_000016A4
/* 00001658 5743063E */ clrlwi r3, r26, 0x18
/* 0000165C C03C1DD0 */ lfs f1, 0x1dd0(r28)
/* 00001660 3F630100 */ addis r27, r3, 0x100
/* 00001664 C05C1DBC */ lfs f2, 0x1dbc(r28)
/* 00001668 3C600100 */ lis r3, 0x100
/* 0000166C 3B7BFF00 */ addi r27, r27, -256  ;# fixed addi
/* 00001670 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00001674 389E01E0 */ addi r4, r30, 0x1e0
/* 00001678 480057ED */ bl lbl_00006E64
/* 0000167C C03C1DD4 */ lfs f1, 0x1dd4(r28)
/* 00001680 7F63DB78 */ mr r3, r27
/* 00001684 C05C1DBC */ lfs f2, 0x1dbc(r28)
/* 00001688 389E0210 */ addi r4, r30, 0x210
/* 0000168C 480057D9 */ bl lbl_00006E64
/* 00001690 C03C1DD4 */ lfs f1, 0x1dd4(r28)
/* 00001694 7F63DB78 */ mr r3, r27
/* 00001698 C05C1DD8 */ lfs f2, 0x1dd8(r28)
/* 0000169C 389E01F8 */ addi r4, r30, 0x1f8
/* 000016A0 480057C5 */ bl lbl_00006E64
lbl_000016A4:
/* 000016A4 801E0004 */ lwz r0, 4(r30)
/* 000016A8 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 000016AC 41820054 */ beq lbl_00001700
/* 000016B0 5744063E */ clrlwi r4, r26, 0x18
/* 000016B4 C03C1DD0 */ lfs f1, 0x1dd0(r28)
/* 000016B8 5743442E */ rlwinm r3, r26, 8, 0x10, 0x17
/* 000016BC C05C1DD8 */ lfs f2, 0x1dd8(r28)
/* 000016C0 3C0300FF */ addis r0, r3, 0xff
/* 000016C4 3C600100 */ lis r3, 0x100
/* 000016C8 7F602214 */ add r27, r0, r4
/* 000016CC 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 000016D0 389E01E0 */ addi r4, r30, 0x1e0
/* 000016D4 48005791 */ bl lbl_00006E64
/* 000016D8 C03C1DD4 */ lfs f1, 0x1dd4(r28)
/* 000016DC 7F63DB78 */ mr r3, r27
/* 000016E0 C05C1DD8 */ lfs f2, 0x1dd8(r28)
/* 000016E4 389E0218 */ addi r4, r30, 0x218
/* 000016E8 4800577D */ bl lbl_00006E64
/* 000016EC C03C1DD4 */ lfs f1, 0x1dd4(r28)
/* 000016F0 7F63DB78 */ mr r3, r27
/* 000016F4 C05C1DDC */ lfs f2, 0x1ddc(r28)
/* 000016F8 389E01F8 */ addi r4, r30, 0x1f8
/* 000016FC 48005769 */ bl lbl_00006E64
lbl_00001700:
/* 00001700 801E0004 */ lwz r0, 4(r30)
/* 00001704 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00001708 41820044 */ beq lbl_0000174C
/* 0000170C 5744063E */ clrlwi r4, r26, 0x18
/* 00001710 C03C1D48 */ lfs f1, 0x1d48(r28)
/* 00001714 5743821E */ rlwinm r3, r26, 0x10, 8, 0xf
/* 00001718 C05C1DE0 */ lfs f2, 0x1de0(r28)
/* 0000171C 3C030001 */ addis r0, r3, 1
/* 00001720 7F402214 */ add r26, r0, r4
/* 00001724 3C600100 */ lis r3, 0x100
/* 00001728 3B5AFF00 */ addi r26, r26, -256  ;# fixed addi
/* 0000172C 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00001730 389E0220 */ addi r4, r30, 0x220
/* 00001734 48005731 */ bl lbl_00006E64
/* 00001738 C03C1D70 */ lfs f1, 0x1d70(r28)
/* 0000173C 7F43D378 */ mr r3, r26
/* 00001740 C05C1DE0 */ lfs f2, 0x1de0(r28)
/* 00001744 389E0238 */ addi r4, r30, 0x238
/* 00001748 4800571D */ bl lbl_00006E64
lbl_0000174C:
/* 0000174C 801E0004 */ lwz r0, 4(r30)
/* 00001750 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 00001754 4182002C */ beq lbl_00001780
/* 00001758 7F83E378 */ mr r3, r28
/* 0000175C 4BFFEA05 */ bl draw_naomi_sprite
/* 00001760 387C19F0 */ addi r3, r28, 0x19f0
/* 00001764 4BFFE9FD */ bl draw_naomi_sprite
/* 00001768 387C1A40 */ addi r3, r28, 0x1a40
/* 0000176C 4BFFE9F5 */ bl draw_naomi_sprite
/* 00001770 387C1A90 */ addi r3, r28, 0x1a90
/* 00001774 4BFFE9ED */ bl draw_naomi_sprite
/* 00001778 387C1B30 */ addi r3, r28, 0x1b30
/* 0000177C 4BFFE9E5 */ bl draw_naomi_sprite
lbl_00001780:
/* 00001780 801E0004 */ lwz r0, 4(r30)
/* 00001784 5400039F */ rlwinm. r0, r0, 0, 0xe, 0xf
/* 00001788 418200B4 */ beq lbl_0000183C
/* 0000178C 387C19F0 */ addi r3, r28, 0x19f0
/* 00001790 4BFFE9D1 */ bl draw_naomi_sprite
/* 00001794 387C1A40 */ addi r3, r28, 0x1a40
/* 00001798 4BFFE9C9 */ bl draw_naomi_sprite
/* 0000179C 387C1AE0 */ addi r3, r28, 0x1ae0
/* 000017A0 4BFFE9C1 */ bl draw_naomi_sprite
/* 000017A4 387C1B30 */ addi r3, r28, 0x1b30
/* 000017A8 4BFFE9B9 */ bl draw_naomi_sprite
/* 000017AC 4BFFE9B5 */ bl func_80071A8C
/* 000017B0 386000B1 */ li r3, 0xb1
/* 000017B4 4BFFE9AD */ bl func_80071AD4
/* 000017B8 3C600000 */ lis r3, gamePauseStatus@ha
/* 000017BC 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 000017C0 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000017C4 4082000C */ bne lbl_000017D0
/* 000017C8 3C600020 */ lis r3, 0x20
/* 000017CC 4BFFE995 */ bl func_80071B50
lbl_000017D0:
/* 000017D0 887D0008 */ lbz r3, 8(r29)
/* 000017D4 7C600775 */ extsb. r0, r3
/* 000017D8 4081000C */ ble lbl_000017E4
/* 000017DC 7C650774 */ extsb r5, r3
/* 000017E0 48000008 */ b lbl_000017E8
lbl_000017E4:
/* 000017E4 38A00000 */ li r5, 0
lbl_000017E8:
/* 000017E8 4CC63182 */ crclr 6
/* 000017EC 38610008 */ addi r3, r1, 8
/* 000017F0 389E0240 */ addi r4, r30, 0x240
/* 000017F4 4BFFE96D */ bl sprintf
/* 000017F8 3F400100 */ lis r26, 0x100
/* 000017FC C03C1DE4 */ lfs f1, 0x1de4(r28)
/* 00001800 C05C1DE8 */ lfs f2, 0x1de8(r28)
/* 00001804 387AFF00 */ addi r3, r26, -256  ;# fixed addi
/* 00001808 38810008 */ addi r4, r1, 8
/* 0000180C 48005659 */ bl lbl_00006E64
/* 00001810 88BD0006 */ lbz r5, 6(r29)
/* 00001814 38610008 */ addi r3, r1, 8
/* 00001818 389E0258 */ addi r4, r30, 0x258
/* 0000181C 4CC63182 */ crclr 6
/* 00001820 7CA50774 */ extsb r5, r5
/* 00001824 4BFFE93D */ bl sprintf
/* 00001828 C03C1DEC */ lfs f1, 0x1dec(r28)
/* 0000182C 387AFF00 */ addi r3, r26, -256  ;# fixed addi
/* 00001830 C05C1DF0 */ lfs f2, 0x1df0(r28)
/* 00001834 38810008 */ addi r4, r1, 8
/* 00001838 4800562D */ bl lbl_00006E64
lbl_0000183C:
/* 0000183C 801E0004 */ lwz r0, 4(r30)
/* 00001840 5400035B */ rlwinm. r0, r0, 0, 0xd, 0xd
/* 00001844 41820028 */ beq lbl_0000186C
/* 00001848 4BFFE919 */ bl func_80071A8C
/* 0000184C 386000B0 */ li r3, 0xb0
/* 00001850 4BFFE911 */ bl func_80071AD4
/* 00001854 3C600100 */ lis r3, 0x100
/* 00001858 C03C1DF4 */ lfs f1, 0x1df4(r28)
/* 0000185C C05C1DF8 */ lfs f2, 0x1df8(r28)
/* 00001860 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00001864 389E0278 */ addi r4, r30, 0x278
/* 00001868 480055FD */ bl lbl_00006E64
lbl_0000186C:
/* 0000186C BB410138 */ lmw r26, 0x138(r1)
/* 00001870 80010164 */ lwz r0, 0x164(r1)
/* 00001874 CBE10158 */ lfd f31, 0x158(r1)
/* 00001878 CBC10150 */ lfd f30, 0x150(r1)
/* 0000187C 7C0803A6 */ mtlr r0
/* 00001880 38210160 */ addi r1, r1, 0x160
/* 00001884 4E800020 */ blr 
lbl_00001888:
/* 00001888 7C0802A6 */ mflr r0
/* 0000188C 90010004 */ stw r0, 4(r1)
/* 00001890 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001894 93E1000C */ stw r31, 0xc(r1)
/* 00001898 93C10008 */ stw r30, 8(r1)
/* 0000189C 4BFFE8C5 */ bl func_8002FFEC
/* 000018A0 4BFFE8C1 */ bl event_finish_all
/* 000018A4 3C600000 */ lis r3, lbl_801EEC90@ha
/* 000018A8 84030000 */ lwzu r0, lbl_801EEC90@l(r3)
/* 000018AC 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 000018B0 90030000 */ stw r0, 0(r3)
/* 000018B4 4BFFE8AD */ bl g_free_minigame_graphics
/* 000018B8 38600006 */ li r3, 6
/* 000018BC 4BFFE8A5 */ bl bitmap_free_group
/* 000018C0 4BFFE8A1 */ bl func_80029788
/* 000018C4 3C600000 */ lis r3, lbl_80206B80@ha
/* 000018C8 38630000 */ addi r3, r3, lbl_80206B80@l
/* 000018CC 3BE3003C */ addi r31, r3, 0x3c
/* 000018D0 3BC0000F */ li r30, 0xf
lbl_000018D4:
/* 000018D4 807F0000 */ lwz r3, 0(r31)
/* 000018D8 2C03FFFF */ cmpwi r3, -1
/* 000018DC 41820008 */ beq lbl_000018E4
/* 000018E0 4BFFE881 */ bl func_8008D29C
lbl_000018E4:
/* 000018E4 37DEFFFF */ addic. r30, r30, -1  ;# fixed addi
/* 000018E8 3BFFFFFC */ addi r31, r31, -4  ;# fixed addi
/* 000018EC 4080FFE8 */ bge lbl_000018D4
/* 000018F0 80010014 */ lwz r0, 0x14(r1)
/* 000018F4 83E1000C */ lwz r31, 0xc(r1)
/* 000018F8 83C10008 */ lwz r30, 8(r1)
/* 000018FC 7C0803A6 */ mtlr r0
/* 00001900 38210010 */ addi r1, r1, 0x10
/* 00001904 4E800020 */ blr 
lbl_00001908:
/* 00001908 7C0802A6 */ mflr r0
/* 0000190C 3C600000 */ lis r3, modeCtrl@ha
/* 00001910 90010004 */ stw r0, 4(r1)
/* 00001914 38630000 */ addi r3, r3, modeCtrl@l
/* 00001918 3C800000 */ lis r4, lbl_0000F020@ha
/* 0000191C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00001920 93E10014 */ stw r31, 0x14(r1)
/* 00001924 3BE40000 */ addi r31, r4, lbl_0000F020@l
/* 00001928 93C10010 */ stw r30, 0x10(r1)
/* 0000192C 93A1000C */ stw r29, 0xc(r1)
/* 00001930 3BA3002C */ addi r29, r3, 0x2c
/* 00001934 8003002C */ lwz r0, 0x2c(r3)
/* 00001938 3C600000 */ lis r3, lbl_10000000@ha
/* 0000193C 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00001940 1C00004C */ mulli r0, r0, 0x4c
/* 00001944 7C7E0214 */ add r3, r30, r0
/* 00001948 88030013 */ lbz r0, 0x13(r3)
/* 0000194C 7C000774 */ extsb r0, r0
/* 00001950 2C000001 */ cmpwi r0, 1
/* 00001954 41820018 */ beq lbl_0000196C
/* 00001958 2C000002 */ cmpwi r0, 2
/* 0000195C 40820020 */ bne lbl_0000197C
/* 00001960 88030012 */ lbz r0, 0x12(r3)
/* 00001964 2C00000A */ cmpwi r0, 0xa
/* 00001968 40820014 */ bne lbl_0000197C
lbl_0000196C:
/* 0000196C 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00001970 38000000 */ li r0, 0
/* 00001974 90030000 */ stw r0, lbl_80206DEC@l(r3)
/* 00001978 48000010 */ b lbl_00001988
lbl_0000197C:
/* 0000197C 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00001980 38001770 */ li r0, 0x1770
/* 00001984 90030000 */ stw r0, lbl_80206DEC@l(r3)
lbl_00001988:
/* 00001988 C03F1C24 */ lfs f1, 0x1c24(r31)
/* 0000198C 48009721 */ bl lbl_0000B0AC
/* 00001990 387E013E */ addi r3, r30, 0x13e
/* 00001994 480093F9 */ bl lbl_0000AD8C
/* 00001998 B07E013C */ sth r3, 0x13c(r30)
/* 0000199C 480092C5 */ bl lbl_0000AC60
/* 000019A0 A01E013C */ lhz r0, 0x13c(r30)
/* 000019A4 28000000 */ cmplwi r0, 0
/* 000019A8 40820014 */ bne lbl_000019BC
/* 000019AC 48003365 */ bl lbl_00004D10
/* 000019B0 387E013E */ addi r3, r30, 0x13e
/* 000019B4 480093D9 */ bl lbl_0000AD8C
/* 000019B8 B07E013C */ sth r3, 0x13c(r30)
lbl_000019BC:
/* 000019BC 38E00000 */ li r7, 0
/* 000019C0 98FE013F */ stb r7, 0x13f(r30)
/* 000019C4 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 000019C8 3C600000 */ lis r3, spritePoolInfo@ha
/* 000019CC 98FE0140 */ stb r7, 0x140(r30)
/* 000019D0 3C800000 */ lis r4, ballInfo@ha
/* 000019D4 38040000 */ addi r0, r4, ballInfo@l
/* 000019D8 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 000019DC 38C50000 */ addi r6, r5, currentBallStructPtr@l
/* 000019E0 38A30000 */ addi r5, r3, spritePoolInfo@l
/* 000019E4 D01E0168 */ stfs f0, 0x168(r30)
/* 000019E8 7C080378 */ mr r8, r0
/* 000019EC 39600000 */ li r11, 0
/* 000019F0 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 000019F4 38800019 */ li r4, 0x19
/* 000019F8 D01E016C */ stfs f0, 0x16c(r30)
/* 000019FC C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001A00 D01E0170 */ stfs f0, 0x170(r30)
/* 00001A04 B0FE0174 */ sth r7, 0x174(r30)
/* 00001A08 81260000 */ lwz r9, 0(r6)
/* 00001A0C 8145000C */ lwz r10, 0xc(r5)
/* 00001A10 4800002C */ b lbl_00001A3C
lbl_00001A14:
/* 00001A14 880A0000 */ lbz r0, 0(r10)
/* 00001A18 2C000002 */ cmpwi r0, 2
/* 00001A1C 40820014 */ bne lbl_00001A30
/* 00001A20 91060000 */ stw r8, 0(r6)
/* 00001A24 98880003 */ stb r4, 3(r8)
/* 00001A28 80660000 */ lwz r3, 0(r6)
/* 00001A2C 98E30148 */ stb r7, 0x148(r3)
lbl_00001A30:
/* 00001A30 396B0001 */ addi r11, r11, 1
/* 00001A34 390801A4 */ addi r8, r8, 0x1a4
/* 00001A38 394A0001 */ addi r10, r10, 1
lbl_00001A3C:
/* 00001A3C 80050008 */ lwz r0, 8(r5)
/* 00001A40 7C0B0000 */ cmpw r11, r0
/* 00001A44 4180FFD0 */ blt lbl_00001A14
/* 00001A48 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00001A4C 38830000 */ addi r4, r3, currentBallStructPtr@l
/* 00001A50 3C600000 */ lis r3, modeCtrl@ha
/* 00001A54 91240000 */ stw r9, 0(r4)
/* 00001A58 38630000 */ addi r3, r3, modeCtrl@l
/* 00001A5C 80030024 */ lwz r0, 0x24(r3)
/* 00001A60 2C000002 */ cmpwi r0, 2
/* 00001A64 41800018 */ blt lbl_00001A7C
/* 00001A68 809D0000 */ lwz r4, 0(r29)
/* 00001A6C 3860003C */ li r3, 0x3c
/* 00001A70 38840001 */ addi r4, r4, 1
/* 00001A74 4800BE99 */ bl lbl_0000D90C
/* 00001A78 48000010 */ b lbl_00001A88
lbl_00001A7C:
/* 00001A7C 3860003C */ li r3, 0x3c
/* 00001A80 38800000 */ li r4, 0
/* 00001A84 4800BE89 */ bl lbl_0000D90C
lbl_00001A88:
/* 00001A88 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001A8C 3C600000 */ lis r3, cameraInfo@ha
/* 00001A90 3800003C */ li r0, 0x3c
/* 00001A94 D01E0160 */ stfs f0, 0x160(r30)
/* 00001A98 3CC00000 */ lis r6, lbl_00014F20@ha
/* 00001A9C 38E00002 */ li r7, 2
/* 00001AA0 C01F1DFC */ lfs f0, 0x1dfc(r31)
/* 00001AA4 3CA00000 */ lis r5, lbl_00014F24@ha
/* 00001AA8 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00001AAC D01E0164 */ stfs f0, 0x164(r30)
/* 00001AB0 38630000 */ addi r3, r3, cameraInfo@l
/* 00001AB4 901E0000 */ stw r0, 0(r30)
/* 00001AB8 38004023 */ li r0, 0x4023
/* 00001ABC 90E60000 */ stw r7, lbl_00014F20@l(r6)
/* 00001AC0 38C30284 */ addi r6, r3, 0x284
/* 00001AC4 90050000 */ stw r0, lbl_00014F24@l(r5)
/* 00001AC8 84040000 */ lwzu r0, currentCameraStructPtr@l(r4)
/* 00001ACC 90640000 */ stw r3, 0(r4)
/* 00001AD0 98E3001F */ stb r7, 0x1f(r3)
/* 00001AD4 90C40000 */ stw r6, 0(r4)
/* 00001AD8 38C60284 */ addi r6, r6, 0x284
/* 00001ADC 98E302A3 */ stb r7, 0x2a3(r3)
/* 00001AE0 90C40000 */ stw r6, 0(r4)
/* 00001AE4 98E6001F */ stb r7, 0x1f(r6)
/* 00001AE8 38C60284 */ addi r6, r6, 0x284
/* 00001AEC 90C40000 */ stw r6, 0(r4)
/* 00001AF0 98E6001F */ stb r7, 0x1f(r6)
/* 00001AF4 90040000 */ stw r0, 0(r4)
/* 00001AF8 8001001C */ lwz r0, 0x1c(r1)
/* 00001AFC 83E10014 */ lwz r31, 0x14(r1)
/* 00001B00 83C10010 */ lwz r30, 0x10(r1)
/* 00001B04 7C0803A6 */ mtlr r0
/* 00001B08 83A1000C */ lwz r29, 0xc(r1)
/* 00001B0C 38210018 */ addi r1, r1, 0x18
/* 00001B10 4E800020 */ blr 
lbl_00001B14:
/* 00001B14 7C0802A6 */ mflr r0
/* 00001B18 3C600000 */ lis r3, lbl_0000F020@ha
/* 00001B1C 90010004 */ stw r0, 4(r1)
/* 00001B20 3CA00000 */ lis r5, lbl_10000000@ha
/* 00001B24 9421FFE0 */ stwu r1, -0x20(r1)
/* 00001B28 93E1001C */ stw r31, 0x1c(r1)
/* 00001B2C 3BE30000 */ addi r31, r3, lbl_0000F020@l
/* 00001B30 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00001B34 93C10018 */ stw r30, 0x18(r1)
/* 00001B38 3BC50000 */ addi r30, r5, lbl_10000000@l
/* 00001B3C 809F1E00 */ lwz r4, 0x1e00(r31)
/* 00001B40 801F1E04 */ lwz r0, 0x1e04(r31)
/* 00001B44 90810008 */ stw r4, 8(r1)
/* 00001B48 9001000C */ stw r0, 0xc(r1)
/* 00001B4C 809F1E08 */ lwz r4, 0x1e08(r31)
/* 00001B50 801F1E0C */ lwz r0, 0x1e0c(r31)
/* 00001B54 90810010 */ stw r4, 0x10(r1)
/* 00001B58 90010014 */ stw r0, 0x14(r1)
/* 00001B5C 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 00001B60 2C000000 */ cmpwi r0, 0
/* 00001B64 40820050 */ bne lbl_00001BB4
/* 00001B68 3C600000 */ lis r3, modeCtrl@ha
/* 00001B6C 38630000 */ addi r3, r3, modeCtrl@l
/* 00001B70 80030024 */ lwz r0, 0x24(r3)
/* 00001B74 2C000002 */ cmpwi r0, 2
/* 00001B78 4180003C */ blt lbl_00001BB4
/* 00001B7C 801E0000 */ lwz r0, 0(r30)
/* 00001B80 2C00003B */ cmpwi r0, 0x3b
/* 00001B84 4082001C */ bne lbl_00001BA0
/* 00001B88 8003002C */ lwz r0, 0x2c(r3)
/* 00001B8C 38610008 */ addi r3, r1, 8
/* 00001B90 5400103A */ slwi r0, r0, 2
/* 00001B94 7C63002E */ lwzx r3, r3, r0
/* 00001B98 4BFFE5C9 */ bl g_play_sound
/* 00001B9C 4800002C */ b lbl_00001BC8
lbl_00001BA0:
/* 00001BA0 2C000001 */ cmpwi r0, 1
/* 00001BA4 40820024 */ bne lbl_00001BC8
/* 00001BA8 386001F5 */ li r3, 0x1f5
/* 00001BAC 4BFFE5B5 */ bl g_play_sound
/* 00001BB0 48000018 */ b lbl_00001BC8
lbl_00001BB4:
/* 00001BB4 801E0000 */ lwz r0, 0(r30)
/* 00001BB8 2C00003B */ cmpwi r0, 0x3b
/* 00001BBC 4082000C */ bne lbl_00001BC8
/* 00001BC0 386001F5 */ li r3, 0x1f5
/* 00001BC4 4BFFE59D */ bl g_play_sound
lbl_00001BC8:
/* 00001BC8 801E0000 */ lwz r0, 0(r30)
/* 00001BCC 2C000000 */ cmpwi r0, 0
/* 00001BD0 4080009C */ bge lbl_00001C6C
/* 00001BD4 3C600000 */ lis r3, modeCtrl@ha
/* 00001BD8 38630000 */ addi r3, r3, modeCtrl@l
/* 00001BDC 80030024 */ lwz r0, 0x24(r3)
/* 00001BE0 2C000001 */ cmpwi r0, 1
/* 00001BE4 40820010 */ bne lbl_00001BF4
/* 00001BE8 3C600001 */ lis r3, 1
/* 00001BEC 3863D81E */ addi r3, r3, -10210  ;# fixed addi
/* 00001BF0 4BFFE571 */ bl g_play_sound
lbl_00001BF4:
/* 00001BF4 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001BF8 3CC00000 */ lis r6, lbl_00014F20@ha
/* 00001BFC 38E60000 */ addi r7, r6, lbl_00014F20@l
/* 00001C00 D01E0160 */ stfs f0, 0x160(r30)
/* 00001C04 3C600000 */ lis r3, cameraInfo@ha
/* 00001C08 39002710 */ li r8, 0x2710
/* 00001C0C C01F1DFC */ lfs f0, 0x1dfc(r31)
/* 00001C10 38000004 */ li r0, 4
/* 00001C14 3CA00000 */ lis r5, lbl_00014F24@ha
/* 00001C18 D01E0164 */ stfs f0, 0x164(r30)
/* 00001C1C 38C040A1 */ li r6, 0x40a1
/* 00001C20 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00001C24 911E0000 */ stw r8, 0(r30)
/* 00001C28 38630000 */ addi r3, r3, cameraInfo@l
/* 00001C2C 90070000 */ stw r0, 0(r7)
/* 00001C30 38000002 */ li r0, 2
/* 00001C34 90C50000 */ stw r6, lbl_00014F24@l(r5)
/* 00001C38 38A30284 */ addi r5, r3, 0x284
/* 00001C3C 84C40000 */ lwzu r6, currentCameraStructPtr@l(r4)
/* 00001C40 90640000 */ stw r3, 0(r4)
/* 00001C44 9803001F */ stb r0, 0x1f(r3)
/* 00001C48 90A40000 */ stw r5, 0(r4)
/* 00001C4C 38A50284 */ addi r5, r5, 0x284
/* 00001C50 980302A3 */ stb r0, 0x2a3(r3)
/* 00001C54 90A40000 */ stw r5, 0(r4)
/* 00001C58 9805001F */ stb r0, 0x1f(r5)
/* 00001C5C 38A50284 */ addi r5, r5, 0x284
/* 00001C60 90A40000 */ stw r5, 0(r4)
/* 00001C64 9805001F */ stb r0, 0x1f(r5)
/* 00001C68 90C40000 */ stw r6, 0(r4)
lbl_00001C6C:
/* 00001C6C 80010024 */ lwz r0, 0x24(r1)
/* 00001C70 83E1001C */ lwz r31, 0x1c(r1)
/* 00001C74 83C10018 */ lwz r30, 0x18(r1)
/* 00001C78 7C0803A6 */ mtlr r0
/* 00001C7C 38210020 */ addi r1, r1, 0x20
/* 00001C80 4E800020 */ blr 
lbl_00001C84:
/* 00001C84 7C0802A6 */ mflr r0
/* 00001C88 3C600000 */ lis r3, lbl_10000000@ha
/* 00001C8C 90010004 */ stw r0, 4(r1)
/* 00001C90 9421FFE0 */ stwu r1, -0x20(r1)
/* 00001C94 93E1001C */ stw r31, 0x1c(r1)
/* 00001C98 93C10018 */ stw r30, 0x18(r1)
/* 00001C9C 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00001CA0 3C600000 */ lis r3, lbl_00010D58@ha
/* 00001CA4 93A10014 */ stw r29, 0x14(r1)
/* 00001CA8 801E0000 */ lwz r0, 0(r30)
/* 00001CAC C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00001CB0 3C600000 */ lis r3, lbl_0000F020@ha
/* 00001CB4 6C008000 */ xoris r0, r0, 0x8000
/* 00001CB8 9001000C */ stw r0, 0xc(r1)
/* 00001CBC 3C004330 */ lis r0, 0x4330
/* 00001CC0 3BE30000 */ addi r31, r3, lbl_0000F020@l
/* 00001CC4 90010008 */ stw r0, 8(r1)
/* 00001CC8 C85F1E10 */ lfd f2, 0x1e10(r31)
/* 00001CCC C8010008 */ lfd f0, 8(r1)
/* 00001CD0 FC000828 */ fsub f0, f0, f1
/* 00001CD4 FC020000 */ fcmpu cr0, f2, f0
/* 00001CD8 40820024 */ bne lbl_00001CFC
/* 00001CDC 3C600000 */ lis r3, modeCtrl@ha
/* 00001CE0 38630000 */ addi r3, r3, modeCtrl@l
/* 00001CE4 80030024 */ lwz r0, 0x24(r3)
/* 00001CE8 2C000002 */ cmpwi r0, 2
/* 00001CEC 41800010 */ blt lbl_00001CFC
/* 00001CF0 3C600001 */ lis r3, 1
/* 00001CF4 3863D81E */ addi r3, r3, -10210  ;# fixed addi
/* 00001CF8 4BFFE469 */ bl g_play_sound
lbl_00001CFC:
/* 00001CFC 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00001D00 C85F1E18 */ lfd f2, 0x1e18(r31)
/* 00001D04 38C30000 */ addi r6, r3, currentBallStructPtr@l
/* 00001D08 80E60000 */ lwz r7, 0(r6)
/* 00001D0C 3C600000 */ lis r3, lbl_00010D58@ha
/* 00001D10 3C800000 */ lis r4, lbl_80206BD0@ha
/* 00001D14 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00001D18 8807002E */ lbz r0, 0x2e(r7)
/* 00001D1C 3CA00000 */ lis r5, controllerInfo@ha
/* 00001D20 7C000774 */ extsb r0, r0
/* 00001D24 5403103A */ slwi r3, r0, 2
/* 00001D28 38040000 */ addi r0, r4, lbl_80206BD0@l
/* 00001D2C 7C601A14 */ add r3, r0, r3
/* 00001D30 80630000 */ lwz r3, 0(r3)
/* 00001D34 38850000 */ addi r4, r5, controllerInfo@l
/* 00001D38 3C004330 */ lis r0, 0x4330
/* 00001D3C 1C63003C */ mulli r3, r3, 0x3c
/* 00001D40 7C641A14 */ add r3, r4, r3
/* 00001D44 88630002 */ lbz r3, 2(r3)
/* 00001D48 7C630774 */ extsb r3, r3
/* 00001D4C 6C638000 */ xoris r3, r3, 0x8000
/* 00001D50 9061000C */ stw r3, 0xc(r1)
/* 00001D54 90010008 */ stw r0, 8(r1)
/* 00001D58 C8010008 */ lfd f0, 8(r1)
/* 00001D5C FC000828 */ fsub f0, f0, f1
/* 00001D60 FC020032 */ fmul f0, f2, f0
/* 00001D64 FC000018 */ frsp f0, f0
/* 00001D68 D007001C */ stfs f0, 0x1c(r7)
/* 00001D6C 80660000 */ lwz r3, 0(r6)
/* 00001D70 C81F1E20 */ lfd f0, 0x1e20(r31)
/* 00001D74 C0430004 */ lfs f2, 4(r3)
/* 00001D78 FC020040 */ fcmpo cr0, f2, f0
/* 00001D7C 40810014 */ ble lbl_00001D90
/* 00001D80 C023001C */ lfs f1, 0x1c(r3)
/* 00001D84 C81F1DC0 */ lfd f0, 0x1dc0(r31)
/* 00001D88 FC010040 */ fcmpo cr0, f1, f0
/* 00001D8C 41810020 */ bgt lbl_00001DAC
lbl_00001D90:
/* 00001D90 C81F1E28 */ lfd f0, 0x1e28(r31)
/* 00001D94 FC020040 */ fcmpo cr0, f2, f0
/* 00001D98 4080001C */ bge lbl_00001DB4
/* 00001D9C C023001C */ lfs f1, 0x1c(r3)
/* 00001DA0 C81F1DC0 */ lfd f0, 0x1dc0(r31)
/* 00001DA4 FC010040 */ fcmpo cr0, f1, f0
/* 00001DA8 4080000C */ bge lbl_00001DB4
lbl_00001DAC:
/* 00001DAC C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001DB0 D003001C */ stfs f0, 0x1c(r3)
lbl_00001DB4:
/* 00001DB4 48005765 */ bl lbl_00007518
/* 00001DB8 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00001DBC 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 00001DC0 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00001DC4 3CA00000 */ lis r5, controllerInfo@ha
/* 00001DC8 8884002E */ lbz r4, 0x2e(r4)
/* 00001DCC 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00001DD0 38A50000 */ addi r5, r5, controllerInfo@l
/* 00001DD4 7C830774 */ extsb r3, r4
/* 00001DD8 5463103A */ slwi r3, r3, 2
/* 00001DDC 7C601A14 */ add r3, r0, r3
/* 00001DE0 80030000 */ lwz r0, 0(r3)
/* 00001DE4 1C00003C */ mulli r0, r0, 0x3c
/* 00001DE8 7C650214 */ add r3, r5, r0
/* 00001DEC A0030018 */ lhz r0, 0x18(r3)
/* 00001DF0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001DF4 4182010C */ beq lbl_00001F00
/* 00001DF8 801E0000 */ lwz r0, 0(r30)
/* 00001DFC 3C600000 */ lis r3, lbl_00010D58@ha
/* 00001E00 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 00001E04 6C008000 */ xoris r0, r0, 0x8000
/* 00001E08 C81F1E10 */ lfd f0, 0x1e10(r31)
/* 00001E0C 9001000C */ stw r0, 0xc(r1)
/* 00001E10 3C004330 */ lis r0, 0x4330
/* 00001E14 90010008 */ stw r0, 8(r1)
/* 00001E18 C8210008 */ lfd f1, 8(r1)
/* 00001E1C FC211028 */ fsub f1, f1, f2
/* 00001E20 FC010040 */ fcmpo cr0, f1, f0
/* 00001E24 40810024 */ ble lbl_00001E48
/* 00001E28 3C600000 */ lis r3, modeCtrl@ha
/* 00001E2C 38630000 */ addi r3, r3, modeCtrl@l
/* 00001E30 80030024 */ lwz r0, 0x24(r3)
/* 00001E34 2C000002 */ cmpwi r0, 2
/* 00001E38 41800010 */ blt lbl_00001E48
/* 00001E3C 3C600001 */ lis r3, 1
/* 00001E40 3863D81E */ addi r3, r3, -10210  ;# fixed addi
/* 00001E44 4BFFE31D */ bl g_play_sound
lbl_00001E48:
/* 00001E48 3860011A */ li r3, 0x11a
/* 00001E4C 4BFFE315 */ bl g_play_sound
/* 00001E50 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00001E54 3BA30000 */ addi r29, r3, currentBallStructPtr@l
/* 00001E58 807D0000 */ lwz r3, 0(r29)
/* 00001E5C 38800000 */ li r4, 0
/* 00001E60 38A00000 */ li r5, 0
/* 00001E64 8863002E */ lbz r3, 0x2e(r3)
/* 00001E68 7C630774 */ extsb r3, r3
/* 00001E6C 4BFFE2F5 */ bl func_8002CA5C
/* 00001E70 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001E74 38000000 */ li r0, 0
/* 00001E78 807D0000 */ lwz r3, 0(r29)
/* 00001E7C 39200258 */ li r9, 0x258
/* 00001E80 3CC00000 */ lis r6, lbl_00014F20@ha
/* 00001E84 D003001C */ stfs f0, 0x1c(r3)
/* 00001E88 3C600000 */ lis r3, cameraInfo@ha
/* 00001E8C 38630000 */ addi r3, r3, cameraInfo@l
/* 00001E90 80FD0000 */ lwz r7, 0(r29)
/* 00001E94 39000008 */ li r8, 8
/* 00001E98 3CA00000 */ lis r5, lbl_00014F24@ha
/* 00001E9C B0070064 */ sth r0, 0x64(r7)
/* 00001EA0 38E60000 */ addi r7, r6, lbl_00014F20@l
/* 00001EA4 38C04125 */ li r6, 0x4125
/* 00001EA8 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001EAC 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00001EB0 38000003 */ li r0, 3
/* 00001EB4 D01E0160 */ stfs f0, 0x160(r30)
/* 00001EB8 39430284 */ addi r10, r3, 0x284
/* 00001EBC C01F1E30 */ lfs f0, 0x1e30(r31)
/* 00001EC0 D01E0164 */ stfs f0, 0x164(r30)
/* 00001EC4 913E0000 */ stw r9, 0(r30)
/* 00001EC8 91070000 */ stw r8, 0(r7)
/* 00001ECC 90C50000 */ stw r6, lbl_00014F24@l(r5)
/* 00001ED0 84A40000 */ lwzu r5, currentCameraStructPtr@l(r4)
/* 00001ED4 90640000 */ stw r3, 0(r4)
/* 00001ED8 9803001F */ stb r0, 0x1f(r3)
/* 00001EDC 91440000 */ stw r10, 0(r4)
/* 00001EE0 394A0284 */ addi r10, r10, 0x284
/* 00001EE4 980302A3 */ stb r0, 0x2a3(r3)
/* 00001EE8 91440000 */ stw r10, 0(r4)
/* 00001EEC 980A001F */ stb r0, 0x1f(r10)
/* 00001EF0 394A0284 */ addi r10, r10, 0x284
/* 00001EF4 91440000 */ stw r10, 0(r4)
/* 00001EF8 980A001F */ stb r0, 0x1f(r10)
/* 00001EFC 90A40000 */ stw r5, 0(r4)
lbl_00001F00:
/* 00001F00 80010024 */ lwz r0, 0x24(r1)
/* 00001F04 83E1001C */ lwz r31, 0x1c(r1)
/* 00001F08 83C10018 */ lwz r30, 0x18(r1)
/* 00001F0C 7C0803A6 */ mtlr r0
/* 00001F10 83A10014 */ lwz r29, 0x14(r1)
/* 00001F14 38210020 */ addi r1, r1, 0x20
/* 00001F18 4E800020 */ blr 
lbl_00001F1C:
/* 00001F1C 7C0802A6 */ mflr r0
/* 00001F20 3C600000 */ lis r3, lbl_10000000@ha
/* 00001F24 90010004 */ stw r0, 4(r1)
/* 00001F28 3C800000 */ lis r4, lbl_0000F020@ha
/* 00001F2C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00001F30 93E10014 */ stw r31, 0x14(r1)
/* 00001F34 93C10010 */ stw r30, 0x10(r1)
/* 00001F38 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 00001F3C 93A1000C */ stw r29, 0xc(r1)
/* 00001F40 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 00001F44 3C600000 */ lis r3, lbl_00014F20@ha
/* 00001F48 93810008 */ stw r28, 8(r1)
/* 00001F4C 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00001F50 801D0000 */ lwz r0, 0(r29)
/* 00001F54 2C00012C */ cmpwi r0, 0x12c
/* 00001F58 40820008 */ bne lbl_00001F60
/* 00001F5C 4800C5B5 */ bl lbl_0000E510
lbl_00001F60:
/* 00001F60 C01D0160 */ lfs f0, 0x160(r29)
/* 00001F64 C05D0164 */ lfs f2, 0x164(r29)
/* 00001F68 EC00102A */ fadds f0, f0, f2
/* 00001F6C D01D0160 */ stfs f0, 0x160(r29)
/* 00001F70 C03D0160 */ lfs f1, 0x160(r29)
/* 00001F74 C81E1D28 */ lfd f0, 0x1d28(r30)
/* 00001F78 FC010040 */ fcmpo cr0, f1, f0
/* 00001F7C 4C411382 */ cror 2, 1, 2
/* 00001F80 40820018 */ bne lbl_00001F98
/* 00001F84 C03E1C9C */ lfs f1, 0x1c9c(r30)
/* 00001F88 FC001050 */ fneg f0, f2
/* 00001F8C D03D0160 */ stfs f1, 0x160(r29)
/* 00001F90 D01D0164 */ stfs f0, 0x164(r29)
/* 00001F94 48000024 */ b lbl_00001FB8
lbl_00001F98:
/* 00001F98 C81E1DC0 */ lfd f0, 0x1dc0(r30)
/* 00001F9C FC010040 */ fcmpo cr0, f1, f0
/* 00001FA0 4C401382 */ cror 2, 0, 2
/* 00001FA4 40820014 */ bne lbl_00001FB8
/* 00001FA8 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00001FAC FC001050 */ fneg f0, f2
/* 00001FB0 D03D0160 */ stfs f1, 0x160(r29)
/* 00001FB4 D01D0164 */ stfs f0, 0x164(r29)
lbl_00001FB8:
/* 00001FB8 C03D0160 */ lfs f1, 0x160(r29)
/* 00001FBC C81E1DC0 */ lfd f0, 0x1dc0(r30)
/* 00001FC0 FC010040 */ fcmpo cr0, f1, f0
/* 00001FC4 4C401382 */ cror 2, 0, 2
/* 00001FC8 40820010 */ bne lbl_00001FD8
/* 00001FCC 3C600104 */ lis r3, 0x104
/* 00001FD0 3863009D */ addi r3, r3, 0x9d
/* 00001FD4 4BFFE18D */ bl g_play_sound
lbl_00001FD8:
/* 00001FD8 C03D0160 */ lfs f1, 0x160(r29)
/* 00001FDC C81E1D28 */ lfd f0, 0x1d28(r30)
/* 00001FE0 FC010040 */ fcmpo cr0, f1, f0
/* 00001FE4 4C411382 */ cror 2, 1, 2
/* 00001FE8 40820010 */ bne lbl_00001FF8
/* 00001FEC 3C6000FC */ lis r3, 0xfc
/* 00001FF0 3863009E */ addi r3, r3, 0x9e
/* 00001FF4 4BFFE16D */ bl g_play_sound
lbl_00001FF8:
/* 00001FF8 C83E1E38 */ lfd f1, 0x1e38(r30)
/* 00001FFC 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00002000 C01D0160 */ lfs f0, 0x160(r29)
/* 00002004 3CA00000 */ lis r5, controllerInfo@ha
/* 00002008 38A50000 */ addi r5, r5, controllerInfo@l
/* 0000200C FC210032 */ fmul f1, f1, f0
/* 00002010 C81E1D28 */ lfd f0, 0x1d28(r30)
/* 00002014 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00002018 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 0000201C 3B850018 */ addi r28, r5, 0x18
/* 00002020 FC010028 */ fsub f0, f1, f0
/* 00002024 FC000018 */ frsp f0, f0
/* 00002028 D01D0168 */ stfs f0, 0x168(r29)
/* 0000202C 80640000 */ lwz r3, currentBallStructPtr@l(r4)
/* 00002030 8863002E */ lbz r3, 0x2e(r3)
/* 00002034 7C630774 */ extsb r3, r3
/* 00002038 5463103A */ slwi r3, r3, 2
/* 0000203C 7C601A14 */ add r3, r0, r3
/* 00002040 80030000 */ lwz r0, 0(r3)
/* 00002044 1C00003C */ mulli r0, r0, 0x3c
/* 00002048 7C1C022E */ lhzx r0, r28, r0
/* 0000204C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002050 40820010 */ bne lbl_00002060
/* 00002054 801D0000 */ lwz r0, 0(r29)
/* 00002058 2C000000 */ cmpwi r0, 0
/* 0000205C 40800088 */ bge lbl_000020E4
lbl_00002060:
/* 00002060 3860006B */ li r3, 0x6b
/* 00002064 4BFFE0FD */ bl destroy_sprite_with_tag
/* 00002068 3860011A */ li r3, 0x11a
/* 0000206C 4BFFE0F5 */ bl g_play_sound
/* 00002070 C01E1C98 */ lfs f0, 0x1c98(r30)
/* 00002074 3C600000 */ lis r3, cameraInfo@ha
/* 00002078 38630000 */ addi r3, r3, cameraInfo@l
/* 0000207C D01D0160 */ stfs f0, 0x160(r29)
/* 00002080 38E0024C */ li r7, 0x24c
/* 00002084 38C00010 */ li r6, 0x10
/* 00002088 C01E1DFC */ lfs f0, 0x1dfc(r30)
/* 0000208C 38A04435 */ li r5, 0x4435
/* 00002090 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00002094 D01D0164 */ stfs f0, 0x164(r29)
/* 00002098 38000004 */ li r0, 4
/* 0000209C 39030284 */ addi r8, r3, 0x284
/* 000020A0 C01E1C98 */ lfs f0, 0x1c98(r30)
/* 000020A4 D01D016C */ stfs f0, 0x16c(r29)
/* 000020A8 90FD0000 */ stw r7, 0(r29)
/* 000020AC 90DF0000 */ stw r6, 0(r31)
/* 000020B0 90BF0004 */ stw r5, 4(r31)
/* 000020B4 84A40000 */ lwzu r5, currentCameraStructPtr@l(r4)
/* 000020B8 90640000 */ stw r3, 0(r4)
/* 000020BC 9803001F */ stb r0, 0x1f(r3)
/* 000020C0 91040000 */ stw r8, 0(r4)
/* 000020C4 39080284 */ addi r8, r8, 0x284
/* 000020C8 980302A3 */ stb r0, 0x2a3(r3)
/* 000020CC 91040000 */ stw r8, 0(r4)
/* 000020D0 9808001F */ stb r0, 0x1f(r8)
/* 000020D4 39080284 */ addi r8, r8, 0x284
/* 000020D8 91040000 */ stw r8, 0(r4)
/* 000020DC 9808001F */ stb r0, 0x1f(r8)
/* 000020E0 90A40000 */ stw r5, 0(r4)
lbl_000020E4:
/* 000020E4 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000020E8 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 000020EC 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000020F0 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000020F4 8864002E */ lbz r3, 0x2e(r4)
/* 000020F8 7C630774 */ extsb r3, r3
/* 000020FC 5463103A */ slwi r3, r3, 2
/* 00002100 7C601A14 */ add r3, r0, r3
/* 00002104 80030000 */ lwz r0, 0(r3)
/* 00002108 1C00003C */ mulli r0, r0, 0x3c
/* 0000210C 7C1C022E */ lhzx r0, r28, r0
/* 00002110 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002114 41820080 */ beq lbl_00002194
/* 00002118 3860006B */ li r3, 0x6b
/* 0000211C 4BFFE045 */ bl destroy_sprite_with_tag
/* 00002120 38600119 */ li r3, 0x119
/* 00002124 4BFFE03D */ bl g_play_sound
/* 00002128 C01E1C98 */ lfs f0, 0x1c98(r30)
/* 0000212C 3C600000 */ lis r3, cameraInfo@ha
/* 00002130 38E02710 */ li r7, 0x2710
/* 00002134 D01D0160 */ stfs f0, 0x160(r29)
/* 00002138 38C00004 */ li r6, 4
/* 0000213C 38A040A1 */ li r5, 0x40a1
/* 00002140 C01E1DFC */ lfs f0, 0x1dfc(r30)
/* 00002144 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00002148 38630000 */ addi r3, r3, cameraInfo@l
/* 0000214C D01D0164 */ stfs f0, 0x164(r29)
/* 00002150 38000002 */ li r0, 2
/* 00002154 90FD0000 */ stw r7, 0(r29)
/* 00002158 38E30284 */ addi r7, r3, 0x284
/* 0000215C 90DF0000 */ stw r6, 0(r31)
/* 00002160 90BF0004 */ stw r5, 4(r31)
/* 00002164 84A40000 */ lwzu r5, currentCameraStructPtr@l(r4)
/* 00002168 90640000 */ stw r3, 0(r4)
/* 0000216C 9803001F */ stb r0, 0x1f(r3)
/* 00002170 90E40000 */ stw r7, 0(r4)
/* 00002174 38E70284 */ addi r7, r7, 0x284
/* 00002178 980302A3 */ stb r0, 0x2a3(r3)
/* 0000217C 90E40000 */ stw r7, 0(r4)
/* 00002180 9807001F */ stb r0, 0x1f(r7)
/* 00002184 38E70284 */ addi r7, r7, 0x284
/* 00002188 90E40000 */ stw r7, 0(r4)
/* 0000218C 9807001F */ stb r0, 0x1f(r7)
/* 00002190 90A40000 */ stw r5, 0(r4)
lbl_00002194:
/* 00002194 8001001C */ lwz r0, 0x1c(r1)
/* 00002198 83E10014 */ lwz r31, 0x14(r1)
/* 0000219C 83C10010 */ lwz r30, 0x10(r1)
/* 000021A0 7C0803A6 */ mtlr r0
/* 000021A4 83A1000C */ lwz r29, 0xc(r1)
/* 000021A8 83810008 */ lwz r28, 8(r1)
/* 000021AC 38210018 */ addi r1, r1, 0x18
/* 000021B0 4E800020 */ blr 
lbl_000021B4:
/* 000021B4 7C0802A6 */ mflr r0
/* 000021B8 3C600000 */ lis r3, lbl_10000000@ha
/* 000021BC 90010004 */ stw r0, 4(r1)
/* 000021C0 3C800000 */ lis r4, lbl_0000F020@ha
/* 000021C4 9421FFB0 */ stwu r1, -0x50(r1)
/* 000021C8 93E1004C */ stw r31, 0x4c(r1)
/* 000021CC 93C10048 */ stw r30, 0x48(r1)
/* 000021D0 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 000021D4 93A10044 */ stw r29, 0x44(r1)
/* 000021D8 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 000021DC 3C600000 */ lis r3, lbl_00014F20@ha
/* 000021E0 93810040 */ stw r28, 0x40(r1)
/* 000021E4 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 000021E8 801D0000 */ lwz r0, 0(r29)
/* 000021EC 2C00012C */ cmpwi r0, 0x12c
/* 000021F0 40820008 */ bne lbl_000021F8
/* 000021F4 4800C31D */ bl lbl_0000E510
lbl_000021F8:
/* 000021F8 801D0000 */ lwz r0, 0(r29)
/* 000021FC 3C600000 */ lis r3, lbl_00010D58@ha
/* 00002200 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00002204 6C008000 */ xoris r0, r0, 0x8000
/* 00002208 C05E1E40 */ lfs f2, 0x1e40(r30)
/* 0000220C 9001003C */ stw r0, 0x3c(r1)
/* 00002210 3C004330 */ lis r0, 0x4330
/* 00002214 90010038 */ stw r0, 0x38(r1)
/* 00002218 C8010038 */ lfd f0, 0x38(r1)
/* 0000221C EC000828 */ fsubs f0, f0, f1
/* 00002220 EC020032 */ fmuls f0, f2, f0
/* 00002224 FC00001E */ fctiwz f0, f0
/* 00002228 D8010030 */ stfd f0, 0x30(r1)
/* 0000222C 80610034 */ lwz r3, 0x34(r1)
/* 00002230 4BFFDF31 */ bl mathutil_sin
/* 00002234 FC200A10 */ fabs f1, f1
/* 00002238 C81E1D28 */ lfd f0, 0x1d28(r30)
/* 0000223C FC000828 */ fsub f0, f0, f1
/* 00002240 FC000018 */ frsp f0, f0
/* 00002244 D01D016C */ stfs f0, 0x16c(r29)
/* 00002248 801F000C */ lwz r0, 0xc(r31)
/* 0000224C 2C00FFFF */ cmpwi r0, -1
/* 00002250 40820010 */ bne lbl_00002260
/* 00002254 3860011C */ li r3, 0x11c
/* 00002258 4BFFDF09 */ bl func_8002B610
/* 0000225C 907F000C */ stw r3, 0xc(r31)
lbl_00002260:
/* 00002260 801F000C */ lwz r0, 0xc(r31)
/* 00002264 2C00FFFF */ cmpwi r0, -1
/* 00002268 418200D4 */ beq lbl_0000233C
/* 0000226C C03E1E58 */ lfs f1, 0x1e58(r30)
/* 00002270 3CA00000 */ lis r5, lbl_00010D60@ha
/* 00002274 C01D016C */ lfs f0, 0x16c(r29)
/* 00002278 3C600000 */ lis r3, lbl_00010D60@ha
/* 0000227C 3C804330 */ lis r4, 0x4330
/* 00002280 EC010032 */ fmuls f0, f1, f0
/* 00002284 C8230000 */ lfd f1, lbl_00010D60@l(r3)
/* 00002288 5403043E */ clrlwi r3, r0, 0x10
/* 0000228C C8650000 */ lfd f3, lbl_00010D60@l(r5)
/* 00002290 C89E1E50 */ lfd f4, 0x1e50(r30)
/* 00002294 FC00001E */ fctiwz f0, f0
/* 00002298 C85E1E60 */ lfd f2, 0x1e60(r30)
/* 0000229C C8BE1E48 */ lfd f5, 0x1e48(r30)
/* 000022A0 D8010030 */ stfd f0, 0x30(r1)
/* 000022A4 80010034 */ lwz r0, 0x34(r1)
/* 000022A8 D8010020 */ stfd f0, 0x20(r1)
/* 000022AC 5400063E */ clrlwi r0, r0, 0x18
/* 000022B0 9001003C */ stw r0, 0x3c(r1)
/* 000022B4 80010024 */ lwz r0, 0x24(r1)
/* 000022B8 90810038 */ stw r4, 0x38(r1)
/* 000022BC 5400043E */ clrlwi r0, r0, 0x10
/* 000022C0 9001001C */ stw r0, 0x1c(r1)
/* 000022C4 C8010038 */ lfd f0, 0x38(r1)
/* 000022C8 90810018 */ stw r4, 0x18(r1)
/* 000022CC FC601828 */ fsub f3, f0, f3
/* 000022D0 C8010018 */ lfd f0, 0x18(r1)
/* 000022D4 FC000828 */ fsub f0, f0, f1
/* 000022D8 FC6400F2 */ fmul f3, f4, f3
/* 000022DC FC020032 */ fmul f0, f2, f0
/* 000022E0 FC25182A */ fadd f1, f5, f3
/* 000022E4 FC00001E */ fctiwz f0, f0
/* 000022E8 FC20081E */ fctiwz f1, f1
/* 000022EC D8010010 */ stfd f0, 0x10(r1)
/* 000022F0 D8210028 */ stfd f1, 0x28(r1)
/* 000022F4 83810014 */ lwz r28, 0x14(r1)
/* 000022F8 8081002C */ lwz r4, 0x2c(r1)
/* 000022FC 4BFFDE65 */ bl func_8002C100
/* 00002300 C03E1E68 */ lfs f1, 0x1e68(r30)
/* 00002304 38800040 */ li r4, 0x40
/* 00002308 C01D016C */ lfs f0, 0x16c(r29)
/* 0000230C 801F000C */ lwz r0, 0xc(r31)
/* 00002310 EC010032 */ fmuls f0, f1, f0
/* 00002314 5403043E */ clrlwi r3, r0, 0x10
/* 00002318 EC010028 */ fsubs f0, f1, f0
/* 0000231C FC00001E */ fctiwz f0, f0
/* 00002320 D8010008 */ stfd f0, 8(r1)
/* 00002324 80A1000C */ lwz r5, 0xc(r1)
/* 00002328 4BFFDE39 */ bl SoundPan
/* 0000232C 801F000C */ lwz r0, 0xc(r31)
/* 00002330 389C0000 */ addi r4, r28, 0
/* 00002334 5403043E */ clrlwi r3, r0, 0x10
/* 00002338 4BFFDE29 */ bl func_8002C3E0
lbl_0000233C:
/* 0000233C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002340 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 00002344 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00002348 3CA00000 */ lis r5, controllerInfo@ha
/* 0000234C 8884002E */ lbz r4, 0x2e(r4)
/* 00002350 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00002354 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002358 7C830774 */ extsb r3, r4
/* 0000235C 5463103A */ slwi r3, r3, 2
/* 00002360 7C601A14 */ add r3, r0, r3
/* 00002364 80030000 */ lwz r0, 0(r3)
/* 00002368 1C00003C */ mulli r0, r0, 0x3c
/* 0000236C 7C650214 */ add r3, r5, r0
/* 00002370 A0030018 */ lhz r0, 0x18(r3)
/* 00002374 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002378 40820010 */ bne lbl_00002388
/* 0000237C 801D0000 */ lwz r0, 0(r29)
/* 00002380 2C000000 */ cmpwi r0, 0
/* 00002384 408000B0 */ bge lbl_00002434
lbl_00002388:
/* 00002388 3860006B */ li r3, 0x6b
/* 0000238C 4BFFDDD5 */ bl destroy_sprite_with_tag
/* 00002390 801F000C */ lwz r0, 0xc(r31)
/* 00002394 2C00FFFF */ cmpwi r0, -1
/* 00002398 41820014 */ beq lbl_000023AC
/* 0000239C 5403043E */ clrlwi r3, r0, 0x10
/* 000023A0 4BFFDDC1 */ bl SoundOff
/* 000023A4 3800FFFF */ li r0, -1
/* 000023A8 901F000C */ stw r0, 0xc(r31)
lbl_000023AC:
/* 000023AC 3860011A */ li r3, 0x11a
/* 000023B0 4BFFDDB1 */ bl g_play_sound
/* 000023B4 C83E1D28 */ lfd f1, 0x1d28(r30)
/* 000023B8 3C600000 */ lis r3, cameraInfo@ha
/* 000023BC C01D016C */ lfs f0, 0x16c(r29)
/* 000023C0 38630000 */ addi r3, r3, cameraInfo@l
/* 000023C4 C85E1E70 */ lfd f2, 0x1e70(r30)
/* 000023C8 FC010028 */ fsub f0, f1, f0
/* 000023CC C83E1E48 */ lfd f1, 0x1e48(r30)
/* 000023D0 38C00020 */ li r6, 0x20
/* 000023D4 38A0423D */ li r5, 0x423d
/* 000023D8 FC010032 */ fmul f0, f1, f0
/* 000023DC 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 000023E0 38000004 */ li r0, 4
/* 000023E4 39030284 */ addi r8, r3, 0x284
/* 000023E8 FC02002A */ fadd f0, f2, f0
/* 000023EC FC00001E */ fctiwz f0, f0
/* 000023F0 D8010008 */ stfd f0, 8(r1)
/* 000023F4 80E1000C */ lwz r7, 0xc(r1)
/* 000023F8 90FD0000 */ stw r7, 0(r29)
/* 000023FC 90DF0000 */ stw r6, 0(r31)
/* 00002400 90BF0004 */ stw r5, 4(r31)
/* 00002404 84A40000 */ lwzu r5, currentCameraStructPtr@l(r4)
/* 00002408 90640000 */ stw r3, 0(r4)
/* 0000240C 9803001F */ stb r0, 0x1f(r3)
/* 00002410 91040000 */ stw r8, 0(r4)
/* 00002414 39080284 */ addi r8, r8, 0x284
/* 00002418 980302A3 */ stb r0, 0x2a3(r3)
/* 0000241C 91040000 */ stw r8, 0(r4)
/* 00002420 9808001F */ stb r0, 0x1f(r8)
/* 00002424 39080284 */ addi r8, r8, 0x284
/* 00002428 91040000 */ stw r8, 0(r4)
/* 0000242C 9808001F */ stb r0, 0x1f(r8)
/* 00002430 90A40000 */ stw r5, 0(r4)
lbl_00002434:
/* 00002434 80010054 */ lwz r0, 0x54(r1)
/* 00002438 83E1004C */ lwz r31, 0x4c(r1)
/* 0000243C 83C10048 */ lwz r30, 0x48(r1)
/* 00002440 7C0803A6 */ mtlr r0
/* 00002444 83A10044 */ lwz r29, 0x44(r1)
/* 00002448 83810040 */ lwz r28, 0x40(r1)
/* 0000244C 38210050 */ addi r1, r1, 0x50
/* 00002450 4E800020 */ blr 
lbl_00002454:
/* 00002454 7C0802A6 */ mflr r0
/* 00002458 3C600000 */ lis r3, currentBallStructPtr@ha
/* 0000245C 90010004 */ stw r0, 4(r1)
/* 00002460 3CA00000 */ lis r5, lbl_80206BD0@ha
/* 00002464 3C800000 */ lis r4, controllerInfo@ha
/* 00002468 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000246C DBE10038 */ stfd f31, 0x38(r1)
/* 00002470 93E10034 */ stw r31, 0x34(r1)
/* 00002474 93C10030 */ stw r30, 0x30(r1)
/* 00002478 93A1002C */ stw r29, 0x2c(r1)
/* 0000247C 93810028 */ stw r28, 0x28(r1)
/* 00002480 80C30000 */ lwz r6, currentBallStructPtr@l(r3)
/* 00002484 3C600000 */ lis r3, lbl_00010D58@ha
/* 00002488 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 0000248C 8806002E */ lbz r0, 0x2e(r6)
/* 00002490 7C000774 */ extsb r0, r0
/* 00002494 5403103A */ slwi r3, r0, 2
/* 00002498 38050000 */ addi r0, r5, lbl_80206BD0@l
/* 0000249C 7C601A14 */ add r3, r0, r3
/* 000024A0 80030000 */ lwz r0, 0(r3)
/* 000024A4 3C600000 */ lis r3, lbl_0000F020@ha
/* 000024A8 3BA30000 */ addi r29, r3, lbl_0000F020@l
/* 000024AC 1C60003C */ mulli r3, r0, 0x3c
/* 000024B0 C85D1E78 */ lfd f2, 0x1e78(r29)
/* 000024B4 38040000 */ addi r0, r4, controllerInfo@l
/* 000024B8 7C801A14 */ add r4, r0, r3
/* 000024BC 88640006 */ lbz r3, 6(r4)
/* 000024C0 3CA00000 */ lis r5, lbl_10000000@ha
/* 000024C4 88040007 */ lbz r0, 7(r4)
/* 000024C8 3B850000 */ addi r28, r5, lbl_10000000@l
/* 000024CC 3C800000 */ lis r4, lbl_00014F20@ha
/* 000024D0 7C030050 */ subf r0, r3, r0
/* 000024D4 C07C0170 */ lfs f3, 0x170(r28)
/* 000024D8 6C008000 */ xoris r0, r0, 0x8000
/* 000024DC 90010024 */ stw r0, 0x24(r1)
/* 000024E0 3C004330 */ lis r0, 0x4330
/* 000024E4 3BC40000 */ addi r30, r4, lbl_00014F20@l
/* 000024E8 90010020 */ stw r0, 0x20(r1)
/* 000024EC C8010020 */ lfd f0, 0x20(r1)
/* 000024F0 FC000828 */ fsub f0, f0, f1
/* 000024F4 FC020032 */ fmul f0, f2, f0
/* 000024F8 FC03002A */ fadd f0, f3, f0
/* 000024FC FC000018 */ frsp f0, f0
/* 00002500 D01C0170 */ stfs f0, 0x170(r28)
/* 00002504 C03C0170 */ lfs f1, 0x170(r28)
/* 00002508 C81D1D28 */ lfd f0, 0x1d28(r29)
/* 0000250C FC010040 */ fcmpo cr0, f1, f0
/* 00002510 4081000C */ ble lbl_0000251C
/* 00002514 C01D1C9C */ lfs f0, 0x1c9c(r29)
/* 00002518 D01C0170 */ stfs f0, 0x170(r28)
lbl_0000251C:
/* 0000251C C03C0170 */ lfs f1, 0x170(r28)
/* 00002520 C81D1E80 */ lfd f0, 0x1e80(r29)
/* 00002524 FC010040 */ fcmpo cr0, f1, f0
/* 00002528 4080000C */ bge lbl_00002534
/* 0000252C C01D1E88 */ lfs f0, 0x1e88(r29)
/* 00002530 D01C0170 */ stfs f0, 0x170(r28)
lbl_00002534:
/* 00002534 C83D1D28 */ lfd f1, 0x1d28(r29)
/* 00002538 3C600000 */ lis r3, currentBallStructPtr@ha
/* 0000253C C01C016C */ lfs f0, 0x16c(r28)
/* 00002540 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00002544 C85D1E48 */ lfd f2, 0x1e48(r29)
/* 00002548 FC010028 */ fsub f0, f1, f0
/* 0000254C C83D1E70 */ lfd f1, 0x1e70(r29)
/* 00002550 C87D1E90 */ lfd f3, 0x1e90(r29)
/* 00002554 3800FC18 */ li r0, -1000
/* 00002558 FC020032 */ fmul f0, f2, f0
/* 0000255C FC01002A */ fadd f0, f1, f0
/* 00002560 FC000018 */ frsp f0, f0
/* 00002564 FC030024 */ fdiv f0, f3, f0
/* 00002568 FC000018 */ frsp f0, f0
/* 0000256C D0060024 */ stfs f0, 0x24(r6)
/* 00002570 80630000 */ lwz r3, 0(r3)
/* 00002574 B0030060 */ sth r0, 0x60(r3)
/* 00002578 48004FA1 */ bl lbl_00007518
/* 0000257C 807C0000 */ lwz r3, 0(r28)
/* 00002580 2C03000C */ cmpwi r3, 0xc
/* 00002584 40800010 */ bge lbl_00002594
/* 00002588 801E0004 */ lwz r0, 4(r30)
/* 0000258C 540004A0 */ rlwinm r0, r0, 0, 0x12, 0x10
/* 00002590 901E0004 */ stw r0, 4(r30)
lbl_00002594:
/* 00002594 2C030000 */ cmpwi r3, 0
/* 00002598 408001F4 */ bge lbl_0000278C
/* 0000259C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000025A0 3BE30000 */ addi r31, r3, currentBallStructPtr@l
/* 000025A4 807F0000 */ lwz r3, 0(r31)
/* 000025A8 38800000 */ li r4, 0
/* 000025AC 38A00000 */ li r5, 0
/* 000025B0 8863002E */ lbz r3, 0x2e(r3)
/* 000025B4 7C630774 */ extsb r3, r3
/* 000025B8 4BFFDBA9 */ bl func_8002CA5C
/* 000025BC C87D1E98 */ lfd f3, 0x1e98(r29)
/* 000025C0 C83D1EA0 */ lfd f1, 0x1ea0(r29)
/* 000025C4 C09C016C */ lfs f4, 0x16c(r28)
/* 000025C8 C01D1C98 */ lfs f0, 0x1c98(r29)
/* 000025CC FC410132 */ fmul f2, f1, f4
/* 000025D0 D0010008 */ stfs f0, 8(r1)
/* 000025D4 C81D1EB0 */ lfd f0, 0x1eb0(r29)
/* 000025D8 C83D1EA8 */ lfd f1, 0x1ea8(r29)
/* 000025DC FC63102A */ fadd f3, f3, f2
/* 000025E0 FC000132 */ fmul f0, f0, f4
/* 000025E4 807F0000 */ lwz r3, 0(r31)
/* 000025E8 C043006C */ lfs f2, 0x6c(r3)
/* 000025EC FFE01818 */ frsp f31, f3
/* 000025F0 FC21002A */ fadd f1, f1, f0
/* 000025F4 FC00F850 */ fneg f0, f31
/* 000025F8 FC220072 */ fmul f1, f2, f1
/* 000025FC FC200818 */ frsp f1, f1
/* 00002600 D021000C */ stfs f1, 0xc(r1)
/* 00002604 D0010010 */ stfs f0, 0x10(r1)
/* 00002608 C03D1D08 */ lfs f1, 0x1d08(r29)
/* 0000260C C01C0168 */ lfs f0, 0x168(r28)
/* 00002610 EC010032 */ fmuls f0, f1, f0
/* 00002614 FC00001E */ fctiwz f0, f0
/* 00002618 D8010020 */ stfd f0, 0x20(r1)
/* 0000261C 80610024 */ lwz r3, 0x24(r1)
/* 00002620 4BFFDB41 */ bl mathutil_mtxA_from_rotate_y
/* 00002624 38610008 */ addi r3, r1, 8
/* 00002628 38830000 */ addi r4, r3, 0
/* 0000262C 4BFFDB35 */ bl mathutil_mtxA_tf_point
/* 00002630 C01D1EB8 */ lfs f0, 0x1eb8(r29)
/* 00002634 3C600000 */ lis r3, spritePoolInfo@ha
/* 00002638 38630000 */ addi r3, r3, spritePoolInfo@l
/* 0000263C C83D1EB0 */ lfd f1, 0x1eb0(r29)
/* 00002640 EC0007F2 */ fmuls f0, f0, f31
/* 00002644 3C800000 */ lis r4, ballInfo@ha
/* 00002648 801F0000 */ lwz r0, 0(r31)
/* 0000264C 80A3000C */ lwz r5, 0xc(r3)
/* 00002650 38840000 */ addi r4, r4, ballInfo@l
/* 00002654 FC010032 */ fmul f0, f1, f0
/* 00002658 38C00000 */ li r6, 0
/* 0000265C FC00001E */ fctiwz f0, f0
/* 00002660 480000BC */ b lbl_0000271C
lbl_00002664:
/* 00002664 88E50000 */ lbz r7, 0(r5)
/* 00002668 2C070002 */ cmpwi r7, 2
/* 0000266C 408200A4 */ bne lbl_00002710
/* 00002670 909F0000 */ stw r4, 0(r31)
/* 00002674 38E00019 */ li r7, 0x19
/* 00002678 39000001 */ li r8, 1
/* 0000267C 98E40003 */ stb r7, 3(r4)
/* 00002680 39400000 */ li r10, 0
/* 00002684 80FF0000 */ lwz r7, 0(r31)
/* 00002688 D8010018 */ stfd f0, 0x18(r1)
/* 0000268C 99070148 */ stb r8, 0x148(r7)
/* 00002690 8101001C */ lwz r8, 0x1c(r1)
/* 00002694 C03D1C98 */ lfs f1, 0x1c98(r29)
/* 00002698 80FF0000 */ lwz r7, 0(r31)
/* 0000269C D0270008 */ stfs f1, 8(r7)
/* 000026A0 C03D1D00 */ lfs f1, 0x1d00(r29)
/* 000026A4 80FF0000 */ lwz r7, 0(r31)
/* 000026A8 D027000C */ stfs f1, 0xc(r7)
/* 000026AC 817F0000 */ lwz r11, 0(r31)
/* 000026B0 81210008 */ lwz r9, 8(r1)
/* 000026B4 80E1000C */ lwz r7, 0xc(r1)
/* 000026B8 912B001C */ stw r9, 0x1c(r11)
/* 000026BC 90EB0020 */ stw r7, 0x20(r11)
/* 000026C0 80E10010 */ lwz r7, 0x10(r1)
/* 000026C4 90EB0024 */ stw r7, 0x24(r11)
/* 000026C8 80FF0000 */ lwz r7, 0(r31)
/* 000026CC B1470028 */ sth r10, 0x28(r7)
/* 000026D0 C05D1EBC */ lfs f2, 0x1ebc(r29)
/* 000026D4 C03C0170 */ lfs f1, 0x170(r28)
/* 000026D8 80FF0000 */ lwz r7, 0(r31)
/* 000026DC EC220072 */ fmuls f1, f2, f1
/* 000026E0 FC20081E */ fctiwz f1, f1
/* 000026E4 D8210020 */ stfd f1, 0x20(r1)
/* 000026E8 81210024 */ lwz r9, 0x24(r1)
/* 000026EC B127002A */ sth r9, 0x2a(r7)
/* 000026F0 80FF0000 */ lwz r7, 0(r31)
/* 000026F4 B147002C */ sth r10, 0x2c(r7)
/* 000026F8 80FF0000 */ lwz r7, 0(r31)
/* 000026FC B1070060 */ sth r8, 0x60(r7)
/* 00002700 80FF0000 */ lwz r7, 0(r31)
/* 00002704 B1470062 */ sth r10, 0x62(r7)
/* 00002708 80FF0000 */ lwz r7, 0(r31)
/* 0000270C B1470064 */ sth r10, 0x64(r7)
lbl_00002710:
/* 00002710 38C60001 */ addi r6, r6, 1
/* 00002714 388401A4 */ addi r4, r4, 0x1a4
/* 00002718 38A50001 */ addi r5, r5, 1
lbl_0000271C:
/* 0000271C 80E30008 */ lwz r7, 8(r3)
/* 00002720 7C063800 */ cmpw r6, r7
/* 00002724 4180FF40 */ blt lbl_00002664
/* 00002728 3C600000 */ lis r3, currentBallStructPtr@ha
/* 0000272C 90030000 */ stw r0, currentBallStructPtr@l(r3)
/* 00002730 38000384 */ li r0, 0x384
/* 00002734 3C600000 */ lis r3, cameraInfo@ha
/* 00002738 901C0000 */ stw r0, 0(r28)
/* 0000273C 38000040 */ li r0, 0x40
/* 00002740 38630000 */ addi r3, r3, cameraInfo@l
/* 00002744 901E0000 */ stw r0, 0(r30)
/* 00002748 38000079 */ li r0, 0x79
/* 0000274C 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00002750 901E0004 */ stw r0, 4(r30)
/* 00002754 38000001 */ li r0, 1
/* 00002758 38A30284 */ addi r5, r3, 0x284
/* 0000275C 84C40000 */ lwzu r6, currentCameraStructPtr@l(r4)
/* 00002760 90640000 */ stw r3, 0(r4)
/* 00002764 9803001F */ stb r0, 0x1f(r3)
/* 00002768 90A40000 */ stw r5, 0(r4)
/* 0000276C 38A50284 */ addi r5, r5, 0x284
/* 00002770 980302A3 */ stb r0, 0x2a3(r3)
/* 00002774 90A40000 */ stw r5, 0(r4)
/* 00002778 9805001F */ stb r0, 0x1f(r5)
/* 0000277C 38A50284 */ addi r5, r5, 0x284
/* 00002780 90A40000 */ stw r5, 0(r4)
/* 00002784 9805001F */ stb r0, 0x1f(r5)
/* 00002788 90C40000 */ stw r6, 0(r4)
lbl_0000278C:
/* 0000278C 80010044 */ lwz r0, 0x44(r1)
/* 00002790 CBE10038 */ lfd f31, 0x38(r1)
/* 00002794 83E10034 */ lwz r31, 0x34(r1)
/* 00002798 7C0803A6 */ mtlr r0
/* 0000279C 83C10030 */ lwz r30, 0x30(r1)
/* 000027A0 83A1002C */ lwz r29, 0x2c(r1)
/* 000027A4 83810028 */ lwz r28, 0x28(r1)
/* 000027A8 38210040 */ addi r1, r1, 0x40
/* 000027AC 4E800020 */ blr 
lbl_000027B0:
/* 000027B0 7C0802A6 */ mflr r0
/* 000027B4 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000027B8 90010004 */ stw r0, 4(r1)
/* 000027BC 3CA00000 */ lis r5, lbl_10000000@ha
/* 000027C0 9421FFF0 */ stwu r1, -0x10(r1)
/* 000027C4 93E1000C */ stw r31, 0xc(r1)
/* 000027C8 3BE50000 */ addi r31, r5, lbl_10000000@l
/* 000027CC 93C10008 */ stw r30, 8(r1)
/* 000027D0 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 000027D4 3C600000 */ lis r3, lbl_00010EE0@ha
/* 000027D8 C8030000 */ lfd f0, lbl_00010EE0@l(r3)
/* 000027DC C024000C */ lfs f1, 0xc(r4)
/* 000027E0 FC010040 */ fcmpo cr0, f1, f0
/* 000027E4 40800028 */ bge lbl_0000280C
/* 000027E8 881F0140 */ lbz r0, 0x140(r31)
/* 000027EC 7C000775 */ extsb. r0, r0
/* 000027F0 4181001C */ bgt lbl_0000280C
/* 000027F4 38600001 */ li r3, 1
/* 000027F8 4800516D */ bl lbl_00007964
/* 000027FC 38600001 */ li r3, 1
/* 00002800 48008C61 */ bl lbl_0000B460
/* 00002804 38000001 */ li r0, 1
/* 00002808 981F0140 */ stb r0, 0x140(r31)
lbl_0000280C:
/* 0000280C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002810 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00002814 80630000 */ lwz r3, 0(r3)
/* 00002818 80030094 */ lwz r0, 0x94(r3)
/* 0000281C 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00002820 40820010 */ bne lbl_00002830
/* 00002824 4BFFD93D */ bl func_800246F4
/* 00002828 2C030000 */ cmpwi r3, 0
/* 0000282C 40820020 */ bne lbl_0000284C
lbl_00002830:
/* 00002830 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002834 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 00002838 3C600000 */ lis r3, lbl_00010EE8@ha
/* 0000283C C8030000 */ lfd f0, lbl_00010EE8@l(r3)
/* 00002840 C0240008 */ lfs f1, 8(r4)
/* 00002844 FC010040 */ fcmpo cr0, f1, f0
/* 00002848 40800010 */ bge lbl_00002858
lbl_0000284C:
/* 0000284C 48008AF9 */ bl lbl_0000B344
/* 00002850 2C030000 */ cmpwi r3, 0
/* 00002854 40820010 */ bne lbl_00002864
lbl_00002858:
/* 00002858 801F0000 */ lwz r0, 0(r31)
/* 0000285C 2C000000 */ cmpwi r0, 0
/* 00002860 40800130 */ bge lbl_00002990
lbl_00002864:
/* 00002864 3C600000 */ lis r3, modeCtrl@ha
/* 00002868 38630000 */ addi r3, r3, modeCtrl@l
/* 0000286C 8003002C */ lwz r0, 0x2c(r3)
/* 00002870 1C00004C */ mulli r0, r0, 0x4c
/* 00002874 7FDF0214 */ add r30, r31, r0
/* 00002878 3BDE000C */ addi r30, r30, 0xc
/* 0000287C 387E0000 */ addi r3, r30, 0
/* 00002880 48002579 */ bl lbl_00004DF8
/* 00002884 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00002888 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 0000288C 2C000000 */ cmpwi r0, 0
/* 00002890 408200B0 */ bne lbl_00002940
/* 00002894 881E0008 */ lbz r0, 8(r30)
/* 00002898 7C000774 */ extsb r0, r0
/* 0000289C 7C7E0214 */ add r3, r30, r0
/* 000028A0 88630035 */ lbz r3, 0x35(r3)
/* 000028A4 2C030002 */ cmpwi r3, 2
/* 000028A8 40820044 */ bne lbl_000028EC
/* 000028AC 881F0140 */ lbz r0, 0x140(r31)
/* 000028B0 7C000775 */ extsb. r0, r0
/* 000028B4 40810038 */ ble lbl_000028EC
/* 000028B8 38000002 */ li r0, 2
/* 000028BC 981F0140 */ stb r0, 0x140(r31)
/* 000028C0 38000000 */ li r0, 0
/* 000028C4 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000028C8 981F013F */ stb r0, 0x13f(r31)
/* 000028CC 38830000 */ addi r4, r3, currentBallStructPtr@l
/* 000028D0 38600000 */ li r3, 0
/* 000028D4 80840000 */ lwz r4, 0(r4)
/* 000028D8 4800508D */ bl lbl_00007964
/* 000028DC 38600000 */ li r3, 0
/* 000028E0 48008B81 */ bl lbl_0000B460
/* 000028E4 4800219D */ bl lbl_00004A80
/* 000028E8 480000A8 */ b lbl_00002990
lbl_000028EC:
/* 000028EC 7C600774 */ extsb r0, r3
/* 000028F0 2C000003 */ cmpwi r0, 3
/* 000028F4 40820044 */ bne lbl_00002938
/* 000028F8 881F0140 */ lbz r0, 0x140(r31)
/* 000028FC 7C000775 */ extsb. r0, r0
/* 00002900 40810038 */ ble lbl_00002938
/* 00002904 38000001 */ li r0, 1
/* 00002908 981F0140 */ stb r0, 0x140(r31)
/* 0000290C 38000000 */ li r0, 0
/* 00002910 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002914 981F013F */ stb r0, 0x13f(r31)
/* 00002918 38830000 */ addi r4, r3, currentBallStructPtr@l
/* 0000291C 38600000 */ li r3, 0
/* 00002920 80840000 */ lwz r4, 0(r4)
/* 00002924 48005041 */ bl lbl_00007964
/* 00002928 38600000 */ li r3, 0
/* 0000292C 48008B35 */ bl lbl_0000B460
/* 00002930 48002151 */ bl lbl_00004A80
/* 00002934 4800005C */ b lbl_00002990
lbl_00002938:
/* 00002938 48000071 */ bl lbl_000029A8
/* 0000293C 48000054 */ b lbl_00002990
lbl_00002940:
/* 00002940 A01F013C */ lhz r0, 0x13c(r31)
/* 00002944 28000000 */ cmplwi r0, 0
/* 00002948 40820044 */ bne lbl_0000298C
/* 0000294C 881F0140 */ lbz r0, 0x140(r31)
/* 00002950 7C000775 */ extsb. r0, r0
/* 00002954 40810038 */ ble lbl_0000298C
/* 00002958 38000002 */ li r0, 2
/* 0000295C 981F0140 */ stb r0, 0x140(r31)
/* 00002960 38000000 */ li r0, 0
/* 00002964 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002968 981F013F */ stb r0, 0x13f(r31)
/* 0000296C 38830000 */ addi r4, r3, currentBallStructPtr@l
/* 00002970 38600000 */ li r3, 0
/* 00002974 80840000 */ lwz r4, 0(r4)
/* 00002978 48004FED */ bl lbl_00007964
/* 0000297C 38600000 */ li r3, 0
/* 00002980 48008AE1 */ bl lbl_0000B460
/* 00002984 480020FD */ bl lbl_00004A80
/* 00002988 48000008 */ b lbl_00002990
lbl_0000298C:
/* 0000298C 48001A85 */ bl lbl_00004410
lbl_00002990:
/* 00002990 80010014 */ lwz r0, 0x14(r1)
/* 00002994 83E1000C */ lwz r31, 0xc(r1)
/* 00002998 83C10008 */ lwz r30, 8(r1)
/* 0000299C 7C0803A6 */ mtlr r0
/* 000029A0 38210010 */ addi r1, r1, 0x10
/* 000029A4 4E800020 */ blr 
lbl_000029A8:
/* 000029A8 7C0802A6 */ mflr r0
/* 000029AC 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000029B0 90010004 */ stw r0, 4(r1)
/* 000029B4 3C800000 */ lis r4, modeCtrl@ha
/* 000029B8 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 000029BC 9421FF80 */ stwu r1, -0x80(r1)
/* 000029C0 38840000 */ addi r4, r4, modeCtrl@l
/* 000029C4 3CC00000 */ lis r6, lbl_10000000@ha
/* 000029C8 93E1007C */ stw r31, 0x7c(r1)
/* 000029CC 3CA00000 */ lis r5, lbl_00014F20@ha
/* 000029D0 3BE50000 */ addi r31, r5, lbl_00014F20@l
/* 000029D4 93C10078 */ stw r30, 0x78(r1)
/* 000029D8 3BC60000 */ addi r30, r6, lbl_10000000@l
/* 000029DC 93A10074 */ stw r29, 0x74(r1)
/* 000029E0 80630000 */ lwz r3, 0(r3)
/* 000029E4 8084002C */ lwz r4, 0x2c(r4)
/* 000029E8 80030094 */ lwz r0, 0x94(r3)
/* 000029EC 1C64004C */ mulli r3, r4, 0x4c
/* 000029F0 7FBE1A14 */ add r29, r30, r3
/* 000029F4 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 000029F8 3BBD000C */ addi r29, r29, 0xc
/* 000029FC 4082005C */ bne lbl_00002A58
/* 00002A00 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00002A04 38A30000 */ addi r5, r3, currentCameraStructPtr@l
/* 00002A08 3C600000 */ lis r3, cameraInfo@ha
/* 00002A0C 80E50000 */ lwz r7, 0(r5)
/* 00002A10 38630000 */ addi r3, r3, cameraInfo@l
/* 00002A14 90650000 */ stw r3, 0(r5)
/* 00002A18 38000005 */ li r0, 5
/* 00002A1C 38C30284 */ addi r6, r3, 0x284
/* 00002A20 9803001F */ stb r0, 0x1f(r3)
/* 00002A24 389F0310 */ addi r4, r31, 0x310
/* 00002A28 38600078 */ li r3, 0x78
/* 00002A2C 90C50000 */ stw r6, 0(r5)
/* 00002A30 9806001F */ stb r0, 0x1f(r6)
/* 00002A34 38C60284 */ addi r6, r6, 0x284
/* 00002A38 90C50000 */ stw r6, 0(r5)
/* 00002A3C 9806001F */ stb r0, 0x1f(r6)
/* 00002A40 38C60284 */ addi r6, r6, 0x284
/* 00002A44 90C50000 */ stw r6, 0(r5)
/* 00002A48 9806001F */ stb r0, 0x1f(r6)
/* 00002A4C 90E50000 */ stw r7, 0(r5)
/* 00002A50 4800B2FD */ bl lbl_0000DD4C
/* 00002A54 4800031C */ b lbl_00002D70
lbl_00002A58:
/* 00002A58 889D0008 */ lbz r4, 8(r29)
/* 00002A5C 7C840774 */ extsb r4, r4
/* 00002A60 7C7D2214 */ add r3, r29, r4
/* 00002A64 88030035 */ lbz r0, 0x35(r3)
/* 00002A68 7C000774 */ extsb r0, r0
/* 00002A6C 2C000003 */ cmpwi r0, 3
/* 00002A70 418201D4 */ beq lbl_00002C44
/* 00002A74 40800014 */ bge lbl_00002A88
/* 00002A78 2C000001 */ cmpwi r0, 1
/* 00002A7C 418201F0 */ beq lbl_00002C6C
/* 00002A80 40800014 */ bge lbl_00002A94
/* 00002A84 48000210 */ b lbl_00002C94
lbl_00002A88:
/* 00002A88 2C000005 */ cmpwi r0, 5
/* 00002A8C 40800208 */ bge lbl_00002C94
/* 00002A90 480001DC */ b lbl_00002C6C
lbl_00002A94:
/* 00002A94 3C600000 */ lis r3, lbl_00010EF0@ha
/* 00002A98 38C30000 */ addi r6, r3, lbl_00010EF0@l
/* 00002A9C 80A60000 */ lwz r5, 0(r6)
/* 00002AA0 3C600000 */ lis r3, lbl_00010F24@ha
/* 00002AA4 80060004 */ lwz r0, 4(r6)
/* 00002AA8 38830000 */ addi r4, r3, lbl_00010F24@l
/* 00002AAC 90A1003C */ stw r5, 0x3c(r1)
/* 00002AB0 90010040 */ stw r0, 0x40(r1)
/* 00002AB4 80660008 */ lwz r3, 8(r6)
/* 00002AB8 8006000C */ lwz r0, 0xc(r6)
/* 00002ABC 90610044 */ stw r3, 0x44(r1)
/* 00002AC0 90010048 */ stw r0, 0x48(r1)
/* 00002AC4 80660010 */ lwz r3, 0x10(r6)
/* 00002AC8 80060014 */ lwz r0, 0x14(r6)
/* 00002ACC 9061004C */ stw r3, 0x4c(r1)
/* 00002AD0 90010050 */ stw r0, 0x50(r1)
/* 00002AD4 80660018 */ lwz r3, 0x18(r6)
/* 00002AD8 8006001C */ lwz r0, 0x1c(r6)
/* 00002ADC 90610054 */ stw r3, 0x54(r1)
/* 00002AE0 90010058 */ stw r0, 0x58(r1)
/* 00002AE4 80660020 */ lwz r3, 0x20(r6)
/* 00002AE8 80060024 */ lwz r0, 0x24(r6)
/* 00002AEC 9061005C */ stw r3, 0x5c(r1)
/* 00002AF0 90010060 */ stw r0, 0x60(r1)
/* 00002AF4 80660028 */ lwz r3, 0x28(r6)
/* 00002AF8 8006002C */ lwz r0, 0x2c(r6)
/* 00002AFC 90610064 */ stw r3, 0x64(r1)
/* 00002B00 90010068 */ stw r0, 0x68(r1)
/* 00002B04 80060030 */ lwz r0, 0x30(r6)
/* 00002B08 9001006C */ stw r0, 0x6c(r1)
/* 00002B0C 80640000 */ lwz r3, 0(r4)
/* 00002B10 80040004 */ lwz r0, 4(r4)
/* 00002B14 90610008 */ stw r3, 8(r1)
/* 00002B18 9001000C */ stw r0, 0xc(r1)
/* 00002B1C 80640008 */ lwz r3, 8(r4)
/* 00002B20 8004000C */ lwz r0, 0xc(r4)
/* 00002B24 90610010 */ stw r3, 0x10(r1)
/* 00002B28 90010014 */ stw r0, 0x14(r1)
/* 00002B2C 80640010 */ lwz r3, 0x10(r4)
/* 00002B30 80040014 */ lwz r0, 0x14(r4)
/* 00002B34 90610018 */ stw r3, 0x18(r1)
/* 00002B38 9001001C */ stw r0, 0x1c(r1)
/* 00002B3C 80640018 */ lwz r3, 0x18(r4)
/* 00002B40 8004001C */ lwz r0, 0x1c(r4)
/* 00002B44 90610020 */ stw r3, 0x20(r1)
/* 00002B48 90010024 */ stw r0, 0x24(r1)
/* 00002B4C 80640020 */ lwz r3, 0x20(r4)
/* 00002B50 80040024 */ lwz r0, 0x24(r4)
/* 00002B54 90610028 */ stw r3, 0x28(r1)
/* 00002B58 9001002C */ stw r0, 0x2c(r1)
/* 00002B5C 80640028 */ lwz r3, 0x28(r4)
/* 00002B60 8004002C */ lwz r0, 0x2c(r4)
/* 00002B64 90610030 */ stw r3, 0x30(r1)
/* 00002B68 90010034 */ stw r0, 0x34(r1)
/* 00002B6C 80040030 */ lwz r0, 0x30(r4)
/* 00002B70 90010038 */ stw r0, 0x38(r1)
/* 00002B74 881D0006 */ lbz r0, 6(r29)
/* 00002B78 2C00000A */ cmpwi r0, 0xa
/* 00002B7C 40820040 */ bne lbl_00002BBC
/* 00002B80 881D0007 */ lbz r0, 7(r29)
/* 00002B84 2C000003 */ cmpwi r0, 3
/* 00002B88 40820034 */ bne lbl_00002BBC
/* 00002B8C 881D0009 */ lbz r0, 9(r29)
/* 00002B90 7C000774 */ extsb r0, r0
/* 00002B94 2C00000C */ cmpwi r0, 0xc
/* 00002B98 40800024 */ bge lbl_00002BBC
/* 00002B9C 2C000003 */ cmpwi r0, 3
/* 00002BA0 4180001C */ blt lbl_00002BBC
/* 00002BA4 386000B4 */ li r3, 0xb4
/* 00002BA8 389F031C */ addi r4, r31, 0x31c
/* 00002BAC 4800AF49 */ bl lbl_0000DAF4
/* 00002BB0 386001CA */ li r3, 0x1ca
/* 00002BB4 4BFFD5AD */ bl g_play_sound
/* 00002BB8 48000038 */ b lbl_00002BF0
lbl_00002BBC:
/* 00002BBC 881D0009 */ lbz r0, 9(r29)
/* 00002BC0 3881003C */ addi r4, r1, 0x3c
/* 00002BC4 386000B4 */ li r3, 0xb4
/* 00002BC8 7C000774 */ extsb r0, r0
/* 00002BCC 5400103A */ slwi r0, r0, 2
/* 00002BD0 7C84002E */ lwzx r4, r4, r0
/* 00002BD4 4800AF21 */ bl lbl_0000DAF4
/* 00002BD8 881D0009 */ lbz r0, 9(r29)
/* 00002BDC 38610008 */ addi r3, r1, 8
/* 00002BE0 7C000774 */ extsb r0, r0
/* 00002BE4 5400103A */ slwi r0, r0, 2
/* 00002BE8 7C63002E */ lwzx r3, r3, r0
/* 00002BEC 4BFFD575 */ bl g_play_sound
lbl_00002BF0:
/* 00002BF0 881D0009 */ lbz r0, 9(r29)
/* 00002BF4 7C000774 */ extsb r0, r0
/* 00002BF8 2C000003 */ cmpwi r0, 3
/* 00002BFC 40800018 */ bge lbl_00002C14
/* 00002C00 386000A3 */ li r3, 0xa3
/* 00002C04 388000A4 */ li r4, 0xa4
/* 00002C08 38A0014A */ li r5, 0x14a
/* 00002C0C 48004A45 */ bl lbl_00007650
/* 00002C10 480000A8 */ b lbl_00002CB8
lbl_00002C14:
/* 00002C14 2C00000C */ cmpwi r0, 0xc
/* 00002C18 40800018 */ bge lbl_00002C30
/* 00002C1C 386000A9 */ li r3, 0xa9
/* 00002C20 388000AA */ li r4, 0xaa
/* 00002C24 38A0012C */ li r5, 0x12c
/* 00002C28 48004A29 */ bl lbl_00007650
/* 00002C2C 4800008C */ b lbl_00002CB8
lbl_00002C30:
/* 00002C30 386000A7 */ li r3, 0xa7
/* 00002C34 388000A8 */ li r4, 0xa8
/* 00002C38 38A001FE */ li r5, 0x1fe
/* 00002C3C 48004A15 */ bl lbl_00007650
/* 00002C40 48000078 */ b lbl_00002CB8
lbl_00002C44:
/* 00002C44 386000B4 */ li r3, 0xb4
/* 00002C48 389F0328 */ addi r4, r31, 0x328
/* 00002C4C 4800AEA9 */ bl lbl_0000DAF4
/* 00002C50 386001CB */ li r3, 0x1cb
/* 00002C54 4BFFD50D */ bl g_play_sound
/* 00002C58 386000A1 */ li r3, 0xa1
/* 00002C5C 388000A2 */ li r4, 0xa2
/* 00002C60 38A000F0 */ li r5, 0xf0
/* 00002C64 480049ED */ bl lbl_00007650
/* 00002C68 48000050 */ b lbl_00002CB8
lbl_00002C6C:
/* 00002C6C 7C7D2214 */ add r3, r29, r4
/* 00002C70 88830020 */ lbz r4, 0x20(r3)
/* 00002C74 386000B4 */ li r3, 0xb4
/* 00002C78 7C840774 */ extsb r4, r4
/* 00002C7C 4800B329 */ bl lbl_0000DFA4
/* 00002C80 386000A5 */ li r3, 0xa5
/* 00002C84 388000A6 */ li r4, 0xa6
/* 00002C88 38A000D2 */ li r5, 0xd2
/* 00002C8C 480049C5 */ bl lbl_00007650
/* 00002C90 48000028 */ b lbl_00002CB8
lbl_00002C94:
/* 00002C94 386000B4 */ li r3, 0xb4
/* 00002C98 389F0330 */ addi r4, r31, 0x330
/* 00002C9C 4800B0B1 */ bl lbl_0000DD4C
/* 00002CA0 386001C9 */ li r3, 0x1c9
/* 00002CA4 4BFFD4BD */ bl g_play_sound
/* 00002CA8 3860009F */ li r3, 0x9f
/* 00002CAC 388000A0 */ li r4, 0xa0
/* 00002CB0 38A000B4 */ li r5, 0xb4
/* 00002CB4 4800499D */ bl lbl_00007650
lbl_00002CB8:
/* 00002CB8 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00002CBC 3C600000 */ lis r3, spritePoolInfo@ha
/* 00002CC0 38A40000 */ addi r5, r4, currentBallStructPtr@l
/* 00002CC4 38830000 */ addi r4, r3, spritePoolInfo@l
/* 00002CC8 80E50000 */ lwz r7, 0(r5)
/* 00002CCC 3C600000 */ lis r3, ballInfo@ha
/* 00002CD0 8104000C */ lwz r8, 0xc(r4)
/* 00002CD4 38030000 */ addi r0, r3, ballInfo@l
/* 00002CD8 7C060378 */ mr r6, r0
/* 00002CDC 39200000 */ li r9, 0
/* 00002CE0 38600003 */ li r3, 3
/* 00002CE4 48000024 */ b lbl_00002D08
lbl_00002CE8:
/* 00002CE8 88080000 */ lbz r0, 0(r8)
/* 00002CEC 2C000002 */ cmpwi r0, 2
/* 00002CF0 4082000C */ bne lbl_00002CFC
/* 00002CF4 90C50000 */ stw r6, 0(r5)
/* 00002CF8 98660148 */ stb r3, 0x148(r6)
lbl_00002CFC:
/* 00002CFC 39290001 */ addi r9, r9, 1
/* 00002D00 38C601A4 */ addi r6, r6, 0x1a4
/* 00002D04 39080001 */ addi r8, r8, 1
lbl_00002D08:
/* 00002D08 80040008 */ lwz r0, 8(r4)
/* 00002D0C 7C090000 */ cmpw r9, r0
/* 00002D10 4180FFD8 */ blt lbl_00002CE8
/* 00002D14 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002D18 38830000 */ addi r4, r3, currentBallStructPtr@l
/* 00002D1C 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00002D20 90E40000 */ stw r7, 0(r4)
/* 00002D24 38A30000 */ addi r5, r3, currentCameraStructPtr@l
/* 00002D28 3C600000 */ lis r3, cameraInfo@ha
/* 00002D2C 80E50000 */ lwz r7, 0(r5)
/* 00002D30 38830000 */ addi r4, r3, cameraInfo@l
/* 00002D34 90850000 */ stw r4, 0(r5)
/* 00002D38 38600006 */ li r3, 6
/* 00002D3C 38C40284 */ addi r6, r4, 0x284
/* 00002D40 9864001F */ stb r3, 0x1f(r4)
/* 00002D44 38000168 */ li r0, 0x168
/* 00002D48 90C50000 */ stw r6, 0(r5)
/* 00002D4C 38C60284 */ addi r6, r6, 0x284
/* 00002D50 986402A3 */ stb r3, 0x2a3(r4)
/* 00002D54 90C50000 */ stw r6, 0(r5)
/* 00002D58 9866001F */ stb r3, 0x1f(r6)
/* 00002D5C 38C60284 */ addi r6, r6, 0x284
/* 00002D60 90C50000 */ stw r6, 0(r5)
/* 00002D64 9866001F */ stb r3, 0x1f(r6)
/* 00002D68 90E50000 */ stw r7, 0(r5)
/* 00002D6C 901E0144 */ stw r0, 0x144(r30)
lbl_00002D70:
/* 00002D70 881D0009 */ lbz r0, 9(r29)
/* 00002D74 2C00000C */ cmpwi r0, 0xc
/* 00002D78 40820010 */ bne lbl_00002D88
/* 00002D7C 3800021C */ li r0, 0x21c
/* 00002D80 901E0000 */ stw r0, 0(r30)
/* 00002D84 48000030 */ b lbl_00002DB4
lbl_00002D88:
/* 00002D88 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002D8C 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00002D90 80630000 */ lwz r3, 0(r3)
/* 00002D94 80030094 */ lwz r0, 0x94(r3)
/* 00002D98 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00002D9C 40820010 */ bne lbl_00002DAC
/* 00002DA0 380000F0 */ li r0, 0xf0
/* 00002DA4 901E0000 */ stw r0, 0(r30)
/* 00002DA8 4800000C */ b lbl_00002DB4
lbl_00002DAC:
/* 00002DAC 38000168 */ li r0, 0x168
/* 00002DB0 901E0000 */ stw r0, 0(r30)
lbl_00002DB4:
/* 00002DB4 38000080 */ li r0, 0x80
/* 00002DB8 901F0000 */ stw r0, 0(r31)
/* 00002DBC 38000060 */ li r0, 0x60
/* 00002DC0 901F0004 */ stw r0, 4(r31)
/* 00002DC4 80010084 */ lwz r0, 0x84(r1)
/* 00002DC8 83E1007C */ lwz r31, 0x7c(r1)
/* 00002DCC 83C10078 */ lwz r30, 0x78(r1)
/* 00002DD0 83A10074 */ lwz r29, 0x74(r1)
/* 00002DD4 38210080 */ addi r1, r1, 0x80
/* 00002DD8 7C0803A6 */ mtlr r0
/* 00002DDC 4E800020 */ blr 
lbl_00002DE0:
/* 00002DE0 7C0802A6 */ mflr r0
/* 00002DE4 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00002DE8 90010004 */ stw r0, 4(r1)
/* 00002DEC 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00002DF0 3CA00000 */ lis r5, lbl_10000000@ha
/* 00002DF4 9421FFD8 */ stwu r1, -0x28(r1)
/* 00002DF8 3C800000 */ lis r4, lbl_0000F020@ha
/* 00002DFC BF610014 */ stmw r27, 0x14(r1)
/* 00002E00 3BA50000 */ addi r29, r5, lbl_10000000@l
/* 00002E04 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 00002E08 80630000 */ lwz r3, 0(r3)
/* 00002E0C 80030094 */ lwz r0, 0x94(r3)
/* 00002E10 3C600000 */ lis r3, lbl_00014F20@ha
/* 00002E14 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00002E18 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00002E1C 4082003C */ bne lbl_00002E58
/* 00002E20 801D0000 */ lwz r0, 0(r29)
/* 00002E24 3C600000 */ lis r3, lbl_00010D58@ha
/* 00002E28 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00002E2C 6C008000 */ xoris r0, r0, 0x8000
/* 00002E30 C85E1F38 */ lfd f2, 0x1f38(r30)
/* 00002E34 9001000C */ stw r0, 0xc(r1)
/* 00002E38 3C004330 */ lis r0, 0x4330
/* 00002E3C 90010008 */ stw r0, 8(r1)
/* 00002E40 C8010008 */ lfd f0, 8(r1)
/* 00002E44 FC000828 */ fsub f0, f0, f1
/* 00002E48 FC020000 */ fcmpu cr0, f2, f0
/* 00002E4C 4082000C */ bne lbl_00002E58
/* 00002E50 3860000C */ li r3, 0xc
/* 00002E54 4BFFD30D */ bl g_play_sound
lbl_00002E58:
/* 00002E58 3C600000 */ lis r3, modeCtrl@ha
/* 00002E5C 38630000 */ addi r3, r3, modeCtrl@l
/* 00002E60 3B83002C */ addi r28, r3, 0x2c
/* 00002E64 8003002C */ lwz r0, 0x2c(r3)
/* 00002E68 1C00004C */ mulli r0, r0, 0x4c
/* 00002E6C 7C7D0214 */ add r3, r29, r0
/* 00002E70 88030013 */ lbz r0, 0x13(r3)
/* 00002E74 7C000774 */ extsb r0, r0
/* 00002E78 2C000001 */ cmpwi r0, 1
/* 00002E7C 41820018 */ beq lbl_00002E94
/* 00002E80 2C000002 */ cmpwi r0, 2
/* 00002E84 4082012C */ bne lbl_00002FB0
/* 00002E88 88030012 */ lbz r0, 0x12(r3)
/* 00002E8C 2C00000A */ cmpwi r0, 0xa
/* 00002E90 40820120 */ bne lbl_00002FB0
lbl_00002E94:
/* 00002E94 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002E98 38830000 */ addi r4, r3, lbl_80206DEC@l
/* 00002E9C 80640000 */ lwz r3, 0(r4)
/* 00002EA0 2C031770 */ cmpwi r3, 0x1770
/* 00002EA4 4080000C */ bge lbl_00002EB0
/* 00002EA8 38030014 */ addi r0, r3, 0x14
/* 00002EAC 90040000 */ stw r0, 0(r4)
lbl_00002EB0:
/* 00002EB0 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002EB4 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 00002EB8 2C000BB8 */ cmpwi r0, 0xbb8
/* 00002EBC 40820014 */ bne lbl_00002ED0
/* 00002EC0 A01D013C */ lhz r0, 0x13c(r29)
/* 00002EC4 28000000 */ cmplwi r0, 0
/* 00002EC8 40820008 */ bne lbl_00002ED0
/* 00002ECC 48001E45 */ bl lbl_00004D10
lbl_00002ED0:
/* 00002ED0 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002ED4 38630000 */ addi r3, r3, lbl_80206DEC@l
/* 00002ED8 80630000 */ lwz r3, 0(r3)
/* 00002EDC 2C030528 */ cmpwi r3, 0x528
/* 00002EE0 40810090 */ ble lbl_00002F70
/* 00002EE4 2C0312C0 */ cmpwi r3, 0x12c0
/* 00002EE8 40800088 */ bge lbl_00002F70
/* 00002EEC A01D013C */ lhz r0, 0x13c(r29)
/* 00002EF0 28000000 */ cmplwi r0, 0
/* 00002EF4 4082005C */ bne lbl_00002F50
/* 00002EF8 2C030E10 */ cmpwi r3, 0xe10
/* 00002EFC 40800054 */ bge lbl_00002F50
/* 00002F00 20030E10 */ subfic r0, r3, 0xe10
/* 00002F04 C81E1F48 */ lfd f0, 0x1f48(r30)
/* 00002F08 6C008000 */ xoris r0, r0, 0x8000
/* 00002F0C C87E1F40 */ lfd f3, 0x1f40(r30)
/* 00002F10 9001000C */ stw r0, 0xc(r1)
/* 00002F14 3C004330 */ lis r0, 0x4330
/* 00002F18 3C600000 */ lis r3, lbl_00010D58@ha
/* 00002F1C 90010008 */ stw r0, 8(r1)
/* 00002F20 3C800000 */ lis r4, movableStageParts@ha
/* 00002F24 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 00002F28 38640000 */ addi r3, r4, movableStageParts@l
/* 00002F2C C8210008 */ lfd f1, 8(r1)
/* 00002F30 FC211028 */ fsub f1, f1, f2
/* 00002F34 C0430088 */ lfs f2, 0x88(r3)
/* 00002F38 FC421828 */ fsub f2, f2, f3
/* 00002F3C FC010024 */ fdiv f0, f1, f0
/* 00002F40 FC22002A */ fadd f1, f2, f0
/* 00002F44 FC200818 */ frsp f1, f1
/* 00002F48 48008165 */ bl lbl_0000B0AC
/* 00002F4C 4800002C */ b lbl_00002F78
lbl_00002F50:
/* 00002F50 3C600000 */ lis r3, movableStageParts@ha
/* 00002F54 C81E1F40 */ lfd f0, 0x1f40(r30)
/* 00002F58 38630000 */ addi r3, r3, movableStageParts@l
/* 00002F5C C0230088 */ lfs f1, 0x88(r3)
/* 00002F60 FC210028 */ fsub f1, f1, f0
/* 00002F64 FC200818 */ frsp f1, f1
/* 00002F68 48008145 */ bl lbl_0000B0AC
/* 00002F6C 4800000C */ b lbl_00002F78
lbl_00002F70:
/* 00002F70 C03E1C24 */ lfs f1, 0x1c24(r30)
/* 00002F74 48008139 */ bl lbl_0000B0AC
lbl_00002F78:
/* 00002F78 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002F7C 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 00002F80 2C000258 */ cmpwi r0, 0x258
/* 00002F84 4081012C */ ble lbl_000030B0
/* 00002F88 2C000BB8 */ cmpwi r0, 0xbb8
/* 00002F8C 40800124 */ bge lbl_000030B0
/* 00002F90 3C600000 */ lis r3, movableStageParts@ha
/* 00002F94 C81E1F50 */ lfd f0, 0x1f50(r30)
/* 00002F98 38630000 */ addi r3, r3, movableStageParts@l
/* 00002F9C C0230110 */ lfs f1, 0x110(r3)
/* 00002FA0 FC210028 */ fsub f1, f1, f0
/* 00002FA4 FC200818 */ frsp f1, f1
/* 00002FA8 48008215 */ bl lbl_0000B1BC
/* 00002FAC 48000104 */ b lbl_000030B0
lbl_00002FB0:
/* 00002FB0 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002FB4 38830000 */ addi r4, r3, lbl_80206DEC@l
/* 00002FB8 80640000 */ lwz r3, 0(r4)
/* 00002FBC 2C032EE0 */ cmpwi r3, 0x2ee0
/* 00002FC0 4080000C */ bge lbl_00002FCC
/* 00002FC4 38030014 */ addi r0, r3, 0x14
/* 00002FC8 90040000 */ stw r0, 0(r4)
lbl_00002FCC:
/* 00002FCC 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002FD0 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 00002FD4 2C002580 */ cmpwi r0, 0x2580
/* 00002FD8 40820008 */ bne lbl_00002FE0
/* 00002FDC 48001D35 */ bl lbl_00004D10
lbl_00002FE0:
/* 00002FE0 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00002FE4 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 00002FE8 2C002580 */ cmpwi r0, 0x2580
/* 00002FEC 4180007C */ blt lbl_00003068
/* 00002FF0 2C002A30 */ cmpwi r0, 0x2a30
/* 00002FF4 40800074 */ bge lbl_00003068
/* 00002FF8 2C0027D8 */ cmpwi r0, 0x27d8
/* 00002FFC 40800050 */ bge lbl_0000304C
/* 00003000 200027D8 */ subfic r0, r0, 0x27d8
/* 00003004 C81E1F48 */ lfd f0, 0x1f48(r30)
/* 00003008 6C008000 */ xoris r0, r0, 0x8000
/* 0000300C C87E1F40 */ lfd f3, 0x1f40(r30)
/* 00003010 9001000C */ stw r0, 0xc(r1)
/* 00003014 3C004330 */ lis r0, 0x4330
/* 00003018 3C600000 */ lis r3, lbl_00010D58@ha
/* 0000301C 90010008 */ stw r0, 8(r1)
/* 00003020 3C800000 */ lis r4, movableStageParts@ha
/* 00003024 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 00003028 38640000 */ addi r3, r4, movableStageParts@l
/* 0000302C C8210008 */ lfd f1, 8(r1)
/* 00003030 FC211028 */ fsub f1, f1, f2
/* 00003034 C0430088 */ lfs f2, 0x88(r3)
/* 00003038 FC421828 */ fsub f2, f2, f3
/* 0000303C FC010024 */ fdiv f0, f1, f0
/* 00003040 FC22002A */ fadd f1, f2, f0
/* 00003044 FC200818 */ frsp f1, f1
/* 00003048 4800001C */ b lbl_00003064
lbl_0000304C:
/* 0000304C 3C600000 */ lis r3, movableStageParts@ha
/* 00003050 C81E1F40 */ lfd f0, 0x1f40(r30)
/* 00003054 38630000 */ addi r3, r3, movableStageParts@l
/* 00003058 C0230088 */ lfs f1, 0x88(r3)
/* 0000305C FC210028 */ fsub f1, f1, f0
/* 00003060 FC200818 */ frsp f1, f1
lbl_00003064:
/* 00003064 48008049 */ bl lbl_0000B0AC
lbl_00003068:
/* 00003068 3C600000 */ lis r3, lbl_80206DEC@ha
/* 0000306C 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 00003070 2C001C20 */ cmpwi r0, 0x1c20
/* 00003074 40820008 */ bne lbl_0000307C
/* 00003078 48007EA1 */ bl lbl_0000AF18
lbl_0000307C:
/* 0000307C 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00003080 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 00003084 2C001C20 */ cmpwi r0, 0x1c20
/* 00003088 40810028 */ ble lbl_000030B0
/* 0000308C 2C002328 */ cmpwi r0, 0x2328
/* 00003090 40800020 */ bge lbl_000030B0
/* 00003094 3C600000 */ lis r3, movableStageParts@ha
/* 00003098 C81E1F50 */ lfd f0, 0x1f50(r30)
/* 0000309C 38630000 */ addi r3, r3, movableStageParts@l
/* 000030A0 C0230110 */ lfs f1, 0x110(r3)
/* 000030A4 FC210028 */ fsub f1, f1, f0
/* 000030A8 FC200818 */ frsp f1, f1
/* 000030AC 48008111 */ bl lbl_0000B1BC
lbl_000030B0:
/* 000030B0 80DD0000 */ lwz r6, 0(r29)
/* 000030B4 2C060000 */ cmpwi r6, 0
/* 000030B8 4080000C */ bge lbl_000030C4
/* 000030BC 38000001 */ li r0, 1
/* 000030C0 480000CC */ b lbl_0000318C
lbl_000030C4:
/* 000030C4 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000030C8 80E30000 */ lwz r7, currentBallStructPtr@l(r3)
/* 000030CC 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000030D0 3CA00000 */ lis r5, controllerInfo@ha
/* 000030D4 8887002E */ lbz r4, 0x2e(r7)
/* 000030D8 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000030DC 38A50000 */ addi r5, r5, controllerInfo@l
/* 000030E0 7C830774 */ extsb r3, r4
/* 000030E4 5463103A */ slwi r3, r3, 2
/* 000030E8 7C601A14 */ add r3, r0, r3
/* 000030EC 80030000 */ lwz r0, 0(r3)
/* 000030F0 1C00003C */ mulli r0, r0, 0x3c
/* 000030F4 7C650214 */ add r3, r5, r0
/* 000030F8 A0030018 */ lhz r0, 0x18(r3)
/* 000030FC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00003100 4082000C */ bne lbl_0000310C
/* 00003104 38000000 */ li r0, 0
/* 00003108 48000084 */ b lbl_0000318C
lbl_0000310C:
/* 0000310C 80070094 */ lwz r0, 0x94(r7)
/* 00003110 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00003114 41820040 */ beq lbl_00003154
/* 00003118 6CC08000 */ xoris r0, r6, 0x8000
/* 0000311C C81E1F58 */ lfd f0, 0x1f58(r30)
/* 00003120 9001000C */ stw r0, 0xc(r1)
/* 00003124 3C004330 */ lis r0, 0x4330
/* 00003128 3C600000 */ lis r3, lbl_00010D58@ha
/* 0000312C 90010008 */ stw r0, 8(r1)
/* 00003130 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 00003134 C8210008 */ lfd f1, 8(r1)
/* 00003138 FC211028 */ fsub f1, f1, f2
/* 0000313C FC010040 */ fcmpo cr0, f1, f0
/* 00003140 4080000C */ bge lbl_0000314C
/* 00003144 38000001 */ li r0, 1
/* 00003148 48000044 */ b lbl_0000318C
lbl_0000314C:
/* 0000314C 38000000 */ li r0, 0
/* 00003150 4800003C */ b lbl_0000318C
lbl_00003154:
/* 00003154 6CC08000 */ xoris r0, r6, 0x8000
/* 00003158 C81E1F60 */ lfd f0, 0x1f60(r30)
/* 0000315C 9001000C */ stw r0, 0xc(r1)
/* 00003160 3C004330 */ lis r0, 0x4330
/* 00003164 3C600000 */ lis r3, lbl_00010D58@ha
/* 00003168 90010008 */ stw r0, 8(r1)
/* 0000316C C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 00003170 C8210008 */ lfd f1, 8(r1)
/* 00003174 FC211028 */ fsub f1, f1, f2
/* 00003178 FC010040 */ fcmpo cr0, f1, f0
/* 0000317C 4080000C */ bge lbl_00003188
/* 00003180 38000001 */ li r0, 1
/* 00003184 48000008 */ b lbl_0000318C
lbl_00003188:
/* 00003188 38000000 */ li r0, 0
lbl_0000318C:
/* 0000318C 2C000000 */ cmpwi r0, 0
/* 00003190 418203D0 */ beq lbl_00003560
/* 00003194 801C0000 */ lwz r0, 0(r28)
/* 00003198 3B600000 */ li r27, 0
/* 0000319C 1C00004C */ mulli r0, r0, 0x4c
/* 000031A0 7FDD0214 */ add r30, r29, r0
/* 000031A4 3BDE000C */ addi r30, r30, 0xc
/* 000031A8 48004599 */ bl lbl_00007740
/* 000031AC 38600012 */ li r3, 0x12
/* 000031B0 4BFFCFB1 */ bl event_finish
/* 000031B4 3800FFFF */ li r0, -1
/* 000031B8 901F000C */ stw r0, 0xc(r31)
/* 000031BC 38600012 */ li r3, 0x12
/* 000031C0 4BFFCFA1 */ bl event_start
/* 000031C4 7FC3F378 */ mr r3, r30
/* 000031C8 48002019 */ bl lbl_000051E0
/* 000031CC 7FC3F378 */ mr r3, r30
/* 000031D0 48002011 */ bl lbl_000051E0
/* 000031D4 7FC3F378 */ mr r3, r30
/* 000031D8 48001F51 */ bl lbl_00005128
/* 000031DC 881E0006 */ lbz r0, 6(r30)
/* 000031E0 2C00000A */ cmpwi r0, 0xa
/* 000031E4 40820050 */ bne lbl_00003234
/* 000031E8 881E0007 */ lbz r0, 7(r30)
/* 000031EC 7C000774 */ extsb r0, r0
/* 000031F0 2C000003 */ cmpwi r0, 3
/* 000031F4 4180000C */ blt lbl_00003200
/* 000031F8 3B600001 */ li r27, 1
/* 000031FC 4800006C */ b lbl_00003268
lbl_00003200:
/* 00003200 2C000002 */ cmpwi r0, 2
/* 00003204 40820064 */ bne lbl_00003268
/* 00003208 881E0047 */ lbz r0, 0x47(r30)
/* 0000320C 2C000002 */ cmpwi r0, 2
/* 00003210 41820058 */ beq lbl_00003268
/* 00003214 881E0048 */ lbz r0, 0x48(r30)
/* 00003218 7C000774 */ extsb r0, r0
/* 0000321C 2C000002 */ cmpwi r0, 2
/* 00003220 41820048 */ beq lbl_00003268
/* 00003224 2C000003 */ cmpwi r0, 3
/* 00003228 41820040 */ beq lbl_00003268
/* 0000322C 3B600001 */ li r27, 1
/* 00003230 48000038 */ b lbl_00003268
lbl_00003234:
/* 00003234 881E0007 */ lbz r0, 7(r30)
/* 00003238 7C000774 */ extsb r0, r0
/* 0000323C 2C000002 */ cmpwi r0, 2
/* 00003240 4180000C */ blt lbl_0000324C
/* 00003244 3B600001 */ li r27, 1
/* 00003248 48000020 */ b lbl_00003268
lbl_0000324C:
/* 0000324C 881E0008 */ lbz r0, 8(r30)
/* 00003250 7C000774 */ extsb r0, r0
/* 00003254 7C7E0214 */ add r3, r30, r0
/* 00003258 88030035 */ lbz r0, 0x35(r3)
/* 0000325C 2C000002 */ cmpwi r0, 2
/* 00003260 40820008 */ bne lbl_00003268
/* 00003264 3B600001 */ li r27, 1
lbl_00003268:
/* 00003268 38000000 */ li r0, 0
/* 0000326C 901D0144 */ stw r0, 0x144(r29)
/* 00003270 3860006B */ li r3, 0x6b
/* 00003274 4BFFCEED */ bl destroy_sprite_with_tag
/* 00003278 7F600775 */ extsb. r0, r27
/* 0000327C 41820030 */ beq lbl_000032AC
/* 00003280 4BFFCEE1 */ bl func_800174C8
/* 00003284 38000001 */ li r0, 1
/* 00003288 981E0007 */ stb r0, 7(r30)
/* 0000328C 887E0006 */ lbz r3, 6(r30)
/* 00003290 38030001 */ addi r0, r3, 1
/* 00003294 981E0006 */ stb r0, 6(r30)
/* 00003298 48001A79 */ bl lbl_00004D10
/* 0000329C 387D013E */ addi r3, r29, 0x13e
/* 000032A0 48007AED */ bl lbl_0000AD8C
/* 000032A4 B07D013C */ sth r3, 0x13c(r29)
/* 000032A8 48000010 */ b lbl_000032B8
lbl_000032AC:
/* 000032AC 887E0007 */ lbz r3, 7(r30)
/* 000032B0 38030001 */ addi r0, r3, 1
/* 000032B4 981E0007 */ stb r0, 7(r30)
lbl_000032B8:
/* 000032B8 881E0006 */ lbz r0, 6(r30)
/* 000032BC 889E0007 */ lbz r4, 7(r30)
/* 000032C0 7C030774 */ extsb r3, r0
/* 000032C4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000032C8 5400083C */ slwi r0, r0, 1
/* 000032CC 7C640214 */ add r3, r4, r0
/* 000032D0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000032D4 981E0008 */ stb r0, 8(r30)
/* 000032D8 801C0000 */ lwz r0, 0(r28)
/* 000032DC 2C000000 */ cmpwi r0, 0
/* 000032E0 40820154 */ bne lbl_00003434
/* 000032E4 881D0012 */ lbz r0, 0x12(r29)
/* 000032E8 7C000774 */ extsb r0, r0
/* 000032EC 2C00000A */ cmpwi r0, 0xa
/* 000032F0 40810144 */ ble lbl_00003434
/* 000032F4 38000000 */ li r0, 0
/* 000032F8 3C600000 */ lis r3, spritePoolInfo@ha
/* 000032FC 981F0008 */ stb r0, 8(r31)
/* 00003300 38630000 */ addi r3, r3, spritePoolInfo@l
/* 00003304 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00003308 38A40000 */ addi r5, r4, currentBallStructPtr@l
/* 0000330C 38C3000C */ addi r6, r3, 0xc
/* 00003310 81050000 */ lwz r8, 0(r5)
/* 00003314 3C800000 */ lis r4, ballInfo@ha
/* 00003318 8123000C */ lwz r9, 0xc(r3)
/* 0000331C 38040000 */ addi r0, r4, ballInfo@l
/* 00003320 7C070378 */ mr r7, r0
/* 00003324 38830008 */ addi r4, r3, 8
/* 00003328 39400000 */ li r10, 0
/* 0000332C 38600001 */ li r3, 1
/* 00003330 48000024 */ b lbl_00003354
lbl_00003334:
/* 00003334 88090000 */ lbz r0, 0(r9)
/* 00003338 2C000002 */ cmpwi r0, 2
/* 0000333C 4082000C */ bne lbl_00003348
/* 00003340 90E50000 */ stw r7, 0(r5)
/* 00003344 98670003 */ stb r3, 3(r7)
lbl_00003348:
/* 00003348 394A0001 */ addi r10, r10, 1
/* 0000334C 38E701A4 */ addi r7, r7, 0x1a4
/* 00003350 39290001 */ addi r9, r9, 1
lbl_00003354:
/* 00003354 80040000 */ lwz r0, 0(r4)
/* 00003358 7C0A0000 */ cmpw r10, r0
/* 0000335C 4180FFD8 */ blt lbl_00003334
/* 00003360 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00003364 91030000 */ stw r8, currentBallStructPtr@l(r3)
/* 00003368 3C600000 */ lis r3, worldInfo@ha
/* 0000336C 38030000 */ addi r0, r3, worldInfo@l
/* 00003370 80C60000 */ lwz r6, 0(r6)
/* 00003374 7C050378 */ mr r5, r0
/* 00003378 38E00000 */ li r7, 0
/* 0000337C 38600001 */ li r3, 1
/* 00003380 48000020 */ b lbl_000033A0
lbl_00003384:
/* 00003384 88060000 */ lbz r0, 0(r6)
/* 00003388 2C000002 */ cmpwi r0, 2
/* 0000338C 40820008 */ bne lbl_00003394
/* 00003390 98650008 */ stb r3, 8(r5)
lbl_00003394:
/* 00003394 38E70001 */ addi r7, r7, 1
/* 00003398 38A50040 */ addi r5, r5, 0x40
/* 0000339C 38C60001 */ addi r6, r6, 1
lbl_000033A0:
/* 000033A0 80040000 */ lwz r0, 0(r4)
/* 000033A4 7C070000 */ cmpw r7, r0
/* 000033A8 4180FFDC */ blt lbl_00003384
/* 000033AC 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 000033B0 39030000 */ addi r8, r3, currentCameraStructPtr@l
/* 000033B4 3C600000 */ lis r3, cameraInfo@ha
/* 000033B8 81480000 */ lwz r10, 0(r8)
/* 000033BC 38630000 */ addi r3, r3, cameraInfo@l
/* 000033C0 90680000 */ stw r3, 0(r8)
/* 000033C4 38E00000 */ li r7, 0
/* 000033C8 38C00009 */ li r6, 9
/* 000033CC 98E3001F */ stb r7, 0x1f(r3)
/* 000033D0 39230284 */ addi r9, r3, 0x284
/* 000033D4 38800E10 */ li r4, 0xe10
/* 000033D8 80A80000 */ lwz r5, 0(r8)
/* 000033DC 38600100 */ li r3, 0x100
/* 000033E0 38000801 */ li r0, 0x801
/* 000033E4 98C50026 */ stb r6, 0x26(r5)
/* 000033E8 91280000 */ stw r9, 0(r8)
/* 000033EC 98E9001F */ stb r7, 0x1f(r9)
/* 000033F0 39290284 */ addi r9, r9, 0x284
/* 000033F4 80A80000 */ lwz r5, 0(r8)
/* 000033F8 98C50026 */ stb r6, 0x26(r5)
/* 000033FC 91280000 */ stw r9, 0(r8)
/* 00003400 98E9001F */ stb r7, 0x1f(r9)
/* 00003404 39290284 */ addi r9, r9, 0x284
/* 00003408 80A80000 */ lwz r5, 0(r8)
/* 0000340C 98C50026 */ stb r6, 0x26(r5)
/* 00003410 91280000 */ stw r9, 0(r8)
/* 00003414 98E9001F */ stb r7, 0x1f(r9)
/* 00003418 80A80000 */ lwz r5, 0(r8)
/* 0000341C 98C50026 */ stb r6, 0x26(r5)
/* 00003420 91480000 */ stw r10, 0(r8)
/* 00003424 909D0000 */ stw r4, 0(r29)
/* 00003428 907F0000 */ stw r3, 0(r31)
/* 0000342C 901F0004 */ stw r0, 4(r31)
/* 00003430 48000130 */ b lbl_00003560
lbl_00003434:
/* 00003434 3C600000 */ lis r3, spritePoolInfo@ha
/* 00003438 38630000 */ addi r3, r3, spritePoolInfo@l
/* 0000343C 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00003440 38A40000 */ addi r5, r4, currentBallStructPtr@l
/* 00003444 38C3000C */ addi r6, r3, 0xc
/* 00003448 81050000 */ lwz r8, 0(r5)
/* 0000344C 3C800000 */ lis r4, ballInfo@ha
/* 00003450 8123000C */ lwz r9, 0xc(r3)
/* 00003454 38040000 */ addi r0, r4, ballInfo@l
/* 00003458 7C070378 */ mr r7, r0
/* 0000345C 38830008 */ addi r4, r3, 8
/* 00003460 39400000 */ li r10, 0
/* 00003464 38600001 */ li r3, 1
/* 00003468 48000024 */ b lbl_0000348C
lbl_0000346C:
/* 0000346C 88090000 */ lbz r0, 0(r9)
/* 00003470 2C000002 */ cmpwi r0, 2
/* 00003474 4082000C */ bne lbl_00003480
/* 00003478 90E50000 */ stw r7, 0(r5)
/* 0000347C 98670003 */ stb r3, 3(r7)
lbl_00003480:
/* 00003480 394A0001 */ addi r10, r10, 1
/* 00003484 38E701A4 */ addi r7, r7, 0x1a4
/* 00003488 39290001 */ addi r9, r9, 1
lbl_0000348C:
/* 0000348C 80040000 */ lwz r0, 0(r4)
/* 00003490 7C0A0000 */ cmpw r10, r0
/* 00003494 4180FFD8 */ blt lbl_0000346C
/* 00003498 3C600000 */ lis r3, currentBallStructPtr@ha
/* 0000349C 91030000 */ stw r8, currentBallStructPtr@l(r3)
/* 000034A0 3C600000 */ lis r3, worldInfo@ha
/* 000034A4 38030000 */ addi r0, r3, worldInfo@l
/* 000034A8 80C60000 */ lwz r6, 0(r6)
/* 000034AC 7C050378 */ mr r5, r0
/* 000034B0 38E00000 */ li r7, 0
/* 000034B4 38600001 */ li r3, 1
/* 000034B8 48000020 */ b lbl_000034D8
lbl_000034BC:
/* 000034BC 88060000 */ lbz r0, 0(r6)
/* 000034C0 2C000002 */ cmpwi r0, 2
/* 000034C4 40820008 */ bne lbl_000034CC
/* 000034C8 98650008 */ stb r3, 8(r5)
lbl_000034CC:
/* 000034CC 38E70001 */ addi r7, r7, 1
/* 000034D0 38A50040 */ addi r5, r5, 0x40
/* 000034D4 38C60001 */ addi r6, r6, 1
lbl_000034D8:
/* 000034D8 80040000 */ lwz r0, 0(r4)
/* 000034DC 7C070000 */ cmpw r7, r0
/* 000034E0 4180FFDC */ blt lbl_000034BC
/* 000034E4 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 000034E8 38E30000 */ addi r7, r3, currentCameraStructPtr@l
/* 000034EC 3C600000 */ lis r3, cameraInfo@ha
/* 000034F0 81270000 */ lwz r9, 0(r7)
/* 000034F4 38630000 */ addi r3, r3, cameraInfo@l
/* 000034F8 90670000 */ stw r3, 0(r7)
/* 000034FC 38C00000 */ li r6, 0
/* 00003500 38A00009 */ li r5, 9
/* 00003504 98C3001F */ stb r6, 0x1f(r3)
/* 00003508 39030284 */ addi r8, r3, 0x284
/* 0000350C 38602710 */ li r3, 0x2710
/* 00003510 80870000 */ lwz r4, 0(r7)
/* 00003514 38000001 */ li r0, 1
/* 00003518 98A40026 */ stb r5, 0x26(r4)
/* 0000351C 91070000 */ stw r8, 0(r7)
/* 00003520 98C8001F */ stb r6, 0x1f(r8)
/* 00003524 39080284 */ addi r8, r8, 0x284
/* 00003528 80870000 */ lwz r4, 0(r7)
/* 0000352C 98A40026 */ stb r5, 0x26(r4)
/* 00003530 91070000 */ stw r8, 0(r7)
/* 00003534 98C8001F */ stb r6, 0x1f(r8)
/* 00003538 39080284 */ addi r8, r8, 0x284
/* 0000353C 80870000 */ lwz r4, 0(r7)
/* 00003540 98A40026 */ stb r5, 0x26(r4)
/* 00003544 91070000 */ stw r8, 0(r7)
/* 00003548 98C8001F */ stb r6, 0x1f(r8)
/* 0000354C 80870000 */ lwz r4, 0(r7)
/* 00003550 98A40026 */ stb r5, 0x26(r4)
/* 00003554 91270000 */ stw r9, 0(r7)
/* 00003558 907D0000 */ stw r3, 0(r29)
/* 0000355C 901F0000 */ stw r0, 0(r31)
lbl_00003560:
/* 00003560 BB610014 */ lmw r27, 0x14(r1)
/* 00003564 8001002C */ lwz r0, 0x2c(r1)
/* 00003568 38210028 */ addi r1, r1, 0x28
/* 0000356C 7C0803A6 */ mtlr r0
/* 00003570 4E800020 */ blr 
lbl_00003574:
/* 00003574 7C0802A6 */ mflr r0
/* 00003578 3CA00000 */ lis r5, lbl_10000000@ha
/* 0000357C 90010004 */ stw r0, 4(r1)
/* 00003580 3C800000 */ lis r4, lbl_0000F020@ha
/* 00003584 3C600000 */ lis r3, lbl_00014F20@ha
/* 00003588 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000358C BF410018 */ stmw r26, 0x18(r1)
/* 00003590 3B850000 */ addi r28, r5, lbl_10000000@l
/* 00003594 3BA40000 */ addi r29, r4, lbl_0000F020@l
/* 00003598 3BC30000 */ addi r30, r3, lbl_00014F20@l
/* 0000359C 480041DD */ bl lbl_00007778
/* 000035A0 2C030000 */ cmpwi r3, 0
/* 000035A4 41820010 */ beq lbl_000035B4
/* 000035A8 801C0000 */ lwz r0, 0(r28)
/* 000035AC 2C000DD4 */ cmpwi r0, 0xdd4
/* 000035B0 41800010 */ blt lbl_000035C0
lbl_000035B4:
/* 000035B4 801C0000 */ lwz r0, 0(r28)
/* 000035B8 2C000000 */ cmpwi r0, 0
/* 000035BC 40800440 */ bge lbl_000039FC
lbl_000035C0:
/* 000035C0 3C600000 */ lis r3, modeCtrl@ha
/* 000035C4 38630000 */ addi r3, r3, modeCtrl@l
/* 000035C8 3BE30024 */ addi r31, r3, 0x24
/* 000035CC 80030024 */ lwz r0, 0x24(r3)
/* 000035D0 2C000001 */ cmpwi r0, 1
/* 000035D4 408200F8 */ bne lbl_000036CC
/* 000035D8 3C600000 */ lis r3, ballInfo@ha
/* 000035DC 38630000 */ addi r3, r3, ballInfo@l
/* 000035E0 808300FC */ lwz r4, 0xfc(r3)
/* 000035E4 3B6300FC */ addi r27, r3, 0xfc
/* 000035E8 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 000035EC 80040010 */ lwz r0, 0x10(r4)
/* 000035F0 9801000B */ stb r0, 0xb(r1)
/* 000035F4 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 000035F8 2C000000 */ cmpwi r0, 0
/* 000035FC 40820014 */ bne lbl_00003610
/* 00003600 A01C0010 */ lhz r0, 0x10(r28)
/* 00003604 3B400009 */ li r26, 9
/* 00003608 B001000C */ sth r0, 0xc(r1)
/* 0000360C 48000014 */ b lbl_00003620
lbl_00003610:
/* 00003610 881C0006 */ lbz r0, 6(r28)
/* 00003614 3B40000A */ li r26, 0xa
/* 00003618 7C000774 */ extsb r0, r0
/* 0000361C B001000C */ sth r0, 0xc(r1)
lbl_00003620:
/* 00003620 387A0000 */ addi r3, r26, 0
/* 00003624 38810008 */ addi r4, r1, 8
/* 00003628 4BFFCB39 */ bl func_800AC5E0
/* 0000362C 2C03FFFF */ cmpwi r3, -1
/* 00003630 40820060 */ bne lbl_00003690
/* 00003634 4BFFCB2D */ bl event_finish_all
/* 00003638 38600010 */ li r3, 0x10
/* 0000363C 4BFFCB25 */ bl event_start
/* 00003640 38600012 */ li r3, 0x12
/* 00003644 4BFFCB1D */ bl event_start
/* 00003648 387A0000 */ addi r3, r26, 0
/* 0000364C 38800000 */ li r4, 0
/* 00003650 4BFFCB11 */ bl func_800AB2A0
/* 00003654 3C600000 */ lis r3, lbl_801EEC68@ha
/* 00003658 38830000 */ addi r4, r3, lbl_801EEC68@l
/* 0000365C 80040004 */ lwz r0, 4(r4)
/* 00003660 3C600000 */ lis r3, modeCtrl@ha
/* 00003664 60000002 */ ori r0, r0, 2
/* 00003668 90040004 */ stw r0, 4(r4)
/* 0000366C 38000000 */ li r0, 0
/* 00003670 38802710 */ li r4, 0x2710
/* 00003674 90030000 */ stw r0, modeCtrl@l(r3)
/* 00003678 38600400 */ li r3, 0x400
/* 0000367C 38002000 */ li r0, 0x2000
/* 00003680 909C0000 */ stw r4, 0(r28)
/* 00003684 907E0000 */ stw r3, 0(r30)
/* 00003688 901E0004 */ stw r0, 4(r30)
/* 0000368C 48000370 */ b lbl_000039FC
lbl_00003690:
/* 00003690 80BB0000 */ lwz r5, 0(r27)
/* 00003694 7C630774 */ extsb r3, r3
/* 00003698 3880FFFF */ li r4, -1
/* 0000369C 80A50010 */ lwz r5, 0x10(r5)
/* 000036A0 38000003 */ li r0, 3
/* 000036A4 7CA50774 */ extsb r5, r5
/* 000036A8 98610010 */ stb r3, 0x10(r1)
/* 000036AC 98A10014 */ stb r5, 0x14(r1)
/* 000036B0 98810015 */ stb r4, 0x15(r1)
/* 000036B4 98010011 */ stb r0, 0x11(r1)
/* 000036B8 98810016 */ stb r4, 0x16(r1)
/* 000036BC 98010012 */ stb r0, 0x12(r1)
/* 000036C0 98810017 */ stb r4, 0x17(r1)
/* 000036C4 98010013 */ stb r0, 0x13(r1)
/* 000036C8 4800013C */ b lbl_00003804
lbl_000036CC:
/* 000036CC 3C600000 */ lis r3, spritePoolInfo@ha
/* 000036D0 39630000 */ addi r11, r3, spritePoolInfo@l
/* 000036D4 38000004 */ li r0, 4
/* 000036D8 3C600000 */ lis r3, ballInfo@ha
/* 000036DC 7C0903A6 */ mtctr r0
/* 000036E0 399C000C */ addi r12, r28, 0xc
/* 000036E4 39030000 */ addi r8, r3, ballInfo@l
/* 000036E8 38CB0000 */ addi r6, r11, 0
/* 000036EC 392C0000 */ addi r9, r12, 0
/* 000036F0 38E10014 */ addi r7, r1, 0x14
/* 000036F4 39410010 */ addi r10, r1, 0x10
/* 000036F8 3B400000 */ li r26, 0
lbl_000036FC:
/* 000036FC 88060050 */ lbz r0, 0x50(r6)
/* 00003700 3B600000 */ li r27, 0
/* 00003704 7C000775 */ extsb. r0, r0
/* 00003708 40820010 */ bne lbl_00003718
/* 0000370C 3800FFFF */ li r0, -1
/* 00003710 98070000 */ stb r0, 0(r7)
/* 00003714 48000014 */ b lbl_00003728
lbl_00003718:
/* 00003718 806800FC */ lwz r3, 0xfc(r8)
/* 0000371C 80030010 */ lwz r0, 0x10(r3)
/* 00003720 7C000774 */ extsb r0, r0
/* 00003724 98070000 */ stb r0, 0(r7)
lbl_00003728:
/* 00003728 38000000 */ li r0, 0
/* 0000372C A8A90004 */ lha r5, 4(r9)
/* 00003730 7C00D000 */ cmpw r0, r26
/* 00003734 41820020 */ beq lbl_00003754
/* 00003738 880B0050 */ lbz r0, 0x50(r11)
/* 0000373C 7C000775 */ extsb. r0, r0
/* 00003740 41820014 */ beq lbl_00003754
/* 00003744 A80C0004 */ lha r0, 4(r12)
/* 00003748 7C050000 */ cmpw r5, r0
/* 0000374C 40800008 */ bge lbl_00003754
/* 00003750 3B600001 */ li r27, 1
lbl_00003754:
/* 00003754 38000001 */ li r0, 1
/* 00003758 7C00D000 */ cmpw r0, r26
/* 0000375C 386B0001 */ addi r3, r11, 1
/* 00003760 388C004C */ addi r4, r12, 0x4c
/* 00003764 41820020 */ beq lbl_00003784
/* 00003768 88030050 */ lbz r0, 0x50(r3)
/* 0000376C 7C000775 */ extsb. r0, r0
/* 00003770 41820014 */ beq lbl_00003784
/* 00003774 A8040004 */ lha r0, 4(r4)
/* 00003778 7C050000 */ cmpw r5, r0
/* 0000377C 40800008 */ bge lbl_00003784
/* 00003780 3B7B0001 */ addi r27, r27, 1
lbl_00003784:
/* 00003784 38000002 */ li r0, 2
/* 00003788 7C00D000 */ cmpw r0, r26
/* 0000378C 38630001 */ addi r3, r3, 1
/* 00003790 3884004C */ addi r4, r4, 0x4c
/* 00003794 41820020 */ beq lbl_000037B4
/* 00003798 88030050 */ lbz r0, 0x50(r3)
/* 0000379C 7C000775 */ extsb. r0, r0
/* 000037A0 41820014 */ beq lbl_000037B4
/* 000037A4 A8040004 */ lha r0, 4(r4)
/* 000037A8 7C050000 */ cmpw r5, r0
/* 000037AC 40800008 */ bge lbl_000037B4
/* 000037B0 3B7B0001 */ addi r27, r27, 1
lbl_000037B4:
/* 000037B4 38000003 */ li r0, 3
/* 000037B8 7C00D000 */ cmpw r0, r26
/* 000037BC 38630001 */ addi r3, r3, 1
/* 000037C0 3884004C */ addi r4, r4, 0x4c
/* 000037C4 41820020 */ beq lbl_000037E4
/* 000037C8 88030050 */ lbz r0, 0x50(r3)
/* 000037CC 7C000775 */ extsb. r0, r0
/* 000037D0 41820014 */ beq lbl_000037E4
/* 000037D4 A8040004 */ lha r0, 4(r4)
/* 000037D8 7C050000 */ cmpw r5, r0
/* 000037DC 40800008 */ bge lbl_000037E4
/* 000037E0 3B7B0001 */ addi r27, r27, 1
lbl_000037E4:
/* 000037E4 9B6A0000 */ stb r27, 0(r10)
/* 000037E8 38C60001 */ addi r6, r6, 1
/* 000037EC 38E70001 */ addi r7, r7, 1
/* 000037F0 390801A4 */ addi r8, r8, 0x1a4
/* 000037F4 3929004C */ addi r9, r9, 0x4c
/* 000037F8 394A0001 */ addi r10, r10, 1
/* 000037FC 3B5A0001 */ addi r26, r26, 1
/* 00003800 4200FEFC */ bdnz lbl_000036FC
lbl_00003804:
/* 00003804 4BFFC95D */ bl event_finish_all
/* 00003808 38600013 */ li r3, 0x13
/* 0000380C 4BFFC955 */ bl event_start
/* 00003810 3860000F */ li r3, 0xf
/* 00003814 4BFFC94D */ bl event_start
/* 00003818 38600012 */ li r3, 0x12
/* 0000381C 4BFFC945 */ bl event_start
/* 00003820 38600010 */ li r3, 0x10
/* 00003824 4BFFC93D */ bl event_start
/* 00003828 38600001 */ li r3, 1
/* 0000382C 4BFFC935 */ bl event_start
/* 00003830 38600014 */ li r3, 0x14
/* 00003834 4BFFC92D */ bl event_start
/* 00003838 386000B3 */ li r3, 0xb3
/* 0000383C 4BFFC925 */ bl func_80021DB4
/* 00003840 4BFFC921 */ bl func_800972CC
/* 00003844 38000002 */ li r0, 2
/* 00003848 981E000A */ stb r0, 0xa(r30)
/* 0000384C 38000000 */ li r0, 0
/* 00003850 38E00000 */ li r7, 0
/* 00003854 B01C0142 */ sth r0, 0x142(r28)
/* 00003858 801F0000 */ lwz r0, 0(r31)
/* 0000385C 2C000001 */ cmpwi r0, 1
/* 00003860 40820010 */ bne lbl_00003870
/* 00003864 88010014 */ lbz r0, 0x14(r1)
/* 00003868 981C0148 */ stb r0, 0x148(r28)
/* 0000386C 480000AC */ b lbl_00003918
lbl_00003870:
/* 00003870 88C10014 */ lbz r6, 0x14(r1)
/* 00003874 38610014 */ addi r3, r1, 0x14
/* 00003878 38810010 */ addi r4, r1, 0x10
/* 0000387C 7CC00774 */ extsb r0, r6
/* 00003880 2C00FFFF */ cmpwi r0, -1
/* 00003884 38BC0148 */ addi r5, r28, 0x148
/* 00003888 41820018 */ beq lbl_000038A0
/* 0000388C 88010010 */ lbz r0, 0x10(r1)
/* 00003890 7C000775 */ extsb. r0, r0
/* 00003894 4082000C */ bne lbl_000038A0
/* 00003898 98C50000 */ stb r6, 0(r5)
/* 0000389C 38A50001 */ addi r5, r5, 1
lbl_000038A0:
/* 000038A0 8CC30001 */ lbzu r6, 1(r3)
/* 000038A4 38840001 */ addi r4, r4, 1
/* 000038A8 7CC00774 */ extsb r0, r6
/* 000038AC 2C00FFFF */ cmpwi r0, -1
/* 000038B0 4182001C */ beq lbl_000038CC
/* 000038B4 88040000 */ lbz r0, 0(r4)
/* 000038B8 7C000775 */ extsb. r0, r0
/* 000038BC 40820010 */ bne lbl_000038CC
/* 000038C0 98C50000 */ stb r6, 0(r5)
/* 000038C4 38E00001 */ li r7, 1
/* 000038C8 38A50001 */ addi r5, r5, 1
lbl_000038CC:
/* 000038CC 8CC30001 */ lbzu r6, 1(r3)
/* 000038D0 38840001 */ addi r4, r4, 1
/* 000038D4 7CC00774 */ extsb r0, r6
/* 000038D8 2C00FFFF */ cmpwi r0, -1
/* 000038DC 41820018 */ beq lbl_000038F4
/* 000038E0 88040000 */ lbz r0, 0(r4)
/* 000038E4 7C000775 */ extsb. r0, r0
/* 000038E8 4082000C */ bne lbl_000038F4
/* 000038EC 98C50000 */ stb r6, 0(r5)
/* 000038F0 38A50001 */ addi r5, r5, 1
lbl_000038F4:
/* 000038F4 88C30001 */ lbz r6, 1(r3)
/* 000038F8 38840001 */ addi r4, r4, 1
/* 000038FC 7CC00774 */ extsb r0, r6
/* 00003900 2C00FFFF */ cmpwi r0, -1
/* 00003904 41820014 */ beq lbl_00003918
/* 00003908 88040000 */ lbz r0, 0(r4)
/* 0000390C 7C000775 */ extsb. r0, r0
/* 00003910 40820008 */ bne lbl_00003918
/* 00003914 98C50000 */ stb r6, 0(r5)
lbl_00003918:
/* 00003918 3BE00000 */ li r31, 0
/* 0000391C 3C600000 */ lis r3, lbl_801EEC68@ha
/* 00003920 9BFC014C */ stb r31, 0x14c(r28)
/* 00003924 38A30000 */ addi r5, r3, lbl_801EEC68@l
/* 00003928 80050004 */ lwz r0, 4(r5)
/* 0000392C 38610014 */ addi r3, r1, 0x14
/* 00003930 38810010 */ addi r4, r1, 0x10
/* 00003934 60000002 */ ori r0, r0, 2
/* 00003938 90050004 */ stw r0, 4(r5)
/* 0000393C 4BFFC825 */ bl func_8009C5E4
/* 00003940 38600000 */ li r3, 0
/* 00003944 4BFFC81D */ bl func_8009DDC4
/* 00003948 38608000 */ li r3, -32768
/* 0000394C 4BFFC815 */ bl mathutil_mtxA_from_rotate_y
/* 00003950 C03D1F68 */ lfs f1, 0x1f68(r29)
/* 00003954 C05D1F6C */ lfs f2, 0x1f6c(r29)
/* 00003958 C07D1F70 */ lfs f3, 0x1f70(r29)
/* 0000395C 4BFFC805 */ bl mathutil_mtxA_translate_xyz
/* 00003960 3C600000 */ lis r3, mathutilData@ha
/* 00003964 38630000 */ addi r3, r3, mathutilData@l
/* 00003968 80630000 */ lwz r3, 0(r3)
/* 0000396C 4BFFC7F5 */ bl func_8009DB40
/* 00003970 3860003D */ li r3, 0x3d
/* 00003974 4BFFC7ED */ bl camera_set_state
/* 00003978 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000397C 39030000 */ addi r8, r3, currentCameraStructPtr@l
/* 00003980 3C600000 */ lis r3, cameraInfo@ha
/* 00003984 81480000 */ lwz r10, 0(r8)
/* 00003988 38630000 */ addi r3, r3, cameraInfo@l
/* 0000398C 90680000 */ stw r3, 0(r8)
/* 00003990 38C0000A */ li r6, 0xa
/* 00003994 3C800000 */ lis r4, lbl_80206DEC@ha
/* 00003998 98C3001F */ stb r6, 0x1f(r3)
/* 0000399C 39230284 */ addi r9, r3, 0x284
/* 000039A0 38E40000 */ addi r7, r4, lbl_80206DEC@l
/* 000039A4 91280000 */ stw r9, 0(r8)
/* 000039A8 3C600000 */ lis r3, modeCtrl@ha
/* 000039AC 38A30000 */ addi r5, r3, modeCtrl@l
/* 000039B0 98C9001F */ stb r6, 0x1f(r9)
/* 000039B4 39290284 */ addi r9, r9, 0x284
/* 000039B8 38802710 */ li r4, 0x2710
/* 000039BC 91280000 */ stw r9, 0(r8)
/* 000039C0 38600200 */ li r3, 0x200
/* 000039C4 38001000 */ li r0, 0x1000
/* 000039C8 98C9001F */ stb r6, 0x1f(r9)
/* 000039CC 39290284 */ addi r9, r9, 0x284
/* 000039D0 91280000 */ stw r9, 0(r8)
/* 000039D4 98C9001F */ stb r6, 0x1f(r9)
/* 000039D8 91480000 */ stw r10, 0(r8)
/* 000039DC 80C7001C */ lwz r6, 0x1c(r7)
/* 000039E0 60C60001 */ ori r6, r6, 1
/* 000039E4 90C7001C */ stw r6, 0x1c(r7)
/* 000039E8 93E70000 */ stw r31, 0(r7)
/* 000039EC 93E50000 */ stw r31, 0(r5)
/* 000039F0 909C0000 */ stw r4, 0(r28)
/* 000039F4 907E0000 */ stw r3, 0(r30)
/* 000039F8 901E0004 */ stw r0, 4(r30)
lbl_000039FC:
/* 000039FC BB410018 */ lmw r26, 0x18(r1)
/* 00003A00 80010034 */ lwz r0, 0x34(r1)
/* 00003A04 38210030 */ addi r1, r1, 0x30
/* 00003A08 7C0803A6 */ mtlr r0
/* 00003A0C 4E800020 */ blr 
lbl_00003A10:
/* 00003A10 7C0802A6 */ mflr r0
/* 00003A14 3C600000 */ lis r3, lbl_10000000@ha
/* 00003A18 90010004 */ stw r0, 4(r1)
/* 00003A1C 3C800000 */ lis r4, lbl_00014F20@ha
/* 00003A20 9421FFC8 */ stwu r1, -0x38(r1)
/* 00003A24 93E10034 */ stw r31, 0x34(r1)
/* 00003A28 3BE40000 */ addi r31, r4, lbl_00014F20@l
/* 00003A2C 93C10030 */ stw r30, 0x30(r1)
/* 00003A30 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00003A34 93A1002C */ stw r29, 0x2c(r1)
/* 00003A38 A87E0142 */ lha r3, 0x142(r30)
/* 00003A3C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00003A40 B01E0142 */ sth r0, 0x142(r30)
/* 00003A44 A81E0142 */ lha r0, 0x142(r30)
/* 00003A48 2C000000 */ cmpwi r0, 0
/* 00003A4C 418100E8 */ bgt lbl_00003B34
/* 00003A50 4BFFC711 */ bl rand
/* 00003A54 546306BE */ clrlwi r3, r3, 0x1a
/* 00003A58 3803002D */ addi r0, r3, 0x2d
/* 00003A5C B01E0142 */ sth r0, 0x142(r30)
/* 00003A60 887F000A */ lbz r3, 0xa(r31)
/* 00003A64 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00003A68 981F000A */ stb r0, 0xa(r31)
/* 00003A6C 881F000A */ lbz r0, 0xa(r31)
/* 00003A70 7C000775 */ extsb. r0, r0
/* 00003A74 418100B0 */ bgt lbl_00003B24
/* 00003A78 881E014C */ lbz r0, 0x14c(r30)
/* 00003A7C 7C000774 */ extsb r0, r0
/* 00003A80 7C7E0214 */ add r3, r30, r0
/* 00003A84 88030148 */ lbz r0, 0x148(r3)
/* 00003A88 7C000774 */ extsb r0, r0
/* 00003A8C 2C000002 */ cmpwi r0, 2
/* 00003A90 4182003C */ beq lbl_00003ACC
/* 00003A94 40800014 */ bge lbl_00003AA8
/* 00003A98 2C000000 */ cmpwi r0, 0
/* 00003A9C 41820018 */ beq lbl_00003AB4
/* 00003AA0 40800020 */ bge lbl_00003AC0
/* 00003AA4 4800003C */ b lbl_00003AE0
lbl_00003AA8:
/* 00003AA8 2C000004 */ cmpwi r0, 4
/* 00003AAC 40800034 */ bge lbl_00003AE0
/* 00003AB0 48000028 */ b lbl_00003AD8
lbl_00003AB4:
/* 00003AB4 38600000 */ li r3, 0
/* 00003AB8 480064A9 */ bl lbl_00009F60
/* 00003ABC 48000024 */ b lbl_00003AE0
lbl_00003AC0:
/* 00003AC0 38600001 */ li r3, 1
/* 00003AC4 4800649D */ bl lbl_00009F60
/* 00003AC8 48000018 */ b lbl_00003AE0
lbl_00003ACC:
/* 00003ACC 38600002 */ li r3, 2
/* 00003AD0 48006491 */ bl lbl_00009F60
/* 00003AD4 4800000C */ b lbl_00003AE0
lbl_00003AD8:
/* 00003AD8 38600003 */ li r3, 3
/* 00003ADC 48006485 */ bl lbl_00009F60
lbl_00003AE0:
/* 00003AE0 887E014C */ lbz r3, 0x14c(r30)
/* 00003AE4 38030001 */ addi r0, r3, 1
/* 00003AE8 981E014C */ stb r0, 0x14c(r30)
/* 00003AEC 881E014C */ lbz r0, 0x14c(r30)
/* 00003AF0 7C040774 */ extsb r4, r0
/* 00003AF4 7C7E2214 */ add r3, r30, r4
/* 00003AF8 88030148 */ lbz r0, 0x148(r3)
/* 00003AFC 7C000774 */ extsb r0, r0
/* 00003B00 2C00FFFF */ cmpwi r0, -1
/* 00003B04 4182000C */ beq lbl_00003B10
/* 00003B08 2C040004 */ cmpwi r4, 4
/* 00003B0C 4180000C */ blt lbl_00003B18
lbl_00003B10:
/* 00003B10 38000000 */ li r0, 0
/* 00003B14 981E014C */ stb r0, 0x14c(r30)
lbl_00003B18:
/* 00003B18 38000008 */ li r0, 8
/* 00003B1C 981F000A */ stb r0, 0xa(r31)
/* 00003B20 48000014 */ b lbl_00003B34
lbl_00003B24:
/* 00003B24 4BFFC63D */ bl rand
/* 00003B28 546307FE */ clrlwi r3, r3, 0x1f
/* 00003B2C 38630004 */ addi r3, r3, 4
/* 00003B30 48006431 */ bl lbl_00009F60
lbl_00003B34:
/* 00003B34 48005F75 */ bl lbl_00009AA8
/* 00003B38 48003C41 */ bl lbl_00007778
/* 00003B3C 2C030000 */ cmpwi r3, 0
/* 00003B40 418201C8 */ beq lbl_00003D08
/* 00003B44 4BFFC61D */ bl func_8009D794
/* 00003B48 2C030000 */ cmpwi r3, 0
/* 00003B4C 418201BC */ beq lbl_00003D08
/* 00003B50 801E0000 */ lwz r0, 0(r30)
/* 00003B54 2C002530 */ cmpwi r0, 0x2530
/* 00003B58 408001B0 */ bge lbl_00003D08
/* 00003B5C 4BFFC605 */ bl func_8009CC34
/* 00003B60 4BFFC601 */ bl event_finish_all
/* 00003B64 38600010 */ li r3, 0x10
/* 00003B68 4BFFC5F9 */ bl event_start
/* 00003B6C 38600012 */ li r3, 0x12
/* 00003B70 4BFFC5F1 */ bl event_start
/* 00003B74 3C600000 */ lis r3, lbl_801EEC90@ha
/* 00003B78 38A30000 */ addi r5, r3, lbl_801EEC90@l
/* 00003B7C 80050000 */ lwz r0, 0(r5)
/* 00003B80 3C800000 */ lis r4, spritePoolInfo@ha
/* 00003B84 38840000 */ addi r4, r4, spritePoolInfo@l
/* 00003B88 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00003B8C 90050000 */ stw r0, 0(r5)
/* 00003B90 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00003B94 38C10008 */ addi r6, r1, 8
/* 00003B98 80A4000C */ lwz r5, 0xc(r4)
/* 00003B9C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00003BA0 893E0006 */ lbz r9, 6(r30)
/* 00003BA4 38840000 */ addi r4, r4, playerCharacterSelection@l
/* 00003BA8 88050000 */ lbz r0, 0(r5)
/* 00003BAC 81030000 */ lwz r8, lbl_802F1BF0@l(r3)
/* 00003BB0 38FE000C */ addi r7, r30, 0xc
/* 00003BB4 7C000775 */ extsb. r0, r0
/* 00003BB8 7D290774 */ extsb r9, r9
/* 00003BBC 418200EC */ beq lbl_00003CA8
/* 00003BC0 80040000 */ lwz r0, 0(r4)
/* 00003BC4 2C080000 */ cmpwi r8, 0
/* 00003BC8 9801000B */ stb r0, 0xb(r1)
/* 00003BCC 40820014 */ bne lbl_00003BE0
/* 00003BD0 A0070004 */ lhz r0, 4(r7)
/* 00003BD4 3BA00009 */ li r29, 9
/* 00003BD8 B001000C */ sth r0, 0xc(r1)
/* 00003BDC 4800000C */ b lbl_00003BE8
lbl_00003BE0:
/* 00003BE0 3BA0000A */ li r29, 0xa
/* 00003BE4 B121000C */ sth r9, 0xc(r1)
lbl_00003BE8:
/* 00003BE8 8C050001 */ lbzu r0, 1(r5)
/* 00003BEC 38640004 */ addi r3, r4, 4
/* 00003BF0 38E7004C */ addi r7, r7, 0x4c
/* 00003BF4 7C000775 */ extsb. r0, r0
/* 00003BF8 38C60006 */ addi r6, r6, 6
/* 00003BFC 418200AC */ beq lbl_00003CA8
/* 00003C00 80030000 */ lwz r0, 0(r3)
/* 00003C04 2C080000 */ cmpwi r8, 0
/* 00003C08 98060003 */ stb r0, 3(r6)
/* 00003C0C 40820014 */ bne lbl_00003C20
/* 00003C10 A0070004 */ lhz r0, 4(r7)
/* 00003C14 3BA00009 */ li r29, 9
/* 00003C18 B0060004 */ sth r0, 4(r6)
/* 00003C1C 4800000C */ b lbl_00003C28
lbl_00003C20:
/* 00003C20 3BA0000A */ li r29, 0xa
/* 00003C24 B1260004 */ sth r9, 4(r6)
lbl_00003C28:
/* 00003C28 8C050001 */ lbzu r0, 1(r5)
/* 00003C2C 38E7004C */ addi r7, r7, 0x4c
/* 00003C30 38630004 */ addi r3, r3, 4
/* 00003C34 7C000775 */ extsb. r0, r0
/* 00003C38 38C60006 */ addi r6, r6, 6
/* 00003C3C 4182006C */ beq lbl_00003CA8
/* 00003C40 80030000 */ lwz r0, 0(r3)
/* 00003C44 2C080000 */ cmpwi r8, 0
/* 00003C48 98060003 */ stb r0, 3(r6)
/* 00003C4C 40820014 */ bne lbl_00003C60
/* 00003C50 A0070004 */ lhz r0, 4(r7)
/* 00003C54 3BA00009 */ li r29, 9
/* 00003C58 B0060004 */ sth r0, 4(r6)
/* 00003C5C 4800000C */ b lbl_00003C68
lbl_00003C60:
/* 00003C60 3BA0000A */ li r29, 0xa
/* 00003C64 B1260004 */ sth r9, 4(r6)
lbl_00003C68:
/* 00003C68 88050001 */ lbz r0, 1(r5)
/* 00003C6C 38E7004C */ addi r7, r7, 0x4c
/* 00003C70 38630004 */ addi r3, r3, 4
/* 00003C74 7C000775 */ extsb. r0, r0
/* 00003C78 38C60006 */ addi r6, r6, 6
/* 00003C7C 4182002C */ beq lbl_00003CA8
/* 00003C80 80030000 */ lwz r0, 0(r3)
/* 00003C84 2C080000 */ cmpwi r8, 0
/* 00003C88 98060003 */ stb r0, 3(r6)
/* 00003C8C 40820014 */ bne lbl_00003CA0
/* 00003C90 A0070004 */ lhz r0, 4(r7)
/* 00003C94 3BA00009 */ li r29, 9
/* 00003C98 B0060004 */ sth r0, 4(r6)
/* 00003C9C 4800000C */ b lbl_00003CA8
lbl_00003CA0:
/* 00003CA0 3BA0000A */ li r29, 0xa
/* 00003CA4 B1260004 */ sth r9, 4(r6)
lbl_00003CA8:
/* 00003CA8 3C600000 */ lis r3, modeCtrl@ha
/* 00003CAC 38630000 */ addi r3, r3, modeCtrl@l
/* 00003CB0 80A30024 */ lwz r5, 0x24(r3)
/* 00003CB4 387D0000 */ addi r3, r29, 0
/* 00003CB8 38810008 */ addi r4, r1, 8
/* 00003CBC 4BFFC4A5 */ bl func_800AC43C
/* 00003CC0 2C030000 */ cmpwi r3, 0
/* 00003CC4 41820014 */ beq lbl_00003CD8
/* 00003CC8 387D0000 */ addi r3, r29, 0
/* 00003CCC 38800001 */ li r4, 1
/* 00003CD0 4BFFC491 */ bl func_800AB2A0
/* 00003CD4 48000010 */ b lbl_00003CE4
lbl_00003CD8:
/* 00003CD8 387D0000 */ addi r3, r29, 0
/* 00003CDC 38800000 */ li r4, 0
/* 00003CE0 4BFFC481 */ bl func_800AB2A0
lbl_00003CE4:
/* 00003CE4 3C600000 */ lis r3, modeCtrl@ha
/* 00003CE8 38000000 */ li r0, 0
/* 00003CEC 90030000 */ stw r0, modeCtrl@l(r3)
/* 00003CF0 38002710 */ li r0, 0x2710
/* 00003CF4 38600400 */ li r3, 0x400
/* 00003CF8 901E0000 */ stw r0, 0(r30)
/* 00003CFC 38002000 */ li r0, 0x2000
/* 00003D00 907F0000 */ stw r3, 0(r31)
/* 00003D04 901F0004 */ stw r0, 4(r31)
lbl_00003D08:
/* 00003D08 8001003C */ lwz r0, 0x3c(r1)
/* 00003D0C 83E10034 */ lwz r31, 0x34(r1)
/* 00003D10 83C10030 */ lwz r30, 0x30(r1)
/* 00003D14 7C0803A6 */ mtlr r0
/* 00003D18 83A1002C */ lwz r29, 0x2c(r1)
/* 00003D1C 38210038 */ addi r1, r1, 0x38
/* 00003D20 4E800020 */ blr 
lbl_00003D24:
/* 00003D24 7C0802A6 */ mflr r0
/* 00003D28 3C600000 */ lis r3, modeCtrl@ha
/* 00003D2C 90010004 */ stw r0, 4(r1)
/* 00003D30 9421FFF0 */ stwu r1, -0x10(r1)
/* 00003D34 93E1000C */ stw r31, 0xc(r1)
/* 00003D38 3BE30000 */ addi r31, r3, modeCtrl@l
/* 00003D3C 807F0000 */ lwz r3, 0(r31)
/* 00003D40 2C030000 */ cmpwi r3, 0
/* 00003D44 40820050 */ bne lbl_00003D94
/* 00003D48 48003A31 */ bl lbl_00007778
/* 00003D4C 2C030000 */ cmpwi r3, 0
/* 00003D50 4182005C */ beq lbl_00003DAC
/* 00003D54 4BFFC40D */ bl func_800AB6F8
/* 00003D58 2C030000 */ cmpwi r3, 0
/* 00003D5C 40820050 */ bne lbl_00003DAC
/* 00003D60 386000D1 */ li r3, 0xd1
/* 00003D64 4BFFC3FD */ bl g_play_sound
/* 00003D68 3800003C */ li r0, 0x3c
/* 00003D6C 3C600100 */ lis r3, 0x100
/* 00003D70 901F0000 */ stw r0, 0(r31)
/* 00003D74 3883FFFF */ addi r4, r3, -1  ;# fixed addi
/* 00003D78 38600101 */ li r3, 0x101
/* 00003D7C 38A0003C */ li r5, 0x3c
/* 00003D80 4BFFC3E1 */ bl g_start_screen_fade
/* 00003D84 3860003C */ li r3, 0x3c
/* 00003D88 38800002 */ li r4, 2
/* 00003D8C 4BFFC3D5 */ bl g_play_music
/* 00003D90 4800001C */ b lbl_00003DAC
lbl_00003D94:
/* 00003D94 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00003D98 901F0000 */ stw r0, 0(r31)
/* 00003D9C 40820010 */ bne lbl_00003DAC
/* 00003DA0 4BFFC3C1 */ bl func_800AB444
/* 00003DA4 807F0028 */ lwz r3, 0x28(r31)
/* 00003DA8 4BFFC3B9 */ bl func_80012434
lbl_00003DAC:
/* 00003DAC 80010014 */ lwz r0, 0x14(r1)
/* 00003DB0 83E1000C */ lwz r31, 0xc(r1)
/* 00003DB4 38210010 */ addi r1, r1, 0x10
/* 00003DB8 7C0803A6 */ mtlr r0
/* 00003DBC 4E800020 */ blr 
lbl_00003DC0:
/* 00003DC0 7C0802A6 */ mflr r0
/* 00003DC4 3C600000 */ lis r3, lbl_10000000@ha
/* 00003DC8 90010004 */ stw r0, 4(r1)
/* 00003DCC 38000001 */ li r0, 1
/* 00003DD0 9421FFF0 */ stwu r1, -0x10(r1)
/* 00003DD4 93E1000C */ stw r31, 0xc(r1)
/* 00003DD8 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00003DDC 93C10008 */ stw r30, 8(r1)
/* 00003DE0 3BDF0007 */ addi r30, r31, 7
/* 00003DE4 889F0007 */ lbz r4, 7(r31)
/* 00003DE8 A07F0004 */ lhz r3, 4(r31)
/* 00003DEC 7C840774 */ extsb r4, r4
/* 00003DF0 7C002030 */ slw r0, r0, r4
/* 00003DF4 7C600039 */ and. r0, r3, r0
/* 00003DF8 38640000 */ addi r3, r4, 0
/* 00003DFC 418200C8 */ beq lbl_00003EC4
/* 00003E00 38630001 */ addi r3, r3, 1
/* 00003E04 2803000A */ cmplwi r3, 0xa
/* 00003E08 2C000000 */ cmpwi r0, 0
/* 00003E0C 38640000 */ addi r3, r4, 0
/* 00003E10 418200B4 */ beq lbl_00003EC4
/* 00003E14 38630001 */ addi r3, r3, 1
/* 00003E18 2803000A */ cmplwi r3, 0xa
/* 00003E1C 2C000000 */ cmpwi r0, 0
/* 00003E20 38640000 */ addi r3, r4, 0
/* 00003E24 418200A0 */ beq lbl_00003EC4
/* 00003E28 38630001 */ addi r3, r3, 1
/* 00003E2C 2803000A */ cmplwi r3, 0xa
/* 00003E30 2C000000 */ cmpwi r0, 0
/* 00003E34 38640000 */ addi r3, r4, 0
/* 00003E38 4182008C */ beq lbl_00003EC4
/* 00003E3C 38630001 */ addi r3, r3, 1
/* 00003E40 2803000A */ cmplwi r3, 0xa
/* 00003E44 2C000000 */ cmpwi r0, 0
/* 00003E48 38640000 */ addi r3, r4, 0
/* 00003E4C 41820078 */ beq lbl_00003EC4
/* 00003E50 38630001 */ addi r3, r3, 1
/* 00003E54 2803000A */ cmplwi r3, 0xa
/* 00003E58 2C000000 */ cmpwi r0, 0
/* 00003E5C 38640000 */ addi r3, r4, 0
/* 00003E60 41820064 */ beq lbl_00003EC4
/* 00003E64 38630001 */ addi r3, r3, 1
/* 00003E68 2803000A */ cmplwi r3, 0xa
/* 00003E6C 2C000000 */ cmpwi r0, 0
/* 00003E70 38640000 */ addi r3, r4, 0
/* 00003E74 41820050 */ beq lbl_00003EC4
/* 00003E78 38630001 */ addi r3, r3, 1
/* 00003E7C 2803000A */ cmplwi r3, 0xa
/* 00003E80 2C000000 */ cmpwi r0, 0
/* 00003E84 38640000 */ addi r3, r4, 0
/* 00003E88 4182003C */ beq lbl_00003EC4
/* 00003E8C 38630001 */ addi r3, r3, 1
/* 00003E90 2803000A */ cmplwi r3, 0xa
/* 00003E94 2C000000 */ cmpwi r0, 0
/* 00003E98 38640000 */ addi r3, r4, 0
/* 00003E9C 41820028 */ beq lbl_00003EC4
/* 00003EA0 38630001 */ addi r3, r3, 1
/* 00003EA4 2803000A */ cmplwi r3, 0xa
/* 00003EA8 2C000000 */ cmpwi r0, 0
/* 00003EAC 38640000 */ addi r3, r4, 0
/* 00003EB0 41820014 */ beq lbl_00003EC4
/* 00003EB4 38630001 */ addi r3, r3, 1
/* 00003EB8 2803000A */ cmplwi r3, 0xa
/* 00003EBC 41800008 */ blt lbl_00003EC4
/* 00003EC0 38600000 */ li r3, 0
lbl_00003EC4:
/* 00003EC4 7C600774 */ extsb r0, r3
/* 00003EC8 981E0000 */ stb r0, 0(r30)
/* 00003ECC 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00003ED0 3CC00000 */ lis r6, controllerInfo@ha
/* 00003ED4 80A40000 */ lwz r5, currentBallStructPtr@l(r4)
/* 00003ED8 3C800000 */ lis r4, lbl_80206BD0@ha
/* 00003EDC 38040000 */ addi r0, r4, lbl_80206BD0@l
/* 00003EE0 88A5002E */ lbz r5, 0x2e(r5)
/* 00003EE4 38C60000 */ addi r6, r6, controllerInfo@l
/* 00003EE8 7CA40774 */ extsb r4, r5
/* 00003EEC 5484103A */ slwi r4, r4, 2
/* 00003EF0 7C802214 */ add r4, r0, r4
/* 00003EF4 80A40000 */ lwz r5, 0(r4)
/* 00003EF8 1C05003C */ mulli r0, r5, 0x3c
/* 00003EFC 7C860214 */ add r4, r6, r0
/* 00003F00 A0C40030 */ lhz r6, 0x30(r4)
/* 00003F04 54C007BD */ rlwinm. r0, r6, 0, 0x1e, 0x1e
/* 00003F08 40820020 */ bne lbl_00003F28
/* 00003F0C 1C05000A */ mulli r0, r5, 0xa
/* 00003F10 3C800000 */ lis r4, analogButtonInfo@ha
/* 00003F14 38840000 */ addi r4, r4, analogButtonInfo@l
/* 00003F18 7C840214 */ add r4, r4, r0
/* 00003F1C A0840008 */ lhz r4, 8(r4)
/* 00003F20 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00003F24 41820134 */ beq lbl_00004058
lbl_00003F28:
/* 00003F28 38630001 */ addi r3, r3, 1
/* 00003F2C A0BF0004 */ lhz r5, 4(r31)
/* 00003F30 2803000A */ cmplwi r3, 0xa
/* 00003F34 38800001 */ li r4, 1
/* 00003F38 41800008 */ blt lbl_00003F40
/* 00003F3C 38600000 */ li r3, 0
lbl_00003F40:
/* 00003F40 7C801830 */ slw r0, r4, r3
/* 00003F44 7CA00039 */ and. r0, r5, r0
/* 00003F48 418200FC */ beq lbl_00004044
/* 00003F4C 38630001 */ addi r3, r3, 1
/* 00003F50 2803000A */ cmplwi r3, 0xa
/* 00003F54 41800008 */ blt lbl_00003F5C
/* 00003F58 38600000 */ li r3, 0
lbl_00003F5C:
/* 00003F5C 7C801830 */ slw r0, r4, r3
/* 00003F60 7CA00039 */ and. r0, r5, r0
/* 00003F64 418200E0 */ beq lbl_00004044
/* 00003F68 38630001 */ addi r3, r3, 1
/* 00003F6C 2803000A */ cmplwi r3, 0xa
/* 00003F70 41800008 */ blt lbl_00003F78
/* 00003F74 38600000 */ li r3, 0
lbl_00003F78:
/* 00003F78 7C801830 */ slw r0, r4, r3
/* 00003F7C 7CA00039 */ and. r0, r5, r0
/* 00003F80 418200C4 */ beq lbl_00004044
/* 00003F84 38630001 */ addi r3, r3, 1
/* 00003F88 2803000A */ cmplwi r3, 0xa
/* 00003F8C 41800008 */ blt lbl_00003F94
/* 00003F90 38600000 */ li r3, 0
lbl_00003F94:
/* 00003F94 7C801830 */ slw r0, r4, r3
/* 00003F98 7CA00039 */ and. r0, r5, r0
/* 00003F9C 418200A8 */ beq lbl_00004044
/* 00003FA0 38630001 */ addi r3, r3, 1
/* 00003FA4 2803000A */ cmplwi r3, 0xa
/* 00003FA8 41800008 */ blt lbl_00003FB0
/* 00003FAC 38600000 */ li r3, 0
lbl_00003FB0:
/* 00003FB0 7C801830 */ slw r0, r4, r3
/* 00003FB4 7CA00039 */ and. r0, r5, r0
/* 00003FB8 4182008C */ beq lbl_00004044
/* 00003FBC 38630001 */ addi r3, r3, 1
/* 00003FC0 2803000A */ cmplwi r3, 0xa
/* 00003FC4 41800008 */ blt lbl_00003FCC
/* 00003FC8 38600000 */ li r3, 0
lbl_00003FCC:
/* 00003FCC 7C801830 */ slw r0, r4, r3
/* 00003FD0 7CA00039 */ and. r0, r5, r0
/* 00003FD4 41820070 */ beq lbl_00004044
/* 00003FD8 38630001 */ addi r3, r3, 1
/* 00003FDC 2803000A */ cmplwi r3, 0xa
/* 00003FE0 41800008 */ blt lbl_00003FE8
/* 00003FE4 38600000 */ li r3, 0
lbl_00003FE8:
/* 00003FE8 7C801830 */ slw r0, r4, r3
/* 00003FEC 7CA00039 */ and. r0, r5, r0
/* 00003FF0 41820054 */ beq lbl_00004044
/* 00003FF4 38630001 */ addi r3, r3, 1
/* 00003FF8 2803000A */ cmplwi r3, 0xa
/* 00003FFC 41800008 */ blt lbl_00004004
/* 00004000 38600000 */ li r3, 0
lbl_00004004:
/* 00004004 7C801830 */ slw r0, r4, r3
/* 00004008 7CA00039 */ and. r0, r5, r0
/* 0000400C 41820038 */ beq lbl_00004044
/* 00004010 38630001 */ addi r3, r3, 1
/* 00004014 2803000A */ cmplwi r3, 0xa
/* 00004018 41800008 */ blt lbl_00004020
/* 0000401C 38600000 */ li r3, 0
lbl_00004020:
/* 00004020 7C801830 */ slw r0, r4, r3
/* 00004024 7CA00039 */ and. r0, r5, r0
/* 00004028 4182001C */ beq lbl_00004044
/* 0000402C 38630001 */ addi r3, r3, 1
/* 00004030 2803000A */ cmplwi r3, 0xa
/* 00004034 41800008 */ blt lbl_0000403C
/* 00004038 38600000 */ li r3, 0
lbl_0000403C:
/* 0000403C 7C801830 */ slw r0, r4, r3
/* 00004040 7CA00039 */ and. r0, r5, r0
lbl_00004044:
/* 00004044 7C600774 */ extsb r0, r3
/* 00004048 981E0000 */ stb r0, 0(r30)
/* 0000404C 3860006C */ li r3, 0x6c
/* 00004050 4BFFC111 */ bl g_play_sound
/* 00004054 480001A4 */ b lbl_000041F8
lbl_00004058:
/* 00004058 54C007FF */ clrlwi. r0, r6, 0x1f
/* 0000405C 4082000C */ bne lbl_00004068
/* 00004060 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004064 4182010C */ beq lbl_00004170
lbl_00004068:
/* 00004068 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 0000406C A0BF0004 */ lhz r5, 4(r31)
/* 00004070 38800001 */ li r4, 1
/* 00004074 40800008 */ bge lbl_0000407C
/* 00004078 38600009 */ li r3, 9
lbl_0000407C:
/* 0000407C 7C801830 */ slw r0, r4, r3
/* 00004080 7CA00039 */ and. r0, r5, r0
/* 00004084 418200D8 */ beq lbl_0000415C
/* 00004088 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 0000408C 40800008 */ bge lbl_00004094
/* 00004090 38600009 */ li r3, 9
lbl_00004094:
/* 00004094 7C801830 */ slw r0, r4, r3
/* 00004098 7CA00039 */ and. r0, r5, r0
/* 0000409C 418200C0 */ beq lbl_0000415C
/* 000040A0 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 000040A4 40800008 */ bge lbl_000040AC
/* 000040A8 38600009 */ li r3, 9
lbl_000040AC:
/* 000040AC 7C801830 */ slw r0, r4, r3
/* 000040B0 7CA00039 */ and. r0, r5, r0
/* 000040B4 418200A8 */ beq lbl_0000415C
/* 000040B8 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 000040BC 40800008 */ bge lbl_000040C4
/* 000040C0 38600009 */ li r3, 9
lbl_000040C4:
/* 000040C4 7C801830 */ slw r0, r4, r3
/* 000040C8 7CA00039 */ and. r0, r5, r0
/* 000040CC 41820090 */ beq lbl_0000415C
/* 000040D0 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 000040D4 40800008 */ bge lbl_000040DC
/* 000040D8 38600009 */ li r3, 9
lbl_000040DC:
/* 000040DC 7C801830 */ slw r0, r4, r3
/* 000040E0 7CA00039 */ and. r0, r5, r0
/* 000040E4 41820078 */ beq lbl_0000415C
/* 000040E8 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 000040EC 40800008 */ bge lbl_000040F4
/* 000040F0 38600009 */ li r3, 9
lbl_000040F4:
/* 000040F4 7C801830 */ slw r0, r4, r3
/* 000040F8 7CA00039 */ and. r0, r5, r0
/* 000040FC 41820060 */ beq lbl_0000415C
/* 00004100 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 00004104 40800008 */ bge lbl_0000410C
/* 00004108 38600009 */ li r3, 9
lbl_0000410C:
/* 0000410C 7C801830 */ slw r0, r4, r3
/* 00004110 7CA00039 */ and. r0, r5, r0
/* 00004114 41820048 */ beq lbl_0000415C
/* 00004118 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 0000411C 40800008 */ bge lbl_00004124
/* 00004120 38600009 */ li r3, 9
lbl_00004124:
/* 00004124 7C801830 */ slw r0, r4, r3
/* 00004128 7CA00039 */ and. r0, r5, r0
/* 0000412C 41820030 */ beq lbl_0000415C
/* 00004130 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 00004134 40800008 */ bge lbl_0000413C
/* 00004138 38600009 */ li r3, 9
lbl_0000413C:
/* 0000413C 7C801830 */ slw r0, r4, r3
/* 00004140 7CA00039 */ and. r0, r5, r0
/* 00004144 41820018 */ beq lbl_0000415C
/* 00004148 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 0000414C 40800008 */ bge lbl_00004154
/* 00004150 38600009 */ li r3, 9
lbl_00004154:
/* 00004154 7C801830 */ slw r0, r4, r3
/* 00004158 7CA00039 */ and. r0, r5, r0
lbl_0000415C:
/* 0000415C 7C600774 */ extsb r0, r3
/* 00004160 981E0000 */ stb r0, 0(r30)
/* 00004164 3860006C */ li r3, 0x6c
/* 00004168 4BFFBFF9 */ bl g_play_sound
/* 0000416C 4800008C */ b lbl_000041F8
lbl_00004170:
/* 00004170 54C00739 */ rlwinm. r0, r6, 0, 0x1c, 0x1c
/* 00004174 4082000C */ bne lbl_00004180
/* 00004178 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 0000417C 41820038 */ beq lbl_000041B4
lbl_00004180:
/* 00004180 3463FFFB */ addic. r3, r3, -5  ;# fixed addi
/* 00004184 40800008 */ bge lbl_0000418C
/* 00004188 3863000A */ addi r3, r3, 0xa
lbl_0000418C:
/* 0000418C 38000001 */ li r0, 1
/* 00004190 A09F0004 */ lhz r4, 4(r31)
/* 00004194 7C001830 */ slw r0, r0, r3
/* 00004198 7C800039 */ and. r0, r4, r0
/* 0000419C 4082000C */ bne lbl_000041A8
/* 000041A0 7C600774 */ extsb r0, r3
/* 000041A4 981E0000 */ stb r0, 0(r30)
lbl_000041A8:
/* 000041A8 3860006C */ li r3, 0x6c
/* 000041AC 4BFFBFB5 */ bl g_play_sound
/* 000041B0 48000048 */ b lbl_000041F8
lbl_000041B4:
/* 000041B4 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 000041B8 4082000C */ bne lbl_000041C4
/* 000041BC 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 000041C0 41820038 */ beq lbl_000041F8
lbl_000041C4:
/* 000041C4 38630005 */ addi r3, r3, 5
/* 000041C8 2803000A */ cmplwi r3, 0xa
/* 000041CC 41800008 */ blt lbl_000041D4
/* 000041D0 3863FFF6 */ addi r3, r3, -10  ;# fixed addi
lbl_000041D4:
/* 000041D4 38000001 */ li r0, 1
/* 000041D8 A09F0004 */ lhz r4, 4(r31)
/* 000041DC 7C001830 */ slw r0, r0, r3
/* 000041E0 7C800039 */ and. r0, r4, r0
/* 000041E4 4082000C */ bne lbl_000041F0
/* 000041E8 7C600774 */ extsb r0, r3
/* 000041EC 981E0000 */ stb r0, 0(r30)
lbl_000041F0:
/* 000041F0 3860006C */ li r3, 0x6c
/* 000041F4 4BFFBF6D */ bl g_play_sound
lbl_000041F8:
/* 000041F8 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000041FC 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 00004200 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00004204 3CA00000 */ lis r5, controllerInfo@ha
/* 00004208 8884002E */ lbz r4, 0x2e(r4)
/* 0000420C 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00004210 38A50000 */ addi r5, r5, controllerInfo@l
/* 00004214 7C830774 */ extsb r3, r4
/* 00004218 5463103A */ slwi r3, r3, 2
/* 0000421C 7C601A14 */ add r3, r0, r3
/* 00004220 80030000 */ lwz r0, 0(r3)
/* 00004224 1C00003C */ mulli r0, r0, 0x3c
/* 00004228 7C650214 */ add r3, r5, r0
/* 0000422C A0030018 */ lhz r0, 0x18(r3)
/* 00004230 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00004234 41820058 */ beq lbl_0000428C
/* 00004238 881E0000 */ lbz r0, 0(r30)
/* 0000423C 38600001 */ li r3, 1
/* 00004240 A09F0004 */ lhz r4, 4(r31)
/* 00004244 7C000774 */ extsb r0, r0
/* 00004248 7C600030 */ slw r0, r3, r0
/* 0000424C 7C800039 */ and. r0, r4, r0
/* 00004250 41820010 */ beq lbl_00004260
/* 00004254 3860006B */ li r3, 0x6b
/* 00004258 4BFFBF09 */ bl g_play_sound
/* 0000425C 48000030 */ b lbl_0000428C
lbl_00004260:
/* 00004260 3860006A */ li r3, 0x6a
/* 00004264 4BFFBEFD */ bl g_play_sound
/* 00004268 3C600000 */ lis r3, lbl_00014F20@ha
/* 0000426C 38830000 */ addi r4, r3, lbl_00014F20@l
/* 00004270 38001000 */ li r0, 0x1000
/* 00004274 90040000 */ stw r0, 0(r4)
/* 00004278 3C600000 */ lis r3, lbl_00014F24@ha
/* 0000427C 38000020 */ li r0, 0x20
/* 00004280 90030000 */ stw r0, lbl_00014F24@l(r3)
/* 00004284 38002710 */ li r0, 0x2710
/* 00004288 901F0000 */ stw r0, 0(r31)
lbl_0000428C:
/* 0000428C 80010014 */ lwz r0, 0x14(r1)
/* 00004290 83E1000C */ lwz r31, 0xc(r1)
/* 00004294 83C10008 */ lwz r30, 8(r1)
/* 00004298 7C0803A6 */ mtlr r0
/* 0000429C 38210010 */ addi r1, r1, 0x10
/* 000042A0 4E800020 */ blr 
lbl_000042A4:
/* 000042A4 7C0802A6 */ mflr r0
/* 000042A8 3C600000 */ lis r3, lbl_80206DEC@ha
/* 000042AC 90010004 */ stw r0, 4(r1)
/* 000042B0 38001770 */ li r0, 0x1770
/* 000042B4 3C800000 */ lis r4, lbl_10000000@ha
/* 000042B8 9421FFF0 */ stwu r1, -0x10(r1)
/* 000042BC 93E1000C */ stw r31, 0xc(r1)
/* 000042C0 93C10008 */ stw r30, 8(r1)
/* 000042C4 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 000042C8 90030000 */ stw r0, lbl_80206DEC@l(r3)
/* 000042CC 3C600000 */ lis r3, lbl_0000F020@ha
/* 000042D0 3BE30000 */ addi r31, r3, lbl_0000F020@l
/* 000042D4 48000A3D */ bl lbl_00004D10
/* 000042D8 387E013E */ addi r3, r30, 0x13e
/* 000042DC 48006AB1 */ bl lbl_0000AD8C
/* 000042E0 B07E013C */ sth r3, 0x13c(r30)
/* 000042E4 38E00000 */ li r7, 0
/* 000042E8 3CA00000 */ lis r5, currentBallStructPtr@ha
/* 000042EC 98FE013F */ stb r7, 0x13f(r30)
/* 000042F0 3C800000 */ lis r4, ballInfo@ha
/* 000042F4 38040000 */ addi r0, r4, ballInfo@l
/* 000042F8 3C600000 */ lis r3, spritePoolInfo@ha
/* 000042FC 98FE0140 */ stb r7, 0x140(r30)
/* 00004300 38C50000 */ addi r6, r5, currentBallStructPtr@l
/* 00004304 38A30000 */ addi r5, r3, spritePoolInfo@l
/* 00004308 81260000 */ lwz r9, 0(r6)
/* 0000430C 8145000C */ lwz r10, 0xc(r5)
/* 00004310 7C080378 */ mr r8, r0
/* 00004314 39600000 */ li r11, 0
/* 00004318 38800019 */ li r4, 0x19
/* 0000431C 4800002C */ b lbl_00004348
lbl_00004320:
/* 00004320 880A0000 */ lbz r0, 0(r10)
/* 00004324 2C000002 */ cmpwi r0, 2
/* 00004328 40820014 */ bne lbl_0000433C
/* 0000432C 91060000 */ stw r8, 0(r6)
/* 00004330 98880003 */ stb r4, 3(r8)
/* 00004334 80660000 */ lwz r3, 0(r6)
/* 00004338 98E30148 */ stb r7, 0x148(r3)
lbl_0000433C:
/* 0000433C 396B0001 */ addi r11, r11, 1
/* 00004340 390801A4 */ addi r8, r8, 0x1a4
/* 00004344 394A0001 */ addi r10, r10, 1
lbl_00004348:
/* 00004348 80050008 */ lwz r0, 8(r5)
/* 0000434C 7C0B0000 */ cmpw r11, r0
/* 00004350 4180FFD0 */ blt lbl_00004320
/* 00004354 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004358 91230000 */ stw r9, currentBallStructPtr@l(r3)
/* 0000435C 38000000 */ li r0, 0
/* 00004360 3860003C */ li r3, 0x3c
/* 00004364 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00004368 38800000 */ li r4, 0
/* 0000436C D01E0168 */ stfs f0, 0x168(r30)
/* 00004370 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00004374 D01E016C */ stfs f0, 0x16c(r30)
/* 00004378 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 0000437C D01E0170 */ stfs f0, 0x170(r30)
/* 00004380 B01E0174 */ sth r0, 0x174(r30)
/* 00004384 48009589 */ bl lbl_0000D90C
/* 00004388 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 0000438C 3C600000 */ lis r3, cameraInfo@ha
/* 00004390 3800003C */ li r0, 0x3c
/* 00004394 D01E0160 */ stfs f0, 0x160(r30)
/* 00004398 3CC00000 */ lis r6, lbl_00014F20@ha
/* 0000439C 38E00002 */ li r7, 2
/* 000043A0 C01F1DFC */ lfs f0, 0x1dfc(r31)
/* 000043A4 3CA00000 */ lis r5, lbl_00014F24@ha
/* 000043A8 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 000043AC D01E0164 */ stfs f0, 0x164(r30)
/* 000043B0 38630000 */ addi r3, r3, cameraInfo@l
/* 000043B4 901E0000 */ stw r0, 0(r30)
/* 000043B8 38004022 */ li r0, 0x4022
/* 000043BC 90E60000 */ stw r7, lbl_00014F20@l(r6)
/* 000043C0 38C30284 */ addi r6, r3, 0x284
/* 000043C4 90050000 */ stw r0, lbl_00014F24@l(r5)
/* 000043C8 84040000 */ lwzu r0, currentCameraStructPtr@l(r4)
/* 000043CC 90640000 */ stw r3, 0(r4)
/* 000043D0 98E3001F */ stb r7, 0x1f(r3)
/* 000043D4 90C40000 */ stw r6, 0(r4)
/* 000043D8 38C60284 */ addi r6, r6, 0x284
/* 000043DC 98E302A3 */ stb r7, 0x2a3(r3)
/* 000043E0 90C40000 */ stw r6, 0(r4)
/* 000043E4 98E6001F */ stb r7, 0x1f(r6)
/* 000043E8 38C60284 */ addi r6, r6, 0x284
/* 000043EC 90C40000 */ stw r6, 0(r4)
/* 000043F0 98E6001F */ stb r7, 0x1f(r6)
/* 000043F4 90040000 */ stw r0, 0(r4)
/* 000043F8 80010014 */ lwz r0, 0x14(r1)
/* 000043FC 83E1000C */ lwz r31, 0xc(r1)
/* 00004400 83C10008 */ lwz r30, 8(r1)
/* 00004404 7C0803A6 */ mtlr r0
/* 00004408 38210010 */ addi r1, r1, 0x10
/* 0000440C 4E800020 */ blr 
lbl_00004410:
/* 00004410 7C0802A6 */ mflr r0
/* 00004414 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004418 90010004 */ stw r0, 4(r1)
/* 0000441C 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00004420 3CA00000 */ lis r5, lbl_10000000@ha
/* 00004424 9421FFF0 */ stwu r1, -0x10(r1)
/* 00004428 3C800000 */ lis r4, lbl_00014F20@ha
/* 0000442C 93E1000C */ stw r31, 0xc(r1)
/* 00004430 3BE40000 */ addi r31, r4, lbl_00014F20@l
/* 00004434 93C10008 */ stw r30, 8(r1)
/* 00004438 3BC50000 */ addi r30, r5, lbl_10000000@l
/* 0000443C 80630000 */ lwz r3, 0(r3)
/* 00004440 80030094 */ lwz r0, 0x94(r3)
/* 00004444 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00004448 40820064 */ bne lbl_000044AC
/* 0000444C 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00004450 38A30000 */ addi r5, r3, currentCameraStructPtr@l
/* 00004454 3C600000 */ lis r3, cameraInfo@ha
/* 00004458 80E50000 */ lwz r7, 0(r5)
/* 0000445C 38630000 */ addi r3, r3, cameraInfo@l
/* 00004460 90650000 */ stw r3, 0(r5)
/* 00004464 38000005 */ li r0, 5
/* 00004468 38C30284 */ addi r6, r3, 0x284
/* 0000446C 9803001F */ stb r0, 0x1f(r3)
/* 00004470 389F0310 */ addi r4, r31, 0x310
/* 00004474 386000B4 */ li r3, 0xb4
/* 00004478 90C50000 */ stw r6, 0(r5)
/* 0000447C 9806001F */ stb r0, 0x1f(r6)
/* 00004480 38C60284 */ addi r6, r6, 0x284
/* 00004484 90C50000 */ stw r6, 0(r5)
/* 00004488 9806001F */ stb r0, 0x1f(r6)
/* 0000448C 38C60284 */ addi r6, r6, 0x284
/* 00004490 90C50000 */ stw r6, 0(r5)
/* 00004494 9806001F */ stb r0, 0x1f(r6)
/* 00004498 90E50000 */ stw r7, 0(r5)
/* 0000449C 480098B1 */ bl lbl_0000DD4C
/* 000044A0 380000F0 */ li r0, 0xf0
/* 000044A4 901E0000 */ stw r0, 0(r30)
/* 000044A8 48000118 */ b lbl_000045C0
lbl_000044AC:
/* 000044AC 881E013E */ lbz r0, 0x13e(r30)
/* 000044B0 7C000775 */ extsb. r0, r0
/* 000044B4 4082002C */ bne lbl_000044E0
/* 000044B8 386000A9 */ li r3, 0xa9
/* 000044BC 388000AA */ li r4, 0xaa
/* 000044C0 38A0012C */ li r5, 0x12c
/* 000044C4 4800318D */ bl lbl_00007650
/* 000044C8 386000B4 */ li r3, 0xb4
/* 000044CC 389F0338 */ addi r4, r31, 0x338
/* 000044D0 48009625 */ bl lbl_0000DAF4
/* 000044D4 386001CF */ li r3, 0x1cf
/* 000044D8 4BFFBC89 */ bl g_play_sound
/* 000044DC 48000028 */ b lbl_00004504
lbl_000044E0:
/* 000044E0 3860009F */ li r3, 0x9f
/* 000044E4 388000A0 */ li r4, 0xa0
/* 000044E8 38A000B4 */ li r5, 0xb4
/* 000044EC 48003165 */ bl lbl_00007650
/* 000044F0 386000B4 */ li r3, 0xb4
/* 000044F4 389F0340 */ addi r4, r31, 0x340
/* 000044F8 48009855 */ bl lbl_0000DD4C
/* 000044FC 386001CD */ li r3, 0x1cd
/* 00004500 4BFFBC61 */ bl g_play_sound
lbl_00004504:
/* 00004504 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00004508 3C600000 */ lis r3, spritePoolInfo@ha
/* 0000450C 38A40000 */ addi r5, r4, currentBallStructPtr@l
/* 00004510 38830000 */ addi r4, r3, spritePoolInfo@l
/* 00004514 80E50000 */ lwz r7, 0(r5)
/* 00004518 3C600000 */ lis r3, ballInfo@ha
/* 0000451C 8104000C */ lwz r8, 0xc(r4)
/* 00004520 38030000 */ addi r0, r3, ballInfo@l
/* 00004524 7C060378 */ mr r6, r0
/* 00004528 39200000 */ li r9, 0
/* 0000452C 38600003 */ li r3, 3
/* 00004530 48000024 */ b lbl_00004554
lbl_00004534:
/* 00004534 88080000 */ lbz r0, 0(r8)
/* 00004538 2C000002 */ cmpwi r0, 2
/* 0000453C 4082000C */ bne lbl_00004548
/* 00004540 90C50000 */ stw r6, 0(r5)
/* 00004544 98660148 */ stb r3, 0x148(r6)
lbl_00004548:
/* 00004548 39290001 */ addi r9, r9, 1
/* 0000454C 38C601A4 */ addi r6, r6, 0x1a4
/* 00004550 39080001 */ addi r8, r8, 1
lbl_00004554:
/* 00004554 80040008 */ lwz r0, 8(r4)
/* 00004558 7C090000 */ cmpw r9, r0
/* 0000455C 4180FFD8 */ blt lbl_00004534
/* 00004560 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004564 38830000 */ addi r4, r3, currentBallStructPtr@l
/* 00004568 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000456C 90E40000 */ stw r7, 0(r4)
/* 00004570 38A30000 */ addi r5, r3, currentCameraStructPtr@l
/* 00004574 3C600000 */ lis r3, cameraInfo@ha
/* 00004578 80E50000 */ lwz r7, 0(r5)
/* 0000457C 38830000 */ addi r4, r3, cameraInfo@l
/* 00004580 90850000 */ stw r4, 0(r5)
/* 00004584 38600006 */ li r3, 6
/* 00004588 38C40284 */ addi r6, r4, 0x284
/* 0000458C 9864001F */ stb r3, 0x1f(r4)
/* 00004590 38000168 */ li r0, 0x168
/* 00004594 90C50000 */ stw r6, 0(r5)
/* 00004598 38C60284 */ addi r6, r6, 0x284
/* 0000459C 986402A3 */ stb r3, 0x2a3(r4)
/* 000045A0 90C50000 */ stw r6, 0(r5)
/* 000045A4 9866001F */ stb r3, 0x1f(r6)
/* 000045A8 38C60284 */ addi r6, r6, 0x284
/* 000045AC 90C50000 */ stw r6, 0(r5)
/* 000045B0 9866001F */ stb r3, 0x1f(r6)
/* 000045B4 90E50000 */ stw r7, 0(r5)
/* 000045B8 901E0144 */ stw r0, 0x144(r30)
/* 000045BC 901E0000 */ stw r0, 0(r30)
lbl_000045C0:
/* 000045C0 38002000 */ li r0, 0x2000
/* 000045C4 901F0000 */ stw r0, 0(r31)
/* 000045C8 38000060 */ li r0, 0x60
/* 000045CC 901F0004 */ stw r0, 4(r31)
/* 000045D0 80010014 */ lwz r0, 0x14(r1)
/* 000045D4 83E1000C */ lwz r31, 0xc(r1)
/* 000045D8 83C10008 */ lwz r30, 8(r1)
/* 000045DC 38210010 */ addi r1, r1, 0x10
/* 000045E0 7C0803A6 */ mtlr r0
/* 000045E4 4E800020 */ blr 
lbl_000045E8:
/* 000045E8 7C0802A6 */ mflr r0
/* 000045EC 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000045F0 90010004 */ stw r0, 4(r1)
/* 000045F4 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 000045F8 3CA00000 */ lis r5, lbl_10000000@ha
/* 000045FC 9421FFE0 */ stwu r1, -0x20(r1)
/* 00004600 3C800000 */ lis r4, lbl_0000F020@ha
/* 00004604 93E1001C */ stw r31, 0x1c(r1)
/* 00004608 93C10018 */ stw r30, 0x18(r1)
/* 0000460C 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 00004610 93A10014 */ stw r29, 0x14(r1)
/* 00004614 3BA50000 */ addi r29, r5, lbl_10000000@l
/* 00004618 80630000 */ lwz r3, 0(r3)
/* 0000461C 80030094 */ lwz r0, 0x94(r3)
/* 00004620 3C600000 */ lis r3, lbl_00014F20@ha
/* 00004624 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00004628 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 0000462C 4082003C */ bne lbl_00004668
/* 00004630 801D0000 */ lwz r0, 0(r29)
/* 00004634 3C600000 */ lis r3, lbl_00010D58@ha
/* 00004638 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 0000463C 6C008000 */ xoris r0, r0, 0x8000
/* 00004640 C85E1F38 */ lfd f2, 0x1f38(r30)
/* 00004644 9001000C */ stw r0, 0xc(r1)
/* 00004648 3C004330 */ lis r0, 0x4330
/* 0000464C 90010008 */ stw r0, 8(r1)
/* 00004650 C8010008 */ lfd f0, 8(r1)
/* 00004654 FC000828 */ fsub f0, f0, f1
/* 00004658 FC020000 */ fcmpu cr0, f2, f0
/* 0000465C 4082000C */ bne lbl_00004668
/* 00004660 3860000C */ li r3, 0xc
/* 00004664 4BFFBAFD */ bl g_play_sound
lbl_00004668:
/* 00004668 3C600000 */ lis r3, lbl_80206DEC@ha
/* 0000466C 38830000 */ addi r4, r3, lbl_80206DEC@l
/* 00004670 80640000 */ lwz r3, 0(r4)
/* 00004674 2C032EE0 */ cmpwi r3, 0x2ee0
/* 00004678 4080000C */ bge lbl_00004684
/* 0000467C 38030014 */ addi r0, r3, 0x14
/* 00004680 90040000 */ stw r0, 0(r4)
lbl_00004684:
/* 00004684 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00004688 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 0000468C 2C002580 */ cmpwi r0, 0x2580
/* 00004690 40820008 */ bne lbl_00004698
/* 00004694 4800067D */ bl lbl_00004D10
lbl_00004698:
/* 00004698 3C600000 */ lis r3, lbl_80206DEC@ha
/* 0000469C 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 000046A0 2C002580 */ cmpwi r0, 0x2580
/* 000046A4 4180007C */ blt lbl_00004720
/* 000046A8 2C002A30 */ cmpwi r0, 0x2a30
/* 000046AC 40800074 */ bge lbl_00004720
/* 000046B0 2C0027D8 */ cmpwi r0, 0x27d8
/* 000046B4 40800050 */ bge lbl_00004704
/* 000046B8 200027D8 */ subfic r0, r0, 0x27d8
/* 000046BC C81E1F48 */ lfd f0, 0x1f48(r30)
/* 000046C0 6C008000 */ xoris r0, r0, 0x8000
/* 000046C4 C87E1F40 */ lfd f3, 0x1f40(r30)
/* 000046C8 9001000C */ stw r0, 0xc(r1)
/* 000046CC 3C004330 */ lis r0, 0x4330
/* 000046D0 3C600000 */ lis r3, lbl_00010D58@ha
/* 000046D4 90010008 */ stw r0, 8(r1)
/* 000046D8 3C800000 */ lis r4, movableStageParts@ha
/* 000046DC C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 000046E0 38640000 */ addi r3, r4, movableStageParts@l
/* 000046E4 C8210008 */ lfd f1, 8(r1)
/* 000046E8 FC211028 */ fsub f1, f1, f2
/* 000046EC C0430088 */ lfs f2, 0x88(r3)
/* 000046F0 FC421828 */ fsub f2, f2, f3
/* 000046F4 FC010024 */ fdiv f0, f1, f0
/* 000046F8 FC22002A */ fadd f1, f2, f0
/* 000046FC FC200818 */ frsp f1, f1
/* 00004700 4800001C */ b lbl_0000471C
lbl_00004704:
/* 00004704 3C600000 */ lis r3, movableStageParts@ha
/* 00004708 C81E1F40 */ lfd f0, 0x1f40(r30)
/* 0000470C 38630000 */ addi r3, r3, movableStageParts@l
/* 00004710 C0230088 */ lfs f1, 0x88(r3)
/* 00004714 FC210028 */ fsub f1, f1, f0
/* 00004718 FC200818 */ frsp f1, f1
lbl_0000471C:
/* 0000471C 48006991 */ bl lbl_0000B0AC
lbl_00004720:
/* 00004720 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00004724 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 00004728 2C001C20 */ cmpwi r0, 0x1c20
/* 0000472C 40820008 */ bne lbl_00004734
/* 00004730 480067E9 */ bl lbl_0000AF18
lbl_00004734:
/* 00004734 3C600000 */ lis r3, lbl_80206DEC@ha
/* 00004738 80030000 */ lwz r0, lbl_80206DEC@l(r3)
/* 0000473C 2C001C20 */ cmpwi r0, 0x1c20
/* 00004740 40810028 */ ble lbl_00004768
/* 00004744 2C002328 */ cmpwi r0, 0x2328
/* 00004748 40800020 */ bge lbl_00004768
/* 0000474C 3C600000 */ lis r3, movableStageParts@ha
/* 00004750 C81E1F50 */ lfd f0, 0x1f50(r30)
/* 00004754 38630000 */ addi r3, r3, movableStageParts@l
/* 00004758 C0230110 */ lfs f1, 0x110(r3)
/* 0000475C FC210028 */ fsub f1, f1, f0
/* 00004760 FC200818 */ frsp f1, f1
/* 00004764 48006A59 */ bl lbl_0000B1BC
lbl_00004768:
/* 00004768 80DD0000 */ lwz r6, 0(r29)
/* 0000476C 2C060000 */ cmpwi r6, 0
/* 00004770 4080000C */ bge lbl_0000477C
/* 00004774 38000001 */ li r0, 1
/* 00004778 480000CC */ b lbl_00004844
lbl_0000477C:
/* 0000477C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004780 80E30000 */ lwz r7, currentBallStructPtr@l(r3)
/* 00004784 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00004788 3CA00000 */ lis r5, controllerInfo@ha
/* 0000478C 8887002E */ lbz r4, 0x2e(r7)
/* 00004790 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00004794 38A50000 */ addi r5, r5, controllerInfo@l
/* 00004798 7C830774 */ extsb r3, r4
/* 0000479C 5463103A */ slwi r3, r3, 2
/* 000047A0 7C601A14 */ add r3, r0, r3
/* 000047A4 80030000 */ lwz r0, 0(r3)
/* 000047A8 1C00003C */ mulli r0, r0, 0x3c
/* 000047AC 7C650214 */ add r3, r5, r0
/* 000047B0 A0030018 */ lhz r0, 0x18(r3)
/* 000047B4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000047B8 4082000C */ bne lbl_000047C4
/* 000047BC 38000000 */ li r0, 0
/* 000047C0 48000084 */ b lbl_00004844
lbl_000047C4:
/* 000047C4 80070094 */ lwz r0, 0x94(r7)
/* 000047C8 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 000047CC 41820040 */ beq lbl_0000480C
/* 000047D0 6CC08000 */ xoris r0, r6, 0x8000
/* 000047D4 C81E1F58 */ lfd f0, 0x1f58(r30)
/* 000047D8 9001000C */ stw r0, 0xc(r1)
/* 000047DC 3C004330 */ lis r0, 0x4330
/* 000047E0 3C600000 */ lis r3, lbl_00010D58@ha
/* 000047E4 90010008 */ stw r0, 8(r1)
/* 000047E8 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 000047EC C8210008 */ lfd f1, 8(r1)
/* 000047F0 FC211028 */ fsub f1, f1, f2
/* 000047F4 FC010040 */ fcmpo cr0, f1, f0
/* 000047F8 4080000C */ bge lbl_00004804
/* 000047FC 38000001 */ li r0, 1
/* 00004800 48000044 */ b lbl_00004844
lbl_00004804:
/* 00004804 38000000 */ li r0, 0
/* 00004808 4800003C */ b lbl_00004844
lbl_0000480C:
/* 0000480C 6CC08000 */ xoris r0, r6, 0x8000
/* 00004810 C81E1F60 */ lfd f0, 0x1f60(r30)
/* 00004814 9001000C */ stw r0, 0xc(r1)
/* 00004818 3C004330 */ lis r0, 0x4330
/* 0000481C 3C600000 */ lis r3, lbl_00010D58@ha
/* 00004820 90010008 */ stw r0, 8(r1)
/* 00004824 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 00004828 C8210008 */ lfd f1, 8(r1)
/* 0000482C FC211028 */ fsub f1, f1, f2
/* 00004830 FC010040 */ fcmpo cr0, f1, f0
/* 00004834 4080000C */ bge lbl_00004840
/* 00004838 38000001 */ li r0, 1
/* 0000483C 48000008 */ b lbl_00004844
lbl_00004840:
/* 00004840 38000000 */ li r0, 0
lbl_00004844:
/* 00004844 2C000000 */ cmpwi r0, 0
/* 00004848 4182021C */ beq lbl_00004A64
/* 0000484C 48002EF5 */ bl lbl_00007740
/* 00004850 38600012 */ li r3, 0x12
/* 00004854 4BFFB90D */ bl event_finish
/* 00004858 3800FFFF */ li r0, -1
/* 0000485C 901F000C */ stw r0, 0xc(r31)
/* 00004860 38600012 */ li r3, 0x12
/* 00004864 4BFFB8FD */ bl event_start
/* 00004868 881D013E */ lbz r0, 0x13e(r29)
/* 0000486C 7C000775 */ extsb. r0, r0
/* 00004870 4082002C */ bne lbl_0000489C
/* 00004874 881D0007 */ lbz r0, 7(r29)
/* 00004878 38600001 */ li r3, 1
/* 0000487C A09D0004 */ lhz r4, 4(r29)
/* 00004880 7C000774 */ extsb r0, r0
/* 00004884 7C600030 */ slw r0, r3, r0
/* 00004888 7C800378 */ or r0, r4, r0
/* 0000488C B01D0004 */ sth r0, 4(r29)
/* 00004890 887D0006 */ lbz r3, 6(r29)
/* 00004894 38030001 */ addi r0, r3, 1
/* 00004898 981D0006 */ stb r0, 6(r29)
lbl_0000489C:
/* 0000489C 38000000 */ li r0, 0
/* 000048A0 901D0144 */ stw r0, 0x144(r29)
/* 000048A4 3860006B */ li r3, 0x6b
/* 000048A8 4BFFB8B9 */ bl destroy_sprite_with_tag
/* 000048AC 881D0006 */ lbz r0, 6(r29)
/* 000048B0 7C000774 */ extsb r0, r0
/* 000048B4 2800000A */ cmplwi r0, 0xa
/* 000048B8 41800030 */ blt lbl_000048E8
/* 000048BC 38600E10 */ li r3, 0xe10
/* 000048C0 48009AE1 */ bl lbl_0000E3A0
/* 000048C4 38600E10 */ li r3, 0xe10
/* 000048C8 48009EE9 */ bl lbl_0000E7B0
/* 000048CC 38000E10 */ li r0, 0xe10
/* 000048D0 901D0000 */ stw r0, 0(r29)
/* 000048D4 38600100 */ li r3, 0x100
/* 000048D8 3C000002 */ lis r0, 2
/* 000048DC 907F0000 */ stw r3, 0(r31)
/* 000048E0 901F0004 */ stw r0, 4(r31)
/* 000048E4 48000064 */ b lbl_00004948
lbl_000048E8:
/* 000048E8 887D0008 */ lbz r3, 8(r29)
/* 000048EC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000048F0 981D0008 */ stb r0, 8(r29)
/* 000048F4 881D0008 */ lbz r0, 8(r29)
/* 000048F8 7C000775 */ extsb. r0, r0
/* 000048FC 40800030 */ bge lbl_0000492C
/* 00004900 38600E10 */ li r3, 0xe10
/* 00004904 48009929 */ bl lbl_0000E22C
/* 00004908 38600E10 */ li r3, 0xe10
/* 0000490C 48009EA5 */ bl lbl_0000E7B0
/* 00004910 38000E10 */ li r0, 0xe10
/* 00004914 901D0000 */ stw r0, 0(r29)
/* 00004918 38600100 */ li r3, 0x100
/* 0000491C 3C000001 */ lis r0, 1
/* 00004920 907F0000 */ stw r3, 0(r31)
/* 00004924 901F0004 */ stw r0, 4(r31)
/* 00004928 48000020 */ b lbl_00004948
lbl_0000492C:
/* 0000492C 38002710 */ li r0, 0x2710
/* 00004930 901D0000 */ stw r0, 0(r29)
/* 00004934 38000800 */ li r0, 0x800
/* 00004938 3C600001 */ lis r3, 1
/* 0000493C 901F0000 */ stw r0, 0(r31)
/* 00004940 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 00004944 901F0004 */ stw r0, 4(r31)
lbl_00004948:
/* 00004948 3C600000 */ lis r3, spritePoolInfo@ha
/* 0000494C 38630000 */ addi r3, r3, spritePoolInfo@l
/* 00004950 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00004954 38A40000 */ addi r5, r4, currentBallStructPtr@l
/* 00004958 38C3000C */ addi r6, r3, 0xc
/* 0000495C 81050000 */ lwz r8, 0(r5)
/* 00004960 3C800000 */ lis r4, ballInfo@ha
/* 00004964 8123000C */ lwz r9, 0xc(r3)
/* 00004968 38040000 */ addi r0, r4, ballInfo@l
/* 0000496C 7C070378 */ mr r7, r0
/* 00004970 38830008 */ addi r4, r3, 8
/* 00004974 39400000 */ li r10, 0
/* 00004978 38600001 */ li r3, 1
/* 0000497C 48000024 */ b lbl_000049A0
lbl_00004980:
/* 00004980 88090000 */ lbz r0, 0(r9)
/* 00004984 2C000002 */ cmpwi r0, 2
/* 00004988 4082000C */ bne lbl_00004994
/* 0000498C 90E50000 */ stw r7, 0(r5)
/* 00004990 98670003 */ stb r3, 3(r7)
lbl_00004994:
/* 00004994 394A0001 */ addi r10, r10, 1
/* 00004998 38E701A4 */ addi r7, r7, 0x1a4
/* 0000499C 39290001 */ addi r9, r9, 1
lbl_000049A0:
/* 000049A0 80040000 */ lwz r0, 0(r4)
/* 000049A4 7C0A0000 */ cmpw r10, r0
/* 000049A8 4180FFD8 */ blt lbl_00004980
/* 000049AC 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000049B0 91030000 */ stw r8, currentBallStructPtr@l(r3)
/* 000049B4 3C600000 */ lis r3, worldInfo@ha
/* 000049B8 38030000 */ addi r0, r3, worldInfo@l
/* 000049BC 80C60000 */ lwz r6, 0(r6)
/* 000049C0 7C050378 */ mr r5, r0
/* 000049C4 38E00000 */ li r7, 0
/* 000049C8 38600001 */ li r3, 1
/* 000049CC 48000020 */ b lbl_000049EC
lbl_000049D0:
/* 000049D0 88060000 */ lbz r0, 0(r6)
/* 000049D4 2C000002 */ cmpwi r0, 2
/* 000049D8 40820008 */ bne lbl_000049E0
/* 000049DC 98650008 */ stb r3, 8(r5)
lbl_000049E0:
/* 000049E0 38E70001 */ addi r7, r7, 1
/* 000049E4 38A50040 */ addi r5, r5, 0x40
/* 000049E8 38C60001 */ addi r6, r6, 1
lbl_000049EC:
/* 000049EC 80040000 */ lwz r0, 0(r4)
/* 000049F0 7C070000 */ cmpw r7, r0
/* 000049F4 4180FFDC */ blt lbl_000049D0
/* 000049F8 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 000049FC 38A30000 */ addi r5, r3, currentCameraStructPtr@l
/* 00004A00 3C600000 */ lis r3, cameraInfo@ha
/* 00004A04 80E50000 */ lwz r7, 0(r5)
/* 00004A08 38630000 */ addi r3, r3, cameraInfo@l
/* 00004A0C 90650000 */ stw r3, 0(r5)
/* 00004A10 38800000 */ li r4, 0
/* 00004A14 38C30284 */ addi r6, r3, 0x284
/* 00004A18 9883001F */ stb r4, 0x1f(r3)
/* 00004A1C 38000009 */ li r0, 9
/* 00004A20 80650000 */ lwz r3, 0(r5)
/* 00004A24 98030026 */ stb r0, 0x26(r3)
/* 00004A28 90C50000 */ stw r6, 0(r5)
/* 00004A2C 9886001F */ stb r4, 0x1f(r6)
/* 00004A30 38C60284 */ addi r6, r6, 0x284
/* 00004A34 80650000 */ lwz r3, 0(r5)
/* 00004A38 98030026 */ stb r0, 0x26(r3)
/* 00004A3C 90C50000 */ stw r6, 0(r5)
/* 00004A40 9886001F */ stb r4, 0x1f(r6)
/* 00004A44 38C60284 */ addi r6, r6, 0x284
/* 00004A48 80650000 */ lwz r3, 0(r5)
/* 00004A4C 98030026 */ stb r0, 0x26(r3)
/* 00004A50 90C50000 */ stw r6, 0(r5)
/* 00004A54 9886001F */ stb r4, 0x1f(r6)
/* 00004A58 80650000 */ lwz r3, 0(r5)
/* 00004A5C 98030026 */ stb r0, 0x26(r3)
/* 00004A60 90E50000 */ stw r7, 0(r5)
lbl_00004A64:
/* 00004A64 80010024 */ lwz r0, 0x24(r1)
/* 00004A68 83E1001C */ lwz r31, 0x1c(r1)
/* 00004A6C 83C10018 */ lwz r30, 0x18(r1)
/* 00004A70 7C0803A6 */ mtlr r0
/* 00004A74 83A10014 */ lwz r29, 0x14(r1)
/* 00004A78 38210020 */ addi r1, r1, 0x20
/* 00004A7C 4E800020 */ blr 
lbl_00004A80:
/* 00004A80 7C0802A6 */ mflr r0
/* 00004A84 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004A88 90010004 */ stw r0, 4(r1)
/* 00004A8C 9421FFF8 */ stwu r1, -8(r1)
/* 00004A90 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 00004A94 38600001 */ li r3, 1
/* 00004A98 48002F51 */ bl lbl_000079E8
/* 00004A9C 38600001 */ li r3, 1
/* 00004AA0 48006BB5 */ bl lbl_0000B654
/* 00004AA4 3C600000 */ lis r3, lbl_1000013F@ha
/* 00004AA8 38630000 */ addi r3, r3, lbl_1000013F@l
/* 00004AAC 88630000 */ lbz r3, 0(r3)
/* 00004AB0 7C600775 */ extsb. r0, r3
/* 00004AB4 40820050 */ bne lbl_00004B04
/* 00004AB8 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00004ABC 38830000 */ addi r4, r3, currentCameraStructPtr@l
/* 00004AC0 3C600000 */ lis r3, cameraInfo@ha
/* 00004AC4 80C40000 */ lwz r6, 0(r4)
/* 00004AC8 38630000 */ addi r3, r3, cameraInfo@l
/* 00004ACC 90640000 */ stw r3, 0(r4)
/* 00004AD0 38000008 */ li r0, 8
/* 00004AD4 38A30284 */ addi r5, r3, 0x284
/* 00004AD8 9803001F */ stb r0, 0x1f(r3)
/* 00004ADC 90A40000 */ stw r5, 0(r4)
/* 00004AE0 38A50284 */ addi r5, r5, 0x284
/* 00004AE4 980302A3 */ stb r0, 0x2a3(r3)
/* 00004AE8 90A40000 */ stw r5, 0(r4)
/* 00004AEC 9805001F */ stb r0, 0x1f(r5)
/* 00004AF0 38A50284 */ addi r5, r5, 0x284
/* 00004AF4 90A40000 */ stw r5, 0(r4)
/* 00004AF8 9805001F */ stb r0, 0x1f(r5)
/* 00004AFC 90C40000 */ stw r6, 0(r4)
/* 00004B00 480000A4 */ b lbl_00004BA4
lbl_00004B04:
/* 00004B04 7C600774 */ extsb r0, r3
/* 00004B08 2C000001 */ cmpwi r0, 1
/* 00004B0C 40820050 */ bne lbl_00004B5C
/* 00004B10 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00004B14 38830000 */ addi r4, r3, currentCameraStructPtr@l
/* 00004B18 3C600000 */ lis r3, cameraInfo@ha
/* 00004B1C 80C40000 */ lwz r6, 0(r4)
/* 00004B20 38630000 */ addi r3, r3, cameraInfo@l
/* 00004B24 90640000 */ stw r3, 0(r4)
/* 00004B28 38000009 */ li r0, 9
/* 00004B2C 38A30284 */ addi r5, r3, 0x284
/* 00004B30 9803001F */ stb r0, 0x1f(r3)
/* 00004B34 90A40000 */ stw r5, 0(r4)
/* 00004B38 38A50284 */ addi r5, r5, 0x284
/* 00004B3C 980302A3 */ stb r0, 0x2a3(r3)
/* 00004B40 90A40000 */ stw r5, 0(r4)
/* 00004B44 9805001F */ stb r0, 0x1f(r5)
/* 00004B48 38A50284 */ addi r5, r5, 0x284
/* 00004B4C 90A40000 */ stw r5, 0(r4)
/* 00004B50 9805001F */ stb r0, 0x1f(r5)
/* 00004B54 90C40000 */ stw r6, 0(r4)
/* 00004B58 4800004C */ b lbl_00004BA4
lbl_00004B5C:
/* 00004B5C 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00004B60 38830000 */ addi r4, r3, currentCameraStructPtr@l
/* 00004B64 3C600000 */ lis r3, cameraInfo@ha
/* 00004B68 80C40000 */ lwz r6, 0(r4)
/* 00004B6C 38630000 */ addi r3, r3, cameraInfo@l
/* 00004B70 90640000 */ stw r3, 0(r4)
/* 00004B74 38000001 */ li r0, 1
/* 00004B78 38A30284 */ addi r5, r3, 0x284
/* 00004B7C 9803001F */ stb r0, 0x1f(r3)
/* 00004B80 90A40000 */ stw r5, 0(r4)
/* 00004B84 38A50284 */ addi r5, r5, 0x284
/* 00004B88 980302A3 */ stb r0, 0x2a3(r3)
/* 00004B8C 90A40000 */ stw r5, 0(r4)
/* 00004B90 9805001F */ stb r0, 0x1f(r5)
/* 00004B94 38A50284 */ addi r5, r5, 0x284
/* 00004B98 90A40000 */ stw r5, 0(r4)
/* 00004B9C 9805001F */ stb r0, 0x1f(r5)
/* 00004BA0 90C40000 */ stw r6, 0(r4)
lbl_00004BA4:
/* 00004BA4 3C600000 */ lis r3, lbl_10000000@ha
/* 00004BA8 3800012C */ li r0, 0x12c
/* 00004BAC 90030000 */ stw r0, lbl_10000000@l(r3)
/* 00004BB0 3C800000 */ lis r4, lbl_00014F20@ha
/* 00004BB4 38004000 */ li r0, 0x4000
/* 00004BB8 90040000 */ stw r0, lbl_00014F20@l(r4)
/* 00004BBC 3C600000 */ lis r3, lbl_00014F24@ha
/* 00004BC0 3C000004 */ lis r0, 4
/* 00004BC4 90030000 */ stw r0, lbl_00014F24@l(r3)
/* 00004BC8 8001000C */ lwz r0, 0xc(r1)
/* 00004BCC 38210008 */ addi r1, r1, 8
/* 00004BD0 7C0803A6 */ mtlr r0
/* 00004BD4 4E800020 */ blr 
lbl_00004BD8:
/* 00004BD8 7C0802A6 */ mflr r0
/* 00004BDC 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00004BE0 90010004 */ stw r0, 4(r1)
/* 00004BE4 3CC00000 */ lis r6, controllerInfo@ha
/* 00004BE8 3CE00000 */ lis r7, lbl_10000000@ha
/* 00004BEC 9421FFF8 */ stwu r1, -8(r1)
/* 00004BF0 80830000 */ lwz r4, currentBallStructPtr@l(r3)
/* 00004BF4 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00004BF8 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 00004BFC 88A4002E */ lbz r5, 0x2e(r4)
/* 00004C00 7CA30774 */ extsb r3, r5
/* 00004C04 5463103A */ slwi r3, r3, 2
/* 00004C08 7C601A14 */ add r3, r0, r3
/* 00004C0C 80030000 */ lwz r0, 0(r3)
/* 00004C10 38660000 */ addi r3, r6, controllerInfo@l
/* 00004C14 38A70000 */ addi r5, r7, lbl_10000000@l
/* 00004C18 1C00003C */ mulli r0, r0, 0x3c
/* 00004C1C 7C630214 */ add r3, r3, r0
/* 00004C20 A0030018 */ lhz r0, 0x18(r3)
/* 00004C24 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00004C28 41820050 */ beq lbl_00004C78
/* 00004C2C 80050000 */ lwz r0, 0(r5)
/* 00004C30 2C0000F0 */ cmpwi r0, 0xf0
/* 00004C34 40800044 */ bge lbl_00004C78
/* 00004C38 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00004C3C 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 00004C40 2C000000 */ cmpwi r0, 0
/* 00004C44 4082001C */ bne lbl_00004C60
/* 00004C48 38600000 */ li r3, 0
/* 00004C4C 48002D9D */ bl lbl_000079E8
/* 00004C50 38600000 */ li r3, 0
/* 00004C54 48006A01 */ bl lbl_0000B654
/* 00004C58 4BFFDD51 */ bl lbl_000029A8
/* 00004C5C 480000A4 */ b lbl_00004D00
lbl_00004C60:
/* 00004C60 38600000 */ li r3, 0
/* 00004C64 48002D85 */ bl lbl_000079E8
/* 00004C68 38600000 */ li r3, 0
/* 00004C6C 480069E9 */ bl lbl_0000B654
/* 00004C70 4BFFF7A1 */ bl lbl_00004410
/* 00004C74 4800008C */ b lbl_00004D00
lbl_00004C78:
/* 00004C78 3C600000 */ lis r3, lbl_00010F94@ha
/* 00004C7C C0240008 */ lfs f1, 8(r4)
/* 00004C80 C0030000 */ lfs f0, lbl_00010F94@l(r3)
/* 00004C84 FC010040 */ fcmpo cr0, f1, f0
/* 00004C88 41800010 */ blt lbl_00004C98
/* 00004C8C 80050000 */ lwz r0, 0(r5)
/* 00004C90 2C000000 */ cmpwi r0, 0
/* 00004C94 4080006C */ bge lbl_00004D00
lbl_00004C98:
/* 00004C98 8865013F */ lbz r3, 0x13f(r5)
/* 00004C9C 38030001 */ addi r0, r3, 1
/* 00004CA0 9805013F */ stb r0, 0x13f(r5)
/* 00004CA4 8865013F */ lbz r3, 0x13f(r5)
/* 00004CA8 88050140 */ lbz r0, 0x140(r5)
/* 00004CAC 7C630774 */ extsb r3, r3
/* 00004CB0 7C000774 */ extsb r0, r0
/* 00004CB4 7C030000 */ cmpw r3, r0
/* 00004CB8 4080000C */ bge lbl_00004CC4
/* 00004CBC 4BFFFDC5 */ bl lbl_00004A80
/* 00004CC0 48000040 */ b lbl_00004D00
lbl_00004CC4:
/* 00004CC4 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00004CC8 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 00004CCC 2C000000 */ cmpwi r0, 0
/* 00004CD0 4082001C */ bne lbl_00004CEC
/* 00004CD4 38600000 */ li r3, 0
/* 00004CD8 48002D11 */ bl lbl_000079E8
/* 00004CDC 38600000 */ li r3, 0
/* 00004CE0 48006975 */ bl lbl_0000B654
/* 00004CE4 4BFFDCC5 */ bl lbl_000029A8
/* 00004CE8 48000018 */ b lbl_00004D00
lbl_00004CEC:
/* 00004CEC 38600000 */ li r3, 0
/* 00004CF0 48002CF9 */ bl lbl_000079E8
/* 00004CF4 38600000 */ li r3, 0
/* 00004CF8 4800695D */ bl lbl_0000B654
/* 00004CFC 4BFFF715 */ bl lbl_00004410
lbl_00004D00:
/* 00004D00 8001000C */ lwz r0, 0xc(r1)
/* 00004D04 38210008 */ addi r1, r1, 8
/* 00004D08 7C0803A6 */ mtlr r0
/* 00004D0C 4E800020 */ blr 
lbl_00004D10:
/* 00004D10 7C0802A6 */ mflr r0
/* 00004D14 90010004 */ stw r0, 4(r1)
/* 00004D18 9421FFE0 */ stwu r1, -0x20(r1)
/* 00004D1C 93E1001C */ stw r31, 0x1c(r1)
/* 00004D20 93C10018 */ stw r30, 0x18(r1)
/* 00004D24 93A10014 */ stw r29, 0x14(r1)
/* 00004D28 93810010 */ stw r28, 0x10(r1)
/* 00004D2C 48005ADD */ bl lbl_0000A808
/* 00004D30 3C600000 */ lis r3, lbl_802F1BF0@ha
/* 00004D34 80030000 */ lwz r0, lbl_802F1BF0@l(r3)
/* 00004D38 2C000000 */ cmpwi r0, 0
/* 00004D3C 40820038 */ bne lbl_00004D74
/* 00004D40 3B800000 */ li r28, 0
/* 00004D44 1C9C000C */ mulli r4, r28, 0xc
/* 00004D48 3C600000 */ lis r3, lbl_00010C40@ha
/* 00004D4C 38030000 */ addi r0, r3, lbl_00010C40@l
/* 00004D50 7FE02214 */ add r31, r0, r4
lbl_00004D54:
/* 00004D54 387F0000 */ addi r3, r31, 0
/* 00004D58 7F840774 */ extsb r4, r28
/* 00004D5C 48005E3D */ bl lbl_0000AB98
/* 00004D60 3B9C0001 */ addi r28, r28, 1
/* 00004D64 281C000A */ cmplwi r28, 0xa
/* 00004D68 3BFF000C */ addi r31, r31, 0xc
/* 00004D6C 4180FFE8 */ blt lbl_00004D54
/* 00004D70 48000068 */ b lbl_00004DD8
lbl_00004D74:
/* 00004D74 3C600000 */ lis r3, lbl_10000004@ha
/* 00004D78 38630000 */ addi r3, r3, lbl_10000004@l
/* 00004D7C 88030003 */ lbz r0, 3(r3)
/* 00004D80 3C600000 */ lis r3, lbl_00015020@ha
/* 00004D84 3B800000 */ li r28, 0
/* 00004D88 38630000 */ addi r3, r3, lbl_00015020@l
/* 00004D8C 7C000774 */ extsb r0, r0
/* 00004D90 80630000 */ lwz r3, 0(r3)
/* 00004D94 54001838 */ slwi r0, r0, 3
/* 00004D98 1CBC000C */ mulli r5, r28, 0xc
/* 00004D9C 7FA3022E */ lhzx r29, r3, r0
/* 00004DA0 3C800000 */ lis r4, lbl_00010C40@ha
/* 00004DA4 38040000 */ addi r0, r4, lbl_00010C40@l
/* 00004DA8 7FC02A14 */ add r30, r0, r5
/* 00004DAC 3BE00001 */ li r31, 1
lbl_00004DB0:
/* 00004DB0 7FE0E030 */ slw r0, r31, r28
/* 00004DB4 7FA00039 */ and. r0, r29, r0
/* 00004DB8 41820010 */ beq lbl_00004DC8
/* 00004DBC 387E0000 */ addi r3, r30, 0
/* 00004DC0 7F840774 */ extsb r4, r28
/* 00004DC4 48005DD5 */ bl lbl_0000AB98
lbl_00004DC8:
/* 00004DC8 3B9C0001 */ addi r28, r28, 1
/* 00004DCC 281C000A */ cmplwi r28, 0xa
/* 00004DD0 3BDE000C */ addi r30, r30, 0xc
/* 00004DD4 4180FFDC */ blt lbl_00004DB0
lbl_00004DD8:
/* 00004DD8 80010024 */ lwz r0, 0x24(r1)
/* 00004DDC 83E1001C */ lwz r31, 0x1c(r1)
/* 00004DE0 83C10018 */ lwz r30, 0x18(r1)
/* 00004DE4 7C0803A6 */ mtlr r0
/* 00004DE8 83A10014 */ lwz r29, 0x14(r1)
/* 00004DEC 83810010 */ lwz r28, 0x10(r1)
/* 00004DF0 38210020 */ addi r1, r1, 0x20
/* 00004DF4 4E800020 */ blr 
lbl_00004DF8:
/* 00004DF8 7C0802A6 */ mflr r0
/* 00004DFC 90010004 */ stw r0, 4(r1)
/* 00004E00 9421FFE0 */ stwu r1, -0x20(r1)
/* 00004E04 93E1001C */ stw r31, 0x1c(r1)
/* 00004E08 93C10018 */ stw r30, 0x18(r1)
/* 00004E0C 93A10014 */ stw r29, 0x14(r1)
/* 00004E10 3BA30000 */ addi r29, r3, 0
/* 00004E14 3C600000 */ lis r3, lbl_10000000@ha
/* 00004E18 93810010 */ stw r28, 0x10(r1)
/* 00004E1C 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00004E20 387F013E */ addi r3, r31, 0x13e
/* 00004E24 8BDD0008 */ lbz r30, 8(r29)
/* 00004E28 48005F65 */ bl lbl_0000AD8C
/* 00004E2C B07F013C */ sth r3, 0x13c(r31)
/* 00004E30 480061BD */ bl lbl_0000AFEC
/* 00004E34 38000000 */ li r0, 0
/* 00004E38 901D0000 */ stw r0, 0(r29)
/* 00004E3C 889D0007 */ lbz r4, 7(r29)
/* 00004E40 7C830774 */ extsb r3, r4
/* 00004E44 2C030001 */ cmpwi r3, 1
/* 00004E48 40820074 */ bne lbl_00004EBC
/* 00004E4C 881F013E */ lbz r0, 0x13e(r31)
/* 00004E50 7FC30774 */ extsb r3, r30
/* 00004E54 7F9D1A14 */ add r28, r29, r3
/* 00004E58 2000000A */ subfic r0, r0, 0xa
/* 00004E5C 981C0020 */ stb r0, 0x20(r28)
/* 00004E60 887F013E */ lbz r3, 0x13e(r31)
/* 00004E64 7C600775 */ extsb. r0, r3
/* 00004E68 40820010 */ bne lbl_00004E78
/* 00004E6C 38000002 */ li r0, 2
/* 00004E70 981C0035 */ stb r0, 0x35(r28)
/* 00004E74 48000268 */ b lbl_000050DC
lbl_00004E78:
/* 00004E78 7C600774 */ extsb r0, r3
/* 00004E7C 2C00000A */ cmpwi r0, 0xa
/* 00004E80 40820010 */ bne lbl_00004E90
/* 00004E84 38000005 */ li r0, 5
/* 00004E88 981C0035 */ stb r0, 0x35(r28)
/* 00004E8C 48000250 */ b lbl_000050DC
lbl_00004E90:
/* 00004E90 4800062D */ bl lbl_000054BC
/* 00004E94 907D0000 */ stw r3, 0(r29)
/* 00004E98 801D0000 */ lwz r0, 0(r29)
/* 00004E9C 28000000 */ cmplwi r0, 0
/* 00004EA0 40820010 */ bne lbl_00004EB0
/* 00004EA4 38000001 */ li r0, 1
/* 00004EA8 981C0035 */ stb r0, 0x35(r28)
/* 00004EAC 48000230 */ b lbl_000050DC
lbl_00004EB0:
/* 00004EB0 38000004 */ li r0, 4
/* 00004EB4 981C0035 */ stb r0, 0x35(r28)
/* 00004EB8 48000224 */ b lbl_000050DC
lbl_00004EBC:
/* 00004EBC 88BD0006 */ lbz r5, 6(r29)
/* 00004EC0 2C05000A */ cmpwi r5, 0xa
/* 00004EC4 4082011C */ bne lbl_00004FE0
/* 00004EC8 2C030002 */ cmpwi r3, 2
/* 00004ECC 40820114 */ bne lbl_00004FE0
/* 00004ED0 7FC40774 */ extsb r4, r30
/* 00004ED4 887F013E */ lbz r3, 0x13e(r31)
/* 00004ED8 7CBD2214 */ add r5, r29, r4
/* 00004EDC 8C050034 */ lbzu r0, 0x34(r5)
/* 00004EE0 7C630774 */ extsb r3, r3
/* 00004EE4 2C000002 */ cmpwi r0, 2
/* 00004EE8 20C3000A */ subfic r6, r3, 0xa
/* 00004EEC 40820014 */ bne lbl_00004F00
/* 00004EF0 7CC00774 */ extsb r0, r6
/* 00004EF4 7C7D2214 */ add r3, r29, r4
/* 00004EF8 98030020 */ stb r0, 0x20(r3)
/* 00004EFC 48000018 */ b lbl_00004F14
lbl_00004F00:
/* 00004F00 7C7D2214 */ add r3, r29, r4
/* 00004F04 8803001F */ lbz r0, 0x1f(r3)
/* 00004F08 7C000774 */ extsb r0, r0
/* 00004F0C 7C003050 */ subf r0, r0, r6
/* 00004F10 98030020 */ stb r0, 0x20(r3)
lbl_00004F14:
/* 00004F14 881F013E */ lbz r0, 0x13e(r31)
/* 00004F18 7C000775 */ extsb. r0, r0
/* 00004F1C 40820038 */ bne lbl_00004F54
/* 00004F20 88050000 */ lbz r0, 0(r5)
/* 00004F24 2C000002 */ cmpwi r0, 2
/* 00004F28 40820018 */ bne lbl_00004F40
/* 00004F2C 7FC00774 */ extsb r0, r30
/* 00004F30 7C7D0214 */ add r3, r29, r0
/* 00004F34 38000002 */ li r0, 2
/* 00004F38 98030035 */ stb r0, 0x35(r3)
/* 00004F3C 480001A0 */ b lbl_000050DC
lbl_00004F40:
/* 00004F40 7FC00774 */ extsb r0, r30
/* 00004F44 7C7D0214 */ add r3, r29, r0
/* 00004F48 38000003 */ li r0, 3
/* 00004F4C 98030035 */ stb r0, 0x35(r3)
/* 00004F50 4800018C */ b lbl_000050DC
lbl_00004F54:
/* 00004F54 7C7D2214 */ add r3, r29, r4
/* 00004F58 8803001F */ lbz r0, 0x1f(r3)
/* 00004F5C 7C000774 */ extsb r0, r0
/* 00004F60 7C060000 */ cmpw r6, r0
/* 00004F64 4182000C */ beq lbl_00004F70
/* 00004F68 2C060000 */ cmpwi r6, 0
/* 00004F6C 40820038 */ bne lbl_00004FA4
lbl_00004F70:
/* 00004F70 88050000 */ lbz r0, 0(r5)
/* 00004F74 2C000002 */ cmpwi r0, 2
/* 00004F78 40820018 */ bne lbl_00004F90
/* 00004F7C 7FC00774 */ extsb r0, r30
/* 00004F80 7C7D0214 */ add r3, r29, r0
/* 00004F84 38000005 */ li r0, 5
/* 00004F88 98030035 */ stb r0, 0x35(r3)
/* 00004F8C 48000150 */ b lbl_000050DC
lbl_00004F90:
/* 00004F90 7FC00774 */ extsb r0, r30
/* 00004F94 7C7D0214 */ add r3, r29, r0
/* 00004F98 38000007 */ li r0, 7
/* 00004F9C 98030035 */ stb r0, 0x35(r3)
/* 00004FA0 4800013C */ b lbl_000050DC
lbl_00004FA4:
/* 00004FA4 48000519 */ bl lbl_000054BC
/* 00004FA8 907D0000 */ stw r3, 0(r29)
/* 00004FAC 801D0000 */ lwz r0, 0(r29)
/* 00004FB0 28000000 */ cmplwi r0, 0
/* 00004FB4 40820018 */ bne lbl_00004FCC
/* 00004FB8 7FC00774 */ extsb r0, r30
/* 00004FBC 7C7D0214 */ add r3, r29, r0
/* 00004FC0 38000001 */ li r0, 1
/* 00004FC4 98030035 */ stb r0, 0x35(r3)
/* 00004FC8 48000114 */ b lbl_000050DC
lbl_00004FCC:
/* 00004FCC 7FC00774 */ extsb r0, r30
/* 00004FD0 7C7D0214 */ add r3, r29, r0
/* 00004FD4 38000004 */ li r0, 4
/* 00004FD8 98030035 */ stb r0, 0x35(r3)
/* 00004FDC 48000100 */ b lbl_000050DC
lbl_00004FE0:
/* 00004FE0 7CA00774 */ extsb r0, r5
/* 00004FE4 887F013E */ lbz r3, 0x13e(r31)
/* 00004FE8 2C00000A */ cmpwi r0, 0xa
/* 00004FEC 7C600774 */ extsb r0, r3
/* 00004FF0 20A0000A */ subfic r5, r0, 0xa
/* 00004FF4 40820044 */ bne lbl_00005038
/* 00004FF8 7C800774 */ extsb r0, r4
/* 00004FFC 2C000003 */ cmpwi r0, 3
/* 00005000 40820038 */ bne lbl_00005038
/* 00005004 7FC00774 */ extsb r0, r30
/* 00005008 7C7D0214 */ add r3, r29, r0
/* 0000500C 88030034 */ lbz r0, 0x34(r3)
/* 00005010 7C000774 */ extsb r0, r0
/* 00005014 2C000002 */ cmpwi r0, 2
/* 00005018 4182000C */ beq lbl_00005024
/* 0000501C 2C000003 */ cmpwi r0, 3
/* 00005020 40820018 */ bne lbl_00005038
lbl_00005024:
/* 00005024 7FC00774 */ extsb r0, r30
/* 00005028 7CA40774 */ extsb r4, r5
/* 0000502C 7C7D0214 */ add r3, r29, r0
/* 00005030 98830020 */ stb r4, 0x20(r3)
/* 00005034 4800001C */ b lbl_00005050
lbl_00005038:
/* 00005038 7FC00774 */ extsb r0, r30
/* 0000503C 7C7D0214 */ add r3, r29, r0
/* 00005040 8803001F */ lbz r0, 0x1f(r3)
/* 00005044 7C000774 */ extsb r0, r0
/* 00005048 7C002850 */ subf r0, r0, r5
/* 0000504C 98030020 */ stb r0, 0x20(r3)
lbl_00005050:
/* 00005050 881F013E */ lbz r0, 0x13e(r31)
/* 00005054 7C000775 */ extsb. r0, r0
/* 00005058 40820058 */ bne lbl_000050B0
/* 0000505C 881D0006 */ lbz r0, 6(r29)
/* 00005060 2C00000A */ cmpwi r0, 0xa
/* 00005064 40820038 */ bne lbl_0000509C
/* 00005068 7FC00774 */ extsb r0, r30
/* 0000506C 7C7D0214 */ add r3, r29, r0
/* 00005070 88030034 */ lbz r0, 0x34(r3)
/* 00005074 7C000774 */ extsb r0, r0
/* 00005078 2C000002 */ cmpwi r0, 2
/* 0000507C 4182000C */ beq lbl_00005088
/* 00005080 2C000003 */ cmpwi r0, 3
/* 00005084 40820018 */ bne lbl_0000509C
lbl_00005088:
/* 00005088 7FC00774 */ extsb r0, r30
/* 0000508C 7C7D0214 */ add r3, r29, r0
/* 00005090 38000002 */ li r0, 2
/* 00005094 98030035 */ stb r0, 0x35(r3)
/* 00005098 48000044 */ b lbl_000050DC
lbl_0000509C:
/* 0000509C 7FC00774 */ extsb r0, r30
/* 000050A0 7C7D0214 */ add r3, r29, r0
/* 000050A4 38000003 */ li r0, 3
/* 000050A8 98030035 */ stb r0, 0x35(r3)
/* 000050AC 48000030 */ b lbl_000050DC
lbl_000050B0:
/* 000050B0 7FC00774 */ extsb r0, r30
/* 000050B4 7C7D0214 */ add r3, r29, r0
/* 000050B8 8803001F */ lbz r0, 0x1f(r3)
/* 000050BC 7C000774 */ extsb r0, r0
/* 000050C0 7C050000 */ cmpw r5, r0
/* 000050C4 40820010 */ bne lbl_000050D4
/* 000050C8 38000007 */ li r0, 7
/* 000050CC 98030035 */ stb r0, 0x35(r3)
/* 000050D0 4800000C */ b lbl_000050DC
lbl_000050D4:
/* 000050D4 38000001 */ li r0, 1
/* 000050D8 98030035 */ stb r0, 0x35(r3)
lbl_000050DC:
/* 000050DC 7FC00774 */ extsb r0, r30
/* 000050E0 7C7D0214 */ add r3, r29, r0
/* 000050E4 88030035 */ lbz r0, 0x35(r3)
/* 000050E8 2C000002 */ cmpwi r0, 2
/* 000050EC 40820014 */ bne lbl_00005100
/* 000050F0 887D0009 */ lbz r3, 9(r29)
/* 000050F4 38030001 */ addi r0, r3, 1
/* 000050F8 981D0009 */ stb r0, 9(r29)
/* 000050FC 4800000C */ b lbl_00005108
lbl_00005100:
/* 00005100 38000000 */ li r0, 0
/* 00005104 981D0009 */ stb r0, 9(r29)
lbl_00005108:
/* 00005108 80010024 */ lwz r0, 0x24(r1)
/* 0000510C 83E1001C */ lwz r31, 0x1c(r1)
/* 00005110 83C10018 */ lwz r30, 0x18(r1)
/* 00005114 7C0803A6 */ mtlr r0
/* 00005118 83A10014 */ lwz r29, 0x14(r1)
/* 0000511C 83810010 */ lwz r28, 0x10(r1)
/* 00005120 38210020 */ addi r1, r1, 0x20
/* 00005124 4E800020 */ blr 
lbl_00005128:
/* 00005128 38000015 */ li r0, 0x15
/* 0000512C 7C0903A6 */ mtctr r0
/* 00005130 38A00000 */ li r5, 0
/* 00005134 38C00000 */ li r6, 0
lbl_00005138:
/* 00005138 7C832A14 */ add r4, r3, r5
/* 0000513C 88040020 */ lbz r0, 0x20(r4)
/* 00005140 2C050012 */ cmpwi r5, 0x12
/* 00005144 7C000774 */ extsb r0, r0
/* 00005148 7CC60214 */ add r6, r6, r0
/* 0000514C 40800080 */ bge lbl_000051CC
/* 00005150 88040035 */ lbz r0, 0x35(r4)
/* 00005154 7C000774 */ extsb r0, r0
/* 00005158 2C000002 */ cmpwi r0, 2
/* 0000515C 40820040 */ bne lbl_0000519C
/* 00005160 38E50001 */ addi r7, r5, 1
/* 00005164 39000000 */ li r8, 0
/* 00005168 48000028 */ b lbl_00005190
lbl_0000516C:
/* 0000516C 7C833A14 */ add r4, r3, r7
/* 00005170 88040035 */ lbz r0, 0x35(r4)
/* 00005174 7C000775 */ extsb. r0, r0
/* 00005178 41820014 */ beq lbl_0000518C
/* 0000517C 88040020 */ lbz r0, 0x20(r4)
/* 00005180 39080001 */ addi r8, r8, 1
/* 00005184 7C000774 */ extsb r0, r0
/* 00005188 7CC60214 */ add r6, r6, r0
lbl_0000518C:
/* 0000518C 38E70001 */ addi r7, r7, 1
lbl_00005190:
/* 00005190 2C080002 */ cmpwi r8, 2
/* 00005194 4180FFD8 */ blt lbl_0000516C
/* 00005198 48000034 */ b lbl_000051CC
lbl_0000519C:
/* 0000519C 2C000003 */ cmpwi r0, 3
/* 000051A0 4082002C */ bne lbl_000051CC
/* 000051A4 88040036 */ lbz r0, 0x36(r4)
/* 000051A8 7C000775 */ extsb. r0, r0
/* 000051AC 41820014 */ beq lbl_000051C0
/* 000051B0 88040021 */ lbz r0, 0x21(r4)
/* 000051B4 7C000774 */ extsb r0, r0
/* 000051B8 7CC60214 */ add r6, r6, r0
/* 000051BC 48000010 */ b lbl_000051CC
lbl_000051C0:
/* 000051C0 88040022 */ lbz r0, 0x22(r4)
/* 000051C4 7C000774 */ extsb r0, r0
/* 000051C8 7CC60214 */ add r6, r6, r0
lbl_000051CC:
/* 000051CC 38A50001 */ addi r5, r5, 1
/* 000051D0 4200FF68 */ bdnz lbl_00005138
/* 000051D4 7CC00734 */ extsh r0, r6
/* 000051D8 B0030004 */ sth r0, 4(r3)
/* 000051DC 4E800020 */ blr 
lbl_000051E0:
/* 000051E0 38830002 */ addi r4, r3, 2
/* 000051E4 A803000C */ lha r0, 0xc(r3)
/* 000051E8 38A00001 */ li r5, 1
/* 000051EC 2C00FFFF */ cmpwi r0, -1
/* 000051F0 418200B8 */ beq lbl_000052A8
/* 000051F4 A804000C */ lha r0, 0xc(r4)
/* 000051F8 38A00002 */ li r5, 2
/* 000051FC 38840002 */ addi r4, r4, 2
/* 00005200 2C00FFFF */ cmpwi r0, -1
/* 00005204 418200A4 */ beq lbl_000052A8
/* 00005208 A804000C */ lha r0, 0xc(r4)
/* 0000520C 38A00003 */ li r5, 3
/* 00005210 38840002 */ addi r4, r4, 2
/* 00005214 2C00FFFF */ cmpwi r0, -1
/* 00005218 41820090 */ beq lbl_000052A8
/* 0000521C A804000C */ lha r0, 0xc(r4)
/* 00005220 38A00004 */ li r5, 4
/* 00005224 38840002 */ addi r4, r4, 2
/* 00005228 2C00FFFF */ cmpwi r0, -1
/* 0000522C 4182007C */ beq lbl_000052A8
/* 00005230 A804000C */ lha r0, 0xc(r4)
/* 00005234 38A00005 */ li r5, 5
/* 00005238 38840002 */ addi r4, r4, 2
/* 0000523C 2C00FFFF */ cmpwi r0, -1
/* 00005240 41820068 */ beq lbl_000052A8
/* 00005244 A804000C */ lha r0, 0xc(r4)
/* 00005248 38A00006 */ li r5, 6
/* 0000524C 38840002 */ addi r4, r4, 2
/* 00005250 2C00FFFF */ cmpwi r0, -1
/* 00005254 41820054 */ beq lbl_000052A8
/* 00005258 A804000C */ lha r0, 0xc(r4)
/* 0000525C 38A00007 */ li r5, 7
/* 00005260 38840002 */ addi r4, r4, 2
/* 00005264 2C00FFFF */ cmpwi r0, -1
/* 00005268 41820040 */ beq lbl_000052A8
/* 0000526C A804000C */ lha r0, 0xc(r4)
/* 00005270 38A00008 */ li r5, 8
/* 00005274 38840002 */ addi r4, r4, 2
/* 00005278 2C00FFFF */ cmpwi r0, -1
/* 0000527C 4182002C */ beq lbl_000052A8
/* 00005280 A804000C */ lha r0, 0xc(r4)
/* 00005284 38A00009 */ li r5, 9
/* 00005288 38840002 */ addi r4, r4, 2
/* 0000528C 2C00FFFF */ cmpwi r0, -1
/* 00005290 41820018 */ beq lbl_000052A8
/* 00005294 A804000C */ lha r0, 0xc(r4)
/* 00005298 38A0000A */ li r5, 0xa
/* 0000529C 2C00FFFF */ cmpwi r0, -1
/* 000052A0 41820008 */ beq lbl_000052A8
/* 000052A4 38A0000B */ li r5, 0xb
lbl_000052A8:
/* 000052A8 2C05000A */ cmpwi r5, 0xa
/* 000052AC 4082007C */ bne lbl_00005328
/* 000052B0 88830047 */ lbz r4, 0x47(r3)
/* 000052B4 7C800775 */ extsb. r0, r4
/* 000052B8 4D820020 */ beqlr 
/* 000052BC 88C30048 */ lbz r6, 0x48(r3)
/* 000052C0 7CC00775 */ extsb. r0, r6
/* 000052C4 4D820020 */ beqlr 
/* 000052C8 7C800774 */ extsb r0, r4
/* 000052CC 2C000002 */ cmpwi r0, 2
/* 000052D0 41820014 */ beq lbl_000052E4
/* 000052D4 3806FFFE */ addi r0, r6, -2  ;# fixed addi
/* 000052D8 5400063E */ clrlwi r0, r0, 0x18
/* 000052DC 28000001 */ cmplwi r0, 1
/* 000052E0 41810010 */ bgt lbl_000052F0
lbl_000052E4:
/* 000052E4 88030049 */ lbz r0, 0x49(r3)
/* 000052E8 7C000775 */ extsb. r0, r0
/* 000052EC 4D820020 */ beqlr 
lbl_000052F0:
/* 000052F0 88C30033 */ lbz r6, 0x33(r3)
/* 000052F4 54A4083C */ slwi r4, r5, 1
/* 000052F8 88030032 */ lbz r0, 0x32(r3)
/* 000052FC 7C832214 */ add r4, r3, r4
/* 00005300 88E30034 */ lbz r7, 0x34(r3)
/* 00005304 7CC50774 */ extsb r5, r6
/* 00005308 A8640008 */ lha r3, 8(r4)
/* 0000530C 7C000774 */ extsb r0, r0
/* 00005310 7CE60774 */ extsb r6, r7
/* 00005314 7C002A14 */ add r0, r0, r5
/* 00005318 7C003214 */ add r0, r0, r6
/* 0000531C 7C030214 */ add r0, r3, r0
/* 00005320 B004000A */ sth r0, 0xa(r4)
/* 00005324 4E800020 */ blr 
lbl_00005328:
/* 00005328 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000532C 5400083C */ slwi r0, r0, 1
/* 00005330 7C830214 */ add r4, r3, r0
/* 00005334 88040035 */ lbz r0, 0x35(r4)
/* 00005338 2C000002 */ cmpwi r0, 2
/* 0000533C 408200FC */ bne lbl_00005438
/* 00005340 2C050009 */ cmpwi r5, 9
/* 00005344 40820054 */ bne lbl_00005398
/* 00005348 88040037 */ lbz r0, 0x37(r4)
/* 0000534C 7C000775 */ extsb. r0, r0
/* 00005350 4D820020 */ beqlr 
/* 00005354 88040038 */ lbz r0, 0x38(r4)
/* 00005358 7C000775 */ extsb. r0, r0
/* 0000535C 4D820020 */ beqlr 
/* 00005360 88C40022 */ lbz r6, 0x22(r4)
/* 00005364 54A5083C */ slwi r5, r5, 1
/* 00005368 88040020 */ lbz r0, 0x20(r4)
/* 0000536C 7CA32A14 */ add r5, r3, r5
/* 00005370 88E40023 */ lbz r7, 0x23(r4)
/* 00005374 7CC40774 */ extsb r4, r6
/* 00005378 A8650008 */ lha r3, 8(r5)
/* 0000537C 7C000774 */ extsb r0, r0
/* 00005380 7CE60774 */ extsb r6, r7
/* 00005384 7C002214 */ add r0, r0, r4
/* 00005388 7C003214 */ add r0, r0, r6
/* 0000538C 7C030214 */ add r0, r3, r0
/* 00005390 B005000A */ sth r0, 0xa(r5)
/* 00005394 4E800020 */ blr 
lbl_00005398:
/* 00005398 88C40037 */ lbz r6, 0x37(r4)
/* 0000539C 7CC00775 */ extsb. r0, r6
/* 000053A0 4D820020 */ beqlr 
/* 000053A4 7CC00774 */ extsb r0, r6
/* 000053A8 2C000002 */ cmpwi r0, 2
/* 000053AC 40820048 */ bne lbl_000053F4
/* 000053B0 88040039 */ lbz r0, 0x39(r4)
/* 000053B4 7C000775 */ extsb. r0, r0
/* 000053B8 4D820020 */ beqlr 
/* 000053BC 88C40022 */ lbz r6, 0x22(r4)
/* 000053C0 54A5083C */ slwi r5, r5, 1
/* 000053C4 88040020 */ lbz r0, 0x20(r4)
/* 000053C8 7CA32A14 */ add r5, r3, r5
/* 000053CC 88E40024 */ lbz r7, 0x24(r4)
/* 000053D0 7CC40774 */ extsb r4, r6
/* 000053D4 A8650008 */ lha r3, 8(r5)
/* 000053D8 7C000774 */ extsb r0, r0
/* 000053DC 7CE60774 */ extsb r6, r7
/* 000053E0 7C002214 */ add r0, r0, r4
/* 000053E4 7C003214 */ add r0, r0, r6
/* 000053E8 7C030214 */ add r0, r3, r0
/* 000053EC B005000A */ sth r0, 0xa(r5)
/* 000053F0 4E800020 */ blr 
lbl_000053F4:
/* 000053F4 88040038 */ lbz r0, 0x38(r4)
/* 000053F8 7C000775 */ extsb. r0, r0
/* 000053FC 4D820020 */ beqlr 
/* 00005400 88C40022 */ lbz r6, 0x22(r4)
/* 00005404 54A5083C */ slwi r5, r5, 1
/* 00005408 88040020 */ lbz r0, 0x20(r4)
/* 0000540C 7CA32A14 */ add r5, r3, r5
/* 00005410 88E40023 */ lbz r7, 0x23(r4)
/* 00005414 7CC40774 */ extsb r4, r6
/* 00005418 A8650008 */ lha r3, 8(r5)
/* 0000541C 7C000774 */ extsb r0, r0
/* 00005420 7CE60774 */ extsb r6, r7
/* 00005424 7C002214 */ add r0, r0, r4
/* 00005428 7C003214 */ add r0, r0, r6
/* 0000542C 7C030214 */ add r0, r3, r0
/* 00005430 B005000A */ sth r0, 0xa(r5)
/* 00005434 4E800020 */ blr 
lbl_00005438:
/* 00005438 88C40036 */ lbz r6, 0x36(r4)
/* 0000543C 2C060003 */ cmpwi r6, 3
/* 00005440 40820048 */ bne lbl_00005488
/* 00005444 88040037 */ lbz r0, 0x37(r4)
/* 00005448 7C000775 */ extsb. r0, r0
/* 0000544C 4D820020 */ beqlr 
/* 00005450 88C40021 */ lbz r6, 0x21(r4)
/* 00005454 54A5083C */ slwi r5, r5, 1
/* 00005458 88040020 */ lbz r0, 0x20(r4)
/* 0000545C 7CA32A14 */ add r5, r3, r5
/* 00005460 88E40022 */ lbz r7, 0x22(r4)
/* 00005464 7CC40774 */ extsb r4, r6
/* 00005468 A8650008 */ lha r3, 8(r5)
/* 0000546C 7C000774 */ extsb r0, r0
/* 00005470 7CE60774 */ extsb r6, r7
/* 00005474 7C002214 */ add r0, r0, r4
/* 00005478 7C003214 */ add r0, r0, r6
/* 0000547C 7C030214 */ add r0, r3, r0
/* 00005480 B005000A */ sth r0, 0xa(r5)
/* 00005484 4E800020 */ blr 
lbl_00005488:
/* 00005488 7CC00775 */ extsb. r0, r6
/* 0000548C 4D820020 */ beqlr 
/* 00005490 54A6083C */ slwi r6, r5, 1
/* 00005494 88A40021 */ lbz r5, 0x21(r4)
/* 00005498 88040020 */ lbz r0, 0x20(r4)
/* 0000549C 7C833214 */ add r4, r3, r6
/* 000054A0 7CA50774 */ extsb r5, r5
/* 000054A4 A8640008 */ lha r3, 8(r4)
/* 000054A8 7C000774 */ extsb r0, r0
/* 000054AC 7C002A14 */ add r0, r0, r5
/* 000054B0 7C030214 */ add r0, r3, r0
/* 000054B4 B004000A */ sth r0, 0xa(r4)
/* 000054B8 4E800020 */ blr 
lbl_000054BC:
/* 000054BC 3C600000 */ lis r3, lbl_1000013E@ha
/* 000054C0 88030000 */ lbz r0, lbl_1000013E@l(r3)
/* 000054C4 3C600000 */ lis r3, lbl_0000F020@ha
/* 000054C8 38830000 */ addi r4, r3, lbl_0000F020@l
/* 000054CC 7C000774 */ extsb r0, r0
/* 000054D0 2C000002 */ cmpwi r0, 2
/* 000054D4 4080000C */ bge lbl_000054E0
/* 000054D8 38600000 */ li r3, 0
/* 000054DC 4E800020 */ blr 
lbl_000054E0:
/* 000054E0 3C600000 */ lis r3, lbl_1000013C@ha
/* 000054E4 A0A30000 */ lhz r5, lbl_1000013C@l(r3)
/* 000054E8 54A007FF */ clrlwi. r0, r5, 0x1f
/* 000054EC 4182000C */ beq lbl_000054F8
/* 000054F0 38600000 */ li r3, 0
/* 000054F4 4E800020 */ blr 
lbl_000054F8:
/* 000054F8 38000029 */ li r0, 0x29
/* 000054FC 7C0903A6 */ mtctr r0
/* 00005500 38641F78 */ addi r3, r4, 0x1f78
lbl_00005504:
/* 00005504 A0030000 */ lhz r0, 0(r3)
/* 00005508 7C050040 */ cmplw r5, r0
/* 0000550C 4082000C */ bne lbl_00005518
/* 00005510 38600000 */ li r3, 0
/* 00005514 4E800020 */ blr 
lbl_00005518:
/* 00005518 38630002 */ addi r3, r3, 2
/* 0000551C 4200FFE8 */ bdnz lbl_00005504
/* 00005520 3800001B */ li r0, 0x1b
/* 00005524 7C0903A6 */ mtctr r0
/* 00005528 38641FCC */ addi r3, r4, 0x1fcc
/* 0000552C 38C00000 */ li r6, 0
lbl_00005530:
/* 00005530 A0030004 */ lhz r0, 4(r3)
/* 00005534 7C050040 */ cmplw r5, r0
/* 00005538 40820014 */ bne lbl_0000554C
/* 0000553C 54C01838 */ slwi r0, r6, 3
/* 00005540 7C640214 */ add r3, r4, r0
/* 00005544 80631FCC */ lwz r3, 0x1fcc(r3)
/* 00005548 4E800020 */ blr 
lbl_0000554C:
/* 0000554C 38630008 */ addi r3, r3, 8
/* 00005550 38C60001 */ addi r6, r6, 1
/* 00005554 4200FFDC */ bdnz lbl_00005530
/* 00005558 3C600000 */ lis r3, lbl_00015380@ha
/* 0000555C 38630000 */ addi r3, r3, lbl_00015380@l
/* 00005560 4E800020 */ blr 
lbl_00005564:
/* 00005564 7C0802A6 */ mflr r0
/* 00005568 3C600000 */ lis r3, lbl_0000F020@ha
/* 0000556C 90010004 */ stw r0, 4(r1)
/* 00005570 3800000A */ li r0, 0xa
/* 00005574 7C0903A6 */ mtctr r0
/* 00005578 9421FD38 */ stwu r1, -0x2c8(r1)
/* 0000557C DBE102C0 */ stfd f31, 0x2c0(r1)
/* 00005580 FFE00890 */ fmr f31, f1
/* 00005584 38A10234 */ addi r5, r1, 0x234
/* 00005588 DBC102B8 */ stfd f30, 0x2b8(r1)
/* 0000558C BF4102A0 */ stmw r26, 0x2a0(r1)
/* 00005590 3BA30000 */ addi r29, r3, lbl_0000F020@l
/* 00005594 3C600000 */ lis r3, lbl_10000000@ha
/* 00005598 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 0000559C 389D0188 */ addi r4, r29, 0x188
lbl_000055A0:
/* 000055A0 84640008 */ lwzu r3, 8(r4)
/* 000055A4 80040004 */ lwz r0, 4(r4)
/* 000055A8 94650008 */ stwu r3, 8(r5)
/* 000055AC 90050004 */ stw r0, 4(r5)
/* 000055B0 4200FFF0 */ bdnz lbl_000055A0
/* 000055B4 3800000A */ li r0, 0xa
/* 000055B8 7C0903A6 */ mtctr r0
/* 000055BC 38A101E4 */ addi r5, r1, 0x1e4
/* 000055C0 389D01D8 */ addi r4, r29, 0x1d8
lbl_000055C4:
/* 000055C4 84640008 */ lwzu r3, 8(r4)
/* 000055C8 80040004 */ lwz r0, 4(r4)
/* 000055CC 94650008 */ stwu r3, 8(r5)
/* 000055D0 90050004 */ stw r0, 4(r5)
/* 000055D4 4200FFF0 */ bdnz lbl_000055C4
/* 000055D8 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000055DC 80C30000 */ lwz r6, currentBallStructPtr@l(r3)
/* 000055E0 3800000A */ li r0, 0xa
/* 000055E4 7C0903A6 */ mtctr r0
/* 000055E8 38A10194 */ addi r5, r1, 0x194
/* 000055EC 8806014A */ lbz r0, 0x14a(r6)
/* 000055F0 1C000050 */ mulli r0, r0, 0x50
/* 000055F4 7C7D0214 */ add r3, r29, r0
/* 000055F8 38830408 */ addi r4, r3, 0x408
lbl_000055FC:
/* 000055FC 84640008 */ lwzu r3, 8(r4)
/* 00005600 80040004 */ lwz r0, 4(r4)
/* 00005604 94650008 */ stwu r3, 8(r5)
/* 00005608 90050004 */ stw r0, 4(r5)
/* 0000560C 4200FFF0 */ bdnz lbl_000055FC
/* 00005610 806600FC */ lwz r3, 0xfc(r6)
/* 00005614 3800000A */ li r0, 0xa
/* 00005618 7C0903A6 */ mtctr r0
/* 0000561C 38A10144 */ addi r5, r1, 0x144
/* 00005620 80030010 */ lwz r0, 0x10(r3)
/* 00005624 1C000050 */ mulli r0, r0, 0x50
/* 00005628 7C7D0214 */ add r3, r29, r0
/* 0000562C 38830548 */ addi r4, r3, 0x548
lbl_00005630:
/* 00005630 84640008 */ lwzu r3, 8(r4)
/* 00005634 80040004 */ lwz r0, 4(r4)
/* 00005638 94650008 */ stwu r3, 8(r5)
/* 0000563C 90050004 */ stw r0, 4(r5)
/* 00005640 4200FFF0 */ bdnz lbl_00005630
/* 00005644 3C600000 */ lis r3, gamePauseStatus@ha
/* 00005648 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 0000564C 7000000A */ andi. r0, r0, 0xa
/* 00005650 408200D0 */ bne lbl_00005720
/* 00005654 A89E0174 */ lha r4, 0x174(r30)
/* 00005658 3C600000 */ lis r3, lbl_00010D58@ha
/* 0000565C C01D20A4 */ lfs f0, 0x20a4(r29)
/* 00005660 6C808000 */ xoris r0, r4, 0x8000
/* 00005664 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 00005668 9001029C */ stw r0, 0x29c(r1)
/* 0000566C 3C004330 */ lis r0, 0x4330
/* 00005670 EC0007F2 */ fmuls f0, f0, f31
/* 00005674 90010298 */ stw r0, 0x298(r1)
/* 00005678 C8210298 */ lfd f1, 0x298(r1)
/* 0000567C EC211028 */ fsubs f1, f1, f2
/* 00005680 EC01002A */ fadds f0, f1, f0
/* 00005684 FC00001E */ fctiwz f0, f0
/* 00005688 D8010290 */ stfd f0, 0x290(r1)
/* 0000568C 80010294 */ lwz r0, 0x294(r1)
/* 00005690 B01E0174 */ sth r0, 0x174(r30)
/* 00005694 C81D1DC0 */ lfd f0, 0x1dc0(r29)
/* 00005698 FC00F800 */ fcmpu cr0, f0, f31
/* 0000569C 41820084 */ beq lbl_00005720
/* 000056A0 A81E0174 */ lha r0, 0x174(r30)
/* 000056A4 2C000000 */ cmpwi r0, 0
/* 000056A8 41800078 */ blt lbl_00005720
/* 000056AC 7C800735 */ extsh. r0, r4
/* 000056B0 40800070 */ bge lbl_00005720
/* 000056B4 3860009C */ li r3, 0x9c
/* 000056B8 4BFFAAA9 */ bl func_8002B610
/* 000056BC 3B430000 */ addi r26, r3, 0
/* 000056C0 2C1AFFFF */ cmpwi r26, -1
/* 000056C4 4182005C */ beq lbl_00005720
/* 000056C8 C01E0170 */ lfs f0, 0x170(r30)
/* 000056CC 5743043E */ clrlwi r3, r26, 0x10
/* 000056D0 C83D20B0 */ lfd f1, 0x20b0(r29)
/* 000056D4 FC000210 */ fabs f0, f0
/* 000056D8 C85D20A8 */ lfd f2, 0x20a8(r29)
/* 000056DC FC010032 */ fmul f0, f1, f0
/* 000056E0 FC02002A */ fadd f0, f2, f0
/* 000056E4 FC00001E */ fctiwz f0, f0
/* 000056E8 D8010290 */ stfd f0, 0x290(r1)
/* 000056EC 80810294 */ lwz r4, 0x294(r1)
/* 000056F0 4BFFAA71 */ bl func_8002C100
/* 000056F4 C01E0170 */ lfs f0, 0x170(r30)
/* 000056F8 5743043E */ clrlwi r3, r26, 0x10
/* 000056FC C83D20C0 */ lfd f1, 0x20c0(r29)
/* 00005700 FC000210 */ fabs f0, f0
/* 00005704 C85D20B8 */ lfd f2, 0x20b8(r29)
/* 00005708 FC010032 */ fmul f0, f1, f0
/* 0000570C FC02002A */ fadd f0, f2, f0
/* 00005710 FC00001E */ fctiwz f0, f0
/* 00005714 D8010298 */ stfd f0, 0x298(r1)
/* 00005718 8081029C */ lwz r4, 0x29c(r1)
/* 0000571C 4BFFAA45 */ bl func_8002C3E0
lbl_00005720:
/* 00005720 A81E0174 */ lha r0, 0x174(r30)
/* 00005724 900101C4 */ stw r0, 0x1c4(r1)
/* 00005728 90010174 */ stw r0, 0x174(r1)
/* 0000572C C81D1DC0 */ lfd f0, 0x1dc0(r29)
/* 00005730 FC1F0040 */ fcmpo cr0, f31, f0
/* 00005734 4C411382 */ cror 2, 1, 2
/* 00005738 40820050 */ bne lbl_00005788
/* 0000573C 3800000A */ li r0, 0xa
/* 00005740 7C0903A6 */ mtctr r0
/* 00005744 38A100F4 */ addi r5, r1, 0xf4
/* 00005748 389D02C8 */ addi r4, r29, 0x2c8
lbl_0000574C:
/* 0000574C 84640008 */ lwzu r3, 8(r4)
/* 00005750 80040004 */ lwz r0, 4(r4)
/* 00005754 94650008 */ stwu r3, 8(r5)
/* 00005758 90050004 */ stw r0, 4(r5)
/* 0000575C 4200FFF0 */ bdnz lbl_0000574C
/* 00005760 3800000A */ li r0, 0xa
/* 00005764 7C0903A6 */ mtctr r0
/* 00005768 38A100A4 */ addi r5, r1, 0xa4
/* 0000576C 389D0318 */ addi r4, r29, 0x318
lbl_00005770:
/* 00005770 84640008 */ lwzu r3, 8(r4)
/* 00005774 80040004 */ lwz r0, 4(r4)
/* 00005778 94650008 */ stwu r3, 8(r5)
/* 0000577C 90050004 */ stw r0, 4(r5)
/* 00005780 4200FFF0 */ bdnz lbl_00005770
/* 00005784 4800004C */ b lbl_000057D0
lbl_00005788:
/* 00005788 3800000A */ li r0, 0xa
/* 0000578C 7C0903A6 */ mtctr r0
/* 00005790 38A100F4 */ addi r5, r1, 0xf4
/* 00005794 389D0368 */ addi r4, r29, 0x368
lbl_00005798:
/* 00005798 84640008 */ lwzu r3, 8(r4)
/* 0000579C 80040004 */ lwz r0, 4(r4)
/* 000057A0 94650008 */ stwu r3, 8(r5)
/* 000057A4 90050004 */ stw r0, 4(r5)
/* 000057A8 4200FFF0 */ bdnz lbl_00005798
/* 000057AC 3800000A */ li r0, 0xa
/* 000057B0 7C0903A6 */ mtctr r0
/* 000057B4 38A100A4 */ addi r5, r1, 0xa4
/* 000057B8 389D03B8 */ addi r4, r29, 0x3b8
lbl_000057BC:
/* 000057BC 84640008 */ lwzu r3, 8(r4)
/* 000057C0 80040004 */ lwz r0, 4(r4)
/* 000057C4 94650008 */ stwu r3, 8(r5)
/* 000057C8 90050004 */ stw r0, 4(r5)
/* 000057CC 4200FFF0 */ bdnz lbl_000057BC
lbl_000057D0:
/* 000057D0 C01D20C8 */ lfs f0, 0x20c8(r29)
/* 000057D4 EC0007F2 */ fmuls f0, f0, f31
/* 000057D8 FC00001E */ fctiwz f0, f0
/* 000057DC D8010290 */ stfd f0, 0x290(r1)
/* 000057E0 80010294 */ lwz r0, 0x294(r1)
/* 000057E4 900100D4 */ stw r0, 0xd4(r1)
/* 000057E8 90010124 */ stw r0, 0x124(r1)
/* 000057EC 80810124 */ lwz r4, 0x124(r1)
/* 000057F0 2C048000 */ cmpwi r4, -32768
/* 000057F4 40800048 */ bge lbl_0000583C
/* 000057F8 C01D20CC */ lfs f0, 0x20cc(r29)
/* 000057FC 386101EC */ addi r3, r1, 0x1ec
/* 00005800 D00101F8 */ stfs f0, 0x1f8(r1)
/* 00005804 C01D20D0 */ lfs f0, 0x20d0(r29)
/* 00005808 D00100B8 */ stfs f0, 0xb8(r1)
/* 0000580C C01D20D4 */ lfs f0, 0x20d4(r29)
/* 00005810 D0010248 */ stfs f0, 0x248(r1)
/* 00005814 C01D20D8 */ lfs f0, 0x20d8(r29)
/* 00005818 D0010108 */ stfs f0, 0x108(r1)
/* 0000581C 4BFFA945 */ bl draw_naomi_sprite
/* 00005820 386100AC */ addi r3, r1, 0xac
/* 00005824 4BFFA93D */ bl draw_naomi_sprite
/* 00005828 3861023C */ addi r3, r1, 0x23c
/* 0000582C 4BFFA935 */ bl draw_naomi_sprite
/* 00005830 386100FC */ addi r3, r1, 0xfc
/* 00005834 4BFFA92D */ bl draw_naomi_sprite
/* 00005838 480000DC */ b lbl_00005914
lbl_0000583C:
/* 0000583C 2C040000 */ cmpwi r4, 0
/* 00005840 40800038 */ bge lbl_00005878
/* 00005844 C01D20CC */ lfs f0, 0x20cc(r29)
/* 00005848 386101EC */ addi r3, r1, 0x1ec
/* 0000584C D00101F8 */ stfs f0, 0x1f8(r1)
/* 00005850 C01D20D0 */ lfs f0, 0x20d0(r29)
/* 00005854 D0010108 */ stfs f0, 0x108(r1)
/* 00005858 C01D20D4 */ lfs f0, 0x20d4(r29)
/* 0000585C D0010248 */ stfs f0, 0x248(r1)
/* 00005860 4BFFA901 */ bl draw_naomi_sprite
/* 00005864 386100FC */ addi r3, r1, 0xfc
/* 00005868 4BFFA8F9 */ bl draw_naomi_sprite
/* 0000586C 3861023C */ addi r3, r1, 0x23c
/* 00005870 4BFFA8F1 */ bl draw_naomi_sprite
/* 00005874 480000A0 */ b lbl_00005914
lbl_00005878:
/* 00005878 40820018 */ bne lbl_00005890
/* 0000587C 3861023C */ addi r3, r1, 0x23c
/* 00005880 4BFFA8E1 */ bl draw_naomi_sprite
/* 00005884 386101EC */ addi r3, r1, 0x1ec
/* 00005888 4BFFA8D9 */ bl draw_naomi_sprite
/* 0000588C 48000088 */ b lbl_00005914
lbl_00005890:
/* 00005890 3C600001 */ lis r3, 1
/* 00005894 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 00005898 7C040000 */ cmpw r4, r0
/* 0000589C 40800038 */ bge lbl_000058D4
/* 000058A0 C01D20CC */ lfs f0, 0x20cc(r29)
/* 000058A4 3861023C */ addi r3, r1, 0x23c
/* 000058A8 D0010248 */ stfs f0, 0x248(r1)
/* 000058AC C01D20D0 */ lfs f0, 0x20d0(r29)
/* 000058B0 D0010108 */ stfs f0, 0x108(r1)
/* 000058B4 C01D20D4 */ lfs f0, 0x20d4(r29)
/* 000058B8 D00101F8 */ stfs f0, 0x1f8(r1)
/* 000058BC 4BFFA8A5 */ bl draw_naomi_sprite
/* 000058C0 386100FC */ addi r3, r1, 0xfc
/* 000058C4 4BFFA89D */ bl draw_naomi_sprite
/* 000058C8 386101EC */ addi r3, r1, 0x1ec
/* 000058CC 4BFFA895 */ bl draw_naomi_sprite
/* 000058D0 48000044 */ b lbl_00005914
lbl_000058D4:
/* 000058D4 C01D20CC */ lfs f0, 0x20cc(r29)
/* 000058D8 3861023C */ addi r3, r1, 0x23c
/* 000058DC D0010248 */ stfs f0, 0x248(r1)
/* 000058E0 C01D20D0 */ lfs f0, 0x20d0(r29)
/* 000058E4 D00100B8 */ stfs f0, 0xb8(r1)
/* 000058E8 C01D20D4 */ lfs f0, 0x20d4(r29)
/* 000058EC D00101F8 */ stfs f0, 0x1f8(r1)
/* 000058F0 C01D20D8 */ lfs f0, 0x20d8(r29)
/* 000058F4 D0010108 */ stfs f0, 0x108(r1)
/* 000058F8 4BFFA869 */ bl draw_naomi_sprite
/* 000058FC 386100AC */ addi r3, r1, 0xac
/* 00005900 4BFFA861 */ bl draw_naomi_sprite
/* 00005904 386101EC */ addi r3, r1, 0x1ec
/* 00005908 4BFFA859 */ bl draw_naomi_sprite
/* 0000590C 386100FC */ addi r3, r1, 0xfc
/* 00005910 4BFFA851 */ bl draw_naomi_sprite
lbl_00005914:
/* 00005914 3861019C */ addi r3, r1, 0x19c
/* 00005918 4BFFA849 */ bl draw_naomi_sprite
/* 0000591C 3861014C */ addi r3, r1, 0x14c
/* 00005920 4BFFA841 */ bl draw_naomi_sprite
/* 00005924 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 00005928 3B9D0690 */ addi r28, r29, 0x690
/* 0000592C 3B7D0820 */ addi r27, r29, 0x820
/* 00005930 3BC30000 */ addi r30, r3, unpausedFrameCounter@l
/* 00005934 3B400000 */ li r26, 0
/* 00005938 3FE04330 */ lis r31, 0x4330
lbl_0000593C:
/* 0000593C 807E0000 */ lwz r3, 0(r30)
/* 00005940 6F408000 */ xoris r0, r26, 0x8000
/* 00005944 9001029C */ stw r0, 0x29c(r1)
/* 00005948 3C800000 */ lis r4, lbl_00010D60@ha
/* 0000594C 546006FE */ clrlwi r0, r3, 0x1b
/* 00005950 90010294 */ stw r0, 0x294(r1)
/* 00005954 3C600000 */ lis r3, lbl_00010D58@ha
/* 00005958 C8440000 */ lfd f2, lbl_00010D60@l(r4)
/* 0000595C 93E10290 */ stw r31, 0x290(r1)
/* 00005960 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00005964 C8010290 */ lfd f0, 0x290(r1)
/* 00005968 93E10298 */ stw r31, 0x298(r1)
/* 0000596C EC601028 */ fsubs f3, f0, f2
/* 00005970 C09D20DC */ lfs f4, 0x20dc(r29)
/* 00005974 C8010298 */ lfd f0, 0x298(r1)
/* 00005978 C85D1F50 */ lfd f2, 0x1f50(r29)
/* 0000597C FC000828 */ fsub f0, f0, f1
/* 00005980 EC2400F2 */ fmuls f1, f4, f3
/* 00005984 C8BD1D28 */ lfd f5, 0x1d28(r29)
/* 00005988 FC020032 */ fmul f0, f2, f0
/* 0000598C FC250828 */ fsub f1, f5, f1
/* 00005990 FC01002A */ fadd f0, f1, f0
/* 00005994 FC400018 */ frsp f2, f0
/* 00005998 FC022840 */ fcmpo cr0, f2, f5
/* 0000599C 4081000C */ ble lbl_000059A8
/* 000059A0 FC422828 */ fsub f2, f2, f5
/* 000059A4 FC401018 */ frsp f2, f2
lbl_000059A8:
/* 000059A8 C81D1DC0 */ lfd f0, 0x1dc0(r29)
/* 000059AC FC1F0040 */ fcmpo cr0, f31, f0
/* 000059B0 4C401382 */ cror 2, 0, 2
/* 000059B4 4082002C */ bne lbl_000059E0
/* 000059B8 3800000A */ li r0, 0xa
/* 000059BC 7C0903A6 */ mtctr r0
/* 000059C0 38A10054 */ addi r5, r1, 0x54
/* 000059C4 389CFFF8 */ addi r4, r28, -8  ;# fixed addi
lbl_000059C8:
/* 000059C8 84640008 */ lwzu r3, 8(r4)
/* 000059CC 80040004 */ lwz r0, 4(r4)
/* 000059D0 94650008 */ stwu r3, 8(r5)
/* 000059D4 90050004 */ stw r0, 4(r5)
/* 000059D8 4200FFF0 */ bdnz lbl_000059C8
/* 000059DC 48000044 */ b lbl_00005A20
lbl_000059E0:
/* 000059E0 201A0004 */ subfic r0, r26, 4
/* 000059E4 1C600050 */ mulli r3, r0, 0x50
/* 000059E8 3800000A */ li r0, 0xa
/* 000059EC 7C7D1A14 */ add r3, r29, r3
/* 000059F0 7C0903A6 */ mtctr r0
/* 000059F4 38A10054 */ addi r5, r1, 0x54
/* 000059F8 38830688 */ addi r4, r3, 0x688
lbl_000059FC:
/* 000059FC 84640008 */ lwzu r3, 8(r4)
/* 00005A00 80040004 */ lwz r0, 4(r4)
/* 00005A04 94650008 */ stwu r3, 8(r5)
/* 00005A08 90050004 */ stw r0, 4(r5)
/* 00005A0C 4200FFF0 */ bdnz lbl_000059FC
/* 00005A10 80610084 */ lwz r3, 0x84(r1)
/* 00005A14 3C630001 */ addis r3, r3, 1
/* 00005A18 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 00005A1C 90010084 */ stw r0, 0x84(r1)
lbl_00005A20:
/* 00005A20 C0210248 */ lfs f1, 0x248(r1)
/* 00005A24 EFC200B2 */ fmuls f30, f2, f2
/* 00005A28 C81D1D68 */ lfd f0, 0x1d68(r29)
/* 00005A2C 3861005C */ addi r3, r1, 0x5c
/* 00005A30 FC010028 */ fsub f0, f1, f0
/* 00005A34 FC000018 */ frsp f0, f0
/* 00005A38 D0010068 */ stfs f0, 0x68(r1)
/* 00005A3C D3C10088 */ stfs f30, 0x88(r1)
/* 00005A40 4BFFA721 */ bl draw_naomi_sprite
/* 00005A44 C81D1DC0 */ lfd f0, 0x1dc0(r29)
/* 00005A48 FC1F0040 */ fcmpo cr0, f31, f0
/* 00005A4C 4C411382 */ cror 2, 1, 2
/* 00005A50 4082002C */ bne lbl_00005A7C
/* 00005A54 3800000A */ li r0, 0xa
/* 00005A58 7C0903A6 */ mtctr r0
/* 00005A5C 38A10004 */ addi r5, r1, 4
/* 00005A60 389BFFF8 */ addi r4, r27, -8  ;# fixed addi
lbl_00005A64:
/* 00005A64 84640008 */ lwzu r3, 8(r4)
/* 00005A68 80040004 */ lwz r0, 4(r4)
/* 00005A6C 94650008 */ stwu r3, 8(r5)
/* 00005A70 90050004 */ stw r0, 4(r5)
/* 00005A74 4200FFF0 */ bdnz lbl_00005A64
/* 00005A78 48000044 */ b lbl_00005ABC
lbl_00005A7C:
/* 00005A7C 201A0004 */ subfic r0, r26, 4
/* 00005A80 1C600050 */ mulli r3, r0, 0x50
/* 00005A84 3800000A */ li r0, 0xa
/* 00005A88 7C7D1A14 */ add r3, r29, r3
/* 00005A8C 7C0903A6 */ mtctr r0
/* 00005A90 38A10004 */ addi r5, r1, 4
/* 00005A94 38830818 */ addi r4, r3, 0x818
lbl_00005A98:
/* 00005A98 84640008 */ lwzu r3, 8(r4)
/* 00005A9C 80040004 */ lwz r0, 4(r4)
/* 00005AA0 94650008 */ stwu r3, 8(r5)
/* 00005AA4 90050004 */ stw r0, 4(r5)
/* 00005AA8 4200FFF0 */ bdnz lbl_00005A98
/* 00005AAC 80610034 */ lwz r3, 0x34(r1)
/* 00005AB0 3C630001 */ addis r3, r3, 1
/* 00005AB4 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 00005AB8 90010034 */ stw r0, 0x34(r1)
lbl_00005ABC:
/* 00005ABC C02101F8 */ lfs f1, 0x1f8(r1)
/* 00005AC0 3861000C */ addi r3, r1, 0xc
/* 00005AC4 C81D1D68 */ lfd f0, 0x1d68(r29)
/* 00005AC8 FC010028 */ fsub f0, f1, f0
/* 00005ACC FC000018 */ frsp f0, f0
/* 00005AD0 D0010018 */ stfs f0, 0x18(r1)
/* 00005AD4 D3C10038 */ stfs f30, 0x38(r1)
/* 00005AD8 4BFFA689 */ bl draw_naomi_sprite
/* 00005ADC 3B5A0001 */ addi r26, r26, 1
/* 00005AE0 2C1A0005 */ cmpwi r26, 5
/* 00005AE4 3B9C0050 */ addi r28, r28, 0x50
/* 00005AE8 3B7B0050 */ addi r27, r27, 0x50
/* 00005AEC 4180FE50 */ blt lbl_0000593C
/* 00005AF0 BB4102A0 */ lmw r26, 0x2a0(r1)
/* 00005AF4 800102CC */ lwz r0, 0x2cc(r1)
/* 00005AF8 CBE102C0 */ lfd f31, 0x2c0(r1)
/* 00005AFC CBC102B8 */ lfd f30, 0x2b8(r1)
/* 00005B00 7C0803A6 */ mtlr r0
/* 00005B04 382102C8 */ addi r1, r1, 0x2c8
/* 00005B08 4E800020 */ blr 
lbl_00005B0C:
/* 00005B0C 7C0802A6 */ mflr r0
/* 00005B10 3C600000 */ lis r3, modeCtrl@ha
/* 00005B14 90010004 */ stw r0, 4(r1)
/* 00005B18 38630000 */ addi r3, r3, modeCtrl@l
/* 00005B1C 3C800000 */ lis r4, lbl_0000F020@ha
/* 00005B20 9421FF18 */ stwu r1, -0xe8(r1)
/* 00005B24 DBE100E0 */ stfd f31, 0xe0(r1)
/* 00005B28 DBC100D8 */ stfd f30, 0xd8(r1)
/* 00005B2C DBA100D0 */ stfd f29, 0xd0(r1)
/* 00005B30 DB8100C8 */ stfd f28, 0xc8(r1)
/* 00005B34 FF801090 */ fmr f28, f2
/* 00005B38 DB6100C0 */ stfd f27, 0xc0(r1)
/* 00005B3C FF600890 */ fmr f27, f1
/* 00005B40 BDC10078 */ stmw r14, 0x78(r1)
/* 00005B44 3AA3002C */ addi r21, r3, 0x2c
/* 00005B48 3BE40000 */ addi r31, r4, lbl_0000F020@l
/* 00005B4C 8003002C */ lwz r0, 0x2c(r3)
/* 00005B50 3C600000 */ lis r3, lbl_1000000C@ha
/* 00005B54 38630000 */ addi r3, r3, lbl_1000000C@l
/* 00005B58 1C00004C */ mulli r0, r0, 0x4c
/* 00005B5C 7C630214 */ add r3, r3, r0
/* 00005B60 88030006 */ lbz r0, 6(r3)
/* 00005B64 3C600000 */ lis r3, lbl_00014F20@ha
/* 00005B68 3A830000 */ addi r20, r3, lbl_00014F20@l
/* 00005B6C 7C050774 */ extsb r5, r0
/* 00005B70 2C050001 */ cmpwi r5, 1
/* 00005B74 4080000C */ bge lbl_00005B80
/* 00005B78 38A00001 */ li r5, 1
/* 00005B7C 48000010 */ b lbl_00005B8C
lbl_00005B80:
/* 00005B80 2C05000A */ cmpwi r5, 0xa
/* 00005B84 40810008 */ ble lbl_00005B8C
/* 00005B88 38A0000A */ li r5, 0xa
lbl_00005B8C:
/* 00005B8C 88140009 */ lbz r0, 9(r20)
/* 00005B90 7CB60774 */ extsb r22, r5
/* 00005B94 7C000774 */ extsb r0, r0
/* 00005B98 7C60B051 */ subf. r3, r0, r22
/* 00005B9C 40810010 */ ble lbl_00005BAC
/* 00005BA0 7C60B050 */ subf r3, r0, r22
/* 00005BA4 38630001 */ addi r3, r3, 1
/* 00005BA8 48000008 */ b lbl_00005BB0
lbl_00005BAC:
/* 00005BAC 38600001 */ li r3, 1
lbl_00005BB0:
/* 00005BB0 7C630774 */ extsb r3, r3
/* 00005BB4 98610065 */ stb r3, 0x65(r1)
/* 00005BB8 88610065 */ lbz r3, 0x65(r1)
/* 00005BBC 7C030214 */ add r0, r3, r0
/* 00005BC0 98010064 */ stb r0, 0x64(r1)
/* 00005BC4 4BFFA59D */ bl func_80071A8C
/* 00005BC8 3860003C */ li r3, 0x3c
/* 00005BCC 4BFFA595 */ bl func_80071AD4
/* 00005BD0 3C600053 */ lis r3, 0x53
/* 00005BD4 38632A02 */ addi r3, r3, 0x2a02
/* 00005BD8 4BFFA589 */ bl func_80071AE4
/* 00005BDC 3800000A */ li r0, 0xa
/* 00005BE0 7C0903A6 */ mtctr r0
/* 00005BE4 38A1000C */ addi r5, r1, 0xc
/* 00005BE8 389F1358 */ addi r4, r31, 0x1358
lbl_00005BEC:
/* 00005BEC 84640008 */ lwzu r3, 8(r4)
/* 00005BF0 80040004 */ lwz r0, 4(r4)
/* 00005BF4 94650008 */ stwu r3, 8(r5)
/* 00005BF8 90050004 */ stw r0, 4(r5)
/* 00005BFC 4200FFF0 */ bdnz lbl_00005BEC
/* 00005C00 C0010018 */ lfs f0, 0x18(r1)
/* 00005C04 38610014 */ addi r3, r1, 0x14
/* 00005C08 EC00D82A */ fadds f0, f0, f27
/* 00005C0C D0010018 */ stfs f0, 0x18(r1)
/* 00005C10 C001001C */ lfs f0, 0x1c(r1)
/* 00005C14 EC00E02A */ fadds f0, f0, f28
/* 00005C18 D001001C */ stfs f0, 0x1c(r1)
/* 00005C1C C3C10018 */ lfs f30, 0x18(r1)
/* 00005C20 C381001C */ lfs f28, 0x1c(r1)
/* 00005C24 4BFFA53D */ bl draw_naomi_sprite
/* 00005C28 C03F20E4 */ lfs f1, 0x20e4(r31)
/* 00005C2C C01F20E8 */ lfs f0, 0x20e8(r31)
/* 00005C30 88010064 */ lbz r0, 0x64(r1)
/* 00005C34 EFDE082A */ fadds f30, f30, f1
/* 00005C38 EFA0E02A */ fadds f29, f0, f28
/* 00005C3C 8B010065 */ lbz r24, 0x65(r1)
/* 00005C40 7C120774 */ extsb r18, r0
/* 00005C44 480000D8 */ b lbl_00005D1C
lbl_00005C48:
/* 00005C48 7F000774 */ extsb r0, r24
/* 00005C4C 2C00000A */ cmpwi r0, 0xa
/* 00005C50 4182005C */ beq lbl_00005CAC
/* 00005C54 3800000A */ li r0, 0xa
/* 00005C58 7C0903A6 */ mtctr r0
/* 00005C5C 3881000C */ addi r4, r1, 0xc
/* 00005C60 387F13A8 */ addi r3, r31, 0x13a8
lbl_00005C64:
/* 00005C64 84A30008 */ lwzu r5, 8(r3)
/* 00005C68 80030004 */ lwz r0, 4(r3)
/* 00005C6C 94A40008 */ stwu r5, 8(r4)
/* 00005C70 90040004 */ stw r0, 4(r4)
/* 00005C74 4200FFF0 */ bdnz lbl_00005C64
/* 00005C78 D3C10018 */ stfs f30, 0x18(r1)
/* 00005C7C 38610014 */ addi r3, r1, 0x14
/* 00005C80 D381001C */ stfs f28, 0x1c(r1)
/* 00005C84 4BFFA4DD */ bl draw_naomi_sprite
/* 00005C88 C01F20EC */ lfs f0, 0x20ec(r31)
/* 00005C8C FC40E890 */ fmr f2, f29
/* 00005C90 EC20F02A */ fadds f1, f0, f30
/* 00005C94 4BFFA4CD */ bl func_80071B60
/* 00005C98 7F03C378 */ mr r3, r24
/* 00005C9C 4BFFA4C5 */ bl func_80071B78
/* 00005CA0 C01F20F0 */ lfs f0, 0x20f0(r31)
/* 00005CA4 EFDE002A */ fadds f30, f30, f0
/* 00005CA8 48000070 */ b lbl_00005D18
lbl_00005CAC:
/* 00005CAC 3800000A */ li r0, 0xa
/* 00005CB0 7C0903A6 */ mtctr r0
/* 00005CB4 3881000C */ addi r4, r1, 0xc
/* 00005CB8 387F13F8 */ addi r3, r31, 0x13f8
lbl_00005CBC:
/* 00005CBC 84A30008 */ lwzu r5, 8(r3)
/* 00005CC0 80030004 */ lwz r0, 4(r3)
/* 00005CC4 94A40008 */ stwu r5, 8(r4)
/* 00005CC8 90040004 */ stw r0, 4(r4)
/* 00005CCC 4200FFF0 */ bdnz lbl_00005CBC
/* 00005CD0 D3C10018 */ stfs f30, 0x18(r1)
/* 00005CD4 38610014 */ addi r3, r1, 0x14
/* 00005CD8 D381001C */ stfs f28, 0x1c(r1)
/* 00005CDC 4BFFA485 */ bl draw_naomi_sprite
/* 00005CE0 C01F20F4 */ lfs f0, 0x20f4(r31)
/* 00005CE4 FC40E890 */ fmr f2, f29
/* 00005CE8 EC20F02A */ fadds f1, f0, f30
/* 00005CEC 4BFFA475 */ bl func_80071B60
/* 00005CF0 38600001 */ li r3, 1
/* 00005CF4 4BFFA46D */ bl func_80071B78
/* 00005CF8 C01F20F8 */ lfs f0, 0x20f8(r31)
/* 00005CFC FC40E890 */ fmr f2, f29
/* 00005D00 EC20F02A */ fadds f1, f0, f30
/* 00005D04 4BFFA45D */ bl func_80071B60
/* 00005D08 38600000 */ li r3, 0
/* 00005D0C 4BFFA455 */ bl func_80071B78
/* 00005D10 C01F20E4 */ lfs f0, 0x20e4(r31)
/* 00005D14 EFDE002A */ fadds f30, f30, f0
lbl_00005D18:
/* 00005D18 3B180001 */ addi r24, r24, 1
lbl_00005D1C:
/* 00005D1C 7F000774 */ extsb r0, r24
/* 00005D20 7C009000 */ cmpw r0, r18
/* 00005D24 4180FF24 */ blt lbl_00005C48
/* 00005D28 3800000A */ li r0, 0xa
/* 00005D2C 7C0903A6 */ mtctr r0
/* 00005D30 38A1000C */ addi r5, r1, 0xc
/* 00005D34 389F1448 */ addi r4, r31, 0x1448
lbl_00005D38:
/* 00005D38 84640008 */ lwzu r3, 8(r4)
/* 00005D3C 80040004 */ lwz r0, 4(r4)
/* 00005D40 94650008 */ stwu r3, 8(r5)
/* 00005D44 90050004 */ stw r0, 4(r5)
/* 00005D48 4200FFF0 */ bdnz lbl_00005D38
/* 00005D4C D3C10018 */ stfs f30, 0x18(r1)
/* 00005D50 38610014 */ addi r3, r1, 0x14
/* 00005D54 D381001C */ stfs f28, 0x1c(r1)
/* 00005D58 4BFFA409 */ bl draw_naomi_sprite
/* 00005D5C 88010064 */ lbz r0, 0x64(r1)
/* 00005D60 3C800000 */ lis r4, ballInfo@ha
/* 00005D64 C01F20FC */ lfs f0, 0x20fc(r31)
/* 00005D68 3C600000 */ lis r3, lbl_1000000C@ha
/* 00005D6C 7C110774 */ extsb r17, r0
/* 00005D70 38010010 */ addi r0, r1, 0x10
/* 00005D74 EF9C002A */ fadds f28, f28, f0
/* 00005D78 90010068 */ stw r0, 0x68(r1)
/* 00005D7C 39C40000 */ addi r14, r4, ballInfo@l
/* 00005D80 88010065 */ lbz r0, 0x65(r1)
/* 00005D84 3CC00000 */ lis r6, modeCtrl@ha
/* 00005D88 5400083C */ slwi r0, r0, 1
/* 00005D8C 9001006C */ stw r0, 0x6c(r1)
/* 00005D90 38060000 */ addi r0, r6, modeCtrl@l
/* 00005D94 3B830000 */ addi r28, r3, lbl_1000000C@l
/* 00005D98 3C8051EC */ lis r4, 0x51ec
/* 00005D9C 90010070 */ stw r0, 0x70(r1)
/* 00005DA0 3C606666 */ lis r3, 0x6666
/* 00005DA4 3CA00000 */ lis r5, unpausedFrameCounter@ha
/* 00005DA8 39FF18B0 */ addi r15, r31, 0x18b0
/* 00005DAC 3A44851F */ addi r18, r4, -31457  ;# fixed addi
/* 00005DB0 3B236667 */ addi r25, r3, 0x6667
/* 00005DB4 3A650000 */ addi r19, r5, unpausedFrameCounter@l
/* 00005DB8 3A000000 */ li r16, 0
/* 00005DBC 48000738 */ b lbl_000064F4
lbl_00005DC0:
/* 00005DC0 801F20E0 */ lwz r0, 0x20e0(r31)
/* 00005DC4 3860000A */ li r3, 0xa
/* 00005DC8 7C6903A6 */ mtctr r3
/* 00005DCC 80610068 */ lwz r3, 0x68(r1)
/* 00005DD0 90010010 */ stw r0, 0x10(r1)
/* 00005DD4 3881000C */ addi r4, r1, 0xc
/* 00005DD8 880E014A */ lbz r0, 0x14a(r14)
/* 00005DDC 7C0300AE */ lbzx r0, r3, r0
/* 00005DE0 1C000050 */ mulli r0, r0, 0x50
/* 00005DE4 7C7F0214 */ add r3, r31, r0
/* 00005DE8 386314E8 */ addi r3, r3, 0x14e8
lbl_00005DEC:
/* 00005DEC 84A30008 */ lwzu r5, 8(r3)
/* 00005DF0 80030004 */ lwz r0, 4(r3)
/* 00005DF4 94A40008 */ stwu r5, 8(r4)
/* 00005DF8 90040004 */ stw r0, 4(r4)
/* 00005DFC 4200FFF0 */ bdnz lbl_00005DEC
/* 00005E00 C0010018 */ lfs f0, 0x18(r1)
/* 00005E04 38610014 */ addi r3, r1, 0x14
/* 00005E08 EC00D82A */ fadds f0, f0, f27
/* 00005E0C D0010018 */ stfs f0, 0x18(r1)
/* 00005E10 D381001C */ stfs f28, 0x1c(r1)
/* 00005E14 4BFFA34D */ bl draw_naomi_sprite
/* 00005E18 3800000A */ li r0, 0xa
/* 00005E1C C3A10018 */ lfs f29, 0x18(r1)
/* 00005E20 7C0903A6 */ mtctr r0
/* 00005E24 3881000C */ addi r4, r1, 0xc
/* 00005E28 386FFFF8 */ addi r3, r15, -8  ;# fixed addi
lbl_00005E2C:
/* 00005E2C 84A30008 */ lwzu r5, 8(r3)
/* 00005E30 80030004 */ lwz r0, 4(r3)
/* 00005E34 94A40008 */ stwu r5, 8(r4)
/* 00005E38 90040004 */ stw r0, 4(r4)
/* 00005E3C 4200FFF0 */ bdnz lbl_00005E2C
/* 00005E40 C0010018 */ lfs f0, 0x18(r1)
/* 00005E44 38610014 */ addi r3, r1, 0x14
/* 00005E48 EC00E82A */ fadds f0, f0, f29
/* 00005E4C D0010018 */ stfs f0, 0x18(r1)
/* 00005E50 C001001C */ lfs f0, 0x1c(r1)
/* 00005E54 EC00E02A */ fadds f0, f0, f28
/* 00005E58 D001001C */ stfs f0, 0x1c(r1)
/* 00005E5C 4BFFA305 */ bl draw_naomi_sprite
/* 00005E60 C05F20E4 */ lfs f2, 0x20e4(r31)
/* 00005E64 C03F2100 */ lfs f1, 0x2100(r31)
/* 00005E68 C01F2104 */ lfs f0, 0x2104(r31)
/* 00005E6C EFBD102A */ fadds f29, f29, f2
/* 00005E70 8001006C */ lwz r0, 0x6c(r1)
/* 00005E74 EFE1E02A */ fadds f31, f1, f28
/* 00005E78 EFC0E02A */ fadds f30, f0, f28
/* 00005E7C 8BA10065 */ lbz r29, 0x65(r1)
/* 00005E80 7F1C0214 */ add r24, r28, r0
/* 00005E84 48000618 */ b lbl_0000649C
lbl_00005E88:
/* 00005E88 7FA00774 */ extsb r0, r29
/* 00005E8C ABD8000A */ lha r30, 0xa(r24)
/* 00005E90 2C00000A */ cmpwi r0, 0xa
/* 00005E94 418202A8 */ beq lbl_0000613C
/* 00005E98 3800000A */ li r0, 0xa
/* 00005E9C 7C0903A6 */ mtctr r0
/* 00005EA0 3881000C */ addi r4, r1, 0xc
/* 00005EA4 387F1628 */ addi r3, r31, 0x1628
lbl_00005EA8:
/* 00005EA8 84A30008 */ lwzu r5, 8(r3)
/* 00005EAC 80030004 */ lwz r0, 4(r3)
/* 00005EB0 94A40008 */ stwu r5, 8(r4)
/* 00005EB4 90040004 */ stw r0, 4(r4)
/* 00005EB8 4200FFF0 */ bdnz lbl_00005EA8
/* 00005EBC D3A10018 */ stfs f29, 0x18(r1)
/* 00005EC0 38610014 */ addi r3, r1, 0x14
/* 00005EC4 D381001C */ stfs f28, 0x1c(r1)
/* 00005EC8 4BFFA299 */ bl draw_naomi_sprite
/* 00005ECC 80150000 */ lwz r0, 0(r21)
/* 00005ED0 7C00B800 */ cmpw r0, r23
/* 00005ED4 40820084 */ bne lbl_00005F58
/* 00005ED8 7FA00774 */ extsb r0, r29
/* 00005EDC 7C00B000 */ cmpw r0, r22
/* 00005EE0 40820078 */ bne lbl_00005F58
/* 00005EE4 80140000 */ lwz r0, 0(r20)
/* 00005EE8 540005AF */ rlwinm. r0, r0, 0, 0x16, 0x17
/* 00005EEC 4082006C */ bne lbl_00005F58
/* 00005EF0 3800000A */ li r0, 0xa
/* 00005EF4 7C0903A6 */ mtctr r0
/* 00005EF8 3881000C */ addi r4, r1, 0xc
/* 00005EFC 387F1308 */ addi r3, r31, 0x1308
lbl_00005F00:
/* 00005F00 84A30008 */ lwzu r5, 8(r3)
/* 00005F04 80030004 */ lwz r0, 4(r3)
/* 00005F08 94A40008 */ stwu r5, 8(r4)
/* 00005F0C 90040004 */ stw r0, 4(r4)
/* 00005F10 4200FFF0 */ bdnz lbl_00005F00
/* 00005F14 C0010018 */ lfs f0, 0x18(r1)
/* 00005F18 EC00E82A */ fadds f0, f0, f29
/* 00005F1C D0010018 */ stfs f0, 0x18(r1)
/* 00005F20 C001001C */ lfs f0, 0x1c(r1)
/* 00005F24 EC00E02A */ fadds f0, f0, f28
/* 00005F28 D001001C */ stfs f0, 0x1c(r1)
/* 00005F2C 80130000 */ lwz r0, 0(r19)
/* 00005F30 5403542A */ rlwinm r3, r0, 0xa, 0x10, 0x15
/* 00005F34 4BFFA22D */ bl mathutil_sin
/* 00005F38 C85F2110 */ lfd f2, 0x2110(r31)
/* 00005F3C 38610014 */ addi r3, r1, 0x14
/* 00005F40 C81F2108 */ lfd f0, 0x2108(r31)
/* 00005F44 FC220072 */ fmul f1, f2, f1
/* 00005F48 FC00082A */ fadd f0, f0, f1
/* 00005F4C FC000018 */ frsp f0, f0
/* 00005F50 D0010040 */ stfs f0, 0x40(r1)
/* 00005F54 4BFFA20D */ bl draw_naomi_sprite
lbl_00005F58:
/* 00005F58 7FA30774 */ extsb r3, r29
/* 00005F5C 3B43FFFF */ addi r26, r3, -1  ;# fixed addi
/* 00005F60 5740083C */ slwi r0, r26, 1
/* 00005F64 387C0000 */ addi r3, r28, 0
/* 00005F68 7C040774 */ extsb r4, r0
/* 00005F6C 480006E1 */ bl lbl_0000664C
/* 00005F70 3B630000 */ addi r27, r3, 0
/* 00005F74 7F600775 */ extsb. r0, r27
/* 00005F78 40810020 */ ble lbl_00005F98
/* 00005F7C C01F2100 */ lfs f0, 0x2100(r31)
/* 00005F80 FC40F890 */ fmr f2, f31
/* 00005F84 EC20E82A */ fadds f1, f0, f29
/* 00005F88 4BFFA1D9 */ bl func_80071B60
/* 00005F8C 7F63DB78 */ mr r3, r27
/* 00005F90 4BFFA1D1 */ bl func_80071B78
/* 00005F94 48000068 */ b lbl_00005FFC
lbl_00005F98:
/* 00005F98 7F600775 */ extsb. r0, r27
/* 00005F9C 40800060 */ bge lbl_00005FFC
/* 00005FA0 3800000A */ li r0, 0xa
/* 00005FA4 7C0903A6 */ mtctr r0
/* 00005FA8 3881000C */ addi r4, r1, 0xc
/* 00005FAC 387F1858 */ addi r3, r31, 0x1858
lbl_00005FB0:
/* 00005FB0 84A30008 */ lwzu r5, 8(r3)
/* 00005FB4 80030004 */ lwz r0, 4(r3)
/* 00005FB8 94A40008 */ stwu r5, 8(r4)
/* 00005FBC 90040004 */ stw r0, 4(r4)
/* 00005FC0 4200FFF0 */ bdnz lbl_00005FB0
/* 00005FC4 C0010018 */ lfs f0, 0x18(r1)
/* 00005FC8 38610014 */ addi r3, r1, 0x14
/* 00005FCC EC00E82A */ fadds f0, f0, f29
/* 00005FD0 D0010018 */ stfs f0, 0x18(r1)
/* 00005FD4 C001001C */ lfs f0, 0x1c(r1)
/* 00005FD8 EC00E02A */ fadds f0, f0, f28
/* 00005FDC D001001C */ stfs f0, 0x1c(r1)
/* 00005FE0 4BFFA181 */ bl draw_naomi_sprite
/* 00005FE4 C01F2100 */ lfs f0, 0x2100(r31)
/* 00005FE8 FC40F890 */ fmr f2, f31
/* 00005FEC EC20E82A */ fadds f1, f0, f29
/* 00005FF0 4BFFA171 */ bl func_80071B60
/* 00005FF4 7C7B00D0 */ neg r3, r27
/* 00005FF8 4BFFA169 */ bl func_80071B78
lbl_00005FFC:
/* 00005FFC 5744083C */ slwi r4, r26, 1
/* 00006000 387C0000 */ addi r3, r28, 0
/* 00006004 38840001 */ addi r4, r4, 1
/* 00006008 48000645 */ bl lbl_0000664C
/* 0000600C 3B630000 */ addi r27, r3, 0
/* 00006010 7F600775 */ extsb. r0, r27
/* 00006014 4081001C */ ble lbl_00006030
/* 00006018 C01F20FC */ lfs f0, 0x20fc(r31)
/* 0000601C FC40F890 */ fmr f2, f31
/* 00006020 EC20E82A */ fadds f1, f0, f29
/* 00006024 4BFFA13D */ bl func_80071B60
/* 00006028 7F63DB78 */ mr r3, r27
/* 0000602C 4BFFA135 */ bl func_80071B78
lbl_00006030:
/* 00006030 2C1EFFFF */ cmpwi r30, -1
/* 00006034 418200FC */ beq lbl_00006130
/* 00006038 2C1E000A */ cmpwi r30, 0xa
/* 0000603C 40800020 */ bge lbl_0000605C
/* 00006040 C01F2118 */ lfs f0, 0x2118(r31)
/* 00006044 FC40F090 */ fmr f2, f30
/* 00006048 EC20E82A */ fadds f1, f0, f29
/* 0000604C 4BFFA115 */ bl func_80071B60
/* 00006050 7FC30774 */ extsb r3, r30
/* 00006054 4BFFA10D */ bl func_80071B78
/* 00006058 480000D8 */ b lbl_00006130
lbl_0000605C:
/* 0000605C 2C1E0064 */ cmpwi r30, 0x64
/* 00006060 40800054 */ bge lbl_000060B4
/* 00006064 7C19F096 */ mulhw r0, r25, r30
/* 00006068 C01F1F70 */ lfs f0, 0x1f70(r31)
/* 0000606C FC40F090 */ fmr f2, f30
/* 00006070 EC20E82A */ fadds f1, f0, f29
/* 00006074 7C001670 */ srawi r0, r0, 2
/* 00006078 54030FFE */ srwi r3, r0, 0x1f
/* 0000607C 7C001A14 */ add r0, r0, r3
/* 00006080 7C1B0734 */ extsh r27, r0
/* 00006084 1C1B000A */ mulli r0, r27, 0xa
/* 00006088 7F40F050 */ subf r26, r0, r30
/* 0000608C 4BFFA0D5 */ bl func_80071B60
/* 00006090 7F630774 */ extsb r3, r27
/* 00006094 4BFFA0CD */ bl func_80071B78
/* 00006098 C01F1D48 */ lfs f0, 0x1d48(r31)
/* 0000609C FC40F090 */ fmr f2, f30
/* 000060A0 EC20E82A */ fadds f1, f0, f29
/* 000060A4 4BFFA0BD */ bl func_80071B60
/* 000060A8 7F430774 */ extsb r3, r26
/* 000060AC 4BFFA0B5 */ bl func_80071B78
/* 000060B0 48000080 */ b lbl_00006130
lbl_000060B4:
/* 000060B4 7C12F096 */ mulhw r0, r18, r30
/* 000060B8 FC20E890 */ fmr f1, f29
/* 000060BC FC40F090 */ fmr f2, f30
/* 000060C0 7C002E70 */ srawi r0, r0, 5
/* 000060C4 54030FFE */ srwi r3, r0, 0x1f
/* 000060C8 7C001A14 */ add r0, r0, r3
/* 000060CC 7C1A0734 */ extsh r26, r0
/* 000060D0 1C1A0064 */ mulli r0, r26, 0x64
/* 000060D4 7C00F050 */ subf r0, r0, r30
/* 000060D8 7C790096 */ mulhw r3, r25, r0
/* 000060DC 7C631670 */ srawi r3, r3, 2
/* 000060E0 54640FFE */ srwi r4, r3, 0x1f
/* 000060E4 7C632214 */ add r3, r3, r4
/* 000060E8 7C7B0734 */ extsh r27, r3
/* 000060EC 1C7B000A */ mulli r3, r27, 0xa
/* 000060F0 7FC30050 */ subf r30, r3, r0
/* 000060F4 4BFFA06D */ bl func_80071B60
/* 000060F8 7F430774 */ extsb r3, r26
/* 000060FC 4BFFA065 */ bl func_80071B78
/* 00006100 C01F2118 */ lfs f0, 0x2118(r31)
/* 00006104 FC40F090 */ fmr f2, f30
/* 00006108 EC20E82A */ fadds f1, f0, f29
/* 0000610C 4BFFA055 */ bl func_80071B60
/* 00006110 7F630774 */ extsb r3, r27
/* 00006114 4BFFA04D */ bl func_80071B78
/* 00006118 C01F211C */ lfs f0, 0x211c(r31)
/* 0000611C FC40F090 */ fmr f2, f30
/* 00006120 EC20E82A */ fadds f1, f0, f29
/* 00006124 4BFFA03D */ bl func_80071B60
/* 00006128 7FC30774 */ extsb r3, r30
/* 0000612C 4BFFA035 */ bl func_80071B78
lbl_00006130:
/* 00006130 C01F20F0 */ lfs f0, 0x20f0(r31)
/* 00006134 EFBD002A */ fadds f29, f29, f0
/* 00006138 4800035C */ b lbl_00006494
lbl_0000613C:
/* 0000613C 3800000A */ li r0, 0xa
/* 00006140 7C0903A6 */ mtctr r0
/* 00006144 3881000C */ addi r4, r1, 0xc
/* 00006148 387F1678 */ addi r3, r31, 0x1678
lbl_0000614C:
/* 0000614C 84A30008 */ lwzu r5, 8(r3)
/* 00006150 80030004 */ lwz r0, 4(r3)
/* 00006154 94A40008 */ stwu r5, 8(r4)
/* 00006158 90040004 */ stw r0, 4(r4)
/* 0000615C 4200FFF0 */ bdnz lbl_0000614C
/* 00006160 D3A10018 */ stfs f29, 0x18(r1)
/* 00006164 38610014 */ addi r3, r1, 0x14
/* 00006168 D381001C */ stfs f28, 0x1c(r1)
/* 0000616C 4BFF9FF5 */ bl draw_naomi_sprite
/* 00006170 80150000 */ lwz r0, 0(r21)
/* 00006174 7C00B800 */ cmpw r0, r23
/* 00006178 40820098 */ bne lbl_00006210
/* 0000617C 7FA00774 */ extsb r0, r29
/* 00006180 7C00B000 */ cmpw r0, r22
/* 00006184 4082008C */ bne lbl_00006210
/* 00006188 80140000 */ lwz r0, 0(r20)
/* 0000618C 540005AF */ rlwinm. r0, r0, 0, 0x16, 0x17
/* 00006190 40820080 */ bne lbl_00006210
/* 00006194 3800000A */ li r0, 0xa
/* 00006198 7C0903A6 */ mtctr r0
/* 0000619C 3881000C */ addi r4, r1, 0xc
/* 000061A0 387F1308 */ addi r3, r31, 0x1308
lbl_000061A4:
/* 000061A4 84A30008 */ lwzu r5, 8(r3)
/* 000061A8 80030004 */ lwz r0, 4(r3)
/* 000061AC 94A40008 */ stwu r5, 8(r4)
/* 000061B0 90040004 */ stw r0, 4(r4)
/* 000061B4 4200FFF0 */ bdnz lbl_000061A4
/* 000061B8 C0010018 */ lfs f0, 0x18(r1)
/* 000061BC EC00E82A */ fadds f0, f0, f29
/* 000061C0 D0010018 */ stfs f0, 0x18(r1)
/* 000061C4 C001001C */ lfs f0, 0x1c(r1)
/* 000061C8 EC00E02A */ fadds f0, f0, f28
/* 000061CC D001001C */ stfs f0, 0x1c(r1)
/* 000061D0 C0210024 */ lfs f1, 0x24(r1)
/* 000061D4 C81F2120 */ lfd f0, 0x2120(r31)
/* 000061D8 FC010032 */ fmul f0, f1, f0
/* 000061DC FC000018 */ frsp f0, f0
/* 000061E0 D0010024 */ stfs f0, 0x24(r1)
/* 000061E4 80130000 */ lwz r0, 0(r19)
/* 000061E8 5403542A */ rlwinm r3, r0, 0xa, 0x10, 0x15
/* 000061EC 4BFF9F75 */ bl mathutil_sin
/* 000061F0 C85F2110 */ lfd f2, 0x2110(r31)
/* 000061F4 38610014 */ addi r3, r1, 0x14
/* 000061F8 C81F2108 */ lfd f0, 0x2108(r31)
/* 000061FC FC220072 */ fmul f1, f2, f1
/* 00006200 FC00082A */ fadd f0, f0, f1
/* 00006204 FC000018 */ frsp f0, f0
/* 00006208 D0010040 */ stfs f0, 0x40(r1)
/* 0000620C 4BFF9F55 */ bl draw_naomi_sprite
lbl_00006210:
/* 00006210 7FA30774 */ extsb r3, r29
/* 00006214 3B43FFFF */ addi r26, r3, -1  ;# fixed addi
/* 00006218 5740083C */ slwi r0, r26, 1
/* 0000621C 387C0000 */ addi r3, r28, 0
/* 00006220 7C040774 */ extsb r4, r0
/* 00006224 48000429 */ bl lbl_0000664C
/* 00006228 3B630000 */ addi r27, r3, 0
/* 0000622C 7F600775 */ extsb. r0, r27
/* 00006230 40810020 */ ble lbl_00006250
/* 00006234 C01F1C9C */ lfs f0, 0x1c9c(r31)
/* 00006238 FC40F890 */ fmr f2, f31
/* 0000623C EC20E82A */ fadds f1, f0, f29
/* 00006240 4BFF9F21 */ bl func_80071B60
/* 00006244 7F63DB78 */ mr r3, r27
/* 00006248 4BFF9F19 */ bl func_80071B78
/* 0000624C 48000068 */ b lbl_000062B4
lbl_00006250:
/* 00006250 7F600775 */ extsb. r0, r27
/* 00006254 40800060 */ bge lbl_000062B4
/* 00006258 3800000A */ li r0, 0xa
/* 0000625C 7C0903A6 */ mtctr r0
/* 00006260 3881000C */ addi r4, r1, 0xc
/* 00006264 387F1858 */ addi r3, r31, 0x1858
lbl_00006268:
/* 00006268 84A30008 */ lwzu r5, 8(r3)
/* 0000626C 80030004 */ lwz r0, 4(r3)
/* 00006270 94A40008 */ stwu r5, 8(r4)
/* 00006274 90040004 */ stw r0, 4(r4)
/* 00006278 4200FFF0 */ bdnz lbl_00006268
/* 0000627C C0010018 */ lfs f0, 0x18(r1)
/* 00006280 38610014 */ addi r3, r1, 0x14
/* 00006284 EC00E82A */ fadds f0, f0, f29
/* 00006288 D0010018 */ stfs f0, 0x18(r1)
/* 0000628C C001001C */ lfs f0, 0x1c(r1)
/* 00006290 EC00E02A */ fadds f0, f0, f28
/* 00006294 D001001C */ stfs f0, 0x1c(r1)
/* 00006298 4BFF9EC9 */ bl draw_naomi_sprite
/* 0000629C C01F1C9C */ lfs f0, 0x1c9c(r31)
/* 000062A0 FC40F890 */ fmr f2, f31
/* 000062A4 EC20E82A */ fadds f1, f0, f29
/* 000062A8 4BFF9EB9 */ bl func_80071B60
/* 000062AC 7C7B00D0 */ neg r3, r27
/* 000062B0 4BFF9EB1 */ bl func_80071B78
lbl_000062B4:
/* 000062B4 575A083C */ slwi r26, r26, 1
/* 000062B8 387C0000 */ addi r3, r28, 0
/* 000062BC 389A0001 */ addi r4, r26, 1
/* 000062C0 4800038D */ bl lbl_0000664C
/* 000062C4 3B630000 */ addi r27, r3, 0
/* 000062C8 7F600775 */ extsb. r0, r27
/* 000062CC 40810020 */ ble lbl_000062EC
/* 000062D0 C01F2128 */ lfs f0, 0x2128(r31)
/* 000062D4 FC40F890 */ fmr f2, f31
/* 000062D8 EC20E82A */ fadds f1, f0, f29
/* 000062DC 4BFF9E85 */ bl func_80071B60
/* 000062E0 7F63DB78 */ mr r3, r27
/* 000062E4 4BFF9E7D */ bl func_80071B78
/* 000062E8 48000070 */ b lbl_00006358
lbl_000062EC:
/* 000062EC 7F600775 */ extsb. r0, r27
/* 000062F0 40800068 */ bge lbl_00006358
/* 000062F4 3800000A */ li r0, 0xa
/* 000062F8 7C0903A6 */ mtctr r0
/* 000062FC 3881000C */ addi r4, r1, 0xc
/* 00006300 387F1858 */ addi r3, r31, 0x1858
lbl_00006304:
/* 00006304 84A30008 */ lwzu r5, 8(r3)
/* 00006308 80030004 */ lwz r0, 4(r3)
/* 0000630C 94A40008 */ stwu r5, 8(r4)
/* 00006310 90040004 */ stw r0, 4(r4)
/* 00006314 4200FFF0 */ bdnz lbl_00006304
/* 00006318 C01F212C */ lfs f0, 0x212c(r31)
/* 0000631C 38610014 */ addi r3, r1, 0x14
/* 00006320 C0210018 */ lfs f1, 0x18(r1)
/* 00006324 EC00E82A */ fadds f0, f0, f29
/* 00006328 EC01002A */ fadds f0, f1, f0
/* 0000632C D0010018 */ stfs f0, 0x18(r1)
/* 00006330 C001001C */ lfs f0, 0x1c(r1)
/* 00006334 EC00E02A */ fadds f0, f0, f28
/* 00006338 D001001C */ stfs f0, 0x1c(r1)
/* 0000633C 4BFF9E25 */ bl draw_naomi_sprite
/* 00006340 C01F2128 */ lfs f0, 0x2128(r31)
/* 00006344 FC40F890 */ fmr f2, f31
/* 00006348 EC20E82A */ fadds f1, f0, f29
/* 0000634C 4BFF9E15 */ bl func_80071B60
/* 00006350 7C7B00D0 */ neg r3, r27
/* 00006354 4BFF9E0D */ bl func_80071B78
lbl_00006358:
/* 00006358 387C0000 */ addi r3, r28, 0
/* 0000635C 389A0002 */ addi r4, r26, 2
/* 00006360 480002ED */ bl lbl_0000664C
/* 00006364 3B630000 */ addi r27, r3, 0
/* 00006368 7F600775 */ extsb. r0, r27
/* 0000636C 4081001C */ ble lbl_00006388
/* 00006370 C01F2130 */ lfs f0, 0x2130(r31)
/* 00006374 FC40F890 */ fmr f2, f31
/* 00006378 EC20E82A */ fadds f1, f0, f29
/* 0000637C 4BFF9DE5 */ bl func_80071B60
/* 00006380 7F63DB78 */ mr r3, r27
/* 00006384 4BFF9DDD */ bl func_80071B78
lbl_00006388:
/* 00006388 2C1EFFFF */ cmpwi r30, -1
/* 0000638C 41820100 */ beq lbl_0000648C
/* 00006390 2C1E000A */ cmpwi r30, 0xa
/* 00006394 40800020 */ bge lbl_000063B4
/* 00006398 C01F2134 */ lfs f0, 0x2134(r31)
/* 0000639C FC40F090 */ fmr f2, f30
/* 000063A0 EC20E82A */ fadds f1, f0, f29
/* 000063A4 4BFF9DBD */ bl func_80071B60
/* 000063A8 7FC30774 */ extsb r3, r30
/* 000063AC 4BFF9DB5 */ bl func_80071B78
/* 000063B0 480000DC */ b lbl_0000648C
lbl_000063B4:
/* 000063B4 2C1E0064 */ cmpwi r30, 0x64
/* 000063B8 40800054 */ bge lbl_0000640C
/* 000063BC 7C19F096 */ mulhw r0, r25, r30
/* 000063C0 C01F2138 */ lfs f0, 0x2138(r31)
/* 000063C4 FC40F090 */ fmr f2, f30
/* 000063C8 EC20E82A */ fadds f1, f0, f29
/* 000063CC 7C001670 */ srawi r0, r0, 2
/* 000063D0 54030FFE */ srwi r3, r0, 0x1f
/* 000063D4 7C001A14 */ add r0, r0, r3
/* 000063D8 7C1B0734 */ extsh r27, r0
/* 000063DC 1C1B000A */ mulli r0, r27, 0xa
/* 000063E0 7F40F050 */ subf r26, r0, r30
/* 000063E4 4BFF9D7D */ bl func_80071B60
/* 000063E8 7F630774 */ extsb r3, r27
/* 000063EC 4BFF9D75 */ bl func_80071B78
/* 000063F0 C01F20FC */ lfs f0, 0x20fc(r31)
/* 000063F4 FC40F090 */ fmr f2, f30
/* 000063F8 EC20E82A */ fadds f1, f0, f29
/* 000063FC 4BFF9D65 */ bl func_80071B60
/* 00006400 7F430774 */ extsb r3, r26
/* 00006404 4BFF9D5D */ bl func_80071B78
/* 00006408 48000084 */ b lbl_0000648C
lbl_0000640C:
/* 0000640C 7C12F096 */ mulhw r0, r18, r30
/* 00006410 C01F1E58 */ lfs f0, 0x1e58(r31)
/* 00006414 FC40F090 */ fmr f2, f30
/* 00006418 EC20E82A */ fadds f1, f0, f29
/* 0000641C 7C002E70 */ srawi r0, r0, 5
/* 00006420 54030FFE */ srwi r3, r0, 0x1f
/* 00006424 7C001A14 */ add r0, r0, r3
/* 00006428 7C1A0734 */ extsh r26, r0
/* 0000642C 1C1A0064 */ mulli r0, r26, 0x64
/* 00006430 7C00F050 */ subf r0, r0, r30
/* 00006434 7C790096 */ mulhw r3, r25, r0
/* 00006438 7C631670 */ srawi r3, r3, 2
/* 0000643C 54640FFE */ srwi r4, r3, 0x1f
/* 00006440 7C632214 */ add r3, r3, r4
/* 00006444 7C7B0734 */ extsh r27, r3
/* 00006448 1C7B000A */ mulli r3, r27, 0xa
/* 0000644C 7FC30050 */ subf r30, r3, r0
/* 00006450 4BFF9D11 */ bl func_80071B60
/* 00006454 7F430774 */ extsb r3, r26
/* 00006458 4BFF9D09 */ bl func_80071B78
/* 0000645C C01F2134 */ lfs f0, 0x2134(r31)
/* 00006460 FC40F090 */ fmr f2, f30
/* 00006464 EC20E82A */ fadds f1, f0, f29
/* 00006468 4BFF9CF9 */ bl func_80071B60
/* 0000646C 7F630774 */ extsb r3, r27
/* 00006470 4BFF9CF1 */ bl func_80071B78
/* 00006474 C01F213C */ lfs f0, 0x213c(r31)
/* 00006478 FC40F090 */ fmr f2, f30
/* 0000647C EC20E82A */ fadds f1, f0, f29
/* 00006480 4BFF9CE1 */ bl func_80071B60
/* 00006484 7FC30774 */ extsb r3, r30
/* 00006488 4BFF9CD9 */ bl func_80071B78
lbl_0000648C:
/* 0000648C C01F20E4 */ lfs f0, 0x20e4(r31)
/* 00006490 EFBD002A */ fadds f29, f29, f0
lbl_00006494:
/* 00006494 3B180002 */ addi r24, r24, 2
/* 00006498 3BBD0001 */ addi r29, r29, 1
lbl_0000649C:
/* 0000649C 7FA00774 */ extsb r0, r29
/* 000064A0 7C008800 */ cmpw r0, r17
/* 000064A4 4180F9E4 */ blt lbl_00005E88
/* 000064A8 3800000A */ li r0, 0xa
/* 000064AC 7C0903A6 */ mtctr r0
/* 000064B0 3881000C */ addi r4, r1, 0xc
/* 000064B4 387F16C8 */ addi r3, r31, 0x16c8
lbl_000064B8:
/* 000064B8 84A30008 */ lwzu r5, 8(r3)
/* 000064BC 80030004 */ lwz r0, 4(r3)
/* 000064C0 94A40008 */ stwu r5, 8(r4)
/* 000064C4 90040004 */ stw r0, 4(r4)
/* 000064C8 4200FFF0 */ bdnz lbl_000064B8
/* 000064CC D3A10018 */ stfs f29, 0x18(r1)
/* 000064D0 38610014 */ addi r3, r1, 0x14
/* 000064D4 D381001C */ stfs f28, 0x1c(r1)
/* 000064D8 4BFF9C89 */ bl draw_naomi_sprite
/* 000064DC C01F2140 */ lfs f0, 0x2140(r31)
/* 000064E0 3B9C004C */ addi r28, r28, 0x4c
/* 000064E4 3A100001 */ addi r16, r16, 1
/* 000064E8 EF9C002A */ fadds f28, f28, f0
/* 000064EC 39CE01A4 */ addi r14, r14, 0x1a4
/* 000064F0 39EF0050 */ addi r15, r15, 0x50
lbl_000064F4:
/* 000064F4 80610070 */ lwz r3, 0x70(r1)
/* 000064F8 7E170774 */ extsb r23, r16
/* 000064FC 80030024 */ lwz r0, 0x24(r3)
/* 00006500 7C170000 */ cmpw r23, r0
/* 00006504 4180F8BC */ blt lbl_00005DC0
/* 00006508 3800000A */ li r0, 0xa
/* 0000650C 7C0903A6 */ mtctr r0
/* 00006510 38A1000C */ addi r5, r1, 0xc
/* 00006514 389F1718 */ addi r4, r31, 0x1718
lbl_00006518:
/* 00006518 84640008 */ lwzu r3, 8(r4)
/* 0000651C 80040004 */ lwz r0, 4(r4)
/* 00006520 94650008 */ stwu r3, 8(r5)
/* 00006524 90050004 */ stw r0, 4(r5)
/* 00006528 4200FFF0 */ bdnz lbl_00006518
/* 0000652C C0010018 */ lfs f0, 0x18(r1)
/* 00006530 38610014 */ addi r3, r1, 0x14
/* 00006534 EC00D82A */ fadds f0, f0, f27
/* 00006538 D0010018 */ stfs f0, 0x18(r1)
/* 0000653C D381001C */ stfs f28, 0x1c(r1)
/* 00006540 4BFF9C21 */ bl draw_naomi_sprite
/* 00006544 C03F20E4 */ lfs f1, 0x20e4(r31)
/* 00006548 C0010018 */ lfs f0, 0x18(r1)
/* 0000654C 88010064 */ lbz r0, 0x64(r1)
/* 00006550 EF61002A */ fadds f27, f1, f0
/* 00006554 8B010065 */ lbz r24, 0x65(r1)
/* 00006558 7C120774 */ extsb r18, r0
/* 0000655C 48000088 */ b lbl_000065E4
lbl_00006560:
/* 00006560 7F000774 */ extsb r0, r24
/* 00006564 2C00000A */ cmpwi r0, 0xa
/* 00006568 4182003C */ beq lbl_000065A4
/* 0000656C 3800000A */ li r0, 0xa
/* 00006570 7C0903A6 */ mtctr r0
/* 00006574 38A1000C */ addi r5, r1, 0xc
/* 00006578 389F1768 */ addi r4, r31, 0x1768
lbl_0000657C:
/* 0000657C 84640008 */ lwzu r3, 8(r4)
/* 00006580 80040004 */ lwz r0, 4(r4)
/* 00006584 94650008 */ stwu r3, 8(r5)
/* 00006588 90050004 */ stw r0, 4(r5)
/* 0000658C 4200FFF0 */ bdnz lbl_0000657C
/* 00006590 D3610018 */ stfs f27, 0x18(r1)
/* 00006594 D381001C */ stfs f28, 0x1c(r1)
/* 00006598 C01F20F0 */ lfs f0, 0x20f0(r31)
/* 0000659C EF7B002A */ fadds f27, f27, f0
/* 000065A0 48000038 */ b lbl_000065D8
lbl_000065A4:
/* 000065A4 3800000A */ li r0, 0xa
/* 000065A8 7C0903A6 */ mtctr r0
/* 000065AC 38A1000C */ addi r5, r1, 0xc
/* 000065B0 389F17B8 */ addi r4, r31, 0x17b8
lbl_000065B4:
/* 000065B4 84640008 */ lwzu r3, 8(r4)
/* 000065B8 80040004 */ lwz r0, 4(r4)
/* 000065BC 94650008 */ stwu r3, 8(r5)
/* 000065C0 90050004 */ stw r0, 4(r5)
/* 000065C4 4200FFF0 */ bdnz lbl_000065B4
/* 000065C8 D3610018 */ stfs f27, 0x18(r1)
/* 000065CC D381001C */ stfs f28, 0x1c(r1)
/* 000065D0 C01F20E4 */ lfs f0, 0x20e4(r31)
/* 000065D4 EF7B002A */ fadds f27, f27, f0
lbl_000065D8:
/* 000065D8 38610014 */ addi r3, r1, 0x14
/* 000065DC 4BFF9B85 */ bl draw_naomi_sprite
/* 000065E0 3B180001 */ addi r24, r24, 1
lbl_000065E4:
/* 000065E4 7F000774 */ extsb r0, r24
/* 000065E8 7C009000 */ cmpw r0, r18
/* 000065EC 4180FF74 */ blt lbl_00006560
/* 000065F0 3800000A */ li r0, 0xa
/* 000065F4 7C0903A6 */ mtctr r0
/* 000065F8 38A1000C */ addi r5, r1, 0xc
/* 000065FC 389F1808 */ addi r4, r31, 0x1808
lbl_00006600:
/* 00006600 84640008 */ lwzu r3, 8(r4)
/* 00006604 80040004 */ lwz r0, 4(r4)
/* 00006608 94650008 */ stwu r3, 8(r5)
/* 0000660C 90050004 */ stw r0, 4(r5)
/* 00006610 4200FFF0 */ bdnz lbl_00006600
/* 00006614 D3610018 */ stfs f27, 0x18(r1)
/* 00006618 38610014 */ addi r3, r1, 0x14
/* 0000661C D381001C */ stfs f28, 0x1c(r1)
/* 00006620 4BFF9B41 */ bl draw_naomi_sprite
/* 00006624 B9C10078 */ lmw r14, 0x78(r1)
/* 00006628 800100EC */ lwz r0, 0xec(r1)
/* 0000662C CBE100E0 */ lfd f31, 0xe0(r1)
/* 00006630 CBC100D8 */ lfd f30, 0xd8(r1)
/* 00006634 7C0803A6 */ mtlr r0
/* 00006638 CBA100D0 */ lfd f29, 0xd0(r1)
/* 0000663C CB8100C8 */ lfd f28, 0xc8(r1)
/* 00006640 CB6100C0 */ lfd f27, 0xc0(r1)
/* 00006644 382100E8 */ addi r1, r1, 0xe8
/* 00006648 4E800020 */ blr 
lbl_0000664C:
/* 0000664C 7C860774 */ extsb r6, r4
/* 00006650 7CA33214 */ add r5, r3, r6
/* 00006654 88050035 */ lbz r0, 0x35(r5)
/* 00006658 7C000774 */ extsb r0, r0
/* 0000665C 28000007 */ cmplwi r0, 7
/* 00006660 41810058 */ bgt lbl_000066B8
/* 00006664 3C800000 */ lis r4, lbl_00015388@ha
/* 00006668 38840000 */ addi r4, r4, lbl_00015388@l
/* 0000666C 5400103A */ slwi r0, r0, 2
/* 00006670 7C04002E */ lwzx r0, r4, r0
/* 00006674 7C0903A6 */ mtctr r0
/* 00006678 4E800420 */ bctr 
lbl_0000667C:
/* 0000667C 38600000 */ li r3, 0
/* 00006680 4E800020 */ blr 
lbl_00006684:
/* 00006684 3860000B */ li r3, 0xb
/* 00006688 4E800020 */ blr 
lbl_0000668C:
/* 0000668C 3860000A */ li r3, 0xa
/* 00006690 4E800020 */ blr 
lbl_00006694:
/* 00006694 3860000D */ li r3, 0xd
/* 00006698 4E800020 */ blr 
lbl_0000669C:
/* 0000669C 3860000E */ li r3, 0xe
/* 000066A0 4E800020 */ blr 
lbl_000066A4:
/* 000066A4 3860000C */ li r3, 0xc
/* 000066A8 4E800020 */ blr 
lbl_000066AC:
/* 000066AC 88050020 */ lbz r0, 0x20(r5)
/* 000066B0 7C6000D0 */ neg r3, r0
/* 000066B4 4E800020 */ blr 
lbl_000066B8:
/* 000066B8 7C633214 */ add r3, r3, r6
/* 000066BC 88630020 */ lbz r3, 0x20(r3)
/* 000066C0 4E800020 */ blr 
lbl_000066C4:
/* 000066C4 7C0802A6 */ mflr r0
/* 000066C8 2C040003 */ cmpwi r4, 3
/* 000066CC 90010004 */ stw r0, 4(r1)
/* 000066D0 3CE00000 */ lis r7, lbl_0000F020@ha
/* 000066D4 9421FFB8 */ stwu r1, -0x48(r1)
/* 000066D8 DBE10040 */ stfd f31, 0x40(r1)
/* 000066DC 93E1003C */ stw r31, 0x3c(r1)
/* 000066E0 3BE70000 */ addi r31, r7, lbl_0000F020@l
/* 000066E4 93C10038 */ stw r30, 0x38(r1)
/* 000066E8 93A10034 */ stw r29, 0x34(r1)
/* 000066EC 7C7D1B78 */ mr r29, r3
/* 000066F0 93810030 */ stw r28, 0x30(r1)
/* 000066F4 880300C0 */ lbz r0, 0xc0(r3)
/* 000066F8 3C600000 */ lis r3, ballInfo@ha
/* 000066FC 7C060774 */ extsb r6, r0
/* 00006700 1CA601A4 */ mulli r5, r6, 0x1a4
/* 00006704 38030000 */ addi r0, r3, ballInfo@l
/* 00006708 7FC02A14 */ add r30, r0, r5
/* 0000670C 41820008 */ beq lbl_00006714
/* 00006710 48000010 */ b lbl_00006720
lbl_00006714:
/* 00006714 7FA3EB78 */ mr r3, r29
/* 00006718 4BFF9A49 */ bl func_8008B2D4
/* 0000671C 48000184 */ b lbl_000068A0
lbl_00006720:
/* 00006720 3C600000 */ lis r3, gamePauseStatus@ha
/* 00006724 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00006728 7000000A */ andi. r0, r0, 0xa
/* 0000672C 40820174 */ bne lbl_000068A0
/* 00006730 3C600000 */ lis r3, modeCtrl@ha
/* 00006734 38630000 */ addi r3, r3, modeCtrl@l
/* 00006738 8003002C */ lwz r0, 0x2c(r3)
/* 0000673C 7C060000 */ cmpw r6, r0
/* 00006740 40820160 */ bne lbl_000068A0
/* 00006744 387E0004 */ addi r3, r30, 4
/* 00006748 38810010 */ addi r4, r1, 0x10
/* 0000674C 38A00000 */ li r5, 0
/* 00006750 4BFF9A11 */ bl stcoli_sub16
/* 00006754 807D0014 */ lwz r3, 0x14(r29)
/* 00006758 3800FFEC */ li r0, -20
/* 0000675C 7C600038 */ and r0, r3, r0
/* 00006760 901D0014 */ stw r0, 0x14(r29)
/* 00006764 80010010 */ lwz r0, 0x10(r1)
/* 00006768 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000676C 40820024 */ bne lbl_00006790
/* 00006770 C03E0020 */ lfs f1, 0x20(r30)
/* 00006774 C01F2144 */ lfs f0, 0x2144(r31)
/* 00006778 FC010040 */ fcmpo cr0, f1, f0
/* 0000677C 40800014 */ bge lbl_00006790
/* 00006780 801D0014 */ lwz r0, 0x14(r29)
/* 00006784 60000002 */ ori r0, r0, 2
/* 00006788 901D0014 */ stw r0, 0x14(r29)
/* 0000678C 4800003C */ b lbl_000067C8
lbl_00006790:
/* 00006790 387E00B8 */ addi r3, r30, 0xb8
/* 00006794 C0230000 */ lfs f1, 0(r3)
/* 00006798 C0430004 */ lfs f2, 4(r3)
/* 0000679C C0030008 */ lfs f0, 8(r3)
/* 000067A0 EC210072 */ fmuls f1, f1, f1
/* 000067A4 EC2208BA */ fmadds f1, f2, f2, f1
/* 000067A8 EC20083A */ fmadds f1, f0, f0, f1
/* 000067AC 4BFF99B5 */ bl mathutil_sqrt
/* 000067B0 C01F2148 */ lfs f0, 0x2148(r31)
/* 000067B4 FC010040 */ fcmpo cr0, f1, f0
/* 000067B8 40800010 */ bge lbl_000067C8
/* 000067BC 801D0014 */ lwz r0, 0x14(r29)
/* 000067C0 60000001 */ ori r0, r0, 1
/* 000067C4 901D0014 */ stw r0, 0x14(r29)
lbl_000067C8:
/* 000067C8 801D0014 */ lwz r0, 0x14(r29)
/* 000067CC 387D0000 */ addi r3, r29, 0
/* 000067D0 540007BE */ clrlwi r0, r0, 0x1e
/* 000067D4 7C000034 */ cntlzw r0, r0
/* 000067D8 541CD97E */ srwi r28, r0, 5
/* 000067DC 4BFF9985 */ bl func_8003699C
/* 000067E0 2C1C0000 */ cmpwi r28, 0
/* 000067E4 41820014 */ beq lbl_000067F8
/* 000067E8 7FA3EB78 */ mr r3, r29
/* 000067EC 4BFF9975 */ bl func_80036CAC
/* 000067F0 FFE00890 */ fmr f31, f1
/* 000067F4 48000028 */ b lbl_0000681C
lbl_000067F8:
/* 000067F8 C3FF1C98 */ lfs f31, 0x1c98(r31)
/* 000067FC 387D0060 */ addi r3, r29, 0x60
/* 00006800 4BFF9961 */ bl mathutil_mtxA_from_quat
/* 00006804 4BFF995D */ bl mathutil_mtxA_normalize_basis
/* 00006808 801D0014 */ lwz r0, 0x14(r29)
/* 0000680C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00006810 4182000C */ beq lbl_0000681C
/* 00006814 7FA3EB78 */ mr r3, r29
/* 00006818 4BFF9949 */ bl func_80037718
lbl_0000681C:
/* 0000681C 801E0094 */ lwz r0, 0x94(r30)
/* 00006820 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00006824 41820028 */ beq lbl_0000684C
/* 00006828 387E001C */ addi r3, r30, 0x1c
/* 0000682C C0230000 */ lfs f1, 0(r3)
/* 00006830 C0430004 */ lfs f2, 4(r3)
/* 00006834 C0030008 */ lfs f0, 8(r3)
/* 00006838 EC210072 */ fmuls f1, f1, f1
/* 0000683C EC2208BA */ fmadds f1, f2, f2, f1
/* 00006840 EC20083A */ fmadds f1, f0, f0, f1
/* 00006844 4BFF991D */ bl mathutil_sqrt
/* 00006848 FFE00890 */ fmr f31, f1
lbl_0000684C:
/* 0000684C 7FA3EB78 */ mr r3, r29
/* 00006850 4BFF9911 */ bl func_80036EB8
/* 00006854 387D0060 */ addi r3, r29, 0x60
/* 00006858 4BFF9909 */ bl mathutil_mtxA_to_quat
/* 0000685C 7FA3EB78 */ mr r3, r29
/* 00006860 FC20F890 */ fmr f1, f31
/* 00006864 48000061 */ bl lbl_000068C4
/* 00006868 7FA3EB78 */ mr r3, r29
/* 0000686C 4BFF98F5 */ bl func_8008C4A8
/* 00006870 801D0014 */ lwz r0, 0x14(r29)
/* 00006874 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00006878 4082000C */ bne lbl_00006884
/* 0000687C 7FA3EB78 */ mr r3, r29
/* 00006880 4BFF98E1 */ bl func_8003765C
lbl_00006884:
/* 00006884 387D0000 */ addi r3, r29, 0
/* 00006888 389E0104 */ addi r4, r30, 0x104
/* 0000688C 4BFF98D5 */ bl func_8008C090
/* 00006890 38000000 */ li r0, 0
/* 00006894 901E0100 */ stw r0, 0x100(r30)
/* 00006898 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 0000689C D01E0110 */ stfs f0, 0x110(r30)
lbl_000068A0:
/* 000068A0 8001004C */ lwz r0, 0x4c(r1)
/* 000068A4 CBE10040 */ lfd f31, 0x40(r1)
/* 000068A8 83E1003C */ lwz r31, 0x3c(r1)
/* 000068AC 7C0803A6 */ mtlr r0
/* 000068B0 83C10038 */ lwz r30, 0x38(r1)
/* 000068B4 83A10034 */ lwz r29, 0x34(r1)
/* 000068B8 83810030 */ lwz r28, 0x30(r1)
/* 000068BC 38210048 */ addi r1, r1, 0x48
/* 000068C0 4E800020 */ blr 
lbl_000068C4:
/* 000068C4 7C0802A6 */ mflr r0
/* 000068C8 3C800000 */ lis r4, lbl_00014F20@ha
/* 000068CC 90010004 */ stw r0, 4(r1)
/* 000068D0 3CA00000 */ lis r5, lbl_0000F020@ha
/* 000068D4 9421FFD0 */ stwu r1, -0x30(r1)
/* 000068D8 DBE10028 */ stfd f31, 0x28(r1)
/* 000068DC FFE00890 */ fmr f31, f1
/* 000068E0 93E10024 */ stw r31, 0x24(r1)
/* 000068E4 3BE0000E */ li r31, 0xe
/* 000068E8 93C10020 */ stw r30, 0x20(r1)
/* 000068EC 3BC00000 */ li r30, 0
/* 000068F0 93A1001C */ stw r29, 0x1c(r1)
/* 000068F4 3BA30000 */ addi r29, r3, 0
/* 000068F8 38650000 */ addi r3, r5, lbl_0000F020@l
/* 000068FC 80C40000 */ lwz r6, lbl_00014F20@l(r4)
/* 00006900 3C800000 */ lis r4, lbl_10000000@ha
/* 00006904 38840000 */ addi r4, r4, lbl_10000000@l
/* 00006908 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 0000690C 4182003C */ beq lbl_00006948
/* 00006910 3C800000 */ lis r4, currentBallStructPtr@ha
/* 00006914 C8031DC0 */ lfd f0, 0x1dc0(r3)
/* 00006918 38640000 */ addi r3, r4, currentBallStructPtr@l
/* 0000691C 80630000 */ lwz r3, 0(r3)
/* 00006920 C023001C */ lfs f1, 0x1c(r3)
/* 00006924 FC010040 */ fcmpo cr0, f1, f0
/* 00006928 4081000C */ ble lbl_00006934
/* 0000692C 3BC00001 */ li r30, 1
/* 00006930 480004FC */ b lbl_00006E2C
lbl_00006934:
/* 00006934 4080000C */ bge lbl_00006940
/* 00006938 3BC00002 */ li r30, 2
/* 0000693C 480004F0 */ b lbl_00006E2C
lbl_00006940:
/* 00006940 3BC00000 */ li r30, 0
/* 00006944 480004E8 */ b lbl_00006E2C
lbl_00006948:
/* 00006948 70C0001A */ andi. r0, r6, 0x1a
/* 0000694C 4182000C */ beq lbl_00006958
/* 00006950 3BC00000 */ li r30, 0
/* 00006954 480004D8 */ b lbl_00006E2C
lbl_00006958:
/* 00006958 54C006B5 */ rlwinm. r0, r6, 0, 0x1a, 0x1a
/* 0000695C 41820088 */ beq lbl_000069E4
/* 00006960 80040000 */ lwz r0, 0(r4)
/* 00006964 2C000046 */ cmpwi r0, 0x46
/* 00006968 4082005C */ bne lbl_000069C4
/* 0000696C C024016C */ lfs f1, 0x16c(r4)
/* 00006970 C8032150 */ lfd f0, 0x2150(r3)
/* 00006974 FC010040 */ fcmpo cr0, f1, f0
/* 00006978 40810018 */ ble lbl_00006990
/* 0000697C 3C600004 */ lis r3, 4
/* 00006980 3863B12D */ addi r3, r3, -20179  ;# fixed addi
/* 00006984 3BC00003 */ li r30, 3
/* 00006988 4BFF97D9 */ bl g_play_sound
/* 0000698C 480004A0 */ b lbl_00006E2C
lbl_00006990:
/* 00006990 C8032158 */ lfd f0, 0x2158(r3)
/* 00006994 FC010040 */ fcmpo cr0, f1, f0
/* 00006998 40810018 */ ble lbl_000069B0
/* 0000699C 3C600004 */ lis r3, 4
/* 000069A0 3863B020 */ addi r3, r3, -20448  ;# fixed addi
/* 000069A4 3BC00004 */ li r30, 4
/* 000069A8 4BFF97B9 */ bl g_play_sound
/* 000069AC 48000480 */ b lbl_00006E2C
lbl_000069B0:
/* 000069B0 3C600004 */ lis r3, 4
/* 000069B4 3863B01F */ addi r3, r3, -20449  ;# fixed addi
/* 000069B8 3BC00005 */ li r30, 5
/* 000069BC 4BFF97A5 */ bl g_play_sound
/* 000069C0 4800046C */ b lbl_00006E2C
lbl_000069C4:
/* 000069C4 4081000C */ ble lbl_000069D0
/* 000069C8 3BC00006 */ li r30, 6
/* 000069CC 48000460 */ b lbl_00006E2C
lbl_000069D0:
/* 000069D0 2C000001 */ cmpwi r0, 1
/* 000069D4 41810458 */ bgt lbl_00006E2C
/* 000069D8 3BE0000A */ li r31, 0xa
/* 000069DC 3BC00004 */ li r30, 4
/* 000069E0 4800044C */ b lbl_00006E2C
lbl_000069E4:
/* 000069E4 54C00673 */ rlwinm. r0, r6, 0, 0x19, 0x19
/* 000069E8 4182001C */ beq lbl_00006A04
/* 000069EC 80040000 */ lwz r0, 0(r4)
/* 000069F0 2C000366 */ cmpwi r0, 0x366
/* 000069F4 40810010 */ ble lbl_00006A04
/* 000069F8 3BE0000A */ li r31, 0xa
/* 000069FC 3BC00004 */ li r30, 4
/* 00006A00 4800042C */ b lbl_00006E2C
lbl_00006A04:
/* 00006A04 54C00631 */ rlwinm. r0, r6, 0, 0x18, 0x18
/* 00006A08 418202E8 */ beq lbl_00006CF0
/* 00006A0C 3CA00000 */ lis r5, modeCtrl@ha
/* 00006A10 38A50000 */ addi r5, r5, modeCtrl@l
/* 00006A14 8005002C */ lwz r0, 0x2c(r5)
/* 00006A18 1C00004C */ mulli r0, r0, 0x4c
/* 00006A1C 7CE40214 */ add r7, r4, r0
/* 00006A20 88C70014 */ lbz r6, 0x14(r7)
/* 00006A24 38E7000C */ addi r7, r7, 0xc
/* 00006A28 7CC60774 */ extsb r6, r6
/* 00006A2C 7CA73214 */ add r5, r7, r6
/* 00006A30 88050035 */ lbz r0, 0x35(r5)
/* 00006A34 7C000774 */ extsb r0, r0
/* 00006A38 2C000003 */ cmpwi r0, 3
/* 00006A3C 418200DC */ beq lbl_00006B18
/* 00006A40 40800014 */ bge lbl_00006A54
/* 00006A44 2C000001 */ cmpwi r0, 1
/* 00006A48 418201B8 */ beq lbl_00006C00
/* 00006A4C 4080001C */ bge lbl_00006A68
/* 00006A50 480001B0 */ b lbl_00006C00
lbl_00006A54:
/* 00006A54 2C000008 */ cmpwi r0, 8
/* 00006A58 408001A8 */ bge lbl_00006C00
/* 00006A5C 2C000005 */ cmpwi r0, 5
/* 00006A60 40800120 */ bge lbl_00006B80
/* 00006A64 4800019C */ b lbl_00006C00
lbl_00006A68:
/* 00006A68 88070009 */ lbz r0, 9(r7)
/* 00006A6C 7C000774 */ extsb r0, r0
/* 00006A70 2C000003 */ cmpwi r0, 3
/* 00006A74 40800028 */ bge lbl_00006A9C
/* 00006A78 801D0010 */ lwz r0, 0x10(r29)
/* 00006A7C 2C000001 */ cmpwi r0, 1
/* 00006A80 40820010 */ bne lbl_00006A90
/* 00006A84 3BE00008 */ li r31, 8
/* 00006A88 3BC00001 */ li r30, 1
/* 00006A8C 4800002C */ b lbl_00006AB8
lbl_00006A90:
/* 00006A90 3BE00005 */ li r31, 5
/* 00006A94 3BC0000A */ li r30, 0xa
/* 00006A98 48000020 */ b lbl_00006AB8
lbl_00006A9C:
/* 00006A9C 2C00000C */ cmpwi r0, 0xc
/* 00006AA0 40800010 */ bge lbl_00006AB0
/* 00006AA4 3BE00005 */ li r31, 5
/* 00006AA8 3BC00008 */ li r30, 8
/* 00006AAC 4800000C */ b lbl_00006AB8
lbl_00006AB0:
/* 00006AB0 3BE00005 */ li r31, 5
/* 00006AB4 3BC0000C */ li r30, 0xc
lbl_00006AB8:
/* 00006AB8 80040000 */ lwz r0, 0(r4)
/* 00006ABC 3CA00000 */ lis r5, lbl_00010D58@ha
/* 00006AC0 C8250000 */ lfd f1, lbl_00010D58@l(r5)
/* 00006AC4 6C048000 */ xoris r4, r0, 0x8000
/* 00006AC8 C8432160 */ lfd f2, 0x2160(r3)
/* 00006ACC 90810014 */ stw r4, 0x14(r1)
/* 00006AD0 3C004330 */ lis r0, 0x4330
/* 00006AD4 90010010 */ stw r0, 0x10(r1)
/* 00006AD8 C8010010 */ lfd f0, 0x10(r1)
/* 00006ADC FC000828 */ fsub f0, f0, f1
/* 00006AE0 FC020000 */ fcmpu cr0, f2, f0
/* 00006AE4 41820028 */ beq lbl_00006B0C
/* 00006AE8 90810014 */ stw r4, 0x14(r1)
/* 00006AEC 3C800000 */ lis r4, lbl_00010D58@ha
/* 00006AF0 C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00006AF4 90010010 */ stw r0, 0x10(r1)
/* 00006AF8 C8431E70 */ lfd f2, 0x1e70(r3)
/* 00006AFC C8010010 */ lfd f0, 0x10(r1)
/* 00006B00 FC000828 */ fsub f0, f0, f1
/* 00006B04 FC020000 */ fcmpu cr0, f2, f0
/* 00006B08 40820324 */ bne lbl_00006E2C
lbl_00006B0C:
/* 00006B0C 38600059 */ li r3, 0x59
/* 00006B10 4BFF9651 */ bl g_play_sound
/* 00006B14 48000318 */ b lbl_00006E2C
lbl_00006B18:
/* 00006B18 80040000 */ lwz r0, 0(r4)
/* 00006B1C 3CA00000 */ lis r5, lbl_00010D58@ha
/* 00006B20 C8250000 */ lfd f1, lbl_00010D58@l(r5)
/* 00006B24 3BE00005 */ li r31, 5
/* 00006B28 6C048000 */ xoris r4, r0, 0x8000
/* 00006B2C 90810014 */ stw r4, 0x14(r1)
/* 00006B30 3C004330 */ lis r0, 0x4330
/* 00006B34 C8432160 */ lfd f2, 0x2160(r3)
/* 00006B38 3BC00004 */ li r30, 4
/* 00006B3C 90010010 */ stw r0, 0x10(r1)
/* 00006B40 C8010010 */ lfd f0, 0x10(r1)
/* 00006B44 FC000828 */ fsub f0, f0, f1
/* 00006B48 FC020000 */ fcmpu cr0, f2, f0
/* 00006B4C 41820028 */ beq lbl_00006B74
/* 00006B50 90810014 */ stw r4, 0x14(r1)
/* 00006B54 3C800000 */ lis r4, lbl_00010D58@ha
/* 00006B58 C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00006B5C 90010010 */ stw r0, 0x10(r1)
/* 00006B60 C8431E70 */ lfd f2, 0x1e70(r3)
/* 00006B64 C8010010 */ lfd f0, 0x10(r1)
/* 00006B68 FC000828 */ fsub f0, f0, f1
/* 00006B6C FC020000 */ fcmpu cr0, f2, f0
/* 00006B70 408202BC */ bne lbl_00006E2C
lbl_00006B74:
/* 00006B74 38600058 */ li r3, 0x58
/* 00006B78 4BFF95E9 */ bl g_play_sound
/* 00006B7C 480002B0 */ b lbl_00006E2C
lbl_00006B80:
/* 00006B80 80040000 */ lwz r0, 0(r4)
/* 00006B84 3CA00000 */ lis r5, lbl_00010D58@ha
/* 00006B88 C8250000 */ lfd f1, lbl_00010D58@l(r5)
/* 00006B8C 3BE00009 */ li r31, 9
/* 00006B90 6C048000 */ xoris r4, r0, 0x8000
/* 00006B94 90810014 */ stw r4, 0x14(r1)
/* 00006B98 3C004330 */ lis r0, 0x4330
/* 00006B9C C8432160 */ lfd f2, 0x2160(r3)
/* 00006BA0 3BC00003 */ li r30, 3
/* 00006BA4 90010010 */ stw r0, 0x10(r1)
/* 00006BA8 C8010010 */ lfd f0, 0x10(r1)
/* 00006BAC FC000828 */ fsub f0, f0, f1
/* 00006BB0 FC020000 */ fcmpu cr0, f2, f0
/* 00006BB4 41820028 */ beq lbl_00006BDC
/* 00006BB8 90810014 */ stw r4, 0x14(r1)
/* 00006BBC 3C800000 */ lis r4, lbl_00010D58@ha
/* 00006BC0 C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00006BC4 90010010 */ stw r0, 0x10(r1)
/* 00006BC8 C8431E70 */ lfd f2, 0x1e70(r3)
/* 00006BCC C8010010 */ lfd f0, 0x10(r1)
/* 00006BD0 FC000828 */ fsub f0, f0, f1
/* 00006BD4 FC020000 */ fcmpu cr0, f2, f0
/* 00006BD8 40820254 */ bne lbl_00006E2C
lbl_00006BDC:
/* 00006BDC 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00006BE0 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00006BE4 80630000 */ lwz r3, 0(r3)
/* 00006BE8 80030094 */ lwz r0, 0x94(r3)
/* 00006BEC 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00006BF0 4182023C */ beq lbl_00006E2C
/* 00006BF4 3860001C */ li r3, 0x1c
/* 00006BF8 4BFF9569 */ bl g_play_sound
/* 00006BFC 48000230 */ b lbl_00006E2C
lbl_00006C00:
/* 00006C00 88070007 */ lbz r0, 7(r7)
/* 00006C04 2C000001 */ cmpwi r0, 1
/* 00006C08 40820080 */ bne lbl_00006C88
/* 00006C0C 7CA73214 */ add r5, r7, r6
/* 00006C10 88050020 */ lbz r0, 0x20(r5)
/* 00006C14 7C000774 */ extsb r0, r0
/* 00006C18 2C000006 */ cmpwi r0, 6
/* 00006C1C 4180006C */ blt lbl_00006C88
/* 00006C20 80040000 */ lwz r0, 0(r4)
/* 00006C24 3CA00000 */ lis r5, lbl_00010D58@ha
/* 00006C28 C8250000 */ lfd f1, lbl_00010D58@l(r5)
/* 00006C2C 3BE00005 */ li r31, 5
/* 00006C30 6C048000 */ xoris r4, r0, 0x8000
/* 00006C34 90810014 */ stw r4, 0x14(r1)
/* 00006C38 3C004330 */ lis r0, 0x4330
/* 00006C3C C8432160 */ lfd f2, 0x2160(r3)
/* 00006C40 3BC00002 */ li r30, 2
/* 00006C44 90010010 */ stw r0, 0x10(r1)
/* 00006C48 C8010010 */ lfd f0, 0x10(r1)
/* 00006C4C FC000828 */ fsub f0, f0, f1
/* 00006C50 FC020000 */ fcmpu cr0, f2, f0
/* 00006C54 41820028 */ beq lbl_00006C7C
/* 00006C58 90810014 */ stw r4, 0x14(r1)
/* 00006C5C 3C800000 */ lis r4, lbl_00010D58@ha
/* 00006C60 C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00006C64 90010010 */ stw r0, 0x10(r1)
/* 00006C68 C8431E70 */ lfd f2, 0x1e70(r3)
/* 00006C6C C8010010 */ lfd f0, 0x10(r1)
/* 00006C70 FC000828 */ fsub f0, f0, f1
/* 00006C74 FC020000 */ fcmpu cr0, f2, f0
/* 00006C78 408201B4 */ bne lbl_00006E2C
lbl_00006C7C:
/* 00006C7C 3860001B */ li r3, 0x1b
/* 00006C80 4BFF94E1 */ bl g_play_sound
/* 00006C84 480001A8 */ b lbl_00006E2C
lbl_00006C88:
/* 00006C88 80040000 */ lwz r0, 0(r4)
/* 00006C8C 3CA00000 */ lis r5, lbl_00010D58@ha
/* 00006C90 C8250000 */ lfd f1, lbl_00010D58@l(r5)
/* 00006C94 3BE00009 */ li r31, 9
/* 00006C98 6C048000 */ xoris r4, r0, 0x8000
/* 00006C9C 90810014 */ stw r4, 0x14(r1)
/* 00006CA0 3C004330 */ lis r0, 0x4330
/* 00006CA4 C8432160 */ lfd f2, 0x2160(r3)
/* 00006CA8 3BC00002 */ li r30, 2
/* 00006CAC 90010010 */ stw r0, 0x10(r1)
/* 00006CB0 C8010010 */ lfd f0, 0x10(r1)
/* 00006CB4 FC000828 */ fsub f0, f0, f1
/* 00006CB8 FC020000 */ fcmpu cr0, f2, f0
/* 00006CBC 41820028 */ beq lbl_00006CE4
/* 00006CC0 90810014 */ stw r4, 0x14(r1)
/* 00006CC4 3C800000 */ lis r4, lbl_00010D58@ha
/* 00006CC8 C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00006CCC 90010010 */ stw r0, 0x10(r1)
/* 00006CD0 C8431E70 */ lfd f2, 0x1e70(r3)
/* 00006CD4 C8010010 */ lfd f0, 0x10(r1)
/* 00006CD8 FC000828 */ fsub f0, f0, f1
/* 00006CDC FC020000 */ fcmpu cr0, f2, f0
/* 00006CE0 4082014C */ bne lbl_00006E2C
lbl_00006CE4:
/* 00006CE4 3860001C */ li r3, 0x1c
/* 00006CE8 4BFF9479 */ bl g_play_sound
/* 00006CEC 48000140 */ b lbl_00006E2C
lbl_00006CF0:
/* 00006CF0 54C004A5 */ rlwinm. r0, r6, 0, 0x12, 0x12
/* 00006CF4 41820128 */ beq lbl_00006E1C
/* 00006CF8 8804013E */ lbz r0, 0x13e(r4)
/* 00006CFC 7C000775 */ extsb. r0, r0
/* 00006D00 40820084 */ bne lbl_00006D84
/* 00006D04 88040006 */ lbz r0, 6(r4)
/* 00006D08 3BE00005 */ li r31, 5
/* 00006D0C 7C000774 */ extsb r0, r0
/* 00006D10 28000009 */ cmplwi r0, 9
/* 00006D14 4180000C */ blt lbl_00006D20
/* 00006D18 3BC0000C */ li r30, 0xc
/* 00006D1C 48000008 */ b lbl_00006D24
lbl_00006D20:
/* 00006D20 3BC00006 */ li r30, 6
lbl_00006D24:
/* 00006D24 80040000 */ lwz r0, 0(r4)
/* 00006D28 3CA00000 */ lis r5, lbl_00010D58@ha
/* 00006D2C C8250000 */ lfd f1, lbl_00010D58@l(r5)
/* 00006D30 6C048000 */ xoris r4, r0, 0x8000
/* 00006D34 C8432160 */ lfd f2, 0x2160(r3)
/* 00006D38 90810014 */ stw r4, 0x14(r1)
/* 00006D3C 3C004330 */ lis r0, 0x4330
/* 00006D40 90010010 */ stw r0, 0x10(r1)
/* 00006D44 C8010010 */ lfd f0, 0x10(r1)
/* 00006D48 FC000828 */ fsub f0, f0, f1
/* 00006D4C FC020000 */ fcmpu cr0, f2, f0
/* 00006D50 41820028 */ beq lbl_00006D78
/* 00006D54 90810014 */ stw r4, 0x14(r1)
/* 00006D58 3C800000 */ lis r4, lbl_00010D58@ha
/* 00006D5C C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00006D60 90010010 */ stw r0, 0x10(r1)
/* 00006D64 C8431E70 */ lfd f2, 0x1e70(r3)
/* 00006D68 C8010010 */ lfd f0, 0x10(r1)
/* 00006D6C FC000828 */ fsub f0, f0, f1
/* 00006D70 FC020000 */ fcmpu cr0, f2, f0
/* 00006D74 408200B8 */ bne lbl_00006E2C
lbl_00006D78:
/* 00006D78 38600059 */ li r3, 0x59
/* 00006D7C 4BFF93E5 */ bl g_play_sound
/* 00006D80 480000AC */ b lbl_00006E2C
lbl_00006D84:
/* 00006D84 88040008 */ lbz r0, 8(r4)
/* 00006D88 3BE00009 */ li r31, 9
/* 00006D8C 7C000774 */ extsb r0, r0
/* 00006D90 2C000001 */ cmpwi r0, 1
/* 00006D94 4080000C */ bge lbl_00006DA0
/* 00006D98 3BC00003 */ li r30, 3
/* 00006D9C 48000008 */ b lbl_00006DA4
lbl_00006DA0:
/* 00006DA0 3BC00002 */ li r30, 2
lbl_00006DA4:
/* 00006DA4 80040000 */ lwz r0, 0(r4)
/* 00006DA8 3CA00000 */ lis r5, lbl_00010D58@ha
/* 00006DAC C8250000 */ lfd f1, lbl_00010D58@l(r5)
/* 00006DB0 6C048000 */ xoris r4, r0, 0x8000
/* 00006DB4 C8432160 */ lfd f2, 0x2160(r3)
/* 00006DB8 90810014 */ stw r4, 0x14(r1)
/* 00006DBC 3C004330 */ lis r0, 0x4330
/* 00006DC0 90010010 */ stw r0, 0x10(r1)
/* 00006DC4 C8010010 */ lfd f0, 0x10(r1)
/* 00006DC8 FC000828 */ fsub f0, f0, f1
/* 00006DCC FC020000 */ fcmpu cr0, f2, f0
/* 00006DD0 41820028 */ beq lbl_00006DF8
/* 00006DD4 90810014 */ stw r4, 0x14(r1)
/* 00006DD8 3C800000 */ lis r4, lbl_00010D58@ha
/* 00006DDC C8240000 */ lfd f1, lbl_00010D58@l(r4)
/* 00006DE0 90010010 */ stw r0, 0x10(r1)
/* 00006DE4 C8431E70 */ lfd f2, 0x1e70(r3)
/* 00006DE8 C8010010 */ lfd f0, 0x10(r1)
/* 00006DEC FC000828 */ fsub f0, f0, f1
/* 00006DF0 FC020000 */ fcmpu cr0, f2, f0
/* 00006DF4 40820038 */ bne lbl_00006E2C
lbl_00006DF8:
/* 00006DF8 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00006DFC 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00006E00 80630000 */ lwz r3, 0(r3)
/* 00006E04 80030094 */ lwz r0, 0x94(r3)
/* 00006E08 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00006E0C 41820020 */ beq lbl_00006E2C
/* 00006E10 3860001C */ li r3, 0x1c
/* 00006E14 4BFF934D */ bl g_play_sound
/* 00006E18 48000014 */ b lbl_00006E2C
lbl_00006E1C:
/* 00006E1C 7FA3EB78 */ mr r3, r29
/* 00006E20 FC20F890 */ fmr f1, f31
/* 00006E24 4BFF933D */ bl func_8003721C
/* 00006E28 4800001C */ b lbl_00006E44
lbl_00006E2C:
/* 00006E2C FC20F890 */ fmr f1, f31
/* 00006E30 387D0000 */ addi r3, r29, 0
/* 00006E34 389F0000 */ addi r4, r31, 0
/* 00006E38 38BE0000 */ addi r5, r30, 0
/* 00006E3C 38C00000 */ li r6, 0
/* 00006E40 4BFF9321 */ bl func_8008BBD4
lbl_00006E44:
/* 00006E44 80010034 */ lwz r0, 0x34(r1)
/* 00006E48 CBE10028 */ lfd f31, 0x28(r1)
/* 00006E4C 83E10024 */ lwz r31, 0x24(r1)
/* 00006E50 7C0803A6 */ mtlr r0
/* 00006E54 83C10020 */ lwz r30, 0x20(r1)
/* 00006E58 83A1001C */ lwz r29, 0x1c(r1)
/* 00006E5C 38210030 */ addi r1, r1, 0x30
/* 00006E60 4E800020 */ blr 
lbl_00006E64:
/* 00006E64 7C0802A6 */ mflr r0
/* 00006E68 3CA00000 */ lis r5, lbl_0000F020@ha
/* 00006E6C 90010004 */ stw r0, 4(r1)
/* 00006E70 9421FFC8 */ stwu r1, -0x38(r1)
/* 00006E74 DBE10030 */ stfd f31, 0x30(r1)
/* 00006E78 FFE01090 */ fmr f31, f2
/* 00006E7C DBC10028 */ stfd f30, 0x28(r1)
/* 00006E80 FFC00890 */ fmr f30, f1
/* 00006E84 93E10024 */ stw r31, 0x24(r1)
/* 00006E88 3BE50000 */ addi r31, r5, lbl_0000F020@l
/* 00006E8C 93C10020 */ stw r30, 0x20(r1)
/* 00006E90 3BC40000 */ addi r30, r4, 0
/* 00006E94 93A1001C */ stw r29, 0x1c(r1)
/* 00006E98 3BA30000 */ addi r29, r3, 0
/* 00006E9C C03F2168 */ lfs f1, 0x2168(r31)
/* 00006EA0 4BFF92C1 */ bl func_80071B1C
/* 00006EA4 C01F2100 */ lfs f0, 0x2100(r31)
/* 00006EA8 EC20F02A */ fadds f1, f0, f30
/* 00006EAC EC40F82A */ fadds f2, f0, f31
/* 00006EB0 4BFF92B1 */ bl func_80071B60
/* 00006EB4 38600000 */ li r3, 0
/* 00006EB8 4BFF92A9 */ bl func_80071AE4
/* 00006EBC 7FC3F378 */ mr r3, r30
/* 00006EC0 4BFF92A1 */ bl func_80071E58
/* 00006EC4 C03F1CFC */ lfs f1, 0x1cfc(r31)
/* 00006EC8 4BFF9299 */ bl func_80071B1C
/* 00006ECC FC20F090 */ fmr f1, f30
/* 00006ED0 FC40F890 */ fmr f2, f31
/* 00006ED4 4BFF928D */ bl func_80071B60
/* 00006ED8 7FA3EB78 */ mr r3, r29
/* 00006EDC 4BFF9285 */ bl func_80071AE4
/* 00006EE0 7FC3F378 */ mr r3, r30
/* 00006EE4 4BFF927D */ bl func_80071E58
/* 00006EE8 8001003C */ lwz r0, 0x3c(r1)
/* 00006EEC CBE10030 */ lfd f31, 0x30(r1)
/* 00006EF0 CBC10028 */ lfd f30, 0x28(r1)
/* 00006EF4 7C0803A6 */ mtlr r0
/* 00006EF8 83E10024 */ lwz r31, 0x24(r1)
/* 00006EFC 83C10020 */ lwz r30, 0x20(r1)
/* 00006F00 83A1001C */ lwz r29, 0x1c(r1)
/* 00006F04 38210038 */ addi r1, r1, 0x38
/* 00006F08 4E800020 */ blr 
lbl_00006F0C:
/* 00006F0C 7C0802A6 */ mflr r0
/* 00006F10 3C800000 */ lis r4, unpausedFrameCounter@ha
/* 00006F14 90010004 */ stw r0, 4(r1)
/* 00006F18 3C600000 */ lis r3, lbl_0000F020@ha
/* 00006F1C 38840000 */ addi r4, r4, unpausedFrameCounter@l
/* 00006F20 9421FC68 */ stwu r1, -0x398(r1)
/* 00006F24 3D000000 */ lis r8, lbl_10000000@ha
/* 00006F28 3CE00000 */ lis r7, lbl_00014F20@ha
/* 00006F2C DBE10390 */ stfd f31, 0x390(r1)
/* 00006F30 DBC10388 */ stfd f30, 0x388(r1)
/* 00006F34 DBA10380 */ stfd f29, 0x380(r1)
/* 00006F38 BE410348 */ stmw r18, 0x348(r1)
/* 00006F3C 3BA30000 */ addi r29, r3, lbl_0000F020@l
/* 00006F40 3C600000 */ lis r3, lbl_00010D60@ha
/* 00006F44 3BC80000 */ addi r30, r8, lbl_10000000@l
/* 00006F48 3BE70000 */ addi r31, r7, lbl_00014F20@l
/* 00006F4C 80BD216C */ lwz r5, 0x216c(r29)
/* 00006F50 801D2170 */ lwz r0, 0x2170(r29)
/* 00006F54 90A10304 */ stw r5, 0x304(r1)
/* 00006F58 90010308 */ stw r0, 0x308(r1)
/* 00006F5C 3C004330 */ lis r0, 0x4330
/* 00006F60 80DD2174 */ lwz r6, 0x2174(r29)
/* 00006F64 80BD2178 */ lwz r5, 0x2178(r29)
/* 00006F68 90C1030C */ stw r6, 0x30c(r1)
/* 00006F6C 90A10310 */ stw r5, 0x310(r1)
/* 00006F70 80DD217C */ lwz r6, 0x217c(r29)
/* 00006F74 80BD2180 */ lwz r5, 0x2180(r29)
/* 00006F78 90C10314 */ stw r6, 0x314(r1)
/* 00006F7C 90A10318 */ stw r5, 0x318(r1)
/* 00006F80 80DD2184 */ lwz r6, 0x2184(r29)
/* 00006F84 80BD2188 */ lwz r5, 0x2188(r29)
/* 00006F88 90C1031C */ stw r6, 0x31c(r1)
/* 00006F8C 90A10320 */ stw r5, 0x320(r1)
/* 00006F90 80DD218C */ lwz r6, 0x218c(r29)
/* 00006F94 80BD2190 */ lwz r5, 0x2190(r29)
/* 00006F98 90C10324 */ stw r6, 0x324(r1)
/* 00006F9C 90A10328 */ stw r5, 0x328(r1)
/* 00006FA0 80DD2194 */ lwz r6, 0x2194(r29)
/* 00006FA4 80BD2198 */ lwz r5, 0x2198(r29)
/* 00006FA8 90C102DC */ stw r6, 0x2dc(r1)
/* 00006FAC 90A102E0 */ stw r5, 0x2e0(r1)
/* 00006FB0 80DD219C */ lwz r6, 0x219c(r29)
/* 00006FB4 80BD21A0 */ lwz r5, 0x21a0(r29)
/* 00006FB8 90C102E4 */ stw r6, 0x2e4(r1)
/* 00006FBC 90A102E8 */ stw r5, 0x2e8(r1)
/* 00006FC0 80DD21A4 */ lwz r6, 0x21a4(r29)
/* 00006FC4 80BD21A8 */ lwz r5, 0x21a8(r29)
/* 00006FC8 90C102EC */ stw r6, 0x2ec(r1)
/* 00006FCC 90A102F0 */ stw r5, 0x2f0(r1)
/* 00006FD0 80DD21AC */ lwz r6, 0x21ac(r29)
/* 00006FD4 80BD21B0 */ lwz r5, 0x21b0(r29)
/* 00006FD8 90C102F4 */ stw r6, 0x2f4(r1)
/* 00006FDC 90A102F8 */ stw r5, 0x2f8(r1)
/* 00006FE0 80DD21B4 */ lwz r6, 0x21b4(r29)
/* 00006FE4 80BD21B8 */ lwz r5, 0x21b8(r29)
/* 00006FE8 90C102FC */ stw r6, 0x2fc(r1)
/* 00006FEC 90A10300 */ stw r5, 0x300(r1)
/* 00006FF0 80840000 */ lwz r4, 0(r4)
/* 00006FF4 C8230000 */ lfd f1, lbl_00010D60@l(r3)
/* 00006FF8 90810344 */ stw r4, 0x344(r1)
/* 00006FFC C85D1DA0 */ lfd f2, 0x1da0(r29)
/* 00007000 90010340 */ stw r0, 0x340(r1)
/* 00007004 C8010340 */ lfd f0, 0x340(r1)
/* 00007008 FC000828 */ fsub f0, f0, f1
/* 0000700C FC020032 */ fmul f0, f2, f0
/* 00007010 FC00001E */ fctiwz f0, f0
/* 00007014 D8010338 */ stfd f0, 0x338(r1)
/* 00007018 8061033C */ lwz r3, 0x33c(r1)
/* 0000701C 4BFF9145 */ bl mathutil_sin
/* 00007020 C81D1F50 */ lfd f0, 0x1f50(r29)
/* 00007024 7FA3EB78 */ mr r3, r29
/* 00007028 C85D21C0 */ lfd f2, 0x21c0(r29)
/* 0000702C FC200072 */ fmul f1, f0, f1
/* 00007030 C01D21C8 */ lfs f0, 0x21c8(r29)
/* 00007034 FFE2082A */ fadd f31, f2, f1
/* 00007038 FFE0F818 */ frsp f31, f31
/* 0000703C EC0007F2 */ fmuls f0, f0, f31
/* 00007040 FC00001E */ fctiwz f0, f0
/* 00007044 D8010330 */ stfd f0, 0x330(r1)
/* 00007048 80010334 */ lwz r0, 0x334(r1)
/* 0000704C 5418063E */ clrlwi r24, r0, 0x18
/* 00007050 5416442E */ rlwinm r22, r0, 8, 0x10, 0x17
/* 00007054 5400821E */ rlwinm r0, r0, 0x10, 8, 0xf
/* 00007058 7E76C214 */ add r19, r22, r24
/* 0000705C 7E609A14 */ add r19, r0, r19
/* 00007060 4BFF9101 */ bl draw_naomi_sprite
/* 00007064 3C600060 */ lis r3, 0x60
/* 00007068 3B610304 */ addi r27, r1, 0x304
/* 0000706C 3B4102DC */ addi r26, r1, 0x2dc
/* 00007070 3A436060 */ addi r18, r3, 0x6060
/* 00007074 3AA00000 */ li r21, 0
/* 00007078 3B200000 */ li r25, 0
lbl_0000707C:
/* 0000707C 3800000A */ li r0, 0xa
/* 00007080 7C0903A6 */ mtctr r0
/* 00007084 38A10284 */ addi r5, r1, 0x284
/* 00007088 389D0F98 */ addi r4, r29, 0xf98
lbl_0000708C:
/* 0000708C 84640008 */ lwzu r3, 8(r4)
/* 00007090 80040004 */ lwz r0, 4(r4)
/* 00007094 94650008 */ stwu r3, 8(r5)
/* 00007098 90050004 */ stw r0, 4(r5)
/* 0000709C 4200FFF0 */ bdnz lbl_0000708C
/* 000070A0 C0210290 */ lfs f1, 0x290(r1)
/* 000070A4 38000001 */ li r0, 1
/* 000070A8 C01B0000 */ lfs f0, 0(r27)
/* 000070AC 7C17A830 */ slw r23, r0, r21
/* 000070B0 EC01002A */ fadds f0, f1, f0
/* 000070B4 D0010290 */ stfs f0, 0x290(r1)
/* 000070B8 C0210294 */ lfs f1, 0x294(r1)
/* 000070BC C01A0000 */ lfs f0, 0(r26)
/* 000070C0 EC01002A */ fadds f0, f1, f0
/* 000070C4 D0010294 */ stfs f0, 0x294(r1)
/* 000070C8 A01E0004 */ lhz r0, 4(r30)
/* 000070CC 7C00B839 */ and. r0, r0, r23
/* 000070D0 4182000C */ beq lbl_000070DC
/* 000070D4 924102C4 */ stw r18, 0x2c4(r1)
/* 000070D8 48000018 */ b lbl_000070F0
lbl_000070DC:
/* 000070DC 881E0007 */ lbz r0, 7(r30)
/* 000070E0 7C000774 */ extsb r0, r0
/* 000070E4 7C00A800 */ cmpw r0, r21
/* 000070E8 40820008 */ bne lbl_000070F0
/* 000070EC 926102C4 */ stw r19, 0x2c4(r1)
lbl_000070F0:
/* 000070F0 3861028C */ addi r3, r1, 0x28c
/* 000070F4 4BFF906D */ bl draw_naomi_sprite
/* 000070F8 C3DB0000 */ lfs f30, 0(r27)
/* 000070FC 3B9D0FF0 */ addi r28, r29, 0xff0
/* 00007100 C3BA0000 */ lfs f29, 0(r26)
/* 00007104 3A800000 */ li r20, 0
lbl_00007108:
/* 00007108 801F0100 */ lwz r0, 0x100(r31)
/* 0000710C 38600001 */ li r3, 1
/* 00007110 7C63A030 */ slw r3, r3, r20
/* 00007114 7C19022E */ lhzx r0, r25, r0
/* 00007118 7C600039 */ and. r0, r3, r0
/* 0000711C 41820070 */ beq lbl_0000718C
/* 00007120 3800000A */ li r0, 0xa
/* 00007124 7C0903A6 */ mtctr r0
/* 00007128 38A10284 */ addi r5, r1, 0x284
/* 0000712C 389CFFF8 */ addi r4, r28, -8  ;# fixed addi
lbl_00007130:
/* 00007130 84640008 */ lwzu r3, 8(r4)
/* 00007134 80040004 */ lwz r0, 4(r4)
/* 00007138 94650008 */ stwu r3, 8(r5)
/* 0000713C 90050004 */ stw r0, 4(r5)
/* 00007140 4200FFF0 */ bdnz lbl_00007130
/* 00007144 C0010290 */ lfs f0, 0x290(r1)
/* 00007148 EC00F02A */ fadds f0, f0, f30
/* 0000714C D0010290 */ stfs f0, 0x290(r1)
/* 00007150 C0010294 */ lfs f0, 0x294(r1)
/* 00007154 EC00E82A */ fadds f0, f0, f29
/* 00007158 D0010294 */ stfs f0, 0x294(r1)
/* 0000715C A01E0004 */ lhz r0, 4(r30)
/* 00007160 7C00B839 */ and. r0, r0, r23
/* 00007164 4182000C */ beq lbl_00007170
/* 00007168 924102C4 */ stw r18, 0x2c4(r1)
/* 0000716C 48000018 */ b lbl_00007184
lbl_00007170:
/* 00007170 881E0007 */ lbz r0, 7(r30)
/* 00007174 7C000774 */ extsb r0, r0
/* 00007178 7C00A800 */ cmpw r0, r21
/* 0000717C 40820008 */ bne lbl_00007184
/* 00007180 926102C4 */ stw r19, 0x2c4(r1)
lbl_00007184:
/* 00007184 3861028C */ addi r3, r1, 0x28c
/* 00007188 4BFF8FD9 */ bl draw_naomi_sprite
lbl_0000718C:
/* 0000718C 3A940001 */ addi r20, r20, 1
/* 00007190 2814000A */ cmplwi r20, 0xa
/* 00007194 3B9C0050 */ addi r28, r28, 0x50
/* 00007198 4180FF70 */ blt lbl_00007108
/* 0000719C 3AB50001 */ addi r21, r21, 1
/* 000071A0 2815000A */ cmplwi r21, 0xa
/* 000071A4 3B7B0004 */ addi r27, r27, 4
/* 000071A8 3B5A0004 */ addi r26, r26, 4
/* 000071AC 3B390008 */ addi r25, r25, 8
/* 000071B0 4180FECC */ blt lbl_0000707C
/* 000071B4 3C1600FF */ addis r0, r22, 0xff
/* 000071B8 3B3D0D20 */ addi r25, r29, 0xd20
/* 000071BC 3B410008 */ addi r26, r1, 8
/* 000071C0 7F60C214 */ add r27, r0, r24
/* 000071C4 3ADE0007 */ addi r22, r30, 7
/* 000071C8 3AA10304 */ addi r21, r1, 0x304
/* 000071CC 3A8102DC */ addi r20, r1, 0x2dc
/* 000071D0 3A600000 */ li r19, 0
lbl_000071D4:
/* 000071D4 3800000A */ li r0, 0xa
/* 000071D8 7C0903A6 */ mtctr r0
/* 000071DC 38BAFFF8 */ addi r5, r26, -8  ;# fixed addi
/* 000071E0 3899FFF8 */ addi r4, r25, -8  ;# fixed addi
lbl_000071E4:
/* 000071E4 84640008 */ lwzu r3, 8(r4)
/* 000071E8 80040004 */ lwz r0, 4(r4)
/* 000071EC 94650008 */ stwu r3, 8(r5)
/* 000071F0 90050004 */ stw r0, 4(r5)
/* 000071F4 4200FFF0 */ bdnz lbl_000071E4
/* 000071F8 88160000 */ lbz r0, 0(r22)
/* 000071FC 7F43D378 */ mr r3, r26
/* 00007200 C01D2118 */ lfs f0, 0x2118(r29)
/* 00007204 7C000774 */ extsb r0, r0
/* 00007208 C05A0004 */ lfs f2, 4(r26)
/* 0000720C 5400103A */ slwi r0, r0, 2
/* 00007210 7C35042E */ lfsx f1, r21, r0
/* 00007214 EC010028 */ fsubs f0, f1, f0
/* 00007218 EC02002A */ fadds f0, f2, f0
/* 0000721C D01A0004 */ stfs f0, 4(r26)
/* 00007220 88160000 */ lbz r0, 0(r22)
/* 00007224 C01D20EC */ lfs f0, 0x20ec(r29)
/* 00007228 7C000774 */ extsb r0, r0
/* 0000722C C05A0008 */ lfs f2, 8(r26)
/* 00007230 5400103A */ slwi r0, r0, 2
/* 00007234 7C34042E */ lfsx f1, r20, r0
/* 00007238 EC010028 */ fsubs f0, f1, f0
/* 0000723C EC02002A */ fadds f0, f2, f0
/* 00007240 D01A0008 */ stfs f0, 8(r26)
/* 00007244 D3FA002C */ stfs f31, 0x2c(r26)
/* 00007248 937A0038 */ stw r27, 0x38(r26)
/* 0000724C 4BFF8F15 */ bl draw_naomi_sprite
/* 00007250 3A730001 */ addi r19, r19, 1
/* 00007254 2C130008 */ cmpwi r19, 8
/* 00007258 3B390050 */ addi r25, r25, 0x50
/* 0000725C 3B5A0050 */ addi r26, r26, 0x50
/* 00007260 4180FF74 */ blt lbl_000071D4
/* 00007264 4BFF8EFD */ bl func_80071A8C
/* 00007268 386000B1 */ li r3, 0xb1
/* 0000726C 4BFF8EF5 */ bl func_80071AD4
/* 00007270 3C600000 */ lis r3, gamePauseStatus@ha
/* 00007274 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00007278 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000727C 4082000C */ bne lbl_00007288
/* 00007280 3C600020 */ lis r3, 0x20
/* 00007284 4BFF8EDD */ bl func_80071B50
lbl_00007288:
/* 00007288 C03D2168 */ lfs f1, 0x2168(r29)
/* 0000728C 4BFF8ED5 */ bl func_80071B1C
/* 00007290 C03D2134 */ lfs f1, 0x2134(r29)
/* 00007294 C05D21CC */ lfs f2, 0x21cc(r29)
/* 00007298 4BFF8EC9 */ bl func_80071B60
/* 0000729C 38600000 */ li r3, 0
/* 000072A0 4BFF8EC1 */ bl func_80071AE4
/* 000072A4 3A5E0007 */ addi r18, r30, 7
/* 000072A8 4CC63182 */ crclr 6
/* 000072AC 881E0007 */ lbz r0, 7(r30)
/* 000072B0 387F0488 */ addi r3, r31, 0x488
/* 000072B4 7C040774 */ extsb r4, r0
/* 000072B8 38840001 */ addi r4, r4, 1
/* 000072BC 4BFF8EA5 */ bl func_80072AC0
/* 000072C0 88120000 */ lbz r0, 0(r18)
/* 000072C4 807F0100 */ lwz r3, 0x100(r31)
/* 000072C8 7C000774 */ extsb r0, r0
/* 000072CC 54001838 */ slwi r0, r0, 3
/* 000072D0 7C630214 */ add r3, r3, r0
/* 000072D4 80630004 */ lwz r3, 4(r3)
/* 000072D8 4BFF8E89 */ bl func_80071E58
/* 000072DC C03D1CFC */ lfs f1, 0x1cfc(r29)
/* 000072E0 4BFF8E81 */ bl func_80071B1C
/* 000072E4 C03D1D48 */ lfs f1, 0x1d48(r29)
/* 000072E8 C05D21D0 */ lfs f2, 0x21d0(r29)
/* 000072EC 4BFF8E75 */ bl func_80071B60
/* 000072F0 3E6000F1 */ lis r19, 0xf1
/* 000072F4 3873C0C0 */ addi r3, r19, -16192  ;# fixed addi
/* 000072F8 4BFF8E69 */ bl func_80071AE4
/* 000072FC 88120000 */ lbz r0, 0(r18)
/* 00007300 387F0488 */ addi r3, r31, 0x488
/* 00007304 4CC63182 */ crclr 6
/* 00007308 7C040774 */ extsb r4, r0
/* 0000730C 38840001 */ addi r4, r4, 1
/* 00007310 4BFF8E51 */ bl func_80072AC0
/* 00007314 88120000 */ lbz r0, 0(r18)
/* 00007318 807F0100 */ lwz r3, 0x100(r31)
/* 0000731C 7C000774 */ extsb r0, r0
/* 00007320 54001838 */ slwi r0, r0, 3
/* 00007324 7C630214 */ add r3, r3, r0
/* 00007328 80630004 */ lwz r3, 4(r3)
/* 0000732C 4BFF8E35 */ bl func_80071E58
/* 00007330 881E0006 */ lbz r0, 6(r30)
/* 00007334 C03D21D4 */ lfs f1, 0x21d4(r29)
/* 00007338 7C000774 */ extsb r0, r0
/* 0000733C C05D21CC */ lfs f2, 0x21cc(r29)
/* 00007340 2240000A */ subfic r18, r0, 0xa
/* 00007344 4BFF8E1D */ bl func_80071B60
/* 00007348 38600000 */ li r3, 0
/* 0000734C 4BFF8E15 */ bl func_80071AE4
/* 00007350 C03D2168 */ lfs f1, 0x2168(r29)
/* 00007354 4BFF8E0D */ bl func_80071B1C
/* 00007358 38920000 */ addi r4, r18, 0
/* 0000735C 4CC63182 */ crclr 6
/* 00007360 387F01C8 */ addi r3, r31, 0x1c8
/* 00007364 4BFF8DFD */ bl func_80072AC0
/* 00007368 387F0494 */ addi r3, r31, 0x494
/* 0000736C 4BFF8DF5 */ bl func_80071E58
/* 00007370 C03D21D8 */ lfs f1, 0x21d8(r29)
/* 00007374 C05D21D0 */ lfs f2, 0x21d0(r29)
/* 00007378 4BFF8DE9 */ bl func_80071B60
/* 0000737C 3873C0C0 */ addi r3, r19, -16192  ;# fixed addi
/* 00007380 4BFF8DE1 */ bl func_80071AE4
/* 00007384 C03D1CFC */ lfs f1, 0x1cfc(r29)
/* 00007388 4BFF8DD9 */ bl func_80071B1C
/* 0000738C 38920000 */ addi r4, r18, 0
/* 00007390 4CC63182 */ crclr 6
/* 00007394 387F01C8 */ addi r3, r31, 0x1c8
/* 00007398 4BFF8DC9 */ bl func_80072AC0
/* 0000739C 387F0494 */ addi r3, r31, 0x494
/* 000073A0 4BFF8DC1 */ bl func_80071E58
/* 000073A4 387D0050 */ addi r3, r29, 0x50
/* 000073A8 4BFF8DB9 */ bl draw_naomi_sprite
/* 000073AC C03D2168 */ lfs f1, 0x2168(r29)
/* 000073B0 4BFF8DB1 */ bl func_80071B1C
/* 000073B4 C03D21DC */ lfs f1, 0x21dc(r29)
/* 000073B8 C05D21E0 */ lfs f2, 0x21e0(r29)
/* 000073BC 4BFF8DA5 */ bl func_80071B60
/* 000073C0 38600000 */ li r3, 0
/* 000073C4 4BFF8D9D */ bl func_80071AE4
/* 000073C8 387F04A0 */ addi r3, r31, 0x4a0
/* 000073CC 4BFF8D95 */ bl func_80071E58
/* 000073D0 C03D1CFC */ lfs f1, 0x1cfc(r29)
/* 000073D4 4BFF8D8D */ bl func_80071B1C
/* 000073D8 C03D21E4 */ lfs f1, 0x21e4(r29)
/* 000073DC C05D1DF0 */ lfs f2, 0x1df0(r29)
/* 000073E0 4BFF8D81 */ bl func_80071B60
/* 000073E4 3EA00100 */ lis r21, 0x100
/* 000073E8 3875FF00 */ addi r3, r21, -256  ;# fixed addi
/* 000073EC 4BFF8D75 */ bl func_80071AE4
/* 000073F0 387F04A0 */ addi r3, r31, 0x4a0
/* 000073F4 4BFF8D6D */ bl func_80071E58
/* 000073F8 801E0000 */ lwz r0, 0(r30)
/* 000073FC 3C600000 */ lis r3, lbl_00010D58@ha
/* 00007400 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00007404 6C008000 */ xoris r0, r0, 0x8000
/* 00007408 C85D21E8 */ lfd f2, 0x21e8(r29)
/* 0000740C 90010334 */ stw r0, 0x334(r1)
/* 00007410 3C004330 */ lis r0, 0x4330
/* 00007414 90010330 */ stw r0, 0x330(r1)
/* 00007418 C8010330 */ lfd f0, 0x330(r1)
/* 0000741C FC000828 */ fsub f0, f0, f1
/* 00007420 FC020032 */ fmul f0, f2, f0
/* 00007424 FC00001E */ fctiwz f0, f0
/* 00007428 D8010338 */ stfd f0, 0x338(r1)
/* 0000742C 8061033C */ lwz r3, 0x33c(r1)
/* 00007430 4BFF8D31 */ bl mathutil_sin
/* 00007434 C01D21F0 */ lfs f0, 0x21f0(r29)
/* 00007438 EC000072 */ fmuls f0, f0, f1
/* 0000743C C03D1F68 */ lfs f1, 0x1f68(r29)
/* 00007440 FC00001E */ fctiwz f0, f0
/* 00007444 D8010340 */ stfd f0, 0x340(r1)
/* 00007448 82410344 */ lwz r18, 0x344(r1)
/* 0000744C 4BFF8D15 */ bl mathutil_atan
/* 00007450 7C741B78 */ mr r20, r3
/* 00007454 C03D21F4 */ lfs f1, 0x21f4(r29)
/* 00007458 4BFF8D09 */ bl mathutil_sqrt
/* 0000745C FFE00890 */ fmr f31, f1
/* 00007460 7E530734 */ extsh r19, r18
/* 00007464 7E800734 */ extsh r0, r20
/* 00007468 7E530214 */ add r18, r19, r0
/* 0000746C 38720000 */ addi r3, r18, 0
/* 00007470 4BFF8CF1 */ bl mathutil_sin
/* 00007474 EC3F0072 */ fmuls f1, f31, f1
/* 00007478 C01D2138 */ lfs f0, 0x2138(r29)
/* 0000747C 38724000 */ addi r3, r18, 0x4000
/* 00007480 EFA00828 */ fsubs f29, f0, f1
/* 00007484 4BFF8CDD */ bl mathutil_sin
/* 00007488 EC3F0072 */ fmuls f1, f31, f1
/* 0000748C C01D21F8 */ lfs f0, 0x21f8(r29)
/* 00007490 7E639B78 */ mr r3, r19
/* 00007494 EFE00828 */ fsubs f31, f0, f1
/* 00007498 4BFF8CC9 */ bl func_80071B08
/* 0000749C C03D2168 */ lfs f1, 0x2168(r29)
/* 000074A0 4BFF8CC1 */ bl func_80071B1C
/* 000074A4 C03D1DAC */ lfs f1, 0x1dac(r29)
/* 000074A8 C01D1DF0 */ lfs f0, 0x1df0(r29)
/* 000074AC EFC1E82A */ fadds f30, f1, f29
/* 000074B0 C05D2100 */ lfs f2, 0x2100(r29)
/* 000074B4 EFA0F82A */ fadds f29, f0, f31
/* 000074B8 EC22F02A */ fadds f1, f2, f30
/* 000074BC EC42E82A */ fadds f2, f2, f29
/* 000074C0 4BFF8CA1 */ bl func_80071B60
/* 000074C4 38600000 */ li r3, 0
/* 000074C8 4BFF8C99 */ bl func_80071AE4
/* 000074CC 387F04BC */ addi r3, r31, 0x4bc
/* 000074D0 4BFF8C91 */ bl func_80071E58
/* 000074D4 C03D1CFC */ lfs f1, 0x1cfc(r29)
/* 000074D8 4BFF8C89 */ bl func_80071B1C
/* 000074DC FC20F090 */ fmr f1, f30
/* 000074E0 FC40E890 */ fmr f2, f29
/* 000074E4 4BFF8C7D */ bl func_80071B60
/* 000074E8 3875FF00 */ addi r3, r21, -256  ;# fixed addi
/* 000074EC 4BFF8C75 */ bl func_80071AE4
/* 000074F0 387F04BC */ addi r3, r31, 0x4bc
/* 000074F4 4BFF8C6D */ bl func_80071E58
/* 000074F8 BA410348 */ lmw r18, 0x348(r1)
/* 000074FC 8001039C */ lwz r0, 0x39c(r1)
/* 00007500 CBE10390 */ lfd f31, 0x390(r1)
/* 00007504 CBC10388 */ lfd f30, 0x388(r1)
/* 00007508 7C0803A6 */ mtlr r0
/* 0000750C CBA10380 */ lfd f29, 0x380(r1)
/* 00007510 38210398 */ addi r1, r1, 0x398
/* 00007514 4E800020 */ blr 
lbl_00007518:
/* 00007518 7C0802A6 */ mflr r0
/* 0000751C 3C600000 */ lis r3, currentBallStructPtr@ha
/* 00007520 90010004 */ stw r0, 4(r1)
/* 00007524 3C800000 */ lis r4, lbl_0000F020@ha
/* 00007528 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000752C 93E10014 */ stw r31, 0x14(r1)
/* 00007530 3BE30000 */ addi r31, r3, currentBallStructPtr@l
/* 00007534 93C10010 */ stw r30, 0x10(r1)
/* 00007538 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 0000753C 807F0000 */ lwz r3, 0(r31)
/* 00007540 3863001C */ addi r3, r3, 0x1c
/* 00007544 C0230000 */ lfs f1, 0(r3)
/* 00007548 C0430004 */ lfs f2, 4(r3)
/* 0000754C C0030008 */ lfs f0, 8(r3)
/* 00007550 EC210072 */ fmuls f1, f1, f1
/* 00007554 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007558 EC20083A */ fmadds f1, f0, f0, f1
/* 0000755C 4BFF8C05 */ bl mathutil_sqrt
/* 00007560 C81E2200 */ lfd f0, 0x2200(r30)
/* 00007564 807F0000 */ lwz r3, 0(r31)
/* 00007568 FC800072 */ fmul f4, f0, f1
/* 0000756C 80030094 */ lwz r0, 0x94(r3)
/* 00007570 540007FF */ clrlwi. r0, r0, 0x1f
/* 00007574 FC802018 */ frsp f4, f4
/* 00007578 418200A0 */ beq lbl_00007618
/* 0000757C C81E1D28 */ lfd f0, 0x1d28(r30)
/* 00007580 FC040040 */ fcmpo cr0, f4, f0
/* 00007584 40810094 */ ble lbl_00007618
/* 00007588 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 0000758C 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 00007590 5400077F */ clrlwi. r0, r0, 0x1d
/* 00007594 408200A4 */ bne lbl_00007638
/* 00007598 FC240028 */ fsub f1, f4, f0
/* 0000759C C85E2208 */ lfd f2, 0x2208(r30)
/* 000075A0 C81E2210 */ lfd f0, 0x2210(r30)
/* 000075A4 FC220072 */ fmul f1, f2, f1
/* 000075A8 FC010040 */ fcmpo cr0, f1, f0
/* 000075AC 40800008 */ bge lbl_000075B4
/* 000075B0 48000008 */ b lbl_000075B8
lbl_000075B4:
/* 000075B4 FC200090 */ fmr f1, f0
lbl_000075B8:
/* 000075B8 C81E1D28 */ lfd f0, 0x1d28(r30)
/* 000075BC FC60081E */ fctiwz f3, f1
/* 000075C0 C85E2218 */ lfd f2, 0x2218(r30)
/* 000075C4 FC240028 */ fsub f1, f4, f0
/* 000075C8 C81E2220 */ lfd f0, 0x2220(r30)
/* 000075CC D8610008 */ stfd f3, 8(r1)
/* 000075D0 FC220072 */ fmul f1, f2, f1
/* 000075D4 8081000C */ lwz r4, 0xc(r1)
/* 000075D8 FC010040 */ fcmpo cr0, f1, f0
/* 000075DC 40800008 */ bge lbl_000075E4
/* 000075E0 48000008 */ b lbl_000075E8
lbl_000075E4:
/* 000075E4 FC200090 */ fmr f1, f0
lbl_000075E8:
/* 000075E8 C81E2228 */ lfd f0, 0x2228(r30)
/* 000075EC 3C600000 */ lis r3, currentBallStructPtr@ha
/* 000075F0 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 000075F4 FC000072 */ fmul f0, f0, f1
/* 000075F8 80630000 */ lwz r3, 0(r3)
/* 000075FC 8863002E */ lbz r3, 0x2e(r3)
/* 00007600 FC00001E */ fctiwz f0, f0
/* 00007604 7C630774 */ extsb r3, r3
/* 00007608 D8010008 */ stfd f0, 8(r1)
/* 0000760C 80A1000C */ lwz r5, 0xc(r1)
/* 00007610 4BFF8B51 */ bl func_8002CA5C
/* 00007614 48000024 */ b lbl_00007638
lbl_00007618:
/* 00007618 3C600000 */ lis r3, currentBallStructPtr@ha
/* 0000761C 38630000 */ addi r3, r3, currentBallStructPtr@l
/* 00007620 80630000 */ lwz r3, 0(r3)
/* 00007624 38800000 */ li r4, 0
/* 00007628 38A00000 */ li r5, 0
/* 0000762C 8863002E */ lbz r3, 0x2e(r3)
/* 00007630 7C630774 */ extsb r3, r3
/* 00007634 4BFF8B2D */ bl func_8002CA5C
lbl_00007638:
/* 00007638 8001001C */ lwz r0, 0x1c(r1)
/* 0000763C 83E10014 */ lwz r31, 0x14(r1)
/* 00007640 83C10010 */ lwz r30, 0x10(r1)
/* 00007644 7C0803A6 */ mtlr r0
/* 00007648 38210018 */ addi r1, r1, 0x18
/* 0000764C 4E800020 */ blr 
lbl_00007650:
/* 00007650 7C0802A6 */ mflr r0
/* 00007654 3CC00000 */ lis r6, lbl_10000000@ha
/* 00007658 90010004 */ stw r0, 4(r1)
/* 0000765C 38E60000 */ addi r7, r6, lbl_10000000@l
/* 00007660 3C004330 */ lis r0, 0x4330
/* 00007664 9421FFD8 */ stwu r1, -0x28(r1)
/* 00007668 3CC00000 */ lis r6, lbl_00010D58@ha
/* 0000766C 90670154 */ stw r3, 0x154(r7)
/* 00007670 6CA38000 */ xoris r3, r5, 0x8000
/* 00007674 90610024 */ stw r3, 0x24(r1)
/* 00007678 3C600000 */ lis r3, lbl_00011250@ha
/* 0000767C 90870158 */ stw r4, 0x158(r7)
/* 00007680 7CA40734 */ extsh r4, r5
/* 00007684 38A30000 */ addi r5, r3, lbl_00011250@l
/* 00007688 B087015C */ sth r4, 0x15c(r7)
/* 0000768C 38600000 */ li r3, 0
/* 00007690 38800008 */ li r4, 8
/* 00007694 90010020 */ stw r0, 0x20(r1)
/* 00007698 C8460000 */ lfd f2, lbl_00010D58@l(r6)
/* 0000769C C8210020 */ lfd f1, 0x20(r1)
/* 000076A0 C8050000 */ lfd f0, 0(r5)
/* 000076A4 FC211028 */ fsub f1, f1, f2
/* 000076A8 FC010028 */ fsub f0, f1, f0
/* 000076AC FC00001E */ fctiwz f0, f0
/* 000076B0 D8010018 */ stfd f0, 0x18(r1)
/* 000076B4 8001001C */ lwz r0, 0x1c(r1)
/* 000076B8 B007015E */ sth r0, 0x15e(r7)
/* 000076BC 4BFF8AA5 */ bl g_play_music
/* 000076C0 8001002C */ lwz r0, 0x2c(r1)
/* 000076C4 38210028 */ addi r1, r1, 0x28
/* 000076C8 7C0803A6 */ mtlr r0
/* 000076CC 4E800020 */ blr 
lbl_000076D0:
/* 000076D0 7C0802A6 */ mflr r0
/* 000076D4 3C600000 */ lis r3, lbl_10000000@ha
/* 000076D8 90010004 */ stw r0, 4(r1)
/* 000076DC 38830000 */ addi r4, r3, lbl_10000000@l
/* 000076E0 9421FFF0 */ stwu r1, -0x10(r1)
/* 000076E4 93E1000C */ stw r31, 0xc(r1)
/* 000076E8 3BE4015C */ addi r31, r4, 0x15c
/* 000076EC A864015C */ lha r3, 0x15c(r4)
/* 000076F0 7C600735 */ extsh. r0, r3
/* 000076F4 40810038 */ ble lbl_0000772C
/* 000076F8 A804015E */ lha r0, 0x15e(r4)
/* 000076FC 7C030000 */ cmpw r3, r0
/* 00007700 40820010 */ bne lbl_00007710
/* 00007704 80640154 */ lwz r3, 0x154(r4)
/* 00007708 80840158 */ lwz r4, 0x158(r4)
/* 0000770C 4BFF8A55 */ bl func_8002BFCC
lbl_00007710:
/* 00007710 A87F0000 */ lha r3, 0(r31)
/* 00007714 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00007718 B01F0000 */ sth r0, 0(r31)
/* 0000771C A81F0000 */ lha r0, 0(r31)
/* 00007720 2C000000 */ cmpwi r0, 0
/* 00007724 41810008 */ bgt lbl_0000772C
/* 00007728 48000019 */ bl lbl_00007740
lbl_0000772C:
/* 0000772C 80010014 */ lwz r0, 0x14(r1)
/* 00007730 83E1000C */ lwz r31, 0xc(r1)
/* 00007734 38210010 */ addi r1, r1, 0x10
/* 00007738 7C0803A6 */ mtlr r0
/* 0000773C 4E800020 */ blr 
lbl_00007740:
/* 00007740 7C0802A6 */ mflr r0
/* 00007744 3C600000 */ lis r3, lbl_10000154@ha
/* 00007748 90010004 */ stw r0, 4(r1)
/* 0000774C 38630000 */ addi r3, r3, lbl_10000154@l
/* 00007750 38000000 */ li r0, 0
/* 00007754 9421FFF8 */ stwu r1, -8(r1)
/* 00007758 38800008 */ li r4, 8
/* 0000775C B0030008 */ sth r0, 8(r3)
/* 00007760 38600064 */ li r3, 0x64
/* 00007764 4BFF89FD */ bl g_play_music
/* 00007768 8001000C */ lwz r0, 0xc(r1)
/* 0000776C 38210008 */ addi r1, r1, 8
/* 00007770 7C0803A6 */ mtlr r0
/* 00007774 4E800020 */ blr 
lbl_00007778:
/* 00007778 3C600000 */ lis r3, spritePoolInfo@ha
/* 0000777C 38630000 */ addi r3, r3, spritePoolInfo@l
/* 00007780 8063000C */ lwz r3, 0xc(r3)
/* 00007784 88030000 */ lbz r0, 0(r3)
/* 00007788 7C000775 */ extsb. r0, r0
/* 0000778C 41820030 */ beq lbl_000077BC
/* 00007790 3C800000 */ lis r4, lbl_80206BD0@ha
/* 00007794 80040000 */ lwz r0, lbl_80206BD0@l(r4)
/* 00007798 3C800000 */ lis r4, controllerInfo@ha
/* 0000779C 38840000 */ addi r4, r4, controllerInfo@l
/* 000077A0 1C00003C */ mulli r0, r0, 0x3c
/* 000077A4 7C840214 */ add r4, r4, r0
/* 000077A8 A0040018 */ lhz r0, 0x18(r4)
/* 000077AC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000077B0 4182000C */ beq lbl_000077BC
/* 000077B4 38600001 */ li r3, 1
/* 000077B8 4E800020 */ blr 
lbl_000077BC:
/* 000077BC 88030001 */ lbz r0, 1(r3)
/* 000077C0 7C000775 */ extsb. r0, r0
/* 000077C4 41820034 */ beq lbl_000077F8
/* 000077C8 3C800000 */ lis r4, lbl_80206BD0@ha
/* 000077CC 38840000 */ addi r4, r4, lbl_80206BD0@l
/* 000077D0 80040004 */ lwz r0, 4(r4)
/* 000077D4 3C800000 */ lis r4, controllerInfo@ha
/* 000077D8 38840000 */ addi r4, r4, controllerInfo@l
/* 000077DC 1C00003C */ mulli r0, r0, 0x3c
/* 000077E0 7C840214 */ add r4, r4, r0
/* 000077E4 A0040018 */ lhz r0, 0x18(r4)
/* 000077E8 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000077EC 4182000C */ beq lbl_000077F8
/* 000077F0 38600001 */ li r3, 1
/* 000077F4 4E800020 */ blr 
lbl_000077F8:
/* 000077F8 88030002 */ lbz r0, 2(r3)
/* 000077FC 7C000775 */ extsb. r0, r0
/* 00007800 41820034 */ beq lbl_00007834
/* 00007804 3C800000 */ lis r4, lbl_80206BD0@ha
/* 00007808 38840000 */ addi r4, r4, lbl_80206BD0@l
/* 0000780C 80040008 */ lwz r0, 8(r4)
/* 00007810 3C800000 */ lis r4, controllerInfo@ha
/* 00007814 38840000 */ addi r4, r4, controllerInfo@l
/* 00007818 1C00003C */ mulli r0, r0, 0x3c
/* 0000781C 7C840214 */ add r4, r4, r0
/* 00007820 A0040018 */ lhz r0, 0x18(r4)
/* 00007824 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00007828 4182000C */ beq lbl_00007834
/* 0000782C 38600001 */ li r3, 1
/* 00007830 4E800020 */ blr 
lbl_00007834:
/* 00007834 88030003 */ lbz r0, 3(r3)
/* 00007838 7C000775 */ extsb. r0, r0
/* 0000783C 41820034 */ beq lbl_00007870
/* 00007840 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00007844 38630000 */ addi r3, r3, lbl_80206BD0@l
/* 00007848 8003000C */ lwz r0, 0xc(r3)
/* 0000784C 3C600000 */ lis r3, controllerInfo@ha
/* 00007850 38630000 */ addi r3, r3, controllerInfo@l
/* 00007854 1C00003C */ mulli r0, r0, 0x3c
/* 00007858 7C630214 */ add r3, r3, r0
/* 0000785C A0030018 */ lhz r0, 0x18(r3)
/* 00007860 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00007864 4182000C */ beq lbl_00007870
/* 00007868 38600001 */ li r3, 1
/* 0000786C 4E800020 */ blr 
lbl_00007870:
/* 00007870 38600000 */ li r3, 0
/* 00007874 4E800020 */ blr 
lbl_00007878:
/* 00007878 7C0802A6 */ mflr r0
/* 0000787C 90010004 */ stw r0, 4(r1)
/* 00007880 9421FFE8 */ stwu r1, -0x18(r1)
/* 00007884 93E10014 */ stw r31, 0x14(r1)
/* 00007888 93C10010 */ stw r30, 0x10(r1)
/* 0000788C 7C7E1B78 */ mr r30, r3
/* 00007890 88030148 */ lbz r0, 0x148(r3)
/* 00007894 2C000002 */ cmpwi r0, 2
/* 00007898 41820040 */ beq lbl_000078D8
/* 0000789C 40800014 */ bge lbl_000078B0
/* 000078A0 2C000000 */ cmpwi r0, 0
/* 000078A4 4182001C */ beq lbl_000078C0
/* 000078A8 40800024 */ bge lbl_000078CC
/* 000078AC 4800004C */ b lbl_000078F8
lbl_000078B0:
/* 000078B0 2C000004 */ cmpwi r0, 4
/* 000078B4 4182003C */ beq lbl_000078F0
/* 000078B8 40800040 */ bge lbl_000078F8
/* 000078BC 48000028 */ b lbl_000078E4
lbl_000078C0:
/* 000078C0 7FC3F378 */ mr r3, r30
/* 000078C4 480001A9 */ bl lbl_00007A6C
/* 000078C8 48000030 */ b lbl_000078F8
lbl_000078CC:
/* 000078CC 7FC3F378 */ mr r3, r30
/* 000078D0 48000385 */ bl lbl_00007C54
/* 000078D4 48000024 */ b lbl_000078F8
lbl_000078D8:
/* 000078D8 7FC3F378 */ mr r3, r30
/* 000078DC 48000599 */ bl lbl_00007E74
/* 000078E0 48000018 */ b lbl_000078F8
lbl_000078E4:
/* 000078E4 7FC3F378 */ mr r3, r30
/* 000078E8 480006F9 */ bl lbl_00007FE0
/* 000078EC 4800000C */ b lbl_000078F8
lbl_000078F0:
/* 000078F0 7FC3F378 */ mr r3, r30
/* 000078F4 480007ED */ bl lbl_000080E0
lbl_000078F8:
/* 000078F8 3C600000 */ lis r3, lbl_00011258@ha
/* 000078FC C03E0008 */ lfs f1, 8(r30)
/* 00007900 C8030000 */ lfd f0, lbl_00011258@l(r3)
/* 00007904 FC010040 */ fcmpo cr0, f1, f0
/* 00007908 40800038 */ bge lbl_00007940
/* 0000790C 801E0094 */ lwz r0, 0x94(r30)
/* 00007910 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00007914 4082002C */ bne lbl_00007940
/* 00007918 3C600000 */ lis r3, lbl_000153E4@ha
/* 0000791C 3BE30000 */ addi r31, r3, lbl_000153E4@l
/* 00007920 801F0000 */ lwz r0, 0(r31)
/* 00007924 2C00FFFF */ cmpwi r0, -1
/* 00007928 40820018 */ bne lbl_00007940
/* 0000792C 3860001D */ li r3, 0x1d
/* 00007930 4BFF8831 */ bl g_play_sound
/* 00007934 38600015 */ li r3, 0x15
/* 00007938 4BFF8829 */ bl func_8002B5EC
/* 0000793C 907F0000 */ stw r3, 0(r31)
lbl_00007940:
/* 00007940 807E0080 */ lwz r3, 0x80(r30)
/* 00007944 38030001 */ addi r0, r3, 1
/* 00007948 901E0080 */ stw r0, 0x80(r30)
/* 0000794C 8001001C */ lwz r0, 0x1c(r1)
/* 00007950 83E10014 */ lwz r31, 0x14(r1)
/* 00007954 83C10010 */ lwz r30, 0x10(r1)
/* 00007958 38210018 */ addi r1, r1, 0x18
/* 0000795C 7C0803A6 */ mtlr r0
/* 00007960 4E800020 */ blr 
lbl_00007964:
/* 00007964 2C030000 */ cmpwi r3, 0
/* 00007968 4D800020 */ bltlr 
/* 0000796C 2C030001 */ cmpwi r3, 1
/* 00007970 4D810020 */ bgtlr 
/* 00007974 1CC301A4 */ mulli r6, r3, 0x1a4
/* 00007978 3CA00000 */ lis r5, lbl_10000178@ha
/* 0000797C 38A50000 */ addi r5, r5, lbl_10000178@l
/* 00007980 38000034 */ li r0, 0x34
/* 00007984 7CA53214 */ add r5, r5, r6
/* 00007988 7C0903A6 */ mtctr r0
/* 0000798C 38E5FFF8 */ addi r7, r5, -8  ;# fixed addi
/* 00007990 38C4FFF8 */ addi r6, r4, -8  ;# fixed addi
lbl_00007994:
/* 00007994 84A60008 */ lwzu r5, 8(r6)
/* 00007998 80060004 */ lwz r0, 4(r6)
/* 0000799C 94A70008 */ stwu r5, 8(r7)
/* 000079A0 90070004 */ stw r0, 4(r7)
/* 000079A4 4200FFF0 */ bdnz lbl_00007994
/* 000079A8 80060008 */ lwz r0, 8(r6)
/* 000079AC 3CA00000 */ lis r5, lbl_100004C0@ha
/* 000079B0 54632036 */ slwi r3, r3, 4
/* 000079B4 90070008 */ stw r0, 8(r7)
/* 000079B8 38050000 */ addi r0, r5, lbl_100004C0@l
/* 000079BC 7CA01A14 */ add r5, r0, r3
/* 000079C0 808400FC */ lwz r4, 0xfc(r4)
/* 000079C4 80640060 */ lwz r3, 0x60(r4)
/* 000079C8 80040064 */ lwz r0, 0x64(r4)
/* 000079CC 90650000 */ stw r3, 0(r5)
/* 000079D0 90050004 */ stw r0, 4(r5)
/* 000079D4 80640068 */ lwz r3, 0x68(r4)
/* 000079D8 8004006C */ lwz r0, 0x6c(r4)
/* 000079DC 90650008 */ stw r3, 8(r5)
/* 000079E0 9005000C */ stw r0, 0xc(r5)
/* 000079E4 4E800020 */ blr 
lbl_000079E8:
/* 000079E8 2C030000 */ cmpwi r3, 0
/* 000079EC 4D800020 */ bltlr 
/* 000079F0 2C030001 */ cmpwi r3, 1
/* 000079F4 4D810020 */ bgtlr 
/* 000079F8 1CC301A4 */ mulli r6, r3, 0x1a4
/* 000079FC 3CA00000 */ lis r5, lbl_10000178@ha
/* 00007A00 38A50000 */ addi r5, r5, lbl_10000178@l
/* 00007A04 38000034 */ li r0, 0x34
/* 00007A08 7CA53214 */ add r5, r5, r6
/* 00007A0C 7C0903A6 */ mtctr r0
/* 00007A10 38E4FFF8 */ addi r7, r4, -8  ;# fixed addi
/* 00007A14 38C5FFF8 */ addi r6, r5, -8  ;# fixed addi
lbl_00007A18:
/* 00007A18 84A60008 */ lwzu r5, 8(r6)
/* 00007A1C 80060004 */ lwz r0, 4(r6)
/* 00007A20 94A70008 */ stwu r5, 8(r7)
/* 00007A24 90070004 */ stw r0, 4(r7)
/* 00007A28 4200FFF0 */ bdnz lbl_00007A18
/* 00007A2C 80060008 */ lwz r0, 8(r6)
/* 00007A30 3CA00000 */ lis r5, lbl_100004C0@ha
/* 00007A34 54632036 */ slwi r3, r3, 4
/* 00007A38 90070008 */ stw r0, 8(r7)
/* 00007A3C 38050000 */ addi r0, r5, lbl_100004C0@l
/* 00007A40 7CA01A14 */ add r5, r0, r3
/* 00007A44 808400FC */ lwz r4, 0xfc(r4)
/* 00007A48 80650000 */ lwz r3, 0(r5)
/* 00007A4C 80050004 */ lwz r0, 4(r5)
/* 00007A50 90640060 */ stw r3, 0x60(r4)
/* 00007A54 90040064 */ stw r0, 0x64(r4)
/* 00007A58 80650008 */ lwz r3, 8(r5)
/* 00007A5C 8005000C */ lwz r0, 0xc(r5)
/* 00007A60 90640068 */ stw r3, 0x68(r4)
/* 00007A64 9004006C */ stw r0, 0x6c(r4)
/* 00007A68 4E800020 */ blr 
lbl_00007A6C:
/* 00007A6C 7C0802A6 */ mflr r0
/* 00007A70 3CA00000 */ lis r5, lbl_000153E0@ha
/* 00007A74 90010004 */ stw r0, 4(r1)
/* 00007A78 3C800000 */ lis r4, lbl_00011258@ha
/* 00007A7C 9421FFC8 */ stwu r1, -0x38(r1)
/* 00007A80 93E10034 */ stw r31, 0x34(r1)
/* 00007A84 3BE40000 */ addi r31, r4, lbl_00011258@l
/* 00007A88 93C10030 */ stw r30, 0x30(r1)
/* 00007A8C 3BC50000 */ addi r30, r5, lbl_000153E0@l
/* 00007A90 93A1002C */ stw r29, 0x2c(r1)
/* 00007A94 3BA30000 */ addi r29, r3, 0
/* 00007A98 4BFF86C9 */ bl g_ball_init_2
/* 00007A9C C01F0014 */ lfs f0, 0x14(r31)
/* 00007AA0 38600000 */ li r3, 0
/* 00007AA4 3800BFDF */ li r0, -16417
/* 00007AA8 D01D0004 */ stfs f0, 4(r29)
/* 00007AAC C01F0018 */ lfs f0, 0x18(r31)
/* 00007AB0 D01D0008 */ stfs f0, 8(r29)
/* 00007AB4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007AB8 D01D000C */ stfs f0, 0xc(r29)
/* 00007ABC C01F0014 */ lfs f0, 0x14(r31)
/* 00007AC0 D01D0010 */ stfs f0, 0x10(r29)
/* 00007AC4 C01F0018 */ lfs f0, 0x18(r31)
/* 00007AC8 D01D0014 */ stfs f0, 0x14(r29)
/* 00007ACC C01F0014 */ lfs f0, 0x14(r31)
/* 00007AD0 D01D0018 */ stfs f0, 0x18(r29)
/* 00007AD4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007AD8 D01D001C */ stfs f0, 0x1c(r29)
/* 00007ADC C01F0014 */ lfs f0, 0x14(r31)
/* 00007AE0 D01D0020 */ stfs f0, 0x20(r29)
/* 00007AE4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007AE8 D01D0024 */ stfs f0, 0x24(r29)
/* 00007AEC B07D0028 */ sth r3, 0x28(r29)
/* 00007AF0 B07D002A */ sth r3, 0x2a(r29)
/* 00007AF4 B07D002C */ sth r3, 0x2c(r29)
/* 00007AF8 B07D0060 */ sth r3, 0x60(r29)
/* 00007AFC B07D0062 */ sth r3, 0x62(r29)
/* 00007B00 B07D0064 */ sth r3, 0x64(r29)
/* 00007B04 807D0094 */ lwz r3, 0x94(r29)
/* 00007B08 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 00007B0C 907D0094 */ stw r3, 0x94(r29)
/* 00007B10 809D00FC */ lwz r4, 0xfc(r29)
/* 00007B14 80640014 */ lwz r3, 0x14(r4)
/* 00007B18 7C600038 */ and r0, r3, r0
/* 00007B1C 90040014 */ stw r0, 0x14(r4)
/* 00007B20 C01F0014 */ lfs f0, 0x14(r31)
/* 00007B24 D01D00F8 */ stfs f0, 0xf8(r29)
/* 00007B28 C01F0014 */ lfs f0, 0x14(r31)
/* 00007B2C D01D00C4 */ stfs f0, 0xc4(r29)
/* 00007B30 807F0008 */ lwz r3, 8(r31)
/* 00007B34 801F000C */ lwz r0, 0xc(r31)
/* 00007B38 90610010 */ stw r3, 0x10(r1)
/* 00007B3C 90010014 */ stw r0, 0x14(r1)
/* 00007B40 801F0010 */ lwz r0, 0x10(r31)
/* 00007B44 90010018 */ stw r0, 0x18(r1)
/* 00007B48 80610010 */ lwz r3, 0x10(r1)
/* 00007B4C 80010014 */ lwz r0, 0x14(r1)
/* 00007B50 907D00B8 */ stw r3, 0xb8(r29)
/* 00007B54 901D00BC */ stw r0, 0xbc(r29)
/* 00007B58 80010018 */ lwz r0, 0x18(r1)
/* 00007B5C 901D00C0 */ stw r0, 0xc0(r29)
/* 00007B60 4BFF8601 */ bl mathutil_mtxA_from_identity
/* 00007B64 387D0098 */ addi r3, r29, 0x98
/* 00007B68 4BFF85F9 */ bl mathutil_mtxA_to_quat
/* 00007B6C A87D002C */ lha r3, 0x2c(r29)
/* 00007B70 4BFF85F1 */ bl mathutil_mtxA_rotate_z
/* 00007B74 A87D002A */ lha r3, 0x2a(r29)
/* 00007B78 4BFF85E9 */ bl mathutil_mtxA_rotate_y
/* 00007B7C A87D0028 */ lha r3, 0x28(r29)
/* 00007B80 4BFF85E1 */ bl mathutil_mtxA_rotate_x
/* 00007B84 387D0030 */ addi r3, r29, 0x30
/* 00007B88 4BFF85D9 */ bl mathutil_mtxA_to_mtx
/* 00007B8C 387D00C8 */ addi r3, r29, 0xc8
/* 00007B90 4BFF85D1 */ bl mathutil_mtxA_to_mtx
/* 00007B94 387D00A8 */ addi r3, r29, 0xa8
/* 00007B98 4BFF85C9 */ bl mathutil_mtxA_to_quat
/* 00007B9C 3C600000 */ lis r3, modeCtrl@ha
/* 00007BA0 38630000 */ addi r3, r3, modeCtrl@l
/* 00007BA4 80030024 */ lwz r0, 0x24(r3)
/* 00007BA8 2C000001 */ cmpwi r0, 1
/* 00007BAC 40820010 */ bne lbl_00007BBC
/* 00007BB0 38000003 */ li r0, 3
/* 00007BB4 981D014A */ stb r0, 0x14a(r29)
/* 00007BB8 4800000C */ b lbl_00007BC4
lbl_00007BBC:
/* 00007BBC 881D002E */ lbz r0, 0x2e(r29)
/* 00007BC0 981D014A */ stb r0, 0x14a(r29)
lbl_00007BC4:
/* 00007BC4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007BC8 3881001C */ addi r4, r1, 0x1c
/* 00007BCC D001001C */ stfs f0, 0x1c(r1)
/* 00007BD0 C01F0014 */ lfs f0, 0x14(r31)
/* 00007BD4 D0010020 */ stfs f0, 0x20(r1)
/* 00007BD8 C01F001C */ lfs f0, 0x1c(r31)
/* 00007BDC D0010024 */ stfs f0, 0x24(r1)
/* 00007BE0 807D00FC */ lwz r3, 0xfc(r29)
/* 00007BE4 4BFF857D */ bl func_8008C408
/* 00007BE8 801E0000 */ lwz r0, 0(r30)
/* 00007BEC 2C00FFFF */ cmpwi r0, -1
/* 00007BF0 41820014 */ beq lbl_00007C04
/* 00007BF4 5403043E */ clrlwi r3, r0, 0x10
/* 00007BF8 4BFF8569 */ bl SoundOff
/* 00007BFC 3800FFFF */ li r0, -1
/* 00007C00 901E0000 */ stw r0, 0(r30)
lbl_00007C04:
/* 00007C04 801E0004 */ lwz r0, 4(r30)
/* 00007C08 2C00FFFF */ cmpwi r0, -1
/* 00007C0C 41820014 */ beq lbl_00007C20
/* 00007C10 5403043E */ clrlwi r3, r0, 0x10
/* 00007C14 4BFF854D */ bl SoundOff
/* 00007C18 3800FFFF */ li r0, -1
/* 00007C1C 901E0004 */ stw r0, 4(r30)
lbl_00007C20:
/* 00007C20 38000000 */ li r0, 0
/* 00007C24 901D0080 */ stw r0, 0x80(r29)
/* 00007C28 38600019 */ li r3, 0x19
/* 00007C2C 38000002 */ li r0, 2
/* 00007C30 987D0003 */ stb r3, 3(r29)
/* 00007C34 981D0148 */ stb r0, 0x148(r29)
/* 00007C38 8001003C */ lwz r0, 0x3c(r1)
/* 00007C3C 83E10034 */ lwz r31, 0x34(r1)
/* 00007C40 83C10030 */ lwz r30, 0x30(r1)
/* 00007C44 83A1002C */ lwz r29, 0x2c(r1)
/* 00007C48 38210038 */ addi r1, r1, 0x38
/* 00007C4C 7C0803A6 */ mtlr r0
/* 00007C50 4E800020 */ blr 
lbl_00007C54:
/* 00007C54 7C0802A6 */ mflr r0
/* 00007C58 3C800000 */ lis r4, lbl_00011258@ha
/* 00007C5C 90010004 */ stw r0, 4(r1)
/* 00007C60 9421FFC8 */ stwu r1, -0x38(r1)
/* 00007C64 93E10034 */ stw r31, 0x34(r1)
/* 00007C68 3BE40000 */ addi r31, r4, lbl_00011258@l
/* 00007C6C 93C10030 */ stw r30, 0x30(r1)
/* 00007C70 7C7E1B78 */ mr r30, r3
/* 00007C74 389E001C */ addi r4, r30, 0x1c
/* 00007C78 80630004 */ lwz r3, 4(r3)
/* 00007C7C 801E0008 */ lwz r0, 8(r30)
/* 00007C80 907E0010 */ stw r3, 0x10(r30)
/* 00007C84 901E0014 */ stw r0, 0x14(r30)
/* 00007C88 801E000C */ lwz r0, 0xc(r30)
/* 00007C8C 901E0018 */ stw r0, 0x18(r30)
/* 00007C90 C0240000 */ lfs f1, 0(r4)
/* 00007C94 C0440004 */ lfs f2, 4(r4)
/* 00007C98 C0040008 */ lfs f0, 8(r4)
/* 00007C9C EC210072 */ fmuls f1, f1, f1
/* 00007CA0 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007CA4 EC20083A */ fmadds f1, f0, f0, f1
/* 00007CA8 4BFF84B9 */ bl mathutil_sqrt
/* 00007CAC D03E00F8 */ stfs f1, 0xf8(r30)
/* 00007CB0 387E0030 */ addi r3, r30, 0x30
/* 00007CB4 389E00C8 */ addi r4, r30, 0xc8
/* 00007CB8 4BFF84A9 */ bl mathutil_mtx_copy
/* 00007CBC A81E002A */ lha r0, 0x2a(r30)
/* 00007CC0 5403083C */ slwi r3, r0, 1
/* 00007CC4 4BFF849D */ bl mathutil_sin
/* 00007CC8 C85F0040 */ lfd f2, 0x40(r31)
/* 00007CCC C01E001C */ lfs f0, 0x1c(r30)
/* 00007CD0 FC220072 */ fmul f1, f2, f1
/* 00007CD4 FC000828 */ fsub f0, f0, f1
/* 00007CD8 FC000018 */ frsp f0, f0
/* 00007CDC D01E001C */ stfs f0, 0x1c(r30)
/* 00007CE0 C03E0020 */ lfs f1, 0x20(r30)
/* 00007CE4 C01E006C */ lfs f0, 0x6c(r30)
/* 00007CE8 EC010028 */ fsubs f0, f1, f0
/* 00007CEC D01E0020 */ stfs f0, 0x20(r30)
/* 00007CF0 C03E0024 */ lfs f1, 0x24(r30)
/* 00007CF4 C81F0048 */ lfd f0, 0x48(r31)
/* 00007CF8 FC010040 */ fcmpo cr0, f1, f0
/* 00007CFC 4081000C */ ble lbl_00007D08
/* 00007D00 C01F0050 */ lfs f0, 0x50(r31)
/* 00007D04 D01E0024 */ stfs f0, 0x24(r30)
lbl_00007D08:
/* 00007D08 C03E001C */ lfs f1, 0x1c(r30)
/* 00007D0C C01E0004 */ lfs f0, 4(r30)
/* 00007D10 EC01002A */ fadds f0, f1, f0
/* 00007D14 D01E0004 */ stfs f0, 4(r30)
/* 00007D18 C03E0020 */ lfs f1, 0x20(r30)
/* 00007D1C C01E0008 */ lfs f0, 8(r30)
/* 00007D20 EC01002A */ fadds f0, f1, f0
/* 00007D24 D01E0008 */ stfs f0, 8(r30)
/* 00007D28 C03E0024 */ lfs f1, 0x24(r30)
/* 00007D2C C01E000C */ lfs f0, 0xc(r30)
/* 00007D30 EC01002A */ fadds f0, f1, f0
/* 00007D34 D01E000C */ stfs f0, 0xc(r30)
/* 00007D38 A87E0028 */ lha r3, 0x28(r30)
/* 00007D3C A81E0060 */ lha r0, 0x60(r30)
/* 00007D40 7C030214 */ add r0, r3, r0
/* 00007D44 B01E0028 */ sth r0, 0x28(r30)
/* 00007D48 A87E002A */ lha r3, 0x2a(r30)
/* 00007D4C A81E0062 */ lha r0, 0x62(r30)
/* 00007D50 7C030214 */ add r0, r3, r0
/* 00007D54 B01E002A */ sth r0, 0x2a(r30)
/* 00007D58 A87E002C */ lha r3, 0x2c(r30)
/* 00007D5C A81E0064 */ lha r0, 0x64(r30)
/* 00007D60 7C030214 */ add r0, r3, r0
/* 00007D64 B01E002C */ sth r0, 0x2c(r30)
/* 00007D68 A87E002C */ lha r3, 0x2c(r30)
/* 00007D6C 4BFF83F5 */ bl mathutil_mtxA_from_rotate_z
/* 00007D70 A87E002A */ lha r3, 0x2a(r30)
/* 00007D74 4BFF83ED */ bl mathutil_mtxA_rotate_y
/* 00007D78 A87E0028 */ lha r3, 0x28(r30)
/* 00007D7C 4BFF83E5 */ bl mathutil_mtxA_rotate_x
/* 00007D80 387E0098 */ addi r3, r30, 0x98
/* 00007D84 4BFF83DD */ bl mathutil_mtxA_to_quat
/* 00007D88 387E0004 */ addi r3, r30, 4
/* 00007D8C C0430000 */ lfs f2, 0(r3)
/* 00007D90 C0230004 */ lfs f1, 4(r3)
/* 00007D94 C0030008 */ lfs f0, 8(r3)
/* 00007D98 3C60E000 */ lis r3, 0xe000
/* 00007D9C D043000C */ stfs f2, 0xc(r3)
/* 00007DA0 D023001C */ stfs f1, 0x1c(r3)
/* 00007DA4 D003002C */ stfs f0, 0x2c(r3)
/* 00007DA8 387E0030 */ addi r3, r30, 0x30
/* 00007DAC 4BFF83B5 */ bl mathutil_mtxA_to_mtx
/* 00007DB0 387E00A8 */ addi r3, r30, 0xa8
/* 00007DB4 4BFF83AD */ bl mathutil_mtxA_to_quat
/* 00007DB8 7FC3F378 */ mr r3, r30
/* 00007DBC 48000529 */ bl lbl_000082E4
/* 00007DC0 2C030005 */ cmpwi r3, 5
/* 00007DC4 4182001C */ beq lbl_00007DE0
/* 00007DC8 2C03000F */ cmpwi r3, 0xf
/* 00007DCC 41820014 */ beq lbl_00007DE0
/* 00007DD0 2C030007 */ cmpwi r3, 7
/* 00007DD4 4182000C */ beq lbl_00007DE0
/* 00007DD8 2C03000A */ cmpwi r3, 0xa
/* 00007DDC 40820010 */ bne lbl_00007DEC
lbl_00007DE0:
/* 00007DE0 801E0094 */ lwz r0, 0x94(r30)
/* 00007DE4 60001000 */ ori r0, r0, 0x1000
/* 00007DE8 901E0094 */ stw r0, 0x94(r30)
lbl_00007DEC:
/* 00007DEC 807E00FC */ lwz r3, 0xfc(r30)
/* 00007DF0 80030024 */ lwz r0, 0x24(r3)
/* 00007DF4 2C00000A */ cmpwi r0, 0xa
/* 00007DF8 40820064 */ bne lbl_00007E5C
/* 00007DFC 801E0080 */ lwz r0, 0x80(r30)
/* 00007E00 5400073F */ clrlwi. r0, r0, 0x1c
/* 00007E04 40820058 */ bne lbl_00007E5C
/* 00007E08 807F0020 */ lwz r3, 0x20(r31)
/* 00007E0C 801F0024 */ lwz r0, 0x24(r31)
/* 00007E10 9061000C */ stw r3, 0xc(r1)
/* 00007E14 90010010 */ stw r0, 0x10(r1)
/* 00007E18 807F0028 */ lwz r3, 0x28(r31)
/* 00007E1C 801F002C */ lwz r0, 0x2c(r31)
/* 00007E20 90610014 */ stw r3, 0x14(r1)
/* 00007E24 90010018 */ stw r0, 0x18(r1)
/* 00007E28 807F0030 */ lwz r3, 0x30(r31)
/* 00007E2C 801F0034 */ lwz r0, 0x34(r31)
/* 00007E30 9061001C */ stw r3, 0x1c(r1)
/* 00007E34 90010020 */ stw r0, 0x20(r1)
/* 00007E38 807F0038 */ lwz r3, 0x38(r31)
/* 00007E3C 801F003C */ lwz r0, 0x3c(r31)
/* 00007E40 90610024 */ stw r3, 0x24(r1)
/* 00007E44 90010028 */ stw r0, 0x28(r1)
/* 00007E48 4BFF8319 */ bl rand
/* 00007E4C 546016FA */ rlwinm r0, r3, 2, 0x1b, 0x1d
/* 00007E50 3861000C */ addi r3, r1, 0xc
/* 00007E54 7C63002E */ lwzx r3, r3, r0
/* 00007E58 4BFF8309 */ bl g_play_sound
lbl_00007E5C:
/* 00007E5C 8001003C */ lwz r0, 0x3c(r1)
/* 00007E60 83E10034 */ lwz r31, 0x34(r1)
/* 00007E64 83C10030 */ lwz r30, 0x30(r1)
/* 00007E68 7C0803A6 */ mtlr r0
/* 00007E6C 38210038 */ addi r1, r1, 0x38
/* 00007E70 4E800020 */ blr 
lbl_00007E74:
/* 00007E74 7C0802A6 */ mflr r0
/* 00007E78 3C800000 */ lis r4, lbl_00011258@ha
/* 00007E7C 90010004 */ stw r0, 4(r1)
/* 00007E80 9421FFE0 */ stwu r1, -0x20(r1)
/* 00007E84 93E1001C */ stw r31, 0x1c(r1)
/* 00007E88 7C7F1B78 */ mr r31, r3
/* 00007E8C 93C10018 */ stw r30, 0x18(r1)
/* 00007E90 3BC40000 */ addi r30, r4, lbl_00011258@l
/* 00007E94 389F001C */ addi r4, r31, 0x1c
/* 00007E98 80630004 */ lwz r3, 4(r3)
/* 00007E9C 801F0008 */ lwz r0, 8(r31)
/* 00007EA0 907F0010 */ stw r3, 0x10(r31)
/* 00007EA4 901F0014 */ stw r0, 0x14(r31)
/* 00007EA8 801F000C */ lwz r0, 0xc(r31)
/* 00007EAC 901F0018 */ stw r0, 0x18(r31)
/* 00007EB0 C0240000 */ lfs f1, 0(r4)
/* 00007EB4 C0440004 */ lfs f2, 4(r4)
/* 00007EB8 C0040008 */ lfs f0, 8(r4)
/* 00007EBC EC210072 */ fmuls f1, f1, f1
/* 00007EC0 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007EC4 EC20083A */ fmadds f1, f0, f0, f1
/* 00007EC8 4BFF8299 */ bl mathutil_sqrt
/* 00007ECC D03F00F8 */ stfs f1, 0xf8(r31)
/* 00007ED0 387F0030 */ addi r3, r31, 0x30
/* 00007ED4 389F00C8 */ addi r4, r31, 0xc8
/* 00007ED8 4BFF8289 */ bl mathutil_mtx_copy
/* 00007EDC C03F0020 */ lfs f1, 0x20(r31)
/* 00007EE0 C01F006C */ lfs f0, 0x6c(r31)
/* 00007EE4 EC010028 */ fsubs f0, f1, f0
/* 00007EE8 D01F0020 */ stfs f0, 0x20(r31)
/* 00007EEC C03F001C */ lfs f1, 0x1c(r31)
/* 00007EF0 C01F0004 */ lfs f0, 4(r31)
/* 00007EF4 EC01002A */ fadds f0, f1, f0
/* 00007EF8 D01F0004 */ stfs f0, 4(r31)
/* 00007EFC C03F0020 */ lfs f1, 0x20(r31)
/* 00007F00 C01F0008 */ lfs f0, 8(r31)
/* 00007F04 EC01002A */ fadds f0, f1, f0
/* 00007F08 D01F0008 */ stfs f0, 8(r31)
/* 00007F0C C03F0024 */ lfs f1, 0x24(r31)
/* 00007F10 C01F000C */ lfs f0, 0xc(r31)
/* 00007F14 EC01002A */ fadds f0, f1, f0
/* 00007F18 D01F000C */ stfs f0, 0xc(r31)
/* 00007F1C A87F0028 */ lha r3, 0x28(r31)
/* 00007F20 A81F0060 */ lha r0, 0x60(r31)
/* 00007F24 7C030214 */ add r0, r3, r0
/* 00007F28 B01F0028 */ sth r0, 0x28(r31)
/* 00007F2C A87F002A */ lha r3, 0x2a(r31)
/* 00007F30 A81F0062 */ lha r0, 0x62(r31)
/* 00007F34 7C030214 */ add r0, r3, r0
/* 00007F38 B01F002A */ sth r0, 0x2a(r31)
/* 00007F3C A87F002C */ lha r3, 0x2c(r31)
/* 00007F40 A81F0064 */ lha r0, 0x64(r31)
/* 00007F44 7C030214 */ add r0, r3, r0
/* 00007F48 B01F002C */ sth r0, 0x2c(r31)
/* 00007F4C A87F002C */ lha r3, 0x2c(r31)
/* 00007F50 4BFF8211 */ bl mathutil_mtxA_from_rotate_z
/* 00007F54 A87F002A */ lha r3, 0x2a(r31)
/* 00007F58 4BFF8209 */ bl mathutil_mtxA_rotate_y
/* 00007F5C A87F0028 */ lha r3, 0x28(r31)
/* 00007F60 4BFF8201 */ bl mathutil_mtxA_rotate_x
/* 00007F64 387F0098 */ addi r3, r31, 0x98
/* 00007F68 4BFF81F9 */ bl mathutil_mtxA_to_quat
/* 00007F6C 387F0004 */ addi r3, r31, 4
/* 00007F70 C0430000 */ lfs f2, 0(r3)
/* 00007F74 C0230004 */ lfs f1, 4(r3)
/* 00007F78 C0030008 */ lfs f0, 8(r3)
/* 00007F7C 3C60E000 */ lis r3, 0xe000
/* 00007F80 D043000C */ stfs f2, 0xc(r3)
/* 00007F84 D023001C */ stfs f1, 0x1c(r3)
/* 00007F88 D003002C */ stfs f0, 0x2c(r3)
/* 00007F8C 387F0030 */ addi r3, r31, 0x30
/* 00007F90 4BFF81D1 */ bl mathutil_mtxA_to_mtx
/* 00007F94 387F00A8 */ addi r3, r31, 0xa8
/* 00007F98 4BFF81C9 */ bl mathutil_mtxA_to_quat
/* 00007F9C 7FE3FB78 */ mr r3, r31
/* 00007FA0 48000345 */ bl lbl_000082E4
/* 00007FA4 C01E0014 */ lfs f0, 0x14(r30)
/* 00007FA8 3881000C */ addi r4, r1, 0xc
/* 00007FAC D001000C */ stfs f0, 0xc(r1)
/* 00007FB0 C01E0014 */ lfs f0, 0x14(r30)
/* 00007FB4 D0010010 */ stfs f0, 0x10(r1)
/* 00007FB8 C01E001C */ lfs f0, 0x1c(r30)
/* 00007FBC D0010014 */ stfs f0, 0x14(r1)
/* 00007FC0 807F00FC */ lwz r3, 0xfc(r31)
/* 00007FC4 4BFF819D */ bl func_8008C408
/* 00007FC8 80010024 */ lwz r0, 0x24(r1)
/* 00007FCC 83E1001C */ lwz r31, 0x1c(r1)
/* 00007FD0 83C10018 */ lwz r30, 0x18(r1)
/* 00007FD4 7C0803A6 */ mtlr r0
/* 00007FD8 38210020 */ addi r1, r1, 0x20
/* 00007FDC 4E800020 */ blr 
lbl_00007FE0:
/* 00007FE0 7C0802A6 */ mflr r0
/* 00007FE4 3C800000 */ lis r4, lbl_00011258@ha
/* 00007FE8 90010004 */ stw r0, 4(r1)
/* 00007FEC 38840000 */ addi r4, r4, lbl_00011258@l
/* 00007FF0 38001000 */ li r0, 0x1000
/* 00007FF4 9421FFE8 */ stwu r1, -0x18(r1)
/* 00007FF8 3CA00000 */ lis r5, lbl_000153E0@ha
/* 00007FFC 93E10014 */ stw r31, 0x14(r1)
/* 00008000 3BE50000 */ addi r31, r5, lbl_000153E0@l
/* 00008004 93C10010 */ stw r30, 0x10(r1)
/* 00008008 3BC30000 */ addi r30, r3, 0
/* 0000800C C0040014 */ lfs f0, 0x14(r4)
/* 00008010 D0030004 */ stfs f0, 4(r3)
/* 00008014 38600000 */ li r3, 0
/* 00008018 C0040054 */ lfs f0, 0x54(r4)
/* 0000801C D01E0008 */ stfs f0, 8(r30)
/* 00008020 C0040058 */ lfs f0, 0x58(r4)
/* 00008024 D01E000C */ stfs f0, 0xc(r30)
/* 00008028 C0040014 */ lfs f0, 0x14(r4)
/* 0000802C D01E0010 */ stfs f0, 0x10(r30)
/* 00008030 C0040054 */ lfs f0, 0x54(r4)
/* 00008034 D01E0014 */ stfs f0, 0x14(r30)
/* 00008038 C0040058 */ lfs f0, 0x58(r4)
/* 0000803C D01E0018 */ stfs f0, 0x18(r30)
/* 00008040 C0040014 */ lfs f0, 0x14(r4)
/* 00008044 D01E001C */ stfs f0, 0x1c(r30)
/* 00008048 C024005C */ lfs f1, 0x5c(r4)
/* 0000804C C01E006C */ lfs f0, 0x6c(r30)
/* 00008050 EC010032 */ fmuls f0, f1, f0
/* 00008054 D01E0020 */ stfs f0, 0x20(r30)
/* 00008058 C0040060 */ lfs f0, 0x60(r4)
/* 0000805C D01E0024 */ stfs f0, 0x24(r30)
/* 00008060 B07E0028 */ sth r3, 0x28(r30)
/* 00008064 B07E002A */ sth r3, 0x2a(r30)
/* 00008068 B07E002C */ sth r3, 0x2c(r30)
/* 0000806C B01E0060 */ sth r0, 0x60(r30)
/* 00008070 B07E0062 */ sth r3, 0x62(r30)
/* 00008074 B07E0064 */ sth r3, 0x64(r30)
/* 00008078 C0040014 */ lfs f0, 0x14(r4)
/* 0000807C D01E00F8 */ stfs f0, 0xf8(r30)
/* 00008080 801F0000 */ lwz r0, 0(r31)
/* 00008084 2C00FFFF */ cmpwi r0, -1
/* 00008088 41820014 */ beq lbl_0000809C
/* 0000808C 5403043E */ clrlwi r3, r0, 0x10
/* 00008090 4BFF80D1 */ bl SoundOff
/* 00008094 3800FFFF */ li r0, -1
/* 00008098 901F0000 */ stw r0, 0(r31)
lbl_0000809C:
/* 0000809C 801F0004 */ lwz r0, 4(r31)
/* 000080A0 2C00FFFF */ cmpwi r0, -1
/* 000080A4 41820014 */ beq lbl_000080B8
/* 000080A8 5403043E */ clrlwi r3, r0, 0x10
/* 000080AC 4BFF80B5 */ bl SoundOff
/* 000080B0 3800FFFF */ li r0, -1
/* 000080B4 901F0004 */ stw r0, 4(r31)
lbl_000080B8:
/* 000080B8 38000000 */ li r0, 0
/* 000080BC 901E0080 */ stw r0, 0x80(r30)
/* 000080C0 38000004 */ li r0, 4
/* 000080C4 981E0148 */ stb r0, 0x148(r30)
/* 000080C8 8001001C */ lwz r0, 0x1c(r1)
/* 000080CC 83E10014 */ lwz r31, 0x14(r1)
/* 000080D0 83C10010 */ lwz r30, 0x10(r1)
/* 000080D4 38210018 */ addi r1, r1, 0x18
/* 000080D8 7C0803A6 */ mtlr r0
/* 000080DC 4E800020 */ blr 
lbl_000080E0:
/* 000080E0 7C0802A6 */ mflr r0
/* 000080E4 90010004 */ stw r0, 4(r1)
/* 000080E8 9421FFD0 */ stwu r1, -0x30(r1)
/* 000080EC 93E1002C */ stw r31, 0x2c(r1)
/* 000080F0 7C7F1B78 */ mr r31, r3
/* 000080F4 389F001C */ addi r4, r31, 0x1c
/* 000080F8 80630004 */ lwz r3, 4(r3)
/* 000080FC 801F0008 */ lwz r0, 8(r31)
/* 00008100 907F0010 */ stw r3, 0x10(r31)
/* 00008104 901F0014 */ stw r0, 0x14(r31)
/* 00008108 801F000C */ lwz r0, 0xc(r31)
/* 0000810C 901F0018 */ stw r0, 0x18(r31)
/* 00008110 C0240000 */ lfs f1, 0(r4)
/* 00008114 C0440004 */ lfs f2, 4(r4)
/* 00008118 C0040008 */ lfs f0, 8(r4)
/* 0000811C EC210072 */ fmuls f1, f1, f1
/* 00008120 EC2208BA */ fmadds f1, f2, f2, f1
/* 00008124 EC20083A */ fmadds f1, f0, f0, f1
/* 00008128 4BFF8039 */ bl mathutil_sqrt
/* 0000812C D03F00F8 */ stfs f1, 0xf8(r31)
/* 00008130 387F0030 */ addi r3, r31, 0x30
/* 00008134 389F00C8 */ addi r4, r31, 0xc8
/* 00008138 4BFF8029 */ bl mathutil_mtx_copy
/* 0000813C C03F0020 */ lfs f1, 0x20(r31)
/* 00008140 3C800000 */ lis r4, lbl_000112C0@ha
/* 00008144 C01F006C */ lfs f0, 0x6c(r31)
/* 00008148 38A40000 */ addi r5, r4, lbl_000112C0@l
/* 0000814C 3C600000 */ lis r3, lbl_000112C8@ha
/* 00008150 EC010028 */ fsubs f0, f1, f0
/* 00008154 3C004330 */ lis r0, 0x4330
/* 00008158 D01F0020 */ stfs f0, 0x20(r31)
/* 0000815C C03F0024 */ lfs f1, 0x24(r31)
/* 00008160 C8050000 */ lfd f0, 0(r5)
/* 00008164 FC010032 */ fmul f0, f1, f0
/* 00008168 FC000018 */ frsp f0, f0
/* 0000816C D01F0024 */ stfs f0, 0x24(r31)
/* 00008170 A89F0060 */ lha r4, 0x60(r31)
/* 00008174 C8430000 */ lfd f2, lbl_000112C8@l(r3)
/* 00008178 6C838000 */ xoris r3, r4, 0x8000
/* 0000817C C8050000 */ lfd f0, 0(r5)
/* 00008180 90610024 */ stw r3, 0x24(r1)
/* 00008184 90010020 */ stw r0, 0x20(r1)
/* 00008188 C8210020 */ lfd f1, 0x20(r1)
/* 0000818C FC211028 */ fsub f1, f1, f2
/* 00008190 FC010032 */ fmul f0, f1, f0
/* 00008194 FC00001E */ fctiwz f0, f0
/* 00008198 D8010018 */ stfd f0, 0x18(r1)
/* 0000819C 8001001C */ lwz r0, 0x1c(r1)
/* 000081A0 B01F0060 */ sth r0, 0x60(r31)
/* 000081A4 C03F001C */ lfs f1, 0x1c(r31)
/* 000081A8 C01F0004 */ lfs f0, 4(r31)
/* 000081AC EC01002A */ fadds f0, f1, f0
/* 000081B0 D01F0004 */ stfs f0, 4(r31)
/* 000081B4 C03F0020 */ lfs f1, 0x20(r31)
/* 000081B8 C01F0008 */ lfs f0, 8(r31)
/* 000081BC EC01002A */ fadds f0, f1, f0
/* 000081C0 D01F0008 */ stfs f0, 8(r31)
/* 000081C4 C03F0024 */ lfs f1, 0x24(r31)
/* 000081C8 C01F000C */ lfs f0, 0xc(r31)
/* 000081CC EC01002A */ fadds f0, f1, f0
/* 000081D0 D01F000C */ stfs f0, 0xc(r31)
/* 000081D4 A87F0028 */ lha r3, 0x28(r31)
/* 000081D8 A81F0060 */ lha r0, 0x60(r31)
/* 000081DC 7C030214 */ add r0, r3, r0
/* 000081E0 B01F0028 */ sth r0, 0x28(r31)
/* 000081E4 A87F002A */ lha r3, 0x2a(r31)
/* 000081E8 A81F0062 */ lha r0, 0x62(r31)
/* 000081EC 7C030214 */ add r0, r3, r0
/* 000081F0 B01F002A */ sth r0, 0x2a(r31)
/* 000081F4 A87F002C */ lha r3, 0x2c(r31)
/* 000081F8 A81F0064 */ lha r0, 0x64(r31)
/* 000081FC 7C030214 */ add r0, r3, r0
/* 00008200 B01F002C */ sth r0, 0x2c(r31)
/* 00008204 A87F002C */ lha r3, 0x2c(r31)
/* 00008208 4BFF7F59 */ bl mathutil_mtxA_from_rotate_z
/* 0000820C A87F002A */ lha r3, 0x2a(r31)
/* 00008210 4BFF7F51 */ bl mathutil_mtxA_rotate_y
/* 00008214 A87F0028 */ lha r3, 0x28(r31)
/* 00008218 4BFF7F49 */ bl mathutil_mtxA_rotate_x
/* 0000821C 387F0098 */ addi r3, r31, 0x98
/* 00008220 4BFF7F41 */ bl mathutil_mtxA_to_quat
/* 00008224 387F0004 */ addi r3, r31, 4
/* 00008228 C0430000 */ lfs f2, 0(r3)
/* 0000822C C0230004 */ lfs f1, 4(r3)
/* 00008230 C0030008 */ lfs f0, 8(r3)
/* 00008234 3C60E000 */ lis r3, 0xe000
/* 00008238 D043000C */ stfs f2, 0xc(r3)
/* 0000823C D023001C */ stfs f1, 0x1c(r3)
/* 00008240 D003002C */ stfs f0, 0x2c(r3)
/* 00008244 387F0030 */ addi r3, r31, 0x30
/* 00008248 4BFF7F19 */ bl mathutil_mtxA_to_mtx
/* 0000824C 387F00A8 */ addi r3, r31, 0xa8
/* 00008250 4BFF7F11 */ bl mathutil_mtxA_to_quat
/* 00008254 7FE3FB78 */ mr r3, r31
/* 00008258 4800008D */ bl lbl_000082E4
/* 0000825C 881F002E */ lbz r0, 0x2e(r31)
/* 00008260 3C600000 */ lis r3, cameraInfo@ha
/* 00008264 38A30000 */ addi r5, r3, cameraInfo@l
/* 00008268 C01F0004 */ lfs f0, 4(r31)
/* 0000826C 7C000774 */ extsb r0, r0
/* 00008270 1C000284 */ mulli r0, r0, 0x284
/* 00008274 7C650214 */ add r3, r5, r0
/* 00008278 C0230000 */ lfs f1, 0(r3)
/* 0000827C 3881000C */ addi r4, r1, 0xc
/* 00008280 EC010028 */ fsubs f0, f1, f0
/* 00008284 D001000C */ stfs f0, 0xc(r1)
/* 00008288 881F002E */ lbz r0, 0x2e(r31)
/* 0000828C C01F0008 */ lfs f0, 8(r31)
/* 00008290 7C000774 */ extsb r0, r0
/* 00008294 1C000284 */ mulli r0, r0, 0x284
/* 00008298 7C650214 */ add r3, r5, r0
/* 0000829C C0230004 */ lfs f1, 4(r3)
/* 000082A0 EC010028 */ fsubs f0, f1, f0
/* 000082A4 D0010010 */ stfs f0, 0x10(r1)
/* 000082A8 881F002E */ lbz r0, 0x2e(r31)
/* 000082AC C01F000C */ lfs f0, 0xc(r31)
/* 000082B0 7C000774 */ extsb r0, r0
/* 000082B4 1C000284 */ mulli r0, r0, 0x284
/* 000082B8 7C650214 */ add r3, r5, r0
/* 000082BC C0230008 */ lfs f1, 8(r3)
/* 000082C0 EC010028 */ fsubs f0, f1, f0
/* 000082C4 D0010014 */ stfs f0, 0x14(r1)
/* 000082C8 807F00FC */ lwz r3, 0xfc(r31)
/* 000082CC 4BFF7E95 */ bl func_8008C408
/* 000082D0 80010034 */ lwz r0, 0x34(r1)
/* 000082D4 83E1002C */ lwz r31, 0x2c(r1)
/* 000082D8 38210030 */ addi r1, r1, 0x30
/* 000082DC 7C0803A6 */ mtlr r0
/* 000082E0 4E800020 */ blr 
lbl_000082E4:
/* 000082E4 7C0802A6 */ mflr r0
/* 000082E8 3C800000 */ lis r4, lbl_000153E0@ha
/* 000082EC 90010004 */ stw r0, 4(r1)
/* 000082F0 9421FF90 */ stwu r1, -0x70(r1)
/* 000082F4 DBE10068 */ stfd f31, 0x68(r1)
/* 000082F8 38A10038 */ addi r5, r1, 0x38
/* 000082FC 38C10034 */ addi r6, r1, 0x34
/* 00008300 DBC10060 */ stfd f30, 0x60(r1)
/* 00008304 38E10030 */ addi r7, r1, 0x30
/* 00008308 93E1005C */ stw r31, 0x5c(r1)
/* 0000830C 93C10058 */ stw r30, 0x58(r1)
/* 00008310 3BC40000 */ addi r30, r4, lbl_000153E0@l
/* 00008314 93A10054 */ stw r29, 0x54(r1)
/* 00008318 3BA30000 */ addi r29, r3, 0
/* 0000831C 389D0010 */ addi r4, r29, 0x10
/* 00008320 93810050 */ stw r28, 0x50(r1)
/* 00008324 C0230068 */ lfs f1, 0x68(r3)
/* 00008328 3C600000 */ lis r3, lbl_00011258@ha
/* 0000832C 3BE30000 */ addi r31, r3, lbl_00011258@l
/* 00008330 387D0004 */ addi r3, r29, 4
/* 00008334 48006561 */ bl lbl_0000E894
/* 00008338 FFE00890 */ fmr f31, f1
/* 0000833C C01F0014 */ lfs f0, 0x14(r31)
/* 00008340 FC1F0040 */ fcmpo cr0, f31, f0
/* 00008344 4C401382 */ cror 2, 0, 2
/* 00008348 40820040 */ bne lbl_00008388
/* 0000834C C81F0078 */ lfd f0, 0x78(r31)
/* 00008350 FC1F0040 */ fcmpo cr0, f31, f0
/* 00008354 40800010 */ bge lbl_00008364
/* 00008358 801D0094 */ lwz r0, 0x94(r29)
/* 0000835C 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 00008360 901D0094 */ stw r0, 0x94(r29)
lbl_00008364:
/* 00008364 801E0000 */ lwz r0, 0(r30)
/* 00008368 2C00FFFF */ cmpwi r0, -1
/* 0000836C 41820014 */ beq lbl_00008380
/* 00008370 5403043E */ clrlwi r3, r0, 0x10
/* 00008374 4BFF7DED */ bl SoundOff
/* 00008378 3800FFFF */ li r0, -1
/* 0000837C 901E0000 */ stw r0, 0(r30)
lbl_00008380:
/* 00008380 80610030 */ lwz r3, 0x30(r1)
/* 00008384 48000338 */ b lbl_000086BC
lbl_00008388:
/* 00008388 387D001C */ addi r3, r29, 0x1c
/* 0000838C C0A10038 */ lfs f5, 0x38(r1)
/* 00008390 C0430000 */ lfs f2, 0(r3)
/* 00008394 C081003C */ lfs f4, 0x3c(r1)
/* 00008398 C0230004 */ lfs f1, 4(r3)
/* 0000839C C0610040 */ lfs f3, 0x40(r1)
/* 000083A0 C0030008 */ lfs f0, 8(r3)
/* 000083A4 ECA500B2 */ fmuls f5, f5, f2
/* 000083A8 ECA4287A */ fmadds f5, f4, f1, f5
/* 000083AC ECA3283A */ fmadds f5, f3, f0, f5
/* 000083B0 C0410038 */ lfs f2, 0x38(r1)
/* 000083B4 C021003C */ lfs f1, 0x3c(r1)
/* 000083B8 C0010040 */ lfs f0, 0x40(r1)
/* 000083BC EC820172 */ fmuls f4, f2, f5
/* 000083C0 EC610172 */ fmuls f3, f1, f5
/* 000083C4 C0210034 */ lfs f1, 0x34(r1)
/* 000083C8 EC400172 */ fmuls f2, f0, f5
/* 000083CC D0810024 */ stfs f4, 0x24(r1)
/* 000083D0 FC002A10 */ fabs f0, f5
/* 000083D4 D0610028 */ stfs f3, 0x28(r1)
/* 000083D8 D041002C */ stfs f2, 0x2c(r1)
/* 000083DC C05D001C */ lfs f2, 0x1c(r29)
/* 000083E0 C0C10024 */ lfs f6, 0x24(r1)
/* 000083E4 C0610028 */ lfs f3, 0x28(r1)
/* 000083E8 EC823028 */ fsubs f4, f2, f6
/* 000083EC C041002C */ lfs f2, 0x2c(r1)
/* 000083F0 D0810018 */ stfs f4, 0x18(r1)
/* 000083F4 C09D0020 */ lfs f4, 0x20(r29)
/* 000083F8 EC641828 */ fsubs f3, f4, f3
/* 000083FC D061001C */ stfs f3, 0x1c(r1)
/* 00008400 C07D0024 */ lfs f3, 0x24(r29)
/* 00008404 EC431028 */ fsubs f2, f3, f2
/* 00008408 D0410020 */ stfs f2, 0x20(r1)
/* 0000840C C05D0070 */ lfs f2, 0x70(r29)
/* 00008410 C8BF0080 */ lfd f5, 0x80(r31)
/* 00008414 EC820072 */ fmuls f4, f2, f1
/* 00008418 C05F0088 */ lfs f2, 0x88(r31)
/* 0000841C C0210018 */ lfs f1, 0x18(r1)
/* 00008420 C07D001C */ lfs f3, 0x1c(r29)
/* 00008424 FCA52028 */ fsub f5, f5, f4
/* 00008428 EC220072 */ fmuls f1, f2, f1
/* 0000842C FCA02818 */ frsp f5, f5
/* 00008430 EC4501B2 */ fmuls f2, f5, f6
/* 00008434 EC220828 */ fsubs f1, f2, f1
/* 00008438 EC23082A */ fadds f1, f3, f1
/* 0000843C D03D001C */ stfs f1, 0x1c(r29)
/* 00008440 C0610028 */ lfs f3, 0x28(r1)
/* 00008444 C05F0088 */ lfs f2, 0x88(r31)
/* 00008448 C021001C */ lfs f1, 0x1c(r1)
/* 0000844C EC6500F2 */ fmuls f3, f5, f3
/* 00008450 C09D0020 */ lfs f4, 0x20(r29)
/* 00008454 EC220072 */ fmuls f1, f2, f1
/* 00008458 EC230828 */ fsubs f1, f3, f1
/* 0000845C EC24082A */ fadds f1, f4, f1
/* 00008460 D03D0020 */ stfs f1, 0x20(r29)
/* 00008464 C061002C */ lfs f3, 0x2c(r1)
/* 00008468 C05F0088 */ lfs f2, 0x88(r31)
/* 0000846C C0210020 */ lfs f1, 0x20(r1)
/* 00008470 EC6500F2 */ fmuls f3, f5, f3
/* 00008474 C09D0024 */ lfs f4, 0x24(r29)
/* 00008478 EC220072 */ fmuls f1, f2, f1
/* 0000847C EC230828 */ fsubs f1, f3, f1
/* 00008480 EC24082A */ fadds f1, f4, f1
/* 00008484 D03D0024 */ stfs f1, 0x24(r29)
/* 00008488 C83F0090 */ lfd f1, 0x90(r31)
/* 0000848C FC000840 */ fcmpo cr0, f0, f1
/* 00008490 40800008 */ bge lbl_00008498
/* 00008494 48000008 */ b lbl_0000849C
lbl_00008498:
/* 00008498 FC000890 */ fmr f0, f1
lbl_0000849C:
/* 0000849C FFC00018 */ frsp f30, f0
/* 000084A0 C81F0098 */ lfd f0, 0x98(r31)
/* 000084A4 FC1E0040 */ fcmpo cr0, f30, f0
/* 000084A8 40810040 */ ble lbl_000084E8
/* 000084AC 801E0000 */ lwz r0, 0(r30)
/* 000084B0 2C00FFFF */ cmpwi r0, -1
/* 000084B4 40820034 */ bne lbl_000084E8
/* 000084B8 80010030 */ lwz r0, 0x30(r1)
/* 000084BC 2C000000 */ cmpwi r0, 0
/* 000084C0 4182001C */ beq lbl_000084DC
/* 000084C4 2C000001 */ cmpwi r0, 1
/* 000084C8 41820014 */ beq lbl_000084DC
/* 000084CC 2C000008 */ cmpwi r0, 8
/* 000084D0 4182000C */ beq lbl_000084DC
/* 000084D4 2C000009 */ cmpwi r0, 9
/* 000084D8 40820010 */ bne lbl_000084E8
lbl_000084DC:
/* 000084DC 3C600001 */ lis r3, 1
/* 000084E0 3863A09B */ addi r3, r3, -24421  ;# fixed addi
/* 000084E4 4BFF7C7D */ bl g_play_sound
lbl_000084E8:
/* 000084E8 C81F00A0 */ lfd f0, 0xa0(r31)
/* 000084EC FC1E0040 */ fcmpo cr0, f30, f0
/* 000084F0 408100E4 */ ble lbl_000085D4
/* 000084F4 801E0000 */ lwz r0, 0(r30)
/* 000084F8 2C00FFFF */ cmpwi r0, -1
/* 000084FC 408200D8 */ bne lbl_000085D4
/* 00008500 FC7E0028 */ fsub f3, f30, f0
/* 00008504 C81F00A8 */ lfd f0, 0xa8(r31)
/* 00008508 C03F00B4 */ lfs f1, 0xb4(r31)
/* 0000850C C05F00B0 */ lfs f2, 0xb0(r31)
/* 00008510 FC630024 */ fdiv f3, f3, f0
/* 00008514 C01F00B8 */ lfs f0, 0xb8(r31)
/* 00008518 FC601818 */ frsp f3, f3
/* 0000851C EC2100F2 */ fmuls f1, f1, f3
/* 00008520 EC6000F2 */ fmuls f3, f0, f3
/* 00008524 EC22082A */ fadds f1, f2, f1
/* 00008528 FC030040 */ fcmpo cr0, f3, f0
/* 0000852C FC20081E */ fctiwz f1, f1
/* 00008530 D8210048 */ stfd f1, 0x48(r1)
/* 00008534 8001004C */ lwz r0, 0x4c(r1)
/* 00008538 40800008 */ bge lbl_00008540
/* 0000853C 48000008 */ b lbl_00008544
lbl_00008540:
/* 00008540 FC600090 */ fmr f3, f0
lbl_00008544:
/* 00008544 FC00181E */ fctiwz f0, f3
/* 00008548 54005BA8 */ rlwinm r0, r0, 0xb, 0xe, 0x14
/* 0000854C 60030099 */ ori r3, r0, 0x99
/* 00008550 D8010048 */ stfd f0, 0x48(r1)
/* 00008554 8381004C */ lwz r28, 0x4c(r1)
/* 00008558 4BFF7C09 */ bl g_play_sound
/* 0000855C 881D0148 */ lbz r0, 0x148(r29)
/* 00008560 28000004 */ cmplwi r0, 4
/* 00008564 4182003C */ beq lbl_000085A0
/* 00008568 C81F00C0 */ lfd f0, 0xc0(r31)
/* 0000856C FC1E0040 */ fcmpo cr0, f30, f0
/* 00008570 40810010 */ ble lbl_00008580
/* 00008574 3860001A */ li r3, 0x1a
/* 00008578 4BFF7BE9 */ bl g_play_sound
/* 0000857C 48000024 */ b lbl_000085A0
lbl_00008580:
/* 00008580 C81F00C8 */ lfd f0, 0xc8(r31)
/* 00008584 FC1E0040 */ fcmpo cr0, f30, f0
/* 00008588 40810010 */ ble lbl_00008598
/* 0000858C 38600018 */ li r3, 0x18
/* 00008590 4BFF7BD1 */ bl g_play_sound
/* 00008594 4800000C */ b lbl_000085A0
lbl_00008598:
/* 00008598 38600017 */ li r3, 0x17
/* 0000859C 4BFF7BC5 */ bl g_play_sound
lbl_000085A0:
/* 000085A0 2C1C0002 */ cmpwi r28, 2
/* 000085A4 41800030 */ blt lbl_000085D4
/* 000085A8 3C600000 */ lis r3, modeCtrl@ha
/* 000085AC 38630000 */ addi r3, r3, modeCtrl@l
/* 000085B0 8083002C */ lwz r4, 0x2c(r3)
/* 000085B4 3C600000 */ lis r3, lbl_80206BD0@ha
/* 000085B8 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 000085BC 5483103A */ slwi r3, r4, 2
/* 000085C0 7C601A14 */ add r3, r0, r3
/* 000085C4 80630000 */ lwz r3, 0(r3)
/* 000085C8 38BC0000 */ addi r5, r28, 0
/* 000085CC 38800001 */ li r4, 1
/* 000085D0 4BFF7B91 */ bl func_800B60F4
lbl_000085D4:
/* 000085D4 801E0000 */ lwz r0, 0(r30)
/* 000085D8 2C00FFFF */ cmpwi r0, -1
/* 000085DC 40820014 */ bne lbl_000085F0
/* 000085E0 3860009A */ li r3, 0x9a
/* 000085E4 4BFF7B7D */ bl func_8002B610
/* 000085E8 907E0000 */ stw r3, 0(r30)
/* 000085EC 4800006C */ b lbl_00008658
lbl_000085F0:
/* 000085F0 3B9D001C */ addi r28, r29, 0x1c
/* 000085F4 C03C0000 */ lfs f1, 0(r28)
/* 000085F8 C05C0004 */ lfs f2, 4(r28)
/* 000085FC C01C0008 */ lfs f0, 8(r28)
/* 00008600 EC210072 */ fmuls f1, f1, f1
/* 00008604 EC2208BA */ fmadds f1, f2, f2, f1
/* 00008608 EC20083A */ fmadds f1, f0, f0, f1
/* 0000860C 4BFF7B55 */ bl mathutil_sqrt
/* 00008610 C81F00D0 */ lfd f0, 0xd0(r31)
/* 00008614 FC010040 */ fcmpo cr0, f1, f0
/* 00008618 40800010 */ bge lbl_00008628
/* 0000861C 7F83E378 */ mr r3, r28
/* 00008620 480000C5 */ bl lbl_000086E4
/* 00008624 48000008 */ b lbl_0000862C
lbl_00008628:
/* 00008628 FC200090 */ fmr f1, f0
lbl_0000862C:
/* 0000862C FC400818 */ frsp f2, f1
/* 00008630 C03F00D8 */ lfs f1, 0xd8(r31)
/* 00008634 801E0000 */ lwz r0, 0(r30)
/* 00008638 C81F00D0 */ lfd f0, 0xd0(r31)
/* 0000863C EC2100B2 */ fmuls f1, f1, f2
/* 00008640 5403043E */ clrlwi r3, r0, 0x10
/* 00008644 FC010024 */ fdiv f0, f1, f0
/* 00008648 FC00001E */ fctiwz f0, f0
/* 0000864C D8010048 */ stfd f0, 0x48(r1)
/* 00008650 8081004C */ lwz r4, 0x4c(r1)
/* 00008654 4BFF7B0D */ bl func_8002C100
lbl_00008658:
/* 00008658 C0010038 */ lfs f0, 0x38(r1)
/* 0000865C C021003C */ lfs f1, 0x3c(r1)
/* 00008660 EC4007F2 */ fmuls f2, f0, f31
/* 00008664 C0010040 */ lfs f0, 0x40(r1)
/* 00008668 EC2107F2 */ fmuls f1, f1, f31
/* 0000866C EC0007F2 */ fmuls f0, f0, f31
/* 00008670 D041000C */ stfs f2, 0xc(r1)
/* 00008674 D0210010 */ stfs f1, 0x10(r1)
/* 00008678 D0010014 */ stfs f0, 0x14(r1)
/* 0000867C C021000C */ lfs f1, 0xc(r1)
/* 00008680 C01D0004 */ lfs f0, 4(r29)
/* 00008684 EC01002A */ fadds f0, f1, f0
/* 00008688 D01D0004 */ stfs f0, 4(r29)
/* 0000868C C0210010 */ lfs f1, 0x10(r1)
/* 00008690 C01D0008 */ lfs f0, 8(r29)
/* 00008694 EC01002A */ fadds f0, f1, f0
/* 00008698 D01D0008 */ stfs f0, 8(r29)
/* 0000869C C0210014 */ lfs f1, 0x14(r1)
/* 000086A0 C01D000C */ lfs f0, 0xc(r29)
/* 000086A4 EC01002A */ fadds f0, f1, f0
/* 000086A8 D01D000C */ stfs f0, 0xc(r29)
/* 000086AC 801D0094 */ lwz r0, 0x94(r29)
/* 000086B0 60000001 */ ori r0, r0, 1
/* 000086B4 901D0094 */ stw r0, 0x94(r29)
/* 000086B8 80610030 */ lwz r3, 0x30(r1)
lbl_000086BC:
/* 000086BC 80010074 */ lwz r0, 0x74(r1)
/* 000086C0 CBE10068 */ lfd f31, 0x68(r1)
/* 000086C4 CBC10060 */ lfd f30, 0x60(r1)
/* 000086C8 7C0803A6 */ mtlr r0
/* 000086CC 83E1005C */ lwz r31, 0x5c(r1)
/* 000086D0 83C10058 */ lwz r30, 0x58(r1)
/* 000086D4 83A10054 */ lwz r29, 0x54(r1)
/* 000086D8 83810050 */ lwz r28, 0x50(r1)
/* 000086DC 38210070 */ addi r1, r1, 0x70
/* 000086E0 4E800020 */ blr 
lbl_000086E4:
/* 000086E4 7C0802A6 */ mflr r0
/* 000086E8 90010004 */ stw r0, 4(r1)
/* 000086EC 9421FFF8 */ stwu r1, -8(r1)
/* 000086F0 C0030000 */ lfs f0, 0(r3)
/* 000086F4 C0430004 */ lfs f2, 4(r3)
/* 000086F8 C0630008 */ lfs f3, 8(r3)
/* 000086FC EC200032 */ fmuls f1, f0, f0
/* 00008700 EC2208BA */ fmadds f1, f2, f2, f1
/* 00008704 EC2308FA */ fmadds f1, f3, f3, f1
/* 00008708 4BFF7A59 */ bl mathutil_sqrt
/* 0000870C 8001000C */ lwz r0, 0xc(r1)
/* 00008710 38210008 */ addi r1, r1, 8
/* 00008714 7C0803A6 */ mtlr r0
/* 00008718 4E800020 */ blr 
lbl_0000871C:
/* 0000871C 7C0802A6 */ mflr r0
/* 00008720 3CA00000 */ lis r5, gamePauseStatus@ha
/* 00008724 90010004 */ stw r0, 4(r1)
/* 00008728 9421FFF8 */ stwu r1, -8(r1)
/* 0000872C 80050000 */ lwz r0, gamePauseStatus@l(r5)
/* 00008730 7000000A */ andi. r0, r0, 0xa
/* 00008734 40820088 */ bne lbl_000087BC
/* 00008738 8803001F */ lbz r0, 0x1f(r3)
/* 0000873C 7C000774 */ extsb r0, r0
/* 00008740 2800000B */ cmplwi r0, 0xb
/* 00008744 41810078 */ bgt lbl_000087BC
/* 00008748 3CA00000 */ lis r5, lbl_000153F4@ha
/* 0000874C 38A50000 */ addi r5, r5, lbl_000153F4@l
/* 00008750 5400103A */ slwi r0, r0, 2
/* 00008754 7C05002E */ lwzx r0, r5, r0
/* 00008758 7C0903A6 */ mtctr r0
/* 0000875C 4E800420 */ bctr 
lbl_00008760:
/* 00008760 4800029D */ bl lbl_000089FC
/* 00008764 48000058 */ b lbl_000087BC
lbl_00008768:
/* 00008768 48000425 */ bl lbl_00008B8C
/* 0000876C 48000050 */ b lbl_000087BC
lbl_00008770:
/* 00008770 480004F9 */ bl lbl_00008C68
/* 00008774 48000048 */ b lbl_000087BC
lbl_00008778:
/* 00008778 480005B5 */ bl lbl_00008D2C
/* 0000877C 48000040 */ b lbl_000087BC
lbl_00008780:
/* 00008780 48000671 */ bl lbl_00008DF0
/* 00008784 48000038 */ b lbl_000087BC
lbl_00008788:
/* 00008788 48000739 */ bl lbl_00008EC0
/* 0000878C 48000030 */ b lbl_000087BC
lbl_00008790:
/* 00008790 48000821 */ bl lbl_00008FB0
/* 00008794 48000028 */ b lbl_000087BC
lbl_00008798:
/* 00008798 480008B1 */ bl lbl_00009048
/* 0000879C 48000020 */ b lbl_000087BC
lbl_000087A0:
/* 000087A0 4800092D */ bl lbl_000090CC
/* 000087A4 48000018 */ b lbl_000087BC
lbl_000087A8:
/* 000087A8 4800098D */ bl lbl_00009134
/* 000087AC 48000010 */ b lbl_000087BC
lbl_000087B0:
/* 000087B0 480009ED */ bl lbl_0000919C
/* 000087B4 48000008 */ b lbl_000087BC
lbl_000087B8:
/* 000087B8 48000A79 */ bl lbl_00009230
lbl_000087BC:
/* 000087BC 8001000C */ lwz r0, 0xc(r1)
/* 000087C0 38210008 */ addi r1, r1, 8
/* 000087C4 7C0803A6 */ mtlr r0
/* 000087C8 4E800020 */ blr 
lbl_000087CC:
/* 000087CC 7C0802A6 */ mflr r0
/* 000087D0 90010004 */ stw r0, 4(r1)
/* 000087D4 9421FF98 */ stwu r1, -0x68(r1)
/* 000087D8 DBE10060 */ stfd f31, 0x60(r1)
/* 000087DC FFE00890 */ fmr f31, f1
/* 000087E0 93E1005C */ stw r31, 0x5c(r1)
/* 000087E4 7C7F1B78 */ mr r31, r3
/* 000087E8 93C10058 */ stw r30, 0x58(r1)
/* 000087EC 7CDE3378 */ mr r30, r6
/* 000087F0 80630000 */ lwz r3, 0(r3)
/* 000087F4 801F0004 */ lwz r0, 4(r31)
/* 000087F8 90610034 */ stw r3, 0x34(r1)
/* 000087FC 90010038 */ stw r0, 0x38(r1)
/* 00008800 801F0008 */ lwz r0, 8(r31)
/* 00008804 9001003C */ stw r0, 0x3c(r1)
/* 00008808 807F000C */ lwz r3, 0xc(r31)
/* 0000880C 801F0010 */ lwz r0, 0x10(r31)
/* 00008810 90610028 */ stw r3, 0x28(r1)
/* 00008814 9001002C */ stw r0, 0x2c(r1)
/* 00008818 801F0014 */ lwz r0, 0x14(r31)
/* 0000881C 90010030 */ stw r0, 0x30(r1)
/* 00008820 C03F0000 */ lfs f1, 0(r31)
/* 00008824 C0040000 */ lfs f0, 0(r4)
/* 00008828 EC000828 */ fsubs f0, f0, f1
/* 0000882C EC1F0032 */ fmuls f0, f31, f0
/* 00008830 EC01002A */ fadds f0, f1, f0
/* 00008834 D01F0000 */ stfs f0, 0(r31)
/* 00008838 C03F0004 */ lfs f1, 4(r31)
/* 0000883C C0040004 */ lfs f0, 4(r4)
/* 00008840 EC000828 */ fsubs f0, f0, f1
/* 00008844 EC1F0032 */ fmuls f0, f31, f0
/* 00008848 EC01002A */ fadds f0, f1, f0
/* 0000884C D01F0004 */ stfs f0, 4(r31)
/* 00008850 C03F0008 */ lfs f1, 8(r31)
/* 00008854 C0040008 */ lfs f0, 8(r4)
/* 00008858 EC000828 */ fsubs f0, f0, f1
/* 0000885C EC1F0032 */ fmuls f0, f31, f0
/* 00008860 EC01002A */ fadds f0, f1, f0
/* 00008864 D01F0008 */ stfs f0, 8(r31)
/* 00008868 C03F000C */ lfs f1, 0xc(r31)
/* 0000886C C0050000 */ lfs f0, 0(r5)
/* 00008870 EC000828 */ fsubs f0, f0, f1
/* 00008874 EC1F0032 */ fmuls f0, f31, f0
/* 00008878 EC01002A */ fadds f0, f1, f0
/* 0000887C D01F000C */ stfs f0, 0xc(r31)
/* 00008880 C03F0010 */ lfs f1, 0x10(r31)
/* 00008884 C0050004 */ lfs f0, 4(r5)
/* 00008888 EC000828 */ fsubs f0, f0, f1
/* 0000888C EC1F0032 */ fmuls f0, f31, f0
/* 00008890 EC01002A */ fadds f0, f1, f0
/* 00008894 D01F0010 */ stfs f0, 0x10(r31)
/* 00008898 C03F0014 */ lfs f1, 0x14(r31)
/* 0000889C C0050008 */ lfs f0, 8(r5)
/* 000088A0 EC000828 */ fsubs f0, f0, f1
/* 000088A4 EC1F0032 */ fmuls f0, f31, f0
/* 000088A8 EC01002A */ fadds f0, f1, f0
/* 000088AC D01F0014 */ stfs f0, 0x14(r31)
/* 000088B0 C03F000C */ lfs f1, 0xc(r31)
/* 000088B4 C01F0000 */ lfs f0, 0(r31)
/* 000088B8 EC010028 */ fsubs f0, f1, f0
/* 000088BC D001001C */ stfs f0, 0x1c(r1)
/* 000088C0 C03F0010 */ lfs f1, 0x10(r31)
/* 000088C4 C01F0004 */ lfs f0, 4(r31)
/* 000088C8 EC010028 */ fsubs f0, f1, f0
/* 000088CC D0010020 */ stfs f0, 0x20(r1)
/* 000088D0 C03F0014 */ lfs f1, 0x14(r31)
/* 000088D4 C01F0008 */ lfs f0, 8(r31)
/* 000088D8 EC010028 */ fsubs f0, f1, f0
/* 000088DC D0010024 */ stfs f0, 0x24(r1)
/* 000088E0 C021001C */ lfs f1, 0x1c(r1)
/* 000088E4 C0410024 */ lfs f2, 0x24(r1)
/* 000088E8 4BFF7879 */ bl mathutil_atan2
/* 000088EC 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 000088F0 B01F001A */ sth r0, 0x1a(r31)
/* 000088F4 C0010024 */ lfs f0, 0x24(r1)
/* 000088F8 C021001C */ lfs f1, 0x1c(r1)
/* 000088FC EC210072 */ fmuls f1, f1, f1
/* 00008900 EC20083A */ fmadds f1, f0, f0, f1
/* 00008904 4BFF785D */ bl mathutil_sqrt
/* 00008908 FC400890 */ fmr f2, f1
/* 0000890C C0210020 */ lfs f1, 0x20(r1)
/* 00008910 4BFF7851 */ bl mathutil_atan2
/* 00008914 B07F0018 */ sth r3, 0x18(r31)
/* 00008918 38000000 */ li r0, 0
/* 0000891C 3C600000 */ lis r3, lbl_00011338@ha
/* 00008920 B01F001C */ sth r0, 0x1c(r31)
/* 00008924 3C800000 */ lis r4, lbl_00011338@ha
/* 00008928 7FC00734 */ extsh r0, r30
/* 0000892C A8BF0030 */ lha r5, 0x30(r31)
/* 00008930 C8230000 */ lfd f1, lbl_00011338@l(r3)
/* 00008934 7C050050 */ subf r0, r5, r0
/* 00008938 C8440000 */ lfd f2, lbl_00011338@l(r4)
/* 0000893C 6C008000 */ xoris r0, r0, 0x8000
/* 00008940 9001004C */ stw r0, 0x4c(r1)
/* 00008944 3C004330 */ lis r0, 0x4330
/* 00008948 6CA38000 */ xoris r3, r5, 0x8000
/* 0000894C 90010048 */ stw r0, 0x48(r1)
/* 00008950 90610054 */ stw r3, 0x54(r1)
/* 00008954 C8010048 */ lfd f0, 0x48(r1)
/* 00008958 90010050 */ stw r0, 0x50(r1)
/* 0000895C EC000828 */ fsubs f0, f0, f1
/* 00008960 C8210050 */ lfd f1, 0x50(r1)
/* 00008964 EC211028 */ fsubs f1, f1, f2
/* 00008968 EC1F0032 */ fmuls f0, f31, f0
/* 0000896C EC01002A */ fadds f0, f1, f0
/* 00008970 FC00001E */ fctiwz f0, f0
/* 00008974 D8010040 */ stfd f0, 0x40(r1)
/* 00008978 80010044 */ lwz r0, 0x44(r1)
/* 0000897C B01F0030 */ sth r0, 0x30(r31)
/* 00008980 C03F0000 */ lfs f1, 0(r31)
/* 00008984 C0010034 */ lfs f0, 0x34(r1)
/* 00008988 EC010028 */ fsubs f0, f1, f0
/* 0000898C D01F0094 */ stfs f0, 0x94(r31)
/* 00008990 C03F0004 */ lfs f1, 4(r31)
/* 00008994 C0010038 */ lfs f0, 0x38(r1)
/* 00008998 EC010028 */ fsubs f0, f1, f0
/* 0000899C D01F0098 */ stfs f0, 0x98(r31)
/* 000089A0 C03F0008 */ lfs f1, 8(r31)
/* 000089A4 C001003C */ lfs f0, 0x3c(r1)
/* 000089A8 EC010028 */ fsubs f0, f1, f0
/* 000089AC D01F009C */ stfs f0, 0x9c(r31)
/* 000089B0 C03F000C */ lfs f1, 0xc(r31)
/* 000089B4 C0010028 */ lfs f0, 0x28(r1)
/* 000089B8 EC010028 */ fsubs f0, f1, f0
/* 000089BC D01F00A0 */ stfs f0, 0xa0(r31)
/* 000089C0 C03F0010 */ lfs f1, 0x10(r31)
/* 000089C4 C001002C */ lfs f0, 0x2c(r1)
/* 000089C8 EC010028 */ fsubs f0, f1, f0
/* 000089CC D01F00A4 */ stfs f0, 0xa4(r31)
/* 000089D0 C03F0014 */ lfs f1, 0x14(r31)
/* 000089D4 C0010030 */ lfs f0, 0x30(r1)
/* 000089D8 EC010028 */ fsubs f0, f1, f0
/* 000089DC D01F00A8 */ stfs f0, 0xa8(r31)
/* 000089E0 8001006C */ lwz r0, 0x6c(r1)
/* 000089E4 CBE10060 */ lfd f31, 0x60(r1)
/* 000089E8 83E1005C */ lwz r31, 0x5c(r1)
/* 000089EC 7C0803A6 */ mtlr r0
/* 000089F0 83C10058 */ lwz r30, 0x58(r1)
/* 000089F4 38210068 */ addi r1, r1, 0x68
/* 000089F8 4E800020 */ blr 
lbl_000089FC:
/* 000089FC 7C0802A6 */ mflr r0
/* 00008A00 3CA00000 */ lis r5, lbl_00011338@ha
/* 00008A04 90010004 */ stw r0, 4(r1)
/* 00008A08 9421FFD0 */ stwu r1, -0x30(r1)
/* 00008A0C 93E1002C */ stw r31, 0x2c(r1)
/* 00008A10 3BE40000 */ addi r31, r4, 0
/* 00008A14 93C10028 */ stw r30, 0x28(r1)
/* 00008A18 3BC30000 */ addi r30, r3, 0
/* 00008A1C 93A10024 */ stw r29, 0x24(r1)
/* 00008A20 3BA50000 */ addi r29, r5, lbl_00011338@l
/* 00008A24 4BFF773D */ bl camera_clear
/* 00008A28 80BF0004 */ lwz r5, 4(r31)
/* 00008A2C 3C600000 */ lis r3, lbl_000153E8@ha
/* 00008A30 801F0008 */ lwz r0, 8(r31)
/* 00008A34 38830000 */ addi r4, r3, lbl_000153E8@l
/* 00008A38 90BE00AC */ stw r5, 0xac(r30)
/* 00008A3C 901E00B0 */ stw r0, 0xb0(r30)
/* 00008A40 801F000C */ lwz r0, 0xc(r31)
/* 00008A44 901E00B4 */ stw r0, 0xb4(r30)
/* 00008A48 807F0004 */ lwz r3, 4(r31)
/* 00008A4C 801F0008 */ lwz r0, 8(r31)
/* 00008A50 907E0000 */ stw r3, 0(r30)
/* 00008A54 901E0004 */ stw r0, 4(r30)
/* 00008A58 801F000C */ lwz r0, 0xc(r31)
/* 00008A5C 901E0008 */ stw r0, 8(r30)
/* 00008A60 80640000 */ lwz r3, 0(r4)
/* 00008A64 80040004 */ lwz r0, 4(r4)
/* 00008A68 907E000C */ stw r3, 0xc(r30)
/* 00008A6C 901E0010 */ stw r0, 0x10(r30)
/* 00008A70 80040008 */ lwz r0, 8(r4)
/* 00008A74 901E0014 */ stw r0, 0x14(r30)
/* 00008A78 C01D0008 */ lfs f0, 8(r29)
/* 00008A7C D01E0094 */ stfs f0, 0x94(r30)
/* 00008A80 C01D0008 */ lfs f0, 8(r29)
/* 00008A84 D01E0098 */ stfs f0, 0x98(r30)
/* 00008A88 C01D0008 */ lfs f0, 8(r29)
/* 00008A8C D01E009C */ stfs f0, 0x9c(r30)
/* 00008A90 C01D0008 */ lfs f0, 8(r29)
/* 00008A94 D01E00A0 */ stfs f0, 0xa0(r30)
/* 00008A98 C01D0008 */ lfs f0, 8(r29)
/* 00008A9C D01E00A4 */ stfs f0, 0xa4(r30)
/* 00008AA0 C01D0008 */ lfs f0, 8(r29)
/* 00008AA4 D01E00A8 */ stfs f0, 0xa8(r30)
/* 00008AA8 C03E000C */ lfs f1, 0xc(r30)
/* 00008AAC C01E0000 */ lfs f0, 0(r30)
/* 00008AB0 EC010028 */ fsubs f0, f1, f0
/* 00008AB4 D0010010 */ stfs f0, 0x10(r1)
/* 00008AB8 C03E0010 */ lfs f1, 0x10(r30)
/* 00008ABC C01E0004 */ lfs f0, 4(r30)
/* 00008AC0 EC010028 */ fsubs f0, f1, f0
/* 00008AC4 D0010014 */ stfs f0, 0x14(r1)
/* 00008AC8 C03E0014 */ lfs f1, 0x14(r30)
/* 00008ACC C01E0008 */ lfs f0, 8(r30)
/* 00008AD0 EC010028 */ fsubs f0, f1, f0
/* 00008AD4 D0010018 */ stfs f0, 0x18(r1)
/* 00008AD8 C0210010 */ lfs f1, 0x10(r1)
/* 00008ADC C0410018 */ lfs f2, 0x18(r1)
/* 00008AE0 4BFF7681 */ bl mathutil_atan2
/* 00008AE4 38038000 */ addi r0, r3, -32768  ;# fixed addi
/* 00008AE8 B01E001A */ sth r0, 0x1a(r30)
/* 00008AEC C0010018 */ lfs f0, 0x18(r1)
/* 00008AF0 C0210010 */ lfs f1, 0x10(r1)
/* 00008AF4 EC210072 */ fmuls f1, f1, f1
/* 00008AF8 EC20083A */ fmadds f1, f0, f0, f1
/* 00008AFC 4BFF7665 */ bl mathutil_sqrt
/* 00008B00 FC400890 */ fmr f2, f1
/* 00008B04 C0210014 */ lfs f1, 0x14(r1)
/* 00008B08 4BFF7659 */ bl mathutil_atan2
/* 00008B0C B07E0018 */ sth r3, 0x18(r30)
/* 00008B10 38000000 */ li r0, 0
/* 00008B14 3C600000 */ lis r3, cameraInfo@ha
/* 00008B18 B01E001C */ sth r0, 0x1c(r30)
/* 00008B1C 38000009 */ li r0, 9
/* 00008B20 38801300 */ li r4, 0x1300
/* 00008B24 981E0026 */ stb r0, 0x26(r30)
/* 00008B28 38A30000 */ addi r5, r3, cameraInfo@l
/* 00008B2C 38000002 */ li r0, 2
/* 00008B30 B09E0030 */ sth r4, 0x30(r30)
/* 00008B34 887F002E */ lbz r3, 0x2e(r31)
/* 00008B38 7C630774 */ extsb r3, r3
/* 00008B3C 1C630284 */ mulli r3, r3, 0x284
/* 00008B40 7C851A14 */ add r4, r5, r3
/* 00008B44 A8640024 */ lha r3, 0x24(r4)
/* 00008B48 546307B8 */ rlwinm r3, r3, 0, 0x1e, 0x1c
/* 00008B4C B0640024 */ sth r3, 0x24(r4)
/* 00008B50 887F002E */ lbz r3, 0x2e(r31)
/* 00008B54 7C630774 */ extsb r3, r3
/* 00008B58 1C630284 */ mulli r3, r3, 0x284
/* 00008B5C 7C851A14 */ add r4, r5, r3
/* 00008B60 A8640024 */ lha r3, 0x24(r4)
/* 00008B64 60630008 */ ori r3, r3, 8
/* 00008B68 B0640024 */ sth r3, 0x24(r4)
/* 00008B6C 981E001F */ stb r0, 0x1f(r30)
/* 00008B70 80010034 */ lwz r0, 0x34(r1)
/* 00008B74 83E1002C */ lwz r31, 0x2c(r1)
/* 00008B78 83C10028 */ lwz r30, 0x28(r1)
/* 00008B7C 83A10024 */ lwz r29, 0x24(r1)
/* 00008B80 38210030 */ addi r1, r1, 0x30
/* 00008B84 7C0803A6 */ mtlr r0
/* 00008B88 4E800020 */ blr 
lbl_00008B8C:
/* 00008B8C 7C0802A6 */ mflr r0
/* 00008B90 3CA00000 */ lis r5, lbl_00011338@ha
/* 00008B94 90010004 */ stw r0, 4(r1)
/* 00008B98 38A50000 */ addi r5, r5, lbl_00011338@l
/* 00008B9C 9421FFE0 */ stwu r1, -0x20(r1)
/* 00008BA0 C0040004 */ lfs f0, 4(r4)
/* 00008BA4 C8250010 */ lfd f1, 0x10(r5)
/* 00008BA8 FC010032 */ fmul f0, f1, f0
/* 00008BAC FC000018 */ frsp f0, f0
/* 00008BB0 D0010010 */ stfs f0, 0x10(r1)
/* 00008BB4 C0050018 */ lfs f0, 0x18(r5)
/* 00008BB8 D0010014 */ stfs f0, 0x14(r1)
/* 00008BBC C0040024 */ lfs f0, 0x24(r4)
/* 00008BC0 C8450020 */ lfd f2, 0x20(r5)
/* 00008BC4 FC200050 */ fneg f1, f0
/* 00008BC8 C8050028 */ lfd f0, 0x28(r5)
/* 00008BCC FC420824 */ fdiv f2, f2, f1
/* 00008BD0 FC020040 */ fcmpo cr0, f2, f0
/* 00008BD4 40800008 */ bge lbl_00008BDC
/* 00008BD8 48000008 */ b lbl_00008BE0
lbl_00008BDC:
/* 00008BDC FC400090 */ fmr f2, f0
lbl_00008BE0:
/* 00008BE0 C8250020 */ lfd f1, 0x20(r5)
/* 00008BE4 C004000C */ lfs f0, 0xc(r4)
/* 00008BE8 FC01002A */ fadd f0, f1, f0
/* 00008BEC FC00102A */ fadd f0, f0, f2
/* 00008BF0 FC000018 */ frsp f0, f0
/* 00008BF4 D0010018 */ stfs f0, 0x18(r1)
/* 00008BF8 C0210018 */ lfs f1, 0x18(r1)
/* 00008BFC C8050030 */ lfd f0, 0x30(r5)
/* 00008C00 FC010040 */ fcmpo cr0, f1, f0
/* 00008C04 4080000C */ bge lbl_00008C10
/* 00008C08 C0050038 */ lfs f0, 0x38(r5)
/* 00008C0C D0010018 */ stfs f0, 0x18(r1)
lbl_00008C10:
/* 00008C10 C0210010 */ lfs f1, 0x10(r1)
/* 00008C14 C8050040 */ lfd f0, 0x40(r5)
/* 00008C18 FC010040 */ fcmpo cr0, f1, f0
/* 00008C1C 4080000C */ bge lbl_00008C28
/* 00008C20 C0050048 */ lfs f0, 0x48(r5)
/* 00008C24 D0010010 */ stfs f0, 0x10(r1)
lbl_00008C28:
/* 00008C28 C0210010 */ lfs f1, 0x10(r1)
/* 00008C2C C8050050 */ lfd f0, 0x50(r5)
/* 00008C30 FC010040 */ fcmpo cr0, f1, f0
/* 00008C34 4081000C */ ble lbl_00008C40
/* 00008C38 C0050058 */ lfs f0, 0x58(r5)
/* 00008C3C D0010010 */ stfs f0, 0x10(r1)
lbl_00008C40:
/* 00008C40 3C800000 */ lis r4, lbl_000153E8@ha
/* 00008C44 C025005C */ lfs f1, 0x5c(r5)
/* 00008C48 38A40000 */ addi r5, r4, lbl_000153E8@l
/* 00008C4C 38810010 */ addi r4, r1, 0x10
/* 00008C50 38C01800 */ li r6, 0x1800
/* 00008C54 4BFFFB79 */ bl lbl_000087CC
/* 00008C58 80010024 */ lwz r0, 0x24(r1)
/* 00008C5C 38210020 */ addi r1, r1, 0x20
/* 00008C60 7C0803A6 */ mtlr r0
/* 00008C64 4E800020 */ blr 
lbl_00008C68:
/* 00008C68 7C0802A6 */ mflr r0
/* 00008C6C 3CA00000 */ lis r5, lbl_00011338@ha
/* 00008C70 90010004 */ stw r0, 4(r1)
/* 00008C74 39050000 */ addi r8, r5, lbl_00011338@l
/* 00008C78 9421FFD8 */ stwu r1, -0x28(r1)
/* 00008C7C C0040004 */ lfs f0, 4(r4)
/* 00008C80 D001001C */ stfs f0, 0x1c(r1)
/* 00008C84 C0080060 */ lfs f0, 0x60(r8)
/* 00008C88 D0010020 */ stfs f0, 0x20(r1)
/* 00008C8C C8280068 */ lfd f1, 0x68(r8)
/* 00008C90 C004000C */ lfs f0, 0xc(r4)
/* 00008C94 FC01002A */ fadd f0, f1, f0
/* 00008C98 FC000018 */ frsp f0, f0
/* 00008C9C D0010024 */ stfs f0, 0x24(r1)
/* 00008CA0 C0210024 */ lfs f1, 0x24(r1)
/* 00008CA4 C8080030 */ lfd f0, 0x30(r8)
/* 00008CA8 FC010040 */ fcmpo cr0, f1, f0
/* 00008CAC 4080000C */ bge lbl_00008CB8
/* 00008CB0 C0080038 */ lfs f0, 0x38(r8)
/* 00008CB4 D0010024 */ stfs f0, 0x24(r1)
lbl_00008CB8:
/* 00008CB8 C021001C */ lfs f1, 0x1c(r1)
/* 00008CBC C8080040 */ lfd f0, 0x40(r8)
/* 00008CC0 FC010040 */ fcmpo cr0, f1, f0
/* 00008CC4 4080000C */ bge lbl_00008CD0
/* 00008CC8 C0080048 */ lfs f0, 0x48(r8)
/* 00008CCC D001001C */ stfs f0, 0x1c(r1)
lbl_00008CD0:
/* 00008CD0 C021001C */ lfs f1, 0x1c(r1)
/* 00008CD4 C8080050 */ lfd f0, 0x50(r8)
/* 00008CD8 FC010040 */ fcmpo cr0, f1, f0
/* 00008CDC 4081000C */ ble lbl_00008CE8
/* 00008CE0 C0080058 */ lfs f0, 0x58(r8)
/* 00008CE4 D001001C */ stfs f0, 0x1c(r1)
lbl_00008CE8:
/* 00008CE8 C0040004 */ lfs f0, 4(r4)
/* 00008CEC 3C800000 */ lis r4, lbl_000153E8@ha
/* 00008CF0 38E40000 */ addi r7, r4, lbl_000153E8@l
/* 00008CF4 D0010010 */ stfs f0, 0x10(r1)
/* 00008CF8 3881001C */ addi r4, r1, 0x1c
/* 00008CFC 38A10010 */ addi r5, r1, 0x10
/* 00008D00 C0080070 */ lfs f0, 0x70(r8)
/* 00008D04 38C01400 */ li r6, 0x1400
/* 00008D08 D0010014 */ stfs f0, 0x14(r1)
/* 00008D0C C0070008 */ lfs f0, 8(r7)
/* 00008D10 D0010018 */ stfs f0, 0x18(r1)
/* 00008D14 C028005C */ lfs f1, 0x5c(r8)
/* 00008D18 4BFFFAB5 */ bl lbl_000087CC
/* 00008D1C 8001002C */ lwz r0, 0x2c(r1)
/* 00008D20 38210028 */ addi r1, r1, 0x28
/* 00008D24 7C0803A6 */ mtlr r0
/* 00008D28 4E800020 */ blr 
lbl_00008D2C:
/* 00008D2C 7C0802A6 */ mflr r0
/* 00008D30 3CA00000 */ lis r5, lbl_000153E8@ha
/* 00008D34 90010004 */ stw r0, 4(r1)
/* 00008D38 39050000 */ addi r8, r5, lbl_000153E8@l
/* 00008D3C 9421FFD8 */ stwu r1, -0x28(r1)
/* 00008D40 C0040004 */ lfs f0, 4(r4)
/* 00008D44 3C800000 */ lis r4, lbl_00011338@ha
/* 00008D48 38E40000 */ addi r7, r4, lbl_00011338@l
/* 00008D4C D001001C */ stfs f0, 0x1c(r1)
/* 00008D50 C0070074 */ lfs f0, 0x74(r7)
/* 00008D54 D0010020 */ stfs f0, 0x20(r1)
/* 00008D58 C0070078 */ lfs f0, 0x78(r7)
/* 00008D5C D0010024 */ stfs f0, 0x24(r1)
/* 00008D60 C0210024 */ lfs f1, 0x24(r1)
/* 00008D64 C8070030 */ lfd f0, 0x30(r7)
/* 00008D68 FC010040 */ fcmpo cr0, f1, f0
/* 00008D6C 4080000C */ bge lbl_00008D78
/* 00008D70 C0070038 */ lfs f0, 0x38(r7)
/* 00008D74 D0010024 */ stfs f0, 0x24(r1)
lbl_00008D78:
/* 00008D78 C021001C */ lfs f1, 0x1c(r1)
/* 00008D7C C8070040 */ lfd f0, 0x40(r7)
/* 00008D80 FC010040 */ fcmpo cr0, f1, f0
/* 00008D84 4080000C */ bge lbl_00008D90
/* 00008D88 C0070048 */ lfs f0, 0x48(r7)
/* 00008D8C D001001C */ stfs f0, 0x1c(r1)
lbl_00008D90:
/* 00008D90 C021001C */ lfs f1, 0x1c(r1)
/* 00008D94 C8070050 */ lfd f0, 0x50(r7)
/* 00008D98 FC010040 */ fcmpo cr0, f1, f0
/* 00008D9C 4081000C */ ble lbl_00008DA8
/* 00008DA0 C0070058 */ lfs f0, 0x58(r7)
/* 00008DA4 D001001C */ stfs f0, 0x1c(r1)
lbl_00008DA8:
/* 00008DA8 C0080000 */ lfs f0, 0(r8)
/* 00008DAC 3881001C */ addi r4, r1, 0x1c
/* 00008DB0 38A10010 */ addi r5, r1, 0x10
/* 00008DB4 D0010010 */ stfs f0, 0x10(r1)
/* 00008DB8 38C01000 */ li r6, 0x1000
/* 00008DBC C0280004 */ lfs f1, 4(r8)
/* 00008DC0 C8070080 */ lfd f0, 0x80(r7)
/* 00008DC4 FC010028 */ fsub f0, f1, f0
/* 00008DC8 FC000018 */ frsp f0, f0
/* 00008DCC D0010014 */ stfs f0, 0x14(r1)
/* 00008DD0 C0080008 */ lfs f0, 8(r8)
/* 00008DD4 D0010018 */ stfs f0, 0x18(r1)
/* 00008DD8 C027005C */ lfs f1, 0x5c(r7)
/* 00008DDC 4BFFF9F1 */ bl lbl_000087CC
/* 00008DE0 8001002C */ lwz r0, 0x2c(r1)
/* 00008DE4 38210028 */ addi r1, r1, 0x28
/* 00008DE8 7C0803A6 */ mtlr r0
/* 00008DEC 4E800020 */ blr 
lbl_00008DF0:
/* 00008DF0 7C0802A6 */ mflr r0
/* 00008DF4 3CA00000 */ lis r5, lbl_00011338@ha
/* 00008DF8 90010004 */ stw r0, 4(r1)
/* 00008DFC 3CC00000 */ lis r6, lbl_000153E8@ha
/* 00008E00 38E50000 */ addi r7, r5, lbl_00011338@l
/* 00008E04 9421FFD8 */ stwu r1, -0x28(r1)
/* 00008E08 39060000 */ addi r8, r6, lbl_000153E8@l
/* 00008E0C C0040004 */ lfs f0, 4(r4)
/* 00008E10 D001001C */ stfs f0, 0x1c(r1)
/* 00008E14 C0070088 */ lfs f0, 0x88(r7)
/* 00008E18 D0010020 */ stfs f0, 0x20(r1)
/* 00008E1C C8270068 */ lfd f1, 0x68(r7)
/* 00008E20 C004000C */ lfs f0, 0xc(r4)
/* 00008E24 FC01002A */ fadd f0, f1, f0
/* 00008E28 FC000018 */ frsp f0, f0
/* 00008E2C D0010024 */ stfs f0, 0x24(r1)
/* 00008E30 C0210024 */ lfs f1, 0x24(r1)
/* 00008E34 C8070030 */ lfd f0, 0x30(r7)
/* 00008E38 FC010040 */ fcmpo cr0, f1, f0
/* 00008E3C 4080000C */ bge lbl_00008E48
/* 00008E40 C0070038 */ lfs f0, 0x38(r7)
/* 00008E44 D0010024 */ stfs f0, 0x24(r1)
lbl_00008E48:
/* 00008E48 C021001C */ lfs f1, 0x1c(r1)
/* 00008E4C C8070040 */ lfd f0, 0x40(r7)
/* 00008E50 FC010040 */ fcmpo cr0, f1, f0
/* 00008E54 4080000C */ bge lbl_00008E60
/* 00008E58 C0070048 */ lfs f0, 0x48(r7)
/* 00008E5C D001001C */ stfs f0, 0x1c(r1)
lbl_00008E60:
/* 00008E60 C021001C */ lfs f1, 0x1c(r1)
/* 00008E64 C8070050 */ lfd f0, 0x50(r7)
/* 00008E68 FC010040 */ fcmpo cr0, f1, f0
/* 00008E6C 4081000C */ ble lbl_00008E78
/* 00008E70 C0070058 */ lfs f0, 0x58(r7)
/* 00008E74 D001001C */ stfs f0, 0x1c(r1)
lbl_00008E78:
/* 00008E78 C0080000 */ lfs f0, 0(r8)
/* 00008E7C 3881001C */ addi r4, r1, 0x1c
/* 00008E80 38A10010 */ addi r5, r1, 0x10
/* 00008E84 D0010010 */ stfs f0, 0x10(r1)
/* 00008E88 38C01400 */ li r6, 0x1400
/* 00008E8C C0280004 */ lfs f1, 4(r8)
/* 00008E90 C8070090 */ lfd f0, 0x90(r7)
/* 00008E94 FC010028 */ fsub f0, f1, f0
/* 00008E98 FC000018 */ frsp f0, f0
/* 00008E9C D0010014 */ stfs f0, 0x14(r1)
/* 00008EA0 C0080008 */ lfs f0, 8(r8)
/* 00008EA4 D0010018 */ stfs f0, 0x18(r1)
/* 00008EA8 C027005C */ lfs f1, 0x5c(r7)
/* 00008EAC 4BFFF921 */ bl lbl_000087CC
/* 00008EB0 8001002C */ lwz r0, 0x2c(r1)
/* 00008EB4 38210028 */ addi r1, r1, 0x28
/* 00008EB8 7C0803A6 */ mtlr r0
/* 00008EBC 4E800020 */ blr 
lbl_00008EC0:
/* 00008EC0 7C0802A6 */ mflr r0
/* 00008EC4 3CA00000 */ lis r5, lbl_00011338@ha
/* 00008EC8 90010004 */ stw r0, 4(r1)
/* 00008ECC 39050000 */ addi r8, r5, lbl_00011338@l
/* 00008ED0 9421FFD8 */ stwu r1, -0x28(r1)
/* 00008ED4 C0040004 */ lfs f0, 4(r4)
/* 00008ED8 D001001C */ stfs f0, 0x1c(r1)
/* 00008EDC C0080098 */ lfs f0, 0x98(r8)
/* 00008EE0 D0010020 */ stfs f0, 0x20(r1)
/* 00008EE4 80040094 */ lwz r0, 0x94(r4)
/* 00008EE8 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00008EEC 4182001C */ beq lbl_00008F08
/* 00008EF0 C8280020 */ lfd f1, 0x20(r8)
/* 00008EF4 C004000C */ lfs f0, 0xc(r4)
/* 00008EF8 FC01002A */ fadd f0, f1, f0
/* 00008EFC FC000018 */ frsp f0, f0
/* 00008F00 D0010024 */ stfs f0, 0x24(r1)
/* 00008F04 48000028 */ b lbl_00008F2C
lbl_00008F08:
/* 00008F08 C0040024 */ lfs f0, 0x24(r4)
/* 00008F0C C8480020 */ lfd f2, 0x20(r8)
/* 00008F10 FC000050 */ fneg f0, f0
/* 00008F14 C024000C */ lfs f1, 0xc(r4)
/* 00008F18 FC22082A */ fadd f1, f2, f1
/* 00008F1C FC020024 */ fdiv f0, f2, f0
/* 00008F20 FC01002A */ fadd f0, f1, f0
/* 00008F24 FC000018 */ frsp f0, f0
/* 00008F28 D0010024 */ stfs f0, 0x24(r1)
lbl_00008F2C:
/* 00008F2C C0210024 */ lfs f1, 0x24(r1)
/* 00008F30 C8080030 */ lfd f0, 0x30(r8)
/* 00008F34 FC010040 */ fcmpo cr0, f1, f0
/* 00008F38 4080000C */ bge lbl_00008F44
/* 00008F3C C0080038 */ lfs f0, 0x38(r8)
/* 00008F40 D0010024 */ stfs f0, 0x24(r1)
lbl_00008F44:
/* 00008F44 C021001C */ lfs f1, 0x1c(r1)
/* 00008F48 C80800A0 */ lfd f0, 0xa0(r8)
/* 00008F4C FC010040 */ fcmpo cr0, f1, f0
/* 00008F50 4080000C */ bge lbl_00008F5C
/* 00008F54 C00800A8 */ lfs f0, 0xa8(r8)
/* 00008F58 D001001C */ stfs f0, 0x1c(r1)
lbl_00008F5C:
/* 00008F5C C021001C */ lfs f1, 0x1c(r1)
/* 00008F60 C80800B0 */ lfd f0, 0xb0(r8)
/* 00008F64 FC010040 */ fcmpo cr0, f1, f0
/* 00008F68 4081000C */ ble lbl_00008F74
/* 00008F6C C00800B8 */ lfs f0, 0xb8(r8)
/* 00008F70 D001001C */ stfs f0, 0x1c(r1)
lbl_00008F74:
/* 00008F74 80E40004 */ lwz r7, 4(r4)
/* 00008F78 38A10010 */ addi r5, r1, 0x10
/* 00008F7C 80040008 */ lwz r0, 8(r4)
/* 00008F80 38C01800 */ li r6, 0x1800
/* 00008F84 90E10010 */ stw r7, 0x10(r1)
/* 00008F88 90010014 */ stw r0, 0x14(r1)
/* 00008F8C 8004000C */ lwz r0, 0xc(r4)
/* 00008F90 3881001C */ addi r4, r1, 0x1c
/* 00008F94 90010018 */ stw r0, 0x18(r1)
/* 00008F98 C028005C */ lfs f1, 0x5c(r8)
/* 00008F9C 4BFFF831 */ bl lbl_000087CC
/* 00008FA0 8001002C */ lwz r0, 0x2c(r1)
/* 00008FA4 38210028 */ addi r1, r1, 0x28
/* 00008FA8 7C0803A6 */ mtlr r0
/* 00008FAC 4E800020 */ blr 
lbl_00008FB0:
/* 00008FB0 7C0802A6 */ mflr r0
/* 00008FB4 3CA00000 */ lis r5, lbl_00011338@ha
/* 00008FB8 90010004 */ stw r0, 4(r1)
/* 00008FBC 39050000 */ addi r8, r5, lbl_00011338@l
/* 00008FC0 38C00800 */ li r6, 0x800
/* 00008FC4 9421FFD0 */ stwu r1, -0x30(r1)
/* 00008FC8 93E1002C */ stw r31, 0x2c(r1)
/* 00008FCC 3BE30000 */ addi r31, r3, 0
/* 00008FD0 38A10010 */ addi r5, r1, 0x10
/* 00008FD4 C0040004 */ lfs f0, 4(r4)
/* 00008FD8 D001001C */ stfs f0, 0x1c(r1)
/* 00008FDC C0080098 */ lfs f0, 0x98(r8)
/* 00008FE0 D0010020 */ stfs f0, 0x20(r1)
/* 00008FE4 C82800C0 */ lfd f1, 0xc0(r8)
/* 00008FE8 C0040024 */ lfs f0, 0x24(r4)
/* 00008FEC C8680068 */ lfd f3, 0x68(r8)
/* 00008FF0 C044000C */ lfs f2, 0xc(r4)
/* 00008FF4 FC010032 */ fmul f0, f1, f0
/* 00008FF8 FC23102A */ fadd f1, f3, f2
/* 00008FFC FC01002A */ fadd f0, f1, f0
/* 00009000 FC000018 */ frsp f0, f0
/* 00009004 D0010024 */ stfs f0, 0x24(r1)
/* 00009008 80E40004 */ lwz r7, 4(r4)
/* 0000900C 80040008 */ lwz r0, 8(r4)
/* 00009010 90E10010 */ stw r7, 0x10(r1)
/* 00009014 90010014 */ stw r0, 0x14(r1)
/* 00009018 8004000C */ lwz r0, 0xc(r4)
/* 0000901C 3881001C */ addi r4, r1, 0x1c
/* 00009020 90010018 */ stw r0, 0x18(r1)
/* 00009024 C0280098 */ lfs f1, 0x98(r8)
/* 00009028 4BFFF7A5 */ bl lbl_000087CC
/* 0000902C 38000007 */ li r0, 7
/* 00009030 981F001F */ stb r0, 0x1f(r31)
/* 00009034 80010034 */ lwz r0, 0x34(r1)
/* 00009038 83E1002C */ lwz r31, 0x2c(r1)
/* 0000903C 38210030 */ addi r1, r1, 0x30
/* 00009040 7C0803A6 */ mtlr r0
/* 00009044 4E800020 */ blr 
lbl_00009048:
/* 00009048 7C0802A6 */ mflr r0
/* 0000904C 3CA00000 */ lis r5, lbl_00011338@ha
/* 00009050 90010004 */ stw r0, 4(r1)
/* 00009054 39050000 */ addi r8, r5, lbl_00011338@l
/* 00009058 38C00800 */ li r6, 0x800
/* 0000905C 9421FFD8 */ stwu r1, -0x28(r1)
/* 00009060 C0040004 */ lfs f0, 4(r4)
/* 00009064 38A10010 */ addi r5, r1, 0x10
/* 00009068 D001001C */ stfs f0, 0x1c(r1)
/* 0000906C C0080098 */ lfs f0, 0x98(r8)
/* 00009070 D0010020 */ stfs f0, 0x20(r1)
/* 00009074 C82800C0 */ lfd f1, 0xc0(r8)
/* 00009078 C0040024 */ lfs f0, 0x24(r4)
/* 0000907C C8680068 */ lfd f3, 0x68(r8)
/* 00009080 C044000C */ lfs f2, 0xc(r4)
/* 00009084 FC010032 */ fmul f0, f1, f0
/* 00009088 FC23102A */ fadd f1, f3, f2
/* 0000908C FC01002A */ fadd f0, f1, f0
/* 00009090 FC000018 */ frsp f0, f0
/* 00009094 D0010024 */ stfs f0, 0x24(r1)
/* 00009098 80E40004 */ lwz r7, 4(r4)
/* 0000909C 80040008 */ lwz r0, 8(r4)
/* 000090A0 90E10010 */ stw r7, 0x10(r1)
/* 000090A4 90010014 */ stw r0, 0x14(r1)
/* 000090A8 8004000C */ lwz r0, 0xc(r4)
/* 000090AC 3881001C */ addi r4, r1, 0x1c
/* 000090B0 90010018 */ stw r0, 0x18(r1)
/* 000090B4 C028005C */ lfs f1, 0x5c(r8)
/* 000090B8 4BFFF715 */ bl lbl_000087CC
/* 000090BC 8001002C */ lwz r0, 0x2c(r1)
/* 000090C0 38210028 */ addi r1, r1, 0x28
/* 000090C4 7C0803A6 */ mtlr r0
/* 000090C8 4E800020 */ blr 
lbl_000090CC:
/* 000090CC 7C0802A6 */ mflr r0
/* 000090D0 3C800000 */ lis r4, lbl_00011338@ha
/* 000090D4 90010004 */ stw r0, 4(r1)
/* 000090D8 38E40000 */ addi r7, r4, lbl_00011338@l
/* 000090DC 38C01800 */ li r6, 0x1800
/* 000090E0 9421FFD8 */ stwu r1, -0x28(r1)
/* 000090E4 C00700C8 */ lfs f0, 0xc8(r7)
/* 000090E8 3881001C */ addi r4, r1, 0x1c
/* 000090EC 38A10010 */ addi r5, r1, 0x10
/* 000090F0 D001001C */ stfs f0, 0x1c(r1)
/* 000090F4 C0070098 */ lfs f0, 0x98(r7)
/* 000090F8 D0010020 */ stfs f0, 0x20(r1)
/* 000090FC C00700CC */ lfs f0, 0xcc(r7)
/* 00009100 D0010024 */ stfs f0, 0x24(r1)
/* 00009104 C00700D0 */ lfs f0, 0xd0(r7)
/* 00009108 D0010010 */ stfs f0, 0x10(r1)
/* 0000910C C00700D4 */ lfs f0, 0xd4(r7)
/* 00009110 D0010014 */ stfs f0, 0x14(r1)
/* 00009114 C00700D8 */ lfs f0, 0xd8(r7)
/* 00009118 D0010018 */ stfs f0, 0x18(r1)
/* 0000911C C0270098 */ lfs f1, 0x98(r7)
/* 00009120 4BFFF6AD */ bl lbl_000087CC
/* 00009124 8001002C */ lwz r0, 0x2c(r1)
/* 00009128 38210028 */ addi r1, r1, 0x28
/* 0000912C 7C0803A6 */ mtlr r0
/* 00009130 4E800020 */ blr 
lbl_00009134:
/* 00009134 7C0802A6 */ mflr r0
/* 00009138 3C800000 */ lis r4, lbl_00011338@ha
/* 0000913C 90010004 */ stw r0, 4(r1)
/* 00009140 38E40000 */ addi r7, r4, lbl_00011338@l
/* 00009144 38C01800 */ li r6, 0x1800
/* 00009148 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000914C C00700DC */ lfs f0, 0xdc(r7)
/* 00009150 3881001C */ addi r4, r1, 0x1c
/* 00009154 38A10010 */ addi r5, r1, 0x10
/* 00009158 D001001C */ stfs f0, 0x1c(r1)
/* 0000915C C00700E0 */ lfs f0, 0xe0(r7)
/* 00009160 D0010020 */ stfs f0, 0x20(r1)
/* 00009164 C00700E4 */ lfs f0, 0xe4(r7)
/* 00009168 D0010024 */ stfs f0, 0x24(r1)
/* 0000916C C00700E8 */ lfs f0, 0xe8(r7)
/* 00009170 D0010010 */ stfs f0, 0x10(r1)
/* 00009174 C00700EC */ lfs f0, 0xec(r7)
/* 00009178 D0010014 */ stfs f0, 0x14(r1)
/* 0000917C C00700F0 */ lfs f0, 0xf0(r7)
/* 00009180 D0010018 */ stfs f0, 0x18(r1)
/* 00009184 C0270098 */ lfs f1, 0x98(r7)
/* 00009188 4BFFF645 */ bl lbl_000087CC
/* 0000918C 8001002C */ lwz r0, 0x2c(r1)
/* 00009190 38210028 */ addi r1, r1, 0x28
/* 00009194 7C0803A6 */ mtlr r0
/* 00009198 4E800020 */ blr 
lbl_0000919C:
/* 0000919C 7C0802A6 */ mflr r0
/* 000091A0 90010004 */ stw r0, 4(r1)
/* 000091A4 9421FFE8 */ stwu r1, -0x18(r1)
/* 000091A8 93E10014 */ stw r31, 0x14(r1)
/* 000091AC 3BE40000 */ addi r31, r4, 0
/* 000091B0 93C10010 */ stw r30, 0x10(r1)
/* 000091B4 3BC30000 */ addi r30, r3, 0
/* 000091B8 4BFF6FA9 */ bl camera_clear
/* 000091BC 38000009 */ li r0, 9
/* 000091C0 981E0026 */ stb r0, 0x26(r30)
/* 000091C4 3C600000 */ lis r3, lbl_00011340@ha
/* 000091C8 38001C71 */ li r0, 0x1c71
/* 000091CC C4030000 */ lfsu f0, lbl_00011340@l(r3)
/* 000091D0 D01E0028 */ stfs f0, 0x28(r30)
/* 000091D4 C0030000 */ lfs f0, 0(r3)
/* 000091D8 D01E002C */ stfs f0, 0x2c(r30)
/* 000091DC B01E0030 */ sth r0, 0x30(r30)
/* 000091E0 4BFF6F81 */ bl func_8009D7CC
/* 000091E4 2C030000 */ cmpwi r3, 0
/* 000091E8 40820014 */ bne lbl_000091FC
/* 000091EC 4BFF6F75 */ bl func_8009D7E8
/* 000091F0 1C030110 */ mulli r0, r3, 0x110
/* 000091F4 B01E0050 */ sth r0, 0x50(r30)
/* 000091F8 4800000C */ b lbl_00009204
lbl_000091FC:
/* 000091FC 38000000 */ li r0, 0
/* 00009200 B01E0050 */ sth r0, 0x50(r30)
lbl_00009204:
/* 00009204 3800000B */ li r0, 0xb
/* 00009208 981E001F */ stb r0, 0x1f(r30)
/* 0000920C 387E0000 */ addi r3, r30, 0
/* 00009210 389F0000 */ addi r4, r31, 0
/* 00009214 4800001D */ bl lbl_00009230
/* 00009218 8001001C */ lwz r0, 0x1c(r1)
/* 0000921C 83E10014 */ lwz r31, 0x14(r1)
/* 00009220 83C10010 */ lwz r30, 0x10(r1)
/* 00009224 7C0803A6 */ mtlr r0
/* 00009228 38210018 */ addi r1, r1, 0x18
/* 0000922C 4E800020 */ blr 
lbl_00009230:
/* 00009230 7C0802A6 */ mflr r0
/* 00009234 3C800000 */ lis r4, gamePauseStatus@ha
/* 00009238 90010004 */ stw r0, 4(r1)
/* 0000923C 9421FFB0 */ stwu r1, -0x50(r1)
/* 00009240 DBE10048 */ stfd f31, 0x48(r1)
/* 00009244 93E10044 */ stw r31, 0x44(r1)
/* 00009248 93C10040 */ stw r30, 0x40(r1)
/* 0000924C 93A1003C */ stw r29, 0x3c(r1)
/* 00009250 3BA30000 */ addi r29, r3, 0
/* 00009254 93810038 */ stw r28, 0x38(r1)
/* 00009258 80040000 */ lwz r0, gamePauseStatus@l(r4)
/* 0000925C 3C800000 */ lis r4, lbl_00011338@ha
/* 00009260 3BC40000 */ addi r30, r4, lbl_00011338@l
/* 00009264 7000000A */ andi. r0, r0, 0xa
/* 00009268 41820010 */ beq lbl_00009278
/* 0000926C 881D001F */ lbz r0, 0x1f(r29)
/* 00009270 2C00000B */ cmpwi r0, 0xb
/* 00009274 4182041C */ beq lbl_00009690
lbl_00009278:
/* 00009278 4BFF6EE9 */ bl func_8009D7E8
/* 0000927C 7C7F1B79 */ or. r31, r3, r3
/* 00009280 40810410 */ ble lbl_00009690
/* 00009284 1C1F0110 */ mulli r0, r31, 0x110
/* 00009288 A89D0050 */ lha r4, 0x50(r29)
/* 0000928C 7C040000 */ cmpw r4, r0
/* 00009290 408001A8 */ bge lbl_00009438
/* 00009294 3C607878 */ lis r3, 0x7878
/* 00009298 38037879 */ addi r0, r3, 0x7879
/* 0000929C 7C002096 */ mulhw r0, r0, r4
/* 000092A0 7C003E70 */ srawi r0, r0, 7
/* 000092A4 54030FFE */ srwi r3, r0, 0x1f
/* 000092A8 7C601A14 */ add r3, r0, r3
/* 000092AC 1C030110 */ mulli r0, r3, 0x110
/* 000092B0 2C1F0002 */ cmpwi r31, 2
/* 000092B4 7F802050 */ subf r28, r0, r4
/* 000092B8 4081006C */ ble lbl_00009324
/* 000092BC 2C030002 */ cmpwi r3, 2
/* 000092C0 41820044 */ beq lbl_00009304
/* 000092C4 40800014 */ bge lbl_000092D8
/* 000092C8 2C030000 */ cmpwi r3, 0
/* 000092CC 41820018 */ beq lbl_000092E4
/* 000092D0 40800024 */ bge lbl_000092F4
/* 000092D4 48000058 */ b lbl_0000932C
lbl_000092D8:
/* 000092D8 2C030004 */ cmpwi r3, 4
/* 000092DC 40800050 */ bge lbl_0000932C
/* 000092E0 48000034 */ b lbl_00009314
lbl_000092E4:
/* 000092E4 38600001 */ li r3, 1
/* 000092E8 3881001C */ addi r4, r1, 0x1c
/* 000092EC 4BFF6E75 */ bl func_8009D7FC
/* 000092F0 4800003C */ b lbl_0000932C
lbl_000092F4:
/* 000092F4 38600000 */ li r3, 0
/* 000092F8 3881001C */ addi r4, r1, 0x1c
/* 000092FC 4BFF6E65 */ bl func_8009D7FC
/* 00009300 4800002C */ b lbl_0000932C
lbl_00009304:
/* 00009304 38600002 */ li r3, 2
/* 00009308 3881001C */ addi r4, r1, 0x1c
/* 0000930C 4BFF6E55 */ bl func_8009D7FC
/* 00009310 4800001C */ b lbl_0000932C
lbl_00009314:
/* 00009314 38600003 */ li r3, 3
/* 00009318 3881001C */ addi r4, r1, 0x1c
/* 0000931C 4BFF6E45 */ bl func_8009D7FC
/* 00009320 4800000C */ b lbl_0000932C
lbl_00009324:
/* 00009324 3881001C */ addi r4, r1, 0x1c
/* 00009328 4BFF6E39 */ bl func_8009D7FC
lbl_0000932C:
/* 0000932C 2C1C00CC */ cmpwi r28, 0xcc
/* 00009330 41800058 */ blt lbl_00009388
/* 00009334 C001001C */ lfs f0, 0x1c(r1)
/* 00009338 38600000 */ li r3, 0
/* 0000933C 38008000 */ li r0, -32768
/* 00009340 FC000018 */ frsp f0, f0
/* 00009344 D01D0000 */ stfs f0, 0(r29)
/* 00009348 C83E00F8 */ lfd f1, 0xf8(r30)
/* 0000934C C0010020 */ lfs f0, 0x20(r1)
/* 00009350 FC01002A */ fadd f0, f1, f0
/* 00009354 FC000018 */ frsp f0, f0
/* 00009358 D01D0004 */ stfs f0, 4(r29)
/* 0000935C C0410024 */ lfs f2, 0x24(r1)
/* 00009360 C83E0100 */ lfd f1, 0x100(r30)
/* 00009364 C81E0010 */ lfd f0, 0x10(r30)
/* 00009368 FC220828 */ fsub f1, f2, f1
/* 0000936C FC010028 */ fsub f0, f1, f0
/* 00009370 FC000018 */ frsp f0, f0
/* 00009374 D01D0008 */ stfs f0, 8(r29)
/* 00009378 B07D0018 */ sth r3, 0x18(r29)
/* 0000937C B01D001A */ sth r0, 0x1a(r29)
/* 00009380 B07D001C */ sth r3, 0x1c(r29)
/* 00009384 4800024C */ b lbl_000095D0
lbl_00009388:
/* 00009388 6F808000 */ xoris r0, r28, 0x8000
/* 0000938C C03E0108 */ lfs f1, 0x108(r30)
/* 00009390 90010034 */ stw r0, 0x34(r1)
/* 00009394 3C004330 */ lis r0, 0x4330
/* 00009398 3C600000 */ lis r3, lbl_00011338@ha
/* 0000939C C8BE0110 */ lfd f5, 0x110(r30)
/* 000093A0 90010030 */ stw r0, 0x30(r1)
/* 000093A4 C8630000 */ lfd f3, lbl_00011338@l(r3)
/* 000093A8 38600000 */ li r3, 0
/* 000093AC C8410030 */ lfd f2, 0x30(r1)
/* 000093B0 38008000 */ li r0, -32768
/* 000093B4 C8DE0050 */ lfd f6, 0x50(r30)
/* 000093B8 EC421828 */ fsubs f2, f2, f3
/* 000093BC C001001C */ lfs f0, 0x1c(r1)
/* 000093C0 D01D0000 */ stfs f0, 0(r29)
/* 000093C4 EFE20824 */ fdivs f31, f2, f1
/* 000093C8 C85E0020 */ lfd f2, 0x20(r30)
/* 000093CC C83E0118 */ lfd f1, 0x118(r30)
/* 000093D0 C89E00F8 */ lfd f4, 0xf8(r30)
/* 000093D4 C0610020 */ lfs f3, 0x20(r1)
/* 000093D8 FCA507F2 */ fmul f5, f5, f31
/* 000093DC EC1F07F2 */ fmuls f0, f31, f31
/* 000093E0 FCA6282A */ fadd f5, f6, f5
/* 000093E4 FFE50032 */ fmul f31, f5, f0
/* 000093E8 FFE0F818 */ frsp f31, f31
/* 000093EC FC02F828 */ fsub f0, f2, f31
/* 000093F0 FC8407F2 */ fmul f4, f4, f31
/* 000093F4 FC010032 */ fmul f0, f1, f0
/* 000093F8 FC020028 */ fsub f0, f2, f0
/* 000093FC FC030032 */ fmul f0, f3, f0
/* 00009400 FC04002A */ fadd f0, f4, f0
/* 00009404 FC000018 */ frsp f0, f0
/* 00009408 D01D0004 */ stfs f0, 4(r29)
/* 0000940C C0410024 */ lfs f2, 0x24(r1)
/* 00009410 C83E0100 */ lfd f1, 0x100(r30)
/* 00009414 C81E0010 */ lfd f0, 0x10(r30)
/* 00009418 FC220828 */ fsub f1, f2, f1
/* 0000941C FC010028 */ fsub f0, f1, f0
/* 00009420 FC000018 */ frsp f0, f0
/* 00009424 D01D0008 */ stfs f0, 8(r29)
/* 00009428 B07D0018 */ sth r3, 0x18(r29)
/* 0000942C B01D001A */ sth r0, 0x1a(r29)
/* 00009430 B07D001C */ sth r3, 0x1c(r29)
/* 00009434 4800019C */ b lbl_000095D0
lbl_00009438:
/* 00009438 7C002050 */ subf r0, r0, r4
/* 0000943C 2C000008 */ cmpwi r0, 8
/* 00009440 40800034 */ bge lbl_00009474
/* 00009444 6C008000 */ xoris r0, r0, 0x8000
/* 00009448 C81E0120 */ lfd f0, 0x120(r30)
/* 0000944C 90010034 */ stw r0, 0x34(r1)
/* 00009450 3C004330 */ lis r0, 0x4330
/* 00009454 3C600000 */ lis r3, lbl_00011338@ha
/* 00009458 90010030 */ stw r0, 0x30(r1)
/* 0000945C C8430000 */ lfd f2, lbl_00011338@l(r3)
/* 00009460 C8210030 */ lfd f1, 0x30(r1)
/* 00009464 FC211028 */ fsub f1, f1, f2
/* 00009468 FFE10032 */ fmul f31, f1, f0
/* 0000946C FFE0F818 */ frsp f31, f31
/* 00009470 48000008 */ b lbl_00009478
lbl_00009474:
/* 00009474 C3FE0098 */ lfs f31, 0x98(r30)
lbl_00009478:
/* 00009478 C83E0020 */ lfd f1, 0x20(r30)
/* 0000947C 38610010 */ addi r3, r1, 0x10
/* 00009480 FC01F828 */ fsub f0, f1, f31
/* 00009484 FC000032 */ fmul f0, f0, f0
/* 00009488 FFE10028 */ fsub f31, f1, f0
/* 0000948C FFE0F818 */ frsp f31, f31
/* 00009490 4BFF6CD1 */ bl func_8009D98C
/* 00009494 C0010010 */ lfs f0, 0x10(r1)
/* 00009498 D01D0000 */ stfs f0, 0(r29)
/* 0000949C C83E0128 */ lfd f1, 0x128(r30)
/* 000094A0 C0010014 */ lfs f0, 0x14(r1)
/* 000094A4 FC01002A */ fadd f0, f1, f0
/* 000094A8 FC000018 */ frsp f0, f0
/* 000094AC D01D0004 */ stfs f0, 4(r29)
/* 000094B0 C81E0050 */ lfd f0, 0x50(r30)
/* 000094B4 C0410018 */ lfs f2, 0x18(r1)
/* 000094B8 C83E0130 */ lfd f1, 0x130(r30)
/* 000094BC FC0007F2 */ fmul f0, f0, f31
/* 000094C0 FC220828 */ fsub f1, f2, f1
/* 000094C4 FC010028 */ fsub f0, f1, f0
/* 000094C8 FC000018 */ frsp f0, f0
/* 000094CC D01D0008 */ stfs f0, 8(r29)
/* 000094D0 48000C69 */ bl lbl_0000A138
/* 000094D4 2C030000 */ cmpwi r3, 0
/* 000094D8 41820074 */ beq lbl_0000954C
/* 000094DC A8BD0018 */ lha r5, 0x18(r29)
/* 000094E0 3C600000 */ lis r3, lbl_00011338@ha
/* 000094E4 3C804330 */ lis r4, 0x4330
/* 000094E8 C8230000 */ lfd f1, lbl_00011338@l(r3)
/* 000094EC 20050900 */ subfic r0, r5, 0x900
/* 000094F0 6C008000 */ xoris r0, r0, 0x8000
/* 000094F4 C85E0138 */ lfd f2, 0x138(r30)
/* 000094F8 90010034 */ stw r0, 0x34(r1)
/* 000094FC C87E0140 */ lfd f3, 0x140(r30)
/* 00009500 90810030 */ stw r4, 0x30(r1)
/* 00009504 C8010030 */ lfd f0, 0x30(r1)
/* 00009508 FC000828 */ fsub f0, f0, f1
/* 0000950C FC020032 */ fmul f0, f2, f0
/* 00009510 FC001840 */ fcmpo cr0, f0, f3
/* 00009514 40800028 */ bge lbl_0000953C
/* 00009518 20050900 */ subfic r0, r5, 0x900
/* 0000951C 6C008000 */ xoris r0, r0, 0x8000
/* 00009520 90010034 */ stw r0, 0x34(r1)
/* 00009524 3C600000 */ lis r3, lbl_00011338@ha
/* 00009528 C8230000 */ lfd f1, lbl_00011338@l(r3)
/* 0000952C 90810030 */ stw r4, 0x30(r1)
/* 00009530 C8010030 */ lfd f0, 0x30(r1)
/* 00009534 FC000828 */ fsub f0, f0, f1
/* 00009538 FC620032 */ fmul f3, f2, f0
lbl_0000953C:
/* 0000953C FC00181E */ fctiwz f0, f3
/* 00009540 D8010030 */ stfd f0, 0x30(r1)
/* 00009544 80A10034 */ lwz r5, 0x34(r1)
/* 00009548 48000040 */ b lbl_00009588
lbl_0000954C:
/* 0000954C A81D0018 */ lha r0, 0x18(r29)
/* 00009550 3C600000 */ lis r3, lbl_00011338@ha
/* 00009554 C8230000 */ lfd f1, lbl_00011338@l(r3)
/* 00009558 7C0000D0 */ neg r0, r0
/* 0000955C C85E0148 */ lfd f2, 0x148(r30)
/* 00009560 6C008000 */ xoris r0, r0, 0x8000
/* 00009564 90010034 */ stw r0, 0x34(r1)
/* 00009568 3C004330 */ lis r0, 0x4330
/* 0000956C 90010030 */ stw r0, 0x30(r1)
/* 00009570 C8010030 */ lfd f0, 0x30(r1)
/* 00009574 FC000828 */ fsub f0, f0, f1
/* 00009578 FC020032 */ fmul f0, f2, f0
/* 0000957C FC00001E */ fctiwz f0, f0
/* 00009580 D8010028 */ stfd f0, 0x28(r1)
/* 00009584 80A1002C */ lwz r5, 0x2c(r1)
lbl_00009588:
/* 00009588 A89D0018 */ lha r4, 0x18(r29)
/* 0000958C 38608000 */ li r3, -32768
/* 00009590 7CA00735 */ extsh. r0, r5
/* 00009594 7C042A14 */ add r0, r4, r5
/* 00009598 B01D0018 */ sth r0, 0x18(r29)
/* 0000959C 38000000 */ li r0, 0
/* 000095A0 B07D001A */ sth r3, 0x1a(r29)
/* 000095A4 B01D001C */ sth r0, 0x1c(r29)
/* 000095A8 40820018 */ bne lbl_000095C0
/* 000095AC 3C600000 */ lis r3, lbl_801EEC90@ha
/* 000095B0 84030000 */ lwzu r0, lbl_801EEC90@l(r3)
/* 000095B4 60000020 */ ori r0, r0, 0x20
/* 000095B8 90030000 */ stw r0, 0(r3)
/* 000095BC 48000014 */ b lbl_000095D0
lbl_000095C0:
/* 000095C0 3C600000 */ lis r3, lbl_801EEC90@ha
/* 000095C4 84030000 */ lwzu r0, lbl_801EEC90@l(r3)
/* 000095C8 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 000095CC 90030000 */ stw r0, 0(r3)
lbl_000095D0:
/* 000095D0 3C600000 */ lis r3, mathutilData@ha
/* 000095D4 38630000 */ addi r3, r3, mathutilData@l
/* 000095D8 80630000 */ lwz r3, 0(r3)
/* 000095DC 4BFF6B85 */ bl func_8009DB6C
/* 000095E0 7FA3EB78 */ mr r3, r29
/* 000095E4 4BFF6B7D */ bl mathutil_mtxA_translate
/* 000095E8 A87D001A */ lha r3, 0x1a(r29)
/* 000095EC 4BFF6B75 */ bl mathutil_mtxA_rotate_y
/* 000095F0 A87D0018 */ lha r3, 0x18(r29)
/* 000095F4 4BFF6B6D */ bl mathutil_mtxA_rotate_x
/* 000095F8 A87D001C */ lha r3, 0x1c(r29)
/* 000095FC 4BFF6B65 */ bl mathutil_mtxA_rotate_z
/* 00009600 389D0004 */ addi r4, r29, 4
/* 00009604 387D0008 */ addi r3, r29, 8
/* 00009608 3CA0E000 */ lis r5, 0xe000
/* 0000960C C045000C */ lfs f2, 0xc(r5)
/* 00009610 C025001C */ lfs f1, 0x1c(r5)
/* 00009614 C005002C */ lfs f0, 0x2c(r5)
/* 00009618 D05D0000 */ stfs f2, 0(r29)
/* 0000961C D0240000 */ stfs f1, 0(r4)
/* 00009620 D0030000 */ stfs f0, 0(r3)
/* 00009624 387D001A */ addi r3, r29, 0x1a
/* 00009628 389D0018 */ addi r4, r29, 0x18
/* 0000962C 38BD001C */ addi r5, r29, 0x1c
/* 00009630 4BFF6B31 */ bl mathutil_mtxA_to_euler_yxz
/* 00009634 C03E0008 */ lfs f1, 8(r30)
/* 00009638 387D000C */ addi r3, r29, 0xc
/* 0000963C C07E0150 */ lfs f3, 0x150(r30)
/* 00009640 FC400890 */ fmr f2, f1
/* 00009644 4BFF6B1D */ bl mathutil_mtxA_tf_point_xyz
/* 00009648 A87D0050 */ lha r3, 0x50(r29)
/* 0000964C 38030001 */ addi r0, r3, 1
/* 00009650 B01D0050 */ sth r0, 0x50(r29)
/* 00009654 48000061 */ bl lbl_000096B4
/* 00009658 2C030000 */ cmpwi r3, 0
/* 0000965C 41820020 */ beq lbl_0000967C
/* 00009660 1C1F0110 */ mulli r0, r31, 0x110
/* 00009664 A87D0050 */ lha r3, 0x50(r29)
/* 00009668 7C030000 */ cmpw r3, r0
/* 0000966C 40800010 */ bge lbl_0000967C
/* 00009670 2C03000A */ cmpwi r3, 0xa
/* 00009674 40810008 */ ble lbl_0000967C
/* 00009678 B01D0050 */ sth r0, 0x50(r29)
lbl_0000967C:
/* 0000967C A81D0050 */ lha r0, 0x50(r29)
/* 00009680 2C000880 */ cmpwi r0, 0x880
/* 00009684 4081000C */ ble lbl_00009690
/* 00009688 38000880 */ li r0, 0x880
/* 0000968C B01D0050 */ sth r0, 0x50(r29)
lbl_00009690:
/* 00009690 80010054 */ lwz r0, 0x54(r1)
/* 00009694 CBE10048 */ lfd f31, 0x48(r1)
/* 00009698 83E10044 */ lwz r31, 0x44(r1)
/* 0000969C 7C0803A6 */ mtlr r0
/* 000096A0 83C10040 */ lwz r30, 0x40(r1)
/* 000096A4 83A1003C */ lwz r29, 0x3c(r1)
/* 000096A8 83810038 */ lwz r28, 0x38(r1)
/* 000096AC 38210050 */ addi r1, r1, 0x50
/* 000096B0 4E800020 */ blr 
lbl_000096B4:
/* 000096B4 3C600000 */ lis r3, spritePoolInfo@ha
/* 000096B8 38630000 */ addi r3, r3, spritePoolInfo@l
/* 000096BC 8063000C */ lwz r3, 0xc(r3)
/* 000096C0 88030000 */ lbz r0, 0(r3)
/* 000096C4 7C000775 */ extsb. r0, r0
/* 000096C8 41820030 */ beq lbl_000096F8
/* 000096CC 3C800000 */ lis r4, lbl_80206BD0@ha
/* 000096D0 80040000 */ lwz r0, lbl_80206BD0@l(r4)
/* 000096D4 3C800000 */ lis r4, controllerInfo@ha
/* 000096D8 38840000 */ addi r4, r4, controllerInfo@l
/* 000096DC 1C00003C */ mulli r0, r0, 0x3c
/* 000096E0 7C840214 */ add r4, r4, r0
/* 000096E4 A0040018 */ lhz r0, 0x18(r4)
/* 000096E8 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000096EC 4182000C */ beq lbl_000096F8
/* 000096F0 38600001 */ li r3, 1
/* 000096F4 4E800020 */ blr 
lbl_000096F8:
/* 000096F8 88030001 */ lbz r0, 1(r3)
/* 000096FC 7C000775 */ extsb. r0, r0
/* 00009700 41820034 */ beq lbl_00009734
/* 00009704 3C800000 */ lis r4, lbl_80206BD0@ha
/* 00009708 38840000 */ addi r4, r4, lbl_80206BD0@l
/* 0000970C 80040004 */ lwz r0, 4(r4)
/* 00009710 3C800000 */ lis r4, controllerInfo@ha
/* 00009714 38840000 */ addi r4, r4, controllerInfo@l
/* 00009718 1C00003C */ mulli r0, r0, 0x3c
/* 0000971C 7C840214 */ add r4, r4, r0
/* 00009720 A0040018 */ lhz r0, 0x18(r4)
/* 00009724 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00009728 4182000C */ beq lbl_00009734
/* 0000972C 38600001 */ li r3, 1
/* 00009730 4E800020 */ blr 
lbl_00009734:
/* 00009734 88030002 */ lbz r0, 2(r3)
/* 00009738 7C000775 */ extsb. r0, r0
/* 0000973C 41820034 */ beq lbl_00009770
/* 00009740 3C800000 */ lis r4, lbl_80206BD0@ha
/* 00009744 38840000 */ addi r4, r4, lbl_80206BD0@l
/* 00009748 80040008 */ lwz r0, 8(r4)
/* 0000974C 3C800000 */ lis r4, controllerInfo@ha
/* 00009750 38840000 */ addi r4, r4, controllerInfo@l
/* 00009754 1C00003C */ mulli r0, r0, 0x3c
/* 00009758 7C840214 */ add r4, r4, r0
/* 0000975C A0040018 */ lhz r0, 0x18(r4)
/* 00009760 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00009764 4182000C */ beq lbl_00009770
/* 00009768 38600001 */ li r3, 1
/* 0000976C 4E800020 */ blr 
lbl_00009770:
/* 00009770 88030003 */ lbz r0, 3(r3)
/* 00009774 7C000775 */ extsb. r0, r0
/* 00009778 41820034 */ beq lbl_000097AC
/* 0000977C 3C600000 */ lis r3, lbl_80206BD0@ha
/* 00009780 38630000 */ addi r3, r3, lbl_80206BD0@l
/* 00009784 8003000C */ lwz r0, 0xc(r3)
/* 00009788 3C600000 */ lis r3, controllerInfo@ha
/* 0000978C 38630000 */ addi r3, r3, controllerInfo@l
/* 00009790 1C00003C */ mulli r0, r0, 0x3c
/* 00009794 7C630214 */ add r3, r3, r0
/* 00009798 A0030018 */ lhz r0, 0x18(r3)
/* 0000979C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000097A0 4182000C */ beq lbl_000097AC
/* 000097A4 38600001 */ li r3, 1
/* 000097A8 4E800020 */ blr 
lbl_000097AC:
/* 000097AC 38600000 */ li r3, 0
/* 000097B0 4E800020 */ blr 
lbl_000097B4:
/* 000097B4 9421FFD0 */ stwu r1, -0x30(r1)
/* 000097B8 3C600000 */ lis r3, lbl_100004E0@ha
/* 000097BC 38C30000 */ addi r6, r3, lbl_100004E0@l
/* 000097C0 93E1002C */ stw r31, 0x2c(r1)
/* 000097C4 38000000 */ li r0, 0
/* 000097C8 3CA00000 */ lis r5, lbl_00011490@ha
/* 000097CC 93C10028 */ stw r30, 0x28(r1)
/* 000097D0 3C660001 */ addis r3, r6, 1
/* 000097D4 38800000 */ li r4, 0
/* 000097D8 93A10024 */ stw r29, 0x24(r1)
/* 000097DC 2C000A28 */ cmpwi r0, 0xa28
/* 000097E0 38A50000 */ addi r5, r5, lbl_00011490@l
/* 000097E4 B0831C6C */ sth r4, 0x1c6c(r3)
/* 000097E8 B0831CAC */ sth r4, 0x1cac(r3)
/* 000097EC B0831C7C */ sth r4, 0x1c7c(r3)
/* 000097F0 B0831CBC */ sth r4, 0x1cbc(r3)
/* 000097F4 B0831C8C */ sth r4, 0x1c8c(r3)
/* 000097F8 B0831CCC */ sth r4, 0x1ccc(r3)
/* 000097FC B0831C9C */ sth r4, 0x1c9c(r3)
/* 00009800 B0831CDC */ sth r4, 0x1cdc(r3)
/* 00009804 408000B8 */ bge lbl_000098BC
/* 00009808 38000041 */ li r0, 0x41
/* 0000980C 7C0903A6 */ mtctr r0
/* 00009810 38660000 */ addi r3, r6, 0
lbl_00009814:
/* 00009814 B0830018 */ sth r4, 0x18(r3)
/* 00009818 B0830034 */ sth r4, 0x34(r3)
/* 0000981C B0830050 */ sth r4, 0x50(r3)
/* 00009820 B083006C */ sth r4, 0x6c(r3)
/* 00009824 B0830088 */ sth r4, 0x88(r3)
/* 00009828 B08300A4 */ sth r4, 0xa4(r3)
/* 0000982C B08300C0 */ sth r4, 0xc0(r3)
/* 00009830 B08300DC */ sth r4, 0xdc(r3)
/* 00009834 B08300F8 */ sth r4, 0xf8(r3)
/* 00009838 B0830114 */ sth r4, 0x114(r3)
/* 0000983C B0830130 */ sth r4, 0x130(r3)
/* 00009840 B083014C */ sth r4, 0x14c(r3)
/* 00009844 B0830168 */ sth r4, 0x168(r3)
/* 00009848 B0830184 */ sth r4, 0x184(r3)
/* 0000984C B08301A0 */ sth r4, 0x1a0(r3)
/* 00009850 B08301BC */ sth r4, 0x1bc(r3)
/* 00009854 B08301D8 */ sth r4, 0x1d8(r3)
/* 00009858 B08301F4 */ sth r4, 0x1f4(r3)
/* 0000985C B0830210 */ sth r4, 0x210(r3)
/* 00009860 B083022C */ sth r4, 0x22c(r3)
/* 00009864 B0830248 */ sth r4, 0x248(r3)
/* 00009868 B0830264 */ sth r4, 0x264(r3)
/* 0000986C B0830280 */ sth r4, 0x280(r3)
/* 00009870 B083029C */ sth r4, 0x29c(r3)
/* 00009874 B08302B8 */ sth r4, 0x2b8(r3)
/* 00009878 B08302D4 */ sth r4, 0x2d4(r3)
/* 0000987C B08302F0 */ sth r4, 0x2f0(r3)
/* 00009880 B083030C */ sth r4, 0x30c(r3)
/* 00009884 B0830328 */ sth r4, 0x328(r3)
/* 00009888 B0830344 */ sth r4, 0x344(r3)
/* 0000988C B0830360 */ sth r4, 0x360(r3)
/* 00009890 B083037C */ sth r4, 0x37c(r3)
/* 00009894 B0830398 */ sth r4, 0x398(r3)
/* 00009898 B08303B4 */ sth r4, 0x3b4(r3)
/* 0000989C B08303D0 */ sth r4, 0x3d0(r3)
/* 000098A0 B08303EC */ sth r4, 0x3ec(r3)
/* 000098A4 B0830408 */ sth r4, 0x408(r3)
/* 000098A8 B0830424 */ sth r4, 0x424(r3)
/* 000098AC B0830440 */ sth r4, 0x440(r3)
/* 000098B0 B083045C */ sth r4, 0x45c(r3)
/* 000098B4 38630460 */ addi r3, r3, 0x460
/* 000098B8 4200FF5C */ bdnz lbl_00009814
lbl_000098BC:
/* 000098BC 3C660001 */ addis r3, r6, 1
/* 000098C0 38000000 */ li r0, 0
/* 000098C4 90031CE0 */ stw r0, 0x1ce0(r3)
/* 000098C8 39450000 */ addi r10, r5, 0
/* 000098CC 39631CE4 */ addi r11, r3, 0x1ce4
/* 000098D0 3BE00000 */ li r31, 0
/* 000098D4 3C604330 */ lis r3, 0x4330
lbl_000098D8:
/* 000098D8 390A0000 */ addi r8, r10, 0
/* 000098DC 392B0000 */ addi r9, r11, 0
/* 000098E0 3BA00000 */ li r29, 0
/* 000098E4 39800000 */ li r12, 0
lbl_000098E8:
/* 000098E8 6D808000 */ xoris r0, r12, 0x8000
/* 000098EC C8453200 */ lfd f2, 0x3200(r5)
/* 000098F0 9001001C */ stw r0, 0x1c(r1)
/* 000098F4 3C800000 */ lis r4, lbl_000146A0@ha
/* 000098F8 38000010 */ li r0, 0x10
/* 000098FC C8240000 */ lfd f1, lbl_000146A0@l(r4)
/* 00009900 90610018 */ stw r3, 0x18(r1)
/* 00009904 7C0903A6 */ mtctr r0
/* 00009908 7D064378 */ mr r6, r8
/* 0000990C C8010018 */ lfd f0, 0x18(r1)
/* 00009910 38E90000 */ addi r7, r9, 0
/* 00009914 3BC00000 */ li r30, 0
/* 00009918 FC000828 */ fsub f0, f0, f1
/* 0000991C FC020028 */ fsub f0, f2, f0
/* 00009920 FC000018 */ frsp f0, f0
lbl_00009924:
/* 00009924 88060000 */ lbz r0, 0(r6)
/* 00009928 2C000030 */ cmpwi r0, 0x30
/* 0000992C 40820044 */ bne lbl_00009970
/* 00009930 6FC08000 */ xoris r0, r30, 0x8000
/* 00009934 C8653208 */ lfd f3, 0x3208(r5)
/* 00009938 9001001C */ stw r0, 0x1c(r1)
/* 0000993C 3C800000 */ lis r4, lbl_000146A0@ha
/* 00009940 C8440000 */ lfd f2, lbl_000146A0@l(r4)
/* 00009944 39290004 */ addi r9, r9, 4
/* 00009948 90610018 */ stw r3, 0x18(r1)
/* 0000994C 3BBD0001 */ addi r29, r29, 1
/* 00009950 C8210018 */ lfd f1, 0x18(r1)
/* 00009954 FC211028 */ fsub f1, f1, f2
/* 00009958 FC230828 */ fsub f1, f3, f1
/* 0000995C FC200850 */ fneg f1, f1
/* 00009960 FC200818 */ frsp f1, f1
/* 00009964 D0270000 */ stfs f1, 0(r7)
/* 00009968 D00709EC */ stfs f0, 0x9ec(r7)
/* 0000996C 38E70004 */ addi r7, r7, 4
lbl_00009970:
/* 00009970 8C060001 */ lbzu r0, 1(r6)
/* 00009974 3BDE0001 */ addi r30, r30, 1
/* 00009978 2C000030 */ cmpwi r0, 0x30
/* 0000997C 40820044 */ bne lbl_000099C0
/* 00009980 6FC08000 */ xoris r0, r30, 0x8000
/* 00009984 C8653208 */ lfd f3, 0x3208(r5)
/* 00009988 9001001C */ stw r0, 0x1c(r1)
/* 0000998C 3C800000 */ lis r4, lbl_000146A0@ha
/* 00009990 C8440000 */ lfd f2, lbl_000146A0@l(r4)
/* 00009994 39290004 */ addi r9, r9, 4
/* 00009998 90610018 */ stw r3, 0x18(r1)
/* 0000999C 3BBD0001 */ addi r29, r29, 1
/* 000099A0 C8210018 */ lfd f1, 0x18(r1)
/* 000099A4 FC211028 */ fsub f1, f1, f2
/* 000099A8 FC230828 */ fsub f1, f3, f1
/* 000099AC FC200850 */ fneg f1, f1
/* 000099B0 FC200818 */ frsp f1, f1
/* 000099B4 D0270000 */ stfs f1, 0(r7)
/* 000099B8 D00709EC */ stfs f0, 0x9ec(r7)
/* 000099BC 38E70004 */ addi r7, r7, 4
lbl_000099C0:
/* 000099C0 8C060001 */ lbzu r0, 1(r6)
/* 000099C4 3BDE0001 */ addi r30, r30, 1
/* 000099C8 2C000030 */ cmpwi r0, 0x30
/* 000099CC 40820044 */ bne lbl_00009A10
/* 000099D0 6FC08000 */ xoris r0, r30, 0x8000
/* 000099D4 C8653208 */ lfd f3, 0x3208(r5)
/* 000099D8 9001001C */ stw r0, 0x1c(r1)
/* 000099DC 3C800000 */ lis r4, lbl_000146A0@ha
/* 000099E0 C8440000 */ lfd f2, lbl_000146A0@l(r4)
/* 000099E4 39290004 */ addi r9, r9, 4
/* 000099E8 90610018 */ stw r3, 0x18(r1)
/* 000099EC 3BBD0001 */ addi r29, r29, 1
/* 000099F0 C8210018 */ lfd f1, 0x18(r1)
/* 000099F4 FC211028 */ fsub f1, f1, f2
/* 000099F8 FC230828 */ fsub f1, f3, f1
/* 000099FC FC200850 */ fneg f1, f1
/* 00009A00 FC200818 */ frsp f1, f1
/* 00009A04 D0270000 */ stfs f1, 0(r7)
/* 00009A08 D00709EC */ stfs f0, 0x9ec(r7)
/* 00009A0C 38E70004 */ addi r7, r7, 4
lbl_00009A10:
/* 00009A10 8C060001 */ lbzu r0, 1(r6)
/* 00009A14 3BDE0001 */ addi r30, r30, 1
/* 00009A18 2C000030 */ cmpwi r0, 0x30
/* 00009A1C 40820044 */ bne lbl_00009A60
/* 00009A20 6FC08000 */ xoris r0, r30, 0x8000
/* 00009A24 C8653208 */ lfd f3, 0x3208(r5)
/* 00009A28 9001001C */ stw r0, 0x1c(r1)
/* 00009A2C 3C800000 */ lis r4, lbl_000146A0@ha
/* 00009A30 C8440000 */ lfd f2, lbl_000146A0@l(r4)
/* 00009A34 39290004 */ addi r9, r9, 4
/* 00009A38 90610018 */ stw r3, 0x18(r1)
/* 00009A3C 3BBD0001 */ addi r29, r29, 1
/* 00009A40 C8210018 */ lfd f1, 0x18(r1)
/* 00009A44 FC211028 */ fsub f1, f1, f2
/* 00009A48 FC230828 */ fsub f1, f3, f1
/* 00009A4C FC200850 */ fneg f1, f1
/* 00009A50 FC200818 */ frsp f1, f1
/* 00009A54 D0270000 */ stfs f1, 0(r7)
/* 00009A58 D00709EC */ stfs f0, 0x9ec(r7)
/* 00009A5C 38E70004 */ addi r7, r7, 4
lbl_00009A60:
/* 00009A60 38C60001 */ addi r6, r6, 1
/* 00009A64 3BDE0001 */ addi r30, r30, 1
/* 00009A68 4200FEBC */ bdnz lbl_00009924
/* 00009A6C 398C0001 */ addi r12, r12, 1
/* 00009A70 2C0C0028 */ cmpwi r12, 0x28
/* 00009A74 39080040 */ addi r8, r8, 0x40
/* 00009A78 4180FE70 */ blt lbl_000098E8
/* 00009A7C 3BFF0001 */ addi r31, r31, 1
/* 00009A80 93AB13D8 */ stw r29, 0x13d8(r11)
/* 00009A84 2C1F0005 */ cmpwi r31, 5
/* 00009A88 394A0A00 */ addi r10, r10, 0xa00
/* 00009A8C 396B13DC */ addi r11, r11, 0x13dc
/* 00009A90 4180FE48 */ blt lbl_000098D8
/* 00009A94 83E1002C */ lwz r31, 0x2c(r1)
/* 00009A98 83C10028 */ lwz r30, 0x28(r1)
/* 00009A9C 83A10024 */ lwz r29, 0x24(r1)
/* 00009AA0 38210030 */ addi r1, r1, 0x30
/* 00009AA4 4E800020 */ blr 
lbl_00009AA8:
/* 00009AA8 7C0802A6 */ mflr r0
/* 00009AAC 3C600000 */ lis r3, gamePauseStatus@ha
/* 00009AB0 90010004 */ stw r0, 4(r1)
/* 00009AB4 9421FFC8 */ stwu r1, -0x38(r1)
/* 00009AB8 BF410020 */ stmw r26, 0x20(r1)
/* 00009ABC 3BA00000 */ li r29, 0
/* 00009AC0 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00009AC4 3C600000 */ lis r3, lbl_100004E0@ha
/* 00009AC8 3BC30000 */ addi r30, r3, lbl_100004E0@l
/* 00009ACC 7000000A */ andi. r0, r0, 0xa
/* 00009AD0 3C600000 */ lis r3, lbl_00011490@ha
/* 00009AD4 3BE30000 */ addi r31, r3, lbl_00011490@l
/* 00009AD8 4082022C */ bne lbl_00009D04
/* 00009ADC 3C9E0001 */ addis r4, r30, 1
/* 00009AE0 A8641CAC */ lha r3, 0x1cac(r4)
/* 00009AE4 38841CA0 */ addi r4, r4, 0x1ca0
/* 00009AE8 2C030000 */ cmpwi r3, 0
/* 00009AEC 4081000C */ ble lbl_00009AF8
/* 00009AF0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009AF4 B004000C */ sth r0, 0xc(r4)
lbl_00009AF8:
/* 00009AF8 A864001C */ lha r3, 0x1c(r4)
/* 00009AFC 38840010 */ addi r4, r4, 0x10
/* 00009B00 2C030000 */ cmpwi r3, 0
/* 00009B04 4081000C */ ble lbl_00009B10
/* 00009B08 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009B0C B004000C */ sth r0, 0xc(r4)
lbl_00009B10:
/* 00009B10 A864001C */ lha r3, 0x1c(r4)
/* 00009B14 38840010 */ addi r4, r4, 0x10
/* 00009B18 2C030000 */ cmpwi r3, 0
/* 00009B1C 4081000C */ ble lbl_00009B28
/* 00009B20 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009B24 B004000C */ sth r0, 0xc(r4)
lbl_00009B28:
/* 00009B28 A864001C */ lha r3, 0x1c(r4)
/* 00009B2C 38840010 */ addi r4, r4, 0x10
/* 00009B30 2C030000 */ cmpwi r3, 0
/* 00009B34 4081000C */ ble lbl_00009B40
/* 00009B38 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009B3C B004000C */ sth r0, 0xc(r4)
lbl_00009B40:
/* 00009B40 3F5E0001 */ addis r26, r30, 1
/* 00009B44 3B600000 */ li r27, 0
/* 00009B48 3F804330 */ lis r28, 0x4330
/* 00009B4C 3B5A1C60 */ addi r26, r26, 0x1c60
lbl_00009B50:
/* 00009B50 A87A000C */ lha r3, 0xc(r26)
/* 00009B54 2C030000 */ cmpwi r3, 0
/* 00009B58 408100AC */ ble lbl_00009C04
/* 00009B5C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009B60 B01A000C */ sth r0, 0xc(r26)
/* 00009B64 A87A000C */ lha r3, 0xc(r26)
/* 00009B68 7C600735 */ extsh. r0, r3
/* 00009B6C 41810034 */ bgt lbl_00009BA0
/* 00009B70 38000000 */ li r0, 0
/* 00009B74 B01A000C */ sth r0, 0xc(r26)
/* 00009B78 7F44D378 */ mr r4, r26
/* 00009B7C 887A000E */ lbz r3, 0xe(r26)
/* 00009B80 7C630774 */ extsb r3, r3
/* 00009B84 480006B9 */ bl lbl_0000A23C
/* 00009B88 389A0000 */ addi r4, r26, 0
/* 00009B8C 386000AC */ li r3, 0xac
/* 00009B90 38A0001B */ li r5, 0x1b
/* 00009B94 38C02000 */ li r6, 0x2000
/* 00009B98 48000BE1 */ bl lbl_0000A778
/* 00009B9C 48000068 */ b lbl_00009C04
lbl_00009BA0:
/* 00009BA0 546007FF */ clrlwi. r0, r3, 0x1f
/* 00009BA4 41820060 */ beq lbl_00009C04
/* 00009BA8 C01A0000 */ lfs f0, 0(r26)
/* 00009BAC 3CA00000 */ lis r5, lbl_000146A0@ha
/* 00009BB0 38810008 */ addi r4, r1, 8
/* 00009BB4 D0010008 */ stfs f0, 8(r1)
/* 00009BB8 38600006 */ li r3, 6
/* 00009BBC A81A000C */ lha r0, 0xc(r26)
/* 00009BC0 C8250000 */ lfd f1, lbl_000146A0@l(r5)
/* 00009BC4 6C008000 */ xoris r0, r0, 0x8000
/* 00009BC8 C05F3220 */ lfs f2, 0x3220(r31)
/* 00009BCC 9001001C */ stw r0, 0x1c(r1)
/* 00009BD0 C87F3218 */ lfd f3, 0x3218(r31)
/* 00009BD4 93810018 */ stw r28, 0x18(r1)
/* 00009BD8 C09A0004 */ lfs f4, 4(r26)
/* 00009BDC C8010018 */ lfd f0, 0x18(r1)
/* 00009BE0 EC000828 */ fsubs f0, f0, f1
/* 00009BE4 EC020032 */ fmuls f0, f2, f0
/* 00009BE8 FC030028 */ fsub f0, f3, f0
/* 00009BEC FC040032 */ fmul f0, f4, f0
/* 00009BF0 FC000018 */ frsp f0, f0
/* 00009BF4 D001000C */ stfs f0, 0xc(r1)
/* 00009BF8 C01A0008 */ lfs f0, 8(r26)
/* 00009BFC D0010010 */ stfs f0, 0x10(r1)
/* 00009C00 48000A11 */ bl lbl_0000A610
lbl_00009C04:
/* 00009C04 3B7B0001 */ addi r27, r27, 1
/* 00009C08 2C1B0004 */ cmpwi r27, 4
/* 00009C0C 3B5A0010 */ addi r26, r26, 0x10
/* 00009C10 4180FF40 */ blt lbl_00009B50
/* 00009C14 3C9E0001 */ addis r4, r30, 1
/* 00009C18 80041CE0 */ lwz r0, 0x1ce0(r4)
/* 00009C1C 2C000000 */ cmpwi r0, 0
/* 00009C20 408100E4 */ ble lbl_00009D04
/* 00009C24 38000A28 */ li r0, 0xa28
/* 00009C28 7C0903A6 */ mtctr r0
/* 00009C2C 38BE0000 */ addi r5, r30, 0
lbl_00009C30:
/* 00009C30 80041CE0 */ lwz r0, 0x1ce0(r4)
/* 00009C34 7C1D0000 */ cmpw r29, r0
/* 00009C38 408000CC */ bge lbl_00009D04
/* 00009C3C A8050018 */ lha r0, 0x18(r5)
/* 00009C40 2C000000 */ cmpwi r0, 0
/* 00009C44 408100B8 */ ble lbl_00009CFC
/* 00009C48 C83F3228 */ lfd f1, 0x3228(r31)
/* 00009C4C C005000C */ lfs f0, 0xc(r5)
/* 00009C50 FC010032 */ fmul f0, f1, f0
/* 00009C54 FC000018 */ frsp f0, f0
/* 00009C58 D005000C */ stfs f0, 0xc(r5)
/* 00009C5C C83F3228 */ lfd f1, 0x3228(r31)
/* 00009C60 C0050010 */ lfs f0, 0x10(r5)
/* 00009C64 FC010032 */ fmul f0, f1, f0
/* 00009C68 FC000018 */ frsp f0, f0
/* 00009C6C D0050010 */ stfs f0, 0x10(r5)
/* 00009C70 C83F3228 */ lfd f1, 0x3228(r31)
/* 00009C74 C0050014 */ lfs f0, 0x14(r5)
/* 00009C78 FC010032 */ fmul f0, f1, f0
/* 00009C7C FC000018 */ frsp f0, f0
/* 00009C80 D0050014 */ stfs f0, 0x14(r5)
/* 00009C84 C0250010 */ lfs f1, 0x10(r5)
/* 00009C88 C81F3230 */ lfd f0, 0x3230(r31)
/* 00009C8C FC01002A */ fadd f0, f1, f0
/* 00009C90 FC000018 */ frsp f0, f0
/* 00009C94 D0050010 */ stfs f0, 0x10(r5)
/* 00009C98 C025000C */ lfs f1, 0xc(r5)
/* 00009C9C C0050000 */ lfs f0, 0(r5)
/* 00009CA0 EC01002A */ fadds f0, f1, f0
/* 00009CA4 D0050000 */ stfs f0, 0(r5)
/* 00009CA8 C0250010 */ lfs f1, 0x10(r5)
/* 00009CAC C0050004 */ lfs f0, 4(r5)
/* 00009CB0 EC01002A */ fadds f0, f1, f0
/* 00009CB4 D0050004 */ stfs f0, 4(r5)
/* 00009CB8 C0250014 */ lfs f1, 0x14(r5)
/* 00009CBC C0050008 */ lfs f0, 8(r5)
/* 00009CC0 EC01002A */ fadds f0, f1, f0
/* 00009CC4 D0050008 */ stfs f0, 8(r5)
/* 00009CC8 A8650018 */ lha r3, 0x18(r5)
/* 00009CCC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009CD0 B0050018 */ sth r0, 0x18(r5)
/* 00009CD4 A8050018 */ lha r0, 0x18(r5)
/* 00009CD8 2C000000 */ cmpwi r0, 0
/* 00009CDC 4181001C */ bgt lbl_00009CF8
/* 00009CE0 38000000 */ li r0, 0
/* 00009CE4 B0050018 */ sth r0, 0x18(r5)
/* 00009CE8 80641CE0 */ lwz r3, 0x1ce0(r4)
/* 00009CEC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00009CF0 90041CE0 */ stw r0, 0x1ce0(r4)
/* 00009CF4 48000008 */ b lbl_00009CFC
lbl_00009CF8:
/* 00009CF8 3BBD0001 */ addi r29, r29, 1
lbl_00009CFC:
/* 00009CFC 38A5001C */ addi r5, r5, 0x1c
/* 00009D00 4200FF30 */ bdnz lbl_00009C30
lbl_00009D04:
/* 00009D04 BB410020 */ lmw r26, 0x20(r1)
/* 00009D08 8001003C */ lwz r0, 0x3c(r1)
/* 00009D0C 38210038 */ addi r1, r1, 0x38
/* 00009D10 7C0803A6 */ mtlr r0
/* 00009D14 4E800020 */ blr 
lbl_00009D18:
/* 00009D18 7C0802A6 */ mflr r0
/* 00009D1C 3C600000 */ lis r3, lbl_100004E0@ha
/* 00009D20 90010004 */ stw r0, 4(r1)
/* 00009D24 38000015 */ li r0, 0x15
/* 00009D28 3C800000 */ lis r4, lbl_00011490@ha
/* 00009D2C 7C0903A6 */ mtctr r0
/* 00009D30 9421FF20 */ stwu r1, -0xe0(r1)
/* 00009D34 38C30000 */ addi r6, r3, lbl_100004E0@l
/* 00009D38 DBE100D8 */ stfd f31, 0xd8(r1)
/* 00009D3C 38A10000 */ addi r5, r1, 0
/* 00009D40 BF0100B8 */ stmw r24, 0xb8(r1)
/* 00009D44 3BC40000 */ addi r30, r4, lbl_00011490@l
/* 00009D48 389E3230 */ addi r4, r30, 0x3230
lbl_00009D4C:
/* 00009D4C 84640008 */ lwzu r3, 8(r4)
/* 00009D50 80040004 */ lwz r0, 4(r4)
/* 00009D54 94650008 */ stwu r3, 8(r5)
/* 00009D58 90050004 */ stw r0, 4(r5)
/* 00009D5C 4200FFF0 */ bdnz lbl_00009D4C
/* 00009D60 3FE60001 */ addis r31, r6, 1
/* 00009D64 801F1CE0 */ lwz r0, 0x1ce0(r31)
/* 00009D68 3B600000 */ li r27, 0
/* 00009D6C 2C000000 */ cmpwi r0, 0
/* 00009D70 408101D8 */ ble lbl_00009F48
/* 00009D74 3C800000 */ lis r4, mathutilData@ha
/* 00009D78 3C600000 */ lis r3, commonGma@ha
/* 00009D7C 3B860000 */ addi r28, r6, 0
/* 00009D80 3B240000 */ addi r25, r4, mathutilData@l
/* 00009D84 3B430000 */ addi r26, r3, commonGma@l
/* 00009D88 3BA00000 */ li r29, 0
/* 00009D8C 3F004330 */ lis r24, 0x4330
lbl_00009D90:
/* 00009D90 801F1CE0 */ lwz r0, 0x1ce0(r31)
/* 00009D94 7C1B0000 */ cmpw r27, r0
/* 00009D98 408001B0 */ bge lbl_00009F48
/* 00009D9C A87C0018 */ lha r3, 0x18(r28)
/* 00009DA0 7C600735 */ extsh. r0, r3
/* 00009DA4 40810194 */ ble lbl_00009F38
/* 00009DA8 881C001A */ lbz r0, 0x1a(r28)
/* 00009DAC 3B7B0001 */ addi r27, r27, 1
/* 00009DB0 2C000006 */ cmpwi r0, 6
/* 00009DB4 41820020 */ beq lbl_00009DD4
/* 00009DB8 2C03003F */ cmpwi r3, 0x3f
/* 00009DBC 40800018 */ bge lbl_00009DD4
/* 00009DC0 4BFF63A1 */ bl rand
/* 00009DC4 A81C0018 */ lha r0, 0x18(r28)
/* 00009DC8 546306BE */ clrlwi r3, r3, 0x1a
/* 00009DCC 7C001800 */ cmpw r0, r3
/* 00009DD0 41800168 */ blt lbl_00009F38
lbl_00009DD4:
/* 00009DD4 A8BC0018 */ lha r5, 0x18(r28)
/* 00009DD8 2C05003C */ cmpwi r5, 0x3c
/* 00009DDC 40800038 */ bge lbl_00009E14
/* 00009DE0 6CA08000 */ xoris r0, r5, 0x8000
/* 00009DE4 C85E32E8 */ lfd f2, 0x32e8(r30)
/* 00009DE8 900100B4 */ stw r0, 0xb4(r1)
/* 00009DEC 3C600000 */ lis r3, lbl_000146A0@ha
/* 00009DF0 C8230000 */ lfd f1, lbl_000146A0@l(r3)
/* 00009DF4 930100B0 */ stw r24, 0xb0(r1)
/* 00009DF8 C87E32E0 */ lfd f3, 0x32e0(r30)
/* 00009DFC C80100B0 */ lfd f0, 0xb0(r1)
/* 00009E00 FC000828 */ fsub f0, f0, f1
/* 00009E04 FC020032 */ fmul f0, f2, f0
/* 00009E08 FFE30032 */ fmul f31, f3, f0
/* 00009E0C FFE0F818 */ frsp f31, f31
/* 00009E10 48000048 */ b lbl_00009E58
lbl_00009E14:
/* 00009E14 2C05005A */ cmpwi r5, 0x5a
/* 00009E18 4081003C */ ble lbl_00009E54
/* 00009E1C 20050078 */ subfic r0, r5, 0x78
/* 00009E20 C85E32E0 */ lfd f2, 0x32e0(r30)
/* 00009E24 6C008000 */ xoris r0, r0, 0x8000
/* 00009E28 C87E32F0 */ lfd f3, 0x32f0(r30)
/* 00009E2C 900100B4 */ stw r0, 0xb4(r1)
/* 00009E30 3C600000 */ lis r3, lbl_000146A0@ha
/* 00009E34 C8230000 */ lfd f1, lbl_000146A0@l(r3)
/* 00009E38 930100B0 */ stw r24, 0xb0(r1)
/* 00009E3C C80100B0 */ lfd f0, 0xb0(r1)
/* 00009E40 FC000828 */ fsub f0, f0, f1
/* 00009E44 FC020032 */ fmul f0, f2, f0
/* 00009E48 FFE30032 */ fmul f31, f3, f0
/* 00009E4C FFE0F818 */ frsp f31, f31
/* 00009E50 48000008 */ b lbl_00009E58
lbl_00009E54:
/* 00009E54 C3FE32F8 */ lfs f31, 0x32f8(r30)
lbl_00009E58:
/* 00009E58 881C001A */ lbz r0, 0x1a(r28)
/* 00009E5C 7C040774 */ extsb r4, r0
/* 00009E60 2C04FFFF */ cmpwi r4, -1
/* 00009E64 40810090 */ ble lbl_00009EF4
/* 00009E68 2C040007 */ cmpwi r4, 7
/* 00009E6C 40800088 */ bge lbl_00009EF4
/* 00009E70 6CA08000 */ xoris r0, r5, 0x8000
/* 00009E74 C05E3220 */ lfs f2, 0x3220(r30)
/* 00009E78 900100B4 */ stw r0, 0xb4(r1)
/* 00009E7C 3C600000 */ lis r3, lbl_000146A0@ha
/* 00009E80 C8230000 */ lfd f1, lbl_000146A0@l(r3)
/* 00009E84 1C040018 */ mulli r0, r4, 0x18
/* 00009E88 930100B0 */ stw r24, 0xb0(r1)
/* 00009E8C C8FE3218 */ lfd f7, 0x3218(r30)
/* 00009E90 C80100B0 */ lfd f0, 0xb0(r1)
/* 00009E94 38610008 */ addi r3, r1, 8
/* 00009E98 7C630214 */ add r3, r3, r0
/* 00009E9C C09E32FC */ lfs f4, 0x32fc(r30)
/* 00009EA0 EC000828 */ fsubs f0, f0, f1
/* 00009EA4 C0A30000 */ lfs f5, 0(r3)
/* 00009EA8 C0C3000C */ lfs f6, 0xc(r3)
/* 00009EAC EC020032 */ fmuls f0, f2, f0
/* 00009EB0 C0630004 */ lfs f3, 4(r3)
/* 00009EB4 C0230008 */ lfs f1, 8(r3)
/* 00009EB8 C0430010 */ lfs f2, 0x10(r3)
/* 00009EBC ED000032 */ fmuls f8, f0, f0
/* 00009EC0 C0030014 */ lfs f0, 0x14(r3)
/* 00009EC4 FD274028 */ fsub f9, f7, f8
/* 00009EC8 ECE80172 */ fmuls f7, f8, f5
/* 00009ECC ECA800F2 */ fmuls f5, f8, f3
/* 00009ED0 FD204818 */ frsp f9, f9
/* 00009ED4 EC680072 */ fmuls f3, f8, f1
/* 00009ED8 EC2901B2 */ fmuls f1, f9, f6
/* 00009EDC EC4900B2 */ fmuls f2, f9, f2
/* 00009EE0 EC090032 */ fmuls f0, f9, f0
/* 00009EE4 EC27082A */ fadds f1, f7, f1
/* 00009EE8 EC45102A */ fadds f2, f5, f2
/* 00009EEC EC63002A */ fadds f3, f3, f0
/* 00009EF0 4BFF6271 */ bl g_avdisp_set_some_color_1
lbl_00009EF4:
/* 00009EF4 7F83E378 */ mr r3, r28
/* 00009EF8 4BFF6269 */ bl mathutil_mtxA_from_mtxB_translate
/* 00009EFC 4BFF6265 */ bl mathutil_mtxA_sq_from_identity
/* 00009F00 FC20F890 */ fmr f1, f31
/* 00009F04 C07E32FC */ lfs f3, 0x32fc(r30)
/* 00009F08 FC40F890 */ fmr f2, f31
/* 00009F0C 4BFF6255 */ bl mathutil_mtxA_scale_xyz
/* 00009F10 80790000 */ lwz r3, 0(r25)
/* 00009F14 38800000 */ li r4, 0
/* 00009F18 4BFF6249 */ bl GXLoadPosMtxImm
/* 00009F1C 80790000 */ lwz r3, 0(r25)
/* 00009F20 38800000 */ li r4, 0
/* 00009F24 4BFF623D */ bl GXLoadNrmMtxImm
/* 00009F28 807A0000 */ lwz r3, 0(r26)
/* 00009F2C 80630008 */ lwz r3, 8(r3)
/* 00009F30 806300D8 */ lwz r3, 0xd8(r3)
/* 00009F34 4BFF622D */ bl g_avdisp_maybe_draw_model_1
lbl_00009F38:
/* 00009F38 3BBD0001 */ addi r29, r29, 1
/* 00009F3C 2C1D0A28 */ cmpwi r29, 0xa28
/* 00009F40 3B9C001C */ addi r28, r28, 0x1c
/* 00009F44 4180FE4C */ blt lbl_00009D90
lbl_00009F48:
/* 00009F48 BB0100B8 */ lmw r24, 0xb8(r1)
/* 00009F4C 800100E4 */ lwz r0, 0xe4(r1)
/* 00009F50 CBE100D8 */ lfd f31, 0xd8(r1)
/* 00009F54 382100E0 */ addi r1, r1, 0xe0
/* 00009F58 7C0803A6 */ mtlr r0
/* 00009F5C 4E800020 */ blr 
lbl_00009F60:
/* 00009F60 7C0802A6 */ mflr r0
/* 00009F64 2C03FFFF */ cmpwi r3, -1
/* 00009F68 90010004 */ stw r0, 4(r1)
/* 00009F6C 3C800000 */ lis r4, lbl_00011490@ha
/* 00009F70 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009F74 93E1001C */ stw r31, 0x1c(r1)
/* 00009F78 3BE40000 */ addi r31, r4, lbl_00011490@l
/* 00009F7C 93C10018 */ stw r30, 0x18(r1)
/* 00009F80 408101A0 */ ble lbl_0000A120
/* 00009F84 2C030007 */ cmpwi r3, 7
/* 00009F88 40800198 */ bge lbl_0000A120
/* 00009F8C 3C800000 */ lis r4, lbl_10012140@ha
/* 00009F90 38000004 */ li r0, 4
/* 00009F94 38840000 */ addi r4, r4, lbl_10012140@l
/* 00009F98 7C0903A6 */ mtctr r0
/* 00009F9C 3BC40000 */ addi r30, r4, 0
lbl_00009FA0:
/* 00009FA0 A81E000C */ lha r0, 0xc(r30)
/* 00009FA4 2C000000 */ cmpwi r0, 0
/* 00009FA8 41810170 */ bgt lbl_0000A118
/* 00009FAC 38000078 */ li r0, 0x78
/* 00009FB0 B01E000C */ sth r0, 0xc(r30)
/* 00009FB4 7C600774 */ extsb r0, r3
/* 00009FB8 2C030004 */ cmpwi r3, 4
/* 00009FBC 981E000E */ stb r0, 0xe(r30)
/* 00009FC0 40800030 */ bge lbl_00009FF0
/* 00009FC4 2C030000 */ cmpwi r3, 0
/* 00009FC8 4080000C */ bge lbl_00009FD4
/* 00009FCC 48000024 */ b lbl_00009FF0
/* 00009FD0 48000020 */ b lbl_00009FF0
lbl_00009FD4:
/* 00009FD4 C01F3300 */ lfs f0, 0x3300(r31)
/* 00009FD8 D01E0000 */ stfs f0, 0(r30)
/* 00009FDC C01F3304 */ lfs f0, 0x3304(r31)
/* 00009FE0 D01E0004 */ stfs f0, 4(r30)
/* 00009FE4 C01F3308 */ lfs f0, 0x3308(r31)
/* 00009FE8 D01E0008 */ stfs f0, 8(r30)
/* 00009FEC 48000100 */ b lbl_0000A0EC
lbl_00009FF0:
/* 00009FF0 4BFF6171 */ bl rand
/* 00009FF4 6C608000 */ xoris r0, r3, 0x8000
/* 00009FF8 C05F3320 */ lfs f2, 0x3320(r31)
/* 00009FFC 90010014 */ stw r0, 0x14(r1)
/* 0000A000 3C004330 */ lis r0, 0x4330
/* 0000A004 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A008 C83F3318 */ lfd f1, 0x3318(r31)
/* 0000A00C 90010010 */ stw r0, 0x10(r1)
/* 0000A010 C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A014 C8610010 */ lfd f3, 0x10(r1)
/* 0000A018 C81F3310 */ lfd f0, 0x3310(r31)
/* 0000A01C EC632028 */ fsubs f3, f3, f4
/* 0000A020 EC431024 */ fdivs f2, f3, f2
/* 0000A024 FC2100B2 */ fmul f1, f1, f2
/* 0000A028 FC00082A */ fadd f0, f0, f1
/* 0000A02C FC000018 */ frsp f0, f0
/* 0000A030 D01E0000 */ stfs f0, 0(r30)
/* 0000A034 4BFF612D */ bl rand
/* 0000A038 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000A03C 41820010 */ beq lbl_0000A04C
/* 0000A040 C01E0000 */ lfs f0, 0(r30)
/* 0000A044 FC000050 */ fneg f0, f0
/* 0000A048 D01E0000 */ stfs f0, 0(r30)
lbl_0000A04C:
/* 0000A04C 480000ED */ bl lbl_0000A138
/* 0000A050 2C030000 */ cmpwi r3, 0
/* 0000A054 4182004C */ beq lbl_0000A0A0
/* 0000A058 4BFF6109 */ bl rand
/* 0000A05C 6C608000 */ xoris r0, r3, 0x8000
/* 0000A060 C05F3320 */ lfs f2, 0x3320(r31)
/* 0000A064 90010014 */ stw r0, 0x14(r1)
/* 0000A068 3C004330 */ lis r0, 0x4330
/* 0000A06C 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A070 C83F3310 */ lfd f1, 0x3310(r31)
/* 0000A074 90010010 */ stw r0, 0x10(r1)
/* 0000A078 C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A07C C8610010 */ lfd f3, 0x10(r1)
/* 0000A080 C81F3328 */ lfd f0, 0x3328(r31)
/* 0000A084 EC632028 */ fsubs f3, f3, f4
/* 0000A088 EC431024 */ fdivs f2, f3, f2
/* 0000A08C FC2100B2 */ fmul f1, f1, f2
/* 0000A090 FC00082A */ fadd f0, f0, f1
/* 0000A094 FC000018 */ frsp f0, f0
/* 0000A098 D01E0004 */ stfs f0, 4(r30)
/* 0000A09C 48000048 */ b lbl_0000A0E4
lbl_0000A0A0:
/* 0000A0A0 4BFF60C1 */ bl rand
/* 0000A0A4 6C608000 */ xoris r0, r3, 0x8000
/* 0000A0A8 C05F3320 */ lfs f2, 0x3320(r31)
/* 0000A0AC 90010014 */ stw r0, 0x14(r1)
/* 0000A0B0 3C004330 */ lis r0, 0x4330
/* 0000A0B4 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A0B8 C83F3338 */ lfd f1, 0x3338(r31)
/* 0000A0BC 90010010 */ stw r0, 0x10(r1)
/* 0000A0C0 C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A0C4 C8610010 */ lfd f3, 0x10(r1)
/* 0000A0C8 C81F3330 */ lfd f0, 0x3330(r31)
/* 0000A0CC EC632028 */ fsubs f3, f3, f4
/* 0000A0D0 EC431024 */ fdivs f2, f3, f2
/* 0000A0D4 FC2100B2 */ fmul f1, f1, f2
/* 0000A0D8 FC00082A */ fadd f0, f0, f1
/* 0000A0DC FC000018 */ frsp f0, f0
/* 0000A0E0 D01E0004 */ stfs f0, 4(r30)
lbl_0000A0E4:
/* 0000A0E4 C01F3308 */ lfs f0, 0x3308(r31)
/* 0000A0E8 D01E0008 */ stfs f0, 8(r30)
lbl_0000A0EC:
/* 0000A0EC 4BFF6075 */ bl rand
/* 0000A0F0 5463073E */ clrlwi r3, r3, 0x1c
/* 0000A0F4 3BE3FFCE */ addi r31, r3, -50  ;# fixed addi
/* 0000A0F8 4BFF6069 */ bl rand
/* 0000A0FC 546304FE */ clrlwi r3, r3, 0x13
/* 0000A100 38C31000 */ addi r6, r3, 0x1000
/* 0000A104 389E0000 */ addi r4, r30, 0
/* 0000A108 38BF0000 */ addi r5, r31, 0
/* 0000A10C 386000AB */ li r3, 0xab
/* 0000A110 48000669 */ bl lbl_0000A778
/* 0000A114 4800000C */ b lbl_0000A120
lbl_0000A118:
/* 0000A118 3BDE0010 */ addi r30, r30, 0x10
/* 0000A11C 4200FE84 */ bdnz lbl_00009FA0
lbl_0000A120:
/* 0000A120 80010024 */ lwz r0, 0x24(r1)
/* 0000A124 83E1001C */ lwz r31, 0x1c(r1)
/* 0000A128 83C10018 */ lwz r30, 0x18(r1)
/* 0000A12C 7C0803A6 */ mtlr r0
/* 0000A130 38210020 */ addi r1, r1, 0x20
/* 0000A134 4E800020 */ blr 
lbl_0000A138:
/* 0000A138 3C800000 */ lis r4, lbl_10012140@ha
/* 0000A13C 3C600000 */ lis r3, lbl_10012180@ha
/* 0000A140 38000002 */ li r0, 2
/* 0000A144 38840000 */ addi r4, r4, lbl_10012140@l
/* 0000A148 7C0903A6 */ mtctr r0
/* 0000A14C 38030000 */ addi r0, r3, lbl_10012180@l
/* 0000A150 38A40000 */ addi r5, r4, 0
/* 0000A154 7C040378 */ mr r4, r0
/* 0000A158 38600000 */ li r3, 0
/* 0000A15C 38C00000 */ li r6, 0
lbl_0000A160:
/* 0000A160 A805000C */ lha r0, 0xc(r5)
/* 0000A164 2C000000 */ cmpwi r0, 0
/* 0000A168 40810024 */ ble lbl_0000A18C
/* 0000A16C 8805000E */ lbz r0, 0xe(r5)
/* 0000A170 7C000774 */ extsb r0, r0
/* 0000A174 2C000004 */ cmpwi r0, 4
/* 0000A178 40800014 */ bge lbl_0000A18C
/* 0000A17C 2C000000 */ cmpwi r0, 0
/* 0000A180 40800008 */ bge lbl_0000A188
/* 0000A184 48000008 */ b lbl_0000A18C
lbl_0000A188:
/* 0000A188 38600001 */ li r3, 1
lbl_0000A18C:
/* 0000A18C A804000C */ lha r0, 0xc(r4)
/* 0000A190 2C000000 */ cmpwi r0, 0
/* 0000A194 40810024 */ ble lbl_0000A1B8
/* 0000A198 8804000E */ lbz r0, 0xe(r4)
/* 0000A19C 7C000774 */ extsb r0, r0
/* 0000A1A0 2C000004 */ cmpwi r0, 4
/* 0000A1A4 40800014 */ bge lbl_0000A1B8
/* 0000A1A8 2C000000 */ cmpwi r0, 0
/* 0000A1AC 40800008 */ bge lbl_0000A1B4
/* 0000A1B0 48000008 */ b lbl_0000A1B8
lbl_0000A1B4:
/* 0000A1B4 38600001 */ li r3, 1
lbl_0000A1B8:
/* 0000A1B8 2C030000 */ cmpwi r3, 0
/* 0000A1BC 4C820020 */ bnelr 
/* 0000A1C0 A805001C */ lha r0, 0x1c(r5)
/* 0000A1C4 38A50010 */ addi r5, r5, 0x10
/* 0000A1C8 38840010 */ addi r4, r4, 0x10
/* 0000A1CC 2C000000 */ cmpwi r0, 0
/* 0000A1D0 40810024 */ ble lbl_0000A1F4
/* 0000A1D4 8805000E */ lbz r0, 0xe(r5)
/* 0000A1D8 7C000774 */ extsb r0, r0
/* 0000A1DC 2C000004 */ cmpwi r0, 4
/* 0000A1E0 40800014 */ bge lbl_0000A1F4
/* 0000A1E4 2C000000 */ cmpwi r0, 0
/* 0000A1E8 40800008 */ bge lbl_0000A1F0
/* 0000A1EC 48000008 */ b lbl_0000A1F4
lbl_0000A1F0:
/* 0000A1F0 38600001 */ li r3, 1
lbl_0000A1F4:
/* 0000A1F4 A804000C */ lha r0, 0xc(r4)
/* 0000A1F8 2C000000 */ cmpwi r0, 0
/* 0000A1FC 40810024 */ ble lbl_0000A220
/* 0000A200 8804000E */ lbz r0, 0xe(r4)
/* 0000A204 7C000774 */ extsb r0, r0
/* 0000A208 2C000004 */ cmpwi r0, 4
/* 0000A20C 40800014 */ bge lbl_0000A220
/* 0000A210 2C000000 */ cmpwi r0, 0
/* 0000A214 40800008 */ bge lbl_0000A21C
/* 0000A218 48000008 */ b lbl_0000A220
lbl_0000A21C:
/* 0000A21C 38600001 */ li r3, 1
lbl_0000A220:
/* 0000A220 2C030000 */ cmpwi r3, 0
/* 0000A224 4C820020 */ bnelr 
/* 0000A228 38C60001 */ addi r6, r6, 1
/* 0000A22C 38A50010 */ addi r5, r5, 0x10
/* 0000A230 38840010 */ addi r4, r4, 0x10
/* 0000A234 4200FF2C */ bdnz lbl_0000A160
/* 0000A238 4E800020 */ blr 
lbl_0000A23C:
/* 0000A23C 7C0802A6 */ mflr r0
/* 0000A240 90010004 */ stw r0, 4(r1)
/* 0000A244 9421FF90 */ stwu r1, -0x70(r1)
/* 0000A248 BEA10044 */ stmw r21, 0x44(r1)
/* 0000A24C 3AC30000 */ addi r22, r3, 0
/* 0000A250 3C600000 */ lis r3, lbl_100004E0@ha
/* 0000A254 3B830000 */ addi r28, r3, lbl_100004E0@l
/* 0000A258 3C600000 */ lis r3, lbl_00011490@ha
/* 0000A25C 2C160004 */ cmpwi r22, 4
/* 0000A260 3AE40000 */ addi r23, r4, 0
/* 0000A264 3BA30000 */ addi r29, r3, lbl_00011490@l
/* 0000A268 4080002C */ bge lbl_0000A294
/* 0000A26C 2C160000 */ cmpwi r22, 0
/* 0000A270 40800008 */ bge lbl_0000A278
/* 0000A274 48000020 */ b lbl_0000A294
lbl_0000A278:
/* 0000A278 1C7613DC */ mulli r3, r22, 0x13dc
/* 0000A27C 3C1C0001 */ addis r0, r28, 1
/* 0000A280 7C601A14 */ add r3, r0, r3
/* 0000A284 38831CE4 */ addi r4, r3, 0x1ce4
/* 0000A288 830330BC */ lwz r24, 0x30bc(r3)
/* 0000A28C 38C409EC */ addi r6, r4, 0x9ec
/* 0000A290 48000008 */ b lbl_0000A298
lbl_0000A294:
/* 0000A294 3B000080 */ li r24, 0x80
lbl_0000A298:
/* 0000A298 3FDC0001 */ addis r30, r28, 1
/* 0000A29C 801E1CE0 */ lwz r0, 0x1ce0(r30)
/* 0000A2A0 20000A28 */ subfic r0, r0, 0xa28
/* 0000A2A4 7C00C000 */ cmpw r0, r24
/* 0000A2A8 41800354 */ blt lbl_0000A5FC
/* 0000A2AC 3816FFFC */ addi r0, r22, -4  ;# fixed addi
/* 0000A2B0 28000001 */ cmplwi r0, 1
/* 0000A2B4 3B200000 */ li r25, 0
/* 0000A2B8 418101CC */ bgt lbl_0000A484
/* 0000A2BC C01D3300 */ lfs f0, 0x3300(r29)
/* 0000A2C0 38604800 */ li r3, 0x4800
/* 0000A2C4 D001001C */ stfs f0, 0x1c(r1)
/* 0000A2C8 4BFF5E99 */ bl mathutil_sin
/* 0000A2CC C81D3340 */ lfd f0, 0x3340(r29)
/* 0000A2D0 38600800 */ li r3, 0x800
/* 0000A2D4 FC000072 */ fmul f0, f0, f1
/* 0000A2D8 FC000018 */ frsp f0, f0
/* 0000A2DC D0010020 */ stfs f0, 0x20(r1)
/* 0000A2E0 4BFF5E81 */ bl mathutil_sin
/* 0000A2E4 C81D3340 */ lfd f0, 0x3340(r29)
/* 0000A2E8 FC000072 */ fmul f0, f0, f1
/* 0000A2EC FC000018 */ frsp f0, f0
/* 0000A2F0 D0010024 */ stfs f0, 0x24(r1)
/* 0000A2F4 4BFF5E6D */ bl rand
/* 0000A2F8 5463053E */ clrlwi r3, r3, 0x14
/* 0000A2FC 38633800 */ addi r3, r3, 0x3800
/* 0000A300 4BFF5E61 */ bl mathutil_mtxA_from_rotate_x
/* 0000A304 4BFF5E5D */ bl rand
/* 0000A308 5463047E */ clrlwi r3, r3, 0x11
/* 0000A30C 4BFF5E55 */ bl mathutil_mtxA_rotate_y
/* 0000A310 3B7C0000 */ addi r27, r28, 0
/* 0000A314 7ED50774 */ extsb r21, r22
/* 0000A318 3B400000 */ li r26, 0
/* 0000A31C 3FE04330 */ lis r31, 0x4330
lbl_0000A320:
/* 0000A320 A81B0018 */ lha r0, 0x18(r27)
/* 0000A324 2C000000 */ cmpwi r0, 0
/* 0000A328 41810148 */ bgt lbl_0000A470
/* 0000A32C 38601000 */ li r3, 0x1000
/* 0000A330 4BFF5E31 */ bl mathutil_mtxA_rotate_x
/* 0000A334 3861001C */ addi r3, r1, 0x1c
/* 0000A338 38810010 */ addi r4, r1, 0x10
/* 0000A33C 4BFF5E25 */ bl mathutil_mtxA_tf_vec
/* 0000A340 4BFF5E21 */ bl rand
/* 0000A344 6C608000 */ xoris r0, r3, 0x8000
/* 0000A348 C07D3320 */ lfs f3, 0x3320(r29)
/* 0000A34C 9001003C */ stw r0, 0x3c(r1)
/* 0000A350 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A354 C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A358 93E10038 */ stw r31, 0x38(r1)
/* 0000A35C C83D3348 */ lfd f1, 0x3348(r29)
/* 0000A360 C8010038 */ lfd f0, 0x38(r1)
/* 0000A364 C85D3350 */ lfd f2, 0x3350(r29)
/* 0000A368 EC802028 */ fsubs f4, f0, f4
/* 0000A36C C0010010 */ lfs f0, 0x10(r1)
/* 0000A370 FC01002A */ fadd f0, f1, f0
/* 0000A374 EC241824 */ fdivs f1, f4, f3
/* 0000A378 FC220072 */ fmul f1, f2, f1
/* 0000A37C FC000828 */ fsub f0, f0, f1
/* 0000A380 FC000018 */ frsp f0, f0
/* 0000A384 D01B000C */ stfs f0, 0xc(r27)
/* 0000A388 4BFF5DD9 */ bl rand
/* 0000A38C 6C608000 */ xoris r0, r3, 0x8000
/* 0000A390 C07D3320 */ lfs f3, 0x3320(r29)
/* 0000A394 90010034 */ stw r0, 0x34(r1)
/* 0000A398 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A39C C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A3A0 93E10030 */ stw r31, 0x30(r1)
/* 0000A3A4 C83D3348 */ lfd f1, 0x3348(r29)
/* 0000A3A8 C8010030 */ lfd f0, 0x30(r1)
/* 0000A3AC C85D3350 */ lfd f2, 0x3350(r29)
/* 0000A3B0 EC802028 */ fsubs f4, f0, f4
/* 0000A3B4 C0010014 */ lfs f0, 0x14(r1)
/* 0000A3B8 FC01002A */ fadd f0, f1, f0
/* 0000A3BC EC241824 */ fdivs f1, f4, f3
/* 0000A3C0 FC220072 */ fmul f1, f2, f1
/* 0000A3C4 FC000828 */ fsub f0, f0, f1
/* 0000A3C8 FC000018 */ frsp f0, f0
/* 0000A3CC D01B0010 */ stfs f0, 0x10(r27)
/* 0000A3D0 4BFF5D91 */ bl rand
/* 0000A3D4 6C608000 */ xoris r0, r3, 0x8000
/* 0000A3D8 C07D3320 */ lfs f3, 0x3320(r29)
/* 0000A3DC 9001002C */ stw r0, 0x2c(r1)
/* 0000A3E0 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A3E4 C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A3E8 3B390001 */ addi r25, r25, 1
/* 0000A3EC 93E10028 */ stw r31, 0x28(r1)
/* 0000A3F0 7F202670 */ srawi r0, r25, 4
/* 0000A3F4 C85D3350 */ lfd f2, 0x3350(r29)
/* 0000A3F8 C8010028 */ lfd f0, 0x28(r1)
/* 0000A3FC 7C000194 */ addze r0, r0
/* 0000A400 54002036 */ slwi r0, r0, 4
/* 0000A404 C83D3348 */ lfd f1, 0x3348(r29)
/* 0000A408 EC802028 */ fsubs f4, f0, f4
/* 0000A40C C0010018 */ lfs f0, 0x18(r1)
/* 0000A410 38600078 */ li r3, 0x78
/* 0000A414 7C00C811 */ subfc. r0, r0, r25
/* 0000A418 EC641824 */ fdivs f3, f4, f3
/* 0000A41C FC4200F2 */ fmul f2, f2, f3
/* 0000A420 FC01002A */ fadd f0, f1, f0
/* 0000A424 FC001028 */ fsub f0, f0, f2
/* 0000A428 FC000018 */ frsp f0, f0
/* 0000A42C D01B0014 */ stfs f0, 0x14(r27)
/* 0000A430 B07B0018 */ sth r3, 0x18(r27)
/* 0000A434 9ABB001A */ stb r21, 0x1a(r27)
/* 0000A438 80770000 */ lwz r3, 0(r23)
/* 0000A43C 80170004 */ lwz r0, 4(r23)
/* 0000A440 907B0000 */ stw r3, 0(r27)
/* 0000A444 901B0004 */ stw r0, 4(r27)
/* 0000A448 80170008 */ lwz r0, 8(r23)
/* 0000A44C 901B0008 */ stw r0, 8(r27)
/* 0000A450 807E1CE0 */ lwz r3, 0x1ce0(r30)
/* 0000A454 38030001 */ addi r0, r3, 1
/* 0000A458 901E1CE0 */ stw r0, 0x1ce0(r30)
/* 0000A45C 4082000C */ bne lbl_0000A468
/* 0000A460 38601000 */ li r3, 0x1000
/* 0000A464 4BFF5CFD */ bl mathutil_mtxA_rotate_z
lbl_0000A468:
/* 0000A468 7C19C000 */ cmpw r25, r24
/* 0000A46C 40800140 */ bge lbl_0000A5AC
lbl_0000A470:
/* 0000A470 3B5A0001 */ addi r26, r26, 1
/* 0000A474 2C1A0A28 */ cmpwi r26, 0xa28
/* 0000A478 3B7B001C */ addi r27, r27, 0x1c
/* 0000A47C 4180FEA4 */ blt lbl_0000A320
/* 0000A480 4800012C */ b lbl_0000A5AC
lbl_0000A484:
/* 0000A484 38000514 */ li r0, 0x514
/* 0000A488 7C0903A6 */ mtctr r0
/* 0000A48C 38A40000 */ addi r5, r4, 0
/* 0000A490 391C0000 */ addi r8, r28, 0
/* 0000A494 7EC40774 */ extsb r4, r22
/* 0000A498 38E00000 */ li r7, 0
lbl_0000A49C:
/* 0000A49C A8080018 */ lha r0, 0x18(r8)
/* 0000A4A0 2C000000 */ cmpwi r0, 0
/* 0000A4A4 41810078 */ bgt lbl_0000A51C
/* 0000A4A8 38000078 */ li r0, 0x78
/* 0000A4AC B0080018 */ sth r0, 0x18(r8)
/* 0000A4B0 3B390001 */ addi r25, r25, 1
/* 0000A4B4 7C19C000 */ cmpw r25, r24
/* 0000A4B8 9888001A */ stb r4, 0x1a(r8)
/* 0000A4BC 80770000 */ lwz r3, 0(r23)
/* 0000A4C0 80170004 */ lwz r0, 4(r23)
/* 0000A4C4 90680000 */ stw r3, 0(r8)
/* 0000A4C8 90080004 */ stw r0, 4(r8)
/* 0000A4CC 80170008 */ lwz r0, 8(r23)
/* 0000A4D0 90080008 */ stw r0, 8(r8)
/* 0000A4D4 C0050000 */ lfs f0, 0(r5)
/* 0000A4D8 38A50004 */ addi r5, r5, 4
/* 0000A4DC C83D3358 */ lfd f1, 0x3358(r29)
/* 0000A4E0 FC010032 */ fmul f0, f1, f0
/* 0000A4E4 FC000018 */ frsp f0, f0
/* 0000A4E8 D008000C */ stfs f0, 0xc(r8)
/* 0000A4EC C0060000 */ lfs f0, 0(r6)
/* 0000A4F0 38C60004 */ addi r6, r6, 4
/* 0000A4F4 C83D3358 */ lfd f1, 0x3358(r29)
/* 0000A4F8 FC010032 */ fmul f0, f1, f0
/* 0000A4FC FC000018 */ frsp f0, f0
/* 0000A500 D0080010 */ stfs f0, 0x10(r8)
/* 0000A504 C01D3300 */ lfs f0, 0x3300(r29)
/* 0000A508 D0080014 */ stfs f0, 0x14(r8)
/* 0000A50C 807E1CE0 */ lwz r3, 0x1ce0(r30)
/* 0000A510 38030001 */ addi r0, r3, 1
/* 0000A514 901E1CE0 */ stw r0, 0x1ce0(r30)
/* 0000A518 40800094 */ bge lbl_0000A5AC
lbl_0000A51C:
/* 0000A51C A8080034 */ lha r0, 0x34(r8)
/* 0000A520 3908001C */ addi r8, r8, 0x1c
/* 0000A524 2C000000 */ cmpwi r0, 0
/* 0000A528 41810078 */ bgt lbl_0000A5A0
/* 0000A52C 38000078 */ li r0, 0x78
/* 0000A530 B0080018 */ sth r0, 0x18(r8)
/* 0000A534 3B390001 */ addi r25, r25, 1
/* 0000A538 7C19C000 */ cmpw r25, r24
/* 0000A53C 9888001A */ stb r4, 0x1a(r8)
/* 0000A540 80770000 */ lwz r3, 0(r23)
/* 0000A544 80170004 */ lwz r0, 4(r23)
/* 0000A548 90680000 */ stw r3, 0(r8)
/* 0000A54C 90080004 */ stw r0, 4(r8)
/* 0000A550 80170008 */ lwz r0, 8(r23)
/* 0000A554 90080008 */ stw r0, 8(r8)
/* 0000A558 C0050000 */ lfs f0, 0(r5)
/* 0000A55C 38A50004 */ addi r5, r5, 4
/* 0000A560 C83D3358 */ lfd f1, 0x3358(r29)
/* 0000A564 FC010032 */ fmul f0, f1, f0
/* 0000A568 FC000018 */ frsp f0, f0
/* 0000A56C D008000C */ stfs f0, 0xc(r8)
/* 0000A570 C0060000 */ lfs f0, 0(r6)
/* 0000A574 38C60004 */ addi r6, r6, 4
/* 0000A578 C83D3358 */ lfd f1, 0x3358(r29)
/* 0000A57C FC010032 */ fmul f0, f1, f0
/* 0000A580 FC000018 */ frsp f0, f0
/* 0000A584 D0080010 */ stfs f0, 0x10(r8)
/* 0000A588 C01D3300 */ lfs f0, 0x3300(r29)
/* 0000A58C D0080014 */ stfs f0, 0x14(r8)
/* 0000A590 807E1CE0 */ lwz r3, 0x1ce0(r30)
/* 0000A594 38030001 */ addi r0, r3, 1
/* 0000A598 901E1CE0 */ stw r0, 0x1ce0(r30)
/* 0000A59C 40800010 */ bge lbl_0000A5AC
lbl_0000A5A0:
/* 0000A5A0 38E70001 */ addi r7, r7, 1
/* 0000A5A4 3908001C */ addi r8, r8, 0x1c
/* 0000A5A8 4200FEF4 */ bdnz lbl_0000A49C
lbl_0000A5AC:
/* 0000A5AC 38000004 */ li r0, 4
/* 0000A5B0 3CDC0001 */ addis r6, r28, 1
/* 0000A5B4 7C0903A6 */ mtctr r0
/* 0000A5B8 38C61CA0 */ addi r6, r6, 0x1ca0
lbl_0000A5BC:
/* 0000A5BC A806000C */ lha r0, 0xc(r6)
/* 0000A5C0 2C000000 */ cmpwi r0, 0
/* 0000A5C4 41810030 */ bgt lbl_0000A5F4
/* 0000A5C8 80B70000 */ lwz r5, 0(r23)
/* 0000A5CC 38600078 */ li r3, 0x78
/* 0000A5D0 80970004 */ lwz r4, 4(r23)
/* 0000A5D4 7EC00774 */ extsb r0, r22
/* 0000A5D8 90A60000 */ stw r5, 0(r6)
/* 0000A5DC 90860004 */ stw r4, 4(r6)
/* 0000A5E0 80970008 */ lwz r4, 8(r23)
/* 0000A5E4 90860008 */ stw r4, 8(r6)
/* 0000A5E8 B066000C */ sth r3, 0xc(r6)
/* 0000A5EC 9806000E */ stb r0, 0xe(r6)
/* 0000A5F0 4800000C */ b lbl_0000A5FC
lbl_0000A5F4:
/* 0000A5F4 38C60010 */ addi r6, r6, 0x10
/* 0000A5F8 4200FFC4 */ bdnz lbl_0000A5BC
lbl_0000A5FC:
/* 0000A5FC BAA10044 */ lmw r21, 0x44(r1)
/* 0000A600 80010074 */ lwz r0, 0x74(r1)
/* 0000A604 38210070 */ addi r1, r1, 0x70
/* 0000A608 7C0803A6 */ mtlr r0
/* 0000A60C 4E800020 */ blr 
lbl_0000A610:
/* 0000A610 7C0802A6 */ mflr r0
/* 0000A614 3CA00000 */ lis r5, lbl_100004E0@ha
/* 0000A618 90010004 */ stw r0, 4(r1)
/* 0000A61C 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000A620 BF61002C */ stmw r27, 0x2c(r1)
/* 0000A624 3BC50000 */ addi r30, r5, lbl_100004E0@l
/* 0000A628 3CBE0001 */ addis r5, r30, 1
/* 0000A62C 3B830000 */ addi r28, r3, 0
/* 0000A630 80051CE0 */ lwz r0, 0x1ce0(r5)
/* 0000A634 3CA00000 */ lis r5, lbl_00011490@ha
/* 0000A638 3BE50000 */ addi r31, r5, lbl_00011490@l
/* 0000A63C 2C000A28 */ cmpwi r0, 0xa28
/* 0000A640 40800124 */ bge lbl_0000A764
/* 0000A644 38000A28 */ li r0, 0xa28
/* 0000A648 7C0903A6 */ mtctr r0
/* 0000A64C 3BBE0000 */ addi r29, r30, 0
lbl_0000A650:
/* 0000A650 A81D0018 */ lha r0, 0x18(r29)
/* 0000A654 2C000000 */ cmpwi r0, 0
/* 0000A658 41810104 */ bgt lbl_0000A75C
/* 0000A65C 3800001E */ li r0, 0x1e
/* 0000A660 B01D0018 */ sth r0, 0x18(r29)
/* 0000A664 80640000 */ lwz r3, 0(r4)
/* 0000A668 80040004 */ lwz r0, 4(r4)
/* 0000A66C 907D0000 */ stw r3, 0(r29)
/* 0000A670 901D0004 */ stw r0, 4(r29)
/* 0000A674 80040008 */ lwz r0, 8(r4)
/* 0000A678 901D0008 */ stw r0, 8(r29)
/* 0000A67C 4BFF5AE5 */ bl rand
/* 0000A680 6C608000 */ xoris r0, r3, 0x8000
/* 0000A684 C05F3320 */ lfs f2, 0x3320(r31)
/* 0000A688 90010024 */ stw r0, 0x24(r1)
/* 0000A68C 3F604330 */ lis r27, 0x4330
/* 0000A690 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A694 C83F3360 */ lfd f1, 0x3360(r31)
/* 0000A698 93610020 */ stw r27, 0x20(r1)
/* 0000A69C C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A6A0 C8610020 */ lfd f3, 0x20(r1)
/* 0000A6A4 C81F32E0 */ lfd f0, 0x32e0(r31)
/* 0000A6A8 EC632028 */ fsubs f3, f3, f4
/* 0000A6AC EC431024 */ fdivs f2, f3, f2
/* 0000A6B0 FC2100B2 */ fmul f1, f1, f2
/* 0000A6B4 FC000828 */ fsub f0, f0, f1
/* 0000A6B8 FC000018 */ frsp f0, f0
/* 0000A6BC D01D000C */ stfs f0, 0xc(r29)
/* 0000A6C0 4BFF5AA1 */ bl rand
/* 0000A6C4 6C608000 */ xoris r0, r3, 0x8000
/* 0000A6C8 C05F3320 */ lfs f2, 0x3320(r31)
/* 0000A6CC 9001001C */ stw r0, 0x1c(r1)
/* 0000A6D0 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A6D4 C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A6D8 93610018 */ stw r27, 0x18(r1)
/* 0000A6DC C83F3360 */ lfd f1, 0x3360(r31)
/* 0000A6E0 C8610018 */ lfd f3, 0x18(r1)
/* 0000A6E4 C81F32E0 */ lfd f0, 0x32e0(r31)
/* 0000A6E8 EC632028 */ fsubs f3, f3, f4
/* 0000A6EC EC431024 */ fdivs f2, f3, f2
/* 0000A6F0 FC2100B2 */ fmul f1, f1, f2
/* 0000A6F4 FC000828 */ fsub f0, f0, f1
/* 0000A6F8 FC000018 */ frsp f0, f0
/* 0000A6FC D01D0010 */ stfs f0, 0x10(r29)
/* 0000A700 4BFF5A61 */ bl rand
/* 0000A704 6C608000 */ xoris r0, r3, 0x8000
/* 0000A708 C05F3320 */ lfs f2, 0x3320(r31)
/* 0000A70C 90010014 */ stw r0, 0x14(r1)
/* 0000A710 3C600000 */ lis r3, lbl_000146A0@ha
/* 0000A714 C8830000 */ lfd f4, lbl_000146A0@l(r3)
/* 0000A718 7F800774 */ extsb r0, r28
/* 0000A71C 93610010 */ stw r27, 0x10(r1)
/* 0000A720 C83F3360 */ lfd f1, 0x3360(r31)
/* 0000A724 3C9E0001 */ addis r4, r30, 1
/* 0000A728 C8610010 */ lfd f3, 0x10(r1)
/* 0000A72C C81F32E0 */ lfd f0, 0x32e0(r31)
/* 0000A730 EC632028 */ fsubs f3, f3, f4
/* 0000A734 EC431024 */ fdivs f2, f3, f2
/* 0000A738 FC2100B2 */ fmul f1, f1, f2
/* 0000A73C FC000828 */ fsub f0, f0, f1
/* 0000A740 FC000018 */ frsp f0, f0
/* 0000A744 D01D0014 */ stfs f0, 0x14(r29)
/* 0000A748 981D001A */ stb r0, 0x1a(r29)
/* 0000A74C 80641CE0 */ lwz r3, 0x1ce0(r4)
/* 0000A750 38030001 */ addi r0, r3, 1
/* 0000A754 90041CE0 */ stw r0, 0x1ce0(r4)
/* 0000A758 4800000C */ b lbl_0000A764
lbl_0000A75C:
/* 0000A75C 3BBD001C */ addi r29, r29, 0x1c
/* 0000A760 4200FEF0 */ bdnz lbl_0000A650
lbl_0000A764:
/* 0000A764 BB61002C */ lmw r27, 0x2c(r1)
/* 0000A768 80010044 */ lwz r0, 0x44(r1)
/* 0000A76C 38210040 */ addi r1, r1, 0x40
/* 0000A770 7C0803A6 */ mtlr r0
/* 0000A774 4E800020 */ blr 
lbl_0000A778:
/* 0000A778 7C0802A6 */ mflr r0
/* 0000A77C 3CE00000 */ lis r7, lbl_000147F8@ha
/* 0000A780 90010004 */ stw r0, 4(r1)
/* 0000A784 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000A788 93E1002C */ stw r31, 0x2c(r1)
/* 0000A78C 93C10028 */ stw r30, 0x28(r1)
/* 0000A790 93A10024 */ stw r29, 0x24(r1)
/* 0000A794 7CDD3378 */ mr r29, r6
/* 0000A798 93810020 */ stw r28, 0x20(r1)
/* 0000A79C 7CBC2B78 */ mr r28, r5
/* 0000A7A0 C0040000 */ lfs f0, 0(r4)
/* 0000A7A4 C8270000 */ lfd f1, lbl_000147F8@l(r7)
/* 0000A7A8 FC010032 */ fmul f0, f1, f0
/* 0000A7AC FC00001E */ fctiwz f0, f0
/* 0000A7B0 D8010018 */ stfd f0, 0x18(r1)
/* 0000A7B4 83C1001C */ lwz r30, 0x1c(r1)
/* 0000A7B8 4BFF59A9 */ bl func_8002B610
/* 0000A7BC 3BE30000 */ addi r31, r3, 0
/* 0000A7C0 5463043E */ clrlwi r3, r3, 0x10
/* 0000A7C4 389C0064 */ addi r4, r28, 0x64
/* 0000A7C8 4BFF5999 */ bl func_8002C100
/* 0000A7CC 389E0000 */ addi r4, r30, 0
/* 0000A7D0 57E3043E */ clrlwi r3, r31, 0x10
/* 0000A7D4 38A0FFC1 */ li r5, -63
/* 0000A7D8 4BFF5989 */ bl SoundPan
/* 0000A7DC 57E3043E */ clrlwi r3, r31, 0x10
/* 0000A7E0 389D0000 */ addi r4, r29, 0
/* 0000A7E4 4BFF597D */ bl SoundPitch
/* 0000A7E8 80010034 */ lwz r0, 0x34(r1)
/* 0000A7EC 83E1002C */ lwz r31, 0x2c(r1)
/* 0000A7F0 83C10028 */ lwz r30, 0x28(r1)
/* 0000A7F4 7C0803A6 */ mtlr r0
/* 0000A7F8 83A10024 */ lwz r29, 0x24(r1)
/* 0000A7FC 83810020 */ lwz r28, 0x20(r1)
/* 0000A800 38210030 */ addi r1, r1, 0x30
/* 0000A804 4E800020 */ blr 
lbl_0000A808:
/* 0000A808 38A00000 */ li r5, 0
/* 0000A80C 2C05000A */ cmpwi r5, 0xa
/* 0000A810 4C800020 */ bgelr 
/* 0000A814 3C600000 */ lis r3, lbl_10018510@ha
/* 0000A818 38830000 */ addi r4, r3, lbl_10018510@l
/* 0000A81C 38600000 */ li r3, 0
/* 0000A820 90640000 */ stw r3, 0(r4)
/* 0000A824 38A00008 */ li r5, 8
/* 0000A828 90640184 */ stw r3, 0x184(r4)
/* 0000A82C 90640308 */ stw r3, 0x308(r4)
/* 0000A830 9064048C */ stw r3, 0x48c(r4)
/* 0000A834 90640610 */ stw r3, 0x610(r4)
/* 0000A838 90640794 */ stw r3, 0x794(r4)
/* 0000A83C 90640918 */ stw r3, 0x918(r4)
/* 0000A840 90640A9C */ stw r3, 0xa9c(r4)
/* 0000A844 48000024 */ b lbl_0000A868
lbl_0000A848:
/* 0000A848 2005000A */ subfic r0, r5, 0xa
/* 0000A84C 2C05000A */ cmpwi r5, 0xa
/* 0000A850 7C0903A6 */ mtctr r0
/* 0000A854 4C800020 */ bgelr 
lbl_0000A858:
/* 0000A858 90640000 */ stw r3, 0(r4)
/* 0000A85C 38840184 */ addi r4, r4, 0x184
/* 0000A860 4200FFF8 */ bdnz lbl_0000A858
/* 0000A864 4E800020 */ blr 
lbl_0000A868:
/* 0000A868 1C050184 */ mulli r0, r5, 0x184
/* 0000A86C 7C840214 */ add r4, r4, r0
/* 0000A870 4BFFFFD8 */ b lbl_0000A848
/* 0000A874 4E800020 */ blr 
lbl_0000A878:
/* 0000A878 7C0802A6 */ mflr r0
/* 0000A87C 3C800000 */ lis r4, gamePauseStatus@ha
/* 0000A880 90010004 */ stw r0, 4(r1)
/* 0000A884 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000A888 93E10034 */ stw r31, 0x34(r1)
/* 0000A88C 93C10030 */ stw r30, 0x30(r1)
/* 0000A890 93A1002C */ stw r29, 0x2c(r1)
/* 0000A894 93810028 */ stw r28, 0x28(r1)
/* 0000A898 3B830000 */ addi r28, r3, 0
/* 0000A89C 80040000 */ lwz r0, gamePauseStatus@l(r4)
/* 0000A8A0 3C800000 */ lis r4, lbl_00014800@ha
/* 0000A8A4 3BE40000 */ addi r31, r4, lbl_00014800@l
/* 0000A8A8 7000000A */ andi. r0, r0, 0xa
/* 0000A8AC 408201E0 */ bne lbl_0000AA8C
/* 0000A8B0 3C600000 */ lis r3, lbl_10018510@ha
/* 0000A8B4 38030000 */ addi r0, r3, lbl_10018510@l
/* 0000A8B8 7C1D0378 */ mr r29, r0
/* 0000A8BC 3BC00000 */ li r30, 0
lbl_0000A8C0:
/* 0000A8C0 807D0000 */ lwz r3, 0(r29)
/* 0000A8C4 28030000 */ cmplwi r3, 0
/* 0000A8C8 418201B4 */ beq lbl_0000AA7C
/* 0000A8CC 546006F9 */ rlwinm. r0, r3, 0, 0x1b, 0x1c
/* 0000A8D0 408201AC */ bne lbl_0000AA7C
/* 0000A8D4 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0000A8D8 4082017C */ bne lbl_0000AA54
/* 0000A8DC C83F03C0 */ lfd f1, 0x3c0(r31)
/* 0000A8E0 387D013C */ addi r3, r29, 0x13c
/* 0000A8E4 C01D0130 */ lfs f0, 0x130(r29)
/* 0000A8E8 FC010032 */ fmul f0, f1, f0
/* 0000A8EC FC000018 */ frsp f0, f0
/* 0000A8F0 D01D0130 */ stfs f0, 0x130(r29)
/* 0000A8F4 C83F03C0 */ lfd f1, 0x3c0(r31)
/* 0000A8F8 C01D0134 */ lfs f0, 0x134(r29)
/* 0000A8FC FC010032 */ fmul f0, f1, f0
/* 0000A900 FC000018 */ frsp f0, f0
/* 0000A904 D01D0134 */ stfs f0, 0x134(r29)
/* 0000A908 C83F03C0 */ lfd f1, 0x3c0(r31)
/* 0000A90C C01D0138 */ lfs f0, 0x138(r29)
/* 0000A910 FC010032 */ fmul f0, f1, f0
/* 0000A914 FC000018 */ frsp f0, f0
/* 0000A918 D01D0138 */ stfs f0, 0x138(r29)
/* 0000A91C C83F03C0 */ lfd f1, 0x3c0(r31)
/* 0000A920 C01D013C */ lfs f0, 0x13c(r29)
/* 0000A924 FC010032 */ fmul f0, f1, f0
/* 0000A928 FC000018 */ frsp f0, f0
/* 0000A92C D01D013C */ stfs f0, 0x13c(r29)
/* 0000A930 C83F03C0 */ lfd f1, 0x3c0(r31)
/* 0000A934 C01D0140 */ lfs f0, 0x140(r29)
/* 0000A938 FC010032 */ fmul f0, f1, f0
/* 0000A93C FC000018 */ frsp f0, f0
/* 0000A940 D01D0140 */ stfs f0, 0x140(r29)
/* 0000A944 C83F03C0 */ lfd f1, 0x3c0(r31)
/* 0000A948 C01D0144 */ lfs f0, 0x144(r29)
/* 0000A94C FC010032 */ fmul f0, f1, f0
/* 0000A950 FC000018 */ frsp f0, f0
/* 0000A954 D01D0144 */ stfs f0, 0x144(r29)
/* 0000A958 C03D0134 */ lfs f1, 0x134(r29)
/* 0000A95C C81F03C8 */ lfd f0, 0x3c8(r31)
/* 0000A960 FC010028 */ fsub f0, f1, f0
/* 0000A964 FC000018 */ frsp f0, f0
/* 0000A968 D01D0134 */ stfs f0, 0x134(r29)
/* 0000A96C C03D0130 */ lfs f1, 0x130(r29)
/* 0000A970 C01D0124 */ lfs f0, 0x124(r29)
/* 0000A974 EC01002A */ fadds f0, f1, f0
/* 0000A978 D01D0124 */ stfs f0, 0x124(r29)
/* 0000A97C C03D0134 */ lfs f1, 0x134(r29)
/* 0000A980 C01D0128 */ lfs f0, 0x128(r29)
/* 0000A984 EC01002A */ fadds f0, f1, f0
/* 0000A988 D01D0128 */ stfs f0, 0x128(r29)
/* 0000A98C C03D0138 */ lfs f1, 0x138(r29)
/* 0000A990 C01D012C */ lfs f0, 0x12c(r29)
/* 0000A994 EC01002A */ fadds f0, f1, f0
/* 0000A998 D01D012C */ stfs f0, 0x12c(r29)
/* 0000A99C C0430000 */ lfs f2, 0(r3)
/* 0000A9A0 C0230004 */ lfs f1, 4(r3)
/* 0000A9A4 C0030008 */ lfs f0, 8(r3)
/* 0000A9A8 EC4200B2 */ fmuls f2, f2, f2
/* 0000A9AC EC41107A */ fmadds f2, f1, f1, f2
/* 0000A9B0 EC40103A */ fmadds f2, f0, f0, f2
/* 0000A9B4 C81F03D0 */ lfd f0, 0x3d0(r31)
/* 0000A9B8 FC201090 */ fmr f1, f2
/* 0000A9BC FC010040 */ fcmpo cr0, f1, f0
/* 0000A9C0 40810038 */ ble lbl_0000A9F8
/* 0000A9C4 4BFF579D */ bl mathutil_rsqrt
/* 0000A9C8 C85F03D8 */ lfd f2, 0x3d8(r31)
/* 0000A9CC C01D013C */ lfs f0, 0x13c(r29)
/* 0000A9D0 FC220072 */ fmul f1, f2, f1
/* 0000A9D4 FC200818 */ frsp f1, f1
/* 0000A9D8 EC000072 */ fmuls f0, f0, f1
/* 0000A9DC D01D013C */ stfs f0, 0x13c(r29)
/* 0000A9E0 C01D0140 */ lfs f0, 0x140(r29)
/* 0000A9E4 EC000072 */ fmuls f0, f0, f1
/* 0000A9E8 D01D0140 */ stfs f0, 0x140(r29)
/* 0000A9EC C01D0144 */ lfs f0, 0x144(r29)
/* 0000A9F0 EC000072 */ fmuls f0, f0, f1
/* 0000A9F4 D01D0144 */ stfs f0, 0x144(r29)
lbl_0000A9F8:
/* 0000A9F8 C01D0140 */ lfs f0, 0x140(r29)
/* 0000A9FC FC00001E */ fctiwz f0, f0
/* 0000AA00 D8010020 */ stfd f0, 0x20(r1)
/* 0000AA04 80610024 */ lwz r3, 0x24(r1)
/* 0000AA08 4BFF5759 */ bl mathutil_mtxA_from_rotate_y
/* 0000AA0C C01D013C */ lfs f0, 0x13c(r29)
/* 0000AA10 FC00001E */ fctiwz f0, f0
/* 0000AA14 D8010018 */ stfd f0, 0x18(r1)
/* 0000AA18 8001001C */ lwz r0, 0x1c(r1)
/* 0000AA1C 7C030734 */ extsh r3, r0
/* 0000AA20 4BFF5741 */ bl mathutil_mtxA_rotate_x
/* 0000AA24 C01D0144 */ lfs f0, 0x144(r29)
/* 0000AA28 FC00001E */ fctiwz f0, f0
/* 0000AA2C D8010010 */ stfd f0, 0x10(r1)
/* 0000AA30 80010014 */ lwz r0, 0x14(r1)
/* 0000AA34 7C030734 */ extsh r3, r0
/* 0000AA38 4BFF5729 */ bl mathutil_mtxA_rotate_z
/* 0000AA3C 387D0148 */ addi r3, r29, 0x148
/* 0000AA40 4BFF5721 */ bl mathutil_mtxA_mult_right
/* 0000AA44 387D0148 */ addi r3, r29, 0x148
/* 0000AA48 4BFF5719 */ bl mathutil_mtxA_to_mtx
/* 0000AA4C 7FA3EB78 */ mr r3, r29
/* 0000AA50 48000DF9 */ bl lbl_0000B848
lbl_0000AA54:
/* 0000AA54 387D0000 */ addi r3, r29, 0
/* 0000AA58 389C0000 */ addi r4, r28, 0
/* 0000AA5C 48001775 */ bl lbl_0000C1D0
/* 0000AA60 7FC3F378 */ mr r3, r30
/* 0000AA64 48002045 */ bl lbl_0000CAA8
/* 0000AA68 801D0000 */ lwz r0, 0(r29)
/* 0000AA6C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000AA70 4082000C */ bne lbl_0000AA7C
/* 0000AA74 7FA3EB78 */ mr r3, r29
/* 0000AA78 48000E9D */ bl lbl_0000B914
lbl_0000AA7C:
/* 0000AA7C 3BDE0001 */ addi r30, r30, 1
/* 0000AA80 2C1E000A */ cmpwi r30, 0xa
/* 0000AA84 3BBD0184 */ addi r29, r29, 0x184
/* 0000AA88 4180FE38 */ blt lbl_0000A8C0
lbl_0000AA8C:
/* 0000AA8C 8001003C */ lwz r0, 0x3c(r1)
/* 0000AA90 83E10034 */ lwz r31, 0x34(r1)
/* 0000AA94 83C10030 */ lwz r30, 0x30(r1)
/* 0000AA98 7C0803A6 */ mtlr r0
/* 0000AA9C 83A1002C */ lwz r29, 0x2c(r1)
/* 0000AAA0 83810028 */ lwz r28, 0x28(r1)
/* 0000AAA4 38210038 */ addi r1, r1, 0x38
/* 0000AAA8 4E800020 */ blr 
lbl_0000AAAC:
/* 0000AAAC 7C0802A6 */ mflr r0
/* 0000AAB0 3C600000 */ lis r3, lbl_10018510@ha
/* 0000AAB4 90010004 */ stw r0, 4(r1)
/* 0000AAB8 38030000 */ addi r0, r3, lbl_10018510@l
/* 0000AABC 3CC00000 */ lis r6, lbl_00014800@ha
/* 0000AAC0 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000AAC4 3C800000 */ lis r4, mathutilData@ha
/* 0000AAC8 3C600000 */ lis r3, minigameGma@ha
/* 0000AACC BF410008 */ stmw r26, 8(r1)
/* 0000AAD0 3CA00000 */ lis r5, lbl_801EEC90@ha
/* 0000AAD4 7C1A0378 */ mr r26, r0
/* 0000AAD8 3B860000 */ addi r28, r6, lbl_00014800@l
/* 0000AADC 3BC40000 */ addi r30, r4, mathutilData@l
/* 0000AAE0 3BE30000 */ addi r31, r3, minigameGma@l
/* 0000AAE4 3BA50000 */ addi r29, r5, lbl_801EEC90@l
/* 0000AAE8 3B600000 */ li r27, 0
lbl_0000AAEC:
/* 0000AAEC 801A0000 */ lwz r0, 0(r26)
/* 0000AAF0 28000000 */ cmplwi r0, 0
/* 0000AAF4 41820080 */ beq lbl_0000AB74
/* 0000AAF8 801D0000 */ lwz r0, 0(r29)
/* 0000AAFC 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000AB00 41820014 */ beq lbl_0000AB14
/* 0000AB04 C03A0128 */ lfs f1, 0x128(r26)
/* 0000AB08 C81C03E0 */ lfd f0, 0x3e0(r28)
/* 0000AB0C FC010040 */ fcmpo cr0, f1, f0
/* 0000AB10 41800064 */ blt lbl_0000AB74
lbl_0000AB14:
/* 0000AB14 4BFF564D */ bl mathutil_mtxA_from_mtxB
/* 0000AB18 387A0124 */ addi r3, r26, 0x124
/* 0000AB1C 4BFF5645 */ bl mathutil_mtxA_translate
/* 0000AB20 387A0148 */ addi r3, r26, 0x148
/* 0000AB24 4BFF563D */ bl mathutil_mtxA_mult_right
/* 0000AB28 C03C037C */ lfs f1, 0x37c(r28)
/* 0000AB2C C05C0380 */ lfs f2, 0x380(r28)
/* 0000AB30 C01C0384 */ lfs f0, 0x384(r28)
/* 0000AB34 FC200850 */ fneg f1, f1
/* 0000AB38 FC401050 */ fneg f2, f2
/* 0000AB3C FC600050 */ fneg f3, f0
/* 0000AB40 4BFF5621 */ bl mathutil_mtxA_translate_xyz
/* 0000AB44 807E0000 */ lwz r3, 0(r30)
/* 0000AB48 38800000 */ li r4, 0
/* 0000AB4C 4BFF5615 */ bl GXLoadPosMtxImm
/* 0000AB50 807E0000 */ lwz r3, 0(r30)
/* 0000AB54 38800000 */ li r4, 0
/* 0000AB58 4BFF5609 */ bl GXLoadNrmMtxImm
/* 0000AB5C 807F0000 */ lwz r3, 0(r31)
/* 0000AB60 801C03A0 */ lwz r0, 0x3a0(r28)
/* 0000AB64 80630008 */ lwz r3, 8(r3)
/* 0000AB68 54001838 */ slwi r0, r0, 3
/* 0000AB6C 7C63002E */ lwzx r3, r3, r0
/* 0000AB70 4BFF55F1 */ bl g_avdisp_maybe_draw_model_1
lbl_0000AB74:
/* 0000AB74 3B7B0001 */ addi r27, r27, 1
/* 0000AB78 2C1B000A */ cmpwi r27, 0xa
/* 0000AB7C 3B5A0184 */ addi r26, r26, 0x184
/* 0000AB80 4180FF6C */ blt lbl_0000AAEC
/* 0000AB84 BB410008 */ lmw r26, 8(r1)
/* 0000AB88 80010024 */ lwz r0, 0x24(r1)
/* 0000AB8C 38210020 */ addi r1, r1, 0x20
/* 0000AB90 7C0803A6 */ mtlr r0
/* 0000AB94 4E800020 */ blr 
lbl_0000AB98:
/* 0000AB98 7C0802A6 */ mflr r0
/* 0000AB9C 90010004 */ stw r0, 4(r1)
/* 0000ABA0 7C800774 */ extsb r0, r4
/* 0000ABA4 1CA00184 */ mulli r5, r0, 0x184
/* 0000ABA8 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000ABAC 93E1001C */ stw r31, 0x1c(r1)
/* 0000ABB0 3C800000 */ lis r4, lbl_10018510@ha
/* 0000ABB4 38040000 */ addi r0, r4, lbl_10018510@l
/* 0000ABB8 93C10018 */ stw r30, 0x18(r1)
/* 0000ABBC 3C800000 */ lis r4, lbl_00014800@ha
/* 0000ABC0 3BE00000 */ li r31, 0
/* 0000ABC4 93A10014 */ stw r29, 0x14(r1)
/* 0000ABC8 7FA02A14 */ add r29, r0, r5
/* 0000ABCC 38000003 */ li r0, 3
/* 0000ABD0 901D0000 */ stw r0, 0(r29)
/* 0000ABD4 3BC40000 */ addi r30, r4, lbl_00014800@l
/* 0000ABD8 93FD0178 */ stw r31, 0x178(r29)
/* 0000ABDC 93FD017C */ stw r31, 0x17c(r29)
/* 0000ABE0 80830000 */ lwz r4, 0(r3)
/* 0000ABE4 80030004 */ lwz r0, 4(r3)
/* 0000ABE8 909D0124 */ stw r4, 0x124(r29)
/* 0000ABEC 901D0128 */ stw r0, 0x128(r29)
/* 0000ABF0 80030008 */ lwz r0, 8(r3)
/* 0000ABF4 387D0148 */ addi r3, r29, 0x148
/* 0000ABF8 901D012C */ stw r0, 0x12c(r29)
/* 0000ABFC C01E03E8 */ lfs f0, 0x3e8(r30)
/* 0000AC00 D01D0130 */ stfs f0, 0x130(r29)
/* 0000AC04 C01E03E8 */ lfs f0, 0x3e8(r30)
/* 0000AC08 D01D0134 */ stfs f0, 0x134(r29)
/* 0000AC0C C01E03E8 */ lfs f0, 0x3e8(r30)
/* 0000AC10 D01D0138 */ stfs f0, 0x138(r29)
/* 0000AC14 4BFF554D */ bl mathutil_mtx_from_identity
/* 0000AC18 C01E03E8 */ lfs f0, 0x3e8(r30)
/* 0000AC1C 7FA3EB78 */ mr r3, r29
/* 0000AC20 D01D013C */ stfs f0, 0x13c(r29)
/* 0000AC24 C01E03E8 */ lfs f0, 0x3e8(r30)
/* 0000AC28 D01D0140 */ stfs f0, 0x140(r29)
/* 0000AC2C C01E03E8 */ lfs f0, 0x3e8(r30)
/* 0000AC30 D01D0144 */ stfs f0, 0x144(r29)
/* 0000AC34 B3FD0180 */ sth r31, 0x180(r29)
/* 0000AC38 48000C11 */ bl lbl_0000B848
/* 0000AC3C 7FA3EB78 */ mr r3, r29
/* 0000AC40 48000C09 */ bl lbl_0000B848
/* 0000AC44 80010024 */ lwz r0, 0x24(r1)
/* 0000AC48 83E1001C */ lwz r31, 0x1c(r1)
/* 0000AC4C 83C10018 */ lwz r30, 0x18(r1)
/* 0000AC50 7C0803A6 */ mtlr r0
/* 0000AC54 83A10014 */ lwz r29, 0x14(r1)
/* 0000AC58 38210020 */ addi r1, r1, 0x20
/* 0000AC5C 4E800020 */ blr 
lbl_0000AC60:
/* 0000AC60 3C600000 */ lis r3, lbl_10018510@ha
/* 0000AC64 38A30000 */ addi r5, r3, lbl_10018510@l
/* 0000AC68 80850000 */ lwz r4, 0(r5)
/* 0000AC6C 38600000 */ li r3, 0
/* 0000AC70 38000003 */ li r0, 3
/* 0000AC74 70840005 */ andi. r4, r4, 5
/* 0000AC78 28040005 */ cmplwi r4, 5
/* 0000AC7C 4082000C */ bne lbl_0000AC88
/* 0000AC80 90650000 */ stw r3, 0(r5)
/* 0000AC84 48000008 */ b lbl_0000AC8C
lbl_0000AC88:
/* 0000AC88 90050000 */ stw r0, 0(r5)
lbl_0000AC8C:
/* 0000AC8C 84850184 */ lwzu r4, 0x184(r5)
/* 0000AC90 70840005 */ andi. r4, r4, 5
/* 0000AC94 28040005 */ cmplwi r4, 5
/* 0000AC98 4082000C */ bne lbl_0000ACA4
/* 0000AC9C 90650000 */ stw r3, 0(r5)
/* 0000ACA0 48000008 */ b lbl_0000ACA8
lbl_0000ACA4:
/* 0000ACA4 90050000 */ stw r0, 0(r5)
lbl_0000ACA8:
/* 0000ACA8 84850184 */ lwzu r4, 0x184(r5)
/* 0000ACAC 70840005 */ andi. r4, r4, 5
/* 0000ACB0 28040005 */ cmplwi r4, 5
/* 0000ACB4 4082000C */ bne lbl_0000ACC0
/* 0000ACB8 90650000 */ stw r3, 0(r5)
/* 0000ACBC 48000008 */ b lbl_0000ACC4
lbl_0000ACC0:
/* 0000ACC0 90050000 */ stw r0, 0(r5)
lbl_0000ACC4:
/* 0000ACC4 84850184 */ lwzu r4, 0x184(r5)
/* 0000ACC8 70840005 */ andi. r4, r4, 5
/* 0000ACCC 28040005 */ cmplwi r4, 5
/* 0000ACD0 4082000C */ bne lbl_0000ACDC
/* 0000ACD4 90650000 */ stw r3, 0(r5)
/* 0000ACD8 48000008 */ b lbl_0000ACE0
lbl_0000ACDC:
/* 0000ACDC 90050000 */ stw r0, 0(r5)
lbl_0000ACE0:
/* 0000ACE0 84850184 */ lwzu r4, 0x184(r5)
/* 0000ACE4 70840005 */ andi. r4, r4, 5
/* 0000ACE8 28040005 */ cmplwi r4, 5
/* 0000ACEC 4082000C */ bne lbl_0000ACF8
/* 0000ACF0 90650000 */ stw r3, 0(r5)
/* 0000ACF4 48000008 */ b lbl_0000ACFC
lbl_0000ACF8:
/* 0000ACF8 90050000 */ stw r0, 0(r5)
lbl_0000ACFC:
/* 0000ACFC 84850184 */ lwzu r4, 0x184(r5)
/* 0000AD00 70840005 */ andi. r4, r4, 5
/* 0000AD04 28040005 */ cmplwi r4, 5
/* 0000AD08 4082000C */ bne lbl_0000AD14
/* 0000AD0C 90650000 */ stw r3, 0(r5)
/* 0000AD10 48000008 */ b lbl_0000AD18
lbl_0000AD14:
/* 0000AD14 90050000 */ stw r0, 0(r5)
lbl_0000AD18:
/* 0000AD18 84850184 */ lwzu r4, 0x184(r5)
/* 0000AD1C 70840005 */ andi. r4, r4, 5
/* 0000AD20 28040005 */ cmplwi r4, 5
/* 0000AD24 4082000C */ bne lbl_0000AD30
/* 0000AD28 90650000 */ stw r3, 0(r5)
/* 0000AD2C 48000008 */ b lbl_0000AD34
lbl_0000AD30:
/* 0000AD30 90050000 */ stw r0, 0(r5)
lbl_0000AD34:
/* 0000AD34 84850184 */ lwzu r4, 0x184(r5)
/* 0000AD38 70840005 */ andi. r4, r4, 5
/* 0000AD3C 28040005 */ cmplwi r4, 5
/* 0000AD40 4082000C */ bne lbl_0000AD4C
/* 0000AD44 90650000 */ stw r3, 0(r5)
/* 0000AD48 48000008 */ b lbl_0000AD50
lbl_0000AD4C:
/* 0000AD4C 90050000 */ stw r0, 0(r5)
lbl_0000AD50:
/* 0000AD50 84850184 */ lwzu r4, 0x184(r5)
/* 0000AD54 70840005 */ andi. r4, r4, 5
/* 0000AD58 28040005 */ cmplwi r4, 5
/* 0000AD5C 4082000C */ bne lbl_0000AD68
/* 0000AD60 90650000 */ stw r3, 0(r5)
/* 0000AD64 48000008 */ b lbl_0000AD6C
lbl_0000AD68:
/* 0000AD68 90050000 */ stw r0, 0(r5)
lbl_0000AD6C:
/* 0000AD6C 84850184 */ lwzu r4, 0x184(r5)
/* 0000AD70 70840005 */ andi. r4, r4, 5
/* 0000AD74 28040005 */ cmplwi r4, 5
/* 0000AD78 4082000C */ bne lbl_0000AD84
/* 0000AD7C 90650000 */ stw r3, 0(r5)
/* 0000AD80 4E800020 */ blr 
lbl_0000AD84:
/* 0000AD84 90050000 */ stw r0, 0(r5)
/* 0000AD88 4E800020 */ blr 
lbl_0000AD8C:
/* 0000AD8C 3C800000 */ lis r4, lbl_10018510@ha
/* 0000AD90 38000005 */ li r0, 5
/* 0000AD94 38840000 */ addi r4, r4, lbl_10018510@l
/* 0000AD98 7C0903A6 */ mtctr r0
/* 0000AD9C 3CA00000 */ lis r5, lbl_00014800@ha
/* 0000ADA0 39440000 */ addi r10, r4, 0
/* 0000ADA4 38A50000 */ addi r5, r5, lbl_00014800@l
/* 0000ADA8 38E00000 */ li r7, 0
/* 0000ADAC 39000000 */ li r8, 0
/* 0000ADB0 39200000 */ li r9, 0
lbl_0000ADB4:
/* 0000ADB4 808A0000 */ lwz r4, 0(r10)
/* 0000ADB8 548007FF */ clrlwi. r0, r4, 0x1f
/* 0000ADBC 4182009C */ beq lbl_0000AE58
/* 0000ADC0 54800734 */ rlwinm r0, r4, 0, 0x1c, 0x1a
/* 0000ADC4 900A0000 */ stw r0, 0(r10)
/* 0000ADC8 80CA0000 */ lwz r6, 0(r10)
/* 0000ADCC 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 0000ADD0 40820020 */ bne lbl_0000ADF0
/* 0000ADD4 60C00002 */ ori r0, r6, 2
/* 0000ADD8 38800001 */ li r4, 1
/* 0000ADDC 900A0000 */ stw r0, 0(r10)
/* 0000ADE0 7C804830 */ slw r0, r4, r9
/* 0000ADE4 7CE70378 */ or r7, r7, r0
/* 0000ADE8 39080001 */ addi r8, r8, 1
/* 0000ADEC 4800006C */ b lbl_0000AE58
lbl_0000ADF0:
/* 0000ADF0 808A0178 */ lwz r4, 0x178(r10)
/* 0000ADF4 80050378 */ lwz r0, 0x378(r5)
/* 0000ADF8 7C040040 */ cmplw r4, r0
/* 0000ADFC 40820050 */ bne lbl_0000AE4C
/* 0000AE00 54C007BD */ rlwinm. r0, r6, 0, 0x1e, 0x1e
/* 0000AE04 41820048 */ beq lbl_0000AE4C
/* 0000AE08 C02A0124 */ lfs f1, 0x124(r10)
/* 0000AE0C C80503F0 */ lfd f0, 0x3f0(r5)
/* 0000AE10 FC010040 */ fcmpo cr0, f1, f0
/* 0000AE14 40800038 */ bge lbl_0000AE4C
/* 0000AE18 C80503F8 */ lfd f0, 0x3f8(r5)
/* 0000AE1C FC010040 */ fcmpo cr0, f1, f0
/* 0000AE20 4081002C */ ble lbl_0000AE4C
/* 0000AE24 60C00002 */ ori r0, r6, 2
/* 0000AE28 900A0000 */ stw r0, 0(r10)
/* 0000AE2C 38000001 */ li r0, 1
/* 0000AE30 7C044830 */ slw r4, r0, r9
/* 0000AE34 800A0000 */ lwz r0, 0(r10)
/* 0000AE38 7CE72378 */ or r7, r7, r4
/* 0000AE3C 39080001 */ addi r8, r8, 1
/* 0000AE40 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 0000AE44 900A0000 */ stw r0, 0(r10)
/* 0000AE48 48000010 */ b lbl_0000AE58
lbl_0000AE4C:
/* 0000AE4C 800A0000 */ lwz r0, 0(r10)
/* 0000AE50 60000004 */ ori r0, r0, 4
/* 0000AE54 900A0000 */ stw r0, 0(r10)
lbl_0000AE58:
/* 0000AE58 848A0184 */ lwzu r4, 0x184(r10)
/* 0000AE5C 39290001 */ addi r9, r9, 1
/* 0000AE60 548007FF */ clrlwi. r0, r4, 0x1f
/* 0000AE64 4182009C */ beq lbl_0000AF00
/* 0000AE68 54800734 */ rlwinm r0, r4, 0, 0x1c, 0x1a
/* 0000AE6C 900A0000 */ stw r0, 0(r10)
/* 0000AE70 80CA0000 */ lwz r6, 0(r10)
/* 0000AE74 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 0000AE78 40820020 */ bne lbl_0000AE98
/* 0000AE7C 60C00002 */ ori r0, r6, 2
/* 0000AE80 38800001 */ li r4, 1
/* 0000AE84 900A0000 */ stw r0, 0(r10)
/* 0000AE88 7C804830 */ slw r0, r4, r9
/* 0000AE8C 7CE70378 */ or r7, r7, r0
/* 0000AE90 39080001 */ addi r8, r8, 1
/* 0000AE94 4800006C */ b lbl_0000AF00
lbl_0000AE98:
/* 0000AE98 808A0178 */ lwz r4, 0x178(r10)
/* 0000AE9C 80050378 */ lwz r0, 0x378(r5)
/* 0000AEA0 7C040040 */ cmplw r4, r0
/* 0000AEA4 40820050 */ bne lbl_0000AEF4
/* 0000AEA8 54C007BD */ rlwinm. r0, r6, 0, 0x1e, 0x1e
/* 0000AEAC 41820048 */ beq lbl_0000AEF4
/* 0000AEB0 C02A0124 */ lfs f1, 0x124(r10)
/* 0000AEB4 C80503F0 */ lfd f0, 0x3f0(r5)
/* 0000AEB8 FC010040 */ fcmpo cr0, f1, f0
/* 0000AEBC 40800038 */ bge lbl_0000AEF4
/* 0000AEC0 C80503F8 */ lfd f0, 0x3f8(r5)
/* 0000AEC4 FC010040 */ fcmpo cr0, f1, f0
/* 0000AEC8 4081002C */ ble lbl_0000AEF4
/* 0000AECC 60C00002 */ ori r0, r6, 2
/* 0000AED0 900A0000 */ stw r0, 0(r10)
/* 0000AED4 38000001 */ li r0, 1
/* 0000AED8 7C044830 */ slw r4, r0, r9
/* 0000AEDC 800A0000 */ lwz r0, 0(r10)
/* 0000AEE0 7CE72378 */ or r7, r7, r4
/* 0000AEE4 39080001 */ addi r8, r8, 1
/* 0000AEE8 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 0000AEEC 900A0000 */ stw r0, 0(r10)
/* 0000AEF0 48000010 */ b lbl_0000AF00
lbl_0000AEF4:
/* 0000AEF4 800A0000 */ lwz r0, 0(r10)
/* 0000AEF8 60000004 */ ori r0, r0, 4
/* 0000AEFC 900A0000 */ stw r0, 0(r10)
lbl_0000AF00:
/* 0000AF00 39290001 */ addi r9, r9, 1
/* 0000AF04 394A0184 */ addi r10, r10, 0x184
/* 0000AF08 4200FEAC */ bdnz lbl_0000ADB4
/* 0000AF0C 99030000 */ stb r8, 0(r3)
/* 0000AF10 7CE33B78 */ mr r3, r7
/* 0000AF14 4E800020 */ blr 
lbl_0000AF18:
/* 0000AF18 3C600000 */ lis r3, lbl_10018510@ha
/* 0000AF1C 38830000 */ addi r4, r3, lbl_10018510@l
/* 0000AF20 80640000 */ lwz r3, 0(r4)
/* 0000AF24 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AF28 4182000C */ beq lbl_0000AF34
/* 0000AF2C 60600004 */ ori r0, r3, 4
/* 0000AF30 90040000 */ stw r0, 0(r4)
lbl_0000AF34:
/* 0000AF34 84640184 */ lwzu r3, 0x184(r4)
/* 0000AF38 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AF3C 4182000C */ beq lbl_0000AF48
/* 0000AF40 60600004 */ ori r0, r3, 4
/* 0000AF44 90040000 */ stw r0, 0(r4)
lbl_0000AF48:
/* 0000AF48 84640184 */ lwzu r3, 0x184(r4)
/* 0000AF4C 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AF50 4182000C */ beq lbl_0000AF5C
/* 0000AF54 60600004 */ ori r0, r3, 4
/* 0000AF58 90040000 */ stw r0, 0(r4)
lbl_0000AF5C:
/* 0000AF5C 84640184 */ lwzu r3, 0x184(r4)
/* 0000AF60 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AF64 4182000C */ beq lbl_0000AF70
/* 0000AF68 60600004 */ ori r0, r3, 4
/* 0000AF6C 90040000 */ stw r0, 0(r4)
lbl_0000AF70:
/* 0000AF70 84640184 */ lwzu r3, 0x184(r4)
/* 0000AF74 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AF78 4182000C */ beq lbl_0000AF84
/* 0000AF7C 60600004 */ ori r0, r3, 4
/* 0000AF80 90040000 */ stw r0, 0(r4)
lbl_0000AF84:
/* 0000AF84 84640184 */ lwzu r3, 0x184(r4)
/* 0000AF88 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AF8C 4182000C */ beq lbl_0000AF98
/* 0000AF90 60600004 */ ori r0, r3, 4
/* 0000AF94 90040000 */ stw r0, 0(r4)
lbl_0000AF98:
/* 0000AF98 84640184 */ lwzu r3, 0x184(r4)
/* 0000AF9C 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AFA0 4182000C */ beq lbl_0000AFAC
/* 0000AFA4 60600004 */ ori r0, r3, 4
/* 0000AFA8 90040000 */ stw r0, 0(r4)
lbl_0000AFAC:
/* 0000AFAC 84640184 */ lwzu r3, 0x184(r4)
/* 0000AFB0 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AFB4 4182000C */ beq lbl_0000AFC0
/* 0000AFB8 60600004 */ ori r0, r3, 4
/* 0000AFBC 90040000 */ stw r0, 0(r4)
lbl_0000AFC0:
/* 0000AFC0 84640184 */ lwzu r3, 0x184(r4)
/* 0000AFC4 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AFC8 4182000C */ beq lbl_0000AFD4
/* 0000AFCC 60600004 */ ori r0, r3, 4
/* 0000AFD0 90040000 */ stw r0, 0(r4)
lbl_0000AFD4:
/* 0000AFD4 84640184 */ lwzu r3, 0x184(r4)
/* 0000AFD8 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000AFDC 4D820020 */ beqlr 
/* 0000AFE0 60600004 */ ori r0, r3, 4
/* 0000AFE4 90040000 */ stw r0, 0(r4)
/* 0000AFE8 4E800020 */ blr 
lbl_0000AFEC:
/* 0000AFEC 3C600000 */ lis r3, lbl_10018510@ha
/* 0000AFF0 38000002 */ li r0, 2
/* 0000AFF4 38630000 */ addi r3, r3, lbl_10018510@l
/* 0000AFF8 7C0903A6 */ mtctr r0
/* 0000AFFC 38A30000 */ addi r5, r3, 0
/* 0000B000 38800000 */ li r4, 0
lbl_0000B004:
/* 0000B004 80650000 */ lwz r3, 0(r5)
/* 0000B008 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B00C 41820014 */ beq lbl_0000B020
/* 0000B010 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B014 4082000C */ bne lbl_0000B020
/* 0000B018 60600010 */ ori r0, r3, 0x10
/* 0000B01C 90050000 */ stw r0, 0(r5)
lbl_0000B020:
/* 0000B020 84650184 */ lwzu r3, 0x184(r5)
/* 0000B024 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B028 41820014 */ beq lbl_0000B03C
/* 0000B02C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B030 4082000C */ bne lbl_0000B03C
/* 0000B034 60600010 */ ori r0, r3, 0x10
/* 0000B038 90050000 */ stw r0, 0(r5)
lbl_0000B03C:
/* 0000B03C 84650184 */ lwzu r3, 0x184(r5)
/* 0000B040 38840001 */ addi r4, r4, 1
/* 0000B044 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B048 41820014 */ beq lbl_0000B05C
/* 0000B04C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B050 4082000C */ bne lbl_0000B05C
/* 0000B054 60600010 */ ori r0, r3, 0x10
/* 0000B058 90050000 */ stw r0, 0(r5)
lbl_0000B05C:
/* 0000B05C 84650184 */ lwzu r3, 0x184(r5)
/* 0000B060 38840001 */ addi r4, r4, 1
/* 0000B064 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B068 41820014 */ beq lbl_0000B07C
/* 0000B06C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B070 4082000C */ bne lbl_0000B07C
/* 0000B074 60600010 */ ori r0, r3, 0x10
/* 0000B078 90050000 */ stw r0, 0(r5)
lbl_0000B07C:
/* 0000B07C 84650184 */ lwzu r3, 0x184(r5)
/* 0000B080 38840001 */ addi r4, r4, 1
/* 0000B084 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B088 41820014 */ beq lbl_0000B09C
/* 0000B08C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B090 4082000C */ bne lbl_0000B09C
/* 0000B094 60600010 */ ori r0, r3, 0x10
/* 0000B098 90050000 */ stw r0, 0(r5)
lbl_0000B09C:
/* 0000B09C 38840001 */ addi r4, r4, 1
/* 0000B0A0 38A50184 */ addi r5, r5, 0x184
/* 0000B0A4 4200FF60 */ bdnz lbl_0000B004
/* 0000B0A8 4E800020 */ blr 
lbl_0000B0AC:
/* 0000B0AC 3C600000 */ lis r3, lbl_10018510@ha
/* 0000B0B0 38000002 */ li r0, 2
/* 0000B0B4 38630000 */ addi r3, r3, lbl_10018510@l
/* 0000B0B8 7C0903A6 */ mtctr r0
/* 0000B0BC 38A30000 */ addi r5, r3, 0
/* 0000B0C0 38800000 */ li r4, 0
lbl_0000B0C4:
/* 0000B0C4 80650000 */ lwz r3, 0(r5)
/* 0000B0C8 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B0CC 41820024 */ beq lbl_0000B0F0
/* 0000B0D0 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B0D4 4082001C */ bne lbl_0000B0F0
/* 0000B0D8 54600734 */ rlwinm r0, r3, 0, 0x1c, 0x1a
/* 0000B0DC 90050000 */ stw r0, 0(r5)
/* 0000B0E0 80050000 */ lwz r0, 0(r5)
/* 0000B0E4 60000008 */ ori r0, r0, 8
/* 0000B0E8 90050000 */ stw r0, 0(r5)
/* 0000B0EC D0250128 */ stfs f1, 0x128(r5)
lbl_0000B0F0:
/* 0000B0F0 84650184 */ lwzu r3, 0x184(r5)
/* 0000B0F4 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B0F8 41820024 */ beq lbl_0000B11C
/* 0000B0FC 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B100 4082001C */ bne lbl_0000B11C
/* 0000B104 54600734 */ rlwinm r0, r3, 0, 0x1c, 0x1a
/* 0000B108 90050000 */ stw r0, 0(r5)
/* 0000B10C 80050000 */ lwz r0, 0(r5)
/* 0000B110 60000008 */ ori r0, r0, 8
/* 0000B114 90050000 */ stw r0, 0(r5)
/* 0000B118 D0250128 */ stfs f1, 0x128(r5)
lbl_0000B11C:
/* 0000B11C 84650184 */ lwzu r3, 0x184(r5)
/* 0000B120 38840001 */ addi r4, r4, 1
/* 0000B124 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B128 41820024 */ beq lbl_0000B14C
/* 0000B12C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B130 4082001C */ bne lbl_0000B14C
/* 0000B134 54600734 */ rlwinm r0, r3, 0, 0x1c, 0x1a
/* 0000B138 90050000 */ stw r0, 0(r5)
/* 0000B13C 80050000 */ lwz r0, 0(r5)
/* 0000B140 60000008 */ ori r0, r0, 8
/* 0000B144 90050000 */ stw r0, 0(r5)
/* 0000B148 D0250128 */ stfs f1, 0x128(r5)
lbl_0000B14C:
/* 0000B14C 84650184 */ lwzu r3, 0x184(r5)
/* 0000B150 38840001 */ addi r4, r4, 1
/* 0000B154 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B158 41820024 */ beq lbl_0000B17C
/* 0000B15C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B160 4082001C */ bne lbl_0000B17C
/* 0000B164 54600734 */ rlwinm r0, r3, 0, 0x1c, 0x1a
/* 0000B168 90050000 */ stw r0, 0(r5)
/* 0000B16C 80050000 */ lwz r0, 0(r5)
/* 0000B170 60000008 */ ori r0, r0, 8
/* 0000B174 90050000 */ stw r0, 0(r5)
/* 0000B178 D0250128 */ stfs f1, 0x128(r5)
lbl_0000B17C:
/* 0000B17C 84650184 */ lwzu r3, 0x184(r5)
/* 0000B180 38840001 */ addi r4, r4, 1
/* 0000B184 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B188 41820024 */ beq lbl_0000B1AC
/* 0000B18C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B190 4082001C */ bne lbl_0000B1AC
/* 0000B194 54600734 */ rlwinm r0, r3, 0, 0x1c, 0x1a
/* 0000B198 90050000 */ stw r0, 0(r5)
/* 0000B19C 80050000 */ lwz r0, 0(r5)
/* 0000B1A0 60000008 */ ori r0, r0, 8
/* 0000B1A4 90050000 */ stw r0, 0(r5)
/* 0000B1A8 D0250128 */ stfs f1, 0x128(r5)
lbl_0000B1AC:
/* 0000B1AC 38840001 */ addi r4, r4, 1
/* 0000B1B0 38A50184 */ addi r5, r5, 0x184
/* 0000B1B4 4200FF10 */ bdnz lbl_0000B0C4
/* 0000B1B8 4E800020 */ blr 
lbl_0000B1BC:
/* 0000B1BC 7C0802A6 */ mflr r0
/* 0000B1C0 3C600000 */ lis r3, lbl_10018510@ha
/* 0000B1C4 90010004 */ stw r0, 4(r1)
/* 0000B1C8 38030000 */ addi r0, r3, lbl_10018510@l
/* 0000B1CC 3C600000 */ lis r3, lbl_00014800@ha
/* 0000B1D0 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000B1D4 DBE10038 */ stfd f31, 0x38(r1)
/* 0000B1D8 FFE00890 */ fmr f31, f1
/* 0000B1DC 93E10034 */ stw r31, 0x34(r1)
/* 0000B1E0 3BE30000 */ addi r31, r3, lbl_00014800@l
/* 0000B1E4 93C10030 */ stw r30, 0x30(r1)
/* 0000B1E8 3BC00000 */ li r30, 0
/* 0000B1EC 93A1002C */ stw r29, 0x2c(r1)
/* 0000B1F0 7C1D0378 */ mr r29, r0
/* 0000B1F4 93810028 */ stw r28, 0x28(r1)
/* 0000B1F8 3F804330 */ lis r28, 0x4330
lbl_0000B1FC:
/* 0000B1FC 807D0000 */ lwz r3, 0(r29)
/* 0000B200 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000B204 4182010C */ beq lbl_0000B310
/* 0000B208 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000B20C 41820104 */ beq lbl_0000B310
/* 0000B210 881F03AC */ lbz r0, 0x3ac(r31)
/* 0000B214 7FA4EB78 */ mr r4, r29
/* 0000B218 C05F03E8 */ lfs f2, 0x3e8(r31)
/* 0000B21C 2C000000 */ cmpwi r0, 0
/* 0000B220 7C0903A6 */ mtctr r0
/* 0000B224 807F03A8 */ lwz r3, 0x3a8(r31)
/* 0000B228 4081002C */ ble lbl_0000B254
lbl_0000B22C:
/* 0000B22C C024000C */ lfs f1, 0xc(r4)
/* 0000B230 C003000C */ lfs f0, 0xc(r3)
/* 0000B234 EC01002A */ fadds f0, f1, f0
/* 0000B238 EC00F828 */ fsubs f0, f0, f31
/* 0000B23C FC001040 */ fcmpo cr0, f0, f2
/* 0000B240 40810008 */ ble lbl_0000B248
/* 0000B244 FC400090 */ fmr f2, f0
lbl_0000B248:
/* 0000B248 38630014 */ addi r3, r3, 0x14
/* 0000B24C 3884000C */ addi r4, r4, 0xc
/* 0000B250 4200FFDC */ bdnz lbl_0000B22C
lbl_0000B254:
/* 0000B254 C81F0400 */ lfd f0, 0x400(r31)
/* 0000B258 FC001000 */ fcmpu cr0, f0, f2
/* 0000B25C 418200B4 */ beq lbl_0000B310
/* 0000B260 801D0000 */ lwz r0, 0(r29)
/* 0000B264 FC001050 */ fneg f0, f2
/* 0000B268 387D0000 */ addi r3, r29, 0
/* 0000B26C 54000734 */ rlwinm r0, r0, 0, 0x1c, 0x1a
/* 0000B270 901D0000 */ stw r0, 0(r29)
/* 0000B274 3881000C */ addi r4, r1, 0xc
/* 0000B278 801D0000 */ lwz r0, 0(r29)
/* 0000B27C 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 0000B280 901D0000 */ stw r0, 0(r29)
/* 0000B284 801D0000 */ lwz r0, 0(r29)
/* 0000B288 60000020 */ ori r0, r0, 0x20
/* 0000B28C 901D0000 */ stw r0, 0(r29)
/* 0000B290 C03F03E8 */ lfs f1, 0x3e8(r31)
/* 0000B294 D021000C */ stfs f1, 0xc(r1)
/* 0000B298 C03F03E8 */ lfs f1, 0x3e8(r31)
/* 0000B29C D0210010 */ stfs f1, 0x10(r1)
/* 0000B2A0 D0010014 */ stfs f0, 0x14(r1)
/* 0000B2A4 48002231 */ bl lbl_0000D4D4
/* 0000B2A8 4BFF4EB9 */ bl rand
/* 0000B2AC 546305FE */ clrlwi r3, r3, 0x17
/* 0000B2B0 C01D013C */ lfs f0, 0x13c(r29)
/* 0000B2B4 3803FF00 */ addi r0, r3, -256  ;# fixed addi
/* 0000B2B8 6C008000 */ xoris r0, r0, 0x8000
/* 0000B2BC 90010024 */ stw r0, 0x24(r1)
/* 0000B2C0 3C600000 */ lis r3, lbl_00014C08@ha
/* 0000B2C4 C8430000 */ lfd f2, lbl_00014C08@l(r3)
/* 0000B2C8 93810020 */ stw r28, 0x20(r1)
/* 0000B2CC C8210020 */ lfd f1, 0x20(r1)
/* 0000B2D0 EC211028 */ fsubs f1, f1, f2
/* 0000B2D4 EC00082A */ fadds f0, f0, f1
/* 0000B2D8 D01D013C */ stfs f0, 0x13c(r29)
/* 0000B2DC 4BFF4E85 */ bl rand
/* 0000B2E0 5463067E */ clrlwi r3, r3, 0x19
/* 0000B2E4 C01D0144 */ lfs f0, 0x144(r29)
/* 0000B2E8 3803FFC0 */ addi r0, r3, -64  ;# fixed addi
/* 0000B2EC 6C008000 */ xoris r0, r0, 0x8000
/* 0000B2F0 9001001C */ stw r0, 0x1c(r1)
/* 0000B2F4 3C600000 */ lis r3, lbl_00014C08@ha
/* 0000B2F8 C8430000 */ lfd f2, lbl_00014C08@l(r3)
/* 0000B2FC 93810018 */ stw r28, 0x18(r1)
/* 0000B300 C8210018 */ lfd f1, 0x18(r1)
/* 0000B304 EC211028 */ fsubs f1, f1, f2
/* 0000B308 EC00082A */ fadds f0, f0, f1
/* 0000B30C D01D0144 */ stfs f0, 0x144(r29)
lbl_0000B310:
/* 0000B310 3BDE0001 */ addi r30, r30, 1
/* 0000B314 2C1E000A */ cmpwi r30, 0xa
/* 0000B318 3BBD0184 */ addi r29, r29, 0x184
/* 0000B31C 4180FEE0 */ blt lbl_0000B1FC
/* 0000B320 80010044 */ lwz r0, 0x44(r1)
/* 0000B324 CBE10038 */ lfd f31, 0x38(r1)
/* 0000B328 83E10034 */ lwz r31, 0x34(r1)
/* 0000B32C 7C0803A6 */ mtlr r0
/* 0000B330 83C10030 */ lwz r30, 0x30(r1)
/* 0000B334 83A1002C */ lwz r29, 0x2c(r1)
/* 0000B338 83810028 */ lwz r28, 0x28(r1)
/* 0000B33C 38210040 */ addi r1, r1, 0x40
/* 0000B340 4E800020 */ blr 
lbl_0000B344:
/* 0000B344 3C600000 */ lis r3, lbl_00014800@ha
/* 0000B348 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000B34C 38C30000 */ addi r6, r3, lbl_00014800@l
/* 0000B350 80A60410 */ lwz r5, 0x410(r6)
/* 0000B354 3800000A */ li r0, 0xa
/* 0000B358 80860414 */ lwz r4, 0x414(r6)
/* 0000B35C 3C600000 */ lis r3, lbl_10018510@ha
/* 0000B360 7C0903A6 */ mtctr r0
/* 0000B364 90A10014 */ stw r5, 0x14(r1)
/* 0000B368 38630000 */ addi r3, r3, lbl_10018510@l
/* 0000B36C 38A30000 */ addi r5, r3, 0
/* 0000B370 90810018 */ stw r4, 0x18(r1)
/* 0000B374 38600001 */ li r3, 1
/* 0000B378 80060418 */ lwz r0, 0x418(r6)
/* 0000B37C 9001001C */ stw r0, 0x1c(r1)
lbl_0000B380:
/* 0000B380 80850000 */ lwz r4, 0(r5)
/* 0000B384 548007FF */ clrlwi. r0, r4, 0x1f
/* 0000B388 418200C8 */ beq lbl_0000B450
/* 0000B38C 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 0000B390 418200C0 */ beq lbl_0000B450
/* 0000B394 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 0000B398 408200B8 */ bne lbl_0000B450
/* 0000B39C C0250128 */ lfs f1, 0x128(r5)
/* 0000B3A0 C8060420 */ lfd f0, 0x420(r6)
/* 0000B3A4 FC010040 */ fcmpo cr0, f1, f0
/* 0000B3A8 418000A8 */ blt lbl_0000B450
/* 0000B3AC C005014C */ lfs f0, 0x14c(r5)
/* 0000B3B0 D0010008 */ stfs f0, 8(r1)
/* 0000B3B4 C005015C */ lfs f0, 0x15c(r5)
/* 0000B3B8 D001000C */ stfs f0, 0xc(r1)
/* 0000B3BC C005016C */ lfs f0, 0x16c(r5)
/* 0000B3C0 D0010010 */ stfs f0, 0x10(r1)
/* 0000B3C4 C0A10014 */ lfs f5, 0x14(r1)
/* 0000B3C8 C0410008 */ lfs f2, 8(r1)
/* 0000B3CC C0810018 */ lfs f4, 0x18(r1)
/* 0000B3D0 C021000C */ lfs f1, 0xc(r1)
/* 0000B3D4 C061001C */ lfs f3, 0x1c(r1)
/* 0000B3D8 C0010010 */ lfs f0, 0x10(r1)
/* 0000B3DC EC4500B2 */ fmuls f2, f5, f2
/* 0000B3E0 EC44107A */ fmadds f2, f4, f1, f2
/* 0000B3E4 EC43103A */ fmadds f2, f3, f0, f2
/* 0000B3E8 C8060428 */ lfd f0, 0x428(r6)
/* 0000B3EC FC020040 */ fcmpo cr0, f2, f0
/* 0000B3F0 4080005C */ bge lbl_0000B44C
/* 0000B3F4 C0250130 */ lfs f1, 0x130(r5)
/* 0000B3F8 C0050134 */ lfs f0, 0x134(r5)
/* 0000B3FC FC400A10 */ fabs f2, f1
/* 0000B400 C0650138 */ lfs f3, 0x138(r5)
/* 0000B404 FC200210 */ fabs f1, f0
/* 0000B408 C8060430 */ lfd f0, 0x430(r6)
/* 0000B40C FC601A10 */ fabs f3, f3
/* 0000B410 FC22082A */ fadd f1, f2, f1
/* 0000B414 FC23082A */ fadd f1, f3, f1
/* 0000B418 FC010040 */ fcmpo cr0, f1, f0
/* 0000B41C 40800030 */ bge lbl_0000B44C
/* 0000B420 C025013C */ lfs f1, 0x13c(r5)
/* 0000B424 C0050140 */ lfs f0, 0x140(r5)
/* 0000B428 FC400A10 */ fabs f2, f1
/* 0000B42C C0650144 */ lfs f3, 0x144(r5)
/* 0000B430 FC200210 */ fabs f1, f0
/* 0000B434 C8060438 */ lfd f0, 0x438(r6)
/* 0000B438 FC601A10 */ fabs f3, f3
/* 0000B43C FC22082A */ fadd f1, f2, f1
/* 0000B440 FC23082A */ fadd f1, f3, f1
/* 0000B444 FC010040 */ fcmpo cr0, f1, f0
/* 0000B448 41800008 */ blt lbl_0000B450
lbl_0000B44C:
/* 0000B44C 38600000 */ li r3, 0
lbl_0000B450:
/* 0000B450 38A50184 */ addi r5, r5, 0x184
/* 0000B454 4200FF2C */ bdnz lbl_0000B380
/* 0000B458 38210020 */ addi r1, r1, 0x20
/* 0000B45C 4E800020 */ blr 
lbl_0000B460:
/* 0000B460 2C030000 */ cmpwi r3, 0
/* 0000B464 3C800000 */ lis r4, lbl_10018510@ha
/* 0000B468 38840000 */ addi r4, r4, lbl_10018510@l
/* 0000B46C 4D800020 */ bltlr 
/* 0000B470 2C030001 */ cmpwi r3, 1
/* 0000B474 4D810020 */ bgtlr 
/* 0000B478 39200000 */ li r9, 0
/* 0000B47C 2C09000A */ cmpwi r9, 0xa
/* 0000B480 4C800020 */ bgelr 
/* 0000B484 1C030F28 */ mulli r0, r3, 0xf28
/* 0000B488 7C640214 */ add r3, r4, r0
/* 0000B48C 38000030 */ li r0, 0x30
/* 0000B490 39030F20 */ addi r8, r3, 0xf20
/* 0000B494 7C0903A6 */ mtctr r0
/* 0000B498 38630F28 */ addi r3, r3, 0xf28
/* 0000B49C 38C4FFF8 */ addi r6, r4, -8  ;# fixed addi
lbl_0000B4A0:
/* 0000B4A0 84A60008 */ lwzu r5, 8(r6)
/* 0000B4A4 80060004 */ lwz r0, 4(r6)
/* 0000B4A8 94A80008 */ stwu r5, 8(r8)
/* 0000B4AC 90080004 */ stw r0, 4(r8)
/* 0000B4B0 4200FFF0 */ bdnz lbl_0000B4A0
/* 0000B4B4 80A60008 */ lwz r5, 8(r6)
/* 0000B4B8 38000030 */ li r0, 0x30
/* 0000B4BC 7C0903A6 */ mtctr r0
/* 0000B4C0 38E3017C */ addi r7, r3, 0x17c
/* 0000B4C4 90A80008 */ stw r5, 8(r8)
/* 0000B4C8 38C4017C */ addi r6, r4, 0x17c
lbl_0000B4CC:
/* 0000B4CC 84A60008 */ lwzu r5, 8(r6)
/* 0000B4D0 80060004 */ lwz r0, 4(r6)
/* 0000B4D4 94A70008 */ stwu r5, 8(r7)
/* 0000B4D8 90070004 */ stw r0, 4(r7)
/* 0000B4DC 4200FFF0 */ bdnz lbl_0000B4CC
/* 0000B4E0 80A60008 */ lwz r5, 8(r6)
/* 0000B4E4 38000030 */ li r0, 0x30
/* 0000B4E8 7C0903A6 */ mtctr r0
/* 0000B4EC 39030300 */ addi r8, r3, 0x300
/* 0000B4F0 90A70008 */ stw r5, 8(r7)
/* 0000B4F4 38C40300 */ addi r6, r4, 0x300
lbl_0000B4F8:
/* 0000B4F8 84A60008 */ lwzu r5, 8(r6)
/* 0000B4FC 80060004 */ lwz r0, 4(r6)
/* 0000B500 94A80008 */ stwu r5, 8(r8)
/* 0000B504 90080004 */ stw r0, 4(r8)
/* 0000B508 4200FFF0 */ bdnz lbl_0000B4F8
/* 0000B50C 80A60008 */ lwz r5, 8(r6)
/* 0000B510 38000030 */ li r0, 0x30
/* 0000B514 7C0903A6 */ mtctr r0
/* 0000B518 38E30484 */ addi r7, r3, 0x484
/* 0000B51C 90A80008 */ stw r5, 8(r8)
/* 0000B520 38C40484 */ addi r6, r4, 0x484
lbl_0000B524:
/* 0000B524 84A60008 */ lwzu r5, 8(r6)
/* 0000B528 80060004 */ lwz r0, 4(r6)
/* 0000B52C 94A70008 */ stwu r5, 8(r7)
/* 0000B530 90070004 */ stw r0, 4(r7)
/* 0000B534 4200FFF0 */ bdnz lbl_0000B524
/* 0000B538 80A60008 */ lwz r5, 8(r6)
/* 0000B53C 38000030 */ li r0, 0x30
/* 0000B540 7C0903A6 */ mtctr r0
/* 0000B544 39030608 */ addi r8, r3, 0x608
/* 0000B548 90A70008 */ stw r5, 8(r7)
/* 0000B54C 38C40608 */ addi r6, r4, 0x608
lbl_0000B550:
/* 0000B550 84A60008 */ lwzu r5, 8(r6)
/* 0000B554 80060004 */ lwz r0, 4(r6)
/* 0000B558 94A80008 */ stwu r5, 8(r8)
/* 0000B55C 90080004 */ stw r0, 4(r8)
/* 0000B560 4200FFF0 */ bdnz lbl_0000B550
/* 0000B564 80A60008 */ lwz r5, 8(r6)
/* 0000B568 38000030 */ li r0, 0x30
/* 0000B56C 7C0903A6 */ mtctr r0
/* 0000B570 38E3078C */ addi r7, r3, 0x78c
/* 0000B574 90A80008 */ stw r5, 8(r8)
/* 0000B578 38C4078C */ addi r6, r4, 0x78c
lbl_0000B57C:
/* 0000B57C 84A60008 */ lwzu r5, 8(r6)
/* 0000B580 80060004 */ lwz r0, 4(r6)
/* 0000B584 94A70008 */ stwu r5, 8(r7)
/* 0000B588 90070004 */ stw r0, 4(r7)
/* 0000B58C 4200FFF0 */ bdnz lbl_0000B57C
/* 0000B590 80A60008 */ lwz r5, 8(r6)
/* 0000B594 38000030 */ li r0, 0x30
/* 0000B598 7C0903A6 */ mtctr r0
/* 0000B59C 39030910 */ addi r8, r3, 0x910
/* 0000B5A0 90A70008 */ stw r5, 8(r7)
/* 0000B5A4 38C40910 */ addi r6, r4, 0x910
lbl_0000B5A8:
/* 0000B5A8 84A60008 */ lwzu r5, 8(r6)
/* 0000B5AC 80060004 */ lwz r0, 4(r6)
/* 0000B5B0 94A80008 */ stwu r5, 8(r8)
/* 0000B5B4 90080004 */ stw r0, 4(r8)
/* 0000B5B8 4200FFF0 */ bdnz lbl_0000B5A8
/* 0000B5BC 80A60008 */ lwz r5, 8(r6)
/* 0000B5C0 38000030 */ li r0, 0x30
/* 0000B5C4 7C0903A6 */ mtctr r0
/* 0000B5C8 38E30A94 */ addi r7, r3, 0xa94
/* 0000B5CC 90A80008 */ stw r5, 8(r8)
/* 0000B5D0 38C40A94 */ addi r6, r4, 0xa94
lbl_0000B5D4:
/* 0000B5D4 84A60008 */ lwzu r5, 8(r6)
/* 0000B5D8 80060004 */ lwz r0, 4(r6)
/* 0000B5DC 94A70008 */ stwu r5, 8(r7)
/* 0000B5E0 90070004 */ stw r0, 4(r7)
/* 0000B5E4 4200FFF0 */ bdnz lbl_0000B5D4
/* 0000B5E8 80060008 */ lwz r0, 8(r6)
/* 0000B5EC 39200008 */ li r9, 8
/* 0000B5F0 90070008 */ stw r0, 8(r7)
/* 0000B5F4 4800004C */ b lbl_0000B640
lbl_0000B5F8:
/* 0000B5F8 38800030 */ li r4, 0x30
/* 0000B5FC 48000038 */ b lbl_0000B634
lbl_0000B600:
/* 0000B600 7C8903A6 */ mtctr r4
/* 0000B604 38C8FFF8 */ addi r6, r8, -8  ;# fixed addi
/* 0000B608 38A7FFF8 */ addi r5, r7, -8  ;# fixed addi
lbl_0000B60C:
/* 0000B60C 84650008 */ lwzu r3, 8(r5)
/* 0000B610 80050004 */ lwz r0, 4(r5)
/* 0000B614 94660008 */ stwu r3, 8(r6)
/* 0000B618 90060004 */ stw r0, 4(r6)
/* 0000B61C 4200FFF0 */ bdnz lbl_0000B60C
/* 0000B620 80050008 */ lwz r0, 8(r5)
/* 0000B624 39290001 */ addi r9, r9, 1
/* 0000B628 38E70184 */ addi r7, r7, 0x184
/* 0000B62C 90060008 */ stw r0, 8(r6)
/* 0000B630 39080184 */ addi r8, r8, 0x184
lbl_0000B634:
/* 0000B634 2C09000A */ cmpwi r9, 0xa
/* 0000B638 4180FFC8 */ blt lbl_0000B600
/* 0000B63C 4E800020 */ blr 
lbl_0000B640:
/* 0000B640 1C090184 */ mulli r0, r9, 0x184
/* 0000B644 7CE40214 */ add r7, r4, r0
/* 0000B648 7D030214 */ add r8, r3, r0
/* 0000B64C 4BFFFFAC */ b lbl_0000B5F8
/* 0000B650 4E800020 */ blr 
lbl_0000B654:
/* 0000B654 2C030000 */ cmpwi r3, 0
/* 0000B658 3C800000 */ lis r4, lbl_10018510@ha
/* 0000B65C 38840000 */ addi r4, r4, lbl_10018510@l
/* 0000B660 4D800020 */ bltlr 
/* 0000B664 2C030001 */ cmpwi r3, 1
/* 0000B668 4D810020 */ bgtlr 
/* 0000B66C 39200000 */ li r9, 0
/* 0000B670 2C09000A */ cmpwi r9, 0xa
/* 0000B674 4C800020 */ bgelr 
/* 0000B678 1C030F28 */ mulli r0, r3, 0xf28
/* 0000B67C 7C640214 */ add r3, r4, r0
/* 0000B680 38000030 */ li r0, 0x30
/* 0000B684 38C30F20 */ addi r6, r3, 0xf20
/* 0000B688 7C0903A6 */ mtctr r0
/* 0000B68C 3904FFF8 */ addi r8, r4, -8  ;# fixed addi
/* 0000B690 38630F28 */ addi r3, r3, 0xf28
lbl_0000B694:
/* 0000B694 84A60008 */ lwzu r5, 8(r6)
/* 0000B698 80060004 */ lwz r0, 4(r6)
/* 0000B69C 94A80008 */ stwu r5, 8(r8)
/* 0000B6A0 90080004 */ stw r0, 4(r8)
/* 0000B6A4 4200FFF0 */ bdnz lbl_0000B694
/* 0000B6A8 80A60008 */ lwz r5, 8(r6)
/* 0000B6AC 38000030 */ li r0, 0x30
/* 0000B6B0 7C0903A6 */ mtctr r0
/* 0000B6B4 38E4017C */ addi r7, r4, 0x17c
/* 0000B6B8 90A80008 */ stw r5, 8(r8)
/* 0000B6BC 38C3017C */ addi r6, r3, 0x17c
lbl_0000B6C0:
/* 0000B6C0 84A60008 */ lwzu r5, 8(r6)
/* 0000B6C4 80060004 */ lwz r0, 4(r6)
/* 0000B6C8 94A70008 */ stwu r5, 8(r7)
/* 0000B6CC 90070004 */ stw r0, 4(r7)
/* 0000B6D0 4200FFF0 */ bdnz lbl_0000B6C0
/* 0000B6D4 80A60008 */ lwz r5, 8(r6)
/* 0000B6D8 38000030 */ li r0, 0x30
/* 0000B6DC 7C0903A6 */ mtctr r0
/* 0000B6E0 39040300 */ addi r8, r4, 0x300
/* 0000B6E4 90A70008 */ stw r5, 8(r7)
/* 0000B6E8 38C30300 */ addi r6, r3, 0x300
lbl_0000B6EC:
/* 0000B6EC 84A60008 */ lwzu r5, 8(r6)
/* 0000B6F0 80060004 */ lwz r0, 4(r6)
/* 0000B6F4 94A80008 */ stwu r5, 8(r8)
/* 0000B6F8 90080004 */ stw r0, 4(r8)
/* 0000B6FC 4200FFF0 */ bdnz lbl_0000B6EC
/* 0000B700 80A60008 */ lwz r5, 8(r6)
/* 0000B704 38000030 */ li r0, 0x30
/* 0000B708 7C0903A6 */ mtctr r0
/* 0000B70C 38E40484 */ addi r7, r4, 0x484
/* 0000B710 90A80008 */ stw r5, 8(r8)
/* 0000B714 38C30484 */ addi r6, r3, 0x484
lbl_0000B718:
/* 0000B718 84A60008 */ lwzu r5, 8(r6)
/* 0000B71C 80060004 */ lwz r0, 4(r6)
/* 0000B720 94A70008 */ stwu r5, 8(r7)
/* 0000B724 90070004 */ stw r0, 4(r7)
/* 0000B728 4200FFF0 */ bdnz lbl_0000B718
/* 0000B72C 80A60008 */ lwz r5, 8(r6)
/* 0000B730 38000030 */ li r0, 0x30
/* 0000B734 7C0903A6 */ mtctr r0
/* 0000B738 39040608 */ addi r8, r4, 0x608
/* 0000B73C 90A70008 */ stw r5, 8(r7)
/* 0000B740 38C30608 */ addi r6, r3, 0x608
lbl_0000B744:
/* 0000B744 84A60008 */ lwzu r5, 8(r6)
/* 0000B748 80060004 */ lwz r0, 4(r6)
/* 0000B74C 94A80008 */ stwu r5, 8(r8)
/* 0000B750 90080004 */ stw r0, 4(r8)
/* 0000B754 4200FFF0 */ bdnz lbl_0000B744
/* 0000B758 80A60008 */ lwz r5, 8(r6)
/* 0000B75C 38000030 */ li r0, 0x30
/* 0000B760 7C0903A6 */ mtctr r0
/* 0000B764 38E4078C */ addi r7, r4, 0x78c
/* 0000B768 90A80008 */ stw r5, 8(r8)
/* 0000B76C 38C3078C */ addi r6, r3, 0x78c
lbl_0000B770:
/* 0000B770 84A60008 */ lwzu r5, 8(r6)
/* 0000B774 80060004 */ lwz r0, 4(r6)
/* 0000B778 94A70008 */ stwu r5, 8(r7)
/* 0000B77C 90070004 */ stw r0, 4(r7)
/* 0000B780 4200FFF0 */ bdnz lbl_0000B770
/* 0000B784 80A60008 */ lwz r5, 8(r6)
/* 0000B788 38000030 */ li r0, 0x30
/* 0000B78C 7C0903A6 */ mtctr r0
/* 0000B790 39040910 */ addi r8, r4, 0x910
/* 0000B794 90A70008 */ stw r5, 8(r7)
/* 0000B798 38C30910 */ addi r6, r3, 0x910
lbl_0000B79C:
/* 0000B79C 84A60008 */ lwzu r5, 8(r6)
/* 0000B7A0 80060004 */ lwz r0, 4(r6)
/* 0000B7A4 94A80008 */ stwu r5, 8(r8)
/* 0000B7A8 90080004 */ stw r0, 4(r8)
/* 0000B7AC 4200FFF0 */ bdnz lbl_0000B79C
/* 0000B7B0 80A60008 */ lwz r5, 8(r6)
/* 0000B7B4 38000030 */ li r0, 0x30
/* 0000B7B8 7C0903A6 */ mtctr r0
/* 0000B7BC 38E40A94 */ addi r7, r4, 0xa94
/* 0000B7C0 90A80008 */ stw r5, 8(r8)
/* 0000B7C4 38C30A94 */ addi r6, r3, 0xa94
lbl_0000B7C8:
/* 0000B7C8 84A60008 */ lwzu r5, 8(r6)
/* 0000B7CC 80060004 */ lwz r0, 4(r6)
/* 0000B7D0 94A70008 */ stwu r5, 8(r7)
/* 0000B7D4 90070004 */ stw r0, 4(r7)
/* 0000B7D8 4200FFF0 */ bdnz lbl_0000B7C8
/* 0000B7DC 80060008 */ lwz r0, 8(r6)
/* 0000B7E0 39200008 */ li r9, 8
/* 0000B7E4 90070008 */ stw r0, 8(r7)
/* 0000B7E8 4800004C */ b lbl_0000B834
lbl_0000B7EC:
/* 0000B7EC 38800030 */ li r4, 0x30
/* 0000B7F0 48000038 */ b lbl_0000B828
lbl_0000B7F4:
/* 0000B7F4 7C8903A6 */ mtctr r4
/* 0000B7F8 38C8FFF8 */ addi r6, r8, -8  ;# fixed addi
/* 0000B7FC 38A7FFF8 */ addi r5, r7, -8  ;# fixed addi
lbl_0000B800:
/* 0000B800 84650008 */ lwzu r3, 8(r5)
/* 0000B804 80050004 */ lwz r0, 4(r5)
/* 0000B808 94660008 */ stwu r3, 8(r6)
/* 0000B80C 90060004 */ stw r0, 4(r6)
/* 0000B810 4200FFF0 */ bdnz lbl_0000B800
/* 0000B814 80050008 */ lwz r0, 8(r5)
/* 0000B818 39290001 */ addi r9, r9, 1
/* 0000B81C 38E70184 */ addi r7, r7, 0x184
/* 0000B820 90060008 */ stw r0, 8(r6)
/* 0000B824 39080184 */ addi r8, r8, 0x184
lbl_0000B828:
/* 0000B828 2C09000A */ cmpwi r9, 0xa
/* 0000B82C 4180FFC8 */ blt lbl_0000B7F4
/* 0000B830 4E800020 */ blr 
lbl_0000B834:
/* 0000B834 1C090184 */ mulli r0, r9, 0x184
/* 0000B838 7CE30214 */ add r7, r3, r0
/* 0000B83C 7D040214 */ add r8, r4, r0
/* 0000B840 4BFFFFAC */ b lbl_0000B7EC
/* 0000B844 4E800020 */ blr 
lbl_0000B848:
/* 0000B848 7C0802A6 */ mflr r0
/* 0000B84C 90010004 */ stw r0, 4(r1)
/* 0000B850 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000B854 BF610014 */ stmw r27, 0x14(r1)
/* 0000B858 3B630000 */ addi r27, r3, 0
/* 0000B85C 3C600000 */ lis r3, lbl_00014800@ha
/* 0000B860 3BA30000 */ addi r29, r3, lbl_00014800@l
/* 0000B864 387B0148 */ addi r3, r27, 0x148
/* 0000B868 4BFF48F9 */ bl mathutil_mtxA_from_mtx
/* 0000B86C 387B0124 */ addi r3, r27, 0x124
/* 0000B870 C0430000 */ lfs f2, 0(r3)
/* 0000B874 C0230004 */ lfs f1, 4(r3)
/* 0000B878 C0030008 */ lfs f0, 8(r3)
/* 0000B87C 3C60E000 */ lis r3, 0xe000
/* 0000B880 D043000C */ stfs f2, 0xc(r3)
/* 0000B884 D023001C */ stfs f1, 0x1c(r3)
/* 0000B888 D003002C */ stfs f0, 0x2c(r3)
/* 0000B88C C03D037C */ lfs f1, 0x37c(r29)
/* 0000B890 C05D0380 */ lfs f2, 0x380(r29)
/* 0000B894 C01D0384 */ lfs f0, 0x384(r29)
/* 0000B898 FC200850 */ fneg f1, f1
/* 0000B89C FC401050 */ fneg f2, f2
/* 0000B8A0 FC600050 */ fneg f3, f0
/* 0000B8A4 4BFF48BD */ bl mathutil_mtxA_translate_xyz
/* 0000B8A8 3B800000 */ li r28, 0
/* 0000B8AC 3BE00000 */ li r31, 0
/* 0000B8B0 3BC00000 */ li r30, 0
/* 0000B8B4 48000040 */ b lbl_0000B8F4
lbl_0000B8B8:
/* 0000B8B8 7CBBF214 */ add r5, r27, r30
/* 0000B8BC 80650004 */ lwz r3, 4(r5)
/* 0000B8C0 389E0004 */ addi r4, r30, 4
/* 0000B8C4 80050008 */ lwz r0, 8(r5)
/* 0000B8C8 7C9B2214 */ add r4, r27, r4
/* 0000B8CC 90650094 */ stw r3, 0x94(r5)
/* 0000B8D0 90050098 */ stw r0, 0x98(r5)
/* 0000B8D4 8005000C */ lwz r0, 0xc(r5)
/* 0000B8D8 9005009C */ stw r0, 0x9c(r5)
/* 0000B8DC 801D03A8 */ lwz r0, 0x3a8(r29)
/* 0000B8E0 7C60FA14 */ add r3, r0, r31
/* 0000B8E4 4BFF487D */ bl mathutil_mtxA_tf_point
/* 0000B8E8 3B9C0001 */ addi r28, r28, 1
/* 0000B8EC 3BFF0014 */ addi r31, r31, 0x14
/* 0000B8F0 3BDE000C */ addi r30, r30, 0xc
lbl_0000B8F4:
/* 0000B8F4 881D03AC */ lbz r0, 0x3ac(r29)
/* 0000B8F8 7C1C0000 */ cmpw r28, r0
/* 0000B8FC 4180FFBC */ blt lbl_0000B8B8
/* 0000B900 BB610014 */ lmw r27, 0x14(r1)
/* 0000B904 8001002C */ lwz r0, 0x2c(r1)
/* 0000B908 38210028 */ addi r1, r1, 0x28
/* 0000B90C 7C0803A6 */ mtlr r0
/* 0000B910 4E800020 */ blr 
lbl_0000B914:
/* 0000B914 7C0802A6 */ mflr r0
/* 0000B918 3C800000 */ lis r4, lbl_00014800@ha
/* 0000B91C 90010004 */ stw r0, 4(r1)
/* 0000B920 9421FF70 */ stwu r1, -0x90(r1)
/* 0000B924 DBE10088 */ stfd f31, 0x88(r1)
/* 0000B928 BF010068 */ stmw r24, 0x68(r1)
/* 0000B92C 3BE40000 */ addi r31, r4, lbl_00014800@l
/* 0000B930 7C791B78 */ mr r25, r3
/* 0000B934 3B000000 */ li r24, 0
/* 0000B938 3BB90004 */ addi r29, r25, 4
/* 0000B93C 3B990094 */ addi r28, r25, 0x94
/* 0000B940 3B600000 */ li r27, 0
/* 0000B944 3B400000 */ li r26, 0
/* 0000B948 3BC00000 */ li r30, 0
/* 0000B94C C3FF03E8 */ lfs f31, 0x3e8(r31)
/* 0000B950 807F0440 */ lwz r3, 0x440(r31)
/* 0000B954 801F0444 */ lwz r0, 0x444(r31)
/* 0000B958 90610048 */ stw r3, 0x48(r1)
/* 0000B95C 9001004C */ stw r0, 0x4c(r1)
/* 0000B960 801F0448 */ lwz r0, 0x448(r31)
/* 0000B964 90010050 */ stw r0, 0x50(r1)
/* 0000B968 80190178 */ lwz r0, 0x178(r25)
/* 0000B96C 9019017C */ stw r0, 0x17c(r25)
/* 0000B970 93190178 */ stw r24, 0x178(r25)
/* 0000B974 480000A0 */ b lbl_0000BA14
lbl_0000B978:
/* 0000B978 801F03A8 */ lwz r0, 0x3a8(r31)
/* 0000B97C 387D0000 */ addi r3, r29, 0
/* 0000B980 389C0000 */ addi r4, r28, 0
/* 0000B984 7CA0C214 */ add r5, r0, r24
/* 0000B988 C025000C */ lfs f1, 0xc(r5)
/* 0000B98C 38A10038 */ addi r5, r1, 0x38
/* 0000B990 38C10044 */ addi r6, r1, 0x44
/* 0000B994 38E10034 */ addi r7, r1, 0x34
/* 0000B998 48002EFD */ bl lbl_0000E894
/* 0000B99C C81F0400 */ lfd f0, 0x400(r31)
/* 0000B9A0 FC010040 */ fcmpo cr0, f1, f0
/* 0000B9A4 4C401382 */ cror 2, 0, 2
/* 0000B9A8 4182005C */ beq lbl_0000BA04
/* 0000B9AC 38000001 */ li r0, 1
/* 0000B9B0 FC01F840 */ fcmpo cr0, f1, f31
/* 0000B9B4 80790178 */ lwz r3, 0x178(r25)
/* 0000B9B8 7C00F030 */ slw r0, r0, r30
/* 0000B9BC 3B7B0001 */ addi r27, r27, 1
/* 0000B9C0 7C600378 */ or r0, r3, r0
/* 0000B9C4 90190178 */ stw r0, 0x178(r25)
/* 0000B9C8 4081003C */ ble lbl_0000BA04
/* 0000B9CC C0610038 */ lfs f3, 0x38(r1)
/* 0000B9D0 FFE00890 */ fmr f31, f1
/* 0000B9D4 C0010048 */ lfs f0, 0x48(r1)
/* 0000B9D8 7FDAF378 */ mr r26, r30
/* 0000B9DC C041003C */ lfs f2, 0x3c(r1)
/* 0000B9E0 EC03002A */ fadds f0, f3, f0
/* 0000B9E4 C0210040 */ lfs f1, 0x40(r1)
/* 0000B9E8 D0010048 */ stfs f0, 0x48(r1)
/* 0000B9EC C001004C */ lfs f0, 0x4c(r1)
/* 0000B9F0 EC02002A */ fadds f0, f2, f0
/* 0000B9F4 D001004C */ stfs f0, 0x4c(r1)
/* 0000B9F8 C0010050 */ lfs f0, 0x50(r1)
/* 0000B9FC EC01002A */ fadds f0, f1, f0
/* 0000BA00 D0010050 */ stfs f0, 0x50(r1)
lbl_0000BA04:
/* 0000BA04 3BDE0001 */ addi r30, r30, 1
/* 0000BA08 3B180014 */ addi r24, r24, 0x14
/* 0000BA0C 3BBD000C */ addi r29, r29, 0xc
/* 0000BA10 3B9C000C */ addi r28, r28, 0xc
lbl_0000BA14:
/* 0000BA14 881F03AC */ lbz r0, 0x3ac(r31)
/* 0000BA18 7C1E0000 */ cmpw r30, r0
/* 0000BA1C 4180FF5C */ blt lbl_0000B978
/* 0000BA20 C81F0400 */ lfd f0, 0x400(r31)
/* 0000BA24 FC00F800 */ fcmpu cr0, f0, f31
/* 0000BA28 418203A0 */ beq lbl_0000BDC8
/* 0000BA2C 38610048 */ addi r3, r1, 0x48
/* 0000BA30 C0410048 */ lfs f2, 0x48(r1)
/* 0000BA34 C021004C */ lfs f1, 0x4c(r1)
/* 0000BA38 C0010050 */ lfs f0, 0x50(r1)
/* 0000BA3C EC4200B2 */ fmuls f2, f2, f2
/* 0000BA40 EC41107A */ fmadds f2, f1, f1, f2
/* 0000BA44 EC40103A */ fmadds f2, f0, f0, f2
/* 0000BA48 C01F0458 */ lfs f0, 0x458(r31)
/* 0000BA4C FC001040 */ fcmpo cr0, f0, f2
/* 0000BA50 4C411382 */ cror 2, 1, 2
/* 0000BA54 40820010 */ bne lbl_0000BA64
/* 0000BA58 C01F045C */ lfs f0, 0x45c(r31)
/* 0000BA5C D001004C */ stfs f0, 0x4c(r1)
/* 0000BA60 48000008 */ b lbl_0000BA68
lbl_0000BA64:
/* 0000BA64 4BFF46FD */ bl mathutil_vec_normalize_len
lbl_0000BA68:
/* 0000BA68 C03F0398 */ lfs f1, 0x398(r31)
/* 0000BA6C 38790130 */ addi r3, r25, 0x130
/* 0000BA70 C0010044 */ lfs f0, 0x44(r1)
/* 0000BA74 38810048 */ addi r4, r1, 0x48
/* 0000BA78 C05F039C */ lfs f2, 0x39c(r31)
/* 0000BA7C EC210032 */ fmuls f1, f1, f0
/* 0000BA80 38A10028 */ addi r5, r1, 0x28
/* 0000BA84 4800035D */ bl lbl_0000BDE0
/* 0000BA88 C0390130 */ lfs f1, 0x130(r25)
/* 0000BA8C 7F23CB78 */ mr r3, r25
/* 0000BA90 C0010028 */ lfs f0, 0x28(r1)
/* 0000BA94 38BA0000 */ addi r5, r26, 0
/* 0000BA98 38810028 */ addi r4, r1, 0x28
/* 0000BA9C EC01002A */ fadds f0, f1, f0
/* 0000BAA0 D0190130 */ stfs f0, 0x130(r25)
/* 0000BAA4 C021002C */ lfs f1, 0x2c(r1)
/* 0000BAA8 C81F0460 */ lfd f0, 0x460(r31)
/* 0000BAAC C0590134 */ lfs f2, 0x134(r25)
/* 0000BAB0 FC010028 */ fsub f0, f1, f0
/* 0000BAB4 FC02002A */ fadd f0, f2, f0
/* 0000BAB8 FC000018 */ frsp f0, f0
/* 0000BABC D0190134 */ stfs f0, 0x134(r25)
/* 0000BAC0 C0390138 */ lfs f1, 0x138(r25)
/* 0000BAC4 C0010030 */ lfs f0, 0x30(r1)
/* 0000BAC8 EC01002A */ fadds f0, f1, f0
/* 0000BACC D0190138 */ stfs f0, 0x138(r25)
/* 0000BAD0 C83F0468 */ lfd f1, 0x468(r31)
/* 0000BAD4 C0010028 */ lfs f0, 0x28(r1)
/* 0000BAD8 FC010032 */ fmul f0, f1, f0
/* 0000BADC FC000018 */ frsp f0, f0
/* 0000BAE0 D0010028 */ stfs f0, 0x28(r1)
/* 0000BAE4 C83F0468 */ lfd f1, 0x468(r31)
/* 0000BAE8 C001002C */ lfs f0, 0x2c(r1)
/* 0000BAEC FC010032 */ fmul f0, f1, f0
/* 0000BAF0 FC000018 */ frsp f0, f0
/* 0000BAF4 D001002C */ stfs f0, 0x2c(r1)
/* 0000BAF8 C83F0468 */ lfd f1, 0x468(r31)
/* 0000BAFC C0010030 */ lfs f0, 0x30(r1)
/* 0000BB00 FC010032 */ fmul f0, f1, f0
/* 0000BB04 FC000018 */ frsp f0, f0
/* 0000BB08 D0010030 */ stfs f0, 0x30(r1)
/* 0000BB0C 480003AD */ bl lbl_0000BEB8
/* 0000BB10 C0210028 */ lfs f1, 0x28(r1)
/* 0000BB14 C041002C */ lfs f2, 0x2c(r1)
/* 0000BB18 C0010030 */ lfs f0, 0x30(r1)
/* 0000BB1C EC210072 */ fmuls f1, f1, f1
/* 0000BB20 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000BB24 EC20083A */ fmadds f1, f0, f0, f1
/* 0000BB28 4BFF4639 */ bl mathutil_sqrt
/* 0000BB2C C81F0438 */ lfd f0, 0x438(r31)
/* 0000BB30 FC010040 */ fcmpo cr0, f1, f0
/* 0000BB34 408100EC */ ble lbl_0000BC20
/* 0000BB38 807F044C */ lwz r3, 0x44c(r31)
/* 0000BB3C 801F0450 */ lwz r0, 0x450(r31)
/* 0000BB40 9061001C */ stw r3, 0x1c(r1)
/* 0000BB44 90010020 */ stw r0, 0x20(r1)
/* 0000BB48 801F0454 */ lwz r0, 0x454(r31)
/* 0000BB4C 90010024 */ stw r0, 0x24(r1)
/* 0000BB50 C85F0470 */ lfd f2, 0x470(r31)
/* 0000BB54 C81F03C0 */ lfd f0, 0x3c0(r31)
/* 0000BB58 FC220072 */ fmul f1, f2, f1
/* 0000BB5C FC010040 */ fcmpo cr0, f1, f0
/* 0000BB60 40800008 */ bge lbl_0000BB68
/* 0000BB64 48000008 */ b lbl_0000BB6C
lbl_0000BB68:
/* 0000BB68 FC200090 */ fmr f1, f0
lbl_0000BB6C:
/* 0000BB6C FC600818 */ frsp f3, f1
/* 0000BB70 C05F0478 */ lfs f2, 0x478(r31)
/* 0000BB74 C01F0480 */ lfs f0, 0x480(r31)
/* 0000BB78 3861001C */ addi r3, r1, 0x1c
/* 0000BB7C C03F047C */ lfs f1, 0x47c(r31)
/* 0000BB80 EC4200F2 */ fmuls f2, f2, f3
/* 0000BB84 EC0000F2 */ fmuls f0, f0, f3
/* 0000BB88 EC220828 */ fsubs f1, f2, f1
/* 0000BB8C FC00001E */ fctiwz f0, f0
/* 0000BB90 FC20081E */ fctiwz f1, f1
/* 0000BB94 D8010058 */ stfd f0, 0x58(r1)
/* 0000BB98 8001005C */ lwz r0, 0x5c(r1)
/* 0000BB9C D8210060 */ stfd f1, 0x60(r1)
/* 0000BBA0 7C000774 */ extsb r0, r0
/* 0000BBA4 5400103A */ slwi r0, r0, 2
/* 0000BBA8 80810064 */ lwz r4, 0x64(r1)
/* 0000BBAC 7C03002E */ lwzx r0, r3, r0
/* 0000BBB0 54835BA8 */ rlwinm r3, r4, 0xb, 0xe, 0x14
/* 0000BBB4 7C630378 */ or r3, r3, r0
/* 0000BBB8 4BFF45A9 */ bl func_8002B610
/* 0000BBBC 3B430000 */ addi r26, r3, 0
/* 0000BBC0 2C1AFFFF */ cmpwi r26, -1
/* 0000BBC4 4182005C */ beq lbl_0000BC20
/* 0000BBC8 4BFF4599 */ bl rand
/* 0000BBCC 5464053E */ clrlwi r4, r3, 0x14
/* 0000BBD0 5743043E */ clrlwi r3, r26, 0x10
/* 0000BBD4 38841800 */ addi r4, r4, 0x1800
/* 0000BBD8 4BFF4589 */ bl func_8002C3E0
/* 0000BBDC 3C600000 */ lis r3, modeCtrl@ha
/* 0000BBE0 38630000 */ addi r3, r3, modeCtrl@l
/* 0000BBE4 8003002C */ lwz r0, 0x2c(r3)
/* 0000BBE8 3C600000 */ lis r3, cameraInfo@ha
/* 0000BBEC 38630000 */ addi r3, r3, cameraInfo@l
/* 0000BBF0 1C000284 */ mulli r0, r0, 0x284
/* 0000BBF4 7C630214 */ add r3, r3, r0
/* 0000BBF8 A8A3001A */ lha r5, 0x1a(r3)
/* 0000BBFC 38790124 */ addi r3, r25, 0x124
/* 0000BC00 389F03B0 */ addi r4, r31, 0x3b0
/* 0000BC04 38C10019 */ addi r6, r1, 0x19
/* 0000BC08 38E10018 */ addi r7, r1, 0x18
/* 0000BC0C 48001BED */ bl lbl_0000D7F8
/* 0000BC10 88810019 */ lbz r4, 0x19(r1)
/* 0000BC14 5743043E */ clrlwi r3, r26, 0x10
/* 0000BC18 88A10018 */ lbz r5, 0x18(r1)
/* 0000BC1C 4BFF4545 */ bl SoundPan
lbl_0000BC20:
/* 0000BC20 2C1B0003 */ cmpwi r27, 3
/* 0000BC24 408000C8 */ bge lbl_0000BCEC
/* 0000BC28 C83F0488 */ lfd f1, 0x488(r31)
/* 0000BC2C C019013C */ lfs f0, 0x13c(r25)
/* 0000BC30 FC010032 */ fmul f0, f1, f0
/* 0000BC34 FC000018 */ frsp f0, f0
/* 0000BC38 D019013C */ stfs f0, 0x13c(r25)
/* 0000BC3C C83F0488 */ lfd f1, 0x488(r31)
/* 0000BC40 C0190140 */ lfs f0, 0x140(r25)
/* 0000BC44 FC010032 */ fmul f0, f1, f0
/* 0000BC48 FC000018 */ frsp f0, f0
/* 0000BC4C D0190140 */ stfs f0, 0x140(r25)
/* 0000BC50 C83F0488 */ lfd f1, 0x488(r31)
/* 0000BC54 C0190144 */ lfs f0, 0x144(r25)
/* 0000BC58 FC010032 */ fmul f0, f1, f0
/* 0000BC5C FC000018 */ frsp f0, f0
/* 0000BC60 D0190144 */ stfs f0, 0x144(r25)
/* 0000BC64 C0390130 */ lfs f1, 0x130(r25)
/* 0000BC68 C0190134 */ lfs f0, 0x134(r25)
/* 0000BC6C C0590138 */ lfs f2, 0x138(r25)
/* 0000BC70 FC200A10 */ fabs f1, f1
/* 0000BC74 FC000210 */ fabs f0, f0
/* 0000BC78 C87F0490 */ lfd f3, 0x490(r31)
/* 0000BC7C FC401210 */ fabs f2, f2
/* 0000BC80 FC01002A */ fadd f0, f1, f0
/* 0000BC84 FC02002A */ fadd f0, f2, f0
/* 0000BC88 FC030040 */ fcmpo cr0, f3, f0
/* 0000BC8C 40810100 */ ble lbl_0000BD8C
/* 0000BC90 C039013C */ lfs f1, 0x13c(r25)
/* 0000BC94 C0190140 */ lfs f0, 0x140(r25)
/* 0000BC98 FC200A10 */ fabs f1, f1
/* 0000BC9C C0590144 */ lfs f2, 0x144(r25)
/* 0000BCA0 FC000210 */ fabs f0, f0
/* 0000BCA4 C87F0498 */ lfd f3, 0x498(r31)
/* 0000BCA8 FC401210 */ fabs f2, f2
/* 0000BCAC FC01002A */ fadd f0, f1, f0
/* 0000BCB0 FC02002A */ fadd f0, f2, f0
/* 0000BCB4 FC030040 */ fcmpo cr0, f3, f0
/* 0000BCB8 408100D4 */ ble lbl_0000BD8C
/* 0000BCBC C039015C */ lfs f1, 0x15c(r25)
/* 0000BCC0 C81F04A0 */ lfd f0, 0x4a0(r31)
/* 0000BCC4 FC010040 */ fcmpo cr0, f1, f0
/* 0000BCC8 4C411382 */ cror 2, 1, 2
/* 0000BCCC 408200C0 */ bne lbl_0000BD8C
/* 0000BCD0 80190000 */ lwz r0, 0(r25)
/* 0000BCD4 60000002 */ ori r0, r0, 2
/* 0000BCD8 90190000 */ stw r0, 0(r25)
/* 0000BCDC 80190000 */ lwz r0, 0(r25)
/* 0000BCE0 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 0000BCE4 90190000 */ stw r0, 0(r25)
/* 0000BCE8 480000A4 */ b lbl_0000BD8C
lbl_0000BCEC:
/* 0000BCEC C83F04A8 */ lfd f1, 0x4a8(r31)
/* 0000BCF0 C019013C */ lfs f0, 0x13c(r25)
/* 0000BCF4 FC010032 */ fmul f0, f1, f0
/* 0000BCF8 FC000018 */ frsp f0, f0
/* 0000BCFC D019013C */ stfs f0, 0x13c(r25)
/* 0000BD00 C83F04A8 */ lfd f1, 0x4a8(r31)
/* 0000BD04 C0190140 */ lfs f0, 0x140(r25)
/* 0000BD08 FC010032 */ fmul f0, f1, f0
/* 0000BD0C FC000018 */ frsp f0, f0
/* 0000BD10 D0190140 */ stfs f0, 0x140(r25)
/* 0000BD14 C83F04A8 */ lfd f1, 0x4a8(r31)
/* 0000BD18 C0190144 */ lfs f0, 0x144(r25)
/* 0000BD1C FC010032 */ fmul f0, f1, f0
/* 0000BD20 FC000018 */ frsp f0, f0
/* 0000BD24 D0190144 */ stfs f0, 0x144(r25)
/* 0000BD28 C0390130 */ lfs f1, 0x130(r25)
/* 0000BD2C C0190134 */ lfs f0, 0x134(r25)
/* 0000BD30 C0590138 */ lfs f2, 0x138(r25)
/* 0000BD34 FC200A10 */ fabs f1, f1
/* 0000BD38 FC000210 */ fabs f0, f0
/* 0000BD3C C87F0490 */ lfd f3, 0x490(r31)
/* 0000BD40 FC401210 */ fabs f2, f2
/* 0000BD44 FC01002A */ fadd f0, f1, f0
/* 0000BD48 FC02002A */ fadd f0, f2, f0
/* 0000BD4C FC030040 */ fcmpo cr0, f3, f0
/* 0000BD50 4081003C */ ble lbl_0000BD8C
/* 0000BD54 C039013C */ lfs f1, 0x13c(r25)
/* 0000BD58 C0190140 */ lfs f0, 0x140(r25)
/* 0000BD5C FC200A10 */ fabs f1, f1
/* 0000BD60 C0590144 */ lfs f2, 0x144(r25)
/* 0000BD64 FC000210 */ fabs f0, f0
/* 0000BD68 C87F0498 */ lfd f3, 0x498(r31)
/* 0000BD6C FC401210 */ fabs f2, f2
/* 0000BD70 FC01002A */ fadd f0, f1, f0
/* 0000BD74 FC02002A */ fadd f0, f2, f0
/* 0000BD78 FC030040 */ fcmpo cr0, f3, f0
/* 0000BD7C 40810010 */ ble lbl_0000BD8C
/* 0000BD80 80190000 */ lwz r0, 0(r25)
/* 0000BD84 60000002 */ ori r0, r0, 2
/* 0000BD88 90190000 */ stw r0, 0(r25)
lbl_0000BD8C:
/* 0000BD8C C81F04B0 */ lfd f0, 0x4b0(r31)
/* 0000BD90 7F23CB78 */ mr r3, r25
/* 0000BD94 C0410048 */ lfs f2, 0x48(r1)
/* 0000BD98 3881000C */ addi r4, r1, 0xc
/* 0000BD9C FC6007F2 */ fmul f3, f0, f31
/* 0000BDA0 C021004C */ lfs f1, 0x4c(r1)
/* 0000BDA4 C0010050 */ lfs f0, 0x50(r1)
/* 0000BDA8 FC601818 */ frsp f3, f3
/* 0000BDAC EC4200F2 */ fmuls f2, f2, f3
/* 0000BDB0 EC2100F2 */ fmuls f1, f1, f3
/* 0000BDB4 EC0000F2 */ fmuls f0, f0, f3
/* 0000BDB8 D041000C */ stfs f2, 0xc(r1)
/* 0000BDBC D0210010 */ stfs f1, 0x10(r1)
/* 0000BDC0 D0010014 */ stfs f0, 0x14(r1)
/* 0000BDC4 48001711 */ bl lbl_0000D4D4
lbl_0000BDC8:
/* 0000BDC8 BB010068 */ lmw r24, 0x68(r1)
/* 0000BDCC 80010094 */ lwz r0, 0x94(r1)
/* 0000BDD0 CBE10088 */ lfd f31, 0x88(r1)
/* 0000BDD4 38210090 */ addi r1, r1, 0x90
/* 0000BDD8 7C0803A6 */ mtlr r0
/* 0000BDDC 4E800020 */ blr 
lbl_0000BDE0:
/* 0000BDE0 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000BDE4 C0E40000 */ lfs f7, 0(r4)
/* 0000BDE8 C0830000 */ lfs f4, 0(r3)
/* 0000BDEC C0C40004 */ lfs f6, 4(r4)
/* 0000BDF0 C0630004 */ lfs f3, 4(r3)
/* 0000BDF4 C0A40008 */ lfs f5, 8(r4)
/* 0000BDF8 C0030008 */ lfs f0, 8(r3)
/* 0000BDFC EC870132 */ fmuls f4, f7, f4
/* 0000BE00 EC8620FA */ fmadds f4, f6, f3, f4
/* 0000BE04 EC85203A */ fmadds f4, f5, f0, f4
/* 0000BE08 C0040000 */ lfs f0, 0(r4)
/* 0000BE0C 3CC00000 */ lis r6, lbl_00014CB8@ha
/* 0000BE10 C8660000 */ lfd f3, lbl_00014CB8@l(r6)
/* 0000BE14 EC000132 */ fmuls f0, f0, f4
/* 0000BE18 FCA30828 */ fsub f5, f3, f1
/* 0000BE1C D0010028 */ stfs f0, 0x28(r1)
/* 0000BE20 FCA02818 */ frsp f5, f5
/* 0000BE24 C0040004 */ lfs f0, 4(r4)
/* 0000BE28 EC000132 */ fmuls f0, f0, f4
/* 0000BE2C D001002C */ stfs f0, 0x2c(r1)
/* 0000BE30 C0040008 */ lfs f0, 8(r4)
/* 0000BE34 EC000132 */ fmuls f0, f0, f4
/* 0000BE38 D0010030 */ stfs f0, 0x30(r1)
/* 0000BE3C C0010028 */ lfs f0, 0x28(r1)
/* 0000BE40 C0830000 */ lfs f4, 0(r3)
/* 0000BE44 C061002C */ lfs f3, 0x2c(r1)
/* 0000BE48 EC250032 */ fmuls f1, f5, f0
/* 0000BE4C EC840028 */ fsubs f4, f4, f0
/* 0000BE50 C0010030 */ lfs f0, 0x30(r1)
/* 0000BE54 D081001C */ stfs f4, 0x1c(r1)
/* 0000BE58 C0830004 */ lfs f4, 4(r3)
/* 0000BE5C EC641828 */ fsubs f3, f4, f3
/* 0000BE60 D0610020 */ stfs f3, 0x20(r1)
/* 0000BE64 C0630008 */ lfs f3, 8(r3)
/* 0000BE68 EC030028 */ fsubs f0, f3, f0
/* 0000BE6C D0010024 */ stfs f0, 0x24(r1)
/* 0000BE70 C001001C */ lfs f0, 0x1c(r1)
/* 0000BE74 EC020032 */ fmuls f0, f2, f0
/* 0000BE78 EC010028 */ fsubs f0, f1, f0
/* 0000BE7C D0050000 */ stfs f0, 0(r5)
/* 0000BE80 C021002C */ lfs f1, 0x2c(r1)
/* 0000BE84 C0010020 */ lfs f0, 0x20(r1)
/* 0000BE88 EC250072 */ fmuls f1, f5, f1
/* 0000BE8C EC020032 */ fmuls f0, f2, f0
/* 0000BE90 EC010028 */ fsubs f0, f1, f0
/* 0000BE94 D0050004 */ stfs f0, 4(r5)
/* 0000BE98 C0210030 */ lfs f1, 0x30(r1)
/* 0000BE9C C0010024 */ lfs f0, 0x24(r1)
/* 0000BEA0 EC250072 */ fmuls f1, f5, f1
/* 0000BEA4 EC020032 */ fmuls f0, f2, f0
/* 0000BEA8 EC010028 */ fsubs f0, f1, f0
/* 0000BEAC D0050008 */ stfs f0, 8(r5)
/* 0000BEB0 38210038 */ addi r1, r1, 0x38
/* 0000BEB4 4E800020 */ blr 
lbl_0000BEB8:
/* 0000BEB8 7C0802A6 */ mflr r0
/* 0000BEBC 3CC00000 */ lis r6, lbl_00014800@ha
/* 0000BEC0 90010004 */ stw r0, 4(r1)
/* 0000BEC4 1C05000C */ mulli r0, r5, 0xc
/* 0000BEC8 9421FFA0 */ stwu r1, -0x60(r1)
/* 0000BECC 93E1005C */ stw r31, 0x5c(r1)
/* 0000BED0 93C10058 */ stw r30, 0x58(r1)
/* 0000BED4 3BC60000 */ addi r30, r6, lbl_00014800@l
/* 0000BED8 38C10038 */ addi r6, r1, 0x38
/* 0000BEDC 93A10054 */ stw r29, 0x54(r1)
/* 0000BEE0 7C9D2378 */ mr r29, r4
/* 0000BEE4 38850000 */ addi r4, r5, 0
/* 0000BEE8 93810050 */ stw r28, 0x50(r1)
/* 0000BEEC 3B830000 */ addi r28, r3, 0
/* 0000BEF0 7FFC0214 */ add r31, r28, r0
/* 0000BEF4 C03F0004 */ lfs f1, 4(r31)
/* 0000BEF8 38A10044 */ addi r5, r1, 0x44
/* 0000BEFC C01F0094 */ lfs f0, 0x94(r31)
/* 0000BF00 EC010028 */ fsubs f0, f1, f0
/* 0000BF04 D0010044 */ stfs f0, 0x44(r1)
/* 0000BF08 C03F0008 */ lfs f1, 8(r31)
/* 0000BF0C C01F0098 */ lfs f0, 0x98(r31)
/* 0000BF10 EC010028 */ fsubs f0, f1, f0
/* 0000BF14 D0010048 */ stfs f0, 0x48(r1)
/* 0000BF18 C03F000C */ lfs f1, 0xc(r31)
/* 0000BF1C C01F009C */ lfs f0, 0x9c(r31)
/* 0000BF20 EC010028 */ fsubs f0, f1, f0
/* 0000BF24 D001004C */ stfs f0, 0x4c(r1)
/* 0000BF28 C03D0000 */ lfs f1, 0(r29)
/* 0000BF2C C0010044 */ lfs f0, 0x44(r1)
/* 0000BF30 EC010028 */ fsubs f0, f1, f0
/* 0000BF34 D0010044 */ stfs f0, 0x44(r1)
/* 0000BF38 C03D0004 */ lfs f1, 4(r29)
/* 0000BF3C C0010048 */ lfs f0, 0x48(r1)
/* 0000BF40 EC010028 */ fsubs f0, f1, f0
/* 0000BF44 D0010048 */ stfs f0, 0x48(r1)
/* 0000BF48 C03D0008 */ lfs f1, 8(r29)
/* 0000BF4C C001004C */ lfs f0, 0x4c(r1)
/* 0000BF50 EC010028 */ fsubs f0, f1, f0
/* 0000BF54 D001004C */ stfs f0, 0x4c(r1)
/* 0000BF58 48000179 */ bl lbl_0000C0D0
/* 0000BF5C 807C017C */ lwz r3, 0x17c(r28)
/* 0000BF60 801C0178 */ lwz r0, 0x178(r28)
/* 0000BF64 7C030040 */ cmplw r3, r0
/* 0000BF68 41820038 */ beq lbl_0000BFA0
/* 0000BF6C C0210038 */ lfs f1, 0x38(r1)
/* 0000BF70 C01E0398 */ lfs f0, 0x398(r30)
/* 0000BF74 EC010032 */ fmuls f0, f1, f0
/* 0000BF78 D0010038 */ stfs f0, 0x38(r1)
/* 0000BF7C C021003C */ lfs f1, 0x3c(r1)
/* 0000BF80 C01E0398 */ lfs f0, 0x398(r30)
/* 0000BF84 EC010032 */ fmuls f0, f1, f0
/* 0000BF88 D001003C */ stfs f0, 0x3c(r1)
/* 0000BF8C C0210040 */ lfs f1, 0x40(r1)
/* 0000BF90 C01E0398 */ lfs f0, 0x398(r30)
/* 0000BF94 EC010032 */ fmuls f0, f1, f0
/* 0000BF98 D0010040 */ stfs f0, 0x40(r1)
/* 0000BF9C 480000E4 */ b lbl_0000C080
lbl_0000BFA0:
/* 0000BFA0 C03F0094 */ lfs f1, 0x94(r31)
/* 0000BFA4 38610014 */ addi r3, r1, 0x14
/* 0000BFA8 C01F0004 */ lfs f0, 4(r31)
/* 0000BFAC EC010028 */ fsubs f0, f1, f0
/* 0000BFB0 D001002C */ stfs f0, 0x2c(r1)
/* 0000BFB4 C03F0098 */ lfs f1, 0x98(r31)
/* 0000BFB8 C01F0008 */ lfs f0, 8(r31)
/* 0000BFBC EC010028 */ fsubs f0, f1, f0
/* 0000BFC0 D0010030 */ stfs f0, 0x30(r1)
/* 0000BFC4 C03F009C */ lfs f1, 0x9c(r31)
/* 0000BFC8 C01F000C */ lfs f0, 0xc(r31)
/* 0000BFCC EC010028 */ fsubs f0, f1, f0
/* 0000BFD0 D0010034 */ stfs f0, 0x34(r1)
/* 0000BFD4 809D0000 */ lwz r4, 0(r29)
/* 0000BFD8 801D0004 */ lwz r0, 4(r29)
/* 0000BFDC 90810014 */ stw r4, 0x14(r1)
/* 0000BFE0 90010018 */ stw r0, 0x18(r1)
/* 0000BFE4 801D0008 */ lwz r0, 8(r29)
/* 0000BFE8 9001001C */ stw r0, 0x1c(r1)
/* 0000BFEC 4BFF4175 */ bl mathutil_vec_normalize_len
/* 0000BFF0 C0A1002C */ lfs f5, 0x2c(r1)
/* 0000BFF4 C0410014 */ lfs f2, 0x14(r1)
/* 0000BFF8 C0810030 */ lfs f4, 0x30(r1)
/* 0000BFFC C0210018 */ lfs f1, 0x18(r1)
/* 0000C000 C0610034 */ lfs f3, 0x34(r1)
/* 0000C004 C001001C */ lfs f0, 0x1c(r1)
/* 0000C008 ECE500B2 */ fmuls f7, f5, f2
/* 0000C00C ECE4387A */ fmadds f7, f4, f1, f7
/* 0000C010 ECE3383A */ fmadds f7, f3, f0, f7
/* 0000C014 C0410014 */ lfs f2, 0x14(r1)
/* 0000C018 C0210018 */ lfs f1, 0x18(r1)
/* 0000C01C 7F83E378 */ mr r3, r28
/* 0000C020 C001001C */ lfs f0, 0x1c(r1)
/* 0000C024 EC8201F2 */ fmuls f4, f2, f7
/* 0000C028 C0A1002C */ lfs f5, 0x2c(r1)
/* 0000C02C C8DE04C0 */ lfd f6, 0x4c0(r30)
/* 0000C030 EC4101F2 */ fmuls f2, f1, f7
/* 0000C034 C0610030 */ lfs f3, 0x30(r1)
/* 0000C038 EC852028 */ fsubs f4, f5, f4
/* 0000C03C C0210034 */ lfs f1, 0x34(r1)
/* 0000C040 EC0001F2 */ fmuls f0, f0, f7
/* 0000C044 38810020 */ addi r4, r1, 0x20
/* 0000C048 EC431028 */ fsubs f2, f3, f2
/* 0000C04C FC660132 */ fmul f3, f6, f4
/* 0000C050 EC010028 */ fsubs f0, f1, f0
/* 0000C054 FC201818 */ frsp f1, f3
/* 0000C058 D0210020 */ stfs f1, 0x20(r1)
/* 0000C05C C83E04C0 */ lfd f1, 0x4c0(r30)
/* 0000C060 FC2100B2 */ fmul f1, f1, f2
/* 0000C064 FC200818 */ frsp f1, f1
/* 0000C068 D0210024 */ stfs f1, 0x24(r1)
/* 0000C06C C83E04C0 */ lfd f1, 0x4c0(r30)
/* 0000C070 FC010032 */ fmul f0, f1, f0
/* 0000C074 FC000018 */ frsp f0, f0
/* 0000C078 D0010028 */ stfs f0, 0x28(r1)
/* 0000C07C 48001459 */ bl lbl_0000D4D4
lbl_0000C080:
/* 0000C080 C0210038 */ lfs f1, 0x38(r1)
/* 0000C084 C01C013C */ lfs f0, 0x13c(r28)
/* 0000C088 EC01002A */ fadds f0, f1, f0
/* 0000C08C D01C013C */ stfs f0, 0x13c(r28)
/* 0000C090 C021003C */ lfs f1, 0x3c(r1)
/* 0000C094 C01C0140 */ lfs f0, 0x140(r28)
/* 0000C098 EC01002A */ fadds f0, f1, f0
/* 0000C09C D01C0140 */ stfs f0, 0x140(r28)
/* 0000C0A0 C0210040 */ lfs f1, 0x40(r1)
/* 0000C0A4 C01C0144 */ lfs f0, 0x144(r28)
/* 0000C0A8 EC01002A */ fadds f0, f1, f0
/* 0000C0AC D01C0144 */ stfs f0, 0x144(r28)
/* 0000C0B0 80010064 */ lwz r0, 0x64(r1)
/* 0000C0B4 83E1005C */ lwz r31, 0x5c(r1)
/* 0000C0B8 83C10058 */ lwz r30, 0x58(r1)
/* 0000C0BC 83A10054 */ lwz r29, 0x54(r1)
/* 0000C0C0 83810050 */ lwz r28, 0x50(r1)
/* 0000C0C4 38210060 */ addi r1, r1, 0x60
/* 0000C0C8 7C0803A6 */ mtlr r0
/* 0000C0CC 4E800020 */ blr 
lbl_0000C0D0:
/* 0000C0D0 1C04000C */ mulli r0, r4, 0xc
/* 0000C0D4 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000C0D8 C0030124 */ lfs f0, 0x124(r3)
/* 0000C0DC 7CE30214 */ add r7, r3, r0
/* 0000C0E0 C0270004 */ lfs f1, 4(r7)
/* 0000C0E4 3D000000 */ lis r8, lbl_00014800@ha
/* 0000C0E8 39080000 */ addi r8, r8, lbl_00014800@l
/* 0000C0EC EC010028 */ fsubs f0, f1, f0
/* 0000C0F0 D0010018 */ stfs f0, 0x18(r1)
/* 0000C0F4 C0270008 */ lfs f1, 8(r7)
/* 0000C0F8 C0030128 */ lfs f0, 0x128(r3)
/* 0000C0FC EC010028 */ fsubs f0, f1, f0
/* 0000C100 D001001C */ stfs f0, 0x1c(r1)
/* 0000C104 C027000C */ lfs f1, 0xc(r7)
/* 0000C108 C003012C */ lfs f0, 0x12c(r3)
/* 0000C10C EC010028 */ fsubs f0, f1, f0
/* 0000C110 D0010020 */ stfs f0, 0x20(r1)
/* 0000C114 C0E1001C */ lfs f7, 0x1c(r1)
/* 0000C118 C0650008 */ lfs f3, 8(r5)
/* 0000C11C C0C10020 */ lfs f6, 0x20(r1)
/* 0000C120 C0A50000 */ lfs f5, 0(r5)
/* 0000C124 C1010018 */ lfs f8, 0x18(r1)
/* 0000C128 C0850004 */ lfs f4, 4(r5)
/* 0000C12C EC4700F2 */ fmuls f2, f7, f3
/* 0000C130 EC260172 */ fmuls f1, f6, f5
/* 0000C134 EC080132 */ fmuls f0, f8, f4
/* 0000C138 EC46113C */ fnmsubs f2, f6, f4, f2
/* 0000C13C D0410024 */ stfs f2, 0x24(r1)
/* 0000C140 EC2808FC */ fnmsubs f1, f8, f3, f1
/* 0000C144 D0210028 */ stfs f1, 0x28(r1)
/* 0000C148 EC07017C */ fnmsubs f0, f7, f5, f0
/* 0000C14C D001002C */ stfs f0, 0x2c(r1)
/* 0000C150 1C040014 */ mulli r0, r4, 0x14
/* 0000C154 806803A8 */ lwz r3, 0x3a8(r8)
/* 0000C158 C84804D0 */ lfd f2, 0x4d0(r8)
/* 0000C15C 7C630214 */ add r3, r3, r0
/* 0000C160 C86804C8 */ lfd f3, 0x4c8(r8)
/* 0000C164 C0230010 */ lfs f1, 0x10(r3)
/* 0000C168 C0080388 */ lfs f0, 0x388(r8)
/* 0000C16C FC420824 */ fdiv f2, f2, f1
/* 0000C170 C0210024 */ lfs f1, 0x24(r1)
/* 0000C174 FC43102A */ fadd f2, f3, f2
/* 0000C178 FC401018 */ frsp f2, f2
/* 0000C17C EC0000B2 */ fmuls f0, f0, f2
/* 0000C180 EC010032 */ fmuls f0, f1, f0
/* 0000C184 D0010024 */ stfs f0, 0x24(r1)
/* 0000C188 C008038C */ lfs f0, 0x38c(r8)
/* 0000C18C C0210028 */ lfs f1, 0x28(r1)
/* 0000C190 EC0000B2 */ fmuls f0, f0, f2
/* 0000C194 EC010032 */ fmuls f0, f1, f0
/* 0000C198 D0010028 */ stfs f0, 0x28(r1)
/* 0000C19C C0080390 */ lfs f0, 0x390(r8)
/* 0000C1A0 C021002C */ lfs f1, 0x2c(r1)
/* 0000C1A4 EC0000B2 */ fmuls f0, f0, f2
/* 0000C1A8 EC010032 */ fmuls f0, f1, f0
/* 0000C1AC D001002C */ stfs f0, 0x2c(r1)
/* 0000C1B0 80610024 */ lwz r3, 0x24(r1)
/* 0000C1B4 80010028 */ lwz r0, 0x28(r1)
/* 0000C1B8 90660000 */ stw r3, 0(r6)
/* 0000C1BC 90060004 */ stw r0, 4(r6)
/* 0000C1C0 8001002C */ lwz r0, 0x2c(r1)
/* 0000C1C4 90060008 */ stw r0, 8(r6)
/* 0000C1C8 38210030 */ addi r1, r1, 0x30
/* 0000C1CC 4E800020 */ blr 
lbl_0000C1D0:
/* 0000C1D0 7C0802A6 */ mflr r0
/* 0000C1D4 3CA00000 */ lis r5, lbl_00014800@ha
/* 0000C1D8 90010004 */ stw r0, 4(r1)
/* 0000C1DC 9421FE88 */ stwu r1, -0x178(r1)
/* 0000C1E0 DBE10170 */ stfd f31, 0x170(r1)
/* 0000C1E4 DBC10168 */ stfd f30, 0x168(r1)
/* 0000C1E8 DBA10160 */ stfd f29, 0x160(r1)
/* 0000C1EC DB810158 */ stfd f28, 0x158(r1)
/* 0000C1F0 DB610150 */ stfd f27, 0x150(r1)
/* 0000C1F4 BE61011C */ stmw r19, 0x11c(r1)
/* 0000C1F8 3B240000 */ addi r25, r4, 0
/* 0000C1FC 3BE50000 */ addi r31, r5, lbl_00014800@l
/* 0000C200 7C781B78 */ mr r24, r3
/* 0000C204 3BD90004 */ addi r30, r25, 4
/* 0000C208 3AD90010 */ addi r22, r25, 0x10
/* 0000C20C 3BB9001C */ addi r29, r25, 0x1c
/* 0000C210 3A980004 */ addi r20, r24, 4
/* 0000C214 3A780094 */ addi r19, r24, 0x94
/* 0000C218 3AA00000 */ li r21, 0
/* 0000C21C 3AE00000 */ li r23, 0
/* 0000C220 C3640068 */ lfs f27, 0x68(r4)
/* 0000C224 C3FF04FC */ lfs f31, 0x4fc(r31)
/* 0000C228 C3DF03E8 */ lfs f30, 0x3e8(r31)
/* 0000C22C 48000058 */ b lbl_0000C284
lbl_0000C230:
/* 0000C230 801F03A8 */ lwz r0, 0x3a8(r31)
/* 0000C234 FC40D890 */ fmr f2, f27
/* 0000C238 38930000 */ addi r4, r19, 0
/* 0000C23C 7C60BA14 */ add r3, r0, r23
/* 0000C240 C023000C */ lfs f1, 0xc(r3)
/* 0000C244 38B40000 */ addi r5, r20, 0
/* 0000C248 38D60000 */ addi r6, r22, 0
/* 0000C24C 38FE0000 */ addi r7, r30, 0
/* 0000C250 386100F8 */ addi r3, r1, 0xf8
/* 0000C254 48001345 */ bl lbl_0000D598
/* 0000C258 C00100F8 */ lfs f0, 0xf8(r1)
/* 0000C25C FC00F040 */ fcmpo cr0, f0, f30
/* 0000C260 40810014 */ ble lbl_0000C274
/* 0000C264 FFC00090 */ fmr f30, f0
/* 0000C268 3B950000 */ addi r28, r21, 0
/* 0000C26C 3B740000 */ addi r27, r20, 0
/* 0000C270 3B530000 */ addi r26, r19, 0
lbl_0000C274:
/* 0000C274 3AB50001 */ addi r21, r21, 1
/* 0000C278 3AF70014 */ addi r23, r23, 0x14
/* 0000C27C 3A94000C */ addi r20, r20, 0xc
/* 0000C280 3A73000C */ addi r19, r19, 0xc
lbl_0000C284:
/* 0000C284 881F03AC */ lbz r0, 0x3ac(r31)
/* 0000C288 7C150000 */ cmpw r21, r0
/* 0000C28C 4180FFA4 */ blt lbl_0000C230
/* 0000C290 C81F0400 */ lfd f0, 0x400(r31)
/* 0000C294 FC00F000 */ fcmpu cr0, f0, f30
/* 0000C298 418207E8 */ beq lbl_0000CA80
/* 0000C29C 80780000 */ lwz r3, 0(r24)
/* 0000C2A0 1C1C0014 */ mulli r0, r28, 0x14
/* 0000C2A4 FC20D890 */ fmr f1, f27
/* 0000C2A8 546307FA */ rlwinm r3, r3, 0, 0x1f, 0x1d
/* 0000C2AC 90780000 */ stw r3, 0(r24)
/* 0000C2B0 38760000 */ addi r3, r22, 0
/* 0000C2B4 38BA0000 */ addi r5, r26, 0
/* 0000C2B8 80F80000 */ lwz r7, 0(r24)
/* 0000C2BC 38810098 */ addi r4, r1, 0x98
/* 0000C2C0 38C1008C */ addi r6, r1, 0x8c
/* 0000C2C4 60E70004 */ ori r7, r7, 4
/* 0000C2C8 90F80000 */ stw r7, 0(r24)
/* 0000C2CC C85F0500 */ lfd f2, 0x500(r31)
/* 0000C2D0 C01F0394 */ lfs f0, 0x394(r31)
/* 0000C2D4 C39F0398 */ lfs f28, 0x398(r31)
/* 0000C2D8 811E0000 */ lwz r8, 0(r30)
/* 0000C2DC FFA20032 */ fmul f29, f2, f0
/* 0000C2E0 80FE0004 */ lwz r7, 4(r30)
/* 0000C2E4 91010098 */ stw r8, 0x98(r1)
/* 0000C2E8 FFA0E818 */ frsp f29, f29
/* 0000C2EC 90E1009C */ stw r7, 0x9c(r1)
/* 0000C2F0 80FE0008 */ lwz r7, 8(r30)
/* 0000C2F4 90E100A0 */ stw r7, 0xa0(r1)
/* 0000C2F8 811B0000 */ lwz r8, 0(r27)
/* 0000C2FC 80FB0004 */ lwz r7, 4(r27)
/* 0000C300 9101008C */ stw r8, 0x8c(r1)
/* 0000C304 90E10090 */ stw r7, 0x90(r1)
/* 0000C308 80FB0008 */ lwz r7, 8(r27)
/* 0000C30C 90E10094 */ stw r7, 0x94(r1)
/* 0000C310 80FF03A8 */ lwz r7, 0x3a8(r31)
/* 0000C314 7CE70214 */ add r7, r7, r0
/* 0000C318 C047000C */ lfs f2, 0xc(r7)
/* 0000C31C 4BFF3E45 */ bl func_8006AAEC
/* 0000C320 C021008C */ lfs f1, 0x8c(r1)
/* 0000C324 38610080 */ addi r3, r1, 0x80
/* 0000C328 C0010098 */ lfs f0, 0x98(r1)
/* 0000C32C C0610090 */ lfs f3, 0x90(r1)
/* 0000C330 EC810028 */ fsubs f4, f1, f0
/* 0000C334 C041009C */ lfs f2, 0x9c(r1)
/* 0000C338 C0210094 */ lfs f1, 0x94(r1)
/* 0000C33C C00100A0 */ lfs f0, 0xa0(r1)
/* 0000C340 EC431028 */ fsubs f2, f3, f2
/* 0000C344 D0810080 */ stfs f4, 0x80(r1)
/* 0000C348 EC010028 */ fsubs f0, f1, f0
/* 0000C34C D0410084 */ stfs f2, 0x84(r1)
/* 0000C350 D0010088 */ stfs f0, 0x88(r1)
/* 0000C354 4BFF3E0D */ bl mathutil_vec_normalize_len
/* 0000C358 C01F0508 */ lfs f0, 0x508(r31)
/* 0000C35C FC010040 */ fcmpo cr0, f1, f0
/* 0000C360 4C401382 */ cror 2, 0, 2
/* 0000C364 4082001C */ bne lbl_0000C380
/* 0000C368 C01F03E8 */ lfs f0, 0x3e8(r31)
/* 0000C36C D0010080 */ stfs f0, 0x80(r1)
/* 0000C370 C01F03E8 */ lfs f0, 0x3e8(r31)
/* 0000C374 D0010084 */ stfs f0, 0x84(r1)
/* 0000C378 C01F050C */ lfs f0, 0x50c(r31)
/* 0000C37C D0010088 */ stfs f0, 0x88(r1)
lbl_0000C380:
/* 0000C380 C0210098 */ lfs f1, 0x98(r1)
/* 0000C384 38610074 */ addi r3, r1, 0x74
/* 0000C388 C001008C */ lfs f0, 0x8c(r1)
/* 0000C38C C061009C */ lfs f3, 0x9c(r1)
/* 0000C390 EC810028 */ fsubs f4, f1, f0
/* 0000C394 C0410090 */ lfs f2, 0x90(r1)
/* 0000C398 C02100A0 */ lfs f1, 0xa0(r1)
/* 0000C39C C0010094 */ lfs f0, 0x94(r1)
/* 0000C3A0 EC431028 */ fsubs f2, f3, f2
/* 0000C3A4 D0810074 */ stfs f4, 0x74(r1)
/* 0000C3A8 EC010028 */ fsubs f0, f1, f0
/* 0000C3AC D0410078 */ stfs f2, 0x78(r1)
/* 0000C3B0 D001007C */ stfs f0, 0x7c(r1)
/* 0000C3B4 4BFF3DAD */ bl mathutil_vec_normalize_len
/* 0000C3B8 C0390068 */ lfs f1, 0x68(r25)
/* 0000C3BC 387900A8 */ addi r3, r25, 0xa8
/* 0000C3C0 38810068 */ addi r4, r1, 0x68
/* 0000C3C4 38A10074 */ addi r5, r1, 0x74
/* 0000C3C8 4BFF3D99 */ bl g_math_unk7
/* 0000C3CC C83F0498 */ lfd f1, 0x498(r31)
/* 0000C3D0 C0010068 */ lfs f0, 0x68(r1)
/* 0000C3D4 FC010032 */ fmul f0, f1, f0
/* 0000C3D8 FC000018 */ frsp f0, f0
/* 0000C3DC D0010068 */ stfs f0, 0x68(r1)
/* 0000C3E0 C83F0498 */ lfd f1, 0x498(r31)
/* 0000C3E4 C001006C */ lfs f0, 0x6c(r1)
/* 0000C3E8 FC010032 */ fmul f0, f1, f0
/* 0000C3EC FC000018 */ frsp f0, f0
/* 0000C3F0 D001006C */ stfs f0, 0x6c(r1)
/* 0000C3F4 C83F0498 */ lfd f1, 0x498(r31)
/* 0000C3F8 C0010070 */ lfs f0, 0x70(r1)
/* 0000C3FC FC010032 */ fmul f0, f1, f0
/* 0000C400 FC000018 */ frsp f0, f0
/* 0000C404 D0010070 */ stfs f0, 0x70(r1)
/* 0000C408 C05D0000 */ lfs f2, 0(r29)
/* 0000C40C C0010068 */ lfs f0, 0x68(r1)
/* 0000C410 C021006C */ lfs f1, 0x6c(r1)
/* 0000C414 EC42002A */ fadds f2, f2, f0
/* 0000C418 C0010070 */ lfs f0, 0x70(r1)
/* 0000C41C D04100FC */ stfs f2, 0xfc(r1)
/* 0000C420 C05D0004 */ lfs f2, 4(r29)
/* 0000C424 EC22082A */ fadds f1, f2, f1
/* 0000C428 D0210100 */ stfs f1, 0x100(r1)
/* 0000C42C C03D0008 */ lfs f1, 8(r29)
/* 0000C430 EC01002A */ fadds f0, f1, f0
/* 0000C434 D0010104 */ stfs f0, 0x104(r1)
/* 0000C438 C0A10080 */ lfs f5, 0x80(r1)
/* 0000C43C C04100FC */ lfs f2, 0xfc(r1)
/* 0000C440 C0810084 */ lfs f4, 0x84(r1)
/* 0000C444 C0210100 */ lfs f1, 0x100(r1)
/* 0000C448 C0610088 */ lfs f3, 0x88(r1)
/* 0000C44C C0010104 */ lfs f0, 0x104(r1)
/* 0000C450 ECA500B2 */ fmuls f5, f5, f2
/* 0000C454 ECA4287A */ fmadds f5, f4, f1, f5
/* 0000C458 ECA3283A */ fmadds f5, f3, f0, f5
/* 0000C45C C0810080 */ lfs f4, 0x80(r1)
/* 0000C460 C0410084 */ lfs f2, 0x84(r1)
/* 0000C464 C0C10088 */ lfs f6, 0x88(r1)
/* 0000C468 EC640172 */ fmuls f3, f4, f5
/* 0000C46C EC220172 */ fmuls f1, f2, f5
/* 0000C470 EC060172 */ fmuls f0, f6, f5
/* 0000C474 D06100EC */ stfs f3, 0xec(r1)
/* 0000C478 D02100F0 */ stfs f1, 0xf0(r1)
/* 0000C47C D00100F4 */ stfs f0, 0xf4(r1)
/* 0000C480 C03B0000 */ lfs f1, 0(r27)
/* 0000C484 C01A0000 */ lfs f0, 0(r26)
/* 0000C488 EC010028 */ fsubs f0, f1, f0
/* 0000C48C D00100E0 */ stfs f0, 0xe0(r1)
/* 0000C490 C03B0004 */ lfs f1, 4(r27)
/* 0000C494 C01A0004 */ lfs f0, 4(r26)
/* 0000C498 EC010028 */ fsubs f0, f1, f0
/* 0000C49C D00100E4 */ stfs f0, 0xe4(r1)
/* 0000C4A0 C03B0008 */ lfs f1, 8(r27)
/* 0000C4A4 C01A0008 */ lfs f0, 8(r26)
/* 0000C4A8 EC010028 */ fsubs f0, f1, f0
/* 0000C4AC D00100E8 */ stfs f0, 0xe8(r1)
/* 0000C4B0 C1010080 */ lfs f8, 0x80(r1)
/* 0000C4B4 C06100E0 */ lfs f3, 0xe0(r1)
/* 0000C4B8 C0E10084 */ lfs f7, 0x84(r1)
/* 0000C4BC C02100E4 */ lfs f1, 0xe4(r1)
/* 0000C4C0 C0A10088 */ lfs f5, 0x88(r1)
/* 0000C4C4 C00100E8 */ lfs f0, 0xe8(r1)
/* 0000C4C8 ED0800F2 */ fmuls f8, f8, f3
/* 0000C4CC ED07407A */ fmadds f8, f7, f1, f8
/* 0000C4D0 ED05403A */ fmadds f8, f5, f0, f8
/* 0000C4D4 C00100EC */ lfs f0, 0xec(r1)
/* 0000C4D8 C0A100F0 */ lfs f5, 0xf0(r1)
/* 0000C4DC ECFFE82A */ fadds f7, f31, f29
/* 0000C4E0 C06100F4 */ lfs f3, 0xf4(r1)
/* 0000C4E4 EC840232 */ fmuls f4, f4, f8
/* 0000C4E8 EC420232 */ fmuls f2, f2, f8
/* 0000C4EC EC260232 */ fmuls f1, f6, f8
/* 0000C4F0 D08100E0 */ stfs f4, 0xe0(r1)
/* 0000C4F4 ECDF0032 */ fmuls f6, f31, f0
/* 0000C4F8 EC9F0172 */ fmuls f4, f31, f5
/* 0000C4FC D04100E4 */ stfs f2, 0xe4(r1)
/* 0000C500 EC5F00F2 */ fmuls f2, f31, f3
/* 0000C504 D02100E8 */ stfs f1, 0xe8(r1)
/* 0000C508 C16100E0 */ lfs f11, 0xe0(r1)
/* 0000C50C C14100E4 */ lfs f10, 0xe4(r1)
/* 0000C510 ED005828 */ fsubs f8, f0, f11
/* 0000C514 C02100E8 */ lfs f1, 0xe8(r1)
/* 0000C518 ED255028 */ fsubs f9, f5, f10
/* 0000C51C ECBD02F2 */ fmuls f5, f29, f11
/* 0000C520 D10100BC */ stfs f8, 0xbc(r1)
/* 0000C524 ED030828 */ fsubs f8, f3, f1
/* 0000C528 D12100C0 */ stfs f9, 0xc0(r1)
/* 0000C52C EC7D02B2 */ fmuls f3, f29, f10
/* 0000C530 EC3D0072 */ fmuls f1, f29, f1
/* 0000C534 D10100C4 */ stfs f8, 0xc4(r1)
/* 0000C538 ECC6282A */ fadds f6, f6, f5
/* 0000C53C C91F04A0 */ lfd f8, 0x4a0(r31)
/* 0000C540 ECA4182A */ fadds f5, f4, f3
/* 0000C544 C06100BC */ lfs f3, 0xbc(r1)
/* 0000C548 EC82082A */ fadds f4, f2, f1
/* 0000C54C FF683824 */ fdiv f27, f8, f7
/* 0000C550 C04100C0 */ lfs f2, 0xc0(r1)
/* 0000C554 C02100C4 */ lfs f1, 0xc4(r1)
/* 0000C558 FF60D818 */ frsp f27, f27
/* 0000C55C EC7C00F2 */ fmuls f3, f28, f3
/* 0000C560 EC5C00B2 */ fmuls f2, f28, f2
/* 0000C564 EC3C0072 */ fmuls f1, f28, f1
/* 0000C568 EC7B00F2 */ fmuls f3, f27, f3
/* 0000C56C ECFB01B2 */ fmuls f7, f27, f6
/* 0000C570 EC5B00B2 */ fmuls f2, f27, f2
/* 0000C574 D06100A4 */ stfs f3, 0xa4(r1)
/* 0000C578 EC3B0072 */ fmuls f1, f27, f1
/* 0000C57C ED1B0172 */ fmuls f8, f27, f5
/* 0000C580 D04100A8 */ stfs f2, 0xa8(r1)
/* 0000C584 ECDB0132 */ fmuls f6, f27, f4
/* 0000C588 D02100AC */ stfs f1, 0xac(r1)
/* 0000C58C C06100A4 */ lfs f3, 0xa4(r1)
/* 0000C590 C04100A8 */ lfs f2, 0xa8(r1)
/* 0000C594 C02100AC */ lfs f1, 0xac(r1)
/* 0000C598 EC830772 */ fmuls f4, f3, f29
/* 0000C59C D0E100B0 */ stfs f7, 0xb0(r1)
/* 0000C5A0 ECE20772 */ fmuls f7, f2, f29
/* 0000C5A4 ECA10772 */ fmuls f5, f1, f29
/* 0000C5A8 D10100B4 */ stfs f8, 0xb4(r1)
/* 0000C5AC EC6307F2 */ fmuls f3, f3, f31
/* 0000C5B0 D0C100B8 */ stfs f6, 0xb8(r1)
/* 0000C5B4 EC4207F2 */ fmuls f2, f2, f31
/* 0000C5B8 EC2107F2 */ fmuls f1, f1, f31
/* 0000C5BC C14100B0 */ lfs f10, 0xb0(r1)
/* 0000C5C0 C10100B4 */ lfs f8, 0xb4(r1)
/* 0000C5C4 C0C100B8 */ lfs f6, 0xb8(r1)
/* 0000C5C8 ED2A2028 */ fsubs f9, f10, f4
/* 0000C5CC EC8A182A */ fadds f4, f10, f3
/* 0000C5D0 ECE83828 */ fsubs f7, f8, f7
/* 0000C5D4 D12100D4 */ stfs f9, 0xd4(r1)
/* 0000C5D8 ECA62828 */ fsubs f5, f6, f5
/* 0000C5DC EC68102A */ fadds f3, f8, f2
/* 0000C5E0 D0E100D8 */ stfs f7, 0xd8(r1)
/* 0000C5E4 EC46082A */ fadds f2, f6, f1
/* 0000C5E8 D0A100DC */ stfs f5, 0xdc(r1)
/* 0000C5EC D08100C8 */ stfs f4, 0xc8(r1)
/* 0000C5F0 C02100D4 */ lfs f1, 0xd4(r1)
/* 0000C5F4 C89F03C8 */ lfd f4, 0x3c8(r31)
/* 0000C5F8 EC010028 */ fsubs f0, f1, f0
/* 0000C5FC FC24182A */ fadd f1, f4, f3
/* 0000C600 FC200818 */ frsp f1, f1
/* 0000C604 D02100CC */ stfs f1, 0xcc(r1)
/* 0000C608 D04100D0 */ stfs f2, 0xd0(r1)
/* 0000C60C C03D0000 */ lfs f1, 0(r29)
/* 0000C610 EC01002A */ fadds f0, f1, f0
/* 0000C614 D01D0000 */ stfs f0, 0(r29)
/* 0000C618 C02100D8 */ lfs f1, 0xd8(r1)
/* 0000C61C 1C1C000C */ mulli r0, r28, 0xc
/* 0000C620 C00100F0 */ lfs f0, 0xf0(r1)
/* 0000C624 C05D0004 */ lfs f2, 4(r29)
/* 0000C628 EC010028 */ fsubs f0, f1, f0
/* 0000C62C 7CD80214 */ add r6, r24, r0
/* 0000C630 3861001C */ addi r3, r1, 0x1c
/* 0000C634 388100BC */ addi r4, r1, 0xbc
/* 0000C638 EC02002A */ fadds f0, f2, f0
/* 0000C63C 38A10010 */ addi r5, r1, 0x10
/* 0000C640 D01D0004 */ stfs f0, 4(r29)
/* 0000C644 C02100DC */ lfs f1, 0xdc(r1)
/* 0000C648 C00100F4 */ lfs f0, 0xf4(r1)
/* 0000C64C C05D0008 */ lfs f2, 8(r29)
/* 0000C650 EC010028 */ fsubs f0, f1, f0
/* 0000C654 EC02002A */ fadds f0, f2, f0
/* 0000C658 D01D0008 */ stfs f0, 8(r29)
/* 0000C65C C02100C8 */ lfs f1, 0xc8(r1)
/* 0000C660 C00100E0 */ lfs f0, 0xe0(r1)
/* 0000C664 C0580130 */ lfs f2, 0x130(r24)
/* 0000C668 EC010028 */ fsubs f0, f1, f0
/* 0000C66C EC02002A */ fadds f0, f2, f0
/* 0000C670 D0180130 */ stfs f0, 0x130(r24)
/* 0000C674 C02100CC */ lfs f1, 0xcc(r1)
/* 0000C678 C00100E4 */ lfs f0, 0xe4(r1)
/* 0000C67C C0580134 */ lfs f2, 0x134(r24)
/* 0000C680 EC010028 */ fsubs f0, f1, f0
/* 0000C684 EC02002A */ fadds f0, f2, f0
/* 0000C688 D0180134 */ stfs f0, 0x134(r24)
/* 0000C68C C02100D0 */ lfs f1, 0xd0(r1)
/* 0000C690 C00100E8 */ lfs f0, 0xe8(r1)
/* 0000C694 C0580138 */ lfs f2, 0x138(r24)
/* 0000C698 EC010028 */ fsubs f0, f1, f0
/* 0000C69C EC02002A */ fadds f0, f2, f0
/* 0000C6A0 D0180138 */ stfs f0, 0x138(r24)
/* 0000C6A4 C83F0510 */ lfd f1, 0x510(r31)
/* 0000C6A8 C00100BC */ lfs f0, 0xbc(r1)
/* 0000C6AC FC010032 */ fmul f0, f1, f0
/* 0000C6B0 FC000018 */ frsp f0, f0
/* 0000C6B4 D00100BC */ stfs f0, 0xbc(r1)
/* 0000C6B8 C83F0510 */ lfd f1, 0x510(r31)
/* 0000C6BC C00100C0 */ lfs f0, 0xc0(r1)
/* 0000C6C0 FC010032 */ fmul f0, f1, f0
/* 0000C6C4 FC000018 */ frsp f0, f0
/* 0000C6C8 D00100C0 */ stfs f0, 0xc0(r1)
/* 0000C6CC C83F0510 */ lfd f1, 0x510(r31)
/* 0000C6D0 C00100C4 */ lfs f0, 0xc4(r1)
/* 0000C6D4 FC010032 */ fmul f0, f1, f0
/* 0000C6D8 FC000018 */ frsp f0, f0
/* 0000C6DC D00100C4 */ stfs f0, 0xc4(r1)
/* 0000C6E0 C0260004 */ lfs f1, 4(r6)
/* 0000C6E4 C0180124 */ lfs f0, 0x124(r24)
/* 0000C6E8 EC010028 */ fsubs f0, f1, f0
/* 0000C6EC D001001C */ stfs f0, 0x1c(r1)
/* 0000C6F0 C0260008 */ lfs f1, 8(r6)
/* 0000C6F4 C0180128 */ lfs f0, 0x128(r24)
/* 0000C6F8 EC010028 */ fsubs f0, f1, f0
/* 0000C6FC D0010020 */ stfs f0, 0x20(r1)
/* 0000C700 C026000C */ lfs f1, 0xc(r6)
/* 0000C704 C018012C */ lfs f0, 0x12c(r24)
/* 0000C708 EC010028 */ fsubs f0, f1, f0
/* 0000C70C D0010024 */ stfs f0, 0x24(r1)
/* 0000C710 480011BD */ bl lbl_0000D8CC
/* 0000C714 1C1C0014 */ mulli r0, r28, 0x14
/* 0000C718 807F03A8 */ lwz r3, 0x3a8(r31)
/* 0000C71C EC1F06F2 */ fmuls f0, f31, f27
/* 0000C720 C8BF04D0 */ lfd f5, 0x4d0(r31)
/* 0000C724 EC3D06F2 */ fmuls f1, f29, f27
/* 0000C728 7C630214 */ add r3, r3, r0
/* 0000C72C EC5E0032 */ fmuls f2, f30, f0
/* 0000C730 C0830010 */ lfs f4, 0x10(r3)
/* 0000C734 EC7E0072 */ fmuls f3, f30, f1
/* 0000C738 C8DF04C8 */ lfd f6, 0x4c8(r31)
/* 0000C73C FC052024 */ fdiv f0, f5, f4
/* 0000C740 C03F0388 */ lfs f1, 0x388(r31)
/* 0000C744 C0810010 */ lfs f4, 0x10(r1)
/* 0000C748 FCA6002A */ fadd f5, f6, f0
/* 0000C74C FCA02818 */ frsp f5, f5
/* 0000C750 EC010172 */ fmuls f0, f1, f5
/* 0000C754 EC040032 */ fmuls f0, f4, f0
/* 0000C758 D0010010 */ stfs f0, 0x10(r1)
/* 0000C75C C01F038C */ lfs f0, 0x38c(r31)
/* 0000C760 C0210014 */ lfs f1, 0x14(r1)
/* 0000C764 EC000172 */ fmuls f0, f0, f5
/* 0000C768 EC010032 */ fmuls f0, f1, f0
/* 0000C76C D0010014 */ stfs f0, 0x14(r1)
/* 0000C770 C01F0390 */ lfs f0, 0x390(r31)
/* 0000C774 C0210018 */ lfs f1, 0x18(r1)
/* 0000C778 EC000172 */ fmuls f0, f0, f5
/* 0000C77C EC010032 */ fmuls f0, f1, f0
/* 0000C780 D0010018 */ stfs f0, 0x18(r1)
/* 0000C784 80010010 */ lwz r0, 0x10(r1)
/* 0000C788 80610014 */ lwz r3, 0x14(r1)
/* 0000C78C 9001005C */ stw r0, 0x5c(r1)
/* 0000C790 80010018 */ lwz r0, 0x18(r1)
/* 0000C794 90610060 */ stw r3, 0x60(r1)
/* 0000C798 90010064 */ stw r0, 0x64(r1)
/* 0000C79C C021005C */ lfs f1, 0x5c(r1)
/* 0000C7A0 C018013C */ lfs f0, 0x13c(r24)
/* 0000C7A4 EC01002A */ fadds f0, f1, f0
/* 0000C7A8 D018013C */ stfs f0, 0x13c(r24)
/* 0000C7AC C0210060 */ lfs f1, 0x60(r1)
/* 0000C7B0 C0180140 */ lfs f0, 0x140(r24)
/* 0000C7B4 EC01002A */ fadds f0, f1, f0
/* 0000C7B8 D0180140 */ stfs f0, 0x140(r24)
/* 0000C7BC C0210064 */ lfs f1, 0x64(r1)
/* 0000C7C0 C0180144 */ lfs f0, 0x144(r24)
/* 0000C7C4 EC01002A */ fadds f0, f1, f0
/* 0000C7C8 D0180144 */ stfs f0, 0x144(r24)
/* 0000C7CC 807F04D8 */ lwz r3, 0x4d8(r31)
/* 0000C7D0 801F04DC */ lwz r0, 0x4dc(r31)
/* 0000C7D4 90610044 */ stw r3, 0x44(r1)
/* 0000C7D8 90010048 */ stw r0, 0x48(r1)
/* 0000C7DC 801F04E0 */ lwz r0, 0x4e0(r31)
/* 0000C7E0 9001004C */ stw r0, 0x4c(r1)
/* 0000C7E4 C89F04B0 */ lfd f4, 0x4b0(r31)
/* 0000C7E8 C0380124 */ lfs f1, 0x124(r24)
/* 0000C7EC C01E0000 */ lfs f0, 0(r30)
/* 0000C7F0 FF6400F2 */ fmul f27, f4, f3
/* 0000C7F4 EC010028 */ fsubs f0, f1, f0
/* 0000C7F8 FF8400B2 */ fmul f28, f4, f2
/* 0000C7FC D0010050 */ stfs f0, 0x50(r1)
/* 0000C800 FF60D818 */ frsp f27, f27
/* 0000C804 C01F03E8 */ lfs f0, 0x3e8(r31)
/* 0000C808 FF80E018 */ frsp f28, f28
/* 0000C80C D0010054 */ stfs f0, 0x54(r1)
/* 0000C810 C038012C */ lfs f1, 0x12c(r24)
/* 0000C814 C01E0008 */ lfs f0, 8(r30)
/* 0000C818 EC010028 */ fsubs f0, f1, f0
/* 0000C81C D0010058 */ stfs f0, 0x58(r1)
/* 0000C820 C0410050 */ lfs f2, 0x50(r1)
/* 0000C824 C0210054 */ lfs f1, 0x54(r1)
/* 0000C828 C0010058 */ lfs f0, 0x58(r1)
/* 0000C82C EC4200B2 */ fmuls f2, f2, f2
/* 0000C830 EC41107A */ fmadds f2, f1, f1, f2
/* 0000C834 EC40103A */ fmadds f2, f0, f0, f2
/* 0000C838 C01F0458 */ lfs f0, 0x458(r31)
/* 0000C83C FC201090 */ fmr f1, f2
/* 0000C840 FC010040 */ fcmpo cr0, f1, f0
/* 0000C844 40810048 */ ble lbl_0000C88C
/* 0000C848 4BFF3919 */ bl mathutil_rsqrt
/* 0000C84C FC00E050 */ fneg f0, f28
/* 0000C850 C0610050 */ lfs f3, 0x50(r1)
/* 0000C854 EC9B0072 */ fmuls f4, f27, f1
/* 0000C858 C0410044 */ lfs f2, 0x44(r1)
/* 0000C85C EC200072 */ fmuls f1, f0, f1
/* 0000C860 EC630132 */ fmuls f3, f3, f4
/* 0000C864 EC020072 */ fmuls f0, f2, f1
/* 0000C868 D0610050 */ stfs f3, 0x50(r1)
/* 0000C86C D0010044 */ stfs f0, 0x44(r1)
/* 0000C870 C0410058 */ lfs f2, 0x58(r1)
/* 0000C874 C001004C */ lfs f0, 0x4c(r1)
/* 0000C878 EC420132 */ fmuls f2, f2, f4
/* 0000C87C EC000072 */ fmuls f0, f0, f1
/* 0000C880 D0410058 */ stfs f2, 0x58(r1)
/* 0000C884 D001004C */ stfs f0, 0x4c(r1)
/* 0000C888 48000020 */ b lbl_0000C8A8
lbl_0000C88C:
/* 0000C88C C03F03E8 */ lfs f1, 0x3e8(r31)
/* 0000C890 FC00E050 */ fneg f0, f28
/* 0000C894 D0210050 */ stfs f1, 0x50(r1)
/* 0000C898 D3610058 */ stfs f27, 0x58(r1)
/* 0000C89C C03F03E8 */ lfs f1, 0x3e8(r31)
/* 0000C8A0 D0210044 */ stfs f1, 0x44(r1)
/* 0000C8A4 D001004C */ stfs f0, 0x4c(r1)
lbl_0000C8A8:
/* 0000C8A8 38780000 */ addi r3, r24, 0
/* 0000C8AC 38810050 */ addi r4, r1, 0x50
/* 0000C8B0 48000C25 */ bl lbl_0000D4D4
/* 0000C8B4 C0210044 */ lfs f1, 0x44(r1)
/* 0000C8B8 C01E0000 */ lfs f0, 0(r30)
/* 0000C8BC EC01002A */ fadds f0, f1, f0
/* 0000C8C0 D01E0000 */ stfs f0, 0(r30)
/* 0000C8C4 C0210048 */ lfs f1, 0x48(r1)
/* 0000C8C8 C01E0004 */ lfs f0, 4(r30)
/* 0000C8CC EC01002A */ fadds f0, f1, f0
/* 0000C8D0 D01E0004 */ stfs f0, 4(r30)
/* 0000C8D4 C021004C */ lfs f1, 0x4c(r1)
/* 0000C8D8 C01E0008 */ lfs f0, 8(r30)
/* 0000C8DC EC01002A */ fadds f0, f1, f0
/* 0000C8E0 D01E0008 */ stfs f0, 8(r30)
/* 0000C8E4 C02100BC */ lfs f1, 0xbc(r1)
/* 0000C8E8 C04100C0 */ lfs f2, 0xc0(r1)
/* 0000C8EC C00100C4 */ lfs f0, 0xc4(r1)
/* 0000C8F0 EC210072 */ fmuls f1, f1, f1
/* 0000C8F4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C8F8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000C8FC 4BFF3865 */ bl mathutil_sqrt
/* 0000C900 C81F0498 */ lfd f0, 0x498(r31)
/* 0000C904 FC010040 */ fcmpo cr0, f1, f0
/* 0000C908 40810178 */ ble lbl_0000CA80
/* 0000C90C 807F04E4 */ lwz r3, 0x4e4(r31)
/* 0000C910 801F04E8 */ lwz r0, 0x4e8(r31)
/* 0000C914 90610038 */ stw r3, 0x38(r1)
/* 0000C918 9001003C */ stw r0, 0x3c(r1)
/* 0000C91C 801F04EC */ lwz r0, 0x4ec(r31)
/* 0000C920 90010040 */ stw r0, 0x40(r1)
/* 0000C924 807F04F0 */ lwz r3, 0x4f0(r31)
/* 0000C928 801F04F4 */ lwz r0, 0x4f4(r31)
/* 0000C92C 9061002C */ stw r3, 0x2c(r1)
/* 0000C930 90010030 */ stw r0, 0x30(r1)
/* 0000C934 801F04F8 */ lwz r0, 0x4f8(r31)
/* 0000C938 90010034 */ stw r0, 0x34(r1)
/* 0000C93C C85F0518 */ lfd f2, 0x518(r31)
/* 0000C940 C81F03C0 */ lfd f0, 0x3c0(r31)
/* 0000C944 FC220072 */ fmul f1, f2, f1
/* 0000C948 FC010040 */ fcmpo cr0, f1, f0
/* 0000C94C 40800008 */ bge lbl_0000C954
/* 0000C950 48000008 */ b lbl_0000C958
lbl_0000C954:
/* 0000C954 FC200090 */ fmr f1, f0
lbl_0000C958:
/* 0000C958 FF600818 */ frsp f27, f1
/* 0000C95C C05F0478 */ lfs f2, 0x478(r31)
/* 0000C960 C01F0480 */ lfs f0, 0x480(r31)
/* 0000C964 38610038 */ addi r3, r1, 0x38
/* 0000C968 C03F047C */ lfs f1, 0x47c(r31)
/* 0000C96C EC4206F2 */ fmuls f2, f2, f27
/* 0000C970 EC0006F2 */ fmuls f0, f0, f27
/* 0000C974 EC220828 */ fsubs f1, f2, f1
/* 0000C978 FC00001E */ fctiwz f0, f0
/* 0000C97C FC20081E */ fctiwz f1, f1
/* 0000C980 D8010108 */ stfd f0, 0x108(r1)
/* 0000C984 8341010C */ lwz r26, 0x10c(r1)
/* 0000C988 D8210110 */ stfd f1, 0x110(r1)
/* 0000C98C 7F400774 */ extsb r0, r26
/* 0000C990 5400103A */ slwi r0, r0, 2
/* 0000C994 80810114 */ lwz r4, 0x114(r1)
/* 0000C998 7C03002E */ lwzx r0, r3, r0
/* 0000C99C 54835BA8 */ rlwinm r3, r4, 0xb, 0xe, 0x14
/* 0000C9A0 7C630378 */ or r3, r3, r0
/* 0000C9A4 4BFF37BD */ bl func_8002B610
/* 0000C9A8 3AE30000 */ addi r23, r3, 0
/* 0000C9AC 2C17FFFF */ cmpwi r23, -1
/* 0000C9B0 4182005C */ beq lbl_0000CA0C
/* 0000C9B4 4BFF37AD */ bl rand
/* 0000C9B8 5464053E */ clrlwi r4, r3, 0x14
/* 0000C9BC 56E3043E */ clrlwi r3, r23, 0x10
/* 0000C9C0 38841800 */ addi r4, r4, 0x1800
/* 0000C9C4 4BFF379D */ bl func_8002C3E0
/* 0000C9C8 3C600000 */ lis r3, modeCtrl@ha
/* 0000C9CC 38630000 */ addi r3, r3, modeCtrl@l
/* 0000C9D0 8003002C */ lwz r0, 0x2c(r3)
/* 0000C9D4 3C600000 */ lis r3, cameraInfo@ha
/* 0000C9D8 38630000 */ addi r3, r3, cameraInfo@l
/* 0000C9DC 1C000284 */ mulli r0, r0, 0x284
/* 0000C9E0 7C630214 */ add r3, r3, r0
/* 0000C9E4 A8A3001A */ lha r5, 0x1a(r3)
/* 0000C9E8 38780124 */ addi r3, r24, 0x124
/* 0000C9EC 389F03B0 */ addi r4, r31, 0x3b0
/* 0000C9F0 38C10029 */ addi r6, r1, 0x29
/* 0000C9F4 38E10028 */ addi r7, r1, 0x28
/* 0000C9F8 48000E01 */ bl lbl_0000D7F8
/* 0000C9FC 88810029 */ lbz r4, 0x29(r1)
/* 0000CA00 56E3043E */ clrlwi r3, r23, 0x10
/* 0000CA04 88A10028 */ lbz r5, 0x28(r1)
/* 0000CA08 4BFF3759 */ bl SoundPan
lbl_0000CA0C:
/* 0000CA0C 7F400774 */ extsb r0, r26
/* 0000CA10 5400103A */ slwi r0, r0, 2
/* 0000CA14 3861002C */ addi r3, r1, 0x2c
/* 0000CA18 7C63002E */ lwzx r3, r3, r0
/* 0000CA1C 4BFF3745 */ bl g_play_sound
/* 0000CA20 C05F0520 */ lfs f2, 0x520(r31)
/* 0000CA24 C03F0524 */ lfs f1, 0x524(r31)
/* 0000CA28 EC0206F2 */ fmuls f0, f2, f27
/* 0000CA2C FC000840 */ fcmpo cr0, f0, f1
/* 0000CA30 40800008 */ bge lbl_0000CA38
/* 0000CA34 48000018 */ b lbl_0000CA4C
lbl_0000CA38:
/* 0000CA38 FC001040 */ fcmpo cr0, f0, f2
/* 0000CA3C 40810008 */ ble lbl_0000CA44
/* 0000CA40 48000008 */ b lbl_0000CA48
lbl_0000CA44:
/* 0000CA44 FC400090 */ fmr f2, f0
lbl_0000CA48:
/* 0000CA48 FC201090 */ fmr f1, f2
lbl_0000CA4C:
/* 0000CA4C 3C600000 */ lis r3, modeCtrl@ha
/* 0000CA50 FC00081E */ fctiwz f0, f1
/* 0000CA54 38630000 */ addi r3, r3, modeCtrl@l
/* 0000CA58 8003002C */ lwz r0, 0x2c(r3)
/* 0000CA5C 3C600000 */ lis r3, lbl_80206BD0@ha
/* 0000CA60 D8010108 */ stfd f0, 0x108(r1)
/* 0000CA64 5404103A */ slwi r4, r0, 2
/* 0000CA68 38030000 */ addi r0, r3, lbl_80206BD0@l
/* 0000CA6C 80A1010C */ lwz r5, 0x10c(r1)
/* 0000CA70 7C602214 */ add r3, r0, r4
/* 0000CA74 80630000 */ lwz r3, 0(r3)
/* 0000CA78 38800001 */ li r4, 1
/* 0000CA7C 4BFF36E5 */ bl func_800B60F4
lbl_0000CA80:
/* 0000CA80 BA61011C */ lmw r19, 0x11c(r1)
/* 0000CA84 8001017C */ lwz r0, 0x17c(r1)
/* 0000CA88 CBE10170 */ lfd f31, 0x170(r1)
/* 0000CA8C CBC10168 */ lfd f30, 0x168(r1)
/* 0000CA90 7C0803A6 */ mtlr r0
/* 0000CA94 CBA10160 */ lfd f29, 0x160(r1)
/* 0000CA98 CB810158 */ lfd f28, 0x158(r1)
/* 0000CA9C CB610150 */ lfd f27, 0x150(r1)
/* 0000CAA0 38210178 */ addi r1, r1, 0x178
/* 0000CAA4 4E800020 */ blr 
lbl_0000CAA8:
/* 0000CAA8 7C0802A6 */ mflr r0
/* 0000CAAC 1CA30184 */ mulli r5, r3, 0x184
/* 0000CAB0 90010004 */ stw r0, 4(r1)
/* 0000CAB4 9421FE78 */ stwu r1, -0x188(r1)
/* 0000CAB8 3C800000 */ lis r4, lbl_10018510@ha
/* 0000CABC DBE10180 */ stfd f31, 0x180(r1)
/* 0000CAC0 DBC10178 */ stfd f30, 0x178(r1)
/* 0000CAC4 DBA10170 */ stfd f29, 0x170(r1)
/* 0000CAC8 DB810168 */ stfd f28, 0x168(r1)
/* 0000CACC DB610160 */ stfd f27, 0x160(r1)
/* 0000CAD0 BE010120 */ stmw r16, 0x120(r1)
/* 0000CAD4 3B430001 */ addi r26, r3, 1
/* 0000CAD8 38640000 */ addi r3, r4, lbl_10018510@l
/* 0000CADC 7F232A14 */ add r25, r3, r5
/* 0000CAE0 1C1A0184 */ mulli r0, r26, 0x184
/* 0000CAE4 7F030214 */ add r24, r3, r0
/* 0000CAE8 3CA00000 */ lis r5, lbl_00014800@ha
/* 0000CAEC 3C800000 */ lis r4, cameraInfo@ha
/* 0000CAF0 3C600000 */ lis r3, modeCtrl@ha
/* 0000CAF4 3B850000 */ addi r28, r5, lbl_00014800@l
/* 0000CAF8 3BC40000 */ addi r30, r4, cameraInfo@l
/* 0000CAFC 3BE30000 */ addi r31, r3, modeCtrl@l
/* 0000CB00 3BA10040 */ addi r29, r1, 0x40
/* 0000CB04 3B790124 */ addi r27, r25, 0x124
/* 0000CB08 4800099C */ b lbl_0000D4A4
lbl_0000CB0C:
/* 0000CB0C 80780000 */ lwz r3, 0(r24)
/* 0000CB10 C3FC03E8 */ lfs f31, 0x3e8(r28)
/* 0000CB14 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000CB18 41820984 */ beq lbl_0000D49C
/* 0000CB1C 546006F9 */ rlwinm. r0, r3, 0, 0x1b, 0x1c
/* 0000CB20 4082097C */ bne lbl_0000D49C
/* 0000CB24 38780124 */ addi r3, r24, 0x124
/* 0000CB28 C0BB0000 */ lfs f5, 0(r27)
/* 0000CB2C C0430000 */ lfs f2, 0(r3)
/* 0000CB30 C09B0004 */ lfs f4, 4(r27)
/* 0000CB34 C0230004 */ lfs f1, 4(r3)
/* 0000CB38 C07B0008 */ lfs f3, 8(r27)
/* 0000CB3C C0030008 */ lfs f0, 8(r3)
/* 0000CB40 ECA51028 */ fsubs f5, f5, f2
/* 0000CB44 EC840828 */ fsubs f4, f4, f1
/* 0000CB48 EC630028 */ fsubs f3, f3, f0
/* 0000CB4C EC250172 */ fmuls f1, f5, f5
/* 0000CB50 EC24093A */ fmadds f1, f4, f4, f1
/* 0000CB54 EC2308FA */ fmadds f1, f3, f3, f1
/* 0000CB58 C81C0538 */ lfd f0, 0x538(r28)
/* 0000CB5C FC000840 */ fcmpo cr0, f0, f1
/* 0000CB60 4180093C */ blt lbl_0000D49C
/* 0000CB64 3AE00000 */ li r23, 0
/* 0000CB68 3A600000 */ li r19, 0
/* 0000CB6C 3A400000 */ li r18, 0
/* 0000CB70 4800008C */ b lbl_0000CBFC
lbl_0000CB74:
/* 0000CB74 3AC00000 */ li r22, 0
/* 0000CB78 3A200000 */ li r17, 0
/* 0000CB7C 3A000000 */ li r16, 0
/* 0000CB80 48000064 */ b lbl_0000CBE4
lbl_0000CB84:
/* 0000CB84 801C03A8 */ lwz r0, 0x3a8(r28)
/* 0000CB88 38920094 */ addi r4, r18, 0x94
/* 0000CB8C 38B20004 */ addi r5, r18, 4
/* 0000CB90 7CC09A14 */ add r6, r0, r19
/* 0000CB94 7C608A14 */ add r3, r0, r17
/* 0000CB98 C026000C */ lfs f1, 0xc(r6)
/* 0000CB9C 38D00094 */ addi r6, r16, 0x94
/* 0000CBA0 C043000C */ lfs f2, 0xc(r3)
/* 0000CBA4 38F00004 */ addi r7, r16, 4
/* 0000CBA8 3861010C */ addi r3, r1, 0x10c
/* 0000CBAC 7C992214 */ add r4, r25, r4
/* 0000CBB0 7CB92A14 */ add r5, r25, r5
/* 0000CBB4 7CD83214 */ add r6, r24, r6
/* 0000CBB8 7CF83A14 */ add r7, r24, r7
/* 0000CBBC 480009DD */ bl lbl_0000D598
/* 0000CBC0 C001010C */ lfs f0, 0x10c(r1)
/* 0000CBC4 FC00F840 */ fcmpo cr0, f0, f31
/* 0000CBC8 40810010 */ ble lbl_0000CBD8
/* 0000CBCC FFE00090 */ fmr f31, f0
/* 0000CBD0 3AB70000 */ addi r21, r23, 0
/* 0000CBD4 3A960000 */ addi r20, r22, 0
lbl_0000CBD8:
/* 0000CBD8 3AD60001 */ addi r22, r22, 1
/* 0000CBDC 3A310014 */ addi r17, r17, 0x14
/* 0000CBE0 3A10000C */ addi r16, r16, 0xc
lbl_0000CBE4:
/* 0000CBE4 881C03AC */ lbz r0, 0x3ac(r28)
/* 0000CBE8 7C160000 */ cmpw r22, r0
/* 0000CBEC 4180FF98 */ blt lbl_0000CB84
/* 0000CBF0 3AF70001 */ addi r23, r23, 1
/* 0000CBF4 3A730014 */ addi r19, r19, 0x14
/* 0000CBF8 3A52000C */ addi r18, r18, 0xc
lbl_0000CBFC:
/* 0000CBFC 881C03AC */ lbz r0, 0x3ac(r28)
/* 0000CC00 7C170000 */ cmpw r23, r0
/* 0000CC04 4180FF70 */ blt lbl_0000CB74
/* 0000CC08 C81C0400 */ lfd f0, 0x400(r28)
/* 0000CC0C FC00F800 */ fcmpu cr0, f0, f31
/* 0000CC10 4182088C */ beq lbl_0000D49C
/* 0000CC14 80190000 */ lwz r0, 0(r25)
/* 0000CC18 1CD5000C */ mulli r6, r21, 0xc
/* 0000CC1C 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 0000CC20 90190000 */ stw r0, 0(r25)
/* 0000CC24 1C94000C */ mulli r4, r20, 0xc
/* 0000CC28 80180000 */ lwz r0, 0(r24)
/* 0000CC2C 38660094 */ addi r3, r6, 0x94
/* 0000CC30 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 0000CC34 90180000 */ stw r0, 0(r24)
/* 0000CC38 38A40094 */ addi r5, r4, 0x94
/* 0000CC3C 1D350014 */ mulli r9, r21, 0x14
/* 0000CC40 80190000 */ lwz r0, 0(r25)
/* 0000CC44 60000004 */ ori r0, r0, 4
/* 0000CC48 90190000 */ stw r0, 0(r25)
/* 0000CC4C 1C140014 */ mulli r0, r20, 0x14
/* 0000CC50 80F80000 */ lwz r7, 0(r24)
/* 0000CC54 7D193214 */ add r8, r25, r6
/* 0000CC58 60E60004 */ ori r6, r7, 4
/* 0000CC5C 90D80000 */ stw r6, 0(r24)
/* 0000CC60 7D582214 */ add r10, r24, r4
/* 0000CC64 1CF70014 */ mulli r7, r23, 0x14
/* 0000CC68 80DC03A8 */ lwz r6, 0x3a8(r28)
/* 0000CC6C C39C0398 */ lfs f28, 0x398(r28)
/* 0000CC70 7D264A14 */ add r9, r6, r9
/* 0000CC74 80880004 */ lwz r4, 4(r8)
/* 0000CC78 7CC60214 */ add r6, r6, r0
/* 0000CC7C C3C90010 */ lfs f30, 0x10(r9)
/* 0000CC80 C3A60010 */ lfs f29, 0x10(r6)
/* 0000CC84 1C160014 */ mulli r0, r22, 0x14
/* 0000CC88 80C80008 */ lwz r6, 8(r8)
/* 0000CC8C 908100A0 */ stw r4, 0xa0(r1)
/* 0000CC90 7C791A14 */ add r3, r25, r3
/* 0000CC94 388100A0 */ addi r4, r1, 0xa0
/* 0000CC98 90C100A4 */ stw r6, 0xa4(r1)
/* 0000CC9C 7CB82A14 */ add r5, r24, r5
/* 0000CCA0 38C10094 */ addi r6, r1, 0x94
/* 0000CCA4 8108000C */ lwz r8, 0xc(r8)
/* 0000CCA8 910100A8 */ stw r8, 0xa8(r1)
/* 0000CCAC 812A0004 */ lwz r9, 4(r10)
/* 0000CCB0 810A0008 */ lwz r8, 8(r10)
/* 0000CCB4 91210094 */ stw r9, 0x94(r1)
/* 0000CCB8 91010098 */ stw r8, 0x98(r1)
/* 0000CCBC 810A000C */ lwz r8, 0xc(r10)
/* 0000CCC0 9101009C */ stw r8, 0x9c(r1)
/* 0000CCC4 813C03A8 */ lwz r9, 0x3a8(r28)
/* 0000CCC8 7D093A14 */ add r8, r9, r7
/* 0000CCCC 7CE90214 */ add r7, r9, r0
/* 0000CCD0 C028000C */ lfs f1, 0xc(r8)
/* 0000CCD4 C047000C */ lfs f2, 0xc(r7)
/* 0000CCD8 4BFF3489 */ bl func_8006AAEC
/* 0000CCDC C02100A0 */ lfs f1, 0xa0(r1)
/* 0000CCE0 38610100 */ addi r3, r1, 0x100
/* 0000CCE4 C0010094 */ lfs f0, 0x94(r1)
/* 0000CCE8 C06100A4 */ lfs f3, 0xa4(r1)
/* 0000CCEC EC810028 */ fsubs f4, f1, f0
/* 0000CCF0 C0410098 */ lfs f2, 0x98(r1)
/* 0000CCF4 C02100A8 */ lfs f1, 0xa8(r1)
/* 0000CCF8 C001009C */ lfs f0, 0x9c(r1)
/* 0000CCFC EC431028 */ fsubs f2, f3, f2
/* 0000CD00 D0810100 */ stfs f4, 0x100(r1)
/* 0000CD04 EC010028 */ fsubs f0, f1, f0
/* 0000CD08 D0410104 */ stfs f2, 0x104(r1)
/* 0000CD0C D0010108 */ stfs f0, 0x108(r1)
/* 0000CD10 4BFF3451 */ bl mathutil_vec_normalize_len
/* 0000CD14 C81C0400 */ lfd f0, 0x400(r28)
/* 0000CD18 FC000800 */ fcmpu cr0, f0, f1
/* 0000CD1C 4082001C */ bne lbl_0000CD38
/* 0000CD20 C01C03E8 */ lfs f0, 0x3e8(r28)
/* 0000CD24 D0010100 */ stfs f0, 0x100(r1)
/* 0000CD28 C01C03E8 */ lfs f0, 0x3e8(r28)
/* 0000CD2C D0010104 */ stfs f0, 0x104(r1)
/* 0000CD30 C01C0540 */ lfs f0, 0x540(r28)
/* 0000CD34 D0010108 */ stfs f0, 0x108(r1)
lbl_0000CD38:
/* 0000CD38 1C15000C */ mulli r0, r21, 0xc
/* 0000CD3C 7C790214 */ add r3, r25, r0
/* 0000CD40 C0230004 */ lfs f1, 4(r3)
/* 0000CD44 C0030094 */ lfs f0, 0x94(r3)
/* 0000CD48 EC010028 */ fsubs f0, f1, f0
/* 0000CD4C D0010088 */ stfs f0, 0x88(r1)
/* 0000CD50 C0230008 */ lfs f1, 8(r3)
/* 0000CD54 C0030098 */ lfs f0, 0x98(r3)
/* 0000CD58 EC010028 */ fsubs f0, f1, f0
/* 0000CD5C D001008C */ stfs f0, 0x8c(r1)
/* 0000CD60 C023000C */ lfs f1, 0xc(r3)
/* 0000CD64 C003009C */ lfs f0, 0x9c(r3)
/* 0000CD68 EC010028 */ fsubs f0, f1, f0
/* 0000CD6C D0010090 */ stfs f0, 0x90(r1)
/* 0000CD70 C0A10100 */ lfs f5, 0x100(r1)
/* 0000CD74 C0410088 */ lfs f2, 0x88(r1)
/* 0000CD78 C0810104 */ lfs f4, 0x104(r1)
/* 0000CD7C C021008C */ lfs f1, 0x8c(r1)
/* 0000CD80 C0610108 */ lfs f3, 0x108(r1)
/* 0000CD84 C0010090 */ lfs f0, 0x90(r1)
/* 0000CD88 ECE500B2 */ fmuls f7, f5, f2
/* 0000CD8C ECE4387A */ fmadds f7, f4, f1, f7
/* 0000CD90 ECE3383A */ fmadds f7, f3, f0, f7
/* 0000CD94 C0A10100 */ lfs f5, 0x100(r1)
/* 0000CD98 C0410104 */ lfs f2, 0x104(r1)
/* 0000CD9C 1C14000C */ mulli r0, r20, 0xc
/* 0000CDA0 C0C10108 */ lfs f6, 0x108(r1)
/* 0000CDA4 EC6501F2 */ fmuls f3, f5, f7
/* 0000CDA8 7C780214 */ add r3, r24, r0
/* 0000CDAC EC2201F2 */ fmuls f1, f2, f7
/* 0000CDB0 EC0601F2 */ fmuls f0, f6, f7
/* 0000CDB4 D06100F4 */ stfs f3, 0xf4(r1)
/* 0000CDB8 D02100F8 */ stfs f1, 0xf8(r1)
/* 0000CDBC D00100FC */ stfs f0, 0xfc(r1)
/* 0000CDC0 C0230004 */ lfs f1, 4(r3)
/* 0000CDC4 C0030094 */ lfs f0, 0x94(r3)
/* 0000CDC8 EC010028 */ fsubs f0, f1, f0
/* 0000CDCC D0010088 */ stfs f0, 0x88(r1)
/* 0000CDD0 C0230008 */ lfs f1, 8(r3)
/* 0000CDD4 C0030098 */ lfs f0, 0x98(r3)
/* 0000CDD8 EC010028 */ fsubs f0, f1, f0
/* 0000CDDC D001008C */ stfs f0, 0x8c(r1)
/* 0000CDE0 C023000C */ lfs f1, 0xc(r3)
/* 0000CDE4 C003009C */ lfs f0, 0x9c(r3)
/* 0000CDE8 EC010028 */ fsubs f0, f1, f0
/* 0000CDEC D0010090 */ stfs f0, 0x90(r1)
/* 0000CDF0 C1010100 */ lfs f8, 0x100(r1)
/* 0000CDF4 C0610088 */ lfs f3, 0x88(r1)
/* 0000CDF8 C0E10104 */ lfs f7, 0x104(r1)
/* 0000CDFC C021008C */ lfs f1, 0x8c(r1)
/* 0000CE00 C0810108 */ lfs f4, 0x108(r1)
/* 0000CE04 C0010090 */ lfs f0, 0x90(r1)
/* 0000CE08 ED0800F2 */ fmuls f8, f8, f3
/* 0000CE0C ED07407A */ fmadds f8, f7, f1, f8
/* 0000CE10 ED04403A */ fmadds f8, f4, f0, f8
/* 0000CE14 C08100F4 */ lfs f4, 0xf4(r1)
/* 0000CE18 C06100F8 */ lfs f3, 0xf8(r1)
/* 0000CE1C C02100FC */ lfs f1, 0xfc(r1)
/* 0000CE20 ECA50232 */ fmuls f5, f5, f8
/* 0000CE24 EC420232 */ fmuls f2, f2, f8
/* 0000CE28 EC060232 */ fmuls f0, f6, f8
/* 0000CE2C D0A100E8 */ stfs f5, 0xe8(r1)
/* 0000CE30 D04100EC */ stfs f2, 0xec(r1)
/* 0000CE34 D00100F0 */ stfs f0, 0xf0(r1)
/* 0000CE38 C00100E8 */ lfs f0, 0xe8(r1)
/* 0000CE3C C04100EC */ lfs f2, 0xec(r1)
/* 0000CE40 EC840028 */ fsubs f4, f4, f0
/* 0000CE44 C00100F0 */ lfs f0, 0xf0(r1)
/* 0000CE48 EC431028 */ fsubs f2, f3, f2
/* 0000CE4C EC010028 */ fsubs f0, f1, f0
/* 0000CE50 D08100C4 */ stfs f4, 0xc4(r1)
/* 0000CE54 D04100C8 */ stfs f2, 0xc8(r1)
/* 0000CE58 D00100CC */ stfs f0, 0xcc(r1)
/* 0000CE5C 80190000 */ lwz r0, 0(r25)
/* 0000CE60 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0000CE64 40820010 */ bne lbl_0000CE74
/* 0000CE68 80180000 */ lwz r0, 0(r24)
/* 0000CE6C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0000CE70 41820040 */ beq lbl_0000CEB0
lbl_0000CE74:
/* 0000CE74 C83C0548 */ lfd f1, 0x548(r28)
/* 0000CE78 C00100C4 */ lfs f0, 0xc4(r1)
/* 0000CE7C FC010032 */ fmul f0, f1, f0
/* 0000CE80 FC000018 */ frsp f0, f0
/* 0000CE84 D00100C4 */ stfs f0, 0xc4(r1)
/* 0000CE88 C83C0548 */ lfd f1, 0x548(r28)
/* 0000CE8C C00100C8 */ lfs f0, 0xc8(r1)
/* 0000CE90 FC010032 */ fmul f0, f1, f0
/* 0000CE94 FC000018 */ frsp f0, f0
/* 0000CE98 D00100C8 */ stfs f0, 0xc8(r1)
/* 0000CE9C C83C0548 */ lfd f1, 0x548(r28)
/* 0000CEA0 C00100CC */ lfs f0, 0xcc(r1)
/* 0000CEA4 FC010032 */ fmul f0, f1, f0
/* 0000CEA8 FC000018 */ frsp f0, f0
/* 0000CEAC D00100CC */ stfs f0, 0xcc(r1)
lbl_0000CEB0:
/* 0000CEB0 EC3EE82A */ fadds f1, f30, f29
/* 0000CEB4 C85C04A0 */ lfd f2, 0x4a0(r28)
/* 0000CEB8 C00100F4 */ lfs f0, 0xf4(r1)
/* 0000CEBC C10100E8 */ lfs f8, 0xe8(r1)
/* 0000CEC0 FF620824 */ fdiv f27, f2, f1
/* 0000CEC4 C04100C4 */ lfs f2, 0xc4(r1)
/* 0000CEC8 C0E100F8 */ lfs f7, 0xf8(r1)
/* 0000CECC C0C100EC */ lfs f6, 0xec(r1)
/* 0000CED0 C02100C8 */ lfs f1, 0xc8(r1)
/* 0000CED4 FF60D818 */ frsp f27, f27
/* 0000CED8 C0A100FC */ lfs f5, 0xfc(r1)
/* 0000CEDC EC7C00B2 */ fmuls f3, f28, f2
/* 0000CEE0 C08100F0 */ lfs f4, 0xf0(r1)
/* 0000CEE4 EC5C0072 */ fmuls f2, f28, f1
/* 0000CEE8 C02100CC */ lfs f1, 0xcc(r1)
/* 0000CEEC EC7B00F2 */ fmuls f3, f27, f3
/* 0000CEF0 ED3E0032 */ fmuls f9, f30, f0
/* 0000CEF4 ED1D0232 */ fmuls f8, f29, f8
/* 0000CEF8 EC3C0072 */ fmuls f1, f28, f1
/* 0000CEFC D06100AC */ stfs f3, 0xac(r1)
/* 0000CF00 EC5B00B2 */ fmuls f2, f27, f2
/* 0000CF04 ED09402A */ fadds f8, f9, f8
/* 0000CF08 ECFE01F2 */ fmuls f7, f30, f7
/* 0000CF0C EC7D01B2 */ fmuls f3, f29, f6
/* 0000CF10 D04100B0 */ stfs f2, 0xb0(r1)
/* 0000CF14 EC5B0232 */ fmuls f2, f27, f8
/* 0000CF18 EC3B0072 */ fmuls f1, f27, f1
/* 0000CF1C ECC7182A */ fadds f6, f7, f3
/* 0000CF20 EC7E0172 */ fmuls f3, f30, f5
/* 0000CF24 D04100B8 */ stfs f2, 0xb8(r1)
/* 0000CF28 EC5D0132 */ fmuls f2, f29, f4
/* 0000CF2C D02100B4 */ stfs f1, 0xb4(r1)
/* 0000CF30 EC9B01B2 */ fmuls f4, f27, f6
/* 0000CF34 C02100AC */ lfs f1, 0xac(r1)
/* 0000CF38 EC63102A */ fadds f3, f3, f2
/* 0000CF3C C04100B0 */ lfs f2, 0xb0(r1)
/* 0000CF40 C0A100B4 */ lfs f5, 0xb4(r1)
/* 0000CF44 EC7B00F2 */ fmuls f3, f27, f3
/* 0000CF48 D08100BC */ stfs f4, 0xbc(r1)
/* 0000CF4C EC810772 */ fmuls f4, f1, f29
/* 0000CF50 ECE20772 */ fmuls f7, f2, f29
/* 0000CF54 D06100C0 */ stfs f3, 0xc0(r1)
/* 0000CF58 EC2107B2 */ fmuls f1, f1, f30
/* 0000CF5C C14100B8 */ lfs f10, 0xb8(r1)
/* 0000CF60 EC650772 */ fmuls f3, f5, f29
/* 0000CF64 C10100BC */ lfs f8, 0xbc(r1)
/* 0000CF68 EC4207B2 */ fmuls f2, f2, f30
/* 0000CF6C ED2A2028 */ fsubs f9, f10, f4
/* 0000CF70 C0C100C0 */ lfs f6, 0xc0(r1)
/* 0000CF74 EC8A082A */ fadds f4, f10, f1
/* 0000CF78 EC2507B2 */ fmuls f1, f5, f30
/* 0000CF7C ECE83828 */ fsubs f7, f8, f7
/* 0000CF80 D12100DC */ stfs f9, 0xdc(r1)
/* 0000CF84 ECA61828 */ fsubs f5, f6, f3
/* 0000CF88 EC68102A */ fadds f3, f8, f2
/* 0000CF8C D0E100E0 */ stfs f7, 0xe0(r1)
/* 0000CF90 EC46082A */ fadds f2, f6, f1
/* 0000CF94 D08100D0 */ stfs f4, 0xd0(r1)
/* 0000CF98 D0A100E4 */ stfs f5, 0xe4(r1)
/* 0000CF9C D06100D4 */ stfs f3, 0xd4(r1)
/* 0000CFA0 C02100DC */ lfs f1, 0xdc(r1)
/* 0000CFA4 D04100D8 */ stfs f2, 0xd8(r1)
/* 0000CFA8 EC010028 */ fsubs f0, f1, f0
/* 0000CFAC C0390130 */ lfs f1, 0x130(r25)
/* 0000CFB0 EC01002A */ fadds f0, f1, f0
/* 0000CFB4 D0190130 */ stfs f0, 0x130(r25)
/* 0000CFB8 C02100E0 */ lfs f1, 0xe0(r1)
/* 0000CFBC C00100F8 */ lfs f0, 0xf8(r1)
/* 0000CFC0 C0590134 */ lfs f2, 0x134(r25)
/* 0000CFC4 EC010028 */ fsubs f0, f1, f0
/* 0000CFC8 EC02002A */ fadds f0, f2, f0
/* 0000CFCC D0190134 */ stfs f0, 0x134(r25)
/* 0000CFD0 C02100E4 */ lfs f1, 0xe4(r1)
/* 0000CFD4 C00100FC */ lfs f0, 0xfc(r1)
/* 0000CFD8 C0590138 */ lfs f2, 0x138(r25)
/* 0000CFDC EC010028 */ fsubs f0, f1, f0
/* 0000CFE0 EC02002A */ fadds f0, f2, f0
/* 0000CFE4 D0190138 */ stfs f0, 0x138(r25)
/* 0000CFE8 C02100D0 */ lfs f1, 0xd0(r1)
/* 0000CFEC C00100E8 */ lfs f0, 0xe8(r1)
/* 0000CFF0 C0580130 */ lfs f2, 0x130(r24)
/* 0000CFF4 EC010028 */ fsubs f0, f1, f0
/* 0000CFF8 EC02002A */ fadds f0, f2, f0
/* 0000CFFC D0180130 */ stfs f0, 0x130(r24)
/* 0000D000 C02100D4 */ lfs f1, 0xd4(r1)
/* 0000D004 C00100EC */ lfs f0, 0xec(r1)
/* 0000D008 C0580134 */ lfs f2, 0x134(r24)
/* 0000D00C EC010028 */ fsubs f0, f1, f0
/* 0000D010 EC02002A */ fadds f0, f2, f0
/* 0000D014 D0180134 */ stfs f0, 0x134(r24)
/* 0000D018 C02100D8 */ lfs f1, 0xd8(r1)
/* 0000D01C C00100F0 */ lfs f0, 0xf0(r1)
/* 0000D020 C0580138 */ lfs f2, 0x138(r24)
/* 0000D024 EC010028 */ fsubs f0, f1, f0
/* 0000D028 EC02002A */ fadds f0, f2, f0
/* 0000D02C D0180138 */ stfs f0, 0x138(r24)
/* 0000D030 C81C0550 */ lfd f0, 0x550(r28)
/* 0000D034 1C14000C */ mulli r0, r20, 0xc
/* 0000D038 C06100C4 */ lfs f3, 0xc4(r1)
/* 0000D03C FC000772 */ fmul f0, f0, f29
/* 0000D040 C04100C8 */ lfs f2, 0xc8(r1)
/* 0000D044 C02100CC */ lfs f1, 0xcc(r1)
/* 0000D048 7CD80214 */ add r6, r24, r0
/* 0000D04C 38610030 */ addi r3, r1, 0x30
/* 0000D050 FC030032 */ fmul f0, f3, f0
/* 0000D054 3881007C */ addi r4, r1, 0x7c
/* 0000D058 38A10024 */ addi r5, r1, 0x24
/* 0000D05C FC000018 */ frsp f0, f0
/* 0000D060 D001007C */ stfs f0, 0x7c(r1)
/* 0000D064 C81C0550 */ lfd f0, 0x550(r28)
/* 0000D068 FC000772 */ fmul f0, f0, f29
/* 0000D06C FC020032 */ fmul f0, f2, f0
/* 0000D070 FC000018 */ frsp f0, f0
/* 0000D074 D0010080 */ stfs f0, 0x80(r1)
/* 0000D078 C81C0550 */ lfd f0, 0x550(r28)
/* 0000D07C FC000772 */ fmul f0, f0, f29
/* 0000D080 FC010032 */ fmul f0, f1, f0
/* 0000D084 FC000018 */ frsp f0, f0
/* 0000D088 D0010084 */ stfs f0, 0x84(r1)
/* 0000D08C C0260004 */ lfs f1, 4(r6)
/* 0000D090 C0180124 */ lfs f0, 0x124(r24)
/* 0000D094 EC010028 */ fsubs f0, f1, f0
/* 0000D098 D0010030 */ stfs f0, 0x30(r1)
/* 0000D09C C0260008 */ lfs f1, 8(r6)
/* 0000D0A0 C0180128 */ lfs f0, 0x128(r24)
/* 0000D0A4 EC010028 */ fsubs f0, f1, f0
/* 0000D0A8 D0010034 */ stfs f0, 0x34(r1)
/* 0000D0AC C026000C */ lfs f1, 0xc(r6)
/* 0000D0B0 C018012C */ lfs f0, 0x12c(r24)
/* 0000D0B4 EC010028 */ fsubs f0, f1, f0
/* 0000D0B8 D0010038 */ stfs f0, 0x38(r1)
/* 0000D0BC 48000811 */ bl lbl_0000D8CC
/* 0000D0C0 1C140014 */ mulli r0, r20, 0x14
/* 0000D0C4 807C03A8 */ lwz r3, 0x3a8(r28)
/* 0000D0C8 C85C04D0 */ lfd f2, 0x4d0(r28)
/* 0000D0CC C87C04C8 */ lfd f3, 0x4c8(r28)
/* 0000D0D0 7C630214 */ add r3, r3, r0
/* 0000D0D4 C0230010 */ lfs f1, 0x10(r3)
/* 0000D0D8 1C15000C */ mulli r0, r21, 0xc
/* 0000D0DC C01C0388 */ lfs f0, 0x388(r28)
/* 0000D0E0 FC420824 */ fdiv f2, f2, f1
/* 0000D0E4 C0210024 */ lfs f1, 0x24(r1)
/* 0000D0E8 7CD90214 */ add r6, r25, r0
/* 0000D0EC 38610018 */ addi r3, r1, 0x18
/* 0000D0F0 3881007C */ addi r4, r1, 0x7c
/* 0000D0F4 FC43102A */ fadd f2, f3, f2
/* 0000D0F8 38A1000C */ addi r5, r1, 0xc
/* 0000D0FC FC401018 */ frsp f2, f2
/* 0000D100 EC0000B2 */ fmuls f0, f0, f2
/* 0000D104 EC010032 */ fmuls f0, f1, f0
/* 0000D108 D0010024 */ stfs f0, 0x24(r1)
/* 0000D10C C01C038C */ lfs f0, 0x38c(r28)
/* 0000D110 C0210028 */ lfs f1, 0x28(r1)
/* 0000D114 EC0000B2 */ fmuls f0, f0, f2
/* 0000D118 EC010032 */ fmuls f0, f1, f0
/* 0000D11C D0010028 */ stfs f0, 0x28(r1)
/* 0000D120 C01C0390 */ lfs f0, 0x390(r28)
/* 0000D124 C021002C */ lfs f1, 0x2c(r1)
/* 0000D128 EC0000B2 */ fmuls f0, f0, f2
/* 0000D12C EC010032 */ fmuls f0, f1, f0
/* 0000D130 D001002C */ stfs f0, 0x2c(r1)
/* 0000D134 80010024 */ lwz r0, 0x24(r1)
/* 0000D138 80E10028 */ lwz r7, 0x28(r1)
/* 0000D13C 90010070 */ stw r0, 0x70(r1)
/* 0000D140 8001002C */ lwz r0, 0x2c(r1)
/* 0000D144 90E10074 */ stw r7, 0x74(r1)
/* 0000D148 90010078 */ stw r0, 0x78(r1)
/* 0000D14C C0210070 */ lfs f1, 0x70(r1)
/* 0000D150 C018013C */ lfs f0, 0x13c(r24)
/* 0000D154 EC01002A */ fadds f0, f1, f0
/* 0000D158 D018013C */ stfs f0, 0x13c(r24)
/* 0000D15C C0210074 */ lfs f1, 0x74(r1)
/* 0000D160 C0180140 */ lfs f0, 0x140(r24)
/* 0000D164 EC01002A */ fadds f0, f1, f0
/* 0000D168 D0180140 */ stfs f0, 0x140(r24)
/* 0000D16C C0210078 */ lfs f1, 0x78(r1)
/* 0000D170 C0180144 */ lfs f0, 0x144(r24)
/* 0000D174 EC01002A */ fadds f0, f1, f0
/* 0000D178 D0180144 */ stfs f0, 0x144(r24)
/* 0000D17C C81C0558 */ lfd f0, 0x558(r28)
/* 0000D180 C06100C4 */ lfs f3, 0xc4(r1)
/* 0000D184 FC0007B2 */ fmul f0, f0, f30
/* 0000D188 C04100C8 */ lfs f2, 0xc8(r1)
/* 0000D18C C02100CC */ lfs f1, 0xcc(r1)
/* 0000D190 FC030032 */ fmul f0, f3, f0
/* 0000D194 FC000018 */ frsp f0, f0
/* 0000D198 D001007C */ stfs f0, 0x7c(r1)
/* 0000D19C C81C0558 */ lfd f0, 0x558(r28)
/* 0000D1A0 FC0007B2 */ fmul f0, f0, f30
/* 0000D1A4 FC020032 */ fmul f0, f2, f0
/* 0000D1A8 FC000018 */ frsp f0, f0
/* 0000D1AC D0010080 */ stfs f0, 0x80(r1)
/* 0000D1B0 C81C0558 */ lfd f0, 0x558(r28)
/* 0000D1B4 FC0007B2 */ fmul f0, f0, f30
/* 0000D1B8 FC010032 */ fmul f0, f1, f0
/* 0000D1BC FC000018 */ frsp f0, f0
/* 0000D1C0 D0010084 */ stfs f0, 0x84(r1)
/* 0000D1C4 C0260004 */ lfs f1, 4(r6)
/* 0000D1C8 C0190124 */ lfs f0, 0x124(r25)
/* 0000D1CC EC010028 */ fsubs f0, f1, f0
/* 0000D1D0 D0010018 */ stfs f0, 0x18(r1)
/* 0000D1D4 C0260008 */ lfs f1, 8(r6)
/* 0000D1D8 C0190128 */ lfs f0, 0x128(r25)
/* 0000D1DC EC010028 */ fsubs f0, f1, f0
/* 0000D1E0 D001001C */ stfs f0, 0x1c(r1)
/* 0000D1E4 C026000C */ lfs f1, 0xc(r6)
/* 0000D1E8 C019012C */ lfs f0, 0x12c(r25)
/* 0000D1EC EC010028 */ fsubs f0, f1, f0
/* 0000D1F0 D0010020 */ stfs f0, 0x20(r1)
/* 0000D1F4 480006D9 */ bl lbl_0000D8CC
/* 0000D1F8 1C150014 */ mulli r0, r21, 0x14
/* 0000D1FC 807C03A8 */ lwz r3, 0x3a8(r28)
/* 0000D200 C85C04D0 */ lfd f2, 0x4d0(r28)
/* 0000D204 C87C04C8 */ lfd f3, 0x4c8(r28)
/* 0000D208 7C630214 */ add r3, r3, r0
/* 0000D20C C0230010 */ lfs f1, 0x10(r3)
/* 0000D210 C01C0388 */ lfs f0, 0x388(r28)
/* 0000D214 FC420824 */ fdiv f2, f2, f1
/* 0000D218 C021000C */ lfs f1, 0xc(r1)
/* 0000D21C FC43102A */ fadd f2, f3, f2
/* 0000D220 FC401018 */ frsp f2, f2
/* 0000D224 EC0000B2 */ fmuls f0, f0, f2
/* 0000D228 EC010032 */ fmuls f0, f1, f0
/* 0000D22C D001000C */ stfs f0, 0xc(r1)
/* 0000D230 C01C038C */ lfs f0, 0x38c(r28)
/* 0000D234 C0210010 */ lfs f1, 0x10(r1)
/* 0000D238 EC0000B2 */ fmuls f0, f0, f2
/* 0000D23C EC010032 */ fmuls f0, f1, f0
/* 0000D240 D0010010 */ stfs f0, 0x10(r1)
/* 0000D244 C01C0390 */ lfs f0, 0x390(r28)
/* 0000D248 C0210014 */ lfs f1, 0x14(r1)
/* 0000D24C EC0000B2 */ fmuls f0, f0, f2
/* 0000D250 EC010032 */ fmuls f0, f1, f0
/* 0000D254 D0010014 */ stfs f0, 0x14(r1)
/* 0000D258 8001000C */ lwz r0, 0xc(r1)
/* 0000D25C 80610010 */ lwz r3, 0x10(r1)
/* 0000D260 90010070 */ stw r0, 0x70(r1)
/* 0000D264 80010014 */ lwz r0, 0x14(r1)
/* 0000D268 90610074 */ stw r3, 0x74(r1)
/* 0000D26C 90010078 */ stw r0, 0x78(r1)
/* 0000D270 C0210070 */ lfs f1, 0x70(r1)
/* 0000D274 C019013C */ lfs f0, 0x13c(r25)
/* 0000D278 EC01002A */ fadds f0, f1, f0
/* 0000D27C D019013C */ stfs f0, 0x13c(r25)
/* 0000D280 C0210074 */ lfs f1, 0x74(r1)
/* 0000D284 C0190140 */ lfs f0, 0x140(r25)
/* 0000D288 EC01002A */ fadds f0, f1, f0
/* 0000D28C D0190140 */ stfs f0, 0x140(r25)
/* 0000D290 C0210078 */ lfs f1, 0x78(r1)
/* 0000D294 C0190144 */ lfs f0, 0x144(r25)
/* 0000D298 EC01002A */ fadds f0, f1, f0
/* 0000D29C D0190144 */ stfs f0, 0x144(r25)
/* 0000D2A0 C0390124 */ lfs f1, 0x124(r25)
/* 0000D2A4 C0180124 */ lfs f0, 0x124(r24)
/* 0000D2A8 EC010028 */ fsubs f0, f1, f0
/* 0000D2AC D0010064 */ stfs f0, 0x64(r1)
/* 0000D2B0 C01C03E8 */ lfs f0, 0x3e8(r28)
/* 0000D2B4 D0010068 */ stfs f0, 0x68(r1)
/* 0000D2B8 C039012C */ lfs f1, 0x12c(r25)
/* 0000D2BC C018012C */ lfs f0, 0x12c(r24)
/* 0000D2C0 EC010028 */ fsubs f0, f1, f0
/* 0000D2C4 D001006C */ stfs f0, 0x6c(r1)
/* 0000D2C8 C0410064 */ lfs f2, 0x64(r1)
/* 0000D2CC C0210068 */ lfs f1, 0x68(r1)
/* 0000D2D0 C001006C */ lfs f0, 0x6c(r1)
/* 0000D2D4 EC4200B2 */ fmuls f2, f2, f2
/* 0000D2D8 EC41107A */ fmadds f2, f1, f1, f2
/* 0000D2DC EC40103A */ fmadds f2, f0, f0, f2
/* 0000D2E0 C01C0458 */ lfs f0, 0x458(r28)
/* 0000D2E4 FC201090 */ fmr f1, f2
/* 0000D2E8 FC010040 */ fcmpo cr0, f1, f0
/* 0000D2EC 4C401382 */ cror 2, 0, 2
/* 0000D2F0 40820018 */ bne lbl_0000D308
/* 0000D2F4 C01C03E8 */ lfs f0, 0x3e8(r28)
/* 0000D2F8 D0010064 */ stfs f0, 0x64(r1)
/* 0000D2FC C01C050C */ lfs f0, 0x50c(r28)
/* 0000D300 D001006C */ stfs f0, 0x6c(r1)
/* 0000D304 48000020 */ b lbl_0000D324
lbl_0000D308:
/* 0000D308 4BFF2E59 */ bl mathutil_rsqrt
/* 0000D30C C0010064 */ lfs f0, 0x64(r1)
/* 0000D310 EC000072 */ fmuls f0, f0, f1
/* 0000D314 D0010064 */ stfs f0, 0x64(r1)
/* 0000D318 C001006C */ lfs f0, 0x6c(r1)
/* 0000D31C EC000072 */ fmuls f0, f0, f1
/* 0000D320 D001006C */ stfs f0, 0x6c(r1)
lbl_0000D324:
/* 0000D324 EC5D06F2 */ fmuls f2, f29, f27
/* 0000D328 C8BC04B0 */ lfd f5, 0x4b0(r28)
/* 0000D32C EC7E06F2 */ fmuls f3, f30, f27
/* 0000D330 C0010064 */ lfs f0, 0x64(r1)
/* 0000D334 C0210068 */ lfs f1, 0x68(r1)
/* 0000D338 EC5F00B2 */ fmuls f2, f31, f2
/* 0000D33C C081006C */ lfs f4, 0x6c(r1)
/* 0000D340 EC7F00F2 */ fmuls f3, f31, f3
/* 0000D344 38790000 */ addi r3, r25, 0
/* 0000D348 38810058 */ addi r4, r1, 0x58
/* 0000D34C FC4500B2 */ fmul f2, f5, f2
/* 0000D350 FCC500F2 */ fmul f6, f5, f3
/* 0000D354 FC401018 */ frsp f2, f2
/* 0000D358 FCC03018 */ frsp f6, f6
/* 0000D35C FC401050 */ fneg f2, f2
/* 0000D360 EC6001B2 */ fmuls f3, f0, f6
/* 0000D364 EC0000B2 */ fmuls f0, f0, f2
/* 0000D368 ECA101B2 */ fmuls f5, f1, f6
/* 0000D36C D0610058 */ stfs f3, 0x58(r1)
/* 0000D370 EC2100B2 */ fmuls f1, f1, f2
/* 0000D374 EC6401B2 */ fmuls f3, f4, f6
/* 0000D378 D001004C */ stfs f0, 0x4c(r1)
/* 0000D37C EC0400B2 */ fmuls f0, f4, f2
/* 0000D380 D0A1005C */ stfs f5, 0x5c(r1)
/* 0000D384 D0210050 */ stfs f1, 0x50(r1)
/* 0000D388 D0610060 */ stfs f3, 0x60(r1)
/* 0000D38C D0010054 */ stfs f0, 0x54(r1)
/* 0000D390 48000145 */ bl lbl_0000D4D4
/* 0000D394 38780000 */ addi r3, r24, 0
/* 0000D398 3881004C */ addi r4, r1, 0x4c
/* 0000D39C 48000139 */ bl lbl_0000D4D4
/* 0000D3A0 C02100C4 */ lfs f1, 0xc4(r1)
/* 0000D3A4 C04100C8 */ lfs f2, 0xc8(r1)
/* 0000D3A8 C00100CC */ lfs f0, 0xcc(r1)
/* 0000D3AC EC210072 */ fmuls f1, f1, f1
/* 0000D3B0 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D3B4 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D3B8 4BFF2DA9 */ bl mathutil_sqrt
/* 0000D3BC C81C0560 */ lfd f0, 0x560(r28)
/* 0000D3C0 FC010040 */ fcmpo cr0, f1, f0
/* 0000D3C4 408100D8 */ ble lbl_0000D49C
/* 0000D3C8 807C0528 */ lwz r3, 0x528(r28)
/* 0000D3CC 801C052C */ lwz r0, 0x52c(r28)
/* 0000D3D0 90610040 */ stw r3, 0x40(r1)
/* 0000D3D4 90010044 */ stw r0, 0x44(r1)
/* 0000D3D8 801C0530 */ lwz r0, 0x530(r28)
/* 0000D3DC 90010048 */ stw r0, 0x48(r1)
/* 0000D3E0 C85C0568 */ lfd f2, 0x568(r28)
/* 0000D3E4 C81C03C0 */ lfd f0, 0x3c0(r28)
/* 0000D3E8 FC220072 */ fmul f1, f2, f1
/* 0000D3EC FC010040 */ fcmpo cr0, f1, f0
/* 0000D3F0 40800008 */ bge lbl_0000D3F8
/* 0000D3F4 48000008 */ b lbl_0000D3FC
lbl_0000D3F8:
/* 0000D3F8 FC200090 */ fmr f1, f0
lbl_0000D3FC:
/* 0000D3FC FC600818 */ frsp f3, f1
/* 0000D400 C05C0478 */ lfs f2, 0x478(r28)
/* 0000D404 C01C0480 */ lfs f0, 0x480(r28)
/* 0000D408 C03C047C */ lfs f1, 0x47c(r28)
/* 0000D40C EC4200F2 */ fmuls f2, f2, f3
/* 0000D410 EC0000F2 */ fmuls f0, f0, f3
/* 0000D414 EC220828 */ fsubs f1, f2, f1
/* 0000D418 FC00001E */ fctiwz f0, f0
/* 0000D41C FC20081E */ fctiwz f1, f1
/* 0000D420 D8010110 */ stfd f0, 0x110(r1)
/* 0000D424 80010114 */ lwz r0, 0x114(r1)
/* 0000D428 D8210118 */ stfd f1, 0x118(r1)
/* 0000D42C 7C000774 */ extsb r0, r0
/* 0000D430 8061011C */ lwz r3, 0x11c(r1)
/* 0000D434 5400103A */ slwi r0, r0, 2
/* 0000D438 7C1D002E */ lwzx r0, r29, r0
/* 0000D43C 54635BA8 */ rlwinm r3, r3, 0xb, 0xe, 0x14
/* 0000D440 7C630378 */ or r3, r3, r0
/* 0000D444 4BFF2D1D */ bl func_8002B610
/* 0000D448 3A030000 */ addi r16, r3, 0
/* 0000D44C 2C10FFFF */ cmpwi r16, -1
/* 0000D450 4182004C */ beq lbl_0000D49C
/* 0000D454 4BFF2D0D */ bl rand
/* 0000D458 5464053E */ clrlwi r4, r3, 0x14
/* 0000D45C 5603043E */ clrlwi r3, r16, 0x10
/* 0000D460 38841800 */ addi r4, r4, 0x1800
/* 0000D464 4BFF2CFD */ bl func_8002C3E0
/* 0000D468 801F002C */ lwz r0, 0x2c(r31)
/* 0000D46C 38790124 */ addi r3, r25, 0x124
/* 0000D470 389C03B0 */ addi r4, r28, 0x3b0
/* 0000D474 1C000284 */ mulli r0, r0, 0x284
/* 0000D478 7CBE0214 */ add r5, r30, r0
/* 0000D47C A8A5001A */ lha r5, 0x1a(r5)
/* 0000D480 38C1003D */ addi r6, r1, 0x3d
/* 0000D484 38E1003C */ addi r7, r1, 0x3c
/* 0000D488 48000371 */ bl lbl_0000D7F8
/* 0000D48C 8881003D */ lbz r4, 0x3d(r1)
/* 0000D490 5603043E */ clrlwi r3, r16, 0x10
/* 0000D494 88A1003C */ lbz r5, 0x3c(r1)
/* 0000D498 4BFF2CC9 */ bl SoundPan
lbl_0000D49C:
/* 0000D49C 3B5A0001 */ addi r26, r26, 1
/* 0000D4A0 3B180184 */ addi r24, r24, 0x184
lbl_0000D4A4:
/* 0000D4A4 2C1A000A */ cmpwi r26, 0xa
/* 0000D4A8 4180F664 */ blt lbl_0000CB0C
/* 0000D4AC BA010120 */ lmw r16, 0x120(r1)
/* 0000D4B0 8001018C */ lwz r0, 0x18c(r1)
/* 0000D4B4 CBE10180 */ lfd f31, 0x180(r1)
/* 0000D4B8 CBC10178 */ lfd f30, 0x178(r1)
/* 0000D4BC 7C0803A6 */ mtlr r0
/* 0000D4C0 CBA10170 */ lfd f29, 0x170(r1)
/* 0000D4C4 CB810168 */ lfd f28, 0x168(r1)
/* 0000D4C8 CB610160 */ lfd f27, 0x160(r1)
/* 0000D4CC 38210188 */ addi r1, r1, 0x188
/* 0000D4D0 4E800020 */ blr 
lbl_0000D4D4:
/* 0000D4D4 C0240000 */ lfs f1, 0(r4)
/* 0000D4D8 3CA00000 */ lis r5, lbl_00014B78@ha
/* 0000D4DC C0030124 */ lfs f0, 0x124(r3)
/* 0000D4E0 38E30004 */ addi r7, r3, 4
/* 0000D4E4 39030094 */ addi r8, r3, 0x94
/* 0000D4E8 EC01002A */ fadds f0, f1, f0
/* 0000D4EC 38A50000 */ addi r5, r5, lbl_00014B78@l
/* 0000D4F0 38C00000 */ li r6, 0
/* 0000D4F4 D0030124 */ stfs f0, 0x124(r3)
/* 0000D4F8 C0240004 */ lfs f1, 4(r4)
/* 0000D4FC C0030128 */ lfs f0, 0x128(r3)
/* 0000D500 EC01002A */ fadds f0, f1, f0
/* 0000D504 D0030128 */ stfs f0, 0x128(r3)
/* 0000D508 C0240008 */ lfs f1, 8(r4)
/* 0000D50C C003012C */ lfs f0, 0x12c(r3)
/* 0000D510 EC01002A */ fadds f0, f1, f0
/* 0000D514 D003012C */ stfs f0, 0x12c(r3)
/* 0000D518 48000070 */ b lbl_0000D588
lbl_0000D51C:
/* 0000D51C C0240000 */ lfs f1, 0(r4)
/* 0000D520 38C60001 */ addi r6, r6, 1
/* 0000D524 C0070000 */ lfs f0, 0(r7)
/* 0000D528 EC01002A */ fadds f0, f1, f0
/* 0000D52C D0070000 */ stfs f0, 0(r7)
/* 0000D530 C0240004 */ lfs f1, 4(r4)
/* 0000D534 C0070004 */ lfs f0, 4(r7)
/* 0000D538 EC01002A */ fadds f0, f1, f0
/* 0000D53C D0070004 */ stfs f0, 4(r7)
/* 0000D540 C0240008 */ lfs f1, 8(r4)
/* 0000D544 C0070008 */ lfs f0, 8(r7)
/* 0000D548 EC01002A */ fadds f0, f1, f0
/* 0000D54C D0070008 */ stfs f0, 8(r7)
/* 0000D550 38E7000C */ addi r7, r7, 0xc
/* 0000D554 C0240000 */ lfs f1, 0(r4)
/* 0000D558 C0080000 */ lfs f0, 0(r8)
/* 0000D55C EC01002A */ fadds f0, f1, f0
/* 0000D560 D0080000 */ stfs f0, 0(r8)
/* 0000D564 C0240004 */ lfs f1, 4(r4)
/* 0000D568 C0080004 */ lfs f0, 4(r8)
/* 0000D56C EC01002A */ fadds f0, f1, f0
/* 0000D570 D0080004 */ stfs f0, 4(r8)
/* 0000D574 C0240008 */ lfs f1, 8(r4)
/* 0000D578 C0080008 */ lfs f0, 8(r8)
/* 0000D57C EC01002A */ fadds f0, f1, f0
/* 0000D580 D0080008 */ stfs f0, 8(r8)
/* 0000D584 3908000C */ addi r8, r8, 0xc
lbl_0000D588:
/* 0000D588 88050034 */ lbz r0, 0x34(r5)
/* 0000D58C 7C060000 */ cmpw r6, r0
/* 0000D590 4180FF8C */ blt lbl_0000D51C
/* 0000D594 4E800020 */ blr 
lbl_0000D598:
/* 0000D598 7C0802A6 */ mflr r0
/* 0000D59C 7CA92B78 */ mr r9, r5
/* 0000D5A0 90010004 */ stw r0, 4(r1)
/* 0000D5A4 38060000 */ addi r0, r6, 0
/* 0000D5A8 39070000 */ addi r8, r7, 0
/* 0000D5AC 9421FFB8 */ stwu r1, -0x48(r1)
/* 0000D5B0 38A40000 */ addi r5, r4, 0
/* 0000D5B4 38C90000 */ addi r6, r9, 0
/* 0000D5B8 DBE10040 */ stfd f31, 0x40(r1)
/* 0000D5BC FFE01090 */ fmr f31, f2
/* 0000D5C0 7C070378 */ mr r7, r0
/* 0000D5C4 DBC10038 */ stfd f30, 0x38(r1)
/* 0000D5C8 FFC00890 */ fmr f30, f1
/* 0000D5CC 38810024 */ addi r4, r1, 0x24
/* 0000D5D0 93E10034 */ stw r31, 0x34(r1)
/* 0000D5D4 3BE30000 */ addi r31, r3, 0
/* 0000D5D8 38610028 */ addi r3, r1, 0x28
/* 0000D5DC 48000075 */ bl lbl_0000D650
/* 0000D5E0 EFFEF82A */ fadds f31, f30, f31
/* 0000D5E4 C0010028 */ lfs f0, 0x28(r1)
/* 0000D5E8 EC5F07F2 */ fmuls f2, f31, f31
/* 0000D5EC FC001040 */ fcmpo cr0, f0, f2
/* 0000D5F0 40800034 */ bge lbl_0000D624
/* 0000D5F4 C0210024 */ lfs f1, 0x24(r1)
/* 0000D5F8 FC011040 */ fcmpo cr0, f1, f2
/* 0000D5FC 40800014 */ bge lbl_0000D610
/* 0000D600 4BFF2B61 */ bl mathutil_sqrt
/* 0000D604 EC1F0828 */ fsubs f0, f31, f1
/* 0000D608 D01F0000 */ stfs f0, 0(r31)
/* 0000D60C 48000010 */ b lbl_0000D61C
lbl_0000D610:
/* 0000D610 3C600000 */ lis r3, lbl_00014BE8@ha
/* 0000D614 C0030000 */ lfs f0, lbl_00014BE8@l(r3)
/* 0000D618 D01F0000 */ stfs f0, 0(r31)
lbl_0000D61C:
/* 0000D61C 38600001 */ li r3, 1
/* 0000D620 48000014 */ b lbl_0000D634
lbl_0000D624:
/* 0000D624 3C600000 */ lis r3, lbl_00014BE8@ha
/* 0000D628 C0030000 */ lfs f0, lbl_00014BE8@l(r3)
/* 0000D62C 38600000 */ li r3, 0
/* 0000D630 D01F0000 */ stfs f0, 0(r31)
lbl_0000D634:
/* 0000D634 8001004C */ lwz r0, 0x4c(r1)
/* 0000D638 CBE10040 */ lfd f31, 0x40(r1)
/* 0000D63C CBC10038 */ lfd f30, 0x38(r1)
/* 0000D640 7C0803A6 */ mtlr r0
/* 0000D644 83E10034 */ lwz r31, 0x34(r1)
/* 0000D648 38210048 */ addi r1, r1, 0x48
/* 0000D64C 4E800020 */ blr 
lbl_0000D650:
/* 0000D650 9421FFB0 */ stwu r1, -0x50(r1)
/* 0000D654 C0270000 */ lfs f1, 0(r7)
/* 0000D658 C0050000 */ lfs f0, 0(r5)
/* 0000D65C EC010028 */ fsubs f0, f1, f0
/* 0000D660 D0010038 */ stfs f0, 0x38(r1)
/* 0000D664 C0270004 */ lfs f1, 4(r7)
/* 0000D668 C0050004 */ lfs f0, 4(r5)
/* 0000D66C EC010028 */ fsubs f0, f1, f0
/* 0000D670 D001003C */ stfs f0, 0x3c(r1)
/* 0000D674 C0270008 */ lfs f1, 8(r7)
/* 0000D678 C0050008 */ lfs f0, 8(r5)
/* 0000D67C EC010028 */ fsubs f0, f1, f0
/* 0000D680 D0010040 */ stfs f0, 0x40(r1)
/* 0000D684 C0280000 */ lfs f1, 0(r8)
/* 0000D688 C0060000 */ lfs f0, 0(r6)
/* 0000D68C C1210038 */ lfs f9, 0x38(r1)
/* 0000D690 EC010028 */ fsubs f0, f1, f0
/* 0000D694 C101003C */ lfs f8, 0x3c(r1)
/* 0000D698 C0E10040 */ lfs f7, 0x40(r1)
/* 0000D69C D001002C */ stfs f0, 0x2c(r1)
/* 0000D6A0 C0280004 */ lfs f1, 4(r8)
/* 0000D6A4 C0060004 */ lfs f0, 4(r6)
/* 0000D6A8 EC010028 */ fsubs f0, f1, f0
/* 0000D6AC D0010030 */ stfs f0, 0x30(r1)
/* 0000D6B0 C0280008 */ lfs f1, 8(r8)
/* 0000D6B4 C0060008 */ lfs f0, 8(r6)
/* 0000D6B8 EC010028 */ fsubs f0, f1, f0
/* 0000D6BC D0010034 */ stfs f0, 0x34(r1)
/* 0000D6C0 C001002C */ lfs f0, 0x2c(r1)
/* 0000D6C4 C0210030 */ lfs f1, 0x30(r1)
/* 0000D6C8 EC404828 */ fsubs f2, f0, f9
/* 0000D6CC C0010034 */ lfs f0, 0x34(r1)
/* 0000D6D0 EC214028 */ fsubs f1, f1, f8
/* 0000D6D4 EC003828 */ fsubs f0, f0, f7
/* 0000D6D8 D0410044 */ stfs f2, 0x44(r1)
/* 0000D6DC D0210048 */ stfs f1, 0x48(r1)
/* 0000D6E0 D001004C */ stfs f0, 0x4c(r1)
/* 0000D6E4 C0410044 */ lfs f2, 0x44(r1)
/* 0000D6E8 C0210048 */ lfs f1, 0x48(r1)
/* 0000D6EC C001004C */ lfs f0, 0x4c(r1)
/* 0000D6F0 ED4200B2 */ fmuls f10, f2, f2
/* 0000D6F4 ED41507A */ fmadds f10, f1, f1, f10
/* 0000D6F8 ED40503A */ fmadds f10, f0, f0, f10
/* 0000D6FC 3CA00000 */ lis r5, lbl_00014C00@ha
/* 0000D700 C8C50000 */ lfd f6, lbl_00014C00@l(r5)
/* 0000D704 FC0A3040 */ fcmpo cr0, f10, f6
/* 0000D708 408100C8 */ ble lbl_0000D7D0
/* 0000D70C C0A10044 */ lfs f5, 0x44(r1)
/* 0000D710 C0810048 */ lfs f4, 0x48(r1)
/* 0000D714 EC450272 */ fmuls f2, f5, f9
/* 0000D718 C061004C */ lfs f3, 0x4c(r1)
/* 0000D71C EC240232 */ fmuls f1, f4, f8
/* 0000D720 EC0301F2 */ fmuls f0, f3, f7
/* 0000D724 FC401050 */ fneg f2, f2
/* 0000D728 EC220828 */ fsubs f1, f2, f1
/* 0000D72C EC010028 */ fsubs f0, f1, f0
/* 0000D730 FC060040 */ fcmpo cr0, f6, f0
/* 0000D734 4C401382 */ cror 2, 0, 2
/* 0000D738 40820074 */ bne lbl_0000D7AC
/* 0000D73C FC005040 */ fcmpo cr0, f0, f10
/* 0000D740 4C401382 */ cror 2, 0, 2
/* 0000D744 40820068 */ bne lbl_0000D7AC
/* 0000D748 EC005024 */ fdivs f0, f0, f10
/* 0000D74C EC450032 */ fmuls f2, f5, f0
/* 0000D750 EC240032 */ fmuls f1, f4, f0
/* 0000D754 EC030032 */ fmuls f0, f3, f0
/* 0000D758 EC49102A */ fadds f2, f9, f2
/* 0000D75C EC28082A */ fadds f1, f8, f1
/* 0000D760 EC07002A */ fadds f0, f7, f0
/* 0000D764 D0410020 */ stfs f2, 0x20(r1)
/* 0000D768 D0210024 */ stfs f1, 0x24(r1)
/* 0000D76C D0010028 */ stfs f0, 0x28(r1)
/* 0000D770 C0410020 */ lfs f2, 0x20(r1)
/* 0000D774 C0210024 */ lfs f1, 0x24(r1)
/* 0000D778 C0010028 */ lfs f0, 0x28(r1)
/* 0000D77C EC4200B2 */ fmuls f2, f2, f2
/* 0000D780 EC41107A */ fmadds f2, f1, f1, f2
/* 0000D784 EC40103A */ fmadds f2, f0, f0, f2
/* 0000D788 D0430000 */ stfs f2, 0(r3)
/* 0000D78C C041002C */ lfs f2, 0x2c(r1)
/* 0000D790 C0210030 */ lfs f1, 0x30(r1)
/* 0000D794 C0010034 */ lfs f0, 0x34(r1)
/* 0000D798 EC4200B2 */ fmuls f2, f2, f2
/* 0000D79C EC41107A */ fmadds f2, f1, f1, f2
/* 0000D7A0 EC40103A */ fmadds f2, f0, f0, f2
/* 0000D7A4 D0440000 */ stfs f2, 0(r4)
/* 0000D7A8 48000048 */ b lbl_0000D7F0
lbl_0000D7AC:
/* 0000D7AC C041002C */ lfs f2, 0x2c(r1)
/* 0000D7B0 C0210030 */ lfs f1, 0x30(r1)
/* 0000D7B4 C0010034 */ lfs f0, 0x34(r1)
/* 0000D7B8 EC4200B2 */ fmuls f2, f2, f2
/* 0000D7BC EC41107A */ fmadds f2, f1, f1, f2
/* 0000D7C0 EC40103A */ fmadds f2, f0, f0, f2
/* 0000D7C4 D0430000 */ stfs f2, 0(r3)
/* 0000D7C8 D0440000 */ stfs f2, 0(r4)
/* 0000D7CC 48000024 */ b lbl_0000D7F0
lbl_0000D7D0:
/* 0000D7D0 C041002C */ lfs f2, 0x2c(r1)
/* 0000D7D4 C0210030 */ lfs f1, 0x30(r1)
/* 0000D7D8 C0010034 */ lfs f0, 0x34(r1)
/* 0000D7DC EC4200B2 */ fmuls f2, f2, f2
/* 0000D7E0 EC41107A */ fmadds f2, f1, f1, f2
/* 0000D7E4 EC40103A */ fmadds f2, f0, f0, f2
/* 0000D7E8 D0430000 */ stfs f2, 0(r3)
/* 0000D7EC D0440000 */ stfs f2, 0(r4)
lbl_0000D7F0:
/* 0000D7F0 38210050 */ addi r1, r1, 0x50
/* 0000D7F4 4E800020 */ blr 
lbl_0000D7F8:
/* 0000D7F8 7C0802A6 */ mflr r0
/* 0000D7FC 90010004 */ stw r0, 4(r1)
/* 0000D800 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000D804 BF61002C */ stmw r27, 0x2c(r1)
/* 0000D808 3B630000 */ addi r27, r3, 0
/* 0000D80C 3B840000 */ addi r28, r4, 0
/* 0000D810 3BE50000 */ addi r31, r5, 0
/* 0000D814 3BA60000 */ addi r29, r6, 0
/* 0000D818 3BC70000 */ addi r30, r7, 0
/* 0000D81C 4BFF2945 */ bl mathutil_mtxA_push
/* 0000D820 7FE3FB78 */ mr r3, r31
/* 0000D824 4BFF293D */ bl mathutil_mtxA_from_rotate_y
/* 0000D828 C05C0000 */ lfs f2, 0(r28)
/* 0000D82C C03C0004 */ lfs f1, 4(r28)
/* 0000D830 C01C0008 */ lfs f0, 8(r28)
/* 0000D834 3C60E000 */ lis r3, 0xe000
/* 0000D838 D043000C */ stfs f2, 0xc(r3)
/* 0000D83C D023001C */ stfs f1, 0x1c(r3)
/* 0000D840 D003002C */ stfs f0, 0x2c(r3)
/* 0000D844 387B0000 */ addi r3, r27, 0
/* 0000D848 3881001C */ addi r4, r1, 0x1c
/* 0000D84C 4BFF2915 */ bl mathutil_mtxA_tf_point
/* 0000D850 C021001C */ lfs f1, 0x1c(r1)
/* 0000D854 C0410024 */ lfs f2, 0x24(r1)
/* 0000D858 4BFF2909 */ bl mathutil_atan2
/* 0000D85C 7C7F1B78 */ mr r31, r3
/* 0000D860 4BFF2901 */ bl mathutil_mtxA_pop
/* 0000D864 7FE50734 */ extsh r5, r31
/* 0000D868 38054000 */ addi r0, r5, 0x4000
/* 0000D86C 7C03FE70 */ srawi r3, r0, 0x1f
/* 0000D870 7C600278 */ xor r0, r3, r0
/* 0000D874 7C030050 */ subf r0, r3, r0
/* 0000D878 7C044670 */ srawi r4, r0, 8
/* 0000D87C 38058000 */ addi r0, r5, -32768  ;# fixed addi
/* 0000D880 7C03FE70 */ srawi r3, r0, 0x1f
/* 0000D884 5484063E */ clrlwi r4, r4, 0x18
/* 0000D888 7C600278 */ xor r0, r3, r0
/* 0000D88C 7C030050 */ subf r0, r3, r0
/* 0000D890 7C004670 */ srawi r0, r0, 8
/* 0000D894 28040080 */ cmplwi r4, 0x80
/* 0000D898 5400063E */ clrlwi r0, r0, 0x18
/* 0000D89C 41800008 */ blt lbl_0000D8A4
/* 0000D8A0 208400FF */ subfic r4, r4, 0xff
lbl_0000D8A4:
/* 0000D8A4 28000080 */ cmplwi r0, 0x80
/* 0000D8A8 41800008 */ blt lbl_0000D8B0
/* 0000D8AC 200000FF */ subfic r0, r0, 0xff
lbl_0000D8B0:
/* 0000D8B0 989D0000 */ stb r4, 0(r29)
/* 0000D8B4 981E0000 */ stb r0, 0(r30)
/* 0000D8B8 BB61002C */ lmw r27, 0x2c(r1)
/* 0000D8BC 80010044 */ lwz r0, 0x44(r1)
/* 0000D8C0 38210040 */ addi r1, r1, 0x40
/* 0000D8C4 7C0803A6 */ mtlr r0
/* 0000D8C8 4E800020 */ blr 
lbl_0000D8CC:
/* 0000D8CC C0230004 */ lfs f1, 4(r3)
/* 0000D8D0 C0A40008 */ lfs f5, 8(r4)
/* 0000D8D4 C0430008 */ lfs f2, 8(r3)
/* 0000D8D8 C0640000 */ lfs f3, 0(r4)
/* 0000D8DC C0030000 */ lfs f0, 0(r3)
/* 0000D8E0 C0840004 */ lfs f4, 4(r4)
/* 0000D8E4 ECC10172 */ fmuls f6, f1, f5
/* 0000D8E8 ECE200F2 */ fmuls f7, f2, f3
/* 0000D8EC ED000132 */ fmuls f8, f0, f4
/* 0000D8F0 ECC2313C */ fnmsubs f6, f2, f4, f6
/* 0000D8F4 D0C50000 */ stfs f6, 0(r5)
/* 0000D8F8 ECE0397C */ fnmsubs f7, f0, f5, f7
/* 0000D8FC D0E50004 */ stfs f7, 4(r5)
/* 0000D900 ED0140FC */ fnmsubs f8, f1, f3, f8
/* 0000D904 D1050008 */ stfs f8, 8(r5)
/* 0000D908 4E800020 */ blr 
lbl_0000D90C:
/* 0000D90C 7C0802A6 */ mflr r0
/* 0000D910 3CA00000 */ lis r5, lbl_00014D70@ha
/* 0000D914 90010004 */ stw r0, 4(r1)
/* 0000D918 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000D91C 93E1001C */ stw r31, 0x1c(r1)
/* 0000D920 3BE50000 */ addi r31, r5, lbl_00014D70@l
/* 0000D924 93C10018 */ stw r30, 0x18(r1)
/* 0000D928 3BC40000 */ addi r30, r4, 0
/* 0000D92C 93A10014 */ stw r29, 0x14(r1)
/* 0000D930 3BA30000 */ addi r29, r3, 0
/* 0000D934 4BFF282D */ bl create_sprite
/* 0000D938 28030000 */ cmplwi r3, 0
/* 0000D93C 418200B4 */ beq lbl_0000D9F0
/* 0000D940 C01F0028 */ lfs f0, 0x28(r31)
/* 0000D944 3C800000 */ lis r4, lbl_0000DA0C@ha
/* 0000D948 396000FF */ li r11, 0xff
/* 0000D94C D0030004 */ stfs f0, 4(r3)
/* 0000D950 3940008C */ li r10, 0x8c
/* 0000D954 39200000 */ li r9, 0
/* 0000D958 C01F002C */ lfs f0, 0x2c(r31)
/* 0000D95C 3900006B */ li r8, 0x6b
/* 0000D960 38E00009 */ li r7, 9
/* 0000D964 D0030008 */ stfs f0, 8(r3)
/* 0000D968 38C00004 */ li r6, 4
/* 0000D96C 7FA50734 */ extsh r5, r29
/* 0000D970 C01F0030 */ lfs f0, 0x30(r31)
/* 0000D974 2C1E0000 */ cmpwi r30, 0
/* 0000D978 38040000 */ addi r0, r4, lbl_0000DA0C@l
/* 0000D97C D003004C */ stfs f0, 0x4c(r3)
/* 0000D980 9963000C */ stb r11, 0xc(r3)
/* 0000D984 9943000D */ stb r10, 0xd(r3)
/* 0000D988 9923000E */ stb r9, 0xe(r3)
/* 0000D98C 9903000F */ stb r8, 0xf(r3)
/* 0000D990 98E30001 */ stb r7, 1(r3)
/* 0000D994 98C30003 */ stb r6, 3(r3)
/* 0000D998 B0A30010 */ sth r5, 0x10(r3)
/* 0000D99C 93A30048 */ stw r29, 0x48(r3)
/* 0000D9A0 C01F0034 */ lfs f0, 0x34(r31)
/* 0000D9A4 D0030040 */ stfs f0, 0x40(r3)
/* 0000D9A8 C01F0034 */ lfs f0, 0x34(r31)
/* 0000D9AC D0030044 */ stfs f0, 0x44(r3)
/* 0000D9B0 80830074 */ lwz r4, 0x74(r3)
/* 0000D9B4 60841000 */ ori r4, r4, 0x1000
/* 0000D9B8 90830074 */ stw r4, 0x74(r3)
/* 0000D9BC 90030034 */ stw r0, 0x34(r3)
/* 0000D9C0 40810020 */ ble lbl_0000D9E0
/* 0000D9C4 3C800000 */ lis r4, lbl_00015428@ha
/* 0000D9C8 4CC63182 */ crclr 6
/* 0000D9CC 38840000 */ addi r4, r4, lbl_00015428@l
/* 0000D9D0 38BE0000 */ addi r5, r30, 0
/* 0000D9D4 3863008C */ addi r3, r3, 0x8c
/* 0000D9D8 4BFF2789 */ bl sprintf
/* 0000D9DC 48000014 */ b lbl_0000D9F0
lbl_0000D9E0:
/* 0000D9E0 3C800000 */ lis r4, lbl_00015434@ha
/* 0000D9E4 38840000 */ addi r4, r4, lbl_00015434@l
/* 0000D9E8 3863008C */ addi r3, r3, 0x8c
/* 0000D9EC 4BFF2775 */ bl strcpy
lbl_0000D9F0:
/* 0000D9F0 80010024 */ lwz r0, 0x24(r1)
/* 0000D9F4 83E1001C */ lwz r31, 0x1c(r1)
/* 0000D9F8 83C10018 */ lwz r30, 0x18(r1)
/* 0000D9FC 7C0803A6 */ mtlr r0
/* 0000DA00 83A10014 */ lwz r29, 0x14(r1)
/* 0000DA04 38210020 */ addi r1, r1, 0x20
/* 0000DA08 4E800020 */ blr 
lbl_0000DA0C:
/* 0000DA0C 7C0802A6 */ mflr r0
/* 0000DA10 3CC00000 */ lis r6, lbl_00014D90@ha
/* 0000DA14 90010004 */ stw r0, 4(r1)
/* 0000DA18 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000DA1C BF61002C */ stmw r27, 0x2c(r1)
/* 0000DA20 7C9C2378 */ mr r28, r4
/* 0000DA24 7C7B1B78 */ mr r27, r3
/* 0000DA28 83C40048 */ lwz r30, 0x48(r4)
/* 0000DA2C A8A40010 */ lha r5, 0x10(r4)
/* 0000DA30 3C800000 */ lis r4, lbl_00014D90@ha
/* 0000DA34 6FC08000 */ xoris r0, r30, 0x8000
/* 0000DA38 C8660000 */ lfd f3, lbl_00014D90@l(r6)
/* 0000DA3C 7FA5F050 */ subf r29, r5, r30
/* 0000DA40 9001001C */ stw r0, 0x1c(r1)
/* 0000DA44 57A07820 */ slwi r0, r29, 0xf
/* 0000DA48 6C058000 */ xoris r5, r0, 0x8000
/* 0000DA4C C8240000 */ lfd f1, lbl_00014D90@l(r4)
/* 0000DA50 90A10024 */ stw r5, 0x24(r1)
/* 0000DA54 3C004330 */ lis r0, 0x4330
/* 0000DA58 90010020 */ stw r0, 0x20(r1)
/* 0000DA5C 3CA00000 */ lis r5, lbl_00014D70@ha
/* 0000DA60 3BE50000 */ addi r31, r5, lbl_00014D70@l
/* 0000DA64 90010018 */ stw r0, 0x18(r1)
/* 0000DA68 C8410020 */ lfd f2, 0x20(r1)
/* 0000DA6C C8010018 */ lfd f0, 0x18(r1)
/* 0000DA70 EC421828 */ fsubs f2, f2, f3
/* 0000DA74 EC000828 */ fsubs f0, f0, f1
/* 0000DA78 EC020024 */ fdivs f0, f2, f0
/* 0000DA7C FC00001E */ fctiwz f0, f0
/* 0000DA80 D8010010 */ stfd f0, 0x10(r1)
/* 0000DA84 80610014 */ lwz r3, 0x14(r1)
/* 0000DA88 4BFF26D9 */ bl mathutil_sin
/* 0000DA8C 7FC00E70 */ srawi r0, r30, 1
/* 0000DA90 D03C006C */ stfs f1, 0x6c(r28)
/* 0000DA94 7C000194 */ addze r0, r0
/* 0000DA98 7C1D0000 */ cmpw r29, r0
/* 0000DA9C 40810024 */ ble lbl_0000DAC0
/* 0000DAA0 C81F0048 */ lfd f0, 0x48(r31)
/* 0000DAA4 C85F0040 */ lfd f2, 0x40(r31)
/* 0000DAA8 FC000072 */ fmul f0, f0, f1
/* 0000DAAC C83F0038 */ lfd f1, 0x38(r31)
/* 0000DAB0 FC020028 */ fsub f0, f2, f0
/* 0000DAB4 FC010032 */ fmul f0, f1, f0
/* 0000DAB8 FC000018 */ frsp f0, f0
/* 0000DABC D01C0040 */ stfs f0, 0x40(r28)
lbl_0000DAC0:
/* 0000DAC0 A87C0010 */ lha r3, 0x10(r28)
/* 0000DAC4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000DAC8 B01C0010 */ sth r0, 0x10(r28)
/* 0000DACC A81C0010 */ lha r0, 0x10(r28)
/* 0000DAD0 2C000000 */ cmpwi r0, 0
/* 0000DAD4 4181000C */ bgt lbl_0000DAE0
/* 0000DAD8 38000000 */ li r0, 0
/* 0000DADC 981B0000 */ stb r0, 0(r27)
lbl_0000DAE0:
/* 0000DAE0 BB61002C */ lmw r27, 0x2c(r1)
/* 0000DAE4 80010044 */ lwz r0, 0x44(r1)
/* 0000DAE8 38210040 */ addi r1, r1, 0x40
/* 0000DAEC 7C0803A6 */ mtlr r0
/* 0000DAF0 4E800020 */ blr 
lbl_0000DAF4:
/* 0000DAF4 7C0802A6 */ mflr r0
/* 0000DAF8 3CA00000 */ lis r5, lbl_00014D70@ha
/* 0000DAFC 90010004 */ stw r0, 4(r1)
/* 0000DB00 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000DB04 93E1001C */ stw r31, 0x1c(r1)
/* 0000DB08 3BE50000 */ addi r31, r5, lbl_00014D70@l
/* 0000DB0C 93C10018 */ stw r30, 0x18(r1)
/* 0000DB10 3BC40000 */ addi r30, r4, 0
/* 0000DB14 93A10014 */ stw r29, 0x14(r1)
/* 0000DB18 3BA30000 */ addi r29, r3, 0
/* 0000DB1C 4BFF2645 */ bl create_sprite
/* 0000DB20 7C6B1B79 */ or. r11, r3, r3
/* 0000DB24 41820078 */ beq lbl_0000DB9C
/* 0000DB28 C01F0028 */ lfs f0, 0x28(r31)
/* 0000DB2C 3C600000 */ lis r3, lbl_0000DBB8@ha
/* 0000DB30 394000FF */ li r10, 0xff
/* 0000DB34 D00B0004 */ stfs f0, 4(r11)
/* 0000DB38 39200000 */ li r9, 0
/* 0000DB3C 3900006B */ li r8, 0x6b
/* 0000DB40 C01F0050 */ lfs f0, 0x50(r31)
/* 0000DB44 38E00009 */ li r7, 9
/* 0000DB48 38C00004 */ li r6, 4
/* 0000DB4C D00B0008 */ stfs f0, 8(r11)
/* 0000DB50 7FA50734 */ extsh r5, r29
/* 0000DB54 38030000 */ addi r0, r3, lbl_0000DBB8@l
/* 0000DB58 C01F0030 */ lfs f0, 0x30(r31)
/* 0000DB5C 389E0000 */ addi r4, r30, 0
/* 0000DB60 386B008C */ addi r3, r11, 0x8c
/* 0000DB64 D00B004C */ stfs f0, 0x4c(r11)
/* 0000DB68 994B000C */ stb r10, 0xc(r11)
/* 0000DB6C 994B000D */ stb r10, 0xd(r11)
/* 0000DB70 992B000E */ stb r9, 0xe(r11)
/* 0000DB74 990B000F */ stb r8, 0xf(r11)
/* 0000DB78 98EB0001 */ stb r7, 1(r11)
/* 0000DB7C 98CB0003 */ stb r6, 3(r11)
/* 0000DB80 B0AB0010 */ sth r5, 0x10(r11)
/* 0000DB84 93AB0048 */ stw r29, 0x48(r11)
/* 0000DB88 80AB0074 */ lwz r5, 0x74(r11)
/* 0000DB8C 60A51000 */ ori r5, r5, 0x1000
/* 0000DB90 90AB0074 */ stw r5, 0x74(r11)
/* 0000DB94 900B0034 */ stw r0, 0x34(r11)
/* 0000DB98 4BFF25C9 */ bl strcpy
lbl_0000DB9C:
/* 0000DB9C 80010024 */ lwz r0, 0x24(r1)
/* 0000DBA0 83E1001C */ lwz r31, 0x1c(r1)
/* 0000DBA4 83C10018 */ lwz r30, 0x18(r1)
/* 0000DBA8 7C0803A6 */ mtlr r0
/* 0000DBAC 83A10014 */ lwz r29, 0x14(r1)
/* 0000DBB0 38210020 */ addi r1, r1, 0x20
/* 0000DBB4 4E800020 */ blr 
lbl_0000DBB8:
/* 0000DBB8 7C0802A6 */ mflr r0
/* 0000DBBC 90010004 */ stw r0, 4(r1)
/* 0000DBC0 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000DBC4 93E1002C */ stw r31, 0x2c(r1)
/* 0000DBC8 7C9F2378 */ mr r31, r4
/* 0000DBCC 93C10028 */ stw r30, 0x28(r1)
/* 0000DBD0 3BC30000 */ addi r30, r3, 0
/* 0000DBD4 93A10024 */ stw r29, 0x24(r1)
/* 0000DBD8 A8A40010 */ lha r5, 0x10(r4)
/* 0000DBDC 3C800000 */ lis r4, lbl_00014D70@ha
/* 0000DBE0 801F0048 */ lwz r0, 0x48(r31)
/* 0000DBE4 3BA40000 */ addi r29, r4, lbl_00014D70@l
/* 0000DBE8 7CC50050 */ subf r6, r5, r0
/* 0000DBEC 2C06001E */ cmpwi r6, 0x1e
/* 0000DBF0 40800064 */ bge lbl_0000DC54
/* 0000DBF4 6CC08000 */ xoris r0, r6, 0x8000
/* 0000DBF8 C85D0010 */ lfd f2, 0x10(r29)
/* 0000DBFC 9001001C */ stw r0, 0x1c(r1)
/* 0000DC00 3C804330 */ lis r4, 0x4330
/* 0000DC04 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000DC08 90810018 */ stw r4, 0x18(r1)
/* 0000DC0C 2006001E */ subfic r0, r6, 0x1e
/* 0000DC10 C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000DC14 1C000006 */ mulli r0, r0, 6
/* 0000DC18 C8010018 */ lfd f0, 0x18(r1)
/* 0000DC1C FC000828 */ fsub f0, f0, f1
/* 0000DC20 20000078 */ subfic r0, r0, 0x78
/* 0000DC24 6C008000 */ xoris r0, r0, 0x8000
/* 0000DC28 90010014 */ stw r0, 0x14(r1)
/* 0000DC2C 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000DC30 FC020032 */ fmul f0, f2, f0
/* 0000DC34 90810010 */ stw r4, 0x10(r1)
/* 0000DC38 FC200018 */ frsp f1, f0
/* 0000DC3C C8010010 */ lfd f0, 0x10(r1)
/* 0000DC40 D03F006C */ stfs f1, 0x6c(r31)
/* 0000DC44 C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000DC48 EC000828 */ fsubs f0, f0, f1
/* 0000DC4C D01F0008 */ stfs f0, 8(r31)
/* 0000DC50 480000B0 */ b lbl_0000DD00
lbl_0000DC54:
/* 0000DC54 2C06003C */ cmpwi r6, 0x3c
/* 0000DC58 40800030 */ bge lbl_0000DC88
/* 0000DC5C 3806FFE2 */ addi r0, r6, -30  ;# fixed addi
/* 0000DC60 C01D0004 */ lfs f0, 4(r29)
/* 0000DC64 1C600444 */ mulli r3, r0, 0x444
/* 0000DC68 D01F006C */ stfs f0, 0x6c(r31)
/* 0000DC6C 4BFF24F5 */ bl mathutil_sin
/* 0000DC70 C05D0054 */ lfs f2, 0x54(r29)
/* 0000DC74 C01D0050 */ lfs f0, 0x50(r29)
/* 0000DC78 EC220072 */ fmuls f1, f2, f1
/* 0000DC7C EC000828 */ fsubs f0, f0, f1
/* 0000DC80 D01F0008 */ stfs f0, 8(r31)
/* 0000DC84 4800007C */ b lbl_0000DD00
lbl_0000DC88:
/* 0000DC88 2C06005A */ cmpwi r6, 0x5a
/* 0000DC8C 40800030 */ bge lbl_0000DCBC
/* 0000DC90 3806FFC4 */ addi r0, r6, -60  ;# fixed addi
/* 0000DC94 C01D0004 */ lfs f0, 4(r29)
/* 0000DC98 1C600444 */ mulli r3, r0, 0x444
/* 0000DC9C D01F006C */ stfs f0, 0x6c(r31)
/* 0000DCA0 4BFF24C1 */ bl mathutil_sin
/* 0000DCA4 C05D0058 */ lfs f2, 0x58(r29)
/* 0000DCA8 C01D0050 */ lfs f0, 0x50(r29)
/* 0000DCAC EC220072 */ fmuls f1, f2, f1
/* 0000DCB0 EC000828 */ fsubs f0, f0, f1
/* 0000DCB4 D01F0008 */ stfs f0, 8(r31)
/* 0000DCB8 48000048 */ b lbl_0000DD00
lbl_0000DCBC:
/* 0000DCBC 2C05000F */ cmpwi r5, 0xf
/* 0000DCC0 41810038 */ bgt lbl_0000DCF8
/* 0000DCC4 6CA08000 */ xoris r0, r5, 0x8000
/* 0000DCC8 C85D0060 */ lfd f2, 0x60(r29)
/* 0000DCCC 90010014 */ stw r0, 0x14(r1)
/* 0000DCD0 3C004330 */ lis r0, 0x4330
/* 0000DCD4 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000DCD8 90010010 */ stw r0, 0x10(r1)
/* 0000DCDC C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000DCE0 C8010010 */ lfd f0, 0x10(r1)
/* 0000DCE4 FC000828 */ fsub f0, f0, f1
/* 0000DCE8 FC020032 */ fmul f0, f2, f0
/* 0000DCEC FC000018 */ frsp f0, f0
/* 0000DCF0 D01F006C */ stfs f0, 0x6c(r31)
/* 0000DCF4 4800000C */ b lbl_0000DD00
lbl_0000DCF8:
/* 0000DCF8 C01D0004 */ lfs f0, 4(r29)
/* 0000DCFC D01F006C */ stfs f0, 0x6c(r31)
lbl_0000DD00:
/* 0000DD00 C01D0034 */ lfs f0, 0x34(r29)
/* 0000DD04 D01F0040 */ stfs f0, 0x40(r31)
/* 0000DD08 C01F0040 */ lfs f0, 0x40(r31)
/* 0000DD0C D01F0044 */ stfs f0, 0x44(r31)
/* 0000DD10 A87F0010 */ lha r3, 0x10(r31)
/* 0000DD14 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000DD18 B01F0010 */ sth r0, 0x10(r31)
/* 0000DD1C A81F0010 */ lha r0, 0x10(r31)
/* 0000DD20 2C000000 */ cmpwi r0, 0
/* 0000DD24 4181000C */ bgt lbl_0000DD30
/* 0000DD28 38000000 */ li r0, 0
/* 0000DD2C 981E0000 */ stb r0, 0(r30)
lbl_0000DD30:
/* 0000DD30 80010034 */ lwz r0, 0x34(r1)
/* 0000DD34 83E1002C */ lwz r31, 0x2c(r1)
/* 0000DD38 83C10028 */ lwz r30, 0x28(r1)
/* 0000DD3C 7C0803A6 */ mtlr r0
/* 0000DD40 83A10024 */ lwz r29, 0x24(r1)
/* 0000DD44 38210030 */ addi r1, r1, 0x30
/* 0000DD48 4E800020 */ blr 
lbl_0000DD4C:
/* 0000DD4C 7C0802A6 */ mflr r0
/* 0000DD50 3CA00000 */ lis r5, lbl_00014D70@ha
/* 0000DD54 90010004 */ stw r0, 4(r1)
/* 0000DD58 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000DD5C 93E1001C */ stw r31, 0x1c(r1)
/* 0000DD60 3BE50000 */ addi r31, r5, lbl_00014D70@l
/* 0000DD64 93C10018 */ stw r30, 0x18(r1)
/* 0000DD68 3BC40000 */ addi r30, r4, 0
/* 0000DD6C 93A10014 */ stw r29, 0x14(r1)
/* 0000DD70 3BA30000 */ addi r29, r3, 0
/* 0000DD74 4BFF23ED */ bl create_sprite
/* 0000DD78 7C6B1B79 */ or. r11, r3, r3
/* 0000DD7C 41820078 */ beq lbl_0000DDF4
/* 0000DD80 C01F0028 */ lfs f0, 0x28(r31)
/* 0000DD84 3C600000 */ lis r3, lbl_0000DE10@ha
/* 0000DD88 394000FF */ li r10, 0xff
/* 0000DD8C D00B0004 */ stfs f0, 4(r11)
/* 0000DD90 39200000 */ li r9, 0
/* 0000DD94 3900006B */ li r8, 0x6b
/* 0000DD98 C01F0050 */ lfs f0, 0x50(r31)
/* 0000DD9C 38E00009 */ li r7, 9
/* 0000DDA0 38C00004 */ li r6, 4
/* 0000DDA4 D00B0008 */ stfs f0, 8(r11)
/* 0000DDA8 7FA50734 */ extsh r5, r29
/* 0000DDAC 38030000 */ addi r0, r3, lbl_0000DE10@l
/* 0000DDB0 C01F0030 */ lfs f0, 0x30(r31)
/* 0000DDB4 389E0000 */ addi r4, r30, 0
/* 0000DDB8 386B008C */ addi r3, r11, 0x8c
/* 0000DDBC D00B004C */ stfs f0, 0x4c(r11)
/* 0000DDC0 994B000C */ stb r10, 0xc(r11)
/* 0000DDC4 992B000D */ stb r9, 0xd(r11)
/* 0000DDC8 992B000E */ stb r9, 0xe(r11)
/* 0000DDCC 990B000F */ stb r8, 0xf(r11)
/* 0000DDD0 98EB0001 */ stb r7, 1(r11)
/* 0000DDD4 98CB0003 */ stb r6, 3(r11)
/* 0000DDD8 B0AB0010 */ sth r5, 0x10(r11)
/* 0000DDDC 93AB0048 */ stw r29, 0x48(r11)
/* 0000DDE0 80AB0074 */ lwz r5, 0x74(r11)
/* 0000DDE4 60A51000 */ ori r5, r5, 0x1000
/* 0000DDE8 90AB0074 */ stw r5, 0x74(r11)
/* 0000DDEC 900B0034 */ stw r0, 0x34(r11)
/* 0000DDF0 4BFF2371 */ bl strcpy
lbl_0000DDF4:
/* 0000DDF4 80010024 */ lwz r0, 0x24(r1)
/* 0000DDF8 83E1001C */ lwz r31, 0x1c(r1)
/* 0000DDFC 83C10018 */ lwz r30, 0x18(r1)
/* 0000DE00 7C0803A6 */ mtlr r0
/* 0000DE04 83A10014 */ lwz r29, 0x14(r1)
/* 0000DE08 38210020 */ addi r1, r1, 0x20
/* 0000DE0C 4E800020 */ blr 
lbl_0000DE10:
/* 0000DE10 7C0802A6 */ mflr r0
/* 0000DE14 90010004 */ stw r0, 4(r1)
/* 0000DE18 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000DE1C 93E1002C */ stw r31, 0x2c(r1)
/* 0000DE20 7C9F2378 */ mr r31, r4
/* 0000DE24 93C10028 */ stw r30, 0x28(r1)
/* 0000DE28 3BC30000 */ addi r30, r3, 0
/* 0000DE2C 93A10024 */ stw r29, 0x24(r1)
/* 0000DE30 A8A40010 */ lha r5, 0x10(r4)
/* 0000DE34 3C800000 */ lis r4, lbl_00014D70@ha
/* 0000DE38 801F0048 */ lwz r0, 0x48(r31)
/* 0000DE3C 3BA40000 */ addi r29, r4, lbl_00014D70@l
/* 0000DE40 7CC50050 */ subf r6, r5, r0
/* 0000DE44 2C06001E */ cmpwi r6, 0x1e
/* 0000DE48 40800064 */ bge lbl_0000DEAC
/* 0000DE4C 6CC08000 */ xoris r0, r6, 0x8000
/* 0000DE50 C85D0010 */ lfd f2, 0x10(r29)
/* 0000DE54 9001001C */ stw r0, 0x1c(r1)
/* 0000DE58 3C804330 */ lis r4, 0x4330
/* 0000DE5C 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000DE60 90810018 */ stw r4, 0x18(r1)
/* 0000DE64 2006001E */ subfic r0, r6, 0x1e
/* 0000DE68 C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000DE6C 1C000006 */ mulli r0, r0, 6
/* 0000DE70 C8010018 */ lfd f0, 0x18(r1)
/* 0000DE74 FC000828 */ fsub f0, f0, f1
/* 0000DE78 20000078 */ subfic r0, r0, 0x78
/* 0000DE7C 6C008000 */ xoris r0, r0, 0x8000
/* 0000DE80 90010014 */ stw r0, 0x14(r1)
/* 0000DE84 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000DE88 FC020032 */ fmul f0, f2, f0
/* 0000DE8C 90810010 */ stw r4, 0x10(r1)
/* 0000DE90 FC200018 */ frsp f1, f0
/* 0000DE94 C8010010 */ lfd f0, 0x10(r1)
/* 0000DE98 D03F006C */ stfs f1, 0x6c(r31)
/* 0000DE9C C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000DEA0 EC000828 */ fsubs f0, f0, f1
/* 0000DEA4 D01F0008 */ stfs f0, 8(r31)
/* 0000DEA8 480000B0 */ b lbl_0000DF58
lbl_0000DEAC:
/* 0000DEAC 2C06003C */ cmpwi r6, 0x3c
/* 0000DEB0 40800030 */ bge lbl_0000DEE0
/* 0000DEB4 3806FFE2 */ addi r0, r6, -30  ;# fixed addi
/* 0000DEB8 C01D0004 */ lfs f0, 4(r29)
/* 0000DEBC 1C600444 */ mulli r3, r0, 0x444
/* 0000DEC0 D01F006C */ stfs f0, 0x6c(r31)
/* 0000DEC4 4BFF229D */ bl mathutil_sin
/* 0000DEC8 C05D0054 */ lfs f2, 0x54(r29)
/* 0000DECC C01D0050 */ lfs f0, 0x50(r29)
/* 0000DED0 EC220072 */ fmuls f1, f2, f1
/* 0000DED4 EC000828 */ fsubs f0, f0, f1
/* 0000DED8 D01F0008 */ stfs f0, 8(r31)
/* 0000DEDC 4800007C */ b lbl_0000DF58
lbl_0000DEE0:
/* 0000DEE0 2C06005A */ cmpwi r6, 0x5a
/* 0000DEE4 40800030 */ bge lbl_0000DF14
/* 0000DEE8 3806FFC4 */ addi r0, r6, -60  ;# fixed addi
/* 0000DEEC C01D0004 */ lfs f0, 4(r29)
/* 0000DEF0 1C600444 */ mulli r3, r0, 0x444
/* 0000DEF4 D01F006C */ stfs f0, 0x6c(r31)
/* 0000DEF8 4BFF2269 */ bl mathutil_sin
/* 0000DEFC C05D0058 */ lfs f2, 0x58(r29)
/* 0000DF00 C01D0050 */ lfs f0, 0x50(r29)
/* 0000DF04 EC220072 */ fmuls f1, f2, f1
/* 0000DF08 EC000828 */ fsubs f0, f0, f1
/* 0000DF0C D01F0008 */ stfs f0, 8(r31)
/* 0000DF10 48000048 */ b lbl_0000DF58
lbl_0000DF14:
/* 0000DF14 2C05000F */ cmpwi r5, 0xf
/* 0000DF18 41810038 */ bgt lbl_0000DF50
/* 0000DF1C 6CA08000 */ xoris r0, r5, 0x8000
/* 0000DF20 C85D0060 */ lfd f2, 0x60(r29)
/* 0000DF24 90010014 */ stw r0, 0x14(r1)
/* 0000DF28 3C004330 */ lis r0, 0x4330
/* 0000DF2C 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000DF30 90010010 */ stw r0, 0x10(r1)
/* 0000DF34 C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000DF38 C8010010 */ lfd f0, 0x10(r1)
/* 0000DF3C FC000828 */ fsub f0, f0, f1
/* 0000DF40 FC020032 */ fmul f0, f2, f0
/* 0000DF44 FC000018 */ frsp f0, f0
/* 0000DF48 D01F006C */ stfs f0, 0x6c(r31)
/* 0000DF4C 4800000C */ b lbl_0000DF58
lbl_0000DF50:
/* 0000DF50 C01D0004 */ lfs f0, 4(r29)
/* 0000DF54 D01F006C */ stfs f0, 0x6c(r31)
lbl_0000DF58:
/* 0000DF58 C01D0034 */ lfs f0, 0x34(r29)
/* 0000DF5C D01F0040 */ stfs f0, 0x40(r31)
/* 0000DF60 C01F0040 */ lfs f0, 0x40(r31)
/* 0000DF64 D01F0044 */ stfs f0, 0x44(r31)
/* 0000DF68 A87F0010 */ lha r3, 0x10(r31)
/* 0000DF6C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000DF70 B01F0010 */ sth r0, 0x10(r31)
/* 0000DF74 A81F0010 */ lha r0, 0x10(r31)
/* 0000DF78 2C000000 */ cmpwi r0, 0
/* 0000DF7C 4181000C */ bgt lbl_0000DF88
/* 0000DF80 38000000 */ li r0, 0
/* 0000DF84 981E0000 */ stb r0, 0(r30)
lbl_0000DF88:
/* 0000DF88 80010034 */ lwz r0, 0x34(r1)
/* 0000DF8C 83E1002C */ lwz r31, 0x2c(r1)
/* 0000DF90 83C10028 */ lwz r30, 0x28(r1)
/* 0000DF94 7C0803A6 */ mtlr r0
/* 0000DF98 83A10024 */ lwz r29, 0x24(r1)
/* 0000DF9C 38210030 */ addi r1, r1, 0x30
/* 0000DFA0 4E800020 */ blr 
lbl_0000DFA4:
/* 0000DFA4 7C0802A6 */ mflr r0
/* 0000DFA8 90010004 */ stw r0, 4(r1)
/* 0000DFAC 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000DFB0 93E1001C */ stw r31, 0x1c(r1)
/* 0000DFB4 93C10018 */ stw r30, 0x18(r1)
/* 0000DFB8 7C9E2379 */ or. r30, r4, r4
/* 0000DFBC 3C800000 */ lis r4, lbl_00014D70@ha
/* 0000DFC0 93A10014 */ stw r29, 0x14(r1)
/* 0000DFC4 3BA30000 */ addi r29, r3, 0
/* 0000DFC8 3BE40000 */ addi r31, r4, lbl_00014D70@l
/* 0000DFCC 408100B0 */ ble lbl_0000E07C
/* 0000DFD0 4BFF2191 */ bl create_sprite
/* 0000DFD4 28030000 */ cmplwi r3, 0
/* 0000DFD8 418200A4 */ beq lbl_0000E07C
/* 0000DFDC C01F0028 */ lfs f0, 0x28(r31)
/* 0000DFE0 3C800000 */ lis r4, lbl_0000E098@ha
/* 0000DFE4 396000FF */ li r11, 0xff
/* 0000DFE8 D0030004 */ stfs f0, 4(r3)
/* 0000DFEC 3940008C */ li r10, 0x8c
/* 0000DFF0 39200000 */ li r9, 0
/* 0000DFF4 C01F0050 */ lfs f0, 0x50(r31)
/* 0000DFF8 3900006B */ li r8, 0x6b
/* 0000DFFC 38E00009 */ li r7, 9
/* 0000E000 D0030008 */ stfs f0, 8(r3)
/* 0000E004 38C00004 */ li r6, 4
/* 0000E008 7FA50734 */ extsh r5, r29
/* 0000E00C C01F0030 */ lfs f0, 0x30(r31)
/* 0000E010 2C1E0001 */ cmpwi r30, 1
/* 0000E014 38040000 */ addi r0, r4, lbl_0000E098@l
/* 0000E018 D003004C */ stfs f0, 0x4c(r3)
/* 0000E01C 9963000C */ stb r11, 0xc(r3)
/* 0000E020 9943000D */ stb r10, 0xd(r3)
/* 0000E024 9923000E */ stb r9, 0xe(r3)
/* 0000E028 9903000F */ stb r8, 0xf(r3)
/* 0000E02C 98E30001 */ stb r7, 1(r3)
/* 0000E030 98C30003 */ stb r6, 3(r3)
/* 0000E034 B0A30010 */ sth r5, 0x10(r3)
/* 0000E038 93A30048 */ stw r29, 0x48(r3)
/* 0000E03C 80830074 */ lwz r4, 0x74(r3)
/* 0000E040 60841000 */ ori r4, r4, 0x1000
/* 0000E044 90830074 */ stw r4, 0x74(r3)
/* 0000E048 90030034 */ stw r0, 0x34(r3)
/* 0000E04C 40820018 */ bne lbl_0000E064
/* 0000E050 3C800000 */ lis r4, lbl_0001543C@ha
/* 0000E054 38840000 */ addi r4, r4, lbl_0001543C@l
/* 0000E058 3863008C */ addi r3, r3, 0x8c
/* 0000E05C 4BFF2105 */ bl strcpy
/* 0000E060 4800001C */ b lbl_0000E07C
lbl_0000E064:
/* 0000E064 3C800000 */ lis r4, lbl_00015444@ha
/* 0000E068 4CC63182 */ crclr 6
/* 0000E06C 38840000 */ addi r4, r4, lbl_00015444@l
/* 0000E070 38BE0000 */ addi r5, r30, 0
/* 0000E074 3863008C */ addi r3, r3, 0x8c
/* 0000E078 4BFF20E9 */ bl sprintf
lbl_0000E07C:
/* 0000E07C 80010024 */ lwz r0, 0x24(r1)
/* 0000E080 83E1001C */ lwz r31, 0x1c(r1)
/* 0000E084 83C10018 */ lwz r30, 0x18(r1)
/* 0000E088 7C0803A6 */ mtlr r0
/* 0000E08C 83A10014 */ lwz r29, 0x14(r1)
/* 0000E090 38210020 */ addi r1, r1, 0x20
/* 0000E094 4E800020 */ blr 
lbl_0000E098:
/* 0000E098 7C0802A6 */ mflr r0
/* 0000E09C 90010004 */ stw r0, 4(r1)
/* 0000E0A0 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000E0A4 93E1002C */ stw r31, 0x2c(r1)
/* 0000E0A8 7C9F2378 */ mr r31, r4
/* 0000E0AC 93C10028 */ stw r30, 0x28(r1)
/* 0000E0B0 3BC30000 */ addi r30, r3, 0
/* 0000E0B4 93A10024 */ stw r29, 0x24(r1)
/* 0000E0B8 A8A40010 */ lha r5, 0x10(r4)
/* 0000E0BC 3C800000 */ lis r4, lbl_00014D70@ha
/* 0000E0C0 801F0048 */ lwz r0, 0x48(r31)
/* 0000E0C4 3BA40000 */ addi r29, r4, lbl_00014D70@l
/* 0000E0C8 7CC50050 */ subf r6, r5, r0
/* 0000E0CC 2C06001E */ cmpwi r6, 0x1e
/* 0000E0D0 40800064 */ bge lbl_0000E134
/* 0000E0D4 6CC08000 */ xoris r0, r6, 0x8000
/* 0000E0D8 C85D0010 */ lfd f2, 0x10(r29)
/* 0000E0DC 9001001C */ stw r0, 0x1c(r1)
/* 0000E0E0 3C804330 */ lis r4, 0x4330
/* 0000E0E4 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000E0E8 90810018 */ stw r4, 0x18(r1)
/* 0000E0EC 2006001E */ subfic r0, r6, 0x1e
/* 0000E0F0 C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000E0F4 1C000006 */ mulli r0, r0, 6
/* 0000E0F8 C8010018 */ lfd f0, 0x18(r1)
/* 0000E0FC FC000828 */ fsub f0, f0, f1
/* 0000E100 20000078 */ subfic r0, r0, 0x78
/* 0000E104 6C008000 */ xoris r0, r0, 0x8000
/* 0000E108 90010014 */ stw r0, 0x14(r1)
/* 0000E10C 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000E110 FC020032 */ fmul f0, f2, f0
/* 0000E114 90810010 */ stw r4, 0x10(r1)
/* 0000E118 FC200018 */ frsp f1, f0
/* 0000E11C C8010010 */ lfd f0, 0x10(r1)
/* 0000E120 D03F006C */ stfs f1, 0x6c(r31)
/* 0000E124 C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000E128 EC000828 */ fsubs f0, f0, f1
/* 0000E12C D01F0008 */ stfs f0, 8(r31)
/* 0000E130 480000B0 */ b lbl_0000E1E0
lbl_0000E134:
/* 0000E134 2C06003C */ cmpwi r6, 0x3c
/* 0000E138 40800030 */ bge lbl_0000E168
/* 0000E13C 3806FFE2 */ addi r0, r6, -30  ;# fixed addi
/* 0000E140 C01D0004 */ lfs f0, 4(r29)
/* 0000E144 1C600444 */ mulli r3, r0, 0x444
/* 0000E148 D01F006C */ stfs f0, 0x6c(r31)
/* 0000E14C 4BFF2015 */ bl mathutil_sin
/* 0000E150 C05D0054 */ lfs f2, 0x54(r29)
/* 0000E154 C01D0050 */ lfs f0, 0x50(r29)
/* 0000E158 EC220072 */ fmuls f1, f2, f1
/* 0000E15C EC000828 */ fsubs f0, f0, f1
/* 0000E160 D01F0008 */ stfs f0, 8(r31)
/* 0000E164 4800007C */ b lbl_0000E1E0
lbl_0000E168:
/* 0000E168 2C06005A */ cmpwi r6, 0x5a
/* 0000E16C 40800030 */ bge lbl_0000E19C
/* 0000E170 3806FFC4 */ addi r0, r6, -60  ;# fixed addi
/* 0000E174 C01D0004 */ lfs f0, 4(r29)
/* 0000E178 1C600444 */ mulli r3, r0, 0x444
/* 0000E17C D01F006C */ stfs f0, 0x6c(r31)
/* 0000E180 4BFF1FE1 */ bl mathutil_sin
/* 0000E184 C05D0058 */ lfs f2, 0x58(r29)
/* 0000E188 C01D0050 */ lfs f0, 0x50(r29)
/* 0000E18C EC220072 */ fmuls f1, f2, f1
/* 0000E190 EC000828 */ fsubs f0, f0, f1
/* 0000E194 D01F0008 */ stfs f0, 8(r31)
/* 0000E198 48000048 */ b lbl_0000E1E0
lbl_0000E19C:
/* 0000E19C 2C05000F */ cmpwi r5, 0xf
/* 0000E1A0 41810038 */ bgt lbl_0000E1D8
/* 0000E1A4 6CA08000 */ xoris r0, r5, 0x8000
/* 0000E1A8 C85D0060 */ lfd f2, 0x60(r29)
/* 0000E1AC 90010014 */ stw r0, 0x14(r1)
/* 0000E1B0 3C004330 */ lis r0, 0x4330
/* 0000E1B4 3C600000 */ lis r3, lbl_00014D90@ha
/* 0000E1B8 90010010 */ stw r0, 0x10(r1)
/* 0000E1BC C8230000 */ lfd f1, lbl_00014D90@l(r3)
/* 0000E1C0 C8010010 */ lfd f0, 0x10(r1)
/* 0000E1C4 FC000828 */ fsub f0, f0, f1
/* 0000E1C8 FC020032 */ fmul f0, f2, f0
/* 0000E1CC FC000018 */ frsp f0, f0
/* 0000E1D0 D01F006C */ stfs f0, 0x6c(r31)
/* 0000E1D4 4800000C */ b lbl_0000E1E0
lbl_0000E1D8:
/* 0000E1D8 C01D0004 */ lfs f0, 4(r29)
/* 0000E1DC D01F006C */ stfs f0, 0x6c(r31)
lbl_0000E1E0:
/* 0000E1E0 C01D0034 */ lfs f0, 0x34(r29)
/* 0000E1E4 D01F0040 */ stfs f0, 0x40(r31)
/* 0000E1E8 C01F0040 */ lfs f0, 0x40(r31)
/* 0000E1EC D01F0044 */ stfs f0, 0x44(r31)
/* 0000E1F0 A87F0010 */ lha r3, 0x10(r31)
/* 0000E1F4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000E1F8 B01F0010 */ sth r0, 0x10(r31)
/* 0000E1FC A81F0010 */ lha r0, 0x10(r31)
/* 0000E200 2C000000 */ cmpwi r0, 0
/* 0000E204 4181000C */ bgt lbl_0000E210
/* 0000E208 38000000 */ li r0, 0
/* 0000E20C 981E0000 */ stb r0, 0(r30)
lbl_0000E210:
/* 0000E210 80010034 */ lwz r0, 0x34(r1)
/* 0000E214 83E1002C */ lwz r31, 0x2c(r1)
/* 0000E218 83C10028 */ lwz r30, 0x28(r1)
/* 0000E21C 7C0803A6 */ mtlr r0
/* 0000E220 83A10024 */ lwz r29, 0x24(r1)
/* 0000E224 38210030 */ addi r1, r1, 0x30
/* 0000E228 4E800020 */ blr 
lbl_0000E22C:
/* 0000E22C 7C0802A6 */ mflr r0
/* 0000E230 3C800000 */ lis r4, lbl_00014D70@ha
/* 0000E234 90010004 */ stw r0, 4(r1)
/* 0000E238 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E23C 93E10014 */ stw r31, 0x14(r1)
/* 0000E240 3BE40000 */ addi r31, r4, lbl_00014D70@l
/* 0000E244 93C10010 */ stw r30, 0x10(r1)
/* 0000E248 3BC30000 */ addi r30, r3, 0
/* 0000E24C 4BFF1F15 */ bl create_sprite
/* 0000E250 7C6A1B79 */ or. r10, r3, r3
/* 0000E254 41820074 */ beq lbl_0000E2C8
/* 0000E258 C01F0028 */ lfs f0, 0x28(r31)
/* 0000E25C 3C600000 */ lis r3, lbl_00015454@ha
/* 0000E260 38830000 */ addi r4, r3, lbl_00015454@l
/* 0000E264 D00A0004 */ stfs f0, 4(r10)
/* 0000E268 38C000FF */ li r6, 0xff
/* 0000E26C 38000000 */ li r0, 0
/* 0000E270 C01F002C */ lfs f0, 0x2c(r31)
/* 0000E274 38600020 */ li r3, 0x20
/* 0000E278 3920006B */ li r9, 0x6b
/* 0000E27C D00A0008 */ stfs f0, 8(r10)
/* 0000E280 39000009 */ li r8, 9
/* 0000E284 38E00004 */ li r7, 4
/* 0000E288 98CA000C */ stb r6, 0xc(r10)
/* 0000E28C 7FC60734 */ extsh r6, r30
/* 0000E290 3CA00000 */ lis r5, lbl_0000E2E0@ha
/* 0000E294 980A000D */ stb r0, 0xd(r10)
/* 0000E298 38050000 */ addi r0, r5, lbl_0000E2E0@l
/* 0000E29C 986A000E */ stb r3, 0xe(r10)
/* 0000E2A0 386A008C */ addi r3, r10, 0x8c
/* 0000E2A4 992A000F */ stb r9, 0xf(r10)
/* 0000E2A8 990A0001 */ stb r8, 1(r10)
/* 0000E2AC 98EA0003 */ stb r7, 3(r10)
/* 0000E2B0 B0CA0010 */ sth r6, 0x10(r10)
/* 0000E2B4 93CA0048 */ stw r30, 0x48(r10)
/* 0000E2B8 C01F0000 */ lfs f0, 0(r31)
/* 0000E2BC D00A004C */ stfs f0, 0x4c(r10)
/* 0000E2C0 900A0034 */ stw r0, 0x34(r10)
/* 0000E2C4 4BFF1E9D */ bl strcpy
lbl_0000E2C8:
/* 0000E2C8 8001001C */ lwz r0, 0x1c(r1)
/* 0000E2CC 83E10014 */ lwz r31, 0x14(r1)
/* 0000E2D0 83C10010 */ lwz r30, 0x10(r1)
/* 0000E2D4 7C0803A6 */ mtlr r0
/* 0000E2D8 38210018 */ addi r1, r1, 0x18
/* 0000E2DC 4E800020 */ blr 
lbl_0000E2E0:
/* 0000E2E0 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E2E4 3CA00000 */ lis r5, lbl_00014D70@ha
/* 0000E2E8 38A50000 */ addi r5, r5, lbl_00014D70@l
/* 0000E2EC A8C40010 */ lha r6, 0x10(r4)
/* 0000E2F0 80040048 */ lwz r0, 0x48(r4)
/* 0000E2F4 2C06003C */ cmpwi r6, 0x3c
/* 0000E2F8 7C060050 */ subf r0, r6, r0
/* 0000E2FC 40800038 */ bge lbl_0000E334
/* 0000E300 6CC08000 */ xoris r0, r6, 0x8000
/* 0000E304 C8450068 */ lfd f2, 0x68(r5)
/* 0000E308 90010014 */ stw r0, 0x14(r1)
/* 0000E30C 3C004330 */ lis r0, 0x4330
/* 0000E310 3CA00000 */ lis r5, lbl_00014D90@ha
/* 0000E314 90010010 */ stw r0, 0x10(r1)
/* 0000E318 C8250000 */ lfd f1, lbl_00014D90@l(r5)
/* 0000E31C C8010010 */ lfd f0, 0x10(r1)
/* 0000E320 FC000828 */ fsub f0, f0, f1
/* 0000E324 FC020032 */ fmul f0, f2, f0
/* 0000E328 FC000018 */ frsp f0, f0
/* 0000E32C D004006C */ stfs f0, 0x6c(r4)
/* 0000E330 48000048 */ b lbl_0000E378
lbl_0000E334:
/* 0000E334 2C00001E */ cmpwi r0, 0x1e
/* 0000E338 40800038 */ bge lbl_0000E370
/* 0000E33C 6C008000 */ xoris r0, r0, 0x8000
/* 0000E340 C8450010 */ lfd f2, 0x10(r5)
/* 0000E344 90010014 */ stw r0, 0x14(r1)
/* 0000E348 3C004330 */ lis r0, 0x4330
/* 0000E34C 3CA00000 */ lis r5, lbl_00014D90@ha
/* 0000E350 90010010 */ stw r0, 0x10(r1)
/* 0000E354 C8250000 */ lfd f1, lbl_00014D90@l(r5)
/* 0000E358 C8010010 */ lfd f0, 0x10(r1)
/* 0000E35C FC000828 */ fsub f0, f0, f1
/* 0000E360 FC020032 */ fmul f0, f2, f0
/* 0000E364 FC000018 */ frsp f0, f0
/* 0000E368 D004006C */ stfs f0, 0x6c(r4)
/* 0000E36C 4800000C */ b lbl_0000E378
lbl_0000E370:
/* 0000E370 C0050004 */ lfs f0, 4(r5)
/* 0000E374 D004006C */ stfs f0, 0x6c(r4)
lbl_0000E378:
/* 0000E378 A8A40010 */ lha r5, 0x10(r4)
/* 0000E37C 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000E380 B0040010 */ sth r0, 0x10(r4)
/* 0000E384 A8040010 */ lha r0, 0x10(r4)
/* 0000E388 2C000000 */ cmpwi r0, 0
/* 0000E38C 4181000C */ bgt lbl_0000E398
/* 0000E390 38000000 */ li r0, 0
/* 0000E394 98030000 */ stb r0, 0(r3)
lbl_0000E398:
/* 0000E398 38210018 */ addi r1, r1, 0x18
/* 0000E39C 4E800020 */ blr 
lbl_0000E3A0:
/* 0000E3A0 7C0802A6 */ mflr r0
/* 0000E3A4 3C800000 */ lis r4, lbl_00014D70@ha
/* 0000E3A8 90010004 */ stw r0, 4(r1)
/* 0000E3AC 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E3B0 93E10014 */ stw r31, 0x14(r1)
/* 0000E3B4 3BE40000 */ addi r31, r4, lbl_00014D70@l
/* 0000E3B8 93C10010 */ stw r30, 0x10(r1)
/* 0000E3BC 3BC30000 */ addi r30, r3, 0
/* 0000E3C0 4BFF1DA1 */ bl create_sprite
/* 0000E3C4 7C6B1B79 */ or. r11, r3, r3
/* 0000E3C8 41820070 */ beq lbl_0000E438
/* 0000E3CC C01F0028 */ lfs f0, 0x28(r31)
/* 0000E3D0 3C600000 */ lis r3, lbl_00015460@ha
/* 0000E3D4 38830000 */ addi r4, r3, lbl_00015460@l
/* 0000E3D8 D00B0004 */ stfs f0, 4(r11)
/* 0000E3DC 3CA00000 */ lis r5, lbl_0000E450@ha
/* 0000E3E0 386000FF */ li r3, 0xff
/* 0000E3E4 C01F002C */ lfs f0, 0x2c(r31)
/* 0000E3E8 39400000 */ li r10, 0
/* 0000E3EC 3920006B */ li r9, 0x6b
/* 0000E3F0 D00B0008 */ stfs f0, 8(r11)
/* 0000E3F4 39000009 */ li r8, 9
/* 0000E3F8 38E00004 */ li r7, 4
/* 0000E3FC 986B000C */ stb r3, 0xc(r11)
/* 0000E400 7FC60734 */ extsh r6, r30
/* 0000E404 38050000 */ addi r0, r5, lbl_0000E450@l
/* 0000E408 986B000D */ stb r3, 0xd(r11)
/* 0000E40C 386B008C */ addi r3, r11, 0x8c
/* 0000E410 994B000E */ stb r10, 0xe(r11)
/* 0000E414 992B000F */ stb r9, 0xf(r11)
/* 0000E418 990B0001 */ stb r8, 1(r11)
/* 0000E41C 98EB0003 */ stb r7, 3(r11)
/* 0000E420 B0CB0010 */ sth r6, 0x10(r11)
/* 0000E424 93CB0048 */ stw r30, 0x48(r11)
/* 0000E428 C01F0000 */ lfs f0, 0(r31)
/* 0000E42C D00B004C */ stfs f0, 0x4c(r11)
/* 0000E430 900B0034 */ stw r0, 0x34(r11)
/* 0000E434 4BFF1D2D */ bl strcpy
lbl_0000E438:
/* 0000E438 8001001C */ lwz r0, 0x1c(r1)
/* 0000E43C 83E10014 */ lwz r31, 0x14(r1)
/* 0000E440 83C10010 */ lwz r30, 0x10(r1)
/* 0000E444 7C0803A6 */ mtlr r0
/* 0000E448 38210018 */ addi r1, r1, 0x18
/* 0000E44C 4E800020 */ blr 
lbl_0000E450:
/* 0000E450 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E454 3CA00000 */ lis r5, lbl_00014D70@ha
/* 0000E458 38A50000 */ addi r5, r5, lbl_00014D70@l
/* 0000E45C A8C40010 */ lha r6, 0x10(r4)
/* 0000E460 80040048 */ lwz r0, 0x48(r4)
/* 0000E464 2C06003C */ cmpwi r6, 0x3c
/* 0000E468 7C060050 */ subf r0, r6, r0
/* 0000E46C 40800038 */ bge lbl_0000E4A4
/* 0000E470 6CC08000 */ xoris r0, r6, 0x8000
/* 0000E474 C8450068 */ lfd f2, 0x68(r5)
/* 0000E478 90010014 */ stw r0, 0x14(r1)
/* 0000E47C 3C004330 */ lis r0, 0x4330
/* 0000E480 3CA00000 */ lis r5, lbl_00014D90@ha
/* 0000E484 90010010 */ stw r0, 0x10(r1)
/* 0000E488 C8250000 */ lfd f1, lbl_00014D90@l(r5)
/* 0000E48C C8010010 */ lfd f0, 0x10(r1)
/* 0000E490 FC000828 */ fsub f0, f0, f1
/* 0000E494 FC020032 */ fmul f0, f2, f0
/* 0000E498 FC000018 */ frsp f0, f0
/* 0000E49C D004006C */ stfs f0, 0x6c(r4)
/* 0000E4A0 48000048 */ b lbl_0000E4E8
lbl_0000E4A4:
/* 0000E4A4 2C00001E */ cmpwi r0, 0x1e
/* 0000E4A8 40800038 */ bge lbl_0000E4E0
/* 0000E4AC 6C008000 */ xoris r0, r0, 0x8000
/* 0000E4B0 C8450010 */ lfd f2, 0x10(r5)
/* 0000E4B4 90010014 */ stw r0, 0x14(r1)
/* 0000E4B8 3C004330 */ lis r0, 0x4330
/* 0000E4BC 3CA00000 */ lis r5, lbl_00014D90@ha
/* 0000E4C0 90010010 */ stw r0, 0x10(r1)
/* 0000E4C4 C8250000 */ lfd f1, lbl_00014D90@l(r5)
/* 0000E4C8 C8010010 */ lfd f0, 0x10(r1)
/* 0000E4CC FC000828 */ fsub f0, f0, f1
/* 0000E4D0 FC020032 */ fmul f0, f2, f0
/* 0000E4D4 FC000018 */ frsp f0, f0
/* 0000E4D8 D004006C */ stfs f0, 0x6c(r4)
/* 0000E4DC 4800000C */ b lbl_0000E4E8
lbl_0000E4E0:
/* 0000E4E0 C0050004 */ lfs f0, 4(r5)
/* 0000E4E4 D004006C */ stfs f0, 0x6c(r4)
lbl_0000E4E8:
/* 0000E4E8 A8A40010 */ lha r5, 0x10(r4)
/* 0000E4EC 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000E4F0 B0040010 */ sth r0, 0x10(r4)
/* 0000E4F4 A8040010 */ lha r0, 0x10(r4)
/* 0000E4F8 2C000000 */ cmpwi r0, 0
/* 0000E4FC 4181000C */ bgt lbl_0000E508
/* 0000E500 38000000 */ li r0, 0
/* 0000E504 98030000 */ stb r0, 0(r3)
lbl_0000E508:
/* 0000E508 38210018 */ addi r1, r1, 0x18
/* 0000E50C 4E800020 */ blr 
lbl_0000E510:
/* 0000E510 7C0802A6 */ mflr r0
/* 0000E514 3C600000 */ lis r3, lbl_00014D70@ha
/* 0000E518 90010004 */ stw r0, 4(r1)
/* 0000E51C 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000E520 93E1000C */ stw r31, 0xc(r1)
/* 0000E524 3BE30000 */ addi r31, r3, lbl_00014D70@l
/* 0000E528 4BFF1C39 */ bl create_sprite
/* 0000E52C 7C6B1B79 */ or. r11, r3, r3
/* 0000E530 41820090 */ beq lbl_0000E5C0
/* 0000E534 C01F0070 */ lfs f0, 0x70(r31)
/* 0000E538 3C600000 */ lis r3, lbl_0001546C@ha
/* 0000E53C 38830000 */ addi r4, r3, lbl_0001546C@l
/* 0000E540 D00B0004 */ stfs f0, 4(r11)
/* 0000E544 3CA00000 */ lis r5, lbl_0000E5D4@ha
/* 0000E548 38600000 */ li r3, 0
/* 0000E54C C01F002C */ lfs f0, 0x2c(r31)
/* 0000E550 394000FF */ li r10, 0xff
/* 0000E554 3920006B */ li r9, 0x6b
/* 0000E558 D00B0008 */ stfs f0, 8(r11)
/* 0000E55C 39000009 */ li r8, 9
/* 0000E560 38E00004 */ li r7, 4
/* 0000E564 986B000C */ stb r3, 0xc(r11)
/* 0000E568 38C0012C */ li r6, 0x12c
/* 0000E56C 38050000 */ addi r0, r5, lbl_0000E5D4@l
/* 0000E570 986B000D */ stb r3, 0xd(r11)
/* 0000E574 386B008C */ addi r3, r11, 0x8c
/* 0000E578 994B000E */ stb r10, 0xe(r11)
/* 0000E57C 992B000F */ stb r9, 0xf(r11)
/* 0000E580 990B0001 */ stb r8, 1(r11)
/* 0000E584 98EB0003 */ stb r7, 3(r11)
/* 0000E588 B0CB0010 */ sth r6, 0x10(r11)
/* 0000E58C 90CB0048 */ stw r6, 0x48(r11)
/* 0000E590 C01F0074 */ lfs f0, 0x74(r31)
/* 0000E594 D00B0040 */ stfs f0, 0x40(r11)
/* 0000E598 C01F0074 */ lfs f0, 0x74(r31)
/* 0000E59C D00B0044 */ stfs f0, 0x44(r11)
/* 0000E5A0 C01F0000 */ lfs f0, 0(r31)
/* 0000E5A4 D00B004C */ stfs f0, 0x4c(r11)
/* 0000E5A8 C01F0004 */ lfs f0, 4(r31)
/* 0000E5AC D00B006C */ stfs f0, 0x6c(r11)
/* 0000E5B0 900B0034 */ stw r0, 0x34(r11)
/* 0000E5B4 4BFF1BAD */ bl strcpy
/* 0000E5B8 38600006 */ li r3, 6
/* 0000E5BC 4BFF1BA5 */ bl g_play_sound
lbl_0000E5C0:
/* 0000E5C0 80010014 */ lwz r0, 0x14(r1)
/* 0000E5C4 83E1000C */ lwz r31, 0xc(r1)
/* 0000E5C8 38210010 */ addi r1, r1, 0x10
/* 0000E5CC 7C0803A6 */ mtlr r0
/* 0000E5D0 4E800020 */ blr 
lbl_0000E5D4:
/* 0000E5D4 7C0802A6 */ mflr r0
/* 0000E5D8 3CA00000 */ lis r5, lbl_00015428@ha
/* 0000E5DC 90010004 */ stw r0, 4(r1)
/* 0000E5E0 38C50000 */ addi r6, r5, lbl_00015428@l
/* 0000E5E4 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000E5E8 93E1001C */ stw r31, 0x1c(r1)
/* 0000E5EC 3BE30000 */ addi r31, r3, 0
/* 0000E5F0 93C10018 */ stw r30, 0x18(r1)
/* 0000E5F4 93A10014 */ stw r29, 0x14(r1)
/* 0000E5F8 7C9D2378 */ mr r29, r4
/* 0000E5FC A8040010 */ lha r0, 0x10(r4)
/* 0000E600 3C800000 */ lis r4, lbl_00014D70@ha
/* 0000E604 3BC40000 */ addi r30, r4, lbl_00014D70@l
/* 0000E608 2C00003C */ cmpwi r0, 0x3c
/* 0000E60C 40820048 */ bne lbl_0000E654
/* 0000E610 380000FF */ li r0, 0xff
/* 0000E614 981D000C */ stb r0, 0xc(r29)
/* 0000E618 38000000 */ li r0, 0
/* 0000E61C 387D008C */ addi r3, r29, 0x8c
/* 0000E620 981D000D */ stb r0, 0xd(r29)
/* 0000E624 38860048 */ addi r4, r6, 0x48
/* 0000E628 981D000E */ stb r0, 0xe(r29)
/* 0000E62C C01E0078 */ lfs f0, 0x78(r30)
/* 0000E630 D01D0040 */ stfs f0, 0x40(r29)
/* 0000E634 C01E0078 */ lfs f0, 0x78(r30)
/* 0000E638 D01D0044 */ stfs f0, 0x44(r29)
/* 0000E63C C01E0004 */ lfs f0, 4(r30)
/* 0000E640 D01D006C */ stfs f0, 0x6c(r29)
/* 0000E644 4BFF1B1D */ bl strcpy
/* 0000E648 38600006 */ li r3, 6
/* 0000E64C 4BFF1B15 */ bl g_play_sound
/* 0000E650 480000E8 */ b lbl_0000E738
lbl_0000E654:
/* 0000E654 2C000078 */ cmpwi r0, 0x78
/* 0000E658 4082004C */ bne lbl_0000E6A4
/* 0000E65C 380000FF */ li r0, 0xff
/* 0000E660 981D000C */ stb r0, 0xc(r29)
/* 0000E664 3860007F */ li r3, 0x7f
/* 0000E668 38000000 */ li r0, 0
/* 0000E66C 987D000D */ stb r3, 0xd(r29)
/* 0000E670 387D008C */ addi r3, r29, 0x8c
/* 0000E674 3886004C */ addi r4, r6, 0x4c
/* 0000E678 981D000E */ stb r0, 0xe(r29)
/* 0000E67C C01E007C */ lfs f0, 0x7c(r30)
/* 0000E680 D01D0040 */ stfs f0, 0x40(r29)
/* 0000E684 C01E007C */ lfs f0, 0x7c(r30)
/* 0000E688 D01D0044 */ stfs f0, 0x44(r29)
/* 0000E68C C01E0004 */ lfs f0, 4(r30)
/* 0000E690 D01D006C */ stfs f0, 0x6c(r29)
/* 0000E694 4BFF1ACD */ bl strcpy
/* 0000E698 38600006 */ li r3, 6
/* 0000E69C 4BFF1AC5 */ bl g_play_sound
/* 0000E6A0 48000098 */ b lbl_0000E738
lbl_0000E6A4:
/* 0000E6A4 2C0000B4 */ cmpwi r0, 0xb4
/* 0000E6A8 40820048 */ bne lbl_0000E6F0
/* 0000E6AC 388000FF */ li r4, 0xff
/* 0000E6B0 989D000C */ stb r4, 0xc(r29)
/* 0000E6B4 38000000 */ li r0, 0
/* 0000E6B8 387D008C */ addi r3, r29, 0x8c
/* 0000E6BC 989D000D */ stb r4, 0xd(r29)
/* 0000E6C0 38860050 */ addi r4, r6, 0x50
/* 0000E6C4 981D000E */ stb r0, 0xe(r29)
/* 0000E6C8 C01E0080 */ lfs f0, 0x80(r30)
/* 0000E6CC D01D0040 */ stfs f0, 0x40(r29)
/* 0000E6D0 C01E0080 */ lfs f0, 0x80(r30)
/* 0000E6D4 D01D0044 */ stfs f0, 0x44(r29)
/* 0000E6D8 C01E0004 */ lfs f0, 4(r30)
/* 0000E6DC D01D006C */ stfs f0, 0x6c(r29)
/* 0000E6E0 4BFF1A81 */ bl strcpy
/* 0000E6E4 38600006 */ li r3, 6
/* 0000E6E8 4BFF1A79 */ bl g_play_sound
/* 0000E6EC 4800004C */ b lbl_0000E738
lbl_0000E6F0:
/* 0000E6F0 2C0000F0 */ cmpwi r0, 0xf0
/* 0000E6F4 40820044 */ bne lbl_0000E738
/* 0000E6F8 38A00000 */ li r5, 0
/* 0000E6FC 98BD000C */ stb r5, 0xc(r29)
/* 0000E700 380000FF */ li r0, 0xff
/* 0000E704 387D008C */ addi r3, r29, 0x8c
/* 0000E708 981D000D */ stb r0, 0xd(r29)
/* 0000E70C 38860054 */ addi r4, r6, 0x54
/* 0000E710 98BD000E */ stb r5, 0xe(r29)
/* 0000E714 C01E0084 */ lfs f0, 0x84(r30)
/* 0000E718 D01D0040 */ stfs f0, 0x40(r29)
/* 0000E71C C01E0084 */ lfs f0, 0x84(r30)
/* 0000E720 D01D0044 */ stfs f0, 0x44(r29)
/* 0000E724 C01E0004 */ lfs f0, 4(r30)
/* 0000E728 D01D006C */ stfs f0, 0x6c(r29)
/* 0000E72C 4BFF1A35 */ bl strcpy
/* 0000E730 38600006 */ li r3, 6
/* 0000E734 4BFF1A2D */ bl g_play_sound
lbl_0000E738:
/* 0000E738 C03D0040 */ lfs f1, 0x40(r29)
/* 0000E73C C81E0088 */ lfd f0, 0x88(r30)
/* 0000E740 FC01002A */ fadd f0, f1, f0
/* 0000E744 FC000018 */ frsp f0, f0
/* 0000E748 D01D0040 */ stfs f0, 0x40(r29)
/* 0000E74C C03D0044 */ lfs f1, 0x44(r29)
/* 0000E750 C81E0088 */ lfd f0, 0x88(r30)
/* 0000E754 FC01002A */ fadd f0, f1, f0
/* 0000E758 FC000018 */ frsp f0, f0
/* 0000E75C D01D0044 */ stfs f0, 0x44(r29)
/* 0000E760 C03D006C */ lfs f1, 0x6c(r29)
/* 0000E764 C81E0068 */ lfd f0, 0x68(r30)
/* 0000E768 FC010028 */ fsub f0, f1, f0
/* 0000E76C FC000018 */ frsp f0, f0
/* 0000E770 D01D006C */ stfs f0, 0x6c(r29)
/* 0000E774 A87D0010 */ lha r3, 0x10(r29)
/* 0000E778 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000E77C B01D0010 */ sth r0, 0x10(r29)
/* 0000E780 A81D0010 */ lha r0, 0x10(r29)
/* 0000E784 2C000000 */ cmpwi r0, 0
/* 0000E788 4181000C */ bgt lbl_0000E794
/* 0000E78C 38000000 */ li r0, 0
/* 0000E790 981F0000 */ stb r0, 0(r31)
lbl_0000E794:
/* 0000E794 80010024 */ lwz r0, 0x24(r1)
/* 0000E798 83E1001C */ lwz r31, 0x1c(r1)
/* 0000E79C 83C10018 */ lwz r30, 0x18(r1)
/* 0000E7A0 7C0803A6 */ mtlr r0
/* 0000E7A4 83A10014 */ lwz r29, 0x14(r1)
/* 0000E7A8 38210020 */ addi r1, r1, 0x20
/* 0000E7AC 4E800020 */ blr 
lbl_0000E7B0:
/* 0000E7B0 7C0802A6 */ mflr r0
/* 0000E7B4 3C800000 */ lis r4, lbl_00014D70@ha
/* 0000E7B8 90010004 */ stw r0, 4(r1)
/* 0000E7BC 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E7C0 93E10014 */ stw r31, 0x14(r1)
/* 0000E7C4 3BE40000 */ addi r31, r4, lbl_00014D70@l
/* 0000E7C8 93C10010 */ stw r30, 0x10(r1)
/* 0000E7CC 3BC30000 */ addi r30, r3, 0
/* 0000E7D0 4BFF1991 */ bl create_sprite
/* 0000E7D4 28030000 */ cmplwi r3, 0
/* 0000E7D8 41820080 */ beq lbl_0000E858
/* 0000E7DC 38000001 */ li r0, 1
/* 0000E7E0 98030000 */ stb r0, 0(r3)
/* 0000E7E4 3C800000 */ lis r4, lbl_0000E870@ha
/* 0000E7E8 39000000 */ li r8, 0
/* 0000E7EC C01F0090 */ lfs f0, 0x90(r31)
/* 0000E7F0 38E0006B */ li r7, 0x6b
/* 0000E7F4 7FC60734 */ extsh r6, r30
/* 0000E7F8 D0030004 */ stfs f0, 4(r3)
/* 0000E7FC 38A0004B */ li r5, 0x4b
/* 0000E800 38040000 */ addi r0, r4, lbl_0000E870@l
/* 0000E804 C01F0090 */ lfs f0, 0x90(r31)
/* 0000E808 D0030008 */ stfs f0, 8(r3)
/* 0000E80C C01F0094 */ lfs f0, 0x94(r31)
/* 0000E810 D003004C */ stfs f0, 0x4c(r3)
/* 0000E814 C01F0074 */ lfs f0, 0x74(r31)
/* 0000E818 D003006C */ stfs f0, 0x6c(r3)
/* 0000E81C 9903000C */ stb r8, 0xc(r3)
/* 0000E820 9903000D */ stb r8, 0xd(r3)
/* 0000E824 9903000E */ stb r8, 0xe(r3)
/* 0000E828 98E3000F */ stb r7, 0xf(r3)
/* 0000E82C 99030003 */ stb r8, 3(r3)
/* 0000E830 B0C30010 */ sth r6, 0x10(r3)
/* 0000E834 B0A3003C */ sth r5, 0x3c(r3)
/* 0000E838 C01F0098 */ lfs f0, 0x98(r31)
/* 0000E83C D0030040 */ stfs f0, 0x40(r3)
/* 0000E840 C01F009C */ lfs f0, 0x9c(r31)
/* 0000E844 D0030044 */ stfs f0, 0x44(r3)
/* 0000E848 80830074 */ lwz r4, 0x74(r3)
/* 0000E84C 60841000 */ ori r4, r4, 0x1000
/* 0000E850 90830074 */ stw r4, 0x74(r3)
/* 0000E854 90030034 */ stw r0, 0x34(r3)
lbl_0000E858:
/* 0000E858 8001001C */ lwz r0, 0x1c(r1)
/* 0000E85C 83E10014 */ lwz r31, 0x14(r1)
/* 0000E860 83C10010 */ lwz r30, 0x10(r1)
/* 0000E864 7C0803A6 */ mtlr r0
/* 0000E868 38210018 */ addi r1, r1, 0x18
/* 0000E86C 4E800020 */ blr 
lbl_0000E870:
/* 0000E870 A8A40010 */ lha r5, 0x10(r4)
/* 0000E874 3805FFFF */ addi r0, r5, -1  ;# fixed addi
/* 0000E878 B0040010 */ sth r0, 0x10(r4)
/* 0000E87C A8040010 */ lha r0, 0x10(r4)
/* 0000E880 2C000000 */ cmpwi r0, 0
/* 0000E884 4D810020 */ bgtlr 
/* 0000E888 38000000 */ li r0, 0
/* 0000E88C 98030000 */ stb r0, 0(r3)
/* 0000E890 4E800020 */ blr 
lbl_0000E894:
/* 0000E894 7C0802A6 */ mflr r0
/* 0000E898 3D000000 */ lis r8, lbl_00014E10@ha
/* 0000E89C 90010004 */ stw r0, 4(r1)
/* 0000E8A0 9421FFB0 */ stwu r1, -0x50(r1)
/* 0000E8A4 DBE10048 */ stfd f31, 0x48(r1)
/* 0000E8A8 DBC10040 */ stfd f30, 0x40(r1)
/* 0000E8AC FFC00890 */ fmr f30, f1
/* 0000E8B0 BF210024 */ stmw r25, 0x24(r1)
/* 0000E8B4 3BE80000 */ addi r31, r8, lbl_00014E10@l
/* 0000E8B8 3B230000 */ addi r25, r3, 0
/* 0000E8BC 3B440000 */ addi r26, r4, 0
/* 0000E8C0 3B650000 */ addi r27, r5, 0
/* 0000E8C4 3B860000 */ addi r28, r6, 0
/* 0000E8C8 3BA70000 */ addi r29, r7, 0
/* 0000E8CC C3FF0000 */ lfs f31, 0(r31)
/* 0000E8D0 48000369 */ bl lbl_0000EC38
/* 0000E8D4 FC20F090 */ fmr f1, f30
/* 0000E8D8 3BC30000 */ addi r30, r3, 0
/* 0000E8DC 387A0000 */ addi r3, r26, 0
/* 0000E8E0 48000359 */ bl lbl_0000EC38
/* 0000E8E4 7C1E1800 */ cmpw r30, r3
/* 0000E8E8 40820008 */ bne lbl_0000E8F0
/* 0000E8EC 48000060 */ b lbl_0000E94C
lbl_0000E8F0:
/* 0000E8F0 2C03000F */ cmpwi r3, 0xf
/* 0000E8F4 4182000C */ beq lbl_0000E900
/* 0000E8F8 2C030005 */ cmpwi r3, 5
/* 0000E8FC 40820014 */ bne lbl_0000E910
lbl_0000E900:
/* 0000E900 281E0002 */ cmplwi r30, 2
/* 0000E904 4181000C */ bgt lbl_0000E910
/* 0000E908 3BC0000A */ li r30, 0xa
/* 0000E90C 48000040 */ b lbl_0000E94C
lbl_0000E910:
/* 0000E910 2C030010 */ cmpwi r3, 0x10
/* 0000E914 4082001C */ bne lbl_0000E930
/* 0000E918 2C1E0002 */ cmpwi r30, 2
/* 0000E91C 4082000C */ bne lbl_0000E928
/* 0000E920 3BC0000B */ li r30, 0xb
/* 0000E924 48000028 */ b lbl_0000E94C
lbl_0000E928:
/* 0000E928 3BC0000D */ li r30, 0xd
/* 0000E92C 48000020 */ b lbl_0000E94C
lbl_0000E930:
/* 0000E930 2C030011 */ cmpwi r3, 0x11
/* 0000E934 40820018 */ bne lbl_0000E94C
/* 0000E938 2C1E0002 */ cmpwi r30, 2
/* 0000E93C 4082000C */ bne lbl_0000E948
/* 0000E940 3BC0000C */ li r30, 0xc
/* 0000E944 48000008 */ b lbl_0000E94C
lbl_0000E948:
/* 0000E948 3BC0000D */ li r30, 0xd
lbl_0000E94C:
/* 0000E94C 281E0011 */ cmplwi r30, 0x11
/* 0000E950 418102A8 */ bgt lbl_0000EBF8
/* 0000E954 3C600000 */ lis r3, lbl_00015480@ha
/* 0000E958 38630000 */ addi r3, r3, lbl_00015480@l
/* 0000E95C 57C0103A */ slwi r0, r30, 2
/* 0000E960 7C03002E */ lwzx r0, r3, r0
/* 0000E964 7C0903A6 */ mtctr r0
/* 0000E968 4E800420 */ bctr 
lbl_0000E96C:
/* 0000E96C FC20F090 */ fmr f1, f30
/* 0000E970 38790000 */ addi r3, r25, 0
/* 0000E974 389B0000 */ addi r4, r27, 0
/* 0000E978 48000439 */ bl lbl_0000EDB0
/* 0000E97C C3FF0004 */ lfs f31, 4(r31)
/* 0000E980 48000294 */ b lbl_0000EC14
lbl_0000E984:
/* 0000E984 C01F0008 */ lfs f0, 8(r31)
/* 0000E988 D01B0000 */ stfs f0, 0(r27)
/* 0000E98C C01F0000 */ lfs f0, 0(r31)
/* 0000E990 D01B0004 */ stfs f0, 4(r27)
/* 0000E994 C01F0008 */ lfs f0, 8(r31)
/* 0000E998 D01B0008 */ stfs f0, 8(r27)
/* 0000E99C C83F0010 */ lfd f1, 0x10(r31)
/* 0000E9A0 C0190004 */ lfs f0, 4(r25)
/* 0000E9A4 FC010028 */ fsub f0, f1, f0
/* 0000E9A8 FC20F02A */ fadd f1, f0, f30
/* 0000E9AC FC200818 */ frsp f1, f1
/* 0000E9B0 48000264 */ b lbl_0000EC14
lbl_0000E9B4:
/* 0000E9B4 C0390000 */ lfs f1, 0(r25)
/* 0000E9B8 7F63DB78 */ mr r3, r27
/* 0000E9BC C81F0018 */ lfd f0, 0x18(r31)
/* 0000E9C0 FC010028 */ fsub f0, f1, f0
/* 0000E9C4 FC000018 */ frsp f0, f0
/* 0000E9C8 D01B0000 */ stfs f0, 0(r27)
/* 0000E9CC C0390004 */ lfs f1, 4(r25)
/* 0000E9D0 C81F0010 */ lfd f0, 0x10(r31)
/* 0000E9D4 FC010028 */ fsub f0, f1, f0
/* 0000E9D8 FC000018 */ frsp f0, f0
/* 0000E9DC D01B0004 */ stfs f0, 4(r27)
/* 0000E9E0 C01F0008 */ lfs f0, 8(r31)
/* 0000E9E4 D01B0008 */ stfs f0, 8(r27)
/* 0000E9E8 4BFF1779 */ bl mathutil_vec_normalize_len
/* 0000E9EC EC3E0828 */ fsubs f1, f30, f1
/* 0000E9F0 48000224 */ b lbl_0000EC14
lbl_0000E9F4:
/* 0000E9F4 C0390000 */ lfs f1, 0(r25)
/* 0000E9F8 7F63DB78 */ mr r3, r27
/* 0000E9FC C81F0020 */ lfd f0, 0x20(r31)
/* 0000EA00 FC010028 */ fsub f0, f1, f0
/* 0000EA04 FC000018 */ frsp f0, f0
/* 0000EA08 D01B0000 */ stfs f0, 0(r27)
/* 0000EA0C C0390004 */ lfs f1, 4(r25)
/* 0000EA10 C81F0010 */ lfd f0, 0x10(r31)
/* 0000EA14 FC010028 */ fsub f0, f1, f0
/* 0000EA18 FC000018 */ frsp f0, f0
/* 0000EA1C D01B0004 */ stfs f0, 4(r27)
/* 0000EA20 C01F0008 */ lfs f0, 8(r31)
/* 0000EA24 D01B0008 */ stfs f0, 8(r27)
/* 0000EA28 4BFF1739 */ bl mathutil_vec_normalize_len
/* 0000EA2C EC3E0828 */ fsubs f1, f30, f1
/* 0000EA30 480001E4 */ b lbl_0000EC14
lbl_0000EA34:
/* 0000EA34 C01F0008 */ lfs f0, 8(r31)
/* 0000EA38 7F63DB78 */ mr r3, r27
/* 0000EA3C D01B0000 */ stfs f0, 0(r27)
/* 0000EA40 C0390004 */ lfs f1, 4(r25)
/* 0000EA44 C81F0010 */ lfd f0, 0x10(r31)
/* 0000EA48 FC010028 */ fsub f0, f1, f0
/* 0000EA4C FC000018 */ frsp f0, f0
/* 0000EA50 D01B0004 */ stfs f0, 4(r27)
/* 0000EA54 C0390008 */ lfs f1, 8(r25)
/* 0000EA58 C81F0028 */ lfd f0, 0x28(r31)
/* 0000EA5C FC010028 */ fsub f0, f1, f0
/* 0000EA60 FC000018 */ frsp f0, f0
/* 0000EA64 D01B0008 */ stfs f0, 8(r27)
/* 0000EA68 4BFF16F9 */ bl mathutil_vec_normalize_len
/* 0000EA6C EC3E0828 */ fsubs f1, f30, f1
/* 0000EA70 480001A4 */ b lbl_0000EC14
lbl_0000EA74:
/* 0000EA74 C01F0008 */ lfs f0, 8(r31)
/* 0000EA78 D01B0000 */ stfs f0, 0(r27)
/* 0000EA7C C01F0030 */ lfs f0, 0x30(r31)
/* 0000EA80 D01B0004 */ stfs f0, 4(r27)
/* 0000EA84 C01F0008 */ lfs f0, 8(r31)
/* 0000EA88 D01B0008 */ stfs f0, 8(r27)
/* 0000EA8C C83F0038 */ lfd f1, 0x38(r31)
/* 0000EA90 C0190004 */ lfs f0, 4(r25)
/* 0000EA94 FC010028 */ fsub f0, f1, f0
/* 0000EA98 FC20F02A */ fadd f1, f0, f30
/* 0000EA9C FC200818 */ frsp f1, f1
/* 0000EAA0 48000174 */ b lbl_0000EC14
lbl_0000EAA4:
/* 0000EAA4 C01F0008 */ lfs f0, 8(r31)
/* 0000EAA8 D01B0000 */ stfs f0, 0(r27)
/* 0000EAAC C01F0008 */ lfs f0, 8(r31)
/* 0000EAB0 D01B0004 */ stfs f0, 4(r27)
/* 0000EAB4 C01F0004 */ lfs f0, 4(r31)
/* 0000EAB8 D01B0008 */ stfs f0, 8(r27)
/* 0000EABC C83F0040 */ lfd f1, 0x40(r31)
/* 0000EAC0 C0190008 */ lfs f0, 8(r25)
/* 0000EAC4 C3FF0048 */ lfs f31, 0x48(r31)
/* 0000EAC8 FC010028 */ fsub f0, f1, f0
/* 0000EACC FC20F02A */ fadd f1, f0, f30
/* 0000EAD0 FC200818 */ frsp f1, f1
/* 0000EAD4 48000140 */ b lbl_0000EC14
lbl_0000EAD8:
/* 0000EAD8 C01F0000 */ lfs f0, 0(r31)
/* 0000EADC D01B0000 */ stfs f0, 0(r27)
/* 0000EAE0 C01F0008 */ lfs f0, 8(r31)
/* 0000EAE4 D01B0004 */ stfs f0, 4(r27)
/* 0000EAE8 C01F0008 */ lfs f0, 8(r31)
/* 0000EAEC D01B0008 */ stfs f0, 8(r27)
/* 0000EAF0 C83F0050 */ lfd f1, 0x50(r31)
/* 0000EAF4 C0190000 */ lfs f0, 0(r25)
/* 0000EAF8 FC010028 */ fsub f0, f1, f0
/* 0000EAFC FC20F02A */ fadd f1, f0, f30
/* 0000EB00 FC200818 */ frsp f1, f1
/* 0000EB04 48000110 */ b lbl_0000EC14
lbl_0000EB08:
/* 0000EB08 C01F0030 */ lfs f0, 0x30(r31)
/* 0000EB0C D01B0000 */ stfs f0, 0(r27)
/* 0000EB10 C01F0008 */ lfs f0, 8(r31)
/* 0000EB14 D01B0004 */ stfs f0, 4(r27)
/* 0000EB18 C01F0008 */ lfs f0, 8(r31)
/* 0000EB1C D01B0008 */ stfs f0, 8(r27)
/* 0000EB20 C83F0050 */ lfd f1, 0x50(r31)
/* 0000EB24 C0190000 */ lfs f0, 0(r25)
/* 0000EB28 FC01002A */ fadd f0, f1, f0
/* 0000EB2C FC20F02A */ fadd f1, f0, f30
/* 0000EB30 FC200818 */ frsp f1, f1
/* 0000EB34 480000E0 */ b lbl_0000EC14
lbl_0000EB38:
/* 0000EB38 C01F0008 */ lfs f0, 8(r31)
/* 0000EB3C D01B0000 */ stfs f0, 0(r27)
/* 0000EB40 C01F0008 */ lfs f0, 8(r31)
/* 0000EB44 D01B0004 */ stfs f0, 4(r27)
/* 0000EB48 C01F0030 */ lfs f0, 0x30(r31)
/* 0000EB4C D01B0008 */ stfs f0, 8(r27)
/* 0000EB50 C83F0058 */ lfd f1, 0x58(r31)
/* 0000EB54 C0190008 */ lfs f0, 8(r25)
/* 0000EB58 FC01002A */ fadd f0, f1, f0
/* 0000EB5C FC20F02A */ fadd f1, f0, f30
/* 0000EB60 FC200818 */ frsp f1, f1
/* 0000EB64 480000B0 */ b lbl_0000EC14
lbl_0000EB68:
/* 0000EB68 C01F0030 */ lfs f0, 0x30(r31)
/* 0000EB6C D01B0000 */ stfs f0, 0(r27)
/* 0000EB70 C01F0008 */ lfs f0, 8(r31)
/* 0000EB74 D01B0004 */ stfs f0, 4(r27)
/* 0000EB78 C01F0008 */ lfs f0, 8(r31)
/* 0000EB7C D01B0008 */ stfs f0, 8(r27)
/* 0000EB80 C83F0020 */ lfd f1, 0x20(r31)
/* 0000EB84 C0190000 */ lfs f0, 0(r25)
/* 0000EB88 FC01002A */ fadd f0, f1, f0
/* 0000EB8C FC20F02A */ fadd f1, f0, f30
/* 0000EB90 FC200818 */ frsp f1, f1
/* 0000EB94 48000080 */ b lbl_0000EC14
lbl_0000EB98:
/* 0000EB98 C01F0000 */ lfs f0, 0(r31)
/* 0000EB9C D01B0000 */ stfs f0, 0(r27)
/* 0000EBA0 C01F0008 */ lfs f0, 8(r31)
/* 0000EBA4 D01B0004 */ stfs f0, 4(r27)
/* 0000EBA8 C01F0008 */ lfs f0, 8(r31)
/* 0000EBAC D01B0008 */ stfs f0, 8(r27)
/* 0000EBB0 C83F0020 */ lfd f1, 0x20(r31)
/* 0000EBB4 C0190000 */ lfs f0, 0(r25)
/* 0000EBB8 FC010028 */ fsub f0, f1, f0
/* 0000EBBC FC20F02A */ fadd f1, f0, f30
/* 0000EBC0 FC200818 */ frsp f1, f1
/* 0000EBC4 48000050 */ b lbl_0000EC14
lbl_0000EBC8:
/* 0000EBC8 C01F0008 */ lfs f0, 8(r31)
/* 0000EBCC D01B0000 */ stfs f0, 0(r27)
/* 0000EBD0 C01F0008 */ lfs f0, 8(r31)
/* 0000EBD4 D01B0004 */ stfs f0, 4(r27)
/* 0000EBD8 C01F0000 */ lfs f0, 0(r31)
/* 0000EBDC D01B0008 */ stfs f0, 8(r27)
/* 0000EBE0 C83F0060 */ lfd f1, 0x60(r31)
/* 0000EBE4 C0190008 */ lfs f0, 8(r25)
/* 0000EBE8 FC010028 */ fsub f0, f1, f0
/* 0000EBEC FC20F02A */ fadd f1, f0, f30
/* 0000EBF0 FC200818 */ frsp f1, f1
/* 0000EBF4 48000020 */ b lbl_0000EC14
lbl_0000EBF8:
/* 0000EBF8 C01F0008 */ lfs f0, 8(r31)
/* 0000EBFC D01B0000 */ stfs f0, 0(r27)
/* 0000EC00 C01F0000 */ lfs f0, 0(r31)
/* 0000EC04 D01B0004 */ stfs f0, 4(r27)
/* 0000EC08 C01F0008 */ lfs f0, 8(r31)
/* 0000EC0C D01B0008 */ stfs f0, 8(r27)
/* 0000EC10 C03F0068 */ lfs f1, 0x68(r31)
lbl_0000EC14:
/* 0000EC14 93DD0000 */ stw r30, 0(r29)
/* 0000EC18 D3FC0000 */ stfs f31, 0(r28)
/* 0000EC1C BB210024 */ lmw r25, 0x24(r1)
/* 0000EC20 80010054 */ lwz r0, 0x54(r1)
/* 0000EC24 CBE10048 */ lfd f31, 0x48(r1)
/* 0000EC28 CBC10040 */ lfd f30, 0x40(r1)
/* 0000EC2C 7C0803A6 */ mtlr r0
/* 0000EC30 38210050 */ addi r1, r1, 0x50
/* 0000EC34 4E800020 */ blr 
lbl_0000EC38:
/* 0000EC38 3C800000 */ lis r4, lbl_00014E10@ha
/* 0000EC3C C0830004 */ lfs f4, 4(r3)
/* 0000EC40 38840000 */ addi r4, r4, lbl_00014E10@l
/* 0000EC44 C8040070 */ lfd f0, 0x70(r4)
/* 0000EC48 FC040040 */ fcmpo cr0, f4, f0
/* 0000EC4C 4080000C */ bge lbl_0000EC58
/* 0000EC50 3860000E */ li r3, 0xe
/* 0000EC54 4E800020 */ blr 
lbl_0000EC58:
/* 0000EC58 C0630008 */ lfs f3, 8(r3)
/* 0000EC5C C8040078 */ lfd f0, 0x78(r4)
/* 0000EC60 FC030040 */ fcmpo cr0, f3, f0
/* 0000EC64 4081000C */ ble lbl_0000EC70
/* 0000EC68 3860000E */ li r3, 0xe
/* 0000EC6C 4E800020 */ blr 
lbl_0000EC70:
/* 0000EC70 C8040060 */ lfd f0, 0x60(r4)
/* 0000EC74 FC030040 */ fcmpo cr0, f3, f0
/* 0000EC78 40810080 */ ble lbl_0000ECF8
/* 0000EC7C C0630000 */ lfs f3, 0(r3)
/* 0000EC80 C8040018 */ lfd f0, 0x18(r4)
/* 0000EC84 FC030040 */ fcmpo cr0, f3, f0
/* 0000EC88 40800034 */ bge lbl_0000ECBC
/* 0000EC8C C8040010 */ lfd f0, 0x10(r4)
/* 0000EC90 FC040040 */ fcmpo cr0, f4, f0
/* 0000EC94 40810020 */ ble lbl_0000ECB4
/* 0000EC98 C8040020 */ lfd f0, 0x20(r4)
/* 0000EC9C FC00082A */ fadd f0, f0, f1
/* 0000ECA0 FC000050 */ fneg f0, f0
/* 0000ECA4 FC030040 */ fcmpo cr0, f3, f0
/* 0000ECA8 4081000C */ ble lbl_0000ECB4
/* 0000ECAC 38600003 */ li r3, 3
/* 0000ECB0 4E800020 */ blr 
lbl_0000ECB4:
/* 0000ECB4 38600010 */ li r3, 0x10
/* 0000ECB8 4E800020 */ blr 
lbl_0000ECBC:
/* 0000ECBC C8440020 */ lfd f2, 0x20(r4)
/* 0000ECC0 FC031040 */ fcmpo cr0, f3, f2
/* 0000ECC4 4081002C */ ble lbl_0000ECF0
/* 0000ECC8 C8040010 */ lfd f0, 0x10(r4)
/* 0000ECCC FC040040 */ fcmpo cr0, f4, f0
/* 0000ECD0 40810018 */ ble lbl_0000ECE8
/* 0000ECD4 FC02082A */ fadd f0, f2, f1
/* 0000ECD8 FC030040 */ fcmpo cr0, f3, f0
/* 0000ECDC 4080000C */ bge lbl_0000ECE8
/* 0000ECE0 38600004 */ li r3, 4
/* 0000ECE4 4E800020 */ blr 
lbl_0000ECE8:
/* 0000ECE8 38600011 */ li r3, 0x11
/* 0000ECEC 4E800020 */ blr 
lbl_0000ECF0:
/* 0000ECF0 38600002 */ li r3, 2
/* 0000ECF4 4E800020 */ blr 
lbl_0000ECF8:
/* 0000ECF8 EC440828 */ fsubs f2, f4, f1
/* 0000ECFC C8040080 */ lfd f0, 0x80(r4)
/* 0000ED00 FC020040 */ fcmpo cr0, f2, f0
/* 0000ED04 4081000C */ ble lbl_0000ED10
/* 0000ED08 38600006 */ li r3, 6
/* 0000ED0C 4E800020 */ blr 
lbl_0000ED10:
/* 0000ED10 C8040040 */ lfd f0, 0x40(r4)
/* 0000ED14 FC030040 */ fcmpo cr0, f3, f0
/* 0000ED18 4080000C */ bge lbl_0000ED24
/* 0000ED1C 38600007 */ li r3, 7
/* 0000ED20 4E800020 */ blr 
lbl_0000ED24:
/* 0000ED24 C0830000 */ lfs f4, 0(r3)
/* 0000ED28 C8040050 */ lfd f0, 0x50(r4)
/* 0000ED2C EC440828 */ fsubs f2, f4, f1
/* 0000ED30 FC020040 */ fcmpo cr0, f2, f0
/* 0000ED34 4080000C */ bge lbl_0000ED40
/* 0000ED38 38600008 */ li r3, 8
/* 0000ED3C 4E800020 */ blr 
lbl_0000ED40:
/* 0000ED40 EC44082A */ fadds f2, f4, f1
/* 0000ED44 C8040088 */ lfd f0, 0x88(r4)
/* 0000ED48 FC020040 */ fcmpo cr0, f2, f0
/* 0000ED4C 4081000C */ ble lbl_0000ED58
/* 0000ED50 38600009 */ li r3, 9
/* 0000ED54 4E800020 */ blr 
lbl_0000ED58:
/* 0000ED58 EC230828 */ fsubs f1, f3, f1
/* 0000ED5C C8040028 */ lfd f0, 0x28(r4)
/* 0000ED60 FC010040 */ fcmpo cr0, f1, f0
/* 0000ED64 4080000C */ bge lbl_0000ED70
/* 0000ED68 3860000F */ li r3, 0xf
/* 0000ED6C 4E800020 */ blr 
lbl_0000ED70:
/* 0000ED70 FC030040 */ fcmpo cr0, f3, f0
/* 0000ED74 4080000C */ bge lbl_0000ED80
/* 0000ED78 38600005 */ li r3, 5
/* 0000ED7C 4E800020 */ blr 
lbl_0000ED80:
/* 0000ED80 C8040018 */ lfd f0, 0x18(r4)
/* 0000ED84 FC040040 */ fcmpo cr0, f4, f0
/* 0000ED88 4080000C */ bge lbl_0000ED94
/* 0000ED8C 38600000 */ li r3, 0
/* 0000ED90 4E800020 */ blr 
lbl_0000ED94:
/* 0000ED94 C8040020 */ lfd f0, 0x20(r4)
/* 0000ED98 FC040040 */ fcmpo cr0, f4, f0
/* 0000ED9C 4081000C */ ble lbl_0000EDA8
/* 0000EDA0 38600001 */ li r3, 1
/* 0000EDA4 4E800020 */ blr 
lbl_0000EDA8:
/* 0000EDA8 38600002 */ li r3, 2
/* 0000EDAC 4E800020 */ blr 
lbl_0000EDB0:
/* 0000EDB0 7C0802A6 */ mflr r0
/* 0000EDB4 3CA00000 */ lis r5, lbl_00014E10@ha
/* 0000EDB8 90010004 */ stw r0, 4(r1)
/* 0000EDBC 9421FF80 */ stwu r1, -0x80(r1)
/* 0000EDC0 DBE10078 */ stfd f31, 0x78(r1)
/* 0000EDC4 DBC10070 */ stfd f30, 0x70(r1)
/* 0000EDC8 DBA10068 */ stfd f29, 0x68(r1)
/* 0000EDCC DB810060 */ stfd f28, 0x60(r1)
/* 0000EDD0 DB610058 */ stfd f27, 0x58(r1)
/* 0000EDD4 FF600890 */ fmr f27, f1
/* 0000EDD8 93E10054 */ stw r31, 0x54(r1)
/* 0000EDDC 3BE50000 */ addi r31, r5, lbl_00014E10@l
/* 0000EDE0 93C10050 */ stw r30, 0x50(r1)
/* 0000EDE4 7C9E2378 */ mr r30, r4
/* 0000EDE8 C0830004 */ lfs f4, 4(r3)
/* 0000EDEC C81F0090 */ lfd f0, 0x90(r31)
/* 0000EDF0 C05F0008 */ lfs f2, 8(r31)
/* 0000EDF4 FC202028 */ fsub f1, f0, f4
/* 0000EDF8 EC1B06F2 */ fmuls f0, f27, f27
/* 0000EDFC FC21D82A */ fadd f1, f1, f27
/* 0000EE00 FC200818 */ frsp f1, f1
/* 0000EE04 FC011040 */ fcmpo cr0, f1, f2
/* 0000EE08 4080001C */ bge lbl_0000EE24
/* 0000EE0C D05E0000 */ stfs f2, 0(r30)
/* 0000EE10 C01F0000 */ lfs f0, 0(r31)
/* 0000EE14 D01E0004 */ stfs f0, 4(r30)
/* 0000EE18 C01F0008 */ lfs f0, 8(r31)
/* 0000EE1C D01E0008 */ stfs f0, 8(r30)
/* 0000EE20 480001C8 */ b lbl_0000EFE8
lbl_0000EE24:
/* 0000EE24 C1030000 */ lfs f8, 0(r3)
/* 0000EE28 FC081040 */ fcmpo cr0, f8, f2
/* 0000EE2C 40800014 */ bge lbl_0000EE40
/* 0000EE30 C03F0098 */ lfs f1, 0x98(r31)
/* 0000EE34 C0BF009C */ lfs f5, 0x9c(r31)
/* 0000EE38 C15F00A0 */ lfs f10, 0xa0(r31)
/* 0000EE3C 48000010 */ b lbl_0000EE4C
lbl_0000EE40:
/* 0000EE40 C03F00A4 */ lfs f1, 0xa4(r31)
/* 0000EE44 C0BF00A8 */ lfs f5, 0xa8(r31)
/* 0000EE48 C15F00AC */ lfs f10, 0xac(r31)
lbl_0000EE4C:
/* 0000EE4C C87F00B8 */ lfd f3, 0xb8(r31)
/* 0000EE50 EFE80828 */ fsubs f31, f8, f1
/* 0000EE54 C0430008 */ lfs f2, 8(r3)
/* 0000EE58 EFC82828 */ fsubs f30, f8, f5
/* 0000EE5C C03F00E0 */ lfs f1, 0xe0(r31)
/* 0000EE60 FC431028 */ fsub f2, f3, f2
/* 0000EE64 C87F00B0 */ lfd f3, 0xb0(r31)
/* 0000EE68 EFA40828 */ fsubs f29, f4, f1
/* 0000EE6C C8DF00C8 */ lfd f6, 0xc8(r31)
/* 0000EE70 EC3F07F2 */ fmuls f1, f31, f31
/* 0000EE74 FD6300B2 */ fmul f11, f3, f2
/* 0000EE78 C89F00D8 */ lfd f4, 0xd8(r31)
/* 0000EE7C C8FF00C0 */ lfd f7, 0xc0(r31)
/* 0000EE80 EC7D0772 */ fmuls f3, f29, f29
/* 0000EE84 C8BF00D0 */ lfd f5, 0xd0(r31)
/* 0000EE88 FD605818 */ frsp f11, f11
/* 0000EE8C ED21182A */ fadds f9, f1, f3
/* 0000EE90 EC5E07B2 */ fmuls f2, f30, f30
/* 0000EE94 FCC602F2 */ fmul f6, f6, f11
/* 0000EE98 FC2402F2 */ fmul f1, f4, f11
/* 0000EE9C FF87302A */ fadd f28, f7, f6
/* 0000EEA0 FC004840 */ fcmpo cr0, f0, f9
/* 0000EEA4 FC85082A */ fadd f4, f5, f1
/* 0000EEA8 FC204890 */ fmr f1, f9
/* 0000EEAC FF80E018 */ frsp f28, f28
/* 0000EEB0 FC802018 */ frsp f4, f4
/* 0000EEB4 EC42182A */ fadds f2, f2, f3
/* 0000EEB8 40810030 */ ble lbl_0000EEE8
/* 0000EEBC 38610024 */ addi r3, r1, 0x24
/* 0000EEC0 4BFF12A1 */ bl func_8000716C
/* 0000EEC4 EC5F0072 */ fmuls f2, f31, f1
/* 0000EEC8 C0010024 */ lfs f0, 0x24(r1)
/* 0000EECC EC3D0072 */ fmuls f1, f29, f1
/* 0000EED0 EF7B0028 */ fsubs f27, f27, f0
/* 0000EED4 D0410040 */ stfs f2, 0x40(r1)
/* 0000EED8 D0210044 */ stfs f1, 0x44(r1)
/* 0000EEDC C01F0008 */ lfs f0, 8(r31)
/* 0000EEE0 D0010048 */ stfs f0, 0x48(r1)
/* 0000EEE4 480000B8 */ b lbl_0000EF9C
lbl_0000EEE8:
/* 0000EEE8 FC001040 */ fcmpo cr0, f0, f2
/* 0000EEEC 40810034 */ ble lbl_0000EF20
/* 0000EEF0 FC201090 */ fmr f1, f2
/* 0000EEF4 38610020 */ addi r3, r1, 0x20
/* 0000EEF8 4BFF1269 */ bl func_8000716C
/* 0000EEFC EC5E0072 */ fmuls f2, f30, f1
/* 0000EF00 C0010020 */ lfs f0, 0x20(r1)
/* 0000EF04 EC3D0072 */ fmuls f1, f29, f1
/* 0000EF08 EF7B0028 */ fsubs f27, f27, f0
/* 0000EF0C D0410040 */ stfs f2, 0x40(r1)
/* 0000EF10 D0210044 */ stfs f1, 0x44(r1)
/* 0000EF14 C01F0008 */ lfs f0, 8(r31)
/* 0000EF18 D0010048 */ stfs f0, 0x48(r1)
/* 0000EF1C 48000080 */ b lbl_0000EF9C
lbl_0000EF20:
/* 0000EF20 EC0A4028 */ fsubs f0, f10, f8
/* 0000EF24 C83F00E8 */ lfd f1, 0xe8(r31)
/* 0000EF28 FC010032 */ fmul f0, f1, f0
/* 0000EF2C FC000018 */ frsp f0, f0
/* 0000EF30 D0010040 */ stfs f0, 0x40(r1)
/* 0000EF34 C0030004 */ lfs f0, 4(r3)
/* 0000EF38 C83F00E8 */ lfd f1, 0xe8(r31)
/* 0000EF3C EC040028 */ fsubs f0, f4, f0
/* 0000EF40 FC010032 */ fmul f0, f1, f0
/* 0000EF44 FC000018 */ frsp f0, f0
/* 0000EF48 D0010044 */ stfs f0, 0x44(r1)
/* 0000EF4C C01F0008 */ lfs f0, 8(r31)
/* 0000EF50 D0010048 */ stfs f0, 0x48(r1)
/* 0000EF54 C83F00F0 */ lfd f1, 0xf0(r31)
/* 0000EF58 C0010040 */ lfs f0, 0x40(r1)
/* 0000EF5C FC010000 */ fcmpu cr0, f1, f0
/* 0000EF60 40820020 */ bne lbl_0000EF80
/* 0000EF64 C0010044 */ lfs f0, 0x44(r1)
/* 0000EF68 FC010000 */ fcmpu cr0, f1, f0
/* 0000EF6C 40820014 */ bne lbl_0000EF80
/* 0000EF70 C01F0000 */ lfs f0, 0(r31)
/* 0000EF74 D0010044 */ stfs f0, 0x44(r1)
/* 0000EF78 C01F0008 */ lfs f0, 8(r31)
/* 0000EF7C 48000018 */ b lbl_0000EF94
lbl_0000EF80:
/* 0000EF80 38610040 */ addi r3, r1, 0x40
/* 0000EF84 4BFF11DD */ bl mathutil_vec_normalize_len
/* 0000EF88 C81F00F8 */ lfd f0, 0xf8(r31)
/* 0000EF8C FC000072 */ fmul f0, f0, f1
/* 0000EF90 FC000018 */ frsp f0, f0
lbl_0000EF94:
/* 0000EF94 EC00E028 */ fsubs f0, f0, f28
/* 0000EF98 EF7B002A */ fadds f27, f27, f0
lbl_0000EF9C:
/* 0000EF9C C0210044 */ lfs f1, 0x44(r1)
/* 0000EFA0 38610040 */ addi r3, r1, 0x40
/* 0000EFA4 C81F0100 */ lfd f0, 0x100(r31)
/* 0000EFA8 FC01002A */ fadd f0, f1, f0
/* 0000EFAC FC000018 */ frsp f0, f0
/* 0000EFB0 D0010044 */ stfs f0, 0x44(r1)
/* 0000EFB4 C0210048 */ lfs f1, 0x48(r1)
/* 0000EFB8 C81F0108 */ lfd f0, 0x108(r31)
/* 0000EFBC FC010028 */ fsub f0, f1, f0
/* 0000EFC0 FC000018 */ frsp f0, f0
/* 0000EFC4 D0010048 */ stfs f0, 0x48(r1)
/* 0000EFC8 4BFF1199 */ bl mathutil_vec_normalize_len
/* 0000EFCC 80610040 */ lwz r3, 0x40(r1)
/* 0000EFD0 FC20D890 */ fmr f1, f27
/* 0000EFD4 80010044 */ lwz r0, 0x44(r1)
/* 0000EFD8 907E0000 */ stw r3, 0(r30)
/* 0000EFDC 901E0004 */ stw r0, 4(r30)
/* 0000EFE0 80010048 */ lwz r0, 0x48(r1)
/* 0000EFE4 901E0008 */ stw r0, 8(r30)
lbl_0000EFE8:
/* 0000EFE8 80010084 */ lwz r0, 0x84(r1)
/* 0000EFEC CBE10078 */ lfd f31, 0x78(r1)
/* 0000EFF0 CBC10070 */ lfd f30, 0x70(r1)
/* 0000EFF4 7C0803A6 */ mtlr r0
/* 0000EFF8 CBA10068 */ lfd f29, 0x68(r1)
/* 0000EFFC CB810060 */ lfd f28, 0x60(r1)
/* 0000F000 CB610058 */ lfd f27, 0x58(r1)
/* 0000F004 83E10054 */ lwz r31, 0x54(r1)
/* 0000F008 83C10050 */ lwz r30, 0x50(r1)
/* 0000F00C 38210080 */ addi r1, r1, 0x80
/* 0000F010 4E800020 */ blr 

# 2
.section .ctors
    # 0xF014
#    .4byte 0x00000000

# 3
.section .dtors
    # 0xF018
#    .4byte 0x00000000

# 4
.section .rodata
.if 0
lbl_0000F020:
    # 0xF020
    .4byte 0x0000004B
.endif
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3E99999A
    .4byte 0x42A00000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000601
    .4byte 0x42980000
    .4byte 0x43C70000
    .4byte 0x3E051EB8
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000605
    .4byte 0x42E80000
    .4byte 0x43CD8000
    .4byte 0x3DE5FD8B
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000604
    .4byte 0x43520000
    .4byte 0x43D08000
    .4byte 0x3DCF41F2
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000609
    .4byte 0x435D0000
    .4byte 0x43D38000
    .4byte 0x3DCCCCCD
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
    .4byte 0x0000060D
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3E051EB8
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000B
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060D
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3E051EB8
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000009
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060B
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3E0F5C29
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00100009
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060B
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3E0F5C29
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0010000B
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060B
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3E0F5C29
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0018000B
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060B
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3E0F5C29
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00180009
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060B
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3E0F5C29
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00100009
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060B
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3E0F5C29
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0010000B
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000616
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3DE147AE
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
    .4byte 0x00000615
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3DE147AE
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
    .4byte 0x00000617
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3DE147AE
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
    .4byte 0x00000600
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3DE147AE
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
    .4byte 0x00000618
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3DCCCCCD
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
    .4byte 0x0000061B
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3DCCCCCD
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
    .4byte 0x00000619
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3DCCCCCD
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
    .4byte 0x0000061A
    .4byte 0x428E0000
    .4byte 0x43D20000
    .4byte 0x3DCCCCCD
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
    .4byte 0x00000614
    .4byte 0x42700000
    .4byte 0x43C30000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0xFFFFCE39
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000614
    .4byte 0x42340000
    .4byte 0x43C90000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0xFFFFE71D
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000614
    .4byte 0x421C0000
    .4byte 0x43D20000
    .4byte 0x3DCCCCCD
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
    .4byte 0x00000614
    .4byte 0x42340000
    .4byte 0x43DB0000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x000018E3
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000614
    .4byte 0x42700000
    .4byte 0x43E10000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x000031C7
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000614
    .4byte 0x42A40000
    .4byte 0x43C30000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x000031C7
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000614
    .4byte 0x42C20000
    .4byte 0x43C90000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x000018E3
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000614
    .4byte 0x42CE0000
    .4byte 0x43D20000
    .4byte 0x3DCCCCCD
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
    .4byte 0x00000614
    .4byte 0x42C20000
    .4byte 0x43DB0000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0xFFFFE71D
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000614
    .4byte 0x42A40000
    .4byte 0x43E10000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0xFFFFCE39
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000A
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000602
    .4byte 0x43FC8000
    .4byte 0x43B90000
    .4byte 0x3DE5FD8B
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000603
    .4byte 0x440C0000
    .4byte 0x43DA0000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x44094000
    .4byte 0x43D10000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3ECCCCCD
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x440EC000
    .4byte 0x43D10000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x44064000
    .4byte 0x43C80000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x3F4CCCCD
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x440C0000
    .4byte 0x43C80000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x4411C000
    .4byte 0x43C80000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3E4CCCCD
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
    .4byte 0x00000603
    .4byte 0x44038000
    .4byte 0x43BF0000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3ECCCCCD
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
    .4byte 0x00000603
    .4byte 0x44094000
    .4byte 0x43BF0000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3ECCCCCD
    .4byte 0x3F000000
    .4byte 0x3F19999A
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
    .4byte 0x00000603
    .4byte 0x440EC000
    .4byte 0x43BF0000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3F19999A
    .4byte 0x3F000000
    .4byte 0x3F4CCCCD
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
    .4byte 0x00000603
    .4byte 0x44148000
    .4byte 0x43BF0000
    .4byte 0x3DCCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3F4CCCCD
    .4byte 0x3F000000
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
    .4byte 0x0000060E
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060E
    .4byte 0x42D00000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x0000C000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000D
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060E
    .4byte 0x00000000
    .4byte 0x42B00000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00004000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000007
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060E
    .4byte 0x42D00000
    .4byte 0x42B00000
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00008000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000F
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000610
    .4byte 0x41000000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x41400000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000610
    .4byte 0x41000000
    .4byte 0x42B00000
    .4byte 0x3DCCCCCD
    .4byte 0x41400000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00008000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000F
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000610
    .4byte 0x00000000
    .4byte 0x41000000
    .4byte 0x3DCCCCCD
    .4byte 0x41200000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00004000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000007
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000610
    .4byte 0x42D00000
    .4byte 0x41000000
    .4byte 0x3DCCCCCD
    .4byte 0x41200000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x0000C000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x0000000D
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000602
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3F4CCCCD
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000603
    .4byte 0x42300000
    .4byte 0x42533333
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x420CCCCD
    .4byte 0x4219999A
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3ECCCCCD
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x42533333
    .4byte 0x4219999A
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x41CCCCCD
    .4byte 0x41C00000
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x3F4CCCCD
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x42300000
    .4byte 0x41C00000
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F000000
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
    .4byte 0x00000603
    .4byte 0x4279999A
    .4byte 0x41C00000
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3E4CCCCD
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
    .4byte 0x00000603
    .4byte 0x41866666
    .4byte 0x4119999A
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3ECCCCCD
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
    .4byte 0x00000603
    .4byte 0x420CCCCD
    .4byte 0x4119999A
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x3ECCCCCD
    .4byte 0x3F000000
    .4byte 0x3F19999A
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
    .4byte 0x00000603
    .4byte 0x42533333
    .4byte 0x4119999A
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x3F19999A
    .4byte 0x3F000000
    .4byte 0x3F4CCCCD
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
    .4byte 0x00000603
    .4byte 0x428E6666
    .4byte 0x4119999A
    .4byte 0x3DE147AE
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x3F4CCCCD
    .4byte 0x3F000000
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
    .4byte 0x0000060F
    .4byte 0x40000000
    .4byte 0x40000000
    .4byte 0x3DF5C28F
    .4byte 0x3FA00000
    .4byte 0x3F600000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFA0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3E051EB8
    .4byte 0x3EC00000
    .4byte 0x3EB80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3EC00000
    .4byte 0x3EB80000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x00000000
    .4byte 0x3E051EB8
    .4byte 0x3E866666
    .4byte 0x3EB80000
    .4byte 0x3EB66666
    .4byte 0x00000000
    .4byte 0x3F1E6666
    .4byte 0x3EB80000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x00000000
    .4byte 0x3E051EB8
    .4byte 0x3EB66666
    .4byte 0x3EB80000
    .4byte 0x3F1E6666
    .4byte 0x00000000
    .4byte 0x3F79999A
    .4byte 0x3EB80000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x00000000
    .4byte 0x3E051EB8
    .4byte 0x3CCCCCCD
    .4byte 0x3EB80000
    .4byte 0x3F79999A
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3EB80000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x00000000
    .4byte 0x41B80000
    .4byte 0x3E051EB8
    .4byte 0x3EB66666
    .4byte 0x3EF00000
    .4byte 0x00000000
    .4byte 0x3EB80000
    .4byte 0x3EB66666
    .4byte 0x3F540000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060C
    .4byte 0x00000000
    .4byte 0x41B80000
    .4byte 0x3E051EB8
    .4byte 0x3F640000
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F640000
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060C
    .4byte 0x00000000
    .4byte 0x41B80000
    .4byte 0x3E051EB8
    .4byte 0x3F640000
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x3E800000
    .4byte 0x3F640000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060C
    .4byte 0x00000000
    .4byte 0x41B80000
    .4byte 0x3E051EB8
    .4byte 0x3F640000
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F640000
    .4byte 0x3F400000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000060C
    .4byte 0x00000000
    .4byte 0x41B80000
    .4byte 0x3E051EB8
    .4byte 0x3F640000
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x3F400000
    .4byte 0x3F640000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x41B80000
    .4byte 0x3E051EB8
    .4byte 0x3E866666
    .4byte 0x3EF00000
    .4byte 0x3EB66666
    .4byte 0x3EB80000
    .4byte 0x3F1E6666
    .4byte 0x3F540000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x41B80000
    .4byte 0x3E051EB8
    .4byte 0x3EB66666
    .4byte 0x3EF00000
    .4byte 0x3F1E6666
    .4byte 0x3EB80000
    .4byte 0x3F79999A
    .4byte 0x3F540000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x41B80000
    .4byte 0x3E051EB8
    .4byte 0x3CCCCCCD
    .4byte 0x3EF00000
    .4byte 0x3F79999A
    .4byte 0x3EB80000
    .4byte 0x3F800000
    .4byte 0x3F540000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x00000000
    .4byte 0x42540000
    .4byte 0x3E051EB8
    .4byte 0x3EB66666
    .4byte 0x3E300000
    .4byte 0x00000000
    .4byte 0x3F540000
    .4byte 0x3EB66666
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x42540000
    .4byte 0x3E051EB8
    .4byte 0x3E866666
    .4byte 0x3E300000
    .4byte 0x3EB66666
    .4byte 0x3F540000
    .4byte 0x3F1E6666
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x42540000
    .4byte 0x3E051EB8
    .4byte 0x3EB66666
    .4byte 0x3E300000
    .4byte 0x3F1E6666
    .4byte 0x3F540000
    .4byte 0x3F79999A
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000608
    .4byte 0x42640000
    .4byte 0x42540000
    .4byte 0x3E051EB8
    .4byte 0x3CCCCCCD
    .4byte 0x3E300000
    .4byte 0x3F79999A
    .4byte 0x3F540000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000607
    .4byte 0x40000000
    .4byte 0x40000000
    .4byte 0x3DE147AE
    .4byte 0x3E44EC4F
    .4byte 0x3E266666
    .4byte 0x3F44EC4F
    .4byte 0x3F000000
    .4byte 0x3F762762
    .4byte 0x3F2CCCCD
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFF734A22
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000607
    .4byte 0x41000000
    .4byte 0x40C00000
    .4byte 0x3DCCCCCD
    .4byte 0x3EC4EC4F
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3EC4EC4F
    .4byte 0x3F400000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0x00633A12
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000607
    .4byte 0x41000000
    .4byte 0x40C00000
    .4byte 0x3DCCCCCD
    .4byte 0x3EC4EC4F
    .4byte 0x3E800000
    .4byte 0x3EC4EC4F
    .4byte 0x3F000000
    .4byte 0x3F44EC4F
    .4byte 0x3F400000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0x00633A12
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000607
    .4byte 0x41000000
    .4byte 0x40C00000
    .4byte 0x3DCCCCCD
    .4byte 0x3EC4EC4F
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x3F400000
    .4byte 0x3EC4EC4F
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0x00633A12
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000607
    .4byte 0x41000000
    .4byte 0x40C00000
    .4byte 0x3DCCCCCD
    .4byte 0x3EC4EC4F
    .4byte 0x3E800000
    .4byte 0x3EC4EC4F
    .4byte 0x3F400000
    .4byte 0x3F44EC4F
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0x00633A12
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000611
    .4byte 0x00000000
    .4byte 0x41C00000
    .4byte 0x3DF5C28F
    .4byte 0x42A00000
    .4byte 0x40C00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFF0000FF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000612
    .4byte 0x423C0000
    .4byte 0x42140000
    .4byte 0x3DE147AE
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000613
    .4byte 0x43D60000
    .4byte 0x42380000
    .4byte 0x3DE147AE
    .4byte 0x3F7684BE
    .4byte 0x3EAAAAAB
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F7684BE
    .4byte 0x3EAAAAAB
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000613
    .4byte 0x43D38000
    .4byte 0x42380000
    .4byte 0x3DE147AE
    .4byte 0x3F800000
    .4byte 0x3EAAAAAB
    .4byte 0x00000000
    .4byte 0x3EAAAAAB
    .4byte 0x3F800000
    .4byte 0x3F2AAAAB
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000613
    .4byte 0x44068000
    .4byte 0x42380000
    .4byte 0x3DE147AE
    .4byte 0x3F000000
    .4byte 0x3EAAAAAB
    .4byte 0x00000000
    .4byte 0x3F2AAAAB
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xFFFFFFFF
    .4byte 0x00000005
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x03C00000
    .4byte lbl_00014F30
    .4byte 0x02410000
    .4byte lbl_00014F38
    .4byte 0x02680000
    .4byte lbl_00014F44
    .4byte 0x02E80000
    .4byte lbl_00014F50
    .4byte 0x01860000
    .4byte lbl_00014F5C
    .4byte 0x00280000
    .4byte lbl_00014F68
    .4byte 0x02800000
    .4byte lbl_00014F74
    .4byte 0x02500000
    .4byte lbl_00014F80
    .4byte 0x02400000
    .4byte lbl_00014F88
    .4byte 0x02460000
    .4byte lbl_00014F94
lbl_00010BF0:
    # 0x10BF0
    .4byte 0x03FF0000
    .4byte lbl_00014FA0
    .4byte 0x01340000
    .4byte lbl_00014FAC
    .4byte 0x00420000
    .4byte lbl_00014FB4
    .4byte 0x00820000
    .4byte lbl_00014FC0
    .4byte 0x03000000
    .4byte lbl_00014FD0
    .4byte 0x020B0000
    .4byte lbl_00014FDC
    .4byte 0x02440000
    .4byte lbl_00014FE8
    .4byte 0x02100000
    .4byte lbl_00014FF8
    .4byte 0x01480000
    .4byte lbl_00015004
    .4byte 0x02480000
    .4byte lbl_00015014
lbl_00010C40:
    # 0x10C40
    .4byte 0x00000000
    .4byte 0x3ED3B646
    .4byte 0xC2C7812C
    .4byte 0xBF333333
    .4byte 0x3ED3B646
    .4byte 0xC2C9ECB1
    .4byte 0x3F333333
    .4byte 0x3ED3B646
    .4byte 0xC2C9ECB1
    .4byte 0xBFB33333
    .4byte 0x3ED3B646
    .4byte 0xC2CC5836
    .4byte 0x00000000
    .4byte 0x3ED3B646
    .4byte 0xC2CC5836
    .4byte 0x3FB33333
    .4byte 0x3ED3B646
    .4byte 0xC2CC5836
    .4byte 0xC0066666
    .4byte 0x3ED3B646
    .4byte 0xC2CEC8DA
    .4byte 0xBF333333
    .4byte 0x3ED3B646
    .4byte 0xC2CEC8DA
    .4byte 0x3F333333
    .4byte 0x3ED3B646
    .4byte 0xC2CEC8DA
    .4byte 0x40066666
    .4byte 0x3ED3B646
    .4byte 0xC2CEC8DA
    .4byte 0x00000000
    .4byte 0x3F800000
lbl_00010CC0:
    # 0x10CC0
    .4byte 0xBFEF58D0
    .4byte 0xFAC687D6
lbl_00010CC8:
    # 0x10CC8
    .4byte 0xBFE4E5E0
    .4byte 0xA72F0539
    .4byte 0x43CCCCCD
    .4byte 0x00000000
    .4byte 0x4075C000
    .4byte 0x00000000
    .4byte 0x40A00000
    .4byte 0x00000000
    .4byte 0x40768000
    .4byte 0x00000000
    .4byte 0xC0121FF3
    .4byte 0x40A2BC6A
    .4byte 0xC2C32A4B
    .4byte 0x40121FF3
    .4byte 0x43C80000
    .4byte 0xBDCCCCCD
    .4byte 0x3DA3D70A
    .4byte 0x3C23D70A
    .4byte 0xBDA3D70A
    .4byte 0xBDF5C28F
    .4byte 0x3D23D70A
    .4byte 0x3DCCCCCD
    .4byte 0xC1700000
    .4byte 0x3E99999A
    .4byte 0xC4800000
    .4byte 0x00000000
    .4byte 0xBFE40000
    .4byte 0x00000000
    .4byte 0x3FE40000
    .4byte 0x00000000
    .4byte 0xC1200000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FA99999
    .4byte 0x9999999A
lbl_00010D58:
    # 0x10D58
    .4byte 0x43300000
    .4byte 0x80000000
lbl_00010D60:
    # 0x10D60
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x41800000
    .4byte 0x00000000
    .4byte 0x3FE55555
    .4byte 0x55555555
    .4byte 0x41E00000
    .4byte 0x00000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x3F747AE1
    .4byte 0x47AE147B
    .4byte 0x42900000
    .4byte 0x00000000
    .4byte 0x3FA745D1
    .4byte 0x745D1746
    .4byte 0x40360000
    .4byte 0x00000000
    .4byte 0x406FE000
    .4byte 0x00000000
    .4byte 0x3FE4CCCC
    .4byte 0xCCCCCCCD
    .4byte 0x3FD66666
    .4byte 0x66666666
    .4byte 0x40911111
    .4byte 0x11111111
    .4byte 0x44800000
    .4byte 0x43F00000
    .4byte 0x43500000
    .4byte 0x44000000
    .4byte 0x43880000
    .4byte 0x43940000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x44060000
    .4byte 0x43680000
    .4byte 0x43F80000
    .4byte 0x44040000
    .4byte 0x43A00000
    .4byte 0x43AC0000
    .4byte 0x43A80000
    .4byte 0x43900000
    .4byte 0x43C00000
    .4byte 0x43280000
    .4byte 0x43CC0000
    .4byte 0x43EC0000
    .4byte 0x43D80000
    .4byte 0x3C888889
    .4byte 0x000001EA
    .4byte 0x000001EB
    .4byte 0x000001EC
    .4byte 0x000001ED
    .4byte 0x40C37600
    .4byte 0x00000000
    .4byte 0x3F35D867
    .4byte 0xC3ECE2A5
    .4byte 0x40019999
    .4byte 0x9999999A
    .4byte 0xC0019999
    .4byte 0x9999999A
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x44088889
    .4byte 0x00000000
    .4byte 0x404E0000
    .4byte 0x00000000
    .4byte 0x40232492
    .4byte 0x49249249
    .4byte 0x40E00000
    .4byte 0x00000000
    .4byte 0x40A248DB
    .4byte 0x6DB6DB6E
    .4byte 0x42FE0000
    .4byte 0x00000000
    .4byte 0x405E0000
    .4byte 0x00000000
    .4byte 0x3F3767DC
    .4byte 0xE434A9B1
    .4byte 0xBFF00000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x00000000
    .4byte 0xC02E0000
    .4byte 0x00000000
    .4byte 0x3FCC28F5
    .4byte 0xC28F5C29
    .4byte 0x3FC70A3D
    .4byte 0x70A3D70B
    .4byte 0x40288000
    .4byte 0x00000000
    .4byte 0x40040000
    .4byte 0x00000000
    .4byte 0xC5800000
    .4byte 0xC6000000
lbl_00010EE0:
    # 0x10EE0
    .4byte 0xC0568000
    .4byte 0x00000000
lbl_00010EE8:
    # 0x10EE8
    .4byte 0xC0490000
    .4byte 0x00000000
lbl_00010EF0:
    # 0x10EF0
    .4byte lbl_000151A0
    .4byte lbl_000151A4
    .4byte lbl_000151AC
    .4byte lbl_000151B4
    .4byte lbl_000151BC
    .4byte lbl_000151C8
    .4byte lbl_000151D4
    .4byte lbl_000151E0
    .4byte lbl_000151EC
    .4byte lbl_000151F8
    .4byte lbl_00015204
    .4byte lbl_00015214
    .4byte lbl_00015224
lbl_00010F24:
    # 0x10F24
    .4byte 0x000001CC
    .4byte 0x000001CC
    .4byte 0x000001C6
    .4byte 0x000001CE
    .4byte 0x000001C7
    .4byte 0x000001C7
    .4byte 0x000001C7
    .4byte 0x000001C7
    .4byte 0x000001C7
    .4byte 0x000001C7
    .4byte 0x000001C7
    .4byte 0x000001C7
    .4byte 0x000001D0
    .4byte 0x406A4000
    .4byte 0x00000000
    .4byte 0x4002F5C2
    .4byte 0x8F5C28F6
    .4byte 0x4082C000
    .4byte 0x00000000
    .4byte 0x3FC99999
    .4byte 0x9999999A
    .4byte 0x406E0000
    .4byte 0x00000000
    .4byte 0x40668000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F4F1AA0
    .4byte 0x40A00000
lbl_00010F94:
    # 0x10F94
    .4byte 0xC2480000
    .4byte 0x000A0012
    .4byte 0x00140024
    .4byte 0x00480088
    .4byte 0x00900110
    .4byte 0x01200220
    .4byte 0x001A004A
    .4byte 0x008A0092
    .4byte 0x01120034
    .4byte 0x00940114
    .4byte 0x01240224
    .4byte 0x00C80190
    .4byte 0x0320005A
    .4byte 0x009A011A
    .4byte 0x00CA0192
    .4byte 0x00B40134
    .4byte 0x02340194
    .4byte 0x032400DA
    .4byte 0x015A019A
    .4byte 0x01B402B4
    .4byte 0x033401DA
    .4byte 0x03B40000
    .4byte lbl_0001526C
    .4byte 0x00060000
    .4byte lbl_0001526C
    .4byte 0x00180000
    .4byte lbl_0001526C
    .4byte 0x00300000
    .4byte lbl_0001526C
    .4byte 0x00C00000
    .4byte lbl_0001526C
    .4byte 0x01800000
    .4byte lbl_0001526C
    .4byte 0x03000000
    .4byte lbl_00015284
    .4byte 0x00280000
    .4byte lbl_00015284
    .4byte 0x01400000
    .4byte lbl_00015298
    .4byte 0x02800000
    .4byte lbl_000152AC
    .4byte 0x02400000
    .4byte lbl_000152C0
    .4byte 0x00420000
    .4byte lbl_000152C0
    .4byte 0x02040000
    .4byte lbl_000152C0
    .4byte 0x01020000
    .4byte lbl_000152C0
    .4byte 0x00840000
    .4byte lbl_000152D0
    .4byte 0x00820000
    .4byte lbl_000152D0
    .4byte 0x01040000
    .4byte lbl_000152E8
    .4byte 0x02100000
    .4byte lbl_000152FC
    .4byte 0x00600000
    .4byte lbl_00015308
    .4byte 0x02420000
    .4byte lbl_00015308
    .4byte 0x02440000
    .4byte lbl_00015320
    .4byte 0x02480000
    .4byte lbl_00015334
    .4byte 0x02500000
    .4byte lbl_00015320
    .4byte 0x02600000
    .4byte lbl_00015344
    .4byte 0x02680000
    .4byte lbl_00015358
    .4byte 0x03480000
    .4byte lbl_0001536C
    .4byte 0x02E80000
    .4byte lbl_0001536C
    .4byte 0x03680000
    .4byte 0xC5965000
    .4byte 0x4057C000
    .4byte 0x00000000
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x40C00000
    .4byte 0x00000000
    .4byte 0x40BFFF00
    .4byte 0x00000000
    .4byte 0xC7800000
    .4byte 0x3E19999A
    .4byte 0x3E0F5C29
    .4byte 0x3E051EB8
    .4byte 0x3DF5C28F
    .4byte 0x3D042108
    .4byte 0x02010300
    .4byte 0x42640000
    .4byte 0x40800000
    .4byte 0x41500000
    .4byte 0x42280000
    .4byte 0x41600000
    .4byte 0x41C80000
    .4byte 0x41B80000
    .4byte 0x40000000
    .4byte 0x41880000
    .4byte 0x3FD99999
    .4byte 0x9999999A
    .4byte 0x3FD00000
    .4byte 0x00000000
    .4byte 0x41300000
    .4byte 0x41B00000
    .4byte 0x3FF60000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x41980000
    .4byte 0x421C0000
    .4byte 0x41900000
    .4byte 0x41400000
    .4byte 0x41E80000
    .4byte 0x41F00000
    .4byte 0xBE25ED09
    .4byte 0x3991A2B4
    .4byte 0x00000000
    .4byte 0x3FE51EB8
    .4byte 0x51EB851F
    .4byte 0x3FD51EB8
    .4byte 0x51EB851F
    .4byte 0x406EC000
    .4byte 0x00000000
    .4byte 0x3DE147AE
    .4byte 0x42100000
    .4byte 0x431C0000
    .4byte 0x438A0000
    .4byte 0x43C60000
    .4byte 0x44010000
    .4byte 0x42100000
    .4byte 0x431C0000
    .4byte 0x438A0000
    .4byte 0x43C60000
    .4byte 0x44010000
    .4byte 0x42F00000
    .4byte 0x42F00000
    .4byte 0x42F00000
    .4byte 0x42F00000
    .4byte 0x42F00000
    .4byte 0x43560000
    .4byte 0x43560000
    .4byte 0x43560000
    .4byte 0x43560000
    .4byte 0x43560000
    .4byte 0x00000000
    .4byte 0x3FE99999
    .4byte 0x9999999A
    .4byte 0x437F0000
    .4byte 0x43B10000
    .4byte 0x43B00000
    .4byte 0x43E90000
    .4byte 0x43E80000
    .4byte 0x43120000
    .4byte 0x43CD0000
    .4byte 0x43100000
    .4byte 0x40811111
    .4byte 0x11111111
    .4byte 0x45000000
    .4byte 0x44340000
    .4byte 0x41C00000
    .4byte 0x00000000
    .4byte 0x406B0000
    .4byte 0x00000000
    .4byte 0x3FF80000
    .4byte 0x00000000
    .4byte 0x405FC000
    .4byte 0x00000000
    .4byte 0x402E0000
    .4byte 0x00000000
    .4byte 0x40540000
    .4byte 0x00000000
    .4byte 0x3FEB3333
    .4byte 0x33333333
lbl_00011250:
    # 0x11250
    .4byte 0x403E0000
    .4byte 0x00000000
lbl_00011258:
    # 0x11258
    .4byte 0xC0140000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3DE147AE
    .4byte 0xBF800000
    .4byte 0x0000005A
    .4byte 0x0000005B
    .4byte 0x0000005C
    .4byte 0x0000005D
    .4byte 0x0000005E
    .4byte 0x0000005F
    .4byte 0x00000060
    .4byte 0x00000061
    .4byte 0x3F23A92A
    .4byte 0x30553261
    .4byte 0xBFA99999
    .4byte 0x9999999A
    .4byte 0xBD4CCCCD
    .4byte 0x40800000
    .4byte 0xC2C80000
    .4byte 0x41400000
    .4byte 0x3F800000
    .4byte 0x00000000
lbl_000112C0:
    # 0x112C0
    .4byte 0x3FEFAE14
    .4byte 0x7AE147AE
lbl_000112C8:
    # 0x112C8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0xBF847AE1
    .4byte 0x47AE147B
    .4byte 0xBFF00000
    .4byte 0x00000000
    .4byte 0x3A83126F
    .4byte 0x00000000
    .4byte 0x3FC33333
    .4byte 0x33333333
    .4byte 0x3F9EB851
    .4byte 0xEB851EB8
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0x3FA99999
    .4byte 0x99999998
    .4byte 0xC1700000
    .4byte 0x41200000
    .4byte 0x41C80000
    .4byte 0x00000000
    .4byte 0x3FC10FF9
    .4byte 0x72474539
    .4byte 0x3FBDE00D
    .4byte 0x1B71758E
    .4byte 0x3FD99999
    .4byte 0x9999999A
    .4byte 0x42FE0000
    .4byte 0x00000000
lbl_00011338:
    # 0x11338
    .4byte 0x43300000
    .4byte 0x80000000
lbl_00011340:
    # 0x11340
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x40220000
    .4byte 0x00000000
    .4byte 0xC0568000
    .4byte 0x00000000
    .4byte 0xC2B40000
    .4byte 0x00000000
    .4byte 0xC0080000
    .4byte 0x00000000
    .4byte 0xC0400000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x3D4CCCCD
    .4byte 0x3F451EB8
    .4byte 0x00000000
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0x3F19999A
    .4byte 0xC1300000
    .4byte 0x00000000
    .4byte 0x401C0000
    .4byte 0x00000000
    .4byte 0x3FC00000
    .4byte 0x00000000
    .4byte 0x40100000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0xC00C0000
    .4byte 0x00000000
    .4byte 0xC0600000
    .4byte 0x00000000
    .4byte 0x400C0000
    .4byte 0x00000000
    .4byte 0x40600000
    .4byte 0x00000000
    .4byte 0x403E0000
    .4byte 0x00000000
    .4byte 0x40466666
    .4byte 0xC2D80000
    .4byte 0x3E4CCCCD
    .4byte 0x3E99999A
    .4byte 0xC2CE0000
    .4byte 0xC08CCCCD
    .4byte 0xBE99999A
    .4byte 0xC2B53333
    .4byte 0x3F000000
    .4byte 0x3F333333
    .4byte 0xC2C6999A
    .4byte 0x00000000
    .4byte 0x3FD33333
    .4byte 0x33333333
    .4byte 0x3FF33333
    .4byte 0x33333333
    .4byte 0x434C0000
    .4byte 0x00000000
    .4byte 0xC0000000
    .4byte 0x00000000
    .4byte 0x3FE80000
    .4byte 0x00000000
    .4byte 0x3FC00000
    .4byte 0x00000000
    .4byte 0x3FE66666
    .4byte 0x66666666
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x3FA99999
    .4byte 0x9999999A
    .4byte 0x40480000
    .4byte 0x00000000
    .4byte 0x3F8EB851
    .4byte 0xEB851EB8
    .4byte 0xC0800000
    .4byte 0x00000000
lbl_00011490:
    # 0x11490
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E3030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E3030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E2E
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x20202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x30202E20
    .4byte 0x2E203030
    .4byte 0x30302E20
    .4byte 0x2E202E30
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E3030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30302E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E203030
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30203030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x30302E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x302E202E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x302E202E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x30202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x20302030
    .4byte 0x302E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E2030
    .4byte 0x302E302E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E302E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E203020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30302030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x30303020
    .4byte 0x30202E20
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E203030
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E3030
    .4byte 0x3030202E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E3030
    .4byte 0x202E302E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30203030
    .4byte 0x2E203030
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E3030
    .4byte 0x202E302E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E203020
    .4byte 0x2E203020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E2E
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x20202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x30202E20
    .4byte 0x2E203030
    .4byte 0x30302E20
    .4byte 0x2E202E30
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E3030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30302E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E203030
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30203030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x30302E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x302E202E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x302E202E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x30202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E302E
    .4byte 0x2030202E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30302E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x30303030
    .4byte 0x3030302E
    .4byte 0x20303030
    .4byte 0x30303030
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30203030
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x30302E30
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20302030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E3030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30302E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E203030
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30203030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x30302E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x302E202E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x302E202E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x30202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x202E3030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x3030202E
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x30303030
    .4byte 0x202E2030
    .4byte 0x3030202E
    .4byte 0x3030202E
    .4byte 0x30303030
    .4byte 0x2030302E
    .4byte 0x2030302E
    .4byte 0x30303030
    .4byte 0x202E3030
    .4byte 0x202E3030
    .4byte 0x302E202E
    .4byte 0x30303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30202E30
    .4byte 0x30302E30
    .4byte 0x30202E30
    .4byte 0x30303030
    .4byte 0x30203030
    .4byte 0x30302E30
    .4byte 0x30303030
    .4byte 0x30202E30
    .4byte 0x30203030
    .4byte 0x30202E30
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x30302030
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x302E3030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E203030
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2030202E
    .4byte 0x202E3030
    .4byte 0x3030302E
    .4byte 0x202E3030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x302E202E
    .4byte 0x202E3030
    .4byte 0x3030202E
    .4byte 0x20303030
    .4byte 0x3030202E
    .4byte 0x202E302E
    .4byte 0x30302E20
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x2E303030
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E303030
    .4byte 0x30303020
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x2E203030
    .4byte 0x302E202E
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x3030302E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x30303030
    .4byte 0x302E202E
    .4byte 0x20303030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x2E202E30
    .4byte 0x302E202E
    .4byte 0x302E2030
    .4byte 0x3030202E
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x202E3030
    .4byte 0x302E2030
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x2E303030
    .4byte 0x30303030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30302E20
    .4byte 0x2E203030
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30303030
    .4byte 0x30303020
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x2E202E30
    .4byte 0x302E202E
    .4byte 0x302E202E
    .4byte 0x202E302E
    .4byte 0x202E3030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x2030302E
    .4byte 0x2030302E
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x3030202E
    .4byte 0x2030202E
    .4byte 0x202E2030
    .4byte 0x202E2030
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E30
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E302E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x2030202E
    .4byte 0x202E3030
    .4byte 0x3030202E
    .4byte 0x202E3030
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x3030202E
    .4byte 0x202E3030
    .4byte 0x3030202E
    .4byte 0x202E302E
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303030
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x30302030
    .4byte 0x302E2030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x302E202E
    .4byte 0x202E2030
    .4byte 0x302E2030
    .4byte 0x302E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x2E202E30
    .4byte 0x30302E20
    .4byte 0x2E203030
    .4byte 0x30202E30
    .4byte 0x30202E20
    .4byte 0x30202E20
    .4byte 0x2E203020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E302E20
    .4byte 0x2E202E30
    .4byte 0x2E202E30
    .4byte 0x30202E30
    .4byte 0x30302E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x20303030
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x3030302E
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E303020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E3030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x3030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x30302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203030
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x20303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x30303030
    .4byte 0x3030302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E2030
    .4byte 0x202E302E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x2E302E20
    .4byte 0x2E302E20
    .4byte 0x302E3020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x302E302E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x30203020
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E2030
    .4byte 0x20302030
    .4byte 0x202E2030
    .4byte 0x2030202E
    .4byte 0x202E2030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2030202E
    .4byte 0x302E2030
    .4byte 0x202E302E
    .4byte 0x302E2030
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x302E2030
    .4byte 0x2030202E
    .4byte 0x202E302E
    .4byte 0x2030202E
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x2E302E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x2030202E
    .4byte 0x302E202E
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E302E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x2030202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E30
    .4byte 0x2E202E20
    .4byte 0x30202E30
    .4byte 0x2E302E20
    .4byte 0x30202E20
    .4byte 0x30202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E302E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E302E30
    .4byte 0x2E302E20
    .4byte 0x30202E30
    .4byte 0x2E302E30
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E203020
    .4byte 0x2E302E30
    .4byte 0x2E202E30
    .4byte 0x2E203020
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x302E202E
    .4byte 0x2030202E
    .4byte 0x302E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x2E202E20
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x202E202E
    .4byte 0x40338000
    .4byte 0x00000000
    .4byte 0x403F8000
    .4byte 0x00000000
lbl_000146A0:
    # 0x146A0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3C088889
    .4byte 0x00000000
    .4byte 0x3FEE6666
    .4byte 0x66666666
    .4byte 0xBF664CE9
    .4byte 0xED57275E
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3F800000
    .4byte 0x3F4CCCCD
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3E99999A
    .4byte 0x3F000000
    .4byte 0x3F800000
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0x3F911111
    .4byte 0x11111111
    .4byte 0x3FA11111
    .4byte 0x11111111
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x427C0000
    .4byte 0xC2F00000
    .4byte 0x00000000
    .4byte 0x40370000
    .4byte 0x00000000
    .4byte 0x40390000
    .4byte 0x00000000
    .4byte 0x46FFFE00
    .4byte 0x00000000
    .4byte 0x40440000
    .4byte 0x00000000
    .4byte 0x40340000
    .4byte 0x00000000
    .4byte 0x402E0000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x3F9EB851
    .4byte 0xEB851EB8
    .4byte 0x3FAEB851
    .4byte 0xEB851EB8
    .4byte 0x3FA1EB85
    .4byte 0x1EB851EC
    .4byte 0x3FC99999
    .4byte 0x9999999A
lbl_000147F8:
    # 0x147F8
    .4byte 0x3FECCCCC
    .4byte 0xCCCCCCCD
lbl_00014800:
    # 0x14800
    .4byte 0x00000000
    .4byte 0x3FCA3D71
    .4byte 0x00000000
    .4byte 0x3E23D70A
    .4byte 0x3E99999A
    .4byte 0x00000000
    .4byte 0x3FA66666
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3E99999A
    .4byte 0x00000000
    .4byte 0x3F87AE14
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3F333333
    .4byte 0x00000000
    .4byte 0x3E75C28F
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3E8CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3D8F5C29
    .4byte 0x3D8F5C29
    .4byte 0x3D8F5C29
    .4byte 0x3D8F5C29
    .4byte 0x3DCCCCCD
    .4byte 0x3D8F5C29
    .4byte 0x3D8F5C29
    .4byte 0xBD8F5C29
    .4byte 0x3D8F5C29
    .4byte 0x3DCCCCCD
    .4byte 0xBD8F5C29
    .4byte 0x3D8F5C29
    .4byte 0x3D8F5C29
    .4byte 0x3D8F5C29
    .4byte 0x3DCCCCCD
    .4byte 0xBD8F5C29
    .4byte 0x3D8F5C29
    .4byte 0xBD8F5C29
    .4byte 0x3D8F5C29
    .4byte 0x3DCCCCCD
    .4byte 0x000003C0
    .4byte 0x00000000
    .4byte 0x3F0E147B
    .4byte 0x00000000
    .4byte 0x4013B13B
    .4byte 0x41855555
    .4byte 0x4013B13B
    .4byte 0x3FD26E98
    .4byte 0x3F333333
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_00014800
    .4byte 0x0A000000
lbl_00014900:
    # 0x14900
    .4byte 0x00000000
    .4byte 0x3FCA3D71
    .4byte 0x00000000
    .4byte 0x3E23D70A
    .4byte 0x3E99999A
    .4byte 0x00000000
    .4byte 0x3FA66666
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3E99999A
    .4byte 0x00000000
    .4byte 0x3F87AE14
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3F333333
    .4byte 0x00000000
    .4byte 0x3E75C28F
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3E8CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3E8CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x3D23D70A
    .4byte 0x3E051EB8
    .4byte 0x3D23D70A
    .4byte 0x3E051EB8
    .4byte 0x3F000000
    .4byte 0x3D23D70A
    .4byte 0x3E051EB8
    .4byte 0xBD23D70A
    .4byte 0x3E051EB8
    .4byte 0x3F000000
    .4byte 0xBD23D70A
    .4byte 0x3E051EB8
    .4byte 0x3D23D70A
    .4byte 0x3E051EB8
    .4byte 0x3F000000
    .4byte 0xBD23D70A
    .4byte 0x3E051EB8
    .4byte 0xBD23D70A
    .4byte 0x3E051EB8
    .4byte 0x3F000000
    .4byte 0x00000780
    .4byte 0x00000000
    .4byte 0x3F59999A
    .4byte 0x00000000
    .4byte 0x4013B13B
    .4byte 0x41855555
    .4byte 0x4013B13B
    .4byte 0x3FD26E98
    .4byte 0x3F333333
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_00014900
    .4byte 0x0B000000
lbl_00014A14:
    # 0x14A14
    .4byte 0x00000000
    .4byte 0x3FCA3D71
    .4byte 0x00000000
    .4byte 0x3E23D70A
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3FCA3D71
    .4byte 0x00000000
    .4byte 0x3E23D70A
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3FA66666
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3F87AE14
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3F333333
    .4byte 0x00000000
    .4byte 0x3E75C28F
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3E8CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x000000C0
    .4byte 0x00000000
    .4byte 0x3F0E147B
    .4byte 0x00000000
    .4byte 0x4013B13B
    .4byte 0x41855555
    .4byte 0x4013B13B
    .4byte 0x3FD26E98
    .4byte 0x3F333333
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_00014A14
    .4byte 0x08000000
lbl_00014AEC:
    # 0x14AEC
    .4byte 0x00000000
    .4byte 0x3FCA3D71
    .4byte 0x00000000
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x3FCA3D71
    .4byte 0x00000000
    .4byte 0x3E23D70A
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x3FA66666
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3E99999A
    .4byte 0x00000000
    .4byte 0x3F87AE14
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x3E99999A
    .4byte 0x00000000
    .4byte 0x3F333333
    .4byte 0x00000000
    .4byte 0x3E75C28F
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3E8CCCCD
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3F4CCCCD
lbl_00014B78:
    # 0x14B78
    .4byte 0x00000380
    .4byte 0x00000000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x4013B13B
    .4byte 0x41855555
    .4byte 0x4013B13B
    .4byte 0x3FD26E98
    .4byte 0x3F333333
    .4byte 0x3D23D70A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_00014AEC
    .4byte 0x07000000
    .4byte 0x00000000
    .4byte 0x3F4CCCCD
    .4byte 0xC2CC5D55
    .4byte 0x00000000
    .4byte 0x3FEFAE14
    .4byte 0x7AE147AE
    .4byte 0x3F8996FA
    .4byte 0x82E87D2C
    .4byte 0x416E8480
    .4byte 0x00000000
    .4byte 0x40AF4000
    .4byte 0x00000000
    .4byte 0xBFE547AE
    .4byte 0x147AE148
lbl_00014BE8:
    # 0x14BE8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40031EB8
    .4byte 0x51EB851F
    .4byte 0xC0031EB8
    .4byte 0x51EB851F
lbl_00014C00:
    # 0x14C00
    .4byte 0x00000000
    .4byte 0x00000000
lbl_00014C08:
    # 0x14C08
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBFF80000
    .4byte 0x00000000
    .4byte 0x3FE6A09E
    .4byte 0x6665983E
    .4byte 0x3F947AE1
    .4byte 0x47AE147B
    .4byte 0x40340000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000097
    .4byte 0x00000096
    .4byte 0x00000095
    .4byte 0x28800000
    .4byte 0x3F800000
    .4byte 0x3F81E9AF
    .4byte 0x5BA2BE05
    .4byte 0x40654000
    .4byte 0x00000000
    .4byte 0x3F844673
    .4byte 0x81D7DBF4
    .4byte 0x423C0000
    .4byte 0x41A00000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x3FEF5C28
    .4byte 0xF5C28F5C
    .4byte 0x3F9996FA
    .4byte 0x82E87D2C
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x3FE99999
    .4byte 0x9999999A
lbl_00014CB8:
    # 0x14CB8
    .4byte 0xBFF00000
    .4byte 0x00000000
    .4byte 0x3FE6B851
    .4byte 0xEB851EB8
    .4byte 0x403E0000
    .4byte 0x00000000
    .4byte 0x40140000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000094
    .4byte 0x00000093
    .4byte 0x00000092
    .4byte 0x00000017
    .4byte 0x00000018
    .4byte 0x0000001A
    .4byte 0x40E851EC
    .4byte 0x3FE66666
    .4byte 0x66666666
    .4byte 0x34000000
    .4byte 0xBF800000
    .4byte 0x40690000
    .4byte 0x00000000
    .4byte 0x3F8FAE14
    .4byte 0x7AE147AE
    .4byte 0x41700000
    .4byte 0x40000000
    .4byte 0x00000091
    .4byte 0x00000090
    .4byte 0x0000008F
    .4byte 0x00000000
    .4byte 0x40088000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3FD33333
    .4byte 0x33333333
    .4byte 0x40568000
    .4byte 0x00000000
    .4byte 0xC0568000
    .4byte 0x00000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x4003CCCC
    .4byte 0xCCCCCCCC
lbl_00014D70:
    # 0x14D70
    .4byte 0x3DCCCCCD
    .4byte 0x3F800000
    .4byte 0x40000000
    .4byte 0x3DE147AE
    .4byte 0x3FA11111
    .4byte 0x11111111
    .4byte 0x3FF00000
    .4byte 0x00000000
lbl_00014D90:
    # 0x14D90
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x3D4CCCCD
    .4byte 0x3F59999A
    .4byte 0x3FEB3333
    .4byte 0x33333333
    .4byte 0x3FF80000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x42F00000
    .4byte 0x42000000
    .4byte 0x41000000
    .4byte 0x00000000
    .4byte 0x3FB11111
    .4byte 0x11111111
    .4byte 0x3F911111
    .4byte 0x11111111
    .4byte 0x440A0000
    .4byte 0x3F000000
    .4byte 0x3FA66666
    .4byte 0x3F8CCCCD
    .4byte 0x3F666666
    .4byte 0x3F333333
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x00000000
    .4byte 0x3E99999A
    .4byte 0x42A00000
    .4byte 0x42700000
lbl_00014E10:
    # 0x14E10
    .4byte 0x3F800000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBFD8F5C2
    .4byte 0x8F5C28F6
    .4byte 0xC0031EB8
    .4byte 0x51EB851F
    .4byte 0x40031EB8
    .4byte 0x51EB851F
    .4byte 0xC05A15C2
    .4byte 0x8F5C28F6
    .4byte 0xBF800000
    .4byte 0x00000000
    .4byte 0xBFFAC49B
    .4byte 0xA5E353F8
    .4byte 0xC05AA841
    .4byte 0x89374BC7
    .4byte 0x3E99999A
    .4byte 0x00000000
    .4byte 0xC00BEB85
    .4byte 0x1EB851EC
    .4byte 0x405A15C2
    .4byte 0x8F5C28F6
    .4byte 0xC05880A3
    .4byte 0xD70A3D71
    .4byte 0xC61C4000
    .4byte 0x00000000
    .4byte 0xBFF80000
    .4byte 0x00000000
    .4byte 0x40146666
    .4byte 0x66666666
    .4byte 0x3FFAC49B
    .4byte 0xA5E353F8
    .4byte 0x400BEB85
    .4byte 0x1EB851EC
    .4byte 0xBFD90624
    .4byte 0xDD2F1AA0
    .4byte 0xC05F5C29
    .4byte 0xC018F5C3
    .4byte 0xC03C28F6
    .4byte 0x4018F5C3
    .4byte 0x405F5C29
    .4byte 0x403C28F6
    .4byte 0x3FC43420
    .4byte 0x1555C3A3
    .4byte 0xC0588049
    .4byte 0xBA5E353F
    .4byte 0x3FE07C61
    .4byte 0x17A596B1
    .4byte 0x3FA94E78
    .4byte 0xF8A90D60
    .4byte 0xBFD23A71
    .4byte 0x02D52514
    .4byte 0x3F95F0E9
    .4byte 0xAEFD2580
    .4byte 0xBEC83127
    .4byte 0x00000000
    .4byte 0x40C38800
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F1A36E2
    .4byte 0xEB1C432D
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FA99999
    .4byte 0x9999999A

# 5
.section .data
lbl_00014F20:
    # 0x14F20
    .4byte 0x00000001
lbl_00014F24:
    # 0x14F24
    .4byte 0x00000061
    .4byte 0x01030200
    .4byte 0xFFFFFFFF
lbl_00014F30:
    # 0x14F30
    .asciz "Line"
    .balign 4
lbl_00014F38:
    # 0x14F38
    .asciz "Triangle"
    .balign 4
lbl_00014F44:
    # 0x14F44
    .asciz "Big four"
    .balign 4
lbl_00014F50:
    # 0x14F50
    .asciz "Big five"
    .balign 4
lbl_00014F5C:
    # 0x14F5C
    .asciz "Double dark"
lbl_00014F68:
    # 0x14F68
    .asciz "Railroad"
    .balign 4
lbl_00014F74:
    # 0x14F74
    .asciz "Cincinnati"
    .balign 4
lbl_00014F80:
    # 0x14F80
    .asciz "LiLy"
    .balign 4
lbl_00014F88:
    # 0x14F88
    .asciz "Snake eye"
    .balign 4
lbl_00014F94:
    # 0x14F94
    .asciz "Twin babies"
lbl_00014FA0:
    # 0x14FA0
    .asciz "Standard"
    .balign 4
lbl_00014FAC:
    # 0x14FAC
    .asciz "Bucket"
    .balign 4
lbl_00014FB4:
    # 0x14FB4
    .asciz "Baby split"
    .balign 4
lbl_00014FC0:
    # 0x14FC0
    .asciz "One in the dark"
lbl_00014FD0:
    # 0x14FD0
    .asciz "Fit split"
    .balign 4
lbl_00014FDC:
    # 0x14FDC
    .asciz "Wash out"
    .balign 4
lbl_00014FE8:
    # 0x14FE8
    .asciz "Christmas tree"
    .balign 4
lbl_00014FF8:
    # 0x14FF8
    .asciz "Dime store"
    .balign 4
lbl_00015004:
    # 0x15004
    .asciz "Little three"
    .balign 4
lbl_00015014:
    # 0x15014
    .asciz "Big three"
    .balign 4
lbl_00015020:
    # 0x15020
    .4byte lbl_00010BF0
lbl_00015024:
    # 0x15024
    .asciz "RELOCATION BOWLING LOADED\n"
    .balign 4
lbl_00015040:
    # 0x15040
    .asciz "RELOCATION BOWLING PURGED\n"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "mini_bowling.c"
    .balign 4
    .4byte 0x0A000000
    .asciz "Number left"
    .4byte 0x25640000
    .asciz "p/LEVER/"
    .balign 4
    .asciz "Move"
    .balign 4
    .asciz "p/BUTTON_A/"
    .asciz "Position"
    .balign 4
    .asciz "Select"
    .balign 4
    .asciz "p/SANNKAKU_B/"
    .balign 4
    .asciz "Angle"
    .balign 4
    .asciz "Power"
    .balign 4
    .asciz "p/BUTTON_L/BUTTON_R/"
    .balign 4
    .asciz "Spin"
    .balign 4
    .asciz "Number of balls left %d"
    .asciz "Number of patterns cleared %d"
    .balign 4
    .asciz "REPLAY"
    .balign 4
lbl_000151A0:
    # 0x151A0
    .4byte 0x5C000000
lbl_000151A4:
    # 0x151A4
    .asciz "STRIKE\\"
lbl_000151AC:
    # 0x151AC
    .asciz "DOUBLE\\"
lbl_000151B4:
    # 0x151B4
    .asciz "TURKEY\\"
lbl_000151BC:
    # 0x151BC
    .asciz "4TH STRIKE\\"
lbl_000151C8:
    # 0x151C8
    .asciz "5TH STRIKE\\"
lbl_000151D4:
    # 0x151D4
    .asciz "6TH STRIKE\\"
lbl_000151E0:
    # 0x151E0
    .asciz "7TH STRIKE\\"
lbl_000151EC:
    # 0x151EC
    .asciz "8TH STRIKE\\"
lbl_000151F8:
    # 0x151F8
    .asciz "9TH STRIKE\\"
lbl_00015204:
    # 0x15204
    .asciz "10TH STRIKE\\"
    .balign 4
lbl_00015214:
    # 0x15214
    .asciz "11TH STRIKE\\"
    .balign 4
lbl_00015224:
    # 0x15224
    .asciz "PERFECT\\"
    .balign 4
    .asciz "FALL OUT"
    .balign 4
    .asciz "PUNCH OUT\\"
    .balign 4
    .asciz "SPARE["
    .balign 4
    .asciz "MISS"
    .balign 4
    .asciz "CLEAR["
    .balign 4
    .asciz "TRY AGAIN"
    .balign 4
lbl_0001526C:
    # 0x1526C
    .asciz "split \"making it fit\""
    .balign 4
lbl_00015284:
    # 0x15284
    .asciz "split \"rail road\""
    .balign 4
lbl_00015298:
    # 0x15298
    .asciz "split \"cincinnati\""
    .balign 4
lbl_000152AC:
    # 0x152AC
    .asciz "split \"snake eye\""
    .balign 4
lbl_000152C0:
    # 0x152C0
    .asciz "\"baby split\""
    .balign 4
lbl_000152D0:
    # 0x152D0
    .asciz "split \"one in the dark\""
lbl_000152E8:
    # 0x152E8
    .asciz "split \"dime store\""
    .balign 4
lbl_000152FC:
    # 0x152FC
    .asciz "split \"6-7\""
lbl_00015308:
    # 0x15308
    .asciz "split \"christmas tree\""
    .balign 4
lbl_00015320:
    # 0x15320
    .asciz "split \"big three\""
    .balign 4
lbl_00015334:
    # 0x15334
    .asciz "split \"lily\""
    .balign 4
lbl_00015344:
    # 0x15344
    .asciz "split \"big four\""
    .balign 4
lbl_00015358:
    # 0x15358
    .asciz "split \"4-7-9-10\""
    .balign 4
lbl_0001536C:
    # 0x1536C
    .asciz "split \"big five\""
    .balign 4
lbl_00015380:
    # 0x15380
    .asciz "split"
    .balign 4
lbl_00015388:
    # 0x15388
    .4byte lbl_0000667C
    .4byte lbl_000066B8
    .4byte lbl_00006684
    .4byte lbl_0000668C
    .4byte lbl_000066AC
    .4byte lbl_00006694
    .4byte lbl_0000669C
    .4byte lbl_000066A4
    .asciz "Pattern%d "
    .balign 4
    .asciz " Pattern"
    .balign 4
    .asciz "Which will you challenge"
    .balign 4
    .4byte 0x3F000000
lbl_000153E0:
    # 0x153E0
    .4byte 0xFFFFFFFF
lbl_000153E4:
    # 0x153E4
    .4byte 0xFFFFFFFF
lbl_000153E8:
    # 0x153E8
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0xC2C7812C
lbl_000153F4:
    # 0x153F4
    .4byte lbl_00008760
    .4byte lbl_00008768
    .4byte lbl_00008770
    .4byte lbl_00008778
    .4byte lbl_00008780
    .4byte lbl_00008788
    .4byte lbl_00008790
    .4byte lbl_00008798
    .4byte lbl_000087A0
    .4byte lbl_000087A8
    .4byte lbl_000087B0
    .4byte lbl_000087B8
    .4byte 0x00000000
lbl_00015428:
    # 0x15428
    .asciz "%dP START"
    .balign 4
lbl_00015434:
    # 0x15434
    .asciz "START"
    .balign 4
lbl_0001543C:
    # 0x1543C
    .asciz "1 PIN"
    .balign 4
lbl_00015444:
    # 0x15444
    .asciz "%d PINS"
    .asciz "RESULT"
    .balign 4
lbl_00015454:
    # 0x15454
    .asciz "GAME OVER"
    .balign 4
lbl_00015460:
    # 0x15460
    .asciz "ALL CLEAR"
    .balign 4
lbl_0001546C:
    # 0x1546C
    .4byte 0x35000000
    .4byte 0x31000000
    .4byte 0x32000000
    .4byte 0x33000000
    .4byte 0x34000000
lbl_00015480:
    # 0x15480
    .4byte lbl_0000E96C
    .4byte lbl_0000E96C
    .4byte lbl_0000E984
    .4byte lbl_0000E9B4
    .4byte lbl_0000E9F4
    .4byte lbl_0000EA34
    .4byte lbl_0000EA74
    .4byte lbl_0000EAA4
    .4byte lbl_0000EAD8
    .4byte lbl_0000EB08
    .4byte lbl_0000EB38
    .4byte lbl_0000EB68
    .4byte lbl_0000EB98
    .4byte lbl_0000EBC8
    .4byte lbl_0000EBF8
    .4byte lbl_0000EBF8
    .4byte lbl_0000EBF8
    .4byte lbl_0000EBF8

# 6
.section .bss
lbl_10000000:
    .skip 0x4
lbl_10000004:
    .skip 0x8
lbl_1000000C:
    .skip 0x130
lbl_1000013C:
    .skip 0x2
lbl_1000013E:
    .skip 0x1
lbl_1000013F:
    .skip 0x15
lbl_10000154:
    .skip 0x24
lbl_10000178:
    .skip 0x348
lbl_100004C0:
    .skip 0x20
lbl_100004E0:
    .skip 0x11C60
lbl_10012140:
    .skip 0x40
lbl_10012180:
    .skip 0x6390
lbl_10018510:
    .skip 0x2D78

