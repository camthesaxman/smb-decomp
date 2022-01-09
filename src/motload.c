#include <math.h>
#include <stddef.h>

#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

u8 lbl_80205E00[32];

int init_ape_model_info(char *datname, char *labelname, char *sklname, char *infoname)
{
    DVDFileInfo file;
    void *compressed;
    u32 size;
    u32 totalSize;
    u32 compSize;
    u32 uncompSize;

    // Read label file
    if (!DVDOpen(labelname, &file))
        return 0;
    size = OSRoundUp32B(file.length);
    motLabel = OSAlloc(size);
    g_read_dvd_file(&file, motLabel, size, 0);
    DVDClose(&file);
    lbl_802F20AC = *motLabel;
    motLabel++;
    func_80034AA4(motLabel);
    totalSize = size;

    // dat file
    if (!DVDOpen(datname, &file))
        return 0;
    if (g_read_dvd_file(&file, lbl_80205E00, 32, 0) < 0)
        OSPanic("motload.c", 90, "cannot dvd_read");
    compSize = OSRoundUp32B(__lwbrx(lbl_80205E00, 0));
    uncompSize = OSRoundUp32B(__lwbrx(lbl_80205E00, 4));
    if ((motDat = OSAlloc(uncompSize)) == NULL)
        OSPanic("motload.c", 94, "cannot OSAlloc\n");

    compressed = OSAlloc(compSize);
    if (compressed == NULL)
        OSPanic("motload.c", 95, "cannot OSAlooc\n");
    if (g_read_dvd_file(&file, compressed, compSize, 0) < 0)
        OSPanic("motload.c", 97, "cannot dvd_read");
    if (DVDClose(&file) != 1)
        OSPanic("motload.c", 98, "cannot DVDClose");
    lzs_decompress(compressed, motDat);
    OSFree(compressed);
    func_80034938(motDat);
    totalSize = totalSize + totalSize;

    // skeleton file
    if (!DVDOpen(sklname, &file))
        return 0;
    size = OSRoundUp32B(file.length);
    motSkeleton = OSAlloc(size);
    g_read_dvd_file(&file, motSkeleton, size, 0);
    DVDClose(&file);
    func_80034B50(motSkeleton);
    totalSize += size;
    
    // info file
    if (!DVDOpen(infoname, &file))
        return 0;
    if (g_read_dvd_file(&file, lbl_80205E00, 32, 0) < 0)
        OSPanic("motload.c", 151, "cannot dvd_read");
    compSize = OSRoundUp32B(__lwbrx(lbl_80205E00, 0));
    uncompSize = OSRoundUp32B(__lwbrx(lbl_80205E00, 4));
    if ((motInfo = OSAlloc(uncompSize)) == NULL)
        OSPanic("motload.c", 155, "cannot OSAlloc\n");
        
    compressed = OSAlloc(compSize);
    if (compressed == NULL)
        OSPanic("motload.c", 156, "cannot OSAlooc\n");
    if (g_read_dvd_file(&file, compressed, compSize, 0) < 0)
        OSPanic("motload.c", 158, "cannot dvd_read");
    if (DVDClose(&file) != 1)
        OSPanic("motload.c", 159, "cannot DVDClose");
    lzs_decompress(compressed, motInfo);
    OSFree(compressed);
    func_80034D88(motInfo);
    totalSize += size;

    return totalSize;
}

void func_80034938(struct Struct80034938 *a)
{
    int i;
    struct Struct80034938 *temp = a;

    for (i = lbl_802F20AC; i >= 0; i--)
    {
        temp->unk4 = OFFSET_TO_PTR(temp->unk4, a);
        temp->unk8 = OFFSET_TO_PTR(temp->unk8, a);
        temp->unkC = OFFSET_TO_PTR(temp->unkC, a);
        temp->unk10 = OFFSET_TO_PTR(temp->unk10, a);
        temp->unk14 = OFFSET_TO_PTR(temp->unk14, a);
        temp++;
    }
}

void func_80034AA4(u32 *a)
{
    int i;
    u32 *temp = a;

    for (i = lbl_802F20AC; i >= 0; i--)
    {
        *temp += (u32)a - 4;
        temp++;
    }
}

