#ifndef _DOLPHIN_OSALLOC_H_
#define _DOLPHIN_OSALLOC_H_

#include <dolphin/types.h>

typedef int  OSHeapHandle;

void *OSAllocFromHeap(OSHeapHandle, u32);

#endif
