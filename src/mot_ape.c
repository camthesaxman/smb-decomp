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
#include "mot_ape.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "light.h"

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

u32 u_animMatrixIdxToJointIdx[] = { 1, 5, 7, 8, 12, 13, 16, 18, 19, 21, 22, 23, 24, 26, 27 };

// yaw angles for something?
float lbl_801C7ACC[] = { 23.0f, 21.1f, 22.0f, 21.5f };
u32 lbl_801C7ADC[] = { 16, 8, 32, 6, 9, 16, 24, 4, 6, 4, 14, 20, 24, 30, 20, 20 };
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
static Mtx lbl_802B39C0;
static u32 uselessArray[0x20];
static struct Ape apeStructs[16];
static struct Ape *apeStructPtrs[16];

struct GMA *charaGMAs[8];
struct TPL *charaTPLs[8];
u32 charaTplSizes[8];
u32 charaTplAramAddrs[8];
u32 charaGmaSizes[8];
u32 charaGmaAramAddrs[8];
u32 lbl_802B47B0[4];
u32 lbl_802B47C0[4];
struct TPL *lbl_802B47D0[4];
GXTexObj *lbl_802B47E0[4];
struct GMAShape *lbl_802B47F0[4];
struct GMATevLayer *lbl_802B4800[8];
Mtx lbl_802B4820;
Mtx lbl_802B4850[15];
u8 unused802B4B20[0x2D0];
GXTexObj *lbl_802B4DF0[8];

u32 *motLabel;
s32 u_motAnimCount;
struct MotSkeleton *motSkeleton;
struct MotInfo *motInfo;
u8 lbl_802F209C[8];
u8 lbl_802F2094[8];
int lbl_802F2090;
u8 lbl_802F208C;
Mtx **u_animTransformMatrices;
struct NlObj *apeFaceObj;
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
        struct ApeFacePart *faceParts = dunno->facePartInfo[b & 1];

        if (strcmp(faceParts[i].name, c->names[b]) == 0)
        {
            c->unk30[b] = i;
            return;
        }
    }
    printf("obj: %s is nothing.\n", c->names[b]);
    c->unk30[b] = -1;
}

struct Struct8003699C_child *u_create_joints_probably(struct MotSkeletonEntry1 *skel)
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
    u_create_joints_from_skeleton(r30->joints, skel, r30->unk36);
    func_80035FDC(r30);
    func_800355B8(r30);
    func_800355FC(r30);
    return r30;
}

