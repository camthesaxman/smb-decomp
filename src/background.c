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
    bg_e3_init,
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
    bg_e3_main,
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
    bg_e3_finish,
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
    bg_e3_draw,
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
    bg_e3_interact,
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

int (*lbl_801B9740[])() =
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
        free_nlobj(&naomiBackgroundObj, &naomiBackgroundTpl);

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
    0x194,
    0,
    sizeof(struct BGSunsetWork),
    0xAC,
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
            free_nlobj(&naomiBackgroundObj, &naomiBackgroundTpl);
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
                load_nlobj(&naomiBackgroundObj, &naomiBackgroundTpl, gmaFileName, tplFileName);
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

void bg_e3_init(void) {}

void bg_e3_main(void)
{
    float timeSeconds = backgroundInfo.animTimer / 60.0;

    animate_bg_models(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, timeSeconds);
    animate_bg_models(decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount, timeSeconds);
}

void bg_e3_finish(void) {}

void bg_e3_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->fgModels != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != 0)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_models(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->fgModels != 0)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_models(mathutilData->mtxB, decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount);
    pop_light_group();
}

void bg_e3_interact(int a) {}

void animate_bg_models(struct StageBgModel *bgModels, int bgModelCount, float timeSeconds)
{
    int i;
    int r29;
    Vec boundSphereCenter;

    if (bgModels == NULL2)
        return;
    if (lbl_801EEC90.unk0 & 0x11)
        r29 = 16;
    else if (gameMode == MD_GAME || gameMode == MD_MINI)
        r29 = 1 << (modeCtrl.unk30 - 1);
    else
        r29 = 1;
    for (i = 0; i < bgModelCount; i++, bgModels++)
    {
        float timeSecondsLooped;
        float loopDurationSeconds;
        struct StageBgAnim *anim;

        bgModels->flags &= ~(1 << 16);
        if (!(bgModels->flags & r29))
            continue;
        if (bgModels->model == NULL2)
            continue;
        bgModels->flags |= (1 << 16);
        anim = bgModels->anim;
        if (anim == NULL2)
            continue;
        timeSecondsLooped = timeSeconds;
        if (bgModels->flags & (1 << 6))
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
            bgModels->flags &= ~(1 << 16);
            continue;
        }
        if (anim->translucencyKeyframes != NULL2)
        {
            bgModels->translucency = interpolate_keyframes(
                anim->translucencyKeyframeCount, anim->translucencyKeyframes, timeSecondsLooped);
            if (bgModels->translucency >= 1.0)
                continue;
        }
        if (anim->scaleXKeyframes != NULL2)
            bgModels->scale.x = interpolate_keyframes(anim->scaleXKeyframeCount,
                                                      anim->scaleXKeyframes, timeSecondsLooped);
        if (anim->scaleYKeyframes != NULL2)
            bgModels->scale.y = interpolate_keyframes(anim->scaleYKeyframeCount,
                                                      anim->scaleYKeyframes, timeSecondsLooped);
        if (anim->scaleZKeyframes != NULL2)
            bgModels->scale.z = interpolate_keyframes(anim->scaleZKeyframeCount,
                                                      anim->scaleZKeyframes, timeSecondsLooped);
        if (anim->rotXKeyframeCount != NULL2)
            bgModels->rotX = DEGREES_TO_S16(interpolate_keyframes(
                anim->rotXKeyframes, anim->rotXKeyframeCount, timeSecondsLooped));
        if (anim->rotYKeyframeCount != NULL2)
            bgModels->rotY = DEGREES_TO_S16(interpolate_keyframes(
                anim->rotYKeyframes, anim->rotYKeyframeCount, timeSecondsLooped));
        if (anim->rotZKeyframeCount != NULL2)
            bgModels->rotZ = DEGREES_TO_S16(interpolate_keyframes(
                anim->rotZKeyframes, anim->rotZKeyframeCount, timeSecondsLooped));
        if (anim->posXKeyframeCount != NULL2)
            bgModels->pos.x = interpolate_keyframes(anim->posXKeyframes, anim->posXKeyframeCount,
                                                    timeSecondsLooped);
        if (anim->posYKeyframeCount != NULL2)
            bgModels->pos.y = interpolate_keyframes(anim->posYKeyframes, anim->posYKeyframeCount,
                                                    timeSecondsLooped);
        if (anim->posZKeyframeCount != NULL2)
            bgModels->pos.z = interpolate_keyframes(anim->posZKeyframes, anim->posZKeyframeCount,
                                                    timeSecondsLooped);
        if ((bgModels->flags & (1 << 5)) && gameSubmode != SMD_ADV_INFO_MAIN)
        {
            mathutil_mtxA_from_translate(&bgModels->pos);
            mathutil_mtxA_rotate_z(bgModels->rotZ);
            mathutil_mtxA_rotate_y(bgModels->rotY);
            mathutil_mtxA_rotate_x(bgModels->rotX);
            mathutil_mtxA_tf_point(&bgModels->model->boundSphereCenter, &boundSphereCenter);
            func_800390C8(5, &boundSphereCenter, 1.0f);
        }
    }
}

