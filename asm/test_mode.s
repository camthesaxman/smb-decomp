# id: 10
# version: 1
# nameoffset: 0x138, size: 0x1F
# section table: 0x40, size: 0x90
# imp table: 0x1EC0D
# relocs offset: 0x15B05
# _prolog:     1:0x0
# _epilog:     1:0x48
# _unresolved: 1:0x8C
# num sections: 18
.include "macros.inc"
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x0000FD9C	flags: 1
# offset: 0x0000FE6C	length: 0x00000004	flags: 0
# offset: 0x0000FE70	length: 0x00000004	flags: 0
# offset: 0x0000FE78	length: 0x00000434	flags: 0
# offset: 0x000102B0	length: 0x00005855	flags: 0
# offset: 0x10000000	length: 0x00003CC6	flags: 0
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
/* 000000D4 3C600000 */ lis r3, lbl_00010350@ha
/* 000000D8 90010004 */ stw r0, 4(r1)
/* 000000DC 3CE00000 */ lis r7, lbl_00000208@ha
/* 000000E0 3CC00000 */ lis r6, lbl_802F1B74@ha
/* 000000E4 9421FFF8 */ stwu r1, -8(r1)
/* 000000E8 38070000 */ addi r0, r7, lbl_00000208@l
/* 000000EC 3CA00000 */ lis r5, lbl_00009060@ha
/* 000000F0 90060000 */ stw r0, lbl_802F1B74@l(r6)
/* 000000F4 3C800000 */ lis r4, lbl_802F1B70@ha
/* 000000F8 38050000 */ addi r0, r5, lbl_00009060@l
/* 000000FC 90040000 */ stw r0, lbl_802F1B70@l(r4)
/* 00000100 38630000 */ addi r3, r3, lbl_00010350@l
/* 00000104 48000059 */ bl puts
/* 00000108 8001000C */ lwz r0, 0xc(r1)
/* 0000010C 38210008 */ addi r1, r1, 8
/* 00000110 7C0803A6 */ mtlr r0
/* 00000114 4E800020 */ blr 
.global _epilog
_epilog:
/* 00000118 7C0802A6 */ mflr r0
/* 0000011C 3C600000 */ lis r3, lbl_802F1B74@ha
/* 00000120 90010004 */ stw r0, 4(r1)
/* 00000124 38830000 */ addi r4, r3, lbl_802F1B74@l
/* 00000128 38000000 */ li r0, 0
/* 0000012C 9421FFF8 */ stwu r1, -8(r1)
/* 00000130 3C600000 */ lis r3, lbl_802F1B70@ha
/* 00000134 90040000 */ stw r0, 0(r4)
/* 00000138 38830000 */ addi r4, r3, lbl_802F1B70@l
/* 0000013C 3C600000 */ lis r3, lbl_00010364@ha
/* 00000140 90040000 */ stw r0, 0(r4)
/* 00000144 38630000 */ addi r3, r3, lbl_00010364@l
/* 00000148 48000015 */ bl puts
/* 0000014C 8001000C */ lwz r0, 0xc(r1)
/* 00000150 38210008 */ addi r1, r1, 8
/* 00000154 7C0803A6 */ mtlr r0
/* 00000158 4E800020 */ blr 
.global _unresolved
_unresolved:
/* 0000015C 7C0802A6 */ mflr r0
/* 00000160 3C600000 */ lis r3, lbl_000102B0@ha
/* 00000164 90010004 */ stw r0, 4(r1)
/* 00000168 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000016C 93E10014 */ stw r31, 0x14(r1)
/* 00000170 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 00000174 387F00C8 */ addi r3, r31, 0xc8
/* 00000178 93C10010 */ stw r30, 0x10(r1)
/* 0000017C 93A1000C */ stw r29, 0xc(r1)
/* 00000180 4BFFFFDD */ bl puts
/* 00000184 387F00F0 */ addi r3, r31, 0xf0
/* 00000188 4BFFFFD5 */ bl puts
/* 0000018C 3BC00000 */ li r30, 0
/* 00000190 4BFFFFCD */ bl OSGetStackPointer
/* 00000194 7C7D1B78 */ mr r29, r3
/* 00000198 48000020 */ b lbl_000001B8
lbl_0000019C:
/* 0000019C 80BD0000 */ lwz r5, 0(r29)
/* 000001A0 7FA4EB78 */ mr r4, r29
/* 000001A4 80DD0004 */ lwz r6, 4(r29)
/* 000001A8 387F0118 */ addi r3, r31, 0x118
/* 000001AC 4CC63182 */ crclr 6
/* 000001B0 4BFFFFAD */ bl printf
/* 000001B4 83BD0000 */ lwz r29, 0(r29)
lbl_000001B8:
/* 000001B8 281D0000 */ cmplwi r29, 0
/* 000001BC 4182001C */ beq lbl_000001D8
/* 000001C0 3C1D0001 */ addis r0, r29, 1
/* 000001C4 2800FFFF */ cmplwi r0, 0xffff
/* 000001C8 41820010 */ beq lbl_000001D8
/* 000001CC 281E0010 */ cmplwi r30, 0x10
/* 000001D0 3BDE0001 */ addi r30, r30, 1
/* 000001D4 4180FFC8 */ blt lbl_0000019C
lbl_000001D8:
/* 000001D8 387F0134 */ addi r3, r31, 0x134
/* 000001DC 4CC63182 */ crclr 6
/* 000001E0 38BF0140 */ addi r5, r31, 0x140
/* 000001E4 3880009A */ li r4, 0x9a
/* 000001E8 4BFFFF75 */ bl OSPanic
/* 000001EC 8001001C */ lwz r0, 0x1c(r1)
/* 000001F0 83E10014 */ lwz r31, 0x14(r1)
/* 000001F4 83C10010 */ lwz r30, 0x10(r1)
/* 000001F8 7C0803A6 */ mtlr r0
/* 000001FC 83A1000C */ lwz r29, 0xc(r1)
/* 00000200 38210018 */ addi r1, r1, 0x18
/* 00000204 4E800020 */ blr 
lbl_00000208:
/* 00000208 7C0802A6 */ mflr r0
/* 0000020C 3C600000 */ lis r3, gameSubmode@ha
/* 00000210 90010004 */ stw r0, 4(r1)
/* 00000214 9421FFF8 */ stwu r1, -8(r1)
/* 00000218 A8830000 */ lha r4, gameSubmode@l(r3)
/* 0000021C 2C04005E */ cmpwi r4, 0x5e
/* 00000220 4081000C */ ble lbl_0000022C
/* 00000224 2C04008E */ cmpwi r4, 0x8e
/* 00000228 41800018 */ blt lbl_00000240
lbl_0000022C:
/* 0000022C 3C600000 */ lis r3, lbl_000103F4@ha
/* 00000230 4CC63182 */ crclr 6
/* 00000234 38630000 */ addi r3, r3, lbl_000103F4@l
/* 00000238 4BFFFF25 */ bl printf
/* 0000023C 48000024 */ b lbl_00000260
lbl_00000240:
/* 00000240 3804FFA1 */ addi r0, r4, -95  ;# fixed addi
/* 00000244 3C600000 */ lis r3, lbl_000102B0@ha
/* 00000248 5404103A */ slwi r4, r0, 2
/* 0000024C 38030000 */ addi r0, r3, lbl_000102B0@l
/* 00000250 7C602214 */ add r3, r0, r4
/* 00000254 81830000 */ lwz r12, 0(r3)
/* 00000258 7D8803A6 */ mtlr r12
/* 0000025C 4E800021 */ blrl 
lbl_00000260:
/* 00000260 8001000C */ lwz r0, 0xc(r1)
/* 00000264 38210008 */ addi r1, r1, 8
/* 00000268 7C0803A6 */ mtlr r0
/* 0000026C 4E800020 */ blr 

.global lbl_00000270
lbl_00000270:
/* 00000270 7C0802A6 */ mflr r0
/* 00000274 3C600000 */ lis r3, lbl_802F2130@ha
/* 00000278 90010004 */ stw r0, 4(r1)
/* 0000027C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00000280 93E1000C */ stw r31, 0xc(r1)
/* 00000284 3BE00000 */ li r31, 0
/* 00000288 93E30000 */ stw r31, lbl_802F2130@l(r3)
/* 0000028C 4BFFFED1 */ bl camera_setup_singleplayer_viewport
/* 00000290 4800B1BD */ bl lbl_0000B44C
/* 00000294 4800BD0D */ bl lbl_0000BFA0
/* 00000298 48009229 */ bl lbl_000094C0
/* 0000029C 48001E6D */ bl lbl_00002108
/* 000002A0 480024C1 */ bl lbl_00002760
/* 000002A4 38600000 */ li r3, 0
/* 000002A8 38800000 */ li r4, 0
/* 000002AC 38A00001 */ li r5, 1
/* 000002B0 4BFFFEAD */ bl g_start_screen_fade
/* 000002B4 3860FFFF */ li r3, -1
/* 000002B8 38800001 */ li r4, 1
/* 000002BC 4BFFFEA1 */ bl g_play_music
/* 000002C0 3860000E */ li r3, 0xe
/* 000002C4 4BFFFE99 */ bl bitmap_free_group
/* 000002C8 4BFFFE95 */ bl func_800249D4
/* 000002CC 4BFFFE91 */ bl unload_stage
/* 000002D0 4BFFFE8D */ bl event_finish_all
/* 000002D4 38600000 */ li r3, 0
/* 000002D8 4BFFFE85 */ bl func_80021DB4
/* 000002DC 3C600000 */ lis r3, lbl_10000000@ha
/* 000002E0 38830000 */ addi r4, r3, lbl_10000000@l
/* 000002E4 93E40000 */ stw r31, 0(r4)
/* 000002E8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000002EC 38000060 */ li r0, 0x60
/* 000002F0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000002F4 80010014 */ lwz r0, 0x14(r1)
/* 000002F8 83E1000C */ lwz r31, 0xc(r1)
/* 000002FC 38210010 */ addi r1, r1, 0x10
/* 00000300 7C0803A6 */ mtlr r0
/* 00000304 4E800020 */ blr 
lbl_00000308:
/* 00000308 3C600000 */ lis r3, controllerInfo@ha
/* 0000030C 38E30000 */ addi r7, r3, controllerInfo@l
/* 00000310 A0670030 */ lhz r3, 0x30(r7)
/* 00000314 3C800000 */ lis r4, lbl_10000000@ha
/* 00000318 38840000 */ addi r4, r4, lbl_10000000@l
/* 0000031C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00000320 80840000 */ lwz r4, 0(r4)
/* 00000324 3CA00000 */ lis r5, lbl_000102B0@ha
/* 00000328 38050000 */ addi r0, r5, lbl_000102B0@l
/* 0000032C 40820044 */ bne lbl_00000370
/* 00000330 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000334 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00000338 A0A60008 */ lhz r5, 8(r6)
/* 0000033C 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00000340 40820030 */ bne lbl_00000370
/* 00000344 A0A70000 */ lhz r5, 0(r7)
/* 00000348 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 0000034C 40820010 */ bne lbl_0000035C
/* 00000350 A0A60000 */ lhz r5, 0(r6)
/* 00000354 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00000358 4182003C */ beq lbl_00000394
lbl_0000035C:
/* 0000035C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000360 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00000364 A0A50000 */ lhz r5, 0(r5)
/* 00000368 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 0000036C 41820028 */ beq lbl_00000394
lbl_00000370:
/* 00000370 38840001 */ addi r4, r4, 1
/* 00000374 2804001B */ cmplwi r4, 0x1b
/* 00000378 41800008 */ blt lbl_00000380
/* 0000037C 38800000 */ li r4, 0
lbl_00000380:
/* 00000380 1CA4000C */ mulli r5, r4, 0xc
/* 00000384 7CA02A14 */ add r5, r0, r5
/* 00000388 80A5027C */ lwz r5, 0x27c(r5)
/* 0000038C 2C050003 */ cmpwi r5, 3
/* 00000390 4182FFE0 */ beq lbl_00000370
lbl_00000394:
/* 00000394 54650739 */ rlwinm. r5, r3, 0, 0x1c, 0x1c
/* 00000398 4082004C */ bne lbl_000003E4
/* 0000039C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000003A0 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 000003A4 A0A60008 */ lhz r5, 8(r6)
/* 000003A8 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 000003AC 40820038 */ bne lbl_000003E4
/* 000003B0 3CA00000 */ lis r5, controllerInfo@ha
/* 000003B4 38A50000 */ addi r5, r5, controllerInfo@l
/* 000003B8 A0A50000 */ lhz r5, 0(r5)
/* 000003BC 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 000003C0 40820010 */ bne lbl_000003D0
/* 000003C4 A0A60000 */ lhz r5, 0(r6)
/* 000003C8 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 000003CC 41820038 */ beq lbl_00000404
lbl_000003D0:
/* 000003D0 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000003D4 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 000003D8 A0A50000 */ lhz r5, 0(r5)
/* 000003DC 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 000003E0 41820024 */ beq lbl_00000404
lbl_000003E4:
/* 000003E4 3484FFFF */ addic. r4, r4, -1  ;# fixed addi
/* 000003E8 40800008 */ bge lbl_000003F0
/* 000003EC 3880001A */ li r4, 0x1a
lbl_000003F0:
/* 000003F0 1CA4000C */ mulli r5, r4, 0xc
/* 000003F4 7CA02A14 */ add r5, r0, r5
/* 000003F8 80A5027C */ lwz r5, 0x27c(r5)
/* 000003FC 2C050003 */ cmpwi r5, 3
/* 00000400 4182FFE4 */ beq lbl_000003E4
lbl_00000404:
/* 00000404 1CA4000C */ mulli r5, r4, 0xc
/* 00000408 3CC00000 */ lis r6, lbl_10000000@ha
/* 0000040C 90860000 */ stw r4, lbl_10000000@l(r6)
/* 00000410 7CA02A14 */ add r5, r0, r5
/* 00000414 8405027C */ lwzu r0, 0x27c(r5)
/* 00000418 2C000001 */ cmpwi r0, 1
/* 0000041C 41820048 */ beq lbl_00000464
/* 00000420 40800010 */ bge lbl_00000430
/* 00000424 2C000000 */ cmpwi r0, 0
/* 00000428 40800014 */ bge lbl_0000043C
/* 0000042C 4E800020 */ blr 
lbl_00000430:
/* 00000430 2C000003 */ cmpwi r0, 3
/* 00000434 4C800020 */ bgelr 
/* 00000438 48000114 */ b lbl_0000054C
lbl_0000043C:
/* 0000043C 3C600000 */ lis r3, controllerInfo@ha
/* 00000440 38630000 */ addi r3, r3, controllerInfo@l
/* 00000444 A0030018 */ lhz r0, 0x18(r3)
/* 00000448 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000044C 4D820020 */ beqlr 
/* 00000450 80050008 */ lwz r0, 8(r5)
/* 00000454 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000458 7C000734 */ extsh r0, r0
/* 0000045C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000460 4E800020 */ blr 
lbl_00000464:
/* 00000464 3C800000 */ lis r4, loadingStageIdRequest@ha
/* 00000468 38A40000 */ addi r5, r4, loadingStageIdRequest@l
/* 0000046C 546407FF */ clrlwi. r4, r3, 0x1f
/* 00000470 A8050000 */ lha r0, 0(r5)
/* 00000474 7C040378 */ mr r4, r0
/* 00000478 4082004C */ bne lbl_000004C4
/* 0000047C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000480 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00000484 A0A60008 */ lhz r5, 8(r6)
/* 00000488 54A507FF */ clrlwi. r5, r5, 0x1f
/* 0000048C 40820038 */ bne lbl_000004C4
/* 00000490 3CA00000 */ lis r5, controllerInfo@ha
/* 00000494 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000498 A0A50000 */ lhz r5, 0(r5)
/* 0000049C 54A507FF */ clrlwi. r5, r5, 0x1f
/* 000004A0 40820010 */ bne lbl_000004B0
/* 000004A4 A0A60000 */ lhz r5, 0(r6)
/* 000004A8 54A507FF */ clrlwi. r5, r5, 0x1f
/* 000004AC 41820028 */ beq lbl_000004D4
lbl_000004B0:
/* 000004B0 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000004B4 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 000004B8 A0A50000 */ lhz r5, 0(r5)
/* 000004BC 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 000004C0 41820014 */ beq lbl_000004D4
lbl_000004C4:
/* 000004C4 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 000004C8 2C040001 */ cmpwi r4, 1
/* 000004CC 40800008 */ bge lbl_000004D4
/* 000004D0 38800001 */ li r4, 1
lbl_000004D4:
/* 000004D4 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000004D8 4082004C */ bne lbl_00000524
/* 000004DC 3C600000 */ lis r3, analogButtonInfo@ha
/* 000004E0 38A30000 */ addi r5, r3, analogButtonInfo@l
/* 000004E4 A0650008 */ lhz r3, 8(r5)
/* 000004E8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000004EC 40820038 */ bne lbl_00000524
/* 000004F0 3C600000 */ lis r3, controllerInfo@ha
/* 000004F4 38630000 */ addi r3, r3, controllerInfo@l
/* 000004F8 A0630000 */ lhz r3, 0(r3)
/* 000004FC 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00000500 40820010 */ bne lbl_00000510
/* 00000504 A0650000 */ lhz r3, 0(r5)
/* 00000508 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 0000050C 41820028 */ beq lbl_00000534
lbl_00000510:
/* 00000510 3C600000 */ lis r3, analogButtonInfo@ha
/* 00000514 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00000518 A0630000 */ lhz r3, 0(r3)
/* 0000051C 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00000520 41820014 */ beq lbl_00000534
lbl_00000524:
/* 00000524 38840001 */ addi r4, r4, 1
/* 00000528 2C0400C8 */ cmpwi r4, 0xc8
/* 0000052C 40810008 */ ble lbl_00000534
/* 00000530 388000C8 */ li r4, 0xc8
lbl_00000534:
/* 00000534 7C040000 */ cmpw r4, r0
/* 00000538 4D820020 */ beqlr 
/* 0000053C 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 00000540 7C800734 */ extsh r0, r4
/* 00000544 B0030000 */ sth r0, loadingStageIdRequest@l(r3)
/* 00000548 4E800020 */ blr 
lbl_0000054C:
/* 0000054C 3C800000 */ lis r4, lbl_802F1F40@ha
/* 00000550 38A40000 */ addi r5, r4, lbl_802F1F40@l
/* 00000554 546407FF */ clrlwi. r4, r3, 0x1f
/* 00000558 A8050000 */ lha r0, 0(r5)
/* 0000055C 7C040378 */ mr r4, r0
/* 00000560 4082004C */ bne lbl_000005AC
/* 00000564 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00000568 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 0000056C A0A60008 */ lhz r5, 8(r6)
/* 00000570 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000574 40820038 */ bne lbl_000005AC
/* 00000578 3CA00000 */ lis r5, controllerInfo@ha
/* 0000057C 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000580 A0A50000 */ lhz r5, 0(r5)
/* 00000584 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000588 40820010 */ bne lbl_00000598
/* 0000058C A0A60000 */ lhz r5, 0(r6)
/* 00000590 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000594 41820024 */ beq lbl_000005B8
lbl_00000598:
/* 00000598 3CA00000 */ lis r5, analogButtonInfo@ha
/* 0000059C 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 000005A0 A0A50000 */ lhz r5, 0(r5)
/* 000005A4 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 000005A8 41820010 */ beq lbl_000005B8
lbl_000005AC:
/* 000005AC 3484FFFF */ addic. r4, r4, -1  ;# fixed addi
/* 000005B0 40800008 */ bge lbl_000005B8
/* 000005B4 38800000 */ li r4, 0
lbl_000005B8:
/* 000005B8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000005BC 4082004C */ bne lbl_00000608
/* 000005C0 3C600000 */ lis r3, analogButtonInfo@ha
/* 000005C4 38A30000 */ addi r5, r3, analogButtonInfo@l
/* 000005C8 A0650008 */ lhz r3, 8(r5)
/* 000005CC 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000005D0 40820038 */ bne lbl_00000608
/* 000005D4 3C600000 */ lis r3, controllerInfo@ha
/* 000005D8 38630000 */ addi r3, r3, controllerInfo@l
/* 000005DC A0630000 */ lhz r3, 0(r3)
/* 000005E0 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000005E4 40820010 */ bne lbl_000005F4
/* 000005E8 A0650000 */ lhz r3, 0(r5)
/* 000005EC 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000005F0 41820028 */ beq lbl_00000618
lbl_000005F4:
/* 000005F4 3C600000 */ lis r3, analogButtonInfo@ha
/* 000005F8 38630000 */ addi r3, r3, analogButtonInfo@l
/* 000005FC A0630000 */ lhz r3, 0(r3)
/* 00000600 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00000604 41820014 */ beq lbl_00000618
lbl_00000608:
/* 00000608 38840001 */ addi r4, r4, 1
/* 0000060C 2C04001B */ cmpwi r4, 0x1b
/* 00000610 40810008 */ ble lbl_00000618
/* 00000614 3880001B */ li r4, 0x1b
lbl_00000618:
/* 00000618 7C040000 */ cmpw r4, r0
/* 0000061C 4D820020 */ beqlr 
/* 00000620 3C600000 */ lis r3, lbl_802F1F40@ha
/* 00000624 7C800734 */ extsh r0, r4
/* 00000628 B0030000 */ sth r0, lbl_802F1F40@l(r3)
/* 0000062C 4E800020 */ blr 
lbl_00000630:
/* 00000630 7C0802A6 */ mflr r0
/* 00000634 3C600000 */ lis r3, lbl_000102B0@ha
/* 00000638 90010004 */ stw r0, 4(r1)
/* 0000063C 38800001 */ li r4, 1
/* 00000640 9421FFE0 */ stwu r1, -0x20(r1)
/* 00000644 BF410008 */ stmw r26, 8(r1)
/* 00000648 3B830000 */ addi r28, r3, lbl_000102B0@l
/* 0000064C 38600001 */ li r3, 1
/* 00000650 4BFFFB0D */ bl g_debug_set_cursor_pos
/* 00000654 387C03C0 */ addi r3, r28, 0x3c0
/* 00000658 4CC63182 */ crclr 6
/* 0000065C 4BFFFB01 */ bl g_debug_printf
/* 00000660 3C800000 */ lis r4, lbl_802F1F40@ha
/* 00000664 3C600000 */ lis r3, bgTypeNames@ha
/* 00000668 3CA00000 */ lis r5, loadingStageIdRequest@ha
/* 0000066C 3B7C027C */ addi r27, r28, 0x27c
/* 00000670 3BC40000 */ addi r30, r4, lbl_802F1F40@l
/* 00000674 3BE30000 */ addi r31, r3, bgTypeNames@l
/* 00000678 3BA50000 */ addi r29, r5, loadingStageIdRequest@l
/* 0000067C 3B400000 */ li r26, 0
lbl_00000680:
/* 00000680 3860000E */ li r3, 0xe
/* 00000684 389A0003 */ addi r4, r26, 3
/* 00000688 4BFFFAD5 */ bl g_debug_set_cursor_pos
/* 0000068C 801B0000 */ lwz r0, 0(r27)
/* 00000690 2C000002 */ cmpwi r0, 2
/* 00000694 41820078 */ beq lbl_0000070C
/* 00000698 40800014 */ bge lbl_000006AC
/* 0000069C 2C000000 */ cmpwi r0, 0
/* 000006A0 41820044 */ beq lbl_000006E4
/* 000006A4 40800054 */ bge lbl_000006F8
/* 000006A8 48000080 */ b lbl_00000728
lbl_000006AC:
/* 000006AC 2C000004 */ cmpwi r0, 4
/* 000006B0 40800078 */ bge lbl_00000728
/* 000006B4 38600002 */ li r3, 2
/* 000006B8 4BFFFAA5 */ bl g_debug_set_text_color
/* 000006BC 3860FFF8 */ li r3, -8
/* 000006C0 38800001 */ li r4, 1
/* 000006C4 4BFFFA99 */ bl func_8002FC90
/* 000006C8 809B0004 */ lwz r4, 4(r27)
/* 000006CC 387C03CC */ addi r3, r28, 0x3cc
/* 000006D0 4CC63182 */ crclr 6
/* 000006D4 4BFFFA89 */ bl g_debug_printf
/* 000006D8 38600000 */ li r3, 0
/* 000006DC 4BFFFA81 */ bl g_debug_set_text_color
/* 000006E0 48000048 */ b lbl_00000728
lbl_000006E4:
/* 000006E4 809B0004 */ lwz r4, 4(r27)
/* 000006E8 387C03CC */ addi r3, r28, 0x3cc
/* 000006EC 4CC63182 */ crclr 6
/* 000006F0 4BFFFA6D */ bl g_debug_printf
/* 000006F4 48000034 */ b lbl_00000728
lbl_000006F8:
/* 000006F8 A89D0000 */ lha r4, 0(r29)
/* 000006FC 387C03D0 */ addi r3, r28, 0x3d0
/* 00000700 4CC63182 */ crclr 6
/* 00000704 4BFFFA59 */ bl g_debug_printf
/* 00000708 48000020 */ b lbl_00000728
lbl_0000070C:
/* 0000070C A89E0000 */ lha r4, 0(r30)
/* 00000710 387C03E0 */ addi r3, r28, 0x3e0
/* 00000714 4CC63182 */ crclr 6
/* 00000718 5480103A */ slwi r0, r4, 2
/* 0000071C 7CBF0214 */ add r5, r31, r0
/* 00000720 80A50000 */ lwz r5, 0(r5)
/* 00000724 4BFFFA39 */ bl g_debug_printf
lbl_00000728:
/* 00000728 3B5A0001 */ addi r26, r26, 1
/* 0000072C 281A001B */ cmplwi r26, 0x1b
/* 00000730 3B7B000C */ addi r27, r27, 0xc
/* 00000734 4180FF4C */ blt lbl_00000680
/* 00000738 3C600000 */ lis r3, lbl_10000000@ha
/* 0000073C 80830000 */ lwz r4, lbl_10000000@l(r3)
/* 00000740 3860000C */ li r3, 0xc
/* 00000744 38840003 */ addi r4, r4, 3
/* 00000748 5484043E */ clrlwi r4, r4, 0x10
/* 0000074C 4BFFFA11 */ bl g_debug_set_cursor_pos
/* 00000750 38600001 */ li r3, 1
/* 00000754 4BFFFA09 */ bl g_debug_set_text_color
/* 00000758 387C0400 */ addi r3, r28, 0x400
/* 0000075C 4CC63182 */ crclr 6
/* 00000760 4BFFF9FD */ bl g_debug_printf
/* 00000764 38600000 */ li r3, 0
/* 00000768 4BFFF9F5 */ bl g_debug_set_text_color
/* 0000076C BB410008 */ lmw r26, 8(r1)
/* 00000770 80010024 */ lwz r0, 0x24(r1)
/* 00000774 38210020 */ addi r1, r1, 0x20
/* 00000778 7C0803A6 */ mtlr r0
/* 0000077C 4E800020 */ blr 
lbl_00000780:
/* 00000780 7C0802A6 */ mflr r0
/* 00000784 3C600000 */ lis r3, lbl_000106B4@ha
/* 00000788 90010004 */ stw r0, 4(r1)
/* 0000078C 4CC63182 */ crclr 6
/* 00000790 38630000 */ addi r3, r3, lbl_000106B4@l
/* 00000794 9421FFF8 */ stwu r1, -8(r1)
/* 00000798 4BFFF9C5 */ bl printf
/* 0000079C 8001000C */ lwz r0, 0xc(r1)
/* 000007A0 38210008 */ addi r1, r1, 8
/* 000007A4 7C0803A6 */ mtlr r0
/* 000007A8 4E800020 */ blr 
lbl_000007AC:
/* 000007AC 7C0802A6 */ mflr r0
/* 000007B0 3C600000 */ lis r3, gamePauseStatus@ha
/* 000007B4 90010004 */ stw r0, 4(r1)
/* 000007B8 9421FFF8 */ stwu r1, -8(r1)
/* 000007BC 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 000007C0 7000000A */ andi. r0, r0, 0xa
/* 000007C4 40820030 */ bne lbl_000007F4
/* 000007C8 4BFFF995 */ bl func_8002FFEC
/* 000007CC 3C600000 */ lis r3, lbl_10000004@ha
/* 000007D0 38000000 */ li r0, 0
/* 000007D4 90030000 */ stw r0, lbl_10000004@l(r3)
/* 000007D8 3CA00000 */ lis r5, lbl_00000780@ha
/* 000007DC 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 000007E0 38050000 */ addi r0, r5, lbl_00000780@l
/* 000007E4 90040000 */ stw r0, lbl_802F1B7C@l(r4)
/* 000007E8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000007EC 38000064 */ li r0, 0x64
/* 000007F0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_000007F4:
/* 000007F4 8001000C */ lwz r0, 0xc(r1)
/* 000007F8 38210008 */ addi r1, r1, 8
/* 000007FC 7C0803A6 */ mtlr r0
/* 00000800 4E800020 */ blr 
lbl_00000804:
/* 00000804 3C600000 */ lis r3, gamePauseStatus@ha
/* 00000808 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 0000080C 3C600000 */ lis r3, lbl_10000000@ha
/* 00000810 38630000 */ addi r3, r3, lbl_10000000@l
/* 00000814 7000000A */ andi. r0, r0, 0xa
/* 00000818 4C820020 */ bnelr 
/* 0000081C 3C800000 */ lis r4, controllerInfo@ha
/* 00000820 38A40000 */ addi r5, r4, controllerInfo@l
/* 00000824 A0C50030 */ lhz r6, 0x30(r5)
/* 00000828 54C00739 */ rlwinm. r0, r6, 0, 0x1c, 0x1c
/* 0000082C 40820040 */ bne lbl_0000086C
/* 00000830 3C800000 */ lis r4, analogButtonInfo@ha
/* 00000834 38840000 */ addi r4, r4, analogButtonInfo@l
/* 00000838 A0040008 */ lhz r0, 8(r4)
/* 0000083C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00000840 4082002C */ bne lbl_0000086C
/* 00000844 A0050000 */ lhz r0, 0(r5)
/* 00000848 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000084C 40820010 */ bne lbl_0000085C
/* 00000850 A0040000 */ lhz r0, 0(r4)
/* 00000854 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00000858 41820038 */ beq lbl_00000890
lbl_0000085C:
/* 0000085C 3C800000 */ lis r4, analogButtonInfo@ha
/* 00000860 A0040000 */ lhz r0, analogButtonInfo@l(r4)
/* 00000864 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00000868 41820028 */ beq lbl_00000890
lbl_0000086C:
/* 0000086C 80830004 */ lwz r4, 4(r3)
/* 00000870 3404FFFF */ addic. r0, r4, -1  ;# fixed addi
/* 00000874 90030004 */ stw r0, 4(r3)
/* 00000878 40800018 */ bge lbl_00000890
/* 0000087C 3C800000 */ lis r4, lbl_802F0980@ha
/* 00000880 38840000 */ addi r4, r4, lbl_802F0980@l
/* 00000884 80840000 */ lwz r4, 0(r4)
/* 00000888 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 0000088C 90030004 */ stw r0, 4(r3)
lbl_00000890:
/* 00000890 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 00000894 40820044 */ bne lbl_000008D8
/* 00000898 3C800000 */ lis r4, analogButtonInfo@ha
/* 0000089C 38A40000 */ addi r5, r4, analogButtonInfo@l
/* 000008A0 A0050008 */ lhz r0, 8(r5)
/* 000008A4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000008A8 40820030 */ bne lbl_000008D8
/* 000008AC 3C800000 */ lis r4, controllerInfo@ha
/* 000008B0 A0040000 */ lhz r0, controllerInfo@l(r4)
/* 000008B4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000008B8 40820010 */ bne lbl_000008C8
/* 000008BC A0050000 */ lhz r0, 0(r5)
/* 000008C0 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000008C4 41820038 */ beq lbl_000008FC
lbl_000008C8:
/* 000008C8 3C800000 */ lis r4, analogButtonInfo@ha
/* 000008CC A0040000 */ lhz r0, analogButtonInfo@l(r4)
/* 000008D0 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000008D4 41820028 */ beq lbl_000008FC
lbl_000008D8:
/* 000008D8 80A30004 */ lwz r5, 4(r3)
/* 000008DC 3C800000 */ lis r4, lbl_802F0980@ha
/* 000008E0 38A50001 */ addi r5, r5, 1
/* 000008E4 90A30004 */ stw r5, 4(r3)
/* 000008E8 80040000 */ lwz r0, lbl_802F0980@l(r4)
/* 000008EC 7C050000 */ cmpw r5, r0
/* 000008F0 4180000C */ blt lbl_000008FC
/* 000008F4 38000000 */ li r0, 0
/* 000008F8 90030004 */ stw r0, 4(r3)
lbl_000008FC:
/* 000008FC 3C800000 */ lis r4, controllerInfo@ha
/* 00000900 38840000 */ addi r4, r4, controllerInfo@l
/* 00000904 A0040018 */ lhz r0, 0x18(r4)
/* 00000908 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000090C 4D820020 */ beqlr 
/* 00000910 3C800000 */ lis r4, dipSwitches@ha
/* 00000914 80030004 */ lwz r0, 4(r3)
/* 00000918 38A40000 */ addi r5, r4, dipSwitches@l
/* 0000091C 38600001 */ li r3, 1
/* 00000920 80850000 */ lwz r4, 0(r5)
/* 00000924 7C600030 */ slw r0, r3, r0
/* 00000928 7C800278 */ xor r0, r4, r0
/* 0000092C 90050000 */ stw r0, 0(r5)
/* 00000930 4E800020 */ blr 
lbl_00000934:
/* 00000934 7C0802A6 */ mflr r0
/* 00000938 3C800000 */ lis r4, lbl_10000000@ha
/* 0000093C 90010004 */ stw r0, 4(r1)
/* 00000940 3C600000 */ lis r3, lbl_000102B0@ha
/* 00000944 9421FFD8 */ stwu r1, -0x28(r1)
/* 00000948 BF21000C */ stmw r25, 0xc(r1)
/* 0000094C 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00000950 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 00000954 38600001 */ li r3, 1
/* 00000958 38800001 */ li r4, 1
/* 0000095C 4BFFF801 */ bl g_debug_set_cursor_pos
/* 00000960 387F0270 */ addi r3, r31, 0x270
/* 00000964 4CC63182 */ crclr 6
/* 00000968 4BFFF7F5 */ bl g_debug_printf
/* 0000096C 807E0004 */ lwz r3, 4(r30)
/* 00000970 3403FFF6 */ addic. r0, r3, -10  ;# fixed addi
/* 00000974 4080000C */ bge lbl_00000980
/* 00000978 38E00000 */ li r7, 0
/* 0000097C 48000018 */ b lbl_00000994
lbl_00000980:
/* 00000980 2C00000E */ cmpwi r0, 0xe
/* 00000984 4081000C */ ble lbl_00000990
/* 00000988 38E0000E */ li r7, 0xe
/* 0000098C 48000008 */ b lbl_00000994
lbl_00000990:
/* 00000990 38E3FFF6 */ addi r7, r3, -10  ;# fixed addi
lbl_00000994:
/* 00000994 3B600000 */ li r27, 0
/* 00000998 3CA00000 */ lis r5, dipSwitchNames@ha
/* 0000099C 3C800000 */ lis r4, dipSwitches@ha
/* 000009A0 3C600000 */ lis r3, lbl_802F0980@ha
/* 000009A4 5766103A */ slwi r6, r27, 2
/* 000009A8 38050000 */ addi r0, r5, dipSwitchNames@l
/* 000009AC 7FA03214 */ add r29, r0, r6
/* 000009B0 23870003 */ subfic r28, r7, 3
/* 000009B4 3B240000 */ addi r25, r4, dipSwitches@l
/* 000009B8 3B430000 */ addi r26, r3, lbl_802F0980@l
/* 000009BC 4800007C */ b lbl_00000A38
lbl_000009C0:
/* 000009C0 7F601670 */ srawi r0, r27, 2
/* 000009C4 7C000194 */ addze r0, r0
/* 000009C8 7C9B0214 */ add r4, r27, r0
/* 000009CC 7C9C2214 */ add r4, r28, r4
/* 000009D0 3860000C */ li r3, 0xc
/* 000009D4 4BFFF789 */ bl g_debug_set_cursor_pos
/* 000009D8 801E0004 */ lwz r0, 4(r30)
/* 000009DC 7C1B0000 */ cmpw r27, r0
/* 000009E0 4082000C */ bne lbl_000009EC
/* 000009E4 38600002 */ li r3, 2
/* 000009E8 4BFFF775 */ bl g_debug_set_text_color
lbl_000009EC:
/* 000009EC 38000001 */ li r0, 1
/* 000009F0 80790000 */ lwz r3, 0(r25)
/* 000009F4 7C00D830 */ slw r0, r0, r27
/* 000009F8 7C600039 */ and. r0, r3, r0
/* 000009FC 4182000C */ beq lbl_00000A08
/* 00000A00 38BF0410 */ addi r5, r31, 0x410
/* 00000A04 48000008 */ b lbl_00000A0C
lbl_00000A08:
/* 00000A08 38BF0414 */ addi r5, r31, 0x414
lbl_00000A0C:
/* 00000A0C 809D0000 */ lwz r4, 0(r29)
/* 00000A10 387F0418 */ addi r3, r31, 0x418
/* 00000A14 4CC63182 */ crclr 6
/* 00000A18 4BFFF745 */ bl g_debug_printf
/* 00000A1C 801E0004 */ lwz r0, 4(r30)
/* 00000A20 7C1B0000 */ cmpw r27, r0
/* 00000A24 4082000C */ bne lbl_00000A30
/* 00000A28 38600000 */ li r3, 0
/* 00000A2C 4BFFF731 */ bl g_debug_set_text_color
lbl_00000A30:
/* 00000A30 3BBD0004 */ addi r29, r29, 4
/* 00000A34 3B7B0001 */ addi r27, r27, 1
lbl_00000A38:
/* 00000A38 801A0000 */ lwz r0, 0(r26)
/* 00000A3C 7C1B0000 */ cmpw r27, r0
/* 00000A40 4180FF80 */ blt lbl_000009C0
/* 00000A44 809E0004 */ lwz r4, 4(r30)
/* 00000A48 3860000A */ li r3, 0xa
/* 00000A4C 7C801670 */ srawi r0, r4, 2
/* 00000A50 7C000194 */ addze r0, r0
/* 00000A54 7C840214 */ add r4, r4, r0
/* 00000A58 7C9C2214 */ add r4, r28, r4
/* 00000A5C 4BFFF701 */ bl g_debug_set_cursor_pos
/* 00000A60 38600001 */ li r3, 1
/* 00000A64 4BFFF6F9 */ bl g_debug_set_text_color
/* 00000A68 387F0400 */ addi r3, r31, 0x400
/* 00000A6C 4BFFF6F1 */ bl g_debug_print
/* 00000A70 38600000 */ li r3, 0
/* 00000A74 4BFFF6E9 */ bl g_debug_set_text_color
/* 00000A78 BB21000C */ lmw r25, 0xc(r1)
/* 00000A7C 8001002C */ lwz r0, 0x2c(r1)
/* 00000A80 38210028 */ addi r1, r1, 0x28
/* 00000A84 7C0803A6 */ mtlr r0
/* 00000A88 4E800020 */ blr 
lbl_00000A8C:
/* 00000A8C 3C600000 */ lis r3, lbl_10000008@ha
/* 00000A90 38830000 */ addi r4, r3, lbl_10000008@l
/* 00000A94 38000000 */ li r0, 0
/* 00000A98 90040000 */ stw r0, 0(r4)
/* 00000A9C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000AA0 38000062 */ li r0, 0x62
/* 00000AA4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000AA8 4E800020 */ blr 
lbl_00000AAC:
/* 00000AAC 7C0802A6 */ mflr r0
/* 00000AB0 3C600000 */ lis r3, controllerInfo@ha
/* 00000AB4 90010004 */ stw r0, 4(r1)
/* 00000AB8 3C800000 */ lis r4, lbl_10000008@ha
/* 00000ABC 9421FFE8 */ stwu r1, -0x18(r1)
/* 00000AC0 93E10014 */ stw r31, 0x14(r1)
/* 00000AC4 93C10010 */ stw r30, 0x10(r1)
/* 00000AC8 93A1000C */ stw r29, 0xc(r1)
/* 00000ACC 93810008 */ stw r28, 8(r1)
/* 00000AD0 A4030000 */ lhzu r0, controllerInfo@l(r3)
/* 00000AD4 83840000 */ lwz r28, lbl_10000008@l(r4)
/* 00000AD8 3C800000 */ lis r4, lbl_000102B0@ha
/* 00000ADC 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00000AE0 3BE40000 */ addi r31, r4, lbl_000102B0@l
/* 00000AE4 41820034 */ beq lbl_00000B18
/* 00000AE8 A0630018 */ lhz r3, 0x18(r3)
/* 00000AEC 546007FF */ clrlwi. r0, r3, 0x1f
/* 00000AF0 41820010 */ beq lbl_00000B00
/* 00000AF4 379CFFFF */ addic. r28, r28, -1  ;# fixed addi
/* 00000AF8 40800008 */ bge lbl_00000B00
/* 00000AFC 3B800000 */ li r28, 0
lbl_00000B00:
/* 00000B00 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00000B04 41820014 */ beq lbl_00000B18
/* 00000B08 3B9C0001 */ addi r28, r28, 1
/* 00000B0C 2C1C0004 */ cmpwi r28, 4
/* 00000B10 41800008 */ blt lbl_00000B18
/* 00000B14 3B800003 */ li r28, 3
lbl_00000B18:
/* 00000B18 3C600000 */ lis r3, lbl_10000008@ha
/* 00000B1C 93830000 */ stw r28, lbl_10000008@l(r3)
/* 00000B20 38600001 */ li r3, 1
/* 00000B24 38800001 */ li r4, 1
/* 00000B28 4BFFF635 */ bl g_debug_set_cursor_pos
/* 00000B2C 387F0424 */ addi r3, r31, 0x424
/* 00000B30 4CC63182 */ crclr 6
/* 00000B34 4BFFF629 */ bl g_debug_printf
/* 00000B38 38600003 */ li r3, 3
/* 00000B3C 38800003 */ li r4, 3
/* 00000B40 4BFFF61D */ bl g_debug_set_cursor_pos
/* 00000B44 38600002 */ li r3, 2
/* 00000B48 4BFFF615 */ bl g_debug_set_text_color
/* 00000B4C 389C0000 */ addi r4, r28, 0
/* 00000B50 4CC63182 */ crclr 6
/* 00000B54 387F0430 */ addi r3, r31, 0x430
/* 00000B58 4BFFF605 */ bl g_debug_printf
/* 00000B5C 38600000 */ li r3, 0
/* 00000B60 4BFFF5FD */ bl g_debug_set_text_color
/* 00000B64 387F0140 */ addi r3, r31, 0x140
/* 00000B68 4CC63182 */ crclr 6
/* 00000B6C 4BFFF5F1 */ bl g_debug_printf
/* 00000B70 1FBC003C */ mulli r29, r28, 0x3c
/* 00000B74 3C600000 */ lis r3, controllerInfo@ha
/* 00000B78 38030000 */ addi r0, r3, controllerInfo@l
/* 00000B7C 7FC0EA14 */ add r30, r0, r29
/* 00000B80 A01E0000 */ lhz r0, 0(r30)
/* 00000B84 540007FF */ clrlwi. r0, r0, 0x1f
/* 00000B88 4182000C */ beq lbl_00000B94
/* 00000B8C 389F0444 */ addi r4, r31, 0x444
/* 00000B90 48000008 */ b lbl_00000B98
lbl_00000B94:
/* 00000B94 389F0414 */ addi r4, r31, 0x414
lbl_00000B98:
/* 00000B98 4CC63182 */ crclr 6
/* 00000B9C 387F0448 */ addi r3, r31, 0x448
/* 00000BA0 4BFFF5BD */ bl g_debug_printf
/* 00000BA4 A01E0000 */ lhz r0, 0(r30)
/* 00000BA8 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00000BAC 4182000C */ beq lbl_00000BB8
/* 00000BB0 389F0444 */ addi r4, r31, 0x444
/* 00000BB4 48000008 */ b lbl_00000BBC
lbl_00000BB8:
/* 00000BB8 389F0414 */ addi r4, r31, 0x414
lbl_00000BBC:
/* 00000BBC 4CC63182 */ crclr 6
/* 00000BC0 387F045C */ addi r3, r31, 0x45c
/* 00000BC4 4BFFF599 */ bl g_debug_printf
/* 00000BC8 A01E0000 */ lhz r0, 0(r30)
/* 00000BCC 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000BD0 4182000C */ beq lbl_00000BDC
/* 00000BD4 389F0444 */ addi r4, r31, 0x444
/* 00000BD8 48000008 */ b lbl_00000BE0
lbl_00000BDC:
/* 00000BDC 389F0414 */ addi r4, r31, 0x414
lbl_00000BE0:
/* 00000BE0 4CC63182 */ crclr 6
/* 00000BE4 387F0470 */ addi r3, r31, 0x470
/* 00000BE8 4BFFF575 */ bl g_debug_printf
/* 00000BEC A01E0000 */ lhz r0, 0(r30)
/* 00000BF0 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00000BF4 4182000C */ beq lbl_00000C00
/* 00000BF8 389F0444 */ addi r4, r31, 0x444
/* 00000BFC 48000008 */ b lbl_00000C04
lbl_00000C00:
/* 00000C00 389F0414 */ addi r4, r31, 0x414
lbl_00000C04:
/* 00000C04 4CC63182 */ crclr 6
/* 00000C08 387F0484 */ addi r3, r31, 0x484
/* 00000C0C 4BFFF551 */ bl g_debug_printf
/* 00000C10 A01E0000 */ lhz r0, 0(r30)
/* 00000C14 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 00000C18 4182000C */ beq lbl_00000C24
/* 00000C1C 389F0444 */ addi r4, r31, 0x444
/* 00000C20 48000008 */ b lbl_00000C28
lbl_00000C24:
/* 00000C24 389F0414 */ addi r4, r31, 0x414
lbl_00000C28:
/* 00000C28 4CC63182 */ crclr 6
/* 00000C2C 387F0498 */ addi r3, r31, 0x498
/* 00000C30 4BFFF52D */ bl g_debug_printf
/* 00000C34 A01E0000 */ lhz r0, 0(r30)
/* 00000C38 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00000C3C 4182000C */ beq lbl_00000C48
/* 00000C40 389F0444 */ addi r4, r31, 0x444
/* 00000C44 48000008 */ b lbl_00000C4C
lbl_00000C48:
/* 00000C48 389F0414 */ addi r4, r31, 0x414
lbl_00000C4C:
/* 00000C4C 4CC63182 */ crclr 6
/* 00000C50 387F04AC */ addi r3, r31, 0x4ac
/* 00000C54 4BFFF509 */ bl g_debug_printf
/* 00000C58 A01E0000 */ lhz r0, 0(r30)
/* 00000C5C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00000C60 4182000C */ beq lbl_00000C6C
/* 00000C64 389F0444 */ addi r4, r31, 0x444
/* 00000C68 48000008 */ b lbl_00000C70
lbl_00000C6C:
/* 00000C6C 389F0414 */ addi r4, r31, 0x414
lbl_00000C70:
/* 00000C70 4CC63182 */ crclr 6
/* 00000C74 387F04C0 */ addi r3, r31, 0x4c0
/* 00000C78 4BFFF4E5 */ bl g_debug_printf
/* 00000C7C A01E0000 */ lhz r0, 0(r30)
/* 00000C80 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00000C84 4182000C */ beq lbl_00000C90
/* 00000C88 389F0444 */ addi r4, r31, 0x444
/* 00000C8C 48000008 */ b lbl_00000C94
lbl_00000C90:
/* 00000C90 389F0414 */ addi r4, r31, 0x414
lbl_00000C94:
/* 00000C94 4CC63182 */ crclr 6
/* 00000C98 387F04D4 */ addi r3, r31, 0x4d4
/* 00000C9C 4BFFF4C1 */ bl g_debug_printf
/* 00000CA0 A01E0000 */ lhz r0, 0(r30)
/* 00000CA4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00000CA8 4182000C */ beq lbl_00000CB4
/* 00000CAC 389F0444 */ addi r4, r31, 0x444
/* 00000CB0 48000008 */ b lbl_00000CB8
lbl_00000CB4:
/* 00000CB4 389F0414 */ addi r4, r31, 0x414
lbl_00000CB8:
/* 00000CB8 4CC63182 */ crclr 6
/* 00000CBC 387F04E8 */ addi r3, r31, 0x4e8
/* 00000CC0 4BFFF49D */ bl g_debug_printf
/* 00000CC4 A01E0000 */ lhz r0, 0(r30)
/* 00000CC8 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 00000CCC 4182000C */ beq lbl_00000CD8
/* 00000CD0 389F0444 */ addi r4, r31, 0x444
/* 00000CD4 48000008 */ b lbl_00000CDC
lbl_00000CD8:
/* 00000CD8 389F0414 */ addi r4, r31, 0x414
lbl_00000CDC:
/* 00000CDC 4CC63182 */ crclr 6
/* 00000CE0 387F04FC */ addi r3, r31, 0x4fc
/* 00000CE4 4BFFF479 */ bl g_debug_printf
/* 00000CE8 A01E0000 */ lhz r0, 0(r30)
/* 00000CEC 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 00000CF0 4182000C */ beq lbl_00000CFC
/* 00000CF4 389F0444 */ addi r4, r31, 0x444
/* 00000CF8 48000008 */ b lbl_00000D00
lbl_00000CFC:
/* 00000CFC 389F0414 */ addi r4, r31, 0x414
lbl_00000D00:
/* 00000D00 4CC63182 */ crclr 6
/* 00000D04 387F0510 */ addi r3, r31, 0x510
/* 00000D08 4BFFF455 */ bl g_debug_printf
/* 00000D0C A01E0000 */ lhz r0, 0(r30)
/* 00000D10 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00000D14 4182000C */ beq lbl_00000D20
/* 00000D18 389F0444 */ addi r4, r31, 0x444
/* 00000D1C 48000008 */ b lbl_00000D24
lbl_00000D20:
/* 00000D20 389F0414 */ addi r4, r31, 0x414
lbl_00000D24:
/* 00000D24 4CC63182 */ crclr 6
/* 00000D28 387F0524 */ addi r3, r31, 0x524
/* 00000D2C 4BFFF431 */ bl g_debug_printf
/* 00000D30 387F0140 */ addi r3, r31, 0x140
/* 00000D34 4CC63182 */ crclr 6
/* 00000D38 4BFFF425 */ bl g_debug_printf
/* 00000D3C 3C600000 */ lis r3, controllerInfo@ha
/* 00000D40 4CC63182 */ crclr 6
/* 00000D44 38030000 */ addi r0, r3, controllerInfo@l
/* 00000D48 7FA0EA14 */ add r29, r0, r29
/* 00000D4C 889D0002 */ lbz r4, 2(r29)
/* 00000D50 387F0538 */ addi r3, r31, 0x538
/* 00000D54 7C840774 */ extsb r4, r4
/* 00000D58 4BFFF405 */ bl g_debug_printf
/* 00000D5C 889D0003 */ lbz r4, 3(r29)
/* 00000D60 387F054C */ addi r3, r31, 0x54c
/* 00000D64 4CC63182 */ crclr 6
/* 00000D68 7C840774 */ extsb r4, r4
/* 00000D6C 4BFFF3F1 */ bl g_debug_printf
/* 00000D70 889D0004 */ lbz r4, 4(r29)
/* 00000D74 387F0560 */ addi r3, r31, 0x560
/* 00000D78 4CC63182 */ crclr 6
/* 00000D7C 7C840774 */ extsb r4, r4
/* 00000D80 4BFFF3DD */ bl g_debug_printf
/* 00000D84 889D0005 */ lbz r4, 5(r29)
/* 00000D88 387F0574 */ addi r3, r31, 0x574
/* 00000D8C 4CC63182 */ crclr 6
/* 00000D90 7C840774 */ extsb r4, r4
/* 00000D94 4BFFF3C9 */ bl g_debug_printf
/* 00000D98 889D0006 */ lbz r4, 6(r29)
/* 00000D9C 387F0588 */ addi r3, r31, 0x588
/* 00000DA0 4CC63182 */ crclr 6
/* 00000DA4 4BFFF3B9 */ bl g_debug_printf
/* 00000DA8 889D0007 */ lbz r4, 7(r29)
/* 00000DAC 387F059C */ addi r3, r31, 0x59c
/* 00000DB0 4CC63182 */ crclr 6
/* 00000DB4 4BFFF3A9 */ bl g_debug_printf
/* 00000DB8 889D0008 */ lbz r4, 8(r29)
/* 00000DBC 387F05B0 */ addi r3, r31, 0x5b0
/* 00000DC0 4CC63182 */ crclr 6
/* 00000DC4 4BFFF399 */ bl g_debug_printf
/* 00000DC8 889D0009 */ lbz r4, 9(r29)
/* 00000DCC 387F05C4 */ addi r3, r31, 0x5c4
/* 00000DD0 4CC63182 */ crclr 6
/* 00000DD4 4BFFF389 */ bl g_debug_printf
/* 00000DD8 889D000A */ lbz r4, 0xa(r29)
/* 00000DDC 387F05D8 */ addi r3, r31, 0x5d8
/* 00000DE0 4CC63182 */ crclr 6
/* 00000DE4 7C840774 */ extsb r4, r4
/* 00000DE8 4BFFF375 */ bl g_debug_printf
/* 00000DEC 38600017 */ li r3, 0x17
/* 00000DF0 38800003 */ li r4, 3
/* 00000DF4 4BFFF369 */ bl g_debug_set_cursor_pos
/* 00000DF8 387F05EC */ addi r3, r31, 0x5ec
/* 00000DFC 4CC63182 */ crclr 6
/* 00000E00 4BFFF35D */ bl g_debug_printf
/* 00000E04 387F0140 */ addi r3, r31, 0x140
/* 00000E08 4CC63182 */ crclr 6
/* 00000E0C 4BFFF351 */ bl g_debug_printf
/* 00000E10 1C9C000A */ mulli r4, r28, 0xa
/* 00000E14 3C600000 */ lis r3, analogButtonInfo@ha
/* 00000E18 38030000 */ addi r0, r3, analogButtonInfo@l
/* 00000E1C 7FA02214 */ add r29, r0, r4
/* 00000E20 A01D0000 */ lhz r0, 0(r29)
/* 00000E24 540007FF */ clrlwi. r0, r0, 0x1f
/* 00000E28 4182000C */ beq lbl_00000E34
/* 00000E2C 389F0444 */ addi r4, r31, 0x444
/* 00000E30 48000008 */ b lbl_00000E38
lbl_00000E34:
/* 00000E34 389F0414 */ addi r4, r31, 0x414
lbl_00000E38:
/* 00000E38 4CC63182 */ crclr 6
/* 00000E3C 387F05F8 */ addi r3, r31, 0x5f8
/* 00000E40 4BFFF31D */ bl g_debug_printf
/* 00000E44 A01D0000 */ lhz r0, 0(r29)
/* 00000E48 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00000E4C 4182000C */ beq lbl_00000E58
/* 00000E50 389F0444 */ addi r4, r31, 0x444
/* 00000E54 48000008 */ b lbl_00000E5C
lbl_00000E58:
/* 00000E58 389F0414 */ addi r4, r31, 0x414
lbl_00000E5C:
/* 00000E5C 4CC63182 */ crclr 6
/* 00000E60 387F060C */ addi r3, r31, 0x60c
/* 00000E64 4BFFF2F9 */ bl g_debug_printf
/* 00000E68 A01D0000 */ lhz r0, 0(r29)
/* 00000E6C 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000E70 4182000C */ beq lbl_00000E7C
/* 00000E74 389F0444 */ addi r4, r31, 0x444
/* 00000E78 48000008 */ b lbl_00000E80
lbl_00000E7C:
/* 00000E7C 389F0414 */ addi r4, r31, 0x414
lbl_00000E80:
/* 00000E80 4CC63182 */ crclr 6
/* 00000E84 387F0620 */ addi r3, r31, 0x620
/* 00000E88 4BFFF2D5 */ bl g_debug_printf
/* 00000E8C A01D0000 */ lhz r0, 0(r29)
/* 00000E90 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00000E94 4182000C */ beq lbl_00000EA0
/* 00000E98 389F0444 */ addi r4, r31, 0x444
/* 00000E9C 48000008 */ b lbl_00000EA4
lbl_00000EA0:
/* 00000EA0 389F0414 */ addi r4, r31, 0x414
lbl_00000EA4:
/* 00000EA4 4CC63182 */ crclr 6
/* 00000EA8 387F0634 */ addi r3, r31, 0x634
/* 00000EAC 4BFFF2B1 */ bl g_debug_printf
/* 00000EB0 A01D0000 */ lhz r0, 0(r29)
/* 00000EB4 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 00000EB8 4182000C */ beq lbl_00000EC4
/* 00000EBC 389F0444 */ addi r4, r31, 0x444
/* 00000EC0 48000008 */ b lbl_00000EC8
lbl_00000EC4:
/* 00000EC4 389F0414 */ addi r4, r31, 0x414
lbl_00000EC8:
/* 00000EC8 4CC63182 */ crclr 6
/* 00000ECC 387F0648 */ addi r3, r31, 0x648
/* 00000ED0 4BFFF28D */ bl g_debug_printf
/* 00000ED4 A01D0000 */ lhz r0, 0(r29)
/* 00000ED8 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00000EDC 4182000C */ beq lbl_00000EE8
/* 00000EE0 389F0444 */ addi r4, r31, 0x444
/* 00000EE4 48000008 */ b lbl_00000EEC
lbl_00000EE8:
/* 00000EE8 389F0414 */ addi r4, r31, 0x414
lbl_00000EEC:
/* 00000EEC 4CC63182 */ crclr 6
/* 00000EF0 387F065C */ addi r3, r31, 0x65c
/* 00000EF4 4BFFF269 */ bl g_debug_printf
/* 00000EF8 A01D0000 */ lhz r0, 0(r29)
/* 00000EFC 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00000F00 4182000C */ beq lbl_00000F0C
/* 00000F04 389F0444 */ addi r4, r31, 0x444
/* 00000F08 48000008 */ b lbl_00000F10
lbl_00000F0C:
/* 00000F0C 389F0414 */ addi r4, r31, 0x414
lbl_00000F10:
/* 00000F10 4CC63182 */ crclr 6
/* 00000F14 387F0670 */ addi r3, r31, 0x670
/* 00000F18 4BFFF245 */ bl g_debug_printf
/* 00000F1C A01D0000 */ lhz r0, 0(r29)
/* 00000F20 54000631 */ rlwinm. r0, r0, 0, 0x18, 0x18
/* 00000F24 4182000C */ beq lbl_00000F30
/* 00000F28 389F0444 */ addi r4, r31, 0x444
/* 00000F2C 48000008 */ b lbl_00000F34
lbl_00000F30:
/* 00000F30 389F0414 */ addi r4, r31, 0x414
lbl_00000F34:
/* 00000F34 4CC63182 */ crclr 6
/* 00000F38 387F0684 */ addi r3, r31, 0x684
/* 00000F3C 4BFFF221 */ bl g_debug_printf
/* 00000F40 A01D0000 */ lhz r0, 0(r29)
/* 00000F44 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00000F48 4182000C */ beq lbl_00000F54
/* 00000F4C 389F0444 */ addi r4, r31, 0x444
/* 00000F50 48000008 */ b lbl_00000F58
lbl_00000F54:
/* 00000F54 389F0414 */ addi r4, r31, 0x414
lbl_00000F58:
/* 00000F58 4CC63182 */ crclr 6
/* 00000F5C 387F04AC */ addi r3, r31, 0x4ac
/* 00000F60 4BFFF1FD */ bl g_debug_printf
/* 00000F64 A01D0000 */ lhz r0, 0(r29)
/* 00000F68 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00000F6C 4182000C */ beq lbl_00000F78
/* 00000F70 389F0444 */ addi r4, r31, 0x444
/* 00000F74 48000008 */ b lbl_00000F7C
lbl_00000F78:
/* 00000F78 389F0414 */ addi r4, r31, 0x414
lbl_00000F7C:
/* 00000F7C 4CC63182 */ crclr 6
/* 00000F80 387F04C0 */ addi r3, r31, 0x4c0
/* 00000F84 4BFFF1D9 */ bl g_debug_printf
/* 00000F88 38600016 */ li r3, 0x16
/* 00000F8C 38800012 */ li r4, 0x12
/* 00000F90 4BFFF1CD */ bl g_debug_set_cursor_pos
/* 00000F94 387F0698 */ addi r3, r31, 0x698
/* 00000F98 4CC63182 */ crclr 6
/* 00000F9C 4BFFF1C1 */ bl g_debug_printf
/* 00000FA0 387F0140 */ addi r3, r31, 0x140
/* 00000FA4 4CC63182 */ crclr 6
/* 00000FA8 4BFFF1B5 */ bl g_debug_printf
/* 00000FAC 387F06A8 */ addi r3, r31, 0x6a8
/* 00000FB0 4CC63182 */ crclr 6
/* 00000FB4 4BFFF1A9 */ bl g_debug_printf
/* 00000FB8 387F06B8 */ addi r3, r31, 0x6b8
/* 00000FBC 4CC63182 */ crclr 6
/* 00000FC0 4BFFF19D */ bl g_debug_printf
/* 00000FC4 387F06C4 */ addi r3, r31, 0x6c4
/* 00000FC8 4CC63182 */ crclr 6
/* 00000FCC 4BFFF191 */ bl g_debug_printf
/* 00000FD0 387F06D8 */ addi r3, r31, 0x6d8
/* 00000FD4 4CC63182 */ crclr 6
/* 00000FD8 4BFFF185 */ bl g_debug_printf
/* 00000FDC 387F06E4 */ addi r3, r31, 0x6e4
/* 00000FE0 4CC63182 */ crclr 6
/* 00000FE4 4BFFF179 */ bl g_debug_printf
/* 00000FE8 8001001C */ lwz r0, 0x1c(r1)
/* 00000FEC 83E10014 */ lwz r31, 0x14(r1)
/* 00000FF0 83C10010 */ lwz r30, 0x10(r1)
/* 00000FF4 7C0803A6 */ mtlr r0
/* 00000FF8 83A1000C */ lwz r29, 0xc(r1)
/* 00000FFC 83810008 */ lwz r28, 8(r1)
/* 00001000 38210018 */ addi r1, r1, 0x18
/* 00001004 4E800020 */ blr 
lbl_00001008:
/* 00001008 7C0802A6 */ mflr r0
/* 0000100C 3C600000 */ lis r3, lbl_10000000@ha
/* 00001010 90010004 */ stw r0, 4(r1)
/* 00001014 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001018 93E1000C */ stw r31, 0xc(r1)
/* 0000101C 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00001020 38600012 */ li r3, 0x12
/* 00001024 4BFFF139 */ bl event_start
/* 00001028 38600001 */ li r3, 1
/* 0000102C 38800003 */ li r4, 3
/* 00001030 4BFFF12D */ bl g_play_music
/* 00001034 38000001 */ li r0, 1
/* 00001038 901F000C */ stw r0, 0xc(r31)
/* 0000103C 38E00000 */ li r7, 0
/* 00001040 3C600000 */ lis r3, lbl_80110400@ha
/* 00001044 90FF0010 */ stw r7, 0x10(r31)
/* 00001048 38830000 */ addi r4, r3, lbl_80110400@l
/* 0000104C 3800007F */ li r0, 0x7f
/* 00001050 80840004 */ lwz r4, 4(r4)
/* 00001054 38C02000 */ li r6, 0x2000
/* 00001058 38A00100 */ li r5, 0x100
/* 0000105C 38840001 */ addi r4, r4, 1
/* 00001060 909F0014 */ stw r4, 0x14(r31)
/* 00001064 388000FF */ li r4, 0xff
/* 00001068 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000106C 981F0018 */ stb r0, 0x18(r31)
/* 00001070 38000066 */ li r0, 0x66
/* 00001074 98FF0019 */ stb r7, 0x19(r31)
/* 00001078 98FF001A */ stb r7, 0x1a(r31)
/* 0000107C B0DF001C */ sth r6, 0x1c(r31)
/* 00001080 B0DF001E */ sth r6, 0x1e(r31)
/* 00001084 B0FF0020 */ sth r7, 0x20(r31)
/* 00001088 98FF0022 */ stb r7, 0x22(r31)
/* 0000108C 98FF0023 */ stb r7, 0x23(r31)
/* 00001090 90FF0024 */ stw r7, 0x24(r31)
/* 00001094 98FF0028 */ stb r7, 0x28(r31)
/* 00001098 90FF002C */ stw r7, 0x2c(r31)
/* 0000109C B0BF0030 */ sth r5, 0x30(r31)
/* 000010A0 90FF0034 */ stw r7, 0x34(r31)
/* 000010A4 909F0038 */ stw r4, 0x38(r31)
/* 000010A8 90FF003C */ stw r7, 0x3c(r31)
/* 000010AC B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000010B0 80010014 */ lwz r0, 0x14(r1)
/* 000010B4 83E1000C */ lwz r31, 0xc(r1)
/* 000010B8 38210010 */ addi r1, r1, 0x10
/* 000010BC 7C0803A6 */ mtlr r0
/* 000010C0 4E800020 */ blr 
lbl_000010C4:
/* 000010C4 7C0802A6 */ mflr r0
/* 000010C8 3C600000 */ lis r3, gamePauseStatus@ha
/* 000010CC 90010004 */ stw r0, 4(r1)
/* 000010D0 3C800000 */ lis r4, lbl_0000FE78@ha
/* 000010D4 9421FF90 */ stwu r1, -0x70(r1)
/* 000010D8 BF61005C */ stmw r27, 0x5c(r1)
/* 000010DC 3B840000 */ addi r28, r4, lbl_0000FE78@l
/* 000010E0 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 000010E4 3C600000 */ lis r3, lbl_10000000@ha
/* 000010E8 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 000010EC 7000000A */ andi. r0, r0, 0xa
/* 000010F0 40820A74 */ bne lbl_00001B64
/* 000010F4 3C600000 */ lis r3, controllerInfo@ha
/* 000010F8 38630000 */ addi r3, r3, controllerInfo@l
/* 000010FC A0830018 */ lhz r4, 0x18(r3)
/* 00001100 3B630018 */ addi r27, r3, 0x18
/* 00001104 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00001108 40820010 */ bne lbl_00001118
/* 0000110C A0030030 */ lhz r0, 0x30(r3)
/* 00001110 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00001114 41820020 */ beq lbl_00001134
lbl_00001118:
/* 00001118 807D000C */ lwz r3, 0xc(r29)
/* 0000111C 38030001 */ addi r0, r3, 1
/* 00001120 2C000006 */ cmpwi r0, 6
/* 00001124 901D000C */ stw r0, 0xc(r29)
/* 00001128 4081000C */ ble lbl_00001134
/* 0000112C 38000000 */ li r0, 0
/* 00001130 901D000C */ stw r0, 0xc(r29)
lbl_00001134:
/* 00001134 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00001138 40820018 */ bne lbl_00001150
/* 0000113C 3C600000 */ lis r3, controllerInfo@ha
/* 00001140 38630000 */ addi r3, r3, controllerInfo@l
/* 00001144 A0030030 */ lhz r0, 0x30(r3)
/* 00001148 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000114C 4182001C */ beq lbl_00001168
lbl_00001150:
/* 00001150 807D000C */ lwz r3, 0xc(r29)
/* 00001154 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00001158 901D000C */ stw r0, 0xc(r29)
/* 0000115C 4080000C */ bge lbl_00001168
/* 00001160 38000006 */ li r0, 6
/* 00001164 901D000C */ stw r0, 0xc(r29)
lbl_00001168:
/* 00001168 54800529 */ rlwinm. r0, r4, 0, 0x14, 0x14
/* 0000116C 41820008 */ beq lbl_00001174
/* 00001170 4BFFEFED */ bl ev_sound_dest
lbl_00001174:
/* 00001174 801D000C */ lwz r0, 0xc(r29)
/* 00001178 28000006 */ cmplwi r0, 6
/* 0000117C 418109E8 */ bgt lbl_00001B64
/* 00001180 3C600000 */ lis r3, lbl_000109A8@ha
/* 00001184 38630000 */ addi r3, r3, lbl_000109A8@l
/* 00001188 5400103A */ slwi r0, r0, 2
/* 0000118C 7C03002E */ lwzx r0, r3, r0
/* 00001190 7C0903A6 */ mtctr r0
/* 00001194 4E800420 */ bctr 
lbl_00001198:
/* 00001198 A01B0000 */ lhz r0, 0(r27)
/* 0000119C 540307BD */ rlwinm. r3, r0, 0, 0x1e, 0x1e
/* 000011A0 4082002C */ bne lbl_000011CC
/* 000011A4 3C800000 */ lis r4, controllerInfo@ha
/* 000011A8 38A40000 */ addi r5, r4, controllerInfo@l
/* 000011AC A0850030 */ lhz r4, 0x30(r5)
/* 000011B0 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 000011B4 40820018 */ bne lbl_000011CC
/* 000011B8 A0A50000 */ lhz r5, 0(r5)
/* 000011BC 54A407BD */ rlwinm. r4, r5, 0, 0x1e, 0x1e
/* 000011C0 41820028 */ beq lbl_000011E8
/* 000011C4 54A4056B */ rlwinm. r4, r5, 0, 0x15, 0x15
/* 000011C8 41820020 */ beq lbl_000011E8
lbl_000011CC:
/* 000011CC 809D0010 */ lwz r4, 0x10(r29)
/* 000011D0 38840001 */ addi r4, r4, 1
/* 000011D4 2C040011 */ cmpwi r4, 0x11
/* 000011D8 909D0010 */ stw r4, 0x10(r29)
/* 000011DC 4180000C */ blt lbl_000011E8
/* 000011E0 38800000 */ li r4, 0
/* 000011E4 909D0010 */ stw r4, 0x10(r29)
lbl_000011E8:
/* 000011E8 540607FF */ clrlwi. r6, r0, 0x1f
/* 000011EC 4082002C */ bne lbl_00001218
/* 000011F0 3C800000 */ lis r4, controllerInfo@ha
/* 000011F4 38A40000 */ addi r5, r4, controllerInfo@l
/* 000011F8 A0850030 */ lhz r4, 0x30(r5)
/* 000011FC 548407FF */ clrlwi. r4, r4, 0x1f
/* 00001200 40820018 */ bne lbl_00001218
/* 00001204 A0A50000 */ lhz r5, 0(r5)
/* 00001208 54A407FF */ clrlwi. r4, r5, 0x1f
/* 0000120C 41820024 */ beq lbl_00001230
/* 00001210 54A4056B */ rlwinm. r4, r5, 0, 0x15, 0x15
/* 00001214 4182001C */ beq lbl_00001230
lbl_00001218:
/* 00001218 809D0010 */ lwz r4, 0x10(r29)
/* 0000121C 3484FFFF */ addic. r4, r4, -1  ;# fixed addi
/* 00001220 909D0010 */ stw r4, 0x10(r29)
/* 00001224 4080000C */ bge lbl_00001230
/* 00001228 38800010 */ li r4, 0x10
/* 0000122C 909D0010 */ stw r4, 0x10(r29)
lbl_00001230:
/* 00001230 2C060000 */ cmpwi r6, 0
/* 00001234 38A00001 */ li r5, 1
/* 00001238 38C50000 */ addi r6, r5, 0
/* 0000123C 4082001C */ bne lbl_00001258
/* 00001240 3C800000 */ lis r4, controllerInfo@ha
/* 00001244 38840000 */ addi r4, r4, controllerInfo@l
/* 00001248 A0840030 */ lhz r4, 0x30(r4)
/* 0000124C 548407FF */ clrlwi. r4, r4, 0x1f
/* 00001250 40820008 */ bne lbl_00001258
/* 00001254 38C00000 */ li r6, 0
lbl_00001258:
/* 00001258 2C060000 */ cmpwi r6, 0
/* 0000125C 40820030 */ bne lbl_0000128C
/* 00001260 3C800000 */ lis r4, controllerInfo@ha
/* 00001264 A0E40000 */ lhz r7, controllerInfo@l(r4)
/* 00001268 38C00000 */ li r6, 0
/* 0000126C 54E407FF */ clrlwi. r4, r7, 0x1f
/* 00001270 41820010 */ beq lbl_00001280
/* 00001274 54E4056B */ rlwinm. r4, r7, 0, 0x15, 0x15
/* 00001278 41820008 */ beq lbl_00001280
/* 0000127C 38C00001 */ li r6, 1
lbl_00001280:
/* 00001280 2C060000 */ cmpwi r6, 0
/* 00001284 40820008 */ bne lbl_0000128C
/* 00001288 38A00000 */ li r5, 0
lbl_0000128C:
/* 0000128C 2C030000 */ cmpwi r3, 0
/* 00001290 38800001 */ li r4, 1
/* 00001294 38C40000 */ addi r6, r4, 0
/* 00001298 4082001C */ bne lbl_000012B4
/* 0000129C 3C600000 */ lis r3, controllerInfo@ha
/* 000012A0 38630000 */ addi r3, r3, controllerInfo@l
/* 000012A4 A0630030 */ lhz r3, 0x30(r3)
/* 000012A8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000012AC 40820008 */ bne lbl_000012B4
/* 000012B0 38C00000 */ li r6, 0
lbl_000012B4:
/* 000012B4 2C060000 */ cmpwi r6, 0
/* 000012B8 40820030 */ bne lbl_000012E8
/* 000012BC 3C600000 */ lis r3, controllerInfo@ha
/* 000012C0 A0E30000 */ lhz r7, controllerInfo@l(r3)
/* 000012C4 38C00000 */ li r6, 0
/* 000012C8 54E307BD */ rlwinm. r3, r7, 0, 0x1e, 0x1e
/* 000012CC 41820010 */ beq lbl_000012DC
/* 000012D0 54E3056B */ rlwinm. r3, r7, 0, 0x15, 0x15
/* 000012D4 41820008 */ beq lbl_000012DC
/* 000012D8 38C00001 */ li r6, 1
lbl_000012DC:
/* 000012DC 2C060000 */ cmpwi r6, 0
/* 000012E0 40820008 */ bne lbl_000012E8
/* 000012E4 38800000 */ li r4, 0
lbl_000012E8:
/* 000012E8 7C832B79 */ or. r3, r4, r5
/* 000012EC 41820024 */ beq lbl_00001310
/* 000012F0 807D0010 */ lwz r3, 0x10(r29)
/* 000012F4 3C800000 */ lis r4, lbl_80110400@ha
/* 000012F8 38840000 */ addi r4, r4, lbl_80110400@l
/* 000012FC 1C630014 */ mulli r3, r3, 0x14
/* 00001300 7C641A14 */ add r3, r4, r3
/* 00001304 80630004 */ lwz r3, 4(r3)
/* 00001308 38630001 */ addi r3, r3, 1
/* 0000130C 907D0014 */ stw r3, 0x14(r29)
lbl_00001310:
/* 00001310 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00001314 41820008 */ beq lbl_0000131C
/* 00001318 4BFFEE45 */ bl func_80029788
lbl_0000131C:
/* 0000131C A01B0000 */ lhz r0, 0(r27)
/* 00001320 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001324 41820840 */ beq lbl_00001B64
/* 00001328 807D0010 */ lwz r3, 0x10(r29)
/* 0000132C 4BFFEE31 */ bl func_80029228
/* 00001330 48000834 */ b lbl_00001B64
lbl_00001334:
/* 00001334 A09B0000 */ lhz r4, 0(r27)
/* 00001338 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 0000133C 4082002C */ bne lbl_00001368
/* 00001340 3C600000 */ lis r3, controllerInfo@ha
/* 00001344 38630000 */ addi r3, r3, controllerInfo@l
/* 00001348 A0030030 */ lhz r0, 0x30(r3)
/* 0000134C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00001350 40820018 */ bne lbl_00001368
/* 00001354 A0630000 */ lhz r3, 0(r3)
/* 00001358 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0000135C 41820018 */ beq lbl_00001374
/* 00001360 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00001364 41820010 */ beq lbl_00001374
lbl_00001368:
/* 00001368 807D0014 */ lwz r3, 0x14(r29)
/* 0000136C 38030001 */ addi r0, r3, 1
/* 00001370 901D0014 */ stw r0, 0x14(r29)
lbl_00001374:
/* 00001374 548007FF */ clrlwi. r0, r4, 0x1f
/* 00001378 4082002C */ bne lbl_000013A4
/* 0000137C 3C600000 */ lis r3, controllerInfo@ha
/* 00001380 38630000 */ addi r3, r3, controllerInfo@l
/* 00001384 A0030030 */ lhz r0, 0x30(r3)
/* 00001388 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000138C 40820018 */ bne lbl_000013A4
/* 00001390 A0630000 */ lhz r3, 0(r3)
/* 00001394 546007FF */ clrlwi. r0, r3, 0x1f
/* 00001398 41820018 */ beq lbl_000013B0
/* 0000139C 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 000013A0 41820010 */ beq lbl_000013B0
lbl_000013A4:
/* 000013A4 807D0014 */ lwz r3, 0x14(r29)
/* 000013A8 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000013AC 901D0014 */ stw r0, 0x14(r29)
lbl_000013B0:
/* 000013B0 809D0014 */ lwz r4, 0x14(r29)
/* 000013B4 3C600000 */ lis r3, lbl_8011057C@ha
/* 000013B8 38630000 */ addi r3, r3, lbl_8011057C@l
/* 000013BC 54802036 */ slwi r0, r4, 4
/* 000013C0 7C630214 */ add r3, r3, r0
/* 000013C4 88030008 */ lbz r0, 8(r3)
/* 000013C8 2C000001 */ cmpwi r0, 1
/* 000013CC 4082003C */ bne lbl_00001408
/* 000013D0 801D0010 */ lwz r0, 0x10(r29)
/* 000013D4 3C600000 */ lis r3, lbl_80110400@ha
/* 000013D8 38630000 */ addi r3, r3, lbl_80110400@l
/* 000013DC 1C000014 */ mulli r0, r0, 0x14
/* 000013E0 7C630214 */ add r3, r3, r0
/* 000013E4 80A30004 */ lwz r5, 4(r3)
/* 000013E8 7C042800 */ cmpw r4, r5
/* 000013EC 40820014 */ bne lbl_00001400
/* 000013F0 80630018 */ lwz r3, 0x18(r3)
/* 000013F4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000013F8 901D0014 */ stw r0, 0x14(r29)
/* 000013FC 4800000C */ b lbl_00001408
lbl_00001400:
/* 00001400 38050001 */ addi r0, r5, 1
/* 00001404 901D0014 */ stw r0, 0x14(r29)
lbl_00001408:
/* 00001408 3C600000 */ lis r3, controllerInfo@ha
/* 0000140C C85C0008 */ lfd f2, 8(r28)
/* 00001410 3BC30000 */ addi r30, r3, controllerInfo@l
/* 00001414 C87C0000 */ lfd f3, 0(r28)
/* 00001418 881E0006 */ lbz r0, 6(r30)
/* 0000141C 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00001420 3FE04330 */ lis r31, 0x4330
/* 00001424 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 00001428 90010054 */ stw r0, 0x54(r1)
/* 0000142C 93E10050 */ stw r31, 0x50(r1)
/* 00001430 C8010050 */ lfd f0, 0x50(r1)
/* 00001434 FC000828 */ fsub f0, f0, f1
/* 00001438 FC020032 */ fmul f0, f2, f0
/* 0000143C FC030028 */ fsub f0, f3, f0
/* 00001440 FC00001E */ fctiwz f0, f0
/* 00001444 D8010048 */ stfd f0, 0x48(r1)
/* 00001448 8001004C */ lwz r0, 0x4c(r1)
/* 0000144C 981D0018 */ stb r0, 0x18(r29)
/* 00001450 801D0014 */ lwz r0, 0x14(r29)
/* 00001454 889D0018 */ lbz r4, 0x18(r29)
/* 00001458 5403043E */ clrlwi r3, r0, 0x10
/* 0000145C 4BFFED01 */ bl func_8002C100
/* 00001460 881E0004 */ lbz r0, 4(r30)
/* 00001464 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00001468 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000146C 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00001470 7C000774 */ extsb r0, r0
/* 00001474 6C008000 */ xoris r0, r0, 0x8000
/* 00001478 C85C0010 */ lfd f2, 0x10(r28)
/* 0000147C 90010044 */ stw r0, 0x44(r1)
/* 00001480 93E10040 */ stw r31, 0x40(r1)
/* 00001484 C8010040 */ lfd f0, 0x40(r1)
/* 00001488 FC000828 */ fsub f0, f0, f1
/* 0000148C FC020032 */ fmul f0, f2, f0
/* 00001490 FC00001E */ fctiwz f0, f0
/* 00001494 D8010038 */ stfd f0, 0x38(r1)
/* 00001498 8001003C */ lwz r0, 0x3c(r1)
/* 0000149C 981D0019 */ stb r0, 0x19(r29)
/* 000014A0 881E0005 */ lbz r0, 5(r30)
/* 000014A4 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 000014A8 7C000774 */ extsb r0, r0
/* 000014AC C85C0010 */ lfd f2, 0x10(r28)
/* 000014B0 6C008000 */ xoris r0, r0, 0x8000
/* 000014B4 90010034 */ stw r0, 0x34(r1)
/* 000014B8 93E10030 */ stw r31, 0x30(r1)
/* 000014BC C8010030 */ lfd f0, 0x30(r1)
/* 000014C0 FC000828 */ fsub f0, f0, f1
/* 000014C4 FC020032 */ fmul f0, f2, f0
/* 000014C8 FC00001E */ fctiwz f0, f0
/* 000014CC D8010028 */ stfd f0, 0x28(r1)
/* 000014D0 8001002C */ lwz r0, 0x2c(r1)
/* 000014D4 981D001A */ stb r0, 0x1a(r29)
/* 000014D8 801D0014 */ lwz r0, 0x14(r29)
/* 000014DC 889D0019 */ lbz r4, 0x19(r29)
/* 000014E0 88BD001A */ lbz r5, 0x1a(r29)
/* 000014E4 5403043E */ clrlwi r3, r0, 0x10
/* 000014E8 4BFFEC75 */ bl SoundPan
/* 000014EC 881E0002 */ lbz r0, 2(r30)
/* 000014F0 3C600000 */ lis r3, lbl_0000FED0@ha
/* 000014F4 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 000014F8 7C000774 */ extsb r0, r0
/* 000014FC C85C0020 */ lfd f2, 0x20(r28)
/* 00001500 6C008000 */ xoris r0, r0, 0x8000
/* 00001504 C87C0018 */ lfd f3, 0x18(r28)
/* 00001508 90010024 */ stw r0, 0x24(r1)
/* 0000150C 93E10020 */ stw r31, 0x20(r1)
/* 00001510 C8010020 */ lfd f0, 0x20(r1)
/* 00001514 FC000828 */ fsub f0, f0, f1
/* 00001518 FC020032 */ fmul f0, f2, f0
/* 0000151C FC03002A */ fadd f0, f3, f0
/* 00001520 FC00001E */ fctiwz f0, f0
/* 00001524 D8010018 */ stfd f0, 0x18(r1)
/* 00001528 8001001C */ lwz r0, 0x1c(r1)
/* 0000152C B01D001C */ sth r0, 0x1c(r29)
/* 00001530 801D0014 */ lwz r0, 0x14(r29)
/* 00001534 A09D001C */ lhz r4, 0x1c(r29)
/* 00001538 5403043E */ clrlwi r3, r0, 0x10
/* 0000153C 4BFFEC21 */ bl SoundPitch
/* 00001540 881E0003 */ lbz r0, 3(r30)
/* 00001544 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00001548 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000154C 7C000774 */ extsb r0, r0
/* 00001550 C85C0020 */ lfd f2, 0x20(r28)
/* 00001554 6C008000 */ xoris r0, r0, 0x8000
/* 00001558 C87C0018 */ lfd f3, 0x18(r28)
/* 0000155C 90010014 */ stw r0, 0x14(r1)
/* 00001560 93E10010 */ stw r31, 0x10(r1)
/* 00001564 C8010010 */ lfd f0, 0x10(r1)
/* 00001568 FC000828 */ fsub f0, f0, f1
/* 0000156C FC020032 */ fmul f0, f2, f0
/* 00001570 FC03002A */ fadd f0, f3, f0
/* 00001574 FC00001E */ fctiwz f0, f0
/* 00001578 D8010008 */ stfd f0, 8(r1)
/* 0000157C 8001000C */ lwz r0, 0xc(r1)
/* 00001580 B01D001E */ sth r0, 0x1e(r29)
/* 00001584 801D0014 */ lwz r0, 0x14(r29)
/* 00001588 A09D001E */ lhz r4, 0x1e(r29)
/* 0000158C 5403043E */ clrlwi r3, r0, 0x10
/* 00001590 4BFFEBCD */ bl func_8002C3E0
/* 00001594 A01E0000 */ lhz r0, 0(r30)
/* 00001598 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 0000159C 4082004C */ bne lbl_000015E8
/* 000015A0 881E0007 */ lbz r0, 7(r30)
/* 000015A4 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 000015A8 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 000015AC 9001000C */ stw r0, 0xc(r1)
/* 000015B0 C85C0028 */ lfd f2, 0x28(r28)
/* 000015B4 93E10008 */ stw r31, 8(r1)
/* 000015B8 C8010008 */ lfd f0, 8(r1)
/* 000015BC FC000828 */ fsub f0, f0, f1
/* 000015C0 FC020032 */ fmul f0, f2, f0
/* 000015C4 FC00001E */ fctiwz f0, f0
/* 000015C8 D8010010 */ stfd f0, 0x10(r1)
/* 000015CC 80010014 */ lwz r0, 0x14(r1)
/* 000015D0 981D0022 */ stb r0, 0x22(r29)
/* 000015D4 801D0014 */ lwz r0, 0x14(r29)
/* 000015D8 889D0022 */ lbz r4, 0x22(r29)
/* 000015DC 5403043E */ clrlwi r3, r0, 0x10
/* 000015E0 4BFFEB7D */ bl func_8002C4CC
/* 000015E4 48000048 */ b lbl_0000162C
lbl_000015E8:
/* 000015E8 881E0007 */ lbz r0, 7(r30)
/* 000015EC 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 000015F0 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 000015F4 9001000C */ stw r0, 0xc(r1)
/* 000015F8 C85C0028 */ lfd f2, 0x28(r28)
/* 000015FC 93E10008 */ stw r31, 8(r1)
/* 00001600 C8010008 */ lfd f0, 8(r1)
/* 00001604 FC000828 */ fsub f0, f0, f1
/* 00001608 FC020032 */ fmul f0, f2, f0
/* 0000160C FC00001E */ fctiwz f0, f0
/* 00001610 D8010010 */ stfd f0, 0x10(r1)
/* 00001614 80010014 */ lwz r0, 0x14(r1)
/* 00001618 981D0023 */ stb r0, 0x23(r29)
/* 0000161C 801D0014 */ lwz r0, 0x14(r29)
/* 00001620 889D0023 */ lbz r4, 0x23(r29)
/* 00001624 5403043E */ clrlwi r3, r0, 0x10
/* 00001628 4BFFEB35 */ bl func_8002C5B8
lbl_0000162C:
/* 0000162C 3C600000 */ lis r3, lbl_802F1DF8@ha
/* 00001630 38000000 */ li r0, 0
/* 00001634 90030000 */ stw r0, lbl_802F1DF8@l(r3)
/* 00001638 A01B0000 */ lhz r0, 0(r27)
/* 0000163C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001640 41820038 */ beq lbl_00001678
/* 00001644 881D0018 */ lbz r0, 0x18(r29)
/* 00001648 889D0019 */ lbz r4, 0x19(r29)
/* 0000164C 7C030774 */ extsb r3, r0
/* 00001650 88BD001A */ lbz r5, 0x1a(r29)
/* 00001654 3803FF81 */ addi r0, r3, -127  ;# fixed addi
/* 00001658 807D0014 */ lwz r3, 0x14(r29)
/* 0000165C 54005BA8 */ rlwinm r0, r0, 0xb, 0xe, 0x14
/* 00001660 7C600378 */ or r0, r3, r0
/* 00001664 548491DA */ rlwinm r4, r4, 0x12, 7, 0xd
/* 00001668 54A3C80C */ slwi r3, r5, 0x19
/* 0000166C 7C800378 */ or r0, r4, r0
/* 00001670 7C630378 */ or r3, r3, r0
/* 00001674 4BFFEAE9 */ bl SoundReqDirect
lbl_00001678:
/* 00001678 A01B0000 */ lhz r0, 0(r27)
/* 0000167C 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00001680 418204E4 */ beq lbl_00001B64
/* 00001684 801D0014 */ lwz r0, 0x14(r29)
/* 00001688 5403043E */ clrlwi r3, r0, 0x10
/* 0000168C 4BFFEAD1 */ bl SoundOff
/* 00001690 480004D4 */ b lbl_00001B64
lbl_00001694:
/* 00001694 3C600000 */ lis r3, controllerInfo@ha
/* 00001698 C85C0030 */ lfd f2, 0x30(r28)
/* 0000169C 38E30000 */ addi r7, r3, controllerInfo@l
/* 000016A0 88070007 */ lbz r0, 7(r7)
/* 000016A4 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 000016A8 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 000016AC 3CC04330 */ lis r6, 0x4330
/* 000016B0 9001000C */ stw r0, 0xc(r1)
/* 000016B4 3CA00000 */ lis r5, lbl_0000FEC8@ha
/* 000016B8 90C10008 */ stw r6, 8(r1)
/* 000016BC 3C800000 */ lis r4, lbl_0000FED0@ha
/* 000016C0 3C600000 */ lis r3, lbl_0000FED0@ha
/* 000016C4 C8010008 */ lfd f0, 8(r1)
/* 000016C8 FC000828 */ fsub f0, f0, f1
/* 000016CC FC020032 */ fmul f0, f2, f0
/* 000016D0 FC00001E */ fctiwz f0, f0
/* 000016D4 D8010010 */ stfd f0, 0x10(r1)
/* 000016D8 80010014 */ lwz r0, 0x14(r1)
/* 000016DC 981D0028 */ stb r0, 0x28(r29)
/* 000016E0 88070006 */ lbz r0, 6(r7)
/* 000016E4 C8250000 */ lfd f1, lbl_0000FEC8@l(r5)
/* 000016E8 9001001C */ stw r0, 0x1c(r1)
/* 000016EC C85C0030 */ lfd f2, 0x30(r28)
/* 000016F0 90C10018 */ stw r6, 0x18(r1)
/* 000016F4 C87C0000 */ lfd f3, 0(r28)
/* 000016F8 C8010018 */ lfd f0, 0x18(r1)
/* 000016FC FC000828 */ fsub f0, f0, f1
/* 00001700 FC020032 */ fmul f0, f2, f0
/* 00001704 FC030028 */ fsub f0, f3, f0
/* 00001708 FC00001E */ fctiwz f0, f0
/* 0000170C D8010020 */ stfd f0, 0x20(r1)
/* 00001710 80010024 */ lwz r0, 0x24(r1)
/* 00001714 981D0018 */ stb r0, 0x18(r29)
/* 00001718 88070004 */ lbz r0, 4(r7)
/* 0000171C C8240000 */ lfd f1, lbl_0000FED0@l(r4)
/* 00001720 7C000774 */ extsb r0, r0
/* 00001724 C85C0038 */ lfd f2, 0x38(r28)
/* 00001728 6C008000 */ xoris r0, r0, 0x8000
/* 0000172C 9001002C */ stw r0, 0x2c(r1)
/* 00001730 90C10028 */ stw r6, 0x28(r1)
/* 00001734 C8010028 */ lfd f0, 0x28(r1)
/* 00001738 FC000828 */ fsub f0, f0, f1
/* 0000173C FC020032 */ fmul f0, f2, f0
/* 00001740 FC00001E */ fctiwz f0, f0
/* 00001744 D8010030 */ stfd f0, 0x30(r1)
/* 00001748 80010034 */ lwz r0, 0x34(r1)
/* 0000174C 981D0019 */ stb r0, 0x19(r29)
/* 00001750 88070005 */ lbz r0, 5(r7)
/* 00001754 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 00001758 7C000774 */ extsb r0, r0
/* 0000175C C85C0038 */ lfd f2, 0x38(r28)
/* 00001760 6C008000 */ xoris r0, r0, 0x8000
/* 00001764 9001003C */ stw r0, 0x3c(r1)
/* 00001768 90C10038 */ stw r6, 0x38(r1)
/* 0000176C C8010038 */ lfd f0, 0x38(r1)
/* 00001770 FC000828 */ fsub f0, f0, f1
/* 00001774 FC020032 */ fmul f0, f2, f0
/* 00001778 FC00001E */ fctiwz f0, f0
/* 0000177C D8010040 */ stfd f0, 0x40(r1)
/* 00001780 80010044 */ lwz r0, 0x44(r1)
/* 00001784 981D001A */ stb r0, 0x1a(r29)
/* 00001788 881D0019 */ lbz r0, 0x19(r29)
/* 0000178C 889D001A */ lbz r4, 0x1a(r29)
/* 00001790 807D0024 */ lwz r3, 0x24(r29)
/* 00001794 540091DA */ rlwinm r0, r0, 0x12, 7, 0xd
/* 00001798 7C860774 */ extsb r6, r4
/* 0000179C 889D0028 */ lbz r4, 0x28(r29)
/* 000017A0 88BD0018 */ lbz r5, 0x18(r29)
/* 000017A4 54C6C80C */ slwi r6, r6, 0x19
/* 000017A8 7C600378 */ or r0, r3, r0
/* 000017AC 7CC30378 */ or r3, r6, r0
/* 000017B0 4BFFE9AD */ bl func_8002CA5C
/* 000017B4 480003B0 */ b lbl_00001B64
lbl_000017B8:
/* 000017B8 A09B0000 */ lhz r4, 0(r27)
/* 000017BC 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 000017C0 4082002C */ bne lbl_000017EC
/* 000017C4 3C600000 */ lis r3, controllerInfo@ha
/* 000017C8 38630000 */ addi r3, r3, controllerInfo@l
/* 000017CC A0030030 */ lhz r0, 0x30(r3)
/* 000017D0 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000017D4 40820018 */ bne lbl_000017EC
/* 000017D8 A0630000 */ lhz r3, 0(r3)
/* 000017DC 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 000017E0 41820028 */ beq lbl_00001808
/* 000017E4 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 000017E8 41820020 */ beq lbl_00001808
lbl_000017EC:
/* 000017EC 807D002C */ lwz r3, 0x2c(r29)
/* 000017F0 38030001 */ addi r0, r3, 1
/* 000017F4 2C000006 */ cmpwi r0, 6
/* 000017F8 901D002C */ stw r0, 0x2c(r29)
/* 000017FC 4180000C */ blt lbl_00001808
/* 00001800 38000000 */ li r0, 0
/* 00001804 901D002C */ stw r0, 0x2c(r29)
lbl_00001808:
/* 00001808 548007FF */ clrlwi. r0, r4, 0x1f
/* 0000180C 4082002C */ bne lbl_00001838
/* 00001810 3C600000 */ lis r3, controllerInfo@ha
/* 00001814 38630000 */ addi r3, r3, controllerInfo@l
/* 00001818 A0030030 */ lhz r0, 0x30(r3)
/* 0000181C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00001820 40820018 */ bne lbl_00001838
/* 00001824 A0630000 */ lhz r3, 0(r3)
/* 00001828 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000182C 41820024 */ beq lbl_00001850
/* 00001830 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00001834 4182001C */ beq lbl_00001850
lbl_00001838:
/* 00001838 807D002C */ lwz r3, 0x2c(r29)
/* 0000183C 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00001840 901D002C */ stw r0, 0x2c(r29)
/* 00001844 4080000C */ bge lbl_00001850
/* 00001848 38000005 */ li r0, 5
/* 0000184C 901D002C */ stw r0, 0x2c(r29)
lbl_00001850:
/* 00001850 3C600000 */ lis r3, controllerInfo@ha
/* 00001854 C85C0048 */ lfd f2, 0x48(r28)
/* 00001858 38630000 */ addi r3, r3, controllerInfo@l
/* 0000185C C87C0040 */ lfd f3, 0x40(r28)
/* 00001860 88030002 */ lbz r0, 2(r3)
/* 00001864 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00001868 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000186C 7C000774 */ extsb r0, r0
/* 00001870 6C008000 */ xoris r0, r0, 0x8000
/* 00001874 9001000C */ stw r0, 0xc(r1)
/* 00001878 3C004330 */ lis r0, 0x4330
/* 0000187C 90010008 */ stw r0, 8(r1)
/* 00001880 C8010008 */ lfd f0, 8(r1)
/* 00001884 FC000828 */ fsub f0, f0, f1
/* 00001888 FC020032 */ fmul f0, f2, f0
/* 0000188C FC03002A */ fadd f0, f3, f0
/* 00001890 FC00001E */ fctiwz f0, f0
/* 00001894 D8010010 */ stfd f0, 0x10(r1)
/* 00001898 80010014 */ lwz r0, 0x14(r1)
/* 0000189C B01D0030 */ sth r0, 0x30(r29)
/* 000018A0 801D002C */ lwz r0, 0x2c(r29)
/* 000018A4 A09D0030 */ lhz r4, 0x30(r29)
/* 000018A8 5403043E */ clrlwi r3, r0, 0x10
/* 000018AC 4BFFE8B1 */ bl func_8002CEB4
/* 000018B0 A01B0000 */ lhz r0, 0(r27)
/* 000018B4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000018B8 41820010 */ beq lbl_000018C8
/* 000018BC 801D002C */ lwz r0, 0x2c(r29)
/* 000018C0 5403043E */ clrlwi r3, r0, 0x10
/* 000018C4 4BFFE899 */ bl func_8002CEAC
lbl_000018C8:
/* 000018C8 A01B0000 */ lhz r0, 0(r27)
/* 000018CC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000018D0 41820294 */ beq lbl_00001B64
/* 000018D4 801D002C */ lwz r0, 0x2c(r29)
/* 000018D8 5403043E */ clrlwi r3, r0, 0x10
/* 000018DC 4BFFE881 */ bl func_8002CEB0
/* 000018E0 48000284 */ b lbl_00001B64
lbl_000018E4:
/* 000018E4 A09B0000 */ lhz r4, 0(r27)
/* 000018E8 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 000018EC 4082002C */ bne lbl_00001918
/* 000018F0 3C600000 */ lis r3, controllerInfo@ha
/* 000018F4 38630000 */ addi r3, r3, controllerInfo@l
/* 000018F8 A0030030 */ lhz r0, 0x30(r3)
/* 000018FC 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00001900 40820018 */ bne lbl_00001918
/* 00001904 A0630000 */ lhz r3, 0(r3)
/* 00001908 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0000190C 41820028 */ beq lbl_00001934
/* 00001910 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00001914 41820020 */ beq lbl_00001934
lbl_00001918:
/* 00001918 807D0034 */ lwz r3, 0x34(r29)
/* 0000191C 38030001 */ addi r0, r3, 1
/* 00001920 2C00004A */ cmpwi r0, 0x4a
/* 00001924 901D0034 */ stw r0, 0x34(r29)
/* 00001928 4180000C */ blt lbl_00001934
/* 0000192C 38000000 */ li r0, 0
/* 00001930 901D0034 */ stw r0, 0x34(r29)
lbl_00001934:
/* 00001934 548007FF */ clrlwi. r0, r4, 0x1f
/* 00001938 4082002C */ bne lbl_00001964
/* 0000193C 3C600000 */ lis r3, controllerInfo@ha
/* 00001940 38630000 */ addi r3, r3, controllerInfo@l
/* 00001944 A0030030 */ lhz r0, 0x30(r3)
/* 00001948 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000194C 40820018 */ bne lbl_00001964
/* 00001950 A0630000 */ lhz r3, 0(r3)
/* 00001954 546007FF */ clrlwi. r0, r3, 0x1f
/* 00001958 41820024 */ beq lbl_0000197C
/* 0000195C 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00001960 4182001C */ beq lbl_0000197C
lbl_00001964:
/* 00001964 807D0034 */ lwz r3, 0x34(r29)
/* 00001968 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000196C 901D0034 */ stw r0, 0x34(r29)
/* 00001970 4080000C */ bge lbl_0000197C
/* 00001974 38000049 */ li r0, 0x49
/* 00001978 901D0034 */ stw r0, 0x34(r29)
lbl_0000197C:
/* 0000197C 5480056B */ rlwinm. r0, r4, 0, 0x15, 0x15
/* 00001980 41820014 */ beq lbl_00001994
/* 00001984 3C600000 */ lis r3, lbl_802F1DD4@ha
/* 00001988 84030000 */ lwzu r0, lbl_802F1DD4@l(r3)
/* 0000198C 68000001 */ xori r0, r0, 1
/* 00001990 90030000 */ stw r0, 0(r3)
lbl_00001994:
/* 00001994 54800529 */ rlwinm. r0, r4, 0, 0x14, 0x14
/* 00001998 41820010 */ beq lbl_000019A8
/* 0000199C 3860FFFF */ li r3, -1
/* 000019A0 38800005 */ li r4, 5
/* 000019A4 4BFFE7B9 */ bl g_play_music
lbl_000019A8:
/* 000019A8 A01B0000 */ lhz r0, 0(r27)
/* 000019AC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000019B0 41820010 */ beq lbl_000019C0
/* 000019B4 807D0034 */ lwz r3, 0x34(r29)
/* 000019B8 38800000 */ li r4, 0
/* 000019BC 4BFFE7A1 */ bl g_play_music
lbl_000019C0:
/* 000019C0 A01B0000 */ lhz r0, 0(r27)
/* 000019C4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000019C8 4182019C */ beq lbl_00001B64
/* 000019CC 3860FFFF */ li r3, -1
/* 000019D0 38800001 */ li r4, 1
/* 000019D4 4BFFE789 */ bl g_play_music
/* 000019D8 4800018C */ b lbl_00001B64
lbl_000019DC:
/* 000019DC A01B0000 */ lhz r0, 0(r27)
/* 000019E0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000019E4 41820008 */ beq lbl_000019EC
/* 000019E8 4BFFE775 */ bl func_8002D798
lbl_000019EC:
/* 000019EC A01B0000 */ lhz r0, 0(r27)
/* 000019F0 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000019F4 41820170 */ beq lbl_00001B64
/* 000019F8 4BFFE765 */ bl func_8002DA18
/* 000019FC 48000168 */ b lbl_00001B64
lbl_00001A00:
/* 00001A00 3C600000 */ lis r3, analogButtonInfo@ha
/* 00001A04 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00001A08 A0830008 */ lhz r4, 8(r3)
/* 00001A0C 54800673 */ rlwinm. r0, r4, 0, 0x19, 0x19
/* 00001A10 41820020 */ beq lbl_00001A30
/* 00001A14 807D003C */ lwz r3, 0x3c(r29)
/* 00001A18 38030001 */ addi r0, r3, 1
/* 00001A1C 2C000002 */ cmpwi r0, 2
/* 00001A20 901D003C */ stw r0, 0x3c(r29)
/* 00001A24 4081000C */ ble lbl_00001A30
/* 00001A28 38000000 */ li r0, 0
/* 00001A2C 901D003C */ stw r0, 0x3c(r29)
lbl_00001A30:
/* 00001A30 54800631 */ rlwinm. r0, r4, 0, 0x18, 0x18
/* 00001A34 4182001C */ beq lbl_00001A50
/* 00001A38 807D003C */ lwz r3, 0x3c(r29)
/* 00001A3C 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00001A40 901D003C */ stw r0, 0x3c(r29)
/* 00001A44 4080000C */ bge lbl_00001A50
/* 00001A48 38000002 */ li r0, 2
/* 00001A4C 901D003C */ stw r0, 0x3c(r29)
lbl_00001A50:
/* 00001A50 801D003C */ lwz r0, 0x3c(r29)
/* 00001A54 2C000001 */ cmpwi r0, 1
/* 00001A58 41820068 */ beq lbl_00001AC0
/* 00001A5C 40800010 */ bge lbl_00001A6C
/* 00001A60 2C000000 */ cmpwi r0, 0
/* 00001A64 40800014 */ bge lbl_00001A78
/* 00001A68 480000FC */ b lbl_00001B64
lbl_00001A6C:
/* 00001A6C 2C000003 */ cmpwi r0, 3
/* 00001A70 408000F4 */ bge lbl_00001B64
/* 00001A74 480000A0 */ b lbl_00001B14
lbl_00001A78:
/* 00001A78 3C600000 */ lis r3, analogButtonInfo@ha
/* 00001A7C 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00001A80 A0630004 */ lhz r3, 4(r3)
/* 00001A84 38800000 */ li r4, 0
/* 00001A88 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00001A8C 41820010 */ beq lbl_00001A9C
/* 00001A90 3BC00000 */ li r30, 0
/* 00001A94 38800001 */ li r4, 1
/* 00001A98 48000014 */ b lbl_00001AAC
lbl_00001A9C:
/* 00001A9C 546006B5 */ rlwinm. r0, r3, 0, 0x1a, 0x1a
/* 00001AA0 4182000C */ beq lbl_00001AAC
/* 00001AA4 3BC00001 */ li r30, 1
/* 00001AA8 38800001 */ li r4, 1
lbl_00001AAC:
/* 00001AAC 2C040000 */ cmpwi r4, 0
/* 00001AB0 418200B4 */ beq lbl_00001B64
/* 00001AB4 7FC3F378 */ mr r3, r30
/* 00001AB8 4BFFE6A5 */ bl func_8002DAB0
/* 00001ABC 480000A8 */ b lbl_00001B64
lbl_00001AC0:
/* 00001AC0 3C600000 */ lis r3, lbl_802F1DF5@ha
/* 00001AC4 38630000 */ addi r3, r3, lbl_802F1DF5@l
/* 00001AC8 88630000 */ lbz r3, 0(r3)
/* 00001ACC 548006B5 */ rlwinm. r0, r4, 0, 0x1a, 0x1a
/* 00001AD0 38A30000 */ addi r5, r3, 0
/* 00001AD4 41820008 */ beq lbl_00001ADC
/* 00001AD8 38A50005 */ addi r5, r5, 5
lbl_00001ADC:
/* 00001ADC 548006F7 */ rlwinm. r0, r4, 0, 0x1b, 0x1b
/* 00001AE0 41820008 */ beq lbl_00001AE8
/* 00001AE4 38A5FFFB */ addi r5, r5, -5  ;# fixed addi
lbl_00001AE8:
/* 00001AE8 2C050064 */ cmpwi r5, 0x64
/* 00001AEC 40810008 */ ble lbl_00001AF4
/* 00001AF0 38A00064 */ li r5, 0x64
lbl_00001AF4:
/* 00001AF4 2C050000 */ cmpwi r5, 0
/* 00001AF8 40800008 */ bge lbl_00001B00
/* 00001AFC 38A00000 */ li r5, 0
lbl_00001B00:
/* 00001B00 7C051800 */ cmpw r5, r3
/* 00001B04 41820060 */ beq lbl_00001B64
/* 00001B08 3C600000 */ lis r3, lbl_802F1DF5@ha
/* 00001B0C 98A30000 */ stb r5, lbl_802F1DF5@l(r3)
/* 00001B10 48000054 */ b lbl_00001B64
lbl_00001B14:
/* 00001B14 3C600000 */ lis r3, lbl_802F1DD9@ha
/* 00001B18 38630000 */ addi r3, r3, lbl_802F1DD9@l
/* 00001B1C 88630000 */ lbz r3, 0(r3)
/* 00001B20 548006B5 */ rlwinm. r0, r4, 0, 0x1a, 0x1a
/* 00001B24 38A30000 */ addi r5, r3, 0
/* 00001B28 41820008 */ beq lbl_00001B30
/* 00001B2C 38A50005 */ addi r5, r5, 5
lbl_00001B30:
/* 00001B30 548006F7 */ rlwinm. r0, r4, 0, 0x1b, 0x1b
/* 00001B34 41820008 */ beq lbl_00001B3C
/* 00001B38 38A5FFFB */ addi r5, r5, -5  ;# fixed addi
lbl_00001B3C:
/* 00001B3C 2C050064 */ cmpwi r5, 0x64
/* 00001B40 40810008 */ ble lbl_00001B48
/* 00001B44 38A00064 */ li r5, 0x64
lbl_00001B48:
/* 00001B48 2C050000 */ cmpwi r5, 0
/* 00001B4C 40800008 */ bge lbl_00001B54
/* 00001B50 38A00000 */ li r5, 0
lbl_00001B54:
/* 00001B54 7C051800 */ cmpw r5, r3
/* 00001B58 4182000C */ beq lbl_00001B64
/* 00001B5C 3C600000 */ lis r3, lbl_802F1DD9@ha
/* 00001B60 98A30000 */ stb r5, lbl_802F1DD9@l(r3)
lbl_00001B64:
/* 00001B64 BB61005C */ lmw r27, 0x5c(r1)
/* 00001B68 80010074 */ lwz r0, 0x74(r1)
/* 00001B6C 38210070 */ addi r1, r1, 0x70
/* 00001B70 7C0803A6 */ mtlr r0
/* 00001B74 4E800020 */ blr 
lbl_00001B78:
/* 00001B78 7C0802A6 */ mflr r0
/* 00001B7C 3C800000 */ lis r4, lbl_10000000@ha
/* 00001B80 90010004 */ stw r0, 4(r1)
/* 00001B84 3C600000 */ lis r3, lbl_000102B0@ha
/* 00001B88 9421FFE8 */ stwu r1, -0x18(r1)
/* 00001B8C 93E10014 */ stw r31, 0x14(r1)
/* 00001B90 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 00001B94 38600003 */ li r3, 3
/* 00001B98 93C10010 */ stw r30, 0x10(r1)
/* 00001B9C 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00001BA0 38800003 */ li r4, 3
/* 00001BA4 93A1000C */ stw r29, 0xc(r1)
/* 00001BA8 93810008 */ stw r28, 8(r1)
/* 00001BAC 4BFFE5B1 */ bl g_debug_set_cursor_pos
/* 00001BB0 387F0218 */ addi r3, r31, 0x218
/* 00001BB4 4CC63182 */ crclr 6
/* 00001BB8 4BFFE5A5 */ bl g_debug_printf
/* 00001BBC 38600003 */ li r3, 3
/* 00001BC0 38800005 */ li r4, 5
/* 00001BC4 4BFFE599 */ bl g_debug_set_cursor_pos
/* 00001BC8 387F0760 */ addi r3, r31, 0x760
/* 00001BCC 4CC63182 */ crclr 6
/* 00001BD0 4BFFE58D */ bl g_debug_printf
/* 00001BD4 3B800000 */ li r28, 0
/* 00001BD8 3C600000 */ lis r3, lbl_8020149C@ha
/* 00001BDC 5784103A */ slwi r4, r28, 2
/* 00001BE0 38030000 */ addi r0, r3, lbl_8020149C@l
/* 00001BE4 7FA02214 */ add r29, r0, r4
lbl_00001BE8:
/* 00001BE8 809D0000 */ lwz r4, 0(r29)
/* 00001BEC 387F076C */ addi r3, r31, 0x76c
/* 00001BF0 4CC63182 */ crclr 6
/* 00001BF4 4BFFE569 */ bl g_debug_printf
/* 00001BF8 3B9C0001 */ addi r28, r28, 1
/* 00001BFC 2C1C0009 */ cmpwi r28, 9
/* 00001C00 3BBD0004 */ addi r29, r29, 4
/* 00001C04 4180FFE4 */ blt lbl_00001BE8
/* 00001C08 387F0770 */ addi r3, r31, 0x770
/* 00001C0C 4CC63182 */ crclr 6
/* 00001C10 4BFFE54D */ bl g_debug_printf
/* 00001C14 3C600000 */ lis r3, lbl_802F1E00@ha
/* 00001C18 4CC63182 */ crclr 6
/* 00001C1C 80830000 */ lwz r4, lbl_802F1E00@l(r3)
/* 00001C20 387F0774 */ addi r3, r31, 0x774
/* 00001C24 4BFFE539 */ bl g_debug_printf
/* 00001C28 3B800000 */ li r28, 0
/* 00001C2C 3C600000 */ lis r3, lbl_802014C0@ha
/* 00001C30 5784103A */ slwi r4, r28, 2
/* 00001C34 38030000 */ addi r0, r3, lbl_802014C0@l
/* 00001C38 7FA02214 */ add r29, r0, r4
lbl_00001C3C:
/* 00001C3C 809D0000 */ lwz r4, 0(r29)
/* 00001C40 387F0780 */ addi r3, r31, 0x780
/* 00001C44 4CC63182 */ crclr 6
/* 00001C48 4BFFE515 */ bl g_debug_printf
/* 00001C4C 3B9C0001 */ addi r28, r28, 1
/* 00001C50 2C1C0008 */ cmpwi r28, 8
/* 00001C54 3BBD0004 */ addi r29, r29, 4
/* 00001C58 4180FFE4 */ blt lbl_00001C3C
/* 00001C5C 387F0788 */ addi r3, r31, 0x788
/* 00001C60 4CC63182 */ crclr 6
/* 00001C64 4BFFE4F9 */ bl g_debug_printf
/* 00001C68 38600003 */ li r3, 3
/* 00001C6C 38800007 */ li r4, 7
/* 00001C70 4BFFE4ED */ bl g_debug_set_cursor_pos
/* 00001C74 3C600000 */ lis r3, lbl_802F1DEC@ha
/* 00001C78 4CC63182 */ crclr 6
/* 00001C7C 80830000 */ lwz r4, lbl_802F1DEC@l(r3)
/* 00001C80 387F078C */ addi r3, r31, 0x78c
/* 00001C84 4BFFE4D9 */ bl g_debug_printf
/* 00001C88 3C600000 */ lis r3, lbl_802F1DF0@ha
/* 00001C8C 4CC63182 */ crclr 6
/* 00001C90 80830000 */ lwz r4, lbl_802F1DF0@l(r3)
/* 00001C94 387F079C */ addi r3, r31, 0x79c
/* 00001C98 3CA00070 */ lis r5, 0x70
/* 00001C9C 4BFFE4C1 */ bl g_debug_printf
/* 00001CA0 38600003 */ li r3, 3
/* 00001CA4 3880000A */ li r4, 0xa
/* 00001CA8 4BFFE4B5 */ bl g_debug_set_cursor_pos
/* 00001CAC 809E0010 */ lwz r4, 0x10(r30)
/* 00001CB0 3C600000 */ lis r3, lbl_80110400@ha
/* 00001CB4 38030000 */ addi r0, r3, lbl_80110400@l
/* 00001CB8 4CC63182 */ crclr 6
/* 00001CBC 1C640014 */ mulli r3, r4, 0x14
/* 00001CC0 7C601A14 */ add r3, r0, r3
/* 00001CC4 80A30000 */ lwz r5, 0(r3)
/* 00001CC8 387F07B4 */ addi r3, r31, 0x7b4
/* 00001CCC 4BFFE491 */ bl g_debug_printf
/* 00001CD0 809E0014 */ lwz r4, 0x14(r30)
/* 00001CD4 3C600000 */ lis r3, lbl_8011057C@ha
/* 00001CD8 3BA30000 */ addi r29, r3, lbl_8011057C@l
/* 00001CDC 4CC63182 */ crclr 6
/* 00001CE0 54802036 */ slwi r0, r4, 4
/* 00001CE4 7C7D0214 */ add r3, r29, r0
/* 00001CE8 80A30004 */ lwz r5, 4(r3)
/* 00001CEC 387F07C4 */ addi r3, r31, 0x7c4
/* 00001CF0 4BFFE46D */ bl g_debug_printf
/* 00001CF4 809E0024 */ lwz r4, 0x24(r30)
/* 00001CF8 387F07D4 */ addi r3, r31, 0x7d4
/* 00001CFC 4CC63182 */ crclr 6
/* 00001D00 4BFFE45D */ bl g_debug_printf
/* 00001D04 809E002C */ lwz r4, 0x2c(r30)
/* 00001D08 387F07E0 */ addi r3, r31, 0x7e0
/* 00001D0C 4CC63182 */ crclr 6
/* 00001D10 4BFFE44D */ bl g_debug_printf
/* 00001D14 809E0034 */ lwz r4, 0x34(r30)
/* 00001D18 387F07EC */ addi r3, r31, 0x7ec
/* 00001D1C 4CC63182 */ crclr 6
/* 00001D20 54802036 */ slwi r0, r4, 4
/* 00001D24 7CBD0214 */ add r5, r29, r0
/* 00001D28 80A53DA4 */ lwz r5, 0x3da4(r5)
/* 00001D2C 4BFFE431 */ bl g_debug_printf
/* 00001D30 387F07FC */ addi r3, r31, 0x7fc
/* 00001D34 4CC63182 */ crclr 6
/* 00001D38 4BFFE425 */ bl g_debug_printf
/* 00001D3C 387F0804 */ addi r3, r31, 0x804
/* 00001D40 4CC63182 */ crclr 6
/* 00001D44 4BFFE419 */ bl g_debug_printf
/* 00001D48 38600005 */ li r3, 5
/* 00001D4C 38800012 */ li r4, 0x12
/* 00001D50 4BFFE40D */ bl g_debug_set_cursor_pos
/* 00001D54 801E000C */ lwz r0, 0xc(r30)
/* 00001D58 2C000004 */ cmpwi r0, 4
/* 00001D5C 41820118 */ beq lbl_00001E74
/* 00001D60 4080001C */ bge lbl_00001D7C
/* 00001D64 2C000002 */ cmpwi r0, 2
/* 00001D68 418200B0 */ beq lbl_00001E18
/* 00001D6C 408000F4 */ bge lbl_00001E60
/* 00001D70 2C000001 */ cmpwi r0, 1
/* 00001D74 40800014 */ bge lbl_00001D88
/* 00001D78 4800018C */ b lbl_00001F04
lbl_00001D7C:
/* 00001D7C 2C000006 */ cmpwi r0, 6
/* 00001D80 41820120 */ beq lbl_00001EA0
/* 00001D84 48000180 */ b lbl_00001F04
lbl_00001D88:
/* 00001D88 889E0018 */ lbz r4, 0x18(r30)
/* 00001D8C 387F0810 */ addi r3, r31, 0x810
/* 00001D90 4CC63182 */ crclr 6
/* 00001D94 7C840774 */ extsb r4, r4
/* 00001D98 4BFFE3C5 */ bl g_debug_printf
/* 00001D9C 889E0019 */ lbz r4, 0x19(r30)
/* 00001DA0 387F081C */ addi r3, r31, 0x81c
/* 00001DA4 88BE001A */ lbz r5, 0x1a(r30)
/* 00001DA8 4CC63182 */ crclr 6
/* 00001DAC 7C840774 */ extsb r4, r4
/* 00001DB0 7CA50774 */ extsb r5, r5
/* 00001DB4 4BFFE3A9 */ bl g_debug_printf
/* 00001DB8 A09E001C */ lhz r4, 0x1c(r30)
/* 00001DBC 387F082C */ addi r3, r31, 0x82c
/* 00001DC0 4CC63182 */ crclr 6
/* 00001DC4 4BFFE399 */ bl g_debug_printf
/* 00001DC8 A09E001E */ lhz r4, 0x1e(r30)
/* 00001DCC 387F0838 */ addi r3, r31, 0x838
/* 00001DD0 4CC63182 */ crclr 6
/* 00001DD4 4BFFE389 */ bl g_debug_printf
/* 00001DD8 3C600000 */ lis r3, controllerInfo@ha
/* 00001DDC A0030000 */ lhz r0, controllerInfo@l(r3)
/* 00001DE0 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 00001DE4 40820018 */ bne lbl_00001DFC
/* 00001DE8 889E0022 */ lbz r4, 0x22(r30)
/* 00001DEC 387F0844 */ addi r3, r31, 0x844
/* 00001DF0 4CC63182 */ crclr 6
/* 00001DF4 4BFFE369 */ bl g_debug_printf
/* 00001DF8 48000014 */ b lbl_00001E0C
lbl_00001DFC:
/* 00001DFC 889E0023 */ lbz r4, 0x23(r30)
/* 00001E00 387F0850 */ addi r3, r31, 0x850
/* 00001E04 4CC63182 */ crclr 6
/* 00001E08 4BFFE355 */ bl g_debug_printf
lbl_00001E0C:
/* 00001E0C 387F085C */ addi r3, r31, 0x85c
/* 00001E10 4BFFE34D */ bl g_debug_print
/* 00001E14 480000F0 */ b lbl_00001F04
lbl_00001E18:
/* 00001E18 889E0028 */ lbz r4, 0x28(r30)
/* 00001E1C 387F0880 */ addi r3, r31, 0x880
/* 00001E20 4CC63182 */ crclr 6
/* 00001E24 7C840774 */ extsb r4, r4
/* 00001E28 4BFFE335 */ bl g_debug_printf
/* 00001E2C 889E0018 */ lbz r4, 0x18(r30)
/* 00001E30 387F0810 */ addi r3, r31, 0x810
/* 00001E34 4CC63182 */ crclr 6
/* 00001E38 7C840774 */ extsb r4, r4
/* 00001E3C 4BFFE321 */ bl g_debug_printf
/* 00001E40 889E0019 */ lbz r4, 0x19(r30)
/* 00001E44 387F081C */ addi r3, r31, 0x81c
/* 00001E48 88BE001A */ lbz r5, 0x1a(r30)
/* 00001E4C 4CC63182 */ crclr 6
/* 00001E50 7C840774 */ extsb r4, r4
/* 00001E54 7CA50774 */ extsb r5, r5
/* 00001E58 4BFFE305 */ bl g_debug_printf
/* 00001E5C 480000A8 */ b lbl_00001F04
lbl_00001E60:
/* 00001E60 A09E0030 */ lhz r4, 0x30(r30)
/* 00001E64 387F088C */ addi r3, r31, 0x88c
/* 00001E68 4CC63182 */ crclr 6
/* 00001E6C 4BFFE2F1 */ bl g_debug_printf
/* 00001E70 48000094 */ b lbl_00001F04
lbl_00001E74:
/* 00001E74 3C600000 */ lis r3, lbl_802F1DD4@ha
/* 00001E78 80030000 */ lwz r0, lbl_802F1DD4@l(r3)
/* 00001E7C 2C000000 */ cmpwi r0, 0
/* 00001E80 4182000C */ beq lbl_00001E8C
/* 00001E84 389F0898 */ addi r4, r31, 0x898
/* 00001E88 48000008 */ b lbl_00001E90
lbl_00001E8C:
/* 00001E8C 389F08A0 */ addi r4, r31, 0x8a0
lbl_00001E90:
/* 00001E90 4CC63182 */ crclr 6
/* 00001E94 387F08A8 */ addi r3, r31, 0x8a8
/* 00001E98 4BFFE2C5 */ bl g_debug_printf
/* 00001E9C 48000068 */ b lbl_00001F04
lbl_00001EA0:
/* 00001EA0 4BFFE2BD */ bl OSGetSoundMode
/* 00001EA4 5460103A */ slwi r0, r3, 2
/* 00001EA8 4CC63182 */ crclr 6
/* 00001EAC 7C7F0214 */ add r3, r31, r0
/* 00001EB0 8083072C */ lwz r4, 0x72c(r3)
/* 00001EB4 387F08B4 */ addi r3, r31, 0x8b4
/* 00001EB8 4BFFE2A5 */ bl g_debug_printf
/* 00001EBC 3C600000 */ lis r3, lbl_802F1DF5@ha
/* 00001EC0 4CC63182 */ crclr 6
/* 00001EC4 88830000 */ lbz r4, lbl_802F1DF5@l(r3)
/* 00001EC8 387F08C0 */ addi r3, r31, 0x8c0
/* 00001ECC 4BFFE291 */ bl g_debug_printf
/* 00001ED0 3C600000 */ lis r3, lbl_802F1DD9@ha
/* 00001ED4 4CC63182 */ crclr 6
/* 00001ED8 88830000 */ lbz r4, lbl_802F1DD9@l(r3)
/* 00001EDC 387F08D0 */ addi r3, r31, 0x8d0
/* 00001EE0 4BFFE27D */ bl g_debug_printf
/* 00001EE4 809E003C */ lwz r4, 0x3c(r30)
/* 00001EE8 38600003 */ li r3, 3
/* 00001EEC 38840012 */ addi r4, r4, 0x12
/* 00001EF0 5484043E */ clrlwi r4, r4, 0x10
/* 00001EF4 4BFFE269 */ bl g_debug_set_cursor_pos
/* 00001EF8 387F0400 */ addi r3, r31, 0x400
/* 00001EFC 4CC63182 */ crclr 6
/* 00001F00 4BFFE25D */ bl g_debug_printf
lbl_00001F04:
/* 00001F04 809E000C */ lwz r4, 0xc(r30)
/* 00001F08 38600001 */ li r3, 1
/* 00001F0C 3884000A */ addi r4, r4, 0xa
/* 00001F10 5484043E */ clrlwi r4, r4, 0x10
/* 00001F14 4BFFE249 */ bl g_debug_set_cursor_pos
/* 00001F18 38600001 */ li r3, 1
/* 00001F1C 4BFFE241 */ bl g_debug_set_text_color
/* 00001F20 387F0400 */ addi r3, r31, 0x400
/* 00001F24 4CC63182 */ crclr 6
/* 00001F28 4BFFE235 */ bl g_debug_printf
/* 00001F2C 38600000 */ li r3, 0
/* 00001F30 4BFFE22D */ bl g_debug_set_text_color
/* 00001F34 8001001C */ lwz r0, 0x1c(r1)
/* 00001F38 83E10014 */ lwz r31, 0x14(r1)
/* 00001F3C 83C10010 */ lwz r30, 0x10(r1)
/* 00001F40 7C0803A6 */ mtlr r0
/* 00001F44 83A1000C */ lwz r29, 0xc(r1)
/* 00001F48 83810008 */ lwz r28, 8(r1)
/* 00001F4C 38210018 */ addi r1, r1, 0x18
/* 00001F50 4E800020 */ blr 
lbl_00001F54:
/* 00001F54 7C0802A6 */ mflr r0
/* 00001F58 3C600000 */ lis r3, lbl_10000000@ha
/* 00001F5C 90010004 */ stw r0, 4(r1)
/* 00001F60 38000000 */ li r0, 0
/* 00001F64 388001E0 */ li r4, 0x1e0
/* 00001F68 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001F6C 38A00006 */ li r5, 6
/* 00001F70 38C00000 */ li r6, 0
/* 00001F74 93E1000C */ stw r31, 0xc(r1)
/* 00001F78 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00001F7C 38600280 */ li r3, 0x280
/* 00001F80 93C10008 */ stw r30, 8(r1)
/* 00001F84 38E00000 */ li r7, 0
/* 00001F88 901F0040 */ stw r0, 0x40(r31)
/* 00001F8C 380000C0 */ li r0, 0xc0
/* 00001F90 901F0044 */ stw r0, 0x44(r31)
/* 00001F94 4BFFE1C9 */ bl GXGetTexBufferSize
/* 00001F98 801F0068 */ lwz r0, 0x68(r31)
/* 00001F9C 3BDF0068 */ addi r30, r31, 0x68
/* 00001FA0 38830000 */ addi r4, r3, 0
/* 00001FA4 28000000 */ cmplwi r0, 0
/* 00001FA8 40820018 */ bne lbl_00001FC0
/* 00001FAC 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00001FB0 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00001FB4 80630000 */ lwz r3, 0(r3)
/* 00001FB8 4BFFE1A5 */ bl OSAllocFromHeap
/* 00001FBC 907E0000 */ stw r3, 0(r30)
lbl_00001FC0:
/* 00001FC0 809E0000 */ lwz r4, 0(r30)
/* 00001FC4 28040000 */ cmplwi r4, 0
/* 00001FC8 40820014 */ bne lbl_00001FDC
/* 00001FCC 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00001FD0 3800005F */ li r0, 0x5f
/* 00001FD4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00001FD8 48000058 */ b lbl_00002030
lbl_00001FDC:
/* 00001FDC 801F0040 */ lwz r0, 0x40(r31)
/* 00001FE0 3C600000 */ lis r3, currRenderMode@ha
/* 00001FE4 80E30000 */ lwz r7, currRenderMode@l(r3)
/* 00001FE8 3C600000 */ lis r3, lbl_00010BEC@ha
/* 00001FEC 54061838 */ slwi r6, r0, 3
/* 00001FF0 38030000 */ addi r0, r3, lbl_00010BEC@l
/* 00001FF4 A0A70004 */ lhz r5, 4(r7)
/* 00001FF8 7C603214 */ add r3, r0, r6
/* 00001FFC A0C70006 */ lhz r6, 6(r7)
/* 00002000 80E30000 */ lwz r7, 0(r3)
/* 00002004 387F0048 */ addi r3, r31, 0x48
/* 00002008 39000000 */ li r8, 0
/* 0000200C 39200000 */ li r9, 0
/* 00002010 39400000 */ li r10, 0
/* 00002014 4BFFE149 */ bl GXInitTexObj
/* 00002018 4BFFE145 */ bl func_80049FF0
/* 0000201C 38600002 */ li r3, 2
/* 00002020 4BFFE13D */ bl camera_set_state
/* 00002024 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002028 38000068 */ li r0, 0x68
/* 0000202C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00002030:
/* 00002030 80010014 */ lwz r0, 0x14(r1)
/* 00002034 83E1000C */ lwz r31, 0xc(r1)
/* 00002038 83C10008 */ lwz r30, 8(r1)
/* 0000203C 7C0803A6 */ mtlr r0
/* 00002040 38210010 */ addi r1, r1, 0x10
/* 00002044 4E800020 */ blr 
lbl_00002048:
/* 00002048 7C0802A6 */ mflr r0
/* 0000204C 3C600000 */ lis r3, controllerInfo@ha
/* 00002050 90010004 */ stw r0, 4(r1)
/* 00002054 38630000 */ addi r3, r3, controllerInfo@l
/* 00002058 9421FFF8 */ stwu r1, -8(r1)
/* 0000205C A0A30018 */ lhz r5, 0x18(r3)
/* 00002060 3C600000 */ lis r3, lbl_10000000@ha
/* 00002064 38830000 */ addi r4, r3, lbl_10000000@l
/* 00002068 54A007FF */ clrlwi. r0, r5, 0x1f
/* 0000206C 41820024 */ beq lbl_00002090
/* 00002070 80640040 */ lwz r3, 0x40(r4)
/* 00002074 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00002078 90040040 */ stw r0, 0x40(r4)
/* 0000207C 80040040 */ lwz r0, 0x40(r4)
/* 00002080 2C000000 */ cmpwi r0, 0
/* 00002084 4080000C */ bge lbl_00002090
/* 00002088 38000006 */ li r0, 6
/* 0000208C 90040040 */ stw r0, 0x40(r4)
lbl_00002090:
/* 00002090 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00002094 41820024 */ beq lbl_000020B8
/* 00002098 80640040 */ lwz r3, 0x40(r4)
/* 0000209C 38030001 */ addi r0, r3, 1
/* 000020A0 90040040 */ stw r0, 0x40(r4)
/* 000020A4 80040040 */ lwz r0, 0x40(r4)
/* 000020A8 28000006 */ cmplwi r0, 6
/* 000020AC 4081000C */ ble lbl_000020B8
/* 000020B0 38000000 */ li r0, 0
/* 000020B4 90040040 */ stw r0, 0x40(r4)
lbl_000020B8:
/* 000020B8 54A00739 */ rlwinm. r0, r5, 0, 0x1c, 0x1c
/* 000020BC 4182001C */ beq lbl_000020D8
/* 000020C0 38C40044 */ addi r6, r4, 0x44
/* 000020C4 80640044 */ lwz r3, 0x44(r4)
/* 000020C8 2C0300FF */ cmpwi r3, 0xff
/* 000020CC 4080000C */ bge lbl_000020D8
/* 000020D0 38030001 */ addi r0, r3, 1
/* 000020D4 90060000 */ stw r0, 0(r6)
lbl_000020D8:
/* 000020D8 54A0077B */ rlwinm. r0, r5, 0, 0x1d, 0x1d
/* 000020DC 41820018 */ beq lbl_000020F4
/* 000020E0 84640044 */ lwzu r3, 0x44(r4)
/* 000020E4 2C030000 */ cmpwi r3, 0
/* 000020E8 4081000C */ ble lbl_000020F4
/* 000020EC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000020F0 90040000 */ stw r0, 0(r4)
lbl_000020F4:
/* 000020F4 4BFFE069 */ bl func_8004A0C8
/* 000020F8 8001000C */ lwz r0, 0xc(r1)
/* 000020FC 38210008 */ addi r1, r1, 8
/* 00002100 7C0803A6 */ mtlr r0
/* 00002104 4E800020 */ blr 
lbl_00002108:
/* 00002108 7C0802A6 */ mflr r0
/* 0000210C 3C600000 */ lis r3, lbl_10000040@ha
/* 00002110 90010004 */ stw r0, 4(r1)
/* 00002114 38630000 */ addi r3, r3, lbl_10000040@l
/* 00002118 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000211C 93E1000C */ stw r31, 0xc(r1)
/* 00002120 3BE30028 */ addi r31, r3, 0x28
/* 00002124 80830028 */ lwz r4, 0x28(r3)
/* 00002128 28040000 */ cmplwi r4, 0
/* 0000212C 4182001C */ beq lbl_00002148
/* 00002130 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00002134 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00002138 80630000 */ lwz r3, 0(r3)
/* 0000213C 4BFFE021 */ bl OSFreeToHeap
/* 00002140 38000000 */ li r0, 0
/* 00002144 901F0000 */ stw r0, 0(r31)
lbl_00002148:
/* 00002148 80010014 */ lwz r0, 0x14(r1)
/* 0000214C 83E1000C */ lwz r31, 0xc(r1)
/* 00002150 38210010 */ addi r1, r1, 0x10
/* 00002154 7C0803A6 */ mtlr r0
/* 00002158 4E800020 */ blr 
lbl_0000215C:
/* 0000215C 7C0802A6 */ mflr r0
/* 00002160 3C600000 */ lis r3, lbl_0000FE78@ha
/* 00002164 90010004 */ stw r0, 4(r1)
/* 00002168 9421FF98 */ stwu r1, -0x68(r1)
/* 0000216C 93E10064 */ stw r31, 0x64(r1)
/* 00002170 3BE30000 */ addi r31, r3, lbl_0000FE78@l
/* 00002174 38610010 */ addi r3, r1, 0x10
/* 00002178 93C10060 */ stw r30, 0x60(r1)
/* 0000217C C03F0064 */ lfs f1, 0x64(r31)
/* 00002180 C05F0068 */ lfs f2, 0x68(r31)
/* 00002184 C07F006C */ lfs f3, 0x6c(r31)
/* 00002188 C09F0070 */ lfs f4, 0x70(r31)
/* 0000218C 4BFFDFD1 */ bl C_MTXPerspective
/* 00002190 38610010 */ addi r3, r1, 0x10
/* 00002194 38800000 */ li r4, 0
/* 00002198 4BFFDFC5 */ bl GXSetProjection
/* 0000219C 380000FF */ li r0, 0xff
/* 000021A0 98010050 */ stb r0, 0x50(r1)
/* 000021A4 3C600000 */ lis r3, lbl_10000040@ha
/* 000021A8 3BC30000 */ addi r30, r3, lbl_10000040@l
/* 000021AC 98010051 */ stb r0, 0x51(r1)
/* 000021B0 3881000C */ addi r4, r1, 0xc
/* 000021B4 38600004 */ li r3, 4
/* 000021B8 98010052 */ stb r0, 0x52(r1)
/* 000021BC 801E0004 */ lwz r0, 4(r30)
/* 000021C0 98010053 */ stb r0, 0x53(r1)
/* 000021C4 80010050 */ lwz r0, 0x50(r1)
/* 000021C8 9001000C */ stw r0, 0xc(r1)
/* 000021CC 4BFFDF91 */ bl GXSetChanMatColor
/* 000021D0 38000000 */ li r0, 0
/* 000021D4 98010050 */ stb r0, 0x50(r1)
/* 000021D8 38810008 */ addi r4, r1, 8
/* 000021DC 38600004 */ li r3, 4
/* 000021E0 98010051 */ stb r0, 0x51(r1)
/* 000021E4 98010052 */ stb r0, 0x52(r1)
/* 000021E8 98010053 */ stb r0, 0x53(r1)
/* 000021EC 80010050 */ lwz r0, 0x50(r1)
/* 000021F0 90010008 */ stw r0, 8(r1)
/* 000021F4 4BFFDF69 */ bl GXSetChanAmbColor
/* 000021F8 38600004 */ li r3, 4
/* 000021FC 38800000 */ li r4, 0
/* 00002200 38A00000 */ li r5, 0
/* 00002204 38C00000 */ li r6, 0
/* 00002208 38E00000 */ li r7, 0
/* 0000220C 39000002 */ li r8, 2
/* 00002210 39200001 */ li r9, 1
/* 00002214 4BFFDF49 */ bl GXSetChanCtrl
/* 00002218 38600001 */ li r3, 1
/* 0000221C 4BFFDF41 */ bl GXSetNumChans
/* 00002220 4BFFDF3D */ bl GXInvalidateTexAll
/* 00002224 387E0008 */ addi r3, r30, 8
/* 00002228 38800000 */ li r4, 0
/* 0000222C 4BFFDF31 */ bl func_8009F430
/* 00002230 38600000 */ li r3, 0
/* 00002234 38800000 */ li r4, 0
/* 00002238 38A00000 */ li r5, 0
/* 0000223C 38C0001E */ li r6, 0x1e
/* 00002240 38E00000 */ li r7, 0
/* 00002244 3900007D */ li r8, 0x7d
/* 00002248 4BFFDF15 */ bl GXSetTexCoordGen2
/* 0000224C 4BFFDF11 */ bl mathutil_mtxA_from_identity
/* 00002250 3C600000 */ lis r3, mathutilData@ha
/* 00002254 C01F0074 */ lfs f0, 0x74(r31)
/* 00002258 39030000 */ addi r8, r3, mathutilData@l
/* 0000225C 80A80000 */ lwz r5, 0(r8)
/* 00002260 3C800000 */ lis r4, currRenderMode@ha
/* 00002264 38C40000 */ addi r6, r4, currRenderMode@l
/* 00002268 D0050000 */ stfs f0, 0(r5)
/* 0000226C 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00002270 3C004330 */ lis r0, 0x4330
/* 00002274 C01F0078 */ lfs f0, 0x78(r31)
/* 00002278 3880001E */ li r4, 0x1e
/* 0000227C 80E80000 */ lwz r7, 0(r8)
/* 00002280 38A00000 */ li r5, 0
/* 00002284 D0070008 */ stfs f0, 8(r7)
/* 00002288 C01F007C */ lfs f0, 0x7c(r31)
/* 0000228C 80E80000 */ lwz r7, 0(r8)
/* 00002290 D0070014 */ stfs f0, 0x14(r7)
/* 00002294 80C60000 */ lwz r6, 0(r6)
/* 00002298 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 0000229C A0660006 */ lhz r3, 6(r6)
/* 000022A0 C05F0078 */ lfs f2, 0x78(r31)
/* 000022A4 9061005C */ stw r3, 0x5c(r1)
/* 000022A8 80680000 */ lwz r3, 0(r8)
/* 000022AC 90010058 */ stw r0, 0x58(r1)
/* 000022B0 C8010058 */ lfd f0, 0x58(r1)
/* 000022B4 EC000828 */ fsubs f0, f0, f1
/* 000022B8 EC020024 */ fdivs f0, f2, f0
/* 000022BC EC020028 */ fsubs f0, f2, f0
/* 000022C0 D0030018 */ stfs f0, 0x18(r3)
/* 000022C4 80680000 */ lwz r3, 0(r8)
/* 000022C8 4BFFDE95 */ bl GXLoadTexMtxImm
/* 000022CC 38600000 */ li r3, 0
/* 000022D0 38800000 */ li r4, 0
/* 000022D4 38A00000 */ li r5, 0
/* 000022D8 38C00004 */ li r6, 4
/* 000022DC 4BFFDE81 */ bl func_8009EFF4
/* 000022E0 38600000 */ li r3, 0
/* 000022E4 3880000F */ li r4, 0xf
/* 000022E8 38A0000A */ li r5, 0xa
/* 000022EC 38C00008 */ li r6, 8
/* 000022F0 38E0000F */ li r7, 0xf
/* 000022F4 4BFFDE69 */ bl func_8009E618
/* 000022F8 38600000 */ li r3, 0
/* 000022FC 38800000 */ li r4, 0
/* 00002300 38A00000 */ li r5, 0
/* 00002304 38C00000 */ li r6, 0
/* 00002308 38E00001 */ li r7, 1
/* 0000230C 39000000 */ li r8, 0
/* 00002310 4BFFDE4D */ bl func_8009E800
/* 00002314 38600000 */ li r3, 0
/* 00002318 38800007 */ li r4, 7
/* 0000231C 38A00007 */ li r5, 7
/* 00002320 38C00007 */ li r6, 7
/* 00002324 38E00005 */ li r7, 5
/* 00002328 4BFFDE35 */ bl func_8009E70C
/* 0000232C 38600000 */ li r3, 0
/* 00002330 38800000 */ li r4, 0
/* 00002334 38A00000 */ li r5, 0
/* 00002338 38C00000 */ li r6, 0
/* 0000233C 38E00001 */ li r7, 1
/* 00002340 39000000 */ li r8, 0
/* 00002344 4BFFDE19 */ bl func_8009E918
/* 00002348 38600000 */ li r3, 0
/* 0000234C 4BFFDE11 */ bl GXSetTevDirect
/* 00002350 38600001 */ li r3, 1
/* 00002354 4BFFDE09 */ bl func_8009F2C8
/* 00002358 38600001 */ li r3, 1
/* 0000235C 4BFFDE01 */ bl GXSetNumTexGens
/* 00002360 38600000 */ li r3, 0
/* 00002364 4BFFDDF9 */ bl GXSetNumIndStages
/* 00002368 38600001 */ li r3, 1
/* 0000236C 38800004 */ li r4, 4
/* 00002370 38A00005 */ li r5, 5
/* 00002374 38C00000 */ li r6, 0
/* 00002378 4BFFDDE5 */ bl func_8009E110
/* 0000237C 3C600000 */ lis r3, zMode@ha
/* 00002380 38630000 */ addi r3, r3, zMode@l
/* 00002384 80630000 */ lwz r3, 0(r3)
/* 00002388 88030008 */ lbz r0, 8(r3)
/* 0000238C 28000000 */ cmplwi r0, 0
/* 00002390 4082001C */ bne lbl_000023AC
/* 00002394 80030004 */ lwz r0, 4(r3)
/* 00002398 2C000007 */ cmpwi r0, 7
/* 0000239C 40820010 */ bne lbl_000023AC
/* 000023A0 88030000 */ lbz r0, 0(r3)
/* 000023A4 28000001 */ cmplwi r0, 1
/* 000023A8 41820040 */ beq lbl_000023E8
lbl_000023AC:
/* 000023AC 38600001 */ li r3, 1
/* 000023B0 38800007 */ li r4, 7
/* 000023B4 38A00000 */ li r5, 0
/* 000023B8 4BFFDDA5 */ bl GXSetZMode
/* 000023BC 3C600000 */ lis r3, zMode@ha
/* 000023C0 38A30000 */ addi r5, r3, zMode@l
/* 000023C4 80650000 */ lwz r3, 0(r5)
/* 000023C8 38000001 */ li r0, 1
/* 000023CC 38800007 */ li r4, 7
/* 000023D0 98030000 */ stb r0, 0(r3)
/* 000023D4 38000000 */ li r0, 0
/* 000023D8 80650000 */ lwz r3, 0(r5)
/* 000023DC 90830004 */ stw r4, 4(r3)
/* 000023E0 80650000 */ lwz r3, 0(r5)
/* 000023E4 98030008 */ stb r0, 8(r3)
lbl_000023E8:
/* 000023E8 4BFFDD75 */ bl func_8009AC8C
/* 000023EC 38600200 */ li r3, 0x200
/* 000023F0 4BFFDD6D */ bl gxutil_set_vtx_attrs
/* 000023F4 38600001 */ li r3, 1
/* 000023F8 38800009 */ li r4, 9
/* 000023FC 38A00001 */ li r5, 1
/* 00002400 38C00004 */ li r6, 4
/* 00002404 38E00000 */ li r7, 0
/* 00002408 4BFFDD55 */ bl GXSetVtxAttrFmt
/* 0000240C 4BFFDD51 */ bl mathutil_mtxA_from_identity
/* 00002410 3C600000 */ lis r3, mathutilData@ha
/* 00002414 38630000 */ addi r3, r3, mathutilData@l
/* 00002418 80630000 */ lwz r3, 0(r3)
/* 0000241C 38800000 */ li r4, 0
/* 00002420 4BFFDD3D */ bl GXLoadPosMtxImm
/* 00002424 38600080 */ li r3, 0x80
/* 00002428 38800001 */ li r4, 1
/* 0000242C 38A00004 */ li r5, 4
/* 00002430 4BFFDD2D */ bl GXBegin
/* 00002434 C09F0080 */ lfs f4, 0x80(r31)
/* 00002438 3C80CC01 */ lis r4, 0xcc01
/* 0000243C 3C600000 */ lis r3, zMode@ha
/* 00002440 C07F0084 */ lfs f3, 0x84(r31)
/* 00002444 D0848000 */ stfs f4, -0x8000(r4)
/* 00002448 38630000 */ addi r3, r3, zMode@l
/* 0000244C C05F0088 */ lfs f2, 0x88(r31)
/* 00002450 D0648000 */ stfs f3, -0x8000(r4)
/* 00002454 80630000 */ lwz r3, 0(r3)
/* 00002458 D0448000 */ stfs f2, -0x8000(r4)
/* 0000245C C03F008C */ lfs f1, 0x8c(r31)
/* 00002460 88030008 */ lbz r0, 8(r3)
/* 00002464 D0248000 */ stfs f1, -0x8000(r4)
/* 00002468 C01F0090 */ lfs f0, 0x90(r31)
/* 0000246C 28000001 */ cmplwi r0, 1
/* 00002470 D0648000 */ stfs f3, -0x8000(r4)
/* 00002474 D0448000 */ stfs f2, -0x8000(r4)
/* 00002478 D0248000 */ stfs f1, -0x8000(r4)
/* 0000247C D0048000 */ stfs f0, -0x8000(r4)
/* 00002480 D0448000 */ stfs f2, -0x8000(r4)
/* 00002484 D0848000 */ stfs f4, -0x8000(r4)
/* 00002488 D0048000 */ stfs f0, -0x8000(r4)
/* 0000248C D0448000 */ stfs f2, -0x8000(r4)
/* 00002490 4082001C */ bne lbl_000024AC
/* 00002494 80030004 */ lwz r0, 4(r3)
/* 00002498 2C000001 */ cmpwi r0, 1
/* 0000249C 40820010 */ bne lbl_000024AC
/* 000024A0 88030000 */ lbz r0, 0(r3)
/* 000024A4 28000001 */ cmplwi r0, 1
/* 000024A8 41820038 */ beq lbl_000024E0
lbl_000024AC:
/* 000024AC 38600001 */ li r3, 1
/* 000024B0 38800001 */ li r4, 1
/* 000024B4 38A00001 */ li r5, 1
/* 000024B8 4BFFDCA5 */ bl GXSetZMode
/* 000024BC 3C600000 */ lis r3, zMode@ha
/* 000024C0 38830000 */ addi r4, r3, zMode@l
/* 000024C4 80640000 */ lwz r3, 0(r4)
/* 000024C8 38000001 */ li r0, 1
/* 000024CC 98030000 */ stb r0, 0(r3)
/* 000024D0 80640000 */ lwz r3, 0(r4)
/* 000024D4 90030004 */ stw r0, 4(r3)
/* 000024D8 80640000 */ lwz r3, 0(r4)
/* 000024DC 98030008 */ stb r0, 8(r3)
lbl_000024E0:
/* 000024E0 4BFFDC7D */ bl func_800188D4
/* 000024E4 8001006C */ lwz r0, 0x6c(r1)
/* 000024E8 83E10064 */ lwz r31, 0x64(r1)
/* 000024EC 83C10060 */ lwz r30, 0x60(r1)
/* 000024F0 7C0803A6 */ mtlr r0
/* 000024F4 38210068 */ addi r1, r1, 0x68
/* 000024F8 4E800020 */ blr 
lbl_000024FC:
/* 000024FC 7C0802A6 */ mflr r0
/* 00002500 90010004 */ stw r0, 4(r1)
/* 00002504 9421FFF8 */ stwu r1, -8(r1)
/* 00002508 48006E31 */ bl lbl_00009338
/* 0000250C 4BFFDC51 */ bl event_finish_all
/* 00002510 3860000F */ li r3, 0xf
/* 00002514 4BFFDC49 */ bl event_start
/* 00002518 38600002 */ li r3, 2
/* 0000251C 4BFFDC41 */ bl camera_set_state
/* 00002520 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002524 3800006A */ li r0, 0x6a
/* 00002528 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 0000252C 8001000C */ lwz r0, 0xc(r1)
/* 00002530 38210008 */ addi r1, r1, 8
/* 00002534 7C0803A6 */ mtlr r0
/* 00002538 4E800020 */ blr 
lbl_0000253C:
/* 0000253C 7C0802A6 */ mflr r0
/* 00002540 90010004 */ stw r0, 4(r1)
/* 00002544 9421FFF8 */ stwu r1, -8(r1)
/* 00002548 48007019 */ bl lbl_00009560
/* 0000254C 8001000C */ lwz r0, 0xc(r1)
/* 00002550 38210008 */ addi r1, r1, 8
/* 00002554 7C0803A6 */ mtlr r0
/* 00002558 4E800020 */ blr 
lbl_0000255C:
/* 0000255C 7C0802A6 */ mflr r0
/* 00002560 90010004 */ stw r0, 4(r1)
/* 00002564 9421FFF8 */ stwu r1, -8(r1)
/* 00002568 48008DFD */ bl lbl_0000B364
/* 0000256C 38600002 */ li r3, 2
/* 00002570 4BFFDBED */ bl camera_set_state
/* 00002574 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002578 3800006C */ li r0, 0x6c
/* 0000257C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002580 8001000C */ lwz r0, 0xc(r1)
/* 00002584 38210008 */ addi r1, r1, 8
/* 00002588 7C0803A6 */ mtlr r0
/* 0000258C 4E800020 */ blr 
lbl_00002590:
/* 00002590 7C0802A6 */ mflr r0
/* 00002594 90010004 */ stw r0, 4(r1)
/* 00002598 9421FFF8 */ stwu r1, -8(r1)
/* 0000259C 48008F05 */ bl lbl_0000B4A0
/* 000025A0 8001000C */ lwz r0, 0xc(r1)
/* 000025A4 38210008 */ addi r1, r1, 8
/* 000025A8 7C0803A6 */ mtlr r0
/* 000025AC 4E800020 */ blr 
lbl_000025B0:
/* 000025B0 7C0802A6 */ mflr r0
/* 000025B4 90010004 */ stw r0, 4(r1)
/* 000025B8 9421FFF8 */ stwu r1, -8(r1)
/* 000025BC 480098FD */ bl lbl_0000BEB8
/* 000025C0 4BFFDB9D */ bl event_finish_all
/* 000025C4 4BFFDB99 */ bl func_80044920
/* 000025C8 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 000025CC 38630000 */ addi r3, r3, loadingStageIdRequest@l
/* 000025D0 A8630000 */ lha r3, 0(r3)
/* 000025D4 4BFFDB89 */ bl load_stage
/* 000025D8 38600001 */ li r3, 1
/* 000025DC 4BFFDB81 */ bl event_start
/* 000025E0 38600002 */ li r3, 2
/* 000025E4 4BFFDB79 */ bl event_start
/* 000025E8 38600003 */ li r3, 3
/* 000025EC 4BFFDB71 */ bl event_start
/* 000025F0 38600004 */ li r3, 4
/* 000025F4 4BFFDB69 */ bl event_start
/* 000025F8 38600009 */ li r3, 9
/* 000025FC 4BFFDB61 */ bl event_start
/* 00002600 38600005 */ li r3, 5
/* 00002604 4BFFDB59 */ bl event_start
/* 00002608 38600007 */ li r3, 7
/* 0000260C 4BFFDB51 */ bl event_start
/* 00002610 3860000F */ li r3, 0xf
/* 00002614 4BFFDB49 */ bl event_start
/* 00002618 38600010 */ li r3, 0x10
/* 0000261C 4BFFDB41 */ bl event_start
/* 00002620 38600012 */ li r3, 0x12
/* 00002624 4BFFDB39 */ bl event_start
/* 00002628 3860000D */ li r3, 0xd
/* 0000262C 4BFFDB31 */ bl event_start
/* 00002630 38600014 */ li r3, 0x14
/* 00002634 4BFFDB29 */ bl event_start
/* 00002638 38600013 */ li r3, 0x13
/* 0000263C 4BFFDB21 */ bl event_start
/* 00002640 38600002 */ li r3, 2
/* 00002644 4BFFDB19 */ bl camera_set_state
/* 00002648 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000264C 3800006E */ li r0, 0x6e
/* 00002650 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002654 8001000C */ lwz r0, 0xc(r1)
/* 00002658 38210008 */ addi r1, r1, 8
/* 0000265C 7C0803A6 */ mtlr r0
/* 00002660 4E800020 */ blr 
lbl_00002664:
/* 00002664 7C0802A6 */ mflr r0
/* 00002668 90010004 */ stw r0, 4(r1)
/* 0000266C 9421FFF8 */ stwu r1, -8(r1)
/* 00002670 48009979 */ bl lbl_0000BFE8
/* 00002674 8001000C */ lwz r0, 0xc(r1)
/* 00002678 38210008 */ addi r1, r1, 8
/* 0000267C 7C0803A6 */ mtlr r0
/* 00002680 4E800020 */ blr 
lbl_00002684:
/* 00002684 7C0802A6 */ mflr r0
/* 00002688 3C600000 */ lis r3, lbl_10000000@ha
/* 0000268C 90010004 */ stw r0, 4(r1)
/* 00002690 9421FFE8 */ stwu r1, -0x18(r1)
/* 00002694 93E10014 */ stw r31, 0x14(r1)
/* 00002698 3BE00000 */ li r31, 0
/* 0000269C 93C10010 */ stw r30, 0x10(r1)
/* 000026A0 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000026A4 93A1000C */ stw r29, 0xc(r1)
/* 000026A8 3BBE0078 */ addi r29, r30, 0x78
/* 000026AC 93810008 */ stw r28, 8(r1)
/* 000026B0 3B9E0070 */ addi r28, r30, 0x70
/* 000026B4 93FE006C */ stw r31, 0x6c(r30)
/* 000026B8 93FE0070 */ stw r31, 0x70(r30)
/* 000026BC 807E0078 */ lwz r3, 0x78(r30)
/* 000026C0 28030000 */ cmplwi r3, 0
/* 000026C4 4182000C */ beq lbl_000026D0
/* 000026C8 4BFFDA95 */ bl bitmap_free_tpl
/* 000026CC 93FD0000 */ stw r31, 0(r29)
lbl_000026D0:
/* 000026D0 3BDE0074 */ addi r30, r30, 0x74
/* 000026D4 809E0000 */ lwz r4, 0(r30)
/* 000026D8 28040000 */ cmplwi r4, 0
/* 000026DC 4182001C */ beq lbl_000026F8
/* 000026E0 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000026E4 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 000026E8 80630000 */ lwz r3, 0(r3)
/* 000026EC 4BFFDA71 */ bl OSFreeToHeap
/* 000026F0 38000000 */ li r0, 0
/* 000026F4 901E0000 */ stw r0, 0(r30)
lbl_000026F8:
/* 000026F8 809C0000 */ lwz r4, 0(r28)
/* 000026FC 3C600000 */ lis r3, lbl_00012330@ha
/* 00002700 38030000 */ addi r0, r3, lbl_00012330@l
/* 00002704 1C64000C */ mulli r3, r4, 0xc
/* 00002708 7C801A14 */ add r4, r0, r3
/* 0000270C 80A40004 */ lwz r5, 4(r4)
/* 00002710 7FC3F378 */ mr r3, r30
/* 00002714 80C40008 */ lwz r6, 8(r4)
/* 00002718 7FA4EB78 */ mr r4, r29
/* 0000271C 4BFFDA41 */ bl load_nlobj
/* 00002720 4BFFDA3D */ bl event_finish_all
/* 00002724 3860000F */ li r3, 0xf
/* 00002728 4BFFDA35 */ bl event_start
/* 0000272C 38600002 */ li r3, 2
/* 00002730 4BFFDA2D */ bl camera_set_state
/* 00002734 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002738 38000070 */ li r0, 0x70
/* 0000273C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002740 8001001C */ lwz r0, 0x1c(r1)
/* 00002744 83E10014 */ lwz r31, 0x14(r1)
/* 00002748 83C10010 */ lwz r30, 0x10(r1)
/* 0000274C 7C0803A6 */ mtlr r0
/* 00002750 83A1000C */ lwz r29, 0xc(r1)
/* 00002754 83810008 */ lwz r28, 8(r1)
/* 00002758 38210018 */ addi r1, r1, 0x18
/* 0000275C 4E800020 */ blr 
lbl_00002760:
/* 00002760 7C0802A6 */ mflr r0
/* 00002764 3C600000 */ lis r3, lbl_1000006C@ha
/* 00002768 90010004 */ stw r0, 4(r1)
/* 0000276C 38830000 */ addi r4, r3, lbl_1000006C@l
/* 00002770 38640008 */ addi r3, r4, 8
/* 00002774 9421FFF8 */ stwu r1, -8(r1)
/* 00002778 3884000C */ addi r4, r4, 0xc
/* 0000277C 4BFFD9E1 */ bl free_nlobj
/* 00002780 8001000C */ lwz r0, 0xc(r1)
/* 00002784 38210008 */ addi r1, r1, 8
/* 00002788 7C0803A6 */ mtlr r0
/* 0000278C 4E800020 */ blr 
lbl_00002790:
/* 00002790 7C0802A6 */ mflr r0
/* 00002794 3C600000 */ lis r3, controllerInfo@ha
/* 00002798 90010004 */ stw r0, 4(r1)
/* 0000279C 38630000 */ addi r3, r3, controllerInfo@l
/* 000027A0 9421FFA0 */ stwu r1, -0x60(r1)
/* 000027A4 BF410048 */ stmw r26, 0x48(r1)
/* 000027A8 3B830018 */ addi r28, r3, 0x18
/* 000027AC A0830018 */ lhz r4, 0x18(r3)
/* 000027B0 3C600000 */ lis r3, lbl_10000000@ha
/* 000027B4 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 000027B8 807F0070 */ lwz r3, 0x70(r31)
/* 000027BC 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 000027C0 3B5F0070 */ addi r26, r31, 0x70
/* 000027C4 38A30000 */ addi r5, r3, 0
/* 000027C8 41820014 */ beq lbl_000027DC
/* 000027CC 38A50001 */ addi r5, r5, 1
/* 000027D0 28050087 */ cmplwi r5, 0x87
/* 000027D4 40810008 */ ble lbl_000027DC
/* 000027D8 38A00000 */ li r5, 0
lbl_000027DC:
/* 000027DC 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 000027E0 41820010 */ beq lbl_000027F0
/* 000027E4 34A5FFFF */ addic. r5, r5, -1  ;# fixed addi
/* 000027E8 40800008 */ bge lbl_000027F0
/* 000027EC 38A00087 */ li r5, 0x87
lbl_000027F0:
/* 000027F0 7C051800 */ cmpw r5, r3
/* 000027F4 418200F0 */ beq lbl_000028E4
/* 000027F8 3B600000 */ li r27, 0
/* 000027FC 937F006C */ stw r27, 0x6c(r31)
/* 00002800 3BBF0074 */ addi r29, r31, 0x74
/* 00002804 3BDF0078 */ addi r30, r31, 0x78
/* 00002808 90BA0000 */ stw r5, 0(r26)
/* 0000280C 387D0000 */ addi r3, r29, 0
/* 00002810 389E0000 */ addi r4, r30, 0
/* 00002814 4BFFD949 */ bl free_nlobj
/* 00002818 807E0000 */ lwz r3, 0(r30)
/* 0000281C 28030000 */ cmplwi r3, 0
/* 00002820 4182000C */ beq lbl_0000282C
/* 00002824 4BFFD939 */ bl bitmap_free_tpl
/* 00002828 937E0000 */ stw r27, 0(r30)
lbl_0000282C:
/* 0000282C 809D0000 */ lwz r4, 0(r29)
/* 00002830 28040000 */ cmplwi r4, 0
/* 00002834 4182001C */ beq lbl_00002850
/* 00002838 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000283C 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00002840 80630000 */ lwz r3, 0(r3)
/* 00002844 4BFFD919 */ bl OSFreeToHeap
/* 00002848 38000000 */ li r0, 0
/* 0000284C 901D0000 */ stw r0, 0(r29)
lbl_00002850:
/* 00002850 809A0000 */ lwz r4, 0(r26)
/* 00002854 3C600000 */ lis r3, lbl_00012330@ha
/* 00002858 38030000 */ addi r0, r3, lbl_00012330@l
/* 0000285C 1C64000C */ mulli r3, r4, 0xc
/* 00002860 7F601A14 */ add r27, r0, r3
/* 00002864 807B0004 */ lwz r3, 4(r27)
/* 00002868 38810008 */ addi r4, r1, 8
/* 0000286C 4BFFD8F1 */ bl DVDOpen
/* 00002870 2C030000 */ cmpwi r3, 0
/* 00002874 40820014 */ bne lbl_00002888
/* 00002878 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000287C 3800005F */ li r0, 0x5f
/* 00002880 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002884 480000F8 */ b lbl_0000297C
lbl_00002888:
/* 00002888 8081003C */ lwz r4, 0x3c(r1)
/* 0000288C 38610008 */ addi r3, r1, 8
/* 00002890 3804001F */ addi r0, r4, 0x1f
/* 00002894 541A0034 */ rlwinm r26, r0, 0, 0, 0x1a
/* 00002898 4BFFD8C5 */ bl DVDClose
/* 0000289C 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000028A0 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 000028A4 80630000 */ lwz r3, 0(r3)
/* 000028A8 7F44D378 */ mr r4, r26
/* 000028AC 4BFFD8B1 */ bl OSAllocFromHeap
/* 000028B0 907D0000 */ stw r3, 0(r29)
/* 000028B4 801D0000 */ lwz r0, 0(r29)
/* 000028B8 28000000 */ cmplwi r0, 0
/* 000028BC 40820014 */ bne lbl_000028D0
/* 000028C0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000028C4 3800005F */ li r0, 0x5f
/* 000028C8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000028CC 480000B0 */ b lbl_0000297C
lbl_000028D0:
/* 000028D0 80BB0004 */ lwz r5, 4(r27)
/* 000028D4 7FA3EB78 */ mr r3, r29
/* 000028D8 80DB0008 */ lwz r6, 8(r27)
/* 000028DC 7FC4F378 */ mr r4, r30
/* 000028E0 4BFFD87D */ bl load_nlobj
lbl_000028E4:
/* 000028E4 A0BC0000 */ lhz r5, 0(r28)
/* 000028E8 54A007FF */ clrlwi. r0, r5, 0x1f
/* 000028EC 41820058 */ beq lbl_00002944
/* 000028F0 807F006C */ lwz r3, 0x6c(r31)
/* 000028F4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000028F8 901F006C */ stw r0, 0x6c(r31)
/* 000028FC 801F006C */ lwz r0, 0x6c(r31)
/* 00002900 2C000000 */ cmpwi r0, 0
/* 00002904 40800040 */ bge lbl_00002944
/* 00002908 38000000 */ li r0, 0
/* 0000290C 901F006C */ stw r0, 0x6c(r31)
/* 00002910 48000010 */ b lbl_00002920
lbl_00002914:
/* 00002914 807F006C */ lwz r3, 0x6c(r31)
/* 00002918 38030001 */ addi r0, r3, 1
/* 0000291C 901F006C */ stw r0, 0x6c(r31)
lbl_00002920:
/* 00002920 809F006C */ lwz r4, 0x6c(r31)
/* 00002924 807F0074 */ lwz r3, 0x74(r31)
/* 00002928 5480103A */ slwi r0, r4, 2
/* 0000292C 7C630214 */ add r3, r3, r0
/* 00002930 80030004 */ lwz r0, 4(r3)
/* 00002934 28000000 */ cmplwi r0, 0
/* 00002938 4082FFDC */ bne lbl_00002914
/* 0000293C 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 00002940 901F006C */ stw r0, 0x6c(r31)
lbl_00002944:
/* 00002944 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00002948 41820034 */ beq lbl_0000297C
/* 0000294C 807F006C */ lwz r3, 0x6c(r31)
/* 00002950 38030001 */ addi r0, r3, 1
/* 00002954 901F006C */ stw r0, 0x6c(r31)
/* 00002958 801F006C */ lwz r0, 0x6c(r31)
/* 0000295C 807F0074 */ lwz r3, 0x74(r31)
/* 00002960 5400103A */ slwi r0, r0, 2
/* 00002964 7C630214 */ add r3, r3, r0
/* 00002968 80030004 */ lwz r0, 4(r3)
/* 0000296C 28000000 */ cmplwi r0, 0
/* 00002970 4082000C */ bne lbl_0000297C
/* 00002974 38000000 */ li r0, 0
/* 00002978 901F006C */ stw r0, 0x6c(r31)
lbl_0000297C:
/* 0000297C BB410048 */ lmw r26, 0x48(r1)
/* 00002980 80010064 */ lwz r0, 0x64(r1)
/* 00002984 38210060 */ addi r1, r1, 0x60
/* 00002988 7C0803A6 */ mtlr r0
/* 0000298C 4E800020 */ blr 
lbl_00002990:
/* 00002990 3C600000 */ lis r3, gamePauseStatus@ha
/* 00002994 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00002998 3C800000 */ lis r4, lbl_0000FE78@ha
/* 0000299C 3C600000 */ lis r3, lbl_10000000@ha
/* 000029A0 7000000A */ andi. r0, r0, 0xa
/* 000029A4 38E40000 */ addi r7, r4, lbl_0000FE78@l
/* 000029A8 38C30000 */ addi r6, r3, lbl_10000000@l
/* 000029AC 4C820020 */ bnelr 
/* 000029B0 38A00000 */ li r5, 0
/* 000029B4 90A6007C */ stw r5, 0x7c(r6)
/* 000029B8 38000001 */ li r0, 1
/* 000029BC 388000FF */ li r4, 0xff
/* 000029C0 90A60080 */ stw r5, 0x80(r6)
/* 000029C4 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000029C8 90060084 */ stw r0, 0x84(r6)
/* 000029CC 38000072 */ li r0, 0x72
/* 000029D0 98860088 */ stb r4, 0x88(r6)
/* 000029D4 98860089 */ stb r4, 0x89(r6)
/* 000029D8 9886008A */ stb r4, 0x8a(r6)
/* 000029DC 98A6008B */ stb r5, 0x8b(r6)
/* 000029E0 98A6008C */ stb r5, 0x8c(r6)
/* 000029E4 98A6008D */ stb r5, 0x8d(r6)
/* 000029E8 B0A6008E */ sth r5, 0x8e(r6)
/* 000029EC C00700B8 */ lfs f0, 0xb8(r7)
/* 000029F0 D0060090 */ stfs f0, 0x90(r6)
/* 000029F4 C00700B8 */ lfs f0, 0xb8(r7)
/* 000029F8 D0060094 */ stfs f0, 0x94(r6)
/* 000029FC C00700B8 */ lfs f0, 0xb8(r7)
/* 00002A00 D0060098 */ stfs f0, 0x98(r6)
/* 00002A04 C00700BC */ lfs f0, 0xbc(r7)
/* 00002A08 D006009C */ stfs f0, 0x9c(r6)
/* 00002A0C C0070060 */ lfs f0, 0x60(r7)
/* 00002A10 D00600A4 */ stfs f0, 0xa4(r6)
/* 00002A14 D00600A0 */ stfs f0, 0xa0(r6)
/* 00002A18 C00700B8 */ lfs f0, 0xb8(r7)
/* 00002A1C D00600AC */ stfs f0, 0xac(r6)
/* 00002A20 D00600A8 */ stfs f0, 0xa8(r6)
/* 00002A24 90A600B0 */ stw r5, 0xb0(r6)
/* 00002A28 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002A2C 4E800020 */ blr 
lbl_00002A30:
/* 00002A30 7C0802A6 */ mflr r0
/* 00002A34 3C800000 */ lis r4, lbl_0000FE78@ha
/* 00002A38 90010004 */ stw r0, 4(r1)
/* 00002A3C 3C600000 */ lis r3, gamePauseStatus@ha
/* 00002A40 3CA00000 */ lis r5, lbl_10000000@ha
/* 00002A44 9421FFE8 */ stwu r1, -0x18(r1)
/* 00002A48 38840000 */ addi r4, r4, lbl_0000FE78@l
/* 00002A4C 93E10014 */ stw r31, 0x14(r1)
/* 00002A50 3BE50000 */ addi r31, r5, lbl_10000000@l
/* 00002A54 93C10010 */ stw r30, 0x10(r1)
/* 00002A58 93A1000C */ stw r29, 0xc(r1)
/* 00002A5C 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00002A60 3C600000 */ lis r3, lbl_000102B0@ha
/* 00002A64 38630000 */ addi r3, r3, lbl_000102B0@l
/* 00002A68 7000000A */ andi. r0, r0, 0xa
/* 00002A6C 40820730 */ bne lbl_0000319C
/* 00002A70 3CA00000 */ lis r5, controllerInfo@ha
/* 00002A74 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002A78 A0050018 */ lhz r0, 0x18(r5)
/* 00002A7C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002A80 41820010 */ beq lbl_00002A90
/* 00002A84 801F00B0 */ lwz r0, 0xb0(r31)
/* 00002A88 68000001 */ xori r0, r0, 1
/* 00002A8C 901F00B0 */ stw r0, 0xb0(r31)
lbl_00002A90:
/* 00002A90 3CA00000 */ lis r5, controllerInfo@ha
/* 00002A94 38E50000 */ addi r7, r5, controllerInfo@l
/* 00002A98 A0070030 */ lhz r0, 0x30(r7)
/* 00002A9C 54050739 */ rlwinm. r5, r0, 0, 0x1c, 0x1c
/* 00002AA0 40820044 */ bne lbl_00002AE4
/* 00002AA4 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002AA8 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00002AAC A0A60008 */ lhz r5, 8(r6)
/* 00002AB0 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00002AB4 40820030 */ bne lbl_00002AE4
/* 00002AB8 A0A70000 */ lhz r5, 0(r7)
/* 00002ABC 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00002AC0 40820010 */ bne lbl_00002AD0
/* 00002AC4 A0A60000 */ lhz r5, 0(r6)
/* 00002AC8 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00002ACC 41820054 */ beq lbl_00002B20
lbl_00002AD0:
/* 00002AD0 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002AD4 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00002AD8 A0A50000 */ lhz r5, 0(r5)
/* 00002ADC 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00002AE0 41820040 */ beq lbl_00002B20
lbl_00002AE4:
/* 00002AE4 80BF0084 */ lwz r5, 0x84(r31)
/* 00002AE8 38FF0084 */ addi r7, r31, 0x84
/* 00002AEC 34A5FFFF */ addic. r5, r5, -1  ;# fixed addi
/* 00002AF0 90BF0084 */ stw r5, 0x84(r31)
/* 00002AF4 4080002C */ bge lbl_00002B20
/* 00002AF8 38C32894 */ addi r6, r3, 0x2894
/* 00002AFC 39000000 */ li r8, 0
/* 00002B00 4800000C */ b lbl_00002B0C
lbl_00002B04:
/* 00002B04 38C6000C */ addi r6, r6, 0xc
/* 00002B08 39080001 */ addi r8, r8, 1
lbl_00002B0C:
/* 00002B0C 80A60000 */ lwz r5, 0(r6)
/* 00002B10 2C050000 */ cmpwi r5, 0
/* 00002B14 4082FFF0 */ bne lbl_00002B04
/* 00002B18 38A8FFFF */ addi r5, r8, -1  ;# fixed addi
/* 00002B1C 90A70000 */ stw r5, 0(r7)
lbl_00002B20:
/* 00002B20 5405077B */ rlwinm. r5, r0, 0, 0x1d, 0x1d
/* 00002B24 4082004C */ bne lbl_00002B70
/* 00002B28 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002B2C 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00002B30 A0A60008 */ lhz r5, 8(r6)
/* 00002B34 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00002B38 40820038 */ bne lbl_00002B70
/* 00002B3C 3CA00000 */ lis r5, controllerInfo@ha
/* 00002B40 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002B44 A0A50000 */ lhz r5, 0(r5)
/* 00002B48 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00002B4C 40820010 */ bne lbl_00002B5C
/* 00002B50 A0A60000 */ lhz r5, 0(r6)
/* 00002B54 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00002B58 41820048 */ beq lbl_00002BA0
lbl_00002B5C:
/* 00002B5C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002B60 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00002B64 A0A50000 */ lhz r5, 0(r5)
/* 00002B68 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00002B6C 41820034 */ beq lbl_00002BA0
lbl_00002B70:
/* 00002B70 38DF0084 */ addi r6, r31, 0x84
/* 00002B74 80BF0084 */ lwz r5, 0x84(r31)
/* 00002B78 38A50001 */ addi r5, r5, 1
/* 00002B7C 90BF0084 */ stw r5, 0x84(r31)
/* 00002B80 80BF0084 */ lwz r5, 0x84(r31)
/* 00002B84 1CA5000C */ mulli r5, r5, 0xc
/* 00002B88 7CA32A14 */ add r5, r3, r5
/* 00002B8C 80A52894 */ lwz r5, 0x2894(r5)
/* 00002B90 2C050000 */ cmpwi r5, 0
/* 00002B94 4082000C */ bne lbl_00002BA0
/* 00002B98 38A00000 */ li r5, 0
/* 00002B9C 90A60000 */ stw r5, 0(r6)
lbl_00002BA0:
/* 00002BA0 80BF0084 */ lwz r5, 0x84(r31)
/* 00002BA4 1CA5000C */ mulli r5, r5, 0xc
/* 00002BA8 7FC32A14 */ add r30, r3, r5
/* 00002BAC 84DE2894 */ lwzu r6, 0x2894(r30)
/* 00002BB0 28060008 */ cmplwi r6, 8
/* 00002BB4 418105E8 */ bgt lbl_0000319C
/* 00002BB8 3C600000 */ lis r3, lbl_00012C10@ha
/* 00002BBC 38A30000 */ addi r5, r3, lbl_00012C10@l
/* 00002BC0 54C3103A */ slwi r3, r6, 2
/* 00002BC4 7C65182E */ lwzx r3, r5, r3
/* 00002BC8 7C6903A6 */ mtctr r3
/* 00002BCC 4E800420 */ bctr 
lbl_00002BD0:
/* 00002BD0 809E0008 */ lwz r4, 8(r30)
/* 00002BD4 540307FF */ clrlwi. r3, r0, 0x1f
/* 00002BD8 83A40000 */ lwz r29, 0(r4)
/* 00002BDC 4082004C */ bne lbl_00002C28
/* 00002BE0 3C600000 */ lis r3, analogButtonInfo@ha
/* 00002BE4 38830000 */ addi r4, r3, analogButtonInfo@l
/* 00002BE8 A0640008 */ lhz r3, 8(r4)
/* 00002BEC 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002BF0 40820038 */ bne lbl_00002C28
/* 00002BF4 3C600000 */ lis r3, controllerInfo@ha
/* 00002BF8 38630000 */ addi r3, r3, controllerInfo@l
/* 00002BFC A0630000 */ lhz r3, 0(r3)
/* 00002C00 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002C04 40820010 */ bne lbl_00002C14
/* 00002C08 A0640000 */ lhz r3, 0(r4)
/* 00002C0C 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002C10 41820024 */ beq lbl_00002C34
lbl_00002C14:
/* 00002C14 3C600000 */ lis r3, analogButtonInfo@ha
/* 00002C18 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00002C1C A0630000 */ lhz r3, 0(r3)
/* 00002C20 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00002C24 41820010 */ beq lbl_00002C34
lbl_00002C28:
/* 00002C28 37BDFFFF */ addic. r29, r29, -1  ;# fixed addi
/* 00002C2C 40800008 */ bge lbl_00002C34
/* 00002C30 3BA0000D */ li r29, 0xd
lbl_00002C34:
/* 00002C34 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002C38 40820044 */ bne lbl_00002C7C
/* 00002C3C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00002C40 38830000 */ addi r4, r3, analogButtonInfo@l
/* 00002C44 A0040008 */ lhz r0, 8(r4)
/* 00002C48 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002C4C 40820030 */ bne lbl_00002C7C
/* 00002C50 3C600000 */ lis r3, controllerInfo@ha
/* 00002C54 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 00002C58 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002C5C 40820010 */ bne lbl_00002C6C
/* 00002C60 A0040000 */ lhz r0, 0(r4)
/* 00002C64 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002C68 41820024 */ beq lbl_00002C8C
lbl_00002C6C:
/* 00002C6C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00002C70 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00002C74 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002C78 41820014 */ beq lbl_00002C8C
lbl_00002C7C:
/* 00002C7C 3BBD0001 */ addi r29, r29, 1
/* 00002C80 2C1D000E */ cmpwi r29, 0xe
/* 00002C84 41800008 */ blt lbl_00002C8C
/* 00002C88 3BA00000 */ li r29, 0
lbl_00002C8C:
/* 00002C8C 807F007C */ lwz r3, 0x7c(r31)
/* 00002C90 7C1D1800 */ cmpw r29, r3
/* 00002C94 41820508 */ beq lbl_0000319C
/* 00002C98 2C030000 */ cmpwi r3, 0
/* 00002C9C 41820008 */ beq lbl_00002CA4
/* 00002CA0 4BFFD4BD */ bl call_bitmap_free_group
lbl_00002CA4:
/* 00002CA4 7FA3EB78 */ mr r3, r29
/* 00002CA8 4BFFD4B5 */ bl call_bitmap_load_group
/* 00002CAC 807E0008 */ lwz r3, 8(r30)
/* 00002CB0 38000000 */ li r0, 0
/* 00002CB4 93A30000 */ stw r29, 0(r3)
/* 00002CB8 901F0080 */ stw r0, 0x80(r31)
/* 00002CBC 480004E0 */ b lbl_0000319C
lbl_00002CC0:
/* 00002CC0 80BF007C */ lwz r5, 0x7c(r31)
/* 00002CC4 3CC00000 */ lis r6, bitmapGroups@ha
/* 00002CC8 807E0008 */ lwz r3, 8(r30)
/* 00002CCC 540407FF */ clrlwi. r4, r0, 0x1f
/* 00002CD0 1CE50018 */ mulli r7, r5, 0x18
/* 00002CD4 80A30000 */ lwz r5, 0(r3)
/* 00002CD8 38C60000 */ addi r6, r6, bitmapGroups@l
/* 00002CDC 7C863A14 */ add r4, r6, r7
/* 00002CE0 4082004C */ bne lbl_00002D2C
/* 00002CE4 3CC00000 */ lis r6, analogButtonInfo@ha
/* 00002CE8 38E60000 */ addi r7, r6, analogButtonInfo@l
/* 00002CEC A0C70008 */ lhz r6, 8(r7)
/* 00002CF0 54C607FF */ clrlwi. r6, r6, 0x1f
/* 00002CF4 40820038 */ bne lbl_00002D2C
/* 00002CF8 3CC00000 */ lis r6, controllerInfo@ha
/* 00002CFC 38C60000 */ addi r6, r6, controllerInfo@l
/* 00002D00 A0C60000 */ lhz r6, 0(r6)
/* 00002D04 54C607FF */ clrlwi. r6, r6, 0x1f
/* 00002D08 40820010 */ bne lbl_00002D18
/* 00002D0C A0C70000 */ lhz r6, 0(r7)
/* 00002D10 54C607FF */ clrlwi. r6, r6, 0x1f
/* 00002D14 41820030 */ beq lbl_00002D44
lbl_00002D18:
/* 00002D18 3CC00000 */ lis r6, analogButtonInfo@ha
/* 00002D1C 38C60000 */ addi r6, r6, analogButtonInfo@l
/* 00002D20 A0C60000 */ lhz r6, 0(r6)
/* 00002D24 54C605AD */ rlwinm. r6, r6, 0, 0x16, 0x16
/* 00002D28 4182001C */ beq lbl_00002D44
lbl_00002D2C:
/* 00002D2C 34A5FFFF */ addic. r5, r5, -1  ;# fixed addi
/* 00002D30 40800014 */ bge lbl_00002D44
/* 00002D34 80A40010 */ lwz r5, 0x10(r4)
/* 00002D38 80A50000 */ lwz r5, 0(r5)
/* 00002D3C 38A5FFFF */ addi r5, r5, -1  ;# fixed addi
/* 00002D40 7CA50734 */ extsh r5, r5
lbl_00002D44:
/* 00002D44 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002D48 40820044 */ bne lbl_00002D8C
/* 00002D4C 3CC00000 */ lis r6, analogButtonInfo@ha
/* 00002D50 38E60000 */ addi r7, r6, analogButtonInfo@l
/* 00002D54 A0070008 */ lhz r0, 8(r7)
/* 00002D58 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002D5C 40820030 */ bne lbl_00002D8C
/* 00002D60 3CC00000 */ lis r6, controllerInfo@ha
/* 00002D64 A0060000 */ lhz r0, controllerInfo@l(r6)
/* 00002D68 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002D6C 40820010 */ bne lbl_00002D7C
/* 00002D70 A0070000 */ lhz r0, 0(r7)
/* 00002D74 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002D78 41820030 */ beq lbl_00002DA8
lbl_00002D7C:
/* 00002D7C 3CC00000 */ lis r6, analogButtonInfo@ha
/* 00002D80 A0060000 */ lhz r0, analogButtonInfo@l(r6)
/* 00002D84 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002D88 41820020 */ beq lbl_00002DA8
lbl_00002D8C:
/* 00002D8C 80840010 */ lwz r4, 0x10(r4)
/* 00002D90 38A50001 */ addi r5, r5, 1
/* 00002D94 80840000 */ lwz r4, 0(r4)
/* 00002D98 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 00002D9C 7C050040 */ cmplw r5, r0
/* 00002DA0 40810008 */ ble lbl_00002DA8
/* 00002DA4 38A00000 */ li r5, 0
lbl_00002DA8:
/* 00002DA8 90A30000 */ stw r5, 0(r3)
/* 00002DAC 480003F0 */ b lbl_0000319C
lbl_00002DB0:
/* 00002DB0 3C600000 */ lis r3, controllerInfo@ha
/* 00002DB4 A0E30000 */ lhz r7, controllerInfo@l(r3)
/* 00002DB8 54E306B5 */ rlwinm. r3, r7, 0, 0x1a, 0x1a
/* 00002DBC 4182000C */ beq lbl_00002DC8
/* 00002DC0 38C0000A */ li r6, 0xa
/* 00002DC4 48000008 */ b lbl_00002DCC
lbl_00002DC8:
/* 00002DC8 38C00001 */ li r6, 1
lbl_00002DCC:
/* 00002DCC 807E0008 */ lwz r3, 8(r30)
/* 00002DD0 540407BD */ rlwinm. r4, r0, 0, 0x1e, 0x1e
/* 00002DD4 89030000 */ lbz r8, 0(r3)
/* 00002DD8 40820040 */ bne lbl_00002E18
/* 00002DDC 3C800000 */ lis r4, analogButtonInfo@ha
/* 00002DE0 38A40000 */ addi r5, r4, analogButtonInfo@l
/* 00002DE4 A0850008 */ lhz r4, 8(r5)
/* 00002DE8 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 00002DEC 4082002C */ bne lbl_00002E18
/* 00002DF0 54E407BD */ rlwinm. r4, r7, 0, 0x1e, 0x1e
/* 00002DF4 40820010 */ bne lbl_00002E04
/* 00002DF8 A0850000 */ lhz r4, 0(r5)
/* 00002DFC 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 00002E00 4182001C */ beq lbl_00002E1C
lbl_00002E04:
/* 00002E04 3C800000 */ lis r4, analogButtonInfo@ha
/* 00002E08 38840000 */ addi r4, r4, analogButtonInfo@l
/* 00002E0C A0840000 */ lhz r4, 0(r4)
/* 00002E10 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00002E14 41820008 */ beq lbl_00002E1C
lbl_00002E18:
/* 00002E18 7D083214 */ add r8, r8, r6
lbl_00002E1C:
/* 00002E1C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002E20 4082003C */ bne lbl_00002E5C
/* 00002E24 3C800000 */ lis r4, analogButtonInfo@ha
/* 00002E28 38840000 */ addi r4, r4, analogButtonInfo@l
/* 00002E2C A0040008 */ lhz r0, 8(r4)
/* 00002E30 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002E34 40820028 */ bne lbl_00002E5C
/* 00002E38 54E007FF */ clrlwi. r0, r7, 0x1f
/* 00002E3C 40820010 */ bne lbl_00002E4C
/* 00002E40 A0040000 */ lhz r0, 0(r4)
/* 00002E44 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002E48 41820018 */ beq lbl_00002E60
lbl_00002E4C:
/* 00002E4C 3C800000 */ lis r4, analogButtonInfo@ha
/* 00002E50 A0040000 */ lhz r0, analogButtonInfo@l(r4)
/* 00002E54 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002E58 41820008 */ beq lbl_00002E60
lbl_00002E5C:
/* 00002E5C 7D064050 */ subf r8, r6, r8
lbl_00002E60:
/* 00002E60 2C080000 */ cmpwi r8, 0
/* 00002E64 4080000C */ bge lbl_00002E70
/* 00002E68 38000000 */ li r0, 0
/* 00002E6C 48000018 */ b lbl_00002E84
lbl_00002E70:
/* 00002E70 2C0800FF */ cmpwi r8, 0xff
/* 00002E74 4081000C */ ble lbl_00002E80
/* 00002E78 380000FF */ li r0, 0xff
/* 00002E7C 48000008 */ b lbl_00002E84
lbl_00002E80:
/* 00002E80 7D004378 */ mr r0, r8
lbl_00002E84:
/* 00002E84 98030000 */ stb r0, 0(r3)
/* 00002E88 48000314 */ b lbl_0000319C
lbl_00002E8C:
/* 00002E8C 807E0008 */ lwz r3, 8(r30)
/* 00002E90 540407BD */ rlwinm. r4, r0, 0, 0x1e, 0x1e
/* 00002E94 A8830000 */ lha r4, 0(r3)
/* 00002E98 4082004C */ bne lbl_00002EE4
/* 00002E9C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002EA0 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00002EA4 A0A60008 */ lhz r5, 8(r6)
/* 00002EA8 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002EAC 40820038 */ bne lbl_00002EE4
/* 00002EB0 3CA00000 */ lis r5, controllerInfo@ha
/* 00002EB4 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002EB8 A0A50000 */ lhz r5, 0(r5)
/* 00002EBC 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002EC0 40820010 */ bne lbl_00002ED0
/* 00002EC4 A0A60000 */ lhz r5, 0(r6)
/* 00002EC8 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002ECC 4182001C */ beq lbl_00002EE8
lbl_00002ED0:
/* 00002ED0 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002ED4 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00002ED8 A0A50000 */ lhz r5, 0(r5)
/* 00002EDC 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00002EE0 41820008 */ beq lbl_00002EE8
lbl_00002EE4:
/* 00002EE4 38840080 */ addi r4, r4, 0x80
lbl_00002EE8:
/* 00002EE8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002EEC 40820044 */ bne lbl_00002F30
/* 00002EF0 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002EF4 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00002EF8 A0060008 */ lhz r0, 8(r6)
/* 00002EFC 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002F00 40820030 */ bne lbl_00002F30
/* 00002F04 3CA00000 */ lis r5, controllerInfo@ha
/* 00002F08 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 00002F0C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002F10 40820010 */ bne lbl_00002F20
/* 00002F14 A0060000 */ lhz r0, 0(r6)
/* 00002F18 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002F1C 41820018 */ beq lbl_00002F34
lbl_00002F20:
/* 00002F20 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002F24 A0050000 */ lhz r0, analogButtonInfo@l(r5)
/* 00002F28 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002F2C 41820008 */ beq lbl_00002F34
lbl_00002F30:
/* 00002F30 3884FF80 */ addi r4, r4, -128  ;# fixed addi
lbl_00002F34:
/* 00002F34 7C800734 */ extsh r0, r4
/* 00002F38 B0030000 */ sth r0, 0(r3)
/* 00002F3C 48000260 */ b lbl_0000319C
lbl_00002F40:
/* 00002F40 807E0008 */ lwz r3, 8(r30)
/* 00002F44 540507BD */ rlwinm. r5, r0, 0, 0x1e, 0x1e
/* 00002F48 C0230000 */ lfs f1, 0(r3)
/* 00002F4C 4082004C */ bne lbl_00002F98
/* 00002F50 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002F54 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00002F58 A0A60008 */ lhz r5, 8(r6)
/* 00002F5C 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002F60 40820038 */ bne lbl_00002F98
/* 00002F64 3CA00000 */ lis r5, controllerInfo@ha
/* 00002F68 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002F6C A0A50000 */ lhz r5, 0(r5)
/* 00002F70 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002F74 40820010 */ bne lbl_00002F84
/* 00002F78 A0A60000 */ lhz r5, 0(r6)
/* 00002F7C 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002F80 41820024 */ beq lbl_00002FA4
lbl_00002F84:
/* 00002F84 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002F88 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00002F8C A0A50000 */ lhz r5, 0(r5)
/* 00002F90 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00002F94 41820010 */ beq lbl_00002FA4
lbl_00002F98:
/* 00002F98 C80400C0 */ lfd f0, 0xc0(r4)
/* 00002F9C FC21002A */ fadd f1, f1, f0
/* 00002FA0 FC200818 */ frsp f1, f1
lbl_00002FA4:
/* 00002FA4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002FA8 40820044 */ bne lbl_00002FEC
/* 00002FAC 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002FB0 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00002FB4 A0060008 */ lhz r0, 8(r6)
/* 00002FB8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002FBC 40820030 */ bne lbl_00002FEC
/* 00002FC0 3CA00000 */ lis r5, controllerInfo@ha
/* 00002FC4 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 00002FC8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002FCC 40820010 */ bne lbl_00002FDC
/* 00002FD0 A0060000 */ lhz r0, 0(r6)
/* 00002FD4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002FD8 41820020 */ beq lbl_00002FF8
lbl_00002FDC:
/* 00002FDC 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00002FE0 A0050000 */ lhz r0, analogButtonInfo@l(r5)
/* 00002FE4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002FE8 41820010 */ beq lbl_00002FF8
lbl_00002FEC:
/* 00002FEC C80400C0 */ lfd f0, 0xc0(r4)
/* 00002FF0 FC210028 */ fsub f1, f1, f0
/* 00002FF4 FC200818 */ frsp f1, f1
lbl_00002FF8:
/* 00002FF8 C80400C8 */ lfd f0, 0xc8(r4)
/* 00002FFC FC010040 */ fcmpo cr0, f1, f0
/* 00003000 40800008 */ bge lbl_00003008
/* 00003004 48000018 */ b lbl_0000301C
lbl_00003008:
/* 00003008 C80400D0 */ lfd f0, 0xd0(r4)
/* 0000300C FC010040 */ fcmpo cr0, f1, f0
/* 00003010 40810008 */ ble lbl_00003018
/* 00003014 48000008 */ b lbl_0000301C
lbl_00003018:
/* 00003018 FC000890 */ fmr f0, f1
lbl_0000301C:
/* 0000301C FC000018 */ frsp f0, f0
/* 00003020 D0030000 */ stfs f0, 0(r3)
/* 00003024 48000178 */ b lbl_0000319C
lbl_00003028:
/* 00003028 807E0008 */ lwz r3, 8(r30)
/* 0000302C 540507BD */ rlwinm. r5, r0, 0, 0x1e, 0x1e
/* 00003030 C0230000 */ lfs f1, 0(r3)
/* 00003034 4082004C */ bne lbl_00003080
/* 00003038 3CA00000 */ lis r5, analogButtonInfo@ha
/* 0000303C 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00003040 A0A60008 */ lhz r5, 8(r6)
/* 00003044 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00003048 40820038 */ bne lbl_00003080
/* 0000304C 3CA00000 */ lis r5, controllerInfo@ha
/* 00003050 38A50000 */ addi r5, r5, controllerInfo@l
/* 00003054 A0A50000 */ lhz r5, 0(r5)
/* 00003058 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 0000305C 40820010 */ bne lbl_0000306C
/* 00003060 A0A60000 */ lhz r5, 0(r6)
/* 00003064 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00003068 41820024 */ beq lbl_0000308C
lbl_0000306C:
/* 0000306C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00003070 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00003074 A0A50000 */ lhz r5, 0(r5)
/* 00003078 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 0000307C 41820010 */ beq lbl_0000308C
lbl_00003080:
/* 00003080 C80400D8 */ lfd f0, 0xd8(r4)
/* 00003084 FC21002A */ fadd f1, f1, f0
/* 00003088 FC200818 */ frsp f1, f1
lbl_0000308C:
/* 0000308C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003090 40820044 */ bne lbl_000030D4
/* 00003094 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00003098 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 0000309C A0060008 */ lhz r0, 8(r6)
/* 000030A0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000030A4 40820030 */ bne lbl_000030D4
/* 000030A8 3CA00000 */ lis r5, controllerInfo@ha
/* 000030AC A0050000 */ lhz r0, controllerInfo@l(r5)
/* 000030B0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000030B4 40820010 */ bne lbl_000030C4
/* 000030B8 A0060000 */ lhz r0, 0(r6)
/* 000030BC 540007FF */ clrlwi. r0, r0, 0x1f
/* 000030C0 41820020 */ beq lbl_000030E0
lbl_000030C4:
/* 000030C4 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000030C8 A0050000 */ lhz r0, analogButtonInfo@l(r5)
/* 000030CC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000030D0 41820010 */ beq lbl_000030E0
lbl_000030D4:
/* 000030D4 C80400D8 */ lfd f0, 0xd8(r4)
/* 000030D8 FC210028 */ fsub f1, f1, f0
/* 000030DC FC200818 */ frsp f1, f1
lbl_000030E0:
/* 000030E0 D0230000 */ stfs f1, 0(r3)
/* 000030E4 480000B8 */ b lbl_0000319C
lbl_000030E8:
/* 000030E8 807E0008 */ lwz r3, 8(r30)
/* 000030EC 540407BD */ rlwinm. r4, r0, 0, 0x1e, 0x1e
/* 000030F0 C0230000 */ lfs f1, 0(r3)
/* 000030F4 4082004C */ bne lbl_00003140
/* 000030F8 3C800000 */ lis r4, analogButtonInfo@ha
/* 000030FC 38A40000 */ addi r5, r4, analogButtonInfo@l
/* 00003100 A0850008 */ lhz r4, 8(r5)
/* 00003104 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 00003108 40820038 */ bne lbl_00003140
/* 0000310C 3C800000 */ lis r4, controllerInfo@ha
/* 00003110 38840000 */ addi r4, r4, controllerInfo@l
/* 00003114 A0840000 */ lhz r4, 0(r4)
/* 00003118 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 0000311C 40820010 */ bne lbl_0000312C
/* 00003120 A0850000 */ lhz r4, 0(r5)
/* 00003124 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 00003128 41820020 */ beq lbl_00003148
lbl_0000312C:
/* 0000312C 3C800000 */ lis r4, analogButtonInfo@ha
/* 00003130 38840000 */ addi r4, r4, analogButtonInfo@l
/* 00003134 A0840000 */ lhz r4, 0(r4)
/* 00003138 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 0000313C 4182000C */ beq lbl_00003148
lbl_00003140:
/* 00003140 C01F009C */ lfs f0, 0x9c(r31)
/* 00003144 EC21002A */ fadds f1, f1, f0
lbl_00003148:
/* 00003148 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000314C 40820044 */ bne lbl_00003190
/* 00003150 3C800000 */ lis r4, analogButtonInfo@ha
/* 00003154 38A40000 */ addi r5, r4, analogButtonInfo@l
/* 00003158 A0050008 */ lhz r0, 8(r5)
/* 0000315C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003160 40820030 */ bne lbl_00003190
/* 00003164 3C800000 */ lis r4, controllerInfo@ha
/* 00003168 A0040000 */ lhz r0, controllerInfo@l(r4)
/* 0000316C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003170 40820010 */ bne lbl_00003180
/* 00003174 A0050000 */ lhz r0, 0(r5)
/* 00003178 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000317C 4182001C */ beq lbl_00003198
lbl_00003180:
/* 00003180 3C800000 */ lis r4, analogButtonInfo@ha
/* 00003184 A0040000 */ lhz r0, analogButtonInfo@l(r4)
/* 00003188 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 0000318C 4182000C */ beq lbl_00003198
lbl_00003190:
/* 00003190 C01F009C */ lfs f0, 0x9c(r31)
/* 00003194 EC210028 */ fsubs f1, f1, f0
lbl_00003198:
/* 00003198 D0230000 */ stfs f1, 0(r3)
lbl_0000319C:
/* 0000319C 8001001C */ lwz r0, 0x1c(r1)
/* 000031A0 83E10014 */ lwz r31, 0x14(r1)
/* 000031A4 83C10010 */ lwz r30, 0x10(r1)
/* 000031A8 7C0803A6 */ mtlr r0
/* 000031AC 83A1000C */ lwz r29, 0xc(r1)
/* 000031B0 38210018 */ addi r1, r1, 0x18
/* 000031B4 4E800020 */ blr 
lbl_000031B8:
/* 000031B8 7C0802A6 */ mflr r0
/* 000031BC 3C600000 */ lis r3, lbl_10000000@ha
/* 000031C0 90010004 */ stw r0, 4(r1)
/* 000031C4 3C800000 */ lis r4, bitmapGroups@ha
/* 000031C8 3CC00000 */ lis r6, lbl_0000FE78@ha
/* 000031CC 9421FF40 */ stwu r1, -0xc0(r1)
/* 000031D0 BEC10098 */ stmw r22, 0x98(r1)
/* 000031D4 3B830000 */ addi r28, r3, lbl_10000000@l
/* 000031D8 3C600000 */ lis r3, controllerInfo@ha
/* 000031DC 3B3C0080 */ addi r25, r28, 0x80
/* 000031E0 3B660000 */ addi r27, r6, lbl_0000FE78@l
/* 000031E4 3AC00000 */ li r22, 0
/* 000031E8 801C007C */ lwz r0, 0x7c(r28)
/* 000031EC 1CA00018 */ mulli r5, r0, 0x18
/* 000031F0 38040000 */ addi r0, r4, bitmapGroups@l
/* 000031F4 7F402A14 */ add r26, r0, r5
/* 000031F8 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 000031FC 809A0010 */ lwz r4, 0x10(r26)
/* 00003200 3CA00000 */ lis r5, lbl_000102B0@ha
/* 00003204 807C0080 */ lwz r3, 0x80(r28)
/* 00003208 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 0000320C 80840004 */ lwz r4, 4(r4)
/* 00003210 54632036 */ slwi r3, r3, 4
/* 00003214 3BA50000 */ addi r29, r5, lbl_000102B0@l
/* 00003218 7FE41A14 */ add r31, r4, r3
/* 0000321C 40820134 */ bne lbl_00003350
/* 00003220 38600003 */ li r3, 3
/* 00003224 38800005 */ li r4, 5
/* 00003228 4BFFCF35 */ bl g_debug_set_cursor_pos
/* 0000322C 3C600000 */ lis r3, bitmapNames@ha
/* 00003230 3B1D2894 */ addi r24, r29, 0x2894
/* 00003234 3BC30000 */ addi r30, r3, bitmapNames@l
/* 00003238 3AE00000 */ li r23, 0
/* 0000323C 48000108 */ b lbl_00003344
lbl_00003240:
/* 00003240 801C0084 */ lwz r0, 0x84(r28)
/* 00003244 7C170000 */ cmpw r23, r0
/* 00003248 40820028 */ bne lbl_00003270
/* 0000324C 3860FFFE */ li r3, -2
/* 00003250 38800000 */ li r4, 0
/* 00003254 4BFFCF09 */ bl func_8002FC90
/* 00003258 38600001 */ li r3, 1
/* 0000325C 4BFFCF01 */ bl g_debug_set_text_color
/* 00003260 387D2988 */ addi r3, r29, 0x2988
/* 00003264 4BFFCEF9 */ bl g_debug_print
/* 00003268 38600000 */ li r3, 0
/* 0000326C 4BFFCEF1 */ bl g_debug_set_text_color
lbl_00003270:
/* 00003270 80180000 */ lwz r0, 0(r24)
/* 00003274 2C000004 */ cmpwi r0, 4
/* 00003278 41820080 */ beq lbl_000032F8
/* 0000327C 4080001C */ bge lbl_00003298
/* 00003280 2C000002 */ cmpwi r0, 2
/* 00003284 4182003C */ beq lbl_000032C0
/* 00003288 408000B4 */ bge lbl_0000333C
/* 0000328C 2C000001 */ cmpwi r0, 1
/* 00003290 4080001C */ bge lbl_000032AC
/* 00003294 480000A8 */ b lbl_0000333C
lbl_00003298:
/* 00003298 2C000009 */ cmpwi r0, 9
/* 0000329C 408000A0 */ bge lbl_0000333C
/* 000032A0 2C000006 */ cmpwi r0, 6
/* 000032A4 40800084 */ bge lbl_00003328
/* 000032A8 48000068 */ b lbl_00003310
lbl_000032AC:
/* 000032AC 80780004 */ lwz r3, 4(r24)
/* 000032B0 4CC63182 */ crclr 6
/* 000032B4 809A0008 */ lwz r4, 8(r26)
/* 000032B8 4BFFCEA5 */ bl g_debug_printf
/* 000032BC 48000080 */ b lbl_0000333C
lbl_000032C0:
/* 000032C0 801C007C */ lwz r0, 0x7c(r28)
/* 000032C4 4CC63182 */ crclr 6
/* 000032C8 80980008 */ lwz r4, 8(r24)
/* 000032CC 5400103A */ slwi r0, r0, 2
/* 000032D0 80780004 */ lwz r3, 4(r24)
/* 000032D4 7CBE0214 */ add r5, r30, r0
/* 000032D8 80840000 */ lwz r4, 0(r4)
/* 000032DC 80A50000 */ lwz r5, 0(r5)
/* 000032E0 5480103A */ slwi r0, r4, 2
/* 000032E4 A0DF0008 */ lhz r6, 8(r31)
/* 000032E8 7CA5002E */ lwzx r5, r5, r0
/* 000032EC A0FF000A */ lhz r7, 0xa(r31)
/* 000032F0 4BFFCE6D */ bl g_debug_printf
/* 000032F4 48000048 */ b lbl_0000333C
lbl_000032F8:
/* 000032F8 80980008 */ lwz r4, 8(r24)
/* 000032FC 4CC63182 */ crclr 6
/* 00003300 80780004 */ lwz r3, 4(r24)
/* 00003304 88840000 */ lbz r4, 0(r4)
/* 00003308 4BFFCE55 */ bl g_debug_printf
/* 0000330C 48000030 */ b lbl_0000333C
lbl_00003310:
/* 00003310 80980008 */ lwz r4, 8(r24)
/* 00003314 4CC63182 */ crclr 6
/* 00003318 80780004 */ lwz r3, 4(r24)
/* 0000331C A8840000 */ lha r4, 0(r4)
/* 00003320 4BFFCE3D */ bl g_debug_printf
/* 00003324 48000018 */ b lbl_0000333C
lbl_00003328:
/* 00003328 80980008 */ lwz r4, 8(r24)
/* 0000332C 4CC63242 */ crset 6
/* 00003330 80780004 */ lwz r3, 4(r24)
/* 00003334 C0240000 */ lfs f1, 0(r4)
/* 00003338 4BFFCE25 */ bl g_debug_printf
lbl_0000333C:
/* 0000333C 3AF70001 */ addi r23, r23, 1
/* 00003340 3B18000C */ addi r24, r24, 0xc
lbl_00003344:
/* 00003344 80180000 */ lwz r0, 0(r24)
/* 00003348 2C000000 */ cmpwi r0, 0
/* 0000334C 4082FEF4 */ bne lbl_00003240
lbl_00003350:
/* 00003350 801C00B0 */ lwz r0, 0xb0(r28)
/* 00003354 2C000000 */ cmpwi r0, 0
/* 00003358 41820040 */ beq lbl_00003398
/* 0000335C 801C007C */ lwz r0, 0x7c(r28)
/* 00003360 389D2984 */ addi r4, r29, 0x2984
/* 00003364 80790000 */ lwz r3, 0(r25)
/* 00003368 5400402E */ slwi r0, r0, 8
/* 0000336C 7C630378 */ or r3, r3, r0
/* 00003370 4800001C */ b lbl_0000338C
lbl_00003374:
/* 00003374 80040000 */ lwz r0, 0(r4)
/* 00003378 7C001800 */ cmpw r0, r3
/* 0000337C 4082000C */ bne lbl_00003388
/* 00003380 3AC00001 */ li r22, 1
/* 00003384 48000014 */ b lbl_00003398
lbl_00003388:
/* 00003388 38840004 */ addi r4, r4, 4
lbl_0000338C:
/* 0000338C 80040000 */ lwz r0, 0(r4)
/* 00003390 2C00FFFF */ cmpwi r0, -1
/* 00003394 4082FFE0 */ bne lbl_00003374
lbl_00003398:
/* 00003398 2C160000 */ cmpwi r22, 0
/* 0000339C 41820140 */ beq lbl_000034DC
/* 000033A0 C01B006C */ lfs f0, 0x6c(r27)
/* 000033A4 3C600000 */ lis r3, lbl_801BE470@ha
/* 000033A8 3BC30000 */ addi r30, r3, lbl_801BE470@l
/* 000033AC D0010014 */ stfs f0, 0x14(r1)
/* 000033B0 3C800002 */ lis r4, 2
/* 000033B4 3B400000 */ li r26, 0
/* 000033B8 C01B00B8 */ lfs f0, 0xb8(r27)
/* 000033BC 3860FFFF */ li r3, -1
/* 000033C0 3804100A */ addi r0, r4, 0x100a
/* 000033C4 D0010018 */ stfs f0, 0x18(r1)
/* 000033C8 3EC04330 */ lis r22, 0x4330
/* 000033CC C01B00B8 */ lfs f0, 0xb8(r27)
/* 000033D0 D001001C */ stfs f0, 0x1c(r1)
/* 000033D4 C01B0060 */ lfs f0, 0x60(r27)
/* 000033D8 D0010020 */ stfs f0, 0x20(r1)
/* 000033DC C01B0060 */ lfs f0, 0x60(r27)
/* 000033E0 D0010024 */ stfs f0, 0x24(r1)
/* 000033E4 C01B00B8 */ lfs f0, 0xb8(r27)
/* 000033E8 D0010028 */ stfs f0, 0x28(r1)
/* 000033EC C01B00B8 */ lfs f0, 0xb8(r27)
/* 000033F0 D001002C */ stfs f0, 0x2c(r1)
/* 000033F4 93410030 */ stw r26, 0x30(r1)
/* 000033F8 C03C0090 */ lfs f1, 0x90(r28)
/* 000033FC D0210034 */ stfs f1, 0x34(r1)
/* 00003400 90610038 */ stw r3, 0x38(r1)
/* 00003404 9001003C */ stw r0, 0x3c(r1)
/* 00003408 C01B00E0 */ lfs f0, 0xe0(r27)
/* 0000340C 881C0088 */ lbz r0, 0x88(r28)
/* 00003410 EC000072 */ fmuls f0, f0, f1
/* 00003414 889C0089 */ lbz r4, 0x89(r28)
/* 00003418 88BC008A */ lbz r5, 0x8a(r28)
/* 0000341C FC00001E */ fctiwz f0, f0
/* 00003420 D8010090 */ stfd f0, 0x90(r1)
/* 00003424 80610094 */ lwz r3, 0x94(r1)
/* 00003428 5463C00E */ slwi r3, r3, 0x18
/* 0000342C 5003821E */ rlwimi r3, r0, 0x10, 8, 0xf
/* 00003430 5083442E */ rlwimi r3, r4, 8, 0x10, 0x17
/* 00003434 7CA01B78 */ or r0, r5, r3
/* 00003438 90010040 */ stw r0, 0x40(r1)
/* 0000343C 881C008C */ lbz r0, 0x8c(r28)
/* 00003440 887C008B */ lbz r3, 0x8b(r28)
/* 00003444 5400402E */ slwi r0, r0, 8
/* 00003448 889C008D */ lbz r4, 0x8d(r28)
/* 0000344C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00003450 7C800378 */ or r0, r4, r0
/* 00003454 90010044 */ stw r0, 0x44(r1)
lbl_00003458:
/* 00003458 807C007C */ lwz r3, 0x7c(r28)
/* 0000345C 3CA00000 */ lis r5, lbl_0000FED0@ha
/* 00003460 80190000 */ lwz r0, 0(r25)
/* 00003464 3C800000 */ lis r4, lbl_0000FED0@ha
/* 00003468 5463402E */ slwi r3, r3, 8
/* 0000346C 7C00D214 */ add r0, r0, r26
/* 00003470 7C600378 */ or r0, r3, r0
/* 00003474 90010008 */ stw r0, 8(r1)
/* 00003478 38610008 */ addi r3, r1, 8
/* 0000347C 80DE0000 */ lwz r6, 0(r30)
/* 00003480 C8250000 */ lfd f1, lbl_0000FED0@l(r5)
/* 00003484 38060140 */ addi r0, r6, 0x140
/* 00003488 6C008000 */ xoris r0, r0, 0x8000
/* 0000348C 90010094 */ stw r0, 0x94(r1)
/* 00003490 92C10090 */ stw r22, 0x90(r1)
/* 00003494 C8010090 */ lfd f0, 0x90(r1)
/* 00003498 EC000828 */ fsubs f0, f0, f1
/* 0000349C D001000C */ stfs f0, 0xc(r1)
/* 000034A0 80BE0004 */ lwz r5, 4(r30)
/* 000034A4 C8240000 */ lfd f1, lbl_0000FED0@l(r4)
/* 000034A8 380500F0 */ addi r0, r5, 0xf0
/* 000034AC 6C008000 */ xoris r0, r0, 0x8000
/* 000034B0 9001008C */ stw r0, 0x8c(r1)
/* 000034B4 92C10088 */ stw r22, 0x88(r1)
/* 000034B8 C8010088 */ lfd f0, 0x88(r1)
/* 000034BC EC000828 */ fsubs f0, f0, f1
/* 000034C0 D0010010 */ stfs f0, 0x10(r1)
/* 000034C4 4BFFCC99 */ bl draw_naomi_sprite
/* 000034C8 3B5A0001 */ addi r26, r26, 1
/* 000034CC 2C1A0008 */ cmpwi r26, 8
/* 000034D0 3BDE0008 */ addi r30, r30, 8
/* 000034D4 4180FF84 */ blt lbl_00003458
/* 000034D8 48000104 */ b lbl_000035DC
lbl_000034DC:
/* 000034DC A01F0008 */ lhz r0, 8(r31)
/* 000034E0 28000000 */ cmplwi r0, 0
/* 000034E4 418200F8 */ beq lbl_000035DC
/* 000034E8 A01F000A */ lhz r0, 0xa(r31)
/* 000034EC 28000000 */ cmplwi r0, 0
/* 000034F0 418200EC */ beq lbl_000035DC
/* 000034F4 801C007C */ lwz r0, 0x7c(r28)
/* 000034F8 3880FFFF */ li r4, -1
/* 000034FC 80B90000 */ lwz r5, 0(r25)
/* 00003500 3C600002 */ lis r3, 2
/* 00003504 5400402E */ slwi r0, r0, 8
/* 00003508 7CA00378 */ or r0, r5, r0
/* 0000350C 90010008 */ stw r0, 8(r1)
/* 00003510 3803100A */ addi r0, r3, 0x100a
/* 00003514 38610008 */ addi r3, r1, 8
/* 00003518 C01B00E4 */ lfs f0, 0xe4(r27)
/* 0000351C D001000C */ stfs f0, 0xc(r1)
/* 00003520 C01B00E8 */ lfs f0, 0xe8(r27)
/* 00003524 D0010010 */ stfs f0, 0x10(r1)
/* 00003528 C01B006C */ lfs f0, 0x6c(r27)
/* 0000352C D0010014 */ stfs f0, 0x14(r1)
/* 00003530 C09C00A8 */ lfs f4, 0xa8(r28)
/* 00003534 C05C00A0 */ lfs f2, 0xa0(r28)
/* 00003538 C03C0094 */ lfs f1, 0x94(r28)
/* 0000353C EC041028 */ fsubs f0, f4, f2
/* 00003540 EC010032 */ fmuls f0, f1, f0
/* 00003544 D0010018 */ stfs f0, 0x18(r1)
/* 00003548 C0BC00AC */ lfs f5, 0xac(r28)
/* 0000354C C07C00A4 */ lfs f3, 0xa4(r28)
/* 00003550 C03C0098 */ lfs f1, 0x98(r28)
/* 00003554 EC051828 */ fsubs f0, f5, f3
/* 00003558 EC010032 */ fmuls f0, f1, f0
/* 0000355C D001001C */ stfs f0, 0x1c(r1)
/* 00003560 D0410020 */ stfs f2, 0x20(r1)
/* 00003564 D0610024 */ stfs f3, 0x24(r1)
/* 00003568 D0810028 */ stfs f4, 0x28(r1)
/* 0000356C D0A1002C */ stfs f5, 0x2c(r1)
/* 00003570 A8BC008E */ lha r5, 0x8e(r28)
/* 00003574 90A10030 */ stw r5, 0x30(r1)
/* 00003578 C03C0090 */ lfs f1, 0x90(r28)
/* 0000357C D0210034 */ stfs f1, 0x34(r1)
/* 00003580 90810038 */ stw r4, 0x38(r1)
/* 00003584 9001003C */ stw r0, 0x3c(r1)
/* 00003588 C01B00E0 */ lfs f0, 0xe0(r27)
/* 0000358C 881C0088 */ lbz r0, 0x88(r28)
/* 00003590 EC000072 */ fmuls f0, f0, f1
/* 00003594 88BC0089 */ lbz r5, 0x89(r28)
/* 00003598 88DC008A */ lbz r6, 0x8a(r28)
/* 0000359C FC00001E */ fctiwz f0, f0
/* 000035A0 D8010088 */ stfd f0, 0x88(r1)
/* 000035A4 8081008C */ lwz r4, 0x8c(r1)
/* 000035A8 5484C00E */ slwi r4, r4, 0x18
/* 000035AC 5004821E */ rlwimi r4, r0, 0x10, 8, 0xf
/* 000035B0 50A4442E */ rlwimi r4, r5, 8, 0x10, 0x17
/* 000035B4 7CC02378 */ or r0, r6, r4
/* 000035B8 90010040 */ stw r0, 0x40(r1)
/* 000035BC 881C008C */ lbz r0, 0x8c(r28)
/* 000035C0 889C008B */ lbz r4, 0x8b(r28)
/* 000035C4 5400402E */ slwi r0, r0, 8
/* 000035C8 88BC008D */ lbz r5, 0x8d(r28)
/* 000035CC 5080821E */ rlwimi r0, r4, 0x10, 8, 0xf
/* 000035D0 7CA00378 */ or r0, r5, r0
/* 000035D4 90010044 */ stw r0, 0x44(r1)
/* 000035D8 4BFFCB85 */ bl draw_naomi_sprite
lbl_000035DC:
/* 000035DC 3C600000 */ lis r3, controllerInfo@ha
/* 000035E0 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 000035E4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000035E8 40820178 */ bne lbl_00003760
/* 000035EC A2DF0008 */ lhz r22, 8(r31)
/* 000035F0 A2FF000A */ lhz r23, 0xa(r31)
/* 000035F4 4BFFCB69 */ bl func_80071A8C
/* 000035F8 7EC30E70 */ srawi r3, r22, 1
/* 000035FC C0C1000C */ lfs f6, 0xc(r1)
/* 00003600 7C630194 */ addze r3, r3
/* 00003604 C0410010 */ lfs f2, 0x10(r1)
/* 00003608 7EE00E70 */ srawi r0, r23, 1
/* 0000360C C07B00EC */ lfs f3, 0xec(r27)
/* 00003610 7C000194 */ addze r0, r0
/* 00003614 6C788000 */ xoris r24, r3, 0x8000
/* 00003618 6C168000 */ xoris r22, r0, 0x8000
/* 0000361C 9301008C */ stw r24, 0x8c(r1)
/* 00003620 3EE04330 */ lis r23, 0x4330
/* 00003624 92C10094 */ stw r22, 0x94(r1)
/* 00003628 3C800000 */ lis r4, lbl_0000FED0@ha
/* 0000362C 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00003630 C8A40000 */ lfd f5, lbl_0000FED0@l(r4)
/* 00003634 92E10088 */ stw r23, 0x88(r1)
/* 00003638 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000363C 92E10090 */ stw r23, 0x90(r1)
/* 00003640 C8810088 */ lfd f4, 0x88(r1)
/* 00003644 C8010090 */ lfd f0, 0x90(r1)
/* 00003648 EC842828 */ fsubs f4, f4, f5
/* 0000364C EC000828 */ fsubs f0, f0, f1
/* 00003650 EC262028 */ fsubs f1, f6, f4
/* 00003654 EC020028 */ fsubs f0, f2, f0
/* 00003658 EC211828 */ fsubs f1, f1, f3
/* 0000365C EC401828 */ fsubs f2, f0, f3
/* 00003660 4BFFCAFD */ bl func_80071B60
/* 00003664 387D298C */ addi r3, r29, 0x298c
/* 00003668 4BFFCAF5 */ bl func_80071E58
/* 0000366C 92C1007C */ stw r22, 0x7c(r1)
/* 00003670 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00003674 3C800000 */ lis r4, lbl_0000FED0@ha
/* 00003678 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000367C 92E10078 */ stw r23, 0x78(r1)
/* 00003680 C0410010 */ lfs f2, 0x10(r1)
/* 00003684 93010084 */ stw r24, 0x84(r1)
/* 00003688 C8010078 */ lfd f0, 0x78(r1)
/* 0000368C 92E10080 */ stw r23, 0x80(r1)
/* 00003690 EC000828 */ fsubs f0, f0, f1
/* 00003694 C8640000 */ lfd f3, lbl_0000FED0@l(r4)
/* 00003698 C8210080 */ lfd f1, 0x80(r1)
/* 0000369C C081000C */ lfs f4, 0xc(r1)
/* 000036A0 EC211828 */ fsubs f1, f1, f3
/* 000036A4 EC420028 */ fsubs f2, f2, f0
/* 000036A8 C01B00EC */ lfs f0, 0xec(r27)
/* 000036AC EC24082A */ fadds f1, f4, f1
/* 000036B0 EC420028 */ fsubs f2, f2, f0
/* 000036B4 4BFFCAA9 */ bl func_80071B60
/* 000036B8 387D298C */ addi r3, r29, 0x298c
/* 000036BC 4BFFCAA1 */ bl func_80071E58
/* 000036C0 93010074 */ stw r24, 0x74(r1)
/* 000036C4 3C800000 */ lis r4, lbl_0000FED0@ha
/* 000036C8 C8240000 */ lfd f1, lbl_0000FED0@l(r4)
/* 000036CC 3C600000 */ lis r3, lbl_0000FED0@ha
/* 000036D0 92E10070 */ stw r23, 0x70(r1)
/* 000036D4 C081000C */ lfs f4, 0xc(r1)
/* 000036D8 92C1006C */ stw r22, 0x6c(r1)
/* 000036DC C8010070 */ lfd f0, 0x70(r1)
/* 000036E0 92E10068 */ stw r23, 0x68(r1)
/* 000036E4 EC400828 */ fsubs f2, f0, f1
/* 000036E8 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 000036EC C8010068 */ lfd f0, 0x68(r1)
/* 000036F0 C07B00EC */ lfs f3, 0xec(r27)
/* 000036F4 EC841028 */ fsubs f4, f4, f2
/* 000036F8 EC000828 */ fsubs f0, f0, f1
/* 000036FC C0410010 */ lfs f2, 0x10(r1)
/* 00003700 EC241828 */ fsubs f1, f4, f3
/* 00003704 EC42002A */ fadds f2, f2, f0
/* 00003708 4BFFCA55 */ bl func_80071B60
/* 0000370C 387D298C */ addi r3, r29, 0x298c
/* 00003710 4BFFCA4D */ bl func_80071E58
/* 00003714 93010064 */ stw r24, 0x64(r1)
/* 00003718 3C800000 */ lis r4, lbl_0000FED0@ha
/* 0000371C 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00003720 C8840000 */ lfd f4, lbl_0000FED0@l(r4)
/* 00003724 92C1005C */ stw r22, 0x5c(r1)
/* 00003728 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000372C 92E10060 */ stw r23, 0x60(r1)
/* 00003730 C0A1000C */ lfs f5, 0xc(r1)
/* 00003734 92E10058 */ stw r23, 0x58(r1)
/* 00003738 C8610060 */ lfd f3, 0x60(r1)
/* 0000373C C8010058 */ lfd f0, 0x58(r1)
/* 00003740 EC632028 */ fsubs f3, f3, f4
/* 00003744 C0410010 */ lfs f2, 0x10(r1)
/* 00003748 EC000828 */ fsubs f0, f0, f1
/* 0000374C EC25182A */ fadds f1, f5, f3
/* 00003750 EC42002A */ fadds f2, f2, f0
/* 00003754 4BFFCA09 */ bl func_80071B60
/* 00003758 387D298C */ addi r3, r29, 0x298c
/* 0000375C 4BFFCA01 */ bl func_80071E58
lbl_00003760:
/* 00003760 BAC10098 */ lmw r22, 0x98(r1)
/* 00003764 800100C4 */ lwz r0, 0xc4(r1)
/* 00003768 382100C0 */ addi r1, r1, 0xc0
/* 0000376C 7C0803A6 */ mtlr r0
/* 00003770 4E800020 */ blr 
lbl_00003774:
/* 00003774 3C600000 */ lis r3, gamePauseStatus@ha
/* 00003778 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 0000377C 7000000A */ andi. r0, r0, 0xa
/* 00003780 4C820020 */ bnelr 
/* 00003784 3C600000 */ lis r3, lbl_100000B4@ha
/* 00003788 38830000 */ addi r4, r3, lbl_100000B4@l
/* 0000378C 38000000 */ li r0, 0
/* 00003790 3C600000 */ lis r3, lbl_100000B8@ha
/* 00003794 90040000 */ stw r0, 0(r4)
/* 00003798 38830000 */ addi r4, r3, lbl_100000B8@l
/* 0000379C 90040000 */ stw r0, 0(r4)
/* 000037A0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000037A4 38000074 */ li r0, 0x74
/* 000037A8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000037AC 4E800020 */ blr 
lbl_000037B0:
/* 000037B0 7C0802A6 */ mflr r0
/* 000037B4 3C600000 */ lis r3, gamePauseStatus@ha
/* 000037B8 90010004 */ stw r0, 4(r1)
/* 000037BC 3C800000 */ lis r4, lbl_10000000@ha
/* 000037C0 9421FFE0 */ stwu r1, -0x20(r1)
/* 000037C4 BF61000C */ stmw r27, 0xc(r1)
/* 000037C8 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 000037CC 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 000037D0 3C600000 */ lis r3, lbl_000102B0@ha
/* 000037D4 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 000037D8 7000000A */ andi. r0, r0, 0xa
/* 000037DC 4082025C */ bne lbl_00003A38
/* 000037E0 3C600000 */ lis r3, controllerInfo@ha
/* 000037E4 839E00B8 */ lwz r28, 0xb8(r30)
/* 000037E8 38830000 */ addi r4, r3, controllerInfo@l
/* 000037EC A0040030 */ lhz r0, 0x30(r4)
/* 000037F0 3BA40030 */ addi r29, r4, 0x30
/* 000037F4 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000037F8 40820040 */ bne lbl_00003838
/* 000037FC 3C600000 */ lis r3, analogButtonInfo@ha
/* 00003800 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00003804 A0030008 */ lhz r0, 8(r3)
/* 00003808 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000380C 4082002C */ bne lbl_00003838
/* 00003810 A0040000 */ lhz r0, 0(r4)
/* 00003814 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003818 40820010 */ bne lbl_00003828
/* 0000381C A0030000 */ lhz r0, 0(r3)
/* 00003820 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003824 41820064 */ beq lbl_00003888
lbl_00003828:
/* 00003828 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000382C A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00003830 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003834 41820054 */ beq lbl_00003888
lbl_00003838:
/* 00003838 1C1C000C */ mulli r0, r28, 0xc
/* 0000383C 3B7F2C70 */ addi r27, r31, 0x2c70
/* 00003840 7C7B0214 */ add r3, r27, r0
/* 00003844 80630000 */ lwz r3, 0(r3)
/* 00003848 2C030000 */ cmpwi r3, 0
/* 0000384C 41820008 */ beq lbl_00003854
/* 00003850 4BFFC90D */ bl call_bitmap_free_group
lbl_00003854:
/* 00003854 3B9C0001 */ addi r28, r28, 1
/* 00003858 1C1C000C */ mulli r0, r28, 0xc
/* 0000385C 7C7F0214 */ add r3, r31, r0
/* 00003860 80032C68 */ lwz r0, 0x2c68(r3)
/* 00003864 28000000 */ cmplwi r0, 0
/* 00003868 40820008 */ bne lbl_00003870
/* 0000386C 3B800000 */ li r28, 0
lbl_00003870:
/* 00003870 1C1C000C */ mulli r0, r28, 0xc
/* 00003874 7C7B0214 */ add r3, r27, r0
/* 00003878 80630000 */ lwz r3, 0(r3)
/* 0000387C 2C030000 */ cmpwi r3, 0
/* 00003880 41820008 */ beq lbl_00003888
/* 00003884 4BFFC8D9 */ bl call_bitmap_load_group
lbl_00003888:
/* 00003888 A01D0000 */ lhz r0, 0(r29)
/* 0000388C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003890 40820044 */ bne lbl_000038D4
/* 00003894 3C600000 */ lis r3, analogButtonInfo@ha
/* 00003898 38830000 */ addi r4, r3, analogButtonInfo@l
/* 0000389C A0040008 */ lhz r0, 8(r4)
/* 000038A0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000038A4 40820030 */ bne lbl_000038D4
/* 000038A8 3C600000 */ lis r3, controllerInfo@ha
/* 000038AC A0030000 */ lhz r0, controllerInfo@l(r3)
/* 000038B0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000038B4 40820010 */ bne lbl_000038C4
/* 000038B8 A0040000 */ lhz r0, 0(r4)
/* 000038BC 540007FF */ clrlwi. r0, r0, 0x1f
/* 000038C0 41820074 */ beq lbl_00003934
lbl_000038C4:
/* 000038C4 3C600000 */ lis r3, analogButtonInfo@ha
/* 000038C8 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 000038CC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000038D0 41820064 */ beq lbl_00003934
lbl_000038D4:
/* 000038D4 1C1C000C */ mulli r0, r28, 0xc
/* 000038D8 3B7F2C70 */ addi r27, r31, 0x2c70
/* 000038DC 7C7B0214 */ add r3, r27, r0
/* 000038E0 80630000 */ lwz r3, 0(r3)
/* 000038E4 2C030000 */ cmpwi r3, 0
/* 000038E8 41820008 */ beq lbl_000038F0
/* 000038EC 4BFFC871 */ bl call_bitmap_free_group
lbl_000038F0:
/* 000038F0 379CFFFF */ addic. r28, r28, -1  ;# fixed addi
/* 000038F4 40800028 */ bge lbl_0000391C
/* 000038F8 387F2C68 */ addi r3, r31, 0x2c68
/* 000038FC 3B800000 */ li r28, 0
/* 00003900 4800000C */ b lbl_0000390C
lbl_00003904:
/* 00003904 3863000C */ addi r3, r3, 0xc
/* 00003908 3B9C0001 */ addi r28, r28, 1
lbl_0000390C:
/* 0000390C 80030000 */ lwz r0, 0(r3)
/* 00003910 28000000 */ cmplwi r0, 0
/* 00003914 4082FFF0 */ bne lbl_00003904
/* 00003918 3B9CFFFF */ addi r28, r28, -1  ;# fixed addi
lbl_0000391C:
/* 0000391C 1C1C000C */ mulli r0, r28, 0xc
/* 00003920 7C7B0214 */ add r3, r27, r0
/* 00003924 80630000 */ lwz r3, 0(r3)
/* 00003928 2C030000 */ cmpwi r3, 0
/* 0000392C 41820008 */ beq lbl_00003934
/* 00003930 4BFFC82D */ bl call_bitmap_load_group
lbl_00003934:
/* 00003934 801E00B8 */ lwz r0, 0xb8(r30)
/* 00003938 7C1C0000 */ cmpw r28, r0
/* 0000393C 41820010 */ beq lbl_0000394C
/* 00003940 38000000 */ li r0, 0
/* 00003944 901E00B4 */ stw r0, 0xb4(r30)
/* 00003948 939E00B8 */ stw r28, 0xb8(r30)
lbl_0000394C:
/* 0000394C 801E00B8 */ lwz r0, 0xb8(r30)
/* 00003950 A0FD0000 */ lhz r7, 0(r29)
/* 00003954 1C60000C */ mulli r3, r0, 0xc
/* 00003958 809E00B4 */ lwz r4, 0xb4(r30)
/* 0000395C 7C7F1A14 */ add r3, r31, r3
/* 00003960 54E0077B */ rlwinm. r0, r7, 0, 0x1d, 0x1d
/* 00003964 80632C68 */ lwz r3, 0x2c68(r3)
/* 00003968 40820044 */ bne lbl_000039AC
/* 0000396C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00003970 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00003974 A0060008 */ lhz r0, 8(r6)
/* 00003978 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000397C 40820030 */ bne lbl_000039AC
/* 00003980 3CA00000 */ lis r5, controllerInfo@ha
/* 00003984 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 00003988 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000398C 40820010 */ bne lbl_0000399C
/* 00003990 A0060000 */ lhz r0, 0(r6)
/* 00003994 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00003998 4182002C */ beq lbl_000039C4
lbl_0000399C:
/* 0000399C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000039A0 A0050000 */ lhz r0, analogButtonInfo@l(r5)
/* 000039A4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000039A8 4182001C */ beq lbl_000039C4
lbl_000039AC:
/* 000039AC 38840001 */ addi r4, r4, 1
/* 000039B0 54801838 */ slwi r0, r4, 3
/* 000039B4 7C03002E */ lwzx r0, r3, r0
/* 000039B8 2C00FFFF */ cmpwi r0, -1
/* 000039BC 40820008 */ bne lbl_000039C4
/* 000039C0 38800000 */ li r4, 0
lbl_000039C4:
/* 000039C4 54E00739 */ rlwinm. r0, r7, 0, 0x1c, 0x1c
/* 000039C8 40820044 */ bne lbl_00003A0C
/* 000039CC 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000039D0 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 000039D4 A0060008 */ lhz r0, 8(r6)
/* 000039D8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000039DC 40820030 */ bne lbl_00003A0C
/* 000039E0 3CA00000 */ lis r5, controllerInfo@ha
/* 000039E4 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 000039E8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000039EC 40820010 */ bne lbl_000039FC
/* 000039F0 A0060000 */ lhz r0, 0(r6)
/* 000039F4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000039F8 4182003C */ beq lbl_00003A34
lbl_000039FC:
/* 000039FC 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00003A00 A0050000 */ lhz r0, analogButtonInfo@l(r5)
/* 00003A04 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003A08 4182002C */ beq lbl_00003A34
lbl_00003A0C:
/* 00003A0C 3484FFFF */ addic. r4, r4, -1  ;# fixed addi
/* 00003A10 40800024 */ bge lbl_00003A34
/* 00003A14 38800000 */ li r4, 0
/* 00003A18 4800000C */ b lbl_00003A24
lbl_00003A1C:
/* 00003A1C 38630008 */ addi r3, r3, 8
/* 00003A20 38840001 */ addi r4, r4, 1
lbl_00003A24:
/* 00003A24 80030000 */ lwz r0, 0(r3)
/* 00003A28 2C00FFFF */ cmpwi r0, -1
/* 00003A2C 4082FFF0 */ bne lbl_00003A1C
/* 00003A30 3884FFFF */ addi r4, r4, -1  ;# fixed addi
lbl_00003A34:
/* 00003A34 909E00B4 */ stw r4, 0xb4(r30)
lbl_00003A38:
/* 00003A38 BB61000C */ lmw r27, 0xc(r1)
/* 00003A3C 80010024 */ lwz r0, 0x24(r1)
/* 00003A40 38210020 */ addi r1, r1, 0x20
/* 00003A44 7C0803A6 */ mtlr r0
/* 00003A48 4E800020 */ blr 
lbl_00003A4C:
/* 00003A4C 7C0802A6 */ mflr r0
/* 00003A50 3CA00000 */ lis r5, lbl_0000FE78@ha
/* 00003A54 90010004 */ stw r0, 4(r1)
/* 00003A58 3C800000 */ lis r4, lbl_10000000@ha
/* 00003A5C 3C600000 */ lis r3, lbl_000102B0@ha
/* 00003A60 9421FF90 */ stwu r1, -0x70(r1)
/* 00003A64 BF410058 */ stmw r26, 0x58(r1)
/* 00003A68 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00003A6C 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 00003A70 3BA50000 */ addi r29, r5, lbl_0000FE78@l
/* 00003A74 38600002 */ li r3, 2
/* 00003A78 38800002 */ li r4, 2
/* 00003A7C 4BFFC6E1 */ bl g_debug_set_cursor_pos
/* 00003A80 801E00B8 */ lwz r0, 0xb8(r30)
/* 00003A84 1C00000C */ mulli r0, r0, 0xc
/* 00003A88 7C7F0214 */ add r3, r31, r0
/* 00003A8C 80632C6C */ lwz r3, 0x2c6c(r3)
/* 00003A90 4BFFC6CD */ bl g_debug_print
/* 00003A94 4BFFC6C9 */ bl func_80071A8C
/* 00003A98 801E00B8 */ lwz r0, 0xb8(r30)
/* 00003A9C 3C600000 */ lis r3, fontStrArray@ha
/* 00003AA0 3B830000 */ addi r28, r3, fontStrArray@l
/* 00003AA4 1C00000C */ mulli r0, r0, 0xc
/* 00003AA8 7C7F0214 */ add r3, r31, r0
/* 00003AAC 83632C68 */ lwz r27, 0x2c68(r3)
/* 00003AB0 3B400000 */ li r26, 0
/* 00003AB4 4800007C */ b lbl_00003B30
lbl_00003AB8:
/* 00003AB8 801E00B4 */ lwz r0, 0xb4(r30)
/* 00003ABC 7C1A0000 */ cmpw r26, r0
/* 00003AC0 40820040 */ bne lbl_00003B00
/* 00003AC4 38600002 */ li r3, 2
/* 00003AC8 4BFFC695 */ bl g_debug_set_text_color
/* 00003ACC 38600001 */ li r3, 1
/* 00003AD0 389A0004 */ addi r4, r26, 4
/* 00003AD4 4BFFC689 */ bl g_debug_set_cursor_pos
/* 00003AD8 801B0000 */ lwz r0, 0(r27)
/* 00003ADC 387F2CBC */ addi r3, r31, 0x2cbc
/* 00003AE0 4CC63182 */ crclr 6
/* 00003AE4 5400103A */ slwi r0, r0, 2
/* 00003AE8 7C9C0214 */ add r4, r28, r0
/* 00003AEC 80840000 */ lwz r4, 0(r4)
/* 00003AF0 4BFFC66D */ bl g_debug_printf
/* 00003AF4 38600000 */ li r3, 0
/* 00003AF8 4BFFC665 */ bl g_debug_set_text_color
/* 00003AFC 4800002C */ b lbl_00003B28
lbl_00003B00:
/* 00003B00 38600001 */ li r3, 1
/* 00003B04 389A0004 */ addi r4, r26, 4
/* 00003B08 4BFFC655 */ bl g_debug_set_cursor_pos
/* 00003B0C 801B0000 */ lwz r0, 0(r27)
/* 00003B10 387F2CC4 */ addi r3, r31, 0x2cc4
/* 00003B14 4CC63182 */ crclr 6
/* 00003B18 5400103A */ slwi r0, r0, 2
/* 00003B1C 7C9C0214 */ add r4, r28, r0
/* 00003B20 80840000 */ lwz r4, 0(r4)
/* 00003B24 4BFFC639 */ bl g_debug_printf
lbl_00003B28:
/* 00003B28 3B7B0008 */ addi r27, r27, 8
/* 00003B2C 3B5A0001 */ addi r26, r26, 1
lbl_00003B30:
/* 00003B30 801B0000 */ lwz r0, 0(r27)
/* 00003B34 2C000000 */ cmpwi r0, 0
/* 00003B38 4080FF80 */ bge lbl_00003AB8
/* 00003B3C 807E00B8 */ lwz r3, 0xb8(r30)
/* 00003B40 801E00B4 */ lwz r0, 0xb4(r30)
/* 00003B44 1C63000C */ mulli r3, r3, 0xc
/* 00003B48 7C7F1A14 */ add r3, r31, r3
/* 00003B4C 80632C68 */ lwz r3, 0x2c68(r3)
/* 00003B50 54001838 */ slwi r0, r0, 3
/* 00003B54 7F830214 */ add r28, r3, r0
/* 00003B58 807C0000 */ lwz r3, 0(r28)
/* 00003B5C 4BFFC601 */ bl func_80071AD4
/* 00003B60 C03D00F0 */ lfs f1, 0xf0(r29)
/* 00003B64 C05D00F4 */ lfs f2, 0xf4(r29)
/* 00003B68 4BFFC5F5 */ bl func_80071B60
/* 00003B6C 807C0004 */ lwz r3, 4(r28)
/* 00003B70 4BFFC5ED */ bl func_80071E58
/* 00003B74 3C600000 */ lis r3, controllerInfo@ha
/* 00003B78 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 00003B7C 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003B80 408200A0 */ bne lbl_00003C20
/* 00003B84 807E00B8 */ lwz r3, 0xb8(r30)
/* 00003B88 801E00B4 */ lwz r0, 0xb4(r30)
/* 00003B8C 1C63000C */ mulli r3, r3, 0xc
/* 00003B90 7C7F1A14 */ add r3, r31, r3
/* 00003B94 80632C68 */ lwz r3, 0x2c68(r3)
/* 00003B98 54001838 */ slwi r0, r0, 3
/* 00003B9C 7C63002E */ lwzx r3, r3, r0
/* 00003BA0 4BFFC5BD */ bl func_80071A74
/* 00003BA4 90610008 */ stw r3, 8(r1)
/* 00003BA8 38A00000 */ li r5, 0
/* 00003BAC 3880FFFF */ li r4, -1
/* 00003BB0 C01D00F8 */ lfs f0, 0xf8(r29)
/* 00003BB4 3800000A */ li r0, 0xa
/* 00003BB8 38610008 */ addi r3, r1, 8
/* 00003BBC D001000C */ stfs f0, 0xc(r1)
/* 00003BC0 C01D00FC */ lfs f0, 0xfc(r29)
/* 00003BC4 D0010010 */ stfs f0, 0x10(r1)
/* 00003BC8 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BCC D0010014 */ stfs f0, 0x14(r1)
/* 00003BD0 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BD4 D0010018 */ stfs f0, 0x18(r1)
/* 00003BD8 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BDC D001001C */ stfs f0, 0x1c(r1)
/* 00003BE0 C01D0060 */ lfs f0, 0x60(r29)
/* 00003BE4 D0010020 */ stfs f0, 0x20(r1)
/* 00003BE8 C01D0060 */ lfs f0, 0x60(r29)
/* 00003BEC D0010024 */ stfs f0, 0x24(r1)
/* 00003BF0 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BF4 D0010028 */ stfs f0, 0x28(r1)
/* 00003BF8 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BFC D001002C */ stfs f0, 0x2c(r1)
/* 00003C00 90A10030 */ stw r5, 0x30(r1)
/* 00003C04 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003C08 D0010034 */ stfs f0, 0x34(r1)
/* 00003C0C 90810038 */ stw r4, 0x38(r1)
/* 00003C10 9001003C */ stw r0, 0x3c(r1)
/* 00003C14 90810040 */ stw r4, 0x40(r1)
/* 00003C18 90A10044 */ stw r5, 0x44(r1)
/* 00003C1C 4BFFC541 */ bl draw_naomi_sprite
lbl_00003C20:
/* 00003C20 BB410058 */ lmw r26, 0x58(r1)
/* 00003C24 80010074 */ lwz r0, 0x74(r1)
/* 00003C28 38210070 */ addi r1, r1, 0x70
/* 00003C2C 7C0803A6 */ mtlr r0
/* 00003C30 4E800020 */ blr 
lbl_00003C34:
/* 00003C34 7C0802A6 */ mflr r0
/* 00003C38 3CA00000 */ lis r5, lbl_10000000@ha
/* 00003C3C 90010004 */ stw r0, 4(r1)
/* 00003C40 38A50000 */ addi r5, r5, lbl_10000000@l
/* 00003C44 3CC00000 */ lis r6, gameMode@ha
/* 00003C48 9421FFE0 */ stwu r1, -0x20(r1)
/* 00003C4C 93E1001C */ stw r31, 0x1c(r1)
/* 00003C50 3BE40000 */ addi r31, r4, 0
/* 00003C54 3C800000 */ lis r4, gameSubmode@ha
/* 00003C58 80E50150 */ lwz r7, 0x150(r5)
/* 00003C5C 211F0003 */ subfic r8, r31, 3
/* 00003C60 A8060000 */ lha r0, gameMode@l(r6)
/* 00003C64 20C70001 */ subfic r6, r7, 1
/* 00003C68 A9240000 */ lha r9, gameSubmode@l(r4)
/* 00003C6C 7D070034 */ cntlzw r7, r8
/* 00003C70 7CC60034 */ cntlzw r6, r6
/* 00003C74 20800003 */ subfic r4, r0, 3
/* 00003C78 3004FFFF */ addic r0, r4, -1  ;# fixed addi
/* 00003C7C 2C090077 */ cmpwi r9, 0x77
/* 00003C80 54E7D97E */ srwi r7, r7, 5
/* 00003C84 54C6D97E */ srwi r6, r6, 5
/* 00003C88 7CE73378 */ or r7, r7, r6
/* 00003C8C 7C002110 */ subfe r0, r0, r4
/* 00003C90 7CE70378 */ or r7, r7, r0
/* 00003C94 38000000 */ li r0, 0
/* 00003C98 41820010 */ beq lbl_00003CA8
/* 00003C9C 2C090078 */ cmpwi r9, 0x78
/* 00003CA0 41820008 */ beq lbl_00003CA8
/* 00003CA4 38000001 */ li r0, 1
lbl_00003CA8:
/* 00003CA8 7CE70379 */ or. r7, r7, r0
/* 00003CAC 41820018 */ beq lbl_00003CC4
/* 00003CB0 4BFFC4AD */ bl func_8008B2D4
/* 00003CB4 2C1F0003 */ cmpwi r31, 3
/* 00003CB8 418200C8 */ beq lbl_00003D80
/* 00003CBC 4BFFC4A1 */ bl func_8008D240
/* 00003CC0 480000C0 */ b lbl_00003D80
lbl_00003CC4:
/* 00003CC4 3C800000 */ lis r4, gamePauseStatus@ha
/* 00003CC8 80040000 */ lwz r0, gamePauseStatus@l(r4)
/* 00003CCC 7000000A */ andi. r0, r0, 0xa
/* 00003CD0 408200B0 */ bne lbl_00003D80
/* 00003CD4 80030074 */ lwz r0, 0x74(r3)
/* 00003CD8 28000000 */ cmplwi r0, 0
/* 00003CDC 41820094 */ beq lbl_00003D70
/* 00003CE0 5404103A */ slwi r4, r0, 2
/* 00003CE4 3CC00000 */ lis r6, lbl_0000FF78@ha
/* 00003CE8 7C852214 */ add r4, r5, r4
/* 00003CEC C0660000 */ lfs f3, lbl_0000FF78@l(r6)
/* 00003CF0 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003CF4 810400B8 */ lwz r8, 0xb8(r4)
/* 00003CF8 41820010 */ beq lbl_00003D08
/* 00003CFC 3C800000 */ lis r4, lbl_0000FF00@ha
/* 00003D00 C0040000 */ lfs f0, lbl_0000FF00@l(r4)
/* 00003D04 EC630032 */ fmuls f3, f3, f0
lbl_00003D08:
/* 00003D08 80E80030 */ lwz r7, 0x30(r8)
/* 00003D0C 3C004330 */ lis r0, 0x4330
/* 00003D10 80C80034 */ lwz r6, 0x34(r8)
/* 00003D14 3C800000 */ lis r4, lbl_0000FEC8@ha
/* 00003D18 90E30030 */ stw r7, 0x30(r3)
/* 00003D1C 90C30034 */ stw r6, 0x34(r3)
/* 00003D20 80C80038 */ lwz r6, 0x38(r8)
/* 00003D24 90C30038 */ stw r6, 0x38(r3)
/* 00003D28 80C30074 */ lwz r6, 0x74(r3)
/* 00003D2C C8240000 */ lfd f1, lbl_0000FEC8@l(r4)
/* 00003D30 90C10014 */ stw r6, 0x14(r1)
/* 00003D34 C0430030 */ lfs f2, 0x30(r3)
/* 00003D38 90010010 */ stw r0, 0x10(r1)
/* 00003D3C C8010010 */ lfd f0, 0x10(r1)
/* 00003D40 EC000828 */ fsubs f0, f0, f1
/* 00003D44 EC030032 */ fmuls f0, f3, f0
/* 00003D48 EC02002A */ fadds f0, f2, f0
/* 00003D4C D0030030 */ stfs f0, 0x30(r3)
/* 00003D50 80880060 */ lwz r4, 0x60(r8)
/* 00003D54 80080064 */ lwz r0, 0x64(r8)
/* 00003D58 90830060 */ stw r4, 0x60(r3)
/* 00003D5C 90030064 */ stw r0, 0x64(r3)
/* 00003D60 80880068 */ lwz r4, 0x68(r8)
/* 00003D64 8008006C */ lwz r0, 0x6c(r8)
/* 00003D68 90830068 */ stw r4, 0x68(r3)
/* 00003D6C 9003006C */ stw r0, 0x6c(r3)
lbl_00003D70:
/* 00003D70 C0050140 */ lfs f0, 0x140(r5)
/* 00003D74 80830000 */ lwz r4, 0(r3)
/* 00003D78 D004003C */ stfs f0, 0x3c(r4)
/* 00003D7C 4BFFC3E1 */ bl func_8008C4A8
lbl_00003D80:
/* 00003D80 80010024 */ lwz r0, 0x24(r1)
/* 00003D84 83E1001C */ lwz r31, 0x1c(r1)
/* 00003D88 38210020 */ addi r1, r1, 0x20
/* 00003D8C 7C0803A6 */ mtlr r0
/* 00003D90 4E800020 */ blr 
lbl_00003D94:
/* 00003D94 7C0802A6 */ mflr r0
/* 00003D98 3C600000 */ lis r3, lbl_10000000@ha
/* 00003D9C 90010004 */ stw r0, 4(r1)
/* 00003DA0 9421FFB8 */ stwu r1, -0x48(r1)
/* 00003DA4 93E10044 */ stw r31, 0x44(r1)
/* 00003DA8 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00003DAC 3C600000 */ lis r3, lbl_0000FE78@ha
/* 00003DB0 93C10040 */ stw r30, 0x40(r1)
/* 00003DB4 3BC30000 */ addi r30, r3, lbl_0000FE78@l
/* 00003DB8 801F013C */ lwz r0, 0x13c(r31)
/* 00003DBC 2C000010 */ cmpwi r0, 0x10
/* 00003DC0 408002DC */ bge lbl_0000409C
/* 00003DC4 807F0158 */ lwz r3, 0x158(r31)
/* 00003DC8 38800000 */ li r4, 0
/* 00003DCC 4BFFC391 */ bl func_8008ABB4
/* 00003DD0 809F0154 */ lwz r4, 0x154(r31)
/* 00003DD4 2C040000 */ cmpwi r4, 0
/* 00003DD8 40800020 */ bge lbl_00003DF8
/* 00003DDC 3C600000 */ lis r3, motSkeleton@ha
/* 00003DE0 38630000 */ addi r3, r3, motSkeleton@l
/* 00003DE4 80630000 */ lwz r3, 0(r3)
/* 00003DE8 80630004 */ lwz r3, 4(r3)
/* 00003DEC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00003DF0 901F0154 */ stw r0, 0x154(r31)
/* 00003DF4 48000024 */ b lbl_00003E18
lbl_00003DF8:
/* 00003DF8 3C600000 */ lis r3, motSkeleton@ha
/* 00003DFC 38630000 */ addi r3, r3, motSkeleton@l
/* 00003E00 80630000 */ lwz r3, 0(r3)
/* 00003E04 80030004 */ lwz r0, 4(r3)
/* 00003E08 7C040040 */ cmplw r4, r0
/* 00003E0C 4180000C */ blt lbl_00003E18
/* 00003E10 38000000 */ li r0, 0
/* 00003E14 901F0154 */ stw r0, 0x154(r31)
lbl_00003E18:
/* 00003E18 3C600000 */ lis r3, motSkeleton@ha
/* 00003E1C 801F0154 */ lwz r0, 0x154(r31)
/* 00003E20 80A30000 */ lwz r5, motSkeleton@l(r3)
/* 00003E24 1C000018 */ mulli r0, r0, 0x18
/* 00003E28 809F0158 */ lwz r4, 0x158(r31)
/* 00003E2C 80650000 */ lwz r3, 0(r5)
/* 00003E30 7C630214 */ add r3, r3, r0
/* 00003E34 2C040000 */ cmpwi r4, 0
/* 00003E38 80630014 */ lwz r3, 0x14(r3)
/* 00003E3C 40800014 */ bge lbl_00003E50
/* 00003E40 8085000C */ lwz r4, 0xc(r5)
/* 00003E44 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 00003E48 901F0158 */ stw r0, 0x158(r31)
/* 00003E4C 48000018 */ b lbl_00003E64
lbl_00003E50:
/* 00003E50 8005000C */ lwz r0, 0xc(r5)
/* 00003E54 7C040040 */ cmplw r4, r0
/* 00003E58 4180000C */ blt lbl_00003E64
/* 00003E5C 38000000 */ li r0, 0
/* 00003E60 901F0158 */ stw r0, 0x158(r31)
lbl_00003E64:
/* 00003E64 801F0158 */ lwz r0, 0x158(r31)
/* 00003E68 80850008 */ lwz r4, 8(r5)
/* 00003E6C 1C00001C */ mulli r0, r0, 0x1c
/* 00003E70 7C84002E */ lwzx r4, r4, r0
/* 00003E74 4BFFC2E9 */ bl func_8008B3B8
/* 00003E78 80BF013C */ lwz r5, 0x13c(r31)
/* 00003E7C 3C800000 */ lis r4, lbl_00003C34@ha
/* 00003E80 38040000 */ addi r0, r4, lbl_00003C34@l
/* 00003E84 54A4103A */ slwi r4, r5, 2
/* 00003E88 7C9F2214 */ add r4, r31, r4
/* 00003E8C 906400BC */ stw r3, 0xbc(r4)
/* 00003E90 7C030378 */ mr r3, r0
/* 00003E94 38A00005 */ li r5, 5
/* 00003E98 801F0158 */ lwz r0, 0x158(r31)
/* 00003E9C 808400BC */ lwz r4, 0xbc(r4)
/* 00003EA0 90040010 */ stw r0, 0x10(r4)
/* 00003EA4 80DF013C */ lwz r6, 0x13c(r31)
/* 00003EA8 54C0103A */ slwi r0, r6, 2
/* 00003EAC 7C9F0214 */ add r4, r31, r0
/* 00003EB0 808400BC */ lwz r4, 0xbc(r4)
/* 00003EB4 90C40074 */ stw r6, 0x74(r4)
/* 00003EB8 801F013C */ lwz r0, 0x13c(r31)
/* 00003EBC 5400103A */ slwi r0, r0, 2
/* 00003EC0 7C9F0214 */ add r4, r31, r0
/* 00003EC4 808400BC */ lwz r4, 0xbc(r4)
/* 00003EC8 4BFFC295 */ bl func_8008D1DC
/* 00003ECC 801F013C */ lwz r0, 0x13c(r31)
/* 00003ED0 5400103A */ slwi r0, r0, 2
/* 00003ED4 7C9F0214 */ add r4, r31, r0
/* 00003ED8 906400FC */ stw r3, 0xfc(r4)
/* 00003EDC 807E0104 */ lwz r3, 0x104(r30)
/* 00003EE0 801E0108 */ lwz r0, 0x108(r30)
/* 00003EE4 9061002C */ stw r3, 0x2c(r1)
/* 00003EE8 90010030 */ stw r0, 0x30(r1)
/* 00003EEC 801E010C */ lwz r0, 0x10c(r30)
/* 00003EF0 90010034 */ stw r0, 0x34(r1)
/* 00003EF4 8061002C */ lwz r3, 0x2c(r1)
/* 00003EF8 80010030 */ lwz r0, 0x30(r1)
/* 00003EFC 907F0144 */ stw r3, 0x144(r31)
/* 00003F00 901F0148 */ stw r0, 0x148(r31)
/* 00003F04 80010034 */ lwz r0, 0x34(r1)
/* 00003F08 901F014C */ stw r0, 0x14c(r31)
/* 00003F0C 4BFFC251 */ bl mathutil_mtxA_from_identity
/* 00003F10 38604000 */ li r3, 0x4000
/* 00003F14 4BFFC249 */ bl mathutil_mtxA_rotate_y
/* 00003F18 801F013C */ lwz r0, 0x13c(r31)
/* 00003F1C 5400103A */ slwi r0, r0, 2
/* 00003F20 7C7F0214 */ add r3, r31, r0
/* 00003F24 806300BC */ lwz r3, 0xbc(r3)
/* 00003F28 38630060 */ addi r3, r3, 0x60
/* 00003F2C 4BFFC231 */ bl mathutil_mtxA_to_quat
/* 00003F30 807F013C */ lwz r3, 0x13c(r31)
/* 00003F34 2C030000 */ cmpwi r3, 0
/* 00003F38 418200B0 */ beq lbl_00003FE8
/* 00003F3C 5460103A */ slwi r0, r3, 2
/* 00003F40 C07E0100 */ lfs f3, 0x100(r30)
/* 00003F44 38BF00B8 */ addi r5, r31, 0xb8
/* 00003F48 7C85002E */ lwzx r4, r5, r0
/* 00003F4C 7C7F0214 */ add r3, r31, r0
/* 00003F50 806300BC */ lwz r3, 0xbc(r3)
/* 00003F54 80840000 */ lwz r4, 0(r4)
/* 00003F58 80630000 */ lwz r3, 0(r3)
/* 00003F5C A0840038 */ lhz r4, 0x38(r4)
/* 00003F60 38040001 */ addi r0, r4, 1
/* 00003F64 B0030038 */ sth r0, 0x38(r3)
/* 00003F68 807F013C */ lwz r3, 0x13c(r31)
/* 00003F6C 546007FF */ clrlwi. r0, r3, 0x1f
/* 00003F70 4182000C */ beq lbl_00003F7C
/* 00003F74 C01E0088 */ lfs f0, 0x88(r30)
/* 00003F78 EC630032 */ fmuls f3, f3, f0
lbl_00003F7C:
/* 00003F7C 5460103A */ slwi r0, r3, 2
/* 00003F80 7CE5002E */ lwzx r7, r5, r0
/* 00003F84 7C9F0214 */ add r4, r31, r0
/* 00003F88 80C400BC */ lwz r6, 0xbc(r4)
/* 00003F8C 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00003F90 80A70030 */ lwz r5, 0x30(r7)
/* 00003F94 80870034 */ lwz r4, 0x34(r7)
/* 00003F98 3C004330 */ lis r0, 0x4330
/* 00003F9C 90A60030 */ stw r5, 0x30(r6)
/* 00003FA0 90860034 */ stw r4, 0x34(r6)
/* 00003FA4 80870038 */ lwz r4, 0x38(r7)
/* 00003FA8 90860038 */ stw r4, 0x38(r6)
/* 00003FAC 809F013C */ lwz r4, 0x13c(r31)
/* 00003FB0 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 00003FB4 6C838000 */ xoris r3, r4, 0x8000
/* 00003FB8 9061003C */ stw r3, 0x3c(r1)
/* 00003FBC 5483103A */ slwi r3, r4, 2
/* 00003FC0 7C7F1A14 */ add r3, r31, r3
/* 00003FC4 90010038 */ stw r0, 0x38(r1)
/* 00003FC8 806300BC */ lwz r3, 0xbc(r3)
/* 00003FCC C8010038 */ lfd f0, 0x38(r1)
/* 00003FD0 C0430030 */ lfs f2, 0x30(r3)
/* 00003FD4 EC000828 */ fsubs f0, f0, f1
/* 00003FD8 EC030032 */ fmuls f0, f3, f0
/* 00003FDC EC02002A */ fadds f0, f2, f0
/* 00003FE0 D0030030 */ stfs f0, 0x30(r3)
/* 00003FE4 4800008C */ b lbl_00004070
lbl_00003FE8:
/* 00003FE8 801F0158 */ lwz r0, 0x158(r31)
/* 00003FEC 2C000003 */ cmpwi r0, 3
/* 00003FF0 40820044 */ bne lbl_00004034
/* 00003FF4 80BE0110 */ lwz r5, 0x110(r30)
/* 00003FF8 5460103A */ slwi r0, r3, 2
/* 00003FFC 809E0114 */ lwz r4, 0x114(r30)
/* 00004000 7C7F0214 */ add r3, r31, r0
/* 00004004 90A10020 */ stw r5, 0x20(r1)
/* 00004008 90810024 */ stw r4, 0x24(r1)
/* 0000400C 801E0118 */ lwz r0, 0x118(r30)
/* 00004010 90010028 */ stw r0, 0x28(r1)
/* 00004014 808300BC */ lwz r4, 0xbc(r3)
/* 00004018 80610020 */ lwz r3, 0x20(r1)
/* 0000401C 80010024 */ lwz r0, 0x24(r1)
/* 00004020 90640030 */ stw r3, 0x30(r4)
/* 00004024 90040034 */ stw r0, 0x34(r4)
/* 00004028 80010028 */ lwz r0, 0x28(r1)
/* 0000402C 90040038 */ stw r0, 0x38(r4)
/* 00004030 48000040 */ b lbl_00004070
lbl_00004034:
/* 00004034 80BE011C */ lwz r5, 0x11c(r30)
/* 00004038 5460103A */ slwi r0, r3, 2
/* 0000403C 809E0120 */ lwz r4, 0x120(r30)
/* 00004040 7C7F0214 */ add r3, r31, r0
/* 00004044 90A10014 */ stw r5, 0x14(r1)
/* 00004048 90810018 */ stw r4, 0x18(r1)
/* 0000404C 801E0124 */ lwz r0, 0x124(r30)
/* 00004050 9001001C */ stw r0, 0x1c(r1)
/* 00004054 808300BC */ lwz r4, 0xbc(r3)
/* 00004058 80610014 */ lwz r3, 0x14(r1)
/* 0000405C 80010018 */ lwz r0, 0x18(r1)
/* 00004060 90640030 */ stw r3, 0x30(r4)
/* 00004064 90040034 */ stw r0, 0x34(r4)
/* 00004068 8001001C */ lwz r0, 0x1c(r1)
/* 0000406C 90040038 */ stw r0, 0x38(r4)
lbl_00004070:
/* 00004070 801F013C */ lwz r0, 0x13c(r31)
/* 00004074 3C600000 */ lis r3, lbl_00012F7C@ha
/* 00004078 38830000 */ addi r4, r3, lbl_00012F7C@l
/* 0000407C 5400103A */ slwi r0, r0, 2
/* 00004080 7C7F0214 */ add r3, r31, r0
/* 00004084 806300BC */ lwz r3, 0xbc(r3)
/* 00004088 38A00008 */ li r5, 8
/* 0000408C 4BFFC0D1 */ bl func_8008BFD8
/* 00004090 807F013C */ lwz r3, 0x13c(r31)
/* 00004094 38030001 */ addi r0, r3, 1
/* 00004098 901F013C */ stw r0, 0x13c(r31)
lbl_0000409C:
/* 0000409C 8001004C */ lwz r0, 0x4c(r1)
/* 000040A0 83E10044 */ lwz r31, 0x44(r1)
/* 000040A4 83C10040 */ lwz r30, 0x40(r1)
/* 000040A8 7C0803A6 */ mtlr r0
/* 000040AC 38210048 */ addi r1, r1, 0x48
/* 000040B0 4E800020 */ blr 
lbl_000040B4:
/* 000040B4 4E800020 */ blr 
lbl_000040B8:
/* 000040B8 7C0802A6 */ mflr r0
/* 000040BC 3C600000 */ lis r3, gamePauseStatus@ha
/* 000040C0 90010004 */ stw r0, 4(r1)
/* 000040C4 3C800000 */ lis r4, lbl_0000FE78@ha
/* 000040C8 9421FFE8 */ stwu r1, -0x18(r1)
/* 000040CC 93E10014 */ stw r31, 0x14(r1)
/* 000040D0 3BE40000 */ addi r31, r4, lbl_0000FE78@l
/* 000040D4 93C10010 */ stw r30, 0x10(r1)
/* 000040D8 93A1000C */ stw r29, 0xc(r1)
/* 000040DC 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 000040E0 3C600000 */ lis r3, lbl_10000000@ha
/* 000040E4 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 000040E8 7000000A */ andi. r0, r0, 0xa
/* 000040EC 408200BC */ bne lbl_000041A8
/* 000040F0 3860000F */ li r3, 0xf
/* 000040F4 4BFFC069 */ bl event_start
/* 000040F8 38600003 */ li r3, 3
/* 000040FC 4BFFC061 */ bl camera_set_state
/* 00004100 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00004104 C01F0060 */ lfs f0, 0x60(r31)
/* 00004108 38830000 */ addi r4, r3, currentCameraStructPtr@l
/* 0000410C 80640000 */ lwz r3, 0(r4)
/* 00004110 3BC00000 */ li r30, 0
/* 00004114 D0030000 */ stfs f0, 0(r3)
/* 00004118 C01F00B8 */ lfs f0, 0xb8(r31)
/* 0000411C 80640000 */ lwz r3, 0(r4)
/* 00004120 D0030004 */ stfs f0, 4(r3)
/* 00004124 C01F0128 */ lfs f0, 0x128(r31)
/* 00004128 80640000 */ lwz r3, 0(r4)
/* 0000412C D0030008 */ stfs f0, 8(r3)
/* 00004130 C01F0060 */ lfs f0, 0x60(r31)
/* 00004134 80640000 */ lwz r3, 0(r4)
/* 00004138 D003000C */ stfs f0, 0xc(r3)
/* 0000413C C01F0078 */ lfs f0, 0x78(r31)
/* 00004140 80640000 */ lwz r3, 0(r4)
/* 00004144 D0030010 */ stfs f0, 0x10(r3)
/* 00004148 C01F0060 */ lfs f0, 0x60(r31)
/* 0000414C 80640000 */ lwz r3, 0(r4)
/* 00004150 D0030014 */ stfs f0, 0x14(r3)
/* 00004154 93DD0158 */ stw r30, 0x158(r29)
/* 00004158 93DD0154 */ stw r30, 0x154(r29)
/* 0000415C 93DD0150 */ stw r30, 0x150(r29)
/* 00004160 93DD013C */ stw r30, 0x13c(r29)
/* 00004164 4BFFFC31 */ bl lbl_00003D94
/* 00004168 C01F00B8 */ lfs f0, 0xb8(r31)
/* 0000416C 3C600000 */ lis r3, modeCtrl@ha
/* 00004170 3CA00000 */ lis r5, lbl_000040B4@ha
/* 00004174 D01D0140 */ stfs f0, 0x140(r29)
/* 00004178 38630000 */ addi r3, r3, modeCtrl@l
/* 0000417C 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 00004180 93C30010 */ stw r30, 0x10(r3)
/* 00004184 38050000 */ addi r0, r5, lbl_000040B4@l
/* 00004188 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000418C 90040000 */ stw r0, lbl_802F1B7C@l(r4)
/* 00004190 38000078 */ li r0, 0x78
/* 00004194 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00004198 C03F012C */ lfs f1, 0x12c(r31)
/* 0000419C FC400890 */ fmr f2, f1
/* 000041A0 FC600890 */ fmr f3, f1
/* 000041A4 4BFFBFB9 */ bl g_avdisp_set_3_floats
lbl_000041A8:
/* 000041A8 8001001C */ lwz r0, 0x1c(r1)
/* 000041AC 83E10014 */ lwz r31, 0x14(r1)
/* 000041B0 83C10010 */ lwz r30, 0x10(r1)
/* 000041B4 7C0803A6 */ mtlr r0
/* 000041B8 83A1000C */ lwz r29, 0xc(r1)
/* 000041BC 38210018 */ addi r1, r1, 0x18
/* 000041C0 4E800020 */ blr 
lbl_000041C4:
/* 000041C4 7C0802A6 */ mflr r0
/* 000041C8 3C600000 */ lis r3, lbl_10000000@ha
/* 000041CC 90010004 */ stw r0, 4(r1)
/* 000041D0 3C800000 */ lis r4, lbl_0000FE78@ha
/* 000041D4 9421FF48 */ stwu r1, -0xb8(r1)
/* 000041D8 BE21007C */ stmw r17, 0x7c(r1)
/* 000041DC 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 000041E0 3C600000 */ lis r3, lbl_000102B0@ha
/* 000041E4 3AE40000 */ addi r23, r4, lbl_0000FE78@l
/* 000041E8 3B030000 */ addi r24, r3, lbl_000102B0@l
/* 000041EC 801F0150 */ lwz r0, 0x150(r31)
/* 000041F0 83DF00BC */ lwz r30, 0xbc(r31)
/* 000041F4 2C000000 */ cmpwi r0, 0
/* 000041F8 41820080 */ beq lbl_00004278
/* 000041FC 4800B9AD */ bl lbl_0000FBA8
/* 00004200 2C030000 */ cmpwi r3, 0
/* 00004204 907F0150 */ stw r3, 0x150(r31)
/* 00004208 40820DF0 */ bne lbl_00004FF8
/* 0000420C 4BFFBF51 */ bl func_8002FFEC
/* 00004210 38600003 */ li r3, 3
/* 00004214 4BFFBF49 */ bl camera_set_state
/* 00004218 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000421C C0170060 */ lfs f0, 0x60(r23)
/* 00004220 38830000 */ addi r4, r3, currentCameraStructPtr@l
/* 00004224 80640000 */ lwz r3, 0(r4)
/* 00004228 38000000 */ li r0, 0
/* 0000422C D0030000 */ stfs f0, 0(r3)
/* 00004230 C01700B8 */ lfs f0, 0xb8(r23)
/* 00004234 80640000 */ lwz r3, 0(r4)
/* 00004238 D0030004 */ stfs f0, 4(r3)
/* 0000423C C0170128 */ lfs f0, 0x128(r23)
/* 00004240 80640000 */ lwz r3, 0(r4)
/* 00004244 D0030008 */ stfs f0, 8(r3)
/* 00004248 C0170060 */ lfs f0, 0x60(r23)
/* 0000424C 80640000 */ lwz r3, 0(r4)
/* 00004250 D003000C */ stfs f0, 0xc(r3)
/* 00004254 C0170078 */ lfs f0, 0x78(r23)
/* 00004258 80640000 */ lwz r3, 0(r4)
/* 0000425C D0030010 */ stfs f0, 0x10(r3)
/* 00004260 C0170060 */ lfs f0, 0x60(r23)
/* 00004264 80640000 */ lwz r3, 0(r4)
/* 00004268 D0030014 */ stfs f0, 0x14(r3)
/* 0000426C 901F013C */ stw r0, 0x13c(r31)
/* 00004270 4BFFFB25 */ bl lbl_00003D94
/* 00004274 48000D84 */ b lbl_00004FF8
lbl_00004278:
/* 00004278 3C600000 */ lis r3, controllerInfo@ha
/* 0000427C 38630000 */ addi r3, r3, controllerInfo@l
/* 00004280 A0830030 */ lhz r4, 0x30(r3)
/* 00004284 3AA30030 */ addi r21, r3, 0x30
/* 00004288 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 0000428C 40820020 */ bne lbl_000042AC
/* 00004290 A0A30000 */ lhz r5, 0(r3)
/* 00004294 54A00739 */ rlwinm. r0, r5, 0, 0x1c, 0x1c
/* 00004298 4182003C */ beq lbl_000042D4
/* 0000429C 3C600000 */ lis r3, analogButtonInfo@ha
/* 000042A0 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 000042A4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000042A8 4182002C */ beq lbl_000042D4
lbl_000042AC:
/* 000042AC 3C600000 */ lis r3, modeCtrl@ha
/* 000042B0 38630000 */ addi r3, r3, modeCtrl@l
/* 000042B4 38830010 */ addi r4, r3, 0x10
/* 000042B8 80630010 */ lwz r3, 0x10(r3)
/* 000042BC 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 000042C0 90040000 */ stw r0, 0(r4)
/* 000042C4 40800058 */ bge lbl_0000431C
/* 000042C8 38000007 */ li r0, 7
/* 000042CC 90040000 */ stw r0, 0(r4)
/* 000042D0 4800004C */ b lbl_0000431C
lbl_000042D4:
/* 000042D4 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 000042D8 4082001C */ bne lbl_000042F4
/* 000042DC 54A0077B */ rlwinm. r0, r5, 0, 0x1d, 0x1d
/* 000042E0 4182003C */ beq lbl_0000431C
/* 000042E4 3C600000 */ lis r3, analogButtonInfo@ha
/* 000042E8 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 000042EC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000042F0 4182002C */ beq lbl_0000431C
lbl_000042F4:
/* 000042F4 3C600000 */ lis r3, modeCtrl@ha
/* 000042F8 38630000 */ addi r3, r3, modeCtrl@l
/* 000042FC 38830010 */ addi r4, r3, 0x10
/* 00004300 80630010 */ lwz r3, 0x10(r3)
/* 00004304 38030001 */ addi r0, r3, 1
/* 00004308 2C000008 */ cmpwi r0, 8
/* 0000430C 90040000 */ stw r0, 0(r4)
/* 00004310 4180000C */ blt lbl_0000431C
/* 00004314 38000000 */ li r0, 0
/* 00004318 90040000 */ stw r0, 0(r4)
lbl_0000431C:
/* 0000431C 38600002 */ li r3, 2
/* 00004320 38800001 */ li r4, 1
/* 00004324 4BFFBE39 */ bl g_debug_set_cursor_pos
/* 00004328 3C800000 */ lis r4, lbl_802F20AC@ha
/* 0000432C 3C600000 */ lis r3, motLabel@ha
/* 00004330 3CA00000 */ lis r5, motSkeleton@ha
/* 00004334 3CE00000 */ lis r7, modeCtrl@ha
/* 00004338 3CC00000 */ lis r6, lbl_00013178@ha
/* 0000433C 3B440000 */ addi r26, r4, lbl_802F20AC@l
/* 00004340 3B630000 */ addi r27, r3, motLabel@l
/* 00004344 3A410038 */ addi r18, r1, 0x38
/* 00004348 3B250000 */ addi r25, r5, motSkeleton@l
/* 0000434C 3A870000 */ addi r20, r7, modeCtrl@l
/* 00004350 3A660000 */ addi r19, r6, lbl_00013178@l
/* 00004354 3AC00000 */ li r22, 0
/* 00004358 3BA00000 */ li r29, 0
/* 0000435C 3F804330 */ lis r28, 0x4330
lbl_00004360:
/* 00004360 80770130 */ lwz r3, 0x130(r23)
/* 00004364 80170134 */ lwz r0, 0x134(r23)
/* 00004368 90610038 */ stw r3, 0x38(r1)
/* 0000436C 9001003C */ stw r0, 0x3c(r1)
/* 00004370 80770138 */ lwz r3, 0x138(r23)
/* 00004374 8017013C */ lwz r0, 0x13c(r23)
/* 00004378 90610040 */ stw r3, 0x40(r1)
/* 0000437C 90010044 */ stw r0, 0x44(r1)
/* 00004380 80140010 */ lwz r0, 0x10(r20)
/* 00004384 7C160000 */ cmpw r22, r0
/* 00004388 40820024 */ bne lbl_000043AC
/* 0000438C 38600002 */ li r3, 2
/* 00004390 4BFFBDCD */ bl g_debug_set_text_color
/* 00004394 3860FFFF */ li r3, -1
/* 00004398 38800000 */ li r4, 0
/* 0000439C 4BFFBDC1 */ bl func_8002FC90
/* 000043A0 38782E1C */ addi r3, r24, 0x2e1c
/* 000043A4 4BFFBDB9 */ bl g_debug_print
/* 000043A8 4800000C */ b lbl_000043B4
lbl_000043AC:
/* 000043AC 38600000 */ li r3, 0
/* 000043B0 4BFFBDAD */ bl g_debug_set_text_color
lbl_000043B4:
/* 000043B4 28160007 */ cmplwi r22, 7
/* 000043B8 41810184 */ bgt lbl_0000453C
/* 000043BC 7C13E82E */ lwzx r0, r19, r29
/* 000043C0 7C0903A6 */ mtctr r0
/* 000043C4 4E800420 */ bctr 
lbl_000043C8:
/* 000043C8 811E0000 */ lwz r8, 0(r30)
/* 000043CC 38782E20 */ addi r3, r24, 0x2e20
/* 000043D0 80DB0000 */ lwz r6, 0(r27)
/* 000043D4 4CC63182 */ crclr 6
/* 000043D8 A0880032 */ lhz r4, 0x32(r8)
/* 000043DC A0E80038 */ lhz r7, 0x38(r8)
/* 000043E0 5480103A */ slwi r0, r4, 2
/* 000043E4 80BA0000 */ lwz r5, 0(r26)
/* 000043E8 A108003A */ lhz r8, 0x3a(r8)
/* 000043EC 7CC6002E */ lwzx r6, r6, r0
/* 000043F0 4BFFBD6D */ bl g_debug_printf
/* 000043F4 48000148 */ b lbl_0000453C
lbl_000043F8:
/* 000043F8 809F0154 */ lwz r4, 0x154(r31)
/* 000043FC 38782E3C */ addi r3, r24, 0x2e3c
/* 00004400 80B90000 */ lwz r5, 0(r25)
/* 00004404 4CC63182 */ crclr 6
/* 00004408 1CC40018 */ mulli r6, r4, 0x18
/* 0000440C 80E50000 */ lwz r7, 0(r5)
/* 00004410 80A50004 */ lwz r5, 4(r5)
/* 00004414 38060014 */ addi r0, r6, 0x14
/* 00004418 7CC7002E */ lwzx r6, r7, r0
/* 0000441C 4BFFBD41 */ bl g_debug_printf
/* 00004420 4800011C */ b lbl_0000453C
lbl_00004424:
/* 00004424 809F0158 */ lwz r4, 0x158(r31)
/* 00004428 38782E3C */ addi r3, r24, 0x2e3c
/* 0000442C 80B90000 */ lwz r5, 0(r25)
/* 00004430 4CC63182 */ crclr 6
/* 00004434 1C04001C */ mulli r0, r4, 0x1c
/* 00004438 80C50008 */ lwz r6, 8(r5)
/* 0000443C 80A5000C */ lwz r5, 0xc(r5)
/* 00004440 7CC6002E */ lwzx r6, r6, r0
/* 00004444 4BFFBD19 */ bl g_debug_printf
/* 00004448 480000F4 */ b lbl_0000453C
lbl_0000444C:
/* 0000444C 809E00B4 */ lwz r4, 0xb4(r30)
/* 00004450 38782E4C */ addi r3, r24, 0x2e4c
/* 00004454 4CC63182 */ crclr 6
/* 00004458 5480103A */ slwi r0, r4, 2
/* 0000445C 7CB2002E */ lwzx r5, r18, r0
/* 00004460 4BFFBCFD */ bl g_debug_printf
/* 00004464 480000D8 */ b lbl_0000453C
lbl_00004468:
/* 00004468 809E0090 */ lwz r4, 0x90(r30)
/* 0000446C 38782E5C */ addi r3, r24, 0x2e5c
/* 00004470 4CC63182 */ crclr 6
/* 00004474 38A00004 */ li r5, 4
/* 00004478 5480103A */ slwi r0, r4, 2
/* 0000447C 7CD80214 */ add r6, r24, r0
/* 00004480 80C62DC4 */ lwz r6, 0x2dc4(r6)
/* 00004484 4BFFBCD9 */ bl g_debug_printf
/* 00004488 480000B4 */ b lbl_0000453C
lbl_0000448C:
/* 0000448C C03F0140 */ lfs f1, 0x140(r31)
/* 00004490 38782E70 */ addi r3, r24, 0x2e70
/* 00004494 4CC63242 */ crset 6
/* 00004498 4BFFBCC5 */ bl g_debug_printf
/* 0000449C 480000A0 */ b lbl_0000453C
lbl_000044A0:
/* 000044A0 80FE0000 */ lwz r7, 0(r30)
/* 000044A4 3CA00000 */ lis r5, lbl_0000FEC8@ha
/* 000044A8 C8450000 */ lfd f2, lbl_0000FEC8@l(r5)
/* 000044AC 38782E88 */ addi r3, r24, 0x2e88
/* 000044B0 A007008E */ lhz r0, 0x8e(r7)
/* 000044B4 A087008C */ lhz r4, 0x8c(r7)
/* 000044B8 4CC63242 */ crset 6
/* 000044BC 90010074 */ stw r0, 0x74(r1)
/* 000044C0 C0070098 */ lfs f0, 0x98(r7)
/* 000044C4 5480103A */ slwi r0, r4, 2
/* 000044C8 93810070 */ stw r28, 0x70(r1)
/* 000044CC 80DB0000 */ lwz r6, 0(r27)
/* 000044D0 C8210070 */ lfd f1, 0x70(r1)
/* 000044D4 80BA0000 */ lwz r5, 0(r26)
/* 000044D8 EC211028 */ fsubs f1, f1, f2
/* 000044DC 7CC6002E */ lwzx r6, r6, r0
/* 000044E0 C04700A0 */ lfs f2, 0xa0(r7)
/* 000044E4 EC21002A */ fadds f1, f1, f0
/* 000044E8 4BFFBC75 */ bl g_debug_printf
/* 000044EC 48000050 */ b lbl_0000453C
lbl_000044F0:
/* 000044F0 80FE0000 */ lwz r7, 0(r30)
/* 000044F4 3CA00000 */ lis r5, lbl_0000FEC8@ha
/* 000044F8 C8450000 */ lfd f2, lbl_0000FEC8@l(r5)
/* 000044FC 38782E88 */ addi r3, r24, 0x2e88
/* 00004500 A007411E */ lhz r0, 0x411e(r7)
/* 00004504 A087411C */ lhz r4, 0x411c(r7)
/* 00004508 4CC63242 */ crset 6
/* 0000450C 90010074 */ stw r0, 0x74(r1)
/* 00004510 C0074128 */ lfs f0, 0x4128(r7)
/* 00004514 5480103A */ slwi r0, r4, 2
/* 00004518 93810070 */ stw r28, 0x70(r1)
/* 0000451C 80DB0000 */ lwz r6, 0(r27)
/* 00004520 C8210070 */ lfd f1, 0x70(r1)
/* 00004524 80BA0000 */ lwz r5, 0(r26)
/* 00004528 EC211028 */ fsubs f1, f1, f2
/* 0000452C 7CC6002E */ lwzx r6, r6, r0
/* 00004530 C0474130 */ lfs f2, 0x4130(r7)
/* 00004534 EC21002A */ fadds f1, f1, f0
/* 00004538 4BFFBC25 */ bl g_debug_printf
lbl_0000453C:
/* 0000453C 3AD60001 */ addi r22, r22, 1
/* 00004540 2C160008 */ cmpwi r22, 8
/* 00004544 3BBD0004 */ addi r29, r29, 4
/* 00004548 4180FE18 */ blt lbl_00004360
/* 0000454C 38600000 */ li r3, 0
/* 00004550 4BFFBC0D */ bl g_debug_set_text_color
/* 00004554 3C600000 */ lis r3, gamePauseStatus@ha
/* 00004558 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 0000455C 7000000A */ andi. r0, r0, 0xa
/* 00004560 40820A98 */ bne lbl_00004FF8
/* 00004564 4BFFBBF9 */ bl mathutil_mtxA_from_mtxB
/* 00004568 3C600000 */ lis r3, controllerInfo@ha
/* 0000456C C8970140 */ lfd f4, 0x140(r23)
/* 00004570 3A430000 */ addi r18, r3, controllerInfo@l
/* 00004574 88920002 */ lbz r4, 2(r18)
/* 00004578 3CA00000 */ lis r5, lbl_0000FED0@ha
/* 0000457C 88120004 */ lbz r0, 4(r18)
/* 00004580 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00004584 7C840774 */ extsb r4, r4
/* 00004588 7C000774 */ extsb r0, r0
/* 0000458C C8650000 */ lfd f3, lbl_0000FED0@l(r5)
/* 00004590 6C848000 */ xoris r4, r4, 0x8000
/* 00004594 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 00004598 6C008000 */ xoris r0, r0, 0x8000
/* 0000459C 90810074 */ stw r4, 0x74(r1)
/* 000045A0 3CE04330 */ lis r7, 0x4330
/* 000045A4 9001006C */ stw r0, 0x6c(r1)
/* 000045A8 38610048 */ addi r3, r1, 0x48
/* 000045AC 3CC00000 */ lis r6, lbl_0000FED0@ha
/* 000045B0 90E10070 */ stw r7, 0x70(r1)
/* 000045B4 3CA00000 */ lis r5, lbl_0000FED0@ha
/* 000045B8 7C641B78 */ mr r4, r3
/* 000045BC 90E10068 */ stw r7, 0x68(r1)
/* 000045C0 C8410070 */ lfd f2, 0x70(r1)
/* 000045C4 C8010068 */ lfd f0, 0x68(r1)
/* 000045C8 FC421828 */ fsub f2, f2, f3
/* 000045CC FC000828 */ fsub f0, f0, f1
/* 000045D0 FC2400B2 */ fmul f1, f4, f2
/* 000045D4 FC040032 */ fmul f0, f4, f0
/* 000045D8 FC010028 */ fsub f0, f1, f0
/* 000045DC FC000018 */ frsp f0, f0
/* 000045E0 D0010048 */ stfs f0, 0x48(r1)
/* 000045E4 88120003 */ lbz r0, 3(r18)
/* 000045E8 C8260000 */ lfd f1, lbl_0000FED0@l(r6)
/* 000045EC 7C000774 */ extsb r0, r0
/* 000045F0 C8570140 */ lfd f2, 0x140(r23)
/* 000045F4 6C008000 */ xoris r0, r0, 0x8000
/* 000045F8 90010064 */ stw r0, 0x64(r1)
/* 000045FC 90E10060 */ stw r7, 0x60(r1)
/* 00004600 C8010060 */ lfd f0, 0x60(r1)
/* 00004604 FC000828 */ fsub f0, f0, f1
/* 00004608 FC020032 */ fmul f0, f2, f0
/* 0000460C FC000018 */ frsp f0, f0
/* 00004610 D001004C */ stfs f0, 0x4c(r1)
/* 00004614 88120005 */ lbz r0, 5(r18)
/* 00004618 C8250000 */ lfd f1, lbl_0000FED0@l(r5)
/* 0000461C 7C000774 */ extsb r0, r0
/* 00004620 C8570148 */ lfd f2, 0x148(r23)
/* 00004624 6C008000 */ xoris r0, r0, 0x8000
/* 00004628 9001005C */ stw r0, 0x5c(r1)
/* 0000462C 90E10058 */ stw r7, 0x58(r1)
/* 00004630 C8010058 */ lfd f0, 0x58(r1)
/* 00004634 FC000828 */ fsub f0, f0, f1
/* 00004638 FC020032 */ fmul f0, f2, f0
/* 0000463C FC000018 */ frsp f0, f0
/* 00004640 D0010050 */ stfs f0, 0x50(r1)
/* 00004644 4BFFBB19 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00004648 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000464C C0210048 */ lfs f1, 0x48(r1)
/* 00004650 3A630000 */ addi r19, r3, currentCameraStructPtr@l
/* 00004654 80730000 */ lwz r3, 0(r19)
/* 00004658 C0030000 */ lfs f0, 0(r3)
/* 0000465C EC01002A */ fadds f0, f1, f0
/* 00004660 D0030000 */ stfs f0, 0(r3)
/* 00004664 80730000 */ lwz r3, 0(r19)
/* 00004668 C021004C */ lfs f1, 0x4c(r1)
/* 0000466C C4030004 */ lfsu f0, 4(r3)
/* 00004670 EC01002A */ fadds f0, f1, f0
/* 00004674 D0030000 */ stfs f0, 0(r3)
/* 00004678 80730000 */ lwz r3, 0(r19)
/* 0000467C C0210050 */ lfs f1, 0x50(r1)
/* 00004680 C4030008 */ lfsu f0, 8(r3)
/* 00004684 EC01002A */ fadds f0, f1, f0
/* 00004688 D0030000 */ stfs f0, 0(r3)
/* 0000468C A4120018 */ lhzu r0, 0x18(r18)
/* 00004690 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 00004694 41820054 */ beq lbl_000046E8
/* 00004698 38600003 */ li r3, 3
/* 0000469C 4BFFBAC1 */ bl camera_set_state
/* 000046A0 C0170060 */ lfs f0, 0x60(r23)
/* 000046A4 80730000 */ lwz r3, 0(r19)
/* 000046A8 D0030000 */ stfs f0, 0(r3)
/* 000046AC C01700B8 */ lfs f0, 0xb8(r23)
/* 000046B0 80730000 */ lwz r3, 0(r19)
/* 000046B4 D0030004 */ stfs f0, 4(r3)
/* 000046B8 C0170128 */ lfs f0, 0x128(r23)
/* 000046BC 80730000 */ lwz r3, 0(r19)
/* 000046C0 D0030008 */ stfs f0, 8(r3)
/* 000046C4 C0170060 */ lfs f0, 0x60(r23)
/* 000046C8 80730000 */ lwz r3, 0(r19)
/* 000046CC D003000C */ stfs f0, 0xc(r3)
/* 000046D0 C0170078 */ lfs f0, 0x78(r23)
/* 000046D4 80730000 */ lwz r3, 0(r19)
/* 000046D8 D0030010 */ stfs f0, 0x10(r3)
/* 000046DC C0170060 */ lfs f0, 0x60(r23)
/* 000046E0 80730000 */ lwz r3, 0(r19)
/* 000046E4 D0030014 */ stfs f0, 0x14(r3)
lbl_000046E8:
/* 000046E8 3C600000 */ lis r3, modeCtrl@ha
/* 000046EC 38630000 */ addi r3, r3, modeCtrl@l
/* 000046F0 80030010 */ lwz r0, 0x10(r3)
/* 000046F4 28000007 */ cmplwi r0, 7
/* 000046F8 418108E0 */ bgt lbl_00004FD8
/* 000046FC 3C600000 */ lis r3, lbl_00013158@ha
/* 00004700 38630000 */ addi r3, r3, lbl_00013158@l
/* 00004704 5400103A */ slwi r0, r0, 2
/* 00004708 7C03002E */ lwzx r0, r3, r0
/* 0000470C 7C0903A6 */ mtctr r0
/* 00004710 4E800420 */ bctr 
lbl_00004714:
/* 00004714 A0B50000 */ lhz r5, 0(r21)
/* 00004718 809E0000 */ lwz r4, 0(r30)
/* 0000471C 54A307FF */ clrlwi. r3, r5, 0x1f
/* 00004720 A0040032 */ lhz r0, 0x32(r4)
/* 00004724 7C160378 */ mr r22, r0
/* 00004728 40820028 */ bne lbl_00004750
/* 0000472C 3C600000 */ lis r3, controllerInfo@ha
/* 00004730 A0830000 */ lhz r4, controllerInfo@l(r3)
/* 00004734 548307FF */ clrlwi. r3, r4, 0x1f
/* 00004738 4182006C */ beq lbl_000047A4
/* 0000473C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004740 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00004744 A0630000 */ lhz r3, 0(r3)
/* 00004748 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000474C 41820058 */ beq lbl_000047A4
lbl_00004750:
/* 00004750 3C800000 */ lis r4, lbl_802F20AC@ha
/* 00004754 3C600000 */ lis r3, motDat@ha
/* 00004758 38840000 */ addi r4, r4, lbl_802F20AC@l
/* 0000475C 80A30000 */ lwz r5, motDat@l(r3)
/* 00004760 80840000 */ lwz r4, 0(r4)
lbl_00004764:
/* 00004764 3AD6FFFF */ addi r22, r22, -1  ;# fixed addi
/* 00004768 2C160001 */ cmpwi r22, 1
/* 0000476C 40800008 */ bge lbl_00004774
/* 00004770 7C962378 */ mr r22, r4
lbl_00004774:
/* 00004774 38D6FFFF */ addi r6, r22, -1  ;# fixed addi
/* 00004778 7CC30734 */ extsh r3, r6
/* 0000477C 2C030001 */ cmpwi r3, 1
/* 00004780 40800008 */ bge lbl_00004788
/* 00004784 7C860734 */ extsh r6, r4
lbl_00004788:
/* 00004788 7CC30734 */ extsh r3, r6
/* 0000478C 1C630018 */ mulli r3, r3, 0x18
/* 00004790 38630002 */ addi r3, r3, 2
/* 00004794 7C651A2E */ lhzx r3, r5, r3
/* 00004798 28030000 */ cmplwi r3, 0
/* 0000479C 4082FFC8 */ bne lbl_00004764
/* 000047A0 48000078 */ b lbl_00004818
lbl_000047A4:
/* 000047A4 54A307BD */ rlwinm. r3, r5, 0, 0x1e, 0x1e
/* 000047A8 40820020 */ bne lbl_000047C8
/* 000047AC 548307BD */ rlwinm. r3, r4, 0, 0x1e, 0x1e
/* 000047B0 41820068 */ beq lbl_00004818
/* 000047B4 3C600000 */ lis r3, analogButtonInfo@ha
/* 000047B8 38630000 */ addi r3, r3, analogButtonInfo@l
/* 000047BC A0630000 */ lhz r3, 0(r3)
/* 000047C0 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 000047C4 41820054 */ beq lbl_00004818
lbl_000047C8:
/* 000047C8 3C800000 */ lis r4, lbl_802F20AC@ha
/* 000047CC 3C600000 */ lis r3, motDat@ha
/* 000047D0 38840000 */ addi r4, r4, lbl_802F20AC@l
/* 000047D4 80A30000 */ lwz r5, motDat@l(r3)
/* 000047D8 80840000 */ lwz r4, 0(r4)
lbl_000047DC:
/* 000047DC 3AD60001 */ addi r22, r22, 1
/* 000047E0 7C162000 */ cmpw r22, r4
/* 000047E4 40810008 */ ble lbl_000047EC
/* 000047E8 3AC00001 */ li r22, 1
lbl_000047EC:
/* 000047EC 38D6FFFF */ addi r6, r22, -1  ;# fixed addi
/* 000047F0 7CC30734 */ extsh r3, r6
/* 000047F4 2C030001 */ cmpwi r3, 1
/* 000047F8 40800008 */ bge lbl_00004800
/* 000047FC 7C860734 */ extsh r6, r4
lbl_00004800:
/* 00004800 7CC30734 */ extsh r3, r6
/* 00004804 1C630018 */ mulli r3, r3, 0x18
/* 00004808 38630002 */ addi r3, r3, 2
/* 0000480C 7C651A2E */ lhzx r3, r5, r3
/* 00004810 28030000 */ cmplwi r3, 0
/* 00004814 4082FFC8 */ bne lbl_000047DC
lbl_00004818:
/* 00004818 7C00B000 */ cmpw r0, r22
/* 0000481C 418207BC */ beq lbl_00004FD8
/* 00004820 3AA00000 */ li r21, 0
/* 00004824 56A0103A */ slwi r0, r21, 2
/* 00004828 7E7F0214 */ add r19, r31, r0
/* 0000482C 3C600000 */ lis r3, motLabel@ha
/* 00004830 56D4103A */ slwi r20, r22, 2
/* 00004834 3A230000 */ addi r17, r3, motLabel@l
/* 00004838 3A7300BC */ addi r19, r19, 0xbc
/* 0000483C 480001B4 */ b lbl_000049F0
lbl_00004840:
/* 00004840 80110000 */ lwz r0, 0(r17)
/* 00004844 7FB4002E */ lwzx r29, r20, r0
/* 00004848 7FA3EB78 */ mr r3, r29
/* 0000484C 4BFFB911 */ bl strlen
/* 00004850 3B400000 */ li r26, 0
/* 00004854 5740103A */ slwi r0, r26, 2
/* 00004858 7FD80214 */ add r30, r24, r0
/* 0000485C 3AE30000 */ addi r23, r3, 0
/* 00004860 3BDE2DE4 */ addi r30, r30, 0x2de4
lbl_00004864:
/* 00004864 807E0000 */ lwz r3, 0(r30)
/* 00004868 4BFFB8F5 */ bl strlen
/* 0000486C 3B830000 */ addi r28, r3, 0
/* 00004870 7C7CB850 */ subf r3, r28, r23
/* 00004874 3B630001 */ addi r27, r3, 1
/* 00004878 3B200000 */ li r25, 0
/* 0000487C 48000024 */ b lbl_000048A0
lbl_00004880:
/* 00004880 807E0000 */ lwz r3, 0(r30)
/* 00004884 38BC0000 */ addi r5, r28, 0
/* 00004888 7C9DCA14 */ add r4, r29, r25
/* 0000488C 4BFFB8D1 */ bl strncmp
/* 00004890 2C030000 */ cmpwi r3, 0
/* 00004894 40820008 */ bne lbl_0000489C
/* 00004898 48000024 */ b lbl_000048BC
lbl_0000489C:
/* 0000489C 3B390001 */ addi r25, r25, 1
lbl_000048A0:
/* 000048A0 7C19D800 */ cmpw r25, r27
/* 000048A4 4180FFDC */ blt lbl_00004880
/* 000048A8 3B5A0001 */ addi r26, r26, 1
/* 000048AC 2C1A0004 */ cmpwi r26, 4
/* 000048B0 3BDE0004 */ addi r30, r30, 4
/* 000048B4 4180FFB0 */ blt lbl_00004864
/* 000048B8 3B40FFFF */ li r26, -1
lbl_000048BC:
/* 000048BC 2C1A0002 */ cmpwi r26, 2
/* 000048C0 418200A0 */ beq lbl_00004960
/* 000048C4 40800014 */ bge lbl_000048D8
/* 000048C8 2C1A0000 */ cmpwi r26, 0
/* 000048CC 41820018 */ beq lbl_000048E4
/* 000048D0 40800050 */ bge lbl_00004920
/* 000048D4 48000108 */ b lbl_000049DC
lbl_000048D8:
/* 000048D8 2C1A0004 */ cmpwi r26, 4
/* 000048DC 40800100 */ bge lbl_000049DC
/* 000048E0 480000C0 */ b lbl_000049A0
lbl_000048E4:
/* 000048E4 807F013C */ lwz r3, 0x13c(r31)
/* 000048E8 2C030001 */ cmpwi r3, 1
/* 000048EC 41800020 */ blt lbl_0000490C
/* 000048F0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000048F4 901F013C */ stw r0, 0x13c(r31)
/* 000048F8 801F013C */ lwz r0, 0x13c(r31)
/* 000048FC 5400103A */ slwi r0, r0, 2
/* 00004900 7C7F0214 */ add r3, r31, r0
/* 00004904 806300FC */ lwz r3, 0xfc(r3)
/* 00004908 4BFFB855 */ bl func_8008D29C
lbl_0000490C:
/* 0000490C 38000000 */ li r0, 0
/* 00004910 901F0154 */ stw r0, 0x154(r31)
/* 00004914 901F0158 */ stw r0, 0x158(r31)
/* 00004918 4BFFF47D */ bl lbl_00003D94
/* 0000491C 480000C0 */ b lbl_000049DC
lbl_00004920:
/* 00004920 807F013C */ lwz r3, 0x13c(r31)
/* 00004924 2C030001 */ cmpwi r3, 1
/* 00004928 41800020 */ blt lbl_00004948
/* 0000492C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004930 901F013C */ stw r0, 0x13c(r31)
/* 00004934 801F013C */ lwz r0, 0x13c(r31)
/* 00004938 5400103A */ slwi r0, r0, 2
/* 0000493C 7C7F0214 */ add r3, r31, r0
/* 00004940 806300FC */ lwz r3, 0xfc(r3)
/* 00004944 4BFFB819 */ bl func_8008D29C
lbl_00004948:
/* 00004948 38000002 */ li r0, 2
/* 0000494C 901F0154 */ stw r0, 0x154(r31)
/* 00004950 38000001 */ li r0, 1
/* 00004954 901F0158 */ stw r0, 0x158(r31)
/* 00004958 4BFFF43D */ bl lbl_00003D94
/* 0000495C 48000080 */ b lbl_000049DC
lbl_00004960:
/* 00004960 807F013C */ lwz r3, 0x13c(r31)
/* 00004964 2C030001 */ cmpwi r3, 1
/* 00004968 41800020 */ blt lbl_00004988
/* 0000496C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004970 901F013C */ stw r0, 0x13c(r31)
/* 00004974 801F013C */ lwz r0, 0x13c(r31)
/* 00004978 5400103A */ slwi r0, r0, 2
/* 0000497C 7C7F0214 */ add r3, r31, r0
/* 00004980 806300FC */ lwz r3, 0xfc(r3)
/* 00004984 4BFFB7D9 */ bl func_8008D29C
lbl_00004988:
/* 00004988 38000003 */ li r0, 3
/* 0000498C 901F0154 */ stw r0, 0x154(r31)
/* 00004990 38000002 */ li r0, 2
/* 00004994 901F0158 */ stw r0, 0x158(r31)
/* 00004998 4BFFF3FD */ bl lbl_00003D94
/* 0000499C 48000040 */ b lbl_000049DC
lbl_000049A0:
/* 000049A0 807F013C */ lwz r3, 0x13c(r31)
/* 000049A4 2C030001 */ cmpwi r3, 1
/* 000049A8 41800020 */ blt lbl_000049C8
/* 000049AC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 000049B0 901F013C */ stw r0, 0x13c(r31)
/* 000049B4 801F013C */ lwz r0, 0x13c(r31)
/* 000049B8 5400103A */ slwi r0, r0, 2
/* 000049BC 7C7F0214 */ add r3, r31, r0
/* 000049C0 806300FC */ lwz r3, 0xfc(r3)
/* 000049C4 4BFFB799 */ bl func_8008D29C
lbl_000049C8:
/* 000049C8 38000004 */ li r0, 4
/* 000049CC 901F0154 */ stw r0, 0x154(r31)
/* 000049D0 38000003 */ li r0, 3
/* 000049D4 901F0158 */ stw r0, 0x158(r31)
/* 000049D8 4BFFF3BD */ bl lbl_00003D94
lbl_000049DC:
/* 000049DC 80730000 */ lwz r3, 0(r19)
/* 000049E0 7EC4B378 */ mr r4, r22
/* 000049E4 4BFFB779 */ bl func_8008B9DC
/* 000049E8 3A730004 */ addi r19, r19, 4
/* 000049EC 3AB50001 */ addi r21, r21, 1
lbl_000049F0:
/* 000049F0 801F013C */ lwz r0, 0x13c(r31)
/* 000049F4 7C150000 */ cmpw r21, r0
/* 000049F8 4180FE48 */ blt lbl_00004840
/* 000049FC 480005DC */ b lbl_00004FD8
lbl_00004A00:
/* 00004A00 A0950000 */ lhz r4, 0(r21)
/* 00004A04 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004A08 40820024 */ bne lbl_00004A2C
/* 00004A0C 3C600000 */ lis r3, controllerInfo@ha
/* 00004A10 A0A30000 */ lhz r5, controllerInfo@l(r3)
/* 00004A14 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00004A18 41820064 */ beq lbl_00004A7C
/* 00004A1C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004A20 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00004A24 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004A28 41820054 */ beq lbl_00004A7C
lbl_00004A2C:
/* 00004A2C 807F013C */ lwz r3, 0x13c(r31)
/* 00004A30 809E0000 */ lwz r4, 0(r30)
/* 00004A34 2C030001 */ cmpwi r3, 1
/* 00004A38 A2240032 */ lhz r17, 0x32(r4)
/* 00004A3C 41800020 */ blt lbl_00004A5C
/* 00004A40 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004A44 901F013C */ stw r0, 0x13c(r31)
/* 00004A48 801F013C */ lwz r0, 0x13c(r31)
/* 00004A4C 5400103A */ slwi r0, r0, 2
/* 00004A50 7C7F0214 */ add r3, r31, r0
/* 00004A54 806300FC */ lwz r3, 0xfc(r3)
/* 00004A58 4BFFB705 */ bl func_8008D29C
lbl_00004A5C:
/* 00004A5C 807F0154 */ lwz r3, 0x154(r31)
/* 00004A60 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004A64 901F0154 */ stw r0, 0x154(r31)
/* 00004A68 4BFFF32D */ bl lbl_00003D94
/* 00004A6C 387E0000 */ addi r3, r30, 0
/* 00004A70 38910000 */ addi r4, r17, 0
/* 00004A74 4BFFB6E9 */ bl func_8008B9DC
/* 00004A78 48000560 */ b lbl_00004FD8
lbl_00004A7C:
/* 00004A7C 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00004A80 4082001C */ bne lbl_00004A9C
/* 00004A84 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00004A88 41820550 */ beq lbl_00004FD8
/* 00004A8C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004A90 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00004A94 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004A98 41820540 */ beq lbl_00004FD8
lbl_00004A9C:
/* 00004A9C 807F013C */ lwz r3, 0x13c(r31)
/* 00004AA0 809E0000 */ lwz r4, 0(r30)
/* 00004AA4 2C030001 */ cmpwi r3, 1
/* 00004AA8 A2240032 */ lhz r17, 0x32(r4)
/* 00004AAC 41800020 */ blt lbl_00004ACC
/* 00004AB0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004AB4 901F013C */ stw r0, 0x13c(r31)
/* 00004AB8 801F013C */ lwz r0, 0x13c(r31)
/* 00004ABC 5400103A */ slwi r0, r0, 2
/* 00004AC0 7C7F0214 */ add r3, r31, r0
/* 00004AC4 806300FC */ lwz r3, 0xfc(r3)
/* 00004AC8 4BFFB695 */ bl func_8008D29C
lbl_00004ACC:
/* 00004ACC 807F0154 */ lwz r3, 0x154(r31)
/* 00004AD0 38030001 */ addi r0, r3, 1
/* 00004AD4 901F0154 */ stw r0, 0x154(r31)
/* 00004AD8 4BFFF2BD */ bl lbl_00003D94
/* 00004ADC 387E0000 */ addi r3, r30, 0
/* 00004AE0 38910000 */ addi r4, r17, 0
/* 00004AE4 4BFFB679 */ bl func_8008B9DC
/* 00004AE8 480004F0 */ b lbl_00004FD8
lbl_00004AEC:
/* 00004AEC A0950000 */ lhz r4, 0(r21)
/* 00004AF0 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004AF4 40820024 */ bne lbl_00004B18
/* 00004AF8 3C600000 */ lis r3, controllerInfo@ha
/* 00004AFC A0A30000 */ lhz r5, controllerInfo@l(r3)
/* 00004B00 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00004B04 41820088 */ beq lbl_00004B8C
/* 00004B08 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004B0C A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00004B10 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004B14 41820078 */ beq lbl_00004B8C
lbl_00004B18:
/* 00004B18 807F013C */ lwz r3, 0x13c(r31)
/* 00004B1C 809E0000 */ lwz r4, 0(r30)
/* 00004B20 2C030001 */ cmpwi r3, 1
/* 00004B24 A2240032 */ lhz r17, 0x32(r4)
/* 00004B28 41800020 */ blt lbl_00004B48
/* 00004B2C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004B30 901F013C */ stw r0, 0x13c(r31)
/* 00004B34 801F013C */ lwz r0, 0x13c(r31)
/* 00004B38 5400103A */ slwi r0, r0, 2
/* 00004B3C 7C7F0214 */ add r3, r31, r0
/* 00004B40 806300FC */ lwz r3, 0xfc(r3)
/* 00004B44 4BFFB619 */ bl func_8008D29C
lbl_00004B48:
/* 00004B48 807F0158 */ lwz r3, 0x158(r31)
/* 00004B4C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004B50 901F0158 */ stw r0, 0x158(r31)
/* 00004B54 801F0158 */ lwz r0, 0x158(r31)
/* 00004B58 2C000000 */ cmpwi r0, 0
/* 00004B5C 4080001C */ bge lbl_00004B78
/* 00004B60 3C600000 */ lis r3, motSkeleton@ha
/* 00004B64 38630000 */ addi r3, r3, motSkeleton@l
/* 00004B68 80630000 */ lwz r3, 0(r3)
/* 00004B6C 8063000C */ lwz r3, 0xc(r3)
/* 00004B70 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004B74 901F0158 */ stw r0, 0x158(r31)
lbl_00004B78:
/* 00004B78 4BFFF21D */ bl lbl_00003D94
/* 00004B7C 387E0000 */ addi r3, r30, 0
/* 00004B80 38910000 */ addi r4, r17, 0
/* 00004B84 4BFFB5D9 */ bl func_8008B9DC
/* 00004B88 48000450 */ b lbl_00004FD8
lbl_00004B8C:
/* 00004B8C 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00004B90 4082001C */ bne lbl_00004BAC
/* 00004B94 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00004B98 41820440 */ beq lbl_00004FD8
/* 00004B9C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004BA0 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00004BA4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004BA8 41820430 */ beq lbl_00004FD8
lbl_00004BAC:
/* 00004BAC 807F013C */ lwz r3, 0x13c(r31)
/* 00004BB0 809E0000 */ lwz r4, 0(r30)
/* 00004BB4 2C030001 */ cmpwi r3, 1
/* 00004BB8 A2240032 */ lhz r17, 0x32(r4)
/* 00004BBC 41800020 */ blt lbl_00004BDC
/* 00004BC0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00004BC4 901F013C */ stw r0, 0x13c(r31)
/* 00004BC8 801F013C */ lwz r0, 0x13c(r31)
/* 00004BCC 5400103A */ slwi r0, r0, 2
/* 00004BD0 7C7F0214 */ add r3, r31, r0
/* 00004BD4 806300FC */ lwz r3, 0xfc(r3)
/* 00004BD8 4BFFB585 */ bl func_8008D29C
lbl_00004BDC:
/* 00004BDC 809F0158 */ lwz r4, 0x158(r31)
/* 00004BE0 3C600000 */ lis r3, motSkeleton@ha
/* 00004BE4 38630000 */ addi r3, r3, motSkeleton@l
/* 00004BE8 38040001 */ addi r0, r4, 1
/* 00004BEC 901F0158 */ stw r0, 0x158(r31)
/* 00004BF0 80630000 */ lwz r3, 0(r3)
/* 00004BF4 809F0158 */ lwz r4, 0x158(r31)
/* 00004BF8 8003000C */ lwz r0, 0xc(r3)
/* 00004BFC 7C040040 */ cmplw r4, r0
/* 00004C00 4180000C */ blt lbl_00004C0C
/* 00004C04 38000000 */ li r0, 0
/* 00004C08 901F0158 */ stw r0, 0x158(r31)
lbl_00004C0C:
/* 00004C0C 4BFFF189 */ bl lbl_00003D94
/* 00004C10 387E0000 */ addi r3, r30, 0
/* 00004C14 38910000 */ addi r4, r17, 0
/* 00004C18 4BFFB545 */ bl func_8008B9DC
/* 00004C1C 480003BC */ b lbl_00004FD8
lbl_00004C20:
/* 00004C20 A0950000 */ lhz r4, 0(r21)
/* 00004C24 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004C28 40820024 */ bne lbl_00004C4C
/* 00004C2C 3C600000 */ lis r3, controllerInfo@ha
/* 00004C30 A0A30000 */ lhz r5, controllerInfo@l(r3)
/* 00004C34 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00004C38 41820028 */ beq lbl_00004C60
/* 00004C3C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004C40 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00004C44 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004C48 41820018 */ beq lbl_00004C60
lbl_00004C4C:
/* 00004C4C 809E0090 */ lwz r4, 0x90(r30)
/* 00004C50 387E0000 */ addi r3, r30, 0
/* 00004C54 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00004C58 4BFFB505 */ bl func_8008BF00
/* 00004C5C 4800037C */ b lbl_00004FD8
lbl_00004C60:
/* 00004C60 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00004C64 4082001C */ bne lbl_00004C80
/* 00004C68 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00004C6C 4182036C */ beq lbl_00004FD8
/* 00004C70 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004C74 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00004C78 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004C7C 4182035C */ beq lbl_00004FD8
lbl_00004C80:
/* 00004C80 809E0090 */ lwz r4, 0x90(r30)
/* 00004C84 38840001 */ addi r4, r4, 1
/* 00004C88 28040004 */ cmplwi r4, 4
/* 00004C8C 41800008 */ blt lbl_00004C94
/* 00004C90 38800000 */ li r4, 0
lbl_00004C94:
/* 00004C94 7FC3F378 */ mr r3, r30
/* 00004C98 4BFFB4C5 */ bl func_8008BF00
/* 00004C9C 4800033C */ b lbl_00004FD8
lbl_00004CA0:
/* 00004CA0 A0750000 */ lhz r3, 0(r21)
/* 00004CA4 546007FF */ clrlwi. r0, r3, 0x1f
/* 00004CA8 41820020 */ beq lbl_00004CC8
/* 00004CAC 807E00B4 */ lwz r3, 0xb4(r30)
/* 00004CB0 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 00004CB4 901E00B4 */ stw r0, 0xb4(r30)
/* 00004CB8 40800320 */ bge lbl_00004FD8
/* 00004CBC 38000003 */ li r0, 3
/* 00004CC0 901E00B4 */ stw r0, 0xb4(r30)
/* 00004CC4 48000314 */ b lbl_00004FD8
lbl_00004CC8:
/* 00004CC8 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00004CCC 4182030C */ beq lbl_00004FD8
/* 00004CD0 807E00B4 */ lwz r3, 0xb4(r30)
/* 00004CD4 38030001 */ addi r0, r3, 1
/* 00004CD8 2C000003 */ cmpwi r0, 3
/* 00004CDC 901E00B4 */ stw r0, 0xb4(r30)
/* 00004CE0 408102F8 */ ble lbl_00004FD8
/* 00004CE4 38000000 */ li r0, 0
/* 00004CE8 901E00B4 */ stw r0, 0xb4(r30)
/* 00004CEC 480002EC */ b lbl_00004FD8
lbl_00004CF0:
/* 00004CF0 A0950000 */ lhz r4, 0(r21)
/* 00004CF4 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004CF8 40820024 */ bne lbl_00004D1C
/* 00004CFC 3C600000 */ lis r3, controllerInfo@ha
/* 00004D00 A0A30000 */ lhz r5, controllerInfo@l(r3)
/* 00004D04 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00004D08 41820044 */ beq lbl_00004D4C
/* 00004D0C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004D10 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00004D14 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004D18 41820034 */ beq lbl_00004D4C
lbl_00004D1C:
/* 00004D1C C03F0140 */ lfs f1, 0x140(r31)
/* 00004D20 C81700C0 */ lfd f0, 0xc0(r23)
/* 00004D24 FC010028 */ fsub f0, f1, f0
/* 00004D28 FC000018 */ frsp f0, f0
/* 00004D2C D01F0140 */ stfs f0, 0x140(r31)
/* 00004D30 C03F0140 */ lfs f1, 0x140(r31)
/* 00004D34 C81700C8 */ lfd f0, 0xc8(r23)
/* 00004D38 FC010040 */ fcmpo cr0, f1, f0
/* 00004D3C 4080029C */ bge lbl_00004FD8
/* 00004D40 C0170060 */ lfs f0, 0x60(r23)
/* 00004D44 D01F0140 */ stfs f0, 0x140(r31)
/* 00004D48 48000290 */ b lbl_00004FD8
lbl_00004D4C:
/* 00004D4C 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00004D50 4082001C */ bne lbl_00004D6C
/* 00004D54 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00004D58 41820280 */ beq lbl_00004FD8
/* 00004D5C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00004D60 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 00004D64 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004D68 41820270 */ beq lbl_00004FD8
lbl_00004D6C:
/* 00004D6C C03F0140 */ lfs f1, 0x140(r31)
/* 00004D70 C81700C0 */ lfd f0, 0xc0(r23)
/* 00004D74 FC01002A */ fadd f0, f1, f0
/* 00004D78 FC000018 */ frsp f0, f0
/* 00004D7C D01F0140 */ stfs f0, 0x140(r31)
/* 00004D80 C03F0140 */ lfs f1, 0x140(r31)
/* 00004D84 C8170150 */ lfd f0, 0x150(r23)
/* 00004D88 FC010040 */ fcmpo cr0, f1, f0
/* 00004D8C 4081024C */ ble lbl_00004FD8
/* 00004D90 C0170158 */ lfs f0, 0x158(r23)
/* 00004D94 D01F0140 */ stfs f0, 0x140(r31)
/* 00004D98 48000240 */ b lbl_00004FD8
lbl_00004D9C:
/* 00004D9C A0D50000 */ lhz r6, 0(r21)
/* 00004DA0 807E0000 */ lwz r3, 0(r30)
/* 00004DA4 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00004DA8 A003008C */ lhz r0, 0x8c(r3)
/* 00004DAC 7C040378 */ mr r4, r0
/* 00004DB0 40820028 */ bne lbl_00004DD8
/* 00004DB4 3CA00000 */ lis r5, controllerInfo@ha
/* 00004DB8 A0E50000 */ lhz r7, controllerInfo@l(r5)
/* 00004DBC 54E507FF */ clrlwi. r5, r7, 0x1f
/* 00004DC0 4182006C */ beq lbl_00004E2C
/* 00004DC4 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00004DC8 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00004DCC A0A50000 */ lhz r5, 0(r5)
/* 00004DD0 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00004DD4 41820058 */ beq lbl_00004E2C
lbl_00004DD8:
/* 00004DD8 3CC00000 */ lis r6, lbl_802F20AC@ha
/* 00004DDC 3CA00000 */ lis r5, motDat@ha
/* 00004DE0 38C60000 */ addi r6, r6, lbl_802F20AC@l
/* 00004DE4 80E50000 */ lwz r7, motDat@l(r5)
/* 00004DE8 80C60000 */ lwz r6, 0(r6)
lbl_00004DEC:
/* 00004DEC 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00004DF0 2C040001 */ cmpwi r4, 1
/* 00004DF4 40800008 */ bge lbl_00004DFC
/* 00004DF8 7CC43378 */ mr r4, r6
lbl_00004DFC:
/* 00004DFC 3904FFFF */ addi r8, r4, -1  ;# fixed addi
/* 00004E00 7D050734 */ extsh r5, r8
/* 00004E04 2C050001 */ cmpwi r5, 1
/* 00004E08 40800008 */ bge lbl_00004E10
/* 00004E0C 7CC80734 */ extsh r8, r6
lbl_00004E10:
/* 00004E10 7D050734 */ extsh r5, r8
/* 00004E14 1CA50018 */ mulli r5, r5, 0x18
/* 00004E18 38A50002 */ addi r5, r5, 2
/* 00004E1C 7CA72A2E */ lhzx r5, r7, r5
/* 00004E20 28050003 */ cmplwi r5, 3
/* 00004E24 4082FFC8 */ bne lbl_00004DEC
/* 00004E28 48000078 */ b lbl_00004EA0
lbl_00004E2C:
/* 00004E2C 54C507BD */ rlwinm. r5, r6, 0, 0x1e, 0x1e
/* 00004E30 40820020 */ bne lbl_00004E50
/* 00004E34 54E507BD */ rlwinm. r5, r7, 0, 0x1e, 0x1e
/* 00004E38 41820068 */ beq lbl_00004EA0
/* 00004E3C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00004E40 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00004E44 A0A50000 */ lhz r5, 0(r5)
/* 00004E48 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00004E4C 41820054 */ beq lbl_00004EA0
lbl_00004E50:
/* 00004E50 3CC00000 */ lis r6, lbl_802F20AC@ha
/* 00004E54 3CA00000 */ lis r5, motDat@ha
/* 00004E58 38C60000 */ addi r6, r6, lbl_802F20AC@l
/* 00004E5C 80E50000 */ lwz r7, motDat@l(r5)
/* 00004E60 80C60000 */ lwz r6, 0(r6)
lbl_00004E64:
/* 00004E64 38840001 */ addi r4, r4, 1
/* 00004E68 7C043000 */ cmpw r4, r6
/* 00004E6C 40810008 */ ble lbl_00004E74
/* 00004E70 38800001 */ li r4, 1
lbl_00004E74:
/* 00004E74 3904FFFF */ addi r8, r4, -1  ;# fixed addi
/* 00004E78 7D050734 */ extsh r5, r8
/* 00004E7C 2C050001 */ cmpwi r5, 1
/* 00004E80 40800008 */ bge lbl_00004E88
/* 00004E84 7CC80734 */ extsh r8, r6
lbl_00004E88:
/* 00004E88 7D050734 */ extsh r5, r8
/* 00004E8C 1CA50018 */ mulli r5, r5, 0x18
/* 00004E90 38A50002 */ addi r5, r5, 2
/* 00004E94 7CA72A2E */ lhzx r5, r7, r5
/* 00004E98 28050003 */ cmplwi r5, 3
/* 00004E9C 4082FFC8 */ bne lbl_00004E64
lbl_00004EA0:
/* 00004EA0 7C002000 */ cmpw r0, r4
/* 00004EA4 41820134 */ beq lbl_00004FD8
/* 00004EA8 38630084 */ addi r3, r3, 0x84
/* 00004EAC 5484043E */ clrlwi r4, r4, 0x10
/* 00004EB0 38A00001 */ li r5, 1
/* 00004EB4 4BFFB2A9 */ bl func_80036000
/* 00004EB8 48000120 */ b lbl_00004FD8
lbl_00004EBC:
/* 00004EBC A0D50000 */ lhz r6, 0(r21)
/* 00004EC0 807E0000 */ lwz r3, 0(r30)
/* 00004EC4 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00004EC8 A003411C */ lhz r0, 0x411c(r3)
/* 00004ECC 7C040378 */ mr r4, r0
/* 00004ED0 40820028 */ bne lbl_00004EF8
/* 00004ED4 3CA00000 */ lis r5, controllerInfo@ha
/* 00004ED8 A0E50000 */ lhz r7, controllerInfo@l(r5)
/* 00004EDC 54E507FF */ clrlwi. r5, r7, 0x1f
/* 00004EE0 4182006C */ beq lbl_00004F4C
/* 00004EE4 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00004EE8 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00004EEC A0A50000 */ lhz r5, 0(r5)
/* 00004EF0 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00004EF4 41820058 */ beq lbl_00004F4C
lbl_00004EF8:
/* 00004EF8 3CC00000 */ lis r6, lbl_802F20AC@ha
/* 00004EFC 3CA00000 */ lis r5, motDat@ha
/* 00004F00 38C60000 */ addi r6, r6, lbl_802F20AC@l
/* 00004F04 80E50000 */ lwz r7, motDat@l(r5)
/* 00004F08 80C60000 */ lwz r6, 0(r6)
lbl_00004F0C:
/* 00004F0C 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00004F10 2C040001 */ cmpwi r4, 1
/* 00004F14 40800008 */ bge lbl_00004F1C
/* 00004F18 7CC43378 */ mr r4, r6
lbl_00004F1C:
/* 00004F1C 3904FFFF */ addi r8, r4, -1  ;# fixed addi
/* 00004F20 7D050734 */ extsh r5, r8
/* 00004F24 2C050001 */ cmpwi r5, 1
/* 00004F28 40800008 */ bge lbl_00004F30
/* 00004F2C 7CC80734 */ extsh r8, r6
lbl_00004F30:
/* 00004F30 7D050734 */ extsh r5, r8
/* 00004F34 1CA50018 */ mulli r5, r5, 0x18
/* 00004F38 38A50002 */ addi r5, r5, 2
/* 00004F3C 7CA72A2E */ lhzx r5, r7, r5
/* 00004F40 28050003 */ cmplwi r5, 3
/* 00004F44 4082FFC8 */ bne lbl_00004F0C
/* 00004F48 48000078 */ b lbl_00004FC0
lbl_00004F4C:
/* 00004F4C 54C507BD */ rlwinm. r5, r6, 0, 0x1e, 0x1e
/* 00004F50 40820020 */ bne lbl_00004F70
/* 00004F54 54E507BD */ rlwinm. r5, r7, 0, 0x1e, 0x1e
/* 00004F58 41820068 */ beq lbl_00004FC0
/* 00004F5C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00004F60 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 00004F64 A0A50000 */ lhz r5, 0(r5)
/* 00004F68 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00004F6C 41820054 */ beq lbl_00004FC0
lbl_00004F70:
/* 00004F70 3CC00000 */ lis r6, lbl_802F20AC@ha
/* 00004F74 3CA00000 */ lis r5, motDat@ha
/* 00004F78 38C60000 */ addi r6, r6, lbl_802F20AC@l
/* 00004F7C 80E50000 */ lwz r7, motDat@l(r5)
/* 00004F80 80C60000 */ lwz r6, 0(r6)
lbl_00004F84:
/* 00004F84 38840001 */ addi r4, r4, 1
/* 00004F88 7C043000 */ cmpw r4, r6
/* 00004F8C 40810008 */ ble lbl_00004F94
/* 00004F90 38800001 */ li r4, 1
lbl_00004F94:
/* 00004F94 3904FFFF */ addi r8, r4, -1  ;# fixed addi
/* 00004F98 7D050734 */ extsh r5, r8
/* 00004F9C 2C050001 */ cmpwi r5, 1
/* 00004FA0 40800008 */ bge lbl_00004FA8
/* 00004FA4 7CC80734 */ extsh r8, r6
lbl_00004FA8:
/* 00004FA8 7D050734 */ extsh r5, r8
/* 00004FAC 1CA50018 */ mulli r5, r5, 0x18
/* 00004FB0 38A50002 */ addi r5, r5, 2
/* 00004FB4 7CA72A2E */ lhzx r5, r7, r5
/* 00004FB8 28050003 */ cmplwi r5, 3
/* 00004FBC 4082FFC8 */ bne lbl_00004F84
lbl_00004FC0:
/* 00004FC0 7C002000 */ cmpw r0, r4
/* 00004FC4 41820014 */ beq lbl_00004FD8
/* 00004FC8 38634114 */ addi r3, r3, 0x4114
/* 00004FCC 5484043E */ clrlwi r4, r4, 0x10
/* 00004FD0 38A00001 */ li r5, 1
/* 00004FD4 4BFFB189 */ bl func_80036000
lbl_00004FD8:
/* 00004FD8 A0120000 */ lhz r0, 0(r18)
/* 00004FDC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00004FE0 41820018 */ beq lbl_00004FF8
/* 00004FE4 38000001 */ li r0, 1
/* 00004FE8 901F0150 */ stw r0, 0x150(r31)
/* 00004FEC 807F00FC */ lwz r3, 0xfc(r31)
/* 00004FF0 4BFFB16D */ bl func_8008D29C
/* 00004FF4 4800A94D */ bl lbl_0000F940
lbl_00004FF8:
/* 00004FF8 BA21007C */ lmw r17, 0x7c(r1)
/* 00004FFC 800100BC */ lwz r0, 0xbc(r1)
/* 00005000 382100B8 */ addi r1, r1, 0xb8
/* 00005004 7C0803A6 */ mtlr r0
/* 00005008 4E800020 */ blr 
lbl_0000500C:
/* 0000500C 3C600000 */ lis r3, gameModeRequest@ha
/* 00005010 38830000 */ addi r4, r3, gameModeRequest@l
/* 00005014 38000000 */ li r0, 0
/* 00005018 B0040000 */ sth r0, 0(r4)
/* 0000501C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00005020 3800000F */ li r0, 0xf
/* 00005024 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00005028 4E800020 */ blr 
lbl_0000502C:
/* 0000502C 7C0802A6 */ mflr r0
/* 00005030 3C600000 */ lis r3, stageHeap@ha
/* 00005034 90010004 */ stw r0, 4(r1)
/* 00005038 38630000 */ addi r3, r3, stageHeap@l
/* 0000503C 3C800000 */ lis r4, lbl_10000000@ha
/* 00005040 9421FFF0 */ stwu r1, -0x10(r1)
/* 00005044 93E1000C */ stw r31, 0xc(r1)
/* 00005048 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 0000504C 93C10008 */ stw r30, 8(r1)
/* 00005050 80630000 */ lwz r3, 0(r3)
/* 00005054 4BFFB109 */ bl OSSetCurrentHeap
/* 00005058 7C601B78 */ mr r0, r3
/* 0000505C 807F0160 */ lwz r3, 0x160(r31)
/* 00005060 7C1E0378 */ mr r30, r0
/* 00005064 4BFFB0F9 */ bl free_model
/* 00005068 807F015C */ lwz r3, 0x15c(r31)
/* 0000506C 4BFFB0F1 */ bl free_tpl
/* 00005070 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00005074 809F016C */ lwz r4, 0x16c(r31)
/* 00005078 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000507C 80630000 */ lwz r3, 0(r3)
/* 00005080 4BFFB0DD */ bl OSFreeToHeap
/* 00005084 7FC3F378 */ mr r3, r30
/* 00005088 4BFFB0D5 */ bl OSSetCurrentHeap
/* 0000508C 80010014 */ lwz r0, 0x14(r1)
/* 00005090 83E1000C */ lwz r31, 0xc(r1)
/* 00005094 83C10008 */ lwz r30, 8(r1)
/* 00005098 7C0803A6 */ mtlr r0
/* 0000509C 38210010 */ addi r1, r1, 0x10
/* 000050A0 4E800020 */ blr 
lbl_000050A4:
/* 000050A4 7C0802A6 */ mflr r0
/* 000050A8 3C600000 */ lis r3, stageHeap@ha
/* 000050AC 90010004 */ stw r0, 4(r1)
/* 000050B0 38630000 */ addi r3, r3, stageHeap@l
/* 000050B4 3CA00000 */ lis r5, lbl_0000FE78@ha
/* 000050B8 9421FFE8 */ stwu r1, -0x18(r1)
/* 000050BC 3C800000 */ lis r4, lbl_10000000@ha
/* 000050C0 93E10014 */ stw r31, 0x14(r1)
/* 000050C4 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 000050C8 93C10010 */ stw r30, 0x10(r1)
/* 000050CC 3BC50000 */ addi r30, r5, lbl_0000FE78@l
/* 000050D0 93A1000C */ stw r29, 0xc(r1)
/* 000050D4 80630000 */ lwz r3, 0(r3)
/* 000050D8 4BFFB085 */ bl OSSetCurrentHeap
/* 000050DC 3C800000 */ lis r4, lbl_0001323C@ha
/* 000050E0 38040000 */ addi r0, r4, lbl_0001323C@l
/* 000050E4 3BA30000 */ addi r29, r3, 0
/* 000050E8 7C030378 */ mr r3, r0
/* 000050EC 4BFFB071 */ bl load_tpl
/* 000050F0 907F015C */ stw r3, 0x15c(r31)
/* 000050F4 3C600000 */ lis r3, lbl_0001324C@ha
/* 000050F8 38630000 */ addi r3, r3, lbl_0001324C@l
/* 000050FC 809F015C */ lwz r4, 0x15c(r31)
/* 00005100 4BFFB05D */ bl load_model
/* 00005104 907F0160 */ stw r3, 0x160(r31)
/* 00005108 807F0160 */ lwz r3, 0x160(r31)
/* 0000510C 4BFFB051 */ bl func_8008E64C
/* 00005110 907F0168 */ stw r3, 0x168(r31)
/* 00005114 807F0160 */ lwz r3, 0x160(r31)
/* 00005118 4BFFB045 */ bl func_8008E5F8
/* 0000511C 907F0164 */ stw r3, 0x164(r31)
/* 00005120 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00005124 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00005128 809F0168 */ lwz r4, 0x168(r31)
/* 0000512C 80630000 */ lwz r3, 0(r3)
/* 00005130 80040000 */ lwz r0, 0(r4)
/* 00005134 1C80000C */ mulli r4, r0, 0xc
/* 00005138 3804001F */ addi r0, r4, 0x1f
/* 0000513C 54040034 */ rlwinm r4, r0, 0, 0, 0x1a
/* 00005140 4BFFB01D */ bl OSAllocFromHeap
/* 00005144 907F016C */ stw r3, 0x16c(r31)
/* 00005148 3860000F */ li r3, 0xf
/* 0000514C 4BFFB011 */ bl event_start
/* 00005150 38600002 */ li r3, 2
/* 00005154 4BFFB009 */ bl camera_set_state
/* 00005158 3CA00000 */ lis r5, lbl_0000502C@ha
/* 0000515C 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 00005160 38050000 */ addi r0, r5, lbl_0000502C@l
/* 00005164 90040000 */ stw r0, lbl_802F1B7C@l(r4)
/* 00005168 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000516C 3800007B */ li r0, 0x7b
/* 00005170 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00005174 C03E012C */ lfs f1, 0x12c(r30)
/* 00005178 FC400890 */ fmr f2, f1
/* 0000517C FC600890 */ fmr f3, f1
/* 00005180 4BFFAFDD */ bl g_avdisp_set_3_floats
/* 00005184 38000000 */ li r0, 0
/* 00005188 901F0170 */ stw r0, 0x170(r31)
/* 0000518C 7FA3EB78 */ mr r3, r29
/* 00005190 901F0174 */ stw r0, 0x174(r31)
/* 00005194 901F0178 */ stw r0, 0x178(r31)
/* 00005198 901F017C */ stw r0, 0x17c(r31)
/* 0000519C 901F0180 */ stw r0, 0x180(r31)
/* 000051A0 901F0184 */ stw r0, 0x184(r31)
/* 000051A4 4BFFAFB9 */ bl OSSetCurrentHeap
/* 000051A8 8001001C */ lwz r0, 0x1c(r1)
/* 000051AC 83E10014 */ lwz r31, 0x14(r1)
/* 000051B0 83C10010 */ lwz r30, 0x10(r1)
/* 000051B4 7C0803A6 */ mtlr r0
/* 000051B8 83A1000C */ lwz r29, 0xc(r1)
/* 000051BC 38210018 */ addi r1, r1, 0x18
/* 000051C0 4E800020 */ blr 
lbl_000051C4:
/* 000051C4 7C0802A6 */ mflr r0
/* 000051C8 3C800000 */ lis r4, lbl_10000000@ha
/* 000051CC 90010004 */ stw r0, 4(r1)
/* 000051D0 3C600000 */ lis r3, lbl_000102B0@ha
/* 000051D4 9421FFE0 */ stwu r1, -0x20(r1)
/* 000051D8 BF61000C */ stmw r27, 0xc(r1)
/* 000051DC 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 000051E0 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 000051E4 38600002 */ li r3, 2
/* 000051E8 38800002 */ li r4, 2
/* 000051EC 4BFFAF71 */ bl g_debug_set_cursor_pos
/* 000051F0 387F2FA8 */ addi r3, r31, 0x2fa8
/* 000051F4 4CC63182 */ crclr 6
/* 000051F8 4BFFAF65 */ bl g_debug_printf
/* 000051FC 38600004 */ li r3, 4
/* 00005200 38800005 */ li r4, 5
/* 00005204 4BFFAF59 */ bl g_debug_set_cursor_pos
/* 00005208 3C600000 */ lis r3, controllerInfo@ha
/* 0000520C 38630000 */ addi r3, r3, controllerInfo@l
/* 00005210 A0830030 */ lhz r4, 0x30(r3)
/* 00005214 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00005218 41820010 */ beq lbl_00005228
/* 0000521C 807E0170 */ lwz r3, 0x170(r30)
/* 00005220 38030004 */ addi r0, r3, 4
/* 00005224 901E0170 */ stw r0, 0x170(r30)
lbl_00005228:
/* 00005228 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 0000522C 41820010 */ beq lbl_0000523C
/* 00005230 807E0170 */ lwz r3, 0x170(r30)
/* 00005234 38030001 */ addi r0, r3, 1
/* 00005238 901E0170 */ stw r0, 0x170(r30)
lbl_0000523C:
/* 0000523C 3C606666 */ lis r3, 0x6666
/* 00005240 809E0170 */ lwz r4, 0x170(r30)
/* 00005244 38036667 */ addi r0, r3, 0x6667
/* 00005248 7C002096 */ mulhw r0, r0, r4
/* 0000524C 7C000E70 */ srawi r0, r0, 1
/* 00005250 54030FFE */ srwi r3, r0, 0x1f
/* 00005254 7C001A14 */ add r0, r0, r3
/* 00005258 1C000005 */ mulli r0, r0, 5
/* 0000525C 7C002050 */ subf r0, r0, r4
/* 00005260 3C600000 */ lis r3, controllerInfo@ha
/* 00005264 901E0170 */ stw r0, 0x170(r30)
/* 00005268 38630000 */ addi r3, r3, controllerInfo@l
/* 0000526C A0030018 */ lhz r0, 0x18(r3)
/* 00005270 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00005274 41820084 */ beq lbl_000052F8
/* 00005278 809E0170 */ lwz r4, 0x170(r30)
/* 0000527C 5480103A */ slwi r0, r4, 2
/* 00005280 7C7E0214 */ add r3, r30, r0
/* 00005284 80030174 */ lwz r0, 0x174(r3)
/* 00005288 2C040002 */ cmpwi r4, 2
/* 0000528C 68000001 */ xori r0, r0, 1
/* 00005290 90030174 */ stw r0, 0x174(r3)
/* 00005294 41820038 */ beq lbl_000052CC
/* 00005298 40800014 */ bge lbl_000052AC
/* 0000529C 2C040000 */ cmpwi r4, 0
/* 000052A0 41820058 */ beq lbl_000052F8
/* 000052A4 40800018 */ bge lbl_000052BC
/* 000052A8 48000050 */ b lbl_000052F8
lbl_000052AC:
/* 000052AC 2C040004 */ cmpwi r4, 4
/* 000052B0 4182003C */ beq lbl_000052EC
/* 000052B4 40800044 */ bge lbl_000052F8
/* 000052B8 48000024 */ b lbl_000052DC
lbl_000052BC:
/* 000052BC 807E0160 */ lwz r3, 0x160(r30)
/* 000052C0 38800008 */ li r4, 8
/* 000052C4 4BFFAE99 */ bl set_mesh_render_flags_in_model
/* 000052C8 48000030 */ b lbl_000052F8
lbl_000052CC:
/* 000052CC 807E0160 */ lwz r3, 0x160(r30)
/* 000052D0 38800001 */ li r4, 1
/* 000052D4 4BFFAE89 */ bl set_mesh_render_flags_in_model
/* 000052D8 48000020 */ b lbl_000052F8
lbl_000052DC:
/* 000052DC 807E0160 */ lwz r3, 0x160(r30)
/* 000052E0 38800002 */ li r4, 2
/* 000052E4 4BFFAE79 */ bl set_mesh_render_flags_in_model
/* 000052E8 48000010 */ b lbl_000052F8
lbl_000052EC:
/* 000052EC 807E0160 */ lwz r3, 0x160(r30)
/* 000052F0 38800004 */ li r4, 4
/* 000052F4 4BFFAE69 */ bl set_mesh_render_flags_in_model
lbl_000052F8:
/* 000052F8 3B600000 */ li r27, 0
/* 000052FC 5760103A */ slwi r0, r27, 2
/* 00005300 7FBE0214 */ add r29, r30, r0
/* 00005304 577C083C */ slwi r28, r27, 1
/* 00005308 3BBD0174 */ addi r29, r29, 0x174
lbl_0000530C:
/* 0000530C 801E0170 */ lwz r0, 0x170(r30)
/* 00005310 7C1B0000 */ cmpw r27, r0
/* 00005314 40820018 */ bne lbl_0000532C
/* 00005318 38600002 */ li r3, 2
/* 0000531C 4BFFAE41 */ bl g_debug_set_text_color
/* 00005320 387F2FC0 */ addi r3, r31, 0x2fc0
/* 00005324 4BFFAE39 */ bl g_debug_print
/* 00005328 48000014 */ b lbl_0000533C
lbl_0000532C:
/* 0000532C 38600000 */ li r3, 0
/* 00005330 4BFFAE2D */ bl g_debug_set_text_color
/* 00005334 387F2FC4 */ addi r3, r31, 0x2fc4
/* 00005338 4BFFAE25 */ bl g_debug_print
lbl_0000533C:
/* 0000533C 801D0000 */ lwz r0, 0(r29)
/* 00005340 7C1C0214 */ add r0, r28, r0
/* 00005344 5400103A */ slwi r0, r0, 2
/* 00005348 7C7F0214 */ add r3, r31, r0
/* 0000534C 80632F64 */ lwz r3, 0x2f64(r3)
/* 00005350 4BFFAE0D */ bl g_debug_print
/* 00005354 387F0140 */ addi r3, r31, 0x140
/* 00005358 4BFFAE05 */ bl g_debug_print
/* 0000535C 3B7B0001 */ addi r27, r27, 1
/* 00005360 281B0005 */ cmplwi r27, 5
/* 00005364 3BBD0004 */ addi r29, r29, 4
/* 00005368 3B9C0002 */ addi r28, r28, 2
/* 0000536C 4180FFA0 */ blt lbl_0000530C
/* 00005370 BB61000C */ lmw r27, 0xc(r1)
/* 00005374 80010024 */ lwz r0, 0x24(r1)
/* 00005378 38210020 */ addi r1, r1, 0x20
/* 0000537C 7C0803A6 */ mtlr r0
/* 00005380 4E800020 */ blr 
lbl_00005384:
/* 00005384 7C0802A6 */ mflr r0
/* 00005388 3C800000 */ lis r4, lbl_0000FE78@ha
/* 0000538C 90010004 */ stw r0, 4(r1)
/* 00005390 3C600000 */ lis r3, lbl_10000000@ha
/* 00005394 9421FFD0 */ stwu r1, -0x30(r1)
/* 00005398 DBE10028 */ stfd f31, 0x28(r1)
/* 0000539C BF21000C */ stmw r25, 0xc(r1)
/* 000053A0 3BA40000 */ addi r29, r4, lbl_0000FE78@l
/* 000053A4 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000053A8 4BFFADB5 */ bl mathutil_mtxA_from_mtxB
/* 000053AC 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 000053B0 38630000 */ addi r3, r3, currentCameraStructPtr@l
/* 000053B4 80630000 */ lwz r3, 0(r3)
/* 000053B8 3863000C */ addi r3, r3, 0xc
/* 000053BC 4BFFADA1 */ bl mathutil_mtxA_translate
/* 000053C0 3C600000 */ lis r3, mathutilData@ha
/* 000053C4 3B230000 */ addi r25, r3, mathutilData@l
/* 000053C8 80790000 */ lwz r3, 0(r25)
/* 000053CC 38800000 */ li r4, 0
/* 000053D0 4BFFAD8D */ bl g_gxutil_upload_some_mtx
/* 000053D4 C03D0078 */ lfs f1, 0x78(r29)
/* 000053D8 4BFFAD85 */ bl mathutil_mtxA_scale_s
/* 000053DC 480002E1 */ bl lbl_000056BC
/* 000053E0 4BFFAD7D */ bl mathutil_mtxA_from_mtxB
/* 000053E4 C03D0060 */ lfs f1, 0x60(r29)
/* 000053E8 C05D006C */ lfs f2, 0x6c(r29)
/* 000053EC C07D0088 */ lfs f3, 0x88(r29)
/* 000053F0 4BFFAD6D */ bl mathutil_mtxA_translate_xyz
/* 000053F4 3860C000 */ li r3, -16384
/* 000053F8 4BFFAD65 */ bl mathutil_mtxA_rotate_x
/* 000053FC 3860C000 */ li r3, -16384
/* 00005400 4BFFAD5D */ bl mathutil_mtxA_rotate_z
/* 00005404 80790000 */ lwz r3, 0(r25)
/* 00005408 38800000 */ li r4, 0
/* 0000540C 4BFFAD51 */ bl g_gxutil_upload_some_mtx
/* 00005410 3B800000 */ li r28, 0
/* 00005414 3C600000 */ lis r3, globalFrameCounter@ha
/* 00005418 3C805555 */ lis r4, 0x5555
/* 0000541C 3B7C0000 */ addi r27, r28, 0
/* 00005420 3B230000 */ addi r25, r3, globalFrameCounter@l
/* 00005424 3BE45556 */ addi r31, r4, 0x5556
/* 00005428 3B400000 */ li r26, 0
/* 0000542C 4800010C */ b lbl_00005538
lbl_00005430:
/* 00005430 7C7FD096 */ mulhw r3, r31, r26
/* 00005434 801E0164 */ lwz r0, 0x164(r30)
/* 00005438 80DE016C */ lwz r6, 0x16c(r30)
/* 0000543C 7CA0E214 */ add r5, r0, r28
/* 00005440 54600FFE */ srwi r0, r3, 0x1f
/* 00005444 80850000 */ lwz r4, 0(r5)
/* 00005448 7C030214 */ add r0, r3, r0
/* 0000544C 80650004 */ lwz r3, 4(r5)
/* 00005450 7CC6DA14 */ add r6, r6, r27
/* 00005454 90860000 */ stw r4, 0(r6)
/* 00005458 1C000003 */ mulli r0, r0, 3
/* 0000545C 90660004 */ stw r3, 4(r6)
/* 00005460 7C00D050 */ subf r0, r0, r26
/* 00005464 80650008 */ lwz r3, 8(r5)
/* 00005468 2C000001 */ cmpwi r0, 1
/* 0000546C 90660008 */ stw r3, 8(r6)
/* 00005470 4182003C */ beq lbl_000054AC
/* 00005474 40800010 */ bge lbl_00005484
/* 00005478 2C000000 */ cmpwi r0, 0
/* 0000547C 40800014 */ bge lbl_00005490
/* 00005480 48000058 */ b lbl_000054D8
lbl_00005484:
/* 00005484 2C000003 */ cmpwi r0, 3
/* 00005488 40800050 */ bge lbl_000054D8
/* 0000548C 48000038 */ b lbl_000054C4
lbl_00005490:
/* 00005490 80190000 */ lwz r0, 0(r25)
/* 00005494 5403482C */ slwi r3, r0, 9
/* 00005498 4BFFACC5 */ bl mathutil_sin
/* 0000549C C81D0160 */ lfd f0, 0x160(r29)
/* 000054A0 FFE00072 */ fmul f31, f0, f1
/* 000054A4 FFE0F818 */ frsp f31, f31
/* 000054A8 48000030 */ b lbl_000054D8
lbl_000054AC:
/* 000054AC 80190000 */ lwz r0, 0(r25)
/* 000054B0 5403402E */ slwi r3, r0, 8
/* 000054B4 4BFFACA9 */ bl mathutil_sin
/* 000054B8 C01D0168 */ lfs f0, 0x168(r29)
/* 000054BC EFE00072 */ fmuls f31, f0, f1
/* 000054C0 48000018 */ b lbl_000054D8
lbl_000054C4:
/* 000054C4 80190000 */ lwz r0, 0(r25)
/* 000054C8 5403502A */ slwi r3, r0, 0xa
/* 000054CC 4BFFAC91 */ bl mathutil_sin
/* 000054D0 C01D016C */ lfs f0, 0x16c(r29)
/* 000054D4 EFE00072 */ fmuls f31, f0, f1
lbl_000054D8:
/* 000054D8 801E0164 */ lwz r0, 0x164(r30)
/* 000054DC 3B7B000C */ addi r27, r27, 0xc
/* 000054E0 3B5A0001 */ addi r26, r26, 1
/* 000054E4 7C60E214 */ add r3, r0, r28
/* 000054E8 C003000C */ lfs f0, 0xc(r3)
/* 000054EC C0230000 */ lfs f1, 0(r3)
/* 000054F0 EC1F0032 */ fmuls f0, f31, f0
/* 000054F4 EC01002A */ fadds f0, f1, f0
/* 000054F8 D0030000 */ stfs f0, 0(r3)
/* 000054FC 801E0164 */ lwz r0, 0x164(r30)
/* 00005500 7C60E214 */ add r3, r0, r28
/* 00005504 C0030010 */ lfs f0, 0x10(r3)
/* 00005508 C0230004 */ lfs f1, 4(r3)
/* 0000550C EC1F0032 */ fmuls f0, f31, f0
/* 00005510 EC01002A */ fadds f0, f1, f0
/* 00005514 D0030004 */ stfs f0, 4(r3)
/* 00005518 801E0164 */ lwz r0, 0x164(r30)
/* 0000551C 7C60E214 */ add r3, r0, r28
/* 00005520 C0030014 */ lfs f0, 0x14(r3)
/* 00005524 3B9C0040 */ addi r28, r28, 0x40
/* 00005528 C0230008 */ lfs f1, 8(r3)
/* 0000552C EC1F0032 */ fmuls f0, f31, f0
/* 00005530 EC01002A */ fadds f0, f1, f0
/* 00005534 D0030008 */ stfs f0, 8(r3)
lbl_00005538:
/* 00005538 807E0168 */ lwz r3, 0x168(r30)
/* 0000553C 80030000 */ lwz r0, 0(r3)
/* 00005540 7C1A0040 */ cmplw r26, r0
/* 00005544 4180FEEC */ blt lbl_00005430
/* 00005548 C03D0170 */ lfs f1, 0x170(r29)
/* 0000554C 38600002 */ li r3, 2
/* 00005550 C05D0174 */ lfs f2, 0x174(r29)
/* 00005554 4BFFAC09 */ bl func_8008F880
/* 00005558 38600000 */ li r3, 0
/* 0000555C 38800059 */ li r4, 0x59
/* 00005560 38A00069 */ li r5, 0x69
/* 00005564 4BFFABF9 */ bl func_8008F890
/* 00005568 38600001 */ li r3, 1
/* 0000556C 4BFFABF1 */ bl func_8009AC0C
/* 00005570 807E0160 */ lwz r3, 0x160(r30)
/* 00005574 4BFFABE9 */ bl g_avdisp_draw_model_1
/* 00005578 4BFFABE5 */ bl func_8009AC44
/* 0000557C 39000000 */ li r8, 0
/* 00005580 38C80000 */ addi r6, r8, 0
/* 00005584 38E80000 */ addi r7, r8, 0
/* 00005588 48000038 */ b lbl_000055C0
lbl_0000558C:
/* 0000558C 807E016C */ lwz r3, 0x16c(r30)
/* 00005590 39080001 */ addi r8, r8, 1
/* 00005594 801E0164 */ lwz r0, 0x164(r30)
/* 00005598 7C833214 */ add r4, r3, r6
/* 0000559C 7CA03A14 */ add r5, r0, r7
/* 000055A0 80640000 */ lwz r3, 0(r4)
/* 000055A4 80040004 */ lwz r0, 4(r4)
/* 000055A8 38C6000C */ addi r6, r6, 0xc
/* 000055AC 38E70040 */ addi r7, r7, 0x40
/* 000055B0 90650000 */ stw r3, 0(r5)
/* 000055B4 90050004 */ stw r0, 4(r5)
/* 000055B8 80040008 */ lwz r0, 8(r4)
/* 000055BC 90050008 */ stw r0, 8(r5)
lbl_000055C0:
/* 000055C0 807E0168 */ lwz r3, 0x168(r30)
/* 000055C4 80030000 */ lwz r0, 0(r3)
/* 000055C8 7C080040 */ cmplw r8, r0
/* 000055CC 4180FFC0 */ blt lbl_0000558C
/* 000055D0 BB21000C */ lmw r25, 0xc(r1)
/* 000055D4 80010034 */ lwz r0, 0x34(r1)
/* 000055D8 CBE10028 */ lfd f31, 0x28(r1)
/* 000055DC 38210030 */ addi r1, r1, 0x30
/* 000055E0 7C0803A6 */ mtlr r0
/* 000055E4 4E800020 */ blr 
lbl_000055E8:
/* 000055E8 7C0802A6 */ mflr r0
/* 000055EC 3C800000 */ lis r4, stageHeap@ha
/* 000055F0 90010004 */ stw r0, 4(r1)
/* 000055F4 9421FF60 */ stwu r1, -0xa0(r1)
/* 000055F8 93E1009C */ stw r31, 0x9c(r1)
/* 000055FC 93C10098 */ stw r30, 0x98(r1)
/* 00005600 93A10094 */ stw r29, 0x94(r1)
/* 00005604 3BA30000 */ addi r29, r3, 0
/* 00005608 80640000 */ lwz r3, stageHeap@l(r4)
/* 0000560C 3C800000 */ lis r4, lbl_10000000@ha
/* 00005610 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00005614 4BFFAB49 */ bl OSSetCurrentHeap
/* 00005618 3C800000 */ lis r4, lbl_000138AC@ha
/* 0000561C 80BD0000 */ lwz r5, 0(r29)
/* 00005620 3BC30000 */ addi r30, r3, 0
/* 00005624 80DD0004 */ lwz r6, 4(r29)
/* 00005628 38840000 */ addi r4, r4, lbl_000138AC@l
/* 0000562C 4CC63182 */ crclr 6
/* 00005630 3861000C */ addi r3, r1, 0xc
/* 00005634 4BFFAB29 */ bl sprintf
/* 00005638 3861000C */ addi r3, r1, 0xc
/* 0000563C 4BFFAB21 */ bl load_tpl
/* 00005640 907F018C */ stw r3, 0x18c(r31)
/* 00005644 801F018C */ lwz r0, 0x18c(r31)
/* 00005648 28000000 */ cmplwi r0, 0
/* 0000564C 4182004C */ beq lbl_00005698
/* 00005650 3C600000 */ lis r3, lbl_000138B8@ha
/* 00005654 80BD0000 */ lwz r5, 0(r29)
/* 00005658 38830000 */ addi r4, r3, lbl_000138B8@l
/* 0000565C 80DD0004 */ lwz r6, 4(r29)
/* 00005660 4CC63182 */ crclr 6
/* 00005664 3861000C */ addi r3, r1, 0xc
/* 00005668 4BFFAAF5 */ bl sprintf
/* 0000566C 3861000C */ addi r3, r1, 0xc
/* 00005670 809F018C */ lwz r4, 0x18c(r31)
/* 00005674 4BFFAAE9 */ bl load_gma
/* 00005678 907F0190 */ stw r3, 0x190(r31)
/* 0000567C 801F0190 */ lwz r0, 0x190(r31)
/* 00005680 28000000 */ cmplwi r0, 0
/* 00005684 40820014 */ bne lbl_00005698
/* 00005688 807F018C */ lwz r3, 0x18c(r31)
/* 0000568C 4BFFAAD1 */ bl free_tpl
/* 00005690 38000000 */ li r0, 0
/* 00005694 901F018C */ stw r0, 0x18c(r31)
lbl_00005698:
/* 00005698 7FC3F378 */ mr r3, r30
/* 0000569C 4BFFAAC1 */ bl OSSetCurrentHeap
/* 000056A0 800100A4 */ lwz r0, 0xa4(r1)
/* 000056A4 83E1009C */ lwz r31, 0x9c(r1)
/* 000056A8 83C10098 */ lwz r30, 0x98(r1)
/* 000056AC 7C0803A6 */ mtlr r0
/* 000056B0 83A10094 */ lwz r29, 0x94(r1)
/* 000056B4 382100A0 */ addi r1, r1, 0xa0
/* 000056B8 4E800020 */ blr 
lbl_000056BC:
/* 000056BC 7C0802A6 */ mflr r0
/* 000056C0 3C600000 */ lis r3, lbl_0000FE78@ha
/* 000056C4 90010004 */ stw r0, 4(r1)
/* 000056C8 9421FFE0 */ stwu r1, -0x20(r1)
/* 000056CC 93E1001C */ stw r31, 0x1c(r1)
/* 000056D0 3BE30000 */ addi r31, r3, lbl_0000FE78@l
/* 000056D4 3881000C */ addi r4, r1, 0xc
/* 000056D8 801F0180 */ lwz r0, 0x180(r31)
/* 000056DC 38600000 */ li r3, 0
/* 000056E0 90010010 */ stw r0, 0x10(r1)
/* 000056E4 801F017C */ lwz r0, 0x17c(r31)
/* 000056E8 9001000C */ stw r0, 0xc(r1)
/* 000056EC 4BFFAA71 */ bl GXSetChanMatColor
/* 000056F0 80010010 */ lwz r0, 0x10(r1)
/* 000056F4 38810008 */ addi r4, r1, 8
/* 000056F8 38600000 */ li r3, 0
/* 000056FC 90010008 */ stw r0, 8(r1)
/* 00005700 4BFFAA5D */ bl GXSetChanAmbColor
/* 00005704 38600004 */ li r3, 4
/* 00005708 38800000 */ li r4, 0
/* 0000570C 38A00000 */ li r5, 0
/* 00005710 38C00000 */ li r6, 0
/* 00005714 38E00000 */ li r7, 0
/* 00005718 39000000 */ li r8, 0
/* 0000571C 39200002 */ li r9, 2
/* 00005720 4BFFAA3D */ bl GXSetChanCtrl
/* 00005724 38600001 */ li r3, 1
/* 00005728 4BFFAA35 */ bl GXSetNumChans
/* 0000572C 38600000 */ li r3, 0
/* 00005730 388000FF */ li r4, 0xff
/* 00005734 38A000FF */ li r5, 0xff
/* 00005738 38C00004 */ li r6, 4
/* 0000573C 4BFFAA21 */ bl func_8009EFF4
/* 00005740 38600000 */ li r3, 0
/* 00005744 38800004 */ li r4, 4
/* 00005748 4BFFAA15 */ bl func_8009EA30
/* 0000574C 38600000 */ li r3, 0
/* 00005750 4BFFAA0D */ bl GXSetNumTexGens
/* 00005754 38600001 */ li r3, 1
/* 00005758 4BFFAA05 */ bl func_8009F2C8
/* 0000575C 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00005760 38630000 */ addi r3, r3, currentCameraStructPtr@l
/* 00005764 80630000 */ lwz r3, 0(r3)
/* 00005768 3863000C */ addi r3, r3, 0xc
/* 0000576C 4BFFA9F1 */ bl mathutil_mtxA_from_mtxB_translate
/* 00005770 C03F0184 */ lfs f1, 0x184(r31)
/* 00005774 4BFFA9E9 */ bl mathutil_mtxA_scale_s
/* 00005778 3C600000 */ lis r3, mathutilData@ha
/* 0000577C 3BE30000 */ addi r31, r3, mathutilData@l
/* 00005780 807F0000 */ lwz r3, 0(r31)
/* 00005784 38800000 */ li r4, 0
/* 00005788 4BFFA9D5 */ bl GXLoadNrmMtxImm
/* 0000578C 807F0000 */ lwz r3, 0(r31)
/* 00005790 38800000 */ li r4, 0
/* 00005794 4BFFA9C9 */ bl GXLoadPosMtxImm
/* 00005798 38600000 */ li r3, 0
/* 0000579C 4BFFA9C1 */ bl GXSetCurrentMtx
/* 000057A0 38600008 */ li r3, 8
/* 000057A4 38800008 */ li r4, 8
/* 000057A8 4BFFA9B5 */ bl GXDrawSphere
/* 000057AC 80010024 */ lwz r0, 0x24(r1)
/* 000057B0 83E1001C */ lwz r31, 0x1c(r1)
/* 000057B4 38210020 */ addi r1, r1, 0x20
/* 000057B8 7C0803A6 */ mtlr r0
/* 000057BC 4E800020 */ blr 
lbl_000057C0:
/* 000057C0 7C0802A6 */ mflr r0
/* 000057C4 3C600000 */ lis r3, lbl_10000000@ha
/* 000057C8 90010004 */ stw r0, 4(r1)
/* 000057CC 9421FFC0 */ stwu r1, -0x40(r1)
/* 000057D0 BF61002C */ stmw r27, 0x2c(r1)
/* 000057D4 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000057D8 3C600000 */ lis r3, lbl_000102B0@ha
/* 000057DC 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 000057E0 A81E0D44 */ lha r0, 0xd44(r30)
/* 000057E4 7C030735 */ extsh. r3, r0
/* 000057E8 408200F8 */ bne lbl_000058E0
/* 000057EC 3C600000 */ lis r3, controllerInfo@ha
/* 000057F0 38A30000 */ addi r5, r3, controllerInfo@l
/* 000057F4 A0C50030 */ lhz r6, 0x30(r5)
/* 000057F8 54C30739 */ rlwinm. r3, r6, 0, 0x1c, 0x1c
/* 000057FC 40820044 */ bne lbl_00005840
/* 00005800 3C600000 */ lis r3, analogButtonInfo@ha
/* 00005804 38830000 */ addi r4, r3, analogButtonInfo@l
/* 00005808 A0640008 */ lhz r3, 8(r4)
/* 0000580C 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00005810 40820030 */ bne lbl_00005840
/* 00005814 A0650000 */ lhz r3, 0(r5)
/* 00005818 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000581C 40820010 */ bne lbl_0000582C
/* 00005820 A0640000 */ lhz r3, 0(r4)
/* 00005824 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00005828 41820040 */ beq lbl_00005868
lbl_0000582C:
/* 0000582C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00005830 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00005834 A0630000 */ lhz r3, 0(r3)
/* 00005838 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000583C 4182002C */ beq lbl_00005868
lbl_00005840:
/* 00005840 5403083C */ slwi r3, r0, 1
/* 00005844 7C9E1A14 */ add r4, r30, r3
/* 00005848 A8640D48 */ lha r3, 0xd48(r4)
/* 0000584C 3863FFFF */ addi r3, r3, -1  ;# fixed addi
/* 00005850 B0640D48 */ sth r3, 0xd48(r4)
/* 00005854 AC640D48 */ lhau r3, 0xd48(r4)
/* 00005858 2C030000 */ cmpwi r3, 0
/* 0000585C 4080000C */ bge lbl_00005868
/* 00005860 38600005 */ li r3, 5
/* 00005864 B0640000 */ sth r3, 0(r4)
lbl_00005868:
/* 00005868 54C3077B */ rlwinm. r3, r6, 0, 0x1d, 0x1d
/* 0000586C 4082004C */ bne lbl_000058B8
/* 00005870 3C600000 */ lis r3, analogButtonInfo@ha
/* 00005874 38830000 */ addi r4, r3, analogButtonInfo@l
/* 00005878 A0640008 */ lhz r3, 8(r4)
/* 0000587C 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 00005880 40820038 */ bne lbl_000058B8
/* 00005884 3C600000 */ lis r3, controllerInfo@ha
/* 00005888 38630000 */ addi r3, r3, controllerInfo@l
/* 0000588C A0630000 */ lhz r3, 0(r3)
/* 00005890 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 00005894 40820010 */ bne lbl_000058A4
/* 00005898 A0640000 */ lhz r3, 0(r4)
/* 0000589C 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 000058A0 41820040 */ beq lbl_000058E0
lbl_000058A4:
/* 000058A4 3C600000 */ lis r3, analogButtonInfo@ha
/* 000058A8 38630000 */ addi r3, r3, analogButtonInfo@l
/* 000058AC A0630000 */ lhz r3, 0(r3)
/* 000058B0 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 000058B4 4182002C */ beq lbl_000058E0
lbl_000058B8:
/* 000058B8 5403083C */ slwi r3, r0, 1
/* 000058BC 7C9E1A14 */ add r4, r30, r3
/* 000058C0 A8640D48 */ lha r3, 0xd48(r4)
/* 000058C4 38630001 */ addi r3, r3, 1
/* 000058C8 B0640D48 */ sth r3, 0xd48(r4)
/* 000058CC AC640D48 */ lhau r3, 0xd48(r4)
/* 000058D0 28030006 */ cmplwi r3, 6
/* 000058D4 4180000C */ blt lbl_000058E0
/* 000058D8 38600000 */ li r3, 0
/* 000058DC B0640000 */ sth r3, 0(r4)
lbl_000058E0:
/* 000058E0 2C000001 */ cmpwi r0, 1
/* 000058E4 408201D0 */ bne lbl_00005AB4
/* 000058E8 3C600000 */ lis r3, controllerInfo@ha
/* 000058EC 38C30000 */ addi r6, r3, controllerInfo@l
/* 000058F0 A0660030 */ lhz r3, 0x30(r6)
/* 000058F4 54640739 */ rlwinm. r4, r3, 0, 0x1c, 0x1c
/* 000058F8 40820044 */ bne lbl_0000593C
/* 000058FC 3C800000 */ lis r4, analogButtonInfo@ha
/* 00005900 38A40000 */ addi r5, r4, analogButtonInfo@l
/* 00005904 A0850008 */ lhz r4, 8(r5)
/* 00005908 54840739 */ rlwinm. r4, r4, 0, 0x1c, 0x1c
/* 0000590C 40820030 */ bne lbl_0000593C
/* 00005910 A0860000 */ lhz r4, 0(r6)
/* 00005914 54840739 */ rlwinm. r4, r4, 0, 0x1c, 0x1c
/* 00005918 40820010 */ bne lbl_00005928
/* 0000591C A0850000 */ lhz r4, 0(r5)
/* 00005920 54840739 */ rlwinm. r4, r4, 0, 0x1c, 0x1c
/* 00005924 418200AC */ beq lbl_000059D0
lbl_00005928:
/* 00005928 3C800000 */ lis r4, analogButtonInfo@ha
/* 0000592C 38840000 */ addi r4, r4, analogButtonInfo@l
/* 00005930 A0840000 */ lhz r4, 0(r4)
/* 00005934 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00005938 41820098 */ beq lbl_000059D0
lbl_0000593C:
/* 0000593C 5404083C */ slwi r4, r0, 1
/* 00005940 7D3E2214 */ add r9, r30, r4
/* 00005944 A8890D48 */ lha r4, 0xd48(r9)
/* 00005948 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 0000594C B0890D48 */ sth r4, 0xd48(r9)
/* 00005950 AC890D48 */ lhau r4, 0xd48(r9)
/* 00005954 2C040000 */ cmpwi r4, 0
/* 00005958 40800078 */ bge lbl_000059D0
/* 0000595C 3880003B */ li r4, 0x3b
/* 00005960 A8FE0D48 */ lha r7, 0xd48(r30)
/* 00005964 38A00000 */ li r5, 0
/* 00005968 7C8903A6 */ mtctr r4
/* 0000596C 38C50000 */ addi r6, r5, 0
/* 00005970 391F376C */ addi r8, r31, 0x376c
lbl_00005974:
/* 00005974 80880000 */ lwz r4, 0(r8)
/* 00005978 7C072000 */ cmpw r7, r4
/* 0000597C 40820008 */ bne lbl_00005984
/* 00005980 38A50001 */ addi r5, r5, 1
lbl_00005984:
/* 00005984 8488000C */ lwzu r4, 0xc(r8)
/* 00005988 7C072000 */ cmpw r7, r4
/* 0000598C 40820008 */ bne lbl_00005994
/* 00005990 38A50001 */ addi r5, r5, 1
lbl_00005994:
/* 00005994 8488000C */ lwzu r4, 0xc(r8)
/* 00005998 38C60001 */ addi r6, r6, 1
/* 0000599C 7C072000 */ cmpw r7, r4
/* 000059A0 40820008 */ bne lbl_000059A8
/* 000059A4 38A50001 */ addi r5, r5, 1
lbl_000059A8:
/* 000059A8 8488000C */ lwzu r4, 0xc(r8)
/* 000059AC 38C60001 */ addi r6, r6, 1
/* 000059B0 7C072000 */ cmpw r7, r4
/* 000059B4 40820008 */ bne lbl_000059BC
/* 000059B8 38A50001 */ addi r5, r5, 1
lbl_000059BC:
/* 000059BC 3908000C */ addi r8, r8, 0xc
/* 000059C0 38C60001 */ addi r6, r6, 1
/* 000059C4 4200FFB0 */ bdnz lbl_00005974
/* 000059C8 3885FFFF */ addi r4, r5, -1  ;# fixed addi
/* 000059CC B0890000 */ sth r4, 0(r9)
lbl_000059D0:
/* 000059D0 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 000059D4 4082004C */ bne lbl_00005A20
/* 000059D8 3C600000 */ lis r3, analogButtonInfo@ha
/* 000059DC 38830000 */ addi r4, r3, analogButtonInfo@l
/* 000059E0 A0640008 */ lhz r3, 8(r4)
/* 000059E4 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 000059E8 40820038 */ bne lbl_00005A20
/* 000059EC 3C600000 */ lis r3, controllerInfo@ha
/* 000059F0 38630000 */ addi r3, r3, controllerInfo@l
/* 000059F4 A0630000 */ lhz r3, 0(r3)
/* 000059F8 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 000059FC 40820010 */ bne lbl_00005A0C
/* 00005A00 A0640000 */ lhz r3, 0(r4)
/* 00005A04 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 00005A08 418200AC */ beq lbl_00005AB4
lbl_00005A0C:
/* 00005A0C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00005A10 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00005A14 A0630000 */ lhz r3, 0(r3)
/* 00005A18 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00005A1C 41820098 */ beq lbl_00005AB4
lbl_00005A20:
/* 00005A20 5400083C */ slwi r0, r0, 1
/* 00005A24 7CFE0214 */ add r7, r30, r0
/* 00005A28 A8670D48 */ lha r3, 0xd48(r7)
/* 00005A2C 3800003B */ li r0, 0x3b
/* 00005A30 7C0903A6 */ mtctr r0
/* 00005A34 38800000 */ li r4, 0
/* 00005A38 38030001 */ addi r0, r3, 1
/* 00005A3C B4070D48 */ sthu r0, 0xd48(r7)
/* 00005A40 38640000 */ addi r3, r4, 0
/* 00005A44 38DF376C */ addi r6, r31, 0x376c
/* 00005A48 A8BE0D48 */ lha r5, 0xd48(r30)
lbl_00005A4C:
/* 00005A4C 80060000 */ lwz r0, 0(r6)
/* 00005A50 7C050000 */ cmpw r5, r0
/* 00005A54 40820008 */ bne lbl_00005A5C
/* 00005A58 38840001 */ addi r4, r4, 1
lbl_00005A5C:
/* 00005A5C 8406000C */ lwzu r0, 0xc(r6)
/* 00005A60 7C050000 */ cmpw r5, r0
/* 00005A64 40820008 */ bne lbl_00005A6C
/* 00005A68 38840001 */ addi r4, r4, 1
lbl_00005A6C:
/* 00005A6C 8406000C */ lwzu r0, 0xc(r6)
/* 00005A70 38630001 */ addi r3, r3, 1
/* 00005A74 7C050000 */ cmpw r5, r0
/* 00005A78 40820008 */ bne lbl_00005A80
/* 00005A7C 38840001 */ addi r4, r4, 1
lbl_00005A80:
/* 00005A80 8406000C */ lwzu r0, 0xc(r6)
/* 00005A84 38630001 */ addi r3, r3, 1
/* 00005A88 7C050000 */ cmpw r5, r0
/* 00005A8C 40820008 */ bne lbl_00005A94
/* 00005A90 38840001 */ addi r4, r4, 1
lbl_00005A94:
/* 00005A94 38C6000C */ addi r6, r6, 0xc
/* 00005A98 38630001 */ addi r3, r3, 1
/* 00005A9C 4200FFB0 */ bdnz lbl_00005A4C
/* 00005AA0 A8070000 */ lha r0, 0(r7)
/* 00005AA4 7C002000 */ cmpw r0, r4
/* 00005AA8 4180000C */ blt lbl_00005AB4
/* 00005AAC 38000000 */ li r0, 0
/* 00005AB0 B0070000 */ sth r0, 0(r7)
lbl_00005AB4:
/* 00005AB4 38600001 */ li r3, 1
/* 00005AB8 38800001 */ li r4, 1
/* 00005ABC 4BFFA6A1 */ bl g_debug_set_cursor_pos
/* 00005AC0 38600004 */ li r3, 4
/* 00005AC4 4BFFA699 */ bl g_debug_set_text_color
/* 00005AC8 387F427C */ addi r3, r31, 0x427c
/* 00005ACC 4CC63182 */ crclr 6
/* 00005AD0 4BFFA68D */ bl g_debug_printf
/* 00005AD4 38600000 */ li r3, 0
/* 00005AD8 4BFFA685 */ bl g_debug_set_text_color
/* 00005ADC A81E0D44 */ lha r0, 0xd44(r30)
/* 00005AE0 2C000002 */ cmpwi r0, 2
/* 00005AE4 40800038 */ bge lbl_00005B1C
/* 00005AE8 38600001 */ li r3, 1
/* 00005AEC 38800022 */ li r4, 0x22
/* 00005AF0 4BFFA66D */ bl g_debug_set_cursor_pos
/* 00005AF4 387F428C */ addi r3, r31, 0x428c
/* 00005AF8 4CC63182 */ crclr 6
/* 00005AFC 4BFFA661 */ bl g_debug_printf
/* 00005B00 387F429C */ addi r3, r31, 0x429c
/* 00005B04 4CC63182 */ crclr 6
/* 00005B08 4BFFA655 */ bl g_debug_printf
/* 00005B0C 387F42AC */ addi r3, r31, 0x42ac
/* 00005B10 4CC63182 */ crclr 6
/* 00005B14 4BFFA649 */ bl g_debug_printf
/* 00005B18 48000028 */ b lbl_00005B40
lbl_00005B1C:
/* 00005B1C 38600001 */ li r3, 1
/* 00005B20 38800022 */ li r4, 0x22
/* 00005B24 4BFFA639 */ bl g_debug_set_cursor_pos
/* 00005B28 387F42C4 */ addi r3, r31, 0x42c4
/* 00005B2C 4CC63182 */ crclr 6
/* 00005B30 4BFFA62D */ bl g_debug_printf
/* 00005B34 387F42DC */ addi r3, r31, 0x42dc
/* 00005B38 4CC63182 */ crclr 6
/* 00005B3C 4BFFA621 */ bl g_debug_printf
lbl_00005B40:
/* 00005B40 881E0D4E */ lbz r0, 0xd4e(r30)
/* 00005B44 28000000 */ cmplwi r0, 0
/* 00005B48 4182003C */ beq lbl_00005B84
/* 00005B4C 38600022 */ li r3, 0x22
/* 00005B50 38800022 */ li r4, 0x22
/* 00005B54 4BFFA609 */ bl g_debug_set_cursor_pos
/* 00005B58 387F42F0 */ addi r3, r31, 0x42f0
/* 00005B5C 4CC63182 */ crclr 6
/* 00005B60 4BFFA5FD */ bl g_debug_printf
/* 00005B64 38600002 */ li r3, 2
/* 00005B68 4BFFA5F5 */ bl g_debug_set_text_color
/* 00005B6C 387F42F8 */ addi r3, r31, 0x42f8
/* 00005B70 4CC63182 */ crclr 6
/* 00005B74 4BFFA5E9 */ bl g_debug_printf
/* 00005B78 38600000 */ li r3, 0
/* 00005B7C 4BFFA5E1 */ bl g_debug_set_text_color
/* 00005B80 4800001C */ b lbl_00005B9C
lbl_00005B84:
/* 00005B84 38600022 */ li r3, 0x22
/* 00005B88 38800022 */ li r4, 0x22
/* 00005B8C 4BFFA5D1 */ bl g_debug_set_cursor_pos
/* 00005B90 387F4304 */ addi r3, r31, 0x4304
/* 00005B94 4CC63182 */ crclr 6
/* 00005B98 4BFFA5C5 */ bl g_debug_printf
lbl_00005B9C:
/* 00005B9C 801E05AC */ lwz r0, 0x5ac(r30)
/* 00005BA0 2C000000 */ cmpwi r0, 0
/* 00005BA4 4182003C */ beq lbl_00005BE0
/* 00005BA8 38600022 */ li r3, 0x22
/* 00005BAC 38800023 */ li r4, 0x23
/* 00005BB0 4BFFA5AD */ bl g_debug_set_cursor_pos
/* 00005BB4 38600002 */ li r3, 2
/* 00005BB8 4BFFA5A5 */ bl g_debug_set_text_color
/* 00005BBC 387F4318 */ addi r3, r31, 0x4318
/* 00005BC0 4CC63182 */ crclr 6
/* 00005BC4 4BFFA599 */ bl g_debug_printf
/* 00005BC8 38600000 */ li r3, 0
/* 00005BCC 4BFFA591 */ bl g_debug_set_text_color
/* 00005BD0 387F432C */ addi r3, r31, 0x432c
/* 00005BD4 4CC63182 */ crclr 6
/* 00005BD8 4BFFA585 */ bl g_debug_printf
/* 00005BDC 4800001C */ b lbl_00005BF8
lbl_00005BE0:
/* 00005BE0 38600022 */ li r3, 0x22
/* 00005BE4 38800024 */ li r4, 0x24
/* 00005BE8 4BFFA575 */ bl g_debug_set_cursor_pos
/* 00005BEC 387F4340 */ addi r3, r31, 0x4340
/* 00005BF0 4CC63182 */ crclr 6
/* 00005BF4 4BFFA569 */ bl g_debug_printf
lbl_00005BF8:
/* 00005BF8 A81E0D44 */ lha r0, 0xd44(r30)
/* 00005BFC 2C000000 */ cmpwi r0, 0
/* 00005C00 418000B8 */ blt lbl_00005CB8
/* 00005C04 3BA00000 */ li r29, 0
/* 00005C08 57A0103A */ slwi r0, r29, 2
/* 00005C0C 7F9F0214 */ add r28, r31, r0
/* 00005C10 3C60AAAB */ lis r3, 0xaaab
/* 00005C14 3B9C3690 */ addi r28, r28, 0x3690
/* 00005C18 3B63AAAB */ addi r27, r3, -21845  ;# fixed addi
lbl_00005C1C:
/* 00005C1C A81E0D48 */ lha r0, 0xd48(r30)
/* 00005C20 38600001 */ li r3, 1
/* 00005C24 7C80E850 */ subf r4, r0, r29
/* 00005C28 38840006 */ addi r4, r4, 6
/* 00005C2C 7C1B2016 */ mulhwu r0, r27, r4
/* 00005C30 5400F0BE */ srwi r0, r0, 2
/* 00005C34 1C000006 */ mulli r0, r0, 6
/* 00005C38 7C802050 */ subf r4, r0, r4
/* 00005C3C 38840003 */ addi r4, r4, 3
/* 00005C40 4BFFA51D */ bl g_debug_set_cursor_pos
/* 00005C44 A81E0D48 */ lha r0, 0xd48(r30)
/* 00005C48 7C1D0000 */ cmpw r29, r0
/* 00005C4C 40820038 */ bne lbl_00005C84
/* 00005C50 A81E0D44 */ lha r0, 0xd44(r30)
/* 00005C54 2C000000 */ cmpwi r0, 0
/* 00005C58 40820010 */ bne lbl_00005C68
/* 00005C5C 38600002 */ li r3, 2
/* 00005C60 4BFFA4FD */ bl g_debug_set_text_color
/* 00005C64 4800000C */ b lbl_00005C70
lbl_00005C68:
/* 00005C68 38600000 */ li r3, 0
/* 00005C6C 4BFFA4F1 */ bl g_debug_set_text_color
lbl_00005C70:
/* 00005C70 809C0000 */ lwz r4, 0(r28)
/* 00005C74 387F4354 */ addi r3, r31, 0x4354
/* 00005C78 4CC63182 */ crclr 6
/* 00005C7C 4BFFA4E1 */ bl g_debug_printf
/* 00005C80 48000020 */ b lbl_00005CA0
lbl_00005C84:
/* 00005C84 A81E0D44 */ lha r0, 0xd44(r30)
/* 00005C88 2C000000 */ cmpwi r0, 0
/* 00005C8C 40820014 */ bne lbl_00005CA0
/* 00005C90 809C0000 */ lwz r4, 0(r28)
/* 00005C94 387F435C */ addi r3, r31, 0x435c
/* 00005C98 4CC63182 */ crclr 6
/* 00005C9C 4BFFA4C1 */ bl g_debug_printf
lbl_00005CA0:
/* 00005CA0 38600000 */ li r3, 0
/* 00005CA4 4BFFA4B9 */ bl g_debug_set_text_color
/* 00005CA8 3BBD0001 */ addi r29, r29, 1
/* 00005CAC 281D0006 */ cmplwi r29, 6
/* 00005CB0 3B9C0004 */ addi r28, r28, 4
/* 00005CB4 4180FF68 */ blt lbl_00005C1C
lbl_00005CB8:
/* 00005CB8 A81E0D44 */ lha r0, 0xd44(r30)
/* 00005CBC 2C000001 */ cmpwi r0, 1
/* 00005CC0 418008C4 */ blt lbl_00006584
/* 00005CC4 3800003B */ li r0, 0x3b
/* 00005CC8 A8BE0D48 */ lha r5, 0xd48(r30)
/* 00005CCC 3BBF376C */ addi r29, r31, 0x376c
/* 00005CD0 7C0903A6 */ mtctr r0
/* 00005CD4 38600000 */ li r3, 0
/* 00005CD8 38830000 */ addi r4, r3, 0
/* 00005CDC 38DD0000 */ addi r6, r29, 0
lbl_00005CE0:
/* 00005CE0 80060000 */ lwz r0, 0(r6)
/* 00005CE4 7C050000 */ cmpw r5, r0
/* 00005CE8 40820008 */ bne lbl_00005CF0
/* 00005CEC 38630001 */ addi r3, r3, 1
lbl_00005CF0:
/* 00005CF0 8406000C */ lwzu r0, 0xc(r6)
/* 00005CF4 7C050000 */ cmpw r5, r0
/* 00005CF8 40820008 */ bne lbl_00005D00
/* 00005CFC 38630001 */ addi r3, r3, 1
lbl_00005D00:
/* 00005D00 8406000C */ lwzu r0, 0xc(r6)
/* 00005D04 38840001 */ addi r4, r4, 1
/* 00005D08 7C050000 */ cmpw r5, r0
/* 00005D0C 40820008 */ bne lbl_00005D14
/* 00005D10 38630001 */ addi r3, r3, 1
lbl_00005D14:
/* 00005D14 8406000C */ lwzu r0, 0xc(r6)
/* 00005D18 38840001 */ addi r4, r4, 1
/* 00005D1C 7C050000 */ cmpw r5, r0
/* 00005D20 40820008 */ bne lbl_00005D28
/* 00005D24 38630001 */ addi r3, r3, 1
lbl_00005D28:
/* 00005D28 38C6000C */ addi r6, r6, 0xc
/* 00005D2C 38840001 */ addi r4, r4, 1
/* 00005D30 4200FFB0 */ bdnz lbl_00005CE0
/* 00005D34 2C030014 */ cmpwi r3, 0x14
/* 00005D38 408003A8 */ bge lbl_000060E0
/* 00005D3C 3B9E0D4A */ addi r28, r30, 0xd4a
/* 00005D40 3B600000 */ li r27, 0
/* 00005D44 48000324 */ b lbl_00006068
lbl_00005D48:
/* 00005D48 3800003B */ li r0, 0x3b
/* 00005D4C 38800000 */ li r4, 0
/* 00005D50 7C0903A6 */ mtctr r0
/* 00005D54 38640000 */ addi r3, r4, 0
/* 00005D58 38BD0000 */ addi r5, r29, 0
lbl_00005D5C:
/* 00005D5C 80050000 */ lwz r0, 0(r5)
/* 00005D60 7C070000 */ cmpw r7, r0
/* 00005D64 40820008 */ bne lbl_00005D6C
/* 00005D68 38840001 */ addi r4, r4, 1
lbl_00005D6C:
/* 00005D6C 8405000C */ lwzu r0, 0xc(r5)
/* 00005D70 7C070000 */ cmpw r7, r0
/* 00005D74 40820008 */ bne lbl_00005D7C
/* 00005D78 38840001 */ addi r4, r4, 1
lbl_00005D7C:
/* 00005D7C 8405000C */ lwzu r0, 0xc(r5)
/* 00005D80 38630001 */ addi r3, r3, 1
/* 00005D84 7C070000 */ cmpw r7, r0
/* 00005D88 40820008 */ bne lbl_00005D90
/* 00005D8C 38840001 */ addi r4, r4, 1
lbl_00005D90:
/* 00005D90 8405000C */ lwzu r0, 0xc(r5)
/* 00005D94 38630001 */ addi r3, r3, 1
/* 00005D98 7C070000 */ cmpw r7, r0
/* 00005D9C 40820008 */ bne lbl_00005DA4
/* 00005DA0 38840001 */ addi r4, r4, 1
lbl_00005DA4:
/* 00005DA4 38A5000C */ addi r5, r5, 0xc
/* 00005DA8 38630001 */ addi r3, r3, 1
/* 00005DAC 4200FFB0 */ bdnz lbl_00005D5C
/* 00005DB0 3800003B */ li r0, 0x3b
/* 00005DB4 38A00000 */ li r5, 0
/* 00005DB8 7C0903A6 */ mtctr r0
/* 00005DBC 38650000 */ addi r3, r5, 0
/* 00005DC0 38DD0000 */ addi r6, r29, 0
lbl_00005DC4:
/* 00005DC4 80060000 */ lwz r0, 0(r6)
/* 00005DC8 7C070000 */ cmpw r7, r0
/* 00005DCC 40820008 */ bne lbl_00005DD4
/* 00005DD0 38A50001 */ addi r5, r5, 1
lbl_00005DD4:
/* 00005DD4 8406000C */ lwzu r0, 0xc(r6)
/* 00005DD8 7C070000 */ cmpw r7, r0
/* 00005DDC 40820008 */ bne lbl_00005DE4
/* 00005DE0 38A50001 */ addi r5, r5, 1
lbl_00005DE4:
/* 00005DE4 8406000C */ lwzu r0, 0xc(r6)
/* 00005DE8 38630001 */ addi r3, r3, 1
/* 00005DEC 7C070000 */ cmpw r7, r0
/* 00005DF0 40820008 */ bne lbl_00005DF8
/* 00005DF4 38A50001 */ addi r5, r5, 1
lbl_00005DF8:
/* 00005DF8 8006000C */ lwz r0, 0xc(r6)
/* 00005DFC 38C6000C */ addi r6, r6, 0xc
/* 00005E00 38630001 */ addi r3, r3, 1
/* 00005E04 7C070000 */ cmpw r7, r0
/* 00005E08 40820008 */ bne lbl_00005E10
/* 00005E0C 38A50001 */ addi r5, r5, 1
lbl_00005E10:
/* 00005E10 38C6000C */ addi r6, r6, 0xc
/* 00005E14 38630001 */ addi r3, r3, 1
/* 00005E18 4200FFAC */ bdnz lbl_00005DC4
/* 00005E1C A81C0000 */ lha r0, 0(r28)
/* 00005E20 3860000A */ li r3, 0xa
/* 00005E24 7C00D850 */ subf r0, r0, r27
/* 00005E28 7C802214 */ add r4, r0, r4
/* 00005E2C 7C042BD6 */ divw r0, r4, r5
/* 00005E30 7C0029D6 */ mullw r0, r0, r5
/* 00005E34 7C802050 */ subf r4, r0, r4
/* 00005E38 38840003 */ addi r4, r4, 3
/* 00005E3C 4BFFA321 */ bl g_debug_set_cursor_pos
/* 00005E40 A81C0000 */ lha r0, 0(r28)
/* 00005E44 7C1B0000 */ cmpw r27, r0
/* 00005E48 40820118 */ bne lbl_00005F60
/* 00005E4C A81E0D44 */ lha r0, 0xd44(r30)
/* 00005E50 2C000001 */ cmpwi r0, 1
/* 00005E54 40820010 */ bne lbl_00005E64
/* 00005E58 38600002 */ li r3, 2
/* 00005E5C 4BFFA301 */ bl g_debug_set_text_color
/* 00005E60 4800000C */ b lbl_00005E6C
lbl_00005E64:
/* 00005E64 38600000 */ li r3, 0
/* 00005E68 4BFFA2F5 */ bl g_debug_set_text_color
lbl_00005E6C:
/* 00005E6C 3800003B */ li r0, 0x3b
/* 00005E70 A8DE0D48 */ lha r6, 0xd48(r30)
/* 00005E74 38800000 */ li r4, 0
/* 00005E78 7C0903A6 */ mtctr r0
/* 00005E7C 38A40000 */ addi r5, r4, 0
/* 00005E80 38FD0000 */ addi r7, r29, 0
/* 00005E84 381B0001 */ addi r0, r27, 1
lbl_00005E88:
/* 00005E88 80670000 */ lwz r3, 0(r7)
/* 00005E8C 7C061800 */ cmpw r6, r3
/* 00005E90 40820008 */ bne lbl_00005E98
/* 00005E94 38840001 */ addi r4, r4, 1
lbl_00005E98:
/* 00005E98 7C002000 */ cmpw r0, r4
/* 00005E9C 40820014 */ bne lbl_00005EB0
/* 00005EA0 1C05000C */ mulli r0, r5, 0xc
/* 00005EA4 7C7F0214 */ add r3, r31, r0
/* 00005EA8 80833774 */ lwz r4, 0x3774(r3)
/* 00005EAC 480000A4 */ b lbl_00005F50
lbl_00005EB0:
/* 00005EB0 8067000C */ lwz r3, 0xc(r7)
/* 00005EB4 38E7000C */ addi r7, r7, 0xc
/* 00005EB8 38A50001 */ addi r5, r5, 1
/* 00005EBC 7C061800 */ cmpw r6, r3
/* 00005EC0 40820008 */ bne lbl_00005EC8
/* 00005EC4 38840001 */ addi r4, r4, 1
lbl_00005EC8:
/* 00005EC8 7C002000 */ cmpw r0, r4
/* 00005ECC 40820014 */ bne lbl_00005EE0
/* 00005ED0 1C05000C */ mulli r0, r5, 0xc
/* 00005ED4 7C7F0214 */ add r3, r31, r0
/* 00005ED8 80833774 */ lwz r4, 0x3774(r3)
/* 00005EDC 48000074 */ b lbl_00005F50
lbl_00005EE0:
/* 00005EE0 8067000C */ lwz r3, 0xc(r7)
/* 00005EE4 38E7000C */ addi r7, r7, 0xc
/* 00005EE8 38A50001 */ addi r5, r5, 1
/* 00005EEC 7C061800 */ cmpw r6, r3
/* 00005EF0 40820008 */ bne lbl_00005EF8
/* 00005EF4 38840001 */ addi r4, r4, 1
lbl_00005EF8:
/* 00005EF8 7C002000 */ cmpw r0, r4
/* 00005EFC 40820014 */ bne lbl_00005F10
/* 00005F00 1C05000C */ mulli r0, r5, 0xc
/* 00005F04 7C7F0214 */ add r3, r31, r0
/* 00005F08 80833774 */ lwz r4, 0x3774(r3)
/* 00005F0C 48000044 */ b lbl_00005F50
lbl_00005F10:
/* 00005F10 8067000C */ lwz r3, 0xc(r7)
/* 00005F14 38E7000C */ addi r7, r7, 0xc
/* 00005F18 38A50001 */ addi r5, r5, 1
/* 00005F1C 7C061800 */ cmpw r6, r3
/* 00005F20 40820008 */ bne lbl_00005F28
/* 00005F24 38840001 */ addi r4, r4, 1
lbl_00005F28:
/* 00005F28 7C002000 */ cmpw r0, r4
/* 00005F2C 40820014 */ bne lbl_00005F40
/* 00005F30 1C05000C */ mulli r0, r5, 0xc
/* 00005F34 7C7F0214 */ add r3, r31, r0
/* 00005F38 80833774 */ lwz r4, 0x3774(r3)
/* 00005F3C 48000014 */ b lbl_00005F50
lbl_00005F40:
/* 00005F40 38E7000C */ addi r7, r7, 0xc
/* 00005F44 38A50001 */ addi r5, r5, 1
/* 00005F48 4200FF40 */ bdnz lbl_00005E88
/* 00005F4C 38800000 */ li r4, 0
lbl_00005F50:
/* 00005F50 4CC63182 */ crclr 6
/* 00005F54 387F4354 */ addi r3, r31, 0x4354
/* 00005F58 4BFFA205 */ bl g_debug_printf
/* 00005F5C 48000100 */ b lbl_0000605C
lbl_00005F60:
/* 00005F60 A81E0D44 */ lha r0, 0xd44(r30)
/* 00005F64 2C000001 */ cmpwi r0, 1
/* 00005F68 408200F4 */ bne lbl_0000605C
/* 00005F6C 3800003B */ li r0, 0x3b
/* 00005F70 A8DE0D48 */ lha r6, 0xd48(r30)
/* 00005F74 38800000 */ li r4, 0
/* 00005F78 7C0903A6 */ mtctr r0
/* 00005F7C 38A40000 */ addi r5, r4, 0
/* 00005F80 38FD0000 */ addi r7, r29, 0
/* 00005F84 381B0001 */ addi r0, r27, 1
lbl_00005F88:
/* 00005F88 80670000 */ lwz r3, 0(r7)
/* 00005F8C 7C061800 */ cmpw r6, r3
/* 00005F90 40820008 */ bne lbl_00005F98
/* 00005F94 38840001 */ addi r4, r4, 1
lbl_00005F98:
/* 00005F98 7C002000 */ cmpw r0, r4
/* 00005F9C 40820014 */ bne lbl_00005FB0
/* 00005FA0 1C05000C */ mulli r0, r5, 0xc
/* 00005FA4 7C7F0214 */ add r3, r31, r0
/* 00005FA8 80833774 */ lwz r4, 0x3774(r3)
/* 00005FAC 480000A4 */ b lbl_00006050
lbl_00005FB0:
/* 00005FB0 8067000C */ lwz r3, 0xc(r7)
/* 00005FB4 38E7000C */ addi r7, r7, 0xc
/* 00005FB8 38A50001 */ addi r5, r5, 1
/* 00005FBC 7C061800 */ cmpw r6, r3
/* 00005FC0 40820008 */ bne lbl_00005FC8
/* 00005FC4 38840001 */ addi r4, r4, 1
lbl_00005FC8:
/* 00005FC8 7C002000 */ cmpw r0, r4
/* 00005FCC 40820014 */ bne lbl_00005FE0
/* 00005FD0 1C05000C */ mulli r0, r5, 0xc
/* 00005FD4 7C7F0214 */ add r3, r31, r0
/* 00005FD8 80833774 */ lwz r4, 0x3774(r3)
/* 00005FDC 48000074 */ b lbl_00006050
lbl_00005FE0:
/* 00005FE0 8067000C */ lwz r3, 0xc(r7)
/* 00005FE4 38E7000C */ addi r7, r7, 0xc
/* 00005FE8 38A50001 */ addi r5, r5, 1
/* 00005FEC 7C061800 */ cmpw r6, r3
/* 00005FF0 40820008 */ bne lbl_00005FF8
/* 00005FF4 38840001 */ addi r4, r4, 1
lbl_00005FF8:
/* 00005FF8 7C002000 */ cmpw r0, r4
/* 00005FFC 40820014 */ bne lbl_00006010
/* 00006000 1C05000C */ mulli r0, r5, 0xc
/* 00006004 7C7F0214 */ add r3, r31, r0
/* 00006008 80833774 */ lwz r4, 0x3774(r3)
/* 0000600C 48000044 */ b lbl_00006050
lbl_00006010:
/* 00006010 8067000C */ lwz r3, 0xc(r7)
/* 00006014 38E7000C */ addi r7, r7, 0xc
/* 00006018 38A50001 */ addi r5, r5, 1
/* 0000601C 7C061800 */ cmpw r6, r3
/* 00006020 40820008 */ bne lbl_00006028
/* 00006024 38840001 */ addi r4, r4, 1
lbl_00006028:
/* 00006028 7C002000 */ cmpw r0, r4
/* 0000602C 40820014 */ bne lbl_00006040
/* 00006030 1C05000C */ mulli r0, r5, 0xc
/* 00006034 7C7F0214 */ add r3, r31, r0
/* 00006038 80833774 */ lwz r4, 0x3774(r3)
/* 0000603C 48000014 */ b lbl_00006050
lbl_00006040:
/* 00006040 38E7000C */ addi r7, r7, 0xc
/* 00006044 38A50001 */ addi r5, r5, 1
/* 00006048 4200FF40 */ bdnz lbl_00005F88
/* 0000604C 38800000 */ li r4, 0
lbl_00006050:
/* 00006050 4CC63182 */ crclr 6
/* 00006054 387F435C */ addi r3, r31, 0x435c
/* 00006058 4BFFA105 */ bl g_debug_printf
lbl_0000605C:
/* 0000605C 38600000 */ li r3, 0
/* 00006060 4BFFA0FD */ bl g_debug_set_text_color
/* 00006064 3B7B0001 */ addi r27, r27, 1
lbl_00006068:
/* 00006068 3800003B */ li r0, 0x3b
/* 0000606C A8FE0D48 */ lha r7, 0xd48(r30)
/* 00006070 38600000 */ li r3, 0
/* 00006074 7C0903A6 */ mtctr r0
/* 00006078 38830000 */ addi r4, r3, 0
/* 0000607C 38BD0000 */ addi r5, r29, 0
lbl_00006080:
/* 00006080 80050000 */ lwz r0, 0(r5)
/* 00006084 7C070000 */ cmpw r7, r0
/* 00006088 40820008 */ bne lbl_00006090
/* 0000608C 38630001 */ addi r3, r3, 1
lbl_00006090:
/* 00006090 8405000C */ lwzu r0, 0xc(r5)
/* 00006094 7C070000 */ cmpw r7, r0
/* 00006098 40820008 */ bne lbl_000060A0
/* 0000609C 38630001 */ addi r3, r3, 1
lbl_000060A0:
/* 000060A0 8405000C */ lwzu r0, 0xc(r5)
/* 000060A4 38840001 */ addi r4, r4, 1
/* 000060A8 7C070000 */ cmpw r7, r0
/* 000060AC 40820008 */ bne lbl_000060B4
/* 000060B0 38630001 */ addi r3, r3, 1
lbl_000060B4:
/* 000060B4 8405000C */ lwzu r0, 0xc(r5)
/* 000060B8 38840001 */ addi r4, r4, 1
/* 000060BC 7C070000 */ cmpw r7, r0
/* 000060C0 40820008 */ bne lbl_000060C8
/* 000060C4 38630001 */ addi r3, r3, 1
lbl_000060C8:
/* 000060C8 38A5000C */ addi r5, r5, 0xc
/* 000060CC 38840001 */ addi r4, r4, 1
/* 000060D0 4200FFB0 */ bdnz lbl_00006080
/* 000060D4 7C1B1800 */ cmpw r27, r3
/* 000060D8 4180FC70 */ blt lbl_00005D48
/* 000060DC 480004A8 */ b lbl_00006584
lbl_000060E0:
/* 000060E0 3B9E0D4A */ addi r28, r30, 0xd4a
/* 000060E4 3B600000 */ li r27, 0
/* 000060E8 48000428 */ b lbl_00006510
lbl_000060EC:
/* 000060EC 3860003B */ li r3, 0x3b
/* 000060F0 38800000 */ li r4, 0
/* 000060F4 7C6903A6 */ mtctr r3
/* 000060F8 38A40000 */ addi r5, r4, 0
/* 000060FC 38DD0000 */ addi r6, r29, 0
lbl_00006100:
/* 00006100 80660000 */ lwz r3, 0(r6)
/* 00006104 7C001800 */ cmpw r0, r3
/* 00006108 40820008 */ bne lbl_00006110
/* 0000610C 38840001 */ addi r4, r4, 1
lbl_00006110:
/* 00006110 8466000C */ lwzu r3, 0xc(r6)
/* 00006114 7C001800 */ cmpw r0, r3
/* 00006118 40820008 */ bne lbl_00006120
/* 0000611C 38840001 */ addi r4, r4, 1
lbl_00006120:
/* 00006120 8466000C */ lwzu r3, 0xc(r6)
/* 00006124 38A50001 */ addi r5, r5, 1
/* 00006128 7C001800 */ cmpw r0, r3
/* 0000612C 40820008 */ bne lbl_00006134
/* 00006130 38840001 */ addi r4, r4, 1
lbl_00006134:
/* 00006134 8466000C */ lwzu r3, 0xc(r6)
/* 00006138 38A50001 */ addi r5, r5, 1
/* 0000613C 7C001800 */ cmpw r0, r3
/* 00006140 40820008 */ bne lbl_00006148
/* 00006144 38840001 */ addi r4, r4, 1
lbl_00006148:
/* 00006148 38C6000C */ addi r6, r6, 0xc
/* 0000614C 38A50001 */ addi r5, r5, 1
/* 00006150 4200FFB0 */ bdnz lbl_00006100
/* 00006154 3860003B */ li r3, 0x3b
/* 00006158 38A00000 */ li r5, 0
/* 0000615C 7C6903A6 */ mtctr r3
/* 00006160 38C50000 */ addi r6, r5, 0
/* 00006164 38FD0000 */ addi r7, r29, 0
lbl_00006168:
/* 00006168 80670000 */ lwz r3, 0(r7)
/* 0000616C 7C001800 */ cmpw r0, r3
/* 00006170 40820008 */ bne lbl_00006178
/* 00006174 38A50001 */ addi r5, r5, 1
lbl_00006178:
/* 00006178 8467000C */ lwzu r3, 0xc(r7)
/* 0000617C 7C001800 */ cmpw r0, r3
/* 00006180 40820008 */ bne lbl_00006188
/* 00006184 38A50001 */ addi r5, r5, 1
lbl_00006188:
/* 00006188 8467000C */ lwzu r3, 0xc(r7)
/* 0000618C 38C60001 */ addi r6, r6, 1
/* 00006190 7C001800 */ cmpw r0, r3
/* 00006194 40820008 */ bne lbl_0000619C
/* 00006198 38A50001 */ addi r5, r5, 1
lbl_0000619C:
/* 0000619C 8067000C */ lwz r3, 0xc(r7)
/* 000061A0 38E7000C */ addi r7, r7, 0xc
/* 000061A4 38C60001 */ addi r6, r6, 1
/* 000061A8 7C001800 */ cmpw r0, r3
/* 000061AC 40820008 */ bne lbl_000061B4
/* 000061B0 38A50001 */ addi r5, r5, 1
lbl_000061B4:
/* 000061B4 38E7000C */ addi r7, r7, 0xc
/* 000061B8 38C60001 */ addi r6, r6, 1
/* 000061BC 4200FFAC */ bdnz lbl_00006168
/* 000061C0 A87C0000 */ lha r3, 0(r28)
/* 000061C4 7D03D850 */ subf r8, r3, r27
/* 000061C8 7C882214 */ add r4, r8, r4
/* 000061CC 7C642BD6 */ divw r3, r4, r5
/* 000061D0 7C6329D6 */ mullw r3, r3, r5
/* 000061D4 7C632050 */ subf r3, r3, r4
/* 000061D8 2C030014 */ cmpwi r3, 0x14
/* 000061DC 40800330 */ bge lbl_0000650C
/* 000061E0 3860003B */ li r3, 0x3b
/* 000061E4 38800000 */ li r4, 0
/* 000061E8 7C6903A6 */ mtctr r3
/* 000061EC 38A40000 */ addi r5, r4, 0
/* 000061F0 38DD0000 */ addi r6, r29, 0
lbl_000061F4:
/* 000061F4 80660000 */ lwz r3, 0(r6)
/* 000061F8 7C001800 */ cmpw r0, r3
/* 000061FC 40820008 */ bne lbl_00006204
/* 00006200 38840001 */ addi r4, r4, 1
lbl_00006204:
/* 00006204 8466000C */ lwzu r3, 0xc(r6)
/* 00006208 7C001800 */ cmpw r0, r3
/* 0000620C 40820008 */ bne lbl_00006214
/* 00006210 38840001 */ addi r4, r4, 1
lbl_00006214:
/* 00006214 8466000C */ lwzu r3, 0xc(r6)
/* 00006218 38A50001 */ addi r5, r5, 1
/* 0000621C 7C001800 */ cmpw r0, r3
/* 00006220 40820008 */ bne lbl_00006228
/* 00006224 38840001 */ addi r4, r4, 1
lbl_00006228:
/* 00006228 8466000C */ lwzu r3, 0xc(r6)
/* 0000622C 38A50001 */ addi r5, r5, 1
/* 00006230 7C001800 */ cmpw r0, r3
/* 00006234 40820008 */ bne lbl_0000623C
/* 00006238 38840001 */ addi r4, r4, 1
lbl_0000623C:
/* 0000623C 38C6000C */ addi r6, r6, 0xc
/* 00006240 38A50001 */ addi r5, r5, 1
/* 00006244 4200FFB0 */ bdnz lbl_000061F4
/* 00006248 3860003B */ li r3, 0x3b
/* 0000624C 38A00000 */ li r5, 0
/* 00006250 7C6903A6 */ mtctr r3
/* 00006254 38C50000 */ addi r6, r5, 0
/* 00006258 38FD0000 */ addi r7, r29, 0
lbl_0000625C:
/* 0000625C 80670000 */ lwz r3, 0(r7)
/* 00006260 7C001800 */ cmpw r0, r3
/* 00006264 40820008 */ bne lbl_0000626C
/* 00006268 38A50001 */ addi r5, r5, 1
lbl_0000626C:
/* 0000626C 8467000C */ lwzu r3, 0xc(r7)
/* 00006270 7C001800 */ cmpw r0, r3
/* 00006274 40820008 */ bne lbl_0000627C
/* 00006278 38A50001 */ addi r5, r5, 1
lbl_0000627C:
/* 0000627C 8467000C */ lwzu r3, 0xc(r7)
/* 00006280 38C60001 */ addi r6, r6, 1
/* 00006284 7C001800 */ cmpw r0, r3
/* 00006288 40820008 */ bne lbl_00006290
/* 0000628C 38A50001 */ addi r5, r5, 1
lbl_00006290:
/* 00006290 8067000C */ lwz r3, 0xc(r7)
/* 00006294 38E7000C */ addi r7, r7, 0xc
/* 00006298 38C60001 */ addi r6, r6, 1
/* 0000629C 7C001800 */ cmpw r0, r3
/* 000062A0 40820008 */ bne lbl_000062A8
/* 000062A4 38A50001 */ addi r5, r5, 1
lbl_000062A8:
/* 000062A8 38E7000C */ addi r7, r7, 0xc
/* 000062AC 38C60001 */ addi r6, r6, 1
/* 000062B0 4200FFAC */ bdnz lbl_0000625C
/* 000062B4 7C682214 */ add r3, r8, r4
/* 000062B8 7C032BD6 */ divw r0, r3, r5
/* 000062BC 7C0029D6 */ mullw r0, r0, r5
/* 000062C0 7C601850 */ subf r3, r0, r3
/* 000062C4 38830003 */ addi r4, r3, 3
/* 000062C8 3860000A */ li r3, 0xa
/* 000062CC 4BFF9E91 */ bl g_debug_set_cursor_pos
/* 000062D0 A81C0000 */ lha r0, 0(r28)
/* 000062D4 7C1B0000 */ cmpw r27, r0
/* 000062D8 40820100 */ bne lbl_000063D8
/* 000062DC 38600002 */ li r3, 2
/* 000062E0 4BFF9E7D */ bl g_debug_set_text_color
/* 000062E4 3800003B */ li r0, 0x3b
/* 000062E8 A8DE0D48 */ lha r6, 0xd48(r30)
/* 000062EC 38800000 */ li r4, 0
/* 000062F0 7C0903A6 */ mtctr r0
/* 000062F4 38A40000 */ addi r5, r4, 0
/* 000062F8 38FD0000 */ addi r7, r29, 0
/* 000062FC 381B0001 */ addi r0, r27, 1
lbl_00006300:
/* 00006300 80670000 */ lwz r3, 0(r7)
/* 00006304 7C061800 */ cmpw r6, r3
/* 00006308 40820008 */ bne lbl_00006310
/* 0000630C 38840001 */ addi r4, r4, 1
lbl_00006310:
/* 00006310 7C002000 */ cmpw r0, r4
/* 00006314 40820014 */ bne lbl_00006328
/* 00006318 1C05000C */ mulli r0, r5, 0xc
/* 0000631C 7C7F0214 */ add r3, r31, r0
/* 00006320 80833774 */ lwz r4, 0x3774(r3)
/* 00006324 480000A4 */ b lbl_000063C8
lbl_00006328:
/* 00006328 8067000C */ lwz r3, 0xc(r7)
/* 0000632C 38E7000C */ addi r7, r7, 0xc
/* 00006330 38A50001 */ addi r5, r5, 1
/* 00006334 7C061800 */ cmpw r6, r3
/* 00006338 40820008 */ bne lbl_00006340
/* 0000633C 38840001 */ addi r4, r4, 1
lbl_00006340:
/* 00006340 7C002000 */ cmpw r0, r4
/* 00006344 40820014 */ bne lbl_00006358
/* 00006348 1C05000C */ mulli r0, r5, 0xc
/* 0000634C 7C7F0214 */ add r3, r31, r0
/* 00006350 80833774 */ lwz r4, 0x3774(r3)
/* 00006354 48000074 */ b lbl_000063C8
lbl_00006358:
/* 00006358 8067000C */ lwz r3, 0xc(r7)
/* 0000635C 38E7000C */ addi r7, r7, 0xc
/* 00006360 38A50001 */ addi r5, r5, 1
/* 00006364 7C061800 */ cmpw r6, r3
/* 00006368 40820008 */ bne lbl_00006370
/* 0000636C 38840001 */ addi r4, r4, 1
lbl_00006370:
/* 00006370 7C002000 */ cmpw r0, r4
/* 00006374 40820014 */ bne lbl_00006388
/* 00006378 1C05000C */ mulli r0, r5, 0xc
/* 0000637C 7C7F0214 */ add r3, r31, r0
/* 00006380 80833774 */ lwz r4, 0x3774(r3)
/* 00006384 48000044 */ b lbl_000063C8
lbl_00006388:
/* 00006388 8067000C */ lwz r3, 0xc(r7)
/* 0000638C 38E7000C */ addi r7, r7, 0xc
/* 00006390 38A50001 */ addi r5, r5, 1
/* 00006394 7C061800 */ cmpw r6, r3
/* 00006398 40820008 */ bne lbl_000063A0
/* 0000639C 38840001 */ addi r4, r4, 1
lbl_000063A0:
/* 000063A0 7C002000 */ cmpw r0, r4
/* 000063A4 40820014 */ bne lbl_000063B8
/* 000063A8 1C05000C */ mulli r0, r5, 0xc
/* 000063AC 7C7F0214 */ add r3, r31, r0
/* 000063B0 80833774 */ lwz r4, 0x3774(r3)
/* 000063B4 48000014 */ b lbl_000063C8
lbl_000063B8:
/* 000063B8 38E7000C */ addi r7, r7, 0xc
/* 000063BC 38A50001 */ addi r5, r5, 1
/* 000063C0 4200FF40 */ bdnz lbl_00006300
/* 000063C4 38800000 */ li r4, 0
lbl_000063C8:
/* 000063C8 4CC63182 */ crclr 6
/* 000063CC 387F4354 */ addi r3, r31, 0x4354
/* 000063D0 4BFF9D8D */ bl g_debug_printf
/* 000063D4 48000130 */ b lbl_00006504
lbl_000063D8:
/* 000063D8 A81E0D44 */ lha r0, 0xd44(r30)
/* 000063DC 2C000001 */ cmpwi r0, 1
/* 000063E0 40820124 */ bne lbl_00006504
/* 000063E4 3800003B */ li r0, 0x3b
/* 000063E8 A8DE0D48 */ lha r6, 0xd48(r30)
/* 000063EC 38800000 */ li r4, 0
/* 000063F0 7C0903A6 */ mtctr r0
/* 000063F4 38A40000 */ addi r5, r4, 0
/* 000063F8 38FD0000 */ addi r7, r29, 0
/* 000063FC 381B0001 */ addi r0, r27, 1
lbl_00006400:
/* 00006400 80670000 */ lwz r3, 0(r7)
/* 00006404 7C061800 */ cmpw r6, r3
/* 00006408 40820008 */ bne lbl_00006410
/* 0000640C 38840001 */ addi r4, r4, 1
lbl_00006410:
/* 00006410 7C002000 */ cmpw r0, r4
/* 00006414 40820014 */ bne lbl_00006428
/* 00006418 1C05000C */ mulli r0, r5, 0xc
/* 0000641C 7C7F0214 */ add r3, r31, r0
/* 00006420 80833774 */ lwz r4, 0x3774(r3)
/* 00006424 480000A4 */ b lbl_000064C8
lbl_00006428:
/* 00006428 8067000C */ lwz r3, 0xc(r7)
/* 0000642C 38E7000C */ addi r7, r7, 0xc
/* 00006430 38A50001 */ addi r5, r5, 1
/* 00006434 7C061800 */ cmpw r6, r3
/* 00006438 40820008 */ bne lbl_00006440
/* 0000643C 38840001 */ addi r4, r4, 1
lbl_00006440:
/* 00006440 7C002000 */ cmpw r0, r4
/* 00006444 40820014 */ bne lbl_00006458
/* 00006448 1C05000C */ mulli r0, r5, 0xc
/* 0000644C 7C7F0214 */ add r3, r31, r0
/* 00006450 80833774 */ lwz r4, 0x3774(r3)
/* 00006454 48000074 */ b lbl_000064C8
lbl_00006458:
/* 00006458 8067000C */ lwz r3, 0xc(r7)
/* 0000645C 38E7000C */ addi r7, r7, 0xc
/* 00006460 38A50001 */ addi r5, r5, 1
/* 00006464 7C061800 */ cmpw r6, r3
/* 00006468 40820008 */ bne lbl_00006470
/* 0000646C 38840001 */ addi r4, r4, 1
lbl_00006470:
/* 00006470 7C002000 */ cmpw r0, r4
/* 00006474 40820014 */ bne lbl_00006488
/* 00006478 1C05000C */ mulli r0, r5, 0xc
/* 0000647C 7C7F0214 */ add r3, r31, r0
/* 00006480 80833774 */ lwz r4, 0x3774(r3)
/* 00006484 48000044 */ b lbl_000064C8
lbl_00006488:
/* 00006488 8067000C */ lwz r3, 0xc(r7)
/* 0000648C 38E7000C */ addi r7, r7, 0xc
/* 00006490 38A50001 */ addi r5, r5, 1
/* 00006494 7C061800 */ cmpw r6, r3
/* 00006498 40820008 */ bne lbl_000064A0
/* 0000649C 38840001 */ addi r4, r4, 1
lbl_000064A0:
/* 000064A0 7C002000 */ cmpw r0, r4
/* 000064A4 40820014 */ bne lbl_000064B8
/* 000064A8 1C05000C */ mulli r0, r5, 0xc
/* 000064AC 7C7F0214 */ add r3, r31, r0
/* 000064B0 80833774 */ lwz r4, 0x3774(r3)
/* 000064B4 48000014 */ b lbl_000064C8
lbl_000064B8:
/* 000064B8 38E7000C */ addi r7, r7, 0xc
/* 000064BC 38A50001 */ addi r5, r5, 1
/* 000064C0 4200FF40 */ bdnz lbl_00006400
/* 000064C4 38800000 */ li r4, 0
lbl_000064C8:
/* 000064C8 4CC63182 */ crclr 6
/* 000064CC 387F435C */ addi r3, r31, 0x435c
/* 000064D0 4BFF9C8D */ bl g_debug_printf
/* 000064D4 3860000D */ li r3, 0xd
/* 000064D8 38800002 */ li r4, 2
/* 000064DC 4BFF9C81 */ bl g_debug_set_cursor_pos
/* 000064E0 387F4364 */ addi r3, r31, 0x4364
/* 000064E4 4CC63182 */ crclr 6
/* 000064E8 4BFF9C75 */ bl g_debug_printf
/* 000064EC 3860000D */ li r3, 0xd
/* 000064F0 38800017 */ li r4, 0x17
/* 000064F4 4BFF9C69 */ bl g_debug_set_cursor_pos
/* 000064F8 387F4368 */ addi r3, r31, 0x4368
/* 000064FC 4CC63182 */ crclr 6
/* 00006500 4BFF9C5D */ bl g_debug_printf
lbl_00006504:
/* 00006504 38600000 */ li r3, 0
/* 00006508 4BFF9C55 */ bl g_debug_set_text_color
lbl_0000650C:
/* 0000650C 3B7B0001 */ addi r27, r27, 1
lbl_00006510:
/* 00006510 3860003B */ li r3, 0x3b
/* 00006514 A81E0D48 */ lha r0, 0xd48(r30)
/* 00006518 38800000 */ li r4, 0
/* 0000651C 7C6903A6 */ mtctr r3
/* 00006520 38A40000 */ addi r5, r4, 0
/* 00006524 38DD0000 */ addi r6, r29, 0
lbl_00006528:
/* 00006528 80660000 */ lwz r3, 0(r6)
/* 0000652C 7C001800 */ cmpw r0, r3
/* 00006530 40820008 */ bne lbl_00006538
/* 00006534 38840001 */ addi r4, r4, 1
lbl_00006538:
/* 00006538 8466000C */ lwzu r3, 0xc(r6)
/* 0000653C 7C001800 */ cmpw r0, r3
/* 00006540 40820008 */ bne lbl_00006548
/* 00006544 38840001 */ addi r4, r4, 1
lbl_00006548:
/* 00006548 8466000C */ lwzu r3, 0xc(r6)
/* 0000654C 38A50001 */ addi r5, r5, 1
/* 00006550 7C001800 */ cmpw r0, r3
/* 00006554 40820008 */ bne lbl_0000655C
/* 00006558 38840001 */ addi r4, r4, 1
lbl_0000655C:
/* 0000655C 8466000C */ lwzu r3, 0xc(r6)
/* 00006560 38A50001 */ addi r5, r5, 1
/* 00006564 7C001800 */ cmpw r0, r3
/* 00006568 40820008 */ bne lbl_00006570
/* 0000656C 38840001 */ addi r4, r4, 1
lbl_00006570:
/* 00006570 38C6000C */ addi r6, r6, 0xc
/* 00006574 38A50001 */ addi r5, r5, 1
/* 00006578 4200FFB0 */ bdnz lbl_00006528
/* 0000657C 7C1B2000 */ cmpw r27, r4
/* 00006580 4180FB6C */ blt lbl_000060EC
lbl_00006584:
/* 00006584 A81E0D44 */ lha r0, 0xd44(r30)
/* 00006588 2C000002 */ cmpwi r0, 2
/* 0000658C 41800050 */ blt lbl_000065DC
/* 00006590 38600013 */ li r3, 0x13
/* 00006594 38800003 */ li r4, 3
/* 00006598 4BFF9BC5 */ bl g_debug_set_cursor_pos
/* 0000659C 80FE0190 */ lwz r7, 0x190(r30)
/* 000065A0 28070000 */ cmplwi r7, 0
/* 000065A4 40820014 */ bne lbl_000065B8
/* 000065A8 387F436C */ addi r3, r31, 0x436c
/* 000065AC 4CC63182 */ crclr 6
/* 000065B0 4BFF9BAD */ bl g_debug_printf
/* 000065B4 48000028 */ b lbl_000065DC
lbl_000065B8:
/* 000065B8 809E05A8 */ lwz r4, 0x5a8(r30)
/* 000065BC 387F4378 */ addi r3, r31, 0x4378
/* 000065C0 80A70008 */ lwz r5, 8(r7)
/* 000065C4 4CC63182 */ crclr 6
/* 000065C8 54801838 */ slwi r0, r4, 3
/* 000065CC 7CC50214 */ add r6, r5, r0
/* 000065D0 80A70000 */ lwz r5, 0(r7)
/* 000065D4 80C60004 */ lwz r6, 4(r6)
/* 000065D8 4BFF9B85 */ bl g_debug_printf
lbl_000065DC:
/* 000065DC BB61002C */ lmw r27, 0x2c(r1)
/* 000065E0 80010044 */ lwz r0, 0x44(r1)
/* 000065E4 38210040 */ addi r1, r1, 0x40
/* 000065E8 7C0803A6 */ mtlr r0
/* 000065EC 4E800020 */ blr 
lbl_000065F0:
/* 000065F0 7C0802A6 */ mflr r0
/* 000065F4 3C600000 */ lis r3, lbl_0000FE78@ha
/* 000065F8 90010004 */ stw r0, 4(r1)
/* 000065FC 9421FF20 */ stwu r1, -0xe0(r1)
/* 00006600 BF2100C4 */ stmw r25, 0xc4(r1)
/* 00006604 3BC30000 */ addi r30, r3, lbl_0000FE78@l
/* 00006608 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000660C 3BE30000 */ addi r31, r3, currentCameraStructPtr@l
/* 00006610 801E019C */ lwz r0, 0x19c(r30)
/* 00006614 9001009C */ stw r0, 0x9c(r1)
/* 00006618 801E01A0 */ lwz r0, 0x1a0(r30)
/* 0000661C 90010098 */ stw r0, 0x98(r1)
/* 00006620 801E01A4 */ lwz r0, 0x1a4(r30)
/* 00006624 90010094 */ stw r0, 0x94(r1)
/* 00006628 801E01A8 */ lwz r0, 0x1a8(r30)
/* 0000662C 90010090 */ stw r0, 0x90(r1)
/* 00006630 801E01AC */ lwz r0, 0x1ac(r30)
/* 00006634 9001008C */ stw r0, 0x8c(r1)
/* 00006638 807F0000 */ lwz r3, 0(r31)
/* 0000663C 3863000C */ addi r3, r3, 0xc
/* 00006640 4BFF9B1D */ bl mathutil_mtxA_from_translate
/* 00006644 3C600000 */ lis r3, globalFrameCounter@ha
/* 00006648 C05E01B0 */ lfs f2, 0x1b0(r30)
/* 0000664C 3B830000 */ addi r28, r3, globalFrameCounter@l
/* 00006650 801C0000 */ lwz r0, 0(r28)
/* 00006654 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00006658 3FA04330 */ lis r29, 0x4330
/* 0000665C C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 00006660 5400402E */ slwi r0, r0, 8
/* 00006664 900100BC */ stw r0, 0xbc(r1)
/* 00006668 93A100B8 */ stw r29, 0xb8(r1)
/* 0000666C C80100B8 */ lfd f0, 0xb8(r1)
/* 00006670 EC000828 */ fsubs f0, f0, f1
/* 00006674 EC020032 */ fmuls f0, f2, f0
/* 00006678 FC00001E */ fctiwz f0, f0
/* 0000667C D80100B0 */ stfd f0, 0xb0(r1)
/* 00006680 806100B4 */ lwz r3, 0xb4(r1)
/* 00006684 4BFF9AD9 */ bl mathutil_mtxA_rotate_y
/* 00006688 3B410040 */ addi r26, r1, 0x40
/* 0000668C C0DE009C */ lfs f6, 0x9c(r30)
/* 00006690 3F60E000 */ lis r27, 0xe000
/* 00006694 C0BB0008 */ lfs f5, 8(r27)
/* 00006698 C09B000C */ lfs f4, 0xc(r27)
/* 0000669C C07B0018 */ lfs f3, 0x18(r27)
/* 000066A0 C05B001C */ lfs f2, 0x1c(r27)
/* 000066A4 C03B0028 */ lfs f1, 0x28(r27)
/* 000066A8 C01B002C */ lfs f0, 0x2c(r27)
/* 000066AC ECA521BA */ fmadds f5, f5, f6, f4
/* 000066B0 D0A10040 */ stfs f5, 0x40(r1)
/* 000066B4 EC6311BA */ fmadds f3, f3, f6, f2
/* 000066B8 D0610044 */ stfs f3, 0x44(r1)
/* 000066BC EC2101BA */ fmadds f1, f1, f6, f0
/* 000066C0 D0210048 */ stfs f1, 0x48(r1)
/* 000066C4 807F0000 */ lwz r3, 0(r31)
/* 000066C8 3863000C */ addi r3, r3, 0xc
/* 000066CC 4BFF9A91 */ bl mathutil_mtxA_from_translate
/* 000066D0 801C0000 */ lwz r0, 0(r28)
/* 000066D4 5403402E */ slwi r3, r0, 8
/* 000066D8 4BFF9A85 */ bl mathutil_mtxA_rotate_x
/* 000066DC 3B210034 */ addi r25, r1, 0x34
/* 000066E0 C0DE01B4 */ lfs f6, 0x1b4(r30)
/* 000066E4 C0BB0008 */ lfs f5, 8(r27)
/* 000066E8 C09B000C */ lfs f4, 0xc(r27)
/* 000066EC C07B0018 */ lfs f3, 0x18(r27)
/* 000066F0 C05B001C */ lfs f2, 0x1c(r27)
/* 000066F4 C03B0028 */ lfs f1, 0x28(r27)
/* 000066F8 C01B002C */ lfs f0, 0x2c(r27)
/* 000066FC ECA521BA */ fmadds f5, f5, f6, f4
/* 00006700 D0A10034 */ stfs f5, 0x34(r1)
/* 00006704 EC6311BA */ fmadds f3, f3, f6, f2
/* 00006708 D0610038 */ stfs f3, 0x38(r1)
/* 0000670C EC2101BA */ fmadds f1, f1, f6, f0
/* 00006710 D021003C */ stfs f1, 0x3c(r1)
/* 00006714 807F0000 */ lwz r3, 0(r31)
/* 00006718 3863000C */ addi r3, r3, 0xc
/* 0000671C 4BFF9A41 */ bl mathutil_mtxA_from_translate
/* 00006720 801C0000 */ lwz r0, 0(r28)
/* 00006724 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00006728 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 0000672C 5400402E */ slwi r0, r0, 8
/* 00006730 C05E01B8 */ lfs f2, 0x1b8(r30)
/* 00006734 900100AC */ stw r0, 0xac(r1)
/* 00006738 93A100A8 */ stw r29, 0xa8(r1)
/* 0000673C C80100A8 */ lfd f0, 0xa8(r1)
/* 00006740 EC000828 */ fsubs f0, f0, f1
/* 00006744 EC020032 */ fmuls f0, f2, f0
/* 00006748 FC00001E */ fctiwz f0, f0
/* 0000674C D80100A0 */ stfd f0, 0xa0(r1)
/* 00006750 806100A4 */ lwz r3, 0xa4(r1)
/* 00006754 4BFF9A09 */ bl mathutil_mtxA_rotate_z
/* 00006758 C03E0060 */ lfs f1, 0x60(r30)
/* 0000675C 38610028 */ addi r3, r1, 0x28
/* 00006760 C05E009C */ lfs f2, 0x9c(r30)
/* 00006764 FC600890 */ fmr f3, f1
/* 00006768 4BFF99F5 */ bl mathutil_mtxA_tf_point_xyz
/* 0000676C C03E0060 */ lfs f1, 0x60(r30)
/* 00006770 3861004C */ addi r3, r1, 0x4c
/* 00006774 38800000 */ li r4, 0
/* 00006778 4BFF99E5 */ bl GXInitLightSpot
/* 0000677C C03E018C */ lfs f1, 0x18c(r30)
/* 00006780 3861004C */ addi r3, r1, 0x4c
/* 00006784 C05E01BC */ lfs f2, 0x1bc(r30)
/* 00006788 38800003 */ li r4, 3
/* 0000678C 4BFF99D1 */ bl GXInitLightDistAttn
/* 00006790 387A0000 */ addi r3, r26, 0
/* 00006794 3881001C */ addi r4, r1, 0x1c
/* 00006798 4BFF99C5 */ bl mathutil_mtxA_tf_point
/* 0000679C C021001C */ lfs f1, 0x1c(r1)
/* 000067A0 3861004C */ addi r3, r1, 0x4c
/* 000067A4 C0410020 */ lfs f2, 0x20(r1)
/* 000067A8 C0610024 */ lfs f3, 0x24(r1)
/* 000067AC 4BFF99B1 */ bl GXInitLightPos
/* 000067B0 80010090 */ lwz r0, 0x90(r1)
/* 000067B4 38810018 */ addi r4, r1, 0x18
/* 000067B8 3861004C */ addi r3, r1, 0x4c
/* 000067BC 90010018 */ stw r0, 0x18(r1)
/* 000067C0 4BFF999D */ bl GXInitLightColor
/* 000067C4 3861004C */ addi r3, r1, 0x4c
/* 000067C8 38800004 */ li r4, 4
/* 000067CC 4BFF9991 */ bl GXLoadLightObjImm
/* 000067D0 C03E0060 */ lfs f1, 0x60(r30)
/* 000067D4 3861004C */ addi r3, r1, 0x4c
/* 000067D8 38800000 */ li r4, 0
/* 000067DC 4BFF9981 */ bl GXInitLightSpot
/* 000067E0 C03E018C */ lfs f1, 0x18c(r30)
/* 000067E4 3861004C */ addi r3, r1, 0x4c
/* 000067E8 C05E01BC */ lfs f2, 0x1bc(r30)
/* 000067EC 38800003 */ li r4, 3
/* 000067F0 4BFF996D */ bl GXInitLightDistAttn
/* 000067F4 38790000 */ addi r3, r25, 0
/* 000067F8 3881001C */ addi r4, r1, 0x1c
/* 000067FC 4BFF9961 */ bl mathutil_mtxA_tf_point
/* 00006800 C021001C */ lfs f1, 0x1c(r1)
/* 00006804 3861004C */ addi r3, r1, 0x4c
/* 00006808 C0410020 */ lfs f2, 0x20(r1)
/* 0000680C C0610024 */ lfs f3, 0x24(r1)
/* 00006810 4BFF994D */ bl GXInitLightPos
/* 00006814 8001008C */ lwz r0, 0x8c(r1)
/* 00006818 38810014 */ addi r4, r1, 0x14
/* 0000681C 3861004C */ addi r3, r1, 0x4c
/* 00006820 90010014 */ stw r0, 0x14(r1)
/* 00006824 4BFF9939 */ bl GXInitLightColor
/* 00006828 3861004C */ addi r3, r1, 0x4c
/* 0000682C 38800008 */ li r4, 8
/* 00006830 4BFF992D */ bl GXLoadLightObjImm
/* 00006834 C03E0060 */ lfs f1, 0x60(r30)
/* 00006838 3861004C */ addi r3, r1, 0x4c
/* 0000683C 38800000 */ li r4, 0
/* 00006840 4BFF991D */ bl GXInitLightSpot
/* 00006844 C03E018C */ lfs f1, 0x18c(r30)
/* 00006848 3861004C */ addi r3, r1, 0x4c
/* 0000684C C05E01BC */ lfs f2, 0x1bc(r30)
/* 00006850 38800003 */ li r4, 3
/* 00006854 4BFF9909 */ bl GXInitLightDistAttn
/* 00006858 38610028 */ addi r3, r1, 0x28
/* 0000685C 3881001C */ addi r4, r1, 0x1c
/* 00006860 4BFF98FD */ bl mathutil_mtxA_tf_point
/* 00006864 C021001C */ lfs f1, 0x1c(r1)
/* 00006868 3861004C */ addi r3, r1, 0x4c
/* 0000686C C0410020 */ lfs f2, 0x20(r1)
/* 00006870 C0610024 */ lfs f3, 0x24(r1)
/* 00006874 4BFF98E9 */ bl GXInitLightPos
/* 00006878 80010094 */ lwz r0, 0x94(r1)
/* 0000687C 38810010 */ addi r4, r1, 0x10
/* 00006880 3861004C */ addi r3, r1, 0x4c
/* 00006884 90010010 */ stw r0, 0x10(r1)
/* 00006888 4BFF98D5 */ bl GXInitLightColor
/* 0000688C 3861004C */ addi r3, r1, 0x4c
/* 00006890 38800010 */ li r4, 0x10
/* 00006894 4BFF98C9 */ bl GXLoadLightObjImm
/* 00006898 8001009C */ lwz r0, 0x9c(r1)
/* 0000689C 3881000C */ addi r4, r1, 0xc
/* 000068A0 38600000 */ li r3, 0
/* 000068A4 9001000C */ stw r0, 0xc(r1)
/* 000068A8 4BFF98B5 */ bl GXSetChanMatColor
/* 000068AC 80010098 */ lwz r0, 0x98(r1)
/* 000068B0 38810008 */ addi r4, r1, 8
/* 000068B4 38600000 */ li r3, 0
/* 000068B8 90010008 */ stw r0, 8(r1)
/* 000068BC 4BFF98A1 */ bl GXSetChanAmbColor
/* 000068C0 38600004 */ li r3, 4
/* 000068C4 38800001 */ li r4, 1
/* 000068C8 38A00000 */ li r5, 0
/* 000068CC 38C00000 */ li r6, 0
/* 000068D0 38E0001C */ li r7, 0x1c
/* 000068D4 39000002 */ li r8, 2
/* 000068D8 39200002 */ li r9, 2
/* 000068DC 4BFF9881 */ bl GXSetChanCtrl
/* 000068E0 38600001 */ li r3, 1
/* 000068E4 4BFF9879 */ bl GXSetNumChans
/* 000068E8 38600000 */ li r3, 0
/* 000068EC 388000FF */ li r4, 0xff
/* 000068F0 38A000FF */ li r5, 0xff
/* 000068F4 38C00004 */ li r6, 4
/* 000068F8 4BFF9865 */ bl func_8009EFF4
/* 000068FC 38600000 */ li r3, 0
/* 00006900 38800004 */ li r4, 4
/* 00006904 4BFF9859 */ bl func_8009EA30
/* 00006908 38600000 */ li r3, 0
/* 0000690C 4BFF9851 */ bl GXSetNumTexGens
/* 00006910 38600001 */ li r3, 1
/* 00006914 4BFF9849 */ bl func_8009F2C8
/* 00006918 807F0000 */ lwz r3, 0(r31)
/* 0000691C 3863000C */ addi r3, r3, 0xc
/* 00006920 4BFF983D */ bl mathutil_mtxA_from_mtxB_translate
/* 00006924 C03E01C0 */ lfs f1, 0x1c0(r30)
/* 00006928 4BFF9835 */ bl mathutil_mtxA_scale_s
/* 0000692C 3C600000 */ lis r3, mathutilData@ha
/* 00006930 3BC30000 */ addi r30, r3, mathutilData@l
/* 00006934 807E0000 */ lwz r3, 0(r30)
/* 00006938 38800000 */ li r4, 0
/* 0000693C 4BFF9821 */ bl GXLoadNrmMtxImm
/* 00006940 807E0000 */ lwz r3, 0(r30)
/* 00006944 38800000 */ li r4, 0
/* 00006948 4BFF9815 */ bl GXLoadPosMtxImm
/* 0000694C 38600000 */ li r3, 0
/* 00006950 4BFF980D */ bl GXSetCurrentMtx
/* 00006954 38600008 */ li r3, 8
/* 00006958 38800008 */ li r4, 8
/* 0000695C 4BFF9801 */ bl GXDrawSphere
/* 00006960 BB2100C4 */ lmw r25, 0xc4(r1)
/* 00006964 800100E4 */ lwz r0, 0xe4(r1)
/* 00006968 382100E0 */ addi r1, r1, 0xe0
/* 0000696C 7C0803A6 */ mtlr r0
/* 00006970 4E800020 */ blr 
lbl_00006974:
/* 00006974 7C0802A6 */ mflr r0
/* 00006978 3C600000 */ lis r3, stageHeap@ha
/* 0000697C 90010004 */ stw r0, 4(r1)
/* 00006980 3C800000 */ lis r4, lbl_10000000@ha
/* 00006984 9421FFE0 */ stwu r1, -0x20(r1)
/* 00006988 BF61000C */ stmw r27, 0xc(r1)
/* 0000698C 3BE30000 */ addi r31, r3, stageHeap@l
/* 00006990 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00006994 807F0000 */ lwz r3, 0(r31)
/* 00006998 4BFF97C5 */ bl OSSetCurrentHeap
/* 0000699C 7C601B78 */ mr r0, r3
/* 000069A0 807F0000 */ lwz r3, 0(r31)
/* 000069A4 7C1C0378 */ mr r28, r0
/* 000069A8 4BFF97B5 */ bl OSSetCurrentHeap
/* 000069AC 801E018C */ lwz r0, 0x18c(r30)
/* 000069B0 3BE30000 */ addi r31, r3, 0
/* 000069B4 28000000 */ cmplwi r0, 0
/* 000069B8 40820010 */ bne lbl_000069C8
/* 000069BC 801E0190 */ lwz r0, 0x190(r30)
/* 000069C0 28000000 */ cmplwi r0, 0
/* 000069C4 4182001C */ beq lbl_000069E0
lbl_000069C8:
/* 000069C8 3C600000 */ lis r3, gfxBufferInfo@ha
/* 000069CC 38630000 */ addi r3, r3, gfxBufferInfo@l
/* 000069D0 80630000 */ lwz r3, 0(r3)
/* 000069D4 80630000 */ lwz r3, 0(r3)
/* 000069D8 4BFF9785 */ bl VISetNextFrameBuffer
/* 000069DC 4BFF9781 */ bl VIWaitForRetrace
lbl_000069E0:
/* 000069E0 807E018C */ lwz r3, 0x18c(r30)
/* 000069E4 28030000 */ cmplwi r3, 0
/* 000069E8 41820010 */ beq lbl_000069F8
/* 000069EC 4BFF9771 */ bl free_tpl
/* 000069F0 38000000 */ li r0, 0
/* 000069F4 901E018C */ stw r0, 0x18c(r30)
lbl_000069F8:
/* 000069F8 807E0190 */ lwz r3, 0x190(r30)
/* 000069FC 28030000 */ cmplwi r3, 0
/* 00006A00 41820010 */ beq lbl_00006A10
/* 00006A04 4BFF9759 */ bl free_gma
/* 00006A08 38000000 */ li r0, 0
/* 00006A0C 901E0190 */ stw r0, 0x190(r30)
lbl_00006A10:
/* 00006A10 7FE3FB78 */ mr r3, r31
/* 00006A14 4BFF9749 */ bl OSSetCurrentHeap
/* 00006A18 3B600000 */ li r27, 0
/* 00006A1C 5760103A */ slwi r0, r27, 2
/* 00006A20 7FBE0214 */ add r29, r30, r0
/* 00006A24 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00006A28 3BBD01A0 */ addi r29, r29, 0x1a0
/* 00006A2C 3BE30000 */ addi r31, r3, __OSCurrHeap@l
/* 00006A30 48000018 */ b lbl_00006A48
lbl_00006A34:
/* 00006A34 807F0000 */ lwz r3, 0(r31)
/* 00006A38 809D0000 */ lwz r4, 0(r29)
/* 00006A3C 4BFF9721 */ bl OSFreeToHeap
/* 00006A40 3BBD0004 */ addi r29, r29, 4
/* 00006A44 3B7B0001 */ addi r27, r27, 1
lbl_00006A48:
/* 00006A48 801E05A0 */ lwz r0, 0x5a0(r30)
/* 00006A4C 7C1B0040 */ cmplw r27, r0
/* 00006A50 4180FFE4 */ blt lbl_00006A34
/* 00006A54 7F83E378 */ mr r3, r28
/* 00006A58 4BFF9705 */ bl OSSetCurrentHeap
/* 00006A5C BB61000C */ lmw r27, 0xc(r1)
/* 00006A60 80010024 */ lwz r0, 0x24(r1)
/* 00006A64 38210020 */ addi r1, r1, 0x20
/* 00006A68 7C0803A6 */ mtlr r0
/* 00006A6C 4E800020 */ blr 
lbl_00006A70:
/* 00006A70 7C0802A6 */ mflr r0
/* 00006A74 3C600000 */ lis r3, gamePauseStatus@ha
/* 00006A78 90010004 */ stw r0, 4(r1)
/* 00006A7C 3C800000 */ lis r4, lbl_0000FE78@ha
/* 00006A80 9421FFD8 */ stwu r1, -0x28(r1)
/* 00006A84 93E10024 */ stw r31, 0x24(r1)
/* 00006A88 93C10020 */ stw r30, 0x20(r1)
/* 00006A8C 93A1001C */ stw r29, 0x1c(r1)
/* 00006A90 3BA40000 */ addi r29, r4, lbl_0000FE78@l
/* 00006A94 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00006A98 3C600000 */ lis r3, lbl_10000000@ha
/* 00006A9C 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00006AA0 7000000A */ andi. r0, r0, 0xa
/* 00006AA4 408200D8 */ bne lbl_00006B7C
/* 00006AA8 3BE00000 */ li r31, 0
/* 00006AAC 93FE05A8 */ stw r31, 0x5a8(r30)
/* 00006AB0 3C600000 */ lis r3, lbl_00013A1C@ha
/* 00006AB4 38630000 */ addi r3, r3, lbl_00013A1C@l
/* 00006AB8 93FE05AC */ stw r31, 0x5ac(r30)
/* 00006ABC 38630004 */ addi r3, r3, 4
/* 00006AC0 B3FE0D40 */ sth r31, 0xd40(r30)
/* 00006AC4 B3FE0D42 */ sth r31, 0xd42(r30)
/* 00006AC8 4BFFEB21 */ bl lbl_000055E8
/* 00006ACC 3860000F */ li r3, 0xf
/* 00006AD0 4BFF968D */ bl event_start
/* 00006AD4 38600002 */ li r3, 2
/* 00006AD8 4BFF9685 */ bl camera_set_state
/* 00006ADC 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00006AE0 C01D0060 */ lfs f0, 0x60(r29)
/* 00006AE4 39030000 */ addi r8, r3, currentCameraStructPtr@l
/* 00006AE8 80680000 */ lwz r3, 0(r8)
/* 00006AEC 3CA00000 */ lis r5, lbl_00006974@ha
/* 00006AF0 38C00001 */ li r6, 1
/* 00006AF4 D0030000 */ stfs f0, 0(r3)
/* 00006AF8 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 00006AFC 38A50000 */ addi r5, r5, lbl_00006974@l
/* 00006B00 C01D01C4 */ lfs f0, 0x1c4(r29)
/* 00006B04 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00006B08 80E80000 */ lwz r7, 0(r8)
/* 00006B0C 3800007D */ li r0, 0x7d
/* 00006B10 D0070004 */ stfs f0, 4(r7)
/* 00006B14 C01D0178 */ lfs f0, 0x178(r29)
/* 00006B18 80E80000 */ lwz r7, 0(r8)
/* 00006B1C D0070008 */ stfs f0, 8(r7)
/* 00006B20 C01D0060 */ lfs f0, 0x60(r29)
/* 00006B24 80E80000 */ lwz r7, 0(r8)
/* 00006B28 D007000C */ stfs f0, 0xc(r7)
/* 00006B2C C01D0060 */ lfs f0, 0x60(r29)
/* 00006B30 80E80000 */ lwz r7, 0(r8)
/* 00006B34 D0070010 */ stfs f0, 0x10(r7)
/* 00006B38 C01D0060 */ lfs f0, 0x60(r29)
/* 00006B3C 80E80000 */ lwz r7, 0(r8)
/* 00006B40 D0070014 */ stfs f0, 0x14(r7)
/* 00006B44 B3FE0D48 */ sth r31, 0xd48(r30)
/* 00006B48 B3FE0D54 */ sth r31, 0xd54(r30)
/* 00006B4C B3FE0D4A */ sth r31, 0xd4a(r30)
/* 00006B50 B3FE0D56 */ sth r31, 0xd56(r30)
/* 00006B54 B3FE0D4C */ sth r31, 0xd4c(r30)
/* 00006B58 B3FE0D58 */ sth r31, 0xd58(r30)
/* 00006B5C B3FE0D44 */ sth r31, 0xd44(r30)
/* 00006B60 98DE0D5A */ stb r6, 0xd5a(r30)
/* 00006B64 98DE0D5B */ stb r6, 0xd5b(r30)
/* 00006B68 9BFE0D4E */ stb r31, 0xd4e(r30)
/* 00006B6C C01D0060 */ lfs f0, 0x60(r29)
/* 00006B70 D01E0D50 */ stfs f0, 0xd50(r30)
/* 00006B74 90A40000 */ stw r5, lbl_802F1B7C@l(r4)
/* 00006B78 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00006B7C:
/* 00006B7C 8001002C */ lwz r0, 0x2c(r1)
/* 00006B80 83E10024 */ lwz r31, 0x24(r1)
/* 00006B84 83C10020 */ lwz r30, 0x20(r1)
/* 00006B88 7C0803A6 */ mtlr r0
/* 00006B8C 83A1001C */ lwz r29, 0x1c(r1)
/* 00006B90 38210028 */ addi r1, r1, 0x28
/* 00006B94 4E800020 */ blr 
lbl_00006B98:
/* 00006B98 7C0802A6 */ mflr r0
/* 00006B9C 3C600000 */ lis r3, gamePauseStatus@ha
/* 00006BA0 90010004 */ stw r0, 4(r1)
/* 00006BA4 3C800000 */ lis r4, lbl_0000FE78@ha
/* 00006BA8 9421FFD8 */ stwu r1, -0x28(r1)
/* 00006BAC 93E10024 */ stw r31, 0x24(r1)
/* 00006BB0 93C10020 */ stw r30, 0x20(r1)
/* 00006BB4 3BC40000 */ addi r30, r4, lbl_0000FE78@l
/* 00006BB8 93A1001C */ stw r29, 0x1c(r1)
/* 00006BBC 3BA00000 */ li r29, 0
/* 00006BC0 80030000 */ lwz r0, gamePauseStatus@l(r3)
/* 00006BC4 3C600000 */ lis r3, lbl_10000000@ha
/* 00006BC8 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00006BCC 7000000A */ andi. r0, r0, 0xa
/* 00006BD0 40820800 */ bne lbl_000073D0
/* 00006BD4 4BFFEBED */ bl lbl_000057C0
/* 00006BD8 3C600000 */ lis r3, controllerInfo@ha
/* 00006BDC 38630000 */ addi r3, r3, controllerInfo@l
/* 00006BE0 A0030018 */ lhz r0, 0x18(r3)
/* 00006BE4 54030529 */ rlwinm. r3, r0, 0, 0x14, 0x14
/* 00006BE8 4182001C */ beq lbl_00006C04
/* 00006BEC 887F0D5A */ lbz r3, 0xd5a(r31)
/* 00006BF0 68630001 */ xori r3, r3, 1
/* 00006BF4 987F0D5A */ stb r3, 0xd5a(r31)
/* 00006BF8 887F0D5B */ lbz r3, 0xd5b(r31)
/* 00006BFC 68630001 */ xori r3, r3, 1
/* 00006C00 987F0D5B */ stb r3, 0xd5b(r31)
lbl_00006C04:
/* 00006C04 540306F7 */ rlwinm. r3, r0, 0, 0x1b, 0x1b
/* 00006C08 41820010 */ beq lbl_00006C18
/* 00006C0C 887F0D4E */ lbz r3, 0xd4e(r31)
/* 00006C10 68630001 */ xori r3, r3, 1
/* 00006C14 987F0D4E */ stb r3, 0xd4e(r31)
lbl_00006C18:
/* 00006C18 3C600000 */ lis r3, controllerInfo@ha
/* 00006C1C 38630000 */ addi r3, r3, controllerInfo@l
/* 00006C20 A0630000 */ lhz r3, 0(r3)
/* 00006C24 5464056B */ rlwinm. r4, r3, 0, 0x15, 0x15
/* 00006C28 4182000C */ beq lbl_00006C34
/* 00006C2C 540405EF */ rlwinm. r4, r0, 0, 0x17, 0x17
/* 00006C30 40820014 */ bne lbl_00006C44
lbl_00006C34:
/* 00006C34 546405EF */ rlwinm. r4, r3, 0, 0x17, 0x17
/* 00006C38 4182001C */ beq lbl_00006C54
/* 00006C3C 5404056B */ rlwinm. r4, r0, 0, 0x15, 0x15
/* 00006C40 41820014 */ beq lbl_00006C54
lbl_00006C44:
/* 00006C44 809F05AC */ lwz r4, 0x5ac(r31)
/* 00006C48 68840001 */ xori r4, r4, 1
/* 00006C4C 909F05AC */ stw r4, 0x5ac(r31)
/* 00006C50 48000054 */ b lbl_00006CA4
lbl_00006C54:
/* 00006C54 540405EF */ rlwinm. r4, r0, 0, 0x17, 0x17
/* 00006C58 4182001C */ beq lbl_00006C74
/* 00006C5C A89F0D44 */ lha r4, 0xd44(r31)
/* 00006C60 2C040002 */ cmpwi r4, 2
/* 00006C64 40800040 */ bge lbl_00006CA4
/* 00006C68 38840001 */ addi r4, r4, 1
/* 00006C6C B09F0D44 */ sth r4, 0xd44(r31)
/* 00006C70 48000034 */ b lbl_00006CA4
lbl_00006C74:
/* 00006C74 540405AD */ rlwinm. r4, r0, 0, 0x16, 0x16
/* 00006C78 4182002C */ beq lbl_00006CA4
/* 00006C7C A8BF0D44 */ lha r5, 0xd44(r31)
/* 00006C80 7CA40735 */ extsh. r4, r5
/* 00006C84 40810020 */ ble lbl_00006CA4
/* 00006C88 54A4083C */ slwi r4, r5, 1
/* 00006C8C 7C9F2214 */ add r4, r31, r4
/* 00006C90 38A00000 */ li r5, 0
/* 00006C94 B0A40D48 */ sth r5, 0xd48(r4)
/* 00006C98 A89F0D44 */ lha r4, 0xd44(r31)
/* 00006C9C 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 00006CA0 B09F0D44 */ sth r4, 0xd44(r31)
lbl_00006CA4:
/* 00006CA4 A89F0D44 */ lha r4, 0xd44(r31)
/* 00006CA8 2C040002 */ cmpwi r4, 2
/* 00006CAC 40820178 */ bne lbl_00006E24
/* 00006CB0 540505EF */ rlwinm. r5, r0, 0, 0x17, 0x17
/* 00006CB4 41820170 */ beq lbl_00006E24
/* 00006CB8 3CA00000 */ lis r5, lbl_00013A1C@ha
/* 00006CBC A95F0D4A */ lha r10, 0xd4a(r31)
/* 00006CC0 39850000 */ addi r12, r5, lbl_00013A1C@l
/* 00006CC4 A97F0D48 */ lha r11, 0xd48(r31)
/* 00006CC8 38A0003B */ li r5, 0x3b
/* 00006CCC 7CA903A6 */ mtctr r5
/* 00006CD0 38E00000 */ li r7, 0
/* 00006CD4 39070000 */ addi r8, r7, 0
/* 00006CD8 392C0000 */ addi r9, r12, 0
/* 00006CDC 38AA0001 */ addi r5, r10, 1
lbl_00006CE0:
/* 00006CE0 80C90000 */ lwz r6, 0(r9)
/* 00006CE4 7C0B3000 */ cmpw r11, r6
/* 00006CE8 40820008 */ bne lbl_00006CF0
/* 00006CEC 38E70001 */ addi r7, r7, 1
lbl_00006CF0:
/* 00006CF0 7C053800 */ cmpw r5, r7
/* 00006CF4 40820008 */ bne lbl_00006CFC
/* 00006CF8 48000074 */ b lbl_00006D6C
lbl_00006CFC:
/* 00006CFC 84C9000C */ lwzu r6, 0xc(r9)
/* 00006D00 39080001 */ addi r8, r8, 1
/* 00006D04 7C0B3000 */ cmpw r11, r6
/* 00006D08 40820008 */ bne lbl_00006D10
/* 00006D0C 38E70001 */ addi r7, r7, 1
lbl_00006D10:
/* 00006D10 7C053800 */ cmpw r5, r7
/* 00006D14 40820008 */ bne lbl_00006D1C
/* 00006D18 48000054 */ b lbl_00006D6C
lbl_00006D1C:
/* 00006D1C 84C9000C */ lwzu r6, 0xc(r9)
/* 00006D20 39080001 */ addi r8, r8, 1
/* 00006D24 7C0B3000 */ cmpw r11, r6
/* 00006D28 40820008 */ bne lbl_00006D30
/* 00006D2C 38E70001 */ addi r7, r7, 1
lbl_00006D30:
/* 00006D30 7C053800 */ cmpw r5, r7
/* 00006D34 40820008 */ bne lbl_00006D3C
/* 00006D38 48000034 */ b lbl_00006D6C
lbl_00006D3C:
/* 00006D3C 84C9000C */ lwzu r6, 0xc(r9)
/* 00006D40 39080001 */ addi r8, r8, 1
/* 00006D44 7C0B3000 */ cmpw r11, r6
/* 00006D48 40820008 */ bne lbl_00006D50
/* 00006D4C 38E70001 */ addi r7, r7, 1
lbl_00006D50:
/* 00006D50 7C053800 */ cmpw r5, r7
/* 00006D54 40820008 */ bne lbl_00006D5C
/* 00006D58 48000014 */ b lbl_00006D6C
lbl_00006D5C:
/* 00006D5C 3929000C */ addi r9, r9, 0xc
/* 00006D60 39080001 */ addi r8, r8, 1
/* 00006D64 4200FF7C */ bdnz lbl_00006CE0
/* 00006D68 3900FFFF */ li r8, -1
lbl_00006D6C:
/* 00006D6C A8BF0D40 */ lha r5, 0xd40(r31)
/* 00006D70 7C054000 */ cmpw r5, r8
/* 00006D74 418200B0 */ beq lbl_00006E24
/* 00006D78 38A0003B */ li r5, 0x3b
/* 00006D7C 38E00000 */ li r7, 0
/* 00006D80 7CA903A6 */ mtctr r5
/* 00006D84 39070000 */ addi r8, r7, 0
/* 00006D88 38AA0001 */ addi r5, r10, 1
lbl_00006D8C:
/* 00006D8C 80CC0000 */ lwz r6, 0(r12)
/* 00006D90 7C0B3000 */ cmpw r11, r6
/* 00006D94 40820008 */ bne lbl_00006D9C
/* 00006D98 38E70001 */ addi r7, r7, 1
lbl_00006D9C:
/* 00006D9C 7C053800 */ cmpw r5, r7
/* 00006DA0 40820008 */ bne lbl_00006DA8
/* 00006DA4 48000074 */ b lbl_00006E18
lbl_00006DA8:
/* 00006DA8 84CC000C */ lwzu r6, 0xc(r12)
/* 00006DAC 39080001 */ addi r8, r8, 1
/* 00006DB0 7C0B3000 */ cmpw r11, r6
/* 00006DB4 40820008 */ bne lbl_00006DBC
/* 00006DB8 38E70001 */ addi r7, r7, 1
lbl_00006DBC:
/* 00006DBC 7C053800 */ cmpw r5, r7
/* 00006DC0 40820008 */ bne lbl_00006DC8
/* 00006DC4 48000054 */ b lbl_00006E18
lbl_00006DC8:
/* 00006DC8 84CC000C */ lwzu r6, 0xc(r12)
/* 00006DCC 39080001 */ addi r8, r8, 1
/* 00006DD0 7C0B3000 */ cmpw r11, r6
/* 00006DD4 40820008 */ bne lbl_00006DDC
/* 00006DD8 38E70001 */ addi r7, r7, 1
lbl_00006DDC:
/* 00006DDC 7C053800 */ cmpw r5, r7
/* 00006DE0 40820008 */ bne lbl_00006DE8
/* 00006DE4 48000034 */ b lbl_00006E18
lbl_00006DE8:
/* 00006DE8 84CC000C */ lwzu r6, 0xc(r12)
/* 00006DEC 39080001 */ addi r8, r8, 1
/* 00006DF0 7C0B3000 */ cmpw r11, r6
/* 00006DF4 40820008 */ bne lbl_00006DFC
/* 00006DF8 38E70001 */ addi r7, r7, 1
lbl_00006DFC:
/* 00006DFC 7C053800 */ cmpw r5, r7
/* 00006E00 40820008 */ bne lbl_00006E08
/* 00006E04 48000014 */ b lbl_00006E18
lbl_00006E08:
/* 00006E08 398C000C */ addi r12, r12, 0xc
/* 00006E0C 39080001 */ addi r8, r8, 1
/* 00006E10 4200FF7C */ bdnz lbl_00006D8C
/* 00006E14 3900FFFF */ li r8, -1
lbl_00006E18:
/* 00006E18 7D050734 */ extsh r5, r8
/* 00006E1C B0BF0D40 */ sth r5, 0xd40(r31)
/* 00006E20 3BA00001 */ li r29, 1
lbl_00006E24:
/* 00006E24 80BF05AC */ lwz r5, 0x5ac(r31)
/* 00006E28 2C050000 */ cmpwi r5, 0
/* 00006E2C 4082036C */ bne lbl_00007198
/* 00006E30 80BF0190 */ lwz r5, 0x190(r31)
/* 00006E34 28050000 */ cmplwi r5, 0
/* 00006E38 41820360 */ beq lbl_00007198
/* 00006E3C 540607FF */ clrlwi. r6, r0, 0x1f
/* 00006E40 40820028 */ bne lbl_00006E68
/* 00006E44 3CC00000 */ lis r6, controllerInfo@ha
/* 00006E48 38C60000 */ addi r6, r6, controllerInfo@l
/* 00006E4C A0C60030 */ lhz r6, 0x30(r6)
/* 00006E50 54C607FF */ clrlwi. r6, r6, 0x1f
/* 00006E54 40820014 */ bne lbl_00006E68
/* 00006E58 546607FF */ clrlwi. r6, r3, 0x1f
/* 00006E5C 41820190 */ beq lbl_00006FEC
/* 00006E60 546606B5 */ rlwinm. r6, r3, 0, 0x1a, 0x1a
/* 00006E64 41820188 */ beq lbl_00006FEC
lbl_00006E68:
/* 00006E68 2C040002 */ cmpwi r4, 2
/* 00006E6C 41800180 */ blt lbl_00006FEC
/* 00006E70 807F05A8 */ lwz r3, 0x5a8(r31)
/* 00006E74 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00006E78 901F05A8 */ stw r0, 0x5a8(r31)
lbl_00006E7C:
/* 00006E7C 801F05A8 */ lwz r0, 0x5a8(r31)
/* 00006E80 2C000000 */ cmpwi r0, 0
/* 00006E84 40800010 */ bge lbl_00006E94
/* 00006E88 80650000 */ lwz r3, 0(r5)
/* 00006E8C 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00006E90 901F05A8 */ stw r0, 0x5a8(r31)
lbl_00006E94:
/* 00006E94 807F05A8 */ lwz r3, 0x5a8(r31)
/* 00006E98 80850008 */ lwz r4, 8(r5)
/* 00006E9C 54601838 */ slwi r0, r3, 3
/* 00006EA0 7CC4002E */ lwzx r6, r4, r0
/* 00006EA4 28060000 */ cmplwi r6, 0
/* 00006EA8 40820010 */ bne lbl_00006EB8
/* 00006EAC 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 00006EB0 901F05A8 */ stw r0, 0x5a8(r31)
/* 00006EB4 4BFFFFC8 */ b lbl_00006E7C
lbl_00006EB8:
/* 00006EB8 881F0D4E */ lbz r0, 0xd4e(r31)
/* 00006EBC 28000000 */ cmplwi r0, 0
/* 00006EC0 41820014 */ beq lbl_00006ED4
/* 00006EC4 C83E00C8 */ lfd f1, 0xc8(r30)
/* 00006EC8 C01F0D50 */ lfs f0, 0xd50(r31)
/* 00006ECC FC010000 */ fcmpu cr0, f1, f0
/* 00006ED0 4082000C */ bne lbl_00006EDC
lbl_00006ED4:
/* 00006ED4 C0060014 */ lfs f0, 0x14(r6)
/* 00006ED8 D01F0D50 */ stfs f0, 0xd50(r31)
lbl_00006EDC:
/* 00006EDC 28000000 */ cmplwi r0, 0
/* 00006EE0 41820088 */ beq lbl_00006F68
/* 00006EE4 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00006EE8 80660008 */ lwz r3, 8(r6)
/* 00006EEC 38A40000 */ addi r5, r4, currentCameraStructPtr@l
/* 00006EF0 8006000C */ lwz r0, 0xc(r6)
/* 00006EF4 80850000 */ lwz r4, 0(r5)
/* 00006EF8 9064000C */ stw r3, 0xc(r4)
/* 00006EFC 90040010 */ stw r0, 0x10(r4)
/* 00006F00 80060010 */ lwz r0, 0x10(r6)
/* 00006F04 90040014 */ stw r0, 0x14(r4)
/* 00006F08 80850000 */ lwz r4, 0(r5)
/* 00006F0C 8064000C */ lwz r3, 0xc(r4)
/* 00006F10 80040010 */ lwz r0, 0x10(r4)
/* 00006F14 90640000 */ stw r3, 0(r4)
/* 00006F18 90040004 */ stw r0, 4(r4)
/* 00006F1C 80040014 */ lwz r0, 0x14(r4)
/* 00006F20 90040008 */ stw r0, 8(r4)
/* 00006F24 80650000 */ lwz r3, 0(r5)
/* 00006F28 C03E0078 */ lfs f1, 0x78(r30)
/* 00006F2C C01F0D50 */ lfs f0, 0xd50(r31)
/* 00006F30 C0430004 */ lfs f2, 4(r3)
/* 00006F34 EC010032 */ fmuls f0, f1, f0
/* 00006F38 EC02002A */ fadds f0, f2, f0
/* 00006F3C D0030004 */ stfs f0, 4(r3)
/* 00006F40 C03E0170 */ lfs f1, 0x170(r30)
/* 00006F44 C01F0D50 */ lfs f0, 0xd50(r31)
/* 00006F48 80650000 */ lwz r3, 0(r5)
/* 00006F4C EC010032 */ fmuls f0, f1, f0
/* 00006F50 C03E00B8 */ lfs f1, 0xb8(r30)
/* 00006F54 C0430008 */ lfs f2, 8(r3)
/* 00006F58 EC01002A */ fadds f0, f1, f0
/* 00006F5C EC02002A */ fadds f0, f2, f0
/* 00006F60 D0030008 */ stfs f0, 8(r3)
/* 00006F64 48000234 */ b lbl_00007198
lbl_00006F68:
/* 00006F68 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00006F6C 80660008 */ lwz r3, 8(r6)
/* 00006F70 38A40000 */ addi r5, r4, currentCameraStructPtr@l
/* 00006F74 8006000C */ lwz r0, 0xc(r6)
/* 00006F78 80850000 */ lwz r4, 0(r5)
/* 00006F7C 9064000C */ stw r3, 0xc(r4)
/* 00006F80 90040010 */ stw r0, 0x10(r4)
/* 00006F84 80060010 */ lwz r0, 0x10(r6)
/* 00006F88 90040014 */ stw r0, 0x14(r4)
/* 00006F8C 80850000 */ lwz r4, 0(r5)
/* 00006F90 8064000C */ lwz r3, 0xc(r4)
/* 00006F94 80040010 */ lwz r0, 0x10(r4)
/* 00006F98 90640000 */ stw r3, 0(r4)
/* 00006F9C 90040004 */ stw r0, 4(r4)
/* 00006FA0 80040014 */ lwz r0, 0x14(r4)
/* 00006FA4 90040008 */ stw r0, 8(r4)
/* 00006FA8 80650000 */ lwz r3, 0(r5)
/* 00006FAC C03E0078 */ lfs f1, 0x78(r30)
/* 00006FB0 C0060014 */ lfs f0, 0x14(r6)
/* 00006FB4 C0430004 */ lfs f2, 4(r3)
/* 00006FB8 EC010032 */ fmuls f0, f1, f0
/* 00006FBC EC02002A */ fadds f0, f2, f0
/* 00006FC0 D0030004 */ stfs f0, 4(r3)
/* 00006FC4 C03E0170 */ lfs f1, 0x170(r30)
/* 00006FC8 C0060014 */ lfs f0, 0x14(r6)
/* 00006FCC 80650000 */ lwz r3, 0(r5)
/* 00006FD0 EC010032 */ fmuls f0, f1, f0
/* 00006FD4 C03E00B8 */ lfs f1, 0xb8(r30)
/* 00006FD8 C0430008 */ lfs f2, 8(r3)
/* 00006FDC EC01002A */ fadds f0, f1, f0
/* 00006FE0 EC02002A */ fadds f0, f2, f0
/* 00006FE4 D0030008 */ stfs f0, 8(r3)
/* 00006FE8 480001B0 */ b lbl_00007198
lbl_00006FEC:
/* 00006FEC 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00006FF0 40820028 */ bne lbl_00007018
/* 00006FF4 3CC00000 */ lis r6, controllerInfo@ha
/* 00006FF8 38C60000 */ addi r6, r6, controllerInfo@l
/* 00006FFC A0060030 */ lhz r0, 0x30(r6)
/* 00007000 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00007004 40820014 */ bne lbl_00007018
/* 00007008 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0000700C 4182018C */ beq lbl_00007198
/* 00007010 546006B5 */ rlwinm. r0, r3, 0, 0x1a, 0x1a
/* 00007014 41820184 */ beq lbl_00007198
lbl_00007018:
/* 00007018 2C040002 */ cmpwi r4, 2
/* 0000701C 4180017C */ blt lbl_00007198
/* 00007020 807F05A8 */ lwz r3, 0x5a8(r31)
/* 00007024 38E00000 */ li r7, 0
/* 00007028 38030001 */ addi r0, r3, 1
/* 0000702C 901F05A8 */ stw r0, 0x5a8(r31)
lbl_00007030:
/* 00007030 807F05A8 */ lwz r3, 0x5a8(r31)
/* 00007034 80050000 */ lwz r0, 0(r5)
/* 00007038 7C030000 */ cmpw r3, r0
/* 0000703C 41800008 */ blt lbl_00007044
/* 00007040 90FF05A8 */ stw r7, 0x5a8(r31)
lbl_00007044:
/* 00007044 807F05A8 */ lwz r3, 0x5a8(r31)
/* 00007048 80850008 */ lwz r4, 8(r5)
/* 0000704C 54601838 */ slwi r0, r3, 3
/* 00007050 7CC4002E */ lwzx r6, r4, r0
/* 00007054 28060000 */ cmplwi r6, 0
/* 00007058 40820010 */ bne lbl_00007068
/* 0000705C 38030001 */ addi r0, r3, 1
/* 00007060 901F05A8 */ stw r0, 0x5a8(r31)
/* 00007064 4BFFFFCC */ b lbl_00007030
lbl_00007068:
/* 00007068 881F0D4E */ lbz r0, 0xd4e(r31)
/* 0000706C 28000000 */ cmplwi r0, 0
/* 00007070 41820014 */ beq lbl_00007084
/* 00007074 C83E00C8 */ lfd f1, 0xc8(r30)
/* 00007078 C01F0D50 */ lfs f0, 0xd50(r31)
/* 0000707C FC010000 */ fcmpu cr0, f1, f0
/* 00007080 4082000C */ bne lbl_0000708C
lbl_00007084:
/* 00007084 C0060014 */ lfs f0, 0x14(r6)
/* 00007088 D01F0D50 */ stfs f0, 0xd50(r31)
lbl_0000708C:
/* 0000708C 28000000 */ cmplwi r0, 0
/* 00007090 41820088 */ beq lbl_00007118
/* 00007094 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 00007098 80660008 */ lwz r3, 8(r6)
/* 0000709C 38A40000 */ addi r5, r4, currentCameraStructPtr@l
/* 000070A0 8006000C */ lwz r0, 0xc(r6)
/* 000070A4 80850000 */ lwz r4, 0(r5)
/* 000070A8 9064000C */ stw r3, 0xc(r4)
/* 000070AC 90040010 */ stw r0, 0x10(r4)
/* 000070B0 80060010 */ lwz r0, 0x10(r6)
/* 000070B4 90040014 */ stw r0, 0x14(r4)
/* 000070B8 80850000 */ lwz r4, 0(r5)
/* 000070BC 8064000C */ lwz r3, 0xc(r4)
/* 000070C0 80040010 */ lwz r0, 0x10(r4)
/* 000070C4 90640000 */ stw r3, 0(r4)
/* 000070C8 90040004 */ stw r0, 4(r4)
/* 000070CC 80040014 */ lwz r0, 0x14(r4)
/* 000070D0 90040008 */ stw r0, 8(r4)
/* 000070D4 80650000 */ lwz r3, 0(r5)
/* 000070D8 C03E0078 */ lfs f1, 0x78(r30)
/* 000070DC C01F0D50 */ lfs f0, 0xd50(r31)
/* 000070E0 C0430004 */ lfs f2, 4(r3)
/* 000070E4 EC010032 */ fmuls f0, f1, f0
/* 000070E8 EC02002A */ fadds f0, f2, f0
/* 000070EC D0030004 */ stfs f0, 4(r3)
/* 000070F0 C03E0170 */ lfs f1, 0x170(r30)
/* 000070F4 C01F0D50 */ lfs f0, 0xd50(r31)
/* 000070F8 80650000 */ lwz r3, 0(r5)
/* 000070FC EC010032 */ fmuls f0, f1, f0
/* 00007100 C03E00B8 */ lfs f1, 0xb8(r30)
/* 00007104 C0430008 */ lfs f2, 8(r3)
/* 00007108 EC01002A */ fadds f0, f1, f0
/* 0000710C EC02002A */ fadds f0, f2, f0
/* 00007110 D0030008 */ stfs f0, 8(r3)
/* 00007114 48000084 */ b lbl_00007198
lbl_00007118:
/* 00007118 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 0000711C 80660008 */ lwz r3, 8(r6)
/* 00007120 38A40000 */ addi r5, r4, currentCameraStructPtr@l
/* 00007124 8006000C */ lwz r0, 0xc(r6)
/* 00007128 80850000 */ lwz r4, 0(r5)
/* 0000712C 9064000C */ stw r3, 0xc(r4)
/* 00007130 90040010 */ stw r0, 0x10(r4)
/* 00007134 80060010 */ lwz r0, 0x10(r6)
/* 00007138 90040014 */ stw r0, 0x14(r4)
/* 0000713C 80850000 */ lwz r4, 0(r5)
/* 00007140 8064000C */ lwz r3, 0xc(r4)
/* 00007144 80040010 */ lwz r0, 0x10(r4)
/* 00007148 90640000 */ stw r3, 0(r4)
/* 0000714C 90040004 */ stw r0, 4(r4)
/* 00007150 80040014 */ lwz r0, 0x14(r4)
/* 00007154 90040008 */ stw r0, 8(r4)
/* 00007158 80650000 */ lwz r3, 0(r5)
/* 0000715C C03E0078 */ lfs f1, 0x78(r30)
/* 00007160 C0060014 */ lfs f0, 0x14(r6)
/* 00007164 C0430004 */ lfs f2, 4(r3)
/* 00007168 EC010032 */ fmuls f0, f1, f0
/* 0000716C EC02002A */ fadds f0, f2, f0
/* 00007170 D0030004 */ stfs f0, 4(r3)
/* 00007174 C03E0170 */ lfs f1, 0x170(r30)
/* 00007178 C0060014 */ lfs f0, 0x14(r6)
/* 0000717C 80650000 */ lwz r3, 0(r5)
/* 00007180 EC010032 */ fmuls f0, f1, f0
/* 00007184 C03E00B8 */ lfs f1, 0xb8(r30)
/* 00007188 C0430008 */ lfs f2, 8(r3)
/* 0000718C EC01002A */ fadds f0, f1, f0
/* 00007190 EC02002A */ fadds f0, f2, f0
/* 00007194 D0030008 */ stfs f0, 8(r3)
lbl_00007198:
/* 00007198 2C1D0000 */ cmpwi r29, 0
/* 0000719C 41820234 */ beq lbl_000073D0
/* 000071A0 3C600000 */ lis r3, stageHeap@ha
/* 000071A4 38630000 */ addi r3, r3, stageHeap@l
/* 000071A8 80630000 */ lwz r3, 0(r3)
/* 000071AC 4BFF8FB1 */ bl OSSetCurrentHeap
/* 000071B0 801F018C */ lwz r0, 0x18c(r31)
/* 000071B4 3BA30000 */ addi r29, r3, 0
/* 000071B8 28000000 */ cmplwi r0, 0
/* 000071BC 40820010 */ bne lbl_000071CC
/* 000071C0 801F0190 */ lwz r0, 0x190(r31)
/* 000071C4 28000000 */ cmplwi r0, 0
/* 000071C8 4182001C */ beq lbl_000071E4
lbl_000071CC:
/* 000071CC 3C600000 */ lis r3, gfxBufferInfo@ha
/* 000071D0 38630000 */ addi r3, r3, gfxBufferInfo@l
/* 000071D4 80630000 */ lwz r3, 0(r3)
/* 000071D8 80630000 */ lwz r3, 0(r3)
/* 000071DC 4BFF8F81 */ bl VISetNextFrameBuffer
/* 000071E0 4BFF8F7D */ bl VIWaitForRetrace
lbl_000071E4:
/* 000071E4 807F018C */ lwz r3, 0x18c(r31)
/* 000071E8 28030000 */ cmplwi r3, 0
/* 000071EC 41820010 */ beq lbl_000071FC
/* 000071F0 4BFF8F6D */ bl free_tpl
/* 000071F4 38000000 */ li r0, 0
/* 000071F8 901F018C */ stw r0, 0x18c(r31)
lbl_000071FC:
/* 000071FC 807F0190 */ lwz r3, 0x190(r31)
/* 00007200 28030000 */ cmplwi r3, 0
/* 00007204 41820010 */ beq lbl_00007214
/* 00007208 4BFF8F55 */ bl free_gma
/* 0000720C 38000000 */ li r0, 0
/* 00007210 901F0190 */ stw r0, 0x190(r31)
lbl_00007214:
/* 00007214 7FA3EB78 */ mr r3, r29
/* 00007218 4BFF8F45 */ bl OSSetCurrentHeap
/* 0000721C A81F0D42 */ lha r0, 0xd42(r31)
/* 00007220 A87F0D40 */ lha r3, 0xd40(r31)
/* 00007224 7C001800 */ cmpw r0, r3
/* 00007228 41820024 */ beq lbl_0000724C
/* 0000722C 1C83000C */ mulli r4, r3, 0xc
/* 00007230 3C600000 */ lis r3, lbl_00013A1C@ha
/* 00007234 38030000 */ addi r0, r3, lbl_00013A1C@l
/* 00007238 7C602214 */ add r3, r0, r4
/* 0000723C 38630004 */ addi r3, r3, 4
/* 00007240 4BFFE3A9 */ bl lbl_000055E8
/* 00007244 A81F0D40 */ lha r0, 0xd40(r31)
/* 00007248 B01F0D42 */ sth r0, 0xd42(r31)
lbl_0000724C:
/* 0000724C 38A00000 */ li r5, 0
/* 00007250 90BF05A8 */ stw r5, 0x5a8(r31)
/* 00007254 80FF0190 */ lwz r7, 0x190(r31)
/* 00007258 28070000 */ cmplwi r7, 0
/* 0000725C 4182016C */ beq lbl_000073C8
lbl_00007260:
/* 00007260 807F05A8 */ lwz r3, 0x5a8(r31)
/* 00007264 80070000 */ lwz r0, 0(r7)
/* 00007268 7C030000 */ cmpw r3, r0
/* 0000726C 41800008 */ blt lbl_00007274
/* 00007270 90BF05A8 */ stw r5, 0x5a8(r31)
lbl_00007274:
/* 00007274 807F05A8 */ lwz r3, 0x5a8(r31)
/* 00007278 80870008 */ lwz r4, 8(r7)
/* 0000727C 54601838 */ slwi r0, r3, 3
/* 00007280 7CC4002E */ lwzx r6, r4, r0
/* 00007284 28060000 */ cmplwi r6, 0
/* 00007288 40820010 */ bne lbl_00007298
/* 0000728C 38030001 */ addi r0, r3, 1
/* 00007290 901F05A8 */ stw r0, 0x5a8(r31)
/* 00007294 4BFFFFCC */ b lbl_00007260
lbl_00007298:
/* 00007298 881F0D4E */ lbz r0, 0xd4e(r31)
/* 0000729C 28000000 */ cmplwi r0, 0
/* 000072A0 41820014 */ beq lbl_000072B4
/* 000072A4 C83E00C8 */ lfd f1, 0xc8(r30)
/* 000072A8 C01F0D50 */ lfs f0, 0xd50(r31)
/* 000072AC FC010000 */ fcmpu cr0, f1, f0
/* 000072B0 4082000C */ bne lbl_000072BC
lbl_000072B4:
/* 000072B4 C0060014 */ lfs f0, 0x14(r6)
/* 000072B8 D01F0D50 */ stfs f0, 0xd50(r31)
lbl_000072BC:
/* 000072BC 28000000 */ cmplwi r0, 0
/* 000072C0 41820088 */ beq lbl_00007348
/* 000072C4 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 000072C8 80660008 */ lwz r3, 8(r6)
/* 000072CC 38A40000 */ addi r5, r4, currentCameraStructPtr@l
/* 000072D0 8006000C */ lwz r0, 0xc(r6)
/* 000072D4 80850000 */ lwz r4, 0(r5)
/* 000072D8 9064000C */ stw r3, 0xc(r4)
/* 000072DC 90040010 */ stw r0, 0x10(r4)
/* 000072E0 80060010 */ lwz r0, 0x10(r6)
/* 000072E4 90040014 */ stw r0, 0x14(r4)
/* 000072E8 80850000 */ lwz r4, 0(r5)
/* 000072EC 8064000C */ lwz r3, 0xc(r4)
/* 000072F0 80040010 */ lwz r0, 0x10(r4)
/* 000072F4 90640000 */ stw r3, 0(r4)
/* 000072F8 90040004 */ stw r0, 4(r4)
/* 000072FC 80040014 */ lwz r0, 0x14(r4)
/* 00007300 90040008 */ stw r0, 8(r4)
/* 00007304 80650000 */ lwz r3, 0(r5)
/* 00007308 C03E0078 */ lfs f1, 0x78(r30)
/* 0000730C C01F0D50 */ lfs f0, 0xd50(r31)
/* 00007310 C0430004 */ lfs f2, 4(r3)
/* 00007314 EC010032 */ fmuls f0, f1, f0
/* 00007318 EC02002A */ fadds f0, f2, f0
/* 0000731C D0030004 */ stfs f0, 4(r3)
/* 00007320 C03E0170 */ lfs f1, 0x170(r30)
/* 00007324 C01F0D50 */ lfs f0, 0xd50(r31)
/* 00007328 80650000 */ lwz r3, 0(r5)
/* 0000732C EC010032 */ fmuls f0, f1, f0
/* 00007330 C03E00B8 */ lfs f1, 0xb8(r30)
/* 00007334 C0430008 */ lfs f2, 8(r3)
/* 00007338 EC01002A */ fadds f0, f1, f0
/* 0000733C EC02002A */ fadds f0, f2, f0
/* 00007340 D0030008 */ stfs f0, 8(r3)
/* 00007344 48000084 */ b lbl_000073C8
lbl_00007348:
/* 00007348 3C800000 */ lis r4, currentCameraStructPtr@ha
/* 0000734C 80660008 */ lwz r3, 8(r6)
/* 00007350 38A40000 */ addi r5, r4, currentCameraStructPtr@l
/* 00007354 8006000C */ lwz r0, 0xc(r6)
/* 00007358 80850000 */ lwz r4, 0(r5)
/* 0000735C 9064000C */ stw r3, 0xc(r4)
/* 00007360 90040010 */ stw r0, 0x10(r4)
/* 00007364 80060010 */ lwz r0, 0x10(r6)
/* 00007368 90040014 */ stw r0, 0x14(r4)
/* 0000736C 80850000 */ lwz r4, 0(r5)
/* 00007370 8064000C */ lwz r3, 0xc(r4)
/* 00007374 80040010 */ lwz r0, 0x10(r4)
/* 00007378 90640000 */ stw r3, 0(r4)
/* 0000737C 90040004 */ stw r0, 4(r4)
/* 00007380 80040014 */ lwz r0, 0x14(r4)
/* 00007384 90040008 */ stw r0, 8(r4)
/* 00007388 80650000 */ lwz r3, 0(r5)
/* 0000738C C03E0078 */ lfs f1, 0x78(r30)
/* 00007390 C0060014 */ lfs f0, 0x14(r6)
/* 00007394 C0430004 */ lfs f2, 4(r3)
/* 00007398 EC010032 */ fmuls f0, f1, f0
/* 0000739C EC02002A */ fadds f0, f2, f0
/* 000073A0 D0030004 */ stfs f0, 4(r3)
/* 000073A4 C03E0170 */ lfs f1, 0x170(r30)
/* 000073A8 C0060014 */ lfs f0, 0x14(r6)
/* 000073AC 80650000 */ lwz r3, 0(r5)
/* 000073B0 EC010032 */ fmuls f0, f1, f0
/* 000073B4 C03E00B8 */ lfs f1, 0xb8(r30)
/* 000073B8 C0430008 */ lfs f2, 8(r3)
/* 000073BC EC01002A */ fadds f0, f1, f0
/* 000073C0 EC02002A */ fadds f0, f2, f0
/* 000073C4 D0030008 */ stfs f0, 8(r3)
lbl_000073C8:
/* 000073C8 38000000 */ li r0, 0
/* 000073CC 901F05A8 */ stw r0, 0x5a8(r31)
lbl_000073D0:
/* 000073D0 8001002C */ lwz r0, 0x2c(r1)
/* 000073D4 83E10024 */ lwz r31, 0x24(r1)
/* 000073D8 83C10020 */ lwz r30, 0x20(r1)
/* 000073DC 7C0803A6 */ mtlr r0
/* 000073E0 83A1001C */ lwz r29, 0x1c(r1)
/* 000073E4 38210028 */ addi r1, r1, 0x28
/* 000073E8 4E800020 */ blr 
lbl_000073EC:
/* 000073EC 7C0802A6 */ mflr r0
/* 000073F0 3C600000 */ lis r3, lbl_0000FE78@ha
/* 000073F4 90010004 */ stw r0, 4(r1)
/* 000073F8 9421FF88 */ stwu r1, -0x78(r1)
/* 000073FC BF610064 */ stmw r27, 0x64(r1)
/* 00007400 3BC30000 */ addi r30, r3, lbl_0000FE78@l
/* 00007404 3C600000 */ lis r3, lbl_10000000@ha
/* 00007408 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 0000740C 801E01C8 */ lwz r0, 0x1c8(r30)
/* 00007410 9001001C */ stw r0, 0x1c(r1)
/* 00007414 881F0D5B */ lbz r0, 0xd5b(r31)
/* 00007418 28000000 */ cmplwi r0, 0
/* 0000741C 4182006C */ beq lbl_00007488
/* 00007420 807F0190 */ lwz r3, 0x190(r31)
/* 00007424 801F05A8 */ lwz r0, 0x5a8(r31)
/* 00007428 80630008 */ lwz r3, 8(r3)
/* 0000742C 54001838 */ slwi r0, r0, 3
/* 00007430 7FA3002E */ lwzx r29, r3, r0
/* 00007434 4BFF8D29 */ bl mathutil_mtxA_from_mtxB
/* 00007438 281D0000 */ cmplwi r29, 0
/* 0000743C 41820018 */ beq lbl_00007454
/* 00007440 C83E01D0 */ lfd f1, 0x1d0(r30)
/* 00007444 C01D0014 */ lfs f0, 0x14(r29)
/* 00007448 FC210032 */ fmul f1, f1, f0
/* 0000744C FC200818 */ frsp f1, f1
/* 00007450 4BFF8D0D */ bl mathutil_mtxA_scale_s
lbl_00007454:
/* 00007454 3C600000 */ lis r3, mathutilData@ha
/* 00007458 3BA30000 */ addi r29, r3, mathutilData@l
/* 0000745C 807D0000 */ lwz r3, 0(r29)
/* 00007460 38800000 */ li r4, 0
/* 00007464 4BFF8CF9 */ bl GXLoadPosMtxImm
/* 00007468 807D0000 */ lwz r3, 0(r29)
/* 0000746C 38800000 */ li r4, 0
/* 00007470 4BFF8CED */ bl GXLoadNrmMtxImm
/* 00007474 3C600000 */ lis r3, naomiCommonObj@ha
/* 00007478 38630000 */ addi r3, r3, naomiCommonObj@l
/* 0000747C 80630000 */ lwz r3, 0(r3)
/* 00007480 806300A8 */ lwz r3, 0xa8(r3)
/* 00007484 4BFF8CD9 */ bl g_call_draw_naomi_model_and_do_other_stuff
lbl_00007488:
/* 00007488 4BFF8CD5 */ bl mathutil_mtxA_from_mtxB
/* 0000748C C03E0060 */ lfs f1, 0x60(r30)
/* 00007490 38610010 */ addi r3, r1, 0x10
/* 00007494 C05E018C */ lfs f2, 0x18c(r30)
/* 00007498 C07E0190 */ lfs f3, 0x190(r30)
/* 0000749C 4BFF8CC1 */ bl mathutil_mtxA_tf_point_xyz
/* 000074A0 C03E0060 */ lfs f1, 0x60(r30)
/* 000074A4 38610020 */ addi r3, r1, 0x20
/* 000074A8 38800000 */ li r4, 0
/* 000074AC 4BFF8CB1 */ bl GXInitLightSpot
/* 000074B0 C03E0194 */ lfs f1, 0x194(r30)
/* 000074B4 38610020 */ addi r3, r1, 0x20
/* 000074B8 C05E0198 */ lfs f2, 0x198(r30)
/* 000074BC 38800000 */ li r4, 0
/* 000074C0 4BFF8C9D */ bl GXInitLightDistAttn
/* 000074C4 C0210010 */ lfs f1, 0x10(r1)
/* 000074C8 38610020 */ addi r3, r1, 0x20
/* 000074CC C0410014 */ lfs f2, 0x14(r1)
/* 000074D0 C0610018 */ lfs f3, 0x18(r1)
/* 000074D4 4BFF8C89 */ bl GXInitLightPos
/* 000074D8 8001001C */ lwz r0, 0x1c(r1)
/* 000074DC 38810008 */ addi r4, r1, 8
/* 000074E0 38610020 */ addi r3, r1, 0x20
/* 000074E4 90010008 */ stw r0, 8(r1)
/* 000074E8 4BFF8C75 */ bl GXInitLightColor
/* 000074EC 38610020 */ addi r3, r1, 0x20
/* 000074F0 38800001 */ li r4, 1
/* 000074F4 4BFF8C69 */ bl GXLoadLightObjImm
/* 000074F8 4BFF8C65 */ bl mathutil_mtxA_from_mtxB
/* 000074FC 3C600000 */ lis r3, mathutilData@ha
/* 00007500 3BA30000 */ addi r29, r3, mathutilData@l
/* 00007504 807D0000 */ lwz r3, 0(r29)
/* 00007508 38800000 */ li r4, 0
/* 0000750C 4BFF8C51 */ bl GXLoadPosMtxImm
/* 00007510 807D0000 */ lwz r3, 0(r29)
/* 00007514 38800000 */ li r4, 0
/* 00007518 4BFF8C45 */ bl GXLoadNrmMtxImm
/* 0000751C 881F0D5A */ lbz r0, 0xd5a(r31)
/* 00007520 28000000 */ cmplwi r0, 0
/* 00007524 41820008 */ beq lbl_0000752C
/* 00007528 4BFFF0C9 */ bl lbl_000065F0
lbl_0000752C:
/* 0000752C 38600001 */ li r3, 1
/* 00007530 38800023 */ li r4, 0x23
/* 00007534 4BFF8C29 */ bl g_debug_set_cursor_pos
/* 00007538 A87F0D42 */ lha r3, 0xd42(r31)
/* 0000753C A81F0D40 */ lha r0, 0xd40(r31)
/* 00007540 7C030000 */ cmpw r3, r0
/* 00007544 408201C0 */ bne lbl_00007704
/* 00007548 801F0190 */ lwz r0, 0x190(r31)
/* 0000754C 28000000 */ cmplwi r0, 0
/* 00007550 418201B4 */ beq lbl_00007704
/* 00007554 4BFF8C09 */ bl mathutil_mtxA_from_mtxB
/* 00007558 3C600000 */ lis r3, mathutilData@ha
/* 0000755C 3BA30000 */ addi r29, r3, mathutilData@l
/* 00007560 807D0000 */ lwz r3, 0(r29)
/* 00007564 38800000 */ li r4, 0
/* 00007568 4BFF8BF5 */ bl GXLoadPosMtxImm
/* 0000756C 807D0000 */ lwz r3, 0(r29)
/* 00007570 38800000 */ li r4, 0
/* 00007574 4BFF8BE9 */ bl GXLoadNrmMtxImm
/* 00007578 38600000 */ li r3, 0
/* 0000757C 4BFF8BE1 */ bl perf_init_timer
/* 00007580 801F05AC */ lwz r0, 0x5ac(r31)
/* 00007584 2C000000 */ cmpwi r0, 0
/* 00007588 41820060 */ beq lbl_000075E8
/* 0000758C 3B800000 */ li r28, 0
/* 00007590 3BA00000 */ li r29, 0
/* 00007594 48000040 */ b lbl_000075D4
lbl_00007598:
/* 00007598 80630008 */ lwz r3, 8(r3)
/* 0000759C 7C03E82E */ lwzx r0, r3, r29
/* 000075A0 28000000 */ cmplwi r0, 0
/* 000075A4 7C1B0378 */ mr r27, r0
/* 000075A8 41820024 */ beq lbl_000075CC
/* 000075AC 801B0004 */ lwz r0, 4(r27)
/* 000075B0 5400073B */ rlwinm. r0, r0, 0, 0x1c, 0x1d
/* 000075B4 41820010 */ beq lbl_000075C4
/* 000075B8 387B0000 */ addi r3, r27, 0
/* 000075BC 38800000 */ li r4, 0
/* 000075C0 4BFF8B9D */ bl g_get_stitching_model_mtx
lbl_000075C4:
/* 000075C4 7F63DB78 */ mr r3, r27
/* 000075C8 4BFF8B95 */ bl g_avdisp_maybe_draw_model_2
lbl_000075CC:
/* 000075CC 3BBD0008 */ addi r29, r29, 8
/* 000075D0 3B9C0001 */ addi r28, r28, 1
lbl_000075D4:
/* 000075D4 807F0190 */ lwz r3, 0x190(r31)
/* 000075D8 80030000 */ lwz r0, 0(r3)
/* 000075DC 7C1C0000 */ cmpw r28, r0
/* 000075E0 4180FFB8 */ blt lbl_00007598
/* 000075E4 48000064 */ b lbl_00007648
lbl_000075E8:
/* 000075E8 807F0190 */ lwz r3, 0x190(r31)
/* 000075EC 801F05A8 */ lwz r0, 0x5a8(r31)
/* 000075F0 80630008 */ lwz r3, 8(r3)
/* 000075F4 54001838 */ slwi r0, r0, 3
/* 000075F8 7C03002E */ lwzx r0, r3, r0
/* 000075FC 28000000 */ cmplwi r0, 0
/* 00007600 7C1B0378 */ mr r27, r0
/* 00007604 41820044 */ beq lbl_00007648
/* 00007608 801B0004 */ lwz r0, 4(r27)
/* 0000760C 5400073B */ rlwinm. r0, r0, 0, 0x1c, 0x1d
/* 00007610 41820010 */ beq lbl_00007620
/* 00007614 387B0000 */ addi r3, r27, 0
/* 00007618 38800000 */ li r4, 0
/* 0000761C 4BFF8B41 */ bl g_get_stitching_model_mtx
lbl_00007620:
/* 00007620 7F63DB78 */ mr r3, r27
/* 00007624 4BFF8B39 */ bl g_avdisp_maybe_draw_model_2
/* 00007628 38600014 */ li r3, 0x14
/* 0000762C 38800001 */ li r4, 1
/* 00007630 4BFF8B2D */ bl g_debug_set_cursor_pos
/* 00007634 3C600000 */ lis r3, lbl_00014638@ha
/* 00007638 C03B0014 */ lfs f1, 0x14(r27)
/* 0000763C 38630000 */ addi r3, r3, lbl_00014638@l
/* 00007640 4CC63242 */ crset 6
/* 00007644 4BFF8B19 */ bl g_debug_printf
lbl_00007648:
/* 00007648 38600028 */ li r3, 0x28
/* 0000764C 38800001 */ li r4, 1
/* 00007650 4BFF8B0D */ bl g_debug_set_cursor_pos
/* 00007654 38600000 */ li r3, 0
/* 00007658 4BFF8B05 */ bl perf_stop_timer
/* 0000765C 3CA00000 */ lis r5, lbl_00013920@ha
/* 00007660 4CC63182 */ crclr 6
/* 00007664 38830000 */ addi r4, r3, 0
/* 00007668 38650000 */ addi r3, r5, lbl_00013920@l
/* 0000766C 4BFF8AF1 */ bl g_debug_printf
/* 00007670 881F0D5B */ lbz r0, 0xd5b(r31)
/* 00007674 28000000 */ cmplwi r0, 0
/* 00007678 41820080 */ beq lbl_000076F8
/* 0000767C 807F0190 */ lwz r3, 0x190(r31)
/* 00007680 801F05A8 */ lwz r0, 0x5a8(r31)
/* 00007684 80630008 */ lwz r3, 8(r3)
/* 00007688 54001838 */ slwi r0, r0, 3
/* 0000768C 7F63002E */ lwzx r27, r3, r0
/* 00007690 4BFF8ACD */ bl mathutil_mtxA_from_mtxB
/* 00007694 C03E01BC */ lfs f1, 0x1bc(r30)
/* 00007698 4BFF8AC5 */ bl g_avdisp_set_alpha
/* 0000769C 281B0000 */ cmplwi r27, 0
/* 000076A0 4182000C */ beq lbl_000076AC
/* 000076A4 387B0008 */ addi r3, r27, 8
/* 000076A8 4BFF8AB5 */ bl mathutil_mtxA_translate
lbl_000076AC:
/* 000076AC C03F0D50 */ lfs f1, 0xd50(r31)
/* 000076B0 C81E01D8 */ lfd f0, 0x1d8(r30)
/* 000076B4 FC210024 */ fdiv f1, f1, f0
/* 000076B8 FC200818 */ frsp f1, f1
/* 000076BC 4BFF8AA1 */ bl mathutil_mtxA_scale_s
/* 000076C0 3C600000 */ lis r3, mathutilData@ha
/* 000076C4 3BC30000 */ addi r30, r3, mathutilData@l
/* 000076C8 807E0000 */ lwz r3, 0(r30)
/* 000076CC 38800000 */ li r4, 0
/* 000076D0 4BFF8A8D */ bl GXLoadPosMtxImm
/* 000076D4 807E0000 */ lwz r3, 0(r30)
/* 000076D8 38800000 */ li r4, 0
/* 000076DC 4BFF8A81 */ bl GXLoadNrmMtxImm
/* 000076E0 3C600000 */ lis r3, commonGma@ha
/* 000076E4 38630000 */ addi r3, r3, commonGma@l
/* 000076E8 80630000 */ lwz r3, 0(r3)
/* 000076EC 80630008 */ lwz r3, 8(r3)
/* 000076F0 806300A0 */ lwz r3, 0xa0(r3)
/* 000076F4 4BFF8A69 */ bl g_avdisp_draw_model_2
lbl_000076F8:
/* 000076F8 A87F0188 */ lha r3, 0x188(r31)
/* 000076FC 38030200 */ addi r0, r3, 0x200
/* 00007700 B01F0188 */ sth r0, 0x188(r31)
lbl_00007704:
/* 00007704 BB610064 */ lmw r27, 0x64(r1)
/* 00007708 8001007C */ lwz r0, 0x7c(r1)
/* 0000770C 38210078 */ addi r1, r1, 0x78
/* 00007710 7C0803A6 */ mtlr r0
/* 00007714 4E800020 */ blr 
lbl_00007718:
/* 00007718 7C0802A6 */ mflr r0
/* 0000771C 3C600000 */ lis r3, stageHeap@ha
/* 00007720 90010004 */ stw r0, 4(r1)
/* 00007724 38630000 */ addi r3, r3, stageHeap@l
/* 00007728 3CC00000 */ lis r6, lbl_0000FE78@ha
/* 0000772C 9421FFD0 */ stwu r1, -0x30(r1)
/* 00007730 3CA00000 */ lis r5, lbl_10000000@ha
/* 00007734 3C800000 */ lis r4, lbl_000102B0@ha
/* 00007738 BEE1000C */ stmw r23, 0xc(r1)
/* 0000773C 3B260000 */ addi r25, r6, lbl_0000FE78@l
/* 00007740 3BA50000 */ addi r29, r5, lbl_10000000@l
/* 00007744 3BC40000 */ addi r30, r4, lbl_000102B0@l
/* 00007748 80630000 */ lwz r3, 0(r3)
/* 0000774C 4BFF8A11 */ bl OSSetCurrentHeap
/* 00007750 3B030000 */ addi r24, r3, 0
/* 00007754 3860000F */ li r3, 0xf
/* 00007758 4BFF8A05 */ bl event_start
/* 0000775C 38600002 */ li r3, 2
/* 00007760 4BFF89FD */ bl camera_set_state
/* 00007764 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00007768 C0190060 */ lfs f0, 0x60(r25)
/* 0000776C 38C30000 */ addi r6, r3, currentCameraStructPtr@l
/* 00007770 80860000 */ lwz r4, 0(r6)
/* 00007774 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007778 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000777C D0040000 */ stfs f0, 0(r4)
/* 00007780 38800020 */ li r4, 0x20
/* 00007784 C019012C */ lfs f0, 0x12c(r25)
/* 00007788 80A60000 */ lwz r5, 0(r6)
/* 0000778C D0050004 */ stfs f0, 4(r5)
/* 00007790 C0190170 */ lfs f0, 0x170(r25)
/* 00007794 80A60000 */ lwz r5, 0(r6)
/* 00007798 D0050008 */ stfs f0, 8(r5)
/* 0000779C C0190060 */ lfs f0, 0x60(r25)
/* 000077A0 80A60000 */ lwz r5, 0(r6)
/* 000077A4 D005000C */ stfs f0, 0xc(r5)
/* 000077A8 C0190060 */ lfs f0, 0x60(r25)
/* 000077AC 80A60000 */ lwz r5, 0(r6)
/* 000077B0 D0050010 */ stfs f0, 0x10(r5)
/* 000077B4 C0190060 */ lfs f0, 0x60(r25)
/* 000077B8 80A60000 */ lwz r5, 0(r6)
/* 000077BC D0050014 */ stfs f0, 0x14(r5)
/* 000077C0 80630000 */ lwz r3, 0(r3)
/* 000077C4 4BFF8999 */ bl OSAllocFromHeap
/* 000077C8 907D0D5C */ stw r3, 0xd5c(r29)
/* 000077CC 801D0D5C */ lwz r0, 0xd5c(r29)
/* 000077D0 28000000 */ cmplwi r0, 0
/* 000077D4 40820018 */ bne lbl_000077EC
/* 000077D8 387E0134 */ addi r3, r30, 0x134
/* 000077DC 4CC63182 */ crclr 6
/* 000077E0 38BE439C */ addi r5, r30, 0x439c
/* 000077E4 388013A5 */ li r4, 0x13a5
/* 000077E8 4BFF8975 */ bl OSPanic
lbl_000077EC:
/* 000077EC 807D0D5C */ lwz r3, 0xd5c(r29)
/* 000077F0 38800000 */ li r4, 0
/* 000077F4 38A00020 */ li r5, 0x20
/* 000077F8 4BFF8965 */ bl memset
/* 000077FC 387E3010 */ addi r3, r30, 0x3010
/* 00007800 4BFF895D */ bl DVDChangeDir
/* 00007804 387E43AC */ addi r3, r30, 0x43ac
/* 00007808 4BFF8955 */ bl load_tpl
/* 0000780C 809D0D5C */ lwz r4, 0xd5c(r29)
/* 00007810 90640000 */ stw r3, 0(r4)
/* 00007814 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007818 80830000 */ lwz r4, 0(r3)
/* 0000781C 28040000 */ cmplwi r4, 0
/* 00007820 41820014 */ beq lbl_00007834
/* 00007824 387E43B8 */ addi r3, r30, 0x43b8
/* 00007828 4BFF8935 */ bl load_gma
/* 0000782C 809D0D5C */ lwz r4, 0xd5c(r29)
/* 00007830 90640004 */ stw r3, 4(r4)
lbl_00007834:
/* 00007834 387E35F8 */ addi r3, r30, 0x35f8
/* 00007838 4BFF8925 */ bl DVDChangeDir
/* 0000783C 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007840 80630004 */ lwz r3, 4(r3)
/* 00007844 80030000 */ lwz r0, 0(r3)
/* 00007848 2C000000 */ cmpwi r0, 0
/* 0000784C 408102B8 */ ble lbl_00007B04
/* 00007850 3B400000 */ li r26, 0
/* 00007854 3B200000 */ li r25, 0
/* 00007858 48000094 */ b lbl_000078EC
lbl_0000785C:
/* 0000785C 57231838 */ slwi r3, r25, 3
/* 00007860 80840008 */ lwz r4, 8(r4)
/* 00007864 38030004 */ addi r0, r3, 4
/* 00007868 7EE4002E */ lwzx r23, r4, r0
/* 0000786C 7EE3BB78 */ mr r3, r23
/* 00007870 4BFF88ED */ bl strlen
/* 00007874 7C7B1B78 */ mr r27, r3
/* 00007878 48000008 */ b lbl_00007880
lbl_0000787C:
/* 0000787C 3B7BFFFF */ addi r27, r27, -1  ;# fixed addi
lbl_00007880:
/* 00007880 381BFFFF */ addi r0, r27, -1  ;# fixed addi
/* 00007884 7C1700AE */ lbzx r0, r23, r0
/* 00007888 7C000774 */ extsb r0, r0
/* 0000788C 2C000030 */ cmpwi r0, 0x30
/* 00007890 4180000C */ blt lbl_0000789C
/* 00007894 2C000039 */ cmpwi r0, 0x39
/* 00007898 4081FFE4 */ ble lbl_0000787C
lbl_0000789C:
/* 0000789C 3B990001 */ addi r28, r25, 1
/* 000078A0 57991838 */ slwi r25, r28, 3
/* 000078A4 4800002C */ b lbl_000078D0
lbl_000078A8:
/* 000078A8 80830008 */ lwz r4, 8(r3)
/* 000078AC 38190004 */ addi r0, r25, 4
/* 000078B0 38770000 */ addi r3, r23, 0
/* 000078B4 7C84002E */ lwzx r4, r4, r0
/* 000078B8 7F65DB78 */ mr r5, r27
/* 000078BC 4BFF88A1 */ bl strncmp
/* 000078C0 2C030000 */ cmpwi r3, 0
/* 000078C4 40820020 */ bne lbl_000078E4
/* 000078C8 3B390008 */ addi r25, r25, 8
/* 000078CC 3B9C0001 */ addi r28, r28, 1
lbl_000078D0:
/* 000078D0 807D0D5C */ lwz r3, 0xd5c(r29)
/* 000078D4 80630004 */ lwz r3, 4(r3)
/* 000078D8 80030000 */ lwz r0, 0(r3)
/* 000078DC 7C1C0000 */ cmpw r28, r0
/* 000078E0 4180FFC8 */ blt lbl_000078A8
lbl_000078E4:
/* 000078E4 3B3C0000 */ addi r25, r28, 0
/* 000078E8 3B5A0001 */ addi r26, r26, 1
lbl_000078EC:
/* 000078EC 807D0D5C */ lwz r3, 0xd5c(r29)
/* 000078F0 80830004 */ lwz r4, 4(r3)
/* 000078F4 80040000 */ lwz r0, 0(r4)
/* 000078F8 7C190000 */ cmpw r25, r0
/* 000078FC 4180FF60 */ blt lbl_0000785C
/* 00007900 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007904 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00007908 5757103A */ slwi r23, r26, 2
/* 0000790C 80630000 */ lwz r3, 0(r3)
/* 00007910 7EE4BB78 */ mr r4, r23
/* 00007914 4BFF8849 */ bl OSAllocFromHeap
/* 00007918 809D0D5C */ lwz r4, 0xd5c(r29)
/* 0000791C 90640014 */ stw r3, 0x14(r4)
/* 00007920 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007924 80030014 */ lwz r0, 0x14(r3)
/* 00007928 28000000 */ cmplwi r0, 0
/* 0000792C 40820018 */ bne lbl_00007944
/* 00007930 387E0134 */ addi r3, r30, 0x134
/* 00007934 4CC63182 */ crclr 6
/* 00007938 38BE439C */ addi r5, r30, 0x439c
/* 0000793C 388013CC */ li r4, 0x13cc
/* 00007940 4BFF881D */ bl OSPanic
lbl_00007944:
/* 00007944 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007948 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000794C 80630000 */ lwz r3, 0(r3)
/* 00007950 7EE4BB78 */ mr r4, r23
/* 00007954 4BFF8809 */ bl OSAllocFromHeap
/* 00007958 809D0D5C */ lwz r4, 0xd5c(r29)
/* 0000795C 90640018 */ stw r3, 0x18(r4)
/* 00007960 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007964 80030018 */ lwz r0, 0x18(r3)
/* 00007968 28000000 */ cmplwi r0, 0
/* 0000796C 40820018 */ bne lbl_00007984
/* 00007970 387E0134 */ addi r3, r30, 0x134
/* 00007974 4CC63182 */ crclr 6
/* 00007978 38BE439C */ addi r5, r30, 0x439c
/* 0000797C 388013CE */ li r4, 0x13ce
/* 00007980 4BFF87DD */ bl OSPanic
lbl_00007984:
/* 00007984 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007988 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000798C 80630000 */ lwz r3, 0(r3)
/* 00007990 7EE4BB78 */ mr r4, r23
/* 00007994 4BFF87C9 */ bl OSAllocFromHeap
/* 00007998 809D0D5C */ lwz r4, 0xd5c(r29)
/* 0000799C 9064001C */ stw r3, 0x1c(r4)
/* 000079A0 807D0D5C */ lwz r3, 0xd5c(r29)
/* 000079A4 8003001C */ lwz r0, 0x1c(r3)
/* 000079A8 28000000 */ cmplwi r0, 0
/* 000079AC 40820018 */ bne lbl_000079C4
/* 000079B0 387E0134 */ addi r3, r30, 0x134
/* 000079B4 4CC63182 */ crclr 6
/* 000079B8 38BE439C */ addi r5, r30, 0x439c
/* 000079BC 388013D0 */ li r4, 0x13d0
/* 000079C0 4BFF879D */ bl OSPanic
lbl_000079C4:
/* 000079C4 809D0D5C */ lwz r4, 0xd5c(r29)
/* 000079C8 3B200000 */ li r25, 0
/* 000079CC 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000079D0 93440008 */ stw r26, 8(r4)
/* 000079D4 3B990000 */ addi r28, r25, 0
/* 000079D8 3BE30000 */ addi r31, r3, __OSCurrHeap@l
/* 000079DC 48000114 */ b lbl_00007AF0
lbl_000079E0:
/* 000079E0 57231838 */ slwi r3, r25, 3
/* 000079E4 80840008 */ lwz r4, 8(r4)
/* 000079E8 38030004 */ addi r0, r3, 4
/* 000079EC 7F64002E */ lwzx r27, r4, r0
/* 000079F0 7F63DB78 */ mr r3, r27
/* 000079F4 4BFF8769 */ bl strlen
/* 000079F8 7C7A1B78 */ mr r26, r3
/* 000079FC 48000008 */ b lbl_00007A04
lbl_00007A00:
/* 00007A00 3B5AFFFF */ addi r26, r26, -1  ;# fixed addi
lbl_00007A04:
/* 00007A04 381AFFFF */ addi r0, r26, -1  ;# fixed addi
/* 00007A08 7C1B00AE */ lbzx r0, r27, r0
/* 00007A0C 7C000774 */ extsb r0, r0
/* 00007A10 2C000030 */ cmpwi r0, 0x30
/* 00007A14 4180000C */ blt lbl_00007A20
/* 00007A18 2C000039 */ cmpwi r0, 0x39
/* 00007A1C 4081FFE4 */ ble lbl_00007A00
lbl_00007A20:
/* 00007A20 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007A24 389A0001 */ addi r4, r26, 1
/* 00007A28 80630014 */ lwz r3, 0x14(r3)
/* 00007A2C 7F23E12E */ stwx r25, r3, r28
/* 00007A30 807F0000 */ lwz r3, 0(r31)
/* 00007A34 4BFF8729 */ bl OSAllocFromHeap
/* 00007A38 809D0D5C */ lwz r4, 0xd5c(r29)
/* 00007A3C 8084001C */ lwz r4, 0x1c(r4)
/* 00007A40 7C64E12E */ stwx r3, r4, r28
/* 00007A44 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007A48 8063001C */ lwz r3, 0x1c(r3)
/* 00007A4C 7C03E02E */ lwzx r0, r3, r28
/* 00007A50 28000000 */ cmplwi r0, 0
/* 00007A54 40820018 */ bne lbl_00007A6C
/* 00007A58 387E0134 */ addi r3, r30, 0x134
/* 00007A5C 4CC63182 */ crclr 6
/* 00007A60 38BE439C */ addi r5, r30, 0x439c
/* 00007A64 388013DC */ li r4, 0x13dc
/* 00007A68 4BFF86F5 */ bl OSPanic
lbl_00007A6C:
/* 00007A6C 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007A70 389B0000 */ addi r4, r27, 0
/* 00007A74 38BA0000 */ addi r5, r26, 0
/* 00007A78 8063001C */ lwz r3, 0x1c(r3)
/* 00007A7C 7C63E02E */ lwzx r3, r3, r28
/* 00007A80 4BFF86DD */ bl strncpy
/* 00007A84 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007A88 3B390001 */ addi r25, r25, 1
/* 00007A8C 38000000 */ li r0, 0
/* 00007A90 8063001C */ lwz r3, 0x1c(r3)
/* 00007A94 57371838 */ slwi r23, r25, 3
/* 00007A98 7C63E02E */ lwzx r3, r3, r28
/* 00007A9C 7C03D1AE */ stbx r0, r3, r26
/* 00007AA0 4800002C */ b lbl_00007ACC
lbl_00007AA4:
/* 00007AA4 80830008 */ lwz r4, 8(r3)
/* 00007AA8 38170004 */ addi r0, r23, 4
/* 00007AAC 387B0000 */ addi r3, r27, 0
/* 00007AB0 7C84002E */ lwzx r4, r4, r0
/* 00007AB4 7F45D378 */ mr r5, r26
/* 00007AB8 4BFF86A5 */ bl strncmp
/* 00007ABC 2C030000 */ cmpwi r3, 0
/* 00007AC0 40820020 */ bne lbl_00007AE0
/* 00007AC4 3AF70008 */ addi r23, r23, 8
/* 00007AC8 3B390001 */ addi r25, r25, 1
lbl_00007ACC:
/* 00007ACC 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007AD0 80630004 */ lwz r3, 4(r3)
/* 00007AD4 80030000 */ lwz r0, 0(r3)
/* 00007AD8 7C190000 */ cmpw r25, r0
/* 00007ADC 4180FFC8 */ blt lbl_00007AA4
lbl_00007AE0:
/* 00007AE0 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007AE4 80630018 */ lwz r3, 0x18(r3)
/* 00007AE8 7F23E12E */ stwx r25, r3, r28
/* 00007AEC 3B9C0004 */ addi r28, r28, 4
lbl_00007AF0:
/* 00007AF0 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007AF4 80830004 */ lwz r4, 4(r3)
/* 00007AF8 80040000 */ lwz r0, 0(r4)
/* 00007AFC 7C190000 */ cmpw r25, r0
/* 00007B00 4180FEE0 */ blt lbl_000079E0
lbl_00007B04:
/* 00007B04 7F03C378 */ mr r3, r24
/* 00007B08 4BFF8655 */ bl OSSetCurrentHeap
/* 00007B0C 3CA00000 */ lis r5, lbl_00007BE0@ha
/* 00007B10 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 00007B14 38050000 */ addi r0, r5, lbl_00007BE0@l
/* 00007B18 90040000 */ stw r0, lbl_802F1B7C@l(r4)
/* 00007B1C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00007B20 3800007F */ li r0, 0x7f
/* 00007B24 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00007B28 BAE1000C */ lmw r23, 0xc(r1)
/* 00007B2C 80010034 */ lwz r0, 0x34(r1)
/* 00007B30 38210030 */ addi r1, r1, 0x30
/* 00007B34 7C0803A6 */ mtlr r0
/* 00007B38 4E800020 */ blr 
lbl_00007B3C:
/* 00007B3C 3C600000 */ lis r3, controllerInfo@ha
/* 00007B40 38630000 */ addi r3, r3, controllerInfo@l
/* 00007B44 38C30018 */ addi r6, r3, 0x18
/* 00007B48 3C600000 */ lis r3, lbl_10000D5C@ha
/* 00007B4C A0860000 */ lhz r4, 0(r6)
/* 00007B50 38630000 */ addi r3, r3, lbl_10000D5C@l
/* 00007B54 80630000 */ lwz r3, 0(r3)
/* 00007B58 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00007B5C 80E3000C */ lwz r7, 0xc(r3)
/* 00007B60 38A3000C */ addi r5, r3, 0xc
/* 00007B64 41820018 */ beq lbl_00007B7C
/* 00007B68 80030008 */ lwz r0, 8(r3)
/* 00007B6C 38E70001 */ addi r7, r7, 1
/* 00007B70 7C070000 */ cmpw r7, r0
/* 00007B74 41800008 */ blt lbl_00007B7C
/* 00007B78 38E00000 */ li r7, 0
lbl_00007B7C:
/* 00007B7C 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00007B80 41820014 */ beq lbl_00007B94
/* 00007B84 34E7FFFF */ addic. r7, r7, -1  ;# fixed addi
/* 00007B88 4080000C */ bge lbl_00007B94
/* 00007B8C 80630008 */ lwz r3, 8(r3)
/* 00007B90 38E3FFFF */ addi r7, r3, -1  ;# fixed addi
lbl_00007B94:
/* 00007B94 90E50000 */ stw r7, 0(r5)
/* 00007B98 3C600000 */ lis r3, lbl_10000D5C@ha
/* 00007B9C 38630000 */ addi r3, r3, lbl_10000D5C@l
/* 00007BA0 A0860000 */ lhz r4, 0(r6)
/* 00007BA4 80630000 */ lwz r3, 0(r3)
/* 00007BA8 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00007BAC 84A30010 */ lwzu r5, 0x10(r3)
/* 00007BB0 41820014 */ beq lbl_00007BC4
/* 00007BB4 38A50001 */ addi r5, r5, 1
/* 00007BB8 2C05000A */ cmpwi r5, 0xa
/* 00007BBC 40810008 */ ble lbl_00007BC4
/* 00007BC0 38A0000A */ li r5, 0xa
lbl_00007BC4:
/* 00007BC4 548007FF */ clrlwi. r0, r4, 0x1f
/* 00007BC8 41820010 */ beq lbl_00007BD8
/* 00007BCC 34A5FFFF */ addic. r5, r5, -1  ;# fixed addi
/* 00007BD0 40800008 */ bge lbl_00007BD8
/* 00007BD4 38A00000 */ li r5, 0
lbl_00007BD8:
/* 00007BD8 90A30000 */ stw r5, 0(r3)
/* 00007BDC 4E800020 */ blr 
lbl_00007BE0:
/* 00007BE0 7C0802A6 */ mflr r0
/* 00007BE4 3C600000 */ lis r3, stageHeap@ha
/* 00007BE8 90010004 */ stw r0, 4(r1)
/* 00007BEC 38630000 */ addi r3, r3, stageHeap@l
/* 00007BF0 3C800000 */ lis r4, lbl_10000000@ha
/* 00007BF4 9421FFE0 */ stwu r1, -0x20(r1)
/* 00007BF8 BF61000C */ stmw r27, 0xc(r1)
/* 00007BFC 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00007C00 80630000 */ lwz r3, 0(r3)
/* 00007C04 4BFF8559 */ bl OSSetCurrentHeap
/* 00007C08 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007C0C 7C7E1B78 */ mr r30, r3
/* 00007C10 80040000 */ lwz r0, 0(r4)
/* 00007C14 28000000 */ cmplwi r0, 0
/* 00007C18 40820010 */ bne lbl_00007C28
/* 00007C1C 80040004 */ lwz r0, 4(r4)
/* 00007C20 28000000 */ cmplwi r0, 0
/* 00007C24 4182001C */ beq lbl_00007C40
lbl_00007C28:
/* 00007C28 3C600000 */ lis r3, gfxBufferInfo@ha
/* 00007C2C 38630000 */ addi r3, r3, gfxBufferInfo@l
/* 00007C30 80630000 */ lwz r3, 0(r3)
/* 00007C34 80630000 */ lwz r3, 0(r3)
/* 00007C38 4BFF8525 */ bl VISetNextFrameBuffer
/* 00007C3C 4BFF8521 */ bl VIWaitForRetrace
lbl_00007C40:
/* 00007C40 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007C44 80630000 */ lwz r3, 0(r3)
/* 00007C48 28030000 */ cmplwi r3, 0
/* 00007C4C 41820014 */ beq lbl_00007C60
/* 00007C50 4BFF850D */ bl free_tpl
/* 00007C54 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007C58 38000000 */ li r0, 0
/* 00007C5C 90030000 */ stw r0, 0(r3)
lbl_00007C60:
/* 00007C60 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007C64 80630004 */ lwz r3, 4(r3)
/* 00007C68 28030000 */ cmplwi r3, 0
/* 00007C6C 41820014 */ beq lbl_00007C80
/* 00007C70 4BFF84ED */ bl free_gma
/* 00007C74 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007C78 38000000 */ li r0, 0
/* 00007C7C 90030004 */ stw r0, 4(r3)
lbl_00007C80:
/* 00007C80 3B600000 */ li r27, 0
/* 00007C84 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007C88 577C103A */ slwi r28, r27, 2
/* 00007C8C 3BA30000 */ addi r29, r3, __OSCurrHeap@l
/* 00007C90 4800001C */ b lbl_00007CAC
lbl_00007C94:
/* 00007C94 8084001C */ lwz r4, 0x1c(r4)
/* 00007C98 807D0000 */ lwz r3, 0(r29)
/* 00007C9C 7C84E02E */ lwzx r4, r4, r28
/* 00007CA0 4BFF84BD */ bl OSFreeToHeap
/* 00007CA4 3B9C0004 */ addi r28, r28, 4
/* 00007CA8 3B7B0001 */ addi r27, r27, 1
lbl_00007CAC:
/* 00007CAC 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007CB0 80040008 */ lwz r0, 8(r4)
/* 00007CB4 7C1B0000 */ cmpw r27, r0
/* 00007CB8 4180FFDC */ blt lbl_00007C94
/* 00007CBC 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007CC0 80840014 */ lwz r4, 0x14(r4)
/* 00007CC4 3BA30000 */ addi r29, r3, __OSCurrHeap@l
/* 00007CC8 807D0000 */ lwz r3, 0(r29)
/* 00007CCC 4BFF8491 */ bl OSFreeToHeap
/* 00007CD0 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007CD4 807D0000 */ lwz r3, 0(r29)
/* 00007CD8 80840018 */ lwz r4, 0x18(r4)
/* 00007CDC 4BFF8481 */ bl OSFreeToHeap
/* 00007CE0 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007CE4 807D0000 */ lwz r3, 0(r29)
/* 00007CE8 8084001C */ lwz r4, 0x1c(r4)
/* 00007CEC 4BFF8471 */ bl OSFreeToHeap
/* 00007CF0 807D0000 */ lwz r3, 0(r29)
/* 00007CF4 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007CF8 4BFF8465 */ bl OSFreeToHeap
/* 00007CFC 38000000 */ li r0, 0
/* 00007D00 901F0D5C */ stw r0, 0xd5c(r31)
/* 00007D04 7FC3F378 */ mr r3, r30
/* 00007D08 4BFF8455 */ bl OSSetCurrentHeap
/* 00007D0C BB61000C */ lmw r27, 0xc(r1)
/* 00007D10 80010024 */ lwz r0, 0x24(r1)
/* 00007D14 38210020 */ addi r1, r1, 0x20
/* 00007D18 7C0803A6 */ mtlr r0
/* 00007D1C 4E800020 */ blr 
lbl_00007D20:
/* 00007D20 7C0802A6 */ mflr r0
/* 00007D24 3C800000 */ lis r4, lbl_10000000@ha
/* 00007D28 90010004 */ stw r0, 4(r1)
/* 00007D2C 3C600000 */ lis r3, lbl_000102B0@ha
/* 00007D30 9421FFE0 */ stwu r1, -0x20(r1)
/* 00007D34 93E1001C */ stw r31, 0x1c(r1)
/* 00007D38 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00007D3C 38800001 */ li r4, 1
/* 00007D40 93C10018 */ stw r30, 0x18(r1)
/* 00007D44 3BC30000 */ addi r30, r3, lbl_000102B0@l
/* 00007D48 38600001 */ li r3, 1
/* 00007D4C 93A10014 */ stw r29, 0x14(r1)
/* 00007D50 93810010 */ stw r28, 0x10(r1)
/* 00007D54 4BFF8409 */ bl g_debug_set_cursor_pos
/* 00007D58 387E0194 */ addi r3, r30, 0x194
/* 00007D5C 4CC63182 */ crclr 6
/* 00007D60 4BFF83FD */ bl g_debug_printf
/* 00007D64 38600003 */ li r3, 3
/* 00007D68 38800003 */ li r4, 3
/* 00007D6C 4BFF83F1 */ bl g_debug_set_cursor_pos
/* 00007D70 387E43C4 */ addi r3, r30, 0x43c4
/* 00007D74 4BFF83E9 */ bl g_debug_print
/* 00007D78 38600001 */ li r3, 1
/* 00007D7C 4BFF83E1 */ bl g_debug_set_text_color
/* 00007D80 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007D84 387E43CC */ addi r3, r30, 0x43cc
/* 00007D88 4CC63182 */ crclr 6
/* 00007D8C 80840010 */ lwz r4, 0x10(r4)
/* 00007D90 4BFF83CD */ bl g_debug_printf
/* 00007D94 38600000 */ li r3, 0
/* 00007D98 4BFF83C5 */ bl g_debug_set_text_color
/* 00007D9C 38600003 */ li r3, 3
/* 00007DA0 38800005 */ li r4, 5
/* 00007DA4 4BFF83B9 */ bl g_debug_set_cursor_pos
/* 00007DA8 3B800000 */ li r28, 0
/* 00007DAC 579D103A */ slwi r29, r28, 2
/* 00007DB0 48000068 */ b lbl_00007E18
lbl_00007DB4:
/* 00007DB4 8007000C */ lwz r0, 0xc(r7)
/* 00007DB8 7C1C0000 */ cmpw r28, r0
/* 00007DBC 40820028 */ bne lbl_00007DE4
/* 00007DC0 38600001 */ li r3, 1
/* 00007DC4 4BFF8399 */ bl g_debug_set_text_color
/* 00007DC8 3860FFFF */ li r3, -1
/* 00007DCC 38800000 */ li r4, 0
/* 00007DD0 4BFF838D */ bl func_8002FC90
/* 00007DD4 387E0400 */ addi r3, r30, 0x400
/* 00007DD8 4BFF8385 */ bl g_debug_print
/* 00007DDC 38600000 */ li r3, 0
/* 00007DE0 4BFF837D */ bl g_debug_set_text_color
lbl_00007DE4:
/* 00007DE4 80DF0D5C */ lwz r6, 0xd5c(r31)
/* 00007DE8 387E43D0 */ addi r3, r30, 0x43d0
/* 00007DEC 4CC63182 */ crclr 6
/* 00007DF0 80A60014 */ lwz r5, 0x14(r6)
/* 00007DF4 80860018 */ lwz r4, 0x18(r6)
/* 00007DF8 80C6001C */ lwz r6, 0x1c(r6)
/* 00007DFC 7CA5E82E */ lwzx r5, r5, r29
/* 00007E00 7C04E82E */ lwzx r0, r4, r29
/* 00007E04 7C86E82E */ lwzx r4, r6, r29
/* 00007E08 7CA50050 */ subf r5, r5, r0
/* 00007E0C 4BFF8351 */ bl g_debug_printf
/* 00007E10 3BBD0004 */ addi r29, r29, 4
/* 00007E14 3B9C0001 */ addi r28, r28, 1
lbl_00007E18:
/* 00007E18 80FF0D5C */ lwz r7, 0xd5c(r31)
/* 00007E1C 80070008 */ lwz r0, 8(r7)
/* 00007E20 7C1C0000 */ cmpw r28, r0
/* 00007E24 4180FF90 */ blt lbl_00007DB4
/* 00007E28 3C800000 */ lis r4, unpausedFrameCounter@ha
/* 00007E2C 80670010 */ lwz r3, 0x10(r7)
/* 00007E30 38840000 */ addi r4, r4, unpausedFrameCounter@l
/* 00007E34 80A7000C */ lwz r5, 0xc(r7)
/* 00007E38 80840000 */ lwz r4, 0(r4)
/* 00007E3C 38030001 */ addi r0, r3, 1
/* 00007E40 80C70014 */ lwz r6, 0x14(r7)
/* 00007E44 54A5103A */ slwi r5, r5, 2
/* 00007E48 7C840396 */ divwu r4, r4, r0
/* 00007E4C 80670018 */ lwz r3, 0x18(r7)
/* 00007E50 7CC6282E */ lwzx r6, r6, r5
/* 00007E54 7C03282E */ lwzx r0, r3, r5
/* 00007E58 7C660050 */ subf r3, r6, r0
/* 00007E5C 7C041B96 */ divwu r0, r4, r3
/* 00007E60 7C0019D6 */ mullw r0, r0, r3
/* 00007E64 7C002050 */ subf r0, r0, r4
/* 00007E68 7FA60214 */ add r29, r6, r0
/* 00007E6C 38600001 */ li r3, 1
/* 00007E70 38800023 */ li r4, 0x23
/* 00007E74 4BFF82E9 */ bl g_debug_set_cursor_pos
/* 00007E78 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007E7C 57BD1838 */ slwi r29, r29, 3
/* 00007E80 80630004 */ lwz r3, 4(r3)
/* 00007E84 80030008 */ lwz r0, 8(r3)
/* 00007E88 7C60EA14 */ add r3, r0, r29
/* 00007E8C 80630004 */ lwz r3, 4(r3)
/* 00007E90 4BFF82CD */ bl g_debug_print
/* 00007E94 4BFF82C9 */ bl mathutil_mtxA_from_mtxB
/* 00007E98 3C600000 */ lis r3, mathutilData@ha
/* 00007E9C 38630000 */ addi r3, r3, mathutilData@l
/* 00007EA0 80630000 */ lwz r3, 0(r3)
/* 00007EA4 38800000 */ li r4, 0
/* 00007EA8 4BFF82B5 */ bl g_gxutil_upload_some_mtx
/* 00007EAC 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007EB0 80630004 */ lwz r3, 4(r3)
/* 00007EB4 80630008 */ lwz r3, 8(r3)
/* 00007EB8 7C63E82E */ lwzx r3, r3, r29
/* 00007EBC 4BFF82A1 */ bl g_avdisp_maybe_draw_model_1
/* 00007EC0 80010024 */ lwz r0, 0x24(r1)
/* 00007EC4 83E1001C */ lwz r31, 0x1c(r1)
/* 00007EC8 83C10018 */ lwz r30, 0x18(r1)
/* 00007ECC 7C0803A6 */ mtlr r0
/* 00007ED0 83A10014 */ lwz r29, 0x14(r1)
/* 00007ED4 83810010 */ lwz r28, 0x10(r1)
/* 00007ED8 38210020 */ addi r1, r1, 0x20
/* 00007EDC 4E800020 */ blr 
lbl_00007EE0:
/* 00007EE0 7C0802A6 */ mflr r0
/* 00007EE4 90010004 */ stw r0, 4(r1)
/* 00007EE8 9421FFF8 */ stwu r1, -8(r1)
/* 00007EEC 4BFF8271 */ bl DEMOInitROMFont
/* 00007EF0 3CA00000 */ lis r5, lbl_00007FE8@ha
/* 00007EF4 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 00007EF8 38050000 */ addi r0, r5, lbl_00007FE8@l
/* 00007EFC 90040000 */ stw r0, lbl_802F1B7C@l(r4)
/* 00007F00 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00007F04 38000081 */ li r0, 0x81
/* 00007F08 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00007F0C 8001000C */ lwz r0, 0xc(r1)
/* 00007F10 38210008 */ addi r1, r1, 8
/* 00007F14 7C0803A6 */ mtlr r0
/* 00007F18 4E800020 */ blr 
lbl_00007F1C:
/* 00007F1C 3C600000 */ lis r3, controllerInfo@ha
/* 00007F20 38A30000 */ addi r5, r3, controllerInfo@l
/* 00007F24 A0C50030 */ lhz r6, 0x30(r5)
/* 00007F28 3C600000 */ lis r3, lbl_10000D60@ha
/* 00007F2C 38630000 */ addi r3, r3, lbl_10000D60@l
/* 00007F30 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 00007F34 A0630000 */ lhz r3, 0(r3)
/* 00007F38 40820040 */ bne lbl_00007F78
/* 00007F3C 3C800000 */ lis r4, analogButtonInfo@ha
/* 00007F40 38840000 */ addi r4, r4, analogButtonInfo@l
/* 00007F44 A0040008 */ lhz r0, 8(r4)
/* 00007F48 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F4C 4082002C */ bne lbl_00007F78
/* 00007F50 A0050000 */ lhz r0, 0(r5)
/* 00007F54 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F58 40820010 */ bne lbl_00007F68
/* 00007F5C A0040000 */ lhz r0, 0(r4)
/* 00007F60 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F64 41820024 */ beq lbl_00007F88
lbl_00007F68:
/* 00007F68 3C800000 */ lis r4, analogButtonInfo@ha
/* 00007F6C A0040000 */ lhz r0, analogButtonInfo@l(r4)
/* 00007F70 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00007F74 41820014 */ beq lbl_00007F88
lbl_00007F78:
/* 00007F78 38630001 */ addi r3, r3, 1
/* 00007F7C 28030018 */ cmplwi r3, 0x18
/* 00007F80 41800008 */ blt lbl_00007F88
/* 00007F84 38600000 */ li r3, 0
lbl_00007F88:
/* 00007F88 54C00739 */ rlwinm. r0, r6, 0, 0x1c, 0x1c
/* 00007F8C 40820044 */ bne lbl_00007FD0
/* 00007F90 3C800000 */ lis r4, analogButtonInfo@ha
/* 00007F94 38A40000 */ addi r5, r4, analogButtonInfo@l
/* 00007F98 A0050008 */ lhz r0, 8(r5)
/* 00007F9C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FA0 40820030 */ bne lbl_00007FD0
/* 00007FA4 3C800000 */ lis r4, controllerInfo@ha
/* 00007FA8 A0040000 */ lhz r0, controllerInfo@l(r4)
/* 00007FAC 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FB0 40820010 */ bne lbl_00007FC0
/* 00007FB4 A0050000 */ lhz r0, 0(r5)
/* 00007FB8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FBC 41820020 */ beq lbl_00007FDC
lbl_00007FC0:
/* 00007FC0 3C800000 */ lis r4, analogButtonInfo@ha
/* 00007FC4 A0040000 */ lhz r0, analogButtonInfo@l(r4)
/* 00007FC8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00007FCC 41820010 */ beq lbl_00007FDC
lbl_00007FD0:
/* 00007FD0 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 00007FD4 40800008 */ bge lbl_00007FDC
/* 00007FD8 38600017 */ li r3, 0x17
lbl_00007FDC:
/* 00007FDC 3C800000 */ lis r4, lbl_10000D60@ha
/* 00007FE0 B0640000 */ sth r3, lbl_10000D60@l(r4)
/* 00007FE4 4E800020 */ blr 
lbl_00007FE8:
/* 00007FE8 7C0802A6 */ mflr r0
/* 00007FEC 90010004 */ stw r0, 4(r1)
/* 00007FF0 9421FFF8 */ stwu r1, -8(r1)
/* 00007FF4 4BFF8169 */ bl func_800A5704
/* 00007FF8 8001000C */ lwz r0, 0xc(r1)
/* 00007FFC 38210008 */ addi r1, r1, 8
/* 00008000 7C0803A6 */ mtlr r0
/* 00008004 4E800020 */ blr 
lbl_00008008:
/* 00008008 7C0802A6 */ mflr r0
/* 0000800C 38600001 */ li r3, 1
/* 00008010 90010004 */ stw r0, 4(r1)
/* 00008014 38800001 */ li r4, 1
/* 00008018 9421FF98 */ stwu r1, -0x68(r1)
/* 0000801C 93E10064 */ stw r31, 0x64(r1)
/* 00008020 93C10060 */ stw r30, 0x60(r1)
/* 00008024 93A1005C */ stw r29, 0x5c(r1)
/* 00008028 93810058 */ stw r28, 0x58(r1)
/* 0000802C 4BFF8131 */ bl g_debug_set_cursor_pos
/* 00008030 3C600000 */ lis r3, lbl_0001468C@ha
/* 00008034 38630000 */ addi r3, r3, lbl_0001468C@l
/* 00008038 4BFF8125 */ bl g_debug_print
/* 0000803C 3C600000 */ lis r3, lbl_10000D60@ha
/* 00008040 4CC63182 */ crclr 6
/* 00008044 3BE30000 */ addi r31, r3, lbl_10000D60@l
/* 00008048 A01F0000 */ lhz r0, 0(r31)
/* 0000804C 3C600000 */ lis r3, lbl_0001469C@ha
/* 00008050 38630000 */ addi r3, r3, lbl_0001469C@l
/* 00008054 5404402E */ slwi r4, r0, 8
/* 00008058 3C840001 */ addis r4, r4, 1
/* 0000805C 38848140 */ addi r4, r4, -32448  ;# fixed addi
/* 00008060 4BFF80FD */ bl g_debug_printf
/* 00008064 38600002 */ li r3, 2
/* 00008068 38800280 */ li r4, 0x280
/* 0000806C 38A001C0 */ li r5, 0x1c0
/* 00008070 4BFF80ED */ bl DEMOInitCaption
/* 00008074 3B810018 */ addi r28, r1, 0x18
/* 00008078 3BA00000 */ li r29, 0
/* 0000807C 3BC00000 */ li r30, 0
lbl_00008080:
/* 00008080 A01F0000 */ lhz r0, 0(r31)
/* 00008084 5403402E */ slwi r3, r0, 8
/* 00008088 3C630001 */ addis r3, r3, 1
/* 0000808C 38638140 */ addi r3, r3, -32448  ;# fixed addi
/* 00008090 28038100 */ cmplwi r3, 0x8100
/* 00008094 4180000C */ blt lbl_000080A0
/* 00008098 28039F00 */ cmplwi r3, 0x9f00
/* 0000809C 40810014 */ ble lbl_000080B0
lbl_000080A0:
/* 000080A0 2803E000 */ cmplwi r3, 0xe000
/* 000080A4 418000E8 */ blt lbl_0000818C
/* 000080A8 2803FC00 */ cmplwi r3, 0xfc00
/* 000080AC 418100E0 */ bgt lbl_0000818C
lbl_000080B0:
/* 000080B0 39000000 */ li r8, 0
/* 000080B4 2C080010 */ cmpwi r8, 0x10
/* 000080B8 408000A8 */ bge lbl_00008160
/* 000080BC 3D080001 */ addis r8, r8, 1
/* 000080C0 7C88F214 */ add r4, r8, r30
/* 000080C4 540A402E */ slwi r10, r0, 8
/* 000080C8 7CE45214 */ add r7, r4, r10
/* 000080CC 38878140 */ addi r4, r7, -32448  ;# fixed addi
/* 000080D0 B0810018 */ sth r4, 0x18(r1)
/* 000080D4 38678141 */ addi r3, r7, -32447  ;# fixed addi
/* 000080D8 39000008 */ li r8, 8
/* 000080DC B061001A */ sth r3, 0x1a(r1)
/* 000080E0 38078142 */ addi r0, r7, -32446  ;# fixed addi
/* 000080E4 38C78143 */ addi r6, r7, -32445  ;# fixed addi
/* 000080E8 B001001C */ sth r0, 0x1c(r1)
/* 000080EC 38A78144 */ addi r5, r7, -32444  ;# fixed addi
/* 000080F0 38878145 */ addi r4, r7, -32443  ;# fixed addi
/* 000080F4 B0C1001E */ sth r6, 0x1e(r1)
/* 000080F8 38678146 */ addi r3, r7, -32442  ;# fixed addi
/* 000080FC 3D080001 */ addis r8, r8, 1
/* 00008100 B0A10020 */ sth r5, 0x20(r1)
/* 00008104 38078147 */ addi r0, r7, -32441  ;# fixed addi
/* 00008108 B0810022 */ sth r4, 0x22(r1)
/* 0000810C 7C88F214 */ add r4, r8, r30
/* 00008110 7CE45214 */ add r7, r4, r10
/* 00008114 B0610024 */ sth r3, 0x24(r1)
/* 00008118 38878140 */ addi r4, r7, -32448  ;# fixed addi
/* 0000811C 38678141 */ addi r3, r7, -32447  ;# fixed addi
/* 00008120 B0010026 */ sth r0, 0x26(r1)
/* 00008124 38078142 */ addi r0, r7, -32446  ;# fixed addi
/* 00008128 38C78143 */ addi r6, r7, -32445  ;# fixed addi
/* 0000812C B0810028 */ sth r4, 0x28(r1)
/* 00008130 38A78144 */ addi r5, r7, -32444  ;# fixed addi
/* 00008134 38878145 */ addi r4, r7, -32443  ;# fixed addi
/* 00008138 B061002A */ sth r3, 0x2a(r1)
/* 0000813C 38678146 */ addi r3, r7, -32442  ;# fixed addi
/* 00008140 39000010 */ li r8, 0x10
/* 00008144 B001002C */ sth r0, 0x2c(r1)
/* 00008148 38078147 */ addi r0, r7, -32441  ;# fixed addi
/* 0000814C B0C1002E */ sth r6, 0x2e(r1)
/* 00008150 B0A10030 */ sth r5, 0x30(r1)
/* 00008154 B0810032 */ sth r4, 0x32(r1)
/* 00008158 B0610034 */ sth r3, 0x34(r1)
/* 0000815C B0010036 */ sth r0, 0x36(r1)
lbl_00008160:
/* 00008160 381D0001 */ addi r0, r29, 1
/* 00008164 4CC63182 */ crclr 6
/* 00008168 1C600017 */ mulli r3, r0, 0x17
/* 0000816C 5500083C */ slwi r0, r8, 1
/* 00008170 38800000 */ li r4, 0
/* 00008174 7C9C032E */ sthx r4, r28, r0
/* 00008178 38DC0000 */ addi r6, r28, 0
/* 0000817C 38830028 */ addi r4, r3, 0x28
/* 00008180 38600088 */ li r3, 0x88
/* 00008184 38A0000A */ li r5, 0xa
/* 00008188 4BFF7FD5 */ bl DEMORFPrintf
lbl_0000818C:
/* 0000818C 3BBD0001 */ addi r29, r29, 1
/* 00008190 2C1D0010 */ cmpwi r29, 0x10
/* 00008194 3BDE0010 */ addi r30, r30, 0x10
/* 00008198 4180FEE8 */ blt lbl_00008080
/* 0000819C 8001006C */ lwz r0, 0x6c(r1)
/* 000081A0 83E10064 */ lwz r31, 0x64(r1)
/* 000081A4 83C10060 */ lwz r30, 0x60(r1)
/* 000081A8 7C0803A6 */ mtlr r0
/* 000081AC 83A1005C */ lwz r29, 0x5c(r1)
/* 000081B0 83810058 */ lwz r28, 0x58(r1)
/* 000081B4 38210068 */ addi r1, r1, 0x68
/* 000081B8 4E800020 */ blr 
lbl_000081BC:
/* 000081BC 7C0802A6 */ mflr r0
/* 000081C0 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 000081C4 90010004 */ stw r0, 4(r1)
/* 000081C8 3C800000 */ lis r4, lbl_10000000@ha
/* 000081CC 9421FFE0 */ stwu r1, -0x20(r1)
/* 000081D0 BF61000C */ stmw r27, 0xc(r1)
/* 000081D4 3BC00000 */ li r30, 0
/* 000081D8 3B840000 */ addi r28, r4, lbl_10000000@l
/* 000081DC 3BE00001 */ li r31, 1
/* 000081E0 93C30000 */ stw r30, unpausedFrameCounter@l(r3)
/* 000081E4 3C600000 */ lis r3, lbl_000102B0@ha
/* 000081E8 3BA30000 */ addi r29, r3, lbl_000102B0@l
/* 000081EC B3FC0D62 */ sth r31, 0xd62(r28)
/* 000081F0 A87C0D62 */ lha r3, 0xd62(r28)
/* 000081F4 4BFF7F69 */ bl func_800569B4
/* 000081F8 A87C0D62 */ lha r3, 0xd62(r28)
/* 000081FC 4BFF7F61 */ bl load_stage
/* 00008200 3C600000 */ lis r3, modeCtrl@ha
/* 00008204 38630000 */ addi r3, r3, modeCtrl@l
/* 00008208 93C30028 */ stw r30, 0x28(r3)
/* 0000820C 93E30030 */ stw r31, 0x30(r3)
/* 00008210 4BFF7F4D */ bl event_finish_all
/* 00008214 38600001 */ li r3, 1
/* 00008218 4BFF7F45 */ bl event_start
/* 0000821C 38600004 */ li r3, 4
/* 00008220 4BFF7F3D */ bl event_start
/* 00008224 3860000D */ li r3, 0xd
/* 00008228 4BFF7F35 */ bl event_start
/* 0000822C 38600013 */ li r3, 0x13
/* 00008230 4BFF7F2D */ bl event_start
/* 00008234 3860000F */ li r3, 0xf
/* 00008238 4BFF7F25 */ bl event_start
/* 0000823C 38600005 */ li r3, 5
/* 00008240 4BFF7F1D */ bl event_start
/* 00008244 38600010 */ li r3, 0x10
/* 00008248 4BFF7F15 */ bl event_start
/* 0000824C 3860000C */ li r3, 0xc
/* 00008250 4BFF7F0D */ bl camera_set_state
/* 00008254 3C600000 */ lis r3, spritePoolInfo@ha
/* 00008258 38630000 */ addi r3, r3, spritePoolInfo@l
/* 0000825C 3883000C */ addi r4, r3, 0xc
/* 00008260 8063000C */ lwz r3, 0xc(r3)
/* 00008264 38000002 */ li r0, 2
/* 00008268 3BFD4464 */ addi r31, r29, 0x4464
/* 0000826C 98030000 */ stb r0, 0(r3)
/* 00008270 3B600000 */ li r27, 0
/* 00008274 80640000 */ lwz r3, 0(r4)
/* 00008278 9BC30001 */ stb r30, 1(r3)
/* 0000827C 80640000 */ lwz r3, 0(r4)
/* 00008280 9BC30002 */ stb r30, 2(r3)
/* 00008284 80640000 */ lwz r3, 0(r4)
/* 00008288 9BC30003 */ stb r30, 3(r3)
/* 0000828C 93DC0D68 */ stw r30, 0xd68(r28)
lbl_00008290:
/* 00008290 A07F0004 */ lhz r3, 4(r31)
/* 00008294 38A00005 */ li r5, 5
/* 00008298 A09F0006 */ lhz r4, 6(r31)
/* 0000829C 38C00000 */ li r6, 0
/* 000082A0 38E00000 */ li r7, 0
/* 000082A4 4BFF7EB9 */ bl GXGetTexBufferSize
/* 000082A8 801C0D68 */ lwz r0, 0xd68(r28)
/* 000082AC 7C030000 */ cmpw r3, r0
/* 000082B0 40810008 */ ble lbl_000082B8
/* 000082B4 907C0D68 */ stw r3, 0xd68(r28)
lbl_000082B8:
/* 000082B8 3B7B0001 */ addi r27, r27, 1
/* 000082BC 281B0009 */ cmplwi r27, 9
/* 000082C0 3BFF000C */ addi r31, r31, 0xc
/* 000082C4 4180FFCC */ blt lbl_00008290
/* 000082C8 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000082CC 809C0D68 */ lwz r4, 0xd68(r28)
/* 000082D0 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 000082D4 80630000 */ lwz r3, 0(r3)
/* 000082D8 4BFF7E85 */ bl OSAllocFromHeap
/* 000082DC 907C0D64 */ stw r3, 0xd64(r28)
/* 000082E0 801C0D64 */ lwz r0, 0xd64(r28)
/* 000082E4 28000000 */ cmplwi r0, 0
/* 000082E8 40820018 */ bne lbl_00008300
/* 000082EC 387D0134 */ addi r3, r29, 0x134
/* 000082F0 4CC63182 */ crclr 6
/* 000082F4 38BD44D0 */ addi r5, r29, 0x44d0
/* 000082F8 3880150A */ li r4, 0x150a
/* 000082FC 4BFF7E61 */ bl OSPanic
lbl_00008300:
/* 00008300 3C600000 */ lis r3, modeCtrl@ha
/* 00008304 38C30000 */ addi r6, r3, modeCtrl@l
/* 00008308 38000000 */ li r0, 0
/* 0000830C 90060000 */ stw r0, 0(r6)
/* 00008310 3CA00000 */ lis r5, lbl_00008808@ha
/* 00008314 3C800000 */ lis r4, lbl_802F1B7C@ha
/* 00008318 90060010 */ stw r0, 0x10(r6)
/* 0000831C 38A50000 */ addi r5, r5, lbl_00008808@l
/* 00008320 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00008324 80060008 */ lwz r0, 8(r6)
/* 00008328 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 0000832C 90060008 */ stw r0, 8(r6)
/* 00008330 38000083 */ li r0, 0x83
/* 00008334 90A40000 */ stw r5, lbl_802F1B7C@l(r4)
/* 00008338 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 0000833C BB61000C */ lmw r27, 0xc(r1)
/* 00008340 80010024 */ lwz r0, 0x24(r1)
/* 00008344 38210020 */ addi r1, r1, 0x20
/* 00008348 7C0803A6 */ mtlr r0
/* 0000834C 4E800020 */ blr 
lbl_00008350:
/* 00008350 7C0802A6 */ mflr r0
/* 00008354 3C600000 */ lis r3, modeCtrl@ha
/* 00008358 90010004 */ stw r0, 4(r1)
/* 0000835C 3CA00000 */ lis r5, lbl_0000FE78@ha
/* 00008360 3C800000 */ lis r4, lbl_10000000@ha
/* 00008364 9421FEC0 */ stwu r1, -0x140(r1)
/* 00008368 BF410128 */ stmw r26, 0x128(r1)
/* 0000836C 3B430000 */ addi r26, r3, modeCtrl@l
/* 00008370 3C600000 */ lis r3, lbl_000102B0@ha
/* 00008374 3B9A0008 */ addi r28, r26, 8
/* 00008378 3BE50000 */ addi r31, r5, lbl_0000FE78@l
/* 0000837C 3BA40000 */ addi r29, r4, lbl_10000000@l
/* 00008380 3BC30000 */ addi r30, r3, lbl_000102B0@l
/* 00008384 801A0008 */ lwz r0, 8(r26)
/* 00008388 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000838C 40820254 */ bne lbl_000085E0
/* 00008390 3C600000 */ lis r3, controllerInfo@ha
/* 00008394 809A0010 */ lwz r4, 0x10(r26)
/* 00008398 38C30000 */ addi r6, r3, controllerInfo@l
/* 0000839C A0E60030 */ lhz r7, 0x30(r6)
/* 000083A0 387A0010 */ addi r3, r26, 0x10
/* 000083A4 54E00739 */ rlwinm. r0, r7, 0, 0x1c, 0x1c
/* 000083A8 40820040 */ bne lbl_000083E8
/* 000083AC 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000083B0 38A50000 */ addi r5, r5, analogButtonInfo@l
/* 000083B4 A0050008 */ lhz r0, 8(r5)
/* 000083B8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000083BC 4082002C */ bne lbl_000083E8
/* 000083C0 A0060000 */ lhz r0, 0(r6)
/* 000083C4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000083C8 40820010 */ bne lbl_000083D8
/* 000083CC A0050000 */ lhz r0, 0(r5)
/* 000083D0 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000083D4 41820020 */ beq lbl_000083F4
lbl_000083D8:
/* 000083D8 3CA00000 */ lis r5, analogButtonInfo@ha
/* 000083DC A0050000 */ lhz r0, analogButtonInfo@l(r5)
/* 000083E0 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000083E4 41820010 */ beq lbl_000083F4
lbl_000083E8:
/* 000083E8 3484FFFF */ addic. r4, r4, -1  ;# fixed addi
/* 000083EC 40800008 */ bge lbl_000083F4
/* 000083F0 38800008 */ li r4, 8
lbl_000083F4:
/* 000083F4 54E0077B */ rlwinm. r0, r7, 0, 0x1d, 0x1d
/* 000083F8 40820044 */ bne lbl_0000843C
/* 000083FC 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00008400 38C50000 */ addi r6, r5, analogButtonInfo@l
/* 00008404 A0060008 */ lhz r0, 8(r6)
/* 00008408 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000840C 40820030 */ bne lbl_0000843C
/* 00008410 3CA00000 */ lis r5, controllerInfo@ha
/* 00008414 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 00008418 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000841C 40820010 */ bne lbl_0000842C
/* 00008420 A0060000 */ lhz r0, 0(r6)
/* 00008424 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008428 41820024 */ beq lbl_0000844C
lbl_0000842C:
/* 0000842C 3CA00000 */ lis r5, analogButtonInfo@ha
/* 00008430 A0050000 */ lhz r0, analogButtonInfo@l(r5)
/* 00008434 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00008438 41820014 */ beq lbl_0000844C
lbl_0000843C:
/* 0000843C 38840001 */ addi r4, r4, 1
/* 00008440 28040009 */ cmplwi r4, 9
/* 00008444 41800008 */ blt lbl_0000844C
/* 00008448 38800000 */ li r4, 0
lbl_0000844C:
/* 0000844C 3CA00000 */ lis r5, controllerInfo@ha
/* 00008450 90830000 */ stw r4, 0(r3)
/* 00008454 38850000 */ addi r4, r5, controllerInfo@l
/* 00008458 A0040018 */ lhz r0, 0x18(r4)
/* 0000845C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00008460 41820394 */ beq lbl_000087F4
/* 00008464 80030000 */ lwz r0, 0(r3)
/* 00008468 3B600000 */ li r27, 0
/* 0000846C 3F404330 */ lis r26, 0x4330
/* 00008470 1C00000C */ mulli r0, r0, 0xc
/* 00008474 7FDE0214 */ add r30, r30, r0
/* 00008478 3BDE4464 */ addi r30, r30, 0x4464
lbl_0000847C:
/* 0000847C A0BE0004 */ lhz r5, 4(r30)
/* 00008480 3CC00000 */ lis r6, lbl_0000FED0@ha
/* 00008484 A0FE0006 */ lhz r7, 6(r30)
/* 00008488 3C600000 */ lis r3, lbl_0000FED0@ha
/* 0000848C 20850270 */ subfic r4, r5, 0x270
/* 00008490 6C848000 */ xoris r4, r4, 0x8000
/* 00008494 90A10114 */ stw r5, 0x114(r1)
/* 00008498 200701B0 */ subfic r0, r7, 0x1b0
/* 0000849C C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 000084A0 90810124 */ stw r4, 0x124(r1)
/* 000084A4 6C008000 */ xoris r0, r0, 0x8000
/* 000084A8 3CA00000 */ lis r5, lbl_0000FEC8@ha
/* 000084AC C8660000 */ lfd f3, lbl_0000FED0@l(r6)
/* 000084B0 93410120 */ stw r26, 0x120(r1)
/* 000084B4 C8FF01E0 */ lfd f7, 0x1e0(r31)
/* 000084B8 3C800000 */ lis r4, lbl_0000FEC8@ha
/* 000084BC 9001011C */ stw r0, 0x11c(r1)
/* 000084C0 7F63DB78 */ mr r3, r27
/* 000084C4 C8410120 */ lfd f2, 0x120(r1)
/* 000084C8 90E1010C */ stw r7, 0x10c(r1)
/* 000084CC FC421828 */ fsub f2, f2, f3
/* 000084D0 C8850000 */ lfd f4, lbl_0000FEC8@l(r5)
/* 000084D4 93410118 */ stw r26, 0x118(r1)
/* 000084D8 C8BF01E8 */ lfd f5, 0x1e8(r31)
/* 000084DC 93410110 */ stw r26, 0x110(r1)
/* 000084E0 C8010118 */ lfd f0, 0x118(r1)
/* 000084E4 C8610110 */ lfd f3, 0x110(r1)
/* 000084E8 FCC00828 */ fsub f6, f0, f1
/* 000084EC 93410108 */ stw r26, 0x108(r1)
/* 000084F0 FC223824 */ fdiv f1, f2, f7
/* 000084F4 C8440000 */ lfd f2, lbl_0000FEC8@l(r4)
/* 000084F8 C8010108 */ lfd f0, 0x108(r1)
/* 000084FC FC632028 */ fsub f3, f3, f4
/* 00008500 FC001028 */ fsub f0, f0, f2
/* 00008504 FC462824 */ fdiv f2, f6, f5
/* 00008508 FC633824 */ fdiv f3, f3, f7
/* 0000850C FC802824 */ fdiv f4, f0, f5
/* 00008510 FC200818 */ frsp f1, f1
/* 00008514 FC401018 */ frsp f2, f2
/* 00008518 FC601818 */ frsp f3, f3
/* 0000851C FC802018 */ frsp f4, f4
/* 00008520 4BFF7C3D */ bl setup_camera_viewport
/* 00008524 3B7B0001 */ addi r27, r27, 1
/* 00008528 2C1B0004 */ cmpwi r27, 4
/* 0000852C 4180FF50 */ blt lbl_0000847C
/* 00008530 38000001 */ li r0, 1
/* 00008534 B01D0D62 */ sth r0, 0xd62(r29)
/* 00008538 4BFF7C25 */ bl event_finish_all
/* 0000853C A87D0D62 */ lha r3, 0xd62(r29)
/* 00008540 4BFF7C1D */ bl func_800569B4
/* 00008544 A87D0D62 */ lha r3, 0xd62(r29)
/* 00008548 4BFF7C15 */ bl load_stage
/* 0000854C 801E0008 */ lwz r0, 8(r30)
/* 00008550 540007FF */ clrlwi. r0, r0, 0x1f
/* 00008554 41820028 */ beq lbl_0000857C
/* 00008558 38600001 */ li r3, 1
/* 0000855C 4BFF7C01 */ bl event_start
/* 00008560 3860000F */ li r3, 0xf
/* 00008564 4BFF7BF9 */ bl event_start
/* 00008568 38600010 */ li r3, 0x10
/* 0000856C 4BFF7BF1 */ bl event_start
/* 00008570 38600048 */ li r3, 0x48
/* 00008574 4BFF7BE9 */ bl camera_set_state
/* 00008578 4800004C */ b lbl_000085C4
lbl_0000857C:
/* 0000857C A87D0D62 */ lha r3, 0xd62(r29)
/* 00008580 4BFF7BDD */ bl func_800569B4
/* 00008584 38600001 */ li r3, 1
/* 00008588 4BFF7BD5 */ bl event_start
/* 0000858C 38600004 */ li r3, 4
/* 00008590 4BFF7BCD */ bl event_start
/* 00008594 3860000D */ li r3, 0xd
/* 00008598 4BFF7BC5 */ bl event_start
/* 0000859C 38600013 */ li r3, 0x13
/* 000085A0 4BFF7BBD */ bl event_start
/* 000085A4 3860000F */ li r3, 0xf
/* 000085A8 4BFF7BB5 */ bl event_start
/* 000085AC 38600005 */ li r3, 5
/* 000085B0 4BFF7BAD */ bl event_start
/* 000085B4 38600010 */ li r3, 0x10
/* 000085B8 4BFF7BA5 */ bl event_start
/* 000085BC 3860000C */ li r3, 0xc
/* 000085C0 4BFF7B9D */ bl camera_set_state
lbl_000085C4:
/* 000085C4 801C0000 */ lwz r0, 0(r28)
/* 000085C8 3C600000 */ lis r3, modeCtrl@ha
/* 000085CC 60000004 */ ori r0, r0, 4
/* 000085D0 901C0000 */ stw r0, 0(r28)
/* 000085D4 38000000 */ li r0, 0
/* 000085D8 90030000 */ stw r0, modeCtrl@l(r3)
/* 000085DC 48000218 */ b lbl_000087F4
lbl_000085E0:
/* 000085E0 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 000085E4 3BE00000 */ li r31, 0
/* 000085E8 93E30000 */ stw r31, unpausedFrameCounter@l(r3)
/* 000085EC 4BFF7B71 */ bl event_finish_all
/* 000085F0 807A0010 */ lwz r3, 0x10(r26)
/* 000085F4 801A0000 */ lwz r0, 0(r26)
/* 000085F8 1C63000C */ mulli r3, r3, 0xc
/* 000085FC 5400073E */ clrlwi r0, r0, 0x1c
/* 00008600 7F7E1A14 */ add r27, r30, r3
/* 00008604 2C00000A */ cmpwi r0, 0xa
/* 00008608 3B7B4464 */ addi r27, r27, 0x4464
/* 0000860C 41820020 */ beq lbl_0000862C
/* 00008610 40800010 */ bge lbl_00008620
/* 00008614 2C000000 */ cmpwi r0, 0
/* 00008618 418200A4 */ beq lbl_000086BC
/* 0000861C 48000128 */ b lbl_00008744
lbl_00008620:
/* 00008620 2C00000F */ cmpwi r0, 0xf
/* 00008624 418200AC */ beq lbl_000086D0
/* 00008628 4800011C */ b lbl_00008744
lbl_0000862C:
/* 0000862C A07B0004 */ lhz r3, 4(r27)
/* 00008630 38A00005 */ li r5, 5
/* 00008634 A09B0006 */ lhz r4, 6(r27)
/* 00008638 38C00000 */ li r6, 0
/* 0000863C 38E00000 */ li r7, 0
/* 00008640 4BFF7B1D */ bl GXGetTexBufferSize
/* 00008644 7C601B78 */ mr r0, r3
/* 00008648 807D0D64 */ lwz r3, 0xd64(r29)
/* 0000864C 7C1F0378 */ mr r31, r0
/* 00008650 389F0000 */ addi r4, r31, 0
/* 00008654 4BFF7B09 */ bl DCFlushRange
/* 00008658 A0BB0004 */ lhz r5, 4(r27)
/* 0000865C 38610008 */ addi r3, r1, 8
/* 00008660 A0DB0006 */ lhz r6, 6(r27)
/* 00008664 389E44E0 */ addi r4, r30, 0x44e0
/* 00008668 A8FD0D62 */ lha r7, 0xd62(r29)
/* 0000866C 4CC63182 */ crclr 6
/* 00008670 4BFF7AED */ bl sprintf
/* 00008674 38610008 */ addi r3, r1, 8
/* 00008678 38800002 */ li r4, 2
/* 0000867C 4BFF7AE1 */ bl func_800A722C
/* 00008680 7C7A1B79 */ or. r26, r3, r3
/* 00008684 40820018 */ bne lbl_0000869C
/* 00008688 387E0134 */ addi r3, r30, 0x134
/* 0000868C 4CC63182 */ crclr 6
/* 00008690 38BE4510 */ addi r5, r30, 0x4510
/* 00008694 38801561 */ li r4, 0x1561
/* 00008698 4BFF7AC5 */ bl OSPanic
lbl_0000869C:
/* 0000869C 381F001F */ addi r0, r31, 0x1f
/* 000086A0 809D0D64 */ lwz r4, 0xd64(r29)
/* 000086A4 387A0000 */ addi r3, r26, 0
/* 000086A8 54050034 */ rlwinm r5, r0, 0, 0, 0x1a
/* 000086AC 4BFF7AB1 */ bl func_800A7440
/* 000086B0 7F43D378 */ mr r3, r26
/* 000086B4 4BFF7AA9 */ bl func_800A7314
/* 000086B8 4800008C */ b lbl_00008744
lbl_000086BC:
/* 000086BC 3C600000 */ lis r3, gamePauseStatus@ha
/* 000086C0 84030000 */ lwzu r0, gamePauseStatus@l(r3)
/* 000086C4 60000002 */ ori r0, r0, 2
/* 000086C8 90030000 */ stw r0, 0(r3)
/* 000086CC 48000078 */ b lbl_00008744
lbl_000086D0:
/* 000086D0 3C600000 */ lis r3, gamePauseStatus@ha
/* 000086D4 84030000 */ lwzu r0, gamePauseStatus@l(r3)
/* 000086D8 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 000086DC 90030000 */ stw r0, 0(r3)
/* 000086E0 AB5D0D62 */ lha r26, 0xd62(r29)
/* 000086E4 3B5A0001 */ addi r26, r26, 1
/* 000086E8 2C1A00C8 */ cmpwi r26, 0xc8
/* 000086EC 40810018 */ ble lbl_00008704
/* 000086F0 4BFF7A6D */ bl destroy_all_sprites
/* 000086F4 801C0000 */ lwz r0, 0(r28)
/* 000086F8 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 000086FC 901C0000 */ stw r0, 0(r28)
/* 00008700 48000044 */ b lbl_00008744
lbl_00008704:
/* 00008704 7F400734 */ extsh r0, r26
/* 00008708 B01D0D62 */ sth r0, 0xd62(r29)
/* 0000870C 7F43D378 */ mr r3, r26
/* 00008710 4BFF7A4D */ bl func_800569B4
/* 00008714 7F43D378 */ mr r3, r26
/* 00008718 4BFF7A45 */ bl load_stage
/* 0000871C 801B0008 */ lwz r0, 8(r27)
/* 00008720 540007FF */ clrlwi. r0, r0, 0x1f
/* 00008724 4182001C */ beq lbl_00008740
/* 00008728 7F43D378 */ mr r3, r26
/* 0000872C 4BFF7A31 */ bl func_800672D0
/* 00008730 28030000 */ cmplwi r3, 0
/* 00008734 4182000C */ beq lbl_00008740
/* 00008738 3C600000 */ lis r3, lbl_801EFC94@ha
/* 0000873C 9BE30000 */ stb r31, lbl_801EFC94@l(r3)
lbl_00008740:
/* 00008740 4BFF7A1D */ bl GXInvalidateTexAll
lbl_00008744:
/* 00008744 801B0008 */ lwz r0, 8(r27)
/* 00008748 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000874C 41820028 */ beq lbl_00008774
/* 00008750 38600001 */ li r3, 1
/* 00008754 4BFF7A09 */ bl event_start
/* 00008758 3860000F */ li r3, 0xf
/* 0000875C 4BFF7A01 */ bl event_start
/* 00008760 38600010 */ li r3, 0x10
/* 00008764 4BFF79F9 */ bl event_start
/* 00008768 38600048 */ li r3, 0x48
/* 0000876C 4BFF79F1 */ bl camera_set_state
/* 00008770 4800004C */ b lbl_000087BC
lbl_00008774:
/* 00008774 A87D0D62 */ lha r3, 0xd62(r29)
/* 00008778 4BFF79E5 */ bl func_800569B4
/* 0000877C 38600001 */ li r3, 1
/* 00008780 4BFF79DD */ bl event_start
/* 00008784 38600004 */ li r3, 4
/* 00008788 4BFF79D5 */ bl event_start
/* 0000878C 3860000D */ li r3, 0xd
/* 00008790 4BFF79CD */ bl event_start
/* 00008794 38600013 */ li r3, 0x13
/* 00008798 4BFF79C5 */ bl event_start
/* 0000879C 3860000F */ li r3, 0xf
/* 000087A0 4BFF79BD */ bl event_start
/* 000087A4 38600005 */ li r3, 5
/* 000087A8 4BFF79B5 */ bl event_start
/* 000087AC 38600010 */ li r3, 0x10
/* 000087B0 4BFF79AD */ bl event_start
/* 000087B4 3860000C */ li r3, 0xc
/* 000087B8 4BFF79A5 */ bl camera_set_state
lbl_000087BC:
/* 000087BC 3C600000 */ lis r3, controllerInfo@ha
/* 000087C0 38630000 */ addi r3, r3, controllerInfo@l
/* 000087C4 A0030018 */ lhz r0, 0x18(r3)
/* 000087C8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000087CC 41820014 */ beq lbl_000087E0
/* 000087D0 4BFF798D */ bl destroy_all_sprites
/* 000087D4 801C0000 */ lwz r0, 0(r28)
/* 000087D8 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 000087DC 901C0000 */ stw r0, 0(r28)
lbl_000087E0:
/* 000087E0 3C600000 */ lis r3, modeCtrl@ha
/* 000087E4 38830000 */ addi r4, r3, modeCtrl@l
/* 000087E8 80640000 */ lwz r3, 0(r4)
/* 000087EC 38030001 */ addi r0, r3, 1
/* 000087F0 90040000 */ stw r0, 0(r4)
lbl_000087F4:
/* 000087F4 BB410128 */ lmw r26, 0x128(r1)
/* 000087F8 80010144 */ lwz r0, 0x144(r1)
/* 000087FC 38210140 */ addi r1, r1, 0x140
/* 00008800 7C0803A6 */ mtlr r0
/* 00008804 4E800020 */ blr 
lbl_00008808:
/* 00008808 7C0802A6 */ mflr r0
/* 0000880C 3C800000 */ lis r4, __OSCurrHeap@ha
/* 00008810 90010004 */ stw r0, 4(r1)
/* 00008814 3C600000 */ lis r3, lbl_10000D64@ha
/* 00008818 38A40000 */ addi r5, r4, __OSCurrHeap@l
/* 0000881C 9421FFF8 */ stwu r1, -8(r1)
/* 00008820 38830000 */ addi r4, r3, lbl_10000D64@l
/* 00008824 80650000 */ lwz r3, 0(r5)
/* 00008828 80840000 */ lwz r4, 0(r4)
/* 0000882C 4BFF7931 */ bl OSFreeToHeap
/* 00008830 38600000 */ li r3, 0
/* 00008834 38800000 */ li r4, 0
/* 00008838 4BFF7925 */ bl GXSetPixelFmt
/* 0000883C 8001000C */ lwz r0, 0xc(r1)
/* 00008840 38210008 */ addi r1, r1, 8
/* 00008844 7C0803A6 */ mtlr r0
/* 00008848 4E800020 */ blr 
lbl_0000884C:
/* 0000884C 7C0802A6 */ mflr r0
/* 00008850 3C800000 */ lis r4, lbl_0000FE78@ha
/* 00008854 90010004 */ stw r0, 4(r1)
/* 00008858 3C600000 */ lis r3, lbl_000102B0@ha
/* 0000885C 9421FFD0 */ stwu r1, -0x30(r1)
/* 00008860 BF61001C */ stmw r27, 0x1c(r1)
/* 00008864 3BE40000 */ addi r31, r4, lbl_0000FE78@l
/* 00008868 3BA30000 */ addi r29, r3, lbl_000102B0@l
/* 0000886C 38600001 */ li r3, 1
/* 00008870 38800001 */ li r4, 1
/* 00008874 4BFF78E9 */ bl g_debug_set_cursor_pos
/* 00008878 387D4520 */ addi r3, r29, 0x4520
/* 0000887C 4BFF78E1 */ bl g_debug_print
/* 00008880 3C600000 */ lis r3, modeCtrl@ha
/* 00008884 3B9D4464 */ addi r28, r29, 0x4464
/* 00008888 3BC30000 */ addi r30, r3, modeCtrl@l
/* 0000888C 3B600000 */ li r27, 0
lbl_00008890:
/* 00008890 801E0010 */ lwz r0, 0x10(r30)
/* 00008894 7C1B0000 */ cmpw r27, r0
/* 00008898 40820028 */ bne lbl_000088C0
/* 0000889C 38600002 */ li r3, 2
/* 000088A0 389B0003 */ addi r4, r27, 3
/* 000088A4 4BFF78B9 */ bl g_debug_set_cursor_pos
/* 000088A8 38600002 */ li r3, 2
/* 000088AC 4BFF78B1 */ bl g_debug_set_text_color
/* 000088B0 387D0400 */ addi r3, r29, 0x400
/* 000088B4 4BFF78A9 */ bl g_debug_print
/* 000088B8 38600000 */ li r3, 0
/* 000088BC 4BFF78A1 */ bl g_debug_set_text_color
lbl_000088C0:
/* 000088C0 38600003 */ li r3, 3
/* 000088C4 389B0003 */ addi r4, r27, 3
/* 000088C8 4BFF7895 */ bl g_debug_set_cursor_pos
/* 000088CC A09C0004 */ lhz r4, 4(r28)
/* 000088D0 387D452C */ addi r3, r29, 0x452c
/* 000088D4 A0BC0006 */ lhz r5, 6(r28)
/* 000088D8 4CC63182 */ crclr 6
/* 000088DC 80DC0000 */ lwz r6, 0(r28)
/* 000088E0 4BFF787D */ bl g_debug_printf
/* 000088E4 3B7B0001 */ addi r27, r27, 1
/* 000088E8 281B0009 */ cmplwi r27, 9
/* 000088EC 3B9C000C */ addi r28, r28, 0xc
/* 000088F0 4180FFA0 */ blt lbl_00008890
/* 000088F4 3C600000 */ lis r3, modeCtrl@ha
/* 000088F8 38630000 */ addi r3, r3, modeCtrl@l
/* 000088FC 80030008 */ lwz r0, 8(r3)
/* 00008900 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008904 418201C0 */ beq lbl_00008AC4
/* 00008908 80030010 */ lwz r0, 0x10(r3)
/* 0000890C 1C00000C */ mulli r0, r0, 0xc
/* 00008910 7FDD0214 */ add r30, r29, r0
/* 00008914 801E446C */ lwz r0, 0x446c(r30)
/* 00008918 3BDE4464 */ addi r30, r30, 0x4464
/* 0000891C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00008920 41820034 */ beq lbl_00008954
/* 00008924 801F01F0 */ lwz r0, 0x1f0(r31)
/* 00008928 38600001 */ li r3, 1
/* 0000892C 38800000 */ li r4, 0
/* 00008930 90010010 */ stw r0, 0x10(r1)
/* 00008934 4BFF7829 */ bl GXSetPixelFmt
/* 00008938 80010010 */ lwz r0, 0x10(r1)
/* 0000893C 3C800100 */ lis r4, 0x100
/* 00008940 3861000C */ addi r3, r1, 0xc
/* 00008944 9001000C */ stw r0, 0xc(r1)
/* 00008948 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 0000894C 4BFF7811 */ bl GXSetCopyClear
/* 00008950 48000030 */ b lbl_00008980
lbl_00008954:
/* 00008954 38600000 */ li r3, 0
/* 00008958 38800000 */ li r4, 0
/* 0000895C 4BFF7801 */ bl GXSetPixelFmt
/* 00008960 3C600000 */ lis r3, backgroundInfo@ha
/* 00008964 38630000 */ addi r3, r3, backgroundInfo@l
/* 00008968 8003000C */ lwz r0, 0xc(r3)
/* 0000896C 3C800100 */ lis r4, 0x100
/* 00008970 38610008 */ addi r3, r1, 8
/* 00008974 90010008 */ stw r0, 8(r1)
/* 00008978 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 0000897C 4BFF77E1 */ bl GXSetCopyClear
lbl_00008980:
/* 00008980 38600000 */ li r3, 0
/* 00008984 4BFF77D9 */ bl func_80018648
/* 00008988 4BFF77D5 */ bl g_draw_ball_shadow
/* 0000898C 4BFF77D1 */ bl func_80054FF0
/* 00008990 38600000 */ li r3, 0
/* 00008994 4BFF77C9 */ bl func_800225C0
/* 00008998 3C600000 */ lis r3, eventInfo@ha
/* 0000899C 38630000 */ addi r3, r3, eventInfo@l
/* 000089A0 88030018 */ lbz r0, 0x18(r3)
/* 000089A4 7C000774 */ extsb r0, r0
/* 000089A8 2C000002 */ cmpwi r0, 2
/* 000089AC 4182000C */ beq lbl_000089B8
/* 000089B0 2C000004 */ cmpwi r0, 4
/* 000089B4 40820008 */ bne lbl_000089BC
lbl_000089B8:
/* 000089B8 4BFF77A5 */ bl stage_draw
lbl_000089BC:
/* 000089BC 3C600000 */ lis r3, currStageId@ha
/* 000089C0 A8030000 */ lha r0, currStageId@l(r3)
/* 000089C4 2C000092 */ cmpwi r0, 0x92
/* 000089C8 4080000C */ bge lbl_000089D4
/* 000089CC 2C00008F */ cmpwi r0, 0x8f
/* 000089D0 40800040 */ bge lbl_00008A10
lbl_000089D4:
/* 000089D4 4BFF7789 */ bl mathutil_mtxA_from_mtxB
/* 000089D8 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 000089DC 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 000089E0 80630000 */ lwz r3, 0(r3)
/* 000089E4 80630010 */ lwz r3, 0x10(r3)
/* 000089E8 4BFF7775 */ bl mathutil_mtxA_translate
/* 000089EC 3C600000 */ lis r3, unpausedFrameCounter@ha
/* 000089F0 80030000 */ lwz r0, unpausedFrameCounter@l(r3)
/* 000089F4 5403482C */ slwi r3, r0, 9
/* 000089F8 4BFF7765 */ bl mathutil_mtxA_rotate_y
/* 000089FC 3C600000 */ lis r3, naomiCommonObj@ha
/* 00008A00 38630000 */ addi r3, r3, naomiCommonObj@l
/* 00008A04 80630000 */ lwz r3, 0(r3)
/* 00008A08 8063002C */ lwz r3, 0x2c(r3)
/* 00008A0C 4BFF7751 */ bl g_call_draw_naomi_model_and_do_other_stuff
lbl_00008A10:
/* 00008A10 4BFF774D */ bl func_80094A34
/* 00008A14 3C600000 */ lis r3, eventInfo@ha
/* 00008A18 38630000 */ addi r3, r3, eventInfo@l
/* 00008A1C 880301C8 */ lbz r0, 0x1c8(r3)
/* 00008A20 2C000002 */ cmpwi r0, 2
/* 00008A24 40820018 */ bne lbl_00008A3C
/* 00008A28 C03F01F4 */ lfs f1, 0x1f4(r31)
/* 00008A2C 4BFF7731 */ bl ord_tbl_set_depth_offset
/* 00008A30 4BFF772D */ bl background_draw
/* 00008A34 C03F0060 */ lfs f1, 0x60(r31)
/* 00008A38 4BFF7725 */ bl ord_tbl_set_depth_offset
lbl_00008A3C:
/* 00008A3C 3C600000 */ lis r3, eventInfo@ha
/* 00008A40 38630000 */ addi r3, r3, eventInfo@l
/* 00008A44 88030078 */ lbz r0, 0x78(r3)
/* 00008A48 2C000002 */ cmpwi r0, 2
/* 00008A4C 40820008 */ bne lbl_00008A54
/* 00008A50 4BFF770D */ bl item_draw
lbl_00008A54:
/* 00008A54 3C600000 */ lis r3, eventInfo@ha
/* 00008A58 38630000 */ addi r3, r3, eventInfo@l
/* 00008A5C 88030060 */ lbz r0, 0x60(r3)
/* 00008A60 2C000002 */ cmpwi r0, 2
/* 00008A64 40820008 */ bne lbl_00008A6C
/* 00008A68 4BFF76F5 */ bl stobj_draw
lbl_00008A6C:
/* 00008A6C 3C600000 */ lis r3, eventInfo@ha
/* 00008A70 38630000 */ addi r3, r3, eventInfo@l
/* 00008A74 88030138 */ lbz r0, 0x138(r3)
/* 00008A78 2C000002 */ cmpwi r0, 2
/* 00008A7C 40820008 */ bne lbl_00008A84
/* 00008A80 4BFF76DD */ bl effect_draw
lbl_00008A84:
/* 00008A84 4BFF76D9 */ bl ord_tbl_draw_nodes
/* 00008A88 A0BE0004 */ lhz r5, 4(r30)
/* 00008A8C A0DE0006 */ lhz r6, 6(r30)
/* 00008A90 20650270 */ subfic r3, r5, 0x270
/* 00008A94 208601B0 */ subfic r4, r6, 0x1b0
/* 00008A98 4BFF76C5 */ bl GXSetTexCopySrc
/* 00008A9C A07E0004 */ lhz r3, 4(r30)
/* 00008AA0 38A00005 */ li r5, 5
/* 00008AA4 A09E0006 */ lhz r4, 6(r30)
/* 00008AA8 38C00000 */ li r6, 0
/* 00008AAC 4BFF76B1 */ bl GXSetTexCopyDst
/* 00008AB0 3C600000 */ lis r3, lbl_10000D64@ha
/* 00008AB4 38630000 */ addi r3, r3, lbl_10000D64@l
/* 00008AB8 80630000 */ lwz r3, 0(r3)
/* 00008ABC 38800000 */ li r4, 0
/* 00008AC0 4BFF769D */ bl GXCopyTex
lbl_00008AC4:
/* 00008AC4 4BFF7699 */ bl func_80017FCC
/* 00008AC8 BB61001C */ lmw r27, 0x1c(r1)
/* 00008ACC 80010034 */ lwz r0, 0x34(r1)
/* 00008AD0 38210030 */ addi r1, r1, 0x30
/* 00008AD4 7C0803A6 */ mtlr r0
/* 00008AD8 4E800020 */ blr 
lbl_00008ADC:
/* 00008ADC 7C0802A6 */ mflr r0
/* 00008AE0 90010004 */ stw r0, 4(r1)
/* 00008AE4 9421FFF8 */ stwu r1, -8(r1)
/* 00008AE8 8064002C */ lwz r3, 0x2c(r4)
/* 00008AEC 4BFF7671 */ bl g_preview_maybe_invalidate_tex_cache
/* 00008AF0 8001000C */ lwz r0, 0xc(r1)
/* 00008AF4 38210008 */ addi r1, r1, 8
/* 00008AF8 7C0803A6 */ mtlr r0
/* 00008AFC 4E800020 */ blr 
lbl_00008B00:
/* 00008B00 7C0802A6 */ mflr r0
/* 00008B04 7C661B78 */ mr r6, r3
/* 00008B08 90010004 */ stw r0, 4(r1)
/* 00008B0C 3880FFFF */ li r4, -1
/* 00008B10 38A00000 */ li r5, 0
/* 00008B14 9421FFF8 */ stwu r1, -8(r1)
/* 00008B18 8063002C */ lwz r3, 0x2c(r3)
/* 00008B1C C0260004 */ lfs f1, 4(r6)
/* 00008B20 C0460008 */ lfs f2, 8(r6)
/* 00008B24 C066004C */ lfs f3, 0x4c(r6)
/* 00008B28 C0860040 */ lfs f4, 0x40(r6)
/* 00008B2C C0A60044 */ lfs f5, 0x44(r6)
/* 00008B30 4BFF762D */ bl func_800AD180
/* 00008B34 8001000C */ lwz r0, 0xc(r1)
/* 00008B38 38210008 */ addi r1, r1, 8
/* 00008B3C 7C0803A6 */ mtlr r0
/* 00008B40 4E800020 */ blr 
lbl_00008B44:
/* 00008B44 7C0802A6 */ mflr r0
/* 00008B48 90010004 */ stw r0, 4(r1)
/* 00008B4C 9421FFF8 */ stwu r1, -8(r1)
/* 00008B50 8063002C */ lwz r3, 0x2c(r3)
/* 00008B54 4BFF7609 */ bl preview_free
/* 00008B58 8001000C */ lwz r0, 0xc(r1)
/* 00008B5C 38210008 */ addi r1, r1, 8
/* 00008B60 7C0803A6 */ mtlr r0
/* 00008B64 4E800020 */ blr 
lbl_00008B68:
/* 00008B68 7C0802A6 */ mflr r0
/* 00008B6C 38600010 */ li r3, 0x10
/* 00008B70 90010004 */ stw r0, 4(r1)
/* 00008B74 9421FFF8 */ stwu r1, -8(r1)
/* 00008B78 4BFF75E5 */ bl event_start
/* 00008B7C 3C600000 */ lis r3, modeCtrl@ha
/* 00008B80 38A30000 */ addi r5, r3, modeCtrl@l
/* 00008B84 38000000 */ li r0, 0
/* 00008B88 90050010 */ stw r0, 0x10(r5)
/* 00008B8C 38000001 */ li r0, 1
/* 00008B90 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00008B94 90050044 */ stw r0, 0x44(r5)
/* 00008B98 38000085 */ li r0, 0x85
/* 00008B9C 80850008 */ lwz r4, 8(r5)
/* 00008BA0 548407B8 */ rlwinm r4, r4, 0, 0x1e, 0x1c
/* 00008BA4 90850008 */ stw r4, 8(r5)
/* 00008BA8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00008BAC 8001000C */ lwz r0, 0xc(r1)
/* 00008BB0 38210008 */ addi r1, r1, 8
/* 00008BB4 7C0803A6 */ mtlr r0
/* 00008BB8 4E800020 */ blr 
lbl_00008BBC:
/* 00008BBC 7C0802A6 */ mflr r0
/* 00008BC0 3C600000 */ lis r3, modeCtrl@ha
/* 00008BC4 90010004 */ stw r0, 4(r1)
/* 00008BC8 38830000 */ addi r4, r3, modeCtrl@l
/* 00008BCC 3C600000 */ lis r3, lbl_10000000@ha
/* 00008BD0 9421FEC0 */ stwu r1, -0x140(r1)
/* 00008BD4 93E1013C */ stw r31, 0x13c(r1)
/* 00008BD8 93C10138 */ stw r30, 0x138(r1)
/* 00008BDC 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00008BE0 93A10134 */ stw r29, 0x134(r1)
/* 00008BE4 93810130 */ stw r28, 0x130(r1)
/* 00008BE8 3B840008 */ addi r28, r4, 8
/* 00008BEC 80040008 */ lwz r0, 8(r4)
/* 00008BF0 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008BF4 40820220 */ bne lbl_00008E14
/* 00008BF8 3C600000 */ lis r3, controllerInfo@ha
/* 00008BFC 38A30000 */ addi r5, r3, controllerInfo@l
/* 00008C00 80640010 */ lwz r3, 0x10(r4)
/* 00008C04 A0C50030 */ lhz r6, 0x30(r5)
/* 00008C08 3BA40010 */ addi r29, r4, 0x10
/* 00008C0C 54C00739 */ rlwinm. r0, r6, 0, 0x1c, 0x1c
/* 00008C10 40820040 */ bne lbl_00008C50
/* 00008C14 3C800000 */ lis r4, analogButtonInfo@ha
/* 00008C18 38840000 */ addi r4, r4, analogButtonInfo@l
/* 00008C1C A0040008 */ lhz r0, 8(r4)
/* 00008C20 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00008C24 4082002C */ bne lbl_00008C50
/* 00008C28 A0050000 */ lhz r0, 0(r5)
/* 00008C2C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00008C30 40820010 */ bne lbl_00008C40
/* 00008C34 A0040000 */ lhz r0, 0(r4)
/* 00008C38 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00008C3C 41820020 */ beq lbl_00008C5C
lbl_00008C40:
/* 00008C40 3C800000 */ lis r4, analogButtonInfo@ha
/* 00008C44 A0040000 */ lhz r0, analogButtonInfo@l(r4)
/* 00008C48 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00008C4C 41820010 */ beq lbl_00008C5C
lbl_00008C50:
/* 00008C50 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 00008C54 40800008 */ bge lbl_00008C5C
/* 00008C58 38600008 */ li r3, 8
lbl_00008C5C:
/* 00008C5C 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 00008C60 40820044 */ bne lbl_00008CA4
/* 00008C64 3C800000 */ lis r4, analogButtonInfo@ha
/* 00008C68 38A40000 */ addi r5, r4, analogButtonInfo@l
/* 00008C6C A0050008 */ lhz r0, 8(r5)
/* 00008C70 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008C74 40820030 */ bne lbl_00008CA4
/* 00008C78 3C800000 */ lis r4, controllerInfo@ha
/* 00008C7C A0040000 */ lhz r0, controllerInfo@l(r4)
/* 00008C80 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008C84 40820010 */ bne lbl_00008C94
/* 00008C88 A0050000 */ lhz r0, 0(r5)
/* 00008C8C 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008C90 41820024 */ beq lbl_00008CB4
lbl_00008C94:
/* 00008C94 3C800000 */ lis r4, analogButtonInfo@ha
/* 00008C98 A0040000 */ lhz r0, analogButtonInfo@l(r4)
/* 00008C9C 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00008CA0 41820014 */ beq lbl_00008CB4
lbl_00008CA4:
/* 00008CA4 38630001 */ addi r3, r3, 1
/* 00008CA8 28030009 */ cmplwi r3, 9
/* 00008CAC 41800008 */ blt lbl_00008CB4
/* 00008CB0 38600000 */ li r3, 0
lbl_00008CB4:
/* 00008CB4 3C800000 */ lis r4, controllerInfo@ha
/* 00008CB8 907D0000 */ stw r3, 0(r29)
/* 00008CBC 38640000 */ addi r3, r4, controllerInfo@l
/* 00008CC0 A0030018 */ lhz r0, 0x18(r3)
/* 00008CC4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00008CC8 41820258 */ beq lbl_00008F20
/* 00008CCC 4BFF7491 */ bl create_sprite
/* 00008CD0 7C7F1B79 */ or. r31, r3, r3
/* 00008CD4 41820130 */ beq lbl_00008E04
/* 00008CD8 801D0000 */ lwz r0, 0(r29)
/* 00008CDC 3C800000 */ lis r4, lbl_00014714@ha
/* 00008CE0 3C600000 */ lis r3, lbl_000147EC@ha
/* 00008CE4 4CC63182 */ crclr 6
/* 00008CE8 1CA0000C */ mulli r5, r0, 0xc
/* 00008CEC 38040000 */ addi r0, r4, lbl_00014714@l
/* 00008CF0 7FA02A14 */ add r29, r0, r5
/* 00008CF4 38830000 */ addi r4, r3, lbl_000147EC@l
/* 00008CF8 A0BD0004 */ lhz r5, 4(r29)
/* 00008CFC A0DD0006 */ lhz r6, 6(r29)
/* 00008D00 3861000C */ addi r3, r1, 0xc
/* 00008D04 4BFF7459 */ bl sprintf
/* 00008D08 3C600000 */ lis r3, modeCtrl@ha
/* 00008D0C A0DD0004 */ lhz r6, 4(r29)
/* 00008D10 38630000 */ addi r3, r3, modeCtrl@l
/* 00008D14 A0FD0006 */ lhz r7, 6(r29)
/* 00008D18 80A30044 */ lwz r5, 0x44(r3)
/* 00008D1C 387E0D6C */ addi r3, r30, 0xd6c
/* 00008D20 3881000C */ addi r4, r1, 0xc
/* 00008D24 38A5FFFF */ addi r5, r5, -1  ;# fixed addi
/* 00008D28 39000005 */ li r8, 5
/* 00008D2C 4BFF7431 */ bl preview_create_with_alloc_img
/* 00008D30 381E0D6C */ addi r0, r30, 0xd6c
/* 00008D34 901F002C */ stw r0, 0x2c(r31)
/* 00008D38 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00008D3C 3C800000 */ lis r4, lbl_00010070@ha
/* 00008D40 A01D0004 */ lhz r0, 4(r29)
/* 00008D44 3D200000 */ lis r9, lbl_00010078@ha
/* 00008D48 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 00008D4C 3CA00000 */ lis r5, lbl_00008ADC@ha
/* 00008D50 9001012C */ stw r0, 0x12c(r1)
/* 00008D54 3D604330 */ lis r11, 0x4330
/* 00008D58 C8440000 */ lfd f2, lbl_00010070@l(r4)
/* 00008D5C 91610128 */ stw r11, 0x128(r1)
/* 00008D60 3C600000 */ lis r3, lbl_00008B44@ha
/* 00008D64 3C800000 */ lis r4, lbl_00008B00@ha
/* 00008D68 C8010128 */ lfd f0, 0x128(r1)
/* 00008D6C 39490000 */ addi r10, r9, lbl_00010078@l
/* 00008D70 3D000000 */ lis r8, lbl_0000FEC8@ha
/* 00008D74 FC000828 */ fsub f0, f0, f1
/* 00008D78 38030000 */ addi r0, r3, lbl_00008B44@l
/* 00008D7C 3CE00000 */ lis r7, lbl_0000FEC8@ha
/* 00008D80 3CC00000 */ lis r6, lbl_0000FEC8@ha
/* 00008D84 FC020028 */ fsub f0, f2, f0
/* 00008D88 38A50000 */ addi r5, r5, lbl_00008ADC@l
/* 00008D8C 38840000 */ addi r4, r4, lbl_00008B00@l
/* 00008D90 FC000018 */ frsp f0, f0
/* 00008D94 D01F0004 */ stfs f0, 4(r31)
/* 00008D98 A13D0006 */ lhz r9, 6(r29)
/* 00008D9C C8280000 */ lfd f1, lbl_0000FEC8@l(r8)
/* 00008DA0 91210124 */ stw r9, 0x124(r1)
/* 00008DA4 C84A0000 */ lfd f2, 0(r10)
/* 00008DA8 91610120 */ stw r11, 0x120(r1)
/* 00008DAC C8010120 */ lfd f0, 0x120(r1)
/* 00008DB0 FC000828 */ fsub f0, f0, f1
/* 00008DB4 FC020028 */ fsub f0, f2, f0
/* 00008DB8 FC000018 */ frsp f0, f0
/* 00008DBC D01F0008 */ stfs f0, 8(r31)
/* 00008DC0 A07D0004 */ lhz r3, 4(r29)
/* 00008DC4 C8270000 */ lfd f1, lbl_0000FEC8@l(r7)
/* 00008DC8 9061011C */ stw r3, 0x11c(r1)
/* 00008DCC 91610118 */ stw r11, 0x118(r1)
/* 00008DD0 C8010118 */ lfd f0, 0x118(r1)
/* 00008DD4 EC000828 */ fsubs f0, f0, f1
/* 00008DD8 D01F0040 */ stfs f0, 0x40(r31)
/* 00008DDC A07D0006 */ lhz r3, 6(r29)
/* 00008DE0 C8260000 */ lfd f1, lbl_0000FEC8@l(r6)
/* 00008DE4 90610114 */ stw r3, 0x114(r1)
/* 00008DE8 91610110 */ stw r11, 0x110(r1)
/* 00008DEC C8010110 */ lfd f0, 0x110(r1)
/* 00008DF0 EC000828 */ fsubs f0, f0, f1
/* 00008DF4 D01F0044 */ stfs f0, 0x44(r31)
/* 00008DF8 90BF0034 */ stw r5, 0x34(r31)
/* 00008DFC 909F0038 */ stw r4, 0x38(r31)
/* 00008E00 901F0030 */ stw r0, 0x30(r31)
lbl_00008E04:
/* 00008E04 801C0000 */ lwz r0, 0(r28)
/* 00008E08 60000004 */ ori r0, r0, 4
/* 00008E0C 901C0000 */ stw r0, 0(r28)
/* 00008E10 48000110 */ b lbl_00008F20
lbl_00008E14:
/* 00008E14 3C600000 */ lis r3, controllerInfo@ha
/* 00008E18 80040044 */ lwz r0, 0x44(r4)
/* 00008E1C 38A30000 */ addi r5, r3, controllerInfo@l
/* 00008E20 A0C50030 */ lhz r6, 0x30(r5)
/* 00008E24 3BA40044 */ addi r29, r4, 0x44
/* 00008E28 7C1F0378 */ mr r31, r0
/* 00008E2C 54C307FF */ clrlwi. r3, r6, 0x1f
/* 00008E30 40820044 */ bne lbl_00008E74
/* 00008E34 3C600000 */ lis r3, analogButtonInfo@ha
/* 00008E38 38830000 */ addi r4, r3, analogButtonInfo@l
/* 00008E3C A0640008 */ lhz r3, 8(r4)
/* 00008E40 546307FF */ clrlwi. r3, r3, 0x1f
/* 00008E44 40820030 */ bne lbl_00008E74
/* 00008E48 A0650000 */ lhz r3, 0(r5)
/* 00008E4C 546307FF */ clrlwi. r3, r3, 0x1f
/* 00008E50 40820010 */ bne lbl_00008E60
/* 00008E54 A0640000 */ lhz r3, 0(r4)
/* 00008E58 546307FF */ clrlwi. r3, r3, 0x1f
/* 00008E5C 41820028 */ beq lbl_00008E84
lbl_00008E60:
/* 00008E60 3C600000 */ lis r3, analogButtonInfo@ha
/* 00008E64 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00008E68 A0630000 */ lhz r3, 0(r3)
/* 00008E6C 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00008E70 41820014 */ beq lbl_00008E84
lbl_00008E74:
/* 00008E74 3BFFFFFF */ addi r31, r31, -1  ;# fixed addi
/* 00008E78 2C1F0001 */ cmpwi r31, 1
/* 00008E7C 40800008 */ bge lbl_00008E84
/* 00008E80 3BE000C8 */ li r31, 0xc8
lbl_00008E84:
/* 00008E84 54C307BD */ rlwinm. r3, r6, 0, 0x1e, 0x1e
/* 00008E88 4082004C */ bne lbl_00008ED4
/* 00008E8C 3C600000 */ lis r3, analogButtonInfo@ha
/* 00008E90 38830000 */ addi r4, r3, analogButtonInfo@l
/* 00008E94 A0640008 */ lhz r3, 8(r4)
/* 00008E98 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00008E9C 40820038 */ bne lbl_00008ED4
/* 00008EA0 3C600000 */ lis r3, controllerInfo@ha
/* 00008EA4 38630000 */ addi r3, r3, controllerInfo@l
/* 00008EA8 A0630000 */ lhz r3, 0(r3)
/* 00008EAC 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00008EB0 40820010 */ bne lbl_00008EC0
/* 00008EB4 A0640000 */ lhz r3, 0(r4)
/* 00008EB8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00008EBC 41820028 */ beq lbl_00008EE4
lbl_00008EC0:
/* 00008EC0 3C600000 */ lis r3, analogButtonInfo@ha
/* 00008EC4 38630000 */ addi r3, r3, analogButtonInfo@l
/* 00008EC8 A0630000 */ lhz r3, 0(r3)
/* 00008ECC 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00008ED0 41820014 */ beq lbl_00008EE4
lbl_00008ED4:
/* 00008ED4 3BFF0001 */ addi r31, r31, 1
/* 00008ED8 2C1F00C8 */ cmpwi r31, 0xc8
/* 00008EDC 40810008 */ ble lbl_00008EE4
/* 00008EE0 3BE00001 */ li r31, 1
lbl_00008EE4:
/* 00008EE4 7C1F0000 */ cmpw r31, r0
/* 00008EE8 41820014 */ beq lbl_00008EFC
/* 00008EEC 387E0D6C */ addi r3, r30, 0xd6c
/* 00008EF0 389FFFFF */ addi r4, r31, -1  ;# fixed addi
/* 00008EF4 4BFF7269 */ bl start_preview_image_read
/* 00008EF8 93FD0000 */ stw r31, 0(r29)
lbl_00008EFC:
/* 00008EFC 3C600000 */ lis r3, controllerInfo@ha
/* 00008F00 38630000 */ addi r3, r3, controllerInfo@l
/* 00008F04 A0030018 */ lhz r0, 0x18(r3)
/* 00008F08 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00008F0C 41820014 */ beq lbl_00008F20
/* 00008F10 4BFF724D */ bl destroy_all_sprites
/* 00008F14 801C0000 */ lwz r0, 0(r28)
/* 00008F18 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00008F1C 901C0000 */ stw r0, 0(r28)
lbl_00008F20:
/* 00008F20 80010144 */ lwz r0, 0x144(r1)
/* 00008F24 83E1013C */ lwz r31, 0x13c(r1)
/* 00008F28 83C10138 */ lwz r30, 0x138(r1)
/* 00008F2C 7C0803A6 */ mtlr r0
/* 00008F30 83A10134 */ lwz r29, 0x134(r1)
/* 00008F34 83810130 */ lwz r28, 0x130(r1)
/* 00008F38 38210140 */ addi r1, r1, 0x140
/* 00008F3C 4E800020 */ blr 
lbl_00008F40:
/* 00008F40 7C0802A6 */ mflr r0
/* 00008F44 3C600000 */ lis r3, lbl_000102B0@ha
/* 00008F48 90010004 */ stw r0, 4(r1)
/* 00008F4C 38800001 */ li r4, 1
/* 00008F50 9421FFE0 */ stwu r1, -0x20(r1)
/* 00008F54 BF61000C */ stmw r27, 0xc(r1)
/* 00008F58 3BC30000 */ addi r30, r3, lbl_000102B0@l
/* 00008F5C 38600001 */ li r3, 1
/* 00008F60 4BFF71FD */ bl g_debug_set_cursor_pos
/* 00008F64 387E01F8 */ addi r3, r30, 0x1f8
/* 00008F68 4BFF71F5 */ bl g_debug_print
/* 00008F6C 3C600000 */ lis r3, modeCtrl@ha
/* 00008F70 3BE30000 */ addi r31, r3, modeCtrl@l
/* 00008F74 3B9E4464 */ addi r28, r30, 0x4464
/* 00008F78 3BBF0010 */ addi r29, r31, 0x10
/* 00008F7C 3B600000 */ li r27, 0
lbl_00008F80:
/* 00008F80 801D0000 */ lwz r0, 0(r29)
/* 00008F84 7C1B0000 */ cmpw r27, r0
/* 00008F88 40820028 */ bne lbl_00008FB0
/* 00008F8C 38600002 */ li r3, 2
/* 00008F90 389B0003 */ addi r4, r27, 3
/* 00008F94 4BFF71C9 */ bl g_debug_set_cursor_pos
/* 00008F98 38600002 */ li r3, 2
/* 00008F9C 4BFF71C1 */ bl g_debug_set_text_color
/* 00008FA0 387E0400 */ addi r3, r30, 0x400
/* 00008FA4 4BFF71B9 */ bl g_debug_print
/* 00008FA8 38600000 */ li r3, 0
/* 00008FAC 4BFF71B1 */ bl g_debug_set_text_color
lbl_00008FB0:
/* 00008FB0 801F0008 */ lwz r0, 8(r31)
/* 00008FB4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008FB8 4082002C */ bne lbl_00008FE4
/* 00008FBC 38600003 */ li r3, 3
/* 00008FC0 389B0003 */ addi r4, r27, 3
/* 00008FC4 4BFF7199 */ bl g_debug_set_cursor_pos
/* 00008FC8 A09C0004 */ lhz r4, 4(r28)
/* 00008FCC 387E452C */ addi r3, r30, 0x452c
/* 00008FD0 A0BC0006 */ lhz r5, 6(r28)
/* 00008FD4 4CC63182 */ crclr 6
/* 00008FD8 80DC0000 */ lwz r6, 0(r28)
/* 00008FDC 4BFF7181 */ bl g_debug_printf
/* 00008FE0 48000038 */ b lbl_00009018
lbl_00008FE4:
/* 00008FE4 801D0000 */ lwz r0, 0(r29)
/* 00008FE8 7C1B0000 */ cmpw r27, r0
/* 00008FEC 4082002C */ bne lbl_00009018
/* 00008FF0 38600003 */ li r3, 3
/* 00008FF4 389B0003 */ addi r4, r27, 3
/* 00008FF8 4BFF7165 */ bl g_debug_set_cursor_pos
/* 00008FFC A09C0004 */ lhz r4, 4(r28)
/* 00009000 387E452C */ addi r3, r30, 0x452c
/* 00009004 A0BC0006 */ lhz r5, 6(r28)
/* 00009008 4CC63182 */ crclr 6
/* 0000900C 80DC0000 */ lwz r6, 0(r28)
/* 00009010 4BFF714D */ bl g_debug_printf
/* 00009014 48000014 */ b lbl_00009028
lbl_00009018:
/* 00009018 3B7B0001 */ addi r27, r27, 1
/* 0000901C 281B0009 */ cmplwi r27, 9
/* 00009020 3B9C000C */ addi r28, r28, 0xc
/* 00009024 4180FF5C */ blt lbl_00008F80
lbl_00009028:
/* 00009028 3C600000 */ lis r3, modeCtrl@ha
/* 0000902C 38630000 */ addi r3, r3, modeCtrl@l
/* 00009030 80030008 */ lwz r0, 8(r3)
/* 00009034 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00009038 41820014 */ beq lbl_0000904C
/* 0000903C 80830044 */ lwz r4, 0x44(r3)
/* 00009040 387E4550 */ addi r3, r30, 0x4550
/* 00009044 4CC63182 */ crclr 6
/* 00009048 4BFF7115 */ bl g_debug_printf
lbl_0000904C:
/* 0000904C BB61000C */ lmw r27, 0xc(r1)
/* 00009050 80010024 */ lwz r0, 0x24(r1)
/* 00009054 38210020 */ addi r1, r1, 0x20
/* 00009058 7C0803A6 */ mtlr r0
/* 0000905C 4E800020 */ blr 
lbl_00009060:
/* 00009060 7C0802A6 */ mflr r0
/* 00009064 3C600000 */ lis r3, gameSubmode@ha
/* 00009068 90010004 */ stw r0, 4(r1)
/* 0000906C 38630000 */ addi r3, r3, gameSubmode@l
/* 00009070 3CA00000 */ lis r5, lbl_0000FE78@ha
/* 00009074 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009078 3C800000 */ lis r4, lbl_10000000@ha
/* 0000907C BF61000C */ stmw r27, 0xc(r1)
/* 00009080 3BA50000 */ addi r29, r5, lbl_0000FE78@l
/* 00009084 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00009088 A8630000 */ lha r3, 0(r3)
/* 0000908C 3803FFA0 */ addi r0, r3, -96  ;# fixed addi
/* 00009090 28000025 */ cmplwi r0, 0x25
/* 00009094 3C600000 */ lis r3, lbl_000102B0@ha
/* 00009098 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 0000909C 41810288 */ bgt lbl_00009324
/* 000090A0 3C600000 */ lis r3, lbl_00014810@ha
/* 000090A4 38630000 */ addi r3, r3, lbl_00014810@l
/* 000090A8 5400103A */ slwi r0, r0, 2
/* 000090AC 7C03002E */ lwzx r0, r3, r0
/* 000090B0 7C0903A6 */ mtctr r0
/* 000090B4 4E800420 */ bctr 
lbl_000090B8:
/* 000090B8 4BFF7579 */ bl lbl_00000630
/* 000090BC 48000268 */ b lbl_00009324
lbl_000090C0:
/* 000090C0 4BFF7875 */ bl lbl_00000934
/* 000090C4 48000260 */ b lbl_00009324
lbl_000090C8:
/* 000090C8 4BFF8AB1 */ bl lbl_00001B78
/* 000090CC 48000258 */ b lbl_00009324
lbl_000090D0:
/* 000090D0 38600004 */ li r3, 4
/* 000090D4 38800004 */ li r4, 4
/* 000090D8 4BFF7085 */ bl g_debug_set_cursor_pos
/* 000090DC 387F0974 */ addi r3, r31, 0x974
/* 000090E0 4CC63182 */ crclr 6
/* 000090E4 4BFF7079 */ bl g_debug_printf
/* 000090E8 801E0040 */ lwz r0, 0x40(r30)
/* 000090EC 387F0980 */ addi r3, r31, 0x980
/* 000090F0 4CC63182 */ crclr 6
/* 000090F4 54001838 */ slwi r0, r0, 3
/* 000090F8 7C9F0214 */ add r4, r31, r0
/* 000090FC 80840940 */ lwz r4, 0x940(r4)
/* 00009100 4BFF705D */ bl g_debug_printf
/* 00009104 809E0044 */ lwz r4, 0x44(r30)
/* 00009108 387F0990 */ addi r3, r31, 0x990
/* 0000910C 4CC63182 */ crclr 6
/* 00009110 4BFF704D */ bl g_debug_printf
/* 00009114 4BFF7049 */ bl draw_normal_game_scene
/* 00009118 4BFF9045 */ bl lbl_0000215C
/* 0000911C 3C600000 */ lis r3, currRenderMode@ha
/* 00009120 3B830000 */ addi r28, r3, currRenderMode@l
/* 00009124 80DC0000 */ lwz r6, 0(r28)
/* 00009128 38600000 */ li r3, 0
/* 0000912C 38800000 */ li r4, 0
/* 00009130 A0A60004 */ lhz r5, 4(r6)
/* 00009134 A0C60006 */ lhz r6, 6(r6)
/* 00009138 4BFF7025 */ bl GXSetTexCopySrc
/* 0000913C 801E0040 */ lwz r0, 0x40(r30)
/* 00009140 38C00000 */ li r6, 0
/* 00009144 809C0000 */ lwz r4, 0(r28)
/* 00009148 54001838 */ slwi r0, r0, 3
/* 0000914C 7CBF0214 */ add r5, r31, r0
/* 00009150 A0640004 */ lhz r3, 4(r4)
/* 00009154 A0840006 */ lhz r4, 6(r4)
/* 00009158 80A5093C */ lwz r5, 0x93c(r5)
/* 0000915C 4BFF7001 */ bl GXSetTexCopyDst
/* 00009160 3B7E0068 */ addi r27, r30, 0x68
/* 00009164 807E0068 */ lwz r3, 0x68(r30)
/* 00009168 38800000 */ li r4, 0
/* 0000916C 4BFF6FF1 */ bl GXCopyTex
/* 00009170 801E0040 */ lwz r0, 0x40(r30)
/* 00009174 3BDE0048 */ addi r30, r30, 0x48
/* 00009178 80DC0000 */ lwz r6, 0(r28)
/* 0000917C 387E0000 */ addi r3, r30, 0
/* 00009180 54001838 */ slwi r0, r0, 3
/* 00009184 7CFF0214 */ add r7, r31, r0
/* 00009188 809B0000 */ lwz r4, 0(r27)
/* 0000918C A0A60004 */ lhz r5, 4(r6)
/* 00009190 39000000 */ li r8, 0
/* 00009194 A0C60006 */ lhz r6, 6(r6)
/* 00009198 39200000 */ li r9, 0
/* 0000919C 80E7093C */ lwz r7, 0x93c(r7)
/* 000091A0 39400000 */ li r10, 0
/* 000091A4 4BFF6FB9 */ bl GXInitTexObj
/* 000091A8 C03D0060 */ lfs f1, 0x60(r29)
/* 000091AC 387E0000 */ addi r3, r30, 0
/* 000091B0 38800000 */ li r4, 0
/* 000091B4 FC400890 */ fmr f2, f1
/* 000091B8 38A00000 */ li r5, 0
/* 000091BC FC600890 */ fmr f3, f1
/* 000091C0 38C00000 */ li r6, 0
/* 000091C4 38E00000 */ li r7, 0
/* 000091C8 39000000 */ li r8, 0
/* 000091CC 4BFF6F91 */ bl GXInitTexObjLOD
/* 000091D0 48000154 */ b lbl_00009324
lbl_000091D4:
/* 000091D4 38600004 */ li r3, 4
/* 000091D8 38800004 */ li r4, 4
/* 000091DC 4BFF6F81 */ bl g_debug_set_cursor_pos
/* 000091E0 387F09A0 */ addi r3, r31, 0x9a0
/* 000091E4 4CC63182 */ crclr 6
/* 000091E8 4BFF6F75 */ bl g_debug_printf
/* 000091EC 4800040D */ bl lbl_000095F8
/* 000091F0 480007A9 */ bl lbl_00009998
/* 000091F4 4BFF6F69 */ bl draw_test_camera_target
/* 000091F8 4800012C */ b lbl_00009324
lbl_000091FC:
/* 000091FC 48002381 */ bl lbl_0000B57C
/* 00009200 48000124 */ b lbl_00009324
lbl_00009204:
/* 00009204 48002E09 */ bl lbl_0000C00C
/* 00009208 4800011C */ b lbl_00009324
lbl_0000920C:
/* 0000920C 38600004 */ li r3, 4
/* 00009210 38800004 */ li r4, 4
/* 00009214 4BFF6F49 */ bl g_debug_set_cursor_pos
/* 00009218 801E0070 */ lwz r0, 0x70(r30)
/* 0000921C 387F26E0 */ addi r3, r31, 0x26e0
/* 00009220 4CC63182 */ crclr 6
/* 00009224 1C00000C */ mulli r0, r0, 0xc
/* 00009228 7C9F0214 */ add r4, r31, r0
/* 0000922C 80842080 */ lwz r4, 0x2080(r4)
/* 00009230 4BFF6F2D */ bl g_debug_printf
/* 00009234 3B7E0074 */ addi r27, r30, 0x74
/* 00009238 809E0074 */ lwz r4, 0x74(r30)
/* 0000923C 28040000 */ cmplwi r4, 0
/* 00009240 40820014 */ bne lbl_00009254
/* 00009244 387F26F4 */ addi r3, r31, 0x26f4
/* 00009248 4CC63182 */ crclr 6
/* 0000924C 4BFF6F11 */ bl g_debug_printf
/* 00009250 480000D4 */ b lbl_00009324
lbl_00009254:
/* 00009254 801E006C */ lwz r0, 0x6c(r30)
/* 00009258 387F2700 */ addi r3, r31, 0x2700
/* 0000925C 4CC63182 */ crclr 6
/* 00009260 5400103A */ slwi r0, r0, 2
/* 00009264 7C840214 */ add r4, r4, r0
/* 00009268 80840004 */ lwz r4, 4(r4)
/* 0000926C 8084FFF8 */ lwz r4, -8(r4)
/* 00009270 4BFF6EED */ bl g_debug_printf
/* 00009274 801E006C */ lwz r0, 0x6c(r30)
/* 00009278 387F2714 */ addi r3, r31, 0x2714
/* 0000927C 809B0000 */ lwz r4, 0(r27)
/* 00009280 4CC63182 */ crclr 6
/* 00009284 5400103A */ slwi r0, r0, 2
/* 00009288 7C840214 */ add r4, r4, r0
/* 0000928C 80840004 */ lwz r4, 4(r4)
/* 00009290 8084FFFC */ lwz r4, -4(r4)
/* 00009294 80840000 */ lwz r4, 0(r4)
/* 00009298 4BFF6EC5 */ bl g_debug_printf
/* 0000929C 4BFF6EC1 */ bl mathutil_mtxA_from_mtxB
/* 000092A0 801E006C */ lwz r0, 0x6c(r30)
/* 000092A4 807B0000 */ lwz r3, 0(r27)
/* 000092A8 5400103A */ slwi r0, r0, 2
/* 000092AC 7C630214 */ add r3, r3, r0
/* 000092B0 80630004 */ lwz r3, 4(r3)
/* 000092B4 4BFF6EA9 */ bl g_draw_naomi_model_and_do_other_stuff
/* 000092B8 4BFF6EA5 */ bl draw_test_camera_target
/* 000092BC 48000068 */ b lbl_00009324
lbl_000092C0:
/* 000092C0 4BFF9EF9 */ bl lbl_000031B8
/* 000092C4 48000060 */ b lbl_00009324
lbl_000092C8:
/* 000092C8 4BFFA785 */ bl lbl_00003A4C
/* 000092CC 48000058 */ b lbl_00009324
lbl_000092D0:
/* 000092D0 4BFF6E8D */ bl func_8004A800
/* 000092D4 48000050 */ b lbl_00009324
lbl_000092D8:
/* 000092D8 48006AB5 */ bl lbl_0000FD8C
/* 000092DC 4BFF6E81 */ bl mathutil_mtxA_from_mtxB
/* 000092E0 3C600000 */ lis r3, naomiCommonObj@ha
/* 000092E4 38630000 */ addi r3, r3, naomiCommonObj@l
/* 000092E8 80630000 */ lwz r3, 0(r3)
/* 000092EC 8063000C */ lwz r3, 0xc(r3)
/* 000092F0 4BFF6E6D */ bl g_call_draw_naomi_model_and_do_other_stuff
/* 000092F4 48000030 */ b lbl_00009324
lbl_000092F8:
/* 000092F8 4BFFC08D */ bl lbl_00005384
/* 000092FC 48000028 */ b lbl_00009324
lbl_00009300:
/* 00009300 4BFFE0ED */ bl lbl_000073EC
/* 00009304 48000020 */ b lbl_00009324
lbl_00009308:
/* 00009308 4BFFEA19 */ bl lbl_00007D20
/* 0000930C 48000018 */ b lbl_00009324
lbl_00009310:
/* 00009310 4BFFECF9 */ bl lbl_00008008
/* 00009314 48000010 */ b lbl_00009324
lbl_00009318:
/* 00009318 4BFFF535 */ bl lbl_0000884C
/* 0000931C 48000008 */ b lbl_00009324
lbl_00009320:
/* 00009320 4BFFFC21 */ bl lbl_00008F40
lbl_00009324:
/* 00009324 BB61000C */ lmw r27, 0xc(r1)
/* 00009328 80010024 */ lwz r0, 0x24(r1)
/* 0000932C 38210020 */ addi r1, r1, 0x20
/* 00009330 7C0803A6 */ mtlr r0
/* 00009334 4E800020 */ blr 
lbl_00009338:
/* 00009338 7C0802A6 */ mflr r0
/* 0000933C 3C600000 */ lis r3, lbl_00010080@ha
/* 00009340 90010004 */ stw r0, 4(r1)
/* 00009344 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009348 BF410008 */ stmw r26, 8(r1)
/* 0000934C 3BC30000 */ addi r30, r3, lbl_00010080@l
/* 00009350 4800148D */ bl lbl_0000A7DC
/* 00009354 3C600000 */ lis r3, lbl_10000E00@ha
/* 00009358 38030000 */ addi r0, r3, lbl_10000E00@l
/* 0000935C 3B800002 */ li r28, 2
/* 00009360 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00009364 7C1B0378 */ mr r27, r0
/* 00009368 579D801E */ slwi r29, r28, 0x10
/* 0000936C 3BE30000 */ addi r31, r3, __OSCurrHeap@l
lbl_00009370:
/* 00009370 C01E0000 */ lfs f0, 0(r30)
/* 00009374 D01B0000 */ stfs f0, 0(r27)
/* 00009378 C01E0004 */ lfs f0, 4(r30)
/* 0000937C D01B0004 */ stfs f0, 4(r27)
/* 00009380 C01E0004 */ lfs f0, 4(r30)
/* 00009384 D01B0008 */ stfs f0, 8(r27)
/* 00009388 4BFF6DD5 */ bl mathutil_mtxA_from_identity
/* 0000938C 7FA30E70 */ srawi r3, r29, 1
/* 00009390 7C630194 */ addze r3, r3
/* 00009394 4BFF6DC9 */ bl mathutil_mtxA_rotate_y
/* 00009398 387B0000 */ addi r3, r27, 0
/* 0000939C 389B0000 */ addi r4, r27, 0
/* 000093A0 4BFF6DBD */ bl mathutil_mtxA_tf_point
/* 000093A4 C01E0000 */ lfs f0, 0(r30)
/* 000093A8 389B0000 */ addi r4, r27, 0
/* 000093AC 387B002C */ addi r3, r27, 0x2c
/* 000093B0 D01B000C */ stfs f0, 0xc(r27)
/* 000093B4 38BB0018 */ addi r5, r27, 0x18
/* 000093B8 38DB000C */ addi r6, r27, 0xc
/* 000093BC C01E0000 */ lfs f0, 0(r30)
/* 000093C0 D01B0010 */ stfs f0, 0x10(r27)
/* 000093C4 C01E0008 */ lfs f0, 8(r30)
/* 000093C8 D01B0014 */ stfs f0, 0x14(r27)
/* 000093CC C01E0000 */ lfs f0, 0(r30)
/* 000093D0 D01B0018 */ stfs f0, 0x18(r27)
/* 000093D4 C01E000C */ lfs f0, 0xc(r30)
/* 000093D8 D01B001C */ stfs f0, 0x1c(r27)
/* 000093DC C01E0000 */ lfs f0, 0(r30)
/* 000093E0 D01B0020 */ stfs f0, 0x20(r27)
/* 000093E4 C01E000C */ lfs f0, 0xc(r30)
/* 000093E8 D01B0024 */ stfs f0, 0x24(r27)
/* 000093EC C01E0010 */ lfs f0, 0x10(r30)
/* 000093F0 D01B0028 */ stfs f0, 0x28(r27)
/* 000093F4 4BFF6D69 */ bl C_MTXLookAt
/* 000093F8 C01E000C */ lfs f0, 0xc(r30)
/* 000093FC 38000000 */ li r0, 0
/* 00009400 38600100 */ li r3, 0x100
/* 00009404 D01B005C */ stfs f0, 0x5c(r27)
/* 00009408 38800100 */ li r4, 0x100
/* 0000940C 38A00001 */ li r5, 1
/* 00009410 C03E000C */ lfs f1, 0xc(r30)
/* 00009414 38C00000 */ li r6, 0
/* 00009418 C01B005C */ lfs f0, 0x5c(r27)
/* 0000941C 38E00000 */ li r7, 0
/* 00009420 EC010024 */ fdivs f0, f1, f0
/* 00009424 D01B0060 */ stfs f0, 0x60(r27)
/* 00009428 901B0064 */ stw r0, 0x64(r27)
/* 0000942C 901B0068 */ stw r0, 0x68(r27)
/* 00009430 901B006C */ stw r0, 0x6c(r27)
/* 00009434 901B0090 */ stw r0, 0x90(r27)
/* 00009438 4BFF6D25 */ bl GXGetTexBufferSize
/* 0000943C 7C601B78 */ mr r0, r3
/* 00009440 807F0000 */ lwz r3, 0(r31)
/* 00009444 7C1A0378 */ mr r26, r0
/* 00009448 389A0000 */ addi r4, r26, 0
/* 0000944C 4BFF6D11 */ bl OSAllocFromHeap
/* 00009450 907B0094 */ stw r3, 0x94(r27)
/* 00009454 7F44D378 */ mr r4, r26
/* 00009458 807F0000 */ lwz r3, 0(r31)
/* 0000945C 4BFF6D01 */ bl OSAllocFromHeap
/* 00009460 907B0098 */ stw r3, 0x98(r27)
/* 00009464 387B0070 */ addi r3, r27, 0x70
/* 00009468 38A00100 */ li r5, 0x100
/* 0000946C 801B0090 */ lwz r0, 0x90(r27)
/* 00009470 38C00100 */ li r6, 0x100
/* 00009474 38E00001 */ li r7, 1
/* 00009478 5404103A */ slwi r4, r0, 2
/* 0000947C 38040094 */ addi r0, r4, 0x94
/* 00009480 7C9B002E */ lwzx r4, r27, r0
/* 00009484 39000000 */ li r8, 0
/* 00009488 39200000 */ li r9, 0
/* 0000948C 39400000 */ li r10, 0
/* 00009490 4BFF6CCD */ bl GXInitTexObj
/* 00009494 379CFFFF */ addic. r28, r28, -1  ;# fixed addi
/* 00009498 3FBDFFFF */ addis r29, r29, 0xffff
/* 0000949C 3B7B009C */ addi r27, r27, 0x9c
/* 000094A0 4181FED0 */ bgt lbl_00009370
/* 000094A4 4800188D */ bl lbl_0000AD30
/* 000094A8 48000F99 */ bl lbl_0000A440
/* 000094AC BB410008 */ lmw r26, 8(r1)
/* 000094B0 80010024 */ lwz r0, 0x24(r1)
/* 000094B4 38210020 */ addi r1, r1, 0x20
/* 000094B8 7C0803A6 */ mtlr r0
/* 000094BC 4E800020 */ blr 
lbl_000094C0:
/* 000094C0 7C0802A6 */ mflr r0
/* 000094C4 90010004 */ stw r0, 4(r1)
/* 000094C8 9421FFE8 */ stwu r1, -0x18(r1)
/* 000094CC 93E10014 */ stw r31, 0x14(r1)
/* 000094D0 93C10010 */ stw r30, 0x10(r1)
/* 000094D4 93A1000C */ stw r29, 0xc(r1)
/* 000094D8 93810008 */ stw r28, 8(r1)
/* 000094DC 480012B1 */ bl lbl_0000A78C
/* 000094E0 4800190D */ bl lbl_0000ADEC
/* 000094E4 3C600000 */ lis r3, lbl_10000E00@ha
/* 000094E8 38030000 */ addi r0, r3, lbl_10000E00@l
/* 000094EC 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000094F0 7C1C0378 */ mr r28, r0
/* 000094F4 3BE30000 */ addi r31, r3, __OSCurrHeap@l
/* 000094F8 3BA00002 */ li r29, 2
/* 000094FC 3BC00000 */ li r30, 0
lbl_00009500:
/* 00009500 809C0094 */ lwz r4, 0x94(r28)
/* 00009504 28040000 */ cmplwi r4, 0
/* 00009508 41820010 */ beq lbl_00009518
/* 0000950C 807F0000 */ lwz r3, 0(r31)
/* 00009510 4BFF6C4D */ bl OSFreeToHeap
/* 00009514 93DC0094 */ stw r30, 0x94(r28)
lbl_00009518:
/* 00009518 809C0098 */ lwz r4, 0x98(r28)
/* 0000951C 28040000 */ cmplwi r4, 0
/* 00009520 41820010 */ beq lbl_00009530
/* 00009524 807F0000 */ lwz r3, 0(r31)
/* 00009528 4BFF6C35 */ bl OSFreeToHeap
/* 0000952C 93DC0098 */ stw r30, 0x98(r28)
lbl_00009530:
/* 00009530 37BDFFFF */ addic. r29, r29, -1  ;# fixed addi
/* 00009534 3B9C009C */ addi r28, r28, 0x9c
/* 00009538 4181FFC8 */ bgt lbl_00009500
/* 0000953C 480012A5 */ bl lbl_0000A7E0
/* 00009540 8001001C */ lwz r0, 0x1c(r1)
/* 00009544 83E10014 */ lwz r31, 0x14(r1)
/* 00009548 83C10010 */ lwz r30, 0x10(r1)
/* 0000954C 7C0803A6 */ mtlr r0
/* 00009550 83A1000C */ lwz r29, 0xc(r1)
/* 00009554 83810008 */ lwz r28, 8(r1)
/* 00009558 38210018 */ addi r1, r1, 0x18
/* 0000955C 4E800020 */ blr 
lbl_00009560:
/* 00009560 7C0802A6 */ mflr r0
/* 00009564 90010004 */ stw r0, 4(r1)
/* 00009568 9421FFF8 */ stwu r1, -8(r1)
/* 0000956C 48001279 */ bl lbl_0000A7E4
/* 00009570 48001881 */ bl lbl_0000ADF0
/* 00009574 38000002 */ li r0, 2
/* 00009578 2C000002 */ cmpwi r0, 2
/* 0000957C 3CA00000 */ lis r5, lbl_10000E00@ha
/* 00009580 3C800000 */ lis r4, controllerInfo@ha
/* 00009584 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 00009588 38E50000 */ addi r7, r5, lbl_10000E00@l
/* 0000958C 38C40000 */ addi r6, r4, controllerInfo@l
/* 00009590 38A30000 */ addi r5, r3, currentCameraStructPtr@l
/* 00009594 4082002C */ bne lbl_000095C0
/* 00009598 A0060000 */ lhz r0, 0(r6)
/* 0000959C 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000095A0 41820020 */ beq lbl_000095C0
/* 000095A4 80850000 */ lwz r4, 0(r5)
/* 000095A8 8064000C */ lwz r3, 0xc(r4)
/* 000095AC 80040010 */ lwz r0, 0x10(r4)
/* 000095B0 90670000 */ stw r3, 0(r7)
/* 000095B4 90070004 */ stw r0, 4(r7)
/* 000095B8 80040014 */ lwz r0, 0x14(r4)
/* 000095BC 90070008 */ stw r0, 8(r7)
lbl_000095C0:
/* 000095C0 38E7009C */ addi r7, r7, 0x9c
/* 000095C4 48000024 */ b lbl_000095E8
/* 000095C8 41820020 */ beq lbl_000095E8
/* 000095CC 80850000 */ lwz r4, 0(r5)
/* 000095D0 8064000C */ lwz r3, 0xc(r4)
/* 000095D4 80040010 */ lwz r0, 0x10(r4)
/* 000095D8 90670000 */ stw r3, 0(r7)
/* 000095DC 90070004 */ stw r0, 4(r7)
/* 000095E0 80040014 */ lwz r0, 0x14(r4)
/* 000095E4 90070008 */ stw r0, 8(r7)
lbl_000095E8:
/* 000095E8 8001000C */ lwz r0, 0xc(r1)
/* 000095EC 38210008 */ addi r1, r1, 8
/* 000095F0 7C0803A6 */ mtlr r0
/* 000095F4 4E800020 */ blr 
lbl_000095F8:
/* 000095F8 7C0802A6 */ mflr r0
/* 000095FC 3C600000 */ lis r3, lbl_00010080@ha
/* 00009600 90010004 */ stw r0, 4(r1)
/* 00009604 9421FF00 */ stwu r1, -0x100(r1)
/* 00009608 DBE100F8 */ stfd f31, 0xf8(r1)
/* 0000960C DBC100F0 */ stfd f30, 0xf0(r1)
/* 00009610 DBA100E8 */ stfd f29, 0xe8(r1)
/* 00009614 93E100E4 */ stw r31, 0xe4(r1)
/* 00009618 3BE30000 */ addi r31, r3, lbl_00010080@l
/* 0000961C 38610038 */ addi r3, r1, 0x38
/* 00009620 93C100E0 */ stw r30, 0xe0(r1)
/* 00009624 93A100DC */ stw r29, 0xdc(r1)
/* 00009628 938100D8 */ stw r28, 0xd8(r1)
/* 0000962C 4BFF6B31 */ bl GXGetProjectionv
/* 00009630 3C600000 */ lis r3, mathutilData@ha
/* 00009634 3BC30000 */ addi r30, r3, mathutilData@l
/* 00009638 807E0000 */ lwz r3, 0(r30)
/* 0000963C 38810054 */ addi r4, r1, 0x54
/* 00009640 38630030 */ addi r3, r3, 0x30
/* 00009644 4BFF6B19 */ bl PSMTXCopy
/* 00009648 3C600000 */ lis r3, lbl_10000E00@ha
/* 0000964C 38030000 */ addi r0, r3, lbl_10000E00@l
/* 00009650 7C1C0378 */ mr r28, r0
/* 00009654 3BA00002 */ li r29, 2
lbl_00009658:
/* 00009658 819C0068 */ lwz r12, 0x68(r28)
/* 0000965C 280C0000 */ cmplwi r12, 0
/* 00009660 418201EC */ beq lbl_0000984C
/* 00009664 801C006C */ lwz r0, 0x6c(r28)
/* 00009668 28000000 */ cmplwi r0, 0
/* 0000966C 418201E0 */ beq lbl_0000984C
/* 00009670 807C0064 */ lwz r3, 0x64(r28)
/* 00009674 7D8803A6 */ mtlr r12
/* 00009678 389C000C */ addi r4, r28, 0xc
/* 0000967C 38A100C0 */ addi r5, r1, 0xc0
/* 00009680 4E800021 */ blrl 
/* 00009684 C07C0000 */ lfs f3, 0(r28)
/* 00009688 C05C000C */ lfs f2, 0xc(r28)
/* 0000968C C03C0004 */ lfs f1, 4(r28)
/* 00009690 C01C0010 */ lfs f0, 0x10(r28)
/* 00009694 EC631028 */ fsubs f3, f3, f2
/* 00009698 C05C0008 */ lfs f2, 8(r28)
/* 0000969C EC810028 */ fsubs f4, f1, f0
/* 000096A0 C01C0014 */ lfs f0, 0x14(r28)
/* 000096A4 EC2300F2 */ fmuls f1, f3, f3
/* 000096A8 EC420028 */ fsubs f2, f2, f0
/* 000096AC C06100C0 */ lfs f3, 0xc0(r1)
/* 000096B0 EC040132 */ fmuls f0, f4, f4
/* 000096B4 EC4200B2 */ fmuls f2, f2, f2
/* 000096B8 EFC300F2 */ fmuls f30, f3, f3
/* 000096BC EC01002A */ fadds f0, f1, f0
/* 000096C0 EFA2002A */ fadds f29, f2, f0
/* 000096C4 FC20E890 */ fmr f1, f29
/* 000096C8 4BFF6A95 */ bl mathutil_sqrt
/* 000096CC FFE00890 */ fmr f31, f1
/* 000096D0 389C0000 */ addi r4, r28, 0
/* 000096D4 387C002C */ addi r3, r28, 0x2c
/* 000096D8 38BC0018 */ addi r5, r28, 0x18
/* 000096DC D3FC0024 */ stfs f31, 0x24(r28)
/* 000096E0 38DC000C */ addi r6, r28, 0xc
/* 000096E4 C01F0010 */ lfs f0, 0x10(r31)
/* 000096E8 D01C0028 */ stfs f0, 0x28(r28)
/* 000096EC 4BFF6A71 */ bl C_MTXLookAt
/* 000096F0 809E0000 */ lwz r4, 0(r30)
/* 000096F4 387C002C */ addi r3, r28, 0x2c
/* 000096F8 38840030 */ addi r4, r4, 0x30
/* 000096FC 4BFF6A61 */ bl PSMTXCopy
/* 00009700 FC1DF040 */ fcmpo cr0, f29, f30
/* 00009704 40810040 */ ble lbl_00009744
/* 00009708 EC1EE824 */ fdivs f0, f30, f29
/* 0000970C C03F000C */ lfs f1, 0xc(r31)
/* 00009710 EC210028 */ fsubs f1, f1, f0
/* 00009714 4BFF6A49 */ bl mathutil_sqrt
/* 00009718 C07F0014 */ lfs f3, 0x14(r31)
/* 0000971C EC1DF028 */ fsubs f0, f29, f30
/* 00009720 C04100C0 */ lfs f2, 0xc0(r1)
/* 00009724 EC230072 */ fmuls f1, f3, f1
/* 00009728 EC220072 */ fmuls f1, f2, f1
/* 0000972C D02100C0 */ stfs f1, 0xc0(r1)
/* 00009730 C02100C0 */ lfs f1, 0xc0(r1)
/* 00009734 EC3F0072 */ fmuls f1, f31, f1
/* 00009738 EC010024 */ fdivs f0, f1, f0
/* 0000973C D01C005C */ stfs f0, 0x5c(r28)
/* 00009740 4800000C */ b lbl_0000974C
lbl_00009744:
/* 00009744 C01F0018 */ lfs f0, 0x18(r31)
/* 00009748 D01C005C */ stfs f0, 0x5c(r28)
lbl_0000974C:
/* 0000974C C03F000C */ lfs f1, 0xc(r31)
/* 00009750 38610084 */ addi r3, r1, 0x84
/* 00009754 C01C005C */ lfs f0, 0x5c(r28)
/* 00009758 EC010024 */ fdivs f0, f1, f0
/* 0000975C D01C0060 */ stfs f0, 0x60(r28)
/* 00009760 C0BF001C */ lfs f5, 0x1c(r31)
/* 00009764 C01C005C */ lfs f0, 0x5c(r28)
/* 00009768 C0DF0020 */ lfs f6, 0x20(r31)
/* 0000976C EC250032 */ fmuls f1, f5, f0
/* 00009770 FC400850 */ fneg f2, f1
/* 00009774 FC800890 */ fmr f4, f1
/* 00009778 FC601090 */ fmr f3, f2
/* 0000977C 4BFF69E1 */ bl C_MTXFrustum
/* 00009780 38610084 */ addi r3, r1, 0x84
/* 00009784 38800000 */ li r4, 0
/* 00009788 4BFF69D5 */ bl GXSetProjection
/* 0000978C C03F0000 */ lfs f1, 0(r31)
/* 00009790 C07F0024 */ lfs f3, 0x24(r31)
/* 00009794 FC400890 */ fmr f2, f1
/* 00009798 C0DF000C */ lfs f6, 0xc(r31)
/* 0000979C FC801890 */ fmr f4, f3
/* 000097A0 FCA00890 */ fmr f5, f1
/* 000097A4 4BFF69B9 */ bl GXSetViewport
/* 000097A8 38600000 */ li r3, 0
/* 000097AC 38800000 */ li r4, 0
/* 000097B0 38A00100 */ li r5, 0x100
/* 000097B4 38C00100 */ li r6, 0x100
/* 000097B8 4BFF69A5 */ bl GXSetScissor
/* 000097BC 819C006C */ lwz r12, 0x6c(r28)
/* 000097C0 7F84E378 */ mr r4, r28
/* 000097C4 807C0064 */ lwz r3, 0x64(r28)
/* 000097C8 7D8803A6 */ mtlr r12
/* 000097CC 4E800021 */ blrl 
/* 000097D0 38600000 */ li r3, 0
/* 000097D4 38800000 */ li r4, 0
/* 000097D8 38A00100 */ li r5, 0x100
/* 000097DC 38C00100 */ li r6, 0x100
/* 000097E0 4BFF697D */ bl GXSetTexCopySrc
/* 000097E4 38600100 */ li r3, 0x100
/* 000097E8 38800100 */ li r4, 0x100
/* 000097EC 38A00001 */ li r5, 1
/* 000097F0 38C00000 */ li r6, 0
/* 000097F4 4BFF6969 */ bl GXSetTexCopyDst
/* 000097F8 801C0090 */ lwz r0, 0x90(r28)
/* 000097FC 38800001 */ li r4, 1
/* 00009800 5403103A */ slwi r3, r0, 2
/* 00009804 38030094 */ addi r0, r3, 0x94
/* 00009808 7C7C002E */ lwzx r3, r28, r0
/* 0000980C 4BFF6951 */ bl GXCopyTex
/* 00009810 801C0090 */ lwz r0, 0x90(r28)
/* 00009814 387C0070 */ addi r3, r28, 0x70
/* 00009818 38A00100 */ li r5, 0x100
/* 0000981C 5404103A */ slwi r4, r0, 2
/* 00009820 38040094 */ addi r0, r4, 0x94
/* 00009824 7C9C002E */ lwzx r4, r28, r0
/* 00009828 38C00100 */ li r6, 0x100
/* 0000982C 38E00001 */ li r7, 1
/* 00009830 39000000 */ li r8, 0
/* 00009834 39200000 */ li r9, 0
/* 00009838 39400000 */ li r10, 0
/* 0000983C 4BFF6921 */ bl GXInitTexObj
/* 00009840 801C0090 */ lwz r0, 0x90(r28)
/* 00009844 68000001 */ xori r0, r0, 1
/* 00009848 901C0090 */ stw r0, 0x90(r28)
lbl_0000984C:
/* 0000984C 37BDFFFF */ addic. r29, r29, -1  ;# fixed addi
/* 00009850 3B9C009C */ addi r28, r28, 0x9c
/* 00009854 4181FE04 */ bgt lbl_00009658
/* 00009858 3C600000 */ lis r3, mathutilData@ha
/* 0000985C 80830000 */ lwz r4, mathutilData@l(r3)
/* 00009860 38610054 */ addi r3, r1, 0x54
/* 00009864 38840030 */ addi r4, r4, 0x30
/* 00009868 4BFF68F5 */ bl PSMTXCopy
/* 0000986C C021003C */ lfs f1, 0x3c(r1)
/* 00009870 38610008 */ addi r3, r1, 8
/* 00009874 C0010040 */ lfs f0, 0x40(r1)
/* 00009878 38800000 */ li r4, 0
/* 0000987C D0210008 */ stfs f1, 8(r1)
/* 00009880 C0610044 */ lfs f3, 0x44(r1)
/* 00009884 C03F0000 */ lfs f1, 0(r31)
/* 00009888 C0410048 */ lfs f2, 0x48(r1)
/* 0000988C D021000C */ stfs f1, 0xc(r1)
/* 00009890 C021004C */ lfs f1, 0x4c(r1)
/* 00009894 D0010010 */ stfs f0, 0x10(r1)
/* 00009898 C0010050 */ lfs f0, 0x50(r1)
/* 0000989C C09F0000 */ lfs f4, 0(r31)
/* 000098A0 D0810014 */ stfs f4, 0x14(r1)
/* 000098A4 C09F0000 */ lfs f4, 0(r31)
/* 000098A8 D0810018 */ stfs f4, 0x18(r1)
/* 000098AC D061001C */ stfs f3, 0x1c(r1)
/* 000098B0 D0410020 */ stfs f2, 0x20(r1)
/* 000098B4 C05F0000 */ lfs f2, 0(r31)
/* 000098B8 D0410024 */ stfs f2, 0x24(r1)
/* 000098BC C05F0000 */ lfs f2, 0(r31)
/* 000098C0 D0410028 */ stfs f2, 0x28(r1)
/* 000098C4 C05F0000 */ lfs f2, 0(r31)
/* 000098C8 D041002C */ stfs f2, 0x2c(r1)
/* 000098CC D0210030 */ stfs f1, 0x30(r1)
/* 000098D0 D0010034 */ stfs f0, 0x34(r1)
/* 000098D4 C01F0000 */ lfs f0, 0(r31)
/* 000098D8 D0010038 */ stfs f0, 0x38(r1)
/* 000098DC C01F0000 */ lfs f0, 0(r31)
/* 000098E0 D001003C */ stfs f0, 0x3c(r1)
/* 000098E4 C01F0008 */ lfs f0, 8(r31)
/* 000098E8 D0010040 */ stfs f0, 0x40(r1)
/* 000098EC C01F0000 */ lfs f0, 0(r31)
/* 000098F0 D0010044 */ stfs f0, 0x44(r1)
/* 000098F4 4BFF6869 */ bl GXSetProjection
/* 000098F8 3C600000 */ lis r3, currRenderMode@ha
/* 000098FC C03F0000 */ lfs f1, 0(r31)
/* 00009900 3BC30000 */ addi r30, r3, currRenderMode@l
/* 00009904 C0DF000C */ lfs f6, 0xc(r31)
/* 00009908 80DE0000 */ lwz r6, 0(r30)
/* 0000990C 3CA00000 */ lis r5, lbl_000100A8@ha
/* 00009910 3C600000 */ lis r3, lbl_000100A8@ha
/* 00009914 C8E50000 */ lfd f7, lbl_000100A8@l(r5)
/* 00009918 A0860004 */ lhz r4, 4(r6)
/* 0000991C A0060008 */ lhz r0, 8(r6)
/* 00009920 FC400890 */ fmr f2, f1
/* 00009924 908100D4 */ stw r4, 0xd4(r1)
/* 00009928 3C804330 */ lis r4, 0x4330
/* 0000992C C8830000 */ lfd f4, lbl_000100A8@l(r3)
/* 00009930 900100CC */ stw r0, 0xcc(r1)
/* 00009934 FCA00890 */ fmr f5, f1
/* 00009938 908100D0 */ stw r4, 0xd0(r1)
/* 0000993C 908100C8 */ stw r4, 0xc8(r1)
/* 00009940 C86100D0 */ lfd f3, 0xd0(r1)
/* 00009944 C80100C8 */ lfd f0, 0xc8(r1)
/* 00009948 EC633828 */ fsubs f3, f3, f7
/* 0000994C EC802028 */ fsubs f4, f0, f4
/* 00009950 4BFF680D */ bl GXSetViewport
/* 00009954 80DE0000 */ lwz r6, 0(r30)
/* 00009958 38600000 */ li r3, 0
/* 0000995C 38800000 */ li r4, 0
/* 00009960 A0A60004 */ lhz r5, 4(r6)
/* 00009964 A0C60006 */ lhz r6, 6(r6)
/* 00009968 4BFF67F5 */ bl GXSetScissor
/* 0000996C 80010104 */ lwz r0, 0x104(r1)
/* 00009970 CBE100F8 */ lfd f31, 0xf8(r1)
/* 00009974 CBC100F0 */ lfd f30, 0xf0(r1)
/* 00009978 7C0803A6 */ mtlr r0
/* 0000997C CBA100E8 */ lfd f29, 0xe8(r1)
/* 00009980 83E100E4 */ lwz r31, 0xe4(r1)
/* 00009984 83C100E0 */ lwz r30, 0xe0(r1)
/* 00009988 83A100DC */ lwz r29, 0xdc(r1)
/* 0000998C 838100D8 */ lwz r28, 0xd8(r1)
/* 00009990 38210100 */ addi r1, r1, 0x100
/* 00009994 4E800020 */ blr 
lbl_00009998:
/* 00009998 7C0802A6 */ mflr r0
/* 0000999C 90010004 */ stw r0, 4(r1)
/* 000099A0 9421FFE8 */ stwu r1, -0x18(r1)
/* 000099A4 93E10014 */ stw r31, 0x14(r1)
/* 000099A8 93C10010 */ stw r30, 0x10(r1)
/* 000099AC 93A1000C */ stw r29, 0xc(r1)
/* 000099B0 48000E4D */ bl lbl_0000A7FC
/* 000099B4 480014C9 */ bl lbl_0000AE7C
/* 000099B8 3C600000 */ lis r3, lbl_10000E00@ha
/* 000099BC 38030000 */ addi r0, r3, lbl_10000E00@l
/* 000099C0 3C600000 */ lis r3, controllerInfo@ha
/* 000099C4 7C1D0378 */ mr r29, r0
/* 000099C8 3BE30000 */ addi r31, r3, controllerInfo@l
/* 000099CC 3BC00002 */ li r30, 2
lbl_000099D0:
/* 000099D0 A01F0000 */ lhz r0, 0(r31)
/* 000099D4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000099D8 4182000C */ beq lbl_000099E4
/* 000099DC 7FA3EB78 */ mr r3, r29
/* 000099E0 4800002D */ bl lbl_00009A0C
lbl_000099E4:
/* 000099E4 37DEFFFF */ addic. r30, r30, -1  ;# fixed addi
/* 000099E8 3BBD009C */ addi r29, r29, 0x9c
/* 000099EC 4181FFE4 */ bgt lbl_000099D0
/* 000099F0 8001001C */ lwz r0, 0x1c(r1)
/* 000099F4 83E10014 */ lwz r31, 0x14(r1)
/* 000099F8 83C10010 */ lwz r30, 0x10(r1)
/* 000099FC 7C0803A6 */ mtlr r0
/* 00009A00 83A1000C */ lwz r29, 0xc(r1)
/* 00009A04 38210018 */ addi r1, r1, 0x18
/* 00009A08 4E800020 */ blr 
lbl_00009A0C:
/* 00009A0C 7C0802A6 */ mflr r0
/* 00009A10 3C800000 */ lis r4, lbl_00010080@ha
/* 00009A14 90010004 */ stw r0, 4(r1)
/* 00009A18 9421FD98 */ stwu r1, -0x268(r1)
/* 00009A1C DBE10260 */ stfd f31, 0x260(r1)
/* 00009A20 DBC10258 */ stfd f30, 0x258(r1)
/* 00009A24 DBA10250 */ stfd f29, 0x250(r1)
/* 00009A28 DB810248 */ stfd f28, 0x248(r1)
/* 00009A2C DB610240 */ stfd f27, 0x240(r1)
/* 00009A30 DB410238 */ stfd f26, 0x238(r1)
/* 00009A34 93E10234 */ stw r31, 0x234(r1)
/* 00009A38 3BE40000 */ addi r31, r4, lbl_00010080@l
/* 00009A3C 38810188 */ addi r4, r1, 0x188
/* 00009A40 93C10230 */ stw r30, 0x230(r1)
/* 00009A44 3BC30000 */ addi r30, r3, 0
/* 00009A48 38600004 */ li r3, 4
/* 00009A4C 93A1022C */ stw r29, 0x22c(r1)
/* 00009A50 801F0030 */ lwz r0, 0x30(r31)
/* 00009A54 9001021C */ stw r0, 0x21c(r1)
/* 00009A58 380000FF */ li r0, 0xff
/* 00009A5C 9801021C */ stb r0, 0x21c(r1)
/* 00009A60 9801021D */ stb r0, 0x21d(r1)
/* 00009A64 9801021E */ stb r0, 0x21e(r1)
/* 00009A68 9801021F */ stb r0, 0x21f(r1)
/* 00009A6C 8001021C */ lwz r0, 0x21c(r1)
/* 00009A70 90010188 */ stw r0, 0x188(r1)
/* 00009A74 4BFF66E9 */ bl GXSetChanMatColor
/* 00009A78 38600004 */ li r3, 4
/* 00009A7C 38800000 */ li r4, 0
/* 00009A80 38A00000 */ li r5, 0
/* 00009A84 38C00000 */ li r6, 0
/* 00009A88 38E00000 */ li r7, 0
/* 00009A8C 39000002 */ li r8, 2
/* 00009A90 39200001 */ li r9, 1
/* 00009A94 4BFF66C9 */ bl GXSetChanCtrl
/* 00009A98 38600001 */ li r3, 1
/* 00009A9C 4BFF66C1 */ bl GXSetNumChans
/* 00009AA0 38600000 */ li r3, 0
/* 00009AA4 388000FF */ li r4, 0xff
/* 00009AA8 38A000FF */ li r5, 0xff
/* 00009AAC 38C00004 */ li r6, 4
/* 00009AB0 4BFF66AD */ bl func_8009EFF4
/* 00009AB4 38600000 */ li r3, 0
/* 00009AB8 4BFF66A5 */ bl GXSetTevDirect
/* 00009ABC 38600000 */ li r3, 0
/* 00009AC0 38800004 */ li r4, 4
/* 00009AC4 4BFF6699 */ bl func_8009EA30
/* 00009AC8 38600001 */ li r3, 1
/* 00009ACC 4BFF6691 */ bl func_8009F2C8
/* 00009AD0 38600000 */ li r3, 0
/* 00009AD4 4BFF6689 */ bl GXSetNumTexGens
/* 00009AD8 38600000 */ li r3, 0
/* 00009ADC 4BFF6681 */ bl GXSetNumIndStages
/* 00009AE0 38600001 */ li r3, 1
/* 00009AE4 38800001 */ li r4, 1
/* 00009AE8 38A00000 */ li r5, 0
/* 00009AEC 38C00000 */ li r6, 0
/* 00009AF0 4BFF666D */ bl func_8009E110
/* 00009AF4 3C600000 */ lis r3, zMode@ha
/* 00009AF8 38630000 */ addi r3, r3, zMode@l
/* 00009AFC 80630000 */ lwz r3, 0(r3)
/* 00009B00 88030008 */ lbz r0, 8(r3)
/* 00009B04 28000001 */ cmplwi r0, 1
/* 00009B08 4082001C */ bne lbl_00009B24
/* 00009B0C 80030004 */ lwz r0, 4(r3)
/* 00009B10 2C000001 */ cmpwi r0, 1
/* 00009B14 40820010 */ bne lbl_00009B24
/* 00009B18 88030000 */ lbz r0, 0(r3)
/* 00009B1C 28000001 */ cmplwi r0, 1
/* 00009B20 41820038 */ beq lbl_00009B58
lbl_00009B24:
/* 00009B24 38600001 */ li r3, 1
/* 00009B28 38800001 */ li r4, 1
/* 00009B2C 38A00001 */ li r5, 1
/* 00009B30 4BFF662D */ bl GXSetZMode
/* 00009B34 3C600000 */ lis r3, zMode@ha
/* 00009B38 38830000 */ addi r4, r3, zMode@l
/* 00009B3C 80640000 */ lwz r3, 0(r4)
/* 00009B40 38000001 */ li r0, 1
/* 00009B44 98030000 */ stb r0, 0(r3)
/* 00009B48 80640000 */ lwz r3, 0(r4)
/* 00009B4C 90030004 */ stw r0, 4(r3)
/* 00009B50 80640000 */ lwz r3, 0(r4)
/* 00009B54 98030008 */ stb r0, 8(r3)
lbl_00009B58:
/* 00009B58 4BFF6605 */ bl func_8009AC8C
/* 00009B5C 38600200 */ li r3, 0x200
/* 00009B60 4BFF65FD */ bl gxutil_set_vtx_attrs
/* 00009B64 38600006 */ li r3, 6
/* 00009B68 38800009 */ li r4, 9
/* 00009B6C 38A00001 */ li r5, 1
/* 00009B70 38C00004 */ li r6, 4
/* 00009B74 38E00000 */ li r7, 0
/* 00009B78 4BFF65E5 */ bl GXSetVtxAttrFmt
/* 00009B7C C03E0024 */ lfs f1, 0x24(r30)
/* 00009B80 3C600000 */ lis r3, mathutilData@ha
/* 00009B84 C01E0028 */ lfs f0, 0x28(r30)
/* 00009B88 3BA30000 */ addi r29, r3, mathutilData@l
/* 00009B8C C05E005C */ lfs f2, 0x5c(r30)
/* 00009B90 EC01002A */ fadds f0, f1, f0
/* 00009B94 809D0000 */ lwz r4, 0(r29)
/* 00009B98 EFA20072 */ fmuls f29, f2, f1
/* 00009B9C 387E002C */ addi r3, r30, 0x2c
/* 00009BA0 FFE00850 */ fneg f31, f1
/* 00009BA4 EF820032 */ fmuls f28, f2, f0
/* 00009BA8 FFC00050 */ fneg f30, f0
/* 00009BAC FF60E850 */ fneg f27, f29
/* 00009BB0 FF40E050 */ fneg f26, f28
/* 00009BB4 4BFF65A9 */ bl PSMTXInverse
/* 00009BB8 809D0000 */ lwz r4, 0(r29)
/* 00009BBC 38A40000 */ addi r5, r4, 0
/* 00009BC0 38640030 */ addi r3, r4, 0x30
/* 00009BC4 4BFF6599 */ bl PSMTXConcat
/* 00009BC8 807D0000 */ lwz r3, 0(r29)
/* 00009BCC 38800000 */ li r4, 0
/* 00009BD0 4BFF658D */ bl GXLoadPosMtxImm
/* 00009BD4 3C600000 */ lis r3, zMode@ha
/* 00009BD8 38630000 */ addi r3, r3, zMode@l
/* 00009BDC 80630000 */ lwz r3, 0(r3)
/* 00009BE0 88030009 */ lbz r0, 9(r3)
/* 00009BE4 28000006 */ cmplwi r0, 6
/* 00009BE8 40820010 */ bne lbl_00009BF8
/* 00009BEC 8003000C */ lwz r0, 0xc(r3)
/* 00009BF0 2C000000 */ cmpwi r0, 0
/* 00009BF4 41820030 */ beq lbl_00009C24
lbl_00009BF8:
/* 00009BF8 38600006 */ li r3, 6
/* 00009BFC 38800000 */ li r4, 0
/* 00009C00 4BFF655D */ bl GXSetLineWidth
/* 00009C04 3C600000 */ lis r3, zMode@ha
/* 00009C08 38830000 */ addi r4, r3, zMode@l
/* 00009C0C 80640000 */ lwz r3, 0(r4)
/* 00009C10 38A00006 */ li r5, 6
/* 00009C14 38000000 */ li r0, 0
/* 00009C18 98A30009 */ stb r5, 9(r3)
/* 00009C1C 80640000 */ lwz r3, 0(r4)
/* 00009C20 9003000C */ stw r0, 0xc(r3)
lbl_00009C24:
/* 00009C24 386000A8 */ li r3, 0xa8
/* 00009C28 38800006 */ li r4, 6
/* 00009C2C 38A00008 */ li r5, 8
/* 00009C30 4BFF652D */ bl GXBegin
/* 00009C34 C01F0000 */ lfs f0, 0(r31)
/* 00009C38 3C80CC01 */ lis r4, 0xcc01
/* 00009C3C 3C600000 */ lis r3, zMode@ha
/* 00009C40 D0048000 */ stfs f0, -0x8000(r4)
/* 00009C44 38630000 */ addi r3, r3, zMode@l
/* 00009C48 80630000 */ lwz r3, 0(r3)
/* 00009C4C D0048000 */ stfs f0, -0x8000(r4)
/* 00009C50 88030009 */ lbz r0, 9(r3)
/* 00009C54 D0048000 */ stfs f0, -0x8000(r4)
/* 00009C58 28000012 */ cmplwi r0, 0x12
/* 00009C5C D3A48000 */ stfs f29, -0x8000(r4)
/* 00009C60 D3A48000 */ stfs f29, -0x8000(r4)
/* 00009C64 D3E48000 */ stfs f31, -0x8000(r4)
/* 00009C68 D0048000 */ stfs f0, -0x8000(r4)
/* 00009C6C D0048000 */ stfs f0, -0x8000(r4)
/* 00009C70 D0048000 */ stfs f0, -0x8000(r4)
/* 00009C74 D3648000 */ stfs f27, -0x8000(r4)
/* 00009C78 D3A48000 */ stfs f29, -0x8000(r4)
/* 00009C7C D3E48000 */ stfs f31, -0x8000(r4)
/* 00009C80 D0048000 */ stfs f0, -0x8000(r4)
/* 00009C84 D0048000 */ stfs f0, -0x8000(r4)
/* 00009C88 D0048000 */ stfs f0, -0x8000(r4)
/* 00009C8C D3648000 */ stfs f27, -0x8000(r4)
/* 00009C90 D3648000 */ stfs f27, -0x8000(r4)
/* 00009C94 D3E48000 */ stfs f31, -0x8000(r4)
/* 00009C98 D0048000 */ stfs f0, -0x8000(r4)
/* 00009C9C D0048000 */ stfs f0, -0x8000(r4)
/* 00009CA0 D0048000 */ stfs f0, -0x8000(r4)
/* 00009CA4 D3A48000 */ stfs f29, -0x8000(r4)
/* 00009CA8 D3648000 */ stfs f27, -0x8000(r4)
/* 00009CAC D3E48000 */ stfs f31, -0x8000(r4)
/* 00009CB0 40820010 */ bne lbl_00009CC0
/* 00009CB4 8003000C */ lwz r0, 0xc(r3)
/* 00009CB8 2C000000 */ cmpwi r0, 0
/* 00009CBC 41820030 */ beq lbl_00009CEC
lbl_00009CC0:
/* 00009CC0 38600012 */ li r3, 0x12
/* 00009CC4 38800000 */ li r4, 0
/* 00009CC8 4BFF6495 */ bl GXSetLineWidth
/* 00009CCC 3C600000 */ lis r3, zMode@ha
/* 00009CD0 38830000 */ addi r4, r3, zMode@l
/* 00009CD4 80640000 */ lwz r3, 0(r4)
/* 00009CD8 38A00012 */ li r5, 0x12
/* 00009CDC 38000000 */ li r0, 0
/* 00009CE0 98A30009 */ stb r5, 9(r3)
/* 00009CE4 80640000 */ lwz r3, 0(r4)
/* 00009CE8 9003000C */ stw r0, 0xc(r3)
lbl_00009CEC:
/* 00009CEC 386000A8 */ li r3, 0xa8
/* 00009CF0 38800006 */ li r4, 6
/* 00009CF4 38A00008 */ li r5, 8
/* 00009CF8 4BFF6465 */ bl GXBegin
/* 00009CFC 3FA0CC01 */ lis r29, 0xcc01
/* 00009D00 D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009D04 386000B0 */ li r3, 0xb0
/* 00009D08 38800006 */ li r4, 6
/* 00009D0C D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009D10 38A00005 */ li r5, 5
/* 00009D14 D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009D18 D39D8000 */ stfs f28, -0x8000(r29)
/* 00009D1C D39D8000 */ stfs f28, -0x8000(r29)
/* 00009D20 D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009D24 D37D8000 */ stfs f27, -0x8000(r29)
/* 00009D28 D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009D2C D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009D30 D35D8000 */ stfs f26, -0x8000(r29)
/* 00009D34 D39D8000 */ stfs f28, -0x8000(r29)
/* 00009D38 D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009D3C D37D8000 */ stfs f27, -0x8000(r29)
/* 00009D40 D37D8000 */ stfs f27, -0x8000(r29)
/* 00009D44 D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009D48 D35D8000 */ stfs f26, -0x8000(r29)
/* 00009D4C D35D8000 */ stfs f26, -0x8000(r29)
/* 00009D50 D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009D54 D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009D58 D37D8000 */ stfs f27, -0x8000(r29)
/* 00009D5C D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009D60 D39D8000 */ stfs f28, -0x8000(r29)
/* 00009D64 D35D8000 */ stfs f26, -0x8000(r29)
/* 00009D68 D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009D6C 4BFF63F1 */ bl GXBegin
/* 00009D70 D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009D74 386000B0 */ li r3, 0xb0
/* 00009D78 38800006 */ li r4, 6
/* 00009D7C D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009D80 38A00005 */ li r5, 5
/* 00009D84 D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009D88 D37D8000 */ stfs f27, -0x8000(r29)
/* 00009D8C D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009D90 D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009D94 D37D8000 */ stfs f27, -0x8000(r29)
/* 00009D98 D37D8000 */ stfs f27, -0x8000(r29)
/* 00009D9C D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009DA0 D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009DA4 D37D8000 */ stfs f27, -0x8000(r29)
/* 00009DA8 D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009DAC D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009DB0 D3BD8000 */ stfs f29, -0x8000(r29)
/* 00009DB4 D3FD8000 */ stfs f31, -0x8000(r29)
/* 00009DB8 4BFF63A5 */ bl GXBegin
/* 00009DBC D39D8000 */ stfs f28, -0x8000(r29)
/* 00009DC0 38C000FF */ li r6, 0xff
/* 00009DC4 38A000C0 */ li r5, 0xc0
/* 00009DC8 D39D8000 */ stfs f28, -0x8000(r29)
/* 00009DCC 38000060 */ li r0, 0x60
/* 00009DD0 38810184 */ addi r4, r1, 0x184
/* 00009DD4 D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009DD8 38600004 */ li r3, 4
/* 00009DDC D35D8000 */ stfs f26, -0x8000(r29)
/* 00009DE0 D39D8000 */ stfs f28, -0x8000(r29)
/* 00009DE4 D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009DE8 D35D8000 */ stfs f26, -0x8000(r29)
/* 00009DEC D35D8000 */ stfs f26, -0x8000(r29)
/* 00009DF0 D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009DF4 D39D8000 */ stfs f28, -0x8000(r29)
/* 00009DF8 98C1021C */ stb r6, 0x21c(r1)
/* 00009DFC D35D8000 */ stfs f26, -0x8000(r29)
/* 00009E00 98A1021D */ stb r5, 0x21d(r1)
/* 00009E04 D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009E08 9801021E */ stb r0, 0x21e(r1)
/* 00009E0C D39D8000 */ stfs f28, -0x8000(r29)
/* 00009E10 98C1021F */ stb r6, 0x21f(r1)
/* 00009E14 D39D8000 */ stfs f28, -0x8000(r29)
/* 00009E18 8001021C */ lwz r0, 0x21c(r1)
/* 00009E1C D3DD8000 */ stfs f30, -0x8000(r29)
/* 00009E20 90010184 */ stw r0, 0x184(r1)
/* 00009E24 4BFF6339 */ bl GXSetChanMatColor
/* 00009E28 38600004 */ li r3, 4
/* 00009E2C 38800000 */ li r4, 0
/* 00009E30 38A00000 */ li r5, 0
/* 00009E34 38C00000 */ li r6, 0
/* 00009E38 38E00000 */ li r7, 0
/* 00009E3C 39000002 */ li r8, 2
/* 00009E40 39200001 */ li r9, 1
/* 00009E44 4BFF6319 */ bl GXSetChanCtrl
/* 00009E48 38600001 */ li r3, 1
/* 00009E4C 4BFF6311 */ bl GXSetNumChans
/* 00009E50 387E0070 */ addi r3, r30, 0x70
/* 00009E54 38800000 */ li r4, 0
/* 00009E58 4BFF6305 */ bl func_8009F430
/* 00009E5C 3C600000 */ lis r3, lbl_10000F38@ha
/* 00009E60 38630000 */ addi r3, r3, lbl_10000F38@l
/* 00009E64 38800001 */ li r4, 1
/* 00009E68 4BFF62F5 */ bl func_8009F430
/* 00009E6C 38600000 */ li r3, 0
/* 00009E70 38800001 */ li r4, 1
/* 00009E74 38A00004 */ li r5, 4
/* 00009E78 38C0003C */ li r6, 0x3c
/* 00009E7C 38E00000 */ li r7, 0
/* 00009E80 3900007D */ li r8, 0x7d
/* 00009E84 4BFF62D9 */ bl GXSetTexCoordGen2
/* 00009E88 38600000 */ li r3, 0
/* 00009E8C 38800000 */ li r4, 0
/* 00009E90 38A00000 */ li r5, 0
/* 00009E94 38C00004 */ li r6, 4
/* 00009E98 4BFF62C5 */ bl func_8009EFF4
/* 00009E9C 38600000 */ li r3, 0
/* 00009EA0 4BFF62BD */ bl GXSetTevDirect
/* 00009EA4 38600000 */ li r3, 0
/* 00009EA8 38800003 */ li r4, 3
/* 00009EAC 4BFF62B1 */ bl func_8009EA30
/* 00009EB0 38600001 */ li r3, 1
/* 00009EB4 38800000 */ li r4, 0
/* 00009EB8 38A00004 */ li r5, 4
/* 00009EBC 38C0001E */ li r6, 0x1e
/* 00009EC0 38E00000 */ li r7, 0
/* 00009EC4 3900007D */ li r8, 0x7d
/* 00009EC8 4BFF6295 */ bl GXSetTexCoordGen2
/* 00009ECC C03F0000 */ lfs f1, 0(r31)
/* 00009ED0 3861018C */ addi r3, r1, 0x18c
/* 00009ED4 FC400890 */ fmr f2, f1
/* 00009ED8 FC600890 */ fmr f3, f1
/* 00009EDC 4BFF6281 */ bl C_MTXScale
/* 00009EE0 C01F0034 */ lfs f0, 0x34(r31)
/* 00009EE4 3861018C */ addi r3, r1, 0x18c
/* 00009EE8 3880001E */ li r4, 0x1e
/* 00009EEC D001018C */ stfs f0, 0x18c(r1)
/* 00009EF0 38A00000 */ li r5, 0
/* 00009EF4 C01F0038 */ lfs f0, 0x38(r31)
/* 00009EF8 D0010198 */ stfs f0, 0x198(r1)
/* 00009EFC C01F0034 */ lfs f0, 0x34(r31)
/* 00009F00 D00101A0 */ stfs f0, 0x1a0(r1)
/* 00009F04 C01F0038 */ lfs f0, 0x38(r31)
/* 00009F08 D00101A8 */ stfs f0, 0x1a8(r1)
/* 00009F0C C01F000C */ lfs f0, 0xc(r31)
/* 00009F10 D00101B8 */ stfs f0, 0x1b8(r1)
/* 00009F14 4BFF6249 */ bl GXLoadTexMtxImm
/* 00009F18 38600001 */ li r3, 1
/* 00009F1C 38800001 */ li r4, 1
/* 00009F20 38A00000 */ li r5, 0
/* 00009F24 38C00004 */ li r6, 4
/* 00009F28 4BFF6235 */ bl func_8009EFF4
/* 00009F2C 38600001 */ li r3, 1
/* 00009F30 4BFF622D */ bl GXSetTevDirect
/* 00009F34 38600001 */ li r3, 1
/* 00009F38 38800003 */ li r4, 3
/* 00009F3C 4BFF6221 */ bl func_8009EA30
/* 00009F40 38600001 */ li r3, 1
/* 00009F44 38800008 */ li r4, 8
/* 00009F48 38A0000F */ li r5, 0xf
/* 00009F4C 38C0000F */ li r6, 0xf
/* 00009F50 38E00000 */ li r7, 0
/* 00009F54 4BFF6209 */ bl func_8009E618
/* 00009F58 38600001 */ li r3, 1
/* 00009F5C 38800001 */ li r4, 1
/* 00009F60 38A00000 */ li r5, 0
/* 00009F64 38C00000 */ li r6, 0
/* 00009F68 38E00001 */ li r7, 1
/* 00009F6C 39000000 */ li r8, 0
/* 00009F70 4BFF61ED */ bl func_8009E800
/* 00009F74 38600002 */ li r3, 2
/* 00009F78 38800000 */ li r4, 0
/* 00009F7C 38A00000 */ li r5, 0
/* 00009F80 38C00021 */ li r6, 0x21
/* 00009F84 38E00000 */ li r7, 0
/* 00009F88 3900007D */ li r8, 0x7d
/* 00009F8C 4BFF61D1 */ bl GXSetTexCoordGen2
/* 00009F90 C03F0000 */ lfs f1, 0(r31)
/* 00009F94 3861018C */ addi r3, r1, 0x18c
/* 00009F98 FC400890 */ fmr f2, f1
/* 00009F9C FC600890 */ fmr f3, f1
/* 00009FA0 4BFF61BD */ bl C_MTXScale
/* 00009FA4 C01F000C */ lfs f0, 0xc(r31)
/* 00009FA8 3861018C */ addi r3, r1, 0x18c
/* 00009FAC 38800021 */ li r4, 0x21
/* 00009FB0 D00101B8 */ stfs f0, 0x1b8(r1)
/* 00009FB4 38A00000 */ li r5, 0
/* 00009FB8 C03F003C */ lfs f1, 0x3c(r31)
/* 00009FBC C01E0028 */ lfs f0, 0x28(r30)
/* 00009FC0 EC010024 */ fdivs f0, f1, f0
/* 00009FC4 D0010194 */ stfs f0, 0x194(r1)
/* 00009FC8 C05F003C */ lfs f2, 0x3c(r31)
/* 00009FCC C03E0024 */ lfs f1, 0x24(r30)
/* 00009FD0 C01E0028 */ lfs f0, 0x28(r30)
/* 00009FD4 EC220072 */ fmuls f1, f2, f1
/* 00009FD8 C05F0040 */ lfs f2, 0x40(r31)
/* 00009FDC EC010024 */ fdivs f0, f1, f0
/* 00009FE0 EC02002A */ fadds f0, f2, f0
/* 00009FE4 D0010198 */ stfs f0, 0x198(r1)
/* 00009FE8 4BFF6175 */ bl GXLoadTexMtxImm
/* 00009FEC 38600002 */ li r3, 2
/* 00009FF0 38800002 */ li r4, 2
/* 00009FF4 38A00001 */ li r5, 1
/* 00009FF8 38C00004 */ li r6, 4
/* 00009FFC 4BFF6161 */ bl func_8009EFF4
/* 0000A000 38600002 */ li r3, 2
/* 0000A004 4BFF6159 */ bl GXSetTevDirect
/* 0000A008 38600002 */ li r3, 2
/* 0000A00C 38800004 */ li r4, 4
/* 0000A010 4BFF614D */ bl func_8009EA30
/* 0000A014 38600002 */ li r3, 2
/* 0000A018 3880000F */ li r4, 0xf
/* 0000A01C 38A00000 */ li r5, 0
/* 0000A020 38C00008 */ li r6, 8
/* 0000A024 38E0000F */ li r7, 0xf
/* 0000A028 4BFF6135 */ bl func_8009E618
/* 0000A02C 38600002 */ li r3, 2
/* 0000A030 38800000 */ li r4, 0
/* 0000A034 38A00000 */ li r5, 0
/* 0000A038 38C00000 */ li r6, 0
/* 0000A03C 38E00001 */ li r7, 1
/* 0000A040 39000000 */ li r8, 0
/* 0000A044 4BFF6119 */ bl func_8009E800
/* 0000A048 38600003 */ li r3, 3
/* 0000A04C 388000FF */ li r4, 0xff
/* 0000A050 38A000FF */ li r5, 0xff
/* 0000A054 38C00004 */ li r6, 4
/* 0000A058 4BFF6105 */ bl func_8009EFF4
/* 0000A05C 38600003 */ li r3, 3
/* 0000A060 4BFF60FD */ bl GXSetTevDirect
/* 0000A064 38600003 */ li r3, 3
/* 0000A068 38800004 */ li r4, 4
/* 0000A06C 4BFF60F1 */ bl func_8009EA30
/* 0000A070 38600003 */ li r3, 3
/* 0000A074 3880000F */ li r4, 0xf
/* 0000A078 38A0000A */ li r5, 0xa
/* 0000A07C 38C00000 */ li r6, 0
/* 0000A080 38E0000F */ li r7, 0xf
/* 0000A084 4BFF60D9 */ bl func_8009E618
/* 0000A088 38600003 */ li r3, 3
/* 0000A08C 38800000 */ li r4, 0
/* 0000A090 38A00000 */ li r5, 0
/* 0000A094 38C00000 */ li r6, 0
/* 0000A098 38E00001 */ li r7, 1
/* 0000A09C 39000000 */ li r8, 0
/* 0000A0A0 4BFF60BD */ bl func_8009E800
/* 0000A0A4 38600004 */ li r3, 4
/* 0000A0A8 4BFF60B5 */ bl func_8009F2C8
/* 0000A0AC 38600003 */ li r3, 3
/* 0000A0B0 4BFF60AD */ bl GXSetNumTexGens
/* 0000A0B4 38600000 */ li r3, 0
/* 0000A0B8 4BFF60A5 */ bl GXSetNumIndStages
/* 0000A0BC 38600001 */ li r3, 1
/* 0000A0C0 38800001 */ li r4, 1
/* 0000A0C4 38A00001 */ li r5, 1
/* 0000A0C8 38C00000 */ li r6, 0
/* 0000A0CC 4BFF6091 */ bl func_8009E110
/* 0000A0D0 3C600000 */ lis r3, zMode@ha
/* 0000A0D4 38630000 */ addi r3, r3, zMode@l
/* 0000A0D8 80630000 */ lwz r3, 0(r3)
/* 0000A0DC 88030008 */ lbz r0, 8(r3)
/* 0000A0E0 28000000 */ cmplwi r0, 0
/* 0000A0E4 4082001C */ bne lbl_0000A100
/* 0000A0E8 80030004 */ lwz r0, 4(r3)
/* 0000A0EC 2C000001 */ cmpwi r0, 1
/* 0000A0F0 40820010 */ bne lbl_0000A100
/* 0000A0F4 88030000 */ lbz r0, 0(r3)
/* 0000A0F8 28000001 */ cmplwi r0, 1
/* 0000A0FC 4182003C */ beq lbl_0000A138
lbl_0000A100:
/* 0000A100 38600001 */ li r3, 1
/* 0000A104 38800001 */ li r4, 1
/* 0000A108 38A00000 */ li r5, 0
/* 0000A10C 4BFF6051 */ bl GXSetZMode
/* 0000A110 3C600000 */ lis r3, zMode@ha
/* 0000A114 38830000 */ addi r4, r3, zMode@l
/* 0000A118 80640000 */ lwz r3, 0(r4)
/* 0000A11C 38A00001 */ li r5, 1
/* 0000A120 38000000 */ li r0, 0
/* 0000A124 98A30000 */ stb r5, 0(r3)
/* 0000A128 80640000 */ lwz r3, 0(r4)
/* 0000A12C 90A30004 */ stw r5, 4(r3)
/* 0000A130 80640000 */ lwz r3, 0(r4)
/* 0000A134 98030008 */ stb r0, 8(r3)
lbl_0000A138:
/* 0000A138 4BFF6025 */ bl func_8009AC8C
/* 0000A13C 38602200 */ li r3, 0x2200
/* 0000A140 4BFF601D */ bl gxutil_set_vtx_attrs
/* 0000A144 38600006 */ li r3, 6
/* 0000A148 38800009 */ li r4, 9
/* 0000A14C 38A00001 */ li r5, 1
/* 0000A150 38C00004 */ li r6, 4
/* 0000A154 38E00000 */ li r7, 0
/* 0000A158 4BFF6005 */ bl GXSetVtxAttrFmt
/* 0000A15C 38600006 */ li r3, 6
/* 0000A160 3880000D */ li r4, 0xd
/* 0000A164 38A00001 */ li r5, 1
/* 0000A168 38C00001 */ li r6, 1
/* 0000A16C 38E00000 */ li r7, 0
/* 0000A170 4BFF5FED */ bl GXSetVtxAttrFmt
/* 0000A174 3C600000 */ lis r3, mathutilData@ha
/* 0000A178 3BA30000 */ addi r29, r3, mathutilData@l
/* 0000A17C 809D0000 */ lwz r4, 0(r29)
/* 0000A180 387E002C */ addi r3, r30, 0x2c
/* 0000A184 4BFF5FD9 */ bl PSMTXInverse
/* 0000A188 809D0000 */ lwz r4, 0(r29)
/* 0000A18C 38A40000 */ addi r5, r4, 0
/* 0000A190 38640030 */ addi r3, r4, 0x30
/* 0000A194 4BFF5FC9 */ bl PSMTXConcat
/* 0000A198 807D0000 */ lwz r3, 0(r29)
/* 0000A19C 38800000 */ li r4, 0
/* 0000A1A0 4BFF5FBD */ bl GXLoadPosMtxImm
/* 0000A1A4 38600080 */ li r3, 0x80
/* 0000A1A8 38800006 */ li r4, 6
/* 0000A1AC 38A00040 */ li r5, 0x40
/* 0000A1B0 4BFF5FAD */ bl GXBegin
/* 0000A1B4 3C600000 */ lis r3, globalFrameCounter@ha
/* 0000A1B8 C03F0044 */ lfs f1, 0x44(r31)
/* 0000A1BC 80030000 */ lwz r0, globalFrameCounter@l(r3)
/* 0000A1C0 3C600000 */ lis r3, lbl_000100A8@ha
/* 0000A1C4 C8630000 */ lfd f3, lbl_000100A8@l(r3)
/* 0000A1C8 3C604330 */ lis r3, 0x4330
/* 0000A1CC 540006FE */ clrlwi r0, r0, 0x1b
/* 0000A1D0 90010224 */ stw r0, 0x224(r1)
/* 0000A1D4 38000008 */ li r0, 8
/* 0000A1D8 C01F0048 */ lfs f0, 0x48(r31)
/* 0000A1DC 7C0903A6 */ mtctr r0
/* 0000A1E0 90610220 */ stw r3, 0x220(r1)
/* 0000A1E4 3C80CC01 */ lis r4, 0xcc01
/* 0000A1E8 C8410220 */ lfd f2, 0x220(r1)
/* 0000A1EC EC421828 */ fsubs f2, f2, f3
/* 0000A1F0 EC220072 */ fmuls f1, f2, f1
/* 0000A1F4 ECA10032 */ fmuls f5, f1, f0
lbl_0000A1F8:
/* 0000A1F8 C05E0024 */ lfs f2, 0x24(r30)
/* 0000A1FC FC202850 */ fneg f1, f5
/* 0000A200 C01E0028 */ lfs f0, 0x28(r30)
/* 0000A204 38600001 */ li r3, 1
/* 0000A208 C07E005C */ lfs f3, 0x5c(r30)
/* 0000A20C EC82002A */ fadds f4, f2, f0
/* 0000A210 38000000 */ li r0, 0
/* 0000A214 C01F0048 */ lfs f0, 0x48(r31)
/* 0000A218 EC430132 */ fmuls f2, f3, f4
/* 0000A21C EC610132 */ fmuls f3, f1, f4
/* 0000A220 EC2500B2 */ fmuls f1, f5, f2
/* 0000A224 ECA5002A */ fadds f5, f5, f0
/* 0000A228 D0248000 */ stfs f1, -0x8000(r4)
/* 0000A22C FC000850 */ fneg f0, f1
/* 0000A230 D0248000 */ stfs f1, -0x8000(r4)
/* 0000A234 D0648000 */ stfs f3, -0x8000(r4)
/* 0000A238 98648000 */ stb r3, -0x8000(r4)
/* 0000A23C 98048000 */ stb r0, -0x8000(r4)
/* 0000A240 D0048000 */ stfs f0, -0x8000(r4)
/* 0000A244 D0248000 */ stfs f1, -0x8000(r4)
/* 0000A248 D0648000 */ stfs f3, -0x8000(r4)
/* 0000A24C 98048000 */ stb r0, -0x8000(r4)
/* 0000A250 98048000 */ stb r0, -0x8000(r4)
/* 0000A254 D0048000 */ stfs f0, -0x8000(r4)
/* 0000A258 D0048000 */ stfs f0, -0x8000(r4)
/* 0000A25C D0648000 */ stfs f3, -0x8000(r4)
/* 0000A260 98048000 */ stb r0, -0x8000(r4)
/* 0000A264 98648000 */ stb r3, -0x8000(r4)
/* 0000A268 D0248000 */ stfs f1, -0x8000(r4)
/* 0000A26C D0048000 */ stfs f0, -0x8000(r4)
/* 0000A270 D0648000 */ stfs f3, -0x8000(r4)
/* 0000A274 98648000 */ stb r3, -0x8000(r4)
/* 0000A278 98648000 */ stb r3, -0x8000(r4)
/* 0000A27C D0048000 */ stfs f0, -0x8000(r4)
/* 0000A280 D0248000 */ stfs f1, -0x8000(r4)
/* 0000A284 D0648000 */ stfs f3, -0x8000(r4)
/* 0000A288 98048000 */ stb r0, -0x8000(r4)
/* 0000A28C 98048000 */ stb r0, -0x8000(r4)
/* 0000A290 D0248000 */ stfs f1, -0x8000(r4)
/* 0000A294 D0248000 */ stfs f1, -0x8000(r4)
/* 0000A298 D0648000 */ stfs f3, -0x8000(r4)
/* 0000A29C 98648000 */ stb r3, -0x8000(r4)
/* 0000A2A0 98048000 */ stb r0, -0x8000(r4)
/* 0000A2A4 D0248000 */ stfs f1, -0x8000(r4)
/* 0000A2A8 D0048000 */ stfs f0, -0x8000(r4)
/* 0000A2AC D0648000 */ stfs f3, -0x8000(r4)
/* 0000A2B0 98648000 */ stb r3, -0x8000(r4)
/* 0000A2B4 98648000 */ stb r3, -0x8000(r4)
/* 0000A2B8 D0048000 */ stfs f0, -0x8000(r4)
/* 0000A2BC D0048000 */ stfs f0, -0x8000(r4)
/* 0000A2C0 D0648000 */ stfs f3, -0x8000(r4)
/* 0000A2C4 98048000 */ stb r0, -0x8000(r4)
/* 0000A2C8 98648000 */ stb r3, -0x8000(r4)
/* 0000A2CC 4200FF2C */ bdnz lbl_0000A1F8
/* 0000A2D0 8001026C */ lwz r0, 0x26c(r1)
/* 0000A2D4 CBE10260 */ lfd f31, 0x260(r1)
/* 0000A2D8 CBC10258 */ lfd f30, 0x258(r1)
/* 0000A2DC 7C0803A6 */ mtlr r0
/* 0000A2E0 CBA10250 */ lfd f29, 0x250(r1)
/* 0000A2E4 CB810248 */ lfd f28, 0x248(r1)
/* 0000A2E8 CB610240 */ lfd f27, 0x240(r1)
/* 0000A2EC CB410238 */ lfd f26, 0x238(r1)
/* 0000A2F0 83E10234 */ lwz r31, 0x234(r1)
/* 0000A2F4 83C10230 */ lwz r30, 0x230(r1)
/* 0000A2F8 83A1022C */ lwz r29, 0x22c(r1)
/* 0000A2FC 38210268 */ addi r1, r1, 0x268
/* 0000A300 4E800020 */ blr 
lbl_0000A304:
/* 0000A304 7C0802A6 */ mflr r0
/* 0000A308 3CA00000 */ lis r5, lbl_00010080@ha
/* 0000A30C 90010004 */ stw r0, 4(r1)
/* 0000A310 9421FF48 */ stwu r1, -0xb8(r1)
/* 0000A314 BF6100A4 */ stmw r27, 0xa4(r1)
/* 0000A318 3B630000 */ addi r27, r3, 0
/* 0000A31C 3B840000 */ addi r28, r4, 0
/* 0000A320 3BE50000 */ addi r31, r5, lbl_00010080@l
/* 0000A324 38610040 */ addi r3, r1, 0x40
/* 0000A328 4BFF5E35 */ bl PSMTXIdentity
/* 0000A32C C01F0040 */ lfs f0, 0x40(r31)
/* 0000A330 38610070 */ addi r3, r1, 0x70
/* 0000A334 D0010048 */ stfs f0, 0x48(r1)
/* 0000A338 C01F0040 */ lfs f0, 0x40(r31)
/* 0000A33C D0010058 */ stfs f0, 0x58(r1)
/* 0000A340 C03F0000 */ lfs f1, 0(r31)
/* 0000A344 FC400890 */ fmr f2, f1
/* 0000A348 FC600890 */ fmr f3, f1
/* 0000A34C 4BFF5E11 */ bl C_MTXScale
/* 0000A350 C01F000C */ lfs f0, 0xc(r31)
/* 0000A354 3C600000 */ lis r3, lbl_10000E00@ha
/* 0000A358 38030000 */ addi r0, r3, lbl_10000E00@l
/* 0000A35C D001009C */ stfs f0, 0x9c(r1)
/* 0000A360 7C1D0378 */ mr r29, r0
/* 0000A364 3BC00002 */ li r30, 2
lbl_0000A368:
/* 0000A368 C03F003C */ lfs f1, 0x3c(r31)
/* 0000A36C 38610040 */ addi r3, r1, 0x40
/* 0000A370 C01D0060 */ lfs f0, 0x60(r29)
/* 0000A374 389D002C */ addi r4, r29, 0x2c
/* 0000A378 38A10010 */ addi r5, r1, 0x10
/* 0000A37C EC010032 */ fmuls f0, f1, f0
/* 0000A380 D0010040 */ stfs f0, 0x40(r1)
/* 0000A384 C03F0040 */ lfs f1, 0x40(r31)
/* 0000A388 C01D0060 */ lfs f0, 0x60(r29)
/* 0000A38C EC010032 */ fmuls f0, f1, f0
/* 0000A390 D0010054 */ stfs f0, 0x54(r1)
/* 0000A394 4BFF5DC9 */ bl PSMTXConcat
/* 0000A398 38610010 */ addi r3, r1, 0x10
/* 0000A39C 389B0000 */ addi r4, r27, 0
/* 0000A3A0 38A30000 */ addi r5, r3, 0
/* 0000A3A4 4BFF5DB9 */ bl PSMTXConcat
/* 0000A3A8 389C0000 */ addi r4, r28, 0
/* 0000A3AC 38610010 */ addi r3, r1, 0x10
/* 0000A3B0 38A00000 */ li r5, 0
/* 0000A3B4 4BFF5DA9 */ bl GXLoadTexMtxImm
/* 0000A3B8 C03F003C */ lfs f1, 0x3c(r31)
/* 0000A3BC 38610070 */ addi r3, r1, 0x70
/* 0000A3C0 C01D0028 */ lfs f0, 0x28(r29)
/* 0000A3C4 389D002C */ addi r4, r29, 0x2c
/* 0000A3C8 38A10010 */ addi r5, r1, 0x10
/* 0000A3CC EC010024 */ fdivs f0, f1, f0
/* 0000A3D0 3B9C0003 */ addi r28, r28, 3
/* 0000A3D4 D0010078 */ stfs f0, 0x78(r1)
/* 0000A3D8 C05F003C */ lfs f2, 0x3c(r31)
/* 0000A3DC C03D0024 */ lfs f1, 0x24(r29)
/* 0000A3E0 C01D0028 */ lfs f0, 0x28(r29)
/* 0000A3E4 EC220072 */ fmuls f1, f2, f1
/* 0000A3E8 C05F0040 */ lfs f2, 0x40(r31)
/* 0000A3EC EC010024 */ fdivs f0, f1, f0
/* 0000A3F0 EC02002A */ fadds f0, f2, f0
/* 0000A3F4 D001007C */ stfs f0, 0x7c(r1)
/* 0000A3F8 4BFF5D65 */ bl PSMTXConcat
/* 0000A3FC 38610010 */ addi r3, r1, 0x10
/* 0000A400 389B0000 */ addi r4, r27, 0
/* 0000A404 38A30000 */ addi r5, r3, 0
/* 0000A408 4BFF5D55 */ bl PSMTXConcat
/* 0000A40C 389C0000 */ addi r4, r28, 0
/* 0000A410 38610010 */ addi r3, r1, 0x10
/* 0000A414 38A00000 */ li r5, 0
/* 0000A418 4BFF5D45 */ bl GXLoadTexMtxImm
/* 0000A41C 37DEFFFF */ addic. r30, r30, -1  ;# fixed addi
/* 0000A420 3B9C0003 */ addi r28, r28, 3
/* 0000A424 3BBD009C */ addi r29, r29, 0x9c
/* 0000A428 4181FF40 */ bgt lbl_0000A368
/* 0000A42C BB6100A4 */ lmw r27, 0xa4(r1)
/* 0000A430 800100BC */ lwz r0, 0xbc(r1)
/* 0000A434 382100B8 */ addi r1, r1, 0xb8
/* 0000A438 7C0803A6 */ mtlr r0
/* 0000A43C 4E800020 */ blr 
lbl_0000A440:
/* 0000A440 7C0802A6 */ mflr r0
/* 0000A444 3C600000 */ lis r3, lbl_10000E00@ha
/* 0000A448 90010004 */ stw r0, 4(r1)
/* 0000A44C 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000A450 93E1002C */ stw r31, 0x2c(r1)
/* 0000A454 93C10028 */ stw r30, 0x28(r1)
/* 0000A458 3BC30000 */ addi r30, r3, lbl_10000E00@l
/* 0000A45C 3C600000 */ lis r3, lbl_00010080@ha
/* 0000A460 93A10024 */ stw r29, 0x24(r1)
/* 0000A464 3BE30000 */ addi r31, r3, lbl_00010080@l
/* 0000A468 93810020 */ stw r28, 0x20(r1)
/* 0000A46C 801E0158 */ lwz r0, 0x158(r30)
/* 0000A470 28000000 */ cmplwi r0, 0
/* 0000A474 408202D4 */ bne lbl_0000A748
/* 0000A478 38600020 */ li r3, 0x20
/* 0000A47C 38800004 */ li r4, 4
/* 0000A480 38A00001 */ li r5, 1
/* 0000A484 38C00000 */ li r6, 0
/* 0000A488 38E00000 */ li r7, 0
/* 0000A48C 4BFF5CD1 */ bl GXGetTexBufferSize
/* 0000A490 3C800000 */ lis r4, __OSCurrHeap@ha
/* 0000A494 3BA30000 */ addi r29, r3, 0
/* 0000A498 80640000 */ lwz r3, __OSCurrHeap@l(r4)
/* 0000A49C 7FA4EB78 */ mr r4, r29
/* 0000A4A0 4BFF5CBD */ bl OSAllocFromHeap
/* 0000A4A4 907E0158 */ stw r3, 0x158(r30)
/* 0000A4A8 38800000 */ li r4, 0
/* 0000A4AC 38A00020 */ li r5, 0x20
/* 0000A4B0 839E0158 */ lwz r28, 0x158(r30)
/* 0000A4B4 7F83E378 */ mr r3, r28
/* 0000A4B8 4BFF5CA5 */ bl memset
/* 0000A4BC 387C0020 */ addi r3, r28, 0x20
/* 0000A4C0 38800000 */ li r4, 0
/* 0000A4C4 38A00020 */ li r5, 0x20
/* 0000A4C8 4BFF5C95 */ bl memset
/* 0000A4CC 38E00004 */ li r7, 4
/* 0000A4D0 3C604330 */ lis r3, 0x4330
/* 0000A4D4 3B9C0040 */ addi r28, r28, 0x40
lbl_0000A4D8:
/* 0000A4D8 38000002 */ li r0, 2
/* 0000A4DC 7C0903A6 */ mtctr r0
/* 0000A4E0 38C00008 */ li r6, 8
lbl_0000A4E4:
/* 0000A4E4 6CC48000 */ xoris r4, r6, 0x8000
/* 0000A4E8 C05F0050 */ lfs f2, 0x50(r31)
/* 0000A4EC 9081001C */ stw r4, 0x1c(r1)
/* 0000A4F0 3CA00000 */ lis r5, lbl_000100D8@ha
/* 0000A4F4 C8050000 */ lfd f0, lbl_000100D8@l(r5)
/* 0000A4F8 38C6FFFF */ addi r6, r6, -1  ;# fixed addi
/* 0000A4FC 90610018 */ stw r3, 0x18(r1)
/* 0000A500 6CC48000 */ xoris r4, r6, 0x8000
/* 0000A504 C07F0040 */ lfs f3, 0x40(r31)
/* 0000A508 C8210018 */ lfd f1, 0x18(r1)
/* 0000A50C 3CA00000 */ lis r5, lbl_000100D8@ha
/* 0000A510 C09F004C */ lfs f4, 0x4c(r31)
/* 0000A514 38C6FFFF */ addi r6, r6, -1  ;# fixed addi
/* 0000A518 EC010028 */ fsubs f0, f1, f0
/* 0000A51C 9081001C */ stw r4, 0x1c(r1)
/* 0000A520 6CC48000 */ xoris r4, r6, 0x8000
/* 0000A524 38C6FFFF */ addi r6, r6, -1  ;# fixed addi
/* 0000A528 EC020032 */ fmuls f0, f2, f0
/* 0000A52C 90610018 */ stw r3, 0x18(r1)
/* 0000A530 EC03002A */ fadds f0, f3, f0
/* 0000A534 C8210018 */ lfd f1, 0x18(r1)
/* 0000A538 9081001C */ stw r4, 0x1c(r1)
/* 0000A53C 6CC48000 */ xoris r4, r6, 0x8000
/* 0000A540 EC040032 */ fmuls f0, f4, f0
/* 0000A544 90610018 */ stw r3, 0x18(r1)
/* 0000A548 38C6FFFF */ addi r6, r6, -1  ;# fixed addi
/* 0000A54C FC00001E */ fctiwz f0, f0
/* 0000A550 D8010010 */ stfd f0, 0x10(r1)
/* 0000A554 80010014 */ lwz r0, 0x14(r1)
/* 0000A558 981C0000 */ stb r0, 0(r28)
/* 0000A55C C8050000 */ lfd f0, lbl_000100D8@l(r5)
/* 0000A560 3CA00000 */ lis r5, lbl_000100D8@ha
/* 0000A564 C05F0050 */ lfs f2, 0x50(r31)
/* 0000A568 EC010028 */ fsubs f0, f1, f0
/* 0000A56C C8210018 */ lfd f1, 0x18(r1)
/* 0000A570 C07F0040 */ lfs f3, 0x40(r31)
/* 0000A574 9081001C */ stw r4, 0x1c(r1)
/* 0000A578 EC020032 */ fmuls f0, f2, f0
/* 0000A57C C09F004C */ lfs f4, 0x4c(r31)
/* 0000A580 90610018 */ stw r3, 0x18(r1)
/* 0000A584 EC03002A */ fadds f0, f3, f0
/* 0000A588 EC040032 */ fmuls f0, f4, f0
/* 0000A58C FC00001E */ fctiwz f0, f0
/* 0000A590 D8010010 */ stfd f0, 0x10(r1)
/* 0000A594 80010014 */ lwz r0, 0x14(r1)
/* 0000A598 981C0001 */ stb r0, 1(r28)
/* 0000A59C C8050000 */ lfd f0, lbl_000100D8@l(r5)
/* 0000A5A0 3CA00000 */ lis r5, lbl_000100D8@ha
/* 0000A5A4 C05F0050 */ lfs f2, 0x50(r31)
/* 0000A5A8 EC010028 */ fsubs f0, f1, f0
/* 0000A5AC C07F0040 */ lfs f3, 0x40(r31)
/* 0000A5B0 C09F004C */ lfs f4, 0x4c(r31)
/* 0000A5B4 C8210018 */ lfd f1, 0x18(r1)
/* 0000A5B8 EC020032 */ fmuls f0, f2, f0
/* 0000A5BC EC03002A */ fadds f0, f3, f0
/* 0000A5C0 EC040032 */ fmuls f0, f4, f0
/* 0000A5C4 FC00001E */ fctiwz f0, f0
/* 0000A5C8 D8010010 */ stfd f0, 0x10(r1)
/* 0000A5CC 80010014 */ lwz r0, 0x14(r1)
/* 0000A5D0 981C0002 */ stb r0, 2(r28)
/* 0000A5D4 C8050000 */ lfd f0, lbl_000100D8@l(r5)
/* 0000A5D8 C05F0050 */ lfs f2, 0x50(r31)
/* 0000A5DC EC010028 */ fsubs f0, f1, f0
/* 0000A5E0 C07F0040 */ lfs f3, 0x40(r31)
/* 0000A5E4 C09F004C */ lfs f4, 0x4c(r31)
/* 0000A5E8 EC020032 */ fmuls f0, f2, f0
/* 0000A5EC EC03002A */ fadds f0, f3, f0
/* 0000A5F0 EC040032 */ fmuls f0, f4, f0
/* 0000A5F4 FC00001E */ fctiwz f0, f0
/* 0000A5F8 D8010010 */ stfd f0, 0x10(r1)
/* 0000A5FC 80010014 */ lwz r0, 0x14(r1)
/* 0000A600 981C0003 */ stb r0, 3(r28)
/* 0000A604 3B9C0004 */ addi r28, r28, 4
/* 0000A608 4200FEDC */ bdnz lbl_0000A4E4
/* 0000A60C 34E7FFFF */ addic. r7, r7, -1  ;# fixed addi
/* 0000A610 4181FEC8 */ bgt lbl_0000A4D8
/* 0000A614 38C00004 */ li r6, 4
/* 0000A618 3C604330 */ lis r3, 0x4330
lbl_0000A61C:
/* 0000A61C 38000002 */ li r0, 2
/* 0000A620 7C0903A6 */ mtctr r0
/* 0000A624 38E00008 */ li r7, 8
lbl_0000A628:
/* 0000A628 3807FFFF */ addi r0, r7, -1  ;# fixed addi
/* 0000A62C C05F0054 */ lfs f2, 0x54(r31)
/* 0000A630 6C048000 */ xoris r4, r0, 0x8000
/* 0000A634 C07F004C */ lfs f3, 0x4c(r31)
/* 0000A638 90810014 */ stw r4, 0x14(r1)
/* 0000A63C 3CA00000 */ lis r5, lbl_000100D8@ha
/* 0000A640 C8050000 */ lfd f0, lbl_000100D8@l(r5)
/* 0000A644 3807FFFE */ addi r0, r7, -2  ;# fixed addi
/* 0000A648 90610010 */ stw r3, 0x10(r1)
/* 0000A64C 6C048000 */ xoris r4, r0, 0x8000
/* 0000A650 C8210010 */ lfd f1, 0x10(r1)
/* 0000A654 3807FFFD */ addi r0, r7, -3  ;# fixed addi
/* 0000A658 3CA00000 */ lis r5, lbl_000100D8@ha
/* 0000A65C EC010028 */ fsubs f0, f1, f0
/* 0000A660 90810014 */ stw r4, 0x14(r1)
/* 0000A664 6C048000 */ xoris r4, r0, 0x8000
/* 0000A668 90610010 */ stw r3, 0x10(r1)
/* 0000A66C 3807FFFC */ addi r0, r7, -4  ;# fixed addi
/* 0000A670 EC020032 */ fmuls f0, f2, f0
/* 0000A674 C8210010 */ lfd f1, 0x10(r1)
/* 0000A678 38E7FFFC */ addi r7, r7, -4  ;# fixed addi
/* 0000A67C 90810014 */ stw r4, 0x14(r1)
/* 0000A680 6C048000 */ xoris r4, r0, 0x8000
/* 0000A684 EC030032 */ fmuls f0, f3, f0
/* 0000A688 90610010 */ stw r3, 0x10(r1)
/* 0000A68C FC00001E */ fctiwz f0, f0
/* 0000A690 D8010018 */ stfd f0, 0x18(r1)
/* 0000A694 8001001C */ lwz r0, 0x1c(r1)
/* 0000A698 981C0000 */ stb r0, 0(r28)
/* 0000A69C C8050000 */ lfd f0, lbl_000100D8@l(r5)
/* 0000A6A0 3CA00000 */ lis r5, lbl_000100D8@ha
/* 0000A6A4 C05F0054 */ lfs f2, 0x54(r31)
/* 0000A6A8 EC010028 */ fsubs f0, f1, f0
/* 0000A6AC C8210010 */ lfd f1, 0x10(r1)
/* 0000A6B0 C07F004C */ lfs f3, 0x4c(r31)
/* 0000A6B4 90810014 */ stw r4, 0x14(r1)
/* 0000A6B8 EC020032 */ fmuls f0, f2, f0
/* 0000A6BC 90610010 */ stw r3, 0x10(r1)
/* 0000A6C0 EC030032 */ fmuls f0, f3, f0
/* 0000A6C4 FC00001E */ fctiwz f0, f0
/* 0000A6C8 D8010018 */ stfd f0, 0x18(r1)
/* 0000A6CC 8001001C */ lwz r0, 0x1c(r1)
/* 0000A6D0 981C0001 */ stb r0, 1(r28)
/* 0000A6D4 C8050000 */ lfd f0, lbl_000100D8@l(r5)
/* 0000A6D8 3CA00000 */ lis r5, lbl_000100D8@ha
/* 0000A6DC C05F0054 */ lfs f2, 0x54(r31)
/* 0000A6E0 EC010028 */ fsubs f0, f1, f0
/* 0000A6E4 C07F004C */ lfs f3, 0x4c(r31)
/* 0000A6E8 C8210010 */ lfd f1, 0x10(r1)
/* 0000A6EC EC020032 */ fmuls f0, f2, f0
/* 0000A6F0 EC030032 */ fmuls f0, f3, f0
/* 0000A6F4 FC00001E */ fctiwz f0, f0
/* 0000A6F8 D8010018 */ stfd f0, 0x18(r1)
/* 0000A6FC 8001001C */ lwz r0, 0x1c(r1)
/* 0000A700 981C0002 */ stb r0, 2(r28)
/* 0000A704 C8050000 */ lfd f0, lbl_000100D8@l(r5)
/* 0000A708 C05F0054 */ lfs f2, 0x54(r31)
/* 0000A70C EC010028 */ fsubs f0, f1, f0
/* 0000A710 C07F004C */ lfs f3, 0x4c(r31)
/* 0000A714 EC020032 */ fmuls f0, f2, f0
/* 0000A718 EC030032 */ fmuls f0, f3, f0
/* 0000A71C FC00001E */ fctiwz f0, f0
/* 0000A720 D8010018 */ stfd f0, 0x18(r1)
/* 0000A724 8001001C */ lwz r0, 0x1c(r1)
/* 0000A728 981C0003 */ stb r0, 3(r28)
/* 0000A72C 3B9C0004 */ addi r28, r28, 4
/* 0000A730 4200FEF8 */ bdnz lbl_0000A628
/* 0000A734 34C6FFFF */ addic. r6, r6, -1  ;# fixed addi
/* 0000A738 4181FEE4 */ bgt lbl_0000A61C
/* 0000A73C 807E0158 */ lwz r3, 0x158(r30)
/* 0000A740 7FA4EB78 */ mr r4, r29
/* 0000A744 4BFF5A19 */ bl DCFlushRange
lbl_0000A748:
/* 0000A748 809E0158 */ lwz r4, 0x158(r30)
/* 0000A74C 387E0138 */ addi r3, r30, 0x138
/* 0000A750 38A00020 */ li r5, 0x20
/* 0000A754 38C00004 */ li r6, 4
/* 0000A758 38E00001 */ li r7, 1
/* 0000A75C 39000000 */ li r8, 0
/* 0000A760 39200000 */ li r9, 0
/* 0000A764 39400000 */ li r10, 0
/* 0000A768 4BFF59F5 */ bl GXInitTexObj
/* 0000A76C 80010034 */ lwz r0, 0x34(r1)
/* 0000A770 83E1002C */ lwz r31, 0x2c(r1)
/* 0000A774 83C10028 */ lwz r30, 0x28(r1)
/* 0000A778 7C0803A6 */ mtlr r0
/* 0000A77C 83A10024 */ lwz r29, 0x24(r1)
/* 0000A780 83810020 */ lwz r28, 0x20(r1)
/* 0000A784 38210030 */ addi r1, r1, 0x30
/* 0000A788 4E800020 */ blr 
lbl_0000A78C:
/* 0000A78C 7C0802A6 */ mflr r0
/* 0000A790 3C600000 */ lis r3, lbl_10000F58@ha
/* 0000A794 90010004 */ stw r0, 4(r1)
/* 0000A798 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000A79C 93E1000C */ stw r31, 0xc(r1)
/* 0000A7A0 3BE30000 */ addi r31, r3, lbl_10000F58@l
/* 0000A7A4 809F0000 */ lwz r4, 0(r31)
/* 0000A7A8 28040000 */ cmplwi r4, 0
/* 0000A7AC 4182001C */ beq lbl_0000A7C8
/* 0000A7B0 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000A7B4 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000A7B8 80630000 */ lwz r3, 0(r3)
/* 0000A7BC 4BFF59A1 */ bl OSFreeToHeap
/* 0000A7C0 38000000 */ li r0, 0
/* 0000A7C4 901F0000 */ stw r0, 0(r31)
lbl_0000A7C8:
/* 0000A7C8 80010014 */ lwz r0, 0x14(r1)
/* 0000A7CC 83E1000C */ lwz r31, 0xc(r1)
/* 0000A7D0 38210010 */ addi r1, r1, 0x10
/* 0000A7D4 7C0803A6 */ mtlr r0
/* 0000A7D8 4E800020 */ blr 
lbl_0000A7DC:
/* 0000A7DC 4E800020 */ blr 
lbl_0000A7E0:
/* 0000A7E0 4E800020 */ blr 
lbl_0000A7E4:
/* 0000A7E4 3C600000 */ lis r3, lbl_10000F5C@ha
/* 0000A7E8 38830000 */ addi r4, r3, lbl_10000F5C@l
/* 0000A7EC 80640000 */ lwz r3, 0(r4)
/* 0000A7F0 38030001 */ addi r0, r3, 1
/* 0000A7F4 90040000 */ stw r0, 0(r4)
/* 0000A7F8 4E800020 */ blr 
lbl_0000A7FC:
/* 0000A7FC 7C0802A6 */ mflr r0
/* 0000A800 3C600000 */ lis r3, lbl_00010080@ha
/* 0000A804 90010004 */ stw r0, 4(r1)
/* 0000A808 9421FF18 */ stwu r1, -0xe8(r1)
/* 0000A80C BF4100D0 */ stmw r26, 0xd0(r1)
/* 0000A810 3BE30000 */ addi r31, r3, lbl_00010080@l
/* 0000A814 3C600000 */ lis r3, lbl_10000E00@ha
/* 0000A818 3BA30000 */ addi r29, r3, lbl_10000E00@l
/* 0000A81C 801F0060 */ lwz r0, 0x60(r31)
/* 0000A820 900100B8 */ stw r0, 0xb8(r1)
/* 0000A824 4BFF5939 */ bl mathutil_mtxA_from_mtxB
/* 0000A828 C03F0064 */ lfs f1, 0x64(r31)
/* 0000A82C 38610078 */ addi r3, r1, 0x78
/* 0000A830 38800000 */ li r4, 0
/* 0000A834 4BFF5929 */ bl GXInitLightSpot
/* 0000A838 C03F0000 */ lfs f1, 0(r31)
/* 0000A83C 38610078 */ addi r3, r1, 0x78
/* 0000A840 38800000 */ li r4, 0
/* 0000A844 FC400890 */ fmr f2, f1
/* 0000A848 4BFF5915 */ bl GXInitLightDistAttn
/* 0000A84C 380000FF */ li r0, 0xff
/* 0000A850 980100B8 */ stb r0, 0xb8(r1)
/* 0000A854 38810014 */ addi r4, r1, 0x14
/* 0000A858 38610078 */ addi r3, r1, 0x78
/* 0000A85C 980100B9 */ stb r0, 0xb9(r1)
/* 0000A860 980100BA */ stb r0, 0xba(r1)
/* 0000A864 980100BB */ stb r0, 0xbb(r1)
/* 0000A868 800100B8 */ lwz r0, 0xb8(r1)
/* 0000A86C 90010014 */ stw r0, 0x14(r1)
/* 0000A870 4BFF58ED */ bl GXInitLightColor
/* 0000A874 3B5D0000 */ addi r26, r29, 0
/* 0000A878 3B600000 */ li r27, 0
lbl_0000A87C:
/* 0000A87C 387A0000 */ addi r3, r26, 0
/* 0000A880 388100BC */ addi r4, r1, 0xbc
/* 0000A884 4BFF58D9 */ bl mathutil_mtxA_tf_point
/* 0000A888 C02100BC */ lfs f1, 0xbc(r1)
/* 0000A88C 38610078 */ addi r3, r1, 0x78
/* 0000A890 C04100C0 */ lfs f2, 0xc0(r1)
/* 0000A894 C06100C4 */ lfs f3, 0xc4(r1)
/* 0000A898 4BFF58C5 */ bl GXInitLightPos
/* 0000A89C 38610078 */ addi r3, r1, 0x78
/* 0000A8A0 389B0001 */ addi r4, r27, 1
/* 0000A8A4 4BFF58B9 */ bl GXLoadLightObjImm
/* 0000A8A8 3B7B0001 */ addi r27, r27, 1
/* 0000A8AC 2C1B0002 */ cmpwi r27, 2
/* 0000A8B0 3B5A009C */ addi r26, r26, 0x9c
/* 0000A8B4 4180FFC8 */ blt lbl_0000A87C
/* 0000A8B8 3B8000FF */ li r28, 0xff
/* 0000A8BC 9B8100B8 */ stb r28, 0xb8(r1)
/* 0000A8C0 38810010 */ addi r4, r1, 0x10
/* 0000A8C4 38600004 */ li r3, 4
/* 0000A8C8 9B8100B9 */ stb r28, 0xb9(r1)
/* 0000A8CC 9B8100BA */ stb r28, 0xba(r1)
/* 0000A8D0 9B8100BB */ stb r28, 0xbb(r1)
/* 0000A8D4 800100B8 */ lwz r0, 0xb8(r1)
/* 0000A8D8 90010010 */ stw r0, 0x10(r1)
/* 0000A8DC 4BFF5881 */ bl GXSetChanMatColor
/* 0000A8E0 38600020 */ li r3, 0x20
/* 0000A8E4 986100B8 */ stb r3, 0xb8(r1)
/* 0000A8E8 38000040 */ li r0, 0x40
/* 0000A8EC 3881000C */ addi r4, r1, 0xc
/* 0000A8F0 986100B9 */ stb r3, 0xb9(r1)
/* 0000A8F4 38600004 */ li r3, 4
/* 0000A8F8 980100BA */ stb r0, 0xba(r1)
/* 0000A8FC 9B8100BB */ stb r28, 0xbb(r1)
/* 0000A900 800100B8 */ lwz r0, 0xb8(r1)
/* 0000A904 9001000C */ stw r0, 0xc(r1)
/* 0000A908 4BFF5855 */ bl GXSetChanAmbColor
/* 0000A90C 800100B8 */ lwz r0, 0xb8(r1)
/* 0000A910 38810008 */ addi r4, r1, 8
/* 0000A914 38600001 */ li r3, 1
/* 0000A918 90010008 */ stw r0, 8(r1)
/* 0000A91C 4BFF5841 */ bl GXSetTevColor
/* 0000A920 38600004 */ li r3, 4
/* 0000A924 38800001 */ li r4, 1
/* 0000A928 38A00000 */ li r5, 0
/* 0000A92C 38C00000 */ li r6, 0
/* 0000A930 38E00001 */ li r7, 1
/* 0000A934 39000002 */ li r8, 2
/* 0000A938 39200001 */ li r9, 1
/* 0000A93C 4BFF5821 */ bl GXSetChanCtrl
/* 0000A940 38600001 */ li r3, 1
/* 0000A944 4BFF5819 */ bl GXSetNumChans
/* 0000A948 4BFF5815 */ bl GXInvalidateTexAll
/* 0000A94C 387D0138 */ addi r3, r29, 0x138
/* 0000A950 38800000 */ li r4, 0
/* 0000A954 4BFF5809 */ bl func_8009F430
/* 0000A958 3B400001 */ li r26, 1
/* 0000A95C 3B600002 */ li r27, 2
lbl_0000A960:
/* 0000A960 387D0070 */ addi r3, r29, 0x70
/* 0000A964 389A0000 */ addi r4, r26, 0
/* 0000A968 4BFF57F5 */ bl func_8009F430
/* 0000A96C 377BFFFF */ addic. r27, r27, -1  ;# fixed addi
/* 0000A970 3BBD009C */ addi r29, r29, 0x9c
/* 0000A974 3B5A0001 */ addi r26, r26, 1
/* 0000A978 4181FFE8 */ bgt lbl_0000A960
/* 0000A97C 3B400000 */ li r26, 0
/* 0000A980 3B800000 */ li r28, 0
/* 0000A984 3BA0001E */ li r29, 0x1e
/* 0000A988 3BC0000A */ li r30, 0xa
/* 0000A98C 3B600002 */ li r27, 2
lbl_0000A990:
/* 0000A990 387C0000 */ addi r3, r28, 0
/* 0000A994 38DD0000 */ addi r6, r29, 0
/* 0000A998 38800000 */ li r4, 0
/* 0000A99C 38A00000 */ li r5, 0
/* 0000A9A0 38E00000 */ li r7, 0
/* 0000A9A4 3900007D */ li r8, 0x7d
/* 0000A9A8 4BFF57B5 */ bl GXSetTexCoordGen2
/* 0000A9AC 387A0000 */ addi r3, r26, 0
/* 0000A9B0 389C0000 */ addi r4, r28, 0
/* 0000A9B4 38A00001 */ li r5, 1
/* 0000A9B8 38C00004 */ li r6, 4
/* 0000A9BC 4BFF57A1 */ bl func_8009EFF4
/* 0000A9C0 7F43D378 */ mr r3, r26
/* 0000A9C4 4BFF5799 */ bl GXSetTevDirect
/* 0000A9C8 387A0000 */ addi r3, r26, 0
/* 0000A9CC 38800004 */ li r4, 4
/* 0000A9D0 4BFF578D */ bl func_8009EA30
/* 0000A9D4 387A0000 */ addi r3, r26, 0
/* 0000A9D8 3880000F */ li r4, 0xf
/* 0000A9DC 38A0000F */ li r5, 0xf
/* 0000A9E0 38C0000F */ li r6, 0xf
/* 0000A9E4 38E00008 */ li r7, 8
/* 0000A9E8 4BFF5775 */ bl func_8009E618
/* 0000A9EC 387A0000 */ addi r3, r26, 0
/* 0000A9F0 38800000 */ li r4, 0
/* 0000A9F4 38A00000 */ li r5, 0
/* 0000A9F8 38C00000 */ li r6, 0
/* 0000A9FC 38E00001 */ li r7, 1
/* 0000AA00 39000000 */ li r8, 0
/* 0000AA04 4BFF5759 */ bl func_8009E800
/* 0000AA08 3BBD0003 */ addi r29, r29, 3
/* 0000AA0C 38DD0000 */ addi r6, r29, 0
/* 0000AA10 387C0001 */ addi r3, r28, 1
/* 0000AA14 38800000 */ li r4, 0
/* 0000AA18 38A00000 */ li r5, 0
/* 0000AA1C 38E00000 */ li r7, 0
/* 0000AA20 3900007D */ li r8, 0x7d
/* 0000AA24 4BFF5739 */ bl GXSetTexCoordGen2
/* 0000AA28 387A0001 */ addi r3, r26, 1
/* 0000AA2C 389C0001 */ addi r4, r28, 1
/* 0000AA30 38A00000 */ li r5, 0
/* 0000AA34 38C00004 */ li r6, 4
/* 0000AA38 4BFF5725 */ bl func_8009EFF4
/* 0000AA3C 387A0001 */ addi r3, r26, 1
/* 0000AA40 4BFF571D */ bl GXSetTevDirect
/* 0000AA44 387A0001 */ addi r3, r26, 1
/* 0000AA48 38800004 */ li r4, 4
/* 0000AA4C 4BFF5711 */ bl func_8009EA30
/* 0000AA50 387A0001 */ addi r3, r26, 1
/* 0000AA54 3880000F */ li r4, 0xf
/* 0000AA58 38A00008 */ li r5, 8
/* 0000AA5C 38C00000 */ li r6, 0
/* 0000AA60 38E0000F */ li r7, 0xf
/* 0000AA64 4BFF56F9 */ bl func_8009E618
/* 0000AA68 387A0001 */ addi r3, r26, 1
/* 0000AA6C 38800000 */ li r4, 0
/* 0000AA70 38A00000 */ li r5, 0
/* 0000AA74 38C00000 */ li r6, 0
/* 0000AA78 38E00001 */ li r7, 1
/* 0000AA7C 39000000 */ li r8, 0
/* 0000AA80 4BFF56DD */ bl func_8009E800
/* 0000AA84 387A0002 */ addi r3, r26, 2
/* 0000AA88 388000FF */ li r4, 0xff
/* 0000AA8C 38A000FF */ li r5, 0xff
/* 0000AA90 38C00004 */ li r6, 4
/* 0000AA94 3B9C0002 */ addi r28, r28, 2
/* 0000AA98 3BBD0003 */ addi r29, r29, 3
/* 0000AA9C 4BFF56C1 */ bl func_8009EFF4
/* 0000AAA0 387A0002 */ addi r3, r26, 2
/* 0000AAA4 4BFF56B9 */ bl GXSetTevDirect
/* 0000AAA8 387A0002 */ addi r3, r26, 2
/* 0000AAAC 38800004 */ li r4, 4
/* 0000AAB0 4BFF56AD */ bl func_8009EA30
/* 0000AAB4 389E0000 */ addi r4, r30, 0
/* 0000AAB8 387A0002 */ addi r3, r26, 2
/* 0000AABC 38A00002 */ li r5, 2
/* 0000AAC0 38C00000 */ li r6, 0
/* 0000AAC4 38E0000F */ li r7, 0xf
/* 0000AAC8 4BFF5695 */ bl func_8009E618
/* 0000AACC 2C1B0001 */ cmpwi r27, 1
/* 0000AAD0 40820024 */ bne lbl_0000AAF4
/* 0000AAD4 387A0002 */ addi r3, r26, 2
/* 0000AAD8 38800000 */ li r4, 0
/* 0000AADC 38A00000 */ li r5, 0
/* 0000AAE0 38C00000 */ li r6, 0
/* 0000AAE4 38E00001 */ li r7, 1
/* 0000AAE8 39000000 */ li r8, 0
/* 0000AAEC 4BFF5671 */ bl func_8009E800
/* 0000AAF0 48000024 */ b lbl_0000AB14
lbl_0000AAF4:
/* 0000AAF4 387A0002 */ addi r3, r26, 2
/* 0000AAF8 38800000 */ li r4, 0
/* 0000AAFC 38A00000 */ li r5, 0
/* 0000AB00 38C00000 */ li r6, 0
/* 0000AB04 38E00001 */ li r7, 1
/* 0000AB08 39000002 */ li r8, 2
/* 0000AB0C 4BFF5651 */ bl func_8009E800
/* 0000AB10 3BC00004 */ li r30, 4
lbl_0000AB14:
/* 0000AB14 377BFFFF */ addic. r27, r27, -1  ;# fixed addi
/* 0000AB18 3B5A0003 */ addi r26, r26, 3
/* 0000AB1C 4181FE74 */ bgt lbl_0000A990
/* 0000AB20 5743063E */ clrlwi r3, r26, 0x18
/* 0000AB24 4BFF5639 */ bl func_8009F2C8
/* 0000AB28 5783063E */ clrlwi r3, r28, 0x18
/* 0000AB2C 4BFF5631 */ bl GXSetNumTexGens
/* 0000AB30 38600000 */ li r3, 0
/* 0000AB34 4BFF5629 */ bl GXSetNumIndStages
/* 0000AB38 38600001 */ li r3, 1
/* 0000AB3C 38800001 */ li r4, 1
/* 0000AB40 38A00000 */ li r5, 0
/* 0000AB44 38C00000 */ li r6, 0
/* 0000AB48 4BFF5615 */ bl func_8009E110
/* 0000AB4C 3C600000 */ lis r3, zMode@ha
/* 0000AB50 38630000 */ addi r3, r3, zMode@l
/* 0000AB54 80630000 */ lwz r3, 0(r3)
/* 0000AB58 88030008 */ lbz r0, 8(r3)
/* 0000AB5C 28000001 */ cmplwi r0, 1
/* 0000AB60 4082001C */ bne lbl_0000AB7C
/* 0000AB64 80030004 */ lwz r0, 4(r3)
/* 0000AB68 2C000001 */ cmpwi r0, 1
/* 0000AB6C 40820010 */ bne lbl_0000AB7C
/* 0000AB70 88030000 */ lbz r0, 0(r3)
/* 0000AB74 28000001 */ cmplwi r0, 1
/* 0000AB78 41820038 */ beq lbl_0000ABB0
lbl_0000AB7C:
/* 0000AB7C 38600001 */ li r3, 1
/* 0000AB80 38800001 */ li r4, 1
/* 0000AB84 38A00001 */ li r5, 1
/* 0000AB88 4BFF55D5 */ bl GXSetZMode
/* 0000AB8C 3C600000 */ lis r3, zMode@ha
/* 0000AB90 38830000 */ addi r4, r3, zMode@l
/* 0000AB94 80640000 */ lwz r3, 0(r4)
/* 0000AB98 38000001 */ li r0, 1
/* 0000AB9C 98030000 */ stb r0, 0(r3)
/* 0000ABA0 80640000 */ lwz r3, 0(r4)
/* 0000ABA4 90030004 */ stw r0, 4(r3)
/* 0000ABA8 80640000 */ lwz r3, 0(r4)
/* 0000ABAC 98030008 */ stb r0, 8(r3)
lbl_0000ABB0:
/* 0000ABB0 4BFF55AD */ bl func_8009AC8C
/* 0000ABB4 3C600000 */ lis r3, mathutilData@ha
/* 0000ABB8 3BC30000 */ addi r30, r3, mathutilData@l
/* 0000ABBC 3B600014 */ li r27, 0x14
/* 0000ABC0 3FA04330 */ lis r29, 0x4330
lbl_0000ABC4:
/* 0000ABC4 576007BE */ clrlwi r0, r27, 0x1e
/* 0000ABC8 7C000034 */ cntlzw r0, r0
/* 0000ABCC 541CD97E */ srwi r28, r0, 5
/* 0000ABD0 4BFF558D */ bl mathutil_mtxA_from_identity
/* 0000ABD4 381BFFFF */ addi r0, r27, -1  ;# fixed addi
/* 0000ABD8 C09F0004 */ lfs f4, 4(r31)
/* 0000ABDC 6C008000 */ xoris r0, r0, 0x8000
/* 0000ABE0 C03F0068 */ lfs f1, 0x68(r31)
/* 0000ABE4 900100CC */ stw r0, 0xcc(r1)
/* 0000ABE8 3C600000 */ lis r3, lbl_000100D8@ha
/* 0000ABEC C8630000 */ lfd f3, lbl_000100D8@l(r3)
/* 0000ABF0 93A100C8 */ stw r29, 0xc8(r1)
/* 0000ABF4 C05F006C */ lfs f2, 0x6c(r31)
/* 0000ABF8 C80100C8 */ lfd f0, 0xc8(r1)
/* 0000ABFC EC001828 */ fsubs f0, f0, f3
/* 0000AC00 EC040032 */ fmuls f0, f4, f0
/* 0000AC04 EC61002A */ fadds f3, f1, f0
/* 0000AC08 4BFF5555 */ bl mathutil_mtxA_translate_xyz
/* 0000AC0C 3B400014 */ li r26, 0x14
lbl_0000AC10:
/* 0000AC10 C03F0070 */ lfs f1, 0x70(r31)
/* 0000AC14 38610048 */ addi r3, r1, 0x48
/* 0000AC18 FC400890 */ fmr f2, f1
/* 0000AC1C FC600890 */ fmr f3, f1
/* 0000AC20 4BFF553D */ bl C_MTXScale
/* 0000AC24 807E0000 */ lwz r3, 0(r30)
/* 0000AC28 38810048 */ addi r4, r1, 0x48
/* 0000AC2C 38A10018 */ addi r5, r1, 0x18
/* 0000AC30 4BFF552D */ bl PSMTXConcat
/* 0000AC34 38610018 */ addi r3, r1, 0x18
/* 0000AC38 3880001E */ li r4, 0x1e
/* 0000AC3C 4BFFF6C9 */ bl lbl_0000A304
/* 0000AC40 807E0000 */ lwz r3, 0(r30)
/* 0000AC44 38810018 */ addi r4, r1, 0x18
/* 0000AC48 38A40000 */ addi r5, r4, 0
/* 0000AC4C 38630030 */ addi r3, r3, 0x30
/* 0000AC50 4BFF550D */ bl PSMTXConcat
/* 0000AC54 38610018 */ addi r3, r1, 0x18
/* 0000AC58 38800000 */ li r4, 0
/* 0000AC5C 4BFF5501 */ bl GXLoadPosMtxImm
/* 0000AC60 38610018 */ addi r3, r1, 0x18
/* 0000AC64 38800000 */ li r4, 0
/* 0000AC68 4BFF54F5 */ bl GXLoadNrmMtxImm
/* 0000AC6C 4BFF54F1 */ bl GXDrawCube
/* 0000AC70 2C1C0000 */ cmpwi r28, 0
/* 0000AC74 41820088 */ beq lbl_0000ACFC
/* 0000AC78 4BFF54E5 */ bl mathutil_mtxA_push
/* 0000AC7C C03F0000 */ lfs f1, 0(r31)
/* 0000AC80 C05F0074 */ lfs f2, 0x74(r31)
/* 0000AC84 FC600890 */ fmr f3, f1
/* 0000AC88 4BFF54D5 */ bl mathutil_mtxA_translate_xyz
/* 0000AC8C 38604000 */ li r3, 0x4000
/* 0000AC90 4BFF54CD */ bl mathutil_mtxA_rotate_x
/* 0000AC94 C03F0078 */ lfs f1, 0x78(r31)
/* 0000AC98 38610048 */ addi r3, r1, 0x48
/* 0000AC9C C07F0074 */ lfs f3, 0x74(r31)
/* 0000ACA0 FC400890 */ fmr f2, f1
/* 0000ACA4 4BFF54B9 */ bl C_MTXScale
/* 0000ACA8 807E0000 */ lwz r3, 0(r30)
/* 0000ACAC 38810048 */ addi r4, r1, 0x48
/* 0000ACB0 38A10018 */ addi r5, r1, 0x18
/* 0000ACB4 4BFF54A9 */ bl PSMTXConcat
/* 0000ACB8 38610018 */ addi r3, r1, 0x18
/* 0000ACBC 3880001E */ li r4, 0x1e
/* 0000ACC0 4BFFF645 */ bl lbl_0000A304
/* 0000ACC4 807E0000 */ lwz r3, 0(r30)
/* 0000ACC8 38810018 */ addi r4, r1, 0x18
/* 0000ACCC 38A40000 */ addi r5, r4, 0
/* 0000ACD0 38630030 */ addi r3, r3, 0x30
/* 0000ACD4 4BFF5489 */ bl PSMTXConcat
/* 0000ACD8 38610018 */ addi r3, r1, 0x18
/* 0000ACDC 38800000 */ li r4, 0
/* 0000ACE0 4BFF547D */ bl GXLoadPosMtxImm
/* 0000ACE4 38610018 */ addi r3, r1, 0x18
/* 0000ACE8 38800000 */ li r4, 0
/* 0000ACEC 4BFF5471 */ bl GXLoadNrmMtxImm
/* 0000ACF0 3860000C */ li r3, 0xc
/* 0000ACF4 4BFF5469 */ bl GXDrawCylinder
/* 0000ACF8 4BFF5465 */ bl mathutil_mtxA_pop
lbl_0000ACFC:
/* 0000ACFC C05F0000 */ lfs f2, 0(r31)
/* 0000AD00 C03F0004 */ lfs f1, 4(r31)
/* 0000AD04 FC601090 */ fmr f3, f2
/* 0000AD08 4BFF5455 */ bl mathutil_mtxA_translate_xyz
/* 0000AD0C 375AFFFF */ addic. r26, r26, -1  ;# fixed addi
/* 0000AD10 4181FF00 */ bgt lbl_0000AC10
/* 0000AD14 377BFFFF */ addic. r27, r27, -1  ;# fixed addi
/* 0000AD18 4181FEAC */ bgt lbl_0000ABC4
/* 0000AD1C BB4100D0 */ lmw r26, 0xd0(r1)
/* 0000AD20 800100EC */ lwz r0, 0xec(r1)
/* 0000AD24 382100E8 */ addi r1, r1, 0xe8
/* 0000AD28 7C0803A6 */ mtlr r0
/* 0000AD2C 4E800020 */ blr 
lbl_0000AD30:
/* 0000AD30 7C0802A6 */ mflr r0
/* 0000AD34 3C600000 */ lis r3, lbl_00010080@ha
/* 0000AD38 90010004 */ stw r0, 4(r1)
/* 0000AD3C 3C800000 */ lis r4, lbl_10000E00@ha
/* 0000AD40 38000001 */ li r0, 1
/* 0000AD44 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000AD48 93E1001C */ stw r31, 0x1c(r1)
/* 0000AD4C 3BE30000 */ addi r31, r3, lbl_00010080@l
/* 0000AD50 93C10018 */ stw r30, 0x18(r1)
/* 0000AD54 3BC40000 */ addi r30, r4, lbl_10000E00@l
/* 0000AD58 93A10014 */ stw r29, 0x14(r1)
/* 0000AD5C 541D801E */ slwi r29, r0, 0x10
/* 0000AD60 93810010 */ stw r28, 0x10(r1)
/* 0000AD64 3B9E0160 */ addi r28, r30, 0x160
/* 0000AD68 C01F0004 */ lfs f0, 4(r31)
/* 0000AD6C D01E0160 */ stfs f0, 0x160(r30)
/* 0000AD70 C01F0004 */ lfs f0, 4(r31)
/* 0000AD74 D01E0164 */ stfs f0, 0x164(r30)
/* 0000AD78 C01F0000 */ lfs f0, 0(r31)
/* 0000AD7C D01E0168 */ stfs f0, 0x168(r30)
/* 0000AD80 4BFF53DD */ bl mathutil_mtxA_from_identity
/* 0000AD84 7FA3EB78 */ mr r3, r29
/* 0000AD88 4BFF53D5 */ bl mathutil_mtxA_rotate_y
/* 0000AD8C 387C0000 */ addi r3, r28, 0
/* 0000AD90 389C0000 */ addi r4, r28, 0
/* 0000AD94 4BFF53C9 */ bl mathutil_mtxA_tf_point
/* 0000AD98 C01F0070 */ lfs f0, 0x70(r31)
/* 0000AD9C 3C800000 */ lis r4, lbl_0000AEB8@ha
/* 0000ADA0 3C600000 */ lis r3, lbl_0000AEDC@ha
/* 0000ADA4 D01C000C */ stfs f0, 0xc(r28)
/* 0000ADA8 38BE0160 */ addi r5, r30, 0x160
/* 0000ADAC 38840000 */ addi r4, r4, lbl_0000AEB8@l
/* 0000ADB0 90BE0064 */ stw r5, 0x64(r30)
/* 0000ADB4 38030000 */ addi r0, r3, lbl_0000AEDC@l
/* 0000ADB8 909E0068 */ stw r4, 0x68(r30)
/* 0000ADBC 901E006C */ stw r0, 0x6c(r30)
/* 0000ADC0 90BE0100 */ stw r5, 0x100(r30)
/* 0000ADC4 909E0104 */ stw r4, 0x104(r30)
/* 0000ADC8 901E0108 */ stw r0, 0x108(r30)
/* 0000ADCC 80010024 */ lwz r0, 0x24(r1)
/* 0000ADD0 83E1001C */ lwz r31, 0x1c(r1)
/* 0000ADD4 83C10018 */ lwz r30, 0x18(r1)
/* 0000ADD8 7C0803A6 */ mtlr r0
/* 0000ADDC 83A10014 */ lwz r29, 0x14(r1)
/* 0000ADE0 83810010 */ lwz r28, 0x10(r1)
/* 0000ADE4 38210020 */ addi r1, r1, 0x20
/* 0000ADE8 4E800020 */ blr 
lbl_0000ADEC:
/* 0000ADEC 4E800020 */ blr 
lbl_0000ADF0:
/* 0000ADF0 3C600000 */ lis r3, controllerInfo@ha
/* 0000ADF4 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 0000ADF8 3CA00000 */ lis r5, lbl_00010080@ha
/* 0000ADFC 3C800000 */ lis r4, lbl_10000F60@ha
/* 0000AE00 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000AE04 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000AE08 38C50000 */ addi r6, r5, lbl_00010080@l
/* 0000AE0C 38A40000 */ addi r5, r4, lbl_10000F60@l
/* 0000AE10 38830000 */ addi r4, r3, currentCameraStructPtr@l
/* 0000AE14 4C820020 */ bnelr 
/* 0000AE18 80640000 */ lwz r3, 0(r4)
/* 0000AE1C C0450000 */ lfs f2, 0(r5)
/* 0000AE20 C003000C */ lfs f0, 0xc(r3)
/* 0000AE24 C026007C */ lfs f1, 0x7c(r6)
/* 0000AE28 EC001028 */ fsubs f0, f0, f2
/* 0000AE2C EC010032 */ fmuls f0, f1, f0
/* 0000AE30 EC02002A */ fadds f0, f2, f0
/* 0000AE34 D0050000 */ stfs f0, 0(r5)
/* 0000AE38 80640000 */ lwz r3, 0(r4)
/* 0000AE3C C0450004 */ lfs f2, 4(r5)
/* 0000AE40 C0030010 */ lfs f0, 0x10(r3)
/* 0000AE44 C026007C */ lfs f1, 0x7c(r6)
/* 0000AE48 EC001028 */ fsubs f0, f0, f2
/* 0000AE4C EC010032 */ fmuls f0, f1, f0
/* 0000AE50 EC02002A */ fadds f0, f2, f0
/* 0000AE54 D0050004 */ stfs f0, 4(r5)
/* 0000AE58 80640000 */ lwz r3, 0(r4)
/* 0000AE5C C0450008 */ lfs f2, 8(r5)
/* 0000AE60 C0030014 */ lfs f0, 0x14(r3)
/* 0000AE64 C026007C */ lfs f1, 0x7c(r6)
/* 0000AE68 EC001028 */ fsubs f0, f0, f2
/* 0000AE6C EC010032 */ fmuls f0, f1, f0
/* 0000AE70 EC02002A */ fadds f0, f2, f0
/* 0000AE74 D0050008 */ stfs f0, 8(r5)
/* 0000AE78 4E800020 */ blr 
lbl_0000AE7C:
/* 0000AE7C 7C0802A6 */ mflr r0
/* 0000AE80 3C600000 */ lis r3, lbl_10000F60@ha
/* 0000AE84 90010004 */ stw r0, 4(r1)
/* 0000AE88 38030000 */ addi r0, r3, lbl_10000F60@l
/* 0000AE8C 38800000 */ li r4, 0
/* 0000AE90 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000AE94 93E1000C */ stw r31, 0xc(r1)
/* 0000AE98 7C1F0378 */ mr r31, r0
/* 0000AE9C 387F0000 */ addi r3, r31, 0
/* 0000AEA0 4800003D */ bl lbl_0000AEDC
/* 0000AEA4 80010014 */ lwz r0, 0x14(r1)
/* 0000AEA8 83E1000C */ lwz r31, 0xc(r1)
/* 0000AEAC 38210010 */ addi r1, r1, 0x10
/* 0000AEB0 7C0803A6 */ mtlr r0
/* 0000AEB4 4E800020 */ blr 
lbl_0000AEB8:
/* 0000AEB8 80C30000 */ lwz r6, 0(r3)
/* 0000AEBC 80030004 */ lwz r0, 4(r3)
/* 0000AEC0 90C40000 */ stw r6, 0(r4)
/* 0000AEC4 90040004 */ stw r0, 4(r4)
/* 0000AEC8 80030008 */ lwz r0, 8(r3)
/* 0000AECC 90040008 */ stw r0, 8(r4)
/* 0000AED0 C003000C */ lfs f0, 0xc(r3)
/* 0000AED4 D0050000 */ stfs f0, 0(r5)
/* 0000AED8 4E800020 */ blr 
lbl_0000AEDC:
/* 0000AEDC 7C0802A6 */ mflr r0
/* 0000AEE0 3CA00000 */ lis r5, lbl_00010080@ha
/* 0000AEE4 90010004 */ stw r0, 4(r1)
/* 0000AEE8 28040000 */ cmplwi r4, 0
/* 0000AEEC 9421FF38 */ stwu r1, -0xc8(r1)
/* 0000AEF0 BF6100B4 */ stmw r27, 0xb4(r1)
/* 0000AEF4 3BE50000 */ addi r31, r5, lbl_00010080@l
/* 0000AEF8 3CA00000 */ lis r5, lbl_10000E00@ha
/* 0000AEFC 3BC50000 */ addi r30, r5, lbl_10000E00@l
/* 0000AF00 3BA30000 */ addi r29, r3, 0
/* 0000AF04 801F0080 */ lwz r0, 0x80(r31)
/* 0000AF08 90010070 */ stw r0, 0x70(r1)
/* 0000AF0C 41820130 */ beq lbl_0000B03C
/* 0000AF10 38600001 */ li r3, 1
/* 0000AF14 4BFF5249 */ bl GXSetNumChans
/* 0000AF18 380000FF */ li r0, 0xff
/* 0000AF1C 98010070 */ stb r0, 0x70(r1)
/* 0000AF20 38810020 */ addi r4, r1, 0x20
/* 0000AF24 38600004 */ li r3, 4
/* 0000AF28 98010071 */ stb r0, 0x71(r1)
/* 0000AF2C 98010072 */ stb r0, 0x72(r1)
/* 0000AF30 98010073 */ stb r0, 0x73(r1)
/* 0000AF34 80010070 */ lwz r0, 0x70(r1)
/* 0000AF38 90010020 */ stw r0, 0x20(r1)
/* 0000AF3C 4BFF5221 */ bl GXSetChanMatColor
/* 0000AF40 38000000 */ li r0, 0
/* 0000AF44 98010070 */ stb r0, 0x70(r1)
/* 0000AF48 3881001C */ addi r4, r1, 0x1c
/* 0000AF4C 38600004 */ li r3, 4
/* 0000AF50 98010071 */ stb r0, 0x71(r1)
/* 0000AF54 98010072 */ stb r0, 0x72(r1)
/* 0000AF58 98010073 */ stb r0, 0x73(r1)
/* 0000AF5C 80010070 */ lwz r0, 0x70(r1)
/* 0000AF60 9001001C */ stw r0, 0x1c(r1)
/* 0000AF64 4BFF51F9 */ bl GXSetChanAmbColor
/* 0000AF68 38600004 */ li r3, 4
/* 0000AF6C 38800000 */ li r4, 0
/* 0000AF70 38A00000 */ li r5, 0
/* 0000AF74 38C00000 */ li r6, 0
/* 0000AF78 38E00001 */ li r7, 1
/* 0000AF7C 39000002 */ li r8, 2
/* 0000AF80 39200001 */ li r9, 1
/* 0000AF84 4BFF51D9 */ bl GXSetChanCtrl
/* 0000AF88 38600000 */ li r3, 0
/* 0000AF8C 388000FF */ li r4, 0xff
/* 0000AF90 38A000FF */ li r5, 0xff
/* 0000AF94 38C00004 */ li r6, 4
/* 0000AF98 4BFF51C5 */ bl func_8009EFF4
/* 0000AF9C 38600000 */ li r3, 0
/* 0000AFA0 38800004 */ li r4, 4
/* 0000AFA4 4BFF51B9 */ bl func_8009EA30
/* 0000AFA8 38600000 */ li r3, 0
/* 0000AFAC 4BFF51B1 */ bl GXSetNumTexGens
/* 0000AFB0 38600001 */ li r3, 1
/* 0000AFB4 4BFF51A9 */ bl func_8009F2C8
/* 0000AFB8 38600001 */ li r3, 1
/* 0000AFBC 38800001 */ li r4, 1
/* 0000AFC0 38A00000 */ li r5, 0
/* 0000AFC4 38C00000 */ li r6, 0
/* 0000AFC8 4BFF5195 */ bl func_8009E110
/* 0000AFCC 3C600000 */ lis r3, zMode@ha
/* 0000AFD0 38630000 */ addi r3, r3, zMode@l
/* 0000AFD4 80630000 */ lwz r3, 0(r3)
/* 0000AFD8 88030008 */ lbz r0, 8(r3)
/* 0000AFDC 28000000 */ cmplwi r0, 0
/* 0000AFE0 4082001C */ bne lbl_0000AFFC
/* 0000AFE4 80030004 */ lwz r0, 4(r3)
/* 0000AFE8 2C000001 */ cmpwi r0, 1
/* 0000AFEC 40820010 */ bne lbl_0000AFFC
/* 0000AFF0 88030000 */ lbz r0, 0(r3)
/* 0000AFF4 28000001 */ cmplwi r0, 1
/* 0000AFF8 4182003C */ beq lbl_0000B034
lbl_0000AFFC:
/* 0000AFFC 38600001 */ li r3, 1
/* 0000B000 38800001 */ li r4, 1
/* 0000B004 38A00000 */ li r5, 0
/* 0000B008 4BFF5155 */ bl GXSetZMode
/* 0000B00C 3C600000 */ lis r3, zMode@ha
/* 0000B010 38830000 */ addi r4, r3, zMode@l
/* 0000B014 80640000 */ lwz r3, 0(r4)
/* 0000B018 38A00001 */ li r5, 1
/* 0000B01C 38000000 */ li r0, 0
/* 0000B020 98A30000 */ stb r5, 0(r3)
/* 0000B024 80640000 */ lwz r3, 0(r4)
/* 0000B028 90A30004 */ stw r5, 4(r3)
/* 0000B02C 80640000 */ lwz r3, 0(r4)
/* 0000B030 98030008 */ stb r0, 8(r3)
lbl_0000B034:
/* 0000B034 4BFF5129 */ bl func_8009AC8C
/* 0000B038 480001D8 */ b lbl_0000B210
lbl_0000B03C:
/* 0000B03C 4BFF5121 */ bl mathutil_mtxA_from_mtxB
/* 0000B040 C03F0064 */ lfs f1, 0x64(r31)
/* 0000B044 38610030 */ addi r3, r1, 0x30
/* 0000B048 38800000 */ li r4, 0
/* 0000B04C 4BFF5111 */ bl GXInitLightSpot
/* 0000B050 C03F0000 */ lfs f1, 0(r31)
/* 0000B054 38610030 */ addi r3, r1, 0x30
/* 0000B058 38800000 */ li r4, 0
/* 0000B05C FC400890 */ fmr f2, f1
/* 0000B060 4BFF50FD */ bl GXInitLightDistAttn
/* 0000B064 3B8000FF */ li r28, 0xff
/* 0000B068 9B810070 */ stb r28, 0x70(r1)
/* 0000B06C 38810018 */ addi r4, r1, 0x18
/* 0000B070 38610030 */ addi r3, r1, 0x30
/* 0000B074 9B810071 */ stb r28, 0x71(r1)
/* 0000B078 9B810072 */ stb r28, 0x72(r1)
/* 0000B07C 9B810073 */ stb r28, 0x73(r1)
/* 0000B080 80010070 */ lwz r0, 0x70(r1)
/* 0000B084 90010018 */ stw r0, 0x18(r1)
/* 0000B088 4BFF50D5 */ bl GXInitLightColor
/* 0000B08C 387E0000 */ addi r3, r30, 0
/* 0000B090 38810024 */ addi r4, r1, 0x24
/* 0000B094 4BFF50C9 */ bl mathutil_mtxA_tf_point
/* 0000B098 C0210024 */ lfs f1, 0x24(r1)
/* 0000B09C 38610030 */ addi r3, r1, 0x30
/* 0000B0A0 C0410028 */ lfs f2, 0x28(r1)
/* 0000B0A4 C061002C */ lfs f3, 0x2c(r1)
/* 0000B0A8 4BFF50B5 */ bl GXInitLightPos
/* 0000B0AC 38610030 */ addi r3, r1, 0x30
/* 0000B0B0 38800001 */ li r4, 1
/* 0000B0B4 4BFF50A9 */ bl GXLoadLightObjImm
/* 0000B0B8 38600001 */ li r3, 1
/* 0000B0BC 4BFF50A1 */ bl GXSetNumChans
/* 0000B0C0 9B810070 */ stb r28, 0x70(r1)
/* 0000B0C4 38810014 */ addi r4, r1, 0x14
/* 0000B0C8 38600004 */ li r3, 4
/* 0000B0CC 9B810071 */ stb r28, 0x71(r1)
/* 0000B0D0 9B810072 */ stb r28, 0x72(r1)
/* 0000B0D4 9B810073 */ stb r28, 0x73(r1)
/* 0000B0D8 80010070 */ lwz r0, 0x70(r1)
/* 0000B0DC 90010014 */ stw r0, 0x14(r1)
/* 0000B0E0 4BFF507D */ bl GXSetChanMatColor
/* 0000B0E4 3C600000 */ lis r3, globalFrameCounter@ha
/* 0000B0E8 80030000 */ lwz r0, globalFrameCounter@l(r3)
/* 0000B0EC 5403402E */ slwi r3, r0, 8
/* 0000B0F0 4BFF506D */ bl mathutil_sin
/* 0000B0F4 C01F000C */ lfs f0, 0xc(r31)
/* 0000B0F8 38A00020 */ li r5, 0x20
/* 0000B0FC C05F0088 */ lfs f2, 0x88(r31)
/* 0000B100 38000040 */ li r0, 0x40
/* 0000B104 EC20082A */ fadds f1, f0, f1
/* 0000B108 C01F0084 */ lfs f0, 0x84(r31)
/* 0000B10C 38810010 */ addi r4, r1, 0x10
/* 0000B110 38600004 */ li r3, 4
/* 0000B114 EC220072 */ fmuls f1, f2, f1
/* 0000B118 EC00082A */ fadds f0, f0, f1
/* 0000B11C FC00001E */ fctiwz f0, f0
/* 0000B120 D80100A8 */ stfd f0, 0xa8(r1)
/* 0000B124 80C100AC */ lwz r6, 0xac(r1)
/* 0000B128 98C10070 */ stb r6, 0x70(r1)
/* 0000B12C 98A10071 */ stb r5, 0x71(r1)
/* 0000B130 98010072 */ stb r0, 0x72(r1)
/* 0000B134 9B810073 */ stb r28, 0x73(r1)
/* 0000B138 80010070 */ lwz r0, 0x70(r1)
/* 0000B13C 90010010 */ stw r0, 0x10(r1)
/* 0000B140 4BFF501D */ bl GXSetChanAmbColor
/* 0000B144 38600004 */ li r3, 4
/* 0000B148 38800001 */ li r4, 1
/* 0000B14C 38A00000 */ li r5, 0
/* 0000B150 38C00000 */ li r6, 0
/* 0000B154 38E00001 */ li r7, 1
/* 0000B158 39000002 */ li r8, 2
/* 0000B15C 39200001 */ li r9, 1
/* 0000B160 4BFF4FFD */ bl GXSetChanCtrl
/* 0000B164 38600000 */ li r3, 0
/* 0000B168 388000FF */ li r4, 0xff
/* 0000B16C 38A000FF */ li r5, 0xff
/* 0000B170 38C00004 */ li r6, 4
/* 0000B174 4BFF4FE9 */ bl func_8009EFF4
/* 0000B178 38600000 */ li r3, 0
/* 0000B17C 38800004 */ li r4, 4
/* 0000B180 4BFF4FDD */ bl func_8009EA30
/* 0000B184 38600000 */ li r3, 0
/* 0000B188 4BFF4FD5 */ bl GXSetNumTexGens
/* 0000B18C 38600001 */ li r3, 1
/* 0000B190 4BFF4FCD */ bl func_8009F2C8
/* 0000B194 38600001 */ li r3, 1
/* 0000B198 38800001 */ li r4, 1
/* 0000B19C 38A00000 */ li r5, 0
/* 0000B1A0 38C00000 */ li r6, 0
/* 0000B1A4 4BFF4FB9 */ bl func_8009E110
/* 0000B1A8 3C600000 */ lis r3, zMode@ha
/* 0000B1AC 38630000 */ addi r3, r3, zMode@l
/* 0000B1B0 80630000 */ lwz r3, 0(r3)
/* 0000B1B4 88030008 */ lbz r0, 8(r3)
/* 0000B1B8 28000001 */ cmplwi r0, 1
/* 0000B1BC 4082001C */ bne lbl_0000B1D8
/* 0000B1C0 80030004 */ lwz r0, 4(r3)
/* 0000B1C4 2C000001 */ cmpwi r0, 1
/* 0000B1C8 40820010 */ bne lbl_0000B1D8
/* 0000B1CC 88030000 */ lbz r0, 0(r3)
/* 0000B1D0 28000001 */ cmplwi r0, 1
/* 0000B1D4 41820038 */ beq lbl_0000B20C
lbl_0000B1D8:
/* 0000B1D8 38600001 */ li r3, 1
/* 0000B1DC 38800001 */ li r4, 1
/* 0000B1E0 38A00001 */ li r5, 1
/* 0000B1E4 4BFF4F79 */ bl GXSetZMode
/* 0000B1E8 3C600000 */ lis r3, zMode@ha
/* 0000B1EC 38830000 */ addi r4, r3, zMode@l
/* 0000B1F0 80640000 */ lwz r3, 0(r4)
/* 0000B1F4 38000001 */ li r0, 1
/* 0000B1F8 98030000 */ stb r0, 0(r3)
/* 0000B1FC 80640000 */ lwz r3, 0(r4)
/* 0000B200 90030004 */ stw r0, 4(r3)
/* 0000B204 80640000 */ lwz r3, 0(r4)
/* 0000B208 98030008 */ stb r0, 8(r3)
lbl_0000B20C:
/* 0000B20C 4BFF4F51 */ bl func_8009AC8C
lbl_0000B210:
/* 0000B210 4BFF4F4D */ bl mathutil_mtxA_from_identity
/* 0000B214 7FA3EB78 */ mr r3, r29
/* 0000B218 4BFF4F45 */ bl mathutil_mtxA_translate
/* 0000B21C C03F008C */ lfs f1, 0x8c(r31)
/* 0000B220 38610074 */ addi r3, r1, 0x74
/* 0000B224 C01D000C */ lfs f0, 0xc(r29)
/* 0000B228 EC210032 */ fmuls f1, f1, f0
/* 0000B22C FC400890 */ fmr f2, f1
/* 0000B230 FC600890 */ fmr f3, f1
/* 0000B234 4BFF4F29 */ bl C_MTXScale
/* 0000B238 3C600000 */ lis r3, mathutilData@ha
/* 0000B23C 3B830000 */ addi r28, r3, mathutilData@l
/* 0000B240 807C0000 */ lwz r3, 0(r28)
/* 0000B244 38810074 */ addi r4, r1, 0x74
/* 0000B248 38A30000 */ addi r5, r3, 0
/* 0000B24C 4BFF4F11 */ bl PSMTXConcat
/* 0000B250 809C0000 */ lwz r4, 0(r28)
/* 0000B254 38A40000 */ addi r5, r4, 0
/* 0000B258 38640030 */ addi r3, r4, 0x30
/* 0000B25C 4BFF4F01 */ bl PSMTXConcat
/* 0000B260 807C0000 */ lwz r3, 0(r28)
/* 0000B264 38800000 */ li r4, 0
/* 0000B268 4BFF4EF5 */ bl GXLoadPosMtxImm
/* 0000B26C 807C0000 */ lwz r3, 0(r28)
/* 0000B270 38800000 */ li r4, 0
/* 0000B274 4BFF4EE9 */ bl GXLoadNrmMtxImm
/* 0000B278 38600008 */ li r3, 8
/* 0000B27C 38800008 */ li r4, 8
/* 0000B280 4BFF4EDD */ bl GXDrawSphere
/* 0000B284 4BFF4ED9 */ bl mathutil_mtxA_from_identity
/* 0000B288 7FA3EB78 */ mr r3, r29
/* 0000B28C 4BFF4ED1 */ bl mathutil_mtxA_translate
/* 0000B290 801E015C */ lwz r0, 0x15c(r30)
/* 0000B294 54033830 */ slwi r3, r0, 7
/* 0000B298 4BFF4EC5 */ bl mathutil_mtxA_rotate_y
/* 0000B29C 801E015C */ lwz r0, 0x15c(r30)
/* 0000B2A0 54033032 */ slwi r3, r0, 6
/* 0000B2A4 4BFF4EB9 */ bl mathutil_mtxA_rotate_x
/* 0000B2A8 801E015C */ lwz r0, 0x15c(r30)
/* 0000B2AC 54032834 */ slwi r3, r0, 5
/* 0000B2B0 4BFF4EAD */ bl mathutil_mtxA_rotate_z
/* 0000B2B4 3B600010 */ li r27, 0x10
/* 0000B2B8 577E801E */ slwi r30, r27, 0x10
lbl_0000B2BC:
/* 0000B2BC 4BFF4EA1 */ bl mathutil_mtxA_push
/* 0000B2C0 7FC32670 */ srawi r3, r30, 4
/* 0000B2C4 4BFF4E99 */ bl mathutil_mtxA_rotate_y
/* 0000B2C8 C03F0000 */ lfs f1, 0(r31)
/* 0000B2CC C07F003C */ lfs f3, 0x3c(r31)
/* 0000B2D0 C01D000C */ lfs f0, 0xc(r29)
/* 0000B2D4 FC400890 */ fmr f2, f1
/* 0000B2D8 EC630032 */ fmuls f3, f3, f0
/* 0000B2DC 4BFF4E81 */ bl mathutil_mtxA_translate_xyz
/* 0000B2E0 C05D000C */ lfs f2, 0xc(r29)
/* 0000B2E4 38610074 */ addi r3, r1, 0x74
/* 0000B2E8 C03F0090 */ lfs f1, 0x90(r31)
/* 0000B2EC C01F008C */ lfs f0, 0x8c(r31)
/* 0000B2F0 EC2100B2 */ fmuls f1, f1, f2
/* 0000B2F4 EC6000B2 */ fmuls f3, f0, f2
/* 0000B2F8 FC400890 */ fmr f2, f1
/* 0000B2FC 4BFF4E61 */ bl C_MTXScale
/* 0000B300 807C0000 */ lwz r3, 0(r28)
/* 0000B304 38810074 */ addi r4, r1, 0x74
/* 0000B308 38A30000 */ addi r5, r3, 0
/* 0000B30C 4BFF4E51 */ bl PSMTXConcat
/* 0000B310 809C0000 */ lwz r4, 0(r28)
/* 0000B314 38A40000 */ addi r5, r4, 0
/* 0000B318 38640030 */ addi r3, r4, 0x30
/* 0000B31C 4BFF4E41 */ bl PSMTXConcat
/* 0000B320 807C0000 */ lwz r3, 0(r28)
/* 0000B324 38800000 */ li r4, 0
/* 0000B328 4BFF4E35 */ bl GXLoadPosMtxImm
/* 0000B32C 807C0000 */ lwz r3, 0(r28)
/* 0000B330 38800000 */ li r4, 0
/* 0000B334 4BFF4E29 */ bl GXLoadNrmMtxImm
/* 0000B338 38600008 */ li r3, 8
/* 0000B33C 4BFF4E21 */ bl GXDrawCylinder
/* 0000B340 4BFF4E1D */ bl mathutil_mtxA_pop
/* 0000B344 377BFFFF */ addic. r27, r27, -1  ;# fixed addi
/* 0000B348 3FDEFFFF */ addis r30, r30, 0xffff
/* 0000B34C 4181FF70 */ bgt lbl_0000B2BC
/* 0000B350 BB6100B4 */ lmw r27, 0xb4(r1)
/* 0000B354 800100CC */ lwz r0, 0xcc(r1)
/* 0000B358 382100C8 */ addi r1, r1, 0xc8
/* 0000B35C 7C0803A6 */ mtlr r0
/* 0000B360 4E800020 */ blr 
lbl_0000B364:
/* 0000B364 7C0802A6 */ mflr r0
/* 0000B368 3C800000 */ lis r4, lbl_00010118@ha
/* 0000B36C 90010004 */ stw r0, 4(r1)
/* 0000B370 3C600000 */ lis r3, lbl_10000F70@ha
/* 0000B374 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000B378 93E10014 */ stw r31, 0x14(r1)
/* 0000B37C 3BE30000 */ addi r31, r3, lbl_10000F70@l
/* 0000B380 93C10010 */ stw r30, 0x10(r1)
/* 0000B384 3BC40000 */ addi r30, r4, lbl_00010118@l
/* 0000B388 93A1000C */ stw r29, 0xc(r1)
/* 0000B38C 48000A75 */ bl lbl_0000BE00
/* 0000B390 C01E0000 */ lfs f0, 0(r30)
/* 0000B394 38000002 */ li r0, 2
/* 0000B398 3BBF0034 */ addi r29, r31, 0x34
/* 0000B39C D01F0000 */ stfs f0, 0(r31)
/* 0000B3A0 C01E0004 */ lfs f0, 4(r30)
/* 0000B3A4 D01F0004 */ stfs f0, 4(r31)
/* 0000B3A8 901F0008 */ stw r0, 8(r31)
/* 0000B3AC C01E0008 */ lfs f0, 8(r30)
/* 0000B3B0 D01F000C */ stfs f0, 0xc(r31)
/* 0000B3B4 801F0034 */ lwz r0, 0x34(r31)
/* 0000B3B8 28000000 */ cmplwi r0, 0
/* 0000B3BC 4082003C */ bne lbl_0000B3F8
/* 0000B3C0 38600280 */ li r3, 0x280
/* 0000B3C4 388001E0 */ li r4, 0x1e0
/* 0000B3C8 38A00004 */ li r5, 4
/* 0000B3CC 38C00000 */ li r6, 0
/* 0000B3D0 38E00000 */ li r7, 0
/* 0000B3D4 4BFF4D89 */ bl GXGetTexBufferSize
/* 0000B3D8 389F0030 */ addi r4, r31, 0x30
/* 0000B3DC 907F0030 */ stw r3, 0x30(r31)
/* 0000B3E0 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000B3E4 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000B3E8 80630000 */ lwz r3, 0(r3)
/* 0000B3EC 80840000 */ lwz r4, 0(r4)
/* 0000B3F0 4BFF4D6D */ bl OSAllocFromHeap
/* 0000B3F4 907D0000 */ stw r3, 0(r29)
lbl_0000B3F8:
/* 0000B3F8 3C600000 */ lis r3, currRenderMode@ha
/* 0000B3FC 809D0000 */ lwz r4, 0(r29)
/* 0000B400 80C30000 */ lwz r6, currRenderMode@l(r3)
/* 0000B404 387F0010 */ addi r3, r31, 0x10
/* 0000B408 38E00004 */ li r7, 4
/* 0000B40C A0A60004 */ lhz r5, 4(r6)
/* 0000B410 39000000 */ li r8, 0
/* 0000B414 A0C60006 */ lhz r6, 6(r6)
/* 0000B418 39200000 */ li r9, 0
/* 0000B41C 39400000 */ li r10, 0
/* 0000B420 4BFF4D3D */ bl GXInitTexObj
/* 0000B424 4BFF4D39 */ bl func_80049FF0
/* 0000B428 38600002 */ li r3, 2
/* 0000B42C 4BFF4D31 */ bl camera_set_state
/* 0000B430 8001001C */ lwz r0, 0x1c(r1)
/* 0000B434 83E10014 */ lwz r31, 0x14(r1)
/* 0000B438 83C10010 */ lwz r30, 0x10(r1)
/* 0000B43C 7C0803A6 */ mtlr r0
/* 0000B440 83A1000C */ lwz r29, 0xc(r1)
/* 0000B444 38210018 */ addi r1, r1, 0x18
/* 0000B448 4E800020 */ blr 
lbl_0000B44C:
/* 0000B44C 7C0802A6 */ mflr r0
/* 0000B450 3C600000 */ lis r3, lbl_10000F70@ha
/* 0000B454 90010004 */ stw r0, 4(r1)
/* 0000B458 38630000 */ addi r3, r3, lbl_10000F70@l
/* 0000B45C 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000B460 93E1000C */ stw r31, 0xc(r1)
/* 0000B464 3BE30034 */ addi r31, r3, 0x34
/* 0000B468 80830034 */ lwz r4, 0x34(r3)
/* 0000B46C 28040000 */ cmplwi r4, 0
/* 0000B470 4182001C */ beq lbl_0000B48C
/* 0000B474 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000B478 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000B47C 80630000 */ lwz r3, 0(r3)
/* 0000B480 4BFF4CDD */ bl OSFreeToHeap
/* 0000B484 38000000 */ li r0, 0
/* 0000B488 901F0000 */ stw r0, 0(r31)
lbl_0000B48C:
/* 0000B48C 80010014 */ lwz r0, 0x14(r1)
/* 0000B490 83E1000C */ lwz r31, 0xc(r1)
/* 0000B494 38210010 */ addi r1, r1, 0x10
/* 0000B498 7C0803A6 */ mtlr r0
/* 0000B49C 4E800020 */ blr 
lbl_0000B4A0:
/* 0000B4A0 7C0802A6 */ mflr r0
/* 0000B4A4 3C600000 */ lis r3, lbl_10000F70@ha
/* 0000B4A8 90010004 */ stw r0, 4(r1)
/* 0000B4AC 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000B4B0 93E1001C */ stw r31, 0x1c(r1)
/* 0000B4B4 3BE30000 */ addi r31, r3, lbl_10000F70@l
/* 0000B4B8 480009DD */ bl lbl_0000BE94
/* 0000B4BC 3C600000 */ lis r3, controllerInfo@ha
/* 0000B4C0 38630000 */ addi r3, r3, controllerInfo@l
/* 0000B4C4 A0830018 */ lhz r4, 0x18(r3)
/* 0000B4C8 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 0000B4CC 41820010 */ beq lbl_0000B4DC
/* 0000B4D0 807F0008 */ lwz r3, 8(r31)
/* 0000B4D4 38030001 */ addi r0, r3, 1
/* 0000B4D8 901F0008 */ stw r0, 8(r31)
lbl_0000B4DC:
/* 0000B4DC 38BF0008 */ addi r5, r31, 8
/* 0000B4E0 807F0008 */ lwz r3, 8(r31)
/* 0000B4E4 2C030000 */ cmpwi r3, 0
/* 0000B4E8 40810014 */ ble lbl_0000B4FC
/* 0000B4EC 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 0000B4F0 4182000C */ beq lbl_0000B4FC
/* 0000B4F4 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000B4F8 90050000 */ stw r0, 0(r5)
lbl_0000B4FC:
/* 0000B4FC 3C600000 */ lis r3, controllerInfo@ha
/* 0000B500 A0830000 */ lhz r4, controllerInfo@l(r3)
/* 0000B504 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 0000B508 41820018 */ beq lbl_0000B520
/* 0000B50C 3C600000 */ lis r3, lbl_00010124@ha
/* 0000B510 C03F000C */ lfs f1, 0xc(r31)
/* 0000B514 C0030000 */ lfs f0, lbl_00010124@l(r3)
/* 0000B518 EC010028 */ fsubs f0, f1, f0
/* 0000B51C D01F000C */ stfs f0, 0xc(r31)
lbl_0000B520:
/* 0000B520 548007FF */ clrlwi. r0, r4, 0x1f
/* 0000B524 41820018 */ beq lbl_0000B53C
/* 0000B528 3C600000 */ lis r3, lbl_00010124@ha
/* 0000B52C C03F000C */ lfs f1, 0xc(r31)
/* 0000B530 C0030000 */ lfs f0, lbl_00010124@l(r3)
/* 0000B534 EC01002A */ fadds f0, f1, f0
/* 0000B538 D01F000C */ stfs f0, 0xc(r31)
lbl_0000B53C:
/* 0000B53C 4BFF4C21 */ bl mathutil_mtxA_from_mtxB
/* 0000B540 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000B544 38630000 */ addi r3, r3, currentCameraStructPtr@l
/* 0000B548 80630000 */ lwz r3, 0(r3)
/* 0000B54C 38810008 */ addi r4, r1, 8
/* 0000B550 3863000C */ addi r3, r3, 0xc
/* 0000B554 4BFF4C09 */ bl mathutil_mtxA_tf_point
/* 0000B558 C0010010 */ lfs f0, 0x10(r1)
/* 0000B55C FC000050 */ fneg f0, f0
/* 0000B560 D01F0000 */ stfs f0, 0(r31)
/* 0000B564 4BFF4BF9 */ bl func_8004A0C8
/* 0000B568 80010024 */ lwz r0, 0x24(r1)
/* 0000B56C 83E1001C */ lwz r31, 0x1c(r1)
/* 0000B570 38210020 */ addi r1, r1, 0x20
/* 0000B574 7C0803A6 */ mtlr r0
/* 0000B578 4E800020 */ blr 
lbl_0000B57C:
/* 0000B57C 7C0802A6 */ mflr r0
/* 0000B580 3C600000 */ lis r3, lbl_000148A8@ha
/* 0000B584 90010004 */ stw r0, 4(r1)
/* 0000B588 38800008 */ li r4, 8
/* 0000B58C 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000B590 93E1001C */ stw r31, 0x1c(r1)
/* 0000B594 93C10018 */ stw r30, 0x18(r1)
/* 0000B598 93A10014 */ stw r29, 0x14(r1)
/* 0000B59C 3BA30000 */ addi r29, r3, lbl_000148A8@l
/* 0000B5A0 3C600000 */ lis r3, lbl_00010118@ha
/* 0000B5A4 3BC30000 */ addi r30, r3, lbl_00010118@l
/* 0000B5A8 38600008 */ li r3, 8
/* 0000B5AC 4BFF4BB1 */ bl g_debug_set_cursor_pos
/* 0000B5B0 387D0000 */ addi r3, r29, 0
/* 0000B5B4 4CC63182 */ crclr 6
/* 0000B5B8 4BFF4BA5 */ bl g_debug_printf
/* 0000B5BC 3C600000 */ lis r3, lbl_10000F70@ha
/* 0000B5C0 4CC63182 */ crclr 6
/* 0000B5C4 3BE30000 */ addi r31, r3, lbl_10000F70@l
/* 0000B5C8 809F0008 */ lwz r4, 8(r31)
/* 0000B5CC 387D000C */ addi r3, r29, 0xc
/* 0000B5D0 4BFF4B8D */ bl g_debug_printf
/* 0000B5D4 C03F000C */ lfs f1, 0xc(r31)
/* 0000B5D8 387D001C */ addi r3, r29, 0x1c
/* 0000B5DC 4CC63242 */ crset 6
/* 0000B5E0 4BFF4B7D */ bl g_debug_printf
/* 0000B5E4 480008B5 */ bl lbl_0000BE98
/* 0000B5E8 38600000 */ li r3, 0
/* 0000B5EC 4BFF4B71 */ bl func_80018648
/* 0000B5F0 480000C1 */ bl lbl_0000B6B0
/* 0000B5F4 4BFF4B69 */ bl func_80017FCC
/* 0000B5F8 38600000 */ li r3, 0
/* 0000B5FC 38800001 */ li r4, 1
/* 0000B600 38A00000 */ li r5, 0
/* 0000B604 38C00000 */ li r6, 0
/* 0000B608 4BFF4B55 */ bl func_8009E110
/* 0000B60C 3C600000 */ lis r3, zMode@ha
/* 0000B610 38630000 */ addi r3, r3, zMode@l
/* 0000B614 80630000 */ lwz r3, 0(r3)
/* 0000B618 88030008 */ lbz r0, 8(r3)
/* 0000B61C 28000001 */ cmplwi r0, 1
/* 0000B620 4082001C */ bne lbl_0000B63C
/* 0000B624 80030004 */ lwz r0, 4(r3)
/* 0000B628 2C000001 */ cmpwi r0, 1
/* 0000B62C 40820010 */ bne lbl_0000B63C
/* 0000B630 88030000 */ lbz r0, 0(r3)
/* 0000B634 28000001 */ cmplwi r0, 1
/* 0000B638 41820038 */ beq lbl_0000B670
lbl_0000B63C:
/* 0000B63C 38600001 */ li r3, 1
/* 0000B640 38800001 */ li r4, 1
/* 0000B644 38A00001 */ li r5, 1
/* 0000B648 4BFF4B15 */ bl GXSetZMode
/* 0000B64C 3C600000 */ lis r3, zMode@ha
/* 0000B650 38830000 */ addi r4, r3, zMode@l
/* 0000B654 80640000 */ lwz r3, 0(r4)
/* 0000B658 38000001 */ li r0, 1
/* 0000B65C 98030000 */ stb r0, 0(r3)
/* 0000B660 80640000 */ lwz r3, 0(r4)
/* 0000B664 90030004 */ stw r0, 4(r3)
/* 0000B668 80640000 */ lwz r3, 0(r4)
/* 0000B66C 98030008 */ stb r0, 8(r3)
lbl_0000B670:
/* 0000B670 801E0010 */ lwz r0, 0x10(r30)
/* 0000B674 38810008 */ addi r4, r1, 8
/* 0000B678 38600000 */ li r3, 0
/* 0000B67C 90010008 */ stw r0, 8(r1)
/* 0000B680 C03E0014 */ lfs f1, 0x14(r30)
/* 0000B684 C05E0004 */ lfs f2, 4(r30)
/* 0000B688 C07E0018 */ lfs f3, 0x18(r30)
/* 0000B68C C09E001C */ lfs f4, 0x1c(r30)
/* 0000B690 4BFF4ACD */ bl func_8009E398
/* 0000B694 80010024 */ lwz r0, 0x24(r1)
/* 0000B698 83E1001C */ lwz r31, 0x1c(r1)
/* 0000B69C 83C10018 */ lwz r30, 0x18(r1)
/* 0000B6A0 7C0803A6 */ mtlr r0
/* 0000B6A4 83A10014 */ lwz r29, 0x14(r1)
/* 0000B6A8 38210020 */ addi r1, r1, 0x20
/* 0000B6AC 4E800020 */ blr 
lbl_0000B6B0:
/* 0000B6B0 7C0802A6 */ mflr r0
/* 0000B6B4 3C600000 */ lis r3, currRenderMode@ha
/* 0000B6B8 90010004 */ stw r0, 4(r1)
/* 0000B6BC 3C800000 */ lis r4, lbl_00010118@ha
/* 0000B6C0 9421FF68 */ stwu r1, -0x98(r1)
/* 0000B6C4 DBE10090 */ stfd f31, 0x90(r1)
/* 0000B6C8 DBC10088 */ stfd f30, 0x88(r1)
/* 0000B6CC DBA10080 */ stfd f29, 0x80(r1)
/* 0000B6D0 DB810078 */ stfd f28, 0x78(r1)
/* 0000B6D4 DB610070 */ stfd f27, 0x70(r1)
/* 0000B6D8 DB410068 */ stfd f26, 0x68(r1)
/* 0000B6DC BF410050 */ stmw r26, 0x50(r1)
/* 0000B6E0 3BC40000 */ addi r30, r4, lbl_00010118@l
/* 0000B6E4 38800000 */ li r4, 0
/* 0000B6E8 80A30000 */ lwz r5, currRenderMode@l(r3)
/* 0000B6EC 3C600000 */ lis r3, lbl_10000F70@ha
/* 0000B6F0 3BE30000 */ addi r31, r3, lbl_10000F70@l
/* 0000B6F4 A3850006 */ lhz r28, 6(r5)
/* 0000B6F8 38600000 */ li r3, 0
/* 0000B6FC A3650004 */ lhz r27, 4(r5)
/* 0000B700 38DC0000 */ addi r6, r28, 0
/* 0000B704 38BB0000 */ addi r5, r27, 0
/* 0000B708 4BFF4A55 */ bl GXSetTexCopySrc
/* 0000B70C 387B0000 */ addi r3, r27, 0
/* 0000B710 389C0000 */ addi r4, r28, 0
/* 0000B714 38A00004 */ li r5, 4
/* 0000B718 38C00000 */ li r6, 0
/* 0000B71C 4BFF4A41 */ bl GXSetTexCopyDst
/* 0000B720 807F0034 */ lwz r3, 0x34(r31)
/* 0000B724 38800000 */ li r4, 0
/* 0000B728 4BFF4A35 */ bl GXCopyTex
/* 0000B72C 4BFF4A31 */ bl GXPixModeSync
/* 0000B730 38600000 */ li r3, 0
/* 0000B734 4BFF4A29 */ bl GXSetNumChans
/* 0000B738 387F0010 */ addi r3, r31, 0x10
/* 0000B73C 38800000 */ li r4, 0
/* 0000B740 4BFF4A1D */ bl func_8009F430
/* 0000B744 38600000 */ li r3, 0
/* 0000B748 38800001 */ li r4, 1
/* 0000B74C 38A00004 */ li r5, 4
/* 0000B750 38C0001E */ li r6, 0x1e
/* 0000B754 38E00000 */ li r7, 0
/* 0000B758 3900007D */ li r8, 0x7d
/* 0000B75C 4BFF4A01 */ bl GXSetTexCoordGen2
/* 0000B760 38600000 */ li r3, 0
/* 0000B764 38800000 */ li r4, 0
/* 0000B768 38A00000 */ li r5, 0
/* 0000B76C 38C00004 */ li r6, 4
/* 0000B770 4BFF49ED */ bl func_8009EFF4
/* 0000B774 38600000 */ li r3, 0
/* 0000B778 4BFF49E5 */ bl GXSetTevDirect
/* 0000B77C 38600000 */ li r3, 0
/* 0000B780 38800004 */ li r4, 4
/* 0000B784 4BFF49D9 */ bl func_8009F180
/* 0000B788 38600000 */ li r3, 0
/* 0000B78C 3880000F */ li r4, 0xf
/* 0000B790 38A00008 */ li r5, 8
/* 0000B794 38C0000E */ li r6, 0xe
/* 0000B798 38E0000F */ li r7, 0xf
/* 0000B79C 4BFF49C1 */ bl func_8009E618
/* 0000B7A0 38600000 */ li r3, 0
/* 0000B7A4 38800000 */ li r4, 0
/* 0000B7A8 38A00000 */ li r5, 0
/* 0000B7AC 38C00000 */ li r6, 0
/* 0000B7B0 38E00000 */ li r7, 0
/* 0000B7B4 39000000 */ li r8, 0
/* 0000B7B8 4BFF49A5 */ bl func_8009E800
/* 0000B7BC 38600001 */ li r3, 1
/* 0000B7C0 38800001 */ li r4, 1
/* 0000B7C4 38A00004 */ li r5, 4
/* 0000B7C8 38C00021 */ li r6, 0x21
/* 0000B7CC 38E00000 */ li r7, 0
/* 0000B7D0 3900007D */ li r8, 0x7d
/* 0000B7D4 4BFF4989 */ bl GXSetTexCoordGen2
/* 0000B7D8 38600001 */ li r3, 1
/* 0000B7DC 38800001 */ li r4, 1
/* 0000B7E0 38A00000 */ li r5, 0
/* 0000B7E4 38C00004 */ li r6, 4
/* 0000B7E8 4BFF4975 */ bl func_8009EFF4
/* 0000B7EC 38600001 */ li r3, 1
/* 0000B7F0 4BFF496D */ bl GXSetTevDirect
/* 0000B7F4 38600001 */ li r3, 1
/* 0000B7F8 38800004 */ li r4, 4
/* 0000B7FC 4BFF4961 */ bl func_8009F180
/* 0000B800 38600001 */ li r3, 1
/* 0000B804 3880000F */ li r4, 0xf
/* 0000B808 38A00008 */ li r5, 8
/* 0000B80C 38C0000E */ li r6, 0xe
/* 0000B810 38E00000 */ li r7, 0
/* 0000B814 4BFF4949 */ bl func_8009E618
/* 0000B818 38600001 */ li r3, 1
/* 0000B81C 38800000 */ li r4, 0
/* 0000B820 38A00000 */ li r5, 0
/* 0000B824 38C00000 */ li r6, 0
/* 0000B828 38E00000 */ li r7, 0
/* 0000B82C 39000000 */ li r8, 0
/* 0000B830 4BFF492D */ bl func_8009E800
/* 0000B834 38600002 */ li r3, 2
/* 0000B838 38800001 */ li r4, 1
/* 0000B83C 38A00004 */ li r5, 4
/* 0000B840 38C00024 */ li r6, 0x24
/* 0000B844 38E00000 */ li r7, 0
/* 0000B848 3900007D */ li r8, 0x7d
/* 0000B84C 4BFF4911 */ bl GXSetTexCoordGen2
/* 0000B850 38600002 */ li r3, 2
/* 0000B854 38800002 */ li r4, 2
/* 0000B858 38A00000 */ li r5, 0
/* 0000B85C 38C00004 */ li r6, 4
/* 0000B860 4BFF48FD */ bl func_8009EFF4
/* 0000B864 38600002 */ li r3, 2
/* 0000B868 4BFF48F5 */ bl GXSetTevDirect
/* 0000B86C 38600002 */ li r3, 2
/* 0000B870 38800004 */ li r4, 4
/* 0000B874 4BFF48E9 */ bl func_8009F180
/* 0000B878 38600002 */ li r3, 2
/* 0000B87C 3880000F */ li r4, 0xf
/* 0000B880 38A00008 */ li r5, 8
/* 0000B884 38C0000E */ li r6, 0xe
/* 0000B888 38E00000 */ li r7, 0
/* 0000B88C 4BFF48D1 */ bl func_8009E618
/* 0000B890 38600002 */ li r3, 2
/* 0000B894 38800000 */ li r4, 0
/* 0000B898 38A00000 */ li r5, 0
/* 0000B89C 38C00000 */ li r6, 0
/* 0000B8A0 38E00000 */ li r7, 0
/* 0000B8A4 39000000 */ li r8, 0
/* 0000B8A8 4BFF48B5 */ bl func_8009E800
/* 0000B8AC 38600003 */ li r3, 3
/* 0000B8B0 38800001 */ li r4, 1
/* 0000B8B4 38A00004 */ li r5, 4
/* 0000B8B8 38C00027 */ li r6, 0x27
/* 0000B8BC 38E00000 */ li r7, 0
/* 0000B8C0 3900007D */ li r8, 0x7d
/* 0000B8C4 4BFF4899 */ bl GXSetTexCoordGen2
/* 0000B8C8 38600003 */ li r3, 3
/* 0000B8CC 38800003 */ li r4, 3
/* 0000B8D0 38A00000 */ li r5, 0
/* 0000B8D4 38C00004 */ li r6, 4
/* 0000B8D8 4BFF4885 */ bl func_8009EFF4
/* 0000B8DC 38600003 */ li r3, 3
/* 0000B8E0 4BFF487D */ bl GXSetTevDirect
/* 0000B8E4 38600003 */ li r3, 3
/* 0000B8E8 38800004 */ li r4, 4
/* 0000B8EC 4BFF4871 */ bl func_8009F180
/* 0000B8F0 38600003 */ li r3, 3
/* 0000B8F4 38800004 */ li r4, 4
/* 0000B8F8 4BFF4865 */ bl func_8009F224
/* 0000B8FC 38600003 */ li r3, 3
/* 0000B900 3880000F */ li r4, 0xf
/* 0000B904 38A00008 */ li r5, 8
/* 0000B908 38C0000E */ li r6, 0xe
/* 0000B90C 38E00000 */ li r7, 0
/* 0000B910 4BFF484D */ bl func_8009E618
/* 0000B914 38600003 */ li r3, 3
/* 0000B918 38800000 */ li r4, 0
/* 0000B91C 38A00000 */ li r5, 0
/* 0000B920 38C00003 */ li r6, 3
/* 0000B924 38E00001 */ li r7, 1
/* 0000B928 39000000 */ li r8, 0
/* 0000B92C 4BFF4831 */ bl func_8009E800
/* 0000B930 38600003 */ li r3, 3
/* 0000B934 38800007 */ li r4, 7
/* 0000B938 38A00007 */ li r5, 7
/* 0000B93C 38C00007 */ li r6, 7
/* 0000B940 38E00006 */ li r7, 6
/* 0000B944 4BFF4819 */ bl func_8009E70C
/* 0000B948 38600003 */ li r3, 3
/* 0000B94C 38800000 */ li r4, 0
/* 0000B950 38A00000 */ li r5, 0
/* 0000B954 38C00000 */ li r6, 0
/* 0000B958 38E00001 */ li r7, 1
/* 0000B95C 39000000 */ li r8, 0
/* 0000B960 4BFF47FD */ bl func_8009E918
/* 0000B964 38600004 */ li r3, 4
/* 0000B968 4BFF47F5 */ bl func_8009F2C8
/* 0000B96C 38600004 */ li r3, 4
/* 0000B970 4BFF47ED */ bl GXSetNumTexGens
/* 0000B974 38600000 */ li r3, 0
/* 0000B978 4BFF47E5 */ bl GXSetNumIndStages
/* 0000B97C 38600001 */ li r3, 1
/* 0000B980 38800004 */ li r4, 4
/* 0000B984 38A00005 */ li r5, 5
/* 0000B988 38C00000 */ li r6, 0
/* 0000B98C 4BFF47D1 */ bl func_8009E110
/* 0000B990 801E0020 */ lwz r0, 0x20(r30)
/* 0000B994 38810008 */ addi r4, r1, 8
/* 0000B998 38600000 */ li r3, 0
/* 0000B99C 90010008 */ stw r0, 8(r1)
/* 0000B9A0 C03E0014 */ lfs f1, 0x14(r30)
/* 0000B9A4 C05E0004 */ lfs f2, 4(r30)
/* 0000B9A8 C07E0018 */ lfs f3, 0x18(r30)
/* 0000B9AC C09E001C */ lfs f4, 0x1c(r30)
/* 0000B9B0 4BFF47AD */ bl func_8009E398
/* 0000B9B4 38602200 */ li r3, 0x2200
/* 0000B9B8 4BFF47A5 */ bl gxutil_set_vtx_attrs
/* 0000B9BC 38600001 */ li r3, 1
/* 0000B9C0 38800009 */ li r4, 9
/* 0000B9C4 38A00001 */ li r5, 1
/* 0000B9C8 38C00004 */ li r6, 4
/* 0000B9CC 38E00000 */ li r7, 0
/* 0000B9D0 4BFF478D */ bl GXSetVtxAttrFmt
/* 0000B9D4 38600001 */ li r3, 1
/* 0000B9D8 3880000D */ li r4, 0xd
/* 0000B9DC 38A00001 */ li r5, 1
/* 0000B9E0 38C00004 */ li r6, 4
/* 0000B9E4 38E00000 */ li r7, 0
/* 0000B9E8 4BFF4775 */ bl GXSetVtxAttrFmt
/* 0000B9EC 4BFF4771 */ bl mathutil_mtxA_from_identity
/* 0000B9F0 3C600000 */ lis r3, mathutilData@ha
/* 0000B9F4 38630000 */ addi r3, r3, mathutilData@l
/* 0000B9F8 80630000 */ lwz r3, 0(r3)
/* 0000B9FC 38800000 */ li r4, 0
/* 0000BA00 4BFF475D */ bl GXLoadPosMtxImm
/* 0000BA04 3BBF0008 */ addi r29, r31, 8
/* 0000BA08 801F0008 */ lwz r0, 8(r31)
/* 0000BA0C 2C000000 */ cmpwi r0, 0
/* 0000BA10 418203C4 */ beq lbl_0000BDD4
/* 0000BA14 C03E0024 */ lfs f1, 0x24(r30)
/* 0000BA18 3861000C */ addi r3, r1, 0xc
/* 0000BA1C FC400890 */ fmr f2, f1
/* 0000BA20 FC600890 */ fmr f3, f1
/* 0000BA24 4BFF4739 */ bl C_MTXScale
/* 0000BA28 3C600000 */ lis r3, zMode@ha
/* 0000BA2C C01F0000 */ lfs f0, 0(r31)
/* 0000BA30 38630000 */ addi r3, r3, zMode@l
/* 0000BA34 C3BF000C */ lfs f29, 0xc(r31)
/* 0000BA38 80630000 */ lwz r3, 0(r3)
/* 0000BA3C FF800050 */ fneg f28, f0
/* 0000BA40 88030008 */ lbz r0, 8(r3)
/* 0000BA44 28000000 */ cmplwi r0, 0
/* 0000BA48 4082001C */ bne lbl_0000BA64
/* 0000BA4C 80030004 */ lwz r0, 4(r3)
/* 0000BA50 2C000004 */ cmpwi r0, 4
/* 0000BA54 40820010 */ bne lbl_0000BA64
/* 0000BA58 88030000 */ lbz r0, 0(r3)
/* 0000BA5C 28000001 */ cmplwi r0, 1
/* 0000BA60 41820040 */ beq lbl_0000BAA0
lbl_0000BA64:
/* 0000BA64 38600001 */ li r3, 1
/* 0000BA68 38800004 */ li r4, 4
/* 0000BA6C 38A00000 */ li r5, 0
/* 0000BA70 4BFF46ED */ bl GXSetZMode
/* 0000BA74 3C600000 */ lis r3, zMode@ha
/* 0000BA78 38A30000 */ addi r5, r3, zMode@l
/* 0000BA7C 80650000 */ lwz r3, 0(r5)
/* 0000BA80 38000001 */ li r0, 1
/* 0000BA84 38800004 */ li r4, 4
/* 0000BA88 98030000 */ stb r0, 0(r3)
/* 0000BA8C 38000000 */ li r0, 0
/* 0000BA90 80650000 */ lwz r3, 0(r5)
/* 0000BA94 90830004 */ stw r4, 4(r3)
/* 0000BA98 80650000 */ lwz r3, 0(r5)
/* 0000BA9C 98030008 */ stb r0, 8(r3)
lbl_0000BAA0:
/* 0000BAA0 809D0000 */ lwz r4, 0(r29)
/* 0000BAA4 3C600000 */ lis r3, lbl_00010148@ha
/* 0000BAA8 C8230000 */ lfd f1, lbl_00010148@l(r3)
/* 0000BAAC 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000BAB0 38040002 */ addi r0, r4, 2
/* 0000BAB4 6C008000 */ xoris r0, r0, 0x8000
/* 0000BAB8 9001004C */ stw r0, 0x4c(r1)
/* 0000BABC 3C004330 */ lis r0, 0x4330
/* 0000BAC0 7C9A2378 */ mr r26, r4
/* 0000BAC4 90010048 */ stw r0, 0x48(r1)
/* 0000BAC8 3B630000 */ addi r27, r3, currentCameraStructPtr@l
/* 0000BACC 3F80CC01 */ lis r28, 0xcc01
/* 0000BAD0 C8010048 */ lfd f0, 0x48(r1)
/* 0000BAD4 EC000828 */ fsubs f0, f0, f1
/* 0000BAD8 EFFC0024 */ fdivs f31, f28, f0
/* 0000BADC FFC0F890 */ fmr f30, f31
/* 0000BAE0 4800011C */ b lbl_0000BBFC
lbl_0000BAE4:
/* 0000BAE4 EC5EE028 */ fsubs f2, f30, f28
/* 0000BAE8 C03E0028 */ lfs f1, 0x28(r30)
/* 0000BAEC C01E002C */ lfs f0, 0x2c(r30)
/* 0000BAF0 3861000C */ addi r3, r1, 0xc
/* 0000BAF4 3880001E */ li r4, 0x1e
/* 0000BAF8 EC5D00B2 */ fmuls f2, f29, f2
/* 0000BAFC 38A00001 */ li r5, 1
/* 0000BB00 FC401050 */ fneg f2, f2
/* 0000BB04 EC42F024 */ fdivs f2, f2, f30
/* 0000BB08 EF4100B2 */ fmuls f26, f1, f2
/* 0000BB0C EF6000B2 */ fmuls f27, f0, f2
/* 0000BB10 D3410018 */ stfs f26, 0x18(r1)
/* 0000BB14 C01E0014 */ lfs f0, 0x14(r30)
/* 0000BB18 D0010028 */ stfs f0, 0x28(r1)
/* 0000BB1C 4BFF4641 */ bl GXLoadTexMtxImm
/* 0000BB20 FC00D050 */ fneg f0, f26
/* 0000BB24 3861000C */ addi r3, r1, 0xc
/* 0000BB28 38800021 */ li r4, 0x21
/* 0000BB2C 38A00001 */ li r5, 1
/* 0000BB30 D0010018 */ stfs f0, 0x18(r1)
/* 0000BB34 4BFF4629 */ bl GXLoadTexMtxImm
/* 0000BB38 C01E0014 */ lfs f0, 0x14(r30)
/* 0000BB3C 3861000C */ addi r3, r1, 0xc
/* 0000BB40 38800024 */ li r4, 0x24
/* 0000BB44 D0010018 */ stfs f0, 0x18(r1)
/* 0000BB48 38A00001 */ li r5, 1
/* 0000BB4C D3610028 */ stfs f27, 0x28(r1)
/* 0000BB50 4BFF460D */ bl GXLoadTexMtxImm
/* 0000BB54 FC00D850 */ fneg f0, f27
/* 0000BB58 3861000C */ addi r3, r1, 0xc
/* 0000BB5C 38800027 */ li r4, 0x27
/* 0000BB60 38A00001 */ li r5, 1
/* 0000BB64 D0010028 */ stfs f0, 0x28(r1)
/* 0000BB68 4BFF45F5 */ bl GXLoadTexMtxImm
/* 0000BB6C 80DB0000 */ lwz r6, 0(r27)
/* 0000BB70 38600080 */ li r3, 0x80
/* 0000BB74 38800001 */ li r4, 1
/* 0000BB78 C0060038 */ lfs f0, 0x38(r6)
/* 0000BB7C 38A00004 */ li r5, 4
/* 0000BB80 C0260034 */ lfs f1, 0x34(r6)
/* 0000BB84 FC000050 */ fneg f0, f0
/* 0000BB88 EF7E0032 */ fmuls f27, f30, f0
/* 0000BB8C EF4106F2 */ fmuls f26, f1, f27
/* 0000BB90 4BFF45CD */ bl GXBegin
/* 0000BB94 FC40D050 */ fneg f2, f26
/* 0000BB98 C03E0014 */ lfs f1, 0x14(r30)
/* 0000BB9C C01E0024 */ lfs f0, 0x24(r30)
/* 0000BBA0 FC60D850 */ fneg f3, f27
/* 0000BBA4 3B5AFFFF */ addi r26, r26, -1  ;# fixed addi
/* 0000BBA8 D05C8000 */ stfs f2, -0x8000(r28)
/* 0000BBAC D37C8000 */ stfs f27, -0x8000(r28)
/* 0000BBB0 D3DC8000 */ stfs f30, -0x8000(r28)
/* 0000BBB4 D03C8000 */ stfs f1, -0x8000(r28)
/* 0000BBB8 D03C8000 */ stfs f1, -0x8000(r28)
/* 0000BBBC D35C8000 */ stfs f26, -0x8000(r28)
/* 0000BBC0 D37C8000 */ stfs f27, -0x8000(r28)
/* 0000BBC4 D3DC8000 */ stfs f30, -0x8000(r28)
/* 0000BBC8 D01C8000 */ stfs f0, -0x8000(r28)
/* 0000BBCC D03C8000 */ stfs f1, -0x8000(r28)
/* 0000BBD0 D35C8000 */ stfs f26, -0x8000(r28)
/* 0000BBD4 D07C8000 */ stfs f3, -0x8000(r28)
/* 0000BBD8 D3DC8000 */ stfs f30, -0x8000(r28)
/* 0000BBDC D01C8000 */ stfs f0, -0x8000(r28)
/* 0000BBE0 D01C8000 */ stfs f0, -0x8000(r28)
/* 0000BBE4 D05C8000 */ stfs f2, -0x8000(r28)
/* 0000BBE8 D07C8000 */ stfs f3, -0x8000(r28)
/* 0000BBEC D3DC8000 */ stfs f30, -0x8000(r28)
/* 0000BBF0 EFDEF82A */ fadds f30, f30, f31
/* 0000BBF4 D03C8000 */ stfs f1, -0x8000(r28)
/* 0000BBF8 D01C8000 */ stfs f0, -0x8000(r28)
lbl_0000BBFC:
/* 0000BBFC 2C1A0000 */ cmpwi r26, 0
/* 0000BC00 4181FEE4 */ bgt lbl_0000BAE4
/* 0000BC04 3C600000 */ lis r3, zMode@ha
/* 0000BC08 38630000 */ addi r3, r3, zMode@l
/* 0000BC0C 80630000 */ lwz r3, 0(r3)
/* 0000BC10 88030008 */ lbz r0, 8(r3)
/* 0000BC14 28000000 */ cmplwi r0, 0
/* 0000BC18 4082001C */ bne lbl_0000BC34
/* 0000BC1C 80030004 */ lwz r0, 4(r3)
/* 0000BC20 2C000001 */ cmpwi r0, 1
/* 0000BC24 40820010 */ bne lbl_0000BC34
/* 0000BC28 88030000 */ lbz r0, 0(r3)
/* 0000BC2C 28000001 */ cmplwi r0, 1
/* 0000BC30 4182003C */ beq lbl_0000BC6C
lbl_0000BC34:
/* 0000BC34 38600001 */ li r3, 1
/* 0000BC38 38800001 */ li r4, 1
/* 0000BC3C 38A00000 */ li r5, 0
/* 0000BC40 4BFF451D */ bl GXSetZMode
/* 0000BC44 3C600000 */ lis r3, zMode@ha
/* 0000BC48 38830000 */ addi r4, r3, zMode@l
/* 0000BC4C 80640000 */ lwz r3, 0(r4)
/* 0000BC50 38A00001 */ li r5, 1
/* 0000BC54 38000000 */ li r0, 0
/* 0000BC58 98A30000 */ stb r5, 0(r3)
/* 0000BC5C 80640000 */ lwz r3, 0(r4)
/* 0000BC60 90A30004 */ stw r5, 4(r3)
/* 0000BC64 80640000 */ lwz r3, 0(r4)
/* 0000BC68 98030008 */ stb r0, 8(r3)
lbl_0000BC6C:
/* 0000BC6C 837D0000 */ lwz r27, 0(r29)
/* 0000BC70 3C600000 */ lis r3, lbl_00010148@ha
/* 0000BC74 C01F0004 */ lfs f0, 4(r31)
/* 0000BC78 3FA0CC01 */ lis r29, 0xcc01
/* 0000BC7C 381B0001 */ addi r0, r27, 1
/* 0000BC80 6C008000 */ xoris r0, r0, 0x8000
/* 0000BC84 C8230000 */ lfd f1, lbl_00010148@l(r3)
/* 0000BC88 9001004C */ stw r0, 0x4c(r1)
/* 0000BC8C 3C004330 */ lis r0, 0x4330
/* 0000BC90 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000BC94 FC400050 */ fneg f2, f0
/* 0000BC98 90010048 */ stw r0, 0x48(r1)
/* 0000BC9C EFDC0028 */ fsubs f30, f28, f0
/* 0000BCA0 3BE30000 */ addi r31, r3, currentCameraStructPtr@l
/* 0000BCA4 C8010048 */ lfd f0, 0x48(r1)
/* 0000BCA8 EC000828 */ fsubs f0, f0, f1
/* 0000BCAC EFE20024 */ fdivs f31, f2, f0
/* 0000BCB0 4800011C */ b lbl_0000BDCC
lbl_0000BCB4:
/* 0000BCB4 EC5CF028 */ fsubs f2, f28, f30
/* 0000BCB8 C03E0028 */ lfs f1, 0x28(r30)
/* 0000BCBC C01E002C */ lfs f0, 0x2c(r30)
/* 0000BCC0 3861000C */ addi r3, r1, 0xc
/* 0000BCC4 3880001E */ li r4, 0x1e
/* 0000BCC8 EC5D00B2 */ fmuls f2, f29, f2
/* 0000BCCC 38A00001 */ li r5, 1
/* 0000BCD0 FC401050 */ fneg f2, f2
/* 0000BCD4 EC42F024 */ fdivs f2, f2, f30
/* 0000BCD8 EF6100B2 */ fmuls f27, f1, f2
/* 0000BCDC EF4000B2 */ fmuls f26, f0, f2
/* 0000BCE0 D3610018 */ stfs f27, 0x18(r1)
/* 0000BCE4 C01E0014 */ lfs f0, 0x14(r30)
/* 0000BCE8 D0010028 */ stfs f0, 0x28(r1)
/* 0000BCEC 4BFF4471 */ bl GXLoadTexMtxImm
/* 0000BCF0 FC00D850 */ fneg f0, f27
/* 0000BCF4 3861000C */ addi r3, r1, 0xc
/* 0000BCF8 38800021 */ li r4, 0x21
/* 0000BCFC 38A00001 */ li r5, 1
/* 0000BD00 D0010018 */ stfs f0, 0x18(r1)
/* 0000BD04 4BFF4459 */ bl GXLoadTexMtxImm
/* 0000BD08 C01E0014 */ lfs f0, 0x14(r30)
/* 0000BD0C 3861000C */ addi r3, r1, 0xc
/* 0000BD10 38800024 */ li r4, 0x24
/* 0000BD14 D0010018 */ stfs f0, 0x18(r1)
/* 0000BD18 38A00001 */ li r5, 1
/* 0000BD1C D3410028 */ stfs f26, 0x28(r1)
/* 0000BD20 4BFF443D */ bl GXLoadTexMtxImm
/* 0000BD24 FC00D050 */ fneg f0, f26
/* 0000BD28 3861000C */ addi r3, r1, 0xc
/* 0000BD2C 38800027 */ li r4, 0x27
/* 0000BD30 38A00001 */ li r5, 1
/* 0000BD34 D0010028 */ stfs f0, 0x28(r1)
/* 0000BD38 4BFF4425 */ bl GXLoadTexMtxImm
/* 0000BD3C 80DF0000 */ lwz r6, 0(r31)
/* 0000BD40 38600080 */ li r3, 0x80
/* 0000BD44 38800001 */ li r4, 1
/* 0000BD48 C0060038 */ lfs f0, 0x38(r6)
/* 0000BD4C 38A00004 */ li r5, 4
/* 0000BD50 C0260034 */ lfs f1, 0x34(r6)
/* 0000BD54 FC000050 */ fneg f0, f0
/* 0000BD58 EF7E0032 */ fmuls f27, f30, f0
/* 0000BD5C EF4106F2 */ fmuls f26, f1, f27
/* 0000BD60 4BFF43FD */ bl GXBegin
/* 0000BD64 FC40D050 */ fneg f2, f26
/* 0000BD68 C03E0014 */ lfs f1, 0x14(r30)
/* 0000BD6C C01E0024 */ lfs f0, 0x24(r30)
/* 0000BD70 FC60D850 */ fneg f3, f27
/* 0000BD74 3B7BFFFF */ addi r27, r27, -1  ;# fixed addi
/* 0000BD78 D05D8000 */ stfs f2, -0x8000(r29)
/* 0000BD7C D37D8000 */ stfs f27, -0x8000(r29)
/* 0000BD80 D3DD8000 */ stfs f30, -0x8000(r29)
/* 0000BD84 D03D8000 */ stfs f1, -0x8000(r29)
/* 0000BD88 D03D8000 */ stfs f1, -0x8000(r29)
/* 0000BD8C D35D8000 */ stfs f26, -0x8000(r29)
/* 0000BD90 D37D8000 */ stfs f27, -0x8000(r29)
/* 0000BD94 D3DD8000 */ stfs f30, -0x8000(r29)
/* 0000BD98 D01D8000 */ stfs f0, -0x8000(r29)
/* 0000BD9C D03D8000 */ stfs f1, -0x8000(r29)
/* 0000BDA0 D35D8000 */ stfs f26, -0x8000(r29)
/* 0000BDA4 D07D8000 */ stfs f3, -0x8000(r29)
/* 0000BDA8 D3DD8000 */ stfs f30, -0x8000(r29)
/* 0000BDAC D01D8000 */ stfs f0, -0x8000(r29)
/* 0000BDB0 D01D8000 */ stfs f0, -0x8000(r29)
/* 0000BDB4 D05D8000 */ stfs f2, -0x8000(r29)
/* 0000BDB8 D07D8000 */ stfs f3, -0x8000(r29)
/* 0000BDBC D3DD8000 */ stfs f30, -0x8000(r29)
/* 0000BDC0 EFDEF828 */ fsubs f30, f30, f31
/* 0000BDC4 D03D8000 */ stfs f1, -0x8000(r29)
/* 0000BDC8 D01D8000 */ stfs f0, -0x8000(r29)
lbl_0000BDCC:
/* 0000BDCC 2C1B0000 */ cmpwi r27, 0
/* 0000BDD0 4181FEE4 */ bgt lbl_0000BCB4
lbl_0000BDD4:
/* 0000BDD4 BB410050 */ lmw r26, 0x50(r1)
/* 0000BDD8 8001009C */ lwz r0, 0x9c(r1)
/* 0000BDDC CBE10090 */ lfd f31, 0x90(r1)
/* 0000BDE0 CBC10088 */ lfd f30, 0x88(r1)
/* 0000BDE4 7C0803A6 */ mtlr r0
/* 0000BDE8 CBA10080 */ lfd f29, 0x80(r1)
/* 0000BDEC CB810078 */ lfd f28, 0x78(r1)
/* 0000BDF0 CB610070 */ lfd f27, 0x70(r1)
/* 0000BDF4 CB410068 */ lfd f26, 0x68(r1)
/* 0000BDF8 38210098 */ addi r1, r1, 0x98
/* 0000BDFC 4E800020 */ blr 
lbl_0000BE00:
/* 0000BE00 7C0802A6 */ mflr r0
/* 0000BE04 90010004 */ stw r0, 4(r1)
/* 0000BE08 9421FFF8 */ stwu r1, -8(r1)
/* 0000BE0C 4BFF4351 */ bl event_finish_all
/* 0000BE10 4BFF434D */ bl func_80044920
/* 0000BE14 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 0000BE18 38630000 */ addi r3, r3, loadingStageIdRequest@l
/* 0000BE1C A8630000 */ lha r3, 0(r3)
/* 0000BE20 4BFF433D */ bl load_stage
/* 0000BE24 38600001 */ li r3, 1
/* 0000BE28 4BFF4335 */ bl event_start
/* 0000BE2C 38600002 */ li r3, 2
/* 0000BE30 4BFF432D */ bl event_start
/* 0000BE34 38600003 */ li r3, 3
/* 0000BE38 4BFF4325 */ bl event_start
/* 0000BE3C 38600004 */ li r3, 4
/* 0000BE40 4BFF431D */ bl event_start
/* 0000BE44 38600009 */ li r3, 9
/* 0000BE48 4BFF4315 */ bl event_start
/* 0000BE4C 38600005 */ li r3, 5
/* 0000BE50 4BFF430D */ bl event_start
/* 0000BE54 38600007 */ li r3, 7
/* 0000BE58 4BFF4305 */ bl event_start
/* 0000BE5C 3860000F */ li r3, 0xf
/* 0000BE60 4BFF42FD */ bl event_start
/* 0000BE64 38600010 */ li r3, 0x10
/* 0000BE68 4BFF42F5 */ bl event_start
/* 0000BE6C 38600012 */ li r3, 0x12
/* 0000BE70 4BFF42ED */ bl event_start
/* 0000BE74 3860000D */ li r3, 0xd
/* 0000BE78 4BFF42E5 */ bl event_start
/* 0000BE7C 38600013 */ li r3, 0x13
/* 0000BE80 4BFF42DD */ bl event_start
/* 0000BE84 8001000C */ lwz r0, 0xc(r1)
/* 0000BE88 38210008 */ addi r1, r1, 8
/* 0000BE8C 7C0803A6 */ mtlr r0
/* 0000BE90 4E800020 */ blr 
lbl_0000BE94:
/* 0000BE94 4E800020 */ blr 
lbl_0000BE98:
/* 0000BE98 7C0802A6 */ mflr r0
/* 0000BE9C 90010004 */ stw r0, 4(r1)
/* 0000BEA0 9421FFF8 */ stwu r1, -8(r1)
/* 0000BEA4 4BFF42B9 */ bl draw_normal_game_scene
/* 0000BEA8 8001000C */ lwz r0, 0xc(r1)
/* 0000BEAC 38210008 */ addi r1, r1, 8
/* 0000BEB0 7C0803A6 */ mtlr r0
/* 0000BEB4 4E800020 */ blr 
lbl_0000BEB8:
/* 0000BEB8 7C0802A6 */ mflr r0
/* 0000BEBC 3C600000 */ lis r3, lbl_10000FA8@ha
/* 0000BEC0 90010004 */ stw r0, 4(r1)
/* 0000BEC4 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000BEC8 93E10014 */ stw r31, 0x14(r1)
/* 0000BECC 3BE30000 */ addi r31, r3, lbl_10000FA8@l
/* 0000BED0 93C10010 */ stw r30, 0x10(r1)
/* 0000BED4 93A1000C */ stw r29, 0xc(r1)
/* 0000BED8 93810008 */ stw r28, 8(r1)
/* 0000BEDC 801F0000 */ lwz r0, 0(r31)
/* 0000BEE0 28000000 */ cmplwi r0, 0
/* 0000BEE4 40820014 */ bne lbl_0000BEF8
/* 0000BEE8 3C600000 */ lis r3, lbl_000148D8@ha
/* 0000BEEC 38630000 */ addi r3, r3, lbl_000148D8@l
/* 0000BEF0 4BFF426D */ bl bitmap_load_tpl
/* 0000BEF4 907F0000 */ stw r3, 0(r31)
lbl_0000BEF8:
/* 0000BEF8 807F0000 */ lwz r3, 0(r31)
/* 0000BEFC 8063000C */ lwz r3, 0xc(r3)
/* 0000BF00 38630020 */ addi r3, r3, 0x20
/* 0000BF04 4BFF4259 */ bl GXGetTexObjWidth
/* 0000BF08 809F0000 */ lwz r4, 0(r31)
/* 0000BF0C 7C7E1B78 */ mr r30, r3
/* 0000BF10 8064000C */ lwz r3, 0xc(r4)
/* 0000BF14 38630020 */ addi r3, r3, 0x20
/* 0000BF18 4BFF4245 */ bl GXGetTexObjHeight
/* 0000BF1C 809F0000 */ lwz r4, 0(r31)
/* 0000BF20 7C7D1B78 */ mr r29, r3
/* 0000BF24 8064000C */ lwz r3, 0xc(r4)
/* 0000BF28 38630020 */ addi r3, r3, 0x20
/* 0000BF2C 4BFF4231 */ bl GXGetTexObjFmt
/* 0000BF30 809F0000 */ lwz r4, 0(r31)
/* 0000BF34 7C7C1B78 */ mr r28, r3
/* 0000BF38 8064000C */ lwz r3, 0xc(r4)
/* 0000BF3C 38630020 */ addi r3, r3, 0x20
/* 0000BF40 4BFF421D */ bl GXGetTexObjData
/* 0000BF44 809F0000 */ lwz r4, 0(r31)
/* 0000BF48 38BE0000 */ addi r5, r30, 0
/* 0000BF4C 38DD0000 */ addi r6, r29, 0
/* 0000BF50 8104000C */ lwz r8, 0xc(r4)
/* 0000BF54 38830000 */ addi r4, r3, 0
/* 0000BF58 38FC0000 */ addi r7, r28, 0
/* 0000BF5C 38680020 */ addi r3, r8, 0x20
/* 0000BF60 39000002 */ li r8, 2
/* 0000BF64 39200002 */ li r9, 2
/* 0000BF68 39400000 */ li r10, 0
/* 0000BF6C 4BFF41F1 */ bl GXInitTexObj
/* 0000BF70 48000141 */ bl lbl_0000C0B0
/* 0000BF74 4BFF41E9 */ bl func_80049FF0
/* 0000BF78 38600002 */ li r3, 2
/* 0000BF7C 4BFF41E1 */ bl camera_set_state
/* 0000BF80 8001001C */ lwz r0, 0x1c(r1)
/* 0000BF84 83E10014 */ lwz r31, 0x14(r1)
/* 0000BF88 83C10010 */ lwz r30, 0x10(r1)
/* 0000BF8C 7C0803A6 */ mtlr r0
/* 0000BF90 83A1000C */ lwz r29, 0xc(r1)
/* 0000BF94 83810008 */ lwz r28, 8(r1)
/* 0000BF98 38210018 */ addi r1, r1, 0x18
/* 0000BF9C 4E800020 */ blr 
lbl_0000BFA0:
/* 0000BFA0 7C0802A6 */ mflr r0
/* 0000BFA4 90010004 */ stw r0, 4(r1)
/* 0000BFA8 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000BFAC 93E1000C */ stw r31, 0xc(r1)
/* 0000BFB0 48000209 */ bl lbl_0000C1B8
/* 0000BFB4 3C600000 */ lis r3, lbl_10000FA8@ha
/* 0000BFB8 3BE30000 */ addi r31, r3, lbl_10000FA8@l
/* 0000BFBC 807F0000 */ lwz r3, 0(r31)
/* 0000BFC0 28030000 */ cmplwi r3, 0
/* 0000BFC4 41820010 */ beq lbl_0000BFD4
/* 0000BFC8 4BFF4195 */ bl bitmap_free_tpl
/* 0000BFCC 38000000 */ li r0, 0
/* 0000BFD0 901F0000 */ stw r0, 0(r31)
lbl_0000BFD4:
/* 0000BFD4 80010014 */ lwz r0, 0x14(r1)
/* 0000BFD8 83E1000C */ lwz r31, 0xc(r1)
/* 0000BFDC 38210010 */ addi r1, r1, 0x10
/* 0000BFE0 7C0803A6 */ mtlr r0
/* 0000BFE4 4E800020 */ blr 
lbl_0000BFE8:
/* 0000BFE8 7C0802A6 */ mflr r0
/* 0000BFEC 90010004 */ stw r0, 4(r1)
/* 0000BFF0 9421FFF8 */ stwu r1, -8(r1)
/* 0000BFF4 4800024D */ bl lbl_0000C240
/* 0000BFF8 4BFF4165 */ bl func_8004A0C8
/* 0000BFFC 8001000C */ lwz r0, 0xc(r1)
/* 0000C000 38210008 */ addi r1, r1, 8
/* 0000C004 7C0803A6 */ mtlr r0
/* 0000C008 4E800020 */ blr 
lbl_0000C00C:
/* 0000C00C 7C0802A6 */ mflr r0
/* 0000C010 90010004 */ stw r0, 4(r1)
/* 0000C014 9421FFF8 */ stwu r1, -8(r1)
/* 0000C018 48000249 */ bl lbl_0000C260
/* 0000C01C 4BFF4141 */ bl draw_normal_game_scene
/* 0000C020 480003D1 */ bl lbl_0000C3F0
/* 0000C024 38600001 */ li r3, 1
/* 0000C028 38800004 */ li r4, 4
/* 0000C02C 38A00005 */ li r5, 5
/* 0000C030 38C00000 */ li r6, 0
/* 0000C034 4BFF4129 */ bl func_8009E110
/* 0000C038 3C600000 */ lis r3, zMode@ha
/* 0000C03C 38630000 */ addi r3, r3, zMode@l
/* 0000C040 80630000 */ lwz r3, 0(r3)
/* 0000C044 88030008 */ lbz r0, 8(r3)
/* 0000C048 28000001 */ cmplwi r0, 1
/* 0000C04C 4082001C */ bne lbl_0000C068
/* 0000C050 80030004 */ lwz r0, 4(r3)
/* 0000C054 2C000001 */ cmpwi r0, 1
/* 0000C058 40820010 */ bne lbl_0000C068
/* 0000C05C 88030000 */ lbz r0, 0(r3)
/* 0000C060 28000001 */ cmplwi r0, 1
/* 0000C064 41820038 */ beq lbl_0000C09C
lbl_0000C068:
/* 0000C068 38600001 */ li r3, 1
/* 0000C06C 38800001 */ li r4, 1
/* 0000C070 38A00001 */ li r5, 1
/* 0000C074 4BFF40E9 */ bl GXSetZMode
/* 0000C078 3C600000 */ lis r3, zMode@ha
/* 0000C07C 38830000 */ addi r4, r3, zMode@l
/* 0000C080 80640000 */ lwz r3, 0(r4)
/* 0000C084 38000001 */ li r0, 1
/* 0000C088 98030000 */ stb r0, 0(r3)
/* 0000C08C 80640000 */ lwz r3, 0(r4)
/* 0000C090 90030004 */ stw r0, 4(r3)
/* 0000C094 80640000 */ lwz r3, 0(r4)
/* 0000C098 98030008 */ stb r0, 8(r3)
lbl_0000C09C:
/* 0000C09C 4BFF40C1 */ bl func_8009AC8C
/* 0000C0A0 8001000C */ lwz r0, 0xc(r1)
/* 0000C0A4 38210008 */ addi r1, r1, 8
/* 0000C0A8 7C0803A6 */ mtlr r0
/* 0000C0AC 4E800020 */ blr 
lbl_0000C0B0:
/* 0000C0B0 7C0802A6 */ mflr r0
/* 0000C0B4 3C600000 */ lis r3, lbl_10000FA8@ha
/* 0000C0B8 90010004 */ stw r0, 4(r1)
/* 0000C0BC 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000C0C0 93E1000C */ stw r31, 0xc(r1)
/* 0000C0C4 3BE30000 */ addi r31, r3, lbl_10000FA8@l
/* 0000C0C8 93C10008 */ stw r30, 8(r1)
/* 0000C0CC 480008B9 */ bl lbl_0000C984
/* 0000C0D0 3BDF2C24 */ addi r30, r31, 0x2c24
/* 0000C0D4 801F2C24 */ lwz r0, 0x2c24(r31)
/* 0000C0D8 28000000 */ cmplwi r0, 0
/* 0000C0DC 40820034 */ bne lbl_0000C110
/* 0000C0E0 38600100 */ li r3, 0x100
/* 0000C0E4 38800100 */ li r4, 0x100
/* 0000C0E8 38A00001 */ li r5, 1
/* 0000C0EC 38C00000 */ li r6, 0
/* 0000C0F0 38E00000 */ li r7, 0
/* 0000C0F4 4BFF4069 */ bl GXGetTexBufferSize
/* 0000C0F8 3C800000 */ lis r4, __OSCurrHeap@ha
/* 0000C0FC 38A40000 */ addi r5, r4, __OSCurrHeap@l
/* 0000C100 38830000 */ addi r4, r3, 0
/* 0000C104 80650000 */ lwz r3, 0(r5)
/* 0000C108 4BFF4055 */ bl OSAllocFromHeap
/* 0000C10C 907E0000 */ stw r3, 0(r30)
lbl_0000C110:
/* 0000C110 809E0000 */ lwz r4, 0(r30)
/* 0000C114 387F2C04 */ addi r3, r31, 0x2c04
/* 0000C118 38A00100 */ li r5, 0x100
/* 0000C11C 38C00100 */ li r6, 0x100
/* 0000C120 38E00001 */ li r7, 1
/* 0000C124 39000000 */ li r8, 0
/* 0000C128 39200000 */ li r9, 0
/* 0000C12C 39400000 */ li r10, 0
/* 0000C130 4BFF402D */ bl GXInitTexObj
/* 0000C134 3BDF2C48 */ addi r30, r31, 0x2c48
/* 0000C138 801F2C48 */ lwz r0, 0x2c48(r31)
/* 0000C13C 28000000 */ cmplwi r0, 0
/* 0000C140 40820034 */ bne lbl_0000C174
/* 0000C144 38600280 */ li r3, 0x280
/* 0000C148 388001E0 */ li r4, 0x1e0
/* 0000C14C 38A00004 */ li r5, 4
/* 0000C150 38C00000 */ li r6, 0
/* 0000C154 38E00000 */ li r7, 0
/* 0000C158 4BFF4005 */ bl GXGetTexBufferSize
/* 0000C15C 3C800000 */ lis r4, __OSCurrHeap@ha
/* 0000C160 38A40000 */ addi r5, r4, __OSCurrHeap@l
/* 0000C164 38830000 */ addi r4, r3, 0
/* 0000C168 80650000 */ lwz r3, 0(r5)
/* 0000C16C 4BFF3FF1 */ bl OSAllocFromHeap
/* 0000C170 907E0000 */ stw r3, 0(r30)
lbl_0000C174:
/* 0000C174 3C600000 */ lis r3, currRenderMode@ha
/* 0000C178 809E0000 */ lwz r4, 0(r30)
/* 0000C17C 80C30000 */ lwz r6, currRenderMode@l(r3)
/* 0000C180 387F2C28 */ addi r3, r31, 0x2c28
/* 0000C184 38E00004 */ li r7, 4
/* 0000C188 A0A60004 */ lhz r5, 4(r6)
/* 0000C18C 39000000 */ li r8, 0
/* 0000C190 A0C60006 */ lhz r6, 6(r6)
/* 0000C194 39200000 */ li r9, 0
/* 0000C198 39400000 */ li r10, 0
/* 0000C19C 4BFF3FC1 */ bl GXInitTexObj
/* 0000C1A0 80010014 */ lwz r0, 0x14(r1)
/* 0000C1A4 83E1000C */ lwz r31, 0xc(r1)
/* 0000C1A8 83C10008 */ lwz r30, 8(r1)
/* 0000C1AC 7C0803A6 */ mtlr r0
/* 0000C1B0 38210010 */ addi r1, r1, 0x10
/* 0000C1B4 4E800020 */ blr 
lbl_0000C1B8:
/* 0000C1B8 7C0802A6 */ mflr r0
/* 0000C1BC 3C600000 */ lis r3, lbl_10003BAC@ha
/* 0000C1C0 90010004 */ stw r0, 4(r1)
/* 0000C1C4 38630000 */ addi r3, r3, lbl_10003BAC@l
/* 0000C1C8 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000C1CC 93E1000C */ stw r31, 0xc(r1)
/* 0000C1D0 3BE30020 */ addi r31, r3, 0x20
/* 0000C1D4 80830020 */ lwz r4, 0x20(r3)
/* 0000C1D8 28040000 */ cmplwi r4, 0
/* 0000C1DC 4182001C */ beq lbl_0000C1F8
/* 0000C1E0 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000C1E4 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000C1E8 80630000 */ lwz r3, 0(r3)
/* 0000C1EC 4BFF3F71 */ bl OSFreeToHeap
/* 0000C1F0 38000000 */ li r0, 0
/* 0000C1F4 901F0000 */ stw r0, 0(r31)
lbl_0000C1F8:
/* 0000C1F8 3C600000 */ lis r3, lbl_10003BAC@ha
/* 0000C1FC 38630000 */ addi r3, r3, lbl_10003BAC@l
/* 0000C200 3BE30044 */ addi r31, r3, 0x44
/* 0000C204 80830044 */ lwz r4, 0x44(r3)
/* 0000C208 28040000 */ cmplwi r4, 0
/* 0000C20C 4182001C */ beq lbl_0000C228
/* 0000C210 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000C214 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000C218 80630000 */ lwz r3, 0(r3)
/* 0000C21C 4BFF3F41 */ bl OSFreeToHeap
/* 0000C220 38000000 */ li r0, 0
/* 0000C224 901F0000 */ stw r0, 0(r31)
lbl_0000C228:
/* 0000C228 480008E5 */ bl lbl_0000CB0C
/* 0000C22C 80010014 */ lwz r0, 0x14(r1)
/* 0000C230 83E1000C */ lwz r31, 0xc(r1)
/* 0000C234 38210010 */ addi r1, r1, 0x10
/* 0000C238 7C0803A6 */ mtlr r0
/* 0000C23C 4E800020 */ blr 
lbl_0000C240:
/* 0000C240 7C0802A6 */ mflr r0
/* 0000C244 90010004 */ stw r0, 4(r1)
/* 0000C248 9421FFF8 */ stwu r1, -8(r1)
/* 0000C24C 480008C5 */ bl lbl_0000CB10
/* 0000C250 8001000C */ lwz r0, 0xc(r1)
/* 0000C254 38210008 */ addi r1, r1, 8
/* 0000C258 7C0803A6 */ mtlr r0
/* 0000C25C 4E800020 */ blr 
lbl_0000C260:
/* 0000C260 7C0802A6 */ mflr r0
/* 0000C264 3C800100 */ lis r4, 0x100
/* 0000C268 90010004 */ stw r0, 4(r1)
/* 0000C26C 3C600000 */ lis r3, lbl_00010150@ha
/* 0000C270 3884FFFF */ addi r4, r4, -1  ;# fixed addi
/* 0000C274 9421FF98 */ stwu r1, -0x68(r1)
/* 0000C278 93E10064 */ stw r31, 0x64(r1)
/* 0000C27C 93C10060 */ stw r30, 0x60(r1)
/* 0000C280 3BC30000 */ addi r30, r3, lbl_00010150@l
/* 0000C284 38610008 */ addi r3, r1, 8
/* 0000C288 801E0000 */ lwz r0, 0(r30)
/* 0000C28C 90010008 */ stw r0, 8(r1)
/* 0000C290 4BFF3ECD */ bl GXSetCopyClear
/* 0000C294 38600000 */ li r3, 0
/* 0000C298 38800000 */ li r4, 0
/* 0000C29C 38A00020 */ li r5, 0x20
/* 0000C2A0 38C00020 */ li r6, 0x20
/* 0000C2A4 4BFF3EB9 */ bl GXSetTexCopySrc
/* 0000C2A8 38600020 */ li r3, 0x20
/* 0000C2AC 38800020 */ li r4, 0x20
/* 0000C2B0 38A00000 */ li r5, 0
/* 0000C2B4 38C00000 */ li r6, 0
/* 0000C2B8 4BFF3EA5 */ bl GXSetTexCopyDst
/* 0000C2BC 3C600000 */ lis r3, lbl_10003BAC@ha
/* 0000C2C0 38630000 */ addi r3, r3, lbl_10003BAC@l
/* 0000C2C4 3BE30020 */ addi r31, r3, 0x20
/* 0000C2C8 80630020 */ lwz r3, 0x20(r3)
/* 0000C2CC 38800001 */ li r4, 1
/* 0000C2D0 4BFF3E8D */ bl GXCopyTex
/* 0000C2D4 C03E0004 */ lfs f1, 4(r30)
/* 0000C2D8 C07E0008 */ lfs f3, 8(r30)
/* 0000C2DC FC400890 */ fmr f2, f1
/* 0000C2E0 C0DE000C */ lfs f6, 0xc(r30)
/* 0000C2E4 FC801890 */ fmr f4, f3
/* 0000C2E8 FCA00890 */ fmr f5, f1
/* 0000C2EC 4BFF3E71 */ bl GXSetViewport
/* 0000C2F0 38600000 */ li r3, 0
/* 0000C2F4 38800000 */ li r4, 0
/* 0000C2F8 38A00100 */ li r5, 0x100
/* 0000C2FC 38C00100 */ li r6, 0x100
/* 0000C300 4BFF3E5D */ bl GXSetScissor
/* 0000C304 C03E0010 */ lfs f1, 0x10(r30)
/* 0000C308 3861000C */ addi r3, r1, 0xc
/* 0000C30C C05E0014 */ lfs f2, 0x14(r30)
/* 0000C310 C07E0018 */ lfs f3, 0x18(r30)
/* 0000C314 C09E001C */ lfs f4, 0x1c(r30)
/* 0000C318 4BFF3E45 */ bl C_MTXPerspective
/* 0000C31C 3861000C */ addi r3, r1, 0xc
/* 0000C320 38800000 */ li r4, 0
/* 0000C324 4BFF3E39 */ bl GXSetProjection
/* 0000C328 48000AB9 */ bl lbl_0000CDE0
/* 0000C32C 38600000 */ li r3, 0
/* 0000C330 38800000 */ li r4, 0
/* 0000C334 38A00100 */ li r5, 0x100
/* 0000C338 38C00100 */ li r6, 0x100
/* 0000C33C 4BFF3E21 */ bl GXSetTexCopySrc
/* 0000C340 38600100 */ li r3, 0x100
/* 0000C344 38800100 */ li r4, 0x100
/* 0000C348 38A00028 */ li r5, 0x28
/* 0000C34C 38C00000 */ li r6, 0
/* 0000C350 4BFF3E0D */ bl GXSetTexCopyDst
/* 0000C354 807F0000 */ lwz r3, 0(r31)
/* 0000C358 38800001 */ li r4, 1
/* 0000C35C 4BFF3E01 */ bl GXCopyTex
/* 0000C360 3C600000 */ lis r3, currRenderMode@ha
/* 0000C364 C03E0004 */ lfs f1, 4(r30)
/* 0000C368 3BE30000 */ addi r31, r3, currRenderMode@l
/* 0000C36C C0DE000C */ lfs f6, 0xc(r30)
/* 0000C370 80DF0000 */ lwz r6, 0(r31)
/* 0000C374 3CA00000 */ lis r5, lbl_00010170@ha
/* 0000C378 3C600000 */ lis r3, lbl_00010170@ha
/* 0000C37C C8E50000 */ lfd f7, lbl_00010170@l(r5)
/* 0000C380 A0860004 */ lhz r4, 4(r6)
/* 0000C384 A0060008 */ lhz r0, 8(r6)
/* 0000C388 FC400890 */ fmr f2, f1
/* 0000C38C 9081005C */ stw r4, 0x5c(r1)
/* 0000C390 3C804330 */ lis r4, 0x4330
/* 0000C394 C8830000 */ lfd f4, lbl_00010170@l(r3)
/* 0000C398 90010054 */ stw r0, 0x54(r1)
/* 0000C39C FCA00890 */ fmr f5, f1
/* 0000C3A0 90810058 */ stw r4, 0x58(r1)
/* 0000C3A4 90810050 */ stw r4, 0x50(r1)
/* 0000C3A8 C8610058 */ lfd f3, 0x58(r1)
/* 0000C3AC C8010050 */ lfd f0, 0x50(r1)
/* 0000C3B0 EC633828 */ fsubs f3, f3, f7
/* 0000C3B4 EC802028 */ fsubs f4, f0, f4
/* 0000C3B8 4BFF3DA5 */ bl GXSetViewport
/* 0000C3BC 80DF0000 */ lwz r6, 0(r31)
/* 0000C3C0 38600000 */ li r3, 0
/* 0000C3C4 38800000 */ li r4, 0
/* 0000C3C8 A0A60004 */ lhz r5, 4(r6)
/* 0000C3CC A0C60006 */ lhz r6, 6(r6)
/* 0000C3D0 4BFF3D8D */ bl GXSetScissor
/* 0000C3D4 4BFF3D89 */ bl func_800188D4
/* 0000C3D8 8001006C */ lwz r0, 0x6c(r1)
/* 0000C3DC 83E10064 */ lwz r31, 0x64(r1)
/* 0000C3E0 83C10060 */ lwz r30, 0x60(r1)
/* 0000C3E4 7C0803A6 */ mtlr r0
/* 0000C3E8 38210068 */ addi r1, r1, 0x68
/* 0000C3EC 4E800020 */ blr 
lbl_0000C3F0:
/* 0000C3F0 7C0802A6 */ mflr r0
/* 0000C3F4 3C600000 */ lis r3, lbl_00010150@ha
/* 0000C3F8 90010004 */ stw r0, 4(r1)
/* 0000C3FC 9421FF60 */ stwu r1, -0xa0(r1)
/* 0000C400 BF61008C */ stmw r27, 0x8c(r1)
/* 0000C404 3BE30000 */ addi r31, r3, lbl_00010150@l
/* 0000C408 3C600000 */ lis r3, lbl_10000FA8@ha
/* 0000C40C 3BA30000 */ addi r29, r3, lbl_10000FA8@l
/* 0000C410 38610040 */ addi r3, r1, 0x40
/* 0000C414 C03F0010 */ lfs f1, 0x10(r31)
/* 0000C418 C05F0014 */ lfs f2, 0x14(r31)
/* 0000C41C C07F0018 */ lfs f3, 0x18(r31)
/* 0000C420 C09F001C */ lfs f4, 0x1c(r31)
/* 0000C424 4BFF3D39 */ bl C_MTXPerspective
/* 0000C428 38610040 */ addi r3, r1, 0x40
/* 0000C42C 38800000 */ li r4, 0
/* 0000C430 4BFF3D2D */ bl GXSetProjection
/* 0000C434 3C600000 */ lis r3, currRenderMode@ha
/* 0000C438 3BC30000 */ addi r30, r3, currRenderMode@l
/* 0000C43C 80BE0000 */ lwz r5, 0(r30)
/* 0000C440 38600000 */ li r3, 0
/* 0000C444 38800000 */ li r4, 0
/* 0000C448 A3850004 */ lhz r28, 4(r5)
/* 0000C44C A3650006 */ lhz r27, 6(r5)
/* 0000C450 38BC0000 */ addi r5, r28, 0
/* 0000C454 38DB0000 */ addi r6, r27, 0
/* 0000C458 4BFF3D05 */ bl GXSetTexCopySrc
/* 0000C45C 387C0000 */ addi r3, r28, 0
/* 0000C460 389B0000 */ addi r4, r27, 0
/* 0000C464 38A00004 */ li r5, 4
/* 0000C468 38C00000 */ li r6, 0
/* 0000C46C 4BFF3CF1 */ bl GXSetTexCopyDst
/* 0000C470 807D2C48 */ lwz r3, 0x2c48(r29)
/* 0000C474 38800000 */ li r4, 0
/* 0000C478 4BFF3CE5 */ bl GXCopyTex
/* 0000C47C 38600000 */ li r3, 0
/* 0000C480 4BFF3CDD */ bl GXSetNumChans
/* 0000C484 4BFF3CD9 */ bl GXInvalidateTexAll
/* 0000C488 387D2C04 */ addi r3, r29, 0x2c04
/* 0000C48C 38800000 */ li r4, 0
/* 0000C490 4BFF3CCD */ bl func_8009F430
/* 0000C494 387D2C28 */ addi r3, r29, 0x2c28
/* 0000C498 38800001 */ li r4, 1
/* 0000C49C 4BFF3CC1 */ bl func_8009F430
/* 0000C4A0 807D0000 */ lwz r3, 0(r29)
/* 0000C4A4 38800002 */ li r4, 2
/* 0000C4A8 8063000C */ lwz r3, 0xc(r3)
/* 0000C4AC 38630020 */ addi r3, r3, 0x20
/* 0000C4B0 4BFF3CAD */ bl func_8009F430
/* 0000C4B4 38600000 */ li r3, 0
/* 0000C4B8 38800000 */ li r4, 0
/* 0000C4BC 38A00000 */ li r5, 0
/* 0000C4C0 38C0001E */ li r6, 0x1e
/* 0000C4C4 38E00000 */ li r7, 0
/* 0000C4C8 3900007D */ li r8, 0x7d
/* 0000C4CC 4BFF3C91 */ bl GXSetTexCoordGen2
/* 0000C4D0 38600001 */ li r3, 1
/* 0000C4D4 38800000 */ li r4, 0
/* 0000C4D8 38A00000 */ li r5, 0
/* 0000C4DC 38C0001E */ li r6, 0x1e
/* 0000C4E0 38E00000 */ li r7, 0
/* 0000C4E4 3900007D */ li r8, 0x7d
/* 0000C4E8 4BFF3C75 */ bl GXSetTexCoordGen2
/* 0000C4EC 4BFF3C71 */ bl mathutil_mtxA_from_identity
/* 0000C4F0 3C600000 */ lis r3, mathutilData@ha
/* 0000C4F4 C01F0028 */ lfs f0, 0x28(r31)
/* 0000C4F8 38E30000 */ addi r7, r3, mathutilData@l
/* 0000C4FC 80870000 */ lwz r4, 0(r7)
/* 0000C500 3C600000 */ lis r3, lbl_00010170@ha
/* 0000C504 3C004330 */ lis r0, 0x4330
/* 0000C508 D0040000 */ stfs f0, 0(r4)
/* 0000C50C 3880001E */ li r4, 0x1e
/* 0000C510 38A00000 */ li r5, 0
/* 0000C514 C01F002C */ lfs f0, 0x2c(r31)
/* 0000C518 80C70000 */ lwz r6, 0(r7)
/* 0000C51C D0060008 */ stfs f0, 8(r6)
/* 0000C520 C01F0030 */ lfs f0, 0x30(r31)
/* 0000C524 80C70000 */ lwz r6, 0(r7)
/* 0000C528 D0060014 */ stfs f0, 0x14(r6)
/* 0000C52C 80DE0000 */ lwz r6, 0(r30)
/* 0000C530 C8230000 */ lfd f1, lbl_00010170@l(r3)
/* 0000C534 A0660006 */ lhz r3, 6(r6)
/* 0000C538 C05F002C */ lfs f2, 0x2c(r31)
/* 0000C53C 90610084 */ stw r3, 0x84(r1)
/* 0000C540 80670000 */ lwz r3, 0(r7)
/* 0000C544 90010080 */ stw r0, 0x80(r1)
/* 0000C548 C8010080 */ lfd f0, 0x80(r1)
/* 0000C54C EC000828 */ fsubs f0, f0, f1
/* 0000C550 EC020024 */ fdivs f0, f2, f0
/* 0000C554 EC020028 */ fsubs f0, f2, f0
/* 0000C558 D0030018 */ stfs f0, 0x18(r3)
/* 0000C55C 80670000 */ lwz r3, 0(r7)
/* 0000C560 4BFF3BFD */ bl GXLoadTexMtxImm
/* 0000C564 38600000 */ li r3, 0
/* 0000C568 38800000 */ li r4, 0
/* 0000C56C 38A00001 */ li r5, 1
/* 0000C570 38C000FF */ li r6, 0xff
/* 0000C574 4BFF3BE9 */ bl func_8009EFF4
/* 0000C578 38600000 */ li r3, 0
/* 0000C57C 3880000F */ li r4, 0xf
/* 0000C580 38A0000F */ li r5, 0xf
/* 0000C584 38C0000F */ li r6, 0xf
/* 0000C588 38E00008 */ li r7, 8
/* 0000C58C 4BFF3BD1 */ bl func_8009E618
/* 0000C590 38600000 */ li r3, 0
/* 0000C594 38800000 */ li r4, 0
/* 0000C598 38A00000 */ li r5, 0
/* 0000C59C 38C00000 */ li r6, 0
/* 0000C5A0 38E00001 */ li r7, 1
/* 0000C5A4 39000000 */ li r8, 0
/* 0000C5A8 4BFF3BB5 */ bl func_8009E800
/* 0000C5AC 38600000 */ li r3, 0
/* 0000C5B0 38800007 */ li r4, 7
/* 0000C5B4 38A00007 */ li r5, 7
/* 0000C5B8 38C00007 */ li r6, 7
/* 0000C5BC 38E00006 */ li r7, 6
/* 0000C5C0 4BFF3B9D */ bl func_8009E70C
/* 0000C5C4 38600000 */ li r3, 0
/* 0000C5C8 38800000 */ li r4, 0
/* 0000C5CC 38A00000 */ li r5, 0
/* 0000C5D0 38C00000 */ li r6, 0
/* 0000C5D4 38E00001 */ li r7, 1
/* 0000C5D8 39000000 */ li r8, 0
/* 0000C5DC 4BFF3B81 */ bl func_8009E918
/* 0000C5E0 38600000 */ li r3, 0
/* 0000C5E4 38800001 */ li r4, 1
/* 0000C5E8 38A00000 */ li r5, 0
/* 0000C5EC 4BFF3B71 */ bl GXSetIndTexOrder
/* 0000C5F0 3BC00000 */ li r30, 0
/* 0000C5F4 93C10008 */ stw r30, 8(r1)
/* 0000C5F8 38600000 */ li r3, 0
/* 0000C5FC 38800000 */ li r4, 0
/* 0000C600 93C1000C */ stw r30, 0xc(r1)
/* 0000C604 38A00000 */ li r5, 0
/* 0000C608 38C00000 */ li r6, 0
/* 0000C60C 38E00001 */ li r7, 1
/* 0000C610 39000000 */ li r8, 0
/* 0000C614 39200000 */ li r9, 0
/* 0000C618 39400000 */ li r10, 0
/* 0000C61C 4BFF3B41 */ bl GXSetTevIndirect
/* 0000C620 C01F0034 */ lfs f0, 0x34(r31)
/* 0000C624 38810028 */ addi r4, r1, 0x28
/* 0000C628 38600001 */ li r3, 1
/* 0000C62C D0010028 */ stfs f0, 0x28(r1)
/* 0000C630 38A00000 */ li r5, 0
/* 0000C634 C01F0004 */ lfs f0, 4(r31)
/* 0000C638 D001002C */ stfs f0, 0x2c(r1)
/* 0000C63C C01F0004 */ lfs f0, 4(r31)
/* 0000C640 D0010030 */ stfs f0, 0x30(r1)
/* 0000C644 C01F0034 */ lfs f0, 0x34(r31)
/* 0000C648 D0010034 */ stfs f0, 0x34(r1)
/* 0000C64C C01F0004 */ lfs f0, 4(r31)
/* 0000C650 D0010038 */ stfs f0, 0x38(r1)
/* 0000C654 C01F0004 */ lfs f0, 4(r31)
/* 0000C658 D001003C */ stfs f0, 0x3c(r1)
/* 0000C65C 4BFF3B01 */ bl GXSetIndTexMtx
/* 0000C660 38600002 */ li r3, 2
/* 0000C664 38800001 */ li r4, 1
/* 0000C668 38A00004 */ li r5, 4
/* 0000C66C 38C0003C */ li r6, 0x3c
/* 0000C670 38E00000 */ li r7, 0
/* 0000C674 3900007D */ li r8, 0x7d
/* 0000C678 4BFF3AE5 */ bl GXSetTexCoordGen2
/* 0000C67C 38600001 */ li r3, 1
/* 0000C680 38800002 */ li r4, 2
/* 0000C684 38A00002 */ li r5, 2
/* 0000C688 38C000FF */ li r6, 0xff
/* 0000C68C 4BFF3AD1 */ bl func_8009EFF4
/* 0000C690 38600001 */ li r3, 1
/* 0000C694 38800008 */ li r4, 8
/* 0000C698 38A0000F */ li r5, 0xf
/* 0000C69C 38C0000F */ li r6, 0xf
/* 0000C6A0 38E00000 */ li r7, 0
/* 0000C6A4 4BFF3AB9 */ bl func_8009E618
/* 0000C6A8 38600001 */ li r3, 1
/* 0000C6AC 38800000 */ li r4, 0
/* 0000C6B0 38A00000 */ li r5, 0
/* 0000C6B4 38C00000 */ li r6, 0
/* 0000C6B8 38E00001 */ li r7, 1
/* 0000C6BC 39000000 */ li r8, 0
/* 0000C6C0 4BFF3A9D */ bl func_8009E800
/* 0000C6C4 38600001 */ li r3, 1
/* 0000C6C8 38800007 */ li r4, 7
/* 0000C6CC 38A00007 */ li r5, 7
/* 0000C6D0 38C00007 */ li r6, 7
/* 0000C6D4 38E00006 */ li r7, 6
/* 0000C6D8 4BFF3A85 */ bl func_8009E70C
/* 0000C6DC 38600001 */ li r3, 1
/* 0000C6E0 38800000 */ li r4, 0
/* 0000C6E4 38A00000 */ li r5, 0
/* 0000C6E8 38C00000 */ li r6, 0
/* 0000C6EC 38E00001 */ li r7, 1
/* 0000C6F0 39000000 */ li r8, 0
/* 0000C6F4 4BFF3A69 */ bl func_8009E918
/* 0000C6F8 93C10008 */ stw r30, 8(r1)
/* 0000C6FC 38600001 */ li r3, 1
/* 0000C700 38800000 */ li r4, 0
/* 0000C704 93C1000C */ stw r30, 0xc(r1)
/* 0000C708 38A00000 */ li r5, 0
/* 0000C70C 38C00000 */ li r6, 0
/* 0000C710 38E00002 */ li r7, 2
/* 0000C714 39000000 */ li r8, 0
/* 0000C718 39200000 */ li r9, 0
/* 0000C71C 39400000 */ li r10, 0
/* 0000C720 4BFF3A3D */ bl GXSetTevIndirect
/* 0000C724 C01F002C */ lfs f0, 0x2c(r31)
/* 0000C728 38810010 */ addi r4, r1, 0x10
/* 0000C72C 38600002 */ li r3, 2
/* 0000C730 D0010010 */ stfs f0, 0x10(r1)
/* 0000C734 38A00000 */ li r5, 0
/* 0000C738 C01F0004 */ lfs f0, 4(r31)
/* 0000C73C D0010014 */ stfs f0, 0x14(r1)
/* 0000C740 C01F0004 */ lfs f0, 4(r31)
/* 0000C744 D0010018 */ stfs f0, 0x18(r1)
/* 0000C748 C01F0038 */ lfs f0, 0x38(r31)
/* 0000C74C D001001C */ stfs f0, 0x1c(r1)
/* 0000C750 C01F0004 */ lfs f0, 4(r31)
/* 0000C754 D0010020 */ stfs f0, 0x20(r1)
/* 0000C758 C01F0004 */ lfs f0, 4(r31)
/* 0000C75C D0010024 */ stfs f0, 0x24(r1)
/* 0000C760 4BFF39FD */ bl GXSetIndTexMtx
/* 0000C764 38600002 */ li r3, 2
/* 0000C768 38800000 */ li r4, 0
/* 0000C76C 38A00001 */ li r5, 1
/* 0000C770 4BFF39ED */ bl func_8009E2C8
/* 0000C774 38600002 */ li r3, 2
/* 0000C778 38800001 */ li r4, 1
/* 0000C77C 38A00000 */ li r5, 0
/* 0000C780 38C000FF */ li r6, 0xff
/* 0000C784 4BFF39D9 */ bl func_8009EFF4
/* 0000C788 38600002 */ li r3, 2
/* 0000C78C 3880000F */ li r4, 0xf
/* 0000C790 38A0000F */ li r5, 0xf
/* 0000C794 38C0000F */ li r6, 0xf
/* 0000C798 38E00000 */ li r7, 0
/* 0000C79C 4BFF39C1 */ bl func_8009E618
/* 0000C7A0 38600002 */ li r3, 2
/* 0000C7A4 38800000 */ li r4, 0
/* 0000C7A8 38A00000 */ li r5, 0
/* 0000C7AC 38C00000 */ li r6, 0
/* 0000C7B0 38E00001 */ li r7, 1
/* 0000C7B4 39000000 */ li r8, 0
/* 0000C7B8 4BFF39A5 */ bl func_8009E800
/* 0000C7BC 38600002 */ li r3, 2
/* 0000C7C0 38800007 */ li r4, 7
/* 0000C7C4 38A00007 */ li r5, 7
/* 0000C7C8 38C00007 */ li r6, 7
/* 0000C7CC 38E00004 */ li r7, 4
/* 0000C7D0 4BFF398D */ bl func_8009E70C
/* 0000C7D4 38600002 */ li r3, 2
/* 0000C7D8 38800000 */ li r4, 0
/* 0000C7DC 38A00000 */ li r5, 0
/* 0000C7E0 38C00000 */ li r6, 0
/* 0000C7E4 38E00001 */ li r7, 1
/* 0000C7E8 39000000 */ li r8, 0
/* 0000C7EC 4BFF3971 */ bl func_8009E918
/* 0000C7F0 38600003 */ li r3, 3
/* 0000C7F4 4BFF3969 */ bl func_8009F2C8
/* 0000C7F8 38600003 */ li r3, 3
/* 0000C7FC 4BFF3961 */ bl GXSetNumTexGens
/* 0000C800 38600001 */ li r3, 1
/* 0000C804 4BFF3959 */ bl GXSetNumIndStages
/* 0000C808 38600000 */ li r3, 0
/* 0000C80C 38800001 */ li r4, 1
/* 0000C810 38A00000 */ li r5, 0
/* 0000C814 38C00000 */ li r6, 0
/* 0000C818 4BFF3945 */ bl func_8009E110
/* 0000C81C 3C600000 */ lis r3, zMode@ha
/* 0000C820 38630000 */ addi r3, r3, zMode@l
/* 0000C824 80630000 */ lwz r3, 0(r3)
/* 0000C828 88030008 */ lbz r0, 8(r3)
/* 0000C82C 28000000 */ cmplwi r0, 0
/* 0000C830 4082001C */ bne lbl_0000C84C
/* 0000C834 80030004 */ lwz r0, 4(r3)
/* 0000C838 2C000007 */ cmpwi r0, 7
/* 0000C83C 40820010 */ bne lbl_0000C84C
/* 0000C840 88030000 */ lbz r0, 0(r3)
/* 0000C844 28000001 */ cmplwi r0, 1
/* 0000C848 41820040 */ beq lbl_0000C888
lbl_0000C84C:
/* 0000C84C 38600001 */ li r3, 1
/* 0000C850 38800007 */ li r4, 7
/* 0000C854 38A00000 */ li r5, 0
/* 0000C858 4BFF3905 */ bl GXSetZMode
/* 0000C85C 3C600000 */ lis r3, zMode@ha
/* 0000C860 38A30000 */ addi r5, r3, zMode@l
/* 0000C864 80650000 */ lwz r3, 0(r5)
/* 0000C868 38000001 */ li r0, 1
/* 0000C86C 38800007 */ li r4, 7
/* 0000C870 98030000 */ stb r0, 0(r3)
/* 0000C874 38000000 */ li r0, 0
/* 0000C878 80650000 */ lwz r3, 0(r5)
/* 0000C87C 90830004 */ stw r4, 4(r3)
/* 0000C880 80650000 */ lwz r3, 0(r5)
/* 0000C884 98030008 */ stb r0, 8(r3)
lbl_0000C888:
/* 0000C888 4BFF38D5 */ bl func_8009AC8C
/* 0000C88C 38602200 */ li r3, 0x2200
/* 0000C890 4BFF38CD */ bl gxutil_set_vtx_attrs
/* 0000C894 38600006 */ li r3, 6
/* 0000C898 38800009 */ li r4, 9
/* 0000C89C 38A00001 */ li r5, 1
/* 0000C8A0 38C00004 */ li r6, 4
/* 0000C8A4 38E00000 */ li r7, 0
/* 0000C8A8 4BFF38B5 */ bl GXSetVtxAttrFmt
/* 0000C8AC 38600006 */ li r3, 6
/* 0000C8B0 3880000D */ li r4, 0xd
/* 0000C8B4 38A00001 */ li r5, 1
/* 0000C8B8 38C00004 */ li r6, 4
/* 0000C8BC 38E00000 */ li r7, 0
/* 0000C8C0 4BFF389D */ bl GXSetVtxAttrFmt
/* 0000C8C4 4BFF3899 */ bl mathutil_mtxA_from_identity
/* 0000C8C8 3C600000 */ lis r3, mathutilData@ha
/* 0000C8CC 38630000 */ addi r3, r3, mathutilData@l
/* 0000C8D0 80630000 */ lwz r3, 0(r3)
/* 0000C8D4 38800000 */ li r4, 0
/* 0000C8D8 4BFF3885 */ bl GXLoadPosMtxImm
/* 0000C8DC 38600080 */ li r3, 0x80
/* 0000C8E0 38800006 */ li r4, 6
/* 0000C8E4 38A00004 */ li r5, 4
/* 0000C8E8 4BFF3875 */ bl GXBegin
/* 0000C8EC C0DF003C */ lfs f6, 0x3c(r31)
/* 0000C8F0 3C80CC01 */ lis r4, 0xcc01
/* 0000C8F4 C0BF0040 */ lfs f5, 0x40(r31)
/* 0000C8F8 38600000 */ li r3, 0
/* 0000C8FC D0C48000 */ stfs f6, -0x8000(r4)
/* 0000C900 C09F0044 */ lfs f4, 0x44(r31)
/* 0000C904 D0A48000 */ stfs f5, -0x8000(r4)
/* 0000C908 C07F0004 */ lfs f3, 4(r31)
/* 0000C90C D0848000 */ stfs f4, -0x8000(r4)
/* 0000C910 C05F0048 */ lfs f2, 0x48(r31)
/* 0000C914 D0648000 */ stfs f3, -0x8000(r4)
/* 0000C918 C03F004C */ lfs f1, 0x4c(r31)
/* 0000C91C D0648000 */ stfs f3, -0x8000(r4)
/* 0000C920 C01F0050 */ lfs f0, 0x50(r31)
/* 0000C924 D0448000 */ stfs f2, -0x8000(r4)
/* 0000C928 D0A48000 */ stfs f5, -0x8000(r4)
/* 0000C92C D0848000 */ stfs f4, -0x8000(r4)
/* 0000C930 D0248000 */ stfs f1, -0x8000(r4)
/* 0000C934 D0648000 */ stfs f3, -0x8000(r4)
/* 0000C938 D0448000 */ stfs f2, -0x8000(r4)
/* 0000C93C D0048000 */ stfs f0, -0x8000(r4)
/* 0000C940 D0848000 */ stfs f4, -0x8000(r4)
/* 0000C944 D0248000 */ stfs f1, -0x8000(r4)
/* 0000C948 D0248000 */ stfs f1, -0x8000(r4)
/* 0000C94C D0C48000 */ stfs f6, -0x8000(r4)
/* 0000C950 D0048000 */ stfs f0, -0x8000(r4)
/* 0000C954 D0848000 */ stfs f4, -0x8000(r4)
/* 0000C958 D0648000 */ stfs f3, -0x8000(r4)
/* 0000C95C D0248000 */ stfs f1, -0x8000(r4)
/* 0000C960 4BFF37FD */ bl GXSetTevDirect
/* 0000C964 38600000 */ li r3, 0
/* 0000C968 4BFF37F5 */ bl GXSetNumIndStages
/* 0000C96C 4BFF37F1 */ bl func_800188D4
/* 0000C970 BB61008C */ lmw r27, 0x8c(r1)
/* 0000C974 800100A4 */ lwz r0, 0xa4(r1)
/* 0000C978 382100A0 */ addi r1, r1, 0xa0
/* 0000C97C 7C0803A6 */ mtlr r0
/* 0000C980 4E800020 */ blr 
lbl_0000C984:
/* 0000C984 7C0802A6 */ mflr r0
/* 0000C988 3C600000 */ lis r3, lbl_10000FAC@ha
/* 0000C98C 90010004 */ stw r0, 4(r1)
/* 0000C990 38030000 */ addi r0, r3, lbl_10000FAC@l
/* 0000C994 3C600000 */ lis r3, lbl_00010150@ha
/* 0000C998 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000C99C 93E10034 */ stw r31, 0x34(r1)
/* 0000C9A0 3FE04330 */ lis r31, 0x4330
/* 0000C9A4 93C10030 */ stw r30, 0x30(r1)
/* 0000C9A8 3BC30000 */ addi r30, r3, lbl_00010150@l
/* 0000C9AC 93A1002C */ stw r29, 0x2c(r1)
/* 0000C9B0 3BA00100 */ li r29, 0x100
/* 0000C9B4 93810028 */ stw r28, 0x28(r1)
/* 0000C9B8 7C1C0378 */ mr r28, r0
lbl_0000C9BC:
/* 0000C9BC 4BFF37A1 */ bl rand
/* 0000C9C0 6C608000 */ xoris r0, r3, 0x8000
/* 0000C9C4 C05E0058 */ lfs f2, 0x58(r30)
/* 0000C9C8 90010024 */ stw r0, 0x24(r1)
/* 0000C9CC 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000C9D0 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000C9D4 93E10020 */ stw r31, 0x20(r1)
/* 0000C9D8 C03E002C */ lfs f1, 0x2c(r30)
/* 0000C9DC C8610020 */ lfd f3, 0x20(r1)
/* 0000C9E0 C01E0054 */ lfs f0, 0x54(r30)
/* 0000C9E4 EC632028 */ fsubs f3, f3, f4
/* 0000C9E8 EC431024 */ fdivs f2, f3, f2
/* 0000C9EC EC220828 */ fsubs f1, f2, f1
/* 0000C9F0 EC000072 */ fmuls f0, f0, f1
/* 0000C9F4 D01C0000 */ stfs f0, 0(r28)
/* 0000C9F8 4BFF3765 */ bl rand
/* 0000C9FC 6C608000 */ xoris r0, r3, 0x8000
/* 0000CA00 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CA04 9001001C */ stw r0, 0x1c(r1)
/* 0000CA08 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CA0C C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CA10 93E10018 */ stw r31, 0x18(r1)
/* 0000CA14 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CA18 C8610018 */ lfd f3, 0x18(r1)
/* 0000CA1C C01E005C */ lfs f0, 0x5c(r30)
/* 0000CA20 EC632028 */ fsubs f3, f3, f4
/* 0000CA24 EC431024 */ fdivs f2, f3, f2
/* 0000CA28 EC220828 */ fsubs f1, f2, f1
/* 0000CA2C EC000072 */ fmuls f0, f0, f1
/* 0000CA30 D01C0004 */ stfs f0, 4(r28)
/* 0000CA34 C01E0004 */ lfs f0, 4(r30)
/* 0000CA38 D01C000C */ stfs f0, 0xc(r28)
/* 0000CA3C C01E0004 */ lfs f0, 4(r30)
/* 0000CA40 D01C0010 */ stfs f0, 0x10(r28)
/* 0000CA44 4BFF3719 */ bl rand
/* 0000CA48 7C600734 */ extsh r0, r3
/* 0000CA4C B01C001C */ sth r0, 0x1c(r28)
/* 0000CA50 4BFF370D */ bl rand
/* 0000CA54 6C608000 */ xoris r0, r3, 0x8000
/* 0000CA58 C07E0058 */ lfs f3, 0x58(r30)
/* 0000CA5C 90010014 */ stw r0, 0x14(r1)
/* 0000CA60 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CA64 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CA68 93E10010 */ stw r31, 0x10(r1)
/* 0000CA6C C05E0064 */ lfs f2, 0x64(r30)
/* 0000CA70 C8010010 */ lfd f0, 0x10(r1)
/* 0000CA74 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CA78 EC802028 */ fsubs f4, f0, f4
/* 0000CA7C C01E0060 */ lfs f0, 0x60(r30)
/* 0000CA80 EC641824 */ fdivs f3, f4, f3
/* 0000CA84 EC4200F2 */ fmuls f2, f2, f3
/* 0000CA88 EC21102A */ fadds f1, f1, f2
/* 0000CA8C EC000072 */ fmuls f0, f0, f1
/* 0000CA90 D01C0020 */ stfs f0, 0x20(r28)
/* 0000CA94 4BFF36C9 */ bl rand
/* 0000CA98 6C608000 */ xoris r0, r3, 0x8000
/* 0000CA9C C07E0058 */ lfs f3, 0x58(r30)
/* 0000CAA0 9001000C */ stw r0, 0xc(r1)
/* 0000CAA4 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CAA8 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CAAC 37BDFFFF */ addic. r29, r29, -1  ;# fixed addi
/* 0000CAB0 93E10008 */ stw r31, 8(r1)
/* 0000CAB4 C05E0064 */ lfs f2, 0x64(r30)
/* 0000CAB8 C8010008 */ lfd f0, 8(r1)
/* 0000CABC C03E002C */ lfs f1, 0x2c(r30)
/* 0000CAC0 EC802028 */ fsubs f4, f0, f4
/* 0000CAC4 C01E0060 */ lfs f0, 0x60(r30)
/* 0000CAC8 EC641824 */ fdivs f3, f4, f3
/* 0000CACC EC4200F2 */ fmuls f2, f2, f3
/* 0000CAD0 EC21102A */ fadds f1, f1, f2
/* 0000CAD4 EC000072 */ fmuls f0, f0, f1
/* 0000CAD8 D01C0024 */ stfs f0, 0x24(r28)
/* 0000CADC C01E000C */ lfs f0, 0xc(r30)
/* 0000CAE0 D01C0028 */ stfs f0, 0x28(r28)
/* 0000CAE4 3B9C002C */ addi r28, r28, 0x2c
/* 0000CAE8 4181FED4 */ bgt lbl_0000C9BC
/* 0000CAEC 8001003C */ lwz r0, 0x3c(r1)
/* 0000CAF0 83E10034 */ lwz r31, 0x34(r1)
/* 0000CAF4 83C10030 */ lwz r30, 0x30(r1)
/* 0000CAF8 7C0803A6 */ mtlr r0
/* 0000CAFC 83A1002C */ lwz r29, 0x2c(r1)
/* 0000CB00 83810028 */ lwz r28, 0x28(r1)
/* 0000CB04 38210038 */ addi r1, r1, 0x38
/* 0000CB08 4E800020 */ blr 
lbl_0000CB0C:
/* 0000CB0C 4E800020 */ blr 
lbl_0000CB10:
/* 0000CB10 7C0802A6 */ mflr r0
/* 0000CB14 3C600000 */ lis r3, lbl_10000FAC@ha
/* 0000CB18 90010004 */ stw r0, 4(r1)
/* 0000CB1C 38030000 */ addi r0, r3, lbl_10000FAC@l
/* 0000CB20 3CA00000 */ lis r5, lbl_00010150@ha
/* 0000CB24 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000CB28 3C600000 */ lis r3, globalFrameCounter@ha
/* 0000CB2C 3C800000 */ lis r4, controllerInfo@ha
/* 0000CB30 BF410020 */ stmw r26, 0x20(r1)
/* 0000CB34 7C1C0378 */ mr r28, r0
/* 0000CB38 3BC50000 */ addi r30, r5, lbl_00010150@l
/* 0000CB3C 3B430000 */ addi r26, r3, globalFrameCounter@l
/* 0000CB40 3BE40000 */ addi r31, r4, controllerInfo@l
/* 0000CB44 3BA00100 */ li r29, 0x100
/* 0000CB48 3F604330 */ lis r27, 0x4330
lbl_0000CB4C:
/* 0000CB4C C03C000C */ lfs f1, 0xc(r28)
/* 0000CB50 C01E0070 */ lfs f0, 0x70(r30)
/* 0000CB54 EC010032 */ fmuls f0, f1, f0
/* 0000CB58 D01C000C */ stfs f0, 0xc(r28)
/* 0000CB5C C03C0010 */ lfs f1, 0x10(r28)
/* 0000CB60 C01E0070 */ lfs f0, 0x70(r30)
/* 0000CB64 EC010032 */ fmuls f0, f1, f0
/* 0000CB68 D01C0010 */ stfs f0, 0x10(r28)
/* 0000CB6C C03C0010 */ lfs f1, 0x10(r28)
/* 0000CB70 C01E0074 */ lfs f0, 0x74(r30)
/* 0000CB74 EC01002A */ fadds f0, f1, f0
/* 0000CB78 D01C0010 */ stfs f0, 0x10(r28)
/* 0000CB7C C03C0000 */ lfs f1, 0(r28)
/* 0000CB80 C01C000C */ lfs f0, 0xc(r28)
/* 0000CB84 EC01002A */ fadds f0, f1, f0
/* 0000CB88 D01C0000 */ stfs f0, 0(r28)
/* 0000CB8C C03C0004 */ lfs f1, 4(r28)
/* 0000CB90 C01C0010 */ lfs f0, 0x10(r28)
/* 0000CB94 EC01002A */ fadds f0, f1, f0
/* 0000CB98 D01C0004 */ stfs f0, 4(r28)
/* 0000CB9C A87C001C */ lha r3, 0x1c(r28)
/* 0000CBA0 38030060 */ addi r0, r3, 0x60
/* 0000CBA4 B01C001C */ sth r0, 0x1c(r28)
/* 0000CBA8 C03E0078 */ lfs f1, 0x78(r30)
/* 0000CBAC C01C0024 */ lfs f0, 0x24(r28)
/* 0000CBB0 C05C0004 */ lfs f2, 4(r28)
/* 0000CBB4 EC010028 */ fsubs f0, f1, f0
/* 0000CBB8 FC020040 */ fcmpo cr0, f2, f0
/* 0000CBBC 40800204 */ bge lbl_0000CDC0
/* 0000CBC0 A01F0000 */ lhz r0, 0(r31)
/* 0000CBC4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000CBC8 408200C4 */ bne lbl_0000CC8C
/* 0000CBCC 4BFF3591 */ bl rand
/* 0000CBD0 6C608000 */ xoris r0, r3, 0x8000
/* 0000CBD4 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CBD8 9001001C */ stw r0, 0x1c(r1)
/* 0000CBDC 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CBE0 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CBE4 93610018 */ stw r27, 0x18(r1)
/* 0000CBE8 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CBEC C8610018 */ lfd f3, 0x18(r1)
/* 0000CBF0 C01E0054 */ lfs f0, 0x54(r30)
/* 0000CBF4 EC632028 */ fsubs f3, f3, f4
/* 0000CBF8 EC431024 */ fdivs f2, f3, f2
/* 0000CBFC EC220828 */ fsubs f1, f2, f1
/* 0000CC00 EC000072 */ fmuls f0, f0, f1
/* 0000CC04 D01C0000 */ stfs f0, 0(r28)
/* 0000CC08 4BFF3555 */ bl rand
/* 0000CC0C 6C608000 */ xoris r0, r3, 0x8000
/* 0000CC10 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CC14 90010014 */ stw r0, 0x14(r1)
/* 0000CC18 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CC1C C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CC20 93610010 */ stw r27, 0x10(r1)
/* 0000CC24 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CC28 C8610010 */ lfd f3, 0x10(r1)
/* 0000CC2C C01E005C */ lfs f0, 0x5c(r30)
/* 0000CC30 EC632028 */ fsubs f3, f3, f4
/* 0000CC34 EC431024 */ fdivs f2, f3, f2
/* 0000CC38 EC2100B2 */ fmuls f1, f1, f2
/* 0000CC3C EC000072 */ fmuls f0, f0, f1
/* 0000CC40 D01C0004 */ stfs f0, 4(r28)
/* 0000CC44 4BFF3519 */ bl rand
/* 0000CC48 6C608000 */ xoris r0, r3, 0x8000
/* 0000CC4C C05E0058 */ lfs f2, 0x58(r30)
/* 0000CC50 9001000C */ stw r0, 0xc(r1)
/* 0000CC54 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CC58 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CC5C 93610008 */ stw r27, 8(r1)
/* 0000CC60 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CC64 C8610008 */ lfd f3, 8(r1)
/* 0000CC68 C01E0018 */ lfs f0, 0x18(r30)
/* 0000CC6C EC632028 */ fsubs f3, f3, f4
/* 0000CC70 EC431024 */ fdivs f2, f3, f2
/* 0000CC74 EC220828 */ fsubs f1, f2, f1
/* 0000CC78 EC000072 */ fmuls f0, f0, f1
/* 0000CC7C D01C000C */ stfs f0, 0xc(r28)
/* 0000CC80 C01E0004 */ lfs f0, 4(r30)
/* 0000CC84 D01C0010 */ stfs f0, 0x10(r28)
/* 0000CC88 4800009C */ b lbl_0000CD24
lbl_0000CC8C:
/* 0000CC8C 801A0000 */ lwz r0, 0(r26)
/* 0000CC90 54032834 */ slwi r3, r0, 5
/* 0000CC94 4BFF34C9 */ bl mathutil_sin
/* 0000CC98 C01E007C */ lfs f0, 0x7c(r30)
/* 0000CC9C EC000072 */ fmuls f0, f0, f1
/* 0000CCA0 D01C0000 */ stfs f0, 0(r28)
/* 0000CCA4 C01E0080 */ lfs f0, 0x80(r30)
/* 0000CCA8 D01C0004 */ stfs f0, 4(r28)
/* 0000CCAC 4BFF34B1 */ bl rand
/* 0000CCB0 6C608000 */ xoris r0, r3, 0x8000
/* 0000CCB4 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CCB8 9001000C */ stw r0, 0xc(r1)
/* 0000CCBC 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CCC0 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CCC4 93610008 */ stw r27, 8(r1)
/* 0000CCC8 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CCCC C8610008 */ lfd f3, 8(r1)
/* 0000CCD0 C01E0084 */ lfs f0, 0x84(r30)
/* 0000CCD4 EC632028 */ fsubs f3, f3, f4
/* 0000CCD8 EC431024 */ fdivs f2, f3, f2
/* 0000CCDC EC220828 */ fsubs f1, f2, f1
/* 0000CCE0 EC000072 */ fmuls f0, f0, f1
/* 0000CCE4 D01C000C */ stfs f0, 0xc(r28)
/* 0000CCE8 4BFF3475 */ bl rand
/* 0000CCEC 6C608000 */ xoris r0, r3, 0x8000
/* 0000CCF0 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CCF4 90010014 */ stw r0, 0x14(r1)
/* 0000CCF8 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CCFC C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CD00 93610010 */ stw r27, 0x10(r1)
/* 0000CD04 C03E0088 */ lfs f1, 0x88(r30)
/* 0000CD08 C8610010 */ lfd f3, 0x10(r1)
/* 0000CD0C C01E0084 */ lfs f0, 0x84(r30)
/* 0000CD10 EC632028 */ fsubs f3, f3, f4
/* 0000CD14 EC431024 */ fdivs f2, f3, f2
/* 0000CD18 EC2100B2 */ fmuls f1, f1, f2
/* 0000CD1C EC010028 */ fsubs f0, f1, f0
/* 0000CD20 D01C0010 */ stfs f0, 0x10(r28)
lbl_0000CD24:
/* 0000CD24 4BFF3439 */ bl rand
/* 0000CD28 7C600734 */ extsh r0, r3
/* 0000CD2C B01C001C */ sth r0, 0x1c(r28)
/* 0000CD30 4BFF342D */ bl rand
/* 0000CD34 6C608000 */ xoris r0, r3, 0x8000
/* 0000CD38 C07E0058 */ lfs f3, 0x58(r30)
/* 0000CD3C 9001000C */ stw r0, 0xc(r1)
/* 0000CD40 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CD44 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CD48 93610008 */ stw r27, 8(r1)
/* 0000CD4C C05E0064 */ lfs f2, 0x64(r30)
/* 0000CD50 C8010008 */ lfd f0, 8(r1)
/* 0000CD54 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CD58 EC802028 */ fsubs f4, f0, f4
/* 0000CD5C C01E0060 */ lfs f0, 0x60(r30)
/* 0000CD60 EC641824 */ fdivs f3, f4, f3
/* 0000CD64 EC4200F2 */ fmuls f2, f2, f3
/* 0000CD68 EC21102A */ fadds f1, f1, f2
/* 0000CD6C EC000072 */ fmuls f0, f0, f1
/* 0000CD70 D01C0020 */ stfs f0, 0x20(r28)
/* 0000CD74 4BFF33E9 */ bl rand
/* 0000CD78 6C608000 */ xoris r0, r3, 0x8000
/* 0000CD7C C07E0058 */ lfs f3, 0x58(r30)
/* 0000CD80 90010014 */ stw r0, 0x14(r1)
/* 0000CD84 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CD88 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CD8C 93610010 */ stw r27, 0x10(r1)
/* 0000CD90 C05E0064 */ lfs f2, 0x64(r30)
/* 0000CD94 C8010010 */ lfd f0, 0x10(r1)
/* 0000CD98 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CD9C EC802028 */ fsubs f4, f0, f4
/* 0000CDA0 C01E0060 */ lfs f0, 0x60(r30)
/* 0000CDA4 EC641824 */ fdivs f3, f4, f3
/* 0000CDA8 EC4200F2 */ fmuls f2, f2, f3
/* 0000CDAC EC21102A */ fadds f1, f1, f2
/* 0000CDB0 EC000072 */ fmuls f0, f0, f1
/* 0000CDB4 D01C0024 */ stfs f0, 0x24(r28)
/* 0000CDB8 C01E000C */ lfs f0, 0xc(r30)
/* 0000CDBC D01C0028 */ stfs f0, 0x28(r28)
lbl_0000CDC0:
/* 0000CDC0 37BDFFFF */ addic. r29, r29, -1  ;# fixed addi
/* 0000CDC4 3B9C002C */ addi r28, r28, 0x2c
/* 0000CDC8 4181FD84 */ bgt lbl_0000CB4C
/* 0000CDCC BB410020 */ lmw r26, 0x20(r1)
/* 0000CDD0 8001003C */ lwz r0, 0x3c(r1)
/* 0000CDD4 38210038 */ addi r1, r1, 0x38
/* 0000CDD8 7C0803A6 */ mtlr r0
/* 0000CDDC 4E800020 */ blr 
lbl_0000CDE0:
/* 0000CDE0 7C0802A6 */ mflr r0
/* 0000CDE4 3C600000 */ lis r3, lbl_00010150@ha
/* 0000CDE8 90010004 */ stw r0, 4(r1)
/* 0000CDEC 38000080 */ li r0, 0x80
/* 0000CDF0 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000CDF4 BF610024 */ stmw r27, 0x24(r1)
/* 0000CDF8 3BE30000 */ addi r31, r3, lbl_00010150@l
/* 0000CDFC 3BA000FF */ li r29, 0xff
/* 0000CE00 3881000C */ addi r4, r1, 0xc
/* 0000CE04 38600004 */ li r3, 4
/* 0000CE08 98010010 */ stb r0, 0x10(r1)
/* 0000CE0C 98010011 */ stb r0, 0x11(r1)
/* 0000CE10 98010012 */ stb r0, 0x12(r1)
/* 0000CE14 9BA10013 */ stb r29, 0x13(r1)
/* 0000CE18 80010010 */ lwz r0, 0x10(r1)
/* 0000CE1C 9001000C */ stw r0, 0xc(r1)
/* 0000CE20 4BFF333D */ bl GXSetChanMatColor
/* 0000CE24 38000000 */ li r0, 0
/* 0000CE28 98010010 */ stb r0, 0x10(r1)
/* 0000CE2C 38810008 */ addi r4, r1, 8
/* 0000CE30 38600004 */ li r3, 4
/* 0000CE34 98010011 */ stb r0, 0x11(r1)
/* 0000CE38 98010012 */ stb r0, 0x12(r1)
/* 0000CE3C 9BA10013 */ stb r29, 0x13(r1)
/* 0000CE40 80010010 */ lwz r0, 0x10(r1)
/* 0000CE44 90010008 */ stw r0, 8(r1)
/* 0000CE48 4BFF3315 */ bl GXSetChanAmbColor
/* 0000CE4C 38600004 */ li r3, 4
/* 0000CE50 38800000 */ li r4, 0
/* 0000CE54 38A00000 */ li r5, 0
/* 0000CE58 38C00000 */ li r6, 0
/* 0000CE5C 38E00000 */ li r7, 0
/* 0000CE60 39000002 */ li r8, 2
/* 0000CE64 39200001 */ li r9, 1
/* 0000CE68 4BFF32F5 */ bl GXSetChanCtrl
/* 0000CE6C 38600001 */ li r3, 1
/* 0000CE70 4BFF32ED */ bl GXSetNumChans
/* 0000CE74 3C600000 */ lis r3, lbl_10000FA8@ha
/* 0000CE78 38630000 */ addi r3, r3, lbl_10000FA8@l
/* 0000CE7C 80630000 */ lwz r3, 0(r3)
/* 0000CE80 38800000 */ li r4, 0
/* 0000CE84 8063000C */ lwz r3, 0xc(r3)
/* 0000CE88 4BFF32D5 */ bl func_8009F430
/* 0000CE8C 38600000 */ li r3, 0
/* 0000CE90 38800001 */ li r4, 1
/* 0000CE94 38A00004 */ li r5, 4
/* 0000CE98 38C0003C */ li r6, 0x3c
/* 0000CE9C 38E00000 */ li r7, 0
/* 0000CEA0 3900007D */ li r8, 0x7d
/* 0000CEA4 4BFF32B9 */ bl GXSetTexCoordGen2
/* 0000CEA8 38600000 */ li r3, 0
/* 0000CEAC 38800000 */ li r4, 0
/* 0000CEB0 38A00000 */ li r5, 0
/* 0000CEB4 38C00004 */ li r6, 4
/* 0000CEB8 4BFF32A5 */ bl func_8009EFF4
/* 0000CEBC 38600000 */ li r3, 0
/* 0000CEC0 38800000 */ li r4, 0
/* 0000CEC4 4BFF3299 */ bl func_8009EA30
/* 0000CEC8 38600000 */ li r3, 0
/* 0000CECC 4BFF3291 */ bl GXSetTevDirect
/* 0000CED0 38600001 */ li r3, 1
/* 0000CED4 4BFF3289 */ bl func_8009F2C8
/* 0000CED8 38600001 */ li r3, 1
/* 0000CEDC 4BFF3281 */ bl GXSetNumTexGens
/* 0000CEE0 38600000 */ li r3, 0
/* 0000CEE4 4BFF3279 */ bl GXSetNumIndStages
/* 0000CEE8 38600001 */ li r3, 1
/* 0000CEEC 38800001 */ li r4, 1
/* 0000CEF0 38A00001 */ li r5, 1
/* 0000CEF4 38C00000 */ li r6, 0
/* 0000CEF8 4BFF3265 */ bl func_8009E110
/* 0000CEFC 3C600000 */ lis r3, zMode@ha
/* 0000CF00 38630000 */ addi r3, r3, zMode@l
/* 0000CF04 80630000 */ lwz r3, 0(r3)
/* 0000CF08 88030008 */ lbz r0, 8(r3)
/* 0000CF0C 28000000 */ cmplwi r0, 0
/* 0000CF10 4082001C */ bne lbl_0000CF2C
/* 0000CF14 80030004 */ lwz r0, 4(r3)
/* 0000CF18 2C000007 */ cmpwi r0, 7
/* 0000CF1C 40820010 */ bne lbl_0000CF2C
/* 0000CF20 88030000 */ lbz r0, 0(r3)
/* 0000CF24 28000001 */ cmplwi r0, 1
/* 0000CF28 41820040 */ beq lbl_0000CF68
lbl_0000CF2C:
/* 0000CF2C 38600001 */ li r3, 1
/* 0000CF30 38800007 */ li r4, 7
/* 0000CF34 38A00000 */ li r5, 0
/* 0000CF38 4BFF3225 */ bl GXSetZMode
/* 0000CF3C 3C600000 */ lis r3, zMode@ha
/* 0000CF40 38A30000 */ addi r5, r3, zMode@l
/* 0000CF44 80650000 */ lwz r3, 0(r5)
/* 0000CF48 38000001 */ li r0, 1
/* 0000CF4C 38800007 */ li r4, 7
/* 0000CF50 98030000 */ stb r0, 0(r3)
/* 0000CF54 38000000 */ li r0, 0
/* 0000CF58 80650000 */ lwz r3, 0(r5)
/* 0000CF5C 90830004 */ stw r4, 4(r3)
/* 0000CF60 80650000 */ lwz r3, 0(r5)
/* 0000CF64 98030008 */ stb r0, 8(r3)
lbl_0000CF68:
/* 0000CF68 4BFF31F5 */ bl func_8009AC8C
/* 0000CF6C 38602200 */ li r3, 0x2200
/* 0000CF70 4BFF31ED */ bl gxutil_set_vtx_attrs
/* 0000CF74 38600006 */ li r3, 6
/* 0000CF78 38800009 */ li r4, 9
/* 0000CF7C 38A00001 */ li r5, 1
/* 0000CF80 38C00004 */ li r6, 4
/* 0000CF84 38E00000 */ li r7, 0
/* 0000CF88 4BFF31D5 */ bl GXSetVtxAttrFmt
/* 0000CF8C 38600006 */ li r3, 6
/* 0000CF90 3880000D */ li r4, 0xd
/* 0000CF94 38A00001 */ li r5, 1
/* 0000CF98 38C00001 */ li r6, 1
/* 0000CF9C 38E00000 */ li r7, 0
/* 0000CFA0 4BFF31BD */ bl GXSetVtxAttrFmt
/* 0000CFA4 3C600000 */ lis r3, lbl_10000FAC@ha
/* 0000CFA8 38030000 */ addi r0, r3, lbl_10000FAC@l
/* 0000CFAC 3C600000 */ lis r3, mathutilData@ha
/* 0000CFB0 7C1B0378 */ mr r27, r0
/* 0000CFB4 3BA30000 */ addi r29, r3, mathutilData@l
/* 0000CFB8 3B800100 */ li r28, 0x100
/* 0000CFBC 3FC0CC01 */ lis r30, 0xcc01
lbl_0000CFC0:
/* 0000CFC0 4BFF319D */ bl mathutil_mtxA_from_identity
/* 0000CFC4 C03B0000 */ lfs f1, 0(r27)
/* 0000CFC8 C05B0004 */ lfs f2, 4(r27)
/* 0000CFCC C07F008C */ lfs f3, 0x8c(r31)
/* 0000CFD0 4BFF318D */ bl mathutil_mtxA_translate_xyz
/* 0000CFD4 387B0020 */ addi r3, r27, 0x20
/* 0000CFD8 4BFF3185 */ bl mathutil_mtxA_scale
/* 0000CFDC A87B001C */ lha r3, 0x1c(r27)
/* 0000CFE0 4BFF317D */ bl mathutil_mtxA_rotate_z
/* 0000CFE4 807D0000 */ lwz r3, 0(r29)
/* 0000CFE8 38800000 */ li r4, 0
/* 0000CFEC 4BFF3171 */ bl GXLoadPosMtxImm
/* 0000CFF0 38600080 */ li r3, 0x80
/* 0000CFF4 38800006 */ li r4, 6
/* 0000CFF8 38A00004 */ li r5, 4
/* 0000CFFC 4BFF3161 */ bl GXBegin
/* 0000D000 C05F0044 */ lfs f2, 0x44(r31)
/* 0000D004 38600000 */ li r3, 0
/* 0000D008 C03F000C */ lfs f1, 0xc(r31)
/* 0000D00C 38000001 */ li r0, 1
/* 0000D010 D05E8000 */ stfs f2, -0x8000(r30)
/* 0000D014 C01F0004 */ lfs f0, 4(r31)
/* 0000D018 379CFFFF */ addic. r28, r28, -1  ;# fixed addi
/* 0000D01C D03E8000 */ stfs f1, -0x8000(r30)
/* 0000D020 3B7B002C */ addi r27, r27, 0x2c
/* 0000D024 D01E8000 */ stfs f0, -0x8000(r30)
/* 0000D028 987E8000 */ stb r3, -0x8000(r30)
/* 0000D02C 987E8000 */ stb r3, -0x8000(r30)
/* 0000D030 D03E8000 */ stfs f1, -0x8000(r30)
/* 0000D034 D03E8000 */ stfs f1, -0x8000(r30)
/* 0000D038 D01E8000 */ stfs f0, -0x8000(r30)
/* 0000D03C 981E8000 */ stb r0, -0x8000(r30)
/* 0000D040 987E8000 */ stb r3, -0x8000(r30)
/* 0000D044 D03E8000 */ stfs f1, -0x8000(r30)
/* 0000D048 D05E8000 */ stfs f2, -0x8000(r30)
/* 0000D04C D01E8000 */ stfs f0, -0x8000(r30)
/* 0000D050 981E8000 */ stb r0, -0x8000(r30)
/* 0000D054 981E8000 */ stb r0, -0x8000(r30)
/* 0000D058 D05E8000 */ stfs f2, -0x8000(r30)
/* 0000D05C D05E8000 */ stfs f2, -0x8000(r30)
/* 0000D060 D01E8000 */ stfs f0, -0x8000(r30)
/* 0000D064 987E8000 */ stb r3, -0x8000(r30)
/* 0000D068 981E8000 */ stb r0, -0x8000(r30)
/* 0000D06C 4181FF54 */ bgt lbl_0000CFC0
/* 0000D070 BB610024 */ lmw r27, 0x24(r1)
/* 0000D074 8001003C */ lwz r0, 0x3c(r1)
/* 0000D078 38210038 */ addi r1, r1, 0x38
/* 0000D07C 7C0803A6 */ mtlr r0
/* 0000D080 4E800020 */ blr 
lbl_0000D084:
/* 0000D084 3C600000 */ lis r3, controllerInfo@ha
/* 0000D088 39030000 */ addi r8, r3, controllerInfo@l
/* 0000D08C A0080030 */ lhz r0, 0x30(r8)
/* 0000D090 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000D094 38830000 */ addi r4, r3, lbl_10003BF8@l
/* 0000D098 54060739 */ rlwinm. r6, r0, 0, 0x1c, 0x1c
/* 0000D09C 38E00000 */ li r7, 0
/* 0000D0A0 40820044 */ bne lbl_0000D0E4
/* 0000D0A4 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D0A8 39230000 */ addi r9, r3, analogButtonInfo@l
/* 0000D0AC A0690008 */ lhz r3, 8(r9)
/* 0000D0B0 54650739 */ rlwinm. r5, r3, 0, 0x1c, 0x1c
/* 0000D0B4 40820030 */ bne lbl_0000D0E4
/* 0000D0B8 A0A80000 */ lhz r5, 0(r8)
/* 0000D0BC 54A80739 */ rlwinm. r8, r5, 0, 0x1c, 0x1c
/* 0000D0C0 40820010 */ bne lbl_0000D0D0
/* 0000D0C4 A1090000 */ lhz r8, 0(r9)
/* 0000D0C8 55080739 */ rlwinm. r8, r8, 0, 0x1c, 0x1c
/* 0000D0CC 41820028 */ beq lbl_0000D0F4
lbl_0000D0D0:
/* 0000D0D0 3D000000 */ lis r8, analogButtonInfo@ha
/* 0000D0D4 39080000 */ addi r8, r8, analogButtonInfo@l
/* 0000D0D8 A1080000 */ lhz r8, 0(r8)
/* 0000D0DC 550805AD */ rlwinm. r8, r8, 0, 0x16, 0x16
/* 0000D0E0 41820014 */ beq lbl_0000D0F4
lbl_0000D0E4:
/* 0000D0E4 38600001 */ li r3, 1
/* 0000D0E8 90640050 */ stw r3, 0x50(r4)
/* 0000D0EC 38E0FFFF */ li r7, -1
/* 0000D0F0 480000F0 */ b lbl_0000D1E0
lbl_0000D0F4:
/* 0000D0F4 5408077B */ rlwinm. r8, r0, 0, 0x1d, 0x1d
/* 0000D0F8 4082003C */ bne lbl_0000D134
/* 0000D0FC 5468077B */ rlwinm. r8, r3, 0, 0x1d, 0x1d
/* 0000D100 40820034 */ bne lbl_0000D134
/* 0000D104 54A8077B */ rlwinm. r8, r5, 0, 0x1d, 0x1d
/* 0000D108 40820018 */ bne lbl_0000D120
/* 0000D10C 3D000000 */ lis r8, analogButtonInfo@ha
/* 0000D110 39080000 */ addi r8, r8, analogButtonInfo@l
/* 0000D114 A1080000 */ lhz r8, 0(r8)
/* 0000D118 5508077B */ rlwinm. r8, r8, 0, 0x1d, 0x1d
/* 0000D11C 41820028 */ beq lbl_0000D144
lbl_0000D120:
/* 0000D120 3D000000 */ lis r8, analogButtonInfo@ha
/* 0000D124 39080000 */ addi r8, r8, analogButtonInfo@l
/* 0000D128 A1080000 */ lhz r8, 0(r8)
/* 0000D12C 550805AD */ rlwinm. r8, r8, 0, 0x16, 0x16
/* 0000D130 41820014 */ beq lbl_0000D144
lbl_0000D134:
/* 0000D134 38600002 */ li r3, 2
/* 0000D138 90640050 */ stw r3, 0x50(r4)
/* 0000D13C 38E0FFFF */ li r7, -1
/* 0000D140 480000A0 */ b lbl_0000D1E0
lbl_0000D144:
/* 0000D144 540807FF */ clrlwi. r8, r0, 0x1f
/* 0000D148 4082003C */ bne lbl_0000D184
/* 0000D14C 546807FF */ clrlwi. r8, r3, 0x1f
/* 0000D150 40820034 */ bne lbl_0000D184
/* 0000D154 54A807FF */ clrlwi. r8, r5, 0x1f
/* 0000D158 40820018 */ bne lbl_0000D170
/* 0000D15C 3D000000 */ lis r8, analogButtonInfo@ha
/* 0000D160 39080000 */ addi r8, r8, analogButtonInfo@l
/* 0000D164 A1080000 */ lhz r8, 0(r8)
/* 0000D168 550807FF */ clrlwi. r8, r8, 0x1f
/* 0000D16C 41820028 */ beq lbl_0000D194
lbl_0000D170:
/* 0000D170 3D000000 */ lis r8, analogButtonInfo@ha
/* 0000D174 39080000 */ addi r8, r8, analogButtonInfo@l
/* 0000D178 A1080000 */ lhz r8, 0(r8)
/* 0000D17C 550805AD */ rlwinm. r8, r8, 0, 0x16, 0x16
/* 0000D180 41820014 */ beq lbl_0000D194
lbl_0000D184:
/* 0000D184 38600003 */ li r3, 3
/* 0000D188 90640050 */ stw r3, 0x50(r4)
/* 0000D18C 38E0FFFF */ li r7, -1
/* 0000D190 48000050 */ b lbl_0000D1E0
lbl_0000D194:
/* 0000D194 540807BD */ rlwinm. r8, r0, 0, 0x1e, 0x1e
/* 0000D198 4082003C */ bne lbl_0000D1D4
/* 0000D19C 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 0000D1A0 40820034 */ bne lbl_0000D1D4
/* 0000D1A4 54A307BD */ rlwinm. r3, r5, 0, 0x1e, 0x1e
/* 0000D1A8 40820018 */ bne lbl_0000D1C0
/* 0000D1AC 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D1B0 38630000 */ addi r3, r3, analogButtonInfo@l
/* 0000D1B4 A0630000 */ lhz r3, 0(r3)
/* 0000D1B8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 0000D1BC 41820024 */ beq lbl_0000D1E0
lbl_0000D1C0:
/* 0000D1C0 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D1C4 38630000 */ addi r3, r3, analogButtonInfo@l
/* 0000D1C8 A0630000 */ lhz r3, 0(r3)
/* 0000D1CC 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000D1D0 41820010 */ beq lbl_0000D1E0
lbl_0000D1D4:
/* 0000D1D4 38600004 */ li r3, 4
/* 0000D1D8 90640050 */ stw r3, 0x50(r4)
/* 0000D1DC 38E0FFFF */ li r7, -1
lbl_0000D1E0:
/* 0000D1E0 2C07FFFF */ cmpwi r7, -1
/* 0000D1E4 40820014 */ bne lbl_0000D1F8
/* 0000D1E8 3800001E */ li r0, 0x1e
/* 0000D1EC 900400C4 */ stw r0, 0xc4(r4)
/* 0000D1F0 80640050 */ lwz r3, 0x50(r4)
/* 0000D1F4 4E800020 */ blr 
lbl_0000D1F8:
/* 0000D1F8 806400C4 */ lwz r3, 0xc4(r4)
/* 0000D1FC 3463FFFF */ addic. r3, r3, -1  ;# fixed addi
/* 0000D200 906400C4 */ stw r3, 0xc4(r4)
/* 0000D204 4081000C */ ble lbl_0000D210
/* 0000D208 38600000 */ li r3, 0
/* 0000D20C 4E800020 */ blr 
lbl_0000D210:
/* 0000D210 2C060000 */ cmpwi r6, 0
/* 0000D214 4082004C */ bne lbl_0000D260
/* 0000D218 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D21C 38A30000 */ addi r5, r3, analogButtonInfo@l
/* 0000D220 A0650008 */ lhz r3, 8(r5)
/* 0000D224 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000D228 40820038 */ bne lbl_0000D260
/* 0000D22C 3C600000 */ lis r3, controllerInfo@ha
/* 0000D230 38630000 */ addi r3, r3, controllerInfo@l
/* 0000D234 A0630000 */ lhz r3, 0(r3)
/* 0000D238 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000D23C 40820010 */ bne lbl_0000D24C
/* 0000D240 A0650000 */ lhz r3, 0(r5)
/* 0000D244 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000D248 4182002C */ beq lbl_0000D274
lbl_0000D24C:
/* 0000D24C 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D250 38630000 */ addi r3, r3, analogButtonInfo@l
/* 0000D254 A0630000 */ lhz r3, 0(r3)
/* 0000D258 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000D25C 41820018 */ beq lbl_0000D274
lbl_0000D260:
/* 0000D260 80640050 */ lwz r3, 0x50(r4)
/* 0000D264 2C030001 */ cmpwi r3, 1
/* 0000D268 4082000C */ bne lbl_0000D274
/* 0000D26C 38E0FFFF */ li r7, -1
/* 0000D270 48000124 */ b lbl_0000D394
lbl_0000D274:
/* 0000D274 5403077B */ rlwinm. r3, r0, 0, 0x1d, 0x1d
/* 0000D278 4082004C */ bne lbl_0000D2C4
/* 0000D27C 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D280 38A30000 */ addi r5, r3, analogButtonInfo@l
/* 0000D284 A0650008 */ lhz r3, 8(r5)
/* 0000D288 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 0000D28C 40820038 */ bne lbl_0000D2C4
/* 0000D290 3C600000 */ lis r3, controllerInfo@ha
/* 0000D294 38630000 */ addi r3, r3, controllerInfo@l
/* 0000D298 A0630000 */ lhz r3, 0(r3)
/* 0000D29C 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 0000D2A0 40820010 */ bne lbl_0000D2B0
/* 0000D2A4 A0650000 */ lhz r3, 0(r5)
/* 0000D2A8 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 0000D2AC 4182002C */ beq lbl_0000D2D8
lbl_0000D2B0:
/* 0000D2B0 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D2B4 38630000 */ addi r3, r3, analogButtonInfo@l
/* 0000D2B8 A0630000 */ lhz r3, 0(r3)
/* 0000D2BC 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000D2C0 41820018 */ beq lbl_0000D2D8
lbl_0000D2C4:
/* 0000D2C4 80640050 */ lwz r3, 0x50(r4)
/* 0000D2C8 2C030002 */ cmpwi r3, 2
/* 0000D2CC 4082000C */ bne lbl_0000D2D8
/* 0000D2D0 38E0FFFF */ li r7, -1
/* 0000D2D4 480000C0 */ b lbl_0000D394
lbl_0000D2D8:
/* 0000D2D8 540307FF */ clrlwi. r3, r0, 0x1f
/* 0000D2DC 4082004C */ bne lbl_0000D328
/* 0000D2E0 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D2E4 38A30000 */ addi r5, r3, analogButtonInfo@l
/* 0000D2E8 A0650008 */ lhz r3, 8(r5)
/* 0000D2EC 546307FF */ clrlwi. r3, r3, 0x1f
/* 0000D2F0 40820038 */ bne lbl_0000D328
/* 0000D2F4 3C600000 */ lis r3, controllerInfo@ha
/* 0000D2F8 38630000 */ addi r3, r3, controllerInfo@l
/* 0000D2FC A0630000 */ lhz r3, 0(r3)
/* 0000D300 546307FF */ clrlwi. r3, r3, 0x1f
/* 0000D304 40820010 */ bne lbl_0000D314
/* 0000D308 A0650000 */ lhz r3, 0(r5)
/* 0000D30C 546307FF */ clrlwi. r3, r3, 0x1f
/* 0000D310 4182002C */ beq lbl_0000D33C
lbl_0000D314:
/* 0000D314 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D318 38630000 */ addi r3, r3, analogButtonInfo@l
/* 0000D31C A0630000 */ lhz r3, 0(r3)
/* 0000D320 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000D324 41820018 */ beq lbl_0000D33C
lbl_0000D328:
/* 0000D328 80640050 */ lwz r3, 0x50(r4)
/* 0000D32C 2C030003 */ cmpwi r3, 3
/* 0000D330 4082000C */ bne lbl_0000D33C
/* 0000D334 38E0FFFF */ li r7, -1
/* 0000D338 4800005C */ b lbl_0000D394
lbl_0000D33C:
/* 0000D33C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D340 40820044 */ bne lbl_0000D384
/* 0000D344 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D348 38A30000 */ addi r5, r3, analogButtonInfo@l
/* 0000D34C A0050008 */ lhz r0, 8(r5)
/* 0000D350 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D354 40820030 */ bne lbl_0000D384
/* 0000D358 3C600000 */ lis r3, controllerInfo@ha
/* 0000D35C A0030000 */ lhz r0, controllerInfo@l(r3)
/* 0000D360 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D364 40820010 */ bne lbl_0000D374
/* 0000D368 A0050000 */ lhz r0, 0(r5)
/* 0000D36C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D370 41820024 */ beq lbl_0000D394
lbl_0000D374:
/* 0000D374 3C600000 */ lis r3, analogButtonInfo@ha
/* 0000D378 A0030000 */ lhz r0, analogButtonInfo@l(r3)
/* 0000D37C 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 0000D380 41820014 */ beq lbl_0000D394
lbl_0000D384:
/* 0000D384 80040050 */ lwz r0, 0x50(r4)
/* 0000D388 2C000004 */ cmpwi r0, 4
/* 0000D38C 40820008 */ bne lbl_0000D394
/* 0000D390 38E0FFFF */ li r7, -1
lbl_0000D394:
/* 0000D394 2C07FFFF */ cmpwi r7, -1
/* 0000D398 40820014 */ bne lbl_0000D3AC
/* 0000D39C 38000004 */ li r0, 4
/* 0000D3A0 900400C4 */ stw r0, 0xc4(r4)
/* 0000D3A4 80640050 */ lwz r3, 0x50(r4)
/* 0000D3A8 4E800020 */ blr 
lbl_0000D3AC:
/* 0000D3AC 38000000 */ li r0, 0
/* 0000D3B0 90040050 */ stw r0, 0x50(r4)
/* 0000D3B4 38600000 */ li r3, 0
/* 0000D3B8 900400C4 */ stw r0, 0xc4(r4)
/* 0000D3BC 4E800020 */ blr 
lbl_0000D3C0:
/* 0000D3C0 7C0802A6 */ mflr r0
/* 0000D3C4 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000D3C8 90010004 */ stw r0, 4(r1)
/* 0000D3CC 3C800000 */ lis r4, lbl_000148E8@ha
/* 0000D3D0 9421FF70 */ stwu r1, -0x90(r1)
/* 0000D3D4 BEE1006C */ stmw r23, 0x6c(r1)
/* 0000D3D8 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000D3DC 38600000 */ li r3, 0
/* 0000D3E0 3BC40000 */ addi r30, r4, lbl_000148E8@l
/* 0000D3E4 907F00A4 */ stw r3, 0xa4(r31)
/* 0000D3E8 801F008C */ lwz r0, 0x8c(r31)
/* 0000D3EC 2C000000 */ cmpwi r0, 0
/* 0000D3F0 41820440 */ beq lbl_0000D830
/* 0000D3F4 801F0058 */ lwz r0, 0x58(r31)
/* 0000D3F8 2C000000 */ cmpwi r0, 0
/* 0000D3FC 907F0058 */ stw r3, 0x58(r31)
/* 0000D400 4182001C */ beq lbl_0000D41C
/* 0000D404 907F008C */ stw r3, 0x8c(r31)
/* 0000D408 38000001 */ li r0, 1
/* 0000D40C 807F0094 */ lwz r3, 0x94(r31)
/* 0000D410 907F0090 */ stw r3, 0x90(r31)
/* 0000D414 901F00A4 */ stw r0, 0xa4(r31)
/* 0000D418 48000418 */ b lbl_0000D830
lbl_0000D41C:
/* 0000D41C 801F0054 */ lwz r0, 0x54(r31)
/* 0000D420 2C000000 */ cmpwi r0, 0
/* 0000D424 907F0054 */ stw r3, 0x54(r31)
/* 0000D428 4182000C */ beq lbl_0000D434
/* 0000D42C 907F008C */ stw r3, 0x8c(r31)
/* 0000D430 48000400 */ b lbl_0000D830
lbl_0000D434:
/* 0000D434 3B600000 */ li r27, 0
/* 0000D438 831F0090 */ lwz r24, 0x90(r31)
/* 0000D43C 5779103A */ slwi r25, r27, 2
/* 0000D440 3B400000 */ li r26, 0
/* 0000D444 4800001C */ b lbl_0000D460
lbl_0000D448:
/* 0000D448 4BFF2D15 */ bl strlen
/* 0000D44C 7C03D000 */ cmpw r3, r26
/* 0000D450 40810008 */ ble lbl_0000D458
/* 0000D454 7C7A1B78 */ mr r26, r3
lbl_0000D458:
/* 0000D458 3B390004 */ addi r25, r25, 4
/* 0000D45C 3B7B0001 */ addi r27, r27, 1
lbl_0000D460:
/* 0000D460 807F0098 */ lwz r3, 0x98(r31)
/* 0000D464 7C63C82E */ lwzx r3, r3, r25
/* 0000D468 28030000 */ cmplwi r3, 0
/* 0000D46C 4082FFDC */ bne lbl_0000D448
/* 0000D470 4BFFFC15 */ bl lbl_0000D084
/* 0000D474 2C030001 */ cmpwi r3, 1
/* 0000D478 40820020 */ bne lbl_0000D498
/* 0000D47C 809F0090 */ lwz r4, 0x90(r31)
/* 0000D480 3404FFFF */ addic. r0, r4, -1  ;# fixed addi
/* 0000D484 901F0090 */ stw r0, 0x90(r31)
/* 0000D488 40800034 */ bge lbl_0000D4BC
/* 0000D48C 381BFFFF */ addi r0, r27, -1  ;# fixed addi
/* 0000D490 901F0090 */ stw r0, 0x90(r31)
/* 0000D494 48000028 */ b lbl_0000D4BC
lbl_0000D498:
/* 0000D498 2C030002 */ cmpwi r3, 2
/* 0000D49C 40820020 */ bne lbl_0000D4BC
/* 0000D4A0 809F0090 */ lwz r4, 0x90(r31)
/* 0000D4A4 38040001 */ addi r0, r4, 1
/* 0000D4A8 7C00D800 */ cmpw r0, r27
/* 0000D4AC 901F0090 */ stw r0, 0x90(r31)
/* 0000D4B0 4180000C */ blt lbl_0000D4BC
/* 0000D4B4 38000000 */ li r0, 0
/* 0000D4B8 901F0090 */ stw r0, 0x90(r31)
lbl_0000D4BC:
/* 0000D4BC 2C1B0018 */ cmpwi r27, 0x18
/* 0000D4C0 40810084 */ ble lbl_0000D544
/* 0000D4C4 2C030003 */ cmpwi r3, 3
/* 0000D4C8 389B0000 */ addi r4, r27, 0
/* 0000D4CC 40820020 */ bne lbl_0000D4EC
/* 0000D4D0 807F0090 */ lwz r3, 0x90(r31)
/* 0000D4D4 3403FFF6 */ addic. r0, r3, -10  ;# fixed addi
/* 0000D4D8 901F0090 */ stw r0, 0x90(r31)
/* 0000D4DC 40800034 */ bge lbl_0000D510
/* 0000D4E0 38000000 */ li r0, 0
/* 0000D4E4 901F0090 */ stw r0, 0x90(r31)
/* 0000D4E8 48000028 */ b lbl_0000D510
lbl_0000D4EC:
/* 0000D4EC 2C030004 */ cmpwi r3, 4
/* 0000D4F0 40820020 */ bne lbl_0000D510
/* 0000D4F4 807F0090 */ lwz r3, 0x90(r31)
/* 0000D4F8 3803000A */ addi r0, r3, 0xa
/* 0000D4FC 7C00D800 */ cmpw r0, r27
/* 0000D500 901F0090 */ stw r0, 0x90(r31)
/* 0000D504 4180000C */ blt lbl_0000D510
/* 0000D508 381BFFFF */ addi r0, r27, -1  ;# fixed addi
/* 0000D50C 901F0090 */ stw r0, 0x90(r31)
lbl_0000D510:
/* 0000D510 807F0090 */ lwz r3, 0x90(r31)
/* 0000D514 3804FFF4 */ addi r0, r4, -12  ;# fixed addi
/* 0000D518 3B600018 */ li r27, 0x18
/* 0000D51C 7C030000 */ cmpw r3, r0
/* 0000D520 4081000C */ ble lbl_0000D52C
/* 0000D524 3B24FFE8 */ addi r25, r4, -24  ;# fixed addi
/* 0000D528 48000020 */ b lbl_0000D548
lbl_0000D52C:
/* 0000D52C 2C03000C */ cmpwi r3, 0xc
/* 0000D530 4080000C */ bge lbl_0000D53C
/* 0000D534 3B200000 */ li r25, 0
/* 0000D538 48000010 */ b lbl_0000D548
lbl_0000D53C:
/* 0000D53C 3B23FFF4 */ addi r25, r3, -12  ;# fixed addi
/* 0000D540 48000008 */ b lbl_0000D548
lbl_0000D544:
/* 0000D544 3B200000 */ li r25, 0
lbl_0000D548:
/* 0000D548 38600002 */ li r3, 2
/* 0000D54C 4BFF2C11 */ bl g_debug_set_text_color
/* 0000D550 801F00A0 */ lwz r0, 0xa0(r31)
/* 0000D554 389B0003 */ addi r4, r27, 3
/* 0000D558 807F009C */ lwz r3, 0x9c(r31)
/* 0000D55C 7C802214 */ add r4, r0, r4
/* 0000D560 4BFF2BFD */ bl g_debug_set_cursor_pos
/* 0000D564 341A0004 */ addic. r0, r26, 4
/* 0000D568 38800000 */ li r4, 0
/* 0000D56C 40810088 */ ble lbl_0000D5F4
/* 0000D570 381A0004 */ addi r0, r26, 4
/* 0000D574 2C000008 */ cmpwi r0, 8
/* 0000D578 387AFFFC */ addi r3, r26, -4  ;# fixed addi
/* 0000D57C 40810290 */ ble lbl_0000D80C
/* 0000D580 38030007 */ addi r0, r3, 7
/* 0000D584 5400E8FE */ srwi r0, r0, 3
/* 0000D588 2C030000 */ cmpwi r3, 0
/* 0000D58C 7C0903A6 */ mtctr r0
/* 0000D590 38610014 */ addi r3, r1, 0x14
/* 0000D594 3800002D */ li r0, 0x2d
/* 0000D598 40810274 */ ble lbl_0000D80C
lbl_0000D59C:
/* 0000D59C 98030000 */ stb r0, 0(r3)
/* 0000D5A0 38840008 */ addi r4, r4, 8
/* 0000D5A4 98030001 */ stb r0, 1(r3)
/* 0000D5A8 98030002 */ stb r0, 2(r3)
/* 0000D5AC 98030003 */ stb r0, 3(r3)
/* 0000D5B0 98030004 */ stb r0, 4(r3)
/* 0000D5B4 98030005 */ stb r0, 5(r3)
/* 0000D5B8 98030006 */ stb r0, 6(r3)
/* 0000D5BC 98030007 */ stb r0, 7(r3)
/* 0000D5C0 38630008 */ addi r3, r3, 8
/* 0000D5C4 4200FFD8 */ bdnz lbl_0000D59C
/* 0000D5C8 48000244 */ b lbl_0000D80C
lbl_0000D5CC:
/* 0000D5CC 387A0004 */ addi r3, r26, 4
/* 0000D5D0 7C041850 */ subf r0, r4, r3
/* 0000D5D4 7C041800 */ cmpw r4, r3
/* 0000D5D8 7C0903A6 */ mtctr r0
/* 0000D5DC 3800002D */ li r0, 0x2d
/* 0000D5E0 40800014 */ bge lbl_0000D5F4
lbl_0000D5E4:
/* 0000D5E4 98050000 */ stb r0, 0(r5)
/* 0000D5E8 38A50001 */ addi r5, r5, 1
/* 0000D5EC 38840001 */ addi r4, r4, 1
/* 0000D5F0 4200FFF4 */ bdnz lbl_0000D5E4
lbl_0000D5F4:
/* 0000D5F4 3B810014 */ addi r28, r1, 0x14
/* 0000D5F8 4CC63182 */ crclr 6
/* 0000D5FC 3BA00000 */ li r29, 0
/* 0000D600 7FBC21AE */ stbx r29, r28, r4
/* 0000D604 389C0000 */ addi r4, r28, 0
/* 0000D608 387E0E30 */ addi r3, r30, 0xe30
/* 0000D60C 4BFF2B51 */ bl g_debug_printf
/* 0000D610 807F009C */ lwz r3, 0x9c(r31)
/* 0000D614 809F00A0 */ lwz r4, 0xa0(r31)
/* 0000D618 4BFF2B45 */ bl g_debug_set_cursor_pos
/* 0000D61C 341A0004 */ addic. r0, r26, 4
/* 0000D620 40810084 */ ble lbl_0000D6A4
/* 0000D624 381A0004 */ addi r0, r26, 4
/* 0000D628 2C000008 */ cmpwi r0, 8
/* 0000D62C 387AFFFC */ addi r3, r26, -4  ;# fixed addi
/* 0000D630 408101E8 */ ble lbl_0000D818
/* 0000D634 38030007 */ addi r0, r3, 7
/* 0000D638 5400E8FE */ srwi r0, r0, 3
/* 0000D63C 7C0903A6 */ mtctr r0
/* 0000D640 2C030000 */ cmpwi r3, 0
/* 0000D644 3800002D */ li r0, 0x2d
/* 0000D648 408101D0 */ ble lbl_0000D818
lbl_0000D64C:
/* 0000D64C 981C0000 */ stb r0, 0(r28)
/* 0000D650 3BBD0008 */ addi r29, r29, 8
/* 0000D654 981C0001 */ stb r0, 1(r28)
/* 0000D658 981C0002 */ stb r0, 2(r28)
/* 0000D65C 981C0003 */ stb r0, 3(r28)
/* 0000D660 981C0004 */ stb r0, 4(r28)
/* 0000D664 981C0005 */ stb r0, 5(r28)
/* 0000D668 981C0006 */ stb r0, 6(r28)
/* 0000D66C 981C0007 */ stb r0, 7(r28)
/* 0000D670 3B9C0008 */ addi r28, r28, 8
/* 0000D674 4200FFD8 */ bdnz lbl_0000D64C
/* 0000D678 480001A0 */ b lbl_0000D818
lbl_0000D67C:
/* 0000D67C 387A0004 */ addi r3, r26, 4
/* 0000D680 7C1D1850 */ subf r0, r29, r3
/* 0000D684 7C1D1800 */ cmpw r29, r3
/* 0000D688 7C0903A6 */ mtctr r0
/* 0000D68C 3800002D */ li r0, 0x2d
/* 0000D690 40800014 */ bge lbl_0000D6A4
lbl_0000D694:
/* 0000D694 98040000 */ stb r0, 0(r4)
/* 0000D698 38840001 */ addi r4, r4, 1
/* 0000D69C 3BBD0001 */ addi r29, r29, 1
/* 0000D6A0 4200FFF4 */ bdnz lbl_0000D694
lbl_0000D6A4:
/* 0000D6A4 3AE10014 */ addi r23, r1, 0x14
/* 0000D6A8 4CC63182 */ crclr 6
/* 0000D6AC 3B800000 */ li r28, 0
/* 0000D6B0 7F97E9AE */ stbx r28, r23, r29
/* 0000D6B4 38970000 */ addi r4, r23, 0
/* 0000D6B8 387E0E30 */ addi r3, r30, 0xe30
/* 0000D6BC 4BFF2AA1 */ bl g_debug_printf
/* 0000D6C0 341A0004 */ addic. r0, r26, 4
/* 0000D6C4 40810084 */ ble lbl_0000D748
/* 0000D6C8 381A0004 */ addi r0, r26, 4
/* 0000D6CC 2C000008 */ cmpwi r0, 8
/* 0000D6D0 387AFFFC */ addi r3, r26, -4  ;# fixed addi
/* 0000D6D4 40810150 */ ble lbl_0000D824
/* 0000D6D8 38030007 */ addi r0, r3, 7
/* 0000D6DC 5400E8FE */ srwi r0, r0, 3
/* 0000D6E0 7C0903A6 */ mtctr r0
/* 0000D6E4 2C030000 */ cmpwi r3, 0
/* 0000D6E8 38000020 */ li r0, 0x20
/* 0000D6EC 40810138 */ ble lbl_0000D824
lbl_0000D6F0:
/* 0000D6F0 98170000 */ stb r0, 0(r23)
/* 0000D6F4 3B9C0008 */ addi r28, r28, 8
/* 0000D6F8 98170001 */ stb r0, 1(r23)
/* 0000D6FC 98170002 */ stb r0, 2(r23)
/* 0000D700 98170003 */ stb r0, 3(r23)
/* 0000D704 98170004 */ stb r0, 4(r23)
/* 0000D708 98170005 */ stb r0, 5(r23)
/* 0000D70C 98170006 */ stb r0, 6(r23)
/* 0000D710 98170007 */ stb r0, 7(r23)
/* 0000D714 3AF70008 */ addi r23, r23, 8
/* 0000D718 4200FFD8 */ bdnz lbl_0000D6F0
/* 0000D71C 48000108 */ b lbl_0000D824
lbl_0000D720:
/* 0000D720 387A0004 */ addi r3, r26, 4
/* 0000D724 7C1C1850 */ subf r0, r28, r3
/* 0000D728 7C1C1800 */ cmpw r28, r3
/* 0000D72C 7C0903A6 */ mtctr r0
/* 0000D730 38000020 */ li r0, 0x20
/* 0000D734 40800014 */ bge lbl_0000D748
lbl_0000D738:
/* 0000D738 98040000 */ stb r0, 0(r4)
/* 0000D73C 38840001 */ addi r4, r4, 1
/* 0000D740 3B9C0001 */ addi r28, r28, 1
/* 0000D744 4200FFF4 */ bdnz lbl_0000D738
lbl_0000D748:
/* 0000D748 38610014 */ addi r3, r1, 0x14
/* 0000D74C 38000000 */ li r0, 0
/* 0000D750 7C03E1AE */ stbx r0, r3, r28
/* 0000D754 3B5B0002 */ addi r26, r27, 2
/* 0000D758 3AE00000 */ li r23, 0
/* 0000D75C 48000018 */ b lbl_0000D774
lbl_0000D760:
/* 0000D760 387E0E38 */ addi r3, r30, 0xe38
/* 0000D764 4CC63182 */ crclr 6
/* 0000D768 38810014 */ addi r4, r1, 0x14
/* 0000D76C 4BFF29F1 */ bl g_debug_printf
/* 0000D770 3AF70001 */ addi r23, r23, 1
lbl_0000D774:
/* 0000D774 7C17D000 */ cmpw r23, r26
/* 0000D778 4180FFE8 */ blt lbl_0000D760
/* 0000D77C 38600000 */ li r3, 0
/* 0000D780 4BFF29DD */ bl g_debug_set_text_color
/* 0000D784 807F009C */ lwz r3, 0x9c(r31)
/* 0000D788 809F00A0 */ lwz r4, 0xa0(r31)
/* 0000D78C 38630002 */ addi r3, r3, 2
/* 0000D790 38840002 */ addi r4, r4, 2
/* 0000D794 4BFF29C9 */ bl g_debug_set_cursor_pos
/* 0000D798 3B400000 */ li r26, 0
/* 0000D79C 48000048 */ b lbl_0000D7E4
lbl_0000D7A0:
/* 0000D7A0 801F0090 */ lwz r0, 0x90(r31)
/* 0000D7A4 7EFACA14 */ add r23, r26, r25
/* 0000D7A8 7C00B800 */ cmpw r0, r23
/* 0000D7AC 40820014 */ bne lbl_0000D7C0
/* 0000D7B0 38600001 */ li r3, 1
/* 0000D7B4 4BFF29A9 */ bl g_debug_set_text_color
/* 0000D7B8 387E0E40 */ addi r3, r30, 0xe40
/* 0000D7BC 48000010 */ b lbl_0000D7CC
lbl_0000D7C0:
/* 0000D7C0 38600000 */ li r3, 0
/* 0000D7C4 4BFF2999 */ bl g_debug_set_text_color
/* 0000D7C8 387E0E48 */ addi r3, r30, 0xe48
lbl_0000D7CC:
/* 0000D7CC 809F0098 */ lwz r4, 0x98(r31)
/* 0000D7D0 56E0103A */ slwi r0, r23, 2
/* 0000D7D4 4CC63182 */ crclr 6
/* 0000D7D8 7C84002E */ lwzx r4, r4, r0
/* 0000D7DC 4BFF2981 */ bl g_debug_printf
/* 0000D7E0 3B5A0001 */ addi r26, r26, 1
lbl_0000D7E4:
/* 0000D7E4 7C1AD800 */ cmpw r26, r27
/* 0000D7E8 4180FFB8 */ blt lbl_0000D7A0
/* 0000D7EC 38600000 */ li r3, 0
/* 0000D7F0 4BFF296D */ bl g_debug_set_text_color
/* 0000D7F4 801F0090 */ lwz r0, 0x90(r31)
/* 0000D7F8 7C60C050 */ subf r3, r0, r24
/* 0000D7FC 3003FFFF */ addic r0, r3, -1  ;# fixed addi
/* 0000D800 7C001910 */ subfe r0, r0, r3
/* 0000D804 901F00A4 */ stw r0, 0xa4(r31)
/* 0000D808 48000028 */ b lbl_0000D830
lbl_0000D80C:
/* 0000D80C 38A10014 */ addi r5, r1, 0x14
/* 0000D810 7CA52214 */ add r5, r5, r4
/* 0000D814 4BFFFDB8 */ b lbl_0000D5CC
lbl_0000D818:
/* 0000D818 38810014 */ addi r4, r1, 0x14
/* 0000D81C 7C84EA14 */ add r4, r4, r29
/* 0000D820 4BFFFE5C */ b lbl_0000D67C
lbl_0000D824:
/* 0000D824 38810014 */ addi r4, r1, 0x14
/* 0000D828 7C84E214 */ add r4, r4, r28
/* 0000D82C 4BFFFEF4 */ b lbl_0000D720
lbl_0000D830:
/* 0000D830 BAE1006C */ lmw r23, 0x6c(r1)
/* 0000D834 80010094 */ lwz r0, 0x94(r1)
/* 0000D838 38210090 */ addi r1, r1, 0x90
/* 0000D83C 7C0803A6 */ mtlr r0
/* 0000D840 4E800020 */ blr 
lbl_0000D844:
/* 0000D844 7C0802A6 */ mflr r0
/* 0000D848 3C800000 */ lis r4, lbl_000148E8@ha
/* 0000D84C 90010004 */ stw r0, 4(r1)
/* 0000D850 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000D854 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000D858 93E10014 */ stw r31, 0x14(r1)
/* 0000D85C 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000D860 3860000A */ li r3, 0xa
/* 0000D864 93C10010 */ stw r30, 0x10(r1)
/* 0000D868 3BC40000 */ addi r30, r4, lbl_000148E8@l
/* 0000D86C 38800000 */ li r4, 0
/* 0000D870 93A1000C */ stw r29, 0xc(r1)
/* 0000D874 93810008 */ stw r28, 8(r1)
/* 0000D878 4BFF28E5 */ bl g_debug_set_cursor_pos
/* 0000D87C 387E0E50 */ addi r3, r30, 0xe50
/* 0000D880 4CC63182 */ crclr 6
/* 0000D884 4BFF28D9 */ bl g_debug_printf
/* 0000D888 3860000B */ li r3, 0xb
/* 0000D88C 38800001 */ li r4, 1
/* 0000D890 4BFF28CD */ bl g_debug_set_cursor_pos
/* 0000D894 3C600000 */ lis r3, motInfo@ha
/* 0000D898 4CC63182 */ crclr 6
/* 0000D89C 3BA30000 */ addi r29, r3, motInfo@l
/* 0000D8A0 809D0000 */ lwz r4, 0(r29)
/* 0000D8A4 387E0E60 */ addi r3, r30, 0xe60
/* 0000D8A8 3CA40003 */ addis r5, r4, 3
/* 0000D8AC 3C840005 */ addis r4, r4, 5
/* 0000D8B0 3804E000 */ addi r0, r4, -8192  ;# fixed addi
/* 0000D8B4 84858000 */ lwzu r4, -0x8000(r5)
/* 0000D8B8 7C050050 */ subf r0, r5, r0
/* 0000D8BC 5405E13E */ srwi r5, r0, 4
/* 0000D8C0 4BFF289D */ bl g_debug_printf
/* 0000D8C4 809D0000 */ lwz r4, 0(r29)
/* 0000D8C8 387E0E74 */ addi r3, r30, 0xe74
/* 0000D8CC 4CC63182 */ crclr 6
/* 0000D8D0 4BFF288D */ bl g_debug_printf
/* 0000D8D4 801F0088 */ lwz r0, 0x88(r31)
/* 0000D8D8 28000000 */ cmplwi r0, 0
/* 0000D8DC 40820058 */ bne lbl_0000D934
/* 0000D8E0 4BFFF7A5 */ bl lbl_0000D084
/* 0000D8E4 2C030001 */ cmpwi r3, 1
/* 0000D8E8 40820024 */ bne lbl_0000D90C
/* 0000D8EC 807F0064 */ lwz r3, 0x64(r31)
/* 0000D8F0 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000D8F4 901F0064 */ stw r0, 0x64(r31)
/* 0000D8F8 4080003C */ bge lbl_0000D934
/* 0000D8FC 807F0070 */ lwz r3, 0x70(r31)
/* 0000D900 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000D904 901F0064 */ stw r0, 0x64(r31)
/* 0000D908 4800002C */ b lbl_0000D934
lbl_0000D90C:
/* 0000D90C 2C030002 */ cmpwi r3, 2
/* 0000D910 40820024 */ bne lbl_0000D934
/* 0000D914 807F0064 */ lwz r3, 0x64(r31)
/* 0000D918 38630001 */ addi r3, r3, 1
/* 0000D91C 907F0064 */ stw r3, 0x64(r31)
/* 0000D920 801F0070 */ lwz r0, 0x70(r31)
/* 0000D924 7C030000 */ cmpw r3, r0
/* 0000D928 4180000C */ blt lbl_0000D934
/* 0000D92C 38000000 */ li r0, 0
/* 0000D930 901F0064 */ stw r0, 0x64(r31)
lbl_0000D934:
/* 0000D934 801F0088 */ lwz r0, 0x88(r31)
/* 0000D938 28000000 */ cmplwi r0, 0
/* 0000D93C 40820098 */ bne lbl_0000D9D4
/* 0000D940 38600017 */ li r3, 0x17
/* 0000D944 38800003 */ li r4, 3
/* 0000D948 4BFF2815 */ bl g_debug_set_cursor_pos
/* 0000D94C 387E0E84 */ addi r3, r30, 0xe84
/* 0000D950 4CC63182 */ crclr 6
/* 0000D954 4BFF2809 */ bl g_debug_printf
/* 0000D958 3B800000 */ li r28, 0
/* 0000D95C 57801838 */ slwi r0, r28, 3
/* 0000D960 7FBE0214 */ add r29, r30, r0
/* 0000D964 3BBD0E08 */ addi r29, r29, 0xe08
/* 0000D968 48000060 */ b lbl_0000D9C8
lbl_0000D96C:
/* 0000D96C 801F0064 */ lwz r0, 0x64(r31)
/* 0000D970 7C1C0000 */ cmpw r28, r0
/* 0000D974 40820028 */ bne lbl_0000D99C
/* 0000D978 801F0088 */ lwz r0, 0x88(r31)
/* 0000D97C 28000000 */ cmplwi r0, 0
/* 0000D980 4082001C */ bne lbl_0000D99C
/* 0000D984 38600002 */ li r3, 2
/* 0000D988 4BFF27D5 */ bl g_debug_set_text_color
/* 0000D98C 387E0E98 */ addi r3, r30, 0xe98
/* 0000D990 4CC63182 */ crclr 6
/* 0000D994 4BFF27C9 */ bl g_debug_printf
/* 0000D998 48000018 */ b lbl_0000D9B0
lbl_0000D99C:
/* 0000D99C 38600000 */ li r3, 0
/* 0000D9A0 4BFF27BD */ bl g_debug_set_text_color
/* 0000D9A4 387E0E9C */ addi r3, r30, 0xe9c
/* 0000D9A8 4CC63182 */ crclr 6
/* 0000D9AC 4BFF27B1 */ bl g_debug_printf
lbl_0000D9B0:
/* 0000D9B0 809D0004 */ lwz r4, 4(r29)
/* 0000D9B4 387E0EA0 */ addi r3, r30, 0xea0
/* 0000D9B8 4CC63182 */ crclr 6
/* 0000D9BC 4BFF27A1 */ bl g_debug_printf
/* 0000D9C0 3BBD0008 */ addi r29, r29, 8
/* 0000D9C4 3B9C0001 */ addi r28, r28, 1
lbl_0000D9C8:
/* 0000D9C8 801F0070 */ lwz r0, 0x70(r31)
/* 0000D9CC 7C1C0000 */ cmpw r28, r0
/* 0000D9D0 4180FF9C */ blt lbl_0000D96C
lbl_0000D9D4:
/* 0000D9D4 38600000 */ li r3, 0
/* 0000D9D8 4BFF2785 */ bl g_debug_set_text_color
/* 0000D9DC 8001001C */ lwz r0, 0x1c(r1)
/* 0000D9E0 83E10014 */ lwz r31, 0x14(r1)
/* 0000D9E4 83C10010 */ lwz r30, 0x10(r1)
/* 0000D9E8 7C0803A6 */ mtlr r0
/* 0000D9EC 83A1000C */ lwz r29, 0xc(r1)
/* 0000D9F0 83810008 */ lwz r28, 8(r1)
/* 0000D9F4 38210018 */ addi r1, r1, 0x18
/* 0000D9F8 4E800020 */ blr 
lbl_0000D9FC:
/* 0000D9FC 7C0802A6 */ mflr r0
/* 0000DA00 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000DA04 90010004 */ stw r0, 4(r1)
/* 0000DA08 3C800000 */ lis r4, lbl_000101E0@ha
/* 0000DA0C 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000DA10 93E10014 */ stw r31, 0x14(r1)
/* 0000DA14 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000DA18 93C10010 */ stw r30, 0x10(r1)
/* 0000DA1C 3BC40000 */ addi r30, r4, lbl_000101E0@l
/* 0000DA20 807F0004 */ lwz r3, 4(r31)
/* 0000DA24 28030000 */ cmplwi r3, 0
/* 0000DA28 41820008 */ beq lbl_0000DA30
/* 0000DA2C 4BFF2731 */ bl func_8008B2D4
lbl_0000DA30:
/* 0000DA30 807F006C */ lwz r3, 0x6c(r31)
/* 0000DA34 4BFF2729 */ bl g_make_ape
/* 0000DA38 907F0004 */ stw r3, 4(r31)
/* 0000DA3C C01E0000 */ lfs f0, 0(r30)
/* 0000DA40 D01F000C */ stfs f0, 0xc(r31)
/* 0000DA44 4BFF2719 */ bl mathutil_mtxA_from_identity
/* 0000DA48 C01F000C */ lfs f0, 0xc(r31)
/* 0000DA4C FC00001E */ fctiwz f0, f0
/* 0000DA50 D8010008 */ stfd f0, 8(r1)
/* 0000DA54 8061000C */ lwz r3, 0xc(r1)
/* 0000DA58 4BFF2705 */ bl mathutil_mtxA_rotate_y
/* 0000DA5C 807F0004 */ lwz r3, 4(r31)
/* 0000DA60 38630060 */ addi r3, r3, 0x60
/* 0000DA64 4BFF26F9 */ bl mathutil_mtxA_to_quat
/* 0000DA68 801F006C */ lwz r0, 0x6c(r31)
/* 0000DA6C 2C000003 */ cmpwi r0, 3
/* 0000DA70 40820014 */ bne lbl_0000DA84
/* 0000DA74 C01E0004 */ lfs f0, 4(r30)
/* 0000DA78 807F0004 */ lwz r3, 4(r31)
/* 0000DA7C D0030034 */ stfs f0, 0x34(r3)
/* 0000DA80 48000010 */ b lbl_0000DA90
lbl_0000DA84:
/* 0000DA84 C01E0008 */ lfs f0, 8(r30)
/* 0000DA88 807F0004 */ lwz r3, 4(r31)
/* 0000DA8C D0030034 */ stfs f0, 0x34(r3)
lbl_0000DA90:
/* 0000DA90 C01E000C */ lfs f0, 0xc(r30)
/* 0000DA94 38000002 */ li r0, 2
/* 0000DA98 809F0004 */ lwz r4, 4(r31)
/* 0000DA9C 38600000 */ li r3, 0
/* 0000DAA0 7C0903A6 */ mtctr r0
/* 0000DAA4 D0040044 */ stfs f0, 0x44(r4)
/* 0000DAA8 38BF0010 */ addi r5, r31, 0x10
/* 0000DAAC 809F0004 */ lwz r4, 4(r31)
/* 0000DAB0 D0040040 */ stfs f0, 0x40(r4)
/* 0000DAB4 809F0004 */ lwz r4, 4(r31)
/* 0000DAB8 D004003C */ stfs f0, 0x3c(r4)
/* 0000DABC 907F00A8 */ stw r3, 0xa8(r31)
lbl_0000DAC0:
/* 0000DAC0 90650000 */ stw r3, 0(r5)
/* 0000DAC4 90650004 */ stw r3, 4(r5)
/* 0000DAC8 90650008 */ stw r3, 8(r5)
/* 0000DACC 9065000C */ stw r3, 0xc(r5)
/* 0000DAD0 90650010 */ stw r3, 0x10(r5)
/* 0000DAD4 90650014 */ stw r3, 0x14(r5)
/* 0000DAD8 90650018 */ stw r3, 0x18(r5)
/* 0000DADC 9065001C */ stw r3, 0x1c(r5)
/* 0000DAE0 38A50020 */ addi r5, r5, 0x20
/* 0000DAE4 4200FFDC */ bdnz lbl_0000DAC0
/* 0000DAE8 3C600000 */ lis r3, motInfo@ha
/* 0000DAEC 801F006C */ lwz r0, 0x6c(r31)
/* 0000DAF0 38630000 */ addi r3, r3, motInfo@l
/* 0000DAF4 80630000 */ lwz r3, 0(r3)
/* 0000DAF8 54006026 */ slwi r0, r0, 0xc
/* 0000DAFC 7C630214 */ add r3, r3, r0
/* 0000DB00 38032000 */ addi r0, r3, 0x2000
/* 0000DB04 901F00AC */ stw r0, 0xac(r31)
/* 0000DB08 807F00AC */ lwz r3, 0xac(r31)
/* 0000DB0C C0030018 */ lfs f0, 0x18(r3)
/* 0000DB10 D01F0008 */ stfs f0, 8(r31)
/* 0000DB14 8001001C */ lwz r0, 0x1c(r1)
/* 0000DB18 83E10014 */ lwz r31, 0x14(r1)
/* 0000DB1C 83C10010 */ lwz r30, 0x10(r1)
/* 0000DB20 38210018 */ addi r1, r1, 0x18
/* 0000DB24 7C0803A6 */ mtlr r0
/* 0000DB28 4E800020 */ blr 
lbl_0000DB2C:
/* 0000DB2C 7C0802A6 */ mflr r0
/* 0000DB30 3C600000 */ lis r3, lbl_802F20AC@ha
/* 0000DB34 90010004 */ stw r0, 4(r1)
/* 0000DB38 3C800000 */ lis r4, lbl_10003BF8@ha
/* 0000DB3C 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000DB40 BF21000C */ stmw r25, 0xc(r1)
/* 0000DB44 3BC30000 */ addi r30, r3, lbl_802F20AC@l
/* 0000DB48 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000DB4C 3B230000 */ addi r25, r3, __OSCurrHeap@l
/* 0000DB50 3BA40000 */ addi r29, r4, lbl_10003BF8@l
/* 0000DB54 801E0000 */ lwz r0, 0(r30)
/* 0000DB58 80790000 */ lwz r3, 0(r25)
/* 0000DB5C 5404103A */ slwi r4, r0, 2
/* 0000DB60 4BFF25FD */ bl OSAllocFromHeap
/* 0000DB64 907D00B0 */ stw r3, 0xb0(r29)
/* 0000DB68 809E0000 */ lwz r4, 0(r30)
/* 0000DB6C 80790000 */ lwz r3, 0(r25)
/* 0000DB70 38040001 */ addi r0, r4, 1
/* 0000DB74 5404103A */ slwi r4, r0, 2
/* 0000DB78 4BFF25E5 */ bl OSAllocFromHeap
/* 0000DB7C 3C800000 */ lis r4, motLabel@ha
/* 0000DB80 907D00B4 */ stw r3, 0xb4(r29)
/* 0000DB84 3BE40000 */ addi r31, r4, motLabel@l
/* 0000DB88 3B400000 */ li r26, 0
/* 0000DB8C 3B600000 */ li r27, 0
/* 0000DB90 480000A0 */ b lbl_0000DC30
lbl_0000DB94:
/* 0000DB94 807D00B0 */ lwz r3, 0xb0(r29)
/* 0000DB98 381A0001 */ addi r0, r26, 1
/* 0000DB9C 3B3AFFFF */ addi r25, r26, -1  ;# fixed addi
/* 0000DBA0 7C03D92E */ stwx r0, r3, r27
/* 0000DBA4 381B0004 */ addi r0, r27, 4
/* 0000DBA8 573C103A */ slwi r28, r25, 2
/* 0000DBAC 809F0000 */ lwz r4, 0(r31)
/* 0000DBB0 807D00B4 */ lwz r3, 0xb4(r29)
/* 0000DBB4 7C04002E */ lwzx r0, r4, r0
/* 0000DBB8 7C03D92E */ stwx r0, r3, r27
/* 0000DBBC 48000064 */ b lbl_0000DC20
lbl_0000DBC0:
/* 0000DBC0 801D00B4 */ lwz r0, 0xb4(r29)
/* 0000DBC4 7C80E214 */ add r4, r0, r28
/* 0000DBC8 80640000 */ lwz r3, 0(r4)
/* 0000DBCC 80840004 */ lwz r4, 4(r4)
/* 0000DBD0 4BFF258D */ bl strcmp
/* 0000DBD4 2C030000 */ cmpwi r3, 0
/* 0000DBD8 40810050 */ ble lbl_0000DC28
/* 0000DBDC 801D00B4 */ lwz r0, 0xb4(r29)
/* 0000DBE0 389C0004 */ addi r4, r28, 4
/* 0000DBE4 3B39FFFF */ addi r25, r25, -1  ;# fixed addi
/* 0000DBE8 7C60E214 */ add r3, r0, r28
/* 0000DBEC 80A30000 */ lwz r5, 0(r3)
/* 0000DBF0 80030004 */ lwz r0, 4(r3)
/* 0000DBF4 90030000 */ stw r0, 0(r3)
/* 0000DBF8 807D00B4 */ lwz r3, 0xb4(r29)
/* 0000DBFC 7CA3212E */ stwx r5, r3, r4
/* 0000DC00 801D00B0 */ lwz r0, 0xb0(r29)
/* 0000DC04 7C60E214 */ add r3, r0, r28
/* 0000DC08 80A30000 */ lwz r5, 0(r3)
/* 0000DC0C 3B9CFFFC */ addi r28, r28, -4  ;# fixed addi
/* 0000DC10 80030004 */ lwz r0, 4(r3)
/* 0000DC14 90030000 */ stw r0, 0(r3)
/* 0000DC18 807D00B0 */ lwz r3, 0xb0(r29)
/* 0000DC1C 7CA3212E */ stwx r5, r3, r4
lbl_0000DC20:
/* 0000DC20 2C190000 */ cmpwi r25, 0
/* 0000DC24 4080FF9C */ bge lbl_0000DBC0
lbl_0000DC28:
/* 0000DC28 3B7B0004 */ addi r27, r27, 4
/* 0000DC2C 3B5A0001 */ addi r26, r26, 1
lbl_0000DC30:
/* 0000DC30 801E0000 */ lwz r0, 0(r30)
/* 0000DC34 7C1A0000 */ cmpw r26, r0
/* 0000DC38 4180FF5C */ blt lbl_0000DB94
/* 0000DC3C 807D00B4 */ lwz r3, 0xb4(r29)
/* 0000DC40 5740103A */ slwi r0, r26, 2
/* 0000DC44 38800000 */ li r4, 0
/* 0000DC48 7C83012E */ stwx r4, r3, r0
/* 0000DC4C 8001002C */ lwz r0, 0x2c(r1)
/* 0000DC50 BB21000C */ lmw r25, 0xc(r1)
/* 0000DC54 38210028 */ addi r1, r1, 0x28
/* 0000DC58 7C0803A6 */ mtlr r0
/* 0000DC5C 4E800020 */ blr 
lbl_0000DC60:
/* 0000DC60 7C0802A6 */ mflr r0
/* 0000DC64 90010004 */ stw r0, 4(r1)
/* 0000DC68 9421FF20 */ stwu r1, -0xe0(r1)
/* 0000DC6C 93E100DC */ stw r31, 0xdc(r1)
/* 0000DC70 93C100D8 */ stw r30, 0xd8(r1)
/* 0000DC74 93A100D4 */ stw r29, 0xd4(r1)
/* 0000DC78 938100D0 */ stw r28, 0xd0(r1)
/* 0000DC7C 40860024 */ bne cr1, lbl_0000DCA0
/* 0000DC80 D8210028 */ stfd f1, 0x28(r1)
/* 0000DC84 D8410030 */ stfd f2, 0x30(r1)
/* 0000DC88 D8610038 */ stfd f3, 0x38(r1)
/* 0000DC8C D8810040 */ stfd f4, 0x40(r1)
/* 0000DC90 D8A10048 */ stfd f5, 0x48(r1)
/* 0000DC94 D8C10050 */ stfd f6, 0x50(r1)
/* 0000DC98 D8E10058 */ stfd f7, 0x58(r1)
/* 0000DC9C D9010060 */ stfd f8, 0x60(r1)
lbl_0000DCA0:
/* 0000DCA0 90610008 */ stw r3, 8(r1)
/* 0000DCA4 3B830000 */ addi r28, r3, 0
/* 0000DCA8 3BA40000 */ addi r29, r4, 0
/* 0000DCAC 9081000C */ stw r4, 0xc(r1)
/* 0000DCB0 90A10010 */ stw r5, 0x10(r1)
/* 0000DCB4 3CA00000 */ lis r5, lbl_10003BF8@ha
/* 0000DCB8 3BE50000 */ addi r31, r5, lbl_10003BF8@l
/* 0000DCBC 90C10014 */ stw r6, 0x14(r1)
/* 0000DCC0 3CC00000 */ lis r6, lbl_000148E8@ha
/* 0000DCC4 3BC60000 */ addi r30, r6, lbl_000148E8@l
/* 0000DCC8 90E10018 */ stw r7, 0x18(r1)
/* 0000DCCC 9101001C */ stw r8, 0x1c(r1)
/* 0000DCD0 91210020 */ stw r9, 0x20(r1)
/* 0000DCD4 91410024 */ stw r10, 0x24(r1)
/* 0000DCD8 80BF0078 */ lwz r5, 0x78(r31)
/* 0000DCDC 801F007C */ lwz r0, 0x7c(r31)
/* 0000DCE0 7C050000 */ cmpw r5, r0
/* 0000DCE4 40820018 */ bne lbl_0000DCFC
/* 0000DCE8 38600002 */ li r3, 2
/* 0000DCEC 4BFF2471 */ bl g_debug_set_text_color
/* 0000DCF0 387E0E98 */ addi r3, r30, 0xe98
/* 0000DCF4 4BFF2469 */ bl g_debug_print
/* 0000DCF8 48000014 */ b lbl_0000DD0C
lbl_0000DCFC:
/* 0000DCFC 38600000 */ li r3, 0
/* 0000DD00 4BFF245D */ bl g_debug_set_text_color
/* 0000DD04 387E0E9C */ addi r3, r30, 0xe9c
/* 0000DD08 4BFF2455 */ bl g_debug_print
lbl_0000DD0C:
/* 0000DD0C 7F83E378 */ mr r3, r28
/* 0000DD10 4BFF244D */ bl g_debug_print
/* 0000DD14 807F0078 */ lwz r3, 0x78(r31)
/* 0000DD18 801F007C */ lwz r0, 0x7c(r31)
/* 0000DD1C 7C030000 */ cmpw r3, r0
/* 0000DD20 40820010 */ bne lbl_0000DD30
/* 0000DD24 38600002 */ li r3, 2
/* 0000DD28 4BFF2435 */ bl g_debug_set_text_color
/* 0000DD2C 4800000C */ b lbl_0000DD38
lbl_0000DD30:
/* 0000DD30 38600001 */ li r3, 1
/* 0000DD34 4BFF2429 */ bl g_debug_set_text_color
lbl_0000DD38:
/* 0000DD38 3C000200 */ lis r0, 0x200
/* 0000DD3C 900100C0 */ stw r0, 0xc0(r1)
/* 0000DD40 380100E8 */ addi r0, r1, 0xe8
/* 0000DD44 38A100C0 */ addi r5, r1, 0xc0
/* 0000DD48 900100C4 */ stw r0, 0xc4(r1)
/* 0000DD4C 38010008 */ addi r0, r1, 8
/* 0000DD50 389D0000 */ addi r4, r29, 0
/* 0000DD54 900100C8 */ stw r0, 0xc8(r1)
/* 0000DD58 38610070 */ addi r3, r1, 0x70
/* 0000DD5C 4BFF2401 */ bl vsprintf
/* 0000DD60 38610070 */ addi r3, r1, 0x70
/* 0000DD64 4BFF23F9 */ bl g_debug_print
/* 0000DD68 809F007C */ lwz r4, 0x7c(r31)
/* 0000DD6C 38600000 */ li r3, 0
/* 0000DD70 38040001 */ addi r0, r4, 1
/* 0000DD74 901F007C */ stw r0, 0x7c(r31)
/* 0000DD78 4BFF23E5 */ bl g_debug_set_text_color
/* 0000DD7C 387E0EAC */ addi r3, r30, 0xeac
/* 0000DD80 4BFF23DD */ bl g_debug_print
/* 0000DD84 800100E4 */ lwz r0, 0xe4(r1)
/* 0000DD88 83E100DC */ lwz r31, 0xdc(r1)
/* 0000DD8C 83C100D8 */ lwz r30, 0xd8(r1)
/* 0000DD90 7C0803A6 */ mtlr r0
/* 0000DD94 83A100D4 */ lwz r29, 0xd4(r1)
/* 0000DD98 838100D0 */ lwz r28, 0xd0(r1)
/* 0000DD9C 382100E0 */ addi r1, r1, 0xe0
/* 0000DDA0 4E800020 */ blr 
lbl_0000DDA4:
/* 0000DDA4 7C0802A6 */ mflr r0
/* 0000DDA8 3C800000 */ lis r4, lbl_000101FC@ha
/* 0000DDAC 90010004 */ stw r0, 4(r1)
/* 0000DDB0 38A40000 */ addi r5, r4, lbl_000101FC@l
/* 0000DDB4 3CC00000 */ lis r6, lbl_10003BF8@ha
/* 0000DDB8 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000DDBC 3CE00000 */ lis r7, lbl_000148E8@ha
/* 0000DDC0 BF61002C */ stmw r27, 0x2c(r1)
/* 0000DDC4 3B830000 */ addi r28, r3, 0
/* 0000DDC8 3BE60000 */ addi r31, r6, lbl_10003BF8@l
/* 0000DDCC 3BA10010 */ addi r29, r1, 0x10
/* 0000DDD0 3BC70000 */ addi r30, r7, lbl_000148E8@l
/* 0000DDD4 80850000 */ lwz r4, 0(r5)
/* 0000DDD8 80050004 */ lwz r0, 4(r5)
/* 0000DDDC 90810010 */ stw r4, 0x10(r1)
/* 0000DDE0 90010014 */ stw r0, 0x14(r1)
/* 0000DDE4 80650008 */ lwz r3, 8(r5)
/* 0000DDE8 8005000C */ lwz r0, 0xc(r5)
/* 0000DDEC 90610018 */ stw r3, 0x18(r1)
/* 0000DDF0 9001001C */ stw r0, 0x1c(r1)
/* 0000DDF4 80650010 */ lwz r3, 0x10(r5)
/* 0000DDF8 80050014 */ lwz r0, 0x14(r5)
/* 0000DDFC 90610020 */ stw r3, 0x20(r1)
/* 0000DE00 90010024 */ stw r0, 0x24(r1)
/* 0000DE04 807F0078 */ lwz r3, 0x78(r31)
/* 0000DE08 801F007C */ lwz r0, 0x7c(r31)
/* 0000DE0C 7C030050 */ subf r0, r3, r0
/* 0000DE10 7C000034 */ cntlzw r0, r0
/* 0000DE14 5400D97E */ srwi r0, r0, 5
/* 0000DE18 1F60000C */ mulli r27, r0, 0xc
/* 0000DE1C 7FBDDA14 */ add r29, r29, r27
/* 0000DE20 801D0000 */ lwz r0, 0(r29)
/* 0000DE24 5403063E */ clrlwi r3, r0, 0x18
/* 0000DE28 4BFF2335 */ bl g_debug_set_text_color
/* 0000DE2C 807F0078 */ lwz r3, 0x78(r31)
/* 0000DE30 801F007C */ lwz r0, 0x7c(r31)
/* 0000DE34 7C030000 */ cmpw r3, r0
/* 0000DE38 40820010 */ bne lbl_0000DE48
/* 0000DE3C 387E0EB0 */ addi r3, r30, 0xeb0
/* 0000DE40 4BFF231D */ bl g_debug_print
/* 0000DE44 4800000C */ b lbl_0000DE50
lbl_0000DE48:
/* 0000DE48 387E0EB4 */ addi r3, r30, 0xeb4
/* 0000DE4C 4BFF2311 */ bl g_debug_print
lbl_0000DE50:
/* 0000DE50 809C0004 */ lwz r4, 4(r28)
/* 0000DE54 387E0EB8 */ addi r3, r30, 0xeb8
/* 0000DE58 4CC63182 */ crclr 6
/* 0000DE5C 4BFF2301 */ bl g_debug_printf
/* 0000DE60 80BC0010 */ lwz r5, 0x10(r28)
/* 0000DE64 38000003 */ li r0, 3
/* 0000DE68 54040FFE */ srwi r4, r0, 0x1f
/* 0000DE6C 7CA3FE70 */ srawi r3, r5, 0x1f
/* 0000DE70 7C002810 */ subfc r0, r0, r5
/* 0000DE74 7C032114 */ adde r0, r3, r4
/* 0000DE78 5400103A */ slwi r0, r0, 2
/* 0000DE7C 38610014 */ addi r3, r1, 0x14
/* 0000DE80 7C1B0214 */ add r0, r27, r0
/* 0000DE84 7C03002E */ lwzx r0, r3, r0
/* 0000DE88 5403063E */ clrlwi r3, r0, 0x18
/* 0000DE8C 4BFF22D1 */ bl g_debug_set_text_color
/* 0000DE90 809C0010 */ lwz r4, 0x10(r28)
/* 0000DE94 3C600000 */ lis r3, lbl_801C6470@ha
/* 0000DE98 38030000 */ addi r0, r3, lbl_801C6470@l
/* 0000DE9C 4CC63182 */ crclr 6
/* 0000DEA0 5483103A */ slwi r3, r4, 2
/* 0000DEA4 7C601A14 */ add r3, r0, r3
/* 0000DEA8 80830000 */ lwz r4, 0(r3)
/* 0000DEAC 387E0EBC */ addi r3, r30, 0xebc
/* 0000DEB0 4BFF22AD */ bl g_debug_printf
/* 0000DEB4 801D0000 */ lwz r0, 0(r29)
/* 0000DEB8 5403063E */ clrlwi r3, r0, 0x18
/* 0000DEBC 4BFF22A1 */ bl g_debug_set_text_color
/* 0000DEC0 801C0000 */ lwz r0, 0(r28)
/* 0000DEC4 2C000008 */ cmpwi r0, 8
/* 0000DEC8 4080001C */ bge lbl_0000DEE4
/* 0000DECC 3C600000 */ lis r3, lbl_801C6420@ha
/* 0000DED0 5404103A */ slwi r4, r0, 2
/* 0000DED4 38030000 */ addi r0, r3, lbl_801C6420@l
/* 0000DED8 7C602214 */ add r3, r0, r4
/* 0000DEDC 80830000 */ lwz r4, 0(r3)
/* 0000DEE0 48000008 */ b lbl_0000DEE8
lbl_0000DEE4:
/* 0000DEE4 389E0EC4 */ addi r4, r30, 0xec4
lbl_0000DEE8:
/* 0000DEE8 80BC0008 */ lwz r5, 8(r28)
/* 0000DEEC 387E0ED0 */ addi r3, r30, 0xed0
/* 0000DEF0 4CC63182 */ crclr 6
/* 0000DEF4 4BFF2269 */ bl g_debug_printf
/* 0000DEF8 809F007C */ lwz r4, 0x7c(r31)
/* 0000DEFC 38600000 */ li r3, 0
/* 0000DF00 38040001 */ addi r0, r4, 1
/* 0000DF04 901F007C */ stw r0, 0x7c(r31)
/* 0000DF08 4BFF2255 */ bl g_debug_set_text_color
/* 0000DF0C 387E0EAC */ addi r3, r30, 0xeac
/* 0000DF10 4BFF224D */ bl g_debug_print
/* 0000DF14 BB61002C */ lmw r27, 0x2c(r1)
/* 0000DF18 80010044 */ lwz r0, 0x44(r1)
/* 0000DF1C 38210040 */ addi r1, r1, 0x40
/* 0000DF20 7C0803A6 */ mtlr r0
/* 0000DF24 4E800020 */ blr 
lbl_0000DF28:
/* 0000DF28 7C0802A6 */ mflr r0
/* 0000DF2C 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000DF30 90010004 */ stw r0, 4(r1)
/* 0000DF34 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000DF38 BF410010 */ stmw r26, 0x10(r1)
/* 0000DF3C 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000DF40 3C600000 */ lis r3, lbl_000148E8@ha
/* 0000DF44 3B630000 */ addi r27, r3, lbl_000148E8@l
/* 0000DF48 3BA00000 */ li r29, 0
/* 0000DF4C 801F008C */ lwz r0, 0x8c(r31)
/* 0000DF50 2C000000 */ cmpwi r0, 0
/* 0000DF54 4082001C */ bne lbl_0000DF70
/* 0000DF58 801F0058 */ lwz r0, 0x58(r31)
/* 0000DF5C 2C000000 */ cmpwi r0, 0
/* 0000DF60 93BF0058 */ stw r29, 0x58(r31)
/* 0000DF64 4182000C */ beq lbl_0000DF70
/* 0000DF68 93BF0088 */ stw r29, 0x88(r31)
/* 0000DF6C 48000340 */ b lbl_0000E2AC
lbl_0000DF70:
/* 0000DF70 3BC00000 */ li r30, 0
/* 0000DF74 93DF007C */ stw r30, 0x7c(r31)
/* 0000DF78 38600003 */ li r3, 3
/* 0000DF7C 38800007 */ li r4, 7
/* 0000DF80 4BFF21DD */ bl g_debug_set_cursor_pos
/* 0000DF84 387B0EDC */ addi r3, r27, 0xedc
/* 0000DF88 4CC63182 */ crclr 6
/* 0000DF8C 4BFF21D1 */ bl g_debug_printf
/* 0000DF90 38600001 */ li r3, 1
/* 0000DF94 38800008 */ li r4, 8
/* 0000DF98 4BFF21C5 */ bl g_debug_set_cursor_pos
/* 0000DF9C 80BF006C */ lwz r5, 0x6c(r31)
/* 0000DFA0 387B0EF4 */ addi r3, r27, 0xef4
/* 0000DFA4 389B0EFC */ addi r4, r27, 0xefc
/* 0000DFA8 4CC63182 */ crclr 6
/* 0000DFAC 4BFFFCB5 */ bl lbl_0000DC60
/* 0000DFB0 801F006C */ lwz r0, 0x6c(r31)
/* 0000DFB4 3C600000 */ lis r3, motInfo@ha
/* 0000DFB8 3B830000 */ addi r28, r3, motInfo@l
/* 0000DFBC 4CC63182 */ crclr 6
/* 0000DFC0 1C0000B4 */ mulli r0, r0, 0xb4
/* 0000DFC4 80BC0000 */ lwz r5, 0(r28)
/* 0000DFC8 387B0F00 */ addi r3, r27, 0xf00
/* 0000DFCC 389B0F0C */ addi r4, r27, 0xf0c
/* 0000DFD0 7CA50214 */ add r5, r5, r0
/* 0000DFD4 4BFFFC8D */ bl lbl_0000DC60
/* 0000DFD8 801F006C */ lwz r0, 0x6c(r31)
/* 0000DFDC 387B0F10 */ addi r3, r27, 0xf10
/* 0000DFE0 80DC0000 */ lwz r6, 0(r28)
/* 0000DFE4 389B0F0C */ addi r4, r27, 0xf0c
/* 0000DFE8 1CA000B4 */ mulli r5, r0, 0xb4
/* 0000DFEC 4CC63182 */ crclr 6
/* 0000DFF0 38A50018 */ addi r5, r5, 0x18
/* 0000DFF4 7CA62A14 */ add r5, r6, r5
/* 0000DFF8 4BFFFC69 */ bl lbl_0000DC60
/* 0000DFFC 801F008C */ lwz r0, 0x8c(r31)
/* 0000E000 2C000000 */ cmpwi r0, 0
/* 0000E004 41820008 */ beq lbl_0000E00C
/* 0000E008 48000058 */ b lbl_0000E060
lbl_0000E00C:
/* 0000E00C 4BFFF079 */ bl lbl_0000D084
/* 0000E010 2C030001 */ cmpwi r3, 1
/* 0000E014 40820024 */ bne lbl_0000E038
/* 0000E018 809F0078 */ lwz r4, 0x78(r31)
/* 0000E01C 3404FFFF */ addic. r0, r4, -1  ;# fixed addi
/* 0000E020 901F0078 */ stw r0, 0x78(r31)
/* 0000E024 40800038 */ bge lbl_0000E05C
/* 0000E028 809F007C */ lwz r4, 0x7c(r31)
/* 0000E02C 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 0000E030 901F0078 */ stw r0, 0x78(r31)
/* 0000E034 48000028 */ b lbl_0000E05C
lbl_0000E038:
/* 0000E038 2C030002 */ cmpwi r3, 2
/* 0000E03C 40820020 */ bne lbl_0000E05C
/* 0000E040 809F0078 */ lwz r4, 0x78(r31)
/* 0000E044 38840001 */ addi r4, r4, 1
/* 0000E048 909F0078 */ stw r4, 0x78(r31)
/* 0000E04C 801F007C */ lwz r0, 0x7c(r31)
/* 0000E050 7C040000 */ cmpw r4, r0
/* 0000E054 41800008 */ blt lbl_0000E05C
/* 0000E058 93DF0078 */ stw r30, 0x78(r31)
lbl_0000E05C:
/* 0000E05C 7C7E1B78 */ mr r30, r3
lbl_0000E060:
/* 0000E060 801F0078 */ lwz r0, 0x78(r31)
/* 0000E064 2C000001 */ cmpwi r0, 1
/* 0000E068 41820078 */ beq lbl_0000E0E0
/* 0000E06C 40800010 */ bge lbl_0000E07C
/* 0000E070 2C000000 */ cmpwi r0, 0
/* 0000E074 40800014 */ bge lbl_0000E088
/* 0000E078 48000228 */ b lbl_0000E2A0
lbl_0000E07C:
/* 0000E07C 2C000003 */ cmpwi r0, 3
/* 0000E080 40800220 */ bge lbl_0000E2A0
/* 0000E084 48000138 */ b lbl_0000E1BC
lbl_0000E088:
/* 0000E088 2C1E0003 */ cmpwi r30, 3
/* 0000E08C 807F006C */ lwz r3, 0x6c(r31)
/* 0000E090 4082001C */ bne lbl_0000E0AC
/* 0000E094 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000E098 901F006C */ stw r0, 0x6c(r31)
/* 0000E09C 40800030 */ bge lbl_0000E0CC
/* 0000E0A0 38000003 */ li r0, 3
/* 0000E0A4 901F006C */ stw r0, 0x6c(r31)
/* 0000E0A8 48000024 */ b lbl_0000E0CC
lbl_0000E0AC:
/* 0000E0AC 2C1E0004 */ cmpwi r30, 4
/* 0000E0B0 4082001C */ bne lbl_0000E0CC
/* 0000E0B4 38030001 */ addi r0, r3, 1
/* 0000E0B8 2C000003 */ cmpwi r0, 3
/* 0000E0BC 901F006C */ stw r0, 0x6c(r31)
/* 0000E0C0 4081000C */ ble lbl_0000E0CC
/* 0000E0C4 38000000 */ li r0, 0
/* 0000E0C8 901F006C */ stw r0, 0x6c(r31)
lbl_0000E0CC:
/* 0000E0CC 801F006C */ lwz r0, 0x6c(r31)
/* 0000E0D0 7C630050 */ subf r3, r3, r0
/* 0000E0D4 3003FFFF */ addic r0, r3, -1  ;# fixed addi
/* 0000E0D8 7FA01910 */ subfe r29, r0, r3
/* 0000E0DC 480001C4 */ b lbl_0000E2A0
lbl_0000E0E0:
/* 0000E0E0 801F008C */ lwz r0, 0x8c(r31)
/* 0000E0E4 2C000000 */ cmpwi r0, 0
/* 0000E0E8 40820098 */ bne lbl_0000E180
/* 0000E0EC 801F0054 */ lwz r0, 0x54(r31)
/* 0000E0F0 3B600000 */ li r27, 0
/* 0000E0F4 2C000000 */ cmpwi r0, 0
/* 0000E0F8 937F0054 */ stw r27, 0x54(r31)
/* 0000E0FC 41820084 */ beq lbl_0000E180
/* 0000E100 801F006C */ lwz r0, 0x6c(r31)
/* 0000E104 3C600000 */ lis r3, motInfo@ha
/* 0000E108 38630000 */ addi r3, r3, motInfo@l
/* 0000E10C 83DF0080 */ lwz r30, 0x80(r31)
/* 0000E110 1C0000B4 */ mulli r0, r0, 0xb4
/* 0000E114 80630000 */ lwz r3, 0(r3)
/* 0000E118 7F430214 */ add r26, r3, r0
/* 0000E11C 387A0000 */ addi r3, r26, 0
/* 0000E120 4BFF203D */ bl strlen
/* 0000E124 93DF0098 */ stw r30, 0x98(r31)
/* 0000E128 5760103A */ slwi r0, r27, 2
/* 0000E12C 3B830000 */ addi r28, r3, 0
/* 0000E130 7FDE0214 */ add r30, r30, r0
/* 0000E134 4800002C */ b lbl_0000E160
lbl_0000E138:
/* 0000E138 387A0000 */ addi r3, r26, 0
/* 0000E13C 38BC0000 */ addi r5, r28, 0
/* 0000E140 4BFF201D */ bl strncmp
/* 0000E144 2C030000 */ cmpwi r3, 0
/* 0000E148 40820010 */ bne lbl_0000E158
/* 0000E14C 937F0090 */ stw r27, 0x90(r31)
/* 0000E150 937F0094 */ stw r27, 0x94(r31)
/* 0000E154 48000024 */ b lbl_0000E178
lbl_0000E158:
/* 0000E158 3BDE0004 */ addi r30, r30, 4
/* 0000E15C 3B7B0001 */ addi r27, r27, 1
lbl_0000E160:
/* 0000E160 809E0000 */ lwz r4, 0(r30)
/* 0000E164 28040000 */ cmplwi r4, 0
/* 0000E168 4082FFD0 */ bne lbl_0000E138
/* 0000E16C 38000000 */ li r0, 0
/* 0000E170 901F0090 */ stw r0, 0x90(r31)
/* 0000E174 901F0094 */ stw r0, 0x94(r31)
lbl_0000E178:
/* 0000E178 38000001 */ li r0, 1
/* 0000E17C 901F008C */ stw r0, 0x8c(r31)
lbl_0000E180:
/* 0000E180 801F00A4 */ lwz r0, 0xa4(r31)
/* 0000E184 2C000000 */ cmpwi r0, 0
/* 0000E188 41820118 */ beq lbl_0000E2A0
/* 0000E18C 807F006C */ lwz r3, 0x6c(r31)
/* 0000E190 3C800000 */ lis r4, motInfo@ha
/* 0000E194 801F0090 */ lwz r0, 0x90(r31)
/* 0000E198 3BA00001 */ li r29, 1
/* 0000E19C 1CA300B4 */ mulli r5, r3, 0xb4
/* 0000E1A0 807F0080 */ lwz r3, 0x80(r31)
/* 0000E1A4 80C40000 */ lwz r6, motInfo@l(r4)
/* 0000E1A8 5400103A */ slwi r0, r0, 2
/* 0000E1AC 7C83002E */ lwzx r4, r3, r0
/* 0000E1B0 7C662A14 */ add r3, r6, r5
/* 0000E1B4 4BFF1FA9 */ bl strcpy
/* 0000E1B8 480000E8 */ b lbl_0000E2A0
lbl_0000E1BC:
/* 0000E1BC 801F008C */ lwz r0, 0x8c(r31)
/* 0000E1C0 2C000000 */ cmpwi r0, 0
/* 0000E1C4 4082009C */ bne lbl_0000E260
/* 0000E1C8 801F0054 */ lwz r0, 0x54(r31)
/* 0000E1CC 3B400000 */ li r26, 0
/* 0000E1D0 2C000000 */ cmpwi r0, 0
/* 0000E1D4 935F0054 */ stw r26, 0x54(r31)
/* 0000E1D8 41820088 */ beq lbl_0000E260
/* 0000E1DC 801F006C */ lwz r0, 0x6c(r31)
/* 0000E1E0 3C600000 */ lis r3, motInfo@ha
/* 0000E1E4 38830000 */ addi r4, r3, motInfo@l
/* 0000E1E8 839F0084 */ lwz r28, 0x84(r31)
/* 0000E1EC 1C6000B4 */ mulli r3, r0, 0xb4
/* 0000E1F0 80040000 */ lwz r0, 0(r4)
/* 0000E1F4 3BC30018 */ addi r30, r3, 0x18
/* 0000E1F8 7FC0F214 */ add r30, r0, r30
/* 0000E1FC 387E0000 */ addi r3, r30, 0
/* 0000E200 4BFF1F5D */ bl strlen
/* 0000E204 939F0098 */ stw r28, 0x98(r31)
/* 0000E208 5740103A */ slwi r0, r26, 2
/* 0000E20C 3B630000 */ addi r27, r3, 0
/* 0000E210 7F9C0214 */ add r28, r28, r0
/* 0000E214 4800002C */ b lbl_0000E240
lbl_0000E218:
/* 0000E218 387E0000 */ addi r3, r30, 0
/* 0000E21C 38BB0000 */ addi r5, r27, 0
/* 0000E220 4BFF1F3D */ bl strncmp
/* 0000E224 2C030000 */ cmpwi r3, 0
/* 0000E228 40820010 */ bne lbl_0000E238
/* 0000E22C 935F0090 */ stw r26, 0x90(r31)
/* 0000E230 935F0094 */ stw r26, 0x94(r31)
/* 0000E234 48000024 */ b lbl_0000E258
lbl_0000E238:
/* 0000E238 3B9C0004 */ addi r28, r28, 4
/* 0000E23C 3B5A0001 */ addi r26, r26, 1
lbl_0000E240:
/* 0000E240 809C0000 */ lwz r4, 0(r28)
/* 0000E244 28040000 */ cmplwi r4, 0
/* 0000E248 4082FFD0 */ bne lbl_0000E218
/* 0000E24C 38000000 */ li r0, 0
/* 0000E250 901F0090 */ stw r0, 0x90(r31)
/* 0000E254 901F0094 */ stw r0, 0x94(r31)
lbl_0000E258:
/* 0000E258 38000001 */ li r0, 1
/* 0000E25C 901F008C */ stw r0, 0x8c(r31)
lbl_0000E260:
/* 0000E260 801F00A4 */ lwz r0, 0xa4(r31)
/* 0000E264 2C000000 */ cmpwi r0, 0
/* 0000E268 41820038 */ beq lbl_0000E2A0
/* 0000E26C 807F006C */ lwz r3, 0x6c(r31)
/* 0000E270 3C800000 */ lis r4, motInfo@ha
/* 0000E274 801F0090 */ lwz r0, 0x90(r31)
/* 0000E278 38A40000 */ addi r5, r4, motInfo@l
/* 0000E27C 1C6300B4 */ mulli r3, r3, 0xb4
/* 0000E280 809F0084 */ lwz r4, 0x84(r31)
/* 0000E284 80A50000 */ lwz r5, 0(r5)
/* 0000E288 5400103A */ slwi r0, r0, 2
/* 0000E28C 38630018 */ addi r3, r3, 0x18
/* 0000E290 7C84002E */ lwzx r4, r4, r0
/* 0000E294 7C651A14 */ add r3, r5, r3
/* 0000E298 3BA00001 */ li r29, 1
/* 0000E29C 4BFF1EC1 */ bl strcpy
lbl_0000E2A0:
/* 0000E2A0 2C1D0000 */ cmpwi r29, 0
/* 0000E2A4 41820008 */ beq lbl_0000E2AC
/* 0000E2A8 4BFFF755 */ bl lbl_0000D9FC
lbl_0000E2AC:
/* 0000E2AC BB410010 */ lmw r26, 0x10(r1)
/* 0000E2B0 8001002C */ lwz r0, 0x2c(r1)
/* 0000E2B4 38210028 */ addi r1, r1, 0x28
/* 0000E2B8 7C0803A6 */ mtlr r0
/* 0000E2BC 4E800020 */ blr 
lbl_0000E2C0:
/* 0000E2C0 3C800000 */ lis r4, lbl_10003C80@ha
/* 0000E2C4 84040000 */ lwzu r0, lbl_10003C80@l(r4)
/* 0000E2C8 28000000 */ cmplwi r0, 0
/* 0000E2CC 4C820020 */ bnelr 
/* 0000E2D0 2C030000 */ cmpwi r3, 0
/* 0000E2D4 4D820020 */ beqlr 
/* 0000E2D8 3C600000 */ lis r3, lbl_0000DF28@ha
/* 0000E2DC 38030000 */ addi r0, r3, lbl_0000DF28@l
/* 0000E2E0 90040000 */ stw r0, 0(r4)
/* 0000E2E4 4E800020 */ blr 
lbl_0000E2E8:
/* 0000E2E8 3C600000 */ lis r3, lbl_10003BFC@ha
/* 0000E2EC 80A30000 */ lwz r5, lbl_10003BFC@l(r3)
/* 0000E2F0 3C600000 */ lis r3, motInfo@ha
/* 0000E2F4 38830000 */ addi r4, r3, motInfo@l
/* 0000E2F8 8065001C */ lwz r3, 0x1c(r5)
/* 0000E2FC 38A00000 */ li r5, 0
/* 0000E300 38C3001C */ addi r6, r3, 0x1c
/* 0000E304 48000030 */ b lbl_0000E334
lbl_0000E308:
/* 0000E308 80640000 */ lwz r3, 0(r4)
/* 0000E30C 54002834 */ slwi r0, r0, 5
/* 0000E310 3C630003 */ addis r3, r3, 3
/* 0000E314 7C630214 */ add r3, r3, r0
/* 0000E318 90A3800C */ stw r5, -0x7ff4(r3)
/* 0000E31C 80640000 */ lwz r3, 0(r4)
/* 0000E320 80060000 */ lwz r0, 0(r6)
/* 0000E324 3C630003 */ addis r3, r3, 3
/* 0000E328 54002834 */ slwi r0, r0, 5
/* 0000E32C 7C630214 */ add r3, r3, r0
/* 0000E330 38C38014 */ addi r6, r3, -32748  ;# fixed addi
lbl_0000E334:
/* 0000E334 80060000 */ lwz r0, 0(r6)
/* 0000E338 2C000000 */ cmpwi r0, 0
/* 0000E33C 4082FFCC */ bne lbl_0000E308
/* 0000E340 3C600000 */ lis r3, lbl_10003BFC@ha
/* 0000E344 80830000 */ lwz r4, lbl_10003BFC@l(r3)
/* 0000E348 3C600000 */ lis r3, motInfo@ha
/* 0000E34C 38A30000 */ addi r5, r3, motInfo@l
/* 0000E350 8064001C */ lwz r3, 0x1c(r4)
/* 0000E354 3903001C */ addi r8, r3, 0x1c
/* 0000E358 48000080 */ b lbl_0000E3D8
lbl_0000E35C:
/* 0000E35C 80650000 */ lwz r3, 0(r5)
/* 0000E360 54002834 */ slwi r0, r0, 5
/* 0000E364 3C630003 */ addis r3, r3, 3
/* 0000E368 7CC30214 */ add r6, r3, r0
/* 0000E36C 8006800C */ lwz r0, -0x7ff4(r6)
/* 0000E370 38C68000 */ addi r6, r6, -32768  ;# fixed addi
/* 0000E374 28000000 */ cmplwi r0, 0
/* 0000E378 40820048 */ bne lbl_0000E3C0
/* 0000E37C 80060014 */ lwz r0, 0x14(r6)
/* 0000E380 48000038 */ b lbl_0000E3B8
lbl_0000E384:
/* 0000E384 80E50000 */ lwz r7, 0(r5)
/* 0000E388 54002834 */ slwi r0, r0, 5
/* 0000E38C 80660010 */ lwz r3, 0x10(r6)
/* 0000E390 3C870003 */ addis r4, r7, 3
/* 0000E394 7C840214 */ add r4, r4, r0
/* 0000E398 80048010 */ lwz r0, -0x7ff0(r4)
/* 0000E39C 38848000 */ addi r4, r4, -32768  ;# fixed addi
/* 0000E3A0 7C030000 */ cmpw r3, r0
/* 0000E3A4 40820010 */ bne lbl_0000E3B4
/* 0000E3A8 7C072050 */ subf r0, r7, r4
/* 0000E3AC 9006000C */ stw r0, 0xc(r6)
/* 0000E3B0 7C862378 */ mr r6, r4
lbl_0000E3B4:
/* 0000E3B4 80040014 */ lwz r0, 0x14(r4)
lbl_0000E3B8:
/* 0000E3B8 2C000000 */ cmpwi r0, 0
/* 0000E3BC 4082FFC8 */ bne lbl_0000E384
lbl_0000E3C0:
/* 0000E3C0 80650000 */ lwz r3, 0(r5)
/* 0000E3C4 80080000 */ lwz r0, 0(r8)
/* 0000E3C8 3C630003 */ addis r3, r3, 3
/* 0000E3CC 54002834 */ slwi r0, r0, 5
/* 0000E3D0 7C630214 */ add r3, r3, r0
/* 0000E3D4 39038014 */ addi r8, r3, -32748  ;# fixed addi
lbl_0000E3D8:
/* 0000E3D8 80080000 */ lwz r0, 0(r8)
/* 0000E3DC 2C000000 */ cmpwi r0, 0
/* 0000E3E0 4082FF7C */ bne lbl_0000E35C
/* 0000E3E4 4E800020 */ blr 
lbl_0000E3E8:
/* 0000E3E8 7C0802A6 */ mflr r0
/* 0000E3EC 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000E3F0 90010004 */ stw r0, 4(r1)
/* 0000E3F4 9421FFB8 */ stwu r1, -0x48(r1)
/* 0000E3F8 93E10044 */ stw r31, 0x44(r1)
/* 0000E3FC 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000E400 3C600000 */ lis r3, lbl_000101E0@ha
/* 0000E404 93C10040 */ stw r30, 0x40(r1)
/* 0000E408 3BC30000 */ addi r30, r3, lbl_000101E0@l
/* 0000E40C 93A1003C */ stw r29, 0x3c(r1)
/* 0000E410 83BF00C0 */ lwz r29, 0xc0(r31)
/* 0000E414 4BFF1D49 */ bl mathutil_mtxA_push
/* 0000E418 4BFF1D45 */ bl mathutil_mtxA_from_identity
/* 0000E41C C03E000C */ lfs f1, 0xc(r30)
/* 0000E420 C05E007C */ lfs f2, 0x7c(r30)
/* 0000E424 C07E0080 */ lfs f3, 0x80(r30)
/* 0000E428 4BFF1D35 */ bl mathutil_mtxA_translate_xyz
/* 0000E42C 801D0000 */ lwz r0, 0(r29)
/* 0000E430 2C000004 */ cmpwi r0, 4
/* 0000E434 40800018 */ bge lbl_0000E44C
/* 0000E438 2C000002 */ cmpwi r0, 2
/* 0000E43C 4080005C */ bge lbl_0000E498
/* 0000E440 2C000000 */ cmpwi r0, 0
/* 0000E444 40800014 */ bge lbl_0000E458
/* 0000E448 480001C0 */ b lbl_0000E608
lbl_0000E44C:
/* 0000E44C 2C000007 */ cmpwi r0, 7
/* 0000E450 41820068 */ beq lbl_0000E4B8
/* 0000E454 408001B4 */ bge lbl_0000E608
lbl_0000E458:
/* 0000E458 3860C000 */ li r3, -16384
/* 0000E45C 4BFF1D01 */ bl mathutil_mtxA_rotate_z
/* 0000E460 3860C000 */ li r3, -16384
/* 0000E464 4BFF1CF9 */ bl mathutil_mtxA_rotate_y
/* 0000E468 C03E0084 */ lfs f1, 0x84(r30)
/* 0000E46C 4BFF1CF1 */ bl mathutil_mtxA_scale_s
/* 0000E470 3C600000 */ lis r3, mathutilData@ha
/* 0000E474 38630000 */ addi r3, r3, mathutilData@l
/* 0000E478 80630000 */ lwz r3, 0(r3)
/* 0000E47C 38800000 */ li r4, 0
/* 0000E480 4BFF1CDD */ bl g_gxutil_upload_some_mtx
/* 0000E484 807F0004 */ lwz r3, 4(r31)
/* 0000E488 809D0000 */ lwz r4, 0(r29)
/* 0000E48C 80BD0008 */ lwz r5, 8(r29)
/* 0000E490 4BFF1CCD */ bl func_80086D20
/* 0000E494 48000174 */ b lbl_0000E608
lbl_0000E498:
/* 0000E498 3860000F */ li r3, 0xf
/* 0000E49C 38800014 */ li r4, 0x14
/* 0000E4A0 4BFF1CBD */ bl g_debug_set_cursor_pos
/* 0000E4A4 3C600000 */ lis r3, lbl_00015868@ha
/* 0000E4A8 4CC63182 */ crclr 6
/* 0000E4AC 38630000 */ addi r3, r3, lbl_00015868@l
/* 0000E4B0 4BFF1CAD */ bl g_debug_printf
/* 0000E4B4 48000154 */ b lbl_0000E608
lbl_0000E4B8:
/* 0000E4B8 C03E000C */ lfs f1, 0xc(r30)
/* 0000E4BC C05E0088 */ lfs f2, 0x88(r30)
/* 0000E4C0 FC600890 */ fmr f3, f1
/* 0000E4C4 4BFF1C99 */ bl mathutil_mtxA_translate_xyz
/* 0000E4C8 3860C000 */ li r3, -16384
/* 0000E4CC 4BFF1C91 */ bl mathutil_mtxA_rotate_z
/* 0000E4D0 3860C000 */ li r3, -16384
/* 0000E4D4 4BFF1C89 */ bl mathutil_mtxA_rotate_y
/* 0000E4D8 801D0008 */ lwz r0, 8(r29)
/* 0000E4DC 3C600000 */ lis r3, lbl_00010278@ha
/* 0000E4E0 C8230000 */ lfd f1, lbl_00010278@l(r3)
/* 0000E4E4 6C008000 */ xoris r0, r0, 0x8000
/* 0000E4E8 C05E008C */ lfs f2, 0x8c(r30)
/* 0000E4EC 90010034 */ stw r0, 0x34(r1)
/* 0000E4F0 3C004330 */ lis r0, 0x4330
/* 0000E4F4 90010030 */ stw r0, 0x30(r1)
/* 0000E4F8 C8010030 */ lfd f0, 0x30(r1)
/* 0000E4FC EC000828 */ fsubs f0, f0, f1
/* 0000E500 EC020032 */ fmuls f0, f2, f0
/* 0000E504 FC00001E */ fctiwz f0, f0
/* 0000E508 D8010028 */ stfd f0, 0x28(r1)
/* 0000E50C 8001002C */ lwz r0, 0x2c(r1)
/* 0000E510 7C030734 */ extsh r3, r0
/* 0000E514 4BFF1C49 */ bl mathutil_mtxA_rotate_z
/* 0000E518 C03E0084 */ lfs f1, 0x84(r30)
/* 0000E51C 4BFF1C41 */ bl mathutil_mtxA_scale_s
/* 0000E520 3860000F */ li r3, 0xf
/* 0000E524 38800012 */ li r4, 0x12
/* 0000E528 4BFF1C35 */ bl g_debug_set_cursor_pos
/* 0000E52C 3C600000 */ lis r3, lbl_00015890@ha
/* 0000E530 809D0008 */ lwz r4, 8(r29)
/* 0000E534 38630000 */ addi r3, r3, lbl_00015890@l
/* 0000E538 4CC63182 */ crclr 6
/* 0000E53C 4BFF1C21 */ bl g_debug_printf
/* 0000E540 80BE005C */ lwz r5, 0x5c(r30)
/* 0000E544 3C600000 */ lis r3, lbl_802B46F0@ha
/* 0000E548 801E0060 */ lwz r0, 0x60(r30)
/* 0000E54C 38830000 */ addi r4, r3, lbl_802B46F0@l
/* 0000E550 90A10008 */ stw r5, 8(r1)
/* 0000E554 9001000C */ stw r0, 0xc(r1)
/* 0000E558 807E0064 */ lwz r3, 0x64(r30)
/* 0000E55C 801E0068 */ lwz r0, 0x68(r30)
/* 0000E560 90610010 */ stw r3, 0x10(r1)
/* 0000E564 90010014 */ stw r0, 0x14(r1)
/* 0000E568 807E006C */ lwz r3, 0x6c(r30)
/* 0000E56C 801E0070 */ lwz r0, 0x70(r30)
/* 0000E570 90610018 */ stw r3, 0x18(r1)
/* 0000E574 9001001C */ stw r0, 0x1c(r1)
/* 0000E578 807E0074 */ lwz r3, 0x74(r30)
/* 0000E57C 801E0078 */ lwz r0, 0x78(r30)
/* 0000E580 90610020 */ stw r3, 0x20(r1)
/* 0000E584 90010024 */ stw r0, 0x24(r1)
/* 0000E588 80BF0004 */ lwz r5, 4(r31)
/* 0000E58C 807F00C0 */ lwz r3, 0xc0(r31)
/* 0000E590 80A50010 */ lwz r5, 0x10(r5)
/* 0000E594 80030010 */ lwz r0, 0x10(r3)
/* 0000E598 54A31838 */ slwi r3, r5, 3
/* 0000E59C 7C641A14 */ add r3, r4, r3
/* 0000E5A0 80630000 */ lwz r3, 0(r3)
/* 0000E5A4 2C000004 */ cmpwi r0, 4
/* 0000E5A8 54BF083C */ slwi r31, r5, 1
/* 0000E5AC 83A30008 */ lwz r29, 8(r3)
/* 0000E5B0 4082001C */ bne lbl_0000E5CC
/* 0000E5B4 C03E000C */ lfs f1, 0xc(r30)
/* 0000E5B8 3BFF0001 */ addi r31, r31, 1
/* 0000E5BC C05E0090 */ lfs f2, 0x90(r30)
/* 0000E5C0 FC600890 */ fmr f3, f1
/* 0000E5C4 4BFF1B99 */ bl mathutil_mtxA_translate_xyz
/* 0000E5C8 48000014 */ b lbl_0000E5DC
lbl_0000E5CC:
/* 0000E5CC C03E000C */ lfs f1, 0xc(r30)
/* 0000E5D0 C05E0094 */ lfs f2, 0x94(r30)
/* 0000E5D4 FC600890 */ fmr f3, f1
/* 0000E5D8 4BFF1B85 */ bl mathutil_mtxA_translate_xyz
lbl_0000E5DC:
/* 0000E5DC 3C600000 */ lis r3, mathutilData@ha
/* 0000E5E0 38630000 */ addi r3, r3, mathutilData@l
/* 0000E5E4 57E0103A */ slwi r0, r31, 2
/* 0000E5E8 80630000 */ lwz r3, 0(r3)
/* 0000E5EC 38810008 */ addi r4, r1, 8
/* 0000E5F0 7FC4002E */ lwzx r30, r4, r0
/* 0000E5F4 38800000 */ li r4, 0
/* 0000E5F8 4BFF1B65 */ bl g_gxutil_upload_some_mtx
/* 0000E5FC 57C01838 */ slwi r0, r30, 3
/* 0000E600 7C7D002E */ lwzx r3, r29, r0
/* 0000E604 4BFF1B59 */ bl g_avdisp_draw_model_2
lbl_0000E608:
/* 0000E608 4BFF1B55 */ bl mathutil_mtxA_pop
/* 0000E60C 8001004C */ lwz r0, 0x4c(r1)
/* 0000E610 83E10044 */ lwz r31, 0x44(r1)
/* 0000E614 83C10040 */ lwz r30, 0x40(r1)
/* 0000E618 7C0803A6 */ mtlr r0
/* 0000E61C 83A1003C */ lwz r29, 0x3c(r1)
/* 0000E620 38210048 */ addi r1, r1, 0x48
/* 0000E624 4E800020 */ blr 
lbl_0000E628:
/* 0000E628 7C0802A6 */ mflr r0
/* 0000E62C 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000E630 90010004 */ stw r0, 4(r1)
/* 0000E634 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000E638 93E10024 */ stw r31, 0x24(r1)
/* 0000E63C 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000E640 3C600000 */ lis r3, lbl_000148E8@ha
/* 0000E644 93C10020 */ stw r30, 0x20(r1)
/* 0000E648 3BC30000 */ addi r30, r3, lbl_000148E8@l
/* 0000E64C 93A1001C */ stw r29, 0x1c(r1)
/* 0000E650 93810018 */ stw r28, 0x18(r1)
/* 0000E654 801F008C */ lwz r0, 0x8c(r31)
/* 0000E658 2C000000 */ cmpwi r0, 0
/* 0000E65C 40820038 */ bne lbl_0000E694
/* 0000E660 801F00BC */ lwz r0, 0xbc(r31)
/* 0000E664 2C000000 */ cmpwi r0, 0
/* 0000E668 4082002C */ bne lbl_0000E694
/* 0000E66C 801F0058 */ lwz r0, 0x58(r31)
/* 0000E670 38800000 */ li r4, 0
/* 0000E674 2C000000 */ cmpwi r0, 0
/* 0000E678 909F0058 */ stw r4, 0x58(r31)
/* 0000E67C 41820018 */ beq lbl_0000E694
/* 0000E680 3C600000 */ lis r3, lbl_0000EEF4@ha
/* 0000E684 38030000 */ addi r0, r3, lbl_0000EEF4@l
/* 0000E688 901F0088 */ stw r0, 0x88(r31)
/* 0000E68C 909F0078 */ stw r4, 0x78(r31)
/* 0000E690 48000604 */ b lbl_0000EC94
lbl_0000E694:
/* 0000E694 38000000 */ li r0, 0
/* 0000E698 901F007C */ stw r0, 0x7c(r31)
/* 0000E69C 38600003 */ li r3, 3
/* 0000E6A0 38800004 */ li r4, 4
/* 0000E6A4 4BFF1AB9 */ bl g_debug_set_cursor_pos
/* 0000E6A8 809F0004 */ lwz r4, 4(r31)
/* 0000E6AC 387E0F1C */ addi r3, r30, 0xf1c
/* 0000E6B0 4CC63182 */ crclr 6
/* 0000E6B4 80840000 */ lwz r4, 0(r4)
/* 0000E6B8 A0840038 */ lhz r4, 0x38(r4)
/* 0000E6BC 4BFF1AA1 */ bl g_debug_printf
/* 0000E6C0 38600005 */ li r3, 5
/* 0000E6C4 38800006 */ li r4, 6
/* 0000E6C8 4BFF1A95 */ bl g_debug_set_cursor_pos
/* 0000E6CC 387E0F30 */ addi r3, r30, 0xf30
/* 0000E6D0 4CC63182 */ crclr 6
/* 0000E6D4 4BFF1A89 */ bl g_debug_printf
/* 0000E6D8 38600000 */ li r3, 0
/* 0000E6DC 38800007 */ li r4, 7
/* 0000E6E0 4BFF1A7D */ bl g_debug_set_cursor_pos
/* 0000E6E4 38600001 */ li r3, 1
/* 0000E6E8 4BFF1A75 */ bl g_debug_set_text_color
/* 0000E6EC 387E0F50 */ addi r3, r30, 0xf50
/* 0000E6F0 4CC63182 */ crclr 6
/* 0000E6F4 389E0F68 */ addi r4, r30, 0xf68
/* 0000E6F8 38BE0F6C */ addi r5, r30, 0xf6c
/* 0000E6FC 38DE0F74 */ addi r6, r30, 0xf74
/* 0000E700 38FE0F7C */ addi r7, r30, 0xf7c
/* 0000E704 4BFF1A59 */ bl g_debug_printf
/* 0000E708 38600000 */ li r3, 0
/* 0000E70C 4BFF1A51 */ bl g_debug_set_text_color
/* 0000E710 809F0004 */ lwz r4, 4(r31)
/* 0000E714 3C600000 */ lis r3, motInfo@ha
/* 0000E718 3BA30000 */ addi r29, r3, motInfo@l
/* 0000E71C 8064001C */ lwz r3, 0x1c(r4)
/* 0000E720 3B83001C */ addi r28, r3, 0x1c
/* 0000E724 48000034 */ b lbl_0000E758
lbl_0000E728:
/* 0000E728 807D0000 */ lwz r3, 0(r29)
/* 0000E72C 54002834 */ slwi r0, r0, 5
/* 0000E730 3C630003 */ addis r3, r3, 3
/* 0000E734 7C630214 */ add r3, r3, r0
/* 0000E738 38638000 */ addi r3, r3, -32768  ;# fixed addi
/* 0000E73C 4BFFF669 */ bl lbl_0000DDA4
/* 0000E740 807D0000 */ lwz r3, 0(r29)
/* 0000E744 801C0000 */ lwz r0, 0(r28)
/* 0000E748 3C630003 */ addis r3, r3, 3
/* 0000E74C 54002834 */ slwi r0, r0, 5
/* 0000E750 7C630214 */ add r3, r3, r0
/* 0000E754 3B838014 */ addi r28, r3, -32748  ;# fixed addi
lbl_0000E758:
/* 0000E758 801C0000 */ lwz r0, 0(r28)
/* 0000E75C 2C000000 */ cmpwi r0, 0
/* 0000E760 4082FFC8 */ bne lbl_0000E728
/* 0000E764 801F008C */ lwz r0, 0x8c(r31)
/* 0000E768 2C000000 */ cmpwi r0, 0
/* 0000E76C 4182000C */ beq lbl_0000E778
/* 0000E770 3BA00000 */ li r29, 0
/* 0000E774 4800005C */ b lbl_0000E7D0
lbl_0000E778:
/* 0000E778 4BFFE90D */ bl lbl_0000D084
/* 0000E77C 2C030001 */ cmpwi r3, 1
/* 0000E780 40820024 */ bne lbl_0000E7A4
/* 0000E784 809F0078 */ lwz r4, 0x78(r31)
/* 0000E788 3404FFFF */ addic. r0, r4, -1  ;# fixed addi
/* 0000E78C 901F0078 */ stw r0, 0x78(r31)
/* 0000E790 4080003C */ bge lbl_0000E7CC
/* 0000E794 809F007C */ lwz r4, 0x7c(r31)
/* 0000E798 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 0000E79C 901F0078 */ stw r0, 0x78(r31)
/* 0000E7A0 4800002C */ b lbl_0000E7CC
lbl_0000E7A4:
/* 0000E7A4 2C030002 */ cmpwi r3, 2
/* 0000E7A8 40820024 */ bne lbl_0000E7CC
/* 0000E7AC 809F0078 */ lwz r4, 0x78(r31)
/* 0000E7B0 38840001 */ addi r4, r4, 1
/* 0000E7B4 909F0078 */ stw r4, 0x78(r31)
/* 0000E7B8 801F007C */ lwz r0, 0x7c(r31)
/* 0000E7BC 7C040000 */ cmpw r4, r0
/* 0000E7C0 4180000C */ blt lbl_0000E7CC
/* 0000E7C4 38000000 */ li r0, 0
/* 0000E7C8 901F0078 */ stw r0, 0x78(r31)
lbl_0000E7CC:
/* 0000E7CC 7C7D1B78 */ mr r29, r3
lbl_0000E7D0:
/* 0000E7D0 801F00A4 */ lwz r0, 0xa4(r31)
/* 0000E7D4 2C000000 */ cmpwi r0, 0
/* 0000E7D8 41820054 */ beq lbl_0000E82C
/* 0000E7DC 801F00BC */ lwz r0, 0xbc(r31)
/* 0000E7E0 2C000002 */ cmpwi r0, 2
/* 0000E7E4 41820024 */ beq lbl_0000E808
/* 0000E7E8 40800044 */ bge lbl_0000E82C
/* 0000E7EC 2C000001 */ cmpwi r0, 1
/* 0000E7F0 40800008 */ bge lbl_0000E7F8
/* 0000E7F4 48000038 */ b lbl_0000E82C
lbl_0000E7F8:
/* 0000E7F8 801F0090 */ lwz r0, 0x90(r31)
/* 0000E7FC 807F00C0 */ lwz r3, 0xc0(r31)
/* 0000E800 90030010 */ stw r0, 0x10(r3)
/* 0000E804 48000028 */ b lbl_0000E82C
lbl_0000E808:
/* 0000E808 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000E80C 801F0090 */ lwz r0, 0x90(r31)
/* 0000E810 80640010 */ lwz r3, 0x10(r4)
/* 0000E814 5400103A */ slwi r0, r0, 2
/* 0000E818 5463103A */ slwi r3, r3, 2
/* 0000E81C 7C7E1A14 */ add r3, r30, r3
/* 0000E820 80630DC4 */ lwz r3, 0xdc4(r3)
/* 0000E824 7C03002E */ lwzx r0, r3, r0
/* 0000E828 90040000 */ stw r0, 0(r4)
lbl_0000E82C:
/* 0000E82C 801F008C */ lwz r0, 0x8c(r31)
/* 0000E830 2C000000 */ cmpwi r0, 0
/* 0000E834 408200A4 */ bne lbl_0000E8D8
/* 0000E838 801F00BC */ lwz r0, 0xbc(r31)
/* 0000E83C 2C000001 */ cmpwi r0, 1
/* 0000E840 40820064 */ bne lbl_0000E8A4
/* 0000E844 80DF00C0 */ lwz r6, 0xc0(r31)
/* 0000E848 38A60010 */ addi r5, r6, 0x10
/* 0000E84C 80060010 */ lwz r0, 0x10(r6)
/* 0000E850 2C000004 */ cmpwi r0, 4
/* 0000E854 41810084 */ bgt lbl_0000E8D8
/* 0000E858 38800000 */ li r4, 0
/* 0000E85C 909F0090 */ stw r4, 0x90(r31)
/* 0000E860 38600001 */ li r3, 1
/* 0000E864 38000002 */ li r0, 2
/* 0000E868 909F0094 */ stw r4, 0x94(r31)
/* 0000E86C 80850000 */ lwz r4, 0(r5)
/* 0000E870 5484103A */ slwi r4, r4, 2
/* 0000E874 7C9E2214 */ add r4, r30, r4
/* 0000E878 80840D90 */ lwz r4, 0xd90(r4)
/* 0000E87C 909F0098 */ stw r4, 0x98(r31)
/* 0000E880 907F008C */ stw r3, 0x8c(r31)
/* 0000E884 80650000 */ lwz r3, 0(r5)
/* 0000E888 5463103A */ slwi r3, r3, 2
/* 0000E88C 7C7E1A14 */ add r3, r30, r3
/* 0000E890 80630DC4 */ lwz r3, 0xdc4(r3)
/* 0000E894 80630000 */ lwz r3, 0(r3)
/* 0000E898 90660000 */ stw r3, 0(r6)
/* 0000E89C 901F00BC */ stw r0, 0xbc(r31)
/* 0000E8A0 48000038 */ b lbl_0000E8D8
lbl_0000E8A4:
/* 0000E8A4 2C000002 */ cmpwi r0, 2
/* 0000E8A8 40820030 */ bne lbl_0000E8D8
/* 0000E8AC 807F00C0 */ lwz r3, 0xc0(r31)
/* 0000E8B0 38000000 */ li r0, 0
/* 0000E8B4 90030008 */ stw r0, 8(r3)
/* 0000E8B8 807F00C0 */ lwz r3, 0xc0(r31)
/* 0000E8BC 80030000 */ lwz r0, 0(r3)
/* 0000E8C0 2C000008 */ cmpwi r0, 8
/* 0000E8C4 4080000C */ bge lbl_0000E8D0
/* 0000E8C8 38000010 */ li r0, 0x10
/* 0000E8CC 901F00B8 */ stw r0, 0xb8(r31)
lbl_0000E8D0:
/* 0000E8D0 38000003 */ li r0, 3
/* 0000E8D4 901F00BC */ stw r0, 0xbc(r31)
lbl_0000E8D8:
/* 0000E8D8 3C600000 */ lis r3, controllerInfo@ha
/* 0000E8DC 38830000 */ addi r4, r3, controllerInfo@l
/* 0000E8E0 A0040018 */ lhz r0, 0x18(r4)
/* 0000E8E4 38640018 */ addi r3, r4, 0x18
/* 0000E8E8 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000E8EC 4182001C */ beq lbl_0000E908
/* 0000E8F0 809F0004 */ lwz r4, 4(r31)
/* 0000E8F4 3CA00000 */ lis r5, lbl_00010280@ha
/* 0000E8F8 C0050000 */ lfs f0, lbl_00010280@l(r5)
/* 0000E8FC 80840000 */ lwz r4, 0(r4)
/* 0000E900 D004003C */ stfs f0, 0x3c(r4)
/* 0000E904 4800003C */ b lbl_0000E940
lbl_0000E908:
/* 0000E908 A0040000 */ lhz r0, 0(r4)
/* 0000E90C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0000E910 4182001C */ beq lbl_0000E92C
/* 0000E914 809F0004 */ lwz r4, 4(r31)
/* 0000E918 80A4001C */ lwz r5, 0x1c(r4)
/* 0000E91C 80840000 */ lwz r4, 0(r4)
/* 0000E920 C0050018 */ lfs f0, 0x18(r5)
/* 0000E924 D004003C */ stfs f0, 0x3c(r4)
/* 0000E928 48000018 */ b lbl_0000E940
lbl_0000E92C:
/* 0000E92C 809F0004 */ lwz r4, 4(r31)
/* 0000E930 3CA00000 */ lis r5, lbl_000101EC@ha
/* 0000E934 C0050000 */ lfs f0, lbl_000101EC@l(r5)
/* 0000E938 80840000 */ lwz r4, 0(r4)
/* 0000E93C D004003C */ stfs f0, 0x3c(r4)
lbl_0000E940:
/* 0000E940 801F008C */ lwz r0, 0x8c(r31)
/* 0000E944 2C000000 */ cmpwi r0, 0
/* 0000E948 40820010 */ bne lbl_0000E958
/* 0000E94C 801F00BC */ lwz r0, 0xbc(r31)
/* 0000E950 2C000003 */ cmpwi r0, 3
/* 0000E954 408201C8 */ bne lbl_0000EB1C
lbl_0000E958:
/* 0000E958 801F00BC */ lwz r0, 0xbc(r31)
/* 0000E95C 2C000002 */ cmpwi r0, 2
/* 0000E960 40820018 */ bne lbl_0000E978
/* 0000E964 38000010 */ li r0, 0x10
/* 0000E968 901F009C */ stw r0, 0x9c(r31)
/* 0000E96C 38000009 */ li r0, 9
/* 0000E970 901F00A0 */ stw r0, 0xa0(r31)
/* 0000E974 48000320 */ b lbl_0000EC94
lbl_0000E978:
/* 0000E978 2C000003 */ cmpwi r0, 3
/* 0000E97C 40820318 */ bne lbl_0000EC94
/* 0000E980 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000E984 80040000 */ lwz r0, 0(r4)
/* 0000E988 2C000007 */ cmpwi r0, 7
/* 0000E98C 4182007C */ beq lbl_0000EA08
/* 0000E990 38600019 */ li r3, 0x19
/* 0000E994 38800015 */ li r4, 0x15
/* 0000E998 4BFF17C5 */ bl g_debug_set_cursor_pos
/* 0000E99C 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000E9A0 387E0FB4 */ addi r3, r30, 0xfb4
/* 0000E9A4 4CC63182 */ crclr 6
/* 0000E9A8 80840008 */ lwz r4, 8(r4)
/* 0000E9AC 4BFF17B1 */ bl g_debug_printf
/* 0000E9B0 2C1D0003 */ cmpwi r29, 3
/* 0000E9B4 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000E9B8 40820024 */ bne lbl_0000E9DC
/* 0000E9BC 80640008 */ lwz r3, 8(r4)
/* 0000E9C0 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000E9C4 90040008 */ stw r0, 8(r4)
/* 0000E9C8 4080008C */ bge lbl_0000EA54
/* 0000E9CC 807F00B8 */ lwz r3, 0xb8(r31)
/* 0000E9D0 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000E9D4 90040008 */ stw r0, 8(r4)
/* 0000E9D8 4800007C */ b lbl_0000EA54
lbl_0000E9DC:
/* 0000E9DC 2C1D0004 */ cmpwi r29, 4
/* 0000E9E0 40820074 */ bne lbl_0000EA54
/* 0000E9E4 80640008 */ lwz r3, 8(r4)
/* 0000E9E8 38630001 */ addi r3, r3, 1
/* 0000E9EC 90640008 */ stw r3, 8(r4)
/* 0000E9F0 801F00B8 */ lwz r0, 0xb8(r31)
/* 0000E9F4 7C030000 */ cmpw r3, r0
/* 0000E9F8 4180005C */ blt lbl_0000EA54
/* 0000E9FC 38000000 */ li r0, 0
/* 0000EA00 90040008 */ stw r0, 8(r4)
/* 0000EA04 48000050 */ b lbl_0000EA54
lbl_0000EA08:
/* 0000EA08 2C1D0003 */ cmpwi r29, 3
/* 0000EA0C 40820024 */ bne lbl_0000EA30
/* 0000EA10 80640008 */ lwz r3, 8(r4)
/* 0000EA14 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000EA18 2C00FFA6 */ cmpwi r0, -90
/* 0000EA1C 90040008 */ stw r0, 8(r4)
/* 0000EA20 40800034 */ bge lbl_0000EA54
/* 0000EA24 3800FFA6 */ li r0, -90
/* 0000EA28 90040008 */ stw r0, 8(r4)
/* 0000EA2C 48000028 */ b lbl_0000EA54
lbl_0000EA30:
/* 0000EA30 2C1D0004 */ cmpwi r29, 4
/* 0000EA34 40820020 */ bne lbl_0000EA54
/* 0000EA38 80640008 */ lwz r3, 8(r4)
/* 0000EA3C 38030001 */ addi r0, r3, 1
/* 0000EA40 2C00005A */ cmpwi r0, 0x5a
/* 0000EA44 90040008 */ stw r0, 8(r4)
/* 0000EA48 4081000C */ ble lbl_0000EA54
/* 0000EA4C 3800005A */ li r0, 0x5a
/* 0000EA50 90040008 */ stw r0, 8(r4)
lbl_0000EA54:
/* 0000EA54 807F0054 */ lwz r3, 0x54(r31)
/* 0000EA58 38000000 */ li r0, 0
/* 0000EA5C 2C030000 */ cmpwi r3, 0
/* 0000EA60 901F0054 */ stw r0, 0x54(r31)
/* 0000EA64 41820230 */ beq lbl_0000EC94
/* 0000EA68 901F00BC */ stw r0, 0xbc(r31)
/* 0000EA6C 3C600000 */ lis r3, motInfo@ha
/* 0000EA70 38630000 */ addi r3, r3, motInfo@l
/* 0000EA74 901F0078 */ stw r0, 0x78(r31)
/* 0000EA78 809F0004 */ lwz r4, 4(r31)
/* 0000EA7C 80630000 */ lwz r3, 0(r3)
/* 0000EA80 8084001C */ lwz r4, 0x1c(r4)
/* 0000EA84 3CA30003 */ addis r5, r3, 3
/* 0000EA88 80FF00C0 */ lwz r7, 0xc0(r31)
/* 0000EA8C 3884001C */ addi r4, r4, 0x1c
/* 0000EA90 38A58000 */ addi r5, r5, -32768  ;# fixed addi
/* 0000EA94 48000038 */ b lbl_0000EACC
lbl_0000EA98:
/* 0000EA98 54C32834 */ slwi r3, r6, 5
/* 0000EA9C 80070004 */ lwz r0, 4(r7)
/* 0000EAA0 38630004 */ addi r3, r3, 4
/* 0000EAA4 7C65182E */ lwzx r3, r5, r3
/* 0000EAA8 7C030000 */ cmpw r3, r0
/* 0000EAAC 4181002C */ bgt lbl_0000EAD8
/* 0000EAB0 807F0078 */ lwz r3, 0x78(r31)
/* 0000EAB4 38030001 */ addi r0, r3, 1
/* 0000EAB8 901F0078 */ stw r0, 0x78(r31)
/* 0000EABC 80040000 */ lwz r0, 0(r4)
/* 0000EAC0 54032834 */ slwi r3, r0, 5
/* 0000EAC4 38830014 */ addi r4, r3, 0x14
/* 0000EAC8 7C852214 */ add r4, r5, r4
lbl_0000EACC:
/* 0000EACC 80C40000 */ lwz r6, 0(r4)
/* 0000EAD0 2C060000 */ cmpwi r6, 0
/* 0000EAD4 4082FFC4 */ bne lbl_0000EA98
lbl_0000EAD8:
/* 0000EAD8 3C600000 */ lis r3, motInfo@ha
/* 0000EADC 90C70014 */ stw r6, 0x14(r7)
/* 0000EAE0 3BA30000 */ addi r29, r3, motInfo@l
/* 0000EAE4 80BD0000 */ lwz r5, 0(r29)
/* 0000EAE8 3C650003 */ addis r3, r5, 3
/* 0000EAEC 80038000 */ lwz r0, -0x8000(r3)
/* 0000EAF0 3C650002 */ addis r3, r5, 2
/* 0000EAF4 5400103A */ slwi r0, r0, 2
/* 0000EAF8 7C03002E */ lwzx r0, r3, r0
/* 0000EAFC 90040000 */ stw r0, 0(r4)
/* 0000EB00 4BFFF7E9 */ bl lbl_0000E2E8
/* 0000EB04 807D0000 */ lwz r3, 0(r29)
/* 0000EB08 3C830003 */ addis r4, r3, 3
/* 0000EB0C 80648000 */ lwz r3, -0x8000(r4)
/* 0000EB10 38030001 */ addi r0, r3, 1
/* 0000EB14 90048000 */ stw r0, -0x8000(r4)
/* 0000EB18 4800017C */ b lbl_0000EC94
lbl_0000EB1C:
/* 0000EB1C A0030000 */ lhz r0, 0(r3)
/* 0000EB20 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 0000EB24 4182008C */ beq lbl_0000EBB0
/* 0000EB28 38C00000 */ li r6, 0
/* 0000EB2C 90DF0090 */ stw r6, 0x90(r31)
/* 0000EB30 3CA00000 */ lis r5, lbl_801C6470@ha
/* 0000EB34 3C800000 */ lis r4, motInfo@ha
/* 0000EB38 90DF0094 */ stw r6, 0x94(r31)
/* 0000EB3C 38A50000 */ addi r5, r5, lbl_801C6470@l
/* 0000EB40 38000001 */ li r0, 1
/* 0000EB44 90BF0098 */ stw r5, 0x98(r31)
/* 0000EB48 38840000 */ addi r4, r4, motInfo@l
/* 0000EB4C 901F008C */ stw r0, 0x8c(r31)
/* 0000EB50 901F00BC */ stw r0, 0xbc(r31)
/* 0000EB54 80840000 */ lwz r4, 0(r4)
/* 0000EB58 3CA40003 */ addis r5, r4, 3
/* 0000EB5C 84058000 */ lwzu r0, -0x8000(r5)
/* 0000EB60 3C840002 */ addis r4, r4, 2
/* 0000EB64 5400103A */ slwi r0, r0, 2
/* 0000EB68 7C04002E */ lwzx r0, r4, r0
/* 0000EB6C 54002834 */ slwi r0, r0, 5
/* 0000EB70 7C050214 */ add r0, r5, r0
/* 0000EB74 901F00C0 */ stw r0, 0xc0(r31)
/* 0000EB78 80BF0004 */ lwz r5, 4(r31)
/* 0000EB7C 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000EB80 80A50000 */ lwz r5, 0(r5)
/* 0000EB84 A0050038 */ lhz r0, 0x38(r5)
/* 0000EB88 90040004 */ stw r0, 4(r4)
/* 0000EB8C 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000EB90 90C40010 */ stw r6, 0x10(r4)
/* 0000EB94 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000EB98 90C40000 */ stw r6, 0(r4)
/* 0000EB9C 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000EBA0 90C4000C */ stw r6, 0xc(r4)
/* 0000EBA4 809F00C0 */ lwz r4, 0xc0(r31)
/* 0000EBA8 90C40008 */ stw r6, 8(r4)
/* 0000EBAC 4800000C */ b lbl_0000EBB8
lbl_0000EBB0:
/* 0000EBB0 38000000 */ li r0, 0
/* 0000EBB4 901F00BC */ stw r0, 0xbc(r31)
lbl_0000EBB8:
/* 0000EBB8 A0030000 */ lhz r0, 0(r3)
/* 0000EBBC 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 0000EBC0 418200D4 */ beq lbl_0000EC94
/* 0000EBC4 801F007C */ lwz r0, 0x7c(r31)
/* 0000EBC8 2C000000 */ cmpwi r0, 0
/* 0000EBCC 418200C8 */ beq lbl_0000EC94
/* 0000EBD0 3C600000 */ lis r3, motInfo@ha
/* 0000EBD4 809F0004 */ lwz r4, 4(r31)
/* 0000EBD8 38630000 */ addi r3, r3, motInfo@l
/* 0000EBDC 801F0078 */ lwz r0, 0x78(r31)
/* 0000EBE0 80630000 */ lwz r3, 0(r3)
/* 0000EBE4 38A00000 */ li r5, 0
/* 0000EBE8 8084001C */ lwz r4, 0x1c(r4)
/* 0000EBEC 3CE30003 */ addis r7, r3, 3
/* 0000EBF0 38C4001C */ addi r6, r4, 0x1c
/* 0000EBF4 38E78000 */ addi r7, r7, -32768  ;# fixed addi
/* 0000EBF8 4800001C */ b lbl_0000EC14
lbl_0000EBFC:
/* 0000EBFC 7C050000 */ cmpw r5, r0
/* 0000EC00 41820020 */ beq lbl_0000EC20
/* 0000EC04 54632834 */ slwi r3, r3, 5
/* 0000EC08 38C30014 */ addi r6, r3, 0x14
/* 0000EC0C 7CC73214 */ add r6, r7, r6
/* 0000EC10 38A50001 */ addi r5, r5, 1
lbl_0000EC14:
/* 0000EC14 80660000 */ lwz r3, 0(r6)
/* 0000EC18 2C030000 */ cmpwi r3, 0
/* 0000EC1C 4082FFE0 */ bne lbl_0000EBFC
lbl_0000EC20:
/* 0000EC20 80870000 */ lwz r4, 0(r7)
/* 0000EC24 3C600000 */ lis r3, motInfo@ha
/* 0000EC28 38630000 */ addi r3, r3, motInfo@l
/* 0000EC2C 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 0000EC30 90070000 */ stw r0, 0(r7)
/* 0000EC34 80630000 */ lwz r3, 0(r3)
/* 0000EC38 80A60000 */ lwz r5, 0(r6)
/* 0000EC3C 3CE30003 */ addis r7, r3, 3
/* 0000EC40 84078000 */ lwzu r0, -0x8000(r7)
/* 0000EC44 3C630002 */ addis r3, r3, 2
/* 0000EC48 5400103A */ slwi r0, r0, 2
/* 0000EC4C 54A42834 */ slwi r4, r5, 5
/* 0000EC50 7CA3012E */ stwx r5, r3, r0
/* 0000EC54 7C672214 */ add r3, r7, r4
/* 0000EC58 80030014 */ lwz r0, 0x14(r3)
/* 0000EC5C 90060000 */ stw r0, 0(r6)
/* 0000EC60 4BFFF689 */ bl lbl_0000E2E8
/* 0000EC64 807F007C */ lwz r3, 0x7c(r31)
/* 0000EC68 38A00000 */ li r5, 0
/* 0000EC6C 809F0078 */ lwz r4, 0x78(r31)
/* 0000EC70 3803FFFF */ addi r0, r3, -1  ;# fixed addi
/* 0000EC74 7C040000 */ cmpw r4, r0
/* 0000EC78 41800010 */ blt lbl_0000EC88
/* 0000EC7C 2C040000 */ cmpwi r4, 0
/* 0000EC80 40810008 */ ble lbl_0000EC88
/* 0000EC84 38A00001 */ li r5, 1
lbl_0000EC88:
/* 0000EC88 801F0078 */ lwz r0, 0x78(r31)
/* 0000EC8C 7C050050 */ subf r0, r5, r0
/* 0000EC90 901F0078 */ stw r0, 0x78(r31)
lbl_0000EC94:
/* 0000EC94 8001002C */ lwz r0, 0x2c(r1)
/* 0000EC98 83E10024 */ lwz r31, 0x24(r1)
/* 0000EC9C 83C10020 */ lwz r30, 0x20(r1)
/* 0000ECA0 7C0803A6 */ mtlr r0
/* 0000ECA4 83A1001C */ lwz r29, 0x1c(r1)
/* 0000ECA8 83810018 */ lwz r28, 0x18(r1)
/* 0000ECAC 38210028 */ addi r1, r1, 0x28
/* 0000ECB0 4E800020 */ blr 
lbl_0000ECB4:
/* 0000ECB4 7C0802A6 */ mflr r0
/* 0000ECB8 3C800000 */ lis r4, lbl_000148E8@ha
/* 0000ECBC 90010004 */ stw r0, 4(r1)
/* 0000ECC0 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000ECC4 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000ECC8 93E10024 */ stw r31, 0x24(r1)
/* 0000ECCC 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000ECD0 38600004 */ li r3, 4
/* 0000ECD4 93C10020 */ stw r30, 0x20(r1)
/* 0000ECD8 3BC40000 */ addi r30, r4, lbl_000148E8@l
/* 0000ECDC 38800007 */ li r4, 7
/* 0000ECE0 4BFF147D */ bl g_debug_set_cursor_pos
/* 0000ECE4 387E0FC4 */ addi r3, r30, 0xfc4
/* 0000ECE8 4CC63182 */ crclr 6
/* 0000ECEC 4BFF1471 */ bl g_debug_printf
/* 0000ECF0 38600001 */ li r3, 1
/* 0000ECF4 38800008 */ li r4, 8
/* 0000ECF8 4BFF1465 */ bl g_debug_set_cursor_pos
/* 0000ECFC 801F00A8 */ lwz r0, 0xa8(r31)
/* 0000ED00 387E0FDC */ addi r3, r30, 0xfdc
/* 0000ED04 389E0F0C */ addi r4, r30, 0xf0c
/* 0000ED08 4CC63182 */ crclr 6
/* 0000ED0C 5400103A */ slwi r0, r0, 2
/* 0000ED10 7CBE0214 */ add r5, r30, r0
/* 0000ED14 80A5008C */ lwz r5, 0x8c(r5)
/* 0000ED18 4BFFEF49 */ bl lbl_0000DC60
/* 0000ED1C 801F00A8 */ lwz r0, 0xa8(r31)
/* 0000ED20 387E0FF0 */ addi r3, r30, 0xff0
/* 0000ED24 389E0F0C */ addi r4, r30, 0xf0c
/* 0000ED28 4CC63182 */ crclr 6
/* 0000ED2C 5400103A */ slwi r0, r0, 2
/* 0000ED30 7CBF0214 */ add r5, r31, r0
/* 0000ED34 7CDE0214 */ add r6, r30, r0
/* 0000ED38 80050010 */ lwz r0, 0x10(r5)
/* 0000ED3C 80A60CD4 */ lwz r5, 0xcd4(r6)
/* 0000ED40 5400103A */ slwi r0, r0, 2
/* 0000ED44 7CA5002E */ lwzx r5, r5, r0
/* 0000ED48 4BFFEF19 */ bl lbl_0000DC60
/* 0000ED4C 807F00AC */ lwz r3, 0xac(r31)
/* 0000ED50 3C800000 */ lis r4, motLabel@ha
/* 0000ED54 38840000 */ addi r4, r4, motLabel@l
/* 0000ED58 4CC63182 */ crclr 6
/* 0000ED5C 80030010 */ lwz r0, 0x10(r3)
/* 0000ED60 80840000 */ lwz r4, 0(r4)
/* 0000ED64 387E1004 */ addi r3, r30, 0x1004
/* 0000ED68 5400103A */ slwi r0, r0, 2
/* 0000ED6C 7CA4002E */ lwzx r5, r4, r0
/* 0000ED70 389E0F0C */ addi r4, r30, 0xf0c
/* 0000ED74 4BFFEEED */ bl lbl_0000DC60
/* 0000ED78 80BF00AC */ lwz r5, 0xac(r31)
/* 0000ED7C 387E1018 */ addi r3, r30, 0x1018
/* 0000ED80 389E102C */ addi r4, r30, 0x102c
/* 0000ED84 4CC63242 */ crset 6
/* 0000ED88 C0250000 */ lfs f1, 0(r5)
/* 0000ED8C 4BFFEED5 */ bl lbl_0000DC60
/* 0000ED90 80BF00AC */ lwz r5, 0xac(r31)
/* 0000ED94 387E1034 */ addi r3, r30, 0x1034
/* 0000ED98 389E0EFC */ addi r4, r30, 0xefc
/* 0000ED9C 4CC63182 */ crclr 6
/* 0000EDA0 80A50004 */ lwz r5, 4(r5)
/* 0000EDA4 4BFFEEBD */ bl lbl_0000DC60
/* 0000EDA8 80BF00AC */ lwz r5, 0xac(r31)
/* 0000EDAC 387E1048 */ addi r3, r30, 0x1048
/* 0000EDB0 389E0EFC */ addi r4, r30, 0xefc
/* 0000EDB4 4CC63182 */ crclr 6
/* 0000EDB8 80A50008 */ lwz r5, 8(r5)
/* 0000EDBC 4BFFEEA5 */ bl lbl_0000DC60
/* 0000EDC0 80BF00AC */ lwz r5, 0xac(r31)
/* 0000EDC4 387E105C */ addi r3, r30, 0x105c
/* 0000EDC8 389E0EFC */ addi r4, r30, 0xefc
/* 0000EDCC 4CC63182 */ crclr 6
/* 0000EDD0 80A50014 */ lwz r5, 0x14(r5)
/* 0000EDD4 4BFFEE8D */ bl lbl_0000DC60
/* 0000EDD8 80BF00AC */ lwz r5, 0xac(r31)
/* 0000EDDC 387E1070 */ addi r3, r30, 0x1070
/* 0000EDE0 389E1084 */ addi r4, r30, 0x1084
/* 0000EDE4 4CC63242 */ crset 6
/* 0000EDE8 C0250018 */ lfs f1, 0x18(r5)
/* 0000EDEC 4BFFEE75 */ bl lbl_0000DC60
/* 0000EDF0 807F00AC */ lwz r3, 0xac(r31)
/* 0000EDF4 8003000C */ lwz r0, 0xc(r3)
/* 0000EDF8 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000EDFC 4182000C */ beq lbl_0000EE08
/* 0000EE00 38BE0EA4 */ addi r5, r30, 0xea4
/* 0000EE04 48000008 */ b lbl_0000EE0C
lbl_0000EE08:
/* 0000EE08 38BE0EA8 */ addi r5, r30, 0xea8
lbl_0000EE0C:
/* 0000EE0C 4CC63182 */ crclr 6
/* 0000EE10 387E108C */ addi r3, r30, 0x108c
/* 0000EE14 389E0F0C */ addi r4, r30, 0xf0c
/* 0000EE18 4BFFEE49 */ bl lbl_0000DC60
/* 0000EE1C 807F00AC */ lwz r3, 0xac(r31)
/* 0000EE20 8003000C */ lwz r0, 0xc(r3)
/* 0000EE24 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000EE28 4182000C */ beq lbl_0000EE34
/* 0000EE2C 38BE0EA4 */ addi r5, r30, 0xea4
/* 0000EE30 48000008 */ b lbl_0000EE38
lbl_0000EE34:
/* 0000EE34 38BE0EA8 */ addi r5, r30, 0xea8
lbl_0000EE38:
/* 0000EE38 4CC63182 */ crclr 6
/* 0000EE3C 387E10A0 */ addi r3, r30, 0x10a0
/* 0000EE40 389E0F0C */ addi r4, r30, 0xf0c
/* 0000EE44 4BFFEE1D */ bl lbl_0000DC60
/* 0000EE48 807F00AC */ lwz r3, 0xac(r31)
/* 0000EE4C 8003000C */ lwz r0, 0xc(r3)
/* 0000EE50 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000EE54 4182000C */ beq lbl_0000EE60
/* 0000EE58 38BE0EA4 */ addi r5, r30, 0xea4
/* 0000EE5C 48000008 */ b lbl_0000EE64
lbl_0000EE60:
/* 0000EE60 38BE0EA8 */ addi r5, r30, 0xea8
lbl_0000EE64:
/* 0000EE64 4CC63182 */ crclr 6
/* 0000EE68 387E10B4 */ addi r3, r30, 0x10b4
/* 0000EE6C 389E0F0C */ addi r4, r30, 0xf0c
/* 0000EE70 4BFFEDF1 */ bl lbl_0000DC60
/* 0000EE74 807F00AC */ lwz r3, 0xac(r31)
/* 0000EE78 8003000C */ lwz r0, 0xc(r3)
/* 0000EE7C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000EE80 4182000C */ beq lbl_0000EE8C
/* 0000EE84 38BE0EA4 */ addi r5, r30, 0xea4
/* 0000EE88 48000008 */ b lbl_0000EE90
lbl_0000EE8C:
/* 0000EE8C 38BE0EA8 */ addi r5, r30, 0xea8
lbl_0000EE90:
/* 0000EE90 4CC63182 */ crclr 6
/* 0000EE94 387E10C8 */ addi r3, r30, 0x10c8
/* 0000EE98 389E0F0C */ addi r4, r30, 0xf0c
/* 0000EE9C 4BFFEDC5 */ bl lbl_0000DC60
/* 0000EEA0 807F00AC */ lwz r3, 0xac(r31)
/* 0000EEA4 8003000C */ lwz r0, 0xc(r3)
/* 0000EEA8 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000EEAC 4182000C */ beq lbl_0000EEB8
/* 0000EEB0 38BE0EA4 */ addi r5, r30, 0xea4
/* 0000EEB4 48000008 */ b lbl_0000EEBC
lbl_0000EEB8:
/* 0000EEB8 38BE0EA8 */ addi r5, r30, 0xea8
lbl_0000EEBC:
/* 0000EEBC 4CC63182 */ crclr 6
/* 0000EEC0 387E10DC */ addi r3, r30, 0x10dc
/* 0000EEC4 389E0F0C */ addi r4, r30, 0xf0c
/* 0000EEC8 4BFFED99 */ bl lbl_0000DC60
/* 0000EECC 387E10F0 */ addi r3, r30, 0x10f0
/* 0000EED0 4CC63182 */ crclr 6
/* 0000EED4 389E1100 */ addi r4, r30, 0x1100
/* 0000EED8 4BFFED89 */ bl lbl_0000DC60
/* 0000EEDC 8001002C */ lwz r0, 0x2c(r1)
/* 0000EEE0 83E10024 */ lwz r31, 0x24(r1)
/* 0000EEE4 83C10020 */ lwz r30, 0x20(r1)
/* 0000EEE8 7C0803A6 */ mtlr r0
/* 0000EEEC 38210028 */ addi r1, r1, 0x28
/* 0000EEF0 4E800020 */ blr 
lbl_0000EEF4:
/* 0000EEF4 7C0802A6 */ mflr r0
/* 0000EEF8 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000EEFC 90010004 */ stw r0, 4(r1)
/* 0000EF00 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000EF04 BF610024 */ stmw r27, 0x24(r1)
/* 0000EF08 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000EF0C 3C600000 */ lis r3, lbl_000101E0@ha
/* 0000EF10 3BC30000 */ addi r30, r3, lbl_000101E0@l
/* 0000EF14 801F008C */ lwz r0, 0x8c(r31)
/* 0000EF18 2C000000 */ cmpwi r0, 0
/* 0000EF1C 40820020 */ bne lbl_0000EF3C
/* 0000EF20 807F0058 */ lwz r3, 0x58(r31)
/* 0000EF24 38000000 */ li r0, 0
/* 0000EF28 2C030000 */ cmpwi r3, 0
/* 0000EF2C 901F0058 */ stw r0, 0x58(r31)
/* 0000EF30 4182000C */ beq lbl_0000EF3C
/* 0000EF34 901F0088 */ stw r0, 0x88(r31)
/* 0000EF38 48000524 */ b lbl_0000F45C
lbl_0000EF3C:
/* 0000EF3C 3BA00000 */ li r29, 0
/* 0000EF40 93BF007C */ stw r29, 0x7c(r31)
/* 0000EF44 4BFFFD71 */ bl lbl_0000ECB4
/* 0000EF48 801F008C */ lwz r0, 0x8c(r31)
/* 0000EF4C 2C000000 */ cmpwi r0, 0
/* 0000EF50 41820008 */ beq lbl_0000EF58
/* 0000EF54 48000058 */ b lbl_0000EFAC
lbl_0000EF58:
/* 0000EF58 4BFFE12D */ bl lbl_0000D084
/* 0000EF5C 2C030001 */ cmpwi r3, 1
/* 0000EF60 40820024 */ bne lbl_0000EF84
/* 0000EF64 809F0078 */ lwz r4, 0x78(r31)
/* 0000EF68 3404FFFF */ addic. r0, r4, -1  ;# fixed addi
/* 0000EF6C 901F0078 */ stw r0, 0x78(r31)
/* 0000EF70 40800038 */ bge lbl_0000EFA8
/* 0000EF74 809F007C */ lwz r4, 0x7c(r31)
/* 0000EF78 3804FFFF */ addi r0, r4, -1  ;# fixed addi
/* 0000EF7C 901F0078 */ stw r0, 0x78(r31)
/* 0000EF80 48000028 */ b lbl_0000EFA8
lbl_0000EF84:
/* 0000EF84 2C030002 */ cmpwi r3, 2
/* 0000EF88 40820020 */ bne lbl_0000EFA8
/* 0000EF8C 809F0078 */ lwz r4, 0x78(r31)
/* 0000EF90 38840001 */ addi r4, r4, 1
/* 0000EF94 909F0078 */ stw r4, 0x78(r31)
/* 0000EF98 801F007C */ lwz r0, 0x7c(r31)
/* 0000EF9C 7C040000 */ cmpw r4, r0
/* 0000EFA0 41800008 */ blt lbl_0000EFA8
/* 0000EFA4 93BF0078 */ stw r29, 0x78(r31)
lbl_0000EFA8:
/* 0000EFA8 7C7D1B78 */ mr r29, r3
lbl_0000EFAC:
/* 0000EFAC 809F0078 */ lwz r4, 0x78(r31)
/* 0000EFB0 2804000D */ cmplwi r4, 0xd
/* 0000EFB4 418104A8 */ bgt lbl_0000F45C
/* 0000EFB8 3C600000 */ lis r3, lbl_000159EC@ha
/* 0000EFBC 38630000 */ addi r3, r3, lbl_000159EC@l
/* 0000EFC0 5480103A */ slwi r0, r4, 2
/* 0000EFC4 7C03002E */ lwzx r0, r3, r0
/* 0000EFC8 7C0903A6 */ mtctr r0
/* 0000EFCC 4E800420 */ bctr 
lbl_0000EFD0:
/* 0000EFD0 801F008C */ lwz r0, 0x8c(r31)
/* 0000EFD4 2C000000 */ cmpwi r0, 0
/* 0000EFD8 40820038 */ bne lbl_0000F010
/* 0000EFDC 807F0054 */ lwz r3, 0x54(r31)
/* 0000EFE0 38000000 */ li r0, 0
/* 0000EFE4 2C030000 */ cmpwi r3, 0
/* 0000EFE8 901F0054 */ stw r0, 0x54(r31)
/* 0000EFEC 41820024 */ beq lbl_0000F010
/* 0000EFF0 809F00A8 */ lwz r4, 0xa8(r31)
/* 0000EFF4 3C600000 */ lis r3, lbl_00014974@ha
/* 0000EFF8 38630000 */ addi r3, r3, lbl_00014974@l
/* 0000EFFC 909F0090 */ stw r4, 0x90(r31)
/* 0000F000 38000001 */ li r0, 1
/* 0000F004 909F0094 */ stw r4, 0x94(r31)
/* 0000F008 907F0098 */ stw r3, 0x98(r31)
/* 0000F00C 901F008C */ stw r0, 0x8c(r31)
lbl_0000F010:
/* 0000F010 801F00A4 */ lwz r0, 0xa4(r31)
/* 0000F014 2C000000 */ cmpwi r0, 0
/* 0000F018 41820444 */ beq lbl_0000F45C
/* 0000F01C 801F0090 */ lwz r0, 0x90(r31)
/* 0000F020 901F00A8 */ stw r0, 0xa8(r31)
/* 0000F024 48000438 */ b lbl_0000F45C
lbl_0000F028:
/* 0000F028 801F008C */ lwz r0, 0x8c(r31)
/* 0000F02C 2C000000 */ cmpwi r0, 0
/* 0000F030 4082004C */ bne lbl_0000F07C
/* 0000F034 807F0054 */ lwz r3, 0x54(r31)
/* 0000F038 38000000 */ li r0, 0
/* 0000F03C 2C030000 */ cmpwi r3, 0
/* 0000F040 901F0054 */ stw r0, 0x54(r31)
/* 0000F044 41820038 */ beq lbl_0000F07C
/* 0000F048 809F00A8 */ lwz r4, 0xa8(r31)
/* 0000F04C 3C600000 */ lis r3, lbl_000155BC@ha
/* 0000F050 38030000 */ addi r0, r3, lbl_000155BC@l
/* 0000F054 5485103A */ slwi r5, r4, 2
/* 0000F058 7C7F2A14 */ add r3, r31, r5
/* 0000F05C 80830010 */ lwz r4, 0x10(r3)
/* 0000F060 7C602A14 */ add r3, r0, r5
/* 0000F064 38000001 */ li r0, 1
/* 0000F068 909F0090 */ stw r4, 0x90(r31)
/* 0000F06C 909F0094 */ stw r4, 0x94(r31)
/* 0000F070 80630000 */ lwz r3, 0(r3)
/* 0000F074 907F0098 */ stw r3, 0x98(r31)
/* 0000F078 901F008C */ stw r0, 0x8c(r31)
lbl_0000F07C:
/* 0000F07C 801F00A4 */ lwz r0, 0xa4(r31)
/* 0000F080 2C000000 */ cmpwi r0, 0
/* 0000F084 418203D8 */ beq lbl_0000F45C
/* 0000F088 801F00A8 */ lwz r0, 0xa8(r31)
/* 0000F08C 809F0090 */ lwz r4, 0x90(r31)
/* 0000F090 5400103A */ slwi r0, r0, 2
/* 0000F094 7C7F0214 */ add r3, r31, r0
/* 0000F098 90830010 */ stw r4, 0x10(r3)
/* 0000F09C 480003C0 */ b lbl_0000F45C
lbl_0000F0A0:
/* 0000F0A0 801F008C */ lwz r0, 0x8c(r31)
/* 0000F0A4 2C000000 */ cmpwi r0, 0
/* 0000F0A8 40820098 */ bne lbl_0000F140
/* 0000F0AC 801F0054 */ lwz r0, 0x54(r31)
/* 0000F0B0 3BA00000 */ li r29, 0
/* 0000F0B4 2C000000 */ cmpwi r0, 0
/* 0000F0B8 93BF0054 */ stw r29, 0x54(r31)
/* 0000F0BC 41820084 */ beq lbl_0000F140
/* 0000F0C0 807F00AC */ lwz r3, 0xac(r31)
/* 0000F0C4 3C800000 */ lis r4, motLabel@ha
/* 0000F0C8 839F00B4 */ lwz r28, 0xb4(r31)
/* 0000F0CC 80030010 */ lwz r0, 0x10(r3)
/* 0000F0D0 80640000 */ lwz r3, motLabel@l(r4)
/* 0000F0D4 5400103A */ slwi r0, r0, 2
/* 0000F0D8 7F63002E */ lwzx r27, r3, r0
/* 0000F0DC 7F63DB78 */ mr r3, r27
/* 0000F0E0 4BFF107D */ bl strlen
/* 0000F0E4 939F0098 */ stw r28, 0x98(r31)
/* 0000F0E8 57A0103A */ slwi r0, r29, 2
/* 0000F0EC 3BC30000 */ addi r30, r3, 0
/* 0000F0F0 7F9C0214 */ add r28, r28, r0
/* 0000F0F4 4800002C */ b lbl_0000F120
lbl_0000F0F8:
/* 0000F0F8 387B0000 */ addi r3, r27, 0
/* 0000F0FC 38BE0000 */ addi r5, r30, 0
/* 0000F100 4BFF105D */ bl strncmp
/* 0000F104 2C030000 */ cmpwi r3, 0
/* 0000F108 40820010 */ bne lbl_0000F118
/* 0000F10C 93BF0090 */ stw r29, 0x90(r31)
/* 0000F110 93BF0094 */ stw r29, 0x94(r31)
/* 0000F114 48000024 */ b lbl_0000F138
lbl_0000F118:
/* 0000F118 3B9C0004 */ addi r28, r28, 4
/* 0000F11C 3BBD0001 */ addi r29, r29, 1
lbl_0000F120:
/* 0000F120 809C0000 */ lwz r4, 0(r28)
/* 0000F124 28040000 */ cmplwi r4, 0
/* 0000F128 4082FFD0 */ bne lbl_0000F0F8
/* 0000F12C 38000000 */ li r0, 0
/* 0000F130 901F0090 */ stw r0, 0x90(r31)
/* 0000F134 901F0094 */ stw r0, 0x94(r31)
lbl_0000F138:
/* 0000F138 38000001 */ li r0, 1
/* 0000F13C 901F008C */ stw r0, 0x8c(r31)
lbl_0000F140:
/* 0000F140 801F00A4 */ lwz r0, 0xa4(r31)
/* 0000F144 2C000000 */ cmpwi r0, 0
/* 0000F148 41820314 */ beq lbl_0000F45C
/* 0000F14C 801F0090 */ lwz r0, 0x90(r31)
/* 0000F150 809F00B0 */ lwz r4, 0xb0(r31)
/* 0000F154 5400103A */ slwi r0, r0, 2
/* 0000F158 807F00AC */ lwz r3, 0xac(r31)
/* 0000F15C 7C04002E */ lwzx r0, r4, r0
/* 0000F160 90030010 */ stw r0, 0x10(r3)
/* 0000F164 480002F8 */ b lbl_0000F45C
lbl_0000F168:
/* 0000F168 801F005C */ lwz r0, 0x5c(r31)
/* 0000F16C 807F00AC */ lwz r3, 0xac(r31)
/* 0000F170 2C000000 */ cmpwi r0, 0
/* 0000F174 C03E0010 */ lfs f1, 0x10(r30)
/* 0000F178 4182000C */ beq lbl_0000F184
/* 0000F17C C01E0014 */ lfs f0, 0x14(r30)
/* 0000F180 EC210032 */ fmuls f1, f1, f0
lbl_0000F184:
/* 0000F184 801F0060 */ lwz r0, 0x60(r31)
/* 0000F188 2C000000 */ cmpwi r0, 0
/* 0000F18C 4182000C */ beq lbl_0000F198
/* 0000F190 C01E0018 */ lfs f0, 0x18(r30)
/* 0000F194 EC210032 */ fmuls f1, f1, f0
lbl_0000F198:
/* 0000F198 2C1D0003 */ cmpwi r29, 3
/* 0000F19C 40820024 */ bne lbl_0000F1C0
/* 0000F1A0 C0030000 */ lfs f0, 0(r3)
/* 0000F1A4 EC200828 */ fsubs f1, f0, f1
/* 0000F1A8 D0230000 */ stfs f1, 0(r3)
/* 0000F1AC C01E00A4 */ lfs f0, 0xa4(r30)
/* 0000F1B0 FC010040 */ fcmpo cr0, f1, f0
/* 0000F1B4 408002A8 */ bge lbl_0000F45C
/* 0000F1B8 D0030000 */ stfs f0, 0(r3)
/* 0000F1BC 480002A0 */ b lbl_0000F45C
lbl_0000F1C0:
/* 0000F1C0 2C1D0004 */ cmpwi r29, 4
/* 0000F1C4 40820298 */ bne lbl_0000F45C
/* 0000F1C8 C0030000 */ lfs f0, 0(r3)
/* 0000F1CC EC20082A */ fadds f1, f0, f1
/* 0000F1D0 D0230000 */ stfs f1, 0(r3)
/* 0000F1D4 C01E00A8 */ lfs f0, 0xa8(r30)
/* 0000F1D8 FC010040 */ fcmpo cr0, f1, f0
/* 0000F1DC 40810280 */ ble lbl_0000F45C
/* 0000F1E0 D0030000 */ stfs f0, 0(r3)
/* 0000F1E4 48000278 */ b lbl_0000F45C
lbl_0000F1E8:
/* 0000F1E8 801F005C */ lwz r0, 0x5c(r31)
/* 0000F1EC 3864FFFC */ addi r3, r4, -4  ;# fixed addi
/* 0000F1F0 5463103A */ slwi r3, r3, 2
/* 0000F1F4 809F00AC */ lwz r4, 0xac(r31)
/* 0000F1F8 2C000000 */ cmpwi r0, 0
/* 0000F1FC 38A30004 */ addi r5, r3, 4
/* 0000F200 7CA42A14 */ add r5, r4, r5
/* 0000F204 38600001 */ li r3, 1
/* 0000F208 41820008 */ beq lbl_0000F210
/* 0000F20C 1C63000A */ mulli r3, r3, 0xa
lbl_0000F210:
/* 0000F210 801F0060 */ lwz r0, 0x60(r31)
/* 0000F214 2C000000 */ cmpwi r0, 0
/* 0000F218 41820008 */ beq lbl_0000F220
/* 0000F21C 1C630064 */ mulli r3, r3, 0x64
lbl_0000F220:
/* 0000F220 2C1D0003 */ cmpwi r29, 3
/* 0000F224 40820024 */ bne lbl_0000F248
/* 0000F228 80050000 */ lwz r0, 0(r5)
/* 0000F22C 7C030050 */ subf r0, r3, r0
/* 0000F230 2C00D8F0 */ cmpwi r0, -10000
/* 0000F234 90050000 */ stw r0, 0(r5)
/* 0000F238 40800224 */ bge lbl_0000F45C
/* 0000F23C 3800D8F0 */ li r0, -10000
/* 0000F240 90050000 */ stw r0, 0(r5)
/* 0000F244 48000218 */ b lbl_0000F45C
lbl_0000F248:
/* 0000F248 2C1D0004 */ cmpwi r29, 4
/* 0000F24C 40820210 */ bne lbl_0000F45C
/* 0000F250 80050000 */ lwz r0, 0(r5)
/* 0000F254 7C001A14 */ add r0, r0, r3
/* 0000F258 2C002710 */ cmpwi r0, 0x2710
/* 0000F25C 90050000 */ stw r0, 0(r5)
/* 0000F260 408101FC */ ble lbl_0000F45C
/* 0000F264 38002710 */ li r0, 0x2710
/* 0000F268 90050000 */ stw r0, 0(r5)
/* 0000F26C 480001F0 */ b lbl_0000F45C
lbl_0000F270:
/* 0000F270 807F00AC */ lwz r3, 0xac(r31)
/* 0000F274 2C1D0003 */ cmpwi r29, 3
/* 0000F278 38830014 */ addi r4, r3, 0x14
/* 0000F27C 40820020 */ bne lbl_0000F29C
/* 0000F280 80640000 */ lwz r3, 0(r4)
/* 0000F284 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000F288 90040000 */ stw r0, 0(r4)
/* 0000F28C 408001D0 */ bge lbl_0000F45C
/* 0000F290 3800001E */ li r0, 0x1e
/* 0000F294 90040000 */ stw r0, 0(r4)
/* 0000F298 480001C4 */ b lbl_0000F45C
lbl_0000F29C:
/* 0000F29C 2C1D0004 */ cmpwi r29, 4
/* 0000F2A0 408201BC */ bne lbl_0000F45C
/* 0000F2A4 80640000 */ lwz r3, 0(r4)
/* 0000F2A8 38030001 */ addi r0, r3, 1
/* 0000F2AC 2C00001E */ cmpwi r0, 0x1e
/* 0000F2B0 90040000 */ stw r0, 0(r4)
/* 0000F2B4 408101A8 */ ble lbl_0000F45C
/* 0000F2B8 38000000 */ li r0, 0
/* 0000F2BC 90040000 */ stw r0, 0(r4)
/* 0000F2C0 4800019C */ b lbl_0000F45C
lbl_0000F2C4:
/* 0000F2C4 3C600000 */ lis r3, controllerInfo@ha
/* 0000F2C8 C05E00AC */ lfs f2, 0xac(r30)
/* 0000F2CC 38E30000 */ addi r7, r3, controllerInfo@l
/* 0000F2D0 88070007 */ lbz r0, 7(r7)
/* 0000F2D4 3CC00000 */ lis r6, lbl_00010298@ha
/* 0000F2D8 88870006 */ lbz r4, 6(r7)
/* 0000F2DC 3C600000 */ lis r3, lbl_00010298@ha
/* 0000F2E0 9001001C */ stw r0, 0x1c(r1)
/* 0000F2E4 3CA04330 */ lis r5, 0x4330
/* 0000F2E8 A0070000 */ lhz r0, 0(r7)
/* 0000F2EC 90810014 */ stw r4, 0x14(r1)
/* 0000F2F0 C8860000 */ lfd f4, lbl_00010298@l(r6)
/* 0000F2F4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000F2F8 90A10018 */ stw r5, 0x18(r1)
/* 0000F2FC C8230000 */ lfd f1, lbl_00010298@l(r3)
/* 0000F300 90A10010 */ stw r5, 0x10(r1)
/* 0000F304 C8610018 */ lfd f3, 0x18(r1)
/* 0000F308 C8010010 */ lfd f0, 0x10(r1)
/* 0000F30C EC632028 */ fsubs f3, f3, f4
/* 0000F310 EC000828 */ fsubs f0, f0, f1
/* 0000F314 EC231024 */ fdivs f1, f3, f2
/* 0000F318 EC001024 */ fdivs f0, f0, f2
/* 0000F31C EC210028 */ fsubs f1, f1, f0
/* 0000F320 4182000C */ beq lbl_0000F32C
/* 0000F324 C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000F328 EC210032 */ fmuls f1, f1, f0
lbl_0000F32C:
/* 0000F32C C01F0008 */ lfs f0, 8(r31)
/* 0000F330 EC00082A */ fadds f0, f0, f1
/* 0000F334 D01F0008 */ stfs f0, 8(r31)
/* 0000F338 C03F0008 */ lfs f1, 8(r31)
/* 0000F33C C01E00A0 */ lfs f0, 0xa0(r30)
/* 0000F340 FC010040 */ fcmpo cr0, f1, f0
/* 0000F344 4081000C */ ble lbl_0000F350
/* 0000F348 D01F0008 */ stfs f0, 8(r31)
/* 0000F34C 48000014 */ b lbl_0000F360
lbl_0000F350:
/* 0000F350 C01E000C */ lfs f0, 0xc(r30)
/* 0000F354 FC010040 */ fcmpo cr0, f1, f0
/* 0000F358 40800008 */ bge lbl_0000F360
/* 0000F35C D01F0008 */ stfs f0, 8(r31)
lbl_0000F360:
/* 0000F360 C01F0008 */ lfs f0, 8(r31)
/* 0000F364 807F00AC */ lwz r3, 0xac(r31)
/* 0000F368 D0030018 */ stfs f0, 0x18(r3)
/* 0000F36C 480000F0 */ b lbl_0000F45C
lbl_0000F370:
/* 0000F370 807F0054 */ lwz r3, 0x54(r31)
/* 0000F374 38000000 */ li r0, 0
/* 0000F378 2C030000 */ cmpwi r3, 0
/* 0000F37C 901F0054 */ stw r0, 0x54(r31)
/* 0000F380 418200DC */ beq lbl_0000F45C
/* 0000F384 807F00AC */ lwz r3, 0xac(r31)
/* 0000F388 8003000C */ lwz r0, 0xc(r3)
/* 0000F38C 68000001 */ xori r0, r0, 1
/* 0000F390 9003000C */ stw r0, 0xc(r3)
/* 0000F394 480000C8 */ b lbl_0000F45C
lbl_0000F398:
/* 0000F398 807F0054 */ lwz r3, 0x54(r31)
/* 0000F39C 38000000 */ li r0, 0
/* 0000F3A0 2C030000 */ cmpwi r3, 0
/* 0000F3A4 901F0054 */ stw r0, 0x54(r31)
/* 0000F3A8 418200B4 */ beq lbl_0000F45C
/* 0000F3AC 807F00AC */ lwz r3, 0xac(r31)
/* 0000F3B0 8003000C */ lwz r0, 0xc(r3)
/* 0000F3B4 68000002 */ xori r0, r0, 2
/* 0000F3B8 9003000C */ stw r0, 0xc(r3)
/* 0000F3BC 480000A0 */ b lbl_0000F45C
lbl_0000F3C0:
/* 0000F3C0 807F0054 */ lwz r3, 0x54(r31)
/* 0000F3C4 38000000 */ li r0, 0
/* 0000F3C8 2C030000 */ cmpwi r3, 0
/* 0000F3CC 901F0054 */ stw r0, 0x54(r31)
/* 0000F3D0 4182008C */ beq lbl_0000F45C
/* 0000F3D4 807F00AC */ lwz r3, 0xac(r31)
/* 0000F3D8 8003000C */ lwz r0, 0xc(r3)
/* 0000F3DC 68000004 */ xori r0, r0, 4
/* 0000F3E0 9003000C */ stw r0, 0xc(r3)
/* 0000F3E4 48000078 */ b lbl_0000F45C
lbl_0000F3E8:
/* 0000F3E8 807F0054 */ lwz r3, 0x54(r31)
/* 0000F3EC 38000000 */ li r0, 0
/* 0000F3F0 2C030000 */ cmpwi r3, 0
/* 0000F3F4 901F0054 */ stw r0, 0x54(r31)
/* 0000F3F8 41820064 */ beq lbl_0000F45C
/* 0000F3FC 807F00AC */ lwz r3, 0xac(r31)
/* 0000F400 8003000C */ lwz r0, 0xc(r3)
/* 0000F404 68000008 */ xori r0, r0, 8
/* 0000F408 9003000C */ stw r0, 0xc(r3)
/* 0000F40C 48000050 */ b lbl_0000F45C
lbl_0000F410:
/* 0000F410 807F0054 */ lwz r3, 0x54(r31)
/* 0000F414 38000000 */ li r0, 0
/* 0000F418 2C030000 */ cmpwi r3, 0
/* 0000F41C 901F0054 */ stw r0, 0x54(r31)
/* 0000F420 4182003C */ beq lbl_0000F45C
/* 0000F424 807F00AC */ lwz r3, 0xac(r31)
/* 0000F428 8003000C */ lwz r0, 0xc(r3)
/* 0000F42C 68000010 */ xori r0, r0, 0x10
/* 0000F430 9003000C */ stw r0, 0xc(r3)
/* 0000F434 48000028 */ b lbl_0000F45C
lbl_0000F438:
/* 0000F438 801F0054 */ lwz r0, 0x54(r31)
/* 0000F43C 38800000 */ li r4, 0
/* 0000F440 2C000000 */ cmpwi r0, 0
/* 0000F444 909F0054 */ stw r4, 0x54(r31)
/* 0000F448 41820014 */ beq lbl_0000F45C
/* 0000F44C 3C600000 */ lis r3, lbl_0000E628@ha
/* 0000F450 38030000 */ addi r0, r3, lbl_0000E628@l
/* 0000F454 901F0088 */ stw r0, 0x88(r31)
/* 0000F458 909F0078 */ stw r4, 0x78(r31)
lbl_0000F45C:
/* 0000F45C BB610024 */ lmw r27, 0x24(r1)
/* 0000F460 8001003C */ lwz r0, 0x3c(r1)
/* 0000F464 38210038 */ addi r1, r1, 0x38
/* 0000F468 7C0803A6 */ mtlr r0
/* 0000F46C 4E800020 */ blr 
lbl_0000F470:
/* 0000F470 3C800000 */ lis r4, lbl_10003C80@ha
/* 0000F474 84040000 */ lwzu r0, lbl_10003C80@l(r4)
/* 0000F478 28000000 */ cmplwi r0, 0
/* 0000F47C 4C820020 */ bnelr 
/* 0000F480 2C030000 */ cmpwi r3, 0
/* 0000F484 4D820020 */ beqlr 
/* 0000F488 3C600000 */ lis r3, lbl_0000EEF4@ha
/* 0000F48C 38030000 */ addi r0, r3, lbl_0000EEF4@l
/* 0000F490 90040000 */ stw r0, 0(r4)
/* 0000F494 4E800020 */ blr 
lbl_0000F498:
/* 0000F498 7C0802A6 */ mflr r0
/* 0000F49C 2C030000 */ cmpwi r3, 0
/* 0000F4A0 90010004 */ stw r0, 4(r1)
/* 0000F4A4 9421FFF8 */ stwu r1, -8(r1)
/* 0000F4A8 41820020 */ beq lbl_0000F4C8
/* 0000F4AC 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000F4B0 38630000 */ addi r3, r3, lbl_10003BF8@l
/* 0000F4B4 80630000 */ lwz r3, 0(r3)
/* 0000F4B8 4BFF0CA5 */ bl func_8008D29C
/* 0000F4BC 3C600000 */ lis r3, lbl_10003C60@ha
/* 0000F4C0 38000000 */ li r0, 0
/* 0000F4C4 90030000 */ stw r0, lbl_10003C60@l(r3)
lbl_0000F4C8:
/* 0000F4C8 8001000C */ lwz r0, 0xc(r1)
/* 0000F4CC 38210008 */ addi r1, r1, 8
/* 0000F4D0 7C0803A6 */ mtlr r0
/* 0000F4D4 4E800020 */ blr 
lbl_0000F4D8:
/* 0000F4D8 7C0802A6 */ mflr r0
/* 0000F4DC 2C030000 */ cmpwi r3, 0
/* 0000F4E0 90010004 */ stw r0, 4(r1)
/* 0000F4E4 3C600000 */ lis r3, lbl_000148E8@ha
/* 0000F4E8 9421FE88 */ stwu r1, -0x178(r1)
/* 0000F4EC BF610164 */ stmw r27, 0x164(r1)
/* 0000F4F0 3BE30000 */ addi r31, r3, lbl_000148E8@l
/* 0000F4F4 418201E8 */ beq lbl_0000F6DC
/* 0000F4F8 4BFF0C65 */ bl func_800948EC
/* 0000F4FC 2C030000 */ cmpwi r3, 0
/* 0000F500 418201DC */ beq lbl_0000F6DC
/* 0000F504 387F113C */ addi r3, r31, 0x113c
/* 0000F508 388100DC */ addi r4, r1, 0xdc
/* 0000F50C 4BFF0C51 */ bl func_800A71B0
/* 0000F510 386100DC */ addi r3, r1, 0xdc
/* 0000F514 389F1144 */ addi r4, r31, 0x1144
/* 0000F518 4BFF0C45 */ bl strcmp
/* 0000F51C 2C030000 */ cmpwi r3, 0
/* 0000F520 408200BC */ bne lbl_0000F5DC
/* 0000F524 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000F528 3BC30000 */ addi r30, r3, __OSCurrHeap@l
/* 0000F52C 3FA00005 */ lis r29, 5
/* 0000F530 807E0000 */ lwz r3, 0(r30)
/* 0000F534 389DE000 */ addi r4, r29, -8192  ;# fixed addi
/* 0000F538 4BFF0C25 */ bl OSAllocFromHeap
/* 0000F53C 7C7B1B78 */ mr r27, r3
/* 0000F540 4BFF0C1D */ bl OSGetTime
/* 0000F544 38A10074 */ addi r5, r1, 0x74
/* 0000F548 4BFF0C15 */ bl OSTicksToCalendarTime
/* 0000F54C 80A10084 */ lwz r5, 0x84(r1)
/* 0000F550 3861009C */ addi r3, r1, 0x9c
/* 0000F554 80C10080 */ lwz r6, 0x80(r1)
/* 0000F558 389F114C */ addi r4, r31, 0x114c
/* 0000F55C 80E1007C */ lwz r7, 0x7c(r1)
/* 0000F560 81010078 */ lwz r8, 0x78(r1)
/* 0000F564 38A50001 */ addi r5, r5, 1
/* 0000F568 81210074 */ lwz r9, 0x74(r1)
/* 0000F56C 4CC63182 */ crclr 6
/* 0000F570 4BFF0BED */ bl sprintf
/* 0000F574 387F1174 */ addi r3, r31, 0x1174
/* 0000F578 38800001 */ li r4, 1
/* 0000F57C 4BFF0BE1 */ bl func_800A722C
/* 0000F580 3B830000 */ addi r28, r3, 0
/* 0000F584 389B0000 */ addi r4, r27, 0
/* 0000F588 38BDE000 */ addi r5, r29, -8192  ;# fixed addi
/* 0000F58C 4BFF0BD1 */ bl func_800A7370
/* 0000F590 7F83E378 */ mr r3, r28
/* 0000F594 4BFF0BC9 */ bl func_800A7314
/* 0000F598 3861009C */ addi r3, r1, 0x9c
/* 0000F59C 38800002 */ li r4, 2
/* 0000F5A0 4BFF0BBD */ bl func_800A722C
/* 0000F5A4 3B830000 */ addi r28, r3, 0
/* 0000F5A8 389B0000 */ addi r4, r27, 0
/* 0000F5AC 38BDE000 */ addi r5, r29, -8192  ;# fixed addi
/* 0000F5B0 4BFF0BAD */ bl func_800A7440
/* 0000F5B4 7F83E378 */ mr r3, r28
/* 0000F5B8 4BFF0BA5 */ bl func_800A7314
/* 0000F5BC 807E0000 */ lwz r3, 0(r30)
/* 0000F5C0 7F64DB78 */ mr r4, r27
/* 0000F5C4 4BFF0B99 */ bl OSFreeToHeap
/* 0000F5C8 387F118C */ addi r3, r31, 0x118c
/* 0000F5CC 38800002 */ li r4, 2
/* 0000F5D0 4BFF0B8D */ bl func_800A722C
/* 0000F5D4 7C7D1B78 */ mr r29, r3
/* 0000F5D8 480000E4 */ b lbl_0000F6BC
lbl_0000F5DC:
/* 0000F5DC 386100DC */ addi r3, r1, 0xdc
/* 0000F5E0 389F11A0 */ addi r4, r31, 0x11a0
/* 0000F5E4 4BFF0B79 */ bl strcmp
/* 0000F5E8 2C030000 */ cmpwi r3, 0
/* 0000F5EC 408200C0 */ bne lbl_0000F6AC
/* 0000F5F0 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000F5F4 3BA30000 */ addi r29, r3, __OSCurrHeap@l
/* 0000F5F8 3FC00005 */ lis r30, 5
/* 0000F5FC 807D0000 */ lwz r3, 0(r29)
/* 0000F600 389EE000 */ addi r4, r30, -8192  ;# fixed addi
/* 0000F604 4BFF0B59 */ bl OSAllocFromHeap
/* 0000F608 7C7B1B78 */ mr r27, r3
/* 0000F60C 4BFF0B51 */ bl OSGetTime
/* 0000F610 38A1000C */ addi r5, r1, 0xc
/* 0000F614 4BFF0B49 */ bl OSTicksToCalendarTime
/* 0000F618 80C1001C */ lwz r6, 0x1c(r1)
/* 0000F61C 38610034 */ addi r3, r1, 0x34
/* 0000F620 80A10020 */ lwz r5, 0x20(r1)
/* 0000F624 389F11AC */ addi r4, r31, 0x11ac
/* 0000F628 80E10018 */ lwz r7, 0x18(r1)
/* 0000F62C 81010014 */ lwz r8, 0x14(r1)
/* 0000F630 38C60001 */ addi r6, r6, 1
/* 0000F634 81210010 */ lwz r9, 0x10(r1)
/* 0000F638 4CC63182 */ crclr 6
/* 0000F63C 8141000C */ lwz r10, 0xc(r1)
/* 0000F640 4BFF0B1D */ bl sprintf
/* 0000F644 387F11E0 */ addi r3, r31, 0x11e0
/* 0000F648 38800001 */ li r4, 1
/* 0000F64C 4BFF0B11 */ bl func_800A722C
/* 0000F650 3B830000 */ addi r28, r3, 0
/* 0000F654 389B0000 */ addi r4, r27, 0
/* 0000F658 38BEE000 */ addi r5, r30, -8192  ;# fixed addi
/* 0000F65C 4BFF0B01 */ bl func_800A7370
/* 0000F660 7F83E378 */ mr r3, r28
/* 0000F664 4BFF0AF9 */ bl func_800A7314
/* 0000F668 38610034 */ addi r3, r1, 0x34
/* 0000F66C 38800002 */ li r4, 2
/* 0000F670 4BFF0AED */ bl func_800A722C
/* 0000F674 3B830000 */ addi r28, r3, 0
/* 0000F678 389B0000 */ addi r4, r27, 0
/* 0000F67C 38BEE000 */ addi r5, r30, -8192  ;# fixed addi
/* 0000F680 4BFF0ADD */ bl func_800A7440
/* 0000F684 7F83E378 */ mr r3, r28
/* 0000F688 4BFF0AD5 */ bl func_800A7314
/* 0000F68C 807D0000 */ lwz r3, 0(r29)
/* 0000F690 7F64DB78 */ mr r4, r27
/* 0000F694 4BFF0AC9 */ bl OSFreeToHeap
/* 0000F698 387F11E0 */ addi r3, r31, 0x11e0
/* 0000F69C 38800002 */ li r4, 2
/* 0000F6A0 4BFF0ABD */ bl func_800A722C
/* 0000F6A4 7C7D1B78 */ mr r29, r3
/* 0000F6A8 48000014 */ b lbl_0000F6BC
lbl_0000F6AC:
/* 0000F6AC 387F1200 */ addi r3, r31, 0x1200
/* 0000F6B0 38800002 */ li r4, 2
/* 0000F6B4 4BFF0AA9 */ bl func_800A722C
/* 0000F6B8 7C7D1B78 */ mr r29, r3
lbl_0000F6BC:
/* 0000F6BC 3C600000 */ lis r3, motInfo@ha
/* 0000F6C0 3CA00005 */ lis r5, 5
/* 0000F6C4 80830000 */ lwz r4, motInfo@l(r3)
/* 0000F6C8 387D0000 */ addi r3, r29, 0
/* 0000F6CC 38A5E000 */ addi r5, r5, -8192  ;# fixed addi
/* 0000F6D0 4BFF0A8D */ bl func_800A7440
/* 0000F6D4 7FA3EB78 */ mr r3, r29
/* 0000F6D8 4BFF0A85 */ bl func_800A7314
lbl_0000F6DC:
/* 0000F6DC BB610164 */ lmw r27, 0x164(r1)
/* 0000F6E0 8001017C */ lwz r0, 0x17c(r1)
/* 0000F6E4 38210178 */ addi r1, r1, 0x178
/* 0000F6E8 7C0803A6 */ mtlr r0
/* 0000F6EC 4E800020 */ blr 
lbl_0000F6F0:
/* 0000F6F0 7C0802A6 */ mflr r0
/* 0000F6F4 3C600000 */ lis r3, gameMode@ha
/* 0000F6F8 90010004 */ stw r0, 4(r1)
/* 0000F6FC 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000F700 93E1001C */ stw r31, 0x1c(r1)
/* 0000F704 3BE40000 */ addi r31, r4, 0
/* 0000F708 20DF0003 */ subfic r6, r31, 3
/* 0000F70C 93C10018 */ stw r30, 0x18(r1)
/* 0000F710 93A10014 */ stw r29, 0x14(r1)
/* 0000F714 A8030000 */ lha r0, gameMode@l(r3)
/* 0000F718 3C600000 */ lis r3, gameSubmode@ha
/* 0000F71C 20A00003 */ subfic r5, r0, 3
/* 0000F720 A8030000 */ lha r0, gameSubmode@l(r3)
/* 0000F724 3085FFFF */ addic r4, r5, -1  ;# fixed addi
/* 0000F728 7C842910 */ subfe r4, r4, r5
/* 0000F72C 7CC50034 */ cntlzw r5, r6
/* 0000F730 54A6D97E */ srwi r6, r5, 5
/* 0000F734 20600078 */ subfic r3, r0, 0x78
/* 0000F738 3003FFFF */ addic r0, r3, -1  ;# fixed addi
/* 0000F73C 3CA00000 */ lis r5, lbl_10003BF8@ha
/* 0000F740 7CC62378 */ or r6, r6, r4
/* 0000F744 7C001910 */ subfe r0, r0, r3
/* 0000F748 7CC60379 */ or. r6, r6, r0
/* 0000F74C 3BA50000 */ addi r29, r5, lbl_10003BF8@l
/* 0000F750 41820050 */ beq lbl_0000F7A0
/* 0000F754 807D0004 */ lwz r3, 4(r29)
/* 0000F758 4BFF0A05 */ bl func_8008B2D4
/* 0000F75C 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000F760 809D0084 */ lwz r4, 0x84(r29)
/* 0000F764 3BC30000 */ addi r30, r3, __OSCurrHeap@l
/* 0000F768 807E0000 */ lwz r3, 0(r30)
/* 0000F76C 4BFF09F1 */ bl OSFreeToHeap
/* 0000F770 807E0000 */ lwz r3, 0(r30)
/* 0000F774 809D0080 */ lwz r4, 0x80(r29)
/* 0000F778 4BFF09E5 */ bl OSFreeToHeap
/* 0000F77C 807E0000 */ lwz r3, 0(r30)
/* 0000F780 809D00B0 */ lwz r4, 0xb0(r29)
/* 0000F784 4BFF09D9 */ bl OSFreeToHeap
/* 0000F788 807E0000 */ lwz r3, 0(r30)
/* 0000F78C 809D00B4 */ lwz r4, 0xb4(r29)
/* 0000F790 4BFF09CD */ bl OSFreeToHeap
/* 0000F794 2C1F0003 */ cmpwi r31, 3
/* 0000F798 41820008 */ beq lbl_0000F7A0
/* 0000F79C 4BFF09C1 */ bl func_8008D240
lbl_0000F7A0:
/* 0000F7A0 80010024 */ lwz r0, 0x24(r1)
/* 0000F7A4 83E1001C */ lwz r31, 0x1c(r1)
/* 0000F7A8 83C10018 */ lwz r30, 0x18(r1)
/* 0000F7AC 7C0803A6 */ mtlr r0
/* 0000F7B0 83A10014 */ lwz r29, 0x14(r1)
/* 0000F7B4 38210020 */ addi r1, r1, 0x20
/* 0000F7B8 4E800020 */ blr 
lbl_0000F7BC:
/* 0000F7BC 7C0802A6 */ mflr r0
/* 0000F7C0 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000F7C4 90010004 */ stw r0, 4(r1)
/* 0000F7C8 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000F7CC 93E10014 */ stw r31, 0x14(r1)
/* 0000F7D0 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000F7D4 93C10010 */ stw r30, 0x10(r1)
/* 0000F7D8 80DF00A8 */ lwz r6, 0xa8(r31)
/* 0000F7DC 2C060007 */ cmpwi r6, 7
/* 0000F7E0 40820080 */ bne lbl_0000F860
/* 0000F7E4 801F006C */ lwz r0, 0x6c(r31)
/* 0000F7E8 3C600000 */ lis r3, motInfo@ha
/* 0000F7EC 54C5103A */ slwi r5, r6, 2
/* 0000F7F0 1C0000B4 */ mulli r0, r0, 0xb4
/* 0000F7F4 3BC30000 */ addi r30, r3, motInfo@l
/* 0000F7F8 7C602A14 */ add r3, r0, r5
/* 0000F7FC 809E0000 */ lwz r4, 0(r30)
/* 0000F800 7CBF2A14 */ add r5, r31, r5
/* 0000F804 38030070 */ addi r0, r3, 0x70
/* 0000F808 80A50010 */ lwz r5, 0x10(r5)
/* 0000F80C 7C04002E */ lwzx r0, r4, r0
/* 0000F810 7C050000 */ cmpw r5, r0
/* 0000F814 4180004C */ blt lbl_0000F860
/* 0000F818 90C1000C */ stw r6, 0xc(r1)
/* 0000F81C 3861000C */ addi r3, r1, 0xc
/* 0000F820 38810008 */ addi r4, r1, 8
/* 0000F824 90A10008 */ stw r5, 8(r1)
/* 0000F828 4BFF0935 */ bl func_8008BAA8
/* 0000F82C 801F006C */ lwz r0, 0x6c(r31)
/* 0000F830 8061000C */ lwz r3, 0xc(r1)
/* 0000F834 1C8000B4 */ mulli r4, r0, 0xb4
/* 0000F838 80010008 */ lwz r0, 8(r1)
/* 0000F83C 80BE0000 */ lwz r5, 0(r30)
/* 0000F840 5463103A */ slwi r3, r3, 2
/* 0000F844 7C641A14 */ add r3, r4, r3
/* 0000F848 38630030 */ addi r3, r3, 0x30
/* 0000F84C 7C65182E */ lwzx r3, r5, r3
/* 0000F850 54002834 */ slwi r0, r0, 5
/* 0000F854 7C030214 */ add r0, r3, r0
/* 0000F858 901F00AC */ stw r0, 0xac(r31)
/* 0000F85C 4800003C */ b lbl_0000F898
lbl_0000F860:
/* 0000F860 801F006C */ lwz r0, 0x6c(r31)
/* 0000F864 3C600000 */ lis r3, motInfo@ha
/* 0000F868 809F00A8 */ lwz r4, 0xa8(r31)
/* 0000F86C 1C0000B4 */ mulli r0, r0, 0xb4
/* 0000F870 80A30000 */ lwz r5, motInfo@l(r3)
/* 0000F874 5483103A */ slwi r3, r4, 2
/* 0000F878 7C801A14 */ add r4, r0, r3
/* 0000F87C 7C7F1A14 */ add r3, r31, r3
/* 0000F880 80030010 */ lwz r0, 0x10(r3)
/* 0000F884 38840030 */ addi r4, r4, 0x30
/* 0000F888 7C65202E */ lwzx r3, r5, r4
/* 0000F88C 54002834 */ slwi r0, r0, 5
/* 0000F890 7C030214 */ add r0, r3, r0
/* 0000F894 901F00AC */ stw r0, 0xac(r31)
lbl_0000F898:
/* 0000F898 807F0004 */ lwz r3, 4(r31)
/* 0000F89C 80BF00AC */ lwz r5, 0xac(r31)
/* 0000F8A0 38C3001C */ addi r6, r3, 0x1c
/* 0000F8A4 8003001C */ lwz r0, 0x1c(r3)
/* 0000F8A8 7C050040 */ cmplw r5, r0
/* 0000F8AC 40820018 */ bne lbl_0000F8C4
/* 0000F8B0 80630000 */ lwz r3, 0(r3)
/* 0000F8B4 80850010 */ lwz r4, 0x10(r5)
/* 0000F8B8 A0030032 */ lhz r0, 0x32(r3)
/* 0000F8BC 7C040000 */ cmpw r4, r0
/* 0000F8C0 41820068 */ beq lbl_0000F928
lbl_0000F8C4:
/* 0000F8C4 90A60000 */ stw r5, 0(r6)
/* 0000F8C8 3C600000 */ lis r3, lbl_802F20AC@ha
/* 0000F8CC 809F00AC */ lwz r4, 0xac(r31)
/* 0000F8D0 80030000 */ lwz r0, lbl_802F20AC@l(r3)
/* 0000F8D4 84640010 */ lwzu r3, 0x10(r4)
/* 0000F8D8 7C030000 */ cmpw r3, r0
/* 0000F8DC 4081000C */ ble lbl_0000F8E8
/* 0000F8E0 38000001 */ li r0, 1
/* 0000F8E4 90040000 */ stw r0, 0(r4)
lbl_0000F8E8:
/* 0000F8E8 801F00A8 */ lwz r0, 0xa8(r31)
/* 0000F8EC 807F0004 */ lwz r3, 4(r31)
/* 0000F8F0 90030028 */ stw r0, 0x28(r3)
/* 0000F8F4 801F00A8 */ lwz r0, 0xa8(r31)
/* 0000F8F8 807F0004 */ lwz r3, 4(r31)
/* 0000F8FC 5400103A */ slwi r0, r0, 2
/* 0000F900 7C9F0214 */ add r4, r31, r0
/* 0000F904 80040010 */ lwz r0, 0x10(r4)
/* 0000F908 900300B0 */ stw r0, 0xb0(r3)
/* 0000F90C 809F00AC */ lwz r4, 0xac(r31)
/* 0000F910 807F0004 */ lwz r3, 4(r31)
/* 0000F914 80840010 */ lwz r4, 0x10(r4)
/* 0000F918 4BFF0845 */ bl func_8008B9DC
/* 0000F91C 807F00AC */ lwz r3, 0xac(r31)
/* 0000F920 C0030018 */ lfs f0, 0x18(r3)
/* 0000F924 D01F0008 */ stfs f0, 8(r31)
lbl_0000F928:
/* 0000F928 8001001C */ lwz r0, 0x1c(r1)
/* 0000F92C 83E10014 */ lwz r31, 0x14(r1)
/* 0000F930 83C10010 */ lwz r30, 0x10(r1)
/* 0000F934 7C0803A6 */ mtlr r0
/* 0000F938 38210018 */ addi r1, r1, 0x18
/* 0000F93C 4E800020 */ blr 
lbl_0000F940:
/* 0000F940 7C0802A6 */ mflr r0
/* 0000F944 3C800000 */ lis r4, lbl_000101E0@ha
/* 0000F948 90010004 */ stw r0, 4(r1)
/* 0000F94C 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000F950 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000F954 93E1001C */ stw r31, 0x1c(r1)
/* 0000F958 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000F95C 93C10018 */ stw r30, 0x18(r1)
/* 0000F960 3BC40000 */ addi r30, r4, lbl_000101E0@l
/* 0000F964 93A10014 */ stw r29, 0x14(r1)
/* 0000F968 4BFF07F5 */ bl func_8002FFEC
/* 0000F96C 3C600000 */ lis r3, lbl_0000F6F0@ha
/* 0000F970 38630000 */ addi r3, r3, lbl_0000F6F0@l
/* 0000F974 38800000 */ li r4, 0
/* 0000F978 38A00005 */ li r5, 5
/* 0000F97C 4BFF07E1 */ bl func_8008D1DC
/* 0000F980 907F0000 */ stw r3, 0(r31)
/* 0000F984 38800000 */ li r4, 0
/* 0000F988 3C600000 */ lis r3, lbl_000156F0@ha
/* 0000F98C 909F0088 */ stw r4, 0x88(r31)
/* 0000F990 38C30000 */ addi r6, r3, lbl_000156F0@l
/* 0000F994 38600001 */ li r3, 1
/* 0000F998 909F008C */ stw r4, 0x8c(r31)
/* 0000F99C 3800FFFF */ li r0, -1
/* 0000F9A0 909F0078 */ stw r4, 0x78(r31)
/* 0000F9A4 909F006C */ stw r4, 0x6c(r31)
/* 0000F9A8 907F0068 */ stw r3, 0x68(r31)
/* 0000F9AC 901F0074 */ stw r0, 0x74(r31)
/* 0000F9B0 909F0004 */ stw r4, 4(r31)
/* 0000F9B4 909F0050 */ stw r4, 0x50(r31)
/* 0000F9B8 909F00A4 */ stw r4, 0xa4(r31)
/* 0000F9BC 909F00A8 */ stw r4, 0xa8(r31)
/* 0000F9C0 909F00BC */ stw r4, 0xbc(r31)
/* 0000F9C4 909F0010 */ stw r4, 0x10(r31)
/* 0000F9C8 909F0014 */ stw r4, 0x14(r31)
/* 0000F9CC 909F0018 */ stw r4, 0x18(r31)
/* 0000F9D0 909F001C */ stw r4, 0x1c(r31)
/* 0000F9D4 909F0020 */ stw r4, 0x20(r31)
/* 0000F9D8 909F0024 */ stw r4, 0x24(r31)
/* 0000F9DC 909F0028 */ stw r4, 0x28(r31)
/* 0000F9E0 909F002C */ stw r4, 0x2c(r31)
/* 0000F9E4 909F0030 */ stw r4, 0x30(r31)
/* 0000F9E8 909F0034 */ stw r4, 0x34(r31)
/* 0000F9EC 909F0038 */ stw r4, 0x38(r31)
/* 0000F9F0 909F003C */ stw r4, 0x3c(r31)
/* 0000F9F4 909F0040 */ stw r4, 0x40(r31)
/* 0000F9F8 909F0044 */ stw r4, 0x44(r31)
/* 0000F9FC 909F0048 */ stw r4, 0x48(r31)
/* 0000FA00 909F004C */ stw r4, 0x4c(r31)
/* 0000FA04 909F0060 */ stw r4, 0x60(r31)
/* 0000FA08 909F005C */ stw r4, 0x5c(r31)
/* 0000FA0C 909F0058 */ stw r4, 0x58(r31)
/* 0000FA10 909F0054 */ stw r4, 0x54(r31)
/* 0000FA14 909F0070 */ stw r4, 0x70(r31)
/* 0000FA18 48000014 */ b lbl_0000FA2C
lbl_0000FA1C:
/* 0000FA1C 807F0070 */ lwz r3, 0x70(r31)
/* 0000FA20 38C60008 */ addi r6, r6, 8
/* 0000FA24 38030001 */ addi r0, r3, 1
/* 0000FA28 901F0070 */ stw r0, 0x70(r31)
lbl_0000FA2C:
/* 0000FA2C 80060004 */ lwz r0, 4(r6)
/* 0000FA30 28000000 */ cmplwi r0, 0
/* 0000FA34 4082FFE8 */ bne lbl_0000FA1C
/* 0000FA38 4BFFE0F5 */ bl lbl_0000DB2C
/* 0000FA3C 38600003 */ li r3, 3
/* 0000FA40 4BFF071D */ bl camera_set_state
/* 0000FA44 3C600000 */ lis r3, currentCameraStructPtr@ha
/* 0000FA48 C01E000C */ lfs f0, 0xc(r30)
/* 0000FA4C 38830000 */ addi r4, r3, currentCameraStructPtr@l
/* 0000FA50 80640000 */ lwz r3, 0(r4)
/* 0000FA54 D0030000 */ stfs f0, 0(r3)
/* 0000FA58 C01E00C0 */ lfs f0, 0xc0(r30)
/* 0000FA5C 80640000 */ lwz r3, 0(r4)
/* 0000FA60 D0030004 */ stfs f0, 4(r3)
/* 0000FA64 C01E00C4 */ lfs f0, 0xc4(r30)
/* 0000FA68 80640000 */ lwz r3, 0(r4)
/* 0000FA6C D0030008 */ stfs f0, 8(r3)
/* 0000FA70 C01E000C */ lfs f0, 0xc(r30)
/* 0000FA74 80640000 */ lwz r3, 0(r4)
/* 0000FA78 D003000C */ stfs f0, 0xc(r3)
/* 0000FA7C C01E00C8 */ lfs f0, 0xc8(r30)
/* 0000FA80 80640000 */ lwz r3, 0(r4)
/* 0000FA84 D0030010 */ stfs f0, 0x10(r3)
/* 0000FA88 C01E000C */ lfs f0, 0xc(r30)
/* 0000FA8C 80640000 */ lwz r3, 0(r4)
/* 0000FA90 D0030014 */ stfs f0, 0x14(r3)
/* 0000FA94 4BFF06C9 */ bl func_8008B0AC
/* 0000FA98 3C600000 */ lis r3, motSkeleton@ha
/* 0000FA9C 3BA30000 */ addi r29, r3, motSkeleton@l
/* 0000FAA0 807D0000 */ lwz r3, 0(r29)
/* 0000FAA4 3C800000 */ lis r4, __OSCurrHeap@ha
/* 0000FAA8 38A40000 */ addi r5, r4, __OSCurrHeap@l
/* 0000FAAC 80830004 */ lwz r4, 4(r3)
/* 0000FAB0 80650000 */ lwz r3, 0(r5)
/* 0000FAB4 38040001 */ addi r0, r4, 1
/* 0000FAB8 5404103A */ slwi r4, r0, 2
/* 0000FABC 4BFF06A1 */ bl OSAllocFromHeap
/* 0000FAC0 38A00000 */ li r5, 0
/* 0000FAC4 907F0080 */ stw r3, 0x80(r31)
/* 0000FAC8 38C50000 */ addi r6, r5, 0
/* 0000FACC 38E50000 */ addi r7, r5, 0
/* 0000FAD0 48000024 */ b lbl_0000FAF4
lbl_0000FAD4:
/* 0000FAD4 80830000 */ lwz r4, 0(r3)
/* 0000FAD8 38060014 */ addi r0, r6, 0x14
/* 0000FADC 807F0080 */ lwz r3, 0x80(r31)
/* 0000FAE0 38C60018 */ addi r6, r6, 0x18
/* 0000FAE4 7C04002E */ lwzx r0, r4, r0
/* 0000FAE8 38A50001 */ addi r5, r5, 1
/* 0000FAEC 7C03392E */ stwx r0, r3, r7
/* 0000FAF0 38E70004 */ addi r7, r7, 4
lbl_0000FAF4:
/* 0000FAF4 807D0000 */ lwz r3, 0(r29)
/* 0000FAF8 80030004 */ lwz r0, 4(r3)
/* 0000FAFC 7C050040 */ cmplw r5, r0
/* 0000FB00 4180FFD4 */ blt lbl_0000FAD4
/* 0000FB04 809F0080 */ lwz r4, 0x80(r31)
/* 0000FB08 3C600000 */ lis r3, motSkeleton@ha
/* 0000FB0C 54A0103A */ slwi r0, r5, 2
/* 0000FB10 3BC00000 */ li r30, 0
/* 0000FB14 7FC4012E */ stwx r30, r4, r0
/* 0000FB18 3BA30000 */ addi r29, r3, motSkeleton@l
/* 0000FB1C 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000FB20 809D0000 */ lwz r4, 0(r29)
/* 0000FB24 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000FB28 80630000 */ lwz r3, 0(r3)
/* 0000FB2C 8084000C */ lwz r4, 0xc(r4)
/* 0000FB30 38040001 */ addi r0, r4, 1
/* 0000FB34 5404103A */ slwi r4, r0, 2
/* 0000FB38 4BFF0625 */ bl OSAllocFromHeap
/* 0000FB3C 907F0084 */ stw r3, 0x84(r31)
/* 0000FB40 38BE0000 */ addi r5, r30, 0
/* 0000FB44 38DE0000 */ addi r6, r30, 0
/* 0000FB48 48000020 */ b lbl_0000FB68
lbl_0000FB4C:
/* 0000FB4C 80830008 */ lwz r4, 8(r3)
/* 0000FB50 3BDE0001 */ addi r30, r30, 1
/* 0000FB54 807F0084 */ lwz r3, 0x84(r31)
/* 0000FB58 7C04282E */ lwzx r0, r4, r5
/* 0000FB5C 38A5001C */ addi r5, r5, 0x1c
/* 0000FB60 7C03312E */ stwx r0, r3, r6
/* 0000FB64 38C60004 */ addi r6, r6, 4
lbl_0000FB68:
/* 0000FB68 807D0000 */ lwz r3, 0(r29)
/* 0000FB6C 8003000C */ lwz r0, 0xc(r3)
/* 0000FB70 7C1E0040 */ cmplw r30, r0
/* 0000FB74 4180FFD8 */ blt lbl_0000FB4C
/* 0000FB78 807F0084 */ lwz r3, 0x84(r31)
/* 0000FB7C 57C0103A */ slwi r0, r30, 2
/* 0000FB80 38800000 */ li r4, 0
/* 0000FB84 7C83012E */ stwx r4, r3, r0
/* 0000FB88 4BFFDE75 */ bl lbl_0000D9FC
/* 0000FB8C 80010024 */ lwz r0, 0x24(r1)
/* 0000FB90 83E1001C */ lwz r31, 0x1c(r1)
/* 0000FB94 83C10018 */ lwz r30, 0x18(r1)
/* 0000FB98 7C0803A6 */ mtlr r0
/* 0000FB9C 83A10014 */ lwz r29, 0x14(r1)
/* 0000FBA0 38210020 */ addi r1, r1, 0x20
/* 0000FBA4 4E800020 */ blr 
lbl_0000FBA8:
/* 0000FBA8 7C0802A6 */ mflr r0
/* 0000FBAC 3C600000 */ lis r3, controllerInfo@ha
/* 0000FBB0 90010004 */ stw r0, 4(r1)
/* 0000FBB4 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000FBB8 93E10034 */ stw r31, 0x34(r1)
/* 0000FBBC 93C10030 */ stw r30, 0x30(r1)
/* 0000FBC0 93A1002C */ stw r29, 0x2c(r1)
/* 0000FBC4 3BA30000 */ addi r29, r3, controllerInfo@l
/* 0000FBC8 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000FBCC A09D0018 */ lhz r4, 0x18(r29)
/* 0000FBD0 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000FBD4 3BDD0018 */ addi r30, r29, 0x18
/* 0000FBD8 548005EE */ rlwinm r0, r4, 0, 0x17, 0x17
/* 0000FBDC 901F0054 */ stw r0, 0x54(r31)
/* 0000FBE0 548005AC */ rlwinm r0, r4, 0, 0x16, 0x16
/* 0000FBE4 901F0058 */ stw r0, 0x58(r31)
/* 0000FBE8 A07D0000 */ lhz r3, 0(r29)
/* 0000FBEC 54600528 */ rlwinm r0, r3, 0, 0x14, 0x14
/* 0000FBF0 901F005C */ stw r0, 0x5c(r31)
/* 0000FBF4 5460056A */ rlwinm r0, r3, 0, 0x15, 0x15
/* 0000FBF8 901F0060 */ stw r0, 0x60(r31)
/* 0000FBFC 4BFFDC49 */ bl lbl_0000D844
/* 0000FC00 4BFF055D */ bl mathutil_mtxA_from_identity
/* 0000FC04 881D0004 */ lbz r0, 4(r29)
/* 0000FC08 3C600000 */ lis r3, lbl_00010278@ha
/* 0000FC0C C8230000 */ lfd f1, lbl_00010278@l(r3)
/* 0000FC10 7C000774 */ extsb r0, r0
/* 0000FC14 C05F000C */ lfs f2, 0xc(r31)
/* 0000FC18 1C00000A */ mulli r0, r0, 0xa
/* 0000FC1C 6C008000 */ xoris r0, r0, 0x8000
/* 0000FC20 90010024 */ stw r0, 0x24(r1)
/* 0000FC24 3C004330 */ lis r0, 0x4330
/* 0000FC28 90010020 */ stw r0, 0x20(r1)
/* 0000FC2C C8010020 */ lfd f0, 0x20(r1)
/* 0000FC30 EC000828 */ fsubs f0, f0, f1
/* 0000FC34 EC02002A */ fadds f0, f2, f0
/* 0000FC38 D01F000C */ stfs f0, 0xc(r31)
/* 0000FC3C C01F000C */ lfs f0, 0xc(r31)
/* 0000FC40 FC00001E */ fctiwz f0, f0
/* 0000FC44 D8010018 */ stfd f0, 0x18(r1)
/* 0000FC48 8061001C */ lwz r3, 0x1c(r1)
/* 0000FC4C 4BFF0511 */ bl mathutil_mtxA_rotate_y
/* 0000FC50 807F0004 */ lwz r3, 4(r31)
/* 0000FC54 38630060 */ addi r3, r3, 0x60
/* 0000FC58 4BFF0505 */ bl mathutil_mtxA_to_quat
/* 0000FC5C 80BF00AC */ lwz r5, 0xac(r31)
/* 0000FC60 38600003 */ li r3, 3
/* 0000FC64 809F0004 */ lwz r4, 4(r31)
/* 0000FC68 38000002 */ li r0, 2
/* 0000FC6C C0050018 */ lfs f0, 0x18(r5)
/* 0000FC70 80840000 */ lwz r4, 0(r4)
/* 0000FC74 D004003C */ stfs f0, 0x3c(r4)
/* 0000FC78 907F009C */ stw r3, 0x9c(r31)
/* 0000FC7C 901F00A0 */ stw r0, 0xa0(r31)
/* 0000FC80 819F0088 */ lwz r12, 0x88(r31)
/* 0000FC84 280C0000 */ cmplwi r12, 0
/* 0000FC88 41820010 */ beq lbl_0000FC98
/* 0000FC8C 7D8803A6 */ mtlr r12
/* 0000FC90 4E800021 */ blrl 
/* 0000FC94 4800000C */ b lbl_0000FCA0
lbl_0000FC98:
/* 0000FC98 38000000 */ li r0, 0
/* 0000FC9C 901F0078 */ stw r0, 0x78(r31)
lbl_0000FCA0:
/* 0000FCA0 4BFFD721 */ bl lbl_0000D3C0
/* 0000FCA4 A07E0000 */ lhz r3, 0(r30)
/* 0000FCA8 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000FCAC 41820028 */ beq lbl_0000FCD4
/* 0000FCB0 809F0004 */ lwz r4, 4(r31)
/* 0000FCB4 806400B4 */ lwz r3, 0xb4(r4)
/* 0000FCB8 3403FFFF */ addic. r0, r3, -1  ;# fixed addi
/* 0000FCBC 900400B4 */ stw r0, 0xb4(r4)
/* 0000FCC0 40800040 */ bge lbl_0000FD00
/* 0000FCC4 807F0004 */ lwz r3, 4(r31)
/* 0000FCC8 38000003 */ li r0, 3
/* 0000FCCC 900300B4 */ stw r0, 0xb4(r3)
/* 0000FCD0 48000030 */ b lbl_0000FD00
lbl_0000FCD4:
/* 0000FCD4 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0000FCD8 41820028 */ beq lbl_0000FD00
/* 0000FCDC 809F0004 */ lwz r4, 4(r31)
/* 0000FCE0 806400B4 */ lwz r3, 0xb4(r4)
/* 0000FCE4 38030001 */ addi r0, r3, 1
/* 0000FCE8 2C000003 */ cmpwi r0, 3
/* 0000FCEC 900400B4 */ stw r0, 0xb4(r4)
/* 0000FCF0 40810010 */ ble lbl_0000FD00
/* 0000FCF4 807F0004 */ lwz r3, 4(r31)
/* 0000FCF8 38000000 */ li r0, 0
/* 0000FCFC 900300B4 */ stw r0, 0xb4(r3)
lbl_0000FD00:
/* 0000FD00 807F0004 */ lwz r3, 4(r31)
/* 0000FD04 4BFF0459 */ bl func_8008C4A8
/* 0000FD08 801F0064 */ lwz r0, 0x64(r31)
/* 0000FD0C 3C800000 */ lis r4, lbl_000156F0@ha
/* 0000FD10 38600000 */ li r3, 0
/* 0000FD14 54051838 */ slwi r5, r0, 3
/* 0000FD18 38040000 */ addi r0, r4, lbl_000156F0@l
/* 0000FD1C 7C802A14 */ add r4, r0, r5
/* 0000FD20 81840000 */ lwz r12, 0(r4)
/* 0000FD24 38830000 */ addi r4, r3, 0
/* 0000FD28 280C0000 */ cmplwi r12, 0
/* 0000FD2C 41820014 */ beq lbl_0000FD40
/* 0000FD30 801F0088 */ lwz r0, 0x88(r31)
/* 0000FD34 28000000 */ cmplwi r0, 0
/* 0000FD38 40820008 */ bne lbl_0000FD40
/* 0000FD3C 38800001 */ li r4, 1
lbl_0000FD40:
/* 0000FD40 2C040000 */ cmpwi r4, 0
/* 0000FD44 4182001C */ beq lbl_0000FD60
/* 0000FD48 809F0054 */ lwz r4, 0x54(r31)
/* 0000FD4C 38000000 */ li r0, 0
/* 0000FD50 2C040000 */ cmpwi r4, 0
/* 0000FD54 901F0054 */ stw r0, 0x54(r31)
/* 0000FD58 41820008 */ beq lbl_0000FD60
/* 0000FD5C 38600001 */ li r3, 1
lbl_0000FD60:
/* 0000FD60 7D8803A6 */ mtlr r12
/* 0000FD64 4E800021 */ blrl 
/* 0000FD68 4BFFFA55 */ bl lbl_0000F7BC
/* 0000FD6C 8001003C */ lwz r0, 0x3c(r1)
/* 0000FD70 807F0068 */ lwz r3, 0x68(r31)
/* 0000FD74 83E10034 */ lwz r31, 0x34(r1)
/* 0000FD78 7C0803A6 */ mtlr r0
/* 0000FD7C 83C10030 */ lwz r30, 0x30(r1)
/* 0000FD80 83A1002C */ lwz r29, 0x2c(r1)
/* 0000FD84 38210038 */ addi r1, r1, 0x38
/* 0000FD88 4E800020 */ blr 
lbl_0000FD8C:
/* 0000FD8C 7C0802A6 */ mflr r0
/* 0000FD90 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000FD94 90010004 */ stw r0, 4(r1)
/* 0000FD98 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000FD9C 93E1000C */ stw r31, 0xc(r1)
/* 0000FDA0 93C10008 */ stw r30, 8(r1)
/* 0000FDA4 3BC30000 */ addi r30, r3, lbl_10003BF8@l
/* 0000FDA8 3C600000 */ lis r3, lbl_000101E0@ha
/* 0000FDAC 801E00BC */ lwz r0, 0xbc(r30)
/* 0000FDB0 3BE30000 */ addi r31, r3, lbl_000101E0@l
/* 0000FDB4 2C000003 */ cmpwi r0, 3
/* 0000FDB8 40820008 */ bne lbl_0000FDC0
/* 0000FDBC 4BFFE62D */ bl lbl_0000E3E8
lbl_0000FDC0:
/* 0000FDC0 3C600000 */ lis r3, controllerInfo@ha
/* 0000FDC4 38630000 */ addi r3, r3, controllerInfo@l
/* 0000FDC8 A0030018 */ lhz r0, 0x18(r3)
/* 0000FDCC 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000FDD0 41820010 */ beq lbl_0000FDE0
/* 0000FDD4 801E00C8 */ lwz r0, 0xc8(r30)
/* 0000FDD8 68000001 */ xori r0, r0, 1
/* 0000FDDC 901E00C8 */ stw r0, 0xc8(r30)
lbl_0000FDE0:
/* 0000FDE0 801E00C8 */ lwz r0, 0xc8(r30)
/* 0000FDE4 2C000000 */ cmpwi r0, 0
/* 0000FDE8 4182006C */ beq lbl_0000FE54
/* 0000FDEC 4BFF0371 */ bl mathutil_mtxA_push
/* 0000FDF0 4BFF036D */ bl mathutil_mtxA_from_mtxB
/* 0000FDF4 C03F000C */ lfs f1, 0xc(r31)
/* 0000FDF8 C05F00C8 */ lfs f2, 0xc8(r31)
/* 0000FDFC FC600890 */ fmr f3, f1
/* 0000FE00 4BFF035D */ bl mathutil_mtxA_translate_xyz
/* 0000FE04 A81E00CC */ lha r0, 0xcc(r30)
/* 0000FE08 7C031670 */ srawi r3, r0, 2
/* 0000FE0C 7C630194 */ addze r3, r3
/* 0000FE10 4BFF034D */ bl mathutil_mtxA_rotate_z
/* 0000FE14 A87E00CC */ lha r3, 0xcc(r30)
/* 0000FE18 4BFF0345 */ bl mathutil_mtxA_rotate_x
/* 0000FE1C A89E00CC */ lha r4, 0xcc(r30)
/* 0000FE20 3C600000 */ lis r3, commonGma@ha
/* 0000FE24 3BE30000 */ addi r31, r3, commonGma@l
/* 0000FE28 38040020 */ addi r0, r4, 0x20
/* 0000FE2C B01E00CC */ sth r0, 0xcc(r30)
/* 0000FE30 807F0000 */ lwz r3, 0(r31)
/* 0000FE34 80630008 */ lwz r3, 8(r3)
/* 0000FE38 80630090 */ lwz r3, 0x90(r3)
/* 0000FE3C 4BFF0321 */ bl g_avdisp_draw_model_1
/* 0000FE40 807F0000 */ lwz r3, 0(r31)
/* 0000FE44 80630008 */ lwz r3, 8(r3)
/* 0000FE48 806300B0 */ lwz r3, 0xb0(r3)
/* 0000FE4C 4BFF0311 */ bl g_avdisp_draw_model_1
/* 0000FE50 4BFF030D */ bl mathutil_mtxA_pop
lbl_0000FE54:
/* 0000FE54 80010014 */ lwz r0, 0x14(r1)
/* 0000FE58 83E1000C */ lwz r31, 0xc(r1)
/* 0000FE5C 83C10008 */ lwz r30, 8(r1)
/* 0000FE60 7C0803A6 */ mtlr r0
/* 0000FE64 38210010 */ addi r1, r1, 0x10
/* 0000FE68 4E800020 */ blr 

# 2
.section .ctors
    # 0xFE6C
#    .4byte 0x00000000

# 3
.section .dtors
    # 0xFE70
#    .4byte 0x00000000

# 4
.section .rodata
.if 0
lbl_0000FE78:
    # 0xFE78
    .4byte 0x405FC000
.endif
    .4byte 0x00000000
    .4byte 0x3FE96041
    .4byte 0x89374BC7
    .4byte 0x3FF0CCCC
    .4byte 0xCCCCCCCD
    .4byte 0x40C00000
    .4byte 0x00000000
    .4byte 0x4061110E
    .4byte 0x56041893
    .4byte 0x3FED0624
    .4byte 0xDD2F1AA0
    .4byte 0x3FE7E76C
    .4byte 0x8B439581
    .4byte 0x3FEBA5E3
    .4byte 0x53F7CED9
    .4byte 0x40700000
    .4byte 0x00000000
    .4byte 0x400BAC08
    .4byte 0x3126E979
lbl_0000FEC8:
    # 0xFEC8
    .4byte 0x43300000
    .4byte 0x00000000
lbl_0000FED0:
    # 0xFED0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x00000000
    .4byte 0x426FFC40
    .4byte 0x3FAAAAAB
    .4byte 0x3DCCCCCD
    .4byte 0x469C4000
    .4byte 0xBF2646E2
    .4byte 0x3F000000
    .4byte 0x3F5DB3D8
    .4byte 0xBF58C69A
    .4byte 0x3F2294F3
lbl_0000FF00:
    # 0xFF00
    .4byte 0xBF800000
    .4byte 0x3F58C69A
    .4byte 0xBF2294F3
    .4byte 0xFFFFFFFF
    .4byte 0x43B40000
    .4byte 0x41200000
    .4byte 0xC1000000
    .4byte 0x40200000
    .4byte 0x3FA00000
    .4byte 0xC1900000
    .4byte 0x3F400000
    .4byte 0x41240000
    .4byte 0x3F800000
    .4byte 0x3E000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0x437F0000
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x41000000
    .4byte 0x41800000
    .4byte 0x43960000
    .4byte 0x43F00000
    .4byte 0x43480000
lbl_0000FF78:
    # 0xFF78
    .4byte 0x3F333333
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3EC28F5C
    .4byte 0x00000000
    .4byte 0x3FC00000
    .4byte 0x3E99999A
    .4byte lbl_000130A4
    .4byte lbl_000130B4
    .4byte lbl_000130BC
    .4byte lbl_000130C4
    .4byte 0x3F4A36E2
    .4byte 0xEB1C432D
    .4byte 0x3F50624D
    .4byte 0xD2F1A9FC
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x3F947AE1
    .4byte 0x47AE147B
    .4byte 0x3CF5C28F
    .4byte 0x3CA3D70A
    .4byte 0x40000000
    .4byte 0x41700000
    .4byte 0x41A00000
    .4byte 0xFFFFFF32
    .4byte 0x64646432
    .4byte 0x3ECCCCCD
    .4byte 0xFFFFFFFF
    .4byte 0x43160000
    .4byte 0x42B40000
    .4byte 0x437A0000
    .4byte 0x3F7FBE77
    .4byte 0xFFFFFF32
    .4byte 0x64646432
    .4byte 0xFF0000FF
    .4byte 0x00FF00FF
    .4byte 0x0000FFFF
    .4byte 0x3F99999A
    .4byte 0xC1200000
    .4byte 0x3F4CCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3D4CCCCD
    .4byte 0x40A00000
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x3FE028F5
    .4byte 0xC28F5C29
    .4byte 0x40840000
    .4byte 0x00000000
    .4byte 0x407C0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43C80000
lbl_00010070:
    # 0x10070
    .4byte 0x40838000
    .4byte 0x00000000
lbl_00010078:
    # 0x10078
    .4byte 0x407D0000
    .4byte 0x00000000
lbl_00010080:
    # 0x10080
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xBF800000
    .4byte 0x3F800000
    .4byte 0x42960000
    .4byte 0x3F818000
    .4byte 0x40B57B24
    .4byte 0x3DCCCCCD
    .4byte 0x47C35000
    .4byte 0x43800000
lbl_000100A8:
    # 0x100A8
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0xFFFFFFFF
    .4byte 0x3F8E38E4
    .4byte 0xBD638E40
    .4byte 0xBF000000
    .4byte 0x3F000000
    .4byte 0x3D000000
    .4byte 0x3E000000
    .4byte 0x437F0000
    .4byte 0x3D800000
    .4byte 0x3D924925
lbl_000100D8:
    # 0x100D8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0xFFFFFFFF
    .4byte 0x43B40000
    .4byte 0xC2C80000
    .4byte 0xC0A00000
    .4byte 0x40A00000
    .4byte 0x41A00000
    .4byte 0x40000000
    .4byte 0x3BA3D70A
    .4byte 0xFFFFFFFF
    .4byte 0x42000000
    .4byte 0x42DF0000
    .4byte 0x3E800000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
lbl_00010118:
    # 0x10118
    .4byte 0x41200000
    .4byte 0x42C80000
    .4byte 0x40A00000
lbl_00010124:
    # 0x10124
    .4byte 0x3C23D70A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x469C4000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3ACCCCCD
    .4byte 0x3B088889
lbl_00010148:
    # 0x10148
    .4byte 0x43300000
    .4byte 0x80000000
lbl_00010150:
    # 0x10150
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43800000
    .4byte 0x3F800000
    .4byte 0x426FFC40
    .4byte 0x3FAAAAAB
    .4byte 0x3DCCCCCD
    .4byte 0x469C4000
lbl_00010170:
    # 0x10170
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0xBF2646E2
    .4byte 0x3F000000
    .4byte 0x3F5DB3D8
    .4byte 0x3E800000
    .4byte 0xBF000000
    .4byte 0xBF4511A3
    .4byte 0x3F13CD3A
    .4byte 0xBF800000
    .4byte 0x3F4511A3
    .4byte 0x41200000
    .4byte 0xBF13CD3A
    .4byte 0x44200000
    .4byte 0x47000000
    .4byte 0x43F00000
    .4byte 0x41800000
    .4byte 0x40000000
lbl_000101B8:
    # 0x101B8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3F7EB852
    .4byte 0xBC83126F
    .4byte 0xC3700000
    .4byte 0x43960000
    .4byte 0x43700000
    .4byte 0x40800000
    .4byte 0xC0800000
    .4byte 0xC3CFD89A
lbl_000101E0:
    # 0x101E0
    .4byte 0x46800000
    .4byte 0x3ECCCCCD
    .4byte 0x3EC28F5C
lbl_000101EC:
    # 0x101EC
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x41200000
    .4byte 0x42C80000
lbl_000101FC:
    # 0x101FC
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x00000010
    .4byte 0x00000008
    .4byte 0x00000020
    .4byte 0x00000006
    .4byte 0x00000009
    .4byte 0x00000010
    .4byte 0x00000018
    .4byte 0x00000004
    .4byte 0x00000006
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte 0x00000004
    .4byte 0x00000010
    .4byte 0x00000012
    .4byte 0x0000000A
    .4byte 0x0000000C
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0xBE99999A
    .4byte 0xBF800000
    .4byte 0x3FC00000
    .4byte 0x3E4CCCCD
    .4byte 0x43360B61
    .4byte 0x3DF5C28F
    .4byte 0xBDF5C28F
lbl_00010278:
    # 0x10278
    .4byte 0x43300000
    .4byte 0x80000000
lbl_00010280:
    # 0x10280
    .4byte 0x3F800000
    .4byte 0xC61C4000
    .4byte 0x461C4000
    .4byte 0x469C4000
    .4byte 0x3E99999A
    .4byte 0x00000000
lbl_00010298:
    # 0x10298
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3F99999A
    .4byte 0x3F000000

# 5
.section .data
.if 0
lbl_000102B0:
    # 0x102B0
    .4byte lbl_00000270
.endif
    .4byte lbl_00000308
    .4byte lbl_00000A8C
    .4byte lbl_00000AAC
    .4byte lbl_000007AC
    .4byte lbl_00000804
    .4byte lbl_00001008
    .4byte lbl_000010C4
    .4byte lbl_00001F54
    .4byte lbl_00002048
    .4byte lbl_000024FC
    .4byte lbl_0000253C
    .4byte lbl_0000255C
    .4byte lbl_00002590
    .4byte lbl_000025B0
    .4byte lbl_00002664
    .4byte lbl_00002684
    .4byte lbl_00002790
    .4byte lbl_00002990
    .4byte lbl_00002A30
    .4byte lbl_00003774
    .4byte lbl_000037B0
    .4byte func_80049FF0
    .4byte func_8004A0C8
    .4byte lbl_000040B8
    .4byte lbl_000041C4
    .4byte lbl_0000500C
    .4byte lbl_000050A4
    .4byte lbl_000051C4
    .4byte lbl_00006A70
    .4byte lbl_00006B98
    .4byte lbl_00007718
    .4byte lbl_00007B3C
    .4byte lbl_00007EE0
    .4byte lbl_00007F1C
    .4byte lbl_000081BC
    .4byte lbl_00008350
    .4byte lbl_00008B68
    .4byte lbl_00008BBC
    .4byte 0x00000000
lbl_00010350:
    # 0x10350
    .asciz "TEST MODE LOADED\n"
    .balign 4
lbl_00010364:
    # 0x10364
    .asciz "TEST MODE PURGED\n"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "test_mode.c"
    .4byte 0x0A000000
lbl_000103F4:
    # 0x103F4
    .asciz "sub_mode: error %d in Test"
    .balign 4
lbl_00010410:
    # 0x10410
    .asciz "MODEL"
    .balign 4
lbl_00010418:
    # 0x10418
    .asciz "MODEL TEST"
    .balign 4
lbl_00010424:
    # 0x10424
    .asciz "nlObjPut TEST"
    .balign 4
lbl_00010434:
    # 0x10434
    .asciz "EFC MDL TEST"
    .balign 4
lbl_00010444:
    # 0x10444
    .asciz "PATTERN TEST"
    .balign 4
lbl_00010454:
    # 0x10454
    .asciz "PREREND TEST"
    .balign 4
lbl_00010464:
    # 0x10464
    .asciz "MOTION"
    .balign 4
lbl_0001046C:
    # 0x1046C
    .asciz "MOTION TEST"
lbl_00010478:
    # 0x10478
    .asciz "BITMAP"
    .balign 4
lbl_00010480:
    # 0x10480
    .asciz "BITMAP TEST"
lbl_0001048C:
    # 0x1048C
    .asciz "FONT TEST"
    .balign 4
lbl_00010498:
    # 0x10498
    .asciz "ROMFONT TEST"
    .balign 4
lbl_000104A8:
    # 0x104A8
    .asciz "PREVIEW TEST"
    .balign 4
lbl_000104B8:
    # 0x104B8
    .asciz "INPUT"
    .balign 4
lbl_000104C0:
    # 0x104C0
    .asciz "SOUND"
    .balign 4
lbl_000104C8:
    # 0x104C8
    .asciz "SOUND TEST"
    .balign 4
lbl_000104D4:
    # 0x104D4
    .asciz "REPLAY"
    .balign 4
lbl_000104DC:
    # 0x104DC
    .asciz "REPLAY TEST"
lbl_000104E8:
    # 0x104E8
    .4byte 0x45544300
lbl_000104EC:
    # 0x104EC
    .asciz "BLUR TEST"
    .balign 4
lbl_000104F8:
    # 0x104F8
    .asciz "SHADOW TEST"
lbl_00010504:
    # 0x10504
    .asciz "FOCUS TEST"
    .balign 4
lbl_00010510:
    # 0x10510
    .asciz "INDIRECT TEST"
    .balign 4
lbl_00010520:
    # 0x10520
    .asciz "DIP SWITCH"
    .balign 4
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000003
    .4byte lbl_00010410
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_00010418
    .4byte 0x0000007C
    .4byte 0x00000000
    .4byte lbl_00010424
    .4byte 0x0000006F
    .4byte 0x00000000
    .4byte lbl_00010434
    .4byte 0x0000007A
    .4byte 0x00000000
    .4byte lbl_00010444
    .4byte 0x0000007E
    .4byte 0x00000000
    .4byte lbl_00010454
    .4byte 0x00000082
    .4byte 0x00000003
    .4byte lbl_00010464
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_0001046C
    .4byte 0x00000077
    .4byte 0x00000003
    .4byte lbl_00010478
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_00010480
    .4byte 0x00000071
    .4byte 0x00000000
    .4byte lbl_0001048C
    .4byte 0x00000073
    .4byte 0x00000000
    .4byte lbl_00010498
    .4byte 0x00000080
    .4byte 0x00000000
    .4byte lbl_000104A8
    .4byte 0x00000084
    .4byte 0x00000003
    .4byte lbl_000104B8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_000104B8
    .4byte 0x00000061
    .4byte 0x00000003
    .4byte lbl_000104C0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_000104C8
    .4byte 0x00000065
    .4byte 0x00000003
    .4byte lbl_000104D4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_000104DC
    .4byte 0x00000075
    .4byte 0x00000003
    .4byte lbl_000104E8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_000104EC
    .4byte 0x00000067
    .4byte 0x00000000
    .4byte lbl_000104F8
    .4byte 0x00000069
    .4byte 0x00000000
    .4byte lbl_00010504
    .4byte 0x0000006B
    .4byte 0x00000000
    .4byte lbl_00010510
    .4byte 0x0000006D
    .4byte 0x00000000
    .4byte lbl_00010520
    .4byte 0x00000063
    .asciz "TEST MODE\n\n"
    .4byte 0x25730000
    .asciz "STAGE NUM: %3d"
    .balign 4
    .asciz "BACKGROUND: [%d]%s          "
    .balign 4
    .4byte 0x1C000000
lbl_000106B4:
    # 0x106B4
    .asciz "DIP DEST\n"
    .balign 4
    .4byte 0x204F4E00
    .4byte 0x4F464600
    .asciz "%-15s  %s"
    .balign 4
    .asciz "Input Test"
    .balign 4
    .asciz "PAD           [%d]\n"
    .4byte 0x4F4E0000
    .asciz "BUTTON_LEFT   %3s\n"
    .balign 4
    .asciz "BUTTON_RIGHT  %3s\n"
    .balign 4
    .asciz "BUTTON_DOWN   %3s\n"
    .balign 4
    .asciz "BUTTON_UP     %3s\n"
    .balign 4
    .asciz "TRIGGER_Z     %3s\n"
    .balign 4
    .asciz "TRIGGER_L     %3s\n"
    .balign 4
    .asciz "TRIGGER_R     %3s\n"
    .balign 4
    .asciz "BUTTON_A      %3s\n"
    .balign 4
    .asciz "BUTTON_B      %3s\n"
    .balign 4
    .asciz "BUTTON_X      %3s\n"
    .balign 4
    .asciz "BUTTON_Y      %3s\n"
    .balign 4
    .asciz "BUTTON_MENU   %3s\n"
    .balign 4
    .asciz "stickX       %4d\n"
    .balign 4
    .asciz "stickY       %4d\n"
    .balign 4
    .asciz "substickX    %4d\n"
    .balign 4
    .asciz "substickY    %4d\n"
    .balign 4
    .asciz "triggerLeft  %4d\n"
    .balign 4
    .asciz "triggerRight %4d\n"
    .balign 4
    .asciz "analogA      %4d\n"
    .balign 4
    .asciz "analogB      %4d\n"
    .balign 4
    .asciz "err          %4d\n"
    .balign 4
    .asciz "APINPUT\n"
    .balign 4
    .asciz "STICK_L       %3s\n"
    .balign 4
    .asciz "STICK_R       %3s\n"
    .balign 4
    .asciz "STICK_D       %3s\n"
    .balign 4
    .asciz "STICK_U       %3s\n"
    .balign 4
    .asciz "SUBSTICK_L    %3s\n"
    .balign 4
    .asciz "SUBSTICK_R    %3s\n"
    .balign 4
    .asciz "SUBSTICK_D    %3s\n"
    .balign 4
    .asciz "SUBSTICK_U    %3s\n"
    .balign 4
    .asciz "PAD CHANGE:\n"
    .balign 4
    .asciz "  TRIGGER_L\n"
    .balign 4
    .asciz "      and\n"
    .balign 4
    .asciz "    BUTTON_LEFT\n"
    .balign 4
    .asciz "        or\n"
    .asciz "    BUTTON_RIGHT\n"
    .balign 4
lbl_000109A8:
    # 0x109A8
    .4byte lbl_00001198
    .4byte lbl_00001334
    .4byte lbl_00001694
    .4byte lbl_000017B8
    .4byte lbl_000018E4
    .4byte lbl_000019DC
    .4byte lbl_00001A00
lbl_000109C4:
    # 0x109C4
    .asciz "MONAURAL"
    .balign 4
lbl_000109D0:
    # 0x109D0
    .asciz "STEREO  "
    .balign 4
    .4byte lbl_000109C4
    .4byte lbl_000109D0
lbl_000109E4:
    # 0x109E4
    .asciz "STOP"
    .balign 4
lbl_000109EC:
    # 0x109EC
    .4byte 0x52554E00
lbl_000109F0:
    # 0x109F0
    .asciz "PAUSE"
    .balign 4
lbl_000109F8:
    # 0x109F8
    .asciz "BUSY"
    .balign 4
    .4byte lbl_000109E4
    .4byte lbl_000109EC
    .4byte lbl_000109F0
    .4byte lbl_000109F8
    .asciz "PROJECT [ "
    .balign 4
    .4byte 0x25642000
    .4byte 0x5D0A0000
    .asciz "STACK %d [ "
    .asciz "%2d "
    .balign 4
    .4byte 0x5D0A0A00
    .asciz " RAM use:%08X\n"
    .balign 4
    .asciz "ARAM use:%08X / %08X\n"
    .balign 4
    .asciz "GRP :%2d %s\n"
    .balign 4
    .asciz "FX  :%3d %s\n"
    .balign 4
    .asciz "ICS :%2d\n"
    .balign 4
    .asciz "SONG:%2d\n"
    .balign 4
    .asciz "DVD :%2d %s\n"
    .balign 4
    .asciz "STRM:\n"
    .balign 4
    .asciz "OPTION:\n"
    .balign 4
    .asciz "vol:%3d\n"
    .balign 4
    .asciz "pan:%3d %3d\n"
    .balign 4
    .asciz "pit:%04X\n"
    .balign 4
    .asciz "dop:%04X\n"
    .balign 4
    .asciz "rev:%3d\n"
    .balign 4
    .asciz "cho:%3d\n"
    .balign 4
    .asciz "\nA:req B:off  Y:dest  X: effect sw"
    .balign 4
    .asciz "ctr:%3d\n"
    .balign 4
    .asciz "spd:%03X\n"
    .balign 4
    .asciz "TRUE"
    .balign 4
    .asciz "FALSE"
    .balign 4
    .asciz "OFF  :%s\n"
    .balign 4
    .asciz "output :%s\n"
    .asciz "se  vol:%3d\n"
    .balign 4
    .asciz "bgm vol:%3d\n"
    .balign 4
lbl_00010B90:
    # 0x10B90
    .asciz "GX_TF_RGBA8"
lbl_00010B9C:
    # 0x10B9C
    .asciz "GX_TF_I4"
    .balign 4
lbl_00010BA8:
    # 0x10BA8
    .asciz "GX_TF_I8"
    .balign 4
lbl_00010BB4:
    # 0x10BB4
    .asciz "GX_TF_IA4"
    .balign 4
lbl_00010BC0:
    # 0x10BC0
    .asciz "GX_TF_IA8"
    .balign 4
lbl_00010BCC:
    # 0x10BCC
    .asciz "GX_TF_RGB565"
    .balign 4
lbl_00010BDC:
    # 0x10BDC
    .asciz "GX_TF_RGB5A3"
    .balign 4
lbl_00010BEC:
    # 0x10BEC
    .4byte 0x00000006
    .4byte lbl_00010B90
    .4byte 0x00000000
    .4byte lbl_00010B9C
    .4byte 0x00000001
    .4byte lbl_00010BA8
    .4byte 0x00000002
    .4byte lbl_00010BB4
    .4byte 0x00000003
    .4byte lbl_00010BC0
    .4byte 0x00000004
    .4byte lbl_00010BCC
    .4byte 0x00000005
    .4byte lbl_00010BDC
    .asciz "BLUR TEST\n"
    .balign 4
    .asciz "FORMAT : %s\n"
    .balign 4
    .asciz "ALPHA  : %d\n"
    .balign 4
    .asciz "SHADOW TEST\n"
    .balign 4
lbl_00010C60:
    # 0x10C60
    .asciz "common"
    .balign 4
lbl_00010C68:
    # 0x10C68
    .asciz "init/common_p.lz"
    .balign 4
lbl_00010C7C:
    # 0x10C7C
    .asciz "init/common.lz"
    .balign 4
lbl_00010C8C:
    # 0x10C8C
    .asciz "face"
    .balign 4
lbl_00010C94:
    # 0x10C94
    .asciz "init/face_p.lz"
    .balign 4
lbl_00010CA4:
    # 0x10CA4
    .asciz "init/face.lz"
    .balign 4
lbl_00010CB4:
    # 0x10CB4
    .4byte 0x73656C00
lbl_00010CB8:
    # 0x10CB8
    .asciz "init/sel_p.lz"
    .balign 4
lbl_00010CC8:
    # 0x10CC8
    .asciz "init/sel.lz"
lbl_00010CD4:
    # 0x10CD4
    .asciz "chara"
    .balign 4
lbl_00010CDC:
    # 0x10CDC
    .asciz "init/chara_p.lz"
lbl_00010CEC:
    # 0x10CEC
    .asciz "init/chara.lz"
    .balign 4
lbl_00010CFC:
    # 0x10CFC
    .asciz "st001"
    .balign 4
lbl_00010D04:
    # 0x10D04
    .asciz "st001/st001_p.lz"
    .balign 4
lbl_00010D18:
    # 0x10D18
    .asciz "st001/st001.lz"
    .balign 4
lbl_00010D28:
    # 0x10D28
    .asciz "st002"
    .balign 4
lbl_00010D30:
    # 0x10D30
    .asciz "st002/st002_p.lz"
    .balign 4
lbl_00010D44:
    # 0x10D44
    .asciz "st002/st002.lz"
    .balign 4
lbl_00010D54:
    # 0x10D54
    .asciz "st003"
    .balign 4
lbl_00010D5C:
    # 0x10D5C
    .asciz "st003/st003_p.lz"
    .balign 4
lbl_00010D70:
    # 0x10D70
    .asciz "st003/st003.lz"
    .balign 4
lbl_00010D80:
    # 0x10D80
    .asciz "st004"
    .balign 4
lbl_00010D88:
    # 0x10D88
    .asciz "st004/st004_p.lz"
    .balign 4
lbl_00010D9C:
    # 0x10D9C
    .asciz "st004/st004.lz"
    .balign 4
lbl_00010DAC:
    # 0x10DAC
    .asciz "st005"
    .balign 4
lbl_00010DB4:
    # 0x10DB4
    .asciz "st005/st005_p.lz"
    .balign 4
lbl_00010DC8:
    # 0x10DC8
    .asciz "st005/st005.lz"
    .balign 4
lbl_00010DD8:
    # 0x10DD8
    .asciz "st006"
    .balign 4
lbl_00010DE0:
    # 0x10DE0
    .asciz "st006/st006_p.lz"
    .balign 4
lbl_00010DF4:
    # 0x10DF4
    .asciz "st006/st006.lz"
    .balign 4
lbl_00010E04:
    # 0x10E04
    .asciz "st007"
    .balign 4
lbl_00010E0C:
    # 0x10E0C
    .asciz "st007/st007_p.lz"
    .balign 4
lbl_00010E20:
    # 0x10E20
    .asciz "st007/st007.lz"
    .balign 4
lbl_00010E30:
    # 0x10E30
    .asciz "st008"
    .balign 4
lbl_00010E38:
    # 0x10E38
    .asciz "st008/st008_p.lz"
    .balign 4
lbl_00010E4C:
    # 0x10E4C
    .asciz "st008/st008.lz"
    .balign 4
lbl_00010E5C:
    # 0x10E5C
    .asciz "st009"
    .balign 4
lbl_00010E64:
    # 0x10E64
    .asciz "st009/st009_p.lz"
    .balign 4
lbl_00010E78:
    # 0x10E78
    .asciz "st009/st009.lz"
    .balign 4
lbl_00010E88:
    # 0x10E88
    .asciz "st010"
    .balign 4
lbl_00010E90:
    # 0x10E90
    .asciz "st010/st010_p.lz"
    .balign 4
lbl_00010EA4:
    # 0x10EA4
    .asciz "st010/st010.lz"
    .balign 4
lbl_00010EB4:
    # 0x10EB4
    .asciz "st011"
    .balign 4
lbl_00010EBC:
    # 0x10EBC
    .asciz "st011/st011_p.lz"
    .balign 4
lbl_00010ED0:
    # 0x10ED0
    .asciz "st011/st011.lz"
    .balign 4
lbl_00010EE0:
    # 0x10EE0
    .asciz "st012"
    .balign 4
lbl_00010EE8:
    # 0x10EE8
    .asciz "st012/st012_p.lz"
    .balign 4
lbl_00010EFC:
    # 0x10EFC
    .asciz "st012/st012.lz"
    .balign 4
lbl_00010F0C:
    # 0x10F0C
    .asciz "st013"
    .balign 4
lbl_00010F14:
    # 0x10F14
    .asciz "st013/st013_p.lz"
    .balign 4
lbl_00010F28:
    # 0x10F28
    .asciz "st013/st013.lz"
    .balign 4
lbl_00010F38:
    # 0x10F38
    .asciz "st014"
    .balign 4
lbl_00010F40:
    # 0x10F40
    .asciz "st014/st014_p.lz"
    .balign 4
lbl_00010F54:
    # 0x10F54
    .asciz "st014/st014.lz"
    .balign 4
lbl_00010F64:
    # 0x10F64
    .asciz "st015"
    .balign 4
lbl_00010F6C:
    # 0x10F6C
    .asciz "st015/st015_p.lz"
    .balign 4
lbl_00010F80:
    # 0x10F80
    .asciz "st015/st015.lz"
    .balign 4
lbl_00010F90:
    # 0x10F90
    .asciz "st016"
    .balign 4
lbl_00010F98:
    # 0x10F98
    .asciz "st016/st016_p.lz"
    .balign 4
lbl_00010FAC:
    # 0x10FAC
    .asciz "st016/st016.lz"
    .balign 4
lbl_00010FBC:
    # 0x10FBC
    .asciz "st017"
    .balign 4
lbl_00010FC4:
    # 0x10FC4
    .asciz "st017/st017_p.lz"
    .balign 4
lbl_00010FD8:
    # 0x10FD8
    .asciz "st017/st017.lz"
    .balign 4
lbl_00010FE8:
    # 0x10FE8
    .asciz "st018"
    .balign 4
lbl_00010FF0:
    # 0x10FF0
    .asciz "st018/st018_p.lz"
    .balign 4
lbl_00011004:
    # 0x11004
    .asciz "st018/st018.lz"
    .balign 4
lbl_00011014:
    # 0x11014
    .asciz "st019"
    .balign 4
lbl_0001101C:
    # 0x1101C
    .asciz "st019/st019_p.lz"
    .balign 4
lbl_00011030:
    # 0x11030
    .asciz "st019/st019.lz"
    .balign 4
lbl_00011040:
    # 0x11040
    .asciz "st020"
    .balign 4
lbl_00011048:
    # 0x11048
    .asciz "st020/st020_p.lz"
    .balign 4
lbl_0001105C:
    # 0x1105C
    .asciz "st020/st020.lz"
    .balign 4
lbl_0001106C:
    # 0x1106C
    .asciz "st021"
    .balign 4
lbl_00011074:
    # 0x11074
    .asciz "st021/st021_p.lz"
    .balign 4
lbl_00011088:
    # 0x11088
    .asciz "st021/st021.lz"
    .balign 4
lbl_00011098:
    # 0x11098
    .asciz "st022"
    .balign 4
lbl_000110A0:
    # 0x110A0
    .asciz "st022/st022_p.lz"
    .balign 4
lbl_000110B4:
    # 0x110B4
    .asciz "st022/st022.lz"
    .balign 4
lbl_000110C4:
    # 0x110C4
    .asciz "st023"
    .balign 4
lbl_000110CC:
    # 0x110CC
    .asciz "st023/st023_p.lz"
    .balign 4
lbl_000110E0:
    # 0x110E0
    .asciz "st023/st023.lz"
    .balign 4
lbl_000110F0:
    # 0x110F0
    .asciz "st024"
    .balign 4
lbl_000110F8:
    # 0x110F8
    .asciz "st024/st024_p.lz"
    .balign 4
lbl_0001110C:
    # 0x1110C
    .asciz "st024/st024.lz"
    .balign 4
lbl_0001111C:
    # 0x1111C
    .asciz "st025"
    .balign 4
lbl_00011124:
    # 0x11124
    .asciz "st025/st025_p.lz"
    .balign 4
lbl_00011138:
    # 0x11138
    .asciz "st025/st025.lz"
    .balign 4
lbl_00011148:
    # 0x11148
    .asciz "st026"
    .balign 4
lbl_00011150:
    # 0x11150
    .asciz "st026/st026_p.lz"
    .balign 4
lbl_00011164:
    # 0x11164
    .asciz "st026/st026.lz"
    .balign 4
lbl_00011174:
    # 0x11174
    .asciz "st027"
    .balign 4
lbl_0001117C:
    # 0x1117C
    .asciz "st027/st027_p.lz"
    .balign 4
lbl_00011190:
    # 0x11190
    .asciz "st027/st027.lz"
    .balign 4
lbl_000111A0:
    # 0x111A0
    .asciz "st028"
    .balign 4
lbl_000111A8:
    # 0x111A8
    .asciz "st028/st028_p.lz"
    .balign 4
lbl_000111BC:
    # 0x111BC
    .asciz "st028/st028.lz"
    .balign 4
lbl_000111CC:
    # 0x111CC
    .asciz "st029"
    .balign 4
lbl_000111D4:
    # 0x111D4
    .asciz "st029/st029_p.lz"
    .balign 4
lbl_000111E8:
    # 0x111E8
    .asciz "st029/st029.lz"
    .balign 4
lbl_000111F8:
    # 0x111F8
    .asciz "st030"
    .balign 4
lbl_00011200:
    # 0x11200
    .asciz "st030/st030_p.lz"
    .balign 4
lbl_00011214:
    # 0x11214
    .asciz "st030/st030.lz"
    .balign 4
lbl_00011224:
    # 0x11224
    .asciz "st031"
    .balign 4
lbl_0001122C:
    # 0x1122C
    .asciz "st031/st031_p.lz"
    .balign 4
lbl_00011240:
    # 0x11240
    .asciz "st031/st031.lz"
    .balign 4
lbl_00011250:
    # 0x11250
    .asciz "st032"
    .balign 4
lbl_00011258:
    # 0x11258
    .asciz "st032/st032_p.lz"
    .balign 4
lbl_0001126C:
    # 0x1126C
    .asciz "st032/st032.lz"
    .balign 4
lbl_0001127C:
    # 0x1127C
    .asciz "st033"
    .balign 4
lbl_00011284:
    # 0x11284
    .asciz "st033/st033_p.lz"
    .balign 4
lbl_00011298:
    # 0x11298
    .asciz "st033/st033.lz"
    .balign 4
lbl_000112A8:
    # 0x112A8
    .asciz "st034"
    .balign 4
lbl_000112B0:
    # 0x112B0
    .asciz "st034/st034_p.lz"
    .balign 4
lbl_000112C4:
    # 0x112C4
    .asciz "st034/st034.lz"
    .balign 4
lbl_000112D4:
    # 0x112D4
    .asciz "st035"
    .balign 4
lbl_000112DC:
    # 0x112DC
    .asciz "st035/st035_p.lz"
    .balign 4
lbl_000112F0:
    # 0x112F0
    .asciz "st035/st035.lz"
    .balign 4
lbl_00011300:
    # 0x11300
    .asciz "st036"
    .balign 4
lbl_00011308:
    # 0x11308
    .asciz "st036/st036_p.lz"
    .balign 4
lbl_0001131C:
    # 0x1131C
    .asciz "st036/st036.lz"
    .balign 4
lbl_0001132C:
    # 0x1132C
    .asciz "st037"
    .balign 4
lbl_00011334:
    # 0x11334
    .asciz "st037/st037_p.lz"
    .balign 4
lbl_00011348:
    # 0x11348
    .asciz "st037/st037.lz"
    .balign 4
lbl_00011358:
    # 0x11358
    .asciz "st038"
    .balign 4
lbl_00011360:
    # 0x11360
    .asciz "st038/st038_p.lz"
    .balign 4
lbl_00011374:
    # 0x11374
    .asciz "st038/st038.lz"
    .balign 4
lbl_00011384:
    # 0x11384
    .asciz "st049"
    .balign 4
lbl_0001138C:
    # 0x1138C
    .asciz "st049/st049_p.lz"
    .balign 4
lbl_000113A0:
    # 0x113A0
    .asciz "st049/st049.lz"
    .balign 4
lbl_000113B0:
    # 0x113B0
    .asciz "st040"
    .balign 4
lbl_000113B8:
    # 0x113B8
    .asciz "st040/st040_p.lz"
    .balign 4
lbl_000113CC:
    # 0x113CC
    .asciz "st040/st040.lz"
    .balign 4
lbl_000113DC:
    # 0x113DC
    .asciz "st041"
    .balign 4
lbl_000113E4:
    # 0x113E4
    .asciz "st041/st041_p.lz"
    .balign 4
lbl_000113F8:
    # 0x113F8
    .asciz "st041/st041.lz"
    .balign 4
lbl_00011408:
    # 0x11408
    .asciz "st042"
    .balign 4
lbl_00011410:
    # 0x11410
    .asciz "st042/st042_p.lz"
    .balign 4
lbl_00011424:
    # 0x11424
    .asciz "st042/st042.lz"
    .balign 4
lbl_00011434:
    # 0x11434
    .asciz "st043"
    .balign 4
lbl_0001143C:
    # 0x1143C
    .asciz "st043/st043_p.lz"
    .balign 4
lbl_00011450:
    # 0x11450
    .asciz "st043/st043.lz"
    .balign 4
lbl_00011460:
    # 0x11460
    .asciz "st044"
    .balign 4
lbl_00011468:
    # 0x11468
    .asciz "st044/st044_p.lz"
    .balign 4
lbl_0001147C:
    # 0x1147C
    .asciz "st044/st044.lz"
    .balign 4
lbl_0001148C:
    # 0x1148C
    .asciz "st045"
    .balign 4
lbl_00011494:
    # 0x11494
    .asciz "st045/st045_p.lz"
    .balign 4
lbl_000114A8:
    # 0x114A8
    .asciz "st045/st045.lz"
    .balign 4
lbl_000114B8:
    # 0x114B8
    .asciz "st046"
    .balign 4
lbl_000114C0:
    # 0x114C0
    .asciz "st046/st046_p.lz"
    .balign 4
lbl_000114D4:
    # 0x114D4
    .asciz "st046/st046.lz"
    .balign 4
lbl_000114E4:
    # 0x114E4
    .asciz "st047"
    .balign 4
lbl_000114EC:
    # 0x114EC
    .asciz "st047/st047_p.lz"
    .balign 4
lbl_00011500:
    # 0x11500
    .asciz "st047/st047.lz"
    .balign 4
lbl_00011510:
    # 0x11510
    .asciz "st048"
    .balign 4
lbl_00011518:
    # 0x11518
    .asciz "st048/st048_p.lz"
    .balign 4
lbl_0001152C:
    # 0x1152C
    .asciz "st048/st048.lz"
    .balign 4
lbl_0001153C:
    # 0x1153C
    .asciz "st050"
    .balign 4
lbl_00011544:
    # 0x11544
    .asciz "st050/st050_p.lz"
    .balign 4
lbl_00011558:
    # 0x11558
    .asciz "st050/st050.lz"
    .balign 4
lbl_00011568:
    # 0x11568
    .asciz "st051"
    .balign 4
lbl_00011570:
    # 0x11570
    .asciz "st051/st051_p.lz"
    .balign 4
lbl_00011584:
    # 0x11584
    .asciz "st051/st051.lz"
    .balign 4
lbl_00011594:
    # 0x11594
    .asciz "st052"
    .balign 4
lbl_0001159C:
    # 0x1159C
    .asciz "st052/st052_p.lz"
    .balign 4
lbl_000115B0:
    # 0x115B0
    .asciz "st052/st052.lz"
    .balign 4
lbl_000115C0:
    # 0x115C0
    .asciz "st053"
    .balign 4
lbl_000115C8:
    # 0x115C8
    .asciz "st053/st053_p.lz"
    .balign 4
lbl_000115DC:
    # 0x115DC
    .asciz "st053/st053.lz"
    .balign 4
lbl_000115EC:
    # 0x115EC
    .asciz "st054"
    .balign 4
lbl_000115F4:
    # 0x115F4
    .asciz "st054/st054_p.lz"
    .balign 4
lbl_00011608:
    # 0x11608
    .asciz "st054/st054.lz"
    .balign 4
lbl_00011618:
    # 0x11618
    .asciz "st055"
    .balign 4
lbl_00011620:
    # 0x11620
    .asciz "st055/st055_p.lz"
    .balign 4
lbl_00011634:
    # 0x11634
    .asciz "st055/st055.lz"
    .balign 4
lbl_00011644:
    # 0x11644
    .asciz "st056"
    .balign 4
lbl_0001164C:
    # 0x1164C
    .asciz "st056/st056_p.lz"
    .balign 4
lbl_00011660:
    # 0x11660
    .asciz "st056/st056.lz"
    .balign 4
lbl_00011670:
    # 0x11670
    .asciz "st057"
    .balign 4
lbl_00011678:
    # 0x11678
    .asciz "st057/st057_p.lz"
    .balign 4
lbl_0001168C:
    # 0x1168C
    .asciz "st057/st057.lz"
    .balign 4
lbl_0001169C:
    # 0x1169C
    .asciz "st058"
    .balign 4
lbl_000116A4:
    # 0x116A4
    .asciz "st058/st058_p.lz"
    .balign 4
lbl_000116B8:
    # 0x116B8
    .asciz "st058/st058.lz"
    .balign 4
lbl_000116C8:
    # 0x116C8
    .asciz "st059"
    .balign 4
lbl_000116D0:
    # 0x116D0
    .asciz "st059/st059_p.lz"
    .balign 4
lbl_000116E4:
    # 0x116E4
    .asciz "st059/st059.lz"
    .balign 4
lbl_000116F4:
    # 0x116F4
    .asciz "st060"
    .balign 4
lbl_000116FC:
    # 0x116FC
    .asciz "st060/st060_p.lz"
    .balign 4
lbl_00011710:
    # 0x11710
    .asciz "st060/st060.lz"
    .balign 4
lbl_00011720:
    # 0x11720
    .asciz "st061"
    .balign 4
lbl_00011728:
    # 0x11728
    .asciz "st061/st061_p.lz"
    .balign 4
lbl_0001173C:
    # 0x1173C
    .asciz "st061/st061.lz"
    .balign 4
lbl_0001174C:
    # 0x1174C
    .asciz "st062"
    .balign 4
lbl_00011754:
    # 0x11754
    .asciz "st062/st062_p.lz"
    .balign 4
lbl_00011768:
    # 0x11768
    .asciz "st062/st062.lz"
    .balign 4
lbl_00011778:
    # 0x11778
    .asciz "st063"
    .balign 4
lbl_00011780:
    # 0x11780
    .asciz "st063/st063_p.lz"
    .balign 4
lbl_00011794:
    # 0x11794
    .asciz "st063/st063.lz"
    .balign 4
lbl_000117A4:
    # 0x117A4
    .asciz "st064"
    .balign 4
lbl_000117AC:
    # 0x117AC
    .asciz "st064/st064_p.lz"
    .balign 4
lbl_000117C0:
    # 0x117C0
    .asciz "st064/st064.lz"
    .balign 4
lbl_000117D0:
    # 0x117D0
    .asciz "st065"
    .balign 4
lbl_000117D8:
    # 0x117D8
    .asciz "st065/st065_p.lz"
    .balign 4
lbl_000117EC:
    # 0x117EC
    .asciz "st065/st065.lz"
    .balign 4
lbl_000117FC:
    # 0x117FC
    .asciz "st066"
    .balign 4
lbl_00011804:
    # 0x11804
    .asciz "st066/st066_p.lz"
    .balign 4
lbl_00011818:
    # 0x11818
    .asciz "st066/st066.lz"
    .balign 4
lbl_00011828:
    # 0x11828
    .asciz "st067"
    .balign 4
lbl_00011830:
    # 0x11830
    .asciz "st067/st067_p.lz"
    .balign 4
lbl_00011844:
    # 0x11844
    .asciz "st067/st067.lz"
    .balign 4
lbl_00011854:
    # 0x11854
    .asciz "st068"
    .balign 4
lbl_0001185C:
    # 0x1185C
    .asciz "st068/st068_p.lz"
    .balign 4
lbl_00011870:
    # 0x11870
    .asciz "st068/st068.lz"
    .balign 4
lbl_00011880:
    # 0x11880
    .asciz "st069"
    .balign 4
lbl_00011888:
    # 0x11888
    .asciz "st069/st069_p.lz"
    .balign 4
lbl_0001189C:
    # 0x1189C
    .asciz "st069/st069.lz"
    .balign 4
lbl_000118AC:
    # 0x118AC
    .asciz "st070"
    .balign 4
lbl_000118B4:
    # 0x118B4
    .asciz "st070/st070_p.lz"
    .balign 4
lbl_000118C8:
    # 0x118C8
    .asciz "st070/st070.lz"
    .balign 4
lbl_000118D8:
    # 0x118D8
    .asciz "st071"
    .balign 4
lbl_000118E0:
    # 0x118E0
    .asciz "st071/st071_p.lz"
    .balign 4
lbl_000118F4:
    # 0x118F4
    .asciz "st071/st071.lz"
    .balign 4
lbl_00011904:
    # 0x11904
    .asciz "st072"
    .balign 4
lbl_0001190C:
    # 0x1190C
    .asciz "st072/st072_p.lz"
    .balign 4
lbl_00011920:
    # 0x11920
    .asciz "st072/st072.lz"
    .balign 4
lbl_00011930:
    # 0x11930
    .asciz "st073"
    .balign 4
lbl_00011938:
    # 0x11938
    .asciz "st073/st073_p.lz"
    .balign 4
lbl_0001194C:
    # 0x1194C
    .asciz "st073/st073.lz"
    .balign 4
lbl_0001195C:
    # 0x1195C
    .asciz "st074"
    .balign 4
lbl_00011964:
    # 0x11964
    .asciz "st074/st074_p.lz"
    .balign 4
lbl_00011978:
    # 0x11978
    .asciz "st074/st074.lz"
    .balign 4
lbl_00011988:
    # 0x11988
    .asciz "st075"
    .balign 4
lbl_00011990:
    # 0x11990
    .asciz "st075/st075_p.lz"
    .balign 4
lbl_000119A4:
    # 0x119A4
    .asciz "st075/st075.lz"
    .balign 4
lbl_000119B4:
    # 0x119B4
    .asciz "st076"
    .balign 4
lbl_000119BC:
    # 0x119BC
    .asciz "st076/st076_p.lz"
    .balign 4
lbl_000119D0:
    # 0x119D0
    .asciz "st076/st076.lz"
    .balign 4
lbl_000119E0:
    # 0x119E0
    .asciz "st077"
    .balign 4
lbl_000119E8:
    # 0x119E8
    .asciz "st077/st077_p.lz"
    .balign 4
lbl_000119FC:
    # 0x119FC
    .asciz "st077/st077.lz"
    .balign 4
lbl_00011A0C:
    # 0x11A0C
    .asciz "st078"
    .balign 4
lbl_00011A14:
    # 0x11A14
    .asciz "st078/st078_p.lz"
    .balign 4
lbl_00011A28:
    # 0x11A28
    .asciz "st078/st078.lz"
    .balign 4
lbl_00011A38:
    # 0x11A38
    .asciz "st079"
    .balign 4
lbl_00011A40:
    # 0x11A40
    .asciz "st079/st079_p.lz"
    .balign 4
lbl_00011A54:
    # 0x11A54
    .asciz "st079/st079.lz"
    .balign 4
lbl_00011A64:
    # 0x11A64
    .asciz "st080"
    .balign 4
lbl_00011A6C:
    # 0x11A6C
    .asciz "st080/st080_p.lz"
    .balign 4
lbl_00011A80:
    # 0x11A80
    .asciz "st080/st080.lz"
    .balign 4
lbl_00011A90:
    # 0x11A90
    .asciz "st081"
    .balign 4
lbl_00011A98:
    # 0x11A98
    .asciz "st081/st081_p.lz"
    .balign 4
lbl_00011AAC:
    # 0x11AAC
    .asciz "st081/st081.lz"
    .balign 4
lbl_00011ABC:
    # 0x11ABC
    .asciz "st082"
    .balign 4
lbl_00011AC4:
    # 0x11AC4
    .asciz "st082/st082_p.lz"
    .balign 4
lbl_00011AD8:
    # 0x11AD8
    .asciz "st082/st082.lz"
    .balign 4
lbl_00011AE8:
    # 0x11AE8
    .asciz "st083"
    .balign 4
lbl_00011AF0:
    # 0x11AF0
    .asciz "st083/st083_p.lz"
    .balign 4
lbl_00011B04:
    # 0x11B04
    .asciz "st083/st083.lz"
    .balign 4
lbl_00011B14:
    # 0x11B14
    .asciz "st084"
    .balign 4
lbl_00011B1C:
    # 0x11B1C
    .asciz "st084/st084_p.lz"
    .balign 4
lbl_00011B30:
    # 0x11B30
    .asciz "st084/st084.lz"
    .balign 4
lbl_00011B40:
    # 0x11B40
    .asciz "st085"
    .balign 4
lbl_00011B48:
    # 0x11B48
    .asciz "st085/st085_p.lz"
    .balign 4
lbl_00011B5C:
    # 0x11B5C
    .asciz "st085/st085.lz"
    .balign 4
lbl_00011B6C:
    # 0x11B6C
    .asciz "st086"
    .balign 4
lbl_00011B74:
    # 0x11B74
    .asciz "st086/st086_p.lz"
    .balign 4
lbl_00011B88:
    # 0x11B88
    .asciz "st086/st086.lz"
    .balign 4
lbl_00011B98:
    # 0x11B98
    .asciz "st087"
    .balign 4
lbl_00011BA0:
    # 0x11BA0
    .asciz "st087/st087_p.lz"
    .balign 4
lbl_00011BB4:
    # 0x11BB4
    .asciz "st087/st087.lz"
    .balign 4
lbl_00011BC4:
    # 0x11BC4
    .asciz "st088"
    .balign 4
lbl_00011BCC:
    # 0x11BCC
    .asciz "st088/st088_p.lz"
    .balign 4
lbl_00011BE0:
    # 0x11BE0
    .asciz "st088/st088.lz"
    .balign 4
lbl_00011BF0:
    # 0x11BF0
    .asciz "st089"
    .balign 4
lbl_00011BF8:
    # 0x11BF8
    .asciz "st089/st089_p.lz"
    .balign 4
lbl_00011C0C:
    # 0x11C0C
    .asciz "st089/st089.lz"
    .balign 4
lbl_00011C1C:
    # 0x11C1C
    .asciz "st090"
    .balign 4
lbl_00011C24:
    # 0x11C24
    .asciz "st090/st090_p.lz"
    .balign 4
lbl_00011C38:
    # 0x11C38
    .asciz "st090/st090.lz"
    .balign 4
lbl_00011C48:
    # 0x11C48
    .asciz "st091"
    .balign 4
lbl_00011C50:
    # 0x11C50
    .asciz "st091/st091_p.lz"
    .balign 4
lbl_00011C64:
    # 0x11C64
    .asciz "st091/st091.lz"
    .balign 4
lbl_00011C74:
    # 0x11C74
    .asciz "st092"
    .balign 4
lbl_00011C7C:
    # 0x11C7C
    .asciz "st092/st092_p.lz"
    .balign 4
lbl_00011C90:
    # 0x11C90
    .asciz "st092/st092.lz"
    .balign 4
lbl_00011CA0:
    # 0x11CA0
    .asciz "st093"
    .balign 4
lbl_00011CA8:
    # 0x11CA8
    .asciz "st093/st093_p.lz"
    .balign 4
lbl_00011CBC:
    # 0x11CBC
    .asciz "st093/st093.lz"
    .balign 4
lbl_00011CCC:
    # 0x11CCC
    .asciz "st094"
    .balign 4
lbl_00011CD4:
    # 0x11CD4
    .asciz "st094/st094_p.lz"
    .balign 4
lbl_00011CE8:
    # 0x11CE8
    .asciz "st094/st094.lz"
    .balign 4
lbl_00011CF8:
    # 0x11CF8
    .asciz "st095"
    .balign 4
lbl_00011D00:
    # 0x11D00
    .asciz "st095/st095_p.lz"
    .balign 4
lbl_00011D14:
    # 0x11D14
    .asciz "st095/st095.lz"
    .balign 4
lbl_00011D24:
    # 0x11D24
    .asciz "st096"
    .balign 4
lbl_00011D2C:
    # 0x11D2C
    .asciz "st096/st096_p.lz"
    .balign 4
lbl_00011D40:
    # 0x11D40
    .asciz "st096/st096.lz"
    .balign 4
lbl_00011D50:
    # 0x11D50
    .asciz "st097"
    .balign 4
lbl_00011D58:
    # 0x11D58
    .asciz "st097/st097_p.lz"
    .balign 4
lbl_00011D6C:
    # 0x11D6C
    .asciz "st097/st097.lz"
    .balign 4
lbl_00011D7C:
    # 0x11D7C
    .asciz "st098"
    .balign 4
lbl_00011D84:
    # 0x11D84
    .asciz "st098/st098_p.lz"
    .balign 4
lbl_00011D98:
    # 0x11D98
    .asciz "st098/st098.lz"
    .balign 4
lbl_00011DA8:
    # 0x11DA8
    .asciz "st099"
    .balign 4
lbl_00011DB0:
    # 0x11DB0
    .asciz "st099/st099_p.lz"
    .balign 4
lbl_00011DC4:
    # 0x11DC4
    .asciz "st099/st099.lz"
    .balign 4
lbl_00011DD4:
    # 0x11DD4
    .asciz "st100"
    .balign 4
lbl_00011DDC:
    # 0x11DDC
    .asciz "st100/st100_p.lz"
    .balign 4
lbl_00011DF0:
    # 0x11DF0
    .asciz "st100/st100.lz"
    .balign 4
lbl_00011E00:
    # 0x11E00
    .asciz "st101"
    .balign 4
lbl_00011E08:
    # 0x11E08
    .asciz "st101/st101_p.lz"
    .balign 4
lbl_00011E1C:
    # 0x11E1C
    .asciz "st101/st101.lz"
    .balign 4
lbl_00011E2C:
    # 0x11E2C
    .asciz "st102"
    .balign 4
lbl_00011E34:
    # 0x11E34
    .asciz "st102/st102_p.lz"
    .balign 4
lbl_00011E48:
    # 0x11E48
    .asciz "st102/st102.lz"
    .balign 4
lbl_00011E58:
    # 0x11E58
    .asciz "st103"
    .balign 4
lbl_00011E60:
    # 0x11E60
    .asciz "st103/st103_p.lz"
    .balign 4
lbl_00011E74:
    # 0x11E74
    .asciz "st103/st103.lz"
    .balign 4
lbl_00011E84:
    # 0x11E84
    .asciz "st104"
    .balign 4
lbl_00011E8C:
    # 0x11E8C
    .asciz "st104/st104_p.lz"
    .balign 4
lbl_00011EA0:
    # 0x11EA0
    .asciz "st104/st104.lz"
    .balign 4
lbl_00011EB0:
    # 0x11EB0
    .asciz "st105"
    .balign 4
lbl_00011EB8:
    # 0x11EB8
    .asciz "st105/st105_p.lz"
    .balign 4
lbl_00011ECC:
    # 0x11ECC
    .asciz "st105/st105.lz"
    .balign 4
lbl_00011EDC:
    # 0x11EDC
    .asciz "st106"
    .balign 4
lbl_00011EE4:
    # 0x11EE4
    .asciz "st106/st106_p.lz"
    .balign 4
lbl_00011EF8:
    # 0x11EF8
    .asciz "st106/st106.lz"
    .balign 4
lbl_00011F08:
    # 0x11F08
    .asciz "st107"
    .balign 4
lbl_00011F10:
    # 0x11F10
    .asciz "st107/st107_p.lz"
    .balign 4
lbl_00011F24:
    # 0x11F24
    .asciz "st107/st107.lz"
    .balign 4
lbl_00011F34:
    # 0x11F34
    .asciz "st108"
    .balign 4
lbl_00011F3C:
    # 0x11F3C
    .asciz "st108/st108_p.lz"
    .balign 4
lbl_00011F50:
    # 0x11F50
    .asciz "st108/st108.lz"
    .balign 4
lbl_00011F60:
    # 0x11F60
    .asciz "st109"
    .balign 4
lbl_00011F68:
    # 0x11F68
    .asciz "st109/st109_p.lz"
    .balign 4
lbl_00011F7C:
    # 0x11F7C
    .asciz "st109/st109.lz"
    .balign 4
lbl_00011F8C:
    # 0x11F8C
    .asciz "st110"
    .balign 4
lbl_00011F94:
    # 0x11F94
    .asciz "st110/st110_p.lz"
    .balign 4
lbl_00011FA8:
    # 0x11FA8
    .asciz "st110/st110.lz"
    .balign 4
lbl_00011FB8:
    # 0x11FB8
    .asciz "st121"
    .balign 4
lbl_00011FC0:
    # 0x11FC0
    .asciz "st121/st121_p.lz"
    .balign 4
lbl_00011FD4:
    # 0x11FD4
    .asciz "st121/st121.lz"
    .balign 4
lbl_00011FE4:
    # 0x11FE4
    .asciz "st122"
    .balign 4
lbl_00011FEC:
    # 0x11FEC
    .asciz "st122/st122_p.lz"
    .balign 4
lbl_00012000:
    # 0x12000
    .asciz "st122/st122.lz"
    .balign 4
lbl_00012010:
    # 0x12010
    .asciz "st123"
    .balign 4
lbl_00012018:
    # 0x12018
    .asciz "st123/st123_p.lz"
    .balign 4
lbl_0001202C:
    # 0x1202C
    .asciz "st123/st123.lz"
    .balign 4
lbl_0001203C:
    # 0x1203C
    .asciz "st124"
    .balign 4
lbl_00012044:
    # 0x12044
    .asciz "st124/st124_p.lz"
    .balign 4
lbl_00012058:
    # 0x12058
    .asciz "st124/st124.lz"
    .balign 4
lbl_00012068:
    # 0x12068
    .asciz "st125"
    .balign 4
lbl_00012070:
    # 0x12070
    .asciz "st125/st125_p.lz"
    .balign 4
lbl_00012084:
    # 0x12084
    .asciz "st125/st125.lz"
    .balign 4
lbl_00012094:
    # 0x12094
    .asciz "st126"
    .balign 4
lbl_0001209C:
    # 0x1209C
    .asciz "st126/st126_p.lz"
    .balign 4
lbl_000120B0:
    # 0x120B0
    .asciz "st126/st126.lz"
    .balign 4
lbl_000120C0:
    # 0x120C0
    .asciz "st127"
    .balign 4
lbl_000120C8:
    # 0x120C8
    .asciz "st127/st127_p.lz"
    .balign 4
lbl_000120DC:
    # 0x120DC
    .asciz "st127/st127.lz"
    .balign 4
lbl_000120EC:
    # 0x120EC
    .asciz "st128"
    .balign 4
lbl_000120F4:
    # 0x120F4
    .asciz "st128/st128_p.lz"
    .balign 4
lbl_00012108:
    # 0x12108
    .asciz "st128/st128.lz"
    .balign 4
lbl_00012118:
    # 0x12118
    .asciz "st129"
    .balign 4
lbl_00012120:
    # 0x12120
    .asciz "st129/st129_p.lz"
    .balign 4
lbl_00012134:
    # 0x12134
    .asciz "st129/st129.lz"
    .balign 4
lbl_00012144:
    # 0x12144
    .asciz "st130"
    .balign 4
lbl_0001214C:
    # 0x1214C
    .asciz "st130/st130_p.lz"
    .balign 4
lbl_00012160:
    # 0x12160
    .asciz "st130/st130.lz"
    .balign 4
lbl_00012170:
    # 0x12170
    .asciz "st134"
    .balign 4
lbl_00012178:
    # 0x12178
    .asciz "st134/st134_p.lz"
    .balign 4
lbl_0001218C:
    # 0x1218C
    .asciz "st134/st134.lz"
    .balign 4
lbl_0001219C:
    # 0x1219C
    .asciz "bg_a"
    .balign 4
lbl_000121A4:
    # 0x121A4
    .asciz "bg/bg_a_p.lz"
    .balign 4
lbl_000121B4:
    # 0x121B4
    .asciz "bg/bg_a.lz"
    .balign 4
lbl_000121C0:
    # 0x121C0
    .asciz "bg_b"
    .balign 4
lbl_000121C8:
    # 0x121C8
    .asciz "bg/bg_b_p.lz"
    .balign 4
lbl_000121D8:
    # 0x121D8
    .asciz "bg/bg_b.lz"
    .balign 4
lbl_000121E4:
    # 0x121E4
    .asciz "bg_c"
    .balign 4
lbl_000121EC:
    # 0x121EC
    .asciz "bg/bg_c_p.lz"
    .balign 4
lbl_000121FC:
    # 0x121FC
    .asciz "bg/bg_c.lz"
    .balign 4
lbl_00012208:
    # 0x12208
    .asciz "bg_d"
    .balign 4
lbl_00012210:
    # 0x12210
    .asciz "bg/bg_d_p.lz"
    .balign 4
lbl_00012220:
    # 0x12220
    .asciz "bg/bg_d.lz"
    .balign 4
lbl_0001222C:
    # 0x1222C
    .asciz "bg_e"
    .balign 4
lbl_00012234:
    # 0x12234
    .asciz "bg/bg_e_p.lz"
    .balign 4
lbl_00012244:
    # 0x12244
    .asciz "bg/bg_e.lz"
    .balign 4
lbl_00012250:
    # 0x12250
    .asciz "bg_f"
    .balign 4
lbl_00012258:
    # 0x12258
    .asciz "bg/bg_f_p.lz"
    .balign 4
lbl_00012268:
    # 0x12268
    .asciz "bg/bg_f.lz"
    .balign 4
lbl_00012274:
    # 0x12274
    .asciz "bg_g"
    .balign 4
lbl_0001227C:
    # 0x1227C
    .asciz "bg/bg_g_p.lz"
    .balign 4
lbl_0001228C:
    # 0x1228C
    .asciz "bg/bg_g.lz"
    .balign 4
lbl_00012298:
    # 0x12298
    .asciz "bg_h"
    .balign 4
lbl_000122A0:
    # 0x122A0
    .asciz "bg/bg_h_p.lz"
    .balign 4
lbl_000122B0:
    # 0x122B0
    .asciz "bg/bg_h.lz"
    .balign 4
lbl_000122BC:
    # 0x122BC
    .asciz "bg_i"
    .balign 4
lbl_000122C4:
    # 0x122C4
    .asciz "bg/bg_i_p.lz"
    .balign 4
lbl_000122D4:
    # 0x122D4
    .asciz "bg/bg_i.lz"
    .balign 4
lbl_000122E0:
    # 0x122E0
    .asciz "bg_j"
    .balign 4
lbl_000122E8:
    # 0x122E8
    .asciz "bg/bg_j_p.lz"
    .balign 4
lbl_000122F8:
    # 0x122F8
    .asciz "bg/bg_j.lz"
    .balign 4
lbl_00012304:
    # 0x12304
    .asciz "minitest"
    .balign 4
lbl_00012310:
    # 0x12310
    .asciz "init/minit_p.lz"
lbl_00012320:
    # 0x12320
    .asciz "init/minit.lz"
    .balign 4
lbl_00012330:
    # 0x12330
    .4byte lbl_00010C60
    .4byte lbl_00010C68
    .4byte lbl_00010C7C
    .4byte lbl_00010C8C
    .4byte lbl_00010C94
    .4byte lbl_00010CA4
    .4byte lbl_00010CB4
    .4byte lbl_00010CB8
    .4byte lbl_00010CC8
    .4byte lbl_00010CD4
    .4byte lbl_00010CDC
    .4byte lbl_00010CEC
    .4byte lbl_00010CFC
    .4byte lbl_00010D04
    .4byte lbl_00010D18
    .4byte lbl_00010D28
    .4byte lbl_00010D30
    .4byte lbl_00010D44
    .4byte lbl_00010D54
    .4byte lbl_00010D5C
    .4byte lbl_00010D70
    .4byte lbl_00010D80
    .4byte lbl_00010D88
    .4byte lbl_00010D9C
    .4byte lbl_00010DAC
    .4byte lbl_00010DB4
    .4byte lbl_00010DC8
    .4byte lbl_00010DD8
    .4byte lbl_00010DE0
    .4byte lbl_00010DF4
    .4byte lbl_00010E04
    .4byte lbl_00010E0C
    .4byte lbl_00010E20
    .4byte lbl_00010E30
    .4byte lbl_00010E38
    .4byte lbl_00010E4C
    .4byte lbl_00010E5C
    .4byte lbl_00010E64
    .4byte lbl_00010E78
    .4byte lbl_00010E88
    .4byte lbl_00010E90
    .4byte lbl_00010EA4
    .4byte lbl_00010EB4
    .4byte lbl_00010EBC
    .4byte lbl_00010ED0
    .4byte lbl_00010EE0
    .4byte lbl_00010EE8
    .4byte lbl_00010EFC
    .4byte lbl_00010F0C
    .4byte lbl_00010F14
    .4byte lbl_00010F28
    .4byte lbl_00010F38
    .4byte lbl_00010F40
    .4byte lbl_00010F54
    .4byte lbl_00010F64
    .4byte lbl_00010F6C
    .4byte lbl_00010F80
    .4byte lbl_00010F90
    .4byte lbl_00010F98
    .4byte lbl_00010FAC
    .4byte lbl_00010FBC
    .4byte lbl_00010FC4
    .4byte lbl_00010FD8
    .4byte lbl_00010FE8
    .4byte lbl_00010FF0
    .4byte lbl_00011004
    .4byte lbl_00011014
    .4byte lbl_0001101C
    .4byte lbl_00011030
    .4byte lbl_00011040
    .4byte lbl_00011048
    .4byte lbl_0001105C
    .4byte lbl_0001106C
    .4byte lbl_00011074
    .4byte lbl_00011088
    .4byte lbl_00011098
    .4byte lbl_000110A0
    .4byte lbl_000110B4
    .4byte lbl_000110C4
    .4byte lbl_000110CC
    .4byte lbl_000110E0
    .4byte lbl_000110F0
    .4byte lbl_000110F8
    .4byte lbl_0001110C
    .4byte lbl_0001111C
    .4byte lbl_00011124
    .4byte lbl_00011138
    .4byte lbl_00011148
    .4byte lbl_00011150
    .4byte lbl_00011164
    .4byte lbl_00011174
    .4byte lbl_0001117C
    .4byte lbl_00011190
    .4byte lbl_000111A0
    .4byte lbl_000111A8
    .4byte lbl_000111BC
    .4byte lbl_000111CC
    .4byte lbl_000111D4
    .4byte lbl_000111E8
    .4byte lbl_000111F8
    .4byte lbl_00011200
    .4byte lbl_00011214
    .4byte lbl_00011224
    .4byte lbl_0001122C
    .4byte lbl_00011240
    .4byte lbl_00011250
    .4byte lbl_00011258
    .4byte lbl_0001126C
    .4byte lbl_0001127C
    .4byte lbl_00011284
    .4byte lbl_00011298
    .4byte lbl_000112A8
    .4byte lbl_000112B0
    .4byte lbl_000112C4
    .4byte lbl_000112D4
    .4byte lbl_000112DC
    .4byte lbl_000112F0
    .4byte lbl_00011300
    .4byte lbl_00011308
    .4byte lbl_0001131C
    .4byte lbl_0001132C
    .4byte lbl_00011334
    .4byte lbl_00011348
    .4byte lbl_00011358
    .4byte lbl_00011360
    .4byte lbl_00011374
    .4byte lbl_00011384
    .4byte lbl_0001138C
    .4byte lbl_000113A0
    .4byte lbl_000113B0
    .4byte lbl_000113B8
    .4byte lbl_000113CC
    .4byte lbl_000113DC
    .4byte lbl_000113E4
    .4byte lbl_000113F8
    .4byte lbl_00011408
    .4byte lbl_00011410
    .4byte lbl_00011424
    .4byte lbl_00011434
    .4byte lbl_0001143C
    .4byte lbl_00011450
    .4byte lbl_00011460
    .4byte lbl_00011468
    .4byte lbl_0001147C
    .4byte lbl_0001148C
    .4byte lbl_00011494
    .4byte lbl_000114A8
    .4byte lbl_000114B8
    .4byte lbl_000114C0
    .4byte lbl_000114D4
    .4byte lbl_000114E4
    .4byte lbl_000114EC
    .4byte lbl_00011500
    .4byte lbl_00011510
    .4byte lbl_00011518
    .4byte lbl_0001152C
    .4byte lbl_00011384
    .4byte lbl_0001138C
    .4byte lbl_000113A0
    .4byte lbl_0001153C
    .4byte lbl_00011544
    .4byte lbl_00011558
    .4byte lbl_00011568
    .4byte lbl_00011570
    .4byte lbl_00011584
    .4byte lbl_00011594
    .4byte lbl_0001159C
    .4byte lbl_000115B0
    .4byte lbl_000115C0
    .4byte lbl_000115C8
    .4byte lbl_000115DC
    .4byte lbl_000115EC
    .4byte lbl_000115F4
    .4byte lbl_00011608
    .4byte lbl_00011618
    .4byte lbl_00011620
    .4byte lbl_00011634
    .4byte lbl_00011644
    .4byte lbl_0001164C
    .4byte lbl_00011660
    .4byte lbl_00011670
    .4byte lbl_00011678
    .4byte lbl_0001168C
    .4byte lbl_0001169C
    .4byte lbl_000116A4
    .4byte lbl_000116B8
    .4byte lbl_000116C8
    .4byte lbl_000116D0
    .4byte lbl_000116E4
    .4byte lbl_000116F4
    .4byte lbl_000116FC
    .4byte lbl_00011710
    .4byte lbl_00011720
    .4byte lbl_00011728
    .4byte lbl_0001173C
    .4byte lbl_0001174C
    .4byte lbl_00011754
    .4byte lbl_00011768
    .4byte lbl_00011778
    .4byte lbl_00011780
    .4byte lbl_00011794
    .4byte lbl_000117A4
    .4byte lbl_000117AC
    .4byte lbl_000117C0
    .4byte lbl_000117D0
    .4byte lbl_000117D8
    .4byte lbl_000117EC
    .4byte lbl_000117FC
    .4byte lbl_00011804
    .4byte lbl_00011818
    .4byte lbl_00011828
    .4byte lbl_00011830
    .4byte lbl_00011844
    .4byte lbl_00011854
    .4byte lbl_0001185C
    .4byte lbl_00011870
    .4byte lbl_00011880
    .4byte lbl_00011888
    .4byte lbl_0001189C
    .4byte lbl_000118AC
    .4byte lbl_000118B4
    .4byte lbl_000118C8
    .4byte lbl_000118D8
    .4byte lbl_000118E0
    .4byte lbl_000118F4
    .4byte lbl_00011904
    .4byte lbl_0001190C
    .4byte lbl_00011920
    .4byte lbl_00011930
    .4byte lbl_00011938
    .4byte lbl_0001194C
    .4byte lbl_0001195C
    .4byte lbl_00011964
    .4byte lbl_00011978
    .4byte lbl_00011988
    .4byte lbl_00011990
    .4byte lbl_000119A4
    .4byte lbl_000119B4
    .4byte lbl_000119BC
    .4byte lbl_000119D0
    .4byte lbl_000119E0
    .4byte lbl_000119E8
    .4byte lbl_000119FC
    .4byte lbl_00011A0C
    .4byte lbl_00011A14
    .4byte lbl_00011A28
    .4byte lbl_00011A38
    .4byte lbl_00011A40
    .4byte lbl_00011A54
    .4byte lbl_00011A64
    .4byte lbl_00011A6C
    .4byte lbl_00011A80
    .4byte lbl_00011A90
    .4byte lbl_00011A98
    .4byte lbl_00011AAC
    .4byte lbl_00011ABC
    .4byte lbl_00011AC4
    .4byte lbl_00011AD8
    .4byte lbl_00011AE8
    .4byte lbl_00011AF0
    .4byte lbl_00011B04
    .4byte lbl_00011B14
    .4byte lbl_00011B1C
    .4byte lbl_00011B30
    .4byte lbl_00011B40
    .4byte lbl_00011B48
    .4byte lbl_00011B5C
    .4byte lbl_00011B6C
    .4byte lbl_00011B74
    .4byte lbl_00011B88
    .4byte lbl_00011B98
    .4byte lbl_00011BA0
    .4byte lbl_00011BB4
    .4byte lbl_00011BC4
    .4byte lbl_00011BCC
    .4byte lbl_00011BE0
    .4byte lbl_00011BF0
    .4byte lbl_00011BF8
    .4byte lbl_00011C0C
    .4byte lbl_00011C1C
    .4byte lbl_00011C24
    .4byte lbl_00011C38
    .4byte lbl_00011C48
    .4byte lbl_00011C50
    .4byte lbl_00011C64
    .4byte lbl_00011C74
    .4byte lbl_00011C7C
    .4byte lbl_00011C90
    .4byte lbl_00011CA0
    .4byte lbl_00011CA8
    .4byte lbl_00011CBC
    .4byte lbl_00011CCC
    .4byte lbl_00011CD4
    .4byte lbl_00011CE8
    .4byte lbl_00011CF8
    .4byte lbl_00011D00
    .4byte lbl_00011D14
    .4byte lbl_00011D24
    .4byte lbl_00011D2C
    .4byte lbl_00011D40
    .4byte lbl_00011D50
    .4byte lbl_00011D58
    .4byte lbl_00011D6C
    .4byte lbl_00011D7C
    .4byte lbl_00011D84
    .4byte lbl_00011D98
    .4byte lbl_00011DA8
    .4byte lbl_00011DB0
    .4byte lbl_00011DC4
    .4byte lbl_00011DD4
    .4byte lbl_00011DDC
    .4byte lbl_00011DF0
    .4byte lbl_00011E00
    .4byte lbl_00011E08
    .4byte lbl_00011E1C
    .4byte lbl_00011E2C
    .4byte lbl_00011E34
    .4byte lbl_00011E48
    .4byte lbl_00011E58
    .4byte lbl_00011E60
    .4byte lbl_00011E74
    .4byte lbl_00011E84
    .4byte lbl_00011E8C
    .4byte lbl_00011EA0
    .4byte lbl_00011EB0
    .4byte lbl_00011EB8
    .4byte lbl_00011ECC
    .4byte lbl_00011EDC
    .4byte lbl_00011EE4
    .4byte lbl_00011EF8
    .4byte lbl_00011F08
    .4byte lbl_00011F10
    .4byte lbl_00011F24
    .4byte lbl_00011F34
    .4byte lbl_00011F3C
    .4byte lbl_00011F50
    .4byte lbl_00011F60
    .4byte lbl_00011F68
    .4byte lbl_00011F7C
    .4byte lbl_00011F8C
    .4byte lbl_00011F94
    .4byte lbl_00011FA8
    .4byte lbl_00011FB8
    .4byte lbl_00011FC0
    .4byte lbl_00011FD4
    .4byte lbl_00011FE4
    .4byte lbl_00011FEC
    .4byte lbl_00012000
    .4byte lbl_00012010
    .4byte lbl_00012018
    .4byte lbl_0001202C
    .4byte lbl_0001203C
    .4byte lbl_00012044
    .4byte lbl_00012058
    .4byte lbl_00012068
    .4byte lbl_00012070
    .4byte lbl_00012084
    .4byte lbl_00012094
    .4byte lbl_0001209C
    .4byte lbl_000120B0
    .4byte lbl_000120C0
    .4byte lbl_000120C8
    .4byte lbl_000120DC
    .4byte lbl_000120EC
    .4byte lbl_000120F4
    .4byte lbl_00012108
    .4byte lbl_00012118
    .4byte lbl_00012120
    .4byte lbl_00012134
    .4byte lbl_00012144
    .4byte lbl_0001214C
    .4byte lbl_00012160
    .4byte lbl_00012170
    .4byte lbl_00012178
    .4byte lbl_0001218C
    .4byte lbl_0001219C
    .4byte lbl_000121A4
    .4byte lbl_000121B4
    .4byte lbl_000121C0
    .4byte lbl_000121C8
    .4byte lbl_000121D8
    .4byte lbl_000121E4
    .4byte lbl_000121EC
    .4byte lbl_000121FC
    .4byte lbl_00012208
    .4byte lbl_00012210
    .4byte lbl_00012220
    .4byte lbl_0001222C
    .4byte lbl_00012234
    .4byte lbl_00012244
    .4byte lbl_00012250
    .4byte lbl_00012258
    .4byte lbl_00012268
    .4byte lbl_00012274
    .4byte lbl_0001227C
    .4byte lbl_0001228C
    .4byte lbl_00012298
    .4byte lbl_000122A0
    .4byte lbl_000122B0
    .4byte lbl_000122BC
    .4byte lbl_000122C4
    .4byte lbl_000122D4
    .4byte lbl_000122E0
    .4byte lbl_000122E8
    .4byte lbl_000122F8
    .4byte lbl_00012304
    .4byte lbl_00012310
    .4byte lbl_00012320
    .asciz "Category      :%s\n"
    .balign 4
    .asciz "no data\n"
    .balign 4
    .asciz "name          :%s\n"
    .balign 4
    .asciz "size          :%d\n"
    .balign 4
lbl_000129D8:
    # 0x129D8
    .asciz "category   : %s\n"
    .balign 4
lbl_000129EC:
    # 0x129EC
    .asciz "ID         : %3d\n      name : bmp_%s\n      size : %3d x %3d\n\n"
    .balign 4
lbl_00012A2C:
    # 0x12A2C
    .asciz "base red   : %3d\n"
    .balign 4
lbl_00012A40:
    # 0x12A40
    .asciz "base green : %3d\n"
    .balign 4
lbl_00012A54:
    # 0x12A54
    .asciz "base blue  : %3d\n"
    .balign 4
lbl_00012A68:
    # 0x12A68
    .asciz "ofs  red   : %3d\n"
    .balign 4
lbl_00012A7C:
    # 0x12A7C
    .asciz "ofs  green : %3d\n"
    .balign 4
lbl_00012A90:
    # 0x12A90
    .asciz "ofs  blue  : %3d\n"
    .balign 4
lbl_00012AA4:
    # 0x12AA4
    .asciz "base zang  : %04hX\n"
lbl_00012AB8:
    # 0x12AB8
    .asciz "trnsl      : %4.2f\n"
lbl_00012ACC:
    # 0x12ACC
    .asciz "zm_x       : %4.1f\n"
lbl_00012AE0:
    # 0x12AE0
    .asciz "zm_y       : %4.1f\n"
lbl_00012AF4:
    # 0x12AF4
    .asciz "texture u0 : %4.3f\n"
lbl_00012B08:
    # 0x12B08
    .asciz "texture v0 : %4.3f\n"
lbl_00012B1C:
    # 0x12B1C
    .asciz "texture u1 : %4.3f\n"
lbl_00012B30:
    # 0x12B30
    .asciz "texture v1 : %4.3f\n"
    .4byte 0x00000001
    .4byte lbl_000129D8
    .4byte lbl_1000007C
    .4byte 0x00000002
    .4byte lbl_000129EC
    .4byte lbl_10000080
    .4byte 0x00000004
    .4byte lbl_00012A2C
    .4byte lbl_10000088
    .4byte 0x00000004
    .4byte lbl_00012A40
    .4byte lbl_10000089
    .4byte 0x00000004
    .4byte lbl_00012A54
    .4byte lbl_1000008A
    .4byte 0x00000004
    .4byte lbl_00012A68
    .4byte lbl_1000008B
    .4byte 0x00000004
    .4byte lbl_00012A7C
    .4byte lbl_1000008C
    .4byte 0x00000004
    .4byte lbl_00012A90
    .4byte lbl_1000008D
    .4byte 0x00000005
    .4byte lbl_00012AA4
    .4byte lbl_1000008E
    .4byte 0x00000006
    .4byte lbl_00012AB8
    .4byte lbl_10000090
    .4byte 0x00000007
    .4byte lbl_00012ACC
    .4byte lbl_10000094
    .4byte 0x00000007
    .4byte lbl_00012AE0
    .4byte lbl_10000098
    .4byte 0x00000008
    .4byte lbl_00012AF4
    .4byte lbl_100000A0
    .4byte 0x00000008
    .4byte lbl_00012B08
    .4byte lbl_100000A4
    .4byte 0x00000008
    .4byte lbl_00012B1C
    .4byte lbl_100000A8
    .4byte 0x00000008
    .4byte lbl_00012B30
    .4byte lbl_100000AC
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_00012C10:
    # 0x12C10
    .4byte lbl_0000319C
    .4byte lbl_00002BD0
    .4byte lbl_00002CC0
    .4byte lbl_0000319C
    .4byte lbl_00002DB0
    .4byte lbl_00002E8C
    .4byte lbl_00002F40
    .4byte lbl_00003028
    .4byte lbl_000030E8
    .4byte 0xFFFFFFFF
    .4byte 0x1C200000
    .4byte 0x2B000000
lbl_00012C40:
    # 0x12C40
    .asciz "HELLO, WORLD"
    .balign 4
lbl_00012C50:
    # 0x12C50
    .4byte 0x48454C4C
    .4byte 0x4F2C2057
    .4byte 0x4F524C44
    .4byte 0x0A181616
    .4byte 0x16190A17
    .4byte 0x20202017
    .4byte 0x0A1A1616
    .4byte 0x161B0000
lbl_00012C70:
    # 0x12C70
    .4byte 0x00000000
    .4byte lbl_00012C40
    .4byte 0x00000001
    .4byte lbl_00012C40
    .4byte 0x00000002
    .4byte lbl_00012C50
    .4byte 0x00000009
    .4byte lbl_00012C40
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012C98:
    # 0x12C98
    .asciz "h/OOMOJI a/ABCDEFG HIJKLMN\nOPQRSTU VWXYZ\nk/KOMOJI a/abcdefg hijklmn\nopqrstu vwxyz\n0123456789"
    .balign 4
lbl_00012CF8:
    # 0x12CF8
    .asciz "h/OOMOJI a/ABCDEFG HIJKLMN\nOPQRSTU VWXYZ\nk/KOMOJI a/abcdefg hijklmn\nopqrstu vwxyz\n0123456789\np/BOTANN_A/ANNDO/LE/GENZAI/JIBUNN/KOME/BUTTON_+/"
    .balign 4
lbl_00012D88:
    # 0x12D88
    .asciz "p/BOTANN_A/BUTTON_+/"
    .balign 4
lbl_00012DA0:
    # 0x12DA0
    .4byte 0x000000B0
    .4byte lbl_00012C98
    .4byte 0x000000B1
    .4byte lbl_00012CF8
    .4byte 0x000000B2
    .4byte lbl_00012D88
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012DC0:
    # 0x12DC0
    .4byte 0x01021008
    .4byte 0x05000000
lbl_00012DC8:
    # 0x12DC8
    .4byte 0x00000015
    .4byte lbl_00012DC0
    .4byte 0x00000016
    .4byte lbl_00012DC0
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012DE0:
    # 0x12DE0
    .asciz "0123456789"
    .balign 4
lbl_00012DEC:
    # 0x12DEC
    .asciz "0123"
    .balign 4
lbl_00012DF4:
    # 0x12DF4
    .4byte 0x30000000
lbl_00012DF8:
    # 0x12DF8
    .asciz "12345"
    .balign 4
lbl_00012E00:
    # 0x12E00
    .4byte 0x0000001B
    .4byte lbl_00012DE0
    .4byte 0x0000001C
    .4byte lbl_00012C40
    .4byte 0x0000001D
    .4byte lbl_00012DEC
    .4byte 0x0000001E
    .4byte lbl_00012DF4
    .4byte 0x0000001F
    .4byte lbl_00012DF8
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012E30:
    # 0x12E30
    .asciz "01234567"
    .balign 4
lbl_00012E3C:
    # 0x12E3C
    .4byte 0x00000034
    .4byte lbl_00012DE0
    .4byte 0x00000035
    .4byte lbl_00012DE0
    .4byte 0x00000036
    .4byte lbl_00012DE0
    .4byte 0x00000037
    .4byte lbl_00012E30
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012E64:
    # 0x12E64
    .asciz "HELLO, WORLD\nABC DEF"
    .balign 4
lbl_00012E7C:
    # 0x12E7C
    .4byte 0x0000005F
    .4byte lbl_00012C40
    .4byte 0x00000060
    .4byte lbl_00012C40
    .4byte 0x00000061
    .4byte lbl_00012C40
    .4byte 0x00000062
    .4byte lbl_00012E64
    .4byte 0x00000063
    .4byte lbl_00012E64
    .4byte 0x00000064
    .4byte lbl_00012C40
    .4byte 0x0000005E
    .4byte lbl_00012DE0
    .4byte 0x00000065
    .4byte lbl_00012DE0
    .4byte 0x00000066
    .4byte lbl_00012DE0
    .4byte 0x0000005D
    .4byte lbl_00012E30
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012ED4:
    # 0x12ED4
    .asciz "COMMON"
    .balign 4
lbl_00012EDC:
    # 0x12EDC
    .asciz "COMMON(JIS)"
lbl_00012EE8:
    # 0x12EE8
    .asciz "COMMON(ICON)"
    .balign 4
lbl_00012EF8:
    # 0x12EF8
    .asciz "RANKING"
lbl_00012F00:
    # 0x12F00
    .asciz "SELECTER"
    .balign 4
lbl_00012F0C:
    # 0x12F0C
    .asciz "MAIN GAME"
    .balign 4
    .4byte lbl_00012C70
    .4byte lbl_00012ED4
    .4byte 0x00000000
    .4byte lbl_00012DA0
    .4byte lbl_00012EDC
    .4byte 0x00000000
    .4byte lbl_00012DC8
    .4byte lbl_00012EE8
    .4byte 0x00000000
    .4byte lbl_00012E00
    .4byte lbl_00012EF8
    .4byte 0x00000003
    .4byte lbl_00012E3C
    .4byte lbl_00012F00
    .4byte 0x00000004
    .4byte lbl_00012E7C
    .4byte lbl_00012F0C
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "%18s *"
    .balign 4
    .asciz "%18s"
    .balign 4
lbl_00012F7C:
    # 0x12F7C
    .4byte 0x0000001A
    .4byte 0x40000000
    .4byte 0x41700000
    .4byte 0x3DCCCCCD
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte 0x00000015
    .4byte 0x40000000
    .4byte 0x41700000
    .4byte 0x3DCCCCCD
    .4byte 0x00000005
    .4byte 0x00000003
    .4byte 0x0000001B
    .4byte 0x3F800000
    .4byte 0x41000000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000016
    .4byte 0x3F800000
    .4byte 0x41000000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000018
    .4byte 0x40A00000
    .4byte 0x428C0000
    .4byte 0x3D4CCCCD
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0x00000013
    .4byte 0x40A00000
    .4byte 0x428C0000
    .4byte 0x3D4CCCCD
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x00000017
    .4byte 0x40000000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000012
    .4byte 0x40000000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0001303C:
    # 0x1303C
    .asciz "High Level"
    .balign 4
lbl_00013048:
    # 0x13048
    .asciz "Middle Level"
    .balign 4
lbl_00013058:
    # 0x13058
    .asciz "Low Level"
    .balign 4
lbl_00013064:
    # 0x13064
    .asciz "More Low Level"
    .balign 4
    .4byte lbl_0001303C
    .4byte lbl_00013048
    .4byte lbl_00013058
    .4byte lbl_00013064
lbl_00013084:
    # 0x13084
    .4byte 0x41504500
lbl_00013088:
    # 0x13088
    .4byte 0x47414C00
lbl_0001308C:
    # 0x1308C
    .4byte 0x4B494400
lbl_00013090:
    # 0x13090
    .4byte 0x474F5200
    .4byte lbl_00013084
    .4byte lbl_00013088
    .4byte lbl_0001308C
    .4byte lbl_00013090
lbl_000130A4:
    # 0x130A4
    .asciz "red(default)"
    .balign 4
lbl_000130B4:
    # 0x130B4
    .asciz "blue"
    .balign 4
lbl_000130BC:
    # 0x130BC
    .asciz "yellow"
    .balign 4
lbl_000130C4:
    # 0x130C4
    .asciz "green"
    .balign 4
    .4byte 0x2A000000
    .asciz "[%3d/%3d] %-25s  %3d/%3d\n"
    .balign 4
    .asciz "[%3d/%3d] %s\n"
    .balign 4
    .asciz "[%3d/  4] %s\n"
    .balign 4
    .asciz "[%3d/%3d] %s LOD\n"
    .balign 4
    .asciz "[%6.2f ] MOTION SPEED\n"
    .balign 4
    .asciz "[%3d/%3d] %-20s  %7.3f  %7.3f%\n"
lbl_00013158:
    # 0x13158
    .4byte lbl_00004714
    .4byte lbl_00004A00
    .4byte lbl_00004AEC
    .4byte lbl_00004CA0
    .4byte lbl_00004C20
    .4byte lbl_00004CF0
    .4byte lbl_00004D9C
    .4byte lbl_00004EBC
lbl_00013178:
    # 0x13178
    .4byte lbl_000043C8
    .4byte lbl_000043F8
    .4byte lbl_00004424
    .4byte lbl_0000444C
    .4byte lbl_00004468
    .4byte lbl_0000448C
    .4byte lbl_000044A0
    .4byte lbl_000044F0
lbl_00013198:
    # 0x13198
    .asciz "Material Change"
lbl_000131A8:
    # 0x131A8
    .asciz "Material Freeze"
lbl_000131B8:
    # 0x131B8
    .asciz "Blend"
    .balign 4
lbl_000131C0:
    # 0x131C0
    .asciz "Texture Only"
    .balign 4
lbl_000131D0:
    # 0x131D0
    .asciz "Constant"
    .balign 4
lbl_000131DC:
    # 0x131DC
    .asciz "Gouraud"
lbl_000131E4:
    # 0x131E4
    .asciz "Double Side"
lbl_000131F0:
    # 0x131F0
    .asciz "Single Side"
lbl_000131FC:
    # 0x131FC
    .asciz "Fog Disable"
lbl_00013208:
    # 0x13208
    .asciz "Fog Enable"
    .balign 4
    .4byte lbl_00013198
    .4byte lbl_000131A8
    .4byte lbl_000131B8
    .4byte lbl_000131C0
    .4byte lbl_000131D0
    .4byte lbl_000131DC
    .4byte lbl_000131E4
    .4byte lbl_000131F0
    .4byte lbl_000131FC
    .4byte lbl_00013208
lbl_0001323C:
    # 0x1323C
    .asciz "boy_h/boy_h.tpl"
lbl_0001324C:
    # 0x1324C
    .asciz "boy_kao.gcm"
    .asciz "Effective Model Test\n"
    .balign 4
    .4byte 0x2D3E2000
    .4byte 0x20202000
lbl_00013278:
    # 0x13278
    .asciz "Normal"
    .balign 4
lbl_00013280:
    # 0x13280
    .asciz "All Disp"
    .balign 4
lbl_0001328C:
    # 0x1328C
    .asciz "Cat Next"
    .balign 4
lbl_00013298:
    # 0x13298
    .asciz "Cat Prev"
    .balign 4
lbl_000132A4:
    # 0x132A4
    .asciz "Load"
    .balign 4
    .4byte lbl_00013278
    .4byte lbl_00013280
    .4byte lbl_0001328C
    .4byte lbl_00013298
    .4byte lbl_000132A4
lbl_000132C0:
    # 0x132C0
    .asciz "init"
    .balign 4
lbl_000132C8:
    # 0x132C8
    .4byte 0x62670000
lbl_000132CC:
    # 0x132CC
    .asciz "bg_jun"
    .balign 4
lbl_000132D4:
    # 0x132D4
    .asciz "bg_wat"
    .balign 4
lbl_000132DC:
    # 0x132DC
    .asciz "bg_nig"
    .balign 4
lbl_000132E4:
    # 0x132E4
    .asciz "bg_sun"
    .balign 4
lbl_000132EC:
    # 0x132EC
    .asciz "bg_spa"
    .balign 4
lbl_000132F4:
    # 0x132F4
    .asciz "bg_snd"
    .balign 4
lbl_000132FC:
    # 0x132FC
    .asciz "bg_ice"
    .balign 4
lbl_00013304:
    # 0x13304
    .asciz "bg_stm"
    .balign 4
lbl_0001330C:
    # 0x1330C
    .asciz "bg_bns"
    .balign 4
lbl_00013314:
    # 0x13314
    .asciz "st131"
    .balign 4
lbl_0001331C:
    # 0x1331C
    .asciz "st132"
    .balign 4
lbl_00013324:
    # 0x13324
    .asciz "st133"
    .balign 4
lbl_0001332C:
    # 0x1332C
    .asciz "st135"
    .balign 4
lbl_00013334:
    # 0x13334
    .asciz "st136"
    .balign 4
lbl_0001333C:
    # 0x1333C
    .asciz "st137"
    .balign 4
lbl_00013344:
    # 0x13344
    .asciz "st138"
    .balign 4
lbl_0001334C:
    # 0x1334C
    .asciz "st139"
    .balign 4
lbl_00013354:
    # 0x13354
    .asciz "st140"
    .balign 4
lbl_0001335C:
    # 0x1335C
    .asciz "st141"
    .balign 4
lbl_00013364:
    # 0x13364
    .asciz "st142"
    .balign 4
lbl_0001336C:
    # 0x1336C
    .asciz "st143"
    .balign 4
lbl_00013374:
    # 0x13374
    .asciz "st144"
    .balign 4
lbl_0001337C:
    # 0x1337C
    .asciz "st145"
    .balign 4
lbl_00013384:
    # 0x13384
    .asciz "st146"
    .balign 4
lbl_0001338C:
    # 0x1338C
    .asciz "st147"
    .balign 4
lbl_00013394:
    # 0x13394
    .asciz "st148"
    .balign 4
lbl_0001339C:
    # 0x1339C
    .asciz "st149"
    .balign 4
lbl_000133A4:
    # 0x133A4
    .asciz "st150"
    .balign 4
lbl_000133AC:
    # 0x133AC
    .asciz "st151"
    .balign 4
lbl_000133B4:
    # 0x133B4
    .asciz "st152"
    .balign 4
lbl_000133BC:
    # 0x133BC
    .asciz "st153"
    .balign 4
lbl_000133C4:
    # 0x133C4
    .asciz "st154"
    .balign 4
lbl_000133CC:
    # 0x133CC
    .asciz "st155"
    .balign 4
lbl_000133D4:
    # 0x133D4
    .asciz "st156"
    .balign 4
lbl_000133DC:
    # 0x133DC
    .asciz "st157"
    .balign 4
lbl_000133E4:
    # 0x133E4
    .asciz "st158"
    .balign 4
lbl_000133EC:
    # 0x133EC
    .asciz "st159"
    .balign 4
lbl_000133F4:
    # 0x133F4
    .asciz "st160"
    .balign 4
lbl_000133FC:
    # 0x133FC
    .asciz "st161"
    .balign 4
lbl_00013404:
    # 0x13404
    .asciz "st162"
    .balign 4
lbl_0001340C:
    # 0x1340C
    .asciz "st163"
    .balign 4
lbl_00013414:
    # 0x13414
    .asciz "st164"
    .balign 4
lbl_0001341C:
    # 0x1341C
    .asciz "st165"
    .balign 4
lbl_00013424:
    # 0x13424
    .asciz "st166"
    .balign 4
lbl_0001342C:
    # 0x1342C
    .asciz "st167"
    .balign 4
lbl_00013434:
    # 0x13434
    .asciz "st168"
    .balign 4
lbl_0001343C:
    # 0x1343C
    .asciz "st169"
    .balign 4
lbl_00013444:
    # 0x13444
    .asciz "st170"
    .balign 4
lbl_0001344C:
    # 0x1344C
    .asciz "st171"
    .balign 4
lbl_00013454:
    # 0x13454
    .asciz "st172"
    .balign 4
lbl_0001345C:
    # 0x1345C
    .asciz "st173"
    .balign 4
lbl_00013464:
    # 0x13464
    .asciz "st174"
    .balign 4
lbl_0001346C:
    # 0x1346C
    .asciz "st175"
    .balign 4
lbl_00013474:
    # 0x13474
    .asciz "st176"
    .balign 4
lbl_0001347C:
    # 0x1347C
    .asciz "st177"
    .balign 4
lbl_00013484:
    # 0x13484
    .asciz "st178"
    .balign 4
lbl_0001348C:
    # 0x1348C
    .asciz "st179"
    .balign 4
lbl_00013494:
    # 0x13494
    .asciz "st180"
    .balign 4
lbl_0001349C:
    # 0x1349C
    .asciz "st181"
    .balign 4
lbl_000134A4:
    # 0x134A4
    .asciz "st182"
    .balign 4
lbl_000134AC:
    # 0x134AC
    .asciz "st183"
    .balign 4
lbl_000134B4:
    # 0x134B4
    .asciz "st184"
    .balign 4
lbl_000134BC:
    # 0x134BC
    .asciz "st185"
    .balign 4
lbl_000134C4:
    # 0x134C4
    .asciz "st186"
    .balign 4
lbl_000134CC:
    # 0x134CC
    .asciz "st187"
    .balign 4
lbl_000134D4:
    # 0x134D4
    .asciz "st188"
    .balign 4
lbl_000134DC:
    # 0x134DC
    .asciz "st189"
    .balign 4
lbl_000134E4:
    # 0x134E4
    .asciz "st190"
    .balign 4
lbl_000134EC:
    # 0x134EC
    .asciz "st191"
    .balign 4
lbl_000134F4:
    # 0x134F4
    .asciz "st192"
    .balign 4
lbl_000134FC:
    # 0x134FC
    .asciz "st193"
    .balign 4
lbl_00013504:
    # 0x13504
    .asciz "st194"
    .balign 4
lbl_0001350C:
    # 0x1350C
    .asciz "st195"
    .balign 4
lbl_00013514:
    # 0x13514
    .asciz "st196"
    .balign 4
lbl_0001351C:
    # 0x1351C
    .asciz "st197"
    .balign 4
lbl_00013524:
    # 0x13524
    .asciz "st198"
    .balign 4
lbl_0001352C:
    # 0x1352C
    .asciz "st199"
    .balign 4
lbl_00013534:
    # 0x13534
    .asciz "st200"
    .balign 4
lbl_0001353C:
    # 0x1353C
    .asciz "boy_h"
    .balign 4
lbl_00013544:
    # 0x13544
    .asciz "boy_l"
    .balign 4
lbl_0001354C:
    # 0x1354C
    .asciz "gal_h"
    .balign 4
lbl_00013554:
    # 0x13554
    .asciz "gal_l"
    .balign 4
lbl_0001355C:
    # 0x1355C
    .asciz "kid_h"
    .balign 4
lbl_00013564:
    # 0x13564
    .asciz "kid_l"
    .balign 4
lbl_0001356C:
    # 0x1356C
    .asciz "m_race"
    .balign 4
lbl_00013574:
    # 0x13574
    .asciz "m_fight"
lbl_0001357C:
    # 0x1357C
    .asciz "m_pilot"
lbl_00013584:
    # 0x13584
    .asciz "m_bowl"
    .balign 4
lbl_0001358C:
    # 0x1358C
    .asciz "m_golf"
    .balign 4
lbl_00013594:
    # 0x13594
    .asciz "m_bill"
    .balign 4
lbl_0001359C:
    # 0x1359C
    .asciz "test"
    .balign 4
    .4byte lbl_000132C0
    .4byte lbl_00010C60
    .4byte lbl_000132C0
    .4byte lbl_00010CD4
    .4byte lbl_000132C8
    .4byte lbl_000132CC
    .4byte lbl_000132C8
    .4byte lbl_000132D4
    .4byte lbl_000132C8
    .4byte lbl_000132DC
    .4byte lbl_000132C8
    .4byte lbl_000132E4
    .4byte lbl_000132C8
    .4byte lbl_000132EC
    .4byte lbl_000132C8
    .4byte lbl_000132F4
    .4byte lbl_000132C8
    .4byte lbl_000132FC
    .4byte lbl_000132C8
    .4byte lbl_00013304
    .4byte lbl_000132C8
    .4byte lbl_0001330C
    .4byte lbl_00013314
    .4byte lbl_00013314
    .4byte lbl_0001331C
    .4byte lbl_0001331C
    .4byte lbl_00013324
    .4byte lbl_00013324
    .4byte lbl_00012170
    .4byte lbl_00012170
    .4byte lbl_0001332C
    .4byte lbl_0001332C
    .4byte lbl_00013334
    .4byte lbl_00013334
    .4byte lbl_0001333C
    .4byte lbl_0001333C
    .4byte lbl_00013344
    .4byte lbl_00013344
    .4byte lbl_0001334C
    .4byte lbl_0001334C
    .4byte lbl_00013354
    .4byte lbl_00013354
    .4byte lbl_0001335C
    .4byte lbl_0001335C
    .4byte lbl_00013364
    .4byte lbl_00013364
    .4byte lbl_0001336C
    .4byte lbl_0001336C
    .4byte lbl_00013374
    .4byte lbl_00013374
    .4byte lbl_0001337C
    .4byte lbl_0001337C
    .4byte lbl_00013384
    .4byte lbl_00013384
    .4byte lbl_0001338C
    .4byte lbl_0001338C
    .4byte lbl_00013394
    .4byte lbl_00013394
    .4byte lbl_0001339C
    .4byte lbl_0001339C
    .4byte lbl_000133A4
    .4byte lbl_000133A4
    .4byte lbl_000133AC
    .4byte lbl_000133AC
    .4byte lbl_000133B4
    .4byte lbl_000133B4
    .4byte lbl_000133BC
    .4byte lbl_000133BC
    .4byte lbl_000133C4
    .4byte lbl_000133C4
    .4byte lbl_000133CC
    .4byte lbl_000133CC
    .4byte lbl_000133D4
    .4byte lbl_000133D4
    .4byte lbl_000133DC
    .4byte lbl_000133DC
    .4byte lbl_000133E4
    .4byte lbl_000133E4
    .4byte lbl_000133EC
    .4byte lbl_000133EC
    .4byte lbl_000133F4
    .4byte lbl_000133F4
    .4byte lbl_000133FC
    .4byte lbl_000133FC
    .4byte lbl_00013404
    .4byte lbl_00013404
    .4byte lbl_0001340C
    .4byte lbl_0001340C
    .4byte lbl_00013414
    .4byte lbl_00013414
    .4byte lbl_0001341C
    .4byte lbl_0001341C
    .4byte lbl_00013424
    .4byte lbl_00013424
    .4byte lbl_0001342C
    .4byte lbl_0001342C
    .4byte lbl_00013434
    .4byte lbl_00013434
    .4byte lbl_0001343C
    .4byte lbl_0001343C
    .4byte lbl_00013444
    .4byte lbl_00013444
    .4byte lbl_0001344C
    .4byte lbl_0001344C
    .4byte lbl_00013454
    .4byte lbl_00013454
    .4byte lbl_0001345C
    .4byte lbl_0001345C
    .4byte lbl_00013464
    .4byte lbl_00013464
    .4byte lbl_0001346C
    .4byte lbl_0001346C
    .4byte lbl_00013474
    .4byte lbl_00013474
    .4byte lbl_0001347C
    .4byte lbl_0001347C
    .4byte lbl_00013484
    .4byte lbl_00013484
    .4byte lbl_0001348C
    .4byte lbl_0001348C
    .4byte lbl_00013494
    .4byte lbl_00013494
    .4byte lbl_0001349C
    .4byte lbl_0001349C
    .4byte lbl_000134A4
    .4byte lbl_000134A4
    .4byte lbl_000134AC
    .4byte lbl_000134AC
    .4byte lbl_000134B4
    .4byte lbl_000134B4
    .4byte lbl_000134BC
    .4byte lbl_000134BC
    .4byte lbl_000134C4
    .4byte lbl_000134C4
    .4byte lbl_000134CC
    .4byte lbl_000134CC
    .4byte lbl_000134D4
    .4byte lbl_000134D4
    .4byte lbl_000134DC
    .4byte lbl_000134DC
    .4byte lbl_00013494
    .4byte lbl_000134E4
    .4byte lbl_000134EC
    .4byte lbl_000134EC
    .4byte lbl_000134F4
    .4byte lbl_000134F4
    .4byte lbl_000134FC
    .4byte lbl_000134FC
    .4byte lbl_00013504
    .4byte lbl_00013504
    .4byte lbl_0001350C
    .4byte lbl_0001350C
    .4byte lbl_00013514
    .4byte lbl_00013514
    .4byte lbl_0001351C
    .4byte lbl_0001351C
    .4byte lbl_00013524
    .4byte lbl_00013524
    .4byte lbl_0001352C
    .4byte lbl_0001352C
    .4byte lbl_00013534
    .4byte lbl_00013534
    .4byte lbl_0001353C
    .4byte lbl_0001353C
    .4byte lbl_00013544
    .4byte lbl_00013544
    .4byte lbl_0001354C
    .4byte lbl_0001354C
    .4byte lbl_00013554
    .4byte lbl_00013554
    .4byte lbl_0001355C
    .4byte lbl_0001355C
    .4byte lbl_00013564
    .4byte lbl_00013564
    .4byte lbl_000132C0
    .4byte lbl_0001356C
    .4byte lbl_000132C0
    .4byte lbl_00013574
    .4byte lbl_000132C0
    .4byte lbl_0001357C
    .4byte lbl_000132C0
    .4byte lbl_00013584
    .4byte lbl_000132C0
    .4byte lbl_0001358C
    .4byte lbl_000132C0
    .4byte lbl_00013594
    .4byte lbl_000132C0
    .4byte lbl_0001359C
    .4byte 0x25730A00
    .asciz ".tpl"
    .balign 4
    .asciz ".gma"
    .balign 4
    .4byte 0x2E2E0000
lbl_000138AC:
    # 0x138AC
    .asciz "%s/%s.tpl"
    .balign 4
lbl_000138B8:
    # 0x138B8
    .asciz "%s/%s.gma"
    .balign 4
    .asciz "Category [%s] Please Load"
    .balign 4
    .asciz "Category [%s] no data\n"
    .balign 4
    .asciz "Category [%s] %d/%d"
    .asciz "name: %s\nrad: %f\n"
    .balign 4
lbl_00013920:
    # 0x13920
    .asciz "Time: %d\n"
    .balign 4
lbl_0001392C:
    # 0x1392C
    .asciz "stage"
    .balign 4
lbl_00013934:
    # 0x13934
    .asciz "minigame"
    .balign 4
    .4byte lbl_00010C60
    .4byte lbl_000132C8
    .4byte lbl_0001392C
    .4byte lbl_00010CD4
    .4byte lbl_00013934
    .4byte lbl_0001359C
lbl_00013958:
    # 0x13958
    .asciz "commend"
lbl_00013960:
    # 0x13960
    .asciz "roll"
    .balign 4
lbl_00013968:
    # 0x13968
    .asciz "pattern"
lbl_00013970:
    # 0x13970
    .asciz "bg_rac"
    .balign 4
lbl_00013978:
    # 0x13978
    .asciz "bg_fig"
    .balign 4
lbl_00013980:
    # 0x13980
    .asciz "bg_pil"
    .balign 4
lbl_00013988:
    # 0x13988
    .asciz "bg_gol"
    .balign 4
lbl_00013990:
    # 0x13990
    .asciz "bg_bow"
    .balign 4
lbl_00013998:
    # 0x13998
    .asciz "bg_bil"
    .balign 4
lbl_000139A0:
    # 0x139A0
    .asciz "bg_mst"
    .balign 4
lbl_000139A8:
    # 0x139A8
    .asciz "bg_ending"
    .balign 4
lbl_000139B4:
    # 0x139B4
    .asciz "st039"
    .balign 4
lbl_000139BC:
    # 0x139BC
    .asciz "st111"
    .balign 4
lbl_000139C4:
    # 0x139C4
    .asciz "st112"
    .balign 4
lbl_000139CC:
    # 0x139CC
    .asciz "st113"
    .balign 4
lbl_000139D4:
    # 0x139D4
    .asciz "st114"
    .balign 4
lbl_000139DC:
    # 0x139DC
    .asciz "st115"
    .balign 4
lbl_000139E4:
    # 0x139E4
    .asciz "st116"
    .balign 4
lbl_000139EC:
    # 0x139EC
    .asciz "st117"
    .balign 4
lbl_000139F4:
    # 0x139F4
    .asciz "st118"
    .balign 4
lbl_000139FC:
    # 0x139FC
    .asciz "st119"
    .balign 4
lbl_00013A04:
    # 0x13A04
    .asciz "st120"
    .balign 4
lbl_00013A0C:
    # 0x13A0C
    .asciz "gor_h"
    .balign 4
lbl_00013A14:
    # 0x13A14
    .asciz "gor_l"
    .balign 4
lbl_00013A1C:
    # 0x13A1C
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00010C60
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013958
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013960
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013968
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132CC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132D4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132DC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132E4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132EC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132F4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132FC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013304
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_0001330C
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013970
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013978
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013980
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013988
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013990
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013998
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000139A0
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000139A8
    .4byte 0x00000002
    .4byte lbl_00010CFC
    .4byte lbl_00010CFC
    .4byte 0x00000002
    .4byte lbl_00010D28
    .4byte lbl_00010D28
    .4byte 0x00000002
    .4byte lbl_00010D54
    .4byte lbl_00010D54
    .4byte 0x00000002
    .4byte lbl_00010D80
    .4byte lbl_00010D80
    .4byte 0x00000002
    .4byte lbl_00010DAC
    .4byte lbl_00010DAC
    .4byte 0x00000002
    .4byte lbl_00010DD8
    .4byte lbl_00010DD8
    .4byte 0x00000002
    .4byte lbl_00010E04
    .4byte lbl_00010E04
    .4byte 0x00000002
    .4byte lbl_00010E30
    .4byte lbl_00010E30
    .4byte 0x00000002
    .4byte lbl_00010E5C
    .4byte lbl_00010E5C
    .4byte 0x00000002
    .4byte lbl_00010E88
    .4byte lbl_00010E88
    .4byte 0x00000002
    .4byte lbl_00010EB4
    .4byte lbl_00010EB4
    .4byte 0x00000002
    .4byte lbl_00010EE0
    .4byte lbl_00010EE0
    .4byte 0x00000002
    .4byte lbl_00010F0C
    .4byte lbl_00010F0C
    .4byte 0x00000002
    .4byte lbl_00010F38
    .4byte lbl_00010F38
    .4byte 0x00000002
    .4byte lbl_00010F64
    .4byte lbl_00010F64
    .4byte 0x00000002
    .4byte lbl_00010F90
    .4byte lbl_00010F90
    .4byte 0x00000002
    .4byte lbl_00010FBC
    .4byte lbl_00010FBC
    .4byte 0x00000002
    .4byte lbl_00010FE8
    .4byte lbl_00010FE8
    .4byte 0x00000002
    .4byte lbl_00011014
    .4byte lbl_00011014
    .4byte 0x00000002
    .4byte lbl_00011040
    .4byte lbl_00011040
    .4byte 0x00000002
    .4byte lbl_0001106C
    .4byte lbl_0001106C
    .4byte 0x00000002
    .4byte lbl_00011098
    .4byte lbl_00011098
    .4byte 0x00000002
    .4byte lbl_000110C4
    .4byte lbl_000110C4
    .4byte 0x00000002
    .4byte lbl_000110F0
    .4byte lbl_000110F0
    .4byte 0x00000002
    .4byte lbl_0001111C
    .4byte lbl_0001111C
    .4byte 0x00000002
    .4byte lbl_00011148
    .4byte lbl_00011148
    .4byte 0x00000002
    .4byte lbl_00011174
    .4byte lbl_00011174
    .4byte 0x00000002
    .4byte lbl_000111A0
    .4byte lbl_000111A0
    .4byte 0x00000002
    .4byte lbl_000111CC
    .4byte lbl_000111CC
    .4byte 0x00000002
    .4byte lbl_000111F8
    .4byte lbl_000111F8
    .4byte 0x00000002
    .4byte lbl_00011224
    .4byte lbl_00011224
    .4byte 0x00000002
    .4byte lbl_00011250
    .4byte lbl_00011250
    .4byte 0x00000002
    .4byte lbl_0001127C
    .4byte lbl_0001127C
    .4byte 0x00000002
    .4byte lbl_000112A8
    .4byte lbl_000112A8
    .4byte 0x00000002
    .4byte lbl_000112D4
    .4byte lbl_000112D4
    .4byte 0x00000002
    .4byte lbl_00011300
    .4byte lbl_00011300
    .4byte 0x00000002
    .4byte lbl_0001132C
    .4byte lbl_0001132C
    .4byte 0x00000002
    .4byte lbl_00011358
    .4byte lbl_00011358
    .4byte 0x00000002
    .4byte lbl_000139B4
    .4byte lbl_000139B4
    .4byte 0x00000002
    .4byte lbl_000113B0
    .4byte lbl_000113B0
    .4byte 0x00000002
    .4byte lbl_000113DC
    .4byte lbl_000113DC
    .4byte 0x00000002
    .4byte lbl_00011408
    .4byte lbl_00011408
    .4byte 0x00000002
    .4byte lbl_00011434
    .4byte lbl_00011434
    .4byte 0x00000002
    .4byte lbl_00011460
    .4byte lbl_00011460
    .4byte 0x00000002
    .4byte lbl_0001148C
    .4byte lbl_0001148C
    .4byte 0x00000002
    .4byte lbl_000114B8
    .4byte lbl_000114B8
    .4byte 0x00000002
    .4byte lbl_000114E4
    .4byte lbl_000114E4
    .4byte 0x00000002
    .4byte lbl_00011510
    .4byte lbl_00011510
    .4byte 0x00000002
    .4byte lbl_00011384
    .4byte lbl_00011384
    .4byte 0x00000002
    .4byte lbl_0001153C
    .4byte lbl_0001153C
    .4byte 0x00000002
    .4byte lbl_00011568
    .4byte lbl_00011568
    .4byte 0x00000002
    .4byte lbl_00011594
    .4byte lbl_00011594
    .4byte 0x00000002
    .4byte lbl_000115C0
    .4byte lbl_000115C0
    .4byte 0x00000002
    .4byte lbl_000115EC
    .4byte lbl_000115EC
    .4byte 0x00000002
    .4byte lbl_00011618
    .4byte lbl_00011618
    .4byte 0x00000002
    .4byte lbl_00011644
    .4byte lbl_00011644
    .4byte 0x00000002
    .4byte lbl_00011670
    .4byte lbl_00011670
    .4byte 0x00000002
    .4byte lbl_0001169C
    .4byte lbl_0001169C
    .4byte 0x00000002
    .4byte lbl_000116C8
    .4byte lbl_000116C8
    .4byte 0x00000002
    .4byte lbl_000116F4
    .4byte lbl_000116F4
    .4byte 0x00000002
    .4byte lbl_00011720
    .4byte lbl_00011720
    .4byte 0x00000002
    .4byte lbl_0001174C
    .4byte lbl_0001174C
    .4byte 0x00000002
    .4byte lbl_00011778
    .4byte lbl_00011778
    .4byte 0x00000002
    .4byte lbl_000117A4
    .4byte lbl_000117A4
    .4byte 0x00000002
    .4byte lbl_000117D0
    .4byte lbl_000117D0
    .4byte 0x00000002
    .4byte lbl_000117FC
    .4byte lbl_000117FC
    .4byte 0x00000002
    .4byte lbl_00011828
    .4byte lbl_00011828
    .4byte 0x00000002
    .4byte lbl_00011854
    .4byte lbl_00011854
    .4byte 0x00000002
    .4byte lbl_00011880
    .4byte lbl_00011880
    .4byte 0x00000002
    .4byte lbl_000118AC
    .4byte lbl_000118AC
    .4byte 0x00000002
    .4byte lbl_000118D8
    .4byte lbl_000118D8
    .4byte 0x00000002
    .4byte lbl_00011904
    .4byte lbl_00011904
    .4byte 0x00000002
    .4byte lbl_00011930
    .4byte lbl_00011930
    .4byte 0x00000002
    .4byte lbl_0001195C
    .4byte lbl_0001195C
    .4byte 0x00000002
    .4byte lbl_00011988
    .4byte lbl_00011988
    .4byte 0x00000002
    .4byte lbl_000119B4
    .4byte lbl_000119B4
    .4byte 0x00000002
    .4byte lbl_000119E0
    .4byte lbl_000119E0
    .4byte 0x00000002
    .4byte lbl_00011A0C
    .4byte lbl_00011A0C
    .4byte 0x00000002
    .4byte lbl_00011A38
    .4byte lbl_00011A38
    .4byte 0x00000002
    .4byte lbl_00011A64
    .4byte lbl_00011A64
    .4byte 0x00000002
    .4byte lbl_00011A90
    .4byte lbl_00011A90
    .4byte 0x00000002
    .4byte lbl_00011ABC
    .4byte lbl_00011ABC
    .4byte 0x00000002
    .4byte lbl_00011AE8
    .4byte lbl_00011AE8
    .4byte 0x00000002
    .4byte lbl_00011B14
    .4byte lbl_00011B14
    .4byte 0x00000002
    .4byte lbl_00011B40
    .4byte lbl_00011B40
    .4byte 0x00000002
    .4byte lbl_00011B6C
    .4byte lbl_00011B6C
    .4byte 0x00000002
    .4byte lbl_00011B98
    .4byte lbl_00011B98
    .4byte 0x00000002
    .4byte lbl_00011BC4
    .4byte lbl_00011BC4
    .4byte 0x00000002
    .4byte lbl_00011BF0
    .4byte lbl_00011BF0
    .4byte 0x00000002
    .4byte lbl_00011C1C
    .4byte lbl_00011C1C
    .4byte 0x00000002
    .4byte lbl_00011C48
    .4byte lbl_00011C48
    .4byte 0x00000002
    .4byte lbl_00011C74
    .4byte lbl_00011C74
    .4byte 0x00000002
    .4byte lbl_00011CA0
    .4byte lbl_00011CA0
    .4byte 0x00000002
    .4byte lbl_00011CCC
    .4byte lbl_00011CCC
    .4byte 0x00000002
    .4byte lbl_00011CF8
    .4byte lbl_00011CF8
    .4byte 0x00000002
    .4byte lbl_00011D24
    .4byte lbl_00011D24
    .4byte 0x00000002
    .4byte lbl_00011D50
    .4byte lbl_00011D50
    .4byte 0x00000002
    .4byte lbl_00011D7C
    .4byte lbl_00011D7C
    .4byte 0x00000002
    .4byte lbl_00011DA8
    .4byte lbl_00011DA8
    .4byte 0x00000002
    .4byte lbl_00011DD4
    .4byte lbl_00011DD4
    .4byte 0x00000002
    .4byte lbl_00011E00
    .4byte lbl_00011E00
    .4byte 0x00000002
    .4byte lbl_00011E2C
    .4byte lbl_00011E2C
    .4byte 0x00000002
    .4byte lbl_00011E58
    .4byte lbl_00011E58
    .4byte 0x00000002
    .4byte lbl_00011E84
    .4byte lbl_00011E84
    .4byte 0x00000002
    .4byte lbl_00011EB0
    .4byte lbl_00011EB0
    .4byte 0x00000002
    .4byte lbl_00011EDC
    .4byte lbl_00011EDC
    .4byte 0x00000002
    .4byte lbl_00011F08
    .4byte lbl_00011F08
    .4byte 0x00000002
    .4byte lbl_00011F34
    .4byte lbl_00011F34
    .4byte 0x00000002
    .4byte lbl_00011F60
    .4byte lbl_00011F60
    .4byte 0x00000002
    .4byte lbl_00011F8C
    .4byte lbl_00011F8C
    .4byte 0x00000002
    .4byte lbl_000139BC
    .4byte lbl_000139BC
    .4byte 0x00000002
    .4byte lbl_000139C4
    .4byte lbl_000139C4
    .4byte 0x00000002
    .4byte lbl_000139CC
    .4byte lbl_000139CC
    .4byte 0x00000002
    .4byte lbl_000139D4
    .4byte lbl_000139D4
    .4byte 0x00000002
    .4byte lbl_000139DC
    .4byte lbl_000139DC
    .4byte 0x00000002
    .4byte lbl_000139E4
    .4byte lbl_000139E4
    .4byte 0x00000002
    .4byte lbl_000139EC
    .4byte lbl_000139EC
    .4byte 0x00000002
    .4byte lbl_000139F4
    .4byte lbl_000139F4
    .4byte 0x00000002
    .4byte lbl_000139FC
    .4byte lbl_000139FC
    .4byte 0x00000002
    .4byte lbl_00013A04
    .4byte lbl_00013A04
    .4byte 0x00000002
    .4byte lbl_00011FB8
    .4byte lbl_00011FB8
    .4byte 0x00000002
    .4byte lbl_00011FE4
    .4byte lbl_00011FE4
    .4byte 0x00000002
    .4byte lbl_00012010
    .4byte lbl_00012010
    .4byte 0x00000002
    .4byte lbl_0001203C
    .4byte lbl_0001203C
    .4byte 0x00000002
    .4byte lbl_00012068
    .4byte lbl_00012068
    .4byte 0x00000002
    .4byte lbl_00012094
    .4byte lbl_00012094
    .4byte 0x00000002
    .4byte lbl_000120C0
    .4byte lbl_000120C0
    .4byte 0x00000002
    .4byte lbl_000120EC
    .4byte lbl_000120EC
    .4byte 0x00000002
    .4byte lbl_00012118
    .4byte lbl_00012118
    .4byte 0x00000002
    .4byte lbl_00012144
    .4byte lbl_00012144
    .4byte 0x00000002
    .4byte lbl_00013314
    .4byte lbl_00013314
    .4byte 0x00000002
    .4byte lbl_0001331C
    .4byte lbl_0001331C
    .4byte 0x00000002
    .4byte lbl_00013324
    .4byte lbl_00013324
    .4byte 0x00000002
    .4byte lbl_00012170
    .4byte lbl_00012170
    .4byte 0x00000002
    .4byte lbl_0001332C
    .4byte lbl_0001332C
    .4byte 0x00000002
    .4byte lbl_00013334
    .4byte lbl_00013334
    .4byte 0x00000002
    .4byte lbl_0001333C
    .4byte lbl_0001333C
    .4byte 0x00000002
    .4byte lbl_00013344
    .4byte lbl_00013344
    .4byte 0x00000002
    .4byte lbl_0001334C
    .4byte lbl_0001334C
    .4byte 0x00000002
    .4byte lbl_00013354
    .4byte lbl_00013354
    .4byte 0x00000002
    .4byte lbl_0001335C
    .4byte lbl_0001335C
    .4byte 0x00000002
    .4byte lbl_00013364
    .4byte lbl_00013364
    .4byte 0x00000002
    .4byte lbl_0001336C
    .4byte lbl_0001336C
    .4byte 0x00000002
    .4byte lbl_00013374
    .4byte lbl_00013374
    .4byte 0x00000002
    .4byte lbl_0001337C
    .4byte lbl_0001337C
    .4byte 0x00000002
    .4byte lbl_00013384
    .4byte lbl_00013384
    .4byte 0x00000002
    .4byte lbl_0001338C
    .4byte lbl_0001338C
    .4byte 0x00000002
    .4byte lbl_00013394
    .4byte lbl_00013394
    .4byte 0x00000002
    .4byte lbl_0001339C
    .4byte lbl_0001339C
    .4byte 0x00000002
    .4byte lbl_000133A4
    .4byte lbl_000133A4
    .4byte 0x00000002
    .4byte lbl_000133AC
    .4byte lbl_000133AC
    .4byte 0x00000002
    .4byte lbl_000133B4
    .4byte lbl_000133B4
    .4byte 0x00000002
    .4byte lbl_000133BC
    .4byte lbl_000133BC
    .4byte 0x00000002
    .4byte lbl_000133C4
    .4byte lbl_000133C4
    .4byte 0x00000002
    .4byte lbl_000133CC
    .4byte lbl_000133CC
    .4byte 0x00000002
    .4byte lbl_000133D4
    .4byte lbl_000133D4
    .4byte 0x00000002
    .4byte lbl_000133DC
    .4byte lbl_000133DC
    .4byte 0x00000002
    .4byte lbl_000133E4
    .4byte lbl_000133E4
    .4byte 0x00000002
    .4byte lbl_000133EC
    .4byte lbl_000133EC
    .4byte 0x00000002
    .4byte lbl_000133F4
    .4byte lbl_000133F4
    .4byte 0x00000002
    .4byte lbl_000133FC
    .4byte lbl_000133FC
    .4byte 0x00000002
    .4byte lbl_00013404
    .4byte lbl_00013404
    .4byte 0x00000002
    .4byte lbl_0001340C
    .4byte lbl_0001340C
    .4byte 0x00000002
    .4byte lbl_00013414
    .4byte lbl_00013414
    .4byte 0x00000002
    .4byte lbl_0001341C
    .4byte lbl_0001341C
    .4byte 0x00000002
    .4byte lbl_00013424
    .4byte lbl_00013424
    .4byte 0x00000002
    .4byte lbl_0001342C
    .4byte lbl_0001342C
    .4byte 0x00000002
    .4byte lbl_00013434
    .4byte lbl_00013434
    .4byte 0x00000002
    .4byte lbl_0001343C
    .4byte lbl_0001343C
    .4byte 0x00000002
    .4byte lbl_00013444
    .4byte lbl_00013444
    .4byte 0x00000002
    .4byte lbl_0001344C
    .4byte lbl_0001344C
    .4byte 0x00000002
    .4byte lbl_00013454
    .4byte lbl_00013454
    .4byte 0x00000002
    .4byte lbl_0001345C
    .4byte lbl_0001345C
    .4byte 0x00000002
    .4byte lbl_00013464
    .4byte lbl_00013464
    .4byte 0x00000002
    .4byte lbl_0001346C
    .4byte lbl_0001346C
    .4byte 0x00000002
    .4byte lbl_00013474
    .4byte lbl_00013474
    .4byte 0x00000002
    .4byte lbl_0001347C
    .4byte lbl_0001347C
    .4byte 0x00000002
    .4byte lbl_00013484
    .4byte lbl_00013484
    .4byte 0x00000002
    .4byte lbl_0001348C
    .4byte lbl_0001348C
    .4byte 0x00000002
    .4byte lbl_00013494
    .4byte lbl_00013494
    .4byte 0x00000002
    .4byte lbl_0001349C
    .4byte lbl_0001349C
    .4byte 0x00000002
    .4byte lbl_000134A4
    .4byte lbl_000134A4
    .4byte 0x00000002
    .4byte lbl_000134AC
    .4byte lbl_000134AC
    .4byte 0x00000002
    .4byte lbl_000134B4
    .4byte lbl_000134B4
    .4byte 0x00000002
    .4byte lbl_000134BC
    .4byte lbl_000134BC
    .4byte 0x00000002
    .4byte lbl_000134C4
    .4byte lbl_000134C4
    .4byte 0x00000002
    .4byte lbl_000134CC
    .4byte lbl_000134CC
    .4byte 0x00000002
    .4byte lbl_000134D4
    .4byte lbl_000134D4
    .4byte 0x00000002
    .4byte lbl_000134DC
    .4byte lbl_000134DC
    .4byte 0x00000002
    .4byte lbl_00013494
    .4byte lbl_000134E4
    .4byte 0x00000002
    .4byte lbl_000134EC
    .4byte lbl_000134EC
    .4byte 0x00000002
    .4byte lbl_000134F4
    .4byte lbl_000134F4
    .4byte 0x00000002
    .4byte lbl_000134FC
    .4byte lbl_000134FC
    .4byte 0x00000002
    .4byte lbl_00013504
    .4byte lbl_00013504
    .4byte 0x00000002
    .4byte lbl_0001350C
    .4byte lbl_0001350C
    .4byte 0x00000002
    .4byte lbl_00013514
    .4byte lbl_00013514
    .4byte 0x00000002
    .4byte lbl_0001351C
    .4byte lbl_0001351C
    .4byte 0x00000002
    .4byte lbl_00013524
    .4byte lbl_00013524
    .4byte 0x00000002
    .4byte lbl_0001352C
    .4byte lbl_0001352C
    .4byte 0x00000002
    .4byte lbl_00013534
    .4byte lbl_00013534
    .4byte 0x00000003
    .4byte lbl_0001353C
    .4byte lbl_0001353C
    .4byte 0x00000003
    .4byte lbl_00013544
    .4byte lbl_00013544
    .4byte 0x00000003
    .4byte lbl_0001354C
    .4byte lbl_0001354C
    .4byte 0x00000003
    .4byte lbl_00013554
    .4byte lbl_00013554
    .4byte 0x00000003
    .4byte lbl_0001355C
    .4byte lbl_0001355C
    .4byte 0x00000003
    .4byte lbl_00013564
    .4byte lbl_00013564
    .4byte 0x00000003
    .4byte lbl_00013A0C
    .4byte lbl_00013A0C
    .4byte 0x00000003
    .4byte lbl_00013A14
    .4byte lbl_00013A14
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001356C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013574
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001357C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013584
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001358C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013594
    .4byte 0x00000005
    .4byte lbl_000132C0
    .4byte lbl_0001359C
    .asciz "[ Category ]"
    .balign 4
    .asciz "A    : Select\n"
    .balign 4
    .asciz "B    : Cancel\n"
    .balign 4
    .4byte 0x5041441E
    .4byte 0x1F3A2043
    .asciz "ategory Select\n"
    .asciz "B    : Category Select\n"
    .4byte 0x5041441D
    .4byte 0x1C3A204D
    .asciz "odel Select"
    .asciz "Z  : "
    .balign 4
    .asciz "Fix Scale"
    .balign 4
    .asciz "Z  : Variable Scale"
    .asciz "    All Disp Mode\n"
    .balign 4
    .asciz "X+A: Normal Mode"
    .balign 4
    .asciz "X+A: All Disp Mode"
    .balign 4
    .4byte 0x252D3873
    .4byte 0x1C000000
    .asciz "%-8s"
    .balign 4
    .4byte 0x1E000000
    .4byte 0x1F000000
    .asciz " no data."
    .balign 4
    .asciz " [%d/%d] %-8s"
    .balign 4
lbl_00014638:
    # 0x14638
    .asciz "rad: %-3.6f     "
    .balign 4
    .asciz "cannot OSAlloc\n"
    .asciz "pattern.tpl"
    .asciz "pattern.gma"
    .asciz "speed: "
    .4byte 0x25640000
    .asciz "%s * %2d\n"
    .balign 4
lbl_0001468C:
    # 0x1468C
    .asciz "ROMFONT TEST\n"
    .balign 4
lbl_0001469C:
    # 0x1469C
    .asciz "code: %04X\n"
lbl_000146A8:
    # 0x146A8
    .asciz "COMPETITION"
lbl_000146B4:
    # 0x146B4
    .asciz "COMPETITION ICON"
    .balign 4
lbl_000146C8:
    # 0x146C8
    .asciz "PRACTICE"
    .balign 4
lbl_000146D4:
    # 0x146D4
    .asciz "RACE REGULAR"
    .balign 4
lbl_000146E4:
    # 0x146E4
    .asciz "RECE BIG"
    .balign 4
lbl_000146F0:
    # 0x146F0
    .asciz "FIGHT"
    .balign 4
lbl_000146F8:
    # 0x146F8
    .asciz "FIGHT ICON"
    .balign 4
lbl_00014704:
    # 0x14704
    .asciz "BANNER"
    .balign 4
lbl_0001470C:
    # 0x1470C
    .asciz "UNDER"
    .balign 4
lbl_00014714:
    # 0x14714
    .4byte lbl_000146A8
    .4byte 0x00C00084
    .4byte 0x00000000
    .4byte lbl_000146B4
    .4byte 0x0026001A
    .4byte 0x00000000
    .4byte lbl_000146C8
    .4byte 0x00C000B2
    .4byte 0x00000000
    .4byte lbl_000146D4
    .4byte 0x00600044
    .4byte 0x00000000
    .4byte lbl_000146E4
    .4byte 0x00C8008C
    .4byte 0x00000000
    .4byte lbl_000146F0
    .4byte 0x00AC0078
    .4byte 0x00000000
    .4byte lbl_000146F8
    .4byte 0x003C002A
    .4byte 0x00000000
    .4byte lbl_00014704
    .4byte 0x00600020
    .4byte 0x00000000
    .4byte lbl_0001470C
    .4byte 0x008C008C
    .4byte 0x00000001
    .asciz "Cannot OSAlloc\n"
    .asciz "/p006/prj006/youske/preview/%dx%d/st%03d.gct"
    .balign 4
    .asciz "Cannot USBopen\n"
    .asciz "PRREND TEST"
    .asciz "[ %3dx%3d ] %s"
    .balign 4
lbl_000147EC:
    # 0x147EC
    .asciz "preview/%dx%d.tpl"
    .balign 4
    .asciz " [ %3d / 200 ]"
    .balign 4
lbl_00014810:
    # 0x14810
    .4byte lbl_000090B8
    .4byte lbl_00009324
    .4byte lbl_00009324
    .4byte lbl_00009324
    .4byte lbl_000090C0
    .4byte lbl_00009324
    .4byte lbl_000090C8
    .4byte lbl_00009324
    .4byte lbl_000090D0
    .4byte lbl_00009324
    .4byte lbl_000091D4
    .4byte lbl_00009324
    .4byte lbl_000091FC
    .4byte lbl_00009324
    .4byte lbl_00009204
    .4byte lbl_00009324
    .4byte lbl_0000920C
    .4byte lbl_00009324
    .4byte lbl_000092C0
    .4byte lbl_00009324
    .4byte lbl_000092C8
    .4byte lbl_00009324
    .4byte lbl_000092D0
    .4byte lbl_00009324
    .4byte lbl_000092D8
    .4byte lbl_00009324
    .4byte lbl_00009324
    .4byte lbl_000092F8
    .4byte lbl_00009324
    .4byte lbl_00009300
    .4byte lbl_00009324
    .4byte lbl_00009308
    .4byte lbl_00009324
    .4byte lbl_00009310
    .4byte lbl_00009324
    .4byte lbl_00009318
    .4byte lbl_00009324
    .4byte lbl_00009320
lbl_000148A8:
    # 0x148A8
    .asciz "FOCUS TEST\n"
    .asciz "MASK NUM:%d\n"
    .balign 4
    .asciz "BLUR    :%7.3f\n"
    .4byte 0x00000000
lbl_000148D8:
    # 0x148D8
    .asciz "takatest.tpl"
    .balign 4
lbl_000148E8:
    # 0x148E8
    .asciz "Move"
    .balign 4
lbl_000148F0:
    # 0x148F0
    .asciz "Suspend"
lbl_000148F8:
    # 0x148F8
    .asciz "Special"
lbl_00014900:
    # 0x14900
    .asciz "Drop"
    .balign 4
lbl_00014908:
    # 0x14908
    .asciz "Coli"
    .balign 4
lbl_00014910:
    # 0x14910
    .asciz "Goal"
    .balign 4
lbl_00014918:
    # 0x14918
    .asciz "Advertise"
    .balign 4
lbl_00014924:
    # 0x14924
    .asciz "Ending"
    .balign 4
lbl_0001492C:
    # 0x1492C
    .asciz "Selector"
    .balign 4
lbl_00014938:
    # 0x14938
    .asciz "Lose"
    .balign 4
lbl_00014940:
    # 0x14940
    .4byte 0x45746300
lbl_00014944:
    # 0x14944
    .asciz "Race&Fight"
    .balign 4
lbl_00014950:
    # 0x14950
    .asciz "Pilot"
    .balign 4
lbl_00014958:
    # 0x14958
    .asciz "Golf"
    .balign 4
lbl_00014960:
    # 0x14960
    .asciz "Bowling"
lbl_00014968:
    # 0x14968
    .asciz "Billiard"
    .balign 4
lbl_00014974:
    # 0x14974
    .4byte lbl_000148E8
    .4byte lbl_000148F0
    .4byte lbl_000148F8
    .4byte lbl_00014900
    .4byte lbl_00014908
    .4byte lbl_00014910
    .4byte lbl_00014918
    .4byte lbl_00014924
    .4byte lbl_0001492C
    .4byte lbl_00014938
    .4byte lbl_00014940
    .4byte lbl_00014944
    .4byte lbl_00014950
    .4byte lbl_00014958
    .4byte lbl_00014960
    .4byte lbl_00014968
    .4byte 0x00000000
lbl_000149B8:
    # 0x149B8
    .asciz "Very Snail"
    .balign 4
lbl_000149C4:
    # 0x149C4
    .asciz "Snail"
    .balign 4
lbl_000149CC:
    # 0x149CC
    .asciz "Very Slow"
    .balign 4
lbl_000149D8:
    # 0x149D8
    .asciz "More Slow"
    .balign 4
lbl_000149E4:
    # 0x149E4
    .asciz "Slow Walk"
    .balign 4
lbl_000149F0:
    # 0x149F0
    .asciz "Walk"
    .balign 4
lbl_000149F8:
    # 0x149F8
    .asciz "Speedy Walk"
lbl_00014A04:
    # 0x14A04
    .asciz "Fast Walk"
    .balign 4
lbl_00014A10:
    # 0x14A10
    .asciz "Harried Step"
    .balign 4
lbl_00014A20:
    # 0x14A20
    .4byte 0x52756E00
lbl_00014A24:
    # 0x14A24
    .asciz "Harried Run"
lbl_00014A30:
    # 0x14A30
    .asciz "Fast Run"
    .balign 4
lbl_00014A3C:
    # 0x14A3C
    .asciz "All One's Power"
lbl_00014A4C:
    # 0x14A4C
    .asciz "Back Step"
    .balign 4
lbl_00014A58:
    # 0x14A58
    .4byte lbl_000149B8
    .4byte lbl_000149C4
    .4byte lbl_000149CC
    .4byte lbl_000149D8
    .4byte lbl_000149E4
    .4byte lbl_000149F0
    .4byte lbl_000149F8
    .4byte lbl_00014A04
    .4byte lbl_00014A10
    .4byte lbl_00014A20
    .4byte lbl_00014A24
    .4byte lbl_00014A30
    .4byte lbl_00014A3C
    .4byte lbl_00014A4C
    .4byte 0x00000000
lbl_00014A94:
    # 0x14A94
    .asciz "Blink"
    .balign 4
lbl_00014A9C:
    # 0x14A9C
    .asciz "Looking"
lbl_00014AA4:
    # 0x14AA4
    .asciz "Appeal"
    .balign 4
lbl_00014AAC:
    # 0x14AAC
    .asciz "Sulk"
    .balign 4
lbl_00014AB4:
    # 0x14AB4
    .asciz "Sulk Sit"
    .balign 4
lbl_00014AC0:
    # 0x14AC0
    .asciz "Continue?"
    .balign 4
lbl_00014ACC:
    # 0x14ACC
    .4byte lbl_00014A94
    .4byte lbl_00014A9C
    .4byte lbl_00014AA4
    .4byte lbl_00014AAC
    .4byte lbl_00014AB4
    .4byte lbl_00014AC0
    .4byte 0x00000000
lbl_00014AE8:
    # 0x14AE8
    .asciz "Caution Front Stop"
    .balign 4
lbl_00014AFC:
    # 0x14AFC
    .asciz "Caution Front Walk"
    .balign 4
lbl_00014B10:
    # 0x14B10
    .asciz "Caution Front Run"
    .balign 4
lbl_00014B24:
    # 0x14B24
    .asciz "Caution Back  Stop"
    .balign 4
lbl_00014B38:
    # 0x14B38
    .asciz "Caution Back  Walk"
    .balign 4
lbl_00014B4C:
    # 0x14B4C
    .asciz "Caution Back  Run"
    .balign 4
lbl_00014B60:
    # 0x14B60
    .asciz "Caution Left  Stop"
    .balign 4
lbl_00014B74:
    # 0x14B74
    .asciz "Caution Left  Walk"
    .balign 4
lbl_00014B88:
    # 0x14B88
    .asciz "Caution Left  Run"
    .balign 4
lbl_00014B9C:
    # 0x14B9C
    .asciz "Caution Right Stop"
    .balign 4
lbl_00014BB0:
    # 0x14BB0
    .asciz "Caution Right Walk"
    .balign 4
lbl_00014BC4:
    # 0x14BC4
    .asciz "Caution Right Run"
    .balign 4
lbl_00014BD8:
    # 0x14BD8
    .asciz "Start"
    .balign 4
lbl_00014BE0:
    # 0x14BE0
    .asciz "Continue Accept"
lbl_00014BF0:
    # 0x14BF0
    .asciz "Name Entry"
    .balign 4
lbl_00014BFC:
    # 0x14BFC
    .asciz "Bonus Stage"
lbl_00014C08:
    # 0x14C08
    .asciz "Continue GiveUp"
lbl_00014C18:
    # 0x14C18
    .4byte lbl_00014AE8
    .4byte lbl_00014AFC
    .4byte lbl_00014B10
    .4byte lbl_00014B24
    .4byte lbl_00014B38
    .4byte lbl_00014B4C
    .4byte lbl_00014B60
    .4byte lbl_00014B74
    .4byte lbl_00014B88
    .4byte lbl_00014B9C
    .4byte lbl_00014BB0
    .4byte lbl_00014BC4
    .4byte lbl_00014BD8
    .4byte lbl_00014BE0
    .4byte lbl_00014BF0
    .4byte lbl_00014BFC
    .4byte lbl_00014C08
    .4byte 0x00000000
lbl_00014C60:
    # 0x14C60
    .asciz "Standard Drop"
    .balign 4
lbl_00014C70:
    # 0x14C70
    .4byte lbl_00014C60
    .4byte 0x00000000
lbl_00014C78:
    # 0x14C78
    .asciz "Slowly Hit"
    .balign 4
lbl_00014C84:
    # 0x14C84
    .asciz "Normal Hit"
    .balign 4
lbl_00014C90:
    # 0x14C90
    .asciz "Hispeed Hit"
lbl_00014C9C:
    # 0x14C9C
    .asciz "Crash"
    .balign 4
lbl_00014CA4:
    # 0x14CA4
    .4byte lbl_00014C78
    .4byte lbl_00014C84
    .4byte lbl_00014C90
    .4byte lbl_00014C9C
    .4byte 0x00000000
lbl_00014CB8:
    # 0x14CB8
    .asciz "Rank 1 Loop"
lbl_00014CC4:
    # 0x14CC4
    .asciz "Rank 1"
    .balign 4
lbl_00014CCC:
    # 0x14CCC
    .asciz "Rank 2 Loop"
lbl_00014CD8:
    # 0x14CD8
    .asciz "Rank 2"
    .balign 4
lbl_00014CE0:
    # 0x14CE0
    .asciz "Rank 3 Loop"
lbl_00014CEC:
    # 0x14CEC
    .asciz "Rank 3"
    .balign 4
lbl_00014CF4:
    # 0x14CF4
    .asciz "Rank 4 Loop"
lbl_00014D00:
    # 0x14D00
    .asciz "Rank 4"
    .balign 4
lbl_00014D08:
    # 0x14D08
    .asciz "Rank 5 Loop"
lbl_00014D14:
    # 0x14D14
    .asciz "Rank 5"
    .balign 4
lbl_00014D1C:
    # 0x14D1C
    .asciz "Warp Loop"
    .balign 4
lbl_00014D28:
    # 0x14D28
    .asciz "Warp"
    .balign 4
lbl_00014D30:
    # 0x14D30
    .asciz "No Miss Clear"
    .balign 4
lbl_00014D40:
    # 0x14D40
    .4byte lbl_00014CB8
    .4byte lbl_00014CC4
    .4byte lbl_00014CCC
    .4byte lbl_00014CD8
    .4byte lbl_00014CE0
    .4byte lbl_00014CEC
    .4byte lbl_00014CF4
    .4byte lbl_00014D00
    .4byte lbl_00014D08
    .4byte lbl_00014D14
    .4byte lbl_00014D1C
    .4byte lbl_00014D28
    .4byte lbl_00014D30
    .4byte 0x00000000
lbl_00014D78:
    # 0x14D78
    .asciz "BLUESKY 00"
    .balign 4
lbl_00014D84:
    # 0x14D84
    .asciz "NIGHT 00"
    .balign 4
lbl_00014D90:
    # 0x14D90
    .asciz "ICE SAMUI START"
lbl_00014DA0:
    # 0x14DA0
    .asciz "ICE SAMUI LOOP"
    .balign 4
lbl_00014DB0:
    # 0x14DB0
    .asciz "ICE SAMUI & SLIP"
    .balign 4
lbl_00014DC4:
    # 0x14DC4
    .asciz "ICE STOP"
    .balign 4
lbl_00014DD0:
    # 0x14DD0
    .asciz "SABAKU WALK 00"
    .balign 4
lbl_00014DE0:
    # 0x14DE0
    .asciz "SABAKU WALK 01"
    .balign 4
lbl_00014DF0:
    # 0x14DF0
    .asciz "SABAKU SIT"
    .balign 4
lbl_00014DFC:
    # 0x14DFC
    .asciz "DRF WALK START"
    .balign 4
lbl_00014E0C:
    # 0x14E0C
    .asciz "DRF STOP"
    .balign 4
lbl_00014E18:
    # 0x14E18
    .asciz "DRF BIKKURI"
lbl_00014E24:
    # 0x14E24
    .asciz "BALL RUN"
    .balign 4
lbl_00014E30:
    # 0x14E30
    .asciz "SPACE"
    .balign 4
lbl_00014E38:
    # 0x14E38
    .asciz "tmp 2"
    .balign 4
lbl_00014E40:
    # 0x14E40
    .asciz "tmp 3"
    .balign 4
lbl_00014E48:
    # 0x14E48
    .4byte lbl_00014D78
    .4byte lbl_00014D84
    .4byte lbl_00014D90
    .4byte lbl_00014DA0
    .4byte lbl_00014DB0
    .4byte lbl_00014DC4
    .4byte lbl_00014DD0
    .4byte lbl_00014DE0
    .4byte lbl_00014DF0
    .4byte lbl_00014DFC
    .4byte lbl_00014E0C
    .4byte lbl_00014E18
    .4byte lbl_00014E24
    .4byte lbl_00014E30
    .4byte lbl_00014E38
    .4byte lbl_00014E40
    .4byte 0x00000000
lbl_00014E8C:
    # 0x14E8C
    .asciz "Stand"
    .balign 4
lbl_00014E94:
    # 0x14E94
    .asciz "Decide"
    .balign 4
lbl_00014E9C:
    # 0x14E9C
    .asciz "Start chara on"
    .balign 4
lbl_00014EAC:
    # 0x14EAC
    .asciz "Start chara off"
lbl_00014EBC:
    # 0x14EBC
    .asciz "Select"
    .balign 4
lbl_00014EC4:
    # 0x14EC4
    .asciz "No select"
    .balign 4
lbl_00014ED0:
    # 0x14ED0
    .4byte lbl_00014E8C
    .4byte lbl_00014E94
    .4byte lbl_00014E9C
    .4byte lbl_00014EAC
    .4byte lbl_00014EBC
    .4byte lbl_00014EC4
    .4byte 0x00000000
lbl_00014EEC:
    # 0x14EEC
    .asciz "Bonus Failed"
    .balign 4
lbl_00014EFC:
    # 0x14EFC
    .asciz "Time Over"
    .balign 4
lbl_00014F08:
    # 0x14F08
    .asciz "Battle Lose"
lbl_00014F14:
    # 0x14F14
    .asciz "Battle Lose2"
    .balign 4
lbl_00014F24:
    # 0x14F24
    .4byte lbl_00014EEC
    .4byte lbl_00014EFC
    .4byte lbl_00014F08
    .4byte lbl_00014F14
    .4byte lbl_00014938
    .4byte lbl_00014938
    .4byte 0x00000000
lbl_00014F40:
    # 0x14F40
    .asciz "Winner"
    .balign 4
lbl_00014F48:
    # 0x14F48
    .4byte 0x326E6400
lbl_00014F4C:
    # 0x14F4C
    .4byte 0x33726400
lbl_00014F50:
    # 0x14F50
    .4byte 0x34746800
lbl_00014F54:
    # 0x14F54
    .asciz "Self Attack"
lbl_00014F60:
    # 0x14F60
    .asciz "Winner2"
lbl_00014F68:
    # 0x14F68
    .asciz "2nd2"
    .balign 4
lbl_00014F70:
    # 0x14F70
    .asciz "3rd2"
    .balign 4
lbl_00014F78:
    # 0x14F78
    .asciz "4th2"
    .balign 4
lbl_00014F80:
    # 0x14F80
    .asciz "reserve5"
    .balign 4
lbl_00014F8C:
    # 0x14F8C
    .asciz "reserve6"
    .balign 4
lbl_00014F98:
    # 0x14F98
    .asciz "reserve7"
    .balign 4
lbl_00014FA4:
    # 0x14FA4
    .asciz "reserve8"
    .balign 4
lbl_00014FB0:
    # 0x14FB0
    .asciz "reserve9"
    .balign 4
lbl_00014FBC:
    # 0x14FBC
    .4byte lbl_00014F40
    .4byte lbl_00014F48
    .4byte lbl_00014F4C
    .4byte lbl_00014F50
    .4byte lbl_00014F54
    .4byte lbl_00014F60
    .4byte lbl_00014F68
    .4byte lbl_00014F70
    .4byte lbl_00014F78
    .4byte 0x00000000
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte lbl_00014FB0
    .4byte 0x00000000
lbl_00014FFC:
    # 0x14FFC
    .asciz "crouching"
    .balign 4
lbl_00015008:
    # 0x15008
    .asciz "banana slip"
lbl_00015014:
    # 0x15014
    .asciz "caught down"
lbl_00015020:
    # 0x15020
    .asciz "burned"
    .balign 4
lbl_00015028:
    # 0x15028
    .asciz "benumbed"
    .balign 4
lbl_00015034:
    # 0x15034
    .asciz "first"
    .balign 4
lbl_0001503C:
    # 0x1503C
    .asciz "get set!"
    .balign 4
lbl_00015048:
    # 0x15048
    .asciz "banana slip loop"
    .balign 4
lbl_0001505C:
    # 0x1505C
    .asciz "caught down loop"
    .balign 4
lbl_00015070:
    # 0x15070
    .asciz "reserve1"
    .balign 4
lbl_0001507C:
    # 0x1507C
    .asciz "reserve2"
    .balign 4
lbl_00015088:
    # 0x15088
    .asciz "reserve3"
    .balign 4
lbl_00015094:
    # 0x15094
    .asciz "reserve4"
    .balign 4
lbl_000150A0:
    # 0x150A0
    .4byte lbl_00014FFC
    .4byte lbl_00015008
    .4byte lbl_00015014
    .4byte lbl_00015020
    .4byte lbl_00015028
    .4byte lbl_00015034
    .4byte lbl_00014F48
    .4byte lbl_00014F4C
    .4byte lbl_00014F50
    .4byte lbl_0001503C
    .4byte lbl_00015048
    .4byte lbl_0001505C
    .4byte 0x00000000
    .4byte lbl_00015070
    .4byte lbl_0001507C
    .4byte lbl_00015088
    .4byte lbl_00015094
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte 0x00000000
lbl_000150F8:
    # 0x150F8
    .asciz "flight-flight"
    .balign 4
lbl_00015108:
    # 0x15108
    .asciz "flight-in ball"
    .balign 4
lbl_00015118:
    # 0x15118
    .asciz "TORNADO-flight"
    .balign 4
lbl_00015128:
    # 0x15128
    .asciz "TORNADO-in ball"
lbl_00015138:
    # 0x15138
    .asciz "BOM hit-flight"
    .balign 4
lbl_00015148:
    # 0x15148
    .asciz "BOM hit-in ball"
lbl_00015158:
    # 0x15158
    .asciz "BOM_falldown"
    .balign 4
lbl_00015168:
    # 0x15168
    .asciz "BOM ball falldown"
    .balign 4
lbl_0001517C:
    # 0x1517C
    .asciz "flight-flight-L"
lbl_0001518C:
    # 0x1518C
    .asciz "flight-flight-R"
lbl_0001519C:
    # 0x1519C
    .asciz "reserve10"
    .balign 4
lbl_000151A8:
    # 0x151A8
    .asciz "reserve11"
    .balign 4
lbl_000151B4:
    # 0x151B4
    .asciz "reserve12"
    .balign 4
lbl_000151C0:
    # 0x151C0
    .asciz "reserve13"
    .balign 4
lbl_000151CC:
    # 0x151CC
    .asciz "reserve14"
    .balign 4
lbl_000151D8:
    # 0x151D8
    .asciz "reserve15"
    .balign 4
lbl_000151E4:
    # 0x151E4
    .asciz "reserve16"
    .balign 4
lbl_000151F0:
    # 0x151F0
    .4byte lbl_000150F8
    .4byte lbl_00015108
    .4byte lbl_00015118
    .4byte lbl_00015128
    .4byte lbl_00015138
    .4byte lbl_00015148
    .4byte lbl_00015158
    .4byte lbl_00015168
    .4byte lbl_0001517C
    .4byte lbl_0001518C
    .4byte 0x00000000
    .4byte lbl_00015070
    .4byte lbl_0001507C
    .4byte lbl_00015088
    .4byte lbl_00015094
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte lbl_00014FB0
    .4byte lbl_0001519C
    .4byte lbl_000151A8
    .4byte lbl_000151B4
    .4byte lbl_000151C0
    .4byte lbl_000151CC
    .4byte lbl_000151D8
    .4byte lbl_000151E4
    .4byte 0x00000000
lbl_00015260:
    # 0x15260
    .asciz "standard"
    .balign 4
lbl_0001526C:
    # 0x1526C
    .asciz "for set"
lbl_00015274:
    # 0x15274
    .asciz "set angle"
    .balign 4
lbl_00015280:
    # 0x15280
    .asciz "for swing"
    .balign 4
lbl_0001528C:
    # 0x1528C
    .asciz "stance"
    .balign 4
lbl_00015294:
    # 0x15294
    .asciz "swing MAX"
    .balign 4
lbl_000152A0:
    # 0x152A0
    .asciz "swing"
    .balign 4
lbl_000152A8:
    # 0x152A8
    .asciz "swing MIN"
    .balign 4
lbl_000152B4:
    # 0x152B4
    .asciz "hole in one"
lbl_000152C0:
    # 0x152C0
    .asciz "bogey"
    .balign 4
lbl_000152C8:
    # 0x152C8
    .asciz "reserve17"
    .balign 4
lbl_000152D4:
    # 0x152D4
    .asciz "reserve18"
    .balign 4
lbl_000152E0:
    # 0x152E0
    .asciz "reserve19"
    .balign 4
lbl_000152EC:
    # 0x152EC
    .asciz "reserve20"
    .balign 4
lbl_000152F8:
    # 0x152F8
    .4byte lbl_00015260
    .4byte lbl_0001526C
    .4byte lbl_00015274
    .4byte lbl_00015280
    .4byte lbl_0001528C
    .4byte lbl_00015294
    .4byte lbl_000152A0
    .4byte lbl_000152A8
    .4byte lbl_000152B4
    .4byte lbl_000152C0
    .4byte 0x00000000
    .4byte lbl_00015070
    .4byte lbl_0001507C
    .4byte lbl_00015088
    .4byte lbl_00015094
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte lbl_00014FB0
    .4byte lbl_0001519C
    .4byte lbl_000151A8
    .4byte lbl_000151B4
    .4byte lbl_000151C0
    .4byte lbl_000151CC
    .4byte lbl_000151D8
    .4byte lbl_000151E4
    .4byte lbl_000152C8
    .4byte lbl_000152D4
    .4byte lbl_000152E0
    .4byte lbl_000152EC
    .4byte 0x00000000
lbl_00015378:
    # 0x15378
    .asciz "Take Bowl"
    .balign 4
lbl_00015384:
    # 0x15384
    .asciz "Set Adjust1"
lbl_00015390:
    # 0x15390
    .asciz "Set Adjust2"
lbl_0001539C:
    # 0x1539C
    .asciz "Throw MAX"
    .balign 4
lbl_000153A8:
    # 0x153A8
    .asciz "Throw"
    .balign 4
lbl_000153B0:
    # 0x153B0
    .asciz "Throw MIN"
    .balign 4
lbl_000153BC:
    # 0x153BC
    .asciz "Take Bowl Run"
    .balign 4
lbl_000153CC:
    # 0x153CC
    .4byte lbl_00015378
    .4byte lbl_00015384
    .4byte lbl_00015390
    .4byte lbl_0001539C
    .4byte lbl_000153A8
    .4byte lbl_000153B0
    .4byte lbl_000153BC
    .4byte 0x00000000
    .4byte lbl_00015070
    .4byte lbl_0001507C
    .4byte lbl_00015088
    .4byte lbl_00015094
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte lbl_00014FB0
    .4byte lbl_0001519C
    .4byte lbl_000151A8
    .4byte lbl_000151B4
    .4byte lbl_000151C0
    .4byte 0x00000000
lbl_00015424:
    # 0x15424
    .asciz "Shot MAX"
    .balign 4
lbl_00015430:
    # 0x15430
    .asciz "Shot"
    .balign 4
lbl_00015438:
    # 0x15438
    .asciz "Shot MIN"
    .balign 4
lbl_00015444:
    # 0x15444
    .4byte 0x53657400
lbl_00015448:
    # 0x15448
    .4byte lbl_00015424
    .4byte lbl_00015430
    .4byte lbl_00015438
    .4byte lbl_00015444
    .4byte 0x00000000
lbl_0001545C:
    # 0x1545C
    .asciz "EZ/on BANANA"
    .balign 4
lbl_0001546C:
    # 0x1546C
    .asciz "EZ/speak"
    .balign 4
lbl_00015478:
    # 0x15478
    .asciz "EZ/bye"
    .balign 4
lbl_00015480:
    # 0x15480
    .asciz "NR/flight"
    .balign 4
lbl_0001548C:
    # 0x1548C
    .asciz "NR/break ball"
    .balign 4
lbl_0001549C:
    # 0x1549C
    .asciz "NR/fly sky"
    .balign 4
lbl_000154A8:
    # 0x154A8
    .asciz "NR/fly speak"
    .balign 4
lbl_000154B8:
    # 0x154B8
    .asciz "NR/fly away"
lbl_000154C4:
    # 0x154C4
    .asciz "HD/look sky & loop"
    .balign 4
lbl_000154D8:
    # 0x154D8
    .asciz "HD/open door"
    .balign 4
lbl_000154E8:
    # 0x154E8
    .asciz "HD/no open"
    .balign 4
lbl_000154F4:
    # 0x154F4
    .asciz "HD/attack"
    .balign 4
lbl_00015500:
    # 0x15500
    .asciz "HD/blink"
    .balign 4
lbl_0001550C:
    # 0x1550C
    .asciz "HD/walk"
lbl_00015514:
    # 0x15514
    .asciz "HD/sulk"
lbl_0001551C:
    # 0x1551C
    .asciz "HD/eat BANANA"
    .balign 4
lbl_0001552C:
    # 0x1552C
    .asciz "HD/camera glance & loop"
lbl_00015544:
    # 0x15544
    .asciz "HD/camera interpolate"
    .balign 4
lbl_0001555C:
    # 0x1555C
    .asciz "MT/unknown"
    .balign 4
lbl_00015568:
    # 0x15568
    .4byte lbl_0001545C
    .4byte lbl_0001546C
    .4byte lbl_00015478
    .4byte lbl_00015480
    .4byte lbl_0001548C
    .4byte lbl_0001549C
    .4byte lbl_000154A8
    .4byte lbl_000154B8
    .4byte lbl_000154C4
    .4byte lbl_000154D8
    .4byte lbl_000154E8
    .4byte lbl_000154F4
    .4byte lbl_00015500
    .4byte lbl_0001550C
    .4byte lbl_00015514
    .4byte lbl_0001551C
    .4byte lbl_0001552C
    .4byte lbl_00015544
    .4byte 0x00000000
    .4byte lbl_0001555C
    .4byte 0x00000000
lbl_000155BC:
    # 0x155BC
    .4byte lbl_00014A58
    .4byte lbl_00014ACC
    .4byte lbl_00014C18
    .4byte lbl_00014C70
    .4byte lbl_00014CA4
    .4byte lbl_00014D40
    .4byte lbl_00014E48
    .4byte lbl_00015568
    .4byte lbl_00014ED0
    .4byte lbl_00014F24
    .4byte lbl_00014FBC
    .4byte lbl_000150A0
    .4byte lbl_000151F0
    .4byte lbl_000152F8
    .4byte lbl_000153CC
    .4byte lbl_00015448
lbl_000155FC:
    # 0x155FC
    .asciz "Smile Face"
    .balign 4
lbl_00015608:
    # 0x15608
    .asciz "Angry Face"
    .balign 4
lbl_00015614:
    # 0x15614
    .asciz "Afraid Face"
lbl_00015620:
    # 0x15620
    .asciz "Dissut"
    .balign 4
lbl_00015628:
    # 0x15628
    .asciz "Open Mouth"
    .balign 4
lbl_00015634:
    # 0x15634
    .4byte lbl_000155FC
    .4byte lbl_00015608
    .4byte lbl_00015614
    .4byte lbl_00015620
    .4byte lbl_00015628
    .4byte 0x00000000
lbl_0001564C:
    # 0x1564C
    .asciz "Hand Open"
    .balign 4
lbl_00015658:
    # 0x15658
    .4byte lbl_0001564C
    .4byte 0x00000000
lbl_00015660:
    # 0x15660
    .4byte lbl_0001564C
    .4byte 0x00000000
lbl_00015668:
    # 0x15668
    .asciz "Rotate"
    .balign 4
lbl_00015670:
    # 0x15670
    .4byte lbl_00015668
    .4byte 0x00000000
    .4byte lbl_00015634
    .4byte lbl_00015660
    .4byte lbl_00015658
    .4byte lbl_00015670
    .4byte lbl_00015670
lbl_0001568C:
    # 0x1568C
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000004
    .4byte 0x00000005
    .4byte 0x00000006
lbl_000156A0:
    # 0x156A0
    .4byte 0x00000002
lbl_000156A4:
    # 0x156A4
    .4byte 0x00000003
lbl_000156A8:
    # 0x156A8
    .4byte 0x00000007
    .4byte lbl_0001568C
    .4byte lbl_000156A0
    .4byte lbl_000156A4
    .4byte lbl_000156A8
    .4byte lbl_000156A8
lbl_000156C0:
    # 0x156C0
    .asciz "Change Chara"
    .balign 4
lbl_000156D0:
    # 0x156D0
    .asciz "Change Status"
    .balign 4
lbl_000156E0:
    # 0x156E0
    .asciz "Save"
    .balign 4
lbl_000156E8:
    # 0x156E8
    .asciz "Exit"
    .balign 4
lbl_000156F0:
    # 0x156F0
    .4byte lbl_0000E2C0
    .4byte lbl_000156C0
    .4byte lbl_0000F470
    .4byte lbl_000156D0
    .4byte lbl_0000F4D8
    .4byte lbl_000156E0
    .4byte lbl_0000F498
    .4byte lbl_000156E8
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "+%s+\n"
    .balign 4
    .asciz "|%s|\n"
    .balign 4
    .asciz ">%s<\n"
    .balign 4
    .asciz " %s\n"
    .balign 4
    .asciz "MOTION EDITOR"
    .balign 4
    .asciz "Use Pattern %d/%d\n"
    .balign 4
    .asciz "Save Memory %x\n"
    .asciz "     -- MENU --\n\n"
    .balign 4
    .4byte 0x2D3E2000
    .4byte 0x20202000
    .4byte 0x25730A00
    .4byte 0x204F4E00
    .4byte 0x4F464600
    .4byte 0x0A000000
    .4byte 0x2D3E0000
    .4byte 0x20200000
    .4byte 0x25336400
    .asciz "  %-10s"
    .asciz "Program Set"
    .asciz "  %-15s %3d"
    .asciz "--- Character Menu ---"
    .balign 4
    .asciz "ID : "
    .balign 4
    .4byte 0x25640000
    .asciz "Skeleton: "
    .balign 4
    .4byte 0x25730000
    .asciz "Model   : "
    .balign 4
    .asciz "Motion Frame: %d\n"
    .balign 4
    .asciz "--- Pattern Assign Menu ---\n"
    .balign 4
    .asciz " %-3s %-11s %-16s %-3s\n"
    .4byte 0x46720000
    .asciz "Part"
    .balign 4
    .asciz "Anim"
    .balign 4
    .4byte 0x4C760000
lbl_00015868:
    # 0x15868
    .asciz "Not Assign Patter\n  Press X button.\n"
    .balign 4
lbl_00015890:
    # 0x15890
    .asciz "Rotate: %d\n"
    .asciz "Pattern: %3d"
    .balign 4
    .asciz "--- Category Menu ---"
    .balign 4
    .asciz "Category      : "
    .balign 4
    .asciz "Status        : "
    .balign 4
    .asciz "Motion        : "
    .balign 4
    .asciz "Float         : "
    .balign 4
    .asciz "%0.2f"
    .balign 4
    .asciz "Int 1         : "
    .balign 4
    .asciz "Int 2 or Loop : "
    .balign 4
    .asciz "Interp        : "
    .balign 4
    .asciz "Speed         : "
    .balign 4
    .asciz "%0.4f"
    .balign 4
    .asciz "Face Dir      :   "
    .balign 4
    .asciz "Protect       : "
    .balign 4
    .asciz "Calc Interp   : "
    .balign 4
    .asciz "Rate Interp   : "
    .balign 4
    .asciz "Loop Motion   : "
    .balign 4
    .asciz " Pattern Assign"
    .4byte 0x00000000
lbl_000159EC:
    # 0x159EC
    .4byte lbl_0000EFD0
    .4byte lbl_0000F028
    .4byte lbl_0000F0A0
    .4byte lbl_0000F168
    .4byte lbl_0000F1E8
    .4byte lbl_0000F1E8
    .4byte lbl_0000F270
    .4byte lbl_0000F2C4
    .4byte lbl_0000F370
    .4byte lbl_0000F398
    .4byte lbl_0000F3C0
    .4byte lbl_0000F3E8
    .4byte lbl_0000F410
    .4byte lbl_0000F438
    .asciz "USER"
    .balign 4
    .asciz "ball"
    .balign 4
    .asciz "x:/des/motinfo_%02d%02d%02d%02d%02d.bin"
    .asciz "x:/des/motinfo_usb.bin"
    .balign 4
    .asciz "x:/des/motinfo.bin"
    .balign 4
    .asciz "y_suzuki"
    .balign 4
    .asciz "/p006/prj006/yoshi/motinfo_%02d%02d%02d%02d%02d.bin"
    .asciz "/p006/prj006/yoshi/motinfo.bin"
    .balign 4
    .asciz "/p006/prj006/mkb/motinfo.bin"

# 6
.section .bss
lbl_10000000:
    .skip 0x4
lbl_10000004:
    .skip 0x4
lbl_10000008:
    .skip 0x38
lbl_10000040:
    .skip 0x2C
lbl_1000006C:
    .skip 0x10
lbl_1000007C:
    .skip 0x4
lbl_10000080:
    .skip 0x8
lbl_10000088:
    .skip 0x1
lbl_10000089:
    .skip 0x1
lbl_1000008A:
    .skip 0x1
lbl_1000008B:
    .skip 0x1
lbl_1000008C:
    .skip 0x1
lbl_1000008D:
    .skip 0x1
lbl_1000008E:
    .skip 0x2
lbl_10000090:
    .skip 0x4
lbl_10000094:
    .skip 0x4
lbl_10000098:
    .skip 0x8
lbl_100000A0:
    .skip 0x4
lbl_100000A4:
    .skip 0x4
lbl_100000A8:
    .skip 0x4
lbl_100000AC:
    .skip 0x8
lbl_100000B4:
    .skip 0x4
lbl_100000B8:
    .skip 0xCA4
lbl_10000D5C:
    .skip 0x4
lbl_10000D60:
    .skip 0x4
lbl_10000D64:
    .skip 0x9C
lbl_10000E00:
    .skip 0x138
lbl_10000F38:
    .skip 0x20
lbl_10000F58:
    .skip 0x4
lbl_10000F5C:
    .skip 0x4
lbl_10000F60:
    .skip 0x10
lbl_10000F70:
    .skip 0x38
lbl_10000FA8:
    .skip 0x4
lbl_10000FAC:
    .skip 0x2C00
lbl_10003BAC:
    .skip 0x4C
lbl_10003BF8:
    .skip 0x4
lbl_10003BFC:
    .skip 0x64
lbl_10003C60:
    .skip 0x20
lbl_10003C80:
    .skip 0x46

