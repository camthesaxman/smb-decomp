#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "input.h"
#include "mathutil.h"

u8 lbl_801EEBA0[0x80];

#pragma force_active on

void initialize(void)
{
    OSInit();
    init_cache();
    DVDInit();
    VIInit();
    CARDInit();
    input_init();
    mathutil_init();
    init_dvd();
    init_tv();
    init_heap();
    init_vi();
    init_gx();
    init_gx_2();
    memcard_init();
    init_wait_vblank();
    init_loading_gct();
    init_rel();
}

void init_gx(void)
{
    void *r31;

    lbl_802F1CA4[4] = GXInit(OSAllocFromHeap(__OSCurrHeap, 0x100000), 0x100000);
    lbl_802F1CA4[5] = lbl_801EEBA0;
    r31 = OSAllocFromHeap(__OSCurrHeap, 0x100000);
    GXInitFifoBase(lbl_802F1CA4[5], r31, 0x100000);
    GXInitFifoPtrs(lbl_802F1CA4[5], r31, r31);
    GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
    GXSetScissor(0, 0, currRenderMode->fbWidth, currRenderMode->efbHeight);
    GXSetDispCopySrc(0, 0, currRenderMode->fbWidth, currRenderMode->efbHeight);
    GXSetDispCopyDst(currRenderMode->fbWidth, currRenderMode->xfbHeight);
    GXSetDispCopyYScale((float)currRenderMode->xfbHeight / (float)currRenderMode->efbHeight);
    GXSetCopyFilter(currRenderMode->aa, currRenderMode->sample_pattern, 1, currRenderMode->vfilter);
    GXSetPixelFmt(GX_PF_RGB8_Z24, GX_ZC_LINEAR);
    GXCopyDisp(lbl_802F1CA4[0], 1);
    GXSetDispCopyGamma(GX_GM_1_0);
}

struct Struct801723C0 lbl_801723C0 =
{
    (void *)0x802F1B4C, 0x10000,
    (void *)0x802F1B48, 0x18000,
    (void *)0x802F1B44, 0x10000,
    (void *)0x802F1B40, 0x8C000,
};

void init_tv(void)
{
    switch (VIGetTvFormat())
    {
    case VI_NTSC:
        currRenderMode = &lbl_801E8E98;
        break;
    case VI_PAL:
        currRenderMode = &lbl_801E8F10;
        break;
    case VI_MPAL:
        currRenderMode = &lbl_801E8ED4;
        break;
    default:
        OSPanic("init.c", 0x8E, "init_system: invalid TV format\n");
        break;
    }
    GXAdjustForOverscan(currRenderMode, &lbl_801EEB60, 0, 16);
    currRenderMode = &lbl_801EEB60;
}

void init_vi(void)
{
    VIConfigure(currRenderMode);
    VISetNextFrameBuffer(lbl_802F1CA4[1]);
    lbl_802F1CA4[0] = lbl_802F1CA4[2];
    VIFlush();
    VIWaitForRetrace();
    if (currRenderMode->viTVmode & 1)
        VIWaitForRetrace();
}

void init_gx_2(void)
{
    Mtx44 mtx;
    GXColor clearColor = {0x00, 0x0A, 0x20, 0x00};
    
    C_MTXPerspective(mtx, 60.0f, 1.3333333f, 0.1f, 1000000.0f);
    GXSetProjection(mtx, GX_PERSPECTIVE);
    func_8009E588(0);
    func_8009E110(1, 4, 5, 0);
    GXSetAlphaCompare(GX_GREATER, 0, GX_AOP_AND, GX_GREATER, 0);
    GXSetCopyClear(clearColor, 0x00FFFFFF);
    GXSetDither(FALSE);
}

void init_dvd(void)
{
    DVDChangeDir("test");
}

/*0x16F400*/
char lbl_80172400[] = "\n===================================================\n\n";
char msg2[] = "  System memory exists more than 24MB. Clamp 24MB.\n";
char msg3[] = "  Program can use memory of high-order 24MB than 0x%x freely.\n";

