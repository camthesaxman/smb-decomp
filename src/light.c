#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "background.h"
#include "camera.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "perf.h"
#include "stage.h"

#include "../data/common.nlobj.h"

s32 currLightGroup;
s32 lbl_802F1C94;
u32 lbl_802F1C90;
s32 lbl_802F1C8C;
s32 lbl_802F1C88;
s32 lbl_802F1C84;
s32 lbl_802F1C80;
s32 lbl_802F1C7C;
s32 lbl_802F1C78;

u8 lbl_802F1C75;
u8 lbl_802F1C74;
u8 lbl_802F1C73;
u8 lbl_802F1C72;
u8 lbl_802F1C71;
u8 lbl_802F1C70;
u8 lbl_802F1C6F;
u8 lbl_802F1C6E;
u8 lbl_802F1C6D;
u8 lbl_802F1C6C;

s32 lbl_802F1C68;
s32 lbl_802F1C64;
s32 lbl_802F1C60;
s32 numLightObjsLoaded;
s32 g_lightPerfTimer;
float lbl_802F1C54;
s8 lightGroupStackPos;
s32 lbl_802F1C4C;
s32 lbl_802F1C48;

#define LIGHTGROUP_STACK_MAX 3
u32 lightGroupStack[LIGHTGROUP_STACK_MAX];
FORCE_BSS_ORDER(lightGroupStack)

s8 lbl_802F0310[8] = {0};

// light types?

enum
{
    INFINITE,
    POINT,
    SPOT,
    POINT_POW,
    SPOT_POW,
    POINT_DARKPOW,
    SPOT_DARKPOW,
    POINT_DARK,
    SPOT_DARK,
};

char *lightTypeNames[] =
{
    "INFINITE",
    "POINT",
    "SPOT",
    "POINT_POW",
    "SPOT_POW",
    "POINT_DARKPOW",
    "SPOT_DARKPOW",
    "POINT_DARK",
    "SPOT_DARK",
};

char *g_lightSomethingNames[] =
{
    "TEST",
    "STAGE",
    "BUMPER",
    "AUTO",
    "BG",
    "BG_PILLAR",
    "BG_WALL",
    "BG_COUNTER",
};

char *lbl_80177434[] =
{
    "DEFAULT",
    "SINGLE",
    "SINGLE_UNIT",
    "DEF_MINIMAP",
    "DEF_GMAT",
    "DEF_MIR",
    "BG_0",
    "BG_1",
    "BG_2",
    "BG_3",
    "BG_4",
    "BG_5",
    "BG_6",
    "BG_7",
    "BG_8",
    "BG_9",
    "BG_a",
    "BG_b",
    "BG_c",
    "BG_d",
    "BG_e",
    "BG_f",
};

struct MaybeStageLight
{
    s8 unk0;
    s8 unk1;
    s16 unk2;
    s8 type;
    s16 spotFn;
    u8 stageId;
    float unkC;
    float unk10;
    float unk14;
    Vec unk18;
    s16 rotX;
    s16 rotY;
    s16 rotZ;  // doesn't appear to be used
    Vec unk2C;
    float unk38;
    float unk3C;
    float unk40;
    float unk44;
    float unk48;
};

