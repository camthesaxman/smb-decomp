#include <dolphin.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "effect.h"
#include "event.h"
#include "gma.h"
#include "info.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"
#include "pool.h"
#include "ranking_screen.h"
#include "recplay.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "stcoli.h"
#include "stobj.h"

#define NUM_BUTTONS 48

struct Struct802C6220 lbl_802C6220;
FORCE_BSS_ORDER(lbl_802C6220)

static struct GMAModel *s_buttonModels[NUM_BUTTONS];  // 0xF4
FORCE_BSS_ORDER(s_buttonModels)

struct Struct802C63D4
{
    s8 unk0;
    u8 filler1[3];
    s32 unk4;
    float unk8[3];
};  // size = 0x14

struct Struct802C63D4 lbl_802C63D4[NUM_BUTTONS];  // 0x1B4
FORCE_BSS_ORDER(lbl_802C63D4)

struct
{
    s32 unk0;  // 0x574
    s32 unk4;  // 0x578
    s32 unk8;  // 0x57C
    char unkC[4];  // 0x580
    s32 unk10;  // 0x584
    s32 unk14;  // 0x588
    float unk18;  // 0x58C
    float unk1C;  // 0x590
    float unk20;
    float unk24;
    float unk28;  // 0x59C
    float unk2C;  // 0x5A0
    float unk30;
    float unk34;  // 0x5A8
    float unk38;
    float unk3C;  // 0x5B0
} lbl_802C6794;
FORCE_BSS_ORDER(lbl_802C6794)


struct ScoreRecord lbl_802C67D4[4][5];  // 0x5B4
FORCE_BSS_ORDER(lbl_802C67D4)

void func_800AD38C(void)
{
    func_800AEBA8();
}

static u8 s_buttonLetters[NUM_BUTTONS] =
{
    0,   0,   ' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
    'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z', '!', '&', '-', '.', '?', '@', '9',
    '8', '7', '6', '5', '4', '3', '2', '1', '0', '\b', 0,  0,
};

static char *s_buttonModelNames[NUM_BUTTONS] =
{
    NULL,
    NULL,
    "FONT_ARROW_R",
    "FONT_A",
    "FONT_B",
    "FONT_C",
    "FONT_D",
    "FONT_E",
    "FONT_F",
    "FONT_G",
    "FONT_H",
    "FONT_I",
    "FONT_J",
    "FONT_K",
    "FONT_L",
    "FONT_M",
    "FONT_N",
    "FONT_O",
    "FONT_P",
    "FONT_Q",
    "FONT_R",
    "FONT_S",
    "FONT_T",
    "FONT_U",
    "FONT_V",
    "FONT_W",
    "FONT_X",
    "FONT_Y",
    "FONT_Z",
    "FONT_EXCLAM",
    "FONT_AMPERSAND",
    "FONT_MINUS",
    "FONT_PERIOD",
    "FONT_QUESTION",
    "FONT_ATMARK",
    "FONT_NINE",
    "FONT_EIGHT",
    "FONT_SEVEN",
    "FONT_SIX",
    "FONT_FIVE",
    "FONT_FOUR",
    "FONT_THREE",
    "FONT_TWO",
    "FONT_ONE",
    "FONT_ZERO",
    "FONT_ARROW_L",
    NULL,
    NULL,
};

// If any of these names is entered, it will be replaced with "---".
static char *s_censoredNames[] =
{
    "SEX",
    "XXX",
    "XX ",
    "XX",
    " XX",
    "X X",
};

struct Struct802F2208
{
    u8 unk0;
    u8 filler1[3];
    u32 unk4;
    u8 filler8[0x14-0x8];
};

static struct Struct802F2208 *lbl_802F2208;

void ev_name_entry_init(void)
{
    struct GMAModel **modelIter;
    char **nameIter;
    struct GMAModel *buttonModel;
    int i2;
    int i = 0;
    struct Struct802C63D4 *var_r24;
    struct Stobj stobj;
    s8 j;

    lbl_802C6794.unk0 = 1;
    lbl_802C6794.unk8 = -2;
    memset(lbl_802C6794.unkC, 0, sizeof(lbl_802C6794.unkC));
    lbl_802F2208 = 0;
    buttonModel = find_stage_or_bg_model("BUTTON");

    // find models
    nameIter = s_buttonModelNames;
    modelIter = s_buttonModels;
    for (i = NUM_BUTTONS; i > 0; i--, nameIter++, modelIter++)
    {
        if (*nameIter == NULL)
            *modelIter = NULL;
        else
            *modelIter = find_stage_or_bg_model(*nameIter);
    }

    for (i = 0; i < NUM_BUTTONS; i++)
    {
        for (j = 0; j < 3; j++)
            lbl_802C63D4[i].unk8[j] = 0.25f;
    }

    memset(&stobj, 0, sizeof(stobj));
    stobj.type = SOT_NAMEENT_BTN;
    stobj.model = buttonModel;

    modelIter = s_buttonModels;
    var_r24 = lbl_802C63D4;
    for (i2 = 0; i2 < NUM_BUTTONS; i2++, var_r24++, modelIter++)
    {
        if (*modelIter != 0)
        {
            stobj.model = buttonModel;
            i = (s16)((-65536.0f * (0.5f + i2)) / (float)NUM_BUTTONS);
            stobj.rotY = i;
            stobj.u_some_pos.x = 0.0f;
            stobj.u_some_pos.y = 0.0f;
            stobj.u_some_pos.z = -17.5f;
            mathutil_mtxA_from_identity();
            mathutil_mtxA_rotate_y(i);
            mathutil_mtxA_tf_vec(&stobj.u_some_pos, &stobj.u_some_pos);
            stobj.extraData = var_r24;
            spawn_stobj(&stobj);
        }
    }

    call_bitmap_load_group(BMP_RNK);
    lbl_802C6794.unk10 = func_800AECCC(modeCtrl.difficulty, &lbl_802C67D4[modeCtrl.currPlayer][0]);
    lbl_802C6794.unk14 = 0;
    lbl_802C6794.unk18 = 640.0f;
    lbl_802C6794.unk1C = 60.0f;
    lbl_802C6794.unk20 = lbl_802C6794.unk18;
    lbl_802C6794.unk24 = lbl_802C6794.unk1C;
    lbl_802C6794.unk28 = 36.0f;
    lbl_802C6794.unk2C = lbl_802C6794.unk28;
    lbl_802C6794.unk30 = 280.0f;
    lbl_802C6794.unk34 = lbl_802C6794.unk30;
    lbl_802C6794.unk38 = 0.0f;
    lbl_802C6794.unk3C = 0.0f;
}

