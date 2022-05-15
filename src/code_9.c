#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "info.h"
#include "input.h"
#define MATHUTIL_SIN_INT_PARAM
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"

u8 lbl_801C14F0[] =
{
    0xFF, 0x00, 0x00, 0x2C,
    0x65, 0xFF, 0xFB, 0xFF,
    0x2C, 0x2C, 0xFF, 0x57,
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
        sprite->x = 315.0f;
        sprite->y = lbl_801C14FC[0];
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->fontId = FONT_JAP_24x24_2P;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 0.005f;
        sprite->unk48 = 1;
        sprite->opacity = 0.5f;
        sprite->unkC = 0;
        sprite->unkD = 0;
        sprite->unkE = 0;
        sprite->unk40 = 0.0f;
        sprite->unk44 = 0.0f;
        sprite->counter = 1;
        sprite->drawFunc = pause_menu_sprite_draw;
        strcpy(sprite->text, "pause menu");
    }
}

void lbl_8007DE54();

void func_80075E1C(int unused, struct Sprite *b)
{
    struct Sprite *gameOver;

    b->y += 0.075 * (lbl_801C14FC[b->unk48] - b->y);
    if (b->counter > 0)
    {
        b->unk44 = b->unk40;
        b->counter--;
    }
    else
    {
        b->unk44 += 0.1 * (b->unk40 - b->unk44);
    }
    if (b->unk48 >= 2 && b->unk48 != 6)
    {
        if (b->opacity < 0.99)
            b->opacity += 0.01;
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
            gameOver->x = 320.0f;
            gameOver->y = 240.0f;
            gameOver->unkC = 0xFF;
            gameOver->unkD = 0;
            gameOver->unkE = 0x20;
            gameOver->fontId = FONT_ASC_72x64;
            gameOver->textAlign = ALIGN_CC;
            gameOver->counter = 60;
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
    params.x = sprite->x;
    params.y = sprite->y;
    params.z = sprite->unk4C + 0.001;
    params.zoomX = 1.0f;
    params.zoomY = 1.0f;
    params.alpha = 1.0f;
    params.color1 = RGBA(255, 255, 255, (int)(sprite->opacity * 255.0f));
    draw_naomi_sprite(&params);

    params.bmpId = func_80081CFC(0, 0, playerCharacterSelection[lbl_801EEC68.unk15]);
    params.x = sprite->x - 110.0f;
    params.y = sprite->y + sprite->unk44 + 12.0f;
    params.z = sprite->unk4C;
    params.zoomX = 0.5f;
    params.zoomY = 0.325f;
    params.alpha = 1.0f;
    params.color1 = RGBA(255, 255, 255, (int)(sprite->opacity * 255.0f));
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
        x = sprite->x - 48.0f;
        y = sprite->y + phi_f22;
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
    params.alpha = sprite->opacity;
    params.color1 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, (u8)(sprite->opacity * 255.0f));
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
        sprite->x = 0x3E5 - temp_r3;
        sprite->y = 446.0f;
        func_800702C8(sprite);
    }
    if (temp_r3 < 0x280)
    {
        sprite->x = temp_r3 + 0x165;
        sprite->y = 463.0f;
        func_800702C8(sprite);
    }
    sprite->drawFunc = lbl_80076710;
}

void lbl_800768A8(s8 *a, struct Sprite *sprite);

void g_logo_plus_sprite_something(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->tag = 3;
        sprite->x = 320.0f;
        sprite->y = 115.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 300.0f;
        sprite->bmpId = BMP_ADV_adv_logo_plus;
        strcpy(sprite->text, "logo plus");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 301.0f;
        sprite->bmpId = BMP_ADV_logo_sega512;
        sprite->counter = 0;
        sprite->mainFunc = lbl_800768A8;
        sprite->unk74 |= 0x40000;
        strcpy(sprite->text, "logo");
    }
}

void lbl_80076AC0(struct Sprite *);

void lbl_800768A8(s8 *a, struct Sprite *sprite)
{
    struct Sprite *logoPlus = find_sprite_with_tag(3);

    if (sprite->counter <= 0x189)
        sprite->x -= 0.0f;  // does nothing
    else if (sprite->counter <= 0x198)
        sprite->x -= 10.0f + (6.0f * mathutil_sin((sprite->counter - 0x189) * 0x444));
    else if (sprite->counter <= 0x1E0)
        sprite->x -= 16.0f;

    if (sprite->counter >= 0x17A && sprite->counter <= 0x198)
    {
        sprite->unk40 = 1.0 - (0.7 * mathutil_sin((sprite->counter - 0x17A) * 0x444));
        sprite->unk44 = 1.0 + (0.7 * mathutil_sin((sprite->counter - 0x17A) * 0x444));
        if (logoPlus != NULL)
            logoPlus->opacity = 0.0333 * (0x198 - sprite->counter);
    }

    if (sprite->counter == 0x1E0)
    {
        sprite->x = 320.0f;
        sprite->bmpId = BMP_ADV_logo_av256;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 1.0f;
        sprite->unk4C = 100.0f;
        if (logoPlus != NULL)
        {
            logoPlus->bmpId = BMP_ADV_logo_plus256x40;
            logoPlus->unk48 = 5;
            logoPlus->drawFunc = lbl_80076AC0;
            logoPlus->x = 194.0f;
            logoPlus->y = 74.0f;
        }
    }

    if (sprite->counter < 0x1E0)
        sprite->opacity = 1.0f;
    else if (sprite->counter <= 0x258)
        sprite->opacity = 0.0f;
    else if (sprite->counter <= 0x276)
    {
        sprite->opacity = 0.0333 * (sprite->counter - 0x258);
        if (logoPlus != NULL)
            logoPlus->opacity = sprite->opacity;
    }

    sprite->counter++;
}

void lbl_80076AC0(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    int r5 = sprite->unk48;

    params.bmpId = sprite->bmpId;
    params.x = sprite->x + (r5 % 2 == 1 ? 128 : -128);
    params.y = sprite->y + (sprite->unk48 == 0 ? 50 : 0);
    params.z = sprite->unk4C;
    params.u1 = 0.0f;
    params.v1 = 0.15625 * r5;
    params.u2 = 1.0f;
    params.v2 = 0.15625 + 0.15625 * r5;
    params.zoomX = sprite->unk40 * (params.u2 - params.u1);
    params.zoomY = 0.15625 * sprite->unk44;
    params.rotation = sprite->unk68;
    params.alpha = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
    params.color1 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, (u8)(sprite->opacity * 255.0f));
    params.color2 = 0;
    draw_naomi_sprite(&params);
}

void copyright_sprite_main(s8 *, struct Sprite *);

void show_adv_copyright_text(int a)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x25;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = 357.0f;
        sprite->y = 463.0f;
        sprite->textAlign = ALIGN_LB;
        sprite->unk4C = 0.03f;
        sprite->bmpId = BMP_COM_copyright_02;
        sprite->mainFunc = copyright_sprite_main;
        strcpy(sprite->text, "(C)");
        if (a == 1)
            sprite->drawFunc = lbl_80076710;

        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->tag = 38;
            sprite->x = 6.0f;
            sprite->fontId = FONT_ASC_8x16;
            sprite->textAlign = ALIGN_LB;
            sprite->mainFunc = copyright_sprite_main;
            strcpy(sprite->text, "AMUSEMENT VISION,LTD./SEGA,2001");
        }
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 39;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = 16.0f;
        sprite->y = 462.0f;
        sprite->unk4C = 0.03f;
        sprite->bmpId = BMP_COM_str_sega;
        sprite->textAlign = ALIGN_LB;
        sprite->mainFunc = copyright_sprite_main;
        strcpy(sprite->text, "SEGA AV");
    }
}

void copyright_sprite_main(s8 *unused, struct Sprite *sprite)
{
    if (sprite->unk48 == -1 && sprite->opacity > 0.0f)
        sprite->opacity -= 0.05;
}

struct Struct80292C00
{
    s32 unk0;
    s32 unk4;
};

struct Struct80292C00 lbl_80292C00[12];
FORCE_BSS_ORDER(lbl_80292C00)
extern struct Struct80292C00 lbl_80292C00_alias[];

struct Struct80292C60
{
    s32 unk0;
    s32 unk4;
    u32 unk8;
    u8 fillerC[0x30-0xC];
} lbl_80292C60;
FORCE_BSS_ORDER(lbl_80292C60)
extern struct Struct80292C60 lbl_80292C60_alias;

struct TitleLetterOffset
{
    float pos;
    float vel;
};

// y offsets applied to position of "SUPER" letters
struct TitleLetterOffset titleSuperOffsets[5];
FORCE_BSS_ORDER(titleSuperOffsets)

// x offsets applied to position of "MONKEY BALL" letters
struct TitleLetterOffset titleMonkeyBallOffsets[10];
FORCE_BSS_ORDER(titleMonkeyBallOffsets)

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

struct TitleLetter
{
    u32 bmpId;
    float x;
    float y;
};

// final positions for the title letters

struct TitleLetter titleLettersSuper[] =
{
    { BMP_ADV_adv_title_spr_s, 132,  46 },
    { BMP_ADV_adv_title_spr_u, 203,  22 },
    { BMP_ADV_adv_title_spr_p, 278,  10 },
    { BMP_ADV_adv_title_spr_e, 351,  22 },
    { BMP_ADV_adv_title_spr_r, 422,  46 },
};

struct TitleLetter titleLettersMonkeyBall[] =
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

void title_sprite_main(s8 *, struct Sprite *);
void title_sprite_draw(struct Sprite *);

extern float lbl_802F2010;
extern float lbl_802F2014;

void create_title_letter_sprites(int arg0)
{
    struct Sprite *sprite;
    int i;
    struct TitleLetterOffset *offset;
    s8 *r27_;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->unk4C = 0.095f;
        sprite->opacity = 0.0f;
        sprite->counter = arg0;
        sprite->unk48 = arg0;
        sprite->mainFunc = title_sprite_main;
        sprite->drawFunc = title_sprite_draw;
        strcpy(sprite->text, "title");

        offset = titleSuperOffsets;
        for (i = 0; i < 5; i++, offset++)
        {
            offset->pos = (arg0 == 1) ? 0.0 : -200.0 + 40.0 * ((rand() / 32767.0f) - 0.5);
            offset->vel = 0.0f;
        }

        offset = titleMonkeyBallOffsets;
        r27_ = lbl_80292D08;
        for (i = 0; i < 10; i++, offset++, r27_++)
        {
            offset->pos = (arg0 == 1) ? 0.0 : 640.0 + 20.0 * ((rand() / 32767.0f) - 0.5);
            offset->vel = (arg0 == 1) ? 0.0 : -10.0;
            *r27_ = 0;
        }
        lbl_802F2010 = 0.0f;
        lbl_802F2014 = 0.0f;
    }
}

