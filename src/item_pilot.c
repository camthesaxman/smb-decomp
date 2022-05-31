/**
 * item_pilot.c - Item behavior of collectable bananas in Monkey Target
 */
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "gma.h"
#include "gxutil.h"
#include "info.h"
#include "item.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

#include "../data/common.gma.h"

struct ModelLOD lbl_801BDF60[] =
{
    { OBJ_BANANA_01_LOD150, 150 },
    { OBJ_BANANA_01_LOD100, 100 },
    { OBJ_BANANA_01_LOD50,   50 },
    { OBJ_BANANA_01_LOD0,     0 },
    { -1, 0 },
};

struct ModelLOD lbl_801BDF88[] =
{
    { OBJ_BANANA_02_LOD100, 100 },
    { OBJ_BANANA_02_LOD0,     0 },
    { -1, 0 },
};

struct Struct801BDFA0
{
    struct ModelLOD **lodModelsPtr;
    s16 unk4;
    float unk8;
    s16 unkC;
    s16 unkE;
    s16 xrotSpeed;
    s16 yrotSpeed;
    s16 zrotSpeed;
};

struct ModelLOD *lbl_802F0B38 = lbl_801BDF60;
struct ModelLOD *lbl_802F0B3C = lbl_801BDF88;

struct Struct801BDFA0 pilotBananaInfo[] =
{
    { &lbl_802F0B38, -1,  0.5, 1, 10, 0, 768, 0 },
    { &lbl_802F0B38, -1,  0.5, 1, 10, 0, 768, 0 },
    { &lbl_802F0B3C, -1, 0.75, 1, 20, 0, 768, 0 },
    { NULL,          37,    1, 1, 20, 0,   0, 0 },
    { NULL,          77,    5, 1, 20, 0, 128, 0 },
};

s16 lbl_802F1FF6;
s16 lbl_802F1FF4;
s32 lbl_802F1FF0;
s16 lbl_802F1FEC;
s16 lbl_802F1FE4[4];
s16 lbl_802F1FE0;
float lbl_802F1FDC;
float lbl_802F1FD8;
s32 lbl_802F1FD4;
u32 lbl_802F1FD0;

static u32 lbl_80285A58[4];

u8 lbl_80285A80[0x30];
u8 lbl_80285A68[0x18];

void item_pilot_init(struct Item *item)
{
    struct Struct801BDFA0 *r6;

    item->unk12 = -1;
    item->state = 1;
    if (item->subtype < 3)
        item->unk1C = pilotBananaInfo[item->subtype].lodModelsPtr;
    else
        item->unk1C = minigameGma->modelEntries[pilotBananaInfo[item->subtype].unk4].modelOffset;
    item->flags = 0x22;
    item->unk14 = pilotBananaInfo[item->subtype].unk8;
    item->unk18 = 0.25f;
    item->xrotSpeed = pilotBananaInfo[item->subtype].xrotSpeed;
    item->yrotSpeed = pilotBananaInfo[item->subtype].yrotSpeed;
    item->zrotSpeed = pilotBananaInfo[item->subtype].zrotSpeed;
    item->shadowModel = commonGma->modelEntries[polyshadow01].modelOffset;
    item->shadowColor.r = 0x46;
    item->shadowColor.g = 0x47;
    item->shadowColor.b = 0x5F;
    item->unk7C.x = item->unk14;
    item->unk7C.y = item->unk14 * 0.8f;
    item->unk7C.z = item->unk14;
}