void ev_name_entry_main(void)
{
    struct Struct802F2208 spDC;
    u8 filler2[4];
    struct Effect sp2C;
    Point3d sp20;
    u8 filler[12];
    float x;
    float y;
    float z;
    float var_f28;
    float temp_f1_16;
    int i;
    int var_r28;
    struct Ball *ball;
    struct Camera *camera;
    struct Effect *temp_r3_3;
    struct Sprite *sprite;
    struct Struct802C63D4 *var_r27;
    Point3d sp8;

    ball = &ballInfo[modeCtrl.currPlayer];
    camera = &cameraInfo[ball->playerId];
    if (gamePauseStatus & 0xA)
        return;
    switch (lbl_802C6794.unk0)
    {
    case 1:
        lbl_802C6794.unk0 = 2;
        break;
    case 2:
        if (camera->state == 0x22 || gameSubmode == SMD_GAME_NAMEENTRY_MAIN)
        {
            lbl_802C6794.unk0 = 3;
            lbl_802C6794.unk8 = -1;
            lbl_802C6794.unk4 = -15;
        }
        break;
    case 3:
        lbl_802C6794.unk4++;
        if (lbl_802C6794.unk4 == 15.0)
            ball->flags |= BALL_FLAG_10;
        if (lbl_802C6794.unk4 == 60.0)
        {
            func_800AE8D0();
            ball->flags &= ~BALL_FLAG_06;
        }
        if (gameSubmode == SMD_GAME_NAMEENTRY_MAIN)
        {
            lbl_802C6794.unk0 = 4;
            lbl_802C6794.unk8 = 0;
            if (lbl_802C6794.unk4 < 60.0)
                func_800AE8D0();
            sprite = create_sprite();
            if (sprite != NULL)
            {
                sprite->x = 320.0f;
                sprite->y = 106.0f;
                sprite->fontId = FONT_ASC_8x16;
                sprite->textAlign = ALIGN_CT;
                sprintf(sprite->text, "PLEASE ENTER YOUR NAME");
            }
        }
        break;
    case 4:
        lbl_802C6794.unk0 = 5;
        ball->flags &= ~BALL_FLAG_10;
        lbl_802C6794.unk14 = 1;
        lbl_802C6794.unk20 = 0.0f;
        lbl_802C6794.unk24 = 60.0f;
        lbl_802C6794.unk2C = 36.0f;
        lbl_802C6794.unk34 = 187.0 + (31.0 * (float)lbl_802C6794.unk8);
        break;
    case 5:
        if (lbl_802F2208 != NULL)
            lbl_802C6794.unk0 = 6;
        if ((infoWork.flags & INFO_FLAG_TIMEOVER) || (infoWork.flags & INFO_FLAG_GOAL))
        {
            lbl_802C6794.unk0 = 7;
            infoWork.flags &= ~INFO_FLAG_TIMEOVER;
            infoWork.flags |= INFO_FLAG_GOAL;
            ball->flags |= BALL_FLAG_GOAL;
            infoWork.flags |= INFO_FLAG_TIMER_PAUSED;
            func_80037B1C(ball);
        }
        break;
    case 6:
        spDC = *lbl_802F2208;
        temp_r3_3 = find_effect_by_uid(spDC.unk4);
        if (temp_r3_3 != NULL)
        {
            func_800AF3B0(temp_r3_3, 5);
            memcpy(&sp2C, temp_r3_3, sizeof(sp2C));
            sp2C.u_otherTimer = 15;
            lbl_802F2208->unk4 = spawn_effect(&sp2C);
        }
        if (temp_r3_3 != NULL && temp_r3_3->model != NULL)
        {
            memset(&sp2C, 0, sizeof(sp2C));
            sp2C.type = ET_GET_NAMEENT_CODE;
            sp2C.model = temp_r3_3->model;
            sp2C.pos = temp_r3_3->pos;
            sp2C.scale.x = 1.0f;
            sp2C.scale.y = 1.0f;
            sp2C.scale.z = 1.0f;
            spawn_effect(&sp2C);
        }
        switch (spDC.unk0)
        {
        case 8:
            u_play_sound_0(0x503D);
            if (lbl_802C6794.unk8 > 0)
            {
                lbl_802C6794.unk8--;
                lbl_802C6794.unkC[lbl_802C6794.unk8] = ' ';
            }
            if (lbl_802C6794.unk8 == 2)
            {
                func_800AE930(0);
                camera->state = 0x24;
            }
            break;
        default:
            u_play_sound_0(0xC83C);
            if (lbl_802C6794.unk8 < 3)
            {
                lbl_802C6794.unkC[lbl_802C6794.unk8] = spDC.unk0;
                lbl_802C6794.unk8++;
                if (lbl_802C6794.unk8 == 3)
                {
                    func_800AE930(1);
                    camera->state = 0x25;
                }
            }
            break;
        }
        lbl_802C6794.unk34 = 187.0 + (31.0 * (float)lbl_802C6794.unk8);
        if (lbl_802C6794.unk8 > 3)
            lbl_802C6794.unk0 = 7;
        else
            lbl_802C6794.unk0 = 4;
        lbl_802F2208 = NULL;
        break;
    case 7:
        lbl_802C6794.unk0 = 8;
        lbl_802C6794.unkC[lbl_802C6794.unk8] = 0;
        lbl_802C6794.unk8 = 4;
        if (strlen(lbl_802C6794.unkC) == 0)
            strcpy(lbl_802C6794.unkC, "A.V");
        if (is_censored_name(lbl_802C6794.unkC))
            strcpy(lbl_802C6794.unkC, "---");
        lbl_802C6794.unk34 = 736.0f;
        memcpy(&lbl_802C67D4[modeCtrl.currPlayer][0].initials, lbl_802C6794.unkC, 4);
        func_800AF098();
        func_800AED54(lbl_802C6794.unkC);
        func_80049430(lbl_802C6794.unkC);
        u_play_sound_0(0x34);
        u_play_sound_0(0x59);
        break;
    case 8:
        lbl_802C6794.unk0 = 9;
        lbl_802C6794.unk4 = 0x5A;
        ball->state = 0x11;
        destroy_sprite_with_tag(0);
        destroy_sprite_with_tag(2);
        func_800885EC();
        init_ranking_screen(modeCtrl.difficulty);
        lbl_802C6794.unk24 = (lbl_802C6794.unk10 * 0x2E) + 0xA0;
        lbl_802C6794.unk2C = 136.0f;
        // fall through
    case 9:
        lbl_802C6794.unk4--;
        if (lbl_802C6794.unk4 < 0)
        {
            ball->state = 5;
            lbl_802C6794.unk0 = 0xA;
            lbl_802C6794.unk4 = 0x14A;
        }
        if (ball->pos.z < -4.375)
        {
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_rigid_inv_tf_tl(&sp20);
            sp20.x -= ball->pos.x;
            sp20.y = 0.0f;
            sp20.z -= ball->pos.z;
            mathutil_vec_set_len(&sp20, &sp20, 0.0006f);
            ball->vel.x += sp20.x;
            ball->vel.y += sp20.y;
            ball->vel.z += sp20.z;
        }
        break;
    case 10:
        lbl_802C6794.unk4--;
        if (lbl_802C6794.unk4 > 96.0)
        {
            if (controllerInfo[lbl_80206BD0[ball->playerId]].unk0[2].button & 0x100)
                lbl_802C6794.unk4 = 0x61;
        }
        else if (lbl_802C6794.unk4 == 96.0)
        {
            lbl_802C6794.unk14 = 0;
            func_8008897C(0);
        }
        else if (lbl_802C6794.unk4 < 0)
            lbl_802C6794.unk0 = 0xB;
        break;
    case 11:
        lbl_802C6794.unk0 = 0;
        camera->state = 0xE;
        ball->state = 0x1B;
        func_8008897C(1);
        lbl_802C6794.unk14 = 0;
        break;
    }

    if (lbl_802C6794.unk18 < lbl_802C6794.unk20)
    {
        lbl_802C6794.unk18 += 21.333333333333332;
        if (lbl_802C6794.unk18 > lbl_802C6794.unk20)
            lbl_802C6794.unk18 = lbl_802C6794.unk20;
    }
    else if (lbl_802C6794.unk18 > lbl_802C6794.unk20)
    {
        lbl_802C6794.unk18 -= 21.333333333333332;
        if (lbl_802C6794.unk18 < lbl_802C6794.unk20)
            lbl_802C6794.unk18 = lbl_802C6794.unk20;
    }
    if (lbl_802C6794.unk1C < lbl_802C6794.unk24)
    {
        lbl_802C6794.unk1C += 7.111111111111111;
        if (lbl_802C6794.unk1C > lbl_802C6794.unk24)
            lbl_802C6794.unk1C = lbl_802C6794.unk24;

    }
    else if (lbl_802C6794.unk1C > lbl_802C6794.unk24)
    {
        lbl_802C6794.unk1C -= 7.111111111111111;
        if (lbl_802C6794.unk1C < lbl_802C6794.unk24)
            lbl_802C6794.unk1C = lbl_802C6794.unk24;
    }
    if (lbl_802C6794.unk28 < lbl_802C6794.unk2C)
    {
        lbl_802C6794.unk28 += 7.111111111111111;
        if (lbl_802C6794.unk28 > lbl_802C6794.unk2C)
            lbl_802C6794.unk28 = lbl_802C6794.unk2C;
    }
    else if (lbl_802C6794.unk28 > lbl_802C6794.unk2C)
    {
        lbl_802C6794.unk28 -= 7.111111111111111;
        if (lbl_802C6794.unk28 < lbl_802C6794.unk2C)
            lbl_802C6794.unk28 = lbl_802C6794.unk2C;
    }

    var_f28 = 0.075 * (lbl_802C6794.unk34 - lbl_802C6794.unk30);
    if (var_f28 > 12.0)
        var_f28 = 12.0f;
    else if (var_f28 < -12.0)
        var_f28 = -12.0f;
    lbl_802C6794.unk30 += var_f28;
    lbl_802C6794.unk3C += -90.0 * var_f28 * mathutil_sin((s16)lbl_802C6794.unk38 + 0x4000);
    lbl_802C6794.unk3C += -256.0f * mathutil_sin((s16)lbl_802C6794.unk38);
    lbl_802C6794.unk3C *= 0.98;
    lbl_802C6794.unk38 += lbl_802C6794.unk3C;
    var_r27 = lbl_802C63D4;
    switch (lbl_802C6794.unk8)
    {
    case -1:
        var_r28 = NUM_BUTTONS - (lbl_802C6794.unk4 >> 1);
        for (i = NUM_BUTTONS; i > 0; i--)
        {
            if (i > var_r28)
            {
                x = 0.8f;
                y = 1.0f;
                z = 2.0f;
            }
            else
            {
                x = 0.6f;
                y = 0.55f;
                z = 0.5f;
            }
            var_r27->unk8[0] += 0.05 * (x - var_r27->unk8[0]);
            var_r27->unk8[1] += 0.05 * (y - var_r27->unk8[1]);
            var_r27->unk8[2] += 0.05 * (z - var_r27->unk8[2]);
            var_r27++;
        }
        break;
    case -2:
        break;
    case 3:
        var_r28 = (unpausedFrameCounter << 9) & 0x3E00;
        for (i = NUM_BUTTONS; i > 0; i--)
        {
            if (var_r27->unk0 == 8)
            {
                temp_f1_16 = mathutil_sin(var_r28);
                x = 0.5 + temp_f1_16;
                y = 0.25 + temp_f1_16;
                z = 0.125 + temp_f1_16;
            }
            else
            {
                x = 0.6f;
                y = 0.55f;
                z = 0.5f;
            }
            var_r27->unk8[0] += 0.2 * (x - var_r27->unk8[0]);
            var_r27->unk8[1] += 0.2 * (y - var_r27->unk8[1]);
            var_r27->unk8[2] += 0.2 * (z - var_r27->unk8[2]);
            var_r27++;
            var_r28 += 0x800;
            var_r28 &= 0x3FFF;
        }
        break;
    default:
        var_r28 = unpausedFrameCounter >> 5;
        for (i = NUM_BUTTONS; i > 0; i--, var_r28++)
        {
            if (var_r28 & 1)
            {
                x = 2.0f;
                y = 1.0f;
                z = 0.8f;
            }
            else
            {
                x = 1.0f;
                y = 0.7f;
                z = 0.4f;
            }
            var_r27->unk8[0] += 0.1 * (x - var_r27->unk8[0]);
            var_r27->unk8[1] += 0.1 * (y - var_r27->unk8[1]);
            var_r27->unk8[2] += 0.1 * (z - var_r27->unk8[2]);
            var_r27++;
        }
        break;
    }
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_rigid_inv_tf_tl(&sp8);
    func_800390C8(5, &sp8, 0.5f);
}

