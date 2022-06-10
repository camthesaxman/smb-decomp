#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "event.h"
#include "gxcache.h"
#include "gxutil.h"
#include "item.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "stage.h"
#include "stobj.h"

struct Struct800973A0
{
    GXTexObj unk0;
    u32 unk20;
    void *unk24;
    u16 unk28;
    u16 unk2A;
    Mtx unk2C;
    u8 filler5C[4];
    u8 unk60;
};

void func_800976FC(int unused, struct Struct802BA1A0 *arg1);
void func_80097E80(int unused, struct Struct802BA1A0 *arg1);
void func_80098484(int unused, struct Struct802BA1A0 *arg1);
void func_80098B50(int arg0, struct Struct802BA1A0 *arg1);
void func_80098EB4(int arg0, struct Struct802BA1A0 *arg1);

void func_800972CC(void)
{
    struct Struct802BA1A0 sp8;

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_NORMAL:
    case GAMETYPE_MAIN_PRACTICE:
    case GAMETYPE_MINI_FIGHT:
    case GAMETYPE_MINI_BOWLING:
        if (decodedStageLzPtr->reflObjs != NULL || currStageId == ST_102_HITTER || currStageId == ST_103_AV_LOGO)
        {
            memset(&sp8, 0, sizeof(sp8));
            sp8.unk6 = 0xFFFF;
            func_8009544C(1, 5, &sp8);
        }
        else if (dynamicStageParts != NULL)
        {
            memset(&sp8, 0, sizeof(sp8));
            sp8.unk6 = 0xFFFF;
            func_8009544C(1, 6, &sp8);
        }
        break;
    }
}

void func_800973A0(struct Struct802BA1A0 *arg0)
{
    struct Struct800973A0 *temp_r3;
    size_t bufSize;
    struct StageReflObj *mirror;
    int i;
    struct GMAModel *mirrorModel;

    arg0->unk8 = 0x11;
    temp_r3 = OSAllocFromHeap(stageHeap, 0x64U);
    if (temp_r3 == NULL)
    {
        arg0->unk0 = 0;
        return;
    }
    arg0->unk10 = (void *)temp_r3;

    switch (backgroundInfo.bgId)
    {
    case BG_TYPE_SND:
        temp_r3->unk20 = 5U;
        temp_r3->unk28 = 0xA0U;
        temp_r3->unk2A = 0x70U;
        break;
    case BG_TYPE_ICE2:
        temp_r3->unk20 = 5U;
        temp_r3->unk28 = 0x140U;
        temp_r3->unk2A = 0xE0U;
        break;
    case BG_TYPE_MST:
        temp_r3->unk20 = 5;
        if (currStageId == ST_122_FAN_MASTER)
        {
            temp_r3->unk28 = 0x140U;
            temp_r3->unk2A = 0xE0U;
        }
        else
        {
            temp_r3->unk28 = 0x280U;
            temp_r3->unk2A = 0x1C0U;
        }
        break;
    case BG_TYPE_STM:
        if (currStageId == ST_089_COFFEE_CUP)
        {
            temp_r3->unk20 = 5U;
            temp_r3->unk28 = 0x140U;
            temp_r3->unk2A = 0xE0U;
        }
        else
        {
            temp_r3->unk20 = 6U;
            temp_r3->unk28 = 0x280U;
            temp_r3->unk2A = 0x1C0U;
        }
        break;
    case BG_TYPE_SPA:
        if (currStageId == ST_101_BLUR_BRIDGE
         || currStageId == ST_109_FACTORY
         || currStageId == ST_110_CURL_PIPE
         || currStageId == ST_113_DAA_LOO_MAA
         || currStageId == ST_145_FIGHT_SPACE)
        {
            temp_r3->unk20 = 5U;
            temp_r3->unk28 = 0x140U;
            temp_r3->unk2A = 0xE0U;
        }
        else
        {
            temp_r3->unk20 = 6U;
            temp_r3->unk28 = 0x280U;
            temp_r3->unk2A = 0x1C0U;
        }
        break;
    default:
        temp_r3->unk20 = 6U;
        temp_r3->unk28 = 0x280U;
        temp_r3->unk2A = 0x1C0U;
        break;
    }
    bufSize = GXGetTexBufferSize(temp_r3->unk28, temp_r3->unk2A, temp_r3->unk20, 0, 0);
    temp_r3->unk24 = OSAllocFromHeap(stageHeap, bufSize);
    if (temp_r3->unk24 == NULL)
    {
        OSFreeToHeap(stageHeap, temp_r3);
        arg0->unk0 = 0;
        return;
    }

    mirror = decodedStageLzPtr->reflObjs;
    for (i = 0; i < decodedStageLzPtr->reflObjsCount; i++, mirror++)
        mirror->model = stage_find_model(decodedStageGmaPtr, mirror->name);

    temp_r3->unk60 = 0xFF;
    mathutil_mtxA_from_identity();

    if (currStageId != 0x30)
    {
        mirrorModel = NULL;
        mirror = decodedStageLzPtr->reflObjs;
        //! BUG: forgot to increment mirror in this loop
        for (i = 0; i < decodedStageLzPtr->reflObjsCount; i++)
        {
            if (mirror->model != NULL)
            {
                mirrorModel = mirror->model;
                break;
            }
        }
        if (mirrorModel != NULL)
            mathutil_mtxA_translate_xyz(0.0f, mirrorModel->boundSphereCenter.y, 0.0f);
    }
    mathutil_mtxA_to_mtx(temp_r3->unk2C);
}

