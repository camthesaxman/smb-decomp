#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "event.h"
#include "info.h"
#include "input.h"
#include "item.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"
#include "stage.h"

void mode_game_func(void)
{
    if (!(gameSubmode > SMD_GAME_TOP && gameSubmode < SMD_GAME_BOTTOM))
    {
        g_debug_set_cursor_pos(10, 10);
        g_debug_printf("sub_mode: error %d in Game", gameSubmode);
        return;
    }

    gameSubmodeFuncs[gameSubmode]();
}

void submode_game_first_init_func(void)
{
    struct Ball *ball;
    struct Ball *ballBackup;
    u8 dummy[8];
    s8 *unk;
    int i;

    modeCtrl.levelSetFlags &= ~(1 << 6);
    modeCtrl.unk2C = 0;
    event_finish_all();
    free_all_bitmap_groups_except_com();
    func_800249D4();
    func_80044920();
    event_start(EVENT_BALL);
    event_start(EVENT_SOUND);
    call_bitmap_load_group(BMP_NML);

    ballBackup = currentBallStructPtr;
    ball = ballInfo;
    unk = spritePoolInfo.unkC;
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
    {
        if (*unk == 2)
        {
            currentBallStructPtr = ball;
            ball->state = 1;
        }
    }
    currentBallStructPtr = ballBackup;

    {
        struct Ball *ball;
        s8 *unk;
        int i;

        unk = spritePoolInfo.unkC;
        ball = ballInfo;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->ape->unk14 |= (1 << 5);
            }
        }
    }
    currentBallStructPtr = ballBackup;

    func_800846B0(4);
    func_80022F14();
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
        func_80066294();
    if (stageSelection.levelSet != 0)
        infoWork.unk20 = stageSelection.levelNum;
    lbl_802F1C18 = -1;
    func_800AEAD0();
    func_800AF164();
    func_80048BD4();
    if (modeCtrl.levelSetFlags & (1 << 0))
        g_start_screen_fade(0x100, 0, 30);
    lbl_802F1C20 = -1;
    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_NORMAL:
        for (i = 0; i < 4; i++)
            setup_camera_viewport(i, 0.0f, 0.0f, 1.0f, 1.0f);
        break;
    default:
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION && modeCtrl.playerCount == 3)
        {
            switch (modeCtrl.unk42)
            {
            case 0:
            default:
                camera_setup_splitscreen_viewports(3);
                break;
            case 1:
                setup_camera_viewport(0, 0.0f, 0.5f, 0.5f, 0.5f);
                setup_camera_viewport(1, 0.0f, 0.0f, 1.0f, 0.5f);
                setup_camera_viewport(2, 0.5f, 0.5f, 0.5f, 0.5f);
                setup_camera_viewport(3, 0.0f, 0.0f, 0.0f, 0.0f);
                break;
            case 2:
                setup_camera_viewport(0, 0.0f, 0.0f, 0.5f, 0.5f);
                setup_camera_viewport(1, 0.5f, 0.0f, 0.5f, 0.5f);
                setup_camera_viewport(2, 0.0f, 0.5f, 1.0f, 0.5f);
                setup_camera_viewport(3, 0.0f, 0.0f, 0.0f, 0.0f);
                break;
            case 3:
                camera_setup_splitscreen_viewports(4);
                break;
            }
        }
        else
            camera_setup_splitscreen_viewports(modeCtrl.playerCount);
        break;
    }

    gameSubmodeRequest = SMD_GAME_READY_INIT;
}

void submode_game_restart_init_func(void)
{
    struct Ball *ball;
    struct Ball *ballBackup;
    s8 *unk;
    int i;

    event_finish_all();
    free_all_bitmap_groups_except_com();
    func_80044920();
    event_start(EVENT_BALL);
    event_start(EVENT_SOUND);
    call_bitmap_load_group(BMP_NML);
    ballBackup = currentBallStructPtr;
    unk = spritePoolInfo.unkC;
    ball = ballInfo;
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
    {
        if (*unk == 2)
        {
            currentBallStructPtr = ball;
            ball->state = 1;
        }
    }
    currentBallStructPtr = ballBackup;
    func_800846B0(4);
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
        func_80066294();
    gameSubmodeRequest = SMD_GAME_READY_INIT;
}

const s16 lbl_801101C8[] =
{
    0x0023, 0x0024,
    0x0025, 0x0026,
    0x0027, 0x0028,
    0x0029, 0x002A,
    0x002B, 0x002C,
};

const s16 lbl_801101DC[] =
{
    -1, -1,
    -1, -1,
    -1, -1,
    -1, -1,
    -1, -1,
    -1, -1,
    0x14, 0x14,
    0x16, 0x18,
    0x1A, 0x1C,
    0x1E, 0x20,
    0x22, 0x24,
    -1, -1,
    -1, -1,
    0x26, -1,
    -1, -1,
    -1, -1,
};

