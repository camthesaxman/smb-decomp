#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "hud.h"
#include "info.h"
#include "input.h"
#define MATHUTIL_SIN_INT_PARAM
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"
#include "textbox.h"

u8 lbl_801C14F0[] =
{
    0xFF, 0x00, 0x00,
    0x2C, 0x65, 0xFF,
    0xFB, 0xFF, 0x2C,
    0x2C, 0xFF, 0x57,
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

static void lbl_80075D70(struct TextBox *a) {}

static void pause_menu_sprite_draw(struct Sprite *);

void hud_show_pause_menu(void)
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

static void game_over_sprite_main(s8 *, struct Sprite *);

void func_80075E1C(int unused, struct Sprite *sprite)
{
    struct Sprite *gameOver;

    sprite->y += 0.075 * (lbl_801C14FC[sprite->unk48] - sprite->y);
    if (sprite->counter > 0)
    {
        sprite->unk44 = sprite->unk40;
        sprite->counter--;
    }
    else
    {
        sprite->unk44 += 0.1 * (sprite->unk40 - sprite->unk44);
    }
    if (sprite->unk48 >= 2 && sprite->unk48 != 6)
    {
        if (sprite->opacity < 0.99)
            sprite->opacity += 0.01;
    }
    if (sprite->unk48 == 2)
    {
        if (sprite->unkC < 250.0)
            sprite->unkC += 5;
        sprite->unkD = sprite->unkC;
        sprite->unkE = sprite->unkC;
    }
    if (sprite->unk48 == 4)
    {
        sprite->unk48 = 5;
        gameOver = create_sprite();
        if (gameOver != NULL)
        {
            gameOver->x = 320.0f;
            gameOver->y = 240.0f;
            gameOver->unkC = 255;
            gameOver->unkD = 0;
            gameOver->unkE = 32;
            gameOver->fontId = FONT_ASC_72x64;
            gameOver->textAlign = ALIGN_CC;
            gameOver->counter = 60;
            gameOver->unk48 = 60;
            gameOver->unk4C = sprite->unk4C - 0.001;
            gameOver->mainFunc = game_over_sprite_main;
            strcpy(gameOver->text, "GAME OVER");
        }
    }
}

static char *menuContHowExit[] =
{
    "a/Continue game",
    "a/How to play",
    "a/Exit game",
};

static char *menuContViewHowExit[] =
{
    "a/Continue game",
    "a/View stage",
    "a/How to play",
    "a/Exit game",
};

static char *menuContSaveHowExit[] =
{
    "a/Continue game",
    "a/Save replay",
    "a/How to play",
    "a/Exit game",
};

static char *menuContRetryViewHowSelectExit[] =
{
    "a/Continue game",
    "a/Retry",
    "a/View stage",
    "a/How to play",
    "a/Stage select",
    "a/Exit game",
};

static char *menuContRetrySaveHowSelectExit[] =
{
    "a/Continue game",
    "a/Retry",
    "a/Save replay",
    "a/How to play",
    "a/Stage select",
    "a/Exit game",
};

static char *menuContRetryHowExit[] =
{
    "a/Continue game",
    "a/Retry",
    "a/How to play",
    "a/Exit game",
};

static char *menuContGuideHowExit[] =
{
    "a/Continue game",
    "a/Guide",
    "a/How to play",
    "a/Exit game",
};

static char **pauseMenus[] =
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

static void pause_menu_sprite_draw(struct Sprite *sprite)
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
        g_set_text_fill_color(0x202000);
        g_set_text_other_color(0);
        g_draw_text(text);
        g_set_text_pos(x, y);
        g_set_text_fill_color((i == lbl_801EEC68.unk8) ? 0xFFFF00 : 0x808000);
        g_set_text_other_color((((lbl_801EEC68.unk4) & 1) && i == lbl_801EEC68.unk8) ? temp_r16 : 0);
        g_draw_text(text);

        if (menuType == 4 && i == 1)
        {
            u32 temp_r3 = (1.0 - __fabs(mathutil_sin(globalFrameCounter << 9))) * 255.0;
            u32 temp_r24 = RGBA(temp_r3, temp_r3, temp_r3, 0);

            strcpy(text, "ON");
            x += 96.0f;
            g_set_text_pos(3.0f + x, 3.0f + y);
            g_set_text_fill_color(0x202000);
            g_set_text_other_color(0);
            g_draw_text(text);
            g_set_text_pos(x, y);
            if (lbl_801EEC68.unk4 & 8)
                g_set_text_fill_color(0xC0C000);
            else
                g_set_text_fill_color(0x808000);
            if (i == lbl_801EEC68.unk8 && (lbl_801EEC68.unk4 & 8))
                g_set_text_other_color(temp_r24);
            else
                g_set_text_other_color(0);
            g_draw_text(text);

            strcpy(text, "OFF");
            x += 50.0f;
            g_set_text_pos(3.0f + x, 3.0f + y);
            g_set_text_fill_color(0x202000);
            g_set_text_other_color(0);
            g_draw_text(text);
            g_set_text_pos(x, y);
            if (!(lbl_801EEC68.unk4 & 8))
                g_set_text_fill_color(0xC0C000);
            else
                g_set_text_fill_color(0x808000);
            if (i == lbl_801EEC68.unk8 && !(lbl_801EEC68.unk4 & 8))
                g_set_text_other_color(temp_r24);
            else
                g_set_text_other_color(0);
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

void hud_show_press_start_textbox(int a)
{
    struct TextBox tbox;

    memset(&tbox, 0, sizeof(tbox));
    tbox.style = (a == 2 || a == 3) ? TEXTBOX_STYLE_CENTER_UP : 15;
    tbox.x = 320;
    tbox.y = (a == 2 || a == 3) ? 361 : 410;
    tbox.numLines = 1;
    tbox.unk1C = lbl_80075D70;
    g_create_textbox(0, 21, &tbox);
    if (a == 3)
        g_set_textbox_text(0, "b/Select using the c/0xffffff/p/BUTTON_A/c/0x000000/ Button!");
    else
        g_set_textbox_text(0, "b/Press Start");
}

float force_lbl_802F4C80() { return 10.0f; }

static void lbl_80076710(struct Sprite *sprite)
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

static void lbl_800768A8(s8 *a, struct Sprite *sprite);

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

static void lbl_80076AC0(struct Sprite *);

static void lbl_800768A8(s8 *a, struct Sprite *sprite)
{
    struct Sprite *logoPlus = find_sprite_with_tag(3);

    if (sprite->counter <= 393)
        sprite->x -= 0.0f;  // does nothing
    else if (sprite->counter <= 408)
        sprite->x -= 10.0f + (6.0f * mathutil_sin((sprite->counter - 393) * 0x444));
    else if (sprite->counter <= 480)
        sprite->x -= 16.0f;

    if (sprite->counter >= 378 && sprite->counter <= 408)
    {
        sprite->unk40 = 1.0 - (0.7 * mathutil_sin((sprite->counter - 378) * 0x444));
        sprite->unk44 = 1.0 + (0.7 * mathutil_sin((sprite->counter - 378) * 0x444));
        if (logoPlus != NULL)
            logoPlus->opacity = 0.0333 * (408 - sprite->counter);
    }

    if (sprite->counter == 480)
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

    if (sprite->counter < 480)
        sprite->opacity = 1.0f;
    else if (sprite->counter <= 600)
        sprite->opacity = 0.0f;
    else if (sprite->counter <= 630)
    {
        sprite->opacity = 0.0333 * (sprite->counter - 600);
        if (logoPlus != NULL)
            logoPlus->opacity = sprite->opacity;
    }

    sprite->counter++;
}

static void lbl_80076AC0(struct Sprite *sprite)
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
    params.zoomY = sprite->unk44 * 0.15625;
    params.rotation = sprite->unk68;
    params.alpha = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
    params.color1 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, (u8)(sprite->opacity * 255.0f));
    params.color2 = 0;
    draw_naomi_sprite(&params);
}

static void copyright_sprite_main(s8 *, struct Sprite *);

void hud_show_adv_copyright_info(int a)
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

static void copyright_sprite_main(s8 *unused, struct Sprite *sprite)
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

static void title_sprite_main(s8 *, struct Sprite *);
static void title_sprite_draw(struct Sprite *);

void hud_show_title_banner(int arg0)
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

static void title_sprite_main(s8 *arg0, struct Sprite *sprite)
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

static void title_sprite_draw(struct Sprite *sprite)
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

static void gamestart_sprite_main(s8 *, struct Sprite *);
static void options_sprite_main(s8 *, struct Sprite *);

void hud_show_title_menu(void)
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

static void gamestart_sprite_main(s8 *arg0, struct Sprite *sprite)
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

static void options_sprite_main(s8 *arg0, struct Sprite *sprite)
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

void g_create_saru_sprite(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 17;
        sprite->x = 142.0f;
        sprite->y = 60.0f;
        sprite->fontId = FONT_ASCII;
        sprite->textAlign = ALIGN_PIC;
        sprite->unk4C = 0.04f;
        sprite->drawFunc = lbl_80080940;
        sprintf(sprite->text, "saru");
    }
    lbl_80292D18.unk4 = 0;
    lbl_80292D18.unk0 = 0;
    lbl_80292D18.unk8 = 0;
    lbl_80292D18.unk14 = 0xE;
}

float force_lbl_802F4D9C() { return 0.1f; }
float force_lbl_802F4DA0() { return 40.0f; }

static void normal_timer_seconds_sprite_main(s8 *, struct Sprite *);
static void normal_timer_100th_seconds_sprite_main(s8 *, struct Sprite *);
static void banana_count_sprite_draw(struct Sprite *);
static void bananas_left_sprite_main(s8 *, struct Sprite *);

