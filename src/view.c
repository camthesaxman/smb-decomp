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
#include "stcoli.h"
#include "gma.h"
#include "light.h"

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
    struct Sphere stageBoundSphere;
    s16 unk38;
    s16 unk3A;
    s16 unk3C;
    s16 unk3E;
    float unk40;
    struct AnimGroupInfo *animGroupsBackup;
    float unk48;
};

struct StageViewInfo *stageViewInfo;

void ev_view_init(void)
{
    stageViewInfo = OSAlloc(sizeof(*stageViewInfo));
    if (stageViewInfo == NULL)
        OSPanic("view.c", 114, "cannot OSAlloc\n");
    memset(stageViewInfo, 0, sizeof(*stageViewInfo));

    get_curr_stage_view_bounds(&stageViewInfo->stageBoundSphere);
    stageViewInfo->unk20 = stageViewInfo->stageBoundSphere.radius * 1.1313;
    stageViewInfo->unk24 = 0.75f;
    stageViewInfo->unk38 = -5632;
    stageViewInfo->unk3A = 0;

    // back up anim groups since the stage view clobbers them
    if (animGroupCount > 0)
    {
        stageViewInfo->animGroupsBackup = OSAlloc(72 * sizeof(*stageViewInfo->animGroupsBackup));
        if (stageViewInfo->animGroupsBackup == NULL)
            OSPanic("view.c", 126, "cannot OSAlloc\n");
        memcpy(stageViewInfo->animGroupsBackup, animGroups, 72 * sizeof(*stageViewInfo->animGroupsBackup));
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
    mathutil_mtxA_from_translate(&stageViewInfo->stageBoundSphere.pos);
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
    stageViewInfo->rotX = mathutil_atan2(sp8.y, mathutil_sqrt(mathutil_sum_of_sq_2(sp8.x, sp8.z)));
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
        // restore backup of anim groups
        if (stageViewInfo->animGroupsBackup != NULL)
        {
            memcpy(animGroups, stageViewInfo->animGroupsBackup, 72 * sizeof(*stageViewInfo->animGroupsBackup));
            OSFree(stageViewInfo->animGroupsBackup);
        }
        OSFree(stageViewInfo);
        stageViewInfo = NULL;
    }

    // restore cameras for competition mode
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION && modeCtrl.playerCount == 3)
        {
            switch (modeCtrl.splitscreenMode)
            {
            default:
            case SPLITSCREEN_1P_WIDE:
                camera_setup_splitscreen_viewports(3);
                break;
            case SPLITSCREEN_2P_WIDE:
                setup_camera_viewport(0, 0.0f, 0.5f, 0.5f, 0.5f);
                setup_camera_viewport(1, 0.0f, 0.0f, 1.0f, 0.5f);
                setup_camera_viewport(2, 0.5f, 0.5f, 0.5f, 0.5f);
                setup_camera_viewport(3, 0.0f, 0.0f, 0.0f, 0.0f);
                break;
            case SPLITSCREEN_3P_WIDE:
                setup_camera_viewport(0, 0.0f, 0.0f, 0.5f, 0.5f);
                setup_camera_viewport(1, 0.5f, 0.0f, 0.5f, 0.5f);
                setup_camera_viewport(2, 0.0f, 0.5f, 1.0f, 0.5f);
                setup_camera_viewport(3, 0.0f, 0.0f, 0.0f, 0.0f);
                break;
            case SPLITSCREEN_4_SPLIT:
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
    struct Camera cameraBackup = cameraInfo[modeCtrl.currPlayer];
    u8 dummy[16];
    Mtx projMtx;
    camera = &cameraInfo[modeCtrl.currPlayer];

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

    light_main();
    ballBackup = currentBallStructPtr;
    currentBallStructPtr = &ballInfo[0];
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(1);
    view_apply_camera(camera);
    g_draw_ball_shadow();
    func_80054FF0();
    g_reset_light_group_stack(0);
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(4);
    view_apply_camera(camera);
    if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
        draw_stage_geometry();
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
        draw_banana_shadows();
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
        draw_items();
    if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
        draw_stage_objects();
    ord_tbl_draw_nodes();
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(8);
    view_apply_camera(camera);
    currentBallStructPtr = ballBackup;
    func_80017FCC();
    lbl_801EEC90.unk0 &= ~(1 << 1);
    cameraInfo[modeCtrl.currPlayer] = cameraBackup;
}

void func_800A5F28(void)
{
    if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
        draw_stage_geometry();
    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
    {
        ord_tbl_set_depth_offset(400.0f);
        background_draw();
        ord_tbl_set_depth_offset(0.0f);
    }
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
        draw_items();
    if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
        draw_stage_objects();
    ord_tbl_draw_nodes();
}

void view_sprite_func(struct Sprite *sprite)
{
    func_80071A8C();
    g_set_font(sprite->fontId);
    func_80071B2C(sprite->unk40, sprite->unk44);
    func_80071B50(sprite->unk74);
    func_80071B1C(sprite->unk4C + 0.1);
    g_set_text_fill_color(0);
    g_set_text_other_color(0);
    g_set_text_pos(sprite->x + 2.0, sprite->y + 2.0);
    g_draw_text(sprite->text);
    func_80071B1C(sprite->unk4C);
    g_set_text_fill_color((sprite->unkC << 16) | (sprite->unkD << 8) | sprite->unkE);
    g_set_text_other_color((sprite->unk70 << 16) | (sprite->unk71 << 8) | sprite->unk72);
    g_set_text_pos(sprite->x, sprite->y);
    g_draw_text(sprite->text);
}

void view_create_text_sprites(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 100;
        sprite->x = 24.0f;
        sprite->y = 24.0f;
        sprite->textAlign = ALIGN_LT;
        sprite->fontId = FONT_JAP_24x24_2Pg;
        sprite->unk74 |= 0x200000;
        sprite->drawFunc = view_sprite_func;
        strcpy(sprite->text, "a/Stage Overview");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 100;
        sprite->x = 170.0f;
        sprite->y = 435.0f;
        sprite->textAlign = ALIGN_RB;
        sprite->fontId = FONT_JAP_24x24_2Pg;
        sprite->unk74 |= 0x200000;
        sprite->drawFunc = view_sprite_func;
        strcpy(sprite->text, "p/LEVER/a/Rotate/Zoom");
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 100;
        sprite->x = 415.0f;
        sprite->y = 435.0f;
        sprite->textAlign = ALIGN_RB;
        sprite->fontId = FONT_JAP_24x24_2Pg;
        sprite->unk74 |= 0x200000;
        sprite->drawFunc = view_sprite_func;
        strcpy(sprite->text, "p/BUTTON_C/a/Pan camera");
    }
}

