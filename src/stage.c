#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#define MATHUTIL_SIN_INT_PARAM
#include "global.h"
#include "background.h"
#include "bitmap.h"
#include "camera.h"
#include "event.h"
#include "gxutil.h"
#include "info.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "preview.h"
#include "stage.h"
#include "stcoli.h"

#include "../data/common.nlobj.h"

extern u8 lbl_801B86E4[];
extern int previewLoaded;

struct DynamicStagePart lbl_80206D00[5];

// sdata

struct Struct802F0990
{
    s32 stageId;
    struct DynamicStagePart *unk4;
};

struct Struct802F0990 lbl_802F0990[1] =
{
    { ST_092_BONUS_WAVE, lbl_80206D00 },
};

int loadedStageId = -1;
int lbl_802F099C = -1;

struct Preview stagePreview;  // 78

struct Struct80206DEC lbl_80206DEC;

struct ItemgroupInfo itemgroups[0x48];  // 148

FORCE_BSS_ORDER(lbl_80206D00)
FORCE_BSS_ORDER(stagePreview)
FORCE_BSS_ORDER(lbl_80206DEC)

char *lbl_801B86D8[] =
{
    "GOAL",
    "GOAL_G",
    "GOAL_R",
};

void g_bonus_wave_warp_callback_1();
void g_bonus_wave_warp_callback_2();
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
        if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL || modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        {
            int r5 = func_800673BC();
            if (r5 > 0 && r5 <= 200)
            {
                preview_create_with_alloc_img(
                    &stagePreview,
                    "preview/140x140.tpl",
                    r5 - 1,
                    140,
                    140,
                    GX_TF_RGB5A3);
                g_preview_wait_then_do_something(&stagePreview);
                previewLoaded = TRUE;
            }
        }
    }
}

void ev_stage_main(void)
{
    struct ItemgroupInfo *movpart;
    struct StageItemgroup *coll;
    float f31;
    float f30;
    float f3;
    int i;

    if (gamePauseStatus & 0xA)
        return;
    if (infoWork.unk0 & (1 << (31-0x17)))
    {
        if (modeCtrl.unk0 > 0x78)
            lbl_80206DEC.unk4 = 0.0f;
        else
            lbl_80206DEC.unk4 = 0x78 - modeCtrl.unk0;
        lbl_80206DEC.unk0 = 0x77;
    }
    else if (infoWork.unk0 & (1 << (31-0x1B)))
    {
        lbl_80206DEC.unk4 = func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]);
        lbl_80206DEC.unk0 = lbl_80206DEC.unk4;
    }
    else
        lbl_80206DEC.unk4 = lbl_80206DEC.unk0;
    f31 = lbl_80206DEC.unk4 / 60.0;
    f31 += decodedStageLzPtr->unk0;
    f3 = (float)(decodedStageLzPtr->unk4 - decodedStageLzPtr->unk0);
    f31 -= f3 * mathutil_floor(f31 / f3);
    f31 += decodedStageLzPtr->unk0;
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
    movpart = itemgroups;
    coll = decodedStageLzPtr->itemgroups;
    for (i = 0; i < decodedStageLzPtr->itemgroupCount; i++, movpart++, coll++)
    {
        int j;
        struct StageItemgroupAnim *anim = coll->animHdr;

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
            movpart->prevRot.x = movpart->rot.x;
            movpart->rot.x = DEGREES_TO_S16(g_interpolate_anim(anim->rotXKeyframeCount, anim->rotXKeyframes, f31));
        }
        if (anim->rotYKeyframes != NULL2)
        {
            movpart->prevRot.y = movpart->rot.y;
            movpart->rot.y = DEGREES_TO_S16(g_interpolate_anim(anim->rotYKeyframeCount, anim->rotYKeyframes, f31));
        }
        if (anim->rotZKeyframes != NULL2)
        {
            movpart->prevRot.z = movpart->rot.z;
            movpart->rot.z = DEGREES_TO_S16(g_interpolate_anim(anim->rotZKeyframeCount, anim->rotZKeyframes, f31));
        }
        if (anim->posXKeyframes != NULL2)
        {
            movpart->prevPos.x = movpart->pos.x - coll->unkB8.x;
            movpart->pos.x = g_interpolate_anim(anim->posXKeyframeCount, anim->posXKeyframes, f31);
        }
        if (anim->posYKeyframes != NULL2)
        {
            movpart->prevPos.y = movpart->pos.y - coll->unkB8.y;
            movpart->pos.y = g_interpolate_anim(anim->posYKeyframeCount, anim->posYKeyframes, f31);
        }
        if (anim->posZKeyframes != NULL2)
        {
            movpart->prevPos.z = movpart->pos.z - coll->unkB8.z;
            movpart->pos.z = g_interpolate_anim(anim->posZKeyframeCount, anim->posZKeyframes, f31);
        }
        mathutil_mtxA_from_translate(&movpart->pos);
        mathutil_mtxA_rotate_z(movpart->rot.z);
        mathutil_mtxA_rotate_y(movpart->rot.y);
        mathutil_mtxA_rotate_x(movpart->rot.x - coll->initRot.x);
        mathutil_mtxA_rotate_y(-coll->initRot.y);
        mathutil_mtxA_rotate_z(-coll->initRot.z);
        mathutil_mtxA_translate_neg(&coll->initPos);
        mathutil_mtxA_to_mtx(movpart->transform);
        mathutil_mtxA_from_translate(&movpart->prevPos);
        mathutil_mtxA_rotate_z(movpart->prevRot.z);
        mathutil_mtxA_rotate_y(movpart->prevRot.y);
        mathutil_mtxA_rotate_x(movpart->prevRot.x - coll->initRot.x);
        mathutil_mtxA_rotate_y(-coll->initRot.y);
        mathutil_mtxA_rotate_z(-coll->initRot.z);
        mathutil_mtxA_translate_neg(&coll->initPos);
        mathutil_mtxA_to_mtx(movpart->prevTransform);
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
            g_apply_func_to_naomi_model_vertices(dyn->tempModel, dyn->posNrmTexFunc, dyn->posColorTexFunc);
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
    struct ItemgroupInfo *movpart;
    struct StageItemgroup *r30;
    int i;

    if (blurBridgeAccordion == NULL2)
        return;
    t = lbl_80206DEC.unk4 / 60.0;
    t += (float)decodedStageLzPtr->unk0;
    f30 = (float)(decodedStageLzPtr->unk4 - decodedStageLzPtr->unk0);
    t -= f30 * mathutil_floor(t / f30);
    t += (float)decodedStageLzPtr->unk0;
    movpart = &itemgroups[1];
    r30 = decodedStageLzPtr->itemgroups + 1;
    for (i = 1; i < decodedStageLzPtr->itemgroupCount; i++, movpart++, r30++)
    {
        if (r30->unk7C > 0 && r30->animHdr != NULL2)
        {
            u32 r28;
            Vec sp10;
            float f27 = movpart->pos.x;

            f30 = f27;
            if (r30->animHdr->posXKeyframes != NULL2)
                f30 = g_interpolate_anim(r30->animHdr->posXKeyframeCount, r30->animHdr->posXKeyframes, t - 0.5);
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
            sp10.y = movpart->pos.y;
            sp10.z = movpart->pos.z;
            mathutil_mtxA_translate(&sp10);
            if (r28)
                mathutil_mtxA_rotate_y(-0x8000);
            mathutil_mtxA_scale_xyz(0.5 * f30, 1.0f, 1.0f);
            GXLoadPosMtxImm(mathutilData->mtxA, 0);
            GXLoadNrmMtxImm(mathutilData->mtxA, 0);
            g_avdisp_maybe_draw_model_1(blurBridgeAccordion);
        }
    }
}

