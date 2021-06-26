#include <dolphin.h>

#include "variables.h"

extern GXRenderModeObj lbl_801E8E98;
extern GXRenderModeObj lbl_801E8F10;
extern GXRenderModeObj lbl_801E8ED4;
extern GXRenderModeObj lbl_801EEB60;
extern u8 lbl_801EEBA0[];

void init_gx(void);
void init_tv(void);
void init_vi(void);
void init_gx_2(void);

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

    lbl_802F1CA4[4] = GXInit(OSAllocFromHeap(__OSCurrHeap, 0x100000), 0x100000);
    lbl_802F1CA4[5] = lbl_801EEBA0;
    r31 = OSAllocFromHeap(__OSCurrHeap, 0x100000);
    GXInitFifoBase(lbl_802F1CA4[5], r31, 0x100000);
    GXInitFifoPtrs(lbl_802F1CA4[5], r31, r31);
    GXSetViewport(0.0f, 0.0f, lbl_802F1B30->fbWidth, lbl_802F1B30->xfbHeight, 0.0f, 1.0f);
    GXSetScissor(0, 0, lbl_802F1B30->fbWidth, lbl_802F1B30->efbHeight);
    GXSetDispCopySrc(0, 0, lbl_802F1B30->fbWidth, lbl_802F1B30->efbHeight);
    GXSetDispCopyDst(lbl_802F1B30->fbWidth, lbl_802F1B30->xfbHeight);
    GXSetDispCopyYScale((float)lbl_802F1B30->xfbHeight / (float)lbl_802F1B30->efbHeight);
    GXSetCopyFilter(lbl_802F1B30->aa, lbl_802F1B30->sample_pattern, 1, lbl_802F1B30->vfilter);
    GXSetPixelFmt(GX_PF_RGB8_Z24, GX_ZC_LINEAR);
    GXCopyDisp(lbl_802F1CA4[0], 1);
    GXSetDispCopyGamma(GX_GM_1_0);
}

void init_tv(void)
{
    switch (VIGetTvFormat())
    {
    case 0:
        lbl_802F1B30 = &lbl_801E8E98;
        break;
    case 1:
        lbl_802F1B30 = &lbl_801E8F10;
        break;
    case 2:
        lbl_802F1B30 = &lbl_801E8ED4;
        break;
    default:
        OSPanic("init.c", 0x8E, "init_system: invalid TV format\n");
        break;
    }
    GXAdjustForOverscan(lbl_802F1B30, &lbl_801EEB60, 0, 16);
    lbl_802F1B30 = &lbl_801EEB60;
}

void init_vi(void)
{
    VIConfigure(lbl_802F1B30);
    VISetNextFrameBuffer(lbl_802F1CA4[1]);
    lbl_802F1CA4[0] = lbl_802F1CA4[2];
    VIFlush();
    VIWaitForRetrace();
    if (lbl_802F1B30->viTVmode & 1)
        VIWaitForRetrace();
}

void init_gx_2(void)
{
    Mtx44 mtx;
    GXColor clearColor = {0x00, 0x0A, 0x20, 0x00};
    
    C_MTXPerspective(mtx, 60.0f, 1.3333333f, 0.1f, 1000000.0f);
    GXSetProjection(mtx, GX_PERSPECTIVE);
    func_8009E588(0);
    func_8009E110(1, 4, 5, 0);
    GXSetAlphaCompare(GX_GREATER, 0, GX_AOP_AND, GX_GREATER, 0);
    GXSetCopyClear(clearColor, 0x00FFFFFF);
    GXSetDither(FALSE);
}
