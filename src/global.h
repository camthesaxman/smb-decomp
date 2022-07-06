#ifndef _SRC_GLOBAL_H_
#define _SRC_GLOBAL_H_

#include "types.h"
#include "functions.h"
#include "variables.h"

#define MAX_PLAYERS 4
#define MAX_ITEMS 256
#define MAX_STOBJS 128
#define MAX_SPRITES 64
#define MAX_EFFECTS 512

#define ARRAY_COUNT(arr) ((int)(sizeof(arr)/sizeof(arr[0])))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define CLAMP(val, min, max) \
    ((val) < (min) ? (min) : (val) > (max) ? (max) : (val))

#define RGBA(r, g, b, a)  (((a) << 24) | ((r) << 16) | ((g) << 8) | (b))

// .bss variables seem to be ordered in the file based on their usage.
// This macro generates a dummy function that forces the order and will be
// stripped by the linker.
#define FORCE_BSS_ORDER(var) void *_force_bss_order_##var(){return &var;}

// Possibly a different NULL definition caused by including dolphin.h before stddef.h
#define NULL2 ((void *)0)

#define DEGREES_TO_S16(angle) ((s16)((angle) * (65536.0f / 360.0f)))
#define S16_TO_DEGREES(angle) ((angle) * (360.0f / 65536.0f))
#define RADIANS_TO_S16(angle) ((s16)((angle) * (65536.0f / (2.0f * (float)PI))))

#define OFFSET_TO_PTR(base, offset) (void *)((u32)(base) + (u32)(offset))

#ifdef __MWERKS__
u32 OS_BUS_CLOCK_SPEED : 0x800000F8;
#else
#define OS_BUS_CLOCK_SPEED (*(u32 *)0x800000F8)
#endif

// intrinsics
#ifndef __MWERKS__
static inline u32 __cntlzw(u32 n)
{
#ifdef __PPC__
    u32 ret;
    asm("cntlzw %0, %1" : "=r"(ret) : "r"(n));
    return ret;
#else
    int i;
    for (i = 0; i < 31; i++)
    {
        if ((n >> (31 - i)) & 1)
            break;
    }
    return i;
#endif
}

static inline u32 __lwbrx(void *ptr, u32 offset)
{
#ifdef __PPC__
    u32 ret;
    asm("lwbrx %0, %1, %2" : "=r"(ret) : "r"(ptr), "r"(offset));
    return ret;
#else
    u32 val = *(u32 *)((u8 *)ptr + offset);
    return ((val & 0xFF) << 24) | (((val >> 8) & 0xFF) << 16) | (((val >> 16) & 0xFF) << 8) | ((val >> 24) & 0xFF);
#endif
}

#ifdef __PPC__
static inline float __fabs(float n)
{
    float ret;
    asm("fabs %0, %1" : "=f"(ret) : "f"(n));
    return ret;
}
#else
extern float fabsf(float);
#define __fabs(n) fabsf(n)
#endif

static inline float __frsqrte(float n)
{
#ifdef __PPC__
    float ret;
    asm("frsqrte %0, %1" : "=f"(ret) : "f"(n));
    return ret;
#else
    extern float sqrtf(float);
    return 1.0f / sqrtf(n);
#endif
}

static inline int __abs(int n)
{
    int mask = n >> 31;
    return (n + mask) ^ mask;
}
#endif

#define qr0 0
#define qr2 2

#endif
