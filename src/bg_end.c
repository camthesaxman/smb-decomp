#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "gxcache.h"
#define MATHUTIL_SIN_INT_PARAM
#include "mathutil.h"
#include "stage.h"

struct Struct800654F4_sub
{
    GXTevStageID unk0;
    GXTexCoordID unk4;
    s32 unk8;
    GXTexMapID unkC;
    GXIndTexStageID unk10;
    u8 filler14[0x1C-0x14];
    GXIndTexMtxID unk1C;
    u8 filler20[0xC];
};

struct Struct800654F4
{
    u8 filler0[0xC];
    struct Struct800654F4_sub unkC;
};

static struct BGModelSearch bgEndFind1[] =
{
    { BG_MDL_CMP_PREFIX, "END_STG_CLOUD_" },
    { BG_MDL_CMP_FULL,   "END_YOUSAI_WATER_C" },
    { BG_MDL_CMP_FULL,   "END_YOUSAI_WATER_SPEC" },
    { BG_MDL_CMP_PREFIX, "END_FUNSUI_WATER_" },
    { BG_MDL_CMP_END,    NULL },
};

static struct BGModelSearch bgEndFind2[] =
{
    { BG_MDL_CMP_PREFIX, "END_PARADISE_" },
    { BG_MDL_CMP_END,    NULL },
};

static void lbl_800654F4(struct Struct800654F4 *arg0);
static void lbl_8006582C(struct Struct800654F4 *arg0);
static int lbl_80065B8C(int, struct GMAModelEntry *);
static int lbl_80065BFC(int, struct StageBgModel *);

void bg_end_init(void)
{
    struct BGEndWork *work = backgroundInfo.work;

    bg_e3_init();
    if (work->unk0 == 0)
    {
        g_search_bg_models(bgEndFind1, lbl_80065B8C);
        work->unk0 = 1;
    }
    g_search_bg_models_from_list(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        bgEndFind2,
        lbl_80065BFC);
    g_search_bg_models_from_list(
        decodedStageLzPtr->fgModels,
        decodedStageLzPtr->fgModelCount,
        bgEndFind2,
        lbl_80065BFC);
    work->unk14 = lbl_8006582C;
    work->unk18 = lbl_800654F4;
    work->unk28 = 0.005555555555555556 * (0.8f + 0.4f * (rand() / 32767.0f));
    work->unk2C = 0.005555555555555556 * (0.8f + 0.4f * (rand() / 32767.0f));
    work->unk34 = 5.0f * (1.0f + (rand() / 32767.0f));
    work->unk38 = 5.0f * (1.0f + (rand() / 32767.0f));
    work->unk3C = 1.0f;
    work->unk58 = 0.002777777777777778 * (0.9f + 0.2f * (rand() / 32767.0f));
    work->unk5C = 0.002777777777777778 * (0.9f + 0.2f * (rand() / 32767.0f));
}

void bg_end_main(void)
{
    struct BGEndWork *work = backgroundInfo.work;
    float temp_f1;

    bg_e3_main();
    if (gamePauseStatus & 0xA)
        return;
    work->unk1C.x += work->unk28;
    work->unk1C.y += work->unk2C;
    temp_f1 = 1.0f + 0.005f * mathutil_sin(backgroundInfo.unkA4 << 8);
    work->unk40.x = work->unk34 * temp_f1;
    work->unk40.y = work->unk38 * temp_f1;
    work->unk40.z = 1.0f;
    work->unk4C.x += work->unk58;
    work->unk4C.y += work->unk5C;
}

void bg_end_finish(void) {}

void bg_end_draw(void)
{
    bg_e3_draw();
}

void bg_end_interact(int arg0) {}

