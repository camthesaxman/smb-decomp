#define TARGET_PC
#include "../../include/dolphin/gx.h"

#include <stdio.h>

/* Fifo */
static GXFifoObj* GPFifo;
static GXFifoObj* CPUFifo;

void GXInitFifoBase(GXFifoObj* fifo, void* base, u32 size) {}

void GXInitFifoPtrs(GXFifoObj* fifo, void* readPtr, void* writePtr) {}

void GXSetCPUFifo(GXFifoObj* fifo) { CPUFifo = fifo; }

void GXSetGPFifo(GXFifoObj* fifo) { GPFifo = fifo; }

void GXSaveCPUFifo(GXFifoObj* fifo) {}

void GXGetGPStatus(GXBool* overhi, GXBool* underlow, GXBool* readIdle, GXBool* cmdIdle, GXBool* brkpt) {
  *overhi = *underlow = *readIdle = *cmdIdle = *brkpt = false;
  *readIdle = true;
}

void GXGetFifoPtrs(GXFifoObj* fifo, void** readPtr, void** writePtr) {
  *readPtr = NULL;
  *writePtr = NULL;
}

GXFifoObj* GXGetCPUFifo(void) { return CPUFifo; }

GXFifoObj* GXGetGPFifo(void) { return GPFifo; }

/* FrameBuf */

GXRenderModeObj GXNtsc480IntDf = {
    VI_TVMODE_NTSC_INT, 640, 480, 480, 40, 0, 640, 480, VI_XFBMODE_DF, 0, 0,
};
GXRenderModeObj GXPal528IntDf = {
    VI_TVMODE_PAL_INT, 704, 528, 480, 40, 0, 640, 480, VI_XFBMODE_DF, 0, 0,
};
GXRenderModeObj GXMpal480IntDf = {
    VI_TVMODE_PAL_INT, 640, 480, 480, 40, 0, 640, 480, VI_XFBMODE_DF, 0, 0,
};

void GXAdjustForOverscan(GXRenderModeObj* rmin, GXRenderModeObj* rmout, u16 hor, u16 ver) { *rmout = *rmin; }

/////
GXFifoObj *GXInit(void *base, u32 size) { return NULL; }
void GXSetCopyFilter(GXBool aa, u8 sample_pattern[12][2], GXBool vf, u8 vfilter[7]) {}
void GXSetPixelFmt(GXPixelFmt pix_fmt, GXZFmt16 z_fmt) {}
void GXSetDispCopyDst(u16 wd, u16 ht) {}
void GXSetDispCopyGamma(GXGamma gamma) {}
void GXSetDispCopySrc(u16 left, u16 top, u16 wd, u16 ht) {}
u32 GXSetDispCopyYScale(f32 vscale) { return 0; }
void GXSetDither(GXBool dither) {}
void GXCopyDisp(void *dest, GXBool clear) {}
void GXDrawSphere(u8 numMajor, u8 numMinor) { puts("GXDrawSphere is a stub"); }
void __GXSetDirtyState() {}
void GXBeginDisplayList(void *list, u32 size) {}
u32 GXEndDisplayList() { return 0; }
