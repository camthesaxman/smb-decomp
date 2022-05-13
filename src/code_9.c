#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "info.h"
#include "input.h"
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
            bmpId = BMP_COM_menu_kiwaku_l2;
        else
            bmpId = BMP_COM_menu_kiwaku_l;
    }
    else
        bmpId = BMP_COM_menu_kiwaku;
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

    params.bmpId = BMP_COM_white_mask8x8;
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
        sprite->bmpId = BMP_ADV_adv_logo_plus;
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
        sprite->bmpId = BMP_ADV_logo_sega512;
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
        sprite->bmpId = BMP_ADV_logo_av256;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 1.0f;
        sprite->unk4C = 100.0f;
        if (logoPlus != NULL)
        {
            logoPlus->bmpId = BMP_ADV_logo_plus256x40;
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
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->centerX = 357.0f;
        sprite->centerY = 463.0f;
        sprite->textAlign = ALIGN_LB;
        sprite->unk4C = 0.03f;
        sprite->bmpId = BMP_COM_copyright_02;
        sprite->mainFunc = lbl_80076D9C;
        strcpy(sprite->text, "(C)");
        if (a == 1)
            sprite->drawFunc = lbl_80076710;

        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->tag = 38;
            sprite->centerX = 6.0f;
            sprite->fontId = FONT_ASC_8x16;
            sprite->textAlign = ALIGN_LB;
            sprite->mainFunc = lbl_80076D9C;
            strcpy(sprite->text, "AMUSEMENT VISION,LTD./SEGA,2001");
        }
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 39;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->centerX = 16.0f;
        sprite->centerY = 462.0f;
        sprite->unk4C = 0.03f;
        sprite->bmpId = BMP_COM_str_sega;
        sprite->textAlign = ALIGN_LB;
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
extern struct Struct80292C00 lbl_80292C00_alias;

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
        sprite->type = SPRITE_TYPE_BITMAP;
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

