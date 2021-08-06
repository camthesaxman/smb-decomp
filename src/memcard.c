#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

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
CARDStat lbl_802BA2A0;

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

extern struct UnkStruct802F21BC
{
    u8 filler0[2];
    u16 unk2;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    s8 unk14;
    u8 filler15[0x18-0x15];
} *lbl_802F21BC;

u8 lbl_802BA380[0xA100];
u8 lbl_802C4480[0x3C0];
char strFmtBufferLine1[64];
char strFmtBufferLine2[64];
char strFmtBufferLine3[0x80];

FORCE_BSS_ORDER(lbl_802BA2A0)
FORCE_BSS_ORDER(lbl_802BA310)
FORCE_BSS_ORDER(lbl_802BA380)
FORCE_BSS_ORDER(lbl_802C4480)
FORCE_BSS_ORDER(strFmtBufferLine1)
FORCE_BSS_ORDER(strFmtBufferLine2)
FORCE_BSS_ORDER(strFmtBufferLine3)

extern u8 lbl_802F21A8;
extern u8 lbl_802F21B9;
extern u8 lbl_802F21B0;
extern u8 lbl_802F21B1;
extern s8 lbl_802F21B2;
extern u8 lbl_802F21B8;

extern struct
{
    u16 unk0;
    u16 unk2;
    u8 unk4[0x5800];
    char unk5804[0x5824-0x5804];
    char unk5824[0xC04-0x824];
    u8 unk5C04[100];
} *lbl_802F21AC;

extern struct
{
    u16 unk0;  // crc
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
    u8 unk2050[100];
} *lbl_802F21C4;

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

struct StringTable msgMemCardError = {&lbl_802F13C8, 1};

struct StringEntry strFmtBuffer[] =
{
    {strFmtBufferLine1, 0},
    {strFmtBufferLine2, 0},
    {strFmtBufferLine3, 0},
};

struct StringTable msgFmtBuffer = {strFmtBuffer, 0 /*why 0?*/};

struct StringEntry lbl_801D4310[] =
{
    {"Could not read Memory Card.", 0},
    {"Please see the Instruction Booklet for details.", 0},
};

struct StringEntry strMemCardCantUse =
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

struct StringEntry strMemCardRemoved[] =
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

struct StringEntry strMemCardDamaged =
{
    "The file on the Memory Card has been damaged.", 0,
};

struct StringEntry strMemCardCantUse2 =
{
    "This Memory Card cannot be used.", 0,
};

struct StringEntry stringEntry4 =
{
    "No Super Monkey Ball Game Data found on Memory Card.", 0,
};

struct StringEntry strCantSaveFile =
{
    "Cannot save data to the file.", 0,
};

struct StringEntry strCantLoadFile =
{
    "Cannot load file.", 0,
};

struct StringEntry strCantReadFile =
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

struct StringEntry strCantMakeMoreFiles =
{
    "Cannot make any more files.", 0,
};

struct StringEntry strSaveSuccessNoMoreFiles[] =
{
    {"The data has been succesfully saved.", 0},
    {"However, no more files can be made. ", 0},
    {"You will not be able to save the data next time.", 0},
};

struct StringEntry strSaveFinished =
{
    "Saving finished.", 0,
};

struct StringEntry strLoadFinished =
{
    "Loading finished.", 0,
};

struct StringEntry strDeleteFinished =
{
    "A file has been deleted.", 0,
};

struct StringEntry strGameDataWrongVersion[] =
{
    {"The Game Data version is incorrect.", 0},
    {"Please try saving your game again.", 0},
};

struct StringEntry strGameDataDamaged[] =
{
    {"The Game Data has been damaged.", 0},
    {"Please try saving your game again.", 0},
};

struct StringEntry strReplayDataDamaged[] =
{
    {"The Replay Data has been damaged.", 0},
    {"Please delete the file.", 0},
};

struct StringEntry strFormatInterrupted =
{
    "Formatting has been interrupted.", 0,
};

struct StringEntry strSaveInterrupted =
{
    "Saving has been interrupted.", 0,
};

struct StringEntry strLoadInterrupted =
{
    "Loading has been interrupted.", 0,
};

struct StringEntry strFileSizeChanged[] =
{
    {"The file size has been changed.", 0},
    {"Please delete the file from the menu, and try again.", 0},
};

struct StringEntry strNoReplayData[] =
{
    {"No Replay Data found.", 0},
    {"In Normal mode and Practice Mode, during the Replay playback,", 0},
    {"if you access the Pause Menu and select Save Replay,", 0},
    {"you can save the Replay that you are viewing.", 0},
};

struct StringTable lbl_802F1450 = {lbl_801D4310, ARRAY_COUNT(lbl_801D4310)};
struct StringTable msgMemCardCantUse = {&strMemCardCantUse, 1};
struct StringTable lbl_802F1460 = {lbl_801D4384, ARRAY_COUNT(lbl_801D4384)};
struct StringTable lbl_802F1468 = {lbl_801D43E4, ARRAY_COUNT(lbl_801D43E4)};
struct StringTable lbl_802F1470 = {lbl_801D4420, ARRAY_COUNT(lbl_801D4420)};
struct StringTable msgMemCardRemoved = {strMemCardRemoved, ARRAY_COUNT(strMemCardRemoved)};
struct StringTable lbl_802F1480 = {lbl_801D44D8, ARRAY_COUNT(lbl_801D44D8)};
struct StringTable msgMemCardDamaged = {&strMemCardDamaged, 1};
struct StringTable lbl_802F1490 = {lbl_801D459C, ARRAY_COUNT(lbl_801D459C)};
struct StringTable msgMemCardCantUse2 = {&strMemCardCantUse2, 1};
struct StringTable lbl_802F14A0 = {&stringEntry4, 1};
struct StringTable msgCantSaveFile = {&strCantSaveFile, 1};
struct StringTable msgCantLoadFile = {&strCantLoadFile, 1};
struct StringTable msgCantReadFile = {&strCantReadFile, 1};
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
struct StringTable msgCantMakeMoreFiles = {&strCantMakeMoreFiles, 1};
struct StringTable msgSaveSuccessNoMoreFiles = {strSaveSuccessNoMoreFiles, ARRAY_COUNT(strSaveSuccessNoMoreFiles)};
struct StringTable msgSaveFinished = {&strSaveFinished, 1};
struct StringTable msgLoadFinished = {&strLoadFinished, 1};
struct StringTable msgDeleteFinished = {&strDeleteFinished, 1};
struct StringTable msgGameDataWrongVersion = {strGameDataWrongVersion, ARRAY_COUNT(strGameDataWrongVersion)};
struct StringTable msgGameDataDamaged = {strGameDataDamaged, ARRAY_COUNT(strGameDataDamaged)};
struct StringTable msgReplayDataDamaged = {strReplayDataDamaged, ARRAY_COUNT(strReplayDataDamaged)};
struct StringTable msgFormatInterrupted = {&strFormatInterrupted, 1};
struct StringTable msgSaveInterrupted = {&strSaveInterrupted, 1};
struct StringTable msgLoadInterrupted = {&strLoadInterrupted, 1};
struct StringTable msgFileSizeChanged = {strFileSizeChanged, ARRAY_COUNT(strFileSizeChanged)};
struct StringTable msgNoReplayData = {strNoReplayData, ARRAY_COUNT(strNoReplayData)};

