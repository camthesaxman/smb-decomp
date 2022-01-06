#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "gxutil.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "stage.h"

#include "../data/common.gma.h"

struct Struct801EEC80 lbl_801EEC80;
struct Struct801EEC90 lbl_801EEC90;

FORCE_BSS_ORDER(lbl_801EEC80)
FORCE_BSS_ORDER(lbl_801EEC90)

void polydisp_init(void)
{
    func_8009AAB0();
}

static inline void show_loading_msg(void)
{
    const char throbber[] = {'-', '\\', '|', '/'};
    int chr;
    int asterisks;

    g_debug_set_cursor_pos(14, 15);
    chr = throbber[(unpausedFrameCounter/2) % 4];
    g_debug_printf("%c", chr);
    g_debug_print("NOW LOADING");
    g_debug_printf("%c", chr);
    g_debug_set_cursor_pos(15, 16);
    g_debug_print("LEFT: ");
    asterisks = get_load_queue_count();
    while (asterisks > 0)
    {
        g_debug_print("*");
        asterisks--;
    }
}

void polydisp_main(void)
{
    if (gameMode == MD_SEL
     && (gameSubmode == SMD_SEL_STAGE_INIT || gameSubmode == SMD_SEL_STAGE_MAIN)
     && is_load_queue_not_empty() != 0)
        show_loading_msg();

    lbl_801EEC90.unk0 &= ~0x11;
    if (func_8009D5D8() != 0)
        lbl_801EEC90.unk0 |= 0x10;

    func_80021ECC();
    func_8009AB5C();

    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
        func_8000E134();

    func_8000DEE8();
    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
    {
        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(1);
        draw_3d_scene();
        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(2);
    }
    else
        func_800A5CA0();
    func_8000E180();
    if (eventInfo[EVENT_NAME_ENTRY].state == EV_STATE_RUNNING)
        func_800AE408();
    if (modeCtrl.unk30 <= 1
     && eventInfo[EVENT_VIEW].state == EV_STATE_INACTIVE
     && eventInfo[EVENT_MINIMAP].state == EV_STATE_RUNNING)
        minimap_draw();
    if (lbl_802F2000 & 4)
        draw_timer_bomb_fuse();
}

void draw_3d_scene(void)
{
    func_80085620();
    func_800226F4();
    switch (gameMode)
    {
    default:
        func_8000D220();
        break;
    case MD_ADV:
        func_8000B8AC();
        break;
    case MD_SEL:
        draw_monkey();
        func_8000D220();
        func_800125A4();
        break;
    case MD_GAME:
        switch (gameSubmode)
        {
        default:
        case SMD_GAME_NAMEENTRY_INIT:
        case SMD_GAME_NAMEENTRY_MAIN:
        case SMD_GAME_RESTART_INIT:
        case SMD_GAME_NAMEENTRY_READY_MAIN:
        case SMD_GAME_BONUS_CLEAR_INIT:
        case SMD_GAME_BONUS_CLEAR_MAIN:
        case SMD_GAME_OVER_SAVE:
        case SMD_GAME_OVER_DEST:
            draw_normal_game_scene();
            break;
        case SMD_GAME_RESULT_INIT:
        case SMD_GAME_RESULT_MAIN:
        case SMD_GAME_RESULT_MENU:
            func_8000D018();
            break;
        case SMD_GAME_ENDING_INIT:
        case SMD_GAME_ENDING_MAIN:
            func_800B64B0();
            func_8000D220();
            break;
        case SMD_GAME_ROLL_INIT:
        case SMD_GAME_ROLL_MAIN:
            func_80093E28();
            break;
        case SMD_GAME_CONTINUE_INIT:
        case SMD_GAME_CONTINUE_MAIN:
            func_8000CA9C();
            func_8000D220();
            break;
        case SMD_GAME_EXTRA_INIT:
        case SMD_GAME_EXTRA_WAIT:
            func_8000CF94();
            func_8000D220();
            break;
        case SMD_GAME_OVER_INIT:
        case SMD_GAME_OVER_MAIN:
        case SMD_GAME_NAMEENTRY_READY_INIT:
            switch (modeCtrl.unk28)
            {
            case 1:
                draw_normal_game_scene();
                break;
            default:
                if (modeCtrl.unk8 & (1 << 5))
                    draw_normal_game_scene();
                break;
            }
            break;
        case SMD_GAME_INTR_SEL_INIT:
        case SMD_GAME_INTR_SEL_MAIN:
        case SMD_GAME_OVER_POINT_INIT:
        case SMD_GAME_OVER_POINT_MAIN:
            break;
        }
        break;
    case MD_TEST:
        draw_monkey();
        if (lbl_802F1B70 != NULL)
            lbl_802F1B70();
        func_8000D220();
        break;
    case MD_MINI:
        switch (gameSubmode)
        {
        case SMD_MINI_TEST0_INIT:
        case SMD_MINI_TEST0_MAIN:
            func_80093E28();
            break;
        case SMD_MINI_COMMEND_INIT:
        case SMD_MINI_COMMEND_MAIN:
            func_8009BEF8();
            break;
        case SMD_MINI_ENDING_MAIN:
            func_80094028();
            break;
        default:
            func_80093B54();
            break;
        case SMD_MINI_SELECT_INIT:
        case SMD_MINI_SELECT_MAIN:
            break;
        }
        func_8000D220();
        break;
    case MD_OPTION:
        if (lbl_802F1B70 != NULL)
            lbl_802F1B70();
        func_8000D220();
        break;
    }
    func_800188D4();
    func_800858CC();
}

