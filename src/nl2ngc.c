#include <assert.h>
#include <dolphin.h>
#include <string.h>

#include "bitmap.h"
#include "global.h"
#include "gxcache.h"
#include "gxutil.h"
#include "light.h"
#include "load.h"
#include "mathutil.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include <dolphin/GXEnum.h>

float s_fogEndZ;
float s_fogStartZ;
GXColor s_fogColor;
GXFogType s_fogType;
s32 s_fogEnabled;
u32 s_lightMask;

struct Color3f u_ambientColor;
FORCE_BSS_ORDER(u_ambientColor)

static struct
{
    BOOL hasVerticesWithColor;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 fillerB[1];
    GXTexObj *texObj;
    GXTexMapID texMapId;
    GXColor materialColor;
    GXColor ambientColor;
    float alpha;
    u8 unk20;
    u8 filler21[3];
    u32 unk24;
    u8 unk28;
    u8 filler29[0x34 - 0x29];
} s_naomiMaterialCache;
FORCE_BSS_ORDER(s_naomiMaterialCache)

static u8 s_lzssHeader[32] __attribute__((aligned(32)));

struct
{
    struct Color3f materialColor;
    float unkC;
    float unk10;
    float unk14;
    float u_scale;
    float u_scaleCopy;
} s_renderParams = {{1.0f, 1.0f, 1.0f}, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f};

static BOOL naomi_archive_offsets_to_pointers(struct NaomiArchive *obj);
static void init_model_flags(struct NaomiModel *model);
static void prep_some_stuff_before_drawing(void);
static void build_tev_material(struct NaomiMesh *pmesh);
static void prep_some_stuff_before_drawing_2(void);
void do_some_stuff_with_mesh_colors_2(struct NaomiMesh *pmesh);

#pragma force_active on
void nl2ngc_set_line_width(float a)
{
    gxutil_set_line_width(a * 6.0f);
}

void nl2ngc_set_line_blend_params(GXBlendFactor srcFactor, GXBlendFactor dstFactor)
{
    gxutil_set_line_blend_params(GX_BM_BLEND, srcFactor, dstFactor, GX_LO_CLEAR);
}

void nl2ngc_draw_line(Point3d *start, Point3d *end, u32 color)
{
    GXColor gxColor;

    gxColor.r = (color >> 16) & 0xFF;
    gxColor.g = (color >> 8) & 0xFF;
    gxColor.b = (color >> 0) & 0xFF;
    gxColor.a = (color >> 24) & 0xFF;
    gxutil_draw_line(start, end, &gxColor);
}
#pragma force_active reset

void nl2ngc_draw_line_deferred(Point3d *start, Point3d *end, u32 color)
{
    GXColor gxColor;

    gxColor.r = (color >> 16) & 0xFF;
    gxColor.g = (color >> 8) & 0xFF;
    gxColor.b = (color >> 0) & 0xFF;
    gxColor.a = (color >> 24) & 0xFF;
    gxutil_draw_line_deferred(start, end, &gxColor);
}

void u_nl2ngc_set_scale(float x)
{
    s_renderParams.u_scale = x;
}

void nl2ngc_set_material_color(float r, float g, float b)
{
    s_renderParams.materialColor.r = r;
    s_renderParams.materialColor.g = g;
    s_renderParams.materialColor.b = b;
}

BOOL load_naomi_archive(struct NaomiArchive **archive, struct TPL **tpl, char *archivePath,
                        char *tplPath)
{
    int len;
    struct NaomiModel **pmodel;
    u32 size;
    struct File file;

    // Free object if it's already loaded
    if (*archive != NULL)
    {
        OSFree(*archive);
        *archive = NULL;
    }
    if (!file_open(archivePath, &file))
        return FALSE;
    len = strlen(archivePath);
    if (len >= 3 && strcmp(archivePath + (len - 3), ".lz") == 0)
    {
        u32 uncompSize;
        void *compressed;
        void *uncompressed;

        // Read LZSS header
        if (file_read(&file, s_lzssHeader, 32, 0) < 0)
            return FALSE;
        size = OSRoundUp32B(__lwbrx(s_lzssHeader, 0));
        uncompSize = OSRoundUp32B(__lwbrx(s_lzssHeader, 4));

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
        *archive = uncompressed;
        if (*archive == NULL)
            return FALSE;
    }
    else
    {
        size = OSRoundUp32B(file_size(&file));
        *archive = OSAlloc(size);
        if (*archive == NULL)
            OSPanic("nl2ngc.c", 476, "cannot OSAlloc");
        file_read(&file, *archive, size, 0);
        file_close(&file);
    }

    naomi_archive_offsets_to_pointers(*archive);
    if (*tpl != NULL)
        bitmap_free_tpl(*tpl);
    *tpl = bitmap_load_tpl(tplPath);
    if (*tpl == NULL)
        return FALSE;

    pmodel = (*archive)->models;
    while (*pmodel != NULL)
    {
        init_naomi_model_textures(*pmodel, *tpl);
        pmodel++;
    }
    return TRUE;
}

BOOL free_naomi_archive(struct NaomiArchive **archive, struct TPL **tpl)
{
    u8 unused[8];

    if (*archive != NULL)
    {
        OSFree(*archive);
        *archive = NULL;
    }
    if (*tpl != NULL)
    {
        bitmap_free_tpl(*tpl);
        *tpl = NULL;
    }
    return TRUE;
}

