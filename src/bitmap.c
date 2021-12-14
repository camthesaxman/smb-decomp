#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "load.h"
#include "mathutil.h"

struct Struct802F1CF8
{
    u8 filler0[0x1C];
};

struct Struct800267E8
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    s16 unk10;
    s16 unk12;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 unk18;
};

extern void *lbl_802F1CEC;
extern u8 *lbl_802F1CF0;
extern struct Struct802F1CF8 *lbl_802F1CF8;

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

void func_8002688C(struct Struct800267E8 *a);

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

void bmpdisp_main(void)
{
    float sp48[7];
    u8 unused[16];
    Mtx sp8;
    struct Struct802F1CF8 *r31;

    func_800263A4();
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    C_MTXPerspective(sp8, 60.0f, 1.33333333f, 0.1f, 20000.0f);
    GXSetProjection(sp8, 0);
    lbl_802F1D04 = 1;
    if (eventInfo[16].state == 2)
        func_800700D8(0);
    GXGetProjectionv(sp48);
    C_MTXOrtho(sp8, 0.0f, 480.0f, 0.0f, 640.0f, 0.0f, 20000.0f);
    GXSetProjection(sp8, 1);

    r31 = lbl_802F1CF8;
    while (lbl_802F1CFC != 0)
    {
        func_8002688C((void *)r31);
        r31++;
        lbl_802F1CFC--;
    }
    lbl_802F1CFC = 0;
    func_80026F4C();
    lbl_802F1D04 = 2;
    func_8002704C();
    lbl_802F1D00 = 0;
    lbl_802F1D04 = 1;
    if (eventInfo[EVENT_SPRITE].state == EV_STATE_RUNNING)
        func_800700D8(1);
    if (eventInfo[EVENT_MOUSE].state == EV_STATE_RUNNING)
        func_80095024();
    lbl_802F1D04 = 3;
    func_800730B4();
    lbl_802F1D04 = 2;
    func_8002704C();

    if (zMode->updateEnable != GX_DISABLE
     || zMode->compareFunc != 7
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, 7, GX_DISABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc = 7;
        zMode->updateEnable = GX_DISABLE;
    }

    if (eventInfo[EVENT_MEMCARD].state == EV_STATE_RUNNING)
        memcard_draw_ui();

    if (zMode->updateEnable != GX_ENABLE
     || zMode->compareFunc != 3
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, 3, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc = 3;
        zMode->updateEnable = GX_ENABLE;
    }

    lbl_802F1D08 = lbl_80181CB4[0].unk10;
    func_8002F0E4();
    sp8[0][0] = sp48[1];
    sp8[0][3] = sp48[2];
    sp8[1][1] = sp48[3];
    sp8[1][3] = sp48[4];
    sp8[2][2] = sp48[5];
    sp8[2][3] = sp48[6];
    GXSetProjection(sp8, sp48[0]);
}

float get_lbl_802F3100(void) { return 1.0f; }

#pragma force_active on

char string_Manager_is_NULL__n[] = "Manager is NULL.\n";
char string_Select_texture_is_invalid__n[] = "Select texture is invalid.\n";
char string_Bitmap_put_entry_is_FULL__n[] = "Bitmap put entry is FULL!\n";

void func_800267E8(struct Struct800267E8 *a, float *b, float *c, float d, float e)
{
    *b = a->unk0;
    *c = a->unk4;

    switch (a->unk14)
    {
    case 3:
    case 4:
    case 5:
        *b -= d / 2.0f;
        break;
    case 6:
    case 7:
    case 8:
        *b -= d;
        break;
    }

    switch (a->unk14)
    {
    case 1:
    case 4:
    case 7:
        *c -= e / 2.0f;
        break;
    case 2:
    case 5:
    case 8:
        *c -= e;
        break;
    }
}

#pragma force_active off

void func_8002688C(struct Struct800267E8 *a)
{
    struct Struct80181CB4_child_child *r5;
    float f2;
    float f1;
    float x;
    float y;
    Vec sp44 = {0.0f, 0.0f, 0.0f};
    Vec sp38 = {0.0f, 0.0f, 0.0f};
    Vec sp2C = {0.0f, 0.0f, 0.0f};
    GXColor tevColor;

    x = a->unk0;
    y = a->unk4;
    r5 = &lbl_80181CB4[(a->unk10 >> 8) & 0xFF].unk10->unk4[a->unk10 & 0xFF];
    f2 = r5->unk8 * a->unk8;
    f1 = r5->unkA * a->unkC;
    func_800267E8(a, &x, &y, f2, f1);
    sp44.x = f2;
    sp38.y = f1;
    sp2C.x = f2;
    sp2C.y = f1;
    mathutil_mtxA_from_rotate_z(-a->unk12);
    mathutil_mtxA_tf_vec(&sp44, &sp44);
    mathutil_mtxA_tf_vec(&sp38, &sp38);
    mathutil_mtxA_tf_vec(&sp2C, &sp2C);

    func_8009F430(&lbl_80181CB4[(a->unk10 >> 8) & 0xFF].unk10->unkC[a->unk10 & 0xFF], 0);

    tevColor.r = a->unk15;
    tevColor.g = a->unk16;
    tevColor.b = a->unk17;
    tevColor.a = a->unk18;
    GXSetTevColor(1, tevColor);

    tevColor.r = 0;
    tevColor.g = 0;
    tevColor.b = 0;
    tevColor.a = 0;
    GXSetTevColor(2, tevColor);

    GXBegin(GX_QUADS, GX_VTXFMT7, 4);
        GXPosition3f32(x,         y,           -128.0f);
        GXTexCoord2f32(0.0f, 0.0f);
        GXPosition3f32(x + sp44.x, y + sp44.y, -128.0f);
        GXTexCoord2f32(1.0f, 0.0f);
        GXPosition3f32(x + sp2C.x, y + sp2C.y, -128.0f);
        GXTexCoord2f32(1.0f, 1.0f);
        GXPosition3f32(x + sp38.x, y + sp38.y, -128.0f);
        GXTexCoord2f32(0.0f, 1.0f);
    GXEnd();
}