struct StringEntry strPressBButton =
{
    "Please press the p/BUTTON_B/ a/Button.", 0,
};

struct StringEntry strPressBButtonNoSave =
{
    "Please press the p/BUTTON_B/ a/Button to Continue without saving.", 0,
};

struct StringEntry strMemCardNumFreeBlocks =
{
    "There are %d free blocks on this Memory Card.", 0,
};

struct StringEntry strMemCardNumFreeBlock =
{
    "There is %d free block on this Memory Card.", 0,
};

struct StringEntry strMemCardNoFreeBlocks =
{
    "No free blocks found on this Memory Card.", 0,
};

struct StringEntry strAccessMemCard =
{
    "Accessing Memory Card.", 0,
};

struct StringEntry strSavingReplay[] =
{
    {"Now saving Replay Data.", 0},
    {"Do not touch the Memory Card or the POWER Button.", 0},
};

struct StringEntry strSavingGame[] =
{
    {"Now saving Game Data.", 0},
    {"Do not touch the Memory Card or the POWER Button.", 0},
};

struct StringEntry strLoadingGame[] =
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

struct StringEntry strFormatPrompt[] =
{
    {"This will format your Memory Card.", 0},
    {"All data will be lost. Is it OK to format?", 0},
    {"", 0},
    {"", 0},
};

struct StringEntry strFormatProgress[] =
{
    {"Memory Card being formatted.", 0},
    {"Do not touch the Memory Card or the POWER Button.", 0},
};

struct StringEntry strOverwritePrompt[] =
{
    {"A Super Monkey Ball Game Data file already exists.", 0},
    {"Would you like to save over it?", 0},
    {"", 0},
    {"", 0},
};

struct StringTable msgPressBButton = {&strPressBButton, 1};
struct StringTable msgPressBButtonNoSave = {&strPressBButtonNoSave, 1};
struct StringTable msgMemCardNumFreeBlocks = {&strMemCardNumFreeBlocks, 1};
struct StringTable msgMemCardNumFreeBlock = {&strMemCardNumFreeBlock, 1};
struct StringTable msgMemCardNoFreeBlocks = {&strMemCardNoFreeBlocks, 1};
struct StringTable msgAccessMemCard = {&strAccessMemCard, 1};
struct StringTable msgSavingReplay = {strSavingReplay, ARRAY_COUNT(strSavingReplay)};
struct StringTable msgSavingGame = {strSavingGame, ARRAY_COUNT(strSavingGame)};
struct StringTable msgLoadingGame = {strLoadingGame, ARRAY_COUNT(strLoadingGame)};
struct StringTable lbl_802F1624 = {lbl_801D5208, ARRAY_COUNT(lbl_801D5208)};
struct StringTable lbl_802F162C = {lbl_801D52A4, ARRAY_COUNT(lbl_801D52A4)};
struct StringTable msgFormatPrompt = {strFormatPrompt, ARRAY_COUNT(strFormatPrompt)};
struct StringTable msgFormatProgress = {strFormatProgress, ARRAY_COUNT(strFormatProgress)};
struct StringTable msgOverwritePrompt = {strOverwritePrompt, ARRAY_COUNT(strOverwritePrompt)};

struct StringTable *lbl_801D53D0[] =
{
    &lbl_802F1450,
    &msgMemCardCantUse,
    &lbl_802F1460,
    &lbl_802F1468,
    &lbl_802F1470,
    &msgMemCardRemoved,
    &lbl_802F1480,
    &msgMemCardDamaged,
    &lbl_802F1490,
    &msgMemCardCantUse2,
    &lbl_802F14A0,
    &msgCantSaveFile,
    &msgCantLoadFile,
    &msgCantReadFile,
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
    &msgCantMakeMoreFiles,
    &msgSaveSuccessNoMoreFiles,
    &msgSaveFinished,
    &msgLoadFinished,
    &msgDeleteFinished,
    &msgGameDataWrongVersion,
    &msgGameDataDamaged,
    &msgReplayDataDamaged,
    &msgFormatInterrupted,
    &msgSaveInterrupted,
    &msgLoadInterrupted,
    &msgFileSizeChanged,
    &msgNoReplayData,
    &msgPressBButton,
    &msgPressBButtonNoSave,
    &msgMemCardNumFreeBlocks,
    &msgMemCardNoFreeBlocks,
    &msgAccessMemCard,
    &msgSavingReplay,
    &msgSavingGame,
    &msgLoadingGame,
    &lbl_802F1624,
    &lbl_802F162C,
    &msgFormatPrompt,
    &msgFormatProgress,
    &msgOverwritePrompt,
};

