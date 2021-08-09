#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"

// TODO: avoid duplicate FontData symbol name
#define FontData lbl_802F21D4

typedef enum
{
    DMTF_POINTSAMPLE,
    DMTF_BILERP,
} DMTexFlt;

typedef enum
{
    DM_FT_OPQ,
    DM_FT_RVS,
    DM_FT_XLU,
} DMFontType;

#define static
#define inline

// bss
GXTexObj fontTexObj;

// sbss
s16 FontSpace;
s16 FontSize;
void *LastSheet;
static OSFontHeader *FontData;
s32 fontShift;

static inline void DEMOSetFontType(s32 attr)
{
    // Font type
    switch (attr)
    {
    case DM_FT_RVS:
        // Reverse mode
        GXSetBlendMode( GX_BM_LOGIC, GX_BL_ZERO, GX_BL_ZERO, GX_LO_INVCOPY );
        break;
    case DM_FT_XLU:
        // Translucent mode
        GXSetBlendMode( GX_BM_BLEND, GX_BL_ONE, GX_BL_ONE, GX_LO_CLEAR );
        break;
    case DM_FT_OPQ:
     default:
        // Normal mode
        GXSetBlendMode( GX_BM_BLEND, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR );
        break;
    }
}

static inline void DEMOLoadFont(GXTexMapID texMap, GXTexMtx texMtx, DMTexFlt texFlt, GXTexObj *texObj)
{
    Mtx         fontTMtx;
    u16         width  = 64;
    u16         height = (0x80-0x20)*8*8 / width;

    // set up and load texture object
    GXInitTexObj(texObj,          // obj
                 DEMOFontBitmap,  // image_ptr
                 width,           // wight
                 height,          // height
                 GX_TF_I4,        // format
                 GX_CLAMP,        // wrap_s      (don't care)
                 GX_CLAMP,        // wrap_t      (don't care)
                 GX_FALSE);       // mipmap      (don't care)

    fontShift = 1;

    if (texFlt == DMTF_POINTSAMPLE)
    {    
        GXInitTexObjLOD(texObj,       // obj
                        GX_NEAR,      // min_filt
                        GX_NEAR,      // max_filt
                        0.0f,         // min_lod     (don't care)
                        0.0f,         // max_lod     (don't care)
                        0.0f,         // lod_bias    (don't care)
                        GX_DISABLE,   // bias_clamp  (don't care)
                        GX_FALSE,     // do_edge_lod (don't care)
                        GX_ANISO_1);  // max_aniso   (don't care)
        fontShift = 0;
    
    }
    else
    {
        // dead code
        fontShift = 1;
    }

    GXLoadTexObj(&fontTexObj, texMap);

    C_MTXScale(fontTMtx, 1.0f/(float)(64 - !fontShift), 1.0f/(float)(96 - !fontShift), 1.0f);

    GXLoadTexMtxImm(fontTMtx, texMtx, GX_MTX2x4);
    GXSetNumTexGens(1);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
}

static inline void DEMOSetupScrnSpc(s32 width, s32 height, float depth)
{
    Mtx44 pMtx;
    Mtx mMtx;

    C_MTXOrtho(pMtx, 0.0f, (float)height, 0.0f, (float)width, 0.0f, -depth);
    GXSetProjection(pMtx, GX_ORTHOGRAPHIC);
    PSMTXIdentity(mMtx);
    GXLoadPosMtxImm(mMtx, GX_PNMTX0);
    GXSetCurrentMtx(GX_PNMTX0);
}

void DEMOInitCaption(s32 font_type, s32 width, s32 height)
{
    GXTexObj *texObj = &fontTexObj;
    // Set matrices
    DEMOSetupScrnSpc(width, height, 100.0f);

    // Set pixel processing mode
    GXSetZMode(GX_ENABLE, GX_ALWAYS, GX_ENABLE);

    // Set TEV parameters to "REPLACE COLOR"
    GXSetNumChans(0);
    GXSetNumTevStages(1);
    GXSetTevOp(GX_TEVSTAGE0, GX_REPLACE);
    GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);

    // Load Font
    DEMOLoadFont(GX_TEXMAP0, GX_TEXMTX0, DMTF_POINTSAMPLE, texObj);

    // Set font attr to normal
    DEMOSetFontType(font_type);
}

OSFontHeader *DEMOInitROMFont(void)
{
    if (OSGetFontEncode() == OS_FONT_ENCODE_SJIS)
        FontData = OSAlloc(OS_FONT_SIZE_SJIS);
    else
        FontData = OSAlloc(OS_FONT_SIZE_ANSI);

    if (FontData == NULL)
        OSPanic("DEMOPuts.c", 413, "Ins. memory to load ROM font.");
    if (!OSInitFont(FontData))
        OSPanic("DEMOPuts.c", 417, "ROM font is available in boot ROM ver 0.8 or later.");

    FontSize = FontData->cellWidth * 16;
    FontSpace = -16;

    return FontData;
}

void DEMOSetROMFontSize(s16 size, s16 space)
{
    FontSize = size * 16;
    FontSpace = space * 16;
}

