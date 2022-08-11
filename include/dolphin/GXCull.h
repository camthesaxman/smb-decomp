#ifndef _DOLPHIN_GXCULL_H_
#define _DOLPHIN_GXCULL_H_

#include <dolphin/types.h>

void GXSetScissor(u32 left, u32 top, u32 wd, u32 ht);
void GXSetCullMode(GXCullMode mode);
void GXSetCoPlanar(GXBool enable);

#endif
