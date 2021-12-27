#include <assert.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "load.h"
#include "mathutil.h"
#include "nl2ngc.h"

struct Color3f g_someAmbColor;

struct
{
    s32 unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 fillerB[1];
    GXTexObj *unkC;
    u32 unk10;
    GXColor matColor;
    GXColor ambColor;
    float unk1C;
    u8 unk20;
    u8 filler21[3];
    u32 unk24;
    u8 unk28;
    u8 filler29[0x34-0x29];
} lbl_80205DAC;

u8 lzHeader[0x20];

FORCE_BSS_ORDER(g_someAmbColor)
FORCE_BSS_ORDER(lbl_80205DAC)
FORCE_BSS_ORDER(lzHeader)

struct
{
    struct Color3f unk0;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
    float unk1C;
} lbl_801B7978 = { { 1.0f, 1.0f, 1.0f }, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f };

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
    lbl_801B7978.unk18 = x;
}

void func_80030BB8(float x, float y, float z)
{
    lbl_801B7978.unk0.r = x;
    lbl_801B7978.unk0.g = y;
    lbl_801B7978.unk0.b = z;
}

BOOL load_nlobj(struct NaomiObj **pobj, struct TPL **ptpl, char *modelName, char *texName)
{
    int len;
    struct NaomiModel **pmodel;
    u32 size;
    struct File file;

    if (*pobj != NULL)
    {
        OSFree(*pobj);
        *pobj = NULL;
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
        *pobj = uncompressed;
        if (*pobj == NULL)
            return FALSE;
    }
    else
    {
        size = OSRoundUp32B(file_size(&file));
        *pobj = OSAlloc(size);
        if (*pobj == NULL)
            OSPanic("nl2ngc.c", 476, "cannot OSAlloc");
        file_read(&file, *pobj, size, 0);
        file_close(&file);
    }

    func_80030E90(*pobj);
    if (*ptpl != NULL)
        bitmap_free_tpl(*ptpl);
    *ptpl = bitmap_load_tpl(texName);
    if (*ptpl == NULL)
        return FALSE;

    pmodel = (*pobj)->modelPtrs;
    while (*pmodel != NULL)
    {
        g_init_naomi_texture(*pmodel, *ptpl);
        pmodel++;
    }
    return TRUE;
}

BOOL free_nlobj(struct NaomiObj **pobj, struct TPL **ptpl)
{
    u8 unused[8];

    if (*pobj != NULL)
    {
        OSFree(*pobj);
        *pobj = NULL;
    }
    if (*ptpl != NULL)
    {
        bitmap_free_tpl(*ptpl);
        *ptpl = NULL;
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

void func_80030F88(struct NaomiModel *model)
{
    if (model->unk0 != -1)
    {
        struct NaomiMesh *mesh = (struct NaomiMesh *)model->meshStart;
        BOOL r6 = FALSE;
        BOOL r7 = FALSE;
        BOOL r8 = TRUE;
        BOOL r9 = TRUE;

        while (mesh->unk0 != 0)
        {
            if (((mesh->unk0 >> 24) & 7) != 0)
            {
                r6 = TRUE;
                if (r8 && (mesh->unk24 != -1 || mesh->unk24 != -3))
                    r8 = FALSE;
            }
            else
            {
                r7 = TRUE;
                if (r9 && (mesh->unk24 != -1 || mesh->unk24 != -3))
                    r9 = FALSE;
            }
            mesh = (struct NaomiMesh *)(mesh->dispListStart + mesh->dispListSize);
        }
        if (r6)
            model->flags |= (1 << 8);
        if (r7)
            model->flags |= (1 << 9);
        if (r8)
            model->flags |= (1 << 10);
        if (r9)
            model->flags |= (1 << 11);
    }
}

void g_init_naomi_texture(struct NaomiModel *model, struct TPL *b)
{
    u8 unused[8];

    if (model->unk0 != -1)
    {
        struct NaomiMesh *mesh = (struct NaomiMesh *)model->meshStart;

        while (mesh->unk0 != 0)
        {
            if (mesh->unk20 >= 0)
            {
                u32 r31 = mesh->unk8;
                GXTexObj *tobj = &b->texObjs[mesh->unk20];
                GXTexWrapMode wrapS, wrapT;
                GXTexFilter minFilt, magFilt;

                if (r31 & (1 << 16))
                    wrapS = GXGetTexObjWrapS(tobj);
                else if (r31 & (1 << 18))
                    wrapS = GX_MIRROR;
                else
                    wrapS = GX_REPEAT;

                if (r31 & (1 << 15))
                    wrapT = GXGetTexObjWrapT(tobj);
                else if (r31 & (1 << 17))
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
                    b->texHeaders[mesh->unk20].unkC);  // mipmap

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
                    tobj,         // obj
                    minFilt,      // min_filt
                    magFilt,      // mag_filt
                    0.0f,         // min_lod
                    0.0f,         // max_lod
                    0.0f,         // lod_bias
                    GX_FALSE,     // bias_clamp
                    GX_FALSE,     // do_edge_lod
                    GX_ANISO_1);  // max_aniso
                mesh->texObj = tobj;
            }
            mesh = (struct NaomiMesh *)(mesh->dispListStart + mesh->dispListSize);
        }
    }
}

