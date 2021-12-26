#include <assert.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "load.h"
#include "mathutil.h"

#pragma force_active on

Vec lbl_80205DA0;
//u8 lbl_80205DAC[0x40-0xC];
struct Struct80205DAC
{
    s32 unk0;  // + 0xC
    u8 unk4;   // + 0x10
    u8 unk5;   // + 0x11
    u8 unk6;   // + 0x12
    u8 unk7;   // + 0x13
    u8 unk8;   // + 0x14
    u8 unk9;   // + 0x15
    u8 unkA;   // + 0x16
    u8 fillerB[1];
    GXTexObj *unkC;  // + 0x18
    u32 unk10;  // + 0x1C
    GXColor unk14;  // + 0x20
    GXColor unk18;  // + 0x24
    //u8 filler1C[0x1C-0x14];
    float unk1C;
    u8 unk20;  // + 2C
    u8 filler21[3];
    u32 unk24;  // + 30
    u8 unk28;  // +34
    u8 filler29[0x34-0x29];
};
struct Struct80205DAC lbl_80205DAC;
u8 lzHeader[0x20];

#pragma force_active off

FORCE_BSS_ORDER(lbl_80205DA0)
FORCE_BSS_ORDER(lbl_80205DAC)
FORCE_BSS_ORDER(lzHeader)

// struct or array? not sure...
float lbl_801B7978[8] = { 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f };

struct NLObj1_child_child_sub
{
    u16 unk0;
    u8 filler2[0x10-0x2];
};

struct NLObj1_child_child
{
    u8 filler0[0xC];
    struct NLObj1_child_child_sub unkC[4];  // unknown size
};

struct NLObj1_child
{
    void **unk0;
    struct NLObj1_child_child *unk4[2];  // unknown size

    GXTexObj *unkC;
};

struct NLObj1
{
    struct NLObj1_child *unk0;
};

struct NLObj2
{
    struct TPL *unk0;
};

void lbl_80033C8C(struct UnkStruct18 *);

#pragma force_active on
void func_80030AC4(float a)
{
    func_8009AD24(a * 6.0f);
}

void func_80030AF8(int a /*unknown*/, int b /*unknown*/)
{
    func_8009AD30(1, a, b, 0);
}

void func_80030B28(int a /*unknown*/, int b /*unknown*/, u32 c)
{
    GXColor sp14;  // also works as u8 array. not sure

    sp14.r = (c >> 16) & 0xFF;
    sp14.g = (c >> 8) & 0xFF;
    sp14.b = (c >> 0) & 0xFF;
    sp14.a = (c >> 24) & 0xFF;
    func_8009AD4C(a, b, &sp14);
}
#pragma force_active off

void func_80030B68(int a /*unknown*/, int b /*unknown*/, u32 c)
{
    GXColor sp14;  // also works as u8 array. not sure

    sp14.r = (c >> 16) & 0xFF;
    sp14.g = (c >> 8) & 0xFF;
    sp14.b = (c >> 0) & 0xFF;
    sp14.a = (c >> 24) & 0xFF;
    func_8009B048(a, b, &sp14);
}

void func_80030BA8(float x)
{
    lbl_801B7978[6] = x;
}

void func_80030BB8(float x, float y, float z)
{
    lbl_801B7978[0] = x;
    lbl_801B7978[1] = y;
    lbl_801B7978[2] = z;
}

BOOL load_nlobj(struct NLObj1 *a, struct NLObj2 *b, char *modelName, char *texName)
{
    int len;
    void **r28_;
    u32 size;
    struct File file;

    if (a->unk0 != NULL)
    {
        OSFree(a->unk0);
        a->unk0 = NULL;
    }
    if (!file_open(modelName, &file))
        return FALSE;
    len = strlen(modelName);
    if (len >= 3 && strcmp(modelName + (len - 3), ".lz") == 0)
    {
        u32 uncompSize;
        void *compressed;
        void *uncompressed;

        if (file_read(&file, lzHeader, 32, 0) < 0)
            return FALSE;
        size = OSRoundUp32B(__lwbrx(lzHeader, 0));
        uncompSize = OSRoundUp32B(__lwbrx(lzHeader, 4));
        uncompressed = OSAlloc(uncompSize);
        if (uncompressed == NULL)
            return FALSE;
        compressed = OSAllocFromHeap(memHeap5, size);
        if (compressed == NULL)
        {
            OSFree(uncompressed);
            return FALSE;
        }
        if (file_read(&file, compressed, size, 0) < 0)
            return FALSE;
        if (file_close(&file) != 1)
            return FALSE;
        lzs_decompress(compressed, uncompressed);
        OSFreeToHeap(memHeap5, compressed);
        a->unk0 = uncompressed;
        if (a->unk0 == NULL)
            return FALSE;
    }
    else
    {
        size = OSRoundUp32B(file_size(&file));
        a->unk0 = OSAlloc(size);
        if (a->unk0 == NULL)
            OSPanic("nl2ngc.c", 476, "cannot OSAlloc");
        file_read(&file, a->unk0, size, 0);
        file_close(&file);
    }

    func_80030E90(a->unk0);
    if (b->unk0 != NULL)
        bitmap_free_tpl(b->unk0);
    b->unk0 = bitmap_load_tpl(texName);
    if (b->unk0 == NULL)
        return FALSE;

    r28_ = a->unk0->unk4;
    while (*r28_ != NULL)
    {
        func_80031070(*r28_, (void *)b->unk0);
        r28_++;
    }
    return TRUE;
}

