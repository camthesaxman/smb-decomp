#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "dolphin/GXEnum.h"
#include "global.h"
#include "gxutil.h"
#include "load.h"
#include "mathutil.h"
#include "ord_tbl.h"
#include "types.h"
#include "tevutil.h"

struct UnkStruct4
{
    u8 filler0[0x18];
    u16 unk18;
    u8 unk1A[4];
    u8 unk1E;
    u8 filler1F[0x40-0x1F];
    u8 unk40[100];  // What type is this?
};

char *invalidModelName = "Invalid Model";

// .sbss
float s_fogEndZ;
float s_fogStartZ;
GXColor s_fogColor;
u32 s_fogType;
s32 s_g_customFogEnabled;
GXColor g_tevKColor3;
s32 lbl_802F2114;
GXColor g_tevKColor2;
s32 lbl_802F210C;
s32 lbl_802F2108;
GXCompare s_zModeCompareFunc;
GXBool s_zModeUpdateEnable;
GXBool s_zModeCompareEnable;
float lbl_802F20FC;
float lbl_802F20F8;
float lbl_802F20F4;
Func802F20F0 lbl_802F20F0;
BallEnvFunc lbl_802F20EC;
s32 g_cullMode;
float modelScale;
u32 g_someLightMask;
float g_globalAlpha;
float lbl_802F20D8;
float lbl_802F20D4;
float lbl_802F20D0;
Mtx *g_transformMtxList;  // result of matrix multiplications between mtxA and avdispMtxPtrList?
Mtx **avdispMtxPtrList;

struct Struct802B4ECC
{
    u8 unk0;  // 0x6c
    s8 g_tevStageCount;
    u8 unk2;
    s8 unk3;
    s8 unk4;
    s8 unk5;
    u8 filler6[2];
    s32 unk8;
    s32 unkC;
    GXColor unk10;  // 0x7C
    GXColor unk14;
    GXColor unk18;
    s32 g_tevColorInD;
    s32 g_tevAlphaInD;
    GXBlendFactor g_blendSrcFactor;
    GXBlendFactor g_blendDstFactor;
    u32 g_tevStagesFilled[3];  // 0x98  array?
    u32 unk38;  // 0xA4
    u16 g_samplerIdxs[3];  // 0xA8
    s32 unk44;  // 0xB0
    s32 unk48;  // 0xB4
    s32 unk4C;  // 0xB8
    s32 unk50;  // 0xBC
    s32 unk54;  // 0xC0
    Point3d unk58;
};

// .bss
static Vec lbl_802B4E60;
static Mtx lbl_802B4E6C;
static Mtx lbl_802B4E9C;
static struct Struct802B4ECC g_tevStageCache;
static GXTexObj unknownTexObj;
static u8 filler_802B4F50[0x10];
static u8 lzssHeader[32] __attribute__((aligned(32)));
static u8 unknownTexImg[64];

FORCE_BSS_ORDER(lbl_802B4E60)
FORCE_BSS_ORDER(lbl_802B4E6C)
FORCE_BSS_ORDER(lbl_802B4E9C)
FORCE_BSS_ORDER(g_tevStageCache)
FORCE_BSS_ORDER(unknownTexObj)
FORCE_BSS_ORDER(filler_802B4F50)
FORCE_BSS_ORDER(lzssHeader)
FORCE_BSS_ORDER(unknownTexImg)

#ifdef __MWERKS__
asm void func_8008D6BC(register u32 arg)
{
    nofralloc
    lis r5, GXWGFifo@h
    li r4, GX_LOAD_BP_REG
    ori r5, r5, GXWGFifo@l
    stb r4, 0(r5)
    stw arg, 0(r5)
    blr
}
#else
void func_8008D6BC(u32 arg)
{
    GXWGFifo.u8 = GX_LOAD_BP_REG;
    GXWGFifo.u32 = arg;
}
#endif

#ifdef __MWERKS__
asm void func_8008D6D4(register void *arg)
{
    nofralloc
    lis r10, 0xE0000000@h
    psq_l f5, 424(r10), 0, qr2
    li r6, 0x10
    lis r9, GXWGFifo@h
    ori r9, r9, GXWGFifo@l
    lwz r5, 0(arg)
    andi. r7, r5, 8
    bne lbl_8008D710
    ps_mr f0, f5
    ps_mr f1, f5
    andi. r7, r5, 0x80
    bne lbl_8008D71C
    li r4, -1
    ps_mr f4, f5
    b lbl_8008D724
lbl_8008D710:
    psq_l f0, 8(arg), 0, qr2
    psq_l f1, 10(arg), 1, qr2
    ps_merge00 f1, f1, f5
lbl_8008D71C:
    lhz r4, 4(arg)
    psq_l f4, 6(arg), 1, qr2
lbl_8008D724:
    lis r7, lbl_802F20D0@h
    ori r7, r7, lbl_802F20D0@l
    psq_l f2, 0(r7), 0, qr0
    psq_l f3, 8(r7), 0, qr0
    ps_mul f0, f0, f2
    ps_mul f1, f1, f3
    psq_l f2, 17(arg), 1, qr2
    ps_merge10 f2, f2, f2
    psq_st f0, 152(r10), 0, qr2
    psq_st f1, 154(r10), 0, qr2
    lwz r7, 0x98(r10)
    li r8, 0x100a
    stb r6, 0(r9)
    stw r8, 0(r9)
    stw r7, 0(r9)
    ps_merge01 f4, f4, f3
    ps_mul f4, f4, f2
    sth r4, 0x98(r10)
    psq_st f4, 154(r10), 0, qr2
    lwz r7, 0x98(r10)
    li r8, 0x100c
    stb r6, 0(r9)
    stw r8, 0(r9)
    stw r7, 0(r9)
    blr
}
#else
void func_8008D6D4(register void *arg)
{
    // TODO
}
#endif

void func_8008D788(void)
{
    Vec sp8;
    lbl_802F20EC = NULL;
    lbl_802F20D8 = 1.0f;
    lbl_802F20D4 = 1.0f;
    lbl_802F20D0 = 1.0f;
    modelScale = 1.0f;
    g_globalAlpha = 1.0f;
    g_someLightMask = 1;
    lbl_802F20F0 = NULL;
    init_some_texture();
    sp8.x = 0.0f;
    sp8.y = 1.0f;
    sp8.z = 0.0f;
    g_avdisp_set_and_normalize_some_vec(&sp8);
    g_avdisp_set_3_other_floats(1.0f, 1.0f, 1.0f);
    avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
    lbl_802F2108 = 0;
    mathutil_mtxA_from_translate_xyz(0.0f, 0.0f, 1.0f);
    mathutil_mtxA_to_mtx(lbl_802B4E9C);
    g_avdisp_set_some_color_1(1.0f, 1.0f, 1.0f, 1.0f);
    g_avdisp_set_some_color_2(0.0f, 0.0f, 0.0f, 0.0f);
    g_avdisp_enable_custom_fog(0);
    func_8008F880(2, 0.0f, 100.0f);
    func_8008F890(0, 0, 0);
}

void g_avdisp_alloc_matrix_lists(int count)
{
    g_transformMtxList = OSAlloc(count * sizeof(Mtx));
    avdispMtxPtrList = OSAlloc(count * sizeof(Mtx *));
}

#pragma force_active on
void g_get_stitching_model_mtx(struct GMAModel *a, Mtx **dest)
{
    u8 i;
    int unused1;
    int unused2;
    // matrices are stored immediately after samplers
    Mtx *pMtx = (void *)((u8 *)a->samplers + a->samplerCount * sizeof(struct GMASampler));

    if (dest == NULL)
    {
        dest = avdispMtxPtrList;
        for (i = 0; i < a->mtxCount; i++)
        {
            *dest = pMtx;
            mathutil_mtx_copy(*pMtx, **dest);  // useless copy source and dest are the same
            pMtx++;
            dest++;
        }
    }
    else
    {
        for (i = 0; i < a->mtxCount; i++)
        {
            mathutil_mtx_copy(*pMtx, **dest);
            pMtx++;
            dest++;
        }
    }
}

struct GMAModel *load_model(char *fileName, struct TPL *tpl)
{
    struct GMAModel *model;
    u32 size;
    struct File file;

    if (!file_open(fileName, &file))
        return NULL;
    size = file_size(&file);
    model = OSAlloc(OSRoundUp32B(size));
    if (model == NULL)
        OSPanic("avdisp.c", 638, "cannot OSAlloc");
    file_read(&file, model, size, 0);
    file_close(&file);
    if (model->magic != (('G' << 24) | ('C' << 16) | ('M' << 8) | 'F'))
    {
        printf("invalid model format <%s>\n", fileName);
        OSFree(model);
        return NULL;
    }
    init_model(model, tpl, NULL);
    return model;
}

void free_model(struct GMAModel *model)
{
    if (model->texObjs != NULL)
        OSFree(model->texObjs);
    OSFree(model);
}
#pragma force_active reset

struct GMA *load_gma(char *fileName, struct TPL *tpl)
{
    int i;
    struct GMA *gma;
    u8 *fileData;
    struct File file;
    int len = strlen(fileName);

    if (len >= 3 && strncmp(fileName + (len - 3), ".lz", 3) == 0)
    {
        void *lzData;
        u32 compressedSize;
        u32 size;

        if (file_open(fileName, &file) == 0)
            return NULL;

        // Read LZSS header
        if (file_read(&file, lzssHeader, 32, 0) < 0)
            OSPanic("avdisp.c", 684, "cannot dvd_read");
        compressedSize = OSRoundUp32B(__lwbrx(lzssHeader, 0));
        size = OSRoundUp32B(__lwbrx(lzssHeader, 4));

        gma = OSAlloc(sizeof(*gma) + size);  // GMA struct followed by raw file data
        if (gma == NULL)
            OSPanic("avdisp.c", 688, "cannot OSAlloc\n");

        // Read whole file
        lzData = OSAlloc(compressedSize);
        if (lzData == NULL)
            OSPanic("avdisp.c", 689, "cannot OSAlooc\n");
        fileData = gma->fileData;
        if (file_read(&file, lzData, compressedSize, 0) < 0)
            OSPanic("avdisp.c", 692, "cannot dvd_read");
        if (file_close(&file) != 1)
            OSPanic("avdisp.c", 693, "cannot DVDClose");

        // Decompress data
        lzs_decompress(lzData, fileData);
        OSFree(lzData);
    }
    else
    {
        u32 size;

        if (file_open(fileName, &file) == 0)
            return NULL;
        size = file_size(&file);
        gma = OSAlloc(sizeof(*gma) + OSRoundUp32B(size));  // GMA struct followed by raw file data
        if (gma == NULL)
            OSPanic("avdisp.c", 702, "cannot OSAlloc");
        fileData = gma->fileData;
        file_read(&file, fileData, size, 0);
        file_close(&file);
    }

