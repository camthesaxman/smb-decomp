#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "event.h"
#include "gxutil.h"
#include "info.h"
#include "input.h"
#include "item.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "sprite.h"
#include "stage.h"
#include "world.h"
#include "tevutil.h"

#define SCREEN_ASPECT (640.0f / 480.0f)

#include "../data/common.gma.h"
#include "../data/common.nlobj.h"

struct Struct801EEC80 lbl_801EEC80;
struct Struct801EEC90 lbl_801EEC90;

FORCE_BSS_ORDER(lbl_801EEC80)
FORCE_BSS_ORDER(lbl_801EEC90)

void polydisp_init(void)
{
    g_init_bg_fog_params();
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
     && is_load_queue_not_empty())
        show_loading_msg();

    lbl_801EEC90.unk0 &= ~0x11;
    if (func_8009D5D8() != 0)
        lbl_801EEC90.unk0 |= 0x10;

    func_80021ECC();
    func_8009AB5C();

    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
        func_8000E134();

    set_backdrop_color();
    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
    {
        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(1);
        draw_3d_scene();
        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(2);
    }
    else
        view_draw();
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
    ord_tbl_reset();
    func_800226F4();
    switch (gameMode)
    {
    default:
        draw_test_camera_target();
        break;
    case MD_ADV:
        draw_adv_3d_scene();
        break;
    case MD_SEL:
        draw_monkey();
        draw_test_camera_target();
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
            draw_test_camera_target();
            break;
        case SMD_GAME_ROLL_INIT:
        case SMD_GAME_ROLL_MAIN:
            func_80093E28();
            break;
        case SMD_GAME_CONTINUE_INIT:
        case SMD_GAME_CONTINUE_MAIN:
            func_8000CA9C();
            draw_test_camera_target();
            break;
        case SMD_GAME_EXTRA_INIT:
        case SMD_GAME_EXTRA_WAIT:
            func_8000CF94();
            draw_test_camera_target();
            break;
        case SMD_GAME_OVER_INIT:
        case SMD_GAME_OVER_MAIN:
        case SMD_GAME_NAMEENTRY_READY_INIT:
            switch (modeCtrl.gameType)
            {
            case GAMETYPE_MAIN_COMPETITION:
                draw_normal_game_scene();
                break;
            default:
                if (modeCtrl.levelSetFlags & (1 << 5))
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
        draw_test_camera_target();
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
        draw_test_camera_target();
        break;
    case MD_OPTION:
        if (lbl_802F1B70 != NULL)
            lbl_802F1B70();
        draw_test_camera_target();
        break;
    }
    func_800188D4();
    ord_tbl_draw_nodes();
}

void draw_adv_3d_scene(void)
{
    switch (advSubmode)
    {
    case SMD_ADV_LOGO_MAIN:
        draw_intro_av_logo();
        draw_test_camera_target();
        break;
    case SMD_ADV_DEMO_MAIN:
        draw_adv_demo_scene();
        break;
    case SMD_ADV_INFO_MAIN:
        draw_normal_game_scene();
        g_draw_tutorial_button_and_joystick();
        break;
    case SMD_ADV_RANKING_INIT:
    case SMD_ADV_RANKING_MAIN:
    case SMD_ADV_GAME_READY_INIT:
    case SMD_ADV_GAME_READY_MAIN:
    case SMD_ADV_GAME_PLAY_INIT:
    case SMD_ADV_GAME_PLAY_MAIN:
        draw_normal_game_scene();
        ord_tbl_draw_nodes();
        func_8000C388();
        break;
    }
}

struct Struct80173FA8
{
    u32 modelId;
    s16 xrot;
    s16 yrot;
    Vec pos;
} lbl_80173FA8[] =
{
    { NLMODEL_common_BSKBALL_L_HALF, -25344, 22272, { 0.7, -0.3, 0.2 } },
    { NLMODEL_common_BSKBALL_R_HALF,   8832, 20736, { 0.6, -0.2, 0.2 } },
};

float lbl_80173FD0[] = { 0.4, 0.25, 0.25, 0.5 };

void draw_intro_av_logo(void)
{
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&advLogoInfo.pos);
    mathutil_mtxA_rotate_x(advLogoInfo.xrot);
    mathutil_mtxA_rotate_z(advLogoInfo.zrot);
    g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_av_ball));
}