static void lbl_800654F4(struct Struct800654F4 *arg0)
{
    struct BGEndWork *work = backgroundInfo.work;
    struct Struct800654F4_sub sp2C = arg0->unkC;
    float sp14[2][3];

    GXLoadTexObj_cached(work->unkC, sp2C.unkC);
    GXLoadTexObj_cached(work->unk10, sp2C.unkC + 1);
    sp14[0][0] = 0.0f;
    sp14[0][1] = 0.5f * mathutil_sin(backgroundInfo.unkA4 << 8);
    sp14[0][2] = 0.0f;
    sp14[1][0] = 0.0f;
    sp14[1][1] = 0.0f;
    sp14[1][2] = 0.5f * mathutil_sin((backgroundInfo.unkA4 << 8) + 0x4000);
    GXSetIndTexMtx(sp2C.unk1C, sp14, 0);
    mathutil_mtxA_push();
    mathutil_mtxA_from_mtx(work->unk64);
    mathutil_mtxA_set_translate(&work->unk4C);
    mathutil_mtxA_scale_s(12.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8, 1);
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&work->unk1C);
    mathutil_mtxA_scale(&work->unk40);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8 + 3, 1);
    mathutil_mtxA_pop();
    GXSetTexCoordGen(sp2C.unk4, 1, 1, sp2C.unk8);
    GXSetTexCoordGen(sp2C.unk4 + 1, 1, 4, sp2C.unk8 + 3);
    GXSetIndTexOrder(sp2C.unk10, sp2C.unk4 + 1, sp2C.unkC + 1);
    GXSetTevIndirect(sp2C.unk0, sp2C.unk10, 0, 7, sp2C.unk1C, 0, 0, 0, 0, 0);
    GXSetTevSwapMode_cached(sp2C.unk0, 0, 0);
    GXSetTevOrder_cached(sp2C.unk0, sp2C.unk4, sp2C.unkC, 0xFF);
    GXSetTevColorIn_cached(sp2C.unk0, 8, 0xF, 0xF, 0);
    GXSetTevColorOp_cached(sp2C.unk0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(sp2C.unk0, 7, 7, 7, 0);
    GXSetTevAlphaOp_cached(sp2C.unk0, 0, 0, 0, 1, 0);
    sp2C.unk0 += 1;
    sp2C.unk10 += 1;
    sp2C.unk4 += 2;
    sp2C.unk8 += 6;
    sp2C.unk1C += 1;
    sp2C.unkC += 2;
    arg0->unkC = sp2C;
}

static void lbl_8006582C(struct Struct800654F4 *arg0)
{
    struct BGEndWork *work = backgroundInfo.work;
    struct Struct800654F4_sub sp2C = arg0->unkC;
    float sp14[2][3];
    float temp_f2;

    GXLoadTexObj_cached(work->unkC, sp2C.unkC);
    GXLoadTexObj_cached(work->unk10, sp2C.unkC + 1);
    sp14[0][0] = 0.0f;
    sp14[0][1] = 0.5f * mathutil_sin(backgroundInfo.unkA4 << 8);
    sp14[0][2] = 0.0f;
    sp14[1][0] = 0.0f;
    sp14[1][1] = 0.0f;
    sp14[1][2] = 0.5f * mathutil_sin((backgroundInfo.unkA4 << 8) + 0x4000);
    GXSetIndTexMtx(sp2C.unk1C, sp14, 0);
    mathutil_mtxA_push();
    mathutil_mtxA_from_mtx(work->unk64);
    mathutil_mtxA_set_translate(&work->unk4C);
    mathutil_mtxA_scale_s(6.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8, 1);
    temp_f2 = 0.041666668f * backgroundInfo.unkA4;
    mathutil_mtxA_from_translate_xyz(0.05f * temp_f2, temp_f2, 0.0f);
    mathutil_mtxA_scale_s(7.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8 + 3, 1);
    mathutil_mtxA_pop();
    GXSetTexCoordGen(sp2C.unk4, 1, 1, sp2C.unk8);
    GXSetTexCoordGen(sp2C.unk4 + 1, 1, 4, sp2C.unk8 + 3);
    GXSetIndTexOrder(sp2C.unk10, sp2C.unk4 + 1, sp2C.unkC + 1);
    GXSetTevIndirect(sp2C.unk0, sp2C.unk10, 0, 7, sp2C.unk1C, 0, 0, 0, 0, 0);
    GXSetTevSwapMode_cached(sp2C.unk0, 0, 0);
    GXSetTevOrder_cached(sp2C.unk0, sp2C.unk4, sp2C.unkC, 0xFF);
    GXSetTevColorIn_cached(sp2C.unk0, 8, 0xF, 0xF, 0);
    GXSetTevColorOp_cached(sp2C.unk0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(sp2C.unk0, 7, 7, 7, 0);
    GXSetTevAlphaOp_cached(sp2C.unk0, 0, 0, 0, 1, 0);
    sp2C.unk0 += 1;
    sp2C.unk10 += 1;
    sp2C.unk4 += 2;
    sp2C.unk8 += 6;
    sp2C.unk1C += 1;
    sp2C.unkC += 2;
    arg0->unkC = sp2C;
}

static int lbl_80065B8C(int arg0, struct GMAModelEntry *arg1)
{
    struct BGEndWork *work = backgroundInfo.work;

    switch (arg0)
    {
    case 0:
        work->unk10 = arg1->modelOffset->texObjs;
        break;
    case 1:
        work->unk8 = arg1->modelOffset;
        break;
    case 2:
        work->unkC = arg1->modelOffset->texObjs;
        break;
    case 3:
        work->unk4 = arg1->modelOffset;
        break;
    }
    return 1;
}

static int lbl_80065BFC(int arg0, struct StageBgModel *arg1)
{
    struct Struct8003C550 sp10;

    switch (arg0)
    {
    case 0:
        memset(&sp10, 0, sizeof(sp10));
        sp10.unk8 = 48;
        sp10.unk30 = (void *)arg1;
        g_spawn_effect_object(&sp10);
        break;
    }
    return 1;
}
