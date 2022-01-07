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

#pragma force_active on

struct BackgroundInfo backgroundInfo =
{
    0,
    8421504.0,
    0x80,
    { 128, 0, 0, 0 },
};

GXColor lbl_801B9178_A8[] =
{
    { 0x00, 0x00, 0x00, 0x00 },
    { 0xFF, 0xFF, 0xFF, 0xFF },
    { 0x11, 0x39, 0x67, 0xFF },
    { 0x38, 0x3D, 0x6C, 0xFF },
    { 0x00, 0x1A, 0x4D, 0xFF },
    { 0x83, 0x98, 0xED, 0xFF },
    { 0x00, 0x00, 0x00, 0x00 },
    { 0x1D, 0x4A, 0xB5, 0x00 },
    { 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00 },
    { 0x00, 0x00, 0x00, 0x00 },
    { 0xFF, 0xFF, 0xFF, 0xFF },
    { 0x00, 0x00, 0x00, 0xFF },
    { 0x00, 0x00, 0x00, 0xFF },
    { 0x00, 0x00, 0x00, 0xFF },
    { 0x00, 0x00, 0x00, 0xFF },
    { 0xD8, 0xBC, 0x77, 0xFF },
    { 0x00, 0x00, 0x00, 0xFF },
    { 0x00, 0x00, 0x00, 0xFF },
    { 0x00, 0x00, 0x00, 0xFF },
    { 0xFF, 0xFF, 0xFF, 0xFF },
    { 0xFF, 0xFF, 0xFF, 0xFF },
    { 0xFF, 0xFF, 0xFF, 0xFF },
    { 0xFF, 0xFF, 0xFF, 0xFF },
    { 0xFF, 0xFF, 0xCD, 0xFF },
    { 0xFF, 0xFF, 0xFF, 0xFF },
};

// backgroundInfo + 0x29C
char *lbl_801B9414[] =
{
    "NULL",
    "BG_TYPE_BLUESKY_A",
    "BG_TYPE_NIGHT_B",
    "BG_TYPE_SUNSET_C",
    "BG_TYPE_WATER_C",
    "BG_TYPE_STORM_D",
    "BG_TYPE_ICE_E",
    "BG_TYPE_SAND_G",
    "BG_TYPE_SPACE_H",
    "BG_TYPE_CAVE_I",
    "BG_TYPE_BONUS_J",
    "BG_TYPE_EXTRAMASTER_J",
    "BG_TYPE_E3",
    "BG_TYPE_JUN",
    "BG_TYPE_WAT",
    "BG_TYPE_NIG",
    "BG_TYPE_SUN",
    "BG_TYPE_SPA",
    "BG_TYPE_SND",
    "BG_TYPE_ICE2",
    "BG_TYPE_STM",
    "BG_TYPE_BNS",
    "BG_TYPE_PIL",
    "BG_TYPE_BIL",
    "BG_TYPE_GOL",
    "BG_TYPE_BOW",
    "BG_TYPE_MST",
    "BG_TYPE_END",
    NULL,
};

// backgroundInfo + 0x310
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

// 384
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

// 3F8
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

// 46C
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

// 4E0
void (*lbl_801B9658[])(int) =
{
    NULL,
    func_800573A0,
    func_8005851C,
    func_800587F8,
    func_8005AD7C,
    func_8005A178,
    func_80058CDC,
    func_800599F8,
    func_80058728,
    func_80057A98,
    func_800589AC,
    func_8005828C,
    func_80055628,
    func_8005B868,
    func_8005E910,
    func_8005601C,
    func_80061390,
    func_800609A8,
    func_8005C3B4,
    func_8005615C,
    func_80062BD0,
    func_80061920,
    func_80064C2C,
    func_8005638C,
    func_800564CC,
    func_8005660C,
    func_80063AD4,
    func_800654F0,
    NULL,
};

// 554
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

// 5C8
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

// 648
char *bgFileNames[] =
{
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
    "bg_jun",
    "bg_wat",
    "bg_nig",
    "bg_sun",
    "bg_spa",
    "bg_snd",
    "bg_ice",
    "bg_stm",
    "bg_bns",
    "bg_pil",
    NULL,
    "bg_gol",
    "bg_bow",
    "bg_mst",
    "bg_ending",
    NULL,
};