void func_8009F568(void)
{
    int i;
    DVDFileInfo file;
    OSCalendarTime calendarTime;
    void *buffer = OSAlloc(0x5800);
    if (buffer == NULL)
        OSPanic("memcard.c", 0x39F, "cannot OSAlloc");
    if (DVDOpen("banner_and_icon.bin", &file) == 0)
        OSPanic("memcard.c", 0x3A3, "cannot open banner_and_icon.bin");
    if (g_read_dvd_file(&file, buffer, 0x5800, 0) == 0)
        OSPanic("memcard.c", 0x3A7, "cannot read banner_and_icon.bin");
    memcpy(lbl_802F21AC->unk4, buffer, 0x5800);
    OSFree(buffer);
    DVDClose(&file);
    lbl_802BA2A0.commentAddr = (u32)lbl_802F21AC->unk5804 - (u32)lbl_802F21AC;
    strcpy(lbl_802F21AC->unk5804, "Super Monkey Ball");
    OSTicksToCalendarTime(lbl_802BA310.time, &calendarTime);
    sprintf(
        lbl_802F21AC->unk5824,
        "GameData%02d-%02d-%02d %02d:%02d",
        calendarTime.mon + 1,
        calendarTime.mday,
        calendarTime.year % 100,
        calendarTime.hour,
        calendarTime.min);

    lbl_802BA2A0.iconAddr = (u32)lbl_802F21AC->unk4 - (u32)lbl_802F21AC;
    lbl_802BA2A0.bannerFormat = (lbl_802BA2A0.bannerFormat & ~0x3) | 2;

    // These loops match except for stack
    /*
    for (i = 0; i < 8; i++)
        lbl_802BA2A0.unk34 = (lbl_802BA2A0.unk34 & ~(3 << (2*i))) | (2 << (2*i));
    for (i = 0; i < 8; i++)
        lbl_802BA2A0.unk36 = (lbl_802BA2A0.unk36 & ~(3 << (2*i))) | ((1 << (2*i)) & 0x1FFF);
    */
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~(3 << (2*0))) | (2 << (2*0));
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~(3 << (2*1))) | (2 << (2*1));
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~(3 << (2*2))) | (2 << (2*2));
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~(3 << (2*3))) | (2 << (2*3));
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~(3 << (2*4))) | (2 << (2*4));
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~(3 << (2*5))) | (2 << (2*5));
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~(3 << (2*6))) | (2 << (2*6));
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~(3 << (2*7))) | (2 << (2*7));

    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(3 << (2*0))) | ((1 << (2*0)) & 0x1FFF);
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(3 << (2*1))) | ((1 << (2*1)) & 0x1FFF);
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(3 << (2*2))) | ((1 << (2*2)) & 0x1FFF);
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(3 << (2*3))) | ((1 << (2*3)) & 0x1FFF);
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(3 << (2*4))) | ((1 << (2*4)) & 0x1FFF);
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(3 << (2*5))) | ((1 << (2*5)) & 0x1FFF);
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(3 << (2*6))) | ((1 << (2*6)) & 0x1FFF);
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(3 << (2*7))) | ((1 << (2*7)) & 0x1FFF);

    lbl_802BA2A0.bannerFormat = (lbl_802BA2A0.bannerFormat & ~(0x1<<2));
}

struct Struct8009F7F0
{
    u16 flags;
    u8 unk2;
    u8 difficulty;  // 0 = beginner, 1 = advanced, 2 = expert
    u8 unk4;
    u8 unk5;
    u8 filler6[0x10-6];
    u32 unk10;
    u8 filler14[0x24-0x14-12];
};

