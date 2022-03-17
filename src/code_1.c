#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "gxutil.h"
#include "perf.h"

struct GFXBufferInfo *gfxBufferInfo;
static GXBool drawingFinished;

#ifdef __MWERKS__
extern u32 timething : 0x800000F8;
#else
#define timething (*(u32 *)0x800000F8)
#endif

static void draw_done_callback(void)
{
    drawingFinished = TRUE;
}

void setup_vtx_attrib_fmt(void)
{
    GXClearVtxDesc();
    gxutil_clear_vtx_attrs();

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
    setup_vtx_attrib_fmt();
    GXSetZMode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
    zMode->compareEnable = GX_ENABLE;
    zMode->compareFunc   = GX_LEQUAL;
    zMode->updateEnable  = GX_ENABLE;
    func_8009DE44();
}

void preproc_main(void)
{
    void *sp10;
    void *spC;
    GXBool spB;
    GXBool spA;
    GXBool sp9;
    GXBool sp8;
    int fifoNum;

    drawingFinished = 0;
    GXSetDrawDone();
    GXGetFifoPtrs(GXGetGPFifo(), &sp10, &spC);
    if (currRenderMode->field_rendering != 0)
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
    GXSaveCPUFifo(GXGetCPUFifo());

    do
    {
        GXGetGPStatus(&sp8, &sp8, &sp9, &spA, &spB);
    } while (sp9 != TRUE);

    if (GXGetCPUFifo() != gfxBufferInfo->fifos[0])
    {
        GXSetCPUFifo(gfxBufferInfo->fifos[0]);
        fifoNum = 1;
    }
    else
    {
        GXSetCPUFifo(gfxBufferInfo->fifos[1]);
        fifoNum = 0;
    }

    GXSetGPFifo(gfxBufferInfo->fifos[fifoNum]);
    func_8009E4EC(1);
    GXSetZMode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
    zMode->compareEnable = GX_ENABLE;
    zMode->compareFunc   = GX_LEQUAL;
    zMode->updateEnable  = GX_ENABLE;
    func_8009E588(0);
    GXCopyDisp(gfxBufferInfo->currFrameBuf, GX_TRUE);
    setup_vtx_attrib_fmt();
}

void epiproc_main(void)
{
    OSTime prevTime = OSGetTime();

    while (!drawingFinished)
    {
        if (OSGetTime() - prevTime > (timething / 4))
        {
            printf("\t[warning]\tGP WAIT TimeOut\n");
            break;
        }
    }
}

void syncwait_main(void)
{
    VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
    VIFlush();
    func_80027388();
    VIWaitForRetrace();
    func_80027448();
    gfxBufferInfo->currFrameBuf = gfxBufferInfo->frameBufs[gfxBufferInfo->fbNum];
    gfxBufferInfo->fbNum ^= 1;
}
