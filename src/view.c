/**
 * view.c - Implements the "View Stage" feature
 */
#include <stddef.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "gxutil.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "stage.h"

#include "../data/common.gma.h"

struct StageViewInfo
{
    Vec unk0;
    Vec unkC;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    float unk20;
    float unk24;
    Vec unk28;
    float unk34;
    s16 unk38;
    s16 unk3A;
    s16 unk3C;
    s16 unk3E;
    float unk40;
    struct MovableStagePart *unk44;
    float unk48;
};  // size = 0x4C

extern struct StageViewInfo *stageViewInfo;

void ev_view_init(void)
{
    stageViewInfo = OSAlloc(sizeof(*stageViewInfo));
    if (stageViewInfo == NULL)
        OSPanic("view.c", 0x72, "cannot OSAlloc\n");
    memset(stageViewInfo, 0, sizeof(*stageViewInfo));
    func_800A7020(&stageViewInfo->unk28);
    stageViewInfo->unk20 = stageViewInfo->unk34 * 1.1313;
    stageViewInfo->unk24 = 0.75f;
    stageViewInfo->unk38 = -5632;
    stageViewInfo->unk3A = 0;
    if (movableStagePartCount > 0)
    {
        stageViewInfo->unk44 = OSAlloc(72 * sizeof(*stageViewInfo->unk44));
        if (stageViewInfo->unk44 == NULL)
            OSPanic("view.c", 0x7E, "cannot OSAlloc\n");
        memcpy(stageViewInfo->unk44, movableStageParts, 72 * sizeof(*stageViewInfo->unk44));
    }
    if (modeCtrl.unk28 == 1)
        camera_setup_singleplayer_viewport();
    func_800A6200();
    func_800A66E4();
    func_800A60AC();
}

void ev_view_main(void)
{
    Vec sp8;
    s8 cstickY, cstickX;

    func_800A6318();
    func_800A66FC();
    stageViewInfo->unk3A += controllerInfo[lbl_801EEC68.unk14].unk0[0].stickX * 5;
    stageViewInfo->unk24 -= controllerInfo[lbl_801EEC68.unk14].unk0[0].stickY * 0.0003;
    if (stageViewInfo->unk24 > 1.0)
        stageViewInfo->unk24 = 1.0f;
    else if (stageViewInfo->unk24 < 0.5)
        stageViewInfo->unk24 = 0.5f;
    cstickY = controllerInfo[lbl_801EEC68.unk14].unk0[0].substickY;
    cstickX = controllerInfo[lbl_801EEC68.unk14].unk0[0].substickX;
    stageViewInfo->unk3C += (cstickY * 64 - stageViewInfo->unk3C) >> 5;
    stageViewInfo->unk3E += (-cstickX * 0xC0 - stageViewInfo->unk3E) >> 5;
    mathutil_mtxA_from_translate(&stageViewInfo->unk28);
    mathutil_mtxA_rotate_y(stageViewInfo->unk3A);
    mathutil_mtxA_rotate_x(stageViewInfo->unk38);
    mathutil_mtxA_translate_xyz(0.0f, 0.0f, stageViewInfo->unk20 * stageViewInfo->unk24);
    mathutil_mtxA_rotate_x(-stageViewInfo->unk38);
    mathutil_mtxA_rotate_y(stageViewInfo->unk3E);
    mathutil_mtxA_rotate_x(stageViewInfo->unk38);
    mathutil_mtxA_rotate_x(stageViewInfo->unk3C);
    mathutil_mtxA_tf_point_xyz(&stageViewInfo->unk0, 0.0f, 0.0f, 0.0f);  // why?
    mathutil_mtxA_tf_point_xyz(&stageViewInfo->unkC, 0.0f, 0.0f, -10.0f);

    sp8.x = stageViewInfo->unkC.x - stageViewInfo->unk0.x;
    sp8.y = stageViewInfo->unkC.y - stageViewInfo->unk0.y;
    sp8.z = stageViewInfo->unkC.z - stageViewInfo->unk0.z;
    stageViewInfo->unk1A = mathutil_atan2(sp8.x, sp8.z) - 32768;
    stageViewInfo->unk18 = mathutil_atan2(sp8.y, mathutil_sqrt(mathutil_sum_of_sq(sp8.x, sp8.z)));
    stageViewInfo->unk1C = 0;
    stageViewInfo->unk1E++;
    unpausedFrameCounter++;
}