// This function converts file all file offsets in the struct into memory pointers
// Featuring some insane pointer arithmetic.
static BOOL naomi_archive_offsets_to_pointers(struct NaomiArchive *obj)
{
    struct NaomiModel *volatile *pmodel = obj->models;
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

        while (mesh->flags != 0)
        {
            if (((mesh->flags >> 24) & 7) != 0)
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

void init_naomi_model_textures(struct NaomiModel *model, struct TPL *tpl)
{
    u8 unused[8];

    if (model->unk0 != -1)
    {
        struct NaomiMesh *mesh = (struct NaomiMesh *)model->meshStart;

        while (mesh->flags != 0)
        {
            if (mesh->tplTexIdx >= 0)
            {
                u32 flags = mesh->texFlags;
                GXTexObj *texObj = &tpl->texObjs[mesh->tplTexIdx];
                GXTexWrapMode wrapS, wrapT;
                GXTexFilter minFilt, magFilt;

                if (flags & (NAOMI_TEX_FLAG_S_CLAMP))
                    wrapS = GXGetTexObjWrapS(texObj);
                else if (flags & (NAOMI_TEX_FLAG_S_MIRROR))
                    wrapS = GX_MIRROR;
                else
                    wrapS = GX_REPEAT;

                if (flags & (NAOMI_TEX_FLAG_T_CLAMP))
                    wrapT = GXGetTexObjWrapT(texObj);
                else if (flags & (NAOMI_TEX_FLAG_T_MIRROR))
                    wrapT = GX_MIRROR;
                else
                    wrapT = GX_REPEAT;

                GXInitTexObj(texObj,                                 // obj
                             GXGetTexObjData(texObj),                // image_ptr
                             GXGetTexObjWidth(texObj),               // width
                             GXGetTexObjHeight(texObj),              // height
                             GXGetTexObjFmt(texObj),                 // format
                             wrapS,                                  // wrap_s
                             wrapT,                                  // wrap_t
                             tpl->texHeaders[mesh->tplTexIdx].unkC); // mipmap

                switch (((flags >> 13) & 0x3))
                {
                case 0:
                    if (GXGetTexObjMipMap(texObj))
                        minFilt = GX_LIN_MIP_NEAR;
                    else
                        minFilt = GX_NEAR;
                    magFilt = GX_NEAR;
                    break;
                default:
                    if (GXGetTexObjMipMap(texObj))
                        minFilt = GX_LIN_MIP_LIN;
                    else
                        minFilt = GX_LINEAR;
                    magFilt = GX_LINEAR;
                    break;
                }

                GXInitTexObjLOD(texObj,      // obj
                                minFilt,     // min_filt
                                magFilt,     // mag_filt
                                0.0f,        // min_lod
                                0.0f,        // max_lod
                                0.0f,        // lod_bias
                                GX_FALSE,    // bias_clamp
                                GX_FALSE,    // do_edge_lod
                                GX_ANISO_1); // max_aniso
                mesh->texObj = texObj;
            }
            mesh = (struct NaomiMesh *)(mesh->dispListStart + mesh->dispListSize);
        }
    }
}

struct DrawModelDeferredNode
{
    struct OrdTblNode node;
    struct NaomiModel *model;
    Mtx viewFromModel;
    struct Color3f materialColoir;
    u32 lightGroup;
    struct Color3f ambientColor;
    u32 fogEnabled;
};

static void lbl_80033C8C(struct DrawModelDeferredNode *);

void u_nl2ngc_draw_model_sort_translucent(struct NaomiModel *model)
{
    u32 *modelFlags;

    if (model->unk0 != -1)
    {
        s_renderParams.u_scaleCopy = s_renderParams.u_scale;
        if (s_renderParams.u_scale == 1.0f)
        {
            if (test_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            // Always reset a non-one scale before next draw call
            if (test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius,
                                              s_renderParams.u_scale) == 0)
            {
                s_renderParams.u_scale = 1.0f;
                return;
            }
            s_renderParams.u_scale = 1.0f;
        }
        modelFlags = &model->flags;
        if (model->flags & (NAOMI_MODEL_FLAG_OPAQUE))
            u_draw_opaque_model(model);
        if (*modelFlags & (NAOMI_MODEL_FLAG_TRANSLUCENT))
        {
            struct DrawModelDeferredNode *drawNode;
            struct OrdTblNode *list = ord_tbl_get_entry_for_pos(&model->boundSphereCenter);
            drawNode = ord_tbl_alloc_node(sizeof(*drawNode));

            drawNode->node.drawFunc = (OrdTblDrawFunc)lbl_80033C8C;
            drawNode->model = model;
            drawNode->materialColoir.r = s_renderParams.materialColor.r;
            drawNode->materialColoir.g = s_renderParams.materialColor.g;
            drawNode->materialColoir.b = s_renderParams.materialColor.b;
            drawNode->lightGroup = peek_light_group();
            drawNode->ambientColor.r = u_ambientColor.r;
            drawNode->ambientColor.g = u_ambientColor.g;
            drawNode->ambientColor.b = u_ambientColor.b;
            drawNode->fogEnabled = s_fogEnabled;
            mathutil_mtxA_to_mtx(drawNode->viewFromModel);
            ord_tbl_insert_node(list, &drawNode->node);
        }
    }
}

Mtx textureMatrix = {
    {1, 0, 0, 0},
    {0, -1, 0, 1},
    {0, 0, 1, 0},
};

void nl2ngc_draw_model_unsorted(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->unk0 != -1)
    {
        s_renderParams.u_scaleCopy = s_renderParams.u_scale;
        if (s_renderParams.u_scale == 1.0f)
        {
            if (test_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius,
                                              s_renderParams.u_scale) == 0)
            {
                s_renderParams.u_scale = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
        {
            gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0) | (1 << GX_VA_TEX0));
            s_naomiMaterialCache.hasVerticesWithColor = 1;
        }
        else
        {
            gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_NRM) | (1 << GX_VA_TEX0));
            s_naomiMaterialCache.hasVerticesWithColor = 0;
        }

        prep_some_stuff_before_drawing();
        GXLoadTexMtxImm(textureMatrix, GX_TEXMTX0, GX_MTX2x4);
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

        mesh = (struct NaomiMesh *)model->meshStart;
        while (mesh->flags != 0)
        {
            struct NaomiDispList *dlstart;
            struct NaomiMesh *next;

            build_tev_material(mesh);
            dlstart = (void *)(mesh->dispListStart);
            next = (void *)(mesh->dispListStart + mesh->dispListSize);
            switch (mesh->type)
            {
            case -2:
                break;
            case -3:
                u_draw_naomi_disp_list_pos_color_tex_1(dlstart, next);
                break;
            default:
                u_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
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

// TODO: Can Naomi models have transparency besides a global parameter here? If not, consider naming
// `nl2ngc_draw_model_translucent_sorted`
void nl2ngc_draw_model_alpha_sorted(struct NaomiModel *model, float alpha)
{
    struct UnkStruct19 *node;
    struct OrdTblNode *entry;

    if (model->unk0 != -1)
    {
        s_renderParams.u_scaleCopy = s_renderParams.u_scale;
        if (s_renderParams.u_scale == 1.0f)
        {
            if (test_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius,
                                              s_renderParams.u_scale) == 0)
            {
                s_renderParams.u_scale = 1.0f;
                return;
            }
            s_renderParams.u_scale = 1.0f;
        }

        entry = ord_tbl_get_entry_for_pos(&model->boundSphereCenter);
        node = ord_tbl_alloc_node(sizeof(*node));

        node->node.drawFunc = (OrdTblDrawFunc)lbl_80033E6C;
        node->model = model;
        node->alpha = alpha;
        node->unk3C.r = s_renderParams.materialColor.r;
        node->unk3C.g = s_renderParams.materialColor.g;
        node->unk3C.b = s_renderParams.materialColor.b;
        node->unk4C = peek_light_group();
        node->ambColor.r = u_ambientColor.r;
        node->ambColor.g = u_ambientColor.g;
        node->ambColor.b = u_ambientColor.b;
        node->unk5C = s_fogEnabled;
        mathutil_mtxA_to_mtx(node->unkC);
        ord_tbl_insert_node(entry, &node->node);
    }
}

void nl2ngc_draw_model_alpha_unsorted(struct NaomiModel *model, float alpha)
{
    struct NaomiMesh *mesh;

    if (model->unk0 != -1)
    {
        s_renderParams.u_scaleCopy = s_renderParams.u_scale;
        if (s_renderParams.u_scale == 1.0f)
        {
            if (test_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius,
                                              s_renderParams.u_scale) == 0)
            {
                s_renderParams.u_scale = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
        {
            gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0) | (1 << GX_VA_TEX0));
            s_naomiMaterialCache.hasVerticesWithColor = 1;
        }
        else
        {
            gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_NRM) | (1 << GX_VA_TEX0));
            s_naomiMaterialCache.hasVerticesWithColor = 0;
        }

        s_naomiMaterialCache.alpha = alpha;
        prep_some_stuff_before_drawing_2();
        GXLoadTexMtxImm(textureMatrix, GX_TEXMTX0, GX_MTX2x4);
        GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
        GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

        mesh = (struct NaomiMesh *)model->meshStart;
        while (mesh->flags != 0)
        {
            struct NaomiDispList *dlstart;
            struct NaomiMesh *next;

            do_some_stuff_with_mesh_colors_2(mesh);
            dlstart = (void *)(mesh->dispListStart);
            next = (void *)(mesh->dispListStart + mesh->dispListSize);
            switch (mesh->type)
            {
            case -2:
                break;
            case -3:
                u_draw_naomi_disp_list_pos_color_tex_2(dlstart, next);
                break;
            default:
                u_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
                break;
            }
            mesh = next;
        }
        func_800341B8();
    }
}

