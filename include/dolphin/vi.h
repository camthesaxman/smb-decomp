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

// These are specific to the PC version
#ifdef TARGET_PC
void VISetWindowTitle(const char *title);
void VIShowErrorMessage(const char *message);
#endif

#endif
