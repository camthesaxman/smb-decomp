#include <stdlib.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "gxutil.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"

struct Struct801C5758
{
    u32 unk0;
    s32 unk4;
    u16 unk8;
    u16 unkA;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
    s32 unk1C;
    float unk20;
    float unk24;
    float unk28;
    float unk2C;
    u16 unk30;
    u16 unk32;
    s16 unk34;
    s16 unk36;
    s16 unk38;
    u16 unk3A;
    float unk3C;
    float unk40;
    float unk44;
    float unk48;
    u32 unk4C;
    u32 unk50;
    u32 unk54;
    u32 unk58;
    u32 unk5C;
};

struct Struct801C5758 lbl_801C5758 =
{
    0xFFFFFFFF,  // 0
    0,
    0, 0,
    1.0f,
    -0.8666666746139526f,  // 10
    -0.17499999701976776f,
    0.23333333432674408f,
    0,
    0.26499998569488525f,  // 20
    0.0f,
    0.0f,
    0.0f,
    0x0280, 0x01C0,  // 30
    0, 0,
    0, 0,
    0.0f,
    0.0f,  // 40
    0.0f,
    0.0f,
    0x00FFFFFF,
    0x00FFFFFF,  // 50
    0x00FFE080,
    0x00FFFFFF,
    0,
};

void ev_minimap_init(void)
{
    func_8008D36C(NLOBJ_MODEL(naomiCommonObj, 11), 0x1BFFFFFF, 0x24000000);
    func_8008D36C(NLOBJ_MODEL(naomiCommonObj, 12), 0x1FFFFFFF, 0xE0000000);
    func_8008D330(NLOBJ_MODEL(naomiCommonObj, 13), 0xF8FFFFFF, 0x02000000);
    func_8008D36C(NLOBJ_MODEL(naomiCommonObj, 13), 0x1FFFFFFF, 0xE0000000);
    func_8008D3A8(NLOBJ_MODEL(naomiCommonObj, 13), 0x90EFFFFF, 0x08000000);
    if (gameSubmode == 13)
    {
        lbl_801C5758.unk32 = 0x1A8;
        lbl_801C5758.unk10 = -0.76666665077209473f;
    }
    else
    {
        lbl_801C5758.unk32 = 0x1C0;
        lbl_801C5758.unk10 = -0.86666667461395264f;
    }
}

extern struct
{
    Vec unk0;
    float unkC;
} lbl_80292D30;

