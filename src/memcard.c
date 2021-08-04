#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"

extern u8 lbl_802F21A8;
extern u8 lbl_802F21B9;

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

// .bss
struct
{
    u8 filler0[0x2E];
    u8 unk2E;
    u8 filler2F[1];
    u32 unk30;
    u16 unk34;
    u16 unk36;
    u32 unk38;
    //u8 filler3C[0xA8-0x3C];
    u8 filler3C[0x70-0x3C];
    // Is this part of the struct?
} lbl_802BA2A0;

//u8 lbl_802BA310[0x50];
struct UnkStruct802BA310
{
    u32 unk0;
    s32 unk4;
    u32 unk8;
    struct StringTable *unkC;
    u8 filler10[0x14-0x10];
    /*0x14*/ char fileName[0x38-0x14];

//#define lbl_802BA310 lbl_802BA348  // hmm... some functions reference lbl_802BA310
    /*0x38*/ OSTime time;  // no idea which struct this is in.
    s16 unk40;
    u16 unk42;
    //u8 filler44[0x48-0x44];
    u32 unk44;
    u32 unk48;
    u8 unk4C;
    u8 unk4D;
    u8 filler4E[0x50-0x4E];
    /*0x50*/ CARDFileInfo cardFileInfo;
    u8 filler64[0xC];
} lbl_802BA310;

u8 lbl_802BA380[0xA100];

//u8 filler350[0x10];
//u8 lbl_802BA360[0x20];
//CARDFileInfo lbl_802BA360;

FORCE_BSS_ORDER(lbl_802BA2A0)
FORCE_BSS_ORDER(lbl_802BA310)
FORCE_BSS_ORDER(lbl_802BA380)
//FORCE_BSS_ORDER(lbl_802BA348)
//FORCE_BSS_ORDER(filler350)
//FORCE_BSS_ORDER(lbl_802BA360)

#pragma force_active on

u8 func_8009F4C4(void)
{
    return lbl_802F21A8;
}

void func_8009F4CC(u8 a)
{
    lbl_802F21A8 = a;
}

void func_8009F4D4(void)
{
    CARDCancel(&lbl_802BA310.cardFileInfo);
    if (lbl_802BA310.unk8 & (1 << (31-0x1E)))
    {
        CARDClose(&lbl_802BA310.cardFileInfo);
        lbl_802BA310.unk8 &= ~(1 << (31-0x1E));
    }
    if (lbl_802BA310.unk8 & 1)
    {
        CARDUnmount(0);
        lbl_802BA310.unk8 &= ~1;
    }
}

int sub_8009F554(void)
{
    return !(1 - lbl_802F21B9);
}

//lbl_801D4288 = start of .data section

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

extern struct
{
    u8 filler0[4];
    u8 unk4[0x5800];
    char unk5804[0x5824-0x5804];
    char unk5824[100];
} *lbl_802F21AC;

extern struct
{
    u8 filler0[2];
    u16 unk2;
    u8 unk4;  // array?
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u32 unk8;
    u32 unkC;
    u8 unk10[0x1800];
    u8 unk1810[0x800];
    char unk2010[0x20];
    char unk2030[0x20];
} *lbl_802F21C4;

