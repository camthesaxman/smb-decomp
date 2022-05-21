#ifndef _SRC_PERF_H_
#define _SRC_PERF_H_

#include <dolphin/types.h>

struct PerfInfo
{
    u32 unk0;
    u32 soundTime;
    u32 inputTime;
    u32 debugTime;
    u32 loadTime;
    u32 unk14;
    u32 unk18;
    u32 eventTime;
    u32 polydispTime;
    u32 bitmapTime;
    u32 windowTime;
    u32 gpwaitTime;
    u32 unk30;
    u32 unk34;
};

extern struct PerfInfo perfInfo;
extern u32 perfEnabled;

void perf_start_timer(int timerId);
u32 perf_stop_timer(volatile int timerId2);
void perf_init(void);
void perf_frameend(void);
void perf_framestart(void);

#endif
