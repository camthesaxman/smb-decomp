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

struct Struct80056684 lbl_801B9BA0[] =
{
    { 0, "JUN_FIG_CLOUD_" },
    { 3, NULL },
};

static int lbl_8005B86C(int a, struct StageBgModel *bgModel);

void bg_jungle_init(void)
{
    struct UnkBackground9C *r28 = backgroundInfo.unk9C;
    int i;
    struct UnkBackground9C_sub *r29;
    Vec sp8;

    bg_e3_init();
    func_800940B8();
    func_800946DC(lbl_801F0614.unk42, 0xC00);
    backgroundInfo.unk8 |= 1;
    r28->unk4 = 0;
    func_800567DC(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        lbl_801B9BA0,
        lbl_8005B86C);
    func_800567DC(
        decodedStageLzPtr->unk74,
        decodedStageLzPtr->unk70,
        lbl_801B9BA0,
        lbl_8005B86C);

    if (r28->unk4 == 0)
        return;
    r28->unk168 = 0;
    for (i = r28->unk4, r29 = r28->unk8; i > 0; i--, r29++)
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
    struct UnkBackground9C *r31 = backgroundInfo.unk9C;
    int i;
    struct UnkBackground9C_sub *r29;
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
    if (r31->unk4 == 0)
        return;
    if (r31->unk168 == 0 && infoWork.timerCurr < (infoWork.timerMax >> 1))
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
    struct UnkBackground9C *r30 = backgroundInfo.unk9C;
    struct StageBgModel *r31;
    u32 r28;
    int i;
    struct UnkBackground9C_sub *r30_;

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
    r30_ = r30->unk8;
    for (i = r30->unk4; i > 0; i--, r30_++)
        r30_->unk0->unk0 &= ~0x10000;
    bg_e3_draw();
    if (r30->unk4 != 0)
    {
        func_8008F6D4(1);
        avdisp_set_z_mode(1, 3, 0);
        r30_ = r30->unk8;
        for (i = r30->unk4; i > 0; i--, r30_++)
        {
            r31 = r30_->unk0;
            if (r31->unk0 & r28)
            {
                g_avdisp_set_some_matrix(0, r30_->unk28);
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

void func_8005B868(int a) {}

static int lbl_8005B86C(int a, struct StageBgModel *bgModel)
{
    struct UnkBackground9C *r5 = backgroundInfo.unk9C;

    switch (a)
    {
    case 0:
        if (bgModel->model != NULL && r5->unk4 < 2)
        {
            r5->unk8[r5->unk4].unk0 = bgModel;
            r5->unk4++;
        }
        break;
    }
    return 1;
}
