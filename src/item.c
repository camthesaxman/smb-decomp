#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "course.h"
#include "item.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"
#include "stcoli.h"

struct Item itemPool[256];

s16 lbl_802F1FC8;

#pragma force_active on
char *itemNames[] =
{
    "IT_COIN",
    "IT_FGT_BANANA",
    "IT_MINI_RACE",
    "IT_FGT_POWER",
    "IT_FGT_PUNCH",
    "IT_PILOT",
};
#pragma force_active reset

enum
{
    IT_COIN,
    IT_FGT_BANANA,
    IT_MINI_RACE,
    IT_FGT_POWER,
    IT_FGT_PUNCH,
    IT_PILOT,
};

void (*itemInitFuncs[])(struct Item *) =
{
    item_coin_init,
    item_dummy_init,
    item_dummy_init,
    item_dummy_init,
    item_dummy_init,
    item_pilot_init,
    NULL,
};

void (*itemMainFuncs[])(struct Item *) =
{
    item_coin_main,
    item_dummy_main,
    item_dummy_main,
    item_dummy_main,
    item_dummy_main,
    item_pilot_main,
    NULL,
};

void (*itemDrawFuncs[])(struct Item *) =
{
    item_coin_draw,
    item_dummy_draw,
    item_dummy_draw,
    item_dummy_draw,
    item_dummy_draw,
    item_pilot_draw,
    NULL,
};

void (*itemCollectFuncs[])(struct Item *, struct PhysicsBall *) =
{
    item_coin_collect,
    item_dummy_collect,
    item_dummy_collect,
    item_dummy_collect,
    item_dummy_collect,
    item_pilot_collect,
    NULL,
};

void (*itemDestroyFuncs[])(struct Item *) =
{
    item_coin_destroy,
    item_dummy_destroy,
    item_dummy_destroy,
    item_dummy_destroy,
    item_dummy_destroy,
    item_pilot_destroy,
    NULL,
};

void (*lbl_801BDD30[])(struct Item *) =
{
    func_80069394,
    func_80068C8C,
    func_80068C8C,
    func_80068C8C,
    func_80068C8C,
    func_8006A564,
    NULL,
};

// unused?
#pragma force_active on
void (*itemDebugFuncs[])(struct Item *) =
{
    item_coin_debug,
    item_dummy_debug,
    item_dummy_debug,
    item_dummy_debug,
    item_dummy_debug,
    item_pilot_debug,
    NULL,
};

char string_STATUS___s_n[] = "STATUS: %s\n";
u8 lbl_801BDD74[] =
{
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x0A,
    0x00, 0x00, 0x00, 0x00,
};
char string_TYPE___s_n[]          = "TYPE: %s\n";
char string_POS__X__7_3f_n[]      = "POS: X,%7.3f\n";
char string______Y__7_3f_n[]      = "     Y,%7.3f\n";
char string______Z__7_3f_n[]      = "     Z,%7.3f\n";
char string_SPD__X__7_3f_n[]      = "SPD: X,%7.3f\n";
char string_ROT__X_0x_04X_n[]     = "ROT: X,0x%04X\n";
char string______Y_0x_04X_n[]     = "     Y,0x%04X\n";
char string______Z_0x_04X_n[]     = "     Z,0x%04X\n";
char string_ROTSPD__X_0x_04X_n[]  = "ROTSPD: X,0x%04X\n";
char string_________Y_0x_04X_n[]  = "        Y,0x%04X\n";
char string_________Z_0x_04X_n[]  = "        Z,0x%04X\n";
char string_COLI_RAD___7_3f_n[]   = "COLI RAD: %7.3f\n";
char string_Captured_Time___d_n[] = "Captured Time: %d\n";
char string_Flag__0x_08X_n[]      = "Flag: 0x%08X\n";
#pragma force_active reset