void func_8009F568(void)
{
    int i;
    DVDFileInfo sp30;
    OSCalendarTime sp8;
    void *r29 = OSAlloc(0x5800);
    if (r29 == NULL)
        OSPanic("memcard.c", 0x39F, "cannot OSAlloc");
    if (DVDOpen("banner_and_icon.bin", &sp30) == 0)
        OSPanic("memcard.c", 0x3A3, "cannot open banner_and_icon.bin");
    if (func_800ACBBC(&sp30, r29, 0x5800, 0) == 0)
        OSPanic("memcard.c", 0x3A7, "cannot read banner_and_icon.bin");
    memcpy(lbl_802F21AC->unk4, r29, 0x5800);
    OSFree(r29);
    DVDClose(&sp30);
    lbl_802BA2A0.unk38 = (u32)lbl_802F21AC->unk5804 - (u32)lbl_802F21AC;
    strcpy(lbl_802F21AC->unk5804, "Super Monkey Ball");
    OSTicksToCalendarTime(lbl_802BA310.time, &sp8);
    sprintf(
        lbl_802F21AC->unk5824,
        "GameData%02d-%02d-%02d %02d:%02d",
        sp8.mon + 1,
        sp8.mday,
        sp8.year % 100,
        sp8.hour,
        sp8.min);

    lbl_802BA2A0.unk30 = (u32)lbl_802F21AC->unk4 - (u32)lbl_802F21AC;
    lbl_802BA2A0.unk2E = (lbl_802BA2A0.unk2E & ~0x3) | 2;

    // These loops match except for stack
    /*
    for (i = 0; i < 8; i++)
        lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*i))) | (2 << (2*i));
    for (i = 0; i < 8; i++)
        lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*i))) | ((1 << (2*i)) & 0x1FFF);
    */
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*0))) | (2 << (2*0));
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*1))) | (2 << (2*1));
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*2))) | (2 << (2*2));
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*3))) | (2 << (2*3));
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*4))) | (2 << (2*4));
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*5))) | (2 << (2*5));
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*6))) | (2 << (2*6));
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*7))) | (2 << (2*7));

    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*0))) | ((1 << (2*0)) & 0x1FFF);
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*1))) | ((1 << (2*1)) & 0x1FFF);
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*2))) | ((1 << (2*2)) & 0x1FFF);
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*3))) | ((1 << (2*3)) & 0x1FFF);
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*4))) | ((1 << (2*4)) & 0x1FFF);
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*5))) | ((1 << (2*5)) & 0x1FFF);
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*6))) | ((1 << (2*6)) & 0x1FFF);
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*7))) | ((1 << (2*7)) & 0x1FFF);

    lbl_802BA2A0.unk2E = (lbl_802BA2A0.unk2E & ~(0x1<<2));
}

struct Struct8009F7F0
{
    u16 unk0;
    u8 unk2;  // 8A
    u8 unk3;  // 8B
    u8 unk4;
    u8 unk5;
    u8 filler6[0x10-6];
    u32 unk10;
    u8 filler14[0x24-0x14-12];
};

void func_8009F7F0(void)
{
    DVDFileInfo spA0;
    struct Struct8009F7F0 sp88;
    char sp7C[0x88-0x7C];
    char sp38[0x7C-0x38];
    OSCalendarTime sp10;

    void *r29 = OSAlloc(0x1800);
    if (r29 == NULL)
        OSPanic("memcard.c", 0x3F6, "cannot OSAlloc");
    func_80049F20(11, &sp88);
    if (DVDOpen("preview/96x32.tpl", &spA0) == 0)
        OSPanic("memcard.c", 0x402, "cannot open replay banner image");
    if (func_800ACBBC(&spA0, r29, 0x1800, (sp88.unk2 - 1) * 0x1800) == 0)
        OSPanic("memcard.c", 0x405, "cannot read replay banner image");
    memcpy(lbl_802F21C4->unk10, r29, 0x1800);
    DVDClose(&spA0);

    if (DVDOpen("replay_icon.bin", &spA0) == 0)
        OSPanic("memcard.c", 0x410, "cannot open replay_icon.bin");
    if (func_800ACBBC(&spA0, r29, 0x800, 0) == 0)
        OSPanic("memcard.c", 0x413, "cannot read replay_icon.bin");
    memcpy(lbl_802F21C4->unk1810, r29, 0x800);
    DVDClose(&spA0);
    OSFree(r29);
    lbl_802BA2A0.unk38 = (u32)lbl_802F21C4->unk2010 - (u32)lbl_802F21C4;
    strncpy(lbl_802F21C4->unk2010, "Super Monkey Ball", 32);

    if (sp88.unk0 & (1<<(31-0x19)))
    {
        strcpy(sp7C, "Master");
    }
    else
    {
        if (sp88.unk0 & (1<<(31-0x1A)))
        {
            switch (sp88.unk3)
            {
            case 0:
                strcpy(sp7C, "Beg.Ext");
                break;
            case 1:
                strcpy(sp7C, "Adv.Ext");
                break;
            case 2:
                strcpy(sp7C, "Exp.Ext");
                break;
            }
        }
        else
        {
            switch (sp88.unk3)
            {
            case 0:
                strcpy(sp7C, "Beg.FL");
                break;
            case 1:
                strcpy(sp7C, "Adv.FL");
                break;
            case 2:
                strcpy(sp7C, "Exp.FL");
                break;
            }
        }
    }

    OSTicksToCalendarTime(lbl_802BA310.time, &sp10);
    sprintf(
        sp38,
        "%s%d %02d-%02d-%02d %02d:%02d",
        sp7C,
        sp88.unk4,
        sp10.mon + 1,
        sp10.mday,
        sp10.year % 100,
        sp10.hour,
        sp10.min);
    strncpy(lbl_802F21C4->unk2030, sp38, 32);

    lbl_802BA2A0.unk30 = (u32)lbl_802F21C4->unk10 - (u32)lbl_802F21C4;
    lbl_802BA2A0.unk2E = (lbl_802BA2A0.unk2E & ~0x3) | 2;
    lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~0x3) | 2;
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~0x3) | 3;
    lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(0x3<<2));
    lbl_802BA2A0.unk2E = (lbl_802BA2A0.unk2E & ~(0x1<<2));

    lbl_802F21C4->unk2 = sp88.unk0;
    lbl_802F21C4->unk4 = sp88.unk2;
    lbl_802F21C4->unk5 = sp88.unk3;
    lbl_802F21C4->unk6 = sp88.unk4;
    lbl_802F21C4->unk7 = sp88.unk5;
    lbl_802F21C4->unk8 = sp88.unk10;

    lbl_802F21C4->unkC = (u64)lbl_802BA310.time / (*(u32 *)0x800000F8 / 4); // WTF??
}

