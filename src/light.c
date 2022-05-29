// Lights system
//
// Most stage lighting is really simple: an ambient color and a single directional ("infinite")
// light, both defined by the background type. A "light group" abstraction is used to allow
// different models to be lit with different sets of lights (up to 8, the maximum supported by the
// hardware), but it's rarely taken advantage of.   
//
// During initialization, the BG's infinite light and matching per-stage lights are allocated in the
// "light pool". Then, light groups are initialized by searching the light pool for light IDs they
// want. The default light group looks for the BG's directional light (the one with ID
// LIGHT_ID_STAGE) and per-stage LIGHT_ID_AUTO lights. If the BG specifies how to build the specific
// LIGHT_GROUP_BG_ light groups (read: monkey billiards), these lights are also picked from the
// light pool.

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
s32 u_lightToPrint;
u32 lbl_802F1C90;
s32 lbl_802F1C8C;
s32 u_printLight;
s32 lbl_802F1C84;
s32 lbl_802F1C80;
s32 lightingStageId;
s32 s_u_lightGroupsInitialized;

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
s32 s_u_lightPerfTimer;
float u_minimap_light_ref_dist_scale;
s8 s_lightGroupStackPos;
s32 u_someLGIdx;
s32 s_lightPoolSize;

#define LIGHTGROUP_STACK_MAX 3
u32 lightGroupStack[LIGHTGROUP_STACK_MAX];
FORCE_BSS_ORDER(lightGroupStack)

s8 lbl_802F0310[8] = {0};

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

enum
{
    LIGHT_ID_TEST,
    LIGHT_ID_STAGE, // Infinite light defined for background
    LIGHT_ID_BUMPER,
    LIGHT_ID_AUTO, // Per-stage light put in light pool iff stage ID matches, and placed in default
                   // light group
    LIGHT_ID_BG,
    LIGHT_ID_BG_PILLAR,
    LIGHT_ID_BG_WALL,
    LIGHT_ID_BG_COUNTER,
};

char *s_lightIdNames[] = {
    "TEST", "STAGE", "BUMPER", "AUTO", "BG", "BG_PILLAR", "BG_WALL", "BG_COUNTER",
};

char *s_lightGroupNames[] = {
    "DEFAULT", "SINGLE", "SINGLE_UNIT", "DEF_MINIMAP", "DEF_GMAT", "DEF_MIR", "BG_0", "BG_1",
    "BG_2",    "BG_3",   "BG_4",        "BG_5",        "BG_6",     "BG_7",    "BG_8", "BG_9",
    "BG_a",    "BG_b",   "BG_c",        "BG_d",        "BG_e",     "BG_f",
};

// Extra lights to use if the stage ID matches. "auto" lights are added to the default light group,
// while other light IDs can be manually assorted into light groups by the BG (only monkey billiards
// does this however)

