#include <string.h>
#include <dolphin.h>

#include "functions.h"
#include "variables.h"

#include "load.h"

struct UnkStruct3
{
    u8 filler0[8];
};

struct UnkStruct1
{
    u32 unk0;
    char *unk4;
};

struct UnkStruct2
{
    u32 unk0;
    u8 *unk4;
    //u8 *unk8;
    struct UnkStruct1 *unk8;
    u32 unkC;
    u8 filler10[0x20-0x10];
    struct UnkStruct1 unk20;
};

char *lbl_802F12E8 = "Invalid Model";
extern void *lbl_802F20CC;

extern void **lbl_802F20C8;

u8 lbl_802B4E60[0xC];
u8 lbl_802B4E6C[0x30];
u8 lbl_802B4E9C[0x30];
u8 lbl_802B4ECC[0x94];
u32 lbl_802B4E60_100[8+16];  //4F60

#define FORCE_BSS_ORDERING(var) void *force_##var(){return var;}

FORCE_BSS_ORDERING(lbl_802B4E60)
FORCE_BSS_ORDERING(lbl_802B4E6C)
FORCE_BSS_ORDERING(lbl_802B4E9C)
FORCE_BSS_ORDERING(lbl_802B4ECC)
FORCE_BSS_ORDERING(lbl_802B4E60_100)

#pragma peephole off

void func_8008D888(int a)
{
    lbl_802F20CC = OSAlloc(a * 48);
    lbl_802F20C8 = OSAlloc(a * 4);
}

struct UnkStruct4
{
    u8 filler0[0x18];
    u16 unk18;
    u8 unk1A[4];
    u8 unk1E;
    u8 filler1F[0x40-0x1F];
    u8 unk40[100];  // What type is this?
};

void func_8008D8D0(struct UnkStruct4 *a, void **b)
{
    u8 i;
    int unused1;
    int unused2;
    Mtx *pMtx = (void *)((u32)a->unk40 + a->unk18 * 32);

    if (b == 0)
    {
        b = lbl_802F20C8;
        for (i = 0; i < a->unk1E; i++)
        {
            *b = pMtx;
            mathutil_copy_mtx(pMtx, *b);
            pMtx++;
            b++;
        }
    }
    else
    {
        for (i = 0; i < a->unk1E; i++)
        {
            mathutil_copy_mtx(pMtx, *b);
            pMtx++;
            b++;
        }
    }
}

void *func_8008D9A8(char *a, u32 b)
{
    u32 *r30;
    u32 r29;
    struct File sp10;
    
    if (!file_open(a, &sp10))
        return NULL;
    r29 = file_size(&sp10);
    r30 = OSAlloc(OSRoundUp32B(r29));
    if (r30 == NULL)
        OSPanic("avdisp.c", 0x27E, "cannot OSAlloc");
    file_read(&sp10, r30, r29, 0);
    file_close(&sp10);
    if (*r30 + 0xB8BD0000 != 0x4D46)
    {
        printf("invalid model format <%s>\n", a);
        OSFree(r30);
        return NULL;
    }
    func_8008F1E8(r30, b, 0);
    return r30;
}

struct UnkStruct5
{
    u8 filler0[0x24];
    void *unk24;
};

void func_8008DA9C(struct UnkStruct5 *a)
{
    if (a->unk24 != NULL)
        OSFree(a->unk24);
    OSFree(a);
}