void u_iter_joints_80089BD4(struct AnimJoint *joint)
{
    int i;
    Vec spC;
    struct AnimJoint *var = joint;

    for (i = 0; i < 29; i++)
    {
        if (!(joint->flags & 1))
        {
            joint++;
            continue;
        }
        mathutil_mtxA_from_mtx(joint->transformMtx);
        mathutil_mtxA_to_quat(&joint->unk1B0);
        if (joint->parentIdx != 0xFFFFFFFF)
        {
            struct AnimJoint *parent = &var[joint->parentIdx];

            // find root joint
            while (parent->parentIdx != 0xFFFFFFFF)
            {
                if (parent->flags & 1)
                    break;
                parent = &var[parent->parentIdx];
            }
            mathutil_mtxA_from_mtx(parent->transformMtx);
        }
        else
            mathutil_mtxA_from_identity();
        spC.x = joint->transformMtx[0][3];
        spC.y = joint->transformMtx[1][3];
        spC.z = joint->transformMtx[2][3];
        mathutil_mtxA_rigid_inv_tf_point(&spC, &joint->unk1A4);
        joint++;
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
        ape->flags |= (1 << 9);
    else
        ape->flags &= ~(1 << 9);
    if (ape->unk20 != NULL)
    {
        ape->unk1C = ape->unk20;
        ape->unk20 = NULL;
        r29 = ape->unk1C->unk10;
    }
    if (ape->flags & (1 << 9))
    {
        // swap
        struct Struct8003699C_child *temp = ape->unk0;
        ape->unk0 = ape->unk4;
        ape->unk4 = temp;
    }
    else
    {
        u_iter_joints_80089BD4(ape->unk0->joints);
    }
    r27 = ape->unk0;
    r28 = ape->unk4;
    ape->unk8 = 0.0f;
    ape->unkC2 = 0;
    ape->flags &= ~((1 << 12)|(1 << 13));
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
    if (ape->unkC > 9.9999999392252903e-09f && (ape->flags & (1 << 9)))
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
        var->unk14[3] = 0;
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

void u_iter_joints_8008A124(struct AnimJoint *joint, float b)
{
    int i;
    struct AnimJoint *a = joint;

    for (i = 0; i < 29; i++)
    {
        Vec sp20;
        Quaternion sp10;

        if (!(joint->flags & 1))
        {
            joint++;
            continue;
        }
        mathutil_mtxA_from_mtx(joint->transformMtx);
        mathutil_mtxA_to_quat(&sp10);
        mathutil_quat_slerp(&sp10, &joint->unk1B0, &sp10, b);
        mathutil_quat_normalize(&sp10);
        if (joint->parentIdx != 0xFFFFFFFF)
        {
            struct AnimJoint *parent = &a[joint->parentIdx];

            // find root joint
            while (parent->parentIdx != 0xFFFFFFFF)
            {
                if (parent->flags & 1)
                    break;
                parent = &a[parent->parentIdx];
            }
            mathutil_mtxA_from_mtx(parent->transformMtx);
            mathutil_mtxA_translate(&joint->unk1A4);
        }
        else
        {
            mathutil_mtxA_from_identity();
            sp20.x = joint->unk1A4.x + (joint->transformMtx[0][3] - joint->unk1A4.x) * b;
            sp20.y = joint->unk1A4.y + (joint->transformMtx[1][3] - joint->unk1A4.y) * b;
            sp20.z = joint->unk1A4.z + (joint->transformMtx[2][3] - joint->unk1A4.z) * b;
            mathutil_mtxA_set_translate(&sp20);
        }
        mathutil_mtxA_get_translate_alt(&sp20);
        mathutil_mtxA_from_quat(&sp10);
        mathutil_mtxA_normalize_basis();
        mathutil_mtxA_set_translate(&sp20);
        mathutil_mtxA_to_mtx(joint->transformMtx);
        joint++;
    }
}

void u_iter_joints_8008A2C4(struct AnimJoint *joint)
{
    int i;
    struct AnimJoint *a = joint;

    for (i = 0; i < 29; i++)
    {
        Vec spC;

        if (!(joint->flags & 1))
        {
            joint++;
            continue;
        }
        mathutil_mtxA_from_mtx(joint->transformMtx);
        if (joint->parentIdx != 0xFFFFFFFF)
        {
            struct AnimJoint *parent = &a[joint->parentIdx];

            // find root joint
            while (parent->parentIdx != 0xFFFFFFFF)
            {
                if (parent->flags & 1)
                    break;
                parent = &a[parent->parentIdx];
            }
            mathutil_mtxA_from_mtx(parent->transformMtx);
        }
        else
        {
            mathutil_mtxA_from_identity();
        }
        spC.x = joint->transformMtx[0][3];
        spC.y = joint->transformMtx[1][3];
        spC.z = joint->transformMtx[2][3];
        mathutil_mtxA_rigid_inv_tf_point(&spC, &joint->unk1A4);
        joint++;
    }
}

void u_iter_joints_8008A3A4(struct AnimJoint *r28, struct AnimJoint *r29, float c)
{
    int i;
    struct AnimJoint *a = r28;

    for (i = 0; i < 29; i++)
    {
        Vec sp30;
        Quaternion sp20;
        Vec sp14;

        if (!(r28->flags & 1))
        {
            r28++;
            r29++;
            continue;
        }
        mathutil_mtxA_from_mtx(r29->transformMtx);
        mathutil_mtxA_to_quat(&r29->unk1B0);
        mathutil_mtxA_from_mtx(r28->transformMtx);
        mathutil_mtxA_to_quat(&sp20);
        mathutil_quat_slerp(&sp20, &r29->unk1B0, &sp20, c);
        mathutil_quat_normalize(&sp20);
        if (r28->parentIdx != 0xFFFFFFFF)
        {
            struct AnimJoint *parent = &a[r28->parentIdx];

            // find root joint
            while (parent->parentIdx != 0xFFFFFFFF)
            {
                if (parent->flags & 1)
                    break;
                parent = &a[parent->parentIdx];
            }
            mathutil_mtxA_from_mtx(parent->transformMtx);
            mathutil_mtxA_translate(&r28->unk1A4);
        }
        else
        {
            mathutil_mtxA_from_identity();
            sp14.x = r29->transformMtx[0][3];
            sp14.y = r29->transformMtx[1][3];
            sp14.z = r29->transformMtx[2][3];
            sp30.x = r28->transformMtx[0][3];
            sp30.y = r28->transformMtx[1][3];
            sp30.z = r28->transformMtx[2][3];
            mathutil_scale_ray(&sp14, &sp30, &sp30, c);
            mathutil_mtxA_set_translate(&sp30);
        }
        mathutil_mtxA_get_translate_alt(&sp30);
        mathutil_mtxA_from_quat(&sp20);
        mathutil_mtxA_normalize_basis();
        mathutil_mtxA_set_translate(&sp30);
        mathutil_mtxA_to_mtx(r28->transformMtx);
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
    if (b->unk14[3] < 0 && b->unkC != NULL)
        r8 = 1;
    if (r8)
        b->unk4 = b->unk8;
    if (--b->unk14[3] > 0)
        return;
    if (!r8)
        return;
    if (b->unkC != NULL)
    {
        struct Struct80089CBC *r7 = b->unkC;

        b->unk0 = r7->unk0 & ~(1 << 31);
        b->unk8 = r7->unk8;
        if (r7->unk4 < d)
            b->unk14[3] = (c + r7->unk4) - d;
        else
            b->unk14[3] = r7->unk4 - d;
        if (b->unk14[3] == 0)
            b->unk10 = 0.0f;
        else
            b->unk10 = ((float)b->unk8 - b->unk4) / b->unk14[3];
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
        b->unk14[3] = 0;
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
        if (!(ape->flags & (1 << 13)))
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
        if (!(ape->flags & (1 << 12)))
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
            ape->flags |= 0x2000;
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

void u_free_character_graphics(int chara, int lod)
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

struct GMAShape *next_shape(struct GMAShape *mesh);

void *u_find_some_mesh_with_red(struct GMAModel *model)
{
    struct GMAShape *mesh;
    int i;

    mesh = (void *)((u8 *)model + model->headerSize);
    for (i = 0; i < model->opaqueShapeCount; i++)
    {
        if (mesh->materialColor.r == 0xFF)
            return mesh;
        mesh = next_shape(mesh);
    }
    return NULL;
}

void u_load_character_graphics(int chara, int lod)
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
            model = charaGMAs[index]->modelEntries[apeGfxFileInfo[index].unk1C[i]].model;
            lbl_802B47F0[lod * 2 + i] = u_find_some_mesh_with_red(model);
        }
        lbl_802B4800[index + 0] = NULL;
        lbl_802B4800[index + 1] = NULL;
    }
    else
    {
        struct GMAModel *model1 = charaGMAs[index]->modelEntries[apeGfxFileInfo[index].unk1C[0]].model;
        struct GMAModel *model2 = charaGMAs[index]->modelEntries[apeGfxFileInfo[index].unk1C[1]].model;

        func_8008CBD0(chara, lod, model1, model2);
    }
}

struct Struct8008AE2C
{
    u8 filler0[8];
    u32 unk8;
    u32 unkC;
};

struct GMAShape *next_shape(struct GMAShape *mesh)
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
        uselessArray[i] = 0;
    lbl_802F206C = 1;
    lbl_802F2078 = 1.0f;
    load_character_resources();
    u_animTransformMatrices = u_avdisp_alloc_matrix_lists(30);
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
            // Avoids negative array access to emulate the original behavior
            if (j >= 10)
                motInfo[i].unk70[j] = lbl_801C7ADC[j] - lbl_801C7B1C[j - 10];
            else
                motInfo[i].unk70[j] = lbl_801C7ADC[j] - lbl_801C7ADC[j + 6];
#else
            motInfo[i].unk70[j] = lbl_801C7ADC[j] - lbl_801C7B1C[j - 10];
#endif
            r10 += lbl_801C7ADC[j];
        }
        if (i >= 4)
        {
            strcpy(motInfo[i].skelName, motInfo[0].skelName);
            strcpy(motInfo[i].modelName, motInfo[0].modelName);
        }
    }
}

