#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

#pragma force_active on

const struct Struct80034F5C_3 lbl_80114808[] =
{
    {
        0,
        0,
        1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        1,
        1,
        -1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        3.141592741f,
        0.0f,
    },
    {
        3,
        3,
        1.0f,
        -1.0f,
        1.0f,
        0.0f,
        -3.141592741f,
        0.0f,
    },
    {
        6,
        11,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        7,
        12,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        10,
        15,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        11,
        6,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        12,
        7,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        15,
        10,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        16,
        16,
        -1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        3.141592741f,
        0.0f,
    },
    {
        18,
        23,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        21,
        26,
        1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        22,
        27,
        1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        23,
        18,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        26,
        21,
        1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        27,
        22,
        1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        255,
        255,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
    },
};

const struct Struct80034F5C_3 lbl_801149E4[] =
{
    {
        0,
        0,
        1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        1,
        1,
        -1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        3.141592741f,
        0.0f,
    },
    {
        3,
        3,
        1.0f,
        -1.0f,
        1.0f,
        0.0f,
        -3.141592741f,
        0.0f,
    },
    {
        6,
        11,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        7,
        12,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        10,
        15,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        11,
        6,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        12,
        7,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        15,
        10,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        16,
        16,
        -1.0f,
        -1.0f,
        -1.0f,
        0.0f,
        3.141592741f,
        0.0f,
    },
    {
        18,
        23,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        21,
        26,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        22,
        27,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        23,
        18,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        26,
        21,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        27,
        22,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        255,
        255,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
    },
};

const struct Struct80034F5C_3 lbl_80114BC0[] =
{
    {
        1,
        1,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        2,
        2,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        3,
        3,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        4,
        4,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        5,
        5,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        6,
        6,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        7,
        7,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        8,
        8,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        9,
        9,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        10,
        10,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        11,
        11,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        12,
        12,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        14,
        14,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        15,
        15,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        16,
        16,
        -1.0f,
        -1.0f,
        1.0f,
        0.0f,
        0.0f,
        0.0f,
    },
    {
        255,
        255,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
        0.0f,
    },
};

const struct Struct80034F5C_2 lbl_80114D80[] =
{
    { 2, 2 },
    { 4, 4 },
    { 9, 14 },
    { 14, 9 },
    { 20, 25 },
    { 25, 20 },
    { 255, 255 },
};
const struct Struct80034F5C_2 lbl_80114D9C[] =
{
    { 0, 0 },
    { 2, 2 },
    { 4, 4 },
    { 9, 14 },
    { 14, 9 },
    { 20, 25 },
    { 25, 20 },
    { 255, 255 },
};

const struct Struct80034F5C_2 lbl_80114DBC[] =
{
    { 255, 255 },
};

extern const u8 lbl_801147D8[];
extern const u8 lbl_801147F4[];

const void *const lbl_80114DC0[] =
{
    lbl_801147D8,
    lbl_801147D8,
    lbl_801147F4,
    lbl_801147F4,
};

const struct Struct80034F5C_3 *const lbl_80114DD0[] =
{
    lbl_801149E4,
    lbl_80114808,
    lbl_80114BC0,
    lbl_80114BC0,
};

const struct Struct80034F5C_2 *const lbl_80114DE0[] =
{
    lbl_80114D9C,
    lbl_80114D80,
    lbl_80114DBC,
    lbl_80114DBC,
};

// different file due to float constants?
void func_80035648(struct Struct8003699C_child *a)
{
    u32 flags;
    struct Struct80034F5C_1 *r31 = a->unk81A8;
    struct Struct80034F5C_1 *r30;

	//! BUG: casting away const qualifier
    struct Struct80034F5C_3 *r4 = (void *)lbl_80114DD0[a->unk36];
    struct Struct80034F5C_2 *r5 = (void *)lbl_80114DE0[a->unk36];
    float f1 = a->unk38 + a->unk40;
    u32 r6 = a->unk0 & (1 << 2);

    func_80034F5C(r31, r4, r5, f1, r6);

    r30 = r31;
    mathutil_mtxA_from_mtx(a->unk54);
    mathutil_mtxA_rotate_y(a->unk2E);
    mathutil_mtxA_to_mtx(r31->unk168);
    flags = r30->unk0;
    while (flags != 0)
    {
        if (flags & (1 << 2))
        {
            r30->unk1CC = r30->unk1C0;
            mathutil_mtxA_from_mtx(r31->unk168);
            mathutil_mtxA_tf_point(&r30->unk1CC, &r30->unk1CC);
        }
        r30++;
        flags = r30->unk0;
    }
}

