#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "gxutil.h"
#include "load.h"
#include "mathutil.h"
#include "ord_tbl.h"
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
float lbl_802F212C;
float lbl_802F2128;
GXColor lbl_802F2124;
u32 lbl_802F2120;
s32 lbl_802F211C;
GXColor lbl_802F2118;
s32 lbl_802F2114;
GXColor lbl_802F2110;
s32 lbl_802F210C;
s32 lbl_802F2108;
GXCompare zModeCompareFunc;
GXBool zModeUpdateEnable;
GXBool zModeCompareEnable;
float lbl_802F20FC;
float lbl_802F20F8;
float lbl_802F20F4;
Func802F20F0 lbl_802F20F0;
BallEnvFunc lbl_802F20EC;
s32 g_cullMode;
float modelScale;
u32 lbl_802F20E0;
float lbl_802F20DC;
float lbl_802F20D8;
float lbl_802F20D4;
float lbl_802F20D0;
Mtx *g_transformMtxList;  // result of matrix multiplications between mtxA and avdispMtxPtrList?
Mtx **avdispMtxPtrList;

struct Struct802B4ECC
{
    u8 unk0;  // 0x6c
    s8 unk1;
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
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    s32 unk28;
    u32 unk2C[3];  // 0x98  array?
    u32 unk38;  // 0xA4
    u16 unk3C[3];  // 0xA8
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
static struct Struct802B4ECC lbl_802B4ECC;
static GXTexObj unknownTexObj;
static u8 filler_802B4F50[0x10];
static u8 lzssHeader[32] __attribute__((aligned(32)));
static u8 unknownTexImg[64];

FORCE_BSS_ORDER(lbl_802B4E60)
FORCE_BSS_ORDER(lbl_802B4E6C)
FORCE_BSS_ORDER(lbl_802B4E9C)
FORCE_BSS_ORDER(lbl_802B4ECC)
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
    lbl_802F20DC = 1.0f;
    lbl_802F20E0 = 1;
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
    func_8008F878(0);
    func_8008F880(2, 0.0f, 100.0f);
    func_8008F890(0, 0, 0);
}

void g_avdisp_alloc_matrix_lists(int count)
{
    g_transformMtxList = OSAlloc(count * sizeof(Mtx));
    avdispMtxPtrList = OSAlloc(count * sizeof(Mtx *));
}

