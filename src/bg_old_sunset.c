/**
 * bg_old_sunset.c - Code for the sunset background from arcade Monkey Ball
 */
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "mathutil.h"
#include "nl2ngc.h"

void bg_old_sunset_init(void)
{
    backgroundInfo.unk80 = NLOBJ_MODEL(g_bgNlObj, 1);
    backgroundInfo.unk84 = 1.0f;
}

void bg_old_sunset_main(void) {}

void bg_old_sunset_finish(void) {}

void bg_old_sunset_draw(void)
{
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    nl2ngc_draw_model_sort_translucent_alt2(NLOBJ_MODEL(g_bgNlObj, 0));
}

void bg_old_sunset_interact(int a) {}

