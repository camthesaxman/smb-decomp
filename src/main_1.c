#include <dolphin.h>

#include "variables.h"
#include "functions.h"

void main(void)
{
    lbl_802F1B38 = 0;
    initialize();
    gm_init();
    func_80025EC0();
    window_init();
    event_init();
    func_800272E0();
    sound_init();
    func_8008D788();
    currentBallStructPtr = lbl_80205E60;
    currentWorldStructPtr = lbl_80206BF0;
    chkstatus_init();
    func_8008CF00(lbl_801ED920, 0x80);
    func_800487B4();
    camera_init();
    polydisp_init();
    func_80085B54(lbl_802F1B44, 0x10000);
    func_800855CC(0.0f /*0x1EC220*/, 0.0f, 400.0f /*0x1EC224*/, lbl_80292E70, 0x4000);
    func_80092498();
    func_800948F4();
    func_800248DC();
    //init_ape_model_info(lbl_80172380+0, lbl_80172380+0xC, lbl_80172380+0x1C, lbl_80172380+0x28);
    //init_ape_model_info(lbl_80172380, lbl_8017238C, lbl_8017239C, lbl_801723B4);
    init_ape_model_info("motdat.lz" /*0x16F380*/, "motlabel.bin", "motskl.bin", "motinfo.lz");
    func_8008AE98();
    func_800AD38C();
    func_80044794();
    loadingStageIdRequest = 1;
    lbl_802F1F40 = 1;
    func_80011E1C();
    func_80065C58();
    lbl_802F1B38++;
    srand(OSGetTime());
    
    //lbl_800066A0
    while (1)
    {
        if (lbl_802F1D28)
            PERFEventStart(0);
            
        perf_init_timer(4);
        func_80026394();
        preproc_main();
        lbl_801F8DE0.unk0 = perf_stop_timer(4);
        
        func_800ACA40();
        
        perf_init_timer(4);
        sound_main();
        lbl_801F8DE0.unk4 = perf_stop_timer(4);
        
        perf_init_timer(4);
        input_main();
        lbl_801F8DE0.unk8 = perf_stop_timer(4);
        
        perf_init_timer(4);
        debug_main();
        lbl_801F8DE0.unkC = perf_stop_timer(4);
        
        perf_init_timer(4);
        load_main();
        lbl_801F8DE0.unk10 = perf_stop_timer(4);
        
        perf_init_timer(4);
        gm_main();
        lbl_801F8DE0.unk14 = perf_stop_timer(4);  
        
        if (lbl_802F1D28)
            PERFEventEnd(0);
            
        if (lbl_802F1D28)
            PERFEventStart(1);
        
        perf_init_timer(4);
        chkstatus_main();
        lbl_801F8DE0.unk18 = perf_stop_timer(4);
        
        perf_init_timer(4);
        event_main();
        lbl_801F8DE0.unk1C = perf_stop_timer(4);
        
        if (lbl_802F1D28)
            PERFEventEnd(1);
            
        if (lbl_802F1D28)
            PERFEventStart(2);
            
        perf_init_timer(4);
        polydisp_main();
        lbl_801F8DE0.unk20 = perf_stop_timer(4);
        
        perf_init_timer(4);
        bmpdisp_main();
        lbl_801F8DE0.unk24 = perf_stop_timer(4);
        
        perf_init_timer(4);
        window_main();
        lbl_801F8DE0.unk28 = perf_stop_timer(4);
        
        if (lbl_802F1D28)
            PERFEventEnd(2);

        perf_init_timer(4);
        epiproc_main();
        lbl_801F8DE0.unk2C = perf_stop_timer(4);
        
        perf_init_timer(4);
        syncwait_main();
        lbl_801F8DE0.unk30 = perf_stop_timer(4);
        
        perf_init_timer(4);
        shadowerase_main();
        lbl_801F8DE0.unk34 = perf_stop_timer(4);
        
        lbl_802F1B38++;
        if ((lbl_802F1EE0 & 0xA) == 0)
            lbl_802F1B34++;
    }
}

u8 unkData[] = {0, 0, 1, 1, 2, 3, 2, 3, 5, 4, 6, 0};

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
    GXSetViewport(0.0f /*0x1EC228*/, 0.0f, lbl_802F1B30->fbWidth, lbl_802F1B30->xfbHeight, 0.0f, 1.0f /*0x1EC22C*/);
    GXSetScissor(0, 0, lbl_802F1B30->fbWidth, lbl_802F1B30->efbHeight);
    GXSetDispCopySrc(0, 0, lbl_802F1B30->fbWidth, lbl_802F1B30->efbHeight);
    GXSetDispCopyDst(lbl_802F1B30->fbWidth, lbl_802F1B30->xfbHeight);
    GXSetDispCopyYScale((float)lbl_802F1B30->xfbHeight / (float)lbl_802F1B30->efbHeight);
    GXSetCopyFilter(lbl_802F1B30->aa, lbl_802F1B30->sample_pattern, 1, lbl_802F1B30->vfilter);
    GXSetPixelFmt(GX_PF_RGB8_Z24, GX_ZC_LINEAR);
    GXCopyDisp(lbl_802F1CA4[0], 1);
    GXSetDispCopyGamma(GX_GM_1_0);
}

struct Struct801723C0 lbl_801723C0 =
{
    (void *)0x802F1B4C, 0x10000,
    (void *)0x802F1B48, 0x18000,
    (void *)0x802F1B44, 0x10000,
    (void *)0x802F1B40, 0x8C000,
};

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
    GXColor clearColor = {0x00, 0x0A, 0x20, 0x00} /*0x1EC238*/;
    
    C_MTXPerspective(mtx, 60.0f, 1.3333333f, 0.1f, 1000000.0f);
    GXSetProjection(mtx, GX_PERSPECTIVE);
    func_8009E588(0);
    func_8009E110(1, 4, 5, 0);
    GXSetAlphaCompare(GX_GREATER, 0, GX_AOP_AND, GX_GREATER, 0);
    GXSetCopyClear(clearColor, 0x00FFFFFF);
    GXSetDither(FALSE);
}

void init_dvd(void)
{
    DVDChangeDir("test");
}