void u_ape_free(struct Ape *ape)
{
    func_8008D29C(ape->unk5C);
#ifndef TARGET_PC
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
#endif
    apeStructPtrs[--nextApeIndex] = ape;
    u_free_character_graphics(ape->charaId, (ape->unk90 >= 2));
}

u8 lbl_802F12D8[8] = {0, 0, 2, 4, 6, 0, 0, 0};
u8 lbl_802F12E0[8] = {1, 1, 3, 5, 7, 0, 0, 0};

void u_make_ape_inline(struct Ape *ape)
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

    r3 = &r24_->unk4114;
    u_init_something_joints_from_something(r3, r24_, 1, lbl_802F12D8[a]);
    r3 = &r24_->unk84;
    u_init_something_joints_from_something(r3, r24_, 2, lbl_802F12E0[a]);
}

static u8 find_motskl_entry_idx(char *skelName)
{
    u8 i;
    u8 r23;
    for (r23 = 0, i = 0; i < motSkeleton->unk4; i++)
    {
        if (strcmp(skelName, motSkeleton->unk0[i].name) == 0)
        {
            r23 = i;
            break;
        }
    }
    return r23;
}

static void find_motskl_entry(char *skelName, struct MotSkeletonEntry1 **r27)
{
    int i;
    *r27 = &motSkeleton->unk0[0];
    for (i = 0; i < motSkeleton->unk4; i++)
    {
        if (strcmp(skelName, motSkeleton->unk0[i].name) == 0)
        {
            *r27 = &motSkeleton->unk0[i];
            break;
        }
    }
}

