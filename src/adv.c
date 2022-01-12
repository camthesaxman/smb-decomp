/**
 * adv.c - Implements the attract screen sequence and title screen
 */
#include <math.h>
#include <stddef.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "input.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

void mode_adv_func(void)
{
    if (!(gameSubmode > SMD_ADV_TOP && gameSubmode < SMD_ADV_BOTTOM))
    {
        g_debug_set_cursor_pos(10, 10);
        g_debug_printf("sub_mode: error %d in Adv", gameSubmode);
        return;
    }

    if (!(gameSubmode == SMD_ADV_START_INIT || gameSubmode == SMD_ADV_START_MAIN))
        lbl_802F1BC8 = gameSubmode;

    if (!(gamePauseStatus & 0xA)
     && lbl_802F1BA8 > 0 && --lbl_802F1BA8 == 0)
        gameSubmodeRequest = SMD_ADV_TITLE_INIT;

    gameSubmodeFuncs[gameSubmode]();
}

void submode_adv_warning_init_func(void)
{
    lbl_802F1BCC = 0;
    func_8002FFEC();
    func_8009F49C(2);
    ev_run_init(EVENT_SPRITE);
    ev_run_init(EVENT_MEMCARD);
    gameSubmodeRequest = SMD_ADV_WARNING_MAIN;
}

void submode_adv_warning_main_func(void)
{
    if (eventInfo[EVENT_MEMCARD].state != EV_STATE_RUNNING)
        gameSubmodeRequest = SMD_ADV_LOGO_INIT;
}

void submode_adv_rating_init_func(void) {}

void submode_adv_rating_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if (--modeCtrl.unk0 <= 0)
        gameSubmodeRequest = (lbl_802F1B78 != 0) ? SMD_ADV_LOGO_INIT : SMD_ADV_INFO_INIT;
}

Vec lbl_801EECF8; FORCE_BSS_ORDER(lbl_801EECF8)

struct Struct801EED04 lbl_801EED04; FORCE_BSS_ORDER(lbl_801EED04)  // + 0xC

#define lbl_802F2A80 0.0f
#define lbl_802F2A88 4.5f
#define lbl_802F2A90 1.0
#define lbl_802F2A98 -0.004
#define lbl_802F2AA0 280.0
#define lbl_802F2AA8 1.35
#define lbl_802F2AB0 10.0
#define lbl_802F2AB8 1.5
#define lbl_802F2AC0 127.0
#define lbl_802F2AC8 15.0
#define lbl_802F2AD0 80.0
#define lbl_802F2AD8 0.85000002384185791
#define lbl_802F2AE0 16.0
#define lbl_802F2AE8 -64.0
#define lbl_802F2AF0 63.0
#define lbl_802F2AF8 0.1

#define lbl_802F2B08 255.0
#define lbl_802F2B10 2.1
#define lbl_802F2B18 8.5
#define lbl_802F2B20 0.25f

void submode_adv_logo_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    func_80011D90();
    lbl_802F1BCC = 0x00FFFFFF;
    modeCtrl.unk0 = 0x348;
    modeCtrl.levelSetFlags = 0;
    lbl_801EED04.unk14 = modeCtrl.unk0;
    lbl_801EED04.unk10 = 0;
    lbl_801EECF8.x = lbl_802F2A80;
    lbl_801EECF8.y = lbl_802F2A80;
    lbl_801EECF8.z = lbl_802F2A80;
    func_8002FFEC();
    func_80021DB4(0);
    lbl_80206BC0[0] = 0;
    event_clear();
    g_something_with_iteratively_freeing_memory();
    ev_run_init(EVENT_CAMERA);
    ev_run_init(EVENT_SPRITE);
    ev_run_init(EVENT_SOUND);
    camera_set_state(27);
    unload_stage();
    call_something_with_bmp_bmp_com(1);
    func_800767D0();
    g_play_sound(0x21);
    preload_stage_files(ST_001_PLAIN);
    func_80021DB4(0);
    func_800732DC(0x100, 0, 30);
    gameSubmodeRequest = 4;
}

void func_8000E804(void)
{
    if (lbl_801EED04.unk10 <= 120)
        lbl_801EED04.unk0.x = lbl_802F2A80;
    else if (lbl_801EED04.unk10 <= 240)
        lbl_801EED04.unk0.x = lbl_802F2A88 * (lbl_802F2A90 - __fabs(mathutil_cos((lbl_801EED04.unk10 - 120) * 273)));

    if (lbl_801EED04.unk10 <= 180)
        lbl_801EED04.unk0.y = (180 - lbl_801EED04.unk10) * lbl_802F2A98;

    if (lbl_801EED04.unk10 <= 180)
        lbl_801EED04.unk0.z = (lbl_802F2A90 - mathutil_sin(lbl_801EED04.unk10 * 91)) * lbl_802F2AA0;
    else if (lbl_801EED04.unk10 > 300 && lbl_801EED04.unk10 <= 420)
        lbl_801EED04.unk0.z = (lbl_801EED04.unk10 - 300) * lbl_802F2AA8;

    if (lbl_801EED04.unk10 <= 120)
        lbl_801EED04.unkE = 0;
    else if (lbl_801EED04.unk10 <= 180)
        lbl_801EED04.unkE = (lbl_801EED04.unk10 - 120) * -546;
    else if (lbl_801EED04.unk10 <= 240)
        lbl_801EED04.unkE = (240 - lbl_801EED04.unk10) * -546;

    if (lbl_801EED04.unk10 <= 180)
        lbl_801EED04.unkC = lbl_801EED04.unk10 * -546;
    else if (lbl_801EED04.unk10 <= 300)
        lbl_801EED04.unkC = 0;
    else if (lbl_801EED04.unk10 <= 420)
        lbl_801EED04.unkC = (lbl_801EED04.unk10 - 300) * 546;

    if (lbl_801EED04.unk10 > 0)
    {
        s8 r4, r5;
        int r29, r28;
        float f3 = mathutil_sqrt(
            (lbl_801EED04.unk0.x - lbl_801EECF8.x) * (lbl_801EED04.unk0.x - lbl_801EECF8.x)
          + (lbl_801EED04.unk0.z - lbl_801EECF8.z) * (lbl_801EED04.unk0.z - lbl_801EECF8.z));

        f3 *= lbl_802F2AB0;
        r4 = MIN(f3 * lbl_802F2AB8, lbl_802F2AC0);
        r5 = MIN(f3 * lbl_802F2AC8, lbl_802F2AD0) * lbl_802F2AD8;
        r29 = CLAMP(lbl_801EED04.unk0.x * lbl_802F2AE0, lbl_802F2AE8, lbl_802F2AF0);
        r28 = CLAMP((lbl_802F2AA0 - lbl_801EED04.unk0.z) * lbl_802F2AF8, lbl_802F2AE8, lbl_802F2AF0);
        lbl_802F1DF8 = 0;
        func_8002CA5C(0, r4, r5);
        lbl_802F1DF8 = 0;
        SoundPan(0x51, r29, r28);
        lbl_802F1DF8 = 0;
        SoundPan(0x52, r29, r28);
        lbl_802F1DF8 = 0;
        SoundPan(0x53, r29, r28);
    }
    lbl_801EECF8 = lbl_801EED04.unk0;
}