void draw_bg_models(Mtx viewFromWorld, struct StageBgModel *bgModels, int bgModelCount)
{
    int i;
    int r30;
    float f29;
    struct GMAModel *model;
    int customLightGroup;

    if (bgModels == NULL)
        return;
    if (lbl_801EEC90.unk0 & ((1 << 0)|(1 << 4)))
        r30 = 1 << 4;
    else if (gameMode == MD_GAME || gameMode == MD_MINI)
        r30 = 1 << (modeCtrl.unk30 - 1);
    else
        r30 = 1;
    for (i = 0; i < bgModelCount; i++, bgModels++)
    {
        if (!(bgModels->flags & r30))
            continue;
        if ((lbl_801EEC90.unk0 & (1 << 2))
         && (bgModels->flags & (1 << 7)))
            continue;
        if (!(bgModels->flags & (1 << 16)))
            continue;
        if (bgModels->translucency >= 1.0)
            continue;
        if ((model = bgModels->model) == NULL)
            continue;
        mathutil_mtxA_from_mtx(viewFromWorld);
        mathutil_mtxA_translate(&bgModels->pos);
        mathutil_mtxA_rotate_z(bgModels->rotZ);
        mathutil_mtxA_rotate_y(bgModels->rotY);
        mathutil_mtxA_rotate_x(bgModels->rotX);
        mathutil_mtxA_scale(&bgModels->scale);
        f29 = MAX(bgModels->scale.x, bgModels->scale.y);
        f29 = MAX(bgModels->scale.z, f29);
        if ((lbl_801EEC90.unk0 & (1 << 2))
         && func_8000E444(&model->boundSphereCenter) < -(f29 * model->boundSphereRadius))
            continue;
        if (u_test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius, f29) == 0)
            continue;
        customLightGroup = bgModels->flags >> 28;
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
        if (customLightGroup > 0)
        {
            push_light_group();
            load_light_group_uncached(customLightGroup + LIGHT_GROUP_BG_0);
        }
        if (backgroundInfo.unk90 != 0 && (bgModels->flags & (1 << 24)))
            u_avdisp_set_some_func_1(backgroundInfo.unk90);
        avdisp_set_bound_sphere_scale(f29);
        if (bgModels->translucency < FLT_EPSILON)
            avdisp_draw_model_unculled_sort_translucent(model);
        else
        {
            avdisp_set_alpha(1.0 - bgModels->translucency);
            avdisp_draw_model_unculled_sort_all(model);
        }
        if (bgModels->unk34 != 0)
            func_80055C6C(viewFromWorld, bgModels->unk34);
        u_avdisp_set_some_func_1(0);
        if (customLightGroup > 0)
            pop_light_group();
    }
}

// 890
s16 lbl_801B9A08[] =
{
    0x09,
    0x0A,
    0x0B,
    0x0C,
    0x0D,
    0x0E,
    0x0F,
    0x10,
    0x11,
    0x12,
    0x13,
    0x14,
    0x15,
    0x16,
};

// 8AC
s16 lbl_801B9A24[] =
{
    0x17, 0x18,
    0x19, 0x1A,
    0x1B, 0x1C,
    0x1D, 0x1E,
    0x1F, 0x20,
    0x21,
};

