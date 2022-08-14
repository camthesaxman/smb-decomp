/**
 * bg_water.c - Code for the underwater background
 */
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "effect.h"
#include "event.h"
#include "gxcache.h"
#include "gxutil.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

static struct BGModelSearch waterBgModelFind[] =
{
    { BG_MDL_CMP_FULL,   "WAT_SUIMEN_MAT_ONLY" },
    { BG_MDL_CMP_FULL,   "WAT_SANSYO_TEX_WATER" },
    { BG_MDL_CMP_FULL,   "WAT_SUIMEN_TEST_LOW_CONT" },
    { BG_MDL_CMP_PREFIX, "WAT_BUBBLE_" },
    { BG_MDL_CMP_FULL,   "WAT_LIGHTMAP" },
    { BG_MDL_CMP_FULL,   "WAT_LIGHTMAP_STAGE" },
    { BG_MDL_CMP_FULL,   "WAT_LIGHTMAP_GRAD" },
    { BG_MDL_CMP_END,    NULL },
};

static struct BGModelSearch waterBgObjFind[] =
{
    { BG_MDL_CMP_PREFIX, "WAT_SUB_SUKRYU" },
    { BG_MDL_CMP_FULL,   "WAT_SUIMEN" },
    { BG_MDL_CMP_PREFIX, "WAT_LIGHTCHAIN" },
    { BG_MDL_CMP_PREFIX, "WAT_LONG_CHAIN" },
    { BG_MDL_CMP_PREFIX, "WAT_PLANT" },
    { BG_MDL_CMP_PREFIX, "WAT_UKIWA" },
    { BG_MDL_CMP_PREFIX, "WAT_SUB" },
    { BG_MDL_CMP_END,    NULL },
};

static void lbl_8005E914(void);
static void lbl_8005E998(struct EnvMapSomething *);
static void lbl_8005EB8C();
static void func_8005ED80(struct EnvMapSomething *);
static void lbl_8005F124(struct EnvMapSomething *);
static void lbl_8005F520(struct EnvMapSomething *);
static int model_find_proc(int, struct GMAModelEntry *);
static int obj_find_proc(int, struct StageBgObject *);

void bg_water_init(void)
{
    struct BGWaterWork *work = backgroundInfo.work;

    bg_default_init();
    if (modeCtrl.unk30 < 2)
    {
        backgroundInfo.unk8C = lbl_8005E998;
        backgroundInfo.unk90 = lbl_8005EB8C;
    }
    backgroundInfo.ballEnvFunc = lbl_8005F124;
    if (work->unk0 == 0)
    {
        u_debug_set_cursor_pos(4, 4);
        find_background_gma_models(waterBgModelFind, model_find_proc);
        work->unk0 = 1;
    }
    func_80056934();
    work->waterSurface = NULL;
    find_background_objects(
        decodedStageLzPtr->bgObjects,
        decodedStageLzPtr->bgObjectCount,
        waterBgObjFind,
        obj_find_proc);
    find_background_objects(
        decodedStageLzPtr->fgObjects,
        decodedStageLzPtr->fgObjectCount,
        waterBgObjFind,
        obj_find_proc);
    backgroundInfo.unk14.x = RAND_FLOAT() - 0.5f;
    backgroundInfo.unk14.y = RAND_FLOAT() - 0.5f;
    backgroundInfo.unk14.z = RAND_FLOAT() - 0.5f;
    backgroundInfo.unk20.x = RAND_FLOAT() - 0.5f;
    backgroundInfo.unk20.y = 0.0f;
    backgroundInfo.unk20.z = RAND_FLOAT() - 0.5f;
    mathutil_vec_set_len(&backgroundInfo.unk20, &backgroundInfo.unk20, (0.9f + (0.2f * RAND_FLOAT())) / 30.0f);
    backgroundInfo.unk2C.x = RAND_FLOAT() - 0.5f;
    backgroundInfo.unk2C.y = RAND_FLOAT() - 0.5f;
    backgroundInfo.unk2C.z = RAND_FLOAT() - 0.5f;
    backgroundInfo.unk38.x = RAND_FLOAT() - 0.5f;
    backgroundInfo.unk38.y = 0.0f;
    backgroundInfo.unk38.z = RAND_FLOAT() - 0.5f;
    mathutil_vec_set_len(&backgroundInfo.unk38, &backgroundInfo.unk38, (0.9f + (0.2f * RAND_FLOAT())) / 30.0f);
    work->unk10 = rand() & 0x7FFF;
    work->unk12 = rand() & 0x7FFF;
    work->unk14 = rand() & 0x7FFF;
    work->unk16 = rand() & 0x7FFF;
    work->unk18 = rand() & 0x7FFF;
    work->unk1A = rand() & 0x7FFF;
    work->unk1E = 1;
    work->unk1C = 60;
    work->unk20 = 0.5f;
    backgroundInfo.unk98 = lbl_8005E914;
}

