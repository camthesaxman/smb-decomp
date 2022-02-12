#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"

struct UnkMotApe1
{
    u32 unk0;
    u8 filler4[0x28-0x4];
    u16 unk28;
    u16 unk2A;
    u16 unk2C;
    u16 unk2E;
    u8 filler30[2];
    u16 unk32;
    u16 unk34;
    u16 unk36;
    u16 unk38;
    u8 filler3A[2];
    float unk3C;
    float unk40;
    u8 filler44[0xC200-0x44];
};

extern s8 lbl_802F2074;

u32 lbl_801C7A70[] =
{
    0,
    0,
    0,
    0,
    1,
    0,
    0x3F800000,
    0,
};

u32 lbl_801C7A90[] =
{
    0x00000001,
    0x00000005,
    0x00000007,
    0x00000008,
    0x0000000C,
    0x0000000D,
    0x00000010,
    0x00000012,
    0x00000013,
    0x00000015,
    0x00000016,
    0x00000017,
    0x00000018,
    0x0000001A,
    0x0000001B,
};

u32 lbl_801C7ACC[] =
{
    0x41B80000,
    0x41A8CCCD,
    0x41B00000,
    0x41AC0000,
};

u32 lbl_801C7ADC[] =
{
    0x00000010,
    0x00000008,
    0x00000020,
    0x00000006,
    0x00000009,
    0x00000010,
    0x00000018,
    0x00000004,
    0x00000006,
    0x00000004,
    0x0000000E,
    0x00000014,
    0x00000018,
    0x0000001E,
    0x00000014,
    0x00000014,
};

u32 lbl_801C7B1C[] =
{
    0,
    0x00000004,
    0x00000006,
    0x0000000E,
    0x00000006,
    0x0000000A,
};

void func_8008A114(int);
void func_8008A118(int);
void func_8008A11C(int);
void func_8008A120(int);

void (*lbl_801C7B34[])(int) =
{
    func_8008A114,
    func_8008A118,
    func_8008A11C,
    func_8008A120,
    func_8008A120,
    func_8008A120,
    func_8008A120,
    func_8008A120,
    func_8008A120,
    func_8008A120,
};

#define lbl_801C7B8C "mot_ape.c"

struct Struct80089A04_1_child_sub
{
    char *unk0;
    u8 filler4[0x20-0x4];
};  // size = 0x20

struct Struct80089A04_1_child
{
    u8 filler0[0x14];
    struct Struct80089A04_1_child_sub unk14[2];
};

struct Struct80089A04_1
{
    u8 filler0[4];
    struct Struct80089A04_1_child *unk4[4];
    s16 unk14[8];
};  // size = 0x24

struct Struct80089A04
{
    u8 filler0[4];
    char *unk4[11];
    s32 unk30[11];
};

struct Struct802B39C0_B0_child
{
    u32 unk0;
    float unk4;
    u32 unk8;
    u32 unkC;
    float unk10;
    u32 unk14[3];  // hmm
    //u8 filler14[0x20-0x14];
    u32 unk20;
};  // size = 0x24

struct Struct802B39C0_B0  // probably Ape
{
    struct Struct800355B8 *unk0;
    struct Struct800355B8 *unk4;
    float unk8;
    float unkC;
    u32 unk10;
    u32 unk14;
    u32 unk18;
    void *unk1C;
    u32 unk20;
    u32 unk24;
    u32 unk28;
    void *unk2C;
    Vec unk30;
    Vec unk3C;
    Vec unk48;
    u32 unk54;
    float unk58;
    u32 unk5C;
    Quaternion unk60;
    u32 unk70;
    u8 filler74[0x90-0x74];
    u32 unk90;
    u32 unk94;  // count of unk98
    struct Struct802B39C0_B0_child *unk98;
    u32 unk9C;
    Quaternion unkA0;
    u32 unkB0;
    u32 unkB4;
    void *unkB8;
    void *unkBC;
    u8 fillerC0[4];
};  // size = 0xC4

// bss
u8 lbl_802B39C0[0x30];
u32 lbl_802B39C0_30[0x20];
struct Struct802B39C0_B0 lbl_802B39C0_B0[16];  // B0
void *lbl_802B46B0[16];  // CF0

FORCE_BSS_ORDER(lbl_802B39C0)
FORCE_BSS_ORDER(lbl_802B39C0_30)
FORCE_BSS_ORDER(lbl_802B39C0_B0)
FORCE_BSS_ORDER(lbl_802B46B0)

struct GMA *charaGMAs[8];  // D30
struct TPL *charaTPLs[8];  // D50
u32 charaTplSizes[8];  // D70
u32 charaTplAramSizes[8];  // D90
u32 charaGmaSizes[8];  // DB0
u32 charaGmaAramSizes[8];  // DD0
u32 lbl_802B47B0[4];  // DF0
u32 lbl_802B47C0[4];  // E00
struct TPL *lbl_802B47D0[4];  // E10
GXTexObj *lbl_802B47E0[4];  // E20
struct GMAMeshHeader *lbl_802B47F0[4];  // E30
u32 lbl_802B4800[8];  // E40
Mtx lbl_802B4820;  // E60

extern u8 lbl_802F209C[8];
extern u8 lbl_802F2094[8];
extern u8 lbl_802F208C;
extern int lbl_802F2090;
extern volatile int lbl_802F2070;

struct Struct801C7824
{
    char *unk0;
    u8 filler4[0x1C-0x4];
    s16 unk1C[2];
    u8 filler20[4];
};  // size = 0x24

extern struct Struct801C7824 lbl_801C7824[];