void item_pilot_main(struct Item *item)
{
    struct Ball *r29;
    float f31;

    r29 = currentBallStructPtr;
    if (item->unk64 != 0)
        f31 = item->unk20.y + item->unk74;
    else
        f31 = -100.0f;
    if (item->state == 0)
        return;
    switch (item->state)
    {
    case 1:
        item->state = 2;
        // fall through
    case 2:
        if (item->subtype == 3 || item->subtype == 1)
        {
            item->unk2C.y -= 0.008;
            if (item->unk20.y < -1.0)
                item->state = 6;
        }
        else if (item->subtype == 4)
        {
            Vec sp24;

            sp24.x = r29->pos.x - item->unk20.x;
            sp24.y = r29->pos.y - item->unk20.y;
            sp24.z = r29->pos.z - item->unk20.z;
            if (mathutil_vec_len(&sp24) < 60.0 && mathutil_vec_dot_prod(&r29->vel, &sp24) < 0.0)
            {
                Vec sp18;

                sp18.x = r29->vel.x * 60.0;
                sp18.y = r29->vel.y * 60.0;
                sp18.z = r29->vel.z * 60.0;
                sp24.x += sp18.x;
                sp24.y += sp18.y;
                sp24.z += sp18.z;
                mathutil_vec_normalize_len(&sp24);
                sp24.x = 0.005 * sp24.x;
                sp24.y = 0.005 * sp24.y;
                sp24.z = 0.005 * sp24.z;
                if (item->unk20.y < 30.0 && item->unk2C.y < 0.0)
                {
                    sp24.y = 0.0f;
                    item->unk2C.y *= 0.9;
                }
                item->unk2C.x += sp24.x;
                item->unk2C.y += sp24.y;
                item->unk2C.z += sp24.z;
                if (mathutil_vec_len(&item->unk2C) > 0.064814814814814811)
                {
                    mathutil_vec_normalize_len(&item->unk2C);
                    item->unk2C.x = 0.064814814814814811 * item->unk2C.x;
                    item->unk2C.y = 0.064814814814814811 * item->unk2C.y;
                    item->unk2C.z = 0.064814814814814811 * item->unk2C.z;
                }
            }
            else
            {
                item->unk2C.x = 0.9 * item->unk2C.x;
                item->unk2C.y = 0.9 * item->unk2C.y;
                item->unk2C.z = 0.9 * item->unk2C.z;
            }
        }
        break;
    case 3:
        item->state = 4;
        // fall through
    case 4:
        item->state = 5;
        item->unk10 = 15;
        // fall through
    case 5:
        item->unk10--;
        if (item->unk10 < 0)
            item->state = 6;
        break;
    case 6:
        item->unk14 -= 0.033333333333333333;
        if (item->unk14 < 1.1920928955078125e-07f)
        {
            item->state = 0;
            item->flags |= ITEM_FLAG_INVISIBLE;
            item->unk14 = 1.1920928955078125e-07f;
        }
        break;
    }

    item->unk44 = item->unk20;

    item->unk50 = item->xrot;
    item->unk52 = item->yrot;
    item->unk54 = item->zrot;

    item->unk20.x += item->unk2C.x;
    item->unk20.y += item->unk2C.y;
    item->unk20.z += item->unk2C.z;

    item->xrot += item->xrotSpeed;
    item->yrot += item->yrotSpeed;
    item->zrot += item->zrotSpeed;

    if (item->attachedTo == 0)
        func_800390C8(2, &item->unk20, 1.0f);
    else
    {
        Vec spC;

        mathutil_mtxA_from_mtx(animGroups[item->attachedTo].transform);
        mathutil_mtxA_tf_point(&item->unk20, &spC);
        func_800390C8(2, &spC, 1.0f);
    }
    if (item->unk20.y - f31 < item->unk14)
    {
        item->unk20.y = f31 + item->unk14;
        if (item->unk2C.y < 0.0f)
            item->unk2C.y *= -0.4f;
    }
    item->unk6C.z = -item->yrot;
    item->unk7C.x = item->unk14;
    item->unk7C.y = item->unk14 * 0.7f;
}

