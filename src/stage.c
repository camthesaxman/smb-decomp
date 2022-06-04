#include <dolphin.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#define MATHUTIL_SIN_INT_PARAM
#include "background.h"
#include "bitmap.h"
#include "camera.h"
#include "course.h"
#include "event.h"
#include "global.h"
#include "gma.h"
#include "gxutil.h"
#include "info.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "preview.h"
#include "stage.h"
#include "stcoli.h"
#include "light.h"

#include "../data/common.nlobj.h"

// sbss
s16 currStageId;
s16 loadingStageId;
s16 loadingStageIdRequest;
u32 lbl_802F1F50;
u32 lbl_802F1F4C;
s32 animGroupCount;
struct DynamicStagePart *dynamicStageParts;
u16 lbl_802F1F40;
struct TPL *decodedStageTplPtr;
struct GMA *decodedStageGmaPtr;
struct GMAModel *u_stageBoxModel;
struct Stage *decodedStageLzPtr;
struct GMAModel *blurBridgeAccordion;
int previewLoaded;

extern u8 lbl_801B86E4[];

struct DynamicStagePart lbl_80206D00[5];

// sdata

struct Struct802F0990
{
    s32 stageId;
    struct DynamicStagePart *unk4;
};

struct Struct802F0990 lbl_802F0990[1] = {
    {ST_092_BONUS_WAVE, lbl_80206D00},
};

int loadedStageId = -1;
int lbl_802F099C = -1;

struct Preview stagePreview; // 78

struct Struct80206DEC lbl_80206DEC;

struct AnimGroupInfo animGroups[0x48]; // 148

FORCE_BSS_ORDER(lbl_80206D00)
FORCE_BSS_ORDER(stagePreview)
FORCE_BSS_ORDER(lbl_80206DEC)

char *goalModelNames[] =
{
    "GOAL",
    "GOAL_G",
    "GOAL_R",
};

void u_bonus_wave_warp_callback_1();
void u_bonus_wave_warp_callback_2();
u32 bonus_wave_raycast_down();

void ev_stage_init(void)
{
    lbl_80206DEC.unk0 = 0;
    lbl_80206DEC.unk8 = NULL;
    lbl_80206DEC.unk1C = 0;
    func_8004482C();
    switch (currStageId)
    {
    case ST_101_BLUR_BRIDGE:
        find_blur_bridge_accordion();
    }

    previewLoaded = FALSE;
    if (gameMode == MD_GAME && gameSubmode != SMD_GAME_NAMEENTRY_READY_INIT)
    {
        if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL ||
            modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        {
            int r5 = func_800673BC();
            if (r5 > 0 && r5 <= 200)
            {
                preview_create_with_alloc_img(&stagePreview, "preview/140x140.tpl", r5 - 1, 140,
                                              140, GX_TF_RGB5A3);
                u_preview_wait_then_do_something(&stagePreview);
                previewLoaded = TRUE;
            }
        }
    }
}

void ev_stage_main(void)
{
    struct AnimGroupInfo *animGroup;
    struct StageAnimGroup *coll;
    float f31;
    float f30;
    float f3;
    int i;

    if (gamePauseStatus & 0xA)
        return;
    if (infoWork.flags & INFO_FLAG_08)
    {
        if (modeCtrl.submodeTimer > 120)
            lbl_80206DEC.u_stageTimer = 0.0f;
        else
            lbl_80206DEC.u_stageTimer = 120 - modeCtrl.submodeTimer;
        lbl_80206DEC.unk0 = 0x77;
    }
    else if (infoWork.flags & INFO_FLAG_04)
    {
        lbl_80206DEC.u_stageTimer =
            func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]);
        lbl_80206DEC.unk0 = lbl_80206DEC.u_stageTimer;
    }
    else
        lbl_80206DEC.u_stageTimer = lbl_80206DEC.unk0;
    f31 = lbl_80206DEC.u_stageTimer / 60.0;
    f31 += decodedStageLzPtr->loopStartSeconds;
    f3 = (float)(decodedStageLzPtr->loopEndSeconds - decodedStageLzPtr->loopStartSeconds);
    f31 -= f3 * mathutil_floor(f31 / f3);
    f31 += decodedStageLzPtr->loopStartSeconds;
    f30 = f31;
    if (decodedStageLzPtr->unk78 != 0)
    {
        int i;
        for (i = 0; i < 3; i++)
        {
            float *r5 = &lbl_80206DEC.unk10[i];
            float f3 = *r5;
            if (lbl_80206DEC.unkC & (1 << i))
            {
                f3 += 1.0;
                if (f3 > 50.0)
                    f3 = 50.0f;
            }
            else
            {
                f3 -= 1.0;
                if (f3 < 0.0)
                    f3 = 0.0f;
            }
            *r5 = f3;
        }
    }
    animGroup = animGroups;
    coll = decodedStageLzPtr->animGroups;
    for (i = 0; i < decodedStageLzPtr->animGroupCount; i++, animGroup++, coll++)
    {
        int j;
        struct StageAnimGroupAnim *anim = coll->anim;

        if (anim == NULL2)
            continue;
        if (decodedStageLzPtr->unk78 != 0)
        {
            f31 = f30;
            for (j = 0; j < 3; j++)
            {
                if (coll->unk12 & (1 << j))
                {
                    f31 = lbl_80206DEC.unk10[j];
                    break;
                }
            }
        }
        if (anim->rotXKeyframes != NULL2)
        {
            animGroup->prevRot.x = animGroup->rot.x;
            animGroup->rot.x = DEGREES_TO_S16(
                interpolate_keyframes(anim->rotXKeyframeCount, anim->rotXKeyframes, f31));
        }
        if (anim->rotYKeyframes != NULL2)
        {
            animGroup->prevRot.y = animGroup->rot.y;
            animGroup->rot.y = DEGREES_TO_S16(
                interpolate_keyframes(anim->rotYKeyframeCount, anim->rotYKeyframes, f31));
        }
        if (anim->rotZKeyframes != NULL2)
        {
            animGroup->prevRot.z = animGroup->rot.z;
            animGroup->rot.z = DEGREES_TO_S16(
                interpolate_keyframes(anim->rotZKeyframeCount, anim->rotZKeyframes, f31));
        }
        if (anim->posXKeyframes != NULL2)
        {
            animGroup->prevPos.x = animGroup->pos.x - coll->unkB8.x;
            animGroup->pos.x =
                interpolate_keyframes(anim->posXKeyframeCount, anim->posXKeyframes, f31);
        }
        if (anim->posYKeyframes != NULL2)
        {
            animGroup->prevPos.y = animGroup->pos.y - coll->unkB8.y;
            animGroup->pos.y =
                interpolate_keyframes(anim->posYKeyframeCount, anim->posYKeyframes, f31);
        }
        if (anim->posZKeyframes != NULL2)
        {
            animGroup->prevPos.z = animGroup->pos.z - coll->unkB8.z;
            animGroup->pos.z =
                interpolate_keyframes(anim->posZKeyframeCount, anim->posZKeyframes, f31);
        }
        mathutil_mtxA_from_translate(&animGroup->pos);
        mathutil_mtxA_rotate_z(animGroup->rot.z);
        mathutil_mtxA_rotate_y(animGroup->rot.y);
        mathutil_mtxA_rotate_x(animGroup->rot.x - coll->initRot.x);
        mathutil_mtxA_rotate_y(-coll->initRot.y);
        mathutil_mtxA_rotate_z(-coll->initRot.z);
        mathutil_mtxA_translate_neg(&coll->initPos);
        mathutil_mtxA_to_mtx(animGroup->transform);
        mathutil_mtxA_from_translate(&animGroup->prevPos);
        mathutil_mtxA_rotate_z(animGroup->prevRot.z);
        mathutil_mtxA_rotate_y(animGroup->prevRot.y);
        mathutil_mtxA_rotate_x(animGroup->prevRot.x - coll->initRot.x);
        mathutil_mtxA_rotate_y(-coll->initRot.y);
        mathutil_mtxA_rotate_z(-coll->initRot.z);
        mathutil_mtxA_translate_neg(&coll->initPos);
        mathutil_mtxA_to_mtx(animGroup->prevTransform);
    }
    if (lbl_80206DEC.unk8 != NULL)
        lbl_80206DEC.unk8();

    // process dynamic models?
    if (dynamicStageParts != NULL)
    {
        struct DynamicStagePart *dyn = dynamicStageParts;
        while (dyn->modelName != NULL)
        {
            memcpy(dyn->tempModel, dyn->origModel, NLMODEL_HEADER(dyn->origModel)->unk4->modelSize);
            // responsible for warping vertices in the Bonus Wave model
            u_apply_func_to_naomi_model_vertices(dyn->tempModel, dyn->posNrmTexFunc,
                                                 dyn->posColorTexFunc);
            dyn++;
        }
    }

    if (!(lbl_80206DEC.unk1C & 1))
        lbl_80206DEC.unk0++;
}

void ev_stage_dest(void)
{
    if (previewLoaded)
        preview_free(&stagePreview);
}

struct GMAModel *stage_find_model(struct GMA *gma, char *name)
{
    struct GMAModelEntry *entry;
    int numModels;

    if (gma == NULL2)
        return NULL;
    entry = gma->modelEntries;
    numModels = gma->numModels;
    while (numModels > 0)
    {
        if (strcmp(entry->name, name) == 0)
            return entry->modelOffset;
        numModels--;
        entry++;
    }
    return NULL;
}

void find_blur_bridge_accordion(void)
{
    blurBridgeAccordion = stage_find_model(decodedStageGmaPtr, "MOT_STAGE101_BLUR");
}

void draw_blur_bridge_accordions(void)
{
    float t;
    float f30;
    struct AnimGroupInfo *animGroup;
    struct StageAnimGroup *stageAg;
    int i;

    if (blurBridgeAccordion == NULL2)
        return;
    t = lbl_80206DEC.u_stageTimer / 60.0;
    t += (float)decodedStageLzPtr->loopStartSeconds;
    f30 = (float)(decodedStageLzPtr->loopEndSeconds - decodedStageLzPtr->loopStartSeconds);
    t -= f30 * mathutil_floor(t / f30);
    t += (float)decodedStageLzPtr->loopStartSeconds;
    animGroup = &animGroups[1];
    stageAg = decodedStageLzPtr->animGroups + 1;
    for (i = 1; i < decodedStageLzPtr->animGroupCount; i++, animGroup++, stageAg++)
    {
        if (stageAg->unk7C > 0 && stageAg->anim != NULL2)
        {
            u32 r28;
            Vec sp10;
            float f27 = animGroup->pos.x;

            f30 = f27;
            if (stageAg->anim->posXKeyframes != NULL2)
                f30 = interpolate_keyframes(stageAg->anim->posXKeyframeCount,
                                            stageAg->anim->posXKeyframes,
                                            t - 0.5);
            mathutil_mtxA_from_mtx(mathutilData->mtxB);
            if (f30 < f27)
            {
                sp10.x = 0.5 * (f30 + f27) - 1.0;
                f30 = f27 - f30;
                r28 = 0;
            }
            else
            {
                sp10.x = 1.0 + 0.5 * (f30 + f27);
                f30 = f30 - f27;
                r28 = 1;
            }
            sp10.y = animGroup->pos.y;
            sp10.z = animGroup->pos.z;
            mathutil_mtxA_translate(&sp10);
            if (r28)
                mathutil_mtxA_rotate_y(-0x8000);
            mathutil_mtxA_scale_xyz(0.5 * f30, 1.0f, 1.0f);
            GXLoadPosMtxImm(mathutilData->mtxA, 0);
            GXLoadNrmMtxImm(mathutilData->mtxA, 0);
            avdisp_draw_model_culled_sort_translucent(blurBridgeAccordion);
        }
    }
}

