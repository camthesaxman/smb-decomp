#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "bitmap.h"
#include "ball.h"
#include "camera.h"
#include "course.h"
#include "event.h"
#include "game.h"
#include "info.h"
#include "input.h"
#include "mathutil.h"
#include "load.h"
#include "mode.h"
#include "sprite.h"
#include "stage.h"

static int lbl_0000185D;

static void sel_stage_init(void);
static void sel_stage_handle_input(void);

void _prolog(void)
{
    func_80012510(sel_stage_handle_input, sel_stage_draw, NULL, NULL);
    sel_stage_init();
    gameSubmodeRequest = SMD_SEL_STAGE_MAIN;
}

void _epilog(void) {}

void _unresolved(void)
{
    u32 i;
    u32 *sp;

    puts("\nError: A called an unlinked function.\n");
    puts("Address:      Back Chain    LR Save\n");

    i = 0;
    sp = (u32 *)OSGetStackPointer();
    while (sp != NULL && (u32)sp != 0xFFFFFFFF && i++ < 16)
    {
        printf("0x%08x:   0x%08x    0x%08x\n", (u32)sp, sp[0], sp[1]);
        sp = (u32 *)sp[0];
    }
    OSPanic("sel_stage_rel.c", 71, "\n");
}

static void sel_stage_init(void)
{
    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.submodeTimer = 0;
    modeCtrl.playerCount = 1;
    modeCtrl.unk30 = 1;
    modeCtrl.gameType = GAMETYPE_MAIN_NORMAL;
    modeCtrl.unk40 = 0;
    spritePoolInfo.unkC[0] = 2;
    spritePoolInfo.unkC[1] = 0;
    spritePoolInfo.unkC[2] = 0;
    spritePoolInfo.unkC[3] = 0;
    modeCtrl.currPlayer = 0;

    func_8002FFEC();
    event_finish_all();
    free_all_bitmap_groups_except_com();
    func_800569B4(loadingStageIdRequest);
    load_stage(loadingStageIdRequest);
    call_bitmap_load_group(BMP_NML);
    preload_stage_files(loadingStageIdRequest);
    lbl_0000185D = loadingStageIdRequest;

    event_start(EVENT_STAGE);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_EFFECT);
    event_start(EVENT_ITEM);
    event_start(EVENT_STOBJ);
    event_start(EVENT_BACKGROUND);
    event_start(EVENT_REND_EFC);

    func_800972CC();
    camera_set_state(12);
    u_isCompetitionModeCourse = 0;
    func_800123DC();
    create_sel_stage_sprites();
    dummy_func_C90();
    func_800668A0();
    loadingStageId = infoWork.u_currStageId;
    start_screen_fade(FADE_IN, RGBA(0, 0, 0, 0), 30);
    gameSubmodeRequest = SMD_SEL_STAGE_MAIN;
}

