#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "load.h"
#include "mode.h"

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

extern u8 lbl_802F2074;

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

// bss
u8 lbl_802B39C0[0xCF0];
u8 lbl_802B46B0[0x40];
u32 lbl_802B46F0[8];  // D30
u32 lbl_802B4710[8];  // D50
u32 charaTplSizes[8];  // D70
u32 charaTplAramSizes[8];  // D90
u32 charaGmaSizes[8];  // DB0
u32 charaGmaAramSizes[8];  // DD0
u32 lbl_802B47B0[4];  // DF0
u32 lbl_802B47C0[4];  // E00
u32 lbl_802B47D0[4];  // E10
u8 lbl_802B47E0[0x20];

FORCE_BSS_ORDER(lbl_802B39C0)
FORCE_BSS_ORDER(lbl_802B46B0)

extern u8 lbl_802F209C[8];
extern u8 lbl_802F2094[8];
extern u8 lbl_802F208C;
extern u32 lbl_802F2090;
extern volatile int lbl_802F2070;

struct Struct801C7824
{
    char *unk0;
    u8 filler4[0x24-0x4];
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
        motInfo[i].unkB0 = motInfo;
        for (j = 0; j < 2; j++)
        {
            u32 index = i * 2 + j;
            int fileSize;

            lbl_802B46F0[index] = 0;
            lbl_802B4710[index] = 0;
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
        lbl_802B47D0[i] = 0;
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
