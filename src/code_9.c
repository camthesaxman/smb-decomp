#include <math.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#define MATHUTIL_SIN_INT_PARAM
#include "mathutil.h"
#include "sprite.h"

u32 lbl_801C14F0[] =
{
    0xFF00002C,
    0x65FFFBFF,
    0x2C2CFF57,
};

float lbl_801C14FC[] =
{
    -128,
    240,
    240,
    240,
    240,
    608,
    608,
};

extern void g_draw_pause_menu(struct Sprite *);

void func_80075D74(void)
{
    struct Sprite *sprite = create_sprite();

    if (sprite != NULL)
    {
        sprite->tag = 4;
        sprite->centerX = 315.0f;
        sprite->centerY = lbl_801C14FC[0];
        sprite->type = 1;
        sprite->fontId = 0xB1;
        sprite->textAlign = 4;
        sprite->unk4C = 0.005f;
        sprite->unk48 = 1;
        sprite->unk6C = 0.5f;
        sprite->unkC = 0;
        sprite->unkD = 0;
        sprite->unkE = 0;
        sprite->unk40 = 0.0f;
        sprite->unk44 = 0.0f;
        sprite->unk10 = 1;
        sprite->unk38 = g_draw_pause_menu;
        strcpy(sprite->text, "pause menu");
    }
}

void lbl_8007DE54();

void func_80075E1C(int unused, struct Sprite *b)
{
    struct Sprite *temp_r3_2;

    b->centerY += 0.075 * (lbl_801C14FC[b->unk48] - b->centerY);
    if (b->unk10 > 0)
    {
        b->unk44 = b->unk40;
        b->unk10--;
    }
    else
    {
        b->unk44 += 0.1 * (b->unk40 - b->unk44);
    }
    if (b->unk48 >= 2 && b->unk48 != 6)
    {
        if (b->unk6C < 0.99)
            b->unk6C += 0.01;
    }
    if (b->unk48 == 2)
    {
        if (b->unkC < 250.0)
            b->unkC += 5;
        b->unkD = b->unkC;
        b->unkE = b->unkC;
    }
    if (b->unk48 == 4)
    {
        b->unk48 = 5;
        temp_r3_2 = create_sprite();
        if (temp_r3_2 != NULL)
        {
            temp_r3_2->centerX = 320.0f;
            temp_r3_2->centerY = 240.0f;
            temp_r3_2->unkC = 0xFF;
            temp_r3_2->unkD = 0;
            temp_r3_2->unkE = 0x20;
            temp_r3_2->fontId = 9;
            temp_r3_2->textAlign = 4;
            temp_r3_2->unk10 = 60;
            temp_r3_2->unk48 = 60;
            temp_r3_2->unk4C = b->unk4C - 0.001;
            temp_r3_2->mainFunc = lbl_8007DE54;
            strcpy(temp_r3_2->text, "GAME OVER");
        }
    }
}

char *lbl_801C155C[] =
{
    "a/Continue game",
    "a/How to play",
    "a/Exit game",
};

char *lbl_801C1578[] =
{
    "a/Continue game",
    "a/View stage",
    "a/How to play",
    "a/Exit game",
};

char *lbl_801C1598[] =
{
    "a/Continue game",
    "a/Save replay",
    "a/How to play",
    "a/Exit game",
};

char *lbl_801C15B8[] =
{
    "a/Continue game",
    "a/Retry",
    "a/View stage",
    "a/How to play",
    "a/Stage select",
    "a/Exit game",
};

char *lbl_801C15D0[] =
{
    "a/Continue game",
    "a/Retry",
    "a/Save replay",
    "a/How to play",
    "a/Stage select",
    "a/Exit game",
};

char *lbl_801C15E8[] =
{
    "a/Continue game",
    "a/Retry",
    "a/How to play",
    "a/Exit game",
};

char *lbl_801C15F8[] =
{
    "a/Continue game",
    "a/Guide",
    "a/How to play",
    "a/Exit game",
};

