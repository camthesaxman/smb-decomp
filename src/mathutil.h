#ifndef _SRC_MATHUTIL_H_
#define _SRC_MATHUTIL_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>

#ifndef __MWERKS__
#define MATHUTIL_C_ONLY
#endif

#define PI 3.14159265358979323846f

struct MathutilData
{
    /*0x00*/ Mtx mtxA;
    #define OFFSET_mtxA 0x00

    /*0x30*/ Mtx mtxB;
    #define OFFSET_mtxB 0x30

    u8 filler60[0x90-0x60];

    /*0x90*/ Mtx *mtxStack;

    /*0x94*/ Mtx *mtxStackPtr;
    #define OFFSET_mtxStackPtr 0x94

    u8 filler98[0x198-0x98];
    /*0x198*/ float constZeroF;
    #define OFFSET_constZeroF 0x198

    /*0x19C*/ float constOneF;
    #define OFFSET_constOneF 0x19C

    /*0x1A0*/ float constOneHalfF;
    #define OFFSET_constOneHalfF 0x1A0

    /*0x1A4*/ float constThreeHalvesF;

    s32 unk1A8;

    /*0x1AC*/ u8 constZeroOne[2];
    #define OFFSET_constZeroOne 0x1AC

    /*0x1AE*/ u8 constOneZero[2];
    #define OFFSET_constOneZero 0x1AE
};

#define LC_CACHE_BASE 0xE0000000