void lbl_800893DC(u32 a)
{
    lbl_802F2070 = 0;
}

void func_800893E8(void)
{
    OSHeapHandle oldHeap;
    ARQRequest arqReq;
    struct File file;
    char filename[0x100];
    char *charaNames[] =
    {
        "BOY H",  // why no underscore here?
        "BOY_L",
        "GAL_H",
        "GAL_L",
        "KID_H",
        "KID_L",
        "GOR_H",
        "GOR_L",
    };
    char *sp8[] =
    {
        "boy_ch.tpl.lz",
        NULL,
        "kid_ch.tpl.lz",
        "gor_ch.tpl.lz",
    };
    void *work;
    u32 aramTop = 0xFF0000;
    char *suffix;
    int baseLen;
    void *compressed;
    u32 i;
    u32 j;

    DVDChangeDir("ape");
    lbl_802F208C = 0;
    oldHeap = OSSetCurrentHeap(memHeap4);
    work = OSAlloc(0x280020);
    lbl_802F2090 = 1;
    if (work == NULL)
        OSPanic("mot_ape.c", 230, "cannot OSAlloc\n");
    if (gamePauseStatus & (1 << 2))
        printf(" ===== Character Model Information =====\n");

    for (i = 0; i < 4; i++)
    {
        motInfo[i].unkB0 = (void *)motInfo;
        for (j = 0; j < 2; j++)
        {
            u32 index = i * 2 + j;
            int fileSize;

            charaGMAs[index] = NULL;
            charaTPLs[index] = NULL;
            lbl_802F209C[index] = 0;
            lbl_802F2094[index] = 0;
            baseLen = strlen(lbl_801C7824[index].unk0);
            strcpy(filename, lbl_801C7824[index].unk0);
            suffix = filename + baseLen;

            strcpy(suffix, ".tpl.lz");
            if (file_open(filename, &file) == 0)
            {
                printf("No Chara Texture <%s>\n", lbl_801C7824[index].unk0);
                OSPanic("mot_ape.c", 250, "Stopped...\n");
            }
            fileSize = OSRoundUp32B(file_size(&file));
            compressed = OSAllocFromHeap(memHeap5, fileSize);
            if (compressed == NULL)
                OSPanic("mot_ape.c", 254, "cannot OSAlloc");
            file_read(&file, compressed, fileSize, 0);
            charaTplSizes[index] = __lwbrx(compressed, 4);
            aramTop -= charaTplSizes[index];
            if (aramTop < 0xB00000)
                OSPanic("mot_ape.c", 260, "Not enough ARAM for CharacterModel.\n");
            charaTplAramSizes[index] = aramTop;
            lzs_decompress(compressed, work);
            OSFreeToHeap(memHeap5, compressed);
            DCStoreRange(work, charaTplSizes[index]);
            lbl_802F2070 = 1;
            ARQPostRequest(
                &arqReq,
                0,
                ARQ_TYPE_MRAM_TO_ARAM,
                ARQ_PRIORITY_HIGH,
                (uintptr_t)work,
                aramTop,
                (((charaTplSizes[index] - 1) >> 2) + 1) << 2,
                lbl_800893DC);
            while (lbl_802F2070 != 0)
                ;
            file_close(&file);

            strcpy(suffix, ".gma.lz");
            if (file_open(filename, &file) == 0)
            {
                printf("No Chara Model <%s>\n", lbl_801C7824[index].unk0);
                OSPanic("mot_ape.c", 277, "Stopped...\n");
            }
            fileSize = OSRoundUp32B(file_size(&file));
            compressed = OSAllocFromHeap(memHeap5, fileSize);
            if (compressed == NULL)
                OSPanic("mot_ape.c", 281, "cannot OSAlloc");
            file_read(&file, compressed, fileSize, 0);
            charaGmaSizes[index] = __lwbrx(compressed, 4);
            aramTop -= charaGmaSizes[index];
            if (aramTop < 0xB00000)
                OSPanic("mot_ape.c", 287, "Not enough ARAM for CharacterModel.\n");
            charaGmaAramSizes[index] = aramTop;
            lzs_decompress(compressed, work);
            DCStoreRange(work, charaGmaSizes[index]);
            OSFreeToHeap(memHeap5, compressed);
            lbl_802F2070 = 1;
            ARQPostRequest(
                &arqReq,
                0,
                ARQ_TYPE_MRAM_TO_ARAM,
                ARQ_PRIORITY_HIGH,
                (uintptr_t)work,
                aramTop,
                (((charaGmaSizes[index] - 1) >> 2) + 1) << 2,
                lbl_800893DC);
            while (lbl_802F2070 != 0)
                ;
            file_close(&file);

            if (gamePauseStatus & (1 << 2))
                printf("%s : Polygon[ %x ] Texture[ %x ]\n",
                    charaNames[index], charaGmaSizes[index], charaTplSizes[index]);
        }
    }

    for (i = 0; i < 4; i++)
    {
        int fileSize;
        void *compressed;

        if (sp8[i] != NULL)
        {
            file_open(sp8[i], &file);
            fileSize = OSRoundUp32B(file_size(&file));
            compressed = OSAllocFromHeap(memHeap5, fileSize);
            if (compressed == NULL)
                OSPanic("mot_ape.c", 311, "cannot OSAlloc");
            file_read(&file, compressed, fileSize, 0);
            lbl_802B47B0[i] = __lwbrx(compressed, 4);
            aramTop -= lbl_802B47B0[i];
            lbl_802B47C0[i] = aramTop;
            lzs_decompress(compressed, work);
            DCStoreRange(work, lbl_802B47B0[i]);
            OSFreeToHeap(memHeap5, compressed);
            lbl_802F2070 = 1;
            ARQPostRequest(
                &arqReq,
                0,
                ARQ_TYPE_MRAM_TO_ARAM,
                ARQ_PRIORITY_HIGH,
                (uintptr_t)work,
                aramTop,
                (((lbl_802B47B0[i] - 1) >> 2) + 1) << 2,
                lbl_800893DC);
            while (lbl_802F2070 != 0)
                ;
            file_close(&file);
            if (gamePauseStatus & (1 << 2))
                printf("change texture load. %s [ %x ]\n",
                    sp8[i], lbl_802B47B0[i]);
        }
        else
        {
            lbl_802B47B0[i] = 0;
            lbl_802B47C0[i] = 0;
        }
        lbl_802B47D0[i] = NULL;
    }
    DVDChangeDir("..");
    if (gamePauseStatus & (1 << 2))
        printf("   Use ARAM Memory top : %x\n", aramTop);
    if (gamePauseStatus & (1 << 2))
        printf(" =======================================\n");
    OSFree(work);
    OSSetCurrentHeap(oldHeap);
}

