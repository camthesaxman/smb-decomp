#include <assert.h>
#include <string.h>
#include <dolphin.h>

#include "dolphin/GXEnum.h"
#include "global.h"
#include "bitmap.h"
#include "gxutil.h"
#include "load.h"
#include "mathutil.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "tevutil.h"

float fogEndZ;
float fogStartZ;
GXColor fogColor;
GXFogType fogType;
s32 g_fogEnabled;
u32 nlObjLightMask;

struct Color3f g_someAmbColor;
FORCE_BSS_ORDER(g_someAmbColor)

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
    float alpha;
    u8 unk20;
    u8 filler21[3];
    u32 unk24;
    u8 unk28;
    u8 filler29[0x34-0x29];
} lbl_80205DAC;
FORCE_BSS_ORDER(lbl_80205DAC)

static u8 lzssHeader[32] __attribute__((aligned(32)));

struct
{
    struct Color3f unk0;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
    float unk1C;
} lbl_801B7978 = { { 1.0f, 1.0f, 1.0f }, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f };

static BOOL adjust_pointers(struct NaomiObj *obj);
static void init_model_flags(struct NaomiModel *model);
static void prep_some_stuff_before_drawing(void);
static void do_some_stuff_with_mesh_colors(struct NaomiMesh *pmesh);
static void prep_some_stuff_before_drawing_2(void);
void do_some_stuff_with_mesh_colors_2(struct NaomiMesh *pmesh);

#pragma force_active on
void nl2ngc_set_line_width(float a)
{
    gxutil_set_line_width(a * 6.0f);
}

void func_80030AF8(int a /*unknown*/, int b /*unknown*/)
{
    g_gxutil_set_some_line_params(1, a, b, 0);
}

void nl2ngc_draw_line(Point3d *start, Point3d *end, u32 c)
{
    GXColor color;

    color.r = (c >> 16) & 0xFF;
    color.g = (c >> 8) & 0xFF;
    color.b = (c >> 0) & 0xFF;
    color.a = (c >> 24) & 0xFF;
    gxutil_draw_line(start, end, &color);
}
#pragma force_active reset

void nl2ngc_draw_line_deferred(Point3d *start, Point3d *end, u32 c)
{
    GXColor color;

    color.r = (c >> 16) & 0xFF;
    color.g = (c >> 8) & 0xFF;
    color.b = (c >> 0) & 0xFF;
    color.a = (c >> 24) & 0xFF;
    gxutil_draw_line_deferred(start, end, &color);
}

void g_nl2ngc_set_scale(float x)
{
    lbl_801B7978.unk18 = x;
}

void func_80030BB8(float r, float g, float b)
{
    lbl_801B7978.unk0.r = r;
    lbl_801B7978.unk0.g = g;
    lbl_801B7978.unk0.b = b;
}

