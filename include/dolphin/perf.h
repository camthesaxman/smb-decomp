#ifndef _DOLPHIN_PERF_H_
#define _DOLPHIN_PERF_H_

typedef u8  PERFId;

void PERFEventStart(PERFId id);
void PERFEventEnd(PERFId id);

#endif
