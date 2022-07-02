#include <string.h>
#include <dolphin.h>

#include "__gx.h"

static __GXFifoObj DisplayListFifo;
struct GX __savedGXdata;
static void *OldCPUFifo;

void GXBeginDisplayList(void *list, u32 size)
{
    GXFifoObj *fifo = GXGetCPUFifo();

    if (gx->unk4F0 != 0)
        __GXSetDirtyState();
    if (gx->unk4ED != 0)
        memcpy(&__savedGXdata, gx, sizeof(__savedGXdata));
    DisplayListFifo.base = list;
    DisplayListFifo.end = (u8 *)list + size - 4;
    DisplayListFifo.size = size;
    DisplayListFifo.unk1C = 0;
    DisplayListFifo.readPtr = list;
    DisplayListFifo.writePtr = list;
    gx->unk4EC = 1;
    GXSaveCPUFifo(fifo);
    OldCPUFifo = fifo;
    GXSetCPUFifo((GXFifoObj *)&DisplayListFifo);
}

u32 GXEndDisplayList(void)
{
    u32 r30;
    u32 dummy;

    if (gx->unk4F0 != 0)
        __GXSetDirtyState();
    r30 = (__piReg[5] >> 26) & 1;
    __GXSaveCPUFifoAux(&DisplayListFifo);
    GXSetCPUFifo(OldCPUFifo);
    if (gx->unk4ED != 0)
    {
        BOOL intrEnabled = OSDisableInterrupts();
        u32 r28 = gx->unk8;

        memcpy(gx, &__savedGXdata, sizeof(*gx));
        gx->unk8 = r28;
        OSRestoreInterrupts(intrEnabled);
    }

    gx->unk4EC = 0;
    if (r30 == 0)
        return DisplayListFifo.unk1C;
    else
        return 0;
}

void GXCallDisplayList(void *list, u32 nbytes)
{
    if (gx->unk4F0 != 0)
        __GXSetDirtyState();
    if (*(u32 *)gx != 0)  // WTF?
        __GXSendFlushPrim();
    GXWGFifo.u8 = 0x40;
    GXWGFifo.u32 = (u32)list;
    GXWGFifo.u32 = nbytes;
}
