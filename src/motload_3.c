#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

#pragma force_active on

const u8 lbl_801147D8[] =
{
    0x00, 0x01, 0x02, 0x03,
    0x04, 0x05, 0x0B, 0x0C,
    0x0D, 0x0E, 0x0F, 0x06,
    0x07, 0x08, 0x09, 0x0A,
    0x10, 0x11, 0x17, 0x18,
    0x19, 0x1A, 0x1B, 0x12,
    0x13, 0x14, 0x15, 0x16,
};

const u8 lbl_801147F4[] =
{
    0x00, 0x01, 0x02, 0x03,
    0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0A, 0x0B,
    0x0C, 0x0D, 0x0E, 0x0F,
    0x10, 0x00, 0x00, 0x00,
};

const struct Struct80034F5C_3 lbl_80114808[] =
{
    {   0,   0,  1.0f, -1.0f, -1.0f, 0.0f, 0.0f, 0.0f },
    {   1,   1, -1.0f, -1.0f, -1.0f, 0.0f,   PI, 0.0f },
    {   3,   3,  1.0f, -1.0f,  1.0f, 0.0f,  -PI, 0.0f },
    {   6,  11, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {   7,  12, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  10,  15, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  11,   6, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  12,   7, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  15,  10, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  16,  16, -1.0f, -1.0f, -1.0f, 0.0f,   PI, 0.0f },
    {  18,  23, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  21,  26,  1.0f, -1.0f, -1.0f, 0.0f, 0.0f, 0.0f },
    {  22,  27,  1.0f, -1.0f, -1.0f, 0.0f, 0.0f, 0.0f },
    {  23,  18, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  26,  21,  1.0f, -1.0f, -1.0f, 0.0f, 0.0f, 0.0f },
    {  27,  22,  1.0f, -1.0f, -1.0f, 0.0f, 0.0f, 0.0f },
    { 255, 255,  0.0f,  0.0f,  0.0f, 0.0f, 0.0f, 0.0f },
};

const struct Struct80034F5C_3 lbl_801149E4[] =
{
    {   0,   0,  1.0f, -1.0f, -1.0f, 0.0f, 0.0f, 0.0f },
    {   1,   1, -1.0f, -1.0f, -1.0f, 0.0f,   PI, 0.0f },
    {   3,   3,  1.0f, -1.0f,  1.0f, 0.0f,  -PI, 0.0f },
    {   6,  11, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {   7,  12, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  10,  15, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  11,   6, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  12,   7, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  15,  10, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  16,  16, -1.0f, -1.0f, -1.0f, 0.0f,   PI, 0.0f },
    {  18,  23, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  21,  26, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  22,  27, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  23,  18, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  26,  21, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    {  27,  22, -1.0f, -1.0f,  1.0f, 0.0f, 0.0f, 0.0f },
    { 255, 255,  0.0f,  0.0f,  0.0f, 0.0f, 0.0f, 0.0f },
};

const struct Struct80034F5C_3 lbl_80114BC0[] =
{
    {   1,   1, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {   2,   2, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {   3,   3, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {   4,   4, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {   5,   5, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {   6,   6, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {   7,   7, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {   8,   8, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {   9,   9, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {  10,  10, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {  11,  11, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {  12,  12, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {  14,  14, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {  15,  15, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    {  16,  16, -1.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f }, 
    { 255, 255,  0.0f,  0.0f, 0.0f, 0.0f, 0.0f, 0.0f },
};

const struct Struct80034F5C_2 lbl_80114D80[] =
{
    {   2,   2 },
    {   4,   4 },
    {   9,  14 },
    {  14,   9 },
    {  20,  25 },
    {  25,  20 },
    { 255, 255 },
};
const struct Struct80034F5C_2 lbl_80114D9C[] =
{
    {   0,   0 },
    {   2,   2 },
    {   4,   4 },
    {   9,  14 },
    {  14,   9 },
    {  20,  25 },
    {  25,  20 },
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

void func_80035648(struct Struct8003699C_child *a)
{
    u32 flags;
    struct AnimJoint *joints = a->joints;
    struct AnimJoint *r30;
    const struct Struct80034F5C_3 *r4 = lbl_80114DD0[a->unk36];
    const struct Struct80034F5C_2 *r5 = lbl_80114DE0[a->unk36];
    float t = a->unk38 + a->unk40;
    u32 r6 = a->unk0 & (1 << 2);

    u_interpolate_joint_motion(joints, r4, r5, t, r6);

    r30 = joints;
    mathutil_mtxA_from_mtx(a->unk54);
    mathutil_mtxA_rotate_y(a->unk2E);
    mathutil_mtxA_to_mtx(joints->unk168);
    flags = r30->flags;
    while (flags != 0)
    {
        if (flags & (1 << 2))
        {
            r30->unk1CC = r30->unk1C0;
            mathutil_mtxA_from_mtx(joints->unk168);
            mathutil_mtxA_tf_point(&r30->unk1CC, &r30->unk1CC);
        }
        r30++;
        flags = r30->flags;
    }
}

void u_joint_tree_calc_some_other_matrix(struct AnimJoint *, struct AnimJoint *);
void func_80035DEC(Vec *);

void u_joint_tree_calc_some_matrix(struct AnimJoint *jointArr, struct AnimJoint *joint)
{
    u32 childCount;
    u32 flags;
    u32 i;

    flags = joint->flags;
    switch (flags & 0x3F00)
    {
    default:
        mathutil_mtxA_set_translate(&joint->unk1CC);
        mathutil_mtxA_sq_from_mtx(jointArr[0].unk168);
        if (flags & 8)
            mathutil_mtxA_mult_right(joint->rotateMtx);
        mathutil_mtxA_to_mtx(joint->transformMtx);
        break;
    case 0x100:
        if ((flags & 0x80) && !(flags & 0x4000))
        {
            mathutil_mtxA_push();
            u_joint_tree_calc_some_other_matrix(jointArr, joint);
            mathutil_mtxA_pop();
        }
        if (flags & 2)
            mathutil_mtxA_translate(&joint->unk10);
        if (flags & 0x4000)
        {
            mathutil_mtxA_sq_from_mtx(joint->transformMtx);
            mathutil_mtxA_copy_translate(joint->transformMtx);
        }
        else
        {
            if (flags & 8)
                mathutil_mtxA_mult_right(joint->rotateMtx);
            mathutil_mtxA_rigid_inv_tf_point(&joint[1].unk1CC, &joint->unk1CC);
            func_80035DEC(&joint->unk1CC);
            mathutil_mtxA_to_mtx(joint->transformMtx);
        }
        break;
    case 0x200:
        if (!(flags & 0x4000))
        {
            mathutil_mtxA_push();
            u_joint_tree_calc_some_other_matrix(jointArr, joint);
            mathutil_mtxA_pop();
        }
        if (flags & 2)
            mathutil_mtxA_translate(&joint->unk10);
        mathutil_mtxA_sq_from_mtx(joint->transformMtx);
        mathutil_mtxA_copy_translate(joint->transformMtx);
        break;
    case 0x400:
        mathutil_mtxA_translate(&joint->unk10);
        if (flags & 0x4000)
        {
            mathutil_mtxA_sq_from_mtx(joint->transformMtx);
            mathutil_mtxA_copy_translate(joint->transformMtx);
        }
        else
        {
            mathutil_mtxA_rotate_z_sin_cos(joint->unk198, joint->unk19C);
            mathutil_mtxA_to_mtx(joint->transformMtx);
        }
        break;
    case 0x800:
        if ((flags & 0x80) && !(flags & 0x4000))
        {
            mathutil_mtxA_push();
            u_joint_tree_calc_some_other_matrix(jointArr, joint);
            mathutil_mtxA_pop();
        }
        mathutil_mtxA_translate(&joint->unk10);
        if (flags & 0x10)
            mathutil_mtxA_sq_from_mtx(jointArr[0].unk168);
        if (flags & 1)
            mathutil_mtxA_to_mtx(joint->transformMtx);
        mathutil_mtxA_get_translate_alt2(&joint->unk1CC);
        break;
    case 0x1000:
        if (flags & 2)
        {
            if ((flags & 0x80) && !(flags & 0x4000))
            {
                mathutil_mtxA_push();
                u_joint_tree_calc_some_other_matrix(jointArr, joint);
                mathutil_mtxA_pop();
            }
            mathutil_mtxA_translate(&joint->unk10);
        }
        if (flags & 8)
            mathutil_mtxA_mult_right(joint->rotateMtx);
        else if (flags & 0x40)
            mathutil_mtxA_mult_right(joint->unk1C);
        if (flags & 1)
            mathutil_mtxA_to_mtx(joint->transformMtx);
        break;
    case 0x2000:
        if (flags & 2)
        {
            if ((flags & 0x80) && !(flags & 0x4000))
            {
                mathutil_mtxA_push();
                u_joint_tree_calc_some_other_matrix(jointArr, joint);
                mathutil_mtxA_pop();
            }
            mathutil_mtxA_translate((Point3d *) &joint->unk10);
        }
        if (flags & 8)
            mathutil_mtxA_mult_right(joint->rotateMtx);
        if (flags & 0x40)
            mathutil_mtxA_mult_right(joint->unk1C);
        if (flags & 1)
            mathutil_mtxA_to_mtx(joint->transformMtx);
        break;
    }
    childCount = joint->childCount;
    if (childCount > 1)
    {
        for (i = 0; i < childCount; i++)
        {
            if (i == 0)
                mathutil_mtxA_push();
            else if (i == (u32)(childCount - 1))
                mathutil_mtxA_pop();
            else
                mathutil_mtxA_peek();
            u_joint_tree_calc_some_matrix(jointArr, &jointArr[joint->childIndexes[i]]);
        }
    }
    else if (childCount != 0)
        u_joint_tree_calc_some_matrix(jointArr, &jointArr[joint->childIndexes[0]]);
}

void func_80035E7C(float *, float *, float, float, float);

void u_joint_tree_calc_some_other_matrix(struct AnimJoint *jointArr, struct AnimJoint *joint)
{
    f32 temp_f31;
    u32 flags;
    struct AnimJoint *temp_r28;
    struct AnimJoint *temp_r27;
    u32 childCount;
    u32 i;

    flags = joint->flags;
    flags |= 0x4000;
    joint->flags = flags;
    switch (flags & 0x3F00)
    {
    case 0x100:
        if (flags & 2)
            mathutil_mtxA_translate(&joint->unk4);
        mathutil_mtxA_mult_right(joint->rotateMtx);
        mathutil_mtxA_rigid_inv_tf_point(&joint[1].unk1CC, &joint->unk1CC);
        func_80035DEC(&joint->unk1CC);
        mathutil_mtxA_sq_to_mtx(joint->transformMtx);
        break;
    case 0x200:
        if (flags & 2)
            mathutil_mtxA_translate(&joint->unk4);
        mathutil_mtxA_mult_right(joint->rotateMtx);
        temp_r27 = joint + 2;
        temp_r28 = joint + 1;
        mathutil_mtxA_rigid_inv_tf_point(&temp_r27->unk1CC, &joint->unk1CC);
        temp_f31 = mathutil_vec_len(&joint->unk1CC);
        func_80035E7C(&joint->unk198, &joint->unk19C, temp_r28->unk4.x, temp_f31, temp_r27->unk4.x);
        func_80035E7C(&temp_r28->unk198, &temp_r28->unk19C, temp_r28->unk4.x, temp_r27->unk4.x, temp_f31);
        if (temp_r28->flags & 0x20)
        {
            temp_r28->unk198 = -temp_r28->unk198;
            temp_r28->unk19C = -temp_r28->unk19C;
        }
        else
        {
            joint->unk198 = -joint->unk198;
            temp_r28->unk19C = -temp_r28->unk19C;
        }
        func_80035DEC(&joint->unk1CC);
        mathutil_mtxA_rotate_z_sin_cos(joint->unk198, joint->unk19C);
        mathutil_mtxA_sq_to_mtx(joint->transformMtx);
        break;
    case 0x400:
        mathutil_mtxA_translate(&joint->unk4);
        mathutil_mtxA_rotate_z_sin_cos(joint->unk198, joint->unk19C);
        mathutil_mtxA_sq_to_mtx(joint->transformMtx);
        break;
    case 0x800:
        mathutil_mtxA_translate(&joint->unk4);
        if (flags & 0x10)
            mathutil_mtxA_sq_from_mtx(jointArr[0].unk168);
        break;
    case 0x1000:
        if (flags & 2)
            mathutil_mtxA_translate(&joint->unk4);
        if (flags & 8)
            mathutil_mtxA_mult_right(joint->rotateMtx);
        else if (flags & 0x40)
            mathutil_mtxA_mult_right(joint->unk1C);
        break;
    case 0x2000:
        if (flags & 2)
            mathutil_mtxA_translate(&joint->unk4);
        if (flags & 8)
            mathutil_mtxA_mult_right(joint->rotateMtx);
        if (flags & 0x40)
            mathutil_mtxA_mult_right(joint->unk1C);
        break;
    }
    if (flags & 0x80)
    {
        childCount = joint->childCount;
        if (childCount > 1)
        {
            for (i = 0; i < childCount; i++)
            {
                if (i == 0)
                    mathutil_mtxA_push();
                else if (i == (u32)(childCount - 1))
                    mathutil_mtxA_pop();
                else
                    mathutil_mtxA_peek();
                u_joint_tree_calc_some_other_matrix(jointArr, &jointArr[joint->childIndexes[i]]);
            }
        }
        else if (childCount != 0)
            u_joint_tree_calc_some_other_matrix(jointArr, &jointArr[joint->childIndexes[0]]);
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

void u_init_something_joints_from_something(struct Struct8003699C_child_sub *arg0, struct Struct8003699C_child *arg1, s32 arg2, u16 arg3)
{
    memset(arg0, 0, sizeof(*arg0));
    arg0->unk0 = arg2;
    arg0->unk4 = arg3;
    if (arg2 & 1)
    {
        arg0->unk6 = 2;
        arg0->unk0 |= 4;
        arg0->unk34 = &arg1->joints[10];
    }
    else if (arg2 & 2)
    {
        arg0->unk6 = 3;
        arg0->unk0 &= ~4;
        arg0->unk34 = &arg1->joints[15];
    }
    u_create_joints_from_hardcoded_arrays(arg0->unk38, arg0->unk6, arg3);
}

void func_80035FDC(struct Struct8003699C_child *arg0)
{
    arg0->unk81A4 = lbl_80116634[arg0->unk32];
}

const u32 lbl_80114DF0[] =
{
    0x00000019,
    0x00000109,
    0x00000886,
    0x0000010B,
    0x00000806,
    0x00001000,
    0x0000108B,
    0x0000020B,
    0x00000403,
    0x00000806,
    0x0000100B,
    0x0000108B,
    0x0000020B,
    0x00000403,
    0x00000806,
    0x0000100B,
    0x00002049,
    0x00000882,
    0x0000020B,
    0x00000423,
    0x00000816,
    0x00001019,
    0x0000100B,
    0x0000020B,
    0x00000423,
    0x00000816,
    0x00001019,
    0x0000100B,
    0x00000000,
};

const u32 lbl_80114E64[] =
{
    0x0000001D,
    0x00000109,
    0x00000886,
    0x0000010B,
    0x00000806,
    0x00001001,
    0x0000108B,
    0x0000020B,
    0x00000403,
    0x00000806,
    0x0000100B,
    0x0000108B,
    0x0000020B,
    0x00000403,
    0x00000806,
    0x0000100B,
    0x00002049,
    0x00000882,
    0x0000020B,
    0x00000423,
    0x00000806,
    0x00001009,
    0x0000100B,
    0x0000020B,
    0x00000423,
    0x00000806,
    0x00001009,
    0x0000100B,
    0x00000000,
};

const u32 lbl_80114ED8[] =
{
    0x00000011,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x00001043,
    0x00001009,
    0x0000100B,
    0x0000100B,
    0x00000000,
};

const u32 lbl_80114F20[] =
{
    0x00000011,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x0000100B,
    0x00001043,
    0x00001009,
    0x0000100B,
    0x0000100B,
    0x00000000,
};

const u32 *const u_jointFlagLists[] =
{
    lbl_80114E64,
    lbl_80114DF0,
    lbl_80114ED8,
    lbl_80114F20,
};
