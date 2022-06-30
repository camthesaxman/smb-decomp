#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "stage.h"
#include "light.h"

#include "../data/bg_nig.gma.h"
#include "../data/bg_stm.gma.h"

#pragma force_active on

struct BackgroundInfo backgroundInfo =
{
    0,
    8421504.0,
    0x80,
    { 128, 0, 0, 0 },
};

GXColor bgBackdropColors[] =
{
    { 0x00, 0x00, 0x00, 0x00 },
#define DEFINE_BG(id, fname, oldfname, song, backdropColor) \
    { (backdropColor >> 24) & 0xFF, (backdropColor >> 16) & 0xFF, (backdropColor >> 8) & 0xFF, (backdropColor >> 0) & 0xFF },
    BACKGROUND_LIST
#undef DEFINE_BG
};

char *bgTypeNames[] =
{
    "NULL",
#define DEFINE_BG(id, fname, oldfname, song, backdropColor) #id,
    BACKGROUND_LIST
#undef DEFINE_BG
    NULL,
};

void (*bgInitFuncs[])(void) =
{
    NULL,
    bg_old_bluesky_init,
    bg_old_night_init,
    bg_old_sunset_init,
    bg_old_water_init,
    bg_old_storm_init,
    bg_old_ice_init,
    bg_old_sand_init,
    bg_old_space_init,
    bg_old_cave_init,
    bg_old_bonus_init,
    bg_old_extramaster_init,
    bg_default_init,
    bg_jungle_init,
    bg_water_init,
    bg_night_init,
    bg_sunset_init,
    bg_space_init,
    bg_sand_init,
    bg_ice2_init,
    bg_storm_init,
    bg_bonus_init,
    bg_pilot_init,
    bg_billiards_init,
    bg_golf_init,
    bg_bowling_init,
    bg_master_init,
    bg_end_init,
    NULL,
};

void (*bgMainFuncs[])(void) =
{
    NULL,
    bg_old_bluesky_main,
    bg_old_night_main,
    bg_old_sunset_main,
    bg_old_water_main,
    bg_old_storm_main,
    bg_old_ice_main,
    bg_old_sand_main,
    bg_old_space_main,
    bg_old_cave_main,
    bg_old_bonus_main,
    bg_old_extramaster_main,
    bg_default_main,
    bg_jungle_main,
    bg_water_main,
    bg_night_main,
    bg_sunset_main,
    bg_space_main,
    bg_sand_main,
    bg_ice2_main,
    bg_storm_main,
    bg_bonus_main,
    bg_pilot_main,
    bg_billiards_main,
    bg_golf_main,
    bg_bowling_main,
    bg_master_main,
    bg_end_main,
    NULL,
};

void (*bgFinishFuncs[])(void) =
{
    NULL,
    bg_old_bluesky_finish,
    bg_old_night_finish,
    bg_old_sunset_finish,
    bg_old_water_finish,
    bg_old_storm_finish,
    bg_old_ice_finish,
    bg_old_sand_finish,
    bg_old_space_finish,
    bg_old_cave_finish,
    bg_old_bonus_finish,
    bg_old_extramaster_finish,
    bg_default_finish,
    bg_jungle_finish,
    bg_water_finish,
    bg_night_finish,
    bg_sunset_finish,
    bg_space_finish,
    bg_sand_finish,
    bg_ice2_finish,
    bg_storm_finish,
    bg_bonus_finish,
    bg_pilot_finish,
    bg_billiards_finish,
    bg_golf_finish,
    bg_bowling_finish,
    bg_master_finish,
    bg_end_finish,
    NULL,
};

void (*bgDrawFuncs[])(void) =
{
    NULL,
    bg_old_bluesky_draw,
    bg_old_night_draw,
    bg_old_sunset_draw,
    bg_old_water_draw,
    bg_old_storm_draw,
    bg_old_ice_draw,
    bg_old_sand_draw,
    bg_old_space_draw,
    bg_old_cave_draw,
    bg_old_bonus_draw,
    bg_old_extramaster_draw,
    bg_default_draw,
    bg_jungle_draw,
    bg_water_draw,
    bg_night_draw,
    bg_sunset_draw,
    bg_space_draw,
    bg_sand_draw,
    bg_ice2_draw,
    bg_storm_draw,
    bg_bonus_draw,
    bg_pilot_draw,
    bg_billiards_draw,
    bg_golf_draw,
    bg_bowling_draw,
    bg_master_draw,
    bg_end_draw,
    NULL,
};

