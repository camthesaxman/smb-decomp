#include <dolphin.h>

#include "functions.h"
#include "variables.h"

#define MIN(a, b) ((a) < (b) ? (a) : (b))

extern s32 mramToAramInProgress;
extern s32 loadQueueHead;  // index of first added file
extern s32 loadQueueTail;  // index of most recently added file
extern volatile s32 dvdReadStatus;
extern void *dvdReadBuffer;

struct ARAMBlock
{
    s32 unk0;
    s32 entryNum;
    u32 aramAddr;
    u32 aramSize;
};
extern struct ARAMBlock lbl_802B5580[];

struct File
{
    u32 unk0;
    DVDFileInfo dvdFile;
    struct ARAMBlock unk40;
};

struct FileLoadInfo
{
    u32 state;
    u32 entryNum;
    DVDFileInfo dvdFile;
    u8 filler44[4];
    /*0x48*/ u32 fileSize;
    /*0x4C*/ u32 fileOffset;
    /*0x50*/ u32 bytesLeft;
    /*0x54*/ u32 transferSize;
    /*0x58*/ struct ARAMBlock *aramBlock;
};
extern struct FileLoadInfo fileLoadQueue[];

void dvd_read_callback(s32, DVDFileInfo *);
struct ARAMBlock *alloc_aram_block(s32);

extern ARQRequest lbl_802B5780;

#define ARAM_BASE 0x700000
#define ARAM_SIZE 0x400000 

u32 aramAllocEnd = ARAM_BASE;

void mram_to_aram_callback(u32 arqRequestPtr)
{
    mramToAramInProgress = FALSE;
}

void load_main(void)
{
    struct FileLoadInfo *info;

    if (loadQueueHead == loadQueueTail)
        return;
    info = &fileLoadQueue[loadQueueHead];
    switch (info->state)
    {
    case 0:
        info->state = 1;
        // fall through
    case 1: // Initialize
        if (dvdReadStatus < 0)  // error
        {
            loadQueueHead = loadQueueTail;
            break;
        }
        if (dvdReadStatus != 0)  // read in progress
            break;
        if (DVDFastOpen(info->entryNum, &info->dvdFile) != 1)
            OSPanic("load.c", 115, "cannot open file\n");
        info->fileSize = OSRoundUp32B(info->dvdFile.length);
        info->fileOffset = 0;
        info->bytesLeft = info->fileSize;
        info->transferSize = MIN(info->bytesLeft, 0x18000);
        info->aramBlock = alloc_aram_block(info->fileSize);
        info->aramBlock->entryNum = info->entryNum;
        // fall through
    case 2:
        // Read from DVD
        dvdReadStatus = 1;
        if (DVDReadAsync(&info->dvdFile, dvdReadBuffer, info->transferSize, info->fileOffset, dvd_read_callback) != 1)
            OSPanic("load.c", 128, "cannot read file\n");
        info->state = 4;
        break;
    case 4:
        // Check DVD status
        if (dvdReadStatus < 0)  // error
        {
            loadQueueHead = loadQueueTail;
            break;
        }
        if (dvdReadStatus != 0)  // read in progress
            break;
        // fall through
    case 5:
        // Copy data to ARAM
        mramToAramInProgress = TRUE;
        ARQPostRequest(
            &lbl_802B5780,
            0,
            ARQ_TYPE_MRAM_TO_ARAM,
            ARQ_PRIORITY_HIGH,
            (u32)dvdReadBuffer,
            info->aramBlock->aramAddr + info->fileOffset,
            info->transferSize,
            mram_to_aram_callback);
        info->state = 6;
        break;
    case 6:
        // Wait for transfer to ARAM
        if (mramToAramInProgress)
            break;
        info->bytesLeft -= info->transferSize;
        info->fileOffset += info->transferSize;
        // fall through
    case 3:
        if (info->bytesLeft != 0)
        {
            info->transferSize = MIN(info->bytesLeft, 0x18000);
            dvdReadStatus = 1;
            if (DVDReadAsync(&info->dvdFile, dvdReadBuffer, info->transferSize, info->fileOffset, dvd_read_callback) != 1)
                OSPanic("load.c", 155, "cannot read file\n");
            info->state = 4;
        }
        else
        {
            // Done reading
            info->aramBlock->unk0 = 1;
            DVDClose(&info->dvdFile);
            // Move to the next file
            loadQueueHead = get_next_file_id(loadQueueHead);
        }
        break;
    }
}

