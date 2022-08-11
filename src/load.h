#ifndef _SRC_LOAD_H_
#define _SRC_LOAD_H_

#include <dolphin/types.h>
#include <dolphin/dvd.h>

struct FileCacheEntry
{
    s32 hasData;
    s32 entryNum;
    u32 aramAddr;
    u32 aramSize;
};

struct File
{
    u32 isCached;
    DVDFileInfo dvdFile;
    struct FileCacheEntry cacheEntry;
};

BOOL file_open(const char *filename, struct File *file);
BOOL file_close(struct File *file);
s32 file_read(struct File *file, void *dest, u32 size, u32 offset);
u32 file_size(struct File *file);
void load_main(void);
int file_preload(const char *filename);
int is_load_queue_not_empty(void);
void empty_load_queue(void);
int get_load_queue_count(void);
void empty_file_cache(void);

#endif