void func_80097664(struct Struct802BA1A0 *arg0)
{
    if (arg0->unk10 != NULL)
    {
        if (((struct Struct800973A0 *)arg0->unk10)->unk24 != NULL)
            OSFreeToHeap(stageHeap, ((struct Struct800973A0 *)arg0->unk10)->unk24);
        OSFreeToHeap(stageHeap, arg0->unk10);
    }
}

void func_800976B8(struct Struct802BA1A0 *arg0) {}

void func_800976BC(int arg0, struct Struct802BA1A0 *arg1)
{
    switch (arg0)
    {
    case 1:
        func_800976FC(arg0, arg1);
        return;
    case 16:
        func_80097E80(arg0, arg1);
        return;
    }
}

void func_800976FC(int unused, struct Struct802BA1A0 *arg1)
{
    struct Camera cameraBackup;
    struct Struct800973A0 *temp_r30;
    struct Camera *camera;

    if (lbl_801EEC90.unk0 & 0x20)
        return;

    camera_apply_viewport(modeCtrl.currPlayer);
    camera = currentCameraStructPtr;
    temp_r30 = (void *)arg1->unk10;
    cameraBackup = *camera;  // save camera
    push_light_group();
    switch (currStageId)
    {
    case ST_103_AV_LOGO:
        mathutil_mtxA_from_identity();
        mathutil_mtxA_translate(&animGroups[1].pos);
        mathutil_mtxA_rotate_z(animGroups[1].rot.z);
        mathutil_mtxA_rotate_y(animGroups[1].rot.y);
        mathutil_mtxA_rotate_x(animGroups[1].rot.x);
        mathutil_mtxA_to_mtx(temp_r30->unk2C);
        break;
    case ST_110_CURL_PIPE:
        mathutil_mtxA_from_identity();
        if (camera->eye.y >= -9.0)
            mathutil_mtxA_translate_xyz(0.0f, -9.0f, 0.0f);
        else
            mathutil_mtxA_translate_xyz(0.0f, -43.0f, 0.0f);
        mathutil_mtxA_to_mtx(temp_r30->unk2C);
        break;
    }

    {
        Vec basisI = {1, 0, 0};
        Vec basisJ = {0, 1, 0};
        Vec basisK = {0, 0, 1};
        Point3d origin = {0, 0, 0};
        Mtx spB0;
        Mtx sp80;
        Mtx sp50;
        Mtx44 projMtx;

        mathutil_mtxA_from_translate(&camera->eye);
        mathutil_mtxA_rotate_y(camera->rotY);
        mathutil_mtxA_rotate_x(camera->rotX);
        mathutil_mtxA_rotate_z(camera->rotZ);
        mathutil_mtxA_mult_right(mathutilData->mtxB);
        mathutil_mtxA_to_mtx(sp50);
        mathutil_mtxA_mult_right(temp_r30->unk2C);
        mathutil_mtxA_rigid_inv_tf_vec(&basisI, &basisI);
        mathutil_mtxA_rigid_inv_tf_vec(&basisJ, &basisJ);
        mathutil_mtxA_rigid_inv_tf_vec(&basisK, &basisK);
        mathutil_mtxA_rigid_inv_tf_point(&origin, &origin);
        basisI.y = -basisI.y;
        basisJ.y = -basisJ.y;
        basisK.y = -basisK.y;
        origin.y = -origin.y;
        mathutil_mtxA_tf_vec(&basisI, &basisI);
        mathutil_mtxA_tf_vec(&basisJ, &basisJ);
        mathutil_mtxA_tf_vec(&basisK, &basisK);
        mathutil_mtxA_tf_point(&origin, &origin);
        mathutilData->mtxA[0][0] = basisI.x;
        mathutilData->mtxA[1][0] = basisI.y;
        mathutilData->mtxA[2][0] = basisI.z;
        mathutilData->mtxA[0][1] = basisJ.x;
        mathutilData->mtxA[1][1] = basisJ.y;
        mathutilData->mtxA[2][1] = basisJ.z;
        mathutilData->mtxA[0][2] = basisK.x;
        mathutilData->mtxA[1][2] = basisK.y;
        mathutilData->mtxA[2][2] = basisK.z;
        mathutilData->mtxA[0][3] = origin.x;
        mathutilData->mtxA[1][3] = origin.y;
        mathutilData->mtxA[2][3] = origin.z;

        mathutil_mtxA_invert();
        mathutil_mtxA_to_mtx(sp80);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_scale_xyz(-1.0f, 1.0f, 1.0f);
        mathutil_mtxA_to_mtx(spB0);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_z(-camera->rotZ);
        mathutil_mtxA_rotate_x(-camera->rotX);
        mathutil_mtxA_rotate_y(-camera->rotY);
        mathutil_mtxA_translate_neg(&camera->eye);
        mathutil_mtxA_mult_right(sp80);
        mathutil_mtxA_mult_right(sp50);
        mathutil_mtxA_mult_left(spB0);
        mathutil_mtxA_to_mtx(camera->unk144);
        mathutil_mtxA_to_mtx(camera->unk174);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_z(-camera->rotZ);
        mathutil_mtxA_rotate_x(-camera->rotX);
        mathutil_mtxA_rotate_y(-camera->rotY);
        mathutil_mtxA_translate_neg(&camera->eye);
        mathutil_mtxA_mult_right(sp80);
        mathutil_mtxA_translate(&camera->eye);
        mathutil_mtxA_rotate_y(camera->rotY);
        mathutil_mtxA_rotate_x(camera->rotX);
        mathutil_mtxA_rotate_z(camera->rotZ);
        mathutil_mtxA_mult_right(lbl_802F1B3C->matrices[0]);
        mathutil_mtxA_mult_left(spB0);
        mathutil_mtxA_to_mtx(camera->unk1A4);
        mathutil_mtxA_to_mtx(camera->unk1D4);
        camera_apply_viewport(u_cameraId1);
        MTXPerspective(projMtx, 0.005493164f * camera->sub28.fov, camera->sub28.aspect, 0.1f, 20000.0f);
        projMtx[0][2] -= projMtx[0][0] * camera->sub28.unk28 * camera->sub28.aspect * camera->sub28.unk38;
        projMtx[1][2] -= projMtx[1][1] * camera->sub28.unk2C * camera->sub28.unk38;
        GXSetProjection(projMtx, GX_PERSPECTIVE);
        GXSetViewport(0.0f, 0.0f, temp_r30->unk28, temp_r30->unk2A, 0.0f, 1.0f);
        GXSetScissor(0, 0, temp_r30->unk28, temp_r30->unk2A);
        mathutil_mtxA_from_mtxB();
        load_light_group_uncached(5);
        lbl_801EEC90.unk0 |= 4;
        mathutil_mtxA_from_mtx(temp_r30->unk2C);
        mathutil_mtxA_get_translate_alt(&lbl_801EEC90.unk4);
        mathutil_mtxA_tf_vec_xyz(&lbl_801EEC90.unk10, 0.0f, 1.0f, 0.0f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_tf_point(&lbl_801EEC90.unk4, &lbl_801EEC90.unk1C);
        mathutil_mtxA_tf_vec(&lbl_801EEC90.unk10, &lbl_801EEC90.unk28);
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        mathutil_mtxA_rigid_invert();
        mathutil_mtxA_mult_right(mathutilData->mtxB);
        mathutil_mtxA_tf_point(&lbl_801EEC90.unk4, &lbl_801EEC90.unk34);
        mathutil_mtxA_tf_vec(&lbl_801EEC90.unk10, &lbl_801EEC90.unk40);
    }

    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
    {
        if (!(lbl_801EEC90.unk0 & 0x10))
            draw_monkey();
        if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
            stage_draw();
        if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
        {
            ord_tbl_set_depth_offset(400.0f);
            background_draw();
            ord_tbl_set_depth_offset(0.0f);
        }
        if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
            item_draw();
        if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
            stobj_draw();
        if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
            effect_draw();
        if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
            ball_draw();
        if (modeCtrl.gameType == GAMETYPE_MINI_BOWLING)
            func_80093B54();
        ord_tbl_draw_nodes();
    }
    else
        func_800A5F28();
    lbl_801EEC90.unk0 &= 0xFFFFFFFB;
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    GXSetTexCopySrc(0, 0, temp_r30->unk28, temp_r30->unk2A);
    GXSetTexCopyDst(temp_r30->unk28, temp_r30->unk2A, temp_r30->unk20, 0);
    GXCopyTex(temp_r30->unk24, 1);
    GXInitTexObj(&temp_r30->unk0, temp_r30->unk24, temp_r30->unk28, temp_r30->unk2A, temp_r30->unk20, GX_CLAMP, GX_CLAMP, 0U);
    *camera = cameraBackup;  // restore camera
    camera_apply_viewport(modeCtrl.currPlayer);
    pop_light_group();
    camera_apply_viewport(modeCtrl.currPlayer);
}

u32 lbl_8009825C();

void func_80097E80(int unused, struct Struct802BA1A0 *arg1)
{
    struct Struct800973A0 *temp_r31;
    f32 temp_f1;
    struct GMAModel *temp_r3_4;
    struct AnimGroupInfo *var_r31;
    struct DecodedStageLzPtr_child_child4 *var_r29;
    Func802F20F0 r28;
    int i;
    int j;
    GXColor color;
    Mtx sp84;
    Mtx sp54;
    Mtx44 projMtx;

    temp_r31 = (void *)arg1->unk10;
    GXSetChanCtrl(GX_ALPHA0, 0U, GX_SRC_VTX, GX_SRC_VTX, 0U, GX_DF_NONE, GX_AF_NONE);
    GXSetNumChans(1U);
    GXInvalidateTexAll();
    GXLoadTexObj_cached(&temp_r31->unk0, GX_TEXMAP0);
    color.a = temp_r31->unk60;
    GXSetTevKColor_cached(GX_KCOLOR0, color);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE0, GX_TEV_KASEL_K0_A);
    GXSetTexCoordGen2(GX_TEXCOORD0, GX_TG_MTX3x4, GX_TG_POS, 0x1EU, 0U, 0x7DU);
    MTXPerspective(projMtx, 0.005493164f * currentCameraStructPtr->sub28.fov, currentCameraStructPtr->sub28.aspect, 0.1f, 20000.0f);
    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][2] = 0.5 - 0.5 * (projMtx[0][0] * currentCameraStructPtr->sub28.unk28 * currentCameraStructPtr->sub28.aspect * currentCameraStructPtr->sub28.unk38);
    mathutilData->mtxA[1][2] = 0.5 - 0.5 * (projMtx[1][1] * currentCameraStructPtr->sub28.unk2C * currentCameraStructPtr->sub28.unk38);
    temp_f1 = 0.5f / mathutil_tan((int)(0.5 * currentCameraStructPtr->sub28.fov));
    mathutilData->mtxA[0][0] = temp_f1 / currentCameraStructPtr->sub28.aspect;
    mathutilData->mtxA[1][1] = temp_f1;
    mathutil_mtxA_to_mtx(sp54);
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_mult_right(temp_r31->unk2C);
    mathutil_mtxA_from_mtx(sp54);
    mathutil_mtxA_to_mtx(sp84);
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_mult_right(temp_r31->unk2C);
    mathutil_mtxA_mult_left(sp84);
    GXLoadTexMtxImm(mathutilData->mtxA, 0x1EU, GX_MTX3x4);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_KONST, GX_CA_RASA, GX_CA_ZERO);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetNumTevStages_cached(1U);
    GXSetNumTexGens(1U);
    GXSetNumIndStages(0U);
    GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    func_8009AC8C();
    r28 = u_avdisp_set_some_func_2(lbl_8009825C);

    var_r31 = animGroups;
    for (i = 0; i < animGroupCount; i++, var_r31++)
    {
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_mult_right(var_r31->transform);
        mathutil_mtxA_mult_left(sp84);
        GXLoadTexMtxImm(mathutilData->mtxA, 0x1EU, GX_MTX3x4);
        mathutil_mtxA_from_mtxB();
        if (i > 0)
            mathutil_mtxA_mult_right(var_r31->transform);
        GXLoadPosMtxImm(mathutilData->mtxA, 0U);

        var_r29 = decodedStageLzPtr->animGroups[i].unk90;
        for (j = 0; j < decodedStageLzPtr->animGroups[i].unk8C; j++, var_r29++)
        {
            if (var_r29->unk4 != NULL)
                avdisp_draw_model_unculled_sort_none(var_r29->unk4);
        }
    }
    u_avdisp_set_some_func_2(r28);
}