void (*bgInteractFuncs[])(int) =
{
    NULL,
    bg_old_bluesky_interact,
    bg_old_night_interact,
    bg_old_sunset_interact,
    bg_old_water_interact,
    bg_old_storm_interact,
    bg_old_ice_interact,
    bg_old_sand_interact,
    bg_old_space_interact,
    bg_old_cave_interact,
    bg_old_bonus_interact,
    bg_old_extramaster_interact,
    bg_default_interact,
    bg_jungle_interact,
    bg_water_interact,
    bg_night_interact,
    bg_sunset_interact,
    bg_space_interact,
    bg_sand_interact,
    bg_ice2_interact,
    bg_storm_interact,
    bg_bonus_interact,
    bg_pilot_interact,
    bg_billiards_interact,
    bg_golf_interact,
    bg_bowling_interact,
    bg_master_interact,
    bg_end_interact,
    NULL,
};

int (*lbl_801B96CC[])() =
{
    NULL,
    NULL,
    NULL,
    NULL,
    func_8005AD80,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

int (*lbl_801B9740[])(struct NlModel *, struct NlModel *) =
{
    NULL,
    NULL,
    NULL,
    NULL,
    func_8005AE1C,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    func_80056610,
    func_80056610,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

char *bgFileNames[] =
{
    NULL,
#define DEFINE_BG(id, fname, oldfname, song, backdropColor) fname,
    BACKGROUND_LIST
#undef DEFINE_BG
    NULL,
};

char *oldBgFileNames[] =
{
    NULL,
#define DEFINE_BG(id, fname, oldfname, song, backdropColor) oldfname,
    BACKGROUND_LIST
#undef DEFINE_BG
    NULL,
};

void ev_background_init(void)
{
    s16 r29 = backgroundInfo.bgId;
    void *r27 = backgroundInfo.work;
    u32 r26 = backgroundInfo.unkA0;

    memset(&backgroundInfo, 0, sizeof(backgroundInfo));

    backgroundInfo.bgId = r29;
    backgroundInfo.work = r27;
    backgroundInfo.unkA0 = r26;

    backgroundInfo.animTimer = 0.0f;
    backgroundInfo.unk8 = 0;

    backgroundInfo.backdropColor = bgBackdropColors[backgroundInfo.bgId];
    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(backgroundInfo.unk48);
    backgroundInfo.unk78 = lbl_801B96CC[backgroundInfo.bgId];
    backgroundInfo.unk7C = lbl_801B9740[backgroundInfo.bgId];
    backgroundInfo.unk8C = 0;
    backgroundInfo.unk90 = 0;
    backgroundInfo.ballEnvFunc = NULL;
    if (backgroundInfo.bgId > 0)
    {
        int temp = rand();
        srand(backgroundInfo.unkA0);
        backgroundInfo.unkA4 = rand();
        bgInitFuncs[backgroundInfo.bgId]();
        backgroundInfo.unkA0 = globalFrameCounter + rand();
        srand(temp);
    }
}

void ev_background_main(void)
{
    if ((gamePauseStatus & 0xA) == 0)
    {
        backgroundInfo.animTimer += 1.0f;
        backgroundInfo.unkA4++;
    }
    if (backgroundInfo.bgId > 0)
        bgMainFuncs[backgroundInfo.bgId]();
}

void ev_background_dest(void)
{
    if (backgroundInfo.bgId > 0)
        bgFinishFuncs[backgroundInfo.bgId]();
    backgroundInfo.unk98 = NULL;
    backgroundInfo.unk78 = 0;
    backgroundInfo.unk7C = 0;
    backgroundInfo.unk8C = 0;
    backgroundInfo.unk90 = 0;
    backgroundInfo.ballEnvFunc = NULL;
}

void func_80054FF0(void)
{
    if (backgroundInfo.unk98 != NULL)
        backgroundInfo.unk98();
}

void background_draw(void)
{
    if (!(dipSwitches & DIP_STCOLI) && backgroundInfo.bgId > 0)
        bgDrawFuncs[backgroundInfo.bgId]();
}

void func_8005507C(void)
{
    if (backgroundInfo.bgId > 0)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(backgroundHeap);

        if (backgroundInfo.work != NULL)
        {
            OSFree(backgroundInfo.work);
            backgroundInfo.work = NULL;
        }
        if (decodedBgTpl != NULL || decodedBgGma != NULL)
        {
            VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
            VIWaitForRetrace();
        }
        if (decodedBgTpl != NULL)
        {
            free_tpl(decodedBgTpl);
            decodedBgTpl = NULL;
        }
        if (decodedBgGma != NULL)
        {
            free_gma(decodedBgGma);
            decodedBgGma = NULL;
        }
        free_nlobj(&g_bgNlObj, &g_bgNlTpl);

        OSSetCurrentHeap(oldHeap);
        backgroundInfo.bgId = -1;
    }
}

void preload_bg_files(int bgId)
{
    char bgDir[64];
    char gmaFileName[64];
    char tplFileName[64];
    char *bgName;

    if (backgroundInfo.bgId != bgId)
    {
        // preload GMA/TPL
        bgName = bgFileNames[bgId];
        if (bgName != NULL)
        {
            strcpy(bgDir, "bg/");
            DVDChangeDir(bgDir);
            sprintf(gmaFileName, "%s.gma", bgName);
            sprintf(tplFileName, "%s.tpl", bgName);
            file_preload(gmaFileName);
            file_preload(tplFileName);
            DVDChangeDir("/test");
        }

        // preload old NAOMI files
        bgName = oldBgFileNames[bgId];
        if (bgName != NULL)
        {
            strcpy(bgDir, "bg/");
            DVDChangeDir(bgDir);
            sprintf(gmaFileName, "%s_p.lz", bgName);
            sprintf(tplFileName, "%s.lz", bgName);
            file_preload(gmaFileName);
            file_preload(tplFileName);
            DVDChangeDir("/test");
        }
    }
}

u32 bgWorkSizes[] =
{
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    sizeof(struct BGJungleWork),
    sizeof(struct BGWaterWork),
    0,
    sizeof(struct BGSunsetWork),
    sizeof(struct BGSpaceWork),
    0x56C,
    0,
    sizeof(struct BGStormWork),
    sizeof(struct BGBonusWork),
    0x1EC,
    0,
    0,
    0,
    0xB90,
    sizeof(struct BGEndWork),
    0,
};

// Define stage backgrounds
u8 stageBackgrounds[] =
{
#define DEFINE_STAGE(id, bg) bg,
    STAGE_LIST
#undef DEFINE_STAGE
};

void load_bg_files(int bgId)
{
    char bgDir[64];
    char gmaFileName[64];
    char tplFileName[64];
    char *bgName;

    if (backgroundInfo.bgId != bgId)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(backgroundHeap);

        if (backgroundInfo.bgId > 0)
        {
            // free working memory
            if (backgroundInfo.work != NULL)
            {
                OSFree(backgroundInfo.work);
                backgroundInfo.work = NULL;
            }

            // free GMA/TPL
            if (decodedBgTpl != NULL || decodedBgGma != NULL)
            {
                VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
                VIWaitForRetrace();
            }
            if (decodedBgTpl != NULL)
            {
                free_tpl(decodedBgTpl);
                decodedBgTpl = NULL;
            }
            if (decodedBgGma != NULL)
            {
                free_gma(decodedBgGma);
                decodedBgGma = NULL;
            }

            // free old NAOMI resources
            free_nlobj(&g_bgNlObj, &g_bgNlTpl);
        }
        if (bgId > 0)
        {
            // load GMA/TPL files
            bgName = bgFileNames[bgId];
            if (bgName != NULL)
            {
                strcpy(bgDir, "bg/");
                DVDChangeDir(bgDir);
                sprintf(gmaFileName, "%s.gma", bgName);
                sprintf(tplFileName, "%s.tpl", bgName);
                decodedBgTpl = load_tpl(tplFileName);
                decodedBgGma = load_gma(gmaFileName, decodedBgTpl);
                DVDChangeDir("/test");
            }

            // load old NAOMI files
            bgName = oldBgFileNames[bgId];
            if (bgName != NULL)
            {
                strcpy(bgDir, "bg/");
                DVDChangeDir(bgDir);
                sprintf(gmaFileName, "%s_p.lz", bgName);
                sprintf(tplFileName, "%s.lz", bgName);
                load_nlobj(&g_bgNlObj, &g_bgNlTpl, gmaFileName, tplFileName);
                DVDChangeDir("/test");
            }

            // allocate working memory for background
            if (bgWorkSizes[bgId] != 0)
            {
                backgroundInfo.work = OSAlloc(bgWorkSizes[bgId]);
                if (backgroundInfo.work == NULL)
                    OSPanic("background.c", 0x30B, "cannot OSAlloc\n");
                memset(backgroundInfo.work, 0, bgWorkSizes[bgId]);
            }
        }
        OSSetCurrentHeap(oldHeap);
        backgroundInfo.bgId = bgId;
        light_init(currStageId);
    }
}