void mathutil_init(void);
float func_8000716C(double a);
float mathutil_sqrt(double n);
float mathutil_rsqrt(double n);
#ifdef MATHUTIL_SIN_INT_PARAM
float mathutil_sin(int angle);
#else
float mathutil_sin(s16 angle);
#endif
#define mathutil_cos(angle) mathutil_sin((angle) + 0x4000)
void mathutil_sin_cos_v(int a, float b[2]);
void func_80007214();
void mathutil_sin_cos(s16 angle);
float mathutil_tan(u32 angle);
s16 mathutil_atan2(double a, float b);
s16 mathutil_atan(float angle);
s16 func_80007424(float a);
float mathutil_vec_dot_normalized(register Vec *vecA, register Vec *vecB);
void mathutil_mtx_from_identity(Mtx mtx);
void mathutil_mtxA_from_identity(void);
void mathutil_mtxA_sq_from_identity(void);
void mathutil_mtxA_from_translate(Vec *vec);
void mathutil_mtxA_from_translate_xyz(float x, float y, float z);
void mathutil_mtxA_from_rotate_x(s16 angle);
void mathutil_mtxA_from_rotate_y(s16 angle);
void mathutil_mtxA_from_rotate_z(s16 angle);
void mathutil_mtxA_from_mtxB_translate(Vec *vec);
void mathutil_mtxA_from_mtxB_translate_xyz(float x, float y, float z);
void mathutil_mtxA_normalize_basis(void);
void mathutil_mtxA_push(void);
void mathutil_mtxA_pop(void);
void mathutil_mtxA_to_mtx(Mtx mtx);
void mathutil_mtxA_from_mtx(Mtx mtx);
void mathutil_mtxA_peek(void);
void mathutil_mtxA_sq_to_mtx(Mtx mtx);
void mathutil_mtxA_sq_from_mtx(Mtx mtx);
void mathutil_mtxA_from_mtxB(void);
void mathutil_mtxA_to_mtxB(void);
void mathutil_mtx_copy(Mtx src, Mtx dest);
void mathutil_mtxA_invert(void);
void mathutil_mtxA_rigid_invert(void);
void mathutil_mtxA_mult_right(Mtx mtx);
void mathutil_mtxA_mult_left(Mtx mtx);
void mathutil_mtxA_from_mtxB_mult_mtx(Mtx mtx);
void mathutil_mtx_mult(Mtx a, Mtx b, Mtx c);
void mathutil_mtxA_translate(Vec *vec);
void mathutil_mtxA_translate_xyz(float x, float y, float z);
void mathutil_mtxA_translate_neg(Vec *vec);
void mathutil_mtxA_translate_neg_xyz(float x, float y, float z);
void mathutil_mtxA_scale(Vec *vec);
void mathutil_mtxA_scale_s(float scale);
void mathutil_mtxA_scale_xyz(float x, float y, float z);
void mathutil_mtxA_tf_point(Vec *src, Vec *dest);
void mathutil_mtxA_tf_vec(Vec *src, Vec *dest);
void mathutil_mtxA_tf_point_xyz(Vec *vec, float x, float y, float z);
void mathutil_mtxA_tf_vec_xyz(Vec *vec, float x, float y, float z);
void mathutil_mtxA_rigid_inv_tf_point(Vec *a, Vec *b);
void mathutil_mtxA_rigid_inv_tf_tl(Vec *dest);
void mathutil_mtxA_rigid_inv_tf_vec(Vec *src, Vec *dest);
void mathutil_mtxA_rigid_inv_tf_vec_xyz(float x, float y, float z);
void mathutil_mtxA_rotate_x(int angle);
void mathutil_mtxA_rotate_x_sin_cos(float sinAngle, float cosAngle);
void mathutil_mtxA_rotate_y(int angle);
void mathutil_mtxA_rotate_y_sin_cos(float sinAngle, float cosAngle);
void mathutil_mtxA_rotate_z(int angle);
void mathutil_mtxA_rotate_z_sin_cos(float sinAngle, float cosAngle);
float mathutil_vec_normalize_len(Vec *vec);
void mathutil_vec_set_len(Vec *src, Vec *dest, float len);
float mathutil_vec_dot_normalized_safe(Vec *a, Vec *b);
void mathutil_mtxA_from_quat(Quaternion *quat);
void mathutil_quat_mult(Quaternion *result, Quaternion *quat1, Quaternion *quat2);
void func_80008378(float a, float b, float c);
void u_math_unk6(Quaternion *quat);
void u_math_unk7(Quaternion *a, Vec *b, Vec *c, float d);
void u_math_unk8(Quaternion *a, Vec *b, Vec *c, float d);
void mathutil_ray_to_euler(Vec *rayStart, Vec *rayEnd, S16Vec *rot);
void mathutil_ray_to_euler_xy(Vec *rayStart, Vec *rayEnd, s16 *rotX, s16 *rotY);
void mathutil_vec_to_euler(Vec *vec, S16Vec *rot);
void mathutil_vec_to_euler_xy(Vec *vec, s16 *rotX, s16 *rotY);
void mathutil_mtxA_to_quat(Quaternion *quat);
void mathutil_quat_from_axis_angle(Quaternion *quat, Vec *axis, s16 angle);
void u_math_unk9_smth_w_quats(Quaternion *a, register Vec *b, register double c);
void mathutil_quat_from_axis_angle(Quaternion *a, Vec *b, s16 c);
double mathutil_quat_to_axis_angle(Quaternion *quat, Vec *axis);
void mathutil_quat_normalize(Quaternion *quat);
void mathutil_quat_from_dirs(Quaternion *quat, Vec *start, Vec *end);
void mathutil_quat_slerp(Quaternion *result, Quaternion *start, Quaternion *end, float t);
void u_math_unk10(Quaternion *a, Quaternion *b);
void u_math_unk11(Quaternion *a, Quaternion *b);
void mathutil_mtxA_to_euler_yxz(s16 *rotY, s16 *rotX, s16 *rotZ);
void mathutil_mtxA_to_euler(S16Vec *rot);
void u_math_unk14(s16 *a, s16 *b, s16 *c);
void u_math_unk15(Vec *a, Vec *b, float c);
void u_math_unk16(Vec *a, Vec *b, float c);
void mathutil_scale_ray(Vec *rayStart, Vec *rayEnd, Vec *outRayEnd, float scale);
u16 mathutil_calc_crc16(s32 length, u8 *data);

static inline float mathutil_floor(register float n)
{
#ifdef MATHUTIL_C_ONLY
    // TODO
    return (s32)n;
#else
    s32 buf[2];
    register float savedFlags;
    asm
    {
        // save FPSCR flags
        mffs savedFlags
        // set rounding mode to -inf (FPSCR bits 30-31 are 11)
        mtfsb1 30
        mtfsb1 31
        // convert to integer
        fctiw n, n
        stfd n, buf[0]
        // restore old FPCSR flags
        mtfsf 0xFF, savedFlags
    }
    return buf[1];
#endif
}

static inline float mathutil_ceil(register float n)
{
#ifdef MATHUTIL_C_ONLY
    // TODO
    return (s32)n;
#else
    s32 buf[2];
    register float savedFlags;
    asm
    {
        // save FPSCR flags
        mffs savedFlags
        // set rounding mode to -inf (FPSCR bits 30-31 are 10)
        mtfsb1 30
        mtfsb0 31
        // convert to integer
        fctiw n, n
        stfd n, buf[0]
        // restore old FPCSR flags
        mtfsf 0xFF, savedFlags
    }
    return buf[1];
#endif
}