void u_nl2ngc_draw_model_sort_translucent_alt(struct NaomiModel *model)
{
    u_nl2ngc_draw_model_sort_translucent(model);
}

void nl2ngc_draw_model_unsorted_alt(struct NaomiModel *model)
{
    nl2ngc_draw_model_unsorted(model);
}

// unused stuff?

u32 lbl_801B79E4[] = {9, 1, 10, 1, 13, 1, 255, 1};
u32 lbl_801B7A04[] = {9, 1, 4, 0, 10, 0, 4, 0, 13, 1, 4, 0, 255, 1, 4, 0};
u32 lbl_801B7A44[] = {9, 1, 11, 1, 13, 1, 255, 1};
u32 lbl_801B7A64[] = {9, 1, 4, 0, 11, 1, 5, 0, 13, 1, 4, 0, 255, 1, 4, 0};

void *lbl_801B7AA4[] = {
    lbl_801B79E4,
    lbl_801B7A04,
    lbl_801B7A44,
    lbl_801B7A64,
};

GXBlendFactor lbl_801B7AB4[] = {0, 1, 2, 3, 4, 5, 6, 7};
GXBlendFactor lbl_801B7AD4[] = {0, 1, 2, 3, 4, 5, 6, 7};
GXCompare s_naomiToGXCompare[] = {GX_NEVER,  GX_GEQUAL, GX_EQUAL,  GX_GEQUAL,
                                GX_LEQUAL, GX_NEQUAL, GX_LEQUAL, GX_ALWAYS};
GXCullMode s_naomiToGXCullModes[] = {GX_CULL_ALL, GX_CULL_NONE, GX_CULL_BACK, GX_CULL_FRONT};