void view_destroy_text_sprites(void)
{
    destroy_sprite_with_tag(100);
}

void view_init_stage_anim(void)
{
    struct AnimGroupInfo *animGroup;
    struct StageAnimGroup *r30;
    int i;

    stageViewInfo->unk40 = lbl_80206DEC.g_stageTimer;
    animGroup = animGroups;
    r30 = decodedStageLzPtr->animGroups;
    for (i = 0; i < 72; i++, animGroup++, r30++)
    {
        animGroup->pos.x = r30->initPos.x;
        animGroup->pos.y = r30->initPos.y;
        animGroup->pos.z = r30->initPos.z;

        animGroup->prevPos.x = r30->initPos.x - r30->unkB8.x;
        animGroup->prevPos.y = r30->initPos.y - r30->unkB8.y;
        animGroup->prevPos.z = r30->initPos.z - r30->unkB8.z;

        animGroup->rot.x = r30->initRot.x;
        animGroup->rot.y = r30->initRot.y;
        animGroup->rot.z = r30->initRot.z;

        animGroup->prevRot.x = r30->initRot.x;
        animGroup->prevRot.y = r30->initRot.y;
        animGroup->prevRot.z = r30->initRot.z;

        mathutil_mtxA_from_identity();
        mathutil_mtxA_to_mtx(animGroup->transform);
        mathutil_mtxA_translate_neg(&r30->unkB8);
        mathutil_mtxA_to_mtx(animGroup->prevTransform);
    }
    if (currStageId == ST_101_BLUR_BRIDGE)
        find_blur_bridge_accordion();
}