struct MaybeStageLight g_stageLightsMaybe[512] =  // lots of empty space at the end
{
    { 1, 3, 1, POINT,     GX_SP_OFF,   ST_150_TUTORIAL,     1,   1,   1, { 14.500019,       2.5, -21.000044},      0,      0, 0, {         0,          0,        -1},         2,         1,        0,        0,         0 },
    { 1, 3, 1, POINT_POW, GX_SP_OFF,   ST_134_RACE_ICE,   0.8,   1, 0.8, {   0.09996,   3.22824,    0.19996},      0,      0, 0, {         0,          0,        -1},        10,         1,        0,        0,         0 },
    { 1, 3, 1, POINT_POW, GX_SP_OFF,   ST_092_BONUS_WAVE, 0.8,   1, 0.8, {   0.09996,   3.22824,    0.19996},      0,      0, 0, {         0,          0,        -1},        10,         1,        0,        0,         0 },
    { 1, 3, 1, SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, {         0, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 3, 2, SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, { 15.000021, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 3, 3, SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, {-15.000021, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 5, 1, POINT,     GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.5,   0, {-42.699883, 31.400082, -24.599998},  -8576,   9344, 0, {-5313.7051,  -7326.543,   -4252.8}, 5.7001848, 12.300009, 1.959999, 1.709999,        20 },
    { 1, 5, 2, SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.8, 0.6, {       -35,      37.5,         25},      0,      0, 0, {  -0.40147,         -1,   0.29441},        50,       1.5,    -0.02,        0,        20 },
    { 1, 5, 3, POINT,     GX_SP_OFF,   ST_180_BILLIARDS,    1, 0.5,   0, { 50.599762,      37.5,        -25}, -25600,  28160, 0, {         0,          0,    -10000}, 20.100229, 12.900013,     0.09,        0, 15.599983 },
    { 1, 5, 4, SPOT,      GX_SP_OFF,   ST_180_BILLIARDS,    1, 0.8,   0, { 35.000038,      37.5,   25.00006},  -7680, -30080, 0, { 2290.4126, -4386.1626, 8689.9707}, 30.000267,       1.5,      0.6,     0.01, 25.000019 },
    { 1, 6, 1, POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {        80,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 2, POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {        40,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 3, POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {         0,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 4, POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {       -40,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 5, POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {       -80,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 6, POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,        10,         40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 7, POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,         0,         40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 8, POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,        10,        -40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 7, 1, SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.7, 0.3, {     28.25,        35,        -64}, -19328,      0, 0, {         0,  -0.960431,   0.27852}, 15.000019,         1,        0,        0,        25 },
    { 1, 7, 2, SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.7, 0.3, {    -26.75,        35,        -64}, -19328,      0, 0, {         0,  -0.960431,   0.27852}, 15.000019,         1,        0,        0,        25 },
    { -1 },
};

struct MaybeStageLight g_loadedStageLights[32];

void func_80021ECC_inline(struct MaybeStageLight *r29)
{
        printf("\x7B\t\n");
        printf("\t%d,\tLID_%s,\t%d,\n", r29->unk0, g_lightSomethingNames[r29->unk1], lbl_802F1C94);
        printf("\tLTP_%s,\t%d,\t%d,\n", lightTypeNames[r29->type], r29->spotFn, currStageId);
        printf("\t{ %f, %f, %f },\n", r29->unkC, r29->unk10, r29->unk14);
        printf("\t{ %f, %f, %f },\n", r29->unk18.x, r29->unk18.y, r29->unk18.z);
        printf("\t0x%x,\t0x%x,\t0x%x,\t{ %f, %f, %f },\n", r29->rotX, r29->rotY, r29->rotZ, r29->unk2C.x, r29->unk2C.y, r29->unk2C.z);
        printf("\t%f,\t%f,\t%f,\n", r29->unk38, r29->unk3C, r29->unk40);
        printf("\t%f,\t%f\n", r29->unk44, r29->unk48);
        printf("},\n\n");
}

#pragma dont_inline on
void func_800210FC(int stageId)
{
    u8 dummy[8];
    struct MaybeStageLight *r31 = g_stageLightsMaybe;

    while (r31->unk0 != -1)
    {
        if (r31->stageId == stageId)
            g_load_stage_light(r31);
        r31++;
    }
}
#pragma dont_inline reset

s8 func_80021164(int a, int b, int c)
{
    int i;
    struct MaybeStageLight *r7;

    for (r7 = g_loadedStageLights, i = 0; i < lbl_802F1C48; i++, r7++)
    {
        if (r7->unk1 == b && r7->unk2 == c)
            return i;
    }
    if (a == 1)
        return -1;
    for (r7 = g_loadedStageLights, i = 0; i < 32; i++, r7++)
    {
        if (r7->unk0 == 0)
            return i;
    }
    return -1;
}

void func_800212A8(struct MaybeStageLight *a)
{
    switch (a->type)
    {
    case INFINITE:
        a->unk2C.x = a->unk2C.y = 0.0f;
        a->unk2C.z = -1.0f;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(a->rotY);
        mathutil_mtxA_rotate_x(a->rotX);
        mathutil_mtxA_tf_vec(&a->unk2C, &a->unk2C);
        a->unk2C.x *= 10000.0f;
        a->unk2C.y *= 10000.0f;
        a->unk2C.z *= 10000.0f;
        break;
    case SPOT:
    case SPOT_POW:
    case SPOT_DARKPOW:
    case SPOT_DARK:
        if (a->unk1 != 5)
        {
            a->unk2C.x = a->unk2C.y = 0.0f;
            a->unk2C.z = -1.0f;
            mathutil_mtxA_from_identity();
            mathutil_mtxA_rotate_y(a->rotY);
            mathutil_mtxA_rotate_x(a->rotX);
            mathutil_mtxA_tf_vec(&a->unk2C, &a->unk2C);
        }
        break;
    }
}

struct LightGroup
{
    s16 unk0[8];
    u8 filler10[4];
    GXLightObj lightObjs[8];
    u32 lightMask;
    struct Color3f ambient;
    Mtx unk224;
    u8 filler254[4];
};

struct Struct80180F64 lbl_801F0614;

struct LightGroup lightGroups[22];

void g_init_light_params(struct LightGroup *a, int index, struct MaybeStageLight *c)
{
    Vec sp60;
    float f3;
    float f0;
    GXColor lightColor;
    GXLightObj lightObj;

    lightColor.r = c->unkC * 255.0f;
    lightColor.g = c->unk10 * 255.0f;
    lightColor.b = c->unk14 * 255.0f;
    lightColor.a = 255;

    switch (c->type)
    {
    case INFINITE:
    case POINT:
    case POINT_POW:
    case POINT_DARKPOW:
    case POINT_DARK:
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        break;
    case SPOT:
    case SPOT_POW:
    case SPOT_DARKPOW:
    case SPOT_DARK:
        GXInitLightSpot(&lightObj, c->unk48, c->spotFn);
        break;
    }

    f3 = (currLightGroup != 3) ? c->unk38 : c->unk38 * lbl_802F1C54;
    switch (c->type)
    {
    case INFINITE:
    case POINT:
    case SPOT:
        GXInitLightDistAttn(
            &lightObj,
            f3 * c->unk3C,
            c->unk40 + 0.05f,
            (c->type == INFINITE) ? 0 : (int)(c->unk44 * 100.0) + 3);
        break;
    case POINT_POW:
    case SPOT_POW:
        f3 *= f3;
        GXInitLightAttnK(
            &lightObj,
            c->unk3C * (-85.0f * (1.0f / f3)),
            c->unk40,
            c->unk44 + (0.95f / (0.05f * f3)));
        break;
    case POINT_DARKPOW:
    case SPOT_DARKPOW:
        GXInitLightAttnK(
            &lightObj,
            c->unk3C,
            c->unk40,
            (-0.1f + c->unk44) * (0.95f / (0.05f * (f3 * f3))));
        break;
    case POINT_DARK:
    case SPOT_DARK:
        GXInitLightAttnK(
            &lightObj,
            -1.0f + c->unk3C,
            c->unk40,
            (-0.1f + c->unk44) * (0.95f / (0.05f * (f3 * f3))));
        break;
    }

    GXInitLightColor(&lightObj, lightColor);

    f0 = (currLightGroup != 3) ? 0.0 : 2.05f * ((1.0f / lbl_802F1C54) - 1.0f);
    sp60.x = c->unk18.x;
    sp60.y = c->unk18.y + f0;
    sp60.z = c->unk18.z;
    switch (c->type)
    {
    case INFINITE:
        mathutil_mtxA_tf_point(&c->unk2C, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    case POINT:
    case POINT_POW:
    case POINT_DARKPOW:
    case POINT_DARK:
        mathutil_mtxA_tf_point(&sp60, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    case SPOT:
    case SPOT_POW:
    case SPOT_DARKPOW:
    case SPOT_DARK:
        mathutil_mtxA_tf_point(&sp60, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        mathutil_mtxA_tf_vec(&c->unk2C, &sp60);
        GXInitLightDir(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    }
    GXLoadLightObjImm(&lightObj, (1 << index));
    memcpy(&a->lightObjs[index], &lightObj, sizeof(a->lightObjs[index]));
}

void func_8002170C(int stageId)
{
    struct MaybeStageLight spC;

    lbl_801F0614 = lbl_80180F64[(backgroundInfo.bgId < 0 || stageId == 0) ? 0 : backgroundInfo.bgId];
    if (lbl_801F0614.unk34 == 0.0
     && lbl_801F0614.unk38 == 0.0
     && lbl_801F0614.unk3C == 0.0)
        return;

    if (stageId != 0)
    {
        if (stageId == ST_099_JUNGLE_BG && advDemoInfo.flags & (1 << 8))
            lbl_801F0614.unk42 = 0x2000;
        if (gameSubmode == SMD_GAME_CONTINUE_INIT || gameSubmode == SMD_GAME_CONTINUE_MAIN)
        {
            lbl_801F0614.unk40 = 0;
            lbl_801F0614.unk42 = 0x4000;
        }
        if (backgroundInfo.bgId == BG_TYPE_WAT && modeCtrl.unk30 > 1)
            func_800225FC(0.4f, 0.6f, 0.9f);
        switch (stageId)
        {
        case ST_145_FIGHT_SPACE:
            func_800225FC(0.4f, 0.35f, 0.5f);
            break;
        case ST_131_RACE_SPACE:
            func_800225FC(0.4f, 0.35f, 0.5f);
            break;
        case ST_138_RACE_DESERT:
            func_800225FC(0.4f, 0.35f, 0.3f);
            break;
        case ST_135_RACE_DOWNTOWN:
            func_800225FC(0.55f, 0.55f, 0.7f);
            break;
        }
        if (backgroundInfo.bgId == BG_TYPE_END)
        {
            switch (modeCtrl.levelSet)
            {
            case LVLSET_BEGINNER:
                lbl_801F0614.unk42 += 45056;
                break;
            }
        }
    }
    memset(&spC, 0, sizeof(spC));
    spC.unk1 = 1;
    spC.unk2 = 0;
    spC.type = INFINITE;
    spC.unkC = lbl_801F0614.unk34;
    spC.unk10 = lbl_801F0614.unk38;
    spC.unk14 = lbl_801F0614.unk3C;
    spC.rotX = lbl_801F0614.unk40;
    spC.rotY = lbl_801F0614.unk42;
    g_load_stage_light(&spC);
}

struct Struct80110260
{
    s32 unk0;
    s32 unk4;
};

const struct Struct80110260 lbl_80110260[] =
{
    {0, 3},
    {1, 3},
    {1, 1},
    {0, 1},
    {0, 1},
    {0, 1},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
    {0, 3},
};

void func_80021958(void)
{
    int i;
    int j;
    struct MaybeStageLight *r7;
    const struct Struct80110260 *r25;
    struct LightGroup *lightGrp;

    lightGrp = lightGroups;
    for (i = 0; i < 22; i++, lightGrp++)
    {
        for (j = 0; j < 8; j++)
            lightGrp->unk0[j] = -1;
        lightGrp->ambient.r = lbl_801F0614.unk4;
        lightGrp->ambient.g = lbl_801F0614.unk8;
        lightGrp->ambient.b = lbl_801F0614.unkC;
    }

    r7 = g_loadedStageLights;
    j = 0;
    lightGrp = lightGroups;
    for (i = 0; i < 32; i++, r7++)
    {
        if (r7->unk0 != 0
         && (r7->unk1 == 1 || r7->unk1 == 0 || r7->unk1 == 3))
        {
            lightGrp->unk0[j] = i;
            if (++j == 8)
                break;
        }
    }

    if (g_loadedStageLights[0].unk0 != 0)
        lightGroups[1].unk0[0] = 0;

    r25 = lbl_80110260 + 2;
    for (i = 2; i < 6; i++, r25++)
        memcpy(&lightGroups[i], &lightGroups[r25->unk0], sizeof(lightGroups[i]));

    if (lbl_801F0614.unk44 == NULL)
        return;

    lightGrp = lightGroups + 7;
    for (i = 7; i < 22; i++, lightGrp++)
    {
        int var = i - 7;
        if (lbl_801F0614.unk44[var] == NULL)
            break;
        for (j = 0; j < 8; j++)
        {
            s8 r4 = lbl_801F0614.unk44[var][j * 2 + 0];
            if (r4 == -1)
                break;
            lightGrp->unk0[j] = func_80021164(1, r4, lbl_801F0614.unk44[var][j * 2 + 1]);
        }

    }
}

void func_80021C44(struct LightGroup *lightGrp)
{
    Vec lightPos;
    GXColor lightColor;
    int r5 = TRUE;

    if (lightGrp->unk0[0] == -1)
        r5 = FALSE;
    else
    {
        if (g_loadedStageLights[lightGrp->unk0[0]].unk0 == 0
         || g_loadedStageLights[lightGrp->unk0[0]].type != INFINITE)
            r5 = FALSE;
    }

    if (r5)
    {
        GXGetLightPos(&lightGrp->lightObjs[0], &lightPos.x, &lightPos.y, &lightPos.z);
        GXGetLightColor(&lightGrp->lightObjs[0], &lightColor);
        g_avdisp_set_and_normalize_some_vec(&lightPos);
        g_avdisp_set_some_color_scale(
            lightColor.r / 255.0f,
            lightColor.g / 255.0f,
            lightColor.b / 255.0f);
    }
    else if (func_8009D5D8() != 0)
    {
        Vec spC = {0.0f, 1.0f, -0.5f};

        mathutil_mtxA_push();
        mathutil_mtxA_from_rotate_y(currentCameraStructPtr->rotY);
        mathutil_mtxA_tf_vec(&spC, &spC);
        mathutil_mtxA_pop();
        g_avdisp_set_and_normalize_some_vec(&spC);
        g_avdisp_set_some_color_scale(1.0f, 1.0f, 1.0f);
    }
    else
        g_avdisp_set_some_color_scale(0.0f, 0.0f, 0.0f);
}

void g_init_light_stuff_for_stage(int stageId)
{
    u8 dummy[8];
    int i;
    struct MaybeStageLight *r27;

    r27 = g_loadedStageLights;
    for (i = 0; i < 32; i++, r27++)
    {
        memset(r27, 0, sizeof(*r27));
        r27->unk0 = 0;
        r27->unk1 = 0;
        r27->unk2 = 0;
        r27->type = POINT;
        r27->unk38 = 2.0f;
        r27->unk3C = 1.0f;
        r27->unk40 = 0.0f;
        r27->unk44 = 0.0f;
        r27->spotFn = GX_SP_COS2;
        r27->unk48 = 45.0f;
    }
    lbl_802F1C48 = 0;
    func_8002170C(stageId);

    r27 = g_stageLightsMaybe;
    while (r27->unk0 != -1)
    {
        if (r27->stageId == stageId)
            g_load_stage_light(r27);
        r27++;
    }
    lbl_802F1C7C = (stageId == 0) ? currStageId : stageId;
}

void func_80021ECC(void)
{
    u8 dummy[8];
    int i;
    struct MaybeStageLight *r28;

    g_lightPerfTimer = 0;
    func_8000E428(lbl_801F0614.unk14, lbl_801F0614.unk18, lbl_801F0614.unk1C);
    func_8000E3BC();
    lbl_802F1C48 = 0;

    r28 = g_loadedStageLights;
    for (i = 0; i < 32; i++, r28++)
    {
        if (r28->unk0 != 0)
        {
            func_800212A8(r28);
            lbl_802F1C48 = i + 1;
        }
    }
    currLightGroup = -1;
    lbl_802F1C4C = -1;
    lightGroupStack[0] = -1;
    lightGroupStack[1] = -1;
    lightGroupStack[2] = -1;
    lightGroupStackPos = 0;
    lbl_802F1C54 = 1.0f;
    lbl_802F1C68 = 0;
    lbl_802F1C64 = 0;
    lbl_802F1C60 = 0;
    numLightObjsLoaded = 0;
    if (lbl_802F1C78 == 0)
        func_80021958();
    mathutil_mtxA_from_mtxB();
    load_light_group(0);
    if (lbl_802F1C88 != 0)
    {
        func_80021ECC_inline(&g_loadedStageLights[lbl_802F1C94]);
        lbl_802F1C88 = 0;
    }
    if (lbl_802F1C84 != 0)
    {
        if (lbl_802F1C7C == currStageId)
            memcpy(&g_loadedStageLights[lbl_802F1C94], &g_loadedStageLights[lbl_802F1C80], sizeof(g_loadedStageLights[lbl_802F1C94]));
        else
            func_800210FC(lbl_802F1C7C);
        lbl_802F1C84 = 0;
    }
}

BOOL g_load_stage_light(struct MaybeStageLight *a)
{
    int r31 = func_80021164(0, a->unk1, a->unk2);
    struct MaybeStageLight *r30;

    if (r31 == -1)
        return FALSE;
    r30 = &g_loadedStageLights[r31];
    memcpy(r30, a, sizeof(*r30));
    r30->unk0 = 1;
    r30->unk3C = (a->unk3C == 0.0f) ? 1.0f : a->unk3C;
    r30->unk40 = (a->unk40 == 0.0f) ? 0.0f : a->unk40;
    r30->unk44 = (a->unk44 == 0.0f) ? 0.0f : a->unk44;
    lbl_802F1C48 = r31 + 1;
    return TRUE;
}

#pragma force_active on
struct MaybeStageLight *func_80022224(int a, int b)
{
    a = func_80021164(1, a, b);
    return (a == -1) ? NULL : &g_loadedStageLights[a];
}
#pragma force_active reset

void load_light_group(int lightGrpId)
{
    const struct Struct80110260 *r31;
    struct LightGroup *lightGrp;
    int i;

    perf_init_timer(0);
    currLightGroup = lightGrpId;
    lbl_802F1C68++;
    lightGrp = &lightGroups[lightGrpId];
    r31 = &lbl_80110260[lightGrpId];
    mathutil_mtxA_to_mtx(lightGrp->unk224);
    if (r31->unk0 != lbl_802F1C4C || (r31->unk4 & 1) != 0)
    {
        lightGrp->lightMask = 0;
        for (i = 0; i < 8; i++)
        {
            if (lightGrp->unk0[i] != -1)
            {
                struct MaybeStageLight *r3 = &g_loadedStageLights[lightGrp->unk0[i]];

                if (r3->unk0 != 0)
                {
                    g_init_light_params(lightGrp, i, r3);
                    lightGrp->lightMask |= 1 << i;
                    lbl_802F1C64++;
                }
            }
        }
        g_nl2ngc_set_light_mask(lightGrp->lightMask);
        avdisp_set_light_mask(lightGrp->lightMask);
    }
    if (r31->unk0 != lbl_802F1C4C || (r31->unk4 & 2) != 0)
        g_set_ambient_color(lightGrp->ambient.r, lightGrp->ambient.g, lightGrp->ambient.b);
    func_80021C44(lightGrp);
    lbl_802F1C4C = r31->unk0;
    g_lightPerfTimer += perf_stop_timer(0);
}

int func_800223D0(void)
{
    return currLightGroup;
}

void func_800223D8(int lightGrpId)
{
    const struct Struct80110260 *r29;
    int i;
    struct LightGroup *lightGrp;

    perf_init_timer(0);
    currLightGroup = lightGrpId;
    lbl_802F1C60++;
    lightGrp = &lightGroups[lightGrpId];
    r29 = &lbl_80110260[lightGrpId];
    if (r29->unk0 != lbl_802F1C4C || (r29->unk4 & 1) != 0)
    {
        for (i = 0; i < 8; i++)
        {
            if (lightGrp->lightMask & (1 << i))
            {
                GXLoadLightObjImm(&lightGrp->lightObjs[i], (1 << i));
                numLightObjsLoaded++;
            }
        }
        g_nl2ngc_set_light_mask(lightGrp->lightMask);
        avdisp_set_light_mask(lightGrp->lightMask);
    }
    func_80021C44(lightGrp);
    lbl_802F1C4C = r29->unk0;
    g_lightPerfTimer += perf_stop_timer(0);
}

void push_light_group(void)
{
    if (lightGroupStackPos == LIGHTGROUP_STACK_MAX)
        printf("LIGHT ERROR!!! PushLightGroup() stack over.\n");
    else
    {
        lightGroupStack[lightGroupStackPos] = currLightGroup;
        lightGroupStackPos++;
    }
}

void pop_light_group(void)
{
    if (lightGroupStackPos == 0)
        printf("LIGHT ERROR!!! PopLightGroup() stack null.\n");
    else
    {
        lightGroupStackPos--;
        mathutil_mtxA_push();
        mathutil_mtxA_from_mtx(lightGroups[lightGroupStack[lightGroupStackPos]].unk224);
        load_light_group(lightGroupStack[lightGroupStackPos]);
        mathutil_mtxA_pop();
    }
}

void func_800225C0(void)
{
    currLightGroup = -1;
    lbl_802F1C4C = -1;
    mathutil_mtxA_from_mtxB();
    load_light_group(0);
}

void func_800225F4(float a)
{
    lbl_802F1C54 = a;
}

void func_800225FC(float a, float b, float c)
{
    lbl_801F0614.unk4 = a;
    lbl_801F0614.unk8 = b;
    lbl_801F0614.unkC = c;
}

void g_set_ambient_color(float r, float g, float b)
{
    g_nl2ngc_set_ambient_color(r, g, b);
    avdisp_set_ambient(r, g, b);
}

void get_curr_light_group_ambient_color(struct Color3f *color)
{
    *color = lightGroups[currLightGroup].ambient;
}

void apply_curr_light_group_ambient_color(void)
{
    struct Color3f *ambient = &lightGroups[currLightGroup].ambient;

    g_nl2ngc_set_ambient_color(ambient->r, ambient->g, ambient->b);
    avdisp_set_ambient(ambient->r, ambient->g, ambient->b);
}

void func_800226F4(void)
{
    u8 dummy[24];
    struct MaybeStageLight *r31;
    struct NaomiMesh *mesh;

    if (lbl_802F1C8C == 0)
        return;
    r31 = &g_loadedStageLights[lbl_802F1C94];
    switch (r31->type)
    {
    case POINT:
    case POINT_POW:
    case POINT_DARKPOW:
    case POINT_DARK:
        mesh = (struct NaomiMesh *)NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B)->meshStart;
        mesh->unk30 = 1.0f;
        mesh->unk34 = 0.0f;
        mesh->unk38 = 0.0f;
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->unk18);
        mathutil_mtxA_scale_s(r31->unk38 * 2.0);
        g_nl2ngc_set_scale(r31->unk38 * 2.0);
        g_draw_naomi_model_with_alpha_deferred(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B), 0.5f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->unk18);
        g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B));
        break;
    case INFINITE:
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&currentCameraStructPtr->lookAt);
        mathutil_mtxA_rotate_y(r31->rotY);
        mathutil_mtxA_rotate_x(r31->rotX);
        mathutil_mtxA_rotate_x(0x8000);
        g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_spotl1));
        break;
    case SPOT:
    case SPOT_POW:
    case SPOT_DARKPOW:
    case SPOT_DARK:
        mesh = (struct NaomiMesh *)NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B)->meshStart;
        mesh->unk30 = 1.0f;
        mesh->unk34 = 0.0f;
        mesh->unk38 = 0.0f;
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->unk18);
        mathutil_mtxA_scale_s(r31->unk38 * 2.0);
        g_nl2ngc_set_scale(r31->unk38 * 2.0);
        g_draw_naomi_model_with_alpha_deferred(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B), 0.5f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->unk18);
        mathutil_mtxA_rotate_y(r31->rotY);
        mathutil_mtxA_rotate_x(r31->rotX);
        g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_spotl1));
        break;
    }
}