// clang-format off
struct Light s_perStageLights[512] =  // lots of empty space at the end
{
    { 1, LIGHT_ID_AUTO, 1, LIGHT_TYPE_POINT,     GX_SP_OFF,   ST_150_TUTORIAL,     1,   1,   1, { 14.500019,       2.5, -21.000044},      0,      0, 0, {         0,          0,        -1},         2,         1,        0,        0,         0 },
    { 1, LIGHT_ID_AUTO, 1, LIGHT_TYPE_POINT_POW, GX_SP_OFF,   ST_134_RACE_ICE,   0.8,   1, 0.8, {   0.09996,   3.22824,    0.19996},      0,      0, 0, {         0,          0,        -1},        10,         1,        0,        0,         0 },
    { 1, LIGHT_ID_AUTO, 1, LIGHT_TYPE_POINT_POW, GX_SP_OFF,   ST_092_BONUS_WAVE, 0.8,   1, 0.8, {   0.09996,   3.22824,    0.19996},      0,      0, 0, {         0,          0,        -1},        10,         1,        0,        0,         0 },
    { 1, LIGHT_ID_AUTO, 1, LIGHT_TYPE_SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, {         0, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, LIGHT_ID_AUTO, 2, LIGHT_TYPE_SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, { 15.000021, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, LIGHT_ID_AUTO, 3, LIGHT_TYPE_SPOT,      GX_SP_SHARP, ST_180_BILLIARDS,    1, 0.8, 0.6, {-15.000021, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, LIGHT_ID_BG_PILLAR, 1, LIGHT_TYPE_POINT,     GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.5,   0, {-42.699883, 31.400082, -24.599998},  -8576,   9344, 0, {-5313.7051,  -7326.543,   -4252.8}, 5.7001848, 12.300009, 1.959999, 1.709999,        20 },
    { 1, LIGHT_ID_BG_PILLAR, 2, LIGHT_TYPE_SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.8, 0.6, {       -35,      37.5,         25},      0,      0, 0, {  -0.40147,         -1,   0.29441},        50,       1.5,    -0.02,        0,        20 },
    { 1, LIGHT_ID_BG_PILLAR, 3, LIGHT_TYPE_POINT,     GX_SP_OFF,   ST_180_BILLIARDS,    1, 0.5,   0, { 50.599762,      37.5,        -25}, -25600,  28160, 0, {         0,          0,    -10000}, 20.100229, 12.900013,     0.09,        0, 15.599983 },
    { 1, LIGHT_ID_BG_PILLAR, 4, LIGHT_TYPE_SPOT,      GX_SP_OFF,   ST_180_BILLIARDS,    1, 0.8,   0, { 35.000038,      37.5,   25.00006},  -7680, -30080, 0, { 2290.4126, -4386.1626, 8689.9707}, 30.000267,       1.5,      0.6,     0.01, 25.000019 },
    { 1, LIGHT_ID_BG_WALL, 1, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {        80,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, LIGHT_ID_BG_WALL, 2, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {        40,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, LIGHT_ID_BG_WALL, 3, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {         0,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, LIGHT_ID_BG_WALL, 4, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {       -40,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, LIGHT_ID_BG_WALL, 5, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {       -80,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, LIGHT_ID_BG_WALL, 6, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,        10,         40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, LIGHT_ID_BG_WALL, 7, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,         0,         40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, LIGHT_ID_BG_WALL, 8, LIGHT_TYPE_POINT,     GX_SP_COS2,  ST_180_BILLIARDS,    1, 0.5,   0, {     -97.5,        10,        -40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, LIGHT_ID_BG_COUNTER, 1, LIGHT_TYPE_SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.7, 0.3, {     28.25,        35,        -64}, -19328,      0, 0, {         0,  -0.960431,   0.27852}, 15.000019,         1,        0,        0,        25 },
    { 1, LIGHT_ID_BG_COUNTER, 2, LIGHT_TYPE_SPOT,      GX_SP_FLAT,  ST_180_BILLIARDS,    1, 0.7, 0.3, {    -26.75,        35,        -64}, -19328,      0, 0, {         0,  -0.960431,   0.27852}, 15.000019,         1,        0,        0,        25 },
    { -1 },
};
// clang-format on

// Light groups refer to lights by index in here
struct Light s_u_lightPool[32];

void print_light(struct Light *light)
{
    printf("\x7B\t\n");
    printf("\t%d,\tLID_%s,\t%d,\n", light->valid, s_lightIdNames[light->u_id], u_lightToPrint);
    printf("\tLTP_%s,\t%d,\t%d,\n", lightTypeNames[light->type], light->spotFn, currStageId);
    printf("\t{ %f, %f, %f },\n", light->red, light->green, light->blue);
    printf("\t{ %f, %f, %f },\n", light->pos.x, light->pos.y, light->pos.z);
    printf("\t0x%x,\t0x%x,\t0x%x,\t{ %f, %f, %f },\n", light->rotX, light->rotY, light->rotZ,
           light->dir.x, light->dir.y, light->dir.z);
    printf("\t%f,\t%f,\t%f,\n", light->refDist, light->k0, light->k1);
    printf("\t%f,\t%f\n", light->k2, light->spotCutoff);
    printf("},\n\n");
}

#pragma dont_inline on
void u_alloc_stage_lights(int stageId)
{
    u8 dummy[8];
    struct Light *light = s_perStageLights;

    while (light->valid != -1)
    {
        if (light->stageId == stageId)
            add_light_to_pool(light);
        light++;
    }
}
#pragma dont_inline reset

// Allocate a light in the light pool to use, or return a light that already exists (preferred)
s8 alloc_pool_light_idx(BOOL findExisting, int u_id, int u_inst)
{
    int i;
    struct Light *light;

    for (light = s_u_lightPool, i = 0; i < s_lightPoolSize; i++, light++)
    {
        if (light->u_id == u_id && light->u_inst == u_inst)
            return i;
    }
    if (findExisting == 1)
        return -1;
    for (light = s_u_lightPool, i = 0; i < ARRAY_COUNT(s_u_lightPool); i++, light++)
    {
        if (light->valid == 0)
            return i;
    }
    return -1;
}

void init_light_dir(struct Light *light)
{
    switch (light->type)
    {
    case LIGHT_TYPE_INFINITE:
        light->dir.x = light->dir.y = 0.0f;
        light->dir.z = -1.0f;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(light->rotY);
        mathutil_mtxA_rotate_x(light->rotX);
        mathutil_mtxA_tf_vec(&light->dir, &light->dir);
        light->dir.x *= 10000.0f;
        light->dir.y *= 10000.0f;
        light->dir.z *= 10000.0f;
        break;
    case LIGHT_TYPE_SPOT:
    case LIGHT_TYPE_SPOT_POW:
    case LIGHT_TYPE_SPOT_DARKPOW:
    case LIGHT_TYPE_SPOT_DARK:
        if (light->u_id != LIGHT_ID_BG_PILLAR)
        {
            light->dir.x = light->dir.y = 0.0f;
            light->dir.z = -1.0f;
            mathutil_mtxA_from_identity();
            mathutil_mtxA_rotate_y(light->rotY);
            mathutil_mtxA_rotate_x(light->rotX);
            mathutil_mtxA_tf_vec(&light->dir, &light->dir);
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

// Lighting information for current background
struct BgLightInfo s_bgLightInfo;

struct LightGroup s_lightGroups[22];

void load_light(struct LightGroup *group, int lightIdxInGroup, struct Light *light)
{
    Vec tempVec;
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

    f3 = (s_currLightGroup != LIGHT_GROUP_DEF_MINIMAP)
             ? light->refDist
             : light->refDist * u_minimap_light_ref_dist_scale;
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

    f0 = (s_currLightGroup != LIGHT_GROUP_DEF_MINIMAP)
             ? 0.0
             : 2.05f * ((1.0f / u_minimap_light_ref_dist_scale) - 1.0f);
    tempVec.x = light->pos.x;
    tempVec.y = light->pos.y + f0;
    tempVec.z = light->pos.z;
    switch (light->type)
    {
    case LIGHT_TYPE_INFINITE:
        mathutil_mtxA_tf_point(&light->dir, &tempVec);
        GXInitLightPos(&lightObj, tempVec.x, tempVec.y, tempVec.z);
        break;
    case LIGHT_TYPE_POINT:
    case LIGHT_TYPE_POINT_POW:
    case LIGHT_TYPE_POINT_DARKPOW:
    case LIGHT_TYPE_POINT_DARK:
        mathutil_mtxA_tf_point(&tempVec, &tempVec);
        GXInitLightPos(&lightObj, tempVec.x, tempVec.y, tempVec.z);
        break;
    case LIGHT_TYPE_SPOT:
    case LIGHT_TYPE_SPOT_POW:
    case LIGHT_TYPE_SPOT_DARKPOW:
    case LIGHT_TYPE_SPOT_DARK:
        mathutil_mtxA_tf_point(&tempVec, &tempVec);
        GXInitLightPos(&lightObj, tempVec.x, tempVec.y, tempVec.z);
        mathutil_mtxA_tf_vec(&light->dir, &tempVec);
        GXInitLightDir(&lightObj, tempVec.x, tempVec.y, tempVec.z);
        break;
    }
    GXLoadLightObjImm(&lightObj, (1 << lightIdxInGroup));
    memcpy(&group->lightObjs[lightIdxInGroup], &lightObj,
           sizeof(group->lightObjs[lightIdxInGroup]));
}

void init_bg_lighting(int stageId)
{
    struct Light light;

    s_bgLightInfo =
        s_bgLightInfos[(backgroundInfo.bgId < 0 || stageId == 0) ? 0 : backgroundInfo.bgId];
    if (s_bgLightInfo.infLightColor.r == 0.0 && s_bgLightInfo.infLightColor.g == 0.0 &&
        s_bgLightInfo.infLightColor.b == 0.0)
        return;

    if (stageId != 0)
    {
        if (stageId == ST_099_JUNGLE_BG && advDemoInfo.flags & (1 << 8))
            s_bgLightInfo.infLightRotY = DEGREES_TO_S16(45);
        if (gameSubmode == SMD_GAME_CONTINUE_INIT || gameSubmode == SMD_GAME_CONTINUE_MAIN)
        {
            s_bgLightInfo.infLightRotX = 0;
            s_bgLightInfo.infLightRotY = DEGREES_TO_S16(90);
        }
        if (backgroundInfo.bgId == BG_TYPE_WAT && modeCtrl.unk30 > 1)
            set_bg_ambient(0.4f, 0.6f, 0.9f);
        switch (stageId)
        {
        case ST_145_FIGHT_SPACE:
            set_bg_ambient(0.4f, 0.35f, 0.5f);
            break;
        case ST_131_RACE_SPACE:
            set_bg_ambient(0.4f, 0.35f, 0.5f);
            break;
        case ST_138_RACE_DESERT:
            set_bg_ambient(0.4f, 0.35f, 0.3f);
            break;
        case ST_135_RACE_DOWNTOWN:
            set_bg_ambient(0.55f, 0.55f, 0.7f);
            break;
        }
        if (backgroundInfo.bgId == BG_TYPE_END)
        {
            switch (modeCtrl.levelSet)
            {
            case LVLSET_BEGINNER:
                s_bgLightInfo.infLightRotY += 45056;
                break;
            }
        }
    }
    memset(&light, 0, sizeof(light));
    light.u_id = LIGHT_ID_STAGE;
    light.u_inst = 0;
    light.type = LIGHT_TYPE_INFINITE;
    light.red = s_bgLightInfo.infLightColor.r;
    light.green = s_bgLightInfo.infLightColor.g;
    light.blue = s_bgLightInfo.infLightColor.b;
    light.rotX = s_bgLightInfo.infLightRotX;
    light.rotY = s_bgLightInfo.infLightRotY;
    add_light_to_pool(&light);
}

struct LightGroupInfo
{
    s32 u_someLGIdxToCopy; // Copy this light group to groups 2-5 inclusive
    u32 flags;
};

// Oner per light group
// clang-format off
const struct LightGroupInfo s_u_lightGroupSomethings[] = {
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_SINGLE, 3},        
    {LIGHT_GROUP_SINGLE, 1},        
    {LIGHT_GROUP_DEFAULT, 1},        
    {LIGHT_GROUP_DEFAULT, 1},        
    {LIGHT_GROUP_DEFAULT, 1},        
    {LIGHT_GROUP_DEFAULT, 3},        
    {LIGHT_GROUP_DEFAULT, 3},        
    {LIGHT_GROUP_DEFAULT, 3},        
    {LIGHT_GROUP_DEFAULT, 3},        
    {LIGHT_GROUP_DEFAULT, 3},        
    {LIGHT_GROUP_DEFAULT, 3},        
    {LIGHT_GROUP_DEFAULT, 3},        
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_DEFAULT, 3},
    {LIGHT_GROUP_DEFAULT, 3},
};
// clang-format on

void init_light_groups(void)
{
    int i;
    int lightInGroupIdx;
    struct Light *light;
    const struct LightGroupInfo *lgInfo;
    struct LightGroup *lightGrp;

    lightGrp = s_lightGroups;
    for (i = 0; i < ARRAY_COUNT(s_lightGroups); i++, lightGrp++)
    {
        for (lightInGroupIdx = 0; lightInGroupIdx < ARRAY_COUNT(lightGrp->lightPoolIdxs);
             lightInGroupIdx++)
            lightGrp->lightPoolIdxs[lightInGroupIdx] = -1;
        lightGrp->ambient.r = s_bgLightInfo.ambient.r;
        lightGrp->ambient.g = s_bgLightInfo.ambient.g;
        lightGrp->ambient.b = s_bgLightInfo.ambient.b;
    }

    // Associate some lights in the pool with this light group. This includes the infinite light
    // defined by the current bg's BgLightInfo (it's a LIGHT_ID_STAGE)
    light = s_u_lightPool;
    lightInGroupIdx = 0;
    lightGrp = &s_lightGroups[LIGHT_GROUP_DEFAULT];
    for (i = 0; i < ARRAY_COUNT(s_u_lightPool); i++, light++)
    {
        if (light->valid != 0 && (light->u_id == LIGHT_ID_STAGE || light->u_id == LIGHT_ID_TEST ||
                                  light->u_id == LIGHT_ID_AUTO))
        {
            lightGrp->lightPoolIdxs[lightInGroupIdx] = i;
            if (++lightInGroupIdx == 8)
                break;
        }
    }

    if (s_u_lightPool[0].valid != 0)
        s_lightGroups[LIGHT_GROUP_SINGLE].lightPoolIdxs[0] = 0;

    // Init the other non-BG light groups by copying from an existing light group
    lgInfo = &(s_u_lightGroupSomethings[LIGHT_GROUP_SINGLE_UNIT]);
    for (i = 2; i < 6; i++, lgInfo++)
        memcpy(&s_lightGroups[i], &s_lightGroups[lgInfo->u_someLGIdxToCopy],
               sizeof(s_lightGroups[i]));

    if (s_bgLightInfo.bgLightGroups == NULL)
        return;

    lightGrp = &s_lightGroups[LIGHT_GROUP_BG_1];
    for (i = LIGHT_GROUP_BG_1; i < ARRAY_COUNT(s_lightGroups); i++, lightGrp++)
    {
        int bgLgIdx = i - 7;
        if (s_bgLightInfo.bgLightGroups[bgLgIdx] == NULL)
            break;
        for (lightInGroupIdx = 0; lightInGroupIdx < ARRAY_COUNT(lightGrp->lightPoolIdxs);
             lightInGroupIdx++)
        {
            s8 lightId = s_bgLightInfo.bgLightGroups[bgLgIdx][lightInGroupIdx * 2 + 0];
            if (lightId == -1)
                break;
            lightGrp->lightPoolIdxs[lightInGroupIdx] = alloc_pool_light_idx(
                TRUE, lightId, s_bgLightInfo.bgLightGroups[bgLgIdx][lightInGroupIdx * 2 + 1]);
        }
    }
}

void set_avdisp_inf_light(struct LightGroup *lightGrp)
{
    Vec infLightDir;
    GXColor infLightColor;
    int hasInfLight = TRUE;

    if (lightGrp->lightPoolIdxs[0] == -1)
        hasInfLight = FALSE;
    else
    {
        if (s_u_lightPool[lightGrp->lightPoolIdxs[0]].valid == 0 ||
            s_u_lightPool[lightGrp->lightPoolIdxs[0]].type != LIGHT_TYPE_INFINITE)
            hasInfLight = FALSE;
    }

    if (hasInfLight)
    {
        // Light position is treated as light dir for directional ("infinite") lights
        GXGetLightPos(&lightGrp->lightObjs[0], &infLightDir.x, &infLightDir.y, &infLightDir.z);
        GXGetLightColor(&lightGrp->lightObjs[0], &infLightColor);
        avdisp_set_inf_light_dir(&infLightDir);
        avdisp_set_inf_light_color(infLightColor.r / 255.0f, infLightColor.g / 255.0f,
                                   infLightColor.b / 255.0f);
    }
    else if (func_8009D5D8() != 0)
    {
        Vec spC = {0.0f, 1.0f, -0.5f};

        mathutil_mtxA_push();
        mathutil_mtxA_from_rotate_y(currentCameraStructPtr->rotY);
        mathutil_mtxA_tf_vec(&spC, &spC);
        mathutil_mtxA_pop();
        avdisp_set_inf_light_dir(&spC);
        avdisp_set_inf_light_color(1.0f, 1.0f, 1.0f);
    }
    else
        avdisp_set_inf_light_color(0.0f, 0.0f, 0.0f);
}

// Light system init
void light_init(int stageId)
{
    u8 dummy[8];
    int i;
    struct Light *light;

    // Reset light pool
    light = s_u_lightPool;
    for (i = 0; i < ARRAY_COUNT(s_u_lightPool); i++, light++)
    {
        memset(light, 0, sizeof(*light));
        light->valid = 0;
        light->u_id = LIGHT_ID_TEST;
        light->u_inst = 0;
        light->type = LIGHT_TYPE_POINT;
        light->refDist = 2.0f;
        light->k0 = 1.0f;
        light->k1 = 0.0f;
        light->k2 = 0.0f;
        light->spotFn = GX_SP_COS2;
        light->spotCutoff = 45.0f;
    }
    s_lightPoolSize = 0;

    init_bg_lighting(stageId);

    light = s_perStageLights;
    while (light->valid != -1)
    {
        if (light->stageId == stageId)
            add_light_to_pool(light);
        light++;
    }
    lightingStageId = (stageId == 0) ? currStageId : stageId;
}

// Light system per-frame update
void light_main(void)
{
    u8 dummy[8];
    int i;
    struct Light *light;

    s_u_lightPerfTimer = 0;
    func_8000E428(s_bgLightInfo.unk14, s_bgLightInfo.unk18, s_bgLightInfo.unk1C);
    func_8000E3BC();
    s_lightPoolSize = 0;

    light = s_u_lightPool;
    for (i = 0; i < 32; i++, light++)
    {
        if (light->valid != 0)
        {
            init_light_dir(light);
            s_lightPoolSize = i + 1;
        }
    }
    s_currLightGroup = -1;
    u_someLGIdx = -1;
    lightGroupStack[0] = -1;
    lightGroupStack[1] = -1;
    lightGroupStack[2] = -1;
    s_lightGroupStackPos = 0;
    u_minimap_light_ref_dist_scale = 1.0f;
    lbl_802F1C68 = 0;
    lbl_802F1C64 = 0;
    lbl_802F1C60 = 0;
    s_numLightObjsLoaded = 0;
    if (s_u_lightGroupsInitialized == 0)
        init_light_groups();
    mathutil_mtxA_from_mtxB();
    load_light_group_uncached(LIGHT_GROUP_DEFAULT);
    if (u_printLight != 0)
    {
        print_light(&s_u_lightPool[u_lightToPrint]);
        u_printLight = 0;
    }
    if (lbl_802F1C84 != 0)
    {
        if (lightingStageId == currStageId)
            memcpy(&s_u_lightPool[u_lightToPrint], &s_u_lightPool[lbl_802F1C80],
                   sizeof(s_u_lightPool[u_lightToPrint]));
        else
            u_alloc_stage_lights(lightingStageId);
        lbl_802F1C84 = 0;
    }
}

// Copy light into a free slot in the light pool.
// Returns false if no free light slot exists
BOOL add_light_to_pool(struct Light *light)
{
    int idx = alloc_pool_light_idx(FALSE, light->u_id, light->u_inst);
    struct Light *poolLight;

    if (idx == -1)
        return FALSE;
    poolLight = &s_u_lightPool[idx];
    memcpy(poolLight, light, sizeof(*poolLight));
    poolLight->valid = 1;
    poolLight->k0 = (light->k0 == 0.0f) ? 1.0f : light->k0;
    poolLight->k1 = (light->k1 == 0.0f) ? 0.0f : light->k1;
    poolLight->k2 = (light->k2 == 0.0f) ? 0.0f : light->k2;
    s_lightPoolSize = idx + 1;
    return TRUE;
}

#pragma force_active on
struct Light *alloc_pool_light(int a, int b)
{
    a = alloc_pool_light_idx(TRUE, a, b);
    return (a == -1) ? NULL : &s_u_lightPool[a];
}
#pragma force_active reset

// Load lights in light group as defined by Light's referenced in light pool. Corresponding
// GXLightObj's are computed and stored in the group ("cached")
void load_light_group_uncached(int lightGrpId)
{
    const struct LightGroupInfo *r31;
    struct LightGroup *lightGrp;
    int i;

    perf_start_timer(0);
    s_currLightGroup = lightGrpId;
    lbl_802F1C68++;
    lightGrp = &s_lightGroups[lightGrpId];
    r31 = &s_u_lightGroupSomethings[lightGrpId];
    mathutil_mtxA_to_mtx(lightGrp->viewFromWorld);
    if (r31->u_someLGIdxToCopy != u_someLGIdx || (r31->flags & 1) != 0)
    {
        lightGrp->lightMask = 0;
        for (i = 0; i < 8; i++)
        {
            if (lightGrp->lightPoolIdxs[i] != -1)
            {
                struct Light *light = &s_u_lightPool[lightGrp->lightPoolIdxs[i]];

                if (light->valid != 0)
                {
                    load_light(lightGrp, i, light);
                    lightGrp->lightMask |= 1 << i;
                    lbl_802F1C64++;
                }
            }
        }
        nl2ngc_set_light_mask(lightGrp->lightMask);
        avdisp_set_light_mask(lightGrp->lightMask);
    }
    if (r31->u_someLGIdxToCopy != u_someLGIdx || (r31->flags & 2) != 0)
        set_render_ambient(lightGrp->ambient.r, lightGrp->ambient.g, lightGrp->ambient.b);
    set_avdisp_inf_light(lightGrp);
    u_someLGIdx = r31->u_someLGIdxToCopy;
    s_u_lightPerfTimer += perf_stop_timer(0);
}

int peek_light_group(void)
{
    return s_currLightGroup;
}

// Load lights in group from cached GXLightObj's
void load_light_group_cached(int lightGrpId)
{
    const struct LightGroupInfo *r29;
    int i;
    struct LightGroup *lightGrp;

    perf_start_timer(0);
    s_currLightGroup = lightGrpId;
    lbl_802F1C60++;
    lightGrp = &s_lightGroups[lightGrpId];
    r29 = &s_u_lightGroupSomethings[lightGrpId];
    if (r29->u_someLGIdxToCopy != u_someLGIdx || (r29->flags & 1) != 0)
    {
        for (i = 0; i < ARRAY_COUNT(lightGrp->lightObjs); i++)
        {
            if (lightGrp->lightMask & (1 << i))
            {
                GXLoadLightObjImm(&lightGrp->lightObjs[i], (1 << i));
                s_numLightObjsLoaded++;
            }
        }
        nl2ngc_set_light_mask(lightGrp->lightMask);
        avdisp_set_light_mask(lightGrp->lightMask);
    }
    set_avdisp_inf_light(lightGrp);
    u_someLGIdx = r29->u_someLGIdxToCopy;
    s_u_lightPerfTimer += perf_stop_timer(0);
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
        load_light_group_uncached(lightGroupStack[s_lightGroupStackPos]);
        mathutil_mtxA_pop();
    }
}

void u_reset_light_group_stack(int a)
{
    s_currLightGroup = -1;
    u_someLGIdx = -1;
    mathutil_mtxA_from_mtxB();
    load_light_group_uncached(LIGHT_GROUP_DEFAULT);
}

void u_set_some_minimap_light_param(float a)
{
    u_minimap_light_ref_dist_scale = a;
}

void set_bg_ambient(float r, float g, float b)
{
    s_bgLightInfo.ambient.r = r;
    s_bgLightInfo.ambient.g = g;
    s_bgLightInfo.ambient.b = b;
}

void set_render_ambient(float r, float g, float b)
{
    nl2ngc_set_ambient(r, g, b);
    avdisp_set_ambient(r, g, b);
}

void get_curr_light_group_ambient(struct Color3f *color)
{
    *color = s_lightGroups[s_currLightGroup].ambient;
}

void apply_curr_light_group_ambient(void)
{
    struct Color3f *ambient = &s_lightGroups[s_currLightGroup].ambient;

    nl2ngc_set_ambient(ambient->r, ambient->g, ambient->b);
    avdisp_set_ambient(ambient->r, ambient->g, ambient->b);
}

void u_draw_naomi_ball(void)
{
    u8 dummy[24];
    struct Light *r31;
    struct NaomiMesh *mesh;

    if (lbl_802F1C8C == 0)
        return;
    r31 = &s_u_lightPool[u_lightToPrint];
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
        u_nl2ngc_set_scale(r31->refDist * 2.0);
        nl2ngc_draw_model_alpha_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B), 0.5f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->pos);
        nl2ngc_draw_model_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B));
        break;
    case LIGHT_TYPE_INFINITE:
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&currentCameraStructPtr->lookAt);
        mathutil_mtxA_rotate_y(r31->rotY);
        mathutil_mtxA_rotate_x(r31->rotX);
        mathutil_mtxA_rotate_x(0x8000);
        nl2ngc_draw_model_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_spotl1));
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
        u_nl2ngc_set_scale(r31->refDist * 2.0);
        nl2ngc_draw_model_alpha_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_BALL_B), 0.5f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&r31->pos);
        mathutil_mtxA_rotate_y(r31->rotY);
        mathutil_mtxA_rotate_x(r31->rotX);
        nl2ngc_draw_model_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_spotl1));
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

