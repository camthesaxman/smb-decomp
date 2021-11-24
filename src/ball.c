#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

u8 ballInfo[0x10];
Mtx lbl_80205E30;  // ballInfo + 0x10
struct Ball lbl_80205E60[8];  // ballInfo + 0x40

FORCE_BSS_ORDER(ballInfo)
FORCE_BSS_ORDER(lbl_80205E30)
FORCE_BSS_ORDER(lbl_80205E60)

struct Struct8003699C
{
    u8 filler0[0x14];
    u32 unk14;
    u8 filler18[0x54-0x18];
    s32 unk54;
    u8 filler58[0x60-0x58];
    Quaternion unk60;
    u8 filler70[0xC0-0x70];
    s8 unkC0;
};

static inline void vec_cross_prod(Vec *a, Vec *b, register Vec *result)
{
#ifdef __MWERKS__
    register float x1, y1, z1, x2, y2, z2;
    register float x, y, z;

    y1 = a->y;
    z2 = b->z;
    z1 = a->z;
    x2 = b->x;
    x1 = a->x;
    y2 = b->y;

    asm
    {
        fmuls x, y1, z2
        fmuls y, z1, x2
        fmuls z, x1, y2
        fnmsubs x, z1, y2, x
        stfs x, result->x
        fnmsubs y, x1, z2, y
        stfs y, result->y
        fnmsubs z, y1, x2, z
        stfs z, result->z
    }
#else
    float x = a->y * b->z - a->z * b->y;
    float y = a->z * b->x - a->x * b->z;
    float z = a->x * b->y - a->y * b->x;
    result->x = x;
    result->y = y;
    result->z = z;
#endif
}

void func_8003699C(struct Struct8003699C *a)
{
    struct Ball *ball = &lbl_80205E60[a->unkC0];
    Quaternion quat;
    Vec sp48;
    Vec sp3C = {0.0f, 1.0f, 0.0f};
    float f1;

    ball->unkA8.w /= 0.65f;
    ball->unkA8.x *= 0.65f;
    ball->unkA8.y *= 0.65f;
    ball->unkA8.z *= 0.65f;

    mathutil_quat_normalize(&ball->unkA8);
    mathutil_mtxA_from_quat(&ball->unkA8);
    mathutil_mtxA_to_mtx(lbl_80205E30);
    mathutil_mtxA_from_quat(&a->unk60);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_left(lbl_80205E30);
    mathutil_mtxA_normalize_basis();

    if (!(ball->unk94 & (1<<(31-0x1A))))
    {
        float f31 = mathutil_vec_mag(&ball->unk1C);
        float f1 = mathutil_vec_mag(&ball->unkB8);

        if (f31 > 0.032407406717538834f)
        {
            if (f1 * 100.0f < ball->unkC4)
                ball->unk94 |= 0x20;
            else if (f1 * 3.0f < ball->unkC4 && f31 * 1.5f < ball->unkF8)
                ball->unk94 |= 0x20;
        }
    }

    if (!(a->unk14 & (1<<(31-0xE))) && ball->unkA8.w < 0.9941f)
        return;

    mathutil_mtxA_to_mtx(lbl_80205E30);

    sp48 = (Vec){0.0f, 1.0f, 0.0f};
    mathutil_mtxA_rigid_inv_tf_vec(&sp48, &sp48);

    f1 = 1.0f - mathutil_vec_dot_normalized(&sp48, &sp3C);
    if (!(a->unk14 & (1<<(31-0xE))) && f1 > 0.01f)
    {
        Vec sp30 = {0.0f, 1.0f, 0.0f};
        if (f1 > 1.999f)
            sp48 = (Vec){1.0f, 0.0f, 0.0f};
        else
            vec_cross_prod(&sp30, &sp48, &sp48);
        mathutil_quat_from_axis_angle(&quat, &sp48, 0x38E);
    }
    else
    {
        mathutil_quat_from_dirs(&quat, &(Vec){0.0f, 1.0f, 0.0f}, &sp48);
    }

    mathutil_quat_normalize(&quat);
    mathutil_mtxA_from_quat(&quat);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_left(lbl_80205E30);
}

