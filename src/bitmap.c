#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "event.h"
#include "gxutil.h"
#include "load.h"
#include "mathutil.h"
#include "sprite.h"
#include "tevutil.h"

struct TPL *g_unkBitmapTPL;
s32 lbl_802F1D04;
s32 spriteParamsBufCount;
u16 lbl_802F1CFC;
struct Bitmap *bitmapList;
u32 currFont;
u8 *prevString;
unsigned char *currString;
float lbl_802F1CE8;
u16 textY;
u16 textX;
u16 textStartX;
struct NaomiSpriteParams spriteParamsBuf[0x100];

extern char *bmpComNames[];
extern char *bmpAdvNames[];
extern char *bmpEndNames[];
extern char *bmpRnkNames[];
extern char *bmpSelNames[];
extern char *bmpNmlNames[];
extern char *bmpBwlNames[];
extern char *bmpRacNames[];
extern char *bmpBilNames[];
extern char *bmpFgtNames[];
extern char *bmpGlfNames[];
extern char *bmpTgtNames[];
extern char *bmpHowNames[];
extern char *bmpCmdNames[];

struct BitmapGroup bitmapGroups[] =
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

char **bitmapNames[] =
{
    bmpComNames,
    bmpAdvNames,
    bmpEndNames,
    bmpRnkNames,
    bmpSelNames,
    bmpNmlNames,
    bmpBwlNames,
    bmpRacNames,
    bmpBilNames,
    bmpFgtNames,
    bmpGlfNames,
    bmpTgtNames,
    bmpHowNames,
    bmpCmdNames,
};

u32 lbl_802F04A8 = 0xFFFFFFFF;

static u8 lzssHeader[0x20] __attribute__((aligned(32)));

void bitmap_draw(struct Bitmap *a);

void bitmap_init(void)
{
    bitmap_load_group(0);
    func_80026378(0);
    currString = prevString = OSAlloc(0x800);
    if (prevString == NULL)
        OSPanic("bitmap.c", 120, "cannot OSAlloc");
    bitmapList = OSAlloc(256 * sizeof(struct Bitmap));
    if (bitmapList == NULL)
        OSPanic("bitmap.c", 122, "cannot OSAlloc");
    lbl_802F1CFC = 0;
    currFont = 0;
    spriteParamsBufCount = 0;
    lbl_802F1D04 = 0;
}

struct TPL *bitmap_load_tpl(char *filename)
{
    struct TPL *tpl;
    u32 size;
    u8 *fileData;
    u32 i;
    int len;
    struct File file;

    if (!file_open(filename, &file))
        return 0;
    size = OSRoundUp32B(file_size(&file));
    len = strlen(filename);
    if (len >= 3 && strncmp(filename + (len - 3), ".lz", 3) == 0)
    {
        u32 compressedSize;
        void *lzData;

        // Read LZSS header
        if (file_read(&file, lzssHeader, 0x20, 0) < 0)
            return 0;
        compressedSize = OSRoundUp32B(__lwbrx(lzssHeader, 0));
        size = OSRoundUp32B(__lwbrx(lzssHeader, 4));

        tpl = OSAlloc(size + 16);
        if (tpl == NULL)
            OSPanic("bitmap.c", 164, "cannot OSAlloc\n");

        // Read whole file
        lzData = OSAllocFromHeap(memHeap5, compressedSize);
        if (lzData == NULL)
            OSPanic("bitmap.c", 165, "cannot OSAlloc\n");
        if (file_read(&file, lzData, compressedSize, 0) < 0)
            return 0;
        if (file_close(&file) != 1)
            return 0;

        // Decompress data
        fileData = (void *)OSRoundUp32B((u32)tpl + 0x10);
        lzs_decompress(lzData, fileData);
        DCFlushRange(fileData, size);
        OSFreeToHeap(memHeap5, lzData);
    }
    else
    {
        tpl = OSAlloc(OSRoundUp32B(size) + 0x20);
        if (tpl == NULL)
            OSPanic("bitmap.c", 178, "cannot OSAlloc");
        fileData = (void *)OSRoundUp32B((u32)tpl + 0x10);
        file_read(&file, fileData, size, 0);
        file_close(&file);
    }

