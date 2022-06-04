#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "course.h"
#include "hud.h"
#include "info.h"
#include "input.h"
#define MATHUTIL_SIN_INT_PARAM
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"
#include "textbox.h"

u8 playerNumColors[] =
{
    255,   0,   0,  // 1P
     44, 101, 255,  // 2P
    251, 255,  44,  // 3P
     44, 255,  87,  // 4P
};

float lbl_801C14FC[] = { -128, 240, 240, 240, 240, 608, 608 };

float lbl_802F201C;
float lbl_802F2018;
float lbl_802F2014;
float lbl_802F2010;

static void press_start_texbox_callback(struct TextBox *a) {}

static void pause_menu_sprite_draw(struct Sprite *);

void hud_show_pause_menu(void)
{
    struct Sprite *sprite = create_sprite();

    if (sprite != NULL)
    {
        sprite->tag = SPRITE_TAG_PAUSE_MENU;
        sprite->x = 315.0f;
        sprite->y = lbl_801C14FC[0];
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->fontId = FONT_JAP_24x24_2P;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 0.005f;
        sprite->userVar = 1;
        sprite->opacity = 0.5f;
        sprite->mulR = 0;
        sprite->mulG = 0;
        sprite->mulB = 0;
        sprite->scaleX = 0.0f;
        sprite->scaleY = 0.0f;
        sprite->counter = 1;
        sprite->drawFunc = pause_menu_sprite_draw;
        strcpy(sprite->text, "pause menu");
    }
}

static void game_over_sprite_main(s8 *, struct Sprite *);

void func_80075E1C(int unused, struct Sprite *sprite)
{
    struct Sprite *gameOver;

    sprite->y += 0.075 * (lbl_801C14FC[sprite->userVar] - sprite->y);
    if (sprite->counter > 0)
    {
        sprite->scaleY = sprite->scaleX;
        sprite->counter--;
    }
    else
    {
        sprite->scaleY += 0.1 * (sprite->scaleX - sprite->scaleY);
    }
    if (sprite->userVar >= 2 && sprite->userVar != 6)
    {
        if (sprite->opacity < 0.99)
            sprite->opacity += 0.01;
    }
    if (sprite->userVar == 2)
    {
        if (sprite->mulR < 250.0)
            sprite->mulR += 5;
        sprite->mulG = sprite->mulR;
        sprite->mulB = sprite->mulR;
    }
    if (sprite->userVar == 4)
    {
        sprite->userVar = 5;
        gameOver = create_sprite();
        if (gameOver != NULL)
        {
            gameOver->x = 320.0f;
            gameOver->y = 240.0f;
            gameOver->mulR = 255;
            gameOver->mulG = 0;
            gameOver->mulB = 32;
            gameOver->fontId = FONT_ASC_72x64;
            gameOver->textAlign = ALIGN_CC;
            gameOver->counter = 60;
            gameOver->userVar = 60;
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

    // same as above, but with "View stage" replaced with "Save replay"
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
    params.addColor = 0;
    params.unk30 = -1;
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0xA;

    if (pauseMenuState.itemCount >= 4)
    {
        if (pauseMenuState.itemCount == 6)
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
    params.scaleX = 1.0f;
    params.scaleY = 1.0f;
    params.opacity = 1.0f;
    params.mulColor = RGBA(255, 255, 255, (int)(sprite->opacity * 255.0f));
    draw_naomi_sprite(&params);

    params.bmpId = u_get_monkey_bitmap_id(0, 0, playerCharacterSelection[pauseMenuState.playerId]);
    params.x = sprite->x - 110.0f;
    params.y = sprite->y + sprite->scaleY + 12.0f;
    params.z = sprite->unk4C;
    params.scaleX = 0.5f;
    params.scaleY = 0.325f;
    params.opacity = 1.0f;
    params.mulColor = RGBA(255, 255, 255, (int)(sprite->opacity * 255.0f));
    draw_naomi_sprite(&params);

    menuType = pauseMenuState.menuType;
    if (pauseMenuState.unk4 & 4)
        menuType += 5;  // make it so that "View stage" is replaced with "Save replay"
    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    func_80071B50(0x220000);
    temp_r16 = (u32)((globalFrameCounter >> 2) & 1) * 255;
    temp_r16 = RGBA(temp_r16, temp_r16, temp_r16, 0);

    for (i = 0; i < pauseMenuState.itemCount; i++)
    {
        float phi_f22;
        float x;
        float y;
        char text[32];

        func_80071B1C((i == pauseMenuState.selection) ? sprite->unk4C - 0.001 : sprite->unk4C);

        if (pauseMenuState.itemCount == 6)
            phi_f22 = i * 30 - 90;
        else if (pauseMenuState.itemCount == 5)
            phi_f22 = i * 30 - 72;
        else if (pauseMenuState.itemCount == 4)
            phi_f22 = i * 36 - 66;
        else
            phi_f22 = i * 36 - 48 + (3 - pauseMenuState.itemCount) * 18;

        strcpy(text, pauseMenus[menuType][i]);
        x = sprite->x - 48.0f;
        y = sprite->y + phi_f22;
        set_text_pos(3.0f + x, 3.0f + y);
        set_text_mul_color(RGBA(32, 32, 0, 0));
        set_text_add_color(RGBA(0, 0, 0, 0));
        u_draw_text(text);
        set_text_pos(x, y);
        set_text_mul_color((i == pauseMenuState.selection) ? RGBA(255, 255, 0, 0) : RGBA(128, 128, 0, 0));
        set_text_add_color((((pauseMenuState.unk4) & 1) && i == pauseMenuState.selection) ? temp_r16 : 0);
        u_draw_text(text);

        // Display billiards guide toggle
        if (menuType == PAUSEMENU_CONT_GUIDE_HOW_EXIT && i == 1)
        {
            u32 temp_r3 = (1.0 - __fabs(mathutil_sin(globalFrameCounter << 9))) * 255.0;
            u32 flashColor = RGBA(temp_r3, temp_r3, temp_r3, 0);

            strcpy(text, "ON");
            x += 96.0f;
            set_text_pos(3.0f + x, 3.0f + y);
            set_text_mul_color(RGBA(32, 32, 0,0));
            set_text_add_color(RGBA(0, 0, 0, 0));
            u_draw_text(text);
            set_text_pos(x, y);
            if (pauseMenuState.unk4 & 8)
                set_text_mul_color(RGBA(192, 192, 0, 0));
            else
                set_text_mul_color(RGBA(128, 128, 0, 0));
            if (i == pauseMenuState.selection && (pauseMenuState.unk4 & 8))
                set_text_add_color(flashColor);
            else
                set_text_add_color(RGBA(0, 0, 0, 0));
            u_draw_text(text);

            strcpy(text, "OFF");
            x += 50.0f;
            set_text_pos(3.0f + x, 3.0f + y);
            set_text_mul_color(RGBA(32, 32, 0,0));
            set_text_add_color(RGBA(0, 0, 0, 0));
            u_draw_text(text);
            set_text_pos(x, y);
            if (!(pauseMenuState.unk4 & 8))
                set_text_mul_color(RGBA(192, 192, 0, 0));
            else
                set_text_mul_color(RGBA(128, 128, 0, 0));
            if (i == pauseMenuState.selection && !(pauseMenuState.unk4 & 8))
                set_text_add_color(flashColor);
            else
                set_text_add_color(RGBA(0, 0, 0, 0));
            u_draw_text(text);
        }
        if (i == pauseMenuState.selection)
            sprite->scaleX = phi_f22;
    }

    params.bmpId = BMP_COM_white_mask8x8;
    params.x = 320.1f;
    params.y = 240.1f;
    params.z = (sprite->userVar == 2) ? 0.001 : sprite->unk4C + 0.002;
    params.scaleX = 80.0f;
    params.scaleY = 60.0f;
    params.opacity = sprite->opacity;
    params.mulColor = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (u8)(sprite->opacity * 255.0f));
    draw_naomi_sprite(&params);
}

void hud_show_press_start_textbox(int a)
{
    struct TextBox tbox;

    memset(&tbox, 0, sizeof(tbox));
    tbox.style = (a == 2 || a == 3) ? TEXTBOX_STYLE_CENTER_UP : TEXTBOX_STYLE_THIN_BORDER;
    tbox.x = 320;
    tbox.y = (a == 2 || a == 3) ? 361 : 410;
    tbox.numRows = 1;
    tbox.callback = press_start_texbox_callback;
    textbox_set_properties(0, 21, &tbox);
    if (a == 3)
        textbox_add_text(0, "b/Select using the c/0xffffff/p/BUTTON_A/c/0x000000/ Button!");
    else
        textbox_add_text(0, "b/Press Start");
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

static void sega_logo_sprite_main(s8 *a, struct Sprite *sprite);

void u_logo_plus_sprite_something(void)
{
    struct Sprite *sprite;

    // presented by
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->tag = SPRITE_TAG_LOGO_PLUS;
        sprite->x = 320.0f;
        sprite->y = 115.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 300.0f;
        sprite->bmpId = BMP_ADV_adv_logo_plus;
        strcpy(sprite->text, "logo plus");
    }

    // SEGA logo
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
        sprite->mainFunc = sega_logo_sprite_main;
        sprite->flags |= 0x40000;
        strcpy(sprite->text, "logo");
    }
}

static void lbl_80076AC0(struct Sprite *);

static void sega_logo_sprite_main(s8 *a, struct Sprite *sprite)
{
    struct Sprite *logoPlus = find_sprite_with_tag(SPRITE_TAG_LOGO_PLUS);

    if (sprite->counter <= 393)
        sprite->x -= 0.0f;  // does nothing
    else if (sprite->counter <= 408)
        sprite->x -= 10.0f + (6.0f * mathutil_sin((sprite->counter - 393) * 0x444));
    else if (sprite->counter <= 480)
        sprite->x -= 16.0f;

    if (sprite->counter >= 378 && sprite->counter <= 408)
    {
        sprite->scaleX = 1.0 - (0.7 * mathutil_sin((sprite->counter - 378) * 0x444));
        sprite->scaleY = 1.0 + (0.7 * mathutil_sin((sprite->counter - 378) * 0x444));
        if (logoPlus != NULL)
            logoPlus->opacity = 0.0333 * (408 - sprite->counter);
    }

    if (sprite->counter == 480)
    {
        sprite->x = 320.0f;
        sprite->bmpId = BMP_ADV_logo_av256;
        sprite->scaleX = 1.0f;
        sprite->scaleY = 1.0f;
        sprite->unk4C = 100.0f;
        if (logoPlus != NULL)
        {
            logoPlus->bmpId = BMP_ADV_logo_plus256x40;
            logoPlus->userVar = 5;
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
    int r5 = sprite->userVar;

    params.bmpId = sprite->bmpId;
    params.x = sprite->x + (r5 % 2 == 1 ? 128 : -128);
    params.y = sprite->y + (sprite->userVar == 0 ? 50 : 0);
    params.z = sprite->unk4C;
    params.u1 = 0.0f;
    params.v1 = 0.15625 * r5;
    params.u2 = 1.0f;
    params.v2 = 0.15625 + 0.15625 * r5;
    params.scaleX = sprite->scaleX * (params.u2 - params.u1);
    params.scaleY = sprite->scaleY * 0.15625;
    params.rotation = sprite->rotation;
    params.opacity = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0xA;
    params.mulColor = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (u8)(sprite->opacity * 255.0f));
    params.addColor = 0;
    draw_naomi_sprite(&params);
}

static void copyright_sprite_main(s8 *, struct Sprite *);

void hud_show_adv_copyright_info(int a)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 37;
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
    if (sprite->userVar == -1 && sprite->opacity > 0.0f)
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
        sprite->userVar = arg0;
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

    sprite->opacity = 1.0 - (float)sprite->counter / (float)sprite->userVar;

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

    if (sprite->counter > 0.25 * (float)sprite->userVar)
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
    if (modeCtrl.courseFlags & 4)
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
    params.scaleX = 1.0f;
    params.scaleY = 1.0f;
    params.opacity = 1.0f;
    params.rotation = 0;
    params.mulColor = RGBA(255, 255, 255, (u8)(255.0f * sprite->opacity));
    params.addColor = 0;
    params.unk30 = -1;

    params.bmpId = BMP_ADV_adv_title_bg;
    params.x = 320.1f;
    params.y = 240.1f;
    params.z = 0.004 + sprite->unk4C;
    params.opacity = sprite->opacity;
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0xA;
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
        params.opacity = sprite->opacity;
        params.flags = (sprite->flags & 0xFFFFFFF0) | 0x200000 | 5;
        draw_naomi_sprite(&params);

        params.bmpId = letter->bmpId;
        params.x = letter->x;
        params.y = letter->y + offset->pos;
        params.z = sprite->unk4C;
        params.opacity = 1.0f;
        params.flags = (sprite->flags & 0xFFFFFFF0) | 0x200000 | 5;
        draw_naomi_sprite(&params);

        params.bmpId = BMP_ADV_adv_title_spr_gawa;
        params.z = sprite->unk4C - 0.002;
        params.opacity = 1.0 - __fabs(0.2 * mathutil_sin(512.0f * offset->pos));
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
        params.opacity = sprite->opacity;
        params.rotation = 0;
        params.flags = (sprite->flags & 0xFFFFFFF0) | 0xA;
        draw_naomi_sprite(&params);

        params.bmpId = letter->bmpId;
        params.x = 44.0f + (letter->x + offset->pos);
        params.y = 44.0f + letter->y;
        params.z = sprite->unk4C;
        params.opacity = 1.0f;
        params.rotation = -256.0f * offset->pos;
        params.flags = (sprite->flags & 0xFFFFFFF0) | 0x200000 | 0xA;
        draw_naomi_sprite(&params);

        params.bmpId = BMP_ADV_adv_title_mnk_gawa;
        params.z = sprite->unk4C - 0.002;
        params.opacity = 1.0 - __fabs(0.2 * mathutil_sin(512.0f * offset->pos));
        params.rotation = 0;
        draw_naomi_sprite(&params);
    }

    params.bmpId = BMP_ADV_adv_title_tm;
    params.x = 482.0f;
    params.y = 338.0f;
    params.z = sprite->unk4C;
    params.opacity = lbl_802F2014;
    params.rotation = 0;
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0x200000 | 5;
    draw_naomi_sprite(&params);

    params.bmpId = lbl_80118AC8[0];
    params.x = 320.0f;
    params.y = 331.0f;
    params.z = sprite->unk4C - 0.004;
    params.scaleX = lbl_802F2010 * 0.7;
    params.scaleY = lbl_802F2010 * 0.7 * 0.65;
    params.opacity = 1.0f;
    params.rotation = 1024.0f * mathutil_sin(unpausedFrameCounter << 8);
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0x200000 | 0xA;
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
        sprite->flags |= 0x200000;
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
        sprite->flags |= 0x200000;
        sprite->mainFunc = options_sprite_main;
    }
}

