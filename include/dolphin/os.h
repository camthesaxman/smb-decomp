#ifndef _DOLPHIN_OS_H_
#define _DOLPHIN_OS_H_

#include <dolphin/OSAlloc.h>
#include <dolphin/OSCache.h>
#include <dolphin/OSModule.h>
#include <dolphin/OSFont.h>

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

#endif