void submode_game_ready_init_func(void)
{
    int r30;
    struct Ball *ball;
    struct Ball *ballBackup;
    s8 *unk;
    int i;

    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.unk0 = 120;
    func_8002FFEC();
    event_finish_all();
    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_NORMAL:
        if (!(modeCtrl.levelSetFlags & (1 << 8)))
            func_800171E0();
        else
            func_800174C8();
        level_num_to_stage_id(modeCtrl.levelSet, infoWork.unk20, modeCtrl.levelSetFlags);
        break;
    }
    load_stage(loadingStageId);
    event_start(EVENT_STAGE);
    event_start(EVENT_WORLD);
    event_start(EVENT_BALL);
    event_start(EVENT_STOBJ);
    event_start(EVENT_INFO);
    event_start(EVENT_ITEM);
    event_start(EVENT_OBJ_COLLISION);
    if (modeCtrl.levelSetFlags & 1)
        event_start(EVENT_COURSE);
    event_start(EVENT_MINIMAP);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_RECPLAY);
    event_start(EVENT_EFFECT);
    event_start(EVENT_REND_EFC);
    event_start(EVENT_BACKGROUND);
    event_start(EVENT_VIBRATION);
    func_800972CC();
    event_suspend(EVENT_WORLD);
    func_80021DB4(currStageId);
    r30 = func_80017004();
    if (r30 != -1 && r30 != lbl_802F1C18)
    {
        preload_stage_files(r30);
        lbl_802F1C18 = r30;
        if (gamePauseStatus & (1 << 2))
            printf("pre_load_stage init:%d now:%d\n", r30, currStageId);
    }
    infoWork.unk0 |= 0x108;
    ballBackup = currentBallStructPtr;
    ball = ballInfo;
    unk = spritePoolInfo.unkC;
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
    {
        if (*unk == 2)
        {
            currentBallStructPtr = ball;
            ball->state = 2;
        }
    }
    currentBallStructPtr = ballBackup;
    camera_set_state(CAMERA_STATE_READY_INIT);
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION
     && modeCtrl.playerCount == 3
     && modeCtrl.unk42 == 3)
    {
        cameraInfo[3].flags |= 0x70;
        cameraInfo[3].state = 0x44;
    }
    if (infoWork.unk1E == 1)
    {
        modeCtrl.unk0 = 360;
        camera_set_state(0x26);
        func_8007884C();
    }
    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_COMPETITION:
        func_8007A228();
        break;
    default:
        func_800793CC();
        break;
    }
    r30 = lbl_801101DC[backgroundInfo.bgId];
    if (r30 != -1 && r30 != lbl_802014E0.unk0 && r30 + 1 != lbl_802014E0.unk0)
    {
        if (r30 == lbl_802F1C20)
        {
            func_8002CF38(r30 + 1, 0);
            lbl_802F1C20 = -1;
        }
        else
        {
            func_8002CF38(r30, 0);
            if (infoWork.unk0 & (1 << 6))
                lbl_802F1C20 = r30;
        }
    }
    else
    {
        if (lbl_802014E0.unk0 == -1)
            func_8002CF38(1, 3);
        else if (r30 == -1)
            func_8002CF38(0, 1);
    }
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        int sp4[] = { 0x186, 0x187, 0x188, 0x189, 0x18A };
        int soundId = sp4[infoWork.unk20 - 1];

        if (lbl_802F1FB0 == infoWork.unk20)
            soundId = 0x184;
        g_play_sound(soundId);
    }
    lbl_802F1F80 = ballInfo[modeCtrl.unk2C].unk7C;
    gameSubmodeRequest = SMD_GAME_READY_MAIN;
}

void submode_game_ready_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (infoWork.unk1E == 1 && (lbl_801F3D88[0] & (1 << 8)) && modeCtrl.unk0 > 120)
        modeCtrl.unk0--;
    if (modeCtrl.unk0 == 120)
    {
        struct Sprite *sprite = find_sprite_with_tag(15);
        if (sprite != NULL)
            sprite->unk48 = 15;
        func_800790BC(120);
        func_800846B0(3);
    }
    if (modeCtrl.unk0 == 24.0)
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->state = 3;
            }
        }
        currentBallStructPtr = ballBackup;
    }
    if (lbl_801F3D88[2] & (1 << 8))
        func_800847C0();
    if (--modeCtrl.unk0 <= 0)
        gameSubmodeRequest = SMD_GAME_PLAY_INIT;
}

void submode_game_play_init_func(void)
{
    int i;
    struct World *r5;
    s8 *unk;
    int i2;

    if (gamePauseStatus & 0xA)
        return;
    event_resume(2);
    func_8007C104(60);
    infoWork.unk0 &= -265;
    func_80048F20();
    lbl_80250A68.unk14 = 0;
    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_COMPETITION:
        for (i = 0; i < modeCtrl.playerCount; i++)
        {
            lbl_80250A68.unk0[i] = i + 7;
            func_80048F58(i, lbl_80250A68.unk0[i]);
        }
        break;
    case GAMETYPE_MAIN_NORMAL:
        lbl_80250A68.unk14 = modeCtrl.unk2C;
        // fall through
    default:
        lbl_80250A68.unk0[lbl_80250A68.unk14] = func_80048E78();
        func_80048F58(lbl_80250A68.unk14, lbl_80250A68.unk0[lbl_80250A68.unk14]);
        break;
    }
    func_80048F74();
    unk = spritePoolInfo.unkC;
    r5 = lbl_80206BF0;
    for (i2 = 0; i2 < spritePoolInfo.unk8; i2++, r5++, unk++)
    {
        if (*unk == 2)
            r5->unk8 = 1;
    }
    camera_set_state(0);
    gameSubmodeRequest = SMD_GAME_PLAY_MAIN;
}