#pragma force_active on
void g_get_stitching_model_mtx(struct GMAModelHeader *a, Mtx **dest)
{
    u8 i;
    int unused1;
    int unused2;
    // matrices are stored immediately after materials
    Mtx *pMtx = (void *)((u8 *)a->materials + a->numMaterials * sizeof(struct GMAMaterial));

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

struct GMAModelHeader *load_model(char *fileName, struct TPL *tpl)
{
    struct GMAModelHeader *model;
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

void free_model(struct GMAModelHeader *model)
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
        struct GMAModelHeader *model = gma->modelEntries[i].modelOffset;

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

void g_avdisp_maybe_draw_model_1(struct GMAModelHeader *model)
{
    if (g_frustum_test_maybe_2(&model->boundsCenter, model->boundsRadius, modelScale) == 0)
    {
        modelScale = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        lbl_802F20DC = 1.0f;
    }
    else
        g_avdisp_draw_model_1(model);
}

void g_avdisp_maybe_draw_model_2(struct GMAModelHeader *model)
{
    if (g_frustum_test_maybe_2(&model->boundsCenter, model->boundsRadius, modelScale) == 0)
    {
        modelScale = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        lbl_802F20DC = 1.0f;
    }
    else
        g_avdisp_draw_model_2(model);
}

void g_avdisp_maybe_draw_model_3(struct GMAModelHeader *model)
{
    if (g_frustum_test_maybe_2(&model->boundsCenter, model->boundsRadius, modelScale) == 0)
    {
        modelScale = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        lbl_802F20DC = 1.0f;
    }
    else
        g_avdisp_draw_model_3(model);
}

void g_avdisp_set_alpha(float a)
{
    lbl_802F20DC = a;
}

void func_8008E56C(u32 a)
{
    lbl_802F20E0 = a;
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
    zModeCompareEnable = compareEnable;
    zModeCompareFunc   = compareFunc;
    zModeUpdateEnable  = updateEnable;
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
void *func_8008E5F8(struct GMAModelHeader *model)
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

void *func_8008E64C(struct GMAModelHeader *model)
{
    // hmm... with these flags, this shouldn't point to the mesh?
    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        return (u8 *)model + model->headerSize;
    else
    {
        printf("non effective model.\n");
        return NULL;
    }
}
#pragma force_active reset

static inline void *skip_mesh(struct GMAMeshHeader *mesh)
{
    u8 *ptr = mesh->dispListData;
    int i;

    // skip over display lists
    for (i = 0; i < 2; i++)
    {
        if (mesh->unk13 & (1 << i))
            ptr += mesh->dispListSizes[i];
    }

    // TODO: what is this?
    if (mesh->unk13 & 0xC)
    {
        u32 *r4 = (u32 *)ptr;
        ptr += 32;
        ptr += r4[2];
        ptr += r4[3];
    }

    return (void *)ptr;
}

#pragma force_active on
void set_mesh_render_flags_in_model(struct GMAModelHeader *model, u32 flags)
{
    struct GMAMeshHeader *meshPtr = OFFSET_TO_PTR(model, model->headerSize);

    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
    {
        u32 i;
        struct GMAMeshHeader *meshes = OFFSET_TO_PTR(meshPtr, 32);
        for (i = 0; i < model->numLayer1Meshes + model->numLayer2Meshes; i++)
            meshes[i].renderFlags |= flags;
    }
    else
    {
        u32 i;
        struct GMAMeshHeader *mesh = meshPtr;
        for (i = 0; i < model->numLayer1Meshes + model->numLayer2Meshes; i++)
        {
            mesh->renderFlags |= flags;
            mesh = skip_mesh(mesh);
        }
    }
}
#pragma force_active reset

struct DrawMeshDeferredNode
{
    struct OrdTblNode node;
    struct GMAModelHeader *model;
    Mtx mtx;
    struct GMAMaterial *mtrl;
    struct GMAMeshHeader *mesh;
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
    u32 unk70;
};

static inline struct GMAMeshHeader *draw_mesh_deferred(struct GMAModelHeader *model, struct GMAMeshHeader *mesh, struct GMAMaterial *mtrl)
{
    struct OrdTblNode *entry;
    u32 r23 = g_cullMode;
    struct DrawMeshDeferredNode *node = ord_tbl_alloc_node(sizeof(*node));

    if (mesh->unk14 != 0xFF)
        entry = ord_tbl_get_entry_for_pos_offset_index(&mesh->unk30, -1);
    else
        entry = ord_tbl_get_entry_for_pos(&mesh->unk30);
    node->node.drawFunc = (OrdTblDrawFunc)draw_mesh_deferred_callback;
    node->model = model;
    node->mesh = mesh;
    node->mtrl = mtrl;
    node->unk44 = r23;
    node->unk48 = func_800223D0();
    node->unk4C = lbl_802F20DC;
    node->unk50 = lbl_802F20EC;
    node->unk54 = lbl_802F20F0;
    node->zCompEnable = zModeCompareEnable;
    node->zUpdEnable = zModeUpdateEnable;
    node->zCompFunc = zModeCompareFunc;
    node->unk60 = lbl_802F2108;
    node->unk61 = lbl_802F210C;
    node->unk62 = lbl_802F2114;
    if (node->unk60 != 0)
    {
        node->unk64 = ord_tbl_alloc_node(sizeof(*node->unk64));
        mathutil_mtx_copy(lbl_802B4E6C, *node->unk64);
    }
    if (node->unk61 != 0)
        node->unk68 = lbl_802F2110;
    if (node->unk62 != 0)
        node->unk6C = lbl_802F2118;
    node->unk70 = lbl_802F211C;
    mathutil_mtxA_to_mtx(node->mtx);
    ord_tbl_insert_node(entry, &node->node);
    return skip_mesh(mesh);
}

void g_avdisp_draw_model_1(struct GMAModelHeader *model)
{
    struct GMAMeshHeader *mesh = OFFSET_TO_PTR(model, model->headerSize);
    struct GMAMaterial *mtrl = OFFSET_TO_PTR(model, 0x40);
    int i;

    g_cullMode = GX_CULL_BACK;
    GXSetCullMode_cached(g_cullMode);
    if (model->flags & GCMF_STITCHING)
        g_iteratively_multiply_model_matrices(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, mesh);

    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        draw_model_0x18(model, mesh, mtrl);
    else
    {
        for (i = 0; i < model->numLayer1Meshes; i++)
            mesh = draw_model_8008F914(model, mesh, mtrl);
        for (i = 0; i < model->numLayer2Meshes; i++)
            mesh = draw_mesh_deferred(model, mesh, mtrl);
    }

    modelScale = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    lbl_802F20DC = 1.0f;
}

// for transparent objects?
void g_avdisp_draw_model_2(struct GMAModelHeader *model)
{
    struct GMAMeshHeader *mesh = OFFSET_TO_PTR(model, model->headerSize);
    struct GMAMaterial *mtrl = OFFSET_TO_PTR(model, 0x40);
    int i;

    g_cullMode = 2;
    GXSetCullMode_cached(g_cullMode);
    if (model->flags & GCMF_STITCHING)
        g_iteratively_multiply_model_matrices(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, mesh);

    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        draw_model_0x18(model, mesh, mtrl);
    else
    {
        for (i = 0; i < model->numLayer1Meshes; i++)
            mesh = draw_model_8008F914(model, mesh, mtrl);
        for (i = 0; i < model->numLayer2Meshes; i++)
            mesh = draw_model_8008F914(model, mesh, mtrl);
    }

    modelScale = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    lbl_802F20DC = 1.0f;
}

void g_avdisp_draw_model_3(struct GMAModelHeader *model)
{
    struct GMAMeshHeader *mesh = OFFSET_TO_PTR(model, model->headerSize);
    struct GMAMaterial *mtrl = OFFSET_TO_PTR(model, 0x40);
    int i;

    g_cullMode = 2;
    GXSetCullMode_cached(g_cullMode);
    if (model->flags & GCMF_STITCHING)
        g_iteratively_multiply_model_matrices(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, mesh);

    for (i = 0; i < model->numLayer1Meshes; i++)
        mesh = (void *)draw_mesh_deferred(model, mesh, mtrl);
    for (i = 0; i < model->numLayer2Meshes; i++)
        mesh = (void *)draw_mesh_deferred(model, mesh, mtrl);

    modelScale = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    lbl_802F20DC = 1.0f;
}

void g_avdisp_draw_model_4(struct GMAModelHeader *model)
{
    struct GMAMeshHeader *mesh = OFFSET_TO_PTR(model, model->headerSize);
    struct GMAMaterial *mtrl = OFFSET_TO_PTR(model, 0x40);
    int i;

    g_cullMode = 2;
    if (model->flags & GCMF_STITCHING)
        g_iteratively_multiply_model_matrices(model);

    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        draw_model_0x18(model, mesh, mtrl);
    else
    {
        for (i = 0; i < model->numLayer1Meshes; i++)
            mesh = draw_model_8008F914(model, mesh, mtrl);
    }

    modelScale = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    lbl_802F20DC = 1.0f;
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

void init_material(struct GMAMaterial *mtrl, struct TPLTextureHeader *texHdr, struct TPL *tpl)
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
        mtrl->texObj = NULL;
        return;
    }

    switch ((mtrl->flags >> 2) & 3)
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
    switch ((mtrl->flags >> 4) & 3)
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
        maxLOD = (mtrl->flags >> 7) & 0xF;
        if (maxLOD == 15)
            maxLOD = get_texture_max_lod(texHdr->width, texHdr->height);  // inlined
    }
    GXInitTexObj(
        mtrl->texObj,  // obj
        imagePtr,  // image_ptr
        texHdr->width,  // width
        texHdr->height,  // height
        texHdr->format & 0x1F,  // format
        wrapS,  // wrap_s
        wrapT,  // wrap_t
        maxLOD != 0);  // mipmap

    if (mtrl->flags & 0x800)
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
        mtrl->texObj,  // obj
        minFilt,  // min_filt
        magFilt,  // mag_filt
        0.0f,  // min_lod
        maxLOD,  // max_lod
        mtrl->unk6 / 10.0f,  // lod_bias
        FALSE,  // bias_clamp
        (mtrl->flags & 0x40) != 0,  // do_edge_lod
        mtrl->unk7);  // max_aniso
}

static inline struct GMAMeshHeader *init_mesh_render_flags(struct GMAMeshHeader *mesh)
{
    if (mesh->vtxFlags & (1 << GX_VA_CLR0))
        mesh->renderFlags |= 0x100;
    if (mesh->unk12 == 0)
        mesh->renderFlags |= 0x80;
    return skip_mesh(mesh);
}

