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
    struct Effect effect;
    struct NlModel **modelIter;
    int len;

    func_8008D36C(NLOBJ_MODEL(g_bgNlObj, 1), 0xFBFFFFFF, 0x4000000);
    backgroundInfo.unk80 = NLOBJ_MODEL(g_bgNlObj, 39);
    backgroundInfo.unk84 = 1.0f;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_scale_xyz(0.66666668653488159f, 0.66666668653488159f, 0.66666668653488159f);
    mathutil_mtxA_to_mtx(backgroundInfo.unk48);
    memset(&effect, 0, sizeof(effect));
    effect.unk8 = 11;
    effect.unk30 = (void *)NLOBJ_MODEL(g_bgNlObj, 1);
    effect.unk10 = 0;
    len = strlen("obj_STARPOINT_");
    modelIter = g_bgNlObj->models;
    while (*modelIter != NULL)
    {
        if (strncmp(NLMODEL_HEADER(*modelIter)->unk0->unk0, "obj_STARPOINT_", len) == 0)
        {
            effect.unk34 = (*modelIter)->boundSphereCenter;
            spawn_effect(&effect);
            effect.unk10 += 30.0;
        }
        modelIter++;
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
    nl2ngc_draw_model_sort_translucent_alt2(NLOBJ_MODEL(g_bgNlObj, 0));
}

void bg_old_bonus_interact(int a)
{
    struct Effect sp18;
    Vec spC;
    float f31;

    switch (a)
    {
    case 0:
    case 1:
        memset(&sp18, 0, sizeof(sp18));
        sp18.unk8 = 12;
        sp18.unk14 = currentBallStructPtr->playerId;
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
        spawn_effect(&sp18);
        break;
    }
}