    // Read GMA header
    gma->numModels = *(u32 *)(fileData + 0);  // 0: number of models
    gma->modelsBase = OFFSET_TO_PTR(fileData, *(u32 *)(fileData + 4));  // 4: offset to model data
    gma->modelEntries = OFFSET_TO_PTR(fileData, 8);  // 8: model entries
    gma->namesBase = (char *)(gma->modelEntries + *(u32 *)(fileData + 0));  // names base follows model entries

    // Load models
    for (i = 0; i < gma->numModels; i++)
    {
        struct GMAModelEntry *entry = &gma->modelEntries[i];
        void *offset = entry->modelOffset;

        if ((u32)entry->modelOffset == 0xFFFFFFFF)
        {
            entry->modelOffset = NULL;
            entry->name = invalidModelName;
        }
        else
        {
            // Convert name and model offsets to pointers
            offset = OFFSET_TO_PTR(gma->modelsBase, (u32)offset);
            entry->modelOffset = offset;
            entry->name = OFFSET_TO_PTR(gma->namesBase, (u32)entry->name);
            // Load the model
            init_model(offset, tpl, NULL);
        }
    }
    return gma;
}

struct GMA *load_gma_from_aram(u32 aramSrc, u32 size, struct TPL *tpl)
{
    u32 alignedSize = OSRoundUp32B(size);
    int i;
    u8 *fileData;

    struct GMA *gma = OSAlloc(sizeof(*gma) + alignedSize);  // GMA struct followed by raw file data
    if (gma == NULL)
        OSPanic("avdisp.c", 750, "cannot OSAlloc");
    fileData = gma->fileData;
    DCInvalidateRange(fileData, alignedSize);
    while (ARGetDMAStatus() != 0)
        ;
    ARStartDMA(ARAM_DIR_ARAM_TO_MRAM, (u32)fileData, aramSrc, size);
    while (ARGetDMAStatus() != 0)
        ;

    // Read GMA header
    gma->numModels = *(u32 *)(fileData + 0);  // 0: number of models
    gma->modelsBase = OFFSET_TO_PTR(fileData, *(u32 *)(fileData + 4));  // 4: offset to model data
    gma->modelEntries = OFFSET_TO_PTR(fileData, 8);  // 8: model entries
    gma->namesBase = (char *)(gma->modelEntries + *(u32 *)(fileData + 0));  // names base follows model entries

    // Load models
    for (i = 0; i < gma->numModels; i++)
    {
        struct GMAModelEntry *entry = &gma->modelEntries[i];
        void *offset = entry->modelOffset;

        if ((u32)entry->modelOffset == 0xFFFFFFFF)
        {
            entry->modelOffset = NULL;
            entry->name = invalidModelName;
        }
        else
        {
            // Convert name and model offsets to pointers
            offset = OFFSET_TO_PTR(gma->modelsBase, (u32)offset);
            entry->modelOffset = offset;
            entry->name = OFFSET_TO_PTR(gma->namesBase, (u32)entry->name);
            // Load the model
            init_model(offset, tpl, NULL);
        }
    }
    return gma;
}

void free_gma(struct GMA *gma)
{
    int i;

    for (i = 0; i < (s32)gma->numModels; i++)
    {
        struct GMAModel *model = gma->modelEntries[i].modelOffset;

        if (model != NULL && model->texObjs != NULL)
            OSFree(model->texObjs);
    }
    OSFree(gma);
}

struct TPL *load_tpl(char *fileName)
{
    void *lzData;
    struct TPL *tpl;
    u8 *fileData;
    struct File file;
    int len = strlen(fileName);

    if (len >= 3 && strncmp(fileName + (len - 3), ".lz", 3) == 0)
    {
        u32 compressedSize;
        u32 size;

        if (file_open(fileName, &file) == 0)
            return NULL;

        // Read LZSS header
        if (file_read(&file, lzssHeader, 32, 0) < 0)
            OSPanic("avdisp.c", 822, "cannot dvd_read");
        compressedSize = OSRoundUp32B(__lwbrx(lzssHeader, 0));
        size = OSRoundUp32B(__lwbrx(lzssHeader, 4));

        tpl = OSAlloc(12 + size);  // TPL struct followed by raw file data
        if (tpl == NULL)
            OSPanic("avdisp.c", 826, "cannot OSAlloc\n");
        lzData = OSAlloc(compressedSize);
        if (lzData == NULL)
            OSPanic("avdisp.c", 827, "cannot OSAlooc\n");

        // Read whole file
        fileData = (void *)OSRoundUp32B((u32)tpl + 12);
        if (file_read(&file, lzData, compressedSize, 0) < 0)
            OSPanic("avdisp.c", 830, "cannot dvd_read");
        if (file_close(&file) != 1)
            OSPanic("avdisp.c", 831, "cannot DVDClose");

        // Decompress data
        lzs_decompress(lzData, fileData);
        OSFree(lzData);
    }
    else
    {
        u32 size;
        if (file_open(fileName, &file) == 0)
            return NULL;
        size = file_size(&file);
        tpl = OSAlloc(OSRoundUp32B(size) + 32);  // TPL struct followed by raw file data
        if (tpl == NULL)
            OSPanic("avdisp.c", 840, "cannot OSAlloc");
        fileData = (void *)OSRoundUp32B((u32)tpl + 12);
        file_read(&file, fileData, size, 0);
        file_close(&file);
    }

    tpl->numTextures = *(u32 *)(fileData + 0);  // 0: number of textures
    tpl->texHeaders = OFFSET_TO_PTR(fileData, 4);  // 4: texture headers
    tpl->fileData = fileData;
    return tpl;
}

struct TPL *load_tpl_from_aram(u32 aramSrc, u32 size)
{
    u32 alignedSize = OSRoundUp32B(size);
    struct TPL *tpl;
    u8 *fileData;

    tpl = OSAlloc(alignedSize + 32);
    if (tpl == NULL)
        OSPanic("avdisp.c", 865, "cannot OSAlloc");
    fileData = (void *)OSRoundUp32B((u32)tpl + 12);
    DCInvalidateRange(fileData, alignedSize);
    while (ARGetDMAStatus() != 0)
        ;
    ARStartDMA(ARAM_DIR_ARAM_TO_MRAM, (u32)fileData, aramSrc, size);
    while (ARGetDMAStatus() != 0)
        ;

    tpl->numTextures = *(u32 *)(fileData + 0);  // 0: number of textures
    tpl->texHeaders = OFFSET_TO_PTR(fileData, 4);  // 4: texture headers
    tpl->fileData = fileData;
    return tpl;
}

GXTexObj *create_tpl_tex_objs(struct TPL *tpl)
{
    int i;
    struct TPLTextureHeader *texHdrs = tpl->texHeaders;
    GXTexObj *texObjs = OSAlloc(tpl->numTextures * sizeof(GXTexObj));

    for (i = 0; i < tpl->numTextures; i++)
    {
        u8 maxLOD;
        void *imagePtr = tpl->fileData + texHdrs[i].imageOffset;
        if (texHdrs[i].width != texHdrs[i].height)
            maxLOD = 0;
        else
            maxLOD = get_texture_max_lod(texHdrs[i].width, texHdrs[i].height);
        GXInitTexObj(
            &texObjs[i],               // obj
            (void *)imagePtr,          // image_ptr
            texHdrs[i].width,          // width
            texHdrs[i].height,         // height
            texHdrs[i].format & 0x1F,  // format
            GX_REPEAT,                 // wrap_s
            GX_REPEAT,                 // wrap_t
            0);                        // mipmap
        GXInitTexObjLOD(
            &texObjs[i],  // obj
            (maxLOD != 0) ? GX_LIN_MIP_LIN : GX_LIN_MIP_NEAR,  // min_filt
            GX_LINEAR,    // mag_filt
            0.0f,         // min_lod
            maxLOD,       // max_lod
            0.0f,         // lod_bias
            GX_FALSE,     // bias_clamp
            TRUE,         // do_edge_lod
            GX_ANISO_1);  // max_aniso
    }
    return texObjs;
}

void free_tpl(struct TPL *tpl)
{
    OSFree(tpl);
}

void g_avdisp_set_model_scale(float a)
{
    modelScale = a;
}

void g_avdisp_set_3_floats(float a, float b, float c)
{
    lbl_802F20D0 = a;
    lbl_802F20D4 = b;
    lbl_802F20D8 = c;
}

void g_avdisp_maybe_draw_model_1(struct GMAModel *model)
{
    if (g_frustum_test_maybe_2(&model->boundSphereCenter, model->boundSphereRadius, modelScale) == 0)
    {
        modelScale = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        g_globalAlpha = 1.0f;
    }
    else
        g_avdisp_draw_model_1(model);
}

void g_avdisp_maybe_draw_model_2(struct GMAModel *model)
{
    if (g_frustum_test_maybe_2(&model->boundSphereCenter, model->boundSphereRadius, modelScale) == 0)
    {
        modelScale = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        g_globalAlpha = 1.0f;
    }
    else
        g_avdisp_draw_model_2(model);
}

void g_avdisp_maybe_draw_model_3(struct GMAModel *model)
{
    if (g_frustum_test_maybe_2(&model->boundSphereCenter, model->boundSphereRadius, modelScale) == 0)
    {
        modelScale = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        g_globalAlpha = 1.0f;
    }
    else
        g_avdisp_draw_model_3(model);
}

void g_avdisp_set_alpha(float a)
{
    g_globalAlpha = a;
}

void g_avdisp_set_light_mask(u32 a)
{
    g_someLightMask = a;
}

void g_avdisp_set_and_normalize_some_vec(Vec *a)
{
    lbl_802B4E60 = *a;
    mathutil_vec_normalize_len(&lbl_802B4E60);
}

void g_avdisp_set_3_other_floats(float a, float b, float c)
{
    lbl_802F20F4 = a;
    lbl_802F20F8 = b;
    lbl_802F20FC = c;
}

void avdisp_set_z_mode(GXBool compareEnable, GXCompare compareFunc, GXBool updateEnable)
{
    s_zModeCompareEnable = compareEnable;
    s_zModeCompareFunc   = compareFunc;
    s_zModeUpdateEnable  = updateEnable;
}

BallEnvFunc g_avdisp_set_some_func_1(BallEnvFunc func)
{
    BallEnvFunc old = lbl_802F20EC;
    lbl_802F20EC = func;
    return old;
}

Func802F20F0 g_avdisp_set_some_func_2(Func802F20F0 func)
{
    Func802F20F0 old = lbl_802F20F0;
    lbl_802F20F0 = func;
    return old;
}

struct UnkStruct12
{
    u8 filler0[8];
    u32 unk8;
};

#pragma force_active on
void *func_8008E5F8(struct GMAModel *model)
{
    struct UnkStruct12 *r3 = (struct UnkStruct12 *)((u8 *)model + model->headerSize);
    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        return (u8 *)r3 + r3->unk8;
    else
    {
        printf("non effective model.\n");
        return NULL;
    }
}

