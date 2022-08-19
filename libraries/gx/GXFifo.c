#include <stddef.h>
#include <dolphin.h>

#include "__gx.h"

static OSThread *__GXCurrentThread;
static u8 CPGPLinked;
static u32 GXOverflowSuspendInProgress;
static void (*BreakPointCB)(void);
static u32 __GXOverflowCount;
static GXFifoObj *GPFifo;
static GXFifoObj *CPUFifo;

static void __GXFifoReadEnable(void);
static void __GXFifoReadDisable(void);
static void __GXFifoLink(u8 arg0);
static void __GXWriteFifoIntEnable(u8 arg0, u8 arg1);
static void __GXWriteFifoIntReset(u8 arg0, u8 arg1);

#ifndef __MWERKS__
#define __sync() __asm("sync")
#endif

static void GXCPInterruptHandler(__OSInterrupt unused, OSContext *ctx)
{
    OSContext sp10;

    gx->unkC = __cpReg[0];
    if (((gx->unk8 >> 3) & 1) && ((gx->unkC >> 1) & 1))
    {
        OSResumeThread(__GXCurrentThread);
        GXOverflowSuspendInProgress = 0;
        __GXWriteFifoIntReset(1, 1);
        __GXWriteFifoIntEnable(1, 0);
    }
    if (((gx->unk8 >> 2) & 1) && (gx->unkC & 1))
    {
        __GXOverflowCount++;
        __GXWriteFifoIntEnable(0, 1);
        __GXWriteFifoIntReset(1, 0);
        GXOverflowSuspendInProgress = 1;
        OSSuspendThread(__GXCurrentThread);
    }
    if (((gx->unk8 >> 5) & 1) && ((gx->unkC >> 4) & 1))
    {
        gx->unk8 = gx->unk8 & ~(1 << 5);
        __cpReg[1] = gx->unk8;
        if (BreakPointCB != NULL)
        {
            OSClearContext(&sp10);
            OSSetCurrentContext(&sp10);
            BreakPointCB();
            OSClearContext(&sp10);
            OSSetCurrentContext(ctx);
        }
    }
}

void GXInitFifoBase(GXFifoObj *fifo, void *base, u32 size)
{
    __GXFifoObj *__fifo = (__GXFifoObj *)fifo;

    __fifo->base = base;
    __fifo->end = (u8 *)base + size - 4;
    __fifo->size = size;
    __fifo->unk1C = 0;
    GXInitFifoLimits(fifo, size - 0x4000, (size >> 1) & ~0x1F);
    GXInitFifoPtrs(fifo, base, base);
}

void GXInitFifoPtrs(GXFifoObj *fifo, void *readPtr, void *writePtr)
{
    __GXFifoObj *__fifo = (__GXFifoObj *)fifo;
    BOOL intrEnabled = OSDisableInterrupts();

    __fifo->readPtr = readPtr;
    __fifo->writePtr = writePtr;
    __fifo->unk1C = (u8 *)writePtr - (u8 *)readPtr;
    if (__fifo->unk1C < 0)
        __fifo->unk1C += __fifo->size;
    OSRestoreInterrupts(intrEnabled);
}

void GXInitFifoLimits(GXFifoObj *fifo, u32 hiWaterMark, u32 loWaterMark)
{
     __GXFifoObj *__fifo = (__GXFifoObj *)fifo;

     __fifo->hiWaterMark = hiWaterMark;
     __fifo->loWaterMark = loWaterMark;
}

void GXSetCPUFifo(GXFifoObj *fifo)
{
    __GXFifoObj *__fifo = (__GXFifoObj *)fifo;
    BOOL intrEnabled = OSDisableInterrupts();

    CPUFifo = fifo;
    if (fifo == GPFifo)
    {
        u32 temp_r6;

        __piReg[3] = (u32)__fifo->base & 0x3FFFFFFF;
        __piReg[4] = (u32)__fifo->end & 0x3FFFFFFF;
        temp_r6 = (u32)__fifo->writePtr & ~0xC000001F;
        __piReg[5] = temp_r6 & 0xFBFFFFFF;

        CPGPLinked = TRUE;
        __GXWriteFifoIntReset(1, 1);
        __GXWriteFifoIntEnable(1, 0);
        __GXFifoLink(1);
    }
    else
    {
        u32 temp_r0;

        if (CPGPLinked)
        {
            __GXFifoLink(0);
            CPGPLinked = FALSE;
        }
        __GXWriteFifoIntEnable(0, 0);

        __piReg[3] = (u32)__fifo->base & 0x3FFFFFFF;
        __piReg[4] = (u32)__fifo->end & 0x3FFFFFFF;
        temp_r0 = (u32)__fifo->writePtr & ~0xC000001F;
        __piReg[5] = temp_r0 & 0xFBFFFFFF;
    }

    __sync();

    OSRestoreInterrupts(intrEnabled);
    return;

    // Despite this obviously being dead code, it still is needed to match the function.
#ifndef NONMATCHING
    asm {nop}
#endif
}