void g_show_adv_ready_hud(void)
{
    struct Sprite *sprite;
    struct Ball *ball;
    u8 filler[16];

    ball = currentBallStructPtr;
    func_8000D5B8();
    func_8008083C(320.0f, 68.0f);

    // timer
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 85.0f;
        sprite->fontId = FONT_NUM_24x37;
        sprite->textAlign = ALIGN_CB;
        sprite->unk4C = 0.19f;
        sprite->mainFunc = normal_timer_seconds_sprite_main;
        sprintf(sprite->text, "000");
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = -4.0f;
            sprite->fontId = FONT_NUM_12x19;
            sprite->textAlign = ALIGN_CB;
            sprite->unk4C = 0.19f;
            sprite->mainFunc = normal_timer_100th_seconds_sprite_main;
            sprintf(sprite->text, ":00");
        }
    }

    // banana icon
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
        sprite->unkC = 170;
        sprite->unkD = 168;
        sprite->unkE = 0;
        sprite->unk70 = 56;
        sprite->unk71 = 56;
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
        sprite->unkC = 170;
        sprite->unkD = 168;
        sprite->unkE = 0;
        sprite->unk70 = 56;
        sprite->unk71 = 56;
        sprite->unk72 = 0;
        sprintf(sprite->text, "/");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 18;
        sprite->x = 518.0f;
        sprite->y = 48.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CC;
        sprite->drawFunc = banana_count_sprite_draw;
        sprite->unkC = 170;
        sprite->unkD = 168;
        sprite->unkE = 0;
        sprite->unk70 = 56;
        sprite->unk71 = 56;
        sprite->unk72 = 0;
        sprintf(sprite->text, "000 100");
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
            sprite->mainFunc = bananas_left_sprite_main;
            strcpy(sprite->text, "%2d BANANAS LEFT");
        }
    }
}

static void lbl_800782CC(s8 *, struct Sprite *);

void g_banana_sprite_something(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = arg0 + 30;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = textBoxes[arg0 + 1].x;
        sprite->y = textBoxes[arg0 + 1].y;
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

static void lbl_800782CC(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->counter == -1)
    {
        *arg0 = 0;
        return;
    }
    if (sprite->counter > 0)
        sprite->counter--;
    sprite->x = textBoxes[sprite->unk48 + 1].x;
    sprite->y = textBoxes[sprite->unk48 + 1].y - ((sprite->unk48 == 2) ? 54 : 66);
    if (sprite->counter < 15)
        sprite->opacity = 1.0f - sprite->counter / 15.0f;
}

static void eieipu_sprite_main(s8 *, struct Sprite *);
static void eieipu_sprite_draw(struct Sprite *);

void g_show_eieipu_sprite(int arg0)
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
        sprite->mainFunc = eieipu_sprite_main;
        sprite->drawFunc = eieipu_sprite_draw;
        strcpy(sprite->text, "eieipu");
    }
}

static void eieipu_sprite_main(s8 *a, struct Sprite *sprite)
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

static void eieipu_sprite_draw(struct Sprite *sprite)
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

static void floor_intro_sprite_main(s8 *, struct Sprite *);
static void floor_intro_sprite_draw(struct Sprite *);
static void bonus_floor_sprite_main(s8 *, struct Sprite *);
static void final_floor_sprite_main(s8 *, struct Sprite *);
static void final_floor_sprite_draw(struct Sprite *);

void hud_show_stage_name_banner(void)
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
            sprite->unkC = 255;
            sprite->unkD = 255;
            sprite->unkE = 0;
            sprite->unk70 = 32;
            sprite->unk71 = 32;
            sprite->unk72 = 32;
        }
        else
        {
            sprite->unkC = 255;
            sprite->unkD = 255;
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
            sprite->unkC = 255;
            sprite->unkD = 128;
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

static void floor_intro_sprite_main(s8 *arg0, struct Sprite *sprite)
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

static void floor_intro_sprite_draw(struct Sprite *sprite)
{
    int centerX;
    int i;
    int spacePos = 0;
    char text[12];

    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B50(sprite->unk74);
    g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
    g_set_text_other_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));
    centerX = (strlen(sprite->text) * 57) >> 1;
    strcpy(text, sprite->text);

    for (i = 0; i < strlen(sprite->text); i++)
    {
        if (text[i] == ' ')
            spacePos = i;
    }

    for (i = 0; i < strlen(sprite->text); i++)
    {
        int xOffset;
        int yOffset;

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

        xOffset = 0;
        yOffset = 0;

        if (i == 0 && sprite->counter < 30)
            xOffset = (30 - sprite->counter) * -5;
        else if (i > 0 && i < spacePos && sprite->counter < 30 + i * 16)
            xOffset = -3.6 * (30 + i * 16 - sprite->counter);
        else if (i > spacePos)
            xOffset = -28;

        if (sprite->unk48 > 0)
        {
            if (i < spacePos)
                yOffset = (15 - sprite->unk48) * ((i & 1) ? 8 : -8);
            else
                yOffset = (15 - sprite->unk48) * ((i & 1) ? -8 : 8);
        }

        g_set_text_pos(sprite->x - centerX + 14.4 + 57.6 * i + xOffset, sprite->y - 25.6 + yOffset);
        func_80071B2C(sprite->unk40 - 0.01, sprite->unk44 + (0.01 * __fabs((float)yOffset)));
        if (i > spacePos)
            func_80071B40(MIN(0.0625 * (sprite->counter - 30 - spacePos * 16), sprite->opacity));
        else if (i > 0)
            func_80071B40(MIN(0.0625 * (sprite->counter - 30 - ((i - 1) * 16)), sprite->opacity));
        else if (i == 0 && sprite->unk48 > 0)
            func_80071B40(sprite->opacity);
        g_draw_char(text[i]);
    }
    func_80071A8C();
}

static void player_num_sprite_main(s8 *arg0, struct Sprite *sprite)
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

static void ready_sprite_main(s8 *, struct Sprite *);

void hud_show_ready_banner(int duration)
{
    struct Sprite *sprite;

    if (modeCtrl.gameType == 0 && modeCtrl.playerCount > 1)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            int phi_r0 = (modeCtrl.playerCount > 1) ? currentBallStructPtr->playerId : 3;

            sprite->x = 785.0f;
            sprite->y = 310.0f;
            sprite->fontId = 9;
            sprite->textAlign = 4;
            sprite->unkC = lbl_801C14F0[phi_r0 * 3 + 0];
            sprite->unkD = lbl_801C14F0[phi_r0 * 3 + 1];
            sprite->unkE = lbl_801C14F0[phi_r0 * 3 + 2];
            sprite->unk48 = -30;
            sprite->counter = 120;
            sprite->mainFunc = player_num_sprite_main;
            sprintf(sprite->text, "%dP", currentBallStructPtr->playerId + 1);
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
        sprite->unkC = 255;
        sprite->unkD = 200;
        sprite->unkE = 0;
        sprite->counter = duration;
        sprite->unk48 = duration;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = ready_sprite_main;
        strcpy(sprite->text, "READY");
    }
    g_play_sound(4);
}

static void ready_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int t = sprite->unk48 - sprite->counter;

    if (t < 30)
    {
        sprite->opacity = 0.03333 * t;
        sprite->unk40 = 1.0f;
        sprite->unk44 = mathutil_sin(t * 0x222);
    }
    else if (t < 60)
    {
        sprite->opacity = 1.0f;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 1.0 - mathutil_sin((t - 30) * 0x444) * 0.2;
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

static void lbl_8007A774(s8 *, struct Sprite *);
static void lbl_8007A7B8(s8 *, struct Sprite *);
static void competition_timer_seconds_sprite_main(s8 *, struct Sprite *);
static void competition_timer_100th_seconds_sprite_main(s8 *, struct Sprite *);
static void lbl_8007B134(struct Sprite *);
static void score_value_sprite_main(s8 *, struct Sprite *);
static void normal_ball_speed_sprite_main(s8 *, struct Sprite *);

void hud_show_normal_mode_info(void)
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
            sprite->unkC = 255;
            sprite->unkD = 255;
            sprite->unkE = 0;
            sprite->unk70 = 64;
            sprite->unk71 = 64;
            sprite->unk72 = 64;
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
                sprintf(sprite->text, "%d", lbl_8027CE24.unk2 + 4);
            else
                sprintf(sprite->text, "%d", modeCtrl.levelSet + 4);
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
            sprintf(sprite->text, "course");
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
        sprintf(sprite->text, "saru");
    }

    lbl_80292D18.unk4 = 0;
    lbl_80292D18.unk0 = 0;
    lbl_80292D18.unk8 = 0;
    lbl_80292D18.unk14 = 0x33;
    func_8000D5B8();
    func_8008083C(320.0f, 68.0f);

    // timer
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 85.0f;
        sprite->fontId = FONT_NUM_24x37;
        sprite->textAlign = ALIGN_CB;
        sprite->unk4C = 0.19f;
        sprite->mainFunc = competition_timer_seconds_sprite_main;
        sprintf(sprite->text, "000");
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = -4.0f;
            sprite->fontId = FONT_NUM_12x19;
            sprite->textAlign = ALIGN_CB;
            sprite->unk4C = 0.19f;
            sprite->mainFunc = competition_timer_100th_seconds_sprite_main;
            sprintf(sprite->text, ":00");
        }
    }

    // banana icon
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
        sprite->unkC = 170;
        sprite->unkD = 168;
        sprite->unkE = 0;
        sprite->unk70 = 56;
        sprite->unk71 = 56;
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
        sprite->unkC = 170;
        sprite->unkD = 168;
        sprite->unkE = 0;
        sprite->unk70 = 56;
        sprite->unk71 = 56;
        sprite->unk72 = 0;
        sprintf(sprite->text, "/");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 18;
        sprite->x = 518.0f;
        sprite->y = 48.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CC;
        sprite->drawFunc = banana_count_sprite_draw;
        sprite->unkC = 170;
        sprite->unkD = 168;
        sprite->unkE = 0;
        sprite->unk70 = 56;
        sprite->unk71 = 56;
        sprite->unk72 = 0;
        sprintf(sprite->text, "000 100");
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
        sprintf(sprite->text, "SCORE");
    }
    else
        printf("NULL\n");

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 196.0f;
        sprite->y = 48.0f;
        sprite->fontId = FONT_NUM_22x22;
        sprite->textAlign = ALIGN_RC;
        sprite->mainFunc = score_value_sprite_main;
        sprintf(sprite->text, "score");
    }
    else
        printf("NULL\n");

    lbl_80292C60.unk0 = ball->unk7C;
    lbl_80292C60.unk4 = 0;
    lbl_80292C60.unk8 = 0;

    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && lbl_802F1CAC > 0)
        g_show_practice_mode_score_info(0);

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
            sprintf(sprite->text, "%dP", modeCtrl.currPlayer + 1);
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
        sprite->mainFunc = normal_ball_speed_sprite_main;
        strcpy(sprite->text, "00");
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = 4.0f;
            sprite->type = SPRITE_TYPE_BITMAP;
            sprite->textAlign = ALIGN_CT;
            sprite->unk4C = 0.2f;
            sprite->bmpId = BMP_COM_game_icon_mph;
            strcpy(sprite->text, "mph");
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
            sprite->mainFunc = bananas_left_sprite_main;
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

static void lbl_8007ADF4(struct Sprite *);
static void lbl_8007B490(s8 *, struct Sprite *);
static void competition_ball_speed_sprite_main(s8 *, struct Sprite *);