void title_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int i;

    if (sprite->counter > 0)
        sprite->counter--;

    !sprite;  // needed to match

    sprite->opacity = 1.0 - (float)sprite->counter / (float)sprite->unk48;

    // adjust offsets of "MONKEY BALL" letters
    for (i = 0; i < 10; i++)
    {
        titleMonkeyBallOffsets[i].pos += titleMonkeyBallOffsets[i].vel;
        if (!lbl_80292D08[i] && titleMonkeyBallOffsets[i].pos <= 0.0f)
            lbl_80292D08[i] = TRUE;
        if (lbl_80292D08[i])
        {
            if (__abs(titleMonkeyBallOffsets[i].vel) <= 2.0 && __abs(titleMonkeyBallOffsets[i].pos) <= 2.0)
            {
                titleMonkeyBallOffsets[i].vel = 0.0f;
                titleMonkeyBallOffsets[i].pos = 0.0f;
            }
            else if (titleMonkeyBallOffsets[i].pos < 0.0f)
                titleMonkeyBallOffsets[i].vel = 4.0f;
            else
                titleMonkeyBallOffsets[i].vel = -1.0f;
        }
    }

    if (sprite->counter > 0.25 * (float)sprite->unk48)
        return;

    // adjust offsets of "SUPER" letters
    for (i = 0; i < 5; i++)
    {
        titleSuperOffsets[i].vel += 0.5;  // increase vel each frame to simulate gravity
        titleSuperOffsets[i].pos += titleSuperOffsets[i].vel;
        if (titleSuperOffsets[i].pos >= 0.0f)  // when letter has reached its final position
        {
            if (titleSuperOffsets[i].vel <= 0.5)
            {
                // settle down once velocity is low enough
                titleSuperOffsets[i].vel = 0.0f;
                titleSuperOffsets[i].pos = 0.0f;
            }
            else
            {
                // add a small bounce
                titleSuperOffsets[i].vel = 0.5 * -titleSuperOffsets[i].vel;
                titleSuperOffsets[i].pos = 0.0f;
            }
        }
    }

    if (sprite->counter > 0.0)
        return;
    if (titleMonkeyBallOffsets[0].vel != 0.0)
        return;

    lbl_802F2014 += 0.25 * (1.0 - lbl_802F2014);
    if (modeCtrl.levelSetFlags & 4)
        lbl_802F2010 += 0.25 * -lbl_802F2010;
    else
        lbl_802F2010 += 0.25 * (1.0 - lbl_802F2010);
}

extern u32 lbl_80118AC8[];

void title_sprite_draw(struct Sprite *sprite)
{
    int i;
    struct TitleLetter *letter;
    struct TitleLetterOffset *offset;
    struct NaomiSpriteParams params;

    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.zoomX = 1.0f;
    params.zoomY = 1.0f;
    params.alpha = 1.0f;
    params.rotation = 0;
    params.color1 = RGBA(255, 255, 255, (u8)(255.0f * sprite->opacity));
    params.color2 = 0;
    params.unk30 = -1;

    params.bmpId = BMP_ADV_adv_title_bg;
    params.x = 320.1f;
    params.y = 240.1f;
    params.z = 0.004 + sprite->unk4C;
    params.alpha = sprite->opacity;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
    draw_naomi_sprite(&params);

    // draw "SUPER" letters
    letter = titleLettersSuper;
    offset = titleSuperOffsets;
    for (i = 0; i < 5; i++, letter++, offset++)
    {
        params.bmpId = BMP_ADV_adv_title_spr_kage;
        params.x = letter->x - 8.0f;
        params.y = letter->y + offset->pos - 5.0f;
        params.z = 0.002 + sprite->unk4C;
        params.alpha = sprite->opacity;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 5;
        draw_naomi_sprite(&params);

        params.bmpId = letter->bmpId;
        params.x = letter->x;
        params.y = letter->y + offset->pos;
        params.z = sprite->unk4C;
        params.alpha = 1.0f;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 5;
        draw_naomi_sprite(&params);

        params.bmpId = BMP_ADV_adv_title_spr_gawa;
        params.z = sprite->unk4C - 0.002;
        params.alpha = 1.0 - __fabs(0.2 * mathutil_sin(512.0f * offset->pos));
        draw_naomi_sprite(&params);
    }

    // draw "MONKEY BALL" letters
    letter = titleLettersMonkeyBall;
    offset = titleMonkeyBallOffsets;
    for (i = 0; i < 10; i++, letter++, offset++)
    {
        params.bmpId = BMP_ADV_adv_title_mnk_kage;
        params.x = 56.0f + (letter->x + offset->pos - 12.0f);
        params.y = 56.0f + (letter->y - 5.0f);
        params.z = 0.002 + sprite->unk4C;
        params.alpha = sprite->opacity;
        params.rotation = 0;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
        draw_naomi_sprite(&params);

        params.bmpId = letter->bmpId;
        params.x = 44.0f + (letter->x + offset->pos);
        params.y = 44.0f + letter->y;
        params.z = sprite->unk4C;
        params.alpha = 1.0f;
        params.rotation = -256.0f * offset->pos;
        params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0x200000 | 0xA;
        draw_naomi_sprite(&params);

        params.bmpId = BMP_ADV_adv_title_mnk_gawa;
        params.z = sprite->unk4C - 0.002;
        params.alpha = 1.0 - __fabs(0.2 * mathutil_sin(512.0f * offset->pos));
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

void gamestart_sprite_main(s8 *, struct Sprite *);
void options_sprite_main(s8 *, struct Sprite *);

void create_title_menu_items(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 12;
        sprite->unk4C = 0.049f;
        sprite->fontId = FONT_JAP_24x24_2P;
        sprite->x = 320.0f;
        sprite->y = 374.0f;
        sprite->opacity = 0.0f;
        sprite->counter = 30;
        sprite->textAlign = ALIGN_CC;
        sprite->unk74 |= 0x200000;
        sprite->mainFunc = gamestart_sprite_main;
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 13;
        sprite->unk4C = 0.049f;
        sprite->fontId = FONT_JAP_24x24_2P;
        sprite->x = 320.0f;
        sprite->y = 398.0f;
        sprite->opacity = 0.0f;
        sprite->counter = 30;
        sprite->textAlign = ALIGN_CC;
        sprite->unk74 |= 0x200000;
        sprite->mainFunc = options_sprite_main;
    }
}

void gamestart_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if ((modeCtrl.levelSetFlags & 4) && textBoxes[0].unk0 == 10)
    {
        sprite->opacity += 0.1 * (1.0 - sprite->opacity);
        if (sprite->counter > 0)
            sprite->counter--;
    }
    else
        sprite->opacity += 0.1 * -sprite->opacity;

    if (sprite->counter <= 15)
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
            sprite->opacity *= 0.5;
            sprite->unk40 = 0.8f;
            sprite->unk44 = 0.8f;
            strcpy(sprite->text, "a/Game Start");
        }
    }
}

void options_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if ((modeCtrl.levelSetFlags & 4) && textBoxes[0].unk0 == 10)
    {
        sprite->opacity += 0.1 * (1.0 - sprite->opacity);
        if (sprite->counter > 0)
            sprite->counter--;
    }
    else
        sprite->opacity += 0.1 * -sprite->opacity;

    if (sprite->counter <= 15)
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
            sprite->opacity *= 0.5;
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
        temp_r3->x = 142.0f;
        temp_r3->y = 60.0f;
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

//const float lbl_802F4D9C = 0.10000000149011612f;
float force_lbl_802F4D9C() { return 0.1f; }

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
        sprite->x = 320.0f;
        sprite->y = 85.0f;
        sprite->fontId = FONT_NUM_24x37;
        sprite->textAlign = ALIGN_CB;
        sprite->unk4C = 0.19f;
        sprite->mainFunc = lbl_8007A9B4;
        sprintf(sprite->text, lbl_802F102C);
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = -4.0f;
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
        sprite->x = 428.0f;
        sprite->y = 22.0f;
        sprite->bmpId = BMP_COM_banana_01;
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.2f;
        sprite->unk44 = 0.2f;
        sprintf(sprite->text, "banana.pic");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 536.0f;
        sprite->y = 24.0f;
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
        sprite->x = 518.0f;
        sprite->y = 47.0f;
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
        sprite->tag = 18;
        sprite->x = 518.0f;
        sprite->y = 48.0f;
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

    lbl_80292C00_alias[0].unk4 = 0;
    lbl_80292C00_alias[1].unk4 = 0;
    lbl_80292C00_alias[2].unk4 = 0;
    lbl_80292C00_alias[0].unk0 = ball->bananas % 10;
    lbl_80292C00_alias[1].unk0 = ball->bananas / 10;
    lbl_80292C00_alias[2].unk0 = ball->bananas / 100;

    if (infoWork.flags & 0x40)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 320.0f;
            sprite->y = 380.0f;
            sprite->fontId = FONT_ASC_32x32;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = 0;
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
        sprite->x = textBoxes[arg0 + 1].unkC;
        sprite->y = textBoxes[arg0 + 1].unkE;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = (f32) (0.05 + (0.01 * (f64) (arg0 + 1)));
        sprite->bmpId = (arg0 == 2) ? BMP_COM_banana_01 : BMP_COM_banana_10;
        sprite->opacity = 0.0f;
        sprite->unk40 = (arg0 == 2) ? 0.7 : 0.8;
        sprite->unk44 = (arg0 == 2) ? 0.5 : 0.6;
        sprite->counter = 60;
        sprite->unk48 = arg0;
        sprite->mainFunc = lbl_800782CC;
        strcpy(sprite->text, "banana");
    }
}

void lbl_800782CC(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->counter == -1)
    {
        *arg0 = 0;
        return;
    }
    if (sprite->counter > 0)
        sprite->counter--;
    sprite->x = textBoxes[sprite->unk48 + 1].unkC;
    sprite->y = textBoxes[sprite->unk48 + 1].unkE - ((sprite->unk48 == 2) ? 0x36 : 0x42);
    if (sprite->counter < 15)
        sprite->opacity = 1.0f - sprite->counter / 15.0f;
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
        sprite->counter = 0;
        sprite->unk74 |= 0x40000;
        sprite->mainFunc = lbl_80078450;
        sprite->drawFunc = lbl_80078460;
        strcpy(sprite->text, "eieipu");
    }
}

