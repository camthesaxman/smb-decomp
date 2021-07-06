#ifndef _DOLPHIN_GXVERT_H_
#define _DOLPHIN_GXVERT_H_

#define GXFIFO_ADDR 0xCC008000

typedef union
{
    u8  u8;
    u16 u16;
    u32 u32;
    u64 u64;
    s8  s8;
    s16 s16;
    s32 s32;
    s64 s64;
    f32 f32;
    f64 f64;
} PPCWGPipe;

volatile PPCWGPipe GXWGFifo AT_ADDRESS(GXFIFO_ADDR);

static inline void GXPosition3s16(const s16 x, const s16 y, const s16 z)
{
    GXWGFifo.s16 = x;
    GXWGFifo.s16 = y;
    GXWGFifo.s16 = z;
}

static inline void GXTexCoord2s16(const s16 u, const s16 v)
{
    GXWGFifo.s16 = u;
    GXWGFifo.s16 = v;
}

static inline void GXEnd (void) {}

#endif
