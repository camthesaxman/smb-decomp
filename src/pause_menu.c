#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "event.h"
#include "hud.h"
#include "info.h"
#include "input.h"
#include "mode.h"
#include "sprite.h"

struct PauseMenuState pauseMenuState;

// number of items in each pause menu type (see pauseMenus in hud.c)
const s8 pauseMenuItemCounts[8] = { 3, 4, 6, 4, 4, 0, 0 };

s8 lbl_802F1BA1;
s8 lbl_802F1BA0;
OSHeapHandle lbl_802F1B9C;
s32 lbl_802F1B98;

static int is_pausing_allowed(void)
{
    if (screenFadeInfo.timer != 0)
        return FALSE;
    if (pauseMenuState.unk4 & (1 << 1))
        return FALSE;
    switch (gameSubmode)
    {
    case SMD_GAME_FIRST_INIT:
    case SMD_GAME_OVER_INIT:
    case SMD_GAME_OVER_MAIN:
    case SMD_GAME_NAMEENTRY_INIT:
    case SMD_GAME_NAMEENTRY_MAIN:
    case SMD_GAME_CONTINUE_INIT:
    case SMD_GAME_CONTINUE_MAIN:
    case SMD_GAME_RESTART_INIT:
    case SMD_GAME_NAMEENTRY_READY_INIT:
    case SMD_GAME_NAMEENTRY_READY_MAIN:
    case SMD_GAME_ENDING_INIT:
    case SMD_GAME_ENDING_MAIN:
    case SMD_GAME_EXTRA_INIT:
    case SMD_GAME_EXTRA_WAIT:
    case SMD_GAME_RESULT_INIT:
    case SMD_GAME_RESULT_MAIN:
    case SMD_GAME_RESULT_MENU:
    case SMD_GAME_INTR_SEL_INIT:
    case SMD_GAME_INTR_SEL_MAIN:
    case SMD_GAME_OVER_SAVE:
    case SMD_GAME_OVER_DEST:
    case SMD_GAME_ROLL_INIT:
    case SMD_GAME_ROLL_MAIN:
    case SMD_GAME_OVER_POINT_INIT:
    case SMD_GAME_OVER_POINT_MAIN:
        return FALSE;
    }
    switch (gameSubmodeRequest)
    {
    case SMD_GAME_FIRST_INIT:
    case SMD_GAME_OVER_INIT:
    case SMD_GAME_OVER_MAIN:
    case SMD_GAME_NAMEENTRY_INIT:
    case SMD_GAME_NAMEENTRY_MAIN:
    case SMD_GAME_CONTINUE_INIT:
    case SMD_GAME_CONTINUE_MAIN:
    case SMD_GAME_RESTART_INIT:
    case SMD_GAME_NAMEENTRY_READY_INIT:
    case SMD_GAME_NAMEENTRY_READY_MAIN:
    case SMD_GAME_ENDING_INIT:
    case SMD_GAME_ENDING_MAIN:
    case SMD_GAME_EXTRA_INIT:
    case SMD_GAME_EXTRA_WAIT:
    case SMD_GAME_RESULT_INIT:
    case SMD_GAME_RESULT_MAIN:
    case SMD_GAME_RESULT_MENU:
    case SMD_GAME_INTR_SEL_INIT:
    case SMD_GAME_INTR_SEL_MAIN:
    case SMD_GAME_OVER_SAVE:
    case SMD_GAME_OVER_DEST:
    case SMD_GAME_ROLL_INIT:
    case SMD_GAME_ROLL_MAIN:
    case SMD_GAME_OVER_POINT_INIT:
    case SMD_GAME_OVER_POINT_MAIN:
        return FALSE;
    }
    if (func_8009D5D8() != 0)
        return FALSE;
    return TRUE;
}

int should_open_pause_menu(void)
{
    if (!is_pausing_allowed())
        return FALSE;
    if (lbl_802F1BA1 > 0)
        return FALSE;
    if (dipSwitches & DIP_DEBUG)
    {
        if (!(analogButtonInfo[0][0] & PAD_BUTTON_A)
         && !(analogButtonInfo[0][0] & PAD_BUTTON_B)
         && lbl_802F1ED8 == 0
         && !(gamePauseStatus & 8)
         && (g_currPlayerButtons[2] & PAD_BUTTON_START))
            return TRUE;
    }
    else
    {
        if (!(gamePauseStatus & 8) && (g_currPlayerButtons[2] & PAD_BUTTON_START))
            return TRUE;
    }
    return FALSE;
}