void draw_adv_demo_scene(void)
{
    g_draw_ball_shadow();
    func_80054FF0();
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(4);
    if (!(advDemoInfo.flags & (1 << 4))
     && !(advDemoInfo.flags & ADV_FLAG_SHOW_BALLS))
    {
        int i;
        for (i = 0; i < 3; i++)
        {
            float f30;
            if (ballInfo[i].ape->unk14 & (1 << 5))
                continue;
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate_xyz(
                ballInfo[i].ape->unk30.x,
                ballInfo[i].ape->unk30.y - 0.45,
                ballInfo[i].ape->unk30.z);
            f30 = lbl_80173FD0[ballInfo[i].ape->unk10];
            mathutil_mtxA_scale_s(f30);
            mathutil_mtxA_rotate_x(0x4000);
            g_avdisp_set_some_color_1(0.38f, 0.39f, 0.4f, 1.0f);
            g_avdisp_set_model_scale(f30);
            g_avdisp_maybe_draw_model_3(commonGma->modelEntries[polyshadow01].modelOffset);
        }
        func_8000E3BC();
    }

    // Draw blimp
    if (advDemoInfo.flags & ADV_FLAG_SHOW_BLIMP)
    {
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate_xyz(
            ballInfo[0].ape->unk30.x,
            ballInfo[0].ape->unk30.y - 0.25,
            ballInfo[0].ape->unk30.z);
        if (advDemoInfo.unk8 >= 0x440 && advDemoInfo.unk8 < 0x51A)
            mathutil_mtxA_translate_xyz(-0.24f, 0.0f, 0.0f);
        g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_AIRSHIP));
    }

    // Draws old arcade ball. Leftover from Monkey Ball?
    if (advDemoInfo.flags & (1 << 10))
    {
        struct Struct80173FA8 *r27 = lbl_80173FA8;
        int i;
        for (i = 0; i < 2; i++, r27++)
        {
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate(&ballInfo[0].ape->unk30);
            mathutil_mtxA_translate(&r27->pos);
            mathutil_mtxA_rotate_y(r27->yrot);
            mathutil_mtxA_rotate_x(r27->xrot);
            g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, r27->modelId));
        }
    }

    if (!(advDemoInfo.flags & (1 << 4)))
    {
        if (advDemoInfo.flags & ADV_FLAG_SHOW_STAGE)
            stage_draw();
        if (advDemoInfo.flags & (1 << 11))
            func_80094A34();

        ord_tbl_set_depth_offset(400.0f);
        background_draw();
        ord_tbl_set_depth_offset(0.0f);

        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(16);

        if ((advDemoInfo.flags & (1 << 5))
         && !(advDemoInfo.flags & (1 << 12))
         && eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
            item_draw();

        if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING
         || (advDemoInfo.flags & (1 << 3)))
            stobj_draw();

        if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
            effect_draw();

        if (advDemoInfo.flags & ADV_FLAG_SHOW_BALLS)
            ball_draw();
    }
    draw_monkey();
    if (backgroundInfo.bgId == BG_TYPE_JUN || backgroundInfo.bgId == BG_TYPE_SPA)
        g_something_with_lens_flare_1(0);
    draw_test_camera_target();
    ord_tbl_draw_nodes();
    if (backgroundInfo.bgId == BG_TYPE_JUN || backgroundInfo.bgId == BG_TYPE_SPA)
        g_something_with_lens_flare_2(0);
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(8);
    func_80017FCC();
}

