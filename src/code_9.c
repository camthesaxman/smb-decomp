#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "info.h"
#define MATHUTIL_SIN_INT_PARAM
#include "mathutil.h"
#include "mode.h"
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

extern void pause_menu_sprite_draw(struct Sprite *);

void lbl_80075D70(struct TextBox *a) {}

void g_open_pause_menu(void)
{
    struct Sprite *sprite = create_sprite();

    if (sprite != NULL)
    {
        sprite->tag = 4;
        sprite->centerX = 315.0f;
        sprite->centerY = lbl_801C14FC[0];
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->fontId = FONT_JAP_24x24_2P;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 0.005f;
        sprite->unk48 = 1;
        sprite->unk6C = 0.5f;
        sprite->unkC = 0;
        sprite->unkD = 0;
        sprite->unkE = 0;
        sprite->unk40 = 0.0f;
        sprite->unk44 = 0.0f;
        sprite->unk10 = 1;
        sprite->drawFunc = pause_menu_sprite_draw;
        strcpy(sprite->text, "pause menu");
    }
}

void lbl_8007DE54();

void func_80075E1C(int unused, struct Sprite *b)
{
    struct Sprite *gameOver;

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
        gameOver = create_sprite();
        if (gameOver != NULL)
        {
            gameOver->centerX = 320.0f;
            gameOver->centerY = 240.0f;
            gameOver->unkC = 0xFF;
            gameOver->unkD = 0;
            gameOver->unkE = 0x20;
            gameOver->fontId = FONT_ASC_72x64;
            gameOver->textAlign = ALIGN_CC;
            gameOver->unk10 = 60;
            gameOver->unk48 = 60;
            gameOver->unk4C = b->unk4C - 0.001;
            gameOver->mainFunc = lbl_8007DE54;
            strcpy(gameOver->text, "GAME OVER");
        }
    }
}

char *menuContHowExit[] =
{
    "a/Continue game",
    "a/How to play",
    "a/Exit game",
};

char *menuContViewHowExit[] =
{
    "a/Continue game",
    "a/View stage",
    "a/How to play",
    "a/Exit game",
};

char *menuContSaveHowExit[] =
{
    "a/Continue game",
    "a/Save replay",
    "a/How to play",
    "a/Exit game",
};

char *menuContRetryViewHowSelectExit[] =
{
    "a/Continue game",
    "a/Retry",
    "a/View stage",
    "a/How to play",
    "a/Stage select",
    "a/Exit game",
};

char *menuContRetrySaveHowSelectExit[] =
{
    "a/Continue game",
    "a/Retry",
    "a/Save replay",
    "a/How to play",
    "a/Stage select",
    "a/Exit game",
};

char *menuContRetryHowExit[] =
{
    "a/Continue game",
    "a/Retry",
    "a/How to play",
    "a/Exit game",
};

char *menuContGuideHowExit[] =
{
    "a/Continue game",
    "a/Guide",
    "a/How to play",
    "a/Exit game",
};

char **pauseMenus[] =
{
    menuContHowExit,
    menuContViewHowExit,
    menuContRetryViewHowSelectExit,
    menuContRetryHowExit,
    menuContGuideHowExit,

    menuContHowExit,
    menuContSaveHowExit,
    menuContRetrySaveHowSelectExit,
    menuContRetryHowExit,
    menuContGuideHowExit,
};

