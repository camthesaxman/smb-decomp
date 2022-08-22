#include <musyx/musyx.h>
#include "musyx_priv.h"

#include <limits.h>
#include <dolphin.h>

struct StreamBuffer
{
    struct StreamBuffer *next;
    u32 unk4;
    u32 unk8;
    u32 unkC;
};

static u32 aramTop;
static u32 aramWrite;
static u32 aramStream;
static volatile u8 aramQueueWrite;
static volatile u8 aramQueueValid;
static struct StreamBuffer *aramUsedStreamBuffers;
static struct StreamBuffer *aramFreeStreamBuffers;
static struct StreamBuffer *aramIdleStreamBuffers;
static struct ARQRequest aramQueueLo[16];
static struct StreamBuffer aramStreamBuffers[0x41];

void InitStreamBuffers(void);

void aramQueueCallback(u32 pointerToARQRequest)
{
    aramQueueValid--;
}

void aramUploadData(void *source, u32 dest, size_t size, u32 arg3)
{
    int intrEnabled;

    while (aramQueueValid >= 16)
        ;
    intrEnabled = OSDisableInterrupts();
    aramQueueLo[aramQueueWrite].owner = 0x2A;
    aramQueueLo[aramQueueWrite].type = 0;
    aramQueueLo[aramQueueWrite].priority = (arg3 != 0) ? 1 : 0;
    aramQueueLo[aramQueueWrite].source = (u32)source;
    aramQueueLo[aramQueueWrite].dest = (u32)dest;
    aramQueueLo[aramQueueWrite].length = size;
    aramQueueLo[aramQueueWrite].callback = aramQueueCallback;
    ARQPostRequest(&aramQueueLo[aramQueueWrite],
                   aramQueueLo[aramQueueWrite].owner,
                   aramQueueLo[aramQueueWrite].type,
                   aramQueueLo[aramQueueWrite].priority,
                   aramQueueLo[aramQueueWrite].source,
                   aramQueueLo[aramQueueWrite].dest,
                   aramQueueLo[aramQueueWrite].length,
                   aramQueueLo[aramQueueWrite].callback);
    aramQueueValid++;
    aramQueueWrite = (aramQueueWrite + 1) % 16;
    OSRestoreInterrupts(intrEnabled);
}

void aramSyncTransferQueue(void)
{
    while (aramQueueValid != 0)
        ;
}

void aramInit(int arg0)
{
    u32 temp_r31;
    u16 *var_r3;
    u16 *var_r28;
    int i;

    temp_r31 = ARGetBaseAddress();
    var_r28 = salMalloc(0x280 * sizeof(u16));
    for (i = 0; i < 0x280; i++)
        var_r28[i] = 0;
    DCFlushRange(var_r28, 0x500);
    aramQueueValid = 0;
    aramQueueWrite = 0;
    aramUploadData(var_r28, temp_r31, 0x500, 0);
    aramSyncTransferQueue();
    salFree(var_r28);
    aramTop = temp_r31 + arg0;
    if (aramTop > ARGetSize())
        aramTop = ARGetSize();
    aramWrite = temp_r31 + 0x500;
    InitStreamBuffers();
}

u32 aramGetZeroBuffer(void)
{
    return ARGetBaseAddress();
}

void *aramStoreData(void *arg0, int arg1)
{
    void *ret;

    arg1 = OSRoundUp32B(arg1);
    DCFlushRange((void *)arg0, arg1);
    aramUploadData(arg0, aramWrite, arg1, 0);
    ret = (void *)aramWrite;
    aramWrite += arg1;
    return ret;
}

void aramRemoveData(int unused, u32 arg1)
{
    aramWrite -= OSRoundUp32B(arg1);
}

void InitStreamBuffers(void)
{
    u32 i;

    aramUsedStreamBuffers = NULL;
    aramFreeStreamBuffers = NULL;
    aramIdleStreamBuffers = aramStreamBuffers;
    for (i = 1; i < 64; i++)
        aramStreamBuffers[i - 1].next = &aramStreamBuffers[i];
    aramStreamBuffers[i-1].next = NULL;
    aramStream = aramTop;
}

u8 aramAllocateStreamBuffer(u32 size)
{
    struct StreamBuffer *buf;
    struct StreamBuffer *prev;
    struct StreamBuffer *new;
    u32 var_r6;

    size = OSRoundUp32B(size);
    new = NULL;
    prev = NULL;
    var_r6 = UINT_MAX;

    for (buf = aramFreeStreamBuffers; buf != NULL; buf = buf->next)
    {
        if (buf->unkC == size)
        {
            new = buf;
            break;
        }
        if (buf->unkC > size && var_r6 > buf->unkC)
        {
            new = buf;
            var_r6 = buf->unkC;
        }
        prev = buf;
    }

    if (new == NULL)
    {
        if (aramIdleStreamBuffers != NULL && aramStream - size >= aramWrite)
        {
            new = aramIdleStreamBuffers;
            aramIdleStreamBuffers = new->next;
            new->unkC = size;
            new->unk8 = size;
            aramStream -= size;
            new->unk4 = aramStream;
            new->next = aramUsedStreamBuffers;
            aramUsedStreamBuffers = new;
        }
    }
    else
    {
        if (prev != NULL)
            prev->next = new->next;
        else
            aramFreeStreamBuffers = new->next;
        new->unk8 = size;
        new->next = aramUsedStreamBuffers;
        aramUsedStreamBuffers = new;
    }
    if (new == NULL)
        return UCHAR_MAX;
    return new - aramStreamBuffers;
}

u32 aramGetStreamBufferAddress(u8 arg0, u32 *arg1)
{
    if (arg1 != NULL)
        *arg1 = aramStreamBuffers[arg0].unk8;
    return aramStreamBuffers[arg0].unk4;
}

void aramFreeStreamBuffer(u8 arg0)
{
    struct StreamBuffer *toFree;
    struct StreamBuffer *prev;
    struct StreamBuffer *next;
    struct StreamBuffer *buf2;
    struct StreamBuffer *buf;
    u32 var_r5_2;

    toFree = &aramStreamBuffers[arg0];
    prev = NULL;

    for (buf = aramUsedStreamBuffers; buf != NULL; buf = buf->next)
    {
        if (buf == toFree)
        {
            if (prev != NULL)
                prev->next = toFree->next;
            else
                aramUsedStreamBuffers = toFree->next;
            break;
        }
        prev = buf;
    }

    if (toFree->unk4 == aramStream)
    {
        var_r5_2 = UINT_MAX;
        toFree->next = aramIdleStreamBuffers;
        aramIdleStreamBuffers = toFree;

        for (buf = aramUsedStreamBuffers; buf != NULL; buf = buf->next)
        {
            if (buf->unk4 <= var_r5_2)
                var_r5_2 = buf->unk4;
        }

        buf2 = aramFreeStreamBuffers;
        while (buf2 != NULL)
        {
            next = buf2->next;
            if (buf2->unk4 < var_r5_2)
            {
                aramFreeStreamBuffers = next;
                buf2->next = aramIdleStreamBuffers;
                aramIdleStreamBuffers = buf2;
            }
            buf2 = next;
        }

        aramStream = (var_r5_2 != UINT_MAX) ? var_r5_2 : aramTop;
    }
    else
    {
        toFree->next = aramFreeStreamBuffers;
        aramFreeStreamBuffers = toFree;
    }
}
