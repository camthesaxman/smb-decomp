#include <stddef.h>
#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"
#include "tevutil.h"

GXFifoObj lbl_801EEBA0;

#pragma force_active on

void initialize(void)
{
    OSInit();
    init_cache();
    DVDInit();
    VIInit();
    CARDInit();
    input_init();
    mathutil_init();
    init_dvd();
    init_tv();
    init_heap();
    init_vi();
    init_gx();
    init_gx_2();
    memcard_init();
    init_wait_vblank();
    init_loading_gct();
    init_rel();
}

void init_gx(void)
{
    void *r31;

    gfxBufferInfo->fifos[0] = GXInit(OSAllocFromHeap(__OSCurrHeap, 0x100000), 0x100000);
    gfxBufferInfo->fifos[1] = &lbl_801EEBA0;
    r31 = OSAllocFromHeap(__OSCurrHeap, 0x100000);
    GXInitFifoBase(gfxBufferInfo->fifos[1], r31, 0x100000);
    GXInitFifoPtrs(gfxBufferInfo->fifos[1], r31, r31);
    GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
    GXSetScissor(0, 0, currRenderMode->fbWidth, currRenderMode->efbHeight);
    GXSetDispCopySrc(0, 0, currRenderMode->fbWidth, currRenderMode->efbHeight);
    GXSetDispCopyDst(currRenderMode->fbWidth, currRenderMode->xfbHeight);
    GXSetDispCopyYScale((float)currRenderMode->xfbHeight / (float)currRenderMode->efbHeight);
    GXSetCopyFilter(currRenderMode->aa, currRenderMode->sample_pattern, 1, currRenderMode->vfilter);
    GXSetPixelFmt(GX_PF_RGB8_Z24, GX_ZC_LINEAR);
    GXCopyDisp(gfxBufferInfo->currFrameBuf, 1);
    GXSetDispCopyGamma(GX_GM_1_0);
}

struct BufferInit
{
    void **pbuffer;
    u32 size;
};

struct BufferInit bufferInitInfo[] =
{
    { (void **)&lbl_802F1B4C,  0x10000 },
    { &dvdReadBuffer, 0x18000 },
    { &lbl_802F1B44,  0x10000 },
    { &lbl_802F1B40,  0x8C000 },
};

void init_tv(void)
{
    switch (VIGetTvFormat())
    {
    case VI_NTSC:
        currRenderMode = &GXNtsc480IntDf;
        break;
    case VI_PAL:
        currRenderMode = &GXPal528IntDf;
        break;
    case VI_MPAL:
        currRenderMode = &GXMpal480IntDf;
        break;
    default:
        OSPanic("init.c", 0x8E, "init_system: invalid TV format\n");
        break;
    }
    GXAdjustForOverscan(currRenderMode, &lbl_801EEB60, 0, 16);
    currRenderMode = &lbl_801EEB60;
}

void init_vi(void)
{
    VIConfigure(currRenderMode);
    VISetNextFrameBuffer(gfxBufferInfo->frameBufs[0]);
    gfxBufferInfo->currFrameBuf = gfxBufferInfo->frameBufs[1];
    VIFlush();
    VIWaitForRetrace();
    if (currRenderMode->viTVmode & 1)
        VIWaitForRetrace();
}

void init_gx_2(void)
{
    Mtx44 mtx;
    GXColor clearColor = {0x00, 0x0A, 0x20, 0x00};

    C_MTXPerspective(mtx, 60.0f, 1.3333333f, 0.1f, 1000000.0f);
    GXSetProjection(mtx, GX_PERSPECTIVE);
    GXSetZCompLoc_cached(0);
    GXSetBlendMode_cached(1, 4, 5, 0);
    GXSetAlphaCompare(GX_GREATER, 0, GX_AOP_AND, GX_GREATER, 0);
    GXSetCopyClear(clearColor, 0x00FFFFFF);
    GXSetDither(FALSE);
}

void init_dvd(void)
{
    DVDChangeDir("test");
}

#define SUB_HEAP_SIZE 0x80020
#define STAGE_HEAP_SIZE 0x300020
#define BACKGROUND_HEAP_SIZE 0x200020
#define CHARA_HEAP_SIZE 0x300020

#define ROUND_UP_16(x) (((u32)(x) + 0xF) & ~0xF)