void ev_view_dest(void)
{
    func_800A66CC();
    func_800A671C();
    func_800A61DC();
    if (stageViewInfo != NULL)
    {
        if (stageViewInfo->unk44 != NULL)
        {
            memcpy(movableStageParts, stageViewInfo->unk44, 72 * sizeof(*stageViewInfo->unk44));
            OSFree(stageViewInfo->unk44);
        }
        OSFree(stageViewInfo);
        stageViewInfo = NULL;
    }
    if (modeCtrl.unk28 == 1)
    {
        if (modeCtrl.unk28 == 1 && modeCtrl.playerCount == 3)
        {
            switch (modeCtrl.unk42)
            {
            default:
            case 0:
                camera_setup_splitscreen_viewports(3);
                break;
            case 1:
                setup_camera_viewport(0, 0.0f, 0.5f, 0.5f, 0.5f);
                setup_camera_viewport(1, 0.0f, 0.0f, 1.0f, 0.5f);
                setup_camera_viewport(2, 0.5f, 0.5f, 0.5f, 0.5f);
                setup_camera_viewport(3, 0.0f, 0.0f, 0.0f, 0.0f);
                break;
            case 2:
                setup_camera_viewport(0, 0.0f, 0.0f, 0.5f, 0.5f);
                setup_camera_viewport(1, 0.5f, 0.0f, 0.5f, 0.5f);
                setup_camera_viewport(2, 0.0f, 0.5f, 1.0f, 0.5f);
                setup_camera_viewport(3, 0.0f, 0.0f, 0.0f, 0.0f);
                break;
            case 3:
                camera_setup_splitscreen_viewports(4);
                break;
            }
        }
        else
            camera_setup_splitscreen_viewports(modeCtrl.playerCount);
    }
}

void func_800A5CA0(void)
{
    struct Camera *camera;
    struct Ball *ballBackup;
    struct Camera cameraBackup = cameraInfo[modeCtrl.unk2C];
    u8 dummy[16];
    Mtx projMtx;
    camera = &cameraInfo[modeCtrl.unk2C];

    lbl_801EEC90.unk0 |= 2;
    func_800A7084(camera);
    C_MTXPerspective(projMtx, 59.996337890625f, 1.3333333730697632f, 0.1f, 20000.0f);
    GXSetProjection(projMtx, 0);

    {
        S16Vec sp8 = {0};
        sp8.x = stageViewInfo->unk18;
        sp8.y = stageViewInfo->unk1A;
        sp8.z = stageViewInfo->unk1C;
        func_80020AB8(&stageViewInfo->unk0, &sp8, 59.996337890625f, 1.3333333730697632f, 0.0f, 0.0f);
    }

    func_80021ECC();
    ballBackup = currentBallStructPtr;
    currentBallStructPtr = &ballInfo[0];
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(1);
    func_800A7084(camera);
    func_80092D3C();
    func_80054FF0();
    func_800225C0(0);
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(4);
    func_800A7084(camera);
    if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == 4)
        func_800A6A88();
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
        func_800A6874();
    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
    {
        ord_tbl_set_depth_offset(400.0f);
        background_draw();
        ord_tbl_set_depth_offset(0.0f);
    }
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(16);
    func_800A7084(camera);
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
        func_800A6734();
    if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
        func_800A6BF0();
    ord_tbl_draw_nodes();
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(8);
    func_800A7084(camera);
    currentBallStructPtr = ballBackup;
    func_80017FCC();
    lbl_801EEC90.unk0 &= ~(1 << 1);
    cameraInfo[modeCtrl.unk2C] = cameraBackup;
}

void func_800A5F28(void)
{
    if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == 4)
        func_800A6A88();
    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
    {
        ord_tbl_set_depth_offset(400.0f);
        background_draw();
        ord_tbl_set_depth_offset(0.0f);
    }
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
        func_800A6734();
    if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
        func_800A6BF0();
    ord_tbl_draw_nodes();
}