// 6BC
char *oldBgFileNames[] =
{
    NULL,
    "bg_a",
    "bg_b",
    "bg_c",
    "bg_d",
    "bg_e",
    "bg_f",
    "bg_g",
    "bg_h",
    "bg_i",
    "bg_j",
    "bg_j",
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

void ev_background_init(void)
{
    s16 r29 = backgroundInfo.bgId;
    void *r27 = backgroundInfo.unk9C;
    u32 r26 = backgroundInfo.unkA0;

    memset(&backgroundInfo, 0, sizeof(backgroundInfo));

    backgroundInfo.bgId = r29;
    backgroundInfo.unk9C = r27;
    backgroundInfo.unkA0 = r26;

    backgroundInfo.unk4 = 0.0f;
    backgroundInfo.unk8 = 0;

    backgroundInfo.unkC = lbl_801B9178_A8[backgroundInfo.bgId];
    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(backgroundInfo.unk48);
    backgroundInfo.unk78 = lbl_801B96CC[backgroundInfo.bgId];
    backgroundInfo.unk7C = lbl_801B9740[backgroundInfo.bgId];
    backgroundInfo.unk8C = 0;
    backgroundInfo.unk90 = 0;
    backgroundInfo.unk94 = NULL;
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
        backgroundInfo.unk4 += 1.0f;
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
    backgroundInfo.unk94 = NULL;
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
        OSHeapHandle oldHeap = OSSetCurrentHeap(memHeap3);

        if (backgroundInfo.unk9C != NULL)
        {
            OSFree(backgroundInfo.unk9C);
            backgroundInfo.unk9C = NULL;
        }
        if (decodedBgTpl != NULL || decodedBgGma != NULL)
        {
            VISetNextFrameBuffer(lbl_802F1CA4[0]);
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

void func_80055164(int bgId)
{
    char bgDir[64];
    char gmaFileName[64];
    char tplFileName[64];
    char *bgName;

    if (backgroundInfo.bgId != bgId)
    {
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

u32 lbl_801B98A8[] =
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
    0x16C,
    0x194,
    0,
    0x16C,
    0xAC,
    0x56C,
    0,
    0x428,
    0x80C,
    0x1EC,
    0,
    0,
    0,
    0xB90,
    0x94,
    0,
};

u8 stageBackgrounds[] =
{
    0x01, 0x0D, 0x0D, 0x0D,
    0x0D, 0x10, 0x10, 0x10,
    0x10, 0x10, 0x01, 0x0D,
    0x0D, 0x0D, 0x0D, 0x10,
    0x10, 0x10, 0x10, 0x01,
    0x01, 0x0F, 0x0F, 0x0F,
    0x0F, 0x0F, 0x0F, 0x0F,
    0x0F, 0x0F, 0x01, 0x0E,
    0x0E, 0x0E, 0x0E, 0x0E,
    0x0E, 0x0E, 0x0E, 0x0E,
    0x0E, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0F, 0x0F, 0x0F,
    0x0F, 0x01, 0x01, 0x0E,
    0x0E, 0x0E, 0x0E, 0x0E,
    0x0E, 0x0E, 0x0E, 0x0E,
    0x01, 0x12, 0x12, 0x12,
    0x12, 0x12, 0x12, 0x12,
    0x12, 0x12, 0x01, 0x13,
    0x13, 0x13, 0x13, 0x13,
    0x13, 0x13, 0x13, 0x13,
    0x01, 0x14, 0x14, 0x14,
    0x14, 0x14, 0x14, 0x14,
    0x14, 0x14, 0x14, 0x15,
    0x15, 0x15, 0x15, 0x15,
    0x01, 0x01, 0x01, 0x0D,
    0x01, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x01, 0x1A,
    0x1A, 0x1A, 0x1A, 0x1A,
    0x1A, 0x1A, 0x1A, 0x1A,
    0x1A, 0x1A, 0x1A, 0x1A,
    0x1A, 0x1A, 0x1A, 0x11,
    0x12, 0x0D, 0x13, 0x0F,
    0x0E, 0x0F, 0x12, 0x10,
    0x11, 0x11, 0x0E, 0x0D,
    0x13, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x0D, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x19,
    0x17, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x00, 0x01,
    0x01, 0x01, 0x01, 0x01,
    0x01, 0x15, 0x1B, 0x0D,
    0x01, 0x00, 0x00, 0x00,
};

void load_bg_files(int bgId)
{
    char bgDir[64];
    char gmaFileName[64];
    char tplFileName[64];
    char *bgName;

    if (backgroundInfo.bgId != bgId)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(memHeap3);

        if (backgroundInfo.bgId > 0)
        {
            if (backgroundInfo.unk9C != NULL)
            {
                OSFree(backgroundInfo.unk9C);
                backgroundInfo.unk9C = NULL;
            }
            if (decodedBgTpl != NULL || decodedBgGma != NULL)
            {
                VISetNextFrameBuffer(lbl_802F1CA4[0]);
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
        }
        if (bgId > 0)
        {
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
            if (lbl_801B98A8[bgId] != 0)
            {
                backgroundInfo.unk9C = OSAlloc(lbl_801B98A8[bgId]);
                if (backgroundInfo.unk9C == NULL)
                    OSPanic("background.c", 0x30B, "cannot OSAlloc\n");
                memset(backgroundInfo.unk9C, 0, lbl_801B98A8[bgId]);
            }
        }
        OSSetCurrentHeap(oldHeap);
        backgroundInfo.bgId = bgId;
        func_80021DB4(currStageId);
    }
}

void func_800554A4(int a)
{
    if (backgroundInfo.bgId > 0)
        lbl_801B9658[backgroundInfo.bgId](a);
}

void bg_e3_init(void) {}

void bg_e3_main(void)
{
    float var = backgroundInfo.unk4 / 60.0;

    func_8005562C(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    func_8005562C(decodedStageLzPtr->unk74, decodedStageLzPtr->unk70, var);
}

void bg_e3_finish(void) {}

void bg_e3_draw(void)
{
    func_800224CC();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->unk74 != NULL)
     && (lbl_801EEC90.unk0 & 1))
        g_avdisp_set_3_floats(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != 0)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        func_80022274(4);
    }
    func_80055A18(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->unk74 != 0)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        func_80022274(0);
    }
    func_80055A18(mathutilData->mtxB, decodedStageLzPtr->unk74, decodedStageLzPtr->unk70);
    func_80022530();
}

void func_80055628(int a) {}

void func_8005562C(struct StageBgModel *a, int b, float c)
{
    int i;
    int r29;
    Vec sp1C;

    if (a == NULL2)
        return;
    if (lbl_801EEC90.unk0 & 0x11)
        r29 = 16;
    else if (gameMode == MD_GAME || gameMode == MD_MINI)
        r29 = 1 << (modeCtrl.unk30 - 1);
    else
        r29 = 1;
    for (i = 0; i < b; i++, a++)
    {
        float f29;
        float f2;
        struct UnkStruct8005562C_child *r28;
        int r4;

        a->unk0 &= ~(1 << (31-15));
        if (!(a->unk0 & r29))
            continue;
        if (a->model == NULL2)
            continue;
        a->unk0 |= 0x10000;
        r28 = a->unk30;
        if (r28 == NULL2)
            continue;
        f29 = c;
        if (a->unk0 & (1 << (31-0x19)))
            f29 = lbl_80206DEC.unk4 / 60.0;
        f29 += r28->unk0;
        f2 = (float)(r28->unk4 - r28->unk0);
        r4 = mathutil_floor_to_int(f29 / f2);
        f29 -= f2 * (float)r4;
        f29 += (float)r28->unk0;
        if (r28->unk54 != NULL2 && g_interp_stage_anim_probably(r28->unk50, r28->unk54, f29) < 0.5)
        {
            a->unk0 &= ~(1 << (31-15));
            continue;
        }
        if (r28->unk5C != NULL2)
        {
            a->unk2C = g_interp_stage_anim_probably(r28->unk58, r28->unk5C, f29);
            if (a->unk2C >= 1.0)
                continue;
        }
        if (r28->unkC != NULL2)
            a->scale.x = g_interp_stage_anim_probably(r28->unk8, r28->unkC, f29);
        if (r28->unk14 != NULL2)
            a->scale.y = g_interp_stage_anim_probably(r28->unk10, r28->unk14, f29);
        if (r28->unk1C != NULL2)
            a->scale.z = g_interp_stage_anim_probably(r28->unk18, r28->unk1C, f29);
        if (r28->unk24 != NULL2)
            a->xrot = g_interp_stage_anim_probably(r28->unk20, r28->unk24, f29) * 182.044448853f;
        if (r28->unk2C != NULL2)
            a->yrot = g_interp_stage_anim_probably(r28->unk28, r28->unk2C, f29) * 182.044448853f;
        if (r28->unk34 != NULL2)
            a->zrot = g_interp_stage_anim_probably(r28->unk30, r28->unk34, f29) * 182.044448853f;
        if (r28->unk3C != NULL2)
            a->pos.x = g_interp_stage_anim_probably(r28->unk38, r28->unk3C, f29);
        if (r28->unk44 != NULL2)
            a->pos.y = g_interp_stage_anim_probably(r28->unk40, r28->unk44, f29);
        if (r28->unk4C != NULL2)
            a->pos.z = g_interp_stage_anim_probably(r28->unk48, r28->unk4C, f29);
        if ((a->unk0 & (1 << (31-0x1A))) && gameSubmode != SMD_ADV_INFO_MAIN)
        {
            mathutil_mtxA_from_translate(&a->pos);
            mathutil_mtxA_rotate_z(a->zrot);
            mathutil_mtxA_rotate_y(a->yrot);
            mathutil_mtxA_rotate_x(a->xrot);
            mathutil_mtxA_tf_point(&a->model->boundingSphereCenter, &sp1C);
            func_800390C8(5, &sp1C, 1.0f);
        }
    }
}

void func_80055A18(Mtx a, struct StageBgModel *b, int c)
{
    int i;
    int r30;
    float f29;
    struct GMAModelHeader *r24;
    int r23;

    if (b == NULL)
        return;
    if (lbl_801EEC90.unk0 & 0x11)
        r30 = 16;
    else if (gameMode == MD_GAME || gameMode == MD_MINI)
        r30 = 1 << (modeCtrl.unk30 - 1);
    else
        r30 = 1;
    for (i = 0; i < c; i++, b++)
    {
        if (!(b->unk0 & r30))
            continue;
        if ((lbl_801EEC90.unk0 & (1 << (31-0x1D)))
         && (b->unk0 & (1 << (31-0x18))))
            continue;
        if (!(b->unk0 & (1 << (31-15))))
            continue;
        if (b->unk2C >= 1.0)
            continue;
        if ((r24 = b->model) == NULL)
            continue;
        mathutil_mtxA_from_mtx(a);
        mathutil_mtxA_translate(&b->pos);
        mathutil_mtxA_rotate_z(b->zrot);
        mathutil_mtxA_rotate_y(b->yrot);
        mathutil_mtxA_rotate_x(b->xrot);
        mathutil_mtxA_scale(&b->scale);
        f29 = MAX(b->scale.x, b->scale.y);
        f29 = MAX(b->scale.z, f29);
        if ((lbl_801EEC90.unk0 & (1 << (31-0x1D)))
         && func_8000E444(&r24->boundingSphereCenter) < -(f29 * r24->boundingSphereRadius))
            continue;
        if (func_80020FD0(&r24->boundingSphereCenter, r24->boundingSphereRadius, f29) == 0)
            continue;
        r23 = b->unk0 >> 28;
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        if (r23 > 0)
        {
            func_800224CC();
            func_80022274(r23 + 6);
        }
        if (backgroundInfo.unk90 != 0 && (b->unk0 & (1 << (31-7))))
            g_avdisp_set_some_func_1(backgroundInfo.unk90);
        g_avdisp_set_model_scale(f29);
        if (b->unk2C < FLT_EPSILON)
            g_avdisp_draw_model_1(r24);
        else
        {
            func_8008E564(1.0 - b->unk2C);
            g_avdisp_draw_model_3(r24);
        }
        if (b->unk34 != 0)
            func_80055C6C(a, b->unk34);
        g_avdisp_set_some_func_1(0);
        if (r23 > 0)
            func_80022530();
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

extern u32 unpausedFrameCounter;

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
            GXLoadPosMtxImm(mathutilData->mtxA, 0);
            GXLoadNrmMtxImm(mathutilData->mtxA, 0);
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
            g_avdisp_draw_model_2(decodedBgGma->modelEntries[modelId].modelOffset);
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
            GXLoadPosMtxImm(mathutilData->mtxA, 0);
            GXLoadNrmMtxImm(mathutilData->mtxA, 0);
            r4 = (unpausedFrameCounter + r22->unkC * 4);
            modelId = lbl_801B9AE8[r4 % 32];
            g_avdisp_draw_model_1(decodedBgGma->modelEntries[modelId].modelOffset);
        }
    }
}