void func_80089A04(struct Struct80089A04_1 *a, int b, struct Struct80089A04 *c)
{
    int i;
    struct Struct80089A04_1 *dunno = &a[(b >> 1) & 1];

    for (i = 0; i < dunno->unk14[b & 1]; i++)
    {
        struct Struct80089A04_1_child *temp = dunno->unk4[b & 1];

        if (strcmp(temp->unk14[i].unk0, c->unk4[b]) == 0)
        {
            c->unk30[b] = i;
            return;
        }
    }
    printf("obj: %s is nothing.\n", c->unk4[b]);
    c->unk30[b] = -1;
}

struct Struct800355B8 *func_80089AB8(struct Struct800341BC_2 *a)
{
    struct Struct800355B8 *r30;

    if (gameSubmode == SMD_MINI_BILLIARDS_INIT || gameSubmode == SMD_MINI_BILLIARDS_MAIN)
    {
        lbl_802F2074 = 2;
        r30 = OSAllocFromHeap(memHeap3, 0xC200);
    }
    else
    {
        lbl_802F2074 = 0;
        r30 = OSAllocFromHeap(memHeap1, 0xC200);
    }
    if (r30 == NULL)
        OSPanic("mot_ape.c", 396, "rob init Heap Over.\n");
    r30->unk32 = 1;
    r30->unk38 = 1;
    r30->unk36 = 0;
    r30->unk0 = 0;
    r30->unk34 = 0xFFFF;
    r30->unk3C = 1.0f;
    r30->unk40 = 0.0f;
    r30->unk2C = 0x4000;
    r30->unk2E = 0x4000;
    r30->unk2A = 0;
    r30->unk28 = 0;
    func_800341BC((void *)((u8 *)r30 + 0x81A8), a, r30->unk36);
    func_80035FDC(r30);
    func_800355B8(r30);
    func_800355FC(r30);
    return r30;
}

void func_80089BD4(struct Struct80034F5C_1 *a)
{
    int i;
    struct Struct80034F5C_1 *r4;
    Vec spC;
    struct Struct80034F5C_1 *var = a;

    for (i = 0; i < 0x1D; i++)
    {
        if (!(a->unk0 & 1))
        {
            a++;
            continue;
        }
        mathutil_mtxA_from_mtx(a->unk208);
        mathutil_mtxA_to_quat(&a->unk1B0);
        if (a->unk1A0 != 0xFFFFFFFF)
        {
            r4 = var + a->unk1A0;
            while (r4->unk1A0 != 0xFFFFFFFF)
            {
                if (r4->unk0 & 1)
                    break;
                r4 = var + r4->unk1A0;
            }
            mathutil_mtxA_from_mtx(r4->unk208);
        }
        else
            mathutil_mtxA_from_identity();
        spC.x = a->unk208[0][3];
        spC.y = a->unk208[1][3];
        spC.z = a->unk208[2][3];
        mathutil_mtxA_rigid_inv_tf_point(&spC, &a->unk1A4);
        a++;
    }
}

struct Struct80089CBC
{
    s32 unk0;
    s32 unk4;
    u32 unk8;
    u32 unkC;
    s32 unk10;
    s32 unk14;
    u8 filler18[0x20-0x18];
};  // size = 0x20

struct Struct80089CBC *func_80089CBC(void *unused, int b, int c)
{
    struct Struct80089CBC *r6 = (void *)((u8 *)motInfo + 0x28000);

    while (c != 0)
    {
        struct Struct80089CBC *r3 = &r6[c];

        if (r3->unk10 == b)
            return r3;
        c = r3->unk14;
    }
    return NULL;
}

struct Struct80089CF4_1_child2
{
    u8 filler0[0x8];
    u32 unk8;
    u32 unkC;
    u32 unk10;
    s32 unk14;
    float unk18;
    u32 unk1C;
};

struct Struct80089CF4_1_child
{
    u32 unk0;
    float unk4;
    s32 unk8;
    struct Struct80089CBC *unkC;
    float unk10;
    u32 unk14;
    u32 unk18;
    u32 unk1C;
    s32 unk20;
};  // size = 0x24

