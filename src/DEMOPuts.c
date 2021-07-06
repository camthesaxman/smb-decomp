#include <dolphin.h>

#include "functions.h"
#include "variables.h"

extern OSFontHeader *lbl_802F21D4;
extern s16 lbl_802F21DE;
extern s16 lbl_802F21DC;

OSFontHeader *func_800A51D4(void)
{
    if (OSGetFontEncode() == 1)
        lbl_802F21D4 = OSAllocFromHeap(__OSCurrHeap, 0x00120F00);
    else
        lbl_802F21D4 = OSAllocFromHeap(__OSCurrHeap, 0x00020120);
    if (lbl_802F21D4 == NULL)
        OSPanic("DEMOPuts.c", 413, "Ins. memory to load ROM font.");
    if (!OSInitFont(lbl_802F21D4))
        OSPanic("DEMOPuts.c", 417, "ROM font is available in boot ROM ver 0.8 or later.");
    lbl_802F21DC = (s16)(lbl_802F21D4->cellWidth * 16);
    lbl_802F21DE = -16;
    return lbl_802F21D4;
}

void func_800A529C(s16 size, s16 space)
{
    lbl_802F21DC = size * 16;
    lbl_802F21DE = space * 16;
}

void func_800A52C0(int x, int y, int z, int xChar, int yChar)
{
    s16 posLeft   = x;
    s16 posRight  = posLeft + (lbl_802F21DC * lbl_802F21D4->cellWidth) / lbl_802F21D4->cellWidth;
    s16 posBottom = y;
    s16 posTop    = y - (lbl_802F21D4->cellHeight * ((lbl_802F21D4->cellHeight * lbl_802F21DC) / lbl_802F21D4->cellWidth)) / lbl_802F21D4->cellHeight;
    s16 texLeft   = xChar;
    s16 texTop    = yChar;
    s16 texRight  = xChar + lbl_802F21D4->cellWidth;
    s16 texBottom = yChar + lbl_802F21D4->cellHeight;

    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3s16(posLeft, posTop, z);
        GXTexCoord2s16(texLeft, texTop);

        GXPosition3s16(posRight, posTop, z);
        GXTexCoord2s16(texRight, texTop);

        GXPosition3s16(posRight, posBottom, z);
        GXTexCoord2s16(texRight, texBottom);

        GXPosition3s16(posLeft, posBottom, z);
        GXTexCoord2s16(texLeft, texBottom);
    GXEnd();
}
