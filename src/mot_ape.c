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
};

u32 lbl_801C7AF4[] =
{
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

s32 lbl_801C7B1C[] =
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

// bss
Mtx lbl_802B39C0;
u32 lbl_802B39C0_30[0x20];
struct Ape lbl_802B39C0_B0[16];  // B0
struct Ape *lbl_802B46B0[16];  // CF0

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

//#define lbl_801C7824 lbl_801C7824_
extern struct Struct801C7824 lbl_801C7824[4];

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

#pragma dont_inline on
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
#pragma dont_inline reset

struct Struct8003699C_child *func_80089AB8(struct Struct800341BC_2 *a)
{
    struct Struct8003699C_child *r30;

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
    func_800341BC(&r30->unk81A8, a, r30->unk36);
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

extern s32 lbl_802F206C;

struct Struct801C63B0
{
    u8 filler0[0x30];
    s32 unk30[4];
};  // size = 0x40

extern struct Struct801C63B0 *lbl_801C63B0[];

static inline void func_80089CF4_inline(struct Ape *a)
{
    int i;

    for (i = 0; i < a->unk94; i++)
    {
        struct Struct801C63B0 *r24 = &lbl_801C63B0[a->unk10][i];

        if (a->unk98[i].unkC == NULL)
            a->unk98[i].unkC = func_80089CBC(a->unk98, i, a->unk1C->unk1C);
        a->unk98[i].unk14[0] = r24->unk30[0];
        a->unk98[i].unk14[1] = r24->unk30[1];
        a->unk98[i].unk14[2] = r24->unk30[2];
    }
}

void func_8008A55C(u32 a, struct Struct802B39C0_B0_child *b, int c, int d);

void func_80089CF4(struct Ape *a, int r29)
{
    struct Struct8003699C_child *r6 = a->unk0;
    float f31 = (float)r6->unk38 / (float)r6->unk3A;
    struct Struct8003699C_child *r28;
    struct Struct8003699C_child *r27;
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
        struct Struct8003699C_child *temp = a->unk0;
        a->unk0 = a->unk4;
        a->unk4 = temp;
    }
    else
    {
        func_80089BD4((void *)&a->unk0->unk81A8);
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
        struct Struct802B39C0_B0_child *var = &a->unk98[i];

        var->unkC = 0;
        var->unk20 = 0;
    }
    func_80089CF4_inline(a);
    for (i = 0; i < a->unk94; i++)
    {
        struct Struct802B39C0_B0_child *r28 = &a->unk98[i];

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

void func_8008A55C(u32 a, struct Struct802B39C0_B0_child *b, int c, int d)
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

void func_8008A7F0_inline(struct Ape *a, struct Struct8003699C_child *b)
{
    struct Struct802B39C0_B0_child *r28;
    int i;
    r28 = a->unk98;

    for (i = 0; i < a->unk94; i++)
        func_8008A55C(a->unk10, r28++, b->unk3A, b->unk38);
}

void func_8008A7F0(struct Ape *a, struct Struct8003699C_child *b)
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
extern s32 lbl_802F207C;
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
#ifdef NONMATCHING
            motInfo[i].unk70[j] = lbl_801C7ADC[j] - lbl_801C7AF4[j];
#else
            motInfo[i].unk70[j] = lbl_801C7ADC[j] - lbl_801C7B1C[j - 10];
#endif
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

u8 lbl_802F12D8[8] = {0x00, 0x00, 0x02, 0x04, 0x06, 0x00, 0x00, 0x00};
u8 lbl_802F12E0[8] = {0x01, 0x01, 0x03, 0x05, 0x07, 0x00, 0x00, 0x00};

void func_8008C924();
void func_80035F18();

#ifdef NONMATCHING

struct Blah
{
    u8 filler0[0x84];
    u8 filler84[0x4114-0x84];
    u8 filler4114[1];
};

void test(struct Blah *r24_, u8 r21)
{
    //r24_ = (u8 *)r26->unk0;
    void *r3 = r24_->filler4114;
    func_80035F18(r3, r24_->filler0, 1, lbl_802F12D8[r21]);
    r3 = r24_->filler84;
    func_80035F18(r3, r24_->filler0, 2, lbl_802F12E0[r21]);
}

void test2(struct Ape *r26, u32 index)
{
    int i;  // r28
    struct Struct801C7824 *r27_;

    index *= 2;
    r27_ = &lbl_801C7824[index];
    // i = r28
    for (i = 0; i < lbl_801C63C0[r26->unk10]; i++)  // lbl_8008B6B8
    {
        u8 r24;
        int j;  // r23
        //r0 = lbl_801C63B0[r26->unk10];
        struct Struct801C63B0 *r20 = &lbl_801C63B0[r26->unk10][i];

        for (j = 0; j < 4; j++)
        {
            func_80089A04((void *)r27_, j, (void *)r20);
            r26->unk98[i].unk14[j] = r20->unk30[j];
        }
    }
}

int test3(char *a)
{
    int r23;
    int i;
    for (i = 0, r23 = 0; (u8)i < motSkeleton->unk4; i++)
    {
        if (strcmp(a, motSkeleton->unk0[i].unk14) == 0)
        {
            r23 = i;
            break;
        }
    }
    return r23;
}

void* test5(char *a)
{
    struct Struct80034B50_child *r27 = &motSkeleton->unk0[0];
    int i;
    for (i = 0; i < motSkeleton->unk4; i++)
    {
        if (strcmp(a, motSkeleton->unk0[i].unk14) == 0)
        {
            r27 = &motSkeleton->unk0[i];
            break;
        }
    }
    return r27;
}

struct Ape *func_8008B3B8(char *a, void *unused)
{
    struct Struct8003699C_child *r31;
    struct Struct8003699C_child *r24;
    //struct Struct801C7824 *r27_;
    struct Struct80034B50_child *r27;
    struct Ape *r26 = lbl_802B46B0[lbl_802F2068];
    int i;  // r24
    //u8 *r24_;
    //u8 *r23_;
    int r23;
    int r21;
    //#define r20 i
    int r20;
    r20 = r26->unk70;

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
    //r27 = test5(a);

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

    //test4(r26);
    r26->unk0 = (void *)r24;
    r26->unk4 = (void *)r31;
    r26->unk1C = (void *)lbl_801C7A70;
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
    *(Quaternion *)&r26->unkA0 = (Quaternion){ 0, 0, 0, 1 }; //0x60
    r26->unk58 = 1.0f;
    r26->unk60 = (Quaternion){ 0, 0, 0, 0 };  //0x70
    r26->colorId = 0;
    r26->unk90 = lbl_802F207C;
    //test5(r26);
/*
    r27_ = &lbl_801C7824[r26->unk10 << 1];
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
*/
    test2(r26, r26->unk10);

/*
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
    */
    r23 = test3(a);
    r21 = r23;
    //#define r21 (u8)r23

    /*
    r24_ = (u8 *)r26->unk0;
    func_80035F18(r24_ + 0x4114, r24_, 1, lbl_802F12D8[r21]);
    func_80035F18(r24_ + 0x84,   r24_, 2, lbl_802F12E0[r21]);
    r23_ = (u8 *)r26->unk4;
    r21 = r23;
    func_80035F18(r23_ + 0x4114, r23_, 1, lbl_802F12D8[r21]);
    func_80035F18(r23_ + 0x84,   r23_, 2, lbl_802F12E0[r21]);
    */
    test((void *)r26->unk0, r21);
    r21 = r23;
    test((void *)r26->unk4, r21);

    r26->unkB8 = lbl_8008A10C;
    r26->unkBC = lbl_8008A108;
    r26->unk5C = func_8008D1DC(func_8008C924, (void *)r26, 7);
    lbl_802F2068++;
    return (void *)r26;
}
#else
extern u8 lbl_80171950[];
const float lbl_802F56D0 = -1.0f;
asm struct Ape *func_8008B3B8(char *a, void *unused)
{
    nofralloc
#include "../asm/nonmatchings/func_8008B3B8.s"
}
#pragma peephole on
#endif

void g_make_ape_inline(struct Ape *ape)
{
    int i;
    int j;
    struct Struct801C63B0 *r19;
    int index = ape->unk10 * 2;

    for (i = 0; i < lbl_801C63C0[ape->unk10]; i++)
    {
        r19 = &lbl_801C63B0[ape->unk10][i];
        for (j = 0; j < 4; j++)
        {
            func_80089A04((void *)&lbl_801C7824[index], j, (void *)r19);
            ape->unk98[i].unk14[j] = r19->unk30[j];
        }
    }
}

struct Dunno
{
    u8 filler0[0x180];
    struct Ape_child unk180;
};

struct MotInfo2
{
    u8 filler0[0x38];
    struct Dunno *unk38;
    u8 filler3C[0xB4-0x3C];
};

struct Ape *g_make_ape(int charaId)
{
    struct Ape *ape;
    struct Struct80034F5C_1 *r5;

    ape = func_8008B3B8(motInfo[charaId].unk0, motInfo[charaId].unk18);
    ape->unk10 = charaId & 3;
    ape->unk20 = &((struct MotInfo2 *)&motInfo[charaId])->unk38->unk180;
    ape->unk28 = 1;

    g_make_ape_inline(ape);

    ape->unkB0 = 0;
    g_load_character_graphics(charaId, lbl_802F207C >> 1);
    func_80089CF4(ape, ((struct MotInfo2 *)&motInfo[charaId])->unk38->unk180.unk10);
    func_800355FC(ape->unk0);

    r5 = &ape->unk0->unk81A8;
    r5->unk1A4.x = r5->unk208[0][3];
    r5->unk1A4.y = r5->unk208[1][3];
    r5->unk1A4.z = r5->unk208[2][3];

    ape->unk4->unk81A8.unk208[0][3] = r5->unk1A4.x;
    ape->unk4->unk81A8.unk208[1][3] = r5->unk1A4.y;
    ape->unk4->unk81A8.unk208[2][3] = r5->unk1A4.z;

    return ape;
}

#pragma force_active on
void func_8008B9DC(struct Ape *a, int b)
{
    if (a->unk18 <= 0)
    {
        if (a->unk1C->unkC & (1 << 1))
            a->unk0->unk34 = b;
        else
            func_80089CF4(a, b);
    }
}
#pragma force_active reset

void func_8008BA24(int a)
{
    lbl_802F206C = a;
}

void func_8008BA2C(struct Ape *ape, int b, int c)
{
    struct Ape_child *r6 = ((struct Ape_child *)(((struct MotInfo *)&motInfo[ape->unk10])->unk30[b]));

    ape->unk20 = &r6[c];
    ape->unk28 = b;
    ape->unkB0 = c;
    ape->unk18 = 0;
    func_80089CF4(ape, r6[c].unk10);
    func_800355FC(ape->unk0);
    ape->unkC = 0.0f;
}

#pragma force_active on
void func_8008BAA8(int *a, int *b)
{
    int i;

    if (*b < 4)
        return;
    *a = 10;
    *b -= 4;
    for (i = 0; i < 6; i++)
    {
        if (*b < lbl_801C7B1C[i])
            break;
        *b -= lbl_801C7B1C[i];
        (*a)++;
    }
    *b += lbl_801C7ADC[*a] - lbl_801C7AF4[*a];
}
#pragma force_active reset

float force_lbl_802F56D4() { return 60.0f; }
const double lbl_802F56D8 = 9.9999999392252903e-09;

void func_8008BBD4(struct Ape *ape, int b, int c, int d, float e)
{
    struct MotInfo *r30;
    struct Struct8003699C_child *r7;
    struct Ape_child *r8;
    int r9;
    u32 r10;
    int i;
    struct Ape_child *r5;

    r10 = 0xFFFFFFFF;
    r9 = 0;
    r7 = ape->unk0;
    r30 = &motInfo[ape->unk10];
    r8 = (void *)((struct MotInfo *)r30)->unk30[b];
    switch (b)
    {
    case 7:
        r10 = c;
        func_8008BAA8(&b, &c);
        r8 = (void *)((struct MotInfo *)r30)->unk30[b];
        r9 = c;
        break;
    case 2:
        if (c < 9)
        {
            r9 = c * 3;
            r9++; r9--;  // needed to match
            for (i = 0; i < 2; i++, r9++)
            {
                if (r8[r9].unk0 > e * 216.0f)
                    break;
            }
        }
        else
            r9 = c;
        break;
    case 1:
        if (d != 0)
            r9 = d - 1;
        else
        {
            for (i = 0; r8[i].unk4 == 0; i++, r9++)
            {
                if (r8[i].unk0 > e / 60.0f)
                    break;
            }
            r5 = &r8[r9];
            if (r8[r9].unk4 == 1 && r7->unk32 != r8[r9].unk10)
            {
                if (r7->unk32 != r8[r9 + 1].unk10 || r7->unk38 < r7->unk3A - r5->unk14)
                    r9++;
            }
        }
        break;
    case 4:
        for (i = 2; i > 0; i--)
        {
            if (r8[i].unk0 < e * 216.0f)
                break;
        }
        r9 = i;
        break;
    case 6:
        if (d != 0)
            r9 = d - 1;
        else
        {
            for (i = 0; r8[i].unk4 == 0; i++, r9++)
            {
                if (r8[i].unk0 > e * 216.0f)
                    break;
            }
        }
        break;
    case 0:
        for (i = 0; r8[i].unk4 == 0; i++, r9++)
        {
            if (r8[i].unk0 > e * 216.0f)
                break;
        }
        break;
    case 3:
        break;
    default:
        r9 = c;
        break;
    }
    r8 += r9;
    if (ape->unk1C != r8)
    {
        int r4;

        ape->unk20 = r8;
        ape->unk28 = b;
        if (r10 != 0xFFFFFFFF)
            ape->unkB0 = r10;
        else
            ape->unkB0 = r9;
        func_8008B9DC(ape, r8->unk10);
    }
}

void func_8008BEF8(int a)
{
    lbl_802F207C = a;
}

void func_8008BF00(struct Ape *ape, int b)
{
    int unk;

    if (b >= 4 || b < 0)
        return;
    unk = ape->unk90;
    if (unk >= 2 && b <= 1)
    {
        lbl_802F2090 = 0;
        g_free_character_graphics(ape->unk10, 1);
        g_load_character_graphics(ape->unk10, 0);
    }
    else if (b >= 2 && unk <= 1)
    {
        lbl_802F2090 = 0;
        g_free_character_graphics(ape->unk10, 0);
        g_load_character_graphics(ape->unk10, 1);
    }
    ape->unk90 = b;
}

void func_8008BFB4(struct Ape *ape, int b, int *c, float *d)
{
    *c = ape->unk98[b].unk0;
    *d = ape->unk98[b].unk4;
}

#pragma force_active on
void func_8008BFD8(void) {}
#pragma force_active reset

void func_8008BFDC(struct Ape *ape, u16 b, u16 c)
{
    struct Struct80034F5C_1 *r31;
    struct Struct80034F5C_1 *r30 = &ape->unk0->unk81A8;
    Mtx sp10;

    if ((gamePauseStatus & 0xA) || (ape->unk14 & (1 << 3)))
        return;
    r31 = &r30[5];
    mathutil_mtxA_from_mtx(r30[1].unk208);
    mathutil_mtxA_invert();
    mathutil_mtxA_mult_right(r31->unk208);
    mathutil_mtxA_to_mtx(sp10);
    mathutil_mtxA_from_mtx(r30[1].unk208);
    mathutil_mtxA_rotate_x(b);
    mathutil_mtxA_rotate_y(c);
    mathutil_mtxA_mult_right(sp10);
    mathutil_mtxA_to_mtx(r31->unk208);
}

void func_8008C090(struct Ape *ape, Vec *b)
{
    struct Struct80034F5C_1 *r27 = &ape->unk0->unk81A8;
    Vec sp2C;
    int r3;
    int r27_;
    struct Struct80034F5C_1 *r30;
    float f1;
    Vec sp20;
    Quaternion sp10;

    if ((gamePauseStatus & 0xA) || (ape->unk14 & (1 << 3)))
        return;
    if (!(ape->unk1C->unkC & 1) && (ape->unk14 & (1<<(31-0x19))))
        return;

    r27++;
    mathutil_mtxA_from_quat(&ape->unk60);
    mathutil_mtxA_to_mtx(lbl_802B39C0);
    mathutil_mtxA_mult_right(r27->unk208);
    if (ape->unk10 == 2 && (ape->unk14 & (1<<(31-0x9))))
        mathutil_mtxA_rotate_z(-5461);
    else
        mathutil_mtxA_rotate_z(-16384);
    sp2C.x = b->x - ape->unk30.x;
    sp2C.y = b->y - ape->unk30.y;
    sp2C.z = b->z - ape->unk30.z;
    mathutil_mtxA_rigid_inv_tf_vec(&sp2C, &sp2C);
    mathutil_vec_normalize_len(&sp2C);
    r27_ = (ape->unk1C->unkC & 1) == 0;
    r30 = r27 + 4;
    r3 = sp2C.x < -0.8f;
    if (!r27_)
        ape->unk14 &= ~(1<<(31-0x19));
    if (r3 || r27_)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_from_mtx(lbl_802B39C0);
        mathutil_mtxA_mult_right(r30->unk208);
        mathutil_mtxA_tf_vec_xyz(&sp2C, 1.0f, 0.0f, 0.0f);
        mathutil_mtxA_pop();
        mathutil_mtxA_rigid_inv_tf_vec(&sp2C, &sp2C);
    }
    else if (sp2C.x < 0.09f)
        sp2C = ape->unkA0;
    if (sp2C.y > 0.4f)
        sp2C.y = 0.4f;
    else if (sp2C.y < -0.3f)
        sp2C.y = -0.3f;
    f1 = mathutil_vec_dot_normalized(&sp2C, &ape->unkA0);
    if (f1 > 0.996f || (ape->unk14 & (1<<(31-0x19))))
    {
        ape->unkA0 = sp2C;
        if (r27_)
            ape->unk14 |= (1 << 6);
    }
    else
    {
        float f31;

        f31 = 5.0f;
        if (r27_)
            f31 = 8.0f;
        f31 *= mathutil_sqrt(1.0f - f1 * f1) * 0.8f + 0.4f;
        if (f31 > 6.0f)
            f31 = 6.0f;
        mathutil_vec_normalize_len(&sp2C);
        mathutil_vec_cross_prod(&ape->unkA0, &sp2C, &sp2C);
        mathutil_vec_normalize_len(&sp2C);
        ape->unkAC = 0.0f;
        mathutil_quat_from_axis_angle(&sp10, &sp2C, f31 * 182.04444885253906f);
        mathutil_quat_mult((Quaternion *)&ape->unkA0, &sp10, (Quaternion *)&ape->unkA0);
    }
    mathutil_vec_normalize_len(&ape->unkA0);
    mathutil_mtxA_tf_vec(&ape->unkA0, &sp2C);
    mathutil_mtxA_from_mtx(lbl_802B39C0);
    mathutil_mtxA_mult_right(r30->unk208);
    mathutil_mtxA_rigid_inv_tf_vec(&sp2C, &sp2C);
    sp20.x = 1.0f;
    sp20.y = 0.0f;
    sp20.z = 0.0f;
    mathutil_quat_from_dirs(&sp10, &sp20, &sp2C);
    mathutil_mtxA_from_quat(&sp10);
    mathutil_mtxA_mult_left(r30->unk208);
    mathutil_mtxA_to_mtx(r30->unk208);
}

void func_8008C408(struct Ape *ape, Vec *b)
{
    Vec sp10 = *b;

    sp10.y = 0.0f;
    mathutil_vec_normalize_len(&sp10);
    sp10.x = -sp10.x;
    sp10.z = -sp10.z;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y_sin_cos(-sp10.z, sp10.x);
    ape->unkA0.x = 1.0f;
    ape->unkA0.y = 0.0f;
    ape->unkA0.z = 0.0f;
    mathutil_mtxA_to_quat(&ape->unk60);
}

void func_8008C4A0(float a)
{
    lbl_802F2078 = a;
}

void func_8008C4A8(struct Ape *ape)
{
    struct Struct8003699C_child *r31 = ape->unk0;
    struct Struct8003699C_child *r29;

    if ((gamePauseStatus & 0xA) || (ape->unk14 & (1 << 3)))
        return;

    ape->unk18--;
    ape->unk14 &= ~(1<<(31-0xF));
    func_80085DB0(ape);
    r31->unk40 += r31->unk3C * lbl_802F2078;
    func_8008A7F0(ape, r31);
    if (ape->unkC > 9.9999999392252903e-09f)
    {
        r29 = ape->unk4;
        r31 = ape->unk0;
        if (ape->unk14 & (1<<(31-0x16)))
        {
            r29->unk40 += r29->unk3C;
            if (r29->unk40 >= 1.0f)
            {
                r29->unk38++;
                r29->unk40 -= 1.0f;
            }
            if (r29->unk38 >= r29->unk3A)
            {
                if (ape->unk1C->unkC & (1<<(31-0x1B)))
                    r29->unk38 = ape->unk1C->unk8;
                else
                    r29->unk38 = 1;
                func_800355B8(r29);
            }
            func_800355FC(r29);
            func_8008A2C4(&r31->unk81A8);
            func_8008A2C4(&r29->unk81A8);
            func_8008A3A4(&r31->unk81A8, &r29->unk81A8, ape->unk8 / ape->unkC);
        }
        else
            func_8008A124(&r31->unk81A8, ape->unk8 / ape->unkC);
        ape->unk8 += 1.0f;
        if (ape->unk8 > ape->unkC)
        {
            ape->unkC = 0.0f;
            r31->unk3C = ape->unk1C->unk18;
        }
    }
    func_80036064(r31);
}

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