struct Struct80089CF4_1
{
    struct Struct800355B8 *unk0;
    struct Struct800355B8 *unk4;
    float unk8;
    float unkC;
    u32 unk10;
    u32 unk14;
    s32 unk18;
    struct Struct80089CF4_1_child2 *unk1C;
    struct Struct80089CF4_1_child2 *unk20;
    u32 unk24;
    u32 unk28;
    u8 filler2C[0x94-0x2C];
    u32 unk94;
    struct Struct80089CF4_1_child *unk98;
    u32 unk9C;
    u8 fillerA0[0xB0-0xA0];
    u32 unkB0;
    u8 fillerB4[0xC2-0xB4];
    s16 unkC2;
};

extern s32 lbl_802F206C;

struct Struct801C63B0
{
    u8 filler0[0x30];
    u32 unk30;
    u32 unk34;
    u32 unk38;
    u8 filler3C[4];
};  // size = 0x40

extern struct Struct801C63B0 *lbl_801C63B0[];

static inline void func_80089CF4_inline(struct Struct80089CF4_1 *a)
{
    int i;

    for (i = 0; i < a->unk94; i++)
    {
        struct Struct801C63B0 *r24 = &lbl_801C63B0[a->unk10][i];

        if (a->unk98[i].unkC == NULL)
            a->unk98[i].unkC = func_80089CBC(a->unk98, i, a->unk1C->unk1C);
        a->unk98[i].unk14 = r24->unk30;
        a->unk98[i].unk18 = r24->unk34;
        a->unk98[i].unk1C = r24->unk38;
    }
}

void func_8008A55C(u32 a, struct Struct80089CF4_1_child *b, int c, int d);

void func_80089CF4(struct Struct80089CF4_1 *a, int r29)
{
    struct Struct800355B8 *r6 = a->unk0;
    float f31 = (float)r6->unk38 / (float)r6->unk3A;
    struct Struct800355B8 *r28;
    struct Struct800355B8 *r27;
    u32 i;
    u8 dummy[0x10];

    if (a->unk1C->unkC & (1 << 2))
        a->unk14 |= 0x200;
    else
        a->unk14 &= ~(1 << 9);
    if (a->unk20 != NULL)
    {
        a->unk1C = a->unk20;
        a->unk20 = NULL;
        r29 = a->unk1C->unk10;
    }
    if (a->unk14 & (1 << 9))
    {
        // swap
        struct Struct800355B8 *temp = a->unk0;
        a->unk0 = a->unk4;
        a->unk4 = temp;
    }
    else
    {
        func_80089BD4((void *)((u8 *)a->unk0 + 0x81A8));
    }
    r27 = a->unk0;
    r28 = a->unk4;
    a->unk8 = 0.0f;
    a->unkC2 = 0;
    a->unk14 &= ~((1 << 12)|(1 << 13));
    if (lbl_802F206C != 0)
        a->unkC = a->unk1C->unk14;
    else
        a->unkC = 0.0f;
    r27->unk32 = r29;
    r27->unk38 = 1;
    a->unk24 = a->unk28;
    a->unk9C = a->unkB0;
    a->unk18 = a->unkC + 1.0f;
    r27->unk40 = 0.0f;
    func_80035FDC(r27);
    if (r27->unk32 == 0)
        r27->unk32 = 1;
    func_800355B8(r27);
    if (a->unkC > 9.9999999392252903e-09f && (a->unk14 & (1 << 9)))
    {
        float f4 = ((float)r28->unk3A / r28->unk3C);

        f4 /= ((float)r27->unk3A / r27->unk3C);

        if (f4 < 1.0f)
        {
            r28->unk3C *= f4;
            r27->unk3C = a->unk1C->unk18;
        }
        else
            r27->unk3C = a->unk1C->unk18 / f4;
    }
    else
        r27->unk3C = a->unk1C->unk18;
    if (a->unk1C->unkC & (1 << 3))
    {
        r27->unk38 = f31 * r27->unk3A;
        if (r27->unk38 >= r27->unk3A)
            r27->unk38 = 1;
    }
    for (i = 0; i < a->unk94; i++)
    {
        struct Struct80089CF4_1_child *var = &a->unk98[i];

        var->unkC = 0;
        var->unk20 = 0;
    }
    func_80089CF4_inline(a);
    for (i = 0; i < a->unk94; i++)
    {
        struct Struct80089CF4_1_child *r28 = &a->unk98[i];

        if (r28->unkC != NULL)
            r28->unk10 = 0.0f;
        func_8008A55C(a->unk10, r28, r27->unk3A, 1);
        if (r28->unkC == NULL)
        {
            if (r28->unk4 > 0.0f)
                r28->unk10 = -2.0f;
            else
                r28->unk10 = 2.0f;
            r28->unk8 = 0;
        }
    }
}

void lbl_8008A108(void) {}

int lbl_8008A10C(void)
{
    return 0;
}

void func_8008A114(int a) {}

void func_8008A118(int a) {}

void func_8008A11C(int a) {}

void func_8008A120(int a) {}

