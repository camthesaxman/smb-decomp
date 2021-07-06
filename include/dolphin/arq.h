#ifndef _DOLPHIN_ARQ_H_
#define _DOLPHIN_ARQ_H_

typedef void (*ARQCallback)(u32 pointerToARQRequest);

typedef struct
{
    struct ARQRequest *next;
    u32 owner;
    u32 type;
    u32 priority;
    u32 source;
    u32 dest;
    u32 length;
    ARQCallback callback;
} ARQRequest;

void ARQPostRequest(ARQRequest *task, u32 owner, u32 type, u32 priority,
    u32 source, u32 dest, u32 length, ARQCallback callback);
                                
#endif
