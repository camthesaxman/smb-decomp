#include <dolphin.h>

#include "functions.h"
#include "variables.h"

extern s32 lbl_802F2140;
extern s32 lbl_802F2138;
extern s32 lbl_802F2134;
extern volatile s32 lbl_802F213C;
extern void *lbl_802F1B48;

struct UnkStruct2
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
};

struct FileRelatedThing
{
    u32 unk0;
    u32 unk4;
    DVDFileInfo fileInfo;
    u8 filler44[4];
    u32 unk48;
    u32 unk4C;
    u32 unk50;
    u32 unk54;
    struct UnkStruct2 *unk58;
};
extern struct FileRelatedThing lbl_802B4FC0[];

void lbl_800921B8(s32, DVDFileInfo *);
extern void *func_800921D8(s32);

extern ARQRequest lbl_802B5780;

u32 lbl_802F12F0 = 0x700000;

void lbl_80091D28(u32 arqRequestPtr)
{
    lbl_802F2140 = 0;
}

void load_main(void)
{
    struct FileRelatedThing *r30;
    if (lbl_802F2138 == lbl_802F2134)
        return;
    r30 = &lbl_802B4FC0[lbl_802F2138];
    switch (r30->unk0)
    {
    case 0:
        r30->unk0 = 1;
        // fall through
    case 1:
        if (lbl_802F213C < 0)
        {
            lbl_802F2138 = lbl_802F2134;
            break;
        }
        if (lbl_802F213C != 0)
            break;
        if (DVDFastOpen(r30->unk4, &r30->fileInfo) != 1)
            OSPanic("load.c", 115, "cannot open file\n");
        r30->unk48 = (r30->fileInfo.length + 0x1F) & ~0x1F;
        r30->unk4C = 0;
        r30->unk50 = r30->unk48;
        r30->unk54 = (r30->unk50 < 0x18000) ? r30->unk50 : 0x18000;
        r30->unk58 = func_800921D8(r30->unk48);
        r30->unk58->unk4 = r30->unk4;
        // fall through
    case 2:
        lbl_802F213C = 1;
        if (DVDReadAsyncPrio(&r30->fileInfo, lbl_802F1B48, r30->unk54, r30->unk4C, lbl_800921B8, 2) != 1)
            OSPanic("load.c", 128, "cannot read file\n");
        r30->unk0 = 4;
        break;
    case 4:
        if (lbl_802F213C < 0)
        {
            lbl_802F2138 = lbl_802F2134;
            break;
        }
        if (lbl_802F213C != 0)
            break;
        // fall through
    case 5:
        lbl_802F2140 = 1;
        ARQPostRequest(&lbl_802B5780, 0, 0, 1, (u32)lbl_802F1B48, r30->unk58->unk8 + r30->unk4C, r30->unk54, lbl_80091D28);
        r30->unk0 = 6;
        break;
    case 6:
        if (lbl_802F2140 != 0)
            break;
        r30->unk50 -= r30->unk54;
        r30->unk4C += r30->unk54;
        // fall through
    case 3:
        if (r30->unk50 != 0)
        {
            r30->unk54 = (r30->unk50 < 0x18000) ? r30->unk50 : 0x18000;
            lbl_802F213C = 1;
            if (DVDReadAsyncPrio(&r30->fileInfo, lbl_802F1B48, r30->unk54, r30->unk4C, lbl_800921B8, 2) != 1)
                OSPanic("load.c", 155, "cannot read file\n");
            r30->unk0 = 4;
        }
        else
        {
            r30->unk58->unk0 = 1;
            DVDClose(&r30->fileInfo);
            lbl_802F2138 = func_80092430(lbl_802F2138);
        }
        break;
    }
}

struct UnkStruct3
{
    s32 unk0;
    s32 unk4;
    u32 unk8;
    u32 unkC;
};
extern struct UnkStruct3 lbl_802B5580[];

struct UnkStruct4
{
    u32 unk0;
    DVDFileInfo fileInfo;
    struct UnkStruct3 unk40;
};

BOOL file_open(char *filename, struct UnkStruct4 *b)
{
    int i;
    int entryNum = DVDConvertPathToEntrynum(filename);
    struct UnkStruct3 *r5 = lbl_802B5580;

    for (i = 0; i < 32; i++, r5++)
    {
        if (r5->unk0 == 1 && r5->unk4 == entryNum)
        {
            b->unk0 = 1;
            b->unk40 = *r5;
            return 1;
        }
    }
    b->unk0 = 0;
    return DVDOpen(filename, &b->fileInfo);
}

BOOL file_close(struct UnkStruct4 *a)
{
    switch (a->unk0)
    {
    case 1:
        return TRUE;
    case 0:
        break;
    }
    return DVDClose(&a->fileInfo);
}

extern volatile s32 lbl_802F2148;

void lbl_800920C8(u32 arqRequestPtr)
{
    lbl_802F2148 = 0;
}

u32 func_800920D4(struct UnkStruct4 *a, void *b, u32 c, u32 d)
{
    ARQRequest req;

    switch (a->unk0)
    {
    case 1:
        lbl_802F2148 = 1;
        DCInvalidateRange(b, c);
        ARQPostRequest(&req, 0, 1, 1, a->unk40.unk8 + d, (u32)b, c, lbl_800920C8);
        while (lbl_802F2148)
            ;
        return c;
    default:
        return func_800ACBBC(&a->fileInfo, b, c, d);
    }
}

u32 func_80092198(struct UnkStruct4 *a)
{
    switch (a->unk0)
    {
    case 1:
        return a->unk40.unkC;
    default:
        return a->fileInfo.length;
    }
}

void lbl_800921B8(s32 result, DVDFileInfo *fileInfo)
{
    if (result == -1)
        lbl_802F213C = -1;
    else
        lbl_802F213C = 0;
}

extern s32 lbl_802F2144;

void *func_800921D8(s32 a)
{
    u32 r31;
    struct UnkStruct3 *r3;

    a = (a + 0x1F) & ~0x1F;
    if (0xB00000 - lbl_802F12F0 > a)
    {
        r31 = lbl_802F12F0;
        lbl_802F12F0 += a;
    }
    else
    {
        r31 = 0x700000;
        lbl_802F12F0 = a + 0x700000;
    }
    func_80092284(r31, a);
    r3 = &lbl_802B5580[lbl_802F2144];
    if (++lbl_802F2144 >= 32)
        lbl_802F2144 = 0;
    r3->unk0 = 0;
    r3->unk8 = r31;
    r3->unkC = a;
    return r3;
}