void func_8008A124(struct Struct80034F5C_1 *r29, float b)
{
    int i;
    struct Struct80034F5C_1 *a = r29;

    for (i = 0; i < 0x1D; i++)
    {
        Vec sp20;
        Quaternion sp10;

        if (!(r29->unk0 & 1))
        {
            r29++;
            continue;
        }
        mathutil_mtxA_from_mtx(r29->unk208);
        mathutil_mtxA_to_quat(&sp10);
        mathutil_quat_slerp(&sp10, &r29->unk1B0, &sp10, b);
        mathutil_quat_normalize(&sp10);
        if (r29->unk1A0 != 0xFFFFFFFF)
        {
            struct Struct80034F5C_1 *r4 = &a[r29->unk1A0];

            while (r4->unk1A0 != 0xFFFFFFFF)
            {
                if (r4->unk0 & 1)
                    break;
                r4 = a + r4->unk1A0;
            }
            mathutil_mtxA_from_mtx(r4->unk208);
            mathutil_mtxA_translate(&r29->unk1A4);
        }
        else
        {
            mathutil_mtxA_from_identity();
            sp20.x = r29->unk1A4.x + (r29->unk208[0][3] - r29->unk1A4.x) * b;
            sp20.y = r29->unk1A4.y + (r29->unk208[1][3] - r29->unk1A4.y) * b;
            sp20.z = r29->unk1A4.z + (r29->unk208[2][3] - r29->unk1A4.z) * b;
            mathutil_set_mtxA_translate(&sp20);
        }
        mathutil_get_mtxA_translate_alt(&sp20);
        mathutil_mtxA_from_quat(&sp10);
        mathutil_mtxA_normalize_basis();
        mathutil_set_mtxA_translate(&sp20);
        mathutil_mtxA_to_mtx(r29->unk208);
        r29++;
    }
}

void func_8008A2C4(struct Struct80034F5C_1 *r29)
{
    int i;
    struct Struct80034F5C_1 *a = r29;

    for (i = 0; i < 0x1D; i++)
    {
        Vec spC;

        if (!(r29->unk0 & 1))
        {
            r29++;
            continue;
        }
        mathutil_mtxA_from_mtx(r29->unk208);
        if (r29->unk1A0 != 0xFFFFFFFF)
        {
            struct Struct80034F5C_1 *r4 = &a[r29->unk1A0];

            while (r4->unk1A0 != 0xFFFFFFFF)
            {
                if (r4->unk0 & 1)
                    break;
                r4 = a + r4->unk1A0;
            }
            mathutil_mtxA_from_mtx(r4->unk208);
        }
        else
        {
            mathutil_mtxA_from_identity();
        }
        spC.x = r29->unk208[0][3];
        spC.y = r29->unk208[1][3];
        spC.z = r29->unk208[2][3];
        mathutil_mtxA_rigid_inv_tf_point(&spC, &r29->unk1A4);
        r29++;
    }
}

void func_8008A3A4(struct Struct80034F5C_1 *r28, struct Struct80034F5C_1 *r29, float c)
{
    int i;
    struct Struct80034F5C_1 *a = r28;

    for (i = 0; i < 0x1D; i++)
    {
        Vec sp30;
        Quaternion sp20;
        Vec sp14;

        if (!(r28->unk0 & 1))
        {
            r28++;
            r29++;
            continue;
        }
        mathutil_mtxA_from_mtx(r29->unk208);
        mathutil_mtxA_to_quat(&r29->unk1B0);
        mathutil_mtxA_from_mtx(r28->unk208);
        mathutil_mtxA_to_quat(&sp20);
        mathutil_quat_slerp(&sp20, &r29->unk1B0, &sp20, c);
        mathutil_quat_normalize(&sp20);
        if (r28->unk1A0 != 0xFFFFFFFF)
        {
            struct Struct80034F5C_1 *r4 = &a[r28->unk1A0];

            while (r4->unk1A0 != 0xFFFFFFFF)
            {
                if (r4->unk0 & 1)
                    break;
                r4 = a + r4->unk1A0;
            }
            mathutil_mtxA_from_mtx(r4->unk208);
            mathutil_mtxA_translate(&r28->unk1A4);
        }
        else
        {
            mathutil_mtxA_from_identity();
            sp14.x = r29->unk208[0][3];
            sp14.y = r29->unk208[1][3];
            sp14.z = r29->unk208[2][3];
            sp30.x = r28->unk208[0][3];
            sp30.y = r28->unk208[1][3];
            sp30.z = r28->unk208[2][3];
            mathutil_scale_ray(&sp14, &sp30, &sp30, c);
            mathutil_set_mtxA_translate(&sp30);
        }
        mathutil_get_mtxA_translate_alt(&sp30);
        mathutil_mtxA_from_quat(&sp20);
        mathutil_mtxA_normalize_basis();
        mathutil_set_mtxA_translate(&sp30);
        mathutil_mtxA_to_mtx(r28->unk208);
        r28++;
        r29++;
    }
}

extern const double lbl_802F56D8;

void func_8008A55C(u32 a, struct Struct80089CF4_1_child *b, int c, int d)
{
    int dummy;
    int r8;

    b->unk4 += b->unk10;
    if (__fabs(b->unk10) < lbl_802F56D8)
        r8 = dummy = b->unkC != NULL;
    else if (b->unk10 < 0.0f)
        r8 = dummy = b->unk4 < b->unk8;
    else
        r8 = dummy = b->unk4 >= b->unk8;
    if (b->unk20 < 0 && b->unkC != NULL)
        r8 = 1;
    if (r8)
        b->unk4 = b->unk8;
    if (--b->unk20 > 0)
        return;
    if (!r8)
        return;
    if (b->unkC != NULL)
    {
        struct Struct80089CBC *r7 = b->unkC;

        b->unk0 = r7->unk0 & ~(1 << 31);
        b->unk8 = r7->unk8;
        if (r7->unk4 < d)
            b->unk20 = (c + r7->unk4) - d;
        else
            b->unk20 = r7->unk4 - d;
        if (b->unk20 == 0)
            b->unk10 = 0.0f;
        else
            b->unk10 = ((float)b->unk8 - b->unk4) / b->unk20;
        if (r7->unkC < 0x10000000)
        {
            if (r7->unkC > 0x0C000000)
                b->unkC = (void *)(r7->unkC + 0xF36E0000 + (uintptr_t)motInfo);
            else if (r7->unkC != 0)
            {
#ifdef NONMATCHING
                b->unkC = (void *)((u8 *)motInfo[a].unkB0 + r7->unkC);
#else
                struct MotInfo *info = &motInfo[a];
                uintptr_t ptr = r7->unkC;
                ptr += (uintptr_t)info->unkB0;
                b->unkC = (void *)ptr;
#endif
            }
            else
                b->unkC = NULL;
        }
        else
        {
            if (r7->unk0 > 0x100)
                b->unkC = 0;
            else if (r7->unkC >= (uintptr_t)motInfo + 0x80000)
                b->unkC = 0;
            else
                b->unkC = (void *)r7->unkC;
        }
    }
    else
    {
        b->unk4 = b->unk8;
        b->unk10 = 0.0f;
        b->unk20 = 0;
    }
}