static void prep_some_stuff_before_drawing(void)
{
    GXColor ambColor;

    s_naomiMaterialCache.unk4 = 0;
    s_naomiMaterialCache.unk5 = 1;
    s_naomiMaterialCache.unk6 = 0;
    GXSetBlendMode_cached(GX_BM_NONE, lbl_801B7AB4[1], lbl_801B7AD4[0], GX_LO_CLEAR);
    s_naomiMaterialCache.unk20 = gxCache->compareEnable;
    s_naomiMaterialCache.unk24 = gxCache->compareFunc;
    s_naomiMaterialCache.unk28 = gxCache->updateEnable;
    s_naomiMaterialCache.unk7 = 4;
    s_naomiMaterialCache.unk8 = 0;

    GXSetZMode_cached(GX_ENABLE, s_naomiToGXCompare[s_naomiMaterialCache.unk7], (!s_naomiMaterialCache.unk8));

    if (s_fogEnabled != 0)
        GXSetFog_cached(s_fogType, s_fogStartZ, s_fogEndZ, 0.1f, 20000.0f, s_fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, s_fogColor);

    s_naomiMaterialCache.unkA = 2;
    GXSetCullMode_cached(s_naomiToGXCullModes[2]);
    s_naomiMaterialCache.texObj = 0;
    s_naomiMaterialCache.texMapId = 0;

    s_naomiMaterialCache.materialColor.r = s_renderParams.materialColor.r * 255.0f;
    s_naomiMaterialCache.materialColor.g = s_renderParams.materialColor.g * 255.0f;
    s_naomiMaterialCache.materialColor.b = s_renderParams.materialColor.b * 255.0f;
    s_naomiMaterialCache.materialColor.a = 255;
    GXSetChanMatColor(GX_COLOR0A0, s_naomiMaterialCache.materialColor);

    ambColor.r = s_naomiMaterialCache.ambientColor.r = 0;
    ambColor.g = s_naomiMaterialCache.ambientColor.g = 0;
    ambColor.b = s_naomiMaterialCache.ambientColor.b = 0;
    ambColor.a = s_naomiMaterialCache.ambientColor.a = s_naomiMaterialCache.materialColor.a;
    GXSetChanAmbColor(GX_COLOR0A0, ambColor);

    s_naomiMaterialCache.unk9 = 0;
    GXSetChanCtrl(GX_COLOR0A0,    // chan
                  GX_ENABLE,      // enable
                  GX_SRC_REG,     // amb_src
                  GX_SRC_REG,     // mat_src
                  s_lightMask, // light_mask
                  GX_DF_CLAMP,    // diff_fn
                  GX_AF_SPOT);    // attn_fn
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetNumTevStages_cached(1);
    GXSetNumTexGens(1);
    GXSetNumIndStages(0);
    GXSetNumChans(1);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
}

static void build_tev_material(struct NaomiMesh *pmesh)
{
    struct NaomiMesh mesh = *pmesh;
    GXColor color;
    u32 r28;
    u32 r25;
    u32 r26;
    u32 r27;

    switch ((mesh.flags >> 24) & 7)
    {
    case 0:
        if (s_naomiMaterialCache.unk4 != 0)
        {
            GXSetBlendMode_cached(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
            s_naomiMaterialCache.unk4 = 0;
            s_naomiMaterialCache.unk5 = 1;
            s_naomiMaterialCache.unk6 = 0;
        }
        break;
    default:
        r25 = mesh.texFlags >> 29;
        r27 = (mesh.texFlags >> 26) & 7;
        if (s_naomiMaterialCache.unk4 != 2 || s_naomiMaterialCache.unk5 != r25 || s_naomiMaterialCache.unk6 != r27)
        {
            GXSetBlendMode_cached(GX_BM_BLEND, lbl_801B7AB4[r25], lbl_801B7AD4[r27], GX_LO_CLEAR);
            s_naomiMaterialCache.unk4 = 2;
            s_naomiMaterialCache.unk5 = r25;
            s_naomiMaterialCache.unk6 = r27;
        }
        break;
    }

    r28 = mesh.unk4 >> 29;
    r26 = mesh.unk4 & 0x4000000;
    if (s_naomiMaterialCache.unk7 != r28 || s_naomiMaterialCache.unk8 != r26)
    {
        GXSetZMode_cached(GX_ENABLE, s_naomiToGXCompare[r28], (!r26));
        s_naomiMaterialCache.unk7 = r28;
        s_naomiMaterialCache.unk8 = r26;
    }

    if (s_fogEnabled != 0)
        GXSetFog_cached(s_fogType, s_fogStartZ, s_fogEndZ, 0.1f, 20000.0f, s_fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, s_fogColor);

    if (mesh.tplTexIdx < 0)
    {
        GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
        GXSetTevOp_cached(GX_TEVSTAGE0, GX_PASSCLR);
    }
    else
    {
        GXTexMapID u_texMapId = s_naomiMaterialCache.texMapId;

        if (s_naomiMaterialCache.texObj != mesh.texObj)
        {
            s_naomiMaterialCache.texObj = mesh.texObj;
            if (--u_texMapId < 0)
                u_texMapId = 7;
            s_naomiMaterialCache.texMapId = u_texMapId;
            GXLoadTexObj_cached(mesh.texObj, u_texMapId);
        }
        GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, u_texMapId, GX_COLOR0A0);
        switch ((mesh.texFlags >> 6) & 3)
        {
        case 0:
            GXSetTevOp_cached(GX_TEVSTAGE0, GX_REPLACE);
            break;
        case 1:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            break;
        case 2:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_RASC, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_RASA);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            break;
        case 3:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_RASA, GX_CA_TEXA, GX_CA_ZERO);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            break;
        }
    }

    color.r = mesh.unk30 * s_renderParams.materialColor.r * 255.0f;
    color.g = mesh.unk34 * s_renderParams.materialColor.g * 255.0f;
    color.b = mesh.unk38 * s_renderParams.materialColor.b * 255.0f;
    color.a = mesh.unk2C * 255.0f;
    if (s_naomiMaterialCache.materialColor.r != color.r || s_naomiMaterialCache.materialColor.g != color.g ||
        s_naomiMaterialCache.materialColor.b != color.b || s_naomiMaterialCache.materialColor.a != color.a)
    {
        GXSetChanMatColor(GX_COLOR0A0, color);
        s_naomiMaterialCache.materialColor = color;
    }

    color.r = mesh.unk28 * u_ambientColor.r * 255.0f;
    color.g = mesh.unk28 * u_ambientColor.g * 255.0f;
    color.b = mesh.unk28 * u_ambientColor.b * 255.0f;
    color.a = s_naomiMaterialCache.materialColor.a;
    if (s_naomiMaterialCache.ambientColor.r != color.r || s_naomiMaterialCache.ambientColor.g != color.g ||
        s_naomiMaterialCache.ambientColor.b != color.b || s_naomiMaterialCache.ambientColor.a != color.a)
    {
        GXSetChanAmbColor(GX_COLOR0A0, color);
        s_naomiMaterialCache.ambientColor = color;
    }

    if (s_naomiMaterialCache.unk9 != mesh.type)
    {
        s_naomiMaterialCache.unk9 = mesh.type;
        switch (mesh.type)
        {
        case -1:
            GXSetChanCtrl(GX_COLOR0A0,   // chan
                          GX_DISABLE,    // enable
                          GX_SRC_REG,    // amb_src
                          GX_SRC_REG,    // mat_src
                          GX_LIGHT_NULL, // light_mask
                          GX_DF_CLAMP,   // diff_fn
                          GX_AF_SPOT);   // attn_fn
            break;
        case -3:
            GXSetChanCtrl(GX_COLOR0A0,   // chan
                          GX_DISABLE,    // enable
                          GX_SRC_VTX,    // amb_src
                          GX_SRC_VTX,    // mat_src
                          GX_LIGHT_NULL, // light_mask
                          GX_DF_CLAMP,   // diff_fn
                          GX_AF_SPOT);   // attn_fn
            break;
        case -2:
        default:
            GXSetChanCtrl(GX_COLOR0A0,    // chan
                          GX_ENABLE,      // enable
                          GX_SRC_REG,     // amb_src
                          GX_SRC_REG,     // mat_src
                          s_lightMask, // light_mask
                          GX_DF_CLAMP,    // diff_fn
                          GX_AF_SPOT);    // attn_fn
            break;
        }
    }
}