void animate_anim_groups(float a)
{
    float timeSeconds;
    float f30;
    float f3;
    struct AnimGroupInfo *animGroup;
    struct StageAnimGroup *stageAg;
    struct StageAnimGroupAnim *anim;
    int i;

    if (gamePauseStatus & 0xA)
        return;
    lbl_80206DEC.u_stageTimer = a;
    lbl_80206DEC.unk0 = a;
    timeSeconds = lbl_80206DEC.u_stageTimer / 60.0;
    timeSeconds += decodedStageLzPtr->loopStartSeconds;
    f3 = (float)(decodedStageLzPtr->loopEndSeconds - decodedStageLzPtr->loopStartSeconds);
    timeSeconds -= f3 * mathutil_floor(timeSeconds / f3);
    timeSeconds += decodedStageLzPtr->loopStartSeconds;
    animGroup = animGroups;
    stageAg = decodedStageLzPtr->animGroups;
    for (i = 0; i < decodedStageLzPtr->animGroupCount; i++, animGroup++, stageAg++)
    {
        anim = stageAg->anim;
        if (anim != NULL2)
        {
            if (anim->rotXKeyframes != NULL2)
            {
                animGroup->prevRot.x = animGroup->rot.x;
                animGroup->rot.x = DEGREES_TO_S16(interpolate_keyframes(
                    anim->rotXKeyframeCount, anim->rotXKeyframes, timeSeconds));
            }
            if (anim->rotYKeyframes != NULL2)
            {
                animGroup->prevRot.y = animGroup->rot.y;
                animGroup->rot.y = DEGREES_TO_S16(interpolate_keyframes(
                    anim->rotYKeyframeCount, anim->rotYKeyframes, timeSeconds));
            }
            if (anim->rotZKeyframes != NULL2)
            {
                animGroup->prevRot.z = animGroup->rot.z;
                animGroup->rot.z = DEGREES_TO_S16(interpolate_keyframes(
                    anim->rotZKeyframeCount, anim->rotZKeyframes, timeSeconds));
            }
            if (anim->posXKeyframes != NULL2)
            {
                animGroup->prevPos.x = animGroup->pos.x;
                animGroup->pos.x = interpolate_keyframes(anim->posXKeyframeCount,
                                                         anim->posXKeyframes, timeSeconds);
            }
            if (anim->posYKeyframes != NULL2)
            {
                animGroup->prevPos.y = animGroup->pos.y;
                animGroup->pos.y = interpolate_keyframes(anim->posYKeyframeCount,
                                                         anim->posYKeyframes, timeSeconds);
            }
            if (anim->posZKeyframes != NULL2)
            {
                animGroup->prevPos.z = animGroup->pos.z;
                animGroup->pos.z = interpolate_keyframes(anim->posZKeyframeCount,
                                                         anim->posZKeyframes, timeSeconds);
            }
            mathutil_mtxA_from_translate(&animGroup->pos);
            mathutil_mtxA_rotate_z(animGroup->rot.z);
            mathutil_mtxA_rotate_y(animGroup->rot.y);
            mathutil_mtxA_rotate_x(animGroup->rot.x - stageAg->initRot.x);
            mathutil_mtxA_rotate_y(-stageAg->initRot.y);
            mathutil_mtxA_rotate_z(-stageAg->initRot.z);
            mathutil_mtxA_translate_neg(&stageAg->initPos);
            mathutil_mtxA_to_mtx(animGroup->transform);
            mathutil_mtx_copy(animGroup->prevTransform, animGroup->transform);
        }
    }
}

void u_initialize_stage_dyn_part_info(void)
{
    struct DynamicStagePart *dyn;
    struct
    {
        u8 filler0[0x5C];
        s8 unk5C;
        u8 filler65[0xC9 - 0x5D];
    } useless;

    memset(&useless, 0, sizeof(useless));

    // for Bonus Wave
    dyn = &lbl_80206D00[useless.unk5C];
    dyn->modelName = "SHAPE_STAGE134";
    dyn->posNrmTexFunc = u_bonus_wave_warp_callback_1;
    dyn->posColorTexFunc = u_bonus_wave_warp_callback_2;
    dyn->raycastDownFunc = bonus_wave_raycast_down;
    useless.unk5C++;

    // end of list
    lbl_80206D00[useless.unk5C].modelName = NULL;
}

void func_8004482C(void)
{
    struct AnimGroupInfo *animGroup;
    struct StageAnimGroup *stageAg;
    int i;

    animGroup = animGroups;
    stageAg = decodedStageLzPtr->animGroups;
    for (i = 0; i < 0x48; i++, animGroup++, stageAg++)
    {
        animGroup->pos.x = stageAg->initPos.x;
        animGroup->pos.y = stageAg->initPos.y;
        animGroup->pos.z = stageAg->initPos.z;
        animGroup->prevPos.x = stageAg->initPos.x - stageAg->unkB8.x;
        animGroup->prevPos.y = stageAg->initPos.y - stageAg->unkB8.y;
        animGroup->prevPos.z = stageAg->initPos.z - stageAg->unkB8.z;
        animGroup->rot.x = stageAg->initRot.x;
        animGroup->rot.y = stageAg->initRot.y;
        animGroup->rot.z = stageAg->initRot.z;
        animGroup->prevRot.x = stageAg->initRot.x;
        animGroup->prevRot.y = stageAg->initRot.y;
        animGroup->prevRot.z = stageAg->initRot.z;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_to_mtx(animGroup->transform);
        mathutil_mtxA_translate_neg(&stageAg->unkB8);
        mathutil_mtxA_to_mtx(animGroup->prevTransform);
    }
}

void func_80044920(void)
{
}

struct NaomiModel *u_mapModels[0x48];

void load_stage(int stageId)
{
    s8 stageEvState = eventInfo[EVENT_STAGE].state;
    s8 bgEvState = eventInfo[EVENT_BACKGROUND].state;
    int bgChanged = FALSE;

    if (stageEvState != EV_STATE_INACTIVE)
        event_finish(EVENT_STAGE);
    if (bgEvState != EV_STATE_INACTIVE)
        event_finish(EVENT_BACKGROUND);
    if (loadedStageId != stageId)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(stageHeap);

        if (decodedStageTplPtr != NULL || decodedStageGmaPtr != NULL)
        {
            VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
            VIWaitForRetrace();
        }
        if (decodedStageTplPtr != NULL)
        {
            free_tpl(decodedStageTplPtr);
            decodedStageTplPtr = NULL;
        }
        if (decodedStageGmaPtr != NULL)
        {
            free_gma(decodedStageGmaPtr);
            decodedStageGmaPtr = NULL;
        }
        free_nlobj(&naomiStageObj, &naomiStageTpl);
        free_stagedef();

        OSSetCurrentHeap(oldHeap);
    }
    if (backgroundInfo.bgId != get_stage_background(stageId))
    {
        func_8005507C();
        bgChanged = TRUE;
    }
    load_stage_files(stageId);
    load_bg_files(get_stage_background(stageId));
    if (loadedStageId != stageId || bgChanged)
    {
        animGroupCount =
            decodedStageLzPtr->animGroupCount < 0x48 ? decodedStageLzPtr->animGroupCount : 0x48;
        if (gamePauseStatus & (1 << 2))
            printf("========== st%03d ============\n", stageId);
        func_80044E18();
        func_80045194();
        func_80084794(u_mapModels);
        u_initialize_stuff_for_dynamic_stage_parts(stageId);
        compute_stage_bounding_sphere();
        loadedStageId = stageId;
    }
    light_init(stageId);
    u_init_bg_fog_params();
    currStageId = stageId;
    if (stageEvState != EV_STATE_INACTIVE)
        event_start(EVENT_STAGE);
    if (bgEvState != EV_STATE_INACTIVE)
        event_start(EVENT_BACKGROUND);
}

void unload_stage(void)
{
    if (loadedStageId != -1)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(stageHeap);

        if (decodedStageTplPtr != NULL || decodedStageGmaPtr != NULL)
        {
            VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
            VIWaitForRetrace();
        }
        if (decodedStageTplPtr != NULL)
        {
            free_tpl(decodedStageTplPtr);
            decodedStageTplPtr = NULL;
        }
        if (decodedStageGmaPtr != NULL)
        {
            free_gma(decodedStageGmaPtr);
            decodedStageGmaPtr = NULL;
        }
        free_nlobj(&naomiStageObj, &naomiStageTpl);
        free_stagedef();

        OSSetCurrentHeap(oldHeap);

        loadedStageId = -1;
    }
    func_8005507C();
}

// Stages that have Naomi models
u8 naomiStages[] =
{
    ST_010_ARCADE_SPIRAL_HARD,
    ST_019_ARCADE_DIAMOND,
    ST_020_ARCADE_TRACKS,
    ST_030_ARCADE_BRIDGE_MASTER,
    ST_049_ARCADE_NARROW_BRIDGE,
    ST_050_ARCADE_CURL_PIPE,
    ST_060_ARCADE_SANCTUARY,
    ST_070_ARCADE_HITTER,
    ST_080_ARCADE_AV_LOGO,
    ST_092_BONUS_WAVE,
    ST_096_ARCADE_SNAKE,
    ST_097_ARCADE_GEARS,
    ST_098_ARCADE_CONVEYOR_PARTS,
    ST_099_JUNGLE_BG,
    ST_100_ARCADE_POLAR_LARGE,
    ST_114_UNUSED_RINGS_STAGE,
    ST_115_ALTERNATE_EDGE_MASTER,
    ST_116_ALTERNATE_ROLL_MASTER,
    ST_117_ARCADE_CURVES,
    ST_118_ARCADE_JUMP_DOUBLE,
    ST_119_ARCADE_DOWNHILL_HARD,
    ST_120_ARCADE_DODECAGON,
    0xFF,
};

static inline int is_naomi_stage(int stageId)
{
    u8 *pStageId = naomiStages;
    while (*pStageId != 0xFF)
    {
        if (*pStageId == stageId)
            return TRUE;
        pStageId++;
    }
    return FALSE;
}

