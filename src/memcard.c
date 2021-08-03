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

//lbl_801D4288 = start of .data section

struct StringEntry
{
    char *str;
    u32 unk4;
};

struct StringTable
{
    struct StringEntry *entries;
    u32 numEntries;
};

struct StringEntry lbl_802F13C8 =
{
    "A Memory Card error has occurred.", 0,
};

struct StringTable lbl_802F13D0 = {&lbl_802F13C8, 1};

// guessing here
extern char lbl_802C4840[];  // in bss
extern char lbl_802C4880[];
extern char lbl_802C48C0[];
struct StringEntry lbl_801D42AC[] =
{
    {lbl_802C4840, 0},
    {lbl_802C4880, 0},
    {lbl_802C48C0, 0},
};

struct StringTable lbl_802F13D8 = {lbl_801D42AC, 0 /*why 0?*/};

struct StringEntry lbl_801D4310[] =
{
    {"Could not read Memory Card.", 0},
    {"Please see the Instruction Booklet for details.", 0},
};

struct StringEntry stringEntry1 =
{
    "This Memory Card cannot be used.", 0,
};

struct StringEntry lbl_801D4384[] =
{
    {"Memory Card is not inserted.", 0},
    {"Please insert a Memory Card.", 0},
};

struct StringEntry lbl_801D43E4[] =
{
    {"There is no Memory Card in Slot A.", 0},
    {"The Autosave function will be set to Off.", 0},
};

struct StringEntry lbl_801D4420[] =
{
    {"Memory Card is not inserted.", 0},
    {"Please insert a Memory Card into Slot A.", 0},
};

struct StringEntry lbl_801D4470[] =
{
    {"The Memory Card was removed.", 0},
    {"The operation has been stopped.", 0},
};

struct StringEntry lbl_801D44D8[] =
{
    {"This Memory Card is not supported/recognized.", 0},
    {"Please insert a different Memory Card.", 0},
};

struct StringEntry lbl_801D459C[] =
{
    {"The file on the Memory Card has been damaged.", 0},
    {"Please use the GameCube tm Memory Card Menu", 0},
    {"or the Save Function of the Game Data Option in this game", 0},
    {"to format your Memory Card.", 0},
};

struct StringEntry stringEntry2 =
{
    "The file on the Memory Card has been damaged.", 0,
};

struct StringEntry stringEntry3 =
{
    "This Memory Card cannot be used.", 0,
};

struct StringEntry stringEntry4 =
{
    "No Super Monkey Ball Game Data found on Memory Card.", 0,
};

struct StringEntry stringEntry5 =
{
    "Cannot save data to the file.", 0,
};

struct StringEntry stringEntry6 =
{
    "Cannot load file.", 0,
};

struct StringEntry stringEntry7 =
{
    "Cannot read file.", 0,
};

struct StringEntry lbl_801D46B0[] =
{
    {"Not enough free blocks in Memory Card.", 0},
    {"There are %d free blocks,", 0},
    {"but %d blocks are required to save the data.", 0},
};

struct StringEntry lbl_801D46E0[] =
{
    {"Not enough free blocks in Memory Card.", 0},
    {"There is %d free block,", 0},
    {"but %d blocks are required to save the data.", 0},
};

struct StringEntry lbl_801D46F8[] =
{
    {"There are %d free blocks,", 0},
    {"but %d blocks are required to save the data.", 0},
    {"The Autosave function will be set to Off.", 0},
};

struct StringEntry lbl_801D46F8_blah[] =
{
    {"There is %d free block,", 0},
    {"but %d blocks are required to save the data.", 0},
    {"The Autosave function will be set to Off.", 0},
};

struct StringEntry lbl_801D4774[] =
{
    {"No free blocks in Memory Card.", 0},
    {"%d blocks are required to save the data.", 0},
};

struct StringEntry lbl_801D4774_blah[] =
{
    {"No free blocks in Memory Card.", 0},
    {"%d blocks are required to save the data.", 0},
    {"The Autosave function will be set to Off.", 0},
};

struct StringEntry lbl_801D4774_blah2[] =
{
    {"Not enough free blocks in Memory Card.", 0},
    {"%d blocks are required to save the data.", 0},
};

struct StringEntry lbl_801D48A4[] =
{
    {"The data has been successfully saved,", 0},
    {"but there are not enough free blocks to save the data.", 0},
    {"To save Replay Data, at least 2 free blocks are required.", 0},
    {"Also, to save Game Data, or to save over old data,", 0},
    {"at least 3 free blocks are required.", 0},
};

struct StringEntry lbl_801D4934[] =
{
    {"The data has been successfully saved,", 0},
    {"but there are not enough free blocks to save Game Data.", 0},
    {"To save Game Data, or to save over old data,", 0},
    {"at least 3 free blocks are required.", 0},
};

