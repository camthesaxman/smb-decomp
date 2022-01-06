#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "input.h"
#include "mathutil.h"
#include "load.h"
#include "mode.h"
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

    modeCtrl.unk0 = 0;
    modeCtrl.playerCount = 1;
    modeCtrl.unk30 = 1;
    modeCtrl.unk28 = 0;
    modeCtrl.unk40 = 0;
    spritePoolInfo.unkC[0] = 2;
    spritePoolInfo.unkC[1] = 0;
    spritePoolInfo.unkC[2] = 0;
    spritePoolInfo.unkC[3] = 0;
    modeCtrl.unk2C = 0;

    func_8002FFEC();
    event_clear();
    g_something_with_iteratively_freeing_memory();
    func_800569B4(loadingStageIdRequest);
    load_stage(loadingStageIdRequest);
    call_something_with_bmp_bmp_com(5);
    preload_stage_files(loadingStageIdRequest);
    lbl_0000185D = loadingStageIdRequest;

    ev_run_init(EVENT_STAGE);
    ev_run_init(EVENT_CAMERA);
    ev_run_init(EVENT_SPRITE);
    ev_run_init(EVENT_SOUND);
    ev_run_init(EVENT_EFFECT);
    ev_run_init(EVENT_ITEM);
    ev_run_init(EVENT_STOBJ);
    ev_run_init(EVENT_BACKGROUND);
    ev_run_init(EVENT_REND_EFC);

    func_800972CC();
    camera_set_state(12);
    lbl_802F1FA4 = 0;
    func_800123DC();
    create_sel_stage_sprites();
    dummy_func_C90();
    func_800668A0();
    loadingStageId = lbl_801F3A58.unk2E;
    func_800732DC(0, 0, 30);
    gameSubmodeRequest = 30;
}

static void sel_stage_handle_input(void)
{
    int r3;

    if (gamePauseStatus & 0xA)
        return;

    if (CONTROLLER_SOMETHING(0, PAD_BUTTON_UP))
    {
        if (--stageSelection.levelSet < 0)
            stageSelection.levelSet = 7;
    }
    else if (CONTROLLER_SOMETHING(0, PAD_BUTTON_DOWN))
    {
        if (++stageSelection.levelSet >= 8)
           stageSelection.levelSet = 0;
    }

    switch (stageSelection.levelSet)
    {
    case 0:  // all stages
        modeCtrl.levelSetFlags &= ~(1 << 0);
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_EXTRA;
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_MASTER;
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
        modeCtrl.levelSet = LVLSET_BEGINNER;
        modeCtrl.levelSetFlags |=  (1 << 0);
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_EXTRA;
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_MASTER;
        break;
    case 2:  // Advanced
        modeCtrl.levelSet = LVLSET_ADVANCED;
        modeCtrl.levelSetFlags |=  (1 << 0);
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_EXTRA;
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_MASTER;
        break;
    case 3:  // Expert
        modeCtrl.levelSet = LVLSET_EXPERT;
        modeCtrl.levelSetFlags |=  (1 << 0);
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_EXTRA;
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_MASTER;
        break;
    case 4:  // Beginner Extra
        modeCtrl.levelSet = LVLSET_BEGINNER;
        modeCtrl.levelSetFlags |=  (1 << 0);
        modeCtrl.levelSetFlags |=  LVLSET_FLAG_EXTRA;
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_MASTER;
        break;
    case 5:  // Advanced Extra
        modeCtrl.levelSet = LVLSET_ADVANCED;
        modeCtrl.levelSetFlags |=  (1 << 0);
        modeCtrl.levelSetFlags |=  LVLSET_FLAG_EXTRA;
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_MASTER;
        break;
    case 6:  // Expert Extra
        modeCtrl.levelSet = LVLSET_EXPERT;
        modeCtrl.levelSetFlags |=  (1 << 0);
        modeCtrl.levelSetFlags |=  LVLSET_FLAG_EXTRA;
        modeCtrl.levelSetFlags &= ~LVLSET_FLAG_MASTER;
        break;
    case 7:  // Master
        modeCtrl.levelSet = LVLSET_EXPERT;
        modeCtrl.levelSetFlags |= (1 << 0);
        modeCtrl.levelSetFlags |= LVLSET_FLAG_EXTRA;
        modeCtrl.levelSetFlags |= LVLSET_FLAG_MASTER;
        break;
    }
    if (stageSelection.levelSet != 0)
    {
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_LEFT))
            stageSelection.levelNum--;
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_RIGHT))
            stageSelection.levelNum++;

        if (stageSelection.levelNum < 1)
            r3 = 1;
        else if (stageSelection.levelNum > get_last_level_num_of_set(modeCtrl.levelSet, modeCtrl.levelSetFlags))
            r3 = get_last_level_num_of_set(modeCtrl.levelSet, modeCtrl.levelSetFlags);
        else
            r3 = stageSelection.levelNum;

        stageSelection.levelNum = r3;
        loadingStageIdRequest = level_num_to_stage_id(modeCtrl.levelSet, stageSelection.levelNum, modeCtrl.levelSetFlags);
    }
    if (lbl_0000185D != loadingStageIdRequest)
    {
        dummy_func_C94();
        empty_load_queue();
        preload_stage_files(loadingStageIdRequest);
        lbl_0000185D = loadingStageIdRequest;
    }
    lbl_801F3A58.unk2E = loadingStageIdRequest;
    loadingStageId = loadingStageIdRequest;
    if (lbl_0000185D != currStageId && !is_load_queue_not_empty())
    {
        ev_run_dest(EVENT_EFFECT);
        ev_run_dest(EVENT_ITEM);
        ev_run_dest(EVENT_STOBJ);
        ev_run_dest(EVENT_REND_EFC);
        func_800569B4(lbl_0000185D);
        load_stage(lbl_0000185D);
        ev_run_init(EVENT_EFFECT);
        ev_run_init(EVENT_ITEM);
        ev_run_init(EVENT_STOBJ);
        ev_run_init(EVENT_BACKGROUND);
        ev_run_init(EVENT_REND_EFC);
        camera_set_state(12);
        func_800972CC();
    }

    if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_A)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_B)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_X)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_Y))
    {
        if (controllerInfo[0].unk0[0].button & PAD_BUTTON_Y)
            lbl_80206BC0[0] = 3;
        else if (controllerInfo[0].unk0[0].button & PAD_BUTTON_X)
            lbl_80206BC0[0] = 2;
        else if (controllerInfo[0].unk0[0].button & PAD_BUTTON_B)
            lbl_80206BC0[0] = 1;
        else
            lbl_80206BC0[0] = 0;
        dummy_func_C98();
        gameModeRequest = MD_GAME;
        gameSubmodeRequest = SMD_GAME_FIRST_INIT;
    }
}