void preload_stage_files(int stageId)
{
    char stageDir[0x100];
    char gmaName[0x100];
    char tplName[0x100];
    char stageLzName[0x100];

    preload_bg_files(get_stage_background_2(stageId));
    sprintf(stageDir, "st%03d", stageId);
    DVDChangeDir(stageDir);
    sprintf(stageLzName, "STAGE%03d.lz", stageId);
    file_preload(stageLzName);
    sprintf(gmaName, "st%03d.gma", stageId);
    sprintf(tplName, "st%03d.tpl", stageId);
    if (stageId != 190)
    {
        file_preload(gmaName);
        file_preload(tplName);
    }
    if (is_naomi_stage(stageId))
    {
        sprintf(gmaName, "st%03d_p.lz", stageId);
        sprintf(tplName, "st%03d.lz", stageId);
        file_preload(gmaName);
        file_preload(tplName);
    }
    DVDChangeDir("/test");
}

void load_stage_files(int stageId)
{
    char stageDir[0x100];
    char gmaName[0x100];
    char tplName[0x100];

    if (loadedStageId != stageId)
    {
        OSHeapHandle oldHeap;

        lbl_802F099C = stageId;
        sprintf(stageDir, "st%03d", stageId);
        DVDChangeDir(stageDir);
        oldHeap = OSSetCurrentHeap(stageHeap);

        // Load stagedef (.lz) file
        load_stagedef(stageId);

        // Load GMA/TPL files
        if (stageId != ST_190_DUMMY)
        {
            sprintf(gmaName, "st%03d.gma", stageId);
            sprintf(tplName, "st%03d.tpl", stageId);
            decodedStageTplPtr = load_tpl(tplName);
            decodedStageGmaPtr = load_gma(gmaName, decodedStageTplPtr);
        }

        // Load Naomi models and textures
        if (is_naomi_stage(stageId))
        {
            sprintf(gmaName, "st%03d_p.lz", stageId);
            sprintf(tplName, "st%03d.lz", stageId);
            load_nlobj(&naomiStageObj, &naomiStageTpl, gmaName, tplName);
        }
        OSSetCurrentHeap(oldHeap);
        DVDChangeDir("/test");
    }
}

struct Struct802099E8
{
    u32 *unk0;
    void *unk4;
    s32 unk8;
};

struct Struct80209D48 // maybe StageModel?
{
    u32 unk0;
    void *unk4;
    float unk8;
};

struct NaomiModel *lbl_80209488[0x48];
struct NaomiModel *lbl_802095A8[0x110];
struct Struct802099E8 lbl_802099E8[0x48];
struct Struct80209D48 lbl_80209D48[0x80];
struct Struct8020A348 lbl_8020A348[0x48];
struct Struct80209D48 lbl_8020A588[0x80];
struct Struct8020A348 lbl_8020AB88[0x48];

FORCE_BSS_ORDER(lbl_80209488)
FORCE_BSS_ORDER(lbl_802095A8)
FORCE_BSS_ORDER(lbl_802099E8)

static struct NaomiObj **naomiObjList[] = {&naomiStageObj, &naomiCommonObj, NULL};

void func_80044E18_inline(struct Struct8020A348 *r7)
{
    //struct Struct8020A348 *r7;
    int i;
    struct StageAnimGroup *ag;
    int r4;

    r4 = 0;
    ag = decodedStageLzPtr->animGroups;
    //r7 = lbl_8020A348;
    for (i = 0; i < animGroupCount; i++, r7++, ag++)
    {
        r7->unk0 = (void *)&lbl_80209D48[r4];
        r7->unk4 = ag->unk7C;
        r4 += ag->unk7C;
    }
}

static int string_match_len(char *a, char *b);

void func_80044E18(void)
{
    int j;
    struct StageAnimGroup *ag;
    char **nameIter;
    int i;
    int r19;
    struct NaomiModel *model1;
    struct NaomiModel **r17;
    struct NaomiObj ***objIter;
    struct Struct80209D48 *r17_;
    int r30_;
    struct StageModel *r18_;
    struct NaomiModel **modelPtrs;
    struct NaomiModel *model2;
    struct NaomiModel **r30;
    struct NaomiModel **r29;
    u8 dummy2[4];
    char mapObjName[0x100];
    u8 dummy[8];

    r17 = lbl_80209488;
    r30 = u_mapModels;
    r29 = lbl_802095A8;
    r19 = 0;
    lbl_802F1F50 = 0;

    ag = decodedStageLzPtr->animGroups;
    for (i = 0; i < animGroupCount; i++, ag++)
    {
        lbl_802099E8[i].unk0 = (void *)r17;
        lbl_802099E8[i].unk4 = r30;
        lbl_802099E8[i].unk8 = 0;

        nameIter = ag->modelNames;
        while (*nameIter != NULL)
        {
            model1 = NULL;
            strncpy(mapObjName, *nameIter, sizeof(mapObjName) - 4);
            strncat(mapObjName, "_MAP", sizeof(mapObjName));  //! BUG: n is the number of chars to copy, not the total size of the buffer
            model2 = NULL;

            objIter = naomiObjList;
            while (*objIter != NULL)
            {
                if (**objIter != NULL)
                {
                    modelPtrs = (**objIter)->modelPtrs;
                    for (j = 0; modelPtrs[j] != NULL; j++)
                    {
                        if (strcmp(*nameIter, (void *)(NLMODEL_HEADER(modelPtrs[j])->unk0->name)) == 0)
                        {
                            model1 = modelPtrs[j];
                            break;
                        }
                    }
                }
                objIter++;
            }

            objIter = naomiObjList;
            while (*objIter != NULL)
            {
                if (**objIter != NULL)
                {
                    modelPtrs = (**objIter)->modelPtrs;
                    for (j = 0; modelPtrs[j] != NULL; j++)
                    {
                        if (strcmp(mapObjName, (void *)(NLMODEL_HEADER(modelPtrs[j])->unk0->name)) == 0)
                        {
                            model2 = modelPtrs[j];
                            break;
                        }
                    }
                }
                objIter++;
            }

            if (model2 == NULL)
                model2 = model1;
            if (model2 != NULL)
            {
                *r30++ = model2;
                if (model2 != model1)
                    *r29++ = model2;
            }
            if (model1 != NULL)
            {
                *r17++ = model1;
                *r29++ = model1;
                r19++;
                lbl_802F1F50 += NLMODEL_HEADER(model1)->unk4->modelSize;
                lbl_802099E8[i].unk8++;
                if (r19 >= 0x47)
                    break;
            }
            nameIter++;
        }
    }
    *r17 = NULL;
    *r30 = NULL;

    r17_ = lbl_80209D48;
    r30_ = decodedStageLzPtr->lvlModelsCount < 0x80 ? decodedStageLzPtr->lvlModelsCount : 0x80;

    lbl_802F1F4C = 0;
    r18_ = decodedStageLzPtr->lvlModels;
    for (i = 0; i < r30_; i++, r17_++, r18_++)
    {
        int r19_;

        objIter = naomiObjList;
        model2 = NULL;
        r19_ = 0;

        while (*objIter != NULL)
        {
            if (**objIter != NULL)
            {
                modelPtrs = (**objIter)->modelPtrs;
                for (j = 0; modelPtrs[j] != NULL; j++)
                {
                    int len = string_match_len((void *)r18_->nameOffset, NLMODEL_HEADER(modelPtrs[j])->unk0->name);
                    if (len > r19_)
                    {
                        r19_ = len;
                        model2 = modelPtrs[j];
                    }
                }
            }
            objIter++;
        }
        r17_->unk0 = r18_->unk0;
        r17_->unk8 = r18_->unk8;
        if (model2 != NULL)
        {
            r17_->unk4 = model2;
            *r29++ = model2;
            if ((r17_->unk0 & 3) == 1)
                lbl_802F1F4C += NLMODEL_HEADER(model2)->unk4->modelSize;
        }
        else
            r17_->unk4 = NULL;
    }
    func_80044E18_inline(lbl_8020A348);
    *r29 = NULL;
}

static struct GMA **gmaList[] = {&decodedStageGmaPtr, &decodedBgGma, NULL};

static struct GMAModel *find_model_in_gma_list(char *name)
{
    struct GMA ***list;
    struct GMAModel *model = NULL;
    int i;

    list = gmaList;
    while (*list != NULL)
    {
        if (**list != NULL)
        {
            for (i = 0; i < (int)(**list)->numModels; i++)
            {
                if (strcmp(name, (**list)->modelEntries[i].name) == 0)
                    model = (**list)->modelEntries[i].modelOffset;
            }
        }
        list++;
    }
    return model;
}

static struct GMAModel *find_model_in_gma_list_2(char *name, int start, int len)
{
    struct GMA ***list;
    struct GMAModel *model = NULL;
    int i;

    list = gmaList;
    while (*list != NULL)
    {
        if (**list != NULL)
        {
            for (i = 0; i < (int)(**list)->numModels; i++)
            {
                int match = string_match_len(name, (**list)->modelEntries[i].name + start);
                if (match > len)
                {
                    len = match;
                    model = (**list)->modelEntries[i].modelOffset;
                }
            }
        }
        list++;
    }
    return model;
}

struct GMAModel *goalModels[3];

void func_80045194(void)
{
    struct GMAModel *model;
    int phi_r27;
    int i;
    struct Struct80209D48 *phi_r24;
    struct StageModel *phi_r25;
    struct StageBgModel *phi_r24_2;
    struct StageAnimGroup *ag;
    int phi_r6;
    struct Struct8020A348 *phi_r7;
    int len;

    phi_r24 = lbl_8020A588;
    phi_r27 = MIN(decodedStageLzPtr->lvlModelsCount, 0x80);
    phi_r25 = decodedStageLzPtr->lvlModels;
    for (i = 0; i < phi_r27; i++, phi_r25++, phi_r24++)
    {
        model = find_model_in_gma_list(phi_r25->nameOffset);
        if (model == NULL && (gamePauseStatus & 4))
            printf("warning %s : no match\n", phi_r25->nameOffset);
        phi_r24->unk4 = model;
        phi_r24->unk0 = phi_r25->unk0;
        phi_r24->unk8 = phi_r25->unk8;
    }

    phi_r7 = lbl_8020AB88;
    phi_r6 = 0;
    ag = decodedStageLzPtr->animGroups;
    for (i = 0; i < animGroupCount; i++, phi_r7++)
    {
        phi_r7->unk0 = (void *)&lbl_8020A588[phi_r6];
        phi_r7->unk4 = ag->unk7C;
        phi_r6 += ag->unk7C;
        ag++;
    }

    phi_r24_2 = decodedStageLzPtr->bgModels;
    for (i = 0; i < decodedStageLzPtr->bgModelsCount; i++, phi_r24_2++)
    {
        model = find_model_in_gma_list(phi_r24_2->name);
        if (model == NULL && (gamePauseStatus & 4))
            printf("warning BG %s : no match\n", phi_r24_2->name);
        phi_r24_2->model = model;
    }

    phi_r24_2 = decodedStageLzPtr->fgModels;
    for (i = 0; i < decodedStageLzPtr->fgModelCount; i++, phi_r24_2++)
    {
        model = find_model_in_gma_list(phi_r24_2->name);
        if (model == NULL && (gamePauseStatus & 4))
            printf("warning MV %s : no match\n", phi_r24_2->name);
        phi_r24_2->model = model;
    }

    for (i = 0; i < 3; i++)
    {
        len = strlen(goalModelNames[i]) - 1;
        goalModels[i] = find_model_in_gma_list_2(goalModelNames[i], 4, len);
    }

    len = strlen("BOX") - 1;
    u_stageBoxModel = find_model_in_gma_list_2("BOX", 4, len);
}