struct StringEntry lbl_801D49D0[] =
{
    {"The data has been successfully saved,", 0},
    {"but there may not be enough free blocks to save Replay Data.", 0},
    {"Replay Data requires a maximum of 13 free blocks to save.", 0},
};

struct StringEntry lbl_801D4A30[] =
{
    {"There are not enough free blocks", 0},
    {"to save a file in this Memory Card.", 0},
    {"To save Replay Data, at least 2 free blocks are required.", 0},
    {"Also, to save Game Data, or to save over old data,", 0},
    {"at least 3 free blocks are required.", 0},
};

struct StringEntry lbl_801D4A80[] =
{
    {"There are not enough free blocks", 0},
    {"to save Game Data in this Memory Card.", 0},
    {"To save Game Data, or to save over old data,", 0},
    {"at least 3 free blocks are required.", 0},
};

struct StringEntry lbl_801D4B10[] =
{
    {"There may not be enough free blocks to save Replay Data.", 0},
    {"Replay Data requires a maximum of 13 free blocks.", 0},
};

struct StringEntry lbl_801D4B58[] =
{
    {"No Super Monkey Ball Game Data found on Memory Card.", 0},
    {"There are not enough free blocks in this Memory Card.", 0},
    {"To save Replay Data, at least 2 free blocks are required.", 0},
    {"Also, to save Game Data, or to save over old data,", 0},
    {"at least 3 free blocks are required.", 0},
};

struct StringEntry lbl_801D4B58_blah[] =
{
    {"No Super Monkey Ball Game Data found on Memory Card.", 0},
    {"There are not enough free blocks", 0},
    {"to save Game Data in this Memory Card.", 0},
    {"To save Game Data, or to save over old data,", 0},
    {"at least 3 free blocks are required.", 0},
};

struct StringEntry lbl_801D4C38[] =
{
    {"No Super Monkey Ball Game Data found on Memory Card.", 0},
    {"There may not be enough free blocks", 0},
    {"to save Replay Data in this Memory Card.", 0},
    {"To save Replay Data, a maximum of 13 free blocks is required.", 0},
};

struct StringEntry stringEntry8 =
{
    "Cannot make any more files.", 0,
};

struct StringEntry lbl_801D4CF8[] =
{
    {"The data has been succesfully saved.", 0},
    {"However, no more files can be made. ", 0},
    {"You will not be able to save the data next time.", 0},
};

struct StringEntry stringEntry9 =
{
    "Saving finished.", 0,
};

struct StringEntry stringEntry10 =
{
    "Loading finished.", 0,
};

struct StringEntry stringEntry11 =
{
    "A file has been deleted.", 0,
};

struct StringEntry lbl_801D4D9C[] =
{
    {"The Game Data version is incorrect.", 0},
    {"Please try saving your game again.", 0},
};

struct StringEntry lbl_801D4DCC[] =
{
    {"The Game Data has been damaged.", 0},
    {"Please try saving your game again.", 0},
};

struct StringEntry lbl_801D4E18[] =
{
    {"The Replay Data has been damaged.", 0},
    {"Please delete the file.", 0},
};

struct StringEntry stringEntry12 =
{
    "Formatting has been interrupted.", 0,
};

struct StringEntry stringEntry13 =
{
    "Saving has been interrupted.", 0,
};

struct StringEntry stringEntry14 =
{
    "Loading has been interrupted.", 0,
};

struct StringEntry lbl_801D4EE4[] =
{
    {"The file size has been changed.", 0},
    {"Please delete the file from the menu, and try again.", 0},
};

struct StringEntry lbl_801D4FB4[] =
{
    {"No Replay Data found.", 0},
    {"In Normal mode and Practice Mode, during the Replay playback,", 0},
    {"if you access the Pause Menu and select Save Replay,", 0},
    {"you can save the Replay that you are viewing.", 0},
};