char **lbl_801C1608[] =
{
    lbl_801C155C,
    lbl_801C1578,
    lbl_801C15B8,
    lbl_801C15E8,
    lbl_801C15F8,
    lbl_801C155C,
    lbl_801C1598,
    lbl_801C15D0,
    lbl_801C15E8,
    lbl_801C15F8,
};

void g_draw_pause_menu(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    int phi_r0;
    int phi_r15;
    u32 temp_r0_2;
    int temp_r16;
    int i;

    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.rotation = 0;
    params.unk3C = 0;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;

    if (lbl_801EEC68.unkC >= 4)
    {
        if (lbl_801EEC68.unkC == 6)
            phi_r0 = 0x5F;
        else
            phi_r0 = 0x59;
    }
    else
        phi_r0 = 0x44;
    params.bmpId = phi_r0;
    params.x = sprite->centerX;
    params.y = sprite->centerY;
    params.z = sprite->unk4C + 0.001;
    params.zoomX = 1.0f;
    params.zoomY = 1.0f;
    params.alpha = 1.0f;
    params.unk38 = ((int)(sprite->unk6C * 255.0f) << 24) | 0xFF0000 | 0xFFFF;
    draw_naomi_sprite(&params);

    params.bmpId = func_80081CFC(0, 0, playerCharacterSelection[lbl_801EEC68.unk15]);
    params.x = sprite->centerX - 110.0f;
    params.y = sprite->centerY + sprite->unk44 + 12.0f;
    params.z = sprite->unk4C;
    params.zoomX = 0.5f;
    params.zoomY = 0.325f;
    params.alpha = 1.0f;
    params.unk38 = ((int)(sprite->unk6C * 255.0f) << 24) | 0xFF0000 | 0xFFFF;
    draw_naomi_sprite(&params);
    phi_r15 = lbl_801EEC68.unk10;
    if ((lbl_801EEC68.unk4 & 4) != 0)
        phi_r15 += 5;
    func_80071A8C();
    func_80071AD4(sprite->fontId);
    func_80071B50(0x220000);
    temp_r0_2 = (globalFrameCounter >> 2) & 1;
    temp_r16 = temp_r0_2 * 0xFF;
    temp_r16 = (temp_r16 << 16) | (temp_r16 << 8) | temp_r16;

    for (i = 0; i < lbl_801EEC68.unkC; i++)
    {
        float phi_f22;
        float temp_f21;
        float temp_f20;
        int phi_r0_2;
        char text[24];

        func_80071B1C((i == lbl_801EEC68.unk8) ? sprite->unk4C - 0.001 : sprite->unk4C);

        if (lbl_801EEC68.unkC == 6)
            phi_f22 = i * 30 - 90;
        else if (lbl_801EEC68.unkC == 5)
            phi_f22 = i * 30 - 72;
        else if (lbl_801EEC68.unkC == 4)
            phi_f22 = i * 36 - 66;
        else
            phi_f22 = i * 36 - 48 + (3 - lbl_801EEC68.unkC) * 18;

        strcpy(text, lbl_801C1608[phi_r15][i]);
        temp_f21 = sprite->centerX - 48.0f;
        temp_f20 = sprite->centerY + phi_f22;
        func_80071B60(3.0f + temp_f21, 3.0f + temp_f20);
        func_80071AE4(0x202000);
        func_80071AF8(0);
        func_80071E58(text);
        func_80071B60(temp_f21, temp_f20);
        func_80071AE4((i == lbl_801EEC68.unk8) ? 0xFFFF00 : 0x808000);
        phi_r0_2 = ((lbl_801EEC68.unk4) & 1) != 0 && i == lbl_801EEC68.unk8;
        func_80071AF8(phi_r0_2 ? temp_r16 : 0);
        func_80071E58(text);

        if (phi_r15 == 4 && i == 1)
        {
            u32 temp_r3 = (1.0 - __fabs(mathutil_sin(globalFrameCounter << 9))) * 255.0;
            int temp_r24 = temp_r3 | ((temp_r3 << 0x10) | (temp_r3 << 8));

            strcpy(text, "ON");
            temp_f21 += 96.0f;
            func_80071B60(3.0f + temp_f21, 3.0f + temp_f20);
            func_80071AE4(0x202000);
            func_80071AF8(0);
            func_80071E58(text);
            func_80071B60(temp_f21, temp_f20);
            if (lbl_801EEC68.unk4 & 8)
                func_80071AE4(0xC0C000);
            else
                func_80071AE4(0x808000);
            if (i == lbl_801EEC68.unk8 && (lbl_801EEC68.unk4 & 8))
                func_80071AF8(temp_r24);
            else
                func_80071AF8(0);
            func_80071E58(text);

            strcpy(text, "OFF");
            temp_f21 += 50.0f;
            func_80071B60(3.0f + temp_f21, 3.0f + temp_f20);
            func_80071AE4(0x202000);
            func_80071AF8(0);
            func_80071E58(text);
            func_80071B60(temp_f21, temp_f20);
            if (!(lbl_801EEC68.unk4 & 8))
                func_80071AE4(0xC0C000);
            else
                func_80071AE4(0x808000);
            if (i == lbl_801EEC68.unk8 && !(lbl_801EEC68.unk4 & 8))
                func_80071AF8(temp_r24);
            else
                func_80071AF8(0);
            func_80071E58(text);
        }
        if (i == lbl_801EEC68.unk8)
            sprite->unk40 = phi_f22;
    }

    params.bmpId = 0x4B;
    params.x = 320.1f;
    params.y = 240.1f;
    params.z = (sprite->unk48 == 2) ? 0.001 : sprite->unk4C + 0.002;
    params.zoomX = 80.0f;
    params.zoomY = 60.0f;
    params.alpha = sprite->unk6C;
    params.unk38 = sprite->unkE | (((u8)sprite->unkD << 8) | ((((u8)(sprite->unk6C * 255.0f) << 24) | ((u8)sprite->unkC << 16))));
    draw_naomi_sprite(&params);
}