static void show_competition_player_hud(int playerId)
{
    struct Sprite *sprite;
    struct Ball *ball = &ballInfo[playerId];
    struct Viewport vp = cameraInfo[playerId].sub28.vp;
    u8 dummy[12];
    float left = 640.0f * vp.left;
    float top = 480.0f * vp.top;
    float right = left + (640.0f * vp.width);
    float bottom = top + 480.0f * vp.height;

    lbl_80292D18.unk4 = 0;
    lbl_80292D18.unk0 = 0;
    lbl_80292D18.unk8 = 0;
    lbl_80292D18.unk14 = 0x33;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = left + 0.5f * (right - left) - 51.0f;
        if (left < 320.0f)
            sprite->x = (left + 120.0f) - 51.0f;
        else
            sprite->x = (right - 85.0f) - 51.0f;
        sprite->y = top + 22.0f;
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
        sprite->x = left + 0.5f * (right - left) + 41.0f;
        if (left < 320.0f)
            sprite->x = (left + 120.0f) + 41.0f;
        else
            sprite->x = (right - 85.0f) + 41.0f;
        sprite->y = top + 24.0f;
        sprite->fontId = FONT_ASC_18x16;
        sprite->textAlign = ALIGN_CC;
        sprite->drawFunc = lbl_8007ADF4;
        sprite->unkC = 170;
        sprite->unkD = 168;
        sprite->unkE = 0;
        sprite->unk70 = 56;
        sprite->unk71 = 56;
        sprite->unk72 = 0;
        sprite->unk48 = playerId;
        sprintf(sprite->text, "000");
    }

    lbl_80292C00_alias[playerId * 3 + 0].unk4 = 0;
    lbl_80292C00_alias[playerId * 3 + 1].unk4 = 0;
    lbl_80292C00_alias[playerId * 3 + 2].unk4 = 0;
    lbl_80292C00_alias[playerId * 3 + 0].unk0 = ball->bananas % 10;
    lbl_80292C00_alias[playerId * 3 + 1].unk0 = (ball->bananas / 10) % 10;
    lbl_80292C00_alias[playerId * 3 + 2].unk0 = (ball->bananas / 100) % 10;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        if (left < 320.0f)
            sprite->x = left + 28.0f;
        else
            sprite->x = right - 28.0f;
        sprite->y = top + 22.0f;
        sprite->bmpId = func_80081CFC(lbl_80292D18.unk0, lbl_80292D18.unk8, playerCharacterSelection[playerId]);
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.375f;
        sprite->unk44 = 0.24374999f;
        sprite->unk48 = playerId;
        sprite->mainFunc = lbl_8007B490;
        sprintf(sprite->text, "saru mark.pic");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = 1;
        if (left < 320.0f)
            sprite->x = left + 28.0f;
        else
            sprite->x = right - 28.0f;
        sprite->y = top + 48.0f;
        sprite->unk40 = 2.0f;
        sprite->unk44 = 2.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->unk48 = playerId;
        sprite->drawFunc = lbl_8007B134;
        sprintf(sprite->text, "%dP", playerId + 1);
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        if (left < 320.0f)
        {
            sprite->x = left + 64.0f;
            sprite->textAlign = ALIGN_RB;
        }
        else
        {
            sprite->x = (right - 32.0f) - 24.0f;
            sprite->textAlign = ALIGN_RB;
        }
        sprite->y = bottom - 16.0f;
        sprite->fontId = FONT_ASC_18x16;
        sprite->unk48 = playerId;
        sprite->unk4C = 0.2f;
        sprite->mainFunc = competition_ball_speed_sprite_main;
        strcpy(sprite->text, "00");
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = 4.0f;
            sprite->y = -3.0f;
            sprite->type = SPRITE_TYPE_BITMAP;
            sprite->textAlign = ALIGN_CT;
            sprite->unk4C = 0.2f;
            sprite->bmpId = 0x58;
            strcpy(sprite->text, "mph");
        }
    }
}

static char *lbl_801C1A0C[] =
{
    "FINAL",
    "2ND",
    "1ST",
};

static void competition_round_sprite_main(s8 *, struct Sprite *);
static void competition_separator_sprite_draw(struct Sprite *);

void hud_show_competition_mode_info(void)
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
            sprite->mainFunc = competition_round_sprite_main;
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
        sprite->mainFunc = competition_timer_seconds_sprite_main;
        sprintf(sprite->text, "000");
        sprite = create_linked_sprite(sprite);
        if (sprite != NULL)
        {
            sprite->x = -4.0f;
            sprite->fontId = FONT_NUM_12x19;
            sprite->textAlign = ALIGN_CB;
            sprite->unk4C = 0.19f;
            sprite->mainFunc = competition_timer_100th_seconds_sprite_main;
            sprintf(sprite->text, ":00");
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
            show_competition_player_hud(i);
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->bmpId = BMP_COM_frame;
        sprite->unk4C = 400.0f;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 80.0f;
        sprite->drawFunc = competition_separator_sprite_draw;
        strcpy(sprite->text, "separate");
    }
}

float force_lbl_802F4EA0() { return 10.666667f; }

static void competition_round_sprite_main(s8 *arg0, struct Sprite *sprite)
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

static void competition_separator_sprite_draw(struct Sprite *sprite)
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

static void lbl_8007A774(s8 *arg0, struct Sprite *sprite)
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

static void lbl_8007A7B8(s8 *arg0, struct Sprite *sprite)
{
    if (gamePauseStatus & 4)
        sprite->unk78 &= ~1;
    else
        sprite->unk78 |= 1;
}

static void competition_timer_seconds_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    sprintf(sprite->text, "%03d", infoWork.timerCurr / 60);
    if (infoWork.timerCurr <= 0)
    {
        sprite->unk40 *= 1.01f;
        sprite->unk44 *= 1.01f;
        sprite->opacity *= 0.88f;
        if (sprite->opacity < 0.05f)
            *arg0 = 0;
    }
}

static void competition_timer_100th_seconds_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int val = 100.0 * ((float)(infoWork.timerCurr % 60) / 60.0);

    sprintf(sprite->text, ":%02d", val);
    if (infoWork.timerCurr <= 0)
    {
        sprite->unk40 *= 1.01f;
        sprite->unk44 *= 1.01f;
        sprite->opacity *= 0.88f;
        if (sprite->opacity < 0.05f)
            *arg0 = 0;
    }
}

static void normal_timer_seconds_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int time = (int)func_80049E7C(lbl_80250A68.unk0[lbl_80250A68.unk14], lbl_80250A68.unk10) + 1;
    sprintf(sprite->text, "%03d", time / 60);
}

static void normal_timer_100th_seconds_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int time = (int)func_80049E7C(lbl_80250A68.unk0[lbl_80250A68.unk14], lbl_80250A68.unk10) + 1;
    int val = 100.0 * ((float)(time % 60) / 60.0);
    sprintf(sprite->text, ":%02d", val);
}

static const float lbl_80118870[] =
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

static void banana_count_sprite_draw(struct Sprite *sprite)
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
    g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
    g_set_text_other_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));
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

        temp_f28 = lbl_80118870[29 - r22->unk4];
        temp_f4 = temp_f28 - 1.0;
        x = sprite->x - 20.0f - i * 20 - 10.0f - (10.0f * temp_f4);
        y = sprite->y - 10.0f - (10.0f * temp_f4);
        temp_r23 = 510.0f * temp_f4;

        g_set_text_pos(x, y);
        g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, temp_r23, 0));
        func_80071B2C(temp_f28, temp_f28);
        func_80072AC0("%d", phi_r3);
    }
    func_80071A8C();
}

static void lbl_8007ADF4(struct Sprite *sprite)
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
    g_set_text_other_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));

    r22 = lbl_80292C00_alias + sprite->unk48 * 3;
    for (i = 0; i < 3; i++, r22++)
    {
        if ((infoWork.flags & 0x1000) != 0)
        {
            x = sprite->x - 20.0f - i * 20 - 10.0f;
            y = sprite->y - 10.0f;
            g_set_text_pos(x, y);
            g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, 0, 0));
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
        g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, temp_r23, 0));
        func_80071B2C(temp_f28, temp_f28);
        func_80072AC0("%d", phi_r3);
    }
    func_80071A8C();
}

static void lbl_8007B134(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    struct TPLTextureHeader *texHdr;
    int phi_r5;

    phi_r5 = (modeCtrl.playerCount > 1) ? ballInfo[sprite->unk48].playerId : 3;
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

static void score_value_sprite_main(s8 *arg0, struct Sprite *sprite)
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
    sprintf(sprite->text, "%d", r31->unk0);
}

static void lbl_8007B490(s8 *arg0, struct Sprite *sprite)
{
    sprite->bmpId = func_80081CFC(lbl_80292D18.unk0, lbl_80292D18.unk8, playerCharacterSelection[sprite->unk48]);
}

static void normal_ball_speed_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    float len = mathutil_vec_len(&currentBallStructPtr->vel);
    float mph = ((216000.0 * len) / 1000.0) / 1.6093;

    if (mph > 999.0)
        mph = 999.0f;
    sprintf(sprite->text, "%3.0f", mph);
}

static void competition_ball_speed_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    float len = mathutil_vec_len(&ballInfo[sprite->unk48].vel);
    float mph = ((216000.0 * len) / 1000.0) / 1.6093;

    if (mph > 999.0)
        mph = 999.0f;
    sprintf(sprite->text, "%3.0f", mph);
}

static void bananas_left_sprite_main(s8 *arg0, struct Sprite *sprite)
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
    sprite->unkC = 255;
    sprite->unkD = 255;
    sprite->unkE = 255.0f * phi_f1;
}

static void bonus_floor_sprite_main(s8 *arg0, struct Sprite *arg1)
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

static void final_floor_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (modeCtrl.levelSet == 0)
    {
        sprite->unkC = 0;
        sprite->unkD = 208;
        sprite->unkE = 0;
    }
    else if (modeCtrl.levelSet == 1)
    {
        sprite->unkC = 0;
        sprite->unkD = 0;
        sprite->unkE = 224;
    }
    else
    {
        sprite->unkC = 255;
        sprite->unkD = 192;
        sprite->unkE = 0;
    }

    if (sprite->counter >= 150)
    {
        float temp_f3 = 64.0f * mathutil_sin((sprite->counter - 150) << 9);

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

static void final_floor_sprite_draw(struct Sprite *sprite)
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
    g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
    g_set_text_other_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));

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
                g_draw_char(text[i]);
        }
    }
    func_80071A8C();
}

static void go_sprite_main(s8 *, struct Sprite *);
static void go_sprite_draw(struct Sprite *);

