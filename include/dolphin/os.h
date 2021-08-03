#ifndef _DOLPHIN_OS_H_
#define _DOLPHIN_OS_H_

#include <dolphin/OSAlloc.h>
#include <dolphin/OSCache.h>
#include <dolphin/OSModule.h>
#include <dolphin/OSFont.h>
#include <dolphin/OSReset.h>
#include <dolphin/OSResetSW.h>

typedef s64 OSTime;

void OSInit(void);

void *OSGetArenaHi(void);
void *OSGetArenaLo(void);
void OSSetArenaHi(void *);
void OSSetArenaLo(void *);

u32 OSGetPhysicalMemSize(void);

OSTime OSGetTime(void);

void OSReport(char *, ...);
void OSPanic(char *file, int line, char *msg, ...);

#define OSRoundUp32B(x)   (((u32)(x) + 32 - 1) & ~(32 - 1))
#define OSRoundDown32B(x) (((u32)(x)) & ~(32 - 1))

#define ASSERT(exp) ((void)0)

#endif