/*
const float lbl_802F4BD8 = 315f;
const float lbl_802F4BDC = 0.004999999888241291f;
const float lbl_802F4BE0 = 0.5f;
const float lbl_802F4BE4 = 0f;
const double lbl_802F4BE8 = 0.074999999999999997;
const double lbl_802F4BF0 = 0.10000000000000001;
const double lbl_802F4BF8 = 0.98999999999999999;
const double lbl_802F4C00 = 0.01;
const double lbl_802F4C08 = 250;
const float lbl_802F4C10 = 320f;
const float lbl_802F4C14 = 240f;
const double lbl_802F4C18 = 0.001;
const double lbl_802F4C20 = 4503599627370496;
const float lbl_802F4C28 = 1f;
const float lbl_802F4C2C = 255f;
const float lbl_802F4C30 = 110f;
const float lbl_802F4C34 = 12f;
const float lbl_802F4C38 = 0.32499998807907104f;
const float lbl_802F4C3C = 48f;
const float lbl_802F4C40 = 3f;
const double lbl_802F4C48 = 255;
const double lbl_802F4C50 = 1;
const float lbl_802F4C58 = 96f;
const float lbl_802F4C5C = 50f;
const float lbl_802F4C60 = 320.10000610351562f;
const float lbl_802F4C64 = 240.10000610351562f;
const double lbl_802F4C68 = 0.002;
const float lbl_802F4C70 = 80f;
const float lbl_802F4C74 = 60f;
const double lbl_802F4C78 = 4503601774854144;
const float lbl_802F4C80 = 10f;
const float lbl_802F4C84 = 446f;
const float lbl_802F4C88 = 463f;
const float lbl_802F4C8C = 115f;
const float lbl_802F4C90 = 300f;
const float lbl_802F4C94 = 301f;
const float lbl_802F4C98 = 6f;
const float lbl_802F4C9C = 16f;
const double lbl_802F4CA0 = 0.69999999999999996;
const double lbl_802F4CA8 = 0.033300000000000003;
const float lbl_802F4CB0 = 100f;
const float lbl_802F4CB4 = 194f;
*/