void lbl_800A5FC4(struct Sprite *sprite)
{
    func_80071A8C();
    func_80071AD4(sprite->fontId);
    func_80071B2C(sprite->unk40, sprite->unk44);
    func_80071B50(sprite->unk74);
    func_80071B1C(sprite->unk4C + 0.1);
    func_80071AE4(0);
    func_80071AF8(0);
    func_80071B60(sprite->centerX + 2.0, sprite->centerY + 2.0);
    func_80071E58(sprite->text);
    func_80071B1C(sprite->unk4C);
    func_80071AE4((sprite->unkC << 16) | (sprite->unkD << 8) | sprite->unkE);
    func_80071AF8((sprite->unk70 << 16) | (sprite->unk71 << 8) | sprite->unk72);
    func_80071B60(sprite->centerX, sprite->centerY);
    func_80071E58(sprite->text);
}

void func_800A60AC(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->unkF = 100;
        sprite->centerX = 24.0f;
        sprite->centerY = 24.0f;
        sprite->textAlign = 0;
        sprite->fontId = 0xB3;
        sprite->unk74 |= 0x200000;
        sprite->unk38 = lbl_800A5FC4;
        strcpy(sprite->text, "a/Stage Overview");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->unkF = 100;
        sprite->centerX = 170.0f;
        sprite->centerY = 435.0f;
        sprite->textAlign = 8;
        sprite->fontId = 0xB3;
        sprite->unk74 |= 0x200000;
        sprite->unk38 = lbl_800A5FC4;
        strcpy(sprite->text, "p/LEVER/a/Rotate/Zoom");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->unkF = 100;
        sprite->centerX = 415.0f;
        sprite->centerY = 435.0f;
        sprite->textAlign = 8;
        sprite->fontId = 0xB3;
        sprite->unk74 |= 0x200000;
        sprite->unk38 = lbl_800A5FC4;
        strcpy(sprite->text, "p/BUTTON_C/a/Pan camera");
    }
}

void func_800A61DC(void)
{
    g_dest_sprite_with_font(100);
}

void func_800A6200(void)
{
    struct MovableStagePart *movpart;
    struct StageCollHdr *r30;
    int i;

    stageViewInfo->unk40 = lbl_80206DEC.unk4;
    movpart = movableStageParts;
    r30 = decodedStageLzPtr->collHdrs;
    for (i = 0; i < 72; i++, movpart++, r30++)
    {
        movpart->unk0.x = r30->unk0.x;
        movpart->unk0.y = r30->unk0.y;
        movpart->unk0.z = r30->unk0.z;

        movpart->unkC.x = r30->unk0.x - r30->unkB8.x;
        movpart->unkC.y = r30->unk0.y - r30->unkB8.y;
        movpart->unkC.z = r30->unk0.z - r30->unkB8.z;

        movpart->unk18 = r30->initXRot;
        movpart->unk1A = r30->initYRot;
        movpart->unk1C = r30->initZRot;

        movpart->unk1E = r30->initXRot;
        movpart->unk20 = r30->initYRot;
        movpart->unk22 = r30->initZRot;

        mathutil_mtxA_from_identity();
        mathutil_mtxA_to_mtx(movpart->unk24);
        mathutil_mtxA_translate_neg(&r30->unkB8);
        mathutil_mtxA_to_mtx(movpart->unk54);
    }
    if (currStageId == ST_101_BLUR_BRIDGE)
        find_blur_bridge_accordion();
}

