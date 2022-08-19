#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "gxcache.h"
#include "gxutil.h"
#include "perf.h"

struct GFXBufferInfo *gfxBufferInfo;
static GXBool drawingFinished;

static void draw_done_callback(void)
{
    drawingFinished = TRUE;
}

static void init_vtx_attr_fmts(void)
{
    GXClearVtxDesc();
    gxutil_clear_vtx_attrs();

    //              format      attribute   n elements   datatype  n frac bits
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS,  GX_POS_XYZ,  GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_NRM,  GX_NRM_XYZ,  GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8,  0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX1, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX2, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX3, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX4, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX5, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX6, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX7, GX_TEX_ST,   GX_F32,    0);

    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_POS,  GX_POS_XYZ,  GX_S16,   13);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_NRM,  GX_NRM_XYZ,  GX_S16,   14);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8,  0);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_TEX0, GX_TEX_ST,   GX_S16,   13);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_TEX1, GX_TEX_ST,   GX_S16,   13);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_TEX2, GX_TEX_ST,   GX_S16,   13);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_TEX3, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_TEX4, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_TEX5, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_TEX6, GX_TEX_ST,   GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT1, GX_VA_TEX7, GX_TEX_ST,   GX_F32,    0);

    GXSetVtxAttrFmt(GX_VTXFMT7, GX_VA_POS,  GX_POS_XYZ,  GX_F32,    0);
    GXSetVtxAttrFmt(GX_VTXFMT7, GX_VA_TEX0, GX_TEX_ST,   GX_F32,    0);
}

void init_wait_vblank(void)
{
    VIWaitForRetrace();
    VISetBlack(FALSE);
    if (currRenderMode->field_rendering == 0)
        GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
    GXSetDrawDoneCallback(draw_done_callback);
    drawingFinished = FALSE;
    GXDrawDone();
    init_vtx_attr_fmts();
    GXSetZMode_cached_init(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
    gxcache_init();
}

// Called at the start of each frame. Sets up the GPU for rendering a new frame
void beginframe_main(void)
{
    void *readPtr;
    void *writePtr;
    GXBool breakPoint;
    GXBool cmdIdle;
    GXBool readIdle;
    GXBool overrun;
    int gpFifoNum;

    drawingFinished = FALSE;
    GXSetDrawDone();

    GXGetFifoPtrs(GXGetGPFifo(), &readPtr, &writePtr);

    // Adjust scanline offset for interlaced mode
    if (currRenderMode->field_rendering)
    {
        GXSetViewportJitter(
            0.0f,  // xOrig
            0.0f,  // yOrig
            currRenderMode->fbWidth,  // wd
            currRenderMode->xfbHeight,  // ht
            0.0f,  // nearZ
            1.0f,  // farZ
            VIGetNextField());  // field
    }

    // Save CPU FIFO
    GXSaveCPUFifo(GXGetCPUFifo());

    // Wait for GPU to finish reading FIFO
    do
    {
        GXGetGPStatus(&overrun, &overrun, &readIdle, &cmdIdle, &breakPoint);
    } while (readIdle != TRUE);

    // Swap CPU and GPU FIFOs
    if (GXGetCPUFifo() != gfxBufferInfo->fifos[0])
    {
        GXSetCPUFifo(gfxBufferInfo->fifos[0]);
        gpFifoNum = 1;
    }
    else
    {
        GXSetCPUFifo(gfxBufferInfo->fifos[1]);
        gpFifoNum = 0;
    }
    GXSetGPFifo(gfxBufferInfo->fifos[gpFifoNum]);

    GXSetColorUpdate_cached(TRUE);
    GXSetZMode_cached_init(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
    GXSetZCompLoc_cached(GX_FALSE);

    // Copy previous frame's EFB to XFB
    GXCopyDisp(gfxBufferInfo->currFrameBuf, GX_TRUE);

    init_vtx_attr_fmts();
}

// Waits for GPU to finish drawing
void gpwait_main(void)
{
    OSTime prevTime = OSGetTime();

    while (!drawingFinished)
    {
        if (OSGetTime() - prevTime > OS_TIMER_CLOCK)
        {
            printf("\t[warning]\tGP WAIT TimeOut\n");
            break;
        }
    }
}

// Waits for vertical retrace and starts XFB copy
void syncwait_main(void)
{
    // Set the VI to output the current XFB on next vertical retrace
    VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
    VIFlush();
    perf_frameend();
    VIWaitForRetrace();

    perf_framestart();

    // Swap XFB
    gfxBufferInfo->currFrameBuf = gfxBufferInfo->frameBufs[gfxBufferInfo->fbNum];
    gfxBufferInfo->fbNum ^= 1;
}