u32 lbl_8009825C()
{
    return 1;
}

int lbl_80098264()
{
    return 1;
}

struct Struct8009826C
{
    GXTexObj unk0;
    u32 unk20;
    u16 unk24;
    u16 unk26;
    void *unk28;
    Mtx unk2C;
    Mtx unk5C;
    u8 filler8C[4];
    u8 unk90;
    GXTexObj unk94;
    void *unkB4;
};  // size = 0xB8

void func_8009826C(struct Struct802BA1A0 *arg0)
{
    struct Struct8009826C *temp_r3;
    size_t bufSize;

    arg0->unk8 = 0x11;
    temp_r3 = OSAllocFromHeap(stageHeap, sizeof(*temp_r3));
    if (temp_r3 == NULL)
    {
        arg0->unk0 = 0;
        return;
    }
    memset(temp_r3, 0, sizeof(*temp_r3));
    arg0->unk10 = (void *)temp_r3;
    temp_r3->unk20 = 6U;
    temp_r3->unk24 = 0x280U;
    temp_r3->unk26 = 0xE0U;
    bufSize = GXGetTexBufferSize(temp_r3->unk24, temp_r3->unk26, temp_r3->unk20, 0U, 0U);
    temp_r3->unk28 = OSAllocFromHeap(stageHeap, bufSize);
    if (temp_r3->unk28 == NULL)
    {
        OSFreeToHeap(stageHeap, temp_r3);
        arg0->unk0 = 0;
        return;
    }
    bufSize = GXGetTexBufferSize(0x100U, 0x100U, 3U, 0U, 0U);
    temp_r3->unkB4 = OSAllocFromHeap(stageHeap, bufSize);
    if (temp_r3->unkB4 == NULL)
    {
        OSFreeToHeap(stageHeap, temp_r3->unk28);
        OSFreeToHeap(stageHeap, temp_r3);
        arg0->unk0 = 0;
        return;
    }
    temp_r3->unk90 = 0x60;
}

