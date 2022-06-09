#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "event.h"
#include "gxcache.h"
#include "item.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
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