void submode_game_play_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (infoWork.timerCurr % 60 == 59)  // each second
    {
        if (infoWork.timerCurr <= 10 * 60)
        {
            // countdown
            g_play_sound(6);
            g_play_sound(lbl_801101C8[infoWork.timerCurr / 60]);
        }
        else
            g_play_sound(0x3D806);
        if (infoWork.timerCurr / 60 == 10)
        {
            g_play_sound(7);  // hurry up?
            func_8007E144();
        }
    }
    if (infoWork.timerCurr <= 5 * 60 && infoWork.timerCurr % 60 == 43)
        g_play_sound(6);
    if (infoWork.timerCurr <= 10 * 60 && infoWork.timerCurr % 60 == 51)
        g_play_sound(6);
    if (lbl_801F3D88[2] & (1 << 8))
        func_800847C0();
    if (infoWork.unk0 & INFO_FLAG_GOAL)
    {
        infoWork.unk0 &= ~INFO_FLAG_GOAL;
        gameSubmodeRequest = SMD_GAME_GOAL_INIT;
    }
    else if (infoWork.unk0 & INFO_FLAG_TIMEOVER)
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        infoWork.unk0 &= ~INFO_FLAG_TIMEOVER;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->state = 0;
            }
        }
        currentBallStructPtr = ballBackup;

        gameSubmodeRequest = SMD_GAME_TIMEOVER_INIT;
    }
    else if (infoWork.unk0 & INFO_FLAG_FALLOUT)
    {
        infoWork.unk0 &= ~INFO_FLAG_FALLOUT;
        camera_set_state(4);
        func_8004B65C();
        gameSubmodeRequest = SMD_GAME_RINGOUT_INIT;
    }
    else if (infoWork.unk0 & (1 << 9))
    {
        infoWork.unk0 &= ~(1 << 9);
        func_8004B65C();
        gameSubmodeRequest = SMD_GAME_BONUS_CLEAR_INIT;
    }
}

void submode_game_goal_init_func(void)
{
    int r31;

    if (gamePauseStatus & 0xA)
        return;

    if (!(infoWork.unk0 & (1 << 13)))
    {
        modeCtrl.unk0 = 360;
        modeCtrl.levelSetFlags &= ~(1 << 10);
    }
    else
    {
        modeCtrl.unk0 = 120;
        modeCtrl.levelSetFlags &= ~(1 << 10);
        g_play_sound(11);
        g_play_sound(0x128);
    }
    modeCtrl.unk3C = modeCtrl.unk0;
    r31 = func_80017004();
    if (r31 != -1 && r31 != lbl_802F1C18)
    {
        preload_stage_files(r31);
        lbl_802F1C18 = r31;
    }
    func_800846B0(1);
    camera_set_state(14);
    if (!(infoWork.unk0 & (1 << 13)))
        func_8007C6AC(0x168);
    else
        func_8007D190(120);
    if (!(infoWork.unk0 & (1 << 6)) && modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION)
        g_give_points(3, 0);
    if (infoWork.unk0 & (1 << 6))
        func_8004B65C();
    gameSubmodeRequest = SMD_GAME_GOAL_MAIN;
}

void submode_game_goal_main_func(void)
{
    int r31;

    if (gamePauseStatus & 0xA)
        return;

    r31 = (infoWork.unk0 & (1 << 13)) != 0;
    if (!r31 && modeCtrl.unk0 == 330)
        g_play_sound(8);
    if (modeCtrl.unk0 == modeCtrl.unk3C - 60)
        func_80049158();
    if (!r31)
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                if (!(ball->flags & (1 << 9)) && (ball->ape->unk14 & (1 << 14)))
                {
                    modeCtrl.levelSetFlags |= 0x400;
                    g_play_sound(0x126);
                }
            }
        }
        currentBallStructPtr = ballBackup;
    }
    if (!r31 && (modeCtrl.levelSetFlags & (1 << 10))
     && modeCtrl.unk0 > 60 && modeCtrl.unk0 < 240)
        modeCtrl.unk0 = 60;
    if (--modeCtrl.unk0 <= 0)
    {
        infoWork.unk0 &= ~(1 << 13);
        gameSubmodeRequest = SMD_GAME_GOAL_REPLAY_INIT;
    }
}

void submode_game_goal_replay_init_func(void)
{
    float f1;
    int r31;

    if (gamePauseStatus & 0xA)
        return;

    event_finish(EVENT_VIBRATION);
    modeCtrl.unk0 = 210;
    f1 = mathutil_vec_mag(&infoWork.unk10);
    modeCtrl.unk0 += f1 * 300.0;
    if (modeCtrl.unk0 > 300.0)
        modeCtrl.unk0 = 300;
    modeCtrl.levelSetFlags &= ~(1 << 10);
    modeCtrl.unk18 = 30;

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->flags &= ~(1 << 9);
            }
        }
        currentBallStructPtr = ballBackup;
    }

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->state = 9;
            }
        }
        currentBallStructPtr = ballBackup;
    }

    {
        struct World *r5;
        s8 *unk;
        int i;

        unk = spritePoolInfo.unkC;
        r5 = lbl_80206BF0;
        for (i = 0; i < spritePoolInfo.unk8; i++, r5++, unk++)
        {
            if (*unk == 2)
                r5->unk8 = 6;
        }
    }
    camera_set_state(16);
    func_80037B20();
    func_8004CFF0(0);
    func_8004CFF0(10);

    lbl_80250A68.unk14 = infoWork.unk30;
    infoWork.unk0 |= (1 << 4);
    lbl_80250A68.unk10 = MIN(modeCtrl.unk0 - 60, func_8004964C(lbl_80250A68.unk0[lbl_80250A68.unk14]));
    g_animate_stage(func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]));
    r31 = func_80049E7C(lbl_80250A68.unk0[lbl_80250A68.unk14], lbl_80250A68.unk10);
    func_800689B4(r31);
    func_8006F5F0(r31);
    func_8007E334(modeCtrl.unk0);
    if (!(infoWork.unk0 & (1 << 6)) && modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION)
        g_give_points(2, 0);
    func_8004B65C();
    gameSubmodeRequest = SMD_GAME_GOAL_REPLAY_MAIN;
}

