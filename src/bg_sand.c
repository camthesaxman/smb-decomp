#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "camera.h"
#include "event.h"
#include "gxcache.h"
#include "gxutil.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "ord_tbl.h"
#include "rend_efc.h"
#include "stage.h"

static struct BGModelSearch sandBgModelFind[] =
{
    { BG_MDL_CMP_FULL, "SND_KAGE_LOW_MAP_A" },
    { BG_MDL_CMP_FULL, "SND_STAGE_SAND_A" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_WATER_A_URA" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_WATER_B" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_WATER_B_URA" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_IND_A" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_GRAD_A" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_UP_TATE" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_UP_YOKO" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_DOWN_TATE" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_DOWN_YOKO" },
    { BG_MDL_CMP_END,  NULL },
};

static struct BGModelSearch bonusBgObjFind[] =
{
    { BG_MDL_CMP_PREFIX, "SND_PIRAM_CLOUD" },
    { BG_MDL_CMP_PREFIX, "SND_FUNSUI_WATER" },
    { BG_MDL_CMP_END,    NULL },
};

struct MyDrawNode
{
    struct OrdTblNode node;
    s32 unk8;
    struct StageBgObject *unkC;
    Mtx unk10;
};

struct MyDrawNode2
{
    struct OrdTblNode node;
    s32 unk8;
    s32 unkC;
};

static void func_8005C3B8(struct RenderEffect *);
static void func_8005C4D0(struct RenderEffect *);
static void func_8005C540(struct RenderEffect *);
static void func_8005C55C(int, struct RenderEffect *);
static void lbl_8005CB90(struct MyDrawNode *);
static void lbl_8005CC4C(struct MyDrawNode2 *);
static void lbl_8005CEAC(struct EnvMapSomething *);
static void lbl_8005D4B0(struct EnvMapSomething *);
static void lbl_8005DCA8(struct EnvMapSomething *);
static int model_find_proc(int, struct GMAModelEntry *);
static int obj_find_proc(int, struct StageBgObject *);

static struct RenderEffectFuncs heatEffectFuncs =
{
    func_8005C3B8,
    func_8005C4D0,
    func_8005C540,
    func_8005C55C,
};

struct Struct8005C3B8
{
    GXTexObj unk0;
    void *unk20;
    GXTexObj unk24;
    void *unk44;
    GXTexObj *unk48;
};

void bg_sand_init(void)
{
    struct BGSandWork *work = backgroundInfo.work;
    Vec sp20;
    float temp_f0;
    float temp_f0_2;
    int var_r29;
    int var_r28;
    struct BGSandWork_sub *var_r27;
    struct BGSandWork_sub_sub *var_r26;

    bg_default_init();
    if (work->unk0 == 0)
    {
        find_background_gma_models(sandBgModelFind, model_find_proc);
        work->unk0 = 1;
    }
    work->unk40 = 0;
    work->unk7C = 0;
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
    if (modeCtrl.unk30 < 2)
    {
        struct RenderEffect rendEfc;

        memset(&rendEfc, 0, sizeof(rendEfc));
        rendEfc.cameraMask = 0xFFFF;
        rendEfc.funcs = &heatEffectFuncs;
        rend_efc_enable(0, 0, &rendEfc);
    }
    work->unk4.x = 6.0f + ((rand() / 32767.0f) - 0.5f);
    work->unk4.y = 4.0f + ((rand() / 32767.0f) - 0.5f);
    work->unk4.z = 1.0f;
    work->unk10 = 0.0f;
    work->unk14 = 0.0f;
    work->unk18 = 0.0f;
    work->unk1C.x = (rand() / 32767.0f) - 0.5f;
    work->unk1C.y = 1.0f;
    work->unk1C.z = (rand() / 32767.0f) - 0.5f;
    mathutil_vec_set_len(&work->unk1C, &work->unk1C, 0.02f + (0.01f * ((rand() / 32767.0f) - 0.5f)));
    mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
    mathutil_mtxA_tf_vec_xyz(&work->unk28, 0.0f, 0.45f + (0.1f * (rand() / 32767.0f)), 0.0f);
    temp_f0 = work->unk4.x / 6.0f;
    work->unk28.x *= temp_f0 * temp_f0;
    temp_f0_2 = work->unk4.y / 4.0f;
    work->unk28.y *= temp_f0_2 * temp_f0_2;
    work->unk64.x = (rand() / 32767.0f);
    work->unk64.y = (rand() / 32767.0f);
    work->unk64.z = (rand() / 32767.0f);
    sp20.x = 0.0016666667f;
    sp20.y = 0.0f;
    sp20.z = 0.0f;
    mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
    mathutil_mtxA_tf_vec(&sp20, &work->unk70);

    var_r27 = work->unk80;
    for (var_r29 = work->unk7C; var_r29 > 0; var_r29--, var_r27++)
    {
        var_r27->unkC =  0.008333334f * (0.5f - (rand() / 32767.0f));
        var_r27->unk10 = 0.008333334f * (1.0f + (0.1f * (rand() / 32767.0f)));
        var_r27->unk14 = 0.0f;
        var_r27->unk24 = 0.010000001f * (0.5f - (rand() / 32767.0f));
        var_r27->unk28 = 0.010000001f * (1.0f + (0.1f * (rand() / 32767.0f)));
        var_r27->unk2C = 0.0f;
        var_r27->unk30 = 0.7f + (0.2f * (rand() / 32767.0f));
        var_r26 = var_r27->unk34;
        for (var_r28 = 6; var_r28 > 0; var_r28--, var_r26++)
        {
            if (var_r28 < 3)
                var_r26->unk0 = work->unk558;
            else
                var_r26->unk0 = work->unk560;
            var_r26->unk4 = (rand() / 32767.0f);
            var_r26->unk8 = var_r27->unk28 * (rand() / 32767.0f);
            var_r26->unkC = (rand() & 0x7FFF);
            var_r26->unkE = (rand() & 0x7F) - 0x40;
        }
    }
}

void bg_sand_main(void)
{
    struct BGSandWork *work = backgroundInfo.work;
    int var_r30;
    int var_r29;
    struct BGSandWork_sub *var_r28;
    struct BGSandWork_sub_sub *var_r27;

    bg_default_main();
    if ((gamePauseStatus & 0xA) && (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING))
        return;

    work->unk1C.y += 0.001f * (0.03f - work->unk1C.y);
    work->unk10 += work->unk1C.x;
    work->unk14 += work->unk1C.y;
    work->unk18 += work->unk1C.z;
    work->unk64.x += work->unk70.x;
    work->unk64.y += work->unk70.y;

    var_r28 = work->unk80;
    for (var_r30 = work->unk7C; var_r30 > 0; var_r30--, var_r28++)
    {
        float temp_f29;
        float temp_f28;

        var_r28->unk0.x += var_r28->unkC;
        var_r28->unk0.y += var_r28->unk10;
        var_r28->unk0.z += var_r28->unk14;
        var_r28->unk18.x += var_r28->unk24;
        var_r28->unk18.y += var_r28->unk28;
        var_r28->unk18.z += var_r28->unk2C;
        temp_f28 = __fabs(var_r28->unk28);
        temp_f29 = 3.0f * temp_f28;

        var_r27 = var_r28->unk34;
        for (var_r29 = 6; var_r29 > 0; var_r29--, var_r27++)
        {
            var_r27->unk8 += 0.05f * (temp_f28 - var_r27->unk8);
            var_r27->unk4 += var_r27->unk8;
            var_r27->unkE -= var_r27->unkE >> 5;
            var_r27->unkC += var_r27->unkE;
            if (var_r27->unk4 > 1.0f)
            {
                while (var_r27->unk4 > 1.0f)
                    var_r27->unk4 -= 1.0f;
                var_r27->unk8 = temp_f29 * (rand() / 32767.0f);
                var_r27->unkC = rand() & 0x7FFF;
                var_r27->unkE = (rand() & 0x3FF) - 0x200;
            }
        }
    }
}

void bg_sand_finish(void) {}

void bg_sand_draw(void)
{
    struct BGSandWork *work = backgroundInfo.work;
    struct StageBgObject *temp_r28;
    struct OrdTblNode *temp_r25;
    u32 var_r30;
    struct StageBgObject **var_r27;
    struct MyDrawNode *temp_r24;
    struct MyDrawNode2 *temp_r24_2;
    int i;

    if (lbl_801EEC90.unk0 & 0x11)
        var_r30 = 1 << 4;
    else if (gameMode == 2 || gameMode == 4)
        var_r30 = 1 << (modeCtrl.unk30 - 1);
    else
        var_r30 = 1;

    var_r27 = work->pyramidClouds;
    for (i = work->unk40; i > 0; i--, var_r27++)
        (*var_r27)->flags &= 0xFFFEFFFF;

    var_r27 = work->fountainWater;
    for (i = work->unk7C; i > 0; i--, var_r27++)
        (*var_r27)->flags &= 0xFFFEFFFF;

    bg_default_draw();
    if (work->unk40 != 0)
    {
        var_r27 = work->pyramidClouds;
        for (i = work->unk40; i > 0; i--, var_r27++)
        {
            temp_r28 = *var_r27;
            if (temp_r28->flags & var_r30)
            {
                mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
                mathutil_mtxA_translate(&temp_r28->pos);
                mathutil_mtxA_rotate_z(temp_r28->rotZ);
                mathutil_mtxA_rotate_y(temp_r28->rotY);
                mathutil_mtxA_rotate_x(temp_r28->rotX);
                mathutil_mtxA_scale(&temp_r28->scale);
                temp_r25 = ord_tbl_get_entry_for_pos(&temp_r28->model->boundSphereCenter);
                temp_r24 = ord_tbl_alloc_node(sizeof(*temp_r24));
                temp_r24->node.drawFunc = (OrdTblDrawFunc)lbl_8005CB90;
                temp_r24->unk8 = peek_light_group();
                temp_r24->unkC = temp_r28;
                mathutil_mtxA_to_mtx(temp_r24->unk10);
                ord_tbl_insert_node(temp_r25, (void *)temp_r24);
            }

        }
    }

    if (work->unk7C != 0)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);