void lbl_80076FA0(s8 *arg0, struct Sprite *arg1)
{
    int i;

    if (arg1->unk10 > 0)
        arg1->unk10--;

    !arg1;  // needed to match

    arg1->unk6C = 1.0 - (float)(arg1->unk10) / (float)(arg1->unk48);

    for (i=0; i < 10; i++)
    {
        lbl_80292CB8[i].unk0 += lbl_80292CB8[i].unk4;
        if (lbl_80292D08[i] == 0 && lbl_80292CB8[i].unk0 <= 0.0f)
            lbl_80292D08[i] = 1;
        if (lbl_80292D08[i] != 0)
        {
            if (__abs(lbl_80292CB8[i].unk4) <= 2.0 && __abs(lbl_80292CB8[i].unk0) <= 2.0)
            {
                lbl_80292CB8[i].unk4 = 0.0f;
                lbl_80292CB8[i].unk0 = 0.0f;
            }
            else if (lbl_80292CB8[i].unk0 < 0.0f)
                lbl_80292CB8[i].unk4 = 4.0f;
            else
                lbl_80292CB8[i].unk4 = -1.0f;
        }
    }

    if (arg1->unk10 > (0.25 * (float)arg1->unk48))
        return;

    for (i = 0; i < 5; i++)
    {
        lbl_80292C90[i].unk4 += 0.5;
        lbl_80292C90[i].unk0 += lbl_80292C90[i].unk4;
        if (lbl_80292C90[i].unk0 >= 0.0f)
        {
            if (lbl_80292C90[i].unk4 <= 0.5)
            {
                lbl_80292C90[i].unk4 = 0.0f;
                lbl_80292C90[i].unk0 = 0.0f;
            }
            else
            {
                lbl_80292C90[i].unk4 = 0.5 * -lbl_80292C90[i].unk4;
                lbl_80292C90[i].unk0 = 0.0f;
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

struct Struct801C16AC
{
    u32 bmpId;
    float x;
    float y;
};  //size = 0xC

struct Struct801C16AC titleLettersSuper[] =
{
    { BMP_ADV_adv_title_spr_s, 132,  46 },
    { BMP_ADV_adv_title_spr_u, 203,  22 },
    { BMP_ADV_adv_title_spr_p, 278,  10 },
    { BMP_ADV_adv_title_spr_e, 351,  22 },
    { BMP_ADV_adv_title_spr_r, 422,  46 },
};

struct Struct801C16AC titleLettersMonkeyBall[] =
{
    { BMP_ADV_adv_title_mnk_m,  64, 195 },
    { BMP_ADV_adv_title_mnk_o, 133, 133 },
    { BMP_ADV_adv_title_mnk_n, 225, 105 },
    { BMP_ADV_adv_title_mnk_k, 321, 105 },
    { BMP_ADV_adv_title_mnk_e, 412, 133 },
    { BMP_ADV_adv_title_mnk_y, 480, 195 },
    { BMP_ADV_adv_title_mnk_b, 141, 256 },
    { BMP_ADV_adv_title_mnk_a, 228, 216 },
    { BMP_ADV_adv_title_mnk_l, 320, 216 },
    { BMP_ADV_adv_title_mnk_l, 407, 256 },
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

    params.bmpId = BMP_ADV_adv_title_bg;
    params.x = 320.1f;
    params.y = 240.1f;
    params.z = 0.004 + sprite->unk4C;
    params.alpha = sprite->unk6C;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
    draw_naomi_sprite(&params);

    phi_r28 = titleLettersSuper;
    phi_r29 = lbl_80292C90;
    for (i = 0; i < 5; i++, phi_r28++, phi_r29++)
    {
        params.bmpId = BMP_ADV_adv_title_spr_kage;
        params.x = phi_r28->x - 8.0f;
        params.y = phi_r28->y + phi_r29->unk0 - 5.0f;
        params.z = 0.002 + sprite->unk4C;
        params.alpha = sprite->unk6C;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 5;
        draw_naomi_sprite(&params);

        params.bmpId = phi_r28->bmpId;
        params.x = phi_r28->x;
        params.y = phi_r28->y + phi_r29->unk0;
        params.z = sprite->unk4C;
        params.alpha = 1.0f;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 5;
        draw_naomi_sprite(&params);

        params.bmpId = BMP_ADV_adv_title_spr_gawa;
        params.z = sprite->unk4C - 0.002;
        params.alpha = 1.0 - __fabs(0.2 * mathutil_sin(512.0f * phi_r29->unk0));
        draw_naomi_sprite(&params);
    }

    phi_r28 = titleLettersMonkeyBall;
    phi_r29 = lbl_80292CB8;
    for (i = 0; i < 10; i++, phi_r28++, phi_r29++)
    {
        params.bmpId = BMP_ADV_adv_title_mnk_kage;
        params.x = 56.0f + (phi_r28->x + phi_r29->unk0 - 12.0f);
        params.y = 56.0f + (phi_r28->y - 5.0f);
        params.z = 0.002 + sprite->unk4C;
        params.alpha = sprite->unk6C;
        params.rotation = 0;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
        draw_naomi_sprite(&params);

        params.bmpId = phi_r28->bmpId;
        params.x = 44.0f + (phi_r28->x + phi_r29->unk0);
        params.y = 44.0f + phi_r28->y;
        params.z = sprite->unk4C;
        params.alpha = 1.0f;
        params.rotation = -256.0f * phi_r29->unk0;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 0xA;
        draw_naomi_sprite(&params);

        params.bmpId = BMP_ADV_adv_title_mnk_gawa;
        params.z = sprite->unk4C - 0.002;
        params.alpha = 1.0 - __fabs(0.2 * mathutil_sin(512.0f * phi_r29->unk0));
        params.rotation = 0;
        draw_naomi_sprite(&params);
    }

    params.bmpId = BMP_ADV_adv_title_tm;
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
        sprite->tag = 12;
        sprite->unk4C = 0.049f;
        sprite->fontId = FONT_JAP_24x24_2P;
        sprite->centerX = 320.0f;
        sprite->centerY = 374.0f;
        sprite->unk6C = 0.0f;
        sprite->unk10 = 0x1E;
        sprite->textAlign = ALIGN_CC;
        sprite->unk74 |= 0x200000;
        sprite->mainFunc = lbl_80077818;
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 13;
        sprite->unk4C = 0.049f;
        sprite->fontId = FONT_JAP_24x24_2P;
        sprite->centerX = 320.0f;
        sprite->centerY = 398.0f;
        sprite->unk6C = 0.0f;
        sprite->unk10 = 0x1E;
        sprite->textAlign = ALIGN_CC;
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
        temp_r3->tag = 17;
        temp_r3->centerX = 142.0f;
        temp_r3->centerY = 60.0f;
        temp_r3->fontId = FONT_ASCII;
        temp_r3->textAlign = ALIGN_PIC;
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

char lbl_802F102C[4] = "000";
char lbl_802F1030[4] = ":00";
char lbl_802F1034[2] = "/";
char lbl_802F1038[8] = "000 100";

const float lbl_802F4D9C = 0.10000000149011612f;
const float lbl_802F4DA0 = 40.0f;

void func_80077E34(void)
{
    struct Sprite *sprite;
    struct Ball *ball;
    u8 filler[16];

    ball = currentBallStructPtr;
    func_8000D5B8();
    func_8008083C(320.0f, 68.0f);

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->centerX = 320.0f;
        sprite->centerY = 85.0f;
        sprite->fontId = FONT_NUM_24x37;
        sprite->textAlign = ALIGN_CB;
        sprite->unk4C = 0.19f;
        sprite->mainFunc = lbl_8007A9B4;
        sprintf(sprite->text, lbl_802F102C);
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->centerX = -4.0f;
            sprite->fontId = FONT_NUM_12x19;
            sprite->textAlign = ALIGN_CB;
            sprite->unk4C = 0.19f;
            sprite->mainFunc = lbl_8007AA38;
            sprintf(sprite->text, lbl_802F1030);
        }
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->centerX = 428.0f;
        sprite->centerY = 22.0f;
        sprite->bmpId = BMP_COM_banana_01;
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.2f;
        sprite->unk44 = 0.2f;
        sprintf(sprite->text, "banana.pic");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->centerX = 536.0f;
        sprite->centerY = 24.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CC;
        sprite->unkC = 0xAA;
        sprite->unkD = 0xA8;
        sprite->unkE = 0;
        sprite->unk70 = 0x38;
        sprite->unk71 = 0x38;
        sprite->unk72 = 0;
        sprintf(sprite->text, "BANANA(S)");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->centerX = 518.0f;
        sprite->centerY = 47.0f;
        sprite->fontId = FONT_NUM_22x22;
        sprite->textAlign = ALIGN_CC;
        sprite->unkC = 0xAA;
        sprite->unkD = 0xA8;
        sprite->unkE = 0;
        sprite->unk70 = 0x38;
        sprite->unk71 = 0x38;
        sprite->unk72 = 0;
        sprintf(sprite->text, lbl_802F1034);
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x12;
        sprite->centerX = 518.0f;
        sprite->centerY = 48.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CC;
        sprite->drawFunc = lbl_8007AAFC;
        sprite->unkC = 0xAA;
        sprite->unkD = 0xA8;
        sprite->unkE = 0;
        sprite->unk70 = 0x38;
        sprite->unk71 = 0x38;
        sprite->unk72 = 0;
        sprintf(sprite->text, lbl_802F1038);
    }

    lbl_80292C00_alias.unk4 = 0;
    lbl_80292C00_alias.unkC = 0;
    lbl_80292C00_alias.unk14 = 0;
    lbl_80292C00_alias.unk0 = ball->bananas % 10;
    lbl_80292C00_alias.unk8 = ball->bananas / 10;
    lbl_80292C00_alias.unk10 = ball->bananas / 100;

    if (infoWork.flags & 0x40)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->centerX = 320.0f;
            sprite->centerY = 380.0f;
            sprite->fontId = FONT_ASC_32x32;
            sprite->textAlign = ALIGN_CC;
            sprite->unk10 = 0;
            sprite->mainFunc = lbl_8007B608;
            strcpy(sprite->text, "%2d BANANAS LEFT");
        }
    }
}

void lbl_800782CC(s8 *, struct Sprite *);

void g_banana_sprite_something(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = arg0 + 30;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->centerX = textBoxes[arg0 + 1].unkC;
        sprite->centerY = textBoxes[arg0 + 1].unkE;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = (f32) (0.05 + (0.01 * (f64) (arg0 + 1)));
        sprite->bmpId = (arg0 == 2) ? BMP_COM_banana_01 : BMP_COM_banana_10;
        sprite->unk6C = 0.0f;
        sprite->unk40 = (arg0 == 2) ? 0.7 : 0.8;
        sprite->unk44 = (arg0 == 2) ? 0.5 : 0.6;
        sprite->unk10 = 60;
        sprite->unk48 = arg0;
        sprite->mainFunc = lbl_800782CC;
        strcpy(sprite->text, "banana");
    }
}

