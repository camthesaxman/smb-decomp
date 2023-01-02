#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "gma.h"
#include "mathutil.h"
#include "mode.h"
#include "pool.h"

#include "../data/common.gma.h"

struct Struct802B90F0
{
    Vec unk0[13];
    //u8 filler0[0x9C];
};

Vec lbl_802B90F0[4][13];
FORCE_BSS_ORDER(lbl_802B90F0)

float lbl_802B9360[4];  // 0x270
FORCE_BSS_ORDER(lbl_802B9360)

Vec lbl_802B9370;  // 0x280

float lbl_802B937C[4+1];

extern float lbl_802F2178;

void func_800940B8(void)
{
    lbl_802B9370.x = 0.0f;
    lbl_802B9370.y = 10000.0f;
    lbl_802B9370.z = 0.0f;
    lbl_802F2178 = 1.0f;
}

extern const struct Struct80171A08 { float unk0; float unk4; s16 unk8; } lbl_80171A08[];
extern const Vec lbl_80171AA4;

static inline float inline_asm_stuff(register float a, register float b, register float c, register float d)
{
#ifdef C_ONLY
    return (a - b) * (a - b) + (c - d) * (c - d);
#else
    asm
    {
        fsubs a, a, b
        fsubs c, c, d
        fmuls a, a, a
        fmadds a, c, c, a
    }
    return a;
#endif
}

void func_800940E0(void)
{
    Vec sp38;
    Vec sp2C;
    Vec sp20;
    Vec sp14;
    Vec sp8;
    struct Camera *camera;
    int i;
    struct Ball *var_r17;
    s8 *var_r16;
    int var_r15;
    float temp_f1;
    float temp_f23;
    float temp_f2;
    float temp_f2_3;
    int var_ctr;

    camera = cameraInfo;
    for (i = 0; i < modeCtrl.playerCount; i++, camera++)
    {
        if ((cameraInfo[i].sub28.vp.width > 0.0f) && (cameraInfo[i].sub28.vp.height > 0.0f))
        {
            mathutil_mtxA_from_mtx(camera->unk1A4);
            mathutil_mtxA_tf_point(&lbl_802B9370, &sp38);
            for (var_ctr = 0; var_ctr < 13; var_ctr++)
            {
                temp_f2 = (-0.11 / sp38.z) * lbl_80171A08[var_ctr].unk0;
                lbl_802B90F0[i][var_ctr].x = sp38.x * temp_f2;
                lbl_802B90F0[i][var_ctr].y = sp38.y * temp_f2;
                lbl_802B90F0[i][var_ctr].z = sp38.z * temp_f2;
                lbl_802B90F0[i][var_ctr].z = -0.11 + (1e-05 * var_ctr);
            }
            sp20 = lbl_80171AA4;
            sp2C.x = lbl_802B9370.x - camera->eye.x;
            sp2C.y = lbl_802B9370.y - camera->eye.y;
            sp2C.z = lbl_802B9370.z - camera->eye.z;
            mathutil_mtxA_from_mtx(camera->unk1A4);
            mathutil_mtxA_tf_point(&sp2C, &sp2C);
            temp_f1 = mathutil_vec_dot_normalized_safe(&sp2C, &sp20);
            if (temp_f1 <= 0.70710678)
            {
                lbl_802B937C[i] = 0.0f;
                lbl_802B9360[i] = 0.0f;
            }
            else
            {
                lbl_802B937C[i] = 3.4142135485416842 * (temp_f1 - 0.70710678);
                lbl_802B9360[i] = 0.99 * lbl_802B937C[i];
            }
            if (lbl_802B9360[i] > 0.0f)
            {
                var_r17 = ballInfo;
                var_r16 = g_poolInfo.playerPool.statusList;
                for (var_r15 = g_poolInfo.playerPool.count; var_r15 > 0; var_r15--, var_r17++, var_r16++)
                {
                    if (*var_r16 != 0 && *var_r16 != 4 && !(var_r17->flags & 0x10))
                    {
                        mathutil_mtxA_tf_point(&var_r17->pos, &sp14);
                        if (!(sp14.z >= 0.0f))
                        {
                            temp_f2 = -1.0f / (sp14.z * camera->sub28.unk38);
                            sp14.x *= temp_f2;
                            sp14.y *= temp_f2;
                            temp_f23 = var_r17->currRadius * temp_f2;
                            sp8 = lbl_802B90F0[i][0];
                            temp_f2_3 = -1.0f / (sp8.z * camera->sub28.unk38);
                            sp8.x *= temp_f2_3;
                            sp8.y *= temp_f2_3;
                            temp_f2 = mathutil_sqrt(inline_asm_stuff(sp14.x, sp8.x, sp14.y, sp8.y)) / temp_f23;
                            if (temp_f2 < 1.0f)
                            {
                                temp_f2 = 1.0f - mathutil_sqrt(1.0f - (temp_f2 * temp_f2));
                                lbl_802B937C[i] *= temp_f2;
                                lbl_802B9360[i] *= temp_f2;
                            }
                        }
                    }
                }
            }
        }
    }
}