void func_80031210(struct NaomiModel *model)
{
    u32 *temp;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (func_80020EB4(&model->unk8, model->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&model->unk8, model->unk14, lbl_801B7978.unk18) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
            lbl_801B7978.unk18 = 1.0f;
        }
        temp = &model->flags;
        if (model->flags & (1 << 9))
            g_draw_naomi_model_3(model);
        if (*temp & (1 << 8))
        {
            struct UnkStruct18 *r29;
            int r28 = func_80085698(&model->unk8);
            r29 = func_80085B88(0x5C);

            r29->unk4 = lbl_80033C8C;
            r29->unk8 = model;
            r29->unk3C.x = lbl_801B7978.unk0.r;
            r29->unk3C.y = lbl_801B7978.unk0.g;
            r29->unk3C.z = lbl_801B7978.unk0.b;
            r29->unk48 = func_800223D0();
            r29->unk4C.r = g_someAmbColor.r;
            r29->unk4C.g = g_someAmbColor.g;
            r29->unk4C.b = g_someAmbColor.b;
            r29->unk58 = lbl_802F1EEC;
            mathutil_mtxA_to_mtx(r29->unkC);
            func_80085B78(r28, r29);
        }
    }
}

Mtx textureMatrix =
{
    {1,  0,  0,  0},
    {0, -1,  0,  1},
    {0,  0,  1,  0},
};

void g_draw_naomi_model_1(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (func_80020EB4(&model->unk8, model->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&model->unk8, model->unk14, lbl_801B7978.unk18) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
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
        GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

        mesh = (struct NaomiMesh *)model->meshStart;
        while (mesh->unk0 != 0)
        {
            struct NaomiDispList *dlstart;
            struct NaomiMesh *next;

            func_80031A58(mesh);
            dlstart = (void *)(mesh->dispListStart);
            next    = (void *)(mesh->dispListStart + mesh->dispListSize);
            switch (mesh->unk24)
            {
            case -2:
                break;
            case -3:
                g_draw_naomi_disp_list_pos_color_tex_1(dlstart, next);
                break;
            default:
                g_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
                break;
            }
            mesh = next;
        }
        func_800341B8();
    }
}

void lbl_80033E6C(struct UnkStruct19 *);

void func_800314B8(struct NaomiModel *model, float b)
{
    struct UnkStruct19 *r29;
    int r28;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (func_80020EB4(&model->unk8, model->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&model->unk8, model->unk14, lbl_801B7978.unk18) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
            lbl_801B7978.unk18 = 1.0f;
        }

        r28 = func_80085698(&model->unk8);
        r29 = func_80085B88(0x60);

        r29->unk4 = lbl_80033E6C;
        r29->unk8 = model;
        r29->unk48 = b;
        r29->unk3C.x = lbl_801B7978.unk0.r;
        r29->unk3C.y = lbl_801B7978.unk0.g;
        r29->unk3C.z = lbl_801B7978.unk0.b;
        r29->unk4C = func_800223D0();
        r29->unk50.r = g_someAmbColor.r;
        r29->unk50.g = g_someAmbColor.g;
        r29->unk50.b = g_someAmbColor.b;
        r29->unk5C = lbl_802F1EEC;
        mathutil_mtxA_to_mtx(r29->unkC);
        func_80085B78(r28, r29);
    }
}

void g_draw_naomi_model_2(struct NaomiModel *model, float b)
{
    struct NaomiMesh *mesh;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (func_80020EB4(&model->unk8, model->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&model->unk8, model->unk14, lbl_801B7978.unk18) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
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
        GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

        mesh = (struct NaomiMesh *)model->meshStart;
        while (mesh->unk0 != 0)
        {
            struct NaomiDispList *dlstart;
            struct NaomiMesh *next;

            func_80032D44(mesh);
            dlstart = (void *)(mesh->dispListStart);
            next    = (void *)(mesh->dispListStart + mesh->dispListSize);
            switch (mesh->unk24)
            {
            case -2:
                break;
            case -3:
                g_draw_naomi_disp_list_pos_color_tex_2(dlstart, next);
                break;
            default:
                g_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
                break;
            }
            mesh = next;
        }
        func_800341B8();
    }
}

void func_80031764(struct NaomiModel *model)
{
    func_80031210(model);
}

void g_call_draw_naomi_model_1(struct NaomiModel *model)
{
    g_draw_naomi_model_1(model);
}

// unused stuff?

u32 lbl_801B79E4[] = { 9, 1, 10, 1, 13, 1, 255, 1 };
u32 lbl_801B7A04[] = { 9, 1, 4, 0, 10, 0, 4, 0, 13, 1, 4, 0, 255, 1, 4, 0 };
u32 lbl_801B7A44[] = { 9, 1, 11, 1, 13, 1, 255, 1 };
u32 lbl_801B7A64[] = { 9, 1, 4, 0, 11, 1, 5, 0, 13, 1, 4, 0, 255, 1, 4, 0 };