        var_r27 = work->fountainWater;
        for (i = 0; i < work->unk7C; i++, var_r27++)
        {
            temp_r28 = *var_r27;
            if (temp_r28->flags & var_r30)
            {
                temp_r25 = ord_tbl_get_entry_for_pos(&temp_r28->pos);
                temp_r24_2 = ord_tbl_alloc_node(sizeof(*temp_r24_2));
                temp_r24_2->node.drawFunc = (OrdTblDrawFunc)lbl_8005CC4C;
                temp_r24_2->unk8 = peek_light_group();
                temp_r24_2->unkC = i;
                ord_tbl_insert_node(temp_r25, (void *)temp_r24_2);
            }
        }
    }
}

void bg_sand_interact(int arg0) {}

static void func_8005C3B8(struct RenderEffect *rendEfc)
{
    struct Struct8005C3B8 *temp_r3;
    size_t texSize;

    rendEfc->enableFlags = 8;
    temp_r3 = OSAllocFromHeap(stageHeap, sizeof(*temp_r3));
    if (temp_r3 == NULL)
    {
        rendEfc->state = 0;
        return;
    }
    rendEfc->work = temp_r3;
    temp_r3->unk20 = lbl_802F1B40;
    GXInitTexObj(&temp_r3->unk0, temp_r3->unk20, 640, 448, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0U);
    texSize = GXGetTexBufferSize(640, 448, 1U, 0U, 0U);
    temp_r3->unk44 = OSAllocFromHeap(stageHeap, texSize);
    if (temp_r3->unk44 == NULL)
    {
        OSFreeToHeap(stageHeap, temp_r3);
        rendEfc->state = 0;
        return;
    }
    GXInitTexObj(&temp_r3->unk24, temp_r3->unk44, 640, 448, GX_TF_I8, GX_CLAMP, GX_CLAMP, 0U);
    temp_r3->unk48 = ((struct BGSandWork *)backgroundInfo.work)->shadowMapTex;
    ((struct BGSandWork *)backgroundInfo.work)->unk38 = &temp_r3->unk0;
}

