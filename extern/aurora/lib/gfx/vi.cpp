#include "gx.hpp"

extern "C" {
void VIInit(void);
void VIConfigure(GXRenderModeObj* rm);
void VIFlush(void);
u32 VIGetTvFormat(void);
void VISetNextFrameBuffer(void* fb);
void VIWaitForRetrace(void);
void VISetBlack(BOOL black);
}

void VIInit(void) {}
u32 VIGetTvFormat(void) { return 0; }
void VIFlush(void) {}