static inline void mathutil_mtxA_copy_translate(register Mtx mtx)
{
#ifdef MATHUTIL_C_ONLY
    mtx[0][3] = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][3];
    mtx[1][3] = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][3];
    mtx[2][3] = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][3];
#else
    register float *mtxA;
    register float x, y, z;

    asm
    {
        lis mtxA, LC_CACHE_BASE@ha
        lfs x, 0x0C(mtxA)  // mtxA[0][3]
        lfs y, 0x1C(mtxA)  // mtxA[1][3]
        lfs z, 0x2C(mtxA)  // mtxA[2][3]
        stfs x, 0x0C(mtx)
        stfs y, 0x1C(mtx)
        stfs z, 0x2C(mtx)
    }
#endif
}

static inline void mathutil_mtxA_get_translate_alt2(register Vec *v)
{
#ifdef MATHUTIL_C_ONLY
    v->x = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][3];
    v->y = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][3];
    v->z = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][3];
#else
    register float *mtxA;
    register float *_x = &v->x;
    register float *_y = _x + 1;
    register float *_z = _x + 2;
    register float x, y, z;

    asm
    {
        lis mtxA, LC_CACHE_BASE@ha
        lfs x, 0x0C(mtxA)  // mtxA[0][3]
        lfs y, 0x1C(mtxA)  // mtxA[1][3]
        lfs z, 0x2C(mtxA)  // mtxA[2][3]
        stfs x, 0(_x)
        stfs y, 0(_y)
        stfs z, 0(_z)
    }
#endif
}

void func_80035B14(struct Struct80034F5C_1 *, struct Struct80034F5C_1 *);
void func_80035DEC(Vec *);

void func_80035748(struct Struct80034F5C_1 *arg0, struct Struct80034F5C_1 *arg1)
{
    u32 temp_r28;
    u32 temp_r31;
    u32 i;

    temp_r31 = arg1->unk0;
    switch (temp_r31 & 0x3F00)
    {
    default:
		mathutil_mtxA_set_translate(&arg1->unk1CC);
        mathutil_mtxA_sq_from_mtx(arg0->unk168);
        if (temp_r31 & 8)
            mathutil_mtxA_mult_right(arg1->unk1D8);
        mathutil_mtxA_to_mtx(arg1->unk208);
        break;
    case 0x100:
        if ((temp_r31 & 0x80) && !(temp_r31 & 0x4000))
        {
            mathutil_mtxA_push();
            func_80035B14(arg0, arg1);
            mathutil_mtxA_pop();
        }
        if (temp_r31 & 2)
            mathutil_mtxA_translate(&arg1->unk10);
        if (temp_r31 & 0x4000)
        {
            mathutil_mtxA_sq_from_mtx(arg1->unk208);
            mathutil_mtxA_copy_translate(arg1->unk208);
        }
        else
        {
            if (temp_r31 & 8)
                mathutil_mtxA_mult_right(arg1->unk1D8);
            mathutil_mtxA_rigid_inv_tf_point(&arg1[1].unk1CC, &arg1->unk1CC);
            func_80035DEC(&arg1->unk1CC);
            mathutil_mtxA_to_mtx(arg1->unk208);
        }
        break;
    case 0x200:
        if (!(temp_r31 & 0x4000))
        {
            mathutil_mtxA_push();
            func_80035B14(arg0, arg1);
            mathutil_mtxA_pop();
        }
        if (temp_r31 & 2)
            mathutil_mtxA_translate(&arg1->unk10);
        mathutil_mtxA_sq_from_mtx(arg1->unk208);
        mathutil_mtxA_copy_translate(arg1->unk208);
        break;
    case 0x400:
        mathutil_mtxA_translate(&arg1->unk10);
        if (temp_r31 & 0x4000)
        {
            mathutil_mtxA_sq_from_mtx(arg1->unk208);
			mathutil_mtxA_copy_translate(arg1->unk208);
        }
        else
        {
            mathutil_mtxA_rotate_z_sin_cos(arg1->unk198, arg1->unk19C);
            mathutil_mtxA_to_mtx(arg1->unk208);
        }
        break;
    case 0x800:
        if ((temp_r31 & 0x80) && !(temp_r31 & 0x4000))
        {
            mathutil_mtxA_push();
            func_80035B14(arg0, arg1);
            mathutil_mtxA_pop();
        }
        mathutil_mtxA_translate(&arg1->unk10);
        if (temp_r31 & 0x10)
            mathutil_mtxA_sq_from_mtx(arg0->unk168);
        if (temp_r31 & 1)
            mathutil_mtxA_to_mtx(arg1->unk208);
        mathutil_mtxA_get_translate_alt2(&arg1->unk1CC);
        break;
    case 0x1000:
        if (temp_r31 & 2)
        {
            if ((temp_r31 & 0x80) && !(temp_r31 & 0x4000))
            {
                mathutil_mtxA_push();
                func_80035B14(arg0, arg1);
                mathutil_mtxA_pop();
            }
            mathutil_mtxA_translate(&arg1->unk10);
        }
        if (temp_r31 & 8)
            mathutil_mtxA_mult_right(arg1->unk1D8);
        else if (temp_r31 & 0x40)
            mathutil_mtxA_mult_right(arg1->unk1C);
        if (temp_r31 & 1)
            mathutil_mtxA_to_mtx(arg1->unk208);
        break;
    case 0x2000:
        if (temp_r31 & 2)
        {
            if ((temp_r31 & 0x80) && !(temp_r31 & 0x4000))
            {
                mathutil_mtxA_push();
                func_80035B14(arg0, arg1);
                mathutil_mtxA_pop();
            }
            mathutil_mtxA_translate((Point3d *) &arg1->unk10);
        }
        if (temp_r31 & 8)
            mathutil_mtxA_mult_right(arg1->unk1D8);
        if (temp_r31 & 0x40)
            mathutil_mtxA_mult_right(arg1->unk1C);
        if (temp_r31 & 1)
            mathutil_mtxA_to_mtx(arg1->unk208);
        break;
    }
    temp_r28 = arg1->unk4C;
    if (temp_r28 > 1)
    {
		for (i = 0; i < temp_r28; i++)
        {
            if (i == 0)
                mathutil_mtxA_push();
            else if (i == (u32)(temp_r28 - 1))
                mathutil_mtxA_pop();
            else
                mathutil_mtxA_peek();
            func_80035748(arg0, &arg0[arg1->unk50[i]]);
        }
    }
    else if (temp_r28 != 0)
        func_80035748(arg0, &arg0[arg1->unk50[0]]);
}