BOOL func_80030E20(struct NLObj1 *a, struct NLObj2 *b)
{
    u8 unused[8];

    if (a->unk0 != NULL)
    {
        OSFree(a->unk0);
        a->unk0 = NULL;
    }
    if (b->unk0 != NULL)
    {
        bitmap_free_tpl(b->unk0);
        b->unk0 = NULL;
    }
    return TRUE;
}

/*
struct Unk
{
    void *unk0;
    u32 unk4;
};

BOOL func_80030E90(struct NLObj1_child *a)
{
    u32 ***r30 = a->unk4;
    void ***r4;

    while (*r30 != NULL)
    {
        *r30 = OFFSET_TO_PTR(a, *r30);
        (*r30)[-2] = OFFSET_TO_PTR(a, (*r30)[-2]);
        (*r30)[-1] = OFFSET_TO_PTR(a, (*r30)[-1]);
        func_80030F88(*r30);
        r30++;
    }
    a->unk0 = OFFSET_TO_PTR(a, a->unk0);

    r4 = a->unk0;
    while (*r4 != NULL)
    {
        struct Unk *r3;

        *r4 = OFFSET_TO_PTR(a, *r4);
        (*r4)[0] = OFFSET_TO_PTR(a, (*r4)[0]);
        (*r4)[1] = OFFSET_TO_PTR(a, (*r4)[1]);
        r3 = (*r4)[1];
        while (r3->unk0 != 0)
        {
            r3->unk0 = OFFSET_TO_PTR(a, r3->unk0);
            r3++;
        }
        r4++;
    }
    return TRUE;
}
*/
#ifndef NONMATCHING
asm int func_80030E90()
{
    nofralloc
/* 80030E90 0002CDB0  7C 08 02 A6 */	mflr r0
/* 80030E94 0002CDB4  90 01 00 04 */	stw r0, 4(r1)
/* 80030E98 0002CDB8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80030E9C 0002CDBC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80030EA0 0002CDC0  3B E3 00 00 */	addi r31, r3, 0
/* 80030EA4 0002CDC4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80030EA8 0002CDC8  3B DF 00 04 */	addi r30, r31, 4
/* 80030EAC 0002CDCC  48 00 00 3C */	b lbl_80030EE8
lbl_80030EB0:
/* 80030EB0 0002CDD0  80 1E 00 00 */	lwz r0, 0(r30)
/* 80030EB4 0002CDD4  7C 00 FA 14 */	add r0, r0, r31
/* 80030EB8 0002CDD8  90 1E 00 00 */	stw r0, 0(r30)
/* 80030EBC 0002CDDC  80 7E 00 00 */	lwz r3, 0(r30)
/* 80030EC0 0002CDE0  80 03 FF F8 */	lwz r0, -8(r3)
/* 80030EC4 0002CDE4  7C 00 FA 14 */	add r0, r0, r31
/* 80030EC8 0002CDE8  90 03 FF F8 */	stw r0, -8(r3)
/* 80030ECC 0002CDEC  80 7E 00 00 */	lwz r3, 0(r30)
/* 80030ED0 0002CDF0  80 03 FF FC */	lwz r0, -4(r3)
/* 80030ED4 0002CDF4  7C 00 FA 14 */	add r0, r0, r31
/* 80030ED8 0002CDF8  90 03 FF FC */	stw r0, -4(r3)
/* 80030EDC 0002CDFC  80 7E 00 00 */	lwz r3, 0(r30)
/* 80030EE0 0002CE00  48 00 00 A9 */	bl func_80030F88
/* 80030EE4 0002CE04  3B DE 00 04 */	addi r30, r30, 4
lbl_80030EE8:
/* 80030EE8 0002CE08  80 1E 00 00 */	lwz r0, 0(r30)
/* 80030EEC 0002CE0C  28 00 00 00 */	cmplwi r0, 0
/* 80030EF0 0002CE10  40 82 FF C0 */	bne lbl_80030EB0
/* 80030EF4 0002CE14  80 1F 00 00 */	lwz r0, 0(r31)
/* 80030EF8 0002CE18  7C 00 FA 14 */	add r0, r0, r31
/* 80030EFC 0002CE1C  90 1F 00 00 */	stw r0, 0(r31)
/* 80030F00 0002CE20  80 9F 00 00 */	lwz r4, 0(r31)
/* 80030F04 0002CE24  48 00 00 5C */	b lbl_80030F60
lbl_80030F08:
/* 80030F08 0002CE28  80 04 00 00 */	lwz r0, 0(r4)
/* 80030F0C 0002CE2C  7C 00 FA 14 */	add r0, r0, r31
/* 80030F10 0002CE30  90 04 00 00 */	stw r0, 0(r4)
/* 80030F14 0002CE34  80 64 00 00 */	lwz r3, 0(r4)
/* 80030F18 0002CE38  80 03 00 00 */	lwz r0, 0(r3)
/* 80030F1C 0002CE3C  7C 00 FA 14 */	add r0, r0, r31
/* 80030F20 0002CE40  90 03 00 00 */	stw r0, 0(r3)
/* 80030F24 0002CE44  80 64 00 00 */	lwz r3, 0(r4)
/* 80030F28 0002CE48  80 03 00 04 */	lwz r0, 4(r3)
/* 80030F2C 0002CE4C  7C 00 FA 14 */	add r0, r0, r31
/* 80030F30 0002CE50  90 03 00 04 */	stw r0, 4(r3)
/* 80030F34 0002CE54  80 64 00 00 */	lwz r3, 0(r4)
/* 80030F38 0002CE58  80 63 00 04 */	lwz r3, 4(r3)
/* 80030F3C 0002CE5C  48 00 00 14 */	b lbl_80030F50
lbl_80030F40:
/* 80030F40 0002CE60  80 03 00 00 */	lwz r0, 0(r3)
/* 80030F44 0002CE64  7C 00 FA 14 */	add r0, r0, r31
/* 80030F48 0002CE68  90 03 00 00 */	stw r0, 0(r3)
/* 80030F4C 0002CE6C  38 63 00 08 */	addi r3, r3, 8
lbl_80030F50:
/* 80030F50 0002CE70  80 03 00 00 */	lwz r0, 0(r3)
/* 80030F54 0002CE74  28 00 00 00 */	cmplwi r0, 0
/* 80030F58 0002CE78  40 82 FF E8 */	bne lbl_80030F40
/* 80030F5C 0002CE7C  38 84 00 04 */	addi r4, r4, 4
lbl_80030F60:
/* 80030F60 0002CE80  80 04 00 00 */	lwz r0, 0(r4)
/* 80030F64 0002CE84  28 00 00 00 */	cmplwi r0, 0
/* 80030F68 0002CE88  40 82 FF A0 */	bne lbl_80030F08
/* 80030F6C 0002CE8C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80030F70 0002CE90  38 60 00 01 */	li r3, 1
/* 80030F74 0002CE94  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80030F78 0002CE98  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80030F7C 0002CE9C  7C 08 03 A6 */	mtlr r0
/* 80030F80 0002CEA0  38 21 00 18 */	addi r1, r1, 0x18
/* 80030F84 0002CEA4  4E 80 00 20 */	blr
}
#pragma peephole on
#endif