void u_smth_with_lights_smd_continue(int stageId)
{
    init_bg_lighting(stageId);
    lbl_801F39EC.unk0 = s_bgLightInfo.unk10;
    lbl_801F39EC.unk4 = s_bgLightInfo.unk14;
    lbl_801F39EC.unk8 = s_bgLightInfo.unk18;
    lbl_801F39EC.unkC = s_bgLightInfo.unk1C;
    s_bgLightInfo.unk10 = 0.0f;
    s_bgLightInfo.unk14 = 0.7f;
    s_bgLightInfo.unk18 = 0.7f;
    s_bgLightInfo.unk1C = 0.7f;
}

void u_smth_with_lights_smd_extra(int stageId)
{
    init_bg_lighting(stageId);
    lbl_801F39EC.unk0 = s_bgLightInfo.unk10;
    lbl_801F39EC.unk4 = s_bgLightInfo.unk14;
    lbl_801F39EC.unk8 = s_bgLightInfo.unk18;
    lbl_801F39EC.unkC = s_bgLightInfo.unk1C;
    s_bgLightInfo.unk10 = 0.0f;
    s_bgLightInfo.unk14 = 0.5f;
    s_bgLightInfo.unk18 = 0.5f;
    s_bgLightInfo.unk1C = 0.5f;
}

