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

u32 lightGroupStack[3];
FORCE_BSS_ORDER(lightGroupStack)

s8 lbl_802F0310[8] = {0};

char *lbl_801773B4[] =
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

char *lbl_801773F0[] =
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

struct Struct8017748C
{
    s8 unk0;
    s8 unk1;
    s16 unk2;
    s8 unk4;
    s16 spotFn;
    u8 unk8;
    float unkC;
    float unk10;
    float unk14;
    Vec unk18;
    s16 unk24;
    s16 unk26;
    s16 unk28;
    Vec unk2C;
    float unk38;
    float unk3C;
    float unk40;
    float unk44;
    float unk48;
};

struct Struct8017748C lbl_8017748C[512] =  // lots of empty space at the end
{
    { 1, 3, 1, 1, 0, 150,   1,   1,   1, { 14.500019,       2.5, -21.000044},      0,      0, 0, {         0,          0,        -1},         2,         1,        0,        0,         0 },
    { 1, 3, 1, 3, 0, 134, 0.8,   1, 0.8, {   0.09996,   3.22824,    0.19996},      0,      0, 0, {         0,          0,        -1},        10,         1,        0,        0,         0 },
    { 1, 3, 1, 3, 0,  92, 0.8,   1, 0.8, {   0.09996,   3.22824,    0.19996},      0,      0, 0, {         0,          0,        -1},        10,         1,        0,        0,         0 },
    { 1, 3, 1, 2, 4, 180,   1, 0.8, 0.6, {         0, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 3, 2, 2, 4, 180,   1, 0.8, 0.6, { 15.000021, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 3, 3, 2, 4, 180,   1, 0.8, 0.6, {-15.000021, 23.000051,          0}, -16768,  24576, 0, {  0.026027,  -0.999322, -0.026027},       0.1,       0.1,      0.4,      0.1, 40.000076 },
    { 1, 5, 1, 1, 1, 180,   1, 0.5,   0, {-42.699883, 31.400082, -24.599998},  -8576,   9344, 0, {-5313.7051,  -7326.543,   -4252.8}, 5.7001848, 12.300009, 1.959999, 1.709999,        20 },
    { 1, 5, 2, 2, 1, 180,   1, 0.8, 0.6, {       -35,      37.5,         25},      0,      0, 0, {  -0.40147,         -1,   0.29441},        50,       1.5,    -0.02,        0,        20 },
    { 1, 5, 3, 1, 0, 180,   1, 0.5,   0, { 50.599762,      37.5,        -25}, -25600,  28160, 0, {         0,          0,    -10000}, 20.100229, 12.900013,     0.09,        0, 15.599983 },
    { 1, 5, 4, 2, 0, 180,   1, 0.8,   0, { 35.000038,      37.5,   25.00006},  -7680, -30080, 0, { 2290.4126, -4386.1626, 8689.9707}, 30.000267,       1.5,      0.6,     0.01, 25.000019 },
    { 1, 6, 1, 1, 3, 180,   1, 0.5,   0, {        80,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 2, 1, 3, 180,   1, 0.5,   0, {        40,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 3, 1, 3, 180,   1, 0.5,   0, {         0,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 4, 1, 3, 180,   1, 0.5,   0, {       -40,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 5, 1, 3, 180,   1, 0.5,   0, {       -80,        10,       71.5},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 6, 1, 3, 180,   1, 0.5,   0, {     -97.5,        10,         40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 7, 1, 3, 180,   1, 0.5,   0, {     -97.5,         0,         40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 6, 8, 1, 3, 180,   1, 0.5,   0, {     -97.5,        10,        -40},      0,      0, 0, {         0,          0,         0}, 30.000078,       0.5,      0.5,        0,         0 },
    { 1, 7, 1, 2, 1, 180,   1, 0.7, 0.3, {     28.25,        35,        -64}, -19328,      0, 0, {         0,  -0.960431,   0.27852}, 15.000019,         1,        0,        0,        25 },
    { 1, 7, 2, 2, 1, 180,   1, 0.7, 0.3, {    -26.75,        35,        -64}, -19328,      0, 0, {         0,  -0.960431,   0.27852}, 15.000019,         1,        0,        0,        25 },
    { -1 },
};

struct Struct8017748C lbl_801EFC94[32];

void func_80021ECC_inline(struct Struct8017748C *r29)
{
        printf("\x7B\t\n");
        printf("\t%d,\tLID_%s,\t%d,\n", r29->unk0, lbl_801773F0[r29->unk1], lbl_802F1C94);
        printf("\tLTP_%s,\t%d,\t%d,\n", lbl_801773B4[r29->unk4], r29->spotFn, currStageId);
        printf("\t{ %f, %f, %f },\n", r29->unkC, r29->unk10, r29->unk14);
        printf("\t{ %f, %f, %f },\n", r29->unk18.x, r29->unk18.y, r29->unk18.z);
        printf("\t0x%x,\t0x%x,\t0x%x,\t{ %f, %f, %f },\n", r29->unk24, r29->unk26, r29->unk28, r29->unk2C.x, r29->unk2C.y, r29->unk2C.z);
        printf("\t%f,\t%f,\t%f,\n", r29->unk38, r29->unk3C, r29->unk40);
        printf("\t%f,\t%f\n", r29->unk44, r29->unk48);
        printf("},\n\n");
}

#pragma dont_inline on
void func_800210FC(int a)
{
    u8 dummy[8];
    struct Struct8017748C *r31 = lbl_8017748C;

    while (r31->unk0 != -1)
    {
        if (r31->unk8 == a)
            func_80022140(r31);
        r31++;
    }
}
#pragma dont_inline reset

s8 func_80021164(int a, int b, int c)
{
    int i;
    struct Struct8017748C *r7;

    for (r7 = lbl_801EFC94, i = 0; i < lbl_802F1C48; i++, r7++)
    {
        if (r7->unk1 == b && r7->unk2 == c)
            return i;
    }
    if (a == 1)
        return -1;
    for (r7 = lbl_801EFC94, i = 0; i < 32; i++, r7++)
    {
        if (r7->unk0 == 0)
            return i;
    }
    return -1;
}

void func_800212A8(struct Struct8017748C *a)
{
    switch (a->unk4)
    {
    case 0:
        a->unk2C.x = a->unk2C.y = 0.0f;
        a->unk2C.z = -1.0f;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(a->unk26);
        mathutil_mtxA_rotate_x(a->unk24);
        mathutil_mtxA_tf_vec(&a->unk2C, &a->unk2C);
        a->unk2C.x *= 10000.0f;
        a->unk2C.y *= 10000.0f;
        a->unk2C.z *= 10000.0f;
        break;
    case 2:
    case 4:
    case 6:
    case 8:
        if (a->unk1 != 5)
        {
            a->unk2C.x = a->unk2C.y = 0.0f;
            a->unk2C.z = -1.0f;
            mathutil_mtxA_from_identity();
            mathutil_mtxA_rotate_y(a->unk26);
            mathutil_mtxA_rotate_x(a->unk24);
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

void g_init_light_params(struct LightGroup *a, int index, struct Struct8017748C *c)
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

    switch (c->unk4)
    {
    case 0:
    case 1:
    case 3:
    case 5:
    case 7:
        GXInitLightSpot(&lightObj, 0.0f, GX_SP_OFF);
        break;
    case 2:
    case 4:
    case 6:
    case 8:
        GXInitLightSpot(&lightObj, c->unk48, c->spotFn);
        break;
    }

    f3 = (currLightGroup != 3) ? c->unk38 : c->unk38 * lbl_802F1C54;
    switch (c->unk4)
    {
    case 0:
    case 1:
    case 2:
        GXInitLightDistAttn(
            &lightObj,
            f3 * c->unk3C,
            c->unk40 + 0.05f,
            (c->unk4 == 0) ? 0 : (int)(c->unk44 * 100.0) + 3);
        break;
    case 3:
    case 4:
        f3 *= f3;
        GXInitLightAttnK(
            &lightObj,
            c->unk3C * (-85.0f * (1.0f / f3)),
            c->unk40,
            c->unk44 + (0.95f / (0.05f * f3)));
        break;
    case 5:
    case 6:
        GXInitLightAttnK(
            &lightObj,
            c->unk3C,
            c->unk40,
            (-0.1f + c->unk44) * (0.95f / (0.05f * (f3 * f3))));
        break;
    case 7:
    case 8:
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
    switch (c->unk4)
    {
    case 0:
        mathutil_mtxA_tf_point(&c->unk2C, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    case 1:
    case 3:
    case 5:
    case 7:
        mathutil_mtxA_tf_point(&sp60, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    case 2:
    case 4:
    case 6:
    case 8:
        mathutil_mtxA_tf_point(&sp60, &sp60);
        GXInitLightPos(&lightObj, sp60.x, sp60.y, sp60.z);
        mathutil_mtxA_tf_vec(&c->unk2C, &sp60);
        GXInitLightDir(&lightObj, sp60.x, sp60.y, sp60.z);
        break;
    }
    GXLoadLightObjImm(&lightObj, (1 << index));
    memcpy(&a->lightObjs[index], &lightObj, sizeof(a->lightObjs[index]));
}

void func_8002170C(int a)
{
    struct Struct8017748C spC;

    lbl_801F0614 = lbl_80180F64[(backgroundInfo.bgId < 0 || a == 0) ? 0 : backgroundInfo.bgId];
    if (lbl_801F0614.unk34 == 0.0
     && lbl_801F0614.unk38 == 0.0
     && lbl_801F0614.unk3C == 0.0)
        return;

    if (a != 0)
    {
        if (a == 0x63 && advDemoInfo.flags & (1 << 8))
            lbl_801F0614.unk42 = 0x2000;
        if (gameSubmode == 65 || gameSubmode == 66)
        {
            lbl_801F0614.unk40 = 0;
            lbl_801F0614.unk42 = 0x4000;
        }
        if (backgroundInfo.bgId == 14 && modeCtrl.unk30 > 1)
            func_800225FC(0.4f, 0.6f, 0.9f);
        switch (a)
        {
        case 145:
            func_800225FC(0.4f, 0.35f, 0.5f);
            break;
        case 131:
            func_800225FC(0.4f, 0.35f, 0.5f);
            break;
        case 138:
            func_800225FC(0.4f, 0.35f, 0.3f);
            break;
        case 135:
            func_800225FC(0.55f, 0.55f, 0.7f);
            break;
        }
        if (backgroundInfo.bgId == 27)
        {
            switch (modeCtrl.levelSet)
            {
            case 0:
                lbl_801F0614.unk42 += 45056;
                break;
            }
        }
    }
    memset(&spC, 0, sizeof(spC));
    spC.unk1 = 1;
    spC.unk2 = 0;
    spC.unk4 = 0;
    spC.unkC = lbl_801F0614.unk34;
    spC.unk10 = lbl_801F0614.unk38;
    spC.unk14 = lbl_801F0614.unk3C;
    spC.unk24 = lbl_801F0614.unk40;
    spC.unk26 = lbl_801F0614.unk42;
    func_80022140(&spC);
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
    struct Struct8017748C *r7;
    const struct Struct80110260 *r25;
    struct LightGroup *r30;

    r30 = lightGroups;
    for (i = 0; i < 22; i++, r30++)
    {
        for (j = 0; j < 8; j++)
            r30->unk0[j] = -1;
        r30->ambient.r = lbl_801F0614.unk4;
        r30->ambient.g = lbl_801F0614.unk8;
        r30->ambient.b = lbl_801F0614.unkC;
    }

    r7 = lbl_801EFC94;
    j = 0;
    r30 = lightGroups;
    for (i = 0; i < 32; i++, r7++)
    {
        if (r7->unk0 != 0
         && (r7->unk1 == 1 || r7->unk1 == 0 || r7->unk1 == 3))
        {
            r30->unk0[j] = i;
            if (++j == 8)
                break;
        }
    }

    if (lbl_801EFC94[0].unk0 != 0)
        lightGroups[1].unk0[0] = 0;

    r25 = lbl_80110260 + 2;
    for (i = 2; i < 6; i++, r25++)
        memcpy(&lightGroups[i], &lightGroups[r25->unk0], sizeof(lightGroups[i]));

    if (lbl_801F0614.unk44 == NULL)
        return;

    r30 = lightGroups + 7;
    for (i = 7; i < 22; i++, r30++)
    {
        int var = i - 7;
        if (lbl_801F0614.unk44[var] == NULL)
            break;
        for (j = 0; j < 8; j++)
        {
            s8 r4 = lbl_801F0614.unk44[var][j * 2 + 0];
            if (r4 == -1)
                break;
            r30->unk0[j] = func_80021164(1, r4, lbl_801F0614.unk44[var][j * 2 + 1]);
        }

    }
}

void func_80021C44(struct LightGroup *a)
{
    Vec lightPos;
    GXColor lightColor;
    int r5 = TRUE;

    if (a->unk0[0] == -1)
        r5 = FALSE;
    else
    {
        if (lbl_801EFC94[a->unk0[0]].unk0 == 0
         || lbl_801EFC94[a->unk0[0]].unk4 != 0)
            r5 = FALSE;
    }

    if (r5)
    {
        GXGetLightPos(&a->lightObjs[0], &lightPos.x, &lightPos.y, &lightPos.z);
        GXGetLightColor(&a->lightObjs[0], &lightColor);
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

void func_80021DB4(int stageId)
{
    u8 dummy[8];
    int i;
    struct Struct8017748C *r27;

    r27 = lbl_801EFC94;
    for (i = 0; i < 32; i++, r27++)
    {
        memset(r27, 0, sizeof(*r27));
        r27->unk0 = 0;
        r27->unk1 = 0;
        r27->unk2 = 0;
        r27->unk4 = 1;
        r27->unk38 = 2.0f;
        r27->unk3C = 1.0f;
        r27->unk40 = 0.0f;
        r27->unk44 = 0.0f;
        r27->spotFn = GX_SP_COS2;
        r27->unk48 = 45.0f;
    }
    lbl_802F1C48 = 0;
    func_8002170C(stageId);

    r27 = lbl_8017748C;
    while (r27->unk0 != -1)
    {
        if (r27->unk8 == stageId)
            func_80022140(r27);
        r27++;
    }
    lbl_802F1C7C = (stageId == 0) ? currStageId : stageId;
}

void func_80021ECC(void)
{
    u8 dummy[8];
    int i;
    struct Struct8017748C *r28;

    g_lightPerfTimer = 0;
    func_8000E428(lbl_801F0614.unk14, lbl_801F0614.unk18, lbl_801F0614.unk1C);
    func_8000E3BC();
    lbl_802F1C48 = 0;

    r28 = lbl_801EFC94;
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
        func_80021ECC_inline(&lbl_801EFC94[lbl_802F1C94]);
        lbl_802F1C88 = 0;
    }
    if (lbl_802F1C84 != 0)
    {
        if (lbl_802F1C7C == currStageId)
            memcpy(&lbl_801EFC94[lbl_802F1C94], &lbl_801EFC94[lbl_802F1C80], sizeof(lbl_801EFC94[lbl_802F1C94]));
        else
            func_800210FC(lbl_802F1C7C);
        lbl_802F1C84 = 0;
    }
}

BOOL func_80022140(struct Struct8017748C *a)
{
    int r31 = func_80021164(0, a->unk1, a->unk2);
    struct Struct8017748C *r30;

    if (r31 == -1)
        return FALSE;
    r30 = &lbl_801EFC94[r31];
    memcpy(r30, a, sizeof(*r30));
    r30->unk0 = 1;
    r30->unk3C = (a->unk3C == 0.0f) ? 1.0f : a->unk3C;
    r30->unk40 = (a->unk40 == 0.0f) ? 0.0f : a->unk40;
    r30->unk44 = (a->unk44 == 0.0f) ? 0.0f : a->unk44;
    lbl_802F1C48 = r31 + 1;
    return TRUE;
}

#pragma force_active on
struct Struct8017748C *func_80022224(int a, int b)
{
    a = func_80021164(1, a, b);
    return (a == -1) ? NULL : &lbl_801EFC94[a];
}
#pragma force_active reset

void load_light_group(int a)
{
    const struct Struct80110260 *r31;
    struct LightGroup *r30;
    int i;

    perf_init_timer(0);
    currLightGroup = a;
    lbl_802F1C68++;
    r30 = &lightGroups[a];
    r31 = &lbl_80110260[a];
    mathutil_mtxA_to_mtx(r30->unk224);
    if (r31->unk0 != lbl_802F1C4C || (r31->unk4 & 1) != 0)
    {
        r30->lightMask = 0;
        for (i = 0; i < 8; i++)
        {
            if (r30->unk0[i] != -1)
            {
                struct Struct8017748C *r3 = &lbl_801EFC94[r30->unk0[i]];

                if (r3->unk0 != 0)
                {
                    g_init_light_params(r30, i, r3);
                    r30->lightMask |= 1 << i;
                    lbl_802F1C64++;
                }
            }
        }
        g_nl2ngc_set_light_mask(r30->lightMask);
        avdisp_set_light_mask(r30->lightMask);
    }
    if (r31->unk0 != lbl_802F1C4C || (r31->unk4 & 2) != 0)
        func_80022614(r30->ambient.r, r30->ambient.g, r30->ambient.b);
    func_80021C44(r30);
    lbl_802F1C4C = r31->unk0;
    g_lightPerfTimer += perf_stop_timer(0);
}

int func_800223D0(void)
{
    return currLightGroup;
}

void func_800223D8(int lightGroup)
{
    const struct Struct80110260 *r29;
    int i;
    struct LightGroup *r27;

    perf_init_timer(0);
    currLightGroup = lightGroup;
    lbl_802F1C60++;
    r27 = &lightGroups[lightGroup];
    r29 = &lbl_80110260[lightGroup];
    if (r29->unk0 != lbl_802F1C4C || (r29->unk4 & 1) != 0)
    {
        for (i = 0; i < 8; i++)
        {
            if (r27->lightMask & (1 << i))
            {
                GXLoadLightObjImm(&r27->lightObjs[i], (1 << i));
                numLightObjsLoaded++;
            }
        }
        g_nl2ngc_set_light_mask(r27->lightMask);
        avdisp_set_light_mask(r27->lightMask);
    }
    func_80021C44(r27);
    lbl_802F1C4C = r29->unk0;
    g_lightPerfTimer += perf_stop_timer(0);
}

void push_light_group(void)
{
    if (lightGroupStackPos == 3)
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

void func_80022614(float r, float g, float b)
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
    struct Struct8017748C *r31;
    struct NaomiMesh *mesh;

    if (lbl_802F1C8C == 0)
        return;
    r31 = &lbl_801EFC94[lbl_802F1C94];
    switch (r31->unk4)
    {
    case 1:
    case 3:
    case 5:
    case 7:
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
    case 0:
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&currentCameraStructPtr->lookAt);
        mathutil_mtxA_rotate_y(r31->unk26);
        mathutil_mtxA_rotate_x(r31->unk24);
        mathutil_mtxA_rotate_x(0x8000);
        g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_spotl1));
        break;
    case 2:
    case 4:
    case 6:
    case 8:
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
        mathutil_mtxA_rotate_y(r31->unk26);
        mathutil_mtxA_rotate_x(r31->unk24);
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