void item_pilot_draw(struct Item *item)
{
    float scale;
    float f30;
    struct GMAModel *model;
    Vec spC;

    if (lbl_801EEC90.unk0 & (1 << 2))
        return;
    f30 = item->unk14;
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&item->unk20);
    mathutil_mtxA_sq_from_mtx(lbl_802F1B3C->matrices[2]);
    mathutil_mtxA_rotate_y(item->yrot);
    mathutil_mtxA_rotate_x(item->xrot);
    mathutil_mtxA_rotate_z(item->zrot);
    if (item->subtype < 3)
        model = find_item_model(item->unk1C);
    else
        model = item->unk1C;
    if (item->subtype == 3)
        scale = 1.0f;
    else
        scale = (f30 / model->boundSphereRadius) * 1.5;
    if (u_test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius, scale) == 0)
        return;
    if (lbl_802F1FF6 == 6
     && (item->subtype == 4 || item->subtype == 3))
    {
        float f1 = (lbl_802F1FF0 - 20.0) / 40.0;

        if (f1 > 1.0)
            f1 = 1.0f;
        if (f1 < 0.0)
            f1 = 0.0f;
        scale *= f1;
    }
    if (scale != 1.0)
        mathutil_mtxA_scale_xyz(scale, scale, scale);
    mathutil_mtxA_get_translate_alt(&spC);
    f30 = -((spC.z + f30 + 0.1f) / f30);
    if (f30 > 0.0f)
    {
        if ((item->subtype == 4 && -spC.z > 270.0) || (item->subtype == 3 && -spC.z > 200.0))
        {
            int r30_;

            if (item->subtype == 4)
            {
                if (-spC.z < 450.0)
                    r30_ = 0x86;
                else
                {
                    mathutil_mtxA_sq_from_identity();
                    mathutil_mtxA_scale_xyz(scale, scale, scale);
                    r30_ = 0x87;
                }
            }
            else
            {
                mathutil_mtxA_sq_from_identity();
                mathutil_mtxA_scale_xyz(scale, scale, scale);
                r30_ = 0x85;
            }
            avdisp_set_bound_sphere_scale(scale);
            u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            avdisp_draw_model_unculled_sort_translucent(minigameGma->modelEntries[r30_].modelOffset);
        }
        else
        {
            avdisp_set_bound_sphere_scale(scale);
            u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            if (f30 < 1.0f)
            {
                if (f30 < 0.5)
                    f30 = 0.5f;
                avdisp_set_alpha(f30);
                avdisp_draw_model_unculled_sort_all(model);
            }
            else
                avdisp_draw_model_unculled_sort_none(model);
        }
        if (item->subtype == 2)
        {
            float f1, f2, f3;

            switch ((unpausedFrameCounter / 10) & 3)
            {
            case 0:
                f1 = 1.0f;
                f2 = 1.0f;
                f3 = 1.0f;
                break;
            case 1:
                f1 = 0.0f;
                f2 = 0.0f;
                f3 = 1.0f;
                break;
            case 2:
                f1 = 1.0f;
                f2 = 1.0f;
                f3 = 0.0f;
                break;
            default:
                f1 = 1.0f;
                f2 = 0.0f;
                f3 = 0.0f;
                break;
            }
            f30 = 1.0 + (((unpausedFrameCounter + item->unk2 * 10) % 60) * 0.033333333333333333);
            avdisp_set_post_multiply_color(f1, f2, f3, 1.0f);
            mathutil_mtxA_sq_from_identity();
            mathutil_mtxA_scale_s(f30);
            u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            avdisp_draw_model_unculled_sort_translucent(minigameGma->modelEntries[0x77].modelOffset);
            avdisp_set_post_multiply_color(1.0f, 1.0f, 1.0f, 1.0f);
        }
    }
}

