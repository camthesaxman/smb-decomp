#include <stdint.h>

#include <GL/gl.h>

#include <stdio.h>
#include <dolphin.h>

/* Transform */

void GXSetProjection(f32 mtx[4][4], GXProjectionType type)
{
    puts("GXSetProjection is a stub");
}

void GXGetProjectionv(f32 *p)
{
    puts("GXGetProjectionv is a stub");
}

void GXSetViewportJitter(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz, u32 field)
{
    puts("GXSetViewportJitter is a stub");
}

void GXLoadPosMtxImm(f32 mtx[3][4], u32 id)
{
    puts("GXLoadPosMtxImm is a stub");
}

void GXLoadNrmMtxImm(f32 mtx[3][4], u32 id)
{
    puts("GXLoadNrmMtxImm is a stub");
}

void GXSetCurrentMtx(u32 id)
{
    puts("GXSetCurrentMtx is a stub");
}

void GXLoadTexMtxImm(f32 mtx[][4], u32 id, GXTexMtxType type)
{
    puts("GXLoadTexMtxImm is a stub");
}

void GXSetViewport(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz)
{
    puts("GXSetViewport is a stub");
}

void GXSetScissor(u32 left, u32 top, u32 wd, u32 ht)
{
    puts("GXSetScissor is a stub");
}

/* Tev */

void GXSetTevOp(GXTevStageID id, GXTevMode mode)
{
    puts("GXSetTevOp is a stub");
}

void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1)
{
    puts("GXSetAlphaCompare is a stub");
}

void GXSetTevColorIn(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d)
{
    puts("GXSetTevColorIn is a stub");
}

void GXSetTevAlphaIn(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d)
{
    puts("GXSetTevAlphaIn is a stub");
}

void GXSetTevColorOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    puts("GXSetTevColorOp is a stub");
}

void GXSetTevAlphaOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    puts("GXSetTevAlphaOp is a stub");
}

void GXSetTevColor(GXTevRegID id, GXColor color)
{
    puts("GXSetTevColor is a stub");
}

void GXSetTevKColor(GXTevKColorID id, GXColor color)
{
    puts("GXSetTevKColor is a stub");
}

void GXSetTevKColorSel(GXTevStageID stage, GXTevKColorSel sel)
{
    puts("GXSetTevKColorSel is a stub");
}

void GXSetTevKAlphaSel(GXTevStageID stage, GXTevKAlphaSel sel)
{
    puts("GXSetTevKAlphaSel is a stub");
}

void GXSetTevSwapMode(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    puts("GXSetTevSwapMode is a stub");
}

void GXSetTevSwapModeTable(GXTevSwapSel table, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha)
{
    puts("GXSetTevSwapModeTable is a stub");
}

void GXSetTevOrder(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color)
{
    puts("GXSetTevOrder is a stub");
}

void GXSetNumTevStages(u8 nStages)
{
    puts("GXSetNumTevStages is a stub");
}

/* Geometry */

void __GXSetDirtyState(void)
{
    puts("__GXSetDirtyState is a stub");
}

void GXBegin(GXPrimitive type, GXVtxFmt vtxfmt, u16 nverts)
{
    puts("GXBegin is a stub");
}

void GXSetLineWidth(u8 width, GXTexOffset texOffsets)
{
    puts("GXSetLineWidth is a stub");
}

void GXSetCullMode(GXCullMode mode)
{
    puts("GXSetCullMode is a stub");
}

/* DisplayList */

void GXBeginDisplayList(void *list, u32 size)
{
    puts("GXBeginDisplayList is a stub");
}

u32 GXEndDisplayList(void)
{
    puts("GXEndDisplayList is a stub");
    return 0;
}

void GXCallDisplayList(void *list, u32 nbytes)
{
    puts("GXCallDisplayList is a stub");
}

/* Fifo */

static GXFifoObj *GPFifo;
static GXFifoObj *CPUFifo;

void GXInitFifoBase(GXFifoObj *fifo, void *base, u32 size)
{
    puts("GXInitFifoBase is a stub");
}

void GXInitFifoPtrs(GXFifoObj *fifo, void *readPtr, void *writePtr)
{
    puts("GXInitFifoPtrs is a stub");
}

void GXSetCPUFifo(GXFifoObj *fifo)
{
    puts("GXSetCPUFifo is a stub");
    CPUFifo = fifo;
}

void GXSetGPFifo(GXFifoObj *fifo)
{
    puts("GXSetGPFifo is a stub");
    GPFifo = fifo;
}

void GXSaveCPUFifo(GXFifoObj *fifo)
{
    puts("GXSaveCPUFifo is a stub");
}

void GXGetGPStatus(u8 *overhi, u8 *underlow, u8 *readIdle, u8 *cmdIdle, u8 *brkpt)
{
    puts("GXGetGPStatus is a stub");
    *overhi = *underlow = *readIdle = *cmdIdle = *brkpt = 0;
    *readIdle = TRUE;
}

void GXGetFifoPtrs(GXFifoObj *fifo, void **readPtr, void **writePtr)
{
    puts("GXGetFifoPtrs is a stub");
    *readPtr = NULL;
    *writePtr = NULL;
}

GXFifoObj *GXGetCPUFifo(void)
{
    return CPUFifo;
}

GXFifoObj *GXGetGPFifo(void)
{
    return GPFifo;
}

/* Light */

void GXInitLightAttnK(GXLightObj *lt_obj, f32 k0, f32 k1, f32 k2)
{
    puts("GXInitLightAttnK is a stub");
}

void GXInitLightSpot(GXLightObj *lt_obj, f32 cutoff, GXSpotFn spot_func)
{
    puts("GXInitLightSpot is a stub");
}

void GXInitLightDistAttn(GXLightObj *lt_obj, f32 ref_distance,
    f32 ref_brightness, GXDistAttnFn dist_func)
{
    puts("GXInitLightDistAttn is a stub");
}

void GXInitLightPos(GXLightObj *lt_obj, f32 x, f32 y, f32 z)
{
    puts("GXInitLightPos is a stub");
}

void GXGetLightPos(GXLightObj *lt_obj, f32 *x, f32 *y, f32 *z)
{
    puts("GXGetLightPos is a stub");
}

void GXInitLightDir(GXLightObj *lt_obj, f32 nx, f32 ny, f32 nz)
{
    puts("GXInitLightDir is a stub");
}

void GXInitLightColor(GXLightObj *lt_obj, GXColor color)
{
     puts("GXInitLightColor is a stub");
}

void GXGetLightColor(GXLightObj *lt_obj, GXColor *color)
{
    puts("GXGetLightColor is a stub");
}

void GXLoadLightObjImm(GXLightObj *lt_obj, GXLightID light)
{
    puts("GXLoadLightObjImm is a stub");
}

void GXSetChanAmbColor(GXChannelID chan, GXColor amb_color)
{
    puts("GXSetChanAmbColor is a stub");
}

void GXSetChanMatColor(GXChannelID chan, GXColor mat_color)
{
    puts("GXSetChanMatColor is a stub");
}

void GXSetNumChans(u8 nChans)
{
    puts("GXSetNumChans is a stub");
}

void GXSetChanCtrl(GXChannelID chan, GXBool enable, GXColorSrc amb_src,
    GXColorSrc mat_src, u32 light_mask, GXDiffuseFn diff_fn, GXAttnFn attn_fn)
{
    puts("GXSetChanCtrl is a stub");
}