void background_interact(int a)
{
    if (backgroundInfo.bgId > 0)
        bgInteractFuncs[backgroundInfo.bgId](a);
}

void bg_default_init(void) {}

void bg_default_main(void)
{
    float timeSeconds = backgroundInfo.animTimer / 60.0;

    animate_bg_objects(decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount, timeSeconds);
    animate_bg_objects(decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount, timeSeconds);
}

void bg_default_finish(void) {}

void bg_default_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgObjects != NULL || decodedStageLzPtr->fgObjects != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgObjects != 0)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_objects(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount);
    if (decodedStageLzPtr->fgObjects != 0)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_objects(mathutilData->mtxB, decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount);
    pop_light_group();
}

void bg_default_interact(int a) {}

void animate_bg_objects(struct StageBgObject *bgObj, int bgObjCount, float timeSeconds)
{
    int i;
    int r29;
    Vec boundSphereCenter;

    if (bgObj == NULL2)
        return;
    if (lbl_801EEC90.unk0 & 0x11)
        r29 = 16;
    else if (gameMode == MD_GAME || gameMode == MD_MINI)
        r29 = 1 << (modeCtrl.unk30 - 1);
    else
        r29 = 1;
    for (i = 0; i < bgObjCount; i++, bgObj++)
    {
        float timeSecondsLooped;
        float loopDurationSeconds;
        struct StageBgAnim *anim;

        bgObj->flags &= ~(1 << 16);
        if (!(bgObj->flags & r29))
            continue;
        if (bgObj->model == NULL2)
            continue;
        bgObj->flags |= (1 << 16);
        anim = bgObj->anim;
        if (anim == NULL2)
            continue;
        timeSecondsLooped = timeSeconds;
        if (bgObj->flags & (1 << 6))
            timeSecondsLooped = lbl_80206DEC.u_stageTimer / 60.0;
        timeSecondsLooped += anim->loopStartSeconds;
        loopDurationSeconds = (float)(anim->loopEndSeconds - anim->loopStartSeconds);
        timeSecondsLooped -=
            loopDurationSeconds * mathutil_floor(timeSecondsLooped / loopDurationSeconds);
        timeSecondsLooped += (float)anim->loopStartSeconds;
        if (anim->visibleKeyframes != NULL2 &&
            interpolate_keyframes(anim->visibleKeyframeCount, anim->visibleKeyframes,
                                  timeSecondsLooped) < 0.5)
        {
            bgObj->flags &= ~(1 << 16);
            continue;
        }
        if (anim->translucencyKeyframes != NULL2)
        {
            bgObj->translucency = interpolate_keyframes(
                anim->translucencyKeyframeCount, anim->translucencyKeyframes, timeSecondsLooped);
            if (bgObj->translucency >= 1.0)
                continue;
        }
        if (anim->scaleXKeyframes != NULL2)
            bgObj->scale.x = interpolate_keyframes(anim->scaleXKeyframeCount,
                                                      anim->scaleXKeyframes, timeSecondsLooped);
        if (anim->scaleYKeyframes != NULL2)
            bgObj->scale.y = interpolate_keyframes(anim->scaleYKeyframeCount,
                                                      anim->scaleYKeyframes, timeSecondsLooped);
        if (anim->scaleZKeyframes != NULL2)
            bgObj->scale.z = interpolate_keyframes(anim->scaleZKeyframeCount,
                                                      anim->scaleZKeyframes, timeSecondsLooped);
        if (anim->rotXKeyframeCount != NULL2)
            bgObj->rotX = DEGREES_TO_S16(interpolate_keyframes(
                anim->rotXKeyframes, anim->rotXKeyframeCount, timeSecondsLooped));
        if (anim->rotYKeyframeCount != NULL2)
            bgObj->rotY = DEGREES_TO_S16(interpolate_keyframes(
                anim->rotYKeyframes, anim->rotYKeyframeCount, timeSecondsLooped));
        if (anim->rotZKeyframeCount != NULL2)
            bgObj->rotZ = DEGREES_TO_S16(interpolate_keyframes(
                anim->rotZKeyframes, anim->rotZKeyframeCount, timeSecondsLooped));
        if (anim->posXKeyframeCount != NULL2)
            bgObj->pos.x = interpolate_keyframes(anim->posXKeyframes, anim->posXKeyframeCount,
                                                    timeSecondsLooped);
        if (anim->posYKeyframeCount != NULL2)
            bgObj->pos.y = interpolate_keyframes(anim->posYKeyframes, anim->posYKeyframeCount,
                                                    timeSecondsLooped);
        if (anim->posZKeyframeCount != NULL2)
            bgObj->pos.z = interpolate_keyframes(anim->posZKeyframes, anim->posZKeyframeCount,
                                                    timeSecondsLooped);
        if ((bgObj->flags & (1 << 5)) && gameSubmode != SMD_ADV_INFO_MAIN)
        {
            mathutil_mtxA_from_translate(&bgObj->pos);
            mathutil_mtxA_rotate_z(bgObj->rotZ);
            mathutil_mtxA_rotate_y(bgObj->rotY);
            mathutil_mtxA_rotate_x(bgObj->rotX);
            mathutil_mtxA_tf_point(&bgObj->model->boundSphereCenter, &boundSphereCenter);
            func_800390C8(5, &boundSphereCenter, 1.0f);
        }
    }
}