void hud_show_go_banner(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unk4C = (modeCtrl.unk30 == 1) ? 0.1 : 0.05;
        sprite->unkC = 0;
        sprite->unkD = 128;
        sprite->unkE = 255;
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

static void go_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int t = sprite->unk48 - sprite->counter;

    if (t < 15)
    {
        int temp_r0 = 15 - t;

        sprite->opacity = t * 0.06666;
        sprite->unk70 = 0;
        sprite->unk71 = sprite->unk70;
        sprite->unk72 = sprite->unk70;
        sprite->unk40 = 1.0 + temp_r0 * 0.1;
        sprite->unk44 = 1.0 + temp_r0 * -0.04;
    }
    else if (t < 30)
    {
        int temp_r29 = (t - 15) * 0x888;

        sprite->opacity = 1.0f;
        sprite->unk70 = ((unpausedFrameCounter >> 1) & 1) * 192;
        sprite->unk71 = sprite->unk70;
        sprite->unk72 = sprite->unk70;
        sprite->unk40 = 1.0 - mathutil_sin(temp_r29) * 0.5;
        sprite->unk44 = 1.0 + mathutil_sin(temp_r29);
    }
    else if (t < 45)
    {
        int temp_r29_2 = (t - 30) * 0x888;

        sprite->opacity = 1.0f;
        sprite->unk70 = ((unpausedFrameCounter >> 1) & 1) * 192;
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

static void go_sprite_draw(struct Sprite *sprite)
{
    int i;
    int t;
    int temp_r23;
    int temp_r3;
    float phi_f29;
    float phi_f2;
    float phi_f30_2;

    t = sprite->unk48 - sprite->counter;
    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B1C(sprite->unk4C);
    func_80071B50(sprite->unk74);
    func_80071B40(sprite->opacity);
    g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
    g_set_text_other_color(RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0));
    func_80071B2C(1.5f * sprite->unk40, 1.5f * sprite->unk44);
    temp_r23 = 1.5f * (36.0f * sprite->unk40);
    temp_r3 = 1.5f * (32.0f * sprite->unk44);

    for (i = 0; i < 2; i++)
    {
        if (t < 15)
        {
            phi_f30_2 = (i == 0) ? -320.0f : 320.0f;
            phi_f29 = phi_f30_2 * mathutil_sin((0xF - t) * 0x444);
            phi_f2 = 0.0f;
        }
        else if (t < 30)
        {
            phi_f29 = 0.0f;
            phi_f2 = 0.0f;
        }
        else if (t < 45)
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
        g_draw_char((i == 0) ? 0x47 : 0x4F);
    }
}

static void goal_sprite_draw(struct Sprite *);
static void warp_sprite_main(s8 *, struct Sprite *);
static void goal_sprite_main(s8 *, struct Sprite *);

void hud_show_goal_banner(int duration)
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
        sprite->counter = duration;
        sprite->unk48 = duration;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = goal_sprite_main;
        sprite->drawFunc = goal_sprite_draw;
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
            sprite->unkD = 192;
            sprite->unkE = 255;
            sprite->unk40 = 1.0f;
            sprite->unk44 = 0.6f;
            sprite->fontId = FONT_ASC_32x32;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = duration;
            sprite->unk48 = duration;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = warp_sprite_main;
            sprintf(sprite->text, "JUMP TO FLOOR %d", infoWork.unk20);
        }
    }
}

static void goal_sprite_draw(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    float phi_f30;
    int temp_r29;
    int t;
    int temp_r6;
    int phi_r7;
    int i;

    params.bmpId = BMP_NML_game_goal;
    params.z = sprite->unk4C;
    params.rotation = sprite->unk68;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;

    t = sprite->unk48 - sprite->counter;
    if (t < 30)
    {
        phi_f30 = t * 0.016666;
        phi_r7 = 0;
    }
    else if (t < 45)
    {
        phi_f30 = 1.0f;
        phi_r7 = mathutil_sin((t - 30) * 0x888) * 255.0f;
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

    if (t >= 210)
    {
        sprite->x = 561.0f;
        sprite->y = 420.0f;
        sprite->unk40 = 0.5f;
        sprite->unk44 = sprite->unk40;
    }
    else if (t >= 180)
    {
        temp_r6 = t - 180;
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

    if (t < 30)
    {
        struct {float x; float y;} spC[4] =
        {
            { -1,  1 },
            {  1,  1 },
            {  1, -1 },
            { -1, -1 },
        };
        float temp_f29 = (30 - t) * 0.03333;

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

static void lbl_8007CDCC(s8 *, struct Sprite *);

static void warp_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    s32 t;
    struct Sprite *warpSprite;

    t = sprite->unk48 - sprite->counter;
    if (t < 30)
        sprite->opacity = 0.03333 * t;
    else if (sprite->counter <= 15)
        sprite->opacity = 0.06666 * sprite->counter;
    else
        sprite->opacity = 1.0f;
    sprite->x = 320.0f + 20.0f * mathutil_sin(t << 9);
    sprite->y = 240.0f + 10.0f * mathutil_sin((t << 8) + 0x4000);

    if (t % 2 == 1)
    {
        warpSprite = create_sprite();
        if (warpSprite != NULL)
        {
            warpSprite->x = sprite->x;
            warpSprite->y = sprite->y;
            warpSprite->unk4C = sprite->unk4C + 0.1;
            warpSprite->unkC = sprite->unkC;
            warpSprite->unkD = sprite->unkD;
            warpSprite->unkE = sprite->unkE;
            warpSprite->unk70 = 0;
            warpSprite->unk71 = 96;
            warpSprite->unk72 = 127;
            warpSprite->unk40 = sprite->unk40;
            warpSprite->unk44 = sprite->unk44;
            warpSprite->fontId = FONT_ASC_32x32;
            warpSprite->textAlign = ALIGN_CC;
            warpSprite->counter = 16;
            warpSprite->opacity = 0.5f;
            warpSprite->unk74 |= 0x1000;
            warpSprite->mainFunc = lbl_8007CDCC;
            sprintf(warpSprite->text, "JUMP TO FLOOR %d", infoWork.unk20);
        }
    }

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

static void lbl_8007CDCC(s8 *arg0, struct Sprite *sprite)
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

static void fall_out_sprite_main(s8 *, struct Sprite *);
static void show_bonus_finish_banner(void);

void hud_show_fallout_banner(int duration)
{
    struct Sprite *sprite;

    if (!(infoWork.flags & 0x40))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 320.0f;
            sprite->y = 240.0f;
            sprite->unk4C = 0.05f;
            sprite->unkC = 255;
            sprite->unkD = 140;
            sprite->unkE = 0;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = duration;
            sprite->unk48 = duration;
            sprite->unk74 |= 0x1000;
            sprite->mainFunc = fall_out_sprite_main;
            strcpy(sprite->text, "FALL OUT");
        }
    }
    else
        show_bonus_finish_banner();
}

static void fall_out_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    s32 temp_r0_3;
    s32 t;

    t = sprite->unk48 - sprite->counter;

    if (modeCtrl.gameType != GAMETYPE_MINI_TARGET && t == 90)
        g_play_sound(0xC);

    if (t < 30)
    {
        sprite->opacity = 0.03333 * t;
        sprite->y = 240 - (30 - t) * 6;
    }
    else if (t < 60)
    {
        sprite->opacity = 1.0f;
        sprite->y = 240.0f - 32.0f * mathutil_sin((t - 30) * 0x444);
    }
    else if (t < 90)
    {
        sprite->opacity = 1.0f;
        sprite->y = 240.0f - 8.0f * mathutil_sin((t - 60) * 0x444);
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
        if (t >= 120)
        {
            sprite->x = 496.0f;
            sprite->y = 420.0f;
            sprite->unk40 = 0.5f;
            sprite->unk44 = sprite->unk40;
        }
        else if (t >= 90)
        {
            temp_r0_3 = t - 90;
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

static void time_over_sprite_main(s8 *, struct Sprite *);

void hud_show_time_over_banner(int duration)
{
    struct Sprite *sprite;

    if (!(infoWork.flags & 0x40))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 320.0f;
            sprite->y = 240.0f;
            sprite->unk4C = 0.05f;
            sprite->unkC = 255;
            sprite->unkD = 140;
            sprite->unkE = 0;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = duration;
            sprite->unk48 = duration;
            sprite->mainFunc = time_over_sprite_main;
            strcpy(sprite->text, "TIME OVER");
        }
    }
    else
        show_bonus_finish_banner();
}

static void time_over_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    s32 t = sprite->unk48 - sprite->counter;

    if (t < 30)
    {
        sprite->opacity = t * 0.03333;
        sprite->y = 240 - (30 - t) * 6;
    }
    else if (t < 60)
    {
        sprite->opacity = 1.0f;
        sprite->y = 240.0f - 32.0f * mathutil_sin((t - 30) * 0x444);
    }
    else if (t < 90)
    {
        sprite->opacity = 1.0f;
        sprite->y = 240.0f - 8.0f * mathutil_sin((t - 60) * 0x444);
    }
    else if (sprite->counter <= 15)
        sprite->opacity = sprite->counter * 0.06666;
    else
        sprite->opacity = 1.0f;

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

static void bonus_finish_sprite_main(s8 *, struct Sprite *);

void hud_show_perfect_banner(int unused)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unk4C = 0.05f;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = 0;
        sprite->unk48 = 1;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = bonus_finish_sprite_main;
        strcpy(sprite->text, "PERFECT");
    }
}

static void show_bonus_finish_banner(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unk4C = 0.05f;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = 0;
        sprite->unk48 = 0;
        sprite->unkC = 255;
        sprite->unkD = 128;
        sprite->unkE = 0;
        sprite->unk40 = 0.8f;
        sprite->unk44 = 0.8f;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = bonus_finish_sprite_main;
        strcpy(sprite->text, "BONUS FINISH");
    }
}

static void bonus_finish_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    float temp_f3 = sprite->counter / 30.0f;

    sprite->unk44 = sprite->unk40 = temp_f3 * 0.8 + (1.0 - temp_f3) * 5.0;
    if (sprite->counter == 29)
        g_play_sound((sprite->unk48 != 0) ? 0x48 : 0x45);
    if (sprite->counter < 30)
        sprite->counter++;
}

static void continue_sprite_main(s8 *, struct Sprite *);
static void num_continues_sprite_main(s8 *, struct Sprite *);
static void continue_yes_no_sprite_main(s8 *, struct Sprite *);

