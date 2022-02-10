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

struct BGModelEntry lbl_801B9FB0[] =
{
    { 1, "SUN_GROUND" },
    { 0, "SUN_CLOUD_" },
    { 3, NULL },
};

static int lbl_80061394(int a, struct StageBgModel *bgModel);

void bg_sunset_init(void)
{
    struct UnkBackground9C_sub *r29;
    struct UnkBackground9C *r28 = backgroundInfo.unk9C;
    int i;
    Vec sp8;

    bg_e3_init();
    r28->unk4 = 0;
    g_process_stage_bg_models(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        lbl_801B9FB0,
        lbl_80061394);
    g_process_stage_bg_models(
        decodedStageLzPtr->unk74,
        decodedStageLzPtr->unk70,
        lbl_801B9FB0,
        lbl_80061394);
    if (r28->unk4 == 0)
        return;
    r28->unk168 = 0;
    r29 = r28->unk8;
    for (i = r28->unk4; i > 0; i--, r29++)
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
    struct UnkBackground9C *r31 = backgroundInfo.unk9C;
    int i;
    struct UnkBackground9C_sub *r29;
    int r28;
    Vec sp8;

    bg_e3_main();
    if (gamePauseStatus & 0xA)
        return;
    if (r31->unk4 == 0)
        return;
    if (r31->unk168 == 0 && infoWork.timerCurr < 660.0f)
    {
        r31->unk168 = 1;
        r28 = 1;
    }
    else
        r28 = 0;
    r29 = r31->unk8;
    for (i = r31->unk4; i > 0; i--, r29++)
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
    struct UnkBackground9C *r30 = backgroundInfo.unk9C;
    struct StageBgModel *r31;
    u32 r28;
    int i;
    struct UnkBackground9C_sub *r30_;

    if (lbl_801EEC90.unk0 & 1)
        r28 = 1 << 4;
    else
    {
        if (modeCtrl.gameType == 1)
            r28 = 1 << (modeCtrl.unk30 - 1);
        else
            r28 = 1 << 0;
    }
    r30_ = r30->unk8;
    for (i = r30->unk4; i > 0; i--, r30_++)
        r30_->unk0->unk0 &= ~0x10000;
    // draw cloud layers
    if (r30->unk4 != 0)
    {
        func_8008F6D4(1);
        r30_ = r30->unk8;
        for (i = r30->unk4; i > 0; i--, r30_++)
        {
            r31 = r30_->unk0;
            if (r31->unk0 & r28)
            {
                g_avdisp_set_some_matrix(0, r30_->unk28);
                mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
                mathutil_mtxA_translate(&r31->pos);
                mathutil_mtxA_rotate_z(r31->zrot);
                mathutil_mtxA_rotate_y(r31->yrot);
                mathutil_mtxA_rotate_x(r31->xrot);
                mathutil_mtxA_scale(&r31->scale);
                GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
                GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
                g_avdisp_maybe_draw_model_1(r31->model);
            }
        }
        func_8008F6D4(0);
    }
    bg_e3_draw();
}

void bg_sunset_interact(int a) {}

static int lbl_80061394(int a, struct StageBgModel *bgModel)
{
    struct UnkBackground9C *r5 = backgroundInfo.unk9C;

    switch (a)
    {
    case 0:
    case 1:
        if (bgModel->model != NULL && r5->unk4 < 8)
        {
            r5->unk8[r5->unk4].unk0 = bgModel;
            r5->unk4++;
        }
        break;
    }
    return 1;
}
