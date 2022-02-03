#include <stddef.h>
#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "event.h"
#include "info.h"
#include "input.h"
#include "mode.h"
#include "sprite.h"
#include "stage.h"

extern s32 lbl_802F1C18;
extern s32 lbl_802F1C20;

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

const u32 lbl_801101C8[] =
{
    0x00230024,
    0x00250026,
    0x00270028,
    0x0029002A,
    0x002B002C,
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

extern int lbl_802F1F80;
extern int lbl_802F1FB0;

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
        modeCtrl.unk0 = 0x168;
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