void func_8000EB48(void)
{
    if (lbl_801EED04.unk14 == 0)
        return;
    if (lbl_801EED04.unk14 <= 660)
        lbl_801EED04.unk10++;
    func_8000E804();
    if (lbl_801EED04.unk14 == 460)
        g_play_sound(0x3B1F4);
    if (lbl_801EED04.unk14 == 240)
        func_8002BFCC(0x51F2, 0x51F3);
    if (lbl_801EED04.unk14 < 240 && lbl_801EED04.unk14 >= 210)
    {
        int var1 = 240 - lbl_801EED04.unk14;
        u32 r0;

        if (var1 >= 30)
            r0 = 0x00FFC000;
        else
            r0 = 0xFF0000
               | ((int)(lbl_802F2B08 - var1 * lbl_802F2B10) << 8)
               | (int)(lbl_802F2B08 - var1 * lbl_802F2B18);
        lbl_802F1BCC = r0;
    }
    if (lbl_801EED04.unk14 > 0)
        lbl_801EED04.unk14--;
}

void submode_adv_logo_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    if ((dipSwitches & DIP_DEBUG)
     && modeCtrl.unk0 > 30
     && (controllerInfo[0].unk0[0].button & PAD_BUTTON_X)
     && (controllerInfo[0].unk0[2].button & PAD_BUTTON_Y))
        modeCtrl.unk0 = 30;

    func_8000EB48();

    if ((dipSwitches & DIP_DEBUG)
     && !(modeCtrl.levelSetFlags & (1<<(31-0x12)))
     && modeCtrl.unk0 > 60
     && lbl_802F1BA8 == 0)
    {
        if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[1].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[2].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[3].unk0[2].button & PAD_BUTTON_START))
        {
            func_8000FEC8(30);
            func_8002CF38(2, 0);
        }
    }

    if (modeCtrl.levelSetFlags & (1 << 13))
        return;

    if (modeCtrl.unk0 > 30 && modeCtrl.unk0 < 690)
    {
        if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[1].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[2].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[3].unk0[2].button & PAD_BUTTON_START))
            modeCtrl.unk0 = 30;
    }

    if (modeCtrl.unk0 == 30)
    {
        func_800732DC(0x101, 0, 30);
        func_80075900(0, 20, NULL);
    }
    if (--modeCtrl.unk0 <= 0)
    {
        g_dest_sprite_with_font(3);
        gameSubmodeRequest = 1;
    }
}

// + 0x34
struct Struct801EED2C lbl_801EED2C;  FORCE_BSS_ORDER(lbl_801EED2C)

void submode_adv_demo_init_func(void)
{
    //u8 dummy[8];
    int i;

    if (gamePauseStatus & 0xA)
        return;
    func_80011D90();
    lbl_802F1BCC = 0x00FFFFFF;
    modeCtrl.unk0 = 2902;
    modeCtrl.levelSetFlags = 0;
    lbl_802F1BB0 = 0;
    lbl_801EED2C.unk8 = 0;
    lbl_801EED2C.unk4 = 0x108;
    func_800569B4(1);
    load_stage(ST_099_JUNGLE_BG);
    func_8002FFEC();
    event_clear();
    g_something_with_iteratively_freeing_memory();
    for (i = 0; i < 4; i++)
        spritePoolInfo.unkC[i] = 2;
    modeCtrl.playerCount = 1;
    modeCtrl.unk30 = 1;
    modeCtrl.unk28 = 0;
    modeCtrl.unk2C = 0;
    lbl_80206BC0[0] = 0;
    lbl_80206BC0[1] = 1;
    lbl_80206BC0[2] = 2;
    lbl_80206BC0[3] = 3;
    ev_run_init(3);
    for (i = 0; i < 4; i++)
    {
        lbl_801EED04.unk18[i] = 1;
        lbl_802F1BB4[i] = 0;
        lbl_802F1BBC[i] = 0;
    }
    ev_run_init(EVENT_STAGE);
    ev_run_init(EVENT_STOBJ);
    ev_run_init(EVENT_ITEM);
    ev_run_init(EVENT_OBJ_COLLISION);
    ev_run_init(EVENT_CAMERA);
    ev_run_init(EVENT_SPRITE);
    ev_run_init(EVENT_EFFECT);
    ev_run_init(EVENT_REND_EFC);
    ev_run_init(EVENT_BACKGROUND);
    ev_run_init(EVENT_SOUND);
    func_80021DB4(currStageId);
    func_800972CC();
    for (i = 0; i < 4; i++)
    {
        ballInfo[i].state = 0x15;
        ballInfo[i].bananas = 0;
        lbl_80206BF0[i].unk8 = 1;
    }
    camera_set_state(29);
    call_something_with_bmp_bmp_com(1);
    func_80076620(0);
    func_80076C54(0);
    func_8002CF38(2, 0);
    gameSubmodeRequest = SMD_ADV_DEMO_MAIN;
}

struct Struct8000F030
{
    u8 filler0[0xC];
    u16 unkC;
    u16 unkE;
    u8 filler10[0x20-0x10];
    s32 unk20;
};

