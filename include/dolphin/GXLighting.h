#ifndef _DOLPHIN_GXLIGHTING_H_
#define _DOLPHIN_GXLIGHTING_H_

void GXSetNumChans(u8 nChans);
void GXSetChanCtrl(GXChannelID chan, GXBool enable, GXColorSrc amb_src,
    GXColorSrc mat_src, u32 light_mask, GXDiffuseFn diff_fn, GXAttnFn attn_fn);

#endif