void u_draw_naomi_disp_list_pos_nrm_tex(struct NaomiDispList *dl, void *end)
{
    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_NRM) | (1 << GX_VA_TEX0));

    if (s_naomiMaterialCache.hasVerticesWithColor != 0)
        s_naomiMaterialCache.hasVerticesWithColor = 0;

    while (dl < (struct NaomiDispList *)end)
    {
        int faceCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithNormal *vtx;
        u8 r4 = dl->flags & 3;

        faceCount = dl->faceCount;
        if (s_naomiMaterialCache.unkA != r4)
        {
            s_naomiMaterialCache.unkA = r4;
            GXSetCullMode_cached(s_naomiToGXCullModes[r4]);
        }

        if (dl->flags & (NAOMI_DLIST_FLAG_TRIANGLESTRIP))
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
        else if (dl->flags & (NAOMI_DLIST_FLAG_TRIANGLES))
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
        else if (dl->flags & (NAOMI_DLIST_FLAG_QUADS))
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

void u_draw_naomi_disp_list_pos_color_tex_1(struct NaomiDispList *dl, void *end)
{
    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0) | (1 << GX_VA_TEX0));

    if (s_naomiMaterialCache.hasVerticesWithColor != 1)
        s_naomiMaterialCache.hasVerticesWithColor = 1;

    while (dl < (struct NaomiDispList *)end)
    {
        int faceCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithColor *vtx;
        u8 r4 = dl->flags & 3;

        faceCount = dl->faceCount;
        if (s_naomiMaterialCache.unkA != r4)
        {
            s_naomiMaterialCache.unkA = r4;
            GXSetCullMode_cached(s_naomiToGXCullModes[r4]);
        }

        if (dl->flags & (1 << 4))
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
                    GXColor4u8(((color >> 16) & 0xFF) * s_renderParams.materialColor.r,
                               ((color >> 8) & 0xFF) * s_renderParams.materialColor.g,
                               ((color >> 0) & 0xFF) * s_renderParams.materialColor.b,
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
                    GXColor4u8(((color >> 16) & 0xFF) * s_renderParams.materialColor.r,
                               ((color >> 8) & 0xFF) * s_renderParams.materialColor.g,
                               ((color >> 0) & 0xFF) * s_renderParams.materialColor.b,
                               ((color >> 24) & 0xFF));
                    GXTexCoord2f32(vtx->s, vtx->t);
                    vtxData += 8;
                }
                faceCount--;
            }
            GXEnd();
        }
        else if (dl->flags & (1 << 3))
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
                        GXColor4u8(((color >> 16) & 0xFF) * s_renderParams.materialColor.r,
                                   ((color >> 8) & 0xFF) * s_renderParams.materialColor.g,
                                   ((color >> 0) & 0xFF) * s_renderParams.materialColor.b,
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
                        GXColor4u8(((color >> 16) & 0xFF) * s_renderParams.materialColor.r,
                                   ((color >> 8) & 0xFF) * s_renderParams.materialColor.g,
                                   ((color >> 0) & 0xFF) * s_renderParams.materialColor.b,
                                   ((color >> 24) & 0xFF));
                        GXTexCoord2f32(vtx->s, vtx->t);
                        vtxData += 8;
                    }
                }
                faceCount--;
            }
            GXEnd();
        }
        else if (dl->flags & (1 << 2))
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
                        GXColor4u8(((color >> 16) & 0xFF) * s_renderParams.materialColor.r,
                                   ((color >> 8) & 0xFF) * s_renderParams.materialColor.g,
                                   ((color >> 0) & 0xFF) * s_renderParams.materialColor.b,
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
                        GXColor4u8(((color >> 16) & 0xFF) * s_renderParams.materialColor.r,
                                   ((color >> 8) & 0xFF) * s_renderParams.materialColor.g,
                                   ((color >> 0) & 0xFF) * s_renderParams.materialColor.b,
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

    s_naomiMaterialCache.unk4 = 0;
    s_naomiMaterialCache.unk5 = 4;
    s_naomiMaterialCache.unk6 = 5;

    GXSetBlendMode_cached(GX_BM_BLEND, lbl_801B7AB4[4], lbl_801B7AD4[5], GX_LO_CLEAR);

    s_naomiMaterialCache.unk20 = gxCache->compareEnable;
    s_naomiMaterialCache.unk20 = gxCache->compareFunc; //! mistake?
    s_naomiMaterialCache.unk28 = gxCache->updateEnable;
    s_naomiMaterialCache.unk7 = 4;
    s_naomiMaterialCache.unk8 = 0;

    GXSetZMode_cached(GX_ENABLE, s_naomiToGXCompare[s_naomiMaterialCache.unk7], (!s_naomiMaterialCache.unk8));

    if (s_fogEnabled != 0)
        GXSetFog_cached(s_fogType, s_fogStartZ, s_fogEndZ, 0.1f, 20000.0f, s_fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, s_fogColor);

    s_naomiMaterialCache.unkA = 2;
    GXSetCullMode_cached(s_naomiToGXCullModes[2]);
    s_naomiMaterialCache.texObj = 0;
    s_naomiMaterialCache.texMapId = 0;

    s_naomiMaterialCache.materialColor.r = s_renderParams.materialColor.r * 255.0f;
    s_naomiMaterialCache.materialColor.g = s_renderParams.materialColor.g * 255.0f;
    s_naomiMaterialCache.materialColor.b = s_renderParams.materialColor.b * 255.0f;
    s_naomiMaterialCache.materialColor.a = s_naomiMaterialCache.alpha * 255.0f;
    GXSetChanMatColor(GX_COLOR0A0, s_naomiMaterialCache.materialColor);

    sp18.r = s_naomiMaterialCache.ambientColor.r = 0;
    sp18.g = s_naomiMaterialCache.ambientColor.g = 0;
    sp18.b = s_naomiMaterialCache.ambientColor.b = 0;
    sp18.a = s_naomiMaterialCache.ambientColor.a = s_naomiMaterialCache.materialColor.a;
    GXSetChanAmbColor(GX_COLOR0A0, sp18);

    s_naomiMaterialCache.unk9 = 0;
    GXSetChanCtrl(GX_COLOR0A0,    // chan
                  GX_ENABLE,      // enable
                  GX_SRC_REG,     // amb_src
                  GX_SRC_REG,     // mat_src
                  s_lightMask, // light_mask
                  GX_DF_CLAMP,    // diff_fn
                  GX_AF_SPOT);    // attn_fn
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

    switch ((mesh.flags >> 24) & 7)
    {
    case 0:
        if (s_naomiMaterialCache.unk4 != 0)
        {
            GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
            s_naomiMaterialCache.unk4 = 0;
            s_naomiMaterialCache.unk5 = 4;
            s_naomiMaterialCache.unk6 = 5;
        }
        break;
    default:
        r25 = mesh.texFlags >> 29;
        r27 = (mesh.texFlags >> 26) & 7;
        if (s_naomiMaterialCache.unk4 != 2 || s_naomiMaterialCache.unk5 != r25 || s_naomiMaterialCache.unk6 != r27)
        {
            GXSetBlendMode_cached(GX_BM_BLEND, lbl_801B7AB4[r25], lbl_801B7AD4[r27], GX_LO_CLEAR);
            s_naomiMaterialCache.unk4 = 2;
            s_naomiMaterialCache.unk5 = r25;
            s_naomiMaterialCache.unk6 = r27;
        }
        break;
    }

    r28 = mesh.unk4 >> 29;
    r26 = mesh.unk4 & 0x4000000;
    if (s_naomiMaterialCache.unk7 != r28 || s_naomiMaterialCache.unk8 != r26)
    {
        GXSetZMode_cached(GX_ENABLE, s_naomiToGXCompare[r28], (!r26));
        s_naomiMaterialCache.unk7 = r28;
        s_naomiMaterialCache.unk8 = r26;
    }

    if (s_fogEnabled != 0)
        GXSetFog_cached(s_fogType, s_fogStartZ, s_fogEndZ, 0.1f, 20000.0f, s_fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, s_fogColor);

    if (mesh.tplTexIdx < 0)
    {
        GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
        GXSetTevOp_cached(GX_TEVSTAGE0, GX_PASSCLR);
    }
    else
    {
        int r25 = s_naomiMaterialCache.texMapId;

        if (s_naomiMaterialCache.texObj != mesh.texObj)
        {
            s_naomiMaterialCache.texObj = mesh.texObj;
            if (--r25 < 0)
                r25 = 7;
            s_naomiMaterialCache.texMapId = r25;
            GXLoadTexObj_cached(mesh.texObj, r25);
        }
        GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, r25, GX_COLOR0A0);
        switch ((mesh.texFlags >> 6) & 3)
        {
        case 0:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_TEXA, GX_CA_RASA, GX_CA_ZERO);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            break;
        case 1:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_TEXA, GX_CA_RASA, GX_CA_ZERO);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            break;
        case 2:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_RASC, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_RASA);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            break;
        case 3:
            GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
            GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_RASA, GX_CA_TEXA, GX_CA_ZERO);
            GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE,
                                   GX_TEVPREV);
            break;
        }
    }

    color.r = mesh.unk30 * s_renderParams.materialColor.r * 255.0f;
    color.g = mesh.unk34 * s_renderParams.materialColor.g * 255.0f;
    color.b = mesh.unk38 * s_renderParams.materialColor.b * 255.0f;
    color.a = mesh.unk2C * s_naomiMaterialCache.alpha * 255.0f;
    if (s_naomiMaterialCache.materialColor.r != color.r || s_naomiMaterialCache.materialColor.g != color.g ||
        s_naomiMaterialCache.materialColor.b != color.b || s_naomiMaterialCache.materialColor.a != color.a)
    {
        GXSetChanMatColor(GX_COLOR0A0, color);
        s_naomiMaterialCache.materialColor = color;
    }

    color.r = mesh.unk28 * u_ambientColor.r * 255.0f;
    color.g = mesh.unk28 * u_ambientColor.g * 255.0f;
    color.b = mesh.unk28 * u_ambientColor.b * 255.0f;
    color.a = s_naomiMaterialCache.materialColor.a;
    if (s_naomiMaterialCache.ambientColor.r != color.r || s_naomiMaterialCache.ambientColor.g != color.g ||
        s_naomiMaterialCache.ambientColor.b != color.b || s_naomiMaterialCache.ambientColor.a != color.a)
    {
        GXSetChanAmbColor(GX_COLOR0A0, color);
        s_naomiMaterialCache.ambientColor = color;
    }

    if (s_naomiMaterialCache.unk9 != mesh.type)
    {
        s_naomiMaterialCache.unk9 = mesh.type;
        switch (mesh.type)
        {
        case -1:
            GXSetChanCtrl(GX_COLOR0A0,   // chan
                          GX_DISABLE,    // enable
                          GX_SRC_REG,    // amb_src
                          GX_SRC_REG,    // mat_src
                          GX_LIGHT_NULL, // light_mask
                          GX_DF_CLAMP,   // diff_fn
                          GX_AF_SPOT);   // attn_fn
            break;
        case -3:
            GXSetChanCtrl(GX_COLOR0A0,   // chan
                          GX_DISABLE,    // enable
                          GX_SRC_VTX,    // amb_src
                          GX_SRC_VTX,    // mat_src
                          GX_LIGHT_NULL, // light_mask
                          GX_DF_CLAMP,   // diff_fn
                          GX_AF_SPOT);   // attn_fn
            break;
        case -2:
        default:
            GXSetChanCtrl(GX_COLOR0A0,    // chan
                          GX_ENABLE,      // enable
                          GX_SRC_REG,     // amb_src
                          GX_SRC_REG,     // mat_src
                          s_lightMask, // light_mask
                          GX_DF_CLAMP,    // diff_fn
                          GX_AF_SPOT);    // attn_fn
            break;
        }
    }
}

