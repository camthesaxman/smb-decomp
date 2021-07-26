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
};

struct Sprite
{
    u8 filler0[0x34];
    u32 unk34;
    s32 unk38;
    s8 *unk3C;
};

extern struct Struct8028CF28 lbl_8028CF28;
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

struct Struct8028CF58
{
    u8 filler0[0xF];
    s8 unkF;
    u8 filler10[0x30-0x10];
    void (*unk30)();
    void (*unk34)();
    u8 filler38[0xBC-0x38];
};

extern struct Struct8028CF58 lbl_8028CF58[];

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
