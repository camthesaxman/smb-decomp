#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "camera.h"
#include "game.h"
#include "mathutil.h"

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
    chr = throbber[(lbl_802F1B34/2) % 4];
    g_debug_printf("%c", chr);
    g_debug_print("NOW LOADING");
    g_debug_printf("%c", chr);
    g_debug_set_cursor_pos(15, 16);
    g_debug_print("LEFT: ");
    asterisks = func_80092468();
    while (asterisks > 0)
    {
        g_debug_print("*");
        asterisks--;
    }
}

void polydisp_main(void)
{
    struct Struct801EEC80 *unk = &lbl_801EEC80;

    if (gameMode == MD_SEL
     && (gameSubmode == SMD_SEL_STAGE_INIT || gameSubmode == SMD_SEL_STAGE_MAIN)
     && func_80092444() != 0)
        show_loading_msg();

    unk->unk10 &= ~0x11;
    if (func_8009D5D8() != 0)
        unk->unk10 |= 0x10;

    func_80021ECC();
    func_8009AB5C();

    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
        func_8000E134();

    func_8000DEE8();
    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
    {
        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(1);
        func_8000B6F0();
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
        func_80084A40();
    if (lbl_802F2000 & 4)
        func_8000D5E4();
}

void func_8000B6F0(void)
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
        func_8000E0FC();
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
            func_8000C5A4();
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
                func_8000C5A4();
                break;
            default:
                if (modeCtrl.unk8 & (1 << 5))
                    func_8000C5A4();
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
        func_8000E0FC();
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
        func_8000C5A4();
        func_8000BCA4();
        break;
    case 11:
    case 12:
    case 15:
    case 16:
    case 17:
    case 18:
        func_8000C5A4();
        func_800858CC();
        func_8000C388();
        break;
    }
}

extern struct
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
} lbl_801EED04;

//extern u8 lbl_802F1B04[0xB4];
extern u32 *lbl_802F1B04;
extern u32 lbl_802F1BB8;

extern float lbl_80173FD0[];

/*
struct Struct802F1CC8_child_child
{
    struct GMAModelHeader *unk0;
    u8 filler4[4];
};

struct Struct802F1CC8_child
{
    struct Struct802F1CC8_child_child unk0[2];
    u8 filler10[0x248-0x10];
    struct GMAModelHeader *unk248;
    u8 filler24C[4];
    struct GMAModelHeader *unk250;
    u8 filler254[4];
    struct GMAModelHeader *unk258;
    u8 filler25C[4];
    struct GMAModelHeader *unk260;
    u8 filler264[0x270-0x264];
    struct GMAModelHeader *unk270;
};

extern struct Struct802F1CC8
{
    u8 filler0[8];
    struct Struct802F1CC8_child *unk8;
} *lbl_802F1CC8;
*/

extern struct GMA *lbl_802F1CC8;

extern struct Struct80173FA8
{
    u32 unk0;
    s16 unk4;
    s16 unk6;
    Vec unk8;
} lbl_80173FA8[];

void func_80085678(float);

void func_8000B918(void)
{
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&lbl_801EED04.unk0);
    mathutil_mtxA_rotate_x(lbl_801EED04.unkC);
    mathutil_mtxA_rotate_z(lbl_801EED04.unkE);
    func_80033AD4(lbl_802F1B04[0x2D]);
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
            if (lbl_80205E60[i].unkFC->unk14 & (1 << (31-0x1A)))
                continue;
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate_xyz(
                lbl_80205E60[i].unkFC->unk30.x,
                lbl_80205E60[i].unkFC->unk30.y - 0.45,
                lbl_80205E60[i].unkFC->unk30.z);
            f30 = lbl_80173FD0[lbl_80205E60[i].unkFC->unk10];
            mathutil_mtxA_scale_s(f30);
            mathutil_mtxA_rotate_x(0x4000);
            g_avdisp_set_some_color_1(0.38f, 0.39f, 0.4f, 1.0f);
            func_8008E420(f30);
            //func_8008E500(lbl_802F1CC8->unk8->unk270);
            func_8008E500(lbl_802F1CC8->modelEntries[0x4E].modelOffset);
        }
        func_8000E3BC();
    }
    if (lbl_801EED2C.unk4 & 1)
    {
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate_xyz(
            lbl_80205E60[0].unkFC->unk30.x,
            lbl_80205E60[0].unkFC->unk30.y - 0.25,
            lbl_80205E60[0].unkFC->unk30.z);
        if (lbl_801EED2C.unk8 >= 0x440 && lbl_801EED2C.unk8 < 0x51A)
            mathutil_mtxA_translate_xyz(-0.24f, 0.0f, 0.0f);
        func_80033AD4(lbl_802F1B04[0x37]);
    }
    if (lbl_801EED2C.unk4 & (1 << (31-0x15)))
    {
        struct Struct80173FA8 *r27 = lbl_80173FA8;
        int i;
        for (i = 0; i < 2; i++, r27++)
        {
            u32 *var;
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate(&lbl_80205E60[0].unkFC->unk30);
            mathutil_mtxA_translate(&r27->unk8);
            mathutil_mtxA_rotate_y(r27->unk6);
            mathutil_mtxA_rotate_x(r27->unk4);
            var = &lbl_802F1B04[r27->unk0];
            func_80033AD4(var[1]);
        }
    }
    if (!(lbl_801EED2C.unk4 & (1 << (31-0x1B))))
    {
        if (lbl_801EED2C.unk4 & (1 << (31-0x1E)))
            func_80047530();
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
            func_80068370();

        if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING
         || (lbl_801EED2C.unk4 & (1 << (31-0x1C))))
            func_8006B198();

        if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
            func_8004CD60();

        if (lbl_801EED2C.unk4 & (1 << (31-0x1D)))
            func_80038840();
    }
    func_8000E0FC();
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

