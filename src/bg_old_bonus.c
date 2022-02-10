/**
 * bg_old_bonus.c - Code for the bonus stage background from arcade Monkey Ball
 */
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "mathutil.h"
#include "nl2ngc.h"

void bg_old_bonus_init(void)
{
    struct Struct8003C550 sp8;
    struct NaomiModel **r29;
    int r28;

    func_8008D36C(NLOBJ_MODEL(naomiBackgroundObj, 1), 0xFBFFFFFF, 0x4000000);
    backgroundInfo.unk80 = NLOBJ_MODEL(naomiBackgroundObj, 39);
    backgroundInfo.unk84 = 1.0f;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_scale_xyz(0.66666668653488159f, 0.66666668653488159f, 0.66666668653488159f);
    mathutil_mtxA_to_mtx(backgroundInfo.unk48);
    memset(&sp8, 0, sizeof(sp8));
    sp8.unk8 = 11;
    sp8.unk30 = (void *)NLOBJ_MODEL(naomiBackgroundObj, 1);
    sp8.unk10 = 0;
    r28 = strlen("obj_STARPOINT_");
    r29 = naomiBackgroundObj->modelPtrs;
    while (*r29 != NULL)
    {
        if (strncmp((void *)NLMODEL_HEADER(*r29)->unk0, "obj_STARPOINT_", r28) == 0)
        {
            sp8.unk34 = (*r29)->boundsCenter;
            g_spawn_effect_object(&sp8);
            sp8.unk10 += 30.0;
        }
        r29++;
    }
}

void bg_old_bonus_main(void)
{
    if (gamePauseStatus & 0xA)
        return;
}

void bg_old_bonus_finish(void) {}

void bg_old_bonus_draw(void)
{
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiBackgroundObj, 0));
}

void bg_old_bonus_interact(int a)
{
    struct Struct8003C550 sp18;
    Vec spC;
    float f31;

    switch (a)
    {
    case 0:
    case 1:
        memset(&sp18, 0, sizeof(sp18));
        sp18.unk8 = 12;
        sp18.unk14 = currentBallStructPtr->unk2E;
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
        spC.z = -180.0 + (rand() / 32767.0f) * -300.0;
        spC.x = spC.z * -2.6666666666666665 * currentCameraStructPtr->sub28.unk38 * (rand() / 32767.0f - 0.5);
        spC.y = spC.z * -1.1 * currentCameraStructPtr->sub28.unk38;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &sp18.unk34);
        f31 = -spC.z * 0.0033333333333333335;
        sp18.unk40.x = (1.0 + (rand() / 32767.0f)) * f31;
        sp18.unk40.y = (-3.0 + -1.0 * (rand() / 32767.0f)) * f31;
        sp18.unk40.z = (1.0 + (rand() / 32767.0f)) * f31;
        spC.x = 0.0f;
        spC.y = 0.0f;
        spC.z = 0.0f;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &spC);
        mathutil_ray_to_euler_xy(&spC, &sp18.unk34, &sp18.unk4C, &sp18.unk4E);
        sp18.unk50 = rand() & 0x7FFF;
        g_spawn_effect_object(&sp18);
        break;
    }
}