float func_80036CAC(struct Struct8003699C *a)
{
    struct Ball *ball = &lbl_80205E60[a->unkC0];
    Vec sp4C;
    Vec sp40;
    Quaternion sp30;
    float var1;

    sp4C = ball->unk1C;
    sp4C.y = 0.0f;

    if (mathutil_vec_mag(&sp4C) < 0.00027777777f)
        return 0.0f;

    mathutil_vec_normalize_len(&sp4C);
    mathutil_mtxA_rigid_inv_tf_vec(&sp4C, &sp4C);

    sp40 = (Vec){0.0f, 0.0f, 0.0f};

    var1 = sp4C.x;
    if (var1 > -0.992f)
    {
        float one = 1.0f;  // useless; needed to match
        Vec sp24 = {-1.0f, 0.0f, 0.0f};

        var1 = 1.0f - var1;
        if (var1 > 9.9999999392252903e-09f)
            vec_cross_prod(&sp24, &sp4C, &sp40);
        else
        {
            sp40.x = 0.0f;
            sp40.y = 1.0f;
            sp40.z = 0.0f;
        }
        mathutil_quat_from_axis_angle(&sp30, &sp40, 0x2D8);
    }
    else
    {
        mathutil_quat_from_dirs(&sp30, &(Vec){-1.0f, 0.0f, 0.0f}, &sp4C);
    }

    mathutil_mtxA_push();
    mathutil_mtxA_from_quat(&sp30);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_to_mtx(lbl_80205E30);
    mathutil_mtxA_pop();
    mathutil_mtxA_mult_right(lbl_80205E30);
    return mathutil_vec_mag(&ball->unkB8) * 1.5f;
}

void func_80036EB8(struct Struct8003699C *a)
{
    struct Ball *r31 = &lbl_80205E60[a->unkC0];
    struct Struct8003FB48 sp70;
    struct Struct8003FB48 sp54;
    Vec sp48;
    Vec sp3C;
    Vec spC[] =
    {
        {0.3f,   0.0f, 0.0f},
        {-0.25f, 0.0f, 0.0f},
        {0.1f,   0.0f, -0.2f},
        {0.1f,   0.0f, 0.2f},
    };
    int r29;
    u32 i;
    
    mathutil_mtxA_push();
    sp48.x = 1.0f;
    sp48.y = 0.0f;
    sp48.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp48, &sp48);
    r29 = -mathutil_atan2(sp48.z, sp48.x) - 32768;
    func_8003FB48(&r31->unk4, &sp70, 0);
    mathutil_mtxA_from_translate(&r31->unk4);
    mathutil_mtxA_rotate_y(r29);
    r31->unk94 &= ~(1<<(31-0x1E));
    
    for (i = 0; i < 4; i++)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_tf_point(&spC[i], &sp48);
        func_8003FB48(&sp48, &sp54, 0);
        mathutil_mtxA_pop();
        if (sp54.unk0 == 0 || sp54.unk8 < sp70.unk8 - 1.0)
        {
            r31->unk94 |= 2;
            sp3C.x = sp48.x;
            sp3C.y = r31->unk4.y - 1.0;
            sp3C.z = sp48.z;
            a->unk54 = i;
            func_800390C8(3, &sp3C, 0.5f);
            break;
        }
    }
    mathutil_mtxA_pop();
}

/*
const float lbl_802F3398 = 0.65f;
const float lbl_802F339C = 0.032407406717538834f;
const float lbl_802F33A0 = 100.0f;
const float lbl_802F33A4 = 3.0f;
const float lbl_802F33A8 = 1.5f;
const float lbl_802F33AC = 0.9941f;
const float lbl_802F33B0 = 1.0f;
const float lbl_802F33B4 = 0.01f;
const float lbl_802F33B8 = 1.999f;
const float lbl_802F33BC = 0.0f;
const float lbl_802F33C0 = 0.00027777777f;
const float lbl_802F33C4 = -0.992f;
const float lbl_802F33C8 = 9.9999999392252903e-09f;
const double lbl_802F33D0 = 1.0;
const float lbl_802F33D8 = 0.5f;
*/
const float lbl_802F33DC = 0.2f;