void g_draw_tutorial_button_and_joystick(void)
{
    Vec sp48;
    u8 filler[16];
    int i;
    float baseScale;  // scale value for the base model
    float stickX;
    float stickY;
    int stickXRot;
    int stickZRot;
    Mtx projMtx;

    C_MTXPerspective(projMtx, 1.0f, 1.33333333f, 0.1f, 100000.0f);
    GXSetProjection(projMtx, 0);
    mathutil_mtxA_from_identity();
    func_80022274(2);
    sp48.x = -0.0055f;
    sp48.y = -0.003f;
    sp48.z = -0.718f;

    if (!(gamePauseStatus & 0xA))
    {
        if (advTutorialInfo.state > 0)
            advTutorialInfo.transitionValue += 0.05 * -advTutorialInfo.transitionValue;
        else
            advTutorialInfo.transitionValue += 0.05 * (1.0 - advTutorialInfo.transitionValue);
    }
    baseScale = 0.0005f;

    // Draw the analog stick base
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&sp48);
    mathutil_mtxA_rotate_x(3328.0 + 32768.0 * (1.0 - advTutorialInfo.transitionValue));
    mathutil_mtxA_scale_xyz(baseScale, baseScale, baseScale);
    g_nl2ngc_set_scale(baseScale);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
    g_avdisp_draw_model_1(commonGma->modelEntries[lever_analogue_base].modelOffset);

    // Draw the simulated analog stick
    mathutil_mtxA_translate_xyz(0.0f, -2.7f, 0.0f);
    mathutil_mtxA_push();
    mathutil_mtxA_rotate_x(CLAMP(advTutorialInfo.stickXRot * 12, -0x1000, 0x1000));
    mathutil_mtxA_rotate_z(CLAMP(advTutorialInfo.stickZRot * 8, -0x1000, 0x1000));
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
    g_avdisp_set_alpha(advTutorialInfo.transitionValue);
    g_avdisp_draw_model_1(commonGma->modelEntries[lever_analogue].modelOffset);
    mathutil_mtxA_pop();

    // Draw the transparent stick based on the player's analog stick position
    stickX = 0.0f;
    stickY = 0.0f;
    for (i = 0; i < 4; i++)
    {
        if (controllerInfo[i].unk0[0].err == 0)
        {
            stickX = (float)controllerInfo[i].unk0[0].stickX / 60.0;
            stickY = -(float)controllerInfo[i].unk0[0].stickY / 60.0;
            break;
        }
    }
    if (stickX < -1.0)
        stickX = -1.0f;
    else if (stickX > 1.0)
        stickX = 1.0f;
    if (stickY < -1.0)
        stickY = -1.0f;
    else if (stickY > 1.0)
        stickY = 1.0f;
    stickXRot = (4187.0f * stickY);
    stickZRot = (4187.0f * -stickX);
    mathutil_mtxA_rotate_x(CLAMP(stickXRot * 2, -0x1000, 0x1000));
    mathutil_mtxA_rotate_z(CLAMP(stickZRot * 2, -0x1000, 0x1000));
    mathutil_mtxA_scale_s(0.99f);
    g_nl2ngc_set_scale(0.99f);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
    g_avdisp_set_alpha(advTutorialInfo.transitionValue * 0.5);
    g_avdisp_draw_model_1(commonGma->modelEntries[lever_analogue].modelOffset);

    // Draw the button base
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&sp48);
    mathutil_mtxA_rotate_x(3328.0f + (-32768.0f * advTutorialInfo.transitionValue));
    mathutil_mtxA_translate_xyz(0.0f, 0.00058f, 0.0f);
    mathutil_mtxA_scale_xyz(baseScale, baseScale, baseScale);
    g_nl2ngc_set_scale(baseScale);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
    g_avdisp_draw_model_1(commonGma->modelEntries[button_base].modelOffset);

    // Draw the A button
    if (advTutorialInfo.state == 2)
    {
        mathutil_mtxA_scale_xyz(1.0f, 0.25f, 1.0f);
        g_nl2ngc_set_scale(1.0f);
    }
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
    g_avdisp_set_alpha(1.0 - advTutorialInfo.transitionValue);
    g_avdisp_draw_model_1(commonGma->modelEntries[button].modelOffset);
    ord_tbl_draw_nodes();
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

    gxutil_set_vtx_attrs((1 << GX_VA_POS));
    GXSetBlendMode_cached(1, 0, 1, 0);
    if (zMode->updateEnable  != GX_ENABLE
     || zMode->compareFunc   != 7
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, 7, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = 7;
        zMode->updateEnable  = GX_ENABLE;
    }

    GXSetFog_cached(0, 0.0f, 100.0f, 0.1f, 20000.0f, lbl_802F2978);
    GXSetCullMode_cached(0);
    GXSetTevDirect(0);
    GXSetTevOrder_cached(0, 0xFF, 0xFF, 0xFF);
    GXSetTevKAlphaSel_cached(0, 0);
    GXSetTevColorIn_cached(0, 15, 15, 15, 15);
    GXSetTevColorOp_cached(0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(0, 7, 7, 7, 6);
    GXSetTevAlphaOp_cached(0, 0, 0, 3, 1, 0);
    GXSetNumTevStages_cached(1);
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
    if (advTutorialInfo.state == 0)
    {
        s16 r30;
        s16 v3;
        sp8.x = 0.0f;
        sp8.y = 1.0f;
        sp8.z = 0.0f;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(-currentCameraStructPtr->rotY);
        mathutil_mtxA_rotate_z(-worldInfo[0].zrot);
        mathutil_mtxA_rotate_x(-worldInfo[0].xrot);
        mathutil_mtxA_tf_vec(&sp8, &sp8);
        r30 = -mathutil_atan2(sp8.z, sp8.y);
        v3 = mathutil_atan2(sp8.x, mathutil_sqrt(mathutil_sum_of_sq(sp8.z, sp8.y)));
        r30 *= 0.2;
        v3 *= 0.2;
        advTutorialInfo.stickXRot = advTutorialInfo.stickXRot + 0.2 * ((float)r30 - (float)advTutorialInfo.stickXRot);
        advTutorialInfo.stickZRot = advTutorialInfo.stickZRot + 0.2 * ((float)v3 - (float)advTutorialInfo.stickZRot);
        g_draw_tutorial_button_and_joystick();
    }
}

