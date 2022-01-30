#include <stddef.h>

#include <dolphin.h>

#include "global.h"
#include "event.h"
#include "mode.h"
#include "relocation.h"
#include "sprite.h"

struct StageSelection stageSelection;
struct MinigameLink lbl_802F1BD8;
void (*lbl_802F1BD4)(void);
void (*menuCallback)(void);

void unload_sel_submode_rel(void);

void mode_sel_func(void)
{
    if (!(gameSubmode > SMD_SEL_TOP && gameSubmode < SMD_SEL_BOTTOM))
    {
        g_debug_set_cursor_pos(10, 10);
        g_debug_printf("sub_mode: error %d in Sel", gameSubmode);
        return;
    }
    
    gameSubmodeFuncs[gameSubmode]();
}

#pragma force_active on
void func_800123DC(void)
{
    stageSelection.levelSet = 0;
    stageSelection.levelNum = 1;
}
#pragma force_active reset

void submode_sel_ngc_dest_func(void)
{
    lbl_802F1B7C();
    lbl_802F1B7C = NULL;

    gameModeRequest = MD_TEST;
    gameSubmodeRequest = SMD_TEST_SELECT_INIT;
}

void func_80012434(int a)
{
    switch (a)
    {
    case 6:
    case 7:
    case 8:
        modeCtrl.levelSetFlags |= 0x80000;
        break;
    case 1:
    case 3:
    case 4:
    case 5:
        modeCtrl.levelSetFlags |= 0x10000;
        break;
    case 0:
    case 2:
        break;
    }

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        func_80029788();

    if (modeCtrl.gameType >= GAMETYPE_MINI_RACE || modeCtrl.gameType < GAMETYPE_MAIN_NORMAL)
    {
        if (lbl_802F1B7C != NULL)
        {
            lbl_802F1B7C();
            lbl_802F1B7C = NULL;
        }
    }
    
    gameModeRequest = MD_SEL;
    gameSubmodeRequest = SMD_SEL_NGC_REINIT;
}

#pragma force_active on
void func_80012510(void (*a)(void), void (*b)(void), BallCallback ballcb, CameraCallback cameracb)
{
    menuCallback = a;
    lbl_802F1BD4 = b;
    minigameRelBallCallback = ballcb;
    minigameRelCameraCallback = cameracb;
}
#pragma force_active reset

char *selSubmodeRelNames[] =
{
    "",
    "mkbe.sel_stage.rel",
    "",
    "mkbe.sel_ngc.rel",
    "",
    "mkbe.sel_ngc.rel",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    NULL,
};

void submode_sel_init_func(void)
{
    event_finish_all();
    free_all_bitmap_groups_except_com();
    relocation_load_module(selSubmodeRelNames[gameSubmode - SMD_SEL_TOP], &lbl_802F1BD8);
    lbl_802F1B7C = unload_sel_submode_rel;
}

void submode_sel_main_func(void)
{
    if (menuCallback != NULL)
        menuCallback();
}

void func_800125A4(void)
{
    if (lbl_802F1BD4 != NULL)
        lbl_802F1BD4();
}

void unload_sel_submode_rel(void)
{
    menuCallback = NULL;
    lbl_802F1BD4 = NULL;
    minigameRelBallCallback = NULL;
    minigameRelCameraCallback = NULL;
    relocation_unload_module(&lbl_802F1BD8);
}
