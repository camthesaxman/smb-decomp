#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"

#include "load.h"

struct GMAMeshHeader
{
    u32 unk0;
    GXColor unk4;
    GXColor unk8;
    u32 unkC;
    u8 filler10[2];
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 filler15[0x1C-0x15];
    u32 unk1C;
    u8 unk20[8];
    u32 dispListSizes[2];
    u8 unk30[0x60-0x30];
    u8 unk60[1];
};

struct GMAMaterial
{
    u32 flags;
    u16 unk4;
    s8 unk6;
    u8 unk7;
    GXTexObj *texObj;
    u8 fillerC[0x20-0xC];
};

struct GMAModelHeader
{
    u8 filler0[4];
    u32 flags;
    Vec unk8;
    float unk14;
    /*0x18*/ u16 numMaterials;
    /*0x1A*/ u16 numLayer1Meshes;
    /*0x1C*/ u16 numLayer2Meshes;
    u8 unk1E;
    u8 filler1F[1];
    u32 headerSize;
    GXTexObj *texObjs;
    u8 unk28[10];
};

struct GMAModelEntry
{
    struct GMAModelHeader *modelOffset;  // pointer to GMAModelHeader
    char *name;
};

struct UnkStruct1
{
    u32 unk0;
    char *unk4;
};

struct TPLTextureHeader
{
    u32 format;
    u32 imageOffset;
    u16 width;
    u16 height;
    u8 fillerC[4];
};  // size = 0x10

struct TPL
{
    u32 numTextures;
    struct TPLTextureHeader *texHeaders;
    u8 *fileData;
};

struct GMA
{
    u32 numModels;
    u8 *modelsBase;
    struct GMAModelEntry *modelEntries;
    char *namesBase;
    u8 filler10[0x20-0x10];
    struct UnkStruct1 unk20;
};

struct UnkStruct4
{
    u8 filler0[0x18];
    u16 unk18;
    u8 unk1A[4];
    u8 unk1E;
    u8 filler1F[0x40-0x1F];
    u8 unk40[100];  // What type is this?
};

typedef u32 (*Func802F20F0)();
typedef void (*Func802F20EC)();

struct UnkStruct17
{
    u8 filler0[4];
    void (*unk4)(struct UnkStruct17 *);
    void *unk8;
    Mtx unkC;
    void *unk3C;
    struct GMAMeshHeader *unk40;
    u32 unk44;
    u32 unk48;
    float unk4C;
    Func802F20EC unk50;
    Func802F20F0 unk54;
    u8 unk58;
    u8 unk59;
    u32 unk5C;
    u8 unk60;
    u8 unk61;
    u8 unk62;
    Mtx *unk64;
    GXColor unk68;
    GXColor unk6C;
    u32 unk70;
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
Func802F20EC lbl_802F20EC;
s32 lbl_802F20E8;
float lbl_802F20E4;
u32 lbl_802F20E0;
float lbl_802F20DC;
float lbl_802F20D8;
float lbl_802F20D4;
float lbl_802F20D0;
Mtx *lbl_802F20CC;
Mtx **avdispMatrixList;

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
static u8 lzHeaderBuf[32];
static u8 unknownTexImg[64];

FORCE_BSS_ORDER(lbl_802B4E60)
FORCE_BSS_ORDER(lbl_802B4E6C)
FORCE_BSS_ORDER(lbl_802B4E9C)
FORCE_BSS_ORDER(lbl_802B4ECC)
FORCE_BSS_ORDER(unknownTexObj)
FORCE_BSS_ORDER(filler_802B4F50)
FORCE_BSS_ORDER(lzHeaderBuf)
FORCE_BSS_ORDER(unknownTexImg)

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

asm void func_8008D6D4(register void *arg)
{
    nofralloc
#define qr0 0
#define qr2 2
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

void func_8008D788(void)
{
    Vec sp8;
    lbl_802F20EC = NULL;
    lbl_802F20D8 = 1.0f;
    lbl_802F20D4 = 1.0f;
    lbl_802F20D0 = 1.0f;
    lbl_802F20E4 = 1.0f;
    lbl_802F20DC = 1.0f;
    lbl_802F20E0 = 1;
    lbl_802F20F0 = NULL;
    init_some_texture();
    sp8.x = 0.0f;
    sp8.y = 1.0f;
    sp8.z = 0.0f;
    func_8008E574(&sp8);
    func_8008E5B8(1.0f, 1.0f, 1.0f);
    avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
    lbl_802F2108 = 0;
    mathutil_mtxA_from_translate_xyz(0.0f, 0.0f, 1.0f);
    mathutil_mtxA_to_mtx(lbl_802B4E9C);
    func_8008F714(1.0f, 1.0f, 1.0f, 1.0f);
    func_8008F7C8(0.0f, 0.0f, 0.0f, 0.0f);
    func_8008F878(0);
    func_8008F880(2, 0.0f, 100.0f);
    func_8008F890(0, 0, 0);
}

void func_8008D888(int a)
{
    lbl_802F20CC = OSAlloc(a * sizeof(Mtx));
    avdispMatrixList = OSAlloc(a * sizeof(Mtx *));
}

void func_8008D8D0(struct UnkStruct4 *a, Mtx **dest)
{
    u8 i;
    int unused1;
    int unused2;
    Mtx *pMtx = (void *)((u32)a->unk40 + a->unk18 * 32);

    if (dest == NULL)
    {
        dest = avdispMatrixList;
        for (i = 0; i < a->unk1E; i++)
        {
            *dest = pMtx;
            mathutil_mtx_copy(*pMtx, **dest);  // useless copy source and dest are the same
            pMtx++;
            dest++;
        }
    }
    else
    {
        for (i = 0; i < a->unk1E; i++)
        {
            mathutil_mtx_copy(*pMtx, **dest);
            pMtx++;
            dest++;
        }
    }
}

struct GMAModelHeader *load_model(char *fileName, struct TPL *tpl)
{
    u32 *buffer;
    u32 size;
    struct File file;
    
    if (!file_open(fileName, &file))
        return NULL;
    size = file_size(&file);
    buffer = OSAlloc(OSRoundUp32B(size));
    if (buffer == NULL)
        OSPanic("avdisp.c", 638, "cannot OSAlloc");
    file_read(&file, buffer, size, 0);
    file_close(&file);
    if (*buffer != (('G' << 24) | ('C' << 16) | ('M' << 8) | 'F'))
    {
        printf("invalid model format <%s>\n", fileName);
        OSFree(buffer);
        return NULL;
    }
    init_model((struct GMAModelHeader *)buffer, tpl, NULL);
    return (struct GMAModelHeader *)buffer;
}

void free_model(struct GMAModelHeader *model)
{
    if (model->texObjs != NULL)
        OSFree(model->texObjs);
    OSFree(model);
}

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
        u32 r27;
        u32 foo;

        if (file_open(fileName, &file) == 0)
            return NULL;
        if (file_read(&file, lzHeaderBuf, 32, 0) < 0)
            OSPanic("avdisp.c", 684, "cannot dvd_read");
        r27 = OSRoundUp32B(__lwbrx(lzHeaderBuf, 0));
        foo = OSRoundUp32B(__lwbrx(lzHeaderBuf, 4));
        gma = OSAlloc(foo + 32);
        if (gma == NULL)
            OSPanic("avdisp.c", 688, "cannot OSAlloc\n");
        lzData = OSAlloc(r27);
        if (lzData == NULL)
            OSPanic("avdisp.c", 689, "cannot OSAlooc\n");
        fileData = (u8 *)&gma->unk20;
        if (file_read(&file, lzData, r27, 0) < 0)
            OSPanic("avdisp.c", 692, "cannot dvd_read");
        if (file_close(&file) != 1)
            OSPanic("avdisp.c", 693, "cannot DVDClose");
        decompress_lz(lzData, fileData);
        OSFree(lzData);
    }
    else
    {
        u32 size;
        if (file_open(fileName, &file) == 0)
            return NULL;
        size = file_size(&file);
        gma = OSAlloc(OSRoundUp32B(size) + 32);
        if (gma == NULL)
            OSPanic("avdisp.c", 702, "cannot OSAlloc");
        fileData = (u8 *)&gma->unk20;
        file_read(&file, fileData, size, 0);
        file_close(&file);
    }

