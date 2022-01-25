#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "gxutil.h"
#include "mathutil.h"

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
    void *unk0;
    s16 unk4;
    float unk8;
    s16 unkC;
    s16 unkA;
    s16 unk10;
    s16 unk12;
    s16 unk14;
};  // size = 0x18

void *lbl_802F0B38 = lbl_801BDF60;
void *lbl_802F0B3C = lbl_801BDF88;

struct Struct801BDFA0 lbl_801BDFA0[] =
{
    { &lbl_802F0B38, -1,  0.5, 1, 10, 0, 768, 0 },
    { &lbl_802F0B38, -1,  0.5, 1, 10, 0, 768, 0 },
    { &lbl_802F0B3C, -1, 0.75, 1, 20, 0, 768, 0 },
};

void it_init_pilot(struct Item *item)
{
    struct Struct801BDFA0 *r6;

    item->unk12 = -1;
    item->unkE = 1;
    if (item->unk6 < 3)
        item->unk1C = (void *)lbl_801BDFA0[item->unk6].unk0;
    else
        item->unk1C = (void *)lbl_802F1CB8->modelEntries[lbl_801BDFA0[item->unk6].unk4].modelOffset;
    item->unk8 = 0x22;
    item->unk14 = lbl_801BDFA0[item->unk6].unk8;
    item->unk18 = 0.25f;
    item->unk3E = lbl_801BDFA0[item->unk6].unk10;
    item->unk40 = lbl_801BDFA0[item->unk6].unk12;
    item->unk42 = lbl_801BDFA0[item->unk6].unk14;
    item->unk68 = commonGma->modelEntries[0x4E].modelOffset;
    item->unk78.r = 0x46;
    item->unk78.g = 0x47;
    item->unk78.b = 0x5F;
    item->unk7C.x = item->unk14;
    item->unk7C.y = item->unk14 * 0.8f;
    item->unk7C.z = item->unk14;
}