static void gamestart_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if ((modeCtrl.courseFlags & 4) && textBoxes[0].state == 10)
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
            sprite->mulR += 0.1 * (255 - sprite->mulR);
            sprite->mulG += 0.1 * (128 - sprite->mulG);
            sprite->mulB += 0.1 * -sprite->mulB;
            sprite->scaleX = 1.0f;
            sprite->scaleY = 1.0f;
            strcpy(sprite->text, "p/SANNKAKU_R/ a/Game Start p/SANNKAKU_L/");
        }
        else
        {
            sprite->mulR += 0.1 * -sprite->mulR;
            sprite->mulG += 0.1 * -sprite->mulG;
            sprite->mulB += 0.1 * -sprite->mulB;
            sprite->opacity *= 0.5;
            sprite->scaleX = 0.8f;
            sprite->scaleY = 0.8f;
            strcpy(sprite->text, "a/Game Start");
        }
    }
}

static void options_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if ((modeCtrl.courseFlags & 4) && textBoxes[0].state == 10)
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
            sprite->mulR += 0.1 * (255 - sprite->mulR);
            sprite->mulG += 0.1 * (128 - sprite->mulG);
            sprite->mulB += 0.1 * -sprite->mulB;
            sprite->scaleX = 1.0f;
            sprite->scaleY = 1.0f;
            strcpy(sprite->text, "p/SANNKAKU_R/ a/Options p/SANNKAKU_L/");
        }
        else
        {
            sprite->mulR += 0.1 * -sprite->mulR;
            sprite->mulG += 0.1 * -sprite->mulG;
            sprite->mulB += 0.1 * -sprite->mulB;
            sprite->opacity *= 0.5;
            sprite->scaleX = 0.8f;
            sprite->scaleY = 0.8f;
            strcpy(sprite->text, "a/Options");
        }
    }
}

void hud_show_title_screen_monkey_sprite(void)
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
        sprite->drawFunc = monkey_sprite_draw;
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

void u_show_adv_ready_hud(void)
{
    struct Sprite *sprite;
    struct Ball *ball;
    u8 filler[16];

    ball = currentBallStructPtr;
    func_8000D5B8();
    hud_show_bomb(320.0f, 68.0f);

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
        sprite->scaleX = 0.2f;
        sprite->scaleY = 0.2f;
        sprintf(sprite->text, "banana.pic");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 536.0f;
        sprite->y = 24.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CC;
        sprite->mulR = 170;
        sprite->mulG = 168;
        sprite->mulB = 0;
        sprite->addR = 56;
        sprite->addG = 56;
        sprite->addB = 0;
        sprintf(sprite->text, "BANANA(S)");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 518.0f;
        sprite->y = 47.0f;
        sprite->fontId = FONT_NUM_22x22;
        sprite->textAlign = ALIGN_CC;
        sprite->mulR = 170;
        sprite->mulG = 168;
        sprite->mulB = 0;
        sprite->addR = 56;
        sprite->addG = 56;
        sprite->addB = 0;
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
        sprite->mulR = 170;
        sprite->mulG = 168;
        sprite->mulB = 0;
        sprite->addR = 56;
        sprite->addG = 56;
        sprite->addB = 0;
        sprintf(sprite->text, "000 100");
    }

    lbl_80292C00_alias[0].unk4 = 0;
    lbl_80292C00_alias[1].unk4 = 0;
    lbl_80292C00_alias[2].unk4 = 0;
    lbl_80292C00_alias[0].unk0 = ball->bananas % 10;
    lbl_80292C00_alias[1].unk0 = ball->bananas / 10;
    lbl_80292C00_alias[2].unk0 = ball->bananas / 100;

    if (infoWork.flags & INFO_FLAG_BONUS_STAGE)
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

static void adv_demo_banana_sprite_main(s8 *, struct Sprite *);

