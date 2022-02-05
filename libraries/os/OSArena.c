#include <dolphin.h>

void *__OSArenaHi;
void *__OSArenaLo = (void *)-1;

void *OSGetArenaHi(void)
{
    return __OSArenaHi;
}

void *OSGetArenaLo(void)
{
    return __OSArenaLo;
}

void OSSetArenaHi(void *addr)
{
    __OSArenaHi = addr;
}

void OSSetArenaLo(void *addr)
{
    __OSArenaLo = addr;
}