    tpl->numTextures = *(u32 *)(fileData + 0);  // 0: number of textures
    tpl->texHeaders = OFFSET_TO_PTR(fileData, 4);  // 4: texture headers
    tpl->texObjs = OSAlloc(tpl->numTextures * sizeof(GXTexObj));
    if (tpl->texObjs == NULL)
        OSPanic("bitmap.c", 188, "cannot OSAlloc");

    for (i = 0; i < tpl->numTextures; i++)
    {
        struct TPLTextureHeader *texHdr = &tpl->texHeaders[i];
        u32 flags = texHdr->format;
        void *imgPtr = OFFSET_TO_PTR(fileData, texHdr->imageOffset);

        if (!(flags & (1 << 6)))
        {
            GXInitTexObj(
                &tpl->texObjs[i],  // obj
                imgPtr,  // image_ptr
                texHdr->width,  // width
                texHdr->height,  // height
                flags & 0x1F,  // format
                GX_CLAMP,  // wrap_s
                GX_CLAMP,  // wrap_t
                GX_FALSE);  // mipmap
        }
    }

    GXInvalidateTexAll();
    return tpl;
}

void bitmap_load_group(enum BitmapGroupID grpId)
{
    struct BitmapGroup *grp = &bitmapGroups[grpId];

    if (!grp->isLoaded)
    {
        grp->tpl = bitmap_load_tpl(grp->filename);
        grp->isLoaded = TRUE;
        grp->heap = __OSCurrHeap;
    }
}

void bitmap_free_group(enum BitmapGroupID grpId)
{
    int curr;
    int end;
    struct BitmapGroup *grp;

    if (grpId == BMP_ALL)
    {
        // unload all, except for BMP_COM
        curr = 1;
        end = 14;
    }
    else
    {
        curr = grpId;
        end = grpId + 1;
    }

    grp = &bitmapGroups[curr];
    while (curr < end)
    {
        if (grp->isLoaded)
        {
            OSFreeToHeap(grp->heap, grp->tpl->texObjs);
            OSFreeToHeap(grp->heap, grp->tpl);
            grp->isLoaded = 0;
        }
        curr++;
        grp++;
    }
}

int bitmap_is_group_loaded(enum BitmapGroupID grpId)
{
    if (bitmapGroups[grpId].isLoaded)
        return TRUE;
    else
        return FALSE;
}

void bitmap_free_tpl(struct TPL *tpl)
{
    OSFree(tpl->texObjs);
    OSFree(tpl);
}

void func_80026378(int grpId)
{
    g_unkBitmapTPL = bitmapGroups[grpId].tpl;
}

void func_80026394(void)
{
    spriteParamsBufCount = 0;
    lbl_802F1D04 = 0;
}

void func_800263A4(void)
{
    GXColor green = { 0, 255, 0, 255 };

    gxutil_dummy();
    gxutil_set_vtx_attrs(
        (1 << GX_VA_POS)
      | (1 << GX_VA_TEX0));
    GXSetNumChans(0);
    GXSetNumTexGens(1);
    GXSetNumTevStages_cached(1);
    GXSetTevDirect(GX_TEVSTAGE0);
    func_8009EA30(0, 0);
    GXSetTexCoordGen(
        GX_TEXCOORD0,  // dst_coord
        GX_TG_MTX2x4,  // func
        GX_TG_TEX0,  // src_param
        GX_IDENTITY);  // mtx
    GXSetTevOrder_cached(0, 0, 0, 0xFF);
    GXSetTevSwapMode_cached(0, 0, 0);
    GXSetTevColorIn_cached(0, 15, 2, 8, 4);
    GXSetTevColorOp_cached(0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(0, 7, 1, 4, 2);
    GXSetTevAlphaOp_cached(0, 0, 0, 0, 1, 0);
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

    GXSetBlendMode_cached(1, 4, 5, 0);
    {
        GXColor color = {0, 0, 0, 0};
        GXSetFog_cached(0, 0.0f, 100.0f, 0.1f, 20000.0f, color);
    }
    GXSetCullMode_cached(GX_CULL_BACK);
}

void bitmap_main(void)
{
    float projParams[GX_PROJECTION_SZ];
    u8 unused[16];
    Mtx m;
    struct Bitmap *bmp;

    func_800263A4();
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    C_MTXPerspective(m, 60.0f, 1.33333333f, 0.1f, 20000.0f);
    GXSetProjection(m, GX_PERSPECTIVE);
    lbl_802F1D04 = 1;
    if (eventInfo[EVENT_SPRITE].state == EV_STATE_RUNNING)
        func_800700D8(0);
    GXGetProjectionv(projParams);
    C_MTXOrtho(m, 0.0f, 480.0f, 0.0f, 640.0f, 0.0f, 20000.0f);
    GXSetProjection(m, GX_ORTHOGRAPHIC);

    bmp = bitmapList;
    while (lbl_802F1CFC != 0)
    {
        bitmap_draw(bmp);
        bmp++;
        lbl_802F1CFC--;
    }
    lbl_802F1CFC = 0;

    bitmap_draw_string();
    lbl_802F1D04 = 2;
    func_8002704C();
    spriteParamsBufCount = 0;
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
     || zMode->compareFunc != GX_ALWAYS
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, GX_ALWAYS, GX_DISABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc = GX_ALWAYS;
        zMode->updateEnable = GX_DISABLE;
    }

    if (eventInfo[EVENT_MEMCARD].state == EV_STATE_RUNNING)
        memcard_draw_ui();

    if (zMode->updateEnable != GX_ENABLE
     || zMode->compareFunc != GX_LEQUAL
     || zMode->compareEnable != GX_ENABLE)
    {
        GXSetZMode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc = GX_LEQUAL;
        zMode->updateEnable = GX_ENABLE;
    }

    g_unkBitmapTPL = bitmapGroups[BMP_COM].tpl;
    func_8002F0E4();
    m[0][0] = projParams[1];
    m[0][3] = projParams[2];
    m[1][1] = projParams[3];
    m[1][3] = projParams[4];
    m[2][2] = projParams[5];
    m[2][3] = projParams[6];
    GXSetProjection(m, projParams[0]);  //! second parameter should be GX_PERSPECTIVE or GX_ORTHOGRAPHIC, not a float
}

