#include <math.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mode.h"

enum FontID
{
    FONT_ASCII,  // 0
    FONT_ASC_8x16,
    FONT_ASC_12x12,
    FONT_DMY00,
    FONT_DMY01,
    FONT_DMY02,
    FONT_DMY03,
    FONT_DMY04,
    FONT_DMY05,
    FONT_ASC_72x64,
    FONT_DMY06,  // 10
    FONT_DMY07,
    FONT_DMY08,
    FONT_DMY09,
    FONT_DMY10,
    FONT_DMY11,
    FONT_DMY12,
    FONT_DMY13,
    FONT_DMY14,
    FONT_DMY15,
    FONT_DMY16,  // 20
    FONT_ICON_SD,
    FONT_ICON_SD2,
    FONT_DMY20,
    FONT_DMY21,
    FONT_DMY22,
    FONT_DMY23,
    FONT_NUM_26x31,
    FONT_ASC_30x31,
    FONT_ICON_TPL,
    FONT_ICON_MDE,  // 30
    FONT_ICON_RNK,
    FONT_RNK_32x32,
    FONT_RNK_NUM,
    FONT_MINI_RNK,
    FONT_SCORE_NUM,
    FONT_DMY_RNK0,
    FONT_DMY_RNK1,
    FONT_DMY_RNK2,
    FONT_DMY_RNK3,
    FONT_DMY_RNK4,  // 40
    FONT_DMY_RNK5,
    FONT_DMY_RNK6,
    FONT_DMY_RNK7,
    FONT_DMY_RNK8,
    FONT_DMY_RNK9,
    FONT_DMY_RNKa,
    FONT_DMY_RNKb,
    FONT_DMY_RNKc,
    FONT_DMY_RNKd,
    FONT_DMY_RNKe,  // 50
    FONT_DMY_RNKf,
    FONT_NUM_7x10,
    FONT_NUM_8x10,
    FONT_NUM_12x24,
    FONT_ICON_CRS,
    FONT_DMY40,
    FONT_DMY41,
    FONT_DMY42,
    FONT_DMY43,
    FONT_BWL_SCORE,  // 60
    FONT_DMY50,
    FONT_DMY51,
    FONT_DMY52,
    FONT_DMY53,
    FONT_DMY54,
    FONT_DMY55,
    FONT_DMY56,
    FONT_DMY57,
    FONT_RAC_ASC16x16,
    FONT_RAC_PLAYER,  // 70
    FONT_RAC_RANK,
    FONT_RAC_RAP_MARK_NUM,
    FONT_RAC_RAP_NUM,
    FONT_RAC_TIME_NUM,
    FONT_RAC_RAP_MARK_NUM_S,
    FONT_RAC_TIME_NUM_S,
    FONT_DMY60,
    FONT_DMY61,
    FONT_DMY62,
    FONT_DMY63,  // 80
    FONT_DMY64,
    FONT_TGT_PLAYER,
    FONT_TGT_MSCORE,
    FONT_TGT_SPEED,
    FONT_TGT_SCORE,
    FONT_TGT_ROUND,
    FONT_TGT_ALT,
    FONT_TGT_WIND,
    FONT_TGT_RESULT,
    FONT_DMY72,  // 90
    FONT_DMY73,
    FONT_DMY74,
    FONT_ICON_LV,
    FONT_NUM_22x22,
    FONT_ASC_16x16,
    FONT_ASC_16x16P,
    FONT_ASC_18x16,
    FONT_ASC_20x20,
    FONT_ASC_20x20P,
    FONT_ASC_32x32,  // 100
    FONT_NUM_12x19,
    FONT_NUM_24x37,
    FONT_DMY79,
    FONT_DMY7a,
    FONT_DMY7b,
    FONT_DMY7c,
    FONT_DMY7d,
    FONT_DMY7e,
    FONT_DMY7f,
    FONT_DMY80,  // 110
    FONT_DMY81,
    FONT_DMY82,
    FONT_DMY83,
    FONT_DMY84,
    FONT_DMY85,
    FONT_DMY86,
    FONT_DMY87,
    FONT_DMY88,
    FONT_DMY89,
    FONT_DMY8a,  // 120
    FONT_DMY8b,
    FONT_DMY8c,
    FONT_DMY8d,
    FONT_DMY8e,
    FONT_DMY8f,
    FONT_DMY90,
    FONT_DMY91,
    FONT_DMY92,
    FONT_DMY93,
    FONT_DMY94,  // 130
    FONT_DMY95,
    FONT_DMY96,
    FONT_DMY97,
    FONT_DMY98,
    FONT_DMY99,
    FONT_DMY9a,
    FONT_DMY9b,
    FONT_DMY9c,
    FONT_DMY9d,
    FONT_DMY9e,  // 140
    FONT_DMY9f,
    FONT_DMYa0,
    FONT_DMYa1,
    FONT_DMYa2,
    FONT_DMYa3,
    FONT_DMYa4,
    FONT_DMYa5,
    FONT_DMYa6,
    FONT_DMYa7,
    FONT_DMYa8,  // 150
    FONT_DMYa9,
    FONT_DMYaa,
    FONT_DMYab,
    FONT_DMYac,
    FONT_DMYad,
    FONT_DMYae,
    FONT_DMYaf,
    FONT_DMYb0,
    FONT_DMYb1,
    FONT_DMYb2,  // 160
    FONT_DMYb3,
    FONT_DMYb4,
    FONT_DMYb5,
    FONT_DMYb6,
    FONT_DMYb7,
    FONT_DMYb8,
    FONT_DMYb9,
    FONT_DMYba,
    FONT_DMYbb,
    FONT_DMYbc,  // 170
    FONT_DMYbd,
    FONT_DMYbe,
    FONT_DMYbf,
    FONT_JAP_TAG,
    FONT_JAP_DMY,
    FONT_JAP_24x24_2,
    FONT_JAP_24x24_2P,
    FONT_JAP_24x24_I,
    FONT_JAP_24x24_2Pg,
};

