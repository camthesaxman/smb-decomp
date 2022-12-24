#ifndef _DOLPHIN_OS_H_
#define _DOLPHIN_OS_H_

#include <dolphin/OSAlloc.h>
#include <dolphin/OSCache.h>
#include <dolphin/OSContext.h>
#include <dolphin/OSInterrupt.h>
#include <dolphin/OSModule.h>
#include <dolphin/OSThread.h>
#include <dolphin/OSMutex.h>
#include <dolphin/OSFont.h>
#include <dolphin/OSReset.h>
#include <dolphin/OSResetSW.h>
#include <dolphin/OSError.h>

typedef s64 OSTime;
typedef u32 OSTick;

#define OS_BASE_CACHED 0x80000000
#ifdef __MWERKS__
u32 __OSBusClock  : (OS_BASE_CACHED | 0x00F8);
u32 __OSCoreClock : (OS_BASE_CACHED | 0x00FC);
#else
#define __OSBusClock  (*(u32 *)(OS_BASE_CACHED | 0x00F8))
#define __OSCoreClock (*(u32 *)(OS_BASE_CACHED | 0x00FC))
#endif
#define OS_BUS_CLOCK   __OSBusClock
#define OS_CORE_CLOCK  __OSCoreClock
#define OS_TIMER_CLOCK (OS_BUS_CLOCK/4)

#define OSTicksToSeconds(ticks)      ((ticks)   / (OS_TIMER_CLOCK))
#define OSTicksToMilliseconds(ticks) ((ticks)   / (OS_TIMER_CLOCK/1000))
#define OSTicksToMicroseconds(ticks) ((ticks)*8 / (OS_TIMER_CLOCK/125000))
#define OSSecondsToTicks(sec) ((sec) * (OS_TIMER_CLOCK))
#define OSMillisecondsToTicks(msec) ((msec) * (OS_TIMER_CLOCK / 1000))
#define OSNanosecondsToTicks(nsec) (((nsec) * (OS_TIMER_CLOCK / 125000)) / 8000)

void OSInit(void);

void *OSGetArenaHi(void);
void *OSGetArenaLo(void);
void OSSetArenaHi(void *);
void OSSetArenaLo(void *);

u32 OSGetPhysicalMemSize(void);

typedef struct OSCalendarTime
{
    /*0x00*/ int sec;
    /*0x04*/ int min;
    /*0x08*/ int hour;
    /*0x0C*/ int mday;
    /*0x10*/ int mon;
    /*0x14*/ int year;
    /*0x18*/ int wday;
    /*0x1C*/ int yday;
    /*0x20*/ int msec;
    /*0x24*/ int usec;
} OSCalendarTime;

OSTick OSGetTick(void);
OSTime OSGetTime(void);
void OSTicksToCalendarTime(OSTime ticks, OSCalendarTime *td);
BOOL OSEnableInterrupts(void);
BOOL OSDisableInterrupts(void);
BOOL OSRestoreInterrupts(BOOL level);
u32 OSGetSoundMode(void);
void OSSetSoundMode(u32 mode);

void OSReport(char *, ...);
void OSPanic(char *file, int line, char *msg, ...);

#define OSRoundUp32B(x)   (((u32)(x) + 32 - 1) & ~(32 - 1))
#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))

#define ASSERT(exp) ((void)0)

#endif
