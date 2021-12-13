//#include <stddef.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "load.h"

extern void *lbl_802F1CEC;
extern void *lbl_802F1CF0;
extern void *lbl_802F1CF8;

extern char *lbl_801825A4[];
extern char *lbl_801828E8[];
extern char *lbl_801829A0[];
extern char *lbl_80182C54[];
extern char *lbl_80183110[];
extern char *lbl_801833B4[];
extern char *lbl_80183614[];
extern char *lbl_801839D0[];
extern char *lbl_80183B60[];
extern char *lbl_80183C2C[];
extern char *lbl_80183FB4[];
extern char *lbl_80184490[];
extern char *lbl_8018484C[];
extern char *lbl_80184918[];

struct Struct80181CB4 lbl_80181CB4[] =
{
    {0, "bmp/bmp_com.tpl.lz", "BMP_COM", 0, NULL, 0},
    {0, "bmp/bmp_adv.tpl",    "BMP_ADV", 0, NULL, 0},
    {0, "bmp/bmp_end.tpl",    "BMP_END", 0, NULL, 0},
    {0, "bmp/bmp_rnk.tpl",    "BMP_RNK", 0, NULL, 0},
    {0, "bmp/bmp_sel.tpl",    "BMP_SEL", 0, NULL, 0},
    {0, "bmp/bmp_nml.tpl",    "BMP_NML", 0, NULL, 0},
    {0, "bmp/bmp_bwl.tpl",    "BMP_BWL", 0, NULL, 0},
    {0, "bmp/bmp_rac.tpl",    "BMP_RAC", 0, NULL, 0},
    {0, "bmp/bmp_bil.tpl",    "BMP_BIL", 0, NULL, 0},
    {0, "bmp/bmp_fgt.tpl",    "BMP_FGT", 0, NULL, 0},
    {0, "bmp/bmp_glf.tpl",    "BMP_GLF", 0, NULL, 0},
    {0, "bmp/bmp_tgt.tpl",    "BMP_TGT", 0, NULL, 0},
    {0, "bmp/bmp_how.tpl",    "BMP_HOW", 0, NULL, 0},
    {0, "bmp/bmp_cmd.tpl",    "BMP_CMD", 0, NULL, 0},
};

char **lbl_80181E04[] =
{
    lbl_801825A4,
    lbl_801828E8,
    lbl_801829A0,
    lbl_80182C54,
    lbl_80183110,
    lbl_801833B4,
    lbl_80183614,
    lbl_801839D0,
    lbl_80183B60,
    lbl_80183C2C,
    lbl_80183FB4,
    lbl_80184490,
    lbl_8018484C,
    lbl_80184918,
};

u32 lbl_802F04A8 = 0xFFFFFFFF;

u8 lbl_801F3DA0[0x20];

void func_80025EC0(void)
{
    g_something_with_bmp_bmp_com(0);
    func_80026378(0);
    lbl_802F1CEC = lbl_802F1CF0 = OSAlloc(0x800);
    if (lbl_802F1CF0 == NULL)
        OSPanic("bitmap.c", 120, "cannot OSAlloc");
    lbl_802F1CF8 = OSAlloc(0x1C00);
    if (lbl_802F1CF8 == NULL)
        OSPanic("bitmap.c", 122, "cannot OSAlloc");
    lbl_802F1CFC = 0;
    lbl_802F1CF4 = 0;
    lbl_802F1D00 = 0;
    lbl_802F1D04 = 0;
}

struct Struct80025F74_Data
{
    u32 unk0;
};

struct Struct80025F74_child
{
    u32 unk0;  // flags
    u32 unk4;
    u16 unk8;  // width
    u16 unkA;  // height
    u32 unkC;
};  // size = 0x10

struct Struct80025F74  // TPL, maybe?
{
    u32 unk0;
    struct Struct80025F74_child *unk4;
    u8 filler8[4];
    GXTexObj *unkC;
};

void *func_80025F74(char *filename)
{
    struct Struct80025F74 *r30;
    u32 size;
    struct Struct80025F74_Data *fileData;
    u32 i;
    int len;
    struct File file;

    if (!file_open(filename, &file))
        return 0;
    size = OSRoundUp32B(file_size(&file));
    len = strlen(filename);
    if (len >= 3 && strncmp(filename + (len - 3), ".lz", 3) == 0)
    {
        u32 r27;
        void *lzData;

        if (file_read(&file, lbl_801F3DA0, 0x20, 0) < 0)
            return 0;
        r27 = OSRoundUp32B(__lwbrx(lbl_801F3DA0, 0));
        size = OSRoundUp32B(__lwbrx(lbl_801F3DA0, 4));
        r30 = OSAlloc(size + 16);
        if (r30 == NULL)
            OSPanic("bitmap.c", 164, "cannot OSAlloc\n");
        lzData = OSAllocFromHeap(lbl_802F1B2C, r27);
        if (lzData == NULL)
            OSPanic("bitmap.c", 165, "cannot OSAlloc\n");
        if (file_read(&file, lzData, r27, 0) < 0)
            return 0;
        if (file_close(&file) != 1)
            return 0;
        fileData = (void *)OSRoundUp32B((u32)r30 + 0x10);
        lzs_decompress(lzData, fileData);
        DCFlushRange(fileData, size);
        OSFreeToHeap(lbl_802F1B2C, lzData);
    }
    else
    {
        r30 = OSAlloc(OSRoundUp32B(size) + 0x20);
        if (r30 == NULL)
            OSPanic("bitmap.c", 178, "cannot OSAlloc");
        fileData = (void *)OSRoundUp32B((u32)r30 + 0x10);
        file_read(&file, fileData, size, 0);
        file_close(&file);
    }

    r30->unk0 = fileData->unk0;
    r30->unk4 = (void *)((u32)fileData + 4);
    r30->unkC = OSAlloc(r30->unk0 * 32);
    if (r30->unkC == NULL)
        OSPanic("bitmap.c", 188, "cannot OSAlloc");

    for (i = 0; i < r30->unk0; i++)
    {
        struct Struct80025F74_child *r8 = &r30->unk4[i];
        u32 flags = r8->unk0;
        void *imgPtr = OFFSET_TO_PTR(fileData, r8->unk4);

        if (!(flags & (1<<(31-0x19))))
        {
            GXInitTexObj(
                &r30->unkC[i],  // obj
                imgPtr,  // image_ptr
                r8->unk8,  // width
                r8->unkA,  // height
                flags & 0x1F,  // format
                GX_CLAMP,  // wrap_s
                GX_CLAMP,  // wrap_t
                GX_FALSE);  // mipmap
        }
    }

    GXInvalidateTexAll();
    return r30;
}