struct StringTable lbl_802F1450 = {lbl_801D4310, ARRAY_COUNT(lbl_801D4310)};
struct StringTable lbl_802F1458 = {&stringEntry1, 1};
struct StringTable lbl_802F1460 = {lbl_801D4384, ARRAY_COUNT(lbl_801D4384)};
struct StringTable lbl_802F1468 = {lbl_801D43E4, ARRAY_COUNT(lbl_801D43E4)};
struct StringTable lbl_802F1470 = {lbl_801D4420, ARRAY_COUNT(lbl_801D4420)};
struct StringTable lbl_802F1478 = {lbl_801D4470, ARRAY_COUNT(lbl_801D4470)};
struct StringTable lbl_802F1480 = {lbl_801D44D8, ARRAY_COUNT(lbl_801D44D8)};
struct StringTable lbl_802F1488 = {&stringEntry2, 1};
struct StringTable lbl_802F1490 = {lbl_801D459C, ARRAY_COUNT(lbl_801D459C)};
struct StringTable lbl_802F1498 = {&stringEntry3, 1};
struct StringTable lbl_802F14A0 = {&stringEntry4, 1};
struct StringTable lbl_802F14A8 = {&stringEntry5, 1};
struct StringTable lbl_802F14B0 = {&stringEntry6, 1};
struct StringTable lbl_802F14B8 = {&stringEntry7, 1};
struct StringTable lbl_802F14C0 = {lbl_801D46B0, ARRAY_COUNT(lbl_801D46B0)};
struct StringTable lbl_802F14C8 = {lbl_801D46E0, ARRAY_COUNT(lbl_801D46E0)};
struct StringTable lbl_802F14D0 = {lbl_801D46F8, ARRAY_COUNT(lbl_801D46F8)};
struct StringTable lbl_802F14D8 = {lbl_801D46F8_blah, ARRAY_COUNT(lbl_801D46F8_blah)};
struct StringTable lbl_802F14E0 = {lbl_801D4774, ARRAY_COUNT(lbl_801D4774)};
struct StringTable lbl_802F14E8 = {lbl_801D4774_blah, ARRAY_COUNT(lbl_801D4774_blah)};
struct StringTable lbl_802F14F0 = {lbl_801D4774_blah2, ARRAY_COUNT(lbl_801D4774_blah2)};
struct StringTable lbl_802F14F8 = {lbl_801D48A4, ARRAY_COUNT(lbl_801D48A4)};
struct StringTable lbl_802F1500 = {lbl_801D4934, ARRAY_COUNT(lbl_801D4934)};
struct StringTable lbl_802F1508 = {lbl_801D49D0, ARRAY_COUNT(lbl_801D49D0)};
struct StringTable lbl_802F1510 = {lbl_801D4A30, ARRAY_COUNT(lbl_801D4A30)};
struct StringTable lbl_802F1518 = {lbl_801D4A80, ARRAY_COUNT(lbl_801D4A80)};
struct StringTable lbl_802F1520 = {lbl_801D4B10, ARRAY_COUNT(lbl_801D4B10)};
struct StringTable lbl_802F1528 = {lbl_801D4B58, ARRAY_COUNT(lbl_801D4B58)};
struct StringTable lbl_802F1530 = {lbl_801D4B58_blah, ARRAY_COUNT(lbl_801D4B58_blah)};
struct StringTable lbl_802F1538 = {lbl_801D4C38, ARRAY_COUNT(lbl_801D4C38)};
struct StringTable lbl_802F1540 = {&stringEntry8, 1};
struct StringTable lbl_802F1548 = {lbl_801D4CF8, ARRAY_COUNT(lbl_801D4CF8)};
struct StringTable lbl_802F1550 = {&stringEntry9, 1};
struct StringTable lbl_802F1558 = {&stringEntry10, 1};
struct StringTable lbl_802F1560 = {&stringEntry11, 1};
struct StringTable lbl_802F1568 = {lbl_801D4D9C, ARRAY_COUNT(lbl_801D4D9C)};
struct StringTable lbl_802F1570 = {lbl_801D4DCC, ARRAY_COUNT(lbl_801D4DCC)};
struct StringTable lbl_802F1578 = {lbl_801D4E18, ARRAY_COUNT(lbl_801D4E18)};
struct StringTable lbl_802F1580 = {&stringEntry12, 1};
struct StringTable lbl_802F1588 = {&stringEntry13, 1};
struct StringTable lbl_802F1590 = {&stringEntry14, 1};
struct StringTable lbl_802F1598 = {lbl_801D4EE4, ARRAY_COUNT(lbl_801D4EE4)};
struct StringTable lbl_802F15A0 = {lbl_801D4FB4, ARRAY_COUNT(lbl_801D4FB4)};

extern char string_Please_press_the_p_BUTTON_B__a_Button_[];
struct StringEntry lbl_802F15A8 =
{
    "Please press the p/BUTTON_B/ a/Button.", 0,
};

struct StringEntry stringEntry15 =
{
    "Please press the p/BUTTON_B/ a/Button to Continue without saving.", 0,
};

struct StringEntry lbl_802F15B8 =
{
    "There are %d free blocks on this Memory Card.", 0,
};

struct StringEntry stringEntry16 =
{
    "There is %d free block on this Memory Card.", 0,
};

struct StringEntry stringEntry17 =
{
    "No free blocks found on this Memory Card.", 0,
};

struct StringEntry stringEntry18 =
{
    "Accessing Memory Card.", 0,
};

struct StringEntry lbl_801D512C[] =
{
    {"Now saving Replay Data.", 0},
    {"Do not touch the Memory Card or the POWER Button.", 0},
};