BOOL file_open(char *filename, struct File *file)
{
    int i;
    int entryNum = DVDConvertPathToEntrynum(filename);
    struct ARAMBlock *block = lbl_802B5580;

    for (i = 0; i < 32; i++, block++)
    {
        if (block->unk0 == 1 && block->entryNum == entryNum)
        {
            file->unk0 = 1;
            file->unk40 = *block;
            return 1;
        }
    }
    file->unk0 = 0;
    return DVDOpen(filename, &file->dvdFile);
}

BOOL file_close(struct File *file)
{
    switch (file->unk0)
    {
    case 1:
        return TRUE;
    case 0:
        break;
    }
    return DVDClose(&file->dvdFile);
}

extern volatile s32 aramToMramInProgress;

void aram_to_mram_callback(u32 arqRequestPtr)
{
    aramToMramInProgress = FALSE;
}

u32 file_read(struct File *file, void *dest, u32 size, u32 offset)
{
    ARQRequest req;

    switch (file->unk0)
    {
    case 1:
        // Copy data from ARAM to dest
        aramToMramInProgress = TRUE;
        DCInvalidateRange(dest, size);
        ARQPostRequest(
            &req,
            0,
            ARQ_TYPE_ARAM_TO_MRAM,
            ARQ_PRIORITY_HIGH,
            file->unk40.aramAddr + offset,
            (u32)dest,
            size,
            aram_to_mram_callback);
        while (aramToMramInProgress)
            ;
        return size;
    default:
        return func_800ACBBC(&file->dvdFile, dest, size, offset);
    }
}

u32 file_size(struct File *file)
{
    switch (file->unk0)
    {
    case 1:
        return file->unk40.aramSize;
    default:
        return file->dvdFile.length;
    }
}

void dvd_read_callback(s32 result, DVDFileInfo *dvdFile)
{
    if (result == DVD_RESULT_FATAL_ERROR)
        dvdReadStatus = -1;
    else
        dvdReadStatus = 0;
}

extern s32 lbl_802F2144;

void func_80092284(u32 a, u32 b);

struct ARAMBlock *alloc_aram_block(s32 size)
{
    u32 aramAddr;
    struct ARAMBlock *r3;

    size = OSRoundUp32B(size);
    if (ARAM_BASE + ARAM_SIZE - aramAllocEnd > size)
    {
        // Add to end
        aramAddr = aramAllocEnd;
        aramAllocEnd += size;
    }
    else
    {
        aramAddr = ARAM_BASE;
        aramAllocEnd = ARAM_BASE + size;
    }
    func_80092284(aramAddr, size);
    r3 = &lbl_802B5580[lbl_802F2144];
    if (++lbl_802F2144 >= 32)
        lbl_802F2144 = 0;
    r3->unk0 = 0;
    r3->aramAddr = aramAddr;
    r3->aramSize = size;
    return r3;
}

void func_80092284(u32 addr, u32 size)
{
    struct ARAMBlock *r7 = lbl_802B5580;
    int i;

    for (i = 0; i < 32; i++, r7++)
    {
        if (r7->unk0 != 0
         && r7->aramAddr < (addr + size)
         && r7->aramAddr + r7->aramSize > addr)
            r7->unk0 = 0;
    }
}

int file_preload(char *filename)
{
    int entryNum = DVDConvertPathToEntrynum(filename);
    if (entryNum < 0)
        return 0;
    if (loadQueueTail == loadQueueHead)
        perf_init_timer(2);
    return add_entrynum_to_load_queue(entryNum);
}

int add_entrynum_to_load_queue(int entryNum)
{
    int nextId = get_next_file_id(loadQueueTail);
    if (loadQueueHead == nextId)
        return 0;
    fileLoadQueue[loadQueueTail].state = 0;
    fileLoadQueue[loadQueueTail].entryNum = entryNum;
    loadQueueTail = nextId;
    return 1;
}

int get_next_file_id(int id)
{
    id++;
    if (id < 16)
        return id;
    else
        return 0;
}

int func_80092444(void)
{
    return loadQueueTail != loadQueueHead;
}

void func_8009245C(void)
{
    loadQueueHead = loadQueueTail;
}

int func_80092468(void)
{
    if (loadQueueTail < loadQueueHead)
        return loadQueueTail + 16 - loadQueueHead;
    else
        return loadQueueTail - loadQueueHead;
}

void func_8009248C(void)
{
    aramAllocEnd = ARAM_BASE;
}

extern void *lbl_802F2154;
extern u8 lbl_802B57A0[];
extern u32 lbl_802F2150;

void func_80092498(void)
{
    func_800924CC();
    lbl_802F2150 = 0;
    lbl_802F2154 = lbl_802B57A0;
}
