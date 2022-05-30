/**
 * bg_bonus.c - Code for the bonus stage background
 */
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include <dolphin/GXEnum.h>
#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "gma.h"
#include "gxcache.h"
#include "gxutil.h"
#include "mathutil.h"
#include "stage.h"

static struct BGModelSearch bonusMiscFind[] =
{
    { BG_MDL_CMP_FULL,   "BNS_SHOTSTAR" },
    { BG_MDL_CMP_PREFIX, "STARLIGHT_" },
    { BG_MDL_CMP_FULL,   "BNS_LIGHTMAP" },
    { BG_MDL_CMP_FULL,   "BNS_LIGHTMAP_A" },
    { BG_MDL_CMP_PREFIX, "STARPOINT" },
    { BG_MDL_CMP_END,    NULL },
};

static struct BGModelSearch bonusMainFind[] =
{
    { BG_MDL_CMP_FULL, "BNS_MAIN" },
    { BG_MDL_CMP_END,  NULL },
};

void lbl_80061B58(void);
void lbl_80061BC4(struct Struct80061BC4 *a);
static int bonus_misc_find_proc(int, struct GMAModelEntry *);
static int bonus_main_find_proc(int, struct StageBgModel *);

void bg_bonus_init(void)
{
    struct BGBonusWork *work = (void *)backgroundInfo.work;
    int i;
    struct BGBonusStarpoint *starpoint;

    bg_e3_init();
    backgroundInfo.ballEnvFunc = lbl_80061BC4;
    backgroundInfo.unk98 = lbl_80061B58;

    // find models
    if (work->unk0 == 0)
    {
        work->startpointCount = 0;
        u_search_bg_models(bonusMiscFind, bonus_misc_find_proc);
        work->unk0 = 1;
    }
    u_search_bg_models_from_list(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        bonusMainFind,
        bonus_main_find_proc);
    u_search_bg_models_from_list(
        decodedStageLzPtr->fgModels,
        decodedStageLzPtr->fgModelCount,
        bonusMainFind,
        bonus_main_find_proc);

    starpoint = work->starpoints;
    for (i = work->startpointCount; i > 0; i--, starpoint++)
    {
        starpoint->unkC = rand() & 0x7FFF;
        starpoint->unkE = (((rand() / 32767.0f) * 0.5f + 1.0f) * 65536.0f) / 180.0f;
    }
}

void bg_bonus_main(void)
{
    struct BGBonusWork *work = (void *)backgroundInfo.work;
    int i;
    struct BGBonusStarpoint *starpoint;
    Vec sp8;

    bg_e3_main();
    if (gamePauseStatus & 0xA)
        return;

    starpoint = work->starpoints;
    for (i = work->startpointCount; i > 0; i--, starpoint++)
    {
        float f2;
        starpoint->unkC += starpoint->unkE;
        f2 = (mathutil_sin(starpoint->unkC) + 1.0f) * 0.25f + 0.5f;
        starpoint->red = f2 * 1.1f;
        starpoint->green = f2 * 1.05f;
        starpoint->blue = f2;
        if (starpoint->red > 1.0f)
            starpoint->red = 1.0f;
        if (starpoint->green > 1.0f)
            starpoint->green = 1.0f;
    }

    mathutil_mtxA_from_identity();
    sp8.x = (2.0f / 3.0f);
    sp8.y = (2.0f / 3.0f);
    sp8.z = (2.0f / 3.0f);
    mathutil_mtxA_scale(&sp8);
    mathutil_mtxA_rotate_y(0x1000);
    mathutil_mtxA_rotate_x(0x4000);
    mathutil_mtxA_to_mtx(work->unk71C);

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(0x1000);
    mathutil_mtxA_rotate_x(0x4000);
    mathutil_mtxA_to_mtx(work->unk74C);

    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][0] = 0.0f;
    mathutilData->mtxA[1][1] = 0.0f;
    mathutilData->mtxA[1][2] = -0.5f;
    mathutilData->mtxA[1][3] = 0.5f;
    mathutilData->mtxA[2][2] = 0.0f;
    mathutilData->mtxA[2][3] = 1.0f;
    mathutil_mtxA_to_mtx(work->unk77C);
}

