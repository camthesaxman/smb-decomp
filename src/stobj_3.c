#include <math.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "gma.h"
#include "info.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "stage.h"
#include "stcoli.h"
#include "world.h"

#include "../data/common.nlobj.h"

struct GoalTape_sub
{
    Vec unk0;
    Vec unkC;
    float unk18;
    Vec unk1C;
    u32 unk28;
    float unk2C;
};  // size = 0x30

struct GoalTape
{
    u32 unk0;
    float unk4;
    float unk8;
    float unkC;
    s32 unk10;
    struct Stobj_ *unk14;
    struct GoalTape_sub unk18[8];
};  // size = 0x198

struct GoalTape goalTapes[8];

struct PartyBall
{
    u32 unk0;
    u8 filler4[0x10-0x4];
    struct StageGoal goal;
    u8 filler24[4];
};  // size = 0x28

struct PartyBall partyBalls[8];

s16 smallLCDModelIDs[] =
{
    NLMODEL_common_S_LCD_0,
    NLMODEL_common_S_LCD_1,
    NLMODEL_common_S_LCD_2,
    NLMODEL_common_S_LCD_3,
    NLMODEL_common_S_LCD_4,
    NLMODEL_common_S_LCD_5,
    NLMODEL_common_S_LCD_6,
    NLMODEL_common_S_LCD_7,
    NLMODEL_common_S_LCD_8,
    NLMODEL_common_S_LCD_9,
};

s16 largeLCDModelIDs[] =
{
    NLMODEL_common_L_LCD_0,
    NLMODEL_common_L_LCD_1,
    NLMODEL_common_L_LCD_2,
    NLMODEL_common_L_LCD_3,
    NLMODEL_common_L_LCD_4,
    NLMODEL_common_L_LCD_5,
    NLMODEL_common_L_LCD_6,
    NLMODEL_common_L_LCD_7,
    NLMODEL_common_L_LCD_8,
    NLMODEL_common_L_LCD_9,
};

void func_8006C7BC(struct StageAnimGroup *arg0, int arg1)
{
    struct Stobj_ stobj;
    struct StageAnimGroup *stageAg;
    int i, j;
    int totalGoals = 0;
    struct StageGoal *goal;
    struct GoalTape *tape;
    struct PartyBall *partyBall;
    Point3d sp10;

    memset(goalTapes, 0, sizeof(goalTapes));
    memset(&stobj, 0, sizeof(stobj));

    stobj.type = SOT_GOALTAPE;

    tape = goalTapes;
    stageAg = arg0;
    totalGoals = 0;
    for (i = 0; i < arg1; i++, stageAg++)
    {
        goal = stageAg->goals;
        for (j = 0; j < stageAg->goalCount; j++, goal++, tape++)
        {
            if (totalGoals >= 8)
            {
                g_debug_set_cursor_pos(16, 16);
                g_debug_printf("Warning!!! Goal Tape Max(%d) Over!!!\n", 8);
                break;
            }
            stobj.unk58 = goal->pos;
            stobj.rotX = goal->rotX;
            stobj.rotY = goal->rotY;
            stobj.rotZ = goal->rotZ;
            stobj.animGroupId = i;
            tape->unk0 = 0;
            stobj.unkA4 = tape;
            func_8006B2C0(&stobj);
            totalGoals++;
        }
    }
    memset(partyBalls, 0, sizeof(partyBalls));
    memset(&stobj, 0, sizeof(stobj));

    if (modeCtrl.levelSetFlags & LVLSET_FLAG_MASTER)
        stobj.type = SOT_GOALBAG_EXMASTER;
    else
        stobj.type = SOT_GOALBAG;

    sp10.x = 0.0f;
    sp10.y = 2.8f;
    sp10.z = 0.0f;

    partyBall = partyBalls;
    stageAg = arg0;
    totalGoals = 0;
    for (i = 0; i < arg1; i++, stageAg++)
    {
        goal = stageAg->goals;
        for (j = 0; j < stageAg->goalCount; j++, goal++, partyBall++)
        {
            if (totalGoals >= 8)
                break;
            mathutil_mtxA_from_translate(&goal->pos);
            mathutil_mtxA_rotate_z(goal->rotZ);
            mathutil_mtxA_rotate_y(goal->rotY);
            mathutil_mtxA_rotate_x(goal->rotX);
            mathutil_mtxA_tf_point(&sp10, &stobj.unkA8);
            stobj.rotX = goal->rotX;
            stobj.rotY = goal->rotY;
            stobj.rotZ = goal->rotZ;
            stobj.animGroupId = i;
            partyBall->unk0 = 0;
            partyBall->goal = *goal;
            stobj.unkA4 = partyBall;
            func_8006B2C0(&stobj);
            totalGoals++;
        }

    }
}