float lbl_801741CC[] = { -125, -70, -10 };

void lbl_8000F030(struct Struct8000F030 *a)
{
    Vec spC;

    mathutil_mtxA_from_mtxB();
    g_math_unk15(&ballInfo[a->unk20 - 1].unkFC->unk30, &spC, currentCameraStructPtr->sub28.unk38);
    a->unkC = spC.x;
    a->unkE = spC.y + lbl_801741CC[a->unk20 - 1];
}

struct Struct8010FAB0
{
    s32 unk0;
    u32 unk4;
    s32 unk8;
};

const struct Struct8010FAB0 lbl_8010FAB0[] =
{
    {    0,  9,    3 },
    {    0, 10,   71 },
    {    0, 16,   14 },
    {    0, 17,   14 },
    {    0, 18,    9 },
    {    3,  6,   64 },
    {    0,  6,  128 },
    {  165,  0,    0 },
    {  220,  0,    1 },
    {  275,  0,    2 },
    {  404,  3,   30 },
    {  404,  1,   -1 },
    {  404,  7,  128 },
    {  434,  2,   30 },
    {  434,  9,    1 },
    {  434,  9,    2 },
    {  434, 16,    1 },
    {  434,  6,    1 },
    {  544, 16,    2 },
    {  651, 11,   71 },
    {  651,  9,    0 },
    {  651,  8,    1 },
    {  652, 10,   61 },
    {  652,  7,    1 },
    {  596, 17,    4 },
    {  651, 17,    3 },
    {  706, 17,    4 },
    {  761, 17,    5 },
    {  816, 17,    4 },
    {  871, 17,    5 },
    {  981, 17,    4 },
    {  869, 11,   61 },
    {  869,  9,    1 },
    {  869,  8,    2 },
    {  870, 10,  101 },
    {  869, 18,    7 },
    { 1087, 11,  101 },
    { 1087,  8,    0 },
    { 1087,  8,    1 },
    { 1087, 16,   11 },
    { 1087, 17,   11 },
    { 1087, 18,   11 },
    { 1088, 10,   13 },
    { 1088,  6,    1 },
    { 1253,  6,  512 },
    { 1276,  3,   30 },
    { 1305,  7,  512 },
    { 1305, 11,   13 },
    { 1305,  9,    1 },
    { 1305,  9,    2 },
    { 1306, 10,    9 },
    { 1306,  2,   30 },
    { 1306,  7,    1 },
    { 1305, 13,   -1 },
    { 1305, 14,    0 },
    { 1305,  6,   32 },
    { 1306,  6,    2 },
    { 1306,  6,    4 },
    { 1739, 15,   -1 },
    { 1739, 11,    9 },
    { 1739,  9,    0 },
    { 1739,  8,    1 },
    { 1739,  8,    2 },
    { 1740, 10,   21 },
    { 1739, 13,   -1 },
    { 1739, 14,    2 },
    { 1739, 14,    1 },
    { 1739,  6,   32 },
    { 1953, 15,   -1 },
    { 1953, 11,   21 },
    { 1953,  8,    0 },
    { 1953,  8,    1 },
    { 1953,  8,    2 },
    { 1954, 10,   95 },
    { 1954,  8,    3 },
    { 1954,  9,    0 },
    { 1954,  9,    1 },
    { 1954,  9,    2 },
    { 1953, 13,   -1 },
    { 1953, 14,    3 },
    { 1954,  6,   32 },
    { 2167, 15,   -1 },
    { 2167, 11,   95 },
    { 2167,  8,    0 },
    { 2167,  8,    1 },
    { 2167,  8,    2 },
    { 2167,  9,    0 },
    { 2167,  9,    1 },
    { 2167,  9,    2 },
    { 2167,  9,    3 },
    { 2167, 13,   -1 },
    { 2167, 14,    3 },
    { 2167, 14,    2 },
    { 2167, 14,    1 },
    { 2167, 14,    0 },
    { 2167,  6,   32 },
    { 2168,  6, 2048 },
    { 2168,  6, 4096 },
    { 2169,  8,    0 },
    { 2169,  8,    1 },
    { 2169,  8,    2 },
    { 2169,  8,    3 },
    {   -1,  0,    0 },
};

