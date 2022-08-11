#include <stddef.h>
#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "gxcache.h"
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
        OSPanic("preview.c", 55, "cannot OSAlloc");

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

void preview_draw(struct Preview *preview, u32 color0, u32 color1, float x, float y, float z, float width, float height)
{
    GXColor color;
    float y2;
    float x1;
    float y1;
    float x2;

    x1 = x;
    y1 = y;
    if ((int)preview->state == 3)
    {
        GXLoadTexObj_cached(&preview->texObj, 0);

        color.r = color0 >> 16;
        color.g = color0 >> 8;
        color.b = color0 >> 0;
        color.a = 255;
        GXSetTevColor(GX_TEVREG0, color);

        color.r = color1 >> 16;
        color.g = color1 >> 8;
        color.b = color1 >> 0;
        color.a = 0;
        GXSetTevColor(GX_TEVREG1, color);

        x2 = x1 + width;
        y2 = y1 + height;
        if (preview->flags & 2)
        {
            float temp_f4 = 0.002405626 * z;
            x1 =  ((x1 - 320.0) * temp_f4);
            y1 = -((y1 - 240.0) * temp_f4);
            x2 =  ((x2 - 320.0) * temp_f4);
            y2 = -((y2 - 240.0) * temp_f4);
        }

        GXBegin(GX_QUADS, GX_VTXFMT7, 4);
            GXPosition3f32(x1, y1, -z);
            GXTexCoord2f32(0.0f, 0.0f);
            GXPosition3f32(x2, y1, -z);
            GXTexCoord2f32(1.0f, 0.0f);
            GXPosition3f32(x2, y2, -z);
            GXTexCoord2f32(1.0f, 1.0 - (1.0 / preview->height));
            GXPosition3f32(x1, y2, -z);
            GXTexCoord2f32(0.0f, 1.0 - (1.0 / preview->height));
        GXEnd();
    }
}