void func_8009F7F0(void)
{
    DVDFileInfo file;
    struct Struct8009F7F0 sp88;
    char categoryName[12];
    char replayFileName[68];
    OSCalendarTime calendarTime;

    void *buffer = OSAlloc(0x1800);
    if (buffer == NULL)
        OSPanic("memcard.c", 0x3F6, "cannot OSAlloc");
    func_80049F20(11, &sp88);
    if (DVDOpen("preview/96x32.tpl", &file) == 0)
        OSPanic("memcard.c", 0x402, "cannot open replay banner image");
    if (g_read_dvd_file(&file, buffer, 0x1800, (sp88.unk2 - 1) * 0x1800) == 0)
        OSPanic("memcard.c", 0x405, "cannot read replay banner image");
    memcpy(lbl_802F21C4->unk10, buffer, 0x1800);
    DVDClose(&file);

    if (DVDOpen("replay_icon.bin", &file) == 0)
        OSPanic("memcard.c", 0x410, "cannot open replay_icon.bin");
    if (g_read_dvd_file(&file, buffer, 0x800, 0) == 0)
        OSPanic("memcard.c", 0x413, "cannot read replay_icon.bin");
    memcpy(lbl_802F21C4->unk1810, buffer, 0x800);
    DVDClose(&file);
    OSFree(buffer);
    lbl_802BA2A0.commentAddr = (u32)lbl_802F21C4->unk2010 - (u32)lbl_802F21C4;
    strncpy(lbl_802F21C4->unk2010, "Super Monkey Ball", 32);

    if (sp88.flags & (1<<(31-0x19)))
    {
        strcpy(categoryName, "Master");
    }
    else
    {
        if (sp88.flags & (1<<(31-0x1A)))
        {
            switch (sp88.difficulty)
            {
            case 0:
                strcpy(categoryName, "Beg.Ext");
                break;
            case 1:
                strcpy(categoryName, "Adv.Ext");
                break;
            case 2:
                strcpy(categoryName, "Exp.Ext");
                break;
            }
        }
        else
        {
            switch (sp88.difficulty)
            {
            case 0:
                strcpy(categoryName, "Beg.FL");
                break;
            case 1:
                strcpy(categoryName, "Adv.FL");
                break;
            case 2:
                strcpy(categoryName, "Exp.FL");
                break;
            }
        }
    }

    OSTicksToCalendarTime(lbl_802BA310.time, &calendarTime);
    sprintf(
        replayFileName,
        "%s%d %02d-%02d-%02d %02d:%02d",
        categoryName,
        sp88.unk4,
        calendarTime.mon + 1,
        calendarTime.mday,
        calendarTime.year % 100,
        calendarTime.hour,
        calendarTime.min);
    strncpy(lbl_802F21C4->unk2030, replayFileName, 32);

    lbl_802BA2A0.iconAddr = (u32)lbl_802F21C4->unk10 - (u32)lbl_802F21C4;
    lbl_802BA2A0.bannerFormat = (lbl_802BA2A0.bannerFormat & ~0x3) | 2;
    lbl_802BA2A0.iconFormat = (lbl_802BA2A0.iconFormat & ~0x3) | 2;
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~0x3) | 3;
    lbl_802BA2A0.iconSpeed = (lbl_802BA2A0.iconSpeed & ~(0x3<<2));
    lbl_802BA2A0.bannerFormat = (lbl_802BA2A0.bannerFormat & ~(0x1<<2));

    lbl_802F21C4->unk2 = sp88.flags;
    lbl_802F21C4->unk4 = sp88.unk2;
    lbl_802F21C4->unk5 = sp88.difficulty;
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
        lbl_802BA310.unkC = &msgMemCardError;
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
            lbl_802BA310.unkC = &msgMemCardCantUse2;
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
        lbl_802BA310.unkC = &msgMemCardCantUse;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_WRONGDEVICE:
        lbl_802BA310.unkC = &lbl_802F1460;
        lbl_802BA310.unk4C = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xFF : 1;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_IOERROR:
        lbl_802BA310.unkC = &msgMemCardCantUse;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_WRONGDEVICE:
        lbl_802BA310.unkC = &lbl_802F1460;
        lbl_802BA310.unk4C = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xFF : 1;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_IOERROR:
        lbl_802BA310.unkC = &msgMemCardCantUse;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_IOERROR:
        lbl_802BA310.unkC = &msgMemCardCantUse;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_WRONGDEVICE:
        lbl_802BA310.unkC = &lbl_802F1460;
        lbl_802BA310.unk4C = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xFF : 1;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
            lbl_802BA310.unkC = &msgMemCardDamaged;
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
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case CARD_RESULT_NOCARD:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
            lbl_802BA310.unkC = &msgCantSaveFile;
            lbl_802BA310.unk4C = 9;
            lbl_802F21B1 = 0;
            lbl_802BA310.unk8 |= 0x400;
        }
        else
        {
            lbl_802BA310.unkC = &msgCantLoadFile;
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
            lbl_802BA310.unkC = &msgMemCardDamaged;
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
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
                lbl_802BA310.unkC = &msgCantMakeMoreFiles;
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
                            msgFmtBuffer.entries[0].str,
                            lbl_802F14E8.entries[0].str,
                            freeBytes / (1 << 13));
                        sprintf(
                            msgFmtBuffer.entries[1].str,
                            lbl_802F14E8.entries[1].str,
                            lbl_802BA310.unk48 / (1 << 13));
                        sprintf(
                            msgFmtBuffer.entries[2].str,
                            lbl_802F14E8.entries[2].str);
                        msgFmtBuffer.entries[0].unk4 = lbl_802F14E8.entries[0].unk4;
                        msgFmtBuffer.entries[1].unk4 = lbl_802F14E8.entries[1].unk4;
                        msgFmtBuffer.entries[2].unk4 = lbl_802F14E8.entries[2].unk4;
                        msgFmtBuffer.numEntries = lbl_802F14E8.numEntries;
                    }
                    else
                    {
                        sprintf(
                            msgFmtBuffer.entries[0].str,
                            lbl_802F14E0.entries[0].str);
                        sprintf(
                            msgFmtBuffer.entries[1].str,
                            lbl_802F14E0.entries[1].str,
                            lbl_802BA310.unk48 / (1 << 13));
                        msgFmtBuffer.entries[0].unk4 = lbl_802F14E0.entries[0].unk4;
                        msgFmtBuffer.entries[1].unk4 = lbl_802F14E0.entries[1].unk4;
                        msgFmtBuffer.numEntries = lbl_802F14E0.numEntries;
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
                            msgFmtBuffer.entries[0].str,
                            strTable->entries[0].str,
                            freeBytes / (1 << 13));
                        sprintf(
                            msgFmtBuffer.entries[1].str,
                            strTable->entries[1].str,
                            lbl_802BA310.unk48 / (1 << 13));
                        sprintf(
                            msgFmtBuffer.entries[2].str,
                            strTable->entries[2].str);
                        msgFmtBuffer.entries[0].unk4 = strTable->entries[0].unk4;
                        msgFmtBuffer.entries[1].unk4 = strTable->entries[1].unk4;
                        msgFmtBuffer.entries[2].unk4 = strTable->entries[2].unk4;
                        msgFmtBuffer.numEntries = strTable->numEntries;
                    }
                    else
                    {
                        if (freeBytes / (1 << 13) == 1)
                            strTable = &lbl_802F14C8;
                        else
                            strTable = &lbl_802F14C0;
                        sprintf(
                            msgFmtBuffer.entries[0].str,
                            strTable->entries[0].str);
                        sprintf(
                            msgFmtBuffer.entries[1].str,
                            strTable->entries[1].str,
                            freeBytes / (1 << 13));
                        sprintf(
                            msgFmtBuffer.entries[2].str,
                            strTable->entries[2].str,
                            lbl_802BA310.unk48 / (1 << 13));
                        msgFmtBuffer.entries[0].unk4 = strTable->entries[0].unk4;
                        msgFmtBuffer.entries[1].unk4 = strTable->entries[1].unk4;
                        msgFmtBuffer.entries[2].unk4 = strTable->entries[2].unk4;
                        msgFmtBuffer.numEntries = strTable->numEntries;
                    }
                }
                lbl_802BA310.unkC = &msgFmtBuffer;
                lbl_802BA310.unk4C = 0xFF;
            }
            else
            {
                lbl_802BA310.unk42 = 0;
                lbl_802BA310.unk8 &= ~(1 << (31-0x16));
                lbl_802BA310.unk4C = 13;
                if (lbl_802BA310.unk8 & (1 << (31-0x12))
                 && ((lbl_802BA310.unk8 & 0x10080) == 0x10080))
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
                lbl_802BA310.unkC = &msgSaveSuccessNoMoreFiles;
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
                        lbl_802BA310.unkC = &msgSaveFinished;
                }
            }
            lbl_802BA310.unk8 &= ~(1 << (31-0x10));
            lbl_802BA310.unk8 |= 8;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    }
}

void func_800A0D1C(void)
{
    s32 status = CARDCreateAsync(0, lbl_802BA310.fileName, lbl_802BA310.unk48, &lbl_802BA310.cardFileInfo, NULL);

    if (status < 0)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }

    switch (status)
    {
    case -128:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -8:
        lbl_802BA310.unkC = &msgCantMakeMoreFiles;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -9:
        sprintf(msgFmtBuffer.entries[0].str, lbl_802F14F0.entries[0].str);
        sprintf(msgFmtBuffer.entries[1].str, lbl_802F14F0.entries[1].str);
        msgFmtBuffer.entries[0].unk4 = lbl_802F14F0.entries[0].unk4;
        msgFmtBuffer.entries[1].unk4 = lbl_802F14F0.entries[1].unk4;
        msgFmtBuffer.numEntries = lbl_802F14F0.numEntries;
        lbl_802BA310.unkC = &msgFmtBuffer;
        lbl_802BA310.unk4C = 0xFF;
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 14;
        break;
    }
}

