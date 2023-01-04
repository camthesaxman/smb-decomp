#include <dolphin.h>
#include <stdio.h>
#include <string.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "effect.h"
#include "info.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"
#include "stage.h"
#include "stobj.h"

u8 lbl_802C6220[0xF4];
FORCE_BSS_ORDER(lbl_802C6220)

struct GMAModel *lbl_802C6314[0x30];  // 0xF4
FORCE_BSS_ORDER(lbl_802C6314)

struct Struct802C63D4
{
    s8 unk0;
    u8 filler1[7];
    float unk8[3];
};  // size = 0x14

struct Struct802C63D4 lbl_802C63D4[0x30];  // 0x1B4
FORCE_BSS_ORDER(lbl_802C63D4)

struct
{
    s32 unk0;  // 0x574
    s32 unk4;  // 0x578
    s32 unk8;  // 0x57C
    char unkC[4];  // 0x580
    s32 unk10;  // 0x584
    u32 unk14;  // 0x588
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


struct Struct802C67D4 lbl_802C67D4[4];  // 0x5B4
FORCE_BSS_ORDER(lbl_802C67D4)

void func_800AD38C(void)
{
    func_800AEBA8();
}

u32 lbl_801D6B58[] =
{
    0x00002041,
    0x42434445,
    0x46474849,
    0x4A4B4C4D,
    0x4E4F5051,
    0x52535455,
    0x56575859,
    0x5A21262D,
    0x2E3F4039,
    0x38373635,
    0x34333231,
    0x30080000,
};

char *lbl_801D6C70[] =
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

char *lbl_801D6D30[] =
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

extern struct Struct802F2208 *lbl_802F2208;

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
    memset(lbl_802C6794.unkC, 0, 4);
    lbl_802F2208 = 0;
    buttonModel = find_stage_or_bg_model("BUTTON");

    nameIter = lbl_801D6C70;
    modelIter = lbl_802C6314;
    for (i = 48; i > 0; i--, nameIter++, modelIter++)
    {
        if (*nameIter == NULL)
            *modelIter = NULL;
        else
            *modelIter = find_stage_or_bg_model(*nameIter);
    }

    for (i = 0; i < 48; i++)
    {
        for (j = 0; j < 3; j++)
            lbl_802C63D4[i].unk8[j] = 0.25f;
    }

    memset(&stobj, 0, sizeof(stobj));
    stobj.type = SOT_NAMEENT_BTN;
    stobj.model = buttonModel;

    modelIter = lbl_802C6314;
    var_r24 = lbl_802C63D4;
    for (i2 = 0; i2 < 48; i2++, var_r24++, modelIter++)
    {
        if (*modelIter != 0)
        {
            stobj.model = buttonModel;
            i = (s16)((-65536.0f * (0.5f + i2)) / 48.0f);
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
    lbl_802C6794.unk10 = func_800AECCC(modeCtrl.difficulty, &lbl_802C67D4[modeCtrl.currPlayer]);
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

char lbl_802F1820[4] = "A.V";
char lbl_802F1824[4] = "---";

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
    if (!(gamePauseStatus & 0xA))
    {
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
                ball->flags |= 0x400;
            if (lbl_802C6794.unk4 == 60.0)
            {
                func_800AE8D0();
                ball->flags &= 0xFFFFFFBF;
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
            ball->flags &= 0xFFFFFBFF;
            lbl_802C6794.unk14 = 1;
            lbl_802C6794.unk20 = 0.0f;
            lbl_802C6794.unk24 = 60.0f;
            lbl_802C6794.unk2C = 36.0f;
            lbl_802C6794.unk34 = 187.0 + (31.0 * (float)lbl_802C6794.unk8);
            break;
        case 5:
            if (lbl_802F2208 != NULL)
                lbl_802C6794.unk0 = 6;
            if ((infoWork.flags & 2) || (infoWork.flags & 1))
            {
                lbl_802C6794.unk0 = 7;
                infoWork.flags &= 0xFFFFFFFD;
                infoWork.flags |= 1;
                ball->flags |= 0x1000;
                infoWork.flags |= 8;
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
                strcpy(lbl_802C6794.unkC, lbl_802F1820);
            if (func_800AEB28(lbl_802C6794.unkC) != 0)
                strcpy(lbl_802C6794.unkC, lbl_802F1824);
            lbl_802C6794.unk34 = 736.0f;
            memcpy(&lbl_802C67D4[modeCtrl.currPlayer].filler0, lbl_802C6794.unkC, 4);
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
            var_r28 = 48 - (lbl_802C6794.unk4 >> 1);
            for (i = 48; i > 0; i--)
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
            for (i = 48; i > 0; i--)
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
            for (i = 48; i > 0; i--, var_r28++)
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
}