struct NaomiModel *smallLCDModels[10];
struct NaomiModel *largeLCDModels[10];

// https://decomp.me/scratch/L6SNU
#ifdef NONMATCHING
void stobj_goaltape_init(struct Stobj_ *arg0)
{
    struct RaycastHit spC;
    f32 temp_f10;
    f32 temp_f11;
    int i;
    int j;
    struct GoalTape_sub *var_r7;
    struct GoalTape *temp_r31;
    struct NaomiModel **mdlPtr;
    //s16 *idxPtr;
    Point3d sp28;

    arg0->unkC = 0;
    arg0->unk8 |= 2;
    arg0->model = (struct GMAModel *)naomiCommonObj->modelPtrs[NLMODEL_common_GOAL_TAPE];
    arg0->boundSphereRadius = 1.3125f;
    arg0->g_model_origin = arg0->model->boundSphereCenter;
    temp_r31 = arg0->unkA4;
    temp_r31->unk14 = arg0;
    temp_r31->unk10 = -1;
    mathutil_mtxA_from_translate(&arg0->unk58);
    mathutil_mtxA_rotate_z(arg0->rotZ);
    mathutil_mtxA_rotate_y(arg0->rotY);
    mathutil_mtxA_rotate_x(arg0->rotX);
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
        var_r7->unk0.x = (1.75 * temp_f10) - 0.875;
        var_r7->unk0.y = temp_f11;
        var_r7->unk0.z = 0.0f;
        var_r7->unk18 = temp_f10;
        var_r7->unkC.x = 0.0f;
        var_r7->unkC.y = 0.0f;
        var_r7->unkC.z = 1.0f;
        var_r7->unk1C.x = 0.0f;
        var_r7->unk1C.y = 0.0f;
        var_r7->unk1C.z = 0.0f;
        var_r7->unk28 = 6;
        var_r7->unk2C = 0.225f;
    }
    temp_r31->unk18[0].unk28 &= 0xFFFFFFFD;
    temp_r31->unk18[0].unk28 |= 1;
    temp_r31->unk18[7].unk28 &= 0xFFFFFFFB;
    temp_r31->unk18[7].unk28 |= 1;
    temp_r31->unk8 = temp_f11;
    temp_r31->unkC = temp_f11;

    mdlPtr = smallLCDModels;
    //idxPtr = smallLCDModelIDs;
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[0]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[1]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[2]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[3]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[4]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[5]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[6]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[7]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[8]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[smallLCDModelIDs[9]];

    mdlPtr = largeLCDModels;
    //idxPtr = largeLCDModelIDs;
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[0]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[1]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[2]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[3]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[4]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[5]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[6]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[7]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[8]];
    *mdlPtr++ = naomiCommonObj->modelPtrs[largeLCDModelIDs[9]];
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