extern struct
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    float unkC;
} lbl_801EED3C;

void func_80030BA8(float);

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
    if (!(lbl_802F1EE0 & 0xA))
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
    //g_avdisp_draw_model_1(lbl_802F1CC8->unk8->unk260);
    g_avdisp_draw_model_1(lbl_802F1CC8->modelEntries[0x4C].modelOffset);
    mathutil_mtxA_translate_xyz(0.0f, -2.7f, 0.0f);
    mathutil_mtxA_push();
    mathutil_mtxA_rotate_x(CLAMP(lbl_801EED3C.unk0 * 12, -0x1000, 0x1000));
    mathutil_mtxA_rotate_z(CLAMP(lbl_801EED3C.unk4 * 8, -0x1000, 0x1000));
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    func_8008E564(lbl_801EED3C.unkC);
    //g_avdisp_draw_model_1(lbl_802F1CC8->unk8->unk258);
    g_avdisp_draw_model_1(lbl_802F1CC8->modelEntries[0x4B].modelOffset);
    mathutil_mtxA_pop();
    f2 = 0.0f;
    f3 = 0.0f;
    for (i = 0; i < 4; i++)
    {
        if (lbl_801F3B70[i].unkA == 0)
        {
            f2 = (float)lbl_801F3B70[i].unk2 / 60.0;
            f3 = -(float)lbl_801F3B70[i].unk3 / 60.0;
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
    //g_avdisp_draw_model_1(lbl_802F1CC8->unk8->unk258);
    g_avdisp_draw_model_1(lbl_802F1CC8->modelEntries[0x4B].modelOffset);
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&sp48);
    mathutil_mtxA_rotate_x(3328.0f + (-32768.0f * lbl_801EED3C.unkC));
    mathutil_mtxA_translate_xyz(0.0f, 0.00058f, 0.0f);
    mathutil_mtxA_scale_xyz(f31, f31, f31);
    func_80030BA8(f31);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    //g_avdisp_draw_model_1(lbl_802F1CC8->unk8->unk250);
    g_avdisp_draw_model_1(lbl_802F1CC8->modelEntries[0x4A].modelOffset);
    if (lbl_801EED3C.unk8 == 2)
    {
        mathutil_mtxA_scale_xyz(1.0f, 0.25f, 1.0f);
        func_80030BA8(1.0f);
    }
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    func_8008E564(1.0 - lbl_801EED3C.unkC);
    //g_avdisp_draw_model_1(lbl_802F1CC8->unk8->unk248);
    g_avdisp_draw_model_1(lbl_802F1CC8->modelEntries[0x49].modelOffset);
    func_800858CC();
}

struct Struct8000C144
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
};

const GXColor lbl_802F2978 = {0, 0, 0, 0};

void func_8000C144(struct Struct8000C144 *a)
{
    float x1 = a->unk0;
    float y1 = a->unk4;
    float x2 = a->unk8;
    float y2 = a->unkC;
    float z = a->unk10;
    u8 filler[8];
    
    func_8009A9B4(0x200);
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
    sp14.unk0 = f3 * currentCameraStructPtr->sub28.unk34;
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

void func_8000C5A4(void)
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
            currentBallStructPtr = &lbl_80205E60[i];
            func_80018648(i);
            func_80092D3C();
            func_80054FF0();
            func_800225C0(i);
            if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
                func_80095398(4);
            func_8000E0FC();
            if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING
             || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
                func_80047530();
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
                func_80068370();
            if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
                func_8006B198();
            if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
                func_8004CD60();
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
    struct Struct801EEC80 *unk = &lbl_801EEC80;

    unk->unk10 |= (1 << 3);
    for (i = 0; i < 4; i++)
    {
        if (cameraInfo[i].sub28.width > 0.0f && cameraInfo[i].sub28.height > 0.0f
         && (cameraInfo[i].flags & (1 << (31-0x19))))
        {
            currentBallStructPtr = &lbl_80205E60[i];
            func_80018648(i);
            func_800225C0(i);
            if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING
             || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
                func_80047530();
            if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
            {
                func_80085678(400.0f);
                background_draw();
                func_80085678(0.0f);
            }
            if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
                func_80068370();
            if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
                func_8006B198();
            if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
                func_80038840();
            func_8000C8D4();
            func_8000D220();
            func_800858CC();
        }
    }
    unk->unk10 &= ~(1 << 3);
}

