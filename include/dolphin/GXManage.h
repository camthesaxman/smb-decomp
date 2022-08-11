#ifndef _DOLPHIN_GXMANAGE_H_
#define _DOLPHIN_GXMANAGE_H_

#include <dolphin/GXFifo.h>

typedef void (*GXDrawDoneCallback)(void);

GXFifoObj *GXInit(void *base, u32 size);
GXDrawDoneCallback GXSetDrawDoneCallback(GXDrawDoneCallback cb);
void GXDrawDone(void);
void GXSetDrawDone(void);
void GXFlush(void);

#endif
