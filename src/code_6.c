#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"

struct Struct802C5D60 lbl_802C5D60;

#pragma force_active on
void func_800A71B0(char *a, char *b)
{
    func_80094840();
    strcpy(lbl_802C5D60.unk20, a);
    func_80094750(14);
    func_800947F8();
    func_800947B0();
    strcpy(b, lbl_802C5D60.unk20);
    HIOWriteMailbox(0);
}

struct Struct80094870 *func_800A722C(char *a, u32 b)
{
    struct Struct80094870 *r30 = func_80094870();

    if (r30 == NULL)
    {
        printf("not allocate file descriptor %s.\n", a);
        return NULL;
    }
    func_80094840();
    strcpy(lbl_802C5D60.unk20, a);
    lbl_802C5D60.unk4 = b;
    func_80094750(9);
    if (func_800947F8() == 0)
    {
        printf("file %s open failed\n", a);
        func_800948D0(r30);
        HIOWriteMailbox(0);
        return NULL;
    }
    func_800947B0();
    r30->unk4 = 0;
    r30->unk0 = lbl_802C5D60.unk4;
    HIOWriteMailbox(0);
    return r30;
}

void func_800A7314(struct Struct80094870 *a)
{
    if (a == NULL)
        return;
    func_80094840();
    lbl_802C5D60.unk4 = a->unk0;
    func_80094750(12);
    func_800947F8();
    func_800948D0(a);
    HIOWriteMailbox(0);
}

void func_800A7370(struct Struct80094870 *a, u8 *addr, u32 size)
{
    int blockSize;
    int offset;

    if (a == NULL)
        return;
    func_80094840();
    lbl_802C5D60.unk4 = a->unk0;
    lbl_802C5D60.unk10 = size;
    func_80094750(10);
    func_800947F8();
    HIOWriteMailbox(1);
    func_80094840();
    offset = 0;
    while (size != 0)
    {
        func_80094840();
        HIOWriteMailbox(0);
        func_800947F8();
        if (size > 0x1D000)
            blockSize = 0x1D000;
        else
            blockSize = size;
        HIORead(0x3000, addr + offset, blockSize);
        size -= blockSize;
        HIOWriteMailbox(1);
        offset += blockSize;
    }
    func_80094840();
    HIOWriteMailbox(0);
    func_800947F8();
}

void func_800A7440(struct Struct80094870 *a, u8 *addr, u32 size)
{
    int blockSize;
    int offset;

    if (a == NULL)
        return;
    func_80094840();
    lbl_802C5D60.unk4 = a->unk0;
    lbl_802C5D60.unk10 = size;
    func_80094750(11);
    func_800947F8();
    HIOWriteMailbox(1);
    func_80094840();
    HIOWriteMailbox(0);
    func_800947F8();
    offset = 0;
    while (size != 0)
    {
        HIOWriteMailbox(0);
        func_80094840();
        if (size > 0x1D000)
            blockSize = 0x1D000;
        else
            blockSize = size;
        HIOWrite(0x3000, addr + offset, blockSize);
        size -= blockSize;
        HIOWriteMailbox(1);
        func_800947F8();
        offset += blockSize;
    }
    HIOWriteMailbox(0);
    func_80094840();
    HIOWriteMailbox(1);
    func_800947F8();
    HIOWriteMailbox(0);
}
#pragma force_active reset