void draw_normal_game_scene(void)
{
    int i;
    struct Ball *oldBall = currentBallStructPtr;
    for (i = 0; i < 4; i++)
    {
        if (cameraInfo[i].sub28.vp.width > 0.0f && cameraInfo[i].sub28.vp.height > 0.0f)
        {
            if (spritePoolInfo.unkC[i] == 0
             || spritePoolInfo.unkC[i] == 4
             || (cameraInfo[i].flags & (1 << 6)))
            {
                if (!(cameraInfo[i].flags & (1 << 7)))
                    continue;
            }
            currentBallStructPtr = &ballInfo[i];
            func_80018648(i);
            g_draw_ball_shadow();
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
                ord_tbl_set_depth_offset(400.0f);
                background_draw();
                ord_tbl_set_depth_offset(0.0f);
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
                ball_draw();
            if (backgroundInfo.unk8 & 1)
                g_something_with_lens_flare_1(i);
            draw_test_camera_target();
            ord_tbl_draw_nodes();
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
        if (cameraInfo[i].sub28.vp.width > 0.0f && cameraInfo[i].sub28.vp.height > 0.0f
         && (cameraInfo[i].flags & (1 << 6)))
        {
            currentBallStructPtr = &ballInfo[i];
            func_80018648(i);
            func_800225C0(i);
            if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING
             || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
                stage_draw();
            if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
            {
                ord_tbl_set_depth_offset(400.0f);
                background_draw();
                ord_tbl_set_depth_offset(0.0f);
            }
            if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
                item_draw();
            if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
                stobj_draw();
            if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
                ball_draw();
            func_8000C8D4();
            draw_test_camera_target();
            ord_tbl_draw_nodes();
        }
    }
    lbl_801EEC90.unk0 &= ~(1 << 3);
}

u16 lbl_802F02E0[4] = { ARROW_1P, ARROW_2P, ARROW_3P, ARROW_4P };

void func_8000C8D4(void)
{
    struct Ball *ball;
    s8 *r25 = spritePoolInfo.unkC;
    int i;
    Vec sp8;
    float f27;

    ball = ballInfo;
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r25++)
    {
        if (*r25 == 0 || *r25 == 4)
            continue;
        if ((ball->flags & (1 << 4)))
            continue;
        mathutil_mtxA_from_identity();
        f27 = 0.8 - 0.1 * (((unpausedFrameCounter / 16) + i) % 3);
        mathutil_mtxA_scale_s(f27);
        mathutil_mtxA_mult_right(mathutilData->mtxB);
        mathutil_mtxA_translate(&ball->pos);
        mathutil_mtxA_rotate_y(cameraInfo[i].rotY - 0x8000);
        mathutil_mtxA_rotate_x(-0x4000);
        mathutil_mtxA_translate_xyz(0.0f, ball->currRadius, 0.0f);
        mathutil_get_mtxA_translate_alt(&sp8);
        if (sp8.z < -4.0 * f27)
            mathutil_mtxA_scale_s(sp8.z / (-4.0 * f27));
        g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
        g_avdisp_draw_model_1(commonGma->modelEntries[lbl_802F02E0[i]].modelOffset);
    }
}