void func_80035E7C(float *, float *, float, float, float);

void func_80035B14(struct Struct80034F5C_1 *arg0, struct Struct80034F5C_1 *arg1)
{
    f32 temp_f31;
    u32 temp_r29;
    struct Struct80034F5C_1 *temp_r28;
    struct Struct80034F5C_1 *temp_r27;
	u32 temp_r27_2;
	u32 i;

    temp_r29 = arg1->unk0;
    temp_r29 |= 0x4000;
    arg1->unk0 = temp_r29;
    switch (temp_r29 & 0x3F00)
    {
    case 0x100:
        if (temp_r29 & 2)
            mathutil_mtxA_translate(&arg1->unk4);
        mathutil_mtxA_mult_right(arg1->unk1D8);
        mathutil_mtxA_rigid_inv_tf_point(&arg1[1].unk1CC, &arg1->unk1CC);
        func_80035DEC(&arg1->unk1CC);
        mathutil_mtxA_sq_to_mtx(arg1->unk208);
        break;
    case 0x200:
        if (temp_r29 & 2)
            mathutil_mtxA_translate(&arg1->unk4);
        mathutil_mtxA_mult_right(arg1->unk1D8);
        temp_r27 = arg1 + 2;
        temp_r28 = arg1 + 1;
        mathutil_mtxA_rigid_inv_tf_point(&temp_r27->unk1CC, &arg1->unk1CC);
        temp_f31 = mathutil_vec_len(&arg1->unk1CC);
        func_80035E7C(&arg1->unk198, &arg1->unk19C, temp_r28->unk4.x, temp_f31, temp_r27->unk4.x);
        func_80035E7C(&temp_r28->unk198, &temp_r28->unk19C, temp_r28->unk4.x, temp_r27->unk4.x, temp_f31);
        if (temp_r28->unk0 & 0x20)
        {
            temp_r28->unk198 = -temp_r28->unk198;
            temp_r28->unk19C = -temp_r28->unk19C;
        }
        else
        {
            arg1->unk198 = -arg1->unk198;
            temp_r28->unk19C = -temp_r28->unk19C;
        }
        func_80035DEC(&arg1->unk1CC);
        mathutil_mtxA_rotate_z_sin_cos(arg1->unk198, arg1->unk19C);
        mathutil_mtxA_sq_to_mtx(arg1->unk208);
        break;
    case 0x400:
        mathutil_mtxA_translate(&arg1->unk4);
        mathutil_mtxA_rotate_z_sin_cos(arg1->unk198, arg1->unk19C);
        mathutil_mtxA_sq_to_mtx(arg1->unk208);
        break;
    case 0x800:
        mathutil_mtxA_translate(&arg1->unk4);
        if (temp_r29 & 0x10)
            mathutil_mtxA_sq_from_mtx(arg0->unk168);
        break;
    case 0x1000:
        if (temp_r29 & 2)
            mathutil_mtxA_translate(&arg1->unk4);
        if (temp_r29 & 8)
            mathutil_mtxA_mult_right(arg1->unk1D8);
        else if (temp_r29 & 0x40)
            mathutil_mtxA_mult_right(arg1->unk1C);
        break;
    case 0x2000:
        if (temp_r29 & 2)
            mathutil_mtxA_translate(&arg1->unk4);
        if (temp_r29 & 8)
            mathutil_mtxA_mult_right(arg1->unk1D8);
        if (temp_r29 & 0x40)
            mathutil_mtxA_mult_right(arg1->unk1C);
        break;
    }
    if (temp_r29 & 0x80)
    {
		temp_r27_2 = arg1->unk4C;
        if (temp_r27_2 > 1)
        {
			for (i = 0; i < temp_r27_2; i++)
            {
                if (i == 0)
                    mathutil_mtxA_push();
                else if (i == (u32)(temp_r27_2 - 1))
                    mathutil_mtxA_pop();
                else
                    mathutil_mtxA_peek();
                func_80035B14(arg0, &arg0[arg1->unk50[i]]);
            }
        }
        else if (temp_r27_2 != 0)
            func_80035B14(arg0, &arg0[arg1->unk50[0]]);
    }
}

