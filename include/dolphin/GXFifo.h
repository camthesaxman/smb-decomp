#ifndef _DOLPHIN_GXFIFO_H_
#define _DOLPHIN_GXFIFO_H_

typedef struct
{
    u8 pad[128];
} GXFifoObj;

void GXInitFifoBase(GXFifoObj *fifo, void *base, u32 size);
void GXInitFifoPtrs(GXFifoObj *fifo, void *readPtr, void *writePtr);
GXFifoObj *GXGetCPUFifo(void);
void GXSetCPUFifo(GXFifoObj *fifo);
void GXSaveCPUFifo(GXFifoObj *fifo);

#endif