static inline void handle_color_vtx(struct NaomiVtxWithColor *vtx)
{
    u32 color;
    GXPosition3f32(vtx->x, vtx->y, vtx->z);
    color = vtx->color;
    GXColor4u8(((color >> 16) & 0xFF) * s_renderParams.materialColor.r,
               ((color >> 8) & 0xFF) * s_renderParams.materialColor.g,
               ((color >> 0) & 0xFF) * s_renderParams.materialColor.b,
               ((color >> 24) & 0xFF) * s_naomiMaterialCache.alpha);
    GXTexCoord2f32(vtx->s, vtx->t);
}

void u_draw_naomi_disp_list_pos_color_tex_2(struct NaomiDispList *dl, void *end)
{
    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0) | (1 << GX_VA_TEX0));

    if (s_naomiMaterialCache.hasVerticesWithColor != 1)
        s_naomiMaterialCache.hasVerticesWithColor = 1;

    while (dl < (struct NaomiDispList *)end)
    {
        int faceCount;
        int i;
        u8 *vtxData = dl->vtxData;
        struct NaomiVtxWithColor *vtx;
        u8 r4 = dl->flags & 3;

        faceCount = dl->faceCount;
        if (s_naomiMaterialCache.unkA != r4)
        {
            s_naomiMaterialCache.unkA = r4;
            GXSetCullMode_cached(s_naomiToGXCullModes[r4]);
        }

        if (dl->flags & (1 << 4))
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
        else if (dl->flags & (1 << 3))
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
        else if (dl->flags & (1 << 2))
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

void u_call_draw_naomi_model_and_do_other_stuff(struct NaomiModel *model)
{
    u_nl2ngc_draw_model_sort_translucent(model);
}

void u_dupe_of_call_draw_naomi_model_1(struct NaomiModel *model)
{
    nl2ngc_draw_model_unsorted(model);
}

void u_call_draw_model_with_alpha_deferred(struct NaomiModel *model, float b)
{
    nl2ngc_draw_model_alpha_sorted(model, b);
}

void nl2ngc_set_light_mask(u32 lightMask)
{
    s_lightMask = lightMask;
}

void nl2ngc_set_ambient(float r, float g, float b)
{
    u_ambientColor.r = r;
    u_ambientColor.g = g;
    u_ambientColor.b = b;
}

void func_80033B50(int a)
{
    s_fogEnabled = a;
}

void func_80033B58(u32 a, float b, float c)
{
    s_fogType = a;
    s_fogStartZ = b;
    s_fogEndZ = c;
}

void u_nl2ngc_set_some_other_color(int r, int g, int b)
{
    s_fogColor.r = r;
    s_fogColor.g = g;
    s_fogColor.b = b;
}

void u_draw_opaque_model(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->flags & (1 << 1))
    {
        gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0) | (1 << GX_VA_TEX0));
        s_naomiMaterialCache.hasVerticesWithColor = 1;
    }
    else
    {
        gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_NRM) | (1 << GX_VA_TEX0));
        s_naomiMaterialCache.hasVerticesWithColor = 0;
    }

    prep_some_stuff_before_drawing();
    GXLoadTexMtxImm(textureMatrix, GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->flags != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        build_tev_material(mesh);
        next = (void *)(mesh->dispListStart + mesh->dispListSize);
        if (((mesh->flags >> 24) & 7) != 0)
            mesh = next;
        else
        {
            dlstart = (void *)(mesh->dispListStart);
            switch (mesh->type)
            {
            case -2:
                break;
            case -3:
                u_draw_naomi_disp_list_pos_color_tex_1(dlstart, next);
                break;
            default:
                u_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
                break;
            }
            mesh = next;
        }
    }
    func_800341B8();
}