void stobj_goaltape_main(struct Stobj_ *stobj)
{
    Vec sp30;
    Vec sp24;
    Vec sp18;
    Vec spC;
    float temp_f0;
    float temp_f1;
    float temp_f1_2;
    int i;
    struct GoalTape *tape;
    struct GoalTape_sub *var_r28;
    struct GoalTape_sub *temp_r27_2;
    struct AnimGroupInfo *temp_r27;
    u32 var_r30;

    tape = stobj->unkA4;
    switch (stobj->unkC)
    {
    case 1:
    case 2:
        switch (gameMode)
        {
        case MD_GAME:
            switch (modeCtrl.gameType)
            {
            case GAMETYPE_MAIN_COMPETITION:
                stobj->unkC = 3;
                stobj->unkE = 90;
                break;
            default:
                stobj->unkC = 0;
                break;
            }
            break;
        default:
            stobj->unkC = 0;
            break;
        }
        break;
    case 3:
        stobj->unkE--;
        if (stobj->unkE < 0)
        {
            if (!(infoWork.flags & 0x20))
                stobj->unkC = 4;
            else
                stobj->unkC = 0;
        }
        break;
    case 4:
    case 5:
        stobj->unkC = 0;
        tape->unk8 = -0.25f;
        tape->unkC = stobj->g_model_origin.y;
        func_8006FD44(stobj->unkA4);
        break;
    }

    if (stobj->animGroupId == 0)
        var_r30 = 0;
    else
    {
        temp_r27 = &animGroups[stobj->animGroupId];
        var_r30 = 1;
        mathutil_mtxA_from_mtx(temp_r27->prevTransform);
        mathutil_mtxA_tf_point(&stobj->unk58, &spC);
        mathutil_mtxA_from_mtx(temp_r27->transform);
        mathutil_mtxA_tf_point(&stobj->unk58, &sp30);
        spC.x -= sp30.x;
        spC.y -= sp30.y;
        spC.z -= sp30.z;
        mathutil_mtxA_rotate_z(stobj->rotZ);
        mathutil_mtxA_rotate_y(stobj->rotY);
        mathutil_mtxA_rotate_x(stobj->rotX);
        mathutil_mtxA_rigid_inv_tf_vec(&spC, &spC);
    }
    mathutil_mtxA_from_mtx(animGroups[stobj->animGroupId].transform);
    mathutil_mtxA_translate(&stobj->unk58);
    mathutil_mtxA_rotate_z(stobj->rotZ);
    mathutil_mtxA_rotate_y(stobj->rotY);
    mathutil_mtxA_rotate_x(stobj->rotX);
    sp18.x = 0.004 * lbl_80206CF0.x;
    sp18.y = 0.004 * lbl_80206CF0.y;
    sp18.z = 0.004 * lbl_80206CF0.z;
    mathutil_mtxA_rigid_inv_tf_vec(&sp18, &sp18);

    var_r28 = tape->unk18;
    for (i = 8; i > 0; i--, var_r28++)
    {
        if (!(var_r28->unk28 & 1))
        {
            sp24.x = 0.0f;
            sp24.y = 0.0f;
            sp24.z = 0.0f;
            if (var_r28->unk28 & 2)
            {
                temp_r27_2 = var_r28 - 1;
                sp24.x += temp_r27_2->unkC.x;
                sp24.y += temp_r27_2->unkC.y;
                sp24.z += temp_r27_2->unkC.z;
                sp30.x = temp_r27_2->unk0.x - var_r28->unk0.x;
                sp30.y = temp_r27_2->unk0.y - var_r28->unk0.y;
                sp30.z = temp_r27_2->unk0.z - var_r28->unk0.z;
                temp_f1 = mathutil_vec_normalize_len(&sp30);
                temp_f0 = temp_r27_2->unk2C;
                if (temp_f1 > temp_f0)
                {
                    temp_f0 = 1.05 * (temp_f1 - temp_f0);
                    var_r28->unk1C.x += sp30.x * temp_f0;
                    var_r28->unk1C.y += sp30.y * temp_f0;
                    var_r28->unk1C.z += sp30.z * temp_f0;
                }
                else
                {
                    temp_f0 = -temp_f0;
                    var_r28->unk0.x = temp_r27_2->unk0.x + (sp30.x * temp_f0);
                    var_r28->unk0.y = temp_r27_2->unk0.y + (sp30.y * temp_f0);
                    var_r28->unk0.z = temp_r27_2->unk0.z + (sp30.z * temp_f0);
                    temp_f0 = -mathutil_vec_dot_prod_alt2(&var_r28->unk1C, &sp30);
                    var_r28->unk1C.x += sp30.x * temp_f0;
                    var_r28->unk1C.y += sp30.y * temp_f0;
                    var_r28->unk1C.z += sp30.z * temp_f0;
                }
            }
            if (var_r28->unk28 & 4)
            {
                temp_r27_2 = var_r28 + 1;
                sp24.x += temp_r27_2->unkC.x;
                sp24.y += temp_r27_2->unkC.y;
                sp24.z += temp_r27_2->unkC.z;
                sp30.x = temp_r27_2->unk0.x - var_r28->unk0.x;
                sp30.y = temp_r27_2->unk0.y - var_r28->unk0.y;
                sp30.z = temp_r27_2->unk0.z - var_r28->unk0.z;
                temp_f1_2 = mathutil_vec_normalize_len(&sp30);
                temp_f0 = var_r28->unk2C;
                if (temp_f1_2 > temp_f0)
                {
                    temp_f0 = 1.05 * (temp_f1_2 - temp_f0);
                    var_r28->unk1C.x += sp30.x * temp_f0;
                    var_r28->unk1C.y += sp30.y * temp_f0;
                    var_r28->unk1C.z += sp30.z * temp_f0;
                }
                else
                {
                    temp_f0 = -temp_f0;
                    var_r28->unk0.x = temp_r27_2->unk0.x + (sp30.x * temp_f0);
                    var_r28->unk0.y = temp_r27_2->unk0.y + (sp30.y * temp_f0);
                    var_r28->unk0.z = temp_r27_2->unk0.z + (sp30.z * temp_f0);
                    temp_f0 = -mathutil_vec_dot_prod_alt2(&var_r28->unk1C, &sp30);
                    var_r28->unk1C.x += sp30.x * temp_f0;
                    var_r28->unk1C.y += sp30.y * temp_f0;
                    var_r28->unk1C.z += sp30.z * temp_f0;
                }
            }
            var_r28->unk1C.x += sp18.x;
            var_r28->unk1C.y += sp18.y;
            var_r28->unk1C.z += sp18.z;
            mathutil_mtxA_from_rotate_y(49152.0 * (var_r28->unk1C.x + var_r28->unk1C.z));
            mathutil_mtxA_rotate_x((s16)(98304.0 * var_r28->unk1C.y));
            mathutil_mtxA_tf_vec(&var_r28->unkC, &var_r28->unkC);
            var_r28->unkC.x += 0.075 * (sp24.x - var_r28->unkC.x);
            var_r28->unkC.y += 0.075 * (sp24.y - var_r28->unkC.y);
            var_r28->unkC.z += 0.075 * (sp24.z - var_r28->unkC.z);
            mathutil_vec_normalize_len(&var_r28->unkC);
        }
    }

    if (tape->unk8 > tape->unkC)
    {
        tape->unk8 -= 0.016666668f;
        if (tape->unk8 < tape->unkC)
            tape->unk8 = tape->unkC;
    }
    else if (tape->unk8 < tape->unkC)
    {
        tape->unk8 += 0.016666668f;
        if (tape->unk8 > tape->unkC)
            tape->unk8 = tape->unkC;
    }

    tape->unk18[0].unk0.y = tape->unk8;
    tape->unk18[7].unk0.y = tape->unk8;

    var_r28 = tape->unk18;
    for (i = 8; i > 0; i--, var_r28++)
    {
        if (!(var_r28->unk28 & 1))
        {
            if (var_r30 && ((var_r28->unk28 & 6) != 6))
            {
                var_r28->unk1C.x += 0.15000000000000002 * (spC.x - var_r28->unk1C.x);
                var_r28->unk1C.y += 0.15000000000000002 * (spC.y - var_r28->unk1C.y);
                var_r28->unk1C.z += 0.15000000000000002 * (spC.z - var_r28->unk1C.z);
            }
            else
            {
                var_r28->unk1C.x *= 0.85;
                var_r28->unk1C.y *= 0.85;
                var_r28->unk1C.z *= 0.85;
            }
            var_r28->unk0.x += var_r28->unk1C.x;
            var_r28->unk0.y += var_r28->unk1C.y;
            var_r28->unk0.z += var_r28->unk1C.z;
            if (var_r28->unk0.y < tape->unk4)
            {
                var_r28->unk0.y = tape->unk4;
                var_r28->unk1C.y = 0.0f;
                var_r28->unkC.x *= 0.9;
                var_r28->unkC.y += 0.1 * (1.0 - var_r28->unkC.y);
                var_r28->unkC.z *= 0.9;
                mathutil_vec_normalize_len(&var_r28->unkC);
            }
        }
    }
}