// Creates the banana sprites which appear above the monkeys' heads in speech bubbles
void hud_create_adv_demo_banana_sprite(int index)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = SPRITE_TAG_ADV_DEMO_BANANA_1 + index;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->x = textBoxes[index + 1].x;
        sprite->y = textBoxes[index + 1].y;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = (f32) (0.05 + (0.01 * (f64) (index + 1)));
        sprite->bmpId = (index == 2) ? BMP_COM_banana_01 : BMP_COM_banana_10;
        sprite->opacity = 0.0f;
        sprite->scaleX = (index == 2) ? 0.7 : 0.8;
        sprite->scaleY = (index == 2) ? 0.5 : 0.6;
        sprite->counter = 60;
        sprite->userVar = index;
        sprite->mainFunc = adv_demo_banana_sprite_main;
        strcpy(sprite->text, "banana");
    }
}

static void adv_demo_banana_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->counter == -1)
    {
        *arg0 = 0;
        return;
    }
    if (sprite->counter > 0)
        sprite->counter--;
    sprite->x = textBoxes[sprite->userVar + 1].x;
    sprite->y = textBoxes[sprite->userVar + 1].y - ((sprite->userVar == 2) ? 54 : 66);
    if (sprite->counter < 15)
        sprite->opacity = 1.0f - sprite->counter / 15.0f;
}

static void eieipu_sprite_main(s8 *, struct Sprite *);
static void eieipu_sprite_draw(struct Sprite *);

void u_show_eieipu_sprite(int arg0)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = SPRITE_TAG_EIEIPU;
        sprite->type = SPRITE_TYPE_BITMAP;
        sprite->textAlign = ALIGN_CC;
        sprite->unk4C = 10.0f;
        sprite->userVar = arg0;
        sprite->counter = 0;
        sprite->flags |= 0x40000;
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
    params.opacity = 1.0f;
    params.rotation = 0;
    params.mulColor = RGBA(255, 255, 255, (u8)(255.0f * sprite->opacity));
    params.addColor = 0;
    params.unk30 = -1;
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0xA;

    temp_f29 = 0.5 * mathutil_sin((sprite->counter << 9) + 0x4000);

    switch (sprite->userVar)
    {
    case 0:
        for (i = 0; i < 13; i++)
        {
            params.bmpId = BMP_COM_banana_10;
            params.x = lbl_801C17FC[i].unk0;
            params.y = lbl_801C17FC[i].unk4;
            params.scaleX = 1.0 + ((i % 2 == 0) ? temp_f29 : -temp_f29);
            params.scaleY = 1.0 + ((i % 2 == 0) ? temp_f29 : -temp_f29);
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
            params.scaleX = 1.0f;
            params.scaleY = 1.0f;
            draw_naomi_sprite(&params);
        }
        break;
    case 2:
        for (i = 0; i < 13; i++)
        {
            params.bmpId = lbl_801C1984[i % 3];
            params.x = lbl_801C17FC[i].unk0;
            params.y = lbl_801C17FC[i].unk4;
            params.scaleX = 1.0f;
            params.scaleY = 0.65f;
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
            params.scaleX = 1.0 + temp_f29;
            params.scaleY = 0.65 * (1.0 + temp_f29);
            draw_naomi_sprite(&params);
        }
        break;
    case 4:
        for (i = 0; i < 15; i++)
        {
            params.bmpId = (i % 2 == 0) ? BMP_COM_banana_10 : BMP_COM_banana_01;
            params.x = lbl_801C190C[i].unk0 + ((i / 5 == 1) ? -sprite->counter : sprite->counter);
            params.y = lbl_801C190C[i].unk4;
            params.scaleX = 0.8f;
            params.scaleY = 0.8f;
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
        sprite->tag = SPRITE_TAG_FLOOR_NAME_BANNER;
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->unk4C = 0.15f;
        if ((modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && (lbl_8027CE24.unk4 & 8))
         || (modeCtrl.courseFlags & COURSE_FLAG_EXTRA))
        {
            sprite->mulR = 255;
            sprite->mulG = 255;
            sprite->mulB = 0;
            sprite->addR = 32;
            sprite->addG = 32;
            sprite->addB = 32;
        }
        else
        {
            sprite->mulR = 255;
            sprite->mulG = 255;
            sprite->mulB = 0;
        }
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->scaleX = 0.8f;
        sprite->scaleY = 0.8f;
        sprite->flags |= 0x1000;
        sprite->mainFunc = floor_intro_sprite_main;
        sprite->drawFunc = floor_intro_sprite_draw;

        floorNum = (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE) ? lbl_8027CE24.unk0 : infoWork.currFloor;
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
            sprintf(sprite->text, "ROUND %d", floorNum);
        else if ((modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && (lbl_8027CE24.unk4 & 0x10))
         || (modeCtrl.courseFlags & COURSE_FLAG_MASTER))
            sprintf(sprite->text, "MASTER %d", floorNum);
        else if ((modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE && (lbl_8027CE24.unk4 & 8))
         || (modeCtrl.courseFlags & COURSE_FLAG_EXTRA))
            sprintf(sprite->text, "EXTRA %d", floorNum);
        else
            sprintf(sprite->text, "FLOOR %d", floorNum);
    }

    if ((infoWork.flags & INFO_FLAG_BONUS_STAGE) && modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = SPRITE_TAG_FINAL_FLOOR_BANNER;
            sprite->x = 320.0f;
            sprite->y = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->mulR = 255;
            sprite->mulG = 128;
            sprite->mulB = 0;
            sprite->scaleX = 0.5f;
            sprite->scaleY = 0.5f;
            sprite->flags |= 0x1000;
            sprite->mainFunc = bonus_floor_sprite_main;
            strcpy(sprite->text, "BONUS FLOOR");
        }
    }

    if ((infoWork.flags & INFO_FLAG_FINAL_FLOOR) && modeCtrl.gameType != GAMETYPE_MAIN_PRACTICE)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = SPRITE_TAG_FINAL_FLOOR_BANNER;
            sprite->x = 320.0f;
            sprite->y = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->scaleX = 0.5f;
            sprite->scaleY = 0.5f;
            sprite->flags |= 0x1000;
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
    if (sprite->userVar > 0)
        sprite->opacity = 0.06666 * sprite->userVar;
    else
        sprite->opacity = 1.0f;
    sprite->counter++;
    if (u_unkInputArr1[0] & PAD_BUTTON_A)
        sprite->counter++;
    if (sprite->userVar != 0)
    {
        sprite->userVar--;
        if (sprite->userVar == 0)
            *arg0 = 0;
    }
}

static void floor_intro_sprite_draw(struct Sprite *sprite)
{
    int centerX;
    int i;
    int spacePos = 0;
    char text[12];

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    func_80071B50(sprite->flags);
    set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, sprite->mulB, 0));
    set_text_add_color(RGBA(sprite->addR, sprite->addG, sprite->addB, 0));
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

        if (sprite->userVar > 0)
        {
            if (i < spacePos)
                yOffset = (15 - sprite->userVar) * ((i & 1) ? 8 : -8);
            else
                yOffset = (15 - sprite->userVar) * ((i & 1) ? -8 : 8);
        }

        set_text_pos(sprite->x - centerX + 14.4 + 57.6 * i + xOffset, sprite->y - 25.6 + yOffset);
        set_text_scale(sprite->scaleX - 0.01, sprite->scaleY + (0.01 * __fabs((float)yOffset)));
        if (i > spacePos)
            set_text_opacity(MIN(0.0625 * (sprite->counter - 30 - spacePos * 16), sprite->opacity));
        else if (i > 0)
            set_text_opacity(MIN(0.0625 * (sprite->counter - 30 - ((i - 1) * 16)), sprite->opacity));
        else if (i == 0 && sprite->userVar > 0)
            set_text_opacity(sprite->opacity);
        u_draw_char(text[i]);
    }
    reset_text_draw_settings();
}

static void player_num_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->counter > 90)
    {
        sprite->x += sprite->userVar;
        sprite->userVar++;
    }
    else if (sprite->counter <= 30)
    {
        sprite->x += sprite->userVar;
        sprite->userVar--;
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
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->mulR = playerNumColors[phi_r0 * 3 + 0];
            sprite->mulG = playerNumColors[phi_r0 * 3 + 1];
            sprite->mulB = playerNumColors[phi_r0 * 3 + 2];
            sprite->userVar = -30;
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
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->mulR = 255;
        sprite->mulG = 200;
        sprite->mulB = 0;
        sprite->counter = duration;
        sprite->userVar = duration;
        sprite->flags |= 0x1000;
        sprite->mainFunc = ready_sprite_main;
        strcpy(sprite->text, "READY");
    }
    u_play_sound(4);
}

static void ready_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int t = sprite->userVar - sprite->counter;

    if (t < 30)
    {
        sprite->opacity = 0.03333 * t;
        sprite->scaleX = 1.0f;
        sprite->scaleY = mathutil_sin(t * 0x222);
    }
    else if (t < 60)
    {
        sprite->opacity = 1.0f;
        sprite->scaleX = 1.0f;
        sprite->scaleY = 1.0 - mathutil_sin((t - 30) * 0x444) * 0.2;
    }
    else if (sprite->counter <= 15)
    {
        sprite->opacity = 0.06666 * sprite->counter;
        sprite->scaleX = 0.06666 * sprite->counter;
        sprite->scaleY = 1.0f;
    }
    else
    {
        sprite->opacity = 1.0f;
        sprite->scaleX = 1.0f;
        sprite->scaleY = 1.0f;
    }
    if (--sprite->counter <= 0)
    {
        u_play_sound(5);
        *arg0 = 0;
    }
}

