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
    struct BGSunsetModel *r29;
    struct BGSunsetWork *work = backgroundInfo.unk9C;
    int i;
    Vec sp8;

    bg_e3_init();

    // find models
    work->bgModelsCount = 0;
    g_search_bg_models_from_list(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        sunsetModelFind,
        sunset_model_find_proc);
    g_search_bg_models_from_list(
        decodedStageLzPtr->unk74,
        decodedStageLzPtr->unk70,
        sunsetModelFind,
        sunset_model_find_proc);
    if (work->bgModelsCount == 0)
        return;

    work->unk168 = 0;

    r29 = work->bgModels;
    for (i = work->bgModelsCount; i > 0; i--, r29++)
    {
        r29->unk4.x = rand() / 32767.0f;
        r29->unk4.y = rand() / 32767.0f;
        r29->unk4.z = rand() / 32767.0f;
        mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
        sp8.x = 0.0f;
        sp8.y = ((rand() / 32767.0f) * 0.2f + 0.9f) * 0.0015151514671742916f;
        sp8.z = 0.0f;
        mathutil_mtxA_tf_vec(&sp8, &r29->unk1C);
        r29->unk10 = r29->unk1C;
    }
}

void bg_sunset_main(void)
{
    struct BGSunsetWork *work = backgroundInfo.unk9C;
    int i;
    struct BGSunsetModel *r29;
    int r28;
    Vec sp8;

    bg_e3_main();
    if (gamePauseStatus & 0xA)
        return;
    if (work->bgModelsCount == 0)
        return;
    if (work->unk168 == 0 && infoWork.timerCurr < 660.0f)
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
            sp8.y = ((rand() / 32767.0f) * 0.2f + 0.9f) * 0.0030303029343485832f;
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

void bg_sunset_finish(void) {}

void bg_sunset_draw(void)
{
    struct BGSunsetWork *work = backgroundInfo.unk9C;
    struct StageBgModel *r31;
    u32 r28;
    int i;
    struct BGSunsetModel *r30_;

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
    // draw cloud layers
    if (work->bgModelsCount != 0)
    {
        g_avdisp_set_some_int(1);
        r30_ = work->bgModels;
        for (i = work->bgModelsCount; i > 0; i--, r30_++)
        {
            r31 = r30_->unk0;
            if (r31->flags & r28)
            {
                g_avdisp_set_some_matrix(0, r30_->unk28);
                mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
                mathutil_mtxA_translate(&r31->pos);
                mathutil_mtxA_rotate_z(r31->rotZ);
                mathutil_mtxA_rotate_y(r31->rotY);
                mathutil_mtxA_rotate_x(r31->rotX);
                mathutil_mtxA_scale(&r31->scale);
                GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
                GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
                avdisp_draw_model_culled_sort_translucent(r31->model);
            }
        }
        g_avdisp_set_some_int(0);
    }
    bg_e3_draw();
}

void bg_sunset_interact(int a) {}

static int sunset_model_find_proc(int index, struct StageBgModel *bgModel)
{
    struct BGSunsetWork *work = backgroundInfo.unk9C;

    switch (index)
    {
    case 0:  // SUN_GROUND
    case 1:  // SUN_CLOUD_
        if (bgModel->model != NULL && work->bgModelsCount < 8)
        {
            work->bgModels[work->bgModelsCount].unk0 = bgModel;
            work->bgModelsCount++;
        }
        break;
    }
    return 1;
}
