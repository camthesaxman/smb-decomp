#include <math.h>
#include <stddef.h>

#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

extern s32 lbl_802F20AC;
extern u32 *lbl_802F20B0;
u8 lbl_80205E00[32];
extern struct Struct80034938 *lbl_802F1F00;
extern void *lbl_802F20A8;
extern struct Struct80034D88 *lbl_802F20A4;

#ifndef __MWERKS__
u32 __lwbrx(void *, u32);
#endif

#ifdef NONMATCHING  // register swaps
int init_ape_model_info(char *a, char *b, char *c, char *d)
{
    DVDFileInfo sp18;
    u32 r26;  // ret 1 ->r29
    void *r27;  // buffer 1 ->r26
    u32 r25;  // size 1 OK

    u32 r28;  // ret 2 ->r25
    void *r31_;  // buffer 2 ->r26
    u32 r29;  // size 2 ->r28
    //#define r31_ r27
    //#define r29 r25

    u32 r4;
    #define r4_ r4
    //u32 r4_;

    if (!DVDOpen(b, &sp18))
        return 0;
    r26 = OSRoundUp32B(sp18.length);
    lbl_802F20B0 = OSAlloc(r26);
    g_read_dvd_file(&sp18, lbl_802F20B0, r26, 0);
    DVDClose(&sp18);
    lbl_802F20AC = *lbl_802F20B0;
    lbl_802F20B0++;
    func_80034AA4(lbl_802F20B0);

    if (!DVDOpen(a, &sp18))
        return 0;
    if (g_read_dvd_file(&sp18, lbl_80205E00, 32, 0) < 0)
        OSPanic("motload.c", 0x5A, "cannot dvd_read");
    r25 = OSRoundUp32B(__lwbrx(lbl_80205E00, 0));
    r4 = OSRoundUp32B(__lwbrx(lbl_80205E00, 4));
//    lbl_802F1F00 = OSAlloc(r4);
    if ((lbl_802F1F00 = OSAlloc(r4)) == NULL)
        OSPanic("motload.c", 0x5E, "cannot OSAlloc\n");

    r27 = OSAlloc(r25);
    if (r27 == NULL)
        OSPanic("motload.c", 0x5F, "cannot OSAlooc\n");
    if (g_read_dvd_file(&sp18, r27, r25, 0) < 0)
        OSPanic("motload.c", 0x61, "cannot dvd_read");
    if (DVDClose(&sp18) != 1)
        OSPanic("motload.c", 0x62, "cannot DVDClose");
    decompress_lz(r27, lbl_802F1F00);
    OSFree(r27);
    func_80034938(lbl_802F1F00);
    r26 = r26 + r26;

    if (!DVDOpen(c, &sp18))
        return 0;
    r28 = OSRoundUp32B(sp18.length);
    lbl_802F20A8 = OSAlloc(r28);
    g_read_dvd_file(&sp18, lbl_802F20A8, r28, 0);
    DVDClose(&sp18);
    func_80034B50(lbl_802F20A8);
    r26 += r28;

    if (!DVDOpen(d, &sp18))
        return 0;
    if (g_read_dvd_file(&sp18, lbl_80205E00, 32, 0) < 0)
        OSPanic("motload.c", 0x97, "cannot dvd_read");
    r29 = OSRoundUp32B(__lwbrx(lbl_80205E00, 0));
    r4_ = OSRoundUp32B(__lwbrx(lbl_80205E00, 4));
    if ((lbl_802F20A4 = OSAlloc(r4_)) == NULL)
        OSPanic("motload.c", 0x9B, "cannot OSAlloc\n");

    r31_ = OSAlloc(r29);
    if (r31_ == NULL)
        OSPanic("motload.c", 0x9C, "cannot OSAlooc\n");
    if (g_read_dvd_file(&sp18, r31_, r29, 0) < 0)
        OSPanic("motload.c", 0x9E, "cannot dvd_read");
    if (DVDClose(&sp18) != 1)
        OSPanic("motload.c", 0x9F, "cannot DVDClose");
    decompress_lz(r31_, lbl_802F20A4);
    OSFree(r31_);
    func_80034D88(lbl_802F20A4);
    r26 += r28;

    return r26;
    #undef r4_
}
#else
#pragma force_active on
char lbl_801B7B28[] = "motload.c";
char string_cannot_dvd_read[] = "cannot dvd_read";
char string_cannot_OSAlloc_n_2[] = "cannot OSAlloc\n";
char string_cannot_OSAlooc_n[] = "cannot OSAlooc\n";
char string_cannot_DVDClose[] = "cannot DVDClose";
#pragma force_active reset
asm int init_ape_model_info(char *a, char *b, char *c, char *d)
{
    nofralloc
#include "../asm/nonmatchings/init_ape_model_info.s"
}
#pragma peephole on
#endif

#define OFFSET_TO_PTR(base, offset) (void *)((u32)(base) + (u32)(offset))


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

u16 func_80034F44(u16 index)
{
    return lbl_802F1F00[index - 1].unk0;
}

void func_80034F5C(struct Struct80034F5C_1 *a, struct Struct80034F5C_3 *b, struct Struct80034F5C_2 *c, u32 d, float e)
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
    int i = 0;

    if (r3->unk0 != 0)
    {
        b->unk1C0[i] = func_80035284(r3, d);
        if (c != 0)
            b->unk1C0[i] = -b->unk1C0[i];
    }
    else
        b->unk1C0[i] = 0.0f;
    r3++;
    i++;

    if (r3->unk0 != 0)
        b->unk1C0[i] = func_80035284(r3, d);
    else
        b->unk1C0[i] = 0.0f;
    r3++;
    i++;

    if (r3->unk0 != 0)
        b->unk1C0[i] = func_80035284(r3, d);
    else
        b->unk1C0[i] = 0.0f;

}

void func_8003513C(struct Struct80034F5C_1 *a, struct Struct80034F5C_1 *b, struct Struct80034F5C_3 *c, u32 d, float e)
{
    float f31;
    struct Struct80034F5C_1_sub *sub;

    mathutil_mtxA_from_identity();
    f31 = 10430.3779296875f;

    sub = &a->unk84[2];
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
    float sp34;
    float sp30;
    float sp2C;
    float sp28;
    float sp24;
    float sp20;
    struct Struct80034F5C_1_sub sp10;
    u8 r28 = a->unk0;
    u8 r31 = a->unk1;
    u8 r27 = 0;

    while (r31 < r28)
    {
        float f1 = a->unk4->unk0;

        if (fabs(f1 - b) < 1.1920928955078125e-07)
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
        sp20 = a->unk4->unk0;
        func_800354A8(a, &sp28, &sp38, &sp24);
        sp10.unk4 = a->unk4;
        sp10.unk8 = a->unk8;
        sp10.unkC = a->unkC;
        func_80035584(&sp10);
        sp2C = sp10.unk4->unk0;
        func_800354A8(&sp10, &sp3C, &sp34, &sp30);
        sp40 = func_80035438(&sp2C, &sp20, b);
        break;
    }
    a->unk1 = r31;
    return sp40;
}

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
