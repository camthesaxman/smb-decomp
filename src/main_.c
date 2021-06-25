#include <dolphin.h>

struct Struct802F1B60
{
    u8 filler0[0x90];
    u8 *unk90;
    u8 *unk94;
    u8 filler98[0x198-0x98];
    float unk198;
    float unk19C;
    float unk1A0;
    float unk1A4;
    s32 unk1A8;
    u8 unk1AC;
    u8 unk1AD;
    u8 unk1AE;
    u8 unk1AF;
};

extern struct Struct802F1B60 *lbl_802F1B60;
extern void *lbl_802F1CA4;
extern void *lbl_802F1B3C;
extern void *lbl_802F21A0;

extern OSHeapHandle __OSCurrHeap;

extern void mathutil_set_a_mtx_identity(void);
extern void mathutil_set_b_mtx_a_mtx(void);

extern char lbl_801724B8[];
extern char lbl_801724AC[];

extern void OSSetStringTable(void *);

extern int printf(const char *, ...);

extern int func_800ACBBC();

void init_rel(void)
{
    DVDFileInfo fileInfo;

    if (DVDOpen(lbl_801724AC /*"mkbe.str"*/, &fileInfo))
    {
        u32 size = (fileInfo.length + 0x1F) & ~0x1F;
        void *strTable = OSAllocFromHeap(__OSCurrHeap, size);
        if (func_800ACBBC(&fileInfo, strTable, size, 0))
            OSSetStringTable(strTable);
        DVDClose(&fileInfo);
    }
}

void init_cache(void)
{
    LCEnable();
    lbl_802F1B60 = (void *)0xE0000000;
    lbl_802F1CA4 = (void *)0xE00001B0;
    lbl_802F1B3C = (void *)0xE00001C8;
    lbl_802F21A0 = (void *)0xE00002D8;
    printf("locked cache size: %d\n", 0xA0C);
}

void init_cache_ptrs(void)
{
    lbl_802F1B60->unk198 = 0.0f;
    lbl_802F1B60->unk19C = 1.0f;
    lbl_802F1B60->unk1A0 = 0.5f;
    lbl_802F1B60->unk1A4 = 1.5f;
    lbl_802F1B60->unk1A8 = -1;
    lbl_802F1B60->unk1AC = 0;
    lbl_802F1B60->unk1AD = 1;
    lbl_802F1B60->unk1AE = 1;
    lbl_802F1B60->unk1AF = 0;
    mathutil_set_a_mtx_identity();
    mathutil_set_b_mtx_a_mtx();
    lbl_802F1B60->unk90 = OSAllocFromHeap(__OSCurrHeap, 0x600);
    lbl_802F1B60->unk94 = lbl_802F1B60->unk90 + 0x600;
}