void hud_show_continue_interface(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 50.0f;
        sprite->unkC = 255;
        sprite->unkD = 200;
        sprite->unkE = 0;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->unk48 = 0;
        sprite->opacity = 0.0f;
        sprite->mainFunc = continue_sprite_main;
        strcpy(sprite->text, "CONTINUE?");
    }
    if (func_800676C0() == 0)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 493.0f;
            sprite->y = 93.0f;
            sprite->unkC = 0;
            sprite->unkD = 0;
            sprite->unkE = 0;
            sprite->fontId = FONT_JAP_24x24_2P;
            sprite->textAlign = ALIGN_CC;
            sprite->unk4C = 0.11f;
            sprite->opacity = 0.0f;
            sprite->mainFunc = num_continues_sprite_main;
            sprite->unk74 |= 0x200000;
            strcpy(sprite->text, "h/NOKORI");
        }
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 490.0f;
            sprite->y = 90.0f;
            sprite->unkC = 255;
            sprite->unkD = 200;
            sprite->unkE = 0;
            sprite->fontId = FONT_JAP_24x24_2P;
            sprite->textAlign = ALIGN_CC;
            sprite->unk4C = 0.1f;
            sprite->opacity = 0.0f;
            sprite->mainFunc = num_continues_sprite_main;
            sprite->unk74 |= 0x200000;
            strcpy(sprite->text, "h/NOKORI");
        }
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 160.0f;
        sprite->y = 260.0f;
        sprite->unkC = 140;
        sprite->unkD = 255;
        sprite->unkE = 255;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->unk48 = 1;
        sprite->counter = 0;
        sprite->opacity = 0.0f;
        sprite->mainFunc = continue_yes_no_sprite_main;
        strcpy(sprite->text, "YES");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 480.0f;
        sprite->y = 260.0f;
        sprite->unkC = 255;
        sprite->unkD = 160;
        sprite->unkE = 190;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->unk48 = 0;
        sprite->counter = 0;
        sprite->opacity = 0.0f;
        sprite->mainFunc = continue_yes_no_sprite_main;
        strcpy(sprite->text, "NO");
    }
}

static void continue_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL
     && modeCtrl.playerCount == 1
     && func_80066868() == 0)
    {
        sprite->opacity += 0.1 * -sprite->opacity;
        return;
    }
    if (sprite->unk48 == 0)
    {
        g_play_sound(0x47);
        sprite->unk48 = 1;
    }
    sprite->opacity += 0.1 * (1.0 - sprite->opacity);
}

static void num_continues_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL
     && modeCtrl.playerCount == 1
     && func_80066868() == 0)
        sprite->opacity += 0.1 * -sprite->opacity;
    else
        sprite->opacity += 0.1 * (1.0 - sprite->opacity);
    sprintf(sprite->text, "a/Continue(s):%d", get_num_continues());
}

static void continue_yes_no_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->unk48 == 1)
    {
        sprite->unkC = 140;
        sprite->unkD = 255;
        sprite->unkE = 255;
    }
    else
    {
        sprite->unkC = 255;
        sprite->unkD = 160;
        sprite->unkE = 190;
    }

    if (modeCtrl.levelSetFlags & 4)
    {
        sprite->opacity += 0.1 * (1.0 - sprite->opacity);
        if (sprite->unk48 == modeCtrl.unk10)
        {
            u8 phi_r0;

            sprite->x += 0.1 * (320.0 - sprite->x);
            sprite->y += 0.1 * (200.0 - sprite->y);
            switch (unpausedFrameCounter & 7)
            {
            case 0:
            case 7:
                phi_r0 = 0;
                break;
            case 1:
            case 6:
                phi_r0 = 79;
                break;
            case 2:
            case 5:
                phi_r0 = 143;
                break;
            default:
                phi_r0 = 207;
                break;
            }
            sprite->unk70 = phi_r0;
            sprite->unk71 = phi_r0;
            sprite->unk72 = phi_r0;
        }
        else
        {
            sprite->y += sprite->counter;
            sprite->counter++;
            sprite->unkC /= 2;
            sprite->unkD /= 2;
            sprite->unkE /= 2;
            sprite->unk70 = 0;
            sprite->unk71 = 0;
            sprite->unk72 = 0;
        }
        return;
    }

    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL
     && modeCtrl.playerCount == 1
     && func_80066868() == 0)
    {
        sprite->opacity += 0.1 * -sprite->opacity;
        return;
    }

    sprite->opacity += 0.1 * (1.0 - sprite->opacity);
    if (sprite->unk48 == modeCtrl.unk10)
    {
        float phi_f1 = 2.0 * ((float)((unpausedFrameCounter + 36) % 60) / 59.0);
        int temp_r0_2;

        if (phi_f1 > 1.0)
            phi_f1 = 2.0 - phi_f1;
        temp_r0_2 = phi_f1 * 255.0f;
        sprite->unk70 = temp_r0_2;
        sprite->unk71 = temp_r0_2;
        sprite->unk72 = temp_r0_2;
    }
    else
    {
        sprite->unkC /= 2;
        sprite->unkD /= 2;
        sprite->unkE /= 2;
        sprite->unk70 = 0;
        sprite->unk71 = 0;
        sprite->unk72 = 0;
    }
}

static void game_over_player_num_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->counter > 90)
    {
        sprite->x += sprite->unk48;
        sprite->unk48 += 1;
    }
    else if (sprite->counter <= 30)
    {
        sprite->y += sprite->unk48;
        sprite->unk48 += 2;
    }
    sprite->counter--;
    if (sprite->counter <= 0)
        *arg0 = 0;
}

void hud_show_game_over_banner(int duration)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unkC = 255;
        sprite->unkD = 0;
        sprite->unkE = 32;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = duration;
        sprite->unk48 = duration;
        sprite->unk4C = 0.008f;
        sprite->mainFunc = game_over_sprite_main;
        strcpy(sprite->text, "GAME OVER");
    }
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount > 1)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            int phi_r0 = (modeCtrl.playerCount > 1) ? currentBallStructPtr->playerId : 3;

            sprite->x = 785.0f;
            sprite->y = 310.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->unkC = lbl_801C14F0[phi_r0 * 3 + 0];
            sprite->unkD = lbl_801C14F0[phi_r0 * 3 + 1];
            sprite->unkE = lbl_801C14F0[phi_r0 * 3 + 2];
            sprite->unk48 = -0x1E;
            sprite->counter = 120;
            sprite->unk4C = 0.008f;
            sprite->mainFunc = game_over_player_num_sprite_main;
            sprintf(sprite->text, "%dP", currentBallStructPtr->playerId + 1);
        }
    }
}

static void game_over_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int t = sprite->unk48 - sprite->counter;

    if (t < 30)
        sprite->opacity = t * 0.03333;
    else
        sprite->opacity = 1.0f;

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

static void oneup_sprite_main(s8 *, struct Sprite *);

void hud_show_1up_banner(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 16;
        sprite->x = 320.0f;
        sprite->y = 300.0f;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->opacity = 0.0f;
        sprite->counter = arg0 + 30;
        sprite->unk48 = arg0;
        sprite->mainFunc = oneup_sprite_main;
        strcpy(sprite->text, "1UP");
    }
}

static void oneup_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    s32 t = sprite->unk48 - sprite->counter;
    float x;

    if (t >= 0)
    {
        if (t == 0)
        {
            func_8002B5C8(0xA00E);
            SoundRevID(0xE, 0x64);
            SoundChoID(0xE, 0x64);
        }
        if (t < 30)
        {
            sprite->opacity = t * 0.03333;
            x = 320.0f * mathutil_sin((t * 0x222) + 0x4000);
        }
        else
        {
            if (sprite->counter < 30)
            {
                sprite->opacity = sprite->counter * 0.03333;
                x = -320.0f * mathutil_sin((sprite->counter * 0x222) + 0x4000);
            }
            else
            {
                sprite->opacity = 1.0f;
                x = 0.0f;
            }
        }
        sprite->x = 320.0f + x;

        {
            int sp14[] =
            {
                  0,   0,   0,
                255,   0,   0,
                255, 255, 255,
                255, 255,   0,
            };
            int temp_r8 = ((t >> 1) % 4) * 3;

            sprite->unkC = sp14[temp_r8 + 0];
            sprite->unkD = sp14[temp_r8 + 1];
            sprite->unkE = sp14[temp_r8 + 2];
        }

    }

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

static void hurry_up_sprite_main(s8 *, struct Sprite *);

void hud_show_hurry_up_banner(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 20;
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unk4C = 0.05f;
        sprite->fontId = FONT_ASC_32x32;
        sprite->textAlign = ALIGN_CC;
        sprite->unkC = 255;
        sprite->unkD = 128;
        sprite->unkE = 0;
        sprite->counter = 30;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = hurry_up_sprite_main;
        strcpy(sprite->text, "HURRY UP!");
    }
}

static void hurry_up_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (--sprite->counter == 0)
    {
        *arg0 = 0;
        return;
    }
    sprite->opacity = (sprite->counter & 1) ? 1.0 : 0.0;
    if (sprite->unk48 == 0)
    {
        sprite->x += 4.0 * ((rand() / 32767.0f) - 0.5);
        sprite->y += 2.0 * ((rand() / 32767.0f) - 0.5);
        return;
    }
    sprite->x = find_sprite_with_tag(20)->x + sprite->unk48;
    sprite->y = find_sprite_with_tag(20)->y;
}

static void replay_sprite_main(s8 *, struct Sprite *);

void show_replay_text(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = 0;
        sprite->x = 760.0f;
        sprite->y = 460.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_RB;
        sprite->counter = arg0 - 17;
        sprite->mainFunc = replay_sprite_main;
        strcpy(sprite->text, "REPLAY");
    }
    sprite = find_sprite_with_tag(14);
    if (sprite != NULL)
        sprite->unk48 = 0xF;
}

static void replay_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    sprite->counter--;
    if (sprite->counter < 0 || !(infoWork.flags & 0x10))
    {
        sprite->x += 8.0f;
        if (sprite->x > 760.0f)
            *arg0 = 0;
    }
    else
    {
        if (sprite->x > 624.0f)
        {
            sprite->x -= 12.0f;
            if (sprite->x < 624.0f)
                sprite->x = 624.0f;
        }
    }
}

static char *rankTitles[] =
{
    "THE GREATEST!",
    "SECOND BEST",
    "THIRD BEST",
    "FOURTH BEST",
    "FIFTH BEST",
};

static s16 nameEntryElemsX[] = { 72, 72, 48, 600, 528 };

static void name_entry_info_sprite_main(s8 *, struct Sprite *);

