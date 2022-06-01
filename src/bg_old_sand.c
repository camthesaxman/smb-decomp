/**
 * bg_old_sand.c - Code for the desert background from arcade Monkey Ball
 */
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "mathutil.h"
#include "nl2ngc.h"

void bg_old_sand_init(void)
{
    backgroundInfo.unk80 = NLOBJ_MODEL(naomiBackgroundObj, 2);
    backgroundInfo.unk84 = 1.0f;
    backgroundInfo.unk38.x = (rand() / 32767.0f) * 65536.0f / 3840.0 + 34.133333333333333;
    backgroundInfo.unk38.y = (rand() / 32767.0f) * 0.00034722222222222224 + 0.00069444444444444447;
    backgroundInfo.unk38.z = (rand() / 32767.0f) * 0.00050000000000000001 + 0.0033;
}

void bg_old_sand_main(void)
{
    backgroundInfo.unk2C.x += backgroundInfo.unk38.x;
    if (backgroundInfo.unk2C.x > 65536.0f)
        backgroundInfo.unk2C.x -= 65536.0f;

    backgroundInfo.unk2C.y += backgroundInfo.unk38.y;
    if (backgroundInfo.unk2C.y > 1.0)
        backgroundInfo.unk2C.y -= 1.0;

    backgroundInfo.unk2C.z += backgroundInfo.unk38.z;
    if (backgroundInfo.unk2C.z > 1.0)
        backgroundInfo.unk2C.z -= 1.0;
}

void bg_old_sand_finish(void) {}

static void lbl_800599FC(struct NaomiVtxWithNormal *);
static void lbl_80059A24(struct NaomiVtxWithColor *);
static void lbl_80059A4C(struct NaomiVtxWithNormal *);
static void lbl_80059A74(struct NaomiVtxWithColor *);

void bg_old_sand_draw(void)
{
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    u_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiBackgroundObj, 0));

    memcpy(lbl_802F1B4C, NLOBJ_MODEL(naomiBackgroundObj, 1), NLMODEL_HEADER(NLOBJ_MODEL(naomiBackgroundObj, 1))->unk4->modelSize);
    u_apply_func_to_naomi_model_vertices(lbl_802F1B4C, lbl_800599FC, lbl_80059A24);
    u_dupe_of_call_draw_naomi_model_1(lbl_802F1B4C);

    memcpy(lbl_802F1B4C, NLOBJ_MODEL(naomiBackgroundObj, 3), NLMODEL_HEADER(NLOBJ_MODEL(naomiBackgroundObj, 3))->unk4->modelSize);
    u_apply_func_to_naomi_model_vertices(lbl_802F1B4C, lbl_80059A4C, lbl_80059A74);
    u_dupe_of_call_draw_naomi_model_1(lbl_802F1B4C);

    mathutil_mtxA_rotate_y((s16)-backgroundInfo.unk2C.x);
    u_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiBackgroundObj, 4));
}

void bg_old_sand_interact(int a) {}

static void lbl_800599FC(struct NaomiVtxWithNormal *vtx)
{
    vtx->t += backgroundInfo.unk2C.y;
    *(u32 *)&vtx->t |= 1;  // WTF???
}

static void lbl_80059A24(struct NaomiVtxWithColor *vtx)
{
    vtx->t += backgroundInfo.unk2C.y;
    *(u32 *)&vtx->t |= 1;  // WTF???
}

static void lbl_80059A4C(struct NaomiVtxWithNormal *vtx)
{
    vtx->t += backgroundInfo.unk2C.z;
    *(u32 *)&vtx->t |= 1;  // WTF???
}

static void lbl_80059A74(struct NaomiVtxWithColor *vtx)
{
    vtx->t += backgroundInfo.unk2C.z;
    *(u32 *)&vtx->t |= 1;  // WTF???
}