struct GMAModel *find_stage_or_bg_model(char *name)
{
    return find_model_in_gma_list(name);
}

void u_initialize_stuff_for_dynamic_stage_parts(int stageId)
{
    int r5;
    struct Struct802F0990 *r6;
    struct DynamicStagePart *dyn;
    int i;
    u8 *r31;

    r6 = &lbl_802F0990[0];
    r5 = 1;
    r31 = (u8 *)lbl_802F1B4C + 0x10000;
    if (lbl_802F0990[0].stageId != stageId)
    {
        r5 = 0;
        r6++;
    }
    if (r5 <= 0)
    {
        dynamicStageParts = NULL;
        return;
    }
    dynamicStageParts = r6->unk4;

    dyn = dynamicStageParts;
    while (dyn->modelName != NULL)
    {
        int r27;
        struct NaomiModel *model;
        struct NaomiObj ***objIter;

        model = NULL;
        r27 = 0;
        objIter = &naomiObjList[0];
        while (*objIter != NULL)
        {
            struct NaomiObj *nobj = **objIter;
            if (nobj != NULL)
            {
                struct NaomiModel **modelPtrs = nobj->modelPtrs;
                for (i = 0; modelPtrs[i] != NULL; i++)
                {
                    int var =
                        string_match_len(dyn->modelName, NLMODEL_HEADER(modelPtrs[i])->unk0->name);
                    if (var > r27)
                    {
                        r27 = var;
                        model = modelPtrs[i];
                    }
                }
                dyn->origModel = model;
                if (model != NULL)
                {
                    r31 -= NLMODEL_HEADER(model)->unk4->modelSize;
                    dyn->tempModel = (struct NaomiModel *)r31;
                }
            }
            objIter++;
        }
        dyn++;
    }
}

static int string_match_len(char *a, char *b)
{
    int len = 0;
    while (*a == *b)
    {
        len++;
        if (*a == 0 || *b == 0)
            break;
        a++;
        b++;
    }
    return len;
}

// Called for each vertex in the Bonus Wave floor model.
// Modifies the y coordinate and normal vector
void u_bonus_wave_warp_callback_1(struct NaomiVtxWithNormal *vtxp)
{
    struct NaomiVtxWithNormal vtx = *vtxp;
    float dstFromOrigin;
    float amplitude;
    float f2;
    int angle;
    Vec spC;

    // Calculate y position of vertex
    dstFromOrigin = mathutil_sqrt(vtx.x * vtx.x + vtx.z * vtx.z);
    amplitude = 0.5 + -0.030833333333333333 * dstFromOrigin;
    f2 = -1092.0f;
    f2 *= (lbl_80206DEC.u_stageTimer - 30.0f);
    angle = 16384.0 * dstFromOrigin;
    angle = f2 + angle;
    if (angle > 0)
        return;
    spC.x = vtx.x;
    spC.y = 0.0f;
    spC.z = vtx.z;
    vtx.y += mathutil_sin(angle) * amplitude;

    // Calculate normal vector
    mathutil_vec_set_len(&spC, &spC, -(mathutil_cos(angle) * amplitude));
    if (angle > -16384)
    {
        float f0 = angle * -6.103515625e-05f;
        spC.x *= f0;
        spC.z *= f0;
    }
    vtx.nx += spC.x;
    vtx.nz += spC.z;
    mathutil_vec_normalize_len((Vec *)&vtx.nx); // TODO: make this a Vec?
    *vtxp = vtx;
}

// does the same as u_bonus_wave_warp_callback_1, but doesn't calculate normals
void u_bonus_wave_warp_callback_2(struct NaomiVtxWithColor *vtxp)
{
    struct NaomiVtxWithColor vtx = *vtxp;
    float dstFromOrigin;
    float amplitude;
    float f2;
    int angle;

    // Calculate y position of vertex
    dstFromOrigin = mathutil_sqrt(vtx.x * vtx.x + vtx.z * vtx.z);
    amplitude = 0.5 + -0.030833333333333333 * dstFromOrigin;
    f2 = -1092.0f;
    f2 *= (lbl_80206DEC.u_stageTimer - 30.0f);
    angle = 16384.0 * dstFromOrigin;
    angle = f2 + angle;
    if (angle > 0)
        return;
    vtx.y += mathutil_sin(angle) * amplitude;
    *vtxp = vtx;
}

u32 bonus_wave_raycast_down(Point3d *rayOrigin, Point3d *outHitPos, Vec *outHitNormal)
{
    float f1;
    float f31;
    float f2;
    int r3;
    int angle;
    Vec sp14;

    if (rayOrigin->x < -10.01 || rayOrigin->x > 10.01)
        return 0;
    if (rayOrigin->z < -10.01 || rayOrigin->z > 10.01)
        return 0;

    f1 = mathutil_sqrt(rayOrigin->x * rayOrigin->x + rayOrigin->z * rayOrigin->z);
    f31 = 0.5 + -0.030833333333333333 * f1;
    f2 = -1092.0f;
    f2 *= (lbl_80206DEC.u_stageTimer - 30.0f);
    r3 = 16384.0 * f1;
    angle = f2 + r3;
    if (angle > 0)
    {
        outHitPos->x = rayOrigin->x;
        outHitPos->y = 0.0f;
        outHitPos->z = rayOrigin->z;
        if (outHitNormal != NULL)
        {
            outHitNormal->x = 0.0f;
            outHitNormal->y = 1.0f;
            outHitNormal->z = 0.0f;
        }
        return 1;
    }
    outHitPos->x = rayOrigin->x;
    outHitPos->y = mathutil_sin(angle) * f31;
    outHitPos->z = rayOrigin->z;
    if (outHitNormal != NULL)
    {
        float f2;

        outHitNormal->x = 0.0f;
        outHitNormal->y = 1.0f;
        outHitNormal->z = 0.0f;
        sp14.x = rayOrigin->x;
        sp14.z = rayOrigin->z;
        f1 = mathutil_sum_of_sq_2(sp14.x, sp14.z);
        if (f1 <= 1.19209289550781e-07f)
            return 1;
        f2 = -(mathutil_cos(angle) * f31) * mathutil_rsqrt(f1);
        sp14.x *= f2;
        sp14.z *= f2;
        sp14.y = 1.0f;
        f1 = mathutil_sum_of_sq_3(sp14.x, sp14.y, sp14.z);
        if (f1 <= 1.19209289550781e-07f)
            return 1;
        f2 = mathutil_rsqrt(f1);
        sp14.x *= f2;
        sp14.y *= f2;
        sp14.z *= f2;
        outHitNormal->x = sp14.x;
        outHitNormal->y = sp14.y;
        outHitNormal->z = sp14.z;
    }
    return 1;
}

/* Gets the background ID for the given stage ID */
int get_stage_background(int stageId)
{
    int bg;

    if (gameSubmode == SMD_GAME_ENDING_INIT)
    {
        switch (modeCtrl.difficulty)
        {
        case DIFFICULTY_BEGINNER:
            bg = BG_TYPE_BLUESKY_A;
            break;
        case DIFFICULTY_ADVANCED:
            bg = BG_TYPE_SUNSET_C;
            break;
        case DIFFICULTY_EXPERT:
        default:
            bg = BG_TYPE_NIGHT_B;
            break;
        }
    }
    else
        bg = stageBackgrounds[stageId];

    if (bg < 0)
        bg = 0;
    else if (bg > 27)
        bg = 27;
    return bg;
}

/* Does the same thing as get_stage_background, but also some pointless stuff as well */
int get_stage_background_2(int stageId)
{
    int bg;
    int backup = infoWork.unk20;

    infoWork.unk20++;
    bg = get_stage_background(stageId);
    infoWork.unk20 = backup;
    return bg;
}

struct Sphere stageBoundSphere;

