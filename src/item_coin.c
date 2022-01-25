#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

#include "../data/common.gma.h"

struct ModelLOD singleBananaModels[] =
{
    { OBJ_BANANA_01_LOD150, 150 },
    { OBJ_BANANA_01_LOD100, 100 },
    { OBJ_BANANA_01_LOD50,   50 },
    { OBJ_BANANA_01_LOD0,     0 },
    { -1, 0 },
};

struct ModelLOD bananaBunchModels[] =
{
    { OBJ_BANANA_02_LOD100, 100 },
    { OBJ_BANANA_02_LOD0,     0 },
    { -1, 0 },
};

struct Struct801BDEA0
{
    void **unk0;
    float unk4;
    s16 bananaValue;  // number of bananas given when collected
    s16 unkA;
    s16 pointValue;  // number of points given when collected
    s16 unkE;
    s16 unk10;
    s16 unk12;
};

void *singleBananaModelsPtr = singleBananaModels;
void *bananaBunchModelsPtr  = bananaBunchModels;

struct Struct801BDEA0 lbl_801BDEE0[] =
{
    { &singleBananaModelsPtr,  0.5,  1, 0,  100, 0, 1024,    0 },
    { &bananaBunchModelsPtr,  0.75, 10, 1, 1000, 0,  768,    0 },
    { &singleBananaModelsPtr,  0.5,  1, 0,  100, 0, 1024, -128 },
    { &bananaBunchModelsPtr,  0.75, 10, 1, 1000, 0, 1024, -128 },
};

void it_init_coin(struct Item *item)
{
    item->unk12 = -1;
    item->unkE = 1;
    item->unk1C = lbl_801BDEE0[item->unk6].unk0;
    item->unk8 = 0x22;
    item->unk14 = lbl_801BDEE0[item->unk6].unk4;
    item->unk18 = 0.25f;
    item->unk3E = lbl_801BDEE0[item->unk6].unkE;
    item->unk40 = lbl_801BDEE0[item->unk6].unk10;
    item->unk42 = lbl_801BDEE0[item->unk6].unk12;
    item->unk68 = commonGma->modelEntries[0x4E].modelOffset;
    item->unk78.r = 0x46;
    item->unk78.g = 0x47;
    item->unk78.b = 0x5F;
    item->unk7C.x = item->unk14;
    item->unk7C.y = item->unk14 * 0.8f;
    item->unk7C.z = item->unk14;
}

void func_80068D6C(struct Item *item)
{
    if (item->unkE == 0)
        return;
    switch (item->unkE)
    {
    case 1:
        item->unkE = 2;
        break;
    case 2:
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
    item->unk6C.z = -item->unk3A;
    item->unk7C.x = item->unk14;
    item->unk7C.y = item->unk14 * 0.7f;
}

void item_coin_draw(struct Item *item)
{
    float f31;
    float f30 = item->unk14;
    struct GMAModelHeader *model;
    Vec spC;

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&item->unk20);
    mathutil_mtxA_sq_from_mtx(lbl_802F1B3C->matrices[2]);
    mathutil_mtxA_rotate_y(item->unk3A);
    mathutil_mtxA_rotate_x(item->unk38);
    mathutil_mtxA_rotate_z(item->unk3C);
    model = find_item_model((void *)item->unk1C);
    f31 = (f30 / model->boundsRadius) * 1.5;
    if (g_frustum_test_maybe_2(&model->boundsCenter, model->boundsRadius, f31) == 0)
        return;
    if (f31 != 1.0)
        mathutil_mtxA_scale_xyz(f31, f31, f31);
    mathutil_get_mtxA_translate_alt(&spC);
    f30 = -(((spC.z + f30) + 0.1f) / f30);
    if (modeCtrl.unk28 == 1 && (currentBallStructPtr->flags & (1 << 12)))
        f30 = 0.25f;
    if (f30 > 0.0f)
    {
        g_avdisp_set_model_scale(f31);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        if (f30 < 1.0f)
        {
            g_avdisp_set_alpha(f30);
            g_avdisp_draw_model_3(model);
        }
        else
            g_avdisp_draw_model_2(model);
    }
}