void bg_water_main(void)
{
    Vec scale;
    struct BGWaterWork *work;

    if ((gamePauseStatus & 0xA) && eventInfo[12].state != 2)
        return;
    bg_default_main();
    work = backgroundInfo.work;
    backgroundInfo.unk14.x = backgroundInfo.unk14.x + backgroundInfo.unk20.x;
    backgroundInfo.unk14.y = backgroundInfo.unk14.y + backgroundInfo.unk20.y;
    backgroundInfo.unk14.z = backgroundInfo.unk14.z + backgroundInfo.unk20.z;
    backgroundInfo.unk2C.x += backgroundInfo.unk38.x;
    backgroundInfo.unk2C.y += backgroundInfo.unk38.y;
    backgroundInfo.unk2C.z += backgroundInfo.unk38.z;
    work->unk10 += 0x20;
    work->unk12 += 0x3F;
    work->unk14 += 0x5F;
    work->unk16 += 0x17;
    work->unk18 += 0x20;
    work->unk1A += 0x61;
    work->unk1C--;
    if (work->unk1E != 0)
        work->unk20 += 0.3f * (0.5f - work->unk20);
    else
        work->unk20 += 0.1f * (1.0f - work->unk20);
    mathutil_mtxA_from_identity();
    scale.x = 0.125 * (0.9f + 0.2f * mathutil_sin(work->unk10));
    scale.y = 0.125 * (0.9f + 0.2f * mathutil_sin(work->unk12));
    scale.z = 0.125 * (0.9f + 0.2f * mathutil_sin(work->unk14));
    mathutil_mtxA_scale(&scale);
    mathutil_mtxA_rotate_y(0x1000);
    mathutil_mtxA_rotate_x(0x3800);
    mathutil_mtxA_translate(&backgroundInfo.unk14);
    mathutil_mtxA_to_mtx(work->unk3C);
    mathutil_mtxA_from_identity();
    scale.x = 0.078125f * (0.9f + 0.2f * mathutil_sin(work->unk16));
    scale.y = 0.078125f * (0.9f + 0.2f * mathutil_sin(work->unk18));
    scale.z = 0.078125f * (0.9f + 0.2f * mathutil_sin(work->unk1A));
    mathutil_mtxA_scale(&scale);
    mathutil_mtxA_rotate_y(0x1000);
    mathutil_mtxA_rotate_x(0x3800);
    mathutil_mtxA_rotate_z(0x1000);
    mathutil_mtxA_translate(&backgroundInfo.unk2C);
    mathutil_mtxA_to_mtx(work->unk6C);
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(0x1000);
    mathutil_mtxA_rotate_x(0x3800);
    mathutil_mtxA_to_mtx(work->unk9C);
    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][0] = 0.0f;
    mathutilData->mtxA[0][2] = -0.5f;
    mathutilData->mtxA[0][3] = work->unk20;
    mathutilData->mtxA[1][1] = 0.0f;
    mathutilData->mtxA[2][2] = 0.0f;
    mathutilData->mtxA[2][3] = 1.0f;
    mathutil_mtxA_to_mtx(work->unkCC);
}

void bg_water_finish(void) {}