void compute_stage_bounding_sphere(void)
{
    Vec min;
    Vec max;
    unsigned int r4 = FALSE;

    if (decodedStageLzPtr->lvlModels == NULL2)
    {
        struct NaomiModel **r3 = (void *)lbl_80209488;

        while (*r3 != NULL)
        {
            struct NaomiModel *model = *r3;

            if (model != NULL2 && model->unk0 >= 0)
            {
                if (!r4)
                {
                    r4 = TRUE;
                    min.x = model->boundSphereCenter.x - model->boundSphereRadius;
                    min.y = model->boundSphereCenter.y - model->boundSphereRadius;
                    min.z = model->boundSphereCenter.z - model->boundSphereRadius;

                    max.x = model->boundSphereCenter.x + model->boundSphereRadius;
                    max.y = model->boundSphereCenter.y + model->boundSphereRadius;
                    max.z = model->boundSphereCenter.z + model->boundSphereRadius;
                }
                else
                {
                    if (model->boundSphereCenter.x - model->boundSphereRadius < min.x)
                        min.x = model->boundSphereCenter.x - model->boundSphereRadius;
                    if (model->boundSphereCenter.y - model->boundSphereRadius < min.y)
                        min.y = model->boundSphereCenter.y - model->boundSphereRadius;
                    if (model->boundSphereCenter.z - model->boundSphereRadius < min.z)
                        min.z = model->boundSphereCenter.z - model->boundSphereRadius;

                    if (model->boundSphereCenter.x + model->boundSphereRadius > max.x)
                        max.x = model->boundSphereCenter.x + model->boundSphereRadius;
                    if (model->boundSphereCenter.y + model->boundSphereRadius > max.y)
                        max.y = model->boundSphereCenter.y + model->boundSphereRadius;
                    if (model->boundSphereCenter.z + model->boundSphereRadius > max.z)
                        max.z = model->boundSphereCenter.z + model->boundSphereRadius;
                }
            }
            r3++;
        }
    }
    else if (decodedStageGmaPtr == NULL2)
    {
        struct Struct8020A348 *r3 = lbl_8020A348;
        int i;

        for (i = 0; i < animGroupCount; i++, r3++)
        {
            struct Struct8020A348_child *r5 = r3->unk0;
            int r6;
            for (r6 = 0; r6 < r3->unk4; r6++, r5++)
            {
                struct NaomiModel *model = (void *)r5->model;

                if (model != NULL2 && model->unk0 >= 0)
                {
                    if (!r4)
                    {
                        r4 = TRUE;
                        min.x = model->boundSphereCenter.x - model->boundSphereRadius;
                        min.y = model->boundSphereCenter.y - model->boundSphereRadius;
                        min.z = model->boundSphereCenter.z - model->boundSphereRadius;

                        max.x = model->boundSphereCenter.x + model->boundSphereRadius;
                        max.y = model->boundSphereCenter.y + model->boundSphereRadius;
                        max.z = model->boundSphereCenter.z + model->boundSphereRadius;
                    }
                    else
                    {
                        if (model->boundSphereCenter.x - model->boundSphereRadius < min.x)
                            min.x = model->boundSphereCenter.x - model->boundSphereRadius;
                        if (model->boundSphereCenter.y - model->boundSphereRadius < min.y)
                            min.y = model->boundSphereCenter.y - model->boundSphereRadius;
                        if (model->boundSphereCenter.z - model->boundSphereRadius < min.z)
                            min.z = model->boundSphereCenter.z - model->boundSphereRadius;

                        if (model->boundSphereCenter.x + model->boundSphereRadius > max.x)
                            max.x = model->boundSphereCenter.x + model->boundSphereRadius;
                        if (model->boundSphereCenter.y + model->boundSphereRadius > max.y)
                            max.y = model->boundSphereCenter.y + model->boundSphereRadius;
                        if (model->boundSphereCenter.z + model->boundSphereRadius > max.z)
                            max.z = model->boundSphereCenter.z + model->boundSphereRadius;
                    }
                }
            }
        }
    }
    else
    {
        struct Struct8020A348 *r3 = lbl_8020AB88;
        int i;

        for (i = 0; i < animGroupCount; i++, r3++)
        {
            struct Struct8020A348_child *r5 = r3->unk0;
            int r6;

            for (r6 = 0; r6 < r3->unk4; r6++, r5++)
            {
                struct GMAModel *model = r5->model;

                if (model != NULL2)
                {
                    if (!r4)
                    {
                        r4 = TRUE;
                        min.x = model->boundSphereCenter.x - model->boundSphereRadius;
                        min.y = model->boundSphereCenter.y - model->boundSphereRadius;
                        min.z = model->boundSphereCenter.z - model->boundSphereRadius;

                        max.x = model->boundSphereCenter.x + model->boundSphereRadius;
                        max.y = model->boundSphereCenter.y + model->boundSphereRadius;
                        max.z = model->boundSphereCenter.z + model->boundSphereRadius;
                    }
                    else
                    {
                        if (model->boundSphereCenter.x - model->boundSphereRadius < min.x)
                            min.x = model->boundSphereCenter.x - model->boundSphereRadius;
                        if (model->boundSphereCenter.y - model->boundSphereRadius < min.y)
                            min.y = model->boundSphereCenter.y - model->boundSphereRadius;
                        if (model->boundSphereCenter.z - model->boundSphereRadius < min.z)
                            min.z = model->boundSphereCenter.z - model->boundSphereRadius;

                        if (model->boundSphereCenter.x + model->boundSphereRadius > max.x)
                            max.x = model->boundSphereCenter.x + model->boundSphereRadius;
                        if (model->boundSphereCenter.y + model->boundSphereRadius > max.y)
                            max.y = model->boundSphereCenter.y + model->boundSphereRadius;
                        if (model->boundSphereCenter.z + model->boundSphereRadius > max.z)
                            max.z = model->boundSphereCenter.z + model->boundSphereRadius;
                    }
                }
            }
        }
    }

    if (r4)
    {
        Vec sp8;

        stageBoundSphere.pos.x = (max.x + min.x) * 0.5;
        stageBoundSphere.pos.y = (max.y + min.y) * 0.5;
        stageBoundSphere.pos.z = (max.z + min.z) * 0.5;

        sp8.x = (max.x - min.x) * 0.5;
        sp8.y = (max.y - min.y) * 0.5;
        sp8.z = (max.z - min.z) * 0.5;
        stageBoundSphere.radius = mathutil_sqrt(mathutil_sum_of_sq_3(sp8.x, sp8.y, sp8.z));
    }
    else
    {
        stageBoundSphere.pos.x = 0.0f;
        stageBoundSphere.pos.y = 0.0f;
        stageBoundSphere.pos.z = 0.0f;
        stageBoundSphere.radius = 50.0f;
    }
}

void func_800463E8(Vec *a, float *b)
{
    Vec aabbMin;
    Vec aabbMax;
    Vec v;
    Vec aabbCenter;
    Vec sp34;
    Vec sp28;
    Vec center_rt_world;
    Vec sp10;
    float result;

    aabbMin.x = 0.0f;
    aabbMin.y = 0.0f;
    aabbMin.z = 0.0f;
    aabbMax.x = 0.0f;
    aabbMax.y = 0.0f;
    aabbMax.z = 0.0f;

    if (decodedStageGmaPtr != NULL)
    {
        struct AnimGroupInfo *animGroup = animGroups;
        struct Struct8020A348 *iter2 = lbl_8020AB88;
        int j;
        int i;

        for (i = 0; i < animGroupCount; i++, iter2++, animGroup++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(animGroup->transform);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->flags & 3) == 1 && iter3->model != NULL)
                {
                    float f;
                    struct GMAModel *r28 = iter3->model;

                    mathutil_mtxA_tf_point(&r28->boundSphereCenter, &sp34);
                    f = r28->boundSphereRadius;
                    v.x = sp34.x - f;
                    v.y = sp34.y - f;
                    v.z = sp34.z - f;
                    if (aabbMin.x > v.x)
                        aabbMin.x = v.x;
                    if (aabbMin.y > v.y)
                        aabbMin.y = v.y;
                    if (aabbMin.z > v.z)
                        aabbMin.z = v.z;

                    v.x = sp34.x + f;
                    v.y = sp34.y + f;
                    v.z = sp34.z + f;
                    if (aabbMax.x < v.x)
                        aabbMax.x = v.x;
                    if (aabbMax.y < v.y)
                        aabbMax.y = v.y;
                    if (aabbMax.z < v.z)
                        aabbMax.z = v.z;
                }
            }
        }
        aabbCenter.x = (aabbMin.x + aabbMax.x) * 0.5f;
        aabbCenter.y = (aabbMin.y + aabbMax.y) * 0.5f;
        aabbCenter.z = (aabbMin.z + aabbMax.z) * 0.5f;

        result = 0.0f;
        animGroup = animGroups;
        iter2 = lbl_8020AB88;
        for (i = 0; i < animGroupCount; i++, iter2++, animGroup++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(animGroup->transform);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->flags & 3) == 1)
                {
                    float var1;
                    float f0;
                    struct GMAModel *r28 = iter3->model;

                    if (iter3->model == NULL)
                        continue;
                    mathutil_mtxA_tf_point(&r28->boundSphereCenter, &sp28);
                    var1 = r28->boundSphereRadius;
                    f0 = var1 + mathutil_sqrt((aabbCenter.x - sp28.x) * (aabbCenter.x - sp28.x) +
                                              (aabbCenter.z - sp28.z) * (aabbCenter.z - sp28.z));
                    if (result < f0)
                        result = f0;
                }
            }
        }
        result *= 0.75f;

        *a = aabbCenter;
        *b = result;
    }
    else if (decodedStageLzPtr != NULL && decodedStageLzPtr->lvlModels != NULL)
    {
        struct AnimGroupInfo *animGroup = animGroups;
        struct Struct8020A348 *iter2 = lbl_8020A348;
        int j;
        int i;

        for (i = 0; i < animGroupCount; i++, iter2++, animGroup++)
        {
            struct Struct8020A348_child *iter3;
            mathutil_mtxA_from_mtx(animGroup->transform);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->flags & 3) == 1 && iter3->model != NULL)
                {
                    float r;
                    struct GMAModel *model = iter3->model;

                    mathutil_mtxA_tf_point(&model->boundSphereCenter, &center_rt_world);
                    r = model->boundSphereRadius;
                    v.x = center_rt_world.x - r;
                    v.y = center_rt_world.y - r;
                    v.z = center_rt_world.z - r;
                    if (aabbMin.x > v.x)
                        aabbMin.x = v.x;
                    if (aabbMin.y > v.y)
                        aabbMin.y = v.y;
                    if (aabbMin.z > v.z)
                        aabbMin.z = v.z;

                    v.x = center_rt_world.x + r;
                    v.y = center_rt_world.y + r;
                    v.z = center_rt_world.z + r;
                    if (aabbMax.x < v.x)
                        aabbMax.x = v.x;
                    if (aabbMax.y < v.y)
                        aabbMax.y = v.y;
                    if (aabbMax.z < v.z)
                        aabbMax.z = v.z;
                }
            }
        }
        aabbCenter.x = (aabbMin.x + aabbMax.x) * 0.5f;
        aabbCenter.y = (aabbMin.y + aabbMax.y) * 0.5f;
        aabbCenter.z = (aabbMin.z + aabbMax.z) * 0.5f;

        result = 0.0f;
        animGroup = animGroups;
        iter2 = lbl_8020A348;
        for (i = 0; i < animGroupCount; i++, iter2++, animGroup++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(animGroup->transform);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->flags & 3) == 1)
                {
                    float var1;
                    float f0;
                    struct NaomiModel *model = (void *)iter3->model;

                    if (iter3->model == NULL)
                        continue;
                    mathutil_mtxA_tf_point(&model->boundSphereCenter, &sp10);
                    var1 = func_80046884(model);
                    f0 = var1 + mathutil_sqrt((aabbCenter.x - sp10.x) * (aabbCenter.x - sp10.x) +
                                              (aabbCenter.z - sp10.z) * (aabbCenter.z - sp10.z));
                    if (result < f0)
                        result = f0;
                }
            }
        }

        *a = aabbCenter;
        *b = result;
    }
    else
    {
        a->x = 0.0f;
        a->y = 0.0f;
        a->z = 0.0f;
        *b = 50.0f;
    }
}

struct
{
    Vec unk0;
    float unkC;
    float unk10;
    u8 filler14[0x1C - 0x14];
} lbl_8020ADE4;
FORCE_BSS_ORDER(lbl_8020ADE4)

extern void u_some_stage_vtx_callback_1();
extern void u_some_stage_vtx_callback_2();

float func_80046884(struct NaomiModel *model)
{
    lbl_8020ADE4.unk0 = model->boundSphereCenter;
    lbl_8020ADE4.unkC = 0.0f;
    lbl_8020ADE4.unk10 = 0.0f;
    u_apply_func_to_naomi_model_vertices(model, u_some_stage_vtx_callback_1,
                                         u_some_stage_vtx_callback_2);
    return lbl_8020ADE4.unk10;
}