void pause_menu_sprite_draw(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    int bmpId;
    int menuType;
    int temp_r16;
    int i;

    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.rotation = 0;
    params.color2 = 0;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;

    if (lbl_801EEC68.unkC >= 4)
    {
        if (lbl_801EEC68.unkC == 6)
            bmpId = BITMAP_ID(BMP_COM, BMP_COM_menu_kiwaku_l2);
        else
            bmpId = BITMAP_ID(BMP_COM, BMP_COM_menu_kiwaku_l);
    }
    else
        bmpId = BITMAP_ID(BMP_COM, BMP_COM_menu_kiwaku);
    params.bmpId = bmpId;
    params.x = sprite->centerX;
    params.y = sprite->centerY;
    params.z = sprite->unk4C + 0.001;
    params.zoomX = 1.0f;
    params.zoomY = 1.0f;
    params.alpha = 1.0f;
    params.color1 = RGBA(255, 255, 255, (int)(sprite->unk6C * 255.0f));
    draw_naomi_sprite(&params);

    params.bmpId = func_80081CFC(0, 0, playerCharacterSelection[lbl_801EEC68.unk15]);
    params.x = sprite->centerX - 110.0f;
    params.y = sprite->centerY + sprite->unk44 + 12.0f;
    params.z = sprite->unk4C;
    params.zoomX = 0.5f;
    params.zoomY = 0.325f;
    params.alpha = 1.0f;
    params.color1 = RGBA(255, 255, 255, (int)(sprite->unk6C * 255.0f));
    draw_naomi_sprite(&params);

    menuType = lbl_801EEC68.unk10;
    if (lbl_801EEC68.unk4 & 4)
        menuType += 5;
    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B50(0x220000);
    temp_r16 = (u32)((globalFrameCounter >> 2) & 1) * 255;
    temp_r16 = RGBA(temp_r16, temp_r16, temp_r16, 0);

    for (i = 0; i < lbl_801EEC68.unkC; i++)
    {
        float phi_f22;
        float x;
        float y;
        char text[32];

        func_80071B1C((i == lbl_801EEC68.unk8) ? sprite->unk4C - 0.001 : sprite->unk4C);

        if (lbl_801EEC68.unkC == 6)
            phi_f22 = i * 30 - 90;
        else if (lbl_801EEC68.unkC == 5)
            phi_f22 = i * 30 - 72;
        else if (lbl_801EEC68.unkC == 4)
            phi_f22 = i * 36 - 66;
        else
            phi_f22 = i * 36 - 48 + (3 - lbl_801EEC68.unkC) * 18;

        strcpy(text, pauseMenus[menuType][i]);
        x = sprite->centerX - 48.0f;
        y = sprite->centerY + phi_f22;
        g_set_text_pos(3.0f + x, 3.0f + y);
        func_80071AE4(0x202000);
        g_set_some_sprite_color(0);
        g_draw_text(text);
        g_set_text_pos(x, y);
        func_80071AE4((i == lbl_801EEC68.unk8) ? 0xFFFF00 : 0x808000);
        g_set_some_sprite_color((((lbl_801EEC68.unk4) & 1) && i == lbl_801EEC68.unk8) ? temp_r16 : 0);
        g_draw_text(text);

        if (menuType == 4 && i == 1)
        {
            u32 temp_r3 = (1.0 - __fabs(mathutil_sin(globalFrameCounter << 9))) * 255.0;
            u32 temp_r24 = RGBA(temp_r3, temp_r3, temp_r3, 0);

            strcpy(text, "ON");
            x += 96.0f;
            g_set_text_pos(3.0f + x, 3.0f + y);
            func_80071AE4(0x202000);
            g_set_some_sprite_color(0);
            g_draw_text(text);
            g_set_text_pos(x, y);
            if (lbl_801EEC68.unk4 & 8)
                func_80071AE4(0xC0C000);
            else
                func_80071AE4(0x808000);
            if (i == lbl_801EEC68.unk8 && (lbl_801EEC68.unk4 & 8))
                g_set_some_sprite_color(temp_r24);
            else
                g_set_some_sprite_color(0);
            g_draw_text(text);

            strcpy(text, "OFF");
            x += 50.0f;
            g_set_text_pos(3.0f + x, 3.0f + y);
            func_80071AE4(0x202000);
            g_set_some_sprite_color(0);
            g_draw_text(text);
            g_set_text_pos(x, y);
            if (!(lbl_801EEC68.unk4 & 8))
                func_80071AE4(0xC0C000);
            else
                func_80071AE4(0x808000);
            if (i == lbl_801EEC68.unk8 && !(lbl_801EEC68.unk4 & 8))
                g_set_some_sprite_color(temp_r24);
            else
                g_set_some_sprite_color(0);
            g_draw_text(text);
        }
        if (i == lbl_801EEC68.unk8)
            sprite->unk40 = phi_f22;
    }

    params.bmpId = BITMAP_ID(BMP_COM, BMP_COM_white_mask8x8);
    params.x = 320.1f;
    params.y = 240.1f;
    params.z = (sprite->unk48 == 2) ? 0.001 : sprite->unk4C + 0.002;
    params.zoomX = 80.0f;
    params.zoomY = 60.0f;
    params.alpha = sprite->unk6C;
    params.color1 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, (u8)(sprite->unk6C * 255.0f));
    draw_naomi_sprite(&params);
}

void show_press_start_textbox(int a)
{
    struct TextBox spC;

    memset(&spC, 0, sizeof(spC));
    spC.unk16 = (a == 2 || a == 3) ? 8 : 15;
    spC.unkC = 0x140;
    spC.unkE = (a == 2 || a == 3) ? 0x169 : 0x19A;
    spC.numLines = 1;
    spC.unk1C = lbl_80075D70;
    g_create_textbox(0, 21, &spC);
    if (a == 3)
        g_set_textbox_text(0, "b/Select using the c/0xffffff/p/BUTTON_A/c/0x000000/ Button!");
    else
        g_set_textbox_text(0, "b/Press Start");
}

