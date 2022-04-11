/**
 * bg_jungle.c - Code for the jungle background
 */
#include <stdlib.h>
#include <dolphin.h>

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
    struct BGJungleWork *work = backgroundInfo.unk9C;
    int i;
    struct BGJungleCloud *r29;
    Vec sp8;

    bg_e3_init();
    func_800940B8();
    func_800946DC(lbl_801F0614.unk42, 0xC00);
    backgroundInfo.unk8 |= 1;

    // find models
    work->bgModelsCount = 0;
    g_search_bg_models_from_list(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        jungleModelFind,
        jungle_model_find_proc);
    g_search_bg_models_from_list(
        decodedStageLzPtr->unk74,
        decodedStageLzPtr->unk70,
        jungleModelFind,
        jungle_model_find_proc);
    if (work->bgModelsCount == 0)
        return;

    work->unk168 = 0;
    for (i = work->bgModelsCount, r29 = work->bgModels; i > 0; i--, r29++)
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
    struct BGJungleWork *work = backgroundInfo.unk9C;
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
    if (work->bgModelsCount == 0)
        return;
    if (work->unk168 == 0 && infoWork.timerCurr < (infoWork.timerMax >> 1))
    {
        work->unk168 = 1;
        r28 = 1;
    }
    else
        r28 = 0;
    r29 = work->bgModels;
    for (i = work->bgModelsCount; i > 0; i--, r29++)
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
    struct BGJungleWork *work = backgroundInfo.unk9C;
    struct StageBgModel *r31;
    u32 r28;
    int i;
    struct BGJungleCloud *r30_;

    if (gameSubmode == SMD_GAME_CONTINUE_INIT
     || gameSubmode == SMD_GAME_CONTINUE_MAIN
     || gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT
     || gameSubmode == SMD_GAME_OVER_INIT
     || gameSubmode == SMD_GAME_OVER_MAIN)
        g_avdisp_set_some_color_1(0.3f, 0.3f, 0.3, 1.0f);

    if (lbl_801EEC90.unk0 & 1)
        r28 = 1 << 4;
    else
    {
        if (modeCtrl.gameType == 1)
            r28 = 1 << (modeCtrl.unk30 - 1);
        else
            r28 = 1 << 0;
    }
    r30_ = work->bgModels;
    for (i = work->bgModelsCount; i > 0; i--, r30_++)
        r30_->unk0->flags &= ~0x10000;
    bg_e3_draw();
    if (work->bgModelsCount != 0)
    {
        func_8008F6D4(1);
        avdisp_set_z_mode(1, 3, 0);
        r30_ = work->bgModels;
        for (i = work->bgModelsCount; i > 0; i--, r30_++)
        {
            r31 = r30_->unk0;
            if (r31->flags & r28)
            {
                g_avdisp_set_some_matrix(0, r30_->unk28);
                mathutil_mtxA_translate(&r31->pos);
                mathutil_mtxA_rotate_z(r31->rotZ);
                mathutil_mtxA_rotate_y(r31->rotY);
                mathutil_mtxA_rotate_x(r31->rotX);
                mathutil_mtxA_scale(&r31->scale);
                GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
                GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
                g_avdisp_maybe_draw_model_1(r31->model);
            }
        }
        avdisp_set_z_mode(1, 3, 1);
        func_8008F6D4(0);
    }

    if (gameSubmode == SMD_GAME_CONTINUE_INIT
     || gameSubmode == SMD_GAME_CONTINUE_MAIN
     || gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT
     || gameSubmode == SMD_GAME_OVER_INIT
     || gameSubmode == SMD_GAME_OVER_MAIN)
        func_8000E3BC();
}

void bg_jungle_interact(int a) {}

static int jungle_model_find_proc(int index, struct StageBgModel *bgModel)
{
    struct BGJungleWork *work = backgroundInfo.unk9C;

    switch (index)
    {
    case 0:  // JUN_FIG_CLOUD_
        if (bgModel->model != NULL && work->bgModelsCount < 2)
        {
            work->bgModels[work->bgModelsCount].unk0 = bgModel;
            work->bgModelsCount++;
        }
        break;
    }
    return 1;
}