void u_some_stage_vtx_callback_1(Point3d *vtx)
{
    Vec spC;
    float f1;

    spC.x = vtx->x - lbl_8020ADE4.unk0.x;
    spC.z = vtx->z - lbl_8020ADE4.unk0.z;
    spC.y = 0.0f;
    f1 = mathutil_vec_sq_len(&spC);
    if (f1 < lbl_8020ADE4.unkC)
        return;
    lbl_8020ADE4.unkC = f1;
    lbl_8020ADE4.unk10 = mathutil_sqrt(f1);
}

void u_some_stage_vtx_callback_2(Point3d *vtx) // duplicate of u_some_stage_vtx_callback_1
{
    Vec spC;
    float f1;

    spC.x = vtx->x - lbl_8020ADE4.unk0.x;
    spC.z = vtx->z - lbl_8020ADE4.unk0.z;
    spC.y = 0.0f;
    f1 = mathutil_vec_sq_len(&spC);
    if (f1 < lbl_8020ADE4.unkC)
        return;
    lbl_8020ADE4.unkC = f1;
    lbl_8020ADE4.unk10 = mathutil_sqrt(f1);
}

u8 lbl_801B87FC[] = {1, 1, 1, 1, 1, 1, 3, 4, 4, 4, 1, 2, 7, 6, 5, 0};

u8 lbl_8020AE00[0x20] __attribute__((aligned(32)));
FORCE_BSS_ORDER(lbl_8020AE00)

// parameters swapped?
#undef OFFSET_TO_PTR
#define OFFSET_TO_PTR(base, offset) (void *)((u32)(offset) + (u32)(base))

void load_stagedef(int stageId)
{
    struct File file;
    char filename[32];
    u8 unused[8];
    u32 compSize;
    u32 uncompSize;
    void *compData;
    void *uncompData;
    struct StageAnimGroup *coll;
    int i;

    sprintf(filename, "STAGE%03d.lz", stageId);

    if (!file_open(filename, &file))
        OSPanic("stage.c", 1960, "cannot Open");

    // Read LZSS header
    if (file_read(&file, lbl_8020AE00, 32, 0) < 0)
        OSPanic("stage.c", 1962, "cannot Read");
    compSize = OSRoundUp32B(__lwbrx(lbl_8020AE00, 0));
    uncompSize = OSRoundUp32B(__lwbrx(lbl_8020AE00, 4));

    // Allocate buffers
    uncompData = OSAlloc(uncompSize);
    if (uncompData == NULL)
        OSPanic("stage.c", 1966, "cannot OSAlloc");
    compData = OSAlloc(compSize);
    if (compData == NULL)
        OSPanic("stage.c", 1967, "cannot OSAlloc");

    // Read whole file
    if (file_read(&file, compData, compSize, 0) < 0)
        OSPanic("stage.c", 1969, "cannot Read");
    if (file_close(&file) != 1)
        OSPanic("stage.c", 1970, "cannot Close");

    // Decompress data
    lzs_decompress(compData, uncompData);
    OSFree(compData);

    decodedStageLzPtr = uncompData;
    if (uncompData == NULL)
        OSPanic("stage.c", 1976, "cannot open stcoli\n");
    decodedStageLzPtr->animGroups = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->animGroups);

    coll = decodedStageLzPtr->animGroups;
    for (i = 0; i < decodedStageLzPtr->animGroupCount; i++, coll++)
    {
        if (coll->anim != NULL)
            adjust_stage_anim_ptrs(&coll->anim, decodedStageLzPtr);
        if (coll->modelNames != NULL)
        {
            char **namep;
            coll->modelNames = OFFSET_TO_PTR(decodedStageLzPtr, coll->modelNames);
            namep = coll->modelNames;
            while (*namep != NULL)
            {
                *namep = OFFSET_TO_PTR(decodedStageLzPtr, *namep);
                namep++;
            }
        }
        if (coll->triangles != NULL)
            coll->triangles = OFFSET_TO_PTR(decodedStageLzPtr, coll->triangles);
        if (coll->gridCellTris != NULL)
        {
            int j;
            s16 **r5;

            coll->gridCellTris = OFFSET_TO_PTR(decodedStageLzPtr, coll->gridCellTris);
            for (j = 0, r5 = coll->gridCellTris; j < coll->gridCellCountX * coll->gridCellCountZ;
                 j++, r5++)
            {
                if (*r5 != NULL)
                    *r5 = OFFSET_TO_PTR(decodedStageLzPtr, *r5);
            }
        }
        if (coll->goals != NULL)
            coll->goals = OFFSET_TO_PTR(decodedStageLzPtr, coll->goals);
        if (coll->unk48 != NULL)
            coll->unk48 = OFFSET_TO_PTR(decodedStageLzPtr, coll->unk48);
        if (coll->bumpers != NULL)
            coll->bumpers = OFFSET_TO_PTR(decodedStageLzPtr, coll->bumpers);
        if (coll->jamabars != NULL)
            coll->jamabars = OFFSET_TO_PTR(decodedStageLzPtr, coll->jamabars);
        if (coll->bananas != NULL)
            coll->bananas = OFFSET_TO_PTR(decodedStageLzPtr, coll->bananas);
        if (coll->coliCones != NULL)
            coll->coliCones = OFFSET_TO_PTR(decodedStageLzPtr, coll->coliCones);
        if (coll->coliSpheres != NULL)
            coll->coliSpheres = OFFSET_TO_PTR(decodedStageLzPtr, coll->coliSpheres);
        if (coll->coliCylinders != NULL)
            coll->coliCylinders = OFFSET_TO_PTR(decodedStageLzPtr, coll->coliCylinders);
        if (coll->unk80 != NULL)
        {
            struct DecodedStageLzPtr_child_child3 *r4;
            int j;

            coll->unk80 = OFFSET_TO_PTR(decodedStageLzPtr, coll->unk80);
            for (j = 0, r4 = coll->unk80; j < coll->unk7C; j++, r4++)
                r4->unk4 = OFFSET_TO_PTR(decodedStageLzPtr, r4->unk4);
        }
        if (coll->unk88 != NULL)
            coll->unk88 = OFFSET_TO_PTR(decodedStageLzPtr, coll->unk88);
        if (coll->unk90 != NULL)
        {
            struct DecodedStageLzPtr_child_child4 *r4;
            int j;

            coll->unk90 = OFFSET_TO_PTR(decodedStageLzPtr, coll->unk90);
            for (j = 0, r4 = coll->unk90; j < coll->unk8C; j++, r4++)
                r4->unk0 = OFFSET_TO_PTR(decodedStageLzPtr, r4->unk0);
        }
    }

    if (decodedStageLzPtr->startPos != NULL)
        decodedStageLzPtr->startPos = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->startPos);
    if (decodedStageLzPtr->pFallOutY != NULL)
        decodedStageLzPtr->pFallOutY =
            OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->pFallOutY);
    if (decodedStageLzPtr->goals != NULL)
        decodedStageLzPtr->goals = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->goals);
    if (decodedStageLzPtr->unk24 != NULL)
        decodedStageLzPtr->unk24 = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->unk24);
    if (decodedStageLzPtr->bumpers != NULL)
        decodedStageLzPtr->bumpers = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->bumpers);
    if (decodedStageLzPtr->jamabars != NULL)
        decodedStageLzPtr->jamabars = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->jamabars);
    if (decodedStageLzPtr->bananas != NULL)
        decodedStageLzPtr->bananas = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->bananas);
    if (decodedStageLzPtr->coliCones != NULL)
        decodedStageLzPtr->coliCones =
            OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->coliCones);
    if (decodedStageLzPtr->coliCylinders != NULL)
        decodedStageLzPtr->coliCylinders =
            OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->coliCylinders);
    if (decodedStageLzPtr->lvlModels != NULL)
        decodedStageLzPtr->lvlModels =
            OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->lvlModels);
    if (decodedStageLzPtr->unk64 != NULL)
        decodedStageLzPtr->unk64 = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->unk64);
    if (decodedStageLzPtr->reflObjs != NULL)
        decodedStageLzPtr->reflObjs = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->reflObjs);

    if (decodedStageLzPtr->bgModels != NULL)
    {
        struct StageBgModel *r28;

        decodedStageLzPtr->bgModels = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->bgModels);
        for (i = 0, r28 = decodedStageLzPtr->bgModels; i < decodedStageLzPtr->bgModelsCount;
             i++, r28++)
        {
            u32 r3 = r28->flags;

            if (r3 & (1 << 15))
            {
                r28->flags &= 0xF;
                r28->flags |= (r3 >> 12) & 0xFFFF0;
            }
            r28->name = OFFSET_TO_PTR(decodedStageLzPtr, r28->name);
            if (r28->anim != NULL)
                func_800473C0(&r28->anim, decodedStageLzPtr);
            if (r28->unk34 != NULL)
                func_800474D8(&r28->unk34, decodedStageLzPtr);
        }
    }

    if (decodedStageLzPtr->fgModels != NULL)
    {
        struct StageBgModel *r28;

        decodedStageLzPtr->fgModels = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->fgModels);
        for (i = 0, r28 = decodedStageLzPtr->fgModels; i < decodedStageLzPtr->fgModelCount; i++, r28++)
        {
            u32 r3 = r28->flags;

            if (r3 & (1 << 15))
            {
                r28->flags = r3 & 0xF;
                r28->flags |= (r3 >> 12) & 0xFFFF0;
            }
            r28->name = OFFSET_TO_PTR(decodedStageLzPtr, r28->name);
            if (r28->anim != NULL)
                func_800473C0(&r28->anim, decodedStageLzPtr);
            if (r28->unk34 != NULL)
                func_800474D8(&r28->unk34, decodedStageLzPtr);
        }
    }

    if (decodedStageLzPtr->unk78 != NULL)
    {
        int j;
        struct DecodedStageLzPtr_child5 *r3;
        struct DecodedStageLzPtr_child5_child *r6;

        r3 = decodedStageLzPtr->unk78 = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->unk78);
        if (r3->unk4 != NULL)
            r3->unk4 = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk4);
        if (r3->unkC != NULL)
            r3->unkC = OFFSET_TO_PTR(decodedStageLzPtr, r3->unkC);
        if (r3->unk14 != NULL)
            r3->unk14 = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk14);
        if (r3->unk1C != NULL)
            r3->unk1C = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk1C);
        r6 = r3->unk1C;
        for (j = 0; j < r3->unk18; j++, r6++)
        {
            if (r6->unk4 != NULL)
                r6->unk4 = OFFSET_TO_PTR(decodedStageLzPtr, r6->unk4);
            if (r6->unkC != NULL)
                r6->unkC = OFFSET_TO_PTR(decodedStageLzPtr, r6->unkC);
            if (r6->unk14 != NULL)
                r6->unk14 = OFFSET_TO_PTR(decodedStageLzPtr, r6->unk14);
        }
        if (r3->unk24 != NULL)
            r3->unk24 = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk24);
        if (r3->unk2C != NULL)
            r3->unk2C = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk2C);
        if (r3->unk34 != NULL)
            r3->unk34 = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk34);
        if (r3->unk3C != NULL)
            r3->unk3C = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk3C);
        if (r3->unk44 != NULL)
            r3->unk44 = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk44);
        if (r3->unk4C != NULL)
            r3->unk4C = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk4C);
        if (r3->unk54 != NULL)
            r3->unk54 = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk54);
        if (r3->unk5C != NULL)
            r3->unk5C = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk5C);
        if (r3->unk64 != NULL)
            r3->unk64 = OFFSET_TO_PTR(decodedStageLzPtr, r3->unk64);
    }

    if (decodedStageLzPtr->unk88 != NULL)
    {
        decodedStageLzPtr->unk88 = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->unk88);
        if (decodedStageLzPtr->unk88->unkC != NULL)
            adjust_stage_anim_ptrs(&decodedStageLzPtr->unk88->unkC, decodedStageLzPtr);
        if (decodedStageLzPtr->unk88->unk10 != NULL)
            adjust_stage_anim_ptrs(&decodedStageLzPtr->unk88->unk10, decodedStageLzPtr);
    }

    if (decodedStageLzPtr->unk90 != NULL)
        decodedStageLzPtr->unk90 = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->unk90);
    if (decodedStageLzPtr->unk7C < 1)
        decodedStageLzPtr->unk7C = 1;
}