void func_800A0E94(void)
{
    s32 status = CARDGetResultCode(0);

    if (status != -1)
        lbl_802BA310.unk40 = 0;
    if (status < -1)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }

    switch (status)
    {
    case -6:
    case -12:
    case -128:
    default:
        printf("fatal: %d\n", (int)status);
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -8:
        lbl_802BA310.unkC = &msgCantMakeMoreFiles;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -5:
        lbl_802BA310.unkC = &msgMemCardCantUse;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
    case -9:
        sprintf(msgFmtBuffer.entries[0].str, lbl_802F14F0.entries[0].str);
        sprintf(msgFmtBuffer.entries[1].str, lbl_802F14F0.entries[1].str);
        msgFmtBuffer.entries[0].unk4 = lbl_802F14F0.entries[0].unk4;
        msgFmtBuffer.entries[1].unk4 = lbl_802F14F0.entries[1].unk4;
        msgFmtBuffer.numEntries = lbl_802F14F0.numEntries;
        lbl_802BA310.unkC = &msgFmtBuffer;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case 0:
        lbl_802BA310.unk8 |= 0x802;
        lbl_802BA310.unk4C = 0x13;
        break;
    }
}

void func_800A10A8(void *data)
{
    s32 result = CARDWriteAsync(
        &lbl_802BA310.cardFileInfo,
        data,
        lbl_802BA310.unk48,
        0,
        NULL);

    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
    lbl_802BA310.unk8 |= 0x200;

    switch (result)
    {
    case -128:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -11:
        lbl_802BA310.unkC = &msgFileSizeChanged;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 0x12;
        break;
    }
}

void func_800A11A0(void)
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
    case -10:
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -5:
        lbl_802BA310.unkC = &msgMemCardCantUse;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -11:
        lbl_802BA310.unkC = &msgFileSizeChanged;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -14:
        lbl_802BA310.unkC = &msgSaveInterrupted;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
    case 0:
        lbl_802BA310.unk4C = 0x15;
        break;
    }
}

void func_800A1330(void)
{
    s32 result = CARDSetStatusAsync(0, lbl_802BA310.cardFileInfo.fileNo, &lbl_802BA2A0, 0);

    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
    lbl_802BA310.unk8 |= 0x200;

    switch (result)
    {
    case -128:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 0x16;
        break;
    }
}

void func_800A1404(void)
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
    case -4:
    case -10:
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
    case 0:
        if (lbl_802BA310.unk8 & (1 << (31-0x12)))
        {
            lbl_802BA310.unk8 |= 0x400000;
            if (lbl_802BA310.unk8 & (1 << (31-15)))
                lbl_802BA310.unk4C = 11;
            else
                lbl_802BA310.unk4C = 31;
        }
        else
        {
            lbl_802BA310.unk40 = 0x4B0;
            lbl_802BA310.unk4C = 30;
        }
        break;
    }
}

void func_800A1584(void *buffer)
{
    s32 result = CARDReadAsync(&lbl_802BA310.cardFileInfo, buffer, lbl_802BA310.unk48, 0, NULL);

    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
    lbl_802BA310.unk8 |= 0x200;

    switch (result)
    {
    case -128:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -11:
        lbl_802BA310.unkC = &msgFileSizeChanged;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 0x10;
        break;
    }
}

void func_800A167C(void)
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
    case -4:
    case -10:
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -5:
        lbl_802BA310.unkC = &msgMemCardCantUse;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -11:
        lbl_802BA310.unkC = &msgFileSizeChanged;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -14:
        lbl_802BA310.unkC = &msgLoadInterrupted;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
    case 0:
        if (lbl_802BA310.unk8 & (1 << (31-19)))
        {
            if (lbl_802F21C4->unk0 == mathutil_calc_crc16(lbl_802BA310.unk48 - 2, (u8 *)lbl_802F21C4 + 2)
             && func_8004C6DC(lbl_802F21C4->unk2050) != 0)
            {
                lbl_802BA310.unk8 |= 8;
                lbl_802BA310.unk4C = 0xFF;
            }
            else
            {
                lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
                lbl_802BA310.unk8 |= 0x200;
                lbl_802BA310.unk8 |= 0x4000;
                lbl_802BA310.unkC = &msgReplayDataDamaged;
                lbl_802BA310.unk4C = 0xFF;
            }
        }
        else if (lbl_802BA310.unk8 & (1 << (31-0x1B)))
            lbl_802BA310.unk4C = 0x13;
        else
        {
            u8 *r4 = (u8 *)lbl_802F21AC + 2;
            if (lbl_802F21AC->unk0 != mathutil_calc_crc16(0x5C04 - (r4 - (u8 *)lbl_802F21AC), r4))
            {
                lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
                lbl_802BA310.unk8 |= 0x200;
                lbl_802BA310.unk8 |= 0x4000;
                lbl_802BA310.unkC = &msgGameDataDamaged;
                lbl_802BA310.unk4C = 0xFF;
            }
            else
            {
                if (lbl_802F21AC->unk2 != 0x16)
                {
                    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
                    lbl_802BA310.unk8 |= 0x200;
                    lbl_802BA310.unkC = &msgGameDataWrongVersion;
                    lbl_802BA310.unk4C = 0xFF;
                }
                else
                    lbl_802BA310.unk4C = 0x25;
            }
        }
        break;
    }
}

void func_800A1988(void)
{
    s32 result = CARDGetStatus(0, lbl_802BA310.cardFileInfo.fileNo, &lbl_802BA2A0);

    if (result != -1)
        lbl_802BA310.unk40 = 0;
    if (result < -1)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }

    switch (result)
    {
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -4:
        lbl_802BA310.unkC = &lbl_802F14A0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -10:
        lbl_802BA310.unkC = &msgCantReadFile;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
    case 0:
        if (lbl_802BA310.unk8 & (1 << (31-0x1B)))
            lbl_802BA310.unk4C = 0x11;
        else
        {
            if ((lbl_802BA310.unk8 & (1 << (31-0x19))) == 0)
            {
                lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
                lbl_802BA310.unk8 |= 0x200;
            }
            lbl_802BA310.unkC = &msgLoadFinished;
            lbl_802BA310.unk4C = 0xFF;
            lbl_802BA310.unk8 |= 8;
            lbl_802BA310.unk8 &= ~(1 << (31-14));
        }
        break;
    }
}

void func_800A1B58(void)
{
    s32 result = __CARDFormatRegionAsync(0, 0);

    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
    lbl_802BA310.unk8 |= 0x200;

    switch (result)
    {
    case -128:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 10;
        break;
    }
}

void func_800A1C24(void)
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
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -5:
        lbl_802BA310.unkC = &msgMemCardCantUse;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
    case 0:
        lbl_802BA310.unk4C = 13;
        break;
    }
}

