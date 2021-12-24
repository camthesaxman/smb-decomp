#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "load.h"

#pragma force_active on

u8 lbl_80205DA0[0xC];
u8 lbl_80205DAC[0x40-0xC];
u8 lzHeader[0x20];

#pragma force_active off

FORCE_BSS_ORDER(lbl_80205DA0)
FORCE_BSS_ORDER(lbl_80205DAC)
FORCE_BSS_ORDER(lzHeader)

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

struct Struct80030F88_sub
{
    s32 unk0;
    u8 filler4[4];
    u32 unk8;
    GXTexObj *unkC;
    u8 filler10[0x20-0x10];
    s32 unk20;
    s32 unk24;
    u8 filler28[0x4C-0x28];
    u32 unk4C;
};

struct Struct80030F88
{
    s32 unk0;
    u32 unk4;
    u8 filler8[4];
   // GXTexObj *unkC;
};

extern void func_8009AD24(int);

void func_80031070(struct Struct80030F88 *a, struct TPL *b);

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

void func_80030F88(struct Struct80030F88 *a)
{
    if (a->unk0 != -1)
    {
        struct Struct80030F88_sub *r5 = (void *)((u8 *)a + 0x18);
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

void func_80031070(struct Struct80030F88 *a, struct TPL *b)
{
    u8 unused[8];

    if (a->unk0 != -1)
    {
        struct Struct80030F88_sub *r30 = (void *)((u8 *)a + 0x18);

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

//const float lbl_802F32E4 = 0.0f;
const float lbl_802F32E8 = 1.0f;
const float lbl_802F32EC = 0.10000000149011612f;
const float lbl_802F32F0 = 20000.0f;
const float lbl_802F32F4 = 100.0f;
const float lbl_802F32F8 = 255.0f;
const double lbl_802F3300 = 4503599627370496.0;
const float lbl_802F3308 = 10430.3779296875f;