void lbl_80078450(s8 *a, struct Sprite *sprite)
{
    sprite->counter++;
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
    params.color1 = RGBA(255, 255, 255, (u8)(255.0f * sprite->opacity));
    params.color2 = 0;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;

    temp_f29 = 0.5 * mathutil_sin((sprite->counter << 9) + 0x4000);

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
            params.x += (i % 2 == 0) ? -sprite->counter : sprite->counter;
            params.y += (i % 2 == 0) ? sprite->counter * 2 : -sprite->counter * 2;
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
            params.x = lbl_801C190C[i].unk0 + ((i / 5 == 1) ? -sprite->counter : sprite->counter);
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
    s16 unk2;
    u32 unk4;
    u8 filler8[1];
} lbl_8027CE24;

void floor_intro_sprite_main(s8 *, struct Sprite *);
void floor_intro_sprite_draw(struct Sprite *);
void bonus_floor_sprite_main(s8 *, struct Sprite *);
void final_floor_sprite_main(s8 *, struct Sprite *);
void final_floor_sprite_draw(struct Sprite *);

void show_stage_intro_text(void)
{
    struct Sprite *sprite;
    int floorNum;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 15;
        sprite->x = 320.0f;
        sprite->y = 240.0f;
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
        sprite->mainFunc = floor_intro_sprite_main;
        sprite->drawFunc = floor_intro_sprite_draw;

        floorNum = (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE) ? lbl_8027CE24.unk0 : infoWork.unk20;
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
            sprintf(sprite->text, "ROUND %d", floorNum);
        else if ((modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && (lbl_8027CE24.unk4 & 0x10))
         || (modeCtrl.levelSetFlags & 0x10))
            sprintf(sprite->text, "MASTER %d", floorNum);
        else if ((modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && (lbl_8027CE24.unk4 & 8))
         || (modeCtrl.levelSetFlags & 8))
            sprintf(sprite->text, "EXTRA %d", floorNum);
        else
            sprintf(sprite->text, "FLOOR %d", floorNum);
    }

    if ((infoWork.flags & 0x40) && modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = 14;
            sprite->x = 320.0f;
            sprite->y = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->unkC = 0xFF;
            sprite->unkD = 0x80;
            sprite->unkE = 0;
            sprite->unk40 = 0.5f;
            sprite->unk44 = 0.5f;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = bonus_floor_sprite_main;
            strcpy(sprite->text, "BONUS FLOOR");
        }
    }

    if ((infoWork.flags & 0x1000) && modeCtrl.gameType != GAMETYPE_MAIN_PRACTICE)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = 14;
            sprite->x = 320.0f;
            sprite->y = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->unk40 = 0.5f;
            sprite->unk44 = 0.5f;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = final_floor_sprite_main;
            sprite->drawFunc = final_floor_sprite_draw;
            if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
                strcpy(sprite->text, "FINAL ROUND");
            else
                strcpy(sprite->text, "FINAL FLOOR");
        }
    }
}

void floor_intro_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->unk48 > 0)
        sprite->opacity = 0.06666 * sprite->unk48;
    else
        sprite->opacity = 1.0f;
    sprite->counter++;
    if (lbl_801F3D88[0] & 0x100)
        sprite->counter++;
    if (sprite->unk48 != 0)
    {
        sprite->unk48--;
        if (sprite->unk48 == 0)
            *arg0 = 0;
    }
}

void floor_intro_sprite_draw(struct Sprite *sprite)
{
    int centerX;
    int i;
    int spacePos = 0;
    char text[12];

    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B50(sprite->unk74);
    func_80071AE4(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
    g_set_some_sprite_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));
    centerX = (strlen(sprite->text) * 57) >> 1;
    strcpy(text, sprite->text);

    for (i = 0; i < strlen(sprite->text); i++)
    {
        if (text[i] == ' ')
            spacePos = i;
    }

    for (i = 0; i < strlen(sprite->text); i++)
    {
        int phi_r4;
        int phi_r5;

        if (i == spacePos)
            continue;
        else if (i > spacePos)
        {
            if (sprite->counter < 30 + spacePos * 16)
                continue;
        }
        else if (i > 0)
        {
            if (sprite->counter < 30 + (i - 1) * 16)
                continue;
        }

        phi_r4 = 0;
        phi_r5 = 0;

        if (i == 0 && sprite->counter < 30)
            phi_r4 = (30 - sprite->counter) * -5;
        else if (i > 0 && i < spacePos && sprite->counter < 30 + i * 16)
            phi_r4 = -3.6 * (30 + i * 16 - sprite->counter);
        else if (i > spacePos)
            phi_r4 = -28;

        if (sprite->unk48 > 0)
        {
            if (i < spacePos)
                phi_r5 = (15 - sprite->unk48) * ((i & 1) ? 8 : -8);
            else
                phi_r5 = (15 - sprite->unk48) * ((i & 1) ? -8 : 8);
        }

        g_set_text_pos(sprite->x - centerX + 14.4 + 57.6 * i + phi_r4, sprite->y - 25.6 + phi_r5);
        func_80071B2C(sprite->unk40 - 0.01, sprite->unk44 + (0.01 * __fabs((float)phi_r5)));
        if (i > spacePos)
            func_80071B40(MIN(0.0625 * (sprite->counter - 30 - spacePos * 16), sprite->opacity));
        else if (i > 0)
            func_80071B40(MIN(0.0625 * (sprite->counter - 30 - ((i - 1) * 16)), sprite->opacity));
        else if (i == 0 && sprite->unk48 > 0)
            func_80071B40(sprite->opacity);
        func_80071B78(text[i]);
    }
    func_80071A8C();
}

void lbl_80079008(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->counter > 90)
    {
        sprite->x += sprite->unk48;
        sprite->unk48++;
    }
    else if (sprite->counter <= 30)
    {
        sprite->x += sprite->unk48;
        sprite->unk48--;
    }
    sprite->counter--;
    if (sprite->counter <= 0)
        *arg0 = 0;
}

void lbl_8007926C(s8 *, struct Sprite *);

char lbl_802F1050[4] = "%dP";

void show_ready_text(int arg0)
{
    struct Sprite *sprite;

    if (modeCtrl.gameType == 0 && modeCtrl.playerCount > 1)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            int phi_r0 = (modeCtrl.playerCount > 1) ? currentBallStructPtr->unk2E : 3;

            sprite->x = 785.0f;
            sprite->y = 310.0f;
            sprite->fontId = 9;
            sprite->textAlign = 4;
            sprite->unkC = lbl_801C14F0[phi_r0 * 3 + 0];
            sprite->unkD = lbl_801C14F0[phi_r0 * 3 + 1];
            sprite->unkE = lbl_801C14F0[phi_r0 * 3 + 2];
            sprite->unk48 = -30;
            sprite->counter = 0x78;
            sprite->mainFunc = lbl_80079008;
            sprintf(sprite->text, lbl_802F1050, currentBallStructPtr->unk2E + 1);
        }
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unk4C = (modeCtrl.unk30 == 1) ? 0.1 : 0.05;
        sprite->fontId = 9;
        sprite->textAlign = 4;
        sprite->unkC = 0xFF;
        sprite->unkD = 0xC8;
        sprite->unkE = 0;
        sprite->counter = arg0;
        sprite->unk48 = arg0;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = lbl_8007926C;
        strcpy(sprite->text, "READY");
    }
    g_play_sound(4);
}

void lbl_8007926C(s8 *arg0, struct Sprite *sprite)
{
    int temp_r3 = sprite->unk48 - sprite->counter;

    if (temp_r3 < 30)
    {
        sprite->opacity = 0.03333 * temp_r3;
        sprite->unk40 = 1.0f;
        sprite->unk44 = mathutil_sin(temp_r3 * 0x222);
    }
    else if (temp_r3 < 60)
    {
        sprite->opacity = 1.0f;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 1.0 - mathutil_sin((temp_r3 - 30) * 0x444) * 0.2;
    }
    else if (sprite->counter <= 15)
    {
        sprite->opacity = 0.06666 * sprite->counter;
        sprite->unk40 = 0.06666 * sprite->counter;
        sprite->unk44 = 1.0f;
    }
    else
    {
        sprite->opacity = 1.0f;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 1.0f;
    }
    if (--sprite->counter <= 0)
    {
        g_play_sound(5);
        *arg0 = 0;
    }
}

void lbl_80067C20(struct Sprite *);

extern s32 lbl_802F1CAC;

void lbl_8007A774(s8 *, struct Sprite *);
void lbl_8007A7B8(s8 *, struct Sprite *);
void lbl_8007A7E4(s8 *, struct Sprite *);
void lbl_8007A8AC(s8 *, struct Sprite *);
void lbl_8007B134(struct Sprite *);
void lbl_8007B34C(s8 *, struct Sprite *);
void lbl_8007B4E8(s8 *, struct Sprite *);

char lbl_802F105C[3] = "%d";
char lbl_802F1060[7] = "course";
char lbl_802F1068[6] = "SCORE";
char lbl_802F1070[6] = "NULL\n";
char lbl_802F1078[6] = "score";
char lbl_802F1080[3] = "00";
char lbl_802F1084[4] = "mph";

