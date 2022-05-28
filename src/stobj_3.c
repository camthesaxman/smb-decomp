#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "gma.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "stage.h"
#include "stcoli.h"

struct Struct8028C0D8_sub_sub
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
    float unk1C;
    float unk20;
    float unk24;
    u32 unk28;
    float unk2C;
};  // size = 0x30

struct Struct8028C0D8
{
    u32 unk0;
    float unk4;
    float unk8;
    float unkC;
    s32 unk10;
    struct Stobj_ *unk14;
    struct Struct8028C0D8_sub_sub unk18[8];
};  // size = 0x198

struct Struct8028C0D8 lbl_8028C0D8[8];

struct Struct8028CD98
{
    u32 unk0;
    u8 filler4[0x10-0x4];
    struct StageGoal unk10;
    u8 filler24[4];
};  // size = 0x28

struct Struct8028CD98 lbl_8028CD98[8];

s16 lbl_801BE420[] =
{
    0x001D, 0x001E,
    0x001F, 0x0020,
    0x0021, 0x0022,
    0x0023, 0x0024,
    0x0025, 0x0026,
};

s16 lbl_801BE434[] =
{
    0x0013, 0x0014,
    0x0015, 0x0016,
    0x0017, 0x0018,
    0x0019, 0x001A,
    0x001B, 0x001C,
};

void func_8006C7BC(struct StageAnimGroup *arg0, int arg1)
{
    struct Stobj_ stobj;
    struct StageAnimGroup *stageAg;
    int i, j;
    int totalGoals = 0;
    struct StageGoal *goal;
    struct Struct8028C0D8 *var_r24;
    struct Struct8028CD98 *var_r24_2;
    Point3d sp10;

    memset(lbl_8028C0D8, 0, sizeof(lbl_8028C0D8));
    memset(&stobj, 0, sizeof(stobj));

    stobj.type = SOT_GOALTAPE;

    var_r24 = lbl_8028C0D8;
    stageAg = arg0;
    totalGoals = 0;
    for (i = 0; i < arg1; i++, stageAg++)
    {
        goal = stageAg->goals;
        for (j = 0; j < stageAg->goalCount; j++, goal++, var_r24++)
        {
            if (totalGoals >= 8)
            {
                g_debug_set_cursor_pos(16, 16);
                g_debug_printf("Warning!!! Goal Tape Max(%d) Over!!!\n", 8);
                break;
            }
            stobj.unk58 = goal->pos;
            stobj.unk70 = goal->rotX;
            stobj.unk72 = goal->rotY;
            stobj.unk74 = goal->rotZ;
            stobj.unkA0 = i;
            var_r24->unk0 = 0;
            stobj.unkA4 = var_r24;
            func_8006B2C0(&stobj);
            totalGoals++;
        }
    }
    memset(lbl_8028CD98, 0, sizeof(lbl_8028CD98));
    memset(&stobj, 0, sizeof(stobj));

    if (modeCtrl.levelSetFlags & LVLSET_FLAG_MASTER)
        stobj.type = SOT_GOALBAG_EXMASTER;
    else
        stobj.type = SOT_GOALBAG;

    sp10.x = 0.0f;
    sp10.y = 2.8f;
    sp10.z = 0.0f;

    var_r24_2 = lbl_8028CD98;
    stageAg = arg0;
    totalGoals = 0;
    for (i = 0; i < arg1; i++, stageAg++)
    {
        goal = stageAg->goals;
        for (j = 0; j < stageAg->goalCount; j++, goal++, var_r24_2++)
        {
            if (totalGoals >= 8)
                break;
            mathutil_mtxA_from_translate(&goal->pos);
            mathutil_mtxA_rotate_z(goal->rotZ);
            mathutil_mtxA_rotate_y(goal->rotY);
            mathutil_mtxA_rotate_x(goal->rotX);
            mathutil_mtxA_tf_point(&sp10, &stobj.unkA8);
            stobj.unk70 = goal->rotX;
            stobj.unk72 = goal->rotY;
            stobj.unk74 = goal->rotZ;
            stobj.unkA0 = i;
            var_r24_2->unk0 = 0;
            var_r24_2->unk10 = *goal;
            stobj.unkA4 = var_r24_2;
            func_8006B2C0(&stobj);
            totalGoals++;
        }

    }
}

