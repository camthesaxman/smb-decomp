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

void (*itemDrawFuncs[])(struct Item *) =
{
    item_coin_draw,
    func_80068C80,
    func_80068C80,
    func_80068C80,
    func_80068C80,
    func_80069B54,
    NULL,
};

void (*lbl_801BDCF8[])(struct Item *, struct Struct800690DC *) =
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
void (*lbl_801BDD4C[])(struct Item *) =
{
    func_800693EC,
    func_80068C90,
    func_80068C90,
    func_80068C90,
    func_80068C90,
    func_8006A5BC,
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
    memset(itemInfo, 0, sizeof(itemInfo));
    item = itemInfo;
    for (i = 0; i < ARRAY_COUNT(itemInfo); i++, item++)
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
         || (modeCtrl.levelSetFlags & (1 << 12))
         || (advDemoInfo.flags & (1 << 8)))
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
            itemDrawFuncs[item->unk4](item);
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
    if (r31->unk8 & (1 << 5))
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
         || !(item->unk8 & (1 << 5))
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

struct Struct801BDE80
{
    void (*unk0)(struct Item *);
    void (*unk4)(struct Item *);
    void (*unk8)(struct Item *);
    void (*unkC)(struct Item *, struct Struct800690DC *);
    void (*unk10)(struct Item *);
    void (*unk14)(struct Item *);
    void (*unk18)(struct Item *);
};

struct Struct801BDE80 lbl_801BDE80 =
{
    func_80068C78,
    func_80068C7C,
    func_80068C80,
    func_80068C84,
    func_80068C88,
    func_80068C8C,
    func_80068C90,
};

#pragma force_active on
void func_80068B1C(int a, struct Struct801BDE80 *b)
{
    struct Struct801BDE80 sp10;

    if (b == NULL)
        sp10 = lbl_801BDE80;
    else
    {
        sp10 = *b;
        if (sp10.unk0 == NULL)
            sp10.unk0 = lbl_801BDE80.unk0;
        if (sp10.unk4 == NULL)
            sp10.unk4 = lbl_801BDE80.unk4;
        if (sp10.unk8 == NULL)
            sp10.unk8 = lbl_801BDE80.unk8;
        if (sp10.unkC == NULL)
            sp10.unkC = lbl_801BDE80.unkC;
        if (sp10.unk10 == NULL)
            sp10.unk10 = lbl_801BDE80.unk10;
        if (sp10.unk14 == NULL)
            sp10.unk14 = lbl_801BDE80.unk14;
        if (sp10.unk18 == NULL)
            sp10.unk18 = lbl_801BDE80.unk18;
    }
    itemInitFuncs[a] = sp10.unk0;
    lbl_801BDCC0[a] = sp10.unk4;
    itemDrawFuncs[a] = sp10.unk8;
    lbl_801BDCF8[a] = sp10.unkC;
    lbl_801BDD14[a] = sp10.unk10;
    lbl_801BDD30[a] = sp10.unk14;
    lbl_801BDD4C[a] = sp10.unk18;
}
#pragma force_active reset

void func_80068C78(struct Item *item) {}

void func_80068C7C(struct Item *item) {}

void func_80068C80(struct Item *item) {}

void func_80068C84(struct Item *item, struct Struct800690DC *) {}

void func_80068C88(struct Item *item) {}

void func_80068C8C(struct Item *item) {}

void func_80068C90(struct Item *item) {}

/*
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
const double lbl_802F4718 = 0;
const double lbl_802F4720 = 0.0050000000000000001;
const double lbl_802F4728 = 30;
const float lbl_802F4730 = 0f;
const double lbl_802F4738 = 0.90000000000000002;
const double lbl_802F4740 = 0.064814814814814811;
const double lbl_802F4748 = 0.033333333333333333;
const float lbl_802F4750 = 1.1920928955078125e-07f;
const float lbl_802F4754 = 1f;
const float lbl_802F4758 = -0.40000000596046448f;
const float lbl_802F475C = 0.69999998807907104f;
const double lbl_802F4760 = 1.5;
const double lbl_802F4768 = 20;
const double lbl_802F4770 = 40;
const double lbl_802F4778 = 1;
const float lbl_802F4780 = 0.10000000149011612f;
const double lbl_802F4788 = 270;
const double lbl_802F4790 = 200;
const double lbl_802F4798 = 450;
const double lbl_802F47A0 = 0.5;
const float lbl_802F47A8 = 0.5f;
const double lbl_802F47B0 = 4503601774854144;
const double lbl_802F47B8 = 4503599627370496;
const double lbl_802F47C0 = 0.1875;
const double lbl_802F47C8 = 0.25;
const double lbl_802F47D0 = 0.92592592592592582;
const float lbl_802F47D8 = 0.60000002384185791f;
const double lbl_802F47E0 = 0.1388888888888889;
const double lbl_802F47E8 = 0.64814814814814814;

*/