void func_8000F0CC(void)
{
    float f28;
    const struct Struct8010FAB0 *r22;
    Vec sp3C;
    struct Struct80075900 sp14;
    Vec sp8;
    int i;
    struct Sprite *sprite;

    if (lbl_801EED2C.unk8 >= 0xB56)
        return;
    f28 = lbl_801EED2C.unk8;
    for (r22 = lbl_8010FAB0; r22->unk0 != -1; r22++)
    {
        if (f28 > r22->unk0 || f28 < r22->unk0)
            continue;

        switch (r22->unk4)
        {
        case 0:
            if (!(modeCtrl.levelSetFlags & (1<<(31-0x12))))
            {
                mathutil_mtxA_from_mtxB();
                g_math_unk15(&ballInfo[r22->unk8].unkFC->unk30, &sp3C, currentCameraStructPtr->sub28.unk38);
                memset(&sp14, 0, sizeof(sp14));
                sp14.unkC = sp3C.x;
                sp14.unkE = sp3C.y;
                sp14.unk15 = (r22->unk8 == 2) ? 3 : 4;
                sp14.unk14 = (r22->unk8 == 2) ? 4 : 5;
                sp14.unk16 = 11;
                sp14.unk1C = lbl_8000F030;
                func_80075900(r22->unk8 + 1, 1, &sp14);
                func_80078184(r22->unk8);
            }
            break;
        case 1:
            for (i = 0; i < 3; i++)
                func_80075900(i + 1, 20, NULL);
            sprite = g_find_sprite_with_probably_not_font(30);
            if (sprite != NULL)
                sprite->unk10 = -1;
            sprite = g_find_sprite_with_probably_not_font(31);
            if (sprite != NULL)
                sprite->unk10 = -1;
            sprite = g_find_sprite_with_probably_not_font(32);
            if (sprite != NULL)
                sprite->unk10 = -1;
            break;
        case 2:
            func_800732DC(0x100, 0xFFFFFF, r22->unk8);
            break;
        case 3:
            func_800732DC(0x101, 0xFFFFFF, r22->unk8);
            break;
        case 4:
            func_80055164(r22->unk8);
            break;
        case 5:
            ev_run_dest(EVENT_STAGE);
            ev_run_dest(EVENT_STOBJ);
            ev_run_dest(EVENT_ITEM);
            ev_run_dest(EVENT_EFFECT);
            ev_run_dest(EVENT_REND_EFC);
            ev_run_dest(EVENT_BACKGROUND);
            load_bg_files(r22->unk8);
            ev_run_init(EVENT_STAGE);
            ev_run_init(EVENT_STOBJ);
            ev_run_init(EVENT_ITEM);
            ev_run_init(EVENT_EFFECT);
            ev_run_init(EVENT_REND_EFC);
            ev_run_init(EVENT_BACKGROUND);
            break;
        case 6:
            lbl_801EED2C.unk4 |= r22->unk8;
            break;
        case 7:
            lbl_801EED2C.unk4 &= ~r22->unk8;
            break;
        case 8:
            ballInfo[r22->unk8].unkFC->unk14 &= ~(1<<(31-0x1A));
            break;
        case 9:
            ballInfo[r22->unk8].unkFC->unk14 |= 0x20;
            break;
        case 10:
            preload_stage_files(r22->unk8);
            break;
        case 11:
            ev_run_dest(EVENT_STAGE);
            ev_run_dest(EVENT_STOBJ);
            ev_run_dest(EVENT_ITEM);
            ev_run_dest(EVENT_EFFECT);
            ev_run_dest(EVENT_REND_EFC);
            ev_run_dest(EVENT_BACKGROUND);
            func_800569B4(1);
            load_stage(r22->unk8);
            ev_run_init(EVENT_STAGE);
            ev_run_init(EVENT_STOBJ);
            ev_run_init(EVENT_ITEM);
            ev_run_init(EVENT_EFFECT);
            ev_run_init(EVENT_REND_EFC);
            ev_run_init(EVENT_BACKGROUND);
            func_800972CC();
            break;
        case 12:
            func_80021DB4(0);
            break;
        case 13:
            ev_run_init(EVENT_WORLD);
            ev_run_init(EVENT_INFO);
            camera_set_state(54);
            func_80021DB4(currStageId);
            break;
        case 14:
            ball_func_21(&ballInfo[r22->unk8]);
            ballInfo[r22->unk8].bananas = 0;
            lbl_80206BF0[r22->unk8].unk8 = 1;
            lbl_801EED2C.unkC = r22->unk8;
            break;
        case 15:
            ev_run_dest(EVENT_WORLD);
            ev_run_dest(EVENT_INFO);
            camera_set_state(29);
            break;
        case 16:
            lbl_801EED04.unk18[0] = r22->unk8;
            break;
        case 17:
            lbl_801EED04.unk18[1] = r22->unk8;
            break;
        case 18:
            lbl_801EED04.unk18[2] = r22->unk8;
            break;
        case 19:
            lbl_801EED04.unk18[3] = r22->unk8;
            break;
        case 21:
            ballInfo[0].unkFC->unk14 |= r22->unk8;
            break;
        case 22:
            ballInfo[0].unkFC->unk14 &= ~r22->unk8;
            break;
        case 23:
            ballInfo[1].unkFC->unk14 |= r22->unk8;
            break;
        case 24:
            ballInfo[1].unkFC->unk14 &= ~r22->unk8;
            break;
        case 25:
            ballInfo[2].unkFC->unk14 |= r22->unk8;
            break;
        case 26:
            ballInfo[2].unkFC->unk14 &= ~r22->unk8;
            break;
        case 27:
            sp8.x = lbl_802F2A80;
            sp8.y = lbl_802F2B20;
            sp8.z = lbl_802F2A80;
            func_8001898C(0, r22->unk8, &sp8);
            break;
        case 28:
            func_800783C0(r22->unk8);
            break;
        case 29:
            sprite = g_find_sprite_with_probably_not_font(11);
            if (sprite != NULL)
            {
                sprite->unk48 = r22->unk8;
                sprite->unk10 = 0;
            }
            break;
        case 30:
            g_dest_sprite_with_font(11);
            break;
        }
    }
    lbl_801EED2C.unk8++;
}

void submode_adv_demo_main_func(void)
{
    if (gamePauseStatus & 0xA)
        return;
    if (lbl_802014E0.unk0 == 2 && lbl_802014E0.unk4 == 1)
        lbl_802F1BB0 = 1;
    if (lbl_802F1BB0 == 0)
        return;
    if (lbl_801EED2C.unk8 == 0)
        func_800732DC(0x100, 0, 60);
    func_8000F0CC();
    if (lbl_801EED2C.unk8 == 0xA2A)
        func_8000FEC8(100);
    if (!(modeCtrl.levelSetFlags & (1 << 13)) && modeCtrl.unk0 > 60
     && lbl_802F1BA8 == 0)
    {
        if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[1].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[2].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[3].unk0[2].button & PAD_BUTTON_START))
            func_8000FEC8(30);
    }
    modeCtrl.unk0--;
}

#define lbl_802F2B34 -0.16203702986240387f
#define lbl_802F2B38 0.00027777778450399637f
#define lbl_802F2B3C 9.619999885559082f
#define lbl_802F2B40 0.57999998331069946f
#define lbl_802F2B44 -4.25f
#define lbl_802F2B48 -1.0f
#define lbl_802F2B4C 0.89999997615814209f
#define lbl_802F2B50 -0.5f
#define lbl_802F2B54 1.0f


struct Struct80176434 lbl_80174254[] =
{
    {    0, -15.51,   0,   0 },
    {  433, -15.51,   0,   0 },
    {  434,      0,   0,   0 },
    {  651,      0,   0,   0 },
    { 1088,  10.24,   0,   0 },
    { 1305,  10.24,   0,   0 },
    { 1306,      0,   0,   0 },
    { 1953,      0,   0,   0 },
    { 1954,   -0.5,   0,   0 },
    { 2167,   -0.5,   0,   0 },
    { 1954,    0.5,   0,   0 },
    { 2902,    0.5,   0,   0 },
};

