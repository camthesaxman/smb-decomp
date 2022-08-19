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
#include "effect.h"
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
    effect.type = ET_TWINKLE_STAR;
    effect.model = (void *)NLOBJ_MODEL(g_bgNlObj, 1);
    effect.u_otherTimer = 0;
    len = strlen("obj_STARPOINT_");
    modelIter = g_bgNlObj->models;
    while (*modelIter != NULL)
    {
        if (strncmp(NLMODEL_HEADER(*modelIter)->unk0->unk0, "obj_STARPOINT_", len) == 0)
        {
            effect.pos = (*modelIter)->boundSphereCenter;
            spawn_effect(&effect);
            effect.u_otherTimer += 30.0;
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
    struct Effect star;
    Vec spC;
    float f31;

    switch (a)
    {
    case 0:
    case 1:
        // spawn shooting star
        memset(&star, 0, sizeof(star));
        star.type = ET_BONUS_STG_STAR;
        star.playerId = currentBallStructPtr->playerId;
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
        spC.z = -180.0 + RAND_FLOAT() * -300.0;
        spC.x = spC.z * -2.6666666666666665 * currentCameraStructPtr->sub28.unk38 * (RAND_FLOAT() - 0.5);
        spC.y = spC.z * -1.1 * currentCameraStructPtr->sub28.unk38;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &star.pos);
        f31 = -spC.z * 0.0033333333333333335;
        star.vel.x = (1.0 + RAND_FLOAT()) * f31;
        star.vel.y = (-3.0 + -1.0 * RAND_FLOAT()) * f31;
        star.vel.z = (1.0 + RAND_FLOAT()) * f31;
        spC.x = 0.0f;
        spC.y = 0.0f;
        spC.z = 0.0f;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &spC);
        mathutil_ray_to_euler_xy(&spC, &star.pos, &star.rotX, &star.rotY);
        star.rotZ = rand() & 0x7FFF;
        spawn_effect(&star);
        break;
    }
}