void func_8000CA9C(void)
{
    BallEnvFunc r31;
    BallEnvFunc r30;
    int r4;
    u32 r5;
    Vec sp5C;
    Mtx sp2C;

    lbl_801EEC90.unk0 |= 1;
    func_80018648(modeCtrl.unk2C);
    g_draw_ball_shadow();
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
        g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BOX));
    }

    if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
        ball_draw();
    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
        background_draw();
    if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
        effect_draw();
    ord_tbl_draw_nodes();
    r4 = modeCtrl.unk0;
    if (r4 > 60)
        r4 = 60;

    r5 = FALSE;
    if ((gameSubmode == SMD_GAME_CONTINUE_INIT || gameSubmode == SMD_GAME_CONTINUE_MAIN)
     && (modeCtrl.levelSetFlags & (1 << 2))
     && modeCtrl.unk10 == 1)
        r5 = TRUE;

    if (!r5)
    {
        float f1;
        float f26, f27;

        if (gameSubmode != SMD_GAME_CONTINUE_INIT && gameSubmode != SMD_GAME_CONTINUE_MAIN)
            f1 = 0.0f;
        else if ((modeCtrl.levelSetFlags & (1 << 2)) && modeCtrl.unk10 == 0)
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
        g_nl2ngc_set_scale(MAX(f26, f27));
        g_dupe_of_call_draw_naomi_model_1(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_SPOT_LIGHT));
        func_80030BB8(1.0f, 1.0f, 1.0f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate_xyz(0.0f, f27, 0.0f);
        mathutil_mtxA_rotate_x(-16384);
        mathutil_mtxA_scale_xyz(0.25f, 0.25f, 0.25f);
        g_nl2ngc_set_scale(0.25f);
        g_dupe_of_call_draw_naomi_model_1(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_spotl1));
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
            g_nl2ngc_set_scale(4.6f);
            g_dupe_of_call_draw_naomi_model_1(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_SPOT_LIGHT_MULTI));
            func_80030BB8(1.0f, 1.0f, 1.0f);
            mathutil_mtxA_from_mtxB_translate(&sp20);
            sp8.x = sp14.x - sp20.x;
            sp8.y = sp14.y - sp20.y;
            sp8.z = sp14.z - sp20.z;
            mathutil_mtxA_rotate_y(mathutil_atan2(sp8.x, sp8.z) - 32768);
            mathutil_mtxA_rotate_x(mathutil_atan2(sp8.y, mathutil_sqrt(mathutil_sum_of_sq(sp8.x, sp8.z))));
            mathutil_mtxA_scale_xyz(0.25f, 0.25f, 0.25f);
            g_nl2ngc_set_scale(0.25f);
            g_dupe_of_call_draw_naomi_model_1(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_spotl1));
        }
    }

    func_8000E3BC();
}

void func_8000CF94(void)
{
    func_80018648(modeCtrl.unk2C);
    g_draw_ball_shadow();
    func_80054FF0();
    draw_monkey();
    if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
        ball_draw();
    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
        background_draw();
    if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
        effect_draw();
    ord_tbl_draw_nodes();
}

void func_8000D018(void)
{
    int i;
    struct Ball *r23 = currentBallStructPtr;

    for (i = 0; i < 4; i++)
    {
        if (cameraInfo[i].sub28.vp.width > 0.0f && cameraInfo[i].sub28.vp.height > 0.0f)
        {
            if ((spritePoolInfo.unkC[i] == 0 || spritePoolInfo.unkC[i] == 4)
             && !(cameraInfo[i].flags & (1 << 6)))
                continue;

            if (cameraInfo[i].flags & (1 << 6))
                lbl_801EEC90.unk0 |= 8;
            currentBallStructPtr = &ballInfo[i];
            func_80018648(i);
            g_draw_ball_shadow();
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
                ord_tbl_set_depth_offset(400.0f);
                background_draw();
                ord_tbl_set_depth_offset(0.0f);
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
                ball_draw();
            if (backgroundInfo.unk8 & 1)
                g_something_with_lens_flare_1(i);
            draw_test_camera_target();
            ord_tbl_draw_nodes();
            if (backgroundInfo.unk8 & 1)
                g_something_with_lens_flare_2(i);
            if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
                func_80095398(8);
            if (cameraInfo[i].flags & (1 << 6))
                lbl_801EEC90.unk0 &= ~(1 << 3);
        }
    }
    currentBallStructPtr = r23;
    func_80017FCC();
}

void draw_test_camera_target(void)
{
    GXColor amb = {0xFF, 0xFF, 0xFF, 0xFF};
    GXColor mat = {0x00, 0x00, 0x00, 0xFF};
    GXColor red   = {0xFF, 0x00, 0x00, 0xFF};
    GXColor green = {0x00, 0xFF, 0x00, 0xFF};
    GXColor blue  = {0x00, 0x00, 0xFF, 0xFF};
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
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);

        // Light 2
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        GXInitLightDistAttn(&lightObj, 150.0f, 0.2f, GX_DA_STEEP);
        mathutil_mtxA_tf_point(&light2pos, &pos);
        GXInitLightPos(&lightObj, pos.x, pos.y, pos.z);
        GXInitLightColor(&lightObj, green);
        GXLoadLightObjImm(&lightObj, GX_LIGHT2);

        // Light 3
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        GXInitLightDistAttn(&lightObj, 150.0f, 0.2f, GX_DA_STEEP);
        mathutil_mtxA_tf_point(&light3pos, &pos);
        GXInitLightPos(&lightObj, pos.x, pos.y, pos.z);
        GXInitLightColor(&lightObj, blue);
        GXLoadLightObjImm(&lightObj, GX_LIGHT3);

        // Light 4
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        GXInitLightDistAttn(&lightObj, 150.0f, 0.2f, GX_DA_STEEP);
        mathutil_mtxA_tf_point(&light4pos, &pos);
        GXInitLightPos(&lightObj, pos.x, pos.y, pos.z);
        GXInitLightColor(&lightObj, red);
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
        GXSetTevOrder_cached(0, 0xFF, 0xFF, 4);
        func_8009EA30(0, 4);
        GXSetNumTexGens(0);
        GXSetNumTevStages_cached(1);

        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
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