void *load_gma(char *a, u32 b)
{
    int i;
    struct UnkStruct2 *r29;
    struct UnkStruct1 *r27_;
    struct File sp10;
    int len = strlen(a);
    if (len >= 3 && strncmp(a + (len - 3), ".lz", 3) == 0)
    {
        void *r31;
        u32 r27;
        u32 foo;

        if (file_open(a, &sp10) == 0)
            return 0;
        if (file_read(&sp10, lbl_802B4E60_100, 32, 0) < 0)
            OSPanic("avdisp.c", 0x2AC, "cannot dvd_read");
        //lbl_8008DB84
        r27 = OSRoundUp32B(__lwbrx(&lbl_802B4E60_100[0], 0));
        foo = OSRoundUp32B(__lwbrx(&lbl_802B4E60_100[0], 4));
        r29 = OSAlloc(foo + 32);
        if (r29 == NULL)
            OSPanic("avdisp.c", 0x2B0, "cannot OSAlloc\n");
        //lbl_8008DBD0
        r31 = OSAlloc(r27);
        if (r31 == NULL)
            OSPanic("avdisp.c", 0x2B1, "cannot OSAlooc\n");
        r27_ = &r29->unk20;
        if (file_read(&sp10, r31, r27, 0) < 0)
            OSPanic("avdisp.c", 0x2B4, "cannot dvd_read");
        //lbl_8008DC30
        if (file_close(&sp10) != 1)
            OSPanic("avdisp.c", 0x2B5, "cannot DVDClose");
        //lbl_8008DC54
        func_8008D3E4(r31, r27_);
        OSFree(r31);
    }
    //lbl_8008DC70
    else
    {
        u32 r31;
        if (file_open(a, &sp10) == 0)
            return 0;
        r31 = file_size(&sp10);
        r29 = OSAlloc(OSRoundUp32B(r31) + 32);
        if (r29 == NULL)
            OSPanic("avdisp.c", 0x2BE, "cannot OSAlloc");
        //lbl_8008DCD0
        r27_ = &r29->unk20;
        file_read(&sp10, r27_, r31, 0);
        file_close(&sp10);
    }
    //lbl_8008DCF0
    r29->unk0 = r27_->unk0;
    r29->unk4 = (void *)((u32)r27_ + (u32)r27_->unk4);
    r29->unk8 = r27_ + 1;
    r29->unkC = (u32)(r29->unk8 + r27_->unk0);
    //lbl_8008DD34

    for (i = 0; i < r29->unk0; i++)
    {
        struct UnkStruct1 *r7 = &r29->unk8[i];
        u32 r3 = r7->unk0;
        if (r7->unk0 + 0x10000 == 0xFFFF)
        {
            r7->unk0 = 0;
            r7->unk4 = lbl_802F12E8;
        }
        else
        {
            r3 = (u32)r29->unk4 + r3;
            r7->unk0 = r3;
            r7->unk4 = (char *)((u32)r29->unkC + (u32)r7->unk4);
            func_8008F1E8(r3, b, 0);
        }
    }
    return r29;
}

#if 0
static inline void wait_dma(void)
{
    while (ARGetDMAStatus() != 0)
        ;
}

void func_8008DDB4(u32 a, u32 b, u32 c)
{
    u32 r31;
    u32 r30 = OSRoundUp32B(b);
    u32 i;
    struct UnkStruct1 *r27;
    struct UnkStruct2 *r29 = OSAlloc(r30 + 0x20);
    if (r29 == NULL)
        OSPanic("avdisp.c", 0x2EE, "cannot OSAlloc");
    r27 = &r29->unk20;
    DCInvalidateRange(r27, r30);
    wait_dma();
    ARStartDMA(1, (u32)r27, a, b);
    wait_dma();
    r29->unk0 = r27->unk0;
    r29->unk4 = (u8 *)r27 + r29->unk0;
    r29->unk8 = r27 + 1;
    r29->unkC = (void *)(r29->unk8 + r27->unk0);

    //r30 = 0;
    //r31 = 0;
    //while (r30 < r29->unk0)
    //#define r30 i
    for (i = 0; i < r29->unk0; i++)
    {
        struct UnkStruct1 *r7 = &r29->unk8[i];
        u32 r3 = r7->unk0;
        if (r7->unk0 + 0x10000 == 0xFFFF)
        {
            r7->unk0 = 0;
            r7->unk4 = lbl_802F12E8;
        }
        else
        {
            r3 += (u32)r29->unk4;
            r7->unk0 = r3;
            r7->unk4 += (u32)r29->unkC;
            func_8008F1E8(r3, c, 0);
        }
        //r31 += 8;
        //r30++;
    }
    /*
    //r30 = 0;
    //r31 = 0;
    //while (r30 < r29->unk0)
    //#define r30 i
    for (i = 0; i < r29->unk0; i++)
    {
        u32 *r7 = (u32 *)(r29->unk8 + i);
        u32 r3 = *r7;
        if (*r7 + 1 == 0xFFFF)
        {
            *r7 = 0;
            r7[1] = (u32)lbl_802F12E8;
        }
        else
        {
            r3 += (u32)r29->unk4;
            *r7 = r3;
            r7[1] += (u32)r29->unkC;
            func_8008F1E8(r3, c, 0);
        }
        //r31 += 8;
        //r30++;
    }
    */
    /*
    //r30 = 0;
    r31 = 0;
    //while (r30 < r29->unk0)
    //#define r30 i
    for (i = 0; i < r29->unk0; i++)
    {
        u32 *r7 = (u32 *)(r29->unk8 + r31);
        u32 r3 = *r7;
        if (r3 + 1 == 0xFFFF)
        {
            *r7 = 0;
            r7[1] = (u32)lbl_802F12E8;
        }
        else
        {
            *r7 = (u32)r29->unk4 + r3;
            r7[1] += (u32)r29->unkC;
            func_8008F1E8((u32)r29->unk4 + r3, c);
        }
        r31 += 8;
        //r30++;
    }
    */
}
#endif