void bg_water_draw(void)
{
    struct BGWaterWork *work = backgroundInfo.work;
    struct StageBgObject *temp_r31;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    temp_r31 = work->waterSurface;
    if (temp_r31 != NULL)
    {
        temp_r31->flags &= 0xFFFEFFFF;
        mathutil_mtxA_translate(&temp_r31->pos);
        mathutil_mtxA_rotate_z(temp_r31->rotZ);
        mathutil_mtxA_rotate_y(temp_r31->rotY);
        mathutil_mtxA_rotate_x(temp_r31->rotX);
        mathutil_mtxA_scale(&temp_r31->scale);
    }
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    u_avdisp_set_some_func_1(lbl_8005F520);
    avdisp_draw_model_culled_sort_none(work->waterSurfaceMat);
    u_avdisp_set_some_func_1(NULL);
    bg_default_draw();
}

void bg_water_interact(int a) {}

static void lbl_8005E914(void)
{
    struct BGWaterWork *work = backgroundInfo.work;
    Mtx sp8;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_invert();
    mathutil_mtxA_to_mtx(sp8);
    mathutil_mtxA_mult_left(work->unk3C);
    mathutil_mtxA_to_mtx(work->unkFC);
    mathutil_mtxA_from_mtx(sp8);
    mathutil_mtxA_mult_left(work->unk6C);
    mathutil_mtxA_to_mtx(work->unk12C);
    mathutil_mtxA_from_mtx(sp8);
    mathutil_mtxA_mult_left(work->unk9C);
    mathutil_mtxA_to_mtx(work->unk15C);
}

struct Struct80061BC4_sub lbl_8027CBF8;

static void lbl_8005E998(struct EnvMapSomething *arg0)
{
    struct Struct80061BC4_sub sp24 = arg0->unkC;
    float spC[2][3];

    if (arg0->unk0 == 0
     && sp24.unk0 == lbl_8027CBF8.unk0
     && sp24.unk10 == lbl_8027CBF8.unk10
     && sp24.unk8 == lbl_8027CBF8.unk8
     && sp24.unk14 == lbl_8027CBF8.unk14
     && sp24.unk1C == lbl_8027CBF8.unk1C
     && sp24.u_texMapId == lbl_8027CBF8.u_texMapId)
    {
        arg0->unkC.unk0 += 2;
        arg0->unkC.unk10 += 1;
        arg0->unkC.unk4 += 3;
        arg0->unkC.unk8 += 9;
        arg0->unkC.unk14 += 3;
        arg0->unkC.unk1C += 1;
        arg0->unkC.u_texMapId += 2;
        return;
    }
    lbl_8027CBF8 = sp24;
    GXLoadTexObj_cached(((struct BGWaterWork *)backgroundInfo.work)->lightmapStageTex, arg0->unkC.u_texMapId);
    spC[0][0] = 0.8f;
    spC[0][1] = 0.0f;
    spC[0][2] = 0.0f;
    spC[1][0] = 0.0f;
    spC[1][1] = 0.8f;
    spC[1][2] = 0.0f;
    GXSetIndTexMtx(arg0->unkC.unk1C, spC, 0);
    func_8005ED80(arg0);
}

static void lbl_8005EB8C(struct EnvMapSomething *arg0)
{
    struct Struct80061BC4_sub sp24 = arg0->unkC;
    float spC[2][3];

    if (arg0->unk0 == 0
     && sp24.unk0 == lbl_8027CBF8.unk0
     && sp24.unk10 == lbl_8027CBF8.unk10
     && sp24.unk8 == lbl_8027CBF8.unk8
     && sp24.unk14 == lbl_8027CBF8.unk14
     && sp24.unk1C == lbl_8027CBF8.unk1C
     && sp24.u_texMapId == lbl_8027CBF8.u_texMapId)
    {
        arg0->unkC.unk0 += 2;
        arg0->unkC.unk10 += 1;
        arg0->unkC.unk4 += 3;
        arg0->unkC.unk8 += 9;
        arg0->unkC.unk14 += 3;
        arg0->unkC.unk1C += 1;
        arg0->unkC.u_texMapId += 2;
        return;
    }
    lbl_8027CBF8 = sp24;
    GXLoadTexObj_cached(((struct BGWaterWork *)backgroundInfo.work)->lightmapTex, arg0->unkC.u_texMapId);
    spC[0][0] = 0.6f;
    spC[0][1] = 0.0f;
    spC[0][2] = 0.0f;
    spC[1][0] = 0.0f;
    spC[1][1] = 0.6f;
    spC[1][2] = 0.0f;
    GXSetIndTexMtx(arg0->unkC.unk1C, spC, 0);
    func_8005ED80(arg0);
}