void ev_name_entry_dest(void)
{
    call_bitmap_free_group(BMP_RNK);
}

char lbl_802F1828[5] = "%07d";

void draw_name_entry_hud(void)
{
    struct NaomiSpriteParams params;
    int x;
    int y;
    struct Ball *ball = &ballInfo[modeCtrl.currPlayer];

    if (lbl_802C6794.unk14 != 0)
    {
        x = lbl_802C6794.unk18;
        y = lbl_802C6794.unk28;

        reset_text_draw_settings();

        set_text_font(FONT_ICON_TPL);
        func_80071B1C(1.03f);
        set_text_pos(x + 65, y);
        u_draw_char(0x30);
        set_text_pos(x + 180, y);
        u_draw_char(0x31);
        set_text_pos(x + 289, y);
        u_draw_char(0x32);
        set_text_pos(x + 460, y);
        u_draw_char(0x33);

        y = lbl_802C6794.unk1C;
        set_text_font(FONT_ICON_RNK);
        set_text_pos(x + 65, y);
        u_draw_char(lbl_802C6794.unk10 + 0x31);

        set_text_font(FONT_ASC_30x31);
        set_text_pos(x + 172, y);
        u_draw_text(lbl_802C6794.unkC);

        draw_ranking_floor_num(lbl_802C6794.unk10, x, y, &lbl_802C67D4[modeCtrl.currPlayer][0]);

        set_text_font(FONT_NUM_26x31);
        y = lbl_802C6794.unk1C;
        set_text_pos(x + 396, y);
        func_80072AC0(lbl_802F1828, lbl_802C67D4[modeCtrl.currPlayer][0].score);

        params.bmpId = BMP_RNK_rnk_lines;
        params.z = 1.03f;
        params.rotation = 0;
        params.opacity = 1.0f;
        params.unk30 = 2;
        params.flags = 5;
        params.mulColor = RGBA(255, 255, 255, 0);
        params.addColor = RGBA(0, 0, 0, 0);
        params.x = x + 39;
        params.y = y + 32;
        params.scaleX = 1.0f;
        params.scaleY = 0.0234375f;
        params.u1 = 0.0f;
        params.v1 = 0.9765625f;
        params.u2 = 1.0f;
        params.v2 = 1.0f;
        draw_naomi_sprite(&params);

        params.x += 256.0f;
        params.scaleX = 0.1953125f;
        params.u1 = 0.0f;
        params.v1 = 0.9296875f;
        params.u2 = 0.1953125f;
        params.v2 = 0.953125f;
        draw_naomi_sprite(&params);

        params.x += 50.0f;
        params.scaleX = 1.0f;
        params.u1 = 0.0f;
        params.v1 = 0.953125f;
        params.u2 = 1.0f;
        params.v2 = 0.9765625f;
        draw_naomi_sprite(&params);

        params.bmpId = u_get_monkey_bitmap_id(0, 0, playerCharacterSelection[ball->playerId]);
        params.x = x + lbl_802C6794.unk30;
        params.y = 15.5 + y;
        params.z = 0.2f;
        params.rotation = (s16)lbl_802C6794.unk38;
        params.opacity = 1.0f;
        params.unk30 = 2;
        params.flags = 0x100A;
        params.mulColor = RGBA(255, 255, 255, 0);
        params.addColor = RGBA(0, 0, 0, 0);
        params.scaleX = 0.3846154f;
        params.scaleY = 0.25f;
        params.u1 = 0.0f;
        params.v1 = 0.0f;
        params.u2 = 1.0f;
        params.v2 = 1.0f;
        draw_naomi_sprite(&params);
    }
}