void g_animate_stage(float a)
{
    float f31;
    float f30;
    float f3;
    struct ItemgroupInfo *movpart;
    struct StageItemgroup *coll;
    struct StageItemgroupAnim *anim;
    int i;

    if (gamePauseStatus & 0xA)
        return;
    lbl_80206DEC.unk4 = a;
    lbl_80206DEC.unk0 = a;
    f31 = lbl_80206DEC.unk4 / 60.0;
    f31 += decodedStageLzPtr->unk0;
    f3 = (float)(decodedStageLzPtr->unk4 - decodedStageLzPtr->unk0);
    f31 -= f3 * mathutil_floor(f31 / f3);
    f31 += decodedStageLzPtr->unk0;
    movpart = itemgroups;
    coll = decodedStageLzPtr->itemgroups;
    for (i = 0; i < decodedStageLzPtr->itemgroupCount; i++, movpart++, coll++)
    {
        anim = coll->animHdr;
        if (anim != NULL2)
        {
            if (anim->rotXKeyframes != NULL2)
            {
                movpart->prevRot.x = movpart->rot.x;
                movpart->rot.x = DEGREES_TO_S16(g_interpolate_anim(anim->rotXKeyframeCount, anim->rotXKeyframes, f31));
            }
            if (anim->rotYKeyframes != NULL2)
            {
                movpart->prevRot.y = movpart->rot.y;
                movpart->rot.y = DEGREES_TO_S16(g_interpolate_anim(anim->rotYKeyframeCount, anim->rotYKeyframes, f31));
            }
            if (anim->rotZKeyframes != NULL2)
            {
                movpart->prevRot.z = movpart->rot.z;
                movpart->rot.z = DEGREES_TO_S16(g_interpolate_anim(anim->rotZKeyframeCount, anim->rotZKeyframes, f31));
            }
            if (anim->posXKeyframes != NULL2)
            {
                movpart->prevPos.x = movpart->pos.x;
                movpart->pos.x = g_interpolate_anim(anim->posXKeyframeCount, anim->posXKeyframes, f31);
            }
            if (anim->posYKeyframes != NULL2)
            {
                movpart->prevPos.y = movpart->pos.y;
                movpart->pos.y = g_interpolate_anim(anim->posYKeyframeCount, anim->posYKeyframes, f31);
            }
            if (anim->posZKeyframes != NULL2)
            {
                movpart->prevPos.z = movpart->pos.z;
                movpart->pos.z = g_interpolate_anim(anim->posZKeyframeCount, anim->posZKeyframes, f31);
            }
            mathutil_mtxA_from_translate(&movpart->pos);
            mathutil_mtxA_rotate_z(movpart->rot.z);
            mathutil_mtxA_rotate_y(movpart->rot.y);
            mathutil_mtxA_rotate_x(movpart->rot.x - coll->initRot.x);
            mathutil_mtxA_rotate_y(-coll->initRot.y);
            mathutil_mtxA_rotate_z(-coll->initRot.z);
            mathutil_mtxA_translate_neg(&coll->initPos);
            mathutil_mtxA_to_mtx(movpart->transform);
            mathutil_mtx_copy(movpart->prevTransform, movpart->transform);
        }
    }
}

void g_initialize_stage_dyn_part_info(void)
{
    struct DynamicStagePart *dyn;
    struct
    {
        u8 filler0[0x5C];
        s8 unk5C;
        u8 filler65[0xC9-0x5D];
    } useless;

    memset(&useless, 0, sizeof(useless));

    // for Bonus Wave
    dyn = &lbl_80206D00[useless.unk5C];
    dyn->modelName = "SHAPE_STAGE134";
    dyn->posNrmTexFunc = g_bonus_wave_warp_callback_1;
    dyn->posColorTexFunc = g_bonus_wave_warp_callback_2;
    dyn->raycastDownFunc = bonus_wave_raycast_down;
    useless.unk5C++;

    // end of list
    lbl_80206D00[useless.unk5C].modelName = NULL;
}

void func_8004482C(void)
{
    struct ItemgroupInfo *movpart;
    struct StageItemgroup *coll;
    int i;

    movpart = itemgroups;
    coll = decodedStageLzPtr->itemgroups;
    for (i = 0; i < 0x48; i++, movpart++, coll++)
    {
        movpart->pos.x = coll->initPos.x;
        movpart->pos.y = coll->initPos.y;
        movpart->pos.z = coll->initPos.z;
        movpart->prevPos.x = coll->initPos.x - coll->unkB8.x;
        movpart->prevPos.y = coll->initPos.y - coll->unkB8.y;
        movpart->prevPos.z = coll->initPos.z - coll->unkB8.z;
        movpart->rot.x = coll->initRot.x;
        movpart->rot.y = coll->initRot.y;
        movpart->rot.z = coll->initRot.z;
        movpart->prevRot.x = coll->initRot.x;
        movpart->prevRot.y = coll->initRot.y;
        movpart->prevRot.z = coll->initRot.z;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_to_mtx(movpart->transform);
        mathutil_mtxA_translate_neg(&coll->unkB8);
        mathutil_mtxA_to_mtx(movpart->prevTransform);
    }
}