void func_8000B8AC(void)
{
    switch (lbl_802F1BC8)
    {
    case 4:
        func_8000B918();
        func_8000D220();
        break;
    case 2:
        func_8000B96C();
        break;
    case 14:
        draw_normal_game_scene();
        func_8000BCA4();
        break;
    case 11:
    case 12:
    case 15:
    case 16:
    case 17:
    case 18:
        draw_normal_game_scene();
        func_800858CC();
        func_8000C388();
        break;
    }
}

struct Struct80173FA8
{
    u32 unk0;
    s16 unk4;
    s16 unk6;
    Vec unk8;
} lbl_80173FA8[] =
{
    { 56, -25344, 22272, { 0.7, -0.3, 0.2 } },
    { 57,   8832, 20736, { 0.6, -0.2, 0.2 } },
};

float lbl_80173FD0[] = { 0.4, 0.25, 0.25, 0.5 };

void func_8000B918(void)
{
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&lbl_801EED04.unk0);
    mathutil_mtxA_rotate_x(lbl_801EED04.unkC);
    mathutil_mtxA_rotate_z(lbl_801EED04.unkE);
    func_80033AD4(NAOMIOBJ_MODEL(naomiCommonObj, 0x2C));
}

void func_8000B96C(void)
{
    func_80092D3C();
    func_80054FF0();
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(4);
    if (!(lbl_801EED2C.unk4 & (1 << (31-0x1B)))
     && !(lbl_801EED2C.unk4 & (1 << (31-0x1D))))
    {
        int i;
        for (i = 0; i < 3; i++)
        {
            float f30;
            if (ballInfo[i].unkFC->unk14 & (1 << (31-0x1A)))
                continue;
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate_xyz(
                ballInfo[i].unkFC->unk30.x,
                ballInfo[i].unkFC->unk30.y - 0.45,
                ballInfo[i].unkFC->unk30.z);
            f30 = lbl_80173FD0[ballInfo[i].unkFC->unk10];
            mathutil_mtxA_scale_s(f30);
            mathutil_mtxA_rotate_x(0x4000);
            g_avdisp_set_some_color_1(0.38f, 0.39f, 0.4f, 1.0f);
            g_avdisp_set_model_scale(f30);
            g_avdisp_maybe_draw_model_3(commonGma->modelEntries[polyshadow01].modelOffset);
        }
        func_8000E3BC();
    }
    if (lbl_801EED2C.unk4 & 1)
    {
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate_xyz(
            ballInfo[0].unkFC->unk30.x,
            ballInfo[0].unkFC->unk30.y - 0.25,
            ballInfo[0].unkFC->unk30.z);
        if (lbl_801EED2C.unk8 >= 0x440 && lbl_801EED2C.unk8 < 0x51A)
            mathutil_mtxA_translate_xyz(-0.24f, 0.0f, 0.0f);
        func_80033AD4(NAOMIOBJ_MODEL(naomiCommonObj, 0x36));
    }
    if (lbl_801EED2C.unk4 & (1 << (31-0x15)))
    {
        struct Struct80173FA8 *r27 = lbl_80173FA8;
        int i;
        for (i = 0; i < 2; i++, r27++)
        {
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate(&ballInfo[0].unkFC->unk30);
            mathutil_mtxA_translate(&r27->unk8);
            mathutil_mtxA_rotate_y(r27->unk6);
            mathutil_mtxA_rotate_x(r27->unk4);
            func_80033AD4(NAOMIOBJ_MODEL(naomiCommonObj, r27->unk0));
        }
    }
    if (!(lbl_801EED2C.unk4 & (1 << (31-0x1B))))
    {
        if (lbl_801EED2C.unk4 & (1 << (31-0x1E)))
            stage_draw();
        if (lbl_801EED2C.unk4 & (1 << (31-0x14)))
            func_80094A34();

        func_80085678(400.0f);
        background_draw();
        func_80085678(0.0f);

        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(16);

        if ((lbl_801EED2C.unk4 & (1 << (31-0x1A)))
         && !(lbl_801EED2C.unk4 & (1 << (31-0x13)))
         && eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
            item_draw();

        if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING
         || (lbl_801EED2C.unk4 & (1 << (31-0x1C))))
            stobj_draw();

        if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
            effect_draw();

        if (lbl_801EED2C.unk4 & (1 << (31-0x1D)))
            func_80038840();
    }
    draw_monkey();
    if (backgroundInfo.bgId == BG_TYPE_JUN || backgroundInfo.bgId == BG_TYPE_SPA)
        g_something_with_lens_flare_1(0);
    func_8000D220();
    func_800858CC();
    if (backgroundInfo.bgId == BG_TYPE_JUN || backgroundInfo.bgId == BG_TYPE_SPA)
        g_something_with_lens_flare_2(0);
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(8);
    func_80017FCC();
}

