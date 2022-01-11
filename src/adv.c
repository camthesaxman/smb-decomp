#include <math.h>
#include <stddef.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "input.h"
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
        func_80075900(0, 20, 0);
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
    u8 dummy[16];
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
    spritePoolInfo.unkC[0] = 2;
    spritePoolInfo.unkC[1] = 2;
    spritePoolInfo.unkC[2] = 2;
    spritePoolInfo.unkC[3] = 2;
    modeCtrl.playerCount = 1;
    modeCtrl.unk30 = 1;
    modeCtrl.unk28 = 0;
    modeCtrl.unk2C = 0;
    lbl_80206BC0[0] = 0;
    lbl_80206BC0[1] = 1;
    lbl_80206BC0[2] = 2;
    lbl_80206BC0[3] = 3;
    ev_run_init(3);
    lbl_801EED04.unk18 = 1;
    lbl_802F1BB4.unk0 = 0;
    lbl_802F1BBC.unk0 = 0;
    lbl_801EED04.unk1C = 1;
    lbl_802F1BB4.unk2 = 0;
    lbl_802F1BBC.unk2 = 0;
    lbl_801EED04.unk20 = 1;
    lbl_802F1BB4.unk4 = 0;
    lbl_802F1BBC.unk4 = 0;
    lbl_801EED04.unk24 = 1;
    lbl_802F1BB4.unk6 = 0;
    lbl_802F1BBC.unk6 = 0;
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

extern struct Struct8010FAB0 lbl_8010FAB0[];

void func_8000F0CC(void)
{
    float f28;
    struct Struct8010FAB0 *r22;
    Vec sp3C;
    struct
    {
        u8 filler0[0xC];
        u16 unkC;
        u16 unkE;
        u8 filler10[4];
        s8 unk14;
        s8 unk15;
        s8 unk16;
        u8 filler17[0x1C-0x17];
        void (*unk1C)();
        u8 filler20[0x28-0x20];
    } sp14;
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
                memset(&sp14, 0, 0x28);
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
            // i = r21
            for (i = 0; i < 3; i++)
                func_80075900(i + 1, 20, 0);
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
            ev_run_dest(1);
            ev_run_dest(4);
            ev_run_dest(5);
            ev_run_dest(13);
            ev_run_dest(20);
            ev_run_dest(19);
            load_bg_files(r22->unk8);
            ev_run_init(1);
            ev_run_init(4);
            ev_run_init(5);
            ev_run_init(13);
            ev_run_init(20);
            ev_run_init(19);
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
            lbl_801EED04.unk18 = r22->unk8;
            break;
        case 17:
            lbl_801EED04.unk1C = r22->unk8;
            break;
        case 18:
            lbl_801EED04.unk20 = r22->unk8;
            break;
        case 19:
            lbl_801EED04.unk24 = r22->unk8;
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
