#include <math.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "bitmap.h"
#include "event.h"
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"
#include "tevutil.h"

struct Struct8028CF28
{
    float unk0;
    float unk4;
    float unk8;
    s32 unkC;
    u32 unk10;
    u32 unk14;
    s16 unk18;
    float unk1C;
    float unk20;
    float unk24;
    float unk28;
    u32 unk2C;
};

struct Struct8028FE58
{
    struct Sprite *unk0;
    struct Struct8028FE58 *unk4;
    struct Struct8028FE58 *unk8;
};

// .bss
struct Struct8028CF28 lbl_8028CF28;
FORCE_BSS_ORDER(lbl_8028CF28)
struct Sprite spriteInfo[64];
FORCE_BSS_ORDER(spriteInfo)
struct Struct8028FE58 lbl_8028FE58[0x42];
FORCE_BSS_ORDER(lbl_8028FE58)
struct Struct80290170 screenFadeInfo;
FORCE_BSS_ORDER(screenFadeInfo)

extern struct SpritePoolInfo spritePoolInfo;  // 0x80205988

void ev_sprite_init(void)
{
    s8 *status = spritePoolInfo.statusList;
    int i;

    for (i = 0; i < spritePoolInfo.unk38; i++, status++)
        *status = 0;

    lbl_8028CF28.unk0 = 0.0f;
    lbl_8028CF28.unk4 = 0.0f;
    lbl_8028CF28.unk8 = 0.0f;
    lbl_8028CF28.unkC = 0;
    lbl_8028CF28.unk10 = -1;
    lbl_8028CF28.unk14 = 0;
    lbl_8028CF28.unk18 = 0;
    lbl_8028CF28.unk1C = 0.1f;
    lbl_8028CF28.unk20 = 1.0f;
    lbl_8028CF28.unk24 = 1.0f;
    lbl_8028CF28.unk28 = 1.0f;
    func_80073E44();
}

void ev_sprite_main(void)
{
    struct Sprite *sprite;
    s8 *status;
    int i = 0;

    if (gamePauseStatus & 0xA)
        return;
    lbl_802F2000 = 0;
    status = spritePoolInfo.statusList;
    sprite = spriteInfo;
    for (i = 0; i < spritePoolInfo.unk38; i++, sprite++, status++)
    {
        if (*status != 0)
        {
            lbl_802F2000 |= 1 << sprite->tag;
            if (sprite->mainFunc != NULL)
                sprite->mainFunc(status, sprite);
        }
    }
    func_80073EF8();
}

void ev_sprite_dest(void)
{
    struct Sprite *sprite;
    s8 *status;
    int i = 0;

    sprite = spriteInfo;
    status = spritePoolInfo.statusList;
    for (; i < 64; i++, sprite++, status++)
    {
        if (*status != 0)
        {
            if (sprite->destFunc != NULL)
                sprite->destFunc(sprite);
            *status = 0;
        }
    }

    spritePoolInfo.unk34 = 0;
    lbl_802F2000 = 0;
    func_80074480();
}

#ifdef NONMATCHING
// Functionally equivalent. Has a few register swaps and ordering issues.
void func_800700D8(int a)
{
    struct Sprite *r31_;
    struct Struct8028FE58 *r30;
    struct Sprite *r8;
    struct Struct8028FE58 *r9;
    struct Struct8028FE58 *r10;
    s8 *r11;
    int r12;
    struct Sprite *r6;
    struct Struct8028FE58 *r5;
    int i;  // r30
    int r31 = (eventInfo[EVENT_VIEW].state == EV_STATE_RUNNING);

    r12 = 0;
    r5 = &lbl_8028FE58[r12++];
    r9 = &lbl_8028FE58[r12++];
    r8 = spriteInfo;
    r5->unk0 = NULL;
    r5->unk4 = NULL;
    r5->unk8 = r9;
    r9->unk0 = NULL;
    r9->unk4 = r5;
    r9->unk8 = NULL;

    r11 = spritePoolInfo.statusList;
    for (i = 0; i < spritePoolInfo.unk38; r8++, i++, r11++)
    {
        if (*r11 != 0 && (!r31 || r8->tag == 100))
        {
            if (a == 0)
            {
                if ((r8->unk74 & (1<<18)) == 0)
                    continue;
            }
            else
            {
                if ((r8->unk74 & (1<<18)) != 0)
                    continue;
            }
            if (r8->unk50 != NULL)
                continue;
            r10 = r5->unk8;
            while ((r6 = r10->unk0) != NULL)
            {
                if (r8->unk4C > r6->unk4C)
                    break;
                r10 = r10->unk8;
            }
            r9 = &lbl_8028FE58[r12++];
            r9->unk0 = r8;
            r9->unk4 = r10->unk4;
            r9->unk8 = r10;
            r10->unk4->unk8 = r9;
            r10->unk4 = r9;
        }
    }

    r30 = r5->unk8;
    while ((r31_ = r30->unk0) != NULL)
    {
        g_something_with_sprites(r31_);
        while (r31_->unk54 != 0)
        {
            g_something_with_sprites(r31_->unk54);
            r31_ = r31_->unk54;
        }
        r30 = r30->unk8;
    }
    if (gameMode == MD_MINI)
    {
        switch (gameSubmode)
        {
        case SMD_MINI_SELECT_INIT:
        case SMD_MINI_SELECT_MAIN:
        case SMD_MINI_TEST0_INIT:
        case SMD_MINI_TEST0_MAIN:
        case SMD_MINI_BILLIARDS_INIT:
        case SMD_MINI_BILLIARDS_MAIN:
        case SMD_MINI_COMMEND_INIT:
        case SMD_MINI_COMMEND_MAIN:
            break;
        default:
            func_80093B84();
            break;
        }
    }
    func_8007449C();
}
#else
asm void func_800700D8(int a)
{
    nofralloc
#include "../asm/nonmatchings/func_800700D8.s"
}
#pragma peephole on
#endif

//arcade: FUN_0c048ea0
void func_800702C8(struct Sprite *sprite)
{
    if (spritePoolInfo.statusList[sprite->unk2] != 0 && sprite->unk50 == NULL)
    {
        g_something_with_sprites(sprite);
        while (sprite->unk54 != NULL)
        {
            g_something_with_sprites(sprite->unk54);
            sprite = sprite->unk54;
        }
    }
}

struct Struct801BE470
{
    s32 unk0;
    s32 unk4;
};

// tile coordinates?
struct Struct801BE470 lbl_801BE470[] =
{
    {-64, -112},
    {-64,   80},
    {-64,  176},
    {-64,  224},
    {256, -112},
    {256,   80},
    {256,  176},
    {256,  224},
};