void func_800983A0(struct Struct802BA1A0 *arg0)
{
    struct Struct8009826C *temp_r3 = (void *)arg0->unk10;

    if (temp_r3 != NULL)
    {
        if (temp_r3->unk28 != NULL)
            OSFreeToHeap(stageHeap, temp_r3->unk28);
        if (((struct Struct8009826C *)arg0->unk10)->unkB4 != NULL)
            OSFreeToHeap(stageHeap, ((struct Struct8009826C *)arg0->unk10)->unkB4);
        OSFreeToHeap(stageHeap, arg0->unk10);
    }
}

void func_8009840C(struct Struct802BA1A0 *arg0) {}

void func_80098410(int arg0, struct Struct802BA1A0 *arg1)
{
    switch (arg0)
    {
    case 1:
        func_80098484(arg0, arg1);
        func_80098B50(arg0, arg1);
        return;
    case 16:
        func_80098EB4(arg0, arg1);
        return;
    }
}

void func_80098484(int unused, struct Struct802BA1A0 *arg1)
{
    struct Camera cameraBackup;
    struct Struct8009826C *temp_r30;
    struct Camera *camera;

    camera_apply_viewport(modeCtrl.currPlayer);
    light_main();
    temp_r30 = (void *)arg1->unk10;
    camera = currentCameraStructPtr;
    cameraBackup = *camera;  // save camera
    push_light_group();

    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate_xyz(0.0f, 0.02f, 0.0f);
    mathutil_mtxA_to_mtx(temp_r30->unk2C);
    mathutil_mtxA_to_mtx(temp_r30->unk5C);

    {
        Vec basisI = {1, 0, 0};
        Vec basisJ = {0, 1, 0};
        Vec basisK = {0, 0, 1};
        Point3d origin = {0, 0, 0};
        Mtx spB0;
        Mtx sp80;
        Mtx sp50;
        Mtx44 projMtx;

        mathutil_mtxA_from_translate(&camera->eye);
        mathutil_mtxA_rotate_y(camera->rotY);
        mathutil_mtxA_rotate_x(camera->rotX);
        mathutil_mtxA_rotate_z(camera->rotZ);
        mathutil_mtxA_mult_right(mathutilData->mtxB);
        mathutil_mtxA_to_mtx(sp50);
        mathutil_mtxA_mult_right(temp_r30->unk2C);
        mathutil_mtxA_rigid_inv_tf_vec(&basisI, &basisI);
        mathutil_mtxA_rigid_inv_tf_vec(&basisJ, &basisJ);
        mathutil_mtxA_rigid_inv_tf_vec(&basisK, &basisK);
        mathutil_mtxA_rigid_inv_tf_point(&origin, &origin);
        basisI.y = -basisI.y;
        basisJ.y = -basisJ.y;
        basisK.y = -basisK.y;
        origin.y = -origin.y;
        mathutil_mtxA_tf_vec(&basisI, &basisI);
        mathutil_mtxA_tf_vec(&basisJ, &basisJ);
        mathutil_mtxA_tf_vec(&basisK, &basisK);
        mathutil_mtxA_tf_point(&origin, &origin);
        mathutilData->mtxA[0][0] = basisI.x;
        mathutilData->mtxA[1][0] = basisI.y;
        mathutilData->mtxA[2][0] = basisI.z;
        mathutilData->mtxA[0][1] = basisJ.x;
        mathutilData->mtxA[1][1] = basisJ.y;
        mathutilData->mtxA[2][1] = basisJ.z;
        mathutilData->mtxA[0][2] = basisK.x;
        mathutilData->mtxA[1][2] = basisK.y;
        mathutilData->mtxA[2][2] = basisK.z;
        mathutilData->mtxA[0][3] = origin.x;
        mathutilData->mtxA[1][3] = origin.y;
        mathutilData->mtxA[2][3] = origin.z;

        mathutil_mtxA_invert();
        mathutil_mtxA_to_mtx(sp80);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_scale_xyz(-1.0f, 1.0f, 1.0f);
        mathutil_mtxA_to_mtx(spB0);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_z(-camera->rotZ);
        mathutil_mtxA_rotate_x(-camera->rotX);
        mathutil_mtxA_rotate_y(-camera->rotY);
        mathutil_mtxA_translate_neg(&camera->eye);
        mathutil_mtxA_mult_right(sp80);
        mathutil_mtxA_mult_right(sp50);
        mathutil_mtxA_mult_left(spB0);
        mathutil_mtxA_to_mtx(camera->unk144);
        mathutil_mtxA_to_mtx(camera->unk174);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_z(-camera->rotZ);
        mathutil_mtxA_rotate_x(-camera->rotX);
        mathutil_mtxA_rotate_y(-camera->rotY);
        mathutil_mtxA_translate_neg(&camera->eye);
        mathutil_mtxA_mult_right(sp80);
        mathutil_mtxA_mult_right(sp50);
        mathutil_mtxA_mult_left(spB0);
        mathutil_mtxA_to_mtx(camera->unk1A4);
        mathutil_mtxA_to_mtx(camera->unk1D4);
        camera_apply_viewport(modeCtrl.currPlayer);
        MTXPerspective(projMtx, 0.005493164f * camera->sub28.fov, camera->sub28.aspect, 0.1f, 20000.0f);
        projMtx[0][2] -= projMtx[0][0] * camera->sub28.unk28 * camera->sub28.aspect * camera->sub28.unk38;
        projMtx[1][2] -= projMtx[1][1] * camera->sub28.unk2C * camera->sub28.unk38;
        GXSetProjection(projMtx, GX_PERSPECTIVE);
        GXSetViewport(0.0f, 0.0f, temp_r30->unk24, temp_r30->unk26, 0.0f, 1.0f);
        GXSetScissor(0, 0, temp_r30->unk24, temp_r30->unk26);
        mathutil_mtxA_from_mtxB();
        load_light_group_uncached(5);
        lbl_801EEC90.unk0 |= 4;
        mathutil_mtxA_from_mtx(temp_r30->unk2C);
        mathutil_mtxA_get_translate_alt(&lbl_801EEC90.unk4);
        mathutil_mtxA_tf_vec_xyz(&lbl_801EEC90.unk10, 0.0f, 1.0f, 0.0f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_tf_point(&lbl_801EEC90.unk4, &lbl_801EEC90.unk1C);
        mathutil_mtxA_tf_vec(&lbl_801EEC90.unk10, &lbl_801EEC90.unk28);
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        mathutil_mtxA_rigid_invert();
        mathutil_mtxA_mult_right(mathutilData->mtxB);
        mathutil_mtxA_tf_point(&lbl_801EEC90.unk4, &lbl_801EEC90.unk34);
        mathutil_mtxA_tf_vec(&lbl_801EEC90.unk10, &lbl_801EEC90.unk40);
    }

    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
    {
        if (!(lbl_801EEC90.unk0 & 0x10))
            draw_monkey();
        if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
            stage_draw();
        if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
        {
            ord_tbl_set_depth_offset(400.0f);
            background_draw();
            ord_tbl_set_depth_offset(0.0f);
        }
        if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
            item_draw();
        if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
            stobj_draw();
        if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
            effect_draw();
        if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
            ball_draw();
        ord_tbl_draw_nodes();
    }
    else
        func_800A5F28();
    lbl_801EEC90.unk0 &= 0xFFFFFFFB;
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    GXSetTexCopySrc(0, 0, temp_r30->unk24, temp_r30->unk26);
    GXSetTexCopyDst(temp_r30->unk24, temp_r30->unk26, temp_r30->unk20, 0);
    GXCopyTex(temp_r30->unk28, 1);
    GXInitTexObj(&temp_r30->unk0, temp_r30->unk28, temp_r30->unk24, temp_r30->unk26, temp_r30->unk20, GX_CLAMP, GX_CLAMP, 0U);
    *camera = cameraBackup;  // restore camera
    camera_apply_viewport(modeCtrl.currPlayer);
    pop_light_group();
}

void func_80098B50(int arg0, struct Struct802BA1A0 *arg1)
{
    struct DynamicStagePart *var_r29;
    struct Struct8009826C *temp_r31;
    Mtx sp10;

    temp_r31 = (void *)arg1->unk10;
    func_8009AC0C(0);
    GXSetViewport(0.0f, 0.0f, 256.0f, 256.0f, 0.0f, 1.0f);
    GXSetScissor(0U, 0U, 0x100U, 0x100U);
    GXLoadTexObj_cached(&commonGma->modelEntries[0x59].model->texObjs[0], GX_TEXMAP0);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE0, GX_TEV_KASEL_1);
    GXSetTexCoordGen2(GX_TEXCOORD0, GX_TG_MTX3x4, GX_TG_NRM, 0x3CU, 1U, 0x40U);
    mathutil_mtxA_from_translate_xyz(0.5f, 0.5f, 1.0f);
    mathutil_mtxA_to_mtx(sp10);
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_set_translate_xyz(0.0f, 0.0f, 0.0f);
    mathutil_mtxA_mult_left(sp10);
    mathutil_mtxA_scale_xyz(1.0f, 0.0f, 1.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, 0x40U, GX_MTX3x4);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetNumTevStages_cached(1U);
    GXSetNumTexGens(1U);
    GXSetNumIndStages(0U);
    GXSetBlendMode_cached(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    GXSetCullMode_cached(GX_CULL_BACK);
    if (dynamicStageParts != NULL)
    {
        mathutil_mtxA_from_mtxB();
        GXLoadPosMtxImm(mathutilData->mtxA, 0U);
        nl2ngc_set_scale(1.0f);
        var_r29 = dynamicStageParts;
        while (var_r29->modelName != NULL)
        {
            u_nl2ngc_draw_model_with_mesh_func(var_r29->tempModel, lbl_80098264);
            var_r29++;
        }
    }
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    GXSetTexCopySrc(0, 0, 0x100, 0x100);
    GXSetTexCopyDst(0x100, 0x100, 0x2C, 0);
    GXCopyTex(temp_r31->unkB4, 1);
    GXInitTexObj(&temp_r31->unk94, temp_r31->unkB4, 0x100U, 0x100U, GX_TF_IA8, GX_CLAMP, GX_CLAMP, 0U);
    GXInitTexObjLOD(&temp_r31->unk94, GX_LINEAR, GX_LINEAR, 0.0f, 10.0f, 0.0f, 0U, 0U, GX_ANISO_1);
    func_8009AC44();
    camera_apply_viewport(modeCtrl.currPlayer);
}

void func_80098EB4(int arg0, struct Struct802BA1A0 *arg1)
{
    GXColor color;
    Mtx spA4;
    Mtx sp74;
    Mtx44 projMtx;
    f32 sp1C[2][3];
    struct Struct8009826C *temp_r31;
    f32 temp_f1;
    int var_r3;
    struct DynamicStagePart *var_r30;

    temp_r31 = (void *)arg1->unk10;
    GXSetNumChans(0U);
    GXInvalidateTexAll();
    GXLoadTexObj_cached(&temp_r31->unk0, GX_TEXMAP0);
    GXLoadTexObj_cached(&temp_r31->unk94, GX_TEXMAP1);
    color.a = temp_r31->unk90;
    GXSetTevKColor_cached(GX_KCOLOR0, color);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE0, GX_TEV_KASEL_K0_A);
    GXSetTexCoordGen2(GX_TEXCOORD0, GX_TG_MTX3x4, GX_TG_POS, 0x1EU, 0U, 0x7DU);
    GXSetTexCoordGen2(GX_TEXCOORD1, GX_TG_MTX3x4, GX_TG_POS, 0x21U, 0U, 0x7DU);
    C_MTXPerspective(projMtx, 0.005493164f * currentCameraStructPtr->sub28.fov, currentCameraStructPtr->sub28.aspect, 0.1f, 20000.0f);
    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][2] = 0.5 - 0.5 * (projMtx[0][0] * currentCameraStructPtr->sub28.unk28 * currentCameraStructPtr->sub28.aspect * currentCameraStructPtr->sub28.unk38);
    mathutilData->mtxA[1][2] = 0.5 - 0.5 * (projMtx[1][1] * currentCameraStructPtr->sub28.unk2C * currentCameraStructPtr->sub28.unk38);
    temp_f1 = 0.5f / mathutil_tan((int)(0.5 * currentCameraStructPtr->sub28.fov));
    mathutilData->mtxA[0][0] = temp_f1 / currentCameraStructPtr->sub28.aspect;
    mathutilData->mtxA[1][1] = temp_f1;
    mathutil_mtxA_to_mtx(sp74);
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_mult_right(temp_r31->unk5C);
    mathutil_mtxA_from_mtx(sp74);
    mathutil_mtxA_to_mtx(spA4);
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_mult_right(temp_r31->unk5C);
    mathutil_mtxA_mult_left(spA4);
    GXLoadTexMtxImm(mathutilData->mtxA, 0x1EU, GX_MTX3x4);
    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][0] = -0.5f * currentCameraStructPtr->sub28.unk3C * (1.0f / currentCameraStructPtr->sub28.aspect);
    mathutilData->mtxA[0][2] = 0.5f + (-0.5f * currentCameraStructPtr->sub28.unk28);
    mathutilData->mtxA[1][1] = 0.5f * currentCameraStructPtr->sub28.unk3C;
    mathutilData->mtxA[1][2] = 0.5f + (-0.5f * currentCameraStructPtr->sub28.unk2C);
    mathutil_mtxA_mult_right(mathutilData->mtxB);
    GXLoadTexMtxImm(mathutilData->mtxA, 0x21U, GX_MTX3x4);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    var_r3 = 0;
    sp1C[0][0] = 0.0f;
    sp1C[0][1] = 1.6f;
    sp1C[0][2] = 0.0f;
    sp1C[1][0] = 1.2f;
    sp1C[1][1] = 0.0f;
    sp1C[1][2] = 0.0f;
    if (__fabs(sp1C[0][1]) > __fabs(sp1C[1][0]))
    {
        while (__fabs(sp1C[0][1]) >= 1.0)
        {
            var_r3 += 1;
            sp1C[0][1] *= 0.5f;
            sp1C[1][0] *= 0.5f;
        }
    }
    else
    {
        while (__fabs(sp1C[1][0]) >= 1.0)
        {
            var_r3 += 1;
            sp1C[0][1] *= 0.5f;
            sp1C[1][0] *= 0.5f;
        }
    }
    GXSetIndTexMtx(GX_ITM_0, sp1C, var_r3);
    GXSetIndTexOrder(GX_INDTEXSTAGE0, GX_TEXCOORD1, GX_TEXMAP1);
    GXSetTevIndirect(GX_TEVSTAGE0, GX_INDTEXSTAGE0, GX_ITF_8, GX_ITB_STU, GX_ITM_0, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
    GXSetNumTevStages_cached(1U);
    GXSetNumTexGens(2U);
    GXSetNumIndStages(1U);
    GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    func_8009AC8C();
    if (dynamicStageParts != NULL)
    {
        mathutil_mtxA_from_mtxB();
        GXLoadPosMtxImm(mathutilData->mtxA, 0U);
        var_r30 = dynamicStageParts;
        while (var_r30->modelName != NULL)
        {
            u_nl2ngc_draw_model_with_mesh_func(var_r30->tempModel, &lbl_80098264);
            var_r30++;
        }
    }
}