// 8C4
s16 lbl_801B9A3C[] =
{
    0x22, 0x23,
    0x24, 0x25,
    0x26, 0x27,
    0x28, 0x29,
    0x2A, 0x2B,
    0x2C, 0x2D,
    0x2E, 0x2F,
    0x30, 0x31,
    0x32, 0x33,
};

// 8E8
s16 lbl_801B9A60[] =
{
    0x34, 0x35,
    0x36, 0x37,
    0x38, 0x39,
    0x3A, 0x3B,
    0x3C, 0x3D,
    0x3E, 0x3F,
    0x40, 0x41,
    0x42, 0x43,
    0x44, 0x45,
};

// 90C
s16 lbl_801B9A84[] =
{
    0x46,
    0x47,
    0x48, 0x49,
    0x4A, 0x4B,
    0x4C, 0x4D,
    0x4E, 0x4F,
    0x50, 0x51,
    0x52, 0x53,
    0x54, 0x55,
    0x56, 0x57,
};

// 930
s16 lbl_801B9AA8[] =
{
    0x5C,
    0x5D,
    0x5E,
    0x5F,
    0x60,
    0x61,
    0x62,
    0x63,
    0x64,
    0x65,
    0x66,
    0x67,
    0x68,
    0x69,
    0x6A,
    0x6B,
};

// 950
s16 lbl_801B9AC8[] =
{
    0x6C, 0x6D,
    0x6E, 0x6F,
    0x70, 0x71,
    0x72, 0x73,
    0x74, 0x75,
    0x76, 0x77,
    0x78, 0x79,
    0x7A, 0x00,
};

// 970
s16 lbl_801B9AE8[] =
{
    0x08, 0x09,
    0x0A, 0x0B,
    0x0C, 0x0D,
    0x0E, 0x0F,
    0x10, 0x11,
    0x12, 0x13,
    0x14, 0x15,
    0x16, 0x17,
    0x18, 0x19,
    0x1A, 0x1B,
    0x1C, 0x1D,
    0x1E, 0x1F,
    0x20, 0x21,
    0x22, 0x23,
    0x24, 0x25,
    0x26, 0x27,
};

void func_80055C6C(Mtx mtx, struct UnkStruct8005562C_child2 *b)
{
    u8 unused[8];
    u32 r4;

    if (b->unk4 != NULL)
    {
        struct UnkStruct8005562C_child2_child *r26 = b->unk4;
        int i;

        for (i = 0; i < b->unk0; i++, r26++)
        {
            int modelId;

            mathutil_mtxA_from_mtx(mtx);
            mathutil_mtxA_translate(&r26->unk0);
            mathutil_mtxA_rotate_z(r26->unk10);
            mathutil_mtxA_rotate_y(r26->unkE);
            mathutil_mtxA_rotate_x(r26->unkC);
            GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
            GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
            r4 = unpausedFrameCounter / 2;
            switch (r26->unk12)
            {
            default:
            case 65:
                modelId = lbl_801B9A08[r4 % 14];
                break;
            case 66:
                modelId = lbl_801B9A24[r4 % 11];
                break;
            case 67:
                modelId = lbl_801B9A3C[r4 % 18];
                break;
            case 68:
                modelId = lbl_801B9A60[r4 % 18];
                break;
            case 69:
                modelId = lbl_801B9A84[r4 % 18];
                break;
            case 70:
                modelId = lbl_801B9AA8[r4 % 16];
                break;
            case 71:
                modelId = lbl_801B9AC8[(r4 % 15)];
                break;
            }
            avdisp_draw_model_unculled_sort_none(decodedBgGma->modelEntries[modelId].modelOffset);
        }
    }
    if (b->unkC != NULL)
    {
        struct UnkStruct8005562C_child2_child2 *r22 = b->unkC;
        int i;

        for (i = 0; i < b->unk8; i++, r22++)
        {
            int modelId;
            mathutil_mtxA_from_mtx(mtx);
            mathutil_mtxA_translate(&r22->unk0);
            mathutil_mtxA_rotate_y(currentCameraStructPtr->rotY);
            GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
            GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);
            r4 = (unpausedFrameCounter + r22->unkC * 4);
            modelId = lbl_801B9AE8[r4 % 32];
            avdisp_draw_model_unculled_sort_translucent(decodedBgGma->modelEntries[modelId].modelOffset);
        }
    }
}