struct AnimKeyframe bombSparkXKeyframes[] =
{
    { 1,   0,  8.7540102,          0,          0 },
    { 1,  72, 1.83571005,  -0.090412,  -0.090412 },
    { 1,  74,    1.66866,   -0.07464,   -0.07464 },
    { 1,  76,      1.536, -0.0599843, -0.0599843 },
    { 1,  84,    1.11173, -0.0567173, -0.0567173 },
    { 1,  89,   0.801074, -0.0672826, -0.0672826 },
    { 1,  92,   0.582271, -0.0860023, -0.0860023 },
    { 1,  93,    0.48935, -0.0852437, -0.0852437 },
    { 1,  95,    0.33974, -0.0706416, -0.0706416 },
    { 1, 100,  0.0010883,          0,          0 },
};

struct AnimKeyframe bombSparkYKeyframes[] =
{
    { 1,   0,   -1.00663,            0,            0 },
    { 1,  49,   -1.00662, -0.000118196, -0.000118196 },
    { 1,  70,  -0.994419,     0.010028,     0.010028 },
    { 1,  72,  -0.957594,    0.0308768,    0.0308768 },
    { 1,  73,  -0.919437,    0.0458789,    0.0458789 },
    { 1,  75,  -0.800302,    0.0691816,    0.0691816 },
    { 1,  83,   -0.16478,     0.079378,     0.079378 },
    { 1,  88,   0.210374,    0.0705764,    0.0705764 },
    { 1,  91,   0.411975,    0.0589553,    0.0589553 },
    { 1,  92,   0.465595,    0.0239604,    0.0239604 },
    { 1,  93,   0.459896,   -0.0309341,   -0.0309341 },
    { 1,  95,   0.340102,    -0.065165,    -0.065165 },
    { 1, 100, -0.0010541,            0,            0 },
};

