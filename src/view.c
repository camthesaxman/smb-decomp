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
#include "event.h"
#include "gxutil.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "sprite.h"
#include "stage.h"

#include "../data/common.gma.h"

u8 lbl_802C4960[0x1400];  // TODO: what is this?

struct StageViewInfo
{
    Vec eye;
    Vec target;
    s16 rotX;
    s16 rotY;
    s16 rotZ;
    s16 frameCounter;
    float unk20;
    float unk24;
    struct Sphere stageBounds;
    s16 unk38;
    s16 unk3A;
    s16 unk3C;
    s16 unk3E;
    float unk40;
    struct MovableStagePart *unk44;
    float unk48;
};

struct StageViewInfo *stageViewInfo;

void ev_view_init(void)
{
    stageViewInfo = OSAlloc(sizeof(*stageViewInfo));
    if (stageViewInfo == NULL)
        OSPanic("view.c", 114, "cannot OSAlloc\n");
    memset(stageViewInfo, 0, sizeof(*stageViewInfo));
    get_curr_stage_view_bounds(&stageViewInfo->stageBounds);
    stageViewInfo->unk20 = stageViewInfo->stageBounds.radius * 1.1313;
    stageViewInfo->unk24 = 0.75f;
    stageViewInfo->unk38 = -5632;
    stageViewInfo->unk3A = 0;
    if (movableStagePartCount > 0)
    {
        stageViewInfo->unk44 = OSAlloc(72 * sizeof(*stageViewInfo->unk44));
        if (stageViewInfo->unk44 == NULL)
            OSPanic("view.c", 126, "cannot OSAlloc\n");
        memcpy(stageViewInfo->unk44, movableStageParts, 72 * sizeof(*stageViewInfo->unk44));
    }
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        camera_setup_singleplayer_viewport();
    view_init_stage_anim();
    func_800A66E4();
    view_create_text_sprites();
}

void ev_view_main(void)
{
    Vec sp8;
    s8 cstickY, cstickX;

    view_animate_stage();
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
    mathutil_mtxA_from_translate(&stageViewInfo->stageBounds.pos);
    mathutil_mtxA_rotate_y(stageViewInfo->unk3A);
    mathutil_mtxA_rotate_x(stageViewInfo->unk38);
    mathutil_mtxA_translate_xyz(0.0f, 0.0f, stageViewInfo->unk20 * stageViewInfo->unk24);
    mathutil_mtxA_rotate_x(-stageViewInfo->unk38);
    mathutil_mtxA_rotate_y(stageViewInfo->unk3E);
    mathutil_mtxA_rotate_x(stageViewInfo->unk38);
    mathutil_mtxA_rotate_x(stageViewInfo->unk3C);
    mathutil_mtxA_tf_point_xyz(&stageViewInfo->eye, 0.0f, 0.0f, 0.0f);  // why?
    mathutil_mtxA_tf_point_xyz(&stageViewInfo->target, 0.0f, 0.0f, -10.0f);

    sp8.x = stageViewInfo->target.x - stageViewInfo->eye.x;
    sp8.y = stageViewInfo->target.y - stageViewInfo->eye.y;
    sp8.z = stageViewInfo->target.z - stageViewInfo->eye.z;
    stageViewInfo->rotY = mathutil_atan2(sp8.x, sp8.z) - 32768;
    stageViewInfo->rotX = mathutil_atan2(sp8.y, mathutil_sqrt(mathutil_sum_of_sq(sp8.x, sp8.z)));
    stageViewInfo->rotZ = 0;
    stageViewInfo->frameCounter++;
    unpausedFrameCounter++;
}

void ev_view_dest(void)
{
    func_800A66CC();
    func_800A671C();
    view_destroy_text_sprites();
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
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION && modeCtrl.playerCount == 3)
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