void bg_night_init(void) {}

void bg_night_main(void)
{
    float var = backgroundInfo.unk4 / 60.0;

    func_8005562C(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    func_8005562C(decodedStageLzPtr->unk74, decodedStageLzPtr->unk70, var);
}

void bg_night_finish(void) {}

void bg_night_draw(void)
{
    func_800224CC();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->unk74 != NULL)
     && (lbl_801EEC90.unk0 & 1))
        g_avdisp_set_3_floats(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        func_80022274(4);
    }
    func_80055A18(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->unk74 != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        func_80022274(0);
    }
    func_80055A18(mathutilData->mtxB, decodedStageLzPtr->unk74, decodedStageLzPtr->unk70);
    func_80022530();
}

void func_8005601C(int a) {}

void bg_ice2_init(void) {}

void bg_ice2_main(void)
{
    float var = backgroundInfo.unk4 / 60.0;

    func_8005562C(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    func_8005562C(decodedStageLzPtr->unk74, decodedStageLzPtr->unk70, var);
}

void bg_ice2_finish(void) {}

void bg_ice2_draw(void)
{
    func_800224CC();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->unk74 != NULL)
     && (lbl_801EEC90.unk0 & 1))
        g_avdisp_set_3_floats(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        func_80022274(4);
    }
    func_80055A18(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->unk74 != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        func_80022274(0);
    }
    func_80055A18(mathutilData->mtxB, decodedStageLzPtr->unk74, decodedStageLzPtr->unk70);
    func_80022530();
}

