#include <dolphin.h>

#include "global.h"
#include "camera.h"
#include "gma.h"
#include "mathutil.h"

void func_800948F4(void)
{
    func_80094914();
}

static s32 lbl_802F2190;
static struct Struct8009492C *lbl_802F2194;
struct Struct8009492C lbl_802B9390[64];

void func_80094914(void)
{
    lbl_802F2190 = ARRAY_COUNT(lbl_802B9390);
    lbl_802F2194 = lbl_802B9390;
}

int func_8009492C(struct Struct8009492C *arg0)
{
    if (lbl_802F2190 == 0)
        return 0;
    *lbl_802F2194 = *arg0;
    lbl_802F2194->unk30 = MAX(MAX(lbl_802F2194->unk14.x, lbl_802F2194->unk14.y), lbl_802F2194->unk14.z);
    lbl_802F2194->unk34 = lbl_802F2194->unk30 * lbl_802F2194->unk28->boundSphereRadius;
    lbl_802F2194++;
    lbl_802F2190--;
    return 1;
}

void func_80094A34(void)
{
    Vec sp14;
    Vec sp8;
    int var_r29;
    struct Struct8009492C *var_r28;
    float var_f28;
    float temp_f1;
    float temp_f27;
    float temp_f3;

    var_r29 = ARRAY_COUNT(lbl_802B9390) - lbl_802F2190;
    if (var_r29 != 0)
    {
        temp_f1 = -currentCameraStructPtr->sub28.unk38;
        temp_f27 = temp_f1 / currentCameraStructPtr->sub28.vp.height;
        avdisp_set_z_mode(1, 3, 0);

        var_r28 = lbl_802B9390;
        for (; var_r29 > 0; var_r29--, var_r28++)
        {
            mathutil_mtxA_from_mtxB_translate(&var_r28->unk0);
            mathutil_mtxA_rotate_y(var_r28->unkC.y);
            mathutil_mtxA_rotate_x(var_r28->unkC.x);
            mathutil_mtxA_rotate_z(var_r28->unkC.z);
            mathutil_mtxA_get_translate_alt(&sp14);
            if (sp14.z < 0.0f)
            {
                float temp_f2 = var_r28->unk20;
                var_f28 = var_r28->unk34 / (sp14.z * temp_f27);
                if (var_f28 < temp_f2)
                    continue;
                var_f28 = (var_f28 - temp_f2) / (var_r28->unk24 - temp_f2);
                if (var_f28 > 1.0f)
                    var_f28 = 1.0f;
            }
            else
                var_f28 = 1.0f;
            temp_f3 = 1.0f - (0.2f / mathutil_vec_len(&sp14));
            sp14.x *= temp_f3;
            sp14.y *= temp_f3;
            sp14.z *= temp_f3;
            mathutil_mtxA_set_translate(&sp14);
            sp8.x = var_r28->unk14.x * temp_f3;
            sp8.y = var_r28->unk14.y * temp_f3;
            sp8.z = var_r28->unk14.z * temp_f3;
            mathutil_mtxA_scale(&sp8);
            avdisp_set_bound_sphere_scale(var_r28->unk30);
            GXLoadPosMtxImm(mathutilData->mtxA, 0);
            GXLoadNrmMtxImm(mathutilData->mtxA, 0);
            var_f28 *= 0.003921569f;
            avdisp_set_post_mult_color(var_r28->unk2C.r * var_f28, var_r28->unk2C.g * var_f28, var_r28->unk2C.b * var_f28, 1.0f);
            avdisp_draw_model_culled_sort_none(var_r28->unk28);
            avdisp_set_post_mult_color(1.0f, 1.0f, 1.0f, 1.0f);
        }
        avdisp_set_z_mode(1, 3, 1);
    }
}
