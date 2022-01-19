#include <stddef.h>
#include <dolphin.h>

void __OSUnlockAllMutex(OSThread *thread)
{
    while (thread->queueMutex.head != NULL)
    {
        OSMutex *head = thread->queueMutex.head;
        OSMutex *next = head->link.next;

        if (next == NULL)
            thread->queueMutex.tail = NULL;
        else
            next->link.prev = NULL;
        thread->queueMutex.head = next;
        head->count = 0;
        head->thread = NULL;
        OSWakeupThread(&head->queue);
    }
}
