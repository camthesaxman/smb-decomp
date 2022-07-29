#include <dolphin.h>
#include <stdlib.h>
#include <string.h>

#ifdef AURORA
#include "imgui.h"
#include <aurora/aurora.h>
#include <aurora/event.h>
#include <aurora/main.h>
#endif

#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "course.h"
#include "event.h"
#include "global.h"
#include "input.h"
#include "load.h"
#include "mode.h"
#include "mot_ape.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "perf.h"
#include "pool.h"
#include "recplay.h"
#include "stage.h"
#include "world.h"

struct Struct8008CF00 lbl_801ED920[146];

struct NlModel *lbl_802F1B4C;
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

struct NlObj *g_commonNlObj;
struct NlObj *g_stageNlObj;
struct NlObj *g_bgNlObj;
struct NlObj *lbl_802F1AF8;
struct NlObj *g_minigameNlObj;

struct TPL *g_commonNlTpl;
struct TPL *g_stageNlTpl;
struct TPL *g_bgNlTpl;
struct TPL *lbl_802F1AE4;
struct TPL *g_minigameNlTpl;

#ifdef AURORA
#include <stdio.h>
void aurora_log_callback(AuroraLogLevel level, const char *message, unsigned int len)
{
    const char *levelStr = "??";
    FILE *out = stdout;
    switch (level)
    {
    case LOG_DEBUG:
        levelStr = "DEBUG";
        break;
    case LOG_INFO:
        levelStr = "INFO";
        break;
    case LOG_WARNING:
        levelStr = "WARNING";
        break;
    case LOG_ERROR:
        levelStr = "ERROR";
        out = stderr;
        break;
    case LOG_FATAL:
        levelStr = "FATAL";
        out = stderr;
        break;
    }
    fprintf(out, "[%s: %s]\n", levelStr, message);
    if (level == LOG_FATAL)
    {
        fflush(out);
        abort();
    }
}
#endif

#ifdef __GNUC__
void __eabi(void)
{
}
__attribute__((section(".text")))
#endif
#ifdef AURORA
int main(int argc, char* argv[])
#else
void main(void)
#endif
{
#ifdef AURORA
    const AuroraInfo auroraInfo = aurora_initialize(argc, argv,
                                                    &(AuroraConfig){
                                                        .appName = "Super Monkey Ball",
                                                        .logCallback = &aurora_log_callback,
                                                    });
#endif
    // dipSwitches = DIP_DEBUG|DIP_STCOLI;
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
    recplay_init();
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
    u_initialize_stage_dyn_part_info();
    loadingStageIdRequest = 1;
    lbl_802F1F40 = 1;
    u_reset_gamedata();
    course_init();
    globalFrameCounter++;
    srand(OSGetTime());

    while (1)
    {
#ifdef AURORA
        const AuroraEvent *event = aurora_update();
        bool exiting = false;
        while (event != NULL && event->type != AURORA_NONE)
        {
            if (event->type == AURORA_EXIT)
            {
                exiting = true;
                break;
            }
            ++event;
        }
        if (exiting)
        {
            break;
        }
#endif
        if (perfEnabled)
            PERFEventStart(0);

        perf_start_timer(4);
        u_bitmap_frame_reset();
#ifdef AURORA
        aurora_begin_frame();
#endif
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

#ifdef AURORA
        imgui_main(&auroraInfo);
        aurora_end_frame();
#endif

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

#ifdef AURORA
        frame_limiter();
#endif
    }

#ifdef AURORA
    aurora_shutdown();
#endif
}

#pragma force_active on
u8 unkData[] = {0, 0, 1, 1, 2, 3, 2, 3, 5, 4, 6, 0};
#pragma force_active reset