extern struct NaomiModel *lbl_8028CED8[];
extern struct NaomiModel *lbl_8028CF00[];

// https://decomp.me/scratch/L6SNU
#ifdef NONMATCHING
void stobj_goaltape_init(struct Stobj_ *arg0)
{
    struct RaycastHit spC;
    f32 temp_f10;
    f32 temp_f11;
    int i;
    int j;
    struct Struct8028C0D8_sub_sub *var_r7;
    struct Struct8028C0D8 *temp_r31;
    struct NaomiModel **mdlPtr;
    //s16 *idxPtr;
    Point3d sp28;

    arg0->unkC = 0;
    arg0->unk8 |= 2;
    arg0->model = (struct GMAModel *) naomiCommonObj->modelPtrs[0xE];
    arg0->unk34 = 1.3125f;
    arg0->g_model_origin = arg0->model->boundSphereCenter;
    temp_r31 = arg0->unkA4;
    temp_r31->unk14 = arg0;
    temp_r31->unk10 = -1;
    mathutil_mtxA_from_translate(&arg0->unk58);
    mathutil_mtxA_rotate_z(arg0->unk74);
    mathutil_mtxA_rotate_y(arg0->unk72);
    mathutil_mtxA_rotate_x(arg0->unk70);
    mathutil_mtxA_tf_point(&arg0->g_model_origin, &sp28);
    mathutil_mtxA_push();
    raycast_stage_down(&sp28, &spC, NULL);
    mathutil_mtxA_pop();
    if (spC.flags & 1)
    {
        mathutil_mtxA_rigid_inv_tf_point(&spC.pos, &sp28);
        temp_r31->unk4 = 0.002 + sp28.y;
    }
    else
        temp_r31->unk4 = 0.002f;
    temp_f11 = arg0->g_model_origin.y;
    var_r7 = temp_r31->unk18;
    for (i = 8; i > 0; i--, var_r7++)
    {
        temp_f10 = (i - 1) / 7.0f;
        var_r7->unk0 = (1.75 * temp_f10) - 0.875;
        var_r7->unk4 = temp_f11;
        var_r7->unk8 = 0.0f;
        var_r7->unk18 = temp_f10;
        var_r7->unkC = 0.0f;
        var_r7->unk10 = 0.0f;
        var_r7->unk14 = 1.0f;
        var_r7->unk1C = 0.0f;
        var_r7->unk20 = 0.0f;
        var_r7->unk24 = 0.0f;
        var_r7->unk28 = 6;
        var_r7->unk2C = 0.225f;
    }
    temp_r31->unk18[0].unk28 &= 0xFFFFFFFD;
    temp_r31->unk18[0].unk28 |= 1;
    temp_r31->unk18[7].unk28 &= 0xFFFFFFFB;
    temp_r31->unk18[7].unk28 |= 1;
    temp_r31->unk8 = temp_f11;
    temp_r31->unkC = temp_f11;

    mdlPtr = lbl_8028CED8;
    //idxPtr = lbl_801BE420;
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[0]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[1]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[2]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[3]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[4]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[5]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[6]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[7]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[8]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE420[9]];

    mdlPtr = lbl_8028CF00;
    //idxPtr = lbl_801BE434;
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[0]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[1]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[2]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[3]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[4]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[5]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[6]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[7]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[8]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[lbl_801BE434[9]];
}
#else
float  force_lbl_802F48F0() { return 1.3125f; }
double force_lbl_802F48F8() { return 0.002; }
float  force_lbl_802F4900() { return 0.0020000000949949026f; }
float  force_lbl_802F4904() { return 7.0f; }
double force_lbl_802F4908() { return 1.75; }
double force_lbl_802F4910() { return 0.875; }
float  force_lbl_802F4918() { return 1.0f; }
float  force_lbl_802F491C() { return 0.22499999403953552f; }
asm void stobj_goaltape_init(struct Stobj_ *arg0)
{
    nofralloc
#include "../asm/nonmatchings/stobj_goaltape_init.s"
}
#pragma peephole on
#endif