void func_800A1D64(void)
{
    struct UnkStruct802F21BC *r3;
    int result = CARDGetStatus(0, lbl_802F21B2, &lbl_802BA2A0);

    if (result != -1)
        lbl_802BA310.unk40 = 0;

    switch (result)
    {
    case -128:
    default:
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
        lbl_802BA310.unkC = &msgMemCardRemoved;
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
    case 0:
        if (strncmp((char *)lbl_802BA2A0.gameName, "GMBE", 4) == 0
         && strncmp((char *)lbl_802BA2A0.company, "8P", 2) == 0
         && strncmp((char *)lbl_802BA2A0.fileName, "smkb", 4) == 0)
        {
            r3 = &lbl_802F21BC[lbl_802F21B8];
            r3->unk14 = lbl_802F21B2;
            r3->unk10 = lbl_802BA2A0.length;
            lbl_802F21B8++;
        }
        // fall through
    case -4:
    case -10:
        if (++lbl_802F21B2 >= 0x7F)
        {
            r3 = &lbl_802F21BC[lbl_802F21B8];
            r3->unk14 = -1;
            if (lbl_802F21B8 == 0)
            {
                lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
                lbl_802BA310.unk8 |= 0x200;
                lbl_802BA310.unkC = &msgNoReplayData;
                lbl_802BA310.unk4C = 0xFF;
                lbl_802BA310.unk8 &= ~(1 << (31-14));
            }
            else
                lbl_802BA310.unk4C = 0x1A;
        }
        else
        {
            lbl_802BA310.unk40 = 0x4B0;
            memset(&lbl_802BA2A0, 0, sizeof(lbl_802BA2A0));
        }
        break;
    }
}

extern u8 lbl_802F21C8;

void func_800A1FE8(void)
{
    struct UnkStruct802F21BC *r30 = &lbl_802F21BC[lbl_802F21B8];
    s32 result;

    if (lbl_802F21C8 == 0)
    {
        result = CARDFastOpen(0, r30->unk14, &lbl_802BA310.cardFileInfo);

        if (result != -1)
            lbl_802BA310.unk40 = 0;
        if (result < -1)
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
        }

        switch (result)
        {
        case -128:
        default:
            lbl_802BA310.unkC = &msgMemCardError;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -3:
            lbl_802BA310.unkC = &msgMemCardRemoved;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -4:
            lbl_802BA310.unkC = &lbl_802F14A0;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -10:
            lbl_802BA310.unkC = &msgCantLoadFile;
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
        case -6:
            lbl_802BA310.unkC = &lbl_802F1490;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case 0:
            lbl_802BA310.unk8 |= 2;
            lbl_802BA310.unk42 = 0;
            lbl_802BA310.unk8 &= ~(1 << (31-0x16));
            lbl_802F21C8 = 1;
            lbl_802BA310.unk40 = 0x4B0;
            break;
        }
    }
    else if (lbl_802F21C8 == 1)
    {
        if ((lbl_802F21C4 = OSAlloc(r30->unk10)) == NULL)
            OSPanic("memcard.c", 0x9CA, "cannot OSAlloc");
        result = CARDReadAsync(&lbl_802BA310.cardFileInfo, lbl_802F21C4, r30->unk10, 0, NULL);

        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;

        switch (result)
        {
        case -128:
            lbl_802BA310.unkC = &msgMemCardError;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -11:
            lbl_802BA310.unkC = &msgFileSizeChanged;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -3:
            lbl_802BA310.unkC = &msgMemCardRemoved;
            lbl_802BA310.unk4C = 0xFF;
            break;
        default:
            lbl_802BA310.unk42 = 0;
            lbl_802BA310.unk8 &= ~(1 << (31-0x16));
            lbl_802BA310.unk40 = 0x4B0;
            lbl_802F21C8 = 2;
            break;
        }
    }
    else
    {
        result = CARDGetResultCode(0);

        if (result != -1)
            lbl_802BA310.unk40 = 0;
        if (result < -1)
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
        }

        switch (result)
        {
        case -10:
        case -128:
        default:
            lbl_802BA310.unkC = &msgMemCardError;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -5:
            lbl_802BA310.unkC = &msgMemCardCantUse;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -11:
            lbl_802BA310.unkC = &msgFileSizeChanged;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -14:
            lbl_802BA310.unkC = &msgLoadInterrupted;
            lbl_802BA310.unk4C = 0xFF;
            break;
        case -3:
            lbl_802BA310.unkC = &msgMemCardRemoved;
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
        case 0:
            CARDClose(&lbl_802BA310.cardFileInfo);
            if (mathutil_calc_crc16(r30->unk10 - 2, (u8 *)lbl_802F21C4 + 2) != lbl_802F21C4->unk0)
            {
                r30->unk2 = 0x100;
                r30->unk4 = 1;
                r30->unk5 = 0;
                r30->unk6 = 0;
                r30->unk7 = 0;
                r30->unk8 = 0;
                r30->unkC = 0;
            }
            else
            {
                r30->unk2 = lbl_802F21C4->unk2;
                r30->unk4 = lbl_802F21C4->unk4;
                r30->unk5 = lbl_802F21C4->unk5;
                r30->unk6 = lbl_802F21C4->unk6;
                r30->unk7 = lbl_802F21C4->unk7;
                r30->unk8 = lbl_802F21C4->unk8;
                r30->unkC = lbl_802F21C4->unkC;
            }
            OSFree(lbl_802F21C4);
            lbl_802F21C4 = 0;
            if (lbl_802F21B8 == 0)
            {
                lbl_802BA310.unk8 |= 8;
                lbl_802BA310.unk4C = 0xFF;
                lbl_802BA310.unk8 &= ~(1 << (31-14));
            }
            else
            {
                lbl_802F21C8 = 0;
                lbl_802F21B8--;
                lbl_802BA310.unk40 = 0x4B0;
            }
            break;
        }
    }
}

extern u32 lbl_802F21C0;

void func_800A2538(void)
{
    s32 result = CARDFastOpen(0, lbl_802F21BC[lbl_802F21C0].unk14, &lbl_802BA310.cardFileInfo);

    if (result != -1)
        lbl_802BA310.unk40 = 0;
    if (result < -1)
    {
        lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
        lbl_802BA310.unk8 |= 0x200;
    }

    switch (result)
    {
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -4:
        lbl_802BA310.unkC = &lbl_802F14A0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -10:
        lbl_802BA310.unkC = &msgCantLoadFile;
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
    case -6:
        lbl_802BA310.unkC = &lbl_802F1490;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case 0:
        lbl_802BA310.unk8 |= 2;
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk4C = 15;
        break;
    }
}