void *func_8008E64C(struct GMAModel *model)
{
    // hmm... with these flags, this shouldn't point to the shape?
    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        return (u8 *)model + model->headerSize;
    else
    {
        printf("non effective model.\n");
        return NULL;
    }
}
#pragma force_active reset

static inline void *skip_shape(struct GMAShape *shape)
{
    u8 *ptr = shape->dispListData;
    int i;

    // skip over display lists
    for (i = 0; i < 2; i++)
    {
        if (shape->g_vtxRenderFlags & (1 << i))
            ptr += shape->dispListSizes[i];
    }

    // TODO: what is this?
    if (shape->g_vtxRenderFlags & 0xC)
    {
        u32 *r4 = (u32 *)ptr;
        ptr += 32;
        ptr += r4[2];
        ptr += r4[3];
    }

    return (void *)ptr;
}

#pragma force_active on
void set_shape_flags_in_model(struct GMAModel *model, u32 flags)
{
    struct GMAShape *shapePtr = OFFSET_TO_PTR(model, model->headerSize);

    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
    {
        u32 i;
        struct GMAShape *shapes = OFFSET_TO_PTR(shapePtr, 32);
        for (i = 0; i < model->opaqueShapeCount + model->translucentShapeCount; i++)
            shapes[i].flags |= flags;
    }
    else
    {
        u32 i;
        struct GMAShape *shape = shapePtr;
        for (i = 0; i < model->opaqueShapeCount + model->translucentShapeCount; i++)
        {
            shape->flags |= flags;
            shape = skip_shape(shape);
        }
    }
}
#pragma force_active reset

struct DrawShapeDeferredNode
{
    struct OrdTblNode node;
    struct GMAModel *model;
    Mtx mtx;
    struct GMASampler *modelSamplers;
    struct GMAShape *shape;
    u32 unk44;
    u32 unk48;
    float unk4C;
    BallEnvFunc unk50;
    Func802F20F0 unk54;
    u8 zCompEnable;
    u8 zUpdEnable;
    u32 zCompFunc;
    u8 unk60;
    u8 unk61;
    u8 unk62;
    Mtx *unk64;
    GXColor unk68;
    GXColor unk6C;
    u32 g_customFogEnabled;
};

static inline struct GMAShape *draw_shape_deferred(struct GMAModel *model, struct GMAShape *shape, struct GMASampler *modelSamplers)
{
    struct OrdTblNode *entry;
    u32 r23 = g_cullMode;
    struct DrawShapeDeferredNode *node = ord_tbl_alloc_node(sizeof(*node));

    if (shape->unk14 != 0xFF)
        entry = ord_tbl_get_entry_for_pos_offset_index(&shape->boundSphereCenter, -1);
    else
        entry = ord_tbl_get_entry_for_pos(&shape->boundSphereCenter);
    node->node.drawFunc = (OrdTblDrawFunc)draw_shape_deferred_callback;
    node->model = model;
    node->shape = shape;
    node->modelSamplers = modelSamplers;
    node->unk44 = r23;
    node->unk48 = func_800223D0();
    node->unk4C = g_globalAlpha;
    node->unk50 = lbl_802F20EC;
    node->unk54 = lbl_802F20F0;
    node->zCompEnable = s_zModeCompareEnable;
    node->zUpdEnable = s_zModeUpdateEnable;
    node->zCompFunc = s_zModeCompareFunc;
    node->unk60 = lbl_802F2108;
    node->unk61 = lbl_802F210C;
    node->unk62 = lbl_802F2114;
    if (node->unk60 != 0)
    {
        node->unk64 = ord_tbl_alloc_node(sizeof(*node->unk64));
        mathutil_mtx_copy(lbl_802B4E6C, *node->unk64);
    }
    if (node->unk61 != 0)
        node->unk68 = g_tevKColor2;
    if (node->unk62 != 0)
        node->unk6C = g_tevKColor3;
    node->g_customFogEnabled = s_g_customFogEnabled;
    mathutil_mtxA_to_mtx(node->mtx);
    ord_tbl_insert_node(entry, &node->node);
    return skip_shape(shape);
}

void g_avdisp_draw_model_1(struct GMAModel *model)
{
    struct GMAShape *shape = OFFSET_TO_PTR(model, model->headerSize);
    struct GMASampler *modelSamplers = OFFSET_TO_PTR(model, 0x40);
    int i;

    g_cullMode = GX_CULL_BACK;
    GXSetCullMode_cached(g_cullMode);
    if (model->flags & GCMF_STITCHING)
        g_iteratively_multiply_model_matrices(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, shape);

    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        draw_model_0x18(model, shape, modelSamplers);
    else
    {
        for (i = 0; i < model->opaqueShapeCount; i++)
            shape = draw_model_8008F914(model, shape, modelSamplers);
        for (i = 0; i < model->translucentShapeCount; i++)
            shape = draw_shape_deferred(model, shape, modelSamplers);
    }

    modelScale = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    g_globalAlpha = 1.0f;
}

// for transparent objects?
void g_avdisp_draw_model_2(struct GMAModel *model)
{
    struct GMAShape *shape = OFFSET_TO_PTR(model, model->headerSize);
    struct GMASampler *modelSamplers = OFFSET_TO_PTR(model, 0x40);
    int i;

    g_cullMode = 2;
    GXSetCullMode_cached(g_cullMode);
    if (model->flags & GCMF_STITCHING)
        g_iteratively_multiply_model_matrices(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, shape);

    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        draw_model_0x18(model, shape, modelSamplers);
    else
    {
        for (i = 0; i < model->opaqueShapeCount; i++)
            shape = draw_model_8008F914(model, shape, modelSamplers);
        for (i = 0; i < model->translucentShapeCount; i++)
            shape = draw_model_8008F914(model, shape, modelSamplers);
    }

    modelScale = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    g_globalAlpha = 1.0f;
}

void g_avdisp_draw_model_3(struct GMAModel *model)
{
    struct GMAShape *shape = OFFSET_TO_PTR(model, model->headerSize);
    struct GMASampler *modelSamplers = OFFSET_TO_PTR(model, 0x40);
    int i;

    g_cullMode = 2;
    GXSetCullMode_cached(g_cullMode);
    if (model->flags & GCMF_STITCHING)
        g_iteratively_multiply_model_matrices(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, shape);

    for (i = 0; i < model->opaqueShapeCount; i++)
        shape = (void *)draw_shape_deferred(model, shape, modelSamplers);
    for (i = 0; i < model->translucentShapeCount; i++)
        shape = (void *)draw_shape_deferred(model, shape, modelSamplers);

    modelScale = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    g_globalAlpha = 1.0f;
}

void g_avdisp_draw_model_4(struct GMAModel *model)
{
    struct GMAShape *shape = OFFSET_TO_PTR(model, model->headerSize);
    struct GMASampler *modelSamplers = OFFSET_TO_PTR(model, 0x40);
    int i;

    g_cullMode = 2;
    if (model->flags & GCMF_STITCHING)
        g_iteratively_multiply_model_matrices(model);

    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        draw_model_0x18(model, shape, modelSamplers);
    else
    {
        for (i = 0; i < model->opaqueShapeCount; i++)
            shape = draw_model_8008F914(model, shape, modelSamplers);
    }

    modelScale = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    g_globalAlpha = 1.0f;
}

int get_texture_max_lod(int width, int height)
{
    int lod;
    if (width > height)
        width = height;
    lod = 0;
    while (width > 16)
    {
        width >>= 1;
        lod++;
    }
    return lod;
}

void init_sampler(struct GMASampler *sampler, struct TPLTextureHeader *texHdr, struct TPL *tpl)
{
    u8 maxLOD;
    int wrapS;
    int wrapT;
    void *imagePtr = tpl->fileData + texHdr->imageOffset;
    int minFilt;
    int magFilt;

    if (texHdr->format & 0x40)
    {
        OSPanic("avdisp.c", 1340, "invalid texture!!\n...stopped\n");
        sampler->texObj = NULL;
        return;
    }

    switch ((sampler->flags >> 2) & 3)
    {
    case 2:
        wrapS = GX_MIRROR;
        break;
    case 1:
        wrapS = GX_REPEAT;
        break;
    default:
        wrapS = GX_CLAMP;
        break;
    }
    switch ((sampler->flags >> 4) & 3)
    {
    case 2:
        wrapT = GX_MIRROR;
        break;
    case 1:
        wrapT = GX_REPEAT;
        break;
    default:
        wrapT = GX_CLAMP;
        break;
    }
    if (texHdr->width != texHdr->height)
        maxLOD = 0;
    else
    {
        maxLOD = (sampler->flags >> 7) & 0xF;
        if (maxLOD == 15)
            maxLOD = get_texture_max_lod(texHdr->width, texHdr->height);  // inlined
    }
    GXInitTexObj(
        sampler->texObj,  // obj
        imagePtr,  // image_ptr
        texHdr->width,  // width
        texHdr->height,  // height
        texHdr->format & 0x1F,  // format
        wrapS,  // wrap_s
        wrapT,  // wrap_t
        maxLOD != 0);  // mipmap

    if (sampler->flags & 0x800)
    {
        magFilt = GX_NEAR;
        if (maxLOD != 0)
            minFilt = GX_NEAR_MIP_LIN;
        else
            minFilt = GX_NEAR_MIP_NEAR;
    }
    else
    {
        magFilt = GX_LINEAR;
        if (maxLOD != 0)
            minFilt = GX_LIN_MIP_LIN;
        else
            minFilt = GX_LIN_MIP_NEAR;
    }
    GXInitTexObjLOD(
        sampler->texObj,  // obj
        minFilt,  // min_filt
        magFilt,  // mag_filt
        0.0f,  // min_lod
        maxLOD,  // max_lod
        sampler->unk6 / 10.0f,  // lod_bias
        FALSE,  // bias_clamp
        (sampler->flags & 0x40) != 0,  // do_edge_lod
        sampler->unk7);  // max_aniso
}

static inline struct GMAShape *init_shape_render_flags(struct GMAShape *shape)
{
    if (shape->vtxAttrs & (1 << GX_VA_CLR0))
        shape->flags |= GMA_SHAPE_FLAG_VERT_COLORS;
    if (shape->tevStageCount == 0)
        shape->flags |= GMA_SHAPE_FLAG_SIMPLE_MATERIAL;
    return skip_shape(shape);
}

