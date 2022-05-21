#include <math.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "bitmap.h"
#include "event.h"
#include "gxcache.h"
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"
#include "textbox.h"

struct TextDrawInfo
{
    float startX;
    float x;
    float y;
    s32 fontId;
    u32 mulColor;
    u32 addColor;
    s16 unk18;
    float unk1C;
    float scaleX;
    float scaleY;
    float opacity;
    u32 unk2C;
};

struct Struct8028FE58
{
    struct Sprite *unk0;
    struct Struct8028FE58 *unk4;
    struct Struct8028FE58 *unk8;
};

// .bss
struct TextDrawInfo textDrawInfo;
FORCE_BSS_ORDER(textDrawInfo)
struct Sprite spriteInfo[64];
FORCE_BSS_ORDER(spriteInfo)
struct Struct8028FE58 lbl_8028FE58[0x42];
FORCE_BSS_ORDER(lbl_8028FE58)
struct ScreenFadeInfo screenFadeInfo;
FORCE_BSS_ORDER(screenFadeInfo)

extern struct PoolInfo poolInfo;  // 0x80205988

void ev_sprite_init(void)
{
    s8 *status = poolInfo.spriteStatusList;
    int i;

    for (i = 0; i < poolInfo.unk38; i++, status++)
        *status = 0;

    textDrawInfo.startX = 0.0f;
    textDrawInfo.x = 0.0f;
    textDrawInfo.y = 0.0f;
    textDrawInfo.fontId = 0;
    textDrawInfo.mulColor = RGBA(255, 255, 255, 255);
    textDrawInfo.addColor = RGBA(0, 0, 0, 0);
    textDrawInfo.unk18 = 0;
    textDrawInfo.unk1C = 0.1f;
    textDrawInfo.scaleX = 1.0f;
    textDrawInfo.scaleY = 1.0f;
    textDrawInfo.opacity = 1.0f;
    textbox_init();
}

void ev_sprite_main(void)
{
    struct Sprite *sprite;
    s8 *status;
    int i = 0;

    if (gamePauseStatus & 0xA)
        return;
    lbl_802F2000 = 0;
    status = poolInfo.spriteStatusList;
    sprite = spriteInfo;
    for (i = 0; i < poolInfo.unk38; i++, sprite++, status++)
    {
        if (*status != 0)
        {
            lbl_802F2000 |= 1 << sprite->tag;
            if (sprite->mainFunc != NULL)
                sprite->mainFunc(status, sprite);
        }
    }
    textbox_main();
}