static inline float mathutil_trunc(register float n)
{
#ifdef MATHUTIL_C_ONLY
    // TODO
    return (s32)n;
#else
    s32 buf[2];
    register float savedFlags;
    asm
    {
        // save FPSCR flags
        mffs savedFlags
        // set rounding mode to round toward zero (FPSCR bits 30-31 are 01)
        mtfsb0 30
        mtfsb1 31
        // convert to integer
        fctiw n, n
        stfd n, buf[0]
        // restore old FPCSR flags
        mtfsf 0xFF, savedFlags
    }
    return buf[1];
#endif
}

static inline float mathutil_sum_of_sq_2(register float a, register float b)
{
#ifdef MATHUTIL_C_ONLY
    return a * a + b * b;
#else
    asm
    {
        fmuls a, a, a
        fmadds a, b, b, a
    }
    return a;
#endif
}

static inline float mathutil_sum_of_sq_3(register float a, register float b, register float c)
{
#ifdef MATHUTIL_C_ONLY
    return a * a + b * b + c * c;
#else
    asm
    {
        fmuls a, a, a
        fmadds a, b, b, a
        fmadds a, c, c, a
    }
    return a;
#endif
}

static inline float mathutil_vec_len(register Vec *v)
{
#ifdef MATHUTIL_C_ONLY
    return mathutil_sqrt(v->x * v->x + v->y * v->y + v->z * v->z);
#else
    register float x, y, z;
    asm
    {
        lfs x, v->x
        lfs y, v->y
        lfs z, v->z
        fmuls x, x, x
        fmadds x, y, y, x
        fmadds x, z, z, x
    }
    return mathutil_sqrt(x);
#endif
}

static inline float mathutil_vec_sq_len(register Vec *v)
{
#ifdef MATHUTIL_C_ONLY
    return v->x * v->x + v->y * v->y + v->z * v->z;
#else
    register float x, y, z;
    asm
    {
        lfs x, v->x
        lfs y, v->y
        lfs z, v->z
        fmuls x, x, x
        fmadds x, y, y, x
        fmadds x, z, z, x
    }
    return x;
#endif
}

static inline float mathutil_vec_distance(register Vec *a, register Vec *b)
{
#ifdef MATHUTIL_C_ONLY
    float result = (a->x - b->x) * (a->x - b->x)
                 + (a->y - b->y) * (a->y - b->y)
                 + (a->z - b->z) * (a->z - b->z);
    return mathutil_sqrt(result);
#else
    register float x1, y1, z1, x2, y2, z2;
    register float result;
    asm
    {
        lfs x1, a->x
        lfs x2, b->x
        lfs y1, a->y
        lfs y2, b->y
        lfs z1, a->z
        lfs z2, b->z
        fsubs x1, x1, x2
        fsubs y1, y1, y2
        fsubs z1, z1, z2
        fmuls result, x1, x1
        fmadds result, y1, y1, result
        fmadds result, z1, z1, result
    }
    return mathutil_sqrt(result);
#endif
}

static inline float mathutil_vec_dot_prod(register Vec *a, register Vec *b)
{
#ifdef MATHUTIL_C_ONLY
    return a->x * b->x + a->y * b->y + a->z * b->z;
#else
    register float x1, y1, z1, x2, y2, z2;

    asm
    {
        lfs x1, a->x
        lfs x2, b->x
        lfs y1, a->y
        lfs y2, b->y
        lfs z1, a->z
        lfs z2, b->z
        fmuls x2, x1, x2
        fmadds x2, y1, y2, x2
        fmadds x2, z1, z2, x2
    }
    return x2;
#endif
}

// same as mathutil_vec_dot_prod, but with some registers swapped
static inline float mathutil_vec_dot_prod_alt(register Vec *a, register Vec *b)
{
#ifdef MATHUTIL_C_ONLY
    return a->x * b->x + a->y * b->y + a->z * b->z;
#else
    register float x1, y1, z1, x2, y2, z2;
    register float result;

    asm
    {
        lfs x1, a->x
        lfs x2, b->x
        lfs y1, a->y
        lfs y2, b->y
        lfs z1, a->z
        lfs z2, b->z
        fmuls result, x1, x2
        fmadds result, y1, y2, result
        fmadds result, z1, z2, result
    }
    return result;
#endif
}

// another register swapped variant
static inline float mathutil_vec_dot_prod_alt2(register Vec *a, register Vec *b)
{
#ifdef MATHUTIL_C_ONLY
    return a->x * b->x + a->y * b->y + a->z * b->z;
#else
    register float x1, y1, z1, x2, y2, z2;

    asm
    {
        lfs x1, a->x
        lfs x2, b->x
        lfs y1, a->y
        lfs y2, b->y
        lfs z1, a->z
        lfs z2, b->z
        fmuls x1, x1, x2
        fmadds x1, y1, y2, x1
        fmadds x1, z1, z2, x1
    }
    return x1;
#endif
}

