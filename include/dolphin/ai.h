#ifndef _DOLPHIN_AI_H_
#define _DOLPHIN_AI_H_

void AIInit(u8 *stack);
void AISetStreamSampleRate(u32 rate);
u32 AIGetStreamSampleCount(void);
void AIResetStreamSampleCount(void);

#endif