void g_init_main_normal_hud(void)
{
    struct Sprite *sprite;
    struct Ball *ball;
    u32 flags;
    int floorNum;
    u8 dummy[16];

    ball = currentBallStructPtr;
    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
        flags = lbl_8027CE24.unk4;
    else
        flags = modeCtrl.levelSetFlags;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = (modeCtrl.levelSetFlags & 1) ? 72 : 32;
        sprite->y = (modeCtrl.levelSetFlags & 1) ? 436 : 458;
        sprite->fontId = FONT_ASC_20x20;
        if (flags & 0x10)
            sprite->x = 32.0f;
        if (flags & 8)
        {
            sprite->unkC = 0xFF;
            sprite->unkD = 0xFF;
            sprite->unkE = 0;
            sprite->unk70 = 0x40;
            sprite->unk71 = 0x40;
            sprite->unk72 = 0x40;
        }
        sprite->textAlign = ALIGN_LB;
        sprite->mainFunc = lbl_8007A774;

        floorNum = (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE) ? lbl_8027CE24.unk0 : infoWork.unk20;
        if (flags & 0x10)
            sprintf(sprite->text, "MASTER %d", floorNum);
        else if (flags & 8)
            sprintf(sprite->text, "EXTRA %d", floorNum);
        else
            sprintf(sprite->text, "FLOOR %d", floorNum);
        if (gamePauseStatus & 4)
        {
            sprite = create_linked_sprite(sprite);
            if (sprite != NULL)
            {
                sprite->x = 20.0f;
                sprite->y = 2.0f;
                sprite->fontId = FONT_ASC_8x16;
                sprite->mainFunc = lbl_8007A7B8;
                sprintf(sprite->text, "[Lib No.%d]", currStageId);
            }
        }
    }

    if ((modeCtrl.levelSetFlags & 1) && !(flags & 0x10))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 48.0f;
            sprite->y = 443.0f;
            sprite->fontId = FONT_ICON_LV;
            sprite->textAlign = ALIGN_CC;
            sprite->unk40 = 0.5f;
            sprite->unk44 = 0.5f;
            if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
                sprintf(sprite->text, lbl_802F105C, lbl_8027CE24.unk2 + 4);
            else
                sprintf(sprite->text, lbl_802F105C, modeCtrl.levelSet + 4);
        }
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 72.0f;
            sprite->y = 436.0f;
            sprite->fontId = FONT_ASCII;
            sprite->textAlign = ALIGN_LB;
            sprite->unk40 = 1.5f;
            sprite->unk44 = 1.5f;
            sprite->mainFunc = lbl_8007A7B8;
            sprite->drawFunc = lbl_80067C20;
            sprintf(sprite->text, lbl_802F1060);
        }
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 52.0f;
        sprite->y = 86.0f;
        sprite->fontId = FONT_ASCII;
        sprite->textAlign = ALIGN_PIC;
        sprite->unk4C = 0.1f;
        sprite->drawFunc = lbl_80080940;
        sprintf(sprite->text, lbl_802F1024);
    }

    lbl_80292D18.unk4 = 0;
    lbl_80292D18.unk0 = 0;
    lbl_80292D18.unk8 = 0;
    lbl_80292D18.unk14 = 0x33;
    func_8000D5B8();
    func_8008083C(320.0f, 68.0f);

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 85.0f;
        sprite->fontId = FONT_NUM_24x37;
        sprite->textAlign = ALIGN_CB;
        sprite->unk4C = 0.19f;
        sprite->mainFunc = lbl_8007A7E4;
        sprintf(sprite->text, lbl_802F102C);
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = -4.0f;
            sprite->fontId = FONT_NUM_12x19;
            sprite->textAlign = ALIGN_CB;
            sprite->unk4C = 0.19f;
            sprite->mainFunc = lbl_8007A8AC;
            sprintf(sprite->text, lbl_802F1030);
        }
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = 428.0f;
        sprite->y = 22.0f;
        sprite->bmpId = BMP_COM_banana_01;
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.2f;
        sprite->unk44 = 0.2f;
        sprintf(sprite->text, "banana.pic");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 536.0f;
        sprite->y = 24.0f;
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
        sprite->x = 518.0f;
        sprite->y = 47.0f;
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
        sprite->tag = 18;
        sprite->x = 518.0f;
        sprite->y = 48.0f;
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

    lbl_80292C00[0].unk4 = 0;
    lbl_80292C00[1].unk4 = 0;
    lbl_80292C00[2].unk4 = 0;
    lbl_80292C00[0].unk0 = ball->bananas % 10;
    lbl_80292C00[1].unk0 = ball->bananas / 10;
    lbl_80292C00[2].unk0 = ball->bananas / 100;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 108.0f;
        sprite->y = 24.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CC;
        sprintf(sprite->text, lbl_802F1068);
    }
    else
        printf(lbl_802F1070);

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 196.0f;
        sprite->y = 48.0f;
        sprite->fontId = FONT_NUM_22x22;
        sprite->textAlign = ALIGN_RC;
        sprite->mainFunc = lbl_8007B34C;
        sprintf(sprite->text, lbl_802F1078);
    }
    else
        printf(lbl_802F1070);

    lbl_80292C60.unk0 = ball->unk7C;
    lbl_80292C60.unk4 = 0;
    lbl_80292C60.unk8 = 0;

    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && lbl_802F1CAC > 0)
        func_8007FD74(0);

    if (modeCtrl.playerCount > 1)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->type = SPRITE_TYPE_BITMAP;
            sprite->x = 48.0f;
            sprite->y = 412.0f;
            sprite->unk40 = 2.0f;
            sprite->unk44 = 2.0f;
            sprite->textAlign = ALIGN_CC;
            sprite->unk48 = modeCtrl.currPlayer;
            sprite->drawFunc = lbl_8007B134;
            sprintf(sprite->text, lbl_802F1050, modeCtrl.currPlayer + 1);
        }
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = (modeCtrl.playerCount > 1) ? 74 : 32;
        sprite->y = (modeCtrl.levelSetFlags & 1) ? 420 : 428;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_LB;
        sprite->unk4C = 0.2f;
        sprite->mainFunc = lbl_8007B4E8;
        strcpy(sprite->text, lbl_802F1080);
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = 4.0f;
            sprite->type = SPRITE_TYPE_BITMAP;
            sprite->textAlign = ALIGN_CT;
            sprite->unk4C = 0.2f;
            sprite->bmpId = BMP_COM_game_icon_mph;
            strcpy(sprite->text, lbl_802F1084);
        }
    }
    if (infoWork.flags & 0x40)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 320.0f;
            sprite->y = 380.0f;
            sprite->fontId = FONT_ASC_32x32;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = 0;
            sprite->mainFunc = lbl_8007B608;
            strcpy(sprite->text, "%2d BANANAS LEFT");
        }
    }
    if ((find_sprite_with_tag(0xE) == NULL) && ((infoWork.flags & 0x1000) != 0) && (modeCtrl.gameType != 2))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = 14;
            sprite->x = 320.0f;
            sprite->y = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->unk40 = 0.5f;
            sprite->unk44 = 0.5f;
            sprite->counter = 150;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = final_floor_sprite_main;
            sprite->drawFunc = final_floor_sprite_draw;
            strcpy(sprite->text, "FINAL FLOOR");
        }
    }
}

void lbl_8007ADF4(struct Sprite *);
void lbl_8007B490(s8 *, struct Sprite *);
void lbl_8007B570(s8 *, struct Sprite *);

void func_80079D2C(s32 arg0)
{
    struct Sprite *sprite;
    struct Ball *ball = &ballInfo[arg0];
    struct Viewport vp = cameraInfo[arg0].sub28.vp;
    u8 dummy[12];
    float x1 = 640.0f * vp.left;
    float y1 = 480.0f * vp.top;
    float x2 = x1 + (640.0f * vp.width);
    float y2 = y1 + 480.0f * vp.height;

    lbl_80292D18.unk4 = 0;
    lbl_80292D18.unk0 = 0;
    lbl_80292D18.unk8 = 0;
    lbl_80292D18.unk14 = 0x33;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = x1 + 0.5f * (x2 - x1) - 51.0f;
        if (x1 < 320.0f)
            sprite->x = (x1 + 120.0f) - 51.0f;
        else
            sprite->x = (x2 - 85.0f) - 51.0f;
        sprite->y = y1 + 22.0f;
        sprite->bmpId = BMP_COM_banana_01;
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.2f;
        sprite->unk44 = 0.2f;
        sprintf(sprite->text, "banana.pic");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 18;
        sprite->x = x1 + 0.5f * (x2 - x1) + 41.0f;
        if (x1 < 320.0f)
            sprite->x = (x1 + 120.0f) + 41.0f;
        else
            sprite->x = (x2 - 85.0f) + 41.0f;
        sprite->y = y1 + 24.0f;
        sprite->fontId = FONT_ASC_18x16;
        sprite->textAlign = ALIGN_CC;
        sprite->drawFunc = lbl_8007ADF4;
        sprite->unkC = 0xAA;
        sprite->unkD = 0xA8;
        sprite->unkE = 0;
        sprite->unk70 = 0x38;
        sprite->unk71 = 0x38;
        sprite->unk72 = 0;
        sprite->unk48 = arg0;
        sprintf(sprite->text, lbl_802F102C);
    }

    lbl_80292C00_alias[arg0 * 3 + 0].unk4 = 0;
    lbl_80292C00_alias[arg0 * 3 + 1].unk4 = 0;
    lbl_80292C00_alias[arg0 * 3 + 2].unk4 = 0;
    lbl_80292C00_alias[arg0 * 3 + 0].unk0 = ball->bananas % 10;
    lbl_80292C00_alias[arg0 * 3 + 1].unk0 = (ball->bananas / 10) % 10;
    lbl_80292C00_alias[arg0 * 3 + 2].unk0 = (ball->bananas / 100) % 10;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        if (x1 < 320.0f)
            sprite->x = x1 + 28.0f;
        else
            sprite->x = x2 - 28.0f;
        sprite->y = y1 + 22.0f;
        sprite->bmpId = func_80081CFC(lbl_80292D18.unk0, lbl_80292D18.unk8, playerCharacterSelection[arg0]);
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.375f;
        sprite->unk44 = 0.24374999f;
        sprite->unk48 = arg0;
        sprite->mainFunc = lbl_8007B490;
        sprintf(sprite->text, "saru mark.pic");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = 1;
        if (x1 < 320.0f)
            sprite->x = x1 + 28.0f;
        else
            sprite->x = x2 - 28.0f;
        sprite->y = y1 + 48.0f;
        sprite->unk40 = 2.0f;
        sprite->unk44 = 2.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->unk48 = arg0;
        sprite->drawFunc = lbl_8007B134;
        sprintf(sprite->text, lbl_802F1050, arg0 + 1);
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        if (x1 < 320.0f)
        {
            sprite->x = x1 + 64.0f;
            sprite->textAlign = ALIGN_RB;
        }
        else
        {
            sprite->x = (x2 - 32.0f) - 24.0f;
            sprite->textAlign = ALIGN_RB;
        }
        sprite->y = y2 - 16.0f;
        sprite->fontId = FONT_ASC_18x16;
        sprite->unk48 = arg0;
        sprite->unk4C = 0.2f;
        sprite->mainFunc = lbl_8007B570;
        strcpy(sprite->text, lbl_802F1080);
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = 4.0f;
            sprite->y = -3.0f;
            sprite->type = SPRITE_TYPE_BITMAP;
            sprite->textAlign = ALIGN_CT;
            sprite->unk4C = 0.2f;
            sprite->bmpId = 0x58;
            strcpy(sprite->text, lbl_802F1084);
        }
    }
}