enum TextAlign
{
    ALIGN_LT,
    ALIGN_LC,
    ALIGN_LB,
    ALIGN_CT,
    ALIGN_CC,
    ALIGN_CB,
    ALIGN_RT,
    ALIGN_RC,
    ALIGN_RB,
    ALIGN_PIC,
};

struct Struct8028CF28
{
    float unk0;
    float unk4;
    float unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u16 unk18;
    float unk1C;
    float unk20;
    float unk24;
    float unk28;
    u8 filler2C[4];
};

struct Sprite
{
    /*0x00*/ s8 type;  // type 0 = text, 1 = ???, 2 = ???
    /*0x01*/ u8 fontId;  // fontId
             s8 unk2;
    /*0x03*/ s8 textAlign;
    /*0x04*/ float centerX;
    /*0x08*/ float centerY;
             u8 unkC;
             u8 unkD;
             u8 unkE;
             s8 unkF;
             u8 filler10[0x30-0x10];
    /*0x30*/ void (*destFunc)();
    /*0x34*/ void (*mainFunc)();
             void (*unk38)(struct Sprite *);
             u16 unk3C;
             u8 filler3E[0x40-0x3E];
             float unk40;
             float unk44;
             u8 filler48[4];
             float unk4C;
             struct Sprite *unk50;
             struct Sprite *unk54;
             s32 unk58;
             s32 unk5C;
             s32 unk60;
             s32 unk64;
             u8 filler68[0x6C-0x68];
             float unk6C;
             u8 filler70[4];
             u32 unk74;
             u32 unk78;
             float unk7C;
             float unk80;
             float unk84;
             float unk88;
             char text[0xBC-0x8C];  // text
};

struct Struct8028FE58
{
    //u32 unk0;
    struct Sprite *unk0;
    struct Struct8028FE58 *unk4;
    struct Struct8028FE58 *unk8;
};

// .bss
struct Struct8028CF28 lbl_8028CF28;
struct Sprite lbl_8028CF58[64];
struct Struct8028FE58 lbl_8028FE58[0x42];

extern struct SpritePoolInfo spritePoolInfo;  // 0x80205988

void ev_sprite_init(void)
{
    struct Struct8028CF28 *r5 = &lbl_8028CF28;
    s8 *status = spritePoolInfo.statusList;
    /*
    int i = 0;

    while (i < spritePoolInfo.unk38)
    {
        *r6 = 0;
        i++;
        r6++;
    }
    */

    int i;
    for (i = 0; i < spritePoolInfo.unk38; i++, status++)
        *status = 0;

    r5->unk0 = 0.0f;
    r5->unk4 = 0.0f;
    r5->unk8 = 0.0f;
    r5->unkC = 0;
    r5->unk10 = -1;
    r5->unk14 = 0;
    r5->unk18 = 0;
    r5->unk1C = 0.1f;
    r5->unk20 = 1.0f;
    r5->unk24 = 1.0f;
    r5->unk28 = 1.0f;
    func_80073E44();
}