void draw_timer_bomb_fuse(void)
{
    struct NaomiModel *tempModel;
    struct Sprite *sprite;
    float t;  // portion of clock time remaining (from 0.0 to 1.0)
    float x;
    float y;
    float scale;
    Vec sp94;
    u8 filler84[0x10];
    Mtx mtx;
    Vec sp48;
    Vec sp3C;
    Vec sp30;
    Vec sp24;
    Point3d sparkPos;
    float f4;
    float f3;
    struct NaomiVtxWithNormal *vtx;
    int i;
    int r7;
    int faceCount;
    float f1;
    struct NaomiMesh *mesh;

    if (eventInfo[EVENT_VIEW].state == EV_STATE_RUNNING || infoWork.timerCurr <= 0)
        return;

    sprite = find_sprite_with_tag(2);
    if (sprite == NULL)
    {
        x = 0.0f;
        y = 0.0f;
    }
    else
    {
        x = (sprite->centerX - 320.0f) / 320.0f;
        y = (56.0f - sprite->centerY) / 240.0f;
    }

    C_MTXPerspective(mtx, 60.0f, 1.3333332538604736f, 0.00989999994635582f, 20000.0f);
    mtx[0][2] -= mtx[0][0] * x * 1.3333332538604736f * 0.5773502588272095f;
    mtx[1][2] -= mtx[1][1] * y * 0.5773502588272095f;
    GXSetProjection(mtx, 0);

    /* NOTE: Most of the code here deals with manipulating vertices for the
     * arcade fuse model, which is never drawn in-game.
     */

    tempModel = lbl_802F1B4C;
    t = (float)infoWork.timerCurr / (float)infoWork.timerMax;

    // Make a temporary copy of the timer fuse, which we will modify
    memcpy(
        tempModel,
        NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_OBJ_COLOR_BAR_03),
        NLMODEL_HEADER(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_OBJ_COLOR_BAR_03))->unk4->modelSize);

    mesh = (struct NaomiMesh *)tempModel->meshStart;
    faceCount = ((struct NaomiDispList *)(((struct NaomiMesh *)tempModel->meshStart)->dispListStart))->faceCount;

    f4 = 2.0 * (t - 0.5);
    f4 = CLAMP(f4, 0.0, 1.0);

    f3 = f4 * (faceCount - 2.0);
    r7 = mathutil_floor(f3 * 0.5) * 2.0f;
    f1 = (f3 - r7) * 0.5;

    vtx = (struct NaomiVtxWithNormal *)((struct NaomiDispList *)mesh->dispListStart)->vtxData;
    for (i = faceCount - 1; i >= 0; i--, vtx++)
    {
        if (t < 0.5)
            vtx->s = 0.25;
        else if (i < r7)
            vtx->s = 0.75f;
        else if (i < r7 + 2)
            vtx->s = f1 * 0.25 + 0.5;
        else if (i < r7 + 4)
            vtx->s = 0.25 + f1 * 0.25;
        else
            vtx->s = 0.25;
    }

    // Calculate something based on vertex positions?
    // The result is never used, so this is pointless.
    if (t >= 0.5)
    {
        int index = faceCount - 4 - r7;
        float f2 = 1.0 - f1;

        vtx = &((struct NaomiVtxWithNormal *)((struct NaomiDispList *)mesh->dispListStart)->vtxData)[index];

        sp48.x = vtx[0].x * f1 + vtx[2].x * f2;
        sp48.y = vtx[0].y * f1 + vtx[2].y * f2;
        sp48.z = vtx[0].z * f1 + vtx[2].z * f2;

        sp3C.x = vtx[1].x * f1 + vtx[3].x * f2;
        sp3C.y = vtx[1].y * f1 + vtx[3].y * f2;
        sp3C.z = vtx[1].z * f1 + vtx[3].z * f2;

        sp94.x = 0.5 * (sp48.x + sp3C.x);
        sp94.y = 0.5 * (sp48.y + sp3C.y);
        sp94.z = 0.001 + 0.5 * (sp48.z + sp3C.z);
    }

    // WTF??
    mesh = (void *)((u32 *)mesh + (((s32)mesh->dispListSize >> 2) + 0x14));

    faceCount = ((struct NaomiDispList *)mesh->dispListStart)->faceCount;

    f4 = t * 2.0;
    f4 = CLAMP(f4, 0.0, 1.0);

    f3 = f4 * (faceCount - 2.0);
    r7 = mathutil_floor(f3 * 0.5) * 2.0f;
    f1 = (f3 - r7) * 0.5;

    vtx = (void *)((struct NaomiDispList *)mesh->dispListStart)->vtxData;
    for (i = faceCount - 1; i >= 0; i--, vtx++)
    {
        if (t > 0.5)
            vtx->s = 0.75;
        else if (i < r7)
            vtx->s = 0.75;
        else if (i < r7 + 2)
            vtx->s = 0.5 + f1 * 0.25;
        else if (i < r7 + 4)
            vtx->s = 0.25 + f1 * 0.25;
        else
            vtx->s = 0.25;
    }

    // Calculate something based on vertex positions?
    // The result is never used, so this is pointless.
    if (t < 0.5)
    {
        int index = faceCount - 4 - r7;
        float f2 = 1.0 - f1;

        vtx = &((struct NaomiVtxWithNormal *)((struct NaomiDispList *)mesh->dispListStart)->vtxData)[index];

        sp30.x = vtx[0].x * f1 + vtx[2].x * f2;
        sp30.y = vtx[0].y * f1 + vtx[2].y * f2;
        sp30.z = vtx[0].z * f1 + vtx[2].z * f2;

        sp24.x = vtx[1].x * f1 + vtx[3].x * f2;
        sp24.y = vtx[1].y * f1 + vtx[3].y * f2;
        sp24.z = vtx[1].z * f1 + vtx[3].z * f2;

        sp94.x = 0.5 * (sp30.x + sp24.x);
        sp94.y = 0.5 * (sp30.y + sp24.y);
        sp94.z = 0.001 + 0.5 * (sp30.z + sp24.z);
    }

    switch (lbl_801EEC90.unk4C)
    {
    case 0:
        if (!(infoWork.unk0 & (1 << 3)))
        {
            lbl_801EEC90.unk4C = 1;
            lbl_801EEC90.unk60 = 0.125f;
            lbl_801EEC90.unk58 = -((rand() & 0x3FF) + 0x400);
        }
        break;
    case 1:
        lbl_801EEC90.unk60 -= 0.0083333333333333332;
        lbl_801EEC90.unk5C += lbl_801EEC90.unk60;
        if (lbl_801EEC90.unk5C < 1.0)
        {
            lbl_801EEC90.unk5C = 1.0f;
            lbl_801EEC90.unk60 = 0.0f;
            lbl_801EEC90.unk4C = 2;
        }
        break;
    case 2:
        if (infoWork.unk0 & (1 << 3))
            lbl_801EEC90.unk4C = 3;
        break;
    case 3:
        lbl_801EEC90.unk4C = 4;
        break;
    case 4:
        lbl_801EEC90.unk4C = 0;
        break;
    }
    if (infoWork.unk0 & (1 << 3))
        lbl_801EEC90.unk58 -= (lbl_801EEC90.unk58 >> 3);
    else if (t > 0.5)
        lbl_801EEC90.unk58 += (-768 - lbl_801EEC90.unk58) >> 4;
    else
        lbl_801EEC90.unk58 += (-1536 - lbl_801EEC90.unk58) >> 4;
    if (!(gamePauseStatus & 0xA))
        lbl_801EEC90.unk54 += lbl_801EEC90.unk58;

    func_80030BB8(1.0f, 1.0f, 1.0f);
    g_avdisp_set_some_color_1(1.0f, t, 0.0f, 1.0f);
    mathutil_mtxA_from_translate_xyz(0.0f, (1.0 - t) - 0.5, 0.0f);
    g_avdisp_set_some_matrix(0, mathutilData->mtxA);

    // Draw new bomb fuse
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate_xyz(0.00094f, 0.00519f, -0.01f);
    scale = 0.0007f;
    mathutil_mtxA_scale_s(scale);
    g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
    g_avdisp_set_model_scale(scale);
    func_8008F6D4(1);
    g_avdisp_draw_model_1(commonGma->modelEntries[BOMB_FUSE].modelOffset);
    func_8008F6D4(0);

    // Draw spark
    sparkPos.x = g_interpolate_anim(ARRAY_COUNT(bombSparkXKeyframes), bombSparkXKeyframes, (1.0 - t) * 100.0);
    sparkPos.y = g_interpolate_anim(ARRAY_COUNT(bombSparkYKeyframes), bombSparkYKeyframes, (1.0 - t) * 100.0);
    sparkPos.z = 0.141f;
    mathutil_mtxA_translate(&sparkPos);
    mathutil_mtxA_sq_from_identity();
    mathutil_mtxA_rotate_z(lbl_801EEC90.unk54);
    mathutil_mtxA_scale_s(0.0149f);
    mathutil_mtxA_scale_xyz(lbl_801EEC90.unk5C, lbl_801EEC90.unk5C, lbl_801EEC90.unk5C);
    g_draw_naomi_model_1(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_TIMER_FIRE));
    func_8000E3BC();
}