void func_8000BCA4(void)
{
    Vec sp48;
    u8 filler[16];
    int i;
    int r30;
    int r0;
    float f31;
    float f2;
    float f3;
    Mtx sp8;

    C_MTXPerspective(sp8, 1.0f, 1.33333333f, 0.1f, 100000.0f);
    GXSetProjection(sp8, 0);
    mathutil_mtxA_from_identity();
    func_80022274(2);
    sp48.x = -0.0055f;
    sp48.y = -0.003f;
    sp48.z = -0.718f;
    if (!(gamePauseStatus & 0xA))
    {
        if (lbl_801EED3C.unk8 > 0)
            lbl_801EED3C.unkC += 0.05 * -lbl_801EED3C.unkC;
        else
            lbl_801EED3C.unkC += 0.05 * (1.0 - lbl_801EED3C.unkC);
    }
    f31 = 0.0005f;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&sp48);
    mathutil_mtxA_rotate_x(3328.0 + 32768.0 * (1.0 - lbl_801EED3C.unkC));
    mathutil_mtxA_scale_xyz(f31, f31, f31);
    func_80030BA8(f31);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    g_avdisp_draw_model_1(commonGma->modelEntries[lever_analogue_base].modelOffset);
    mathutil_mtxA_translate_xyz(0.0f, -2.7f, 0.0f);
    mathutil_mtxA_push();
    mathutil_mtxA_rotate_x(CLAMP(lbl_801EED3C.unk0 * 12, -0x1000, 0x1000));
    mathutil_mtxA_rotate_z(CLAMP(lbl_801EED3C.unk4 * 8, -0x1000, 0x1000));
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    func_8008E564(lbl_801EED3C.unkC);
    g_avdisp_draw_model_1(commonGma->modelEntries[lever_analogue].modelOffset);
    mathutil_mtxA_pop();
    f2 = 0.0f;
    f3 = 0.0f;
    for (i = 0; i < 4; i++)
    {
        if (controllerInfo[i].unk0[0].err == 0)
        {
            f2 = (float)controllerInfo[i].unk0[0].stickX / 60.0;
            f3 = -(float)controllerInfo[i].unk0[0].stickY / 60.0;
            break;
        }
    }
    if (f2 < -1.0)
        f2 = -1.0f;
    else if (f2 > 1.0)
        f2 = 1.0f;
    if (f3 < -1.0)
        f3 = -1.0f;
    else if (f3 > 1.0)
        f3 = 1.0f;
    r0 = (4187.0f * f3);
    r30 = (4187.0f * -f2);
    mathutil_mtxA_rotate_x(CLAMP(r0 * 2, -0x1000, 0x1000));
    mathutil_mtxA_rotate_z(CLAMP(r30 * 2, -0x1000, 0x1000));
    mathutil_mtxA_scale_s(0.99f);
    func_80030BA8(0.99f);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    func_8008E564(lbl_801EED3C.unkC * 0.5);
    g_avdisp_draw_model_1(commonGma->modelEntries[lever_analogue].modelOffset);
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&sp48);
    mathutil_mtxA_rotate_x(3328.0f + (-32768.0f * lbl_801EED3C.unkC));
    mathutil_mtxA_translate_xyz(0.0f, 0.00058f, 0.0f);
    mathutil_mtxA_scale_xyz(f31, f31, f31);
    func_80030BA8(f31);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    g_avdisp_draw_model_1(commonGma->modelEntries[button_base].modelOffset);
    if (lbl_801EED3C.unk8 == 2)
    {
        mathutil_mtxA_scale_xyz(1.0f, 0.25f, 1.0f);
        func_80030BA8(1.0f);
    }
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    func_8008E564(1.0 - lbl_801EED3C.unkC);
    g_avdisp_draw_model_1(commonGma->modelEntries[button].modelOffset);
    func_800858CC();
}

const GXColor lbl_802F2978 = {0, 0, 0, 0};

struct Struct8000C144
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
};

void func_8000C144(struct Struct8000C144 *a)
{
    float x1 = a->unk0;
    float y1 = a->unk4;
    float x2 = a->unk8;
    float y2 = a->unkC;
    float z = a->unk10;
    u8 filler[8];

    gxutil_set_vtx_attrs((1<< GX_VA_POS));
    func_8009E110(1, 0, 1, 0);
    if (zMode->updateEnable  != GX_ENABLE
     || zMode->compareFunc   != 7
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, 7, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = 7;
        zMode->updateEnable  = GX_ENABLE;
    }

    func_8009E398(0, lbl_802F2978, 0.0f, 100.0f, 0.1f, 20000.0f);
    func_8009E094(0);
    GXSetTevDirect(0);
    func_8009EFF4(0, 0xFF, 0xFF, 0xFF);
    func_8009F224(0, 0);
    func_8009E618(0, 15, 15, 15, 15);
    func_8009E800(0, 0, 0, 0, 1, 0);
    func_8009E70C(0, 7, 7, 7, 6);
    func_8009E918(0, 0, 0, 3, 1, 0);
    func_8009F2C8(1);
    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    mathutil_mtxA_pop();

    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3f32(x2, y1, z);
        GXPosition3f32(x1, y1, z);
        GXPosition3f32(x1, y2, z);
        GXPosition3f32(x2, y2, z);
    GXEnd();

    if (zMode->updateEnable  != GX_ENABLE
     || zMode->compareFunc   != 3
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, 3, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = 3;
        zMode->updateEnable  = GX_ENABLE;
    }
}

void func_8000C388(void)
{
    struct Struct8000C144 sp14;
    Vec sp8;
    float f3;

    f3 = -(10000.0f * currentCameraStructPtr->sub28.unk38);
    sp14.unk0 = f3 * currentCameraStructPtr->sub28.aspect;
    sp14.unk4 = 0.0f;
    sp14.unk8 = 0.0f;
    sp14.unkC = f3;
    sp14.unk10 = -10000.0f;
    func_8000C144(&sp14);
    if (lbl_801EED3C.unk8 == 0)
    {
        s16 r30;
        s16 v3;
        sp8.x = 0.0f;
        sp8.y = 1.0f;
        sp8.z = 0.0f;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(-currentCameraStructPtr->rotY);
        mathutil_mtxA_rotate_z(-lbl_80206BF0[0].unk2);
        mathutil_mtxA_rotate_x(-lbl_80206BF0[0].unk0);
        mathutil_mtxA_tf_vec(&sp8, &sp8);
        r30 = -mathutil_atan2(sp8.z, sp8.y);
        v3 = mathutil_atan2(sp8.x, mathutil_sqrt(mathutil_sum_of_sq(sp8.z, sp8.y)));
        r30 *= 0.2;
        v3 *= 0.2;
        lbl_801EED3C.unk0 = lbl_801EED3C.unk0 + 0.2 * ((float)r30 - (float)lbl_801EED3C.unk0);
        lbl_801EED3C.unk4 = lbl_801EED3C.unk4 + 0.2 * ((float)v3 - (float)lbl_801EED3C.unk4);
        func_8000BCA4();
    }
}