void lbl_80067C20(struct Sprite *);

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
        flags = modeCtrl.courseFlags;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = (modeCtrl.courseFlags & 1) ? 72 : 32;
        sprite->y = (modeCtrl.courseFlags & 1) ? 436 : 458;
        sprite->fontId = FONT_ASC_20x20;
        if (flags & COURSE_FLAG_MASTER)
            sprite->x = 32.0f;
        if (flags & COURSE_FLAG_EXTRA)
        {
            sprite->mulR = 255;
            sprite->mulG = 255;
            sprite->mulB = 0;
            sprite->addR = 64;
            sprite->addG = 64;
            sprite->addB = 64;
        }
        sprite->textAlign = ALIGN_LB;
        sprite->mainFunc = lbl_8007A774;

        floorNum = (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE) ? lbl_8027CE24.unk0 : infoWork.currFloor;
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

    if ((modeCtrl.courseFlags & 1) && !(flags & COURSE_FLAG_MASTER))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 48.0f;
            sprite->y = 443.0f;
            sprite->fontId = FONT_ICON_LV;
            sprite->textAlign = ALIGN_CC;
            sprite->scaleX = 0.5f;
            sprite->scaleY = 0.5f;
            if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
                sprintf(sprite->text, "%d", lbl_8027CE24.unk2 + 4);
            else
                sprintf(sprite->text, "%d", modeCtrl.difficulty + 4);
        }
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 72.0f;
            sprite->y = 436.0f;
            sprite->fontId = FONT_ASCII;
            sprite->textAlign = ALIGN_LB;
            sprite->scaleX = 1.5f;
            sprite->scaleY = 1.5f;
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
        sprite->drawFunc = monkey_sprite_draw;
        sprintf(sprite->text, "saru");
    }

    lbl_80292D18.unk4 = 0;
    lbl_80292D18.unk0 = 0;
    lbl_80292D18.unk8 = 0;
    lbl_80292D18.unk14 = 0x33;
    func_8000D5B8();
    hud_show_bomb(320.0f, 68.0f);

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
        sprite->scaleX = 0.2f;
        sprite->scaleY = 0.2f;
        sprintf(sprite->text, "banana.pic");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 536.0f;
        sprite->y = 24.0f;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CC;
        sprite->mulR = 170;
        sprite->mulG = 168;
        sprite->mulB = 0;
        sprite->addR = 56;
        sprite->addG = 56;
        sprite->addB = 0;
        sprintf(sprite->text, "BANANA(S)");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 518.0f;
        sprite->y = 47.0f;
        sprite->fontId = FONT_NUM_22x22;
        sprite->textAlign = ALIGN_CC;
        sprite->mulR = 170;
        sprite->mulG = 168;
        sprite->mulB = 0;
        sprite->addR = 56;
        sprite->addG = 56;
        sprite->addB = 0;
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
        sprite->mulR = 170;
        sprite->mulG = 168;
        sprite->mulB = 0;
        sprite->addR = 56;
        sprite->addG = 56;
        sprite->addB = 0;
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
        u_show_practice_mode_score_info(0);

    if (modeCtrl.playerCount > 1)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->type = SPRITE_TYPE_BITMAP;
            sprite->x = 48.0f;
            sprite->y = 412.0f;
            sprite->scaleX = 2.0f;
            sprite->scaleY = 2.0f;
            sprite->textAlign = ALIGN_CC;
            sprite->userVar = modeCtrl.currPlayer;
            sprite->drawFunc = lbl_8007B134;
            sprintf(sprite->text, "%dP", modeCtrl.currPlayer + 1);
        }
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = (modeCtrl.playerCount > 1) ? 74 : 32;
        sprite->y = (modeCtrl.courseFlags & 1) ? 420 : 428;
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
    if (infoWork.flags & INFO_FLAG_BONUS_STAGE)
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
    if (find_sprite_with_tag(SPRITE_TAG_FINAL_FLOOR_BANNER) == NULL
     && (infoWork.flags & INFO_FLAG_FINAL_FLOOR) && (modeCtrl.gameType != GAMETYPE_MAIN_PRACTICE))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = SPRITE_TAG_FINAL_FLOOR_BANNER;
            sprite->x = 320.0f;
            sprite->y = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->scaleX = 0.5f;
            sprite->scaleY = 0.5f;
            sprite->counter = 150;
            sprite->flags |= 0x1000;
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
        sprite->scaleX = 0.2f;
        sprite->scaleY = 0.2f;
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
        sprite->mulR = 170;
        sprite->mulG = 168;
        sprite->mulB = 0;
        sprite->addR = 56;
        sprite->addG = 56;
        sprite->addB = 0;
        sprite->userVar = playerId;
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
        sprite->bmpId = u_get_monkey_bitmap_id(lbl_80292D18.unk0, lbl_80292D18.unk8, playerCharacterSelection[playerId]);
        sprite->textAlign = ALIGN_CC;
        sprite->scaleX = 0.375f;
        sprite->scaleY = 0.24374999f;
        sprite->userVar = playerId;
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
        sprite->scaleX = 2.0f;
        sprite->scaleY = 2.0f;
        sprite->textAlign = ALIGN_CC;
        sprite->userVar = playerId;
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
        sprite->userVar = playerId;
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

    if (lbl_802F1FB0 != infoWork.currFloor)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprintf(sprite->text, "ROUND %d", infoWork.currFloor);
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
    hud_show_bomb(320.0f, 240.0f);

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

    if (find_sprite_with_tag(SPRITE_TAG_FINAL_FLOOR_BANNER) == NULL
     && (infoWork.flags & INFO_FLAG_FINAL_FLOOR))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = SPRITE_TAG_FINAL_FLOOR_BANNER;
            sprite->x = 320.0f;
            sprite->y = 300.0f;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->scaleX = 0.5f;
            sprite->scaleY = 0.5f;
            sprite->counter = 150;
            sprite->flags |= 0x1000;
            sprite->mainFunc = final_floor_sprite_main;
            sprite->drawFunc = final_floor_sprite_draw;
            strcpy(sprite->text, "FINAL ROUND");
        }
    }

    phi_r28 = g_poolInfo.unkC;
    for (i = 0; i < g_poolInfo.unk8; i++, phi_r28++)
    {
        if (*phi_r28 != 0)
            show_competition_player_hud(i);
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->bmpId = BMP_COM_frame;
        sprite->unk4C = 400.0f;
        sprite->scaleX = 1.0f;
        sprite->scaleY = 80.0f;
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
    params.scaleX = sprite->scaleX;
    params.scaleY = sprite->scaleY;
    params.u1 = sprite->unk7C;
    params.v1 = sprite->unk80;
    params.u2 = sprite->unk84;
    params.v2 = sprite->unk88;
    params.rotation = 0;
    params.opacity = 1.0f;
    params.unk30 = -1;
    params.flags = 0xA;
    params.mulColor = RGBA(255, 255, 255, 255);
    params.addColor = 0;

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
    if (modeCtrl.courseFlags & 1)
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
        sprite->scaleX *= 1.01f;
        sprite->scaleY *= 1.01f;
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
        sprite->scaleX *= 1.01f;
        sprite->scaleY *= 1.01f;
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
    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    set_text_pos(sprite->x - 70.0f, sprite->y - 10.0f);
    set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, sprite->mulB, 0));
    set_text_add_color(RGBA(sprite->addR, sprite->addG, sprite->addB, 0));
    u_draw_text("    100");

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
            if (ball->bananas >= 90 && (sprite->userVar == 0))
                sprite->userVar = 1;
            if (ball->bananas < 90)
                sprite->userVar = 0;
        }
        if (!(gamePauseStatus & 0xA) && r22->unk4 > 0)
            r22->unk4--;

        temp_f28 = lbl_80118870[29 - r22->unk4];
        temp_f4 = temp_f28 - 1.0;
        x = sprite->x - 20.0f - i * 20 - 10.0f - (10.0f * temp_f4);
        y = sprite->y - 10.0f - (10.0f * temp_f4);
        temp_r23 = 510.0f * temp_f4;

        set_text_pos(x, y);
        set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, temp_r23, 0));
        set_text_scale(temp_f28, temp_f28);
        func_80072AC0("%d", phi_r3);
    }
    reset_text_draw_settings();
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

    ball = &ballInfo[sprite->userVar];
    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    set_text_add_color(RGBA(sprite->addR, sprite->addG, sprite->addB, 0));

    r22 = lbl_80292C00_alias + sprite->userVar * 3;
    for (i = 0; i < 3; i++, r22++)
    {
        if (infoWork.flags & INFO_FLAG_FINAL_FLOOR)
        {
            x = sprite->x - 20.0f - i * 20 - 10.0f;
            y = sprite->y - 10.0f;
            set_text_pos(x, y);
            set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, 0, 0));
            u_draw_text("?");
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

        set_text_pos(x, y);
        set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, temp_r23, 0));
        set_text_scale(temp_f28, temp_f28);
        func_80072AC0("%d", phi_r3);
    }
    reset_text_draw_settings();
}