struct Ape *u_make_ape_sub(char *skelName, char *modelName /*unused*/)
{
    struct Ape *ape;
    struct Struct8003699C_child *r24;
    struct Struct8003699C_child *r31;
    struct MotSkeletonEntry1 *skel;
    int i;
    u8 r23;
    int r20;

    ape = apeStructPtrs[nextApeIndex];
    r20 = ape->unk70;
    memset(ape, 0, sizeof (*ape));
    ape->unk70 = r20;

    find_motskl_entry(skelName, &skel);

#ifndef TARGET_PC
    r24 = u_create_joints_probably(skel);
    r31 = u_create_joints_probably(skel);
#endif

    ape->unk94 = 5;
    ape->unk98 = OSAllocFromHeap(subHeap, ape->unk94 * sizeof(*ape->unk98));
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
        var->unk14[3] = 0;
    }

    ape->unk0 = r24;
    ape->unk4 = r31;
    ape->unk1C = &lbl_801C7A70;
    ape->unk20 = 0;
    ape->unk8 = 0.0f;
    ape->charaId = 0;
    ape->unkC = 0.0f;
    ape->flags = 0;
    ape->unk18 = 0;
    ape->unk24 = 1;
    ape->unk28 = 0;
    ape->unk9C = 0;
    ape->unkB0 = 0;
    ape->skel = skel;
    ape->unk54 = 0;

    // These really should be assigned using compound literals, but that causes the stack usage to not match.
    { static const Vec v = {0}; Vec v_; ape->unk30 = v_ = v; } //0x3C
    { static const Vec v = {0}; Vec v_; ape->unk3C = v_ = v; } //0x48
    { static const Vec v = {0}; Vec v_; ape->unk48 = v_ = v; } //0x54
    { static const Quaternion q = {1, 0, 0, 0}; Quaternion q_; *(Quaternion *)&ape->unkA0 = q_ = q; } //0x60
    ape->modelScale = 1.0f;
    { static const Quaternion q = {0, 0, 0, 1}; Quaternion q_; ape->unk60 = q_ = q; } //0x70
    ape->colorId = 0;
    ape->unk90 = lbl_802F207C;

    {u8 stackpad[0x10];}

    u_make_ape_inline(ape);
    r23 = find_motskl_entry_idx(skelName);