void GXSetGPFifo(GXFifoObj *fifo)
{
    __GXFifoObj *__fifo = (__GXFifoObj *)fifo;
    BOOL intrEnabled = OSDisableInterrupts();

    __GXFifoReadDisable();
    __GXWriteFifoIntEnable(0, 0);
    GPFifo = fifo;

    __cpReg[16] = (u32)__fifo->base & 0xFFFF;
    __cpReg[18] = (u32)__fifo->end & 0xFFFF;
    __cpReg[24] = __fifo->unk1C & 0xFFFF;
    __cpReg[26] = (u32)__fifo->writePtr & 0xFFFF;
    __cpReg[28] = (u32)__fifo->readPtr & 0xFFFF;
    __cpReg[20] = (u32)__fifo->hiWaterMark & 0xFFFF;
    __cpReg[22] = (u32)__fifo->loWaterMark & 0xFFFF;
    __cpReg[17] = ((u32)__fifo->base >> 16) & 0x3FFF;
    __cpReg[19] = ((u32)__fifo->end >> 16) & 0x3FFF;
    __cpReg[25] = __fifo->unk1C >> 16;
    __cpReg[27] = ((u32)__fifo->writePtr >> 16) & 0x3FFF;
    __cpReg[29] = ((u32)__fifo->readPtr >> 16) & 0x3FFF;
    __cpReg[21] = (u32)__fifo->hiWaterMark >> 16;
    __cpReg[23] = (u32)__fifo->loWaterMark >> 16;

    __sync();

    if (CPUFifo == GPFifo)
    {
        CPGPLinked = TRUE;
        __GXWriteFifoIntEnable(1, 0);
        __GXFifoLink(1);
    }
    else
    {
        CPGPLinked = FALSE;
        __GXWriteFifoIntEnable(0, 0);
        __GXFifoLink(0);
    }
    __GXWriteFifoIntReset(1, 1);
    __GXFifoReadEnable();
    OSRestoreInterrupts(intrEnabled);
}

void GXSaveCPUFifo(GXFifoObj *fifo)
{
    __GXSaveCPUFifoAux((__GXFifoObj *)fifo);
}

void __GXSaveCPUFifoAux(__GXFifoObj *__fifo)
{
    //__GXFifoObj *__fifo = (__GXFifoObj *)fifo;
    BOOL intrEnabled = OSDisableInterrupts();

    GXFlush();
    __fifo->base = (void *)(__piReg[3] + 0x80000000);
    __fifo->end = (void *)(__piReg[4] + 0x80000000);
    __fifo->writePtr = (void *)((__piReg[5] & 0xFBFFFFFF) + 0x80000000);
    if (CPGPLinked)
    {
        u32 offset = (__cpReg[29] << 16) | __cpReg[28];
        __fifo->readPtr = (void *)(offset + 0x80000000);
        __fifo->unk1C = (__cpReg[25] << 16) | __cpReg[24];
    }
    else
    {
        __fifo->unk1C = (u8 *)__fifo->writePtr - (u8 *)__fifo->readPtr;
        if (__fifo->unk1C < 0)
            __fifo->unk1C += __fifo->size;
    }
    OSRestoreInterrupts(intrEnabled);
}

void GXGetGPStatus(u8 *overhi, u8 *underlow, u8 *readIdle, u8 *cmdIdle, u8 *brkpt)
{
    gx->unkC = __cpReg[0];
    *overhi   = (gx->unkC >> 0) & 1;
    *underlow = (gx->unkC >> 1) & 1;
    *readIdle = (gx->unkC >> 2) & 1;
    *cmdIdle  = (gx->unkC >> 3) & 1;
    *brkpt    = (gx->unkC >> 4) & 1;
}

void GXGetFifoPtrs(GXFifoObj *fifo, void **readPtr, void **writePtr)
{
    __GXFifoObj *__fifo = (__GXFifoObj *)fifo;

    if (fifo == CPUFifo)
        __fifo->writePtr = (void *)((__piReg[5] & 0xFBFFFFFF) + 0x80000000);
    if (fifo == GPFifo)
    {
        u32 offset = (__cpReg[29] << 16) | __cpReg[28];
        __fifo->readPtr = (void *)(offset + 0x80000000);
        __fifo->unk1C = (__cpReg[25] << 16) | __cpReg[24];
    }
    else
    {
        __fifo->unk1C = (u8 *)__fifo->writePtr - (u8 *)__fifo->readPtr;
        if (__fifo->unk1C < 0)
            __fifo->unk1C += __fifo->size;
    }
    *readPtr = __fifo->readPtr;
    *writePtr = __fifo->writePtr;
}

void __GXFifoInit(void)
{
    __OSSetInterruptHandler(0x11, GXCPInterruptHandler);
    __OSUnmaskInterrupts(0x4000);
    __GXCurrentThread = OSGetCurrentThread();
    GXOverflowSuspendInProgress = 0;
}

static void __GXFifoReadEnable(void)
{
    INSERT_FIELD(gx->unk8, 1, 1, 0);
    __cpReg[1] = gx->unk8;
}

static void __GXFifoReadDisable(void)
{
    INSERT_FIELD(gx->unk8, 0, 1, 0);
    __cpReg[1] = gx->unk8;
}

static void __GXFifoLink(u8 arg0)
{
    s32 var_r0 = (arg0 != 0) ? 1 : 0;

    INSERT_FIELD(gx->unk8, var_r0, 1, 4);
    __cpReg[1] = gx->unk8;
}

static void __GXWriteFifoIntEnable(u8 arg0, u8 arg1)
{
    INSERT_FIELD(gx->unk8, arg0, 1, 2);
    INSERT_FIELD(gx->unk8, arg1, 1, 3);
    __cpReg[1] = gx->unk8;
}

static void __GXWriteFifoIntReset(u8 arg0, u8 arg1)
{
    INSERT_FIELD(gx->unk10, arg0, 1, 0);
    INSERT_FIELD(gx->unk10, arg1, 1, 1);
    __cpReg[2] = gx->unk10;
}

GXFifoObj *GXGetCPUFifo(void)
{
    return CPUFifo;
}

GXFifoObj *GXGetGPFifo(void)
{
    return GPFifo;
}