int u_is_name_entry_finished(void)
{
    if (eventInfo[EVENT_NAME_ENTRY].state == EV_STATE_INACTIVE)
        return TRUE;
    if (lbl_802C6794.unk0 == 0)
        return TRUE;
    return FALSE;
}

void func_800AE8D0(void)
{
    int i;
    struct Struct802C63D4 *ptr;

    ptr = lbl_802C63D4;
    for (i = 0; i < NUM_BUTTONS; i++, ptr++)
        ptr->unk4 = -1;

    func_800AE930(0);
}

void func_800AE930(int arg0)
{
    struct Effect effect;
    int i;
    struct GMAModel **modelIter;
    u8 *var_r28;
    struct Struct802C63D4 *var_r27;
    struct Effect *r3;

    memset(&effect, 0, sizeof(effect));
    effect.type = ET_NAMEENT_CODE;
    var_r27 = lbl_802C63D4;
    var_r28 = s_buttonLetters;
    modelIter = s_buttonModels;
    for (i = 0; i < NUM_BUTTONS; i++, modelIter++, var_r28++, var_r27++)
    {
        if (*modelIter != NULL)
        {
            if (var_r27->unk4 >= 0)
            {
                if ((r3 = find_effect_by_uid(var_r27->unk4)) != NULL)
                    func_800AF3B0(r3, 5);
                var_r27->unk4 = -1;
            }
            if (arg0 == 0 || var_r27->unk0 == 8)
            {
                effect.model = *modelIter;
                effect.pos.x = 0.0f;
                effect.pos.y = 1.5f;
                effect.pos.z = -16.5f;
                mathutil_mtxA_from_identity();
                mathutil_mtxA_rotate_y((s16)((-65536.0f * (0.5f + i)) / 48.0f));
                mathutil_mtxA_tf_vec(&effect.pos, &effect.pos);
                effect.u_otherTimer = (rand() & 0x1F) + 0x10;
                var_r27->unk4 = spawn_effect(&effect);
                var_r27->unk0 = *var_r28;
            }
        }
    }
}