static void sel_stage_handle_input(void)
{
    int r3;

    if (gamePauseStatus & 0xA)
        return;

    if (CONTROLLER_SOMETHING(0, PAD_BUTTON_UP))
    {
        if (--stageSelection.difficulty < 0)
            stageSelection.difficulty = 7;
    }
    else if (CONTROLLER_SOMETHING(0, PAD_BUTTON_DOWN))
    {
        if (++stageSelection.difficulty >= 8)
           stageSelection.difficulty = 0;
    }

    switch (stageSelection.difficulty)
    {
    case 0:  // all stages
        modeCtrl.courseFlags &= ~(1 << 0);
        modeCtrl.courseFlags &= ~COURSE_FLAG_EXTRA;
        modeCtrl.courseFlags &= ~COURSE_FLAG_MASTER;
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_LEFT))
        {
            if (--loadingStageIdRequest < 1)
                loadingStageIdRequest = 1;
        }
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_RIGHT))
        {
            if (++loadingStageIdRequest > 200)
                loadingStageIdRequest = 200;
        }
        break;
    case 1:  // Beginner
        modeCtrl.difficulty = DIFFICULTY_BEGINNER;
        modeCtrl.courseFlags |=  (1 << 0);
        modeCtrl.courseFlags &= ~COURSE_FLAG_EXTRA;
        modeCtrl.courseFlags &= ~COURSE_FLAG_MASTER;
        break;
    case 2:  // Advanced
        modeCtrl.difficulty = DIFFICULTY_ADVANCED;
        modeCtrl.courseFlags |=  (1 << 0);
        modeCtrl.courseFlags &= ~COURSE_FLAG_EXTRA;
        modeCtrl.courseFlags &= ~COURSE_FLAG_MASTER;
        break;
    case 3:  // Expert
        modeCtrl.difficulty = DIFFICULTY_EXPERT;
        modeCtrl.courseFlags |=  (1 << 0);
        modeCtrl.courseFlags &= ~COURSE_FLAG_EXTRA;
        modeCtrl.courseFlags &= ~COURSE_FLAG_MASTER;
        break;
    case 4:  // Beginner Extra
        modeCtrl.difficulty = DIFFICULTY_BEGINNER;
        modeCtrl.courseFlags |=  (1 << 0);
        modeCtrl.courseFlags |=  COURSE_FLAG_EXTRA;
        modeCtrl.courseFlags &= ~COURSE_FLAG_MASTER;
        break;
    case 5:  // Advanced Extra
        modeCtrl.difficulty = DIFFICULTY_ADVANCED;
        modeCtrl.courseFlags |=  (1 << 0);
        modeCtrl.courseFlags |=  COURSE_FLAG_EXTRA;
        modeCtrl.courseFlags &= ~COURSE_FLAG_MASTER;
        break;
    case 6:  // Expert Extra
        modeCtrl.difficulty = DIFFICULTY_EXPERT;
        modeCtrl.courseFlags |=  (1 << 0);
        modeCtrl.courseFlags |=  COURSE_FLAG_EXTRA;
        modeCtrl.courseFlags &= ~COURSE_FLAG_MASTER;
        break;
    case 7:  // Master
        modeCtrl.difficulty = DIFFICULTY_EXPERT;
        modeCtrl.courseFlags |= (1 << 0);
        modeCtrl.courseFlags |= COURSE_FLAG_EXTRA;
        modeCtrl.courseFlags |= COURSE_FLAG_MASTER;
        break;
    }
    if (stageSelection.difficulty != 0)
    {
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_LEFT))
            stageSelection.levelNum--;
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_RIGHT))
            stageSelection.levelNum++;

        if (stageSelection.levelNum < 1)
            r3 = 1;
        else if (stageSelection.levelNum > course_floor_count(modeCtrl.difficulty, modeCtrl.courseFlags))
            r3 = course_floor_count(modeCtrl.difficulty, modeCtrl.courseFlags);
        else
            r3 = stageSelection.levelNum;

        stageSelection.levelNum = r3;
        loadingStageIdRequest = floor_to_stage_id(modeCtrl.difficulty, stageSelection.levelNum, modeCtrl.courseFlags);
    }
    if (lbl_0000185D != loadingStageIdRequest)
    {
        dummy_func_C94();
        empty_load_queue();
        preload_stage_files(loadingStageIdRequest);
        lbl_0000185D = loadingStageIdRequest;
    }
    infoWork.u_currStageId = loadingStageIdRequest;
    loadingStageId = loadingStageIdRequest;
    if (lbl_0000185D != currStageId && !is_load_queue_not_empty())
    {
        event_finish(EVENT_EFFECT);
        event_finish(EVENT_ITEM);
        event_finish(EVENT_STOBJ);
        event_finish(EVENT_REND_EFC);
        func_800569B4(lbl_0000185D);
        load_stage(lbl_0000185D);
        event_start(EVENT_EFFECT);
        event_start(EVENT_ITEM);
        event_start(EVENT_STOBJ);
        event_start(EVENT_BACKGROUND);
        event_start(EVENT_REND_EFC);
        camera_set_state(12);
        func_800972CC();
    }

    if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_A)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_B)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_X)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_Y))
    {
        if (controllerInfo[0].unk0[0].button & PAD_BUTTON_Y)
            playerCharacterSelection[0] = 3;
        else if (controllerInfo[0].unk0[0].button & PAD_BUTTON_X)
            playerCharacterSelection[0] = 2;
        else if (controllerInfo[0].unk0[0].button & PAD_BUTTON_B)
            playerCharacterSelection[0] = 1;
        else
            playerCharacterSelection[0] = 0;
        dummy_func_C98();
        gameModeRequest = MD_GAME;
        gameSubmodeRequest = SMD_GAME_FIRST_INIT;
    }
}
