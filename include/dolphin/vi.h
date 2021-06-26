#ifndef _DOLPHIN_VI_H_
#define _DOLPHIN_VI_H_

#include <dolphin/GXStruct.h>

void VIConfigure(GXRenderModeObj *rm);
void VIFlush(void);
void VISetNextFrameBuffer(void *fb);
void VIWaitForRetrace(void);

#endif