static void lbl_80033C8C(struct DrawModelDeferredNode *a)
{
    float f31, f30, f29;

    mathutil_mtxA_from_mtx(a->viewFromModel);

    f31 = s_renderParams.materialColor.r;
    f30 = s_renderParams.materialColor.g;
    f29 = s_renderParams.materialColor.b;

    s_renderParams.materialColor.r = a->materialColoir.r;
    s_renderParams.materialColor.g = a->materialColoir.g;
    s_renderParams.materialColor.b = a->materialColoir.b;
    if (!(a->model->flags & (1 << 10)))
    {
        load_light_group_cached(a->lightGroup);
        nl2ngc_set_ambient(a->ambientColor.r, a->ambientColor.g, a->ambientColor.b);
    }
    s_fogEnabled = a->fogEnabled;
    u_draw_naomi_model_4(a->model);

    s_renderParams.materialColor.r = f31;
    s_renderParams.materialColor.g = f30;
    s_renderParams.materialColor.b = f29;
}

void u_draw_naomi_model_4(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->flags & (1 << 1))
    {
        gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0) | (1 << GX_VA_TEX0));
        s_naomiMaterialCache.hasVerticesWithColor = 1;
    }
    else
    {
        gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_NRM) | (1 << GX_VA_TEX0));
        s_naomiMaterialCache.hasVerticesWithColor = 0;
    }

    prep_some_stuff_before_drawing();
    GXLoadTexMtxImm(textureMatrix, GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->flags != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        build_tev_material(mesh);
        next = (void *)(mesh->dispListStart + mesh->dispListSize);
        if (((mesh->flags >> 24) & 7) == 0)
            mesh = next;
        else
        {
            dlstart = (void *)(mesh->dispListStart);
            switch (mesh->type)
            {
            case -2:
                break;
            case -3:
                u_draw_naomi_disp_list_pos_color_tex_1(dlstart, next);
                break;
            default:
                u_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
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

    f31 = s_renderParams.materialColor.r;
    f30 = s_renderParams.materialColor.g;
    f29 = s_renderParams.materialColor.b;

    s_renderParams.materialColor.r = a->unk3C.r;
    s_renderParams.materialColor.g = a->unk3C.g;
    s_renderParams.materialColor.b = a->unk3C.b;
    s_naomiMaterialCache.alpha = a->alpha;
    if (!(a->model->flags & (1 << 10)))
    {
        load_light_group_cached(a->unk4C);
        nl2ngc_set_ambient(a->ambColor.r, a->ambColor.g, a->ambColor.b);
    }
    s_fogEnabled = a->unk5C;
    u_draw_naomi_model_5(a->model);

    s_renderParams.materialColor.r = f31;
    s_renderParams.materialColor.g = f30;
    s_renderParams.materialColor.b = f29;
}

void u_draw_naomi_model_5(struct NaomiModel *model)
{
    struct NaomiMesh *mesh;

    if (model->unk0 == -1)
        return;

    if (model->flags & (1 << 1))
    {
        gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0) | (1 << GX_VA_TEX0));
        s_naomiMaterialCache.hasVerticesWithColor = 1;
    }
    else
    {
        gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_NRM) | (1 << GX_VA_TEX0));
        s_naomiMaterialCache.hasVerticesWithColor = 0;
    }

    prep_some_stuff_before_drawing_2();
    GXLoadTexMtxImm(textureMatrix, GX_TEXMTX0, GX_MTX2x4);
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXLoadNrmMtxImm(mathutilData->mtxA, GX_PNMTX0);

    mesh = (struct NaomiMesh *)model->meshStart;
    while (mesh->flags != 0)
    {
        struct NaomiDispList *dlstart;
        struct NaomiMesh *next;

        do_some_stuff_with_mesh_colors_2(mesh);
        next = (void *)(mesh->dispListStart + mesh->dispListSize);
        dlstart = (void *)(mesh->dispListStart);
        switch (mesh->type)
        {
        case -2:
            break;
        case -3:
            u_draw_naomi_disp_list_pos_color_tex_2(dlstart, next);
            break;
        default:
            u_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
            break;
        }
        mesh = next;
    }
    func_800341B8();
}