void draw_bg_objects(Mtx viewFromWorld, struct StageBgObject *bgObj, int bgObjCount)
{
    int i;
    int r30;
    float scale;
    struct GMAModel *model;
    int customLightGroup;

    if (bgObj == NULL)
        return;
    if (lbl_801EEC90.unk0 & ((1 << 0)|(1 << 4)))
        r30 = 1 << 4;
    else if (gameMode == MD_GAME || gameMode == MD_MINI)
        r30 = 1 << (modeCtrl.unk30 - 1);
    else
        r30 = 1;
    for (i = 0; i < bgObjCount; i++, bgObj++)
    {
        if (!(bgObj->flags & r30))
            continue;
        if ((lbl_801EEC90.unk0 & (1 << 2))
         && (bgObj->flags & (1 << 7)))
            continue;
        if (!(bgObj->flags & (1 << 16)))
            continue;
        if (bgObj->translucency >= 1.0)
            continue;
        if ((model = bgObj->model) == NULL)
            continue;
        mathutil_mtxA_from_mtx(viewFromWorld);
        mathutil_mtxA_translate(&bgObj->pos);
        mathutil_mtxA_rotate_z(bgObj->rotZ);
        mathutil_mtxA_rotate_y(bgObj->rotY);
        mathutil_mtxA_rotate_x(bgObj->rotX);
        mathutil_mtxA_scale(&bgObj->scale);
        scale = MAX(bgObj->scale.x, bgObj->scale.y);
        scale = MAX(bgObj->scale.z, scale);
        if ((lbl_801EEC90.unk0 & (1 << 2))
         && func_8000E444(&model->boundSphereCenter) < -(scale * model->boundSphereRadius))
            continue;
        if (test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius, scale) == 0)
            continue;
        customLightGroup = bgObj->flags >> 28;
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
        if (customLightGroup > 0)
        {
            push_light_group();
            load_light_group_uncached(customLightGroup + LIGHT_GROUP_BG_0);
        }
        if (backgroundInfo.unk90 != 0 && (bgObj->flags & (1 << 24)))
            u_avdisp_set_some_func_1(backgroundInfo.unk90);
        avdisp_set_bound_sphere_scale(scale);
        if (bgObj->translucency < FLT_EPSILON)
            avdisp_draw_model_unculled_sort_translucent(model);
        else
        {
            avdisp_set_alpha(1.0 - bgObj->translucency);
            avdisp_draw_model_unculled_sort_all(model);
        }
        if (bgObj->flipbooks != 0)
            draw_bg_flipbooks(viewFromWorld, bgObj->flipbooks);
        u_avdisp_set_some_func_1(0);
        if (customLightGroup > 0)
            pop_light_group();
    }
}