static void lbl_8007B134(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    struct TPLTextureHeader *texHdr;
    int phi_r5;

    phi_r5 = (modeCtrl.playerCount > 1) ? ballInfo[sprite->userVar].playerId : 3;
    params.bmpId = BMP_NML_game_player;
    params.rotation = sprite->rotation;
    params.opacity = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0xA;
    params.mulColor = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (int)(sprite->opacity * 255.0f));
    params.addColor = RGBA(sprite->addR, sprite->addG, sprite->addB, 0);
    texHdr = &bitmapGroups[(params.bmpId >> 8) & 0xFF].tpl->texHeaders[params.bmpId & 0xFF];
    params.x = sprite->x;
    params.y = sprite->y;
    params.z = sprite->unk4C;
    params.u1 = (16.0f * sprite->userVar) / texHdr->width;
    params.v1 = (16.0f * phi_r5) / texHdr->height;
    params.u2 = params.u1 + (16.0f / texHdr->width);
    params.v2 = params.v1 + (10.0f / texHdr->height);
    params.scaleX = sprite->scaleX * (params.u2 - params.u1);
    params.scaleY = sprite->scaleY * (params.v2 - params.v1);
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

            if (temp_r3_4 != NULL && temp_r3_4->userVar == 0)
                temp_r3_4->userVar = 1;
        }
    }
    else
    {
        r31->unk0 += r31->unk8;
        if (gameSubmode == SMD_GAME_GOAL_REPLAY_MAIN && r31->unk4 % 4 == 0)
            u_play_sound(0x2E);
    }
    sprintf(sprite->text, "%d", r31->unk0);
}

static void lbl_8007B490(s8 *arg0, struct Sprite *sprite)
{
    sprite->bmpId = u_get_monkey_bitmap_id(lbl_80292D18.unk0, lbl_80292D18.unk8, playerCharacterSelection[sprite->userVar]);
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
    float len = mathutil_vec_len(&ballInfo[sprite->userVar].vel);
    float mph = ((216000.0 * len) / 1000.0) / 1.6093;

    if (mph > 999.0)
        mph = 999.0f;
    sprintf(sprite->text, "%3.0f", mph);
}

static void bananas_left_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    float blueness;

    sprintf(sprite->text, "%2d BANANA%s LEFT", infoWork.bananasLeft, (infoWork.bananasLeft > 1) ? "S" : " ");
    if (gameSubmode != SMD_GAME_PLAY_MAIN)
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
    blueness = 2.0 * ((unpausedFrameCounter % 60) / 59.0);
    if (blueness > 1.0)
        blueness = 2.0 - blueness;
    sprite->mulR = 255;
    sprite->mulG = 255;
    sprite->mulB = 255.0f * blueness;
}

static void bonus_floor_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->userVar > 0)
    {
        sprite->opacity = 0.06666 * sprite->userVar;
        sprite->rotation = 0;
    }
    else if (sprite->counter < 60)
    {
        sprite->opacity = 0.01666 * sprite->counter;
        sprite->rotation = (60 - sprite->counter) * 0x111;
    }
    else
    {
        sprite->opacity = 1.0f;
        sprite->rotation = 0;
    }

    if (sprite->counter >= 150)
    {
        sprite->x = 500.0f;
        sprite->y = 452.0f;
        sprite->scaleX = 0.3f;
        sprite->scaleY = sprite->scaleX;
    }
    else if (sprite->counter >= 120)
    {
        int t = sprite->counter - 120;

        sprite->x = 320 + t * 6;
        sprite->y = 300.0 + t * 5.066666;
        sprite->scaleX = 0.5 - t * 0.006666;
        sprite->scaleY = sprite->scaleX;
    }
    sprite->counter++;
    if (sprite->userVar != 0)
    {
        sprite->userVar--;
        if (sprite->userVar == 0)
            *arg0 = 0;
    }
}

static void final_floor_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (modeCtrl.difficulty == 0)
    {
        sprite->mulR = 0;
        sprite->mulG = 208;
        sprite->mulB = 0;
    }
    else if (modeCtrl.difficulty == 1)
    {
        sprite->mulR = 0;
        sprite->mulG = 0;
        sprite->mulB = 224;
    }
    else
    {
        sprite->mulR = 255;
        sprite->mulG = 192;
        sprite->mulB = 0;
    }

    if (sprite->counter >= 150)
    {
        float flash = 64.0f * mathutil_sin((sprite->counter - 150) << 9);

        sprite->mulR = CLAMP(sprite->mulR + flash, 0.0f, 255.0f);
        sprite->mulG = CLAMP(sprite->mulG + flash, 0.0f, 255.0f);
        sprite->mulB = CLAMP(sprite->mulB + flash, 0.0f, 255.0f);
    }

    if (sprite->userVar > 0)
        sprite->opacity = 0.06666 * sprite->userVar;
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
        sprite->scaleX = 0.3f;
        sprite->scaleY = sprite->scaleX;
    }
    else if (sprite->counter >= 120)
    {
        int t = sprite->counter - 120;

        if (modeCtrl.unk30 == 1)
        {
            sprite->x = 320 + t * 6;
            sprite->y = 300.0 + t * 5.066666;
        }
        else
        {
            sprite->x = 320 - t * 6;
            sprite->y = 300.0 - t * 1.933333;
        }
        sprite->scaleX = 0.5 - t * 0.006666;
        sprite->scaleY = sprite->scaleX;
    }
    sprite->counter++;
    if (sprite->userVar != 0)
    {
        sprite->userVar--;
        if (sprite->userVar == 0)
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

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    func_80071B50(sprite->flags);
    set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, sprite->mulB, 0));
    set_text_add_color(RGBA(sprite->addR, sprite->addG, sprite->addB, 0));

    w = sprite->scaleX * ((strlen(sprite->text) - 2) * 72 + 48);
    h = sprite->scaleY * 64.0f;

    if (sprite->counter > 120)
    {
        set_text_pos(sprite->x - 0.5 * w, sprite->y - 0.5 * h);
        set_text_scale(sprite->scaleX, sprite->scaleY);
        set_text_opacity(sprite->opacity);
        u_draw_text(sprite->text);
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
                phi_r24 = 30.0f * sprite->scaleX;
            else if (text[i] == ' ')
                phi_r24 = 18.0f * sprite->scaleX;
            else
                phi_r24 = 72.0f * sprite->scaleX;

            var = (text[i] == 'I') ? sprite->scaleX * -42.0f * 0.5 : 0.0;

            temp_f20 = 1.0 + ((i % 2 == 0) ? 5.0 * (1.0 - temp_f18) : 0.0);
            temp_f19 = 1.0 + ((i % 2 == 0) ? 0.0 : 5.0 * (1.0 - temp_f18));

            set_text_pos(
                sprite->x - w * 0.5 + phi_r26 + var - phi_r24 * (temp_f20 - 1.0) * 0.5,
                sprite->y - h * 0.5 - h * (temp_f19 - 1.0) * 0.5);
            set_text_scale(sprite->scaleX * temp_f20, sprite->scaleY * temp_f19);
            set_text_opacity(sprite->opacity * temp_f18);
            if (text[i] != ' ')
                u_draw_char(text[i]);
        }
    }
    reset_text_draw_settings();
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
        sprite->mulR = 0;
        sprite->mulG = 128;
        sprite->mulB = 255;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = arg0;
        sprite->userVar = arg0;
        sprite->flags |= 0x1000;
        sprite->mainFunc = go_sprite_main;
        sprite->drawFunc = go_sprite_draw;
        strcpy(sprite->text, "GO");
    }
}

static void go_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int t = sprite->userVar - sprite->counter;

    if (t < 15)
    {
        int temp_r0 = 15 - t;

        sprite->opacity = t * 0.06666;
        sprite->addR = 0;
        sprite->addG = sprite->addR;
        sprite->addB = sprite->addR;
        sprite->scaleX = 1.0 + temp_r0 * 0.1;
        sprite->scaleY = 1.0 + temp_r0 * -0.04;
    }
    else if (t < 30)
    {
        int temp_r29 = (t - 15) * 0x888;

        sprite->opacity = 1.0f;
        sprite->addR = ((unpausedFrameCounter >> 1) & 1) * 192;
        sprite->addG = sprite->addR;
        sprite->addB = sprite->addR;
        sprite->scaleX = 1.0 - mathutil_sin(temp_r29) * 0.5;
        sprite->scaleY = 1.0 + mathutil_sin(temp_r29);
    }
    else if (t < 45)
    {
        int temp_r29_2 = (t - 30) * 0x888;

        sprite->opacity = 1.0f;
        sprite->addR = ((unpausedFrameCounter >> 1) & 1) * 192;
        sprite->addG = sprite->addR;
        sprite->addB = sprite->addR;
        sprite->scaleX = 1.0 + mathutil_sin(temp_r29_2) * 0.75;
        sprite->scaleY = 1.0 - mathutil_sin(temp_r29_2) * 0.375;
    }
    else
    {
        sprite->opacity = sprite->counter * 0.06666;
        sprite->addR = 0;
        sprite->addG = sprite->addR;
        sprite->addB = sprite->addR;
        sprite->scaleX = 1.0 + (15 - sprite->counter) * -0.04;
        sprite->scaleY = 1.0 + (15 - sprite->counter) * 0.1;
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

    t = sprite->userVar - sprite->counter;
    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    func_80071B1C(sprite->unk4C);
    func_80071B50(sprite->flags);
    set_text_opacity(sprite->opacity);
    set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, sprite->mulB, 0));
    set_text_add_color(RGBA(sprite->addR, sprite->addG, sprite->addB, 0));
    set_text_scale(1.5f * sprite->scaleX, 1.5f * sprite->scaleY);
    temp_r23 = 1.5f * (36.0f * sprite->scaleX);
    temp_r3 = 1.5f * (32.0f * sprite->scaleY);

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
        set_text_pos(
            (sprite->x + phi_f29) - temp_r23 + ((i == 0) ? -temp_r23 : temp_r23),
            (sprite->y + phi_f2) - temp_r3);
        u_draw_char((i == 0) ? 0x47 : 0x4F);
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
        sprite->userVar = duration;
        sprite->flags |= 0x1000;
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
            sprite->mulR = 0;
            sprite->mulG = 192;
            sprite->mulB = 255;
            sprite->scaleX = 1.0f;
            sprite->scaleY = 0.6f;
            sprite->fontId = FONT_ASC_32x32;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = duration;
            sprite->userVar = duration;
            sprite->flags |= 0x1000;
            sprite->mainFunc = warp_sprite_main;
            sprintf(sprite->text, "JUMP TO FLOOR %d", infoWork.currFloor);
        }
    }
}