void u_draw_naomi_model_with_mesh_func(struct NaomiModel *model, int (*func)())
{
    struct NaomiMesh *mesh;

    if (model->unk0 != -1)
    {
        s_renderParams.u_scaleCopy = s_renderParams.u_scale;
        if (s_renderParams.u_scale == 1.0f)
        {
            if (test_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius) == 0)
                return;
        }
        else
        {
            if (test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius,
                                              s_renderParams.u_scaleCopy) == 0)
            {
                s_renderParams.u_scale = 1.0f;
                return;
            }
        }
        if (model->flags & (1 << 1))
        {
            gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0) | (1 << GX_VA_TEX0));
            s_naomiMaterialCache.hasVerticesWithColor = 1;
        }
        else
        {
            gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_NRM) | (1 << GX_VA_TEX0));
            s_naomiMaterialCache.hasVerticesWithColor = 0;
        }
        s_naomiMaterialCache.alpha = 1.0f;

        mesh = (struct NaomiMesh *)model->meshStart;
        while (mesh->flags != 0)
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
                    u_draw_naomi_disp_list_pos_color_tex_1(dlstart, next);
                    break;
                default:
                    u_draw_naomi_disp_list_pos_nrm_tex(dlstart, next);
                    break;
                }
                mesh = next;
            }
        }
    }
}

void func_800341B8(void)
{
}