void set_backdrop_color(void)
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
            if ((modeCtrl.levelSetFlags & ((1 << 5)|(1 << 6))) == 0)
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
            color = backgroundInfo.backdropColor;
            break;
        }
        break;
    case MD_SEL:
    case MD_MINI:
        color = backgroundInfo.backdropColor;
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
            color.r = introBackdropColor >> 16;
            color.g = introBackdropColor >> 8;
            color.b = introBackdropColor >> 0;
            color.a = introBackdropColor >> 24;
            break;
        default:
            color = backgroundInfo.backdropColor;
            introBackdropColor = (color.a << 24) | (color.r << 16) | (color.g << 8) | color.b;
            break;
        }
        break;
    case MD_OPTION:
        switch (gameSubmode)
        {
        case SMD_OPTION_REPLAY_PLAY_INIT:
        case SMD_OPTION_REPLAY_PLAY_MAIN:
            color = backgroundInfo.backdropColor;
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

    if (r0 && fogInfo.unkF != 0)
    {
        color.r = fogInfo.r;
        color.g = fogInfo.g;
        color.b = fogInfo.b;
    }
    GXSetCopyClear(color, 0x00FFFFFF);
}

void draw_monkey(void)
{
    ord_tbl_add_depth_offset(0.5f);
    func_8008D158(0x00FFFF7F);
    ord_tbl_add_depth_offset(-0.5f);
}

void func_8000E134(void)
{
    if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
        func_80038AB4();
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
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
        if (!(modeCtrl.levelSetFlags & (1 << 5)) && modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION)
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
        if (modeCtrl.levelSetFlags & LVLSET_FLAG_MASTER)
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
