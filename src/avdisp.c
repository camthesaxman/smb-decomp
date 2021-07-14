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

struct GMA
{
    u32 numModels;
    u8 *unk4;
    //u8 *unk8;
    struct UnkStruct1 *unk8;
    u32 unkC;
    u8 filler10[0x20-0x10];
    struct UnkStruct1 unk20;
};

char *lbl_802F12E8 = "Invalid Model";

// .sbss
float lbl_802F212C;
float lbl_802F2128;
GXColor lbl_802F2124;
u32 lbl_802F2120;
u32 lbl_802F211C;
GXColor lbl_802F2118;
u32 lbl_802F2114;
GXColor lbl_802F2110;
u32 lbl_802F210C;
u32 lbl_802F2108;
u32 lbl_802F2104;
u8 lbl_802F2101;
u8 lbl_802F2100;
float lbl_802F20FC;
float lbl_802F20F8;
float lbl_802F20F4;
typedef u32 (*Func802F20F0)();
Func802F20F0 lbl_802F20F0;
u32 lbl_802F20EC;
s32 lbl_802F20E8;
float lbl_802F20E4;
u32 lbl_802F20E0;
float lbl_802F20DC;
float lbl_802F20D8;
float lbl_802F20D4;
float lbl_802F20D0;
Mtx *lbl_802F20CC;
void **lbl_802F20C8;

// .bss
Vec lbl_802B4E60;
Mtx lbl_802B4E6C;
Mtx lbl_802B4E9C;
u8 lbl_802B4ECC[0x94];
u32 lbl_802B4E60_100[8+16];  //4F60

FORCE_BSS_ORDER(lbl_802B4E60)
FORCE_BSS_ORDER(lbl_802B4E6C)
FORCE_BSS_ORDER(lbl_802B4E9C)
FORCE_BSS_ORDER(lbl_802B4ECC)
FORCE_BSS_ORDER(lbl_802B4E60_100)

extern void func_8008E5B8(float, float, float);
extern void func_8008F714(float, float, float, float);
extern void func_8008F7C8(float, float, float, float);
extern void func_8008F880(int, float, float);
extern void mathutil_set_a_mtx_translate(float, float, float);

void func_8008E574(Vec *a);
void func_8008E5C8(u8 a, u32 b, u8 c);

asm void func_8008D6BC(register u32 arg)
{
    nofralloc
    lis r5, GXWGFifo@h
    li r4, 0x61
    ori r5, r5, GXWGFifo@l
    stb r4, 0(r5)
    stw arg, 0(r5)
    blr
}

asm void func_8008D6D4(register void *arg)
{
    nofralloc
#define qr0 0
#define qr2 2
    lis r10, 0xE0000000@h
    psq_l f5, 424(r10), 0, qr2
    li r6, 0x10
    lis r9, GXWGFifo@h
    ori r9, r9, GXWGFifo@l
    lwz r5, 0(arg)
    andi. r7, r5, 8
    bne lbl_8008D710
    ps_mr f0, f5
    ps_mr f1, f5
    andi. r7, r5, 0x80
    bne lbl_8008D71C
    li r4, -1
    ps_mr f4, f5
    b lbl_8008D724
lbl_8008D710:
    psq_l f0, 8(arg), 0, qr2
    psq_l f1, 10(arg), 1, qr2
    ps_merge00 f1, f1, f5
lbl_8008D71C:
    lhz r4, 4(arg)
    psq_l f4, 6(arg), 1, qr2
lbl_8008D724:
    lis r7, lbl_802F20D0@h
    ori r7, r7, lbl_802F20D0@l
    psq_l f2, 0(r7), 0, qr0
    psq_l f3, 8(r7), 0, qr0
    ps_mul f0, f0, f2
    ps_mul f1, f1, f3
    psq_l f2, 17(arg), 1, qr2
    ps_merge10 f2, f2, f2
    psq_st f0, 152(r10), 0, qr2
    psq_st f1, 154(r10), 0, qr2
    lwz r7, 0x98(r10)
    li r8, 0x100a
    stb r6, 0(r9)
    stw r8, 0(r9)
    stw r7, 0(r9)
    ps_merge01 f4, f4, f3
    ps_mul f4, f4, f2
    sth r4, 0x98(r10)
    psq_st f4, 154(r10), 0, qr2
    lwz r7, 0x98(r10)
    li r8, 0x100c
    stb r6, 0(r9)
    stw r8, 0(r9)
    stw r7, 0(r9)
    blr
}

void func_8008F878(u32 a);
void func_8008F890(u8 a, u8 b, u8 c);

void func_8008D788(void)
{
    Vec sp8;
    lbl_802F20EC = 0;
    lbl_802F20D8 = 1.0f;
    lbl_802F20D4 = 1.0f;
    lbl_802F20D0 = 1.0f;
    lbl_802F20E4 = 1.0f;
    lbl_802F20DC = 1.0f;
    lbl_802F20E0 = 1;
    lbl_802F20F0 = NULL;
    func_80090474();
    sp8.x = 0.0f;
    sp8.y = 1.0f;
    sp8.z = 0.0f;
    func_8008E574(&sp8);
    func_8008E5B8(1.0f, 1.0f, 1.0f);
    func_8008E5C8(1, 3, 1);
    lbl_802F2108 = 0;
    mathutil_set_a_mtx_translate(0.0f, 0.0f, 1.0f);
    mathutil_get_a_mtx(lbl_802B4E9C);
    func_8008F714(1.0f, 1.0f, 1.0f, 1.0f);
    func_8008F7C8(0.0f, 0.0f, 0.0f, 0.0f);
    func_8008F878(0);
    func_8008F880(2, 0.0f, 100.0f);
    func_8008F890(0, 0, 0);
}

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
            mathutil_copy_mtx(*pMtx, *b);
            pMtx++;
            b++;
        }
    }
    else
    {
        for (i = 0; i < a->unk1E; i++)
        {
            mathutil_copy_mtx(*pMtx, *b);
            pMtx++;
            b++;
        }
    }
}

struct UnkStruct23
{
    u8 filler0[0x20];
};