void func_8009FB8C(void)
{
    s32 dummyMemSize;
    s32 result;

    result = CARDProbeEx(0, &dummyMemSize, &lbl_802BA310.unk4);
    if (result != CARD_RESULT_NOCARD)
    {
        if (result != CARD_RESULT_BUSY)
            lbl_802BA310.unk40 = 0;
        if (result < CARD_RESULT_BUSY)
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
        }
    }

    lbl_802BA310.unk8 &= ~(1 << (31-0x1D));
    switch (result)
    {
    case CARD_RESULT_FATAL_ERROR:
    default:
        lbl_802BA310.unkC = &lbl_802F13D0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_NOCARD:
        if (lbl_802BA310.unk40 == 0)
        {
            lbl_802BA310.unk8 &= ~(1 << (31-0x1D));
            if (lbl_802BA310.unk8 & (1 << (31-0x19)))
            {
                lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
                lbl_802BA310.unk8 |= 0x200;
                lbl_802BA310.unk42 = 0;
                lbl_802BA310.unkC = &lbl_802F1468;
                lbl_802BA310.unk4C = 0xFF;
            }
            else
            {
                lbl_802BA310.unkC = &lbl_802F1470;
                lbl_802BA310.unk4C = 1;
            }
        }
        else
            lbl_802BA310.unk8 |= 4;
        break;
    case CARD_RESULT_WRONGDEVICE:
        lbl_802BA310.unkC = &lbl_802F1460;
        lbl_802BA310.unk4C = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xFF : 1;
        break;
    case CARD_RESULT_BUSY:
        if (lbl_802BA310.unk40 == 0)
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
            lbl_802BA310.unkC = &lbl_802F1450;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    case CARD_RESULT_READY:
        if (lbl_802BA310.unk4 != 0x2000)
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
            lbl_802BA310.unkC = &lbl_802F1498;
            lbl_802BA310.unk4C = 0xFF;
        }
        else
        {
            int foo = lbl_802BA310.unk4 - 1;
            lbl_802BA310.unk48 = (lbl_802BA310.unk44 + foo) & ~foo;
            lbl_802BA310.unk4C = 3;
        }
        break;
    }
}

void func_8009FDD4(void)
{
    s32 result = CARDMountAsync(0, lbl_802BA380, NULL, NULL);

    if (result < 0)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }

    switch (result)
    {
    case CARD_RESULT_FATAL_ERROR:
        lbl_802BA310.unkC = &lbl_802F1480;
        lbl_802BA310.unk4C = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xFF : 1;
        break;
    case CARD_RESULT_IOERROR:
        lbl_802BA310.unkC = &lbl_802F1458;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_WRONGDEVICE:
        lbl_802BA310.unkC = &lbl_802F1460;
        lbl_802BA310.unk4C = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xFF : 1;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &lbl_802F1478;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_NOFILE:
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 4;
        break;
    }
}

void func_8009FF18(void)
{
    s32 result = CARDGetResultCode(0);

    if (result != -1)
        lbl_802BA310.unk40 = 0;
    if (result < -1)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }

    switch (result)
    {
    case CARD_RESULT_FATAL_ERROR:
    default:
        lbl_802BA310.unkC = &lbl_802F13D0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_IOERROR:
        lbl_802BA310.unkC = &lbl_802F1458;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_WRONGDEVICE:
        lbl_802BA310.unkC = &lbl_802F1460;
        lbl_802BA310.unk4C = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xFF : 1;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &lbl_802F1478;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_BUSY:
        if (lbl_802BA310.unk40 == 0)
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
            lbl_802BA310.unkC = &lbl_802F1450;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    case CARD_RESULT_ENCODING:
    case CARD_RESULT_BROKEN:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        // fall through
    case CARD_RESULT_READY:
        lbl_802BA310.unk4C = 5;
        lbl_802BA310.unk8 |= 1;
        break;
    }
}