void view_draw(void)
{
    struct Camera *camera;
    struct Ball *ballBackup;
    struct Camera cameraBackup = cameraInfo[modeCtrl.unk2C];
    u8 dummy[16];
    Mtx projMtx;
    camera = &cameraInfo[modeCtrl.unk2C];

    lbl_801EEC90.unk0 |= 2;
    view_apply_camera(camera);
    C_MTXPerspective(projMtx, 59.99633789f, 1.33333333f, 0.1f, 20000.0f);
    GXSetProjection(projMtx, 0);

    {
        S16Vec rotation = {0};
        rotation.x = stageViewInfo->rotX;
        rotation.y = stageViewInfo->rotY;
        rotation.z = stageViewInfo->rotZ;
        func_80020AB8(&stageViewInfo->eye, &rotation, 59.99633789f, 1.33333333f, 0.0f, 0.0f);
    }

    func_80021ECC();
    ballBackup = currentBallStructPtr;
    currentBallStructPtr = &ballInfo[0];
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(1);
    view_apply_camera(camera);
    g_draw_ball_shadow();
    func_80054FF0();
    func_800225C0(0);
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(4);
    view_apply_camera(camera);
    if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
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
    view_apply_camera(camera);
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
        func_800A6734();
    if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
        func_800A6BF0();
    ord_tbl_draw_nodes();
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(8);
    view_apply_camera(camera);
    currentBallStructPtr = ballBackup;
    func_80017FCC();
    lbl_801EEC90.unk0 &= ~(1 << 1);
    cameraInfo[modeCtrl.unk2C] = cameraBackup;
}

void func_800A5F28(void)
{
    if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
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

void view_sprite_func(struct Sprite *sprite)
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

void view_create_text_sprites(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 100;
        sprite->centerX = 24.0f;
        sprite->centerY = 24.0f;
        sprite->textAlign = 0;
        sprite->fontId = 0xB3;
        sprite->unk74 |= 0x200000;
        sprite->unk38 = view_sprite_func;
        strcpy(sprite->text, "a/Stage Overview");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 100;
        sprite->centerX = 170.0f;
        sprite->centerY = 435.0f;
        sprite->textAlign = 8;
        sprite->fontId = 0xB3;
        sprite->unk74 |= 0x200000;
        sprite->unk38 = view_sprite_func;
        strcpy(sprite->text, "p/LEVER/a/Rotate/Zoom");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 100;
        sprite->centerX = 415.0f;
        sprite->centerY = 435.0f;
        sprite->textAlign = 8;
        sprite->fontId = 0xB3;
        sprite->unk74 |= 0x200000;
        sprite->unk38 = view_sprite_func;
        strcpy(sprite->text, "p/BUTTON_C/a/Pan camera");
    }
}

void view_destroy_text_sprites(void)
{
    destroy_sprite_with_tag(100);
}

void view_init_stage_anim(void)
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

void view_animate_stage(void)
{
    float t;
    float f3;
    struct MovableStagePart *movpart;
    struct StageCollHdr *r30;
    int i;

    lbl_80206DEC.unk4 = stageViewInfo->frameCounter;
    t = stageViewInfo->frameCounter / 60.0;
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

    if (modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION
     || func_800672D0(currStageId) != 0
     || (modeCtrl.levelSetFlags & (1 << 12)))
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
                mathutil_mtxA_rotate_y(stageViewInfo->frameCounter * sp10[r24->unkC]);
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

    if ((modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION || func_800672D0(currStageId) != 0 || (modeCtrl.levelSetFlags & (1 << 12)))
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
                if ((u32)stcoli_sub16(&sp14, &sp60, 0) != 0)
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

void func_800A6A88(void)
{
    struct MovableStagePart *r30;
    struct Struct8020A348 *r29;
    int j;
    int i;
    struct Struct8020A348_child *r26;
    u32 dummy;

    func_80030BB8(1.0f, 1.0f, 1.0f);
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&decodedStageLzPtr->startPos->pos);
    mathutil_mtxA_rotate_y(stageViewInfo->frameCounter << 9);
    g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 10));
    func_8000E3BC();
    if (decodedStageGmaPtr != NULL)
    {
        r30 = movableStageParts;
        r29 = lbl_8020AB88;
        for (i = 0; i < movableStagePartCount; i++, r29++, r30++)
        {
            mathutil_mtxA_from_mtxB();
            if (i > 0)
                mathutil_mtxA_mult_right(r30->unk24);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            r26 = r29->unk0;
            for (j = 0; j < r29->unk4; j++, r26++)
            {
                if ((r26->unk0 & 3) == 1)
                {
                    struct GMAModelHeader *model = r26->unk4;
                    if (model != NULL)
                    {

                        if (!(lbl_801EEC90.unk0 & (1<<(31-0x1D))) || (r26->unk0 & (1<<(31-0x1D))))
                            g_avdisp_maybe_draw_model_2(model);
                    }
                }
            }
        }
    }
    if (dynamicStageParts != NULL)
    {
        struct DynamicStagePart *dyn;
        mathutil_mtxA_from_mtxB();
        dyn = dynamicStageParts;
        while (dyn->modelName != NULL)
        {
            g_dupe_of_call_draw_naomi_model_1(dyn->tempModel);
            dyn++;
        }
    }
    if (currStageId == ST_101_BLUR_BRIDGE)
        draw_blur_bridge_accordions();
}

