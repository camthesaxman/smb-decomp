#ifndef _DOLPHIN_GXLIGHTING_H_
#define _DOLPHIN_GXLIGHTING_H_

#include <dolphin/GXEnum.h>
#include <dolphin/GXStruct.h>

void GXSetNumChans(u8 nChans);
void GXSetChanCtrl(GXChannelID chan, GXBool enable, GXColorSrc amb_src,
    GXColorSrc mat_src, u32 light_mask, GXDiffuseFn diff_fn, GXAttnFn attn_fn);
void GXSetChanAmbColor(GXChannelID chan, GXColor amb_color);
void GXSetChanMatColor(GXChannelID chan, GXColor mat_color);

void GXInitLightSpot(GXLightObj *lt_obj, f32 cutoff, GXSpotFn spot_func);
void GXInitLightDistAttn(GXLightObj *lt_obj, f32 ref_distance,
    f32 ref_brightness, GXDistAttnFn dist_func);
void GXInitLightPos(GXLightObj *lt_obj, f32 x, f32 y, f32 z);
void GXInitLightDir(GXLightObj *lt_obj, f32 nx, f32 ny, f32 nz);
void GXInitLightColor(GXLightObj *lt_obj, GXColor color);
void GXInitLightAttnK(GXLightObj *lt_obj, f32 k0, f32 k1, f32 k2);
void GXLoadLightObjImm(GXLightObj *lt_obj, GXLightID light);

#endif
