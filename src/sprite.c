#include <math.h>
#include <dolphin.h>

#include "global.h"

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

struct SpritePoolInfo
{
    u8 filler0[0x34];
    u32 unk34;
    s32 unk38;
    s8 *unk3C;  // statusList
};

struct Sprite
{
    s8 unk0;
    u8 filler1[1];
    s8 unk2;
    u8 filler3[0xF-3];
    s8 unkF;
    u8 filler10[0x30-0x10];
    void (*unk30)();
    void (*unk34)();
    void (*unk38)(struct Sprite *);
    u16 unk3C;
    u8 filler3E[0x4C-0x3E];
    float unk4C;
    u32 unk50;
    void *unk54;
    u32 unk58;
    u32 unk5C;
    u32 unk60;
    u32 unk64;
    u8 filler68[0x74-0x68];
    u32 unk74;
    u32 unk78;
    u8 filler7C[0xBC-0x7C];
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

extern struct SpritePoolInfo lbl_80205988;

void ev_sprite_init(void)
{
    struct Struct8028CF28 *r5 = &lbl_8028CF28;
    s8 *r6 = lbl_80205988.unk3C;
    /*
    int i = 0;

    while (i < lbl_80205988.unk38)
    {
        *r6 = 0;
        i++;
        r6++;
    }
    */

    int i;
    for (i = 0; i < lbl_80205988.unk38; i++, r6++)
        *r6 = 0;

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
    struct Sprite *r29;
    s8 *r28;
    int i = 0;  // r27

    if (lbl_802F1EE0 & 0xA)
        return;
    lbl_802F2000 = 0;
    r28 = lbl_80205988.unk3C;
    r29 = lbl_8028CF58;
    for (i = 0; i < lbl_80205988.unk38; i++, r29++, r28++)
    {
        if (*r28 != 0)
        {
            lbl_802F2000 |= 1 << r29->unkF;
            if (r29->unk34 != NULL)
                r29->unk34(r28, r29);
        }
    }
    func_80073EF8();
}

void ev_sprite_dest(void)
{
    struct Sprite *r30;
    s8 *r29;
    int i = 0;  // r28

    r30 = lbl_8028CF58;
    r29 = lbl_80205988.unk3C;
    for (; i < 64; i++, r30++, r29++)
    {
        if (*r29 != 0)
        {
            if (r30->unk30 != NULL)
                r30->unk30(r30);
            *r29 = 0;
        }
    }

    lbl_80205988.unk34 = 0;
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

    r11 = lbl_80205988.unk3C;
    for (i = 0; i < lbl_80205988.unk38; r8++, i++, r11++)
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
            if (r8->unk50 != 0)
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
    if (gameMode == 4)
    {
        switch (gameSubmode)
        {
        case 0x90:
        case 0x91:
        case 0x92:
        case 0x93:
        case 0x9C:
        case 0x9D:
        case 0xA2:
        case 0xA3:
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
    if (lbl_80205988.unk3C[sprite->unk2] != 0 && sprite->unk50 == 0)
    {
        g_something_with_sprites(sprite);
        while (sprite->unk54 != NULL)
        {
            g_something_with_sprites(sprite->unk54);
            sprite = sprite->unk54;
        }
    }
}

struct Struct80181CB4
{
    u32 unk0;
    void *unk4;
    void *unk8;
    u8 fillerC[0x18-0xC];
};

extern struct Struct80181CB4 lbl_80181CB4[];

struct Struct801BE470
{
    u32 unk0;
    u32 unk4;
};

struct Struct801BE470 lbl_801BE470[] =
{
    {0xFFFFFFC0, 0xFFFFFF90},
    {0xFFFFFFC0, 0x00000050},
    {0xFFFFFFC0, 0x000000B0},
    {0xFFFFFFC0, 0x000000E0},
    {0x00000100, 0xFFFFFF90},
    {0x00000100, 0x00000050},
    {0x00000100, 0x000000B0},
    {0x00000100, 0x000000E0},
};

struct Struct801BE4B0
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

struct Struct801BE4B0 lbl_801BE4B0[] =
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

/*
void g_something_with_sprites(struct Sprite *a)
{
    if (a->unk78 & 1)
        return;
    func_80070A08(a, &a->unk58, &a->unk5C, &a->unk60, &a->unk64);
    if (a->unk38 != NULL)
    {
        a->unk38(a);
        return;
    }
    //lbl_8007039C
    switch (a->unk0)
    {
    case 0:
        func_80072B50(a);
        break;
    case 1:
        if (lbl_80181CB4[a->unk3C].unk0 == 0)
        {
            
        }
    }
}
*/
