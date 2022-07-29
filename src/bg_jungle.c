/**
 * bg_jungle.c - Code for the jungle background
 */
#include <stdlib.h>
#include <dolphin.h>

#include "dolphin/gx/GXEnum.h"
#include "global.h"
#include "background.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

static struct BGModelSearch jungleBgObjFind[] =
{
    { BG_MDL_CMP_PREFIX, "JUN_FIG_CLOUD_" },
    { BG_MDL_CMP_END,    NULL },
};

static int obj_find_proc(int, struct StageBgObject *);

void bg_jungle_init(void)
{
    struct BGJungleWork *work = backgroundInfo.work;
    int i;
    struct BGJungleCloud *cloud;
    Vec sp8;

    bg_default_init();
    func_800940B8();
    func_800946DC(s_bgLightInfo.infLightRotY, 0xC00);
    backgroundInfo.unk8 |= 1;

    // find models
    work->cloudCount = 0;
    find_background_objects(
        decodedStageLzPtr->bgObjects,
        decodedStageLzPtr->bgObjectCount,
        jungleBgObjFind,
        obj_find_proc);
    find_background_objects(
        decodedStageLzPtr->fgObjects,
        decodedStageLzPtr->fgObjectCount,
        jungleBgObjFind,
        obj_find_proc);
    if (work->cloudCount == 0)
        return;

    work->mode = 0;
    for (i = work->cloudCount, cloud = work->clouds; i > 0; i--, cloud++)
    {
        cloud->unk4.x = RAND_FLOAT();
        cloud->unk4.y = RAND_FLOAT();
        cloud->unk4.z = RAND_FLOAT();
        mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
        sp8.x = 0.0f;
        sp8.y = (RAND_FLOAT() * 0.2f + 0.9f) * 0.0018518518190830946f;
        sp8.z = 0.0f;
        mathutil_mtxA_tf_vec(&sp8, &cloud->unk1C);
        cloud->unk10 = cloud->unk1C;
    }
}

void bg_jungle_main(void)
{
    struct BGJungleWork *work = backgroundInfo.work;
    int i;
    struct BGJungleCloud *cloud;
    int speedUpTexVel;
    Vec sp8;

    func_800940E0();
    bg_default_main();
    if (gameSubmode == SMD_GAME_CONTINUE_INIT
     || gameSubmode == SMD_GAME_CONTINUE_MAIN
     || gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT
     || gameSubmode == SMD_GAME_OVER_INIT
     || gameSubmode == SMD_GAME_OVER_MAIN)
    {
        backgroundInfo.backdropColor.r = 0x55;
        backgroundInfo.backdropColor.g = 0x55;
        backgroundInfo.backdropColor.b = 0x55;
    }
    if (gamePauseStatus & 0xA)
        return;
    if (work->cloudCount == 0)
        return;
    // Speed up texture scroll when half of timer has elapsed
    if (work->mode == 0 && infoWork.timerCurr < (infoWork.timerMax >> 1))
    {
        work->mode = 1;
        speedUpTexVel = 1;
    }
    else
        speedUpTexVel = 0;
    cloud = work->clouds;
    for (i = work->cloudCount; i > 0; i--, cloud++)
    {
        if (speedUpTexVel)
        {
            mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
            sp8.x = 0.0f;
            sp8.y = (RAND_FLOAT() * 0.2f + 0.9f) * 0.0037037036381661892f;
            sp8.z = 0.0f;
            mathutil_mtxA_tf_vec(&sp8, &cloud->unk1C);
        }
        cloud->unk10.x += (cloud->unk1C.x - cloud->unk10.x) * 0.05f;
        cloud->unk10.y += (cloud->unk1C.y - cloud->unk10.y) * 0.05f;
        cloud->unk4.x += cloud->unk10.x;
        cloud->unk4.y += cloud->unk10.y;
        mathutil_mtxA_from_translate(&cloud->unk4);
        mathutil_mtxA_to_mtx(cloud->texMtx);
    }
}

void bg_jungle_finish(void) {}

void bg_jungle_draw(void)
{
    struct BGJungleWork *work = backgroundInfo.work;
    struct StageBgObject *cloudObj;
    u32 r28;
    int i;
    struct BGJungleCloud *cloud;

    if (gameSubmode == SMD_GAME_CONTINUE_INIT
     || gameSubmode == SMD_GAME_CONTINUE_MAIN
     || gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT
     || gameSubmode == SMD_GAME_OVER_INIT
     || gameSubmode == SMD_GAME_OVER_MAIN)
        avdisp_set_post_mult_color(0.3f, 0.3f, 0.3, 1.0f);

    if (lbl_801EEC90.unk0 & 1)
        r28 = 1 << 4;
    else if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        r28 = 1 << (modeCtrl.unk30 - 1);
    else
        r28 = 1 << 0;

    cloud = work->clouds;
    for (i = work->cloudCount; i > 0; i--, cloud++)
        cloud->bgObj->flags &= ~0x10000;

    bg_default_draw();

    if (work->cloudCount != 0)
    {
        avdisp_enable_custom_tex_mtx(1);
        avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_DISABLE);
        cloud = work->clouds;
        for (i = work->cloudCount; i > 0; i--, cloud++)
        {
            cloudObj = cloud->bgObj;
            if (cloudObj->flags & r28)
            {
                avdisp_set_custom_tex_mtx(0, cloud->texMtx);
                mathutil_mtxA_translate(&cloudObj->pos);
                mathutil_mtxA_rotate_z(cloudObj->rotZ);
                mathutil_mtxA_rotate_y(cloudObj->rotY);
                mathutil_mtxA_rotate_x(cloudObj->rotX);
                mathutil_mtxA_scale(&cloudObj->scale);
                GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
                GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
                avdisp_draw_model_culled_sort_translucent(cloudObj->model);
            }
        }
        avdisp_set_z_mode(1, 3, 1);
        avdisp_enable_custom_tex_mtx(0);
    }

    if (gameSubmode == SMD_GAME_CONTINUE_INIT
     || gameSubmode == SMD_GAME_CONTINUE_MAIN
     || gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT
     || gameSubmode == SMD_GAME_OVER_INIT
     || gameSubmode == SMD_GAME_OVER_MAIN)
        u_reset_post_mult_color();
}

void bg_jungle_interact(int a) {}

static int obj_find_proc(int index, struct StageBgObject *bgObj)
{
    struct BGJungleWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // JUN_FIG_CLOUD_
        if (bgObj->model != NULL && work->cloudCount < 2)
        {
            work->clouds[work->cloudCount].bgObj = bgObj;
            work->cloudCount++;
        }
        break;
    }
    return 1;
}