void bg_night_init(void) {}

void bg_night_main(void)
{
    float var = backgroundInfo.animTimer / 60.0;

    animate_bg_models(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    animate_bg_models(decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount, var);
}

void bg_night_finish(void) {}

void bg_night_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->fgModels != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_models(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->fgModels != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_models(mathutilData->mtxB, decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount);
    pop_light_group();
}

void bg_night_interact(int a) {}

void bg_ice2_init(void) {}

void bg_ice2_main(void)
{
    float var = backgroundInfo.animTimer / 60.0;

    animate_bg_models(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    animate_bg_models(decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount, var);
}

void bg_ice2_finish(void) {}

void bg_ice2_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->fgModels != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_models(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->fgModels != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_models(mathutilData->mtxB, decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount);
    pop_light_group();
}

void bg_ice2_interact(int a) {}

void bg_billiards_init(void)
{
    int i;
    int j;
    struct StageBgModel *r29 = decodedStageLzPtr->bgModels;

    for (i = 0; i < decodedStageLzPtr->bgModelsCount; i++, r29++)
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
    float var = backgroundInfo.animTimer / 60.0;

    animate_bg_models(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    animate_bg_models(decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount, var);
}

void bg_billiards_finish(void) {}

void bg_billiards_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->fgModels != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_models(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->fgModels != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_models(mathutilData->mtxB, decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount);
    pop_light_group();
}

void bg_billiards_interact(int a) {}

void bg_golf_init(void) {}

void bg_golf_main(void)
{
    float var = backgroundInfo.animTimer / 60.0;

    animate_bg_models(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    animate_bg_models(decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount, var);
}

void bg_golf_finish(void) {}

void bg_golf_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->fgModels != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_models(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->fgModels != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_models(mathutilData->mtxB, decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount);
    pop_light_group();
}

void bg_golf_interact(int a) {}

void bg_bowling_init(void) {}

void bg_bowling_main(void)
{
    float var = backgroundInfo.animTimer / 60.0;

    animate_bg_models(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    animate_bg_models(decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount, var);
}

void bg_bowling_finish(void) {}

void bg_bowling_draw(void)
{
    push_light_group();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->fgModels != NULL)
     && (lbl_801EEC90.unk0 & 1))
        avdisp_set_ambient(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        load_light_group_uncached(LIGHT_GROUP_DEF_GMAT);
    }
    draw_bg_models(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->fgModels != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    }
    draw_bg_models(mathutilData->mtxB, decodedStageLzPtr->fgModels, decodedStageLzPtr->fgModelCount);
    pop_light_group();
}

void bg_bowling_interact(int a) {}

int func_80056610(u32 **a, void *b)
{
    float sp10 = backgroundInfo.unk84;
    memcpy(b, a, a[-1][0]);  // WTF???
    mathutil_mtxA_mult_left(backgroundInfo.unk48);
    func_80048420(b, backgroundInfo.unk80, &sp10);
    return 1;
}

void u_search_bg_models(struct BGModelSearch *searchList, int (*func)(int, struct GMAModelEntry *))
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
                r25 = func(j, gmaEntry);
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

void u_search_bg_models_from_list(struct StageBgModel *bgModels, int count, struct BGModelSearch *searchList, Func800567DC func)
{
    int i;
    int j;
    int r25 = 1;
    struct BGModelSearch *search;

    for (i = count; i > 0; i--, bgModels++)
    {
        if (bgModels->model != 0)
        {
            char *modelName = bgModels->name;
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
                    r25 = func(j, bgModels);
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
    struct StageBgModel *var1;

    var1 = decodedStageLzPtr->bgModels;
    for (i = 0; i < decodedStageLzPtr->bgModelsCount; i++, var1++)
    {
        if (var1->model != NULL)
            var1->flags &= 0xFFFFFF;
    }
    var1 = decodedStageLzPtr->fgModels;
    for (i = 0; i < decodedStageLzPtr->fgModelCount; i++, var1++)
    {
        if (var1->model != NULL)
            var1->flags &= 0xFFFFFF;
    }
}

void func_800569B4(int a)
{
    backgroundInfo.unkA0 = a;
}