// Dancing monkey flipbook animations in windows in Night bg
// "mado" is "window" in Japanese

s16 s_nightWindowAModels[] =
{
    NIG_MADO_A_PT00,
    NIG_MADO_A_PT01,
    NIG_MADO_A_PT02,
    NIG_MADO_A_PT03,
    NIG_MADO_A_PT04,
    NIG_MADO_A_PT05,
    NIG_MADO_A_PT06,
    NIG_MADO_A_PT07,
    NIG_MADO_A_PT08,
    NIG_MADO_A_PT09,
    NIG_MADO_A_PT10,
    NIG_MADO_A_PT11,
    NIG_MADO_A_PT12,
    NIG_MADO_A_PT13,
};

s16 s_nightWindowBModels[] =
{
    NIG_MADO_B_PT00,
    NIG_MADO_B_PT01,
    NIG_MADO_B_PT02,
    NIG_MADO_B_PT03,
    NIG_MADO_B_PT04,
    NIG_MADO_B_PT05,
    NIG_MADO_B_PT06,
    NIG_MADO_B_PT07,
    NIG_MADO_B_PT08,
    NIG_MADO_B_PT09,
    NIG_MADO_B_PT10,
};

s16 s_nightWindowCModels[] =
{
    NIG_MADO_C_PT00,
    NIG_MADO_C_PT01,
    NIG_MADO_C_PT02,
    NIG_MADO_C_PT03,
    NIG_MADO_C_PT04,
    NIG_MADO_C_PT05,
    NIG_MADO_C_PT06,
    NIG_MADO_C_PT07,
    NIG_MADO_C_PT08,
    NIG_MADO_C_PT09,
    NIG_MADO_C_PT10,
    NIG_MADO_C_PT11,
    NIG_MADO_C_PT12,
    NIG_MADO_C_PT13,
    NIG_MADO_C_PT14,
    NIG_MADO_C_PT15,
    NIG_MADO_C_PT16,
    NIG_MADO_C_PT17,
};