/*
#define MATHUTIL_DATA (*(struct MathutilData *)0xE0000000)
extern u16 lbl_802F02E0[];

static inline void test(Vec *r27, float f27)
{
            if (r27->z < -4.0 * f27)
                mathutil_mtxA_scale_s(r27->z / (-4.0 * f27));
}

void func_8000C8D4(void)
{
    int i;  // r24
    s8 *r25 = spritePoolInfo.unkC;
    Vec sp8;
//    Vec *r27 = &sp8;
    for (i = 0; i < spritePoolInfo.unk8; i++)
    {
        if (r25[i] == 0
         || r25[i] == 4
         || (lbl_80205E60[i].unk94 & (1 << (31-0x1B))))
            continue;
        {
            u16 foo;
            float f27;
            mathutil_mtxA_from_identity();
            f27 = 0.8 - 0.1 * (((lbl_802F1B34 / 16) + i) % 3);
            mathutil_mtxA_scale_s(f27);
            mathutil_mtxA_mult_right(mathutilData->mtxB);
            mathutil_mtxA_translate(&lbl_80205E60[i].unk4);
            mathutil_mtxA_rotate_y(cameraInfo[i].unk1A - 0x8000);
            mathutil_mtxA_rotate_x(-0x4000);
            mathutil_mtxA_translate_xyz(0.0f, lbl_80205E60[i].unk68, 0.0f);
            //r27->x = MATHUTIL_DATA.mtxA[0][3];
            //r27->y = MATHUTIL_DATA.mtxA[1][3];
            //r27->z = MATHUTIL_DATA.mtxA[2][3];
            sp8.x = *(float *)0xE000000C;
            sp8.y = *(float *)0xE000001C;
            sp8.z = *(float *)0xE000002C;
            //if (r27->z < -4.0 * f27)
            //    mathutil_mtxA_scale_s(r27->z / (-4.0 * f27));
            test(&sp8, f27);
            func_8009AA24(mathutilData->mtxA, 0);
            foo = lbl_802F02E0[i];
            g_avdisp_draw_model_1(lbl_802F1CC8->modelEntries[foo].modelOffset);
        }
    }
}
*/
/*
void func_8000C8D4(void)
{
    int i;  // r24
    s8 *r25 = spritePoolInfo.unkC;
    float sp8[3];
    float *r27 = sp8;
    for (i = 0; i < spritePoolInfo.unk8; i++)
    {
        if (r25[i] == 0
         || r25[i] == 4
         || (lbl_80205E60[i].unk94 & (1 << (31-0x1B))))
            continue;
        {
            u16 foo;
            float f27;
            mathutil_mtxA_from_identity();
            f27 = 0.8 - 0.1 * (((lbl_802F1B34 / 16) + i) % 3);
            mathutil_mtxA_scale_s(f27);
            mathutil_mtxA_mult_right(mathutilData->mtxB);
            mathutil_mtxA_translate(&lbl_80205E60[i].unk4);
            mathutil_mtxA_rotate_y(cameraInfo[i].unk1A - 0x8000);
            mathutil_mtxA_rotate_x(-0x4000);
            mathutil_mtxA_translate_xyz(0.0f, lbl_80205E60[i].unk68, 0.0f);
            r27[0] = MATHUTIL_DATA.mtxA[0][3];
            r27[1] = MATHUTIL_DATA.mtxA[1][3];
            r27[2] = MATHUTIL_DATA.mtxA[2][3];
            //sp8.x = *(float *)0xE000000C;
            //sp8.y = *(float *)0xE000001C;
            //sp8.z = *(float *)0xE000002C;
            if (r27[2] < -4.0 * f27)
                mathutil_mtxA_scale_s(r27[2] / (-4.0 * f27));
            func_8009AA24(mathutilData->mtxA, 0);
            foo = lbl_802F02E0[i];
            g_avdisp_draw_model_1(lbl_802F1CC8->unk8->unk0[foo].unk0);
        }
    }
}
*/