extern struct
{
    u8 filler0[0x14];
    struct GMAModelHeader *unk14;
} lbl_8028C0B0;

extern struct GMAModelHeader *lbl_802F1FFC;

#ifdef NONMATCHING
// https://decomp.me/scratch/xQ4td
void func_800A6BF0(void)
{
    //struct StageCollHdr_child4 *r29;

        struct GMAModelHeader *r28;
    //struct StageCollHdr_child *r27;
    int i;  // r26 -> r29
    //int i2;
    //int j;  // r25
    //int r24;
    Mtx sp8;

    for (i = 0; i < movableStagePartCount; i++)
    {
        int r24;
        struct StageCollHdr_child *r27;
        int j;  // r25
        //#define r27 r29
        r27 = decodedStageLzPtr->collHdrs[i].unk40;
        r24 = decodedStageLzPtr->collHdrs[i].unk3C;
        mathutil_mtxA_from_mtxB();
        if (i > 0)
            mathutil_mtxA_mult_right(movableStageParts[i].unk24);
        mathutil_mtxA_to_mtx(sp8);
        for (j = 0; j < r24; j++, r27++)
        {
            mathutil_mtxA_from_mtx(sp8);
            mathutil_mtxA_translate(&r27->unk0);
            mathutil_mtxA_rotate_z(r27->unk10);
            mathutil_mtxA_rotate_y(r27->unkE);
            mathutil_mtxA_rotate_x(r27->unkC);
            switch (r27->unk12)
            {
            default:
                r28 = goalModels[0];
                break;
            case 'G':
                r28 = goalModels[1];
                break;
            case 'R':
                r28 = goalModels[2];
                break;
            }
            if (r28 != NULL)
            {
                g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
                g_avdisp_maybe_draw_model_1(r28);
            }
            //lbl_800A6CE4
            g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 14));

            mathutil_mtxA_push();
            mathutil_mtxA_translate_xyz(0.0f, 2.8f, 0.0f);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            g_avdisp_maybe_draw_model_1(commonGma->modelEntries[0x40].modelOffset);
            mathutil_mtxA_pop();

            mathutil_mtxA_push();
            g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 0x1D));
            mathutil_mtxA_translate_xyz(-0.45f, 0.0f, 0.0f);
            g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 0x1D));
            mathutil_mtxA_pop();

            g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 0x13));
            mathutil_mtxA_translate_xyz(-0.6666f, 0.0f, 0.0f);
            g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 0x13));
            mathutil_mtxA_translate_xyz(-0.6666f, 0.0f, 0.0f);
            g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 0x13));
        }
        //#undef r27
    }

    for (i = 0; i < movableStagePartCount; i++)
    {
        s32 r27;
        int j;
        struct StageCollHdr_child4 *r29;
        r29 = decodedStageLzPtr->collHdrs[i].unk50;
        r27 = decodedStageLzPtr->collHdrs[i].unk4C;

        mathutil_mtxA_from_mtxB();
        if (i > 0)
            mathutil_mtxA_mult_right(movableStageParts[i].unk24);
        mathutil_mtxA_to_mtx(sp8);
        for (j = 0; j < r27; j++, r29++)
        {
            mathutil_mtxA_from_mtx(sp8);
            mathutil_mtxA_translate(&r29->unk0);
            mathutil_mtxA_rotate_z(r29->unk10);
            mathutil_mtxA_rotate_y(r29->unkE);
            mathutil_mtxA_rotate_z(r29->unkC);
            mathutil_mtxA_rotate_y(stageViewInfo->frameCounter << 8);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            g_avdisp_maybe_draw_model_1(lbl_8028C0B0.unk14);
        }
    }
    //800A6E90
    // i = r29
    for (i = 0; i < movableStagePartCount; i++)
    {
        s32 r26;
        int j;
        s32 r28_;
        struct StageCollHdr_child4 *r29;
        r29 = (void *)decodedStageLzPtr->collHdrs[i].unk58;
        r26 = 0;
        r28_ = decodedStageLzPtr->collHdrs[i].unk54;
        //int r26;
        //#define r26 j
        #define r25 r29
        //r26 = 0;

        mathutil_mtxA_from_mtxB();
        if (i > 0)
            mathutil_mtxA_mult_right(movableStageParts[i].unk24);
        mathutil_mtxA_to_mtx(sp8);
        // j = r27
        for (j = 0; j < r28_; r26++, j++, r25++)
        {
            int r4;
            int r0;
            float f0;

            mathutil_mtxA_from_mtx(sp8);
            mathutil_mtxA_translate(&r25->unk0);
            mathutil_mtxA_rotate_z(r25->unk10);
            mathutil_mtxA_rotate_y(r25->unkE);
            mathutil_mtxA_rotate_z(r25->unkC);

            r4 = stageViewInfo->frameCounter - (r26 * (60 / decodedStageLzPtr->jamabarsCount));
            r0 = r4 % 60;
            f0 = r0 / 60.0f * 2.0;
            if (f0 >= 1.0)
                f0 = 2.0 - f0;
            f0 = -f0;
            mathutil_mtxA_translate_xyz(0.0f, 0.0f, 2.5 * f0);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            g_avdisp_maybe_draw_model_1(lbl_802F1FFC);
        }
        #undef r25
    }
}
#else
#define lbl_802F5BC0 4503601774854144.0
#define lbl_802F5B98 1.0
#define lbl_802F5BB4 0.0f
#define lbl_802F5BF0 2.0
const float lbl_802F5C2C = 2.7999999523162842f;
const float lbl_802F5C30 = -0.44999998807907104f;
const float lbl_802F5C34 = -0.66659998893737793f;
const float lbl_802F5C38 = 60.0f;
const double lbl_802F5C40 = 2.5;
asm void func_800A6BF0(void)
{
    nofralloc
#include "../asm/nonmatchings/func_800A6BF0.s"
}
#pragma peephole on
#endif

