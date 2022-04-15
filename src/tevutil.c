#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "tevutil.h"

// u32 lbl_802F5A88 = 0;
// float lbl_802F5A8C = 0.0;
// float lbl_802F5A90 = 100.0;
// float lbl_802F5A94 = 0.1;
// float lbl_802F5A98 = 20000.0;

// TDOO: decomp this
// u32 tevutil_init(void) 
// {
//     GXTevStageID stage;
//     GXColor *local_c;
//     GXColor *local_10;
//     GXColor *local_14;
//     GXColor *local_18;
//     GXColor *local_1c;
//     GXColor *local_20;
    
//     local_c = lbl_802F5A88;
    
//     memset(zMode, 0x00, 0x734);
//     GXSetZMode(1, 3, 1);
//     zMode->compareEnable = GX_TRUE;
//     zMode->compareFunc = GX_LEQUAL;
//     zMode->updateEnable = GX_TRUE;
//     GXSetLineWidth(6, 0);
//     zMode->lineWidth = 6;
//     zMode->texOffsets = 0;
    
//     func_8009E0DC(2);
//     func_8009E200(0, 1, 0, 0);
//     func_8009E270(0, 0, 1, 2, 3);
//     func_8009E270(1, 0, 1, 2, 0);
//     func_8009E270(2, 0, 1, 2, 1);
//     func_8009E270(3, 0, 1, 2, 2);

//     //
//     local_10 = local_c;
//     func_8009F3D8(0, local_10);
//     local_14 = local_c;
//     func_8009F3D8(1, &local_14);
//     local_18 = local_c;
//     func_8009F3D8(2, &local_18);
//     local_1c = local_c;
//     func_8009F3D8(3, &local_1c);
//     local_20 = local_c;
//     func_8009E444(
//         lbl_802F5A8C, lbl_802F5A90, lbl_802F5A94, lbl_802F5A98, 
//         0, &local_20);
//     //
    
//     func_8009E520(1);
//     func_8009E554(1);
//     func_8009E5E4(1);
    
//     for (stage = 0; stage < 0x10; stage++) {
//         func_8009E340(stage, 0, 0);
//         func_8009E6B0(stage, 0xf, 0xf, 0xf, 0xf);
//         func_8009E7A4(stage, 7, 7, 7, 7);
//         func_8009E8B4(stage, 0, 0, 0, 1, 0);
//         func_8009E9CC(stage, 0, 0, 0, 1, 0);
//         func_8009F10C(stage, 0, 0, 4);
//         func_8009F1DC(stage, 0);
//         func_8009F280(stage, 0);
//     }
    
//     return 1;
// }

void GXSetCullMode_cached(GXCullMode mode)
{
    if (mode != zMode->unk0x10) {
        GXSetCullMode(mode);
        zMode->unk0x10 = mode;
    }
    return;
}

void GXSetCullMode_cached_init(GXCullMode mode)
{   
    GXSetCullMode(mode);
    zMode->unk0x10 = mode;
    return;
}

void GXSetBlendMode_cached(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op)
{
    if (type == GX_BM_LOGIC) {
        if (((zMode->unk0x14).unk0x00 != GX_BM_LOGIC) || ((zMode->unk0x14).unk0x0C != op))
        {
            GXSetBlendMode(GX_BM_LOGIC, (zMode->unk0x14).unk0x04, (zMode->unk0x14).unk0x08, op);
            (zMode->unk0x14).unk0x00 = GX_BM_LOGIC;
            (zMode->unk0x14).unk0x0C = op;
        }
    }
    else if ((((zMode->unk0x14).unk0x00 != type) ||
           ((zMode->unk0x14).unk0x04 != src_factor)) ||
          ((zMode->unk0x14).unk0x08 != dst_factor)) {
        GXSetBlendMode(type, src_factor, dst_factor, (zMode->unk0x14).unk0x0C);
        (zMode->unk0x14).unk0x00 = type;
        (zMode->unk0x14).unk0x04 = src_factor;
        (zMode->unk0x14).unk0x08 = dst_factor;
    }
    return;
}

void GXSetBlendMode_cached_init(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op)
{
    GXSetBlendMode(type, src_factor, dst_factor, op);
    (zMode->unk0x14).unk0x00 = type;
    (zMode->unk0x14).unk0x04 = src_factor;
    (zMode->unk0x14).unk0x08 = dst_factor;
    (zMode->unk0x14).unk0x0C = op;
    return;
}

void GXSetTevSwapModeTable_cached_init(GXTevSwapSel id, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha)
{
    ZMode_child_0x24 *child_0x24 = zMode->unk0x24 + id;
    
    GXSetTevSwapModeTable(id);
    child_0x24->unk0x00 = red;
    child_0x24->unk0x04 = green;
    child_0x24->unk0x08 = blue;
    child_0x24->unk0x0C = alpha;
    
    return;
}

void GXSetTevSwapMode_cached(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    ZMode_child_0x64 *child_0x64 = zMode->unk0x64 + stage;
    
    if ((child_0x64->unk0x00 != ras_sel) || (child_0x64->unk0x04 != tex_sel)) {
        GXSetTevSwapMode(stage, ras_sel, tex_sel);
        child_0x64->unk0x00 = ras_sel;
        child_0x64->unk0x04 = tex_sel;
    }
    return;
}

void GXSetTevSwapMode_cached_init(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    ZMode_child_0x64 *child_0x64 = zMode->unk0x64 + stage;
    
    GXSetTevSwapMode(stage);
    child_0x64->unk0x00 = ras_sel;
    child_0x64->unk0x04 = tex_sel;
    return;
}

// void GXSetFog_cached(GXFogType type, float startz, float endz, float nearz, float farz, GXColor color)
// {
//     GXColor _color;
    
//     if (
//         zMode->unk0x84[0].unk0x60 != type ||
//         zMode->unk0x84[0].unk0x74.r != color.r || zMode->unk0x84[0].unk0x74.g != color.g || zMode->unk0x84[0].unk0x74.b != color.b || zMode->unk0x84[0].unk0x74.a != color.a ||
//         zMode->unk0x84[0].unk0x64 != startz || zMode->unk0x84[0].unk0x68 != endz || 
//         zMode->unk0x84[0].unk0x6C != nearz || zMode->unk0x84[0].unk0x70 != farz
//     )
//     {
//         // not much something 
//         _color = color;
//         func_8009E444(startz, endz, nearz, farz, type, &_color);
//     }
//     return;
// }

