#include <dolphin.h>

#include <dolphin/GXEnum.h>
#include "global.h"
#include "gxcache.h"
#include "gxutil.h"
#include "input.h"
#include "perf.h"

OSTick perfTimers[8];
u32 perfEnabled;
s8 zTrigTimer;
u32 lbl_802F1D20;
u32 perfDispListSizes[2];
void *perfDispLists[2];

#define OS_BUS_CLOCK_SPEED (*(u32 *)0x800000F8)

void perf_init_timer(int timerId)
{
    perfTimers[timerId] = OSGetTick();
}

u32 perf_stop_timer(volatile /* why ?*/ int timerId2)
{
    return ((OSGetTick() - perfTimers[timerId2]) * 8)
         / ((OS_BUS_CLOCK_SPEED / 4) / 125000);
}

void perf_free(void *ptr)
{
    OSFreeToHeap(subHeap, ptr);
}

void *perf_alloc(u32 size)
{
    return OSAllocFromHeap(subHeap, size);
}

void perf_init_draw(void)
{
    GXColor matColor = {255, 255, 255, 255};
    GXColor ambColor = {  0,   0,   0, 255};

    GXSetChanCtrl(
        GX_COLOR0A0,  // chan
        GX_DISABLE,  // enable
        GX_SRC_REG,  // amb_src
        GX_SRC_VTX,  // mat_src
        GX_LIGHT_NULL,  // light_mask
        GX_DF_NONE,  // diff_fn
        GX_AF_NONE);  // attn_fn
    GXSetChanAmbColor(GX_COLOR0A0, ambColor);
    GXSetChanMatColor(GX_COLOR0A0, matColor);
    GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZMode_cached(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
    GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, ambColor);
    GXSetZCompLoc_cached(1);
    GXSetNumTexGens(1);
    GXSetNumChans(1);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevOp_cached(GX_TEVSTAGE0, GX_DECAL);
    perfEnabled = FALSE;
}

void perf_init(void)
{
    PERFInit(
        100,  // numSamples
        1,  // numFramesHistory
        3,  // numTypes
        perf_alloc,  // allocator
        perf_free,  // deallocator
        perf_init_draw);  // initDraw
    PERFSetEvent(0, "MODE",  PERF_CPU_EVENT);
    PERFSetEvent(1, "EVENT", PERF_CPU_EVENT);
    PERFSetEvent(2, "DISP",  PERF_CPU_GP_EVENT);
    PERFSetDrawBWBarKey(TRUE);
    perfDispLists[0] = OSAlloc(0x3000);
    perfDispLists[1] = OSAlloc(0x3000);
    lbl_802F1D20 = 0;
}

void func_80027388(void)
{
    if (perfEnabled)
    {
        PERFEndFrame();
        PERFStopAutoSampling();
        gxutil_begin_display_list(perfDispLists[lbl_802F1D20 & 1], 0x3000);
        PERFDumpScreen();
        perfDispListSizes[lbl_802F1D20 & 1] = gxutil_end_display_list();
    }
    if (lbl_802F1D20 != 0 && perfEnabled)
    {
        PERFPreDraw();
        GXCallDisplayList(
            perfDispLists[lbl_802F1D20 & 1],
            perfDispListSizes[lbl_802F1D20 & 1]);
        PERFPostDraw();
        GXSetLineWidth(gxCache->lineWidth, gxCache->texOffsets);
        GXSetZCompLoc_from_cache();
        GXSetNumTevStages_from_cache();
    }
    lbl_802F1D20++;
}

void func_80027448(void)
{
    if (dipSwitches & DIP_DEBUG)
    {
        if (controllerInfo[0].unk0[0].button & PAD_TRIGGER_Z)
        {
            if (zTrigTimer < 127)
                zTrigTimer++;
            if (zTrigTimer > 30)
                perfEnabled = TRUE;
        }
        else
        {
            zTrigTimer = 0;
            perfEnabled = FALSE;
        }
    }
    else
    {
        zTrigTimer = 0;
        perfEnabled = FALSE;
    }
    if (perfEnabled)
    {
        PERFStartFrame();
        PERFStartAutoSampling(1.0f);
    }
}