void free_stagedef(void)
{
    if (decodedStageLzPtr != NULL)
    {
        OSFree(decodedStageLzPtr);
        decodedStageLzPtr = NULL;
    }
}

void adjust_stage_anim_ptrs(struct StageAnimGroupAnim **animp, struct Stage *baseptr)
{
    *animp = OFFSET_TO_PTR(baseptr, *animp);
    if ((*animp)->rotXKeyframes != NULL)
        (*animp)->rotXKeyframes = OFFSET_TO_PTR(baseptr, (*animp)->rotXKeyframes);
    if ((*animp)->rotYKeyframes != NULL)
        (*animp)->rotYKeyframes = OFFSET_TO_PTR(baseptr, (*animp)->rotYKeyframes);
    if ((*animp)->rotZKeyframes != NULL)
        (*animp)->rotZKeyframes = OFFSET_TO_PTR(baseptr, (*animp)->rotZKeyframes);
    if ((*animp)->posXKeyframes != NULL)
        (*animp)->posXKeyframes = OFFSET_TO_PTR(baseptr, (*animp)->posXKeyframes);
    if ((*animp)->posYKeyframes != NULL)
        (*animp)->posYKeyframes = OFFSET_TO_PTR(baseptr, (*animp)->posYKeyframes);
    if ((*animp)->posZKeyframes != NULL)
        (*animp)->posZKeyframes = OFFSET_TO_PTR(baseptr, (*animp)->posZKeyframes);
}

void func_800473C0(struct StageBgAnim **unkp, struct Stage *baseptr)
{
    *unkp = OFFSET_TO_PTR(baseptr, *unkp);
    if ((*unkp)->scaleXKeyframes != NULL)
        (*unkp)->scaleXKeyframes = OFFSET_TO_PTR(baseptr, (*unkp)->scaleXKeyframes);
    if ((*unkp)->scaleYKeyframes != NULL)
        (*unkp)->scaleYKeyframes = OFFSET_TO_PTR(baseptr, (*unkp)->scaleYKeyframes);
    if ((*unkp)->scaleZKeyframes != NULL)
        (*unkp)->scaleZKeyframes = OFFSET_TO_PTR(baseptr, (*unkp)->scaleZKeyframes);
    if ((*unkp)->rotXKeyframeCount != NULL)
        (*unkp)->rotXKeyframeCount = OFFSET_TO_PTR(baseptr, (*unkp)->rotXKeyframeCount);
    if ((*unkp)->rotYKeyframeCount != NULL)
        (*unkp)->rotYKeyframeCount = OFFSET_TO_PTR(baseptr, (*unkp)->rotYKeyframeCount);
    if ((*unkp)->rotZKeyframeCount != NULL)
        (*unkp)->rotZKeyframeCount = OFFSET_TO_PTR(baseptr, (*unkp)->rotZKeyframeCount);
    if ((*unkp)->posXKeyframeCount != NULL)
        (*unkp)->posXKeyframeCount = OFFSET_TO_PTR(baseptr, (*unkp)->posXKeyframeCount);
    if ((*unkp)->posYKeyframeCount != NULL)
        (*unkp)->posYKeyframeCount = OFFSET_TO_PTR(baseptr, (*unkp)->posYKeyframeCount);
    if ((*unkp)->posZKeyframeCount != NULL)
        (*unkp)->posZKeyframeCount = OFFSET_TO_PTR(baseptr, (*unkp)->posZKeyframeCount);
    if ((*unkp)->visibleKeyframes != NULL)
        (*unkp)->visibleKeyframes = OFFSET_TO_PTR(baseptr, (*unkp)->visibleKeyframes);
    if ((*unkp)->translucencyKeyframes != NULL)
        (*unkp)->translucencyKeyframes = OFFSET_TO_PTR(baseptr, (*unkp)->translucencyKeyframes);
}

void func_800474D8(struct UnkStruct8005562C_child2 **unkp, struct Stage *baseptr)
{
    *unkp = OFFSET_TO_PTR(baseptr, *unkp);
    if ((*unkp)->unk4 != NULL)
        (*unkp)->unk4 = OFFSET_TO_PTR(baseptr, (*unkp)->unk4);
    if ((*unkp)->unkC != NULL)
        (*unkp)->unkC = OFFSET_TO_PTR(baseptr, (*unkp)->unkC);
}

#pragma force_active on
Struct80206DEC_Func func_80047518(Struct80206DEC_Func func)
{
    Struct80206DEC_Func old = lbl_80206DEC.unk8;

    lbl_80206DEC.unk8 = func;
    return old;
}
#pragma force_active reset

struct Struct80092F90
{
    u16 unk0;
    u16 unk2;
    void *unk4;
};

#define lbl_802F3768 1.0f

