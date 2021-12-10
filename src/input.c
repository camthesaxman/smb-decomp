#include <math.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"

struct Struct801F3C60 lbl_801F3B70[4];
struct Struct801F3C60 lbl_801F3C60[4];
u16 lbl_801F3D50[4][5];
s32 lbl_801F3D78[4];
struct Struct801F3D88 lbl_801F3D88;

FORCE_BSS_ORDER(lbl_801F3B70);
FORCE_BSS_ORDER(lbl_801F3C60);
FORCE_BSS_ORDER(lbl_801F3D50);
FORCE_BSS_ORDER(lbl_801F3D78);
FORCE_BSS_ORDER(lbl_801F3D88);

// not sure if this is in this file or not
extern s8 lbl_80181B80[8][2];

const s8 lbl_80110320[100] =
{
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x03,
	0x03, 0x03, 0x04, 0x04, 0x04, 0x05, 0x05, 0x05, 0x06, 0x06, 0x07, 0x07,
	0x07, 0x08, 0x08, 0x09, 0x09, 0x0A, 0x0A, 0x0B, 0x0B, 0x0C, 0x0C, 0x0D,
	0x0E, 0x0E, 0x0F, 0x0F, 0x10, 0x11, 0x11, 0x12, 0x13, 0x13, 0x14, 0x15,
	0x16, 0x16, 0x17, 0x18, 0x19, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1D, 0x1E,
	0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A,
	0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34, 0x36, 0x37,
	0x38, 0x39, 0x3A, 0x3C,
};

#pragma force_active on

const s8 lbl_80110320_64[8][2] =
{
	{ 0x69, 0x00 },
    { 0x69, 0x69 },
    { 0x00, 0x69 },
    { 0x97, 0x69 },
    { 0x97, 0x00 },
    { 0x97, 0x97 },
	{ 0x00, 0x97 },
    { 0x69, 0x97 },
};

const s8 lbl_80110320_74[4][8][2] =
{
    {
        { 0x50, 0x00 },
        { 0x38, 0x38 },
        { 0x00, 0x50 },
        { 0xC8, 0x38 },
        { 0xB0, 0x00 },
        { 0xC8, 0xC8 },
        { 0x00, 0xB0 },
        { 0x38, 0xC8 },
    },
    {
        { 0x50, 0x00 },
        { 0x38, 0x38 },
        { 0x00, 0x50 },
        { 0xC8, 0x38 },
        { 0xB0, 0x00 },
        { 0xC8, 0xC8 },
        { 0x00, 0xB0 },
        { 0x38, 0xC8 },
    },
    {
        { 0x50, 0x00 },
        { 0x38, 0x38 },
        { 0x00, 0x50 },
        { 0xC8, 0x38 },
        { 0xB0, 0x00 },
        { 0xC8, 0xC8 },
        { 0x00, 0xB0 },
        { 0x38, 0xC8 },
    },
    {
        { 0x50, 0x00 },
        { 0x38, 0x38 },
        { 0x00, 0x50 },
        { 0xC8, 0x38 },
        { 0xB0, 0x00 },
        { 0xC8, 0xC8 },
        { 0x00, 0xB0 },
        { 0x38, 0xC8 },
    },
};

void input_init(void)
{
    if (lbl_802F1CD2 == 0)
    {
        PADInit();
        PADSetAnalogMode(3);
        lbl_802F1CD2++;
    }
    memset(lbl_801F3B70, 0, sizeof(lbl_801F3B70));
    lbl_802F1CD0 = 0;
    lbl_802F1CD1 = 0;
}

#ifdef NONMATCHING
//https://decomp.me/scratch/OTcMi
//https://decomp.me/scratch/ay06P
static inline int test(int r8)
{
    int r5 = __abs(r8);
    if (r5 < 0)  // bruh...
        return 0;
    //lbl_80024FE4
    else
    {
        if (r5 > 99)
            r5 = 99;
        return r5;
    }
}

static inline int test2(int r0)
{
    r0 -= 16;
        if (r0 < 0)
            r0 = 0;
        else if (r0 > 0xB4)
            r0 = 0xB4;
        return r0;
}

static inline void test3(struct Struct801F3C60 *r6, PADStatus *b)
{
        r6->unk0 = *b;
        r6->unk18.button = b->button & ~r6->unkC.button;
        r6->unk24.button = r6->unkC.button & ~b->button;
}