float force_lbl_802F4C80() { return 10.0f; }

void lbl_80076710(struct Sprite *sprite)
{
    int temp_r3;

    sprite->drawFunc = NULL;
    temp_r3 = func_80088C18();
    if (temp_r3 > 0)
    {
        sprite->centerX = 0x3E5 - temp_r3;
        sprite->centerY = 446.0f;
        func_800702C8(sprite);
    }
    if (temp_r3 < 0x280)
    {
        sprite->centerX = temp_r3 + 0x165;
        sprite->centerY = 463.0f;
        func_800702C8(sprite);
    }
    sprite->drawFunc = lbl_80076710;
}

extern void lbl_800768A8();

void g_logo_plus_sprite_something(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->tag = 3;
        sprite->centerX = 320.0f;
        sprite->centerY = 115.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 300.0f;
        sprite->bmpId = 0x101;
        strcpy(sprite->text, "logo plus");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->centerX = 320.0f;
        sprite->centerY = 240.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 301.0f;
        sprite->bmpId = 0x102;
        sprite->unk10 = 0;
        sprite->mainFunc = lbl_800768A8;
        sprite->unk74 |= 0x40000;
        strcpy(sprite->text, "logo");
    }
}

void lbl_80076AC0(struct Sprite *);

void lbl_800768A8(s8 *a, struct Sprite *sprite)
{
    struct Sprite *logoPlus = find_sprite_with_tag(3);

    if (sprite->unk10 <= 0x189)
        sprite->centerX -= 0.0f;  // does nothing
    else if (sprite->unk10 <= 0x198)
        sprite->centerX -= 10.0f + (6.0f * mathutil_sin((sprite->unk10 - 0x189) * 0x444));
    else if (sprite->unk10 <= 0x1E0)
        sprite->centerX -= 16.0f;

    if (sprite->unk10 >= 0x17A && sprite->unk10 <= 0x198)
    {
        sprite->unk40 = 1.0 - (0.7 * mathutil_sin((sprite->unk10 - 0x17A) * 0x444));
        sprite->unk44 = 1.0 + (0.7 * mathutil_sin((sprite->unk10 - 0x17A) * 0x444));
        if (logoPlus != NULL)
            logoPlus->unk6C = 0.0333 * (0x198 - sprite->unk10);
    }

    if (sprite->unk10 == 0x1E0)
    {
        sprite->centerX = 320.0f;
        sprite->bmpId = 0x100;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 1.0f;
        sprite->unk4C = 100.0f;
        if (logoPlus != NULL)
        {
            logoPlus->bmpId = 0x107;
            logoPlus->unk48 = 5;
            logoPlus->drawFunc = lbl_80076AC0;
            logoPlus->centerX = 194.0f;
            logoPlus->centerY = 74.0f;
        }
    }

    if (sprite->unk10 < 0x1E0)
        sprite->unk6C = 1.0f;
    else if (sprite->unk10 <= 0x258)
        sprite->unk6C = 0.0f;
    else if (sprite->unk10 <= 0x276)
    {
        sprite->unk6C = 0.0333 * (sprite->unk10 - 0x258);
        if (logoPlus != NULL)
            logoPlus->unk6C = sprite->unk6C;
    }

    sprite->unk10++;
}

void lbl_80076AC0(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    int r5 = sprite->unk48;

    params.bmpId = sprite->bmpId;
    params.x = sprite->centerX + (r5 % 2 == 1 ? 128 : -128);
    params.y = sprite->centerY + (sprite->unk48 == 0 ? 50 : 0);
    params.z = sprite->unk4C;
    params.u1 = 0.0f;
    params.v1 = 0.15625 * r5;
    params.u2 = 1.0f;
    params.v2 = 0.15625 + 0.15625 * r5;
    params.zoomX = sprite->unk40 * (params.u2 - params.u1);
    params.zoomY = 0.15625 * sprite->unk44;
    params.rotation = sprite->unk68;
    params.alpha = sprite->unk6C;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
    params.color1 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, (u8)(sprite->unk6C * 255.0f));
    params.color2 = 0;
    draw_naomi_sprite(&params);
}

void lbl_80076D9C(s8 *, struct Sprite *);

