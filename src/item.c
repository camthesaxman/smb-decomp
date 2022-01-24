#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

struct Item itemInfo[256];

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

void (*itemInitFuncs[])(struct Item *) =
{
    it_init_coin,
    func_80068C78,
    func_80068C78,
    func_80068C78,
    func_80068C78,
    it_init_pilot,
    NULL,
};

void (*lbl_801BDCC0[])(struct Item *) =
{
    func_80068D6C,
    func_80068C7C,
    func_80068C7C,
    func_80068C7C,
    func_80068C7C,
    func_80069664,
    NULL,
};

void (*lbl_801BDCDC[])(struct Item *) =
{
    func_80068F64,
    func_80068C80,
    func_80068C80,
    func_80068C80,
    func_80068C80,
    func_80069B54,
    NULL,
};

void (*lbl_801BDCF8[])(struct Item *) =
{
    func_800690DC,
    func_80068C84,
    func_80068C84,
    func_80068C84,
    func_80068C84,
    func_80069F40,
    NULL,
};

void (*lbl_801BDD14[])(struct Item *) =
{
    func_80069390,
    func_80068C88,
    func_80068C88,
    func_80068C88,
    func_80068C88,
    func_8006A560,
    NULL,
};

extern void (*lbl_801BDD30[])(struct Item *);

void ev_item_init(void)
{
    int i;
    struct Item *item;

    lbl_802F1FC8 = 0;
    memset(itemInfo, 0, sizeof(itemInfo));
    item = itemInfo;
    for (i = 0; i < 256; i++, item++)
    {
        item->unk0 = i;
        item->unk2 = -1;
    }

    func_80030A50(spritePoolInfo.unk10);
    switch (modeCtrl.unk28)
    {
    case 4:
        if (func_800672D0(currStageId) != 0)
            func_80068A68(decodedStageLzPtr->collHdrs, decodedStageLzPtr->collHdrsCount);
        break;
    case 1:
        if (func_800672D0(currStageId) != 0
         || gameMode == MD_SEL
         || (modeCtrl.levelSetFlags & (1<<(31-0x13)))
         || (advDemoInfo.flags & (1<<(31-0x17))))
            func_80068A68(decodedStageLzPtr->collHdrs, decodedStageLzPtr->collHdrsCount);
        break;
    default:
        func_80068A68(decodedStageLzPtr->collHdrs, decodedStageLzPtr->collHdrsCount);
        break;
    }
}

void ev_item_main(void)
{
    int r31;
    struct Item *item;
    s8 *r29;

    if (gamePauseStatus & 0xA)
        return;
    r29 = spritePoolInfo.unk1C;
    item = itemInfo;
    for (r31 = spritePoolInfo.unk18; r31 > 0; r31--, r29++, item++)
    {
        if (*r29 != 0)
        {
            if (item->unkC != 0)
                item->unkC--;
            item->unk12--;
            if (item->unk12 == 0 || *r29 == 3)
            {
                lbl_801BDD14[item->unk4](item);
                *r29 = 0;
            }
            else
                lbl_801BDCC0[item->unk4](item);
        }
    }
}

void ev_item_dest(void)
{
    int r29;
    struct Item *item;
    s8 *r27;

    r27 = spritePoolInfo.unk1C;
    item = itemInfo;
    for (r29 = spritePoolInfo.unk18; r29 > 0; r29--, r27++, item++)
    {
        if (*r27 != 0)
        {
            lbl_801BDD14[item->unk4](item);
            *r27 = 0;
        }
    }
}

void item_draw(void)
{
    Mtx sp8;
    int r31;
    struct Item *item;
    s8 *r29;
    int r28 = -1;

    mathutil_mtx_copy(mathutilData->mtxB, sp8);
    r29 = spritePoolInfo.unk1C;
    item = itemInfo;
    for (r31 = spritePoolInfo.unk18; r31 > 0; r31--, r29++, item++)
    {
        if (*r29 != 0 && !(item->unk8 & 1))
        {
            if (r28 != item->unk5C)
            {
                mathutil_mtxA_from_mtx(sp8);
                mathutil_mtxA_mult_right(movableStageParts[item->unk5C].unk24);
                mathutil_mtxA_to_mtx(mathutilData->mtxB);
                r28 = item->unk5C;
            }
            lbl_801BDCDC[item->unk4](item);
        }
    }
    mathutil_mtx_copy(sp8, mathutilData->mtxB);
}

int func_80068474(struct Item *a)
{
    struct Item *r31;
    int r30 = pool_alloc(spritePoolInfo.unk10, 1);

    if (r30 < 0)
        return -1;
    r31 = &itemInfo[r30];
    memcpy(r31, a, sizeof(struct Item));
    r31->unk0 = r30;
    r31->unk5E = -1;
    itemInitFuncs[r31->unk4](r31);
    r31->unkC = 0;
    if (r31->unk18 <= 0.0)
        r31->unk18 = 1.0f;
    r31->unk44 = r31->unk20;
    r31->unk58 = lbl_801BDCF8[r31->unk4];
    r31->unk2 = lbl_802F1FC8;
    lbl_802F1FC8++;
    if (lbl_802F1FC8 < 0)
        lbl_802F1FC8 = 0;
    if (r31->unk8 & (1<<(31-0x1A)))
    {
        r31->unk64 = 0;
        r31->unk88 = 0.0f;
    }
    return r31->unk2;
}

