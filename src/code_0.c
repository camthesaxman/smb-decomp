#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

/*
struct
{
    Vec unk0;
    Vec unkC;
    Vec unk18;
    Vec unk24;
    Vec unk30;
} lbl_801EFC18;
FORCE_BSS_ORDER(lbl_801EFC18)
*/
Vec lbl_801EFC18[5];
FORCE_BSS_ORDER(lbl_801EFC18)

/*
struct
{
    Vec unk0;  // + 0x3C
    Vec unkC;  // + 0x48
    Vec unk18;  // + 0x54
    Vec unk24;  // + 0x60
    u8 filler30[0x34-0x30];
} lbl_801EFC54;  // +0x3C
*/
Vec lbl_801EFC54[4];
FORCE_BSS_ORDER(lbl_801EFC54)

#define lbl_801EFC18_unk0  lbl_801EFC18[0]
#define lbl_801EFC18_unkC  lbl_801EFC18[1]
#define lbl_801EFC18_unk18 lbl_801EFC18[2]
#define lbl_801EFC18_unk24 lbl_801EFC18[3]
#define lbl_801EFC18_unk30 lbl_801EFC18[4]
#define lbl_801EFC54_unk0  lbl_801EFC54[0]
#define lbl_801EFC54_unkC  lbl_801EFC54[1]
#define lbl_801EFC54_unk18 lbl_801EFC54[2]
#define lbl_801EFC54_unk24 lbl_801EFC54[3]
#define lbl_801EFC54_unk30 lbl_801EFC54[4]

double force_sdata2_802F2F50() { return 182.04444885253906; }
double force_sdata2_802F2F58() { return 0.5; }
float  force_sdata2_802F2F60() { return 182.04444885253906f; }

void func_80020AB8(Vec *a, S16Vec *b, float c, float d, float e, float f)
{
    u8 dummy[8];
    s16 r30;
    s16 r29;
    s16 r26;
    s16 r25;
    s16 temp;
    float f28;
    float f27;
    float sincos[2];

    lbl_801EFC18_unk0 = *a;
    if (f == 0.0f)
    {
        temp = (s16)(c * 182.04444885253906f);
        r30 = -temp / 2;
        r29 = temp / 2;
    }
    else
    {
        f27 = mathutil_tan((s16)((c * 0.5f) * 182.04444885253906f));
        r30 = -mathutil_atan(f27 * (1.0 - f));
        r29 = mathutil_atan(f27 * (1.0 + f));
    }
    if (e == 0.0f)
    {
        temp = mathutil_atan(mathutil_tan((s16)((c * 0.5) * 182.04444885253906)) * d) * 2;
        r26 = temp / 2;
        r25 = -temp / 2;
    }
    else
    {
        if (f == 0.0f)
            f28 = d * mathutil_tan((s16)((c * 0.5f) * 182.04444885253906f));
        else
            f28 = f27 * d;
        r26 = mathutil_atan(f28 * (1.0 + e));
        r25 = -mathutil_atan(f28 * (1.0 - e));
    }

    mathutil_mtxA_from_translate(a);
    mathutil_mtxA_rotate_y(b->y);
    mathutil_mtxA_rotate_x(b->x);
    mathutil_mtxA_rotate_z(b->z);

    mathutil_sin_cos_v(r26 - 0x4000, sincos);
    lbl_801EFC54_unk0.x = -sincos[0];
    lbl_801EFC54_unk0.y = 0.0f;
    lbl_801EFC54_unk0.z = -sincos[1];
    mathutil_mtxA_tf_vec(&lbl_801EFC54_unk0, &lbl_801EFC18_unkC);

    mathutil_sin_cos_v(r25 + 0x4000, sincos);
    lbl_801EFC54_unkC.x = -sincos[0];
    lbl_801EFC54_unkC.y = 0.0f;
    lbl_801EFC54_unkC.z = -sincos[1];
    mathutil_mtxA_tf_vec(&lbl_801EFC54_unkC, &lbl_801EFC18_unk18);

    mathutil_sin_cos_v(r30 + 0x4000, sincos);
    lbl_801EFC54_unk18.x = 0.0f;
    lbl_801EFC54_unk18.y = -sincos[0];
    lbl_801EFC54_unk18.z = -sincos[1];
    mathutil_mtxA_tf_vec(&lbl_801EFC54_unk18, &lbl_801EFC18_unk24);

    mathutil_sin_cos_v(r29 - 0x4000, sincos);
    lbl_801EFC54_unk24.x = 0.0f;
    lbl_801EFC54_unk24.y = -sincos[0];
    lbl_801EFC54_unk24.z = -sincos[1];
    mathutil_mtxA_tf_vec(&lbl_801EFC54_unk24, &lbl_801EFC18_unk30);
}

