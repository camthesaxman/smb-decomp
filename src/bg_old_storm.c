#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "stcoli.h"

void bg_old_storm_init(void)
{
    Point3d spB4;
    struct Struct8003C550 sp8;

    backgroundInfo.unk80 = naomiBackgroundObj->modelPtrs[7];
    backgroundInfo.unk84 = 1.0f;
    spB4.x = 0.0f;
    spB4.y = 0.0f;
    spB4.z = -3.5f;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_inv_tf_point(&spB4, &backgroundInfo.unk2C);
    backgroundInfo.unk2C.y += 3.0;

    memset(&sp8, 0, sizeof(sp8));
    sp8.unk8 = 4;

    sp8.unkA0 = (rand() & 0x7FF) - 0x3FF;
    sp8.unkA2 = (rand() & 0x7FF) - 0x3FF;
    sp8.unkA4 = (rand() & 0x7FF) - 0x3FF;
    sp8.unk54 = -((rand() & 0x3F) + 16);
    sp8.unk30 = (void *)naomiBackgroundObj->modelPtrs[1];
    g_spawn_effect_object(&sp8);

    sp8.unkA0 = (rand() & 0x7FF) - 0x3FF;
    sp8.unkA2 = (rand() & 0x7FF) - 0x3FF;
    sp8.unkA4 = (rand() & 0x7FF) - 0x3FF;
    sp8.unk54 -= (rand() & 0x7F) + 0x20;
    sp8.unk30 = (void *)naomiBackgroundObj->modelPtrs[2];
    g_spawn_effect_object(&sp8);

    sp8.unkA0 = (rand() & 0x7FF) - 0x3FF;
    sp8.unkA2 = (rand() & 0x7FF) - 0x3FF;
    sp8.unkA4 = (rand() & 0x7FF) - 0x3FF;
    sp8.unk54 -= (rand() & 0x7F) + 0x20;
    sp8.unk30 = (void *)naomiBackgroundObj->modelPtrs[5];
    g_spawn_effect_object(&sp8);

    sp8.unkA0 = (rand() & 0x7FF) - 0x3FF;
    sp8.unkA2 = (rand() & 0x7FF) - 0x3FF;
    sp8.unkA4 = (rand() & 0x7FF) - 0x3FF;
    sp8.unk54 -= (rand() & 0x7F) + 0x20;
    sp8.unk30 = (void *)naomiBackgroundObj->modelPtrs[6];
    g_spawn_effect_object(&sp8);
}

void bg_old_storm_main(void)
{
    Point3d spDC;
    Point3d spD0;
    struct Struct8003C550 sp24;
    struct RaycastHit sp8;
    struct Ball *temp_r30 = currentBallStructPtr;

    if (gamePauseStatus & 0xA)
		return;
 
	memset(&sp24, 0, sizeof(sp24));
	sp24.unk8 = 7;
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
	spDC.x = (rand() / 32767.0f) - 0.5;
	spDC.y = (rand() / 32767.0f) - 0.5;
	spDC.z = (rand() / 32767.0f) - 0.5;
	mathutil_vec_set_len(&spDC, &sp24.unk34, 3.5 * (rand() / 32767.0f));
	sp24.unk34.x += spD0.x;
	sp24.unk34.y += spD0.y;
	sp24.unk34.z += spD0.z;
	sp24.unk40.x = 0.0f;
	sp24.unk40.y = -0.2f;
	sp24.unk40.z = 0.0f;
	sp24.unk18 = 0.2f;
	sp24.unk1C = 0.35f;
	sp24.unk20 = 0.4f;
	g_spawn_effect_object(&sp24);
	mathutil_mtxA_from_mtxB();
	spD0.x = 0.0f;
	spD0.y = 0.0f;
	spD0.z = -3.5f;
	mathutil_mtxA_rigid_inv_tf_point(&spD0, &spD0);
	spD0.x += 30.0 * temp_r30->vel.x;
	spD0.y += 2.0;
	spD0.z += 30.0 * temp_r30->vel.z;
	spDC.y = 0.0f;
	mathutil_vec_set_len(&spDC, &spDC, 4.0 * (rand() / 32767.0f));
	spD0.x += spDC.x;
	spD0.z += spDC.z;
	if (gameSubmode == SMD_GAME_CONTINUE_MAIN)
	{
		memset(&sp24, 0, sizeof(sp24));
		sp24.unk8 = 15;
		sp24.unk34.x = spD0.x;
		sp24.unk34.y = 0.0f;
		sp24.unk34.z = spD0.z;
		sp24.unk7C.x = 0.0f;
		sp24.unk7C.y = 0.0f;
		sp24.unk7C.z = 0.0f;
		sp24.unk70.x = 0.0f;
		sp24.unk70.y = 1.0f;
		sp24.unk70.z = 0.0f;
		mathutil_vec_to_euler_xy(&sp8.normal, &sp24.unk4C, &sp24.unk4E);
		sp24.unk50 = rand() & 0x7FFF;
		sp24.unk30 = (void *)naomiBackgroundObj->modelPtrs[8];
		g_spawn_effect_object(&sp24);
	}
	else if ((u32)raycast_stage_down(&spD0, &sp8, &spDC) != 0)
	{
		memset(&sp24, 0, sizeof(sp24));
		sp24.unk8 = 15;
		sp24.unk34.x = sp8.pos.x + 0.04 * sp8.normal.x;
		sp24.unk34.y = sp8.pos.y + 0.04 * sp8.normal.y;
		sp24.unk34.z = sp8.pos.z + 0.04 * sp8.normal.z;
		sp24.unk7C.x = spDC.x;
		sp24.unk7C.y = spDC.y;
		sp24.unk7C.z = spDC.z;
		sp24.unk70.x = sp8.normal.x;
		sp24.unk70.y = sp8.normal.y;
		sp24.unk70.z = sp8.normal.z;
		mathutil_vec_to_euler_xy(&sp8.normal, &sp24.unk4C, &sp24.unk4E);
		sp24.unk50 = rand() & 0x7FFF;
		sp24.unk30 = (void *)naomiBackgroundObj->modelPtrs[8];
		g_spawn_effect_object(&sp24);
	}

}

void bg_old_storm_finish(void) {}

void bg_old_storm_draw(void)
{
	mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
	g_call_draw_naomi_model_and_do_other_stuff(naomiBackgroundObj->modelPtrs[0]);
	g_call_draw_naomi_model_and_do_other_stuff(naomiBackgroundObj->modelPtrs[3]);
}

void bg_old_storm_interact(int arg0) {}