void func_80034B50(struct Struct80034B50 *a)
{
    struct Struct80034B50_child2 *r6;
    int j;
    int k;
    struct Struct80034B50_child *r4;
    struct Struct80034B50_child_child *r4_;
    int i;

    a->unk0 = OFFSET_TO_PTR(a->unk0, a);
    a->unk8 = OFFSET_TO_PTR(a->unk8, a);
    for (i = 0, r4 = a->unk0; i < a->unk4; i++, r4++)
    {
        r4->unk0 = OFFSET_TO_PTR(r4->unk0, a);
        r4->unk4 = OFFSET_TO_PTR(r4->unk4, a);
        r4->unk8 = OFFSET_TO_PTR(r4->unk8, a);
        r4->unkC = OFFSET_TO_PTR(r4->unkC, a);
        r4->unk10 = OFFSET_TO_PTR(r4->unk10, a);
        r4->unk14 = OFFSET_TO_PTR(r4->unk14, a);
    }

    for (i = 0, r4_ = a->unk0->unk4; i < 4*7; i++, r4_++)
    {
        if (r4_->unk4 != NULL)
            r4_->unk4 = OFFSET_TO_PTR(r4_->unk4, a);
    }

    for (i = 0, r6 = a->unk8; i < a->unkC; i++, r6++)
    {
        r6->unk0 = OFFSET_TO_PTR(r6->unk0, a);
        for (j = 0; j < 3; j++)
        {
            struct Struct80034B50_child2_child *r8;

            r6->unk4[j] = OFFSET_TO_PTR(r6->unk4[j], a);
            for (k = 0, r8 = r6->unk4[j]; k < r6->unk10[j]; k++, r8++)
                r8->unk0 = OFFSET_TO_PTR(r8->unk0, a);
        }
    }
}

void func_80034D88(struct Struct80034D88 *a)
{
    struct Struct80034D88 *temp = a;
    int i;
    int j;

    for (i = 0; i < 32; i++)
    {
        for (j = 0; j < 16; j++)
            temp->unk30[j] = OFFSET_TO_PTR(temp->unk30[j], a);
        temp->unkB0 = OFFSET_TO_PTR(temp->unkB0, a);

        temp++;
    }
}

#pragma dont_inline on
u16 func_80034F44(u16 index)
{
    return motDat[index - 1].unk0;
}
#pragma dont_inline reset

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
    struct Struct80034F5C_1_sub *r3 = &a->unk54.structs[0];
    int unused;

    if (r3->unk0 != 0)
    {
        b->unk1C0.x = func_80035284(r3, d);
        if (c != 0)
            b->unk1C0.x = -b->unk1C0.x;
    }
    else
        b->unk1C0.x = 0.0f;
    r3++;

    if (r3->unk0 != 0)
        b->unk1C0.y = func_80035284(r3, d);
    else
        b->unk1C0.y = 0.0f;
    r3++;

    if (r3->unk0 != 0)
        b->unk1C0.z = func_80035284(r3, d);
    else
        b->unk1C0.z = 0.0f;

}

void func_8003513C(struct Struct80034F5C_1 *a, struct Struct80034F5C_1 *b, struct Struct80034F5C_3 *c, u32 d, float e)
{
    float f31;
    struct Struct80034F5C_1_sub *sub;

    mathutil_mtxA_from_identity();
    f31 = 10430.3779296875f;

    sub = &a->unk54.structs[5];
    if (sub->unk0 != 0)
    {
        float f1 = func_80035284(sub, e);
        if (d != 0)
            f1 = c->unk18 + f1 * c->unkC;
        mathutil_mtxA_rotate_z((s16)(f31 * f1));
    }

    sub--;
    if (sub->unk0 != 0)
    {
        float f1 = func_80035284(sub, e);
        if (d != 0)
            f1 = c->unk14 + f1 * c->unk8;
        mathutil_mtxA_rotate_y((s16)(f31 * f1));
    }

    sub--;
    if (sub->unk0 != 0)
    {
        float f1 = func_80035284(sub, e);
        if (d != 0)
            f1 = c->unk10 + f1 * c->unk4;
        mathutil_mtxA_rotate_x((s16)(f31 * f1));
    }

    mathutil_mtxA_sq_to_mtx(b->unk1D8);
}