void func_8005615C(int a) {}

extern struct Struct80180F14
{
    char *unk0;
    s8 unk4;
} lbl_80180F14[];

void bg_billiards_init(void)
{
    int i;
    int j;
    struct StageBgModel *r29 = decodedStageLzPtr->bgModels;

    for (i = 0; i < decodedStageLzPtr->bgModelsCount; i++, r29++)
    {
        struct Struct80180F14 *r27 = lbl_80180F14;

        while (r27->unk4 != -1)
        {
            int len1 = strlen(r27->unk0);
            int len2 = strlen(r29->name) - 1;
            int matched = 0;

            for (j = 0; j < len1; j++)
            {
                if (r29->name[j] != r27->unk0[j])
                    break;
                if (len2 == j)
                {
                    matched = 1;
                    break;
                }
            }
            if (matched)
            {
                r29->unk0 |= r27->unk4 << 28;
                break;
            }
            r27++;
        }
    }
}

void bg_billiards_main(void)
{
    float var = backgroundInfo.unk4 / 60.0;

    func_8005562C(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    func_8005562C(decodedStageLzPtr->unk74, decodedStageLzPtr->unk70, var);
}

void bg_billiards_finish(void) {}

void bg_billiards_draw(void)
{
    func_800224CC();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->unk74 != NULL)
     && (lbl_801EEC90.unk0 & 1))
        g_avdisp_set_3_floats(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        func_80022274(4);
    }
    func_80055A18(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->unk74 != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        func_80022274(0);
    }
    func_80055A18(mathutilData->mtxB, decodedStageLzPtr->unk74, decodedStageLzPtr->unk70);
    func_80022530();
}