#ifdef NONMATCHING
void init_heap(void)
{
    u32 r30 = (u32)OSGetArenaLo();
    u32 r27 = (u32)OSGetArenaHi();
    u32 r29 = OSGetPhysicalMemSize();
    u32 r28;
    u32 r3;
    u32 r0;
    u32 start;
    
    lbl_802F1B50 = (void *)r27;
    lbl_802F1B54 = (void *)r27;
    lbl_802F1B58 = (r29 > 0x01800000);
    if (lbl_802F1B58)
    {
        OSReport(/*lbl_801723C0 + 0x40*/ "\n==================================================\n\n");
        OSReport(/*lbl_801723C0 + 0x78*/ "  System memory exists more than 24MB. Clamp 24MB.\n");
        r27 -= r29 + 0xFE800000;
        OSReport(/*lbl_801723C0 + 0xAC*/ "  Program can use memory of high-order 24MB than 0x%x freely.\n", r27);
        lbl_802F1B54 = (void *)r27;
        OSSetArenaHi((void *)r27);
        OSReport(/*lbl_801723C0 + 0x40*/"\n==================================================\n\n");
    }
    //lbl_80006CE8
    r30 = (r30 + 0x1F) & ~0x1F;
    r28 = r27 & ~0x1F;
    r3 = ((currRenderMode->fbWidth + 0xF) & 0xfff0) * currRenderMode->xfbHeight * 2 + 0x1F;
    r29 = (r30 + r3) & ~0x1F;
    r0 = (u32)OSInitAlloc((void *)((r29 + r3) & ~0x1F), (void *)r28, 5);
    r27 = (r0 + 0x1F) & ~0x1F;
    *lbl_801723C0.unk0 = r27;
    r27 = (r27 + lbl_801723C0.unk4 + 0x1F) & ~0x1F;
    *lbl_801723C0.unk8 = r27;
    r27 = (r27 + lbl_801723C0.unkC + 0x1F) & ~0x1F;
    *lbl_801723C0.unk10 = r27;
    r27 = (r27 + lbl_801723C0.unk14 + 0x1F) & ~0x1F;
    *lbl_801723C0.unk18 = r27;
    r27 = (r27 + lbl_801723C0.unk1C + 0x1F) & ~0x1F;
    OSSetArenaLo((void *)r27);
    
    #define MAKE_HEAP(_heap, _start, _size) \
    { \
        u32 start = (_start); \
        u32 end = (_start) + _size; \
        _heap = OSCreateHeap((void *)start, (void *)end); \
    }
    MAKE_HEAP(lbl_802F1B28, r27, 0x80020)
    MAKE_HEAP(lbl_802F1B24, r27 + 0x80020, 0x300020)
    MAKE_HEAP(lbl_802F1B20, r27 + 0x380040, 0x200020)
    MAKE_HEAP(lbl_802F1B1C, r27 + 0x580060, 0x300020)
    lbl_802F1B2C = OSCreateHeap((void *)(r27 + 0x880080), (void *)r28);
    OSSetCurrentHeap(lbl_802F1B2C);
    OSSetArenaLo((void *)(r27 + 0x880080));
    #undef MAKE_HEAP
    
    /*
    lbl_802F1B28 = OSCreateHeap((void *)r27, (void *)(r27 + 0x80020));
    lbl_802F1B24 = OSCreateHeap((void *)(r27 + 0x80020), (void *)(r27 + 0x380040));
    lbl_802F1B20 = OSCreateHeap((void *)(r27 + 0x380040), (void *)(r27 + 0x580060));
    lbl_802F1B1C = OSCreateHeap((void *)(r27 + 0x580060), (void *)(r27 + 0x880080));
    lbl_802F1B2C = OSCreateHeap((void *)(r27 + 0x880080), (void *)r28);
    OSSetCurrentHeap(lbl_802F1B2C);
    OSSetArenaLo((void *)(r27 + 0x880080));
    */
    
    /*
    start = r27;
    r27 += 0x80020;
    lbl_802F1B28 = OSCreateHeap((void *)start, (void *)(r27));
    start = r27;
    r27 += 0x300020;
    lbl_802F1B24 = OSCreateHeap((void *)(start), (void *)(r27));
    start = r27;
    r27 += 0x200020;
    lbl_802F1B20 = OSCreateHeap((void *)(start), (void *)(r27));
    start = r27;
    r27 += 0x300020;
    lbl_802F1B1C = OSCreateHeap((void *)(start), (void *)(r27));
    lbl_802F1B2C = OSCreateHeap((void *)(r27), (void *)r28);
    OSSetCurrentHeap(lbl_802F1B2C);
    OSSetArenaLo((void *)(r27));
    */
    

    lbl_802F1B18 = OSCheckHeap(lbl_802F1B2C);
    lbl_802F1B14 = OSCheckHeap(lbl_802F1B28);
    lbl_802F1B10 = OSCheckHeap(lbl_802F1B24);
    lbl_802F1B0C = OSCheckHeap(lbl_802F1B20);
    lbl_802F1B08 = OSCheckHeap(lbl_802F1B1C);
    
    init_cache_ptrs();
    
    lbl_802F1CA4[1] = (void *)r30;
    lbl_802F1CA4[2] = (void *)r29;
    lbl_802F1CA4[0] = (void *)r29;
    lbl_802F1CA4[3] = (void *)0;
}
#else
extern struct Struct801723C0 lbl_801723C0;
asm void init_heap(void)
{
#define _SDA_BASE_ 0
    nofralloc
/* 80006C48 00002B68  7C 08 02 A6 */	mflr r0
/* 80006C4C 00002B6C  3C 60 80 17 */	lis r3, lbl_801723C0@ha
/* 80006C50 00002B70  90 01 00 04 */	stw r0, 4(r1)
/* 80006C54 00002B74  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80006C58 00002B78  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 80006C5C 00002B7C  3B E3 23 C0 */	addi r31, r3, lbl_801723C0@l
/* 80006C60 00002B80  48 0B C0 39 */	bl OSGetArenaLo
/* 80006C64 00002B84  7C 7E 1B 78 */	mr r30, r3
/* 80006C68 00002B88  48 0B C0 29 */	bl OSGetArenaHi
/* 80006C6C 00002B8C  7C 7B 1B 78 */	mr r27, r3
/* 80006C70 00002B90  48 0C 03 AD */	bl OSGetPhysicalMemSize
/* 80006C74 00002B94  7C 7D 1B 78 */	mr r29, r3
/* 80006C78 00002B98  93 6D 99 70 */	stw r27, lbl_802F1B50-_SDA_BASE_(r13)
/* 80006C7C 00002B9C  3C 00 01 80 */	lis r0, 0x180
/* 80006C80 00002BA0  7C 1D 00 10 */	subfc r0, r29, r0
/* 80006C84 00002BA4  93 6D 99 74 */	stw r27, lbl_802F1B54-_SDA_BASE_(r13)
/* 80006C88 00002BA8  7F 9C E1 10 */	subfe r28, r28, r28
/* 80006C8C 00002BAC  7C 1C 00 D0 */	neg r0, r28
/* 80006C90 00002BB0  90 0D 99 78 */	stw r0, lbl_802F1B58-_SDA_BASE_(r13)
/* 80006C94 00002BB4  80 0D 99 78 */	lwz r0, lbl_802F1B58-_SDA_BASE_(r13)
/* 80006C98 00002BB8  2C 00 00 00 */	cmpwi r0, 0
/* 80006C9C 00002BBC  41 82 00 4C */	beq lbl_80006CE8
/* 80006CA0 00002BC0  38 7F 00 40 */	addi r3, r31, 0x40
/* 80006CA4 00002BC4  4C C6 31 82 */	crclr 6
/* 80006CA8 00002BC8  48 0B CF 79 */	bl OSReport
/* 80006CAC 00002BCC  38 7F 00 78 */	addi r3, r31, 0x78
/* 80006CB0 00002BD0  4C C6 31 82 */	crclr 6
/* 80006CB4 00002BD4  48 0B CF 6D */	bl OSReport
/* 80006CB8 00002BD8  3C 1D FE 80 */	addis r0, r29, 0xfe80
/* 80006CBC 00002BDC  4C C6 31 82 */	crclr 6
/* 80006CC0 00002BE0  7F 60 D8 50 */	subf r27, r0, r27
/* 80006CC4 00002BE4  38 9B 00 00 */	addi r4, r27, 0
/* 80006CC8 00002BE8  38 7F 00 AC */	addi r3, r31, 0xac
/* 80006CCC 00002BEC  48 0B CF 55 */	bl OSReport
/* 80006CD0 00002BF0  93 6D 99 74 */	stw r27, lbl_802F1B54-_SDA_BASE_(r13)
/* 80006CD4 00002BF4  7F 63 DB 78 */	mr r3, r27
/* 80006CD8 00002BF8  48 0B BF C9 */	bl OSSetArenaHi
/* 80006CDC 00002BFC  38 7F 00 40 */	addi r3, r31, 0x40
/* 80006CE0 00002C00  4C C6 31 82 */	crclr 6
/* 80006CE4 00002C04  48 0B CF 3D */	bl OSReport
lbl_80006CE8:
/* 80006CE8 00002C08  80 8D 99 50 */	lwz r4, currRenderMode-_SDA_BASE_(r13)
/* 80006CEC 00002C0C  38 1E 00 1F */	addi r0, r30, 0x1f
/* 80006CF0 00002C10  54 1E 00 34 */	rlwinm r30, r0, 0, 0, 0x1a
/* 80006CF4 00002C14  A0 64 00 04 */	lhz r3, 4(r4)
/* 80006CF8 00002C18  57 7C 00 34 */	rlwinm r28, r27, 0, 0, 0x1a
/* 80006CFC 00002C1C  A0 04 00 08 */	lhz r0, 8(r4)
/* 80006D00 00002C20  38 9C 00 00 */	addi r4, r28, 0
/* 80006D04 00002C24  38 63 00 0F */	addi r3, r3, 0xf
/* 80006D08 00002C28  54 63 04 36 */	rlwinm r3, r3, 0, 0x10, 0x1b
/* 80006D0C 00002C2C  7C 03 01 D6 */	mullw r0, r3, r0
/* 80006D10 00002C30  54 03 08 3C */	slwi r3, r0, 1
/* 80006D14 00002C34  38 63 00 1F */	addi r3, r3, 0x1f
/* 80006D18 00002C38  7C 1E 1A 14 */	add r0, r30, r3
/* 80006D1C 00002C3C  54 1D 00 34 */	rlwinm r29, r0, 0, 0, 0x1a
/* 80006D20 00002C40  7C 1D 1A 14 */	add r0, r29, r3
/* 80006D24 00002C44  54 03 00 34 */	rlwinm r3, r0, 0, 0, 0x1a
/* 80006D28 00002C48  38 A0 00 05 */	li r5, 5
/* 80006D2C 00002C4C  48 0B BB 29 */	bl OSInitAlloc
/* 80006D30 00002C50  38 03 00 1F */	addi r0, r3, 0x1f
/* 80006D34 00002C54  80 9F 00 00 */	lwz r4, 0(r31)
/* 80006D38 00002C58  54 1B 00 34 */	rlwinm r27, r0, 0, 0, 0x1a
/* 80006D3C 00002C5C  93 64 00 00 */	stw r27, 0(r4)
/* 80006D40 00002C60  80 7F 00 04 */	lwz r3, 4(r31)
/* 80006D44 00002C64  80 9F 00 08 */	lwz r4, 8(r31)
/* 80006D48 00002C68  38 03 00 1F */	addi r0, r3, 0x1f
/* 80006D4C 00002C6C  7C 1B 02 14 */	add r0, r27, r0
/* 80006D50 00002C70  54 1B 00 34 */	rlwinm r27, r0, 0, 0, 0x1a
/* 80006D54 00002C74  93 64 00 00 */	stw r27, 0(r4)
/* 80006D58 00002C78  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80006D5C 00002C7C  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 80006D60 00002C80  38 03 00 1F */	addi r0, r3, 0x1f
/* 80006D64 00002C84  7C 1B 02 14 */	add r0, r27, r0
/* 80006D68 00002C88  54 1B 00 34 */	rlwinm r27, r0, 0, 0, 0x1a
/* 80006D6C 00002C8C  93 64 00 00 */	stw r27, 0(r4)
/* 80006D70 00002C90  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80006D74 00002C94  80 9F 00 18 */	lwz r4, 0x18(r31)
/* 80006D78 00002C98  38 03 00 1F */	addi r0, r3, 0x1f
/* 80006D7C 00002C9C  7C 1B 02 14 */	add r0, r27, r0
/* 80006D80 00002CA0  54 1B 00 34 */	rlwinm r27, r0, 0, 0, 0x1a
/* 80006D84 00002CA4  93 64 00 00 */	stw r27, 0(r4)
/* 80006D88 00002CA8  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 80006D8C 00002CAC  38 03 00 1F */	addi r0, r3, 0x1f
/* 80006D90 00002CB0  7C 1B 02 14 */	add r0, r27, r0
/* 80006D94 00002CB4  54 1B 00 34 */	rlwinm r27, r0, 0, 0, 0x1a
/* 80006D98 00002CB8  38 7B 00 00 */	addi r3, r27, 0
/* 80006D9C 00002CBC  48 0B BF 0D */	bl OSSetArenaLo
/* 80006DA0 00002CC0  3C 9B 00 08 */	addis r4, r27, 8
/* 80006DA4 00002CC4  38 7B 00 00 */	addi r3, r27, 0
/* 80006DA8 00002CC8  38 84 00 20 */	addi r4, r4, 0x20
/* 80006DAC 00002CCC  48 0B BB 19 */	bl OSCreateHeap
/* 80006DB0 00002CD0  3C 9B 00 08 */	addis r4, r27, 8
/* 80006DB4 00002CD4  90 6D 99 48 */	stw r3, lbl_802F1B28-_SDA_BASE_(r13)
/* 80006DB8 00002CD8  3C 7B 00 08 */	addis r3, r27, 8
/* 80006DBC 00002CDC  3C 84 00 30 */	addis r4, r4, 0x30
/* 80006DC0 00002CE0  38 63 00 20 */	addi r3, r3, 0x20
/* 80006DC4 00002CE4  38 84 00 40 */	addi r4, r4, 0x40
/* 80006DC8 00002CE8  48 0B BA FD */	bl OSCreateHeap
/* 80006DCC 00002CEC  3C 9B 00 38 */	addis r4, r27, 0x38
/* 80006DD0 00002CF0  90 6D 99 44 */	stw r3, lbl_802F1B24-_SDA_BASE_(r13)
/* 80006DD4 00002CF4  3C 7B 00 38 */	addis r3, r27, 0x38
/* 80006DD8 00002CF8  3C 84 00 20 */	addis r4, r4, 0x20
/* 80006DDC 00002CFC  38 63 00 40 */	addi r3, r3, 0x40
/* 80006DE0 00002D00  38 84 00 60 */	addi r4, r4, 0x60
/* 80006DE4 00002D04  48 0B BA E1 */	bl OSCreateHeap
/* 80006DE8 00002D08  3C 9B 00 58 */	addis r4, r27, 0x58
/* 80006DEC 00002D0C  90 6D 99 40 */	stw r3, lbl_802F1B20-_SDA_BASE_(r13)
/* 80006DF0 00002D10  3C 7B 00 58 */	addis r3, r27, 0x58
/* 80006DF4 00002D14  3C 84 00 30 */	addis r4, r4, 0x30
/* 80006DF8 00002D18  38 63 00 60 */	addi r3, r3, 0x60
/* 80006DFC 00002D1C  38 84 00 80 */	addi r4, r4, 0x80
/* 80006E00 00002D20  48 0B BA C5 */	bl OSCreateHeap
/* 80006E04 00002D24  90 6D 99 3C */	stw r3, lbl_802F1B1C-_SDA_BASE_(r13)
/* 80006E08 00002D28  3C 7B 00 88 */	addis r3, r27, 0x88
/* 80006E0C 00002D2C  38 9C 00 00 */	addi r4, r28, 0
/* 80006E10 00002D30  38 63 00 80 */	addi r3, r3, 0x80
/* 80006E14 00002D34  48 0B BA B1 */	bl OSCreateHeap
/* 80006E18 00002D38  90 6D 99 4C */	stw r3, lbl_802F1B2C-_SDA_BASE_(r13)
/* 80006E1C 00002D3C  80 6D 99 4C */	lwz r3, lbl_802F1B2C-_SDA_BASE_(r13)
/* 80006E20 00002D40  48 0B BA 25 */	bl OSSetCurrentHeap
/* 80006E24 00002D44  3C 7B 00 88 */	addis r3, r27, 0x88
/* 80006E28 00002D48  38 63 00 80 */	addi r3, r3, 0x80
/* 80006E2C 00002D4C  48 0B BE 7D */	bl OSSetArenaLo
/* 80006E30 00002D50  80 6D 99 4C */	lwz r3, lbl_802F1B2C-_SDA_BASE_(r13)
/* 80006E34 00002D54  48 0B BA FD */	bl OSCheckHeap
/* 80006E38 00002D58  90 6D 99 38 */	stw r3, lbl_802F1B18-_SDA_BASE_(r13)
/* 80006E3C 00002D5C  80 6D 99 48 */	lwz r3, lbl_802F1B28-_SDA_BASE_(r13)
/* 80006E40 00002D60  48 0B BA F1 */	bl OSCheckHeap
/* 80006E44 00002D64  90 6D 99 34 */	stw r3, lbl_802F1B14-_SDA_BASE_(r13)
/* 80006E48 00002D68  80 6D 99 44 */	lwz r3, lbl_802F1B24-_SDA_BASE_(r13)
/* 80006E4C 00002D6C  48 0B BA E5 */	bl OSCheckHeap
/* 80006E50 00002D70  90 6D 99 30 */	stw r3, lbl_802F1B10-_SDA_BASE_(r13)
/* 80006E54 00002D74  80 6D 99 40 */	lwz r3, lbl_802F1B20-_SDA_BASE_(r13)
/* 80006E58 00002D78  48 0B BA D9 */	bl OSCheckHeap
/* 80006E5C 00002D7C  90 6D 99 2C */	stw r3, lbl_802F1B0C-_SDA_BASE_(r13)
/* 80006E60 00002D80  80 6D 99 3C */	lwz r3, lbl_802F1B1C-_SDA_BASE_(r13)
/* 80006E64 00002D84  48 0B BA CD */	bl OSCheckHeap
/* 80006E68 00002D88  90 6D 99 28 */	stw r3, lbl_802F1B08-_SDA_BASE_(r13)
/* 80006E6C 00002D8C  48 00 01 1D */	bl init_cache_ptrs
/* 80006E70 00002D90  80 6D 9A C4 */	lwz r3, lbl_802F1CA4-_SDA_BASE_(r13)
/* 80006E74 00002D94  38 00 00 00 */	li r0, 0
/* 80006E78 00002D98  93 C3 00 04 */	stw r30, 4(r3)
/* 80006E7C 00002D9C  80 6D 9A C4 */	lwz r3, lbl_802F1CA4-_SDA_BASE_(r13)
/* 80006E80 00002DA0  93 A3 00 08 */	stw r29, 8(r3)
/* 80006E84 00002DA4  80 6D 9A C4 */	lwz r3, lbl_802F1CA4-_SDA_BASE_(r13)
/* 80006E88 00002DA8  93 A3 00 00 */	stw r29, 0(r3)
/* 80006E8C 00002DAC  80 6D 9A C4 */	lwz r3, lbl_802F1CA4-_SDA_BASE_(r13)
/* 80006E90 00002DB0  90 03 00 0C */	stw r0, 0xc(r3)
/* 80006E94 00002DB4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80006E98 00002DB8  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 80006E9C 00002DBC  38 21 00 20 */	addi r1, r1, 0x20
/* 80006EA0 00002DC0  7C 08 03 A6 */	mtlr r0
/* 80006EA4 00002DC4  4E 80 00 20 */	blr 
}
#pragma peephole on
#endif

void init_rel(void)
{
    DVDFileInfo fileInfo;

    if (DVDOpen("mkbe.str", &fileInfo))
    {
        u32 size = (fileInfo.length + 0x1F) & ~0x1F;
        void *strTable = OSAllocFromHeap(__OSCurrHeap, size);
        if (g_read_dvd_file(&fileInfo, strTable, size, 0))
            OSSetStringTable(strTable);
        DVDClose(&fileInfo);
    }
}

void init_cache(void)
{
    LCEnable();
    mathutilData = (void *)0xE0000000;
    lbl_802F1CA4 = (void *)0xE00001B0;
    lbl_802F1B3C = (void *)0xE00001C8;
    zMode = (void *)0xE00002D8;
    printf("locked cache size: %d\n", 0xA0C);
}

