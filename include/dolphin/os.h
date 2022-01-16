#ifndef _DOLPHIN_OS_H_
#define _DOLPHIN_OS_H_

#include <dolphin/OSAlloc.h>
#include <dolphin/OSCache.h>
#include <dolphin/OSContext.h>
#include <dolphin/OSInterrupt.h>
#include <dolphin/OSModule.h>
#include <dolphin/OSFont.h>
#include <dolphin/OSReset.h>
#include <dolphin/OSResetSW.h>

typedef s64 OSTime;
typedef u32 OSTick;

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
BOOL OSDisableInterrupts(void);
BOOL OSRestoreInterrupts(BOOL level);

void OSReport(char *, ...);
void OSPanic(char *file, int line, char *msg, ...);

#define OSRoundUp32B(x)   (((u32)(x) + 32 - 1) & ~(32 - 1))
#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))

#define ASSERT(exp) ((void)0)

#endif
