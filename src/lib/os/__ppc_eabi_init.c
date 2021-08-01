#include <__ppc_eabi_init.h>

extern void __OSPSInit(void);
extern void __OSCacheInit(void);

asm void __init_hardware(void)
{
    nofralloc

    mfmsr r0
    ori r0, r0, 0x2000
    mtmsr r0
    mflr r31
    bl __OSPSInit
    bl __OSCacheInit
    mtlr r31
    blr
}

asm void __flush_cache(register void *address, register unsigned int size)
{
    nofralloc

    lis r5, 0xFFFFFFF1@h
    ori r5, r5, 0xFFFFFFF1@l

    and r5, r5, r3   // make address 8-byte aligned
    subf r3, r5, r3  // get unaligned - aligned difference
    add r4, r4, r3   // increase size accordingly

rept:

    dcbst 0, r5  // flush data cache to main memory
    sync

    icbi 0, r5  // invalidate instruction cache
    addic r5, r5, 8
    addic. r4, r4, -8
    bge rept

    isync

    blr
}