void lbl_800782CC(s8 *arg0, struct Sprite *arg1)
{
    if (arg1->unk10 == -1)
    {
        *arg0 = 0;
        return;
    }
    if (arg1->unk10 > 0)
        arg1->unk10--;
    arg1->centerX = textBoxes[arg1->unk48 + 1].unkC;
    arg1->centerY = textBoxes[arg1->unk48 + 1].unkE - ((arg1->unk48 == 2) ? 0x36 : 0x42);
    if (arg1->unk10 < 15)
        arg1->unk6C = 1.0f - arg1->unk10 / 15.0f;
}

void lbl_80078450(s8 *, struct Sprite *);
void lbl_80078460(struct Sprite *);

void g_text_box_icon(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 11;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 10.0f;
        sprite->unk48 = arg0;
        sprite->unk10 = 0;
        sprite->unk74 |= 0x40000;
        sprite->mainFunc = lbl_80078450;
        sprite->drawFunc = lbl_80078460;
        strcpy(sprite->text, "eieipu");
    }
}

void lbl_80078450(s8 *a, struct Sprite *sprite)
{
    sprite->unk10++;
}

struct Struct801C17FC
{
    float unk0;
    float unk4;
};

struct Struct801C17FC lbl_801C17FC[] =
{
    { 100,  50 },
    { 300,  50 },
    { 500,  50 },
    { 700,  50 },
    {   0, 250 },
    { 200, 250 },
    { 400, 250 },
    { 600, 250 },
    { 800, 250 },
    { 100, 450 },
    { 300, 450 },
    { 500, 450 },
    { 700, 450 },
};

