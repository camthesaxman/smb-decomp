#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "gma.h"
#include "gxutil.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "light.h"

struct Struct80089A04
{
    u8 filler0[4];
    char *unk4[11];
    s32 unk30[4];
};

struct Ape_child lbl_801C7A70 =
{
    0.0f,
    0,
    0,
    0,
    1,
    0,
    1.0f,
    0,
};

u32 lbl_801C7A90[] = { 1, 5, 7, 8, 12, 13, 16, 18, 19, 21, 22, 23, 24, 26, 27 };

// yaw angles for something?
float lbl_801C7ACC[] = { 23.0f, 21.1f, 22.0f, 21.5f };

u32 lbl_801C7ADC[] = { 16, 8, 32, 6, 9, 16 };
u32 lbl_801C7AF4[] = { 24, 4, 6, 4, 14, 20, 24, 30, 20, 20 };
s32 lbl_801C7B1C[] = { 0, 4, 6, 14, 6, 10 };

void ape_dummy_1(struct Ape *);
void ape_dummy_2(struct Ape *);
void ape_dummy_3(struct Ape *);
void ape_dummy_4(struct Ape *);

// none of these functions actually do anything
void (*apeDummyFuncs[])(struct Ape *) =
{
    ape_dummy_1,
    ape_dummy_2,
    ape_dummy_3,
    ape_dummy_4,
    ape_dummy_4,
    ape_dummy_4,
    ape_dummy_4,
    ape_dummy_4,
    ape_dummy_4,
    ape_dummy_4,
};

// bss
Mtx lbl_802B39C0;
u32 lbl_802B39C0_30[0x20];
struct Ape apeStructs[16];  // B0
struct Ape *apeStructPtrs[16];  // CF0

FORCE_BSS_ORDER(lbl_802B39C0)
FORCE_BSS_ORDER(lbl_802B39C0_30)
FORCE_BSS_ORDER(apeStructs)
FORCE_BSS_ORDER(apeStructPtrs)

struct GMA *charaGMAs[8];  // D30
struct TPL *charaTPLs[8];  // D50
u32 charaTplSizes[8];  // D70
u32 charaTplAramAddrs[8];  // D90
u32 charaGmaSizes[8];  // DB0
u32 charaGmaAramAddrs[8];  // DD0
u32 lbl_802B47B0[4];  // DF0
u32 lbl_802B47C0[4];  // E00
struct TPL *lbl_802B47D0[4];  // E10
GXTexObj *lbl_802B47E0[4];  // E20
struct GMAShape *lbl_802B47F0[4];  // E30
struct GMATevLayer *lbl_802B4800[8];  // E40
Mtx lbl_802B4820;  // E60
Mtx lbl_802B4850[15];  // E90
u8 lbl_802B4B20[0x2D0];
GXTexObj *lbl_802B4DF0[8];

u32 *motLabel;
s32 lbl_802F20AC;
struct MotSkeleton *motSkeleton;
struct MotInfo *motInfo;
u8 lbl_802F209C[8];
u8 lbl_802F2094[8];
int lbl_802F2090;
u8 lbl_802F208C;
void **lbl_802F2088;
struct NaomiObj *apeFaceObj;
struct TPL *apeFaceTpl;
s32 lbl_802F207C;
float lbl_802F2078;
s8 lbl_802F2074;
volatile int transferInProgress;
s32 lbl_802F206C;
u32 nextApeIndex;

static void aram_transfer_callback(u32 a)
{
    transferInProgress = FALSE;
}