GXTexObj *init_model(struct GMAModelHeader *model, struct TPL *tpl, GXTexObj *texObj)
{
    struct GMAMaterial *materials;
    struct GMAMeshHeader *mesh;
    int i;

    if (tpl == NULL)
        model->numMaterials = 0;
    materials = (void *)model->materials;

    // Allocate GX texture objects for materials
    if (model->numMaterials != 0)
    {
        if (texObj != NULL)
        {
            model->texObjs = texObj;
            texObj += model->numMaterials;
        }
        else
            model->texObjs = OSAlloc(model->numMaterials * sizeof(GXTexObj));
        if (model->texObjs == NULL)
            OSPanic("avdisp.c", 0x58B, "cannot OSAlloc");
    }
    else
        model->texObjs = NULL;

    // Initialize materials
    for (i = 0; i < model->numMaterials; i++)
    {
        materials[i].texObj = &model->texObjs[i];
        init_material(&materials[i], &tpl->texHeaders[materials[i].unk4], tpl);
    }

    // Get pointer to mesh
    // If model is GCMF_SKIN or GCMF_EFFECTIVE, then the mesh offset is 32 bytes more
    mesh = OFFSET_TO_PTR(model, model->headerSize);
    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        mesh = OFFSET_TO_PTR((u32)mesh, 32);

    for (i = 0; i < model->numLayer1Meshes; i++)
    {
        if (tpl == NULL)
            mesh->unk12 = 0;
        if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        {
            struct GMAMeshHeader *r3 = mesh;
            mesh++;
            init_mesh_render_flags(r3);
        }
        else
            mesh = init_mesh_render_flags(mesh);
    }
    for (i = 0; i < model->numLayer2Meshes; i++)
    {
        if (tpl == NULL)
            mesh->unk12 = 0;
        if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        {
            struct GMAMeshHeader *r3 = mesh;
            mesh++;
            init_mesh_render_flags(r3);
        }
        else
            mesh = init_mesh_render_flags(mesh);
    }
    return texObj;
}

void g_iteratively_multiply_model_matrices(struct GMAModelHeader *model)
{
    unsigned int i;

    for (i = 0; i < model->mtxCount; i++)
        mathutil_mtx_mult(mathutilData->mtxA, *avdispMtxPtrList[i], g_transformMtxList[i]);
    func_8008F8A4(model->mtxIndexes);
}

void draw_mesh_deferred_callback(struct DrawMeshDeferredNode *node)
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

    if ((node->mesh->renderFlags & 0x1) == 0)
        func_800223D8(node->unk48);
    g_gxutil_upload_some_mtx(node->mtx, 0);
    mathutil_mtxA_from_mtx(node->mtx);
    GXSetCullMode_cached(node->unk44);
    g_cullMode = node->unk44;
    r31 = lbl_802F20EC;
    r30 = lbl_802F20F0;
    r29 = zModeCompareEnable;
    r28 = zModeUpdateEnable;
    r27 = zModeCompareFunc;
    r26 = lbl_802F2108;
    lbl_802F20DC = node->unk4C;
    lbl_802F20EC = node->unk50;
    lbl_802F20F0 = node->unk54;
    zModeCompareEnable = node->zCompEnable;
    zModeUpdateEnable = node->zUpdEnable;
    zModeCompareFunc = node->zCompFunc;
    lbl_802F2108 = node->unk60;
    if (node->unk60 != 0)
        mathutil_mtx_copy(*node->unk64, lbl_802B4E6C);
    r25 = lbl_802F210C;
    lbl_802F210C = node->unk61;
    if (node->unk61 != 0)
    {
        sp10 = lbl_802F2110;
        lbl_802F2110 = node->unk68;
    }
    r23 = lbl_802F2114;
    lbl_802F2114 = node->unk62;
    if (node->unk62 != 0)
    {
        spC = lbl_802F2118;
        lbl_802F2118 = node->unk6C;
    }
    r22 = lbl_802F211C;
    lbl_802F211C = node->unk70;
    if (lbl_802F20F0 == NULL)
        func_8008FE44(node->model, node->mesh);
    draw_model_8008F914(node->model, node->mesh, node->mtrl);
    lbl_802F20EC = r31;
    lbl_802F20F0 = r30;
    zModeCompareEnable = r29;
    zModeUpdateEnable = r28;
    zModeCompareFunc = r27;
    lbl_802F2108 = r26;
    lbl_802F210C = r25;
    if (node->unk61 != 0)
        lbl_802F2110 = sp10;
    lbl_802F2114 = r23;
    if (node->unk62 != 0)
        lbl_802F2118 = spC;
    lbl_802F211C = r22;
    lbl_802F20DC = 1.0f;
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
        lbl_802F2110.r = a * 255.0f;
        lbl_802F2110.g = b * 255.0f;
        lbl_802F2110.b = c * 255.0f;
        lbl_802F2110.a = d * 255.0f;
    }
    else
    {
        lbl_802F210C = 0;
        lbl_802F2110.r = 255;
        lbl_802F2110.g = 255;
        lbl_802F2110.b = 255;
        lbl_802F2110.a = 255;
    }
}

void g_avdisp_set_some_color_2(float a, float b, float c, float d)
{
    if (a != 0.0f || b != 0.0f || c != 0.0f || d != 0.0f)
    {
        lbl_802F2114 = 1;
        lbl_802F2118.r = a * 255.0f;
        lbl_802F2118.g = b * 255.0f;
        lbl_802F2118.b = c * 255.0f;
        lbl_802F2118.a = d * 255.0f;
    }
    else
    {
        lbl_802F2114 = 0;
        lbl_802F2118.r = 0;
        lbl_802F2118.g = 0;
        lbl_802F2118.b = 0;
        lbl_802F2118.a = 0;
    }
}

void func_8008F878(int a)
{
    lbl_802F211C = a;
}

void func_8008F880(int a, float b, float c)
{
    lbl_802F2120 = a;
    lbl_802F2128 = b;
    lbl_802F212C = c;
}

void func_8008F890(u8 a, u8 b, u8 c)
{
    lbl_802F2124.r = a;
    lbl_802F2124.g = b;
    lbl_802F2124.b = c;
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
    struct GMAMeshHeader *mesh;
    struct GMAMaterial *mtrl;
    u8 fillerC[0x38-0xC];
};

struct UnkStruct31
{
    u32 unk0;
    u8 filler4[4];
    GXTexObj *unk8;
    u8 fillerC[0x20-0xC];
};

struct GMAMeshHeader *draw_model_8008F914(struct GMAModelHeader *model, struct GMAMeshHeader *mesh, struct GMAMaterial *mtrl)
{
    int i;
    u8 *dlist;
    GXCullMode cullMode;
    u8 bvar;
    struct UnkStruct27 sp20;
    u8 unused[12];

    if (mesh->renderFlags & 2)
        cullMode = GX_CULL_NONE;
    else
        cullMode = GX_CULL_FRONT;
    if (model->flags & GCMF_STITCHING)
        func_8008F8A4(mesh->unk20);  // inlined
    gxutil_set_vtx_attrs(mesh->vtxFlags);
    dlist = mesh->dispListData;