struct Struct80176434 lbl_80174314[] =
{
    {    0, -58.591,   0,   0 },
    {  433, -58.591,   0,   0 },
    {  434,       0,   0,   0 },
    {  651,       0,   0,   0 },
    { 1088,     0.5,   0,   0 },
    { 1305,     0.5,   0,   0 },
    { 1306,       0,   0,   0 },
    { 1953,       0,   0,   0 },
    { 1954,       0,   0,   0 },
    { 2019,       0,   0,   0 },
    { 2064,       2,   0,   0 },
    { 2167,       2,   0,   0 },
    { 1954,       0,   0,   0 },
    { 2902,       0,   0,   0 },
};

struct Struct80176434 lbl_801743F4[] =
{
    {    0, -43.288,   0,   0 },
    {  433, -43.288,   0,   0 },
    {  434,       0,   0,   0 },
    {  651,       0,   0,   0 },
    { 1088,      10,   0,   0 },
    { 1305,      10,   0,   0 },
    { 1306,       0,   0,   0 },
    { 1953,       0,   0,   0 },
    { 1954,   -0.25,   0,   0 },
    { 2167,   -0.25,   0,   0 },
    { 1954,       0,   0,   0 },
    { 2902,       0,   0,   0 },
};

struct Struct80176434 lbl_801744B4[] =
{
    {    0,   61440,   0,   0 },
    {  433,   61440,   0,   0 },
    {  434,       0,   0,   0 },
    {  651,       0,   0,   0 },
    { 1088,   61440,   0,   0 },
    { 1305,   61440,   0,   0 },
    { 1306,   32768,   0,   0 },
    { 1953,   32768,   0,   0 },
    { 1954,   32768,   0,   0 },
    { 2167,   32768,   0,   0 },
    { 1954,   32768,   0,   0 },
    { 2902,   32768,   0,   0 },
};

struct Struct80176434 lbl_80174574[] =
{
    {    0,   -14.11,   0,   0 },
    {  433,   -14.11,   0,   0 },
    {  652, -445.764,   0,   0 },
    {  762, -444.964,   0,   0 },
    {  871, -445.764,   0,   0 },
    {  872, -453.964,   0,   0 },
    {  869, -451.364,   0,   0 },
    { 1088,      9.8,   0,   0 },
    { 1739,      9.8,   0,   0 },
    { 1740,     -0.3,   0,   0 },
    { 1953,     -0.3,   0,   0 },
    { 1954,      0.5,   0,   0 },
    { 2167,      0.5,   0,   0 },
    { 1954,     -0.5,   0,   0 },
    { 2902,     -0.5,   0,   0 },
};

struct Struct80176434 lbl_80174664[] =
{
    {    0,  -58.591,   0,   0 },
    {  433,  -58.591,   0,   0 },
    {  652,  -46.952,   0,   0 },
    {  869,  -46.952,   0,   0 },
    { 1088,      0.5,   0,   0 },
    { 1739,      0.5,   0,   0 },
    { 1740,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2019,        0,   0,   0 },
    { 2064,        2,   0,   0 },
    { 2167,        2,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2902,        0,   0,   0 },
};

struct Struct80176434 lbl_80174744[] =
{
    {    0,  -41.888,   0,   0 },
    {  433,  -41.888,   0,   0 },
    {  652, -231.687,   0,   0 },
    {  871, -231.687,   0,   0 },
    {  872, -230.587,   0,   0 },
    {  869, -233.587,   0,   0 },
    { 1088,     10.4,   0,   0 },
    { 1739,     10.4,   0,   0 },
    { 1740,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,    -0.25,   0,   0 },
    { 2167,    -0.25,   0,   0 },
    { 1954,     -0.2,   0,   0 },
    { 2902,     -0.2,   0,   0 },
};

struct Struct80176434 lbl_80174824[] =
{
    {    0,     4096,   0,   0 },
    {  433,     4096,   0,   0 },
    {  652,    11776,   0,   0 },
    {  871,    11776,   0,   0 },
    {  872,    55680,   0,   0 },
    {  869,    55680,   0,   0 },
    { 1088,    12288,   0,   0 },
    { 1739,    12288,   0,   0 },
    { 1740,    32768,   0,   0 },
    { 1953,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2167,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2902,    32768,   0,   0 },
};

struct Struct80176434 lbl_80174904[] =
{
    {    0,   -15.06,   0,   0 },
    {  433,   -15.06,   0,   0 },
    {  870,    -4.61,   0,   0 },
    { 1087,    -4.71,   0,   0 },
    { 1088,     9.82,   0,   0 },
    { 1739,     9.82,   0,   0 },
    { 1740,      0.3,   0,   0 },
    { 1953,      0.3,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2167,        0,   0,   0 },
    { 1954,     -0.1,   0,   0 },
    { 2902,     -0.1,   0,   0 },
};

struct Struct80176434 lbl_801749C4[] =
{
    {    0,  -58.591,   0,   0 },
    {  433,  -58.591,   0,   0 },
    {  870,    -0.84,   0,   0 },
    { 1087,    -0.84,   0,   0 },
    { 1088,     0.58,   0,   0 },
    { 1739,     0.58,   0,   0 },
    { 1740,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2019,        0,   0,   0 },
    { 2064,        2,   0,   0 },
    { 2167,        2,   0,   0 },
    { 1954,     -0.1,   0,   0 },
    { 2902,     -0.1,   0,   0 },
};

struct Struct80176434 lbl_80174AA4[] =
{
    {    0,  -41.688,   0,   0 },
    {  433,  -41.688,   0,   0 },
    {  870,     1.69,   0,   0 },
    { 1087,     1.39,   0,   0 },
    { 1088,      9.9,   0,   0 },
    { 1739,      9.9,   0,   0 },
    { 1740,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,     0.25,   0,   0 },
    { 2167,     0.25,   0,   0 },
    { 1954,      0.1,   0,   0 },
    { 2902,      0.1,   0,   0 },
};