static void goal_sprite_draw(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    float opacity;
    int temp_r29;
    int t;
    int temp_r6;
    int flash;
    int i;

    params.bmpId = BMP_NML_game_goal;
    params.z = sprite->unk4C;
    params.rotation = sprite->rotation;
    params.unk30 = -1;
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0xA;

    t = sprite->userVar - sprite->counter;
    if (t < 30)
    {
        opacity = t * 0.016666;
        flash = 0;
    }
    else if (t < 45)
    {
        opacity = 1.0f;
        flash = mathutil_sin((t - 30) * 0x888) * 255.0f;
    }
    else if (sprite->counter <= 15)
    {
        opacity = sprite->counter * 0.06666;
        flash = 0;
    }
    else
    {
        opacity = 1.0f;
        flash = 0;
    }
    params.opacity = opacity;
    params.mulColor = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (u8)(opacity * 255.0f));
    params.addColor = RGBA(flash, flash, flash, 0);

    if (t >= 210)
    {
        sprite->x = 561.0f;
        sprite->y = 420.0f;
        sprite->scaleX = 0.5f;
        sprite->scaleY = sprite->scaleX;
    }
    else if (t >= 180)
    {
        temp_r6 = t - 180;
        sprite->x = 320.0 + temp_r6 * 8.03333;
        if (modeCtrl.gameType == 1)
            sprite->y = 240.0 + temp_r6 * 6.0;
        else
            sprite->y = 320.0 + temp_r6 * 3.33333;
        sprite->scaleX = 1.0 - temp_r6 * 0.01666;
        sprite->scaleY = sprite->scaleX;
    }

    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 1.0f;
    params.scaleX = sprite->scaleX;
    params.scaleY = sprite->scaleY;

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
    reset_text_draw_settings();
}

static void lbl_8007CDCC(s8 *, struct Sprite *);

static void warp_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    s32 t;
    struct Sprite *warpSprite;

    t = sprite->userVar - sprite->counter;
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
            warpSprite->mulR = sprite->mulR;
            warpSprite->mulG = sprite->mulG;
            warpSprite->mulB = sprite->mulB;
            warpSprite->addR = 0;
            warpSprite->addG = 96;
            warpSprite->addB = 127;
            warpSprite->scaleX = sprite->scaleX;
            warpSprite->scaleY = sprite->scaleY;
            warpSprite->fontId = FONT_ASC_32x32;
            warpSprite->textAlign = ALIGN_CC;
            warpSprite->counter = 16;
            warpSprite->opacity = 0.5f;
            warpSprite->flags |= 0x1000;
            warpSprite->mainFunc = lbl_8007CDCC;
            sprintf(warpSprite->text, "JUMP TO FLOOR %d", infoWork.currFloor);
        }
    }

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

static void lbl_8007CDCC(s8 *arg0, struct Sprite *sprite)
{
    sprite->addG += 6;
    sprite->addB += 7;
    sprite->unk4C += 0.001;
    sprite->scaleX += 0.008;
    sprite->scaleY += 0.008;
    sprite->opacity -= 0.03125;

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

static void fall_out_sprite_main(s8 *, struct Sprite *);
static void show_bonus_finish_banner(void);

void hud_show_fallout_banner(int duration)
{
    struct Sprite *sprite;

    if (!(infoWork.flags & INFO_FLAG_BONUS_STAGE))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 320.0f;
            sprite->y = 240.0f;
            sprite->unk4C = 0.05f;
            sprite->mulR = 255;
            sprite->mulG = 140;
            sprite->mulB = 0;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = duration;
            sprite->userVar = duration;
            sprite->flags |= 0x1000;
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

    t = sprite->userVar - sprite->counter;

    if (modeCtrl.gameType != GAMETYPE_MINI_TARGET && t == 90)
        u_play_sound(0xC);

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
            sprite->scaleX = 0.5f;
            sprite->scaleY = sprite->scaleX;
        }
        else if (t >= 90)
        {
            temp_r0_3 = t - 90;
            sprite->x = 320.0 + temp_r0_3 * 5.86666;
            sprite->y = 240 + temp_r0_3 * 6;
            sprite->scaleX = 1.0 - temp_r0_3 * 0.01666;
            sprite->scaleY = sprite->scaleX;
        }
    }
    else
    {
        sprite->scaleX = 0.85f;
        sprite->scaleY = sprite->scaleX;
    }

    if (--sprite->counter <= 0)
        *arg0 = 0;
}

static void time_over_sprite_main(s8 *, struct Sprite *);

void hud_show_time_over_banner(int duration)
{
    struct Sprite *sprite;

    if (!(infoWork.flags & INFO_FLAG_BONUS_STAGE))
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 320.0f;
            sprite->y = 240.0f;
            sprite->unk4C = 0.05f;
            sprite->mulR = 255;
            sprite->mulG = 140;
            sprite->mulB = 0;
            sprite->fontId = FONT_ASC_72x64;
            sprite->textAlign = ALIGN_CC;
            sprite->counter = duration;
            sprite->userVar = duration;
            sprite->mainFunc = time_over_sprite_main;
            strcpy(sprite->text, "TIME OVER");
        }
    }
    else
        show_bonus_finish_banner();
}

static void time_over_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    s32 t = sprite->userVar - sprite->counter;

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
        sprite->userVar = 1;
        sprite->flags |= 0x1000;
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
        sprite->userVar = 0;
        sprite->mulR = 255;
        sprite->mulG = 128;
        sprite->mulB = 0;
        sprite->scaleX = 0.8f;
        sprite->scaleY = 0.8f;
        sprite->flags |= 0x1000;
        sprite->mainFunc = bonus_finish_sprite_main;
        strcpy(sprite->text, "BONUS FINISH");
    }
}

static void bonus_finish_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    float temp_f3 = sprite->counter / 30.0f;

    sprite->scaleY = sprite->scaleX = temp_f3 * 0.8 + (1.0 - temp_f3) * 5.0;
    if (sprite->counter == 29)
        u_play_sound((sprite->userVar != 0) ? 0x48 : 0x45);
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
        sprite->mulR = 255;
        sprite->mulG = 200;
        sprite->mulB = 0;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->userVar = 0;
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
            sprite->mulR = 0;
            sprite->mulG = 0;
            sprite->mulB = 0;
            sprite->fontId = FONT_JAP_24x24_2P;
            sprite->textAlign = ALIGN_CC;
            sprite->unk4C = 0.11f;
            sprite->opacity = 0.0f;
            sprite->mainFunc = num_continues_sprite_main;
            sprite->flags |= 0x200000;
            strcpy(sprite->text, "h/NOKORI");
        }
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 490.0f;
            sprite->y = 90.0f;
            sprite->mulR = 255;
            sprite->mulG = 200;
            sprite->mulB = 0;
            sprite->fontId = FONT_JAP_24x24_2P;
            sprite->textAlign = ALIGN_CC;
            sprite->unk4C = 0.1f;
            sprite->opacity = 0.0f;
            sprite->mainFunc = num_continues_sprite_main;
            sprite->flags |= 0x200000;
            strcpy(sprite->text, "h/NOKORI");
        }
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 160.0f;
        sprite->y = 260.0f;
        sprite->mulR = 140;
        sprite->mulG = 255;
        sprite->mulB = 255;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->userVar = 1;
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
        sprite->mulR = 255;
        sprite->mulG = 160;
        sprite->mulB = 190;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->userVar = 0;
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
    if (sprite->userVar == 0)
    {
        u_play_sound(0x47);
        sprite->userVar = 1;
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
    if (sprite->userVar == 1)
    {
        sprite->mulR = 140;
        sprite->mulG = 255;
        sprite->mulB = 255;
    }
    else
    {
        sprite->mulR = 255;
        sprite->mulG = 160;
        sprite->mulB = 190;
    }

    if (modeCtrl.courseFlags & 4)
    {
        sprite->opacity += 0.1 * (1.0 - sprite->opacity);
        if (sprite->userVar == modeCtrl.unk10)
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
            sprite->addR = phi_r0;
            sprite->addG = phi_r0;
            sprite->addB = phi_r0;
        }
        else
        {
            sprite->y += sprite->counter;
            sprite->counter++;
            sprite->mulR /= 2;
            sprite->mulG /= 2;
            sprite->mulB /= 2;
            sprite->addR = 0;
            sprite->addG = 0;
            sprite->addB = 0;
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
    if (sprite->userVar == modeCtrl.unk10)
    {
        float phi_f1 = 2.0 * ((float)((unpausedFrameCounter + 36) % 60) / 59.0);
        int temp_r0_2;

        if (phi_f1 > 1.0)
            phi_f1 = 2.0 - phi_f1;
        temp_r0_2 = phi_f1 * 255.0f;
        sprite->addR = temp_r0_2;
        sprite->addG = temp_r0_2;
        sprite->addB = temp_r0_2;
    }
    else
    {
        sprite->mulR /= 2;
        sprite->mulG /= 2;
        sprite->mulB /= 2;
        sprite->addR = 0;
        sprite->addG = 0;
        sprite->addB = 0;
    }
}

static void game_over_player_num_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (sprite->counter > 90)
    {
        sprite->x += sprite->userVar;
        sprite->userVar += 1;
    }
    else if (sprite->counter <= 30)
    {
        sprite->y += sprite->userVar;
        sprite->userVar += 2;
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
        sprite->mulR = 255;
        sprite->mulG = 0;
        sprite->mulB = 32;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = duration;
        sprite->userVar = duration;
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
            sprite->mulR = playerNumColors[phi_r0 * 3 + 0];
            sprite->mulG = playerNumColors[phi_r0 * 3 + 1];
            sprite->mulB = playerNumColors[phi_r0 * 3 + 2];
            sprite->userVar = -0x1E;
            sprite->counter = 120;
            sprite->unk4C = 0.008f;
            sprite->mainFunc = game_over_player_num_sprite_main;
            sprintf(sprite->text, "%dP", currentBallStructPtr->playerId + 1);
        }
    }
}

