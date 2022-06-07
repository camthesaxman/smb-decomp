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

static struct BGModelSearch sunsetBgObjFind[] =
{
    { BG_MDL_CMP_FULL,   "SUN_GROUND" },
    { BG_MDL_CMP_PREFIX, "SUN_CLOUD_" },
    { BG_MDL_CMP_END,    NULL },
};

static int obj_find_proc(int, struct StageBgObject *);

void bg_sunset_init(void)
{
    struct BGSunsetLayer *layer;
    struct BGSunsetWork *work = backgroundInfo.work;
    int i;
    Vec sp8;

    bg_default_init();

    // find models
    work->layersCount = 0;
    find_background_objects(
        decodedStageLzPtr->bgObjects,
        decodedStageLzPtr->bgObjectCount,
        sunsetBgObjFind,
        obj_find_proc);
    find_background_objects(
        decodedStageLzPtr->fgObjects,
        decodedStageLzPtr->fgObjectCount,
        sunsetBgObjFind,
        obj_find_proc);
    if (work->layersCount == 0)
        return;

    work->mode = 0;

    layer = work->layers;
    for (i = work->layersCount; i > 0; i--, layer++)
    {
        layer->texTranslation.x = rand() / 32767.0f;
        layer->texTranslation.y = rand() / 32767.0f;
        layer->texTranslation.z = rand() / 32767.0f;
        mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
        sp8.x = 0.0f;
        sp8.y = ((rand() / 32767.0f) * 0.2f + 0.9f) * 0.0015151514671742916f;
        sp8.z = 0.0f;
        mathutil_mtxA_tf_vec(&sp8, &layer->desiredTexVel);
        layer->currTexVel = layer->desiredTexVel;
    }
}

void bg_sunset_main(void)
{
    struct BGSunsetWork *work = backgroundInfo.work;
    int i;
    struct BGSunsetLayer *layer;
    int speedUpTexVel;
    Vec newTexVel;

    bg_default_main();
    if (gamePauseStatus & 0xA)
        return;
    if (work->layersCount == 0)
        return;

    // Speed up texture scroll vel 11s before time over
    if (work->mode == 0 && infoWork.timerCurr < 660.0f)
    {
        work->mode = 1;
        speedUpTexVel = 1;
    }
    else
        speedUpTexVel = 0;

    layer = work->layers;
    for (i = work->layersCount; i > 0; i--, layer++)
    {
        if (speedUpTexVel)
        {
            mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
            newTexVel.x = 0.0f;
            newTexVel.y = ((rand() / 32767.0f) * 0.2f + 0.9f) * 0.0030303029343485832f;
            newTexVel.z = 0.0f;
            mathutil_mtxA_tf_vec(&newTexVel, &layer->desiredTexVel);
        }
        layer->currTexVel.x += (layer->desiredTexVel.x - layer->currTexVel.x) * 0.05f;
        layer->currTexVel.y += (layer->desiredTexVel.y - layer->currTexVel.y) * 0.05f;
        layer->texTranslation.x += layer->currTexVel.x;
        layer->texTranslation.y += layer->currTexVel.y;
        mathutil_mtxA_from_translate(&layer->texTranslation);
        mathutil_mtxA_to_mtx(layer->texMtx);
    }
}

void bg_sunset_finish(void) {}

void bg_sunset_draw(void)
{
    struct BGSunsetWork *work = backgroundInfo.work;
    struct StageBgObject *bgObj;
    u32 r28;
    int i;
    struct BGSunsetLayer *layer;

    if (lbl_801EEC90.unk0 & 1)
        r28 = 1 << 4;
    else if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        r28 = 1 << (modeCtrl.unk30 - 1);
    else
        r28 = 1 << 0;

    layer = work->layers;
    for (i = work->layersCount; i > 0; i--, layer++)
        layer->bgObj->flags &= ~0x10000;
    // draw cloud layers
    if (work->layersCount != 0)
    {
        avdisp_enable_custom_tex_mtx(1);
        layer = work->layers;
        for (i = work->layersCount; i > 0; i--, layer++)
        {
            bgObj = layer->bgObj;
            if (bgObj->flags & r28)
            {
                avdisp_set_custom_tex_mtx(0, layer->texMtx);
                mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
                mathutil_mtxA_translate(&bgObj->pos);
                mathutil_mtxA_rotate_z(bgObj->rotZ);
                mathutil_mtxA_rotate_y(bgObj->rotY);
                mathutil_mtxA_rotate_x(bgObj->rotX);
                mathutil_mtxA_scale(&bgObj->scale);
                GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
                GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
                avdisp_draw_model_culled_sort_translucent(bgObj->model);
            }
        }
        avdisp_enable_custom_tex_mtx(0);
    }
    bg_default_draw();
}

void bg_sunset_interact(int a) {}

static int obj_find_proc(int index, struct StageBgObject *bgObj)
{
    struct BGSunsetWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // SUN_GROUND
    case 1:  // SUN_CLOUD_
        if (bgObj->model != NULL && work->layersCount < 8)
        {
            work->layers[work->layersCount].bgObj = bgObj;
            work->layersCount++;
        }
        break;
    }
    return 1;
}