void stobj_goaltape_draw(struct Stobj_ *stobj)
{
    int i;
    struct GoalTape_sub *var_r31;
    struct GoalTape_sub *temp_r28;
    int var_r27;
    int temp_r0;
    int temp_r5;
    Vec spC;
    int time;
    int digit;

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&stobj->unk58);
    mathutil_mtxA_rotate_z(stobj->rotZ);
    mathutil_mtxA_rotate_y(stobj->rotY);
    mathutil_mtxA_rotate_x(stobj->rotX);
    set_render_ambient(0.8f, 0.8f, 0.8f);

    var_r31 = ((struct GoalTape *)stobj->unkA4)->unk18;
    for (i = 8; i > 0; i--, var_r31++)
    {
        temp_r28 = var_r31;
        var_r27 = 1;
        while ((i > 0) && ((var_r31->unk28 & 4) != 0))
        {
            i--;
            var_r31++;
            var_r27++;
        }
        if (var_r27 > 1)
        {
            mathutil_mtxA_push();
            func_8006DDA0(temp_r28, var_r27, stobj->model, lbl_802F1B4C);
            mathutil_mtxA_pop();
            g_dupe_of_call_draw_naomi_model_1(lbl_802F1B4C);
        }
    }
    apply_curr_light_group_ambient();
    func_80030BB8(1.0f, 1.0f, 1.0f);
    temp_r5 = lbl_80250A68.unk14;
    if (spritePoolInfo.unkC[temp_r5] == 2 && (ballInfo[temp_r5].flags & 0x01000000))
        time = (100.0 * func_80049E7C(lbl_80250A68.unk0[temp_r5], lbl_80250A68.unk10)) / 60.0;
    else
    {
        temp_r0 = infoWork.timerCurr * 0x64;
        time = temp_r0 / 60;
    }
    if (time < 0)
        time = 0;

    spC.x = -0.45f;
    spC.y = 0.0f;
    spC.z = 0.0f;

    // Draw LCD display on goal

    mathutil_mtxA_push();

    digit = time % 10;
    time /= 10;
    g_call_draw_naomi_model_and_do_other_stuff(smallLCDModels[digit]);

    mathutil_mtxA_translate(&spC);

    digit = time % 10;
    time /= 10;
    g_call_draw_naomi_model_and_do_other_stuff(smallLCDModels[digit]);

    mathutil_mtxA_pop();

    spC.x = -0.6666f;

    digit = time % 10;
    time /= 10;
    g_call_draw_naomi_model_and_do_other_stuff(largeLCDModels[digit]);

    mathutil_mtxA_translate(&spC);

    digit = time % 10;
    time /= 10;
    g_call_draw_naomi_model_and_do_other_stuff(largeLCDModels[digit]);

    mathutil_mtxA_translate(&spC);

    digit = time % 10;
    time /= 10;
    g_call_draw_naomi_model_and_do_other_stuff(largeLCDModels[digit]);

    func_8000E3BC();
}