s8 s_bilLightGroup_BG_1[10] = {5, 1, 5, 2, 5, 3, 5, 4, -1, -1};
s8 s_bilLightGroup_BG_2[18] = {6, 1, 6, 2, 6, 3, 6, 4, 6, 5, 6, 6, 6, 7, 6, 8, -1, -1};
s8 s_bilLightGroup_BG_3[8] = {6, 2, 6, 3, 6, 4, -1, -1};
s8 s_bilLightGroup_BG_4[6] = {7, 1, 7, 2, -1, -1};
s8 s_bilLightGroup_BG_5[10] = {7, 1, 7, 2, 5, 1, 5, 3, -1, -1};
s8 s_bilLightGroup_BG_6[6] = {5, 1, 6, 8, -1, -1};
s8 s_bilLightGroup_BG_7[4] = {5, 3, -1, -1};
s8 s_bilLightGroup_BG_8[10] = {5, 4, 6, 1, 6, 2, 6, 3, -1, -1};

s8 *s_bilLightGroups[] = {
    s_bilLightGroup_BG_1, s_bilLightGroup_BG_2, s_bilLightGroup_BG_3,
    s_bilLightGroup_BG_4, s_bilLightGroup_BG_5, s_bilLightGroup_BG_6,
    s_bilLightGroup_BG_7, s_bilLightGroup_BG_8, NULL,
};

