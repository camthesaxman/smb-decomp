#ifndef _SRC_GXCACHE_H_
#define _SRC_GXCACHE_H_

#include <dolphin/gx.h>

typedef struct
{
    GXBlendMode type;
    GXBlendFactor src_factor;
    GXBlendFactor dst_factor;
    GXLogicOp op;
} GXTevBlendModeCache;

typedef struct
{
    GXTevColorChan r;
    GXTevColorChan g;
    GXTevColorChan b;
    GXTevColorChan a;
} GXTevSwapModeTableCache;

typedef struct
{
    GXTevSwapSel ras_sel;
    GXTevSwapSel tex_sel;
} GXTevswapModeSelCache;

typedef struct
{
    GXFogType type;
    float startz;
    float endz;
    float nearz;
    float farz;
    GXColor color;
} GXFogCache;

typedef struct
{
    s32 a;
    s32 b;
    s32 c;
    s32 d;
} GXTevInputCache;

typedef struct {
    GXTevOp op;
    GXTevBias bias;
    GXTevScale scale;
    GXBool clamp;
    GXTevRegID reg;
} GXTevOpCache;

typedef struct {
    u16 width;
    u16 height;
} GXTexSize;

typedef struct {
    GXTexCoordID coord;
    GXTexMapID map;
    GXChannelID color;
    GXTexSize texSize;
} GXTevOrderCached;

typedef struct {
    u8 numTevStages;
    GXColor colors[4];
    u8 filler11[1];
} GXTevKColorCached;

struct GXCache
{
    /*0x000*/ GXBool compareEnable;
    /*0x004*/ GXCompare compareFunc;
    /*0x008*/ GXBool updateEnable;
    /*0x009*/ u8 lineWidth;
    /*0x00C*/ s32 texOffsets;
    /*0x010*/ s32 cullMode;
    /*0x014*/ GXTevBlendModeCache blendMode;
    /*0x024*/ GXTevSwapModeTableCache swapModeTable[4];
    /*0x064*/ GXTevswapModeSelCache swapModeSel[16];
    /*0x0E4*/ GXFogCache fog;
    /*0x0FC*/ GXBool colorUpdate;
    /*0x0FD*/ GXBool alphaUpdate;
    /*0x0FE*/ GXBool zCompare;
    /*0x0FF*/ u8 unkFF;
    /*0x100*/ GXTevInputCache colorInputs[16];
    /*0x200*/ GXTevInputCache alphaInputs[16];
    /*0x300*/ GXTevOpCache colorOperations[16];
    /*0x440*/ GXTevOpCache alphaOperations[16];
    /*0x580*/ GXTevOrderCached tevOrders[16];
    /*0x680*/ s32 kColorSels[16];
    /*0x6C0*/ s32 kAlphaSels[16];
    /*0x700*/ GXTevKColorCached kColor;
    /*0x712*/ GXTexSize texSizes[8];
    /*0x732*/ u8 filler732[0x734-0x732];
};

u32 gxcache_init(void);
void GXSetCullMode_cached(GXCullMode mode);
void GXSetCullMode_cached_init(GXCullMode mode, struct GXCache *_cache);
void GXSetBlendMode_cached(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
void GXSetBlendMode_cached_init(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
void GXSetTevSwapModeTable_cached_init(GXTevSwapSel id, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha);
void GXSetTevSwapMode_cached(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel);
void GXSetTevSwapMode_cached_init(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel);
void GXSetFog_cached(GXFogType type, float startz, float endz, float nearz, float farz, GXColor color);
void GXSetFog_cached_init(GXFogType type, float startz, float endz, float nearz, float farz, GXColor color);
void GXSetColorUpdate_cached(GXBool update_enable);
void GXSetColorUpdate_cached_init(GXBool update_enable);
void GXSetAlphaUpdate_cached_init(GXBool update_enable);
void GXSetZCompLoc_cached(GXBool before_tex);
void GXSetZCompLoc_from_cache(void);
void GXSetZCompLoc_cached_init(GXBool before_tex);
void GXSetTevColorIn_cached(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d);
void GXSetTevColorIn_cached_init(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d);
void GXSetTevAlphaIn_cached(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d);
void GXSetTevAlphaIn_cached_init(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d);
void GXSetTevColorOp_cached(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
void GXSetTevColorOp_cached_init(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
void GXSetTevAlphaOp_cached(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
void GXSetTevAlphaOp_cached_init(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
void GXSetTevOp_cached(GXTevStageID stage, s32 mode);
void GXSetTevOrder_cached(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color);
void GXSetTevOrder_cached_init(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color);
void GXSetTevKColorSel_cached(GXTevStageID stage, GXTevKColorSel sel);
void GXSetTevKColorSel_cached_init(GXTevStageID stage, GXTevKColorSel sel);
void GXSetTevKAlphaSel_cached(GXTevStageID stage, GXTevKAlphaSel sel);
void GXSetTevKAlphaSel_cached_init(GXTevStageID stage, GXTevKAlphaSel sel);
void GXSetNumTevStages_cached(u8 nStages);
void GXSetNumTevStages_from_cache(void);
void GXSetTevKColor_cached(GXTevKColorID id, GXColor color);
void GXSetTevKColor_cached_init(GXTevKColorID id, GXColor color);
void GXLoadTexObj_cached(GXTexObj *obj, GXTexMapID id);

#define GXSetZMode_cached(compEnable, compFunc, updEnable) \
do                                                         \
{                                                          \
    if (updEnable  != gxCache->updateEnable                \
     || compFunc   != gxCache->compareFunc                 \
     || compEnable != gxCache->compareEnable)              \
    {                                                      \
        GXSetZMode(compEnable, compFunc, updEnable);       \
        gxCache->compareEnable = compEnable;               \
        gxCache->compareFunc   = compFunc;                 \
        gxCache->updateEnable  = updEnable;                \
    }                                                      \
} while (0)

#define GXSetZMode_cached_init(compEnable, compFunc, updEnable) \
do                                                              \
{                                                               \
	GXSetZMode(compEnable, compFunc, updEnable);                \
	gxCache->compareEnable = compEnable;                        \
	gxCache->compareFunc   = compFunc;                          \
	gxCache->updateEnable  = updEnable;                         \
} while (0)

#endif