static void func_8005C4D0(struct RenderEffect *arg0)
{
    struct Struct8005C3B8 *temp_r3;

    temp_r3 = arg0->work;
    if (temp_r3 != NULL)
    {
        if (temp_r3->unk44 != NULL)
            OSFreeToHeap(stageHeap, temp_r3->unk44);
        OSFreeToHeap(stageHeap, arg0->work);
    }
    if (backgroundInfo.bgId == BG_TYPE_SND)
        ((struct BGSandWork *)backgroundInfo.work)->unk38 = NULL;
}

static void func_8005C540(struct RenderEffect *arg0)
{
    if (backgroundInfo.bgId != BG_TYPE_SND)
        arg0->state = 3;
}

static void func_8005C55C(int arg0, struct RenderEffect *arg1)
{
    float temp_f9;
    struct Struct8005C3B8 *temp_r28 = arg1->work;
    struct BGSandWork *work = backgroundInfo.work;
    float fbWidth;
    float fbHeight;
    u16 left;
    u16 top;
    u16 width;
    u16 height;
    float temp1;
    float temp_f31;
    float temp_f30;
    float temp_f29;
    float temp_f28;
    Point3d sp38;
    s16 sp36;
    s16 sp34;
    f32 sp1C[2][3];
    u8 unused[4];

    fbWidth  = currRenderMode->fbWidth;
    fbHeight = currRenderMode->xfbHeight;
    left   = fbWidth * currentCameraStructPtr->sub28.vp.left;
    top    = fbHeight * currentCameraStructPtr->sub28.vp.top;
    width  = fbWidth * currentCameraStructPtr->sub28.vp.width;
    height = fbHeight * currentCameraStructPtr->sub28.vp.height;
    left   = left & ~1;
    top    = top & ~1;
    width  = (width + 1) & ~1;
    height = (height + 1) & ~1;

    GXSetTexCopySrc(left, top, width, height);
    GXSetTexCopyDst(width, height, GX_TF_RGB565, 0U);
    GXCopyTex(temp_r28->unk20, 0U);
    GXInitTexObj(&temp_r28->unk0, temp_r28->unk20, width, height, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0U);
    GXSetTexCopyDst(width, height, GX_CTF_Z8M, 0U);
    GXCopyTex(temp_r28->unk44, 0U);
    GXInitTexObj(&temp_r28->unk24, temp_r28->unk44, width, height, GX_TF_I8, GX_CLAMP, GX_CLAMP, 0U);
    GXSetNumChans(0U);
    GXLoadTexObj_cached(&temp_r28->unk0, 0);
    GXLoadTexObj_cached(temp_r28->unk48, 1);
    GXLoadTexObj_cached(&temp_r28->unk24, 2);
    sp38.x = 0.0f;
    sp38.y = 0.0f;
    sp38.z = -1.0f;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_inv_tf_vec(&sp38, &sp38);
    mathutil_vec_to_euler_xy(&sp38, &sp36, &sp34);
    temp_f9 = 32768.0f / currentCameraStructPtr->sub28.fov;
    temp1 = (-temp_f9 * work->unk4.x / currentCameraStructPtr->sub28.aspect);
    temp_f9 = (temp_f9 * work->unk4.y);
    sp38.x = work->unk10 + (sp34 / 65536.0f) * temp1;
    sp38.y = work->unk14 + (sp36 / 65536.0f) * temp_f9;
    mathutil_mtxA_from_translate_xyz(sp38.x, sp38.y, 0.0f);
    mathutil_mtxA_scale(&work->unk4);
    GXLoadTexMtxImm(mathutilData->mtxA, 0x1EU, GX_MTX2x4);
    GXSetTexCoordGen2(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 0x3CU, 0U, 0x7DU);
    GXSetTevOrder_cached(0, 0, 0, 4);
    GXSetTevKAlphaSel_cached(0, 3);
    GXSetTevColorIn_cached(0, 0xF, 0xF, 0xF, 8);
    GXSetTevColorOp_cached(0, 0, 0, 0, 0, 0);
    GXSetTevAlphaIn_cached(0, 7, 7, 7, 6);
    GXSetTevAlphaOp_cached(0, 0, 0, 0, 1, 0);
    GXSetTexCoordGen2(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, 0x1EU, 0U, 0x7DU);
    sp1C[0][0] = work->unk28.x;
    sp1C[0][1] = 0.0f;
    sp1C[0][2] = 0.0f;
    sp1C[1][0] = 0.0f;
    sp1C[1][1] = work->unk28.y;
    sp1C[1][2] = 0.0f;
    GXSetIndTexMtx(GX_ITM_0, sp1C, -4);
    GXSetIndTexOrder(GX_INDTEXSTAGE0, GX_TEXCOORD1, GX_TEXMAP1);
    GXSetTevIndirect(GX_TEVSTAGE0, GX_INDTEXSTAGE0, GX_ITF_8, GX_ITB_STU, GX_ITM_0, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
    GXSetTevDirect(GX_TEVSTAGE1);
    GXSetTevOrder_cached(1, 0, 2, 4);
    GXSetTevSwapMode_cached(1, 0, 1);
    GXSetTevColorIn_cached(1, 0xF, 0xF, 0xF, 0);
    GXSetTevColorOp_cached(1, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(1, 7, 0, 4, 7);
    GXSetTevAlphaOp_cached(1, 0, 0, 0, 1, 0);
    GXSetNumTevStages_cached(2);
    GXSetNumTexGens(2U);
    GXSetNumIndStages(1U);
    GXSetBlendMode_cached(1, 4, 5, 0);
    GXSetZMode_cached(0U, GX_LEQUAL, 0U);
    func_8009AC8C();
    GXSetCullMode_cached(2);
    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_TEX0));
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0U);
    temp_f31 = currentCameraStructPtr->sub28.unk38;
    temp_f30 = temp_f31 * currentCameraStructPtr->sub28.aspect;
    temp_f29 = temp_f30 * currentCameraStructPtr->sub28.unk28;
    temp_f28 = temp_f31 * currentCameraStructPtr->sub28.unk2C;
    GXBegin(GX_QUADS, GX_VTXFMT0, 4U);
        GXPosition3f32(-temp_f30 - temp_f29, temp_f31 - temp_f28, -1.0f);
        GXTexCoord2f32(0.0f, 0.0f);
        GXPosition3f32(temp_f30 - temp_f29, temp_f31 - temp_f28, -1.0f);
        GXTexCoord2f32(1.0f, 0.0f);
        GXPosition3f32(temp_f30 - temp_f29, -temp_f31 - temp_f28, -1.0f);
        GXTexCoord2f32(1.0f, 1.0f);
        GXPosition3f32(-temp_f30 - temp_f29, -temp_f31 - temp_f28, -1.0f);
        GXTexCoord2f32(0.0f, 1.0f);
    GXEnd();
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    GXSetTevSwapMode_cached(0, 0, 0);
}