void func_80044920(void) {}

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
        func_800472E8();

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
        itemgroupCount = decodedStageLzPtr->itemgroupCount < 0x48 ? decodedStageLzPtr->itemgroupCount : 0x48;
        if (gamePauseStatus & (1 << (31-0x1D)))
            printf("========== st%03d ============\n", stageId);
        func_80044E18();
        func_80045194();
        func_80084794(lbl_80209368);
        g_initialize_stuff_for_dynamic_stage_parts(stageId);
        compute_stage_bounding_sphere();
        loadedStageId = stageId;
    }
    func_80021DB4(stageId);
    g_init_bg_fog_params();
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
        func_800472E8();

        OSSetCurrentHeap(oldHeap);

        loadedStageId = -1;
    }
    func_8005507C();
}

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
    ST_098_ARCADE_CONVEYER_PARTS,
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

struct Struct80209D48  // maybe StageModel?
{
    u32 unk0;
    void *unk4;
    float unk8;
};

void *lbl_80209368[0x48];
struct GMAModel *lbl_80209488[0x48];
void *lbl_802095A8[0x110];
struct Struct802099E8 lbl_802099E8[0x48];
struct Struct80209D48 lbl_80209D48[0x80];

struct Struct8020A348 lbl_8020A348[0x108];  //0x3648
struct Struct8020A348 lbl_8020AB88[0x48];  // 0x3E88
struct GMAModel *goalModels[3];
struct Sphere stageBounds;

FORCE_BSS_ORDER(lbl_80209368)
FORCE_BSS_ORDER(lbl_80209488)
FORCE_BSS_ORDER(lbl_802095A8)
FORCE_BSS_ORDER(lbl_802099E8)
FORCE_BSS_ORDER(lbl_80209D48)
FORCE_BSS_ORDER(lbl_8020A348)
FORCE_BSS_ORDER(lbl_8020AB88)
FORCE_BSS_ORDER(goalModels)
FORCE_BSS_ORDER(stageBounds)

struct NaomiObj **lbl_801B8794[] = {(struct NaomiObj **)&naomiStageObj, (struct NaomiObj **)&naomiCommonObj, NULL};

struct Struct80044E18
{
    u8 filler0[4];
    char **unk4[];
};

struct Struct80044E18_2  // r17_
{
    u32 unk0;
    u32 unk4;
    float unk8;
};

extern u32 lbl_802F1F4C;
extern u32 lbl_802F1F50;

#ifdef NONMATCHING
// https://decomp.me/scratch/Aoh83
void func_80044E18(void)
{
    struct NaomiModel *r31;
    struct GMAModel **r17;
    void **r30;
    void **r29;
    struct Struct802099E8 *r26;
    struct StageItemgroup *r22;
    char **r21;
    struct NaomiObj ***r25;
    struct NaomiObj ***r24;
    int i;  // r20
    struct Struct80209D48 *r17_;
    struct StageModel *r18;
    int r30_;
    int r19;

    char sp10[0xFC];

    struct StageItemgroup *r5;
    struct Struct8020A348 *r7;
    int r6;
    int r4;

    r17 = lbl_80209488;
    r30 = lbl_80209368;
    r29 = lbl_802095A8;
    r19 = 0;
    lbl_802F1F50 = 0;

    r26 = lbl_802099E8;
    r22 = decodedStageLzPtr->itemgroups;
    for (i = 0; i < itemgroupCount; r26++, i++, r22++)
    {
        r26->unk0 = (void *)r17;
        r26->unk4 = r30;
        r26->unk8 = 0;
        r21 = r22->modelNames;
        while (*r21 != NULL)
        {
            struct NaomiModel *r18 = NULL;
            strncpy(sp10, *r21, 0xFC);
            strncat(sp10, "_MAP", 0x100);
            r31 = NULL;
            r24 = lbl_801B8794;
            while (*r24 != NULL)
            {
                if (**r24 != NULL)
                {
                    struct NaomiModel **modelPtrs = (**r24)->modelPtrs;
                    int j;  // r23
                    for (j = 0; modelPtrs[j] != NULL; j++)
                    {
                        if (strcmp(*r21, (void *)(NLMODEL_HEADER(modelPtrs[j])->unk0 + 4)) == 0)
                        {
                            r18 = modelPtrs[j];
                            break;
                        }
                    }
                }
                //lbl_80044F00
                r24++;
                //lbl_80044F04
            }
            r25 = lbl_801B8794;
            while (*r25 != NULL)
            {
                if (**r25 != NULL)
                {
                    struct NaomiModel **modelPtrs = (**r25)->modelPtrs;
                    int j;  // r23
                    for (j = 0; modelPtrs[j] != NULL; j++)
                    {
                        if (strcmp(sp10, (void *)(NLMODEL_HEADER(modelPtrs[j])->unk0 + 4)) == 0)
                        {
                            r31 = modelPtrs[j];
                            break;
                        }
                    }
                }
                //lbl_80044F70
                r25++;
            }

            if (r31 == NULL)
                r31 = r18;
            if (r31 != NULL)
            {
                *r30++ = r31;
                if (r31 != r18)
                    *r29++ = r31;
            }
            //lbl_80044FAC
            if (r18 != NULL)
            {
                *r17++ = (void *)r18;
                r19++;
                *r29++ = (void *)r18;

                lbl_802F1F50 += NLMODEL_HEADER(r18)->unk4->modelSize;
                r26->unk8++;
                if (r19 >= 0x47)
                    break;
            }
            //lbl_80044FF0


            r21++;
        }
    //lbl_8004500C
    }
    *r17 = NULL;
    *r30 = NULL;

    r17_ = lbl_80209D48;
    r30_ = decodedStageLzPtr->lvlModelsCount < 0x80 ? decodedStageLzPtr->lvlModelsCount : 0x80;
    //i = r26
    lbl_802F1F4C = 0;
    r18 = decodedStageLzPtr->lvlModels;
    for (i = 0; i < r30_; i++, r17_++, r18++)
    {
        struct NaomiObj ***r20 = lbl_801B8794;
        struct NaomiModel *r31 = NULL;
        int r19 = 0;

        while (*r20 != NULL)
        {
            if (**r20 != NULL)
            {
                struct NaomiModel **r3 = (**r20)->modelPtrs;
                int j;
                for (j = 0; r3[j] != NULL; j++)
                {
                    int len = string_match_len(NLMODEL_HEADER(r3[j])->unk0 + 4, (void *)r18->nameOffset);
                    if (len > r19)
                    {
                        r19 = len;
                        r31 = r3[j];
                    }
                }
            }
            //lbl_800450B0
            r20++;
        }
        r17_->unk0 = r18->unk0;
        r17_->unk8 = r18->unk8;
        if (r31 != NULL)
        {
            r17_->unk4 = r31;
            *r29++ = r31;
            if ((r17_->unk0 & 3) == 1)
                lbl_802F1F4C += NLMODEL_HEADER(r31)->unk4->modelSize;
        }
        //lbl_8004510C
        else
            r17_->unk4 = NULL;
    }

    // i = r6
    //r4 = 0;
    r4 = 0;
    r5 = decodedStageLzPtr->itemgroups;
    r7 = lbl_8020A348;
    for (r6 = 0; r6 < itemgroupCount; r6++, r7++, r5++)
    {
        r7->unk0 = (void *)&lbl_80209D48[r4];
        r7->unk4 = r5->unk7C;
        //r7++;
        //r5++;
        r4 += r5->unk7C;
    }
    *r29 = NULL;
}
#else
char lbl_802F09C8[5] = "_MAP";
asm void func_80044E18(void)
{
    nofralloc
#include "../asm/nonmatchings/func_80044E18.s"
}
#pragma peephole on
#endif

