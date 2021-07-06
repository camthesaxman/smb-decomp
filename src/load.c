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

void lbl_80091D28(u32 arqRequestPtr)
{
    lbl_802F2140 = 0;
}

void lbl_800921B8(s32, DVDFileInfo *);
extern void *func_800921D8();

extern ARQRequest lbl_802B5780;

u32 lbl_802F12F0 = 0x700000;

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