void func_800685C4(void)
{
    int r28;
    struct Item *item;
    s8 *r26;
    int r25 = 0;
    int r23;
    float f2;
    float f1;

    struct Struct8003FB48 sp58;
    Vec sp4C;
    Vec sp40;
    struct Struct8009492C sp8;

    r26 = spritePoolInfo.unk1C;
    item = itemInfo;
    for (r28 = spritePoolInfo.unk18; r28 > 0; r28--, r26++, item++)
    {
        if (*r26 == 0
         || !(item->unk8 & (1<<(31-0x1A)))
         || (item->unk8 & 1))
            continue;

        if (item->unk5C == 0)
            sp40 = item->unk20;
        else
        {
            if (r25 != item->unk5C)
            {
                mathutil_mtxA_from_mtx(movableStageParts[item->unk5C].unk24);
                r25 = item->unk5C;
            }
            mathutil_mtxA_tf_point(&item->unk20, &sp40);
        }

        mathutil_mtxA_push();
        r23 = func_8003FB48(&sp40, &sp58, &sp4C);
        mathutil_mtxA_pop();

        if (r23 != 0)
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

        if (r23 == 0)
        {
            sp8.unkC = item->unk6C;
            sp8.unk0.x = sp40.x;
            sp8.unk0.y = sp40.y + item->unk74;
            sp8.unk0.z = sp40.z;
        }
        else
        {
            mathutil_vec_to_euler(&sp58.unk10, &sp8.unkC);
            item->unk6C.x = sp8.unkC.x;
            item->unk6C.y = sp8.unkC.y;
            sp8.unkC.z = item->unk6C.z;
            sp8.unk0 = sp58.unk4;
            item->unk74 = sp8.unk0.y - sp40.y;
        }
        sp8.unk14 = item->unk7C;
        sp8.unk2C = item->unk78;
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
        sp8.unk28 = item->unk68;
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

    r26 = spritePoolInfo.unk1C;
    item = itemInfo;
    for (r29 = spritePoolInfo.unk18; r29 > 0; r29--, r26++, item++)
    {
        if (*r26 != 0 && item->unk5E >= 0 && item->unk5E <= a)
        {
            r28 = item->unk0;
            lbl_801BDD30[item->unk4](item);
            item->unk0 = r28;
        }
    }
}

void func_80068A68(struct StageCollHdr *coll, int count)
{
    struct Item item;
    int i;
    int j;

    memset(&item, 0, sizeof(item));
    item.unk4 = 0;
    for (i = 0; i < count; i++, coll++)
    {
        struct StageCollHdr_child3 *r28 = coll->unk60;

        for (j = 0; j < coll->unk5C; j++, r28++)
        {
            item.unk20 = r28->unk0;
            item.unk6 = r28->unkC;
            item.unk5C = i;
            item.unk60 = r28;
            func_80068474(&item);
        }
    }
}

/*
const double lbl_802F4660 = 0;
const float lbl_802F4668 = 1f;
const float lbl_802F466C = 0f;
const float lbl_802F4670 = 0.15000000596046448f;
const double lbl_802F4678 = 0.033333333333333333;
const float lbl_802F4680 = -0.0625f;
const float lbl_802F4684 = 3f;
const float lbl_802F4688 = 0.5f;
const float lbl_802F468C = 2f;
const float lbl_802F4690 = 0.075000002980232239f;
const float lbl_802F4694 = 0.10000000149011612f;
const double lbl_802F4698 = 4503599627370496;
const float lbl_802F46A0 = 0.25f;
const float lbl_802F46A4 = 0.80000001192092896f;
const double lbl_802F46A8 = 0.033333333333333333;
const float lbl_802F46B0 = 1.1920928955078125e-07f;
const float lbl_802F46B4 = 1f;
const float lbl_802F46B8 = 1.9375f;
const double lbl_802F46C8 = 1;
const float lbl_802F46D0 = 0.10000000149011612f;
const float lbl_802F46D4 = 0f;
const double lbl_802F46D8 = 0.1875;
const double lbl_802F46E0 = 0.25;
const float lbl_802F46E8 = -480f;
const float lbl_802F46EC = -0.10000000149011612f;
const float lbl_802F46F0 = 0.25f;
const float lbl_802F46F4 = 0.80000001192092896f;
const float lbl_802F46F8 = -100f;
const double lbl_802F4700 = 0.0080000000000000002;
const double lbl_802F4708 = -1;
const double lbl_802F4710 = 60;
*/