void init_heap(void)
{
    u8 *arenaLo;
    u8 *arenaHi;
    u8 *arenaLoNew;
    u8 *ptr2;
    u32 memSize;
    u8* arenaEnd;
    u32 fbSize;
    int i;
    struct BufferInit *bufInit;

    arenaLo = OSGetArenaLo();
    arenaHi = OSGetArenaHi();
    memSize = OSGetPhysicalMemSize();

    lbl_802F1B50 = arenaHi;
    lbl_802F1B54 = arenaHi;
    lbl_802F1B58 = (memSize > 0x01800000);
    if (lbl_802F1B58)
    {
        OSReport("\n===================================================\n\n");
        OSReport("  System memory exists more than 24MB. Clamp 24MB.\n");
        arenaHi -= memSize - 0x01800000;
        OSReport("  Program can use memory of high-order 24MB than 0x%x freely.\n", arenaHi);
        lbl_802F1B54 = arenaHi;
        OSSetArenaHi(arenaHi);
        OSReport("\n===================================================\n\n");
    }

    arenaEnd = (void *)OSRoundDown32B(arenaHi);
    arenaLo = (void *)OSRoundUp32B(arenaLo);

    fbSize = (u16)ROUND_UP_16(currRenderMode->fbWidth) * (u16)currRenderMode->xfbHeight * 2;
    ptr2 = (void *)OSRoundUp32B(arenaLo + fbSize);
    arenaLoNew = OSInitAlloc((void *)OSRoundUp32B(ptr2 + fbSize), arenaEnd, 5);
    arenaLoNew = (void*)OSRoundUp32B(arenaLoNew);

    for (i = 0, bufInit = bufferInitInfo; i < 4; i++, bufInit++)
    {
        *bufInit->pbuffer = arenaLoNew;
        arenaLoNew = (void *)OSRoundUp32B(arenaLoNew + bufInit->size);
    }

    OSSetArenaLo(arenaLoNew);

    subHeap = OSCreateHeap(arenaLoNew, (void *)((u32)arenaLoNew + SUB_HEAP_SIZE));
    arenaLoNew += SUB_HEAP_SIZE;
    stageHeap = OSCreateHeap(arenaLoNew, (void *)((u32)arenaLoNew + STAGE_HEAP_SIZE));
    arenaLoNew += STAGE_HEAP_SIZE;
    backgroundHeap = OSCreateHeap(arenaLoNew, (void *)((u32)arenaLoNew + BACKGROUND_HEAP_SIZE));
    arenaLoNew += BACKGROUND_HEAP_SIZE;
    charaHeap = OSCreateHeap(arenaLoNew, (void *)((u32)arenaLoNew + CHARA_HEAP_SIZE));
    arenaLoNew += CHARA_HEAP_SIZE;

    mainHeap = OSCreateHeap(arenaLoNew, arenaEnd);
    OSSetCurrentHeap(mainHeap);
    OSSetArenaLo(arenaLoNew);

    mainHeapSize = OSCheckHeap(mainHeap);
    subHeapSize = OSCheckHeap(subHeap);
    stageHeapSize = OSCheckHeap(stageHeap);
    backgroundHeapSize = OSCheckHeap(backgroundHeap);
    charaHeapSize = OSCheckHeap(charaHeap);

    init_cache_ptrs();

    gfxBufferInfo->frameBufs[0] = arenaLo;
    gfxBufferInfo->frameBufs[1] = ptr2;
    gfxBufferInfo->currFrameBuf = ptr2;
    gfxBufferInfo->fbNum = 0;
}

void init_rel(void)
{
    DVDFileInfo fileInfo;

    if (DVDOpen("mkbe.str", &fileInfo))
    {
        u32 size = OSRoundUp32B(fileInfo.length);
        void *strTable = OSAllocFromHeap(__OSCurrHeap, size);
        if (g_read_dvd_file(&fileInfo, strTable, size, 0))
            OSSetStringTable(strTable);
        DVDClose(&fileInfo);
    }
}

void init_cache(void)
{
    size_t size = 0;

    LCEnable();

    mathutilData = (void *)(LC_CACHE_BASE + size);
    size += sizeof(*mathutilData);

    gfxBufferInfo = (void *)(LC_CACHE_BASE + size);
    size += sizeof(*gfxBufferInfo);

    lbl_802F1B3C = (void *)(LC_CACHE_BASE + size);
    size += sizeof(*lbl_802F1B3C);

    zMode = (void *)(LC_CACHE_BASE + size);
    size += sizeof(*zMode);

    printf("locked cache size: %d\n", size);
}
