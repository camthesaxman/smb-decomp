#ifndef _SRC_GLOBAL_H_
#define _SRC_GLOBAL_H_

#include "types.h"
#include "functions.h"
#include "variables.h"

#define ARRAY_COUNT(arr) ((int)(sizeof(arr)/sizeof(arr[0])))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define CLAMP(val, min, max) \
    ((val) < (min) ? (min) : (val) > (max) ? (max) : (val))

// .bss variables seem to be ordered in the file based on their usage.
// This macro generates a dummy function that forces the order and will be
// stripped by the linker.
#define FORCE_BSS_ORDER(var) void *_force_bss_order_##var(){return &var;}

// Possibly a different NULL definition caused by including dolphin.h before stddef.h
#define NULL2 ((void *)0)

#define DEGREES_TO_S16(angle) ((s16)((angle) * (65536.0f / 360.0f)))
#define S16_TO_DEGREES(angle) ((angle) * (360.0f / 65536.0f))

#define OFFSET_TO_PTR(base, offset) (void *)((u32)(base) + (u32)(offset))

#define CHANGE_Z_MODE(updEnable, compFunc, compEnable) \
do                                                     \
{                                                      \
    if (updEnable  != zMode->updateEnable              \
     || compFunc   != zMode->compareFunc               \
     || compEnable != zMode->compareEnable)            \
    {                                                  \
        GXSetZMode(compEnable, compFunc, updEnable);   \
        zMode->compareEnable = compEnable;             \
        zMode->compareFunc   = compFunc;               \
        zMode->updateEnable  = updEnable;              \
    }                                                  \
} while (0)

// intrinsics
#ifndef __MWERKS__
extern u32 __cntlzw(u32);
u32 __lwbrx(void *, u32);
#endif

#define qr0 0
#define qr2 2

#endif