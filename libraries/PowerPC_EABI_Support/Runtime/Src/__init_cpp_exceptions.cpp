// TODO: Have linker generate _eti_init_info. Linker crashes if there is an
// already existing symbol named _eti_init_info.
#define _eti_init_info TODO_eti_init_info

#include <__ppc_eabi_linker.h>
#include <NMWException.h>

static int fragmentID = -2;

asm char *GetR2(void)
{
    nofralloc
    mr r3, r2
    blr
}

extern "C" {

void __fini_cpp_exceptions(void)
{
    if (fragmentID != -2)
    {
        __unregister_fragment(fragmentID);
        fragmentID = -2;
    }
}

void __init_cpp_exceptions(void)
{
    if (fragmentID == -2)
    {
        char *R2 = GetR2();
        fragmentID = __register_fragment(_eti_init_info, R2);
    }
}

}
