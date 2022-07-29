#ifndef _DOLPHIN_VI_H_
#define _DOLPHIN_VI_H_

#include <dolphin/gx/GXStruct.h>
#include <dolphin/vifuncs.h>

void VIInit(void);
void VIConfigure(GXRenderModeObj *rm);
void VIFlush(void);
u32 VIGetTvFormat(void);
void VISetNextFrameBuffer(void *fb);
void VIWaitForRetrace(void);
void VISetBlack(BOOL black);

#endif