void u_something_with_lens_flare_2(int arg0)
{
    float temp_f1;
    u32 var_r30;
    Vec *var_r29;
    const struct Struct80171A08 *r28;

    if (!(cameraInfo[arg0].sub28.vp.width > 0.0f) || !(cameraInfo[arg0].sub28.vp.height > 0.0f))
        return;
    if (lbl_802B9360[arg0] == 0.0)
        return;

    if (gameMode == MD_ADV)
    {
        switch (gameSubmode)
        {
        case SMD_ADV_RANKING_INIT:
        case SMD_ADV_RANKING_MAIN:
        case SMD_ADV_GAME_READY_INIT:
        case SMD_ADV_GAME_READY_MAIN:
        case SMD_ADV_GAME_PLAY_INIT:
        case SMD_ADV_GAME_PLAY_MAIN:
            break;
        default:
            return;
        }
    }

    var_r29 = lbl_802B90F0[arg0];
    r28 = lbl_80171A08;
    for (var_r30 = 0; var_r30 < 13; var_r30++, var_r29++, r28++)
    {
        avdisp_set_alpha(lbl_802B9360[arg0]);
        mathutil_mtxA_from_translate(var_r29);
        temp_f1 = r28->unk4;
        temp_f1 *= lbl_802F2178;
        mathutil_mtxA_scale_xyz(temp_f1, temp_f1, 1.0f);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        avdisp_draw_model_unculled_sort_none(commonGma->modelEntries[r28->unk8].model);
    }
}

void u_something_with_lens_flare_1(int arg0)
{
    if (!(cameraInfo[arg0].sub28.vp.width > 0.0f) || !(cameraInfo[arg0].sub28.vp.height > 0.0f))
        return;
    if (lbl_802B9360[arg0] == 0.0)
        return;

    if (gameMode == MD_ADV)
    {
        switch (gameSubmode)
        {
        case SMD_ADV_RANKING_INIT:
        case SMD_ADV_RANKING_MAIN:
        case SMD_ADV_GAME_READY_INIT:
        case SMD_ADV_GAME_READY_MAIN:
        case SMD_ADV_GAME_PLAY_INIT:
        case SMD_ADV_GAME_PLAY_MAIN:
            break;
        default:
            return;
        }
    }

    mathutil_mtxA_from_translate_xyz(0.0f, 0.0f, -0.2f);
    avdisp_set_alpha(0.75f * lbl_802B9360[arg0]);
    avdisp_draw_model_culled_sort_all(commonGma->modelEntries[BLACK_SCREEN].model);
}

void func_800946BC(Vec *a)
{
    lbl_802B9370 = *a;
}

static inline void mathutil_mtxA_get_col2_scaled(register Vec *v, register float scale)
{
#ifdef C_ONLY
    v->x = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[0][2] * scale;
    v->y = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[1][2] * scale;
    v->z = ((struct MathutilData *)LC_CACHE_BASE)->mtxA[2][2] * scale;
#else
    register float *mtxA;
    register float x, y, z;

    asm
    {
        lis mtxA, LC_CACHE_BASE@ha
        lfs x, 0x08(mtxA)  // mtxA[0][2]
        lfs y, 0x18(mtxA)  // mtxA[1][2]
        lfs z, 0x28(mtxA)  // mtxA[2][2]
        fmuls x, x, scale
        stfs x, v->x
        fmuls y, y, scale
        stfs y, v->y
        fmuls z, z, scale
        stfs z, v->z
    }
#endif
}

void func_800946DC(int arg0, int arg1)
{
    mathutil_mtxA_from_rotate_y(arg0);
    mathutil_mtxA_rotate_x(arg1);
    mathutil_mtxA_get_col2_scaled(&lbl_802B9370, -1000000.0);
}

void func_80094748(float arg0)
{
    lbl_802F2178 = arg0;
}

void func_80094750(int arg0)
{
    lbl_802C5D60.unk0 = arg0;
    DCFlushRange(&lbl_802C5D60, sizeof(lbl_802C5D60));
    HIOWrite(0x1000, &lbl_802C5D60, sizeof(lbl_802C5D60));
    HIOWriteMailbox(arg0);
}

void func_800947B0(void)
{
    HIORead(0x1000, &lbl_802C5D60, sizeof(lbl_802C5D60));
    DCInvalidateRange(&lbl_802C5D60, sizeof(lbl_802C5D60));
}

int func_800947F8(void)
{
    u32 spC;
    u8 filler[4];

    OSGetTick();
    while (1)
    {
        HIOReadMailbox(&spC);
        if (spC == 2)
            return 0;
        if (spC == 1)
            return 1;
    }
}

void func_80094840(void)
{
    u32 sp8;

    do
    {
        HIOReadMailbox(&sp8);
    } while (sp8 != 0);
}
