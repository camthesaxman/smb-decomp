.include "macros.inc"

.global _prolog
.global _epilog
.global _unresolved

# 1
.section .text
_prolog:
/* 000000C8 7C0802A6 */ mflr r0
/* 000000CC 3C600000 */ lis r3, lbl_00000330@ha
/* 000000D0 90010004 */ stw r0, 4(r1)
/* 000000D4 3C800000 */ lis r4, lbl_00000C9C@ha
/* 000000D8 38630000 */ addi r3, r3, lbl_00000330@l
/* 000000DC 9421FFF8 */ stwu r1, -8(r1)
/* 000000E0 38840000 */ addi r4, r4, lbl_00000C9C@l
/* 000000E4 38A00000 */ li r5, 0
/* 000000E8 38C00000 */ li r6, 0
/* 000000EC 48000029 */ bl func_80012510
/* 000000F0 480000D1 */ bl lbl_0x000001C0
/* 000000F4 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000000F8 3800001E */ li r0, 0x1e
/* 000000FC B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000100 8001000C */ lwz r0, 0xc(r1)
/* 00000104 38210008 */ addi r1, r1, 8
/* 00000108 7C0803A6 */ mtlr r0
/* 0000010C 4E800020 */ blr 
_epilog:
/* 00000110 4E800020 */ blr 
_unresolved:
/* 00000114 7C0802A6 */ mflr r0
/* 00000118 3C600000 */ lis r3, lbl_00000E98@ha
/* 0000011C 90010004 */ stw r0, 4(r1)
/* 00000120 9421FFE8 */ stwu r1, -0x18(r1)
/* 00000124 93E10014 */ stw r31, 0x14(r1)
/* 00000128 3BE30000 */ addi r31, r3, lbl_00000E98@l
/* 0000012C 387F0000 */ addi r3, r31, 0
/* 00000130 93C10010 */ stw r30, 0x10(r1)
/* 00000134 93A1000C */ stw r29, 0xc(r1)
/* 00000138 4BFFFFDD */ bl puts
/* 0000013C 387F0028 */ addi r3, r31, 0x28
/* 00000140 4BFFFFD5 */ bl puts
/* 00000144 3BC00000 */ li r30, 0
/* 00000148 4BFFFFCD */ bl OSGetStackPointer
/* 0000014C 7C7D1B78 */ mr r29, r3
/* 00000150 48000020 */ b lbl_0x00000170
lbl_0x00000154:
/* 00000154 80BD0000 */ lwz r5, 0(r29)
/* 00000158 7FA4EB78 */ mr r4, r29
/* 0000015C 80DD0004 */ lwz r6, 4(r29)
/* 00000160 387F0050 */ addi r3, r31, 0x50
/* 00000164 4CC63182 */ crclr 6
/* 00000168 4BFFFFAD */ bl printf
/* 0000016C 83BD0000 */ lwz r29, 0(r29)
lbl_0x00000170:
/* 00000170 281D0000 */ cmplwi r29, 0
/* 00000174 4182001C */ beq lbl_0x00000190
/* 00000178 3C1D0001 */ addis r0, r29, 1
/* 0000017C 2800FFFF */ cmplwi r0, 0xffff
/* 00000180 41820010 */ beq lbl_0x00000190
/* 00000184 281E0010 */ cmplwi r30, 0x10
/* 00000188 3BDE0001 */ addi r30, r30, 1
/* 0000018C 4180FFC8 */ blt lbl_0x00000154
lbl_0x00000190:
/* 00000190 387F006C */ addi r3, r31, 0x6c
/* 00000194 4CC63182 */ crclr 6
/* 00000198 38BF007C */ addi r5, r31, 0x7c
/* 0000019C 38800047 */ li r4, 0x47
/* 000001A0 4BFFFF75 */ bl OSPanic
/* 000001A4 8001001C */ lwz r0, 0x1c(r1)
/* 000001A8 83E10014 */ lwz r31, 0x14(r1)
/* 000001AC 83C10010 */ lwz r30, 0x10(r1)
/* 000001B0 7C0803A6 */ mtlr r0
/* 000001B4 83A1000C */ lwz r29, 0xc(r1)
/* 000001B8 38210018 */ addi r1, r1, 0x18
/* 000001BC 4E800020 */ blr 
lbl_0x000001C0:
/* 000001C0 7C0802A6 */ mflr r0
/* 000001C4 3C600000 */ lis r3, lbl_802F1EE0@ha
/* 000001C8 90010004 */ stw r0, 4(r1)
/* 000001CC 9421FFF0 */ stwu r1, -0x10(r1)
/* 000001D0 93E1000C */ stw r31, 0xc(r1)
/* 000001D4 93C10008 */ stw r30, 8(r1)
/* 000001D8 80030000 */ lwz r0, lbl_802F1EE0@l(r3)
/* 000001DC 7000000A */ andi. r0, r0, 0xa
/* 000001E0 40820138 */ bne lbl_0x00000318
/* 000001E4 3C600000 */ lis r3, modeCtrl@ha
/* 000001E8 38830000 */ addi r4, r3, modeCtrl@l
/* 000001EC 3BC00000 */ li r30, 0
/* 000001F0 93C40000 */ stw r30, 0(r4)
/* 000001F4 38000001 */ li r0, 1
/* 000001F8 3C600000 */ lis r3, spritePoolInfo@ha
/* 000001FC 90040024 */ stw r0, 0x24(r4)
/* 00000200 38630000 */ addi r3, r3, spritePoolInfo@l
/* 00000204 38A3000C */ addi r5, r3, 0xc
/* 00000208 90040030 */ stw r0, 0x30(r4)
/* 0000020C 38000002 */ li r0, 2
/* 00000210 93C40028 */ stw r30, 0x28(r4)
/* 00000214 B3C40040 */ sth r30, 0x40(r4)
/* 00000218 8063000C */ lwz r3, 0xc(r3)
/* 0000021C 98030000 */ stb r0, 0(r3)
/* 00000220 80650000 */ lwz r3, 0(r5)
/* 00000224 9BC30001 */ stb r30, 1(r3)
/* 00000228 80650000 */ lwz r3, 0(r5)
/* 0000022C 9BC30002 */ stb r30, 2(r3)
/* 00000230 80650000 */ lwz r3, 0(r5)
/* 00000234 9BC30003 */ stb r30, 3(r3)
/* 00000238 93C4002C */ stw r30, 0x2c(r4)
/* 0000023C 4BFFFED9 */ bl func_8002FFEC
/* 00000240 4BFFFED5 */ bl event_clear
/* 00000244 4BFFFED1 */ bl g_something_with_iteratively_freeing_memory
/* 00000248 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 0000024C 3BE30000 */ addi r31, r3, loadingStageIdRequest@l
/* 00000250 A87F0000 */ lha r3, 0(r31)
/* 00000254 4BFFFEC1 */ bl func_800569B4
/* 00000258 A87F0000 */ lha r3, 0(r31)
/* 0000025C 4BFFFEB9 */ bl load_stage
/* 00000260 38600005 */ li r3, 5
/* 00000264 4BFFFEB1 */ bl call_something_with_bmp_bmp_com
/* 00000268 A87F0000 */ lha r3, 0(r31)
/* 0000026C 4BFFFEA9 */ bl preload_stage_files
/* 00000270 A81F0000 */ lha r0, 0(r31)
/* 00000274 3C600000 */ lis r3, lbl_0000185D@ha
/* 00000278 90030000 */ stw r0, lbl_0000185D@l(r3)
/* 0000027C 38600001 */ li r3, 1
/* 00000280 4BFFFE95 */ bl ev_run_init
/* 00000284 3860000F */ li r3, 0xf
/* 00000288 4BFFFE8D */ bl ev_run_init
/* 0000028C 38600010 */ li r3, 0x10
/* 00000290 4BFFFE85 */ bl ev_run_init
/* 00000294 38600012 */ li r3, 0x12
/* 00000298 4BFFFE7D */ bl ev_run_init
/* 0000029C 3860000D */ li r3, 0xd
/* 000002A0 4BFFFE75 */ bl ev_run_init
/* 000002A4 38600005 */ li r3, 5
/* 000002A8 4BFFFE6D */ bl ev_run_init
/* 000002AC 38600004 */ li r3, 4
/* 000002B0 4BFFFE65 */ bl ev_run_init
/* 000002B4 38600013 */ li r3, 0x13
/* 000002B8 4BFFFE5D */ bl ev_run_init
/* 000002BC 38600014 */ li r3, 0x14
/* 000002C0 4BFFFE55 */ bl ev_run_init
/* 000002C4 4BFFFE51 */ bl func_800972CC
/* 000002C8 3860000C */ li r3, 0xc
/* 000002CC 4BFFFE49 */ bl camera_set_state
/* 000002D0 3C600000 */ lis r3, lbl_802F1FA4@ha
/* 000002D4 93C30000 */ stw r30, lbl_802F1FA4@l(r3)
/* 000002D8 4BFFFE3D */ bl func_800123DC
/* 000002DC 48000749 */ bl lbl_0x00000A24
/* 000002E0 480009B1 */ bl lbl_0x00000C90
/* 000002E4 4BFFFE31 */ bl func_800668A0
/* 000002E8 3C600000 */ lis r3, lbl_801F3A58@ha
/* 000002EC 38830000 */ addi r4, r3, lbl_801F3A58@l
/* 000002F0 A804002E */ lha r0, 0x2e(r4)
/* 000002F4 3C600000 */ lis r3, loadingStageId@ha
/* 000002F8 38800000 */ li r4, 0
/* 000002FC B0030000 */ sth r0, loadingStageId@l(r3)
/* 00000300 38600000 */ li r3, 0
/* 00000304 38A0001E */ li r5, 0x1e
/* 00000308 4BFFFE0D */ bl func_800732DC
/* 0000030C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000310 3800001E */ li r0, 0x1e
/* 00000314 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_0x00000318:
/* 00000318 80010014 */ lwz r0, 0x14(r1)
/* 0000031C 83E1000C */ lwz r31, 0xc(r1)
/* 00000320 83C10008 */ lwz r30, 8(r1)
/* 00000324 7C0803A6 */ mtlr r0
/* 00000328 38210010 */ addi r1, r1, 0x10
/* 0000032C 4E800020 */ blr 
lbl_00000330:
/* 00000330 7C0802A6 */ mflr r0
/* 00000334 3C600000 */ lis r3, lbl_802F1EE0@ha
/* 00000338 90010004 */ stw r0, 4(r1)
/* 0000033C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00000340 93E10014 */ stw r31, 0x14(r1)
/* 00000344 93C10010 */ stw r30, 0x10(r1)
/* 00000348 93A1000C */ stw r29, 0xc(r1)
/* 0000034C 93810008 */ stw r28, 8(r1)
/* 00000350 80030000 */ lwz r0, lbl_802F1EE0@l(r3)
/* 00000354 3C600000 */ lis r3, lbl_0000185D@ha
/* 00000358 3BE30000 */ addi r31, r3, lbl_0000185D@l
/* 0000035C 7000000A */ andi. r0, r0, 0xa
/* 00000360 408206A4 */ bne lbl_0x00000A04
/* 00000364 3C600000 */ lis r3, controllerInfo@ha
/* 00000368 38A30000 */ addi r5, r3, controllerInfo@l
/* 0000036C A0050030 */ lhz r0, 0x30(r5)
/* 00000370 54030739 */ rlwinm. r3, r0, 0, 0x1c, 0x1c
/* 00000374 40820044 */ bne lbl_0x000003B8
/* 00000378 3C600000 */ lis r3, lbl_801F3D50@ha
/* 0000037C 38830000 */ addi r4, r3, lbl_801F3D50@l
/* 00000380 A0C40008 */ lhz r6, 8(r4)
/* 00000384 54C30739 */ rlwinm. r3, r6, 0, 0x1c, 0x1c
/* 00000388 40820030 */ bne lbl_0x000003B8
/* 0000038C A0A50000 */ lhz r5, 0(r5)
/* 00000390 54A30739 */ rlwinm. r3, r5, 0, 0x1c, 0x1c
/* 00000394 40820010 */ bne lbl_0x000003A4
/* 00000398 A0640000 */ lhz r3, 0(r4)
/* 0000039C 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 000003A0 4182003C */ beq lbl_0x000003DC
lbl_0x000003A4:
/* 000003A4 3C600000 */ lis r3, lbl_801F3D50@ha
/* 000003A8 38630000 */ addi r3, r3, lbl_801F3D50@l
/* 000003AC A0630000 */ lhz r3, 0(r3)
/* 000003B0 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 000003B4 41820028 */ beq lbl_0x000003DC
lbl_0x000003B8:
/* 000003B8 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 000003BC 38830000 */ addi r4, r3, lbl_802F1BE0@l
/* 000003C0 80640000 */ lwz r3, 0(r4)
/* 000003C4 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 000003C8 90640000 */ stw r3, 0(r4)
/* 000003CC 40800074 */ bge lbl_0x00000440
/* 000003D0 38600007 */ li r3, 7
/* 000003D4 90640000 */ stw r3, 0(r4)
/* 000003D8 48000068 */ b lbl_0x00000440
lbl_0x000003DC:
/* 000003DC 5403077B */ rlwinm. r3, r0, 0, 0x1d, 0x1d
/* 000003E0 4082003C */ bne lbl_0x0000041C
/* 000003E4 54C3077B */ rlwinm. r3, r6, 0, 0x1d, 0x1d
/* 000003E8 40820034 */ bne lbl_0x0000041C
/* 000003EC 54A3077B */ rlwinm. r3, r5, 0, 0x1d, 0x1d
/* 000003F0 40820018 */ bne lbl_0x00000408
/* 000003F4 3C600000 */ lis r3, lbl_801F3D50@ha
/* 000003F8 38630000 */ addi r3, r3, lbl_801F3D50@l
/* 000003FC A0630000 */ lhz r3, 0(r3)
/* 00000400 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 00000404 4182003C */ beq lbl_0x00000440
lbl_0x00000408:
/* 00000408 3C600000 */ lis r3, lbl_801F3D50@ha
/* 0000040C 38630000 */ addi r3, r3, lbl_801F3D50@l
/* 00000410 A0630000 */ lhz r3, 0(r3)
/* 00000414 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00000418 41820028 */ beq lbl_0x00000440
lbl_0x0000041C:
/* 0000041C 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 00000420 38830000 */ addi r4, r3, lbl_802F1BE0@l
/* 00000424 80640000 */ lwz r3, 0(r4)
/* 00000428 38630001 */ addi r3, r3, 1
/* 0000042C 2C030008 */ cmpwi r3, 8
/* 00000430 90640000 */ stw r3, 0(r4)
/* 00000434 4180000C */ blt lbl_0x00000440
/* 00000438 38600000 */ li r3, 0
/* 0000043C 90640000 */ stw r3, 0(r4)
lbl_0x00000440:
/* 00000440 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 00000444 80A30000 */ lwz r5, lbl_802F1BE0@l(r3)
/* 00000448 28050007 */ cmplwi r5, 7
/* 0000044C 418102E0 */ bgt lbl_0x0000072C
/* 00000450 3C600000 */ lis r3, lbl_00000F18@ha
/* 00000454 38830000 */ addi r4, r3, lbl_00000F18@l
/* 00000458 54A3103A */ slwi r3, r5, 2
/* 0000045C 7C64182E */ lwzx r3, r4, r3
/* 00000460 7C6903A6 */ mtctr r3
/* 00000464 4E800420 */ bctr 
lbl_00000468:
/* 00000468 3C600000 */ lis r3, modeCtrl@ha
/* 0000046C 38630000 */ addi r3, r3, modeCtrl@l
/* 00000470 38A30008 */ addi r5, r3, 8
/* 00000474 80830008 */ lwz r4, 8(r3)
/* 00000478 540307FF */ clrlwi. r3, r0, 0x1f
/* 0000047C 5483003C */ rlwinm r3, r4, 0, 0, 0x1e
/* 00000480 90650000 */ stw r3, 0(r5)
/* 00000484 80650000 */ lwz r3, 0(r5)
/* 00000488 54630776 */ rlwinm r3, r3, 0, 0x1d, 0x1b
/* 0000048C 90650000 */ stw r3, 0(r5)
/* 00000490 80650000 */ lwz r3, 0(r5)
/* 00000494 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 00000498 90650000 */ stw r3, 0(r5)
/* 0000049C 4082004C */ bne lbl_0x000004E8
/* 000004A0 3C600000 */ lis r3, lbl_801F3D50@ha
/* 000004A4 38830000 */ addi r4, r3, lbl_801F3D50@l
/* 000004A8 A0640008 */ lhz r3, 8(r4)
/* 000004AC 546307FF */ clrlwi. r3, r3, 0x1f
/* 000004B0 40820038 */ bne lbl_0x000004E8
/* 000004B4 3C600000 */ lis r3, controllerInfo@ha
/* 000004B8 38630000 */ addi r3, r3, controllerInfo@l
/* 000004BC A0630000 */ lhz r3, 0(r3)
/* 000004C0 546307FF */ clrlwi. r3, r3, 0x1f
/* 000004C4 40820010 */ bne lbl_0x000004D4
/* 000004C8 A0640000 */ lhz r3, 0(r4)
/* 000004CC 546307FF */ clrlwi. r3, r3, 0x1f
/* 000004D0 41820040 */ beq lbl_0x00000510
lbl_0x000004D4:
/* 000004D4 3C600000 */ lis r3, lbl_801F3D50@ha
/* 000004D8 38630000 */ addi r3, r3, lbl_801F3D50@l
/* 000004DC A0630000 */ lhz r3, 0(r3)
/* 000004E0 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 000004E4 4182002C */ beq lbl_0x00000510
lbl_0x000004E8:
/* 000004E8 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 000004EC 38A30000 */ addi r5, r3, loadingStageIdRequest@l
/* 000004F0 A8650000 */ lha r3, 0(r5)
/* 000004F4 3883FFFF */ addi r4, r3, -1  ;# fixed addi
/* 000004F8 7C830734 */ extsh r3, r4
/* 000004FC B0850000 */ sth r4, 0(r5)
/* 00000500 2C030001 */ cmpwi r3, 1
/* 00000504 4080000C */ bge lbl_0x00000510
/* 00000508 38600001 */ li r3, 1
/* 0000050C B0650000 */ sth r3, 0(r5)
lbl_0x00000510:
/* 00000510 540307BD */ rlwinm. r3, r0, 0, 0x1e, 0x1e
/* 00000514 4082004C */ bne lbl_0x00000560
/* 00000518 3C600000 */ lis r3, lbl_801F3D50@ha
/* 0000051C 38830000 */ addi r4, r3, lbl_801F3D50@l
/* 00000520 A0640008 */ lhz r3, 8(r4)
/* 00000524 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00000528 40820038 */ bne lbl_0x00000560
/* 0000052C 3C600000 */ lis r3, controllerInfo@ha
/* 00000530 38630000 */ addi r3, r3, controllerInfo@l
/* 00000534 A0630000 */ lhz r3, 0(r3)
/* 00000538 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 0000053C 40820010 */ bne lbl_0x0000054C
/* 00000540 A0640000 */ lhz r3, 0(r4)
/* 00000544 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00000548 418201E4 */ beq lbl_0x0000072C
lbl_0x0000054C:
/* 0000054C 3C600000 */ lis r3, lbl_801F3D50@ha
/* 00000550 38630000 */ addi r3, r3, lbl_801F3D50@l
/* 00000554 A0630000 */ lhz r3, 0(r3)
/* 00000558 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000055C 418201D0 */ beq lbl_0x0000072C
lbl_0x00000560:
/* 00000560 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 00000564 38A30000 */ addi r5, r3, loadingStageIdRequest@l
/* 00000568 A8650000 */ lha r3, 0(r5)
/* 0000056C 38830001 */ addi r4, r3, 1
/* 00000570 7C830734 */ extsh r3, r4
/* 00000574 B0850000 */ sth r4, 0(r5)
/* 00000578 2C0300C8 */ cmpwi r3, 0xc8
/* 0000057C 408101B0 */ ble lbl_0x0000072C
/* 00000580 386000C8 */ li r3, 0xc8
/* 00000584 B0650000 */ sth r3, 0(r5)
/* 00000588 480001A4 */ b lbl_0x0000072C
lbl_0000058C:
/* 0000058C 3C600000 */ lis r3, modeCtrl@ha
/* 00000590 38630000 */ addi r3, r3, modeCtrl@l
/* 00000594 38800000 */ li r4, 0
/* 00000598 90830004 */ stw r4, 4(r3)
/* 0000059C 38830008 */ addi r4, r3, 8
/* 000005A0 80630008 */ lwz r3, 8(r3)
/* 000005A4 60630001 */ ori r3, r3, 1
/* 000005A8 90640000 */ stw r3, 0(r4)
/* 000005AC 80640000 */ lwz r3, 0(r4)
/* 000005B0 54630776 */ rlwinm r3, r3, 0, 0x1d, 0x1b
/* 000005B4 90640000 */ stw r3, 0(r4)
/* 000005B8 80640000 */ lwz r3, 0(r4)
/* 000005BC 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 000005C0 90640000 */ stw r3, 0(r4)
/* 000005C4 48000168 */ b lbl_0x0000072C
lbl_000005C8:
/* 000005C8 3C600000 */ lis r3, modeCtrl@ha
/* 000005CC 38630000 */ addi r3, r3, modeCtrl@l
/* 000005D0 38800001 */ li r4, 1
/* 000005D4 90830004 */ stw r4, 4(r3)
/* 000005D8 38830008 */ addi r4, r3, 8
/* 000005DC 80630008 */ lwz r3, 8(r3)
/* 000005E0 60630001 */ ori r3, r3, 1
/* 000005E4 90640000 */ stw r3, 0(r4)
/* 000005E8 80640000 */ lwz r3, 0(r4)
/* 000005EC 54630776 */ rlwinm r3, r3, 0, 0x1d, 0x1b
/* 000005F0 90640000 */ stw r3, 0(r4)
/* 000005F4 80640000 */ lwz r3, 0(r4)
/* 000005F8 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 000005FC 90640000 */ stw r3, 0(r4)
/* 00000600 4800012C */ b lbl_0x0000072C
lbl_00000604:
/* 00000604 3C600000 */ lis r3, modeCtrl@ha
/* 00000608 38630000 */ addi r3, r3, modeCtrl@l
/* 0000060C 38800002 */ li r4, 2
/* 00000610 90830004 */ stw r4, 4(r3)
/* 00000614 38830008 */ addi r4, r3, 8
/* 00000618 80630008 */ lwz r3, 8(r3)
/* 0000061C 60630001 */ ori r3, r3, 1
/* 00000620 90640000 */ stw r3, 0(r4)
/* 00000624 80640000 */ lwz r3, 0(r4)
/* 00000628 54630776 */ rlwinm r3, r3, 0, 0x1d, 0x1b
/* 0000062C 90640000 */ stw r3, 0(r4)
/* 00000630 80640000 */ lwz r3, 0(r4)
/* 00000634 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 00000638 90640000 */ stw r3, 0(r4)
/* 0000063C 480000F0 */ b lbl_0x0000072C
lbl_00000640:
/* 00000640 3C600000 */ lis r3, modeCtrl@ha
/* 00000644 38630000 */ addi r3, r3, modeCtrl@l
/* 00000648 38800000 */ li r4, 0
/* 0000064C 90830004 */ stw r4, 4(r3)
/* 00000650 38830008 */ addi r4, r3, 8
/* 00000654 80630008 */ lwz r3, 8(r3)
/* 00000658 60630001 */ ori r3, r3, 1
/* 0000065C 90640000 */ stw r3, 0(r4)
/* 00000660 80640000 */ lwz r3, 0(r4)
/* 00000664 60630008 */ ori r3, r3, 8
/* 00000668 90640000 */ stw r3, 0(r4)
/* 0000066C 80640000 */ lwz r3, 0(r4)
/* 00000670 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 00000674 90640000 */ stw r3, 0(r4)
/* 00000678 480000B4 */ b lbl_0x0000072C
lbl_0000067C:
/* 0000067C 3C600000 */ lis r3, modeCtrl@ha
/* 00000680 38630000 */ addi r3, r3, modeCtrl@l
/* 00000684 38800001 */ li r4, 1
/* 00000688 90830004 */ stw r4, 4(r3)
/* 0000068C 38830008 */ addi r4, r3, 8
/* 00000690 80630008 */ lwz r3, 8(r3)
/* 00000694 60630001 */ ori r3, r3, 1
/* 00000698 90640000 */ stw r3, 0(r4)
/* 0000069C 80640000 */ lwz r3, 0(r4)
/* 000006A0 60630008 */ ori r3, r3, 8
/* 000006A4 90640000 */ stw r3, 0(r4)
/* 000006A8 80640000 */ lwz r3, 0(r4)
/* 000006AC 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 000006B0 90640000 */ stw r3, 0(r4)
/* 000006B4 48000078 */ b lbl_0x0000072C
lbl_000006B8:
/* 000006B8 3C600000 */ lis r3, modeCtrl@ha
/* 000006BC 38630000 */ addi r3, r3, modeCtrl@l
/* 000006C0 38800002 */ li r4, 2
/* 000006C4 90830004 */ stw r4, 4(r3)
/* 000006C8 38830008 */ addi r4, r3, 8
/* 000006CC 80630008 */ lwz r3, 8(r3)
/* 000006D0 60630001 */ ori r3, r3, 1
/* 000006D4 90640000 */ stw r3, 0(r4)
/* 000006D8 80640000 */ lwz r3, 0(r4)
/* 000006DC 60630008 */ ori r3, r3, 8
/* 000006E0 90640000 */ stw r3, 0(r4)
/* 000006E4 80640000 */ lwz r3, 0(r4)
/* 000006E8 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 000006EC 90640000 */ stw r3, 0(r4)
/* 000006F0 4800003C */ b lbl_0x0000072C
lbl_000006F4:
/* 000006F4 3C600000 */ lis r3, modeCtrl@ha
/* 000006F8 38630000 */ addi r3, r3, modeCtrl@l
/* 000006FC 38800002 */ li r4, 2
/* 00000700 90830004 */ stw r4, 4(r3)
/* 00000704 38830008 */ addi r4, r3, 8
/* 00000708 80630008 */ lwz r3, 8(r3)
/* 0000070C 60630001 */ ori r3, r3, 1
/* 00000710 90640000 */ stw r3, 0(r4)
/* 00000714 80640000 */ lwz r3, 0(r4)
/* 00000718 60630008 */ ori r3, r3, 8
/* 0000071C 90640000 */ stw r3, 0(r4)
/* 00000720 80640000 */ lwz r3, 0(r4)
/* 00000724 60630010 */ ori r3, r3, 0x10
/* 00000728 90640000 */ stw r3, 0(r4)
lbl_0x0000072C:
/* 0000072C 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 00000730 38630000 */ addi r3, r3, lbl_802F1BE0@l
/* 00000734 80630000 */ lwz r3, 0(r3)
/* 00000738 2C030000 */ cmpwi r3, 0
/* 0000073C 41820148 */ beq lbl_0x00000884
/* 00000740 540307FF */ clrlwi. r3, r0, 0x1f
/* 00000744 4082004C */ bne lbl_0x00000790
/* 00000748 3C600000 */ lis r3, lbl_801F3D50@ha
/* 0000074C 38830000 */ addi r4, r3, lbl_801F3D50@l
/* 00000750 A0640008 */ lhz r3, 8(r4)
/* 00000754 546307FF */ clrlwi. r3, r3, 0x1f
/* 00000758 40820038 */ bne lbl_0x00000790
/* 0000075C 3C600000 */ lis r3, controllerInfo@ha
/* 00000760 38630000 */ addi r3, r3, controllerInfo@l
/* 00000764 A0630000 */ lhz r3, 0(r3)
/* 00000768 546307FF */ clrlwi. r3, r3, 0x1f
/* 0000076C 40820010 */ bne lbl_0x0000077C
/* 00000770 A0640000 */ lhz r3, 0(r4)
/* 00000774 546307FF */ clrlwi. r3, r3, 0x1f
/* 00000778 4182002C */ beq lbl_0x000007A4
lbl_0x0000077C:
/* 0000077C 3C600000 */ lis r3, lbl_801F3D50@ha
/* 00000780 38630000 */ addi r3, r3, lbl_801F3D50@l
/* 00000784 A0630000 */ lhz r3, 0(r3)
/* 00000788 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000078C 41820018 */ beq lbl_0x000007A4
lbl_0x00000790:
/* 00000790 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 00000794 38830000 */ addi r4, r3, lbl_802F1BE0@l
/* 00000798 80640004 */ lwz r3, 4(r4)
/* 0000079C 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 000007A0 90640004 */ stw r3, 4(r4)
lbl_0x000007A4:
/* 000007A4 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000007A8 40820044 */ bne lbl_0x000007EC
/* 000007AC 3C600000 */ lis r3, lbl_801F3D50@ha
/* 000007B0 38830000 */ addi r4, r3, lbl_801F3D50@l
/* 000007B4 A0040008 */ lhz r0, 8(r4)
/* 000007B8 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000007BC 40820030 */ bne lbl_0x000007EC
/* 000007C0 3C600000 */ lis r3, controllerInfo@ha
/* 000007C4 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 000007C8 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000007CC 40820010 */ bne lbl_0x000007DC
/* 000007D0 A0040000 */ lhz r0, 0(r4)
/* 000007D4 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000007D8 41820028 */ beq lbl_0x00000800
lbl_0x000007DC:
/* 000007DC 3C600000 */ lis r3, lbl_801F3D50@ha
/* 000007E0 A0030000 */ lhz r0, lbl_801F3D50@l(r3)
/* 000007E4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000007E8 41820018 */ beq lbl_0x00000800
lbl_0x000007EC:
/* 000007EC 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 000007F0 38830000 */ addi r4, r3, lbl_802F1BE0@l
/* 000007F4 80640004 */ lwz r3, 4(r4)
/* 000007F8 38030001 */ addi r0, r3, 1
/* 000007FC 90040004 */ stw r0, 4(r4)
lbl_0x00000800:
/* 00000800 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 00000804 38630000 */ addi r3, r3, lbl_802F1BE0@l
/* 00000808 3BC30004 */ addi r30, r3, 4
/* 0000080C 80030004 */ lwz r0, 4(r3)
/* 00000810 2C000001 */ cmpwi r0, 1
/* 00000814 4080000C */ bge lbl_0x00000820
/* 00000818 38600001 */ li r3, 1
/* 0000081C 48000040 */ b lbl_0x0000085C
lbl_0x00000820:
/* 00000820 3C600000 */ lis r3, modeCtrl@ha
/* 00000824 38630000 */ addi r3, r3, modeCtrl@l
/* 00000828 3B830004 */ addi r28, r3, 4
/* 0000082C 3BA30008 */ addi r29, r3, 8
/* 00000830 80630004 */ lwz r3, 4(r3)
/* 00000834 809D0000 */ lwz r4, 0(r29)
/* 00000838 4BFFF8DD */ bl func_8006720C
/* 0000083C 801E0000 */ lwz r0, 0(r30)
/* 00000840 7C001800 */ cmpw r0, r3
/* 00000844 40810014 */ ble lbl_0x00000858
/* 00000848 807C0000 */ lwz r3, 0(r28)
/* 0000084C 809D0000 */ lwz r4, 0(r29)
/* 00000850 4BFFF8C5 */ bl func_8006720C
/* 00000854 48000008 */ b lbl_0x0000085C
lbl_0x00000858:
/* 00000858 7C030378 */ mr r3, r0
lbl_0x0000085C:
/* 0000085C 907E0000 */ stw r3, 0(r30)
/* 00000860 3C600000 */ lis r3, modeCtrl@ha
/* 00000864 38A30000 */ addi r5, r3, modeCtrl@l
/* 00000868 80650004 */ lwz r3, 4(r5)
/* 0000086C 809E0000 */ lwz r4, 0(r30)
/* 00000870 80A50008 */ lwz r5, 8(r5)
/* 00000874 4BFFF8A1 */ bl func_80067100
/* 00000878 3C800000 */ lis r4, loadingStageIdRequest@ha
/* 0000087C 7C600734 */ extsh r0, r3
/* 00000880 B0040000 */ sth r0, loadingStageIdRequest@l(r4)
lbl_0x00000884:
/* 00000884 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 00000888 809F0000 */ lwz r4, 0(r31)
/* 0000088C 3BC30000 */ addi r30, r3, loadingStageIdRequest@l
/* 00000890 A81E0000 */ lha r0, 0(r30)
/* 00000894 7C040000 */ cmpw r4, r0
/* 00000898 4182001C */ beq lbl_0x000008B4
/* 0000089C 480003F9 */ bl lbl_0x00000C94
/* 000008A0 4BFFF875 */ bl func_8009245C
/* 000008A4 A87E0000 */ lha r3, 0(r30)
/* 000008A8 4BFFF86D */ bl preload_stage_files
/* 000008AC A81E0000 */ lha r0, 0(r30)
/* 000008B0 901F0000 */ stw r0, 0(r31)
lbl_0x000008B4:
/* 000008B4 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 000008B8 38830000 */ addi r4, r3, loadingStageIdRequest@l
/* 000008BC 3C600000 */ lis r3, lbl_801F3A58@ha
/* 000008C0 A8040000 */ lha r0, 0(r4)
/* 000008C4 38830000 */ addi r4, r3, lbl_801F3A58@l
/* 000008C8 B004002E */ sth r0, 0x2e(r4)
/* 000008CC 3C600000 */ lis r3, loadingStageId@ha
/* 000008D0 B0030000 */ sth r0, loadingStageId@l(r3)
/* 000008D4 3C600000 */ lis r3, currStageId@ha
/* 000008D8 809F0000 */ lwz r4, 0(r31)
/* 000008DC A8030000 */ lha r0, currStageId@l(r3)
/* 000008E0 7C040000 */ cmpw r4, r0
/* 000008E4 41820074 */ beq lbl_0x00000958
/* 000008E8 4BFFF82D */ bl func_80092444
/* 000008EC 2C030000 */ cmpwi r3, 0
/* 000008F0 40820068 */ bne lbl_0x00000958
/* 000008F4 3860000D */ li r3, 0xd
/* 000008F8 4BFFF81D */ bl ev_run_dest
/* 000008FC 38600005 */ li r3, 5
/* 00000900 4BFFF815 */ bl ev_run_dest
/* 00000904 38600004 */ li r3, 4
/* 00000908 4BFFF80D */ bl ev_run_dest
/* 0000090C 38600014 */ li r3, 0x14
/* 00000910 4BFFF805 */ bl ev_run_dest
/* 00000914 807F0000 */ lwz r3, 0(r31)
/* 00000918 4BFFF7FD */ bl func_800569B4
/* 0000091C 807F0000 */ lwz r3, 0(r31)
/* 00000920 4BFFF7F5 */ bl load_stage
/* 00000924 3860000D */ li r3, 0xd
/* 00000928 4BFFF7ED */ bl ev_run_init
/* 0000092C 38600005 */ li r3, 5
/* 00000930 4BFFF7E5 */ bl ev_run_init
/* 00000934 38600004 */ li r3, 4
/* 00000938 4BFFF7DD */ bl ev_run_init
/* 0000093C 38600013 */ li r3, 0x13
/* 00000940 4BFFF7D5 */ bl ev_run_init
/* 00000944 38600014 */ li r3, 0x14
/* 00000948 4BFFF7CD */ bl ev_run_init
/* 0000094C 3860000C */ li r3, 0xc
/* 00000950 4BFFF7C5 */ bl camera_set_state
/* 00000954 4BFFF7C1 */ bl func_800972CC
lbl_0x00000958:
/* 00000958 3C600000 */ lis r3, controllerInfo@ha
/* 0000095C 38630000 */ addi r3, r3, controllerInfo@l
/* 00000960 A0630018 */ lhz r3, 0x18(r3)
/* 00000964 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00000968 4082001C */ bne lbl_0x00000984
/* 0000096C 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00000970 40820014 */ bne lbl_0x00000984
/* 00000974 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00000978 4082000C */ bne lbl_0x00000984
/* 0000097C 54600529 */ rlwinm. r0, r3, 0, 0x14, 0x14
/* 00000980 41820084 */ beq lbl_0x00000A04
lbl_0x00000984:
/* 00000984 3C600000 */ lis r3, controllerInfo@ha
/* 00000988 38630000 */ addi r3, r3, controllerInfo@l
/* 0000098C A0630000 */ lhz r3, 0(r3)
/* 00000990 54600529 */ rlwinm. r0, r3, 0, 0x14, 0x14
/* 00000994 41820014 */ beq lbl_0x000009A8
/* 00000998 3C600000 */ lis r3, lbl_80206BC0@ha
/* 0000099C 38000003 */ li r0, 3
/* 000009A0 90030000 */ stw r0, lbl_80206BC0@l(r3)
/* 000009A4 48000040 */ b lbl_0x000009E4
lbl_0x000009A8:
/* 000009A8 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 000009AC 41820014 */ beq lbl_0x000009C0
/* 000009B0 3C600000 */ lis r3, lbl_80206BC0@ha
/* 000009B4 38000002 */ li r0, 2
/* 000009B8 90030000 */ stw r0, lbl_80206BC0@l(r3)
/* 000009BC 48000028 */ b lbl_0x000009E4
lbl_0x000009C0:
/* 000009C0 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 000009C4 41820014 */ beq lbl_0x000009D8
/* 000009C8 3C600000 */ lis r3, lbl_80206BC0@ha
/* 000009CC 38000001 */ li r0, 1
/* 000009D0 90030000 */ stw r0, lbl_80206BC0@l(r3)
/* 000009D4 48000010 */ b lbl_0x000009E4
lbl_0x000009D8:
/* 000009D8 3C600000 */ lis r3, lbl_80206BC0@ha
/* 000009DC 38000000 */ li r0, 0
/* 000009E0 90030000 */ stw r0, lbl_80206BC0@l(r3)
lbl_0x000009E4:
/* 000009E4 480002B5 */ bl lbl_0x00000C98
/* 000009E8 3C600000 */ lis r3, gameModeRequest@ha
/* 000009EC 38830000 */ addi r4, r3, gameModeRequest@l
/* 000009F0 38000002 */ li r0, 2
/* 000009F4 B0040000 */ sth r0, 0(r4)
/* 000009F8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000009FC 3800003C */ li r0, 0x3c
/* 00000A00 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_0x00000A04:
/* 00000A04 8001001C */ lwz r0, 0x1c(r1)
/* 00000A08 83E10014 */ lwz r31, 0x14(r1)
/* 00000A0C 83C10010 */ lwz r30, 0x10(r1)
/* 00000A10 7C0803A6 */ mtlr r0
/* 00000A14 83A1000C */ lwz r29, 0xc(r1)
/* 00000A18 83810008 */ lwz r28, 8(r1)
/* 00000A1C 38210018 */ addi r1, r1, 0x18
/* 00000A20 4E800020 */ blr 
lbl_0x00000A24:
/* 00000A24 7C0802A6 */ mflr r0
/* 00000A28 3C600000 */ lis r3, lbl_00000F38@ha
/* 00000A2C 90010004 */ stw r0, 4(r1)
/* 00000A30 9421FFF0 */ stwu r1, -0x10(r1)
/* 00000A34 93E1000C */ stw r31, 0xc(r1)
/* 00000A38 3BE30000 */ addi r31, r3, lbl_00000F38@l
/* 00000A3C 3C600000 */ lis r3, lbl_00000E48@ha
/* 00000A40 93C10008 */ stw r30, 8(r1)
/* 00000A44 3BC30000 */ addi r30, r3, lbl_00000E48@l
/* 00000A48 4BFFF6CD */ bl create_sprite
/* 00000A4C 7C661B79 */ or. r6, r3, r3
/* 00000A50 41820030 */ beq lbl_0x00000A80
/* 00000A54 C01E0000 */ lfs f0, 0(r30)
/* 00000A58 38A00064 */ li r5, 0x64
/* 00000A5C 38000004 */ li r0, 4
/* 00000A60 D0060004 */ stfs f0, 4(r6)
/* 00000A64 389F0000 */ addi r4, r31, 0
/* 00000A68 3866008C */ addi r3, r6, 0x8c
/* 00000A6C C01E0004 */ lfs f0, 4(r30)
/* 00000A70 D0060008 */ stfs f0, 8(r6)
/* 00000A74 98A60001 */ stb r5, 1(r6)
/* 00000A78 98060003 */ stb r0, 3(r6)
/* 00000A7C 4BFFF699 */ bl strcpy
lbl_0x00000A80:
/* 00000A80 4BFFF695 */ bl create_sprite
/* 00000A84 7C681B79 */ or. r8, r3, r3
/* 00000A88 41820060 */ beq lbl_0x00000AE8
/* 00000A8C C01E0008 */ lfs f0, 8(r30)
/* 00000A90 3C800000 */ lis r4, lbl_00000B54@ha
/* 00000A94 3C600000 */ lis r3, modeCtrl@ha
/* 00000A98 4CC63182 */ crclr 6
/* 00000A9C D0080004 */ stfs f0, 4(r8)
/* 00000AA0 38E0005D */ li r7, 0x5d
/* 00000AA4 C01E000C */ lfs f0, 0xc(r30)
/* 00000AA8 38C00004 */ li r6, 4
/* 00000AAC 38040000 */ addi r0, r4, lbl_00000B54@l
/* 00000AB0 D0080008 */ stfs f0, 8(r8)
/* 00000AB4 38A30000 */ addi r5, r3, modeCtrl@l
/* 00000AB8 3868008C */ addi r3, r8, 0x8c
/* 00000ABC 98E80001 */ stb r7, 1(r8)
/* 00000AC0 389F0010 */ addi r4, r31, 0x10
/* 00000AC4 98C80003 */ stb r6, 3(r8)
/* 00000AC8 C01E0010 */ lfs f0, 0x10(r30)
/* 00000ACC D0080040 */ stfs f0, 0x40(r8)
/* 00000AD0 C01E0010 */ lfs f0, 0x10(r30)
/* 00000AD4 D0080044 */ stfs f0, 0x44(r8)
/* 00000AD8 90080034 */ stw r0, 0x34(r8)
/* 00000ADC 80A50004 */ lwz r5, 4(r5)
/* 00000AE0 38A50004 */ addi r5, r5, 4
/* 00000AE4 4BFFF631 */ bl sprintf
lbl_0x00000AE8:
/* 00000AE8 4BFFF62D */ bl create_sprite
/* 00000AEC 7C681B79 */ or. r8, r3, r3
/* 00000AF0 4182004C */ beq lbl_0x00000B3C
/* 00000AF4 C01E0014 */ lfs f0, 0x14(r30)
/* 00000AF8 3C800000 */ lis r4, lbl_00000BC4@ha
/* 00000AFC 3C600000 */ lis r3, currStageId@ha
/* 00000B00 4CC63182 */ crclr 6
/* 00000B04 D0080004 */ stfs f0, 4(r8)
/* 00000B08 38E00064 */ li r7, 0x64
/* 00000B0C C01E0018 */ lfs f0, 0x18(r30)
/* 00000B10 38C00001 */ li r6, 1
/* 00000B14 38040000 */ addi r0, r4, lbl_00000BC4@l
/* 00000B18 D0080008 */ stfs f0, 8(r8)
/* 00000B1C 38A30000 */ addi r5, r3, currStageId@l
/* 00000B20 3868008C */ addi r3, r8, 0x8c
/* 00000B24 98E80001 */ stb r7, 1(r8)
/* 00000B28 389F0014 */ addi r4, r31, 0x14
/* 00000B2C 98C80003 */ stb r6, 3(r8)
/* 00000B30 90080034 */ stw r0, 0x34(r8)
/* 00000B34 A8A50000 */ lha r5, 0(r5)
/* 00000B38 4BFFF5DD */ bl sprintf
lbl_0x00000B3C:
/* 00000B3C 80010014 */ lwz r0, 0x14(r1)
/* 00000B40 83E1000C */ lwz r31, 0xc(r1)
/* 00000B44 83C10008 */ lwz r30, 8(r1)
/* 00000B48 7C0803A6 */ mtlr r0
/* 00000B4C 38210010 */ addi r1, r1, 0x10
/* 00000B50 4E800020 */ blr 
lbl_00000B54:
/* 00000B54 7C0802A6 */ mflr r0
/* 00000B58 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 00000B5C 90010004 */ stw r0, 4(r1)
/* 00000B60 9421FFF8 */ stwu r1, -8(r1)
/* 00000B64 80030000 */ lwz r0, lbl_802F1BE0@l(r3)
/* 00000B68 2C000000 */ cmpwi r0, 0
/* 00000B6C 40820014 */ bne lbl_0x00000B80
/* 00000B70 3C600000 */ lis r3, lbl_00000E80@ha
/* 00000B74 C0030000 */ lfs f0, lbl_00000E80@l(r3)
/* 00000B78 D004006C */ stfs f0, 0x6c(r4)
/* 00000B7C 48000038 */ b lbl_0x00000BB4
lbl_0x00000B80:
/* 00000B80 3C600000 */ lis r3, lbl_00000E84@ha
/* 00000B84 4CC63182 */ crclr 6
/* 00000B88 C0030000 */ lfs f0, lbl_00000E84@l(r3)
/* 00000B8C 3C600000 */ lis r3, modeCtrl@ha
/* 00000B90 3CA00000 */ lis r5, lbl_00000F48@ha
/* 00000B94 D004006C */ stfs f0, 0x6c(r4)
/* 00000B98 38630000 */ addi r3, r3, modeCtrl@l
/* 00000B9C 38050000 */ addi r0, r5, lbl_00000F48@l
/* 00000BA0 80A30004 */ lwz r5, 4(r3)
/* 00000BA4 3864008C */ addi r3, r4, 0x8c
/* 00000BA8 7C040378 */ mr r4, r0
/* 00000BAC 38A50004 */ addi r5, r5, 4
/* 00000BB0 4BFFF565 */ bl sprintf
lbl_0x00000BB4:
/* 00000BB4 8001000C */ lwz r0, 0xc(r1)
/* 00000BB8 38210008 */ addi r1, r1, 8
/* 00000BBC 7C0803A6 */ mtlr r0
/* 00000BC0 4E800020 */ blr 
lbl_00000BC4:
/* 00000BC4 7C0802A6 */ mflr r0
/* 00000BC8 3C600000 */ lis r3, lbl_802F1BE0@ha
/* 00000BCC 90010004 */ stw r0, 4(r1)
/* 00000BD0 38A30000 */ addi r5, r3, lbl_802F1BE0@l
/* 00000BD4 3C600000 */ lis r3, lbl_00000F38@ha
/* 00000BD8 9421FFF8 */ stwu r1, -8(r1)
/* 00000BDC 38E30000 */ addi r7, r3, lbl_00000F38@l
/* 00000BE0 80050000 */ lwz r0, 0(r5)
/* 00000BE4 2C000000 */ cmpwi r0, 0
/* 00000BE8 40820020 */ bne lbl_0x00000C08
/* 00000BEC 3C600000 */ lis r3, loadingStageId@ha
/* 00000BF0 4CC63182 */ crclr 6
/* 00000BF4 A8A30000 */ lha r5, loadingStageId@l(r3)
/* 00000BF8 3864008C */ addi r3, r4, 0x8c
/* 00000BFC 38870014 */ addi r4, r7, 0x14
/* 00000C00 4BFFF515 */ bl sprintf
/* 00000C04 4800007C */ b lbl_0x00000C80
lbl_0x00000C08:
/* 00000C08 3C600000 */ lis r3, modeCtrl@ha
/* 00000C0C 38630000 */ addi r3, r3, modeCtrl@l
/* 00000C10 80630008 */ lwz r3, 8(r3)
/* 00000C14 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00000C18 41820024 */ beq lbl_0x00000C3C
/* 00000C1C 3C600000 */ lis r3, loadingStageId@ha
/* 00000C20 80A50004 */ lwz r5, 4(r5)
/* 00000C24 A8C30000 */ lha r6, loadingStageId@l(r3)
/* 00000C28 3864008C */ addi r3, r4, 0x8c
/* 00000C2C 4CC63182 */ crclr 6
/* 00000C30 38870020 */ addi r4, r7, 0x20
/* 00000C34 4BFFF4E1 */ bl sprintf
/* 00000C38 48000048 */ b lbl_0x00000C80
lbl_0x00000C3C:
/* 00000C3C 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00000C40 41820024 */ beq lbl_0x00000C64
/* 00000C44 3C600000 */ lis r3, loadingStageId@ha
/* 00000C48 80A50004 */ lwz r5, 4(r5)
/* 00000C4C A8C30000 */ lha r6, loadingStageId@l(r3)
/* 00000C50 3864008C */ addi r3, r4, 0x8c
/* 00000C54 4CC63182 */ crclr 6
/* 00000C58 3887003C */ addi r4, r7, 0x3c
/* 00000C5C 4BFFF4B9 */ bl sprintf
/* 00000C60 48000020 */ b lbl_0x00000C80
lbl_0x00000C64:
/* 00000C64 3C600000 */ lis r3, loadingStageId@ha
/* 00000C68 80A50004 */ lwz r5, 4(r5)
/* 00000C6C A8C30000 */ lha r6, loadingStageId@l(r3)
/* 00000C70 3864008C */ addi r3, r4, 0x8c
/* 00000C74 4CC63182 */ crclr 6
/* 00000C78 38870054 */ addi r4, r7, 0x54
/* 00000C7C 4BFFF499 */ bl sprintf
lbl_0x00000C80:
/* 00000C80 8001000C */ lwz r0, 0xc(r1)
/* 00000C84 38210008 */ addi r1, r1, 8
/* 00000C88 7C0803A6 */ mtlr r0
/* 00000C8C 4E800020 */ blr 
lbl_0x00000C90:
/* 00000C90 4E800020 */ blr 
lbl_0x00000C94:
/* 00000C94 4E800020 */ blr 
lbl_0x00000C98:
/* 00000C98 4E800020 */ blr 
lbl_00000C9C:
/* 00000C9C 7C0802A6 */ mflr r0
/* 00000CA0 3C600000 */ lis r3, lbl_00000E88@ha
/* 00000CA4 90010004 */ stw r0, 4(r1)
/* 00000CA8 9421FFD8 */ stwu r1, -0x28(r1)
/* 00000CAC BF010008 */ stmw r24, 8(r1)
/* 00000CB0 3BE30000 */ addi r31, r3, lbl_00000E88@l
/* 00000CB4 4BFFF461 */ bl func_80054FF0
/* 00000CB8 4BFFF45D */ bl func_80047530
/* 00000CBC 4BFFF459 */ bl mathutil_mtxA_from_mtxB
/* 00000CC0 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00000CC4 3B830000 */ addi r28, r3, decodedStageLzPtr@l
/* 00000CC8 807C0000 */ lwz r3, 0(r28)
/* 00000CCC 80630010 */ lwz r3, 0x10(r3)
/* 00000CD0 4BFFF445 */ bl mathutil_mtxA_translate
/* 00000CD4 3C600000 */ lis r3, lbl_802F1B34@ha
/* 00000CD8 3BA30000 */ addi r29, r3, lbl_802F1B34@l
/* 00000CDC 801D0000 */ lwz r0, 0(r29)
/* 00000CE0 5403482C */ slwi r3, r0, 9
/* 00000CE4 4BFFF431 */ bl mathutil_mtxA_rotate_y
/* 00000CE8 C03F0000 */ lfs f1, 0(r31)
/* 00000CEC FC400890 */ fmr f2, f1
/* 00000CF0 FC600890 */ fmr f3, f1
/* 00000CF4 4BFFF421 */ bl mathutil_mtxA_scale_xyz
/* 00000CF8 C03F0000 */ lfs f1, 0(r31)
/* 00000CFC 4BFFF419 */ bl func_80030BA8
/* 00000D00 3C600000 */ lis r3, lbl_802F1B04@ha
/* 00000D04 3BC30000 */ addi r30, r3, lbl_802F1B04@l
/* 00000D08 807E0000 */ lwz r3, 0(r30)
/* 00000D0C 8063002C */ lwz r3, 0x2c(r3)
/* 00000D10 4BFFF405 */ bl func_80031210
/* 00000D14 807C0000 */ lwz r3, 0(r28)
/* 00000D18 3B400000 */ li r26, 0
/* 00000D1C 8363000C */ lwz r27, 0xc(r3)
/* 00000D20 4800005C */ b lbl_0x00000D7C
lbl_0x00000D24:
/* 00000D24 833B0040 */ lwz r25, 0x40(r27)
/* 00000D28 3B000000 */ li r24, 0
/* 00000D2C 4800003C */ b lbl_0x00000D68
lbl_0x00000D30:
/* 00000D30 4BFFF3E5 */ bl mathutil_mtxA_from_mtxB
/* 00000D34 7F23CB78 */ mr r3, r25
/* 00000D38 4BFFF3DD */ bl mathutil_mtxA_translate
/* 00000D3C C03F0004 */ lfs f1, 4(r31)
/* 00000D40 C05F0008 */ lfs f2, 8(r31)
/* 00000D44 FC600890 */ fmr f3, f1
/* 00000D48 4BFFF3CD */ bl mathutil_mtxA_translate_xyz
/* 00000D4C 801D0000 */ lwz r0, 0(r29)
/* 00000D50 5403482C */ slwi r3, r0, 9
/* 00000D54 4BFFF3C1 */ bl mathutil_mtxA_rotate_y
/* 00000D58 807E0000 */ lwz r3, 0(r30)
/* 00000D5C 80630020 */ lwz r3, 0x20(r3)
/* 00000D60 4BFFF3B5 */ bl func_80031210
/* 00000D64 3B180001 */ addi r24, r24, 1
lbl_0x00000D68:
/* 00000D68 801B003C */ lwz r0, 0x3c(r27)
/* 00000D6C 7C180000 */ cmpw r24, r0
/* 00000D70 4180FFC0 */ blt lbl_0x00000D30
/* 00000D74 3B5A0001 */ addi r26, r26, 1
/* 00000D78 3B7B00C4 */ addi r27, r27, 0xc4
lbl_0x00000D7C:
/* 00000D7C 807C0000 */ lwz r3, 0(r28)
/* 00000D80 80030008 */ lwz r0, 8(r3)
/* 00000D84 7C1A0000 */ cmpw r26, r0
/* 00000D88 4180FF9C */ blt lbl_0x00000D24
/* 00000D8C 3C600000 */ lis r3, controllerInfo@ha
/* 00000D90 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 00000D94 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 00000D98 40820090 */ bne lbl_0x00000E28
/* 00000D9C 3C600000 */ lis r3, eventInfo@ha
/* 00000DA0 38630000 */ addi r3, r3, eventInfo@l
/* 00000DA4 880301C8 */ lbz r0, 0x1c8(r3)
/* 00000DA8 2C000002 */ cmpwi r0, 2
/* 00000DAC 40820018 */ bne lbl_0x00000DC4
/* 00000DB0 C03F000C */ lfs f1, 0xc(r31)
/* 00000DB4 4BFFF361 */ bl func_80085678
/* 00000DB8 4BFFF35D */ bl background_draw
/* 00000DBC C03F0004 */ lfs f1, 4(r31)
/* 00000DC0 4BFFF355 */ bl func_80085678
lbl_0x00000DC4:
/* 00000DC4 3C600000 */ lis r3, eventInfo@ha
/* 00000DC8 38630000 */ addi r3, r3, eventInfo@l
/* 00000DCC 880301E0 */ lbz r0, 0x1e0(r3)
/* 00000DD0 2C000002 */ cmpwi r0, 2
/* 00000DD4 4082000C */ bne lbl_0x00000DE0
/* 00000DD8 38600010 */ li r3, 0x10
/* 00000DDC 4BFFF339 */ bl func_80095398
lbl_0x00000DE0:
/* 00000DE0 3C600000 */ lis r3, eventInfo@ha
/* 00000DE4 38630000 */ addi r3, r3, eventInfo@l
/* 00000DE8 88030078 */ lbz r0, 0x78(r3)
/* 00000DEC 2C000002 */ cmpwi r0, 2
/* 00000DF0 40820008 */ bne lbl_0x00000DF8
/* 00000DF4 4BFFF321 */ bl func_80068370
lbl_0x00000DF8:
/* 00000DF8 3C600000 */ lis r3, eventInfo@ha
/* 00000DFC 38630000 */ addi r3, r3, eventInfo@l
/* 00000E00 88030060 */ lbz r0, 0x60(r3)
/* 00000E04 2C000002 */ cmpwi r0, 2
/* 00000E08 40820008 */ bne lbl_0x00000E10
/* 00000E0C 4BFFF309 */ bl func_8006B198
lbl_0x00000E10:
/* 00000E10 3C600000 */ lis r3, eventInfo@ha
/* 00000E14 38630000 */ addi r3, r3, eventInfo@l
/* 00000E18 88030138 */ lbz r0, 0x138(r3)
/* 00000E1C 2C000002 */ cmpwi r0, 2
/* 00000E20 40820008 */ bne lbl_0x00000E28
/* 00000E24 4BFFF2F1 */ bl func_8004CD60
lbl_0x00000E28:
/* 00000E28 BB010008 */ lmw r24, 8(r1)
/* 00000E2C 8001002C */ lwz r0, 0x2c(r1)
/* 00000E30 38210028 */ addi r1, r1, 0x28
/* 00000E34 7C0803A6 */ mtlr r0
/* 00000E38 4E800020 */ blr 

