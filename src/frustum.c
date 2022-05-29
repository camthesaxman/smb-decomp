#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

Vec lbl_801EFC18;
Vec lbl_801EFC24[4];
Vec lbl_801EFC54[4];

FORCE_BSS_ORDER(lbl_801EFC18)
FORCE_BSS_ORDER(lbl_801EFC24)
FORCE_BSS_ORDER(lbl_801EFC54)

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

    lbl_801EFC18 = *a;
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
    lbl_801EFC54[0].x = -sincos[0];
    lbl_801EFC54[0].y = 0.0f;
    lbl_801EFC54[0].z = -sincos[1];
    mathutil_mtxA_tf_vec(&lbl_801EFC54[0], &lbl_801EFC24[0]);

    mathutil_sin_cos_v(r25 + 0x4000, sincos);
    lbl_801EFC54[1].x = -sincos[0];
    lbl_801EFC54[1].y = 0.0f;
    lbl_801EFC54[1].z = -sincos[1];
    mathutil_mtxA_tf_vec(&lbl_801EFC54[1], &lbl_801EFC24[1]);

    mathutil_sin_cos_v(r30 + 0x4000, sincos);
    lbl_801EFC54[2].x = 0.0f;
    lbl_801EFC54[2].y = -sincos[0];
    lbl_801EFC54[2].z = -sincos[1];
    mathutil_mtxA_tf_vec(&lbl_801EFC54[2], &lbl_801EFC24[2]);

    mathutil_sin_cos_v(r29 - 0x4000, sincos);
    lbl_801EFC54[3].x = 0.0f;
    lbl_801EFC54[3].y = -sincos[0];
    lbl_801EFC54[3].z = -sincos[1];
    mathutil_mtxA_tf_vec(&lbl_801EFC54[3], &lbl_801EFC24[3]);
}

BOOL func_80020DB4(Vec *a, float b)
{
    Vec v;
    int i;

    v.x = a->x - lbl_801EFC18.x;
    v.y = a->y - lbl_801EFC18.y;
    v.z = a->z - lbl_801EFC18.z;

    for (i = 0; i < 4; i++)
    {
        if (v.x * lbl_801EFC24[i].x + v.y * lbl_801EFC24[i].y + v.z * lbl_801EFC24[i].z < -b)
            return FALSE;
    }
    return TRUE;
}

BOOL u_test_sphere_in_frustum(Point3d *p, float radius)
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

BOOL u_test_scaled_sphere_in_frustum(Point3d *p, float radius, float scale)
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