void stobj_goaltape_coli(struct Stobj_ *stobj, struct PhysicsBall *ball)
{
    Vec sp58;
    Vec sp4C;
    Vec sp40;
    Vec sp34;
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    float radius;
    float radiusSq;
    int i;
    struct GoalTape_sub *var_r29;
    u32 var_r28 = 0;

    sp1C.x = 0.0f;
    sp1C.y = 0.0f;
    sp1C.z = 0.0f;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&stobj->unk58);
    mathutil_mtxA_rotate_z(stobj->rotZ);
    mathutil_mtxA_rotate_y(stobj->rotY);
    mathutil_mtxA_rotate_x(stobj->rotX);
    mathutil_mtxA_rigid_inv_tf_point(&ball->pos, &sp58);
    radius = ball->radius;
    radiusSq = radius * radius;

    var_r29 = ((struct GoalTape *)stobj->unkA4)->unk18;
    for (i = 8; i > 0; i--, var_r29++)
    {
        if (var_r29->unk28 & 1)
            continue;
        sp4C.x = var_r29->unk0.x - sp58.x;
        if (__fabs(sp4C.x) > radius)
            continue;
        sp4C.z = var_r29->unk0.z - sp58.z;
        if (__fabs(sp4C.z) > radius)
            continue;
        sp4C.y = var_r29->unk0.y - sp58.y;
        if (__fabs(sp4C.y) > radius)
            continue;
        if (mathutil_vec_sq_len(&sp4C) > radiusSq)
            continue;
        mathutil_vec_set_len(&sp4C, &sp4C, radius);
        var_r28 = 1;
        sp34.x = sp58.x + sp4C.x;
        sp34.y = sp58.y + sp4C.y;
        sp34.z = sp58.z + sp4C.z;
        sp28.x = sp34.x - var_r29->unk0.x;
        sp28.y = sp34.y - var_r29->unk0.y;
        sp28.z = sp34.z - var_r29->unk0.z;
        var_r29->unk0.x = sp34.x;
        var_r29->unk0.y = sp34.y;
        var_r29->unk0.z = sp34.z;
        var_r29->unk1C.x += sp28.x;
        var_r29->unk1C.y += sp28.y;
        var_r29->unk1C.z += sp28.z;
        mathutil_vec_set_len(&sp4C, &sp10, -0.05 * mathutil_vec_len(&sp28));
        sp1C.x += sp10.x;
        sp1C.y += sp10.y;
        sp1C.z += sp10.z;
        sp40.x = var_r29->unkC.x;
        sp40.y = var_r29->unkC.y;
        sp40.z = var_r29->unkC.z;
        mathutil_vec_normalize_len(&sp4C);
        if (mathutil_vec_dot_prod(&sp4C, &sp40) < 0.0)
        {
            sp4C.x = -sp4C.x;
            sp4C.y = -sp4C.y;
            sp4C.z = -sp4C.z;
        }
        sp40.x += 0.125 * (sp4C.x - sp40.x);
        sp40.y += 0.125 * (sp4C.y - sp40.y);
        sp40.z += 0.125 * (sp4C.z - sp40.z);
        mathutil_vec_normalize_len(&sp40);
        var_r29->unkC.x = sp40.x;
        var_r29->unkC.y = sp40.y;
        var_r29->unkC.z = sp40.z;
    }
    if (var_r28 != 0)
    {
        mathutil_mtxA_tf_vec(&sp1C, &sp1C);
        ball->vel.x += sp1C.x;
        ball->vel.y += sp1C.y;
        ball->vel.z += sp1C.z;
    }
}

void func_8006DD98(struct Stobj_ *stobj) {}

void func_8006DD9C(struct Stobj_ *stobj) {}