static void lbl_8005CB90(struct MyDrawNode *arg0)
{
    struct BGSandWork *work = backgroundInfo.work;
    struct StageBgObject *temp_r30 = arg0->unkC;

    load_light_group_cached(arg0->unk8);
    mathutil_mtxA_from_translate(&work->unk64);
    avdisp_set_custom_tex_mtx(0, mathutilData->mtxA);
    avdisp_enable_custom_tex_mtx(1U);
    avdisp_set_z_mode(1U, GX_LEQUAL, 0U);
    mathutil_mtxA_from_mtx(arg0->unk10);
    GXLoadPosMtxImm(mathutilData->mtxA, 0U);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0U);
    avdisp_draw_model_culled_sort_none(temp_r30->model);
    avdisp_set_z_mode(1U, GX_LEQUAL, 1U);
    avdisp_enable_custom_tex_mtx(0U);
}

float force_lbl_802F42A0() { return 0.8f; }

static void lbl_8005CC4C(struct MyDrawNode2 *arg0)
{
    int i;
    struct BGSandWork *work = backgroundInfo.work;
    struct StageBgObject *temp_r29;
    struct BGSandWork_sub *temp_r28;
    BallEnvFunc var_r28;
    BallEnvFunc var_r31_2;
    struct BGSandWork_sub_sub *var_r27;

    load_light_group_cached(arg0->unk8);
    temp_r29 = work->fountainWater[arg0->unkC];
    temp_r28 = &work->unk80[arg0->unkC];
    work->unk564 = temp_r28;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&temp_r29->pos);
    mathutil_mtxA_rotate_z(temp_r29->rotZ);
    mathutil_mtxA_rotate_y(temp_r29->rotY);
    mathutil_mtxA_rotate_x(temp_r29->rotX);
    mathutil_mtxA_scale(&temp_r29->scale);
    avdisp_set_z_mode(1U, GX_LEQUAL, 0U);

    var_r27 = temp_r28->unk34;
    for (i = 6; i > 0; i--, var_r27++)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_rotate_y(var_r27->unkC);
        GXLoadPosMtxImm(mathutilData->mtxA, 0U);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0U);
        avdisp_set_post_mult_color(1.0f, 1.0f, 1.0f, 0.25f * mathutil_sin(32768.0f * var_r27->unk4));
        avdisp_draw_model_culled_sort_none(var_r27->unk0);
        mathutil_mtxA_pop();
    }
    avdisp_set_post_mult_color(1.0f, 1.0f, 1.0f, 1.0f);
    mathutil_mtxA_push();
    mathutil_mtxA_rotate_y(224.0f * backgroundInfo.animTimer);
    GXLoadPosMtxImm(mathutilData->mtxA, 0U);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0U);
    avdisp_draw_model_culled_sort_none(work->unk554);
    avdisp_draw_model_culled_sort_none(work->unk55C);
    mathutil_mtxA_pop();
    mathutil_mtxA_push();
    mathutil_mtxA_from_translate(&temp_r28->unk0);
    avdisp_set_custom_tex_mtx(0, mathutilData->mtxA);
    mathutil_mtxA_pop();
    avdisp_enable_custom_tex_mtx(1);
    if (work->unk38 != 0)
    {
        var_r28 = lbl_8005CEAC;
        var_r31_2 = lbl_8005D4B0;
    }
    else
    {
        var_r28 = lbl_8005DCA8;
        var_r31_2 = lbl_8005DCA8;
    }
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    u_avdisp_set_some_func_1(var_r31_2);
    avdisp_draw_model_culled_sort_none(work->waterBUraModel);
    u_avdisp_set_some_func_1(var_r28);
    avdisp_draw_model_culled_sort_none(work->waterAUraModel);
    u_avdisp_set_some_func_1(var_r31_2);
    avdisp_draw_model_culled_sort_none(work->waterBModel);
    u_avdisp_set_some_func_1(var_r28);
    avdisp_draw_model_culled_sort_none(temp_r29->model);
    u_avdisp_set_some_func_1(NULL);
    avdisp_enable_custom_tex_mtx(0U);
    avdisp_set_z_mode(1U, GX_LEQUAL, 1U);
}