void func_800A00C0(void)
{
    s32 result = CARDCheckAsync(0, NULL);

    if (result < 0)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }

    switch (result)
    {
    case CARD_RESULT_FATAL_ERROR:
        lbl_802BA310.unkC = &lbl_802F13D0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_IOERROR:
        lbl_802BA310.unkC = &lbl_802F1458;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &lbl_802F1478;
        lbl_802BA310.unk4C = 0xFF;
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 6;
        break;
    }
}

extern u8 lbl_802F21B0;
extern u8 lbl_802F21B1;

void func_800A01B0(void)
{
    s32 result = CARDGetResultCode(0);

    if (result != -1)
        lbl_802BA310.unk40 = 0;
    if (result < -1)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }

    switch (result)
    {
    case CARD_RESULT_FATAL_ERROR:
    default:
        lbl_802BA310.unkC = &lbl_802F13D0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_IOERROR:
        lbl_802BA310.unkC = &lbl_802F1458;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_WRONGDEVICE:
        lbl_802BA310.unkC = &lbl_802F1460;
        lbl_802BA310.unk4C = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xFF : 1;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &lbl_802F1478;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -1:
        if (lbl_802BA310.unk40 == 0)
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
            lbl_802BA310.unkC = &lbl_802F1450;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    case CARD_RESULT_BROKEN:
    case CARD_RESULT_ENCODING:
        if ((lbl_802BA310.unk8 & 0x90) == 0x90)
        {
            lbl_802BA310.unkC = &lbl_802F1488;
            lbl_802BA310.unk4C = 9;
            lbl_802F21B1 = 0;
            lbl_802BA310.unk8 |= 0x400;
        }
        else
        {
            lbl_802BA310.unk42 = 0;
            lbl_802BA310.unkC = &lbl_802F1490;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    case CARD_RESULT_READY:
        if (lbl_802F21B0 == 5)
        {
            lbl_802BA310.unk40 = 0x4B0;
            lbl_802BA310.unk4C = 0x17;
        }
        else if (lbl_802F21B0 == 6)
            lbl_802BA310.unk4C = 0x18;
        else if (lbl_802BA310.unk8 & (1 << (31-0x1B)))
            lbl_802BA310.unk4C = 0x21;
        else
            lbl_802BA310.unk4C = 7;
        break;
    }
}