void DrawFontChar(int x, int y, int z, int xChar, int yChar)
{
    s16 posLeft   = x;
    s16 posRight  = posLeft + (FontSize * FontData->cellWidth) / FontData->cellWidth;
    s16 posBottom = y;
    s16 posTop    = y - (FontData->cellHeight * ((FontData->cellHeight * FontSize) / FontData->cellWidth)) / FontData->cellHeight;
    s16 texLeft   = xChar;
    s16 texTop    = yChar;
    s16 texRight  = xChar + FontData->cellWidth;
    s16 texBottom = yChar + FontData->cellHeight;

    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3s16(posLeft, posTop, z);
        GXTexCoord2s16(texLeft, texTop);

        GXPosition3s16(posRight, posTop, z);
        GXTexCoord2s16(texRight, texTop);

        GXPosition3s16(posRight, posBottom, z);
        GXTexCoord2s16(texRight, texBottom);

        GXPosition3s16(posLeft, posBottom, z);
        GXTexCoord2s16(texLeft, texBottom);
    GXEnd();
}

static inline void LoadSheet(void* image, GXTexMapID texMapID)
{
    Mtx      mtx;
    GXTexObj texObj;

    if (LastSheet == image)
        return;

    LastSheet = image;

    // Set up and load texture object
    GXInitTexObj(&texObj,                           // obj
                 image,                             // image_ptr
                 FontData->sheetWidth,              // wight
                 FontData->sheetHeight,             // height
                 (GXTexFmt) FontData->sheetFormat,  // format
                 GX_CLAMP,                          // wrap_s (don't care)
                 GX_CLAMP,                          // wrap_t (don't care)
                 GX_FALSE);                         // mipmap (don't care)

    GXInitTexObjLOD(&texObj,
                    GX_LINEAR,     // min_filt
                    GX_LINEAR,     // max_filt
                    0.0f,          // min_lod     (don't care)
                    0.0f,          // max_lod     (don't care)
                    0.0f,          // lod_bias    (don't care)
                    GX_DISABLE,    // bias_clamp  (don't care)
                    GX_FALSE,      // do_edge_lod (don't care)
                    GX_ANISO_1);   // max_aniso   (don't care)

    GXLoadTexObj(&texObj, texMapID);
    C_MTXScale(mtx, 1.0f / FontData->sheetWidth,
                  1.0f / FontData->sheetHeight,
                  1.0f);
    GXLoadTexMtxImm(mtx, GX_TEXMTX0, GX_MTX2x4);
    GXSetNumTexGens(1);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
}

int DEMORFPuts(s16 x, s16 y, s16 z, char* string)
{
    s32   cx;
    void *image;
    s32   xChar;
    s32   yChar;
    s32   width;

    LastSheet = 0;

    // Set up vertex descriptors
    GXClearVtxDesc();
    GXSetVtxDesc(GX_VA_POS,  GX_DIRECT);
    GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS,  GX_POS_XYZ, GX_S16, 4);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST,  GX_S16, 0);

    // Convert to GX_S16, 4 format
    x *= 16;
    y *= 16;
    z *= 16;

    width = 0;
    while (*string != 0)
    {
        if (*string == '\n')
        {
            width = 0;
            y += FontData->leading * 16;
            ++string;
            continue;
        }

        string = OSGetFontTexture(string, &image, &xChar, &yChar, &cx);

        LoadSheet(image, GX_TEXMAP0);
        DrawFontChar(x + width, y, z, xChar, yChar);
        width += FontSize * cx / FontData->cellWidth + FontSpace;
    }
    return (width + 15) / 16;
}

void DEMORFPrintf(s16 x, s16 y, s16 z, char *fmt, ...)
{
    va_list  vlist;
    char     buf[256];

    // Get output string
    va_start(vlist, fmt);
    vsprintf(buf, fmt, vlist);
    va_end(vlist);

    // Feed to puts
    DEMORFPuts(x, y, z, buf);
}

// unused
char* DEMODumpROMFont(char* string)
{
    u32   image[48/2*48/4];   // 48 x 48
    void* temp;
    int   i, j;
    s32   width;

    ASSERT(FontData);

    if (OSGetFontEncode() == OS_FONT_ENCODE_SJIS)
    {
        temp = (u8*) FontData + OS_FONT_SIZE_SJIS - OS_FONT_ROM_SIZE_SJIS;
    }
    else
    {
        temp = (u8*) FontData + OS_FONT_SIZE_ANSI - OS_FONT_ROM_SIZE_ANSI;
    }
    temp = (void*) OSRoundDown32B(temp);
    OSLoadFont(FontData, temp);

    // Clear image buffer by zero since OSGetFontTexel() copies out
    // font texels using logical OR.
    memset(image, 0x00, sizeof(image));

    // OSGetFontTexel() only works with the compressed font data
    // read by OSLoadFont().
    string = OSGetFontTexel(string, image, 0, 48 / 4, &width);

    for (i = 0; i < 48; i++)
    {
        j = 48 * (i / 8) + (i % 8);
        OSReport("%08x%08x%08x%08x%08x%08x\n",
                 image[j],        image[j + 32/4],  image[j + 64/4],
                 image[j + 96/4], image[j + 128/4], image[j + 160/4]);
    }

    OSReport("\nwidth %d\n", width);

    OSInitFont(FontData);   // To re-expand compressed data

    return string;
}

int DEMOGetRFTextWidth(char *string)
{
    s32 width;
    s32 cx = 0;

    while (*string != 0)
    {
        string = OSGetFontWidth(string, &width);
        cx += FontSize * width / FontData->cellWidth + FontSpace;
    }
    return (cx + 15) / 16;
}

void func_800A5704(void)
{
    OSFree(FontData);
    FontData = NULL;
}
