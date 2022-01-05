#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "mathutil.h"
#include "nl2ngc.h"

struct PointWithColor
{
    Point3d pos;
    GXColor color;
};

struct Struct80171B40
{
    s8 unk0;
    u8 unk1;
    u8 filler2;
    float unk4;  // start
    float unk8;  // end
    GXColor unkC;
} ;

void begin_display_list(void *buffer, u32 size)
{
    GXBeginDisplayList(buffer, size);
}

u32 end_display_list(void)
{
    return GXEndDisplayList();
}

u32 lbl_802F2198;

void func_8009A9A8(void)
{
    lbl_802F2198 = 0;
}

#pragma dont_inline on
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
#pragma dont_inline reset

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

const struct Struct80171B40 lbl_80171B40[] =
{
    { 19, 5, 0, 150.0f, 1880.0f, { 236, 250, 255, 0 } },
    { -1, 0, 0,   0.0f,    0.0f, { 0 } },
};

struct Struct802BA200 lbl_802BA200;

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
    lbl_802BA200.unk4 = 0.0f;
    lbl_802BA200.unk8 = 100.0f;
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
        func_8009E398(lbl_802BA200.unk0, sp10, lbl_802BA200.unk4, lbl_802BA200.unk8, 0.1f, 20000.0f);
    else
        func_8009E398(0, sp10, 0.0f, 100.0f, 0.1f, 20000.0f);
}

struct Struct801D3EF0
{
    u8 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    s32 unk14;
    u8 filler18[4];
};

struct Struct801D3EF0 lbl_801D3EF0 = { 6, 0, 1, 0, 0, 0 };

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

void g_draw_line(Vec *start, Vec *end, GXColor *c)
{
    GXColor color;

    func_8009B64C();
    color = *c;
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXBegin(GX_LINES, GX_VTXFMT0, 2);
        GXPosition3f32(start->x, start->y, start->z);
        GXColor4u8(color.r, color.g, color.b, color.a);
        GXPosition3f32(end->x, end->y, end->z);
        GXColor4u8(color.r, color.g, color.b, color.a);
    GXEnd();
}

#pragma force_active on
void func_8009AE18(u16 numPoints, Point3d *points, GXColor *color)
{
    GXColor c;
    int i;
    Point3d *p;

    if (numPoints < 2)
        return;
    func_8009B64C();
    c = *color;
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXBegin(GX_LINESTRIP, GX_VTXFMT0, numPoints);

    p = points;
    for (i = numPoints; i > 0; i--, p++)
    {
        GXPosition3f32(p->x, p->y, p->z);
        GXColor4u8(c.r, c.g, c.b, c.a);
    }
    GXEnd();
}
#pragma force_active reset

struct Struct8009B048_1
{
    u8 filler0[4];
    void (*unk4)(struct Struct8009B048_1 *);
    Mtx unk8;
    s32 unk38;
    u16 unk3C;
    Point3d *points;
    GXColor color;
    struct Struct801D3EF0 unk48;
};

void lbl_8009B140(struct Struct8009B048_1 *);

void func_8009B048(Point3d *start, Point3d *end, GXColor *c)
{
    struct Struct8009B048_1 *r31;
    Point3d *points;
    int r30 = func_80085698(start);

    r31 = g_alloc_some_drawing_mem(sizeof(*r31));
    points = g_alloc_some_drawing_mem(2 * sizeof(Point3d));
    r31->unk4 = lbl_8009B140;
    r31->unk38 = GX_LINES;
    r31->unk3C = 2;
    r31->unk48 = lbl_801D3EF0;
    r31->color = *c;
    points[0] = *start;
    points[1] = *end;
    r31->points = points;
    mathutil_mtxA_to_mtx(r31->unk8);
    func_80085B78(r30, r31);
}

void lbl_8009B140(struct Struct8009B048_1 *a)
{
    struct Struct801D3EF0 sp18 = lbl_801D3EF0;
    GXColor c;
    int i;
    Point3d *p;

    lbl_801D3EF0 = a->unk48;
    func_8009B64C();
    if (GX_ENABLE != zMode->updateEnable
     || GX_LEQUAL != zMode->compareFunc
     || GX_ENABLE != zMode->compareEnable)
    {
        GXSetZMode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = GX_LEQUAL;
        zMode->updateEnable  = GX_ENABLE;
    }

    c = a->color;
    GXLoadPosMtxImm(a->unk8, GX_PNMTX0);
    GXBegin(a->unk38, GX_VTXFMT0, a->unk3C);
    p = a->points;
    for (i = a->unk3C; i > 0; i--, p++)
    {
        GXPosition3f32(p->x, p->y, p->z);
        GXColor4u8(c.r, c.g, c.b, c.a);
    }
    GXEnd();
    lbl_801D3EF0 = sp18;
}

