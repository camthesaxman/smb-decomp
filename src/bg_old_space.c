/**
 * bg_old_space.c - Code for the space background from arcade Monkey Ball
 */
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "mathutil.h"
#include "nl2ngc.h"

void bg_old_space_init(void)
{
    backgroundInfo.unk80 = NLOBJ_MODEL(naomiBackgroundObj, 1);
    backgroundInfo.unk84 = 1.0f;
    backgroundInfo.unk38 = 0.00069444444444444447 - (rand() / 32767.0f) * 0.0013888888888888889;
    backgroundInfo.unk3C = -0.00034722222222222224 - (rand() / 32767.0f) * 0.00017361111111111112;
}

void bg_old_space_main(void)
{
    backgroundInfo.unk2C += backgroundInfo.unk38;
    while (backgroundInfo.unk2C > 1.0)
        backgroundInfo.unk2C -= 1.0;
    while (backgroundInfo.unk2C < 0.0)
        backgroundInfo.unk2C += 1.0;

    backgroundInfo.unk30 += backgroundInfo.unk3C;
    while (backgroundInfo.unk30 > 1.0)
        backgroundInfo.unk30 -= 1.0;
    while (backgroundInfo.unk30 < 0.0)
        backgroundInfo.unk30 += 1.0;
}

void bg_old_space_finish(void) {}

static void lbl_8005872C(struct NaomiVtxWithNormal *);
static void lbl_80058764(struct NaomiVtxWithColor *);

void bg_old_space_draw(void)
{
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiBackgroundObj, 0));
    memcpy(lbl_802F1B4C, NLOBJ_MODEL(naomiBackgroundObj, 2), NLMODEL_HEADER(NLOBJ_MODEL(naomiBackgroundObj, 2))->unk4->modelSize);
    g_apply_func_to_naomi_model_vertices(lbl_802F1B4C, lbl_8005872C, lbl_80058764);
    g_dupe_of_call_draw_naomi_model_1(lbl_802F1B4C);
}

void bg_old_space_interact(int a) {}

static void lbl_8005872C(struct NaomiVtxWithNormal *vtx)
{
    vtx->s += backgroundInfo.unk2C;
    vtx->t += backgroundInfo.unk30;
    *(u32 *)&vtx->t |= 1;  // WTF???
}

static void lbl_80058764(struct NaomiVtxWithColor *vtx)
{
    vtx->s += backgroundInfo.unk2C;
    vtx->t += backgroundInfo.unk30;
    *(u32 *)&vtx->t |= 1;  // WTF???
}