void func_80030F88(struct Struct80031210 *a)
{
    if (a->unk0 != -1)
    {
        struct Struct80031210_sub *r5 = (void *)((u8 *)a + 0x18);
        BOOL r6 = FALSE;
        BOOL r7 = FALSE;
        BOOL r8 = TRUE;
        BOOL r9 = TRUE;

        while (r5->unk0 != 0)
        {
            if (((r5->unk0 >> 24) & 7) != 0)
            {
                r6 = TRUE;
                if (r8 && (r5->unk24 != -1 || r5->unk24 != -3))
                    r8 = FALSE;
            }
            else
            {
                r7 = TRUE;
                if (r9 && (r5->unk24 != -1 || r5->unk24 != -3))
                    r9 = FALSE;
            }
            r5 = (void *)((u8 *)r5 + 0x50 + r5->unk4C);
        }
        if (r6)
            a->unk4 |= 0x100;
        if (r7)
            a->unk4 |= 0x200;
        if (r8)
            a->unk4 |= 0x400;
        if (r9)
            a->unk4 |= 0x800;
    }
}

void func_80031070(struct Struct80031210 *a, struct TPL *b)
{
    u8 unused[8];

    if (a->unk0 != -1)
    {
        struct Struct80031210_sub *r30 = (void *)((u8 *)a + 0x18);

        while (r30->unk0 != 0)
        {
            if (r30->unk20 >= 0)
            {
                u32 r31 = r30->unk8;
                GXTexObj *tobj = &b->texObjs[r30->unk20];
                GXTexWrapMode wrapS, wrapT;
                GXTexFilter minFilt, magFilt;

                if (r31 & (1<<(31-0xF)))
                    wrapS = GXGetTexObjWrapS(tobj);
                else if (r31 & (1<<(31-0xD)))
                    wrapS = GX_MIRROR;
                else
                    wrapS = GX_REPEAT;

                if (r31 & (1<<(31-0x10)))
                    wrapT = GXGetTexObjWrapT(tobj);
                else if (r31 & (1<<(31-0xE)))
                    wrapT = GX_MIRROR;
                else
                    wrapT = GX_REPEAT;

                GXInitTexObj(
                    tobj,  // obj
                    GXGetTexObjData(tobj),  // image_ptr
                    GXGetTexObjWidth(tobj),  // width
                    GXGetTexObjHeight(tobj),  // height
                    GXGetTexObjFmt(tobj),  // format
                    wrapS,  // wrap_s
                    wrapT,  // wrap_t
                    b->texHeaders[r30->unk20].unkC);  // mipmap

                switch (((r31 >> 13) & 0x3))
                {
                case 0:
                    if (GXGetTexObjMipMap(tobj))
                        minFilt = GX_LIN_MIP_NEAR;
                    else
                        minFilt = GX_NEAR;
                    magFilt = GX_NEAR;
                    break;
                default:
                    if (GXGetTexObjMipMap(tobj))
                        minFilt = GX_LIN_MIP_LIN;
                    else
                        minFilt = GX_LINEAR;
                    magFilt = GX_LINEAR;
                    break;
                }

                GXInitTexObjLOD(
                    tobj,  // obj
                    minFilt,  // min_filt
                    magFilt,  // mag_filt
                    0.0f,  // min_lod
                    0.0f,  // max_lod
                    0.0f,  // lod_bias
                    GX_FALSE,  // bias_clamp
                    GX_FALSE,  // do_edge_lod
                    GX_ANISO_1);  // max_aniso
                r30->unkC = tobj;
            }
            r30 = (void *)((u8 *)r30 + 0x50 + r30->unk4C);
        }
    }
}