static struct Struct80061BC4_sub lbl_8027CBC8;

static void lbl_8005CEAC(struct EnvMapSomething *arg0)
{
    struct BGSandWork *work = backgroundInfo.work;
    struct Struct80061BC4_sub sp64;
    f32 sp4C[2][3];
    Mtx sp1C;
    GXColor sp14;
    int r31;
    int r29;
    int r28;
    int r27;
    int r27_3;
    int r28_2;
    int r27_2;
    struct BGSandWork_sub *temp_r26;

    sp64 = arg0->unkC;
    if (arg0->unk0 == 0
     && sp64.unk0 == lbl_8027CBC8.unk0
     && sp64.unk4 == lbl_8027CBC8.unk4
     && sp64.unk10 == lbl_8027CBC8.unk10
     && sp64.unk8 == lbl_8027CBC8.unk8
     && sp64.unk1C == lbl_8027CBC8.unk1C
     && sp64.u_texMapId == lbl_8027CBC8.u_texMapId)
    {
        sp64.unk10 += 2;
        sp64.unk4 += 2;
        sp64.unk8 += 6;
        sp64.unk1C += 2;
        sp64.u_texMapId += 2;
        arg0->unkC = sp64;
        return;
    }
    lbl_8027CBC8 = sp64;
    temp_r26 = work->unk564;
    sp4C[0][0] = temp_r26->unk30;
    sp4C[0][1] = 0.0f;
    sp4C[0][2] = 0.0f;
    sp4C[1][0] = 0.0f;
    sp4C[1][1] = temp_r26->unk30;
    sp4C[1][2] = 0.0f;
    GXSetIndTexMtx(r27 = sp64.unk1C, sp4C, -2);
    sp4C[0][0] = 0.6f * temp_r26->unk30;
    sp4C[0][1] = 0.0f;
    sp4C[0][2] = 0.0f;
    sp4C[1][0] = 0.0f;
    sp4C[1][1] = 0.8f * temp_r26->unk30;
    sp4C[1][2] = 0.0f;
    GXSetIndTexMtx((r29 = *(s32 *)&sp64.unk1C) + 1, sp4C, -2);
    sp4C[0][0] = 0.4f;
    sp4C[0][1] = 0.0f;
    sp4C[0][2] = 0.0f;
    sp4C[1][0] = 0.0f;
    sp4C[1][1] = -0.6f;
    sp4C[1][2] = 0.0f;
    GXSetIndTexMtx(r29 + 2, sp4C, 0);
    r28 = sp64.u_texMapId;
    GXLoadTexObj_cached(work->fountainIndirectTex, r28);
    r29 = sp64.u_texMapId;
    GXLoadTexObj_cached(work->unk38, r29 + 1);
    GXLoadTexObj_cached(work->fountainGradientTex, r29 + 2);
    mathutil_mtxA_push();
    mathutil_mtxA_from_translate(&temp_r26->unk18);
    r29 = sp64.unk8;
    GXLoadTexMtxImm(mathutilData->mtxA, r29, GX_MTX3x4);
    mathutil_mtxA_pop();
    r31 = sp64.unk4;
    GXSetTexCoordGen(r31, GX_TG_MTX2x4, GX_TG_TEX0, r29);
    r29 = sp64.unk10;
    GXSetIndTexOrder(r29, r31, r28);
    GXSetTevIndirect(sp64.unk0 - 1, r29, GX_ITF_8, GX_ITB_STU, r27, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
    sp64.unk10 += 1;
    sp64.unk4 += 1;
    sp64.unk8 += 3;
    sp64.unk1C += 1;
    sp64.u_texMapId += 1;
    r27_2 = sp64.unk10;
    GXSetIndTexOrder(r27_2, sp64.unk4 - 1, sp64.u_texMapId - 1);
    GXSetTevIndirect(sp64.unk0, r27_2, GX_ITF_8, GX_ITB_STU, sp64.unk1C, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
    r27_3 = sp64.unk8;
    r28_2 = sp64.unk4;
    GXSetTexCoordGen(r28_2, GX_TG_MTX3x4, GX_TG_POS, r27_3);
    sp1C[0][0] = 1.05f * (-0.5f * currentCameraStructPtr->sub28.unk3C * (1.0f / currentCameraStructPtr->sub28.aspect));
    sp1C[0][1] = 0.0f;
    sp1C[0][2] = 0.5f + (-0.5f * currentCameraStructPtr->sub28.unk28);
    sp1C[0][3] = 0.0f;
    sp1C[1][0] = 0.0f;
    sp1C[1][1] = 1.05f * (0.5f * currentCameraStructPtr->sub28.unk3C);
    sp1C[1][2] = (0.5f + (-0.5f * currentCameraStructPtr->sub28.unk2C)) - 0.01f;
    sp1C[1][3] = 0.0f;
    sp1C[2][0] = 0.0f;
    sp1C[2][1] = 0.0f;
    sp1C[2][2] = 1.0f;
    sp1C[2][3] = 0.0f;
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(sp1C);
    GXLoadTexMtxImm(mathutilData->mtxA, r27_3, GX_MTX3x4);
    mathutil_mtxA_pop();
    sp14.r = 0x40;
    sp14.g = 0x50;
    sp14.b = 0x80;
    GXSetTevKColor_cached(3, sp14);
    GXSetTevKColorSel_cached(sp64.unk0, 0xF);
    GXSetTevOrder_cached(sp64.unk0, r28_2, sp64.u_texMapId, 0xFF);
    GXSetTevColorIn_cached(sp64.unk0, 0xF, 8, 0xE, 0);
    GXSetTevColorOp_cached(sp64.unk0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(sp64.unk0, 7, 7, 7, 0);
    GXSetTevAlphaOp_cached(sp64.unk0, 0, 0, 0, 1, 0);
    sp64.unk0 += 1;
    sp64.unk10 += 1;
    sp64.unk4 += 1;
    sp64.u_texMapId += 1;
    sp64.unk1C += 1;
    sp64.unk8 += 3;
    arg0->unkC = sp64;
}

static void lbl_8005D4B0(struct EnvMapSomething *arg0)
{
    struct BGSandWork *work = backgroundInfo.work;
    struct Struct80061BC4_sub sp64;
    f32 sp4C[2][3];
    Mtx sp1C;
    GXColor sp14;
    int r31;
    int r29;
    int r28;
    int r27;
    int r27_3;
    int r28_2;
    int r27_2;
    int r27_4;
    int r27_5;
    int r28_3;
    struct BGSandWork_sub *temp_r26;

    sp64 = arg0->unkC;
    if (arg0->unk0 == 0
     && sp64.unk0 == lbl_8027CBC8.unk0
     && sp64.unk4 == lbl_8027CBC8.unk4
     && sp64.unk10 == lbl_8027CBC8.unk10
     && sp64.unk8 == lbl_8027CBC8.unk8
     && sp64.unk1C == lbl_8027CBC8.unk1C
     && sp64.u_texMapId == lbl_8027CBC8.u_texMapId)
    {
        sp64.unk10 += 2;
        sp64.unk4 += 2;
        sp64.unk8 += 6;
        sp64.unk1C += 2;
        sp64.u_texMapId += 2;
        sp64.unk0 += 1;
        sp64.unk10 += 1;
        sp64.unk4 += 2;
        sp64.u_texMapId += 1;
        sp64.unk1C += 1;
        sp64.unk8 += 3;
        arg0->unkC = sp64;
        return;
    }

    lbl_8027CBC8 = sp64;
    temp_r26 = work->unk564;
    sp4C[0][0] = temp_r26->unk30;
    sp4C[0][1] = 0.0f;
    sp4C[0][2] = 0.0f;
    sp4C[1][0] = 0.0f;
    sp4C[1][1] = temp_r26->unk30;
    sp4C[1][2] = 0.0f;
    GXSetIndTexMtx(r27 = sp64.unk1C, sp4C, -2);
    sp4C[0][0] = 0.6f * temp_r26->unk30;
    sp4C[0][1] = 0.0f;
    sp4C[0][2] = 0.0f;
    sp4C[1][0] = 0.0f;
    sp4C[1][1] = 0.8f * temp_r26->unk30;
    sp4C[1][2] = 0.0f;
    GXSetIndTexMtx((r29 = *(s32 *)&sp64.unk1C) + 1, sp4C, -2);
    sp4C[0][0] = 0.4f;
    sp4C[0][1] = 0.0f;
    sp4C[0][2] = 0.0f;
    sp4C[1][0] = 0.0f;
    sp4C[1][1] = -0.6f;
    sp4C[1][2] = 0.0f;
    GXSetIndTexMtx(r29 + 2, sp4C, 0);
    r28 = sp64.u_texMapId;
    GXLoadTexObj_cached(work->fountainIndirectTex, r28);
    r29 = sp64.u_texMapId;
    GXLoadTexObj_cached(work->unk38, r29 + 1);
    GXLoadTexObj_cached(work->fountainGradientTex, r29 + 2);
    mathutil_mtxA_push();
    mathutil_mtxA_from_translate(&temp_r26->unk18);
    r29 = sp64.unk8;
    GXLoadTexMtxImm(mathutilData->mtxA, r29, GX_MTX3x4);
    mathutil_mtxA_pop();
    r31 = sp64.unk4;
    GXSetTexCoordGen(r31, GX_TG_MTX2x4, GX_TG_TEX0, r29);
    r29 = sp64.unk10;
    GXSetIndTexOrder(r29, r31, r28);
    GXSetTevIndirect(sp64.unk0 - 1, r29, GX_ITF_8, GX_ITB_STU, r27, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
    sp64.unk10 += 1;
    sp64.unk4 += 1;
    sp64.unk8 += 3;
    sp64.unk1C += 1;
    sp64.u_texMapId += 1;
    r27_2 = sp64.unk10;
    GXSetIndTexOrder(r27_2, sp64.unk4 - 1, sp64.u_texMapId - 1);
    GXSetTevIndirect(sp64.unk0, r27_2, GX_ITF_8, GX_ITB_STU, sp64.unk1C, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
    r27_3 = sp64.unk8;
    r28_2 = sp64.unk4;
    GXSetTexCoordGen(r28_2, GX_TG_MTX3x4, GX_TG_POS, r27_3);
    sp1C[0][0] = 1.05f * (-0.5f * currentCameraStructPtr->sub28.unk3C * (1.0f / currentCameraStructPtr->sub28.aspect));
    sp1C[0][1] = 0.0f;
    sp1C[0][2] = 0.5f + (-0.5f * currentCameraStructPtr->sub28.unk28);
    sp1C[0][3] = 0.0f;
    sp1C[1][0] = 0.0f;
    sp1C[1][1] = 1.05f * (0.5f * currentCameraStructPtr->sub28.unk3C);
    sp1C[1][2] = (0.5f + (-0.5f * currentCameraStructPtr->sub28.unk2C)) - 0.01f;
    sp1C[1][3] = 0.0f;
    sp1C[2][0] = 0.0f;
    sp1C[2][1] = 0.0f;
    sp1C[2][2] = 1.0f;
    sp1C[2][3] = 0.0f;
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(sp1C);
    GXLoadTexMtxImm(mathutilData->mtxA, r27_3, GX_MTX3x4);
    mathutil_mtxA_pop();
    sp14.r = 0x40;
    sp14.g = 0x50;
    sp14.b = 0x80;
    GXSetTevKColor_cached(3, sp14);
    GXSetTevKColorSel_cached(sp64.unk0, 0xF);
    GXSetTevOrder_cached(sp64.unk0, r28_2, sp64.u_texMapId, 0xFF);
    GXSetTevColorIn_cached(sp64.unk0, 0xF, 8, 0xE, 0);
    GXSetTevColorOp_cached(sp64.unk0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(sp64.unk0, 7, 7, 7, 0);
    GXSetTevAlphaOp_cached(sp64.unk0, 0, 0, 0, 1, 0);
    sp64.unk0 += 1;
    sp64.unk10 += 1;
    sp64.unk4 += 1;
    sp64.u_texMapId += 1;
    sp64.unk1C += 1;
    sp64.unk8 += 3;
    r27_4 = sp64.unk10;
    GXSetIndTexOrder(r27_4, sp64.unk4 - 2, sp64.u_texMapId - 2);
    GXSetTevIndirect(sp64.unk0, r27_4, GX_ITF_8, GX_ITB_NONE, sp64.unk1C, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
    r27_5 = sp64.unk8;
    r28_3 = sp64.unk4;
    GXSetTexCoordGen(r28_3, GX_TG_MTX2x4, GX_TG_POS, r27_5);
    mathutil_mtxA_push();
    mathutil_mtxA_from_translate_xyz(0.0016666667f * backgroundInfo.animTimer, 0.0f, 0.0f);
    mathutil_mtxA_scale_xyz(0.1f, -0.025f, 1.0f);
    mathutil_mtxA_rotate_y(backgroundInfo.unkA4 << 7);
    mathutil_mtxA_rotate_x(0x400);
    mathutil_mtxA_translate_xyz(0.0f, 10.0f, 0.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, r27_5, GX_MTX2x4);
    mathutil_mtxA_pop();
    GXSetTevSwapMode_cached(sp64.unk0, 0, 1);
    GXSetTevOrder_cached(sp64.unk0, r28_3, sp64.u_texMapId, 0xFF);
    GXSetTevColorIn_cached(sp64.unk0, 0xF, 0xF, 0xF, 0);
    GXSetTevColorOp_cached(sp64.unk0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(sp64.unk0, 7, 0, 4, 7);
    GXSetTevAlphaOp_cached(sp64.unk0, 0, 0, 0, 1, 0);
    sp64.unk0 += 1;
    sp64.unk10 += 1;
    sp64.unk4 += 1;
    sp64.u_texMapId += 1;
    sp64.unk1C += 1;
    sp64.unk8 += 3;
    arg0->unkC = sp64;
}

static void lbl_8005DCA8(struct EnvMapSomething *arg0)
{
    struct BGSandWork *work = backgroundInfo.work;
    struct Struct80061BC4_sub sp2C;
    f32 sp14[2][3];
    struct BGSandWork_sub *temp_r28;

    sp2C = arg0->unkC;
    if (arg0->unk0 == 0
     && sp2C.unk0 == lbl_8027CBC8.unk0
     && sp2C.unk4 == lbl_8027CBC8.unk4
     && sp2C.unk10 == lbl_8027CBC8.unk10
     && sp2C.unk8 == lbl_8027CBC8.unk8
     && sp2C.unk1C == lbl_8027CBC8.unk1C
     && sp2C.u_texMapId == lbl_8027CBC8.u_texMapId)
    {
        sp2C.unk10 += 1;
        sp2C.unk4 += 1;
        sp2C.unk8 += 3;
        sp2C.unk1C += 1;
        sp2C.u_texMapId += 1;
        arg0->unkC = sp2C;
        return;
    }
    lbl_8027CBC8 = sp2C;
    temp_r28 = work->unk564;
    sp14[0][0] = temp_r28->unk30;
    sp14[0][1] = 0.0f;
    sp14[0][2] = 0.0f;
    sp14[1][0] = 0.0f;
    sp14[1][1] = temp_r28->unk30;
    sp14[1][2] = 0.0f;
    GXSetIndTexMtx(sp2C.unk1C, sp14, -2);
    GXLoadTexObj_cached(work->fountainIndirectTex, sp2C.u_texMapId);
    mathutil_mtxA_push();
    mathutil_mtxA_from_translate(&temp_r28->unk18);
    GXLoadTexMtxImm(mathutilData->mtxA, sp2C.unk8, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXSetTexCoordGen(sp2C.unk4, GX_TG_MTX2x4, GX_TG_TEX0, sp2C.unk8);
    GXSetIndTexOrder(sp2C.unk10, sp2C.unk4, sp2C.u_texMapId);
    GXSetTevIndirect(sp2C.unk0 - 1, sp2C.unk10, GX_ITF_8, GX_ITB_STU, sp2C.unk1C, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
    sp2C.unk10 += 1;
    sp2C.unk4 += 1;
    sp2C.unk8 += 3;
    sp2C.unk1C += 1;
    sp2C.u_texMapId += 1;
    arg0->unkC = sp2C;
}

static int model_find_proc(int index, struct GMAModelEntry *entry)
{
    struct BGSandWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // SND_KAGE_LOW_MAP_A
        work->shadowMapTex = &entry->model->texObjs[0];
        break;
    case 1:  // SND_STAGE_SAND_A
        work->sandTex = &entry->model->texObjs[0];
        break;
    case 2:  // SND_FUNSUI_WATER_A_URA
        work->waterAUraModel = entry->model;
        break;
    case 3:  // SND_FUNSUI_WATER_B
        work->waterBModel = entry->model;
        break;
    case 4:  // SND_FUNSUI_WATER_B_URA
        work->waterBUraModel = entry->model;
        break;
    case 5:  // SND_FUNSUI_IND_A
        work->fountainIndirectTex = &entry->model->texObjs[0];
        break;
    case 6:  // SND_FUNSUI_GRAD_A
        work->fountainGradientTex = &entry->model->texObjs[0];
        break;
    case 7:  // SND_FUNSUI_UP_TATE "fountain up vertical"
    case 8:  // SND_FUNSUI_UP_YOKO "fountain up horizontal"
    case 9:  // SND_FUNSUI_DOWN_TATE "fountain down verical"
    case 10:  // SND_FUNSUI_DOWN_YOKO " fountain down horizontal"
        work->unk538[index] = entry->model;
        break;
    }
    return 1;
}

static int obj_find_proc(int index, struct StageBgObject *bgObj)
{
    struct BGSandWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // SND_PIRAM_CLOUD
        if (bgObj->model != NULL && work->unk40 < 8)
        {
            work->pyramidClouds[work->unk40] = bgObj;
            work->unk40++;
        }
        break;
    case 1:  // SND_FUNSUI_WATER
        if (bgObj->model != NULL && work->unk7C < 8)
        {
            work->fountainWater[work->unk7C] = bgObj;
            work->unk7C++;
        }
        break;
    }
    return 1;
}