void func_800A26FC(int fileNo)
{
    s32 result;

    if (fileNo < 0)
        result = -4;
    else
        result = CARDFastDeleteAsync(0, fileNo, NULL);

    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
    lbl_802BA310.unk8 |= 0x200;

    switch (result)
    {
    case -128:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        if (lbl_802BA310.unk4C == 11)
            lbl_802BA310.unk4C = 12;
        else
            lbl_802BA310.unk4C = 0x24;
        break;
    }
}

void func_800A27F8(void)
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
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -4:
        lbl_802BA310.unkC = &lbl_802F14A0;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -10:
        lbl_802BA310.unkC = &msgCantLoadFile;
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
    case 0:
        if (lbl_802BA310.unk8 & (1 << (31-0x12)))
        {
            if (lbl_802BA310.unk4C == 0x24)
                lbl_802BA310.unk4C = 7;
            else
                lbl_802BA310.unk4C = 31;
        }
        else
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
            lbl_802BA310.unkC = &msgDeleteFinished;
            lbl_802BA310.unk4C = 0xFF;
            lbl_802BA310.unk8 |= 8;
        }
        break;
    }
}

void func_800A29CC(void)
{
    s32 result = CARDDeleteAsync(0, "super_monkey_ball.000", NULL);

    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
    lbl_802BA310.unk8 |= 0x200;

    switch (result)
    {
    case -128:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 0x26;
        break;
    }
}

void func_800A2AA0(void)
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
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -10:
        lbl_802BA310.unkC = &msgCantLoadFile;
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
    case -4:
    case 0:
        if (lbl_802BA310.unk8 & (1 << (31-0x19)))
        {
            lbl_802BA310.unk42 = 0;
            lbl_802BA310.unk8 &= ~(1 << (31-0x16));
            lbl_802BA310.unk40 = 0x4B0;
            lbl_802BA310.unk4C = 0x17;
            lbl_802BA310.unk8 |= 0x40000;
        }
        else
        {
            lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
            lbl_802BA310.unk8 |= 0x200;
            lbl_802BA310.unkC = &msgLoadFinished;
            lbl_802BA310.unk4C = 0xFF;
            lbl_802BA310.unk8 |= 8;
            lbl_802BA310.unk8 &= ~(1 << (31-14));
        }
        break;
    }
}

void func_800A2C74(void)
{
    s32 result = CARDRenameAsync(0, "super_monkey_ball.000", "super_monkey_ball.sys", NULL);

    lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
    lbl_802BA310.unk8 |= 0x200;

    switch (result)
    {
    case -128:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -4:
        if (lbl_802F21B0 == 2)
        {
            lbl_802BA310.unk42 = 0;
            lbl_802BA310.unk8 &= ~(1 << (31-0x16));
            lbl_802BA310.unk40 = 0x4B0;
            lbl_802BA310.unk4C = 0x17;
        }
        else
        {
            lbl_802BA310.unkC = &lbl_802F14A0;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    default:
        lbl_802BA310.unk42 = 0;
        lbl_802BA310.unk8 &= ~(1 << (31-0x16));
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 32;
        break;
    }
}

void func_800A2DA4(void)
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
    case -7:
    case -12:
    case -128:
    default:
        lbl_802BA310.unkC = &msgMemCardError;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -3:
        lbl_802BA310.unkC = &msgMemCardRemoved;
        lbl_802BA310.unk4C = 0xFF;
        break;
    case -4:
        if (lbl_802BA310.unk8 & (1 << (31-0x1A)))
        {
            lbl_802BA310.unk42 = 0;
            lbl_802BA310.unk8 &= ~(1 << (31-0x16));
            if (lbl_802BA310.unk8 & (1 << (31-0x19)))
            {
                lbl_802BA310.unk40 = 0x4B0;
                lbl_802BA310.unk4C = 0x17;
            }
            else
                lbl_802BA310.unk4C = 15;
        }
        else
        {
            lbl_802BA310.unkC = &lbl_802F14A0;
            lbl_802BA310.unk4C = 0xFF;
        }
        break;
    case -10:
        lbl_802BA310.unkC = &msgCantLoadFile;
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
    case 0:
        if (lbl_802BA310.unk8 & (1 << (31-0x1A)))
            lbl_802BA310.unk4C = 7;
        else if ((lbl_802BA310.unk8 & 0x00010040) == 0x10040)
        {
            lbl_802BA310.unk4C = 0xFF;
            lbl_802BA310.unk8 &= ~(1 << (31-0x10));
            lbl_802BA310.unk8 |= 8;
        }
        else
        {
            if (lbl_802BA310.unk8 & (1 << (31-0x19)))
                lbl_802BA310.unk8 |= 0x80000;
            lbl_802BA310.unk40 = 0x4B0;
            lbl_802BA310.unk4C = 0x1E;
        }
        break;
    }
}

extern struct
{
    u8 filler0[4];
    u16 unk4;
    u8 filler8[4];
} lbl_801F3D88;

extern struct
{
    u8 filler0[4];
    u16 unk4;
    u8 filler8[4];
} lbl_801F3D94;

void func_800A2FDC(void)
{
    switch (lbl_802BA310.unk4C)
    {
    case 1:
        if ((lbl_801F3D88.unk4 & (1 << (31-0x17)))
         || !(lbl_802BA310.unk8 & (1 << (31-0x18))))
        {
            lbl_802BA310.unk40 = 0x3C;
            lbl_802BA310.unk4C = 2;
        }
        break;
    case 2:
        func_8009FB8C();
        break;
    case 3:
        if ((lbl_802F21AC = OSAlloc(lbl_802BA310.unk48)) == NULL)
            OSPanic("memcard.c", 0xBF6, "cannot OSAlloc");
        memset(lbl_802F21AC, 0, lbl_802BA310.unk48);
        lbl_802BA310.unk8 |= 0x20000;
        func_8009FDD4();
        break;
    case 4:
        func_8009FF18();
        break;
    case 5:
        func_800A00C0();
        break;
    case 6:
        func_800A01B0();
        break;
    case 7:
        lbl_802BA310.unk40 = 0x4B0;
        if (lbl_802BA310.unk4C == 7)
            lbl_802BA310.unk4C = 8;
        else
            lbl_802BA310.unk4C = 0x22;
        // fall through
    case 8:
        func_800A03DC();
        break;
    case 0x1F:
        func_800A2C74();
        break;
    case 0x20:
        func_800A2DA4();
        break;
    case 0x17:
        func_800A06CC();
        break;
    case 0xF:
        func_800A1584(lbl_802F21AC);
        break;
    case 0x10:
        func_800A167C();
        break;
    case 0x25:
        func_800A29CC();
        break;
    case 0x26:
        func_800A2AA0();
        break;
    case 0xFF:
        break;
    default:
        printf("stat: %d\n", lbl_802BA310.unk4C);
        OSPanic("memcard.c", 0xC47, "load_sequence\n");
        break;
    }
}