GXTexObj *init_model(struct GMAModel *model, struct TPL *tpl, GXTexObj *texObj)
{
    struct GMASampler *modelSamplers;
    struct GMAShape *shape;
    int i;

    if (tpl == NULL)
        model->samplerCount = 0;
    modelSamplers = (void *)model->samplers;

    // Allocate GX texture objects for samplers
    if (model->samplerCount != 0)
    {
        if (texObj != NULL)
        {
            model->texObjs = texObj;
            texObj += model->samplerCount;
        }
        else
            model->texObjs = OSAlloc(model->samplerCount * sizeof(GXTexObj));
        if (model->texObjs == NULL)
            OSPanic("avdisp.c", 0x58B, "cannot OSAlloc");
    }
    else
        model->texObjs = NULL;

    // Initialize samplers
    for (i = 0; i < model->samplerCount; i++)
    {
        modelSamplers[i].texObj = &model->texObjs[i];
        init_sampler(&modelSamplers[i], &tpl->texHeaders[modelSamplers[i].unk4], tpl);
    }

    // Get pointer to shape
    // If model is GCMF_SKIN or GCMF_EFFECTIVE, then the shape offset is 32 bytes more
    shape = OFFSET_TO_PTR(model, model->headerSize);
    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        shape = OFFSET_TO_PTR((u32)shape, 32);

    for (i = 0; i < model->opaqueShapeCount; i++)
    {
        if (tpl == NULL)
            shape->tevStageCount = 0;
        if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        {
            struct GMAShape *r3 = shape;
            shape++;
            init_shape_render_flags(r3);
        }
        else
            shape = init_shape_render_flags(shape);
    }
    for (i = 0; i < model->translucentShapeCount; i++)
    {
        if (tpl == NULL)
            shape->tevStageCount = 0;
        if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        {
            struct GMAShape *r3 = shape;
            shape++;
            init_shape_render_flags(r3);
        }
        else
            shape = init_shape_render_flags(shape);
    }
    return texObj;
}

void g_iteratively_multiply_model_matrices(struct GMAModel *model)
{
    unsigned int i;

    for (i = 0; i < model->mtxCount; i++)
        mathutil_mtx_mult(mathutilData->mtxA, *avdispMtxPtrList[i], g_transformMtxList[i]);
    func_8008F8A4(model->mtxIndexes);
}

void draw_shape_deferred_callback(struct DrawShapeDeferredNode *node)
{
    BallEnvFunc r31;
    Func802F20F0 r30;
    u8 r29;
    u8 r28;
    u32 r27;
    u32 r26;
    u32 r25;
    u32 r23;
    u32 r22;
    GXColor sp10;
    GXColor spC;

    if ((node->shape->flags & GMA_SHAPE_FLAG_UNK0) == 0)
        func_800223D8(node->unk48);
    g_gxutil_upload_some_mtx(node->mtx, 0);
    mathutil_mtxA_from_mtx(node->mtx);
    GXSetCullMode_cached(node->unk44);
    g_cullMode = node->unk44;
    r31 = lbl_802F20EC;
    r30 = lbl_802F20F0;
    r29 = s_zModeCompareEnable;
    r28 = s_zModeUpdateEnable;
    r27 = s_zModeCompareFunc;
    r26 = lbl_802F2108;
    g_globalAlpha = node->unk4C;
    lbl_802F20EC = node->unk50;
    lbl_802F20F0 = node->unk54;
    s_zModeCompareEnable = node->zCompEnable;
    s_zModeUpdateEnable = node->zUpdEnable;
    s_zModeCompareFunc = node->zCompFunc;
    lbl_802F2108 = node->unk60;
    if (node->unk60 != 0)
        mathutil_mtx_copy(*node->unk64, lbl_802B4E6C);
    r25 = lbl_802F210C;
    lbl_802F210C = node->unk61;
    if (node->unk61 != 0)
    {
        sp10 = g_tevKColor2;
        g_tevKColor2 = node->unk68;
    }
    r23 = lbl_802F2114;
    lbl_802F2114 = node->unk62;
    if (node->unk62 != 0)
    {
        spC = g_tevKColor3;
        g_tevKColor3 = node->unk6C;
    }
    r22 = s_g_customFogEnabled;
    s_g_customFogEnabled = node->g_customFogEnabled;
    if (lbl_802F20F0 == NULL)
        func_8008FE44(node->model, node->shape);
    draw_model_8008F914(node->model, node->shape, node->modelSamplers);
    lbl_802F20EC = r31;
    lbl_802F20F0 = r30;
    s_zModeCompareEnable = r29;
    s_zModeUpdateEnable = r28;
    s_zModeCompareFunc = r27;
    lbl_802F2108 = r26;
    lbl_802F210C = r25;
    if (node->unk61 != 0)
        g_tevKColor2 = sp10;
    lbl_802F2114 = r23;
    if (node->unk62 != 0)
        g_tevKColor3 = spC;
    s_g_customFogEnabled = r22;
    g_globalAlpha = 1.0f;
}

u32 func_8008F6D4(u32 a)
{
    u32 old = lbl_802F2108;
    lbl_802F2108 = a;
    return old;
}

void g_avdisp_set_some_matrix(int unused, Mtx mtx)
{
    mathutil_mtx_copy(mtx, lbl_802B4E6C);
}

void g_avdisp_set_some_color_1(float a, float b, float c, float d)
{
    if (a != 1.0f || b != 1.0f || c != 1.0f || d != 1.0f)
    {
        lbl_802F210C = 1;
        g_tevKColor2.r = a * 255.0f;
        g_tevKColor2.g = b * 255.0f;
        g_tevKColor2.b = c * 255.0f;
        g_tevKColor2.a = d * 255.0f;
    }
    else
    {
        lbl_802F210C = 0;
        g_tevKColor2.r = 255;
        g_tevKColor2.g = 255;
        g_tevKColor2.b = 255;
        g_tevKColor2.a = 255;
    }
}

void g_avdisp_set_some_color_2(float a, float b, float c, float d)
{
    if (a != 0.0f || b != 0.0f || c != 0.0f || d != 0.0f)
    {
        lbl_802F2114 = 1;
        g_tevKColor3.r = a * 255.0f;
        g_tevKColor3.g = b * 255.0f;
        g_tevKColor3.b = c * 255.0f;
        g_tevKColor3.a = d * 255.0f;
    }
    else
    {
        lbl_802F2114 = 0;
        g_tevKColor3.r = 0;
        g_tevKColor3.g = 0;
        g_tevKColor3.b = 0;
        g_tevKColor3.a = 0;
    }
}

void g_avdisp_enable_custom_fog(int a)
{
    s_g_customFogEnabled = a;
}

void func_8008F880(int a, float b, float c)
{
    s_fogType = a;
    s_fogStartZ = b;
    s_fogEndZ = c;
}

void func_8008F890(u8 a, u8 b, u8 c)
{
    s_fogColor.r = a;
    s_fogColor.g = b;
    s_fogColor.b = c;
}

void func_8008F8A4(u8 *mtxIndexes)
{
    int i;
    for (i = 0; i < 8; i++)
    {
        if ((s32)mtxIndexes[i] != 0xFF)
            g_gxutil_upload_some_mtx(g_transformMtxList[mtxIndexes[i]], i + 1);
    }
}

struct UnkStruct25
{
    u8 filler0[8];
    u32 unk8[2];
    u8 filler10[0x20-0x10];
    u8 unk20[1];
};

struct UnkStruct27
{
    u8 filler0[4];
    struct GMAShape *shape;
    struct GMASampler *modelSamplers;
    u8 fillerC[0x38-0xC];
};

struct GMAShape *draw_model_8008F914(struct GMAModel *model, struct GMAShape *shape, struct GMASampler *modelSamplers)
{
    int i;
    u8 *dlist;
    GXCullMode cullMode;
    u8 bvar;
    struct UnkStruct27 sp20;
    u8 unused[12];

    if (shape->flags & GMA_SHAPE_FLAG_DOUBLE_SIDED)
        cullMode = GX_CULL_NONE;
    else
        cullMode = GX_CULL_FRONT;
    if (model->flags & GCMF_STITCHING)
        func_8008F8A4(shape->mtxIndices);  // inlined
    gxutil_set_vtx_attrs(shape->vtxAttrs);
    dlist = shape->dispListData;

    if (lbl_802F20F0 != NULL)
    {
        sp20.shape = (void *)shape;
        sp20.modelSamplers = modelSamplers;
        bvar = lbl_802F20F0(&sp20);
    }
    else
    {
        g_build_tev_material((void *)shape, (void *)modelSamplers);
        bvar = 1;
    }

    if (bvar)
    {
        for (i = 0; i < 2; i++)
        {
            if (shape->g_vtxRenderFlags & (1 << i))
            {
                if (g_cullMode != cullMode)
                {
                    g_cullMode = cullMode;
                    GXSetCullMode_cached(cullMode);
                }
                GXCallDisplayList(dlist, shape->dispListSizes[i]);
                dlist += shape->dispListSizes[i];
            }
            if (cullMode != GX_CULL_NONE)
                cullMode = GX_CULL_BACK;
        }
        if ((shape->g_vtxRenderFlags & 0xC) != 0)
        {
            struct UnkStruct25 *r26 = (void *)dlist;
            func_8008F8A4(r26->filler0);  // inlined
            dlist = r26->unk20;
            for (i = 0; i < 2; i++)
            {
                if (i == 0)
                    GXSetCullMode_cached(GX_CULL_FRONT);
                else
                    GXSetCullMode_cached(GX_CULL_BACK);
                GXCallDisplayList(dlist, r26->unk8[i]);
                dlist += r26->unk8[i];
            }
        }
    }
    else
    {
        return skip_shape(shape);
    }
    return (struct GMAShape *)dlist;
}

#ifdef __MWERKS__
asm void func_8008FBB0(register u32 _flags, register void *_base, void *c, u32 d)
{
    nofralloc
    lis r9, GXWGFifo@h
    ori r9, r9, GXWGFifo@l  // r9 = GX FIFO
    addi r5, r5, -4
next_strip:
    lwzu r7, 4(r5)  // vertex count
    addi r8, r7, 1
    li r10, GX_DRAW_TRIANGLE_STRIP
    stb r10, 0(r9)
    sth r7, 0(r9)
next_tri:
    lwzu r11, 4(r5)
    add r10, _base, r11
    // copy vertex
    psq_l f0, 0(r10), 0, qr0
    psq_l f1, 8(r10), 1, qr0
    psq_st f0, 0(r9), 0, qr0
    psq_st f1, 0(r9), 1, qr0
    // copy vertex
    psq_l f2, 12(r10), 0, qr0
    psq_l f3, 20(r10), 1, qr0
    psq_st f2, 0(r9), 0, qr0
    psq_st f3, 0(r9), 1, qr0
    extrwi. r12, r3, 1, (31-11)
    beq+ lbl_8008FC08
    // if flags & (1<<11)
    psq_l f0, 48(r10), 1, qr0
    psq_st f0, 0(r9), 1, qr0
lbl_8008FC08:
    extrwi. r12, _flags, 1, (31-13)
    beq lbl_8008FC18
    // if flags & (1<<13)
    psq_l f0, 24(r10), 0, qr0
    psq_st f0, 0(r9), 0, qr0
lbl_8008FC18:
    extrwi. r12, _flags, 1, (31-14)
    beq+ lbl_8008FC28
    // if flags & (1<<14)
    psq_l f1, 32(r10), 0, qr0
    psq_st f1, 0(r9), 0, qr0
lbl_8008FC28:
    extrwi. r12, _flags, 1, (31-15)
    beq+ lbl_8008FC38
    // if flags & (1<<15)
    psq_l f2, 40(r10), 0, qr0
    psq_st f2, 0(r9), 0, qr0
lbl_8008FC38:
    addic. r7, r7, -1
    bgt next_tri
    subf. r6, r8, r6
    bgt next_strip
    blr
}
#else
void func_8008FBB0(u32 _flags, void *_base, void *c, u32 d)
{
    // TODO
}
#endif