void hud_show_name_entry_info(int rank, int unused)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = nameEntryElemsX[0] - 320;
        sprite->y = 450.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_LB;
        sprite->unk48 = 0;
        sprite->mainFunc = name_entry_info_sprite_main;
        sprintf(sprite->text, "NAME ENTRY");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = nameEntryElemsX[1] - 320;
        sprite->y = 450.0f;
        sprite->fontId = FONT_ASC_8x16;
        sprite->textAlign = ALIGN_LT;
        if (rank < 0)
            sprintf(sprite->text, "OUT OF RANK");
        else
            sprintf(sprite->text, "YOU ARE %s", rankTitles[rank]);
        sprite->unk48 = 1;
        sprite->mainFunc = name_entry_info_sprite_main;
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = nameEntryElemsX[2] - 320;
        sprite->y = 448.0f;
        sprite->fontId = FONT_ICON_LV;
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.5f;
        sprite->unk44 = 0.5f;
        sprite->unk48 = 2;
        sprite->mainFunc = name_entry_info_sprite_main;
        sprintf(sprite->text, "%d", modeCtrl.levelSet + 4);
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = nameEntryElemsX[3] + 320;
        sprite->y = 456.0f;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_RB;
        sprite->unk48 = 3;
        sprite->mainFunc = name_entry_info_sprite_main;
        sprintf(sprite->text, "00");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = nameEntryElemsX[4] + 320;
        sprite->y = 450.0f;
        sprite->unkC = 255;
        sprite->unkD = 200;
        sprite->unkE = 0;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CT;
        sprite->unk48 = 4;
        sprite->mainFunc = name_entry_info_sprite_main;
        sprintf(sprite->text, "TIME LIMIT");
    }
}

static void name_entry_info_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int temp_r5 = sprite->unk48;
    int x = sprite->x;
    int temp_r3 = nameEntryElemsX[temp_r5];

    if (x < temp_r3)
    {
        x += 10.666666666666666;
        if (x > temp_r3)
            x = temp_r3;
    }
    else if (x > temp_r3)
    {
        x -= 10.666666666666666;
        if (x < temp_r3)
            x = temp_r3;
    }
    sprite->x = x;
    if (temp_r5 == 3)
    {
        if (infoWork.timerCurr > 600)
        {
            sprite->unkC = 0;
            sprite->unkD = 128;
            sprite->unkE = 255;
        }
        else if (infoWork.timerCurr > 180)
        {
            sprite->unkC += 0.05 * (255 - sprite->unkC);
            sprite->unkD += 0.05 * (200 - sprite->unkD);
            sprite->unkE += 0.05 * -sprite->unkE;
        }
        else
        {
            sprite->unkC += 0.05 * (255 - sprite->unkC);
            sprite->unkD += 0.05 * -sprite->unkD;
            sprite->unkE += 0.05 * (32 - sprite->unkE);
        }
        sprintf(sprite->text, "%d", infoWork.timerCurr / 60);
    }
}

void hud_show_name_entry_banner(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unkC = 0;
        sprite->unkD = 255;
        sprite->unkE = 160;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CB;
        sprite->counter = arg0;
        sprite->unk48 = arg0;
        sprite->mainFunc = ready_sprite_main;
        strcpy(sprite->text, "NAME");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unkC = 0;
        sprite->unkD = 255;
        sprite->unkE = 160;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CT;
        sprite->counter = arg0;
        sprite->unk48 = arg0;
        sprite->mainFunc = ready_sprite_main;
        strcpy(sprite->text, "ENTRY");
    }
    g_play_sound(4);
}

// Unused credits-related data. Possibly left over from arcade version?

char string_CONGRATULATIONS[] = "CONGRATULATIONS";
char string_THANK__YOU__FOR__PLAYING[] = "THANK  YOU  FOR  PLAYING";

struct {u32 unk0; char *name; u32 unk8;} lbl_801C1E0C[] =
{
    { 0x00000000, "Staff",                 0x00000000,},
    { 0x00230000, "Chief Programmer",      0x00000000 },
    { 0x00370000, "Hisashi Endo",          0x01000000 },
    { 0x00500000, "Programmers",           0x00000000 },
    { 0x00640000, "Jun Tokuhara",          0x01000000 },
    { 0x00730000, "Yoshinori Suzuki",      0x01000000 },
    { 0x00820000, "Eiji Takaki",           0x01000000 },
    { 0x009B0000, "Chief Designer",        0x00000000 },
    { 0x00AF0000, "Junichi Yamada",        0x01000000 },
    { 0x00C80000, "Designers",             0x00000000 },
    { 0x00DC0000, "Mika Kojima",           0x01000000 },
    { 0x00EB0000, "Yukinobu Arikawa",      0x01000000 },
    { 0x00FA0000, "Yukio Oda",             0x01000000 },
    { 0x01090000, "Mari Sasaki",           0x01000000 },
    { 0x01220000, "Sound Design",          0x00000000 },
    { 0x01360000, "Yoshiyuki Kadooka",     0x01000000 },
    { 0x01450000, "Chamy",                 0x01000000 },
    { 0x01540000, "Hiroyuki Hamada",       0x01000000 },
    { 0x01630000, "Hidenori Shoji",        0x01000000 },
    { 0x01720000, "Sakae Osumi",           0x01000000 },
    { 0x018B0000, "Monkey Voice",          0x00000000 },
    { 0x019F0000, "Kaoru Morota",          0x01000000 },
    { 0x01AE0000, "Konami Yoshida",        0x01000000 },
    { 0x01BD0000, "Rio Natsuki",           0x01000000 },
    { 0x01D60000, "Mechatronics",          0x00000000 },
    { 0x01EA0000, "Masao Yoshimoto",       0x01000000 },
    { 0x01F90000, "Akihiko Kohno",         0x01000000 },
    { 0x02080000, "Kazuhiro Nojo",         0x01000000 },
    { 0x02170000, "Hiroki Koyama",         0x01000000 },
    { 0x02260000, "Masahito Yanase",       0x01000000 },
    { 0x02350000, "Seiji Ishii",           0x01000000 },
    { 0x02440000, "Yutaka Yokoyama",       0x01000000 },
    { 0x02530000, "Eiji Inoue",            0x01000000 },
    { 0x026C0000, "Publicity",             0x00000000 },
    { 0x02800000, "Masae Otoshi",          0x01000000 },
    { 0x02990000, "Cooperation",           0x00000000 },
    { 0x02AD0000, "Dole Food Company,Inc", 0x01000000 },
    { 0x02BC0000, "Dole Japan,Ltd.",       0x01000000 },
    { 0x02F50000, "Special Thanks",        0x00000000 },
    { 0x03090000, "HAIKYO",                0x01000000 },
    { 0x03180000, "STURM Co.,Ltd.",        0x01000000 },
    { 0x03270000, "T's music Co.,Ltd.",    0x01000000 },
    { 0x03600000, "Producer & Director",   0x00000000 },
    { 0x03740000, "Toshihiro Nagoshi",     0x01000000 },
};

u32 lbl_801C201C[] =
{
    0x00000000,
    0x00000000,
    0x00000000,
    0x02D00205,
    0x023201E0,
    0x0200033B,
    0x02050256,
    0x01E00300,
    0x03C00202,
    0x014001E0,
    0x00000474,
    0x02000140,
    0x01E00100,
    0xFFFFFFFF,
    0xFFFFFFFF,
    0xFF000000,
};

char string_ENDING_PICTURE[] = "ENDING PICTURE";

struct
{
    s16 unk0;
    float unk4;
    float unk8;
    s8 unkC;
} lbl_801C206C[] =
{
    { 200,  6, 0.05,  6 },
    { 450, 15, 0.04,  4 },
    {  50,  3, 0.06, 10 },
    { 450,  9, 0.04,  8 },
    {  50,  6, 0.05,  6 },
};

static void lbl_8007EC80(s8 *, struct Sprite *);

void func_8007EB2C(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        int var = arg0 % 5;

        sprite->x = 640.0f;
        sprite->y = lbl_801C206C[var].unk0;
        sprite->unkC = 255;
        sprite->unkD = 255;
        sprite->unkE = 255;
        sprite->fontId = FONT_ASC_32x32;
        sprite->textAlign = ALIGN_LC;
        sprite->unk40 = lbl_801C206C[var].unk4;
        sprite->unk44 = 0.75 * sprite->unk40;
        sprite->opacity = lbl_801C206C[var].unk8;
        sprite->unk48 = lbl_801C206C[var].unkC;
        sprite->unk4C = 0.1 - 0.001 * sprite->unk40;
        sprite->unk74 |= 0x1000;
        sprite->mainFunc = lbl_8007EC80;
        if (modeCtrl.levelSetFlags & 0x10)
            sprintf(sprite->text, "MASTER STAGE");
        else
            sprintf(sprite->text, "EXTRA STAGE");
    }
}

static void lbl_8007EC80(s8 *arg0, struct Sprite *sprite)
{
    sprite->x -= sprite->unk48;
}

static void lbl_8007EF0C(s8 *, struct Sprite *);

void func_8007ECB8(void)
{
    struct Sprite *sprite;
    int i;
    struct Viewport *vp;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->bmpId = BMP_COM_frame;
        sprite->unk4C = 400.0f;
        sprite->unk40 = 1.0f;
        sprite->unk44 = 80.0f;
        sprite->drawFunc = competition_separator_sprite_draw;
        strcpy(sprite->text, "separate");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->bmpId = BMP_NML_game_result_e3;
        sprintf(sprite->text, "result");
    }

    for (i = 0; i < modeCtrl.playerCount; i++)
    {
        vp = &cameraInfo[i].sub28.vp;
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 640.0 * (vp->left + 0.5 * vp->width) - 40.0;
            sprite->y = 480.0 * (vp->top + 0.5 * vp->height) - 69.0;
            sprite->type = SPRITE_TYPE_BITMAP;
            sprite->bmpId = BMP_COM_banana_01;
            sprite->textAlign = ALIGN_CC;
            sprite->unk40 = 0.3f;
            sprite->unk44 = 0.3f;
            sprintf(sprite->text, "result banana.pic");
        }
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 640.0 * (vp->left + 0.5 * vp->width) + 20.0;
            sprite->y = 480.0 * (vp->top + 0.5 * vp->height) - 65.0;
            sprite->fontId = FONT_JAP_24x24_2;
            sprite->textAlign = ALIGN_CC;
            sprite->unkC = 255;
            sprite->unkD = 255;
            sprite->unkE = 0;
            sprite->unk48 = i;
            sprite->mainFunc = lbl_8007EF0C;
            sprintf(sprite->text, "000");
        }
    }
}