void g_something_with_bmp_bmp_com(int a)
{
    struct Struct80181CB4 *r31 = &lbl_80181CB4[a];

    if (r31->unk0 == 0)
    {
        r31->unk10 = func_80025F74(r31->unk4);
        r31->unk0 = 1;
        r31->unk14 = __OSCurrHeap;
    }
}

void g_something_with_freeing_memory(int a)
{
    int i;
    int r30;
    int end;
    struct Struct80181CB4 *r28;

    if (a == 14)
    {
        r30 = 1;
        end = 14;
    }
    else
    {
        r30 = a;
        end = a + 1;
    }

    r28 = &lbl_80181CB4[r30];
    while (r30 < end)
    {
        if (r28->unk0 != 0)
        {
            OSFreeToHeap(r28->unk14, r28->unk10->unkC);
            OSFreeToHeap(r28->unk14, r28->unk10);
            r28->unk0 = 0;
        }
        r30++;
        r28++;
    }
}

int func_8002630C(int a)
{
    if (lbl_80181CB4[a].unk0 != 0)
        return 1;
    else
        return 0;
}

void func_80026338(struct Struct80181CB4_child *a)  // not sure of this type
{
    OSFree(a->unkC);
    OSFree(a);
}

void func_80026378(int a)
{
    lbl_802F1D08 = lbl_80181CB4[a].unk10;
}

void func_80026394(void)
{
    lbl_802F1D00 = 0;
    lbl_802F1D04 = 0;
}

void func_800263A4(void)
{
    GXColor green = { 0, 255, 0, 255 };

    func_8009AA20();
    func_8009A9B4(0x2200);
    GXSetNumChans(0);
    GXSetNumTexGens(1);
    func_8009F2C8(1);
    GXSetTevDirect(GX_TEVSTAGE0);
    func_8009EA30(0, 0);
    GXSetTexCoordGen(
        GX_TEXCOORD0,  // dst_coord
        GX_TG_MTX2x4,  // func
        GX_TG_TEX0,  // src_param
        GX_IDENTITY);  // mtx
    func_8009EFF4(0, 0, 0, 0xFF);
    func_8009E2C8(0, 0, 0);
    func_8009E618(0, 15, 2, 8, 4);
    func_8009E800(0, 0, 0, 0, 1, 0);
    func_8009E70C(0, 7, 1, 4, 2);
    func_8009E918(0, 0, 0, 0, 1, 0);
    GXSetChanCtrl(
        GX_COLOR0A0,  // chan
        GX_DISABLE,  // enable
        GX_SRC_REG,  // amb_src
        GX_SRC_REG,  // mat_src
        GX_LIGHT_NULL,  // light_mask
        GX_DF_CLAMP,  // diff_fn
        GX_AF_NONE);  // attn_fn
    GXSetTevColor(GX_TEVREG0, green);

    if (zMode->updateEnable != GX_ENABLE
     || zMode->compareFunc != GX_LESS
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, GX_LESS, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc = GX_LESS;
        zMode->updateEnable = GX_ENABLE;
    }

    func_8009E110(1, 4, 5, 0);
    {
        GXColor color = {0, 0, 0, 0};
        func_8009E398(0, color, 0.0f, 100.0f, 0.1f, 20000.0f);
    }
    func_8009E094(2);
}

/*
const GXColor lbl_802F30D8 = { 0, 255, 0, 255 };
const GXColor lbl_802F30DC = {0, 0, 0};

const float lbl_802F30E0 = 0.0f;
const float lbl_802F30E4 = 100.0f;
const float lbl_802F30E8 = 0.1f;
const float lbl_802F30EC = 20000.0f;
*/
const float lbl_802F30F0 = 60.0f;
const float lbl_802F30F4 = 1.33333333f;
const float lbl_802F30F8 = 480.0f;
const float lbl_802F30FC = 640.0f;
const float lbl_802F3100 = 1.0f;
const float lbl_802F3104 = 0.5f;
const float lbl_802F3108 = -128.0f;
const double lbl_802F3110 = 4503599627370496.0;
const float lbl_802F3118 = 128.0f;
const float lbl_802F311C = -1.0f;
const double lbl_802F3120 = 4503601774854144.0;
const float lbl_802F3128 = 0.0625f;