void func_80069664(struct Item *item)
{
    struct Ball *r29;
    float f31;

    r29 = currentBallStructPtr;
    if (item->unk64 != 0)
        f31 = item->unk20.y + item->unk74;
    else
        f31 = -100.0f;
    if (item->unkE == 0)
        return;
    switch (item->unkE)
    {
    case 1:
        item->unkE = 2;
        // fall through
    case 2:
        if (item->unk6 == 3 || item->unk6 == 1)
        {
            item->unk2C.y -= 0.008;
            if (item->unk20.y < -1.0)
                item->unkE = 6;
        }
        else if (item->unk6 == 4)
        {
            Vec sp24;

            sp24.x = r29->pos.x - item->unk20.x;
            sp24.y = r29->pos.y - item->unk20.y;
            sp24.z = r29->pos.z - item->unk20.z;
            if (mathutil_vec_mag(&sp24) < 60.0 && mathutil_vec_dot_prod(&r29->vel, &sp24) < 0.0)
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
                if (mathutil_vec_mag(&item->unk2C) > 0.064814814814814811)
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
        item->unkE = 4;
        // fall through
    case 4:
        item->unkE = 5;
        item->unk10 = 15;
        // fall through
    case 5:
        item->unk10--;
        if (item->unk10 < 0)
            item->unkE = 6;
        break;
    case 6:
        item->unk14 -= 0.033333333333333333;
        if (item->unk14 < 1.1920928955078125e-07f)
        {
            item->unkE = 0;
            item->unk8 |= 1;
            item->unk14 = 1.1920928955078125e-07f;
        }
        break;
    }

    item->unk44 = item->unk20;
    item->unk50 = item->unk38;
    item->unk52 = item->unk3A;
    item->unk54 = item->unk3C;

    item->unk20.x += item->unk2C.x;
    item->unk20.y += item->unk2C.y;
    item->unk20.z += item->unk2C.z;

    item->unk38 += item->unk3E;
    item->unk3A += item->unk40;
    item->unk3C += item->unk42;

    if (item->unk5C == 0)
        func_800390C8(2, &item->unk20, 1.0f);
    else
    {
        Vec spC;

        mathutil_mtxA_from_mtx(movableStageParts[item->unk5C].unk24);
        mathutil_mtxA_tf_point(&item->unk20, &spC);
        func_800390C8(2, &spC, 1.0f);
    }
    if (item->unk20.y - f31 < item->unk14)
    {
        item->unk20.y = f31 + item->unk14;
        if (item->unk2C.y < 0.0f)
            item->unk2C.y *= -0.4f;
    }
    item->unk6C.z = -item->unk3A;
    item->unk7C.x = item->unk14;
    item->unk7C.y = item->unk14 * 0.7f;
}

void func_80069B54(struct Item *item)
{
    float f31;
    float f30;
    struct GMAModelHeader *model;
    Vec spC;

    if (lbl_801EEC90.unk0 & (1 << 2))
        return;
    f30 = item->unk14;
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&item->unk20);
    mathutil_mtxA_sq_from_mtx(lbl_802F1B3C->matrices[2]);
    mathutil_mtxA_rotate_y(item->unk3A);
    mathutil_mtxA_rotate_x(item->unk38);
    mathutil_mtxA_rotate_z(item->unk3C);
    if (item->unk6 < 3)
        model = find_item_model(item->unk1C);
    else
        model = (void *)item->unk1C;
    if (item->unk6 == 3)
        f31 = 1.0f;
    else
        f31 = (f30 / model->boundsRadius) * 1.5;
    if (g_frustum_test_maybe_2(&model->boundsCenter, model->boundsRadius, f31) == 0)
        return;
    if (lbl_802F1FF6 == 6
     && (item->unk6 == 4 || item->unk6 == 3))
    {
        float f1 = (lbl_802F1FF0 - 20.0) / 40.0;

        if (f1 > 1.0)
            f1 = 1.0f;
        if (f1 < 0.0)
            f1 = 0.0f;
        f31 *= f1;
    }
    if (f31 != 1.0)
        mathutil_mtxA_scale_xyz(f31, f31, f31);
    mathutil_get_mtxA_translate_alt(&spC);
    f30 = -((spC.z + f30 + 0.1f) / f30);
    if (f30 > 0.0f)
    {
        if ((item->unk6 == 4 && -spC.z > 270.0) || (item->unk6 == 3 && -spC.z > 200.0))
        {
            int r30_;

            if (item->unk6 == 4)
            {
                if (-spC.z < 450.0)
                    r30_ = 0x86;
                else
                {
                    mathutil_mtxA_sq_from_identity();
                    mathutil_mtxA_scale_xyz(f31, f31, f31);
                    r30_ = 0x87;
                }
            }
            else
            {
                mathutil_mtxA_sq_from_identity();
                mathutil_mtxA_scale_xyz(f31, f31, f31);
                r30_ = 0x85;
            }
            g_avdisp_set_model_scale(f31);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            g_avdisp_draw_model_1(lbl_802F1CB8->modelEntries[r30_].modelOffset);
        }
        else
        {
            g_avdisp_set_model_scale(f31);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            if (f30 < 1.0f)
            {
                if (f30 < 0.5)
                    f30 = 0.5f;
                g_avdisp_set_alpha(f30);
                g_avdisp_draw_model_3(model);
            }
            else
                g_avdisp_draw_model_2(model);
        }
        if (item->unk6 == 2)
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
            g_avdisp_set_some_color_1(f1, f2, f3, 1.0f);
            mathutil_mtxA_sq_from_identity();
            mathutil_mtxA_scale_s(f30);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            g_avdisp_draw_model_1(lbl_802F1CB8->modelEntries[0x77].modelOffset);
            g_avdisp_set_some_color_1(1.0f, 1.0f, 1.0f, 1.0f);
        }
    }
}
