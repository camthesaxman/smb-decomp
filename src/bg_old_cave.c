/**
 * bg_old_cave.c - Code for the unused cave background from arcade Monkey Ball
 */
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "mathutil.h"
#include "nl2ngc.h"

void bg_old_cave_init(void)
{
    backgroundInfo.unk80 = NLOBJ_MODEL(g_bgNlObj, 1);
    backgroundInfo.unk84 = 1.0f;
}

void bg_old_cave_main(void) {}

void bg_old_cave_finish(void) {}

void bg_old_cave_draw(void)
{
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    nl2ngc_draw_model_sort_translucent_alt2(NLOBJ_MODEL(g_bgNlObj, 0));
}

void bg_old_cave_interact(int a) {}