s16 s_nightWindowDModels[] =
{
    NIG_MADO_D_PT00,
    NIG_MADO_D_PT01,
    NIG_MADO_D_PT02,
    NIG_MADO_D_PT03,
    NIG_MADO_D_PT04,
    NIG_MADO_D_PT05,
    NIG_MADO_D_PT06,
    NIG_MADO_D_PT07,
    NIG_MADO_D_PT08,
    NIG_MADO_D_PT09,
    NIG_MADO_D_PT10,
    NIG_MADO_D_PT11,
    NIG_MADO_D_PT12,
    NIG_MADO_D_PT13,
    NIG_MADO_D_PT14,
    NIG_MADO_D_PT15,
    NIG_MADO_D_PT16,
    NIG_MADO_D_PT17,
};

s16 s_nightWindowEModels[] =
{
    NIG_MADO_E_PT00,
    NIG_MADO_E_PT01,
    NIG_MADO_E_PT02,
    NIG_MADO_E_PT03,
    NIG_MADO_E_PT04,
    NIG_MADO_E_PT05,
    NIG_MADO_E_PT06,
    NIG_MADO_E_PT07,
    NIG_MADO_E_PT08,
    NIG_MADO_E_PT09,
    NIG_MADO_E_PT10,
    NIG_MADO_E_PT11,
    NIG_MADO_E_PT12,
    NIG_MADO_E_PT13,
    NIG_MADO_E_PT14,
    NIG_MADO_E_PT15,
    NIG_MADO_E_PT16,
    NIG_MADO_E_PT17,
};

s16 s_nightWindowFModels[] =
{
    NIG_MADO_F_PT00,
    NIG_MADO_F_PT01,
    NIG_MADO_F_PT02,
    NIG_MADO_F_PT03,
    NIG_MADO_F_PT04,
    NIG_MADO_F_PT05,
    NIG_MADO_F_PT06,
    NIG_MADO_F_PT07,
    NIG_MADO_F_PT08,
    NIG_MADO_F_PT09,
    NIG_MADO_F_PT10,
    NIG_MADO_F_PT11,
    NIG_MADO_F_PT12,
    NIG_MADO_F_PT13,
    NIG_MADO_F_PT14,
    NIG_MADO_F_PT15,
};

s16 s_nightWindowGModels[] =
{
    NIG_MADO_G_PT00,
    NIG_MADO_G_PT01,
    NIG_MADO_G_PT02,
    NIG_MADO_G_PT03,
    NIG_MADO_G_PT04,
    NIG_MADO_G_PT05,
    NIG_MADO_G_PT06,
    NIG_MADO_G_PT07,
    NIG_MADO_G_PT08,
    NIG_MADO_G_PT09,
    NIG_MADO_G_PT10,
    NIG_MADO_G_PT11,
    NIG_MADO_G_PT12,
    NIG_MADO_G_PT13,
    NIG_MADO_G_PT14,
};

// Models to flipbook animate for flames in Storm
s16 s_stormFireModels[] =
{
    STM_FIRE00,
    STM_FIRE01,
    STM_FIRE02,
    STM_FIRE03,
    STM_FIRE04,
    STM_FIRE05,
    STM_FIRE06,
    STM_FIRE07,
    STM_FIRE08,
    STM_FIRE09,
    STM_FIRE10,
    STM_FIRE11,
    STM_FIRE12,
    STM_FIRE13,
    STM_FIRE14,
    STM_FIRE15,
    STM_FIRE16,
    STM_FIRE17,
    STM_FIRE18,
    STM_FIRE19,
    STM_FIRE20,
    STM_FIRE21,
    STM_FIRE22,
    STM_FIRE23,
    STM_FIRE24,
    STM_FIRE25,
    STM_FIRE26,
    STM_FIRE27,
    STM_FIRE28,
    STM_FIRE29,
    STM_FIRE30,
    STM_FIRE31,
};