void func_8005638C(int a) {}

void bg_golf_init(void) {}

void bg_golf_main(void)
{
    float var = backgroundInfo.unk4 / 60.0;

    func_8005562C(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    func_8005562C(decodedStageLzPtr->unk74, decodedStageLzPtr->unk70, var);
}

void bg_golf_finish(void) {}

void bg_golf_draw(void)
{
    func_800224CC();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->unk74 != NULL)
     && (lbl_801EEC90.unk0 & 1))
        g_avdisp_set_3_floats(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        func_80022274(4);
    }
    func_80055A18(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->unk74 != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        func_80022274(0);
    }
    func_80055A18(mathutilData->mtxB, decodedStageLzPtr->unk74, decodedStageLzPtr->unk70);
    func_80022530();
}

void func_800564CC(int a) {}

void bg_bowling_init(void) {}

void bg_bowling_main(void)
{
    float var = backgroundInfo.unk4 / 60.0;

    func_8005562C(decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount, var);
    func_8005562C(decodedStageLzPtr->unk74, decodedStageLzPtr->unk70, var);
}

void bg_bowling_finish(void) {}

void bg_bowling_draw(void)
{
    func_800224CC();
    if ((decodedStageLzPtr->bgModels != NULL || decodedStageLzPtr->unk74 != NULL)
     && (lbl_801EEC90.unk0 & 1))
        g_avdisp_set_3_floats(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->bgModels != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        func_80022274(4);
    }
    func_80055A18(lbl_802F1B3C->matrices[0], decodedStageLzPtr->bgModels, decodedStageLzPtr->bgModelsCount);
    if (decodedStageLzPtr->unk74 != NULL)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        func_80022274(0);
    }
    func_80055A18(mathutilData->mtxB, decodedStageLzPtr->unk74, decodedStageLzPtr->unk70);
    func_80022530();
}