struct Struct801C17FC lbl_801C1864[] =
{
    { 200, -150 },
    { 400, -150 },
    { 600, -150 },
    { 800, -150 },
    { 100,   50 },
    { 300,   50 },
    { 500,   50 },
    { 700,   50 },
    {   0,  250 },
    { 200,  250 },
    { 400,  250 },
    { 600,  250 },
    { 800,  250 },
    { 100,  450 },
    { 300,  450 },
    { 500,  450 },
    { 700,  450 },
    {   0,  650 },
    { 200,  650 },
    { 400,  650 },
    { 600,  650 },
};

struct Struct801C17FC lbl_801C190C[] =
{
    { -100,  50 },
    {  100,  50 },
    {  300,  50 },
    {  500,  50 },
    {  700,  50 },
    {    0, 250 },
    {  200, 250 },
    {  400, 250 },
    {  600, 250 },
    {  800, 250 },
    { -100, 450 },
    {  100, 450 },
    {  300, 450 },
    {  500, 450 },
    {  700, 450 },
};

u32 lbl_801C1984[] =
{
    BMP_COM_icon_smile04,
    BMP_COM_icon_gal_smile04,
    BMP_COM_icon_kid_smile02,
    0x00FFFF00,
    0x00FF00FF,
    0x0000FFFF,
};

void lbl_80078460(struct Sprite *sprite)
{
    f32 temp_f29;
    int i;
    struct NaomiSpriteParams params;

    params.z = sprite->unk4C;
    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.alpha = 1.0f;
    params.rotation = 0;
    params.color1 = RGBA(255, 255, 255, (u8)(255.0f * sprite->unk6C));
    params.color2 = 0;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;

    temp_f29 = 0.5 * mathutil_sin((sprite->unk10 << 9) + 0x4000);

    switch (sprite->unk48)
    {
    case 0:
        for (i = 0; i < 13; i++)
        {
            params.bmpId = BMP_COM_banana_10;
            params.x = lbl_801C17FC[i].unk0;
            params.y = lbl_801C17FC[i].unk4;
            params.zoomX = 1.0 + ((i % 2 == 0) ? temp_f29 : -temp_f29);
            params.zoomY = 1.0 + ((i % 2 == 0) ? temp_f29 : -temp_f29);
            draw_naomi_sprite(&params);
        }
        break;
    case 1:
        for (i = 0; i < 21; i++)
        {
            params.bmpId = BMP_COM_banana_01;
            params.x = lbl_801C1864[i].unk0;
            params.y = lbl_801C1864[i].unk4;
            params.x += (i % 2 == 0) ? -sprite->unk10 : sprite->unk10;
            params.y += (i % 2 == 0) ? sprite->unk10 * 2 : -sprite->unk10 * 2;
            params.zoomX = 1.0f;
            params.zoomY = 1.0f;
            draw_naomi_sprite(&params);
        }
        break;
    case 2:
        for (i = 0; i < 13; i++)
        {
            params.bmpId = lbl_801C1984[i % 3];
            params.x = lbl_801C17FC[i].unk0;
            params.y = lbl_801C17FC[i].unk4;
            params.zoomX = 1.0f;
            params.zoomY = 0.65f;
            params.rotation = 4096.0f * temp_f29;
            draw_naomi_sprite(&params);
        }
        break;
    case 3:
        for (i = 0; i < 13; i++)
        {
            params.bmpId = BMP_COM_icon_gol_angry03;
            params.x = lbl_801C17FC[i].unk0;
            params.y = lbl_801C17FC[i].unk4;
            params.zoomX = 1.0 + temp_f29;
            params.zoomY = 0.65 * (1.0 + temp_f29);
            draw_naomi_sprite(&params);
        }
        break;
    case 4:
        for (i = 0; i < 15; i++)
        {
            params.bmpId = (i % 2 == 0) ? BMP_COM_banana_10 : BMP_COM_banana_01;
            params.x = lbl_801C190C[i].unk0 + ((i / 5 == 1) ? -sprite->unk10 : sprite->unk10);
            params.y = lbl_801C190C[i].unk4;
            params.zoomX = 0.8f;
            params.zoomY = 0.8f;
            draw_naomi_sprite(&params);
        }
        break;
    }
}

