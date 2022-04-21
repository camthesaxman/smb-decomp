#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "tevutil.h"

GXColor lbl_802F5A88;

u32 tevutil_init(void) {
    struct ZMode *_ZMode;
    GXTevStageID stage;
    GXColor color = {0, 0, 0, 0};

    memset(zMode, 0, 0x734);
    GXSetZMode(1, GX_LEQUAL, 1);
    zMode->compareEnable = GX_TRUE;
    zMode->compareFunc = GX_LEQUAL;
    zMode->updateEnable = GX_TRUE;
    GXSetLineWidth(6, GX_TO_ZERO);
    zMode->lineWidth = 6;
    _ZMode = zMode;
    zMode->texOffsets = GX_TO_ZERO;
    GXSetCullMode_cached_init(GX_CULL_BACK, _ZMode);
    GXSetBlendMode_cached_init(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
    GXSetTevSwapModeTable_cached_init(GX_TEV_SWAP0, GX_CH_RED, GX_CH_GREEN, GX_CH_BLUE, GX_CH_ALPHA);
    GXSetTevSwapModeTable_cached_init(GX_TEV_SWAP1, GX_CH_RED, GX_CH_GREEN, GX_CH_BLUE, GX_CH_RED);
    GXSetTevSwapModeTable_cached_init(GX_TEV_SWAP2,GX_CH_RED, GX_CH_GREEN, GX_CH_BLUE, GX_CH_GREEN);
    GXSetTevSwapModeTable_cached_init(GX_TEV_SWAP3, GX_CH_RED, GX_CH_GREEN, GX_CH_BLUE, GX_CH_BLUE);

    GXSetTevKColor_cached_init(GX_KCOLOR0, color);
    GXSetTevKColor_cached_init(GX_KCOLOR1, color);
    GXSetTevKColor_cached_init(GX_KCOLOR2, color);
    GXSetTevKColor_cached_init(GX_KCOLOR3, color);
    GXSetFog_cached_init(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, color);

    GXSetColorUpdate_cached_init(1);
    GXSetAlphaUpdate_cached_init(1);
    GXSetZCompLoc_cached_init(1);

    for (stage = GX_TEVSTAGE0; stage < 0x10; stage++) {
        GXSetTevSwapMode_cached_init(stage, GX_TEV_SWAP0, GX_TEV_SWAP0);
        GXSetTevColorIn_cached_init(stage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO);
        GXSetTevAlphaIn_cached_init(stage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO);
        GXSetTevColorOp_cached_init(stage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1, GX_TEVPREV);
        GXSetTevAlphaOp_cached_init(stage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1, GX_TEVPREV);
        GXSetTevOrder_cached_init(stage, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
        GXSetTevKColorSel_cached_init(stage, GX_TEV_KCSEL_1);
        GXSetTevKAlphaSel_cached_init(stage, GX_TEV_KASEL_1);
    }
    return 1;
}

void GXSetCullMode_cached(GXCullMode mode)
{
    if (mode != zMode->cullMode) {
        GXSetCullMode(mode);
        zMode->cullMode = mode;
    }
    return;
}

void GXSetCullMode_cached_init(GXCullMode mode, struct ZMode *_ZMode)
{   
    GXSetCullMode(mode);
    zMode->cullMode = mode;
    return;
}

void GXSetBlendMode_cached(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op)
{
    if (type == GX_BM_LOGIC) {
        if (((zMode->blendMode).type != GX_BM_LOGIC) || ((zMode->blendMode).op != op))
        {
            GXSetBlendMode(GX_BM_LOGIC, (zMode->blendMode).src_factor, (zMode->blendMode).dst_factor, op);
            (zMode->blendMode).type = GX_BM_LOGIC;
            (zMode->blendMode).op = op;
        }
    }
    else if ((((zMode->blendMode).type != type) ||
           ((zMode->blendMode).src_factor != src_factor)) ||
          ((zMode->blendMode).dst_factor != dst_factor)) {
        GXSetBlendMode(type, src_factor, dst_factor, (zMode->blendMode).op);
        (zMode->blendMode).type = type;
        (zMode->blendMode).src_factor = src_factor;
        (zMode->blendMode).dst_factor = dst_factor;
    }
    return;
}

void GXSetBlendMode_cached_init(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op)
{
    GXSetBlendMode(type, src_factor, dst_factor, op);
    (zMode->blendMode).type = type;
    (zMode->blendMode).src_factor = src_factor;
    (zMode->blendMode).dst_factor = dst_factor;
    (zMode->blendMode).op = op;
    return;
}

void GXSetTevSwapModeTable_cached_init(GXTevSwapSel id, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha)
{
    GXTevSwapModeTableCache *_swapModeTable = zMode->swapModeTable + id;
    
    GXSetTevSwapModeTable(id);
    _swapModeTable->r = red;
    _swapModeTable->g = green;
    _swapModeTable->b = blue;
    _swapModeTable->a = alpha;
    return;
}

void GXSetTevSwapMode_cached(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    GXTevswapModeSelCache *_swapModeSel = zMode->swapModeSel + stage;
    
    if ((_swapModeSel->ras_sel != ras_sel) || (_swapModeSel->tex_sel != tex_sel)) {
        // if something has differnt
        GXSetTevSwapMode(stage, ras_sel, tex_sel);
        _swapModeSel->ras_sel = ras_sel;
        _swapModeSel->tex_sel = tex_sel;
    }
    return;
}

void GXSetTevSwapMode_cached_init(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    GXTevswapModeSelCache *_swapModeSel = zMode->swapModeSel + stage;
    
    GXSetTevSwapMode(stage);
    _swapModeSel->ras_sel = ras_sel;
    _swapModeSel->tex_sel = tex_sel;
    return;
}

void GXSetFog_cached(GXFogType type, float startz, float endz, float nearz, float farz, GXColor color)
{    
    if (
        zMode->fog.type != type ||
        zMode->fog.color.r != color.r || zMode->fog.color.g != color.g || zMode->fog.color.b != color.b || zMode->fog.color.a != color.a ||
        zMode->fog.startz != startz || zMode->fog.endz != endz || 
        zMode->fog.nearz != nearz || zMode->fog.farz != farz
    )
    {
        // if something has differnt
        GXSetFog_cached_init(type, startz, endz, nearz, farz, color);
    }
    return;
}

void GXSetFog_cached_init (GXFogType type, float startz, float endz, float nearz, float farz, GXColor color)
{
    GXSetFog(type, startz, endz, nearz, farz, color);
    zMode->fog.type = type;
    zMode->fog.startz = startz;
    zMode->fog.endz = endz;
    zMode->fog.nearz = nearz;
    zMode->fog.farz = farz;
    zMode->fog.color = color;
    return;
}

void GXSetColorUpdate_cached(GXBool update_enable) {
    if (zMode->colorUpdate != update_enable) {
        GXSetColorUpdate_cached_init(update_enable);
    }
    return;
}

void GXSetColorUpdate_cached_init(GXBool update_enable) {
    GXSetColorUpdate();
    zMode->colorUpdate = update_enable;
}

void GXSetAlphaUpdate_cached_init(GXBool update_enable) {
    GXSetAlphaUpdate();
    zMode->alphaUpdate = update_enable;
}

void GXSetZCompLoc_cached(GXBool before_tex) {
    if (zMode->zCompare != before_tex) {
        GXSetZCompLoc_cached_init(before_tex);
    }
    return;
}

void GXSetZCompLoc_from_cache(void) {
    GXSetZCompLoc(zMode->zCompare);
}

void GXSetZCompLoc_cached_init(GXBool before_tex) {
    GXSetZCompLoc();
    zMode->zCompare = before_tex;
}
