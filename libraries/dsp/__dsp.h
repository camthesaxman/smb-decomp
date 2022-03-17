#ifdef __MWERKS__
volatile u16 __DSPRegs[] : 0xCC005000;
#else
#define __DSPRegs ((volatile u16 *)0xCC005000)
#endif

extern DSPTaskInfo *__DSP_curr_task;
extern DSPTaskInfo *__DSP_last_task;
extern DSPTaskInfo *__DSP_first_task;

void __DSPHandler(__OSInterrupt, OSContext *);
void __DSP_exec_task(DSPTaskInfo *, DSPTaskInfo *);
void __DSP_boot_task(DSPTaskInfo *);
void __DSP_insert_task(DSPTaskInfo *);
void __DSP_remove_task(DSPTaskInfo *task);
void __DSP_debug_printf(const char *fmt, ...);
