#ifndef _DOLPHIN_AI_H_
#define _DOLPHIN_AI_H_

typedef void (*AIDCallback)(void);

void AIInit(u8 *stack);
void AISetStreamSampleRate(u32 rate);
u32 AIGetStreamSampleCount(void);
void AIResetStreamSampleCount(void);
void AIInitDMA(u32 start_addr, u32 length);
void AIStartDMA(void);
AIDCallback AIRegisterDMACallback(AIDCallback callback);

#endif