void ev_minimap_main(void)
{
    struct Ball *r4 = currentBallStructPtr;
    float f1;
    float f3;
    Vec sp8;

    if (gamePauseStatus & 0xA)
        return;
    if (lbl_801C5758.unk4 == 0)
        return;

    switch (lbl_801C5758.unk4)
    {
    case 1:
        lbl_801C5758.unk34 -= 6;
        lbl_801C5758.unk38 -= 71;
        if (lbl_801C5758.unk34 < 0)
        {
            lbl_801C5758.unk4 = 0;
            lbl_801C5758.unk34 = 0;
        }
        break;
    case 2:
        lbl_801C5758.unk38 -= lbl_801C5758.unk38 >> 4;
        break;
    case 3:
        lbl_801C5758.unk34 += 8;
        lbl_801C5758.unk38 += 33;
        if (lbl_801C5758.unk34 > 0x140)
        {
            lbl_801C5758.unk4 = 2;
            lbl_801C5758.unk34 = 0x140;
        }
        break;
    }

    lbl_801C5758.unk8 = lbl_801C5758.unk34 * 0x3000 / 0x140 + 0x1000;
    lbl_801C5758.unk36 += lbl_801C5758.unk38;
    f1 = lbl_80292D30.unkC;
    switch (lbl_801C5758.unk1C)
    {
    case 0:
        if (f1 > 18.0)
            f3 = 0.14722222089767456f;
        else
            f3 = 2.6500000000000004 / f1;
        sp8 = r4->pos;
        lbl_801C5758.unk40 = 0.0f;
        lbl_801C5758.unk48 = 0.6f;
        break;
    case 1:
        f3 = 1.3250000000000002 / f1;
        sp8 = lbl_80292D30.unk0;
        sp8.y = r4->pos.y;
        lbl_801C5758.unk40 = 1.0f;
        lbl_801C5758.unk48 = 0.0f;
        break;
    case 2:
    default:
        if (f1 > 18.0)
            f3 = 0.29444444179534912f;
        else
            f3 = 5.3000000000000007 / f1;
        sp8 = r4->pos;
        lbl_801C5758.unk40 = 0.0f;
        lbl_801C5758.unk48 = 0.6f;
        break;
    }

    lbl_801C5758.unk20 += (f3 - lbl_801C5758.unk20) * 0.1;
    lbl_801C5758.unk24 += (sp8.x - lbl_801C5758.unk24) * 0.1;
    lbl_801C5758.unk28 += (sp8.y - lbl_801C5758.unk28) * 0.1;
    lbl_801C5758.unk2C += (sp8.z - lbl_801C5758.unk2C) * 0.1;

    if (lbl_801C5758.unk3C < lbl_801C5758.unk40)
    {
        lbl_801C5758.unk3C += 0.066666666666666666;
        if (lbl_801C5758.unk3C > lbl_801C5758.unk40)
            lbl_801C5758.unk3C = lbl_801C5758.unk40;
    }
    else if (lbl_801C5758.unk3C > lbl_801C5758.unk40)
    {
        lbl_801C5758.unk3C -= 0.033333333333333333;
        if (lbl_801C5758.unk3C < lbl_801C5758.unk40)
            lbl_801C5758.unk3C = lbl_801C5758.unk40;
    }

    if (lbl_801C5758.unk44 < lbl_801C5758.unk48)
    {
        lbl_801C5758.unk44 += 0.066666666666666666;
        if (lbl_801C5758.unk44 > lbl_801C5758.unk48)
            lbl_801C5758.unk44 = lbl_801C5758.unk48;
    }
    else if (lbl_801C5758.unk44 > lbl_801C5758.unk48)
    {
        lbl_801C5758.unk44 -= 0.033333333333333333;
        if (lbl_801C5758.unk44 < lbl_801C5758.unk48)
            lbl_801C5758.unk44 = lbl_801C5758.unk48;
    }
}

void ev_minimap_dest(void)
{
    lbl_801C5758.unk4 = 0;
    lbl_801C5758.unk34 = 0;
    lbl_801C5758.unk38 = 0;
    lbl_801C5758.unk3C = 0.0f;
}

void func_800846B0(int a)
{
    switch (a)
    {
    case 0:
        lbl_801C5758.unk34 = 0;
        lbl_801C5758.unk3C = 0.0f;
        break;
    case 2:
        lbl_801C5758.unk34 = 0x140;
        break;
    case 3:
        if (lbl_801C5758.unk34 == 0)
            lbl_801C5758.unk38 = (rand() & 0x3FF) + 0x200;
        break;
    case 4:
        a = lbl_801C5758.unk4;
        lbl_801C5758.unk34 = 0;
        lbl_801C5758.unk3C = 0.0f;
        lbl_801C5758.unk1C = 0;
        lbl_801C5758.unk20 = 0.26499998569488525f;
        break;
    }

    if (lbl_801C5758.unk4 == 0)
    {
        lbl_801C5758.unk24 = 0.0f;
        lbl_801C5758.unk28 = 0.0f;
        lbl_801C5758.unk2C = 0.0f;
    }
    lbl_801C5758.unk4 = a;
}

void func_80084794(void *unused)
{
    func_800463E8(&lbl_80292D30.unk0, &lbl_80292D30.unkC);
}

void minimap_change_size(void)
{
    if (lbl_801C5758.unk4 != 0)
    {
        lbl_801C5758.unk1C++;
        if (lbl_801C5758.unk1C > 2)
            lbl_801C5758.unk1C = 0;
    }
}

struct Struct800847FC
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
};

