#include <stdio.h>
#include <string.h>
#include <dolphin.h>

u8 ARAM[16 * 1024 * 1024];

void ARStartDMA(u32 type, u32 mainmem_addr, u32 aram_addr, u32 length)
{
    switch (type)
    {
    case ARAM_DIR_MRAM_TO_ARAM:
        memcpy(ARAM + aram_addr, (void *)mainmem_addr, length);
        break;
    case ARAM_DIR_ARAM_TO_MRAM:
        memcpy((void *)mainmem_addr, ARAM + aram_addr, length);
        break;
    }
}

u32 ARGetDMAStatus(void)
{
    puts("ARGetDMAStatus");
    return 0;
}