struct
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
} lbl_801F39EC;

void func_800228A8(int stageId)
{
    func_8002170C(stageId);
    lbl_801F39EC.unk0 = lbl_801F0614.unk10;
    lbl_801F39EC.unk4 = lbl_801F0614.unk14;
    lbl_801F39EC.unk8 = lbl_801F0614.unk18;
    lbl_801F39EC.unkC = lbl_801F0614.unk1C;
    lbl_801F0614.unk10 = 0.0f;
    lbl_801F0614.unk14 = 0.7f;
    lbl_801F0614.unk18 = 0.7f;
    lbl_801F0614.unk1C = 0.7f;
}

void func_80022910(int stageId)
{
    func_8002170C(stageId);
    lbl_801F39EC.unk0 = lbl_801F0614.unk10;
    lbl_801F39EC.unk4 = lbl_801F0614.unk14;
    lbl_801F39EC.unk8 = lbl_801F0614.unk18;
    lbl_801F39EC.unkC = lbl_801F0614.unk1C;
    lbl_801F0614.unk10 = 0.0f;
    lbl_801F0614.unk14 = 0.5f;
    lbl_801F0614.unk18 = 0.5f;
    lbl_801F0614.unk1C = 0.5f;
}

s8 lbl_80180E30[10] = { 5, 1, 5, 2, 5, 3, 5, 4, -1, -1 };
s8 lbl_80180E3C[18] = { 6, 1, 6, 2, 6, 3, 6, 4, 6, 5, 6, 6, 6, 7, 6, 8, -1, -1 };
s8 lbl_802F03F8[8]  = { 6, 2, 6, 3, 6, 4, -1, -1 };
s8 lbl_802F0400[6]  = { 7, 1, 7, 2, -1, -1 };
s8 lbl_80180E50[10] = { 7, 1, 7, 2, 5, 1, 5, 3, -1, -1 };
s8 lbl_802F0408[6]  = { 5, 1, 6, 8, -1, -1 };
s8 lbl_802F0410[4]  = { 5, 3, -1, -1 };
s8 lbl_80180E5C[10] = { 5, 4, 6, 1, 6, 2, 6, 3, -1, -1 };