void input_main(void)
{
    //struct Struct801F3C60 *r6;
    int i;  // r29
    //int j;  // ctr
    int r3;
    PADStatus sp10[4];  // sp + 0x10
    struct
    {
        s8 x;
        s8 y;
    } spC;

    func_80025158(sp10);
    func_800259F8(sp10);
    //i = 0;

    /*
    for (r6 = &lbl_801F3C60[0], i = 0; i < 4; i++, r6++)
    {
        r6->unkC.button = r6->unk0.button;
        r6->unk0 = sp10[i];
        r6->unk18.button = sp10[i].button & ~r6->unkC.button;
        r6->unk24.button = r6->unkC.button & ~sp10[i].button;
    }
    */
    for (i = 0; i < 4; i++)
    {
        lbl_801F3C60[i].unkC.button = lbl_801F3C60[i].unk0.button;
        test3(&lbl_801F3C60[i], &sp10[i]);
    }

    // r31 = sp10[i]
    for (i = 0; i < 4; i++)
    {
        //int l;
        //int r;
        lbl_801F3B70[i].unkC.button = lbl_801F3B70[i].unk0.button;

        //l = sp10[i].triggerLeft - 16;
        /*
        if (sp10[i].triggerLeft - 16 < 0)
            l = 0;
        else if (sp10[i].triggerLeft - 16 > 0xB4)
            l = 0xB4;
        */
        sp10[i].triggerLeft = test2(sp10[i].triggerLeft) * 0.77777779102325439f;

        //r = sp10[i].triggerRight - 16;
        /*
        if (sp10[i].triggerRight - 16 < 0)
            r = 0;
        else if (sp10[i].triggerRight - 16 > 0xB4)
            r = 0xB4;
        */
        sp10[i].triggerRight = test2(sp10[i].triggerRight) * 0.77777779102325439f;

        spC.x = sp10[i].stickX;
        spC.y = sp10[i].stickY;
        func_80025B1C(&spC, lbl_80181B80[i]);
        sp10[i].stickX = spC.x;
        sp10[i].stickY = spC.y;

        //r3 = 0;
        for (r3 = 0; r3 < 8; r3++)
        {
            int r7;
            int r8;
            int r6_;
            int r5;

            float f4;

            float f5;
            float f2;
            float f6;
            float f3;

            //lbl_80024DE8
            //s8 r4;
            //s8 r6;
            //s8 r9;
            //s8 r10;

            int r0;


            if (r3 == 7)
                r0 = 0;
            else
                r0 = r3 + 1;
            //r4 = lbl_80110320_74[i].unk0[r3][0];
            //r6 = lbl_80110320_74[i].unk0[r3][1];
            //r9 = lbl_80110320_74[i].unk0[r0][0];
            //r10 = lbl_80110320_74[i].unk0[r0][1];

            f4 = (float)lbl_80110320_74[i][r3][0] * (float)lbl_80110320_74[i][r0][1]
               - (float)lbl_80110320_74[i][r0][0] * (float)lbl_80110320_74[i][r3][1];

            f5 = lbl_80110320_74[i][r3][0];
            f2 = lbl_80110320_74[i][r3][1];
            f6 = lbl_80110320_74[i][r0][0];
            f3 = lbl_80110320_74[i][r0][1];

            if (fabs(f4) < 1.1920928955078125e-07)
                continue;

            f4 = 1.0f / f4;

            f3 = f4 * (f3 * sp10[i].substickX - f6 * sp10[i].substickY);
            f2 = f4 * (-f2 * sp10[i].substickX + f5 * sp10[i].substickY);

            if (f3 < 0.0f || f2 < 0.0f)
                continue;

            r8 = (int)(f3 * lbl_80110320_64[r3][0] + f2 * lbl_80110320_64[r0][0]);
            r7 = r8 < 0;
            r6_ = test(r8);
            //lbl_80024FF4
            if (r7)
                r5 = -1;
            else
                r5 = 1;
            //lbl_80025008
            sp10[i].substickX = r5 * lbl_80110320[r6_];

            r8 = (int)(f3 * lbl_80110320_64[r3][1] + f2 * lbl_80110320_64[r0][1]);
            r7 = r8 < 0;
            r6_ = test(r8);
            if (r7)
                r5 = -1;
            else
                r5 = 1;
            sp10[i].substickY = r5 * lbl_80110320[r6_];
            break;
        }
        //lbl_800250D0
        /*
        lbl_801F3B70[i].unk0 = sp10[i];
        lbl_801F3B70[i].unk18.button = sp10[i].button & ~lbl_801F3B70[i].unkC.button;
        lbl_801F3B70[i].unk24.button = lbl_801F3B70[i].unkC.button & ~sp10[i].button;
        */
        test3(&lbl_801F3B70[i], &sp10[i]);
    }
    func_800252E4();
    func_8002551C();
    func_80025640();
}
#else
const float lbl_802F30A8 = 0.77777779102325439f;
const double lbl_802F30B0 = 1.1920928955078125e-07;
const float lbl_802F30B8 = 1.0f;
const float lbl_802F30BC = 0.0f;
const double lbl_802F30C0 = 4503601774854144.0;
asm void input_main(void)
{
    nofralloc
#include "../asm/nonmatchings/input_main.s"
}
#pragma peephole on
#endif