struct Struct80176434 lbl_80174B64[] =
{
    {    0,    61440,   0,   0 },
    {  433,    61440,   0,   0 },
    {  870,     8192,   0,   0 },
    { 1087,     8192,   0,   0 },
    { 1088,        0,   0,   0 },
    { 1739,        0,   0,   0 },
    { 1740,    32768,   0,   0 },
    { 1953,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2167,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2902,    32768,   0,   0 },
};

struct Struct80176434 lbl_80174C24[] =
{
    { 1306,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,        0,   0,   0 },
    { 2167,        0,   0,   0 },
    { 1954,      0.1,   0,   0 },
    { 2902,      0.1,   0,   0 },
};

struct Struct80176434 lbl_80174C84[] =
{
    { 1306,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,        2,   0,   0 },
    { 2008,        2,   0,   0 },
    { 2009,        2,   0,   0 },
    { 2019,        0,   0,   0 },
    { 2167,        0,   0,   0 },
    { 1954,      0.1,   0,   0 },
    { 2902,      0.1,   0,   0 },
};

struct Struct80176434 lbl_80174D14[] =
{
    { 1306,        0,   0,   0 },
    { 1953,        0,   0,   0 },
    { 1954,     -0.1,   0,   0 },
    { 2167,     -0.1,   0,   0 },
    { 1954,     -0.3,   0,   0 },
    { 2902,     -0.3,   0,   0 },
};

struct Struct80176434 lbl_80174D74[] =
{
    { 1306,    32768,   0,   0 },
    { 1953,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2167,    32768,   0,   0 },
    { 1954,    32768,   0,   0 },
    { 2902,    32768,   0,   0 },
};

struct Struct80176434 *lbl_80174DD4[] =
{
    lbl_80174254,
    lbl_80174574,
    lbl_80174904,
    lbl_80174C24,
};

struct Struct80176434 *lbl_80174DE4[] =
{
    lbl_80174314,
    lbl_80174664,
    lbl_801749C4,
    lbl_80174C84,
};

struct Struct80176434 *lbl_80174DF4[] =
{
    lbl_801743F4,
    lbl_80174744,
    lbl_80174AA4,
    lbl_80174D14,
};

struct Struct80176434 *lbl_80174E04[] =
{
    lbl_801744B4,
    lbl_80174824,
    lbl_80174B64,
    lbl_80174D74,
};

void lbl_8000F790(struct Ball_child *a, int b)
{
    struct Struct8003FB48 sp38;
    s16 r30;
    int r28;
    int r4, r5, r6;
    float f31 = lbl_801EED2C.unk8;

    switch (b)
    {
    case 3:
        func_8008B2D4(a);
        return;
    }
    if (lbl_801EED2C.unk4 & (1<<(31-0x1A)))
    {
        struct Ball *r30 = &ballInfo[a->unkC0];

        if (gamePauseStatus & 0xA)
            return;
        func_8003FB48(&r30->pos, &sp38, NULL);
        a->unk14 &= -20;
        if (!(sp38.unk0 & 1) && r30->vel.y < lbl_802F2B34)
            a->unk14 |= 2;
        else if (mathutil_vec_mag(&r30->unkB8) < lbl_802F2B38)
            a->unk14 |= 1;
        if (a->unk14 & (1<<(31-0x1A)))
            r30->flags |= 0x10;
        else
            r30->flags &= ~(1<<(31-0x1B));
        r28 = (r30->flags & (1<<12)) != 0;
        r28 |= !(a->unk14 & 3);
        func_8003699C(a);
        if (r28)
            f31 = func_80036CAC(a);
        else
        {
            f31 = lbl_802F2A80;
            mathutil_mtxA_from_quat(&a->unk60);
            mathutil_mtxA_normalize_basis();
            if (a->unk14 & (1<<(31-0x1E)))
                func_80037718(a);
        }
        if (r30->flags & (1<<(31-0x1A)))
            f31 = mathutil_vec_mag(&r30->vel);
        func_80036EB8(a);
        mathutil_mtxA_to_quat(&a->unk60);
        func_8003721C(a, f31);
        func_8008C4A8(a);
        if (!(a->unk14 & (1<<(31-0x1C))))
            func_8003765C(a);
        if (lbl_801EED2C.unk8 >= 0x682 && lbl_801EED2C.unk8 < 0x6CC)
            r30->unk104 = currentCameraStructPtr->eye;
        else if (lbl_801EED2C.unk8 >= 0x51A && lbl_801EED2C.unk8 < 0x6CC)
        {
            r30->unk104.x = lbl_802F2B3C;
            r30->unk104.y = lbl_802F2B40;
            r30->unk104.z = lbl_802F2B44;
        }
        if (lbl_801EED2C.unk8 >= 0x6CC && lbl_801EED2C.unk8 < 0x73A && a->unk10 == 2)
            r30->unk104.x = a->unk30.x + lbl_802F2A90;
        if (lbl_801EED2C.unk8 >= 0x73A && lbl_801EED2C.unk8 < 0x7A2)
            r30->unk104 = ballInfo[1].unkFC->unk30;
        func_8008C090(a, &r30->unk104);
        r30->unk100 = 0;
        r30->unk110 = lbl_802F2A80;
    }
    else
    {
        a->unk14 &= -20;
        a->unk14 |= 1;
        a->unk30.x = func_8008CDC0(f31, lbl_80174DD4[a->unk10]);
        a->unk30.y = func_8008CDC0(f31, lbl_80174DE4[a->unk10]);
        a->unk30.z = func_8008CDC0(f31, lbl_80174DF4[a->unk10]);
        r30 = func_8008CDC0(f31, lbl_80174E04[a->unk10]);
        if (a->unk10 == lbl_802F1EB4)
        {
            a->unk30.x += lbl_802F1ECC * lbl_802F2AF8;
            a->unk30.y += lbl_802F1EC8 * lbl_802F2AF8;
            a->unk30.z += lbl_802F1EC4 * lbl_802F2AF8;
            r30 += lbl_802F1ED2;
        }
        mathutil_mtxA_from_identity();
        mathutil_mtxA_translate(&a->unk30);
        mathutil_mtxA_rotate_y(r30);
        mathutil_mtxA_rotate_y(0xC000);
        mathutil_mtxA_to_quat(&a->unk60);
        r4 = 6;
        r5 = 0;
        r6 = lbl_801EED04.unk18[a->unk10];
        if (r6 < 0)
        {
            switch (r6 + 9)
            {
            case 8:
                r4 = 8;
                r5 = 1;
                break;
            case 7:
                r4 = 5;
                r5 = 4;
                break;
            case 6:
                r4 = 2;
                r5 = 15;
                break;
            case 5:
                r4 = 5;
                r5 = 6;
                break;
            case 4:
                r4 = 5;
                r5 = 8;
                break;
            case 3:
                r4 = 5;
                r5 = 2;
                break;
            case 2:
                r4 = 2;
                r5 = 0;
                break;
            case 1:
                r4 = 5;
                r5 = 0;
                break;
            case 0:
                r4 = 5;
                r5 = 10;
                break;
            }
        }
        func_8008BBD4(a, r4, r5, r6, lbl_802F2A80);
        a->unk3C = (Vec){ 0.0f, -0.12f, 0.0f };
        func_8008C4A8(a);
        if (lbl_801EED2C.unk4 & (1<<(31-0x16)))
        {
            s16 sp30[] = { 0x2E00, 0xE100, 0x1500, 0x0000 };
            s16 sp28[] = { 0x0000, 0x0000, 0x0980, 0x0000 };

            lbl_802F1BB4[a->unk10] += (sp30[a->unk10] - lbl_802F1BB4[a->unk10]) * lbl_802F2AF8;
            lbl_802F1BBC[a->unk10] += (sp28[a->unk10] - lbl_802F1BBC[a->unk10]) * lbl_802F2AF8;
            func_8008BFDC(a, lbl_802F1ED2 + lbl_802F1BB4[a->unk10], lbl_802F1ED0 + lbl_802F1BBC[a->unk10]);
        }
        else if (a->unk14 & (1<<(31-9)))
        {
            Vec sp1C;
            mathutil_mtxA_push();
            mathutil_mtxA_from_quat(&a->unk60);
            mathutil_mtxA_mult_right((void *)((u8 *)a->unk0 + 0x8EC8));
            mathutil_mtxA_tf_vec_xyz(&sp1C, lbl_802F2A80, lbl_802F2B48, lbl_802F2A80);
            a->unkAC = lbl_802F2A80;
            switch (a->unk10)
            {
            case 2:
                a->unkA0.x = lbl_802F2B4C;
                a->unkA0.y = lbl_802F2B50;
                break;
            default:
                a->unkA0.x = lbl_802F2B54;
                a->unkA0.y = lbl_802F2A80;
                break;
            }
            a->unkA0.z = lbl_802F2A80;
            mathutil_vec_normalize_len(&a->unkA0);
            mathutil_mtxA_tf_vec_xyz(&sp1C, lbl_802F2B54, lbl_802F2A80, lbl_802F2A80);
            sp1C.x += a->unk30.x;
            sp1C.y += a->unk30.y;
            sp1C.z += a->unk30.z;
            func_8008C090(a, &sp1C);
            mathutil_mtxA_pop();
        }
    }
}