void draw_normal_game_scene(void)
{
    int i;
    struct Ball *oldBall = currentBallStructPtr;
    for (i = 0; i < 4; i++)
    {
        if (cameraInfo[i].sub28.width > 0.0f && cameraInfo[i].sub28.height > 0.0f)
        {
            if (spritePoolInfo.unkC[i] == 0
             || spritePoolInfo.unkC[i] == 4
             || (cameraInfo[i].flags & (1 << (31-0x19))))
            {
                if (!(cameraInfo[i].flags & (1 << (31-0x18))))
                    continue;
            }
            currentBallStructPtr = &ballInfo[i];
            func_80018648(i);
            func_80092D3C();
            func_80054FF0();
            func_800225C0(i);
            if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
                func_80095398(4);
            draw_monkey();
            if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING
             || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
                stage_draw();  // draws stage
            func_80094A34();
            if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
            {
                func_80085678(400.0f);
                background_draw();
                func_80085678(0.0f);
            }
            if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING
             || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
                func_80047D70();
            if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
                func_80095398(16);
            if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
                item_draw();  // draws bananas, but not the ones being picked up
            if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
                stobj_draw();
            if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
                effect_draw();  // draws sparks and stars
            if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
                func_80038840();
            if (backgroundInfo.unk8 & 1)
                g_something_with_lens_flare_1(i);
            func_8000D220();
            func_800858CC();
            if (backgroundInfo.unk8 & 1)
                g_something_with_lens_flare_2(i);
            if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
                func_80095398(8);
        }
    }
    func_8000C7A4();
    currentBallStructPtr = oldBall;
    func_80017FCC();
}

void func_8000C7A4(void)
{
    int i;

    lbl_801EEC90.unk0 |= (1 << 3);
    for (i = 0; i < 4; i++)
    {
        if (cameraInfo[i].sub28.width > 0.0f && cameraInfo[i].sub28.height > 0.0f
         && (cameraInfo[i].flags & (1 << (31-0x19))))
        {
            currentBallStructPtr = &ballInfo[i];
            func_80018648(i);
            func_800225C0(i);
            if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING
             || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
                stage_draw();
            if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
            {
                func_80085678(400.0f);
                background_draw();
                func_80085678(0.0f);
            }
            if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
                item_draw();
            if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
                stobj_draw();
            if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
                func_80038840();
            func_8000C8D4();
            func_8000D220();
            func_800858CC();
        }
    }
    lbl_801EEC90.unk0 &= ~(1 << 3);
}

u16 lbl_802F02E0[4] = { ARROW_1P, ARROW_2P, ARROW_3P, ARROW_4P };

#ifdef NONMATCHING
static inline void mathutil_get_mtxA_translate_xyz(register float *px, register float *py, register float *pz)
{
#ifdef __MWERKS__
    register float *mtxA;
    //register float *_x = &v->x;
    //register float *_y = &v->y;
    //register float *_z = &v->z;
    register float x, y, z;

    asm
    {
        lis mtxA, LC_CACHE_BASE@ha
        lfs x, 0x0C(mtxA)  // mtxA[0][3]
        lfs y, 0x1C(mtxA)  // mtxA[1][3]
        lfs z, 0x2C(mtxA)  // mtxA[2][3]
        stfs x, 0(px)
        stfs y, 0(py)
        stfs z, 0(pz)
    }

    //*px = x;
    //*py = y;
    //*pz = z;

#else
    *px = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][3];
    *py = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][3];
    *pz = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][3];
#endif
}

void func_8000C8D4(void)
{
    int i;  // r24
    struct Ball *ball;  // r26
    s8 *r25 = spritePoolInfo.unkC;
    Vec sp8;
    float f27;
    ball = ballInfo;
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r25++)
    {
        if (*r25 == 0 || *r25 == 4)
            continue;
        if ((ball->flags & (1 << (31-0x1B))))
            continue;
        mathutil_mtxA_from_identity();
        f27 = 0.8 - 0.1 * (((unpausedFrameCounter / 16) + i) % 3);
        mathutil_mtxA_scale_s(f27);
        mathutil_mtxA_mult_right(mathutilData->mtxB);
        mathutil_mtxA_translate(&ball->pos);
        mathutil_mtxA_rotate_y(cameraInfo[i].rotY - 0x8000);
        mathutil_mtxA_rotate_x(-0x4000);
        mathutil_mtxA_translate_xyz(0.0f, ball->currRadius, 0.0f);
        mathutil_get_mtxA_translate_xyz(&sp8.x, &sp8.y, &sp8.z);
        if (sp8.z < -4.0 * f27)
            mathutil_mtxA_scale_s(sp8.z / (-4.0 * f27));
        g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
        g_avdisp_draw_model_1(commonGma->modelEntries[lbl_802F02E0[i]].modelOffset);
    }
}
#else
const double lbl_802F2998 = 0.8;
const double lbl_802F29A0 = 0.1;
const double lbl_802F29A8 = -4.0;
asm void func_8000C8D4(void)
{
    nofralloc
#include "../asm/nonmatchings/func_8000C8D4.s"
}
#pragma peephole on
#endif