# 2
.section .ctors
    # 0xE3C

# 3
.section .dtors
    # 0xE40

# 4
.section .rodata
    .balign 8

lbl_00000E48:
    # 0xE48
    .4byte 0x43A00000
    .4byte 0x42600000
    .4byte 0x42480000
    .4byte 0x42B40000
    .4byte 0x3F000000
    .4byte 0x42200000
    .4byte 0x43000000
    .4byte 0x00000000
    .4byte 0x3FA99999
    .4byte 0x9999999A
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x43300000
    .4byte 0x80000000
lbl_00000E80:
    # 0xE80
    .4byte 0x00000000
lbl_00000E84:
    # 0xE84
    .4byte 0x3F800000
lbl_00000E88:
    # 0xE88
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x43C80000

# 5
.section .data
lbl_00000E98:
    # 0xE98
    .asciz "\nError: A called an unlinked function.\n"
    .balign 4
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .balign 4
    .asciz "sel_stage_rel.c"
    .balign 4
    .4byte 0x0A000000
lbl_00000F18:
    # 0xF18
    .4byte lbl_00000468
    .4byte lbl_0000058C
    .4byte lbl_000005C8
    .4byte lbl_00000604
    .4byte lbl_00000640
    .4byte lbl_0000067C
    .4byte lbl_000006B8
    .4byte lbl_000006F4
lbl_00000F38:
    # 0xF38
    .asciz "SELECT A STAGE"
    .balign 4
lbl_00000F48:
    # 0xF48
    .4byte 0x25640000
    .asciz "STAGE %d"
    .balign 4
    .asciz "EXTRA 2\nFLOOR %d\nLIB. %d"
    .balign 4
    .asciz "EXTRA\nFLOOR %d\nLIB. %d"
    .balign 4
    .asciz "FLOOR %d\nLIB. %d"

# 6
.section .bss
lbl_0000185D:
    .skip 0x4