void func_80026B58(u8 a)
{
    struct FontParams *r30 = &lbl_801BE4B0[lbl_802F1CF4];
    float x = lbl_802F1CE2;
    float y = lbl_802F1CE4;
    int var1 = a - r30->unk4;
    int var2 = var1 % r30->unkC;
    int var3 = var1 / r30->unkC;
    float f29;
    float f28;
    float f27;
    float f26;
    GXColor tevColor;

    f27 = 128.0f / lbl_80181CB4[(r30->unk0 >> 8) & 0xFF].unk10->unk4[r30->unk0 & 0xFF].unk8;
    f26 = 128.0f / lbl_80181CB4[(r30->unk0 >> 8) & 0xFF].unk10->unk4[r30->unk0 & 0xFF].unkA;

    f29 = f27 * (var2 * r30->unk2);
    f28 = f26 * (var3 * r30->unk3);
    func_8009F430(&lbl_80181CB4[(r30->unk0 >> 8) & 0xFF].unk10->unkC[r30->unk0 & 0xFF], 0);

    tevColor.r = 255;
    tevColor.g = 255;
    tevColor.b = 255;
    tevColor.a = 255;
    GXSetTevColor(1, tevColor);

    tevColor.r = 0;
    tevColor.g = 0;
    tevColor.b = 0;
    tevColor.a = 0;
    GXSetTevColor(2, tevColor);

    GXBegin(GX_QUADS, GX_VTXFMT7, 4);
        GXPosition3f32(x,                    y,                    -1.0f);
        GXTexCoord2f32(f29,                          f28);
        GXPosition3f32(x + r30->unk2 - 1.0f, y,                    -1.0f);
        GXTexCoord2f32(f29 + r30->unk2 * f27 - 1.0f, f28);
        GXPosition3f32(x + r30->unk2-1.0f,   y + r30->unk3 - 1.0f, -1.0f);
        GXTexCoord2f32(f29 + r30->unk2 * f27 - 1.0f, f28 + r30->unk3 * f26 -1.0f);
        GXPosition3f32(x,                    y + r30->unk3,        -1.0f);
        GXTexCoord2f32(f29,                          f28 + r30->unk3 * f26 - 1.0f);
    GXEnd();

    lbl_802F1CE2 += r30->unk2;
}

void func_80026E6C(u8 a)
{
    struct FontParams *r4 = &lbl_801BE4B0[lbl_802F1CF4];

    switch (a)
    {
    case 0:
        break;
    case 10:
        lbl_802F1CE2 = lbl_802F1CE0;
        lbl_802F1CE4 += r4->unk3;
        break;
    case 9:
        lbl_802F1CE2 += r4->unk2 * 8;
        lbl_802F1CE2 &= ~(r4->unk2 * 8 - 1);
        break;
    case 13:
        lbl_802F1CE2 = lbl_802F1CE0;
        break;
    case 32:
        lbl_802F1CE2 += r4->unk2;
        break;
    default:
        func_80026B58(a);
        break;
    }
}

void func_80026F4C(void)
{
    u8 unused[8];
    u8 *r30;
    u16 var1, var2;

    *lbl_802F1CF0 = 0x84;
    r30 = lbl_802F1CEC;
    while (*r30 != 0x84)
    {
        switch (*r30)
        {
        case 0x80:
            r30++;
            lbl_802F1CF4 = *r30;
            break;
        case 0x81:
            r30++;
            lbl_802F04A8 = *r30;
            break;
        case 0x83:
            r30++;
            lbl_802F1CE8 = *r30 / 16.0f;
            break;
        case 0x82:
            var1 = (r30[1] << 8) | r30[2];
            var2 = (r30[3] << 8) | r30[4];
            lbl_802F1CE2 = var1;
            lbl_802F1CE0 = var1;
            lbl_802F1CE4 = var2;
            r30 += 4;
            break;
        default:
            func_80026E6C(*r30);
            break;
        }
        r30++;
    }
    lbl_802F1CF0 = lbl_802F1CEC;
}

void func_8002704C(void)
{
    int i;
    struct Struct801F3DC0 *r30 = &lbl_801F3DC0[0];

    for (i = 0; i < lbl_802F1D00; i++, r30++)
        func_80073828(r30);
}