void func_8008A7F0_inline(struct Struct80089CF4_1 *a, struct Struct800355B8 *b)
{
    struct Struct80089CF4_1_child *r28;
    int i;
    r28 = a->unk98;

    for (i = 0; i < a->unk94; i++)
        func_8008A55C(a->unk10, r28++, b->unk3A, b->unk38);
}

void func_8008A7F0(struct Struct80089CF4_1 *a, struct Struct800355B8 *b)
{
    u8 dummy[16];

    if (b->unk40 >= 1.0f)
    {
        if (!(a->unk14 & (1 << 13)))
        {
            do
            {
                b->unk38++;
                b->unk40 -= 1.0f;
            } while (b->unk40 >= 1.0f);
        }
        else
            b->unk40 = 0.0f;
        func_8008A7F0_inline(a, b);
    }
    if (b->unk38 >= b->unk3A)
    {
        if (!(a->unk14 & (1 << 12)))
        {
            if (a->unk1C->unkC & (1 << 4))
                b->unk38 = a->unk1C->unk8;
            else
                b->unk38 = 1;
            a->unkC2++;
            if (b->unk34 != 0xFFFF)
            {
                b->unk32 = b->unk34;
                b->unk34 = 0xFFFF;
                func_80089CF4(a, b->unk32);
            }
            else
            {
                func_80035FDC(b);
                func_800355B8(b);
                func_80089CF4_inline(a);
                func_8008A7F0_inline(a, b);
            }
        }
        else
        {
            a->unk14 |= 0x2000;
            if (b->unk34 != 0xFFFF)
            {
                b->unk32 = b->unk34;
                b->unk34 = 0xFFFF;
                func_80089CF4(a, b->unk32);
            }
        }
    }
    func_800355FC(b);
}

void g_free_character_graphics(int chara, int lod)
{
    int index = chara * 2;
    OSHeapHandle oldHeap;

    if (lod > 1)
        lod = 1;
    index += lod;

    if (lbl_802F209C[index] == 0)
    {
        printf("\nchara model is already free.\n");
        return;
    }
    lbl_802F209C[index]--;

    if (lbl_802F208C != 0)
        lbl_802F208C--;
    if (lbl_802F2094[index] != 0)
        oldHeap = OSSetCurrentHeap(memHeap4);
    else
        oldHeap = OSSetCurrentHeap(memHeap4);
    if (charaTPLs[index] != NULL || charaGMAs[index] != NULL)
    {
        VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
        VIWaitForRetrace();
    }
    if (charaTPLs[index] != NULL)
    {
        free_tpl(charaTPLs[index]);
        charaTPLs[index] = NULL;
    }
    if (charaGMAs[index] != NULL)
    {
        free_gma(charaGMAs[index]);
        charaGMAs[index] = NULL;
    }
    if (lbl_802F2090 != 0)
    {
        if (lbl_802B47D0[chara] != NULL)
        {
            free_tpl(lbl_802B47D0[chara]);
            lbl_802B47D0[chara] = NULL;
        }
        if (lbl_802B47E0[chara] != NULL)
        {
            OSFree(lbl_802B47E0[chara]);
            lbl_802B47E0[chara] = NULL;
        }
    }
    lbl_802F2090 = 1;
    OSSetCurrentHeap(oldHeap);
}

void *func_8008ABB4_inline(struct GMAModelHeader *model)
{
    struct GMAMeshHeader *mesh;
    int i;

    mesh = (void *)((u8 *)model + model->headerSize);
    for (i = 0; i < model->numLayer1Meshes; i++)
    {
        if (mesh->unk4.r == 0xFF)
            return mesh;
        mesh = func_8008AE2C(mesh);
    }
    return NULL;
}

