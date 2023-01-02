#include <stddef.h>
#include <stdio.h>

#include <dolphin.h>

#include "global.h"
#include "mode.h"

static int counter;

static void increment_counter(void);
static void print_counter(void);

void _prolog(void)
{
    set_minigame_callbacks(increment_counter, print_counter, 0, 0);
    gameSubmodeRequest = SMD_MINI_REL_SAMPLE_MAIN;
    puts("RELOCATION SAMPLE LOADED\n");
}

void _epilog(void)
{
    puts("RELOCATION SAMPLE PURGED\n");
}

void _unresolved(void)
{
    u32 i;
    u32 *sp;

    puts("\nError: A called an unlinked function.\n");
    puts("Address:      Back Chain    LR Save\n");

    i = 0;
    sp = (u32 *)OSGetStackPointer();
    while (sp != NULL && (u32)sp != 0xFFFFFFFF && i++ < 16)
    {
        printf("0x%08x:   0x%08x    0x%08x\n", (u32)sp, sp[0], sp[1]);
        sp = (u32 *)sp[0];
    }
    OSPanic("rel_sample.c", 76, "\n");
}

static void increment_counter(void)
{
    counter++;
}

static void print_counter(void)
{
    u_debug_set_cursor_pos(0, 10);
    u_debug_printf("SAMPLE: %d\n", counter);
}
