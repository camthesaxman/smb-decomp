#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "mathutil.h"
#include "nl2ngc.h"

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

#pragma peephole on  // above function isn't pure asm?

const struct Struct80171B40
{
    s8 unk0;
    u8 unk1;
    u8 filler2;
    float unk4;  // start
    float unk8;  // end
    GXColor unkC;
} lbl_80171B40[] =
{
    { 19, 5, 0, 150.0f, 1880.0f, { 236, 250, 255, 0 } },
    { -1, 0, 0,   0.0f,    0.0f, { 0 } },
};

struct Struct802BA200 lbl_802BA200;

extern const float lbl_802F59B0;
extern const float lbl_802F59B4;
extern const float lbl_802F59B8;
extern const float lbl_802F59BC;

void func_8009AAB0(void)
{
    const struct Struct80171B40 *r6 = lbl_80171B40;

    while (r6->unk0 != -1)
    {
        if (r6->unk0 == backgroundInfo.bgId)
        {
            lbl_802BA200.unkF = 1;
            lbl_802BA200.unk0 = r6->unk1;
            lbl_802BA200.unk4 = r6->unk4;
            lbl_802BA200.unk8 = r6->unk8;
            lbl_802BA200.r = r6->unkC.r;
            lbl_802BA200.g = r6->unkC.g;
            lbl_802BA200.b = r6->unkC.b;
            return;
        }
        r6++;
    }

    lbl_802BA200.unkF = 0;
    lbl_802BA200.unk0 = 5;
    lbl_802BA200.unk4 = lbl_802F59B0;
    lbl_802BA200.unk8 = lbl_802F59B4;
    lbl_802BA200.r = 0;
    lbl_802BA200.g = 0;
    lbl_802BA200.b = 0;
}

void func_8009AB5C(void)
{
    func_8008F878(lbl_802BA200.unkF);
    func_80033B50(lbl_802BA200.unkF);
    if (lbl_802BA200.unkF != 0)
    {
        func_8008F880(lbl_802BA200.unk0, lbl_802BA200.unk4, lbl_802BA200.unk8);
        func_8008F890(lbl_802BA200.r, lbl_802BA200.g, lbl_802BA200.b);
        func_80033B58(lbl_802BA200.unk0, lbl_802BA200.unk4, lbl_802BA200.unk8);
        g_nl2ngc_set_some_other_color(lbl_802BA200.r, lbl_802BA200.g, lbl_802BA200.b);
    }
}

void func_8009AC0C(s8 a)
{
    func_8008F878(a);
    func_80033B50(a);
}

void func_8009AC44(void)
{
    func_8008F878(lbl_802BA200.unkF);
    func_80033B50(lbl_802BA200.unkF);
}

void func_8009AC8C(void)
{
    GXColor sp10;

    sp10.r = lbl_802BA200.r;
    sp10.g = lbl_802BA200.g;
    sp10.b = lbl_802BA200.b;
    if (lbl_802BA200.unkF != 0)
        func_8009E398(lbl_802BA200.unk0, sp10, lbl_802BA200.unk4, lbl_802BA200.unk8, lbl_802F59B8, lbl_802F59BC);
    else
        func_8009E398(0, sp10, lbl_802F59B0, lbl_802F59B4, lbl_802F59B8, lbl_802F59BC);
}

extern struct
{
    u8 unk0;
    u8 filler1[3];
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
} lbl_801D3EF0;

void func_8009AD24(int a)
{
    lbl_801D3EF0.unk0 = a;
}

void func_8009AD30(int a, int b, int c, int d)
{
    lbl_801D3EF0.unk4 = a;
    lbl_801D3EF0.unk8 = b;
    lbl_801D3EF0.unkC = c;
    lbl_801D3EF0.unk10 = d;
}

void g_draw_line(Vec *pos1, Vec *pos2, GXColor *c)
{
    GXColor color;

    func_8009B64C();
    color = *c;
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXBegin(GX_LINES, GX_VTXFMT0, 2);
    GXPosition3f32(pos1->x, pos1->y, pos1->z);
    GXColor4u8(color.r, color.g, color.b, color.a);
    GXPosition3f32(pos2->x, pos2->y, pos2->z);
    GXColor4u8(color.r, color.g, color.b, color.a);
    GXEnd();
}