void func_800A03DC(void)
{
    s32 result = CARDOpen(0, lbl_802BA310.fileName, &lbl_802BA310.cardFileInfo);
    
    if (result != -1)
        lbl_802BA310.unk40 = 0;
    if (result < -1)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }
    
    switch (result)
    {
    case CARD_RESULT_FATAL_ERROR:
    default:
        lbl_802BA310.unkC = &lbl_802F13D0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &lbl_802F1478;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_NOFILE:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        if (lbl_802BA310.unk8 & (1 << (31-0x1B)))
        {
            if (lbl_802BA310.unk4C == 0x22)
                lbl_802BA310.unk4C = 7;
            else
            {
                lbl_802BA310.unk0 = -1;
                lbl_802BA310.unk40 = 0x4B0;
                lbl_802BA310.unk4C = 0x17;
            }
        }
        else
            lbl_802BA310.unk4C = 0x1F;
        break;
    case CARD_RESULT_NOPERM:
        if ((lbl_802BA310.unk8 & 0x90) == 0x90)
        {
            lbl_802BA310.unkC = &lbl_802F14A8;
            lbl_802BA310.unk4C = 9;
            lbl_802F21B1 = 0;
            lbl_802BA310.unk8 |= 0x400;
        }
        else
        {
            lbl_802BA310.unkC = &lbl_802F14B0;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    case CARD_RESULT_BUSY:
        if (lbl_802BA310.unk40 == 0)
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
            lbl_802BA310.unkC = &lbl_802F1450;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    case CARD_RESULT_BROKEN:
        if ((lbl_802BA310.unk8 & 0x90) == 0x90)
        {
            lbl_802BA310.unkC = &lbl_802F1488;
            lbl_802BA310.unk4C = 9;
            lbl_802F21B1 = 0;
            lbl_802BA310.unk8 |= 0x400;
        }
        else
        {
            lbl_802BA310.unk42 = 0;
            lbl_802BA310.unkC = &lbl_802F1490;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    case CARD_RESULT_READY:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        if ((lbl_802BA310.unk8 & 0x2010) == 0x2010)
        {
            lbl_802BA310.unk0 = lbl_802BA310.cardFileInfo.fileNo;
            CARDClose(&lbl_802BA310.cardFileInfo);
            if (lbl_802BA310.unk4C == 0x22)
                lbl_802BA310.unk4C = 0x23;
            else
            {
                lbl_802BA310.unk40 = 0x4B0;
                lbl_802BA310.unk4C = 0x17;
                lbl_802BA310.unk8 |= 0x10000;
            }
        }
        else
        {
            lbl_802BA310.unk8 |= 2;
            lbl_802BA310.unk4C = 0xF;
        }
        break;
    }
}

void func_800A06CC(void)
{
    s32 freeBytes;
    s32 freeFiles;
    s32 result = CARDFreeBlocks(0, &freeBytes, &freeFiles);

    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
    lbl_802BA310.unk8 |= 0x200;
    switch (result)
    {
    case -128:
    default:
        lbl_802BA310.unkC = &lbl_802F13D0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &lbl_802F1478;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -6:
        lbl_802BA310.unkC = &lbl_802F1490;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -1:
        if (lbl_802BA310.unk40 == 0)
        {
            lbl_802BA310.unkC = &lbl_802F1450;
            lbl_802BA310.unk4C = 0xFF;
        }
        else
        {
            lbl_802BA310.unk42 = 0;
            lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        }
        break;
    case 0:
        if (lbl_802BA310.unk4C == 0x17)
        {
            if (freeFiles < 1)
            {
                lbl_802BA310.unkC = &lbl_802F1540;
                lbl_802BA310.unk4C = 0xFF;
            }
            else if (lbl_802F21B0 == 2)
            {
                freeBytes /= (1 << 13);
                if (freeBytes < 13)
                {
                    lbl_802BA310.unk8 |= 0x180000;
                    lbl_802BA310.unk4D = freeBytes;
                    lbl_802BA310.unk42 = 0;
                    if (freeBytes < 2)
                    {
                        if (lbl_802BA310.unk8 & (1 << (31-0xD)))
                            lbl_802BA310.unkC = &lbl_802F1510;
                        else
                            lbl_802BA310.unkC = &lbl_802F1528;
                    }
                    else if (freeBytes < 3)
                    {
                        if (lbl_802BA310.unk8 & (1 << (31-0xD)))
                            lbl_802BA310.unkC = &lbl_802F1518;
                        else
                            lbl_802BA310.unkC = &lbl_802F1530;
                    }
                    else
                    {
                        if (lbl_802BA310.unk8 & (1 << (31-0xD)))
                            lbl_802BA310.unkC = &lbl_802F1520;
                        else
                            lbl_802BA310.unkC = &lbl_802F1538;
                    }
                }
                else
                {
                    if (lbl_802BA310.unk8 & (1 << (31-0xD)))
                    {
                        lbl_802BA310.unk42 = 0;
                        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
                        lbl_802BA310.unk8 |= 8;
                    }
                    else
                        lbl_802BA310.unkC = &lbl_802F14A0;
                }
                lbl_802BA310.unk8 &= ~(1 << (31-14));
                lbl_802BA310.unk4C = 0xFF;
            }
            else if (freeBytes < lbl_802BA310.unk48)
            {
                if (freeBytes == 0)
                {
                    if (lbl_802F21B0 == 3)
                    {
                        sprintf(
                            lbl_802F13D8.entries[0].str,
                            lbl_802F14E8.entries[0].str,
                            freeBytes / (1 << 13));
                        sprintf(
                            lbl_802F13D8.entries[1].str,
                            lbl_802F14E8.entries[1].str,
                            lbl_802BA310.unk48 / (1 << 13));
                        sprintf(
                            lbl_802F13D8.entries[2].str,
                            lbl_802F14E8.entries[2].str);
                        lbl_802F13D8.entries[0].unk4 = lbl_802F14E8.entries[0].unk4;
                        lbl_802F13D8.entries[1].unk4 = lbl_802F14E8.entries[1].unk4;
                        lbl_802F13D8.entries[2].unk4 = lbl_802F14E8.entries[2].unk4;
                        lbl_802F13D8.numEntries = lbl_802F14E8.numEntries;
                    }
                    else
                    {
                        sprintf(
                            lbl_802F13D8.entries[0].str,
                            lbl_802F14E0.entries[0].str);
                        sprintf(
                            lbl_802F13D8.entries[1].str,
                            lbl_802F14E0.entries[1].str,
                            lbl_802BA310.unk48 / (1 << 13));
                        lbl_802F13D8.entries[0].unk4 = lbl_802F14E0.entries[0].unk4;
                        lbl_802F13D8.entries[1].unk4 = lbl_802F14E0.entries[1].unk4;
                        lbl_802F13D8.numEntries = lbl_802F14E0.numEntries;
                    }
                }
                else
                {
                    struct StringTable *strTable;

                    if (lbl_802F21B0 == 3)
                    {
                        if (freeBytes / (1 << 13) == 1)
                            strTable = &lbl_802F14D8;
                        else
                            strTable = &lbl_802F14D0;
                        sprintf(
                            lbl_802F13D8.entries[0].str,
                            strTable->entries[0].str,
                            freeBytes / (1 << 13));
                        sprintf(
                            lbl_802F13D8.entries[1].str,
                            strTable->entries[1].str,
                            lbl_802BA310.unk48 / (1 << 13));
                        sprintf(
                            lbl_802F13D8.entries[2].str,
                            strTable->entries[2].str);
                        lbl_802F13D8.entries[0].unk4 = strTable->entries[0].unk4;
                        lbl_802F13D8.entries[1].unk4 = strTable->entries[1].unk4;
                        lbl_802F13D8.entries[2].unk4 = strTable->entries[2].unk4;
                        lbl_802F13D8.numEntries = strTable->numEntries;
                    }
                    else
                    {
                        if (freeBytes / (1 << 13) == 1)
                            strTable = &lbl_802F14C8;
                        else
                            strTable = &lbl_802F14C0;
                        sprintf(
                            lbl_802F13D8.entries[0].str,
                            strTable->entries[0].str);
                        sprintf(
                            lbl_802F13D8.entries[1].str,
                            strTable->entries[1].str,
                            freeBytes / (1 << 13));
                        sprintf(
                            lbl_802F13D8.entries[2].str,
                            strTable->entries[2].str,
                            lbl_802BA310.unk48 / (1 << 13));
                        lbl_802F13D8.entries[0].unk4 = strTable->entries[0].unk4;
                        lbl_802F13D8.entries[1].unk4 = strTable->entries[1].unk4;
                        lbl_802F13D8.entries[2].unk4 = strTable->entries[2].unk4;
                        lbl_802F13D8.numEntries = strTable->numEntries;
                    }
                }
                lbl_802BA310.unkC = &lbl_802F13D8;
                lbl_802BA310.unk4C = 0xFF;
            }
            else
            {
                lbl_802BA310.unk42 = 0;
                lbl_802BA310.unk8 &= ~(1 << (31-0x16));
                lbl_802BA310.unk4C = 13;
                if (lbl_802BA310.unk8 & (1 << (31-0x12))
                 && ((lbl_802BA310.unk8 & 0x00010080) == 0x10080))
                {
                    lbl_802F21B1 = 0;
                    lbl_802BA310.unk8 |= 0x400;
                }
            }
        }
        else
        {
            freeBytes /= (1 << 13);
            if (freeFiles < 1)
                lbl_802BA310.unkC = &lbl_802F1548;
            else
            {
                if (freeBytes < 13)
                {
                    lbl_802BA310.unk8 |= 0x100000;
                    lbl_802BA310.unk4D = freeBytes;
                    lbl_802BA310.unk42 = 0;
                    if (freeBytes < 2)
                        lbl_802BA310.unkC = &lbl_802F14F8;
                    else if (freeBytes < 3)
                        lbl_802BA310.unkC = &lbl_802F1500;
                    else
                        lbl_802BA310.unkC = &lbl_802F1508;
                }
                else
                {
                    if (lbl_802F21B0 == 3)
                    {
                        lbl_802BA310.unk42 = 0;
                        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
                        lbl_802BA310.unk8 &= ~(1 << (31-12));
                    }
                    else
                        lbl_802BA310.unkC = &lbl_802F1550;
                }
            }
            lbl_802BA310.unk8 &= ~(1 << (31-0x10));
            lbl_802BA310.unk8 |= 8;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    }
}