BOOL func_80020DB4(Vec *a, float b)
{
    Vec v;
    int i;

    v.x = a->x - lbl_801EFC18[0].x;
    v.y = a->y - lbl_801EFC18[0].y;
    v.z = a->z - lbl_801EFC18[0].z;

    for (i = 1; i < 5; i++)
    {
        if (v.x * lbl_801EFC18[i].x + v.y * lbl_801EFC18[i].y + v.z * lbl_801EFC18[i].z < -b)
            return FALSE;
    }
    return TRUE;
}

BOOL g_test_sphere_in_frustum(Point3d *p, float radius)
{
    Vec sp10;
    float x, y, z;
    int i;

    mathutil_mtxA_tf_point(p, &sp10);
    x = sp10.x;
    y = sp10.y;
    z = sp10.z;
    if (z > radius)
        return FALSE;
    radius = -radius;
    for (i = 0; i < 4; i++)
    {
        if (x * lbl_801EFC54[i].x + y * lbl_801EFC54[i].y + z * lbl_801EFC54[i].z < radius)
            return FALSE;
    }
    return TRUE;
}

BOOL g_test_scaled_sphere_in_frustum(Point3d *p, float radius, float scale)
{
    Vec sp10;
    float x, y, z;
    int i;

    mathutil_mtxA_tf_point(p, &sp10);
    radius *= scale;
    x = sp10.x;
    y = sp10.y;
    z = sp10.z;
    if (z > radius)
        return FALSE;
    radius = -radius;
    for (i = 0; i < 4; i++)
    {
        if (x * lbl_801EFC54[i].x + y * lbl_801EFC54[i].y + z * lbl_801EFC54[i].z < radius)
            return FALSE;
    }
    return TRUE;
}

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
    u8 filler4[8-4];
    u8 unk8;
    u8 filler9[0x4C-0x9];
};

extern struct Struct8017748C lbl_8017748C[];

u8 lbl_801EFC88[0xC] ATTRIBUTE_ALIGN(8);
FORCE_BSS_ORDER(lbl_801EFC88)

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

struct Struct8017748C lbl_801EFC94[32];
FORCE_BSS_ORDER(lbl_801EFC94)

extern s32 lbl_802F1C48;

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


char lbl_802F03EC[4] = "\x7B\t\n";

/*
    .balign 8
.global lbl_802F2F50
lbl_802F2F50:
    # ROM: 0x1EC970
    .double 182.04444885253906  ;# 0x40, 0x66, 0xC1, 0x6C, 0x20, 0x00, 0x00, 0x00

.global lbl_802F2F58
lbl_802F2F58:
    # ROM: 0x1EC978
    .double 0.5  ;# 0x3F, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.global lbl_802F2F60
lbl_802F2F60:
    # ROM: 0x1EC980
    .float 182.04444885253906  ;# 0x43, 0x36, 0x0B, 0x61

.global lbl_802F2F64
lbl_802F2F64:
    # ROM: 0x1EC984
    .float 0  ;# 0x00, 0x00, 0x00, 0x00

.global lbl_802F2F68
lbl_802F2F68:
    # ROM: 0x1EC988
    .float 0.5  ;# 0x3F, 0x00, 0x00, 0x00
    .float 0  ;# 0x00, 0x00, 0x00, 0x00
double lbl_802F2F70 = 1.0;
const float lbl_802F2F78 = 0f;
const float lbl_802F2F7C = -1f;
const float lbl_802F2F80 = 10000f;
const float lbl_802F2F84 = 255f;
const double lbl_802F2F88 = 100;
const float lbl_802F2F90 = 0.05000000074505806f;
const float lbl_802F2F94 = -85f;
const float lbl_802F2F98 = 1f;
const float lbl_802F2F9C = 0.94999998807907104f;
const float lbl_802F2FA0 = -0.10000000149011612f;
const double lbl_802F2FA8 = 0;
const float lbl_802F2FB0 = 2.0499999523162842f;
const float lbl_802F2FB4 = 0.40000000596046448f;
const float lbl_802F2FB8 = 0.60000002384185791f;
const float lbl_802F2FBC = 0.89999997615814209f;
const float lbl_802F2FC0 = 0.34999999403953552f;
const float lbl_802F2FC4 = 0.5f;
const float lbl_802F2FC8 = 0.30000001192092896f;
const float lbl_802F2FCC = 0.55000001192092896f;
const float lbl_802F2FD0 = 176f;
const float lbl_802F2FE0 = 2f;
const float lbl_802F2FE4 = 45f;
const double lbl_802F2FE8 = 2;
*/
