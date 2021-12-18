#include <stddef.h>
#include <stdio.h>

#include <dolphin.h>

#include "global.h"

static u32 counter;

static void increment_counter(void);
static void print_counter(void);

void _prolog(void)
{
    func_80093A84(increment_counter, print_counter, 0, 0);
    gameSubmodeRequest = 0xA1;
    puts("RELOCATION SAMPLE LOADED\n");
}

void _epilog(void)
{
    puts("RELOCATION SAMPLE PURGED\n");
}

void _unresolved(void)
{
    u32 i;
    u32 *ptr;

    puts("\nError: A called an unlinked function.\n");
    puts("Address:      Back Chain    LR Save\n");

    i = 0;
    ptr = (u32 *)OSGetStackPointer();
    while (ptr != NULL && (u32)ptr != 0xFFFFFFFF && i++ < 16)
    {
        printf("0x%08x:   0x%08x    0x%08x\n", (u32)ptr, ptr[0], ptr[1]);
        ptr = (u32 *)*ptr;
    }
    OSPanic("rel_sample.c", 0x4C, "\n");
}

static void increment_counter(void)
{
    counter++;
}

static void print_counter(void)
{
    g_debug_set_cursor_pos(0, 10);
    g_debug_printf("SAMPLE: %d\n", counter);
}