    if (lbl_802F20F0 != NULL)
    {
        sp20.mesh = (void *)mesh;
        sp20.mtrl = mtrl;
        bvar = lbl_802F20F0(&sp20);
    }
    else
    {
        func_80090524((void *)mesh, (void *)mtrl);
        bvar = 1;
    }

    if (bvar)
    {
        for (i = 0; i < 2; i++)
        {
            if (mesh->unk13 & (1 << i))
            {
                if (g_cullMode != cullMode)
                {
                    g_cullMode = cullMode;
                    GXSetCullMode_cached(cullMode);
                }
                GXCallDisplayList(dlist, mesh->dispListSizes[i]);
                dlist += mesh->dispListSizes[i];
            }
            if (cullMode != GX_CULL_NONE)
                cullMode = GX_CULL_BACK;
        }
        if ((mesh->unk13 & 0xC) != 0)
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
        return skip_mesh(mesh);
    }
    return (struct GMAMeshHeader *)dlist;
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

void *draw_mesh_reflection_maybe(struct GMAMeshHeader *mesh, void *mtrl, struct UnkStruct29 *c, u8 *d)
{
    int i;
    int r30;
    u8 *r29 = (u8 *)c + c->unk8;
    u8 bvar;
    struct UnkStruct27 sp20;

    if (mesh->renderFlags & 2)
        r30 = 0;
    else
        r30 = 2;
    gxutil_set_vtx_attrs(mesh->vtxFlags);

    if (lbl_802F20F0 != NULL)
    {
        sp20.mesh = (void *)mesh;
        sp20.mtrl = mtrl;
        bvar = lbl_802F20F0(&sp20);
    }
    else
    {
        func_80090524((void *)mesh, (void *)mtrl);
        bvar = 1;
    }

    if (bvar)
    {
        __GXSetDirtyState();
        for (i = 0; i < 2; i++)
        {
            if (mesh->unk13 & (1 << i))
            {
                if (g_cullMode != r30)
                {
                    u32 r3;
                    g_cullMode = r30;
                    r3 = (gx->unk204 & ~0xC000) | r30 << 14;
                    gx->unk204 = r3;
                    func_8008D6BC(r3);
                }
                func_8008FBB0(mesh->vtxFlags, r29, d, mesh->dispListSizes[i]);
                d += mesh->dispListSizes[i] * 4;
            }
            if (r30 != 0)
                r30 = 1;
        }
    }
    return d;
}

void draw_model_0x18(struct GMAModelHeader *model, struct GMAMeshHeader *b, struct GMAMaterial *mtrl)
{
    int i;  // r31
    u8 *r30 = b->unk20;
    struct GMAMeshHeader *r6 = (void *)((u8 *)b + b->unkC.asU32);

    g_cullMode = 1;
    for (i = 0; i < model->numLayer1Meshes; i++)
    {
        r6 = draw_mesh_reflection_maybe((void *)r30, mtrl, (void *)b, (void *)r6);
        r30 += 0x60;
    }
    for (i = 0; i < model->numLayer2Meshes; i++)
    {
        r6 = draw_mesh_reflection_maybe((void *)r30, mtrl, (void *)b, (void *)r6);
        r30 += 0x60;
    }
}

void func_8008FE44(struct GMAModelHeader *model, struct GMAMeshHeader *mesh)
{
    lbl_802B4ECC.unk0 = 1;
    if (model->flags & (GCMF_SKIN|GCMF_EFFECTIVE))
        mesh = (struct GMAMeshHeader *)((u8 *)mesh + 0x20);
    if (lbl_802F2108 != 0)
        GXLoadTexMtxImm(lbl_802B4E6C, GX_TEXMTX1, GX_MTX3x4);
    else
        GXLoadTexMtxImm(lbl_802B4E9C, GX_TEXMTX1, GX_MTX3x4);
    if (zModeUpdateEnable  != zMode->updateEnable
     || zModeCompareFunc   != zMode->compareFunc
     || zModeCompareEnable != zMode->compareEnable)
    {
        GXSetZMode(zModeCompareEnable, zModeCompareFunc, zModeUpdateEnable);
        zMode->compareEnable = zModeCompareEnable;
        zMode->compareFunc   = zModeCompareFunc;
        zMode->updateEnable  = zModeUpdateEnable;
    }
    if (lbl_802F211C != 0)
        GXSetFog_cached(lbl_802F2120, lbl_802F2128, lbl_802F212C, 0.1f, 20000.0f, lbl_802F2124);
    else
        GXSetFog_cached(0, 0.0f, 100.0f, 0.1f, 20000.0f, lbl_802F2124);
    if (mesh->renderFlags & 0x88)
        lbl_802B4ECC.unk10 = mesh->unk4;
    else
    {
        lbl_802B4ECC.unk10.r = 255;
        lbl_802B4ECC.unk10.g = 255;
        lbl_802B4ECC.unk10.b = 255;
    }
    lbl_802B4ECC.unk10.a = mesh->unk11;
    if (mesh->renderFlags & 0x8)
        lbl_802B4ECC.unk14 = mesh->unk8;
    else
    {
        lbl_802B4ECC.unk14.r = 255;
        lbl_802B4ECC.unk14.g = 255;
        lbl_802B4ECC.unk14.b = 255;
    }
    lbl_802B4ECC.unk14.a = 255;
    func_8008D6D4(mesh);
    lbl_802B4ECC.unk18.r = mesh->unkC.asColor.r;
    lbl_802B4ECC.unk18.g = mesh->unkC.asColor.g;
    lbl_802B4ECC.unk18.b = mesh->unkC.asColor.b;
    lbl_802B4ECC.unk2 = 0;
    lbl_802B4ECC.unk1C = 15;
    lbl_802B4ECC.unk20 = 7;
    lbl_802B4ECC.unk3 = -1;
    lbl_802B4ECC.unk4 = -1;
    lbl_802B4ECC.unk5 = -1;
    lbl_802B4ECC.unk8 = 16;
    lbl_802B4ECC.unkC = 16;
    if (lbl_802F210C != 0)
        GXSetTevKColor_cached(2, lbl_802F2110);
    if (lbl_802F2114 != 0)
        GXSetTevKColor_cached(3, lbl_802F2118);
    lbl_802B4ECC.unk24 = 4;
    lbl_802B4ECC.unk28 = 5;
    if (mesh->renderFlags & 0x20)
        lbl_802B4ECC.unk24 = mesh->unk40 & 0xF;
    if (mesh->renderFlags & 0x40)
        lbl_802B4ECC.unk28 = (mesh->unk40 >> 4) & 0xF;
    GXSetBlendMode_cached(1, lbl_802B4ECC.unk24, lbl_802B4ECC.unk28, 0);
    lbl_802B4ECC.unk1 = -1;
    lbl_802B4ECC.unk2C[0] = -1;
    lbl_802B4ECC.unk2C[1] = -1;
    lbl_802B4ECC.unk2C[2] = -1;
    lbl_802B4ECC.unk38 = -1;
    lbl_802B4ECC.unk3C[0] = 0xFFFF;
    lbl_802B4ECC.unk3C[1] = 0xFFFF;
    lbl_802B4ECC.unk3C[2] = 0xFFFF;
    lbl_802B4ECC.unk44 = 0;
    lbl_802B4ECC.unk48 = 0;
    lbl_802B4ECC.unk4C = 0;
    lbl_802B4ECC.unk50 = 0;
    lbl_802B4ECC.unk54 = 0;
    mathutil_mtxA_tf_point(&model->boundsCenter, &lbl_802B4ECC.unk58);
    lbl_802B4ECC.unk58.z -= model->boundsRadius;
    mathutil_vec_normalize_len(&lbl_802B4ECC.unk58);
}

void g_compute_texmtx0(void)
{
    Point3d cameraPos = {0.0f, 0.0f, 0.0f};
    Vec cameraUp = {0.0f, 1.0f, 0.0f};
    Mtx mtx;

    mathutil_mtxA_push();
    MTXLookAt(mtx, &cameraPos, &cameraUp, &lbl_802B4ECC.unk58);
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
    sp44 = lbl_802B4ECC.unk58;
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
    u32 texCoordID;  // 80
    u32 unk8;  // 84
    u32 unkC;  // 88

    u32 unk10;  // 8C
    u32 unk14;  // 90

    u32 unk18;  // 94
    u32 unk1C;  // 98
    u32 unk20;  // 9C
    u32 unk24;  // A0
    u32 unk28;
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
                    GXSetTevKColor_cached(0, sp28);
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
                    GXSetTevKColor_cached(1, sp20);
}

static inline void inline_test3(s8 a)
{
    if (lbl_802B4ECC.unk3 != a)
    {
        lbl_802B4ECC.unk3 = a;
        GXSetNumTevStages_cached(a);
    }
}

static inline void inline_test4(s8 b)
{
    if (lbl_802B4ECC.unk4 != b)
    {
        lbl_802B4ECC.unk4 = b;
        GXSetNumTexGens(b);
    }
}

static inline void inline_test5(s8 c)
{
    if (lbl_802B4ECC.unk5 != c)
    {
        lbl_802B4ECC.unk5 = c;
        GXSetNumIndStages(c);
    }
}

#ifdef NONMATCHING
//#if 1
// stack differences
// DOL: 0x8C444
void func_80090524(struct GMAMeshHeader *a, struct UnkStruct31 *b)
{
    struct UnkStruct32 sp7C;  // correct
    GXColor sp78;  // correct
    s32 r23;
    s32 r22;
    s32 r21;
    s32 r14;
    s32 r15_;
    s32 r16_;

    sp7C.tevStage = GX_TEVSTAGE0;  // 7C
    sp7C.texCoordID = 0;  // 80
    sp7C.unk8 = 0x1E;  // 84
    sp7C.unkC = 0;  // 88
    sp7C.unk10 = 0;  // 8C
    r21 = 0;
    sp7C.unk14 = 0x40;  // 0x90
    r14 = 0;
    sp7C.unk18 = 0;  // 94
    sp7C.unk1C = 1;  // 98
    sp7C.unk20 = 0;  // 9C

    sp7C.unkC = 1;  // 88
    sp7C.unk8 = 0x24;  // 84
    sp7C.unk14 = 0x49;  // 90
    sp7C.unk18 = 4;  // 94

    if (lbl_802B4ECC.unk18.r != a->unkC.asColor.r
     || lbl_802B4ECC.unk18.g != a->unkC.asColor.g
     || lbl_802B4ECC.unk18.b != a->unkC.asColor.b)
    {
        lbl_802B4ECC.unk50 = 0;
        lbl_802B4ECC.unk54 = 0;
        lbl_802B4ECC.unk18.r = a->unkC.asColor.r;
        lbl_802B4ECC.unk18.g = a->unkC.asColor.g;
        lbl_802B4ECC.unk18.b = a->unkC.asColor.b;
    }
    //lbl_800905F8
    if ((a->renderFlags & 1) == 0)
    {
        GXColor color_r5;
        int r0 = 0;
        if (a->renderFlags & 0x88)
        {
            sp78.r = a->unk4.r;
            sp78.g = a->unk4.g;
            sp78.b = a->unk4.b;
        }
        else
        {
            sp78.r = 255;
            sp78.g = 255;
            sp78.b = 255;
        }
        //lbl_80090644
        sp78.a = a->unk11;
        if (lbl_802B4ECC.unk10.r != sp78.r
         || lbl_802B4ECC.unk10.g != sp78.g
         || lbl_802B4ECC.unk10.b != sp78.b
         || lbl_802B4ECC.unk10.a != sp78.a)
        {
            r0 = 1;
            lbl_802B4ECC.unk10 = sp78;
        }
        //lbl_8009069C
        if (a->renderFlags & 8)
        {
            color_r5.r = a->unk8.r;
            color_r5.g = a->unk8.g;
            color_r5.b = a->unk8.b;
        }
        else
        {
            color_r5.r = 255;
            color_r5.g = 255;
            color_r5.b = 255;
        }
        //lbl_800906C8
        if (lbl_802B4ECC.unk14.r != color_r5.r
         || lbl_802B4ECC.unk14.g != color_r5.g
         || lbl_802B4ECC.unk14.b != color_r5.b)
        {
            r0 = 1;
            lbl_802B4ECC.unk14.r = color_r5.r;
            lbl_802B4ECC.unk14.g = color_r5.g;
            lbl_802B4ECC.unk14.b = color_r5.b;
        }
        //lbl_8009070C
        if (r0)
            func_8008D6D4(a);
    }
    //lbl_8009071C
    r23 = 10;
    r22 = 5;
    if (a->renderFlags & 1)
    {
        if (a->renderFlags & 0x100)
        {
            if (lbl_802B4ECC.unk2 != 2)
            {
                lbl_802B4ECC.unk2 = 2;
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
            lbl_802B4ECC.unk2 = 1;
            if (a->renderFlags & 0x88)
            {
                sp78.r = a->unk4.r;
                sp78.g = a->unk4.g;
                sp78.b = a->unk4.b;
            }
            else
            {
                sp78.r = 255;
                sp78.g = 255;
                sp78.b = 255;
            }
            //lbl_800907C0
            sp78.a = (float)a->unk11 * lbl_802F20DC;
            //sp38 = sp78;
            GXSetTevColor(1, sp78);
            r23 = 2;
            r22 = 1;
            //to lbl_800908D4
        }
    }
    //lbl_80090814
    else
    {
        if (a->renderFlags & 0x100)
        {
            if (lbl_802B4ECC.unk2 != 4)
            {
                lbl_802B4ECC.unk2 = 4;
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
                    lbl_802F20E0,  // light_mask
                    GX_DF_CLAMP,  // diff_fn
                    GX_AF_SPOT);  // attn_fn
            }
            //to lbl_800908D4
        }
        //lbl_8009087C
        else
        {
            if (lbl_802B4ECC.unk2 != 3)
            {
                lbl_802B4ECC.unk2 = 3;
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
                    lbl_802F20E0,  // light_mask
                    GX_DF_CLAMP,  // diff_fn
                    GX_AF_SPOT);  // attn_fn
            }
        }
    }
    //lbl_800908D4