struct StringEntry lbl_801D5154[] =
{
    {"Now saving Game Data.", 0},
    {"Do not touch the Memory Card or the POWER Button.", 0},
};

struct StringEntry lbl_801D517C[] =
{
    {"Now loading Game Data.", 0},
    {"Do not touch the Memory Card or the POWER Button.", 0},
};

struct StringEntry lbl_801D5208[] =
{
    {"Please use the p/LEVER/ a/or the p/BUTTON_+/ a/to highlight a selection,", 0},
    {"and press the p/BUTTON_A/ a/Button to select.", 0},
};

struct StringEntry lbl_801D52A4[] =
{
    {"Please insert a Memory Card into Slot A,", 0},
    {"then press the p/BUTTON_A/ a/Button.", 0},
    {"You may cancel by pressing the p/BUTTON_B/ a/Button.", 0},
};

struct StringEntry lbl_801D530C[] =
{
    {"This will format your Memory Card.", 0},
    {"All data will be lost. Is it OK to format?", 0},
    {"", 0},
    {"", 0},
};

struct StringEntry lbl_801D534C[] =
{
    {"Memory Card being formatted.", 0},
    {"Do not touch the Memory Card or the POWER Button.", 0},
};

struct StringEntry lbl_801D53B0[] =
{
    {"A Super Monkey Ball Game Data file already exists.", 0},
    {"Would you like to save over it?", 0},
    {"", 0},
    {"", 0},
};

struct StringTable lbl_802F15DC = {&lbl_802F15A8, 1};
struct StringTable lbl_802F15E4 = {&stringEntry15, 1};
struct StringTable lbl_802F15EC = {&lbl_802F15B8, 1};
struct StringTable lbl_802F15F4 = {&stringEntry16, 1};
struct StringTable lbl_802F15FC = {&stringEntry17, 1};
struct StringTable lbl_802F1604 = {&stringEntry18, 1};
struct StringTable lbl_802F160C = {lbl_801D512C, ARRAY_COUNT(lbl_801D512C)};
struct StringTable lbl_802F1614 = {lbl_801D5154, ARRAY_COUNT(lbl_801D5154)};
struct StringTable lbl_802F161C = {lbl_801D517C, ARRAY_COUNT(lbl_801D517C)};
struct StringTable lbl_802F1624 = {lbl_801D5208, ARRAY_COUNT(lbl_801D5208)};
struct StringTable lbl_802F162C = {lbl_801D52A4, ARRAY_COUNT(lbl_801D52A4)};
struct StringTable lbl_802F1634 = {lbl_801D530C, ARRAY_COUNT(lbl_801D530C)};
struct StringTable lbl_802F163C = {lbl_801D534C, ARRAY_COUNT(lbl_801D534C)};
struct StringTable lbl_802F1644 = {lbl_801D53B0, ARRAY_COUNT(lbl_801D53B0)};

struct StringTable *lbl_801D53D0[] =
{
    &lbl_802F1450,
    &lbl_802F1458,
    &lbl_802F1460,
    &lbl_802F1468,
    &lbl_802F1470,
    &lbl_802F1478,
    &lbl_802F1480,
    &lbl_802F1488,
    &lbl_802F1490,
    &lbl_802F1498,
    &lbl_802F14A0,
    &lbl_802F14A8,
    &lbl_802F14B0,
    &lbl_802F14B8,
    &lbl_802F14C0,
    &lbl_802F14D0,
    &lbl_802F14E0,
    &lbl_802F14E8,
    &lbl_802F14F0,
    &lbl_802F14F8,
    &lbl_802F1500,
    &lbl_802F1508,
    &lbl_802F1510,
    &lbl_802F1518,
    &lbl_802F1520,
    &lbl_802F1528,
    &lbl_802F1530,
    &lbl_802F1538,
    &lbl_802F1540,
    &lbl_802F1548,
    &lbl_802F1550,
    &lbl_802F1558,
    &lbl_802F1560,
    &lbl_802F1568,
    &lbl_802F1570,
    &lbl_802F1578,
    &lbl_802F1580,
    &lbl_802F1588,
    &lbl_802F1590,
    &lbl_802F1598,
    &lbl_802F15A0,
    &lbl_802F15DC,
    &lbl_802F15E4,
    &lbl_802F15EC,
    &lbl_802F15FC,
    &lbl_802F1604,
    &lbl_802F160C,
    &lbl_802F1614,
    &lbl_802F161C,
    &lbl_802F1624,
    &lbl_802F162C,
    &lbl_802F1634,
    &lbl_802F163C,
    &lbl_802F1644,
};

/*
void func_8009F568(void)
{
    void *r29 = OSAlloc(0x5800);
    if (
}
*/
