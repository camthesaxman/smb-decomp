/**
 * bg_jungle.c - Code for the jungle background
 */
#include <stdlib.h>
#include <dolphin.h>

#include "dolphin/GXEnum.h"
#include "global.h"
#include "background.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

static struct BGModelSearch jungleModelFind[] =
{
    { BG_MDL_CMP_PREFIX, "JUN_FIG_CLOUD_" },
    { BG_MDL_CMP_END,    NULL },
};

static int jungle_model_find_proc(int, struct StageBgModel *);

void bg_jungle_init(void)
{
    struct BGJungleWork *work = backgroundInfo.work;
    int i;
    struct BGJungleCloud *r29;
    Vec sp8;

    bg_e3_init();
    func_800940B8();
    func_800946DC(s_bgLightInfo.infLightRotY, 0xC00);
    backgroundInfo.unk8 |= 1;

    // find models
    work->cloudModelCount = 0;
    g_search_bg_models_from_list(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        jungleModelFind,
        jungle_model_find_proc);
    g_search_bg_models_from_list(
        decodedStageLzPtr->fgModels,
        decodedStageLzPtr->fgModelCount,
        jungleModelFind,
        jungle_model_find_proc);
    if (work->cloudModelCount == 0)
        return;

    work->unk168 = 0;
    for (i = work->cloudModelCount, r29 = work->cloudModels; i > 0; i--, r29++)
    {
        r29->unk4.x = rand() / 32767.0f;
        r29->unk4.y = rand() / 32767.0f;
        r29->unk4.z = rand() / 32767.0f;
        mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
        sp8.x = 0.0f;
        sp8.y = ((rand() / 32767.0f) * 0.2f + 0.9f) * 0.0018518518190830946f;
        sp8.z = 0.0f;
        mathutil_mtxA_tf_vec(&sp8, &r29->unk1C);
        r29->unk10 = r29->unk1C;
    }
}

void bg_jungle_main(void)
{
    struct BGJungleWork *work = backgroundInfo.work;
    int i;
    struct BGJungleCloud *r29;
    int r28;
    Vec sp8;

    func_800940E0();
    bg_e3_main();
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
    if (work->cloudModelCount == 0)
        return;
    if (work->unk168 == 0 && infoWork.timerCurr < (infoWork.timerMax >> 1))
    {
        work->unk168 = 1;
        r28 = 1;
    }
    else
        r28 = 0;
    r29 = work->cloudModels;
    for (i = work->cloudModelCount; i > 0; i--, r29++)
    {
        if (r28)
        {
            mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
            sp8.x = 0.0f;
            sp8.y = ((rand() / 32767.0f) * 0.2f + 0.9f) * 0.0037037036381661892f;
            sp8.z = 0.0f;
            mathutil_mtxA_tf_vec(&sp8, &r29->unk1C);
        }
        r29->unk10.x += (r29->unk1C.x - r29->unk10.x) * 0.05f;
        r29->unk10.y += (r29->unk1C.y - r29->unk10.y) * 0.05f;
        r29->unk4.x += r29->unk10.x;
        r29->unk4.y += r29->unk10.y;
        mathutil_mtxA_from_translate(&r29->unk4);
        mathutil_mtxA_to_mtx(r29->unk28);
    }
}

void bg_jungle_finish(void) {}

void bg_jungle_draw(void)
{
    struct BGJungleWork *work = backgroundInfo.work;
    struct StageBgModel *bgModel;
    u32 r28;
    int i;
    struct BGJungleCloud *cloudModel;

    if (gameSubmode == SMD_GAME_CONTINUE_INIT
     || gameSubmode == SMD_GAME_CONTINUE_MAIN
     || gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT
     || gameSubmode == SMD_GAME_OVER_INIT
     || gameSubmode == SMD_GAME_OVER_MAIN)
        avdisp_set_post_mult_color(0.3f, 0.3f, 0.3, 1.0f);

    if (lbl_801EEC90.unk0 & 1)
        r28 = 1 << 4;
    else
    {
        if (modeCtrl.gameType == 1)
            r28 = 1 << (modeCtrl.unk30 - 1);
        else
            r28 = 1 << 0;
    }
    cloudModel = work->cloudModels;
    for (i = work->cloudModelCount; i > 0; i--, cloudModel++)
        cloudModel->bgModel->flags &= ~0x10000;
    bg_e3_draw();
    if (work->cloudModelCount != 0)
    {
        avdisp_enable_custom_tex_mtx(1);
        avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_DISABLE);
        cloudModel = work->cloudModels;
        for (i = work->cloudModelCount; i > 0; i--, cloudModel++)
        {
            bgModel = cloudModel->bgModel;
            if (bgModel->flags & r28)
            {
                avdisp_set_custom_tex_mtx(0, cloudModel->unk28);
                mathutil_mtxA_translate(&bgModel->pos);
                mathutil_mtxA_rotate_z(bgModel->rotZ);
                mathutil_mtxA_rotate_y(bgModel->rotY);
                mathutil_mtxA_rotate_x(bgModel->rotX);
                mathutil_mtxA_scale(&bgModel->scale);
                GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
                GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
                avdisp_draw_model_culled_sort_translucent(bgModel->model);
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
        g_reset_post_mult_color();
}

void bg_jungle_interact(int a) {}

static int jungle_model_find_proc(int index, struct StageBgModel *bgModel)
{
    struct BGJungleWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // JUN_FIG_CLOUD_
        if (bgModel->model != NULL && work->cloudModelCount < 2)
        {
            work->cloudModels[work->cloudModelCount].bgModel = bgModel;
            work->cloudModelCount++;
        }
        break;
    }
    return 1;
}