char *lbl_801C1A0C[] =
{
    "FINAL",
    "2ND",
    "1ST",
};

char lbl_801C1A18[] = "separate";

void lbl_8007A50C(s8 *, struct Sprite *);
void lbl_8007A5C0(struct Sprite *);

void g_init_main_competition_hud(void)
{
    struct Sprite *sprite;
    int i;
    s8 *phi_r28;

    if (lbl_802F1FB0 != infoWork.unk20)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprintf(sprite->text, "ROUND %d", infoWork.unk20);
            sprite->x = -20.0f * strlen(sprite->text);
            sprite->y = 250.0f;
            sprite->fontId = FONT_ASC_20x20;
            sprite->textAlign = ALIGN_LB;
            sprite->mainFunc = lbl_8007A50C;
            if (gamePauseStatus & 4)
            {
                sprite = create_linked_sprite(sprite);
                if (sprite != NULL)
                {
                    sprite->x = 20.0f;
                    sprite->y = 2.0f;
                    sprite->fontId = FONT_ASC_8x16;
                    sprite->mainFunc = lbl_8007A7B8;
                    sprintf(sprite->text, "[Lib No.%d]", currStageId);
                }
            }
        }
    }

    func_8000D5B8();
    func_8008083C(320.0f, 240.0f);

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 257.0f;
        sprite->fontId = FONT_NUM_24x37;
        sprite->textAlign = ALIGN_CB;
        sprite->unk4C = 0.19f;
        sprite->mainFunc = lbl_8007A7E4;
        sprintf(sprite->text, lbl_802F102C);
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = -4.0f;
            sprite->fontId = FONT_NUM_12x19;
            sprite->textAlign = ALIGN_CB;
            sprite->unk4C = 0.19f;
            sprite->mainFunc = lbl_8007A8AC;
            sprintf(sprite->text, lbl_802F1030);
        }
    }

    if (find_sprite_with_tag(14) == NULL && (infoWork.flags & 0x1000))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = 14;
            sprite->x = 320.0f;
            sprite->y = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->unk40 = 0.5f;
            sprite->unk44 = 0.5f;
            sprite->counter = 150;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = final_floor_sprite_main;
            sprite->drawFunc = final_floor_sprite_draw;
            strcpy(sprite->text, "FINAL ROUND");
        }
    }

    phi_r28 = spritePoolInfo.unkC;
    for (i = 0; i < spritePoolInfo.unk8; i++, phi_r28++)
    {
        if (*phi_r28 != 0)
            func_80079D2C(i);
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->bmpId = BMP_COM_frame;
        sprite->unk4C = 400.0f;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 80.0f;
        sprite->drawFunc = lbl_8007A5C0;
        strcpy(sprite->text, lbl_801C1A18);
    }
}

float force_lbl_802F4EA0() { return 10.666667f; }

void lbl_8007A50C(s8 *arg0, struct Sprite *sprite)
{
    if (gameSubmode == 0x33)
    {
        if (sprite->x < 54.0f)
        {
            sprite->x += 10.666667f;
            if (sprite->x > 54.0f)
                sprite->x = 54.0f;
        }
    }
    else
    {
        float temp_f2_2 = -20.0f * strlen(sprite->text);

        if (sprite->x > temp_f2_2)
        {
            sprite->x -= 10.666667f;
            if (sprite->x < temp_f2_2)
                sprite->x = temp_f2_2;
        }
    }
}

void lbl_8007A5C0(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    u8 dummy[4];

    params.bmpId = sprite->bmpId;
    params.x = 320.0f;
    params.y = 240.0f;
    params.z = sprite->unk4C;
    params.zoomX = sprite->unk40;
    params.zoomY = sprite->unk44;
    params.u1 = sprite->unk7C;
    params.v1 = sprite->unk80;
    params.u2 = sprite->unk84;
    params.v2 = sprite->unk88;
    params.rotation = 0;
    params.alpha = 1.0f;
    params.unk30 = -1;
    params.flags = 0xA;
    params.color1 = RGBA(255, 255, 255, 255);
    params.color2 = 0;

    switch (modeCtrl.playerCount)
    {
    case 2:
        params.rotation = 0xC000;
        draw_naomi_sprite(&params);
        break;
    case 3:
        switch (modeCtrl.splitscreenMode)
        {
        default:
        case SPLITSCREEN_1P_WIDE:
        case SPLITSCREEN_2P_WIDE:
            params.rotation = 0xC000;
            draw_naomi_sprite(&params);
            params.y += 320.0f;
            params.rotation = 0;
            draw_naomi_sprite(&params);
            break;
        case SPLITSCREEN_3P_WIDE:
            params.rotation = 0xC000;
            draw_naomi_sprite(&params);
            params.y -= 320.0f;
            params.rotation = 0;
            draw_naomi_sprite(&params);
            break;
        case SPLITSCREEN_4_SPLIT:
            params.rotation = 0xC000;
            draw_naomi_sprite(&params);
            params.rotation = 0;
            draw_naomi_sprite(&params);
            break;
        }
        break;
    case 4:
        params.rotation = 0xC000;
        draw_naomi_sprite(&params);
        params.rotation = 0;
        draw_naomi_sprite(&params);
        break;
    }
}

void lbl_8007A774(s8 *arg0, struct Sprite *sprite)
{
    if (modeCtrl.levelSetFlags & 1)
    {
        if (gamePauseStatus & 4)
            sprite->y = 436.0f;
        else
            sprite->y = 454.0f;
    }
    else
        sprite->y = 458.0f;
}

void lbl_8007A7B8(s8 *arg0, struct Sprite *sprite)
{
    if (gamePauseStatus & 4)
        sprite->unk78 &= ~1;
    else
        sprite->unk78 |= 1;
}

char lbl_802F1098[5] = "%03d";

void lbl_8007A7E4(s8 *arg0, struct Sprite *sprite)
{
    sprintf(sprite->text, lbl_802F1098, infoWork.timerCurr / 60);
    if (infoWork.timerCurr <= 0)
    {
        sprite->unk40 *= 1.01f;
        sprite->unk44 *= 1.01f;
        sprite->opacity *= 0.88f;
        if (sprite->opacity < 0.05f)
            *arg0 = 0;
    }
}

char lbl_802F10A0[6] = ":%02d";

void lbl_8007A8AC(s8 *arg0, struct Sprite *sprite)
{
    int val = 100.0 * ((float)(infoWork.timerCurr % 60) / 60.0);

    sprintf(sprite->text, lbl_802F10A0, val);
    if (infoWork.timerCurr <= 0)
    {
        sprite->unk40 *= 1.01f;
        sprite->unk44 *= 1.01f;
        sprite->opacity *= 0.88f;
        if (sprite->opacity < 0.05f)
            *arg0 = 0;
    }
}

void lbl_8007A9B4(s8 *arg0, struct Sprite *sprite)
{
    int temp_r5 = (int)func_80049E7C(lbl_80250A68.unk0[lbl_80250A68.unk14], lbl_80250A68.unk10) + 1;
    sprintf(sprite->text, lbl_802F1098, temp_r5 / 60);
}

void lbl_8007AA38(s8 *arg0, struct Sprite *sprite)
{
    int temp_r5 = (int)func_80049E7C(lbl_80250A68.unk0[lbl_80250A68.unk14], lbl_80250A68.unk10) + 1;
    int val = 100.0 * ((float)(temp_r5 % 60) / 60.0);
    sprintf(sprite->text, lbl_802F10A0, val);
}

const float lbl_80118870[] =
{
    1.0,
    1.1,
    1.2,
    1.3,
    1.4,
    1.5,
    1.5,
    1.4,
    1.3,
    1.2,
    1.1,
    1.0,
    0.9,
    0.8,
    0.7,
    0.8,
    0.9,
    1.0,
    1.1,
    1.2,
    1.3,
    1.4,
    1.5,
    1.5,
    1.4,
    1.3,
    1.2,
    1.1,
    1.0,
    1.0,
};

void lbl_8007AAFC(struct Sprite *sprite)
{
    struct Ball *ball;
    s32 phi_r3;
    float temp_f28;
    float temp_f4;
    int phi_r27;
    int i;
    int x, y;
    int temp_r23;
    struct Struct80292C00 *r22;

    ball = currentBallStructPtr;
    func_80071A8C();
    g_set_font(sprite->fontId);
    g_set_text_pos(sprite->x - 70.0f, sprite->y - 10.0f);
    func_80071AE4(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
    g_set_some_sprite_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));
    g_draw_text("    100");

    r22 = lbl_80292C00_alias;
    for (i = 0; i < 3; i++, r22++)
    {
        phi_r3 = (i == 0) ? ball->bananas % 10
               : (i == 1) ? (ball->bananas / 10) % 10
               : (ball->bananas / 100) % 10;
        if (r22->unk0 != phi_r3)
        {
            r22->unk4 = 30;
            r22->unk0 = phi_r3;
            if (ball->bananas >= 90 && (sprite->unk48 == 0))
                sprite->unk48 = 1;
            if (ball->bananas < 90)
                sprite->unk48 = 0;
        }
        if (!(gamePauseStatus & 0xA) && r22->unk4 > 0)
            r22->unk4--;

        temp_f28 = lbl_80118870[0x1D - r22->unk4];
        temp_f4 = temp_f28 - 1.0;
        x = sprite->x - 20.0f - i * 20 - 10.0f - (10.0f * temp_f4);
        y = sprite->y - 10.0f - (10.0f * temp_f4);
        temp_r23 = 510.0f * temp_f4;

        g_set_text_pos(x, y);
        func_80071AE4(RGBA(sprite->unkC, sprite->unkD, temp_r23, 0));
        func_80071B2C(temp_f28, temp_f28);
        func_80072AC0(lbl_802F105C, phi_r3);
    }
    func_80071A8C();
}