static void func_8005ED80(struct EnvMapSomething *arg0)
{
    struct BGWaterWork *work = backgroundInfo.work;
    struct Struct80061BC4_sub sp2C = arg0->unkC;

    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(work->unkFC);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8, GX_MTX3x4);
    mathutil_mtxA_pop();
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(work->unk12C);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8 + 3, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXSetTexCoordGen(sp2C.unk4, GX_TG_MTX2x4, GX_TG_POS, sp2C.unk8);
    GXSetTexCoordGen(sp2C.unk4 + 1, GX_TG_MTX2x4, GX_TG_POS, sp2C.unk8 + 3);
    GXSetIndTexOrder(sp2C.unk10, sp2C.unk4 + 1, sp2C.u_texMapId);
    GXSetTevIndirect(sp2C.unk0, sp2C.unk10, 0, 0, sp2C.unk1C, 0, 0, 0, 0, 0);
    GXSetTevOrder_cached(sp2C.unk0, sp2C.unk4, sp2C.u_texMapId, 0xFF);
    GXSetTevColorIn_cached(sp2C.unk0, 0xF, 0xF, 0xF, 8);
    GXSetTevColorOp_cached(sp2C.unk0, 0, 0, 0, 1, 2);
    GXSetTevAlphaIn_cached(sp2C.unk0, 7, 7, 7, 0);
    GXSetTevAlphaOp_cached(sp2C.unk0, 0, 0, 0, 1, 0);
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(work->unk15C);
    mathutil_mtxA_set_translate_xyz(0.0f, 0.0f, 0.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8 + 6, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXLoadTexMtxImm(work->unkCC, sp2C.unk14, GX_MTX3x4);
    GXLoadTexObj_cached(work->lightmapGradTex, sp2C.u_texMapId + 2);
    GXSetTexCoordGen2(sp2C.unk4 + 2, GX_TG_MTX3x4, GX_TG_NRM, sp2C.unk8 + 6, 1, sp2C.unk14);
    GXSetTevDirect(sp2C.unk0 + 1);
    GXSetTevOrder_cached(sp2C.unk0 + 1, sp2C.unk4 + 2, sp2C.u_texMapId + 2, 0xFF);
    GXSetTevColorIn_cached(sp2C.unk0 + 1, 0xF, 8, 4, 0);
    GXSetTevColorOp_cached(sp2C.unk0 + 1, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(sp2C.unk0 + 1, 7, 7, 7, 0);
    GXSetTevAlphaOp_cached(sp2C.unk0 + 1, 0, 0, 0, 1, 0);
    sp2C.unk0 += 2;
    sp2C.unk10 += 1;
    sp2C.unk4 += 3;
    sp2C.unk8 += 9;
    sp2C.unk14 += 3;
    sp2C.unk1C += 1;
    sp2C.u_texMapId += 2;
    arg0->unkC = sp2C;
}

static void lbl_8005F124(struct EnvMapSomething *arg0)
{
    struct BGWaterWork *work = backgroundInfo.work;
    struct Struct80061BC4_sub sp2C = arg0->unkC;
    float sp14[2][3];

    GXSetBlendMode_cached(1, 1, 1, 0);
    func_8009AC8C();
    GXLoadTexObj_cached(work->lightmapStageTex, sp2C.u_texMapId);
    sp14[0][0] = 0.6f;
    sp14[0][1] = 0.0f;
    sp14[0][2] = 0.0f;
    sp14[1][0] = 0.0f;
    sp14[1][1] = 0.6f;
    sp14[1][2] = 0.0f;
    GXSetIndTexMtx(sp2C.unk1C, sp14, 0);
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(work->unkFC);
    mathutil_mtxA_scale_s(3.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8, GX_MTX3x4);
    mathutil_mtxA_pop();
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(work->unk12C);
    mathutil_mtxA_scale_s(3.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8 + 3, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXSetTexCoordGen(sp2C.unk4, GX_TG_MTX2x4, GX_TG_POS, sp2C.unk8);
    GXSetTexCoordGen(sp2C.unk4 + 1, GX_TG_MTX2x4, GX_TG_POS, sp2C.unk8 + 3);
    GXSetIndTexOrder(sp2C.unk10, sp2C.unk4 + 1, sp2C.u_texMapId);
    GXSetTevIndirect(sp2C.unk0, sp2C.unk10, 0, 0, sp2C.unk1C, 0, 0, 0, 0, 0);
    GXSetTevOrder_cached(sp2C.unk0, sp2C.unk4, sp2C.u_texMapId, 0xFF);
    GXSetTevColorIn_cached(sp2C.unk0, 0xF, 0xF, 0xF, 8);
    GXSetTevColorOp_cached(sp2C.unk0, 0, 0, 0, 1, 2);
    GXSetTevAlphaIn_cached(sp2C.unk0, 7, 7, 7, 6);
    GXSetTevAlphaOp_cached(sp2C.unk0, 0, 0, 0, 1, 0);
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(work->unk15C);
    mathutil_mtxA_set_translate_xyz(0.0f, 0.0f, 0.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8 + 6, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXLoadTexMtxImm(work->unkCC, sp2C.unk14, GX_MTX3x4);
    GXLoadTexObj_cached(work->lightmapGradTex, sp2C.u_texMapId + 2);
    GXSetTexCoordGen2(sp2C.unk4 + 2, GX_TG_MTX3x4, GX_TG_NRM, sp2C.unk8 + 6, 1, sp2C.unk14);
    GXSetTevDirect(sp2C.unk0 + 1);
    GXSetTevOrder_cached(sp2C.unk0 + 1, sp2C.unk4 + 2, sp2C.u_texMapId + 2, 0xFF);
    GXSetTevColorIn_cached(sp2C.unk0 + 1, 0xF, 8, 4, 0xF);
    GXSetTevColorOp_cached(sp2C.unk0 + 1, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(sp2C.unk0 + 1, 7, 7, 7, 0);
    GXSetTevAlphaOp_cached(sp2C.unk0 + 1, 0, 0, 0, 1, 0);
    sp2C.unk0 += 2;
    sp2C.unk10 += 1;
    sp2C.unk4 += 3;
    sp2C.unk8 += 9;
    sp2C.unk14 += 3;
    sp2C.unk1C += 1;
    arg0->unkC = sp2C;
}

#ifdef NONMATCHING
static void lbl_8005F520(struct EnvMapSomething *arg0)
{
    struct BGWaterWork *work = backgroundInfo.work;
    struct Struct80061BC4_sub sp2C = arg0->unkC;
    float sp14[2][3];

    GXLoadTexObj_cached(work->causticTex, sp2C.u_texMapId);
    GXLoadTexObj_cached(work->waterSurfaceTestTex, sp2C.u_texMapId + 1);
    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_x(0x4000);
    mathutil_mtxA_rotate_y(backgroundInfo.unkA4);
    mathutil_mtxA_translate_xyz(
        backgroundInfo.animTimer / 2160.0f,
        backgroundInfo.animTimer / 2160.0f,
        backgroundInfo.animTimer / -5280.0f);
    mathutil_mtxA_scale_s(1.0f / (214.0f + (20.0f * mathutil_sin(backgroundInfo.unkA4 << 6))));
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8, GX_MTX3x4);
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_x(0x4000);
    mathutil_mtxA_rotate_y(0x400);
    mathutil_mtxA_translate_xyz(
        backgroundInfo.animTimer / 360.0f,
        backgroundInfo.animTimer / 360.0f,
        backgroundInfo.animTimer / 360.0f);
    mathutil_mtxA_scale_s(0.005f * (1.0f + (0.25f * mathutil_sin(backgroundInfo.unkA4 << 5))));
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8 + 3, GX_MTX3x4);
    mathutil_mtxA_pop();
    sp14[0][0] = 0.6f;
    sp14[0][1] = -0.01f;
    sp14[0][2] = 0.0f;
    sp14[1][0] = 0.0f;
    sp14[1][1] = 0.6f;
    sp14[1][2] = 0.2f;
    GXSetIndTexMtx(arg0->unkC.unk1C, sp14, 1);
    GXSetTexCoordGen(sp2C.unk4, GX_TG_MTX2x4, GX_TG_POS, sp2C.unk8);
    // NONMATCHING: need it to reload sp2C.unk4 here instead of using r29
    GXSetTexCoordGen(sp2C.unk4 + 1, GX_TG_MTX2x4, GX_TG_POS, sp2C.unk8 + 3);
    GXSetIndTexOrder(sp2C.unk10, sp2C.unk4 + 1, sp2C.u_texMapId + 1);
    GXSetTevIndirect(sp2C.unk0, sp2C.unk10, 0, 0, sp2C.unk1C, 0, 0, 0, 0, 0);
    GXSetTevOrder_cached(sp2C.unk0, sp2C.unk4, sp2C.u_texMapId, 0xFF);
    GXSetTevColorIn_cached(sp2C.unk0, 0xF, 8, 0, 0xF);
    GXSetTevColorOp_cached(sp2C.unk0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(sp2C.unk0, 7, 7, 7, 0);
    GXSetTevAlphaOp_cached(sp2C.unk0, 0, 0, 0, 1, 0);
    sp2C.unk0 += 1;
    sp2C.unk10 += 1;
    sp2C.unk4 += 2;
    sp2C.unk8 += 6;
    sp2C.u_texMapId += 2;
    sp2C.unk1C += 1;
    arg0->unkC = sp2C;
}
#else
const float lbl_802F4314 = 2160.0f;
const float lbl_802F4318 = -5280.0f;
const float lbl_802F431C = 214.0f;
const float lbl_802F4320 = 20.0f;
const float lbl_802F4324 = 360.0f;
const float lbl_802F4328 = 0.004999999888241291f;
const float lbl_802F432C = 0.25f;
const float lbl_802F4330 = -0.0099999997764825821f;
static asm void lbl_8005F520(struct EnvMapSomething *arg0)
{
    nofralloc
#include "../asm/nonmatchings/lbl_8005F520.s"
}
#pragma peephole on
#endif

static int model_find_proc(int index, struct GMAModelEntry *entry)
{
    struct BGWaterWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // WAT_SUIMEN_MAT_ONLY
        work->waterSurfaceMat = entry->model;
        break;
    case 1:  // WAT_SANSYO_TEX_WATER
        work->causticTex = &entry->model->texObjs[0];
        break;
    case 2:  // WAT_SUIMEN_TEST_LOW_CONT
        work->waterSurfaceTestTex = &entry->model->texObjs[0];
        break;
    case 3:  // WAT_BUBBLE_
        work->bubbleModel = entry->model;
        break;
    case 4:  // WAT_LIGHTMAP
        work->lightmapTex = &entry->model->texObjs[0];
        break;
    case 5:  // WAT_LIGHTMAP_STAGE
        work->lightmapStageTex = &entry->model->texObjs[0];
        break;
    case 6:  // WAT_LIGHTMAP_GRAD
        work->lightmapGradTex = &entry->model->texObjs[0];
        break;
    }
    return 1;
}

static int obj_find_proc(int index, struct StageBgObject *bgObj)
{
    struct BGWaterWork *work = backgroundInfo.work;
    struct Effect effect;

    switch (index)
    {
    case 0:  // WAT_SUB_SUKRYU
        // submarine propeller
        memset(&effect, 0, sizeof(effect));
        effect.type = ET_BGWAT_BUBBLE_BASE;
        effect.model = (void *)bgObj;
        spawn_effect(&effect);
        break;
    case 1:  // WAT_SUIMEN
        work->waterSurface = bgObj;
        break;
    default:
        bgObj->flags |= 0x1000000;
        break;
    }
    return 1;
}
