#include <stddef.h>
#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "preview.h"

static void init_preview(struct Preview *preview, char *filename, int index, u32 width, u32 height, u32 format)
{
    preview->state = 0;
    preview->width = width;
    preview->height = height;
    preview->format = format;
    preview->size = GXGetTexBufferSize(width, height, format, 0, 0);

    if (preview->flags & 1)
        preview->imagePtr = lbl_802F1B40;
    else
    {
        preview->heap = __OSCurrHeap;
        preview->imagePtr = OSAllocFromHeap(preview->heap, preview->size);
    }

    preview->isLoading = 0;

    if (preview->imagePtr == NULL)
        OSPanic("preview.c", 0x37, "cannot OSAlloc");

    GXInitTexObj(
        &preview->texObj,  // obj
        preview->imagePtr,  // image_ptr
        preview->width,  // width
        preview->height,  // height
        preview->format,  // format
        GX_CLAMP,  // wrap_s
        GX_CLAMP,  // wrap_t
        GX_FALSE);  // mipmap

    if (!DVDOpen(filename, &preview->fileInfo))
        OSPanic("preview.c", 60, "cannot Open");

    preview->fileInfo.cb.userData = preview;
    start_preview_image_read(preview, index);
}

void preview_create_with_alloc_img(struct Preview *preview, char *filename, int index, u32 width, u32 height, u32 format)
{
    preview->flags = 0;
    init_preview(preview, filename, index, width, height, format);
}

void preview_create(struct Preview *preview, char *filename, int index, u32 width, u32 height, u32 format)
{
    preview->flags = 1;
    init_preview(preview, filename, index, width, height, format);
}

static void read_callback(s32 result, DVDFileInfo *fileInfo)
{
    struct Preview *preview = fileInfo->cb.userData;

    if (result < 0)
    {
        printf("failed DVDReadAsync: %d\n", (int)result);
        preview->state = 0;
    }
    else
    {
        GXInitTexObj(
            &preview->texObj,  // obj
            preview->imagePtr,  // image_ptr
            preview->width,  // width
            preview->height,  // height
            preview->format,  // format
            GX_CLAMP,  // wrap_s
            GX_CLAMP,  // wrap_t
            GX_FALSE);  // mipmap
        preview->state = 2;
    }
    preview->isLoading = FALSE;
}

void start_preview_image_read(struct Preview *preview, int index)
{
    if (preview->isLoading > 0)
        DVDCancel(&preview->fileInfo.cb);
    preview->state = 1;
    preview->isLoading = TRUE;
    if (DVDReadAsync(
        &preview->fileInfo,  // fileInfo
        preview->imagePtr,  // addr
        preview->size,  // length
        preview->size * index,  // offset
        read_callback)  // callback
        != 1)
    {
        OSPanic("preview.c", 114, "cannot DVDReadAsync");
    }
}

void u_preview_wait_then_do_something(struct Preview *preview)
{
    while (preview->isLoading)
        func_800ACA40();
    u_preview_maybe_invalidate_tex_cache(preview);
}

void u_preview_maybe_invalidate_tex_cache(struct Preview *preview)
{
    switch (preview->state)
    {
    case 2:
        GXInvalidateTexAll();
        preview->state = 3;
        break;
    }
}

void preview_free(struct Preview *preview)
{
    if (preview->isLoading > 0)
        DVDCancel(&preview->fileInfo.cb);
    if (DVDClose(&preview->fileInfo) != 1)
        OSPanic("preview.c", 145, "cannot Close");
    if (!(preview->flags & 1))
        OSFreeToHeap(preview->heap, preview->imagePtr);
    preview->imagePtr = NULL;
}