void func_8000FEC8(int a)
{
    struct Sprite *sprite;

    sprite = g_find_sprite_with_probably_not_font(37);
    if (sprite != NULL)
        sprite->unk48 = -1;

    sprite = g_find_sprite_with_probably_not_font(38);
    if (sprite != NULL)
        sprite->unk48 = -1;

    sprite = g_find_sprite_with_probably_not_font(39);
    if (sprite != NULL)
        sprite->unk48 = -1;

    func_80075900(1, 20, NULL);
    func_80075900(2, 20, NULL);
    func_80075900(3, 20, NULL);

    sprite = g_find_sprite_with_probably_not_font(30);
    if (sprite != NULL)
        sprite->unk10 = -1;

    sprite = g_find_sprite_with_probably_not_font(31);
    if (sprite != NULL)
        sprite->unk10 = -1;

    sprite = g_find_sprite_with_probably_not_font(32);
    if (sprite != NULL)
        sprite->unk10 = -1;

    func_80075900(0, 20, NULL);

    sprite = g_find_sprite_with_probably_not_font(17);
    if (sprite != NULL)
        sprite->unk48 = 1;

    func_80076DCC(a);
    g_play_sound(0xA022);
    if (lbl_802014E0.unk0 != 2)
        func_8002CF38(3, 0);
    modeCtrl.levelSetFlags |= 0x2000;
    lbl_802F1BA8 = a;
}

void submode_adv_title_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.unk0 = 0x4B0;
    modeCtrl.unk10 = 0;
    modeCtrl.levelSetFlags &= ~(1<<(31-0x1D));
    lbl_802F1BA8 = 0;
    lbl_801EED2C.unk8 = 0xB56;
    lbl_801EED2C.unk4 = 0;
    ev_run_dest(EVENT_BALL);
    ev_run_dest(EVENT_STAGE);
    ev_run_dest(EVENT_STOBJ);
    ev_run_dest(EVENT_ITEM);
    ev_run_dest(EVENT_OBJ_COLLISION);
    ev_run_dest(EVENT_CAMERA);
    ev_run_dest(EVENT_EFFECT);
    ev_run_dest(EVENT_SOUND);
    ev_run_dest(EVENT_REND_EFC);
    ev_run_dest(EVENT_BACKGROUND);
    func_80076620(2);
    if (lbl_80290170.unk8 != 0)
        func_800732DC(0x100, 0, 30);
    file_preload("bmp/bmp_sel.tpl");
    gameSubmodeRequest = SMD_ADV_TITLE_MAIN;
}