struct Struct801D5854
{
    s32 unk0;
    struct Sphere unk4;
} lbl_801D5854 = {57, {{0, 100, 0}, 18}};

void get_curr_stage_view_bounds(struct Sphere *bounds)
{
    int id;

    get_curr_stage_fly_in_position(bounds);
    if (lbl_801D5854.unk0 == (id = currStageId))
        *bounds = lbl_801D5854.unk4;
}

void view_apply_camera(struct Camera *camera)
{
    camera->eye = stageViewInfo->eye;
    camera->rotX = stageViewInfo->rotX;
    camera->rotY = stageViewInfo->rotY;
    camera->rotZ = stageViewInfo->rotZ;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_z(-camera->rotZ);
    mathutil_mtxA_rotate_x(-camera->rotX);
    mathutil_mtxA_rotate_y(-camera->rotY);
    mathutil_mtxA_translate_neg(&camera->eye);
    mathutil_mtx_copy(mathutilData->mtxA, camera->unk144);
    mathutil_mtx_copy(mathutilData->mtxA, mathutilData->mtxB);
    mathutil_mtx_copy(mathutilData->mtxA, camera->unk174);
    mathutil_mtx_copy(mathutilData->mtxA, camera->unk1A4);
    mathutil_mtx_copy(mathutilData->mtxA, camera->unk1D4);
    mathutil_mtx_copy(mathutilData->mtxA, mathutilData->mtxB);
    mathutil_mtx_copy(mathutilData->mtxA, lbl_802F1B3C->matrices[2]);
    mathutil_mtx_copy(mathutilData->mtxA, lbl_802F1B3C->matrices[3]);
    mathutil_mtx_copy(mathutilData->mtxA, lbl_802F1B3C->matrices[0]);
    mathutil_mtx_copy(mathutilData->mtxA, lbl_802F1B3C->matrices[4]);
    mathutil_mtx_copy(mathutilData->mtxA, lbl_802F1B3C->matrices[1]);
}