void func_800A3204(void)
{
    u8 *r4;

    switch (lbl_802BA310.unk4C)
    {
    case 1:
        if ((lbl_801F3D88.unk4 & (1 << (31-0x17)))
         || !(lbl_802BA310.unk8 & (1 << (31-0x18))))
        {
            lbl_802BA310.unk40 = 0x3C;
            lbl_802BA310.unk4C = 2;
        }
        break;
    case 2:
        func_8009FB8C();
        break;
    case 3:
        if ((lbl_802F21AC = OSAlloc(lbl_802BA310.unk48)) == NULL)
            OSPanic("memcard.c", 0xC6A, "cannot OSAlloc");
        memset(lbl_802F21AC, 0, lbl_802BA310.unk48);
        func_8009FDD4();
        break;
    case 4:
        func_8009FF18();
        break;
    case 5:
        func_800A00C0();
        break;
    case 6:
        func_800A01B0();
        break;
    case 0x21:
        lbl_802BA310.unk40 = 0x4B0;
        if (lbl_802BA310.unk4C == 7)
            lbl_802BA310.unk4C = 8;
        else
            lbl_802BA310.unk4C = 0x22;
        // fall through
    case 0x22:
        func_800A03DC();
        break;
    case 0x23:
        func_800A26FC(lbl_802BA310.unk0);
        break;
    case 0x24:
        func_800A27F8();
        break;
    case 7:
        strcpy(lbl_802BA310.fileName, "super_monkey_ball.sys");
        lbl_802BA310.unk40 = 0x4B0;
        if (lbl_802BA310.unk4C == 7)
            lbl_802BA310.unk4C = 8;
        else
            lbl_802BA310.unk4C = 0x22;
        // fall through
    case 8:
        func_800A03DC();
        break;
    case 9:
        if ((lbl_801F3D88.unk4 & 1)
         || (lbl_801F3D94.unk4 & 1))
        {
            if (lbl_802F21B1 == 0)
                func_8002B5C8(0x6C);
            lbl_802F21B1 = 1;
        }
        if ((lbl_801F3D88.unk4 & 2)
         || (lbl_801F3D94.unk4 & 2))
        {
            if (lbl_802F21B1 == 1)
                func_8002B5C8(0x6C);
            lbl_802F21B1 = 0;
        }
        if (lbl_801F3D88.unk4 & (1 << (31-0x17)))
        {
            func_8002B5C8(0x6A);
            lbl_802BA310.unk8 &= ~(1 << (31-0x15));
            if (lbl_802F21B1 == 0)
            {
                lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
                lbl_802BA310.unk8 |= 0x200;
                lbl_802BA310.unkC = &msgFormatInterrupted;
                lbl_802BA310.unk4C = 0xFF;
            }
            else
            {
                lbl_802BA310.unk8 |= 0x200000;
                func_800A1B58();
            }
        }
        break;
    case 0xA:
        func_800A1C24();
        if (lbl_802BA310.unk4C != 10)
            lbl_802BA310.unk8 &= ~(1 << (31-10));
        break;
    case 0x17:
        func_800A06CC();
        break;
    case 0xD:
        if (lbl_802BA310.unk8 & (1 << (31-0x15)))
        {
            if ((lbl_801F3D88.unk4 & 1)
             || (lbl_801F3D94.unk4 & 1))
            {
                if (lbl_802F21B1 == 0)
                    func_8002B5C8(0x6C);
                lbl_802F21B1 = 1;
            }
            if ((lbl_801F3D88.unk4 & 2)
             || (lbl_801F3D94.unk4 & 2))
            {
                if (lbl_802F21B1 == 1)
                    func_8002B5C8(0x6C);
                lbl_802F21B1 = 0;
            }
            if (!(lbl_801F3D88.unk4 & (1 << (31-0x17))))
                break;
            func_8002B5C8(0x6A);
            lbl_802BA310.unk8 &= ~(1 << (31-0x15));
            if (lbl_802F21B1 == 0)
            {
                lbl_802BA310.unk42 = (lbl_802BA310.unk8 & (1 << (31-0x19))) ? 0xB4 : 0;
                lbl_802BA310.unk8 |= 0x200;
                lbl_802BA310.unkC = &msgSaveInterrupted;
                lbl_802BA310.unk4C = 0xFF;
                break;
            }
        }
        strcpy(lbl_802BA310.fileName, "super_monkey_ball.000");
        lbl_802BA310.unk8 |= 0x208000;
        func_800A0D1C();
        break;
    case 0xE:
        func_800A0E94();
        break;
    case 0x13:
        memset(&lbl_802BA2A0, 0, 0x6C);
        lbl_802BA310.unk40 = 0x4B0;
        lbl_802BA310.unk4C = 0x14;
        break;
    case 0x14:
        func_800A1988();
        break;
    case 0x11:
        func_8009F568();
        func_800A4E70();
        lbl_802F21AC->unk2 = 0x16;
        r4 = (u8 *)lbl_802F21AC + 2;
        lbl_802F21AC->unk0 = mathutil_calc_crc16(0x5C04 - (r4 - (u8 *)lbl_802F21AC), r4);
        func_800A10A8(lbl_802F21AC);
        break;
    case 0x12:
        func_800A11A0();
        break;
    case 0x15:
        func_800A1330();
        break;
    case 0x16:
        func_800A1404();
        break;
    case 0xB:
        func_800A26FC(lbl_802BA310.unk0);
        break;
    case 0xC:
        func_800A27F8();
        break;
    case 0x1F:
        func_800A2C74();
        break;
    case 0x20:
        func_800A2DA4();
        if (lbl_802BA310.unk4C != 0x20)
            lbl_802BA310.unk8 &= ~(1 << (31-10));
        break;
    case 0x1E:
        func_800A06CC();
        break;
    case 0xFF:
        break;
    default:
        printf("stat: %d\n", lbl_802BA310.unk4C);
        OSPanic("memcard.c", 0xD40, "save_sequence\n");
        break;
    }
}
