#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "mode.h"
#include "sprite.h"

static void lvlset_icon_sprite_func(s8 *, struct Sprite *);
static void stage_name_sprite_func(s8 *, struct Sprite *);

void create_sel_stage_sprites(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 320.0f;
        sprite->y = 56.0f;
        sprite->fontId = 100;
        sprite->textAlign = ALIGN_CC;
        strcpy(sprite->text, "SELECT A STAGE");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 50.0f;
        sprite->y = 90.0f;
        sprite->fontId = 0x5D;
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.5f;
        sprite->unk44 = 0.5f;
        sprite->mainFunc = lvlset_icon_sprite_func;
        sprintf(sprite->text, "%d", modeCtrl.levelSet + 4);
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->x = 40.0f;
        sprite->y = 128.0f;
        sprite->fontId = 100;
        sprite->textAlign = ALIGN_LC;
        sprite->mainFunc = stage_name_sprite_func;
        sprintf(sprite->text, "STAGE %d", currStageId);
    }
}

static const u32 unused_crap[] =
{
    0x00000000,
    0x3FA99999,
    0x9999999A,
    0x43300000,
    0x00000000,
    0x43300000,
    0x80000000,
};

static void lvlset_icon_sprite_func(s8 *status, struct Sprite *sprite)
{
    if (stageSelection.levelSet == 0)
        sprite->opacity = 0.0f;
    else
    {
        sprite->opacity = 1.0f;
        // Characters '4' through '7' are the English level set icons
        sprintf(sprite->text, "%d", 4 + modeCtrl.levelSet);
    }
}

static void stage_name_sprite_func(s8 *status, struct Sprite *sprite)
{
    if (stageSelection.levelSet == 0)
        sprintf(sprite->text, "STAGE %d", loadingStageId);
    else if (modeCtrl.levelSetFlags & LVLSET_FLAG_MASTER)
        sprintf(sprite->text, "EXTRA 2\nFLOOR %d\nLIB. %d", stageSelection.levelNum, loadingStageId);
    else if (modeCtrl.levelSetFlags & LVLSET_FLAG_EXTRA)
        sprintf(sprite->text, "EXTRA\nFLOOR %d\nLIB. %d", stageSelection.levelNum, loadingStageId);
    else
        sprintf(sprite->text, "FLOOR %d\nLIB. %d", stageSelection.levelNum, loadingStageId);
}

void dummy_func_C90(void) {}

void dummy_func_C94(void) {}

void dummy_func_C98(void) {}
