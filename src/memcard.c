#include <stddef.h>
#include <dolphin.h>

#include "global.h"

extern u8 lbl_802F21A8;
extern u8 lbl_802F21B9;

// .bss
//u8 lbl_802BA310[0x50];
struct
{
    u8 filler0[0x8];
    u32 unk8;
    u32 unkC;
    u8 filler10[0x50-0x10];
} lbl_802BA310;
u8 lbl_802BA360[0x20];
//CARDFileInfo lbl_802BA360;

//FORCE_BSS_ORDER(filler0)
//FORCE_BSS_ORDER(asdf)
FORCE_BSS_ORDER(lbl_802BA310)
FORCE_BSS_ORDER(lbl_802BA360)

#pragma force_active on

u8 func_8009F4C4(void)
{
    return lbl_802F21A8;
}

void func_8009F4CC(u8 a)
{
    lbl_802F21A8 = a;
}

// TODO
#ifdef NONMATCHING
void func_8009F4D4(void)
{
    CARDFileInfo *r30 = (CARDFileInfo *)lbl_802BA360;
    CARDCancel(r30);
    
    if (lbl_802BA310.unk8 & (1 << (31-0x1E)))
    {
        CARDClose(r30);
        lbl_802BA310.unk8 &= ~(1 << (31-0x1E));
    }
    if (lbl_802BA310.unk8 & 1)
    {
        CARDUnmount(0);
        lbl_802BA310.unk8 &= ~1;
    }
}
#else
asm void func_8009F4D4(void)
{
    nofralloc
/* 8009F4D4 0009B3F4  7C 08 02 A6 */	mflr r0
/* 8009F4D8 0009B3F8  3C 60 80 2C */	lis r3, lbl_802BA310@ha
/* 8009F4DC 0009B3FC  90 01 00 04 */	stw r0, 4(r1)
/* 8009F4E0 0009B400  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8009F4E4 0009B404  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8009F4E8 0009B408  3B E3 A3 10 */	addi r31, r3, lbl_802BA310@l
/* 8009F4EC 0009B40C  93 C1 00 08 */	stw r30, 8(r1)
/* 8009F4F0 0009B410  3B DF 00 50 */	addi r30, r31, 0x50
/* 8009F4F4 0009B414  38 7E 00 00 */	addi r3, r30, 0
/* 8009F4F8 0009B418  48 03 B8 45 */	bl CARDCancel
/* 8009F4FC 0009B41C  84 1F 00 08 */	lwzu r0, 8(r31)
/* 8009F500 0009B420  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 8009F504 0009B424  41 82 00 18 */	beq lbl_8009F51C
/* 8009F508 0009B428  7F C3 F3 78 */	mr r3, r30
/* 8009F50C 0009B42C  48 03 B0 61 */	bl CARDClose
/* 8009F510 0009B430  80 1F 00 00 */	lwz r0, 0(r31)
/* 8009F514 0009B434  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8009F518 0009B438  90 1F 00 00 */	stw r0, 0(r31)
lbl_8009F51C:
/* 8009F51C 0009B43C  80 1F 00 00 */	lwz r0, 0(r31)
/* 8009F520 0009B440  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8009F524 0009B444  41 82 00 18 */	beq lbl_8009F53C
/* 8009F528 0009B448  38 60 00 00 */	li r3, 0
/* 8009F52C 0009B44C  48 03 A2 A5 */	bl CARDUnmount
/* 8009F530 0009B450  80 1F 00 00 */	lwz r0, 0(r31)
/* 8009F534 0009B454  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 8009F538 0009B458  90 1F 00 00 */	stw r0, 0(r31)
lbl_8009F53C:
/* 8009F53C 0009B45C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8009F540 0009B460  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8009F544 0009B464  83 C1 00 08 */	lwz r30, 8(r1)
/* 8009F548 0009B468  7C 08 03 A6 */	mtlr r0
/* 8009F54C 0009B46C  38 21 00 10 */	addi r1, r1, 0x10
/* 8009F550 0009B470  4E 80 00 20 */	blr
}
#pragma peephole on
#endif

int sub_8009F554(void)
{
    return !(1 - lbl_802F21B9);
}

/*
extern char string_A_Memory_Card_error_has_occurred_[];

char *asdfasdf[] =
{
    string_A_Memory_Card_error_has_occurred_,
    NULL,
};
*/

//char lbl_802F13C4[] = "..";

/*
void func_8009F568(void)
{
    void *r29 = OSAlloc(0x5800);
    if (
}
*/
