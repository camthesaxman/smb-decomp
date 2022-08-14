/**
 * bg_old_storm.c - Code for the storm background from arcade Monkey Ball
 */
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "effect.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "stcoli.h"

void bg_old_storm_init(void)
{
    Point3d spB4;
    struct Effect effect;

    backgroundInfo.unk80 = g_bgNlObj->models[7];
    backgroundInfo.unk84 = 1.0f;
    spB4.x = 0.0f;
    spB4.y = 0.0f;
    spB4.z = -3.5f;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_inv_tf_point(&spB4, &backgroundInfo.unk2C);
    backgroundInfo.unk2C.y += 3.0;

    memset(&effect, 0, sizeof(effect));
    effect.type = ET_ROTATE_BG;

    effect.unkA0 = (rand() & 0x7FF) - 0x3FF;
    effect.unkA2 = (rand() & 0x7FF) - 0x3FF;
    effect.unkA4 = (rand() & 0x7FF) - 0x3FF;
    effect.unk54 = -((rand() & 0x3F) + 16);
    effect.model = (void *)g_bgNlObj->models[1];
    spawn_effect(&effect);

    effect.unkA0 = (rand() & 0x7FF) - 0x3FF;
    effect.unkA2 = (rand() & 0x7FF) - 0x3FF;
    effect.unkA4 = (rand() & 0x7FF) - 0x3FF;
    effect.unk54 -= (rand() & 0x7F) + 0x20;
    effect.model = (void *)g_bgNlObj->models[2];
    spawn_effect(&effect);

    effect.unkA0 = (rand() & 0x7FF) - 0x3FF;
    effect.unkA2 = (rand() & 0x7FF) - 0x3FF;
    effect.unkA4 = (rand() & 0x7FF) - 0x3FF;
    effect.unk54 -= (rand() & 0x7F) + 0x20;
    effect.model = (void *)g_bgNlObj->models[5];
    spawn_effect(&effect);

    effect.unkA0 = (rand() & 0x7FF) - 0x3FF;
    effect.unkA2 = (rand() & 0x7FF) - 0x3FF;
    effect.unkA4 = (rand() & 0x7FF) - 0x3FF;
    effect.unk54 -= (rand() & 0x7F) + 0x20;
    effect.model = (void *)g_bgNlObj->models[6];
    spawn_effect(&effect);
}

void bg_old_storm_main(void)
{
    Point3d spDC;
    Point3d spD0;
    struct Effect effect;
    struct RaycastHit sp8;
    struct Ball *temp_r30 = currentBallStructPtr;

    if (gamePauseStatus & 0xA)
        return;
 
    memset(&effect, 0, sizeof(effect));
    effect.type = ET_RAINDROP;
    spDC.x = 0.0f;
    spDC.y = 0.0f;
    spDC.z = -3.5f;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_inv_tf_point(&spDC, &spD0);
    spD0.y += 3.0;
    spDC.x = 4.0 * (spD0.x - backgroundInfo.unk2C.x);
    spDC.y = 4.0 * (spD0.y - backgroundInfo.unk2C.y);
    spDC.z = 4.0 * (spD0.z - backgroundInfo.unk2C.z);
    backgroundInfo.unk2C.x = spD0.x;
    backgroundInfo.unk2C.y = spD0.y;
    backgroundInfo.unk2C.z = spD0.z;
    spD0.x += spDC.x;
    spD0.y += spDC.y;
    spD0.z += spDC.z;
    spDC.x = RAND_FLOAT() - 0.5;
    spDC.y = RAND_FLOAT() - 0.5;
    spDC.z = RAND_FLOAT() - 0.5;
    mathutil_vec_set_len(&spDC, &effect.unk34, 3.5 * RAND_FLOAT());
    effect.unk34.x += spD0.x;
    effect.unk34.y += spD0.y;
    effect.unk34.z += spD0.z;
    effect.unk40.x = 0.0f;
    effect.unk40.y = -0.2f;
    effect.unk40.z = 0.0f;
    effect.unk18 = 0.2f;
    effect.unk1C = 0.35f;
    effect.unk20 = 0.4f;
    spawn_effect(&effect);
    mathutil_mtxA_from_mtxB();
    spD0.x = 0.0f;
    spD0.y = 0.0f;
    spD0.z = -3.5f;
    mathutil_mtxA_rigid_inv_tf_point(&spD0, &spD0);
    spD0.x += 30.0 * temp_r30->vel.x;
    spD0.y += 2.0;
    spD0.z += 30.0 * temp_r30->vel.z;
    spDC.y = 0.0f;
    mathutil_vec_set_len(&spDC, &spDC, 4.0 * RAND_FLOAT());
    spD0.x += spDC.x;
    spD0.z += spDC.z;
    if (gameSubmode == SMD_GAME_CONTINUE_MAIN)
    {
        memset(&effect, 0, sizeof(effect));
        effect.type = ET_RAINDROP_RIPPLE;
        effect.unk34.x = spD0.x;
        effect.unk34.y = 0.0f;
        effect.unk34.z = spD0.z;
        effect.unk7C.x = 0.0f;
        effect.unk7C.y = 0.0f;
        effect.unk7C.z = 0.0f;
        effect.unk70.x = 0.0f;
        effect.unk70.y = 1.0f;
        effect.unk70.z = 0.0f;
        mathutil_vec_to_euler_xy(&sp8.normal, &effect.unk4C, &effect.unk4E);
        effect.unk50 = rand() & 0x7FFF;
        effect.model = (void *)g_bgNlObj->models[8];
        spawn_effect(&effect);
    }
    else if ((u32)raycast_stage_down(&spD0, &sp8, &spDC) != 0)
    {
        memset(&effect, 0, sizeof(effect));
        effect.type = ET_RAINDROP_RIPPLE;
        effect.unk34.x = sp8.pos.x + 0.04 * sp8.normal.x;
        effect.unk34.y = sp8.pos.y + 0.04 * sp8.normal.y;
        effect.unk34.z = sp8.pos.z + 0.04 * sp8.normal.z;
        effect.unk7C.x = spDC.x;
        effect.unk7C.y = spDC.y;
        effect.unk7C.z = spDC.z;
        effect.unk70.x = sp8.normal.x;
        effect.unk70.y = sp8.normal.y;
        effect.unk70.z = sp8.normal.z;
        mathutil_vec_to_euler_xy(&sp8.normal, &effect.unk4C, &effect.unk4E);
        effect.unk50 = rand() & 0x7FFF;
        effect.model = (void *)g_bgNlObj->models[8];
        spawn_effect(&effect);
    }

}

void bg_old_storm_finish(void) {}

void bg_old_storm_draw(void)
{
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    nl2ngc_draw_model_sort_translucent_alt2(g_bgNlObj->models[0]);
    nl2ngc_draw_model_sort_translucent_alt2(g_bgNlObj->models[3]);
}

void bg_old_storm_interact(int arg0) {}