void draw_bg_flipbooks(Mtx viewFromWorld, struct StageFlipbookAnims *flipbooks)
{
    u8 unused[8];
    u32 t;

    if (flipbooks->nightWindowAnims != NULL)
    {
        struct NightWindowAnim *nightFlipbook = flipbooks->nightWindowAnims;
        int i;

        for (i = 0; i < flipbooks->nightWindowAnimCount; i++, nightFlipbook++)
        {
            int modelId;

            // Pose in world space
            mathutil_mtxA_from_mtx(viewFromWorld);
            mathutil_mtxA_translate(&nightFlipbook->pos);
            mathutil_mtxA_rotate_z(nightFlipbook->rotZ);
            mathutil_mtxA_rotate_y(nightFlipbook->rotY);
            mathutil_mtxA_rotate_x(nightFlipbook->rotX);
            GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
            GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
            t = unpausedFrameCounter / 2;
            switch (nightFlipbook->id)
            {
            default:
            case 65:
                modelId = s_nightWindowAModels[t % ARRAY_COUNT(s_nightWindowAModels)];
                break;
            case 66:
                modelId = s_nightWindowBModels[t % ARRAY_COUNT(s_nightWindowBModels)];
                break;
            case 67:
                modelId = s_nightWindowCModels[t % ARRAY_COUNT(s_nightWindowCModels)];
                break;
            case 68:
                modelId = s_nightWindowDModels[t % ARRAY_COUNT(s_nightWindowDModels)];
                break;
            case 69:
                modelId = s_nightWindowEModels[t % ARRAY_COUNT(s_nightWindowEModels)];
                break;
            case 70:
                modelId = s_nightWindowFModels[t % ARRAY_COUNT(s_nightWindowFModels)];
                break;
            case 71:
                modelId = s_nightWindowGModels[(t % ARRAY_COUNT(s_nightWindowGModels))];
                break;
            }
            avdisp_draw_model_unculled_sort_none(decodedBgGma->modelEntries[modelId].model);
        }
    }
    if (flipbooks->stormFireAnims != NULL)
    {
        struct StormFireAnim *stormFlipbook = flipbooks->stormFireAnims;
        int i;

        for (i = 0; i < flipbooks->stormFireAnimCount; i++, stormFlipbook++)
        {
            int modelId;

            // Position is in world space, Y rotation is billboarded
            mathutil_mtxA_from_mtx(viewFromWorld);
            mathutil_mtxA_translate(&stormFlipbook->pos);
            mathutil_mtxA_rotate_y(currentCameraStructPtr->rotY);
            GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
            GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
            t = (unpausedFrameCounter + stormFlipbook->frameOffset * 4);
            modelId = s_stormFireModels[t % ARRAY_COUNT(s_stormFireModels)];
            avdisp_draw_model_unculled_sort_translucent(decodedBgGma->modelEntries[modelId].model);
        }
    }
}

void bg_night_init(void) {}

void bg_night_main(void)
{
    float timeSeconds = backgroundInfo.animTimer / 60.0;

    animate_bg_objects(decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount, timeSeconds);
    animate_bg_objects(decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount, timeSeconds);
}

void bg_night_finish(void) {}

void bg_night_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgObjects != NULL || decodedStageLzPtr->fgObjects != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_objects(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount);
    if (decodedStageLzPtr->fgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_objects(mathutilData->mtxB, decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount);
    pop_light_group();
}

void bg_night_interact(int a) {}

void bg_ice2_init(void) {}

void bg_ice2_main(void)
{
    float timeSeconds = backgroundInfo.animTimer / 60.0;

    animate_bg_objects(decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount, timeSeconds);
    animate_bg_objects(decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount, timeSeconds);
}

void bg_ice2_finish(void) {}

void bg_ice2_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgObjects != NULL || decodedStageLzPtr->fgObjects != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_objects(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount);
    if (decodedStageLzPtr->fgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_objects(mathutilData->mtxB, decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount);
    pop_light_group();
}

void bg_ice2_interact(int a) {}

void bg_billiards_init(void)
{
    int i;
    int j;
    struct StageBgObject *r29 = decodedStageLzPtr->bgObjects;

    for (i = 0; i < decodedStageLzPtr->bgObjectCount; i++, r29++)
    {
        struct GBilLightGroup *r27 = s_bilLightGroupNames;

        while (r27->u_bgLightGroupId != -1)
        {
            int len1 = strlen(r27->name);
            int len2 = strlen(r29->name) - 1;
            int matched = 0;

            for (j = 0; j < len1; j++)
            {
                if (r29->name[j] != r27->name[j])
                    break;
                if (len2 == j)
                {
                    matched = 1;
                    break;
                }
            }
            if (matched)
            {
                r29->flags |= r27->u_bgLightGroupId << 28;
                break;
            }
            r27++;
        }
    }
}

void bg_billiards_main(void)
{
    float timeSeconds = backgroundInfo.animTimer / 60.0;

    animate_bg_objects(decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount, timeSeconds);
    animate_bg_objects(decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount, timeSeconds);
}

void bg_billiards_finish(void) {}

void bg_billiards_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgObjects != NULL || decodedStageLzPtr->fgObjects != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_objects(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount);
    if (decodedStageLzPtr->fgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_objects(mathutilData->mtxB, decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount);
    pop_light_group();
}

void bg_billiards_interact(int a) {}

void bg_golf_init(void) {}

void bg_golf_main(void)
{
    float timeSeconds = backgroundInfo.animTimer / 60.0;

    animate_bg_objects(decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount, timeSeconds);
    animate_bg_objects(decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount, timeSeconds);
}

void bg_golf_finish(void) {}

void bg_golf_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgObjects != NULL || decodedStageLzPtr->fgObjects != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_objects(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount);
    if (decodedStageLzPtr->fgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_objects(mathutilData->mtxB, decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount);
    pop_light_group();
}

void bg_golf_interact(int a) {}

void bg_bowling_init(void) {}