#ifndef TARGET_PC
    func_8008B3B8_inline_3(r23, ape->unk0);
    r23++;r23--;
    func_8008B3B8_inline_3(r23, ape->unk4);
#endif

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

struct Ape *u_make_ape(int charaId)
{
    struct Ape *ape;
    struct AnimJoint *r5;

    ape = u_make_ape_sub(motInfo[charaId].skelName, motInfo[charaId].modelName);
    ape->charaId = charaId & 3;
    ape->unk20 = &((struct MotInfo2 *)&motInfo[charaId])->unk38->unk180;
    ape->unk28 = 1;

    u_make_ape_inline(ape);

    ape->unkB0 = 0;
    u_load_character_graphics(charaId, lbl_802F207C >> 1);
#ifndef TARGET_PC
    func_80089CF4(ape, ((struct MotInfo2 *)&motInfo[charaId])->unk38->unk180.unk10);
    func_800355FC(ape->unk0);

    r5 = &ape->unk0->joints[0];
    r5->unk1A4.x = r5->transformMtx[0][3];
    r5->unk1A4.y = r5->transformMtx[1][3];
    r5->unk1A4.z = r5->transformMtx[2][3];

    ape->unk4->joints[0].transformMtx[0][3] = r5->unk1A4.x;
    ape->unk4->joints[0].transformMtx[1][3] = r5->unk1A4.y;
    ape->unk4->joints[0].transformMtx[2][3] = r5->unk1A4.z;
#endif
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
    *b += lbl_801C7ADC[*a] - lbl_801C7ADC[6 + *a];
}
#pragma force_active reset

void u_set_ape_anim(struct Ape *ape, int b, int c, int d, float speed)
{
#ifndef TARGET_PC
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
                if (r8[r9].unk0 > speed * 216.0f)
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
                if (r8[i].unk0 > speed / 60.0f)
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
            if (r8[i].unk0 < speed * 216.0f)
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
                if (r8[i].unk0 > speed * 216.0f)
                    break;
            }
        }
        break;
    case 0:
        for (i = 0; r8[i].unk4 == 0; i++, r9++)
        {
            if (r8[i].unk0 > speed * 216.0f)
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
#endif
}

void func_8008BEF8(int a)
{
    lbl_802F207C = a;
}