void func_800A6318(void)
{
    float t;
    float f3;
    struct MovableStagePart *movpart;
    struct StageCollHdr *r30;
    int i;

    lbl_80206DEC.unk4 = stageViewInfo->unk1E;
    t = stageViewInfo->unk1E / 60.0;
    t += decodedStageLzPtr->unk0;
    f3 = (float)(decodedStageLzPtr->unk4 - decodedStageLzPtr->unk0);
    t -= f3 * mathutil_floor(t / f3);
    t += decodedStageLzPtr->unk0;
    r30 = decodedStageLzPtr->collHdrs;
    movpart = movableStageParts;
    for (i = 0; i < decodedStageLzPtr->collHdrsCount; i++, movpart++, r30++)
    {
        struct StageAnimHdr *r28 = r30->animHdr;

        if (r28 == NULL2)
            continue;

        if (r28->xRotFrames != NULL2)
        {
            movpart->unk1E = movpart->unk18;
            movpart->unk18 = DEGREES_TO_S16(g_interpolate_anim(r28->xRotFramesCount, r28->xRotFrames, t));
        }
        if (r28->yRotFrames != NULL2)
        {
            movpart->unk20 = movpart->unk1A;
            movpart->unk1A = DEGREES_TO_S16(g_interpolate_anim(r28->yRotFramesCount, r28->yRotFrames, t));
        }
        if (r28->zRotFrames != NULL2)
        {
            movpart->unk22 = movpart->unk1C;
            movpart->unk1C = DEGREES_TO_S16(g_interpolate_anim(r28->zRotFramesCount, r28->zRotFrames, t));
        }

        if (r28->xTrnslFrames != NULL2)
        {
            movpart->unkC.x = movpart->unk0.x - r30->unkB8.x;
            movpart->unk0.x = g_interpolate_anim(r28->xTrnslFramesCount, r28->xTrnslFrames, t);
        }
        if (r28->yTrnslFrames != NULL2)
        {
            movpart->unkC.y = movpart->unk0.y - r30->unkB8.y;
            movpart->unk0.y = g_interpolate_anim(r28->yTrnslFramesCount, r28->yTrnslFrames, t);
        }
        if (r28->zTrnslFrames != NULL2)
        {
            movpart->unkC.z = movpart->unk0.z - r30->unkB8.z;
            movpart->unk0.z = g_interpolate_anim(r28->zTrnslFramesCount, r28->zTrnslFrames, t);
        }

        mathutil_mtxA_from_translate(&movpart->unk0);
        mathutil_mtxA_rotate_z(movpart->unk1C);
        mathutil_mtxA_rotate_y(movpart->unk1A);
        mathutil_mtxA_rotate_x(movpart->unk18 - r30->initXRot);
        mathutil_mtxA_rotate_y(-r30->initYRot);
        mathutil_mtxA_rotate_z(-r30->initZRot);
        mathutil_mtxA_translate_neg(&r30->unk0);
        mathutil_mtxA_to_mtx(movpart->unk24);

        mathutil_mtxA_from_translate(&movpart->unkC);
        mathutil_mtxA_rotate_z(movpart->unk22);
        mathutil_mtxA_rotate_y(movpart->unk20);
        mathutil_mtxA_rotate_x(movpart->unk1E - r30->initXRot);
        mathutil_mtxA_rotate_y(-r30->initYRot);
        mathutil_mtxA_rotate_z(-r30->initZRot);
        mathutil_mtxA_translate_neg(&r30->unk0);
        mathutil_mtxA_to_mtx(movpart->unk54);
    }

    // Warp vertices for dynamic stage parts
    if (dynamicStageParts != NULL)
    {
        struct DynamicStagePart *dyn = dynamicStageParts;
        while (dyn->modelName != NULL)
        {
            memcpy(dyn->tempModel, dyn->origModel, NLMODEL_HEADER(dyn->origModel)->unk4->modelSize);
            g_apply_func_to_naomi_model_vertices(dyn->tempModel, dyn->posNrmTexFunc, dyn->posColorTexFunc);
            dyn++;
        }
    }
}

void func_800A66CC(void)
{
    lbl_80206DEC.unk4 = stageViewInfo->unk40;
}

void func_800A66E4(void)
{
    stageViewInfo->unk48 = backgroundInfo.unk4;
}

void func_800A66FC(void)
{
    backgroundInfo.unk4 += 1.0;
}

void func_800A671C(void)
{
    backgroundInfo.unk4 = stageViewInfo->unk48;
}

void func_800A6734(void)
{
    int i;

    s32 sp10[2] = { 0x400, 0x300 };

    if (modeCtrl.unk28 != 1 || func_800672D0(currStageId) != 0 || (modeCtrl.levelSetFlags & (1<<(31-0x13))))
    {
        struct GMAModelHeader *models[2];

        models[0] = commonGma->modelEntries[OBJ_BANANA_01_LOD150].modelOffset;
        models[1] = commonGma->modelEntries[OBJ_BANANA_02_LOD100].modelOffset;
        for (i = 0; i < movableStagePartCount; i++)
        {
            struct StageCollHdr_child3 *r24 = decodedStageLzPtr->collHdrs[i].unk60;
            int r23 = decodedStageLzPtr->collHdrs[i].unk5C;
            int j;

            for (j = 0; j < r23; j++, r24++)
            {
                mathutil_mtxA_from_mtx(movableStageParts[i].unk24);
                mathutil_mtxA_translate(&r24->unk0);
                mathutil_mtxA_sq_from_identity();
                mathutil_mtxA_rotate_y(stageViewInfo->unk1E * sp10[r24->unkC]);
                mathutil_mtxA_mult_left(mathutilData->mtxB);
                g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
                g_avdisp_maybe_draw_model_1(models[r24->unkC]);
            }
        }
    }
}

