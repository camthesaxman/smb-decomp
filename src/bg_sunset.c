/**
 * bg_sunset.c - Code for the sunset (or "Sky High") background
 */
#include <stdlib.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

static struct BGModelSearch sunsetModelFind[] =
{
    { BG_MDL_CMP_FULL,   "SUN_GROUND" },
    { BG_MDL_CMP_PREFIX, "SUN_CLOUD_" },
    { BG_MDL_CMP_END,    NULL },
};

static int sunset_model_find_proc(int, struct StageBgModel *);

void bg_sunset_init(void)
{
    struct BGSunsetModel *sunsetModel;
    struct BGSunsetWork *work = backgroundInfo.work;
    int i;
    Vec sp8;

    bg_e3_init();

    // find models
    work->bgModelsCount = 0;
    q_search_bg_models_from_list(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        sunsetModelFind,
        sunset_model_find_proc);
    q_search_bg_models_from_list(
        decodedStageLzPtr->fgModels,
        decodedStageLzPtr->fgModelCount,
        sunsetModelFind,
        sunset_model_find_proc);
    if (work->bgModelsCount == 0)
        return;

    work->mode = 0;

    sunsetModel = work->bgModels;
    for (i = work->bgModelsCount; i > 0; i--, sunsetModel++)
    {
        sunsetModel->texTranslation.x = rand() / 32767.0f;
        sunsetModel->texTranslation.y = rand() / 32767.0f;
        sunsetModel->texTranslation.z = rand() / 32767.0f;
        mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
        sp8.x = 0.0f;
        sp8.y = ((rand() / 32767.0f) * 0.2f + 0.9f) * 0.0015151514671742916f;
        sp8.z = 0.0f;
        mathutil_mtxA_tf_vec(&sp8, &sunsetModel->desiredTexVel);
        sunsetModel->currTexVel = sunsetModel->desiredTexVel;
    }
}

void bg_sunset_main(void)
{
    struct BGSunsetWork *work = backgroundInfo.work;
    int i;
    struct BGSunsetModel *sunsetModel;
    int speedUpTexVel;
    Vec newTexVel;

    bg_e3_main();
    if (gamePauseStatus & 0xA)
        return;
    if (work->bgModelsCount == 0)
        return;

    // Speed up texture scroll vel 11s before time over
    if (work->mode == 0 && infoWork.timerCurr < 660.0f)
    {
        work->mode = 1;
        speedUpTexVel = 1;
    }
    else
        speedUpTexVel = 0;

    sunsetModel = work->bgModels;
    for (i = work->bgModelsCount; i > 0; i--, sunsetModel++)
    {
        if (speedUpTexVel)
        {
            mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
            newTexVel.x = 0.0f;
            newTexVel.y = ((rand() / 32767.0f) * 0.2f + 0.9f) * 0.0030303029343485832f;
            newTexVel.z = 0.0f;
            mathutil_mtxA_tf_vec(&newTexVel, &sunsetModel->desiredTexVel);
        }
        sunsetModel->currTexVel.x += (sunsetModel->desiredTexVel.x - sunsetModel->currTexVel.x) * 0.05f;
        sunsetModel->currTexVel.y += (sunsetModel->desiredTexVel.y - sunsetModel->currTexVel.y) * 0.05f;
        sunsetModel->texTranslation.x += sunsetModel->currTexVel.x;
        sunsetModel->texTranslation.y += sunsetModel->currTexVel.y;
        mathutil_mtxA_from_translate(&sunsetModel->texTranslation);
        mathutil_mtxA_to_mtx(sunsetModel->texMtx);
    }
}

void bg_sunset_finish(void) {}

void bg_sunset_draw(void)
{
    struct BGSunsetWork *work = backgroundInfo.work;
    struct StageBgModel *bgModel;
    u32 r28;
    int i;
    struct BGSunsetModel *sunsetModel;

    if (lbl_801EEC90.unk0 & 1)
        r28 = 1 << 4;
    else
    {
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
            r28 = 1 << (modeCtrl.unk30 - 1);
        else
            r28 = 1 << 0;
    }
    sunsetModel = work->bgModels;
    for (i = work->bgModelsCount; i > 0; i--, sunsetModel++)
        sunsetModel->bgModel->flags &= ~0x10000;
    // draw cloud layers
    if (work->bgModelsCount != 0)
    {
        avdisp_enable_custom_tex_mtx(1);
        sunsetModel = work->bgModels;
        for (i = work->bgModelsCount; i > 0; i--, sunsetModel++)
        {
            bgModel = sunsetModel->bgModel;
            if (bgModel->flags & r28)
            {
                avdisp_set_custom_tex_mtx(0, sunsetModel->texMtx);
                mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
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
        avdisp_enable_custom_tex_mtx(0);
    }
    bg_e3_draw();
}

void bg_sunset_interact(int a) {}

static int sunset_model_find_proc(int index, struct StageBgModel *bgModel)
{
    struct BGSunsetWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // SUN_GROUND
    case 1:  // SUN_CLOUD_
        if (bgModel->model != NULL && work->bgModelsCount < 8)
        {
            work->bgModels[work->bgModelsCount].bgModel = bgModel;
            work->bgModelsCount++;
        }
        break;
    }
    return 1;
}