void item_pilot_collect(struct Item *item, struct PhysicsBall *ball)
{
    item->flags &= ~(1 << 1);
    item->state = 3;
    item->unk2C.y += item->unk14 * 0.1875;
    item->yrotSpeed <<= 2;
    item->unk2C.x += ball->vel.x * 0.25;
    item->unk2C.y += ball->vel.y * 0.25;
    item->unk2C.z += ball->vel.z * 0.25;
    if (item->subtype == 0 || item->subtype == 1 || item->subtype == 2)
    {
        if (item->unk5E < 0
         && (!(infoWork.flags & INFO_FLAG_04) || (infoWork.flags & INFO_FLAG_11)))
        {
            struct Struct8003C550 sp178;

            item->unk5E = infoWork.timerCurr;
            lbl_80285A58[modeCtrl.currPlayer] += pilotBananaInfo[item->subtype].unkE;
            if (lbl_802F1FD0 & (1 << 3))
            {
                if (++lbl_802F1FE4[modeCtrl.currPlayer] >= 6)
                    lbl_802F1FE4[modeCtrl.currPlayer] = 1;
            }
            item->state = 0;
            item->flags |= ITEM_FLAG_INVISIBLE;
            item->flags &= ~(1 << 1);
            memset(&sp178, 0, sizeof(sp178));
            sp178.unk8 = 8;
            sp178.unk14 = currentBallStructPtr->playerId;
            mathutil_mtxA_from_mtx(animGroups[ball->animGroupId].transform);
            mathutil_mtxA_tf_point(&item->unk20, &sp178.unk34);
            mathutil_mtxA_tf_vec(&item->unk2C, &sp178.unk40);
            sp178.unk4C = item->xrot;
            sp178.unk4E = item->yrot;
            sp178.unk50 = item->zrot;
            sp178.unk30 = find_item_model(item->unk1C);
            sp178.unk24.x = (item->unk14 / sp178.unk30->boundSphereRadius) * 1.5;
            sp178.unk24.y = sp178.unk24.x;
            sp178.unk24.z = sp178.unk24.y;
            u_spawn_effect_object(&sp178);
        }
    }
    else if (item->subtype == 3)
    {
        struct Ball *r31 = currentBallStructPtr;
        struct Struct8003C550 spCC;

        lbl_802F1FD0 |= 0x42;
        if (lbl_802F1FF6 == 14)
            lbl_802F1FF4 = 15;
        u_play_sound(0x10B);
        u_play_sound(0x1C);
        func_800B60F4(lbl_80206BD0[r31->playerId], 1, 0x1C);
        ball->vel.y += 0.92592592592592582;
        lbl_802F1FE0 = 0x78;
        lbl_802F1FD8 = 0.6f;
        memset(&spCC, 0, sizeof(spCC));
        spCC.unk8 = 0x27;
        spCC.unk14 = r31->playerId;
        spCC.unk34.x = r31->pos.x;
        spCC.unk34.y = r31->pos.y - 1.0;
        spCC.unk34.z = r31->pos.z;
        spCC.unk24 = (Vec){3.5, 4.5, 3.5};
        u_spawn_effect_object(&spCC);
    }
    else if (item->subtype == 4)
    {
        struct Ball *r31 = currentBallStructPtr;
        struct Struct8003C550 sp20;
        int i;

        lbl_802F1FD0 |= 0x82;
        u_play_sound(0x2F);
        u_play_sound(0x1C);
        if (lbl_802F1FF6 == 14)
            u_play_sound(0x16C);
        func_800B60F4(lbl_80206BD0[r31->playerId], 1, 0x1C);
        ball->vel.y += 0.1388888888888889;
        ball->vel.x += (rand() / 32767.0f) * 0.64814814814814814;
        ball->vel.z += (rand() / 32767.0f) * 0.64814814814814814;
        lbl_802F1FD8 = 0.6f;
        lbl_802F1FDC = 1.0f;
        memset(&sp20, 0, sizeof(sp20));
        sp20.unk8 = 0x13;
        sp20.unk14 = r31->playerId;
        sp20.unk34 = r31->pos;
        for (i = 0; i < 30; i++)
        {
            sp20.unk40.x = ball->vel.x + ((rand() / 32767.0f) * 0.2 - 0.1);
            sp20.unk40.y = ball->vel.y + 0.1 + ((rand() / 32767.0f) * 0.2 - 0.1);
            sp20.unk40.z = ball->vel.z + ((rand() / 32767.0f) * 0.2 - 0.1);
            u_spawn_effect_object(&sp20);
        }
    }
    if (gameSubmode == 2)
        return;
    if (item->subtype == 2)
    {
        u_play_sound(0x39);
        if ((infoWork.flags & INFO_FLAG_11) || !(infoWork.flags & INFO_FLAG_04))
            u_play_sound(0x2820);
    }
    else if (item->subtype == 0 || item->subtype == 1)
    {
        u_play_sound(3);
        if ((infoWork.flags & INFO_FLAG_11) || !(infoWork.flags & INFO_FLAG_04))
            u_play_sound(0x281F);
    }
}

void item_pilot_destroy(struct Item *item) {}

void func_8006A564(struct Item *item)
{
    if (item->state != 2)
    {
        item->unk20 = item->unk60->pos;
        item->unk2C.x = 0.0f;
        item->unk2C.y = 0.0f;
        item->unk2C.z = 0.0f;
        item_pilot_init(item);
    }
}

char lbl_801BE018[] =
{
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x0A,
    0x00
};

void item_pilot_debug(struct Item *item)
{
    func_8002FCC0(2, lbl_801BE018);
    func_8002FCC0(2, "Coin Value: %d\n", pilotBananaInfo[item->subtype].unkC);
}