void ev_sprite_main(void)
{
    struct Sprite *sprite;
    s8 *status;
    int i = 0;

    if (lbl_802F1EE0 & 0xA)
        return;
    lbl_802F2000 = 0;
    status = spritePoolInfo.statusList;
    sprite = lbl_8028CF58;
    for (i = 0; i < spritePoolInfo.unk38; i++, sprite++, status++)
    {
        if (*status != 0)
        {
            lbl_802F2000 |= 1 << sprite->unkF;
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

    sprite = lbl_8028CF58;
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
    int r31 = (eventInfo[12].state == 2);

    r12 = 0;
    r5 = &lbl_8028FE58[r12++];
    r9 = &lbl_8028FE58[r12++];
    r8 = lbl_8028CF58;
    r5->unk0 = NULL;
    r5->unk4 = NULL;
    r5->unk8 = r9;
    r9->unk0 = NULL;
    r9->unk4 = r5;
    r9->unk8 = NULL;

    r11 = spritePoolInfo.statusList;
    for (i = 0; i < spritePoolInfo.unk38; r8++, i++, r11++)
    {
        if (*r11 != 0 && (!r31 || r8->unkF == 100))
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

struct FontParams
{
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u32 unk4;
    u32 unk8;
    u8 unkC;
    u8 unkD;
    float unk10;
    float unk14;
    float unk18;
    float unk1C;
    u8 unk20;
    u8 unk21;
    u8 unk22;
    s8 unk23;
};

// font parameters?
struct FontParams lbl_801BE4B0[] =
{
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {6, 8, 16, 32, 122, 16, 6, 0.0625, 0.125, 0.0078125, 0.0078125, 0, 0, 0, 0},
    {31, 12, 12, 0, 127, 16, 8, 0.0625, 0.125, 0.005208333489, 0.01041666698, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {80, 72, 64, 48, 96, 7, 7, 0.140625, 0.1428571492, 0.001953125, 0.002232142957, 0, 1, 0, 2},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {74, 24, 24, 1, 25, 5, 5, 0.1875, 0.1875, 0.0078125, 0.0078125, 0, 0, 0, 0},
    {73, 24, 24, 1, 25, 5, 5, 0.1875, 0.1875, 0.0078125, 0.0078125, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {768, 26, 31, 44, 59, 4, 4, 0.203125, 0.2421875, 0.0078125, 0.0078125, 0, 0, 0, 0},
    {769, 30, 31, 32, 95, 8, 8, 0.1171875, 0.12109375, 0.00390625, 0.00390625, 0, 0, 0, 0},
    {776, 79, 16, 48, 51, 1, 4, 0.6171875, 0.125, 0.0078125, 0.0078125, 0, 0, 0, 0},
    {785, 246, 18, 48, 51, 1, 4, 0.9609375, 0.0703125, 0.00390625, 0.00390625, 0, 0, 0, 0},
    {786, 64, 31, 49, 53, 2, 3, 0.5, 0.2421875, 0.0078125, 0.0078125, 0, 0, 0, 0},
    {787, 32, 32, 32, 95, 16, 4, 0.0625, 0.25, 0.001953125, 0.0078125, 0, 0, 0, 0},
    {798, 16, 28, 48, 59, 6, 2, 0.1666666716, 0.5, 0.01041666698, 0.01785714366, 0, 0, 0, 0},
    {802, 64, 34, 49, 53, 1, 5, 1, 0.1931818128, 0.015625, 0.005681818351, 0, 0, 0, 0},
    {803, 20, 28, 48, 57, 5, 2, 0.200000003, 0.5, 0.009999999776, 0.01785714366, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {1071, 9, 11, 48, 59, 6, 2, 0.140625, 0.4583333433, 0.015625, 0.04166666791, 0, 0, 0, 0},
    {1070, 9, 11, 48, 57, 5, 2, 0.1875, 0.4583333433, 0.02083333395, 0.04166666791, 0, 0, 0, 0},
    {1050, 12, 24, 48, 57, 5, 2, 0.1875, 0.5, 0.015625, 0.02083333395, 0, 0, 0, 0},
    {1072, 16, 14, 48, 55, 4, 2, 0.25, 0.4375, 0.015625, 0.03125, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {1543, 19, 13, 0, 25, 5, 5, 0.1826923043, 0.162499994, 0.009615384974, 0.01250000019, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {1801, 18, 16, 32, 91, 12, 5, 0.08333333582, 0.200000003, 0.004629629664, 0.01250000019, 0, 0, 0, 0},
    {1813, 28, 16, 49, 52, 2, 2, 0.5, 0.5, 0.01785714366, 0.03125, 0, 0, 0, 0},
    {1814, 64, 38, 49, 53, 1, 5, 1, 0.1979166716, 0.015625, 0.005208333489, 0, 0, 0, 0},
    {1816, 18, 18, 48, 57, 5, 2, 0.1875, 0.4499999881, 0.01041666698, 0.02500000037, 0, 0, 0, 0},
    {1817, 20, 24, 48, 58, 6, 2, 0.1666666716, 0.5, 0.008333333768, 0.02083333395, 0, 0, 0, 0},
    {1818, 26, 38, 48, 57, 5, 2, 0.1911764741, 0.474999994, 0.007352941204, 0.01250000019, 0, 0, 0, 0},
    {1821, 10, 18, 48, 57, 5, 2, 0.1785714328, 0.4499999881, 0.01785714366, 0.02500000037, 0, 0, 0, 0},
    {1823, 16, 22, 48, 58, 6, 2, 0.1666666716, 0.4583333433, 0.01041666698, 0.02083333395, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {2828, 28, 16, 48, 63, 4, 4, 0.25, 0.25, 0.008928571828, 0.015625, 0, 0, 0, 0},
    {2826, 16, 24, 48, 57, 5, 2, 0.200000003, 0.5, 0.01250000019, 0.02083333395, 0, 0, 0, 0},
    {2834, 20, 16, 48, 57, 5, 2, 0.200000003, 0.5, 0.009999999776, 0.03125, 0, 0, 0, 0},
    {2832, 12, 16, 48, 58, 6, 2, 0.1666666716, 0.5, 0.01388888899, 0.03125, 0, 0, 0, 0},
    {2830, 12, 16, 48, 57, 5, 2, 0.200000003, 0.5, 0.01666666754, 0.03125, 0, 0, 0, 0},
    {2839, 8, 10, 48, 57, 5, 2, 0.200000003, 0.5, 0.02500000037, 0.05000000075, 0, 0, 0, 0},
    {2835, 8, 12, 48, 57, 5, 2, 0.200000003, 0.5, 0.02500000037, 0.04166666791, 0, 0, 0, 0},
    {2868, 12, 14, 48, 51, 2, 2, 0.5, 0.5, 0.04166666791, 0.03571428731, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {1281, 64, 64, 48, 63, 4, 4, 0.25, 0.25, 0.00390625, 0.00390625, 0, 0, 0, 0},
    {1285, 22, 22, 39, 63, 5, 5, 0.171875, 0.171875, 0.0078125, 0.0078125, 0, 0, 1, 0},
    {1286, 16, 16, 32, 122, 16, 7, 0.0625, 0.1666666716, 0.00390625, 0.01041666698, 0, 0, 0, 0},
    {1286, 16, 16, 32, 122, 16, 7, 0.0625, 0.1666666716, 0.00390625, 0.01041666698, 0, 0, 0, 0},
    {1288, 18, 16, 32, 91, 12, 5, 0.08333333582, 0.200000003, 0.004629629664, 0.01250000019, 0, 0, 0, 0},
    {1289, 20, 20, 32, 91, 12, 5, 0.078125, 0.078125, 0.00390625, 0.00390625, 0, 0, 0, 0},
    {1289, 20, 20, 32, 91, 12, 5, 0.078125, 0.078125, 0.00390625, 0.00390625, 0, 0, 0, 0},
    {1287, 32, 32, 32, 95, 8, 8, 0.125, 0.125, 0.00390625, 0.00390625, 0, 1, 0, 2},
    {1293, 16, 22, 48, 59, 6, 2, 0.1666666716, 0.4583333433, 0.01041666698, 0.02083333395, 0, 0, 0, 0},
    {1292, 26, 38, 48, 57, 5, 2, 0.1911764741, 0.474999994, 0.007352941204, 0.01250000019, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, NAN, NAN, INFINITY, INFINITY, 0, 0, 0, 0},
    {0, 8, 8, 0, 127, 16, 8, 0.0625, 0.125, 0.0078125, 0.015625, 0, 0, 0, 0},
    {90, 24, 24, 0, 400, 20, 20, 0.04761904851, 0.04761904851, 0.001984127099, 0.001984127099, 0, 0, 1, 0},
    {90, 24, 24, 0, 400, 20, 20, 0.04761904851, 0.04761904851, 0.001984127099, 0.001984127099, 0, 0, 1, 0},
    {2, 24, 24, 0, 400, 5, 2, 0.200000003, 0.5, 0.008333333768, 0.02083333395, 0, 0, 0, 0},
    {90, 24, 24, 0, 400, 20, 20, 0.04761904851, 0.04761904851, 0.001984127099, 0.001984127099, 0, 0, 1, 0},
};

// 0x801c07ac
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

// 0x801c0af4
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

struct Struct801C0B94
{
    char *unk0;
    u32 unk4;
};

// symbols?
struct Struct801C0B94 lbl_801C0B94[] =
{
    {"MARU",       0x00000140},
    {"SANKAKU",    0x00000141},
    {"SANNKAKU",   0x00000141},
    {"SIKAKU",     0x00000142},
    {"HOSI",       0x00000143},
    {"SUPE-DO",    0x00000144},
    {"KURO-BA-",   0x00000145},
    {"HA-TO",      0x00000146},
    {"DAIYA",      0x00000147},
    {"NIJYU-MARU", 0x00000148},
    {"ONNPU",      0x00000149},
    {"ONPU",       0x00000149},
    {"ATTOMA-KU",  0x0000014A},
    {"ANDO",       0x0000014B},
    {"ANNDO",      0x0000014B},
    {"SANNKAKU_U", 0x0000014D},
    {"SANNKAKU_B", 0x0000014E},
    {"SANNKAKU_D", 0x0000014E},
    {"SANNKAKU_L", 0x0000014F},
    {"SANNKAKU_R", 0x00000150},
    {"!=",         0x00000127},
    {"LE",         0x0000012A},
    {"GE",         0x0000012B},
    {"TENNTENN",   0x00000131},
    {"!'",         0x0000013C},
    {"!\"",        0x0000013E},
    {"KAKERU",     0x00000151},
    {"KOME",       0x00000152},
    {"*",          0x00000152},
    {"MUGENN",     0x00000153},
    {".",          0x0000012F},
    {"DMY",        0xFFFFFFFF},
};

// button icons?
struct Struct801C0B94 lbl_801C0D24[] =
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
struct Struct801C0B94 lbl_801C0DAC[] =
{
    {"SHOkyuu",  0x00000168},
    {"CHUkyuu",  0x00000169},
    {"NAKA",     0x00000169},
    {"JYOkyuu",  0x0000016A},
    {"UE",       0x0000016A},
    {"KYUU",     0x0000016B},
    {"NANI",     0x0000016C},
    {"HONN",     0x0000016D},
    {"KAchi",    0x0000016E},
    {"MAke",     0x0000016F},
    {"SHIyou",   0x00000170},
    {"TSUKAu",   0x00000170},
    {"shiYOU",   0x00000171},
    {"YOU",      0x00000171},
    {"JIbunn",   0x00000172},
    {"jiBUNN",   0x00000173},
    {"HITO",     0x00000174},
    {"NINN",     0x00000174},
    {"GENzai",   0x00000175},
    {"genZAI",   0x00000176},
    {"KOsuu",    0x00000177},
    {"DOUji",    0x00000178},
    {"douJI",    0x00000179},
    {"TOKI",     0x00000179},
    {"TAIsenn",  0x0000017A},
    {"taiSENN",  0x0000017B},
    {"SENN",     0x0000017B},
    {"KAIsuu",   0x0000017C},
    {"KAI",      0x0000017C},
    {"TSUGI",    0x0000017D},
    {"RENNshuu", 0x0000017E},
    {"rennSHUU", 0x0000017F},
    {"KYOUsou",  0x00000180},
    {"kyouSOU",  0x00000181},
    {"SAKI",     0x00000182},
    {"HOKA",     0x00000183},
    {"KURAI",    0x00000184},
    {"KAZU",     0x00000185},
    {"SUU",      0x00000185},
    {"OSU",      0x00000186},
    {"HAI",      0x00000187},
    {"KEttei",   0x00000188},
    {"keTTEI",   0x00000189},
    {"Au",       0x0000018A},
    {"MIGI",     0x0000018B},
    {"SHITA",    0x0000018C},
    {"KUDA",     0x0000018C},
    {"HIDARI",   0x0000018D},
    {"TAberu",   0x0000018E},
    {"IMA",      0x0000018F},
    {"DOU",      0x00000190},
    {"UGOku",    0x00000190},
    {"DAI",      0x00000191},
    {"OOkii",    0x00000191},
    {"KIbunn",   0x00000192},
    {"HENN",     0x00000193},
    {"KAwaru",   0x00000193},
    {"CHIkei",   0x00000194},
    {"chiKEI",   0x00000195},
    {"chiTENN",  0x00000196},
    {"TENN",     0x00000196},
    {"SAKA",     0x00000197},
    {"MICHI",    0x00000198},
    {"Ochiru",   0x00000199},
    {"TOru",     0x0000019A},
    {"KIkann",   0x0000019B},
    {"MOUkeru",  0x0000019C},
    {"TUku",     0x0000019D},
    {"YOmu",     0x0000019E},
    {"KARADA",   0x0000019F},
    {"ATUKAu",   0x000001A0},
    {"SETSU",    0x000001A1},
    {"AKArui",   0x000001A2},
    {"KAku",     0x000001A3},
    {"DENN",     0x00000166},
    {"GENN",     0x00000167},
    {"NUku",     0x00000165},
    {"SOU",      0x00000164},
    {"TAMA",     0x00000163},
    {"DMY",      0xFFFFFFFF},
};

// Japanese words composed of two kanji?
struct Struct801C0B94 lbl_801C108C[] =
{
    {"SHOKYUU",    0x0168016B},
    {"CHUKYUU",    0x0169016B},
    {"JYOKYUU",    0x016A016B},
    {"NANNBONN",   0x016C016D},
    {"SHOUBU",     0x016E016F},
    {"SYOUBU",     0x016E016F},
    {"SHIYOU",     0x01700171},
    {"JIBUNN",     0x01720173},
    {"GENZAI",     0x01750176},
    {"DOUJI",      0x01780179},
    {"TAISENN",    0x017A017B},
    {"RENNSHUU",   0x017E017F},
    {"KYOUSOU",    0x01800181},
    {"HONNSUU",    0x016D0185},
    {"KOSUU",      0x01770185},
    {"KETTEI",     0x01880189},
    {"CHIKEI",     0x01940195},
    {"CHITENN",    0x01940196},
    {"SAKAMICHI",  0x01970198},
    {"RAKKA",      0x0199018C},
    {"IRE",        0x01870058},
    {"SENNSHU",    0x0182019A},
    {"TORU",       0x019A0057},
    {"TORE",       0x019A0058},
    {"NANNKAI",    0x016C017C},
    {"KAISUU",     0x017C0185},
    {"KATE",       0x016E0026},
    {"SHOKI",      0x0168019B},
    {"SETTEI",     0x019C0189},
    {"CHAKUCHI",   0x019D0194},
    {"HONNTAI",    0x016D019F},
    {"TORIATUKAI", 0x019A01A0},
    {"SETUMEI",    0x01A101A2},
    {"DENNGENN",   0x01660167},
    {"KACHI",      0x016E0024},
    {"TAIKETSU",   0x017A0188},
    {"TATAKAU",    0x017B0002},
    {"TATAKAI",    0x017B0001},
    {"SENNSOU",    0x017B0181},
    {"NUKU",       0x01650011},
    {"HASHIRU",    0x01640057},
    {"KYOUSOU2",   0x01800164},
    {"NUKI",       0x01650010},
    {"TSUKAU",     0x01700002},
    {"OTOSU",      0x0199001B},
    {"OTO",        0x01990027},
    {"TSUKAI",     0x01700001},
    {"OCHI",       0x01990024},
    {"KIME",       0x01880049},
    {"JITENN",     0x01790196},
    {"OSHI",       0x0186001A},
    {"DOUTENN",    0x01780196},
    {"HENNKEI",    0x01930195},
    {"TSUKAE",     0x01700003},
    {"SAYUU",      0x018D018B},
    {"KIMA",       0x01880046},
    {"MAKE",       0x016F0012},
    {"JYOUGE",     0x016A018C},
    {"DMY",        0xFFFFFFFF},
};

extern char **lbl_80181E04[];

void g_something_with_sprites(struct Sprite *sprite)
{
    u32 r29;
    u32 r26;
    int i;
    int x;
    int y;

    if (sprite->unk78 & 1)
        return;
    g_get_dimensions_for_sprite(sprite, &sprite->unk58, &sprite->unk5C, &sprite->unk60, &sprite->unk64);
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
        if (lbl_80181CB4[(sprite->unk3C & 0xFF00) >> 8].unk0 == 0)
        {
            printf("SPRITE WARNING!! %s's category %s is not load\n",
                lbl_80181E04[sprite->unk3C >> 8][sprite->unk3C & 0xFF],
                lbl_80181CB4[sprite->unk3C >> 8].unk8);
            break;
        }
        func_80072C68(sprite);
        break;
    case 2:
        if (lbl_80181CB4[(sprite->unk3C & 0xFF00) >> 8].unk0 == 0)
        {
            printf("SPRITE WARNING!! %s's category %s is not load\n",
                lbl_80181E04[sprite->unk3C >> 8][sprite->unk3C & 0xFF],
                lbl_80181CB4[sprite->unk3C >> 8].unk8);
            break;
        }
        r26 = sprite->unk3C & 0xFF;
        r29 = sprite->unk3C;
        x = sprite->centerX;
        y = sprite->centerY;
        for (i = 0; i < 8; i++)
        {
            sprite->unk3C = (r29 & 0xFF00) | r26;
            sprite->centerX = (float)(x + lbl_801BE470[i].unk0);
            sprite->centerY = (float)(y + lbl_801BE470[i].unk4);
            g_get_dimensions_for_sprite(sprite, &sprite->unk58, &sprite->unk5C, &sprite->unk60, &sprite->unk64);
            func_80072C68(sprite);
            r26++;
        }
        sprite->unk3C = r29;
        sprite->centerX = x;
        sprite->centerY = y;
    }
}

#pragma force_active on

void call_something_with_bmp_bmp_com(int a)
{
    g_something_with_bmp_bmp_com(a);
}

void func_800705C4(int a)
{
    g_something_with_freeing_memory(a);
}

void g_something_with_iteratively_freeing_memory(void)
{
    int i;
    for (i = 0; i < 14; i++)
    {
        if (i != 0)
            g_something_with_freeing_memory(i);
    }
}

struct Sprite *create_sprite(void)
{
    int index = pool_alloc(spritePoolInfo.unk30, 2);

    if (index < 0)
        return NULL;
    else
    {
        struct Sprite *sprite = &lbl_8028CF58[index];

        memset(sprite, 0, sizeof(*sprite));
        sprite->unk2 = index;
        sprite->unk4C = 0.1f;
        sprite->unkC = 0xFF;
        sprite->unkD = 0xFF;
        sprite->unkE = 0xFF;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 1.0f;
        sprite->unk6C = 1.0f;
        sprite->unk58 = 0;
        sprite->unk5C = 0;
        sprite->unk60 = 1;
        sprite->unk64 = 1;
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

// probably has nothing to do with fonts
void g_dest_sprite_with_font(int a)
{
    struct Sprite *sprite = lbl_8028CF58;
    s8 *status = spritePoolInfo.statusList;
    int i;

    for (i = 0; i < 64; i++)
    {
        if (*status != 0 && sprite->unkF == a)
        {
            if (sprite->destFunc != NULL)
                sprite->destFunc(sprite);
            *status = 0;
        }
        sprite++;
        status++;
    }
}

void dest_all_sprites(void)
{
    struct Sprite *sprite = lbl_8028CF58;
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

struct Sprite *g_find_sprite_with_probably_not_font(int a)
{
    struct Sprite *sprite = lbl_8028CF58;
    s8 *status = spritePoolInfo.statusList;
    int i;

    for (i = 0; i < 64; i++, sprite++, status++)
    {
        if (*status != 0 && sprite->unkF == a)
            return sprite;
    }
    return NULL;
}

void g_get_dimensions_for_sprite(struct Sprite *sprite, s32 *b, s32 *c, s32 *d, s32 *e)
{
    int width = 0;
    int height = 0;
    struct FontParams *fontParams;
    int x;
    int y;
    int len;

    if (sprite->unk38 != 0)
    {
        *b = sprite->centerX - 50.0f;
        *c = sprite->centerY - 50.0f;
        *d = sprite->centerX + 50.0f;
        *e = sprite->centerY + 50.0f;
        return;
    }
    else
    {
        fontParams = &lbl_801BE4B0[sprite->fontId];
        switch (sprite->type)
        {
        case 0:
            len = strlen(sprite->text);
            width = len * fontParams->unk2;
            height = fontParams->unk3;
            if (sprite->fontId > FONT_JAP_TAG)  // Japanese font
            {
                width = func_80073084(sprite->fontId, sprite->text);
            }
            else  // ASCII font
            {
                char *chr = sprite->text;
                while (*chr != 0)
                {
                    float f1;
                    width += func_80070E9C(chr, sprite->fontId, fontParams) - fontParams->unk2;
                    f1 = func_80071018(chr, sprite->fontId);
                    if (f1 != 1.0)
                        width += f1 * fontParams->unk2 - fontParams->unk2;
                    chr++;
                }
            }
            break;
        case 1:
        case 2:
            if (lbl_80181CB4[(sprite->unk3C & 0xFF00) >> 8].unk0 == 0)
            {
                printf("SPRITE WARNING!! %s's category %s is not load\n",
                    lbl_80181E04[sprite->unk3C >> 8][sprite->unk3C & 0xFF],
                    lbl_80181CB4[sprite->unk3C >> 8].unk8);
                *b = sprite->centerX - 50.0f;
                *c = sprite->centerY - 50.0f;
                *d = sprite->centerX + 50.0f;
                *e = sprite->centerY + 50.0f;
                return;
            }
            width = lbl_80181CB4[(sprite->unk3C & 0xFF00) >> 8].unk10->unk4[sprite->unk3C & 0xFF].unk8;
            height = lbl_80181CB4[(sprite->unk3C & 0xFF00) >> 8].unk10->unk4[sprite->unk3C & 0xFF].unkA;
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
        *b = x;
        *c = y;
        *d = x + width;
        *e = y + height;
    }
    else
    {
        y = sprite->unk50->unk5C;
        x = sprite->unk50->unk60;
        switch (sprite->textAlign)
        {
        // centered vertically
        case ALIGN_LC:
        case ALIGN_CC:
        case ALIGN_RC:
        case ALIGN_PIC:
            y = (y + sprite->unk50->unk64) / 2 - height / 2;
            break;
        // bottom aligned
        case ALIGN_LB:
        case ALIGN_CB:
        case ALIGN_RB:
            y = sprite->unk50->unk64 - height;
            break;
        }
        x += sprite->centerX;
        y += sprite->centerY;
        *b = x;
        *c = y;
        *d = x + width;
        *e = y + height;
    }
}

int func_80070E9C(char *chr, int fontId, struct FontParams *params)
{
    switch (fontId)
    {
    case FONT_ASC_20x20P:
        switch (*chr)
        {
        case 0x20:
            return 10;
        case 0x49:
            return 12;
        }
        break;
    case FONT_ASC_72x64:
        switch (*chr)
        {
        case 0x20:
            return 18;
        case 0x49:
            return 30;
        }
        break;
    case FONT_ASC_16x16P:
        switch (*chr)
        {
        case 0x2C:
        case 0x27:
        case 0x2E:
            return 8;
        case 0x20:  
            return 9;
        case 0x49:
            return 8;
        case 0x69:
            return 7;
        case 0x6A:
            return 9;
        case 0x6C:
            return 9;
        case 0x6D:
            return 13;
        case 0x72:
            return 10;
        default:
            if (*chr >= 0x61 && *chr <= 0x7A)
                return 11;
            break;
        }
        break;
    case FONT_NUM_8x10:
        return 8;
    }
    return params->unk2;
}

float func_80071018(char *chr, int fontId)
{
    switch (fontId)
    {
    case FONT_ASC_72x64:
        switch (*chr)
        {
        case 0x4F:
            switch (*(chr + 1))
            {
            case 0x41:
                return 0.949999988079f;
            case 0x56:
                return 0.899999976158f;
            }
            break;
        case 0x44:
            switch (*(chr + 1))
            {
            case 0x59:
                return 0.899999976158f;
            }
            break;
        }
        break;
    case FONT_NUM_7x10:
        return 0.777769982815f;
    case FONT_RAC_ASC16x16:
        switch (*chr)
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

struct Struct80071140_a
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
};

struct Struct80071140_b
{
    s8 unk0;
    u8 unk1;
};  // size = 4

// TODO: dump rodata
/*
int func_80071140(struct Struct80071140_a *a, char *b, u32 *c, u32 *d, u32 *e)
{
    int r4;

    a->unk8 = 0;
    
    if (*b == 0x68 && *(b + 1) == 0x2F)
    {
        a->unk0 = (a->unk0 & 0xFFFF0000) | 1;
        *d = 1;
        return -2;
    }
    if (*b == 0x6B && *(b + 1) == 0x2F)
    {
        a->unk0 = (a->unk0 & 0xFFFF0000) | 2;
        *d = 1;
        return -2;
    }
    if (*b == 0x61 && *(b + 1) == 0x2F)
    {
        a->unk0 = (a->unk0 & 0xFFFF0000);
        *d = 1;
        return -2;
    }
    if (*b == 0x70 && *(b + 1) == 0x2F)
    {
        a->unk0 = (a->unk0 & 0xFFFF0000) | 3;
        *d = 1;
        return -2;
    }
    //lbl_8007124C
    if (*b == 0x63 && *(b + 1) == 0x2F)
    {
        *d += 4;
        *c = 0;
        // some more variables
        b += 4;
        // to lbl_80071354 (loop)
        while (*b != 0x2F)
        {
            int r0;
            switch (*b)
            {
            case 0+48:
                r0 = 0;
                break;
            case 1+48:
                r0 = 1;
                break;
            case 2+48:
                r0 = 2;
                break;
            case 3+48:
                r0 = 3;
                break;
            case 4+48:
                r0 = 4;
                break;
            case 5+48:
                r0 = 5;
                break;
            case 6+48:
                r0 = 6;
                break;
            case 7+48:
                r0 = 7;
                break;
            case 8+48:
                r0 = 8;
                break;
            case 9+48:
                r0 = 9;
                break;
            case 49+48:
                r0 = 10;
                break;
            case 50+48:
                r0 = 11;
                break;
            case 51+48:
                r0 = 12;
                break;
            case 52+48:
                r0 = 13;
                break;
            case 53+48:
                r0 = 14;
                break;
            case 54+48:
                r0 = 15;
                break;
            default:
                r0 = 0;
                break;
            }
            //lbl_80071330
            *c |= r0 << 0x14;
            *d += 1;
            b++;
        }
        return -2;
    }
    //lbl_80071368
    if (*b == 0x62 && *(b + 1) == 0x2F)
    {
        *a |= 0x10000;
        *d = 1;
        return -2;
    }
    if (*b == 0x2F && *(b + 1) == 0x62)
    {
        *a &= 0xFFFEFFFF;
        *d = 1;
        return -2;
    }
    //lbl_800713D0
    if (*b == 0x66 && *(b + 1) == 0x74 && *(b + 2) == 0x2F)
    {
        *e = 1;
        *d = 2;
        return -2;
    }
    if (*b == 0x66 && *(b + 1) == 0x70 && *(b + 2) == 0x2F)
    {
        *e = 2;
        *d = 2;
        return -2;
    }
    if (*b == 0x7A && *(b + 2) == 0x2F)
    {
        switch *(b + 1)
        {
        case 0x72:
            *e = 0x64;
            break;
        case 0x39:
            *e = 0x5A;
            break;
        case 0x38:
            *e = 0x50;
            break;
        case 0x37:
            *e = 0x46;
            break;
        }
        //lbl_800714B8
        *d = 2;
        return -2;
    }
    //lbl_800714C8
    a->unk0 &= 0xFFFDFFFF;
    r4 = a->unk0 & 0xFFFF;  // u16?
    if (r4 == 0)
    {
        //int r30;
        // are these returns, or variable assignment, then return?
        if (*b >= 0x41 && *b <= 0x5A)
            return *b + 0x87;
        if (*b >= 0x61 && *b <= 0x7A)
            return *b + 0x8F;
        if (*b >= 0x30 && *b <= 0x39)
            return *b + 0xE8;
        if (*b == 0x2E)
            return 0x155;
        if (*b == 0x2C)
            return 0x154;
        //lbl_80071560  // to be continued...
        return lbl_80117A80[
    }
    //lbl_80071570
}
*/
