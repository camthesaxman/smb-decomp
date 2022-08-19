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
#include "effect.h"
#include "gma.h"
#include "gxcache.h"
#include "gxutil.h"
#include "mathutil.h"
#include "stage.h"

static struct BGModelSearch bonusBgModelFind[] =
{
    { BG_MDL_CMP_FULL,   "BNS_SHOTSTAR" },
    { BG_MDL_CMP_PREFIX, "STARLIGHT_" },
    { BG_MDL_CMP_FULL,   "BNS_LIGHTMAP" },
    { BG_MDL_CMP_FULL,   "BNS_LIGHTMAP_A" },
    { BG_MDL_CMP_PREFIX, "STARPOINT" },
    { BG_MDL_CMP_END,    NULL },
};

static struct BGModelSearch bonusBgObjFind[] =
{
    { BG_MDL_CMP_FULL, "BNS_MAIN" },
    { BG_MDL_CMP_END,  NULL },
};

static void lbl_80061B58(void);
static void lbl_80061BC4(struct EnvMapSomething *a);
static int model_find_proc(int, struct GMAModelEntry *);
static int obj_find_proc(int, struct StageBgObject *);

void bg_bonus_init(void)
{
    struct BGBonusWork *work = (void *)backgroundInfo.work;
    int i;
    struct BGBonusStarpoint *starpoint;

    bg_default_init();
    backgroundInfo.ballEnvFunc = lbl_80061BC4;
    backgroundInfo.unk98 = lbl_80061B58;

    // find models
    if (!work->initialized)
    {
        work->starpointCount = 0;
        find_background_gma_models(bonusBgModelFind, model_find_proc);
        work->initialized = TRUE;
    }
    find_background_objects(
        decodedStageLzPtr->bgObjects,
        decodedStageLzPtr->bgObjectCount,
        bonusBgObjFind,
        obj_find_proc);
    find_background_objects(
        decodedStageLzPtr->fgObjects,
        decodedStageLzPtr->fgObjectCount,
        bonusBgObjFind,
        obj_find_proc);

    starpoint = work->starpoints;
    for (i = work->starpointCount; i > 0; i--, starpoint++)
    {
        starpoint->pulse = rand() & 0x7FFF;
        starpoint->pulseSpeed = ((RAND_FLOAT() * 0.5f + 1.0f) * 65536.0f) / 180.0f;
    }
}

void bg_bonus_main(void)
{
    struct BGBonusWork *work = backgroundInfo.work;
    int i;
    struct BGBonusStarpoint *starpoint;
    Vec sp8;

    bg_default_main();
    if (gamePauseStatus & 0xA)
        return;

    starpoint = work->starpoints;
    for (i = work->starpointCount; i > 0; i--, starpoint++)
    {
        float intensity;

        // Pulse the star's glow (a slightly off-white color)
        starpoint->pulse += starpoint->pulseSpeed;
        intensity = (mathutil_sin(starpoint->pulse) + 1.0f) * 0.25f + 0.5f;
        starpoint->red = intensity * 1.1f;
        starpoint->green = intensity * 1.05f;
        starpoint->blue = intensity;
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
    Vec starPos;
    Vec bgScale;  // scale of the entire background
    struct BGBonusStarpoint *starpoint;
    struct GMAModel *starlightModel;
    struct StageBgObject *mainObj;

    bg_default_draw();
    mainObj = work->mainObj;
    bgScale = mainObj->scale;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&mainObj->pos);
    mathutil_mtxA_rotate_z(mainObj->rotZ);
    mathutil_mtxA_rotate_y(mainObj->rotY);
    mathutil_mtxA_rotate_x(mainObj->rotX);
    mathutil_mtxA_scale(&bgScale);

    avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_DISABLE);
    starlightModel = work->starlightModel;
    for (i = work->starpointCount, starpoint = work->starpoints; i > 0; i--, starpoint++)
    {
        float pulse = (starpoint->red + starpoint->green + starpoint->blue) * 0.75f;

        if (lbl_801EEC90.unk0 & (1 << 2))
        {
            starPos.x = starpoint->u_pos.x * bgScale.x;
            starPos.y = starpoint->u_pos.y * bgScale.y;
            starPos.z = starpoint->u_pos.z * bgScale.z;
            if (func_8000E53C(&starPos) < -(starlightModel->boundSphereRadius * pulse))
                continue;
        }

        // Draw star light billboard
        mathutil_mtxA_push();
        mathutil_mtxA_translate(&starpoint->u_pos);
        mathutil_mtxA_sq_from_identity();
        mathutil_mtxA_get_translate_alt(&starPos);
        if (starPos.z < -30.0f)
        {
            float f3 = (26.0f + starPos.z) / starPos.z;

            starPos.x *= f3;
            starPos.y *= f3;
            starPos.z *= f3;
            mathutil_mtxA_set_translate(&starPos);
            pulse *= f3;
            mathutil_mtxA_scale_s(pulse);
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
        star.type = ET_BNS_STG_STAR;
        star.playerId = currentBallStructPtr->playerId;
        mathutil_mtxA_from_mtx(cameraInfo[star.playerId].unk1A4);
        spC.z = -120.0f + RAND_FLOAT() * -225.0f;
        spC.x = spC.z * -(8.0f / 3.0f) * currentCameraStructPtr->sub28.unk38 * (RAND_FLOAT() - 0.5f);
        spC.y = spC.z * -1.1f * currentCameraStructPtr->sub28.unk38;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &star.pos);
        f31 = -spC.z * (1.0f / 300.0f);
        star.vel.x = (1.0f + RAND_FLOAT()) * f31;
        star.vel.y = (-3.0f + RAND_FLOAT() * -1.0f) * f31;
        star.vel.z = (1.0f + RAND_FLOAT()) * f31;
        spC.x = 0.0f;
        spC.y = 0.0f;
        spC.z = 0.0f;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &spC);
        mathutil_ray_to_euler_xy(&spC, &star.pos, &star.rotX, &star.rotY);
        star.rotZ = rand() & 0x7FFF;
        spawn_effect(&star);
        break;
    }
}

static void lbl_80061B58(void)
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

static void lbl_80061BC4(struct EnvMapSomething *a)
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

static int model_find_proc(int index, struct GMAModelEntry *entry)
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
        if (work->starpointCount < 64)
        {
            struct BGBonusStarpoint *starpoint = &work->starpoints[work->starpointCount];

            starpoint->u_pos = entry->model->boundSphereCenter;
            work->starpointCount++;
        }
        break;
    }
    return 1;
}

static int obj_find_proc(int index, struct StageBgObject *bgObj)
{
    struct BGBonusWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // BNS_MAIN
        work->mainObj = bgObj;
        break;
    }
    return 1;
}
