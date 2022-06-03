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
    backgroundInfo.unk80 = NLOBJ_MODEL(g_bgNlObj, 1);
    backgroundInfo.unk84 = 1.0f;
    backgroundInfo.unk38.x = 0.00069444444444444447 - (rand() / 32767.0f) * 0.0013888888888888889;
    backgroundInfo.unk38.y = -0.00034722222222222224 - (rand() / 32767.0f) * 0.00017361111111111112;
}

void bg_old_space_main(void)
{
    backgroundInfo.unk2C.x += backgroundInfo.unk38.x;
    while (backgroundInfo.unk2C.x > 1.0)
        backgroundInfo.unk2C.x -= 1.0;
    while (backgroundInfo.unk2C.x < 0.0)
        backgroundInfo.unk2C.x += 1.0;

    backgroundInfo.unk2C.y += backgroundInfo.unk38.y;
    while (backgroundInfo.unk2C.y > 1.0)
        backgroundInfo.unk2C.y -= 1.0;
    while (backgroundInfo.unk2C.y < 0.0)
        backgroundInfo.unk2C.y += 1.0;
}

void bg_old_space_finish(void) {}

static void lbl_8005872C(struct NlVtxTypeB *);
static void lbl_80058764(struct NlVtxTypeA *);

void bg_old_space_draw(void)
{
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    nl2ngc_draw_model_sort_translucent_alt2(NLOBJ_MODEL(g_bgNlObj, 0));
    memcpy(lbl_802F1B4C, NLOBJ_MODEL(g_bgNlObj, 2), NLMODEL_HEADER(NLOBJ_MODEL(g_bgNlObj, 2))->unk4->modelSize);
    u_apply_func_to_nl_model_vertices(lbl_802F1B4C, lbl_8005872C, lbl_80058764);
    nl2ngc_draw_model_sort_none_alt2(lbl_802F1B4C);
}

void bg_old_space_interact(int a) {}

static void lbl_8005872C(struct NlVtxTypeB *vtx)
{
    vtx->s += backgroundInfo.unk2C.x;
    vtx->t += backgroundInfo.unk2C.y;
    *(u32 *)&vtx->t |= 1;  // WTF???
}

static void lbl_80058764(struct NlVtxTypeA *vtx)
{
    vtx->s += backgroundInfo.unk2C.x;
    vtx->t += backgroundInfo.unk2C.y;
    *(u32 *)&vtx->t |= 1;  // WTF???
}