void lbl_8007ADF4(struct Sprite *sprite)
{
    struct Ball *ball;
    s32 phi_r3;
    float temp_f28;
    float temp_f4;
    int phi_r27;
    int i;
    int x, y;
    int temp_r23;
    struct Struct80292C00 *r22;

    ball = &ballInfo[sprite->unk48];
    func_80071A8C();
    g_set_font(sprite->fontId);
    g_set_some_sprite_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));

    r22 = lbl_80292C00_alias + sprite->unk48 * 3;
    for (i = 0; i < 3; i++, r22++)
    {
        if ((infoWork.flags & 0x1000) != 0)
        {
            x = sprite->x - 20.0f - i * 20 - 10.0f;
            y = sprite->y - 10.0f;
            g_set_text_pos(x, y);
            func_80071AE4(RGBA(sprite->unkC, sprite->unkD, 0, 0));
            g_draw_text("?");
            continue;
        }

        phi_r3 = (i == 0) ? ball->bananas % 10
               : (i == 1) ? (ball->bananas / 10) % 10
               : (ball->bananas / 100) % 10;
        if (r22->unk0 != phi_r3)
        {
            r22->unk4 = 30;
            r22->unk0 = phi_r3;
        }
        if (!(gamePauseStatus & 0xA) && r22->unk4 > 0)
            r22->unk4--;

        temp_f28 = lbl_80118870[29 - r22->unk4];
        temp_f4 = temp_f28 - 1.0;
        x = sprite->x - 20.0f - i * 20 - 10.0f - (10.0f * temp_f4);
        y = sprite->y - 10.0f - (10.0f * temp_f4);
        temp_r23 = 510.0f * temp_f4;

        g_set_text_pos(x, y);
        func_80071AE4(RGBA(sprite->unkC, sprite->unkD, temp_r23, 0));
        func_80071B2C(temp_f28, temp_f28);
        func_80072AC0(lbl_802F105C, phi_r3);
    }
    func_80071A8C();
}

void lbl_8007B134(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    struct TPLTextureHeader *texHdr;
    int phi_r5;

    phi_r5 = (modeCtrl.playerCount > 1) ? ballInfo[sprite->unk48].unk2E : 3;
    params.bmpId = BMP_NML_game_player;
    params.rotation = sprite->unk68;
    params.alpha = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
    params.color1 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, (int)(sprite->opacity * 255.0f));
    params.color2 = RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0);
    texHdr = &bitmapGroups[(params.bmpId >> 8) & 0xFF].tpl->texHeaders[params.bmpId & 0xFF];
    params.x = sprite->x;
    params.y = sprite->y;
    params.z = sprite->unk4C;
    params.u1 = (16.0f * sprite->unk48) / texHdr->width;
    params.v1 = (16.0f * phi_r5) / texHdr->height;
    params.u2 = params.u1 + (16.0f / texHdr->width);
    params.v2 = params.v1 + (10.0f / texHdr->height);
    params.zoomX = sprite->unk40 * (params.u2 - params.u1);
    params.zoomY = sprite->unk44 * (params.v2 - params.v1);
    draw_naomi_sprite(&params);
}

extern s32 lbl_802F1CA8;

void lbl_8007B34C(s8 *arg0, struct Sprite *sprite)
{
    struct Struct80292C60 *r31 = &lbl_80292C60;
    struct Ball *ball = currentBallStructPtr;

    if (r31->unk4 == 0)
    {
        if (ball->unk7C > r31->unk0)
        {
            int temp_r3_2 = ball->unk7C - r31->unk0;

            if (temp_r3_2 >= 1000)
                r31->unk4 = 120;
            else
                r31->unk4 = 30;
            r31->unk8 = temp_r3_2 / r31->unk4;
        }
    }
    if (r31->unk4 > 0)
        r31->unk4--;
    if (r31->unk4 == 0)
    {
        r31->unk0 = ball->unk7C;
        if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && lbl_802F1CA8 != 0)
        {
            struct Sprite *temp_r3_4 = find_sprite_with_tag(8);

            if (temp_r3_4 != NULL && temp_r3_4->unk48 == 0)
                temp_r3_4->unk48 = 1;
        }
    }
    else
    {
        r31->unk0 += r31->unk8;
        if (gameSubmode == SMD_GAME_GOAL_REPLAY_MAIN && r31->unk4 % 4 == 0)
            g_play_sound(0x2E);
    }
    sprintf(sprite->text, lbl_802F105C, r31->unk0);
}

void lbl_8007B490(s8 *arg0, struct Sprite *sprite)
{
    sprite->bmpId = func_80081CFC(lbl_80292D18.unk0, lbl_80292D18.unk8, playerCharacterSelection[sprite->unk48]);
}

void lbl_8007B4E8(s8 *arg0, struct Sprite *sprite)
{
    float len = mathutil_vec_len(&currentBallStructPtr->vel);
    float var2 = ((216000.0 * len) / 1000.0) / 1.6093;

    if (var2 > 999.0)
        var2 = 999.0f;
    sprintf(sprite->text, "%3.0f", var2);
}

void lbl_8007B570(s8 *arg0, struct Sprite *sprite)
{
    float len = mathutil_vec_len(&ballInfo[sprite->unk48].vel);
    float var2 = ((216000.0 * len) / 1000.0) / 1.6093;

    if (var2 > 999.0)
        var2 = 999.0f;
    sprintf(sprite->text, "%3.0f", var2);
}

void lbl_8007B608(s8 *arg0, struct Sprite *sprite)
{
    float phi_f1;

    sprintf(sprite->text, "%2d BANANA%s LEFT", infoWork.unk24, (infoWork.unk24 > 1) ? "S" : " ");
    if (gameSubmode != 0x33)
    {
        if (--sprite->counter < 0)
            sprite->counter = 0;
    }
    else
    {
        if (++sprite->counter > 60)
            sprite->counter = 60;
    }
    if (sprite->counter <= 0)
        sprite->unk78 |= 1;
    else
        sprite->unk78 &= ~1;
    sprite->opacity = sprite->counter / 60.0f;
    phi_f1 = 2.0 * ((unpausedFrameCounter % 60) / 59.0);
    if (phi_f1 > 1.0)
        phi_f1 = 2.0 - phi_f1;
    sprite->unkC = 0xFF;
    sprite->unkD = 0xFF;
    sprite->unkE = 255.0f * phi_f1;
}

void bonus_floor_sprite_main(s8 *arg0, struct Sprite *arg1)
{
    if (arg1->unk48 > 0)
    {
        arg1->opacity = 0.06666 * arg1->unk48;
        arg1->unk68 = 0;
    }
    else if (arg1->counter < 60)
    {
        arg1->opacity = 0.01666 * arg1->counter;
        arg1->unk68 = (60 - arg1->counter) * 0x111;
    }
    else
    {
        arg1->opacity = 1.0f;
        arg1->unk68 = 0;
    }

    if (arg1->counter >= 150)
    {
        arg1->x = 500.0f;
        arg1->y = 452.0f;
        arg1->unk40 = 0.3f;
        arg1->unk44 = arg1->unk40;
    }
    else if (arg1->counter >= 120)
    {
        int temp_r6 = arg1->counter - 120;

        arg1->x = 320 + temp_r6 * 6;
        arg1->y = 300.0 + temp_r6 * 5.066666;
        arg1->unk40 = 0.5 - temp_r6 * 0.006666;
        arg1->unk44 = arg1->unk40;
    }
    arg1->counter++;
    if (arg1->unk48 != 0)
    {
        arg1->unk48--;
        if (arg1->unk48 == 0)
            *arg0 = 0;
    }
}

void final_floor_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (modeCtrl.levelSet == 0)
    {
        sprite->unkC = 0;
        sprite->unkD = 0xD0;
        sprite->unkE = 0;
    }
    else if (modeCtrl.levelSet == 1)
    {
        sprite->unkC = 0;
        sprite->unkD = 0;
        sprite->unkE = 0xE0;
    }
    else
    {
        sprite->unkC = 0xFF;
        sprite->unkD = 0xC0;
        sprite->unkE = 0;
    }

    if (sprite->counter >= 0x96)
    {
        float temp_f3 = 64.0f * mathutil_sin((sprite->counter - 0x96) << 9);

        sprite->unkC = CLAMP(sprite->unkC + temp_f3, 0.0f, 255.0f);
        sprite->unkD = CLAMP(sprite->unkD + temp_f3, 0.0f, 255.0f);
        sprite->unkE = CLAMP(sprite->unkE + temp_f3, 0.0f, 255.0f);
    }

    if (sprite->unk48 > 0)
        sprite->opacity = 0.06666 * sprite->unk48;
    else
        sprite->opacity = 1.0f;

    if (sprite->counter >= 150)
    {
        if (modeCtrl.unk30 == 1)
        {
            sprite->x = 500.0f;
            sprite->y = 452.0f;
        }
        else
        {
            sprite->x = 140.0f;
            sprite->y = 242.0f;
        }
        sprite->unk40 = 0.3f;
        sprite->unk44 = sprite->unk40;
    }
    else if (sprite->counter >= 120)
    {
        int temp_r4_2 = sprite->counter - 120;

        if (modeCtrl.unk30 == 1)
        {
            sprite->x = 320 + temp_r4_2 * 6;
            sprite->y = 300.0 + temp_r4_2 * 5.066666;
        }
        else
        {
            sprite->x = 320 - temp_r4_2 * 6;
            sprite->y = 300.0 - temp_r4_2 * 1.933333;
        }
        sprite->unk40 = 0.5 - temp_r4_2 * 0.006666;
        sprite->unk44 = sprite->unk40;
    }
    sprite->counter++;
    if (sprite->unk48 != 0)
    {
        sprite->unk48--;
        if (sprite->unk48 == 0)
            *arg0 = 0;
    }
}

