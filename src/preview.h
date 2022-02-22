#ifndef _SRC_PREVIEW_H_
#define _SRC_PREVIEW_H_

#include <dolphin/types.h>
#include <dolphin/GXStruct.h>
#include <dolphin/OSAlloc.h>
#include <dolphin/dvd.h>

struct Preview
{
    u8 state;
    s8 isLoading;
    u16 flags;
    GXTexObj texObj;
    void *imagePtr;
    u32 size;
    u16 width;
    u16 height;
    u32 format;
    OSHeapHandle heap;
    DVDFileInfo fileInfo;
};

void preview_create_with_alloc_img(struct Preview *preview, char *filename, int index, u32 width, u32 height, u32 format);
void preview_create(struct Preview *preview, char *filename, int index, u32 width, u32 height, u32 format);
void start_preview_image_read(struct Preview *preview, int index);
void g_preview_wait_then_do_something(struct Preview *preview);
void g_preview_maybe_invalidate_tex_cache(struct Preview *preview);
void preview_free();

#endif
