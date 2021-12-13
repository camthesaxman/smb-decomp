#ifndef _DOLPHIN_OSRESET_H_
#define _DOLPHIN_OSRESET_H_

#define OS_RESET_RESTART  0
#define OS_RESET_HOTRESET 1
#define OS_RESET_SHUTDOWN 2

void OSResetSystem(int reset, u32 resetCode, BOOL forceMenu);

#endif