void *lbl_801B7AA4[] =
{
    lbl_801B79E4,
    lbl_801B7A04,
    lbl_801B7A44,
    lbl_801B7A64,
};

u32 lbl_801B7AB4[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
u32 lbl_801B7AD4[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
GXCompare naomiToGCCompare[] =
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

void func_800317A4(void)
{
    GXColor ambColor;

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
     || zMode->compareFunc   != naomiToGCCompare[lbl_80205DAC.unk7]
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, naomiToGCCompare[lbl_80205DAC.unk7], (!lbl_80205DAC.unk8));
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = naomiToGCCompare[lbl_80205DAC.unk7];
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

    lbl_80205DAC.matColor.r = lbl_801B7978.unk0.r * 255.0f;
    lbl_80205DAC.matColor.g = lbl_801B7978.unk0.g * 255.0f;
    lbl_80205DAC.matColor.b = lbl_801B7978.unk0.b * 255.0f;
    lbl_80205DAC.matColor.a = 255;
    GXSetChanMatColor(GX_COLOR0A0, lbl_80205DAC.matColor);

    ambColor.r = lbl_80205DAC.ambColor.r = 0;
    ambColor.g = lbl_80205DAC.ambColor.g = 0;
    ambColor.b = lbl_80205DAC.ambColor.b = 0;
    ambColor.a = lbl_80205DAC.ambColor.a = lbl_80205DAC.matColor.a;
    GXSetChanAmbColor(GX_COLOR0A0, ambColor);

    lbl_80205DAC.unk9 = 0;
    GXSetChanCtrl(
        GX_COLOR0A0,   // chan
        GX_ENABLE,     // enable
        GX_SRC_REG,    // amb_src
        GX_SRC_REG,    // mat_src
        nlObjLightMask,  // light_mask
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

void func_80031A58(struct NaomiMesh *pmesh)
{
    struct NaomiMesh mesh = *pmesh;
    GXColor color;
    u32 r28;
    u32 r25;
    u32 r26;
    u32 r27;

    switch ((mesh.unk0 >> 24) & 7)
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
        r25 = mesh.unk8 >> 29;
        r27 = (mesh.unk8 >> 26) & 7;
        if (lbl_80205DAC.unk4 != 2 || lbl_80205DAC.unk5 != r25 || lbl_80205DAC.unk6 != r27)
        {
            func_8009E110(1, lbl_801B7AB4[r25], lbl_801B7AD4[r27], 0);
            lbl_80205DAC.unk4 = 2;
            lbl_80205DAC.unk5 = r25;
            lbl_80205DAC.unk6 = r27;
        }
        break;
    }

    r28 = mesh.unk4 >> 29;
    r26 = mesh.unk4 & 0x4000000;
    if (lbl_80205DAC.unk7 != r28 || lbl_80205DAC.unk8 != r26)
    {
        if ((!r26) != zMode->updateEnable
         || zMode->compareFunc != naomiToGCCompare[r28]
         || zMode->compareEnable != GX_ENABLE)
        {
            GXSetZMode(GX_ENABLE, naomiToGCCompare[r28], (!r26));
            zMode->compareEnable = GX_ENABLE;
            zMode->compareFunc   = naomiToGCCompare[r28];
            zMode->updateEnable  = (!r26);
        }
        lbl_80205DAC.unk7 = r28;
        lbl_80205DAC.unk8 = r26;
    }

    if (lbl_802F1EEC != 0)
        func_8009E398(lbl_802F1EF0, lbl_802F1EF4, lbl_802F1EF8, lbl_802F1EFC, 0.1f, 20000.0f);
    else
        func_8009E398(0, lbl_802F1EF4, 0.0f, 100.0f, 0.1f, 20000.0f);

    if (mesh.unk20 < 0)
    {
        func_8009EFF4(0, 0xFF, 0xFF, 4);
        func_8009EA30(0, 4);
    }
    else
    {
        int r25 = lbl_80205DAC.unk10;

        if (lbl_80205DAC.unkC != mesh.texObj)
        {
            lbl_80205DAC.unkC = mesh.texObj;
            if (--r25 < 0)
                r25 = 7;
            lbl_80205DAC.unk10 = r25;
            func_8009F430(mesh.texObj, r25);
        }
        func_8009EFF4(0, 0, r25, 4);
        switch ((mesh.unk8 >> 6) & 3)
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

    color.r = mesh.unk30 * lbl_801B7978.unk0.r * 255.0f;
    color.g = mesh.unk34 * lbl_801B7978.unk0.g * 255.0f;
    color.b = mesh.unk38 * lbl_801B7978.unk0.b * 255.0f;
    color.a = mesh.unk2C * 255.0f;
    if (lbl_80205DAC.matColor.r != color.r
     || lbl_80205DAC.matColor.g != color.g
     || lbl_80205DAC.matColor.b != color.b
     || lbl_80205DAC.matColor.a != color.a)
    {
        GXSetChanMatColor(GX_COLOR0A0, color);
        lbl_80205DAC.matColor = color;
    }

    color.r = mesh.unk28 * g_someAmbColor.r * 255.0f;
    color.g = mesh.unk28 * g_someAmbColor.g * 255.0f;
    color.b = mesh.unk28 * g_someAmbColor.b * 255.0f;
    color.a = lbl_80205DAC.matColor.a;
    if (lbl_80205DAC.ambColor.r != color.r
     || lbl_80205DAC.ambColor.g != color.g
     || lbl_80205DAC.ambColor.b != color.b
     || lbl_80205DAC.ambColor.a != color.a)
    {
        GXSetChanAmbColor(GX_COLOR0A0, color);
        lbl_80205DAC.ambColor = color;
    }

    if (lbl_80205DAC.unk9 != mesh.unk24)
    {
        lbl_80205DAC.unk9 = mesh.unk24;
        switch (mesh.unk24)
        {
        case -1:
            GXSetChanCtrl(
                GX_COLOR0A0,  // chan
                GX_DISABLE,  // enable
                GX_SRC_REG,  // amb_src
                GX_SRC_REG,  // mat_src
                GX_LIGHT_NULL,  // light_mask
                GX_DF_CLAMP,  // diff_fn
                GX_AF_SPOT);  // attn_fn
            break;
        case -3:
            GXSetChanCtrl(
                GX_COLOR0A0,  // chan
                GX_DISABLE,  // enable
                GX_SRC_VTX,  // amb_src
                GX_SRC_VTX,  // mat_src
                GX_LIGHT_NULL,  // light_mask
                GX_DF_CLAMP,  // diff_fn
                GX_AF_SPOT);  // attn_fn
            break;
        case -2:
        default:
            GXSetChanCtrl(
                GX_COLOR0A0,  // chan
                GX_ENABLE,  // enable
                GX_SRC_REG,  // amb_src
                GX_SRC_REG,  // mat_src
                nlObjLightMask,  // light_mask
                GX_DF_CLAMP,  // diff_fn
                GX_AF_SPOT);  // attn_fn
            break;
        }
    }
}

void g_draw_naomi_disp_list_pos_nrm_tex(struct NaomiDispList *dl, void *end)
{
    g_set_vtx_desc(
        (1 << GX_VA_POS)
      | (1 << GX_VA_NRM)
      | (1 << GX_VA_TEX0));

    if (lbl_80205DAC.unk0 != 0)
        lbl_80205DAC.unk0 = 0;

    while (dl < (struct NaomiDispList *)end)
    {
        int vtxCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithNormal *vtx;
        u8 r4 = dl->unk0 & 3;

        vtxCount = dl->vtxCount;
        if (lbl_80205DAC.unkA != r4)
        {
            lbl_80205DAC.unkA = r4;
            func_8009E094(lbl_801B7B14[r4]);
        }

        if (dl->unk0 & (1 << 4))
        {
            GXBegin(GX_TRIANGLESTRIP, GX_VTXFMT0, vtxCount);
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
            GXEnd();
        }
        else if (dl->unk0 & (1 << 3))
        {
            GXBegin(GX_TRIANGLES, GX_VTXFMT0, vtxCount * 3);
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
            GXEnd();
        }
        else if (dl->unk0 & (1 << 2))
        {
            GXBegin(GX_QUADS, GX_VTXFMT0, vtxCount * 4);
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
            GXEnd();
        }
        dl = (void *)vtxData;
    }
}

void g_draw_naomi_disp_list_pos_color_tex_1(struct NaomiDispList *dl, void *end)
{
    g_set_vtx_desc(
        (1 << GX_VA_POS)
      | (1 << GX_VA_CLR0)
      | (1 << GX_VA_TEX0));

    if (lbl_80205DAC.unk0 != 1)
        lbl_80205DAC.unk0 = 1;

    while (dl < (struct NaomiDispList *)end)
    {
        int vtxCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithColor *vtx;
        u8 r4 = dl->unk0 & 3;

        vtxCount = dl->vtxCount;
        if (lbl_80205DAC.unkA != r4)
        {
            lbl_80205DAC.unkA = r4;
            func_8009E094(lbl_801B7B14[r4]);
        }

        if (dl->unk0 & (1 << 4))
        {
            GXBegin(GX_TRIANGLESTRIP, GX_VTXFMT0, vtxCount);
            while (vtxCount > 0)
            {
                if (*(u32 *)vtxData & 1)
                {
                    u32 color;
                    vtx = (void *)vtxData;
                    GXPosition3f32(vtx->x, vtx->y, vtx->z);
                    color = vtx->color;
                    GXColor4u8(
                        ((color >> 16) & 0xFF) * lbl_801B7978.unk0.r,
                        ((color >>  8) & 0xFF) * lbl_801B7978.unk0.g,
                        ((color >>  0) & 0xFF) * lbl_801B7978.unk0.b,
                        ((color >> 24) & 0xFF));
                    GXTexCoord2f32(vtx->s, vtx->t);
                    vtxData += 32;
                }
                else
                {
                    u32 color;
                    vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                    GXPosition3f32(vtx->x, vtx->y, vtx->z);
                    color = vtx->color;
                    GXColor4u8(
                        ((color >> 16) & 0xFF) * lbl_801B7978.unk0.r,
                        ((color >>  8) & 0xFF) * lbl_801B7978.unk0.g,
                        ((color >>  0) & 0xFF) * lbl_801B7978.unk0.b,
                        ((color >> 24) & 0xFF));
                    GXTexCoord2f32(vtx->s, vtx->t);
                    vtxData += 8;
                }
                vtxCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 3))
        {
            GXBegin(GX_TRIANGLES, GX_VTXFMT0, vtxCount * 3);
            while (vtxCount > 0)
            {
                for (i = 0; i < 3; i++)
                {
                    if (*(u32 *)vtxData & 1)
                    {
                        u32 color;
                        vtx = (void *)vtxData;
                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        color = vtx->color;
                        GXColor4u8(
                            ((color >> 16) & 0xFF) * lbl_801B7978.unk0.r,
                            ((color >>  8) & 0xFF) * lbl_801B7978.unk0.g,
                            ((color >>  0) & 0xFF) * lbl_801B7978.unk0.b,
                            ((color >> 24) & 0xFF));
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 32;
                    }
                    else
                    {
                        u32 color;
                        vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        color = vtx->color;
                        GXColor4u8(
                            ((color >> 16) & 0xFF) * lbl_801B7978.unk0.r,
                            ((color >>  8) & 0xFF) * lbl_801B7978.unk0.g,
                            ((color >>  0) & 0xFF) * lbl_801B7978.unk0.b,
                            ((color >> 24) & 0xFF));
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 8;
                    }
                }
                vtxCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 2))
        {
            GXBegin(GX_QUADS, GX_VTXFMT0, vtxCount * 4);
            while (vtxCount > 0)
            {
                for (i = 4; i > 0; i--)
                {
                    if (*(u32 *)vtxData & 1)
                    {
                        u32 color;
                        vtx = (void *)vtxData;
                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        color = vtx->color;
                        GXColor4u8(
                            ((color >> 16) & 0xFF) * lbl_801B7978.unk0.r,
                            ((color >>  8) & 0xFF) * lbl_801B7978.unk0.g,
                            ((color >>  0) & 0xFF) * lbl_801B7978.unk0.b,
                            ((color >> 24) & 0xFF));
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 32;
                    }
                    else
                    {
                        u32 color;
                        vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                        GXPosition3f32(vtx->x, vtx->y, vtx->z);
                        color = vtx->color;
                        GXColor4u8(
                            ((color >> 16) & 0xFF) * lbl_801B7978.unk0.r,
                            ((color >>  8) & 0xFF) * lbl_801B7978.unk0.g,
                            ((color >>  0) & 0xFF) * lbl_801B7978.unk0.b,
                            ((color >> 24) & 0xFF));
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 8;
                    }
                }
                vtxCount--;
            }
            GXEnd();
        }
        dl = (void *)vtxData;
    }
}

void func_80032A80(void)
{
    GXColor sp18;

    lbl_80205DAC.unk4 = 0;
    lbl_80205DAC.unk5 = 4;
    lbl_80205DAC.unk6 = 5;

    func_8009E110(1, lbl_801B7AB4[4], lbl_801B7AD4[5], 0);

    lbl_80205DAC.unk20 = zMode->compareEnable;
    lbl_80205DAC.unk20 = zMode->compareFunc;  //! mistake?
    lbl_80205DAC.unk28 = zMode->updateEnable;
    lbl_80205DAC.unk7 = 4;
    lbl_80205DAC.unk8 = 0;

    if ((!lbl_80205DAC.unk8) != zMode->updateEnable
     || zMode->compareFunc   != naomiToGCCompare[lbl_80205DAC.unk7]
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, naomiToGCCompare[lbl_80205DAC.unk7], (!lbl_80205DAC.unk8));
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = naomiToGCCompare[lbl_80205DAC.unk7];
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

    lbl_80205DAC.matColor.r = lbl_801B7978.unk0.r * 255.0f;
    lbl_80205DAC.matColor.g = lbl_801B7978.unk0.g * 255.0f;
    lbl_80205DAC.matColor.b = lbl_801B7978.unk0.b * 255.0f;
    lbl_80205DAC.matColor.a = lbl_80205DAC.unk1C * 255.0f;
    GXSetChanMatColor(GX_COLOR0A0, lbl_80205DAC.matColor);

    sp18.r = lbl_80205DAC.ambColor.r = 0;
    sp18.g = lbl_80205DAC.ambColor.g = 0;
    sp18.b = lbl_80205DAC.ambColor.b = 0;
    sp18.a = lbl_80205DAC.ambColor.a = lbl_80205DAC.matColor.a;
    GXSetChanAmbColor(GX_COLOR0A0, sp18);

    lbl_80205DAC.unk9 = 0;
    GXSetChanCtrl(
        GX_COLOR0A0,   // chan
        GX_ENABLE,     // enable
        GX_SRC_REG,    // amb_src
        GX_SRC_REG,    // mat_src
        nlObjLightMask,  // light_mask
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

void func_80032D44(struct NaomiMesh *pmesh)
{
    struct NaomiMesh mesh = *pmesh;
    GXColor color;
    u32 r28;
    u32 r25;
    u32 r26;
    u32 r27;

    switch ((mesh.unk0 >> 24) & 7)
    {
    case 0:
        if (lbl_80205DAC.unk4 != 0)
        {
            func_8009E110(1, 4, 5, 0);
            lbl_80205DAC.unk4 = 0;
            lbl_80205DAC.unk5 = 4;
            lbl_80205DAC.unk6 = 5;
        }
        break;
    default:
        r25 = mesh.unk8 >> 29;
        r27 = (mesh.unk8 >> 26) & 7;
        if (lbl_80205DAC.unk4 != 2 || lbl_80205DAC.unk5 != r25 || lbl_80205DAC.unk6 != r27)
        {
            func_8009E110(1, lbl_801B7AB4[r25], lbl_801B7AD4[r27], 0);
            lbl_80205DAC.unk4 = 2;
            lbl_80205DAC.unk5 = r25;
            lbl_80205DAC.unk6 = r27;
        }
        break;
    }

    r28 = mesh.unk4 >> 29;
    r26 = mesh.unk4 & 0x4000000;
    if (lbl_80205DAC.unk7 != r28 || lbl_80205DAC.unk8 != r26)
    {
        if ((!r26) != zMode->updateEnable
         || zMode->compareFunc != naomiToGCCompare[r28]
         || zMode->compareEnable != GX_ENABLE)
        {
            GXSetZMode(GX_ENABLE, naomiToGCCompare[r28], (!r26));
            zMode->compareEnable = GX_ENABLE;
            zMode->compareFunc   = naomiToGCCompare[r28];
            zMode->updateEnable  = (!r26);
        }
        lbl_80205DAC.unk7 = r28;
        lbl_80205DAC.unk8 = r26;
    }

    if (lbl_802F1EEC != 0)
        func_8009E398(lbl_802F1EF0, lbl_802F1EF4, lbl_802F1EF8, lbl_802F1EFC, 0.1f, 20000.0f);
    else
        func_8009E398(0, lbl_802F1EF4, 0.0f, 100.0f, 0.1f, 20000.0f);

    if (mesh.unk20 < 0)
    {
        func_8009EFF4(0, 0xFF, 0xFF, 4);
        func_8009EA30(0, 4);
    }
    else
    {
        int r25 = lbl_80205DAC.unk10;

        if (lbl_80205DAC.unkC != mesh.texObj)
        {
            lbl_80205DAC.unkC = mesh.texObj;
            if (--r25 < 0)
                r25 = 7;
            lbl_80205DAC.unk10 = r25;
            func_8009F430(mesh.texObj, r25);
        }
        func_8009EFF4(0, 0, r25, 4);
        switch ((mesh.unk8 >> 6) & 3)
        {
        case 0:
            func_8009E618(0, 15, 15, 15, 8);
            func_8009E800(0, 0, 0, 0, 1, 0);
            func_8009E70C(0, 7, 4, 5, 7);
            func_8009E918(0, 0, 0, 0, 1, 0);
            break;
        case 1:
            func_8009E618(0, 15, 10, 8, 15);
            func_8009E800(0, 0, 0, 0, 1, 0);
            func_8009E70C(0, 7, 4, 5, 7);
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

    color.r = mesh.unk30 * lbl_801B7978.unk0.r * 255.0f;
    color.g = mesh.unk34 * lbl_801B7978.unk0.g * 255.0f;
    color.b = mesh.unk38 * lbl_801B7978.unk0.b * 255.0f;
    color.a = mesh.unk2C * lbl_80205DAC.unk1C * 255.0f;
    if (lbl_80205DAC.matColor.r != color.r
     || lbl_80205DAC.matColor.g != color.g
     || lbl_80205DAC.matColor.b != color.b
     || lbl_80205DAC.matColor.a != color.a)
    {
        GXSetChanMatColor(GX_COLOR0A0, color);
        lbl_80205DAC.matColor = color;
    }

    color.r = mesh.unk28 * g_someAmbColor.r * 255.0f;
    color.g = mesh.unk28 * g_someAmbColor.g * 255.0f;
    color.b = mesh.unk28 * g_someAmbColor.b * 255.0f;
    color.a = lbl_80205DAC.matColor.a;
    if (lbl_80205DAC.ambColor.r != color.r
     || lbl_80205DAC.ambColor.g != color.g
     || lbl_80205DAC.ambColor.b != color.b
     || lbl_80205DAC.ambColor.a != color.a)
    {
        GXSetChanAmbColor(GX_COLOR0A0, color);
        lbl_80205DAC.ambColor = color;
    }

    if (lbl_80205DAC.unk9 != mesh.unk24)
    {
        lbl_80205DAC.unk9 = mesh.unk24;
        switch (mesh.unk24)
        {
        case -1:
            GXSetChanCtrl(
                GX_COLOR0A0,  // chan
                GX_DISABLE,  // enable
                GX_SRC_REG,  // amb_src
                GX_SRC_REG,  // mat_src
                GX_LIGHT_NULL,  // light_mask
                GX_DF_CLAMP,  // diff_fn
                GX_AF_SPOT);  // attn_fn
            break;
        case -3:
            GXSetChanCtrl(
                GX_COLOR0A0,  // chan
                GX_DISABLE,  // enable
                GX_SRC_VTX,  // amb_src
                GX_SRC_VTX,  // mat_src
                GX_LIGHT_NULL,  // light_mask
                GX_DF_CLAMP,  // diff_fn
                GX_AF_SPOT);  // attn_fn
            break;
        case -2:
        default:
            GXSetChanCtrl(
                GX_COLOR0A0,  // chan
                GX_ENABLE,  // enable
                GX_SRC_REG,  // amb_src
                GX_SRC_REG,  // mat_src
                nlObjLightMask,  // light_mask
                GX_DF_CLAMP,  // diff_fn
                GX_AF_SPOT);  // attn_fn
            break;
        }
    }
}

static inline void handle_color_vtx(struct NaomiVtxWithColor *vtx)
{
    u32 color;
    GXPosition3f32(vtx->x, vtx->y, vtx->z);
    color = vtx->color;
    GXColor4u8(
        ((color >> 16) & 0xFF) * lbl_801B7978.unk0.r,
        ((color >>  8) & 0xFF) * lbl_801B7978.unk0.g,
        ((color >>  0) & 0xFF) * lbl_801B7978.unk0.b,
        ((color >> 24) & 0xFF) * lbl_80205DAC.unk1C);
    GXTexCoord2f32(vtx->s, vtx->t);
}

void g_draw_naomi_disp_list_pos_color_tex_2(struct NaomiDispList *dl, void *end)
{
    g_set_vtx_desc(
        (1 << GX_VA_POS)
      | (1 << GX_VA_CLR0)
      | (1 << GX_VA_TEX0));

    if (lbl_80205DAC.unk0 != 1)
        lbl_80205DAC.unk0 = 1;

    while (dl < (struct NaomiDispList *)end)
    {
        int vtxCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithColor *vtx;
        u8 r4 = dl->unk0 & 3;

        vtxCount = dl->vtxCount;
        if (lbl_80205DAC.unkA != r4)
        {
            lbl_80205DAC.unkA = r4;
            func_8009E094(lbl_801B7B14[r4]);
        }

        if (dl->unk0 & (1 << 4))
        {
            GXBegin(GX_TRIANGLESTRIP, GX_VTXFMT0, vtxCount);
            while (vtxCount > 0)
            {
                if (*(u32 *)vtxData & 1)
                {
                    vtx = (void *)vtxData;
                    handle_color_vtx(vtx);
                    vtxData += 32;
                }
                else
                {
                    vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                    handle_color_vtx(vtx);
                    vtxData += 8;
                }
                vtxCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 3))
        {
            GXBegin(GX_TRIANGLES, GX_VTXFMT0, vtxCount * 3);
            while (vtxCount > 0)
            {
                for (i = 0; i < 3; i++)
                {
                    if (*(u32 *)vtxData & 1)
                    {
                        vtx = (void *)vtxData;
                        handle_color_vtx(vtx);
                        vtxData += 32;
                    }
                    else
                    {
                        vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                        handle_color_vtx(vtx);
                        vtxData += 8;
                    }
                }
                vtxCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 2))
        {
            GXBegin(GX_QUADS, GX_VTXFMT0, vtxCount * 4);
            while (vtxCount > 0)
            {
                for (i = 4; i > 0; i--)
                {
                    if (*(u32 *)vtxData & 1)
                    {
                        vtx = (void *)vtxData;
                        handle_color_vtx(vtx);
                        vtxData += 32;
                    }
                    else
                    {
                        vtx = (void *)(vtxData + *(u32 *)(vtxData + 4) + 8);
                        handle_color_vtx(vtx);
                        vtxData += 8;
                    }
                }
                vtxCount--;
            }
            GXEnd();
        }
        dl = (void *)vtxData;
    }
}

void func_80033AD4(struct NaomiModel *model)
{
    func_80031210(model);
}

void g_dupe_of_call_draw_naomi_model_1(struct NaomiModel *model)
{
    g_draw_naomi_model_1(model);
}

void func_80033B14(struct NaomiModel *model, float b)
{
    func_800314B8(model, b);
}

void func_80033B34(u32 lightMask)
{
    nlObjLightMask = lightMask;
}

void func_80033B3C(float r, float g, float b)
{
    g_someAmbColor.r = r;
    g_someAmbColor.g = g;
    g_someAmbColor.b = b;
}

void func_80033B50(int a)
{
    lbl_802F1EEC = a;
}

void func_80033B58(u32 a, float b, float c)
{
    lbl_802F1EF0 = a;
    lbl_802F1EF8 = b;
    lbl_802F1EFC = c;
}

void func_80033B68(int r, int g, int b)
{
    lbl_802F1EF4.r = r;
    lbl_802F1EF4.g = g;
    lbl_802F1EF4.b = b;
}

void g_draw_naomi_model_3(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->flags & (1 << 1))
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
    GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->unk0 != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        func_80031A58(mesh);
        next = (void *)(mesh->dispListStart + mesh->dispListSize);
        if (((mesh->unk0 >> 24) & 7) != 0)
            mesh = next;
        else
        {
            dlstart = (void *)(mesh->dispListStart);
            switch (mesh->unk24)
            {
            case -2:
                break;
            case -3:
                g_draw_naomi_disp_list_pos_color_tex_1(dlstart, next);
                break;
            default:
                g_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
                break;
            }
            mesh = next;
        }
    }
    func_800341B8();
}

void lbl_80033C8C(struct UnkStruct18 *a)
{
    float f31, f30, f29;

    mathutil_mtxA_from_mtx(a->unkC);

    f31 = lbl_801B7978.unk0.r;
    f30 = lbl_801B7978.unk0.g;
    f29 = lbl_801B7978.unk0.b;

    lbl_801B7978.unk0.r = a->unk3C.x;
    lbl_801B7978.unk0.g = a->unk3C.y;
    lbl_801B7978.unk0.b = a->unk3C.z;
    if (!(a->unk8->flags & (1 << 10)))
    {
        func_800223D8(a->unk48);
        func_80033B3C(a->unk4C.r, a->unk4C.g, a->unk4C.b);
    }
    lbl_802F1EEC = a->unk58;
    g_draw_naomi_model_4(a->unk8);

    lbl_801B7978.unk0.r = f31;
    lbl_801B7978.unk0.g = f30;
    lbl_801B7978.unk0.b = f29;
}

void g_draw_naomi_model_4(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->flags & (1 << 1))
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
    GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->unk0 != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        func_80031A58(mesh);
        next = (void *)(mesh->dispListStart + mesh->dispListSize);
        if (((mesh->unk0 >> 24) & 7) == 0)
            mesh = next;
        else
        {
            dlstart = (void *)(mesh->dispListStart);
            switch (mesh->unk24)
            {
            case -2:
                break;
            case -3:
                g_draw_naomi_disp_list_pos_color_tex_1(dlstart, next);
                break;
            default:
                g_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
                break;
            }
            mesh = next;
        }
    }
    func_800341B8();
}

void lbl_80033E6C(struct UnkStruct19 *a)
{
    float f31, f30, f29;

    mathutil_mtxA_from_mtx(a->unkC);

    f31 = lbl_801B7978.unk0.r;
    f30 = lbl_801B7978.unk0.g;
    f29 = lbl_801B7978.unk0.b;

    lbl_801B7978.unk0.r = a->unk3C.x;
    lbl_801B7978.unk0.g = a->unk3C.y;
    lbl_801B7978.unk0.b = a->unk3C.z;
    lbl_80205DAC.unk1C = a->unk48;
    if (!(a->unk8->flags & (1 << 10)))
    {
        func_800223D8(a->unk4C);
        func_80033B3C(a->unk50.r, a->unk50.g, a->unk50.b);
    }
    lbl_802F1EEC = a->unk5C;
    g_draw_naomi_model_5(a->unk8);

    lbl_801B7978.unk0.r = f31;
    lbl_801B7978.unk0.g = f30;
    lbl_801B7978.unk0.b = f29;
}

void g_draw_naomi_model_5(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->unk0 == -1)
        return;

    if (model->flags & (1 << 1))
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

    func_80032A80();
    GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->unk0 != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        func_80032D44(mesh);
        next    = (void *)(mesh->dispListStart + mesh->dispListSize);
        dlstart = (void *)(mesh->dispListStart);
        switch (mesh->unk24)
        {
        case -2:
            break;
        case -3:
            g_draw_naomi_disp_list_pos_color_tex_2(dlstart, next);
            break;
        default:
            g_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
            break;
        }
        mesh = next;
    }
    func_800341B8();
}

void g_draw_naomi_model_6(struct NaomiModel *model, int (*func)())
{
    struct NaomiMesh *mesh;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (func_80020EB4(&model->unk8, model->unk14) == 0)
                return;
        }
        else
        {
            if (func_80020FD0(&model->unk8, model->unk14, lbl_801B7978.unk1C) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
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
        lbl_80205DAC.unk1C = 1.0f;

        mesh = (struct NaomiMesh *)model->meshStart;
        while (mesh->unk0 != 0)
        {
            struct NaomiDispList *dlstart;
            struct NaomiMesh *next = (void *)(mesh->dispListStart + mesh->dispListSize);

            if (func(mesh, mesh->dispListSize) == 0)
                mesh = next;
            else
            {
                dlstart = (void *)(mesh->dispListStart);
                switch (mesh->unk24)
                {
                case -2:
                    break;
                case -3:
                    g_draw_naomi_disp_list_pos_color_tex_1(dlstart, next);
                    break;
                default:
                    g_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
                    break;
                }
                mesh = next;
            }
        }
    }
}

void func_800341B8(void) {}
