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

struct Sprite
{
    u8 filler0[0x34];
    u32 unk34;
    s32 unk38;
    s8 *unk3C;
};

struct Struct8028CF58
{
    u8 filler0[0xF];
    s8 unkF;
    u8 filler10[0x30-0x10];
    void (*unk30)();
    void (*unk34)();
    u8 filler38[0x4C-0x38];
    float unk4C;
    u32 unk50;
    void *unk54;
    u8 filler58[0x74-0x58];
    u32 unk74;
    u8 filler78[0xBC-0x78];
};

struct Struct8028FE58
{
    //u32 unk0;
    struct Struct8028CF58 *unk0;
    struct Struct8028FE58 *unk4;
    struct Struct8028FE58 *unk8;
};

// .bss
struct Struct8028CF28 lbl_8028CF28;
struct Struct8028CF58 lbl_8028CF58[64];
struct Struct8028FE58 lbl_8028FE58[0x42];

extern struct Sprite lbl_80205988;

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
    struct Struct8028CF58 *r29;
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
    struct Struct8028CF58 *r30;
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
    struct Struct8028CF58 *r31_;
    struct Struct8028FE58 *r30;
    struct Struct8028CF58 *r8;
    struct Struct8028FE58 *r9;
    struct Struct8028FE58 *r10;
    s8 *r11;
    int r12;
    struct Struct8028CF58 *r6;
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
        func_8007033C(r31_);
        while (r31_->unk54 != 0)
        {
            func_8007033C(r31_->unk54);
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
#endif