#pragma force_active on
void func_8009B474(struct PointWithColor *start, struct PointWithColor *end)
{
    func_8009B64C();
    GXLoadPosMtxImm(mathutilData->mtxA, GX_PNMTX0);
    GXBegin(GX_LINES, GX_VTXFMT0, 2);
        GXPosition3f32(start->pos.x, start->pos.y, start->pos.z);
        GXColor4u8(start->color.r, start->color.g, start->color.b, start->color.a);
        GXPosition3f32(end->pos.x, end->pos.y, end->pos.z);
        GXColor4u8(end->color.r, end->color.g, end->color.b, start->color.a);
    GXEnd();
}
#pragma force_active reset

struct Struct8009B538_1
{
    u8 filler0[4];
    void (*unk4)(struct Struct8009B538_1 *);
    Mtx unk8;
    s32 unk38;
    u16 unk3C;
    struct PointWithColor *points;
    struct Struct801D3EF0 unk44;
};

void lbl_8009B74C(struct Struct8009B538_1 *);

void func_8009B538(struct PointWithColor *a, struct PointWithColor *b)
{
    struct Struct8009B538_1 *r31;
    struct PointWithColor *points;
    int r30 = func_80085698(a);

    r31 = g_alloc_some_drawing_mem(sizeof(*r31));
    points = g_alloc_some_drawing_mem(2 * sizeof(struct PointWithColor));
    r31->unk4 = lbl_8009B74C;
    r31->unk38 = 0xA8;
    r31->unk3C = 2;
    r31->unk44 = lbl_801D3EF0;
    points[0] = *a;
    points[1] = *b;
    r31->points = points;
    mathutil_mtxA_to_mtx(r31->unk8);
    func_80085B78(r30, r31);
}

void func_8009B64C(void)
{
    if (lbl_801D3EF0.unk0 != zMode->lineWidth || lbl_801D3EF0.unk14 != zMode->texOffsets)
    {
        GXSetLineWidth(lbl_801D3EF0.unk0, lbl_801D3EF0.unk14);
        zMode->lineWidth = lbl_801D3EF0.unk0;
        zMode->texOffsets = lbl_801D3EF0.unk14;
    }
    g_set_vtx_desc((1 << GX_VA_POS) | (1 << GX_VA_CLR0));
    func_8009E110(lbl_801D3EF0.unk4, lbl_801D3EF0.unk8, lbl_801D3EF0.unkC, lbl_801D3EF0.unk10);
    GXSetChanCtrl(
        GX_COLOR0A0,  // chan
        GX_DISABLE,  // enable
        GX_SRC_VTX,  // amb_src
        GX_SRC_VTX,  // mat_src
        GX_LIGHT_NULL,  // light_mask
        GX_DF_CLAMP,  // diff_fn
        GX_AF_SPOT);  // attn_fn
    func_8009EFF4(0, 0xFF, 0xFF, 4);
    func_8009EA30(0, 4);
    GXSetTevDirect(GX_TEVSTAGE0);
    func_8009F2C8(1);
    GXSetNumTexGens(0);
    GXSetNumIndStages(0);
    GXSetNumChans(1);
}

void lbl_8009B74C(struct Struct8009B538_1 *a)
{
    struct Struct801D3EF0 sp18 = lbl_801D3EF0;
    int i;
    struct PointWithColor *p;

    lbl_801D3EF0 = a->unk44;
    func_8009B64C();
    if (GX_ENABLE != zMode->updateEnable
     || GX_LEQUAL != zMode->compareFunc
     || GX_ENABLE != zMode->compareEnable)
    {
        GXSetZMode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
        zMode->compareEnable = GX_ENABLE;
        zMode->compareFunc   = GX_LEQUAL;
        zMode->updateEnable  = GX_ENABLE;
    }

    GXLoadPosMtxImm(a->unk8, GX_PNMTX0);
    GXBegin(a->unk38, GX_VTXFMT0, a->unk3C);
    p = a->points;
    for (i = a->unk3C; i > 0; i--, p++)
    {
        GXPosition3f32(p->pos.x, p->pos.y, p->pos.z);
        GXColor4u8(p->color.r, p->color.g, p->color.b, p->color.a);
    }
    GXEnd();
    lbl_801D3EF0 = sp18;
}