void stage_draw(void)
{
    int r31;
    struct AnimGroupInfo *animGrp;
    struct StageAnimGroup *r27;
    int i;
    int (*r25)();
    struct Struct80092F90 sp7C;
    Mtx sp4C;
    u8 dummy[8];
    Vec sp38;
    Mtx sp8;

    r31 = func_80092D34();
    r25 = backgroundInfo.unk78;
    if (backgroundInfo.unk8C != 0)
        u_avdisp_set_some_func_1((void *)backgroundInfo.unk8C);
    sp7C.unk0 = 32;

    // draw goals
    for (animGrp = animGroups, r27 = decodedStageLzPtr->animGroups, i = 0;
     i < decodedStageLzPtr->animGroupCount;
     i++, animGrp++, r27++)
    {
        struct StageGoal *goal;
        int j;
        struct GMAModel *model;

        if (r27->goalCount != 0)
        {
            mathutil_mtxA_from_mtxB();
            if (i > 0)
                mathutil_mtxA_mult_right(animGrp->transform);
            mathutil_mtxA_to_mtx(sp4C);
            goal = r27->goals;
            for (j = 0; j < r27->goalCount; j++, goal++)
            {
                mathutil_mtxA_from_mtx(sp4C);
                mathutil_mtxA_translate(&goal->pos);
                mathutil_mtxA_rotate_z(goal->rotZ);
                mathutil_mtxA_rotate_y(goal->rotY);
                mathutil_mtxA_rotate_x(goal->rotX);
                func_8000E338(goal->type);
                switch (goal->type)
                {
                default:
                    model = goalModels[0];
                    break;
                case 'G':
                    model = goalModels[1];
                    break;
                case 'R':
                    model = goalModels[2];
                    break;
                }
                if (model != NULL)
                {
                    GXLoadPosMtxImm(mathutilData->mtxA, 0);
                    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
                    avdisp_draw_model_culled_sort_translucent(model);
                    sp7C.unk2 = 4;
                    sp7C.unk4 = model;
                }
                else
                {
                    u_call_draw_naomi_model_and_do_other_stuff(
                        NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_GOAL_01));
                    sp7C.unk2 = 0;
                    sp7C.unk4 = NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_GOAL_01);
                }
                if (r31 != 0)
                    func_80092F90(&sp7C);
            }
        }
    }

    func_8000E3BC();
    sp7C.unk0 = 2;

    if (dipSwitches & DIP_TRIANGLE)
    {
        // draw debug triangle
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_rotate_x(0xC000);
        mathutil_mtxA_scale_xyz(10.0f, 10.0f, 10.0f);
        u_nl2ngc_set_scale(10.0f);
        u_call_draw_naomi_model_and_do_other_stuff(
            NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_TRIANGLE_XY));
    }
    else if (dipSwitches & DIP_STCOLI)
    {
        // draw collision mesh
        u_draw_stage_collision();
    }
    else
    {
        if (decodedStageGmaPtr != NULL)
        {
            struct AnimGroupInfo *animGroup;
            struct Struct8020A348 *r23;
            int j;
            struct Struct8020A348_child *r27;
            struct GMAModel *model;

            sp7C.unk2 = 6;
            animGroup = animGroups;
            r23 = lbl_8020AB88;
            for (i = 0; i < animGroupCount; i++, r23++, animGroup++)
            {
                mathutil_mtxA_from_mtxB();
                if (i > 0)
                    mathutil_mtxA_mult_right(animGroup->transform);
                GXLoadPosMtxImm(mathutilData->mtxA, 0);
                GXLoadNrmMtxImm(mathutilData->mtxA, 0);
                r27 = r23->unk0;
                for (j = 0; j < r23->unk4; j++, r27++)
                {
                    if ((r27->flags & 3) == 1)
                    {
                        model = r27->model;
                        if (model != NULL && model != NULL) // WTF?
                        {
                            if (!(lbl_801EEC90.unk0 & (1 << 2)) ||
                                (r27->flags & (1 << 2)))
                            {
                                avdisp_draw_model_culled_sort_none(model);
                                if (r31 != 0)
                                {
                                    sp7C.unk4 = model;
                                    func_80092F90(&sp7C);
                                }
                            }
                        }
                    }
                }
            }
        }
        else if (decodedStageLzPtr->lvlModels == NULL)
        {
            struct AnimGroupInfo *animGroup;
            struct Struct802099E8 *r23;
            struct NaomiModel *model;
            int j;

            animGroup = animGroups;
            r23 = lbl_802099E8;
            for (i = 0; i < animGroupCount; i++, animGroup++, r23++)
            {
                mathutil_mtxA_from_mtxB();
                if (i > 0)
                    mathutil_mtxA_mult_right(animGroup->transform);
                for (j = 0; j < r23->unk8; j++)
                {
                    model = (void *)r23->unk0[j];
                    u_call_draw_naomi_model_and_do_other_stuff(model);
                    if (r25 != NULL)
                    {
                        mathutil_mtxA_push();
                        mathutil_mtxA_from_mtx(animGroup->transform);
                        if (r25(model, lbl_802F1B4C) != 0)
                        {
                            mathutil_mtxA_pop();
                            u_call_draw_naomi_model_1(lbl_802F1B4C);
                        }
                        else
                            mathutil_mtxA_pop();
                    }
                }
            }
        }
        else
        {
            struct AnimGroupInfo *animGroup;
            struct Struct8020A348 *r23;
            int j;
            float f29;
            struct Struct8020A348_child *r27;

            animGroup = animGroups;
            f29 = currentCameraStructPtr->sub28.unk38;
            r23 = lbl_8020A348;
            for (i = 0; i < animGroupCount; i++, r23++, animGroup++)
            {
                mathutil_mtxA_from_mtxB();
                if (i > 0)
                    mathutil_mtxA_mult_right(animGroup->transform);
                r27 = r23->unk0;
                for (j = 0; j < r23->unk4; j++, r27++)
                {
                    if ((r27->flags & 3) == 1)
                    {
                        struct NaomiModel *model = (void *)r27->model;
                        if (r27->model != NULL)
                        {
                            float diameter = model->boundSphereRadius * 2.0;

                            mathutil_mtxA_tf_point(&model->boundSphereCenter, &sp38);
                            if (sp38.z < -1.1920928955078125e-07f)
                            {
                                float f1 = -sp38.z * f29;
                                int r3 = r23->unk4;
                                while (j + 1 < r3 && r27[1].flags == 2)
                                {
                                    r27++;
                                    j++;
                                    if (diameter < r27->unk8 * f1)
                                    {
                                        model = (void *)r27->model;
                                        break;
                                    }
                                }
                            }
                            if (model != NULL)
                            {
                                u_call_draw_naomi_model_and_do_other_stuff(model);
                                if (r31 != 0)
                                {
                                    sp7C.unk2 = 0;
                                    sp7C.unk4 = model;
                                    func_80092F90(&sp7C);
                                }
                                if (r25 != NULL)
                                {
                                    mathutil_mtxA_push();
                                    mathutil_mtxA_from_mtx(animGroup->transform);
                                    if (r25(model, lbl_802F1B4C) != 0)
                                    {
                                        mathutil_mtxA_pop();
                                        u_call_draw_naomi_model_1(lbl_802F1B4C);
                                    }
                                    else
                                        mathutil_mtxA_pop();
                                }
                            }
                        }
                    }
                }
            }
        }

        // draw dynamic stage parts
        if (dynamicStageParts != NULL)
        {
            struct DynamicStagePart *dyn;
            mathutil_mtxA_from_mtxB();
            dyn = dynamicStageParts;
            while (dyn->modelName != NULL)
            {
                u_dupe_of_call_draw_naomi_model_1(dyn->tempModel);
                if (r31 != 0)
                {
                    sp7C.unk2 = 0;
                    sp7C.unk4 = dyn->tempModel;
                    func_80092F90(&sp7C);
                }
                dyn++;
            }
        }

        if (currStageId == ST_101_BLUR_BRIDGE)
            draw_blur_bridge_accordions();

        // draw starting position marker
        if (gameSubmode == SMD_GAME_READY_MAIN && !(lbl_801EEC90.unk0 & (1 << 1)))
        {
            func_80030BB8(1.0f, 1.0f, 1.0f);
            if (lbl_801EEC90.unk0 & (1 << 3))
            {
                mathutil_mtxA_from_identity();
                mathutil_mtxA_scale_s(0.8f);
                mathutil_mtxA_mult_right(mathutilData->mtxB);
                mathutil_mtxA_translate(&decodedStageLzPtr->startPos->pos);
                mathutil_mtxA_rotate_y(decodedStageLzPtr->startPos->yrot);
                mathutil_mtxA_rotate_x(0x4000);
                mathutil_mtxA_rotate_y(unpausedFrameCounter << 9);
                mathutil_mtxA_scale_s(2.0f);
            }
            else
            {
                mathutil_mtxA_from_mtxB();
                mathutil_mtxA_translate(&decodedStageLzPtr->startPos->pos);
                mathutil_mtxA_rotate_y(-unpausedFrameCounter << 9);
            }
            if (infoWork.unk1E == 1)
            {
                if (modeCtrl.submodeTimer > 120)
                    u_call_draw_naomi_model_and_do_other_stuff(
                        NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_START_SIGN));
                else if (modeCtrl.submodeTimer > 60)
                {
                    u_call_draw_model_with_alpha_deferred(
                        NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_START_SIGN),
                        (modeCtrl.submodeTimer - 60) / 60.0f);
                }
            }
            else
            {
                if (modeCtrl.submodeTimer > 75)
                    u_call_draw_naomi_model_and_do_other_stuff(
                        NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_START_SIGN));
                else if (modeCtrl.submodeTimer > 45)
                {
                    u_call_draw_model_with_alpha_deferred(
                        NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_START_SIGN),
                        (modeCtrl.submodeTimer - 45) / 30.0f);
                }
            }
            func_8000E3BC();
        }
    }
    if (backgroundInfo.unk8C != 0)
        u_avdisp_set_some_func_1(NULL);
    if (dipSwitches & DIP_FALL_DISP)
    {
        struct AnimGroupInfo *animGroup;
        struct StageAnimGroup *r23;
        int i;
        struct StageCollHdr_child2 *r25;
        int j;

        mathutil_mtx_copy(mathutilData->mtxB, sp8);
        animGroup = animGroups;
        r23 = decodedStageLzPtr->animGroups;
        for (i = 0; i < decodedStageLzPtr->animGroupCount; i++, animGroup++, r23++)
        {
            mathutil_mtxA_from_mtx(sp8);
            mathutil_mtxA_mult_right(animGroup->transform);
            mathutil_mtxA_to_mtx(mathutilData->mtxB);
            r25 = r23->unk88;
            for (j = 0; j < r23->unk84; j++, r25++)
            {
                float f1;
                mathutil_mtxA_from_mtxB();
                mathutil_mtxA_translate(&r25->unk0);
                mathutil_mtxA_rotate_z(r25->unk1C);
                mathutil_mtxA_rotate_y(r25->unk1A);
                mathutil_mtxA_rotate_x(r25->unk18);
                mathutil_mtxA_scale(&r25->unkC);
                f1 = MAX(r25->unkC.x, r25->unkC.y);
                f1 = MAX(f1, r25->unkC.z);
                u_nl2ngc_set_scale(f1);
                u_call_draw_model_with_alpha_deferred(
                    NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_CUBE_B), 0.5f);
            }
        }
        mathutil_mtx_copy(sp8, mathutilData->mtxB);
    }
}

/* Draws the preview of the next stage in the sky. */
void draw_stage_preview(void)
{
    if (previewLoaded)
    {
        mathutil_mtxA_from_mtxB_translate(&currentCameraStructPtr->eye);
        mathutil_mtxA_translate_xyz(0.0f, lbl_802F1EC8 * 10.0 + 100.0, 0.0f);
        mathutil_mtxA_rotate_x(0x4000);
        mathutil_mtxA_scale_s(lbl_802F1EC4 + 15.0);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        bitmap_init_tev();
        func_800AD180(&stagePreview, -1, 0, -1.0f, lbl_802F3768, 0.0f, 2.0f, -2.0f);
    }
}

void u_apply_func_to_naomi_model_vertices(struct NaomiModel *model,
                                          void (*b)(struct NaomiVtxWithNormal *),
                                          void (*c)(struct NaomiVtxWithColor *))
{
    struct NaomiMesh *r6;

    if (model->unk0 == -1)
        return;
    r6 = (void *)model->meshStart;
    while (r6->unk0 != 0)
    {
        struct NaomiMesh *r31 = (void *)(r6->dispListStart + r6->dispListSize);
        switch (r6->type)
        {
        case -2:
            break;
        case -3: // display list has pos, color, tex
            if (c != NULL)
                u_apply_func_to_naomi_dl_pos_color_tex((void *)r6->dispListStart, r31, c);
            break;
        default: // display list has pos, normal, tex
            if (b != NULL)
                u_apply_func_to_naomi_dl_pos_nrm_tex((void *)r6->dispListStart, r31, b);
            break;
        }
        r6 = r31;
    }
}

void u_apply_func_to_naomi_dl_pos_nrm_tex(struct NaomiDispList *dl, void *end,
                                          void (*func)(struct NaomiVtxWithNormal *))
{
    int i;

    while (dl < (struct NaomiDispList *)end)
    {
        u32 flags;
        int faceCount;
        u8 *vtxData;

        flags = dl->unk0;
        vtxData = dl->vtxData;
        faceCount = dl->faceCount;
        if (flags & (1 << 4)) // triangle strip
        {
            while (faceCount > 0)
            {
                if (*(u32 *)vtxData & 1)
                {
                    func((struct NaomiVtxWithNormal *)vtxData);
                    vtxData += 32;
                }
                else
                    vtxData += 8; // ignore indirect vertices
                faceCount--;
            }
        }
        else if (flags & (1 << 3)) // triangles
        {
            while (faceCount > 0)
            {
                for (i = 3; i > 0; i--)
                {
                    if (*(u32 *)vtxData & 1)
                    {
                        func((struct NaomiVtxWithNormal *)vtxData);
                        vtxData += 32;
                    }
                    else
                        vtxData += 8; // ignore indirect vertices
                }
                faceCount--;
            }
        }
        dl = (struct NaomiDispList *)vtxData;
    }
}

// duplicate of u_apply_func_to_naomi_dl_pos_nrm_tex
void u_apply_func_to_naomi_dl_pos_color_tex(struct NaomiDispList *dl, void *end,
                                            void (*func)(struct NaomiVtxWithColor *))
{
    int i;

    while (dl < (struct NaomiDispList *)end)
    {
        u32 flags;
        int faceCount;
        u8 *vtxData;

        flags = dl->unk0;
        vtxData = dl->vtxData;
        faceCount = dl->faceCount;
        if (flags & (1 << 4)) // triangle strip
        {
            while (faceCount > 0)
            {
                if (*(u32 *)vtxData & 1)
                {
                    func((struct NaomiVtxWithColor *)vtxData);
                    vtxData += 32;
                }
                else
                    vtxData += 8; // ignore indirect vertices
                faceCount--;
            }
        }
        else if (flags & (1 << 3)) // triangles
        {
            while (faceCount > 0)
            {
                for (i = 3; i > 0; i--)
                {
                    if (*(u32 *)vtxData & 1)
                    {
                        func((struct NaomiVtxWithColor *)vtxData);
                        vtxData += 32;
                    }
                    else
                        vtxData += 8; // ignore indirect vertices
                }
                faceCount--;
            }
        }
        dl = (struct NaomiDispList *)vtxData;
    }
}