void func_800847FC(struct Struct800847FC *a)
{
    float f31 = a->unk0;
    float f30 = a->unk4;
    float f29 = a->unk8;
    float f28 = a->unkC;
    float f27 = a->unk10;

    gxutil_set_vtx_attrs(1 << GX_VA_POS);
    func_8009E110(1, 0, 1, 0);
    CHANGE_Z_MODE(1, 7, 1);
    {
        GXColor color = {0, 0, 0, 0};
        func_8009E398(0, color, 0.0f, 100.0f, 0.1f, 20000.0f);
    }
    func_8009E094(0);
    GXSetTevDirect(0);
    func_8009EFF4(0, 0xFF, 0xFF, 0xFF);
    func_8009F224(0, 0);
    func_8009E618(0, 15, 15, 15, 15);
    func_8009E800(0, 0, 0, 0, 1, 0);
    func_8009E70C(0, 7, 7, 7, 6);
    func_8009E918(0, 0, 0, 3, 1, 0);
    func_8009F2C8(1);
    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    mathutil_mtxA_pop();
    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
    GXPosition3f32(f29, f30, f27);
    GXPosition3f32(f31, f30, f27);
    GXPosition3f32(f31, f28, f27);
    GXPosition3f32(f29, f28, f27);
    CHANGE_Z_MODE(1, 3, 1);
}

/*
const float lbl_802F5358 = -0.76666665077209473f;
const float lbl_802F535C = -0.86666667461395264f;
const double lbl_802F5360 = 18;
const float lbl_802F5368 = 0.14722222089767456f;
const double lbl_802F5370 = 2.6500000000000004;
const float lbl_802F5378 = 0f;
const float lbl_802F537C = 0.60000002384185791f;
const double lbl_802F5380 = 1.3250000000000002;
const float lbl_802F5388 = 1f;
const float lbl_802F538C = 0.29444444179534912f;
const double lbl_802F5390 = 5.3000000000000007;
const double lbl_802F5398 = 0.10000000000000001;
const double lbl_802F53A0 = 0.066666666666666666;
const double lbl_802F53A8 = 0.033333333333333333;
const float lbl_802F53B0 = 0.26499998569488525f;
don't know about lbl_802F53B4
const float lbl_802F53B8 = 100f;
const float lbl_802F53BC = 0.10000000149011612f;
const float lbl_802F53C0 = 20000f;
const float lbl_802F53C4 = 60f;
const float lbl_802F53C8 = 1.3333333730697632f;
const float lbl_802F53CC = 0.00024056262918747962f;
const float lbl_802F53D0 = -0.10000000149011612f;
const float lbl_802F53D4 = -0.57735025882720947f;
const double lbl_802F53D8 = 415;
const double lbl_802F53E0 = 320;
const float lbl_802F53E8 = -1000f;
const double lbl_802F53F0 = 0.46200000062584873;
const float lbl_802F53F8 = -1.1000000238418579f;
const float lbl_802F53FC = 0.057735025882720947f;
const float lbl_802F5400 = 240f;
const float lbl_802F5404 = 320f;
const float lbl_802F5408 = -10f;
const float lbl_802F540C = 160f;
const float lbl_802F5410 = 0.57735025882720947f;
const double lbl_802F5418 = 0;
const float lbl_802F5420 = -2f;
const double lbl_802F5428 = 0.5;
const double lbl_802F5430 = 1.3333333333333333;
const double lbl_802F5438 = 0.1125;
const double lbl_802F5440 = 0.75;
const double lbl_802F5448 = 240;
const double lbl_802F5450 = -240;
const double lbl_802F5458 = 0.025000000000000001;
const double lbl_802F5460 = 1.25;
const float lbl_802F5468 = 0.28846153616905212f;
const float lbl_802F546C = 0.1875f;
const double lbl_802F5470 = 2;
const float lbl_802F5478 = 48.110118865966797f;
const float lbl_802F547C = -19999f;
const double lbl_802F5480 = 4503601774854144;
const double lbl_802F5488 = 4503599627370496;
*/