extern u32 lbl_802F1F34;
char lbl_802F09D0[4] = "BOX";

#ifndef NONMATCHING
asm void func_80045194(void)
{
    nofralloc
#include "../asm/nonmatchings/func_80045194.s"
}
#pragma peephole on
#endif

inline struct GMAModel *find_model_in_gma_list(struct GMA ***list, char *name)
{
    struct GMAModel *model = NULL;
    int i;

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

struct GMAModel *find_stage_or_bg_model(char *name)
{
    static struct GMA **gmaList[] = {&decodedStageGmaPtr, &decodedBgGma, NULL};

    return find_model_in_gma_list(gmaList, name);
}

int string_match_len(s8 *, s8 *);

void g_initialize_stuff_for_dynamic_stage_parts(int stageId)
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
        objIter = &lbl_801B8794[0];
        while (*objIter != NULL)
        {
            struct NaomiObj *nobj = **objIter;
            if (nobj != NULL)
            {
                struct NaomiModel **modelPtrs = nobj->modelPtrs;
                for (i = 0; modelPtrs[i] != NULL; i++)
                {
                    int var = string_match_len(dyn->modelName, NLMODEL_HEADER(modelPtrs[i])->unk0 + 4);
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

int string_match_len(s8 *a, s8 *b)
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
void g_bonus_wave_warp_callback_1(struct NaomiVtxWithNormal *vtxp)
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
    f2 *= (lbl_80206DEC.unk4 - 30.0f);
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
    mathutil_vec_normalize_len((Vec *)&vtx.nx);  // TODO: make this a Vec?
    *vtxp = vtx;
}

// does the same as g_bonus_wave_warp_callback_1, but doesn't calculate normals
void g_bonus_wave_warp_callback_2(struct NaomiVtxWithColor *vtxp)
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
    f2 *= (lbl_80206DEC.unk4 - 30.0f);
    angle = 16384.0 * dstFromOrigin;
    angle = f2 + angle;
    if (angle > 0)
        return;
    vtx.y += mathutil_sin(angle) * amplitude;
    *vtxp = vtx;
}

#define lbl_802F3760 0.5
#define lbl_802F3770 -0.030833333333333333
#define lbl_802F3778 -1092.0f
#define lbl_802F377C 30.0f
#define lbl_802F3780 16384.0

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
    f2 *= (lbl_80206DEC.unk4 - 30.0f);
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
        switch (modeCtrl.levelSet)
        {
        case LVLSET_BEGINNER:
            bg = BG_TYPE_BLUESKY_A;
            break;
        case LVLSET_ADVANCED:
            bg = BG_TYPE_SUNSET_C;
            break;
        case LVLSET_EXPERT:
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
                    min.x = model->boundsCenter.x - model->boundsRadius;
                    min.y = model->boundsCenter.y - model->boundsRadius;
                    min.z = model->boundsCenter.z - model->boundsRadius;

                    max.x = model->boundsCenter.x + model->boundsRadius;
                    max.y = model->boundsCenter.y + model->boundsRadius;
                    max.z = model->boundsCenter.z + model->boundsRadius;
                }
                else
                {
                    if (model->boundsCenter.x - model->boundsRadius < min.x)
                        min.x = model->boundsCenter.x - model->boundsRadius;
                    if (model->boundsCenter.y - model->boundsRadius < min.y)
                        min.y = model->boundsCenter.y - model->boundsRadius;
                    if (model->boundsCenter.z - model->boundsRadius < min.z)
                        min.z = model->boundsCenter.z - model->boundsRadius;

                    if (model->boundsCenter.x + model->boundsRadius > max.x)
                        max.x = model->boundsCenter.x + model->boundsRadius;
                    if (model->boundsCenter.y + model->boundsRadius > max.y)
                        max.y = model->boundsCenter.y + model->boundsRadius;
                    if (model->boundsCenter.z + model->boundsRadius > max.z)
                        max.z = model->boundsCenter.z + model->boundsRadius;
                }
            }
            r3++;
        }
    }
    else if (decodedStageGmaPtr == NULL2)
    {
        struct Struct8020A348 *r3 = lbl_8020A348;
        int i;

        for (i = 0; i < itemgroupCount; i++, r3++)
        {
            struct Struct8020A348_child *r5 = r3->unk0;
            int r6;
            for (r6 = 0; r6 < r3->unk4; r6++, r5++)
            {
                struct NaomiModel *model = (void *)r5->unk4;

                if (model != NULL2 && model->unk0 >= 0)
                {
                    if (!r4)
                    {
                        r4 = TRUE;
                        min.x = model->boundsCenter.x - model->boundsRadius;
                        min.y = model->boundsCenter.y - model->boundsRadius;
                        min.z = model->boundsCenter.z - model->boundsRadius;

                        max.x = model->boundsCenter.x + model->boundsRadius;
                        max.y = model->boundsCenter.y + model->boundsRadius;
                        max.z = model->boundsCenter.z + model->boundsRadius;
                    }
                    else
                    {
                        if (model->boundsCenter.x - model->boundsRadius < min.x)
                            min.x = model->boundsCenter.x - model->boundsRadius;
                        if (model->boundsCenter.y - model->boundsRadius < min.y)
                            min.y = model->boundsCenter.y - model->boundsRadius;
                        if (model->boundsCenter.z - model->boundsRadius < min.z)
                            min.z = model->boundsCenter.z - model->boundsRadius;

                        if (model->boundsCenter.x + model->boundsRadius > max.x)
                            max.x = model->boundsCenter.x + model->boundsRadius;
                        if (model->boundsCenter.y + model->boundsRadius > max.y)
                            max.y = model->boundsCenter.y + model->boundsRadius;
                        if (model->boundsCenter.z + model->boundsRadius > max.z)
                            max.z = model->boundsCenter.z + model->boundsRadius;
                    }
                }
            }
        }
    }
    else
    {
        struct Struct8020A348 *r3 = lbl_8020AB88;
        int i;

        for (i = 0; i < itemgroupCount; i++, r3++)
        {
            struct Struct8020A348_child *r5 = r3->unk0;
            int r6;

            for (r6 = 0; r6 < r3->unk4; r6++, r5++)
            {
                struct GMAModel *model = r5->unk4;

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

        stageBounds.pos.x = (max.x + min.x) * 0.5;
        stageBounds.pos.y = (max.y + min.y) * 0.5;
        stageBounds.pos.z = (max.z + min.z) * 0.5;

        sp8.x = (max.x - min.x) * 0.5;
        sp8.y = (max.y - min.y) * 0.5;
        sp8.z = (max.z - min.z) * 0.5;
        stageBounds.radius = mathutil_sqrt(mathutil_sum_of_sq_3(sp8.x, sp8.y, sp8.z));
    }
    else
    {
        stageBounds.pos.x = 0.0f;
        stageBounds.pos.y = 0.0f;
        stageBounds.pos.z = 0.0f;
        stageBounds.radius = 50.0f;
    }
}

void func_800463E8(Vec *a, float *b)
{
    Vec v1;
    Vec v2;
    Vec v;
    Vec sp40;
    Vec sp34;
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    float result;

    v1.x = 0.0f;
    v1.y = 0.0f;
    v1.z = 0.0f;
    v2.x = 0.0f;
    v2.y = 0.0f;
    v2.z = 0.0f;

    if (decodedStageGmaPtr != NULL)
    {
        struct ItemgroupInfo *movpart = itemgroups;
        struct Struct8020A348 *iter2 = lbl_8020AB88;
        int j;
        int i;

        for (i = 0; i < itemgroupCount; i++, iter2++, movpart++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(movpart->transform);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->unk0 & 3) == 1 && iter3->unk4 != NULL)
                {
                    float f;
                    struct GMAModel *r28 = iter3->unk4;

                    mathutil_mtxA_tf_point(&r28->boundSphereCenter, &sp34);
                    f = r28->boundSphereRadius;
                    v.x = sp34.x - f;
                    v.y = sp34.y - f;
                    v.z = sp34.z - f;
                    if (v1.x > v.x)
                        v1.x = v.x;
                    if (v1.y > v.y)
                        v1.y = v.y;
                    if (v1.z > v.z)
                        v1.z = v.z;

                    v.x = sp34.x + f;
                    v.y = sp34.y + f;
                    v.z = sp34.z + f;
                    if (v2.x < v.x)
                        v2.x = v.x;
                    if (v2.y < v.y)
                        v2.y = v.y;
                    if (v2.z < v.z)
                        v2.z = v.z;
                }
            }
        }
        sp40.x = (v1.x + v2.x) * 0.5f;
        sp40.y = (v1.y + v2.y) * 0.5f;
        sp40.z = (v1.z + v2.z) * 0.5f;

        result = 0.0f;
        movpart = itemgroups;
        iter2 = lbl_8020AB88;
        for (i = 0; i < itemgroupCount; i++, iter2++, movpart++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(movpart->transform);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->unk0 & 3) == 1)
                {
                    float var1;
                    float f0;
                    struct GMAModel *r28 = iter3->unk4;

                    if (iter3->unk4 == NULL)
                        continue;
                    mathutil_mtxA_tf_point(&r28->boundSphereCenter, &sp28);
                    var1 = r28->boundSphereRadius;
                    f0 = var1 + mathutil_sqrt((sp40.x - sp28.x) * (sp40.x - sp28.x) + (sp40.z - sp28.z) * (sp40.z - sp28.z));
                    if (result < f0)
                        result = f0;
                }
            }
        }
        result *= 0.75f;

        *a = sp40;
        *b = result;
    }
    else if (decodedStageLzPtr != NULL && decodedStageLzPtr->lvlModels != NULL)
    {
        struct ItemgroupInfo *movpart = itemgroups;
        struct Struct8020A348 *iter2 = lbl_8020A348;
        int j;
        int i;

        for (i = 0; i < itemgroupCount; i++, iter2++, movpart++)
        {
            struct Struct8020A348_child *iter3;
            mathutil_mtxA_from_mtx(movpart->transform);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->unk0 & 3) == 1 && iter3->unk4 != NULL)
                {
                    float f;
                    struct GMAModel *r28 = iter3->unk4;

                    mathutil_mtxA_tf_point(&r28->boundSphereCenter, &sp1C);
                    f = r28->boundSphereRadius;
                    v.x = sp1C.x - f;
                    v.y = sp1C.y - f;
                    v.z = sp1C.z - f;
                    if (v1.x > v.x)
                        v1.x = v.x;
                    if (v1.y > v.y)
                        v1.y = v.y;
                    if (v1.z > v.z)
                        v1.z = v.z;

                    v.x = sp1C.x + f;
                    v.y = sp1C.y + f;
                    v.z = sp1C.z + f;
                    if (v2.x < v.x)
                        v2.x = v.x;
                    if (v2.y < v.y)
                        v2.y = v.y;
                    if (v2.z < v.z)
                        v2.z = v.z;
                }
            }
        }
        sp40.x = (v1.x + v2.x) * 0.5f;
        sp40.y = (v1.y + v2.y) * 0.5f;
        sp40.z = (v1.z + v2.z) * 0.5f;

        result = 0.0f;
        movpart = itemgroups;
        iter2 = lbl_8020A348;
        for (i = 0; i < itemgroupCount; i++, iter2++, movpart++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(movpart->transform);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->unk0 & 3) == 1)
                {
                    float var1;
                    float f0;
                    struct NaomiModel *model = (void *)iter3->unk4;

                    if (iter3->unk4 == NULL)
                        continue;
                    mathutil_mtxA_tf_point(&model->boundsCenter, &sp10);
                    var1 = func_80046884(model);
                    f0 = var1 + mathutil_sqrt((sp40.x - sp10.x) * (sp40.x - sp10.x) + (sp40.z - sp10.z) * (sp40.z - sp10.z));
                    if (result < f0)
                        result = f0;
                }
            }
        }

        *a = sp40;
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
    u8 filler14[0x1C-0x14];
} lbl_8020ADE4;
FORCE_BSS_ORDER(lbl_8020ADE4)