void load_character_resources(void)
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
    oldHeap = OSSetCurrentHeap(charaHeap);
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
            baseLen = strlen(apeGfxFileInfo[index].basename);
            strcpy(filename, apeGfxFileInfo[index].basename);
            suffix = filename + baseLen;

            strcpy(suffix, ".tpl.lz");
            if (file_open(filename, &file) == 0)
            {
                printf("No Chara Texture <%s>\n", apeGfxFileInfo[index].basename);
                OSPanic("mot_ape.c", 250, "Stopped...\n");
            }
            fileSize = OSRoundUp32B(file_size(&file));
            compressed = OSAllocFromHeap(mainHeap, fileSize);
            if (compressed == NULL)
                OSPanic("mot_ape.c", 254, "cannot OSAlloc");
            file_read(&file, compressed, fileSize, 0);
            charaTplSizes[index] = __lwbrx(compressed, 4);
            aramTop -= charaTplSizes[index];
            if (aramTop < 0xB00000)
                OSPanic("mot_ape.c", 260, "Not enough ARAM for CharacterModel.\n");
            charaTplAramAddrs[index] = aramTop;
            lzs_decompress(compressed, work);
            OSFreeToHeap(mainHeap, compressed);
            DCStoreRange(work, charaTplSizes[index]);
            transferInProgress = TRUE;
            ARQPostRequest(
                &arqReq,
                0,
                ARQ_TYPE_MRAM_TO_ARAM,
                ARQ_PRIORITY_HIGH,
                (uintptr_t)work,
                aramTop,
                (((charaTplSizes[index] - 1) >> 2) + 1) << 2,
                aram_transfer_callback);
            while (transferInProgress != 0)
                ;
            file_close(&file);

            strcpy(suffix, ".gma.lz");
            if (file_open(filename, &file) == 0)
            {
                printf("No Chara Model <%s>\n", apeGfxFileInfo[index].basename);
                OSPanic("mot_ape.c", 277, "Stopped...\n");
            }
            fileSize = OSRoundUp32B(file_size(&file));
            compressed = OSAllocFromHeap(mainHeap, fileSize);
            if (compressed == NULL)
                OSPanic("mot_ape.c", 281, "cannot OSAlloc");
            file_read(&file, compressed, fileSize, 0);
            charaGmaSizes[index] = __lwbrx(compressed, 4);
            aramTop -= charaGmaSizes[index];
            if (aramTop < 0xB00000)
                OSPanic("mot_ape.c", 287, "Not enough ARAM for CharacterModel.\n");
            charaGmaAramAddrs[index] = aramTop;
            lzs_decompress(compressed, work);
            DCStoreRange(work, charaGmaSizes[index]);
            OSFreeToHeap(mainHeap, compressed);
            transferInProgress = TRUE;
            ARQPostRequest(
                &arqReq,
                0,
                ARQ_TYPE_MRAM_TO_ARAM,
                ARQ_PRIORITY_HIGH,
                (uintptr_t)work,
                aramTop,
                (((charaGmaSizes[index] - 1) >> 2) + 1) << 2,
                aram_transfer_callback);
            while (transferInProgress != 0)
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
            compressed = OSAllocFromHeap(mainHeap, fileSize);
            if (compressed == NULL)
                OSPanic("mot_ape.c", 311, "cannot OSAlloc");
            file_read(&file, compressed, fileSize, 0);
            lbl_802B47B0[i] = __lwbrx(compressed, 4);
            aramTop -= lbl_802B47B0[i];
            lbl_802B47C0[i] = aramTop;
            lzs_decompress(compressed, work);
            DCStoreRange(work, lbl_802B47B0[i]);
            OSFreeToHeap(mainHeap, compressed);
            transferInProgress = 1;
            ARQPostRequest(
                &arqReq,
                0,
                ARQ_TYPE_MRAM_TO_ARAM,
                ARQ_PRIORITY_HIGH,
                (uintptr_t)work,
                aramTop,
                (((lbl_802B47B0[i] - 1) >> 2) + 1) << 2,
                aram_transfer_callback);
            while (transferInProgress != 0)
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

void func_80089A04(struct ApeGfxFileInfo *a, int b, struct Struct80089A04 *c)
{
    int i;
    struct ApeGfxFileInfo *dunno = &a[(b >> 1) & 1];

    for (i = 0; i < dunno->partCounts[b & 1]; i++)
    {
        struct ApeFacePart *facePart = dunno->facePartInfo[b & 1];

        if (strcmp(facePart->unk14[i].unk0, c->unk4[b]) == 0)
        {
            c->unk30[b] = i;
            return;
        }
    }
    printf("obj: %s is nothing.\n", c->unk4[b]);
    c->unk30[b] = -1;
}

struct Struct8003699C_child *g_create_joints_probably(struct Struct80034B50_child *a)
{
    struct Struct8003699C_child *r30;

