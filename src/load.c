/* load.c - Implements a queue and cache to load files */
#include <dolphin.h>

#include "global.h"
#include "load.h"
#include "perf.h"

#pragma force_active on

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
    /*0x58*/ struct FileCacheEntry *cacheEntry;
};

static struct FileLoadInfo fileLoadQueue[16];
static struct FileCacheEntry fileCache[32];

volatile int aramToMramInProgress;
int currFileCacheIndex;
volatile int mramToAramInProgress;
volatile int dvdReadStatus;
int loadQueueHead;  // index of first added file
int loadQueueTail;  // index of most recently added file
u32 lbl_802F2130;

#define ARAM_BASE 0x700000
#define ARAM_SIZE 0x400000

u32 aramAllocEnd = ARAM_BASE;

static void mram_to_aram_callback(u32 arqRequestPtr)
{
    mramToAramInProgress = FALSE;
}

static struct FileCacheEntry *alloc_file_cache_entry(s32);
static void dvd_read_callback(s32, DVDFileInfo *);
static int get_next_file_id(int id);

void load_main(void)
{
    struct FileLoadInfo *info;
    static ARQRequest aramRequest;

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
        info->cacheEntry = alloc_file_cache_entry(info->fileSize);
        info->cacheEntry->entryNum = info->entryNum;
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
            &aramRequest,
            0,
            ARQ_TYPE_MRAM_TO_ARAM,
            ARQ_PRIORITY_HIGH,
            (u32)dvdReadBuffer,
            info->cacheEntry->aramAddr + info->fileOffset,
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
            info->cacheEntry->hasData = TRUE;
            DVDClose(&info->dvdFile);
            // Move to the next file
            loadQueueHead = get_next_file_id(loadQueueHead);
        }
        break;
    }
}

BOOL file_open(const char *filename, struct File *file)
{
    int i;
    int entryNum = DVDConvertPathToEntrynum((char *)filename);
    struct FileCacheEntry *entry = fileCache;

    // Search for a cache entry for this file
    for (i = 0; i < ARRAY_COUNT(fileCache); i++, entry++)
    {
        if (entry->hasData == TRUE && entry->entryNum == entryNum)
        {
            file->isCached = TRUE;
            file->cacheEntry = *entry;
            return TRUE;
        }
    }

    // Not cached. Open it from the filesystem.
    file->isCached = FALSE;
    return DVDOpen((char *)filename, &file->dvdFile);
}

BOOL file_close(struct File *file)
{
    switch (file->isCached)
    {
    case TRUE:
        return TRUE;
    case FALSE:
        break;
    }
    return DVDClose(&file->dvdFile);
}

void aram_to_mram_callback(u32 arqRequestPtr)
{
    aramToMramInProgress = FALSE;
}

s32 file_read(struct File *file, void *dest, u32 size, u32 offset)
{
    ARQRequest req;

    switch (file->isCached)
    {
    case TRUE:
        // Copy data from ARAM cache
        aramToMramInProgress = TRUE;
        DCInvalidateRange(dest, size);
        ARQPostRequest(
            &req,
            0,
            ARQ_TYPE_ARAM_TO_MRAM,
            ARQ_PRIORITY_HIGH,
            file->cacheEntry.aramAddr + offset,
            (u32)dest,
            size,
            aram_to_mram_callback);
        while (aramToMramInProgress)
            ;
        return size;
    default:
        return u_read_dvd_file(&file->dvdFile, dest, size, offset);
    }
}

u32 file_size(struct File *file)
{
    switch (file->isCached)
    {
    case TRUE:
        return file->cacheEntry.aramSize;
    default:
        return file->dvdFile.length;
    }
}

static void dvd_read_callback(s32 result, DVDFileInfo *dvdFile)
{
    if (result == DVD_RESULT_FATAL_ERROR)
        dvdReadStatus = -1;
    else
        dvdReadStatus = 0;
}

static void invalidate_file_cache_range(u32 addr, u32 size);

static struct FileCacheEntry *alloc_file_cache_entry(s32 size)
{
    u32 aramAddr;
    struct FileCacheEntry *entry;

    size = OSRoundUp32B(size);
    // allocate a range of ARAM to hold the file data
    if (ARAM_BASE + ARAM_SIZE - aramAllocEnd > size)
    {
        // if there is space left, add to end
        aramAddr = aramAllocEnd;
        aramAllocEnd += size;
    }
    else
    {
        // otherwise, start over from beginning
        aramAddr = ARAM_BASE;
        aramAllocEnd = ARAM_BASE + size;
    }

    // kick out any existing cache entry using this range
    invalidate_file_cache_range(aramAddr, size);

    entry = &fileCache[currFileCacheIndex];
    if (++currFileCacheIndex >= ARRAY_COUNT(fileCache))
        currFileCacheIndex = 0;
    entry->hasData = FALSE;
    entry->aramAddr = aramAddr;
    entry->aramSize = size;
    return entry;
}

static void invalidate_file_cache_range(u32 addr, u32 size)
{
    struct FileCacheEntry *entry = &fileCache[0];
    int i;

    for (i = 0; i < ARRAY_COUNT(fileCache); i++, entry++)
    {
        if (entry->hasData
         && entry->aramAddr < (addr + size)
         && entry->aramAddr + entry->aramSize > addr)
            entry->hasData = FALSE;
    }
}

static int add_entrynum_to_load_queue(int entryNum);

/* Adds a file to the load queue for fast loading */
int file_preload(const char *filename)
{
    int entryNum = DVDConvertPathToEntrynum((char *)filename);
    if (entryNum < 0)
        return FALSE;
    if (loadQueueTail == loadQueueHead)
        perf_start_timer(2);
    return add_entrynum_to_load_queue(entryNum);
}

static int add_entrynum_to_load_queue(int entryNum)
{
    int nextId = get_next_file_id(loadQueueTail);
    if (loadQueueHead == nextId)
        return FALSE;
    fileLoadQueue[loadQueueTail].state = 0;
    fileLoadQueue[loadQueueTail].entryNum = entryNum;
    loadQueueTail = nextId;
    return TRUE;
}

static int get_next_file_id(int id)
{
    id++;
    if (id < ARRAY_COUNT(fileLoadQueue))
        return id;
    else
        return 0;
}

int is_load_queue_not_empty(void)
{
    return loadQueueTail != loadQueueHead;
}

void empty_load_queue(void)
{
    loadQueueHead = loadQueueTail;
}

int get_load_queue_count(void)
{
    if (loadQueueTail < loadQueueHead)
        return loadQueueTail + ARRAY_COUNT(fileLoadQueue) - loadQueueHead;
    else
        return loadQueueTail - loadQueueHead;
}

void empty_file_cache(void)
{
    aramAllocEnd = ARAM_BASE;
}

u8 lbl_802B57A0[0x3800];

void func_80092498(void)
{
    func_800924CC();
    lbl_802F2150 = 0;
    lbl_802F2154 = lbl_802B57A0;
}