float func_80035284(struct Struct80034F5C_1_sub *a, float b)
{
    float sp40;
    float sp3C;
    float sp38;
    Vec sp2C;
    Vec sp20;
    struct Struct80034F5C_1_sub sp10;
    u8 r28 = a->unk0;
    u8 r31 = a->unk1;
    u8 r27 = 0;

    while (r31 < r28)
    {
        float f1 = *a->unk4;

        if (fabs(f1 - b) < FLT_EPSILON)
        {
            r27 = 1;
            break;
        }
        else if (f1 > b)
        {
            if (r31 != 0)
                r27 = 3;
            else
                r27 = 2;
            break;
        }
        else
        {
            r31++;
            func_80035550(a);
        }
    }

    switch (r27)
    {
    default:
        if (a->unk1 < r28)
            func_80035584(a);
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
        func_80035584(&sp10);
        sp2C.x = *sp10.unk4;
        func_800354A8(&sp10, &sp3C, &sp2C.z, &sp2C.y);
        sp40 = func_80035438(&sp2C, &sp20, b);
        break;
    }
    a->unk1 = r31;
    return sp40;
}

#ifdef NONMATCHING  // register swaps
// https://decomp.me/scratch/IXzah
// https://decomp.me/scratch/HXuyG
float func_80035438(Vec *a, Vec *b, float c)
{
    float f7, f6, f5, f0;
    f7 = b->x - a->x;
    f5 = (c - a->x) / f7;
    f6 = f5 * f5;
    f7 *= 0.033333333333333333;
    f0 = f6 - f5;
    f5 = f5 * f6 - f6;
    return a->y
         + (f5 + f5 - f6) * (a->y - b->y)
         + f7 * (f5 * (a->z + b->z) - a->z * f0);
}
#else
asm float func_80035438(Vec *a, Vec *b, float c)
{
    nofralloc
#include "../asm/nonmatchings/func_80035438.s"
}
#pragma peephole on
#endif

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

void func_80035550(struct Struct80034F5C_1_sub *a)
{
    a->unk4++;
    a->unkC += *a->unk8;
    a->unk8++;
}

void func_80035584(struct Struct80034F5C_1_sub *a)
{
    a->unk4--;
    a->unk8--;
    a->unkC -= *a->unk8;
}

void func_800355B8(struct Struct800355B8 *a)
{
    a->unk3A = func_80034F44(a->unk32);
    func_80034360((u32)a + 0x81A8, a->unk32);
}

void func_800355FC(struct Struct800355B8 *a)
{
    u32 wtf;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(a->unk54);
    func_80035648(a);
    wtf = (u32)a + 0x81A8;
    func_80035748(wtf, wtf);
}

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

const void *const lbl_80114DC0[] =
{
    (void *)0x801147D8,
    (void *)0x801147D8,
    (void *)0x801147F4,
    (void *)0x801147F4,
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
/*
void func_80035648(struct Struct800355B8 *a)
{
    u32 flags;
    struct Struct80034F5C_1 *r31 = (void *)((u32)a + 0x81A8);
    struct Struct80034F5C_1 *r30;

    //u32 r6 = a->unk0 & (1<<(31-0x1D));
    //void *r5 = lbl_80114DE0[a->unk36];
    //void *r4 = lbl_80114DD0[a->unk36];

    func_80034F5C(r31, lbl_80114DD0[a->unk36], lbl_80114DE0[a->unk36], (float)a->unk38 + a->unk40, a->unk0 & (1<<(31-0x1D)));
    r30 = r31;
    mathutil_mtxA_from_mtx(a->unk54);
    mathutil_mtxA_rotate_y(a->unk2E);
    mathutil_mtxA_to_mtx(r31->unk168);
    //#define r30 r31
    flags = r30->unk0;
    while (flags != 0)
    {
        if (flags & (1<<(31-0x1D)))
        {
            r30->unk1CC = r30->unk1C0;
            mathutil_mtxA_from_mtx(r31->unk168);
            mathutil_mtxA_tf_point(&r30->unk1CC, &r30->unk1CC);
        }
        r30++;
        flags = r30->unk0;
    }
}
*/

/*
const float lbl_802F3310 = 0f;
const float lbl_802F3314 = 10430.3779296875f;
const double lbl_802F3318 = 1.1920928955078125e-07;
const double lbl_802F3320 = 4503599627370496;
const double lbl_802F3328 = 0.033333333333333333;
const double lbl_802F3330 = 4503599627370496;
const float lbl_802F3338 = 1f;
const float lbl_802F333C = -1f;
const float lbl_802F3374 = 0f;
const float lbl_802F3378 = 0.0010000000474974513f;
const float lbl_802F337C = 1f;
const double lbl_802F3380 = 4503599627370496;
const double lbl_802F3388 = 4503601774854144;
const float lbl_802F3390 = 0.0099999997764825821f;
const float lbl_802F3394 = 10430.3779296875f;
*/
