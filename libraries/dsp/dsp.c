#include <stddef.h>
#include <dolphin.h>

#include "__dsp.h"

#define BUILD_DATE "May 22 2001"
#define BUILD_TIME "02:06:43"

u32 DSPCheckMailToDSP(void)
{
    return (__DSPRegs[0] >> 15) & 1;
}

u32 DSPCheckMailFromDSP(void)
{
    return (__DSPRegs[2] >> 15) & 1;
}

u32 DSPReadMailFromDSP(void)
{
    return (__DSPRegs[2] << 16) | __DSPRegs[3];
}

void DSPSendMailToDSP(u32 msg)
{
    __DSPRegs[0] = msg >> 16;
    __DSPRegs[1] = msg & 0xFFFF;
}

static int __DSP_init_flag;
static DSPTaskInfo *__DSP_tmp_task;

DSPTaskInfo *__DSP_first_task;
DSPTaskInfo *__DSP_last_task;
DSPTaskInfo *__DSP_curr_task;

void DSPInit(void)
{
    BOOL intrEnabled;
    u16 temp;

    __DSP_debug_printf("DSPInit(): Build Date: %s %s\n", BUILD_DATE, BUILD_TIME);

    if (__DSP_init_flag == 1)
        return;

    intrEnabled = OSDisableInterrupts();
    __OSSetInterruptHandler(7, __DSPHandler);
    __OSUnmaskInterrupts(OS_INTERRUPTMASK_DSP_DSP);

    __DSPRegs[5] = (__DSPRegs[5] & ~0xA8) | 0x800;
    temp = __DSPRegs[5];
    __DSPRegs[5] = temp & ~0xAC;

    __DSP_tmp_task   = NULL;
    __DSP_curr_task  = NULL;
    __DSP_last_task  = NULL;
    __DSP_first_task = NULL;
    __DSP_init_flag = 1;

    OSRestoreInterrupts(intrEnabled);
}

DSPTaskInfo *DSPAddTask(DSPTaskInfo *task)
{
    BOOL intrEnabled = OSDisableInterrupts();

    __DSP_insert_task(task);
    task->state = 0;
    task->flags = 1;

    OSRestoreInterrupts(intrEnabled);
    if (task == __DSP_first_task)
        __DSP_boot_task(task);
    return task;
}