void ev_item_init(void)
{
    int i;
    struct Item *item;

    lbl_802F1FC8 = 0;
    memset(itemPool, 0, sizeof(itemPool));
    item = itemPool;
    for (i = 0; i < ARRAY_COUNT(itemPool); i++, item++)
    {
        item->id = i;
        item->unk2 = -1;
    }

    func_80030A50(&g_poolInfo.unk10);
    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MINI_FIGHT:
        if (is_bonus_stage(currStageId) != 0)
            spawn_stage_banana_items(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
        break;
    case GAMETYPE_MAIN_COMPETITION:
        if (is_bonus_stage(currStageId) != 0
         || gameMode == MD_SEL
         || (modeCtrl.courseFlags & (1 << 12))
         || (advDemoInfo.flags & (1 << 8)))
            spawn_stage_banana_items(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
        break;
    default:
        spawn_stage_banana_items(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
        break;
    }
}

void ev_item_main(void)
{
    int r31;
    struct Item *item;
    s8 *status;

    if (gamePauseStatus & 0xA)
        return;
    status = g_poolInfo.unk10.unkC;
    item = itemPool;
    for (r31 = g_poolInfo.unk10.unk8; r31 > 0; r31--, status++, item++)
    {
        if (*status != 0)
        {
            if (item->unkC != 0)
                item->unkC--;
            item->unk12--;
            if (item->unk12 == 0 || *status == 3)
            {
                itemDestroyFuncs[item->type](item);
                *status = 0;
            }
            else
                itemMainFuncs[item->type](item);
        }
    }
}

void ev_item_dest(void)
{
    int r29;
    struct Item *item;
    s8 *r27;

    r27 = g_poolInfo.unk10.unkC;
    item = itemPool;
    for (r29 = g_poolInfo.unk10.unk8; r29 > 0; r29--, r27++, item++)
    {
        if (*r27 != 0)
        {
            itemDestroyFuncs[item->type](item);
            *r27 = 0;
        }
    }
}

void item_draw(void)
{
    Mtx viewFromWorld;
    int itemCtr;
    struct Item *item;
    s8 *status;
    int animGrpId = -1;

    mathutil_mtx_copy(mathutilData->mtxB, viewFromWorld);
    status = g_poolInfo.unk10.unkC;
    item = itemPool;
    for (itemCtr = g_poolInfo.unk10.unk8; itemCtr > 0; itemCtr--, status++, item++)
    {
        if (*status != 0 && !(item->flags & ITEM_FLAG_INVISIBLE))
        {
            if (animGrpId != item->animGroupId)
            {
                mathutil_mtxA_from_mtx(viewFromWorld);
                mathutil_mtxA_mult_right(animGroups[item->animGroupId].transform);
                mathutil_mtxA_to_mtx(mathutilData->mtxB);
                animGrpId = item->animGroupId;
            }
            itemDrawFuncs[item->type](item);
        }
    }
    mathutil_mtx_copy(viewFromWorld, mathutilData->mtxB);
}

int func_80068474(struct Item *a)
{
    struct Item *r31;
    int r30 = pool_alloc(&g_poolInfo.unk10, 1);

    if (r30 < 0)
        return -1;
    r31 = &itemPool[r30];
    memcpy(r31, a, sizeof(struct Item));
    r31->id = r30;
    r31->unk5E = -1;
    itemInitFuncs[r31->type](r31);
    r31->unkC = 0;
    if (r31->unk18 <= 0.0)
        r31->unk18 = 1.0f;
    r31->prevPos = r31->pos;
    r31->unk58 = itemCollectFuncs[r31->type];
    r31->unk2 = lbl_802F1FC8;
    lbl_802F1FC8++;
    if (lbl_802F1FC8 < 0)
        lbl_802F1FC8 = 0;
    if (r31->flags & (1 << 5))
    {
        r31->unk64 = 0;
        r31->unk88 = 0.0f;
    }
    return r31->unk2;
}

void item_draw_shadows(void)
{
    int r28;
    struct Item *item;
    s8 *r26;
    int animGrpId = 0;
    int onStage;
    float f2;
    float f1;
    struct RaycastHit hit;
    Vec sp4C;
    Vec pos;
    struct Struct8009492C sp8;

    r26 = g_poolInfo.unk10.unkC;
    item = itemPool;
    for (r28 = g_poolInfo.unk10.unk8; r28 > 0; r28--, r26++, item++)
    {
        if (*r26 == 0
         || !(item->flags & (1 << 5))
         || (item->flags & ITEM_FLAG_INVISIBLE))
            continue;

        if (item->animGroupId == 0)
            pos = item->pos;
        else
        {
            if (animGrpId != item->animGroupId)
            {
                mathutil_mtxA_from_mtx(animGroups[item->animGroupId].transform);
                animGrpId = item->animGroupId;
            }
            mathutil_mtxA_tf_point(&item->pos, &pos);
        }

        mathutil_mtxA_push();
        onStage = raycast_stage_down(&pos, &hit, &sp4C);
        mathutil_mtxA_pop();

        if (onStage)
        {
            item->unk64 = 1;
            item->unk88 += (1.0f - item->unk88) * 0.15f;
        }
        else
        {
            if (item->unk64 == 0)
                continue;
            item->unk88 -= 0.033333333333333333;
            if (item->unk88 <= 0.0f)
            {
                item->unk64 = 0;
                item->unk88 = 0.0f;
                continue;
            }
        }

        if (!onStage)
        {
            sp8.unkC = item->unk6C;
            sp8.unk0.x = pos.x;
            sp8.unk0.y = pos.y + item->unk74;
            sp8.unk0.z = pos.z;
        }
        else
        {
            mathutil_vec_to_euler(&hit.normal, &sp8.unkC);
            item->unk6C.x = sp8.unkC.x;
            item->unk6C.y = sp8.unkC.y;
            sp8.unkC.z = item->unk6C.z;
            sp8.unk0 = hit.pos;
            item->unk74 = sp8.unk0.y - pos.y;
        }
        sp8.unk14 = item->unk7C;
        sp8.unk2C = item->shadowColor;
        f1 = item->unk88;
        sp8.unk2C.r *= f1;
        sp8.unk2C.g *= f1;
        sp8.unk2C.b *= f1;
        f2 = -0.0625f * item->unk74;
        if (f2 > 1.0f)
            continue;
        f1 = 1.0f + 3.0f * f2;
        sp8.unk14.x *= f1;
        sp8.unk14.y *= f1;
        sp8.unk14.z *= f1;
        if (f2 > 0.5f)
        {
            float f1 = 1.0f - ((f2 - 0.5f) * 2.0f);
            sp8.unk2C.r *= f1;
            sp8.unk2C.g *= f1;
            sp8.unk2C.b *= f1;
        }
        sp8.unk28 = item->shadowModel;
        sp8.unk20 = 0.075f;
        sp8.unk24 = 0.1f;
        func_8009492C(&sp8);
    }
}

void func_800689B4(int a)
{
    int r29;
    int r28;
    struct Item *item;
    s8 *r26;

    if (gamePauseStatus & 0xA)
        return;

    r26 = g_poolInfo.unk10.unkC;
    item = itemPool;
    for (r29 = g_poolInfo.unk10.unk8; r29 > 0; r29--, r26++, item++)
    {
        if (*r26 != 0 && item->unk5E >= 0 && item->unk5E <= a)
        {
            r28 = item->id;
            lbl_801BDD30[item->type](item);
            item->id = r28;
        }
    }
}

void spawn_stage_banana_items(struct StageAnimGroup *stageAg, int agCount)
{
    struct Item item;
    int i;
    int j;

    memset(&item, 0, sizeof(item));
    item.type = 0;
    for (i = 0; i < agCount; i++, stageAg++)
    {
        struct StageBanana *stageBanana = stageAg->bananas;

        for (j = 0; j < stageAg->bananaCount; j++, stageBanana++)
        {
            item.pos = stageBanana->pos;
            item.subType = stageBanana->type;
            item.animGroupId = i;
            item.stageBanana = stageBanana;
            func_80068474(&item);
        }
    }
}

struct ItemFuncs dummyItemFuncs =
{
    item_dummy_init,
    item_dummy_main,
    item_dummy_draw,
    item_dummy_collect,
    item_dummy_destroy,
    func_80068C8C,
    item_dummy_debug,
};

#pragma force_active on
void item_replace_type_funcs(int itemType, struct ItemFuncs *newFuncs)
{
    struct ItemFuncs funcs;

    if (newFuncs == NULL)
        funcs = dummyItemFuncs;
    else
    {
        funcs = *newFuncs;
        if (funcs.init == NULL)
            funcs.init = dummyItemFuncs.init;
        if (funcs.main == NULL)
            funcs.main = dummyItemFuncs.main;
        if (funcs.draw == NULL)
            funcs.draw = dummyItemFuncs.draw;
        if (funcs.collect == NULL)
            funcs.collect = dummyItemFuncs.collect;
        if (funcs.destroy == NULL)
            funcs.destroy = dummyItemFuncs.destroy;
        if (funcs.unk14 == NULL)
            funcs.unk14 = dummyItemFuncs.unk14;
        if (funcs.debug == NULL)
            funcs.debug = dummyItemFuncs.debug;
    }
    itemInitFuncs[itemType]    = funcs.init;
    itemMainFuncs[itemType]    = funcs.main;
    itemDrawFuncs[itemType]    = funcs.draw;
    itemCollectFuncs[itemType] = funcs.collect;
    itemDestroyFuncs[itemType] = funcs.destroy;
    lbl_801BDD30[itemType]     = funcs.unk14;
    itemDebugFuncs[itemType]   = funcs.debug;
}
#pragma force_active reset

void item_dummy_init(struct Item *item) {}

void item_dummy_main(struct Item *item) {}

void item_dummy_draw(struct Item *item) {}

void item_dummy_collect(struct Item *item, struct PhysicsBall *b) {}

void item_dummy_destroy(struct Item *item) {}

void func_80068C8C(struct Item *item) {}

void item_dummy_debug(struct Item *item) {}
