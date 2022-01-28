#include <stddef.h>
#include <NMWException.h>

DestructorChain *__global_destructor_chain;

void __destroy_global_chain(void)
{
    DestructorChain *dc;

    while ((dc = __global_destructor_chain) != NULL)
    {
        __global_destructor_chain = dc->next;
        ((void (*)())dc->destructor)(dc->object, -1);
    }
}