void view_animate_stage(void)
{
    float t;
    float f3;
    struct AnimGroupInfo *animGroup;
    struct StageAnimGroup *r30;
    int i;

    lbl_80206DEC.g_stageTimer = stageViewInfo->frameCounter;
    t = stageViewInfo->frameCounter / 60.0;
    t += decodedStageLzPtr->loopStartSeconds;
    f3 = (float)(decodedStageLzPtr->loopEndSeconds - decodedStageLzPtr->loopStartSeconds);
    t -= f3 * mathutil_floor(t / f3);
    t += decodedStageLzPtr->loopStartSeconds;

    r30 = decodedStageLzPtr->animGroups;
    animGroup = animGroups;
    for (i = 0; i < decodedStageLzPtr->animGroupCount; i++, animGroup++, r30++)
    {
        struct StageAnimGroupAnim *anim = r30->anim;

        if (anim == NULL2)
            continue;

        if (anim->rotXKeyframes != NULL2)
        {
            animGroup->prevRot.x = animGroup->rot.x;
            animGroup->rot.x = DEGREES_TO_S16(interpolate_keyframes(anim->rotXKeyframeCount, anim->rotXKeyframes, t));
        }
        if (anim->rotYKeyframes != NULL2)
        {
            animGroup->prevRot.y = animGroup->rot.y;
            animGroup->rot.y = DEGREES_TO_S16(interpolate_keyframes(anim->rotYKeyframeCount, anim->rotYKeyframes, t));
        }
        if (anim->rotZKeyframes != NULL2)
        {
            animGroup->prevRot.z = animGroup->rot.z;
            animGroup->rot.z = DEGREES_TO_S16(interpolate_keyframes(anim->rotZKeyframeCount, anim->rotZKeyframes, t));
        }

        if (anim->posXKeyframes != NULL2)
        {
            animGroup->prevPos.x = animGroup->pos.x - r30->unkB8.x;
            animGroup->pos.x = interpolate_keyframes(anim->posXKeyframeCount, anim->posXKeyframes, t);
        }
        if (anim->posYKeyframes != NULL2)
        {
            animGroup->prevPos.y = animGroup->pos.y - r30->unkB8.y;
            animGroup->pos.y = interpolate_keyframes(anim->posYKeyframeCount, anim->posYKeyframes, t);
        }
        if (anim->posZKeyframes != NULL2)
        {
            animGroup->prevPos.z = animGroup->pos.z - r30->unkB8.z;
            animGroup->pos.z = interpolate_keyframes(anim->posZKeyframeCount, anim->posZKeyframes, t);
        }

        mathutil_mtxA_from_translate(&animGroup->pos);
        mathutil_mtxA_rotate_z(animGroup->rot.z);
        mathutil_mtxA_rotate_y(animGroup->rot.y);
        mathutil_mtxA_rotate_x(animGroup->rot.x - r30->initRot.x);
        mathutil_mtxA_rotate_y(-r30->initRot.y);
        mathutil_mtxA_rotate_z(-r30->initRot.z);
        mathutil_mtxA_translate_neg(&r30->initPos);
        mathutil_mtxA_to_mtx(animGroup->transform);

        mathutil_mtxA_from_translate(&animGroup->prevPos);
        mathutil_mtxA_rotate_z(animGroup->prevRot.z);
        mathutil_mtxA_rotate_y(animGroup->prevRot.y);
        mathutil_mtxA_rotate_x(animGroup->prevRot.x - r30->initRot.x);
        mathutil_mtxA_rotate_y(-r30->initRot.y);
        mathutil_mtxA_rotate_z(-r30->initRot.z);
        mathutil_mtxA_translate_neg(&r30->initPos);
        mathutil_mtxA_to_mtx(animGroup->prevTransform);
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
    lbl_80206DEC.g_stageTimer = stageViewInfo->unk40;
}

void func_800A66E4(void)
{
    stageViewInfo->unk48 = backgroundInfo.animTimer;
}

void func_800A66FC(void)
{
    backgroundInfo.animTimer += 1.0;
}

void func_800A671C(void)
{
    backgroundInfo.animTimer = stageViewInfo->unk48;
}

void draw_items(void)
{
    int i;

    s32 sp10[2] = { 0x400, 0x300 };

    if (modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION
     || is_bonus_stage(currStageId)
     || (modeCtrl.levelSetFlags & (1 << 12)))
    {
        struct GMAModel *models[2];

        models[0] = commonGma->modelEntries[OBJ_BANANA_01_LOD150].modelOffset;
        models[1] = commonGma->modelEntries[OBJ_BANANA_02_LOD100].modelOffset;
        for (i = 0; i < animGroupCount; i++)
        {
            struct StageBanana *r24 = decodedStageLzPtr->animGroups[i].bananas;
            int r23 = decodedStageLzPtr->animGroups[i].bananaCount;
            int j;

            for (j = 0; j < r23; j++, r24++)
            {
                mathutil_mtxA_from_mtx(animGroups[i].transform);
                mathutil_mtxA_translate(&r24->pos);
                mathutil_mtxA_sq_from_identity();
                mathutil_mtxA_rotate_y(stageViewInfo->frameCounter * sp10[r24->type]);
                mathutil_mtxA_mult_left(mathutilData->mtxB);
                g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
                avdisp_draw_model_culled_sort_translucent(models[r24->type]);
            }
        }
    }
}

void draw_banana_shadows(void)
{
    struct StageBanana *banana;
    int i;
    int r25;
    int j;
    struct RaycastHit sp60;
    Quaternion sp50;
    Mtx sp20;
    Vec sp14;
    Vec sp8 = { 0, 0, -1 };

    if ((modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION || is_bonus_stage(currStageId) != 0 || (modeCtrl.levelSetFlags & (1 << 12)))
     && decodedStageLzPtr->bananaCount > 0)
    {
        avdisp_set_post_multiply_color(0.3f, 0.3f, 0.3f, 0.3f);
        avdisp_set_z_mode(1, 3, 0);

        for (i = 0; i < animGroupCount; i++)
        {
            banana = decodedStageLzPtr->animGroups[i].bananas;
            r25 = decodedStageLzPtr->animGroups[i].bananaCount;

            for (j = 0; j < r25; j++, banana++)
            {
                mathutil_mtxA_from_mtx(animGroups[i].transform);
                mathutil_mtxA_tf_point(&banana->pos, &sp14);
                if ((u32)raycast_stage_down(&sp14, &sp60, 0) != 0)
                {
                    mathutil_mtxA_from_mtx(mathutilData->mtxB);
                    sp14.x = sp60.pos.x + sp60.normal.x * 0.02;
                    sp14.y = sp60.pos.y + sp60.normal.y * 0.02;
                    sp14.z = sp60.pos.z + sp60.normal.z * 0.02;
                    mathutil_mtxA_translate(&sp14);
                    mathutil_mtxA_to_mtx(sp20);
                    mathutil_quat_from_dirs(&sp50, &sp8, &sp60.normal);
                    mathutil_mtxA_from_quat(&sp50);
                    mathutil_mtxA_mult_left(sp20);
                    mathutil_mtxA_scale_s(0.45f);
                    g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
                    avdisp_draw_model_culled_sort_translucent(commonGma->modelEntries[0x4E].modelOffset);
                }
            }
        }
        avdisp_set_post_multiply_color(1.0f, 1.0f, 1.0f, 1.0f);
        avdisp_set_z_mode(1, 3, 1);
    }
}

void draw_stage_geometry(void)
{
    struct AnimGroupInfo *animGrp;
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
        animGrp = animGroups;
        r29 = lbl_8020AB88;
        for (i = 0; i < animGroupCount; i++, r29++, animGrp++)
        {
            mathutil_mtxA_from_mtxB();
            if (i > 0)
                mathutil_mtxA_mult_right(animGrp->transform);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            r26 = r29->unk0;
            for (j = 0; j < r29->unk4; j++, r26++)
            {
                if ((r26->flags & 3) == 1)
                {
                    struct GMAModel *model = r26->model;
                    if (model != NULL)
                    {

                        if (!(lbl_801EEC90.unk0 & (1<<(31-0x1D))) || (r26->flags & (1<<(31-0x1D))))
                            avdisp_draw_model_culled_sort_none(model);
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
    struct GMAModel *unk14;
} lbl_8028C0B0;

extern struct GMAModel *lbl_802F1FFC;

#ifdef NONMATCHING
// https://decomp.me/scratch/xQ4td
void draw_stage_objects(void)
{
    //struct StageCollHdr_child4 *r29;

        struct GMAModel *r28;
    //struct StageGoal *r27;
    int i;  // r26 -> r29
    //int i2;
    //int j;  // r25
    //int r24;
    Mtx sp8;

    for (i = 0; i < animGroupCount; i++)
    {
        int r24;
        struct StageGoal *r27;
        int j;  // r25
        //#define r27 r29
        r27 = decodedStageLzPtr->animGroups[i].goals;
        r24 = decodedStageLzPtr->animGroups[i].goalCount;
        mathutil_mtxA_from_mtxB();
        if (i > 0)
            mathutil_mtxA_mult_right(animGroups[i].transform);
        mathutil_mtxA_to_mtx(sp8);
        for (j = 0; j < r24; j++, r27++)
        {
            mathutil_mtxA_from_mtx(sp8);
            mathutil_mtxA_translate(&r27->pos);
            mathutil_mtxA_rotate_z(r27->rotZ);
            mathutil_mtxA_rotate_y(r27->rotY);
            mathutil_mtxA_rotate_x(r27->rotX);
            switch (r27->type)
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
                avdisp_draw_model_culled_sort_translucent(r28);
            }
            //lbl_800A6CE4
            nl2ngc_draw_model_sorted(NLOBJ_MODEL(naomiCommonObj, 14));

            mathutil_mtxA_push();
            mathutil_mtxA_translate_xyz(0.0f, 2.8f, 0.0f);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            avdisp_draw_model_culled_sort_translucent(commonGma->modelEntries[0x40].modelOffset);
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

    for (i = 0; i < animGroupCount; i++)
    {
        s32 r27;
        int j;
        struct StageBumper *r29;
        r29 = decodedStageLzPtr->animGroups[i].bumpers;
        r27 = decodedStageLzPtr->animGroups[i].bumperCount;

        mathutil_mtxA_from_mtxB();
        if (i > 0)
            mathutil_mtxA_mult_right(animGroups[i].transform);
        mathutil_mtxA_to_mtx(sp8);
        for (j = 0; j < r27; j++, r29++)
        {
            mathutil_mtxA_from_mtx(sp8);
            mathutil_mtxA_translate(&r29->pos);
            mathutil_mtxA_rotate_z(r29->rotZ);
            mathutil_mtxA_rotate_y(r29->rotY);
            mathutil_mtxA_rotate_z(r29->rotX);
            mathutil_mtxA_rotate_y(stageViewInfo->frameCounter << 8);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            avdisp_draw_model_culled_sort_translucent(lbl_8028C0B0.unk14);
        }
    }
    //800A6E90
    // i = r29
    for (i = 0; i < animGroupCount; i++)
    {
        s32 r26;
        int j;
        s32 r28_;
        struct StageBumper *r29;
        r29 = (void *)decodedStageLzPtr->animGroups[i].jamabars;
        r26 = 0;
        r28_ = decodedStageLzPtr->animGroups[i].jamabarCount;
        //int r26;
        //#define r26 j
        #define r25 r29
        //r26 = 0;

        mathutil_mtxA_from_mtxB();
        if (i > 0)
            mathutil_mtxA_mult_right(animGroups[i].transform);
        mathutil_mtxA_to_mtx(sp8);
        // j = r27
        for (j = 0; j < r28_; r26++, j++, r25++)
        {
            int r4;
            int r0;
            float f0;

            mathutil_mtxA_from_mtx(sp8);
            mathutil_mtxA_translate(&r25->pos);
            mathutil_mtxA_rotate_z(r25->rotZ);
            mathutil_mtxA_rotate_y(r25->rotY);
            mathutil_mtxA_rotate_z(r25->rotX);

            r4 = stageViewInfo->frameCounter - (r26 * (60 / decodedStageLzPtr->jamabarCount));
            r0 = r4 % 60;
            f0 = r0 / 60.0f * 2.0;
            if (f0 >= 1.0)
                f0 = 2.0 - f0;
            f0 = -f0;
            mathutil_mtxA_translate_xyz(0.0f, 0.0f, 2.5 * f0);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            avdisp_draw_model_culled_sort_translucent(lbl_802F1FFC);
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
asm void draw_stage_objects(void)
{
    nofralloc
#include "../asm/nonmatchings/draw_stage_objects.s"
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
