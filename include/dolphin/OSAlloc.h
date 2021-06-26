#ifndef _DOLPHIN_OSALLOC_H_
#define _DOLPHIN_OSALLOC_H_

#include <dolphin/types.h>

typedef int  OSHeapHandle;

void *OSInitAlloc(void *, void *, int);
OSHeapHandle OSCreateHeap(void *, void *);
OSHeapHandle OSSetCurrentHeap(OSHeapHandle);
void *OSAllocFromHeap(OSHeapHandle, u32);
long OSCheckHeap(OSHeapHandle);

#endif