static void game_over_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int t = sprite->userVar - sprite->counter;

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
        sprite->userVar = arg0;
        sprite->mainFunc = oneup_sprite_main;
        strcpy(sprite->text, "1UP");
    }
}

static void oneup_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    s32 t = sprite->userVar - sprite->counter;
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

            sprite->mulR = sp14[temp_r8 + 0];
            sprite->mulG = sp14[temp_r8 + 1];
            sprite->mulB = sp14[temp_r8 + 2];
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
        sprite->mulR = 255;
        sprite->mulG = 128;
        sprite->mulB = 0;
        sprite->counter = 30;
        sprite->flags |= 0x1000;
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
    if (sprite->userVar == 0)
    {
        sprite->x += 4.0 * ((rand() / 32767.0f) - 0.5);
        sprite->y += 2.0 * ((rand() / 32767.0f) - 0.5);
        return;
    }
    sprite->x = find_sprite_with_tag(20)->x + sprite->userVar;
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
        sprite->userVar = 0xF;
}

static void replay_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    sprite->counter--;
    if (sprite->counter < 0 || !(infoWork.flags & INFO_FLAG_04))
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
        sprite->userVar = 0;
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
        sprite->userVar = 1;
        sprite->mainFunc = name_entry_info_sprite_main;
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = nameEntryElemsX[2] - 320;
        sprite->y = 448.0f;
        sprite->fontId = FONT_ICON_LV;
        sprite->textAlign = ALIGN_CC;
        sprite->scaleX = 0.5f;
        sprite->scaleY = 0.5f;
        sprite->userVar = 2;
        sprite->mainFunc = name_entry_info_sprite_main;
        sprintf(sprite->text, "%d", modeCtrl.difficulty + 4);
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = nameEntryElemsX[3] + 320;
        sprite->y = 456.0f;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_RB;
        sprite->userVar = 3;
        sprite->mainFunc = name_entry_info_sprite_main;
        sprintf(sprite->text, "00");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = nameEntryElemsX[4] + 320;
        sprite->y = 450.0f;
        sprite->mulR = 255;
        sprite->mulG = 200;
        sprite->mulB = 0;
        sprite->fontId = FONT_ASC_20x20;
        sprite->textAlign = ALIGN_CT;
        sprite->userVar = 4;
        sprite->mainFunc = name_entry_info_sprite_main;
        sprintf(sprite->text, "TIME LIMIT");
    }
}

static void name_entry_info_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    int temp_r5 = sprite->userVar;
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
            sprite->mulR = 0;
            sprite->mulG = 128;
            sprite->mulB = 255;
        }
        else if (infoWork.timerCurr > 180)
        {
            sprite->mulR += 0.05 * (255 - sprite->mulR);
            sprite->mulG += 0.05 * (200 - sprite->mulG);
            sprite->mulB += 0.05 * -sprite->mulB;
        }
        else
        {
            sprite->mulR += 0.05 * (255 - sprite->mulR);
            sprite->mulG += 0.05 * -sprite->mulG;
            sprite->mulB += 0.05 * (32 - sprite->mulB);
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
        sprite->mulR = 0;
        sprite->mulG = 255;
        sprite->mulB = 160;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CB;
        sprite->counter = arg0;
        sprite->userVar = arg0;
        sprite->mainFunc = ready_sprite_main;
        strcpy(sprite->text, "NAME");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 240.0f;
        sprite->mulR = 0;
        sprite->mulG = 255;
        sprite->mulB = 160;
        sprite->fontId = FONT_ASC_72x64;
        sprite->textAlign = ALIGN_CT;
        sprite->counter = arg0;
        sprite->userVar = arg0;
        sprite->mainFunc = ready_sprite_main;
        strcpy(sprite->text, "ENTRY");
    }
    u_play_sound(4);
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
        sprite->mulR = 255;
        sprite->mulG = 255;
        sprite->mulB = 255;
        sprite->fontId = FONT_ASC_32x32;
        sprite->textAlign = ALIGN_LC;
        sprite->scaleX = lbl_801C206C[var].unk4;
        sprite->scaleY = 0.75 * sprite->scaleX;
        sprite->opacity = lbl_801C206C[var].unk8;
        sprite->userVar = lbl_801C206C[var].unkC;
        sprite->unk4C = 0.1 - 0.001 * sprite->scaleX;
        sprite->flags |= 0x1000;
        sprite->mainFunc = lbl_8007EC80;
        if (modeCtrl.courseFlags & COURSE_FLAG_MASTER)
            sprintf(sprite->text, "MASTER STAGE");
        else
            sprintf(sprite->text, "EXTRA STAGE");
    }
}

static void lbl_8007EC80(s8 *arg0, struct Sprite *sprite)
{
    sprite->x -= sprite->userVar;
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
        sprite->scaleX = 1.0f;
        sprite->scaleY = 80.0f;
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
            sprite->scaleX = 0.3f;
            sprite->scaleY = 0.3f;
            sprintf(sprite->text, "result banana.pic");
        }
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->x = 640.0 * (vp->left + 0.5 * vp->width) + 20.0;
            sprite->y = 480.0 * (vp->top + 0.5 * vp->height) - 65.0;
            sprite->fontId = FONT_JAP_24x24_2;
            sprite->textAlign = ALIGN_CC;
            sprite->mulR = 255;
            sprite->mulG = 255;
            sprite->mulB = 0;
            sprite->userVar = i;
            sprite->mainFunc = lbl_8007EF0C;
            sprintf(sprite->text, "000");
        }
    }
}

static void lbl_8007EF0C(s8 *arg0, struct Sprite *sprite)
{
    sprintf(sprite->text, "%03d", ballInfo[sprite->userVar].unk138);
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
        sprite->userVar = ball->rank;
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
        sprite->scaleX = 1.0 + 0.2f * sprite->counter;
        sprite->scaleY = sprite->scaleX;
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
            sprite->addR = mathutil_sin(sprite->counter * 0x888);
            sprite->addG = sprite->addR;
            sprite->addB = sprite->addR;
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
    params.rotation = sprite->rotation;
    params.opacity = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->flags & 0xFFFFFFF0) | 0xA;
    params.mulColor = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (u8)(sprite->opacity * 255.0f));
    params.addColor = RGBA(sprite->addR, sprite->addG, sprite->addB, 0);
    temp_r6 = &lbl_801C20EC[sprite->userVar];
    texHdr = &bitmapGroups[(params.bmpId >> 8) & 0xFF].tpl->texHeaders[params.bmpId & 0xFF];
    params.x = sprite->x;
    params.y = sprite->y;
    params.z = sprite->unk4C;
    params.u1 = temp_r6->unk0 / texHdr->width;
    params.v1 = temp_r6->unk4 / texHdr->height;
    params.u2 = params.u1 + temp_r6->unk8 / texHdr->width;
    params.v2 = params.v1 + temp_r6->unkC / texHdr->height;
    params.scaleX = sprite->scaleX * (params.u2 - params.u1);
    params.scaleY = sprite->scaleY * (params.v2 - params.v1);
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
            sprite->mulR = 255;
            sprite->mulG = 96;
            sprite->mulB = 96;
        }
        else if (arg2 & 4)
        {
            sprite->mulR = 96;
            sprite->mulG = 255;
            sprite->mulB = 96;
        }
        else
        {
            sprite->mulR = 96;
            sprite->mulG = 96;
            sprite->mulB = 255;
        }
        sprite->fontId = FONT_ASC_16x16;
        sprite->textAlign = ALIGN_CC;
        sprite->counter = 360;
        sprite->userVar = 360;
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
            sprite->userVar = 360;
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
            sprite->userVar = 360;
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
        sprite->userVar = 360;
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
    set_text_opacity(phi_f1);
    set_text_scale(sprite->scaleX, sprite->scaleY);
    set_text_pos(sprite->x - 190.0f + phi_r31, sprite->y - 10.0f);
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
    set_text_opacity(phi_f1);
    return 1;
}

char string_result_menu[] = "result menu";  // unused
char string_result_mask[] = "result mask";  // unused
char *lbl_801C2178[] = { "k/RITORAI", "h/SETTEIHENNKOU", "h/SHUURYOU" };  // unused

static void clear_score_sprite_draw(struct Sprite *sprite)
{
    int t;
    float f31;

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    t = sprite->userVar - sprite->counter;
    f31 = 1.0f;
    if (func_8007F61C(sprite, t, f31))
    {
        set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, sprite->mulB, 0));
        u_draw_text("CLEAR SCORE : ");
    }
    if (lbl_8007F754_inline2(sprite, t, f31))
    {
        set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, sprite->mulB, 0));
        u_draw_text(sprite->text);
    }
    reset_text_draw_settings();
}