    if (lbl_802F211C != 0)
    {
        if (a->renderFlags & 4)
            GXSetFog_cached(0, 0.0f, 100.0f, 0.1f, 20000.0f, lbl_802F2124);
        else
            GXSetFog_cached(lbl_802F2120, lbl_802F2128, lbl_802F212C, 0.1f, 20000.0f, lbl_802F2124);
    }
    //lbl_8009093C
    if (lbl_802B4ECC.unk1C != r23)
    {
        lbl_802B4ECC.unk1C = r23;
        r21 = 1;
    }
    if (lbl_802B4ECC.unk20 != r22)
    {
        lbl_802B4ECC.unk20 = r22;
        r14 = 1;
    }
    if (a->renderFlags & 0x80)
    {
        if (lbl_802B4ECC.unk1 != 0 || r21 != 0 || r14 != 0)
        {
            GXSetTevOrder_cached(sp7C.tevStage, 0xFF, 0xFF, 4);
            GXSetTevColorIn_cached(sp7C.tevStage, 15, 15, 15, r23);
            GXSetTevColorOp_cached(sp7C.tevStage, 0, 0, 0, 1, 0);
            GXSetTevAlphaIn_cached(sp7C.tevStage, 7, 7, 7, r22);
            GXSetTevAlphaOp_cached(sp7C.tevStage, 0, 0, 0, 1, 0);
        }
        //lbl_80090A1C
        else
        {
            if (r21 != 0)
            {
                if (r21 != 0)
                    GXSetTevColorIn_cached(sp7C.tevStage, 15, 15, 15, r23);
                //lbl_80090A40
                if (r14 != 0)
                    GXSetTevAlphaIn_cached(sp7C.tevStage, 7, 7, 7, r22);
            }
        }
        //lbl_80090A60
        lbl_802B4ECC.unk2C[0] = -1;
        sp7C.tevStage++;
        //to lbl_80091020
    }
    //lbl_80090A78
    else
    {
        s32 r20 = a->unk12;
        s32 r19 = 4;
        // loop:
        // r18 = &a->unk16
        // r17 = &lbl_802B4ECC.unk2C
        // r15 = &lbl_802B4ECC.unk3C
        // r24 = &lbl_802B4ECC.unk54 doesn't change
        // r14 = &sp2C doesn't change
        // r25 = &lbl_802B4ECC.unk50  doesn't change
        // maybe indexed instead?
        u16 *r18 = &a->unk16;
        u32 *r17 = lbl_802B4ECC.unk2C;
        u32 r16;
        u16 *r15 = lbl_802B4ECC.unk3C;
        while (r20 > 0)
        {
            struct UnkStruct31 *r3 = &b[*r18];
            r16 = r3->unk0;
            r16 &= 0xA003;
            if (*r17 != r16)
                break;
            if (*r15 != *r18 || (r3->unk0 & 0x10000))
            {
                GXLoadTexObj_cached(r3->unk8, sp7C.unkC);
                *r15 = *r18;
            }
            //lbl_80090B00
            if (r16 == 0)
            {
                if (r21 != 0)
                {
                    func_80091500(&sp7C, r23, r22);
                    r21 = 0;
                }
                func_80091564(&sp7C);
                //to lbl_80090D3C
            }
            //lbl_80090B30
            else if (r16 & 0x2000)
            {
                if (r21 != 0)
                {
                    func_8009167C(&sp7C, r23, r22);
                    r21 = 0;
                }
                func_800916E0(&sp7C);
                //to lbl_80090D3C
            }
            else if (r16 & 0x2)
            {
                if (r21 != 0)
                {
                    func_80091CA8(&sp7C, r23, r22);
                    r21 = 0;
                }
                func_80091D0C(&sp7C);
                //to lbl_80090D3C
            }
            //lbl_80090B98
            else if (r16 & 1)
            {
                if (lbl_802B4ECC.unk50 == 0)
                {
                    /*
                    GXColor sp28 = lbl_802B4ECC.unk18;
                    if (sp28.r != 0 || sp28.g != 0 || sp28.b != 0)
                    {
                        sp28.r = 255;
                        sp28.g = 255;
                        sp28.b = 255;
                    }
                    //lbl_80090BEC
                    GXSetTevKColor_cached(0, sp28);
                    lbl_802B4ECC.unk50 = 1;
                    */
                    // 40 -> 44 (lbl_802B4ECC.unk18 temp)
                    // r14 44 -> 28 (arg to GXSetTevKColor_cached)
                    inline_test1(lbl_802B4ECC.unk18);
                    lbl_802B4ECC.unk50 = 1;
                }
                //lbl_80090C08
                if (r21 != 0)
                {
                    func_80091878(&sp7C, r23, r22);
                    r21 = 0;
                }
                func_800918DC(&sp7C);
                //to lbl_80090D3C
            }
            //lbl_80090C30
            else
            {
                if (lbl_802B4ECC.unk54 == 0)
                {
                    /*
                    GXColor sp20 = lbl_802B4ECC.unk18;
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
                    lbl_802B4ECC.unk54 = 1;
                    */
                    // 32 -> 40 (lbl_802B4ECC.unk18 temp)
                    // r27 36 -> 24 (arg to GXSetTevKColor_cached)
                    inline_test2(lbl_802B4ECC.unk18);
                    lbl_802B4ECC.unk54 = 1;
                }
                //lbl_80090D18
                if (r21 != 0)
                {
                    func_80091B1C(&sp7C, r23, r22);
                    r21 = 0;
                }
                func_80091B88(&sp7C);
            }
            //lbl_80090D3C
            sp7C.unkC++;
            r19++;
            r20--;
            r18++;
            r17++;
            r15++;
            r23 = 0;
            r22 = 0;
        }
        //lbl_80090D70
        while (r20 > 0)
        {
            struct UnkStruct31 *r3 = &b[*r18];  // r4
            u32 r16 = r3->unk0;  // actually, r27
            r16 &= 0xA003;
            *r17 = r16;
            if (*r15 != *r18 || (r3->unk0 & 0x10000))
            {
                GXLoadTexObj_cached(r3->unk8, sp7C.unkC);
                *r15 = *r18;
            }
            if (r16 == 0)
            {
                func_80091404(&sp7C, r23, r22, r19);
                func_80091564(&sp7C);
            }
            else if (r16 & 0x2000)
            {
                func_80091580(&sp7C, r23, r22, r19);
                func_800916E0(&sp7C);
            }
            else if (r16 & 0x2000)  // same thing
            {
                func_80091BA4(&sp7C, r23, r22, r19);
                func_80091D0C(&sp7C);
            }
            //lbl_80090E54
            else if (r16 & 1)
            {
                if (lbl_802B4ECC.unk50 == 0)
                {
                    /*
                    GXColor sp28 = lbl_802B4ECC.unk18;
                    if (sp28.r != 0 || sp28.g != 0 || sp28.b != 0)
                    {
                        sp28.r = 255;
                        sp28.g = 255;
                        sp28.b = 255;
                    }
                    GXSetTevKColor_cached(0, sp28);
                    lbl_802B4ECC.unk50 = 1;
                    */
                    // 24 -> 36 (lbl_802B4ECC.unk18 temp)
                    // 28 -> 20 (arg to GXSetTevKColor_cached)
                    inline_test1(lbl_802B4ECC.unk18);
                    lbl_802B4ECC.unk50 = 1;
                }
                func_800916FC(&sp7C, r23, r22, r19);
                func_800918DC(&sp7C);
            }
            else
            {
                if (lbl_802B4ECC.unk54 == 0)
                {
                    /*
                    GXColor sp20 = lbl_802B4ECC.unk18;
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
                    lbl_802B4ECC.unk54 = 1;
                    */
                    // 16 -> 32 (lbl_802B4ECC.unk18 temp)
                    // r21 20 -> 16 (arg to GXSetTevKColor_cached)
                    inline_test2(lbl_802B4ECC.unk18);
                    lbl_802B4ECC.unk54 = 1;
                }
                func_800918F8(&sp7C, r23, r22, r19);
                func_80091B88(&sp7C);
            }
            sp7C.unkC++;
            r19++;
            r20--;
            r18++;
            r17++;
            r15++;
            r23 = 0;
            r22 = 0;
        }
        *r17 = -1;
    }
    //lbl_80091020
    if (lbl_802F20EC != NULL)
    {
        struct UnkStruct33 sp3C;
        sp3C.unk0 = lbl_802B4ECC.unk0;
        sp3C.unk4 = a;
        sp3C.unk8 = b;
        sp3C.unkC = sp7C;
        lbl_802F20EC((void *)&sp3C);
        sp7C = sp3C.unkC;
    }
    //lbl_800910F8
    if (lbl_802F210C != 0)
    {
        if (lbl_802B4ECC.unk8 != sp7C.tevStage)
        {
            lbl_802B4ECC.unk8 = sp7C.tevStage;
            func_8009127C(sp7C.tevStage);
        }
        sp7C.tevStage++;
    }
    //lbl_8009112C
    if (lbl_802F2114 != 0)
    {
        if (lbl_802B4ECC.unkC != sp7C.tevStage)
        {
            lbl_802B4ECC.unk8 = sp7C.tevStage;
            func_80091340(sp7C.tevStage);
        }
        sp7C.tevStage++;
    }
    //lbl_8009115C
    GXSetNumChans(1);
    inline_test3(sp7C.tevStage);
    inline_test4(sp7C.texCoordID);
    inline_test5(sp7C.unk10);
    //lbl_800911D0
    r15_ = 4;
    r16_ = 5;
    if (a->renderFlags & 0x20)
        r15_ = a->unk40 & 0xF;
    if (a->renderFlags & 0x40)
        r16_ = (a->unk40 >> 4) & 0xF;
    if (lbl_802B4ECC.unk24 != r15_ || lbl_802B4ECC.unk28 != r16_)
    {
        GXSetBlendMode_cached(1, r15_, r16_, 0);
        lbl_802B4ECC.unk24 = r15_;
        lbl_802B4ECC.unk28 = r16_;
    }
    //lbl_8009123C
    lbl_802B4ECC.unk0 = 0;
    if (a->renderFlags & 0x80)
        lbl_802B4ECC.unk1 = 0;
    else
        lbl_802B4ECC.unk1 = a->unk12;
}
#else
asm void func_80090524(struct GMAMeshHeader *a, struct UnkStruct31 *b)
{
#define _SDA_BASE_ 0
#define _SDA2_BASE_ 0
    nofralloc
#include "../asm/nonmatchings/func_80090524.s"
}
#endif