void submode_adv_title_reinit_func(void)
{
    struct Struct80075900 sp8;

    if (gamePauseStatus & 0xA)
        return;

    func_80011D90();
    lbl_802F1BCC = 0x00FFFFFF;
    modeCtrl.unk0 = 0x4B0;
    modeCtrl.levelSetFlags = 0x2000;
    lbl_802F1BA8 = 0;
    func_8002FFEC();
    func_80021DB4(0);
    lbl_80206BC0[0] = 0;
    event_clear();
    g_something_with_iteratively_freeing_memory();
    ev_run_init(16);
    ev_run_init(18);
    camera_set_state(27);
    unload_stage();
    call_something_with_bmp_bmp_com(1);
    func_80076DCC(1);
    if (dipSwitches & DIP_DEBUG)
        func_80076620(2);
    else
    {
        modeCtrl.levelSetFlags |= 4;
        memset(&sp8, 0, sizeof(sp8));
        sp8.unkC = 0x140;
        sp8.unkE = 0x182;
        sp8.unk15 = 2;
        sp8.unk14 = 12;
        sp8.unk16 = 14;
        sp8.unk1C = NULL;
        func_80075900(0, 1, &sp8);
        func_80075C18(0, lbl_802F02E8);
        func_80077734();
    }
    load_stage(ST_150_TUTORIAL);
    func_80021DB4(0);
    g_play_sound(0xA022);
    func_8002CF38(3, 0);
    func_800732DC(0x100, 0, 30);
    gameSubmodeRequest = SMD_ADV_TITLE_MAIN;
}

void submode_adv_title_main_func(void)
{
    int i;

    if ((dipSwitches & DIP_DEBUG)
     && (controllerInfo[0].unk0[0].button & (1<<(31-0x15)))
     && (controllerInfo[0].unk0[2].button & (1<<(31-0x14)))
     && modeCtrl.unk0 > 30)
        modeCtrl.unk0 = 30;

    if (gamePauseStatus & 0xA)
        return;

    if (lbl_80292B60.unk0 < 20 && !(dipSwitches & DIP_DEBUG) && !(modeCtrl.levelSetFlags & (1<<(31-0x1D))))
    {
        if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[1].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[2].unk0[2].button & PAD_BUTTON_START)
         || (controllerInfo[3].unk0[2].button & PAD_BUTTON_START))
        {
            struct Struct80075900 sp8;

            func_8002B5C8(0x162);
            modeCtrl.levelSetFlags |= 4;
            memset(&sp8, 0, sizeof(sp8));
            sp8.unkC = 0x140;
            sp8.unkE = 0x182;
            sp8.unk15 = 2;
            sp8.unk14 = 12;
            sp8.unk16 = 14;
            sp8.unk1C = NULL;
            func_80075900(0, 1, &sp8);
            func_80075C18(0, lbl_802F02E8);
            func_80077734();
        }
    }
    if (modeCtrl.levelSetFlags & (1<<(31-0x1D)))
    {
        for (i = 0; i < 4; i++)
        {
            if (modeCtrl.unk10 != 0 && CONTROLLER_SOMETHING(i, (1<<(31-0x1C))))
            {
                modeCtrl.unk10 = 0;
                func_8002B5C8(0x6F);
                if (modeCtrl.unk0 > 30 && modeCtrl.unk0 < 300)
                    modeCtrl.unk0 = 300;
            }
            else if (modeCtrl.unk10 != 1 && CONTROLLER_SOMETHING(i, (1<<(31-0x1D))))
            {
                modeCtrl.unk10 = 1;
                func_8002B5C8(0x6F);
                if (modeCtrl.unk0 > 30 && modeCtrl.unk0 < 300)
                    modeCtrl.unk0 = 300;
            }
        }
    }
    if (modeCtrl.unk0 == 30)
    {
        func_800732DC(0x101, 0, 30);
        func_80075900(0, 20, NULL);
        func_8002CF38(modeCtrl.unk0, 2);
    }
    if (--modeCtrl.unk0 <= 0)
    {
        lbl_802F1B78 = 0;
        gameSubmodeRequest = SMD_ADV_INFO_INIT;
    }
}

// + 0x44
struct Struct801EED3C lbl_801EED3C;  FORCE_BSS_ORDER(lbl_801EED3C)

void submode_adv_info_init_func(void)
{
    if (gamePauseStatus & 0xA)
        return;

    func_80011D90();
    modeCtrl.unk0 = 0x111C;
    modeCtrl.levelSetFlags &= -8197;
    modeCtrl.playerCount = 1;
    lbl_80206BC0[0] = 0;
    func_8002FFEC();
    event_clear();
    load_stage(ST_150_TUTORIAL);
    ev_run_init(EVENT_STAGE);
    ev_run_init(EVENT_WORLD);
    ev_run_init(EVENT_BALL);
    ev_run_init(EVENT_STOBJ);
    ev_run_init(EVENT_INFO);
    ev_run_init(EVENT_ITEM);
    ev_run_init(EVENT_OBJ_COLLISION);
    ev_run_init(EVENT_MINIMAP);
    ev_run_init(EVENT_CAMERA);
    ev_run_init(EVENT_SPRITE);
    ev_run_init(EVENT_SOUND);
    ev_run_init(EVENT_EFFECT);
    ev_run_init(EVENT_BACKGROUND);
    func_80021DB4(currStageId);
    ballInfo[0].state = 16;
    ballInfo[0].bananas = 0;
    camera_set_state(43);
    call_something_with_bmp_bmp_com(5);
    func_80076620(0);
    func_80076C54(0);
    if (!(modeCtrl.levelSetFlags & (1<<(31-0x12))))
    {
        struct Struct80075900 sp8;

        memset(&sp8, 0, sizeof(sp8));
        sp8.unkC = 0x140;
        sp8.unkE = 0xD2;
        sp8.unk15 = 1;
        sp8.unk14 = 1;
        sp8.unk16 = 11;
        sp8.unk1C = NULL;
        func_80075900(1, 2, &sp8);
        sp8.unkC = 0x140;
        sp8.unkE = 60;
        sp8.unk15 = 1;
        sp8.unk14 = 0;
        sp8.unk16 = 14;
        sp8.unk1C = NULL;
        func_80075900(2, 1, &sp8);
        func_80075C18(2, "c/0xff5000/    Control description!    ");
    }
    func_800846B0(4);
    func_800846B0(3);
    func_800732DC(0x100, 0, 30);
    lbl_801EED3C.unk0 = 0;
    lbl_801EED3C.unk4 = 0;
    lbl_801EED3C.unkC = lbl_802F2A80;
    func_8002CF38(0xFFF60014, 0);
    gameSubmodeRequest = 14;
}