void submode_game_goal_replay_main_func(void)
{
    int nextStage;

    if (gamePauseStatus & 0xA)
        return;

    {
        struct Ball *r31;
        struct Ball *ball;
        s8 *unk;
        int i;

        r31 = currentBallStructPtr;
        if (r31->state == 4)
            infoWork.unk0 &= ~(1 << 4);
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                if (!(ball->flags & (1 << 9)) && (ball->ape->unk14 & (1 << 14)))
                {
                    ball->flags &= -1281;
                    ball->flags |= 0x200;
                    modeCtrl.levelSetFlags |= 0x400;
                    g_play_sound(0x126);
                }
            }
        }
        currentBallStructPtr = r31;
    }

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        struct Ball *r31;
        struct Ball *ball;
        s8 *unk;
        int i;
        int r3;

        r31 = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        r3 = 0;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                if ((unpausedFrameCounter & 3) == 0 && ball->unk138 > 0)
                {
                    r3 = 1;
                    if (ball->unk138 > 100)
                        r3 = 41;
                    else if (ball->unk138 > 10)
                        r3 = 3;
                    ball->bananas += r3;
                    ball->unk138 -= r3;
                    ball->bananas = MIN(ball->bananas, 999);
                    r3 = 1;
                }
            }
        }
        currentBallStructPtr = r31;
        if (r3)
            g_play_sound(0x67);
    }
    modeCtrl.unk18--;
    nextStage = func_80016FB4();
    if (!is_load_queue_not_empty()
     && (lbl_801F3D88[2] & (1 << 8))
     && modeCtrl.unk18 < 0 && nextStage > 0)
        modeCtrl.unk0 = 0;
    if (nextStage < 0 && modeCtrl.unk0 == 60)
    {
        g_start_screen_fade(0x101, 0, 0x3D);
        func_8002CF38(60, 2);
    }
    if (--modeCtrl.unk0 > 0)
        return;
    infoWork.unk0 &= ~(1 << 4);
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                if (ball->unk138 > 0)
                {
                    ball->bananas += ball->unk138;
                    ball->unk138 = 0;
                    ball->bananas = MIN(ball->bananas, 999);
                }
            }
        }
        currentBallStructPtr = ballBackup;
    }
    if (nextStage < 0 && modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        gameSubmodeRequest = SMD_GAME_RESULT_INIT;
        return;
    }

    if (nextStage < 0)  // end of level set
    {
        u32 gotoExtra;

        if (modeCtrl.levelSet == LVLSET_EXPERT)
            gotoExtra = ((modeCtrl.levelSetFlags & 1) && infoWork.unk2A == 0);
        else
            gotoExtra = ((modeCtrl.levelSetFlags & 1) && infoWork.unk28 == 0);

        if (gotoExtra && (modeCtrl.levelSetFlags & LVLSET_FLAG_EXTRA) && modeCtrl.levelSet != LVLSET_EXPERT)
            gotoExtra = FALSE;
        if (gotoExtra && (modeCtrl.levelSetFlags & LVLSET_FLAG_MASTER))
            gotoExtra = FALSE;

        if (gotoExtra)
            gameSubmodeRequest = SMD_GAME_EXTRA_INIT;
        else
        {
            func_80017140();
            gameSubmodeRequest = SMD_GAME_ENDING_INIT;
        }
    }
    else
    {
        if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
        {
            infoWork.unk1E++;
            func_8002CF38(100, 8);
        }
        else
            infoWork.unk1E = 1;
        loadingStageId = nextStage;
        gameSubmodeRequest = SMD_GAME_READY_INIT;
    }
}

void submode_game_continue_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    func_80017140();
    modeCtrl.unk0 = 659;
    modeCtrl.unk10 = 1;
    modeCtrl.levelSetFlags &= ~(1 << 2);
    event_finish(EVENT_STAGE);
    event_finish(EVENT_WORLD);
    event_finish(EVENT_STOBJ);
    event_finish(EVENT_ITEM);
    event_finish(EVENT_OBJ_COLLISION);
    event_finish(EVENT_INFO);
    event_finish(EVENT_SPRITE);
    event_finish(EVENT_VIBRATION);
    event_start(EVENT_SPRITE);
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
    {
        if (func_80067674() == 0)
        {
            modeCtrl.unk10 = 0;
            modeCtrl.unk0 = (modeCtrl.playerCount == 1) ? 480 : 180;
            modeCtrl.levelSetFlags |= (1 << 2);
        }
        else
            func_8007D580();
    }
    else
        func_8007D580();
    func_800228A8(currStageId);

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->state = 18;
            }
        }
        currentBallStructPtr = ballBackup;
    }
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                if (ball->ape != NULL)
                    ball->ape->unk14 |= 0x100;
            }
        }
        currentBallStructPtr = ballBackup;
    }

    camera_set_state(0x19);
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
    {
        func_800662E0();
        func_8006677C(1, 0x140, 0x198);
    }
    lbl_802F1C20 = lbl_802014E0.unk0;
    func_8002CF38(40, 0);
    gameSubmodeRequest = SMD_GAME_CONTINUE_MAIN;
}