extern void g_some_stage_vtx_callback_1();
extern void g_some_stage_vtx_callback_2();

float func_80046884(struct NaomiModel *model)
{
    lbl_8020ADE4.unk0 = model->boundsCenter;
    lbl_8020ADE4.unkC = 0.0f;
    lbl_8020ADE4.unk10 = 0.0f;
    g_apply_func_to_naomi_model_vertices(model, g_some_stage_vtx_callback_1, g_some_stage_vtx_callback_2);
    return lbl_8020ADE4.unk10;
}

static inline float vec_sq_mag(register Vec *v)
{
    register float x, y, z;
#ifdef __MWERKS__
    asm
    {
        lfs x, v->x
        lfs y, v->y
        lfs z, v->z
        fmuls x, x, x
        fmadds x, y, y, x
        fmadds x, z, z, x
    }
    return x;
#else
    return v->x * v->x + v->y * v->y + v->z * v->z;
#endif
}

void g_some_stage_vtx_callback_1(Point3d *vtx)
{
    Vec spC;
    float f1;

    spC.x = vtx->x - lbl_8020ADE4.unk0.x;
    spC.z = vtx->z - lbl_8020ADE4.unk0.z;
    spC.y = 0.0f;
    f1 = vec_sq_mag(&spC);
    if (f1 < lbl_8020ADE4.unkC)
        return;
    lbl_8020ADE4.unkC = f1;
    lbl_8020ADE4.unk10 = mathutil_sqrt(f1);
}