void g_load_character_graphics(int chara, int lod)
{
    OSHeapHandle oldHeap;
    int index = chara * 2;

    if (lod > 1)
        lod = 1;
    index += lod;

    if (lbl_802F209C[index] != 0)
    {
        lbl_802F209C[index]++;
        return;
    }

    lbl_802F208C++;
    if (lbl_802F208C > 8)
    {
        int inSelInit = (gameMode == MD_SEL && gameSubmode == SMD_SEL_NGC_INIT);
        int inBilliards = (gameMode == MD_MINI && (gameSubmode == SMD_MINI_BILLIARDS_INIT || gameSubmode == SMD_MINI_BILLIARDS_MAIN));

        if (inSelInit | inBilliards)
        {
            lbl_802F2094[index] = 1;
            oldHeap = OSSetCurrentHeap(memHeap4);
        }
        else
            OSPanic("mot_ape.c", 1314, "APE Allocate limit over!!\n");
    }
    else
    {
        lbl_802F2094[index] = 0;
        oldHeap = OSSetCurrentHeap(memHeap4);
    }

    if (lbl_802B47C0[chara] != 0)
    {
        lbl_802B47D0[chara] = load_tpl_from_aram(lbl_802B47C0[chara], lbl_802B47B0[chara]);
        lbl_802B47E0[chara] = create_tpl_tex_objs(lbl_802B47D0[chara]);
    }

    charaTPLs[index] = load_tpl_from_aram(charaTplAramSizes[index], charaTplSizes[index]);
    charaGMAs[index] = load_gma_from_aram(charaGmaAramSizes[index], charaGmaSizes[index], charaTPLs[index]);
    lbl_802F209C[index]++;
    OSSetCurrentHeap(oldHeap);
    if (chara == 1)
    {
        struct GMAModelHeader *model;
        int i;

        for (i = 0; i < 2; i++)
        {
            model = charaGMAs[index]->modelEntries[lbl_801C7824[index].unk1C[i]].modelOffset;
            lbl_802B47F0[lod * 2 + i] = func_8008ABB4_inline(model);
        }
        lbl_802B4800[index + 0] = 0;
        lbl_802B4800[index + 1] = 0;
    }
    else
    {
        struct GMAModelHeader *model1 = charaGMAs[index]->modelEntries[lbl_801C7824[index].unk1C[0]].modelOffset;
        struct GMAModelHeader *model2 = charaGMAs[index]->modelEntries[lbl_801C7824[index].unk1C[1]].modelOffset;

        func_8008CBD0(chara, lod, model1, model2);
    }
}

struct Struct8008AE2C
{
    u8 filler0[8];
    u32 unk8;
    u32 unkC;
};

struct GMAMeshHeader *func_8008AE2C(struct GMAMeshHeader *mesh)
{
    int i;
    u8 *ret = (u8 *)mesh + 0x60;

    for (i = 0; i < 2; i++)
    {
        if (mesh->unk13 & (1 << i))
            ret += mesh->dispListSizes[i];
    }
    if (mesh->unk13 & ((1 << 2)|(1 << 3)))
    {
        struct Struct8008AE2C *r6 = (void *)ret;

        ret += 0x20;
        ret += r6->unk8;
        ret += r6->unkC;
    }
    return (struct GMAMeshHeader *)ret;
}

extern struct NaomiObj *apeFaceObj;
extern struct TPL *apeFaceTpl;
extern u32 lbl_802F2068;
extern u32 lbl_802F207C;
extern float lbl_802F2078;
extern void *lbl_802F2088;

void mot_ape_init(void)
{
    int i;

    lbl_802F2068 = 0;
    lbl_802F207C = 1;
    for (i = 0; i < 16; i++)
    {
        lbl_802B46B0[i] = &lbl_802B39C0_B0[i];
        lbl_802B39C0_B0[i].unk70 = i;
    }
    for (i = 0; i < 32; i++)
        lbl_802B39C0_30[i] = 0;
    lbl_802F206C = 1;
    lbl_802F2078 = 1.0f;
    func_800893E8();
    lbl_802F2088 = g_avdisp_alloc_matrix_lists(30);
    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_z(0x2FA4);
    mathutil_mtxA_to_mtx(lbl_802B4820);
    mathutil_mtxA_pop();
    func_8008B0AC();
    load_nlobj(&apeFaceObj, &apeFaceTpl, "ape/face_p.lz", "ape/face.lz");
}

void func_8008B0AC(void)
{
    int i;
    int j;
    int r10;

    for (i = 0; i < 8; i++)
    {
        motInfo[i].unkB0 = (void *)motInfo;
        r10 = 0;
        for (j = 0; j < 16; j++)
        {
            if (j == 10)
                r10 = 0x400;
            // hmm...
            motInfo[i].unk30[j] = (void *)((uintptr_t)motInfo + 0x2000 + (i * 0x80 + r10) * 0x20);
            // TODO: figure out which array this is part of
            motInfo[i].unk70[j] = lbl_801C7ADC[j] - lbl_801C7B1C[j - 10];
            r10 += lbl_801C7ADC[j];
        }
        if (i >= 4)
        {
            strcpy(motInfo[i].unk0, motInfo[0].unk0);
            strcpy(motInfo[i].unk18, motInfo[0].unk18);
        }
    }
}

void func_8008B2D4(struct Ape *ape)
{
    func_8008D29C(ape->unk5C);
    if (lbl_802F2074 == 2)
    {
        OSFreeToHeap(memHeap3, ape->unk0);
        OSFreeToHeap(memHeap3, ape->unk4);
    }
    else if (lbl_802F2074 == 1)
    {
        OSFreeToHeap(memHeap5, ape->unk0);
        OSFreeToHeap(memHeap5, ape->unk4);
    }
    else
    {
        OSFreeToHeap(memHeap1, ape->unk0);
        OSFreeToHeap(memHeap1, ape->unk4);
    }
    OSFreeToHeap(memHeap1, ape->unk98);
    lbl_802B46B0[--lbl_802F2068] = ape;
    g_free_character_graphics(ape->unk10, (ape->unk90 >= 2));
}

extern s32 lbl_801C63C0[];
//extern struct Struct80089A04 *lbl_801C63B0[];
extern u8 lbl_802F12D8[];
extern u8 lbl_802F12E0[];

void func_8008C924();

