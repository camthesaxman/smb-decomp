#include <dolphin.h>

#include "global.h"

void begin_display_list(void *buffer, u32 size)
{
    GXBeginDisplayList(buffer, size);
}

u32 end_display_list(void)
{
    return GXEndDisplayList();
}

void func_8009A9A8(void)
{
    lbl_802F2198 = 0;
}

void g_set_vtx_desc(u32 attrs)
{
    u32 i;

    if (attrs != lbl_802F2198)
    {
        GXClearVtxDesc();
        lbl_802F2198 = attrs;
        for (i = 0; i <= 16; i++, attrs >>= 1)
        {
            if (attrs & 1)
                GXSetVtxDesc(i, GX_DIRECT);
        }
    }
}

void func_8009AA20(void) {}