void func_800690DC(struct Item *item, struct Struct800690DC *b)
{
    struct Struct8003C550 sp10;

    if (modeCtrl.unk28 == 1 && (currentBallStructPtr->flags & (1 << 12)))
        return;
    item->unk8 &= ~(1 << 1);
    item->unkE = 3;
    item->unk2C.y += item->unk14 * 0.1875;
    item->unk40 <<= 2;
    item->unk2C.x += b->unk1C.x * 0.25;
    item->unk2C.y += b->unk1C.y * 0.25;
    item->unk2C.z += b->unk1C.z * 0.25;
    if (item->unk5E < 0 && !(currentBallStructPtr->flags & (1 << 24)))
    {
        item->unk5E = lbl_801F3A58.timerCurr;
        give_bananas(lbl_801BDEE0[item->unk6].bananaValue);
        func_8004C7D4(lbl_801BDEE0[item->unk6].unkA, lbl_801BDEE0[item->unk6].pointValue);
        item->unkE = 0;
        item->unk8 |= 1;
        item->unk8 &= ~(1 << 1);
        memset(&sp10, 0, sizeof(sp10));
        sp10.unk8 = 8;
        sp10.unk14 = currentBallStructPtr->unk2E;
        mathutil_mtxA_from_mtx(movableStageParts[b->unk58].unk24);
        mathutil_mtxA_tf_point(&item->unk20, &sp10.unk34);
        mathutil_mtxA_tf_vec(&item->unk2C, &sp10.unk40);
        sp10.unk4C = item->unk38;
        sp10.unk4E = item->unk3A;
        sp10.unk50 = item->unk3C;
        sp10.unk30 = find_item_model((void *)item->unk1C);
        sp10.unk24 = (item->unk14 / sp10.unk30->boundsRadius) * 1.5;
        sp10.unk28 = sp10.unk24;
        sp10.unk2C = sp10.unk28;
        func_8004CF08(&sp10);
    }
    if (advDemoInfo.flags & (1 << 8))
        return;
    if (item->unk6 == 1)
    {
        g_play_sound(0x39);
        if ((lbl_801F3A58.unk0 & (1 << 11)) || !(lbl_801F3A58.unk0 & (1 << 4)))
            g_play_sound(0x2820);
        func_800554A4(1);
    }
    else
    {
        g_play_sound(3);
        if ((lbl_801F3A58.unk0 & (1 << 11)) || !(lbl_801F3A58.unk0 & (1 << 4)))
            g_play_sound(0x281F);
        func_800554A4(0);
    }
}

void func_80069390(struct Item *item) {}

void func_80069394(struct Item *item)
{
    if (item->unkE != 2)
    {
        item->unk20 = item->unk60->unk0;
        item->unk2C.x = 0.0f;
        item->unk2C.y = 0.0f;
        item->unk2C.z = 0.0f;
        it_init_coin(item);
    }
}

char wtfisthis[] =
{
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x0A,
    0x00
};

void func_800693EC(struct Item *item)
{
    func_8002FCC0(2, wtfisthis);
    func_8002FCC0(2, "Coin Value: %d\n", lbl_801BDEE0[item->unk6].bananaValue);
}

// needed to force float constant ordering
float item_coin_dummy(void) { return -480.0f; }

struct GMAModelHeader *find_item_model(struct ModelLOD **a)
{
    struct ModelLOD *r31 = *a;
    struct GMAModelHeader *model;
    int modelId;
    float f31;
    Vec spC;
    float f1;

    modelId = r31->modelId;
    model = commonGma->modelEntries[modelId].modelOffset;
    f31 = model->boundsRadius;
    mathutil_mtxA_tf_point(&model->boundsCenter, &spC);
    if (spC.z > f31)
    {
        while (r31->modelId > 0)
        {
            modelId = r31->modelId;
            r31++;
        }
        return commonGma->modelEntries[modelId].modelOffset;
    }
    if (spC.z > -0.1f)
        return model;
    f1 = (currentCameraStructPtr->sub28.height * -480.0f) * f31 / (spC.z * currentCameraStructPtr->sub28.unk38);
    while (r31->modelId > 0)
    {
        modelId = r31->modelId;
        if (r31->unk4 < f1)
            break;
        r31++;
    }
    return commonGma->modelEntries[modelId].modelOffset;
}