void u_open_pause_menu(struct Sprite *menuSprite)
{
    int i;

    gamePauseStatus |= 8;
    pauseMenuState.padId = 0;
    for (i = 0; i < 4; i++)
    {
        if (controllerInfo[i].unk0[0].err == 0
         && (controllerInfo[i].unk0[2].button & PAD_BUTTON_START))
        {
            pauseMenuState.padId = i;
            break;
        }
    }

    lbl_802F1BA0 = 0;
    lbl_802F1BA1 = 30;
    pauseMenuState.playerId = 0;
    if (modeCtrl.unk40 == 1)
    {
        for (i = 0; i < modeCtrl.playerCount; i++)
        {
            if (pauseMenuState.padId == lbl_80206BD0[i])
            {
                pauseMenuState.playerId = i;
                break;
            }
        }
    }
    else
    {
        if (modeCtrl.gameType == GAMETYPE_MINI_BILLIARDS)
        {
            if (modeCtrl.playerCount == 1)
                pauseMenuState.playerId = 0;
            else if (pauseMenuState.unk16 == -1)
                pauseMenuState.playerId = 0;
            else
                pauseMenuState.playerId = (pauseMenuState.padId == lbl_80206BD0[lbl_802F1C32]) ? lbl_802F1C32 : 1 - lbl_802F1C32;
        }
        else
            pauseMenuState.playerId = modeCtrl.currPlayer;
    }

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_NORMAL:
        pauseMenuState.menuType = PAUSEMENU_CONT_VIEW_HOW_EXIT;
        break;
    case GAMETYPE_MAIN_COMPETITION:
        pauseMenuState.menuType = PAUSEMENU_CONT_VIEW_HOW_EXIT;
        break;
    case GAMETYPE_MAIN_PRACTICE:
        pauseMenuState.menuType = PAUSEMENU_CONT_RETRY_VIEW_HOW_SELECT_EXIT;
        break;
    case GAMETYPE_MINI_RACE:
        if (lbl_801EED88.unk8 & (1 << 4))
            pauseMenuState.menuType = PAUSEMENU_CONT_RETRY_HOW_EXIT;
        else if (!(lbl_801EED88.unk8 & (1 << 3))
         && modeCtrl.playerCount == 1)
            pauseMenuState.menuType = PAUSEMENU_CONT_RETRY_HOW_EXIT;
        else
            pauseMenuState.menuType = PAUSEMENU_CONT_HOW_EXIT;
        break;
    case GAMETYPE_MINI_BILLIARDS:
        if (pauseMenuState.unk16 == pauseMenuState.padId)
            pauseMenuState.menuType = PAUSEMENU_CONT_GUIDE_HOW_EXIT;
        else
            pauseMenuState.menuType = PAUSEMENU_CONT_HOW_EXIT;
        break;
    default:
        pauseMenuState.menuType = PAUSEMENU_CONT_HOW_EXIT;
        break;
    }

    pauseMenuState.unk4 &= ~1;
    pauseMenuState.selection = 0;
    pauseMenuState.itemCount = pauseMenuItemCounts[pauseMenuState.menuType];
    pauseMenuState.unk0 = 0;
    lbl_802F1B98 = -1;
    if (menuSprite == NULL)
    {
        hud_show_pause_menu();
        find_sprite_with_tag(4);
    }
    else
        menuSprite->userVar = 1;
    func_8002B5C8(0x70);
    u_play_music(50, 10);
}

void u_handle_pause_menu_navigation(struct Sprite *menuSprite)
{
    s8 r3 = pauseMenuState.selection;

    if (lbl_802F1BA0 > 0)
        lbl_802F1BA0--;
    if (CONTROLLER_SOMETHING(pauseMenuState.padId, PAD_BUTTON_UP) && lbl_802F1BA0 == 0)
    {
        if (--pauseMenuState.selection < 0)
            pauseMenuState.selection = pauseMenuState.itemCount - 1;
        lbl_802F1BA0 = 10;
    }
    else if (CONTROLLER_SOMETHING(pauseMenuState.padId, PAD_BUTTON_DOWN) && lbl_802F1BA0 == 0)
    {
        if (++pauseMenuState.selection > pauseMenuState.itemCount - 1)
            pauseMenuState.selection = 0;
        lbl_802F1BA0 = 10;
    }
    if (r3 != pauseMenuState.selection)
        func_8002B5C8(0x6F);
    if (pauseMenuState.menuType == PAUSEMENU_CONT_GUIDE_HOW_EXIT
     && pauseMenuState.selection == 1)  // "Guide"
    {
        if (CONTROLLER_SOMETHING(pauseMenuState.padId, PAD_BUTTON_LEFT)
         || CONTROLLER_SOMETHING(pauseMenuState.padId, PAD_BUTTON_RIGHT))
        {
            pauseMenuState.unk4 |= 0x10;
            func_8002B5C8(0x169);
        }
    }
    if ((controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_A)
     || (controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_B)
     || (controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_START))
    {
        pauseMenuState.unk4 |= 1;
        func_8002B5C8(0x6E);
        pauseMenuState.unk0 = 2;
        if ((controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_B)
         || (controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_START))
            pauseMenuState.selection = 0;
        switch (pauseMenuState.menuType)
        {
        case PAUSEMENU_CONT_RETRY_VIEW_HOW_SELECT_EXIT:
            if (pauseMenuState.selection == pauseMenuState.itemCount - 2)
            {
                pauseMenuState.unk0 = 60;
                if (menuSprite != NULL)
                    menuSprite->userVar = 2;
                screenFadeInfo.color = RGBA(255, 255, 255, 0);
                u_play_music(59, 2);
            }
            break;
        }
        if (pauseMenuState.itemCount >= 2 && pauseMenuState.selection == pauseMenuState.itemCount - 1)
        {
            pauseMenuState.unk0 = 60;
            if (menuSprite != NULL)
                menuSprite->userVar = 3;
            u_play_music(60, 2);
        }
    }
}

