#include <math.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
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