struct UnkStruct22
{
    u8 filler0[4];
    u32 unk4;
    u8 filler8[0x18-0x8];
    u16 unk18;
    u16 unk1A;
    u16 unk1C;
    u8 filler1E[2];
    u32 unk20;
    struct UnkStruct23 *unk24;
};

struct UnkStruct19
{
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
    u8 fillerC[4];
};  // size = 0x10

struct UnkStruct21
{
    u8 filler0[4];
    struct UnkStruct19 *unk4;
    u32 unk8;
};

void *func_8008F1E8(struct UnkStruct22 *a, struct UnkStruct21 *b, u8 *c);

void *func_8008D9A8(char *fileName, struct UnkStruct21 *b)
{
    u32 *buffer;
    u32 size;
    struct File file;
    
    if (!file_open(fileName, &file))
        return NULL;
    size = file_size(&file);
    buffer = OSAlloc(OSRoundUp32B(size));
    if (buffer == NULL)
        OSPanic("avdisp.c", 638, "cannot OSAlloc");
    file_read(&file, buffer, size, 0);
    file_close(&file);
    if (*buffer + 0xB8BD0000 != 0x4D46)
    {
        printf("invalid model format <%s>\n", fileName);
        OSFree(buffer);
        return NULL;
    }
    func_8008F1E8((struct UnkStruct22 *)buffer, b, NULL);
    return buffer;
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

struct GMA *load_gma(char *fileName, struct UnkStruct21 *b)
{
    int i;
    struct GMA *gma;
    struct UnkStruct1 *fileData;
    struct File file;
    int len = strlen(fileName);
    if (len >= 3 && strncmp(fileName + (len - 3), ".lz", 3) == 0)
    {
        void *lzData;
        u32 r27;
        u32 foo;

        if (file_open(fileName, &file) == 0)
            return NULL;
        if (file_read(&file, lbl_802B4E60_100, 32, 0) < 0)
            OSPanic("avdisp.c", 684, "cannot dvd_read");
        r27 = OSRoundUp32B(__lwbrx(&lbl_802B4E60_100[0], 0));
        foo = OSRoundUp32B(__lwbrx(&lbl_802B4E60_100[0], 4));
        gma = OSAlloc(foo + 32);
        if (gma == NULL)
            OSPanic("avdisp.c", 688, "cannot OSAlloc\n");
        lzData = OSAlloc(r27);
        if (lzData == NULL)
            OSPanic("avdisp.c", 689, "cannot OSAlooc\n");
        fileData = &gma->unk20;
        if (file_read(&file, lzData, r27, 0) < 0)
            OSPanic("avdisp.c", 692, "cannot dvd_read");
        if (file_close(&file) != 1)
            OSPanic("avdisp.c", 693, "cannot DVDClose");
        decompress_lz(lzData, fileData);
        OSFree(lzData);
    }
    else
    {
        u32 size;
        if (file_open(fileName, &file) == 0)
            return NULL;
        size = file_size(&file);
        gma = OSAlloc(OSRoundUp32B(size) + 32);
        if (gma == NULL)
            OSPanic("avdisp.c", 702, "cannot OSAlloc");
        fileData = &gma->unk20;
        file_read(&file, fileData, size, 0);
        file_close(&file);
    }

    gma->numModels = fileData->unk0;
    gma->unk4 = (void *)((u32)fileData + (u32)fileData->unk4);
    gma->unk8 = fileData + 1;
    gma->unkC = (u32)(gma->unk8 + fileData->unk0);

    for (i = 0; i < gma->numModels; i++)
    {
        struct UnkStruct1 *r7 = &gma->unk8[i];
        u32 r3 = r7->unk0;
        if (r7->unk0 + 0x10000 == 0xFFFF)
        {
            r7->unk0 = 0;
            r7->unk4 = lbl_802F12E8;
        }
        else
        {
            r3 = (u32)gma->unk4 + r3;
            r7->unk0 = r3;
            r7->unk4 = (char *)((u32)gma->unkC + (u32)r7->unk4);
            func_8008F1E8((struct UnkStruct22 *)r3, b, NULL);
        }
    }
    return gma;
}

struct GMA *func_8008DDB4(u32 a, u32 b, struct UnkStruct21 *c)
{
    u32 r31;
    u32 r30 = OSRoundUp32B(b);
    int i;
    struct UnkStruct1 *r27;
    struct GMA *gma = OSAlloc(r30 + 0x20);
    if (gma == NULL)
        OSPanic("avdisp.c", 750, "cannot OSAlloc");
    r27 = &gma->unk20;
    DCInvalidateRange(r27, r30);
    while (ARGetDMAStatus() != 0)
        ;
    ARStartDMA(1, (u32)r27, a, b);
    while (ARGetDMAStatus() != 0)
        ;

    gma->numModels = r27->unk0;
    gma->unk4 = (void *)((u32)r27 + (u32)r27->unk4);
    gma->unk8 = r27 + 1;
    gma->unkC = (u32)(gma->unk8 + r27->unk0);

    for (i = 0; i < gma->numModels; i++)
    {
        struct UnkStruct1 *r7 = &gma->unk8[i];
        u32 r3 = r7->unk0;
        if (r7->unk0 + 0x10000 == 0xFFFF)
        {
            r7->unk0 = 0;
            r7->unk4 = lbl_802F12E8;
        }
        else
        {
            r3 = (u32)gma->unk4 + r3;
            r7->unk0 = r3;
            r7->unk4 = (char *)((u32)gma->unkC + (u32)r7->unk4);
            func_8008F1E8((struct UnkStruct22 *)r3, c, NULL);
        }
    }
    return gma;
}

struct UnkStruct6
{
    u8 unk0[0x24];
    void *unk24;
};

void free_gma(struct GMA *gma)
{
    int i;
    
    for (i = 0; i < (s32)gma->numModels; i++)
    {
        struct UnkStruct6 *r3 = (struct UnkStruct6 *)gma->unk8[i].unk0;
        if (r3 != NULL && r3->unk24 != NULL)
            OSFree(r3->unk24);
    }
    OSFree(gma);
}

struct TPLTextureHeader  // r27
{
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
    u8 fillerC[4];
};  // size = 0x10

struct TPL
{
    u32 numTextures;
    struct TPLTextureHeader *texHeaders;
    u8 *fileData;
};

struct TPL *load_tpl(char *fileName)
{
    void *r30;
    struct TPL *tpl;
    u32 *fileData;
    struct File file;
    int len = strlen(fileName);
    if (len >= 3 && strncmp(fileName + (len - 3), ".lz", 3) == 0)
    {
        u32 r28;
        u32 foo;

        if (file_open(fileName, &file) == 0)
            return NULL;
        if (file_read(&file, lbl_802B4E60_100, 32, 0) < 0)
            OSPanic("avdisp.c", 822, "cannot dvd_read");
        r28 = OSRoundUp32B(__lwbrx(&lbl_802B4E60_100[0], 0));
        foo = OSRoundUp32B(__lwbrx(&lbl_802B4E60_100[0], 4));
        tpl = OSAlloc(foo + 12);
        if (tpl == NULL)
            OSPanic("avdisp.c", 826, "cannot OSAlloc\n");
        r30 = OSAlloc(r28);
        if (r30 == NULL)
            OSPanic("avdisp.c", 827, "cannot OSAlooc\n");
        fileData = (void *)OSRoundUp32B((u32)tpl + 12);
        if (file_read(&file, r30, r28, 0) < 0)
            OSPanic("avdisp.c", 830, "cannot dvd_read");
        if (file_close(&file) != 1)
            OSPanic("avdisp.c", 831, "cannot DVDClose");
        decompress_lz(r30, fileData);
        OSFree(r30);
    }
    else
    {
        u32 size;
        if (file_open(fileName, &file) == 0)
            return NULL;
        size = file_size(&file);
        tpl = OSAlloc(OSRoundUp32B(size) + 32);
        if (tpl == NULL)
            OSPanic("avdisp.c", 840, "cannot OSAlloc");
        fileData = (void *)OSRoundUp32B((u32)tpl + 12);
        file_read(&file, fileData, size, 0);
        file_close(&file);
    }
    tpl->numTextures = *fileData;
    tpl->texHeaders = (struct TPLTextureHeader *)(fileData + 1);
    tpl->fileData = (void *)fileData;
    return tpl;
}

struct TPL *func_8008E200(u32 a, u32 b)
{
    u32 r31;
    struct TPL *tpl;
    u32 *r29;

    r31 = OSRoundUp32B(b);
    tpl = OSAlloc(r31 + 32);
    if (tpl == NULL)
        OSPanic("avdisp.c", 865, "cannot OSAlloc");
    r29 = (void *)OSRoundUp32B((u32)tpl + 12);
    DCInvalidateRange(r29, r31);
    while (ARGetDMAStatus() != 0)
        ;
    ARStartDMA(1, (u32)r29, a, b);
    while (ARGetDMAStatus() != 0)
        ;
    tpl->numTextures = *r29;
    tpl->texHeaders = (struct TPLTextureHeader *)(r29 + 1);
    tpl->fileData = (void *)r29;
    return tpl;
}


int func_8008EF9C(int a, int b);

GXTexObj *func_8008E2D0(struct TPL *tpl)
{
    int i;
    struct TPLTextureHeader *thdrs = tpl->texHeaders;
    GXTexObj *tobjs = OSAlloc(tpl->numTextures * sizeof(GXTexObj));
    
    for (i = 0; i < tpl->numTextures; i++)
    {
        u8 r25;
        void *r24 = tpl->fileData + thdrs[i].unk4;
        if (thdrs[i].unk8 != thdrs[i].unkA)
            r25 = 0;
        else
            r25 = func_8008EF9C(thdrs[i].unk8, thdrs[i].unkA);
        GXInitTexObj(&tobjs[i], (void *)r24, thdrs[i].unk8, thdrs[i].unkA, thdrs[i].unk0 & 0x1F, 1, 1, 0);
        GXInitTexObjLOD(
            &tobjs[i],
            (r25 != 0) ? 5 : 3,
            1,
            0.0f,
            r25,
            0.0f,
            0,
            1,
            0);
    }
    return tobjs;
}

void free_tpl(struct TPL *tpl)
{
    OSFree(tpl);
}

void func_8008E420(float a)
{
    lbl_802F20E4 = a;
}

void func_8008E428(float a, float b, float c)
{
    lbl_802F20D0 = a;
    lbl_802F20D4 = b;
    lbl_802F20D8 = c;
}

struct UnkStruct10
{
    u8 filler0[4];
    u32 unk4;
    u8 unk8[0x14-0x8];
    float unk14;
    u8 filler18[0x1A-0x18];
    u16 unk1A;
    u16 unk1C;
    u8 unk1E;
    u32 unk20;
    u32 unk24;
    u8 unk28[10];
};

void func_8008E7AC(struct UnkStruct10 *a);
void func_8008EA64(struct UnkStruct10 *a);
void func_8008EB94(struct UnkStruct10 *a);

void func_8008E438(struct UnkStruct10 *a)
{
    if (func_80020FD0(a->unk8, a->unk14, lbl_802F20E4) == 0)
    {
        lbl_802F20E4 = 1.0f;
        GXSetCurrentMtx(0);
        lbl_802F20DC = 1.0f;
    }
    else
        func_8008E7AC(a);
}

void func_8008E49C(struct UnkStruct10 *a)
{
    if (func_80020FD0(a->unk8, a->unk14, lbl_802F20E4) == 0)
    {
        lbl_802F20E4 = 1.0f;
        GXSetCurrentMtx(0);
        lbl_802F20DC = 1.0f;
    }
    else
        func_8008EA64(a);
}

void func_8008E500(struct UnkStruct10 *a)
{
    if (func_80020FD0(a->unk8, a->unk14, lbl_802F20E4) == 0)
    {
        lbl_802F20E4 = 1.0f;
        GXSetCurrentMtx(0);
        lbl_802F20DC = 1.0f;
    }
    else
        func_8008EB94(a);
}

void func_8008E564(float a)
{
    lbl_802F20DC = a;
}

void func_8008E56C(u32 a)
{
    lbl_802F20E0 = a;
}

void func_8008E574(Vec *a)
{
    lbl_802B4E60 = *a;
    mathutil_vec_normalize_clamp(&lbl_802B4E60);
}

void func_8008E5B8(float a, float b, float c)
{
    lbl_802F20F4 = a;
    lbl_802F20F8 = b;
    lbl_802F20FC = c;
}

void func_8008E5C8(u8 a, u32 b, u8 c)
{
    lbl_802F2100 = a;
    lbl_802F2104 = b;
    lbl_802F2101 = c;
}

u32 func_8008E5D8(u32 a)
{
    u32 temp = lbl_802F20EC;
    lbl_802F20EC = a;
    return temp;
}

Func802F20F0 func_8008E5E8(Func802F20F0 a)
{
    Func802F20F0 temp = lbl_802F20F0;
    lbl_802F20F0 = a;
    return temp;
}

struct UnkStruct11
{
    u8 filler0[4];
    u32 unk4;
    u8 filler8[0x20-0x8];
    u32 unk20;
};

struct UnkStruct12
{
    u8 filler0[8];
    u32 unk8;
};

void *func_8008E5F8(struct UnkStruct11 *a)
{
    struct UnkStruct12 *r3 = (struct UnkStruct12 *)((u8 *)a + a->unk20);
    if (a->unk4 & 0x18)
        return (u8 *)r3 + r3->unk8;
    else
    {
        printf("non effective model.\n");
        return 0;
    }
}

void *func_8008E64C(struct UnkStruct11 *a)
{
    if (a->unk4 & 0x18)
        return (u8 *)a + a->unk20;
    else
    {
        printf("non effective model.\n");
        return 0;
    }
}

struct UnkStruct13
{
    u8 filler0[4];
    u32 unk4;
    u8 filler8[0x1A-8];
    u16 unk1A;
    u16 unk1C;
    u32 unk20;
};

struct UnkStruct14
{
    u32 unk0;
    u8 filler4[0x60-4];
};

struct UnkStruct15
{
    u32 unk0;
    u8 filler4[0x13-4];
    u8 unk13;
    u8 filler14[0x28-0x14];
    u32 unk28[2];
    u8 filler30[0x60-0x30];
    // maybe another struct?
    u8 unk60[1];
};

struct UnkStruct16
{
    u8 filler0[8];
    u32 unk8;
    u32 unkC;
};

#ifdef NONMATCHING
void func_8008E698(struct UnkStruct13 *a, u32 b)
{
    //u32 i;
    u32 r5 = ((u32)a + a->unk20);
    if (a->unk4 & 0x18)
    {
        u32 i;
        struct UnkStruct14 *r6 = (struct UnkStruct14 *)(r5 + 32);
        for (i = 0; i < a->unk1A + a->unk1C; i++)
            r6[i].unk0 |= b;
    }
    //lbl_8008E6F0
    else
    {
        u32 r8;
        s32 j; // r7
        u32 i;
        struct UnkStruct15 *r11 = (struct UnkStruct15 *)r5;
        for (i = 0; i < a->unk1A + a->unk1C; i++)
        {
            //lbl_8008E704
            r11->unk0 |= b;
            r8 = (u32)r11->unk60;
            //r11->unk0 |= b;
            for (j = 0; j < 2; j++)
            {
                if (r11->unk13 & (1 << j))
                    r8 += r11->unk28[j];
            }
            //lbl_8008E764
            if (r11->unk13 & 0xC)
            {
                u32 *r6 = (u32 *)r8;
                r8 += 32;
                r8 += r6[2];
                r8 += r6[3];
                /*
                struct UnkStruct16 *r6 = (void *)r8;
                r8 += 32;
                r8 += r6->unk8;
                r8 += r6->unkC;
                */
            }
            //lbl_8008E78C
            r11 = (struct UnkStruct15 *)r8;
        }
    }
    //lbl_8008E7A8
}
#else
asm void func_8008E698(struct UnkStruct13 *a, u32 b)
{
    nofralloc
/* 8008E698 0008A5B8  80 03 00 04 */	lwz r0, 4(r3)
/* 8008E69C 0008A5BC  80 A3 00 20 */	lwz r5, 0x20(r3)
/* 8008E6A0 0008A5C0  54 00 06 F8 */	rlwinm r0, r0, 0, 0x1b, 0x1c
/* 8008E6A4 0008A5C4  28 00 00 00 */	cmplwi r0, 0
/* 8008E6A8 0008A5C8  7C A3 2A 14 */	add r5, r3, r5
/* 8008E6AC 0008A5CC  41 82 00 44 */	beq lbl_8008E6F0
/* 8008E6B0 0008A5D0  38 C5 00 20 */	addi r6, r5, 0x20
/* 8008E6B4 0008A5D4  38 E0 00 00 */	li r7, 0
/* 8008E6B8 0008A5D8  48 00 00 04 */	b lbl_8008E6BC
lbl_8008E6BC:
/* 8008E6BC 0008A5DC  48 00 00 04 */	b lbl_8008E6C0
lbl_8008E6C0:
/* 8008E6C0 0008A5E0  48 00 00 18 */	b lbl_8008E6D8
lbl_8008E6C4:
/* 8008E6C4 0008A5E4  80 06 00 00 */	lwz r0, 0(r6)
/* 8008E6C8 0008A5E8  38 E7 00 01 */	addi r7, r7, 1
/* 8008E6CC 0008A5EC  7C 00 23 78 */	or r0, r0, r4
/* 8008E6D0 0008A5F0  90 06 00 00 */	stw r0, 0(r6)
/* 8008E6D4 0008A5F4  38 C6 00 60 */	addi r6, r6, 0x60
lbl_8008E6D8:
/* 8008E6D8 0008A5F8  A0 A3 00 1A */	lhz r5, 0x1a(r3)
/* 8008E6DC 0008A5FC  A0 03 00 1C */	lhz r0, 0x1c(r3)
/* 8008E6E0 0008A600  7C 05 02 14 */	add r0, r5, r0
/* 8008E6E4 0008A604  7C 07 00 40 */	cmplw r7, r0
/* 8008E6E8 0008A608  41 80 FF DC */	blt lbl_8008E6C4
/* 8008E6EC 0008A60C  48 00 00 BC */	b lbl_8008E7A8
lbl_8008E6F0:
/* 8008E6F0 0008A610  7C AB 2B 78 */	mr r11, r5
/* 8008E6F4 0008A614  39 40 00 00 */	li r10, 0
/* 8008E6F8 0008A618  48 00 00 04 */	b lbl_8008E6FC
lbl_8008E6FC:
/* 8008E6FC 0008A61C  48 00 00 04 */	b lbl_8008E700
lbl_8008E700:
/* 8008E700 0008A620  48 00 00 94 */	b lbl_8008E794
lbl_8008E704:
/* 8008E704 0008A624  80 0B 00 00 */	lwz r0, 0(r11)
/* 8008E708 0008A628  39 0B 00 60 */	addi r8, r11, 0x60
/* 8008E70C 0008A62C  38 E0 00 00 */	li r7, 0
/* 8008E710 0008A630  7C 00 23 78 */	or r0, r0, r4
/* 8008E714 0008A634  90 0B 00 00 */	stw r0, 0(r11)
/* 8008E718 0008A638  48 00 00 04 */	b lbl_8008E71C
lbl_8008E71C:
/* 8008E71C 0008A63C  38 A0 00 01 */	li r5, 1
/* 8008E720 0008A640  48 00 00 04 */	b lbl_8008E724
lbl_8008E724:
/* 8008E724 0008A644  88 CB 00 13 */	lbz r6, 0x13(r11)
/* 8008E728 0008A648  7C A0 38 30 */	slw r0, r5, r7
/* 8008E72C 0008A64C  7C C0 00 38 */	and r0, r6, r0
/* 8008E730 0008A650  2C 00 00 00 */	cmpwi r0, 0
/* 8008E734 0008A654  41 82 00 0C */	beq lbl_8008E740
/* 8008E738 0008A658  80 0B 00 28 */	lwz r0, 0x28(r11)
/* 8008E73C 0008A65C  7D 08 02 14 */	add r8, r8, r0
lbl_8008E740:
/* 8008E740 0008A660  39 2B 00 04 */	addi r9, r11, 4
/* 8008E744 0008A664  38 E0 00 01 */	li r7, 1
/* 8008E748 0008A668  88 CB 00 13 */	lbz r6, 0x13(r11)
/* 8008E74C 0008A66C  7C A0 38 30 */	slw r0, r5, r7
/* 8008E750 0008A670  7C C0 00 38 */	and r0, r6, r0
/* 8008E754 0008A674  2C 00 00 00 */	cmpwi r0, 0
/* 8008E758 0008A678  41 82 00 0C */	beq lbl_8008E764
/* 8008E75C 0008A67C  80 09 00 28 */	lwz r0, 0x28(r9)
/* 8008E760 0008A680  7D 08 02 14 */	add r8, r8, r0
lbl_8008E764:
/* 8008E764 0008A684  88 0B 00 13 */	lbz r0, 0x13(r11)
/* 8008E768 0008A688  54 00 07 3A */	rlwinm r0, r0, 0, 0x1c, 0x1d
/* 8008E76C 0008A68C  2C 00 00 00 */	cmpwi r0, 0
/* 8008E770 0008A690  41 82 00 1C */	beq lbl_8008E78C
/* 8008E774 0008A694  7D 06 43 78 */	mr r6, r8
/* 8008E778 0008A698  80 A6 00 08 */	lwz r5, 8(r6)
/* 8008E77C 0008A69C  39 08 00 20 */	addi r8, r8, 0x20
/* 8008E780 0008A6A0  80 06 00 0C */	lwz r0, 0xc(r6)
/* 8008E784 0008A6A4  7D 08 2A 14 */	add r8, r8, r5
/* 8008E788 0008A6A8  7D 08 02 14 */	add r8, r8, r0
lbl_8008E78C:
/* 8008E78C 0008A6AC  7D 0B 43 78 */	mr r11, r8
/* 8008E790 0008A6B0  39 4A 00 01 */	addi r10, r10, 1
lbl_8008E794:
/* 8008E794 0008A6B4  A0 A3 00 1A */	lhz r5, 0x1a(r3)
/* 8008E798 0008A6B8  A0 03 00 1C */	lhz r0, 0x1c(r3)
/* 8008E79C 0008A6BC  7C 05 02 14 */	add r0, r5, r0
/* 8008E7A0 0008A6C0  7C 0A 00 40 */	cmplw r10, r0
/* 8008E7A4 0008A6C4  41 80 FF 60 */	blt lbl_8008E704
lbl_8008E7A8:
/* 8008E7A8 0008A6C8  4E 80 00 20 */	blr
}
#endif

struct UnkStruct18
{
    u32 unk0;
    u8 filler4[0x13-0x4];
    u8 unk13;
    u8 unk14;
    u8 filler15[0x1C-0x15];
    u32 unk1C;
    u8 unk20[8];
    u32 unk28[2];  // display list sizes
    u8 unk30[0x60-0x30];
    u8 unk60[1];
};

struct UnkStruct17
{
    u8 filler0[4];
    void (*unk4)(struct UnkStruct17 *);
    void *unk8;
    Mtx unkC;
    void *unk3C;
    struct UnkStruct18 *unk40;
    u32 unk44;
    u32 unk48;
    float unk4C;
    u32 unk50;
    Func802F20F0 unk54;
    u8 unk58;
    u8 unk59;
    u32 unk5C;
    u8 unk60;
    u8 unk61;
    u8 unk62;
    Mtx *unk64;
    GXColor unk68;
    GXColor unk6C;
    u32 unk70;
};

void lbl_8008F528(struct UnkStruct17 *a);

void *func_8008E9E0(struct UnkStruct18 *a);
void func_8008F498(struct UnkStruct10 *a);

static inline void *func_8008E7AC_inline(struct UnkStruct10 *a, struct UnkStruct18 *r26, void *r25)
{
    u32 r28;
    u32 r23 = lbl_802F20E8;
    struct UnkStruct17 *r29 = (void *)func_80085B88(0x74);
    //lbl_8008E884
    if (r26->unk14 != 0xFF)
        r28 = func_800857A4(r26->unk30, -1);
    else
        r28 = func_80085698(r26->unk30);
    //lbl_8008E8C0
    r29->unk4 = lbl_8008F528;
    r29->unk8 = a;
    r29->unk40 = r26;
    r29->unk3C = r25;
    r29->unk44 = r23;
    r29->unk48 = func_800223D0();
    r29->unk4C = lbl_802F20DC;
    r29->unk50 = lbl_802F20EC;
    r29->unk54 = lbl_802F20F0;
    r29->unk58 = lbl_802F2100;
    r29->unk59 = lbl_802F2101;
    r29->unk5C = lbl_802F2104;
    r29->unk60 = lbl_802F2108;
    r29->unk61 = lbl_802F210C;
    r29->unk62 = lbl_802F2114;
    if (r29->unk60 != 0)
    {
        r29->unk64 = (void *)func_80085B88(0x30);
        mathutil_copy_mtx(lbl_802B4E6C, *r29->unk64);
    }
    if (r29->unk61 != 0)
        r29->unk68 = lbl_802F2110;
    if (r29->unk62 != 0)
        r29->unk6C = lbl_802F2118;
    r29->unk70 = lbl_802F211C;
    mathutil_get_a_mtx(r29->unkC);
    func_80085B78(r28, r29);
    return (void *)func_8008E9E0(r26);
}

u32 func_8008F914(struct UnkStruct10 *a, struct UnkStruct18 *b, void *c);

void func_8008E7AC(struct UnkStruct10 *a)
{
    struct UnkStruct18 *r26 = (struct UnkStruct18 *)((u32)a + a->unk20);
    void *r25 = (void *)((u32)a + 0x40);
     int i;  // r23

    lbl_802F20E8 = 2;
    func_8009E094(lbl_802F20E8);
    if (a->unk4 & 4)
        func_8008F498(a);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(a, r26);
    //lbl_8008E80C
    if (a->unk4 & 0x18)
        func_8008FD90(a, r26, r25);
    else
    {
    
        for (i = 0; i < a->unk1A; i++)
            r26 = (void *)func_8008F914(a, r26, r25);
        for (i = 0; i < a->unk1C; i++)
            r26 = func_8008E7AC_inline(a, r26, r25);
    }
    //lbl_8008E9B4
    lbl_802F20E4 = 1.0f;
    GXSetCurrentMtx(0);
    lbl_802F20DC = 1.0f;
}

void *func_8008E9E0(struct UnkStruct18 *a)
{
    u8 *r7 = a->unk60;
    int i;
    for (i = 0; i < 2; i++)
    {
        if (a->unk13 & (1 << i))
            r7 += a->unk28[i];
    }
    if (a->unk13 & 0xC)
    {
        u32 *r4 = (u32 *)r7;
        r7 += 32;
        r7 += r4[2];
        r7 += r4[3];
    }
    return (void *)r7;
}

void func_8008EA64(struct UnkStruct10 *a)
{
    int i;
    u32 r30 = (u32)a + a->unk20;
    u32 r29 = (u32)a + 0x40;
    lbl_802F20E8 = 2;
    func_8009E094(lbl_802F20E8);
    if (a->unk4 & 0x4)
        func_8008F498(a);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(a, r30);
    if (a->unk4 & 0x18)
        func_8008FD90(a, r30, r29);
    else
    {
        for (i = 0; i < a->unk1A; i++)
            r30 = func_8008F914(a, (void *)r30, (void *)r29);
        for (i = 0; i < a->unk1C; i++)
            r30 = func_8008F914(a, (void *)r30, (void *)r29);
    }
    lbl_802F20E4 = 1.0f;
    GXSetCurrentMtx(0);
    lbl_802F20DC = 1.0f;
}

void func_8008EB94(struct UnkStruct10 *a)
{
    struct UnkStruct18 *r24 = (struct UnkStruct18 *)((u32)a + a->unk20);
    u32 r31 = (u32)a + 0x40;
    int i; // r25
    lbl_802F20E8 = 2;
    func_8009E094(lbl_802F20E8);
    if (a->unk4 & 0x4)
        func_8008F498(a);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(a, r24);
    for (i = 0; i < a->unk1A; i++)
        r24 = (void *)func_8008E7AC_inline(a, r24, (void *)r31);
    //lbl_8008ED4C
    for (i = 0; i < a->unk1C; i++)
        r24 = (void *)func_8008E7AC_inline(a, r24, (void *)r31);
    lbl_802F20E4 = 1.0f;
    GXSetCurrentMtx(0);
    lbl_802F20DC = 1.0f;
}

void func_8008EEC0(struct UnkStruct10 *a)
{
    struct UnkStruct18 *r31 = (struct UnkStruct18 *)((u32)a + a->unk20);
    u32 r30 = (u32)a + 0x40;
    int i;
    lbl_802F20E8 = 2;
    if (a->unk4 & 0x4)
        func_8008F498(a);
    if (a->unk4 & 0x18)
        func_8008FD90(a, r31, r30);
    else
    {
        for (i = 0; i < a->unk1A; i++)
            r31 = (void *)func_8008F914(a, r31, (void *)r30);
    }
    lbl_802F20E4 = 1.0f;
    GXSetCurrentMtx(0);
    lbl_802F20DC = 1.0f;
}

int func_8008EF9C(int a, int b)
{
    int r4;
    if (a > b)
        a = b;
    r4 = 0;
    while (a > 16)
    {
        a >>= 1;
        r4++;
    }
    return r4;
}

struct UnkStruct20
{
    u32 unk0;
    u16 unk4;
    s8 unk6;
    u8 unk7;
    GXTexObj *unk8;
    u8 fillerC[0x20-0xC];
};

/*
struct UnkStruct20
{
    u32 unk0;
    u16 unk4;
    s8 unk6;
    u8 unk7;
    GXTexObj *unk8;
    u8 fillerC[0x12-0xC];
    u8 unk12;
    u8 filler13[0x1C-0x13];
    u32 unk1C;
};  // size = 0x20
*/

void func_8008EFD0(struct UnkStruct20 *a, struct UnkStruct19 *b, struct UnkStruct21 *c)
{
    u8 r31;
    int r8;
    int r9;
    u32 r7 = c->unk8 + b->unk4;
    int r4;
    int r5;

    if (b->unk0 & 0x40)
    {
        OSPanic("avdisp.c", 1340, "invalid texture!!\n...stopped\n");
        a->unk8 = 0;
        return;
    }

    switch ((a->unk0 >> 2) & 3)
    {
    case 2:
        r8 = 2;
        break;
    case 1:
        r8 = 1;
        break;
    default:
        r8 = 0;
        break;
    }
    switch ((a->unk0 >> 4) & 3)
    {
    case 2:
        r9 = 2;
        break;
    case 1:
        r9 = 1;
        break;
    default:
        r9 = 0;
        break;
    }
    if (b->unk8 != b->unkA)
        r31 = 0;
    else
    {
        r31 = (a->unk0 >> 7) & 0xF;
        if (r31 == 15)
            r31 = func_8008EF9C(b->unk8, b->unkA);  // inlined
    }
    GXInitTexObj(
        a->unk8,
        (void *)r7,
        b->unk8,
        b->unkA,
        b->unk0 & 0x1F,
        r8,
        r9,
        r31 != 0);

    if (a->unk0 & 0x800)
    {
        r5 = 0;
        if (r31 != 0)
            r4 = 4;
        else
            r4 = 2;
    }
    else
    {
        r5 = 1;
        if (r31 != 0)
            r4 = 5;
        else
            r4 = 3;
    }
    GXInitTexObjLOD(
        a->unk8,
        r4,
        r5,
        0.0f,
        (float)r31,
        a->unk6 / 10.0f,
        0,
        (a->unk0 & 0x40) != 0,
        a->unk7);
}

struct UnkStruct24
{
    u32 unk0;
    u8 filler4[0x12-0x4];
    u8 unk12;
    u8 filler13[0x1C-0x13];
    u32 unk1C;
};  // size = 0x20

static struct UnkStruct24 *func_8008F1E8_inline(struct UnkStruct24 *r30)
{
    if (r30->unk1C & 0x800)
        r30->unk0 |= 0x100;
    if (r30->unk12 == 0)
        r30->unk0 |= 0x80;
    return func_8008E9E0((void *)r30);
}

void *func_8008F1E8(struct UnkStruct22 *a, struct UnkStruct21 *b, u8 *c)
{
    struct UnkStruct20 *r30;
    struct UnkStruct24 *r30_2;
    int i;

    if (b == NULL)
        a->unk18 = 0;
    r30 = (void *)((u32)a + 0x40);
    if (a->unk18 != 0)
    {
        if (c != NULL)
        {
            a->unk24 = (void *)c;
            c += a->unk18 * 32;
        }
        else
            a->unk24 = OSAlloc(a->unk18 * 32);
        if (a->unk24 == NULL)
            OSPanic("avdisp.c", 0x58B, "cannot OSAlloc");
    }
    else
        a->unk24 = NULL;

    for (i = 0; i < a->unk18; i++)
    {
        r30[i].unk8 = (void *)&a->unk24[i];
        func_8008EFD0(&r30[i], &b->unk4[r30[i].unk4], b);
    }
    r30_2 = (void *)((u32)a + a->unk20);
    if (a->unk4 & 0x18)
        r30_2++;
    for (i = 0; i < a->unk1A; i++)
    {
        if (b == NULL)
            r30_2->unk12 = 0;
        if (a->unk4 & 0x18)
        {
            struct UnkStruct24 *r3 = r30_2;
            r30_2 += 3;
            func_8008F1E8_inline(r3);
        }
        else
            r30_2 = func_8008F1E8_inline(r30_2);
    }
    for (i = 0; i < a->unk1C; i++)
    {
        if (b == NULL)
            r30_2->unk12 = 0;
        if (a->unk4 & 0x18)
        {
            struct UnkStruct24 *r3 = r30_2;
            r30_2 += 3;
            func_8008F1E8_inline(r3);
        }
        else
            r30_2 = func_8008F1E8_inline(r30_2);
    }
    return c;
}

void func_8008F8A4(u8 *a);

void func_8008F498(struct UnkStruct10 *a)
{
    unsigned int i;
    for (i = 0; i < a->unk1E; i++)
        mathutil_mult_mtx(lbl_802F1B60->unk0, lbl_802F20C8[i], lbl_802F20CC[i]);
    func_8008F8A4(a->unk28);
}

void lbl_8008F528(struct UnkStruct17 *a)
{
    u32 r31;
    Func802F20F0 r30;
    u8 r29;
    u8 r28;
    u32 r27;
    u32 r26;
    u32 r25;
    u32 r23;
    u32 r22;
    GXColor sp10;
    GXColor spC;
    
    if ((a->unk40->unk0 & 0x1) == 0)
        func_800223D8(a->unk48);
    func_8009AA24(a->unkC, 0);
    mathutil_set_a_mtx(a->unkC);
    func_8009E094(a->unk44);
    lbl_802F20E8 = a->unk44;
    r31 = lbl_802F20EC;
    r30 = lbl_802F20F0;
    r29 = lbl_802F2100;
    r28 = lbl_802F2101;
    r27 = lbl_802F2104;
    r26 = lbl_802F2108;
    lbl_802F20DC = a->unk4C;
    lbl_802F20EC = a->unk50;
    lbl_802F20F0 = a->unk54;
    lbl_802F2100 = a->unk58;
    lbl_802F2101 = a->unk59;
    lbl_802F2104 = a->unk5C;
    lbl_802F2108 = a->unk60;
    if (a->unk60 != 0)
        mathutil_copy_mtx(*a->unk64, lbl_802B4E6C);
    r25 = lbl_802F210C;
    lbl_802F210C = a->unk61;
    if (a->unk61 != 0)
    {
        sp10 = lbl_802F2110;
        lbl_802F2110 = a->unk68;
    }
    r23 = lbl_802F2114;
    lbl_802F2114 = a->unk62;
    if (a->unk62 != 0)
    {
        spC = lbl_802F2118;
        lbl_802F2118 = a->unk6C;
    }
    r22 = lbl_802F211C;
    lbl_802F211C = a->unk70;
    if (lbl_802F20F0 == NULL)
        func_8008FE44(a->unk8, a->unk40);
    func_8008F914(a->unk8, a->unk40, a->unk3C);
    lbl_802F20EC = r31;
    lbl_802F20F0 = r30;
    lbl_802F2100 = r29;
    lbl_802F2101 = r28;
    lbl_802F2104 = r27;
    lbl_802F2108 = r26;
    lbl_802F210C = r25;
    if (a->unk61 != 0)
        lbl_802F2110 = sp10;
    lbl_802F2114 = r23;
    if (a->unk62 != 0)
        lbl_802F2118 = spC;
    lbl_802F211C = r22;
    lbl_802F20DC = 1.0f;
}

u32 func_8008F6D4(u32 a)
{
    u32 old = lbl_802F2108;
    lbl_802F2108 = a;
    return old;
}

void func_8008F6E4(int unused, Mtx b)
{
    mathutil_copy_mtx(b, lbl_802B4E6C);
}

void func_8008F714(float a, float b, float c, float d)
{
    if (a != 1.0f || b != 1.0f || c != 1.0f || d != 1.0f)
    {
        lbl_802F210C = 1;
        lbl_802F2110.r = a * 255.0f;
        lbl_802F2110.g = b * 255.0f;
        lbl_802F2110.b = c * 255.0f;
        lbl_802F2110.a = d * 255.0f;
    }
    else
    {
        lbl_802F210C = 0;
        lbl_802F2110.r = 255;
        lbl_802F2110.g = 255;
        lbl_802F2110.b = 255;
        lbl_802F2110.a = 255;
    }
}

void func_8008F7C8(float a, float b, float c, float d)
{
    if (a != 0.0f || b != 0.0f || c != 0.0f || d != 0.0f)
    {
        lbl_802F2114 = 1;
        lbl_802F2118.r = a * 255.0f;
        lbl_802F2118.g = b * 255.0f;
        lbl_802F2118.b = c * 255.0f;
        lbl_802F2118.a = d * 255.0f;
    }
    else
    {
        lbl_802F2114 = 0;
        lbl_802F2118.r = 0;
        lbl_802F2118.g = 0;
        lbl_802F2118.b = 0;
        lbl_802F2118.a = 0;
    }
}

void func_8008F878(u32 a)
{
    lbl_802F211C = a;
}

void func_8008F880(int a, float b, float c)
{
    lbl_802F2120 = a;
    lbl_802F2128 = b;
    lbl_802F212C = c;
}

void func_8008F890(u8 a, u8 b, u8 c)
{
    lbl_802F2124.r = a;
    lbl_802F2124.g = b;
    lbl_802F2124.b = c;
}

void func_8008F8A4(u8 *a)
{
    int i;
    for (i = 0; i < 8; i++)
    {
        if ((s32)a[i] != 0xFF)
            func_8009AA24(&lbl_802F20CC[a[i]], i + 1);
    }
}

struct UnkStruct25
{
    u8 filler0[8];
    u32 unk8[2];
    u8 filler10[0x20-0x10];
    u8 unk20[1];
};

struct UnkStruct26
{
    u8 filler0[8];
    u32 unk8;
    u32 unkC;
};

struct UnkStruct27
{
    u8 filler0[4];
    struct UnkStruct18 *unk4;
    void *unk8;
    u8 fillerC[0x18-0xC];
};

struct UnkStruct28
{
    u8 filler0_[8];
    u8 filler0[4];
    struct UnkStruct18 *unk4;
    void *unk8;
    u8 fillerC[0x38-0xC];
};

static u8 func_8008F914_inline(void *b, void *c)
{
    // Not sure about this stack usage and what struct this is supposed to be.
#if 0
    struct UnkStruct27 sp20;
#else
    struct UnkStruct28 sp20;
#endif
    if (lbl_802F20F0 != NULL)
    {
        sp20.unk4 = b;
        sp20.unk8 = c;
#if 0
        return lbl_802F20F0(&sp20);
#else
        return lbl_802F20F0(sp20.filler0);
#endif
    }
    else
    {
        func_80090524(b, c);
        return 1;
    }
}

static void *func_8008E9E0_(struct UnkStruct18 *a)
{
    u8 *r7 = a->unk60;
    int i;
    for (i = 0; i < 2; i++)
    {
        if (a->unk13 & (1 << i))
            r7 += a->unk28[i];
    }
    if (a->unk13 & 0xC)
    {
        u32 *r4 = (u32 *)r7;
        r7 += 32;
        r7 += r4[2];
        r7 += r4[3];
    }
    return (void *)r7;
}

u32 func_8008F914(struct UnkStruct10 *a, struct UnkStruct18 *b, void *c)
{
    int i;
    u8 *r31;
    s32 r30;

    if (b->unk0 & 2)
        r30 = 0;
    else
        r30 = 1;
    if (a->unk4 & 4)
        func_8008F8A4(b->unk20);  // inlined
    //lbl_8008F998
    func_8009A9B4(b->unk1C);
    r31 = b->unk60;

    //lbl_8008F9DC
    if (func_8008F914_inline(b, c) != 0)
    {
        for (i = 0; i < 2; i++)
        {
            if (b->unk13 & (1 << i))
            {
                if (lbl_802F20E8 != r30)
                {
                    lbl_802F20E8 = r30;
                    func_8009E094(r30);
                }
                GXCallDisplayList(r31, b->unk28[i]);
                r31 += b->unk28[i];
            }
            //lbl_8008FA44
            if (r30 != 0)
                r30 = 2;
        }
        if ((b->unk13 & (0xC)) != 0)
        {
            struct UnkStruct25 *r26 = (void *)r31;
            func_8008F8A4(r26->filler0);  // inlined
            r31 = r26->unk20;
            for (i = 0; i < 2; i++)
            {
                if (i == 0)
                    func_8009E094(1);
                else
                    func_8009E094(2);
                GXCallDisplayList(r31, r26->unk8[i]);
                r31 += r26->unk8[i];
            }
        }
    }
    //lbl_8008FB18
    else
    {
        return (u32)func_8008E9E0_(b);  // inlined
    }
    return (u32)r31;
}
