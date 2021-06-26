#ifndef _DOLPHIN_GXFRAMEBUFFER_H_
#define _DOLPHIN_GXFRAMEBUFFER_H_

#include <dolphin/GXStruct.h>
#include <dolphin/GXEnum.h>

void GXSetCopyClear(GXColor clear_clr, u32 clear_z);
void GXAdjustForOverscan(GXRenderModeObj *rmin, GXRenderModeObj *rmout,
    u16 hor, u16 ver);
void GXCopyDisp(void *dest, GXBool clear);
void GXSetDispCopyGamma(GXGamma gamma);
void GXSetDispCopySrc(u16 left, u16 top, u16 wd, u16 ht);
void GXSetDispCopyDst(u16 wd, u16 ht);
u32 GXSetDispCopyYScale(f32 vscale);
void GXSetCopyFilter(GXBool aa, u8 sample_pattern[12][2], GXBool vf, u8 vfilter[7]);
void GXSetPixelFmt(GXPixelFmt pix_fmt, GXZFmt16 z_fmt);

#endif
