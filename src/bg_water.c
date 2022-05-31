#include <stddef.h>
#include <stdlib.h>

#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "event.h"
#include "gxcache.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

#pragma force_active on
struct BGModelSearch bgWaterModelFind1[] =
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

struct BGModelSearch bgWaterModelFind2[] =
{
    { BG_MDL_CMP_PREFIX, "WAT_SUB_SUKRYU" },
    { BG_MDL_CMP_FULL, "WAT_SUIMEN" },
    { BG_MDL_CMP_PREFIX, "WAT_LIGHTCHAIN" },
    { BG_MDL_CMP_PREFIX, "WAT_LONG_CHAIN" },
    { BG_MDL_CMP_PREFIX, "WAT_PLANT" },
    { BG_MDL_CMP_PREFIX, "WAT_UKIWA" },
    { BG_MDL_CMP_PREFIX, "WAT_SUB" },
    { BG_MDL_CMP_END,    NULL },
};

#pragma force_active reset

void lbl_8005E914(void);
void lbl_8005E998(struct Struct80061BC4 *);
void lbl_8005EB8C();
void func_8005ED80(struct Struct80061BC4 *);
void lbl_8005F124(struct Struct80061BC4 *);
void lbl_8005F520(struct Struct80061BC4 *);
int lbl_8005F88C(int, struct GMAModelEntry *);
int lbl_8005F924(int, struct StageBgModel *);

struct BGWaterWork_child
{
    u32 unk0;
    u8 filler4[0xC-0x4];
    Vec unkC;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    Vec unk20;
};

struct BGWaterWork
{
    s32 unk0;
    u8 filler4[0x10-0x4];
    s16 unk10;
    s16 unk12;
    s16 unk14;
    s16 unk16;
    s16 unk18;
    s16 unk1A;
    u16 unk1C;
    u16 unk1E;
    float unk20;
    struct GMAModel *unk24;
    u8 filler28[0x30-0x28];
    GXTexObj *unk30;
    GXTexObj *unk34;
    GXTexObj *unk38;
    Mtx unk3C;
    Mtx unk6C;
    Mtx unk9C;
    Mtx unkCC;
    Mtx unkFC;
    Mtx unk12C;
    Mtx unk15C;
    u8 filler18C[4];
    struct BGWaterWork_child *unk190;
};

void bg_water_init(void)
{
    struct BGWaterWork *work = backgroundInfo.work;

    bg_e3_init();
    if (modeCtrl.unk30 < 2)
    {
        backgroundInfo.unk8C = lbl_8005E998;
        backgroundInfo.unk90 = lbl_8005EB8C;
    }
    backgroundInfo.ballEnvFunc = lbl_8005F124;
    if (work->unk0 == 0)
    {
        u_debug_set_cursor_pos(4, 4);
        u_search_bg_models(bgWaterModelFind1, lbl_8005F88C);
        work->unk0 = 1;
    }
    func_80056934();
    work->unk190 = NULL;
    u_search_bg_models_from_list(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        bgWaterModelFind2,
        lbl_8005F924);
    u_search_bg_models_from_list(
        decodedStageLzPtr->fgModels,
        decodedStageLzPtr->fgModelCount,
        bgWaterModelFind2,
        lbl_8005F924);
    backgroundInfo.unk14.x = (rand() / 32767.0f) - 0.5f;
    backgroundInfo.unk14.y = (rand() / 32767.0f) - 0.5f;
    backgroundInfo.unk14.z = (rand() / 32767.0f) - 0.5f;
    backgroundInfo.unk20.x = (rand() / 32767.0f) - 0.5f;
    backgroundInfo.unk20.y = 0.0f;
    backgroundInfo.unk20.z = (rand() / 32767.0f) - 0.5f;
    mathutil_vec_set_len(&backgroundInfo.unk20, &backgroundInfo.unk20, (0.9f + (0.2f * (rand() / 32767.0f))) / 30.0f);
    backgroundInfo.unk2C.x = (rand() / 32767.0f) - 0.5f;
    backgroundInfo.unk2C.y = (rand() / 32767.0f) - 0.5f;
    backgroundInfo.unk2C.z = (rand() / 32767.0f) - 0.5f;
    backgroundInfo.unk38.x = (rand() / 32767.0f) - 0.5f;
    backgroundInfo.unk38.y = 0.0f;
    backgroundInfo.unk38.z = (rand() / 32767.0f) - 0.5f;
    mathutil_vec_set_len(&backgroundInfo.unk38, &backgroundInfo.unk38, (0.9f + (0.2f * (rand() / 32767.0f))) / 30.0f);
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
    bg_e3_main();
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
    struct BGWaterWork *temp_r30;
    struct BGWaterWork_child *temp_r31;

    temp_r30 = backgroundInfo.work;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    temp_r31 = temp_r30->unk190;
    if (temp_r31 != NULL)
    {
        temp_r31->unk0 &= 0xFFFEFFFF;
        mathutil_mtxA_translate(&temp_r31->unkC);
        mathutil_mtxA_rotate_z(temp_r31->unk1C);
        mathutil_mtxA_rotate_y(temp_r31->unk1A);
        mathutil_mtxA_rotate_x(temp_r31->unk18);
        mathutil_mtxA_scale(&temp_r31->unk20);
    }
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    u_avdisp_set_some_func_1(lbl_8005F520);
    avdisp_draw_model_culled_sort_none(temp_r30->unk24);
    u_avdisp_set_some_func_1(NULL);
    bg_e3_draw();
}

void bg_water_interact(int a) {}

void lbl_8005E914(void)
{
    struct BGWaterWork *temp_r31 = backgroundInfo.work;
    Mtx sp8;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_invert();
    mathutil_mtxA_to_mtx(sp8);
    mathutil_mtxA_mult_left(temp_r31->unk3C);
    mathutil_mtxA_to_mtx(temp_r31->unkFC);
    mathutil_mtxA_from_mtx(sp8);
    mathutil_mtxA_mult_left(temp_r31->unk6C);
    mathutil_mtxA_to_mtx(temp_r31->unk12C);
    mathutil_mtxA_from_mtx(sp8);
    mathutil_mtxA_mult_left(temp_r31->unk9C);
    mathutil_mtxA_to_mtx(temp_r31->unk15C);
}

struct Struct80061BC4_sub lbl_8027CBF8;

void lbl_8005E998(struct Struct80061BC4 *arg0)
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
    GXLoadTexObj_cached(((struct BGWaterWork *)backgroundInfo.work)->unk34, arg0->unkC.u_texMapId);
    spC[0][0] = 0.8f;
    spC[0][1] = 0.0f;
    spC[0][2] = 0.0f;
    spC[1][0] = 0.0f;
    spC[1][1] = 0.8f;
    spC[1][2] = 0.0f;
    GXSetIndTexMtx(arg0->unkC.unk1C, spC, 0);
    func_8005ED80(arg0);
}

void lbl_8005EB8C(struct Struct80061BC4 *arg0)
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
    GXLoadTexObj_cached(((struct BGWaterWork *)backgroundInfo.work)->unk30, arg0->unkC.u_texMapId);
    spC[0][0] = 0.6f;
    spC[0][1] = 0.0f;
    spC[0][2] = 0.0f;
    spC[1][0] = 0.0f;
    spC[1][1] = 0.6f;
    spC[1][2] = 0.0f;
    GXSetIndTexMtx(arg0->unkC.unk1C, spC, 0);
    func_8005ED80(arg0);
}

void func_8005ED80(struct Struct80061BC4 *arg0)
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
    GXLoadTexObj_cached(work->unk38, sp2C.u_texMapId + 2);
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