float get_lbl_802F3100(void) { return 1.0f; }

#pragma force_active on

char string_Manager_is_NULL__n[] = "Manager is NULL.\n";
char string_Select_texture_is_invalid__n[] = "Select texture is invalid.\n";
char string_Bitmap_put_entry_is_FULL__n[] = "Bitmap put entry is FULL!\n";

void bitmap_calc_pos(struct Bitmap *bmp, float *x, float *y, float width, float height)
{
    *x = bmp->x;
    *y = bmp->y;

    switch (bmp->unk14)
    {
    // centered horizontally
    case ALIGN_CT:
    case ALIGN_CC:
    case ALIGN_CB:
        *x -= width / 2.0f;
        break;
    // right aligned
    case ALIGN_RT:
    case ALIGN_RC:
    case ALIGN_RB:
        *x -= width;
        break;
    }

    switch (bmp->unk14)
    {
    // centered vertically
    case ALIGN_LC:
    case ALIGN_CC:
    case ALIGN_RC:
        *y -= height / 2.0f;
        break;
    // bottom aligned
    case ALIGN_LB:
    case ALIGN_CB:
    case ALIGN_RB:
        *y -= height;
        break;
    }
}

#pragma force_active off

void bitmap_draw(struct Bitmap *bmp)
{
    struct TPLTextureHeader *tex;
    float f2;
    float f1;
    float x;
    float y;
    Vec sp44 = {0.0f, 0.0f, 0.0f};
    Vec sp38 = {0.0f, 0.0f, 0.0f};
    Vec sp2C = {0.0f, 0.0f, 0.0f};
    GXColor tevColor;

    x = bmp->x;
    y = bmp->y;
    tex = &bitmapGroups[(bmp->imageId >> 8) & 0xFF].tpl->texHeaders[bmp->imageId & 0xFF];
    f2 = tex->width * bmp->unk8;
    f1 = tex->height * bmp->unkC;
    bitmap_calc_pos(bmp, &x, &y, f2, f1);
    sp44.x = f2;
    sp38.y = f1;
    sp2C.x = f2;
    sp2C.y = f1;
    mathutil_mtxA_from_rotate_z(-bmp->rotation);
    mathutil_mtxA_tf_vec(&sp44, &sp44);
    mathutil_mtxA_tf_vec(&sp38, &sp38);
    mathutil_mtxA_tf_vec(&sp2C, &sp2C);

    GXLoadTexObj_cached(&bitmapGroups[(bmp->imageId >> 8) & 0xFF].tpl->texObjs[bmp->imageId & 0xFF], 0);

    tevColor.r = bmp->r;
    tevColor.g = bmp->g;
    tevColor.b = bmp->b;
    tevColor.a = bmp->a;
    GXSetTevColor(GX_TEVREG0, tevColor);

    tevColor.r = 0;
    tevColor.g = 0;
    tevColor.b = 0;
    tevColor.a = 0;
    GXSetTevColor(GX_TEVREG1, tevColor);

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

void bitmap_draw_normal_char(unsigned char chr)
{
    struct FontParams *font = &fontInfo[currFont];
    float x = textX;
    float y = textY;
    int var1 = chr - font->unk4;
    int var2 = var1 % font->unkC;
    int var3 = var1 / font->unkC;
    float f29;
    float f28;
    float f27;
    float f26;
    GXColor tevColor;

    f27 = 128.0f / bitmapGroups[(font->unk0 >> 8) & 0xFF].tpl->texHeaders[font->unk0 & 0xFF].width;
    f26 = 128.0f / bitmapGroups[(font->unk0 >> 8) & 0xFF].tpl->texHeaders[font->unk0 & 0xFF].height;

    f29 = f27 * (var2 * font->spaceWidth);
    f28 = f26 * (var3 * font->lineHeight);
    GXLoadTexObj_cached(&bitmapGroups[(font->unk0 >> 8) & 0xFF].tpl->texObjs[font->unk0 & 0xFF], 0);

    tevColor.r = 255;
    tevColor.g = 255;
    tevColor.b = 255;
    tevColor.a = 255;
    GXSetTevColor(GX_TEVREG0, tevColor);

    tevColor.r = 0;
    tevColor.g = 0;
    tevColor.b = 0;
    tevColor.a = 0;
    GXSetTevColor(GX_TEVREG1, tevColor);

    GXBegin(GX_QUADS, GX_VTXFMT7, 4);
        GXPosition3f32(
            x,
            y,
            -1.0f);
        GXTexCoord2f32(
            f29,
            f28);
        GXPosition3f32(
            x + font->spaceWidth - 1.0f,
            y,
            -1.0f);
        GXTexCoord2f32(
            f29 + font->spaceWidth * f27 - 1.0f,
            f28);
        GXPosition3f32(
            x + font->spaceWidth - 1.0f,
            y + font->lineHeight - 1.0f,
            -1.0f);
        GXTexCoord2f32(
            f29 + font->spaceWidth * f27 - 1.0f,
            f28 + font->lineHeight * f26 - 1.0f);
        GXPosition3f32(
            x,
            y + font->lineHeight,
            -1.0f);
        GXTexCoord2f32(
            f29,
            f28 + font->lineHeight * f26 - 1.0f);
    GXEnd();

    textX += font->spaceWidth;
}

void bitmap_draw_char(unsigned char chr)
{
    struct FontParams *r4 = &fontInfo[currFont];

    switch (chr)
    {
    case 0:
        break;
    case '\n':
        textX = textStartX;
        textY += r4->lineHeight;
        break;
    case '\t':
        textX += r4->spaceWidth * 8;
        textX &= ~(r4->spaceWidth * 8 - 1);
        break;
    case '\r':
        textX = textStartX;
        break;
    case ' ':
        textX += r4->spaceWidth;
        break;
    default:
        bitmap_draw_normal_char(chr);
        break;
    }
}

void bitmap_draw_string(void)
{
    u8 unused[8];
    unsigned char *str;
    u16 x, y;

    *prevString = 0x84;
    str = currString;
    while (*str != 0x84)
    {
        switch (*str)
        {
        case 0x80:  // set font
            str++;
            currFont = *str;
            break;
        case 0x81:
            str++;
            lbl_802F04A8 = *str;
            break;
        case 0x83:
            str++;
            lbl_802F1CE8 = *str / 16.0f;
            break;
        case 0x82:  // set position
            x = (str[1] << 8) | str[2];
            y = (str[3] << 8) | str[4];
            textX = x;
            textStartX = x;
            textY = y;
            str += 4;
            break;
        default:
            bitmap_draw_char(*str);
            break;
        }
        str++;
    }
    prevString = currString;
}

void func_8002704C(void)
{
    int i;
    struct NaomiSpriteParams *params = &spriteParamsBuf[0];

    for (i = 0; i < spriteParamsBufCount; i++, params++)
        draw_naomi_sprite(params);
}