void func_80035DEC(Vec *arg0)
{
	float f1 = arg0->x * arg0->x + arg0->y * arg0->y;
	float f30 = f1 + arg0->z * arg0->z;
	float f31 = mathutil_rsqrt(f1);
	float var;

	mathutil_mtxA_rotate_z_sin_cos(arg0->y * f31, arg0->x * f31);
	var = mathutil_rsqrt(f30);
	mathutil_mtxA_rotate_y_sin_cos(-arg0->z * var, var / f31);
}

void func_80035E7C(float *arg0, float *arg1, float arg2, float arg3, float arg4)
{
	float f6 = arg2 * arg3;
    float phi_f31;

	f6 += f6;
    phi_f31 = (arg2 * arg2 + arg3 * arg3 - arg4 * arg4) / (f6);
    if (phi_f31 > 1.0f)
        phi_f31 = 1.0f;
    else if (phi_f31 < -1.0f)
        phi_f31 = -1.0f;
    *arg0 = mathutil_sqrt(1.0f - phi_f31 * phi_f31);
    *arg1 = phi_f31;
}

struct Struct80035F18
{
    u32 unk0;
    u16 unk4;
    u16 unk6;
    u8 filler8[0x34-0x8];
    struct Struct80034F5C_1 *unk34;
    u8 unk38[0x4090-0x38];
};  // size = 0x4090

void func_80035F18(struct Struct80035F18 *arg0, struct Struct8003699C_child *arg1, s32 arg2, s32 arg3)
{
    memset(arg0, 0, sizeof(*arg0));
    arg0->unk0 = arg2;
    arg0->unk4 = arg3;
    if (arg2 & 1)
    {
        arg0->unk6 = 2U;
        arg0->unk0 |= 4;
        arg0->unk34 = &arg1->unk81A8[10];
    }
    else if (arg2 & 2)
    {
        arg0->unk6 = 3;
        arg0->unk0 &= ~4;
        arg0->unk34 = &arg1->unk81A8[15];
    }
    func_800367E4(arg0->unk38, arg0->unk6, arg3);
}

extern void *lbl_80116634[];

void func_80035FDC(struct Struct8003699C_child *arg0)
{
	arg0->unk81A4 = lbl_80116634[arg0->unk32];
}