static void lbl_8007EF0C(s8 *arg0, struct Sprite *sprite)
{
    sprintf(sprite->text, "%03d", ballInfo[sprite->unk48].unk138);
}

static void lbl_8007F060(s8 *, struct Sprite *);
static void lbl_8007F1A4(struct Sprite *);

void func_8007EF50(struct Ball *ball)
{
    struct Sprite *sprite;
    struct Viewport *vp;

    if (ball->rank == 0 || ball->rank >= 4)
        return;

    vp = &cameraInfo[ball->playerId].sub28.vp;
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 640.0 * (vp->left + 0.5 * vp->width);
        sprite->y = 480.0 * (vp->top + 0.5 * vp->height) - 25.0;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->textAlign = ALIGN_CC;
        sprite->unk48 = ball->rank;
        sprite->counter = 15;
        sprite->bmpId = BMP_COM_ASCII;
        sprite->mainFunc = lbl_8007F060;
        sprite->drawFunc = lbl_8007F1A4;
        strcpy(sprite->text, "ranking");
    }
}

static void lbl_8007F060(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->counter > 0)
        sprite->counter--;
    if (sprite->bmpId == BMP_COM_ASCII)
    {
        sprite->unk40 = 1.0 + 0.2f * sprite->counter;
        sprite->unk44 = sprite->unk40;
        sprite->opacity = 0.066666 * (15.0f - sprite->counter);
        if (sprite->counter == 0)
            sprite->bmpId = BMP_COM_arrow;
    }
    else
    {
        if (sprite->counter == 0)
        {
            if (rand() / 32767.0f < 0.03)
                sprite->counter = 15;
        }
        else
        {
            sprite->unk70 = mathutil_sin(sprite->counter * 0x888);
            sprite->unk71 = sprite->unk70;
            sprite->unk72 = sprite->unk70;
        }
    }
}

struct Struct801C20EC
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
};

static struct Struct801C20EC lbl_801C20EC[] =
{
    {   0,   0, 160,  48 },
    {   0,   0, 160,  48 },
    {   0,  48, 128,  48 },
    { 160,   0,  88,  48 },
};

float lbl_801C212C[] = { -36.0f, 0.0f, 36.0f };  // unused

static void lbl_8007F1A4(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    struct TPLTextureHeader *texHdr;
    struct Struct801C20EC *temp_r6;

    params.bmpId = BMP_NML_game_rank;
    params.rotation = sprite->unk68;
    params.alpha = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & 0xFFFFFFF0) | 0xA;
    params.color1 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, (u8)(sprite->opacity * 255.0f));
    params.color2 = RGBA(sprite->unk70, sprite->unk71, sprite->unk72, 0);
    temp_r6 = &lbl_801C20EC[sprite->unk48];
    texHdr = &bitmapGroups[(params.bmpId >> 8) & 0xFF].tpl->texHeaders[params.bmpId & 0xFF];
    params.x = sprite->x;
    params.y = sprite->y;
    params.z = sprite->unk4C;
    params.u1 = temp_r6->unk0 / texHdr->width;
    params.v1 = temp_r6->unk4 / texHdr->height;
    params.u2 = params.u1 + temp_r6->unk8 / texHdr->width;
    params.v2 = params.v1 + temp_r6->unkC / texHdr->height;
    params.zoomX = sprite->unk40 * (params.u2 - params.u1);
    params.zoomY = sprite->unk44 * (params.v2 - params.v1);
    draw_naomi_sprite(&params);
}

static void clear_score_sprite_draw(struct Sprite *);
static void warp_bonus_sprite_draw(struct Sprite *);
static void time_bonus_sprite_draw(struct Sprite *);
static void floor_score_sprite_draw(struct Sprite *);

void hud_show_goal_score_info(int clearScore, int floorScore, u32 arg2)
{
    struct Sprite *sprite;
    int y = 128;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 214.0f;
        sprite->y = 128.0f;
        if (arg2 & 8)
        {
            sprite->unkC = 255;
            sprite->unkD = 96;
            sprite->unkE = 96;
        }
        else if (arg2 & 4)
        {
            sprite->unkC = 96;
            sprite->unkD = 255;
            sprite->unkE = 96;
        }
        else
        {
            sprite->unkC = 96;
            sprite->unkD = 96;
            sprite->unkE = 255;
        }
        sprite->fontId = FONT_ASC_16x16;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = 360;
        sprite->unk48 = 360;
        sprite->mainFunc = goal_sprite_main;
        sprite->drawFunc = clear_score_sprite_draw;
        sprintf(sprite->text, " %5d", clearScore);
    }
    if (arg2 & 2)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            y += 20;
            sprite->x = 214.0f;
            sprite->y = y;
            sprite->fontId = FONT_ASC_16x16;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = 360;
            sprite->unk48 = 360;
            sprite->mainFunc = goal_sprite_main;
            sprite->drawFunc = warp_bonus_sprite_draw;
            if (infoWork.unk22 < 10)
                sprintf(sprite->text, "   X %d", infoWork.unk22);
            else
                sprintf(sprite->text, "  X %d", infoWork.unk22);
        }
    }
    if (arg2 & 1)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            y += 20;
            sprite->x = 214.0f;
            sprite->y = y;
            sprite->fontId = FONT_ASC_16x16;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = 360;
            sprite->unk48 = 360;
            sprite->mainFunc = goal_sprite_main;
            sprite->drawFunc = time_bonus_sprite_draw;
            sprintf(sprite->text, "   X 2");
        }
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 214.0f;
        sprite->y = y + 24;
        sprite->fontId = FONT_ASC_16x16;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = 360;
        sprite->unk48 = 360;
        sprite->mainFunc = goal_sprite_main;
        sprite->drawFunc = floor_score_sprite_draw;
        sprintf(sprite->text, "%6d", floorScore);
    }
}

static int func_8007F61C(struct Sprite *sprite, int t, float arg2)
{
    float phi_f1;
    int phi_r31;

    if (t < 60)
        return 0;
    if (t < 90)
    {
        phi_f1 = 0.03333 * (t - 60) * arg2;
        phi_r31 = (t - 90) * 5;
    }
    else if (sprite->counter <= 15)
    {
        phi_f1 = 0.06666 * sprite->counter * MIN(0.2 + arg2, 1.0);
        phi_r31 = 0;
    }
    else
    {
        phi_f1 = (double)arg2;
        phi_r31 = 0;
    }
    func_80071B40(phi_f1);
    func_80071B2C(sprite->unk40, sprite->unk44);
    g_set_text_pos(sprite->x - 190.0f + phi_r31, sprite->y - 10.0f);
    return 1;
}

static int lbl_8007F754_inline2(struct Sprite *sprite, int t, float arg2)
{
    float phi_f1;

    if (t < 120)
        return 0;
    if (t < 150)
        phi_f1 = 0.03333 * (t - 120) * arg2;
    else if (sprite->counter <= 15)
        phi_f1 = 0.06666 * sprite->counter * MIN(0.2 + arg2, 1.0);
    else
        phi_f1 = (double)arg2;
    func_80071B40(phi_f1);
    return 1;
}

char string_result_menu[] = "result menu";  // unused
char string_result_mask[] = "result mask";  // unused
char *lbl_801C2178[] = { "k/RITORAI", "h/SETTEIHENNKOU", "h/SHUURYOU" };  // unused

static void clear_score_sprite_draw(struct Sprite *sprite)
{
    int t;
    float f31;

    func_80071A8C();
    g_set_font(sprite->fontId);
    t = sprite->unk48 - sprite->counter;
    f31 = 1.0f;
    if (func_8007F61C(sprite, t, f31))
    {
        g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
        g_draw_text("CLEAR SCORE : ");
    }
    if (lbl_8007F754_inline2(sprite, t, f31))
    {
        g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));
        g_draw_text(sprite->text);
    }
    func_80071A8C();
}

static void warp_bonus_sprite_draw(struct Sprite *sprite)
{
    int t;
    float f31;

    func_80071A8C();
    g_set_font(sprite->fontId);
    t = sprite->unk48 - sprite->counter - 10;
    f31 = 1.0f;
    if (func_8007F61C(sprite, t, f31))
    {
        g_set_text_fill_color(RGBA(0, 192, 255, 0));
        g_draw_text(" WARP BONUS   ");
    }
    if (lbl_8007F754_inline2(sprite, t, f31))
    {
        g_set_text_fill_color(RGBA(0, 192, 255, 0));
        g_draw_text(sprite->text);
    }
    func_80071A8C();
}

static void time_bonus_sprite_draw(struct Sprite *sprite)
{
    int t;
    float f31;

    func_80071A8C();
    g_set_font(sprite->fontId);
    t = sprite->unk48 - sprite->counter - 20;
    f31 = 1.0f;
    if (func_8007F61C(sprite, t, f31))
    {
        g_set_text_fill_color(RGBA(255, 255, 0, 0));
        g_draw_text(" TIME BONUS   ");
    }
    if (lbl_8007F754_inline2(sprite, t, f31))
    {
        g_set_text_fill_color(RGBA(255, 255, 0, 0));
        g_draw_text(sprite->text);
    }
    func_80071A8C();
}

static void floor_score_sprite_draw(struct Sprite *sprite)
{
    int t;
    int r31;
    float f31;

    func_80071A8C();
    g_set_font(sprite->fontId);
    t = sprite->unk48 - sprite->counter - 60;
    f31 = 1.0f;
    r31 = MAX(mathutil_sin(t * 0x280) * 255.0f, 0.0f);
    if (func_8007F61C(sprite, t, f31))
    {
        g_set_text_fill_color(RGBA(255, 128, 0, 0));
        g_set_text_other_color(RGBA(r31, r31, r31, 0));
        g_draw_text("FLOOR SCORE : ");
    }
    if (lbl_8007F754_inline2(sprite, t, f31))
    {
        g_set_text_fill_color(RGBA(255, 128, 0, 0));
        g_set_text_other_color(RGBA(r31, r31, r31, 0));
        g_draw_text(sprite->text);
    }
    func_80071A8C();
}

static void goal_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (!(gamePauseStatus & 0xA) && --sprite->counter <= 0)
        *arg0 = 0;
}

static void best_score_sprite_main(s8 *, struct Sprite *);
static void best_score_sprite_draw(struct Sprite *);
static void lbl_800800D4(struct Sprite *);

