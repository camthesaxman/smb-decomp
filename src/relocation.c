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
    printf("nameOffset        %08xh [%s]\n", 0, NULL);
    printf("nameSize          %d\n", 0);
    printf("bssSize           %d\n", 0);
    printf("relOffset         %08xh\n", 0);
    printf("impOffset         %08xh\n", 0);
    printf("impSize           %08xh\n", 0);
    printf("prolog            %08xh\n", 0);
    printf("epilog            %08xh\n", 0);
    printf("unresolved        %08xh\n", 0);
}

void relocation_load_module(char *name, struct RelModule *rel)
{
    DVDFileInfo file;

    rel->info = NULL;
    rel->bss = NULL;
    if (DVDOpen(name, &file))
    {
        u32 size = OSRoundUp32B(file.length);

        rel->info = OSAlloc(size);
        if (rel->info == NULL)
            OSPanic("relocation.c", 64, "cannot OSAlloc\n");

        if (g_read_dvd_file(&file, rel->info, size, 0) != 0)
        {
            rel->bss = OSAlloc(rel->info->bssSize != 0 ? rel->info->bssSize : 32);
            if (rel->bss == NULL)
                OSPanic("relocation.c", 68, "cannot OSAlloc\n");
            OSLink(&rel->info->module, rel->bss);
            rel->info->init();
        }
        else
        {
            OSFree(rel->info);
            rel->info = NULL;
        }

        DVDClose(&file);
    }
}

void relocation_unload_module(struct RelModule *rel)
{
    if (rel->info != NULL)
    {
        rel->info->finish();
        OSUnlink(&rel->info->module);
        OSFree(rel->bss);
        OSFree(rel->info);
        rel->info = NULL;
        rel->bss = NULL;
    }
}
