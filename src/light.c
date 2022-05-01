#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "adv.h"
#include "background.h"
#include "camera.h"
#include "global.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "perf.h"
#include "stage.h"

#include "../data/common.nlobj.h"

s32 s_currLightGroup;
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
s32 s_numLightObjsLoaded;
s32 s_g_lightPerfTimer;
float g_minimap_light_ref_dist_scale;
s8 s_lightGroupStackPos;
s32 lbl_802F1C4C;
s32 lbl_802F1C48;

#define LIGHTGROUP_STACK_MAX 3
u32 lightGroupStack[LIGHTGROUP_STACK_MAX];
FORCE_BSS_ORDER(lightGroupStack)

s8 lbl_802F0310[8] = {0};

// light types?

enum
{
    LIGHT_TYPE_INFINITE,
    LIGHT_TYPE_POINT,
    LIGHT_TYPE_SPOT,
    LIGHT_TYPE_POINT_POW,
    LIGHT_TYPE_SPOT_POW,
    LIGHT_TYPE_POINT_DARKPOW,
    LIGHT_TYPE_SPOT_DARKPOW,
    LIGHT_TYPE_POINT_DARK,
    LIGHT_TYPE_SPOT_DARK,
};

char *lightTypeNames[] = {
    "INFINITE",      "POINT",        "SPOT",       "POINT_POW", "SPOT_POW",
    "POINT_DARKPOW", "SPOT_DARKPOW", "POINT_DARK", "SPOT_DARK",
};

char *g_lightSomethingNames[] = {
    "TEST", "STAGE", "BUMPER", "AUTO", "BG", "BG_PILLAR", "BG_WALL", "BG_COUNTER",
};

char *s_lightGroupNames[] = {
    "DEFAULT", "SINGLE", "SINGLE_UNIT", "DEF_MINIMAP", "DEF_GMAT", "DEF_MIR", "BG_0", "BG_1",
    "BG_2",    "BG_3",   "BG_4",        "BG_5",        "BG_6",     "BG_7",    "BG_8", "BG_9",
    "BG_a",    "BG_b",   "BG_c",        "BG_d",        "BG_e",     "BG_f",
};

// Definition of a single light. Referred to by light groups
struct Light
{
    s8 valid; // 1 if valid, -1 for end of list
    s8 unk1;
    s16 unk2;
    s8 type;
    s16 spotFn;
    u8 stageId;
    float red;
    float green;
    float blue;

    // Pose in world space
    Point3d pos;
    s16 rotX;
    s16 rotY;
    s16 rotZ; // Doesn't appear to be used
    Vec dir;

    // Attentuation params (may be used differently depending on light type)
    float refDist;
    float k0;
    float k1;
    float k2;
    float spotCutoff; // Angle cutoff for spot light
};