void func_8009127C(GXTevStageID tevStage)
{
    GXSetTevKColorSel_cached(tevStage, 14);
    GXSetTevKAlphaSel_cached(tevStage, 30);
    GXSetTevDirect(tevStage);
    GXSetTevOrder_cached(tevStage, 0xFF, 0xFF, 4);
    GXSetTevColorIn_cached(tevStage, 15, 0, 14, 15);
    GXSetTevColorOp_cached(tevStage, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(tevStage, 7, 0, 6, 7);
    GXSetTevAlphaOp_cached(tevStage, 0, 0, 0, 1, 0);
}

void func_80091340(GXTevStageID tevStage)
{
    GXSetTevKColorSel_cached(tevStage, 15);
    GXSetTevKAlphaSel_cached(tevStage, 31);
    GXSetTevDirect(tevStage);
    GXSetTevOrder_cached(tevStage, 0xFF, 0xFF, 4);
    GXSetTevColorIn_cached(tevStage, 0, 15, 15, 14);
    GXSetTevColorOp_cached(tevStage, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(tevStage, 0, 7, 7, 6);
    GXSetTevAlphaOp_cached(tevStage, 0, 0, 0, 1, 0);
}

void func_80091404(struct UnkStruct32 *a, u32 b, u32 c, u32 texGenSrc)
{
    GXSetTevDirect(a->tevStage);
    GXSetTevSwapMode_cached(a->tevStage, 0, 0);
    GXSetTexCoordGen(a->texCoordID, GX_TG_MTX2x4, texGenSrc, GX_TEXMTX1);
    GXSetTevOrder_cached(a->tevStage, a->texCoordID, a->unkC, 4);
    GXSetTevColorIn_cached(a->tevStage, 15, 8, b, 15);
    GXSetTevColorOp_cached(a->tevStage, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(a->tevStage, 7, 4, c, 7);
    GXSetTevAlphaOp_cached(a->tevStage, 0, 0, 0, 1, 0);
}

void func_80091500(struct UnkStruct32 *a, u32 b, u32 c)
{
    GXSetTevColorIn_cached(a->tevStage, 15, 8, b, 15);
    GXSetTevAlphaIn_cached(a->tevStage, 7, 4, c, 7);
}

void func_80091564(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->texCoordID++;
}

void func_80091580(struct UnkStruct32 *a, u32 b, u32 c, u32 texGenSrc)
{
    GXSetTevDirect(a->tevStage);
    GXSetTexCoordGen(a->texCoordID, GX_TG_MTX2x4, texGenSrc, GX_TEXMTX1);
    GXSetTevOrder_cached(a->tevStage, a->texCoordID, a->unkC, 4);
    GXSetTevSwapMode_cached(a->tevStage, 0, 1);
    GXSetTevColorIn_cached(a->tevStage, 15, 15, 15, b);
    GXSetTevColorOp_cached(a->tevStage, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(a->tevStage, 7, 4, c, 7);
    GXSetTevAlphaOp_cached(a->tevStage, 0, 0, 0, 1, 0);
}

void func_8009167C(struct UnkStruct32 *a, u32 b, u32 c)
{
    GXSetTevColorIn_cached(a->tevStage, 15, 15, 15, b);
    GXSetTevAlphaIn_cached(a->tevStage, 7, 4, c, 7);
}

// duplicate of func_80091564
void func_800916E0(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->texCoordID++;
}

void func_800916FC(struct UnkStruct32 *a, u32 b, u32 c, u32 d)
{
    GXSetTevDirect(a->tevStage);
    GXSetTevSwapMode_cached(a->tevStage, 0, 0);
    if (lbl_802B4ECC.unk44 == 0)
    {
        mathutil_mtxA_push();
        mathutilData->mtxA[0][3] = 0.0f;
        mathutilData->mtxA[1][3] = 0.0f;
        mathutilData->mtxA[2][3] = 0.0f;
        GXLoadTexMtxImm(mathutilData->mtxA, GX_TEXMTX0, GX_MTX3x4);
        mathutil_mtxA_pop();
        lbl_802B4ECC.unk44 = 1;
    }
    if (lbl_802B4ECC.unk48 == 0)
    {
        g_compute_texmtx0();
        lbl_802B4ECC.unk48 = 1;
    }
    GXSetTevKColorSel_cached(a->tevStage, 12);
    GXSetTexCoordGen2(a->texCoordID, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX0);
    GXSetTevOrder_cached(a->tevStage, a->texCoordID, a->unkC, 4);
    GXSetTevColorIn_cached(a->tevStage, 15, 8, 14, b);
    GXSetTevColorOp_cached(a->tevStage, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(a->tevStage, 7, 7, 7, c);
    GXSetTevAlphaOp_cached(a->tevStage, 0, 0, 0, 1, 0);
}

void func_80091878(struct UnkStruct32 *a, u32 b, u32 c)
{
    GXSetTevColorIn_cached(a->tevStage, 15, 8, 14, b);
    GXSetTevAlphaIn_cached(a->tevStage, 7, 7, 7, c);
}

// duplicate of func_80091564
void func_800918DC(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->texCoordID++;
}

void func_800918F8(struct UnkStruct32 *a, u32 b, u32 c, u32 d)
{
    u32 tevStage;

    if (lbl_802B4ECC.unk44 == 0)
    {
        mathutil_mtxA_push();
        mathutilData->mtxA[0][3] = 0.0f;
        mathutilData->mtxA[1][3] = 0.0f;
        mathutilData->mtxA[2][3] = 0.0f;
        GXLoadTexMtxImm(mathutilData->mtxA, GX_TEXMTX0, GX_MTX3x4);
        mathutil_mtxA_pop();
        lbl_802B4ECC.unk44 = 1;
    }
    if (lbl_802B4ECC.unk4C == 0)
    {
        GXLoadTexObj_cached(&unknownTexObj, 0);
        g_compute_texmtx1and2();
        lbl_802B4ECC.unk4C = 1;
    }
    // unrolled loop?
    tevStage = a->tevStage;

    GXSetTevDirect(tevStage);
    GXSetTevSwapMode_cached(a->tevStage, 0, 0);
    GXSetTevKColorSel_cached(tevStage, 13);
    GXSetTexCoordGen2(a->texCoordID, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX2);
    GXSetTevOrder_cached(tevStage, a->texCoordID, 0, 4);
    GXSetTevColorIn_cached(tevStage, 15, 8, 14, 15);
    GXSetTevColorOp_cached(tevStage, 0, 0, 0, 1, 3);
    GXSetTevAlphaIn_cached(tevStage, 7, 7, 7, c);
    GXSetTevAlphaOp_cached(tevStage, 0, 0, 0, 1, 3);

    GXSetTevDirect(tevStage + 1);
    GXSetTevSwapMode_cached(a->tevStage, 0, 0);
    GXSetTexCoordGen2(a->texCoordID + 1, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX1);
    GXSetTevOrder_cached(tevStage + 1, a->texCoordID + 1, a->unkC, 4);
    GXSetTevColorIn_cached(tevStage + 1, 15, 8, 6, b);
    GXSetTevColorOp_cached(tevStage + 1, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(tevStage + 1, 7, 7, 7, c);
    GXSetTevAlphaOp_cached(tevStage + 1, 0, 0, 0, 1, 0);
}

void func_80091B1C(struct UnkStruct32 *a, u32 b, u32 c)
{
    GXSetTevColorIn_cached(a->tevStage + 1, 15, 8, 6, b);
    GXSetTevAlphaIn_cached(a->tevStage + 1, 7, 7, 7, c);
}

void func_80091B88(struct UnkStruct32 *a)
{
    a->tevStage += 2;
    a->texCoordID += 2;
}

void func_80091BA4(struct UnkStruct32 *a, u32 b, u32 c, u32 texGenSrc)
{
    GXSetTevDirect(a->tevStage);
    GXSetTexCoordGen(a->texCoordID, GX_TG_MTX2x4, texGenSrc, GX_TEXMTX1);
    GXSetTevOrder_cached(a->tevStage, a->texCoordID, a->unkC, 4);
    GXSetTevColorIn_cached(a->tevStage, 15, 15, 15, b);
    GXSetTevColorOp_cached(a->tevStage, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(a->tevStage, 7, 7, 7, c);
    GXSetTevAlphaOp_cached(a->tevStage, 0, 0, 0, 1, 0);
    a->unk20 = 1;
    a->unk24 = a->texCoordID;
    a->unk28 = a->unkC;
}

void func_80091CA8(struct UnkStruct32 *a, u32 b, u32 c)
{
    GXSetTevColorIn_cached(a->tevStage, 15, 15, 15, b);
    GXSetTevAlphaIn_cached(a->tevStage, 7, 7, 7, c);
}

// duplicate of func_80091564
void func_80091D0C(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->texCoordID++;
}