void submode_game_continue_main_func(void)
{
    int r31 = (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1);

    if (gamePauseStatus & 0xA)
        return;

    if (!(modeCtrl.levelSetFlags & (1 << 2)))
    {
        if (!r31 || func_80066868() != 0)
        {
            int r29 = modeCtrl.unk10;

            if ((lbl_801F3D88[2] & (1 << 0)) || (lbl_801F3D94[2] & (1 << 0)))
                r29 = 1;
            if ((lbl_801F3D88[2] & (1 << 1)) || (lbl_801F3D94[2] & (1 << 1)))
                r29 = 0;
            if (r29 != modeCtrl.unk10)
            {
                g_play_sound(9);
                modeCtrl.unk10 = r29;
            }
        }
        if (!r31 || func_80066868() != 0)
        {
            if (lbl_801F3D88[2] & (1 << 8))
            {
                currentBallStructPtr->ape->unk14 &= ~(1 << 8);
                if (modeCtrl.unk10 == 1)
                {
                    infoWork.unk2A++;
                    infoWork.unk1E = 1;
                    currentBallStructPtr->ape->unk14 |= 0x800;
                    func_80075900(0, 20, 0);
                    g_play_sound(10);
                    g_play_sound(80);
                    modeCtrl.unk0 = 60;
                    modeCtrl.levelSetFlags |= (1 << 2);
                    func_80075900(1, 20, 0);
                }
                else
                {
                    func_80075900(0, 20, 0);
                    g_play_sound(48);
                    currentBallStructPtr->ape->unk14 |= 0x40000;
                    modeCtrl.unk0 = 60;
                    modeCtrl.levelSetFlags |= (1 << 2);
                }
            }
        }
    }
    else
    {
        if (r31 && modeCtrl.unk10 == 0 && modeCtrl.unk0 > 180
         && func_80066868() != 0 && (lbl_801F3D88[2] & (1 << 8)))
            modeCtrl.unk0 = 180;
        if (modeCtrl.unk10 == 0 && modeCtrl.unk0 == 60)
        {
            if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL
             && (func_800AECCC(modeCtrl.levelSet, &lbl_802C67D4[modeCtrl.unk2C]) >= 0
                 || (dipSwitches & (DIP_DEBUG|DIP_NAMEENTRY)) == (DIP_DEBUG|DIP_NAMEENTRY)))
                g_start_screen_fade(0x101, 0xFFFFFF, modeCtrl.unk0);
            else
                g_start_screen_fade(0x101, 0, modeCtrl.unk0);
            func_80075900(1, 20, 0);
        }

        if (--modeCtrl.unk0 > 0)
            return;
        if (modeCtrl.unk10 == 1)
            gameSubmodeRequest = SMD_GAME_RESTART_INIT;
        else if (modeCtrl.levelSetFlags & (1 << 3))
        {
            if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
                modeCtrl.levelSetFlags |= 0x100000;
            gameSubmodeRequest = SMD_GAME_ENDING_INIT;
        }
        else
            gameSubmodeRequest = SMD_GAME_NAMEENTRY_READY_INIT;
    }
}

void submode_game_timeover_init_func(void)
{
    int i;

    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.unk0 = 120;
    event_suspend(EVENT_STAGE);
    event_finish(EVENT_WORLD);
    event_finish(EVENT_VIBRATION);

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->state = 0;
            }
        }
        currentBallStructPtr = ballBackup;
    }

    func_800846B0(1);
    if (!(infoWork.unk0 & (1 << 6)))
        g_play_sound(11);
    g_play_sound(0x128);
    camera_set_state(21);

    for (i = 0; i < 4; i++)
    {
        Vec sp8;

        sp8.x = 0.0f;
        sp8.y = 0.75f;
        sp8.z = (rand() / 32767.0f) - 0.5f;
        func_8001898C(i, modeCtrl.unk0, &sp8);
    }
    func_80049158();
    func_8007D190(modeCtrl.unk0);

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                g_play_sound(28);
            }
        }
        currentBallStructPtr = ballBackup;
    }
    gameSubmodeRequest = SMD_GAME_TIMEOVER_MAIN;
}