void func_800A6874(void)
{
    struct StageCollHdr_child3 *r26;
    int i;
    int r25;
    int j;
    struct Struct8003FB48 sp60;
    Quaternion sp50;
    Mtx sp20;
    Vec sp14;
    Vec sp8 = { 0, 0, -1 };

    if ((modeCtrl.unk28 != 1 || func_800672D0(currStageId) != 0 || (modeCtrl.levelSetFlags & (1<<(31-0x13))))
     && decodedStageLzPtr->bananasCount > 0)
    {
        g_avdisp_set_some_color_1(0.3f, 0.3f, 0.3f, 0.3f);
        avdisp_set_z_mode(1, 3, 0);

        for (i = 0; i < movableStagePartCount; i++)
        {
            r26 = decodedStageLzPtr->collHdrs[i].unk60;
            r25 = decodedStageLzPtr->collHdrs[i].unk5C;

            for (j = 0; j < r25; j++, r26++)
            {
                mathutil_mtxA_from_mtx(movableStageParts[i].unk24);
                mathutil_mtxA_tf_point(&r26->unk0, &sp14);
                if ((u32)func_8003FB48(&sp14, &sp60, 0) != 0)
                {
                    mathutil_mtxA_from_mtx(mathutilData->mtxB);
                    sp14.x = sp60.unk4.x + sp60.unk10.x * 0.02;
                    sp14.y = sp60.unk4.y + sp60.unk10.y * 0.02;
                    sp14.z = sp60.unk4.z + sp60.unk10.z * 0.02;
                    mathutil_mtxA_translate(&sp14);
                    mathutil_mtxA_to_mtx(sp20);
                    mathutil_quat_from_dirs(&sp50, &sp8, &sp60.unk10);
                    mathutil_mtxA_from_quat(&sp50);
                    mathutil_mtxA_mult_left(sp20);
                    mathutil_mtxA_scale_s(0.45f);
                    g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
                    g_avdisp_maybe_draw_model_1(commonGma->modelEntries[0x4E].modelOffset);
                }
            }
        }
        g_avdisp_set_some_color_1(1.0f, 1.0f, 1.0f, 1.0f);
        avdisp_set_z_mode(1, 3, 1);
    }
}

/*
const double lbl_802F5B80 = 1.1313;
const float lbl_802F5B88 = 0.75f;
const double lbl_802F5B90 = 0.00029999999999999997;
const double lbl_802F5B98 = 1;
const float lbl_802F5BA0 = 1f;
const double lbl_802F5BA8 = 0.5;
const float lbl_802F5BB0 = 0.5f;
const float lbl_802F5BB4 = 0f;
const float lbl_802F5BB8 = -10f;
const double lbl_802F5BC0 = 4503601774854144;
don't know about lbl_802F5BC8
don't know about lbl_802F5BCC
const float lbl_802F5BD0 = 59.996337890625f;
const float lbl_802F5BD4 = 1.3333333730697632f;
const float lbl_802F5BD8 = 0.10000000149011612f;
const float lbl_802F5BDC = 20000f;
const float lbl_802F5BE0 = 400f;
const double lbl_802F5BE8 = 0.10000000000000001;
const double lbl_802F5BF0 = 2;
const float lbl_802F5BF8 = 24f;
const float lbl_802F5BFC = 170f;
const float lbl_802F5C00 = 435f;
const float lbl_802F5C04 = 415f;
const double lbl_802F5C08 = 60;
const float lbl_802F5C10 = 182.04444885253906f;
don't know about lbl_802F5C14
don't know about lbl_802F5C18
const float lbl_802F5C1C = 0.30000001192092896f;
const double lbl_802F5C20 = 0.02;
const float lbl_802F5C28 = 0.44999998807907104f;
const float lbl_802F5C2C = 2.7999999523162842f;
const float lbl_802F5C30 = -0.44999998807907104f;
const float lbl_802F5C34 = -0.66659998893737793f;
const float lbl_802F5C38 = 60f;
const double lbl_802F5C40 = 2.5;
*/
