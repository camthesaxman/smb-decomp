#include <math.h>
#include <stddef.h>

#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

void func_80034F5C(struct Struct80034F5C_1 *a, struct Struct80034F5C_3 *b, struct Struct80034F5C_2 *c, float e, u32 d)
{
    u32 flags;
    struct Struct80034F5C_1 *r30 = a;

    if (b == NULL || c == NULL)
        d = 0;

    flags = r30->unk0;
    while (flags != 0)
    {
        flags &= ~(3<<(31-0x11));
        r30->unk0 = flags;
        if (flags & (1<<(31-0x1D)))
        {
            if (d != 0)
                func_80035064(r30, &a[c->unk2], d, e);
            else
                func_80035064(r30, r30, d, e);
            c++;
        }
        if (flags & (1<<(31-0x1C)))
        {
            if (d != 0)
                func_8003513C(r30, &a[b->unk2], b, d, e);
            else
                func_8003513C(r30, r30, b, d, e);
            b++;
        }
        r30++;
        flags = r30->unk0;
    }
}

void func_80035064(struct Struct80034F5C_1 *a, struct Struct80034F5C_1 *b, u32 c, float d)
{
    struct Struct80034F5C_1_sub *r3 = &a->unk54[0];
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

void func_8003513C(struct Struct80034F5C_1 *a, struct Struct80034F5C_1 *b, struct Struct80034F5C_3 *c, u32 d, float e)
{
    float f31;
    struct Struct80034F5C_1_sub *sub;

    mathutil_mtxA_from_identity();
    f31 = 10430.3779296875f;

    sub = &a->unk54[5];
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

    mathutil_mtxA_sq_to_mtx(b->unk1D8);
}

float g_interp_skelanim_value_maybe(struct Struct80034F5C_1_sub *a, float b)
{
    float sp40;
    float sp3C;
    float sp38;
    Vec sp2C;
    Vec sp20;
    struct Struct80034F5C_1_sub sp10;
    u8 r28 = a->unk0;
    u8 r31 = a->unk1;
    u8 type = 0;

    while (r31 < r28)
    {
        float f1 = *a->unk4;

        if (__fabs(f1 - b) < FLT_EPSILON)
        {
            type = 1;
            break;
        }
        else if (f1 > b)
        {
            if (r31 != 0)
                type = 3;
            else
                type = 2;
            break;
        }
        r31++;
        g_skelanim_seek_next(a);
    }

    switch (type)
    {
    default:
        if (a->unk1 < r28)
            g_skelanim_seek_prev(a);
        // fall through
    case 1:
    case 2:
        func_800354A8(a, &sp3C, &sp38, &sp40);
        break;
    case 3:
        sp20.x = *a->unk4;
        func_800354A8(a, &sp20.z, &sp38, &sp20.y);
        sp10.unk4 = a->unk4;
        sp10.unk8 = a->unk8;
        sp10.unkC = a->unkC;
        g_skelanim_seek_prev(&sp10);
        sp2C.x = *sp10.unk4;
        func_800354A8(&sp10, &sp3C, &sp2C.z, &sp2C.y);
        sp40 = func_80035438(&sp2C, &sp20, b);
        break;
    }
    a->unk1 = r31;
    return sp40;
}

float func_80035438(Vec *a, Vec *b, float c)
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

void func_800354A8(struct Struct80034F5C_1_sub *a, float *b, float *c, float *d)
{
    switch (*a->unk8)
    {
    default:
    case 0:
        *b = *c = *d = 0.0f;
        break;
    case 1:
        *b = *c = 0.0f;
        *d = a->unkC[0];
        break;
    case 2:
        *b = *c = a->unkC[0];
        *d = a->unkC[1];
        break;
    case 3:
        *b = a->unkC[0];
        *c = a->unkC[1];
        *d = a->unkC[2];
        break;
    }
}

void g_skelanim_seek_next(struct Struct80034F5C_1_sub *a)
{
    a->unk4++;
    a->unkC += *a->unk8;
    a->unk8++;
}

void g_skelanim_seek_prev(struct Struct80034F5C_1_sub *a)
{
    a->unk4--;
    a->unk8--;
    a->unkC -= *a->unk8;
}

void func_800355B8(struct Struct8003699C_child *a)
{
    a->unk3A = func_80034F44(a->unk32);
    func_80034360(a->unk81A8, a->unk32);
}

void func_800355FC(struct Struct8003699C_child *a)
{
    struct Struct80034F5C_1 *unk;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(a->unk54);
    func_80035648(a);
    unk = a->unk81A8;
    func_80035748(unk, unk);
}
