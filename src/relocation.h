#ifndef _SRC_RELOCATION_H_
#define _SRC_RELOCATION_H_

#include <dolphin/types.h>
#include <dolphin/OSModule.h>

struct MinigameLinkInfo
{
    OSModuleInfo module;
    u32 bssSize;
    u8 filler24[0x34-0x24];
    void (*init)();
    void (*finish)();
};

struct RelModule
{
    struct MinigameLinkInfo *info;
    void *bss;
};

void relocation_load_module(char *name, struct RelModule *link);
void relocation_unload_module(struct RelModule *link);

#endif