// Names/IDs of monkey billiards light groups above?
// clang-format off
struct GBilLightGroup s_bilLightGroupNames[] =
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

// Per-bg lighting information
// clang-format off
struct BgLightInfo s_bgLightInfos[] = {
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0, 0, 0, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0.1, 0.11, 0.1}, 4096, 0, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0, 0, 0}, 16384, 0, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0, 0.05, 0.05}, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0.1, 0.1, 0.5}, 12288, 8192, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0.3, 0.3, 0.3}, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0.25, 0.2, 0}, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0.1, 0.05, 0.05}, 8192, 24576, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.8, {0.3, 0.4, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, -6272, 26752, NULL},
    {0.8, {0.8, 0.8, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0.05, 0.05, 0.1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.28, 0.48, 0.63}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0.6, 0.85, 1}, 8192, 24576, NULL},
    {0.6, {0.4, 0.4, 0.7}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.4, 0.4, 0.7}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.3, {0.5, 0.45, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 29184, 17664, NULL},
    {0.6, {0.45, 0.4, 0.25}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 24576, 24576, NULL},
    {0.6, {0.55, 0.6, 0.85}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.3, 0.3, 0.45}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.7, 0.8}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0.8, 0.8, 0.8}, -11776, 21888, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.4, 0.4, 0.55}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {0, 0, 0}, 8192, 24576, s_bilLightGroups},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
    {0.6, {0.6, 0.6, 0.6}, 0, 1, 1, 1, 0, 0.5, 0.5, 0.5, 0, {1, 1, 1}, 8192, 24576, NULL},
};
// clang-format on
