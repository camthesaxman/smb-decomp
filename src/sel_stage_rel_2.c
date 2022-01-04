#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "mode.h"

static void sprite_func_B54(s8 *, struct Sprite *);
static void sprite_func_BC4(s8 *, struct Sprite *);

void lbl_0x00000A24(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->centerX = 320.0f;
        sprite->centerY = 56.0f;
        sprite->fontId = 100;
        sprite->textAlign = ALIGN_CC;
        strcpy(sprite->text, "SELECT A STAGE");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->centerX = 50.0f;
        sprite->centerY = 90.0f;
        sprite->fontId = 0x5D;
        sprite->textAlign = ALIGN_CC;
        sprite->unk40 = 0.5f;
        sprite->unk44 = 0.5f;
        sprite->mainFunc = sprite_func_B54;
        sprintf(sprite->text, "%d", modeCtrl.unk4 + 4);
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->centerX = 40.0f;
        sprite->centerY = 128.0f;
        sprite->fontId = 100;
        sprite->textAlign = ALIGN_LC;
        sprite->mainFunc = sprite_func_BC4;
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

static void sprite_func_B54(s8 *status, struct Sprite *sprite)
{
    if (lbl_802F1BE0.unk0 == 0)
        sprite->unk6C = 0.0f;
    else
    {
        sprite->unk6C = 1.0f;
        sprintf(sprite->text, "%d", modeCtrl.unk4 + 4);
    }
}

static void sprite_func_BC4(s8 *status, struct Sprite *sprite)
{
    if (lbl_802F1BE0.unk0 == 0)
        sprintf(sprite->text, "STAGE %d", loadingStageId);
    else if (modeCtrl.unk8 & (1 << 4))
        sprintf(sprite->text, "EXTRA 2\nFLOOR %d\nLIB. %d", lbl_802F1BE0.unk4, loadingStageId);
    else if (modeCtrl.unk8 & (1 << 3))
        sprintf(sprite->text, "EXTRA\nFLOOR %d\nLIB. %d", lbl_802F1BE0.unk4, loadingStageId);
    else
        sprintf(sprite->text, "FLOOR %d\nLIB. %d", lbl_802F1BE0.unk4, loadingStageId);
}

void lbl_0x00000C90(void) {}

void lbl_0x00000C94(void) {}

void lbl_0x00000C98(void) {}