BOOL load_nlobj(struct NaomiObj **pobj, struct TPL **ptpl, char *modelName, char *texName)
{
    int len;
    struct NaomiModel **pmodel;
    u32 size;
    struct File file;

    // Free object if it's already loaded
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

        // Read LZSS header
        if (file_read(&file, lzssHeader, 32, 0) < 0)
            return FALSE;
        size = OSRoundUp32B(__lwbrx(lzssHeader, 0));
        uncompSize = OSRoundUp32B(__lwbrx(lzssHeader, 4));

        uncompressed = OSAlloc(uncompSize);
        if (uncompressed == NULL)
            return FALSE;

        // Read whole file
        compressed = OSAllocFromHeap(mainHeap, size);
        if (compressed == NULL)
        {
            OSFree(uncompressed);
            return FALSE;
        }
        if (file_read(&file, compressed, size, 0) < 0)
            return FALSE;
        if (file_close(&file) != 1)
            return FALSE;

        // Decompress data
        lzs_decompress(compressed, uncompressed);
        OSFreeToHeap(mainHeap, compressed);
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

    adjust_pointers(*pobj);
    if (*ptpl != NULL)
        bitmap_free_tpl(*ptpl);
    *ptpl = bitmap_load_tpl(texName);
    if (*ptpl == NULL)
        return FALSE;

    pmodel = (*pobj)->modelPtrs;
    while (*pmodel != NULL)
    {
        g_init_naomi_model_textures(*pmodel, *ptpl);
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

// This function converts file all file offsets in the struct into memory pointers
// Featuring some insane pointer arithmetic.
static BOOL adjust_pointers(struct NaomiObj *obj)
{
    struct NaomiModel *volatile *pmodel = obj->modelPtrs;
    struct NaomiObj_UnkChild *volatile *unkptr;
    struct NaomiObj_UnkChild_Child *unkchild;

    // Adjust pointers in models?
    while (*pmodel != NULL)
    {
        u32 *ptr;

        // adjust pointer to model?
        *pmodel = (void *)((u32)*pmodel + (u32)obj);

        // What the hell is this for?
        ptr = (u32 *)*pmodel;
        ptr[-2] += (u32)obj;

        ptr = (u32 *)*pmodel;
        ptr[-1] += (u32)obj;

        init_model_flags(*pmodel);
        pmodel++;
    }

    obj->unk0 = (void *)((u32)obj->unk0 + (u32)obj);
    unkptr = obj->unk0;
    while (*unkptr != NULL)
    {
        u32 *ptr;
        *unkptr = (void *)((u32)*unkptr + (u32)obj);

        ptr = (u32 *)*unkptr;
        ptr[0] += (u32)obj;

        ptr = (u32 *)*unkptr;
        ptr[1] += (u32)obj;

        unkchild = (*unkptr)->childStructs;
        while (unkchild->unk0 != 0)
        {
            unkchild->unk0 += (u32)obj;
            unkchild++;
        }
        unkptr++;
    }
    return TRUE;
}

static void init_model_flags(struct NaomiModel *model)
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
                if (r8 && (mesh->type != -1 || mesh->type != -3))
                    r8 = FALSE;
            }
            else
            {
                r7 = TRUE;
                if (r9 && (mesh->type != -1 || mesh->type != -3))
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

void g_init_naomi_model_textures(struct NaomiModel *model, struct TPL *tpl)
{
    u8 unused[8];

    if (model->unk0 != -1)
    {
        struct NaomiMesh *mesh = (struct NaomiMesh *)model->meshStart;

        while (mesh->unk0 != 0)
        {
            if (mesh->unk20 >= 0)
            {
                u32 flags = mesh->unk8;
                GXTexObj *tobj = &tpl->texObjs[mesh->unk20];
                GXTexWrapMode wrapS, wrapT;
                GXTexFilter minFilt, magFilt;

                if (flags & (1 << 16))
                    wrapS = GXGetTexObjWrapS(tobj);
                else if (flags & (1 << 18))
                    wrapS = GX_MIRROR;
                else
                    wrapS = GX_REPEAT;

                if (flags & (1 << 15))
                    wrapT = GXGetTexObjWrapT(tobj);
                else if (flags & (1 << 17))
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
                    tpl->texHeaders[mesh->unk20].unkC);  // mipmap

                switch (((flags >> 13) & 0x3))
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

struct UnkStruct18
{
    struct OrdTblNode node;
    struct NaomiModel *model;
    Mtx unkC;
    struct Color3f unk3C;
    u32 unk48;
    struct Color3f unk4C;
    u32 unk58;
};

static void lbl_80033C8C(struct UnkStruct18 *);

void g_draw_naomi_model_and_do_other_stuff(struct NaomiModel *model)
{
    u32 *temp;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (g_frustum_test_maybe_1(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (g_frustum_test_maybe_2(&model->boundSphereCenter, model->boundSphereRadius, lbl_801B7978.unk18) == 0)
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
            struct OrdTblNode *list = ord_tbl_get_entry_for_pos(&model->boundSphereCenter);
            r29 = ord_tbl_alloc_node(sizeof(*r29));

            r29->node.drawFunc = (OrdTblDrawFunc)lbl_80033C8C;
            r29->model = model;
            r29->unk3C.r = lbl_801B7978.unk0.r;
            r29->unk3C.g = lbl_801B7978.unk0.g;
            r29->unk3C.b = lbl_801B7978.unk0.b;
            r29->unk48 = func_800223D0();
            r29->unk4C.r = g_someAmbColor.r;
            r29->unk4C.g = g_someAmbColor.g;
            r29->unk4C.b = g_someAmbColor.b;
            r29->unk58 = g_fogEnabled;
            mathutil_mtxA_to_mtx(r29->unkC);
            ord_tbl_insert_node(list, &r29->node);
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
            if (g_frustum_test_maybe_1(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (g_frustum_test_maybe_2(&model->boundSphereCenter, model->boundSphereRadius, lbl_801B7978.unk18) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
        {
            gxutil_set_vtx_attrs(
                (1 << GX_VA_POS)
              | (1 << GX_VA_CLR0)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 1;
        }
        else
        {
            gxutil_set_vtx_attrs(
                (1 << GX_VA_POS)
              | (1 << GX_VA_NRM)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 0;
        }

        prep_some_stuff_before_drawing();
        GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

        mesh = (struct NaomiMesh *)model->meshStart;
        while (mesh->unk0 != 0)
        {
            struct NaomiDispList *dlstart;
            struct NaomiMesh *next;

            do_some_stuff_with_mesh_colors(mesh);
            dlstart = (void *)(mesh->dispListStart);
            next    = (void *)(mesh->dispListStart + mesh->dispListSize);
            switch (mesh->type)
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

struct UnkStruct19
{
    struct OrdTblNode node;
    struct NaomiModel *model;
    Mtx unkC;
    struct Color3f unk3C;
    float alpha;
    u32 unk4C;
    struct Color3f ambColor;
    u32 unk5C;
};

void lbl_80033E6C(struct UnkStruct19 *);

void g_draw_naomi_model_with_alpha_deferred(struct NaomiModel *model, float alpha)
{
    struct UnkStruct19 *node;
    struct OrdTblNode *entry;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (g_frustum_test_maybe_1(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (g_frustum_test_maybe_2(&model->boundSphereCenter, model->boundSphereRadius, lbl_801B7978.unk18) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
            lbl_801B7978.unk18 = 1.0f;
        }

        entry = ord_tbl_get_entry_for_pos(&model->boundSphereCenter);
        node = ord_tbl_alloc_node(sizeof(*node));

        node->node.drawFunc = (OrdTblDrawFunc)lbl_80033E6C;
        node->model = model;
        node->alpha = alpha;
        node->unk3C.r = lbl_801B7978.unk0.r;
        node->unk3C.g = lbl_801B7978.unk0.g;
        node->unk3C.b = lbl_801B7978.unk0.b;
        node->unk4C = func_800223D0();
        node->ambColor.r = g_someAmbColor.r;
        node->ambColor.g = g_someAmbColor.g;
        node->ambColor.b = g_someAmbColor.b;
        node->unk5C = g_fogEnabled;
        mathutil_mtxA_to_mtx(node->unkC);
        ord_tbl_insert_node(entry, &node->node);
    }
}

void g_draw_naomi_model_with_alpha(struct NaomiModel *model, float alpha)
{
    struct NaomiMesh *mesh;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (g_frustum_test_maybe_1(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (g_frustum_test_maybe_2(&model->boundSphereCenter, model->boundSphereRadius, lbl_801B7978.unk18) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
        {
            gxutil_set_vtx_attrs(
                (1 << GX_VA_POS)
              | (1 << GX_VA_CLR0)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 1;
        }
        else
        {
            gxutil_set_vtx_attrs(
                (1 << GX_VA_POS)
              | (1 << GX_VA_NRM)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 0;
        }

        lbl_80205DAC.alpha = alpha;
        prep_some_stuff_before_drawing_2();
        GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

        mesh = (struct NaomiMesh *)model->meshStart;
        while (mesh->unk0 != 0)
        {
            struct NaomiDispList *dlstart;
            struct NaomiMesh *next;

            do_some_stuff_with_mesh_colors_2(mesh);
            dlstart = (void *)(mesh->dispListStart);
            next    = (void *)(mesh->dispListStart + mesh->dispListSize);
            switch (mesh->type)
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
    g_draw_naomi_model_and_do_other_stuff(model);
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

GXBlendFactor lbl_801B7AB4[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
GXBlendFactor lbl_801B7AD4[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
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
GXCullMode g_naomiToGXCullModes[] = { GX_CULL_ALL, GX_CULL_NONE, GX_CULL_BACK, GX_CULL_FRONT, GX_CULL_NONE };

static void prep_some_stuff_before_drawing(void)
{
    GXColor ambColor;

    lbl_80205DAC.unk4 = 0;
    lbl_80205DAC.unk5 = 1;
    lbl_80205DAC.unk6 = 0;
    GXSetBlendMode_cached(GX_BM_NONE, lbl_801B7AB4[1], lbl_801B7AD4[0], GX_LO_CLEAR);
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

    if (g_fogEnabled != 0)
        GXSetFog_cached(fogType, fogStartZ, fogEndZ, 0.1f, 20000.0f, fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, fogColor);

    lbl_80205DAC.unkA = 2;
    GXSetCullMode_cached(g_naomiToGXCullModes[2]);
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
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetNumTevStages_cached(1);
    GXSetNumTexGens(1);
    GXSetNumIndStages(0);
    GXSetNumChans(1);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
}

static void do_some_stuff_with_mesh_colors(struct NaomiMesh *pmesh)
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
            GXSetBlendMode_cached(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
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
            GXSetBlendMode_cached(GX_BM_BLEND, lbl_801B7AB4[r25], lbl_801B7AD4[r27], GX_LO_CLEAR);
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

    if (g_fogEnabled != 0)
        GXSetFog_cached(fogType, fogStartZ, fogEndZ, 0.1f, 20000.0f, fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, fogColor);

    if (mesh.unk20 < 0)
    {
        GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
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
            GXLoadTexObj_cached(mesh.texObj, r25);
        }
        GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, r25, GX_COLOR0A0);
        switch ((mesh.unk8 >> 6) & 3)
        {
        case 0:
            func_8009EA30(0, 3);
            break;
        case 1:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            break;
        case 2:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_RASC, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_RASA);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            break;
        case 3:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_RASA, GX_CA_TEXA, GX_CA_ZERO);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
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

    if (lbl_80205DAC.unk9 != mesh.type)
    {
        lbl_80205DAC.unk9 = mesh.type;
        switch (mesh.type)
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
    gxutil_set_vtx_attrs(
        (1 << GX_VA_POS)
      | (1 << GX_VA_NRM)
      | (1 << GX_VA_TEX0));

    if (lbl_80205DAC.unk0 != 0)
        lbl_80205DAC.unk0 = 0;

    while (dl < (struct NaomiDispList *)end)
    {
        int faceCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithNormal *vtx;
        u8 r4 = dl->unk0 & 3;

        faceCount = dl->faceCount;
        if (lbl_80205DAC.unkA != r4)
        {
            lbl_80205DAC.unkA = r4;
            GXSetCullMode_cached(g_naomiToGXCullModes[r4]);
        }

        if (dl->unk0 & (1 << 4))
        {
            GXBegin(GX_TRIANGLESTRIP, GX_VTXFMT0, faceCount);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 3))
        {
            GXBegin(GX_TRIANGLES, GX_VTXFMT0, faceCount * 3);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 2))
        {
            GXBegin(GX_QUADS, GX_VTXFMT0, faceCount * 4);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        dl = (void *)vtxData;
    }
}

void g_draw_naomi_disp_list_pos_color_tex_1(struct NaomiDispList *dl, void *end)
{
    gxutil_set_vtx_attrs(
        (1 << GX_VA_POS)
      | (1 << GX_VA_CLR0)
      | (1 << GX_VA_TEX0));

    if (lbl_80205DAC.unk0 != 1)
        lbl_80205DAC.unk0 = 1;

    while (dl < (struct NaomiDispList *)end)
    {
        int faceCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithColor *vtx;
        u8 r4 = dl->unk0 & 3;

        faceCount = dl->faceCount;
        if (lbl_80205DAC.unkA != r4)
        {
            lbl_80205DAC.unkA = r4;
            GXSetCullMode_cached(g_naomiToGXCullModes[r4]);
        }

        if (dl->unk0 & (1 << 4))
        {
            GXBegin(GX_TRIANGLESTRIP, GX_VTXFMT0, faceCount);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 3))
        {
            GXBegin(GX_TRIANGLES, GX_VTXFMT0, faceCount * 3);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 2))
        {
            GXBegin(GX_QUADS, GX_VTXFMT0, faceCount * 4);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        dl = (void *)vtxData;
    }
}

static void prep_some_stuff_before_drawing_2(void)
{
    GXColor sp18;

    lbl_80205DAC.unk4 = 0;
    lbl_80205DAC.unk5 = 4;
    lbl_80205DAC.unk6 = 5;

    GXSetBlendMode_cached(GX_BM_BLEND, lbl_801B7AB4[4], lbl_801B7AD4[5], GX_LO_CLEAR);

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

    if (g_fogEnabled != 0)
        GXSetFog_cached(fogType, fogStartZ, fogEndZ, 0.1f, 20000.0f, fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, fogColor);

    lbl_80205DAC.unkA = 2;
    GXSetCullMode_cached(g_naomiToGXCullModes[2]);
    lbl_80205DAC.unkC = 0;
    lbl_80205DAC.unk10 = 0;

    lbl_80205DAC.matColor.r = lbl_801B7978.unk0.r * 255.0f;
    lbl_80205DAC.matColor.g = lbl_801B7978.unk0.g * 255.0f;
    lbl_80205DAC.matColor.b = lbl_801B7978.unk0.b * 255.0f;
    lbl_80205DAC.matColor.a = lbl_80205DAC.alpha * 255.0f;
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
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetNumTevStages_cached(1);
    GXSetNumTexGens(1);
    GXSetNumIndStages(0);
    GXSetNumChans(1);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
}

void do_some_stuff_with_mesh_colors_2(struct NaomiMesh *pmesh)
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
            GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
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
            GXSetBlendMode_cached(GX_BM_BLEND, lbl_801B7AB4[r25], lbl_801B7AD4[r27], GX_LO_CLEAR);
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

    if (g_fogEnabled != 0)
        GXSetFog_cached(fogType, fogStartZ, fogEndZ, 0.1f, 20000.0f, fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, fogColor);

    if (mesh.unk20 < 0)
    {
        GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
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
            GXLoadTexObj_cached(mesh.texObj, r25);
        }
        GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, r25, GX_COLOR0A0);
        switch ((mesh.unk8 >> 6) & 3)
        {
        case 0:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_TEXA, GX_CA_RASA,GX_CA_ZERO);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            break;
        case 1:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_TEXA, GX_CA_RASA, GX_CA_ZERO);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            break;
        case 2:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_RASC, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_RASA);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            break;
        case 3:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_RASA, GX_CA_TEXA, GX_CA_ZERO);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            break;
        }
    }

    color.r = mesh.unk30 * lbl_801B7978.unk0.r * 255.0f;
    color.g = mesh.unk34 * lbl_801B7978.unk0.g * 255.0f;
    color.b = mesh.unk38 * lbl_801B7978.unk0.b * 255.0f;
    color.a = mesh.unk2C * lbl_80205DAC.alpha * 255.0f;
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

    if (lbl_80205DAC.unk9 != mesh.type)
    {
        lbl_80205DAC.unk9 = mesh.type;
        switch (mesh.type)
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
        ((color >> 24) & 0xFF) * lbl_80205DAC.alpha);
    GXTexCoord2f32(vtx->s, vtx->t);
}

void g_draw_naomi_disp_list_pos_color_tex_2(struct NaomiDispList *dl, void *end)
{
    gxutil_set_vtx_attrs(
        (1 << GX_VA_POS)
      | (1 << GX_VA_CLR0)
      | (1 << GX_VA_TEX0));

    if (lbl_80205DAC.unk0 != 1)
        lbl_80205DAC.unk0 = 1;

    while (dl < (struct NaomiDispList *)end)
    {
        int faceCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithColor *vtx;
        u8 r4 = dl->unk0 & 3;

        faceCount = dl->faceCount;
        if (lbl_80205DAC.unkA != r4)
        {
            lbl_80205DAC.unkA = r4;
            GXSetCullMode_cached(g_naomiToGXCullModes[r4]);
        }

        if (dl->unk0 & (1 << 4))
        {
            GXBegin(GX_TRIANGLESTRIP, GX_VTXFMT0, faceCount);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 3))
        {
            GXBegin(GX_TRIANGLES, GX_VTXFMT0, faceCount * 3);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        else if (dl->unk0 & (1 << 2))
        {
            GXBegin(GX_QUADS, GX_VTXFMT0, faceCount * 4);
            while (faceCount > 0)
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
                faceCount--;
            }
            GXEnd();
        }
        dl = (void *)vtxData;
    }
}

void g_call_draw_naomi_model_and_do_other_stuff(struct NaomiModel *model)
{
    g_draw_naomi_model_and_do_other_stuff(model);
}

void g_dupe_of_call_draw_naomi_model_1(struct NaomiModel *model)
{
    g_draw_naomi_model_1(model);
}

void g_call_draw_model_with_alpha_deferred(struct NaomiModel *model, float b)
{
    g_draw_naomi_model_with_alpha_deferred(model, b);
}

void g_nl2ngc_set_light_mask(u32 lightMask)
{
    nlObjLightMask = lightMask;
}

void g_nl2ngc_set_ambient_color(float r, float g, float b)
{
    g_someAmbColor.r = r;
    g_someAmbColor.g = g;
    g_someAmbColor.b = b;
}

void func_80033B50(int a)
{
    g_fogEnabled = a;
}

void func_80033B58(u32 a, float b, float c)
{
    fogType = a;
    fogStartZ = b;
    fogEndZ = c;
}

void g_nl2ngc_set_some_other_color(int r, int g, int b)
{
    fogColor.r = r;
    fogColor.g = g;
    fogColor.b = b;
}

void g_draw_naomi_model_3(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->flags & (1 << 1))
    {
        gxutil_set_vtx_attrs(
            (1 << GX_VA_POS)
          | (1 << GX_VA_CLR0)
          | (1 << GX_VA_TEX0));
        lbl_80205DAC.unk0 = 1;
    }
    else
    {
        gxutil_set_vtx_attrs(
            (1 << GX_VA_POS)
          | (1 << GX_VA_NRM)
          | (1 << GX_VA_TEX0));
        lbl_80205DAC.unk0 = 0;
    }

    prep_some_stuff_before_drawing();
    GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->unk0 != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        do_some_stuff_with_mesh_colors(mesh);
        next = (void *)(mesh->dispListStart + mesh->dispListSize);
        if (((mesh->unk0 >> 24) & 7) != 0)
            mesh = next;
        else
        {
            dlstart = (void *)(mesh->dispListStart);
            switch (mesh->type)
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

static void lbl_80033C8C(struct UnkStruct18 *a)
{
    float f31, f30, f29;

    mathutil_mtxA_from_mtx(a->unkC);

    f31 = lbl_801B7978.unk0.r;
    f30 = lbl_801B7978.unk0.g;
    f29 = lbl_801B7978.unk0.b;

    lbl_801B7978.unk0.r = a->unk3C.r;
    lbl_801B7978.unk0.g = a->unk3C.g;
    lbl_801B7978.unk0.b = a->unk3C.b;
    if (!(a->model->flags & (1 << 10)))
    {
        func_800223D8(a->unk48);
        g_nl2ngc_set_ambient_color(a->unk4C.r, a->unk4C.g, a->unk4C.b);
    }
    g_fogEnabled = a->unk58;
    g_draw_naomi_model_4(a->model);

    lbl_801B7978.unk0.r = f31;
    lbl_801B7978.unk0.g = f30;
    lbl_801B7978.unk0.b = f29;
}

void g_draw_naomi_model_4(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->flags & (1 << 1))
    {
        gxutil_set_vtx_attrs(
            (1 << GX_VA_POS)
          | (1 << GX_VA_CLR0)
          | (1 << GX_VA_TEX0));
        lbl_80205DAC.unk0 = 1;
    }
    else
    {
        gxutil_set_vtx_attrs(
            (1 << GX_VA_POS)
          | (1 << GX_VA_NRM)
          | (1 << GX_VA_TEX0));
        lbl_80205DAC.unk0 = 0;
    }

    prep_some_stuff_before_drawing();
    GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->unk0 != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        do_some_stuff_with_mesh_colors(mesh);
        next = (void *)(mesh->dispListStart + mesh->dispListSize);
        if (((mesh->unk0 >> 24) & 7) == 0)
            mesh = next;
        else
        {
            dlstart = (void *)(mesh->dispListStart);
            switch (mesh->type)
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

    lbl_801B7978.unk0.r = a->unk3C.r;
    lbl_801B7978.unk0.g = a->unk3C.g;
    lbl_801B7978.unk0.b = a->unk3C.b;
    lbl_80205DAC.alpha = a->alpha;
    if (!(a->model->flags & (1 << 10)))
    {
        func_800223D8(a->unk4C);
        g_nl2ngc_set_ambient_color(a->ambColor.r, a->ambColor.g, a->ambColor.b);
    }
    g_fogEnabled = a->unk5C;
    g_draw_naomi_model_5(a->model);

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
        gxutil_set_vtx_attrs(
            (1 << GX_VA_POS)
          | (1 << GX_VA_CLR0)
          | (1 << GX_VA_TEX0));
        lbl_80205DAC.unk0 = 1;
    }
    else
    {
        gxutil_set_vtx_attrs(
            (1 << GX_VA_POS)
          | (1 << GX_VA_NRM)
          | (1 << GX_VA_TEX0));
        lbl_80205DAC.unk0 = 0;
    }

    prep_some_stuff_before_drawing_2();
    GXLoadTexMtxImm(textureMatrix,      GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->unk0 != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        do_some_stuff_with_mesh_colors_2(mesh);
        next    = (void *)(mesh->dispListStart + mesh->dispListSize);
        dlstart = (void *)(mesh->dispListStart);
        switch (mesh->type)
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

void g_draw_naomi_model_with_mesh_func(struct NaomiModel *model, int (*func)())
{
    struct NaomiMesh *mesh;

    if (model->unk0 != -1)
    {
        lbl_801B7978.unk1C = lbl_801B7978.unk18;
        if (lbl_801B7978.unk18 == 1.0f)
        {
            if (g_frustum_test_maybe_1(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (g_frustum_test_maybe_2(&model->boundSphereCenter, model->boundSphereRadius, lbl_801B7978.unk1C) == 0)
            {
                lbl_801B7978.unk18 = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
        {
            gxutil_set_vtx_attrs(
                (1 << GX_VA_POS)
              | (1 << GX_VA_CLR0)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 1;
        }
        else
        {
            gxutil_set_vtx_attrs(
                (1 << GX_VA_POS)
              | (1 << GX_VA_NRM)
              | (1 << GX_VA_TEX0));
            lbl_80205DAC.unk0 = 0;
        }
        lbl_80205DAC.alpha = 1.0f;

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
                switch (mesh->type)
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