struct UnkStruct29
{
    u8 filler0[8];
    u32 unk8;
};

void *draw_shape_reflection_maybe(struct GMAShape *shape, void *modelSamplers, struct UnkStruct29 *c, u8 *d)
{
    int i;
    GXCullMode cullMode;
    u8 *r29 = (u8 *)c + c->unk8;
    u8 bvar;
    struct UnkStruct27 sp20;

    if (shape->flags & GMA_SHAPE_FLAG_DOUBLE_SIDED)
        cullMode = GX_CULL_NONE;
    else
        cullMode = GX_CULL_BACK;
    gxutil_set_vtx_attrs(shape->vtxAttrs);

    if (lbl_802F20F0 != NULL)
    {
        sp20.shape = shape;
        sp20.modelSamplers = modelSamplers;
        bvar = lbl_802F20F0(&sp20);
    }
    else
    {
        g_build_tev_material((void *)shape, (void *)modelSamplers);
        bvar = 1;
    }

    if (bvar)
    {
        __GXSetDirtyState();
        for (i = 0; i < 2; i++)
        {
            if (shape->g_vtxRenderFlags & (1 << i))
            {
                if (g_cullMode != cullMode)
                {
                    u32 r3;
                    g_cullMode = cullMode;
                    r3 = (gx->unk204 & ~0xC000) | cullMode << 14;
                    gx->unk204 = r3;
                    func_8008D6BC(r3);
                }
                func_8008FBB0(shape->vtxAttrs, r29, d, shape->dispListSizes[i]);
                d += shape->dispListSizes[i] * 4;
            }
            if (cullMode != 0)
                cullMode = 1;
        }
    }
    return d;
}

void draw_model_0x18(struct GMAModel *model, struct GMAShape *b, struct GMASampler *mtrl)
{
    int i;  // r31
    u8 *r30 = b->mtxIndices;
    struct GMAShape *r6 = (void *)((u8 *)b + b->unkC.asU32);

    g_cullMode = 1;
    for (i = 0; i < model->opaqueShapeCount; i++)
    {
        r6 = draw_shape_reflection_maybe((void *)r30, mtrl, (void *)b, (void *)r6);
        r30 += 0x60;
    }
    for (i = 0; i < model->translucentShapeCount; i++)
    {
        r6 = draw_shape_reflection_maybe((void *)r30, mtrl, (void *)b, (void *)r6);
        r30 += 0x60;
    }
}

void func_8008FE44(struct GMAModel *model, struct GMAShape *shape)
{
    g_tevStageCache.unk0 = 1;
    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        shape = (struct GMAShape *)((u8 *)shape + 0x20);
    if (lbl_802F2108 != 0)
        GXLoadTexMtxImm(lbl_802B4E6C, GX_TEXMTX1, GX_MTX3x4);
    else
        GXLoadTexMtxImm(lbl_802B4E9C, GX_TEXMTX1, GX_MTX3x4);
    if (s_zModeUpdateEnable  != zMode->updateEnable
     || s_zModeCompareFunc   != zMode->compareFunc
     || s_zModeCompareEnable != zMode->compareEnable)
    {
        GXSetZMode(s_zModeCompareEnable, s_zModeCompareFunc, s_zModeUpdateEnable);
        zMode->compareEnable = s_zModeCompareEnable;
        zMode->compareFunc   = s_zModeCompareFunc;
        zMode->updateEnable  = s_zModeUpdateEnable;
    }
    if (s_g_customFogEnabled != 0)
        GXSetFog_cached(s_fogType, s_fogStartZ, s_fogEndZ, 0.1f, 20000.0f, s_fogColor);
    else
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, s_fogColor);
    if (shape->flags & 0x88)
        g_tevStageCache.unk10 = shape->unk4;
    else
    {
        g_tevStageCache.unk10.r = 255;
        g_tevStageCache.unk10.g = 255;
        g_tevStageCache.unk10.b = 255;
    }
    g_tevStageCache.unk10.a = shape->unk11;
    if (shape->flags & 0x8)
        g_tevStageCache.unk14 = shape->unk8;
    else
    {
        g_tevStageCache.unk14.r = 255;
        g_tevStageCache.unk14.g = 255;
        g_tevStageCache.unk14.b = 255;
    }
    g_tevStageCache.unk14.a = 255;
    func_8008D6D4(shape);
    g_tevStageCache.unk18.r = shape->unkC.asColor.r;
    g_tevStageCache.unk18.g = shape->unkC.asColor.g;
    g_tevStageCache.unk18.b = shape->unkC.asColor.b;
    g_tevStageCache.unk2 = 0;
    g_tevStageCache.g_tevColorInD = 15;
    g_tevStageCache.g_tevAlphaInD = 7;
    g_tevStageCache.unk3 = -1;
    g_tevStageCache.unk4 = -1;
    g_tevStageCache.unk5 = -1;
    g_tevStageCache.unk8 = 16;
    g_tevStageCache.unkC = 16;
    if (lbl_802F210C != 0)
        GXSetTevKColor_cached(GX_KCOLOR2, g_tevKColor2);
    if (lbl_802F2114 != 0)
        GXSetTevKColor_cached(GX_KCOLOR3, g_tevKColor3);
    g_tevStageCache.g_blendSrcFactor = 4;
    g_tevStageCache.g_blendDstFactor = 5;
    if (shape->flags & GMA_SHAPE_FLAG_CUSTOM_BLEND_SRC)
        g_tevStageCache.g_blendSrcFactor = shape->g_blendFlags & 0xF;
    if (shape->flags & GMA_SHAPE_FLAG_CUSTOM_BLEND_DST)
        g_tevStageCache.g_blendDstFactor = (shape->g_blendFlags >> 4) & 0xF;
    GXSetBlendMode_cached(GX_BM_BLEND, g_tevStageCache.g_blendSrcFactor, g_tevStageCache.g_blendDstFactor, GX_LO_CLEAR);
    g_tevStageCache.g_tevStageCount = -1;
    g_tevStageCache.g_tevStagesFilled[0] = -1;
    g_tevStageCache.g_tevStagesFilled[1] = -1;
    g_tevStageCache.g_tevStagesFilled[2] = -1;
    g_tevStageCache.unk38 = -1;
    g_tevStageCache.g_samplerIdxs[0] = 0xFFFF;
    g_tevStageCache.g_samplerIdxs[1] = 0xFFFF;
    g_tevStageCache.g_samplerIdxs[2] = 0xFFFF;
    g_tevStageCache.unk44 = 0;
    g_tevStageCache.unk48 = 0;
    g_tevStageCache.unk4C = 0;
    g_tevStageCache.unk50 = 0;
    g_tevStageCache.unk54 = 0;
    mathutil_mtxA_tf_point(&model->boundSphereCenter, &g_tevStageCache.unk58);
    g_tevStageCache.unk58.z -= model->boundSphereRadius;
    mathutil_vec_normalize_len(&g_tevStageCache.unk58);
}

void g_compute_texmtx0(void)
{
    Point3d cameraPos = {0.0f, 0.0f, 0.0f};
    Vec cameraUp = {0.0f, 1.0f, 0.0f};
    Mtx mtx;

    mathutil_mtxA_push();
    MTXLookAt(mtx, &cameraPos, &cameraUp, &g_tevStageCache.unk58);
    mathutil_mtxA_from_mtx(mtx);
    mathutilData->mtxA[0][3] = 0.5f;
    mathutilData->mtxA[1][0] *= -1.0f;
    mathutilData->mtxA[1][1] *= -1.0f;
    mathutilData->mtxA[1][2] *= -1.0f;
    mathutilData->mtxA[1][3] = 0.5f;
    mathutilData->mtxA[2][0] = 0.0f;
    mathutilData->mtxA[2][1] = 0.0f;
    mathutilData->mtxA[2][2] = 0.0f;
    mathutilData->mtxA[2][3] = 1.0f;
    mathutil_mtxA_scale_s(0.5f);
    GXLoadTexMtxImm(mathutilData->mtxA, GX_PTTEXMTX0, GX_MTX3x4);
    mathutil_mtxA_pop();
}

void g_compute_texmtx1and2(void)
{
    Point3d cameraPos = {0.0f, 0.0f, 0.0f};
    Point3d target;
    Vec sp44;
    Vec cameraUp;
    Mtx mtx;

    mathutil_mtxA_push();
    target = lbl_802B4E60;
    sp44 = g_tevStageCache.unk58;
    sp44.x *= -0.9f;
    sp44.y *= -0.9f;
    sp44.z *= -0.9f;
    target.x = (sp44.x + target.x) * 0.5f;
    target.y = (sp44.y + target.y) * 0.5f;
    target.z = (sp44.z + target.z) * 0.5f;
    cameraUp.x = target.x - sp44.x;
    cameraUp.y = target.y - sp44.y;
    cameraUp.z = target.z - sp44.z;
    MTXLookAt(mtx, &cameraPos, &cameraUp, &target);
    mathutil_mtxA_from_mtx(mtx);
    mathutilData->mtxA[0][3] = 0.5f;
    mathutilData->mtxA[1][0] *= -1.0f;
    mathutilData->mtxA[1][1] *= -1.0f;
    mathutilData->mtxA[1][2] *= -1.0f;
    mathutilData->mtxA[1][3] = 0.5f;
    mathutilData->mtxA[2][0] = 0.0f;
    mathutilData->mtxA[2][1] = 0.0f;
    mathutilData->mtxA[2][2] = 0.0f;
    mathutilData->mtxA[2][3] = 1.0f;
    mathutil_mtxA_scale_s(0.5f);
    GXLoadTexMtxImm(mathutilData->mtxA, GX_PTTEXMTX1, GX_MTX3x4);
    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][0] = 0.0f;
    mathutilData->mtxA[0][2] = 0.5f;
    mathutilData->mtxA[0][3] = 0.5f;
    mathutilData->mtxA[1][1] = 0.0f;
    mathutilData->mtxA[2][2] = 0.0f;
    mathutilData->mtxA[2][3] = 1.0f;
    mathutil_mtxA_mult_right(mtx);
    GXLoadTexMtxImm(mathutilData->mtxA, GX_PTTEXMTX2, GX_MTX3x4);
    mathutil_mtxA_pop();
}