s8 *lbl_80180E68[] =
{
    lbl_80180E30,
    lbl_80180E3C,
    lbl_802F03F8,
    lbl_802F0400,
    lbl_80180E50,
    lbl_802F0408,
    lbl_802F0410,
    lbl_80180E5C,
    NULL,
};

struct Struct80180F14 lbl_80180F14[] =
{
    {"BILL_FLOOR",       1},
    {"BILL_WALL",        2},
    {"BILL_PILLAR00",    1},
    {"BILL_BOX",         3},
    {"BILL_BAR_COUNTER", 4},
    {"BILL_CHAIR00",     5},
    {"BILL_PLANT00",     6},
    {"BILL_PLANT01",     7},
    {"BILL_PLANT02",     8},
    {NULL,              -1},
};

struct Struct80180F64 lbl_80180F64[] =
{
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0,   0,   0,   0, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,  0.1, 0.11,  0.1,   4096,     0, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    0,    0,    0,  16384,     0, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    0, 0.05, 0.05,   8192, 24576, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,  0.1,  0.1,  0.5,  12288,  8192, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,  0.3,  0.3,  0.3,   8192, 24576, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.25,  0.2,    0,   8192, 24576, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,  0.1, 0.05, 0.05,   8192, 24576, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.8,  0.3,  0.4,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,  -6272, 26752, NULL },
    { 0.8,  0.8,  0.8,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.05, 0.05,  0.1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6, 0.28, 0.48, 0.63, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,  0.6, 0.85,    1,   8192, 24576, NULL },
    { 0.6,  0.4,  0.4,  0.7, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.4,  0.4,  0.7, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.3,  0.5, 0.45,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,  29184, 17664, NULL },
    { 0.6, 0.45,  0.4, 0.25, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,  24576, 24576, NULL },
    { 0.6, 0.55,  0.6, 0.85, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.3,  0.3, 0.45, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.7,  0.8, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,  0.8,  0.8,  0.8, -11776, 21888, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.4,  0.4, 0.55, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    0,    0,    0,   8192, 24576, lbl_80180E68 },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
    { 0.6,  0.6,  0.6,  0.6, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0,    1,    1,    1,   8192, 24576, NULL },
};
