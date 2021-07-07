#include <dolphin.h>

#include "functions.h"
#include "variables.h"

extern s32 transfer1InProgress;
extern s32 lbl_802F2138;
extern s32 lbl_802F2134;
extern volatile s32 dvdReadStatus;
extern void *lbl_802F1B48;

struct UnkStruct3
{
    s32 unk0;
    s32 entryNum;
    u32 unk8;
    u32 unkC;
};
extern struct UnkStruct3 lbl_802B5580[];

struct FileRelatedThing
{
    u32 state;
    u32 unk4;
    DVDFileInfo fileInfo;
    u8 filler44[4];
    u32 unk48;
    u32 unk4C;
    u32 unk50;
    u32 unk54;
    struct UnkStruct3 *unk58;
};
extern struct FileRelatedThing lbl_802B4FC0[];

void lbl_800921B8(s32, DVDFileInfo *);
struct UnkStruct3 *alloc_file_buffer(s32);

extern ARQRequest lbl_802B5780;

u32 lbl_802F12F0 = 0x700000;

void arq_callback_1(u32 arqRequestPtr)
{
    transfer1InProgress = FALSE;
}

void load_main(void)
{
    struct FileRelatedThing *r30;

    if (lbl_802F2138 == lbl_802F2134)
        return;
    r30 = &lbl_802B4FC0[lbl_802F2138];
    switch (r30->state)
    {
    case 0:
        r30->state = 1;
        // fall through
    case 1:
        if (dvdReadStatus < 0)  // error
        {
            lbl_802F2138 = lbl_802F2134;
            break;
        }
        if (dvdReadStatus != 0)
            break;
        if (DVDFastOpen(r30->unk4, &r30->fileInfo) != 1)
            OSPanic("load.c", 115, "cannot open file\n");
        r30->unk48 = (r30->fileInfo.length + 0x1F) & ~0x1F;
        r30->unk4C = 0;
        r30->unk50 = r30->unk48;
        r30->unk54 = (r30->unk50 < 0x18000) ? r30->unk50 : 0x18000;
        r30->unk58 = alloc_file_buffer(r30->unk48);
        r30->unk58->entryNum = r30->unk4;
        // fall through
    case 2:
        dvdReadStatus = 1;
        if (DVDReadAsync(&r30->fileInfo, lbl_802F1B48, r30->unk54, r30->unk4C, lbl_800921B8) != 1)
            OSPanic("load.c", 128, "cannot read file\n");
        r30->state = 4;
        break;
    case 4:
        if (dvdReadStatus < 0)  // error
        {
            lbl_802F2138 = lbl_802F2134;
            break;
        }
        if (dvdReadStatus != 0)
            break;
        // fall through
    case 5:
        transfer1InProgress = TRUE;
        ARQPostRequest(&lbl_802B5780, 0, 0, 1, (u32)lbl_802F1B48, r30->unk58->unk8 + r30->unk4C, r30->unk54, arq_callback_1);
        r30->state = 6;
        break;
    case 6:
        if (transfer1InProgress)
            break;
        r30->unk50 -= r30->unk54;
        r30->unk4C += r30->unk54;
        // fall through
    case 3:
        if (r30->unk50 != 0)
        {
            r30->unk54 = (r30->unk50 < 0x18000) ? r30->unk50 : 0x18000;
            dvdReadStatus = 1;
            if (DVDReadAsync(&r30->fileInfo, lbl_802F1B48, r30->unk54, r30->unk4C, lbl_800921B8) != 1)
                OSPanic("load.c", 155, "cannot read file\n");
            r30->state = 4;
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
        if (r5->unk0 == 1 && r5->entryNum == entryNum)
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

extern volatile s32 transfer2InProgress;

void arq_callback_2(u32 arqRequestPtr)
{
    transfer2InProgress = FALSE;
}

u32 func_800920D4(struct UnkStruct4 *a, void *b, u32 c, u32 d)
{
    ARQRequest req;

    switch (a->unk0)
    {
    case 1:
        transfer2InProgress = TRUE;
        DCInvalidateRange(b, c);
        ARQPostRequest(&req, 0, 1, 1, a->unk40.unk8 + d, (u32)b, c, arq_callback_2);
        while (transfer2InProgress)
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
    if (result == DVD_RESULT_FATAL_ERROR)
        dvdReadStatus = -1;
    else
        dvdReadStatus = 0;
}

extern s32 lbl_802F2144;

void func_80092284(u32 a, u32 b);

struct UnkStruct3 *alloc_file_buffer(s32 size)
{
    u32 r31;
    struct UnkStruct3 *r3;

    size = OSRoundUp32B(size);
    if (0xB00000 - lbl_802F12F0 > size)
    {
        r31 = lbl_802F12F0;
        lbl_802F12F0 += size;
    }
    else
    {
        r31 = 0x700000;
        lbl_802F12F0 = size + 0x700000;
    }
    func_80092284(r31, size);
    r3 = &lbl_802B5580[lbl_802F2144];
    if (++lbl_802F2144 >= 32)
        lbl_802F2144 = 0;
    r3->unk0 = 0;
    r3->unk8 = r31;
    r3->unkC = size;
    return r3;
}

void func_80092284(u32 a, u32 b)
{
    struct UnkStruct3 *r7 = lbl_802B5580;
    int i;

    for (i = 0; i < 32; i++, r7++)
    {
        if (r7->unk0 != 0 && r7->unk8 < (a + b) && r7->unk8 + r7->unkC > a)
            r7->unk0 = 0;
    }
}

int func_8009236C(char *filename)
{
    int entryNum = DVDConvertPathToEntrynum(filename);
    if (entryNum < 0)
        return 0;
    if (lbl_802F2134 == lbl_802F2138)
        perf_init_timer(2);
    return func_800923C4(entryNum);
}

int func_800923C4(int entryNum)
{
    int r3 = func_80092430(lbl_802F2134);
    if (lbl_802F2138 == r3)
        return 0;
    lbl_802B4FC0[lbl_802F2134].state = 0;
    lbl_802B4FC0[lbl_802F2134].unk4 = entryNum;
    lbl_802F2134 = r3;
    return 1;
}

int func_80092430(int a)
{
    a++;
    if (a < 16)
        return a;
    else
        return 0;
}

int func_80092444(void)
{
    return lbl_802F2134 != lbl_802F2138;
}

void func_8009245C(void)
{
    lbl_802F2138 = lbl_802F2134;
}

int func_80092468(void)
{
    if (lbl_802F2134 < lbl_802F2138)
        return lbl_802F2134 + 16 - lbl_802F2138;
    else
        return lbl_802F2134 - lbl_802F2138;
}

void func_8009248C(void)
{
    lbl_802F12F0 = 0x700000;
}

extern void *lbl_802F2154;
extern u8 lbl_802B57A0[];
extern u32 lbl_802F2150;

void func_80092498(void)
{
    func_800924CC();
    lbl_802F2150 = 0;
    lbl_802F2154 = lbl_802B57A0;
}