void g_some_stage_vtx_callback_2(Point3d *vtx)  // duplicate of g_some_stage_vtx_callback_1
{
    Vec spC;
    float f1;

    spC.x = vtx->x - lbl_8020ADE4.unk0.x;
    spC.z = vtx->z - lbl_8020ADE4.unk0.z;
    spC.y = 0.0f;
    f1 = vec_sq_mag(&spC);
    if (f1 < lbl_8020ADE4.unkC)
        return;
    lbl_8020ADE4.unkC = f1;
    lbl_8020ADE4.unk10 = mathutil_sqrt(f1);
}

char string_warning__s___no_match_n[] = "warning %s : no match\n";
char string_warning_BG__s___no_match_n[] = "warning BG %s : no match\n";
char string_warning_MV__s___no_match_n[] = "warning MV %s : no match\n";
u8 lbl_801B87FC[] = { 1, 1, 1, 1, 1, 1, 3, 4, 4, 4, 1, 2, 7, 6, 5, 0 };

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
    struct StageItemgroup *coll;
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
    decodedStageLzPtr->itemgroups = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->itemgroups);

    coll = decodedStageLzPtr->itemgroups;
    for (i = 0; i < decodedStageLzPtr->itemgroupCount; i++, coll++)
    {
        if (coll->animHdr != NULL)
            adjust_stage_anim_ptrs(&coll->animHdr, decodedStageLzPtr);
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
            for (j = 0, r5 = coll->gridCellTris; j < coll->gridCellCountX * coll->gridCellCountZ; j++, r5++)
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
        decodedStageLzPtr->pFallOutY = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->pFallOutY);
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
        decodedStageLzPtr->coliCones = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->coliCones);
    if (decodedStageLzPtr->coliCylinders != NULL)
        decodedStageLzPtr->coliCylinders = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->coliCylinders);
    if (decodedStageLzPtr->lvlModels != NULL)
        decodedStageLzPtr->lvlModels = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->lvlModels);
    if (decodedStageLzPtr->unk64 != NULL)
        decodedStageLzPtr->unk64 = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->unk64);
    if (decodedStageLzPtr->reflObjs != NULL)
        decodedStageLzPtr->reflObjs = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->reflObjs);

    if (decodedStageLzPtr->bgModels != NULL)
    {
        struct StageBgModel *r28;

        decodedStageLzPtr->bgModels = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->bgModels);
        for (i = 0, r28 = decodedStageLzPtr->bgModels; i < decodedStageLzPtr->bgModelsCount; i++, r28++)
        {
            u32 r3 = r28->unk0;

            if (r3 & (1<<(31-0x10)))
            {
                r28->unk0 &= 0xF;
                r28->unk0 |= (r3 >> 12) & 0xFFFF0;
            }
            r28->name = OFFSET_TO_PTR(decodedStageLzPtr, r28->name);
            if (r28->unk30 != NULL)
                func_800473C0(&r28->unk30, decodedStageLzPtr);
            if (r28->unk34 != NULL)
                func_800474D8(&r28->unk34, decodedStageLzPtr);
        }
    }

    if (decodedStageLzPtr->unk74 != NULL)
    {
        struct StageBgModel *r28;

        decodedStageLzPtr->unk74 = OFFSET_TO_PTR(decodedStageLzPtr, decodedStageLzPtr->unk74);
        for (i = 0, r28 = decodedStageLzPtr->unk74; i < decodedStageLzPtr->unk70; i++, r28++)
        {
            u32 r3 = r28->unk0;

            if (r3 & (1<<(31-0x10)))
            {
                r28->unk0 = r3 & 0xF;
                r28->unk0 |= (r3 >> 12) & 0xFFFF0;
            }
            r28->name = OFFSET_TO_PTR(decodedStageLzPtr, r28->name);
            if (r28->unk30 != NULL)
                func_800473C0(&r28->unk30, decodedStageLzPtr);
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

void func_800472E8(void)
{
    if (decodedStageLzPtr != NULL)
    {
        OSFree(decodedStageLzPtr);
        decodedStageLzPtr = NULL;
    }
}

void adjust_stage_anim_ptrs(struct StageItemgroupAnim **animp, struct Stage *baseptr)
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

void func_800473C0(struct UnkStruct8005562C_child **unkp, struct Stage *baseptr)
{
    *unkp = OFFSET_TO_PTR(baseptr, *unkp);
    if ((*unkp)->unkC != NULL)
        (*unkp)->unkC = OFFSET_TO_PTR(baseptr, (*unkp)->unkC);
    if ((*unkp)->unk14 != NULL)
        (*unkp)->unk14 = OFFSET_TO_PTR(baseptr, (*unkp)->unk14);
    if ((*unkp)->unk1C != NULL)
        (*unkp)->unk1C = OFFSET_TO_PTR(baseptr, (*unkp)->unk1C);
    if ((*unkp)->unk24 != NULL)
        (*unkp)->unk24 = OFFSET_TO_PTR(baseptr, (*unkp)->unk24);
    if ((*unkp)->unk2C != NULL)
        (*unkp)->unk2C = OFFSET_TO_PTR(baseptr, (*unkp)->unk2C);
    if ((*unkp)->unk34 != NULL)
        (*unkp)->unk34 = OFFSET_TO_PTR(baseptr, (*unkp)->unk34);
    if ((*unkp)->unk3C != NULL)
        (*unkp)->unk3C = OFFSET_TO_PTR(baseptr, (*unkp)->unk3C);
    if ((*unkp)->unk44 != NULL)
        (*unkp)->unk44 = OFFSET_TO_PTR(baseptr, (*unkp)->unk44);
    if ((*unkp)->unk4C != NULL)
        (*unkp)->unk4C = OFFSET_TO_PTR(baseptr, (*unkp)->unk4C);
    if ((*unkp)->unk54 != NULL)
        (*unkp)->unk54 = OFFSET_TO_PTR(baseptr, (*unkp)->unk54);
    if ((*unkp)->unk5C != NULL)
        (*unkp)->unk5C = OFFSET_TO_PTR(baseptr, (*unkp)->unk5C);
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
    struct ItemgroupInfo *r28;
    struct StageItemgroup *r27;
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
        g_avdisp_set_some_func_1((void *)backgroundInfo.unk8C);
    sp7C.unk0 = 32;
    r28 = itemgroups;
    r27 = decodedStageLzPtr->itemgroups;
    for (i = 0; i < decodedStageLzPtr->itemgroupCount; i++, r28++, r27++)
    {
        struct StageGoal *r24;
        int j;
        struct GMAModel *model;

        if (r27->goalCount != 0)
        {
            mathutil_mtxA_from_mtxB();
            if (i > 0)
                mathutil_mtxA_mult_right(r28->transform);
            mathutil_mtxA_to_mtx(sp4C);
            r24 = r27->goals;
            for (j = 0; j < r27->goalCount; j++, r24++)
            {
                mathutil_mtxA_from_mtx(sp4C);
                mathutil_mtxA_translate(&r24->pos);
                mathutil_mtxA_rotate_z(r24->rotZ);
                mathutil_mtxA_rotate_y(r24->rotY);
                mathutil_mtxA_rotate_x(r24->rotX);
                func_8000E338(r24->type);
                switch (r24->type)
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
                    g_avdisp_maybe_draw_model_1(model);
                    sp7C.unk2 = 4;
                    sp7C.unk4 = model;
                }
                else
                {
                    g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_GOAL_01));
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
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_rotate_x(0xC000);
        mathutil_mtxA_scale_xyz(10.0f, 10.0f, 10.0f);
        g_nl2ngc_set_scale(10.0f);
        g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_TRIANGLE_XY));
    }
    else if (dipSwitches & DIP_STCOLI)
        g_draw_stage_collision();
    else
    {
        if (decodedStageGmaPtr != NULL)
        {
            struct ItemgroupInfo *movpart;
            struct Struct8020A348 *r23;
            int j;
            struct Struct8020A348_child *r27;
            struct GMAModel *model;

            sp7C.unk2 = 6;
            movpart = itemgroups;
            r23 = lbl_8020AB88;
            for (i = 0; i < itemgroupCount; i++, r23++, movpart++)
            {
                mathutil_mtxA_from_mtxB();
                if (i > 0)
                    mathutil_mtxA_mult_right(movpart->transform);
                GXLoadPosMtxImm(mathutilData->mtxA, 0);
                GXLoadNrmMtxImm(mathutilData->mtxA, 0);
                r27 = r23->unk0;
                for (j = 0; j < r23->unk4; j++, r27++)
                {
                    if ((r27->unk0 & 3) == 1)
                    {
                        model = r27->unk4;
                        if (model != NULL && model != NULL)  // WTF?
                        {
                            if (!(lbl_801EEC90.unk0 & (1<<(31-0x1D)))
                             || (r27->unk0 & (1<<(31-0x1D))))
                            {
                                g_avdisp_maybe_draw_model_2(model);
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
            struct ItemgroupInfo *movpart;
            struct Struct802099E8 *r23;
            struct NaomiModel *model;
            int j;

            movpart = itemgroups;
            r23 = lbl_802099E8;
            for (i = 0; i < itemgroupCount; i++, movpart++, r23++)
            {
                mathutil_mtxA_from_mtxB();
                if (i > 0)
                    mathutil_mtxA_mult_right(movpart->transform);
                for (j = 0; j < r23->unk8; j++)
                {
                    model = (void *)r23->unk0[j];
                    g_call_draw_naomi_model_and_do_other_stuff(model);
                    if (r25 != NULL)
                    {
                        mathutil_mtxA_push();
                        mathutil_mtxA_from_mtx(movpart->transform);
                        if (r25(model, lbl_802F1B4C) != 0)
                        {
                            mathutil_mtxA_pop();
                            g_call_draw_naomi_model_1(lbl_802F1B4C);
                        }
                        else
                            mathutil_mtxA_pop();
                    }
                }
            }
        }
        else
        {
            struct ItemgroupInfo *movpart;
            struct Struct8020A348 *r23;
            int j;
            float f29;
            struct Struct8020A348_child *r27;

            movpart = itemgroups;
            f29 = currentCameraStructPtr->sub28.unk38;
            r23 = lbl_8020A348;
            for (i = 0; i < itemgroupCount; i++, r23++, movpart++)
            {
                mathutil_mtxA_from_mtxB();
                if (i > 0)
                    mathutil_mtxA_mult_right(movpart->transform);
                r27 = r23->unk0;
                for (j = 0; j < r23->unk4; j++, r27++)
                {
                    if ((r27->unk0 & 3) == 1)
                    {
                        struct NaomiModel *model = (void *)r27->unk4;
                        if (r27->unk4 != NULL)
                        {
                            float diameter = model->boundsRadius * 2.0;

                            mathutil_mtxA_tf_point(&model->boundsCenter, &sp38);
                            if (sp38.z < -1.1920928955078125e-07f)
                            {
                                float f1 = -sp38.z * f29;
                                int r3 = r23->unk4;
                                while (j + 1 < r3 && r27[1].unk0 == 2)
                                {
                                    r27++;
                                    j++;
                                    if (diameter < r27->unk8 * f1)
                                    {
                                        model = (void *)r27->unk4;
                                        break;
                                    }
                                }
                            }
                            if (model != NULL)
                            {
                                g_call_draw_naomi_model_and_do_other_stuff(model);
                                if (r31 != 0)
                                {
                                    sp7C.unk2 = 0;
                                    sp7C.unk4 = model;
                                    func_80092F90(&sp7C);
                                }
                                if (r25 != NULL)
                                {
                                    mathutil_mtxA_push();
                                    mathutil_mtxA_from_mtx(movpart->transform);
                                    if (r25(model, lbl_802F1B4C) != 0)
                                    {
                                        mathutil_mtxA_pop();
                                        g_call_draw_naomi_model_1(lbl_802F1B4C);
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
        if (dynamicStageParts != NULL)
        {
            struct DynamicStagePart *dyn;
            mathutil_mtxA_from_mtxB();
            dyn = dynamicStageParts;
            while (dyn->modelName != NULL)
            {
                g_dupe_of_call_draw_naomi_model_1(dyn->tempModel);
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
        if (gameSubmode == SMD_GAME_READY_MAIN && !(lbl_801EEC90.unk0 & (1<<(31-0x1E))))
        {
            func_80030BB8(1.0f, 1.0f, 1.0f);
            if (lbl_801EEC90.unk0 & (1<<(31-0x1C)))
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
                if (modeCtrl.unk0 > 120)
                    g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_START_SIGN));
                else if (modeCtrl.unk0 > 60)
                {
                    g_call_draw_model_with_alpha_deferred(
                        NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_START_SIGN),
                        (modeCtrl.unk0 - 60) / 60.0f);
                }
            }
            else
            {
                if (modeCtrl.unk0 > 75)
                    g_call_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_START_SIGN));
                else if (modeCtrl.unk0 > 45)
                {
                    g_call_draw_model_with_alpha_deferred(
                        NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_START_SIGN),
                        (modeCtrl.unk0 - 45) / 30.0f);
                }
            }
            func_8000E3BC();
        }
    }
    if (backgroundInfo.unk8C != 0)
        g_avdisp_set_some_func_1(NULL);
    if (dipSwitches & DIP_FALL_DISP)
    {
        struct ItemgroupInfo *movpart;
        struct StageItemgroup *r23;
        int i;
        struct StageCollHdr_child2 *r25;
        int j;

        mathutil_mtx_copy(mathutilData->mtxB, sp8);
        movpart = itemgroups;
        r23 = decodedStageLzPtr->itemgroups;
        for (i = 0; i < decodedStageLzPtr->itemgroupCount; i++, movpart++, r23++)
        {
            mathutil_mtxA_from_mtx(sp8);
            mathutil_mtxA_mult_right(movpart->transform);
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
                g_nl2ngc_set_scale(f1);
                g_call_draw_model_with_alpha_deferred(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_CUBE_B), 0.5f);
            }
        }
        mathutil_mtx_copy(sp8, mathutilData->mtxB);
    }
}

void func_80047D70(void)
{
    if (previewLoaded)
    {
        mathutil_mtxA_from_mtxB_translate(&currentCameraStructPtr->eye);
        mathutil_mtxA_translate_xyz(0.0f, lbl_802F1EC8 * 10.0 + 100.0, 0.0f);
        mathutil_mtxA_rotate_x(0x4000);
        mathutil_mtxA_scale_s(lbl_802F1EC4 + 15.0);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        func_800263A4();
        func_800AD180(&stagePreview, -1, 0, -1.0f, lbl_802F3768, 0.0f, 2.0f, -2.0f);
    }
}

void g_apply_func_to_naomi_model_vertices(struct NaomiModel *model, void (*b)(struct NaomiVtxWithNormal *), void (*c)(struct NaomiVtxWithColor *))
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
        case -3:  // display list has pos, color, tex
            if (c != NULL)
                g_apply_func_to_naomi_dl_pos_color_tex((void *)r6->dispListStart, r31, c);
            break;
        default:  // display list has pos, normal, tex
            if (b != NULL)
                g_apply_func_to_naomi_dl_pos_nrm_tex((void *)r6->dispListStart, r31, b);
            break;
        }
        r6 = r31;
    }
}

void g_apply_func_to_naomi_dl_pos_nrm_tex(struct NaomiDispList *dl, void *end, void (*func)(struct NaomiVtxWithNormal *))
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
        if (flags & (1 << 4))  // triangle strip
        {
            while (faceCount > 0)
            {
                if (*(u32 *)vtxData & 1)
                {
                    func((struct NaomiVtxWithNormal *)vtxData);
                    vtxData += 32;
                }
                else
                    vtxData += 8;  // ignore indirect vertices
                faceCount--;
            }
        }
        else if (flags & (1 << 3))  // triangles
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
                        vtxData += 8;  // ignore indirect vertices
                }
                faceCount--;
            }
        }
        dl = (struct NaomiDispList *)vtxData;
    }
}

// duplicate of g_apply_func_to_naomi_dl_pos_nrm_tex
void g_apply_func_to_naomi_dl_pos_color_tex(struct NaomiDispList *dl, void *end, void (*func)(struct NaomiVtxWithColor *))
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
        if (flags & (1 << 4))  // triangle strip
        {
            while (faceCount > 0)
            {
                if (*(u32 *)vtxData & 1)
                {
                    func((struct NaomiVtxWithColor *)vtxData);
                    vtxData += 32;
                }
                else
                    vtxData += 8;  // ignore indirect vertices
                faceCount--;
            }
        }
        else if (flags & (1 << 3))  // triangles
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
                        vtxData += 8;  // ignore indirect vertices
                }
                faceCount--;
            }
        }
        dl = (struct NaomiDispList *)vtxData;
    }
}
