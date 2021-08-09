#include <stddef.h>
#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "relocation.h"

// remnants of an unused function that was stripped by the linker
void relocation_unused(void)
{
    printf("id                %d\n", 0);
    printf("numSections       %d\n", 0);
    printf("sectionInfoOffset %08xh\n", 0);
    printf("nameOffset        %08xh [%s]\n", 0, (char *)1);
    printf("nameSize          %d\n", 0);
    printf("bssSize           %d\n", 0);
    printf("relOffset         %08xh\n", 0);
    printf("impOffset         %08xh\n", 0);
    printf("impSize           %08xh\n", 0);
    printf("prolog            %08xh\n", 0);
    printf("epilog            %08xh\n", 0);
    printf("unresolved        %08xh\n", 0);
}

void minigame_link(char *name, struct MinigameLink *link)
{
    DVDFileInfo file;

    link->info = NULL;
    link->bss = NULL;
    if (DVDOpen(name, &file))
    {
        u32 size = OSRoundUp32B(file.length);

        link->info = OSAlloc(size);
        if (link->info == NULL)
            OSPanic("relocation.c", 64, "cannot OSAlloc\n");

        if (g_read_dvd_file(&file, link->info, size, 0) != 0)
        {
            link->bss = OSAlloc(link->info->bssSize != 0 ? link->info->bssSize : 32);
            if (link->bss == NULL)
                OSPanic("relocation.c", 68, "cannot OSAlloc\n");
            OSLink(&link->info->module, link->bss);
            link->info->init();
        }
        else
        {
            OSFree(link->info);
            link->info = NULL;
        }

        DVDClose(&file);
    }
}

void minigame_unlink(struct MinigameLink *link)
{
    if (link->info != NULL)
    {
        link->info->finish();
        OSUnlink(&link->info->module);
        OSFree(link->bss);
        OSFree(link->info);
        link->info = NULL;
        link->bss = NULL;
    }
}
