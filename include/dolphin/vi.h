#ifndef _DOLPHIN_VI_H_
#define _DOLPHIN_VI_H_

#include <dolphin/GXStruct.h>

void VIInit(void);
void VIConfigure(GXRenderModeObj *rm);
void VIFlush(void);
u32 VIGetTvFormat(void);
void VISetNextFrameBuffer(void *fb);
void VIWaitForRetrace(void);

#endif