// font parameters?
struct FontParams fontInfo[] =
{
    //      spaceWidth lineHeight
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    6,         8,        16, 32, 122, 16,  6,       0.0625,        0.125,     0.0078125,    0.0078125, 0, 0, 0, 0},
    {   31,        12,        12,  0, 127, 16,  8,       0.0625,        0.125,  0.0052083333, 0.0104166666, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {   80,        72,        64, 48,  96,  7,  7,     0.140625, 0.1428571492,   0.001953125, 0.0022321429, 0, 1, 0, 2},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {   74,        24,        24,  1,  25,  5,  5,       0.1875,       0.1875,     0.0078125,    0.0078125, 0, 0, 0, 0},
    {   73,        24,        24,  1,  25,  5,  5,       0.1875,       0.1875,     0.0078125,    0.0078125, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {  768,        26,        31, 44,  59,  4,  4,     0.203125,    0.2421875,     0.0078125,    0.0078125, 0, 0, 0, 0},
    {  769,        30,        31, 32,  95,  8,  8,    0.1171875,   0.12109375,    0.00390625,   0.00390625, 0, 0, 0, 0},
    {  776,        79,        16, 48,  51,  1,  4,    0.6171875,        0.125,     0.0078125,    0.0078125, 0, 0, 0, 0},
    {  785,       246,        18, 48,  51,  1,  4,    0.9609375,    0.0703125,    0.00390625,   0.00390625, 0, 0, 0, 0},
    {  786,        64,        31, 49,  53,  2,  3,          0.5,    0.2421875,     0.0078125,    0.0078125, 0, 0, 0, 0},
    {  787,        32,        32, 32,  95, 16,  4,       0.0625,         0.25,   0.001953125,    0.0078125, 0, 0, 0, 0},
    {  798,        16,        28, 48,  59,  6,  2,  0.166666666,          0.5,  0.0104166666, 0.0178571436, 0, 0, 0, 0},
    {  802,        64,        34, 49,  53,  1,  5,            1, 0.1931818128,      0.015625, 0.0056818183, 0, 0, 0, 0},
    {  803,        20,        28, 48,  57,  5,  2,          0.2,          0.5,          0.01, 0.0178571436, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    { 1071,         9,        11, 48,  59,  6,  2,     0.140625, 0.4583333333,      0.015625, 0.0416666666, 0, 0, 0, 0},
    { 1070,         9,        11, 48,  57,  5,  2,       0.1875, 0.4583333333,  0.0208333333, 0.0416666666, 0, 0, 0, 0},
    { 1050,        12,        24, 48,  57,  5,  2,       0.1875,          0.5,      0.015625, 0.0208333333, 0, 0, 0, 0},
    { 1072,        16,        14, 48,  55,  4,  2,         0.25,       0.4375,      0.015625,      0.03125, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    { 1543,        19,        13,  0,  25,  5,  5, 0.1826923043,  0.162499994,  0.0096153849,       0.0125, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    { 1801,        18,        16, 32,  91, 12,  5,  0.083333333,          0.2,  0.0046296296,       0.0125, 0, 0, 0, 0},
    { 1813,        28,        16, 49,  52,  2,  2,          0.5,          0.5,  0.0178571436,      0.03125, 0, 0, 0, 0},
    { 1814,        64,        38, 49,  53,  1,  5,          1.0, 0.1979166716,      0.015625, 0.0052083333, 0, 0, 0, 0},
    { 1816,        18,        18, 48,  57,  5,  2,       0.1875,         0.45,  0.0104166666,        0.025, 0, 0, 0, 0},
    { 1817,        20,        24, 48,  58,  6,  2,  0.166666666,          0.5, 0.00833333333, 0.0208333333, 0, 0, 0, 0},
    { 1818,        26,        38, 48,  57,  5,  2, 0.1911764741,        0.475,  0.0073529412,       0.0125, 0, 0, 0, 0},
    { 1821,        10,        18, 48,  57,  5,  2, 0.1785714328,         0.45, 0.01785714366,        0.025, 0, 0, 0, 0},
    { 1823,        16,        22, 48,  58,  6,  2,  0.166666666, 0.4583333333,  0.0104166666, 0.0208333333, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    { 2828,        28,        16, 48,  63,  4,  4,         0.25,         0.25, 0.00892857182,     0.015625, 0, 0, 0, 0},
    { 2826,        16,        24, 48,  57,  5,  2,          0.2,          0.5,        0.0125, 0.0208333333, 0, 0, 0, 0},
    { 2834,        20,        16, 48,  57,  5,  2,          0.2,          0.5,          0.01,      0.03125, 0, 0, 0, 0},
    { 2832,        12,        16, 48,  58,  6,  2,  0.166666666,          0.5, 0.01388888888,      0.03125, 0, 0, 0, 0},
    { 2830,        12,        16, 48,  57,  5,  2,          0.2,          0.5, 0.01666666666,      0.03125, 0, 0, 0, 0},
    { 2839,         8,        10, 48,  57,  5,  2,          0.2,          0.5,         0.025,         0.05, 0, 0, 0, 0},
    { 2835,         8,        12, 48,  57,  5,  2,          0.2,          0.5,         0.025, 0.0416666666, 0, 0, 0, 0},
    { 2868,        12,        14, 48,  51,  2,  2,          0.5,          0.5,  0.0416666666, 0.0357142873, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    { 1281,        64,        64, 48,  63,  4,  4,         0.25,         0.25,    0.00390625,   0.00390625, 0, 0, 0, 0},
    { 1285,        22,        22, 39,  63,  5,  5,     0.171875,     0.171875,     0.0078125,    0.0078125, 0, 0, 1, 0},
    { 1286,        16,        16, 32, 122, 16,  7,       0.0625,  0.166666666,    0.00390625, 0.0104166666, 0, 0, 0, 0},
    { 1286,        16,        16, 32, 122, 16,  7,       0.0625,  0.166666666,    0.00390625, 0.0104166666, 0, 0, 0, 0},
    { 1288,        18,        16, 32,  91, 12,  5,  0.083333333,          0.2, 0.00462962966,       0.0125, 0, 0, 0, 0},
    { 1289,        20,        20, 32,  91, 12,  5,     0.078125,     0.078125,    0.00390625,   0.00390625, 0, 0, 0, 0},
    { 1289,        20,        20, 32,  91, 12,  5,     0.078125,     0.078125,    0.00390625,   0.00390625, 0, 0, 0, 0},
    { 1287,        32,        32, 32,  95,  8,  8,        0.125,        0.125,    0.00390625,   0.00390625, 0, 1, 0, 2},
    { 1293,        16,        22, 48,  59,  6,  2,  0.166666666, 0.4583333333,  0.0104166666, 0.0208333333, 0, 0, 0, 0},
    { 1292,        26,        38, 48,  57,  5,  2, 0.1911764741,        0.475,  0.0073529412,       0.0125, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {    0,         0,         0,  0,   0,  0,  0,          NAN,          NAN,      INFINITY,     INFINITY, 0, 0, 0, 0},
    {    0,         8,         8,  0, 127, 16,  8,       0.0625,        0.125,     0.0078125,     0.015625, 0, 0, 0, 0},
    {   90,        24,        24,  0, 400, 20, 20, 0.0476190485, 0.0476190485,  0.0019841271, 0.0019841271, 0, 0, 1, 0},
    {   90,        24,        24,  0, 400, 20, 20, 0.0476190485, 0.0476190485,  0.0019841271, 0.0019841271, 0, 0, 1, 0},
    {    2,        24,        24,  0, 400,  5,  2,          0.2,          0.5, 0.00833333333, 0.0208333333, 0, 0, 0, 0},
    {   90,        24,        24,  0, 400, 20, 20, 0.0476190485, 0.0476190485,  0.0019841271, 0.0019841271, 0, 0, 1, 0},
};

char *fontStrArray[] =
{
    "FONT_ASCII",
    "FONT_ASC_8x16",
    "FONT_ASC_12x12",
    "FONT_DMY00",
    "FONT_DMY01",
    "FONT_DMY02",
    "FONT_DMY03",
    "FONT_DMY04",
    "FONT_DMY05",
    "FONT_ASC_72x64",
    "FONT_DMY06",
    "FONT_DMY07",
    "FONT_DMY08",
    "FONT_DMY09",
    "FONT_DMY10",
    "FONT_DMY11",
    "FONT_DMY12",
    "FONT_DMY13",
    "FONT_DMY14",
    "FONT_DMY15",
    "FONT_DMY16",
    "FONT_ICON_SD",
    "FONT_ICON_SD2",
    "FONT_DMY20",
    "FONT_DMY21",
    "FONT_DMY22",
    "FONT_DMY23",
    "FONT_NUM_26x31",
    "FONT_ASC_30x31",
    "FONT_ICON_TPL",
    "FONT_ICON_MDE",
    "FONT_ICON_RNK",
    "FONT_RNK_32x32",
    "FONT_RNK_NUM",
    "FONT_MINI_RNK",
    "FONT_SCORE_NUM",
    "FONT_DMY_RNK0",
    "FONT_DMY_RNK1",
    "FONT_DMY_RNK2",
    "FONT_DMY_RNK3",
    "FONT_DMY_RNK4",
    "FONT_DMY_RNK5",
    "FONT_DMY_RNK6",
    "FONT_DMY_RNK7",
    "FONT_DMY_RNK8",
    "FONT_DMY_RNK9",
    "FONT_DMY_RNKa",
    "FONT_DMY_RNKb",
    "FONT_DMY_RNKc",
    "FONT_DMY_RNKd",
    "FONT_DMY_RNKe",
    "FONT_DMY_RNKf",
    "FONT_NUM_7x10",
    "FONT_NUM_8x10",
    "FONT_NUM_12x24",
    "FONT_ICON_CRS",
    "FONT_DMY40",
    "FONT_DMY41",
    "FONT_DMY42",
    "FONT_DMY43",
    "FONT_BWL_SCORE",
    "FONT_DMY50",
    "FONT_DMY51",
    "FONT_DMY52",
    "FONT_DMY53",
    "FONT_DMY54",
    "FONT_DMY55",
    "FONT_DMY56",
    "FONT_DMY57",
    "FONT_RAC_ASC16x16",
    "FONT_RAC_PLAYER",
    "FONT_RAC_RANK",
    "FONT_RAC_RAP_MARK_NUM",
    "FONT_RAC_RAP_NUM",
    "FONT_RAC_TIME_NUM",
    "FONT_RAC_RAP_MARK_NUM_S",
    "FONT_RAC_TIME_NUM_S",
    "FONT_DMY60",
    "FONT_DMY61",
    "FONT_DMY62",
    "FONT_DMY63",
    "FONT_DMY64",
    "FONT_TGT_PLAYER",
    "FONT_TGT_MSCORE",
    "FONT_TGT_SPEED",
    "FONT_TGT_SCORE",
    "FONT_TGT_ROUND",
    "FONT_TGT_ALT",
    "FONT_TGT_WIND",
    "FONT_TGT_RESULT",
    "FONT_DMY72",
    "FONT_DMY73",
    "FONT_DMY74",
    "FONT_ICON_LV",
    "FONT_NUM_22x22",
    "FONT_ASC_16x16",
    "FONT_ASC_16x16P",
    "FONT_ASC_18x16",
    "FONT_ASC_20x20",
    "FONT_ASC_20x20P",
    "FONT_ASC_32x32",
    "FONT_NUM_12x19",
    "FONT_NUM_24x37",
    "FONT_DMY79",
    "FONT_DMY7a",
    "FONT_DMY7b",
    "FONT_DMY7c",
    "FONT_DMY7d",
    "FONT_DMY7e",
    "FONT_DMY7f",
    "FONT_DMY80",
    "FONT_DMY81",
    "FONT_DMY82",
    "FONT_DMY83",
    "FONT_DMY84",
    "FONT_DMY85",
    "FONT_DMY86",
    "FONT_DMY87",
    "FONT_DMY88",
    "FONT_DMY89",
    "FONT_DMY8a",
    "FONT_DMY8b",
    "FONT_DMY8c",
    "FONT_DMY8d",
    "FONT_DMY8e",
    "FONT_DMY8f",
    "FONT_DMY90",
    "FONT_DMY91",
    "FONT_DMY92",
    "FONT_DMY93",
    "FONT_DMY94",
    "FONT_DMY95",
    "FONT_DMY96",
    "FONT_DMY97",
    "FONT_DMY98",
    "FONT_DMY99",
    "FONT_DMY9a",
    "FONT_DMY9b",
    "FONT_DMY9c",
    "FONT_DMY9d",
    "FONT_DMY9e",
    "FONT_DMY9f",
    "FONT_DMYa0",
    "FONT_DMYa1",
    "FONT_DMYa2",
    "FONT_DMYa3",
    "FONT_DMYa4",
    "FONT_DMYa5",
    "FONT_DMYa6",
    "FONT_DMYa7",
    "FONT_DMYa8",
    "FONT_DMYa9",
    "FONT_DMYaa",
    "FONT_DMYab",
    "FONT_DMYac",
    "FONT_DMYad",
    "FONT_DMYae",
    "FONT_DMYaf",
    "FONT_DMYb0",
    "FONT_DMYb1",
    "FONT_DMYb2",
    "FONT_DMYb3",
    "FONT_DMYb4",
    "FONT_DMYb5",
    "FONT_DMYb6",
    "FONT_DMYb7",
    "FONT_DMYb8",
    "FONT_DMYb9",
    "FONT_DMYba",
    "FONT_DMYbb",
    "FONT_DMYbc",
    "FONT_DMYbd",
    "FONT_DMYbe",
    "FONT_DMYbf",
    "FONT_JAP_TAG",
    "FONT_JAP_DMY",
    "FONT_JAP_24x24_2",
    "FONT_JAP_24x24_2P",
    "FONT_JAP_24x24_I",
    "FONT_JAP_24x24_2Pg",
};

#pragma force_active on
char *alignStrArray[] =
{
    "ALIGN_LT",
    "ALIGN_LC",
    "ALIGN_LB",
    "ALIGN_CT",
    "ALIGN_CC",
    "ALIGN_CB",
    "ALIGN_RT",
    "ALIGN_RC",
    "ALIGN_RB",
    "ALIGN_PIC",
};
#pragma force_active reset

struct GlyphDesc
{
    char *text;
    s32 unk4;
};

// symbols?
struct GlyphDesc symbolGlyphs[] =
{
    {"MARU",       0x140},
    {"SANKAKU",    0x141},
    {"SANNKAKU",   0x141},
    {"SIKAKU",     0x142},
    {"HOSI",       0x143},
    {"SUPE-DO",    0x144},
    {"KURO-BA-",   0x145},
    {"HA-TO",      0x146},
    {"DAIYA",      0x147},
    {"NIJYU-MARU", 0x148},
    {"ONNPU",      0x149},
    {"ONPU",       0x149},
    {"ATTOMA-KU",  0x14A},
    {"ANDO",       0x14B},
    {"ANNDO",      0x14B},
    {"SANNKAKU_U", 0x14D},
    {"SANNKAKU_B", 0x14E},
    {"SANNKAKU_D", 0x14E},
    {"SANNKAKU_L", 0x14F},
    {"SANNKAKU_R", 0x150},
    {"!=",         0x127},
    {"LE",         0x12A},
    {"GE",         0x12B},
    {"TENNTENN",   0x131},
    {"!'",         0x13C},
    {"!\"",        0x13E},
    {"KAKERU",     0x151},
    {"KOME",       0x152},
    {"*",          0x152},
    {"MUGENN",     0x153},
    {".",          0x12F},
    {"DMY",           -1},
};

// button icons?
struct GlyphDesc buttonGlyphs[] =
{
    {"BOTANN_A", 0},
    {"BUTTON_A", 0},
    {"BUTTON_B", 1},
    {"BUTTON_C", 2},
    {"BOTANN_L", 3},
    {"BUTTON_L", 3},
    {"BOTANN_R", 4},
    {"BUTTON_R", 4},
    {"BUTTON_X", 5},
    {"BUTTON_Y", 6},
    {"BUTTON_Z", 7},
    {"LEVER",    8},
    {"BUTTON_+", 9},
    {"DMY",     -1},
};

// kanji? capitalized part seems to be the actual kanji
struct GlyphDesc singleKanjiGlyphs[] =
{
    {"SHOkyuu",  0x168},
    {"CHUkyuu",  0x169},
    {"NAKA",     0x169},
    {"JYOkyuu",  0x16A},
    {"UE",       0x16A},
    {"KYUU",     0x16B},
    {"NANI",     0x16C},
    {"HONN",     0x16D},
    {"KAchi",    0x16E},
    {"MAke",     0x16F},
    {"SHIyou",   0x170},
    {"TSUKAu",   0x170},
    {"shiYOU",   0x171},
    {"YOU",      0x171},
    {"JIbunn",   0x172},
    {"jiBUNN",   0x173},
    {"HITO",     0x174},
    {"NINN",     0x174},
    {"GENzai",   0x175},
    {"genZAI",   0x176},
    {"KOsuu",    0x177},
    {"DOUji",    0x178},
    {"douJI",    0x179},
    {"TOKI",     0x179},
    {"TAIsenn",  0x17A},
    {"taiSENN",  0x17B},
    {"SENN",     0x17B},
    {"KAIsuu",   0x17C},
    {"KAI",      0x17C},
    {"TSUGI",    0x17D},
    {"RENNshuu", 0x17E},
    {"rennSHUU", 0x17F},
    {"KYOUsou",  0x180},
    {"kyouSOU",  0x181},
    {"SAKI",     0x182},
    {"HOKA",     0x183},
    {"KURAI",    0x184},
    {"KAZU",     0x185},
    {"SUU",      0x185},
    {"OSU",      0x186},
    {"HAI",      0x187},
    {"KEttei",   0x188},
    {"keTTEI",   0x189},
    {"Au",       0x18A},
    {"MIGI",     0x18B},
    {"SHITA",    0x18C},
    {"KUDA",     0x18C},
    {"HIDARI",   0x18D},
    {"TAberu",   0x18E},
    {"IMA",      0x18F},
    {"DOU",      0x190},
    {"UGOku",    0x190},
    {"DAI",      0x191},
    {"OOkii",    0x191},
    {"KIbunn",   0x192},
    {"HENN",     0x193},
    {"KAwaru",   0x193},
    {"CHIkei",   0x194},
    {"chiKEI",   0x195},
    {"chiTENN",  0x196},
    {"TENN",     0x196},
    {"SAKA",     0x197},
    {"MICHI",    0x198},
    {"Ochiru",   0x199},
    {"TOru",     0x19A},
    {"KIkann",   0x19B},
    {"MOUkeru",  0x19C},
    {"TUku",     0x19D},
    {"YOmu",     0x19E},
    {"KARADA",   0x19F},
    {"ATUKAu",   0x1A0},
    {"SETSU",    0x1A1},
    {"AKArui",   0x1A2},
    {"KAku",     0x1A3},
    {"DENN",     0x166},
    {"GENN",     0x167},
    {"NUku",     0x165},
    {"SOU",      0x164},
    {"TAMA",     0x163},
    {"DMY",         -1},
};

struct DoubleKanjiGlyph
{
    char *text;
    s16 unk4;
    s16 unk6;
};

// Japanese words composed of two kanji?
struct DoubleKanjiGlyph doubleKanjiGlyphs[] =
{
    {"SHOKYUU",    0x0168, 0x016B},
    {"CHUKYUU",    0x0169, 0x016B},
    {"JYOKYUU",    0x016A, 0x016B},
    {"NANNBONN",   0x016C, 0x016D},
    {"SHOUBU",     0x016E, 0x016F},
    {"SYOUBU",     0x016E, 0x016F},
    {"SHIYOU",     0x0170, 0x0171},
    {"JIBUNN",     0x0172, 0x0173},
    {"GENZAI",     0x0175, 0x0176},
    {"DOUJI",      0x0178, 0x0179},
    {"TAISENN",    0x017A, 0x017B},
    {"RENNSHUU",   0x017E, 0x017F},
    {"KYOUSOU",    0x0180, 0x0181},
    {"HONNSUU",    0x016D, 0x0185},
    {"KOSUU",      0x0177, 0x0185},
    {"KETTEI",     0x0188, 0x0189},
    {"CHIKEI",     0x0194, 0x0195},
    {"CHITENN",    0x0194, 0x0196},
    {"SAKAMICHI",  0x0197, 0x0198},
    {"RAKKA",      0x0199, 0x018C},
    {"IRE",        0x0187, 0x0058},
    {"SENNSHU",    0x0182, 0x019A},
    {"TORU",       0x019A, 0x0057},
    {"TORE",       0x019A, 0x0058},
    {"NANNKAI",    0x016C, 0x017C},
    {"KAISUU",     0x017C, 0x0185},
    {"KATE",       0x016E, 0x0026},
    {"SHOKI",      0x0168, 0x019B},
    {"SETTEI",     0x019C, 0x0189},
    {"CHAKUCHI",   0x019D, 0x0194},
    {"HONNTAI",    0x016D, 0x019F},
    {"TORIATUKAI", 0x019A, 0x01A0},
    {"SETUMEI",    0x01A1, 0x01A2},
    {"DENNGENN",   0x0166, 0x0167},
    {"KACHI",      0x016E, 0x0024},
    {"TAIKETSU",   0x017A, 0x0188},
    {"TATAKAU",    0x017B, 0x0002},
    {"TATAKAI",    0x017B, 0x0001},
    {"SENNSOU",    0x017B, 0x0181},
    {"NUKU",       0x0165, 0x0011},
    {"HASHIRU",    0x0164, 0x0057},
    {"KYOUSOU2",   0x0180, 0x0164},
    {"NUKI",       0x0165, 0x0010},
    {"TSUKAU",     0x0170, 0x0002},
    {"OTOSU",      0x0199, 0x001B},
    {"OTO",        0x0199, 0x0027},
    {"TSUKAI",     0x0170, 0x0001},
    {"OCHI",       0x0199, 0x0024},
    {"KIME",       0x0188, 0x0049},
    {"JITENN",     0x0179, 0x0196},
    {"OSHI",       0x0186, 0x001A},
    {"DOUTENN",    0x0178, 0x0196},
    {"HENNKEI",    0x0193, 0x0195},
    {"TSUKAE",     0x0170, 0x0003},
    {"SAYUU",      0x018D, 0x018B},
    {"KIMA",       0x0188, 0x0046},
    {"MAKE",       0x016F, 0x0012},
    {"JYOUGE",     0x016A, 0x018C},
    {"DMY",            -1,     -1},
};

void g_something_with_sprites(struct Sprite *sprite)
{
    u32 r29;
    u32 r26;
    int i;
    int x;
    int y;

    if (sprite->unk78 & 1)
        return;
    g_get_dimensions_for_sprite(sprite, &sprite->left, &sprite->top, &sprite->right, &sprite->bottom);
    if (sprite->unk38 != NULL)
    {
        sprite->unk38(sprite);
        return;
    }
    switch (sprite->type)
    {
    case 0:
        func_80072B50(sprite);
        break;
    case 1:
        if (!bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].isLoaded)
        {
            printf("SPRITE WARNING!! %s's category %s is not load\n",
                bitmapNames[sprite->bmpId >> 8][sprite->bmpId & 0xFF],
                bitmapGroups[sprite->bmpId >> 8].name);
            break;
        }
        func_80072C68(sprite);
        break;
    case 2:
        if (!bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].isLoaded)
        {
            printf("SPRITE WARNING!! %s's category %s is not load\n",
                bitmapNames[sprite->bmpId >> 8][sprite->bmpId & 0xFF],
                bitmapGroups[sprite->bmpId >> 8].name);
            break;
        }
        r26 = sprite->bmpId & 0xFF;
        r29 = sprite->bmpId;
        x = sprite->centerX;
        y = sprite->centerY;
        for (i = 0; i < 8; i++)
        {
            sprite->bmpId = (r29 & 0xFF00) | r26;
            sprite->centerX = (float)(x + lbl_801BE470[i].unk0);
            sprite->centerY = (float)(y + lbl_801BE470[i].unk4);
            g_get_dimensions_for_sprite(sprite, &sprite->left, &sprite->top, &sprite->right, &sprite->bottom);
            func_80072C68(sprite);
            r26++;
        }
        sprite->bmpId = r29;
        sprite->centerX = x;
        sprite->centerY = y;
    }
}

void call_bitmap_load_group(int grpId)
{
    bitmap_load_group(grpId);
}

void call_bitmap_free_group(int grpId)
{
    bitmap_free_group(grpId);
}

void free_all_bitmap_groups_except_com(void)
{
    int i;
    for (i = 0; i < 14; i++)
    {
        if (i != BMP_COM)
            bitmap_free_group(i);
    }
}

struct Sprite *create_sprite(void)
{
    int index = pool_alloc(spritePoolInfo.unk30, 2);

    if (index < 0)
        return NULL;
    else
    {
        struct Sprite *sprite = &spriteInfo[index];

        memset(sprite, 0, sizeof(*sprite));
        sprite->unk2 = index;
        sprite->unk4C = 0.1f;
        sprite->unkC = 0xFF;
        sprite->unkD = 0xFF;
        sprite->unkE = 0xFF;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 1.0f;
        sprite->unk6C = 1.0f;
        sprite->left = 0;
        sprite->top = 0;
        sprite->right = 1;
        sprite->bottom = 1;
        sprite->unk7C = 0.0f;
        sprite->unk80 = 0.0f;
        sprite->unk84 = 1.0f;
        sprite->unk88 = 1.0f;
        sprite->unk74 = 0x20000;
        return sprite;
    }
}

struct Sprite *create_linked_sprite(struct Sprite *sprite)
{
    struct Sprite *newSprite = create_sprite();
    if (newSprite != NULL)
    {
        sprite->unk54 = newSprite;
        newSprite->unk50 = sprite;
        newSprite->unk74 |= sprite->unk74 & (1 << 18);
    }
    return newSprite;
}

void destroy_sprite_with_tag(int tag)
{
    struct Sprite *sprite = spriteInfo;
    s8 *status = spritePoolInfo.statusList;
    int i;

    for (i = 0; i < 64; i++)
    {
        if (*status != 0 && sprite->tag == tag)
        {
            if (sprite->destFunc != NULL)
                sprite->destFunc(sprite);
            *status = 0;
        }
        sprite++;
        status++;
    }
}

#pragma force_active on
void destroy_all_sprites(void)
{
    struct Sprite *sprite = spriteInfo;
    s8 *status = spritePoolInfo.statusList;
    int i;

    for (i = 0; i < 64; i++)
    {
        if (*status != 0)
        {
            if (sprite->destFunc != NULL)
                sprite->destFunc(sprite);
            *status = 0;
        }
        sprite++;
        status++;
    }
}
#pragma force_active reset

struct Sprite *find_sprite_with_tag(int tag)
{
    struct Sprite *sprite = spriteInfo;
    s8 *status = spritePoolInfo.statusList;
    int i;

    for (i = 0; i < 64; i++, sprite++, status++)
    {
        if (*status != 0 && sprite->tag == tag)
            return sprite;
    }
    return NULL;
}

void g_get_dimensions_for_sprite(struct Sprite *sprite, s32 *left, s32 *top, s32 *right, s32 *bottom)
{
    int width = 0;
    int height = 0;
    struct FontParams *fontParams;
    int x;
    int y;
    int len;

    if (sprite->unk38 != 0)
    {
        *left   = sprite->centerX - 50.0f;
        *top    = sprite->centerY - 50.0f;
        *right  = sprite->centerX + 50.0f;
        *bottom = sprite->centerY + 50.0f;
        return;
    }
    else
    {
        fontParams = &fontInfo[sprite->fontId];
        switch (sprite->type)
        {
        case 0:
            len = strlen(sprite->text);
            width = len * fontParams->spaceWidth;
            height = fontParams->lineHeight;
            if (sprite->fontId > FONT_JAP_TAG)  // Japanese font
            {
                width = get_jpn_text_width(sprite->fontId, sprite->text);
            }
            else  // ASCII font
            {
                char *chr = sprite->text;
                while (*chr != 0)
                {
                    float f1;
                    width += get_char_width(chr, sprite->fontId, fontParams) - fontParams->spaceWidth;
                    f1 = g_get_char_ratio(chr, sprite->fontId);
                    if (f1 != 1.0)
                        width += f1 * fontParams->spaceWidth - fontParams->spaceWidth;
                    chr++;
                }
            }
            break;
        case 1:
        case 2:
            if (!bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].isLoaded)
            {
                printf("SPRITE WARNING!! %s's category %s is not load\n",
                    bitmapNames[sprite->bmpId >> 8][sprite->bmpId & 0xFF],
                    bitmapGroups[sprite->bmpId >> 8].name);
                *left = sprite->centerX - 50.0f;
                *top = sprite->centerY - 50.0f;
                *right = sprite->centerX + 50.0f;
                *bottom = sprite->centerY + 50.0f;
                return;
            }
            width = bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].tpl->texHeaders[sprite->bmpId & 0xFF].width;
            height = bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].tpl->texHeaders[sprite->bmpId & 0xFF].height;
            break;
        }
    }

    width *= sprite->unk40;
    height *= sprite->unk44;
    if (sprite->unk50 == NULL)
    {
        x = sprite->centerX;
        y = sprite->centerY;
        switch (sprite->textAlign)
        {
        // centered horizontally
        case ALIGN_CT:
        case ALIGN_CC:
        case ALIGN_CB:
        case ALIGN_PIC:
            x -= width / 2;
            break;
        // right aligned
        case ALIGN_RT:
        case ALIGN_RC:
        case ALIGN_RB:
            x -= width;
            break;
        }
        switch (sprite->textAlign)
        {
        // centered vertically
        case ALIGN_LC:
        case ALIGN_CC:
        case ALIGN_RC:
        case ALIGN_PIC:
            y -= height / 2;
            break;
        // bottom aligned
        case ALIGN_LB:
        case ALIGN_CB:
        case ALIGN_RB:
            y -= height;
            break;
        }
        *left   = x;
        *top    = y;
        *right  = x + width;
        *bottom = y + height;
    }
    else
    {
        y = sprite->unk50->top;
        x = sprite->unk50->right;
        switch (sprite->textAlign)
        {
        // centered vertically
        case ALIGN_LC:
        case ALIGN_CC:
        case ALIGN_RC:
        case ALIGN_PIC:
            y = (y + sprite->unk50->bottom) / 2 - height / 2;
            break;
        // bottom aligned
        case ALIGN_LB:
        case ALIGN_CB:
        case ALIGN_RB:
            y = sprite->unk50->bottom - height;
            break;
        }
        x += sprite->centerX;
        y += sprite->centerY;
        *left   = x;
        *top    = y;
        *right  = x + width;
        *bottom = y + height;
    }
}

int get_char_width(char *chr, int fontId, struct FontParams *params)
{
    switch (fontId)
    {
    case FONT_ASC_20x20P:
        switch (*chr)
        {
        case ' ':
            return 10;
        case 'I':
            return 12;
        }
        break;
    case FONT_ASC_72x64:
        switch (*chr)
        {
        case ' ':
            return 18;
        case 'I':
            return 30;
        }
        break;
    case FONT_ASC_16x16P:
        switch (*chr)
        {
        case ',':
        case '\'':
        case '.':
            return 8;
        case ' ':
            return 9;
        case 'I':
            return 8;
        case 'i':
            return 7;
        case 'j':
            return 9;
        case 'l':
            return 9;
        case 'm':
            return 13;
        case 'r':
            return 10;
        default:
            if (*chr >= 'a' && *chr <= 'z')
                return 11;
            break;
        }
        break;
    case FONT_NUM_8x10:
        return 8;
    }
    return params->spaceWidth;
}

float g_get_char_ratio(char *chr, int fontId)
{
    switch (fontId)
    {
    case FONT_ASC_72x64:
        switch (chr[0])
        {
        case 'O':
            switch (chr[1])
            {
            case 'A':
                return 0.95f;
            case 'V':
                return 0.9f;
            }
            break;
        case 'D':
            switch (chr[1])
            {
            case 'Y':
                return 0.9f;
            }
            break;
        }
        break;
    case FONT_NUM_7x10:
        return 0.777769982815f;
    case FONT_RAC_ASC16x16:
        switch (chr[0])
        {
        case 0x27:
            return 0.333333343267f;
        case 0x23:
            return 0.555555582047f;
        default:
            return 1.0f;
        }
        break;
    case FONT_RAC_RAP_MARK_NUM_S:
        return 0.899999976158f;
    case FONT_TGT_MSCORE:
        return 1.125f;
    case FONT_TGT_SPEED:
        return 0.899999976158f;
    case FONT_TGT_ROUND:
        return 0.833333313465f;
    }
    return 1.0f;
}

struct StringParseState
{
    u32 mode;
    s32 unk4;
    s32 unk8;
    float unkC;
};

struct Struct80071140_b
{
    s8 unk0;
    u8 unk1;
};  // size = 4

// rodata
const s32 lbl_80117A80[] =
{
    0x16,
    0x14,
    0x16,
    0x14,
    0x14,
    0x14,
    0x14,
    0x14,
    0x4,
    0x12,
    0x12,
    0x12,
    0x16,
    0x12,
    0x14,
    0x14,
    0x16,
    0x14,
    0x14,
    0x14,
    0x12,
    0x14,
    0x16,
    0x16,
    0x16,
    0x14,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x10,
    0x10,
    0x10,
    0x10,
    0x10,
    0xC,
    0x10,
    0x10,
    0x4,
    0xC,
    0x10,
    0x4,
    0x14,
    0x10,
    0x10,
    0x10,
    0x10,
    0xC,
    0x10,
    0xE,
    0x10,
    0x10,
    0x14,
    0x10,
    0x10,
    0x10,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x12,
    0xE,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0x12,
    0xE,
    0xE,
    0x12,
    0x12,
    -1,
    0xA,
    0xA,
    0xE,
    0xE,
    -1,
    0x12,
    0xA,
    -1,
    0x14,
    0xA,
    0xA,
    0xC,
    0xC,
    0xC,
    0xC,
    0xA,
    0xA,
    0x11,
    0x11,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x12,
    -1,
    -1,
    0x4,
    0x4,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
};

const s32 lbl_80117E40[] =
{
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x133,
    0x13F,
    -1,
    -1,
    0x14C,
    0x14B,
    0x13D,
    0x136,
    0x137,
    0x124,
    0x122,
    0x12D,
    0x123,
    0x12E,
    0x135,
    0x118,
    0x119,
    0x11A,
    0x11B,
    0x11C,
    0x11D,
    0x11E,
    0x11F,
    0x120,
    0x121,
    0x130,
    -1,
    0x128,
    0x126,
    0x129,
    0x132,
    0x14A,
    0,
    0x3C,
    0x24,
    0x28,
    0x03,
    0x39,
    0x14,
    0x37,
    0x01,
    0x1F,
    0x0F,
    0x55,
    0x46,
    0x32,
    0x04,
    0x41,
    -1,
    0x55,
    0x19,
    0x23,
    0x02,
    0x07,
    0x5A,
    -2,
    0x4B,
    0x1E,
    0x138,
    -1,
    0x139,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x134,
    -1,
};

const s32 lbl_80118040[] =
{
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0,
    -1,
    -1,
    -1,
    3,
    -1,
    -1,
    -1,
    1,
    -1,
    -1,
    -1,
    -1,
    -1,
    4,
    -1,
    -1,
    -1,
    -2,
    -1,
    2,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
};

const s32 lbl_80118240[] =
{
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x50,
    -1,
    -1,
    -1,
    0xD,
    -1,
    -1,
    -1,
    -2,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x54,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x52,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
};

const s32 lbl_80118440[] =
{
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0,
    -1,
    -1,
    -1,
    -1,
    0,
    0,
    -1,
    -1,
    0,
    -1,
    0,
    0,
    -1,
    0,
    -1,
    0,
    0,
    0,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
};

const s32 lbl_80118640[] =
{
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x151,
    -1,
    -1,
    0x12C,
    -1,
    0x125,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0x13A,
    -1,
    0x13B,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
};

enum
{
    TEXT_MODE_ASCII,
    TEXT_MODE_HIRAGANA,  // also attempts to use kanji when possible
    TEXT_MODE_KATAKANA,
    TEXT_MODE_PICTURE,
};

int parse_char_sequence(struct StringParseState *parseState, char *str, s32 *color, s32 *skip, s32 *e)
{
    s32 glyphIndex;
    int mode;

    parseState->unk8 = 0;

    // hiragana
    if (str[0] == 'h' && str[1] == '/')
    {
        parseState->mode = (parseState->mode & 0xFFFF0000) | TEXT_MODE_HIRAGANA;
        *skip = 1;
        return -2;
    }

    // katakana
    if (str[0] == 'k' && str[1] == '/')
    {
        parseState->mode = (parseState->mode & 0xFFFF0000) | TEXT_MODE_KATAKANA;
        *skip = 1;
        return -2;
    }

    // ascii
    if (str[0] == 'a' && *(str + 1) == '/')
    {
        parseState->mode = (parseState->mode & 0xFFFF0000) | TEXT_MODE_ASCII;
        *skip = 1;
        return -2;
    }

    // picture
    if (str[0] == 'p' && *(str + 1) == '/')
    {
        parseState->mode = (parseState->mode & 0xFFFF0000) | TEXT_MODE_PICTURE;
        *skip = 1;
        return -2;
    }

    // text color
    if (str[0] == 'c' && *(str + 1) == '/')
    {
        int shift = 20;
        *skip += 4;
        *color = 0;
        str += 4;
        while (*str != '/')
        {
            int digit;
            switch (*str)
            {
            case '0':
                digit = 0;
                break;
            case '1':
                digit = 1;
                break;
            case '2':
                digit = 2;
                break;
            case '3':
                digit = 3;
                break;
            case '4':
                digit = 4;
                break;
            case '5':
                digit = 5;
                break;
            case '6':
                digit = 6;
                break;
            case '7':
                digit = 7;
                break;
            case '8':
                digit = 8;
                break;
            case '9':
                digit = 9;
                break;
            case 'a':
                digit = 10;
                break;
            case 'b':
                digit = 11;
                break;
            case 'c':
                digit = 12;
                break;
            case 'd':
                digit = 13;
                break;
            case 'e':
                digit = 14;
                break;
            case 'f':
                digit = 15;
                break;
            default:
                digit = 0;
                break;
            }
            *color |= digit << shift;
            str++;
            *skip += 1;
            shift -= 4;
        }
        return -2;
    }
    if (str[0] == 'b' && str[1] == '/')
    {
        parseState->mode |= 0x10000;
        *skip = 1;
        return -2;
    }
    if (str[0] == '/' && str[1] == 'b')
    {
        parseState->mode &= ~0x10000;
        *skip = 1;
        return -2;
    }
    if (str[0] == 'f' && str[1] == 't' && str[2] == '/')
    {
        *e = 1;
        *skip = 2;
        return -2;
    }
    if (str[0] == 'f' && str[1] == 'p' && str[2] == '/')
    {
        *e = 2;
        *skip = 2;
        return -2;
    }
    if (str[0] == 'z' && str[2] == '/')
    {
        switch (str[1])
        {
        case 'r':
            *e = 0x64;
            break;
        case '9':
            *e = 0x5A;
            break;
        case '8':
            *e = 0x50;
            break;
        case '7':
            *e = 0x46;
            break;
        }
        *skip = 2;
        return -2;
    }
    glyphIndex = -1;
    parseState->mode &= ~0x20000;

    mode = (u16)parseState->mode;
    // ascii character
    if (mode == TEXT_MODE_ASCII)
    {
        if (str[0] >= 'A' && str[0] <= 'Z')
            glyphIndex = str[0] + 0x87;
        else if (str[0] >= 'a' && str[0] <= 'z')
            glyphIndex = str[0] + 0x8F;
        else if (str[0] >= '0' && str[0] <= '9')
            glyphIndex = str[0] + 0xE8;
        else if (str[0] == '.')
            glyphIndex = 0x155;
        else if (str[0] == ',')
            glyphIndex = 0x154;
        else
            glyphIndex = lbl_80117E40[str[0]];
    }
    // japanese character
    else if (mode == TEXT_MODE_HIRAGANA || mode == TEXT_MODE_KATAKANA)
    {
        glyphIndex = lbl_80117E40[str[0]];
        if (glyphIndex != -1)
        {
            if (glyphIndex >= 0xC8)
            {
                if (lbl_80118640[str[0]] != -1)
                    glyphIndex = lbl_80118640[str[0]];
            }
            else if (str[0] == 'X')
            {
                int r3 = lbl_80118040[str[1]];
                if (r3 >= 0)
                {
                    parseState->unk8 = 1;
                    glyphIndex = r3 + 10;
                }
                else if (str[1] == 'T')
                {
                    glyphIndex = 0x2F;
                    if (str[2] == 'S')
                        parseState->unk8 = 3;
                    else
                        parseState->unk8 = 2;
                }
            }
            else if (glyphIndex >= 15)
            {
                if (str[0] == str[1])
                {
                    if (str[0] == 'N')
                    {
                        parseState->unk8 = 1;
                        glyphIndex = 0x5F;
                    }
                    else
                        glyphIndex = 0x2F;
                }
                else if (parseState->unk4 != -1)
                {
                    glyphIndex = lbl_80118240[str[1]];
                    parseState->unk4 = -1;
                    if (glyphIndex == -2)
                    {
                        *skip = 1;
                        return -2;
                    }
                    parseState->unk8 = 1;
                }
                else
                {
                    s32 r4 = lbl_80118040[str[1]];
                    if (r4 == -2)
                    {
                        r4 = lbl_80118040[str[2]];
                        parseState->unk8 = 2;
                    }
                    if (r4 != -1)
                    {
                        if (str[0] == 'J' && str[1] == 'I')
                            parseState->unk8 = 1;
                        else if (str[0] == 'F' || str[0] == 'J')
                            parseState->unk4 = glyphIndex;
                        else if (str[0] == 'C' && str[1] != 'H')
                        {
                            parseState->unk8 = 1;
                            glyphIndex = r4 + 15;
                        }
                        else
                        {
                            glyphIndex += r4;
                            if (parseState->unk8 == 0)
                                parseState->unk8 = 1;
                        }
                    }
                    else
                    {
                        if (lbl_80118440[str[0]] != -1)
                            glyphIndex++;
                        if (str[0] == 'N' && str[1] != 'Y')
                            glyphIndex = 0x5F;
                        else if (str[0] == 'S' && str[1] == 'H' && str[2] == 'I')
                            parseState->unk8 = 2;
                        else
                            parseState->unk4 = glyphIndex;
                    }
                }
            }
            else if (str[0] == 'V')
                parseState->unk4 = glyphIndex;
            else if (parseState->unk4 != -1)
            {
                parseState->unk4 = -1;
                glyphIndex += 10;
            }
            if (glyphIndex < 100 && (u16)parseState->mode == TEXT_MODE_KATAKANA)
                glyphIndex += 100;
        }
    }
    else if ((u32)mode == TEXT_MODE_PICTURE)
    {
        if (parseState->unk4 != -1)
        {
            glyphIndex = parseState->unk4;
            parseState->unk4 = -1;
            parseState->unk8 = 0;
        }
        else
        {
            char *r5;
            int i;
            struct GlyphDesc *glyph;

            glyphIndex = -2;
            for (i = 0; str[i] != '/'; i++)
                ;
            glyph = symbolGlyphs;
            while (glyph->unk4 != -1)
            {
                int j;

                r5 = str;
                for (j = 0; *r5 != '/'; j++, r5++)
                {
                    if (*r5 != glyph->text[j])
                        break;
                }
                if (i == j && i == (u32)strlen(glyph->text))
                {
                    glyphIndex = glyph->unk4;
                    parseState->unk8 = j;
                    break;
                }
                glyph++;
            }
            if (glyphIndex == -2)
            {
                glyph = buttonGlyphs;
                while (glyph->unk4 != -1)
                {
                    int j;

                    r5 = str;
                    for (j = 0; *r5 != '/'; j++, r5++)
                    {
                        if (*r5 != glyph->text[j])
                            break;
                    }
                    if (i == j && i == (u32)strlen(glyph->text))
                    {
                        glyphIndex = glyph->unk4;
                        parseState->unk8 = j;
                        parseState->mode |= 0x20000;
                        break;
                    }
                    glyph++;
                }
            }
            if (glyphIndex == -2)
            {
                glyph = singleKanjiGlyphs;
                while (glyph->unk4 != -1)
                {
                    int j;

                    r5 = str;
                    for (j = 0; *r5 != '/'; j++, r5++)
                    {
                        if (*r5 != glyph->text[j])
                            break;
                    }
                    if (i == j && i == (u32)strlen(glyph->text))
                    {
                        glyphIndex = glyph->unk4;
                        parseState->unk8 = j;
                        break;
                    }
                    glyph++;
                }
            }
            if (glyphIndex == -2)
            {
                struct DoubleKanjiGlyph *glyph = doubleKanjiGlyphs;

                while (glyph->unk4 != -1)
                {
                    int j;

                    r5 = str;
                    for (j = 0; *r5 != '/'; j++, r5++)
                    {
                        if (*r5 != glyph->text[j])
                            break;
                    }
                    if (i == j && i == (u32)strlen(glyph->text))
                    {
                        glyphIndex = glyph->unk4;
                        parseState->unk8 = j - 1;
                        parseState->unk4 = glyph->unk6;
                        break;
                    }
                    glyph++;
                }
            }
        }
    }

    return glyphIndex;
}

#pragma force_active on
int func_80071A74(int fontId)
{
    return fontInfo[fontId].unk0;
}
#pragma force_active reset

void func_80071A8C(void)
{
    lbl_8028CF28.unkC = 0;
    lbl_8028CF28.unk10 = 0xFFFFFF;
    lbl_8028CF28.unk14 = 0;
    lbl_8028CF28.unk18 = 0;
    lbl_8028CF28.unk1C = 0.1f;
    lbl_8028CF28.unk20 = 1.0f;
    lbl_8028CF28.unk24 = 1.0f;
    lbl_8028CF28.unk28 = 1.0f;
    lbl_8028CF28.unk2C = 0x20000;
}

void func_80071AD4(int a)
{
    lbl_8028CF28.unkC = a;
}

void func_80071AE4(int a)
{
    lbl_8028CF28.unk10 = a & 0xFFFFFF;
}

void func_80071AF8(int a)
{
    lbl_8028CF28.unk14 = a;
}

#pragma force_active on
void func_80071B08(int a)
{
    lbl_8028CF28.unk18 = a;
}
#pragma force_active reset

void func_80071B1C(float a)
{
    lbl_8028CF28.unk1C = a;
}

void func_80071B2C(float a, float b)
{
    lbl_8028CF28.unk20 = a;
    lbl_8028CF28.unk24 = b;
}

void func_80071B40(float a)
{
    lbl_8028CF28.unk28 = a;
}

void func_80071B50(int a)
{
    lbl_8028CF28.unk2C = a;
}

void func_80071B60(float a, float b)
{
    lbl_8028CF28.unk4 = a;
    lbl_8028CF28.unk0 = a;
    lbl_8028CF28.unk8 = b;
}

#ifdef NONMATCHING
void func_80071B78(s8 a)
{
    struct NaomiSpriteParams params;  // sp + 0x10
    struct FontParams *font = &fontInfo[lbl_8028CF28.unkC];  // r5
    int r6 = a - font->unk4;
    int div = r6 / font->unkC;
    int mod = r6 % font->unkC;
    float f4;
    float f5;
    //float f0;

    params.bmpId = font->unk0;
    params.x = lbl_8028CF28.unk4 + font->unk18 * font->unk20 /*0xC4*/;
    params.y = lbl_8028CF28.unk8 + font->unk1C * font->unk22 /*0xBC*/;
    params.z = lbl_8028CF28.unk1C;
    f4 = font->unk10 * mod;
    f5 = font->unk14 * div;  /*0xAC*/
    params.u1 = f4 + font->unk18 * font->unk20;
    params.v1 = f5 + font->unk1C * font->unk22;
    params.u2 = font->unk10 + (f4 - font->unk18 * font->unk21);
    params.v2 = font->unk14 + (f5 - font->unk1C * font->unk23);
    params.zoomX = lbl_8028CF28.unk20 * ((font->unk10 - font->unk18 * font->unk20) - font->unk18 * font->unk21);
    //f0 = font->unk18 * font->unk23;
    params.zoomY = lbl_8028CF28.unk24 * ((font->unk14 - font->unk1C * font->unk22) - font->unk18 * font->unk23);

    params.rotation = lbl_8028CF28.unk18;
    params.alpha = lbl_8028CF28.unk28;
    params.unk30 = -1;
    params.flags = (lbl_8028CF28.unk2C & ~0xF) | 5;
    params.unk38 = ((int)(255.0f * lbl_8028CF28.unk28) << 24) | lbl_8028CF28.unk10;
    params.unk3C = lbl_8028CF28.unk14;
    draw_naomi_sprite(&params);
}
#else
asm void func_80071B78(s8 a)
{
    nofralloc
#include "../asm/nonmatchings/func_80071B78.s"
}
#pragma peephole on
#endif

static inline int func_80071E58_inline(int a, int b, struct FontParams *r24)
{
    switch (b)
    {
    case 0xB1:
    case 0xB3:
        switch (a)
        {
        case 0x20:
            return 12;
        }
    default:
    case 0xB2:
        return r24->spaceWidth;
        break;
    }
}

void func_80071E58(char *str)
{
    struct Struct8028CF28 *r28 = &lbl_8028CF28;
    int r25;
    struct FontParams *font;
    int r23;
    int r22;
    float f17;
    float f16;
    float f31;
    struct NaomiSpriteParams params;
    struct StringParseState parseState;
    u8 dummy[8];
    s32 skip;
    s32 sp18;
    s32 color;

    font = &fontInfo[r28->unkC];
    r22 = 0;
    r25 = r28->unkC;

    params.bmpId = font->unk0;
    params.z = r28->unk1C;
    params.alpha = r28->unk28;
    params.rotation = r28->unk18;
    params.unk38 = ((int)(r28->unk28 * 255.0f) << 24) | r28->unk10;
    params.unk3C = r28->unk14;
    params.unk30 = -1;
    params.flags = (r28->unk2C & ~0xF) | 5;
    f31 = r28->unk20;
    parseState.mode = TEXT_MODE_ASCII;
    parseState.unk4 = -1;
    parseState.unk8 = 0;
    parseState.unkC = 0.0f;

    for (; *str != 0; str++)
    {
        int glyphIndex;

        if (lbl_802F1D04 != 4 && lbl_802F200C != -1.0f)
        {
            if (lbl_802F200C <= (float)r22)
                break;
        }
        if (r28->unkC > 0xAE)
            r23 = func_80071E58_inline(*str, r28->unkC, font);
        else
            r23 = get_char_width(str, r28->unkC, font);
        f17 = font->unk10 * (0.5 * (font->spaceWidth - r23) / (font->spaceWidth));
        f16 = g_get_char_ratio(str, r28->unkC);
        if (*str == '\n')
        {
            r28->unk4 = r28->unk0;
            r28->unk8 += font->lineHeight * r28->unk24;
            continue;
        }
        else if (*str == ' ' || *str < font->unk4 || *str > font->unk8)
        {
            r22++;
            r28->unk4 += f16 * (r23 * r28->unk20);
            parseState.unkC += r23;
            continue;
        }
        glyphIndex = *str;
        if (r28->unkC > 0xAE)
        {
            skip = 0;
            sp18 = 0;
            color = params.unk38;
            glyphIndex = parse_char_sequence(&parseState, str, &color, &skip, &sp18);
            str += skip;
            params.unk38 = color;
            if (sp18 == 1)
            {
                r28->unkC = FONT_JAP_24x24_2;
                font = &fontInfo[r28->unkC];
            }
            else if (sp18 == 2)
            {
                r28->unkC = FONT_JAP_24x24_2P;
                font = &fontInfo[r28->unkC];
            }
            else if (sp18 == 0x46)
                r28->unk20 = 0.7f;
            else if (sp18 == 0x50)
                r28->unk20 = 0.8f;
            else if (sp18 == 0x5A)
                r28->unk20 = 0.9f;
            else if (sp18 == 0x64)
                r28->unk20 = 1.0f;
            if (glyphIndex == -1)
            {
                r28->unk4 += (float)r23 * r28->unk20;
                continue;
            }
            else if (glyphIndex == -2)
                continue;
            else
            {
                float f0;

                switch (r28->unkC)
                {
                case FONT_JAP_24x24_2P:
                case FONT_JAP_24x24_2Pg:
                    if (glyphIndex >= 0xC8)
                    {
                        int r4 = lbl_80117A80[glyphIndex - 0xC8];

                        if (r4 != -1)
                        {
                            int r6 = r4 + 1;

                            if (r6 < 24)
                                r6 = r4 + 1;
                            else
                                r6 = r6 = 24;
                            f0 = (float)r6 / (float)fontInfo[r28->unkC].spaceWidth;
                            break;
                        }
                    }
                    // fall through
                default:
                    f0 = 1.0f;
                    break;
                }
                f16 = f0;
                if (parseState.mode & (1 << 17))
                    font = &fontInfo[FONT_JAP_24x24_I];
                else
                    font = &fontInfo[r28->unkC];
                params.bmpId = font->unk0;
            }
        }
        if (r28->unkC < 0xAE
         || lbl_802F200C < lbl_802F2008
         || !(parseState.mode & (1 << 16))
         || (unpausedFrameCounter % 60) < 45)
        {
            int div;
            int mod;
            float f0;
            float f1;

            div = (glyphIndex - font->unk4) / font->unkC;
            mod = (glyphIndex - font->unk4) % font->unkC;
            params.x = r28->unk4 + font->unk20;
            params.y = r28->unk8 + font->unk22;
            f0 = font->unk10 * mod;
            f1 = font->unk14 * div;
            params.u1 = f17 + (f0 + font->unk18 * font->unk20);
            params.v1 = f1 + font->unk1C * font->unk22;
            params.u2 = font->unk10 + (f0 - font->unk18 * font->unk21) - f17 - font->unk10 * CLAMP(1.0 - r28->unk20, 0.0, 1.0) * 0.1;
            params.v2 = font->unk14 + (f1 - font->unk1C * font->unk23);
            params.zoomX = r28->unk20 * ((font->unk10 - (font->unk18 * font->unk20)) - (font->unk18 * font->unk21) - f17 * 2.0);
            params.zoomY = r28->unk24 * (font->unk14 - font->unk1C * font->unk22 - font->unk18 * font->unk23);
            if (r28->unkC == FONT_JAP_24x24_2Pg && *str == 'g')
                params.y += params.zoomY * 80.0;
            draw_naomi_sprite(&params);
        }
        r22++;
        r28->unk4 += f16 * (r23 * r28->unk20);
        str += parseState.unk8;
        parseState.unkC += r23;
    }

    r28->unkC = r25;
    r28->unk20 = f31;
}

float g_get_text_width(char *str)
{
    struct Struct8028CF28 *r29 = &lbl_8028CF28;
    int r25;
    struct FontParams *font;
    int r23;
    int r22;
    float width;
    float f23;
    struct NaomiSpriteParams params;
    struct StringParseState parseState;
    u8 dummy2[8];
    s32 skip;
    s32 sp1C;
    s32 color;
    u8 dummy[8];

    font = &fontInfo[r29->unkC];
    r22 = 0;
    r25 = r29->unkC;
    f23 = r29->unk20;
    parseState.mode = TEXT_MODE_ASCII;
    parseState.unk4 = -1;
    parseState.unk8 = 0;
    parseState.unkC = 0.0f;
    width = 0.0f;

    for (; *str != 0; str++)
    {
        float f1;
        int glyphIndex;

        if (lbl_802F1D04 != 4 && lbl_802F200C != -1.0f)
        {
            if (lbl_802F200C <= (float)r22)
                break;
        }
        if (r29->unkC > 0xAE)
            r23 = func_80071E58_inline(*str, r29->unkC, font);
        else
            r23 = get_char_width(str, r29->unkC, font);
        f1 = g_get_char_ratio(str, r29->unkC);
        if (*str == '\n')
            continue;
        if (*str == ' ' || *str < font->unk4 || *str > font->unk8)
        {
            r22++;
            width += r23 * r29->unk20 * f1;
            parseState.unkC += r23;
            continue;
        }
        glyphIndex = *str;
        if (r29->unkC > 0xAE)
        {
            color = params.unk38;
            skip = 0;
            sp1C = 0;
            glyphIndex = parse_char_sequence(&parseState, str, &color, &skip, &sp1C);
            params.unk38 = color;
            str += skip;
            if (sp1C == 1)
            {
                r29->unkC = FONT_JAP_24x24_2;
                font = &fontInfo[r29->unkC];
            }
            else if (sp1C == 2)
            {
                r29->unkC = FONT_JAP_24x24_2P;
                font = &fontInfo[r29->unkC];
            }
            else if (sp1C == 0x46)
                r29->unk20 = 0.7f;
            else if (sp1C == 0x50)
                r29->unk20 = 0.8f;
            else if (sp1C == 0x5A)
                r29->unk20 = 0.9f;
            else if (sp1C == 0x64)
                r29->unk20 = 1.0f;
            if (glyphIndex == -1)
            {
                width += r23 * r29->unk20;
                continue;
            }
            if (glyphIndex == -2)
                continue;
            switch (r29->unkC)
            {
            case FONT_JAP_24x24_2P:
            case FONT_JAP_24x24_2Pg:
                if (glyphIndex >= 0xC8)
                {
                    int foo = lbl_80117A80[glyphIndex - 0xC8];

                    if (foo != -1)
                    {
                        int r6 = foo + 1;

                        if (r6 < 24)
                            r6 = foo + 1;
                        else
                            r6 = r6 = 24;
                        f1 = (float)r6 / (float)fontInfo[r29->unkC].spaceWidth;
                        break;
                    }
                }
                // fall through
            default:
                f1 = 1.0f;
                break;
            }
            if (parseState.mode & (1 << 17))
                font = &fontInfo[FONT_JAP_24x24_I];
            else
                font = &fontInfo[r29->unkC];
        }
        r22++;
        width += r23 * r29->unk20 * f1;
        str += parseState.unk8;
        parseState.unkC += r23;
    }
    r29->unkC = r25;
    r29->unk20 = f23;
    return width;
}

void func_80072AC0(char *str, ...)
{
    va_list args;
    char buf[0x200];

    va_start(args, str);
    vsprintf(buf, str, args);
    va_end(args);
    func_80071E58(buf);
}

void func_80072B50(struct Sprite *sprite)
{
    lbl_8028CF28.unk0 = sprite->left;
    lbl_8028CF28.unk4 = sprite->left;
    lbl_8028CF28.unk8 = sprite->top;
    lbl_8028CF28.unkC = sprite->fontId;
    lbl_8028CF28.unk10 = (((int)(sprite->unk6C * 255.0f) & 0xFF) << 24)
                       | ((sprite->unkC & 0xFF) << 16)
                       | ((sprite->unkD & 0xFF) <<  8)
                       | ((sprite->unkE & 0xFF) <<  0);
    lbl_8028CF28.unk14 = (sprite->unk70 << 16)
                       | (sprite->unk71 << 8)
                       | (sprite->unk72 << 0);
    lbl_8028CF28.unk18 = sprite->unk68;
    lbl_8028CF28.unk1C = sprite->unk4C;
    lbl_8028CF28.unk20 = sprite->unk40;
    lbl_8028CF28.unk24 = sprite->unk44;
    lbl_8028CF28.unk28 = sprite->unk6C;
    lbl_8028CF28.unk2C = sprite->unk74;
    func_80071E58(sprite->text);
}

void func_80072C68(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;

    params.bmpId = sprite->bmpId;
    params.x = (sprite->left + sprite->right) / 2;
    params.y = (sprite->top + sprite->bottom) / 2;
    params.z = sprite->unk4C;
    params.zoomX = sprite->unk40;
    params.zoomY = sprite->unk44;
    params.u1 = sprite->unk7C;
    params.v1 = sprite->unk80;
    params.u2 = sprite->unk84;
    params.v2 = sprite->unk88;
    params.rotation = sprite->unk68;
    params.alpha = sprite->unk6C;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & ~0xF) | 10;
    params.unk38 = (((int)(sprite->unk6C * 255.0f) & 0xFF) << 24)
              | ((sprite->unkC & 0xFF) << 16)
              | ((sprite->unkD & 0xFF) <<  8)
              | ((sprite->unkE & 0xFF) <<  0);
    params.unk3C = (sprite->unk70 << 16)
              | (sprite->unk71 << 8)
              | (sprite->unk72 << 0);
    draw_naomi_sprite(&params);
}

float func_80072DA8(int fontId, char *str, int c)
{
    int r27;
    struct FontParams *font;
    float f31;
    struct StringParseState parseState;
    s32 skip;
    s32 sp20;
    s32 color;
    u8 dummy[8];

    font = &fontInfo[fontId];
    r27 = 0;
    f31 = 1.0f;
    parseState.mode = TEXT_MODE_ASCII;
    parseState.unk4 = -1;
    parseState.unk8 = 0;
    parseState.unkC = 0.0f;

    for (; *str != 0; str++)
    {
        int glyphIndex;
        float f2;

        if (*str == ' ')
        {
            parseState.unkC += func_80071E58_inline(*str, fontId, font) * f31;
            r27++;
            continue;
        }
        skip = 0;
        color = 0;
        sp20 = 0;
        glyphIndex = parse_char_sequence(&parseState, str, &color, &skip, &sp20);
        if (sp20 == 1)
        {
            font = &fontInfo[FONT_JAP_24x24_2];
            fontId = FONT_JAP_24x24_2;
        }
        else if (sp20 == 2)
        {
            font = &fontInfo[FONT_JAP_24x24_2P];
            fontId = FONT_JAP_24x24_2P;
        }
        else if (sp20 == 0x46)
            f31 = 0.7f;
        else if (sp20 == 0x50)
            f31 = 0.8f;
        else if (sp20 == 0x5A)
            f31 = 0.9f;
        else if (sp20 == 0x64)
            f31 = 1.0f;
        str += skip;
        if (glyphIndex == -1 || glyphIndex == -2)
            continue;
        switch (fontId)
        {
        case FONT_JAP_24x24_2P:
        case FONT_JAP_24x24_2Pg:
            if (glyphIndex >= 0xC8)
            {
                int foo = lbl_80117A80[glyphIndex - 0xC8];

                if (foo != -1)
                {
                    int r6 = foo + 1;

                    if (r6 < 24)
                        r6 = foo + 1;
                    else
                        r6 = r6 = 24;
                    f2 = (float)r6 / (float)fontInfo[fontId].spaceWidth;
                    break;
                }
            }
        default:
            f2 = 1.0f;
            break;
        }
        r27++;
        parseState.unkC += f31 * (font->spaceWidth * f2);
        str += parseState.unk8;
    }
    if (c == 0)
        return r27;
    else
        return parseState.unkC;
}

float get_ascii_text_width(char *str)
{
    return func_80072DA8(FONT_ASCII, str, 0);
}

int get_jpn_text_width(int fontId, char *str)
{
    return func_80072DA8(fontId, str, 1);
}

void func_800730B4(void)
{
    struct NaomiSpriteParams params;

    if (screenFadeInfo.unk8 == 0)
        return;
    if (gameMode == MD_OPTION)
    {
        if ((screenFadeInfo.unk0 & 0xFF) != 2)
            screenFadeInfo.unk8--;
    }
    else
    {
        if (!(gamePauseStatus & 0xA) && (screenFadeInfo.unk0 & 0xFF) != 2)
            screenFadeInfo.unk8--;
    }
    switch (screenFadeInfo.unk0 & 0xFF)
    {
    case 0:
        params.alpha = (float)screenFadeInfo.unk8 / (float)screenFadeInfo.unkC;
        break;
    case 1:
        params.alpha = 1.0 - (float)screenFadeInfo.unk8 / (float)screenFadeInfo.unkC;
        break;
    case 2:
        params.alpha = 1.0f;
        break;
    }
    params.bmpId = BITMAP_ID(BMP_COM, BMP_COM_white_mask8x8);
    params.x = 320.0f;
    params.y = 240.1f;
    params.z = (screenFadeInfo.unk0 & (1 << 8)) ? 0.009 : 0.25;
    params.zoomX = 80.0f;
    params.zoomY = 60.0f;
    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.rotation = 0;
    params.unk30 = -1;
    params.flags = 0x2000A;
    params.unk38 = screenFadeInfo.unk4;
    params.unk3C = 0;
    draw_naomi_sprite(&params);
    if ((screenFadeInfo.unk0 & 0xFF) == 1 && screenFadeInfo.unk8 == 0)
    {
        screenFadeInfo.unk0 = (screenFadeInfo.unk0 & (1 << 8)) ? 0x102 : 0x2;
        screenFadeInfo.unk8 = 1;
        screenFadeInfo.unkC = 0;
    }
}

void g_start_screen_fade(s32 a, int b, int duration)
{
    if ((a & 0xFF) != 2 && duration > 3)
        duration -= 3;

    if ((screenFadeInfo.unk0 & 0xFF) == (a & 0xFF)
     && (screenFadeInfo.unk0 & 0xFF) != 2
     && screenFadeInfo.unk8 > 0)
        return;

    if ((a & 0xFF) == 1 && (screenFadeInfo.unk0 & 0xFF) == 0 && screenFadeInfo.unk8 > 0)
    {
        screenFadeInfo.unk0 = (screenFadeInfo.unk0 & 0xFF00) | 1;
        screenFadeInfo.unk8 = duration - screenFadeInfo.unk8 * ((float)duration / (float)screenFadeInfo.unkC);
        screenFadeInfo.unkC = duration;
    }
    else if ((a & 0xFF) == 1 && (screenFadeInfo.unk0 & 0xFF) == 1 && screenFadeInfo.unk8 > 0)
    {
        screenFadeInfo.unk0 = (screenFadeInfo.unk0 & 0xFF00) | 1;
        screenFadeInfo.unk8 = duration - screenFadeInfo.unk8 * ((float)duration / (float)screenFadeInfo.unkC);
        screenFadeInfo.unkC = duration;
    }
    else if ((a & 0xFF) == 0 && (screenFadeInfo.unk0 & 0xFF) == 0 && screenFadeInfo.unk8 > 0)
    {
        screenFadeInfo.unk0 = (screenFadeInfo.unk0 & 0xFF00);
        screenFadeInfo.unk8 = duration - screenFadeInfo.unk8 * ((float)duration / (float)screenFadeInfo.unkC);
        screenFadeInfo.unkC = duration;
    }
    else if ((a & 0xFF) == 0 && (screenFadeInfo.unk0 & 0xFF) == 1 && screenFadeInfo.unk8 > 0)
    {
        screenFadeInfo.unk0 = (screenFadeInfo.unk0 & 0xFF00);
        screenFadeInfo.unk8 = duration - screenFadeInfo.unk8 * ((float)duration / (float)screenFadeInfo.unkC);
        screenFadeInfo.unkC = duration;
    }
    else
    {
        screenFadeInfo.unk0 = a;
        if ((a & 0xFF) != 0)
            screenFadeInfo.unk4 = b;
        screenFadeInfo.unk8 = duration;
        screenFadeInfo.unkC = duration;
    }
}

static inline int append_to_sprite_params_buf(struct NaomiSpriteParams *params)
{
    if (spriteParamsBufCount == 256)
    {
        func_8003026C(2, "nlSprPut : SPRITE BUFFER OVER !! bmp %d\n", params->bmpId);
        OSReport("nlSprPut : SPRITE BUFFER OVER !! bmp %d\n", params->bmpId);
        return 0;
    }

    memcpy(&spriteParamsBuf[spriteParamsBufCount], params, sizeof(struct NaomiSpriteParams));
    spriteParamsBufCount++;
    return 1;
}

int add_naomi_sprite(struct NaomiSpriteParams *params)
{
    int r4;

    switch (lbl_802F1D04)
    {
    case 0:
        if (append_to_sprite_params_buf(params))
            return 1;
        else
            return 1;
        break;
    case 1:
        if (!(params->flags & (1 << 18))
         && screenFadeInfo.unk8 > 0
         && ((screenFadeInfo.unk0 & (1 << 8)) ? 0.009 : 0.25) > params->z
         && append_to_sprite_params_buf(params))
            return 1;
        if ((advDemoInfo.flags & (1 << 7))
         && (params->bmpId == BITMAP_ID(BMP_COM, BMP_COM_banana_01) || params->bmpId == BITMAP_ID(BMP_COM, BMP_COM_banana_10))
         && append_to_sprite_params_buf(params))
            return 1;
        break;
    }
    return 0;
}

int draw_naomi_sprite(struct NaomiSpriteParams *params)
{
    Vec sp54 = {0};
    Vec sp48 = {0};
    Vec sp3C = {0};
    Vec sp30 = {0};
    GXColor sp2C;
    u32 dummy;
    float z;
    float f30;
    float f29;
    float f28;
    float f27;
    float f1;
    float f2;
    float texWidth;
    float texHeight;
    float zero;
    GXBool r30;
    s32 r29;
    u8 r28;

    if (add_naomi_sprite(params))
        return 0;

    if (!bitmapGroups[((u32)params->bmpId >> 8) & 0xFF].isLoaded)
    {
        printf(
            "SPRITE WARNING!! bmp_%s's category %s is not load\n",
            bitmapNames[params->bmpId >> 8][params->bmpId & 0xFF],
            bitmapGroups[params->bmpId >> 8].name);
        return 0;
    }

    z = -params->z;
    f1 = params->x;
    f2 = params->y;
    texWidth  = bitmapGroups[(params->bmpId >> 8) & 0xFF].tpl->texHeaders[params->bmpId & 0xFF].width;
    texHeight = bitmapGroups[(params->bmpId >> 8) & 0xFF].tpl->texHeaders[params->bmpId & 0xFF].height;
    f30 = params->u1;
    f29 = params->u2;
    f28 = params->v1;
    f27 = params->v2;

    switch (params->flags & 3)
    {
    default:
    case 0:
    case 1:
        sp54.x = sp3C.x = 0.0f;
        sp48.x = sp30.x = texWidth;
        break;
    case 2:
        sp54.x = sp3C.x = -texWidth / 2.0;
        sp48.x = sp30.x = texWidth / 2.0;
        break;
    case 3:
        sp54.x = sp3C.x = -texWidth;
        sp48.x = sp30.x = 0.0f;
        break;
    }

    switch ((params->flags >> 2) & 3)
    {
    default:
    case 0:
    case 1:
        sp54.y = sp48.y = 0.0f;
        sp3C.y = sp30.y = texHeight;
        break;
    case 2:
        sp54.y = sp48.y = -texHeight / 2.0;
        sp3C.y = sp30.y = texHeight  / 2.0;
        break;
    case 3:
        sp54.y = sp48.y = -texHeight;
        sp3C.y = sp30.y = 0.0f;
        break;
    }

    // Transform all vertices
    mathutil_mtxA_from_translate_xyz(f1, f2, 0.0f);
    mathutil_mtxA_rotate_z((s16)-params->rotation);
    mathutil_mtxA_scale_xyz(params->zoomX, params->zoomY, 1.0f);
    mathutil_mtxA_tf_point(&sp54, &sp54);
    mathutil_mtxA_tf_point(&sp48, &sp48);
    mathutil_mtxA_tf_point(&sp3C, &sp3C);
    mathutil_mtxA_tf_point(&sp30, &sp30);

    if (params->flags & (1 << 18))
    {
        float f0 = params->z * 0.002405626;

        sp54.x = (sp54.x - 320.0f) * f0;
        sp54.y = -((sp54.y - 240.0f) * f0);
        sp48.x = (sp48.x - 320.0f) * f0;
        sp48.y = -((sp48.y - 240.0f) * f0);
        sp3C.x = (sp3C.x - 320.0f) * f0;
        sp3C.y = -((sp3C.y - 240.0f) * f0);
        sp30.x = (sp30.x - 320.0f) * f0;
        sp30.y = -((sp30.y - 240.0f) * f0);
    }

    if (params->flags & (1 << 19))
    {
        f30 = params->u2;
        f29 = params->u1;
    }
    if (params->flags & (1 << 20))
    {
        f28 = params->v2;
        f27 = params->v1;
    }

    GXLoadTexObj_cached(&bitmapGroups[(params->bmpId >> 8) & 0xFF].tpl->texObjs[params->bmpId & 0xFF], GX_TEXMAP0);
    sp2C.r = (params->unk38 >> 16);
    sp2C.g = (params->unk38 >> 8);
    sp2C.b = (params->unk38 >> 0);
    sp2C.a = params->alpha * 255.0f;
    GXSetTevColor(1, sp2C);
    sp2C.r = (params->unk3C >> 16);
    sp2C.g = (params->unk3C >> 8);
    sp2C.b = (params->unk3C >> 0);
    sp2C.a = (params->unk3C >> 24);
    GXSetTevColor(2, sp2C);

    if (params->flags & (1 << 21))
    {
        GXCompare *r4 = &gxCache->compareFunc;
        r30 = gxCache->compareEnable;
        r29 = *r4;
        r28 = gxCache->updateEnable;
        r29 = *r4;
        CHANGE_Z_MODE(1, 7, 1);
    }

    zero = 0.0f;
    GXBegin(GX_QUADS, GX_VTXFMT7, 4);
        GXPosition3f32(sp54.x, sp54.y, z);
        GXTexCoord2f32(f30 + zero, f28 + zero);
        GXPosition3f32(sp48.x, sp48.y, z);
        GXTexCoord2f32(f29 - zero, f28 + zero);
        GXPosition3f32(sp30.x, sp30.y, z);
        GXTexCoord2f32(f29 - zero, f27 - zero);
        GXPosition3f32(sp3C.x, sp3C.y, z);
        GXTexCoord2f32(f30 + zero, f27 - zero);
    GXEnd();

    if (params->flags & (1 << 21))
    {
        CHANGE_Z_MODE(r28, r29, r30);
    }
    return 0;
}

void func_80073E00(int a, GXTexWrapMode s, GXTexWrapMode t)
{
    GXInitTexObjWrapMode(&bitmapGroups[(a >> 8) & 0xFF].tpl->texObjs[a & 0xFF], s, t);
}
