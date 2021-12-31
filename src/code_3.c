#include <dolphin.h>

#include "global.h"

void begin_display_list(void *buffer, u32 size)
{
    GXBeginDisplayList(buffer, size);
}

u32 end_display_list(void)
{
    return GXEndDisplayList();
}

void func_8009A9A8(void)
{
    lbl_802F2198 = 0;
}

void g_set_vtx_desc(u32 attrs)
{
    u32 i;

    if (attrs != lbl_802F2198)
    {
        GXClearVtxDesc();
        lbl_802F2198 = attrs;
        for (i = 0; i <= 16; i++, attrs >>= 1)
        {
            if (attrs & 1)
                GXSetVtxDesc(i, GX_DIRECT);
        }
    }
}

void func_8009AA20(void) {}

#ifdef __MWERKS__
asm void func_8009AA24(void *a, int b)
{
    nofralloc
    mr r5, r4
    add r4, r4, r4
    add r4, r4, r5
    li r7, 0x10
    add r5, r4, r4
    lis r6, 0xCC008000@h
    add r4, r5, r4
    ori r6, r6, 0xCC008000@l
    add r5, r5, r5
    addis r5, r5, 0xb
    stb r7, 0(r6)
    stw r5, 0(r6)
    psq_l f0, 0(r3), 0, qr0
    psq_l f1, 8(r3), 0, qr0
    psq_l f2, 16(r3), 0, qr0
    psq_l f3, 24(r3), 0, qr0
    psq_l f4, 32(r3), 0, qr0
    psq_l f5, 40(r3), 0, qr0
    psq_st f0, 0(r6), 0, qr0
    psq_st f1, 0(r6), 0, qr0
    psq_st f2, 0(r6), 0, qr0
    psq_st f3, 0(r6), 0, qr0
    psq_st f4, 0(r6), 0, qr0
    psq_st f5, 0(r6), 0, qr0
    addis r4, r4, 8
    addi r4, r4, 0x400
    stb r7, 0(r6)
    stw r4, 0(r6)
    psq_st f0, 0(r6), 0, qr0
    psq_st f1, 0(r6), 1, qr0
    psq_st f2, 0(r6), 0, qr0
    psq_st f3, 0(r6), 1, qr0
    psq_st f4, 0(r6), 0, qr0
    psq_st f5, 0(r6), 1, qr0
    blr
}
#else
// TODO
#endif

/*
extern struct Struct80171B40
{
    
} lbl_80171B40[];

void func_8009AAB0(void)
{
    struct Struct80171B40 *r6 = lbl_80171B40;
}
*/
