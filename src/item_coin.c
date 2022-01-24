#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "background.h"
#include "ball.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

u8 lbl_801BDEA0[] =
{
    0x00, 0x00, 0x00, 0x23,
    0x43, 0x16, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x22,
    0x42, 0xC8, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x24,
    0x42, 0x48, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x21,
    0x00, 0x00, 0x00, 0x00,
    0xFF, 0xFF, 0xFF, 0xFF,
    0x00, 0x00, 0x00, 0x00,
};

u8 lbl_801BDEC8[] =
{
    0x00, 0x00, 0x00, 0x26,
    0x42, 0xC8, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x25,
    0x00, 0x00, 0x00, 0x00,
    0xFF, 0xFF, 0xFF, 0xFF,
    0x00, 0x00, 0x00, 0x00,
};

struct Struct801BDEA0
{
    void **unk0;
    float unk4;
    s16 unk8;  // banana value?
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
};

void *lbl_802F0B30 = lbl_801BDEA0;
void *lbl_802F0B34 = lbl_801BDEC8;

struct Struct801BDEA0 lbl_801BDEE0[] =
{
    { &lbl_802F0B30,  0.5,  1, 0,  100, 0, 1024,    0 },
    { &lbl_802F0B34, 0.75, 10, 1, 1000, 0,  768,    0 },
    { &lbl_802F0B30,  0.5,  1, 0,  100, 0, 1024, -128 },
    { &lbl_802F0B34, 0.75, 10, 1, 1000, 0, 1024, -128 },
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

extern struct GMAModelHeader *func_80069454(void *);

void func_80068F64(struct Item *item)
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
    model = func_80069454(item->unk1C);
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
        give_bananas(lbl_801BDEE0[item->unk6].unk8);
        func_8004C7D4(lbl_801BDEE0[item->unk6].unkA, lbl_801BDEE0[item->unk6].unkC);
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
        sp10.unk30 = func_80069454(item->unk1C);
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
    func_8002FCC0(2, "Coin Value: %d\n", lbl_801BDEE0[item->unk6].unk8);
}