// clang-format off
struct Light s_g_stageLightsMaybe[512] =  // lots of empty space at the end
{
    { 1, 3, 1, LIGHT_TYPE_POINT,     GX_SP_OFF,   ST_150_TUTORIAL,     1,   1,   1, { 14.500019,       2.5, -21.000044},      0,      0, 0, {         0,          0,        -1},         2,         1,        0,        0,         0 },
    { 1, 3, 1, LIGHT_TYPE_POINT_POW, GX_SP_OFF,   ST_134_RACE_ICE,   0.8,   1, 0.8, {   0.09996,   3.22824,    0.19996},      0,      0, 0, {         0,          0,        -1},        10,         1,        0,        0,         0 },
    { 1, 3, 1, LIGHT_TYPE_POINT_POW, GX_SP_OFF,   ST_092_BONUS_WAVE, 0.8,   1, 0.8, {   0.09996,   3.22824,    0.19996},      0,      0, 0, {         0,          0,        -1},        10,         1,        0,        0,         0 },
    { 1, 3, 1, LIGHT_TYPE_SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, {         0, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 3, 2, LIGHT_TYPE_SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, { 15.000021, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 3, 3, LIGHT_TYPE_SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, {-15.000021, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 5, 1, LIGHT_TYPE_POINT,     GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.5,   0, {-42.699883, 31.400082, -24.599998},  -8576,   9344, 0, {-5313.7051,  -7326.543,   -4252.8}, 5.7001848, 12.300009, 1.959999, 1.709999,        20 },
    { 1, 5, 2, LIGHT_TYPE_SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.8, 0.6, {       -35,      37.5,         25},      0,      0, 0, {  -0.40147,         -1,   0.29441},        50,       1.5,    -0.02,        0,        20 },
    { 1, 5, 3, LIGHT_TYPE_POINT,     GX_SP_OFF,   ST_180_BILLIARDS,    1, 0.5,   0, { 50.599762,      37.5,        -25}, -25600,  28160, 0, {         0,          0,    -10000}, 20.100229, 12.900013,     0.09,        0, 15.599983 },
    { 1, 5, 4, LIGHT_TYPE_SPOT,      GX_SP_OFF,   ST_180_BILLIARDS,    1, 0.8,   0, { 35.000038,      37.5,   25.00006},  -7680, -30080, 0, { 2290.4126, -4386.1626, 8689.9707}, 30.000267,       1.5,      0.6,     0.01, 25.000019 },
    { 1, 6, 1, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {        80,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 2, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {        40,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 3, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {         0,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 4, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {       -40,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 5, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {       -80,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 6, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,        10,         40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 7, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,         0,         40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 8, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,        10,        -40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 7, 1, LIGHT_TYPE_SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.7, 0.3, {     28.25,        35,        -64}, -19328,      0, 0, {         0,  -0.960431,   0.27852}, 15.000019,         1,        0,        0,        25 },
    { 1, 7, 2, LIGHT_TYPE_SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.7, 0.3, {    -26.75,        35,        -64}, -19328,      0, 0, {         0,  -0.960431,   0.27852}, 15.000019,         1,        0,        0,        25 },
    { -1 },
};
// clang-format on

// Light groups refer to lights by index in here
struct Light s_g_lightPool[32];

void func_80021ECC_inline(struct Light *r29)
{
    printf("\x7B\t\n");
    printf("\t%d,\tLID_%s,\t%d,\n", r29->valid, g_lightSomethingNames[r29->unk1], lbl_802F1C94);
    printf("\tLTP_%s,\t%d,\t%d,\n", lightTypeNames[r29->type], r29->spotFn, currStageId);
    printf("\t{ %f, %f, %f },\n", r29->red, r29->green, r29->blue);
    printf("\t{ %f, %f, %f },\n", r29->pos.x, r29->pos.y, r29->pos.z);
    printf("\t0x%x,\t0x%x,\t0x%x,\t{ %f, %f, %f },\n", r29->rotX, r29->rotY, r29->rotZ,
           r29->dir.x, r29->dir.y, r29->dir.z);
    printf("\t%f,\t%f,\t%f,\n", r29->refDist, r29->k0, r29->k1);
    printf("\t%f,\t%f\n", r29->k2, r29->spotCutoff);
    printf("},\n\n");
}

#pragma dont_inline on
void func_800210FC(int stageId)
{
    u8 dummy[8];
    struct Light *light = s_g_stageLightsMaybe;

    while (light->valid != -1)
    {
        if (light->stageId == stageId)
            alloc_light(light);
        light++;
    }
}
#pragma dont_inline reset

s8 light_pool_alloc(int a, int b, int c)
{
    int i;
    struct Light *light;

    for (light = s_g_lightPool, i = 0; i < lbl_802F1C48; i++, light++)
    {
        if (light->unk1 == b && light->unk2 == c)
            return i;
    }
    if (a == 1)
        return -1;
    for (light = s_g_lightPool, i = 0; i < 32; i++, light++)
    {
        if (light->valid == 0)
            return i;
    }
    return -1;
}

void func_800212A8(struct Light *a)
{
    switch (a->type)
    {
    case LIGHT_TYPE_INFINITE:
        a->dir.x = a->dir.y = 0.0f;
        a->dir.z = -1.0f;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(a->rotY);
        mathutil_mtxA_rotate_x(a->rotX);
        mathutil_mtxA_tf_vec(&a->dir, &a->dir);
        a->dir.x *= 10000.0f;
        a->dir.y *= 10000.0f;
        a->dir.z *= 10000.0f;
        break;
    case LIGHT_TYPE_SPOT:
    case LIGHT_TYPE_SPOT_POW:
    case LIGHT_TYPE_SPOT_DARKPOW:
    case LIGHT_TYPE_SPOT_DARK:
        if (a->unk1 != 5)
        {
            a->dir.x = a->dir.y = 0.0f;
            a->dir.z = -1.0f;
            mathutil_mtxA_from_identity();
            mathutil_mtxA_rotate_y(a->rotY);
            mathutil_mtxA_rotate_x(a->rotX);
            mathutil_mtxA_tf_vec(&a->dir, &a->dir);
        }
        break;
    }
}

struct LightGroup
{
    s16 lightPoolIdxs[8];
    u8 filler10[4];
    GXLightObj lightObjs[8];
    u32 lightMask;
    struct Color3f ambient;
    Mtx viewFromWorld;
    u8 filler254[4];
};

struct BgLightSomething s_g_currBgSomething;

struct LightGroup s_lightGroups[22];

void load_light(struct LightGroup *group, int lightIdxInGroup, struct Light *light)
{
    Vec sp60;
    float f3;
    float f0;
    GXColor lightColor;
    GXLightObj lightObj;

    lightColor.r = light->red * 255.0f;
    lightColor.g = light->green * 255.0f;
    lightColor.b = light->blue * 255.0f;
    lightColor.a = 255;

    switch (light->type)
    {
    case LIGHT_TYPE_INFINITE:
    case LIGHT_TYPE_POINT:
    case LIGHT_TYPE_POINT_POW:
    case LIGHT_TYPE_POINT_DARKPOW:
    case LIGHT_TYPE_POINT_DARK:
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        break;
    case LIGHT_TYPE_SPOT:
    case LIGHT_TYPE_SPOT_POW:
    case LIGHT_TYPE_SPOT_DARKPOW:
    case LIGHT_TYPE_SPOT_DARK:
        GXInitLightSpot(&lightObj, light->spotCutoff, light->spotFn);
        break;
    }

    f3 = (s_currLightGroup != LIGHT_GROUP_DEF_MINIMAP) ? light->refDist : light->refDist * g_minimap_light_ref_dist_scale;
    switch (light->type)
    {
    case LIGHT_TYPE_INFINITE:
    case LIGHT_TYPE_POINT:
    case LIGHT_TYPE_SPOT:
        GXInitLightDistAttn(&lightObj, f3 * light->k0, light->k1 + 0.05f,
                            (light->type == LIGHT_TYPE_INFINITE) ? 0
                                                                 : (int)(light->k2 * 100.0) + 3);
        break;
    case LIGHT_TYPE_POINT_POW:
    case LIGHT_TYPE_SPOT_POW:
        f3 *= f3;
        GXInitLightAttnK(&lightObj, light->k0 * (-85.0f * (1.0f / f3)), light->k1,
                         light->k2 + (0.95f / (0.05f * f3)));
        break;
    case LIGHT_TYPE_POINT_DARKPOW:
    case LIGHT_TYPE_SPOT_DARKPOW:
        GXInitLightAttnK(&lightObj, light->k0, light->k1,
                         (-0.1f + light->k2) * (0.95f / (0.05f * (f3 * f3))));
        break;
    case LIGHT_TYPE_POINT_DARK:
    case LIGHT_TYPE_SPOT_DARK:
        GXInitLightAttnK(&lightObj, -1.0f + light->k0, light->k1,
                         (-0.1f + light->k2) * (0.95f / (0.05f * (f3 * f3))));
        break;
    }

    GXInitLightColor(&lightObj, lightColor);

    f0 = (s_currLightGroup != LIGHT_GROUP_DEF_MINIMAP) ? 0.0 : 2.05f * ((1.0f / g_minimap_light_ref_dist_scale) - 1.0f);
    sp60.x = light->pos.x;
    sp60.y = light->pos.y + f0;
    sp60.z = light->pos.z;
    switch (light->type)
    {
    case LIGHT_TYPE_INFINITE:
        mathutil_mtxA_tf_point(&light->dir, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    case LIGHT_TYPE_POINT:
    case LIGHT_TYPE_POINT_POW:
    case LIGHT_TYPE_POINT_DARKPOW:
    case LIGHT_TYPE_POINT_DARK:
        mathutil_mtxA_tf_point(&sp60, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    case LIGHT_TYPE_SPOT:
    case LIGHT_TYPE_SPOT_POW:
    case LIGHT_TYPE_SPOT_DARKPOW:
    case LIGHT_TYPE_SPOT_DARK:
        mathutil_mtxA_tf_point(&sp60, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        mathutil_mtxA_tf_vec(&light->dir, &sp60);
        GXInitLightDir(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    }
    GXLoadLightObjImm(&lightObj, (1 << lightIdxInGroup));
    memcpy(&group->lightObjs[lightIdxInGroup], &lightObj, sizeof(group->lightObjs[lightIdxInGroup]));
}

void func_8002170C(int stageId)
{
    struct Light light;

    s_g_currBgSomething =
        s_g_perBgSomethings[(backgroundInfo.bgId < 0 || stageId == 0) ? 0 : backgroundInfo.bgId];
    if (s_g_currBgSomething.lightRed == 0.0 && s_g_currBgSomething.lightGreen == 0.0 && s_g_currBgSomething.lightBlue == 0.0)
        return;

    if (stageId != 0)
    {
        if (stageId == ST_099_JUNGLE_BG && advDemoInfo.flags & (1 << 8))
            s_g_currBgSomething.lightRotY = DEGREES_TO_S16(45);
        if (gameSubmode == SMD_GAME_CONTINUE_INIT || gameSubmode == SMD_GAME_CONTINUE_MAIN)
        {
            s_g_currBgSomething.lightRotX = 0;
            s_g_currBgSomething.lightRotY = DEGREES_TO_S16(90);
        }
        if (backgroundInfo.bgId == BG_TYPE_WAT && modeCtrl.unk30 > 1)
            g_set_bg_ambient(0.4f, 0.6f, 0.9f);
        switch (stageId)
        {
        case ST_145_FIGHT_SPACE:
            g_set_bg_ambient(0.4f, 0.35f, 0.5f);
            break;
        case ST_131_RACE_SPACE:
            g_set_bg_ambient(0.4f, 0.35f, 0.5f);
            break;
        case ST_138_RACE_DESERT:
            g_set_bg_ambient(0.4f, 0.35f, 0.3f);
            break;
        case ST_135_RACE_DOWNTOWN:
            g_set_bg_ambient(0.55f, 0.55f, 0.7f);
            break;
        }
        if (backgroundInfo.bgId == BG_TYPE_END)
        {
            switch (modeCtrl.levelSet)
            {
            case LVLSET_BEGINNER:
                s_g_currBgSomething.lightRotY += 45056;
                break;
            }
        }
    }
    memset(&light, 0, sizeof(light));
    light.unk1 = 1;
    light.unk2 = 0;
    light.type = LIGHT_TYPE_INFINITE;
    light.red = s_g_currBgSomething.lightRed;
    light.green = s_g_currBgSomething.lightGreen;
    light.blue = s_g_currBgSomething.lightBlue;
    light.rotX = s_g_currBgSomething.lightRotX;
    light.rotY = s_g_currBgSomething.lightRotY;
    alloc_light(&light);
}

struct LightGroupSomething
{
    s32 g_someLGIdxToCopy; // Copy this light group to groups 2-5 inclusive
    u32 flags;
};

// Oner per light group
// clang-format off
const struct LightGroupSomething s_g_lightGroupSomethings[] = {
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
// clang-format on

void func_80021958(void)
{
    int i;
    int j;
    struct Light *light;
    const struct LightGroupSomething *r25;
    struct LightGroup *lightGrp;

    lightGrp = s_lightGroups;
    for (i = 0; i < 22; i++, lightGrp++)
    {
        for (j = 0; j < 8; j++)
            lightGrp->lightPoolIdxs[j] = -1;
        lightGrp->ambient.r = s_g_currBgSomething.ambient.r;
        lightGrp->ambient.g = s_g_currBgSomething.ambient.g;
        lightGrp->ambient.b = s_g_currBgSomething.ambient.b;
    }

    light = s_g_lightPool;
    j = 0;
    lightGrp = s_lightGroups;
    for (i = 0; i < 32; i++, light++)
    {
        if (light->valid != 0 && (light->unk1 == 1 || light->unk1 == 0 || light->unk1 == 3))
        {
            lightGrp->lightPoolIdxs[j] = i;
            if (++j == 8)
                break;
        }
    }

    if (s_g_lightPool[0].valid != 0)
        s_lightGroups[1].lightPoolIdxs[0] = 0;

    r25 = &(s_g_lightGroupSomethings[LIGHT_GROUP_SINGLE_UNIT]);
    for (i = 2; i < 6; i++, r25++)
        memcpy(&s_lightGroups[i], &s_lightGroups[r25->g_someLGIdxToCopy], sizeof(s_lightGroups[i]));

    if (s_g_currBgSomething.unk44 == NULL)
        return;

    lightGrp = s_lightGroups + 7;
    for (i = 7; i < ARRAY_COUNT(s_lightGroups); i++, lightGrp++)
    {
        int var = i - 7;
        if (s_g_currBgSomething.unk44[var] == NULL)
            break;
        for (j = 0; j < 8; j++)
        {
            s8 r4 = s_g_currBgSomething.unk44[var][j * 2 + 0];
            if (r4 == -1)
                break;
            lightGrp->lightPoolIdxs[j] = light_pool_alloc(1, r4, s_g_currBgSomething.unk44[var][j * 2 + 1]);
        }
    }
}

void func_80021C44(struct LightGroup *lightGrp)
{
    Vec lightPos;
    GXColor lightColor;
    int r5 = TRUE;

    if (lightGrp->lightPoolIdxs[0] == -1)
        r5 = FALSE;
    else
    {
        if (s_g_lightPool[lightGrp->lightPoolIdxs[0]].valid == 0 ||
            s_g_lightPool[lightGrp->lightPoolIdxs[0]].type != LIGHT_TYPE_INFINITE)
            r5 = FALSE;
    }

    if (r5)
    {
        GXGetLightPos(&lightGrp->lightObjs[0], &lightPos.x, &lightPos.y, &lightPos.z);
        GXGetLightColor(&lightGrp->lightObjs[0], &lightColor);
        g_avdisp_set_and_normalize_some_vec(&lightPos);
        g_avdisp_set_some_color_scale(lightColor.r / 255.0f, lightColor.g / 255.0f,
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
    struct Light *light;

    light = s_g_lightPool;
    for (i = 0; i < 32; i++, light++)
    {
        memset(light, 0, sizeof(*light));
        light->valid = 0;
        light->unk1 = 0;
        light->unk2 = 0;
        light->type = LIGHT_TYPE_POINT;
        light->refDist = 2.0f;
        light->k0 = 1.0f;
        light->k1 = 0.0f;
        light->k2 = 0.0f;
        light->spotFn = GX_SP_COS2;
        light->spotCutoff = 45.0f;
    }
    lbl_802F1C48 = 0;
    func_8002170C(stageId);

    light = s_g_stageLightsMaybe;
    while (light->valid != -1)
    {
        if (light->stageId == stageId)
            alloc_light(light);
        light++;
    }
    lbl_802F1C7C = (stageId == 0) ? currStageId : stageId;
}

void func_80021ECC(void)
{
    u8 dummy[8];
    int i;
    struct Light *r28;

    s_g_lightPerfTimer = 0;
    func_8000E428(s_g_currBgSomething.unk14, s_g_currBgSomething.unk18, s_g_currBgSomething.unk1C);
    func_8000E3BC();
    lbl_802F1C48 = 0;

    r28 = s_g_lightPool;
    for (i = 0; i < 32; i++, r28++)
    {
        if (r28->valid != 0)
        {
            func_800212A8(r28);
            lbl_802F1C48 = i + 1;
        }
    }
    s_currLightGroup = -1;
    lbl_802F1C4C = -1;
    lightGroupStack[0] = -1;
    lightGroupStack[1] = -1;
    lightGroupStack[2] = -1;
    s_lightGroupStackPos = 0;
    g_minimap_light_ref_dist_scale = 1.0f;
    lbl_802F1C68 = 0;
    lbl_802F1C64 = 0;
    lbl_802F1C60 = 0;
    s_numLightObjsLoaded = 0;
    if (lbl_802F1C78 == 0)
        func_80021958();
    mathutil_mtxA_from_mtxB();
    load_light_group(LIGHT_GROUP_DEFAULT);
    if (lbl_802F1C88 != 0)
    {
        func_80021ECC_inline(&s_g_lightPool[lbl_802F1C94]);
        lbl_802F1C88 = 0;
    }
    if (lbl_802F1C84 != 0)
    {
        if (lbl_802F1C7C == currStageId)
            memcpy(&s_g_lightPool[lbl_802F1C94], &s_g_lightPool[lbl_802F1C80],
                   sizeof(s_g_lightPool[lbl_802F1C94]));
        else
            func_800210FC(lbl_802F1C7C);
        lbl_802F1C84 = 0;
    }
}

// Copy light into a free slot in the light pool.
// Returns false if no free light slot exists
BOOL alloc_light(struct Light *light)
{
    int idx = light_pool_alloc(0, light->unk1, light->unk2);
    struct Light *poolLight;

    if (idx == -1)
        return FALSE;
    poolLight = &s_g_lightPool[idx];
    memcpy(poolLight, light, sizeof(*poolLight));
    poolLight->valid = 1;
    poolLight->k0 = (light->k0 == 0.0f) ? 1.0f : light->k0;
    poolLight->k1 = (light->k1 == 0.0f) ? 0.0f : light->k1;
    poolLight->k2 = (light->k2 == 0.0f) ? 0.0f : light->k2;
    lbl_802F1C48 = idx + 1;
    return TRUE;
}

#pragma force_active on
struct Light *func_80022224(int a, int b)
{
    a = light_pool_alloc(1, a, b);
    return (a == -1) ? NULL : &s_g_lightPool[a];
}
#pragma force_active reset

void load_light_group(int lightGrpId)
{
    const struct LightGroupSomething *r31;
    struct LightGroup *lightGrp;
    int i;

    perf_init_timer(0);
    s_currLightGroup = lightGrpId;
    lbl_802F1C68++;
    lightGrp = &s_lightGroups[lightGrpId];
    r31 = &s_g_lightGroupSomethings[lightGrpId];
    mathutil_mtxA_to_mtx(lightGrp->viewFromWorld);
    if (r31->g_someLGIdxToCopy != lbl_802F1C4C || (r31->flags & 1) != 0)
    {
        lightGrp->lightMask = 0;
        for (i = 0; i < 8; i++)
        {
            if (lightGrp->lightPoolIdxs[i] != -1)
            {
                struct Light *light = &s_g_lightPool[lightGrp->lightPoolIdxs[i]];

                if (light->valid != 0)
                {
                    load_light(lightGrp, i, light);
                    lightGrp->lightMask |= 1 << i;
                    lbl_802F1C64++;
                }
            }
        }
        g_nl2ngc_set_light_mask(lightGrp->lightMask);
        avdisp_set_light_mask(lightGrp->lightMask);
    }
    if (r31->g_someLGIdxToCopy != lbl_802F1C4C || (r31->flags & 2) != 0)
        g_set_ambient_color(lightGrp->ambient.r, lightGrp->ambient.g, lightGrp->ambient.b);
    func_80021C44(lightGrp);
    lbl_802F1C4C = r31->g_someLGIdxToCopy;
    s_g_lightPerfTimer += perf_stop_timer(0);
}

int func_800223D0(void)
{
    return s_currLightGroup;
}

void func_800223D8(int lightGrpId)
{
    const struct LightGroupSomething *r29;
    int i;
    struct LightGroup *lightGrp;

    perf_init_timer(0);
    s_currLightGroup = lightGrpId;
    lbl_802F1C60++;
    lightGrp = &s_lightGroups[lightGrpId];
    r29 = &s_g_lightGroupSomethings[lightGrpId];
    if (r29->g_someLGIdxToCopy != lbl_802F1C4C || (r29->flags & 1) != 0)
    {
        for (i = 0; i < 8; i++)
        {
            if (lightGrp->lightMask & (1 << i))
            {
                GXLoadLightObjImm(&lightGrp->lightObjs[i], (1 << i));
                s_numLightObjsLoaded++;
            }
        }
        g_nl2ngc_set_light_mask(lightGrp->lightMask);
        avdisp_set_light_mask(lightGrp->lightMask);
    }
    func_80021C44(lightGrp);
    lbl_802F1C4C = r29->g_someLGIdxToCopy;
    s_g_lightPerfTimer += perf_stop_timer(0);
}

void push_light_group(void)
{
    if (s_lightGroupStackPos == LIGHTGROUP_STACK_MAX)
        printf("LIGHT ERROR!!! PushLightGroup() stack over.\n");
    else
    {
        lightGroupStack[s_lightGroupStackPos] = s_currLightGroup;
        s_lightGroupStackPos++;
    }
}

void pop_light_group(void)
{
    if (s_lightGroupStackPos == 0)
        printf("LIGHT ERROR!!! PopLightGroup() stack null.\n");
    else
    {
        s_lightGroupStackPos--;
        mathutil_mtxA_push();
        mathutil_mtxA_from_mtx(s_lightGroups[lightGroupStack[s_lightGroupStackPos]].viewFromWorld);
        load_light_group(lightGroupStack[s_lightGroupStackPos]);
        mathutil_mtxA_pop();
    }
}

void func_800225C0(void)
{
    s_currLightGroup = -1;
    lbl_802F1C4C = -1;
    mathutil_mtxA_from_mtxB();
    load_light_group(LIGHT_GROUP_DEFAULT);
}

void func_800225F4(float a)
{
    g_minimap_light_ref_dist_scale = a;
}

void g_set_bg_ambient(float r, float g, float b)
{
    s_g_currBgSomething.ambient.r = r;
    s_g_currBgSomething.ambient.g = g;
    s_g_currBgSomething.ambient.b = b;
}

void g_set_ambient_color(float r, float g, float b)
{
    g_nl2ngc_set_ambient_color(r, g, b);
    avdisp_set_ambient(r, g, b);
}

void get_curr_light_group_ambient_color(struct Color3f *color)
{
    *color = s_lightGroups[s_currLightGroup].ambient;
}

void apply_curr_light_group_ambient_color(void)
{
    struct Color3f *ambient = &s_lightGroups[s_currLightGroup].ambient;

    g_nl2ngc_set_ambient_color(ambient->r, ambient->g, ambient->b);
    avdisp_set_ambient(ambient->r, ambient->g, ambient->b);
}

void func_800226F4(void)
{
    u8 dummy[24];
    struct Light *r31;
    struct NaomiMesh *mesh;

    if (lbl_802F1C8C == 0)
        return;
    r31 = &s_g_lightPool[lbl_802F1C94];
    switch (r31->type)
    {
    case LIGHT_TYPE_POINT:
    case LIGHT_TYPE_POINT_POW:
    case LIGHT_TYPE_POINT_DARKPOW:
    case LIGHT_TYPE_POINT_DARK:
        mesh = (struct NaomiMesh *)NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B)->meshStart;
        mesh->unk30 = 1.0f;
        mesh->unk34 = 0.0f;
        mesh->unk38 = 0.0f;
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->pos);
        mathutil_mtxA_scale_s(r31->refDist * 2.0);
        g_nl2ngc_set_scale(r31->refDist * 2.0);
        g_draw_naomi_model_with_alpha_deferred(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B),
                                               0.5f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->pos);
        g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B));
        break;
    case LIGHT_TYPE_INFINITE:
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&currentCameraStructPtr->lookAt);
        mathutil_mtxA_rotate_y(r31->rotY);
        mathutil_mtxA_rotate_x(r31->rotX);
        mathutil_mtxA_rotate_x(0x8000);
        g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_spotl1));
        break;
    case LIGHT_TYPE_SPOT:
    case LIGHT_TYPE_SPOT_POW:
    case LIGHT_TYPE_SPOT_DARKPOW:
    case LIGHT_TYPE_SPOT_DARK:
        mesh = (struct NaomiMesh *)NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B)->meshStart;
        mesh->unk30 = 1.0f;
        mesh->unk34 = 0.0f;
        mesh->unk38 = 0.0f;
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->pos);
        mathutil_mtxA_scale_s(r31->refDist * 2.0);
        g_nl2ngc_set_scale(r31->refDist * 2.0);
        g_draw_naomi_model_with_alpha_deferred(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B),
                                               0.5f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->pos);
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
    lbl_801F39EC.unk0 = s_g_currBgSomething.unk10;
    lbl_801F39EC.unk4 = s_g_currBgSomething.unk14;
    lbl_801F39EC.unk8 = s_g_currBgSomething.unk18;
    lbl_801F39EC.unkC = s_g_currBgSomething.unk1C;
    s_g_currBgSomething.unk10 = 0.0f;
    s_g_currBgSomething.unk14 = 0.7f;
    s_g_currBgSomething.unk18 = 0.7f;
    s_g_currBgSomething.unk1C = 0.7f;
}

void func_80022910(int stageId)
{
    func_8002170C(stageId);
    lbl_801F39EC.unk0 = s_g_currBgSomething.unk10;
    lbl_801F39EC.unk4 = s_g_currBgSomething.unk14;
    lbl_801F39EC.unk8 = s_g_currBgSomething.unk18;
    lbl_801F39EC.unkC = s_g_currBgSomething.unk1C;
    s_g_currBgSomething.unk10 = 0.0f;
    s_g_currBgSomething.unk14 = 0.5f;
    s_g_currBgSomething.unk18 = 0.5f;
    s_g_currBgSomething.unk1C = 0.5f;
}

s8 lbl_80180E30[10] = {5, 1, 5, 2, 5, 3, 5, 4, -1, -1};
s8 lbl_80180E3C[18] = {6, 1, 6, 2, 6, 3, 6, 4, 6, 5, 6, 6, 6, 7, 6, 8, -1, -1};
s8 lbl_802F03F8[8] = {6, 2, 6, 3, 6, 4, -1, -1};
s8 lbl_802F0400[6] = {7, 1, 7, 2, -1, -1};
s8 lbl_80180E50[10] = {7, 1, 7, 2, 5, 1, 5, 3, -1, -1};
s8 lbl_802F0408[6] = {5, 1, 6, 8, -1, -1};
s8 lbl_802F0410[4] = {5, 3, -1, -1};
s8 lbl_80180E5C[10] = {5, 4, 6, 1, 6, 2, 6, 3, -1, -1};

s8 *lbl_80180E68[] = {
    lbl_80180E30, lbl_80180E3C, lbl_802F03F8, lbl_802F0400, lbl_80180E50,
    lbl_802F0408, lbl_802F0410, lbl_80180E5C, NULL,
};

// clang-format off
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
// clang-format on

// clang-format off
struct BgLightSomething s_g_perBgSomethings[] = {
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.1, 0.11, 0.1, 4096, 0, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 16384, 0, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0, 0.05, 0.05, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.1, 0.1, 0.5, 12288, 8192, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.3, 0.3, 0.3, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.25, 0.2, 0, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.1, 0.05, 0.05, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.8, {0.3, 0.4, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, -6272, 26752, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.05, 0.05, 0.1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.28, 0.48, 0.63}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.6, 0.85, 1, 8192, 24576, NULL},
    {0.6, {0.4, 0.4, 0.7}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.4, 0.4, 0.7}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.3, {0.5, 0.45, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 29184, 17664, NULL},
    {0.6, {0.45, 0.4, 0.25}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 24576, 24576, NULL},
    {0.6, {0.55, 0.6, 0.85}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.3, 0.3, 0.45}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.7, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0.8, 0.8, 0.8, -11776, 21888, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.4, 0.4, 0.55}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 8192, 24576, lbl_80180E68},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, 1, 1, 1, 8192, 24576, NULL},
};
// clang-format on
