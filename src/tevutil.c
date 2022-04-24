#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "tevutil.h"

GXColor lbl_802F5A88;

u32 tevutil_init(void)
{
    struct GXCache *_cache;
    GXTevStageID stage;
    GXColor color = {0, 0, 0, 0};

    memset(gxCache, 0, 0x734);
    GXSetZMode(GX_TRUE, GX_LEQUAL, GX_TRUE);
    gxCache->compareEnable = GX_TRUE;
    gxCache->compareFunc = GX_LEQUAL;
    gxCache->updateEnable = GX_TRUE;
    GXSetLineWidth(6, GX_TO_ZERO);
    gxCache->lineWidth = 6;
    _cache = gxCache;
    gxCache->texOffsets = GX_TO_ZERO;
    GXSetCullMode_cached_init(GX_CULL_BACK, _cache);
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

    GXSetColorUpdate_cached_init((u32)GX_TRUE);
    GXSetAlphaUpdate_cached_init((u32)GX_TRUE);
    GXSetZCompLoc_cached_init((u32)GX_TRUE);

    for (stage = GX_TEVSTAGE0; stage < 0x10; stage++) {
        GXSetTevSwapMode_cached_init(stage, GX_TEV_SWAP0, GX_TEV_SWAP0);
        GXSetTevColorIn_cached_init(stage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO);
        GXSetTevAlphaIn_cached_init(stage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO);
        GXSetTevColorOp_cached_init(stage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
        GXSetTevAlphaOp_cached_init(stage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
        GXSetTevOrder_cached_init(stage, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
        GXSetTevKColorSel_cached_init(stage, GX_TEV_KCSEL_1);
        GXSetTevKAlphaSel_cached_init(stage, GX_TEV_KASEL_1);
    }
    return 1;
}

void GXSetCullMode_cached(GXCullMode mode)
{
    if (mode != gxCache->cullMode) {
        GXSetCullMode(mode);
        gxCache->cullMode = mode;
    }
    return;
}

void GXSetCullMode_cached_init(GXCullMode mode, struct GXCache *cache)
{   
    GXSetCullMode(mode);
    gxCache->cullMode = mode;
    return;
}

void GXSetBlendMode_cached(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op)
{
    if (type == GX_BM_LOGIC) {
        if (
            ( (gxCache->blendMode).type != GX_BM_LOGIC) || ((gxCache->blendMode).op != op )
        ) {
            GXSetBlendMode(GX_BM_LOGIC, (gxCache->blendMode).src_factor, (gxCache->blendMode).dst_factor, op);
            (gxCache->blendMode).type = GX_BM_LOGIC;
            (gxCache->blendMode).op = op;
        }
    } else if (
        ( (gxCache->blendMode).type != type || (gxCache->blendMode).src_factor != src_factor ) ||
        (gxCache->blendMode).dst_factor != dst_factor
    )
    {
        GXSetBlendMode(type, src_factor, dst_factor, (gxCache->blendMode).op);
        (gxCache->blendMode).type = type;
        (gxCache->blendMode).src_factor = src_factor;
        (gxCache->blendMode).dst_factor = dst_factor;
    }
    return;
}

void GXSetBlendMode_cached_init(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op)
{
    GXSetBlendMode(type, src_factor, dst_factor, op);
    (gxCache->blendMode).type = type;
    (gxCache->blendMode).src_factor = src_factor;
    (gxCache->blendMode).dst_factor = dst_factor;
    (gxCache->blendMode).op = op;
    return;
}

void GXSetTevSwapModeTable_cached_init(GXTevSwapSel id, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha)
{
    GXTevSwapModeTableCache *_swapModeTable = gxCache->swapModeTable + id;
    
    GXSetTevSwapModeTable(id, red, green, blue, alpha);
    _swapModeTable->r = red;
    _swapModeTable->g = green;
    _swapModeTable->b = blue;
    _swapModeTable->a = alpha;
    return;
}

void GXSetTevSwapMode_cached(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    GXTevswapModeSelCache *_swapModeSel = gxCache->swapModeSel + stage;
    
    if ((_swapModeSel->ras_sel != ras_sel) || (_swapModeSel->tex_sel != tex_sel)) {
        // if something has different
        GXSetTevSwapMode(stage, ras_sel, tex_sel);
        _swapModeSel->ras_sel = ras_sel;
        _swapModeSel->tex_sel = tex_sel;
    }
    return;
}

void GXSetTevSwapMode_cached_init(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    GXTevswapModeSelCache *_swapModeSel = gxCache->swapModeSel + stage;
    
    GXSetTevSwapMode(stage, ras_sel, tex_sel);
    _swapModeSel->ras_sel = ras_sel;
    _swapModeSel->tex_sel = tex_sel;
    return;
}

void GXSetFog_cached(GXFogType type, float startz, float endz, float nearz, float farz, GXColor color)
{    
    if (
        gxCache->fog.type != type ||
        gxCache->fog.color.r != color.r || gxCache->fog.color.g != color.g || gxCache->fog.color.b != color.b || gxCache->fog.color.a != color.a ||
        gxCache->fog.startz != startz || gxCache->fog.endz != endz || 
        gxCache->fog.nearz != nearz || gxCache->fog.farz != farz
    )
    {
        // if something has different
        GXSetFog_cached_init(type, startz, endz, nearz, farz, color);
    }
    return;
}

void GXSetFog_cached_init (GXFogType type, float startz, float endz, float nearz, float farz, GXColor color)
{
    GXSetFog(type, startz, endz, nearz, farz, color);
    gxCache->fog.type = type;
    gxCache->fog.startz = startz;
    gxCache->fog.endz = endz;
    gxCache->fog.nearz = nearz;
    gxCache->fog.farz = farz;
    gxCache->fog.color = color;
    return;
}

void GXSetColorUpdate_cached(u32 update_enable)
{
    if (gxCache->colorUpdate != (GXBool)update_enable) {
        GXSetColorUpdate_cached_init(update_enable);
    }
    return;
}

void GXSetColorUpdate_cached_init(u32 update_enable)
{
    GXSetColorUpdate(update_enable);
    gxCache->colorUpdate = (GXBool)update_enable;
    return;
}

void GXSetAlphaUpdate_cached_init(u32 update_enable)
{
    GXSetAlphaUpdate(update_enable);
    gxCache->alphaUpdate = (GXBool)update_enable;
    return;
}

void GXSetZCompLoc_cached(u32 before_tex)
{
    if (gxCache->zCompare != (GXBool)before_tex) {
        GXSetZCompLoc_cached_init(before_tex);
    }
    return;
}

void GXSetZCompLoc_from_cache(void)
{
    GXSetZCompLoc(gxCache->zCompare);
    return;
}

void GXSetZCompLoc_cached_init(u32 before_tex)
{
    GXSetZCompLoc(before_tex);
    gxCache->zCompare = before_tex;
    return;
}

void GXSetTevColorIn_cached(GXTevStageID stage, s32 a, s32 b, s32 c, s32 d)
{
    GXTevInputCache *_colorInput;

    _colorInput = gxCache->colorInputs + stage;
    if ( _colorInput->a != a || _colorInput->b != b || _colorInput->c != c || _colorInput->d != d)
    {
        // if something has different
        GXSetTevColorIn(stage, a, b, c, d);
        _colorInput->a = a;
        _colorInput->b = b;
        _colorInput->c = c;
        _colorInput->d = d;
    }
    return;
}

void GXSetTevColorIn_cached_init(GXTevStageID stage, s32 a, s32 b, s32 c, s32 d)
{
    GXTevInputCache *_colorInput;

    GXSetTevColorIn(stage, a, b, c, d);
    _colorInput = gxCache->colorInputs + stage;
    _colorInput->a = a;
    _colorInput->b = b;
    _colorInput->c = c;
    _colorInput->d = d;
    return;
}

void GXSetTevAlphaIn_cached(GXTevStageID stage, s32 a, s32 b, s32 c, s32 d)
{
    GXTevInputCache *_alphaInput;

    _alphaInput = gxCache->alphaInputs + stage;
    if (_alphaInput->a != a || _alphaInput->b != b || _alphaInput->c != c || _alphaInput->d != d) 
    {
        // if something has different
        GXSetTevAlphaIn(stage, a, b, c, d);
        _alphaInput->a = a;
        _alphaInput->b = b;
        _alphaInput->c = c;
        _alphaInput->d = d;
    }
    return;
}

void GXSetTevAlphaIn_cached_init(GXTevStageID stage, s32 a, s32 b, s32 c, s32 d)
{
    GXTevInputCache *_alphaInput;

    GXSetTevAlphaIn(stage, a, b, c, d);
    _alphaInput = gxCache->alphaInputs + stage;
    _alphaInput->a = a;
    _alphaInput->b = b;
    _alphaInput->c = c;
    _alphaInput->d = d;
    return;
}

void GXSetTevColorOp_cached(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, u32 clamp, GXTevRegID out_reg)
{
    GXTevOpCache *_colorOp;

    _colorOp = gxCache->colorOperations + stage;
    if (
        _colorOp->reg != out_reg ||
        _colorOp->scale != scale ||
        _colorOp->clamp != (GXBool)clamp ||
        _colorOp->op != op ||
        _colorOp->bias != bias
        ) 
    {
        // if something has different
        GXSetTevColorOp(stage, op, bias, scale, clamp, out_reg);
        _colorOp->op = op;
        _colorOp->bias = bias;
        _colorOp->scale = scale;
        _colorOp->clamp = clamp;
        _colorOp->reg = out_reg;
    }
    return;
}

// TODO: change GXBool to u32
// https://decomp.me/scratch/3HJhF
void GXSetTevColorOp_cached_init(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    GXTevOpCache *_colorOp;

    // TODO: fix paremeters (these must "stage, op, bias, scale, clamp, out_reg")
    GXSetTevColorOp(stage, op, bias, scale);
    _colorOp = gxCache->colorOperations + stage;
    
    _colorOp->op = op;
    _colorOp->bias = bias;
    _colorOp->scale = scale;
    _colorOp->clamp = clamp;
    _colorOp->reg = out_reg;
    return;
}

void GXSetTevAlphaOp_cached(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, u32 clamp, GXTevRegID out_reg)
{
    GXTevOpCache *_alphaOp;

    _alphaOp = gxCache->alphaOperations + stage;
    if (
        _alphaOp->reg != out_reg ||
        _alphaOp->scale != scale ||
        _alphaOp->clamp != (GXBool)clamp ||
        _alphaOp->op != op ||
        _alphaOp->bias != bias
        ) 
    {
        // if something has different
        GXSetTevAlphaOp(stage, op, bias, scale, clamp, out_reg);
        _alphaOp->op = op;
        _alphaOp->bias = bias;
        _alphaOp->scale = scale;
        _alphaOp->clamp = clamp;
        _alphaOp->reg = out_reg;
    }
    return;
}

// TODO: change GXBool to u32
void GXSetTevAlphaOp_cached_init(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    GXTevOpCache *_alphaOp;

    // TODO: fix paremeters (these must "stage, op, bias, scale, clamp, out_reg")
    GXSetTevAlphaOp (stage, op, bias, scale);
    _alphaOp = gxCache->alphaOperations + stage;
    _alphaOp->op = op;
    _alphaOp->bias = bias;
    _alphaOp->scale = scale;
    _alphaOp->clamp = clamp;
    _alphaOp->reg = out_reg;
    return;
}

// I supose this function relates GMATevLayer.fillerC[4]
// SMB2 st138.gma object name call it "TEV", "COMPOSEITE".
void func_8009EA30(GXTevStageID stage, s32 gmaTevOp)
{
    s32 _inoutColor;
    s32 _inputAlpha;
    GXTevInputCache *_input;
    GXTevOpCache *_operation;


    if (stage == 0) {
        _inoutColor = GX_CC_RASC;
        _inputAlpha = GX_CA_RASA;
    } else {
        _inoutColor = GX_CC_CPREV;
        _inputAlpha = GX_CA_APREV;
    }

    switch (gmaTevOp) {
        case 1:
            _input = gxCache->colorInputs + stage;
            if (
                _input->a != _inoutColor ||
                _input->b != GX_CC_TEXC ||
                _input->c != GX_CC_TEXA ||
                _input->d != GX_CC_ZERO
            ) {
                // if ColorInputCache has different
                GXSetTevColorIn(stage, _inoutColor, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
                _input->a = _inoutColor;
                _input->b = GX_CC_TEXC;
                _input->c = GX_CC_TEXA;
                _input->d = GX_CC_ZERO;
            }
    
            _input = gxCache->alphaInputs + stage;
            if (
                _input->a != GX_CA_ZERO ||
                _input->b != GX_CA_ZERO ||
                _input->c != GX_CA_ZERO ||
                _input->d != _inputAlpha
            ) {
                // if AlphaInputCache has different
                GXSetTevAlphaIn(stage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, _inputAlpha);
                _input->a = GX_CA_ZERO;
                _input->b = GX_CA_ZERO;
                _input->c = GX_CA_ZERO;
                _input->d = _inputAlpha;
            }
            break;
        case 0:
            _input = gxCache->colorInputs + stage;
            if (
                _input->a != GX_CC_ZERO ||
                _input->b != GX_CC_TEXC ||
                _input->c != _inoutColor ||
                _input->d != GX_CC_ZERO
            ) {
                // if ColorInputCache has different
                GXSetTevColorIn(stage, GX_CC_ZERO, GX_CC_TEXC, _inoutColor, GX_CC_ZERO);
                _input->a = GX_CC_ZERO;
                _input->b = GX_CC_TEXC;
                _input->c = _inoutColor;
                _input->d = GX_CC_ZERO;
            }
    
            _input = gxCache->alphaInputs + stage;
            if (
                _input->a != GX_CA_ZERO ||
                _input->b != GX_CA_TEXA ||
                _input->c != _inputAlpha ||
                _input->d != GX_CA_ZERO
            ) {
                // if AlphaInputCache has different
                GXSetTevAlphaIn(stage, GX_CA_ZERO, GX_CA_TEXA, _inputAlpha, GX_CA_ZERO);
                _input->a = GX_CA_ZERO;
                _input->b = GX_CA_TEXA;
                _input->c = _inputAlpha;
                _input->d = GX_CA_ZERO;
            }
            break;
        case 3:
            _input = gxCache->colorInputs + stage;
            if (
                _input->a != GX_CC_ZERO ||
                _input->b != GX_CC_ZERO ||
                _input->c != GX_CC_ZERO ||
                _input->d != GX_CC_TEXC
            ) {
                // if ColorInputCache has different
                GXSetTevColorIn(stage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
                _input->a = GX_CC_ZERO;
                _input->b = GX_CC_ZERO;
                _input->c = GX_CC_ZERO;
                _input->d = GX_CC_TEXC;
            }
            
            _input = gxCache->alphaInputs + stage;
            if (
                // if AlphaInputCache has different
                _input->a != GX_CA_ZERO ||
                _input->b != GX_CA_ZERO ||
                _input->c != GX_CA_ZERO ||
                _input->d != GX_CA_TEXA
            ) {
                GXSetTevAlphaIn(stage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
                _input->a = GX_CA_ZERO;
                _input->b = GX_CA_ZERO;
                _input->c = GX_CA_ZERO;
                _input->d = GX_CA_TEXA;
            }
            break;
        case 4:
            _input = gxCache->colorInputs + stage;
            if (
                // if ColorInputCache has different
                _input->a != GX_CC_ZERO ||
                _input->b!= GX_CC_ZERO ||
                _input->c != GX_CC_ZERO ||
                _input->d != _inoutColor
            ) {
                GXSetTevColorIn(stage, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, _inoutColor);
                _input->a = GX_CC_ZERO;
                _input->b = GX_CC_ZERO;
                _input->c = GX_CC_ZERO;
                _input->d = _inoutColor;
            }
            
            _input = gxCache->alphaInputs + stage;
            if (
                // if AlphaInputCache has different
                _input->a != GX_CA_ZERO ||
                _input->b != GX_CA_ZERO ||
                _input->c != GX_CA_ZERO ||
                _input->d != _inputAlpha
            ) {
                GXSetTevAlphaIn(stage, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, _inputAlpha);
                _input->a = GX_CA_ZERO;
                _input->b = GX_CA_ZERO;
                _input->c = GX_CA_ZERO;
                _input->d = _inputAlpha;
            }
            break;
        case 2:
            _input = gxCache->colorInputs + stage;
            if (
                // if ColorInputCache has different
                _input->a != _inoutColor ||
                _input->b != GX_CC_ZERO ||
                _input->c != GX_CC_TEXC ||
                _input->d != GX_CC_TEXC
            ) {
                GXSetTevColorIn(stage, _inoutColor, GX_CC_ZERO, GX_CC_TEXC, GX_CC_TEXC);
                _input->a = _inoutColor;
                _input->b = GX_CC_ZERO;
                _input->c = GX_CC_TEXC;
                _input->d = GX_CC_TEXC;
            }
            
            _input = gxCache->alphaInputs + stage;
            if (
                // if AlphaInputCache has different
                _input->a != GX_CA_ZERO ||
                _input->b != GX_CA_TEXA ||
                _input->c != _inputAlpha ||
                _input->d != GX_CA_ZERO
            ) {
                GXSetTevAlphaIn(stage, GX_CA_ZERO, GX_CA_TEXA, _inputAlpha, GX_CA_ZERO);
                _input->a = GX_CA_ZERO;
                _input->b = GX_CA_TEXA;
                _input->c = _inputAlpha;
                _input->d = GX_CA_ZERO;
            }
            break;
        deafult:
            break;
    }

    _operation = gxCache->colorOperations + stage;
    if (
        _operation->reg != GX_TEVPREV ||
        _operation->scale != GX_CS_SCALE_1 ||
        _operation->clamp != GX_TRUE ||
        _operation->op != GX_TEV_ADD ||
        _operation->bias != GX_TB_ZERO
    ) {
        // if ColorOperationsCache has different
        GXSetTevColorOp(stage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
        _operation->op = GX_TEV_ADD;
        _operation->bias = GX_TB_ZERO;
        _operation->scale = GX_CS_SCALE_1;
        _operation->clamp = GX_TRUE;
        _operation->reg = GX_TEVPREV;
    }

    _operation = gxCache->alphaOperations + stage;
    if (
        _operation->reg != GX_TEVPREV ||
        _operation->scale != GX_CS_SCALE_1 ||
        _operation->clamp != GX_TRUE ||
        _operation->op != GX_TEV_ADD ||
        _operation->bias != GX_TB_ZERO
    ) {
        // if AlphaOperationCache has different
        GXSetTevAlphaOp(stage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
        _operation->op = GX_TEV_ADD;
        _operation->bias = GX_TB_ZERO;
        _operation->scale = GX_CS_SCALE_1;
        _operation->clamp = GX_TRUE;
        _operation->reg = GX_TEVPREV;
    }
}

// 99% match. only register is different.
// https://decomp.me/scratch/7D9s2
#ifdef NONMATCHING
void GXSetTevOrder_cached(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color)
{
    GXTexSize *_texSize;
    GXTevOrderCached *_tevOrder;

    _tevOrder = gxCache->tevOrders + stage;
    if (map >= 8) {
        if (
            _tevOrder->coord != coord ||
            _tevOrder->map != 0xFF ||
            _tevOrder->color != color
        ) {
            GXSetTevOrder(stage, coord, map, color);
            _tevOrder->coord = coord;
            _tevOrder->map = 0xFF;
            _tevOrder->color = color;
            (_tevOrder->texSize).width = 0x0;
            (_tevOrder->texSize).height = 0x0;
        }
    } else {
        _texSize = gxCache->texSizes + stage;
        if (
            _tevOrder->coord != coord ||
            _tevOrder->map != map ||
            _tevOrder->color != color ||
            (_tevOrder->texSize).width != _texSize->width ||
            (_tevOrder->texSize).height != _texSize->height
        ) {
            GXSetTevOrder(stage, coord, map, color);
            _tevOrder->coord = coord;
            _tevOrder->map = map;
            _tevOrder->color = color;
            (_tevOrder->texSize).width = _texSize->width;
            (_tevOrder->texSize).height = _texSize->height;
        }
    }
    return;
}
#else
asm void GXSetTevOrder_cached(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color)
{
    nofralloc
#include "../asm/nonmatchings/GXSetTevOrder_cached.s"
}
#pragma peephole on
#endif

void GXSetTevOrder_cached_init(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color)
{
    GXTevOrderCached *_tevOrder;

    _tevOrder = gxCache->tevOrders + stage;
    GXSetTevOrder(stage, coord, map, color);
    _tevOrder->coord = coord;
    _tevOrder->map = map;
    _tevOrder->color = color;
    (_tevOrder->texSize).width = 0;
    (_tevOrder->texSize).height = 0;
    return;
}

void GXSetTevKColorSel_cached(GXTevStageID stage, GXTevKColorSel sel)
{
    if (gxCache->kColorSels[stage] != sel) {
        GXSetTevKColorSel(stage, sel);
        gxCache->kColorSels[stage] = sel;
    }
    return;
}

void GXSetTevKColorSel_cached_init(GXTevStageID stage, GXTevKColorSel sel)
{
    GXSetTevKColorSel(stage, sel);
    gxCache->kColorSels[stage] = sel;
    return;
}

void GXSetTevKAlphaSel_cached(GXTevStageID stage, GXTevKAlphaSel sel)
{
    if (gxCache->kAlphaSels[stage] != sel) {
        GXSetTevKAlphaSel(stage, sel);
        gxCache->kAlphaSels[stage] = sel;
    }
    return;
}

void GXSetTevKAlphaSel_cached_init(GXTevStageID stage, GXTevKAlphaSel sel)
{
    GXSetTevKAlphaSel(stage, sel);
    gxCache->kAlphaSels[stage] = sel;
    return;
}


void GXSetNumTevStages_cached(u8 nStages)
{
    if (gxCache->kColor.numTevStages != nStages) {
        GXSetNumTevStages(nStages);
        (gxCache->kColor).numTevStages = nStages;
    }
    return;
}


void GXSetNumTevStages_from_cache(void) {
    GXSetNumTevStages((gxCache->kColor).numTevStages);
    return;
}

void GXSetTevKColor_cached(GXTevKColorID id, GXColor color)
{
    if (
        ( (gxCache->kColor).colors[id] ).r != color.r ||
        ( (gxCache->kColor).colors[id] ).g != color.g ||
        ( (gxCache->kColor).colors[id] ).b != color.b ||
        ( (gxCache->kColor).colors[id] ).a != color.a
    ) {
        // if something has different
        GXSetTevKColor(id, color);
        (gxCache->kColor).colors[id] = color;
    }
    return;
}

void GXSetTevKColor_cached_init(GXTevKColorID id, GXColor color)
{
    GXSetTevKColor(id, color);
    (gxCache->kColor).colors[id] = color;
    return;
}

void GXLoadTexObj_cached(GXTexObj *obj, GXTexMapID id)
{
    GXTexSize *_texSize;

    _texSize = gxCache->texSizes + id;
    _texSize->width = GXGetTexObjWidth(obj);
    _texSize->height = GXGetTexObjHeight(obj);
    GXLoadTexObj(obj, id);
    return;
}