#include <math.h>
#include <stddef.h>

#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

void g_interpolate_joint_motion(struct JointBoneThing *a, const struct Struct80034F5C_3 *b, const struct Struct80034F5C_2 *c, float e, u32 d)
{
    u32 flags;
    struct JointBoneThing *r30 = a;

    if (b == NULL || c == NULL)
        d = 0;

    flags = r30->flags;
    while (flags != 0)
    {
        flags &= ~(3<<(31-0x11));
        r30->flags = flags;
        if (flags & (1 << 2))
        {
            if (d != 0)
                g_interp_pos_motion(r30, &a[c->unk2], d, e);
            else
                g_interp_pos_motion(r30, r30, d, e);
            c++;
        }
        if (flags & (1 << 3))
        {
            if (d != 0)
                g_interp_rot_motion(r30, &a[b->unk2], b, d, e);
            else
                g_interp_rot_motion(r30, r30, b, d, e);
            b++;
        }
        r30++;
        flags = r30->flags;
    }
}

void g_interp_pos_motion(struct JointBoneThing *a, struct JointBoneThing *b, u32 c, float d)
{
    struct MotionTransform *r3 = &a->transforms[0];
    int unused;

    if (r3->unk0 != 0)
    {
        b->unk1C0.x = g_interp_skelanim_value_maybe(r3, d);
        if (c != 0)
            b->unk1C0.x = -b->unk1C0.x;
    }
    else
        b->unk1C0.x = 0.0f;
    r3++;

    if (r3->unk0 != 0)
        b->unk1C0.y = g_interp_skelanim_value_maybe(r3, d);
    else
        b->unk1C0.y = 0.0f;
    r3++;

    if (r3->unk0 != 0)
        b->unk1C0.z = g_interp_skelanim_value_maybe(r3, d);
    else
        b->unk1C0.z = 0.0f;

}

void g_interp_rot_motion(struct JointBoneThing *a, struct JointBoneThing *b, const struct Struct80034F5C_3 *c, u32 d, float e)
{
    float f31;
    struct MotionTransform *sub;

    mathutil_mtxA_from_identity();
    f31 = 10430.3779296875f;

    sub = &a->transforms[5];
    if (sub->unk0 != 0)
    {
        float f1 = g_interp_skelanim_value_maybe(sub, e);
        if (d != 0)
            f1 = c->unk18 + f1 * c->unkC;
        mathutil_mtxA_rotate_z((s16)(f31 * f1));
    }

    sub--;
    if (sub->unk0 != 0)
    {
        float f1 = g_interp_skelanim_value_maybe(sub, e);
        if (d != 0)
            f1 = c->unk14 + f1 * c->unk8;
        mathutil_mtxA_rotate_y((s16)(f31 * f1));
    }

    sub--;
    if (sub->unk0 != 0)
    {
        float f1 = g_interp_skelanim_value_maybe(sub, e);
        if (d != 0)
            f1 = c->unk10 + f1 * c->unk4;
        mathutil_mtxA_rotate_x((s16)(f31 * f1));
    }

    mathutil_mtxA_sq_to_mtx(b->rotateMtx);
}

float g_interp_skelanim_value_maybe(struct MotionTransform *transform, float t)
{
    float ret;
    float dummy1;
    float dummy2;
    Vec sp2C;
    Vec sp20;
    struct MotionTransform sp10;
    u8 endSomething = transform->unk0;
    u8 r31 = transform->unk1;
    u8 type = 0;

    while (r31 < endSomething)
    {
        float f1 = *transform->unk4;

        if (__fabs(f1 - t) < FLT_EPSILON)
        {
            type = 1;
            break;
        }
        else if (f1 > t)
        {
            if (r31 != 0)
                type = 3;
            else
                type = 2;
            break;
        }
        r31++;
        g_skelanim_seek_next(transform);
    }

    switch (type)
    {
    default:
        if (transform->unk1 < endSomething)
            g_skelanim_seek_prev(transform);
        // fall through
    case 1:
    case 2:
        read_transform_values(transform, &dummy1, &dummy2, &ret);
        break;
    case 3:
        sp20.x = *transform->unk4;
        read_transform_values(transform, &sp20.z, &dummy2, &sp20.y);
        sp10.unk4 = transform->unk4;
        sp10.numComponents = transform->numComponents;
        sp10.values = transform->values;
        g_skelanim_seek_prev(&sp10);
        sp2C.x = *sp10.unk4;
        read_transform_values(&sp10, &dummy1, &sp2C.z, &sp2C.y);
        ret = g_crazy_interpolation_stuff(&sp2C, &sp20, t);
        break;
    }
    transform->unk1 = r31;
    return ret;
}

float g_crazy_interpolation_stuff(Vec *a, Vec *b, float c)
{
    float unkx, unkx2, dx, z1, f5, f0;

    z1 = a->z;
    dx = b->x - a->x;
    unkx = (c - a->x) / dx;
    unkx2 = unkx * unkx;
    dx *= (1.0 / 30.0);
    f0 = unkx2 - unkx;
    f5 = unkx * unkx2 - unkx2;
    return a->y
         + (f5 + f5 - unkx2) * (a->y - b->y)
         + dx * (f5 * (z1 + b->z) - z1 * f0);
}

void read_transform_values(struct MotionTransform *transform, float *b, float *c, float *d)
{
    switch (*transform->numComponents)
    {
    default:
    case 0:
        *b = *c = *d = 0.0f;
        break;
    case 1:
        *b = *c = 0.0f;
        *d = transform->values[0];
        break;
    case 2:
        *b = *c = transform->values[0];
        *d = transform->values[1];
        break;
    case 3:
        *b = transform->values[0];
        *c = transform->values[1];
        *d = transform->values[2];
        break;
    }
}

void g_skelanim_seek_next(struct MotionTransform *transform)
{
    transform->unk4++;
    transform->values += *transform->numComponents;
    transform->numComponents++;
}

void g_skelanim_seek_prev(struct MotionTransform *transform)
{
    transform->unk4--;
    transform->numComponents--;
    transform->values -= *transform->numComponents;
}

void func_800355B8(struct Struct8003699C_child *a)
{
    a->unk3A = func_80034F44(a->unk32);
    func_80034360(a->unk81A8, a->unk32);
}

void func_800355FC(struct Struct8003699C_child *a)
{
    struct JointBoneThing *unk;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(a->unk54);
    func_80035648(a);
    unk = a->unk81A8;
    func_80035748(unk, unk);
}