void show_adv_copyright_text(int a)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x25;
        sprite->type = 1;
        sprite->centerX = 357.0f;
        sprite->centerY = 463.0f;
        sprite->textAlign = 2;
        sprite->unk4C = 0.03f;
        sprite->bmpId = 0xD;
        sprite->mainFunc = lbl_80076D9C;
        strcpy(sprite->text, "(C)");
        if (a == 1)
            sprite->drawFunc = lbl_80076710;
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->tag = 0x26;
            sprite->centerX = 6.0f;
            sprite->fontId = 1;
            sprite->textAlign = 2;
            sprite->mainFunc = lbl_80076D9C;
            strcpy(sprite->text, "AMUSEMENT VISION,LTD./SEGA,2001");
        }
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x27;
        sprite->type = 1;
        sprite->centerX = 16.0f;
        sprite->centerY = 462.0f;
        sprite->unk4C = 0.03f;
        sprite->bmpId = 0x52;
        sprite->textAlign = 2;
        sprite->mainFunc = lbl_80076D9C;
        strcpy(sprite->text, "SEGA AV");
    }
}

void lbl_80076D9C(s8 *unused, struct Sprite *sprite)
{
    if (sprite->unk48 == -1 && sprite->unk6C > 0.0f)
        sprite->unk6C -= 0.05;
}

struct Struct80292C00
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u8 filler18[0x60-0x18];
} lbl_80292C00;
FORCE_BSS_ORDER(lbl_80292C00)

u8 lbl_80292C60[0x30];
FORCE_BSS_ORDER(lbl_80292C60)

struct Struct80292C90
{
    float unk0;
    float unk4;
};

struct Struct80292C90 lbl_80292C90[5];
FORCE_BSS_ORDER(lbl_80292C90)

struct Struct80292CB8
{
    float unk0;
    float unk4;
};

struct Struct80292C90 lbl_80292CB8[10];
FORCE_BSS_ORDER(lbl_80292CB8)

s8 lbl_80292D08[0x10];
FORCE_BSS_ORDER(lbl_80292D08)

extern struct
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u8 fillerC[0x14-0xC];
    u32 unk14;
} lbl_80292D18;
//FORCE_BSS_ORDER(lbl_80292D18)

void lbl_80076FA0(s8 *, struct Sprite *);
void lbl_80077280(struct Sprite *);

extern float lbl_802F2010;
extern float lbl_802F2014;

void func_80076DCC(int arg0)
{
    struct Sprite *sprite;
    int i;
    struct Struct80292C90 *r27;
    s8 *r27_;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = 1;
        sprite->unk4C = 0.095f;
        sprite->unk6C = 0.0f;
        sprite->unk10 = arg0;
        sprite->unk48 = arg0;
        sprite->mainFunc = lbl_80076FA0;
        sprite->drawFunc = lbl_80077280;
        strcpy(sprite->text, "title");

        r27 = lbl_80292C90;
        for (i = 0; i < 5; i++, r27++)
        {
            r27->unk0 = (arg0 == 1) ? 0.0 : -200.0 + 40.0 * ((rand() / 32767.0f) - 0.5);
            r27->unk4 = 0.0f;
        }

        r27 = lbl_80292CB8;
        r27_ = lbl_80292D08;
        for (i = 0; i < 10; i++, r27++, r27_++)
        {
            r27->unk0 = (arg0 == 1) ? 0.0 : 640.0 + 20.0 * ((rand() / 32767.0f) - 0.5);
            r27->unk4 = (arg0 == 1) ? 0.0 : -10.0;
            *r27_ = 0;
        }
        lbl_802F2010 = 0.0f;
        lbl_802F2014 = 0.0f;
    }
}