extern struct
{
    s16 unk0;
    u8 filler2[2];
    u32 unk4;
    u8 filler8[1];
} lbl_8027CE24;

void lbl_80078B8C(s8 *, struct Sprite *);
void lbl_80078C2C(struct Sprite *);
void lbl_8007B788(s8 *, struct Sprite *);
void lbl_8007B928(s8 *, struct Sprite *);
void lbl_8007BCB4(struct Sprite *);

void show_stage_intro_text(void)
{
    struct Sprite *sprite;
    int r5;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 15;
        sprite->centerX = 320.0f;
        sprite->centerY = 240.0f;
        sprite->unk4C = 0.15f;
        if ((modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && (lbl_8027CE24.unk4 & 8))
         || (modeCtrl.levelSetFlags & 8))
        {
            sprite->unkC = 0xFF;
            sprite->unkD = 0xFF;
            sprite->unkE = 0;
            sprite->unk70 = 0x20;
            sprite->unk71 = 0x20;
            sprite->unk72 = 0x20;
        }
        else
        {
            sprite->unkC = 0xFF;
            sprite->unkD = 0xFF;
            sprite->unkE = 0;
        }
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.8f;
        sprite->unk44 = 0.8f;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = lbl_80078B8C;
        sprite->drawFunc = lbl_80078C2C;

        r5 = (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE) ? lbl_8027CE24.unk0 : infoWork.unk20;
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
            sprintf(sprite->text, "ROUND %d", r5);
        else if ((modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && (lbl_8027CE24.unk4 & 0x10))
         || (modeCtrl.levelSetFlags & 0x10))
            sprintf(sprite->text, "MASTER %d", r5);
        else if ((modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && (lbl_8027CE24.unk4 & 8))
         || (modeCtrl.levelSetFlags & 8))
            sprintf(sprite->text, "EXTRA %d", r5);
        else
            sprintf(sprite->text, "FLOOR %d", r5);
    }

    if ((infoWork.flags & 0x40) && modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = 14;
            sprite->centerX = 320.0f;
            sprite->centerY = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->unkC = 0xFF;
            sprite->unkD = 0x80;
            sprite->unkE = 0;
            sprite->unk40 = 0.5f;
            sprite->unk44 = 0.5f;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = lbl_8007B788;
            strcpy(sprite->text, "BONUS FLOOR");
        }
    }

    if ((infoWork.flags & 0x1000) && modeCtrl.gameType != GAMETYPE_MAIN_PRACTICE)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = 14;
            sprite->centerX = 320.0f;
            sprite->centerY = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->unk40 = 0.5f;
            sprite->unk44 = 0.5f;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = lbl_8007B928;
            sprite->drawFunc = lbl_8007BCB4;
            if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
                strcpy(sprite->text, "FINAL ROUND");
            else
                strcpy(sprite->text, "FINAL FLOOR");
        }
    }
}

void lbl_80078B8C(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->unk48 > 0)
        sprite->unk6C = 0.06666 * sprite->unk48;
    else
        sprite->unk6C = 1.0f;
    sprite->unk10++;
    if (lbl_801F3D88[0] & 0x100)
        sprite->unk10++;
    if (sprite->unk48 != 0)
    {
        sprite->unk48--;
        if (sprite->unk48 == 0)
            *arg0 = 0;
    }
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