void func_800AEAD0(void)
{
    int i, j;
    struct Struct802C6220_sub *ptr = lbl_802C6220.unk4;

    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 5; j++, ptr++)
            ptr->unkE = -1;
    }
}

// returns TRUE if name is one of the censored names
int is_censored_name(char *name)
{
    int found = FALSE;
    int i;
    char **stringIter;

    stringIter = s_censoredNames;
    for (i = ARRAY_COUNT(s_censoredNames); i > 0; i--, stringIter++)
    {
        if (strcmp(*stringIter, name) == 0)
        {
            found = TRUE;
            break;
        }
    }
    return found;
}

#pragma force_active on
u32 someZeros[] =
{
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
#pragma force_active reset

char *lbl_801D6DC0[3][5] =
{
    { "NAG", "@RI", "SHO", "SAK", "A.V" },
    { "NAG", "JAM", "MKA", "ODA", "M.S" },
    { "NAG", "H.E", "JUN", "Y.S", "AGE" },
};

void func_800AEBA8(void)
{
    u8 filler[4];
    int i, j;
    struct Struct802C6220_sub *var_r23;
    struct Struct802C6220_sub *var_r22;
    int var_r21;

    memset(&lbl_802C6220, 0, sizeof(lbl_802C6220));
    lbl_802C6220.unk0 = sizeof(lbl_802C6220);
    var_r22 = lbl_802C6220.unk4;
    for (i = 0; i < 3; i++, var_r22 += 5)
    {
        var_r21 = 50000;
        var_r23 = var_r22;
        for (j = 0; j < 5; j++, var_r23++, var_r21 -= 1000)
        {
            strcpy(var_r23->unk0, lbl_801D6DC0[i][j]);
            var_r23->unk4 = var_r21;
            var_r23->unk8 = 0xAFC80;
            var_r23->unkC = 0xFF;
            var_r23->unkD = 0;

        }
    }
}

struct Struct802C6220_sub *func_800AEC74(int arg0, struct Struct802C6220_sub *arg1)
{
    u8 filler[4];
    struct Struct802C6220_sub *ptr = &lbl_802C6220.unk4[arg0 * 5];

    if (arg1 != NULL)
    {
        memcpy(arg1, ptr, 5 * sizeof(*arg1));
        return arg1;
    }
    return ptr;
}

int func_800AECCC(int arg0, struct ScoreRecord *arg1)
{
    struct Struct802C6220_sub *ptr = &lbl_802C6220.unk4[arg0 * 5];
    int i;

    for (i = 0; i < 5; i++, ptr++)
    {
        if (arg1->score - ptr->unk4 > 0)
            break;
    }
    if (i >= 5)
        return -1;
    return i;
}

void func_800AED54(char *arg0)
{
    int i, j;
    struct Struct802C6220_sub *var_r22;
    struct Struct802C6220_sub *var_r23;

    var_r22 = lbl_802C6220.unk4;
    for (i = 3; i > 0; i--, var_r22 += 5)
    {
        var_r23 = var_r22;
        for (j = 5; j > 0; j--, var_r23++)
        {
            if (var_r23->unkE == modeCtrl.currPlayer)
            {
                strcpy(var_r23->unk0, arg0);
                var_r23->unkE = -1;
            }
        }
    }
}

void func_800AEDDC(void) {}

void func_800AEDE0(void)
{
    struct ScoreRecord spC;
    struct Ball *temp_r29;
    struct ScoreRecord *temp_r6;
    struct ScoreRecord *var_r5;
    int i;
    struct ScoreRecord *ptr;
    int j;

    temp_r29 = (0, &ballInfo[modeCtrl.currPlayer]);
    strcpy(spC.initials, "---");
    spC.score = temp_r29->unk7C;
    spC.unk8 = infoWork.unk8;
    spC.floorNum = infoWork.currFloor;
    if (modeCtrl.courseFlags & 0x10)
        spC.unkD = 2;
    else if (modeCtrl.courseFlags & 8)
        spC.unkD = 1;
    else
        spC.unkD = 0;

    temp_r6 = lbl_802C67D4[modeCtrl.currPlayer];
    ptr = temp_r6;
    for (i = 0; i < 5; i++, ptr++)
    {
        if (ptr->score - spC.score < 0)
            break;
    }
    if (i >= 5)
        return;
    var_r5 = temp_r6 + 4;
    for (j = 5; j > i + 1; j--, var_r5--)
        var_r5[0] = var_r5[-1];
    temp_r6[i] = spC;
}

static void func_800AF098_inline(struct ScoreRecord *var_r23)
{
    int var_r26;
    struct Struct802C6220_sub *temp_r27;
    struct Struct802C6220_sub *var_r28;
    int temp_r3;

    temp_r27 = &lbl_802C6220.unk4[modeCtrl.difficulty * 5];
    temp_r3 = func_800AECCC(modeCtrl.difficulty, var_r23);
    if (temp_r3 >= 0)
    {
        var_r28 = temp_r27 + 3;
        for (var_r26 = 4; var_r26 > temp_r3; var_r26--, var_r28--)
            memcpy(var_r28 + 1, var_r28, sizeof(*var_r28));
        var_r28 = &temp_r27[temp_r3];
        memcpy(var_r28, var_r23, sizeof(*var_r28));
        var_r28->unkE = modeCtrl.currPlayer;
    }
}

void func_800AF098(void)
{
    int var_r24;
    struct ScoreRecord *var_r23;
    u8 filler[4];

    var_r23 = lbl_802C67D4[var_r24 = modeCtrl.currPlayer];
    for (var_r24 = 5; var_r24 > 0; var_r24--, var_r23++)
        func_800AF098_inline(var_r23);
}

void func_800AF164(void)
{
    int var_r27;
    int var_r26;
    struct ScoreRecord *var_r25;
    u8 filler[4];

    for (var_r26 = 0; var_r26 < 4; var_r26++)
    {
        var_r25 = lbl_802C67D4[var_r26];
        for (var_r27 = 5; var_r27 > 0; var_r27--, var_r25++)
        {
            strcpy(var_r25->initials, "---");
            var_r25->score = -1;
            var_r25->unk8 = 0;
            var_r25->floorNum = 0xFF;
        }
    }
}

void effect_nameent_code_init(struct Effect *effect)
{
    effect->state = 0;
    effect->scale.x = 1.0f;
    effect->scale.y = 0.0f;
}

void effect_nameent_code_main(struct Effect *effect)
{
    switch (effect->state)
    {
    case 0:
        effect->u_otherTimer--;
        if (effect->u_otherTimer < 0)
            effect->state = 1;
        break;
    case 1:
        effect->scale.y += 0.1 * (1.0 - effect->scale.y);
        break;
    case 2:
        effect->scale.y += 0.2 * (4.0 - effect->scale.y);
        effect->scale.x -= 0.06666666666666667;
        if (effect->scale.x < 0.0)
            g_poolInfo.effectPool.statusList[effect->poolIndex] = 3;
        break;
    }
}

void effect_nameent_code_draw(struct Effect *effect)
{
    Vec sp18;
    float xscale;
    float yscale;
    u8 filler[12];

    mathutil_mtxA_from_mtxB_translate(&effect->pos);
    sp18.x = 0.0f;
    sp18.y = 0.0f;
    sp18.z = 1.0f;
    mathutil_mtxA_rigid_inv_tf_vec(&sp18, &sp18);
    mathutil_mtxA_rotate_y(mathutil_atan2(sp18.x, sp18.z));
    yscale = effect->scale.y;
    xscale = (1.5 * effect->scale.x) / (0.5 + yscale);
    mathutil_mtxA_scale_xyz(xscale, yscale, 1.0f);
    xscale = MAX(xscale, yscale);
    avdisp_set_bound_sphere_scale(xscale);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    avdisp_draw_model_culled_sort_translucent(effect->model);
    !xscale;
}

void effect_nameent_code_destroy(struct Effect *effect)
{
    effect->model = NULL;
}

void func_800AF3B0(struct Effect *effect, int arg1)
{
    switch (arg1)
    {
    case 6:
        break;
    case 5:
    case 7:
        effect->state = 2;
        break;
    }
}

void effect_get_nameent_code_init(struct Effect *effect)
{
    struct Ball *ball = &ballInfo[modeCtrl.currPlayer];

    effect->state = 0;
    effect->u_otherTimer = 60;
    effect->unk88.x = effect->pos.x - ball->pos.x;
    effect->unk88.y = effect->pos.y - ball->pos.y;
    effect->unk88.z = effect->pos.z - ball->pos.z;
    effect->unk94.x = 0.5 * effect->scale.x;
    effect->unk94.y = 0.5 * effect->scale.y;
    effect->unk94.z = 0.5 * effect->scale.z;
    effect->unkA2 = 0x4000;
}

void effect_get_nameent_code_main(struct Effect *effect)
{
    float var_f4;
    struct Ball *temp_r6 = &ballInfo[modeCtrl.currPlayer];

    switch (effect->state)
    {
    case 0:
        var_f4 = 1.5 * (float)(1.0 - (effect->u_otherTimer / 60.0f));
        effect->u_otherTimer--;
        if (effect->u_otherTimer < 0)
        {
            effect->state = 1;
            effect->unk94.x = -0.05f;
        }
        break;
    default:
    case 1:
        var_f4 = 2.0f;
        if (effect->scale.x < 0.0)
            g_poolInfo.effectPool.statusList[effect->poolIndex] = 3;
        break;
    }
    effect->unk88.x *= 0.8;
    effect->unk88.y += 0.2 * (var_f4 - effect->unk88.y);
    effect->unk88.z *= 0.8;
    effect->pos.x = temp_r6->pos.x + effect->unk88.x;
    effect->pos.y = temp_r6->pos.y + effect->unk88.y;
    effect->pos.z = temp_r6->pos.z + effect->unk88.z;
    effect->scale.x += 0.2 * (effect->unk94.x - effect->scale.x);
    effect->scale.y += 0.2 * (effect->unk94.y - effect->scale.y);
    effect->scale.z += 0.2 * (effect->unk94.z - effect->scale.z);
    effect->unkA2 += 0x800;
    effect->unkA2 &= 0x7FFF;
}

void effect_get_nameent_code_draw(struct Effect *effect)
{
    Vec spC;
    int r3;

    mathutil_mtxA_from_mtxB_translate(&effect->pos);
    spC.x = 0.0f;
    spC.y = 0.0f;
    spC.z = 1.0f;
    mathutil_mtxA_rigid_inv_tf_vec(&spC, &spC);
    r3 = mathutil_atan2(spC.x, spC.z) + effect->unkA2;;
    mathutil_mtxA_rotate_y(r3 - 0x4000);
    mathutil_mtxA_scale_xyz(effect->scale.x, effect->scale.y, effect->scale.z);
    avdisp_set_bound_sphere_scale(effect->scale.y);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    avdisp_draw_model_culled_sort_translucent(effect->model);
}

void effect_get_nameent_code_destroy(struct Effect *effect) {}

void stobj_nameent_btn_init(struct Stobj *stobj)
{
    stobj->state = 0;
    stobj->unk8 |= 0x12;
    stobj->boundSphereRadius = 0.75 * stobj->model->boundSphereRadius;
    stobj->u_model_origin = stobj->model->boundSphereCenter;
    stobj->unkA8 = stobj->u_some_pos;
}

void stobj_nameent_btn_main(struct Stobj *arg0)
{
    switch (arg0->state)
    {
    case 0:
        break;
    case 1:
        arg0->state = 2;
        arg0->counter = 8;
        // fall through
    case 2:
        arg0->counter--;
        if (arg0->counter < 0)
            arg0->unk8 |= 2;
        break;
    }

    arg0->unk64.x += 0.1 * (arg0->unkA8.x - arg0->u_some_pos.x);
    arg0->unk64.y += 0.1 * (arg0->unkA8.y - arg0->u_some_pos.y);
    arg0->unk64.z += 0.1 * (arg0->unkA8.z - arg0->u_some_pos.z);
    arg0->unk64.x *= 0.9;
    arg0->unk64.y *= 0.9;
    arg0->unk64.z *= 0.9;
    arg0->u_some_pos.x += arg0->unk64.x;
    arg0->u_some_pos.y += arg0->unk64.y;
    arg0->u_some_pos.z += arg0->unk64.z;
}

void stobj_nameent_btn_draw(struct Stobj *arg0)
{
    float new_var;
    struct Color3f color;
    Vec pos;
    float temp_f31;
    float temp_f5;
    float temp_f1_2;
    struct Struct802C63D4 *data = arg0->extraData;

    color = *((struct Color3f *)data->unk8);
    if (color.r > 1.0)
        color.r = 1.0f;
    if (color.g > 1.0)
        color.g = 1.0f;
    if (color.b > 1.0)
        color.b = 1.0f;
    avdisp_set_post_mult_color(color.r, color.g, color.b, 1.0f);
    mathutil_mtxA_from_mtxB_translate(&arg0->u_some_pos);
    mathutil_mtxA_rotate_y(arg0->rotY);
    mathutil_mtxA_rotate_x(arg0->rotX);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    avdisp_draw_model_culled_sort_translucent(arg0->model);
    mathutil_mtxA_tf_point(&arg0->model->boundSphereCenter, &pos);
    if (pos.z < 0.0f)
    {
        temp_f1_2 = new_var = mathutil_vec_len(&pos);
        temp_f5 = (temp_f1_2 - 1.179) / temp_f1_2;
        pos.x *= temp_f5;
        pos.y *= temp_f5;
        pos.z *= temp_f5;
        temp_f31 = temp_f5 * (0.5f + (0.16666667f * (color.r + color.g + color.b)));
        mathutil_mtxA_from_translate(&pos);
        mathutil_mtxA_scale_s(temp_f31);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        avdisp_set_bound_sphere_scale(temp_f31);
        avdisp_draw_model_culled_sort_translucent(commonGma->modelEntries[0x5A].model);
    }
    u_reset_post_mult_color();
}

void stobj_nameent_btn_coli(struct Stobj *stobj, struct PhysicsBall *arg1)
{
    Point3d sp6C;
    struct PhysicsBall sp10;
    float temp_f2;
    struct Struct802C63D4 *temp_r3_2;

    mathutil_mtxA_from_translate(&stobj->position);
    mathutil_mtxA_rotate_y(stobj->rotY);
    mathutil_mtxA_rotate_x(stobj->rotX);
    stcoli_sub31(arg1, &sp10);
    temp_f2 = 0.7 + arg1->radius;
    sp6C.x = 0.0f;
    sp6C.y = 0.0f;
    if (sp10.pos.z > temp_f2)
        sp6C.z = 0.0f;
    else
    {
        sp6C.z = sp10.pos.z - temp_f2;
        sp10.vel.z += -0.05 * sp6C.z;
    }
    mathutil_mtxA_tf_vec(&sp6C, &sp6C);
    stobj->u_some_pos.x += sp6C.x;
    stobj->u_some_pos.y += sp6C.y;
    stobj->u_some_pos.z += sp6C.z;
    stobj->unk64.x = stobj->u_some_pos.x - stobj->unk7C.x;
    stobj->unk64.y = stobj->u_some_pos.y - stobj->unk7C.y;
    stobj->unk64.z = stobj->u_some_pos.z - stobj->unk7C.z;
    if (lbl_802F2208 == NULL)
    {
        if (mathutil_vec_distance(&stobj->unkA8, &stobj->u_some_pos) > 1.0)
        {
            temp_r3_2 = stobj->extraData;
            lbl_802F2208 = (void *)temp_r3_2;
            temp_r3_2->unk8[0] += 1.0;
            temp_r3_2->unk8[1] += 1.0;
            temp_r3_2->unk8[2] += 1.0;
            stobj->state = 1;
            stobj->unk8 &= 0xFFFFFFFD;
            if (sp10.vel.z < 0.25)
                sp10.vel.z = 0.25f;
            sp10.vel.y += 0.125;
            u_play_sound_0(0x33);
        }
    }
    stcoli_sub30(&sp10, arg1);
}

void stobj_nameent_btn_destroy(struct Stobj *stobj) {}

void stobj_nameent_btn_debug(struct Stobj *stobj) {}

void func_800AFC1C(struct MemcardGameData *arg0)
{
    memcpy(&arg0->unk5844.unk2C8, &lbl_802C6220, sizeof(arg0->unk5844.unk2C8));
}

void func_800AFC4C(struct MemcardGameData *arg0)
{
    int var_r0;

    memcpy(&lbl_802C6220, &arg0->unk5844.unk2C8, sizeof(lbl_802C6220));
    if (lbl_802C6220.unk0 != sizeof(lbl_802C6220))
        var_r0 = FALSE;
    else
        var_r0 = TRUE;
    if (!var_r0)
        func_800AEBA8();
}