void init_some_texture(void)
{
    u8 *imagePtr = unknownTexImg;
    memset(imagePtr,      0xFF, 32);
    memset(imagePtr + 32,    0, 32);
    DCFlushRange(imagePtr, 64);
    GXInitTexObj(
        &unknownTexObj,  // obj
        unknownTexImg,  // image_ptr
        16,  // width
        4,  // height
        GX_TF_I8,  // format
        GX_CLAMP,  // wrap_s
        GX_CLAMP,  // wrap_t
        GX_FALSE);  // mipmap
    GXInitTexObjLOD(
        &unknownTexObj,  // obj
        GX_LINEAR,  // min_filt
        GX_LINEAR,  // mag_filt
        0.0f,  // min_lod
        0.0f,  // max_lod
        0.0f,  // lod_bias
        GX_FALSE,  // bias_clamp
        GX_FALSE,  // do_edge_lod
        GX_ANISO_1);  // max_aniso
}

struct UnkStruct32
{
    s32 tevStage;  // 7C
    GXTexCoordID g_texCoordId1;  // 80
    u32 unk8;  // 84
    GXTexMapID g_someTexmapId1;  // 88

    u32 unk10;  // 8C
    u32 unk14;  // 90

    u32 unk18;  // 94
    u32 unk1C;  // 98
    u32 unk20;  // 9C
    GXTexCoordID g_texCoordId2;  // A0
    GXTexMapID g_someTexmapId2;
};

struct UnkStruct33
{
    u32 unk0; // 3C
    void *unk4; // 40
    void *unk8; // 44
    struct UnkStruct32 unkC;  // 48
};

static inline void inline_test1(GXColor sp28)
{
                    if (sp28.r == 0 && sp28.g == 0 && sp28.b == 0)
                    {
                        sp28.r = 255;
                        sp28.g = 255;
                        sp28.b = 255;
                    }
                    //lbl_80090BEC
                    GXSetTevKColor_cached(GX_KCOLOR0, sp28);
}

static inline void inline_test2(GXColor sp20)
{
                    if (sp20.r == 0 && sp20.g == 0 && sp20.b == 0)
                    {
                        sp20.r = 255;
                        sp20.g = 255;
                        sp20.b = 255;
                    }
                    sp20.r = (float)sp20.r * lbl_802F20F4;
                    sp20.g = (float)sp20.g * lbl_802F20F8;
                    sp20.b = (float)sp20.b * lbl_802F20FC;
                    GXSetTevKColor_cached(GX_KCOLOR1, sp20);
}

static inline void inline_test3(s8 a)
{
    if (g_tevStageCache.unk3 != a)
    {
        g_tevStageCache.unk3 = a;
        GXSetNumTevStages_cached(a);
    }
}

static inline void inline_test4(s8 b)
{
    if (g_tevStageCache.unk4 != b)
    {
        g_tevStageCache.unk4 = b;
        GXSetNumTexGens(b);
    }
}

static inline void inline_test5(s8 c)
{
    if (g_tevStageCache.unk5 != c)
    {
        g_tevStageCache.unk5 = c;
        GXSetNumIndStages(c);
    }
}

