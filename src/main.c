#include <stdlib.h>
#include <dolphin.h>
#include <string.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "event.h"
#include "input.h"
#include "load.h"
#include "mode.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "perf.h"
#include "stage.h"
#include "world.h"

struct Struct8008CF00 lbl_801ED920[146];

struct NaomiModel *lbl_802F1B4C;
void *dvdReadBuffer;
void *lbl_802F1B44;
void *lbl_802F1B40;
struct Struct802F1B3C *lbl_802F1B3C;
u32 globalFrameCounter;
u32 unpausedFrameCounter;
GXRenderModeObj *currRenderMode;

OSHeapHandle mainHeap;
OSHeapHandle subHeap;
OSHeapHandle stageHeap;
OSHeapHandle backgroundHeap;
OSHeapHandle charaHeap;

long mainHeapSize;
long subHeapSize;
long stageHeapSize;
long backgroundHeapSize;
long charaHeapSize;

struct NaomiObj *naomiCommonObj;
struct NaomiObj *naomiStageObj;
struct NaomiObj *naomiBackgroundObj;
struct NaomiObj *lbl_802F1AF8;
struct NaomiObj *minigameNaomiObj;

struct TPL *naomiCommonTpl;
struct TPL *naomiStageTpl;
struct TPL *naomiBackgroundTpl;
struct TPL *lbl_802F1AE4;
struct TPL *minigameNaomiTpl;

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
    avdisp_init();
    currentBallStructPtr = &ballInfo[0];
    currentWorldStructPtr = &worldInfo[0];
    chkstatus_init();
    func_8008CF00(lbl_801ED920, 0x80);
    func_800487B4();
    camera_init();
    polydisp_init();
    ord_tbl_init_buffer(lbl_802F1B44, 0x10000);
    ord_tbl_init(0.0f, 0.0f, 400.0f, lbl_80292E70, 0x4000);
    func_80092498();
    func_800948F4();
    load_common_graphics();
    init_ape_model_info("motdat.lz", "motlabel.bin", "motskl.bin", "motinfo.lz");
    mot_ape_init();
    func_800AD38C();
    q_initialize_stage_dyn_part_info();
    loadingStageIdRequest = 1;
    lbl_802F1F40 = 1;
    q_reset_gamedata();
    func_80065C58();
    globalFrameCounter++;
    srand(OSGetTime());

    while (1)
    {
        if (perfEnabled)
            PERFEventStart(0);

        perf_start_timer(4);
        q_bitmap_frame_reset();
        beginframe_main();
        perfInfo.unk0 = perf_stop_timer(4);

        func_800ACA40();

        perf_start_timer(4);
        sound_main();
        perfInfo.soundTime = perf_stop_timer(4);

        perf_start_timer(4);
        input_main();
        perfInfo.inputTime = perf_stop_timer(4);

        perf_start_timer(4);
        debug_main();
        perfInfo.debugTime = perf_stop_timer(4);

        perf_start_timer(4);
        load_main();
        perfInfo.loadTime = perf_stop_timer(4);

        perf_start_timer(4);
        gm_main();
        perfInfo.unk14 = perf_stop_timer(4);

        if (perfEnabled)
            PERFEventEnd(0);

        if (perfEnabled)
            PERFEventStart(1);

        perf_start_timer(4);
        chkstatus_main();
        perfInfo.unk18 = perf_stop_timer(4);

        perf_start_timer(4);
        event_main();
        perfInfo.eventTime = perf_stop_timer(4);

        if (perfEnabled)
            PERFEventEnd(1);

        if (perfEnabled)
            PERFEventStart(2);

        perf_start_timer(4);
        polydisp_main();
        perfInfo.polydispTime = perf_stop_timer(4);

        perf_start_timer(4);
        bitmap_main();
        perfInfo.bitmapTime = perf_stop_timer(4);

        perf_start_timer(4);
        window_main();
        perfInfo.windowTime = perf_stop_timer(4);

        if (perfEnabled)
            PERFEventEnd(2);

        perf_start_timer(4);
        gpwait_main();
        perfInfo.gpwaitTime = perf_stop_timer(4);

        perf_start_timer(4);
        syncwait_main();
        perfInfo.unk30 = perf_stop_timer(4);

        perf_start_timer(4);
        shadowerase_main();
        perfInfo.unk34 = perf_stop_timer(4);

        globalFrameCounter++;
        if ((gamePauseStatus & 0xA) == 0)
            unpausedFrameCounter++;
    }
}

#pragma force_active on
u8 unkData[] = {0, 0, 1, 1, 2, 3, 2, 3, 5, 4, 6, 0};
#pragma force_active reset