void bg_bonus_finish(void) {}

void bg_bonus_draw(void)
{
    struct BGBonusWork *work = (void *)backgroundInfo.work;
    int i;
    Vec sp14;
    Vec mainModelScale;
    struct BGBonusStarpoint *starpoint;
    struct GMAModel *starlightModel;
    struct StageBgModel *mainModel;

    bg_e3_draw();
    mainModel = work->mainModel;
    mainModelScale = mainModel->scale;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&mainModel->pos);
    mathutil_mtxA_rotate_z(mainModel->rotZ);
    mathutil_mtxA_rotate_y(mainModel->rotY);
    mathutil_mtxA_rotate_x(mainModel->rotX);
    mathutil_mtxA_scale(&mainModelScale);

    avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_DISABLE);
    starlightModel = work->starlightModel;
    for (i = work->startpointCount, starpoint = work->starpoints; i > 0; i--, starpoint++)
    {
        float f30 = (starpoint->red + starpoint->green + starpoint->blue) * 0.75f;

        if (lbl_801EEC90.unk0 & (1 << 2))
        {
            sp14.x = starpoint->u_pos.x * mainModelScale.x;
            sp14.y = starpoint->u_pos.y * mainModelScale.y;
            sp14.z = starpoint->u_pos.z * mainModelScale.z;
            if (func_8000E53C(&sp14) < -(starlightModel->boundSphereRadius * f30))
                continue;
        }
        mathutil_mtxA_push();
        mathutil_mtxA_translate(&starpoint->u_pos);
        mathutil_mtxA_sq_from_identity();
        mathutil_mtxA_get_translate_alt(&sp14);
        if (sp14.z < -30.0f)
        {
            float f3 = (26.0f + sp14.z) / sp14.z;

            sp14.x *= f3;
            sp14.y *= f3;
            sp14.z *= f3;
            mathutil_mtxA_set_translate(&sp14);
            f30 *= f3;
            mathutil_mtxA_scale_s(f30);
            avdisp_set_post_mult_color(starpoint->red, starpoint->green, starpoint->blue, 1.0f);
            avdisp_draw_model_culled_sort_translucent(starlightModel);
            u_reset_post_mult_color();
        }
        mathutil_mtxA_pop();
    }
    avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
}

void bg_bonus_interact(int a)
{
    struct Effect star;
    Vec spC;
    float f31;

    switch (a)
    {
    case 0:
    case 1:
        // spawn shooting star
        memset(&star, 0, sizeof(star));
        star.unk8 = 32;
        star.unk14 = currentBallStructPtr->playerId;
        mathutil_mtxA_from_mtx(cameraInfo[star.unk14].unk1A4);
        spC.z = -120.0f + (rand() / 32767.0f) * -225.0f;
        spC.x = spC.z * -(8.0f / 3.0f) * currentCameraStructPtr->sub28.unk38 * ((rand() / 32767.0f) - 0.5f);
        spC.y = spC.z * -1.1f * currentCameraStructPtr->sub28.unk38;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &star.unk34);
        f31 = -spC.z * (1.0f / 300.0f);
        star.unk40.x = (1.0f + (rand() / 32767.0f)) * f31;
        star.unk40.y = (-3.0f + (rand() / 32767.0f) * -1.0f) * f31;
        star.unk40.z = (1.0f + (rand() / 32767.0f)) * f31;
        spC.x = 0.0f;
        spC.y = 0.0f;
        spC.z = 0.0f;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &spC);
        mathutil_ray_to_euler_xy(&spC, &star.unk34, &star.unk4C, &star.unk4E);
        star.unk50 = rand() & 0x7FFF;
        spawn_effect(&star);
        break;
    }
}