#ifdef NONMATCHING
void lbl_80076FA0(s8 *arg0, struct Sprite *arg1)
{
    struct Struct80292C90 *phi_r7;
    s8 *phi_r8;
    struct Struct80292C90 *phi_r5;
    int i;

    if (arg1->unk10 > 0)
        arg1->unk10--;

    (void)arg1->unk10;
    arg1->unk6C = 1.0 - ((float)arg1->unk10 / (float)arg1->unk48);

    phi_r7 = lbl_80292CB8;
    phi_r8 = lbl_80292D08;
    for (i = 0; i < 10; i++, phi_r7++, phi_r8++)
    {
        phi_r7->unk0 += phi_r7->unk4;
        if (*phi_r8 == 0 && phi_r7->unk0 <= 0.0f)
            *phi_r8 = 1;
        if (*phi_r8 != 0)
        {
            if (__abs(phi_r7->unk4) <= 2.0 && __abs(phi_r7->unk0) <= 2.0)
            {
                phi_r7->unk4 = 0.0f;
                phi_r7->unk0 = 0.0f;
            }
            else if (phi_r7->unk0 < 0.0f)
                phi_r7->unk4 = 4.0f;
            else
                phi_r7->unk4 = -1.0f;
        }
    }

    if (arg1->unk10 > (0.25 * (float)arg1->unk48))
        return;

    phi_r5 = lbl_80292C90;
    for (i = 0; i < 5; i++, phi_r5++)
    {
        phi_r5->unk4 += 0.5;
        phi_r5->unk0 += phi_r5->unk4;
        if (phi_r5->unk0 >= 0.0f)
        {
            if (phi_r5->unk4 <= 0.5)
            {
                phi_r5->unk4 = 0.0f;
                phi_r5->unk0 = 0.0f;
            }
            else
            {
                phi_r5->unk4 = 0.5 * -phi_r5->unk4;
                phi_r5->unk0 = 0.0f;
            }
        }
    }

    if (arg1->unk10 > 0.0)
        return;
    if (lbl_80292CB8[0].unk4 != 0.0)
        return;

    lbl_802F2014 += 0.25 * (1.0 - lbl_802F2014);
    if (modeCtrl.levelSetFlags & 4)
        lbl_802F2010 += 0.25 * -lbl_802F2010;
    else
        lbl_802F2010 += 0.25 * (1.0 - lbl_802F2010);
}
#else
const double lbl_802F4D28 = 2.0;
const float lbl_802F4D30 = 4.0f;
const float lbl_802F4D34 = -1.0f;
const double lbl_802F4D38 = 0.25;
asm void lbl_80076FA0(s8 *arg0, struct Sprite *arg1)
{
    nofralloc
#include "../asm/nonmatchings/lbl_80076FA0.s"
}
#pragma peephole on
#endif


struct Struct801C16AC
{
    u32 unk0;
    float unk4;
    float unk8;
};  //size = 0xC

struct Struct801C16AC lbl_801C16AC[] =
{
    { 275, 132,  46 },
    { 276, 203,  22 },
    { 277, 278,  10 },
    { 278, 351,  22 },
    { 279, 422,  46 },
};

struct Struct801C16AC lbl_801C16E8[] =
{
    { 268,  64, 195 },
    { 269, 133, 133 },
    { 270, 225, 105 },
    { 271, 321, 105 },
    { 272, 412, 133 },
    { 273, 480, 195 },
    { 267, 141, 256 },
    { 265, 228, 216 },
    { 266, 320, 216 },
    { 266, 407, 256 },
};

extern u32 lbl_80118AC8[];

void lbl_80077280(struct Sprite *sprite)
{
    int i;
    struct Struct801C16AC *phi_r28;
    struct Struct80292C90 *phi_r29;
    struct NaomiSpriteParams params;

    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.zoomX = 1.0f;
    params.zoomY = 1.0f;
    params.alpha = 1.0f;
    params.rotation = 0;
    params.color1 = RGBA(255, 255, 255, (u8)(255.0f * sprite->unk6C));
    params.color2 = 0;
    params.unk30 = -1;
    params.bmpId = 0x103;
    params.x = 320.1f;
    params.y = 240.1f;
    params.z = 0.004 + sprite->unk4C;
    params.alpha = sprite->unk6C;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
    draw_naomi_sprite(&params);

    phi_r28 = lbl_801C16AC;
    phi_r29 = lbl_80292C90;
    for (i = 0; i < 5; i++, phi_r28++, phi_r29++)
    {
        params.bmpId = 0x118;
        params.x = phi_r28->unk4 - 8.0f;
        params.y = phi_r28->unk8 + phi_r29->unk0 - 5.0f;
        params.z = 0.002 + sprite->unk4C;
        params.alpha = sprite->unk6C;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 5;
        draw_naomi_sprite(&params);

        params.bmpId = phi_r28->unk0;
        params.x = phi_r28->unk4;
        params.y = phi_r28->unk8 + phi_r29->unk0;
        params.z = sprite->unk4C;
        params.alpha = 1.0f;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 5;
        draw_naomi_sprite(&params);

        params.bmpId = 0x108;
        params.z = sprite->unk4C - 0.002;
        params.alpha = 1.0 - __fabs(0.2 * mathutil_sin(512.0f * phi_r29->unk0));
        draw_naomi_sprite(&params);
    }

    phi_r28 = lbl_801C16E8;
    phi_r29 = lbl_80292CB8;
    for (i = 0; i < 10; i++, phi_r28++, phi_r29++)
    {
        params.bmpId = 0x112;
        params.x = 56.0f + (phi_r28->unk4 + phi_r29->unk0 - 12.0f);
        params.y = 56.0f + (phi_r28->unk8 - 5.0f);
        params.z = 0.002 + sprite->unk4C;
        params.alpha = sprite->unk6C;
        params.rotation = 0;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
        draw_naomi_sprite(&params);

        params.bmpId = phi_r28->unk0;
        params.x = 44.0f + (phi_r28->unk4 + phi_r29->unk0);
        params.y = 44.0f + phi_r28->unk8;
        params.z = sprite->unk4C;
        params.alpha = 1.0f;
        params.rotation = -256.0f * phi_r29->unk0;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 0xA;
        draw_naomi_sprite(&params);

        params.bmpId = 0x104;
        params.z = sprite->unk4C - 0.002;
        params.alpha = 1.0 - __fabs(0.2 * mathutil_sin(512.0f * phi_r29->unk0));
        params.rotation = 0;
        draw_naomi_sprite(&params);
    }

    params.bmpId = 0x119;
    params.x = 482.0f;
    params.y = 338.0f;
    params.z = sprite->unk4C;
    params.alpha = lbl_802F2014;
    params.rotation = 0;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 5;
    draw_naomi_sprite(&params);

    params.bmpId = lbl_80118AC8[0];
    params.x = 320.0f;
    params.y = 331.0f;
    params.z = sprite->unk4C - 0.004;
    params.zoomX = lbl_802F2010 * 0.7;
    params.zoomY = lbl_802F2010 * 0.7 * 0.65;
    params.alpha = 1.0f;
    params.rotation = 1024.0f * mathutil_sin(unpausedFrameCounter << 8);
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 0xA;
    draw_naomi_sprite(&params);
}