void submode_game_timeover_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        loadingStageId = func_80016FB4();
        if (loadingStageId < 0 && modeCtrl.unk0 == 60)
        {
            g_start_screen_fade(0x101, 0, 0x3D);
            func_8002CF38(60, 2);
        }
    }
    if (--modeCtrl.unk0 > 0)
        return;
    if (func_80017040() != 0)
    {
        if ((infoWork.unk0 & (1 << 6)) || modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        {
            loadingStageId = func_80016FB4();
            infoWork.unk1E = (modeCtrl.gameType != GAMETYPE_MAIN_PRACTICE) ? 1 : infoWork.unk1E + 1;
        }
        else
            infoWork.unk1E++;
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION && loadingStageId < 0)
            gameSubmodeRequest = SMD_GAME_RESULT_INIT;
        else
            gameSubmodeRequest = SMD_GAME_READY_INIT;
    }
    else
    {
        modeCtrl.unk14 = 1;
        switch (modeCtrl.gameType)
        {
        case GAMETYPE_MAIN_COMPETITION:
            gameSubmodeRequest = SMD_GAME_OVER_INIT;
            break;
        default:
            gameSubmodeRequest = SMD_GAME_CONTINUE_INIT;
            break;
        }
    }
}

void submode_game_ringout_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.unk0 = 270;
    modeCtrl.unk18 = 60;
    func_800846B0(1);
    g_play_sound((currentBallStructPtr->lives == 1) ? 81 : 29);
    g_play_sound(21);
    lbl_802F1C1C = -1;
    func_8007CE50(modeCtrl.unk0);
    gameSubmodeRequest = SMD_GAME_RINGOUT_MAIN;
}

void submode_game_ringout_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (currentBallStructPtr->state == 4)
        infoWork.unk0 &= ~(1 << 4);
    if (infoWork.unk0 & (1 << 6))
    {
        if (modeCtrl.unk0 == 260.0)
        {
            func_80049158();
            modeCtrl.unk0 = 110;
        }
    }
    else
    {
        if (modeCtrl.unk0 == 240.0)
        {
            func_80049158();

            {
                struct Ball *ball;
                struct Ball *ballBackup;
                s8 *unk;
                int i;

                ballBackup = currentBallStructPtr;
                ball = ballInfo;
                unk = spritePoolInfo.unkC;
                for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
                {
                    if (*unk == 2)
                    {
                        currentBallStructPtr = ball;
                        ball->state = 7;
                    }
                }
                currentBallStructPtr = ballBackup;
            }

            {
                struct World *r5;
                s8 *unk;
                int i;

                unk = spritePoolInfo.unkC;
                r5 = lbl_80206BF0;
                for (i = 0; i < spritePoolInfo.unk8; i++, r5++, unk++)
                {
                    if (*unk == 2)
                        r5->unk8 = 8;
                }
            }
            camera_set_state(5);
            lbl_80250A68.unk10 = MIN(func_8004964C(lbl_80250A68.unk0[lbl_80250A68.unk14]), 120.0f);
            g_animate_stage(func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]));
            infoWork.unk0 |= (1 << 4);
            func_800689B4(func_80049E7C(lbl_80250A68.unk0[lbl_80250A68.unk14], lbl_80250A68.unk10));
            func_8007E334(modeCtrl.unk0);
            lbl_802F1C1C = 30;
        }
        if (modeCtrl.unk0 == 150.0)
        {
            {
                struct Ball *ball;
                struct Ball *ballBackup;
                s8 *unk;
                int i;

                ballBackup = currentBallStructPtr;
                ball = ballInfo;
                unk = spritePoolInfo.unkC;
                for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
                {
                    if (*unk == 2)
                    {
                        currentBallStructPtr = ball;
                        ball->state = 7;
                    }
                }
                currentBallStructPtr = ballBackup;
            }
            camera_set_state(7);
            lbl_80250A68.unk10 = MIN(func_8004964C(lbl_80250A68.unk0[lbl_80250A68.unk14]), modeCtrl.unk0 - 60);
            g_animate_stage(func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]));
            infoWork.unk0 |= (1 << 4);
            func_800689B4(func_80049E7C(lbl_80250A68.unk0[lbl_80250A68.unk14], lbl_80250A68.unk10));
            lbl_802F1C1C = 60;
        }
    }
    modeCtrl.unk18--;
    if ((lbl_801F3D88[2] & (1 << 8)) && modeCtrl.unk18 < 0
     && !(infoWork.unk0 & 0x240) && currentBallStructPtr->lives > 1)
    {
        func_80049158();
        modeCtrl.unk0 = 0;
    }
    if (lbl_802F1C1C > 0)
        lbl_802F1C1C--;
    if (lbl_802F1C1C == 0 && currentBallStructPtr->vel.y < -0.2)
    {
        g_play_sound((currentBallStructPtr->lives == 1) ? 81 : 29);
        g_play_sound(21);
        lbl_802F1C1C = -1;
    }
    if (--modeCtrl.unk0 > 0)
        return;
    infoWork.unk0 &= ~(1 << 4);
    event_suspend(1);
    if (func_80017040() != 0)
    {
        if (infoWork.unk0 & (1 << 6))
        {
            loadingStageId = func_80016FB4();
            infoWork.unk1E = (modeCtrl.gameType != GAMETYPE_MAIN_PRACTICE) ? 1 : infoWork.unk1E + 1;
        }
        else
            infoWork.unk1E++;
        gameSubmodeRequest = SMD_GAME_READY_INIT;
    }
    else
    {
        modeCtrl.unk14 = 0;
        switch (modeCtrl.gameType)
        {
        case GAMETYPE_MAIN_COMPETITION:
            gameSubmodeRequest = SMD_GAME_OVER_INIT;
            break;
        default:
            gameSubmodeRequest = SMD_GAME_CONTINUE_INIT;
            break;
        }
    }
}