void u_pause_menu_load_how_to_play(struct Sprite *menuSprite)
{
    lbl_802F1B98 = 4;
    if (menuSprite != NULL)
        menuSprite->userVar = 6;
    if (modeCtrl.gameType == GAMETYPE_MINI_TARGET || modeCtrl.gameType == GAMETYPE_MINI_GOLF)
        lbl_802F1B9C = OSSetCurrentHeap(charaHeap);
    if (gameMode == MD_MINI && modeCtrl.gameType == GAMETYPE_MINI_GOLF)
    {
        OSHeapHandle r30 = OSSetCurrentHeap(stageHeap);
        call_bitmap_load_group(BMP_HOW);
        OSSetCurrentHeap(r30);
    }
    else
        call_bitmap_load_group(BMP_HOW);
    if (modeCtrl.gameType == GAMETYPE_MINI_TARGET || modeCtrl.gameType == GAMETYPE_MINI_GOLF)
        OSSetCurrentHeap(lbl_802F1B9C);
    func_80081F30();
    gamePauseStatus |= 8;
}

void u_activate_pause_menu_item(struct Sprite *menuSprite)
{
    gamePauseStatus &= ~(1 << 3);
    switch (pauseMenuState.menuType)
    {
    case PAUSEMENU_CONT_HOW_EXIT:
        switch (pauseMenuState.selection)
        {
        case 0:  // "Continue"
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            u_play_music(100, 10);
            if (modeCtrl.gameType == GAMETYPE_MINI_BILLIARDS)
                pauseMenuState.unk4 |= 0x20;
            break;
        case 1:  // "How to play"
            u_pause_menu_load_how_to_play(menuSprite);
            break;
        case 2:  // "Exit game"
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        }
        break;
    case PAUSEMENU_CONT_VIEW_HOW_EXIT:
        switch (pauseMenuState.selection)
        {
        case 0:  // "Continue"
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            u_play_music(100, 10);
            break;
        case 1:  // "View stage"
            if (pauseMenuState.unk4 & (1 << 2))
            {
                lbl_802F1B98 = 3;
                gamePauseStatus |= 8;
                func_8009F49C(5);
                event_start(EVENT_MEMCARD);
            }
            else
            {
                lbl_802F1B98 = 2;
                gamePauseStatus |= 8;
                event_start(EVENT_VIEW);
                if (menuSprite != NULL)
                    menuSprite->unk78 |= 1;
            }
            break;
        case 2:  // "How to play"
            u_pause_menu_load_how_to_play(menuSprite);
            break;
        case 3:  // "Exit game"
            if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
            {
                lbl_802F1B98 = 5;
                gameSubmodeRequest = SMD_GAME_INTR_SEL_INIT;
            }
            else
            {
                lbl_802F1B98 = 1;
                func_80012434(-1);
            }
            break;
        }
        break;
    case PAUSEMENU_CONT_RETRY_VIEW_HOW_SELECT_EXIT:
        switch (pauseMenuState.selection)
        {
        case 0:  // "Continue"
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            u_play_music(100, 10);
            break;
        case 1:  // "Retry"
            infoWork.attempts++;
            BALL_FOREACH( ball->flags |= BALL_FLAG_23; )
            gameSubmodeRequest = SMD_GAME_READY_INIT;
            u_play_music(100, 10);
            break;
        case 2:  // "View stage" or "Save replay"
            if (pauseMenuState.unk4 & (1 << 2))
            {
                lbl_802F1B98 = 3;
                gamePauseStatus |= 8;
                func_8009F49C(5);
                event_start(EVENT_MEMCARD);
            }
            else
            {
                lbl_802F1B98 = 2;
                gamePauseStatus |= 8;
                event_start(EVENT_VIEW);
                if (menuSprite != NULL)
                    menuSprite->unk78 |= 1;
            }
            break;
        case 3:  // "How to play"
            u_pause_menu_load_how_to_play(menuSprite);
            break;
        case 4:  // "Stage select"
            modeCtrl.courseFlags |= 0x8000;
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        case 5:  // "Exit game"
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        }
        break;
    case PAUSEMENU_CONT_RETRY_HOW_EXIT:
        switch (pauseMenuState.selection)
        {
        case 0:  // "Continue"
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            u_play_music(100, 10);
            break;
        case 1:  // "Retry"
            destroy_sprite_with_tag(4);
            modeCtrl.courseFlags |= 0x4000;
            u_play_music(100, 10);
            break;
        case 2:  // "How to play"
            u_pause_menu_load_how_to_play(menuSprite);
            break;
        case 3:  // "Exit game"
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        }
        break;
    case PAUSEMENU_CONT_GUIDE_HOW_EXIT:
        switch (pauseMenuState.selection)
        {
        case 0:  // "Continue"
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            u_play_music(100, 10);
            pauseMenuState.unk4 |= 0x20;
            break;
        case 1:  // "Guide"
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            u_play_music(100, 10);
            pauseMenuState.unk4 |= 0x20;
            break;
        case 2:  // "How to play"
            u_pause_menu_load_how_to_play(menuSprite);
            break;
        case 3:  // "Exit game"
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        }
        break;
    }
}