void func_80025158(PADStatus *pads)
{
    u32 i;

    PADRead(pads);

    for (i = 0; i < 4; i++)
    {
        if (pads[i].err == -1)
            lbl_802F1CD4 |= 0x80000000 >> i;
    }

    if (lbl_802F1CD8 != 0)
    {
        u32 r5 = lbl_802F1CD8;

        while (r5 != 0)
        {
            if (pads[i].err != 0 && pads[i].err != -3)
                lbl_802F1CD8 &= ~(0x80000000 >> i);
            r5 &= ~(0x80000000 >> i);
            i = __cntlzw(r5);  // huh?
        }

        if (lbl_802F1CD8 != 0)
        {
            if (PADRecalibrate(lbl_802F1CD8))
                lbl_802F1CD4 = 0;
            else
                lbl_802F1CD4 |= lbl_802F1CD8;
            lbl_802F1CD8 = 0;
        }
    }

    if (lbl_802F1CD4 != 0)
    {
        if (PADReset(lbl_802F1CD4))
            lbl_802F1CD8 = lbl_802F1CD4;
        lbl_802F1CD4 = 0;
    }
}

void func_800252E4(void)
{
    int i;
    int j;
    u16 *r3 = lbl_801F3D50[0];

    for (i = 0; i < 4; i++)
    {
        int x;
        int y;
        int var1;
        struct Struct801F3C60 *r4 = &lbl_801F3B70[i];

        r3[1] = r3[0];
        r3[0] = 0;

        x = r4->unk0.stickX;
        y = r4->unk0.stickY;

        if (r3[1] & (1 << 0))
            var1 = -15;
        else
            var1 = -52;
        if (x < var1)
            r3[0] |= (1 << 0);

        if (r3[1] & (1 << 1))
            var1 = 15;
        else
            var1 = 52;
        if (x > var1)
            r3[0] |= (1 << 1);

        if (r3[1] & (1 << 2))
            var1 = -15;
        else
            var1 = -52;
        if (y < var1)
            r3[0] |= (1 << 2);

        if (r3[1] & (1 << 3))
            var1 = 15;
        else
            var1 = 52;
        if (y > var1)
            r3[0] |= (1 << 3);

        x = r4->unk0.substickX;
        y = r4->unk0.substickY;

        if (r3[1] & (1 << 4))
            var1 = -15;
        else
            var1 = -52;
        if (x < var1)
            r3[0] |= (1 << 4);

        if (r3[1] & (1 << 5))
            var1 = 15;
        else
            var1 = 52;
        if (x > var1)
            r3[0] |= (1 << 5);

        if (r3[1] & (1 << 6))
            var1 = -15;
        else
            var1 = -52;
        if (y < var1)
            r3[0] |= (1 << 6);

        if (r3[1] & (1 << 7))
            var1 = 15;
        else
            var1 = 52;
        if (y > var1)
            r3[0] |= (1 << 7);

        x = r4->unk0.triggerLeft;
        y = r4->unk0.triggerRight;

        if (r3[1] & (1 << 8))
            var1 = 40;
        else
            var1 = 80;
        if (x > var1)
            r3[0] |= (1 << 8);

        if (r3[1] & (1 << 9))
            var1 = 40;
        else
            var1 = 80;
        if (y > var1)
            r3[0] |= (1 << 9);

        r3[2] = r3[0] & ~r3[1];
        r3[3] = r3[0] & ~r3[1];

        r3 += 5;
    }
}

void func_8002551C(void)
{
    struct Struct801F3C60 *r5 = &lbl_801F3B70[0];
    u16 *r6 = lbl_801F3D50[0];
    int i;

    for (i = 0; i < 4; i++, r5++, r6 += 5)
    {
        if (r5->unk0.button == r5->unkC.button && r6[0] == r6[1])
            lbl_801F3D78[i]++;
        else
            lbl_801F3D78[i] = 0;

        if (lbl_801F3D78[i] >= 20 && (lbl_801F3D78[i] & 3) == 0)
        {
            r5->unk30.button = r5->unk0.button;
            r6[4] = r6[0];
        }
        else
        {
            r5->unk30.button = r5->unk18.button;
            r6[4] = r6[2];
        }
    }
}

//const float lbl_802F30A8 = 0.77777779102325439f;
//const double lbl_802F30B0 = 1.1920928955078125e-07;
//const float lbl_802F30B8 = 1.0f;
//const float lbl_802F30BC = 0.0f;
//const double lbl_802F30C0 = 4503601774854144.0;
const double lbl_802F30C8 = 30.0;
const double lbl_802F30D0 = 4503599627370496.0;