void final_floor_sprite_draw(struct Sprite *sprite)
{
    char text[12];
    float temp_f20;
    float temp_f19;
    float temp_f18;
    int w;
    int h;
    int i;

    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B50(sprite->unk74);
    func_80071AE4(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
    g_set_some_sprite_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));

    w = sprite->unk40 * ((strlen(sprite->text) - 2) * 72 + 48);
    h = sprite->unk44 * 64.0f;

    if (sprite->counter > 120)
    {
        g_set_text_pos(sprite->x - 0.5 * w, sprite->y - 0.5 * h);
        func_80071B2C(sprite->unk40, sprite->unk44);
        func_80071B40(sprite->opacity);
        g_draw_text(sprite->text);
    }
    else
    {
        int phi_r26;
        int phi_r24;
        float phi_f0_4;
        int var;

        strcpy(text, sprite->text);
        phi_r26 = 0;
        for (i = 0; i < strlen(sprite->text); i++, phi_r26 += phi_r24)
        {
            if (i > sprite->counter / 10)
                break;

            phi_f0_4 = sprite->counter - 10.0 * i;
            temp_f18 = MIN(phi_f0_4 / 10.0, 1.0);

            if (text[i] == 'I')
                phi_r24 = 30.0f * sprite->unk40;
            else if (text[i] == ' ')
                phi_r24 = 18.0f * sprite->unk40;
            else
                phi_r24 = 72.0f * sprite->unk40;

            var = (text[i] == 'I') ? sprite->unk40 * -42.0f * 0.5 : 0.0;

            temp_f20 = 1.0 + ((i % 2 == 0) ? 5.0 * (1.0 - temp_f18) : 0.0);
            temp_f19 = 1.0 + ((i % 2 == 0) ? 0.0 : 5.0 * (1.0 - temp_f18));

            g_set_text_pos(
                sprite->x - w * 0.5 + phi_r26 + var - phi_r24 * (temp_f20 - 1.0) * 0.5,
                sprite->y - h * 0.5 - h * (temp_f19 - 1.0) * 0.5);
            func_80071B2C(sprite->unk40 * temp_f20, sprite->unk44 * temp_f19);
            func_80071B40(sprite->opacity * temp_f18);
            if (text[i] != ' ')
                func_80071B78(text[i]);
        }
    }
    func_80071A8C();
}

void go_sprite_main(s8 *, struct Sprite *);
void go_sprite_draw(struct Sprite *);

void show_go_text(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unk4C = (modeCtrl.unk30 == 1) ? 0.1 : 0.05;
        sprite->unkC = 0;
        sprite->unkD = 0x80;
        sprite->unkE = 0xFF;
        sprite->fontId = 9;
        sprite->textAlign = 4;
        sprite->counter = arg0;
        sprite->unk48 = arg0;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = go_sprite_main;
        sprite->drawFunc = go_sprite_draw;
        strcpy(sprite->text, "GO");
    }
}

void go_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int temp_r3 = sprite->unk48 - sprite->counter;

    if (temp_r3 < 15)
    {
        int temp_r0 = 15 - temp_r3;

        sprite->opacity = temp_r3 * 0.06666;
        sprite->unk70 = 0;
        sprite->unk71 = sprite->unk70;
        sprite->unk72 = sprite->unk70;
        sprite->unk40 = 1.0 + temp_r0 * 0.1;
        sprite->unk44 = 1.0 + temp_r0 * -0.04;
    }
    else if (temp_r3 < 30)
    {
        int temp_r29 = (temp_r3 - 15) * 0x888;

        sprite->opacity = 1.0f;
        sprite->unk70 = ((unpausedFrameCounter >> 1) & 1) * 0xC0;
        sprite->unk71 = sprite->unk70;
        sprite->unk72 = sprite->unk70;
        sprite->unk40 = 1.0 - mathutil_sin(temp_r29) * 0.5;
        sprite->unk44 = 1.0 + mathutil_sin(temp_r29);
    }
    else if (temp_r3 < 45)
    {
        int temp_r29_2 = (temp_r3 - 30) * 0x888;

        sprite->opacity = 1.0f;
        sprite->unk70 = ((unpausedFrameCounter >> 1) & 1) * 0xC0;
        sprite->unk71 = sprite->unk70;
        sprite->unk72 = sprite->unk70;
        sprite->unk40 = 1.0 + mathutil_sin(temp_r29_2) * 0.75;
        sprite->unk44 = 1.0 - mathutil_sin(temp_r29_2) * 0.375;
    }
    else
    {
        sprite->opacity = sprite->counter * 0.06666;
        sprite->unk70 = 0;
        sprite->unk71 = sprite->unk70;
        sprite->unk72 = sprite->unk70;
        sprite->unk40 = 1.0 + (15 - sprite->counter) * -0.04;
        sprite->unk44 = 1.0 + (15 - sprite->counter) * 0.1;
    }

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

void go_sprite_draw(struct Sprite *sprite)
{
    int i;
    int temp_r31;
    int temp_r23;
    int temp_r3;
    float phi_f29;
    float phi_f2;
    float phi_f30_2;

    temp_r31 = sprite->unk48 - sprite->counter;
    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B1C(sprite->unk4C);
    func_80071B50(sprite->unk74);
    func_80071B40(sprite->opacity);
    func_80071AE4(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
    g_set_some_sprite_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));
    func_80071B2C(1.5f * sprite->unk40, 1.5f * sprite->unk44);
    temp_r23 = 1.5f * (36.0f * sprite->unk40);
    temp_r3 = 1.5f * (32.0f * sprite->unk44);

    for (i = 0; i < 2; i++)
    {
        if (temp_r31 < 15)
        {
            phi_f30_2 = (i == 0) ? -320.0f : 320.0f;
            phi_f29 = phi_f30_2 * mathutil_sin((0xF - temp_r31) * 0x444);
            phi_f2 = 0.0f;
        }
        else if (temp_r31 < 30)
        {
            phi_f29 = 0.0f;
            phi_f2 = 0.0f;
        }
        else if (temp_r31 < 45)
        {
            phi_f29 = 0.0f;
            phi_f2 = 0.0f;
        }
        else
        {
            phi_f29 = 0.0f;
            phi_f30_2 = (i == 0) ? -240.0f : 240.0f;
            phi_f2 = phi_f30_2 * mathutil_sin((0xF - sprite->counter) * 0x444);
        }
        g_set_text_pos(
            (sprite->x + phi_f29) - temp_r23 + ((i == 0) ? -temp_r23 : temp_r23),
            (sprite->y + phi_f2) - temp_r3);
        func_80071B78((i == 0) ? 0x47 : 0x4F);
    }
}

char lbl_801C1A38[] = "JUMP TO FLOOR %d";

void lbl_8007C80C(struct Sprite *);
void lbl_8007CBD4(s8 *, struct Sprite *);
void lbl_8007FD48(s8 *, struct Sprite *);

void g_show_goal_text(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
            sprite->y = 240.0f;
        else
            sprite->y = 320.0f;
        sprite->unk4C = 0.05f;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = arg0;
        sprite->unk48 = arg0;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = lbl_8007FD48;
        sprite->drawFunc = lbl_8007C80C;
        strcpy(sprite->text, "GOAL");
    }
    if (infoWork.unk22 != 1)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 320.0f;
            sprite->y = 240.0f;
            sprite->unkC = 0;
            sprite->unkD = 0xC0;
            sprite->unkE = 0xFF;
            sprite->unk40 = 1.0f;
            sprite->unk44 = 0.6f;
            sprite->fontId = FONT_ASC_32x32;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = arg0;
            sprite->unk48 = arg0;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = lbl_8007CBD4;
            sprintf(sprite->text, lbl_801C1A38, infoWork.unk20);
        }
    }
}

extern float lbl_802F2018;
extern float lbl_802F201C;

void lbl_8007C80C(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    float phi_f30;
    int temp_r29;
    int temp_r31;
    int temp_r6;
    int phi_r7;
    int i;

    params.bmpId = BMP_NML_game_goal;
    params.z = sprite->unk4C;
    params.rotation = sprite->unk68;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;

    temp_r31 = sprite->unk48 - sprite->counter;
    if (temp_r31 < 30)
    {
        phi_f30 = temp_r31 * 0.016666;
        phi_r7 = 0;
    }
    else if (temp_r31 < 45)
    {
        phi_f30 = 1.0f;
        phi_r7 = mathutil_sin((temp_r31 - 30) * 0x888) * 255.0f;
    }
    else if (sprite->counter <= 15)
    {
        phi_f30 = sprite->counter * 0.06666;
        phi_r7 = 0;
    }
    else
    {
        phi_f30 = 1.0f;
        phi_r7 = 0;
    }
    params.alpha = phi_f30;
    params.color1 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, (u8)(phi_f30 * 255.0f));
    params.color2 = RGBA(phi_r7, phi_r7, phi_r7, 0);

    if (temp_r31 >= 210)
    {
        sprite->x = 561.0f;
        sprite->y = 420.0f;
        sprite->unk40 = 0.5f;
        sprite->unk44 = sprite->unk40;
    }
    else if (temp_r31 >= 180)
    {
        temp_r6 = temp_r31 - 180;
        sprite->x = 320.0 + temp_r6 * 8.03333;
        if (modeCtrl.gameType == 1)
            sprite->y = 240.0 + temp_r6 * 6.0;
        else
            sprite->y = 320.0 + temp_r6 * 3.33333;
        sprite->unk40 = 1.0 - temp_r6 * 0.01666;
        sprite->unk44 = sprite->unk40;
    }

    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.zoomX = sprite->unk40;
    params.zoomY = sprite->unk44;

    if (temp_r31 < 30)
    {
        struct {float x; float y;} spC[4] =
        {
            { -1,  1 },
            {  1,  1 },
            {  1, -1 },
            { -1, -1 },
        };
        float temp_f29 = (30 - temp_r31) * 0.03333;

        for (i = 0; i < 4; i++)
        {
            lbl_802F2018 = sprite->x;
            lbl_802F201C = sprite->y;
            lbl_802F2018 += temp_f29 * (216.0f * spC[i].x);
            lbl_802F201C += temp_f29 * (192.0f * spC[i].y);
            params.x = lbl_802F2018;
            params.y = lbl_802F201C;
            draw_naomi_sprite(&params);
        }
    }
    else
    {
        params.x = sprite->x;
        params.y = sprite->y;
        draw_naomi_sprite(&params);
    }
    func_80071A8C();
}

void lbl_8007CDCC(s8 *, struct Sprite *);