void submode_game_bonus_clear_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.unk0 = 180;
    modeCtrl.levelSetFlags &= ~(1 << 10);
    event_finish(EVENT_WORLD);
    event_finish(EVENT_VIBRATION);
    func_800846B0(1);

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->state = 5;
            }
        }
        currentBallStructPtr = ballBackup;
    }

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->flags |= 0x500;
            }
        }
        currentBallStructPtr = ballBackup;
    }
    camera_set_state(14);
    if (infoWork.unk0 & (1 << 10))
        func_8007D190(modeCtrl.unk0);
    else
    {
        func_8007D3A4(modeCtrl.unk0);
        func_80049158();
    }
    gameSubmodeRequest = SMD_GAME_BONUS_CLEAR_MAIN;
}

void submode_game_bonus_clear_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (modeCtrl.unk0 == 150.0)
        func_80049158();

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                if (!(ball->flags & (1 << 9)) && (ball->ape->unk14 & (1 << 14)))
                {
                    ball->flags &= -1281;
                    ball->flags |= 0x200;
                    modeCtrl.levelSetFlags |= 0x400;
                    g_play_sound(0x126);
                }
            }
        }
        currentBallStructPtr = ballBackup;
    }

    if ((modeCtrl.levelSetFlags & (1 << 10))
     && modeCtrl.unk0 > 60 && modeCtrl.unk0 < 240)
        modeCtrl.unk0 = 60;
    loadingStageId = func_80016FB4();
    if (loadingStageId < 0 && modeCtrl.unk0 == 60)
    {
        g_start_screen_fade(0x101, 0, 0x3D);
        func_8002CF38(60, 2);
    }
    if (--modeCtrl.unk0 > 0)
        return;
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->flags &= ~(1 << 9);
            }
        }
        currentBallStructPtr = ballBackup;
    }
    if (loadingStageId < 0 && modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        gameSubmodeRequest = SMD_GAME_RESULT_INIT;
    else
    {
        infoWork.unk1E = (modeCtrl.gameType != GAMETYPE_MAIN_PRACTICE) ? 1 : infoWork.unk1E + 1;
        gameSubmodeRequest = SMD_GAME_READY_INIT;
    }
}

void submode_game_over_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    event_finish(EVENT_SOUND);
    if (eventInfo[EVENT_SPRITE].state == EV_STATE_INACTIVE)
        event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    modeCtrl.unk0 = 120;
    if (!(modeCtrl.levelSetFlags & ((1 << 5)|(1 << 6))))
    {
        {
            struct Ball *ball;
            struct Ball *ballBackup;
            s8 *unk;
            int i;

            ballBackup = currentBallStructPtr;
            ball = ballInfo;
            unk = spritePoolInfo.unkC;
            for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
            {
                if (*unk == 2)
                {
                    currentBallStructPtr = ball;
                    g_play_sound(0x22C);
                }
            }
            currentBallStructPtr = ballBackup;
        }
    }
    func_8007DCD8(120);
    if (screenFadeInfo.unk8 == 0)
    {
        if (!(modeCtrl.levelSetFlags & ((1 << 5)|(1 << 6))))
            g_start_screen_fade(0x101, 0, 120);
        else
            g_start_screen_fade(0x101, 0xFFFFFF, 120);
    }
    func_8002CF38(0x2A, 0);
    gameSubmodeRequest = SMD_GAME_OVER_MAIN;
}

void submode_game_over_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (modeCtrl.unk0 == 90)
        g_play_sound(0x240);
    if (--modeCtrl.unk0 > 0)
        return;
    if (modeCtrl.playerCount == 1
     && func_800675E0(6) != 0
     && func_800675E0(7) != 0
     && func_800675E0(8) != 0
     && func_800676C0() == 0 && lbl_802F1FBC >= 0x9C4)
        gameSubmodeRequest = SMD_GAME_OVER_POINT_INIT;
    else if (func_8009F4C4() == 1)
    {
        func_8009F49C(3);
        event_start(EVENT_MEMCARD);
        gameSubmodeRequest = SMD_GAME_OVER_SAVE;
    }
    else
        gameSubmodeRequest = SMD_GAME_OVER_DEST;
}

void submode_game_over_point_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.unk0 = 300;
    event_finish_all();
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    func_8006677C(2, 0x140, 0x168);
    g_start_screen_fade(0x100, 0, 15);
    func_8002CF38(0x3E, 0);
    gameSubmodeRequest = SMD_GAME_OVER_POINT_MAIN;
}

void submode_game_over_point_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (func_80066868() != 0 && modeCtrl.unk0 > 30 && (lbl_801F3D88[2] & (1 << 8)))
        modeCtrl.unk0 = 30;
    if (modeCtrl.unk0 == 30)
        func_80075900(1, 20, 0);
    if (modeCtrl.unk0 == 15)
        g_start_screen_fade(0x101, 0, 15);
    if (--modeCtrl.unk0 > 0)
        return;
    if (func_8009F4C4() == 1)
    {
        func_8009F49C(3);
        event_start(EVENT_MEMCARD);
        gameSubmodeRequest = SMD_GAME_OVER_SAVE;
    }
    else
        gameSubmodeRequest = SMD_GAME_OVER_DEST;
}

void submode_game_over_save_func(void)
{
    if (eventInfo[EVENT_MEMCARD].state != 2)
        gameSubmodeRequest = SMD_GAME_OVER_DEST;
}

