#include <dolphin.h>

#include "global.h"
#include "perf.h"

OSTick lbl_801F8DC0[8];
u32 perfEnabled;
s8 lbl_802F1D24;
u32 lbl_802F1D20;
u32 lbl_802F1D18[2];
void *lbl_802F1D10[2];

#define OS_BUS_CLOCK_SPEED (*(u32 *)0x800000F8)

void perf_init_timer(int timerId)
{
    lbl_801F8DC0[timerId] = OSGetTick();
}

u32 perf_stop_timer(volatile /* why ?*/ int timerId2)
{
    return ((OSGetTick() - lbl_801F8DC0[timerId2]) * 8)
         / ((OS_BUS_CLOCK_SPEED / 4) / 125000);
}

void perf_free(void *ptr)
{
    OSFreeToHeap(lbl_802F1B28, ptr);
}

void *perf_alloc(u32 size)
{
    return OSAllocFromHeap(lbl_802F1B28, size);
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
    func_8009E110(1, 4, 5, 0);
    if (zMode->updateEnable  != GX_ENABLE
     || zMode->compareFunc   != GX_LEQUAL
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = GX_LEQUAL;
        zMode->updateEnable  = GX_ENABLE;
    }
    func_8009E398(0, ambColor, 0.0f, 100.0f, 0.1f, 20000.0f);
    func_8009E588(1);
    GXSetNumTexGens(1);
    GXSetNumChans(1);
    func_8009EFF4(0, 0, 0, 4);
    func_8009EA30(0, 1);
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
    lbl_802F1D10[0] = OSAlloc(0x3000);
    lbl_802F1D10[1] = OSAlloc(0x3000);
    lbl_802F1D20 = 0;
}

void func_80027388(void)
{
    if (perfEnabled)
    {
        PERFEndFrame();
        PERFStopAutoSampling();
        begin_display_list(lbl_802F1D10[lbl_802F1D20 & 1], 0x3000);
        PERFDumpScreen();
        lbl_802F1D18[lbl_802F1D20 & 1] = end_display_list();
    }
    if (lbl_802F1D20 != 0 && perfEnabled)
    {
        PERFPreDraw();
        GXCallDisplayList(
            lbl_802F1D10[lbl_802F1D20 & 1],
            lbl_802F1D18[lbl_802F1D20 & 1]);
        PERFPostDraw();
        GXSetLineWidth(zMode->lineWidth, zMode->texOffsets);
        func_8009E5BC();
        func_8009F314();
    }
    lbl_802F1D20++;
}

void func_80027448(void)
{
    if (dipSwitches & 1)
    {
        if (lbl_801F3B70.unk0 & (1 << (31-0x1B)))
        {
            if (lbl_802F1D24 < 127)
                lbl_802F1D24++;
            if (lbl_802F1D24 > 30)
                perfEnabled = TRUE;
        }
        else
        {
            lbl_802F1D24 = 0;
            perfEnabled = FALSE;
        }
    }
    else
    {
        lbl_802F1D24 = 0;
        perfEnabled = FALSE;
    }
    if (perfEnabled)
    {
        PERFStartFrame();
        PERFStartAutoSampling(1.0f);
    }
}