void lbl_80077818(s8 *, struct Sprite *);
void lbl_80077ADC(s8 *, struct Sprite *);

void func_80077734(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0xC;
        sprite->unk4C = 0.049f;
        sprite->fontId = 0xB1;
        sprite->centerX = 320.0f;
        sprite->centerY = 374.0f;
        sprite->unk6C = 0.0f;
        sprite->unk10 = 0x1E;
        sprite->textAlign = 4;
        sprite->unk74 |= 0x200000;
        sprite->mainFunc = lbl_80077818;
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0xD;
        sprite->unk4C = 0.049f;
        sprite->fontId = 0xB1;
        sprite->centerX = 320.0f;
        sprite->centerY = 398.0f;
        sprite->unk6C = 0.0f;
        sprite->unk10 = 0x1E;
        sprite->textAlign = 4;
        sprite->unk74 |= 0x200000;
        sprite->mainFunc = lbl_80077ADC;
    }
}

void lbl_80077818(s8 *arg0, struct Sprite *sprite)
{
    if ((modeCtrl.levelSetFlags & 4) && textBoxes[0].unk0 == 10)
    {
        sprite->unk6C += 0.1 * (1.0 - sprite->unk6C);
        if (sprite->unk10 > 0)
            sprite->unk10--;
    }
    else
        sprite->unk6C += 0.1 * -sprite->unk6C;

    if (sprite->unk10 <= 15)
    {
        if (modeCtrl.unk10 == 0)
        {
            sprite->unkC += 0.1 * (255 - sprite->unkC);
            sprite->unkD += 0.1 * (128 - sprite->unkD);
            sprite->unkE += 0.1 * -sprite->unkE;
            sprite->unk40 = 1.0f;
            sprite->unk44 = 1.0f;
            strcpy(sprite->text, "p/SANNKAKU_R/ a/Game Start p/SANNKAKU_L/");
        }
        else
        {
            sprite->unkC += 0.1 * -sprite->unkC;
            sprite->unkD += 0.1 * -sprite->unkD;
            sprite->unkE += 0.1 * -sprite->unkE;
            sprite->unk6C *= 0.5;
            sprite->unk40 = 0.8f;
            sprite->unk44 = 0.8f;
            strcpy(sprite->text, "a/Game Start");
        }
    }
}

void lbl_80077ADC(s8 *arg0, struct Sprite *sprite)
{
    if ((modeCtrl.levelSetFlags & 4) && textBoxes[0].unk0 == 10)
    {
        sprite->unk6C += 0.1 * (1.0 - sprite->unk6C);
        if (sprite->unk10 > 0)
            sprite->unk10--;
    }
    else
        sprite->unk6C += 0.1 * -sprite->unk6C;

    if (sprite->unk10 <= 15)
    {
        if (modeCtrl.unk10 == 1)
        {
            sprite->unkC += 0.1 * (255 - sprite->unkC);
            sprite->unkD += 0.1 * (128 - sprite->unkD);
            sprite->unkE += 0.1 * -sprite->unkE;
            sprite->unk40 = 1.0f;
            sprite->unk44 = 1.0f;
            strcpy(sprite->text, "p/SANNKAKU_R/ a/Options p/SANNKAKU_L/");
        }
        else
        {
            sprite->unkC += 0.1 * -sprite->unkC;
            sprite->unkD += 0.1 * -sprite->unkD;
            sprite->unkE += 0.1 * -sprite->unkE;
            sprite->unk6C *= 0.5;
            sprite->unk40 = 0.8f;
            sprite->unk44 = 0.8f;
            strcpy(sprite->text, "a/Options");
        }
    }
}