static void warp_bonus_sprite_draw(struct Sprite *sprite)
{
    int t;
    float f31;

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    t = sprite->userVar - sprite->counter - 10;
    f31 = 1.0f;
    if (func_8007F61C(sprite, t, f31))
    {
        set_text_mul_color(RGBA(0, 192, 255, 0));
        u_draw_text(" WARP BONUS   ");
    }
    if (lbl_8007F754_inline2(sprite, t, f31))
    {
        set_text_mul_color(RGBA(0, 192, 255, 0));
        u_draw_text(sprite->text);
    }
    reset_text_draw_settings();
}

static void time_bonus_sprite_draw(struct Sprite *sprite)
{
    int t;
    float f31;

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    t = sprite->userVar - sprite->counter - 20;
    f31 = 1.0f;
    if (func_8007F61C(sprite, t, f31))
    {
        set_text_mul_color(RGBA(255, 255, 0, 0));
        u_draw_text(" TIME BONUS   ");
    }
    if (lbl_8007F754_inline2(sprite, t, f31))
    {
        set_text_mul_color(RGBA(255, 255, 0, 0));
        u_draw_text(sprite->text);
    }
    reset_text_draw_settings();
}

static void floor_score_sprite_draw(struct Sprite *sprite)
{
    int t;
    int r31;
    float f31;

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    t = sprite->userVar - sprite->counter - 60;
    f31 = 1.0f;
    r31 = MAX(mathutil_sin(t * 0x280) * 255.0f, 0.0f);
    if (func_8007F61C(sprite, t, f31))
    {
        set_text_mul_color(RGBA(255, 128, 0, 0));
        set_text_add_color(RGBA(r31, r31, r31, 0));
        u_draw_text("FLOOR SCORE : ");
    }
    if (lbl_8007F754_inline2(sprite, t, f31))
    {
        set_text_mul_color(RGBA(255, 128, 0, 0));
        set_text_add_color(RGBA(r31, r31, r31, 0));
        u_draw_text(sprite->text);
    }
    reset_text_draw_settings();
}

static void goal_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    if (!(gamePauseStatus & 0xA) && --sprite->counter <= 0)
        *arg0 = 0;
}

static void best_score_sprite_main(s8 *, struct Sprite *);
static void best_score_sprite_draw(struct Sprite *);
static void lbl_800800D4(struct Sprite *);

void u_show_practice_mode_score_info(int arg0)
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
        sprite->scaleX = 0.8f;
        sprite->scaleY = 0.8f;
        sprite->mulR = 255;
        sprite->mulG = 192;
        sprite->mulB = 0;
        sprite->userVar = arg0;
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
        sprite->scaleX = 0.8f;
        sprite->scaleY = 0.8f;
        sprite->mulR = 255;
        sprite->mulG = 192;
        sprite->mulB = 0;
        sprite->userVar = lbl_802F1CAC;
        sprite->drawFunc = lbl_800800D4;
        sprintf(sprite->text, "%d", sprite->userVar);
    }
    else
        printf("NULL\n");
}

static void best_score_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    switch (sprite->userVar)
    {
    case 1:
        SoundPitch(func_8002B610(0xA11D), 0);
        u_play_music(0x1E, 8);
        sprite->userVar = 2;
        sprite->counter = 120;
        break;
    case 2:
        if (--sprite->counter == 0)
        {
            sprite->userVar = 3;
            u_play_music(0x64, 8);
        }
        break;
    }
}

static void best_score_sprite_draw(struct Sprite *sprite)
{
    int i;
    u32 r28;

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    set_text_opacity(sprite->opacity);
    set_text_scale(sprite->scaleX, sprite->scaleY);
    r28 = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, 0);
    for (i = 0; i < 10; i++)
    {
        int phi_r4 = sprite->userVar > 0 && (unpausedFrameCounter >> 4) % 2 == ((i > 4) ? i + 1 : i) % 2;

        set_text_mul_color(phi_r4 ? RGBA(255, 0, 0, 0) : r28);
        set_text_pos(sprite->x + 20.0 * i * sprite->scaleX + ((i > 4) ? -8 : 0), sprite->y);
        u_draw_char(sprite->text[i]);
    }
}

static void lbl_800800D4(struct Sprite *sprite)
{
    struct Sprite *temp_r3;
    void (*drawFunc)(struct Sprite *);

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    set_text_opacity(sprite->opacity);
    set_text_scale(sprite->scaleX, sprite->scaleY);
    set_text_mul_color(RGBA(sprite->mulR, sprite->mulG, sprite->mulB, 0));

    drawFunc = sprite->drawFunc;
    sprite->drawFunc = NULL;
    calc_sprite_bounds(sprite, &sprite->left, &sprite->top, &sprite->right, &sprite->bottom);
    sprite->drawFunc = drawFunc;

    set_text_pos(sprite->left, sprite->top);
    u_draw_text(sprite->text);

    temp_r3 = find_sprite_with_tag(8);
    if (temp_r3 != NULL && temp_r3->userVar > 0)
    {
        float temp_f31 = 1.0 - __fabs(mathutil_sin(temp_r3->counter << 9));
        u32 temp_r30 = (1.0 - __fabs(mathutil_sin((temp_r3->counter << 9) + 0x4000))) * 255.0;

        func_80071B1C(0.09f);
        set_text_add_color(RGBA(temp_r30, temp_r30, temp_r30, 0));
        set_text_pos(sprite->left + (17.6 * strlen(sprite->text)), sprite->top);
        set_text_scale(0.8 + (0.3 * temp_f31), 0.8 + (0.4 * temp_f31));
        func_80072AC0("+%d", lbl_802F1CAC - sprite->userVar);
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

static void bomb_crack_sprite_main(s8 *arg0, struct Sprite *sprite)
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
        sprite->scaleX = temp_f0;
        sprite->scaleY = temp_f0;
        if (infoWork.timerCurr < 240)
        {
            sprite->userVar += 40.0f - (infoWork.timerCurr * 40.0f) / 240.0f;
            sprite->mulG = __abs(255 - (sprite->userVar % 510));
            sprite->mulB = sprite->mulG;
            if (sprite->mulB < 128)
                sprite->mulB = 128;
            sprite->mulB = (sprite->mulB - 128) * 2.0f;
        }
        if (infoWork.timerCurr <= 0)
            *arg0 = 0;
    }
}

float force_lbl_802F50C0() { return 0.19699999690055847f; }

#ifdef NONMATCHING
static void bomb_frag_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    s16 *asdf = (s16 *)&sprite->userVar;
    float temp_f0;
    float temp_f6;
    s16 temp_r7;
    s16 temp_r8;

    sprite->opacity *= 0.95f;
    sprite->scaleX *= 1.01f;
    sprite->scaleY *= 1.01f;
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
static asm void bomb_frag_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    nofralloc
#include "../asm/nonmatchings/bomb_frag_sprite_main.s"
}
#pragma peephole on
#endif

static s16 bombFragBitmapIds[] =
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

static float bombFragX[] = { 7.0f, 16.0f, 26.0f, 48.0f,  0.0f,  9.0f, 55.0f, 12.0f, 33.0f, 71.0f };
static float bombFragY[] = { 9.0f,  0.0f,  0.0f, 4.0f,  24.0f, 16.0f, 23.0f, 63.0f, 56.0f, 69.0f };

static void bomb_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    u8 dummy[8];
    float temp_f0;
    float x;
    float y;
    float temp_f30;
    float temp_f29;
    struct Sprite *fragSprite;
    u32 i;

    if (infoWork.timerCurr <= 600)
    {
        if (infoWork.timerCurr > 0)
        {
            temp_f0 = 1.0f + func_800802E0(infoWork.timerCurr);
            sprite->scaleX = temp_f0;
            sprite->scaleY = temp_f0;
            return;
        }

        // with no time left on clock, destroy this sprite and spawn fragments
        x = sprite->x;
        y = sprite->y;
        temp_f30 = sprite->scaleX;
        temp_f29 = sprite->scaleY;
        *arg0 = 0;
        u_debug_set_cursor_pos(5, 5);
        for (i = 0; i < 10; i++)
        {
            fragSprite = create_sprite();
            if (fragSprite == NULL)
                return;
            fragSprite->type = SPRITE_TYPE_BITMAP;
            fragSprite->tag = 2;
            fragSprite->x = x - 44.0f + bombFragX[i];
            fragSprite->y = y - 44.0f + bombFragY[i];
            fragSprite->fontId = FONT_ASCII;
            fragSprite->bmpId = bombFragBitmapIds[i];
            fragSprite->textAlign = ALIGN_LT;
            fragSprite->unk4C = 0.2f;
            fragSprite->mainFunc = bomb_frag_sprite_main;
            fragSprite->scaleX = temp_f30;
            fragSprite->scaleY = temp_f29;
            ((s16 *)&fragSprite->userVar)[0] = 1.2f * (bombFragX[i] - 30.0f);
            ((s16 *)&fragSprite->userVar)[1] = 1.2f * (bombFragY[i] - 20.0f);
            sprintf(fragSprite->text, "bomb_scat%d.pic", i);
        }
    }
}

void hud_show_bomb(float arg8, float arg9)
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
        sprite->mainFunc = bomb_sprite_main;
        sprintf(sprite->text, "timer.pic");
        y = sprite->y;
        x = sprite->x;

        // spawn a second sprite to show cracks
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
            sprite->mainFunc = bomb_crack_sprite_main;
            sprite->userVar = 0;
            sprintf(sprite->text, "hibi");
        }
    }
}