    if (gameSubmode == SMD_MINI_BILLIARDS_INIT || gameSubmode == SMD_MINI_BILLIARDS_MAIN)
    {
        lbl_802F2074 = 2;
        r30 = OSAllocFromHeap(backgroundHeap, sizeof(*r30));
    }
    else
    {
        lbl_802F2074 = 0;
        r30 = OSAllocFromHeap(subHeap, sizeof(*r30));
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
    func_800341BC(r30->unk81A8, a, r30->unk36);
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

static inline void func_80089CF4_inline(struct Ape *ape)
{
    int i;

    for (i = 0; i < ape->unk94; i++)
    {
        struct Struct80089A04 *r24 = &lbl_801C63B0[ape->charaId][i];

        if (ape->unk98[i].unkC == NULL)
            ape->unk98[i].unkC = func_80089CBC(ape->unk98, i, ape->unk1C->unk1C);
        ape->unk98[i].unk14[0] = r24->unk30[0];
        ape->unk98[i].unk14[1] = r24->unk30[1];
        ape->unk98[i].unk14[2] = r24->unk30[2];
    }
}

void func_80089CF4(struct Ape *ape, int r29)
{
    struct Struct8003699C_child *r6 = ape->unk0;
    float f31 = (float)r6->unk38 / (float)r6->unk3A;
    struct Struct8003699C_child *r28;
    struct Struct8003699C_child *r27;
    u32 i;
    u8 dummy[0x10];

    if (ape->unk1C->unkC & (1 << 2))
        ape->unk14 |= (1 << 9);
    else
        ape->unk14 &= ~(1 << 9);
    if (ape->unk20 != NULL)
    {
        ape->unk1C = ape->unk20;
        ape->unk20 = NULL;
        r29 = ape->unk1C->unk10;
    }
    if (ape->unk14 & (1 << 9))
    {
        // swap
        struct Struct8003699C_child *temp = ape->unk0;
        ape->unk0 = ape->unk4;
        ape->unk4 = temp;
    }
    else
    {
        func_80089BD4(ape->unk0->unk81A8);
    }
    r27 = ape->unk0;
    r28 = ape->unk4;
    ape->unk8 = 0.0f;
    ape->unkC2 = 0;
    ape->unk14 &= ~((1 << 12)|(1 << 13));
    if (lbl_802F206C != 0)
        ape->unkC = ape->unk1C->unk14;
    else
        ape->unkC = 0.0f;
    r27->unk32 = r29;
    r27->unk38 = 1;
    ape->unk24 = ape->unk28;
    ape->unk9C = ape->unkB0;
    ape->unk18 = ape->unkC + 1.0f;
    r27->unk40 = 0.0f;
    func_80035FDC(r27);
    if (r27->unk32 == 0)
        r27->unk32 = 1;
    func_800355B8(r27);
    if (ape->unkC > 9.9999999392252903e-09f && (ape->unk14 & (1 << 9)))
    {
        float f4 = ((float)r28->unk3A / r28->unk3C);

        f4 /= ((float)r27->unk3A / r27->unk3C);

        if (f4 < 1.0f)
        {
            r28->unk3C *= f4;
            r27->unk3C = ape->unk1C->unk18;
        }
        else
            r27->unk3C = ape->unk1C->unk18 / f4;
    }
    else
        r27->unk3C = ape->unk1C->unk18;
    if (ape->unk1C->unkC & (1 << 3))
    {
        r27->unk38 = f31 * r27->unk3A;
        if (r27->unk38 >= r27->unk3A)
            r27->unk38 = 1;
    }
    for (i = 0; i < ape->unk94; i++)
    {
        struct Struct802B39C0_B0_child *var = &ape->unk98[i];

        var->unkC = 0;
        var->unk20 = 0;
    }
    func_80089CF4_inline(ape);
    for (i = 0; i < ape->unk94; i++)
    {
        struct Struct802B39C0_B0_child *r28 = &ape->unk98[i];

        if (r28->unkC != NULL)
            r28->unk10 = 0.0f;
        func_8008A55C(ape->charaId, r28, r27->unk3A, 1);
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

void ape_dummy_1(struct Ape *ape) {}

void ape_dummy_2(struct Ape *ape) {}

void ape_dummy_3(struct Ape *ape) {}

void ape_dummy_4(struct Ape *ape) {}

void func_8008A124(struct Struct80034F5C_1 *r29, float b)
{
    int i;
    struct Struct80034F5C_1 *a = r29;

    for (i = 0; i < 29; i++)
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
            mathutil_mtxA_set_translate(&sp20);
        }
        mathutil_mtxA_get_translate_alt(&sp20);
        mathutil_mtxA_from_quat(&sp10);
        mathutil_mtxA_normalize_basis();
        mathutil_mtxA_set_translate(&sp20);
        mathutil_mtxA_to_mtx(r29->unk208);
        r29++;
    }
}

void func_8008A2C4(struct Struct80034F5C_1 *r29)
{
    int i;
    struct Struct80034F5C_1 *a = r29;

    for (i = 0; i < 29; i++)
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

    for (i = 0; i < 29; i++)
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
            mathutil_mtxA_set_translate(&sp30);
        }
        mathutil_mtxA_get_translate_alt(&sp30);
        mathutil_mtxA_from_quat(&sp20);
        mathutil_mtxA_normalize_basis();
        mathutil_mtxA_set_translate(&sp30);
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

void func_8008A7F0_inline(struct Ape *ape, struct Struct8003699C_child *b)
{
    struct Struct802B39C0_B0_child *r28;
    int i;
    r28 = ape->unk98;

    for (i = 0; i < ape->unk94; i++)
        func_8008A55C(ape->charaId, r28++, b->unk3A, b->unk38);
}

void func_8008A7F0(struct Ape *ape, struct Struct8003699C_child *b)
{
    u8 dummy[16];

    if (b->unk40 >= 1.0f)
    {
        if (!(ape->unk14 & (1 << 13)))
        {
            do
            {
                b->unk38++;
                b->unk40 -= 1.0f;
            } while (b->unk40 >= 1.0f);
        }
        else
            b->unk40 = 0.0f;
        func_8008A7F0_inline(ape, b);
    }
    if (b->unk38 >= b->unk3A)
    {
        if (!(ape->unk14 & (1 << 12)))
        {
            if (ape->unk1C->unkC & (1 << 4))
                b->unk38 = ape->unk1C->unk8;
            else
                b->unk38 = 1;
            ape->unkC2++;
            if (b->unk34 != 0xFFFF)
            {
                b->unk32 = b->unk34;
                b->unk34 = 0xFFFF;
                func_80089CF4(ape, b->unk32);
            }
            else
            {
                func_80035FDC(b);
                func_800355B8(b);
                func_80089CF4_inline(ape);
                func_8008A7F0_inline(ape, b);
            }
        }
        else
        {
            ape->unk14 |= 0x2000;
            if (b->unk34 != 0xFFFF)
            {
                b->unk32 = b->unk34;
                b->unk34 = 0xFFFF;
                func_80089CF4(ape, b->unk32);
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
        oldHeap = OSSetCurrentHeap(charaHeap);
    else
        oldHeap = OSSetCurrentHeap(charaHeap);
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

void *g_find_some_mesh_with_red(struct GMAModel *model)
{
    struct GMAShape *mesh;
    int i;

    mesh = (void *)((u8 *)model + model->headerSize);
    for (i = 0; i < model->opaqueShapeCount; i++)
    {
        if (mesh->materialColor.r == 0xFF)
            return mesh;
        mesh = next_mesh(mesh);
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
        // already loaded
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
            oldHeap = OSSetCurrentHeap(charaHeap);
        }
        else
            OSPanic("mot_ape.c", 1314, "APE Allocate limit over!!\n");
    }
    else
    {
        lbl_802F2094[index] = 0;
        oldHeap = OSSetCurrentHeap(charaHeap);
    }

    if (lbl_802B47C0[chara] != 0)
    {
        lbl_802B47D0[chara] = load_tpl_from_aram(lbl_802B47C0[chara], lbl_802B47B0[chara]);
        lbl_802B47E0[chara] = create_tpl_tex_objs(lbl_802B47D0[chara]);
    }

    charaTPLs[index] = load_tpl_from_aram(charaTplAramAddrs[index], charaTplSizes[index]);
    charaGMAs[index] = load_gma_from_aram(charaGmaAramAddrs[index], charaGmaSizes[index], charaTPLs[index]);
    lbl_802F209C[index]++;
    OSSetCurrentHeap(oldHeap);
    if (chara == 1)
    {
        struct GMAModel *model;
        int i;

        for (i = 0; i < 2; i++)
        {
            model = charaGMAs[index]->modelEntries[apeGfxFileInfo[index].unk1C[i]].modelOffset;
            lbl_802B47F0[lod * 2 + i] = g_find_some_mesh_with_red(model);
        }
        lbl_802B4800[index + 0] = NULL;
        lbl_802B4800[index + 1] = NULL;
    }
    else
    {
        struct GMAModel *model1 = charaGMAs[index]->modelEntries[apeGfxFileInfo[index].unk1C[0]].modelOffset;
        struct GMAModel *model2 = charaGMAs[index]->modelEntries[apeGfxFileInfo[index].unk1C[1]].modelOffset;

        func_8008CBD0(chara, lod, model1, model2);
    }
}

struct Struct8008AE2C
{
    u8 filler0[8];
    u32 unk8;
    u32 unkC;
};

struct GMAShape *next_mesh(struct GMAShape *mesh)
{
    int i;
    u8 *ret = (u8 *)mesh + 0x60;

    for (i = 0; i < 2; i++)
    {
        if (mesh->dispListFlags & (1 << i))
            ret += mesh->dispListSizes[i];
    }
    if (mesh->dispListFlags & ((1 << 2)|(1 << 3)))
    {
        struct Struct8008AE2C *r6 = (void *)ret;

        ret += 0x20;
        ret += r6->unk8;
        ret += r6->unkC;
    }
    return (struct GMAShape *)ret;
}

void mot_ape_init(void)
{
    int i;

    nextApeIndex = 0;
    lbl_802F207C = 1;
    for (i = 0; i < 16; i++)
    {
        apeStructPtrs[i] = &apeStructs[i];
        apeStructs[i].unk70 = i;
    }
    for (i = 0; i < 32; i++)
        lbl_802B39C0_30[i] = 0;
    lbl_802F206C = 1;
    lbl_802F2078 = 1.0f;
    load_character_resources();
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

void g_ape_free(struct Ape *ape)
{
    func_8008D29C(ape->unk5C);
    if (lbl_802F2074 == 2)
    {
        OSFreeToHeap(backgroundHeap, ape->unk0);
        OSFreeToHeap(backgroundHeap, ape->unk4);
    }
    else if (lbl_802F2074 == 1)
    {
        OSFreeToHeap(mainHeap, ape->unk0);
        OSFreeToHeap(mainHeap, ape->unk4);
    }
    else
    {
        OSFreeToHeap(subHeap, ape->unk0);
        OSFreeToHeap(subHeap, ape->unk4);
    }
    OSFreeToHeap(subHeap, ape->unk98);
    apeStructPtrs[--nextApeIndex] = ape;
    g_free_character_graphics(ape->charaId, (ape->unk90 >= 2));
}

u8 lbl_802F12D8[8] = {0, 0, 2, 4, 6, 0, 0, 0};
u8 lbl_802F12E0[8] = {1, 1, 3, 5, 7, 0, 0, 0};

void g_make_ape_inline(struct Ape *ape)
{
    int i;
    int j;
    struct Struct80089A04 *r19;
    int index = ape->charaId * 2;

    for (i = 0; i < lbl_801C63C0[ape->charaId]; i++)
    {
        r19 = &lbl_801C63B0[ape->charaId][i];
        for (j = 0; j < 4; j++)
        {
            func_80089A04(&apeGfxFileInfo[index], j, r19);
            ape->unk98[i].unk14[j] = r19->unk30[j];
        }
    }
}

#pragma force_active on
const Vec unused_80171980 = {1, 0, 0};
#pragma force_active reset

void func_8008B3B8_inline_3(u8 a, struct Struct8003699C_child *r24_)
{
    void *r3;

    r3 = r24_->filler4114;
    func_80035F18(r3, r24_, 1, lbl_802F12D8[a]);
    r3 = r24_->filler84;
    func_80035F18(r3, r24_, 2, lbl_802F12E0[a]);
}

u8 func_8008B3B8_inline_2(char *a)
{
    u8 i;
    u8 r23;
    for (r23 = 0, i = 0; i < motSkeleton->unk4; i++)
    {
        if (strcmp(a, motSkeleton->unk0[i].unk14) == 0)
        {
            r23 = i;
            break;
        }
    }
    return r23;
}

void func_8008B3B8_inline_1(char *a, struct Struct80034B50_child **r27)
{
    int i;
    *r27 = &motSkeleton->unk0[0];
    for (i = 0; i < motSkeleton->unk4; i++)
    {
        if (strcmp(a, motSkeleton->unk0[i].unk14) == 0)
        {
            *r27 = &motSkeleton->unk0[i];
            break;
        }
    }
}

struct Ape *func_8008B3B8(char *a, char *unused)
{
    struct Ape *ape;
    struct Struct8003699C_child *r24;
    struct Struct8003699C_child *r31;
    struct Struct80034B50_child *r27;
    int i;
    u8 r23;
    int r20;

    ape = apeStructPtrs[nextApeIndex];
    r20 = ape->unk70;
    memset(ape, 0, sizeof (*ape));
    ape->unk70 = r20;

    func_8008B3B8_inline_1(a, &r27);

    r24 = g_create_joints_probably(r27);
    r31 = g_create_joints_probably(r27);

    ape->unk94 = 5;
    ape->unk98 = OSAllocFromHeap(subHeap, ape->unk94 * 0x24);
    if (ape->unk98 == NULL)
        OSPanic("mot_ape.c", 1494, "cannot OSAlloc\n");

    for (i = 0; i < ape->unk94; i++)
    {
        struct Struct802B39C0_B0_child *var = &ape->unk98[i];

        var->unk0 = 0x7FFFFFFF;
        var->unk4 = -1.0f;
        var->unk8 = 0;
        var->unkC = 0;
        var->unk10 = 0.0f;
        var->unk20 = 0;
    }

    ape->unk0 = r24;
    ape->unk4 = r31;
    ape->unk1C = &lbl_801C7A70;
    ape->unk20 = 0;
    ape->unk8 = 0.0f;
    ape->charaId = 0;
    ape->unkC = 0.0f;
    ape->unk14 = 0;
    ape->unk18 = 0;
    ape->unk24 = 1;
    ape->unk28 = 0;
    ape->unk9C = 0;
    ape->unkB0 = 0;
    ape->unk2C = r27;
    ape->unk54 = 0;

    // These really should be assigned using compound literals, but that causes the stack usage to not match.
    { static const Vec v = {0}; Vec v_; ape->unk30 = v_ = v; } //0x3C
    { static const Vec v = {0}; Vec v_; ape->unk3C = v_ = v; } //0x48
    { static const Vec v = {0}; Vec v_; ape->unk48 = v_ = v; } //0x54
    { static const Quaternion q = {1, 0, 0, 0}; Quaternion q_; *(Quaternion *)&ape->unkA0 = q_ = q; } //0x60
    ape->unk58 = 1.0f;
    { static const Quaternion q = {0, 0, 0, 1}; Quaternion q_; ape->unk60 = q_ = q; } //0x70
    ape->colorId = 0;
    ape->unk90 = lbl_802F207C;

    {u8 stackpad[0x10];}

    g_make_ape_inline(ape);
    r23 = func_8008B3B8_inline_2(a);
    func_8008B3B8_inline_3(r23, ape->unk0);
    r23++;r23--;
    func_8008B3B8_inline_3(r23, ape->unk4);

    ape->unkB8 = lbl_8008A10C;
    ape->unkBC = lbl_8008A108;
    ape->unk5C = func_8008D1DC(func_8008C924, ape, 7);
    nextApeIndex++;
    return ape;
}

struct MotInfo2_child
{
    u8 filler0[0x180];
    struct Ape_child unk180;
};

struct MotInfo2
{
    u8 filler0[0x38];
    struct MotInfo2_child *unk38;
    u8 filler3C[0xB4-0x3C];
};

float force_lbl_802F56D4() { return 60.0f; }
const double lbl_802F56D8 = 0.0000000099999999392252903;

struct Ape *g_make_ape(int charaId)
{
    struct Ape *ape;
    struct Struct80034F5C_1 *r5;

    ape = func_8008B3B8(motInfo[charaId].unk0, motInfo[charaId].unk18);
    ape->charaId = charaId & 3;
    ape->unk20 = &((struct MotInfo2 *)&motInfo[charaId])->unk38->unk180;
    ape->unk28 = 1;

    g_make_ape_inline(ape);

    ape->unkB0 = 0;
    g_load_character_graphics(charaId, lbl_802F207C >> 1);
    func_80089CF4(ape, ((struct MotInfo2 *)&motInfo[charaId])->unk38->unk180.unk10);
    func_800355FC(ape->unk0);

    r5 = &ape->unk0->unk81A8[0];
    r5->unk1A4.x = r5->unk208[0][3];
    r5->unk1A4.y = r5->unk208[1][3];
    r5->unk1A4.z = r5->unk208[2][3];

    ape->unk4->unk81A8[0].unk208[0][3] = r5->unk1A4.x;
    ape->unk4->unk81A8[0].unk208[1][3] = r5->unk1A4.y;
    ape->unk4->unk81A8[0].unk208[2][3] = r5->unk1A4.z;

    return ape;
}

#pragma force_active on
void func_8008B9DC(struct Ape *ape, int b)
{
    if (ape->unk18 <= 0)
    {
        if (ape->unk1C->unkC & (1 << 1))
            ape->unk0->unk34 = b;
        else
            func_80089CF4(ape, b);
    }
}
#pragma force_active reset

void func_8008BA24(int a)
{
    lbl_802F206C = a;
}

void func_8008BA2C(struct Ape *ape, int b, int c)
{
    struct Ape_child *r6 = ((struct Ape_child *)(((struct MotInfo *)&motInfo[ape->charaId])->unk30[b]));

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
    r30 = &motInfo[ape->charaId];
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
        g_free_character_graphics(ape->charaId, 1);
        g_load_character_graphics(ape->charaId, 0);
    }
    else if (b >= 2 && unk <= 1)
    {
        lbl_802F2090 = 0;
        g_free_character_graphics(ape->charaId, 0);
        g_load_character_graphics(ape->charaId, 1);
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
    struct Struct80034F5C_1 *r30 = ape->unk0->unk81A8;
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
    struct Struct80034F5C_1 *r27 = ape->unk0->unk81A8;
    Vec sp2C;
    int r3;
    int r27_;
    struct Struct80034F5C_1 *r30;
    float f1;
    Vec sp20;
    Quaternion sp10;

    if ((gamePauseStatus & 0xA) || (ape->unk14 & (1 << 3)))
        return;
    if (!(ape->unk1C->unkC & 1) && (ape->unk14 & (1 << 6)))
        return;

    r27++;
    mathutil_mtxA_from_quat(&ape->unk60);
    mathutil_mtxA_to_mtx(lbl_802B39C0);
    mathutil_mtxA_mult_right(r27->unk208);
    if (ape->charaId == 2 && (ape->unk14 & (1 << 22)))
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
        ape->unk14 &= ~(1 << 6);
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
    if (f1 > 0.996f || (ape->unk14 & (1 << 6)))
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
        mathutil_quat_from_axis_angle(&sp10, &sp2C, DEGREES_TO_S16(f31));
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
    ape->unk14 &= ~(1 << 16);
    func_80085DB0(ape);
    r31->unk40 += r31->unk3C * lbl_802F2078;
    func_8008A7F0(ape, r31);
    if (ape->unkC > 9.9999999392252903e-09f)
    {
        r29 = ape->unk4;
        r31 = ape->unk0;
        if (ape->unk14 & (1 << 9))
        {
            r29->unk40 += r29->unk3C;
            if (r29->unk40 >= 1.0f)
            {
                r29->unk38++;
                r29->unk40 -= 1.0f;
            }
            if (r29->unk38 >= r29->unk3A)
            {
                if (ape->unk1C->unkC & (1 << 4))
                    r29->unk38 = ape->unk1C->unk8;
                else
                    r29->unk38 = 1;
                func_800355B8(r29);
            }
            func_800355FC(r29);
            func_8008A2C4(r31->unk81A8);
            func_8008A2C4(r29->unk81A8);
            func_8008A3A4(r31->unk81A8, r29->unk81A8, ape->unk8 / ape->unkC);
        }
        else
            func_8008A124(r31->unk81A8, ape->unk8 / ape->unkC);
        ape->unk8 += 1.0f;
        if (ape->unk8 > ape->unkC)
        {
            ape->unkC = 0.0f;
            r31->unk3C = ape->unk1C->unk18;
        }
    }
    func_80036064(r31);
}

struct Struct8008C674
{
    s16 unk0;
    s16 unk2;
    Vec unk4;
    void (*unk10)();
    u8 filler14[0x20-0x14];
};  // size = 0x20

void g_draw_ape_transformed(struct Ape *ape, struct Struct80034F5C_1 *b)
{
    int i;
    u32 index = (ape->unk90 >> 1) + (ape->charaId * 2);
    struct ApeGfxFileInfo *r27 = &apeGfxFileInfo[index];
    struct Struct8008C674 *r29 = (void *)r27->facePartInfo[ape->unk90 & 1];
    struct GMAModel *model;
    struct Struct802B39C0_B0_child *sp18[10];
    struct Struct802B39C0_B0_child *r6;
    struct Struct802B39C0_B0_child **ptr;
    u8 dummy[8];

    ptr = sp18;
    for (i = 0; i < r27->partCounts[ape->unk90 & 1]; ptr++, i++)
        *ptr = NULL;

    r6 = ape->unk98;
    for (i = 0; i < ape->unk94; r6++, i++)
    {
        if (r6->unk14[ape->unk90] != -1)
           sp18[r6->unk14[ape->unk90]] = r6;
    }

    ptr = sp18;
    for (i = 0; i < r27->partCounts[ape->unk90 & 1]; r29++, ptr++, i++)
    {
        struct Struct80034F5C_1 *r22 = &b[r29->unk2];
        struct GMAModel *model = charaGMAs[index]->modelEntries[r29->unk0].modelOffset;

        if (model != NULL)
        {
            mathutil_mtxA_push();
            mathutil_mtxA_mult_right(r22->unk208);
            mathutil_mtxA_translate(&r29->unk4);
            g_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            if (r29->unk10 != NULL)
                r29->unk10(ape, r29, *ptr);
            else
                avdisp_draw_model_unculled_sort_none(model);
            mathutil_mtxA_pop();
        }
    }

    for (i = 0; (u32)i < 15; i++)
    {
        struct Struct80034F5C_1 *r4 = &b[lbl_801C7A90[i]];

        if (i == 9 || i == 10 || i == 13 || i == 14)
        {
            mathutil_mtx_mult(r4->unk208, lbl_802B4820, lbl_802B4850[i]);
            if (i == 10 || i == 14)
            {
                mathutil_mtxA_push();
                mathutil_mtxA_from_mtx(lbl_802B4850[i]);
                mathutil_mtxA_rotate_z(DEGREES_TO_S16(lbl_801C7ACC[ape->charaId]));
                mathutil_mtxA_to_mtx(lbl_802B4850[i]);
                mathutil_mtxA_pop();
            }
            lbl_802F2088[i] = lbl_802B4850[i];
        }
        else
            lbl_802F2088[i] = r4->unk208;
    }

    model = charaGMAs[index]->modelEntries[r27->unk1C[ape->unk90 & 1]].modelOffset;
    func_8008CCB8(ape, model);
    avdisp_draw_model_unculled_sort_none(model);
}

struct Struct8008C924
{
    struct OrdTblNode node;
    u32 unk8;
    struct Ape *ape;
    float unk10;
};  // 0x14

void lbl_8008CA80(struct Struct8008C924 *);

void func_8008C924(struct Ape *ape, int b)
{
    int r3 = (b == 3 || (ape->unk14 & (1 << 5)));
    u8 dummy[16];

    if (r3)
        return;
    if (ape->unkC1 & (1 << currentCameraStructPtr->unk204))
        return;
    if ((lbl_801EEC90.unk0 & (1 << 2)) && func_8000E4D0(&ape->unk30) < 0.0f)
        return;

    if (ape->unk14 & (1 << 20))
    {
        struct Struct8008C924 *node;
        struct OrdTblNode *entry;

        if (ballInfo[ape->ballId].unk15C[currentCameraStructPtr->unk204] < 1.1920928955078125e-07f)
            return;
        mathutil_mtxA_from_mtxB();
        entry = ord_tbl_get_entry_for_pos(&ape->unk30);
        node = ord_tbl_alloc_node(sizeof(*node));
        node->node.drawFunc = (OrdTblDrawFunc)lbl_8008CA80;
        node->unk8 = peek_light_group();
        node->ape = ape;
        node->unk10 = ballInfo[ape->ballId].unk15C[currentCameraStructPtr->unk204];
        ord_tbl_insert_node(entry, &node->node);
    }
    else
        func_8008CAAC(ape, 1.0f);
}

void lbl_8008CA80(struct Struct8008C924 *node)
{
    struct Ape *ape = node->ape;

    func_8008CAAC(ape, node->unk10);
}

void func_8008CAAC(struct Ape *ape, float b)
{
    int r30 = ape->charaId;
    struct Struct80034F5C_1 *r29 = ape->unk0->unk81A8;
    u8 dummy[8];
    Vec sp10;

    func_8000E1A4(b);

    mathutil_mtxA_push();
    mathutil_mtxA_from_quat(&ape->unk60);
    mathutil_mtxA_to_mtx(lbl_802B39C0);
    mathutil_mtxA_pop();

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&ape->unk30);
    mathutil_mtxA_scale_xyz(ape->unk58, ape->unk58, ape->unk58);
    g_nl2ngc_set_scale(ape->unk58);
    mathutil_mtxA_translate(&ape->unk3C);
    mathutil_mtxA_mult_right(lbl_802B39C0);
    sp10.x = ape->unk0->unk81A8[0].unk208[0][3];
    sp10.y = ape->unk0->unk81A8[0].unk208[1][3];
    sp10.z = ape->unk0->unk81A8[0].unk208[2][3];
    if (g_test_scaled_sphere_in_frustum(&sp10, ape->unk58 * 0.5f, ape->unk58) != 0)
    {
        apeDummyFuncs[r30](ape);
        g_draw_ape_transformed(ape, r29);
    }
    func_8000E3BC();
}

u16 lbl_801C7D80[] = { 9, 1, 3, 2 };
u16 lbl_801C7D88[] = { 7, 5, 7, 6 };
u16 lbl_801C7D90[] = { 1, 1, 3, 2 };
u16 lbl_801C7D98[] = { 7, 1, 3, 2 };
u16 lbl_801C7DA0[] = { 10, 1, 3, 2 };
u16 lbl_801C7DA8[] = { 4, 9, 11, 10 };

u16 *lbl_801C7DB0[] =
{
    lbl_801C7D80,
    lbl_801C7D88,
    NULL,
    NULL,
    lbl_801C7DA0,
    lbl_801C7DA8,
    lbl_801C7D90,
    lbl_801C7D98,
};

struct GMATevLayer *find_material(struct GMAModel *model, u32 id)
{
    struct GMATevLayer *materials = model->tevLayers;
    int i;

    for (i = 0; i < model->tevLayerCount; i++)
    {
        if (id == materials[i].texIndex)
        {
            materials[i].texObj = &model->texObjs[i];
            materials[i].flags &= ~(1 << 16);
            return &materials[i];
        }
    }
    return NULL;
}

FORCE_BSS_ORDER(lbl_802B4B20)

void func_8008CBD0(int charaId, int lod, struct GMAModel *model1, struct GMAModel *model2)
{
    int i;
    struct GMAModel *models[2];
    u8 dummy[4];
    u32 var = charaId * 2;

    models[0] = model1;
    models[1] = model2;
    for (i = 0; i < 2; i++)
    {
        struct GMATevLayer *mtrl = find_material(models[i], lbl_801C7DB0[var + lod][0]);

        lbl_802B4DF0[var + i] = mtrl->texObj;
        lbl_802B4800[var + i] = mtrl;
    }
}

void func_8008CCB8(struct Ape *ape, struct GMAModel *unused)
{
    u32 index = (ape->charaId * 2) + (ape->unk90 & 1);

    if (lbl_802B4800[index] != NULL)
    {
        struct GMATevLayer *mtrl = lbl_802B4800[index];
        u16 *r7 = lbl_801C7DB0[(ape->charaId * 2) + (ape->unk90 >> 1)];

        if (ape->colorId != 0)
            mtrl->texObj = &lbl_802B47E0[ape->charaId][r7[ape->colorId]];
        else
            mtrl->texObj = lbl_802B4DF0[index];
        mtrl->flags |= (1 << 16);
    }
    else
    {
        GXColor colors[] =
        {
            {0xFF, 0x7F, 0xBF, 0xFF},  // pink
            {0x4C, 0x99, 0xFF, 0xFF},  // blue
            {0xE5, 0xA5, 0x4C, 0xFF},  // orange
            {0x4C, 0xB2, 0x4C, 0xFF},  // green
        };

        lbl_802B47F0[ape->unk90]->materialColor = colors[ape->colorId];
        lbl_802B47F0[ape->unk90]->ambientColor = colors[ape->colorId];
    }
}