void submode_game_over_dest_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_COMPETITION:
        spritePoolInfo.unkC[0] = 0;
        spritePoolInfo.unkC[1] = 0;
        spritePoolInfo.unkC[2] = 0;
        spritePoolInfo.unkC[3] = 0;
        modeCtrl.unk2C = 0;
        currentBallStructPtr = &ballInfo[modeCtrl.unk2C];
        func_80029788();
        break;
    default:
        func_80017708(modeCtrl.unk2C);
        break;
    }
    if (func_80017720() != 0)
    {
        camera_setup_singleplayer_viewport();
        modeCtrl.unk10 = 0;
        gameModeRequest = 0;
        gameSubmodeRequest = SMD_ADV_TITLE_REINIT;
    }
    else
    {
        g_start_screen_fade(0x100, 0, 1);
        gameSubmodeRequest = SMD_GAME_READY_INIT;
    }
}

void submode_game_nameentry_ready_init_func(void)
{
    struct Struct80075900 sp8;

    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.levelSetFlags &= ~(1 << 5);
    if (!(modeCtrl.levelSetFlags & (1 << 0)) && (dipSwitches & (DIP_DEBUG|DIP_NAMEENTRY)) != (DIP_DEBUG|DIP_NAMEENTRY))
    {
        gameSubmodeRequest = SMD_GAME_OVER_INIT;
        return;
    }
    if (modeCtrl.gameType != GAMETYPE_MAIN_NORMAL
     || (func_800AECCC(modeCtrl.levelSet, &lbl_802C67D4[modeCtrl.unk2C]) < 0
         && (dipSwitches & (DIP_DEBUG|DIP_NAMEENTRY)) != (DIP_DEBUG|DIP_NAMEENTRY)))
    {
        gameSubmodeRequest = SMD_GAME_OVER_INIT;
        return;
    }
    modeCtrl.unk0 = 300;
    modeCtrl.levelSetFlags |= (1 << 5);
    load_stage(199);
    event_finish_all();
    event_start(EVENT_BALL);
    event_start(EVENT_STAGE);
    event_start(EVENT_WORLD);
    event_start(EVENT_INFO);
    event_start(EVENT_OBJ_COLLISION);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_RECPLAY);
    event_start(EVENT_STOBJ);
    event_start(EVENT_EFFECT);
    event_start(EVENT_REND_EFC);
    event_start(EVENT_BACKGROUND);
    event_start(EVENT_NAME_ENTRY);
    event_start(EVENT_VIBRATION);
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                if (ball->ape != NULL)
                    ball->ape->unk14 &= ~(1 << 3);
            }
        }
        currentBallStructPtr = ballBackup;
    }
    infoWork.unk0 |= (1 << 3);
    memset(&sp8, 0, sizeof(sp8));
    sp8.unk16 = 11;
    sp8.unkC = 0x140;
    sp8.unkE = 0x90;
    sp8.unk14 = 0;
    sp8.unk15 = 1;
    sp8.unk1C = 0;
    func_80075900(1, 1, &sp8);
    func_80075C18(1, lbl_801756BC[playerCharacterSelection[modeCtrl.unk2C]]);
    g_start_screen_fade(0x100, 0xFFFFFF, 30);
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *unk;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        unk = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, unk++)
        {
            if (*unk == 2)
            {
                currentBallStructPtr = ball;
                ball->state = 15;
            }
        }
        currentBallStructPtr = ballBackup;
    }
    camera_set_state(31);
    func_8002CF38(66, 0);
    gameSubmodeRequest = SMD_GAME_NAMEENTRY_READY_MAIN;
}

void submode_game_nameentry_ready_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (modeCtrl.unk0 == 120.0)
    {
        func_80075900(1, 20, 0);
        func_8007E44C(
            func_800AECCC(modeCtrl.levelSet, &lbl_802C67D4[modeCtrl.unk2C]),
            lbl_802C67D4[modeCtrl.unk2C].unk4);
        func_8007EA2C(modeCtrl.unk0);
    }
    if (modeCtrl.unk0 == 180)
        camera_set_state(33);
    if (--modeCtrl.unk0 > 0)
        return;
    gameSubmodeRequest = SMD_GAME_NAMEENTRY_INIT;
}

#define lbl_802F2BA0 0.0f
#define lbl_802F2BA4 1.0f
#define lbl_802F2BA8 0.5f
#define lbl_802F2BB0 24.0

/*
const float lbl_802F2BA0 = 0f;
const float lbl_802F2BA4 = 1f;
const float lbl_802F2BA8 = 0.5f;
const double lbl_802F2BB0 = 24;
const double lbl_802F2BB8 = 4503601774854144;
const double lbl_802F2BC0 = 300;
const float lbl_802F2BC8 = 0.75f;
const float lbl_802F2BCC = 32767f;
const double lbl_802F2BD0 = 260;
const double lbl_802F2BD8 = 240;
const float lbl_802F2BE0 = 120f;
const double lbl_802F2BE8 = 150;
const double lbl_802F2BF0 = -0.20000000000000001;
const double lbl_802F2BF8 = 120;
const double lbl_802F2C00 = 0.5;
const float lbl_802F2C08 = 2f;
const float lbl_802F2C0C = 0.10000000149011612f;
const double lbl_802F2C10 = 1;
*/
