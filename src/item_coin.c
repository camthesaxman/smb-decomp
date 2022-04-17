/**
 * item_coin.c - Item behavior of collectable bananas in the main game
 */
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "info.h"
#include "item.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"
#include "gma.h"

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
    struct ModelLOD **lodModelsPtr;
    float unk4;
    s16 bananaValue;  // number of bananas given when collected
    s16 unkA;
    s16 pointValue;  // number of points given when collected
    s16 xrotSpeed;
    s16 yrotSpeed;
    s16 zrotSpeed;
};

struct ModelLOD *singleBananaModelsPtr = singleBananaModels;
struct ModelLOD *bananaBunchModelsPtr  = bananaBunchModels;

struct Struct801BDEA0 bananaInfo[] =
{
    { &singleBananaModelsPtr,  0.5,  1, 0,  100, 0, 1024,    0 },
    { &bananaBunchModelsPtr,  0.75, 10, 1, 1000, 0,  768,    0 },
    { &singleBananaModelsPtr,  0.5,  1, 0,  100, 0, 1024, -128 },
    { &bananaBunchModelsPtr,  0.75, 10, 1, 1000, 0, 1024, -128 },
};

void item_coin_init(struct Item *item)
{
    item->unk12 = -1;
    item->state = 1;
    item->unk1C = bananaInfo[item->subtype].lodModelsPtr;
    item->unk8 = 0x22;
    item->unk14 = bananaInfo[item->subtype].unk4;
    item->unk18 = 0.25f;
    item->xrotSpeed = bananaInfo[item->subtype].xrotSpeed;
    item->yrotSpeed = bananaInfo[item->subtype].yrotSpeed;
    item->zrotSpeed = bananaInfo[item->subtype].zrotSpeed;
    item->shadowModel = commonGma->modelEntries[polyshadow01].modelOffset;
    item->shadowColor.r = 0x46;
    item->shadowColor.g = 0x47;
    item->shadowColor.b = 0x5F;
    item->unk7C.x = item->unk14;
    item->unk7C.y = item->unk14 * 0.8f;
    item->unk7C.z = item->unk14;
}

void item_coin_main(struct Item *item)
{
    if (item->state == 0)
        return;
    switch (item->state)
    {
    case 1:
        item->state = 2;
        break;
    case 2:
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
            item->unk8 |= 1;
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
    item->unk6C.z = -item->yrot;
    item->unk7C.x = item->unk14;
    item->unk7C.y = item->unk14 * 0.7f;
}

void item_coin_draw(struct Item *item)
{
    float scale;
    float f30 = item->unk14;
    struct GMAModel *model;
    Vec spC;

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&item->unk20);
    mathutil_mtxA_sq_from_mtx(lbl_802F1B3C->matrices[2]);
    mathutil_mtxA_rotate_y(item->yrot);
    mathutil_mtxA_rotate_x(item->xrot);
    mathutil_mtxA_rotate_z(item->zrot);
    model = find_item_model(item->unk1C);
    scale = (f30 / model->boundSphereRadius) * 1.5;
    if (g_test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius, scale) == 0)
        return;
    if (scale != 1.0)
        mathutil_mtxA_scale_xyz(scale, scale, scale);
    mathutil_mtxA_get_translate_alt(&spC);
    f30 = -(((spC.z + f30) + 0.1f) / f30);
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION && (currentBallStructPtr->flags & (1 << 12)))
        f30 = 0.25f;
    if (f30 > 0.0f)
    {
        g_avdisp_set_model_scale(scale);
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
        if (f30 < 1.0f)
        {
            g_avdisp_set_alpha(f30);
            avdisp_draw_model_unculled_sort_all(model);
        }
        else
            avdisp_draw_model_unculled_sort_none(model);
    }
}

void item_coin_collect(struct Item *item, struct Struct800690DC *b)
{
    struct Struct8003C550 sp10;

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION && (currentBallStructPtr->flags & (1 << 12)))
        return;
    item->unk8 &= ~(1 << 1);
    item->state = 3;
    item->unk2C.y += item->unk14 * 0.1875;
    item->yrotSpeed <<= 2;
    item->unk2C.x += b->unk1C.x * 0.25;
    item->unk2C.y += b->unk1C.y * 0.25;
    item->unk2C.z += b->unk1C.z * 0.25;
    if (item->unk5E < 0 && !(currentBallStructPtr->flags & (1 << 24)))
    {
        item->unk5E = infoWork.timerCurr;
        give_bananas(bananaInfo[item->subtype].bananaValue);
        g_give_points(bananaInfo[item->subtype].unkA, bananaInfo[item->subtype].pointValue);
        item->state = 0;
        item->unk8 |= 1;
        item->unk8 &= ~(1 << 1);
        memset(&sp10, 0, sizeof(sp10));
        sp10.unk8 = 8;
        sp10.unk14 = currentBallStructPtr->unk2E;
        mathutil_mtxA_from_mtx(animGroups[b->unk58].transform);
        mathutil_mtxA_tf_point(&item->unk20, &sp10.unk34);
        mathutil_mtxA_tf_vec(&item->unk2C, &sp10.unk40);
        sp10.unk4C = item->xrot;
        sp10.unk4E = item->yrot;
        sp10.unk50 = item->zrot;
        sp10.unk30 = find_item_model((void *)item->unk1C);
        sp10.unk24.x = (item->unk14 / sp10.unk30->boundSphereRadius) * 1.5;
        sp10.unk24.y = sp10.unk24.x;
        sp10.unk24.z = sp10.unk24.y;
        g_spawn_effect_object(&sp10);
    }
    if (advDemoInfo.flags & (1 << 8))
        return;
    if (item->subtype == 1)
    {
        g_play_sound(0x39);
        if ((infoWork.unk0 & (1 << 11)) || !(infoWork.unk0 & (1 << 4)))
            g_play_sound(0x2820);
        background_interact(1);
    }
    else
    {
        g_play_sound(3);
        if ((infoWork.unk0 & (1 << 11)) || !(infoWork.unk0 & (1 << 4)))
            g_play_sound(0x281F);
        background_interact(0);
    }
}

void item_coin_destroy(struct Item *item) {}

void func_80069394(struct Item *item)
{
    if (item->state != 2)
    {
        item->unk20 = item->unk60->pos;
        item->unk2C.x = 0.0f;
        item->unk2C.y = 0.0f;
        item->unk2C.z = 0.0f;
        item_coin_init(item);
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

void item_coin_debug(struct Item *item)
{
    func_8002FCC0(2, wtfisthis);
    func_8002FCC0(2, "Coin Value: %d\n", bananaInfo[item->subtype].bananaValue);
}

// needed to force float constant ordering
float item_coin_dummy(void) { return -480.0f; }

struct GMAModel *find_item_model(struct ModelLOD **a)
{
    struct ModelLOD *r31 = *a;
    struct GMAModel *model;
    int modelId;
    float f31;
    Vec spC;
    float f1;

    modelId = r31->modelId;
    model = commonGma->modelEntries[modelId].modelOffset;
    f31 = model->boundSphereRadius;
    mathutil_mtxA_tf_point(&model->boundSphereCenter, &spC);
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
    f1 = (currentCameraStructPtr->sub28.vp.height * -480.0f) * f31 / (spC.z * currentCameraStructPtr->sub28.unk38);
    while (r31->modelId > 0)
    {
        modelId = r31->modelId;
        if (r31->distance < f1)
            break;
        r31++;
    }
    return commonGma->modelEntries[modelId].modelOffset;
}