void bg_bowling_main(void)
{
    float timeSeconds = backgroundInfo.animTimer / 60.0;

    animate_bg_objects(decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount, timeSeconds);
    animate_bg_objects(decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount, timeSeconds);
}

void bg_bowling_finish(void) {}

void bg_bowling_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgObjects != NULL || decodedStageLzPtr->fgObjects != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_objects(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgObjects, decodedStageLzPtr->bgObjectCount);
    if (decodedStageLzPtr->fgObjects != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_objects(mathutilData->mtxB, decodedStageLzPtr->fgObjects, decodedStageLzPtr->fgObjectCount);
    pop_light_group();
}

void bg_bowling_interact(int a) {}

int func_80056610(struct NlModel *a, struct NlModel *b)
{
    float sp10 = backgroundInfo.unk84;
    memcpy(b, a, NLMODEL_HEADER(a)->unk4->modelSize);  // WTF???
    mathutil_mtxA_mult_left(backgroundInfo.unk48);
    func_80048420(b, backgroundInfo.unk80, &sp10);
    return 1;
}

// Finds the specified models in the current background's GMA
void find_background_gma_models(struct BGModelSearch *searchList, BgModelFindProc proc)
{
    int i;
    int j;
    struct GMAModelEntry *gmaEntry;
    struct BGModelSearch *search;
    char *modelName;
    int r25;

    if (decodedBgGma == NULL)
        return;
    gmaEntry = decodedBgGma->modelEntries;
    r25 = 1;
    for (i = decodedBgGma->numModels; i > 0; i--, gmaEntry++)
    {
        int len1;

        modelName = gmaEntry->name;
        len1 = strlen(modelName);

        // find entries for the model
        for (j = 0, search = searchList; search->name != NULL; j++, search++)
        {
            BOOL matched;

            switch (search->cmpType)
            {
            case BG_MDL_CMP_PREFIX:  // prefix of model name
                matched = !strncmp(modelName, search->name, strlen(search->name));
                break;
            case BG_MDL_CMP_FULL:  // full name
                matched = !strcmp(modelName, search->name);
                break;
            case BG_MDL_CMP_SUFFIX:  // suffix of model name
                {
                    int len2 = strlen(search->name);
                    if (len2 > len1)
                        matched = FALSE;
                    else
                        matched = !strncmp(modelName + (len1 - len2), search->name, len2);
                }
                break;
            default:
                matched = FALSE;
                break;
            }
            if (matched)
            {
                r25 = proc(j, gmaEntry);
                if (r25 == 0)
                    break;
            }
            if (r25 == 0)
                break;
        }
        if (r25 == 0)
            break;
    }
}

// Finds the specified background objects in a user-provided array
void find_background_objects(struct StageBgObject *bgObj, int bgObjCount, struct BGModelSearch *searchList, BgObjFindProc proc)
{
    int i;
    int j;
    int r25 = 1;
    struct BGModelSearch *search;

    for (i = bgObjCount; i > 0; i--, bgObj++)
    {
        if (bgObj->model != NULL)
        {
            char *modelName = bgObj->name;
            int len1 = strlen(modelName);

            // find entries for the model
            for (j = 0, search = searchList; search->name != NULL; j++, search++)
            {
                BOOL matched;

                switch (search->cmpType)
                {
                case BG_MDL_CMP_PREFIX:  // prefix of model name
                    matched = !strncmp(modelName, search->name, strlen(search->name));
                    break;
                case BG_MDL_CMP_FULL:  // full name
                    matched = !strcmp(modelName, search->name);
                    break;
                case BG_MDL_CMP_SUFFIX:  // suffix of model name
                    {
                        int len2 = strlen(search->name);
                        if (len2 > len1)
                            matched = FALSE;
                        else
                            matched = !strncmp(modelName + (len1 - len2), search->name, len2);
                    }
                    break;
                default:
                    matched = FALSE;
                    break;
                }
                if (matched)
                {
                    r25 = proc(j, bgObj);
                    if (r25 == 0)
                        break;
                }
                if (r25 == 0)
                    break;
            }
            if (r25 == 0)
                break;
        }
    }
}

void func_80056934(void)
{
    int i;
    struct StageBgObject *bgObj;

    bgObj = decodedStageLzPtr->bgObjects;
    for (i = 0; i < decodedStageLzPtr->bgObjectCount; i++, bgObj++)
    {
        if (bgObj->model != NULL)
            bgObj->flags &= 0xFFFFFF;
    }
    bgObj = decodedStageLzPtr->fgObjects;
    for (i = 0; i < decodedStageLzPtr->fgObjectCount; i++, bgObj++)
    {
        if (bgObj->model != NULL)
            bgObj->flags &= 0xFFFFFF;
    }
}

void func_800569B4(int a)
{
    backgroundInfo.unkA0 = a;
}
