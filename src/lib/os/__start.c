#include <stdlib.h>
#include <dolphin.h>
#include <MetroTRK/DolphinTrkInit.h>
#include <__ppc_eabi_linker.h>
#include <__ppc_eabi_init.h>

extern void main();

void __init_registers(void);
void __init_data(void);

__declspec(section ".init")
asm void __start(void)
{
    nofralloc

    bl __init_registers
    bl __init_hardware

    // Set up stack terminator
    li r0, -1
    stwu r1, -8(r1)
    stw r0, 4(r1)
    stw r0, 0(r1)

    // Copy necessary data from ROM to RAM
    bl __init_data

    // Initialize MetroTRK
    li r0, 0
    lis r6, 0x80000044@ha
    addi r6, r6, 0x80000044@l
    stw r0, 0(r6)
    lis r6, 0x800000F4@ha
    addi r6, r6, 0x800000F4@l
    lwz r6, 0(r6)
    cmplwi r6, 0
    beq lbl_8000316C
    lwz r7, 0xc(r6)
    li r5, 0
    cmplwi r7, 2
    beq lbl_8000315C
    cmplwi r7, 3
    bne lbl_8000316C
    li r5, 1
lbl_8000315C:
    lis r6, InitMetroTRK@ha
    addi r6, r6, InitMetroTRK@l
    mtlr r6
    blrl
lbl_8000316C:

    lis r6, 0x800000F4@ha
    addi r6, r6, 0x800000F4@l
    lwz r5, 0(r6)
    cmplwi r5, 0
    beq+ lbl_800031CC
    lwz r6, 8(r5)
    cmplwi r6, 0
    beq+ lbl_800031CC
    add r6, r5, r6
    lwz r14, 0(r6)
    cmplwi r14, 0
    beq lbl_800031CC
    addi r15, r6, 4
    mtctr r14
lbl_800031A4:
    addi r6, r6, 4
    lwz r7, 0(r6)
    add r7, r7, r5
    stw r7, 0(r6)
    bdnz lbl_800031A4
    lis r5, 0x80000034@ha
    addi r5, r5, 0x80000034@l
    rlwinm r7, r15, 0, 0, 0x1a
    stw r7, 0(r5)
    b lbl_800031D4
lbl_800031CC:
    li r14, 0
    li r15, 0
lbl_800031D4:

    // Initialize debug interface
    bl DBInit

    // Initialize OS
    bl OSInit

    // Necessary initialization before main
    bl __init_user
    mr r3, r14  // argc?
    mr r4, r15  // argv?

    // Call main
    bl main

    // Exit program
    b exit
}

__declspec(section ".init")
asm void __init_registers(void)
{
    nofralloc

    // Set up r1 as the stack pointer
    lis r1, _stack_addr@h
    ori r1, r1, _stack_addr@l

    // Set up r2 as a pointer to small constant data
    lis r2, _SDA2_BASE_@h
    ori r2, r2, _SDA2_BASE_@l

    // Set up r13 as a pointer to small read/write data
    lis r13, _SDA_BASE_@h
    ori r13, r13, _SDA_BASE_@l

    blr
}

static inline void __copy_rom_section(void *dest, const void *src, unsigned long size)
{
    if (size != 0 && dest != src)
    {
        memcpy(dest, src, size);
        __flush_cache(dest, size);
    }
}

static inline void __init_bss_section(void *dest, unsigned long size)
{
    if (size != 0)
        memset(dest, 0, size);
}

__declspec(section ".init")
void __init_data(void)
{
    __rom_copy_info *rci;
    __bss_init_info *bii;

    rci = _rom_copy_info;
    while (1)
    {
        if (rci->size == 0)
            break;
        __copy_rom_section(rci->addr, rci->rom, rci->size);
        rci++;
    }

    bii = _bss_init_info;
    while (1)
    {
        if (bii->size == 0)
            break;
        __init_bss_section(bii->addr, bii->size);
        bii++;
    }
}