extern inline void mathutil_vec_cross_prod(register Vec *a, register Vec *b, register Vec *result)
{
#ifdef MATHUTIL_C_ONLY
    float x = a->y * b->z - a->z * b->y;
    float y = a->z * b->x - a->x * b->z;
    float z = a->x * b->y - a->y * b->x;

    result->x = x;
    result->y = y;
    result->z = z;
#else
    register float x1, y1, z1, x2, y2, z2;
    register float x, y, z;

    asm
    {
        lfs y1, a->y
        lfs z2, b->z
        lfs z1, a->z
        lfs x2, b->x
        lfs x1, a->x
        lfs y2, b->y

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
#endif
}

static inline void mathutil_mtxA_get_translate(Vec *v)
{
#ifdef MATHUTIL_C_ONLY
    v->x = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][3];
    v->y = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][3];
    v->z = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][3];
#else
    register float *mtxA;
    register float *_x = &v->x;
    register float *_y = &v->y;
    register float *_z = &v->z;
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

static inline void mathutil_mtxA_get_translate_alt(register Vec *v)
{
#ifdef MATHUTIL_C_ONLY
    v->x = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][3];
    v->y = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][3];
    v->z = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][3];
#else
    register float *mtxA;
    register float *_x = &v->x;
    register float *_y = &v->y;
    register float *_z = &v->z;
    register float x, y, z;

    asm
    {
        //addi _x, v, 0
        addi _y, v, 4
        addi _z, v, 8
        lis mtxA, LC_CACHE_BASE@ha
        lfs x, 0x0C(mtxA)  // mtxA[0][3]
        lfs y, 0x1C(mtxA)  // mtxA[1][3]
        lfs z, 0x2C(mtxA)  // mtxA[2][3]
        stfs x, 0(v)
        stfs y, 0(_y)
        stfs z, 0(_z)
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

static inline void mathutil_mtxA_set_translate(register Vec *v)
{
#ifdef MATHUTIL_C_ONLY
    ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][3] = v->x;
    ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][3] = v->y;
    ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][3] = v->z;
#else
    register float *mtxA;
    register float x, y, z;

    asm
    {
        lfs x, v->x
        lfs y, v->y
        lfs z, v->z
        lis mtxA, LC_CACHE_BASE@ha
        stfs x, 0x0C(mtxA)  // mtxA[0][3]
        stfs y, 0x1C(mtxA)  // mtxA[1][3]
        stfs z, 0x2C(mtxA)  // mtxA[2][3]
    }
#endif
}

static inline void mathutil_mtxA_set_translate_xyz(register float x, register float y, register float z)
{
#ifdef MATHUTIL_C_ONLY
    ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][3] = x;
    ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][3] = y;
    ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][3] = z;
#else
    register float *mtxA;

    asm
    {
        lis mtxA, LC_CACHE_BASE@ha
        stfs x, 0x0C(mtxA)  // mtxA[0][3]
        stfs y, 0x1C(mtxA)  // mtxA[1][3]
        stfs z, 0x2C(mtxA)  // mtxA[2][3]
    }
#endif
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

static inline void mathutil_unk_inline(register float a, register Vec *v)
{
    register void *mtxA;
    register float var1, var2, var3, var4, var5, var6;
#ifdef MATHUTIL_C_ONLY
    var1 = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][2];
    var2 = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][3];
    var3 = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][2];
    var4 = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][3];
    var5 = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][2];
    var6 = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][3];
    v->x = var1 * a + var2;
    v->y = var3 * a + var4;
    v->z = var5 * a + var6;
#else
    asm
    {
        lis mtxA, LC_CACHE_BASE@ha
        lfs var1, 0x08(mtxA)  // mtxA[0][2]
        lfs var2, 0x0C(mtxA)  // mtxA[0][3]
        lfs var3, 0x18(mtxA)  // mtxA[1][2]
        lfs var4, 0x1C(mtxA)  // mtxA[1][3]
        lfs var5, 0x28(mtxA)  // mtxA[2][2]
        lfs var6, 0x2C(mtxA)  // mtxA[2][3]
        fmadds var1, var1, a, var2
        stfs var1, v->x
        fmadds var3, var3, a, var4
        stfs var3, v->y
        fmadds var5, var5, a, var6
        stfs var5, v->z
    };
#endif
}

#endif