void ev_sprite_dest(void)
{
    struct Sprite *sprite;
    s8 *status;
    int i = 0;

    sprite = spriteInfo;
    status = poolInfo.spriteStatusList;
    for (; i < 64; i++, sprite++, status++)
    {
        if (*status != 0)
        {
            if (sprite->destFunc != NULL)
                sprite->destFunc(sprite);
            *status = 0;
        }
    }

    poolInfo.unk34 = 0;
    lbl_802F2000 = 0;
    textbox_destroy_all();
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

    r11 = poolInfo.spriteStatusList;
    for (i = 0; i < poolInfo.unk38; r8++, i++, r11++)
    {
        if (*r11 != 0 && (!r31 || r8->tag == 100))
        {
            if (a == 0)
            {
                if ((r8->flags & (1<<18)) == 0)
                    continue;
            }
            else
            {
                if ((r8->flags & (1<<18)) != 0)
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
        while (r31_->next != 0)
        {
            g_something_with_sprites(r31_->next);
            r31_ = r31_->next;
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
    textbox_draw_all();
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
    if (poolInfo.spriteStatusList[sprite->unk2] != 0 && sprite->unk50 == NULL)
    {
        g_something_with_sprites(sprite);
        while (sprite->next != NULL)
        {
            g_something_with_sprites(sprite->next);
            sprite = sprite->next;
        }
    }
}

struct {s32 x; s32 y;} spriteTileOffsets[] =
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

// single kanji
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
    calc_sprite_bounds(sprite, &sprite->left, &sprite->top, &sprite->right, &sprite->bottom);
    if (sprite->drawFunc != NULL)
    {
        sprite->drawFunc(sprite);
        return;
    }
    switch (sprite->type)
    {
    case SPRITE_TYPE_TEXT:
        g_draw_text_sprite(sprite);
        break;
    case SPRITE_TYPE_BITMAP:
        if (!bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].isLoaded)
        {
            printf("SPRITE WARNING!! %s's category %s is not load\n",
                bitmapNames[sprite->bmpId >> 8][sprite->bmpId & 0xFF],
                bitmapGroups[sprite->bmpId >> 8].name);
            break;
        }
        draw_bitmap_sprite(sprite);
        break;
    case SPRITE_TYPE_TILED_BITMAP:
        if (!bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].isLoaded)
        {
            printf("SPRITE WARNING!! %s's category %s is not load\n",
                bitmapNames[sprite->bmpId >> 8][sprite->bmpId & 0xFF],
                bitmapGroups[sprite->bmpId >> 8].name);
            break;
        }
        r26 = sprite->bmpId & 0xFF;
        r29 = sprite->bmpId;
        x = sprite->x;
        y = sprite->y;
        for (i = 0; i < 8; i++)
        {
            sprite->bmpId = (r29 & 0xFF00) | r26;
            sprite->x = (float)(x + spriteTileOffsets[i].x);
            sprite->y = (float)(y + spriteTileOffsets[i].y);
            calc_sprite_bounds(sprite, &sprite->left, &sprite->top, &sprite->right, &sprite->bottom);
            draw_bitmap_sprite(sprite);
            r26++;
        }
        sprite->bmpId = r29;
        sprite->x = x;
        sprite->y = y;
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
    int index = pool_alloc(poolInfo.unk30, 2);

    if (index < 0)
        return NULL;
    else
    {
        struct Sprite *sprite = &spriteInfo[index];

        memset(sprite, 0, sizeof(*sprite));
        sprite->unk2 = index;
        sprite->unk4C = 0.1f;
        sprite->mulR = 255;
        sprite->mulG = 255;
        sprite->mulB = 255;
        sprite->scaleX = 1.0f;
        sprite->scaleY = 1.0f;
        sprite->opacity = 1.0f;
        sprite->left = 0;
        sprite->top = 0;
        sprite->right = 1;
        sprite->bottom = 1;
        sprite->unk7C = 0.0f;
        sprite->unk80 = 0.0f;
        sprite->unk84 = 1.0f;
        sprite->unk88 = 1.0f;
        sprite->flags = 0x20000;
        return sprite;
    }
}

struct Sprite *create_linked_sprite(struct Sprite *sprite)
{
    struct Sprite *newSprite = create_sprite();
    if (newSprite != NULL)
    {
        sprite->next = newSprite;
        newSprite->unk50 = sprite;
        newSprite->flags |= sprite->flags & (1 << 18);
    }
    return newSprite;
}

void destroy_sprite_with_tag(int tag)
{
    struct Sprite *sprite = spriteInfo;
    s8 *status = poolInfo.spriteStatusList;
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
    s8 *status = poolInfo.spriteStatusList;
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
    s8 *status = poolInfo.spriteStatusList;
    int i;

    for (i = 0; i < 64; i++, sprite++, status++)
    {
        if (*status != 0 && sprite->tag == tag)
            return sprite;
    }
    return NULL;
}

void calc_sprite_bounds(struct Sprite *sprite, s32 *left, s32 *top, s32 *right, s32 *bottom)
{
    int width = 0;
    int height = 0;
    struct FontParams *fontParams;
    int x;
    int y;
    int len;

    if (sprite->drawFunc != NULL)
    {
        *left   = sprite->x - 50.0f;
        *top    = sprite->y - 50.0f;
        *right  = sprite->x + 50.0f;
        *bottom = sprite->y + 50.0f;
        return;
    }
    else
    {
        fontParams = &fontInfo[sprite->fontId];
        switch (sprite->type)
        {
        case SPRITE_TYPE_TEXT:
            len = strlen(sprite->text);
            width = len * fontParams->spaceWidth;
            height = fontParams->lineHeight;
            if (sprite->fontId > FONT_JAP_TAG)  // Japanese font
            {
                width = g_get_jpn_text_width(sprite->fontId, sprite->text);
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
        case SPRITE_TYPE_BITMAP:
        case SPRITE_TYPE_TILED_BITMAP:
            if (!bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].isLoaded)
            {
                printf("SPRITE WARNING!! %s's category %s is not load\n",
                    bitmapNames[sprite->bmpId >> 8][sprite->bmpId & 0xFF],
                    bitmapGroups[sprite->bmpId >> 8].name);
                *left   = sprite->x - 50.0f;
                *top    = sprite->y - 50.0f;
                *right  = sprite->x + 50.0f;
                *bottom = sprite->y + 50.0f;
                return;
            }
            width = bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].tpl->texHeaders[sprite->bmpId & 0xFF].width;
            height = bitmapGroups[(sprite->bmpId & 0xFF00) >> 8].tpl->texHeaders[sprite->bmpId & 0xFF].height;
            break;
        }
    }

    width *= sprite->scaleX;
    height *= sprite->scaleY;
    if (sprite->unk50 == NULL)
    {
        x = sprite->x;
        y = sprite->y;
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
        x += sprite->x;
        y += sprite->y;
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
    TEXT_MODE_HIRAGANA,
    TEXT_MODE_KATAKANA,
    TEXT_MODE_PICTURE,

    // flags
    TEXT_MODE_BLINK = 0x10000,
};

/* Returns the next glyph index or a negative number if a control code was
 * encountered */
int parse_char_sequence(struct StringParseState *parseState, char *str, s32 *color, s32 *skip, s32 *special)
{
    s32 glyphIndex;
    int mode;

    parseState->unk8 = 0;

    // "h/" - switch to hiragana mode
    if (str[0] == 'h' && str[1] == '/')
    {
        parseState->mode = (parseState->mode & 0xFFFF0000) | TEXT_MODE_HIRAGANA;
        *skip = 1;
        return -2;
    }

    // "k/" - switch to katakana mode
    if (str[0] == 'k' && str[1] == '/')
    {
        parseState->mode = (parseState->mode & 0xFFFF0000) | TEXT_MODE_KATAKANA;
        *skip = 1;
        return -2;
    }

    // "a/" - switch to ASCII mode
    if (str[0] == 'a' && str[1] == '/')
    {
        parseState->mode = (parseState->mode & 0xFFFF0000) | TEXT_MODE_ASCII;
        *skip = 1;
        return -2;
    }

    // "p/" - switch to picture mode for displaying icons or kanji
    if (str[0] == 'p' && str[1] == '/')
    {
        parseState->mode = (parseState->mode & 0xFFFF0000) | TEXT_MODE_PICTURE;
        *skip = 1;
        return -2;
    }

    // "c/0xrrggbb/" - change text color (where rrggbb is the hex value of the color)
    // the "0x" prefix is mandatory and the hex must be lowercase
    if (str[0] == 'c' && str[1] == '/')
    {
        int shift = 20;

        // skip over the "c/0x" part
        *skip += 4;
        str += 4;

        *color = 0;
        while (*str != '/')
        {
            int digit;
            switch (*str)
            {
            case '0': digit = 0; break;
            case '1': digit = 1; break;
            case '2': digit = 2; break;
            case '3': digit = 3; break;
            case '4': digit = 4; break;
            case '5': digit = 5; break;
            case '6': digit = 6; break;
            case '7': digit = 7; break;
            case '8': digit = 8; break;
            case '9': digit = 9; break;
            case 'a': digit = 10; break;
            case 'b': digit = 11; break;
            case 'c': digit = 12; break;
            case 'd': digit = 13; break;
            case 'e': digit = 14; break;
            case 'f': digit = 15; break;
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

    // "b/" "/b" - blinking text
    if (str[0] == 'b' && str[1] == '/')
    {
        parseState->mode |= TEXT_MODE_BLINK;
        *skip = 1;
        return -2;
    }
    if (str[0] == '/' && str[1] == 'b')
    {
        parseState->mode &= ~TEXT_MODE_BLINK;
        *skip = 1;
        return -2;
    }

    // "ft/" - unknown
    if (str[0] == 'f' && str[1] == 't' && str[2] == '/')
    {
        *special = 1;
        *skip = 2;
        return -2;
    }

    // "fp/" - unknown
    if (str[0] == 'f' && str[1] == 'p' && str[2] == '/')
    {
        *special = 2;
        *skip = 2;
        return -2;
    }

    // "z?/" - squish text horizontally
    // where ? is r for normal size, 9 for 90%, 8 for 80%, or 7 for 70%.
    if (str[0] == 'z' && str[2] == '/')
    {
        switch (str[1])
        {
        case 'r':
            *special = 100;
            break;
        case '9':
            *special = 90;
            break;
        case '8':
            *special = 80;
            break;
        case '7':
            *special = 70;
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
    // hiragana/katakana character
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
    // icon or kanji
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
            int len;
            struct GlyphDesc *glyph;

            glyphIndex = -2;

            for (len = 0; str[len] != '/'; len++)
                ;

            // check symbol glyphs
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
                if (len == j && len == (u32)strlen(glyph->text))
                {
                    glyphIndex = glyph->unk4;
                    parseState->unk8 = j;
                    break;
                }
                glyph++;
            }
            if (glyphIndex == -2)
            {
                // check button glyphs
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
                    if (len == j && len == (u32)strlen(glyph->text))
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
                // check single kanji
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
                    if (len == j && len == (u32)strlen(glyph->text))
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
                // check double kanji
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
                    if (len == j && len == (u32)strlen(glyph->text))
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
int get_font_bitmap_id(int fontId)
{
    return fontInfo[fontId].bmpId;
}
#pragma force_active reset

void reset_text_draw_settings(void)
{
    textDrawInfo.fontId = 0;
    textDrawInfo.mulColor = RGBA(255, 255, 255, 0);
    textDrawInfo.addColor = RGBA(0, 0, 0, 0);
    textDrawInfo.unk18 = 0;
    textDrawInfo.unk1C = 0.1f;
    textDrawInfo.scaleX = 1.0f;
    textDrawInfo.scaleY = 1.0f;
    textDrawInfo.opacity = 1.0f;
    textDrawInfo.unk2C = 0x20000;
}

void set_text_font(int fontId)
{
    textDrawInfo.fontId = fontId;
}

void set_text_mul_color(u32 color)
{
    textDrawInfo.mulColor = color & 0xFFFFFF;
}

void set_text_add_color(u32 color)
{
    textDrawInfo.addColor = color;
}

#pragma force_active on
void func_80071B08(int a)
{
    textDrawInfo.unk18 = a;
}
#pragma force_active reset

void func_80071B1C(float a)
{
    textDrawInfo.unk1C = a;
}

void set_text_scale(float scaleX, float scaleY)
{
    textDrawInfo.scaleX = scaleX;
    textDrawInfo.scaleY = scaleY;
}

void set_text_opacity(float opacity)
{
    textDrawInfo.opacity = opacity;
}

void func_80071B50(int a)
{
    textDrawInfo.unk2C = a;
}

void set_text_pos(float x, float y)
{
    textDrawInfo.x = x;
    textDrawInfo.startX = x;
    textDrawInfo.y = y;
}

#ifdef NONMATCHING
void g_draw_char(char chr)
{
    struct NaomiSpriteParams params;  // sp + 0x10
    struct FontParams *font = &fontInfo[textDrawInfo.fontId];  // r5
    int r6 = chr - font->firstChar;
    int div = r6 / font->unkC;
    int mod = r6 % font->unkC;
    float f4;
    float f5;
    //float f0;

    params.bmpId = font->bmpId;
    params.x = textDrawInfo.x + font->unk18 * font->unk20 /*0xC4*/;
    params.y = textDrawInfo.y + font->unk1C * font->unk22 /*0xBC*/;
    params.z = textDrawInfo.unk1C;
    f4 = font->unk10 * mod;
    f5 = font->unk14 * div;  /*0xAC*/
    params.u1 = f4 + font->unk18 * font->unk20;
    params.v1 = f5 + font->unk1C * font->unk22;
    params.u2 = font->unk10 + (f4 - font->unk18 * font->unk21);
    params.v2 = font->unk14 + (f5 - font->unk1C * font->unk23);
    params.scaleX = textDrawInfo.scaleX * ((font->unk10 - font->unk18 * font->unk20) - font->unk18 * font->unk21);
    //f0 = font->unk18 * font->unk23;
    params.scaleY = textDrawInfo.scaleY * ((font->unk14 - font->unk1C * font->unk22) - font->unk18 * font->unk23);

    params.rotation = textDrawInfo.unk18;
    params.opacity = textDrawInfo.opacity;
    params.unk30 = -1;
    params.flags = (textDrawInfo.unk2C & ~0xF) | 5;
    params.mulColor = ((int)(255.0f * textDrawInfo.opacity) << 24) | textDrawInfo.mulColor;
    params.addColor = textDrawInfo.addColor;
    draw_naomi_sprite(&params);
}
#else
asm void g_draw_char(char chr)
{
    nofralloc
#include "../asm/nonmatchings/g_draw_char.s"
}
#pragma peephole on
#endif

static inline int func_80071E58_inline(int chr, int fontId, struct FontParams *font)
{
    switch (fontId)
    {
    case FONT_JAP_24x24_2P:
    case FONT_JAP_24x24_2Pg:
        switch (chr)
        {
        case ' ':
            return 12;
        }
    default:
    case FONT_JAP_24x24_I:
        return font->spaceWidth;
        break;
    }
}

void g_draw_text(char *str)
{
    struct TextDrawInfo *drawInfo = &textDrawInfo;
    int fontIdBackup;
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
    s32 special;
    s32 color;

    font = &fontInfo[drawInfo->fontId];
    r22 = 0;
    fontIdBackup = drawInfo->fontId;

    params.bmpId = font->bmpId;
    params.z = drawInfo->unk1C;
    params.opacity = drawInfo->opacity;
    params.rotation = drawInfo->unk18;
    params.mulColor = ((int)(drawInfo->opacity * 255.0f) << 24) | drawInfo->mulColor;
    params.addColor = drawInfo->addColor;
    params.unk30 = -1;
    params.flags = (drawInfo->unk2C & ~0xF) | 5;
    f31 = drawInfo->scaleX;
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
        if (drawInfo->fontId > FONT_JAP_TAG)
            r23 = func_80071E58_inline(*str, drawInfo->fontId, font);
        else
            r23 = get_char_width(str, drawInfo->fontId, font);
        f17 = font->unk10 * (0.5 * (font->spaceWidth - r23) / (font->spaceWidth));
        f16 = g_get_char_ratio(str, drawInfo->fontId);
        if (*str == '\n')
        {
            drawInfo->x = drawInfo->startX;
            drawInfo->y += font->lineHeight * drawInfo->scaleY;
            continue;
        }
        else if (*str == ' ' || *str < font->firstChar || *str > font->lastChar)
        {
            r22++;
            drawInfo->x += f16 * (r23 * drawInfo->scaleX);
            parseState.unkC += r23;
            continue;
        }
        glyphIndex = *str;
        if (drawInfo->fontId > FONT_JAP_TAG)
        {
            skip = 0;
            special = 0;
            color = params.mulColor;
            glyphIndex = parse_char_sequence(&parseState, str, &color, &skip, &special);
            str += skip;
            params.mulColor = color;
            if (special == 1)
            {
                drawInfo->fontId = FONT_JAP_24x24_2;
                font = &fontInfo[drawInfo->fontId];
            }
            else if (special == 2)
            {
                drawInfo->fontId = FONT_JAP_24x24_2P;
                font = &fontInfo[drawInfo->fontId];
            }
            else if (special == 70)
                drawInfo->scaleX = 0.7f;
            else if (special == 80)
                drawInfo->scaleX = 0.8f;
            else if (special == 90)
                drawInfo->scaleX = 0.9f;
            else if (special == 100)
                drawInfo->scaleX = 1.0f;
            if (glyphIndex == -1)
            {
                drawInfo->x += (float)r23 * drawInfo->scaleX;
                continue;
            }
            else if (glyphIndex == -2)
                continue;
            else
            {
                float f0;

                switch (drawInfo->fontId)
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
                            f0 = (float)r6 / (float)fontInfo[drawInfo->fontId].spaceWidth;
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
                    font = &fontInfo[drawInfo->fontId];
                params.bmpId = font->bmpId;
            }
        }
        if (drawInfo->fontId < FONT_JAP_TAG
         || lbl_802F200C < lbl_802F2008
         || !(parseState.mode & TEXT_MODE_BLINK)
         || (unpausedFrameCounter % 60) < 45)
        {
            int div;
            int mod;
            float f0;
            float f1;

            div = (glyphIndex - font->firstChar) / font->unkC;
            mod = (glyphIndex - font->firstChar) % font->unkC;
            params.x = drawInfo->x + font->unk20;
            params.y = drawInfo->y + font->unk22;
            f0 = font->unk10 * mod;
            f1 = font->unk14 * div;
            params.u1 = f0 + font->unk18 * font->unk20 + f17;
            params.v1 = f1 + font->unk1C * font->unk22;
            params.u2 = font->unk10 + (f0 - font->unk18 * font->unk21) - f17 - font->unk10 * CLAMP(1.0 - drawInfo->scaleX, 0.0, 1.0) * 0.1;
            params.v2 = font->unk14 + (f1 - font->unk1C * font->unk23);
            params.scaleX = drawInfo->scaleX * ((font->unk10 - (font->unk18 * font->unk20)) - (font->unk18 * font->unk21) - f17 * 2.0);
            params.scaleY = drawInfo->scaleY * (font->unk14 - font->unk1C * font->unk22 - font->unk18 * font->unk23);
            if (drawInfo->fontId == FONT_JAP_24x24_2Pg && *str == 'g')
                params.y += params.scaleY * 80.0;
            draw_naomi_sprite(&params);
        }
        r22++;
        drawInfo->x += f16 * (r23 * drawInfo->scaleX);
        str += parseState.unk8;
        parseState.unkC += r23;
    }

    drawInfo->fontId = fontIdBackup;
    drawInfo->scaleX = f31;
}

float g_get_text_width(char *str)
{
    struct TextDrawInfo *drawInfo = &textDrawInfo;
    int fontIdBackup;
    struct FontParams *font;
    int r23;
    int r22;
    float width;
    float f23;
    struct NaomiSpriteParams params;
    struct StringParseState parseState;
    u8 dummy2[8];
    s32 skip;
    s32 special;
    s32 color;
    u8 dummy[8];

    font = &fontInfo[drawInfo->fontId];
    r22 = 0;
    fontIdBackup = drawInfo->fontId;
    f23 = drawInfo->scaleX;
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
        if (drawInfo->fontId > FONT_JAP_TAG)
            r23 = func_80071E58_inline(*str, drawInfo->fontId, font);
        else
            r23 = get_char_width(str, drawInfo->fontId, font);
        f1 = g_get_char_ratio(str, drawInfo->fontId);
        if (*str == '\n')
            continue;
        if (*str == ' ' || *str < font->firstChar || *str > font->lastChar)
        {
            r22++;
            width += r23 * drawInfo->scaleX * f1;
            parseState.unkC += r23;
            continue;
        }
        glyphIndex = *str;
        if (drawInfo->fontId > FONT_JAP_TAG)
        {
            color = params.mulColor;
            skip = 0;
            special = 0;
            glyphIndex = parse_char_sequence(&parseState, str, &color, &skip, &special);
            params.mulColor = color;
            str += skip;
            if (special == 1)
            {
                drawInfo->fontId = FONT_JAP_24x24_2;
                font = &fontInfo[drawInfo->fontId];
            }
            else if (special == 2)
            {
                drawInfo->fontId = FONT_JAP_24x24_2P;
                font = &fontInfo[drawInfo->fontId];
            }
            else if (special == 70)
                drawInfo->scaleX = 0.7f;
            else if (special == 80)
                drawInfo->scaleX = 0.8f;
            else if (special == 90)
                drawInfo->scaleX = 0.9f;
            else if (special == 100)
                drawInfo->scaleX = 1.0f;
            if (glyphIndex == -1)
            {
                width += r23 * drawInfo->scaleX;
                continue;
            }
            if (glyphIndex == -2)
                continue;
            switch (drawInfo->fontId)
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
                        f1 = (float)r6 / (float)fontInfo[drawInfo->fontId].spaceWidth;
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
                font = &fontInfo[drawInfo->fontId];
        }
        r22++;
        width += r23 * drawInfo->scaleX * f1;
        str += parseState.unk8;
        parseState.unkC += r23;
    }
    drawInfo->fontId = fontIdBackup;
    drawInfo->scaleX = f23;
    return width;
}

void func_80072AC0(char *str, ...)
{
    va_list args;
    char buf[0x200];

    va_start(args, str);
    vsprintf(buf, str, args);
    va_end(args);
    g_draw_text(buf);
}

void g_draw_text_sprite(struct Sprite *sprite)
{
    textDrawInfo.startX = sprite->left;
    textDrawInfo.x = sprite->left;
    textDrawInfo.y = sprite->top;
    textDrawInfo.fontId = sprite->fontId;
    textDrawInfo.mulColor = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (u8)(sprite->opacity * 255.0f));
    textDrawInfo.addColor = RGBA(sprite->addR, sprite->addG, sprite->addB, 0);
    textDrawInfo.unk18 = sprite->rotation;
    textDrawInfo.unk1C = sprite->unk4C;
    textDrawInfo.scaleX = sprite->scaleX;
    textDrawInfo.scaleY = sprite->scaleY;
    textDrawInfo.opacity = sprite->opacity;
    textDrawInfo.unk2C = sprite->flags;
    g_draw_text(sprite->text);
}

void draw_bitmap_sprite(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;

    params.bmpId = sprite->bmpId;
    params.x = (sprite->left + sprite->right) / 2;
    params.y = (sprite->top + sprite->bottom) / 2;
    params.z = sprite->unk4C;
    params.scaleX = sprite->scaleX;
    params.scaleY = sprite->scaleY;
    params.u1 = sprite->unk7C;
    params.v1 = sprite->unk80;
    params.u2 = sprite->unk84;
    params.v2 = sprite->unk88;
    params.rotation = sprite->rotation;
    params.opacity = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->flags & ~0xF) | 10;
    params.mulColor = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (u8)(sprite->opacity * 255.0f));
    params.addColor = RGBA(sprite->addR, sprite->addG, sprite->addB, 0);
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

float g_get_ascii_text_width(char *str)
{
    return func_80072DA8(FONT_ASCII, str, 0);
}

int g_get_jpn_text_width(int fontId, char *str)
{
    return func_80072DA8(fontId, str, 1);
}

void g_draw_screen_fade_mask(void)
{
    struct NaomiSpriteParams params;

    if (screenFadeInfo.timer == 0)
        return;
    if (gameMode == MD_OPTION)
    {
        if ((screenFadeInfo.type & 0xFF) != FADE_UNK2)
            screenFadeInfo.timer--;
    }
    else
    {
        if (!(gamePauseStatus & 0xA) && (screenFadeInfo.type & 0xFF) != FADE_UNK2)
            screenFadeInfo.timer--;
    }
    switch (screenFadeInfo.type & 0xFF)
    {
    case FADE_IN:
        params.opacity = (float)screenFadeInfo.timer / (float)screenFadeInfo.timerMax;
        break;
    case FADE_OUT:
        params.opacity = 1.0 - (float)screenFadeInfo.timer / (float)screenFadeInfo.timerMax;
        break;
    case FADE_UNK2:
        params.opacity = 1.0f;
        break;
    }
    params.bmpId = BMP_COM_white_mask8x8;
    params.x = 320.0f;
    params.y = 240.1f;
    params.z = (screenFadeInfo.type & FADE_ABOVE_SPRITES) ? 0.009 : 0.25;
    params.scaleX = 80.0f;
    params.scaleY = 60.0f;
    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.rotation = 0;
    params.unk30 = -1;
    params.flags = 0x2000A;
    params.mulColor = screenFadeInfo.color;
    params.addColor = RGBA(0, 0, 0, 0);
    draw_naomi_sprite(&params);
    if ((screenFadeInfo.type & 0xFF) == FADE_OUT && screenFadeInfo.timer == 0)
    {
        screenFadeInfo.type = (screenFadeInfo.type & FADE_ABOVE_SPRITES) ? FADE_UNK2|FADE_ABOVE_SPRITES : FADE_UNK2;
        screenFadeInfo.timer = 1;
        screenFadeInfo.timerMax = 0;
    }
}

void start_screen_fade(s32 type, u32 color, int duration)
{
    if ((type & 0xFF) != FADE_UNK2 && duration > 3)
        duration -= 3;

    if ((screenFadeInfo.type & 0xFF) == (type & 0xFF)
     && (screenFadeInfo.type & 0xFF) != FADE_UNK2
     && screenFadeInfo.timer > 0)
        return;

    if ((type & 0xFF) == FADE_OUT && (screenFadeInfo.type & 0xFF) == FADE_IN && screenFadeInfo.timer > 0)
    {
        screenFadeInfo.type = (screenFadeInfo.type & 0xFF00) | FADE_OUT;
        screenFadeInfo.timer = duration - screenFadeInfo.timer * ((float)duration / (float)screenFadeInfo.timerMax);
        screenFadeInfo.timerMax = duration;
    }
    else if ((type & 0xFF) == FADE_OUT && (screenFadeInfo.type & 0xFF) == FADE_OUT && screenFadeInfo.timer > 0)
    {
        screenFadeInfo.type = (screenFadeInfo.type & 0xFF00) | FADE_OUT;
        screenFadeInfo.timer = duration - screenFadeInfo.timer * ((float)duration / (float)screenFadeInfo.timerMax);
        screenFadeInfo.timerMax = duration;
    }
    else if ((type & 0xFF) == FADE_IN && (screenFadeInfo.type & 0xFF) == FADE_IN && screenFadeInfo.timer > 0)
    {
        screenFadeInfo.type = (screenFadeInfo.type & 0xFF00) | FADE_IN;
        screenFadeInfo.timer = duration - screenFadeInfo.timer * ((float)duration / (float)screenFadeInfo.timerMax);
        screenFadeInfo.timerMax = duration;
    }
    else if ((type & 0xFF) == FADE_IN && (screenFadeInfo.type & 0xFF) == FADE_OUT && screenFadeInfo.timer > 0)
    {
        screenFadeInfo.type = (screenFadeInfo.type & 0xFF00) | FADE_IN;
        screenFadeInfo.timer = duration - screenFadeInfo.timer * ((float)duration / (float)screenFadeInfo.timerMax);
        screenFadeInfo.timerMax = duration;
    }
    else
    {
        screenFadeInfo.type = type;
        if ((type & 0xFF) != FADE_IN)
            screenFadeInfo.color = color;
        screenFadeInfo.timer = duration;
        screenFadeInfo.timerMax = duration;
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
         && screenFadeInfo.timer > 0
         && ((screenFadeInfo.type & FADE_ABOVE_SPRITES) ? 0.009 : 0.25) > params->z
         && append_to_sprite_params_buf(params))
            return 1;
        if ((advDemoInfo.flags & (1 << 7))
         && (params->bmpId == BMP_COM_banana_01 || params->bmpId == BMP_COM_banana_10)
         && append_to_sprite_params_buf(params))
            return 1;
        break;
    }
    return 0;
}

int draw_naomi_sprite(struct NaomiSpriteParams *params)
{
    Vec topLeft = {0};
    Vec topRight = {0};
    Vec bottomLeft = {0};
    Vec bottomRight = {0};
    GXColor color;
    u32 dummy;
    float z;
    float u1;
    float u2;
    float v1;
    float v2;
    float x;
    float y;
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
    x = params->x;
    y = params->y;
    texWidth  = bitmapGroups[(params->bmpId >> 8) & 0xFF].tpl->texHeaders[params->bmpId & 0xFF].width;
    texHeight = bitmapGroups[(params->bmpId >> 8) & 0xFF].tpl->texHeaders[params->bmpId & 0xFF].height;
    u1 = params->u1;
    u2 = params->u2;
    v1 = params->v1;
    v2 = params->v2;

    switch (params->flags & 3)
    {
    default:
    case 0:
    case 1:
        topLeft.x = bottomLeft.x = 0.0f;
        topRight.x = bottomRight.x = texWidth;
        break;
    case 2:
        topLeft.x = bottomLeft.x = -texWidth / 2.0;
        topRight.x = bottomRight.x = texWidth / 2.0;
        break;
    case 3:
        topLeft.x = bottomLeft.x = -texWidth;
        topRight.x = bottomRight.x = 0.0f;
        break;
    }

    switch ((params->flags >> 2) & 3)
    {
    default:
    case 0:
    case 1:
        topLeft.y = topRight.y = 0.0f;
        bottomLeft.y = bottomRight.y = texHeight;
        break;
    case 2:
        topLeft.y = topRight.y = -texHeight / 2.0;
        bottomLeft.y = bottomRight.y = texHeight  / 2.0;
        break;
    case 3:
        topLeft.y = topRight.y = -texHeight;
        bottomLeft.y = bottomRight.y = 0.0f;
        break;
    }

    // Transform all vertices
    mathutil_mtxA_from_translate_xyz(x, y, 0.0f);
    mathutil_mtxA_rotate_z((s16)-params->rotation);
    mathutil_mtxA_scale_xyz(params->scaleX, params->scaleY, 1.0f);
    mathutil_mtxA_tf_point(&topLeft, &topLeft);
    mathutil_mtxA_tf_point(&topRight, &topRight);
    mathutil_mtxA_tf_point(&bottomLeft, &bottomLeft);
    mathutil_mtxA_tf_point(&bottomRight, &bottomRight);

    if (params->flags & (1 << 18))
    {
        float f0 = params->z * 0.002405626;

        topLeft.x = (topLeft.x - 320.0f) * f0;
        topLeft.y = -((topLeft.y - 240.0f) * f0);
        topRight.x = (topRight.x - 320.0f) * f0;
        topRight.y = -((topRight.y - 240.0f) * f0);
        bottomLeft.x = (bottomLeft.x - 320.0f) * f0;
        bottomLeft.y = -((bottomLeft.y - 240.0f) * f0);
        bottomRight.x = (bottomRight.x - 320.0f) * f0;
        bottomRight.y = -((bottomRight.y - 240.0f) * f0);
    }

    if (params->flags & (1 << 19))
    {
        u1 = params->u2;
        u2 = params->u1;
    }
    if (params->flags & (1 << 20))
    {
        v1 = params->v2;
        v2 = params->v1;
    }

    GXLoadTexObj_cached(&bitmapGroups[(params->bmpId >> 8) & 0xFF].tpl->texObjs[params->bmpId & 0xFF], GX_TEXMAP0);
    color.r = (params->mulColor >> 16);
    color.g = (params->mulColor >> 8);
    color.b = (params->mulColor >> 0);
    color.a = params->opacity * 255.0f;
    GXSetTevColor(GX_TEVREG0, color);
    color.r = (params->addColor >> 16);
    color.g = (params->addColor >> 8);
    color.b = (params->addColor >> 0);
    color.a = (params->addColor >> 24);
    GXSetTevColor(GX_TEVREG1, color);

    if (params->flags & (1 << 21))
    {
        GXCompare *r4 = &gxCache->compareFunc;
        r30 = gxCache->compareEnable;
        r29 = *r4;
        r28 = gxCache->updateEnable;
        r29 = *r4;
        GXSetZMode_cached(GX_TRUE, GX_ALWAYS, GX_TRUE);
    }

    zero = 0.0f;
    GXBegin(GX_QUADS, GX_VTXFMT7, 4);
        GXPosition3f32(topLeft.x, topLeft.y, z);
        GXTexCoord2f32(u1 + zero, v1 + zero);
        GXPosition3f32(topRight.x, topRight.y, z);
        GXTexCoord2f32(u2 - zero, v1 + zero);
        GXPosition3f32(bottomRight.x, bottomRight.y, z);
        GXTexCoord2f32(u2 - zero, v2 - zero);
        GXPosition3f32(bottomLeft.x, bottomLeft.y, z);
        GXTexCoord2f32(u1 + zero, v2 - zero);
    GXEnd();

    if (params->flags & (1 << 21))
        GXSetZMode_cached(r30, r29, r28);
    return 0;
}

void func_80073E00(int a, GXTexWrapMode s, GXTexWrapMode t)
{
    GXInitTexObjWrapMode(&bitmapGroups[(a >> 8) & 0xFF].tpl->texObjs[a & 0xFF], s, t);
}