/*
void *func_8008B3B8(char *a)
{
    struct Struct801C7824 *r27_;
    struct Struct80034B50_child *r27;
    struct Struct802B39C0_B0 *r26 = lbl_802B46B0[lbl_802F2068];
    int r20 = r26->unk70;
    int i;  // r24
    struct Struct800355B8 *r24;
    struct Struct800355B8 *r31;
    int r23;
    u8 r21;
    u8 *r24_;
    u8 *r23_;
    u8 filler[4];

    memset(r26, 0, sizeof (*r26));
    r26->unk70 = r20;
    r27 = &motSkeleton->unk0[0];
    for (i = 0; i < motSkeleton->unk4; i++)
    {
        if (strcmp(a, motSkeleton->unk0[i].unk14) == 0)
        {
            r27 = &motSkeleton->unk0[i];
            break;
        }
    }
    r24 = func_80089AB8((void *)r27);
    r31 = func_80089AB8((void *)r27);
    r26->unk94 = 5;
    r26->unk98 = OSAllocFromHeap(memHeap1, r26->unk94 * 0x24);
    if (r26->unk98 == NULL)
        OSPanic("mot_ape.c", 0x5D6, "cannot OSAlloc\n");
    //lbl_8008B4BC
    // i = r8
    for (i = 0; i < r26->unk94; i++)
    {
        struct Struct802B39C0_B0_child *var = &r26->unk98[i];

        var->unk0 = 0x7FFFFFFF;
        var->unk4 = -1.0f;
        var->unk8 = 0;
        var->unkC = 0;
        var->unk10 = 0.0f;
        var->unk20 = 0;
    }
    r26->unk0 = r24;
    r26->unk4 = r31;
    r26->unk1C = lbl_801C7A70;
    r26->unk20 = 0;
    r26->unk8 = 0.0f;
    r26->unk10 = 0;
    r26->unkC = 0.0f;
    r26->unk14 = 0;
    r26->unk18 = 0;
    r26->unk24 = 1;
    r26->unk28 = 0;
    r26->unk9C = 0;
    r26->unkB0 = 0;
    r26->unk2C = r27;
    r26->unk54 = 0;

    r26->unk30 = (Vec){ 1, 0, 0 };  //0x3C
    r26->unk3C = (Vec){ 0, 0, 0 };  //0x48
    r26->unk48 = (Vec){ 0, 0, 0 };  //0x54
    r26->unkA0 = (Quaternion){ 0, 0, 0, 1 }; //0x60
    r26->unk58 = 1.0f;
    r26->unk60 = (Quaternion){ 0, 0, 0, 0 };  //0x70
    r26->unkB4 = 0;
    r26->unk90 = lbl_802F207C;

    r27_ = &lbl_801C7824[r26->unk10 * 2];
    // i = r28
    for (i = 0; i < lbl_801C63C0[r26->unk10]; i++)  // lbl_8008B6B8
    {
        u8 r24;
        int j;  // r23
        //r0 = lbl_801C63B0[r26->unk10];
        struct Struct80089A04 *r20 = (void *)&lbl_801C63B0[r26->unk10][i];

        for (j = 0; j < 4; j++)
        {
            func_80089A04((void *)r27_, j, r20);
            r26->unk98[i].unk14[j] = r20->unk30[j];
        }
    }

    // i = r24
    r23 = 0;
    for (i = 0; (u8)i < motSkeleton->unk4; i++)
    {
        if (strcmp(a, motSkeleton->unk0[i].unk14) == 0)
        {
            r23 = i;
            break;
        }
    }
    //lbl_8008B780
    r21 = r23;
    r24_ = (u8 *)r26->unk0;
    func_80035F18(r24_ + 0x4114, r24_, 1, lbl_802F12D8[r21]);
    func_80035F18(r24_ + 0x84,   r24_, 2, lbl_802F12E0[r21]);
    r23_ = (u8 *)r26->unk4;
    func_80035F18(r24_ + 0x4114, r23_, 1, lbl_802F12D8[r21]);
    func_80035F18(r24_ + 0x84,   r23_, 2, lbl_802F12D8[r21]);

    r26->unkB8 = lbl_8008A10C;
    r26->unkBC = lbl_8008A108;
    r26->unk5C = func_8008D1DC(func_8008C924, (void *)r26, 7);
    lbl_802F2068++;
    return r26;
}
*/
/*
const float lbl_802F56A8 = 1f;
const float lbl_802F56AC = 0f;
const float lbl_802F56B0 = 9.9999999392252903e-09f;
const float lbl_802F56B4 = -2f;
const float lbl_802F56B8 = 2f;
const double lbl_802F56C0 = 4503599627370496;
const double lbl_802F56C8 = 4503601774854144;
const float lbl_802F56D0 = -1f;
const float lbl_802F56D4 = 60f;
const double lbl_802F56D8 = 9.9999999392252903e-09;
const float lbl_802F56E0 = 216f;
const float lbl_802F56E4 = -0.80000001192092896f;
const float lbl_802F56E8 = 0.090000003576278687f;
const float lbl_802F56EC = 0.40000000596046448f;
const float lbl_802F56F0 = -0.30000001192092896f;
const float lbl_802F56F4 = 0.99599999189376831f;
const float lbl_802F56F8 = 5f;
const float lbl_802F56FC = 8f;
const float lbl_802F5700 = 0.80000001192092896f;
const float lbl_802F5704 = 6f;
const float lbl_802F5708 = 182.04444885253906f;
const float lbl_802F570C = 1.1920928955078125e-07f;
const float lbl_802F5710 = 0.5f;
const double lbl_802F5718 = 3;
const double lbl_802F5720 = 1;
const double lbl_802F5728 = 2;
const double lbl_802F5730 = -2;
const double lbl_802F5738 = 4503601774854144;
*/