void lbl_8007CBD4(s8 *arg0, struct Sprite *sprite)
{
    s32 temp_r29;
    struct Sprite *temp_r3;

    temp_r29 = sprite->unk48 - sprite->counter;
    if (temp_r29 < 30)
        sprite->opacity = 0.03333 * temp_r29;
    else if (sprite->counter <= 15)
        sprite->opacity = 0.06666 * sprite->counter;
    else
        sprite->opacity = 1.0f;
    sprite->x = 320.0f + 20.0f * mathutil_sin(temp_r29 << 9);
    sprite->y = 240.0f + 10.0f * mathutil_sin((temp_r29 << 8) + 0x4000);

    if (temp_r29 % 2 == 1)
    {
        temp_r3 = create_sprite();
        if (temp_r3 != NULL)
        {
            temp_r3->x = sprite->x;
            temp_r3->y = sprite->y;
            temp_r3->unk4C = sprite->unk4C + 0.1;
            temp_r3->unkC = sprite->unkC;
            temp_r3->unkD = sprite->unkD;
            temp_r3->unkE = sprite->unkE;
            temp_r3->unk70 = 0;
            temp_r3->unk71 = 0x60;
            temp_r3->unk72 = 0x7F;
            temp_r3->unk40 = sprite->unk40;
            temp_r3->unk44 = sprite->unk44;
            temp_r3->fontId = FONT_ASC_32x32;
            temp_r3->textAlign = ALIGN_CC;
            temp_r3->counter = 0x10;
            temp_r3->opacity = 0.5f;
            temp_r3->unk74 |= 0x1000;
            temp_r3->mainFunc = lbl_8007CDCC;
            sprintf(temp_r3->text, lbl_801C1A38, infoWork.unk20);
        }
    }

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

void lbl_8007CDCC(s8 *arg0, struct Sprite *sprite)
{
    sprite->unk71 += 6;
    sprite->unk72 += 7;
    sprite->unk4C += 0.001;
    sprite->unk40 += 0.008;
    sprite->unk44 += 0.008;
    sprite->opacity -= 0.03125;

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

void lbl_8007CF10(s8 *, struct Sprite *);

void show_fallout_text(int arg0)
{
    struct Sprite *temp_r3;

    if (!(infoWork.flags & 0x40))
    {
        temp_r3 = create_sprite();
        if (temp_r3 != NULL)
        {
            temp_r3->x = 320.0f;
            temp_r3->y = 240.0f;
            temp_r3->unk4C = 0.05f;
            temp_r3->unkC = 0xFF;
            temp_r3->unkD = 0x8C;
            temp_r3->unkE = 0;
            temp_r3->fontId = 9;
            temp_r3->textAlign = 4;
            temp_r3->counter = arg0;
            temp_r3->unk48 = arg0;
            temp_r3->unk74 |= 0x1000;
            temp_r3->mainFunc = lbl_8007CF10;
            strcpy(temp_r3->text, "FALL OUT");
        }
    }
    else
        func_8007D428();
}

void lbl_8007CF10(s8 *arg0, struct Sprite *sprite)
{
    s32 temp_r0_3;
    s32 temp_r28;

    temp_r28 = sprite->unk48 - sprite->counter;

    if (modeCtrl.gameType != GAMETYPE_MINI_TARGET && temp_r28 == 90)
        g_play_sound(0xC);

    if (temp_r28 < 30)
    {
        sprite->opacity = 0.03333 * temp_r28;
        sprite->y = 240 - (30 - temp_r28) * 6;
    }
    else if (temp_r28 < 60)
    {
        sprite->opacity = 1.0f;
        sprite->y = 240.0f - 32.0f * mathutil_sin((temp_r28 - 30) * 0x444);
    }
    else if (temp_r28 < 90)
    {
        sprite->opacity = 1.0f;
        sprite->y = 240.0f - 8.0f * mathutil_sin((temp_r28 - 0x3C) * 0x444);
    }
    else
    {
        if (sprite->counter <= 15)
            sprite->opacity = 0.06666 * sprite->counter;
        else
            sprite->opacity = 1.0f;
    }
    if (modeCtrl.gameType != GAMETYPE_MINI_TARGET
     && modeCtrl.gameType != GAMETYPE_MINI_BOWLING)
    {
        if (temp_r28 >= 120)
        {
            sprite->x = 496.0f;
            sprite->y = 420.0f;
            sprite->unk40 = 0.5f;
            sprite->unk44 = sprite->unk40;
        }
        else if (temp_r28 >= 90)
        {
            temp_r0_3 = temp_r28 - 90;
            sprite->x = 320.0 + temp_r0_3 * 5.86666;
            sprite->y = 240 + temp_r0_3 * 6;
            sprite->unk40 = 1.0 - temp_r0_3 * 0.01666;
            sprite->unk44 = sprite->unk40;
        }
    }
    else
    {
        sprite->unk40 = 0.85f;
        sprite->unk44 = sprite->unk40;
    }

    if (--sprite->counter <= 0)
        *arg0 = 0;
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
const float lbl_802F4DB4 = 428f;
const float lbl_802F4DB8 = 22f;
const float lbl_802F4DBC = 0.20000000298023224f;
const float lbl_802F4DC0 = 536f;
const float lbl_802F4DC4 = 24f;
const float lbl_802F4DC8 = 518f;
const float lbl_802F4DCC = 47f;
const float lbl_802F4DD0 = 380f;
const double lbl_802F4DD8 = 0.80000000000000004;
const double lbl_802F4DE0 = 0.59999999999999998;
const float lbl_802F4DE8 = 15f;
const float lbl_802F4DEC = 4096f;
const float lbl_802F4DF0 = 0.64999997615814209f;
const float lbl_802F4DF4 = 0.15000000596046448f;
const double lbl_802F4DF8 = 0.066659999999999997;
const double lbl_802F4E00 = -3.6000000000000001;
const double lbl_802F4E08 = 57.600000000000001;
const double lbl_802F4E10 = 14.4;
const double lbl_802F4E18 = 25.600000000000001;
const double lbl_802F4E20 = 0.0625;
const float lbl_802F4E28 = 785f;
const float lbl_802F4E2C = 310f;
const double lbl_802F4E30 = 0.033329999999999999;
const float lbl_802F4E38 = 32f;
const float lbl_802F4E3C = 20f;
const float lbl_802F4E40 = 2f;
const float lbl_802F4E44 = 443f;
const float lbl_802F4E48 = 72f;
const float lbl_802F4E4C = 436f;
const float lbl_802F4E50 = 1.5f;
const float lbl_802F4E54 = 52f;
const float lbl_802F4E58 = 86f;
const float lbl_802F4E5C = 108f;
const float lbl_802F4E60 = 196f;
const float lbl_802F4E64 = 412f;
const float lbl_802F4E68 = 640f;
const float lbl_802F4E6C = 480f;
const float lbl_802F4E70 = 51f;
const float lbl_802F4E74 = 120f;
const float lbl_802F4E78 = 41f;
const float lbl_802F4E7C = 28f;
const float lbl_802F4E80 = 0.375f;
const float lbl_802F4E84 = 0.24374999105930328f;
const float lbl_802F4E88 = 64f;
const float lbl_802F4E8C = -3f;
const float lbl_802F4E90 = -20f;
const float lbl_802F4E94 = 250f;
const float lbl_802F4E98 = 257f;
const float lbl_802F4E9C = 400f;
const float lbl_802F4EA0 = 10.666666984558105f;
const float lbl_802F4EA4 = 54f;
const float lbl_802F4EA8 = 454f;
const float lbl_802F4EAC = 458f;
const float lbl_802F4EB0 = 1.0099999904632568f;
const float lbl_802F4EB4 = 0.87999999523162842f;
const float lbl_802F4EB8 = 0.05000000074505806f;
const double lbl_802F4EC0 = 100;
const double lbl_802F4EC8 = 60;
const float lbl_802F4ED0 = 70f;
const float lbl_802F4ED4 = 510f;
const double lbl_802F4ED8 = 216000;
const double lbl_802F4EE0 = 1000;
const double lbl_802F4EE8 = 1.6093;
const double lbl_802F4EF0 = 999;
const float lbl_802F4EF8 = 999f;
const double lbl_802F4F00 = 59;
const double lbl_802F4F08 = 0.016660000000000001;
const float lbl_802F4F10 = 500f;
const float lbl_802F4F14 = 452f;
const float lbl_802F4F18 = 0.30000001192092896f;
const double lbl_802F4F20 = 300;
const double lbl_802F4F28 = 5.0666659999999997;
const double lbl_802F4F30 = 0.0066660000000000001;
const float lbl_802F4F38 = 140f;
const float lbl_802F4F3C = 242f;
const double lbl_802F4F40 = 1.933333;
const double lbl_802F4F48 = 10;
const float lbl_802F4F50 = 30f;
const float lbl_802F4F54 = 18f;
const float lbl_802F4F58 = -42f;
const double lbl_802F4F60 = 5;
const double lbl_802F4F68 = -0.040000000000000001;
const double lbl_802F4F70 = 0.75;
const double lbl_802F4F78 = 0.375;
const float lbl_802F4F80 = 36f;
const float lbl_802F4F84 = -320f;
const float lbl_802F4F88 = -240f;
const float lbl_802F4F8C = 0.60000002384185791f;
const double lbl_802F4F90 = 0.016666;
const float lbl_802F4F98 = 561f;
const float lbl_802F4F9C = 420f;
const double lbl_802F4FA0 = 320;
const double lbl_802F4FA8 = 8.0333299999999994;
const double lbl_802F4FB0 = 240;
const double lbl_802F4FB8 = 6;
const double lbl_802F4FC0 = 3.3333300000000001;
const float lbl_802F4FC8 = 216f;
const float lbl_802F4FCC = 192f;
const double lbl_802F4FD0 = 0.0080000000000000002;
const double lbl_802F4FD8 = 0.03125;
const float lbl_802F4FE0 = 496f;
const double lbl_802F4FE8 = 5.8666600000000004;
const float lbl_802F4FF0 = 0.85000002384185791f;
const float lbl_802F4FF4 = 493f;
const float lbl_802F4FF8 = 93f;
const float lbl_802F4FFC = 0.10999999940395355f;
const float lbl_802F5000 = 490f;
const float lbl_802F5004 = 90f;
const float lbl_802F5008 = 160f;
const float lbl_802F500C = 260f;
const double lbl_802F5010 = 200;
const float lbl_802F5018 = 0.0080000003799796104f;
const double lbl_802F5020 = 4;
const float lbl_802F5028 = 760f;
const float lbl_802F502C = 460f;
const float lbl_802F5030 = 624f;
const float lbl_802F5034 = 450f;
const float lbl_802F5038 = 448f;
const float lbl_802F503C = 456f;
const double lbl_802F5040 = 10.666666666666666;
const double lbl_802F5048 = 480;
const double lbl_802F5050 = 69;
const double lbl_802F5058 = 65;
const double lbl_802F5060 = 25;
const double lbl_802F5068 = 0.066666000000000003;
const double lbl_802F5070 = 0.029999999999999999;
const float lbl_802F5078 = 214f;

*/