void u_switch_ape_character_lod_maybe(struct Ape *ape, int b)
{
    int unk;

    if (b >= 4 || b < 0)
        return;
    unk = ape->unk90;
    if (unk >= 2 && b <= 1)
    {
        lbl_802F2090 = 0;
        u_free_character_graphics(ape->charaId, 1);
        u_load_character_graphics(ape->charaId, 0);
    }
    else if (b >= 2 && unk <= 1)
    {
        lbl_802F2090 = 0;
        u_free_character_graphics(ape->charaId, 0);
        u_load_character_graphics(ape->charaId, 1);
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
    struct AnimJoint *r31;
    struct AnimJoint *r30 = ape->unk0->joints;
    Mtx sp10;

    if ((gamePauseStatus & 0xA) || (ape->flags & (1 << 3)))
        return;
    r31 = &r30[5];
    mathutil_mtxA_from_mtx(r30[1].transformMtx);
    mathutil_mtxA_invert();
    mathutil_mtxA_mult_right(r31->transformMtx);
    mathutil_mtxA_to_mtx(sp10);
    mathutil_mtxA_from_mtx(r30[1].transformMtx);
    mathutil_mtxA_rotate_x(b);
    mathutil_mtxA_rotate_y(c);
    mathutil_mtxA_mult_right(sp10);
    mathutil_mtxA_to_mtx(r31->transformMtx);
}

// something related to animation of the head
void func_8008C090(struct Ape *ape, Vec *b)
{
#ifndef TARGET_PC
    struct AnimJoint *r27 = ape->unk0->joints;
    Vec sp2C;
    int r3;
    int r27_;
    struct AnimJoint *r30;
    float f1;
    Vec sp20;
    Quaternion sp10;

    if ((gamePauseStatus & 0xA) || (ape->flags & (1 << 3)))
        return;
    if (!(ape->unk1C->unkC & 1) && (ape->flags & (1 << 6)))
        return;

    r27++;
    mathutil_mtxA_from_quat(&ape->unk60);
    mathutil_mtxA_to_mtx(lbl_802B39C0);
    mathutil_mtxA_mult_right(r27->transformMtx);
    if (ape->charaId == 2 && (ape->flags & (1 << 22)))
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
        ape->flags &= ~(1 << 6);
    if (r3 || r27_)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_from_mtx(lbl_802B39C0);
        mathutil_mtxA_mult_right(r30->transformMtx);
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
    if (f1 > 0.996f || (ape->flags & (1 << 6)))
    {
        ape->unkA0 = sp2C;
        if (r27_)
            ape->flags |= (1 << 6);
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
    mathutil_mtxA_mult_right(r30->transformMtx);
    mathutil_mtxA_rigid_inv_tf_vec(&sp2C, &sp2C);
    sp20.x = 1.0f;
    sp20.y = 0.0f;
    sp20.z = 0.0f;
    mathutil_quat_from_dirs(&sp10, &sp20, &sp2C);
    mathutil_mtxA_from_quat(&sp10);
    mathutil_mtxA_mult_left(r30->transformMtx);
    mathutil_mtxA_to_mtx(r30->transformMtx);
#endif
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

void u_do_ape_anim(struct Ape *ape)
{
#ifndef TARGET_PC
    struct Struct8003699C_child *r31 = ape->unk0;
    struct Struct8003699C_child *r29;

    if ((gamePauseStatus & 0xA) || (ape->flags & (1 << 3)))
        return;

    ape->unk18--;
    ape->flags &= ~(1 << 16);
    func_80085DB0(ape);
    r31->unk40 += r31->unk3C * lbl_802F2078;
    func_8008A7F0(ape, r31);
    if (ape->unkC > 9.9999999392252903e-09f)
    {
        r29 = ape->unk4;
        r31 = ape->unk0;
        if (ape->flags & (1 << 9))
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
            u_iter_joints_8008A2C4(r31->joints);
            u_iter_joints_8008A2C4(r29->joints);
            u_iter_joints_8008A3A4(r31->joints, r29->joints, ape->unk8 / ape->unkC);
        }
        else
            u_iter_joints_8008A124(r31->joints, ape->unk8 / ape->unkC);
        ape->unk8 += 1.0f;
        if (ape->unk8 > ape->unkC)
        {
            ape->unkC = 0.0f;
            r31->unk3C = ape->unk1C->unk18;
        }
    }
    func_80036064(r31);
#endif
}

void u_draw_ape_transformed(struct Ape *ape, struct AnimJoint *joints)
{
    int i;
    u32 index = (ape->unk90 >> 1) + (ape->charaId * 2);
    struct ApeGfxFileInfo *r27 = &apeGfxFileInfo[index];
    struct ApeFacePart *r29 = r27->facePartInfo[ape->unk90 & 1];
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

    // Draw head and hands?
    ptr = sp18;
    for (i = 0; i < r27->partCounts[ape->unk90 & 1]; r29++, ptr++, i++)
    {
        struct AnimJoint *joint = &joints[r29->jointIdx];
        struct GMAModel *model = charaGMAs[index]->modelEntries[r29->modelId].model;

        if (model != NULL)
        {
            mathutil_mtxA_push();
            mathutil_mtxA_mult_right(joint->transformMtx);
            mathutil_mtxA_translate(&r29->unk4);  // positions ears
            u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);

            if (r29->draw != NULL)
                r29->draw(ape, r29, *ptr);
            else
                avdisp_draw_model_unculled_sort_none(model);  // fallback code (not called)?

            mathutil_mtxA_pop();
        }
    }

    // Compute anim transform matrices
    for (i = 0; (u32)i < 15; i++)
    {
        struct AnimJoint *joint = &joints[u_animMatrixIdxToJointIdx[i]];

        if (i == 9 || i == 10 || i == 13 || i == 14)
        {
            mathutil_mtx_mult(joint->transformMtx, lbl_802B4820, lbl_802B4850[i]);
            if (i == 10 || i == 14)
            {
                mathutil_mtxA_push();
                mathutil_mtxA_from_mtx(lbl_802B4850[i]);
                mathutil_mtxA_rotate_z(DEGREES_TO_S16(lbl_801C7ACC[ape->charaId]));
                mathutil_mtxA_to_mtx(lbl_802B4850[i]);
                mathutil_mtxA_pop();
            }
            u_animTransformMatrices[i] = &lbl_802B4850[i];
        }
        else
            u_animTransformMatrices[i] = &joint->transformMtx;
    }

    model = charaGMAs[index]->modelEntries[r27->unk1C[ape->unk90 & 1]].model;
    func_8008CCB8(ape, model);
    avdisp_draw_model_unculled_sort_none(model);  // Draw body, limbs, and hair
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
#ifndef TARGET_PC
    int r3 = (b == 3 || (ape->flags & (1 << 5)));
    u8 dummy[16];

    if (r3)
        return;
    if (ape->unkC1 & (1 << currentCameraStructPtr->unk204))
        return;
    if ((lbl_801EEC90.unk0 & (1 << 2)) && func_8000E4D0(&ape->unk30) < 0.0f)
        return;

    if (ape->flags & (1 << 20))
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
#endif
}

void lbl_8008CA80(struct Struct8008C924 *node)
{
    struct Ape *ape = node->ape;

    func_8008CAAC(ape, node->unk10);
}

void func_8008CAAC(struct Ape *ape, float b)
{
    int r30 = ape->charaId;
    struct AnimJoint *r29 = ape->unk0->joints;
    u8 dummy[8];
    Vec sp10;

    func_8000E1A4(b);

    mathutil_mtxA_push();
    mathutil_mtxA_from_quat(&ape->unk60);
    mathutil_mtxA_to_mtx(lbl_802B39C0);
    mathutil_mtxA_pop();

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&ape->unk30);
    mathutil_mtxA_scale_xyz(ape->modelScale, ape->modelScale, ape->modelScale);
    nl2ngc_set_scale(ape->modelScale);
    mathutil_mtxA_translate(&ape->unk3C);
    mathutil_mtxA_mult_right(lbl_802B39C0);
    sp10.x = ape->unk0->joints[0].transformMtx[0][3];
    sp10.y = ape->unk0->joints[0].transformMtx[1][3];
    sp10.z = ape->unk0->joints[0].transformMtx[2][3];
    if (test_scaled_sphere_in_frustum(&sp10, ape->modelScale * 0.5f, ape->modelScale) != 0)
    {
        apeDummyFuncs[r30](ape);
        u_draw_ape_transformed(ape, r29);
    }
    u_reset_post_mult_color();
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

FORCE_BSS_ORDER(unused802B4B20)

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
