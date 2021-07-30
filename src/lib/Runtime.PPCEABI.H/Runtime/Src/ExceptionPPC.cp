#include <stddef.h>
#include <__ppc_eabi_linker.h>

typedef struct ProcessInfo
{
    __eti_init_info *exception_info;
    char *TOC;
    int active;
} ProcessInfo;

#define MAXFRAGMENTS 1

extern ProcessInfo fragmentinfo[MAXFRAGMENTS];

#pragma peephole off

void __unregister_fragment(int fragmentID)
{
    if (fragmentID >= 0 && fragmentID < MAXFRAGMENTS)
    {
        fragmentinfo[fragmentID].exception_info = NULL;
        fragmentinfo[fragmentID].TOC = NULL;
        fragmentinfo[fragmentID].active = 0;
    }
}

int __register_fragment(struct __eti_init_info *info, char *TOC)
{
    ProcessInfo *f;
    int i;

    for (i = 0, f = fragmentinfo; i < MAXFRAGMENTS; i++, f++)
    {
        if (!f->active)
        {
            f->exception_info = info;
            f->TOC = TOC;
            f->active = 1;
            return i;
        }
    }
    return -1;
}