void func_8000CA9C(void)
{
    Func802F20EC r31;
    Func802F20EC r30;
    int r4;
    u32 r5;
    Vec sp5C;
    Mtx sp2C;

    lbl_801EEC90.unk0 |= 1;
    func_80018648(modeCtrl.unk2C);
    func_80092D3C();
    func_80054FF0();
    func_800225C0(modeCtrl.unk2C);
    draw_monkey();

    if (lbl_802F1F34 != 0)
    {
        r31 = (void *)backgroundInfo.unk8C;
        if (r31 != NULL)
            r30 = g_avdisp_set_some_func_1(r31);
        mathutil_mtxA_from_mtxB();
        g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
        g_avdisp_draw_model_1((void *)lbl_802F1F34);
        if (r31 != NULL)
            g_avdisp_set_some_func_1(r30);
    }
    else
    {
        mathutil_mtxA_from_mtxB();
        func_80033AD4(NAOMIOBJ_MODEL(naomiCommonObj, 2));
    }

    if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
        func_80038840();
    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
        background_draw();
    if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
        effect_draw();
    func_800858CC();
    r4 = modeCtrl.unk0;
    if (r4 > 60)
        r4 = 60;

    r5 = FALSE;
    if ((gameSubmode == SMD_GAME_CONTINUE_INIT || gameSubmode == SMD_GAME_CONTINUE_MAIN)
     && (modeCtrl.unk8 & (1<<(31-0x1D)))
     && modeCtrl.unk10 == 1)
        r5 = TRUE;

    if (!r5)
    {
        float f1;
        float f26, f27;

        if (gameSubmode != SMD_GAME_CONTINUE_INIT && gameSubmode != SMD_GAME_CONTINUE_MAIN)
            f1 = 0.0f;
        else if ((modeCtrl.unk8 & (1<<(31-0x1D))) && modeCtrl.unk10 == 0)
            f1 = r4 / 60.0f;
        else
            f1 = 1.0f;

        func_80030BB8(f1, f1, f1);
        mathutil_mtxA_from_mtxB();
        sp5C.x = currentBallStructPtr->pos.x;
        sp5C.y = currentBallStructPtr->pos.y - currentBallStructPtr->currRadius + 0.01;
        sp5C.z = currentBallStructPtr->pos.z;
        mathutil_mtxA_translate(&sp5C);
        f26 = 0.9f;
        f27 = 4.6f;
        mathutil_mtxA_scale_xyz(f26, f27, f26);
        func_80030BA8(MAX(f26, f27));
        g_dupe_of_call_draw_naomi_model_1(NAOMIOBJ_MODEL(naomiCommonObj, 0x3A));
        func_80030BB8(1.0f, 1.0f, 1.0f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate_xyz(0.0f, f27, 0.0f);
        mathutil_mtxA_rotate_x(-16384);
        mathutil_mtxA_scale_xyz(0.25f, 0.25f, 0.25f);
        func_80030BA8(0.25f);
        g_dupe_of_call_draw_naomi_model_1(NAOMIOBJ_MODEL(naomiCommonObj, 0x3B));
    }
    else
    {
        Vec sp20;
        Vec sp14;
        Vec sp8;
        s16 r30;
        int i;
        float f28 = r4 / 60.0f;

        f28 = (f28 - 0.5) * 2.0;
        f28 = CLAMP(f28, 0.0, 1.0);
        f28 *= f28;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_to_mtx(sp2C);
        sp2C[0][0] = 0.9f;
        sp2C[2][2] = 0.9f;
        sp2C[1][1] = 4.6f;
        sp2C[1][3] = 0.01f;

        for (i = 0; i < 4; i++)
        {
            float f26, f27;

            r30 = i * 0x4000 + 0x2000;
            f26 = mathutil_sin(r30);
            f27 = mathutil_cos(r30);

            func_80030BB8(1.0f, 1.0f, 1.0f);
            sp20.x = 3.5 * f26;
            sp20.y = 4.6f;
            sp20.z = 3.5 * f27;
            sp14.x = (3.5 * f26) * f28;
            sp14.y = 0.0f;
            sp14.z = (3.5 * f27) * f28;
            sp2C[0][1] = sp20.x - sp14.x;
            sp2C[2][1] = sp20.z - sp14.z;
            sp2C[0][3] = sp14.x;
            sp2C[2][3] = sp14.z;
            mathutil_mtxA_from_mtx(sp2C);
            mathutil_mtxA_mult_left(mathutilData->mtxB);
            func_80030BA8(4.6f);
            g_dupe_of_call_draw_naomi_model_1(NAOMIOBJ_MODEL(naomiCommonObj, 0x3F));
            func_80030BB8(1.0f, 1.0f, 1.0f);
            mathutil_mtxA_from_mtxB_translate(&sp20);
            sp8.x = sp14.x - sp20.x;
            sp8.y = sp14.y - sp20.y;
            sp8.z = sp14.z - sp20.z;
            mathutil_mtxA_rotate_y(mathutil_atan2(sp8.x, sp8.z) - 32768);
            mathutil_mtxA_rotate_x(mathutil_atan2(sp8.y, mathutil_sqrt(mathutil_sum_of_sq(sp8.x, sp8.z))));
            mathutil_mtxA_scale_xyz(0.25f, 0.25f, 0.25f);
            func_80030BA8(0.25f);
            g_dupe_of_call_draw_naomi_model_1(NAOMIOBJ_MODEL(naomiCommonObj, 0x3B));
        }
    }

    func_8000E3BC();
}

void func_8000CF94(void)
{
    func_80018648(modeCtrl.unk2C);
    func_80092D3C();
    func_80054FF0();
    draw_monkey();
    if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
        func_80038840();
    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
        background_draw();
    if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
        effect_draw();
    func_800858CC();
}

void func_8000D018(void)
{
    int i;
    struct Ball *r23 = currentBallStructPtr;

    for (i = 0; i < 4; i++)
    {
        if (cameraInfo[i].sub28.width > 0.0f && cameraInfo[i].sub28.height > 0.0f)
        {
            if ((spritePoolInfo.unkC[i] == 0 || spritePoolInfo.unkC[i] == 4)
             && !(cameraInfo[i].flags & (1<<(31-0x19))))
                continue;

            if (cameraInfo[i].flags & (1<<(31-0x19)))
                lbl_801EEC90.unk0 |= 8;
            currentBallStructPtr = &ballInfo[i];
            func_80018648(i);
            func_80092D3C();
            func_80054FF0();
            func_800225C0(i);
            if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
                func_80095398(4);
            draw_monkey();
            if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING
             || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
                stage_draw();
            func_80094A34();
            if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
            {
                func_80085678(400.0f);
                background_draw();
                func_80085678(0.0f);
            }
            if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
                func_80095398(16);
            if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
                item_draw();
            if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
                stobj_draw();
            if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
                effect_draw();
            if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
                func_80038840();
            if (backgroundInfo.unk8 & 1)
                g_something_with_lens_flare_1(i);
            func_8000D220();
            func_800858CC();
            if (backgroundInfo.unk8 & 1)
                g_something_with_lens_flare_2(i);
            if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
                func_80095398(8);
            if (cameraInfo[i].flags & (1<<(31-0x19)))
                lbl_801EEC90.unk0 &= ~(1<<(31-0x1C));
        }
    }
    currentBallStructPtr = r23;
    func_80017FCC();
}

void func_8000D220(void)
{
    GXColor amb = {0xFF, 0xFF, 0xFF, 0xFF};
    GXColor mat = {0x00, 0x00, 0x00, 0xFF};
    GXColor light4color = {0xFF, 0x00, 0x00, 0xFF};
    GXColor light2color = {0x00, 0xFF, 0x00, 0xFF};
    GXColor light3color = {0x00, 0x00, 0xFF, 0xFF};
    GXLightObj lightObj;
    Vec light2pos;
    Vec light3pos;
    Vec light4pos;
    Vec pos;

    if ((dipSwitches & DIP_TEST_CAM) && !(dipSwitches & DIP_NO_INTR))
    {
        mathutil_mtxA_from_translate(&currentCameraStructPtr->lookAt);
        mathutil_mtxA_rotate_y((globalFrameCounter << 8) * 1.2f);
        mathutil_unk_inline(10.0f, &light2pos);

        mathutil_mtxA_from_translate(&currentCameraStructPtr->lookAt);
        mathutil_mtxA_rotate_x(globalFrameCounter << 8);
        mathutil_unk_inline(-10.0f, &light3pos);

        mathutil_mtxA_from_translate(&currentCameraStructPtr->lookAt);
        mathutil_mtxA_rotate_z((globalFrameCounter << 8) * 0.8f);

        mathutil_mtxA_tf_point_xyz(&light4pos, 0.0f, 10.0f, 0.0f);
        mathutil_mtxA_from_mtx(lbl_802F1B3C[0]);

        // Light 2
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        GXInitLightDistAttn(&lightObj, 150.0f, 0.2f, GX_DA_STEEP);
        mathutil_mtxA_tf_point(&light2pos, &pos);
        GXInitLightPos(&lightObj, pos.x, pos.y, pos.z);
        GXInitLightColor(&lightObj, light2color);
        GXLoadLightObjImm(&lightObj, GX_LIGHT2);

        // Light 3
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        GXInitLightDistAttn(&lightObj, 150.0f, 0.2f, GX_DA_STEEP);
        mathutil_mtxA_tf_point(&light3pos, &pos);
        GXInitLightPos(&lightObj, pos.x, pos.y, pos.z);
        GXInitLightColor(&lightObj, light3color);
        GXLoadLightObjImm(&lightObj, GX_LIGHT3);

        // Light 4
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        GXInitLightDistAttn(&lightObj, 150.0f, 0.2f, GX_DA_STEEP);
        mathutil_mtxA_tf_point(&light4pos, &pos);
        GXInitLightPos(&lightObj, pos.x, pos.y, pos.z);
        GXInitLightColor(&lightObj, light4color);
        GXLoadLightObjImm(&lightObj, GX_LIGHT4);

        GXSetChanMatColor(GX_COLOR0, amb);
        GXSetChanAmbColor(GX_COLOR0, mat);
        GXSetChanCtrl(
            GX_COLOR0A0,  // chan
            GX_ENABLE,  // enable
            GX_SRC_REG,  // amb_src
            GX_SRC_REG,  // mat_src
            GX_LIGHT2 | GX_LIGHT3 | GX_LIGHT4,  // light_mask
            GX_DF_CLAMP,  // diff_fn
            GX_AF_NONE);  // attn_fn
        GXSetNumChans(1);
        func_8009EFF4(0, 0xFF, 0xFF, 4);
        func_8009EA30(0, 4);
        GXSetNumTexGens(0);
        func_8009F2C8(1);

        mathutil_mtxA_from_mtx(lbl_802F1B3C[0]);
        mathutil_mtxA_translate(&currentCameraStructPtr->lookAt);
        mathutil_mtxA_scale_xyz(0.05f, 0.05f, 0.05f);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXDrawSphere(8, 8);
    }
}

void func_8000D5B8(void)
{
    lbl_801EEC90.unk4C = 0;
    lbl_801EEC90.unk54 = 0;
    lbl_801EEC90.unk58 = 0;
    lbl_801EEC90.unk5C = 1.0f;
    lbl_801EEC90.unk60 = 0.0f;
}

#pragma force_active on
const float lbl_802F2A20 = 320.0f;
const float lbl_802F2A24 = 56.0f;
const float lbl_802F2A28 = 240.0f;
const float lbl_802F2A2C = 1.3333332538604736f;
const float lbl_802F2A30 = 0.0098999999463558197f;
const float lbl_802F2A34 = 0.57735025882720947f;
const float lbl_802F2A38 = 2.0f;
const float lbl_802F2A3C = 0.75f;
const double lbl_802F2A40 = 0.001;
const float lbl_802F2A48 = 0.125f;
const double lbl_802F2A50 = 0.0083333333333333332;
const float lbl_802F2A58 = 0.0009399999980814755f;
const float lbl_802F2A5C = 0.0051899999380111694f;
const float lbl_802F2A60 = -0.0099999997764825821f;
const float lbl_802F2A64 = 0.000699999975040555f;
const double lbl_802F2A68 = 100.0;
const float lbl_802F2A70 = 0.14100000262260437f;
const float lbl_802F2A74 = 0.014899999834597111f;
#pragma force_active off

#if 1
#ifdef NONMATCHING
/*
void draw_timer_bomb_fuse(void)
{
    struct Sprite *r3;
    float f31, f30;
    Mtx sp54;
    struct NaomiModel *r4;
    float f4;
    float f3;
    int r8;
    int r7;
    float f1;
    int i;
    int r6;
    struct NaomiMesh *r3_;
    struct NaomiVtxWithNormal *r5;

    if (eventInfo[12].state == 2)
        return;
    if (lbl_801F3A58.unk4 <= 0)
        return;
    //lbl_8000D634
    r3 = g_find_sprite_with_probably_not_font(2);
    if (r3 == NULL)
    {
        f31 = 0.0f;
        f30 = 0.0f;
    }
    else
    {
        f31 = (r3->centerX - 320.0f) / 320.0f;
        f30 = (56.0f - r3->centerY) / 240.0f;
    }
    //lbl_8000D674
    C_MTXPerspective(sp54, 60.0f, 1.3333332538604736f, 0.00989999994635582f, 20000.0f);
    sp54[0][2] -= sp54[0][0] * f31 * 1.3333332538604736f * 0.5773502588272095f;
    sp54[1][2] -= sp54[1][1] * f30 * 0.5773502588272095f;
    GXSetProjection(sp54, 0);

    r4 = naomiCommonObj[0x2B];
    f31 = (float)lbl_801F3A58.unk4 / (float)lbl_801F3A58.unk6;
    memcpy(lbl_802F1B4C, r4, ((u32 **)r4)[-1][0]);  // WTF???
    r3_ = (struct NaomiMesh *)lbl_802F1B4C->meshStart;
    //r8 = lbl_802F1B4C->unk6C;
    r8 = ((struct NaomiDispList *)((struct NaomiMesh *)(((struct NaomiMesh *)lbl_802F1B4C->meshStart)->dispListStart)))->vtxCount;
    f4 = 2.0 * (f31 - 0.5);
    f4 = CLAMP(f4, 0.0, 1.0);
    f3 = f4 * (r8 - 2.0);
    r7 = (float)mathutil_floor_to_int(f3 * 0.5) * 2.0f;
    r5 = (void *)((struct NaomiDispList *)r3_->dispListStart)->vtxData;
    f1 = (r7 - f3) * 0.5;
    r6 = r8 - 1;
    for (i = 0; i < r6; i++)
    {

    }
}
*/
#else
extern u8 lbl_80173FE0[];
extern u8 lbl_801740A8[];
asm void draw_timer_bomb_fuse(void)
{
    nofralloc
#include "../asm/nonmatchings/draw_timer_bomb_fuse.s"
}
#pragma peephole on
#endif
#endif

void func_8000DEE8(void)
{
    BOOL r0 = TRUE;
    GXColor color;

    switch (gameMode)
    {
    case MD_GAME:
        switch (gameSubmode)
        {
        case SMD_GAME_INTR_SEL_INIT:
        case SMD_GAME_INTR_SEL_MAIN:
        case SMD_GAME_OVER_POINT_INIT:
        case SMD_GAME_OVER_POINT_MAIN:
            if ((modeCtrl.unk8 & (3<<(31-0x1A))) == 0)
            {
                color.r = 0;
                color.g = 0;
                color.b = 0;
                color.a = 0;
            }
            else
            {
                color.r = 255;
                color.g = 255;
                color.b = 255;
                color.a = 0;
            }
            r0 = FALSE;
            break;
        default:
            color = backgroundInfo.unkC;
            break;
        }
        break;
    case MD_SEL:
    case MD_MINI:
        color = backgroundInfo.unkC;
        break;
    case MD_ADV:
        switch (gameSubmode)
        {
        case SMD_ADV_LOGO_INIT:
        case SMD_ADV_LOGO_MAIN:
        case SMD_ADV_WARNING_INIT:
        case SMD_ADV_WARNING_MAIN:
        case SMD_ADV_RATING_INIT:
        case SMD_ADV_RATING_MAIN:
        case SMD_ADV_START_INIT:
        case SMD_ADV_START_MAIN:
            color.r = lbl_802F1BCC >> 16;
            color.g = lbl_802F1BCC >> 8;
            color.b = lbl_802F1BCC >> 0;
            color.a = lbl_802F1BCC >> 24;
            break;
        default:
            color = backgroundInfo.unkC;
            lbl_802F1BCC = (color.a << 24) | (color.r << 16) | (color.g << 8) | color.b;
            break;
        }
        break;
    case MD_OPTION:
        switch (gameSubmode)
        {
        case SMD_OPTION_REPLAY_PLAY_INIT:
        case SMD_OPTION_REPLAY_PLAY_MAIN:
            color = backgroundInfo.unkC;
            break;
        default:
            color.r = color.g = color.b = 0;
            color.a = 255;
            break;
        }
        break;
    case MD_TEST:
    default:
        color.r = 64;
        color.g = 64;
        color.b = 64;
        color.a = 0;
        break;
    }

    if (r0 && lbl_802BA200.unkF != 0)
    {
        color.r = lbl_802BA200.r;
        color.g = lbl_802BA200.g;
        color.b = lbl_802BA200.b;
    }
    GXSetCopyClear(color, 0x00FFFFFF);
}

void draw_monkey(void)
{
    func_80085684(0.5f);
    func_8008D158(0x00FFFF7F);
    func_80085684(-0.5f);
}

void func_8000E134(void)
{
    if (eventInfo[3].state == 2)
        func_80038AB4();
    if (eventInfo[5].state == 2)
        func_800685C4();
}

void func_8000E180(void)
{
    shadowerase_main();
    func_80094914();
}

void func_8000E1A4(float a)
{
    switch (gameSubmode)
    {
    case SMD_GAME_CONTINUE_INIT:
    case SMD_GAME_CONTINUE_MAIN:
        func_80030BB8(0.8f, 0.8f, 0.8f);
        g_avdisp_set_some_color_1(0.8f, 0.8f, 0.8f, a);
        break;
    case SMD_GAME_OVER_INIT:
    case SMD_GAME_OVER_MAIN:
    case SMD_GAME_NAMEENTRY_READY_INIT:
        if (!(modeCtrl.unk8 & (1<<(31-0x1A))) && modeCtrl.unk28 != 1)
        {
            func_80030BB8(0.8f, 0.8f, 0.8f);
            g_avdisp_set_some_color_1(0.8f, 0.8f, 0.8f, a);
        }
        else
        {
            func_80030BB8(lbl_801EEC80.unk4, lbl_801EEC80.unk8, lbl_801EEC80.unkC);
            g_avdisp_set_some_color_1(lbl_801EEC80.unk4, lbl_801EEC80.unk8, lbl_801EEC80.unkC, a);
        }
        break;
    default:
        if (modeCtrl.unk8 & (1<<(31-0x1B)))
        {
            func_80030BB8(1.0f, 1.0f, 1.0f);
            g_avdisp_set_some_color_1(1.0f, 1.0f, 1.0f, a);
        }
        else
        {
            func_80030BB8(lbl_801EEC80.unk4, lbl_801EEC80.unk8, lbl_801EEC80.unkC);
            g_avdisp_set_some_color_1(lbl_801EEC80.unk4, lbl_801EEC80.unk8, lbl_801EEC80.unkC, a);
        }
        break;
    }
}

void func_8000E338(int a)
{
    float f3, f4, f5;

    switch (a)
    {
    case 0x52:
        f3 = 1.0f;
        f5 = 0.0f;
        f4 = 0.0f;
        break;
    case 0x47:
        f5 = 0.0f;
        f4 = 1.0f;
        f3 = 0.0f;
        break;
    default:
        f4 = 0.0f;
        f3 = 0.0f;
        f5 = 1.0f;
        break;
    }
    func_80030BB8(lbl_801EEC80.unk4 * f3, lbl_801EEC80.unk8 * f4, lbl_801EEC80.unkC * f5);
}

void func_8000E3BC(void)
{
    func_80030BB8(lbl_801EEC80.unk4, lbl_801EEC80.unk8, lbl_801EEC80.unkC);
    g_avdisp_set_some_color_1(lbl_801EEC80.unk4, lbl_801EEC80.unk8, lbl_801EEC80.unkC, 1.0f);
}

void func_8000E428(float a, float b, float c)
{
    lbl_801EEC80.unk0 = 0.0f;
    lbl_801EEC80.unk4 = a;
    lbl_801EEC80.unk8 = b;
    lbl_801EEC80.unkC = c;
}

float func_8000E444(Vec *pos)
{
    Vec spC;

    mathutil_mtxA_tf_point(pos, &spC);
    spC.x -= lbl_801EEC90.unk1C.x;
    spC.y -= lbl_801EEC90.unk1C.y;
    spC.z -= lbl_801EEC90.unk1C.z;
    return mathutil_vec_dot_prod(&spC, &lbl_801EEC90.unk28);
}

float func_8000E4D0(Vec *pos)
{
    Vec spC;

    spC.x = pos->x - lbl_801EEC90.unk4.x;
    spC.y = pos->y - lbl_801EEC90.unk4.y;
    spC.z = pos->z - lbl_801EEC90.unk4.z;
    return mathutil_vec_dot_prod(&spC, &lbl_801EEC90.unk10);
}

float func_8000E53C(Vec *pos)
{
    Vec spC;

    spC.x = pos->x - lbl_801EEC90.unk34.x;
    spC.y = pos->y - lbl_801EEC90.unk34.y;
    spC.z = pos->z - lbl_801EEC90.unk34.z;
    return mathutil_vec_dot_prod(&spC, &lbl_801EEC90.unk40);
}
