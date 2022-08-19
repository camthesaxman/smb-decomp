#include <musyx/musyx.h>
#include "musyx_priv.h"

void *salMalloc(size_t len)
{
    return salHooks.malloc(len);
}

void salFree(void *addr)
{
    salHooks.free(addr);
}