void func_80031210(struct Struct80031210 *a)
{
    u32 *temp;

    if (a->unk0 != -1)
    {
        lbl_801B7978[7] = lbl_801B7978[6];
        if (lbl_801B7978[6] == 1.0f)
        {
            if (func_80020EB4(&a->unk8, a->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&a->unk8, a->unk14, lbl_801B7978[6]) == 0)
            {
                lbl_801B7978[6] = 1.0f;
                return;
            }
            lbl_801B7978[6] = 1.0f;
        }
        temp = &a->unk4;
        if (a->unk4 & (1<<(31-0x16)))
            func_80033B7C(a);
        if (*temp & (1<<(31-0x17)))
        {
            struct UnkStruct18 *r29;
            int r28 = func_80085698(&a->unk8);
            r29 = func_80085B88(0x5C);

            r29->unk4 = lbl_80033C8C;
            r29->unk8 = a;
            r29->unk3C.x = lbl_801B7978[0];
            r29->unk3C.y = lbl_801B7978[1];
            r29->unk3C.z = lbl_801B7978[2];
            r29->unk48 = func_800223D0();
            r29->unk4C.x = lbl_80205DA0.x;
            r29->unk4C.y = lbl_80205DA0.y;
            r29->unk4C.z = lbl_80205DA0.z;
            r29->unk58 = lbl_802F1EEC;
            mathutil_mtxA_to_mtx(r29->unkC);
            func_80085B78(r28, r29);
        }
    }
}

Mtx lbl_801B79B4 =
{
    {1,  0,  0,  0},
    {0, -1,  0,  1},
    {0,  0,  1,  0},
};