#ifdef NONMATCHING
//#if 1
// stack differences
// DOL: 0x8C444
void g_build_tev_material(struct GMAShape *shape, struct GMASampler *modelSamplers)
{
    struct UnkStruct32 sp7C;  // correct
    GXColor g_someTevColor;  // correct
    GXTevColorArg g_tevColorArg;
    s32 g_tevAlphaArg;
    s32 g_isNewTevColorInD;
    s32 g_isNewTevAlphaInD;
    s32 g_blendSrcFactor;
    s32 g_blendDstFactor;

    sp7C.tevStage = GX_TEVSTAGE0;  // 7C
    sp7C.g_texCoordId1 = 0;  // 80
    sp7C.unk8 = 0x1E;  // 84
    sp7C.g_someTexmapId1 = 0;  // 88
    sp7C.unk10 = 0;  // 8C
    g_isNewTevColorInD = 0;
    sp7C.unk14 = 0x40;  // 0x90
    g_isNewTevAlphaInD = 0;
    sp7C.unk18 = 0;  // 94
    sp7C.unk1C = 1;  // 98
    sp7C.unk20 = 0;  // 9C

    sp7C.g_someTexmapId1 = 1;  // 88
    sp7C.unk8 = 0x24;  // 84
    sp7C.unk14 = 0x49;  // 90
    sp7C.unk18 = 4;  // 94

    if (g_tevStageCache.unk18.r != shape->unkC.asColor.r
     || g_tevStageCache.unk18.g != shape->unkC.asColor.g
     || g_tevStageCache.unk18.b != shape->unkC.asColor.b)
    {
        g_tevStageCache.unk50 = 0;
        g_tevStageCache.unk54 = 0;
        g_tevStageCache.unk18.r = shape->unkC.asColor.r;
        g_tevStageCache.unk18.g = shape->unkC.asColor.g;
        g_tevStageCache.unk18.b = shape->unkC.asColor.b;
    }
    // lbl_800905F8
    if ((shape->flags & GMA_SHAPE_FLAG_UNK0) == 0)
    {
        GXColor color_r5;
        int r0 = 0;
        if (shape->flags & 0x88)
        {
            g_someTevColor.r = shape->unk4.r;
            g_someTevColor.g = shape->unk4.g;
            g_someTevColor.b = shape->unk4.b;
        }
        else
        {
            g_someTevColor.r = 255;
            g_someTevColor.g = 255;
            g_someTevColor.b = 255;
        }
        //lbl_80090644
        g_someTevColor.a = shape->unk11;
        if (g_tevStageCache.unk10.r != g_someTevColor.r
         || g_tevStageCache.unk10.g != g_someTevColor.g
         || g_tevStageCache.unk10.b != g_someTevColor.b
         || g_tevStageCache.unk10.a != g_someTevColor.a)
        {
            r0 = 1;
            g_tevStageCache.unk10 = g_someTevColor;
        }
        //lbl_8009069C
        if (shape->flags & 8)
        {
            color_r5.r = shape->unk8.r;
            color_r5.g = shape->unk8.g;
            color_r5.b = shape->unk8.b;
        }
        else
        {
            color_r5.r = 255;
            color_r5.g = 255;
            color_r5.b = 255;
        }
        //lbl_800906C8
        if (g_tevStageCache.unk14.r != color_r5.r
         || g_tevStageCache.unk14.g != color_r5.g
         || g_tevStageCache.unk14.b != color_r5.b)
        {
            r0 = 1;
            g_tevStageCache.unk14.r = color_r5.r;
            g_tevStageCache.unk14.g = color_r5.g;
            g_tevStageCache.unk14.b = color_r5.b;
        }
        //lbl_8009070C
        if (r0)
            func_8008D6D4(shape);
    }
    //lbl_8009071C
    g_tevColorArg = GX_CC_RASC;
    g_tevAlphaArg = GX_CA_RASA;
    if (shape->flags & GMA_SHAPE_FLAG_UNK0)
    {
        if (shape->flags & GMA_SHAPE_FLAG_VERT_COLORS)
        {
            if (g_tevStageCache.unk2 != 2)
            {
                g_tevStageCache.unk2 = 2;
                GXSetChanCtrl(
                    GX_COLOR0A0,  // chan
                    GX_DISABLE,  // enable
                    GX_SRC_VTX,  // amb_src
                    GX_SRC_VTX,  // mat_src
                    GX_LIGHT_NULL,  // light_mask
                    GX_DF_NONE,  // diff_fn
                    GX_AF_NONE);  // attn_fn
            }
            //to lbl_800908D4
        }
        //lbl_8009077C
        else
        {
            g_tevStageCache.unk2 = 1;
            if (shape->flags & 0x88)
            {
                g_someTevColor.r = shape->unk4.r;
                g_someTevColor.g = shape->unk4.g;
                g_someTevColor.b = shape->unk4.b;
            }
            else
            {
                g_someTevColor.r = 255;
                g_someTevColor.g = 255;
                g_someTevColor.b = 255;
            }
            //lbl_800907C0
            g_someTevColor.a = (float)shape->unk11 * g_globalAlpha;
            //sp38 = sp78;
            GXSetTevColor(GX_TEVREG0, g_someTevColor);
            g_tevColorArg = GX_CC_C0;
            g_tevAlphaArg = GX_CA_A0;
            //to lbl_800908D4
        }
    }
    //lbl_80090814
    else
    {
        if (shape->flags & GMA_SHAPE_FLAG_VERT_COLORS)
        {
            if (g_tevStageCache.unk2 != 4)
            {
                g_tevStageCache.unk2 = 4;
                GXSetChanCtrl(
                    GX_ALPHA0,  // chan
                    GX_DISABLE,  // enable
                    GX_SRC_REG,  // amb_src
                    GX_SRC_VTX,  // mat_src
                    GX_LIGHT_NULL,  // light_mask
                    GX_DF_NONE,  // diff_fn
                    GX_AF_NONE);  // attn_fn
                GXSetChanCtrl(
                    GX_COLOR0,  // chan
                    GX_ENABLE,  // enable
                    GX_SRC_REG,  // amb_src
                    GX_SRC_VTX,  // mat_src
                    g_someLightMask,  // light_mask
                    GX_DF_CLAMP,  // diff_fn
                    GX_AF_SPOT);  // attn_fn
            }
            //to lbl_800908D4
        }
        //lbl_8009087C
        else
        {
            if (g_tevStageCache.unk2 != 3)
            {
                g_tevStageCache.unk2 = 3;
                GXSetChanCtrl(
                    GX_ALPHA0,  // chan
                    GX_DISABLE,  // enable
                    GX_SRC_REG,  // amb_src
                    GX_SRC_REG,  // mat_src
                    GX_LIGHT_NULL,  // light_mask
                    GX_DF_NONE,  // diff_fn
                    GX_AF_NONE);  // attn_fn
                GXSetChanCtrl(
                    GX_COLOR0,  // chan
                    GX_ENABLE,  // enable
                    GX_SRC_REG,  // amb_src
                    GX_SRC_REG,  // mat_src
                    g_someLightMask,  // light_mask
                    GX_DF_CLAMP,  // diff_fn
                    GX_AF_SPOT);  // attn_fn
            }
        }
    }
    //lbl_800908D4

    if (s_g_customFogEnabled != 0)
    {
        if (shape->flags & GMA_SHAPE_FLAG_NO_FOG)
            GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, s_fogColor);
        else
            GXSetFog_cached(s_fogType, s_fogStartZ, s_fogEndZ, 0.1f, 20000.0f, s_fogColor);
    }
    //lbl_8009093C
    if (g_tevStageCache.g_tevColorInD != g_tevColorArg)
    {
        g_tevStageCache.g_tevColorInD = g_tevColorArg;
        g_isNewTevColorInD = 1;
    }
    if (g_tevStageCache.g_tevAlphaInD != g_tevAlphaArg)
    {
        g_tevStageCache.g_tevAlphaInD = g_tevAlphaArg;
        g_isNewTevAlphaInD = 1;
    }
    if (shape->flags & GMA_SHAPE_FLAG_SIMPLE_MATERIAL) // Simple single-stage material? Used for ball start pos marker for example
    {
        if (g_tevStageCache.g_tevStageCount != 0 || g_isNewTevColorInD != 0 || g_isNewTevAlphaInD != 0)
        {
            // Use color/alpha directly from D input with no modifications for this tev stage
            GXSetTevOrder_cached(sp7C.tevStage, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
            GXSetTevColorIn_cached(sp7C.tevStage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, g_tevColorArg);
            GXSetTevColorOp_cached(sp7C.tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
            GXSetTevAlphaIn_cached(sp7C.tevStage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, g_tevAlphaArg);
            GXSetTevAlphaOp_cached(sp7C.tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
        }
        //lbl_80090A1C
        else
        {
            if (g_isNewTevColorInD != 0) // Impossible
            {
                if (g_isNewTevColorInD != 0)
                    GXSetTevColorIn_cached(sp7C.tevStage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, g_tevColorArg);
                //lbl_80090A40
                if (g_isNewTevAlphaInD != 0)
                    GXSetTevAlphaIn_cached(sp7C.tevStage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, g_tevAlphaArg);
            }
        }
        //lbl_80090A60
        g_tevStageCache.g_tevStagesFilled[0] = -1;
        sp7C.tevStage++;
        //to lbl_80091020
    }
    //lbl_80090A78
    else
    {
        s32 tevStageCounter = shape->tevStageCount;
        s32 r19 = 4;
        // loop:
        // r18 = &a->unk16
        // r17 = &g_tevStageCache.translucency
        // r15 = &g_tevStageCache.posXKeyframeCount
        // r24 = &g_tevStageCache.visibleKeyframes doesn't change
        // r14 = &sp2C doesn't change
        // r25 = &g_tevStageCache.visibleKeyframeCount  doesn't change
        // maybe indexed instead?
        u16 *samplerIdx = shape->samplerIdxs;
        u32 *r17 = g_tevStageCache.g_tevStagesFilled;
        u32 r16;
        u16 *g_someSamplerIdx = g_tevStageCache.g_samplerIdxs;
        while (tevStageCounter > 0)
        {
            struct GMASampler *sampler = &modelSamplers[*samplerIdx];
            r16 = sampler->flags;
            r16 &= 0xA003;
            if (*r17 != r16)
                break;
            if (*g_someSamplerIdx != *samplerIdx || (sampler->flags & 0x10000))
            {
                GXLoadTexObj_cached(sampler->texObj, sp7C.g_someTexmapId1);
                *g_someSamplerIdx = *samplerIdx;
            }
            //lbl_80090B00
            if (r16 == 0)
            {
                if (g_isNewTevColorInD != 0)
                {
                    func_80091500(&sp7C, g_tevColorArg, g_tevAlphaArg);
                    g_isNewTevColorInD = 0;
                }
                func_80091564(&sp7C);
                //to lbl_80090D3C
            }
            //lbl_80090B30
            else if (r16 & 0x2000)
            {
                if (g_isNewTevColorInD != 0)
                {
                    func_8009167C(&sp7C, g_tevColorArg, g_tevAlphaArg);
                    g_isNewTevColorInD = 0;
                }
                func_800916E0(&sp7C);
                //to lbl_80090D3C
            }
            else if (r16 & 0x2)
            {
                if (g_isNewTevColorInD != 0)
                {
                    func_80091CA8(&sp7C, g_tevColorArg, g_tevAlphaArg);
                    g_isNewTevColorInD = 0;
                }
                func_80091D0C(&sp7C);
                //to lbl_80090D3C
            }
            //lbl_80090B98
            else if (r16 & 1)
            {
                if (g_tevStageCache.unk50 == 0)
                {
                    /*
                    GXColor sp28 = g_tevStageCache.unk18;
                    if (sp28.r != 0 || sp28.g != 0 || sp28.b != 0)
                    {
                        sp28.r = 255;
                        sp28.g = 255;
                        sp28.b = 255;
                    }
                    //lbl_80090BEC
                    GXSetTevKColor_cached(0, sp28);
                    g_tevStageCache.unk50 = 1;
                    */
                    // 40 -> 44 (g_tevStageCache.unk18 temp)
                    // r14 44 -> 28 (arg to GXSetTevKColor_cached)
                    inline_test1(g_tevStageCache.unk18);
                    g_tevStageCache.unk50 = 1;
                }
                //lbl_80090C08
                if (g_isNewTevColorInD != 0)
                {
                    func_80091878(&sp7C, g_tevColorArg, g_tevAlphaArg);
                    g_isNewTevColorInD = 0;
                }
                func_800918DC(&sp7C);
                //to lbl_80090D3C
            }
            //lbl_80090C30
            else
            {
                if (g_tevStageCache.unk54 == 0)
                {
                    /*
                    GXColor sp20 = g_tevStageCache.unk18;
                    if (sp20.r == 0 && sp20.g == 0 && sp20.b == 0)
                    {
                        sp20.r = 255;
                        sp20.g = 255;
                        sp20.b = 255;
                    }
                    sp20.r = (float)sp20.r * lbl_802F20F4;
                    sp20.g = (float)sp20.g * lbl_802F20F8;
                    sp20.b = (float)sp20.b * lbl_802F20FC;
                    GXSetTevKColor_cached(1, sp20);
                    g_tevStageCache.unk54 = 1;
                    */
                    // 32 -> 40 (g_tevStageCache.unk18 temp)
                    // r27 36 -> 24 (arg to GXSetTevKColor_cached)
                    inline_test2(g_tevStageCache.unk18);
                    g_tevStageCache.unk54 = 1;
                }
                //lbl_80090D18
                if (g_isNewTevColorInD != 0)
                {
                    func_80091B1C(&sp7C, g_tevColorArg, g_tevAlphaArg);
                    g_isNewTevColorInD = 0;
                }
                func_80091B88(&sp7C);
            }
            //lbl_80090D3C
            sp7C.g_someTexmapId1++;
            r19++;
            tevStageCounter--;
            samplerIdx++;
            r17++;
            g_someSamplerIdx++;
            g_tevColorArg = 0;
            g_tevAlphaArg = 0;
        }
        //lbl_80090D70
        while (tevStageCounter > 0)
        {
            struct GMASampler *sampler = &modelSamplers[*samplerIdx];  // r4
            u32 r16 = sampler->flags;  // actually, r27
            r16 &= 0xA003;
            *r17 = r16;
            if (*g_someSamplerIdx != *samplerIdx || (sampler->flags & 0x10000))
            {
                GXLoadTexObj_cached(sampler->texObj, sp7C.g_someTexmapId1);
                *g_someSamplerIdx = *samplerIdx;
            }
            if (r16 == 0)
            {
                func_80091404(&sp7C, g_tevColorArg, g_tevAlphaArg, r19);
                func_80091564(&sp7C);
            }
            else if (r16 & 0x2000)
            {
                func_80091580(&sp7C, g_tevColorArg, g_tevAlphaArg, r19);
                func_800916E0(&sp7C);
            }
            else if (r16 & 0x2000)  // same thing
            {
                func_80091BA4(&sp7C, g_tevColorArg, g_tevAlphaArg, r19);
                func_80091D0C(&sp7C);
            }
            //lbl_80090E54
            else if (r16 & 1)
            {
                if (g_tevStageCache.unk50 == 0)
                {
                    /*
                    GXColor sp28 = g_tevStageCache.unk18;
                    if (sp28.r != 0 || sp28.g != 0 || sp28.b != 0)
                    {
                        sp28.r = 255;
                        sp28.g = 255;
                        sp28.b = 255;
                    }
                    GXSetTevKColor_cached(0, sp28);
                    g_tevStageCache.unk50 = 1;
                    */
                    // 24 -> 36 (g_tevStageCache.unk18 temp)
                    // 28 -> 20 (arg to GXSetTevKColor_cached)
                    inline_test1(g_tevStageCache.unk18);
                    g_tevStageCache.unk50 = 1;
                }
                func_800916FC(&sp7C, g_tevColorArg, g_tevAlphaArg, r19);
                func_800918DC(&sp7C);
            }
            else
            {
                if (g_tevStageCache.unk54 == 0)
                {
                    /*
                    GXColor sp20 = g_tevStageCache.unk18;
                    if (sp20.r == 0 && sp20.g == 0 && sp20.b == 0)
                    {
                        sp20.r = 255;
                        sp20.g = 255;
                        sp20.b = 255;
                    }
                    sp20.r = (float)sp20.r * lbl_802F20F4;
                    sp20.g = (float)sp20.g * lbl_802F20F8;
                    sp20.b = (float)sp20.b * lbl_802F20FC;
                    GXSetTevKColor_cached(1, sp20);
                    g_tevStageCache.unk54 = 1;
                    */
                    // 16 -> 32 (g_tevStageCache.unk18 temp)
                    // r21 20 -> 16 (arg to GXSetTevKColor_cached)
                    inline_test2(g_tevStageCache.unk18);
                    g_tevStageCache.unk54 = 1;
                }
                func_800918F8(&sp7C, g_tevColorArg, g_tevAlphaArg, r19);
                func_80091B88(&sp7C);
            }
            sp7C.g_someTexmapId1++;
            r19++;
            tevStageCounter--;
            samplerIdx++;
            r17++;
            g_someSamplerIdx++;
            g_tevColorArg = 0;
            g_tevAlphaArg = 0;
        }
        *r17 = -1;
    }
    //lbl_80091020
    if (lbl_802F20EC != NULL)
    {
        struct UnkStruct33 sp3C;
        sp3C.unk0 = g_tevStageCache.unk0;
        sp3C.unk4 = shape;
        sp3C.unk8 = modelSamplers;
        sp3C.unkC = sp7C;
        lbl_802F20EC((void *)&sp3C);
        sp7C = sp3C.unkC;
    }
    //lbl_800910F8
    if (lbl_802F210C != 0)
    {
        if (g_tevStageCache.unk8 != sp7C.tevStage)
        {
            g_tevStageCache.unk8 = sp7C.tevStage;
            func_8009127C(sp7C.tevStage);
        }
        sp7C.tevStage++;
    }
    //lbl_8009112C
    if (lbl_802F2114 != 0)
    {
        if (g_tevStageCache.unkC != sp7C.tevStage)
        {
            g_tevStageCache.unk8 = sp7C.tevStage;
            func_80091340(sp7C.tevStage);
        }
        sp7C.tevStage++;
    }
    //lbl_8009115C
    GXSetNumChans(1);
    inline_test3(sp7C.tevStage);
    inline_test4(sp7C.g_texCoordId1);
    inline_test5(sp7C.unk10);
    //lbl_800911D0
    g_blendSrcFactor = GX_BL_SRCALPHA;
    g_blendDstFactor = GX_BL_INVSRCALPHA;
    if (shape->flags & GMA_SHAPE_FLAG_CUSTOM_BLEND_SRC)
        g_blendSrcFactor = shape->g_blendFlags & 0xF;
    if (shape->flags & GMA_SHAPE_FLAG_CUSTOM_BLEND_DST)
        g_blendDstFactor = (shape->g_blendFlags >> 4) & 0xF;
    if (g_tevStageCache.g_blendSrcFactor != g_blendSrcFactor || g_tevStageCache.g_blendDstFactor != g_blendDstFactor)
    {
        GXSetBlendMode_cached(GX_BM_BLEND, g_blendSrcFactor, g_blendDstFactor, GX_LO_CLEAR);
        g_tevStageCache.g_blendSrcFactor = g_blendSrcFactor;
        g_tevStageCache.g_blendDstFactor = g_blendDstFactor;
    }
    //lbl_8009123C
    g_tevStageCache.unk0 = 0;
    if (shape->flags & GMA_SHAPE_FLAG_SIMPLE_MATERIAL)
        g_tevStageCache.g_tevStageCount = 0;
    else
        g_tevStageCache.g_tevStageCount = shape->tevStageCount;
}
#else
asm void g_build_tev_material(struct GMAShape *a, struct GMASampler *b)
{
#define _SDA_BASE_ 0
#define _SDA2_BASE_ 0
    nofralloc
#include "../asm/nonmatchings/g_build_tev_material.s"
}
#endif

void func_8009127C(GXTevStageID tevStage)
{
    GXSetTevKColorSel_cached(tevStage, GX_TEV_KCSEL_K2);
    GXSetTevKAlphaSel_cached(tevStage, GX_TEV_KASEL_K2_A);
    GXSetTevDirect(tevStage);
    GXSetTevOrder_cached(tevStage, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
    GXSetTevColorIn_cached(tevStage, GX_CC_ZERO, GX_CC_CPREV, GX_CC_KONST, GX_CC_ZERO);
    GXSetTevColorOp_cached(tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn_cached(tevStage, GX_CA_ZERO, GX_CA_APREV, GX_CA_KONST, GX_CA_ZERO);
    GXSetTevAlphaOp_cached(tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}

void func_80091340(GXTevStageID tevStage)
{
    GXSetTevKColorSel_cached(tevStage, GX_TEV_KCSEL_K3);
    GXSetTevKAlphaSel_cached(tevStage, GX_TEV_KASEL_K3_A);
    GXSetTevDirect(tevStage);
    GXSetTevOrder_cached(tevStage, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
    GXSetTevColorIn_cached(tevStage, GX_CC_CPREV, GX_CC_ZERO, GX_CC_ZERO, GX_CC_KONST);
    GXSetTevColorOp_cached(tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn_cached(tevStage, GX_CA_APREV, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}

void func_80091404(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg, GXTexGenSrc texGenSrc)
{
    GXSetTevDirect(a->tevStage);
    GXSetTevSwapMode_cached(a->tevStage, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTexCoordGen(a->g_texCoordId1, GX_TG_MTX2x4, texGenSrc, GX_TEXMTX1);
    GXSetTevOrder_cached(a->tevStage, a->g_texCoordId1, a->g_someTexmapId1, GX_COLOR0A0);
    GXSetTevColorIn_cached(a->tevStage, GX_CC_ZERO, GX_CC_TEXC, colorArg, GX_CC_ZERO);
    GXSetTevColorOp_cached(a->tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn_cached(a->tevStage, GX_CA_ZERO, GX_CA_TEXA, alphaArg, GX_CA_ZERO);
    GXSetTevAlphaOp_cached(a->tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}

void func_80091500(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg)
{
    GXSetTevColorIn_cached(a->tevStage, GX_CC_ZERO, GX_CC_TEXC, colorArg, GX_CC_ZERO);
    GXSetTevAlphaIn_cached(a->tevStage, GX_CA_ZERO, GX_CA_TEXA, alphaArg, GX_CA_ZERO);
}

void func_80091564(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->g_texCoordId1++;
}

void func_80091580(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg, GXTexGenSrc texGenSrc)
{
    GXSetTevDirect(a->tevStage);
    GXSetTexCoordGen(a->g_texCoordId1, GX_TG_MTX2x4, texGenSrc, GX_TEXMTX1);
    GXSetTevOrder_cached(a->tevStage, a->g_texCoordId1, a->g_someTexmapId1, GX_COLOR0A0);
    GXSetTevSwapMode_cached(a->tevStage, GX_TEV_SWAP0, GX_TEV_SWAP1);
    GXSetTevColorIn_cached(a->tevStage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, colorArg);
    GXSetTevColorOp_cached(a->tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn_cached(a->tevStage, GX_CA_ZERO, GX_CA_TEXA, alphaArg, GX_CA_ZERO);
    GXSetTevAlphaOp_cached(a->tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}

void func_8009167C(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg)
{
    GXSetTevColorIn_cached(a->tevStage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, colorArg);
    GXSetTevAlphaIn_cached(a->tevStage, GX_CA_ZERO, GX_CA_TEXA, alphaArg, GX_CA_ZERO);
}

// duplicate of func_80091564
void func_800916E0(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->g_texCoordId1++;
}

void func_800916FC(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg, u32 d)
{
    GXSetTevDirect(a->tevStage);
    GXSetTevSwapMode_cached(a->tevStage, GX_TEV_SWAP0, GX_TEV_SWAP0);
    if (g_tevStageCache.unk44 == 0)
    {
        mathutil_mtxA_push();
        mathutilData->mtxA[0][3] = 0.0f;
        mathutilData->mtxA[1][3] = 0.0f;
        mathutilData->mtxA[2][3] = 0.0f;
        GXLoadTexMtxImm(mathutilData->mtxA, GX_TEXMTX0, GX_MTX3x4);
        mathutil_mtxA_pop();
        g_tevStageCache.unk44 = 1;
    }
    if (g_tevStageCache.unk48 == 0)
    {
        g_compute_texmtx0();
        g_tevStageCache.unk48 = 1;
    }
    GXSetTevKColorSel_cached(a->tevStage, GX_TEV_KCSEL_K0);
    GXSetTexCoordGen2(a->g_texCoordId1, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX0);
    GXSetTevOrder_cached(a->tevStage, a->g_texCoordId1, a->g_someTexmapId1, GX_COLOR0A0);
    GXSetTevColorIn_cached(a->tevStage, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, colorArg);
    GXSetTevColorOp_cached(a->tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn_cached(a->tevStage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, alphaArg);
    GXSetTevAlphaOp_cached(a->tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}

void func_80091878(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg)
{
    GXSetTevColorIn_cached(a->tevStage, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, colorArg);
    GXSetTevAlphaIn_cached(a->tevStage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, alphaArg);
}

// duplicate of func_80091564
void func_800918DC(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->g_texCoordId1++;
}

void func_800918F8(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg, u32 d)
{
    u32 tevStage;

    if (g_tevStageCache.unk44 == 0)
    {
        mathutil_mtxA_push();
        mathutilData->mtxA[0][3] = 0.0f;
        mathutilData->mtxA[1][3] = 0.0f;
        mathutilData->mtxA[2][3] = 0.0f;
        GXLoadTexMtxImm(mathutilData->mtxA, GX_TEXMTX0, GX_MTX3x4);
        mathutil_mtxA_pop();
        g_tevStageCache.unk44 = 1;
    }
    if (g_tevStageCache.unk4C == 0)
    {
        GXLoadTexObj_cached(&unknownTexObj, GX_TEXMAP0);
        g_compute_texmtx1and2();
        g_tevStageCache.unk4C = 1;
    }
    // unrolled loop?
    tevStage = a->tevStage;

    GXSetTevDirect(tevStage);
    GXSetTevSwapMode_cached(a->tevStage, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevKColorSel_cached(tevStage, GX_TEV_KCSEL_K1);
    GXSetTexCoordGen2(a->g_texCoordId1, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX2);
    GXSetTevOrder_cached(tevStage, a->g_texCoordId1, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevColorIn_cached(tevStage, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_ZERO);
    GXSetTevColorOp_cached(tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVREG2);
    GXSetTevAlphaIn_cached(tevStage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, alphaArg);
    GXSetTevAlphaOp_cached(tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVREG2);

    GXSetTevDirect(tevStage + 1);
    GXSetTevSwapMode_cached(a->tevStage, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTexCoordGen2(a->g_texCoordId1 + 1, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX1);
    GXSetTevOrder_cached(tevStage + 1, a->g_texCoordId1 + 1, a->g_someTexmapId1, GX_COLOR0A0);
    GXSetTevColorIn_cached(tevStage + 1, GX_CC_ZERO, GX_CC_TEXC, GX_CC_C2, colorArg);
    GXSetTevColorOp_cached(tevStage + 1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn_cached(tevStage + 1, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, alphaArg);
    GXSetTevAlphaOp_cached(tevStage + 1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}

void func_80091B1C(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg)
{
    GXSetTevColorIn_cached(a->tevStage + 1, GX_CC_ZERO, GX_CC_TEXC, GX_CC_C2, colorArg);
    GXSetTevAlphaIn_cached(a->tevStage + 1, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, alphaArg);
}

void func_80091B88(struct UnkStruct32 *a)
{
    a->tevStage += 2;
    a->g_texCoordId1 += 2;
}

void func_80091BA4(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg, GXTexGenSrc texGenSrc)
{
    GXSetTevDirect(a->tevStage);
    GXSetTexCoordGen(a->g_texCoordId1, GX_TG_MTX2x4, texGenSrc, GX_TEXMTX1);
    GXSetTevOrder_cached(a->tevStage, a->g_texCoordId1, a->g_someTexmapId1, GX_COLOR0A0);
    GXSetTevColorIn_cached(a->tevStage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, colorArg);
    GXSetTevColorOp_cached(a->tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn_cached(a->tevStage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, alphaArg);
    GXSetTevAlphaOp_cached(a->tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    a->unk20 = 1;
    a->g_texCoordId2 = a->g_texCoordId1;
    a->g_someTexmapId2 = a->g_someTexmapId1;
}

void func_80091CA8(struct UnkStruct32 *a, GXTevColorArg colorArg, GXTevAlphaArg alphaArg)
{
    GXSetTevColorIn_cached(a->tevStage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, colorArg);
    GXSetTevAlphaIn_cached(a->tevStage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, alphaArg);
}

// duplicate of func_80091564
void func_80091D0C(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->g_texCoordId1++;
}