void func_8005660C(int a) {}

int func_80056610(u32 **a, void *b)
{
    float sp10 = backgroundInfo.unk84;
    memcpy(b, a, a[-1][0]);  // WTF???
    mathutil_mtxA_mult_left(backgroundInfo.unk48);
    func_80048420(b, backgroundInfo.unk80, &sp10);
    return 1;
}

struct Struct80056684
{
    u32 unk0;
    char *unk4;
};

void func_80056684(struct Struct80056684 *a, int (*b)())
{
    int r30;
    int r29;
    struct GMAModelEntry *r28;
    struct Struct80056684 *r27;
    char *r26;
    int r25;

    if (decodedBgGma == NULL)
        return;
    r28 = decodedBgGma->modelEntries;
    r30 = decodedBgGma->numModels;
    r25 = 1;
    while (r30 > 0)
    {
        int len1;

        r26 = r28->name;
        len1 = strlen(r26);
        r27 = a;
        r29 = 0;
        while (r27->unk4 != NULL)
        {
            int matched;

            switch (r27->unk0)
            {
            case 0:
                matched = !strncmp(r26, r27->unk4, strlen(r27->unk4));
                break;
            case 1:
                matched = !strcmp(r26, r27->unk4);
                break;
            case 2:
                {
                    int len2 = strlen(r27->unk4);
                    if (len2 > len1)
                        matched = 0;
                    else
                        matched = !strncmp(r26 + (len1 - len2), r27->unk4, len2);
                }
                break;
            default:
                matched = 0;
                break;
            }
            if (matched)
            {
                r25 = b(r29, r28);
                if (r25 == 0)
                    break;
            }
            if (r25 == 0)
                break;
            r29++;
            r27++;
        }
        if (r25 == 0)
            break;
        r30--;
        r28++;
    }
}

void func_800567DC(struct GMAModelEntry *r28, int r30_, struct Struct80056684 *a, int (*b)())
{
    int r30 = r30_;
    int r29;
    int r25 = 1;
    struct Struct80056684 *r27;

    while (r30 > 0)
    {
        // Hmm...
        if ((r28 + 1)->modelOffset != NULL)
        {
            char *r26;
            int len1;

            r26 = r28->name;
            len1 = strlen(r26);
            r27 = a;
            r29 = 0;
            while (r27->unk4 != NULL)
            {
                int matched;

                switch (r27->unk0)
                {
                case 0:
                    matched = !strncmp(r26, r27->unk4, strlen(r27->unk4));
                    break;
                case 1:
                    matched = !strcmp(r26, r27->unk4);
                    break;
                case 2:
                    {
                        int len2 = strlen(r27->unk4);
                        if (len2 > len1)
                            matched = 0;
                        else
                            matched = !strncmp(r26 + (len1 - len2), r27->unk4, len2);
                    }
                    break;
                default:
                    matched = 0;
                    break;
                }
                if (matched)
                {
                    r25 = b(r29, r28);
                    if (r25 == 0)
                        break;
                }
                if (r25 == 0)
                    break;
                r29++;
                r27++;
            }
            if (r25 == 0)
                break;
        }
        r30--;
        r28 += 7;
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
            var1->unk0 &= 0xFFFFFF;
    }
    var1 = decodedStageLzPtr->unk74;
    for (i = 0; i < decodedStageLzPtr->unk70; i++, var1++)
    {
        if (var1->model != NULL)
            var1->unk0 &= 0xFFFFFF;
    }
}

void func_800569B4(int a)
{
    backgroundInfo.unkA0 = a;
}