void lbl_80080940(struct Sprite *);

char lbl_802F1024[5] = "saru";

void func_80077DA0(void)
{
    struct Sprite *temp_r3;

    temp_r3 = create_sprite();
    if (temp_r3 != NULL)
    {
        temp_r3->tag = 0x11;
        temp_r3->centerX = 142.0f;
        temp_r3->centerY = 60.0f;
        temp_r3->fontId = 0;
        temp_r3->textAlign = 9;
        temp_r3->unk4C = 0.04f;
        temp_r3->drawFunc = lbl_80080940;
        sprintf(temp_r3->text, lbl_802F1024);
    }
    lbl_80292D18.unk4 = 0;
    lbl_80292D18.unk0 = 0;
    lbl_80292D18.unk8 = 0;
    lbl_80292D18.unk14 = 0xE;
}

void lbl_8007A9B4(s8 *, struct Sprite *);
void lbl_8007AA38(s8 *, struct Sprite *);
void lbl_8007AAFC(struct Sprite *);
void lbl_8007B608(s8 *, struct Sprite *);

#if 0
void func_80077E34(void)
{
    struct Sprite *temp_r3;
    struct Sprite *temp_r3_2;
    struct Sprite *temp_r3_3;
    struct Sprite *temp_r3_4;
    struct Sprite *temp_r3_5;
    struct Sprite *temp_r3_6;
    struct Sprite *temp_r3_7;
    struct Ball *temp_r29;
    struct Struct80292C00 *r8;

    temp_r29 = currentBallStructPtr;
    func_8000D5B8(lbl_801C14F0);
    func_8008083C(320.0f, 68.0f);
    temp_r3 = create_sprite();
    if (temp_r3 != NULL)
    {
        temp_r3->centerX = 320.0f;
        temp_r3->centerY = 85.0f;
        temp_r3->fontId = 0x66;
        temp_r3->textAlign = 5;
        temp_r3->unk4C = 0.19f;
        temp_r3->mainFunc = lbl_8007A9B4;
        sprintf(temp_r3->text, "000");
        temp_r3_2 = create_linked_sprite(temp_r3);
        if (temp_r3_2 != NULL)
        {
            temp_r3_2->centerX = -4.0f;
            temp_r3_2->fontId = 0x65;
            temp_r3_2->textAlign = 5;
            temp_r3_2->unk4C = 0.19f;
            temp_r3_2->mainFunc = lbl_8007AA38;
            sprintf(temp_r3_2->text, ":00");
        }
    }
    temp_r3_3 = create_sprite();
    if (temp_r3_3 != NULL)
    {
        temp_r3_3->type = 1;
        temp_r3_3->centerX = 428.0f;
        temp_r3_3->centerY = 22.0f;
        temp_r3_3->bmpId = 0xC;
        temp_r3_3->textAlign = 4;
        temp_r3_3->unk40 = 0.2f;
        temp_r3_3->unk44 = 0.2f;
        sprintf(temp_r3_3->text, "banana.pic");
    }
    temp_r3_4 = create_sprite();
    if (temp_r3_4 != NULL)
    {
        temp_r3_4->centerX = 536.0f;
        temp_r3_4->centerY = 24.0f;
        temp_r3_4->fontId = 0x62;
        temp_r3_4->textAlign = 4;
        temp_r3_4->unkC = 0xAA;
        temp_r3_4->unkD = 0xA8;
        temp_r3_4->unkE = 0;
        temp_r3_4->unk70 = 0x38;
        temp_r3_4->unk71 = 0x38;
        temp_r3_4->unk72 = 0;
        sprintf(temp_r3_4->text, "BANANA(S)");
    }
    temp_r3_5 = create_sprite();
    if (temp_r3_5 != NULL)
    {
        temp_r3_5->centerX = 518.0f;
        temp_r3_5->centerY = 47.0f;
        temp_r3_5->fontId = 0x5E;
        temp_r3_5->textAlign = 4;
        temp_r3_5->unkC = 0xAA;
        temp_r3_5->unkD = 0xA8;
        temp_r3_5->unkE = 0;
        temp_r3_5->unk70 = 0x38;
        temp_r3_5->unk71 = 0x38;
        temp_r3_5->unk72 = 0;
        sprintf(temp_r3_5->text, "/");
    }
    temp_r3_6 = create_sprite();
    if (temp_r3_6 != NULL)
    {
        temp_r3_6->tag = 0x12;
        temp_r3_6->centerX = 518.0f;
        temp_r3_6->centerY = 48.0f;
        temp_r3_6->fontId = 0x62;
        temp_r3_6->textAlign = 4;
        temp_r3_6->drawFunc = lbl_8007AAFC;
        temp_r3_6->unkC = 0xAA;
        temp_r3_6->unkD = 0xA8;
        temp_r3_6->unkE = 0;
        temp_r3_6->unk70 = 0x38;
        temp_r3_6->unk71 = 0x38;
        temp_r3_6->unk72 = 0;
        sprintf(temp_r3_6->text, "000 100");
    }
    /*
    lbl_80292C00.unk4 = 0;
    lbl_80292C00.unkC = 0;
    lbl_80292C00.unk14 = 0;
    lbl_80292C00.unk0 = (s32) (temp_r29->bananas % 10);
    lbl_80292C00.unk8 = (u32) (temp_r29->bananas / 10);
    lbl_80292C00.unk10 = (u32) (temp_r29->bananas / 100);
    */
    r8 = &lbl_80292C00;
    r8->unk4 = 0;
    r8->unkC = 0;
    r8->unk14 = 0;
    r8->unk0 = (s32) (temp_r29->bananas % 10);
    r8->unk8 = (u32) (temp_r29->bananas / 10);
    r8->unk10 = (u32) (temp_r29->bananas / 100);
    if (infoWork.flags & 0x40)
    {
        temp_r3_7 = create_sprite();
        if (temp_r3_7 != NULL)
        {
            temp_r3_7->centerX = 320.0f;
            temp_r3_7->centerY = 380.0f;
            temp_r3_7->fontId = 0x64;
            temp_r3_7->textAlign = 4;
            temp_r3_7->unk10 = (s16) 0;
            temp_r3_7->mainFunc = lbl_8007B608;
            strcpy(temp_r3_7->text, "%2d BANANAS LEFT");
        }
    }
}
#endif

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
const float lbl_802F4CB8 = 74f;
const double lbl_802F4CC0 = 0.15625;
const float lbl_802F4CC8 = 357f;
const float lbl_802F4CCC = 0.029999999329447746f;
const float lbl_802F4CD0 = 462f;
const double lbl_802F4CD8 = 0.050000000000000003;
const float lbl_802F4CE0 = 0.094999998807907104f;
const double lbl_802F4CE8 = 0;
const double lbl_802F4CF0 = -200;
const double lbl_802F4CF8 = 40;
const float lbl_802F4D00 = 32767f;
const double lbl_802F4D08 = 0.5;
const double lbl_802F4D10 = 640;
const double lbl_802F4D18 = 20;
const double lbl_802F4D20 = -10;
const double lbl_802F4D28 = 2;
const float lbl_802F4D30 = 4f;
const float lbl_802F4D34 = -1f;
const double lbl_802F4D38 = 0.25;
const double lbl_802F4D40 = 0.0040000000000000001;
const float lbl_802F4D48 = 8f;
const float lbl_802F4D4C = 5f;
const double lbl_802F4D50 = 0.20000000000000001;
const float lbl_802F4D58 = 512f;
const float lbl_802F4D5C = 56f;
const float lbl_802F4D60 = 44f;
const float lbl_802F4D64 = -256f;
const float lbl_802F4D68 = 482f;
const float lbl_802F4D6C = 338f;
const float lbl_802F4D70 = 331f;
const double lbl_802F4D78 = 0.65000000000000002;
const float lbl_802F4D80 = 1024f;
const float lbl_802F4D84 = 0.048999998718500137f;
const float lbl_802F4D88 = 374f;
const float lbl_802F4D8C = 398f;
const float lbl_802F4D90 = 0.80000001192092896f;
const float lbl_802F4D94 = 142f;
const float lbl_802F4D98 = 0.039999999105930328f;
const float lbl_802F4D9C = 0.10000000149011612f;
const float lbl_802F4DA0 = 40f;
const float lbl_802F4DA4 = 68f;
const float lbl_802F4DA8 = 85f;
const float lbl_802F4DAC = 0.18999999761581421f;
const float lbl_802F4DB0 = -4f;

*/
