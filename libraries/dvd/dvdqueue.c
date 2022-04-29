#include <stddef.h>

#include <dolphin.h>

struct DVDQueue_sub
{
    struct DVDQueue_sub *unk0;
    struct DVDQueue_sub *unk4;
};

struct DVDQueue_sub WaitingQueue[4];

void __DVDClearWaitingQueue(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        struct DVDQueue_sub *ptr = &WaitingQueue[i];

        ptr->unk0 = ptr;
        ptr->unk4 = ptr;
    }
}

int __DVDPushWaitingQueue(int a, struct DVDQueue_sub *b)
{
    BOOL intrEnabled = OSDisableInterrupts();
    struct DVDQueue_sub *r5 = &WaitingQueue[a];

    r5->unk4->unk0 = b;
    b->unk4 = r5->unk4;
    b->unk0 = r5;
    r5->unk4 = b;
    OSRestoreInterrupts(intrEnabled);
    return 1;
}

struct DVDQueue_sub *__DVDPopWaitingQueue(void)
{
    BOOL intrEnabled = OSDisableInterrupts();
    int i;

    for (i = 0; i < 4; i++)
    {
        if (WaitingQueue[i].unk0 != &WaitingQueue[i])
        {
            struct DVDQueue_sub *r5;
            struct DVDQueue_sub *r31;

            OSRestoreInterrupts(intrEnabled);
            intrEnabled = OSDisableInterrupts();
            r5 = &WaitingQueue[i];
            r31 = r5->unk0;
            r5->unk0 = r31->unk0;
            r31->unk0->unk4 = r5;
            OSRestoreInterrupts(intrEnabled);
            r31->unk0 = NULL;
            r31->unk4 = NULL;
            return r31;
        }
    }
    OSRestoreInterrupts(intrEnabled);
    return NULL;
}

BOOL __DVDCheckWaitingQueue(void)
{
    BOOL intrEnabled = OSDisableInterrupts();
    int i;

    for (i = 0; i < 4; i++)
    {
        if (WaitingQueue[i].unk0 != &WaitingQueue[i])
        {
            OSRestoreInterrupts(intrEnabled);
            return TRUE;
        }
    }
    OSRestoreInterrupts(intrEnabled);
    return FALSE;
}

BOOL __DVDDequeueWaitingQueue(struct DVDQueue_sub *a)
{
    BOOL intrEnabled = OSDisableInterrupts();
    struct DVDQueue_sub *r4 = a->unk4;
    struct DVDQueue_sub *r5 = a->unk0;

    if (r4 == NULL || r5 == NULL)
    {
        OSRestoreInterrupts(intrEnabled);
        return FALSE;
    }
    r4->unk0 = r5;
    r5->unk4 = r4;
    OSRestoreInterrupts(intrEnabled);
    return TRUE;
}