void unkFunc8000AECC(struct Sprite *menuSprite)
{
    struct Sprite *sprite;

    switch (lbl_802F1B98)
    {
    case 2:
        if ((controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_A)
         || (controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_B)
         || (controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_START))
        {
            event_finish(EVENT_VIEW);
            func_8002B5C8(0x70);
            pauseMenuState.unk4 &= ~1;
            if (menuSprite != NULL)
                menuSprite->unk78 &= ~1;
            lbl_802F1B98 = -1;
        }
        break;
    case 3:
        if (eventInfo[EVENT_MEMCARD].state != EV_STATE_RUNNING)
        {
            func_8002B5C8(0x70);
            pauseMenuState.unk4 &= ~1;
            lbl_802F1B98 = -1;
        }
        break;
    case 4:
        sprite = find_sprite_with_tag(10);
        if (sprite != NULL)
            func_80082024(0, sprite);
        if ((controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_A)
         || (controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_B)
         || (controllerInfo[pauseMenuState.padId].unk0[2].button & PAD_BUTTON_START))
        {
            func_8002B5C8(0x70);
            pauseMenuState.unk4 &= ~1;
            destroy_sprite_with_tag(10);
            if (modeCtrl.gameType == GAMETYPE_MINI_TARGET || modeCtrl.gameType == GAMETYPE_MINI_GOLF)
                lbl_802F1B9C = OSSetCurrentHeap(charaHeap);
            call_bitmap_free_group(BMP_HOW);
            if (modeCtrl.gameType == GAMETYPE_MINI_TARGET || modeCtrl.gameType == GAMETYPE_MINI_GOLF)
                OSSetCurrentHeap(lbl_802F1B9C);
            if (menuSprite != NULL)
                menuSprite->userVar = 1;
            lbl_802F1B98 = -1;
        }
        break;
    }
}

void u_menu_input_game_notdebug(void)
{
    struct Sprite *menuSprite = find_sprite_with_tag(4);

    if ((modeCtrl.gameType == GAMETYPE_MAIN_NORMAL || modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
     && !(infoWork.flags & INFO_FLAG_08)
     && ((infoWork.flags & INFO_FLAG_05) || (infoWork.flags & INFO_FLAG_BONUS_STAGE) || (infoWork.flags & (1 << 4)))
     && func_8004C70C() != 0)
        pauseMenuState.unk4 |= 4;
    else
        pauseMenuState.unk4 &= ~4;

    if (lbl_802F1BA1 > 0)
        lbl_802F1BA1--;
    if (should_open_pause_menu())
        u_open_pause_menu(menuSprite);
    else
    {
        if (gamePauseStatus & (1 << 3))
        {
            if (!(pauseMenuState.unk4 & 1))
                u_handle_pause_menu_navigation(menuSprite);
            if (pauseMenuState.itemCount >= 2
             && pauseMenuState.selection == pauseMenuState.itemCount - 1
             && pauseMenuState.unk0 == 0x28
             && menuSprite != NULL)
                menuSprite->userVar = 5;
            if (pauseMenuState.unk0 > 0)
            {
                if (--pauseMenuState.unk0 == 0)
                    u_activate_pause_menu_item(menuSprite);
            }
            else
                unkFunc8000AECC(menuSprite);
            if (!(dipSwitches & DIP_DEBUG) || !(gamePauseStatus & (1 << 1)))
            {
                if (menuSprite != NULL)
                    func_80075E1C(0, menuSprite);
            }
        }
    }
}