    gma->numModels = *(u32 *)fileData;
    gma->modelsBase = (void *)(fileData + *(u32 *)(fileData + 4));
    gma->modelEntries = (struct GMAModelEntry *)(fileData + 8);
    gma->namesBase = (char *)(gma->modelEntries + *(u32 *)fileData);

    for (i = 0; i < gma->numModels; i++)
    {
        struct GMAModelEntry *entry = &gma->modelEntries[i];
        void *offset = entry->modelOffset;
        if (entry->modelOffset == (void *)0xFFFFFFFF)
        {
            entry->modelOffset = NULL;
            entry->name = invalidModelName;
        }
        else
        {
            offset = gma->modelsBase + (u32)offset;
            entry->modelOffset = offset;
            // convert name offset to pointer
            entry->name = gma->namesBase + (u32)entry->name;
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
    struct GMA *gma = OSAlloc(alignedSize + 32);
    if (gma == NULL)
        OSPanic("avdisp.c", 750, "cannot OSAlloc");
    fileData = (u8 *)&gma->unk20;
    DCInvalidateRange(fileData, alignedSize);
    while (ARGetDMAStatus() != 0)
        ;
    ARStartDMA(ARAM_DIR_ARAM_TO_MRAM, (u32)fileData, aramSrc, size);
    while (ARGetDMAStatus() != 0)
        ;

    gma->numModels = *(u32 *)fileData;
    gma->modelsBase = (void *)(fileData + *(u32 *)(fileData + 4));
    gma->modelEntries = (struct GMAModelEntry *)(fileData + 8);
    gma->namesBase = (char *)(gma->modelEntries + *(u32 *)fileData);

    for (i = 0; i < gma->numModels; i++)
    {
        struct GMAModelEntry *entry = &gma->modelEntries[i];
        void *offset = entry->modelOffset;
        if (entry->modelOffset == (void *)0xFFFFFFFF)
        {
            entry->modelOffset = NULL;
            entry->name = invalidModelName;
        }
        else
        {
            offset = gma->modelsBase + (u32)offset;
            entry->modelOffset = offset;
            // convert name offset to pointer
            entry->name = gma->namesBase + (u32)entry->name;
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
        struct GMAModelHeader *model = (struct GMAModelHeader *)gma->modelEntries[i].modelOffset;
        if (model != NULL && model->texObjs != NULL)
            OSFree(model->texObjs);
    }
    OSFree(gma);
}

struct TPL *load_tpl(char *fileName)
{
    void *r30;
    struct TPL *tpl;
    u8 *fileData;
    struct File file;
    int len = strlen(fileName);
    if (len >= 3 && strncmp(fileName + (len - 3), ".lz", 3) == 0)
    {
        u32 r28;
        u32 foo;

        if (file_open(fileName, &file) == 0)
            return NULL;
        if (file_read(&file, lzHeaderBuf, 32, 0) < 0)
            OSPanic("avdisp.c", 822, "cannot dvd_read");
        r28 = OSRoundUp32B(__lwbrx(lzHeaderBuf, 0));
        foo = OSRoundUp32B(__lwbrx(lzHeaderBuf, 4));
        tpl = OSAlloc(foo + 12);
        if (tpl == NULL)
            OSPanic("avdisp.c", 826, "cannot OSAlloc\n");
        r30 = OSAlloc(r28);
        if (r30 == NULL)
            OSPanic("avdisp.c", 827, "cannot OSAlooc\n");
        fileData = (void *)OSRoundUp32B((u32)tpl + 12);
        if (file_read(&file, r30, r28, 0) < 0)
            OSPanic("avdisp.c", 830, "cannot dvd_read");
        if (file_close(&file) != 1)
            OSPanic("avdisp.c", 831, "cannot DVDClose");
        decompress_lz(r30, fileData);
        OSFree(r30);
    }
    else
    {
        u32 size;
        if (file_open(fileName, &file) == 0)
            return NULL;
        size = file_size(&file);
        tpl = OSAlloc(OSRoundUp32B(size) + 32);
        if (tpl == NULL)
            OSPanic("avdisp.c", 840, "cannot OSAlloc");
        fileData = (void *)OSRoundUp32B((u32)tpl + 12);
        file_read(&file, fileData, size, 0);
        file_close(&file);
    }
    tpl->numTextures = *(u32 *)fileData;
    tpl->texHeaders = (struct TPLTextureHeader *)(fileData + 4);
    tpl->fileData = (void *)fileData;
    return tpl;
}

struct TPL *load_tpl_from_aram(u32 aramSrc, u32 size)
{
    u32 r31;
    struct TPL *tpl;
    u8 *fileData;

    r31 = OSRoundUp32B(size);
    tpl = OSAlloc(r31 + 32);
    if (tpl == NULL)
        OSPanic("avdisp.c", 865, "cannot OSAlloc");
    fileData = (void *)OSRoundUp32B((u32)tpl + 12);
    DCInvalidateRange(fileData, r31);
    while (ARGetDMAStatus() != 0)
        ;
    ARStartDMA(ARAM_DIR_ARAM_TO_MRAM, (u32)fileData, aramSrc, size);
    while (ARGetDMAStatus() != 0)
        ;
    tpl->numTextures = *(u32 *)fileData;
    tpl->texHeaders = (struct TPLTextureHeader *)(fileData + 4);
    tpl->fileData = (void *)fileData;
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
            &texObjs[i],  // obj
            (void *)imagePtr,  // image_ptr
            texHdrs[i].width,  // width
            texHdrs[i].height,  // height
            texHdrs[i].format & 0x1F,  // format
            GX_REPEAT,  // wrap_s
            GX_REPEAT,  // wrap_t
            FALSE);  // mipmap
        GXInitTexObjLOD(
            &texObjs[i],  // obj
            (maxLOD != 0) ? GX_LIN_MIP_LIN : GX_LIN_MIP_NEAR,  // min_filt
            GX_LINEAR,  // mag_filt
            0.0f,  // min_lod
            maxLOD,  // max_lod
            0.0f,  // lod_bias
            FALSE,  // bias_clamp
            TRUE,  // do_edge_lod
            GX_ANISO_1);  // max_aniso
    }
    return texObjs;
}

void free_tpl(struct TPL *tpl)
{
    OSFree(tpl);
}

void func_8008E420(float a)
{
    lbl_802F20E4 = a;
}

void func_8008E428(float a, float b, float c)
{
    lbl_802F20D0 = a;
    lbl_802F20D4 = b;
    lbl_802F20D8 = c;
}

void func_8008E438(struct GMAModelHeader *model)
{
    if (func_80020FD0(&model->unk8, model->unk14, lbl_802F20E4) == 0)
    {
        lbl_802F20E4 = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        lbl_802F20DC = 1.0f;
    }
    else
        func_8008E7AC(model);
}

void func_8008E49C(struct GMAModelHeader *model)
{
    if (func_80020FD0(&model->unk8, model->unk14, lbl_802F20E4) == 0)
    {
        lbl_802F20E4 = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        lbl_802F20DC = 1.0f;
    }
    else
        func_8008EA64(model);
}

void func_8008E500(struct GMAModelHeader *model)
{
    if (func_80020FD0(&model->unk8, model->unk14, lbl_802F20E4) == 0)
    {
        lbl_802F20E4 = 1.0f;
        GXSetCurrentMtx(GX_PNMTX0);
        lbl_802F20DC = 1.0f;
    }
    else
        func_8008EB94(model);
}

void func_8008E564(float a)
{
    lbl_802F20DC = a;
}

void func_8008E56C(u32 a)
{
    lbl_802F20E0 = a;
}

void func_8008E574(Vec *a)
{
    lbl_802B4E60 = *a;
    mathutil_vec_normalize_len(&lbl_802B4E60);
}

void func_8008E5B8(float a, float b, float c)
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

Func802F20EC func_8008E5D8(Func802F20EC a)
{
    Func802F20EC temp = lbl_802F20EC;
    lbl_802F20EC = a;
    return temp;
}

Func802F20F0 func_8008E5E8(Func802F20F0 a)
{
    Func802F20F0 temp = lbl_802F20F0;
    lbl_802F20F0 = a;
    return temp;
}

struct UnkStruct12
{
    u8 filler0[8];
    u32 unk8;
};

void *func_8008E5F8(struct GMAModelHeader *model)
{
    struct UnkStruct12 *r3 = (struct UnkStruct12 *)((u8 *)model + model->headerSize);
    if (model->flags & 0x18)
        return (u8 *)r3 + r3->unk8;
    else
    {
        printf("non effective model.\n");
        return NULL;
    }
}

void *func_8008E64C(struct GMAModelHeader *model)
{
    if (model->flags & 0x18)
        return (u8 *)model + model->headerSize;
    else
    {
        printf("non effective model.\n");
        return NULL;
    }
}

static inline void *skip_mesh(struct GMAMeshHeader *a);

static inline void *skip_mesh_inlined(struct GMAMeshHeader *a)
{
    u8 *r7 = a->unk60;
    int i;
    for (i = 0; i < 2; i++)
    {
        if (a->unk13 & (1 << i))
            r7 += a->dispListSizes[i];
    }
    if (a->unk13 & 0xC)
    {
        u32 *r4 = (u32 *)r7;
        r7 += 32;
        r7 += r4[2];
        r7 += r4[3];
    }
    return (void *)r7;
}

struct UnkStruct14
{
    u32 unk0;
    u8 filler4[0x60-4];
};

void func_8008E698(struct GMAModelHeader *model, u32 b)
{
    u8 *r5 = ((u8 *)model + model->headerSize);
    if (model->flags & 0x18)
    {
        u32 i;
        struct UnkStruct14 *r6 = (struct UnkStruct14 *)(r5 + 32);
        for (i = 0; i < model->numLayer1Meshes + model->numLayer2Meshes; i++)
            r6[i].unk0 |= b;
    }
    else
    {
        u32 i;
        struct GMAMeshHeader *r11 = (struct GMAMeshHeader *)r5;
        for (i = 0; i < model->numLayer1Meshes + model->numLayer2Meshes; i++)
        {
            r11->unk0 |= b;
#ifdef NONMATCHING
            r11 = skip_mesh(r11);
#else
            r11 = skip_mesh_inlined(r11);
#endif
        }
    }
}

static inline void *func_8008E7AC_inline(struct GMAModelHeader *model, struct GMAMeshHeader *r26, struct GMAMaterial *mtrl)
{
    u32 r28;
    u32 r23 = lbl_802F20E8;
    struct UnkStruct17 *r29 = (void *)func_80085B88(0x74);
    if (r26->unk14 != 0xFF)
        r28 = func_800857A4(r26->unk30, -1);
    else
        r28 = func_80085698(r26->unk30);
    r29->unk4 = lbl_8008F528;
    r29->unk8 = model;
    r29->unk40 = r26;
    r29->unk3C = mtrl;
    r29->unk44 = r23;
    r29->unk48 = func_800223D0();
    r29->unk4C = lbl_802F20DC;
    r29->unk50 = lbl_802F20EC;
    r29->unk54 = lbl_802F20F0;
    r29->unk58 = zModeCompareEnable;
    r29->unk59 = zModeUpdateEnable;
    r29->unk5C = zModeCompareFunc;
    r29->unk60 = lbl_802F2108;
    r29->unk61 = lbl_802F210C;
    r29->unk62 = lbl_802F2114;
    if (r29->unk60 != 0)
    {
        r29->unk64 = (void *)func_80085B88(0x30);
        mathutil_mtx_copy(lbl_802B4E6C, *r29->unk64);
    }
    if (r29->unk61 != 0)
        r29->unk68 = lbl_802F2110;
    if (r29->unk62 != 0)
        r29->unk6C = lbl_802F2118;
    r29->unk70 = lbl_802F211C;
    mathutil_mtxA_to_mtx(r29->unkC);
    func_80085B78(r28, r29);
    return (void *)skip_mesh(r26);
}

void func_8008E7AC(struct GMAModelHeader *model)
{
    struct GMAMeshHeader *r26 = (struct GMAMeshHeader *)((u8 *)model + model->headerSize);
    struct GMAMaterial *mtrl = (void *)((u8 *)model + 0x40);
    int i;

    lbl_802F20E8 = 2;
    func_8009E094(lbl_802F20E8);
    if (model->flags & 4)
        func_8008F498(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, (void *)r26);
    //lbl_8008E80C
    if (model->flags & 0x18)
        draw_model_0x18(model, r26, mtrl);
    else
    {
    
        for (i = 0; i < model->numLayer1Meshes; i++)
            r26 = (void *)draw_model_8008F914(model, r26, mtrl);
        for (i = 0; i < model->numLayer2Meshes; i++)
            r26 = func_8008E7AC_inline(model, r26, mtrl);
    }
    //lbl_8008E9B4
    lbl_802F20E4 = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    lbl_802F20DC = 1.0f;
}

static inline void *skip_mesh(struct GMAMeshHeader *a)
{
    u8 *r7 = a->unk60;
    int i;
    for (i = 0; i < 2; i++)
    {
        if (a->unk13 & (1 << i))
            r7 += a->dispListSizes[i];
    }
    if (a->unk13 & 0xC)
    {
        u32 *r4 = (u32 *)r7;
        r7 += 32;
        r7 += r4[2];
        r7 += r4[3];
    }
    return (void *)r7;
}

void func_8008EA64(struct GMAModelHeader *model)
{
    int i;
    void *mesh = (u8 *)model + model->headerSize;
    struct GMAMaterial *mtrl = (struct GMAMaterial *)((u8 *)model + 0x40);
    lbl_802F20E8 = 2;
    func_8009E094(lbl_802F20E8);
    if (model->flags & 0x4)
        func_8008F498(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, mesh);
    if (model->flags & 0x18)
        draw_model_0x18(model, mesh, mtrl);
    else
    {
        for (i = 0; i < model->numLayer1Meshes; i++)
            mesh = (void *)draw_model_8008F914(model, mesh, mtrl);
        for (i = 0; i < model->numLayer2Meshes; i++)
            mesh = (void *)draw_model_8008F914(model, mesh, mtrl);
    }
    lbl_802F20E4 = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    lbl_802F20DC = 1.0f;
}

void func_8008EB94(struct GMAModelHeader *model)
{
    struct GMAMeshHeader *r24 = (struct GMAMeshHeader *)((u32)model + model->headerSize);
    struct GMAMaterial *mtrl = (struct GMAMaterial *)((u8 *)model + 0x40);
    int i;
    lbl_802F20E8 = 2;
    func_8009E094(lbl_802F20E8);
    if (model->flags & 0x4)
        func_8008F498(model);
    if (lbl_802F20F0 == NULL)
        func_8008FE44(model, (void *)r24);
    for (i = 0; i < model->numLayer1Meshes; i++)
        r24 = (void *)func_8008E7AC_inline(model, r24, mtrl);
    for (i = 0; i < model->numLayer2Meshes; i++)
        r24 = (void *)func_8008E7AC_inline(model, r24, mtrl);
    lbl_802F20E4 = 1.0f;
    GXSetCurrentMtx(GX_PNMTX0);
    lbl_802F20DC = 1.0f;
}

void func_8008EEC0(struct GMAModelHeader *model)
{
    struct GMAMeshHeader *r31 = (struct GMAMeshHeader *)((u32)model + model->headerSize);
    struct GMAMaterial *mtrl = (struct GMAMaterial *)((u8 *)model + 0x40);
    int i;
    lbl_802F20E8 = 2;
    if (model->flags & 0x4)
        func_8008F498(model);
    if (model->flags & 0x18)
        draw_model_0x18(model, r31, mtrl);
    else
    {
        for (i = 0; i < model->numLayer1Meshes; i++)
            r31 = (void *)draw_model_8008F914(model, r31, mtrl);
    }
    lbl_802F20E4 = 1.0f;
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

static struct GMAMeshHeader *func_8008F1E8_inline(struct GMAMeshHeader *mesh)
{
    if (mesh->unk1C & 0x800)
        mesh->unk0 |= 0x100;
    if (mesh->unk12 == 0)
        mesh->unk0 |= 0x80;
    return skip_mesh((void *)mesh);
}

void *init_model(struct GMAModelHeader *model, struct TPL *tpl, u8 *c)
{
    struct GMAMaterial *materials;
    struct GMAMeshHeader *mesh;
    int i;

    if (tpl == NULL)
        model->numMaterials = 0;
    materials = (void *)((u32)model + 0x40);
    if (model->numMaterials != 0)
    {
        if (c != NULL)
        {
            model->texObjs = (void *)c;
            c += model->numMaterials * 32;
        }
        else
            model->texObjs = OSAlloc(model->numMaterials * 32);
        if (model->texObjs == NULL)
            OSPanic("avdisp.c", 0x58B, "cannot OSAlloc");
    }
    else
        model->texObjs = NULL;

    for (i = 0; i < model->numMaterials; i++)
    {
        materials[i].texObj = (void *)&model->texObjs[i];
        init_material(&materials[i], &tpl->texHeaders[materials[i].unk4], tpl);
    }
    mesh = (void *)((u32)model + model->headerSize);
    if (model->flags & 0x18)
        mesh = (void *)((u8 *)mesh + 32);
    for (i = 0; i < model->numLayer1Meshes; i++)
    {
        if (tpl == NULL)
            mesh->unk12 = 0;
        if (model->flags & 0x18)
        {
            struct GMAMeshHeader *r3 = mesh;
            //mesh += 3;
            mesh = (void *)((u8 *)mesh + 3 * 32);
            func_8008F1E8_inline(r3);
        }
        else
            mesh = func_8008F1E8_inline(mesh);
    }
    for (i = 0; i < model->numLayer2Meshes; i++)
    {
        if (tpl == NULL)
            mesh->unk12 = 0;
        if (model->flags & 0x18)
        {
            struct GMAMeshHeader *r3 = mesh;
            //mesh += 3;
            mesh = (void *)((u8 *)mesh + 3 * 32);
            func_8008F1E8_inline(r3);
        }
        else
            mesh = func_8008F1E8_inline(mesh);
    }
    return c;
}

void func_8008F498(struct GMAModelHeader *model)
{
    unsigned int i;
    for (i = 0; i < model->unk1E; i++)
        mathutil_mtx_mult(mathutilData->mtxA, *avdispMatrixList[i], lbl_802F20CC[i]);
    func_8008F8A4(model->unk28);
}

void lbl_8008F528(struct UnkStruct17 *a)
{
    Func802F20EC r31;
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
    
    if ((a->unk40->unk0 & 0x1) == 0)
        func_800223D8(a->unk48);
    func_8009AA24(a->unkC, 0);
    mathutil_mtxA_from_mtx(a->unkC);
    func_8009E094(a->unk44);
    lbl_802F20E8 = a->unk44;
    r31 = lbl_802F20EC;
    r30 = lbl_802F20F0;
    r29 = zModeCompareEnable;
    r28 = zModeUpdateEnable;
    r27 = zModeCompareFunc;
    r26 = lbl_802F2108;
    lbl_802F20DC = a->unk4C;
    lbl_802F20EC = a->unk50;
    lbl_802F20F0 = a->unk54;
    zModeCompareEnable = a->unk58;
    zModeUpdateEnable = a->unk59;
    zModeCompareFunc = a->unk5C;
    lbl_802F2108 = a->unk60;
    if (a->unk60 != 0)
        mathutil_mtx_copy(*a->unk64, lbl_802B4E6C);
    r25 = lbl_802F210C;
    lbl_802F210C = a->unk61;
    if (a->unk61 != 0)
    {
        sp10 = lbl_802F2110;
        lbl_802F2110 = a->unk68;
    }
    r23 = lbl_802F2114;
    lbl_802F2114 = a->unk62;
    if (a->unk62 != 0)
    {
        spC = lbl_802F2118;
        lbl_802F2118 = a->unk6C;
    }
    r22 = lbl_802F211C;
    lbl_802F211C = a->unk70;
    if (lbl_802F20F0 == NULL)
        func_8008FE44(a->unk8, (void *)a->unk40);
    draw_model_8008F914(a->unk8, a->unk40, a->unk3C);
    lbl_802F20EC = r31;
    lbl_802F20F0 = r30;
    zModeCompareEnable = r29;
    zModeUpdateEnable = r28;
    zModeCompareFunc = r27;
    lbl_802F2108 = r26;
    lbl_802F210C = r25;
    if (a->unk61 != 0)
        lbl_802F2110 = sp10;
    lbl_802F2114 = r23;
    if (a->unk62 != 0)
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

void func_8008F6E4(int unused, Mtx b)
{
    mathutil_mtx_copy(b, lbl_802B4E6C);
}

void func_8008F714(float a, float b, float c, float d)
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

void func_8008F7C8(float a, float b, float c, float d)
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

void func_8008F878(u32 a)
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

void func_8008F8A4(u8 *a)
{
    int i;
    for (i = 0; i < 8; i++)
    {
        if ((s32)a[i] != 0xFF)
            func_8009AA24(&lbl_802F20CC[a[i]], i + 1);
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
    struct GMAMeshHeader *unk4;
    void *unk8;
    u8 fillerC[0x38-0xC];
};

struct UnkStruct31
{
    u32 unk0;
    u8 filler4[4];
    u32 unk8;
    u8 fillerC[0x20-0xC];
};

static u8 func_8008F914_inline(void *b, void *c)
{
    struct UnkStruct27 sp20;

    if (lbl_802F20F0 != NULL)
    {
        sp20.unk4 = b;
        sp20.unk8 = c;
        return lbl_802F20F0(&sp20);
    }
    else
    {
        func_80090524(b, c);
        return 1;
    }
}

static u8 call_lbl_802F20F0(void *a)
{
    void *dummy = a;
    void *dummy2 = a;
    return lbl_802F20F0(dummy);
}

// Should really be func_8008F914_inline, but different stack usage
static u8 func_8008F914_inline_hack(void *b, void *c)
{
    struct UnkStruct27 sp20;

    if (lbl_802F20F0 != NULL)
    {
        sp20.unk4 = b;
        sp20.unk8 = c;
        return call_lbl_802F20F0(&sp20);
    }
    else
    {
        func_80090524(b, c);
        return 1;
    }
}

u32 draw_model_8008F914(struct GMAModelHeader *model, struct GMAMeshHeader *mesh, struct GMAMaterial *mtrl)
{
    int i;
    u8 *dlist;
    s32 r30;

    if (mesh->unk0 & 2)
        r30 = 0;
    else
        r30 = 1;
    if (model->flags & 4)
        func_8008F8A4(mesh->unk20);  // inlined
    //lbl_8008F998
    func_8009A9B4(mesh->unk1C);
    dlist = mesh->unk60;

    //lbl_8008F9DC
#ifdef NONMATCHING
    if (func_8008F914_inline(mesh, mtrl) != 0)
#else
    if (func_8008F914_inline_hack(mesh, mtrl) != 0)
#endif
    {
        for (i = 0; i < 2; i++)
        {
            if (mesh->unk13 & (1 << i))
            {
                if (lbl_802F20E8 != r30)
                {
                    lbl_802F20E8 = r30;
                    func_8009E094(r30);
                }
                GXCallDisplayList(dlist, mesh->dispListSizes[i]);
                dlist += mesh->dispListSizes[i];
            }
            //lbl_8008FA44
            if (r30 != 0)
                r30 = 2;
        }
        if ((mesh->unk13 & 0xC) != 0)
        {
            struct UnkStruct25 *r26 = (void *)dlist;
            func_8008F8A4(r26->filler0);  // inlined
            dlist = r26->unk20;
            for (i = 0; i < 2; i++)
            {
                if (i == 0)
                    func_8009E094(1);
                else
                    func_8009E094(2);
                GXCallDisplayList(dlist, r26->unk8[i]);
                dlist += r26->unk8[i];
            }
        }
    }
    //lbl_8008FB18
    else
    {
        return (u32)skip_mesh(mesh);  // inlined
    }
    return (u32)dlist;
}

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

struct UnkStruct29
{
    u8 filler0[8];
    u32 unk8;
};

void *draw_mesh_reflection_maybe(struct GMAMeshHeader *mesh, void *b, struct UnkStruct29 *c, u8 *d)
{
    int i;
    int r30;
    u8 *r29 = (u8 *)c + c->unk8;

    if (mesh->unk0 & 2)
        r30 = 0;
    else
        r30 = 2;
    func_8009A9B4(mesh->unk1C);
    if (func_8008F914_inline(mesh, b) != 0)
    {
        __GXSetDirtyState();
        for (i = 0; i < 2; i++)
        {
            if (mesh->unk13 & (1 << i))
            {
                if (lbl_802F20E8 != r30)
                {
                    u32 r3;
                    lbl_802F20E8 = r30;
                    r3 = (gx->unk204 & ~0xC000) | r30 << 14;
                    gx->unk204 = r3;
                    func_8008D6BC(r3);
                }
                func_8008FBB0(mesh->unk1C, r29, d, mesh->dispListSizes[i]);
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
    u8 *r6 = (u8 *)b + b->unkC;
    lbl_802F20E8 = 1;
    for (i = 0; i < model->numLayer1Meshes; i++)
    {
        r6 = draw_mesh_reflection_maybe((void *)r30, mtrl, (void *)b, (void *)r6);
        r30 += 0x60;
    }
    for (i = 0; i < model->numLayer2Meshes; i++)
    {
        r6 = draw_mesh_reflection_maybe((void *)r30, mtrl, (void *)b, r6);
        r30 += 0x60;
    }
}

struct UnkStruct30
{
    u32 unk0;
    GXColor unk4;
    GXColor unk8;
    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 fillerF[0x11-0xF];
    u8 unk11;
    u8 unk12;
    u8 filler13[0x16-0x13];
    u16 unk16;
    u8 filler18[0x40-0x18];
    u32 unk40;
};

void func_8008FE44(struct GMAModelHeader *model, struct UnkStruct30 *b)
{
    lbl_802B4ECC.unk0 = 1;
    if (model->flags & 0x18)
        b = (struct UnkStruct30 *)((u8 *)b + 0x20);
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
        func_8009E398(lbl_802F2120, lbl_802F2124, lbl_802F2128, lbl_802F212C, 0.1f, 20000.0f);
    else
        func_8009E398(0, lbl_802F2124, 0.0f, 100.0f, 0.1f, 20000.0f);
    if (b->unk0 & 0x88)
        lbl_802B4ECC.unk10 = b->unk4;
    else
    {
        lbl_802B4ECC.unk10.r = 255;
        lbl_802B4ECC.unk10.g = 255;
        lbl_802B4ECC.unk10.b = 255;
    }
    lbl_802B4ECC.unk10.a = b->unk11;
    if (b->unk0 & 0x8)
        lbl_802B4ECC.unk14 = b->unk8;
    else
    {
        lbl_802B4ECC.unk14.r = 255;
        lbl_802B4ECC.unk14.g = 255;
        lbl_802B4ECC.unk14.b = 255;
    }
    lbl_802B4ECC.unk14.a = 255;
    func_8008D6D4(b);
    lbl_802B4ECC.unk18.r = b->unkC;
    lbl_802B4ECC.unk18.g = b->unkD;
    lbl_802B4ECC.unk18.b = b->unkE;
    lbl_802B4ECC.unk2 = 0;
    lbl_802B4ECC.unk1C = 15;
    lbl_802B4ECC.unk20 = 7;
    lbl_802B4ECC.unk3 = -1;
    lbl_802B4ECC.unk4 = -1;
    lbl_802B4ECC.unk5 = -1;
    lbl_802B4ECC.unk8 = 16;
    lbl_802B4ECC.unkC = 16;
    if (lbl_802F210C != 0)
        func_8009F33C(2, lbl_802F2110);
    if (lbl_802F2114 != 0)
        func_8009F33C(3, lbl_802F2118);
    lbl_802B4ECC.unk24 = 4;
    lbl_802B4ECC.unk28 = 5;
    if (b->unk0 & 0x20)
        lbl_802B4ECC.unk24 = b->unk40 & 0xF;
    if (b->unk0 & 0x40)
        lbl_802B4ECC.unk28 = (b->unk40 >> 4) & 0xF;
    func_8009E110(1, lbl_802B4ECC.unk24, lbl_802B4ECC.unk28, 0);
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
    mathutil_mtxA_tf_point(&model->unk8, &lbl_802B4ECC.unk58);
    lbl_802B4ECC.unk58.z -= model->unk14;
    mathutil_vec_normalize_len(&lbl_802B4ECC.unk58);
}

void func_8009015C(void)
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

void func_80090268(void)
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
                    func_8009F33C(0, sp28);
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
                    func_8009F33C(1, sp20);
}

static inline void inline_test3(s8 a)
{
    if (lbl_802B4ECC.unk3 != a)
    {
        lbl_802B4ECC.unk3 = a;
        func_8009F2C8(a);
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
void func_80090524(struct UnkStruct30 *a, struct UnkStruct31 *b)
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
    
    if (lbl_802B4ECC.unk18.r != a->unkC
     || lbl_802B4ECC.unk18.g != a->unkD
     || lbl_802B4ECC.unk18.b != a->unkE)
    {
        lbl_802B4ECC.unk50 = 0;
        lbl_802B4ECC.unk54 = 0;
        lbl_802B4ECC.unk18.r = a->unkC;
        lbl_802B4ECC.unk18.g = a->unkD;
        lbl_802B4ECC.unk18.b = a->unkE;
    }
    //lbl_800905F8
    if ((a->unk0 & 1) == 0)
    {
        GXColor color_r5;
        int r0 = 0;
        if (a->unk0 & 0x88)
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
        if (a->unk0 & 8)
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
    if (a->unk0 & 1)
    {
        if (a->unk0 & 0x100)
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
            if (a->unk0 & 0x88)
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
        if (a->unk0 & 0x100)
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
        if (a->unk0 & 4)
            func_8009E398(0, lbl_802F2124, 0.0f, 100.0f, 0.1f, 20000.0f);
        else
            func_8009E398(lbl_802F2120, lbl_802F2124, lbl_802F2128, lbl_802F212C, 0.1f, 20000.0f);
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
    if (a->unk0 & 0x80)
    {
        if (lbl_802B4ECC.unk1 != 0 || r21 != 0 || r14 != 0)
        {
            func_8009EFF4(sp7C.tevStage, 0xFF, 0xFF, 4);
            func_8009E618(sp7C.tevStage, 15, 15, 15, r23);
            func_8009E800(sp7C.tevStage, 0, 0, 0, 1, 0);
            func_8009E70C(sp7C.tevStage, 7, 7, 7, r22);
            func_8009E918(sp7C.tevStage, 0, 0, 0, 1, 0);
        }
        //lbl_80090A1C
        else
        {
            if (r21 != 0)
            {
                if (r21 != 0)
                    func_8009E618(sp7C.tevStage, 15, 15, 15, r23);
                //lbl_80090A40
                if (r14 != 0)
                    func_8009E70C(sp7C.tevStage, 7, 7, 7, r22);
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
                func_8009F430(r3->unk8, sp7C.unkC);
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
                    func_8009F33C(0, sp28);
                    lbl_802B4ECC.unk50 = 1;
                    */
                    // 40 -> 44 (lbl_802B4ECC.unk18 temp)
                    // r14 44 -> 28 (arg to func_8009F33C)
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
                    func_8009F33C(1, sp20);
                    lbl_802B4ECC.unk54 = 1;
                    */
                    // 32 -> 40 (lbl_802B4ECC.unk18 temp)
                    // r27 36 -> 24 (arg to func_8009F33C)
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
                func_8009F430(r3->unk8, sp7C.unkC);
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
                    func_8009F33C(0, sp28);
                    lbl_802B4ECC.unk50 = 1;
                    */
                    // 24 -> 36 (lbl_802B4ECC.unk18 temp)
                    // 28 -> 20 (arg to func_8009F33C)
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
                    func_8009F33C(1, sp20);
                    lbl_802B4ECC.unk54 = 1;
                    */
                    // 16 -> 32 (lbl_802B4ECC.unk18 temp)
                    // r21 20 -> 16 (arg to func_8009F33C)
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
        lbl_802F20EC(&sp3C);
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
    if (a->unk0 & 0x20)
        r15_ = a->unk40 & 0xF;
    if (a->unk0 & 0x40)
        r16_ = (a->unk40 >> 4) & 0xF;
    if (lbl_802B4ECC.unk24 != r15_ || lbl_802B4ECC.unk28 != r16_)
    {
        func_8009E110(1, r15_, r16_, 0);
        lbl_802B4ECC.unk24 = r15_;
        lbl_802B4ECC.unk28 = r16_;
    }
    //lbl_8009123C
    lbl_802B4ECC.unk0 = 0;
    if (a->unk0 & 0x80)
        lbl_802B4ECC.unk1 = 0;
    else
        lbl_802B4ECC.unk1 = a->unk12;
}
#else
asm void func_80090524(struct UnkStruct30 *a, struct UnkStruct31 *b)
{
#define _SDA_BASE_ 0
#define _SDA2_BASE_ 0
    nofralloc
#include "../asm/nonmatchings/func_80090524.s"
}
#endif

void func_8009127C(GXTevStageID tevStage)
{
    func_8009F180(tevStage, 14);
    func_8009F224(tevStage, 30);
    GXSetTevDirect(tevStage);
    func_8009EFF4(tevStage, 0xFF, 0xFF, 4);
    func_8009E618(tevStage, 15, 0, 14, 15);
    func_8009E800(tevStage, 0, 0, 0, 1, 0);
    func_8009E70C(tevStage, 7, 0, 6, 7);
    func_8009E918(tevStage, 0, 0, 0, 1, 0);
}

void func_80091340(GXTevStageID tevStage)
{
    func_8009F180(tevStage, 15);
    func_8009F224(tevStage, 31);
    GXSetTevDirect(tevStage);
    func_8009EFF4(tevStage, 0xFF, 0xFF, 4);
    func_8009E618(tevStage, 0, 15, 15, 14);
    func_8009E800(tevStage, 0, 0, 0, 1, 0);
    func_8009E70C(tevStage, 0, 7, 7, 6);
    func_8009E918(tevStage, 0, 0, 0, 1, 0);
}

void func_80091404(struct UnkStruct32 *a, u32 b, u32 c, u32 texGenSrc)
{
    GXSetTevDirect(a->tevStage);
    func_8009E2C8(a->tevStage, 0, 0);
    GXSetTexCoordGen(a->texCoordID, GX_TG_MTX2x4, texGenSrc, GX_TEXMTX1);
    func_8009EFF4(a->tevStage, a->texCoordID, a->unkC, 4);
    func_8009E618(a->tevStage, 15, 8, b, 15);
    func_8009E800(a->tevStage, 0, 0, 0, 1, 0);
    func_8009E70C(a->tevStage, 7, 4, c, 7);
    func_8009E918(a->tevStage, 0, 0, 0, 1, 0);
}

void func_80091500(struct UnkStruct32 *a, u32 b, u32 c)
{
    func_8009E618(a->tevStage, 15, 8, b, 15);
    func_8009E70C(a->tevStage, 7, 4, c, 7);
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
    func_8009EFF4(a->tevStage, a->texCoordID, a->unkC, 4);
    func_8009E2C8(a->tevStage, 0, 1);
    func_8009E618(a->tevStage, 15, 15, 15, b);
    func_8009E800(a->tevStage, 0, 0, 0, 1, 0);
    func_8009E70C(a->tevStage, 7, 4, c, 7);
    func_8009E918(a->tevStage, 0, 0, 0, 1, 0);
}

void func_8009167C(struct UnkStruct32 *a, u32 b, u32 c)
{
    func_8009E618(a->tevStage, 15, 15, 15, b);
    func_8009E70C(a->tevStage, 7, 4, c, 7);
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
    func_8009E2C8(a->tevStage, 0, 0);
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
        func_8009015C();
        lbl_802B4ECC.unk48 = 1;
    }
    func_8009F180(a->tevStage, 12);
    GXSetTexCoordGen2(a->texCoordID, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX0);
    func_8009EFF4(a->tevStage, a->texCoordID, a->unkC, 4);
    func_8009E618(a->tevStage, 15, 8, 14, b);
    func_8009E800(a->tevStage, 0, 0, 0, 1, 0);
    func_8009E70C(a->tevStage, 7, 7, 7, c);
    func_8009E918(a->tevStage, 0, 0, 0, 1, 0);
}

void func_80091878(struct UnkStruct32 *a, u32 b, u32 c)
{
    func_8009E618(a->tevStage, 15, 8, 14, b);
    func_8009E70C(a->tevStage, 7, 7, 7, c);
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
        func_8009F430(&unknownTexObj, 0);
        func_80090268();
        lbl_802B4ECC.unk4C = 1;
    }
    // unrolled loop?
    tevStage = a->tevStage;
    
    GXSetTevDirect(tevStage);
    func_8009E2C8(a->tevStage, 0, 0);
    func_8009F180(tevStage, 13);
    GXSetTexCoordGen2(a->texCoordID, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX2);
    func_8009EFF4(tevStage, a->texCoordID, 0, 4);
    func_8009E618(tevStage, 15, 8, 14, 15);
    func_8009E800(tevStage, 0, 0, 0, 1, 3);
    func_8009E70C(tevStage, 7, 7, 7, c);
    func_8009E918(tevStage, 0, 0, 0, 1, 3);
    
    GXSetTevDirect(tevStage + 1);
    func_8009E2C8(a->tevStage, 0, 0);
    GXSetTexCoordGen2(a->texCoordID + 1, GX_TG_MTX3x4, GX_TG_NRM, GX_TEXMTX0, GX_TRUE, GX_PTTEXMTX1);
    func_8009EFF4(tevStage + 1, a->texCoordID + 1, a->unkC, 4);
    func_8009E618(tevStage + 1, 15, 8, 6, b);
    func_8009E800(tevStage + 1, 0, 0, 0, 1, 0);
    func_8009E70C(tevStage + 1, 7, 7, 7, c);
    func_8009E918(tevStage + 1, 0, 0, 0, 1, 0);
}

void func_80091B1C(struct UnkStruct32 *a, u32 b, u32 c)
{
    func_8009E618(a->tevStage + 1, 15, 8, 6, b);
    func_8009E70C(a->tevStage + 1, 7, 7, 7, c);
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
    func_8009EFF4(a->tevStage, a->texCoordID, a->unkC, 4);
    func_8009E618(a->tevStage, 15, 15, 15, b);
    func_8009E800(a->tevStage, 0, 0, 0, 1, 0);
    func_8009E70C(a->tevStage, 7, 7, 7, c);
    func_8009E918(a->tevStage, 0, 0, 0, 1, 0);
    a->unk20 = 1;
    a->unk24 = a->texCoordID;
    a->unk28 = a->unkC;
}

void func_80091CA8(struct UnkStruct32 *a, u32 b, u32 c)
{
    func_8009E618(a->tevStage, 15, 15, 15, b);
    func_8009E70C(a->tevStage, 7, 7, 7, c);
}

// duplicate of func_80091564
void func_80091D0C(struct UnkStruct32 *a)
{
    a->tevStage++;
    a->texCoordID++;
}