void lbl_80061B58(void)
{
    struct BGBonusWork *work = (void *)backgroundInfo.work;
    Mtx sp8;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_invert();
    mathutil_mtxA_to_mtx(sp8);
    mathutil_mtxA_mult_left(work->unk71C);
    mathutil_mtxA_to_mtx(work->unk7AC);
    mathutil_mtxA_from_mtx(sp8);
    mathutil_mtxA_mult_left(work->unk74C);
    mathutil_mtxA_to_mtx(work->unk7DC);
}

void lbl_80061BC4(struct Struct80061BC4 *a)
{
    struct BGBonusWork *work = (void *)backgroundInfo.work;
    struct Struct80061BC4_sub spC = a->unkC;

    GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_ONE, GX_BL_ONE, GX_LO_CLEAR);
    func_8009AC8C();
    GXLoadTexObj_cached(work->lightmapTexObjs, spC.u_texMapId);
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(work->unk7AC);
    GXLoadTexMtxImm(mathutilData->mtxA, spC.unk8, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXSetTexCoordGen(spC.unk4, GX_TG_MTX2x4, GX_TG_POS, spC.unk8);
    GXSetTevDirect(spC.unk0);
    GXSetTevOrder_cached(spC.unk0, spC.unk4, spC.u_texMapId, GX_COLOR_NULL);
    GXSetTevColorIn_cached(spC.unk0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevColorOp_cached(spC.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVREG1);
    GXSetTevAlphaIn_cached(spC.unk0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(spC.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    spC.unk0++;
    spC.unk4++;
    spC.unk8 += 3;
    spC.u_texMapId++;
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(work->unk7DC);
    mathutil_mtxA_set_translate_xyz(0.0f, 0.0f, 0.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, spC.unk8, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXLoadTexMtxImm(work->unk77C, spC.unk14, GX_MTX3x4);
    GXLoadTexObj_cached(work->lightmapATexObjs, spC.u_texMapId);
    GXSetTexCoordGen2(spC.unk4, GX_TG_MTX3x4, GX_TG_NRM, spC.unk8, GX_TRUE, spC.unk14);
    GXSetTevDirect(spC.unk0);
    GXSetTevOrder_cached(spC.unk0, spC.unk4, spC.u_texMapId, GX_COLOR_NULL);
    GXSetTevColorIn_cached(spC.unk0, GX_CC_ZERO, GX_CC_TEXC, GX_CC_C1, GX_CC_ZERO);
    GXSetTevColorOp_cached(spC.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn_cached(spC.unk0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_APREV);
    GXSetTevAlphaOp_cached(spC.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    spC.unk0++;
    spC.unk4++;
    spC.unk8 += 3;
    spC.unk14 += 3;
    spC.u_texMapId++;
    a->unkC = spC;
}

static int bonus_misc_find_proc(int index, struct GMAModelEntry *entry)
{
    struct BGBonusWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // BNS_SHOTSTAR
        work->shotstarModel = entry->model;
        break;
    case 1:  // STARLIGHT_
        work->starlightModel = entry->model;
        break;
    case 2:  // BNS_LIGHTMAP
        work->lightmapTexObjs = entry->model->texObjs;
        break;
    case 3:  // BNS_LIGHTMAP_A
        work->lightmapATexObjs = entry->model->texObjs;
        break;
    case 4:  // STARPOINT
        if (work->startpointCount < 64)
        {
            struct BGBonusStarpoint *starpoint = &work->starpoints[work->startpointCount];

            starpoint->u_pos = entry->model->boundSphereCenter;
            work->startpointCount++;
        }
        break;
    }
    return 1;
}

static int bonus_main_find_proc(int index, struct StageBgModel *b)
{
    struct BGBonusWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // BNS_MAIN
        work->mainModel = b;
        break;
    }
    return 1;
}