void func_80031350(struct Struct80031210 *a)
{
    struct Struct80031210_sub *r30;

    if (a->unk0 != -1)
    {
        lbl_801B7978[7] = lbl_801B7978[6];
        if (lbl_801B7978[6] == 1.0f)
        {
            if (func_80020EB4(&a->unk8, a->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&a->unk8, a->unk14, lbl_801B7978[6]) == 0)
            {
                lbl_801B7978[6] = 1.0f;
                return;
            }
        }
        if (a->unk4 & (1<<(31-0x1E)))
        {
            g_set_vtx_desc(
                (1 << GX_VA_POS)
              | (1 << GX_VA_CLR0)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 1;
        }
        else
        {
            g_set_vtx_desc(
                (1 << GX_VA_POS)
              | (1 << GX_VA_NRM)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 0;
        }

        func_800317A4();
        GXLoadTexMtxImm(lbl_801B79B4, 0x1E, 1);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);

        r30 = (void *)((u8 *)a + 0x18);
        while (r30->unk0 != 0)
        {
            struct Struct80031210_sub *next;
            void *unknown;

            func_80031A58(r30);
            unknown = ((u8 *)r30 + 0x50);
            next = (void *)((u8 *)r30 + 0x50 + r30->unk4C);
            switch (r30->unk24)
            {
            case -2:
                break;
            case -3:
                func_80032474(unknown, next);
                break;
            default:
                func_8003209C((void *)unknown, (void *)next);
                break;
            }
            r30 = next;
        }
        func_800341B8();
    }
}

void lbl_80033E6C(struct UnkStruct19 *);

void func_800314B8(struct Struct80031210 *a, float b)
{
    struct UnkStruct19 *r29;
    int r28;

    if (a->unk0 != -1)
    {
        lbl_801B7978[7] = lbl_801B7978[6];
        if (lbl_801B7978[6] == 1.0f)
        {
            if (func_80020EB4(&a->unk8, a->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&a->unk8, a->unk14, lbl_801B7978[6]) == 0)
            {
                lbl_801B7978[6] = 1.0f;
                return;
            }
            lbl_801B7978[6] = 1.0f;
        }

        r28 = func_80085698(&a->unk8);
        r29 = func_80085B88(0x60);

        r29->unk4 = lbl_80033E6C;
        r29->unk8 = a;
        r29->unk48 = b;
        r29->unk3C.x = lbl_801B7978[0];
        r29->unk3C.y = lbl_801B7978[1];
        r29->unk3C.z = lbl_801B7978[2];
        r29->unk4C = func_800223D0();
        r29->unk50.x = lbl_80205DA0.x;
        r29->unk50.y = lbl_80205DA0.y;
        r29->unk50.z = lbl_80205DA0.z;
        r29->unk5C = lbl_802F1EEC;
        mathutil_mtxA_to_mtx(r29->unkC);
        func_80085B78(r28, r29);
    }
}

void func_800315E4(struct Struct80031210 *a, float b)
{
    struct Struct80031210_sub *r29;

    if (a->unk0 != -1)
    {
        lbl_801B7978[7] = lbl_801B7978[6];
        if (lbl_801B7978[6] == 1.0f)
        {
            if (func_80020EB4(&a->unk8, a->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&a->unk8, a->unk14, lbl_801B7978[6]) == 0)
            {
                lbl_801B7978[6] = 1.0f;
                return;
            }
        }
        if (a->unk4 & (1<<(31-0x1E)))
        {
            g_set_vtx_desc(
                (1 << GX_VA_POS)
              | (1 << GX_VA_CLR0)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 1;
        }
        else
        {
            g_set_vtx_desc(
                (1 << GX_VA_POS)
              | (1 << GX_VA_NRM)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 0;
        }

        lbl_80205DAC.unk1C = b;
        func_80032A80();
        GXLoadTexMtxImm(lbl_801B79B4, 0x1E, 1);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);

        r29 = (void *)((u8 *)a + 0x18);
        while (r29->unk0 != 0)
        {
            struct Struct80031210_sub *next;
            void *unknown;

            func_80032D44(r29);
            unknown = ((u8 *)r29 + 0x50);
            next = (void *)((u8 *)r29 + 0x50 + r29->unk4C);
            switch (r29->unk24)
            {
            case -2:
                break;
            case -3:
                func_800333F0(unknown, next);
                break;
            default:
                func_8003209C((void *)unknown, (void *)next);
                break;
            }
            r29 = next;
        }
        func_800341B8();
    }
}

void func_80031764(struct Struct80031210 *a)
{
    func_80031210(a);
}

void func_80031784(struct Struct80031210 *a)
{
    func_80031350(a);
}

u8 lbl_801B79E4[] =
{
    0x00, 0x00, 0x00, 0x09,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x0A,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x0D,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0xFF,
    0x00, 0x00, 0x00, 0x01,
};
u8 lbl_801B7A04[] =
{
    0x00, 0x00, 0x00, 0x09,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x04,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x0A,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x04,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x0D,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x04,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0xFF,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x04,
    0x00, 0x00, 0x00, 0x00,
};
u8 lbl_801B7A44[] =
{
    0x00, 0x00, 0x00, 0x09,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x0B,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x0D,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0xFF,
    0x00, 0x00, 0x00, 0x01,
};
u8 lbl_801B7A64[] =
{
    0x00, 0x00, 0x00, 0x09,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x04,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x0B,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x05,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x0D,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x04,
    0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0xFF,
    0x00, 0x00, 0x00, 0x01,
    0x00, 0x00, 0x00, 0x04,
    0x00, 0x00, 0x00, 0x00,
};

void *lbl_801B7AA4[] =
{
    lbl_801B79E4,
    lbl_801B7A04,
    lbl_801B7A44,
    lbl_801B7A64,
};

u32 lbl_801B7AB4[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
u32 lbl_801B7AD4[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
s32 lbl_801B7AF4[] =
{
    GX_NEVER,
    GX_GEQUAL,
    GX_EQUAL,
    GX_GEQUAL,
    GX_LEQUAL,
    GX_NEQUAL,
    GX_LEQUAL,
    GX_ALWAYS
};
u32 lbl_801B7B14[] = { 3, 0, 2, 1, 0 };

extern GXColor lbl_802F1EF4;
extern float lbl_802F1EF8;
extern float lbl_802F1EFC;
extern u32 lbl_802F1EE8;
extern u32 lbl_802F1EF0;

void func_800317A4(void)
{
    GXColor sp8;

    lbl_80205DAC.unk4 = 0;
    lbl_80205DAC.unk5 = 1;
    lbl_80205DAC.unk6 = 0;
    func_8009E110(0, lbl_801B7AB4[1], lbl_801B7AD4[0], 0);
    lbl_80205DAC.unk20 = zMode->compareEnable;
    lbl_80205DAC.unk24 = zMode->compareFunc;
    lbl_80205DAC.unk28 = zMode->updateEnable;
    lbl_80205DAC.unk7 = 4;
    lbl_80205DAC.unk8 = 0;

    if ((!lbl_80205DAC.unk8) != zMode->updateEnable
     || zMode->compareFunc   != lbl_801B7AF4[lbl_80205DAC.unk7]
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, lbl_801B7AF4[lbl_80205DAC.unk7], (!lbl_80205DAC.unk8));
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = lbl_801B7AF4[lbl_80205DAC.unk7];
        zMode->updateEnable  = (!lbl_80205DAC.unk8);
    }

    if (lbl_802F1EEC != 0)
        func_8009E398(lbl_802F1EF0, lbl_802F1EF4, lbl_802F1EF8, lbl_802F1EFC, 0.1f, 20000.0f);
    else
        func_8009E398(0, lbl_802F1EF4, 0.0f, 100.0f, 0.1f, 20000.0f);

    lbl_80205DAC.unkA = 2;
    func_8009E094(lbl_801B7B14[2]);
    lbl_80205DAC.unkC = 0;
    lbl_80205DAC.unk10 = 0;

    lbl_80205DAC.unk14.r = lbl_801B7978[0] * 255.0f;
    lbl_80205DAC.unk14.g = lbl_801B7978[1] * 255.0f;
    lbl_80205DAC.unk14.b = lbl_801B7978[2] * 255.0f;
    lbl_80205DAC.unk14.a = 255;
    GXSetChanMatColor(GX_COLOR0A0, lbl_80205DAC.unk14);

    sp8.r = lbl_80205DAC.unk18.r = 0;
    sp8.g = lbl_80205DAC.unk18.g = 0;
    sp8.b = lbl_80205DAC.unk18.b = 0;
    sp8.a = lbl_80205DAC.unk18.a = lbl_80205DAC.unk14.a;
    GXSetChanAmbColor(GX_COLOR0A0, sp8);

    lbl_80205DAC.unk9 = 0;
    GXSetChanCtrl(
        GX_COLOR0A0,   // chan
        GX_ENABLE,     // enable
        GX_SRC_REG,    // amb_src
        GX_SRC_REG,    // mat_src
        lbl_802F1EE8,  // light_mask
        GX_DF_CLAMP,   // diff_fn
        GX_AF_SPOT);   // attn_fn
    GXSetTevDirect(GX_TEVSTAGE0);
    func_8009E2C8(0, 0, 0);
    func_8009F2C8(1);
    GXSetNumTexGens(1);
    GXSetNumIndStages(0);
    GXSetNumChans(1);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
}

void func_80031A58(struct Struct80031210_sub *a)
{
    struct Struct80031210_sub sp20 = *a;
    GXColor sp1C;
    u32 r28;
    u32 r25;
    u32 r26;
    u32 r27;

    switch ((sp20.unk0 >> 24) & 7)
    {
    case 0:
        if (lbl_80205DAC.unk4 != 0)
        {
            func_8009E110(0, 1, 0, 0);
            lbl_80205DAC.unk4 = 0;
            lbl_80205DAC.unk5 = 1;
            lbl_80205DAC.unk6 = 0;
        }
        break;
    default:
        r25 = sp20.unk8 >> 29;
        r27 = (sp20.unk8 >> 26) & 7;
        if (lbl_80205DAC.unk4 != 2 || lbl_80205DAC.unk5 != r25 || lbl_80205DAC.unk6 != r27)
        {
            func_8009E110(1, lbl_801B7AB4[r25], lbl_801B7AD4[r27], 0);
            lbl_80205DAC.unk4 = 2;
            lbl_80205DAC.unk5 = r25;
            lbl_80205DAC.unk6 = r27;
        }
        break;
    }

    r28 = sp20.unk4 >> 29;
    r26 = sp20.unk4 & 0x4000000;
    if (lbl_80205DAC.unk7 != r28 || lbl_80205DAC.unk8 != r26)
    {
        if ((!r26) != zMode->updateEnable
         || zMode->compareFunc != lbl_801B7AF4[r28]
         || zMode->compareEnable != GX_ENABLE)
        {
            GXSetZMode(GX_ENABLE, lbl_801B7AF4[r28], (!r26));
            zMode->compareEnable = GX_ENABLE;
            zMode->compareFunc   = lbl_801B7AF4[r28];
            zMode->updateEnable  = (!r26);
        }
        lbl_80205DAC.unk7 = r28;
        lbl_80205DAC.unk8 = r26;
    }

    if (lbl_802F1EEC != 0)
        func_8009E398(lbl_802F1EF0, lbl_802F1EF4, lbl_802F1EF8, lbl_802F1EFC, 0.1f, 20000.0f);
    else
        func_8009E398(0, lbl_802F1EF4, 0.0f, 100.0f, 0.1f, 20000.0f);

    if (sp20.unk20 < 0)
    {
        func_8009EFF4(0, 0xFF, 0xFF, 4);
        func_8009EA30(0, 4);
    }
    else
    {
        int r25 = lbl_80205DAC.unk10;

        if (lbl_80205DAC.unkC != sp20.unkC)
        {
            lbl_80205DAC.unkC = sp20.unkC;
            if (--r25 < 0)
                r25 = 7;
            lbl_80205DAC.unk10 = r25;
            func_8009F430(sp20.unkC, r25);
        }
        func_8009EFF4(0, 0, r25, 4);
        switch ((sp20.unk8 >> 6) & 3)
        {
        case 0:
            func_8009EA30(0, 3);
            break;
        case 1:
            func_8009E618(0, 15, 10, 8, 15);
            func_8009E800(0, 0, 0, 0, 1, 0);
            func_8009E70C(0, 7, 7, 7, 4);
            func_8009E918(0, 0, 0, 0, 1, 0);
            break;
        case 2:
            func_8009E618(0, 10, 8, 9, 15);
            func_8009E800(0, 0, 0, 0, 1, 0);
            func_8009E70C(0, 7, 7, 7, 5);
            func_8009E918(0, 0, 0, 0, 1, 0);
            break;
        case 3:
            func_8009E618(0, 15, 10, 8, 15);
            func_8009E800(0, 0, 0, 0, 1, 0);
            func_8009E70C(0, 7, 5, 4, 7);
            func_8009E918(0, 0, 0, 0, 1, 0);
            break;
        }
    }

    sp1C.r = sp20.unk30 * lbl_801B7978[0] * 255.0f;
    sp1C.g = sp20.unk34 * lbl_801B7978[1] * 255.0f;
    sp1C.b = sp20.unk38 * lbl_801B7978[2] * 255.0f;
    sp1C.a = sp20.unk2C * 255.0f;
    if (lbl_80205DAC.unk14.r != sp1C.r
     || lbl_80205DAC.unk14.g != sp1C.g
     || lbl_80205DAC.unk14.b != sp1C.b
     || lbl_80205DAC.unk14.a != sp1C.a)
    {
        GXSetChanMatColor(4, sp1C);
        lbl_80205DAC.unk14 = sp1C;
    }

    sp1C.r = sp20.unk28 * lbl_80205DA0.x * 255.0f;
    sp1C.g = sp20.unk28 * lbl_80205DA0.y * 255.0f;
    sp1C.b = sp20.unk28 * lbl_80205DA0.z * 255.0f;
    sp1C.a = lbl_80205DAC.unk14.a;
    if (lbl_80205DAC.unk18.r != sp1C.r
     || lbl_80205DAC.unk18.g != sp1C.g
     || lbl_80205DAC.unk18.b != sp1C.b
     || lbl_80205DAC.unk18.a != sp1C.a)
    {
        GXSetChanAmbColor(4, sp1C);
        lbl_80205DAC.unk18 = sp1C;
    }

    if (lbl_80205DAC.unk9 != sp20.unk24)
    {
        lbl_80205DAC.unk9 = sp20.unk24;
        switch (sp20.unk24)
        {
        case -1:
            GXSetChanCtrl(4, 0, 0, 0, 0, 2, 1);
            break;
        case -3:
            GXSetChanCtrl(4, 0, 1, 1, 0, 2, 1);
            break;
        case -2:
        default:
            GXSetChanCtrl(4, 1, 0, 0, lbl_802F1EE8, 2, 1);
            break;
        }
    }
}

struct Struct8003209C
{
    u32 unk0;
    u32 unk4;
};

struct SomeVtxStruct
{
    float x, y, z;
    float nx, ny, nz;
    float s, t;
};

void func_8003209C(void *start, void *end)
{
    struct Struct8003209C *dl = start;

    g_set_vtx_desc(
        (1 << GX_VA_POS)
      | (1 << GX_VA_NRM)
      | (1 << GX_VA_TEX0));

    if (lbl_80205DAC.unk0 != 0)
        lbl_80205DAC.unk0 = 0;

    while (dl < (struct Struct8003209C *)end)
    {
        int vtxCount;
        int i;
        struct SomeVtxStruct *vtx;
        u8 *vtxData = (u8 *)dl + 8;
        u8 r4 = dl->unk0 & 3;

        vtxCount = dl->unk4;
        if (lbl_80205DAC.unkA != r4)
        {
            lbl_80205DAC.unkA = r4;
            func_8009E094(lbl_801B7B14[r4]);
        }

        if (dl->unk0 & (1<<(31-0x1B)))
        {
            GXBegin(GX_TRIANGLESTRIP, 0, vtxCount);
            while (vtxCount > 0)
            {
                if (*(u32 *)vtxData & 1)
                {
                    vtx = (void *)vtxData;
                    GXPosition3f32(vtx->x, vtx->y, vtx->z);
                    GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                    GXTexCoord2f32(vtx->s, vtx->t);
                    vtxData += 32;
                }
                else
                {
                    vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                    GXPosition3f32(vtx->x, vtx->y, vtx->z);
                    GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                    GXTexCoord2f32(vtx->s, vtx->t);
                    vtxData += 8;
                }
                vtxCount--;
            }
        }
        else if (dl->unk0 & (1<<(31-0x1C)))
        {
            GXBegin(GX_TRIANGLES, 0, vtxCount * 3);
            while (vtxCount > 0)
            {
                for (i = 0; i < 3; i++)
                {
                    if (*(u32 *)vtxData & 1)
                    {
                        vtx = (void *)vtxData;
                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 32;
                    }
                    else
                    {
                        vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 8;
                    }
                }
                vtxCount--;
            }
        }
        else if (dl->unk0 & (1<<(31-0x1D)))
        {
            GXBegin(GX_QUADS, 0, vtxCount * 4);
            while (vtxCount > 0)
            {
                for (i = 4; i > 0; i--)
                {
                    if (*(u32 *)vtxData & 1)
                    {
                        vtx = (void *)vtxData;
                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 32;
                    }
                    else
                    {
                        vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 8;
                    }
                }
                vtxCount--;
            }
        }
        dl = (void *)vtxData;
    }
}

/*
void func_8003209C(struct Struct8003209C *a, struct Struct8003209C *b)
{
    int r29;
    struct SomeVtxStruct *vtx;
    u32 offset;
    int i;

    g_set_vtx_desc(
        (1 << GX_VA_POS)
      | (1 << GX_VA_NRM)
      | (1 << GX_VA_TEX0));
    if (lbl_80205DAC.unk0 != 0)
        lbl_80205DAC.unk0 = 0;

    while (a < b)
    {
        u8 *ptr = (u8 *)a + 8;  // r28
        u8 r4 = a->unk0 & 3;
        r29 = a->unk4;
        if (lbl_80205DAC.unkA != r4)
        {
            lbl_80205DAC.unkA = r4;
            func_8009E094(lbl_801B7B14[r4]);
        }
        //lbl_80032120
        if (a->unk0 & (1<<(31-0x1B)))
        {
            GXBegin(GX_TRIANGLESTRIP, 0, r29);
            while (r29 > 0)
            {
                if (*(u32 *)ptr & 1)
                {
                    vtx = (void *)ptr;

                    GXPosition3f32(vtx->x, vtx->y, vtx->z);
                    GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                    GXTexCoord2f32(vtx->s, vtx->t);
                    ptr += 32;
                }
                else
                {
                    offset = *(u32 *)(ptr + 4);
                    vtx = (void *)(ptr + offset + 8);

                    GXPosition3f32(vtx->x, vtx->y, vtx->z);
                    GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                    GXTexCoord2f32(vtx->s, vtx->t);
                    ptr += 8;
                }
                r29--;
            }
        }
        //lbl_800321F4
        else if (a->unk0 & (1<<(31-0x1C)))
        {
            GXBegin(GX_TRIANGLES, 0, r29 * 3);
            while (r29 > 0)
            {
                for (i = 0; i < 3; i++)
                {
                    if (*(u32 *)ptr & 1)
                    {
                        vtx = (void *)ptr;

                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                        GXTexCoord2f32(vtx->s, vtx->t);
                        ptr += 32;
                    }
                    else
                    {
                        offset = *(u32 *)(ptr + 4);
                        vtx = (void *)(ptr + offset + 8);

                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                        GXTexCoord2f32(vtx->s, vtx->t);
                        ptr += 8;
                    }
                }
                r29--;
            }
        }
        //lbl_800322D0
        else if (a->unk0 & (1<<(31-0x1D)))
        {
            GXBegin(GX_QUADS, 0, r29 * 4);
            while (r29 > 0)
            {
                //for (i = 0; i < 4; i++)
                for (i = 4; i > 0; i--)
                {
                    if (*(u32 *)ptr & 1)
                    {
                        vtx = (void *)ptr;

                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                        GXTexCoord2f32(vtx->s, vtx->t);
                        ptr += 32;
                    }
                    else
                    {
                        offset = *(u32 *)(ptr + 4);
                        vtx = (void *)(ptr + offset + 8);

                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        GXNormal3f32(vtx->nx, vtx->ny, vtx->nz);
                        GXTexCoord2f32(vtx->s, vtx->t);
                        ptr += 8;
                    }
                }
                r29--;
            }
        }
        a = (void *)ptr;
    }
}
*/

//const float lbl_802F32E4 = 0.0f;
//const float lbl_802F32E8 = 1.0f;
//const float lbl_802F32EC = 0.10000000149011612f;
//const float lbl_802F32F0 = 20000.0f;
//const float lbl_802F32F4 = 100.0f;
//const float lbl_802F32F8 = 255.0f;
const double lbl_802F3300 = 4503599627370496.0;
const float lbl_802F3308 = 10430.3779296875f;
