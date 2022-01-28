#include <dolphin.h>

#include "__gx.h"

void GXClearGPMetric(void)
{
    __cpReg[2] = 4;
}

void GXInitXfRasMetric(void)
{
    GXWGFifo.u8 = 0x61;
    GXWGFifo.u32 = 0x2402C022;
    GXWGFifo.u8 = 0x10;
    GXWGFifo.u32 = 0x1006;
    GXWGFifo.u32 = 0x31000;
    gx->unk2 = 0;
}

void GXReadXfRasMetric(u32 *xf_wait_in, u32 *xf_wait_out, u32 *ras_busy, u32 *clocks)
{
    u32 val;

    val = __cpReg[0x21];
    *ras_busy    = (val << 16) | (__cpReg[0x20]);

    val =__cpReg[0x23];
    *clocks      = (val << 16) | (__cpReg[0x22]);
    *xf_wait_in  = (__cpReg[0x24]) | (__cpReg[0x25] << 16);
    *xf_wait_out = (__cpReg[0x27] << 16) | (__cpReg[0x26]);
}
