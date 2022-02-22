#ifndef _SRC_PERF_H_
#define _SRC_PERF_H_

#include <dolphin/types.h>

extern u32 perfEnabled;

void perf_init_timer(int timerId);
u32 perf_stop_timer(volatile int timerId2);
void perf_init(void);
void func_80027388(void);
void func_80027448(void);

#endif