void g_show_practice_mode_score_info(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 8;
        sprite->x = 98.0f;
        sprite->y = 66.0f;
        sprite->fontId = FONT_ASC_20x20P;
        sprite->textAlign = ALIGN_LC;
        sprite->unk40 = 0.8f;
        sprite->unk44 = 0.8f;
        sprite->unkC = 255;
        sprite->unkD = 192;
        sprite->unkE = 0;
        sprite->unk48 = arg0;
        sprite->counter = 0;
        sprite->mainFunc = best_score_sprite_main;
        sprite->drawFunc = best_score_sprite_draw;
        sprintf(sprite->text, "BEST SCORE");
    }
    else
        printf("NULL\n");

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 96.0f;
        sprite->y = 92.0f;
        sprite->fontId = FONT_NUM_22x22;
        sprite->textAlign = ALIGN_LC;
        sprite->unk40 = 0.8f;
        sprite->unk44 = 0.8f;
        sprite->unkC = 255;
        sprite->unkD = 192;
        sprite->unkE = 0;
        sprite->unk48 = lbl_802F1CAC;
        sprite->drawFunc = lbl_800800D4;
        sprintf(sprite->text, "%d", sprite->unk48);
    }
    else
        printf("NULL\n");
}

static void best_score_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    switch (sprite->unk48)
    {
    case 1:
        SoundPitch(func_8002B610(0xA11D), 0);
        g_play_music(0x1E, 8);
        sprite->unk48 = 2;
        sprite->counter = 120;
        break;
    case 2:
        if (--sprite->counter == 0)
        {
            sprite->unk48 = 3;
            g_play_music(0x64, 8);
        }
        break;
    }
}

static void best_score_sprite_draw(struct Sprite *sprite)
{
    int i;
    u32 r28;

    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B40(sprite->opacity);
    func_80071B2C(sprite->unk40, sprite->unk44);
    r28 = RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0);
    for (i = 0; i < 10; i++)
    {
        int phi_r4 = sprite->unk48 > 0 && (unpausedFrameCounter >> 4) % 2 == ((i > 4) ? i + 1 : i) % 2;

        g_set_text_fill_color(phi_r4 ? RGBA(255, 0, 0, 0) : r28);
        g_set_text_pos(sprite->x + 20.0 * i * sprite->unk40 + ((i > 4) ? -8 : 0), sprite->y);
        g_draw_char(sprite->text[i]);
    }
}

static void lbl_800800D4(struct Sprite *sprite)
{
    struct Sprite *temp_r3;
    void (*drawFunc)(struct Sprite *);

    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B40(sprite->opacity);
    func_80071B2C(sprite->unk40, sprite->unk44);
    g_set_text_fill_color(RGBA(sprite->unkC, sprite->unkD, sprite->unkE, 0));

    drawFunc = sprite->drawFunc;
    sprite->drawFunc = NULL;
    calc_sprite_bounds(sprite, &sprite->left, &sprite->top, &sprite->right, &sprite->bottom);
    sprite->drawFunc = drawFunc;

    g_set_text_pos(sprite->left, sprite->top);
    g_draw_text(sprite->text);

    temp_r3 = find_sprite_with_tag(8);
    if (temp_r3 != NULL && temp_r3->unk48 > 0)
    {
        float temp_f31 = 1.0 - __fabs(mathutil_sin(temp_r3->counter << 9));
        u32 temp_r30 = (1.0 - __fabs(mathutil_sin((temp_r3->counter << 9) + 0x4000))) * 255.0;

        func_80071B1C(0.09f);
        g_set_text_other_color(RGBA(temp_r30, temp_r30, temp_r30, 0));
        g_set_text_pos(sprite->left + (17.6 * strlen(sprite->text)), sprite->top);
        func_80071B2C(0.8 + (0.3 * temp_f31), 0.8 + (0.4 * temp_f31));
        func_80072AC0("+%d", lbl_802F1CAC - sprite->unk48);
    }
}

#pragma dont_inline on
static float func_800802E0(u16 arg0)
{
    float temp_f2;

    if (arg0 > 60)
    {
        float f4 = __fabs(mathutil_sin(((60 - ((u32)arg0 % 60)) & 0x3F) << 8));
        return 0.20000000298023224 * (1.0 - __fabs(1.0f - f4 * 2.0f));
    }
    if (arg0 < 15)
    {
        temp_f2 = (u32)(15 - arg0) / 15.0f;
        if (temp_f2 < 0.5f)
            return 0.2f - temp_f2;
        else
            return (-0.3f + temp_f2) - 0.5f;
    }
    else
    {
        temp_f2 = 1.0f - (u32)(arg0 - 15) / 45.0f;
        temp_f2 *= 0.2f;
        return temp_f2;
    }
}
#pragma dont_inline reset

static void lbl_800803E8(s8 *arg0, struct Sprite *sprite)
{
    float temp_f0;
    u8 dummy[8];

    if (infoWork.timerCurr <= 480)
    {
        if (infoWork.timerCurr > 420)
            sprite->opacity = 1.0f - ((infoWork.timerCurr - 420) / 60.0f);
        else
            sprite->opacity = 1.0f;
        temp_f0 = func_800802E0(infoWork.timerCurr) + 1.0f;
        sprite->unk40 = temp_f0;
        sprite->unk44 = temp_f0;
        if (infoWork.timerCurr < 240)
        {
            sprite->unk48 += 40.0f - (infoWork.timerCurr * 40.0f) / 240.0f;
            sprite->unkD = __abs(255 - (sprite->unk48 % 510));
            sprite->unkE = sprite->unkD;
            if (sprite->unkE < 128)
                sprite->unkE = 128;
            sprite->unkE = (sprite->unkE - 128) * 2.0f;
        }
        if (infoWork.timerCurr <= 0)
            *arg0 = 0;
    }
}

float force_lbl_802F50C0() { return 0.19699999690055847f; }

#ifdef NONMATCHING
static void lbl_800805AC(s8 *arg0, struct Sprite *sprite)
{
    s16 *asdf = (s16 *)&sprite->unk48;
    float temp_f0;
    float temp_f6;
    s16 temp_r7;
    s16 temp_r8;

    sprite->opacity *= 0.95f;
    sprite->unk40 *= 1.01f;
    sprite->unk44 *= 1.01f;
    temp_r7 = asdf[0];
    temp_r8 = asdf[1];
    temp_f0 = sprite->opacity;
    temp_f6 = temp_f0 * temp_f0;
    sprite->x += 0.9f * temp_r7 * temp_f6;
    sprite->y += (0.97f * temp_r8 * temp_f6) + (1.0f - temp_f6);
    asdf[0] = temp_r7;
    asdf[1] = temp_r8;
    if (sprite->opacity < 0.005f)
        *arg0 = 0;
}
#else
const float lbl_802F50C4 = 0.94999998807907104f;
const float lbl_802F50C8 = 0.97000002861022949f;
const float lbl_802F50CC = 0.89999997615814209f;
static asm void lbl_800805AC(s8 *arg0, struct Sprite *sprite)
{
    nofralloc
#include "../asm/nonmatchings/lbl_800805AC.s"
}
#pragma peephole on
#endif

static s16 bombPartBitmapIDs[] =
{
    BMP_NML_icon_bomb_part_a,
    BMP_NML_icon_bomb_part_b,
    BMP_NML_icon_bomb_part_c,
    BMP_NML_icon_bomb_part_d,
    BMP_NML_icon_bomb_part_e,
    BMP_NML_icon_bomb_part_f,
    BMP_NML_icon_bomb_part_g,
    BMP_NML_icon_bomb_part_h,
    BMP_NML_icon_bomb_part_i,
    BMP_NML_icon_bomb_part_j
};

static float lbl_801C21E4[] = { 7.0f, 16.0f, 26.0f, 48.0f,  0.0f,  9.0f, 55.0f, 12.0f, 33.0f, 71.0f };
static float lbl_801C220C[] = { 9.0f,  0.0f,  0.0f, 4.0f,  24.0f, 16.0f, 23.0f, 63.0f, 56.0f, 69.0f };

static void lbl_80080680(s8 *arg0, struct Sprite *sprite)
{
    u8 dummy[8];
    float temp_f0;
    float temp_f24;
    float temp_f26;
    float temp_f30;
    float temp_f29;
    struct Sprite *temp_r3;
    u32 i;

    if (infoWork.timerCurr <= 600)
    {
        if (infoWork.timerCurr > 0)
        {
            temp_f0 = 1.0f + func_800802E0(infoWork.timerCurr);
            sprite->unk40 = temp_f0;
            sprite->unk44 = temp_f0;
            return;
        }
        temp_f24 = sprite->x;
        temp_f26 = sprite->y;
        temp_f30 = sprite->unk40;
        temp_f29 = sprite->unk44;
        *arg0 = 0;
        g_debug_set_cursor_pos(5, 5);
        for (i = 0; i < 10; i++)
        {
            temp_r3 = create_sprite();
            if (temp_r3 == NULL)
                return;
            temp_r3->type = SPRITE_TYPE_BITMAP;
            temp_r3->tag = 2;
            temp_r3->x = temp_f24 - 44.0f + lbl_801C21E4[i];
            temp_r3->y = temp_f26 - 44.0f + lbl_801C220C[i];
            temp_r3->fontId = FONT_ASCII;
            temp_r3->bmpId = bombPartBitmapIDs[i];
            temp_r3->textAlign = ALIGN_LT;
            temp_r3->unk4C = 0.2f;
            temp_r3->mainFunc = lbl_800805AC;
            temp_r3->unk40 = temp_f30;
            temp_r3->unk44 = temp_f29;
            ((s16 *)&temp_r3->unk48)[0] = 1.2f * (lbl_801C21E4[i] - 30.0f);
            ((s16 *)&temp_r3->unk48)[1] = 1.2f * (lbl_801C220C[i] - 20.0f);
            sprintf(temp_r3->text, "bomb_scat%d.pic", i);
        }
    }
}

void func_8008083C(float arg8, float arg9)
{
    struct Sprite *sprite;
    float x;
    float y;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->tag = 2;
        sprite->x = arg8;
        sprite->y = arg9;
        sprite->fontId = FONT_ASCII;
        sprite->bmpId = BMP_NML_icon_bombtimer;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 0.2f;
        sprite->mainFunc = lbl_80080680;
        sprintf(sprite->text, "timer.pic");
        y = sprite->y;
        x = sprite->x;
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->type = SPRITE_TYPE_BITMAP;
            sprite->tag = 2;
            sprite->x = x;
            sprite->y = y;
            sprite->fontId = FONT_ASCII;
            sprite->bmpId = BMP_NML_icon_bomb_hibi;
            sprite->textAlign = ALIGN_CC;
            sprite->unk4C = 0.197f;
            sprite->opacity = 0.0f;
            sprite->mainFunc = lbl_800803E8;
            sprite->unk48 = 0;
            sprintf(sprite->text, "hibi");
        }
    }
}
