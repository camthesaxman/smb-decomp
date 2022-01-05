#include <stdlib.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "input.h"
#include "mode.h"
#include "nl2ngc.h"
#include "perf.h"
#include "stage.h"

// bss
u8 lbl_801ED920[0x1240];  // unknown type
GXRenderModeObj lbl_801EEB60;

// .sbss

BOOL lbl_802F1B58;
void *lbl_802F1B54;
void *lbl_802F1B50;
struct NaomiModel *lbl_802F1B4C;
void *dvdReadBuffer;
void *lbl_802F1B44;
void *lbl_802F1B40;
Mtx *lbl_802F1B3C;
u32 globalFrameCounter;
u32 unpausedFrameCounter;
GXRenderModeObj *currRenderMode;

OSHeapHandle memHeap5;
OSHeapHandle memHeap1;
OSHeapHandle memHeap2;
OSHeapHandle memHeap3;
OSHeapHandle memHeap4;

long memHeap5Size;
long memHeap1Size;
long memHeap2Size;
long memHeap3Size;
long memHeap4Size;

struct NaomiObj *naomiCommonObj;
struct NaomiObj *naomiStageObj;
struct NaomiObj *naomiBackgroundObj;
struct NaomiObj *lbl_802F1AF8;
struct NaomiObj *lbl_802F1AF4;

struct TPL *naomiCommonTpl;
struct TPL *naomiStageTpl;
struct TPL *naomiBackgroundTpl;
struct TPL *lbl_802F1AE4;
struct TPL *lbl_802F1AE0;

void main(void)
{
    globalFrameCounter = 0;
    initialize();
    gm_init();
    bitmap_init();
    window_init();
    event_init();
    perf_init();
    sound_init();
    func_8008D788();
    currentBallStructPtr = &ballInfo[0];
    currentWorldStructPtr = &lbl_80206BF0[0];
    chkstatus_init();
    func_8008CF00(lbl_801ED920, 0x80);
    func_800487B4();
    camera_init();
    polydisp_init();
    func_80085B54(lbl_802F1B44, 0x10000);
    func_800855CC(0.0f, 0.0f, 400.0f, lbl_80292E70, 0x4000);
    func_80092498();
    func_800948F4();
    func_800248DC();
    init_ape_model_info("motdat.lz", "motlabel.bin", "motskl.bin", "motinfo.lz");
    func_8008AE98();
    func_800AD38C();
    func_80044794();
    loadingStageIdRequest = 1;
    lbl_802F1F40 = 1;
    func_80011E1C();
    func_80065C58();
    globalFrameCounter++;
    srand(OSGetTime());

    while (1)
    {
        if (perfEnabled)
            PERFEventStart(0);

        perf_init_timer(4);
        func_80026394();
        preproc_main();
        perfInfo.unk0 = perf_stop_timer(4);

        func_800ACA40();

        perf_init_timer(4);
        sound_main();
        perfInfo.unk4 = perf_stop_timer(4);

        perf_init_timer(4);
        input_main();
        perfInfo.unk8 = perf_stop_timer(4);

        perf_init_timer(4);
        debug_main();
        perfInfo.unkC = perf_stop_timer(4);

        perf_init_timer(4);
        load_main();
        perfInfo.unk10 = perf_stop_timer(4);

        perf_init_timer(4);
        gm_main();
        perfInfo.unk14 = perf_stop_timer(4);

        if (perfEnabled)
            PERFEventEnd(0);

        if (perfEnabled)
            PERFEventStart(1);

        perf_init_timer(4);
        chkstatus_main();
        perfInfo.unk18 = perf_stop_timer(4);

        perf_init_timer(4);
        event_main();
        perfInfo.unk1C = perf_stop_timer(4);

        if (perfEnabled)
            PERFEventEnd(1);

        if (perfEnabled)
            PERFEventStart(2);

        perf_init_timer(4);
        polydisp_main();
        perfInfo.unk20 = perf_stop_timer(4);

        perf_init_timer(4);
        bitmap_main();
        perfInfo.unk24 = perf_stop_timer(4);

        perf_init_timer(4);
        window_main();
        perfInfo.unk28 = perf_stop_timer(4);

        if (perfEnabled)
            PERFEventEnd(2);

        perf_init_timer(4);
        epiproc_main();
        perfInfo.unk2C = perf_stop_timer(4);

        perf_init_timer(4);
        syncwait_main();
        perfInfo.unk30 = perf_stop_timer(4);

        perf_init_timer(4);
        shadowerase_main();
        perfInfo.unk34 = perf_stop_timer(4);

        globalFrameCounter++;
        if ((gamePauseStatus & 0xA) == 0)
            unpausedFrameCounter++;
    }
}

u8 unkData[] = {0, 0, 1, 1, 2, 3, 2, 3, 5, 4, 6, 0};
