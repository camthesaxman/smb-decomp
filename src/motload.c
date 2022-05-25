#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

struct MotDat *motDat;

struct Struct800341BC_4
{
    u32 unk0;
    u8 *unk4;
};

void func_800343E4(struct Struct80034F5C_1 *b);
void func_80034424(struct MotDat *dat, struct Struct80034F5C_1 *b);
void func_8003453C(struct MotDat *a, struct Struct80034F5C_1_sub *b);

void func_800341BC(struct Struct80034F5C_1 *a, struct Struct80034B50_child *b, u16 c)
{
    struct Struct80034F5C_1 *r31 = a;
    const u32 *r30;
    Vec *r29;
    Vec *r28;
    struct Struct80116F18 *r27;
    struct Struct80117084 *r26;
    int r25;

    r29 = b->unkC;
    r28 = b->unk10;
    r27 = b->unk4;
    r26 = b->unk8;
    r30 = lbl_80114F68[c];
    mathutil_mtxA_from_identity();
    a->unk1A0 = -1;

    r25 = 0;
    while (1)
    {
        u8 i;

        a->unk0 = *r30;
        mathutil_mtxA_to_mtx(a->unk1D8);
        mathutil_mtxA_to_mtx(a->unk208);
        if (a->unk0 & (1 << 6))
        {
            mathutil_mtxA_push();
            mathutil_mtxA_rotate_z(RADIANS_TO_S16(r26->rotZ));
            mathutil_mtxA_rotate_y(RADIANS_TO_S16(r26->rotY));
            mathutil_mtxA_rotate_x(RADIANS_TO_S16(r26->rotX));
            mathutil_mtxA_to_mtx(a->unk1C);
            r26++;
            mathutil_mtxA_pop();
        }
        a->unk4C = r27->length;
        a->unk50 = r27->unk4;
        for (i = 0; i < a->unk4C; i++)
            r31[a->unk50[i]].unk1A0 = (u8)r25;
        if (a->unk0 & (1 << 1))
        {
            a->unk4 = *r29++;
            a->unk10 = *r28++;
        }

        r30++;
        if (*r30 == 0)
            break;
        a++;
        r27++;
        r25++;
    }
    a++;
    a->unk0 = *r30;
}

void func_80034360(struct Struct80034F5C_1 *a, u16 b)
{
    struct MotDat sp10;

    func_800343E4(a);
    sp10 = motDat[b - 1];
    func_80034424(&sp10, a);
}

void func_800343E4(struct Struct80034F5C_1 *b)
{
    while (b->unk0 != 0)
    {
        struct Struct80034F5C_1_sub *r5 = b->unk54;
        u8 i;

        for (i = 6; i != 0; i--, r5++)
        {
            r5->unk1 = 0;
            r5->unk0 = 0;
        }
        b++;
    }
}

void func_80034424(struct MotDat *dat, struct Struct80034F5C_1 *b)
{
    struct MotDat_child2 *r30 = dat->unk4;
    int i;

    for (i = 0; b->unk0 != 0; i++, b++)
    {
        if (r30->unk0 == (u8)i)
        {
            u32 r31 = r30->unk2;

            if (r31 & (1 << 8))
                func_8003453C(dat, &b->unk54[0]);
            if (r31 & (1 << 7))
                func_8003453C(dat, &b->unk54[1]);
            if (r31 & (1 << 6))
                func_8003453C(dat, &b->unk54[2]);
            if (r31 & (1 << 5))
                func_8003453C(dat, &b->unk54[3]);
            if (r31 & (1 << 4))
                func_8003453C(dat, &b->unk54[4]);
            if (r31 & (1 << 3))
                func_8003453C(dat, &b->unk54[5]);
            if (r31 & (1 << 2))
                func_8003453C(dat, NULL);
            if (r31 & (1 << 1))
                func_8003453C(dat, NULL);
            if (r31 & (1 << 0))
                func_8003453C(dat, NULL);
            r30++;
        }
    }
}

void func_8003453C(struct MotDat *dat, struct Struct80034F5C_1_sub *b)
{
    u8 r5 = dat->unk8->unk0;
    int r6;
    u8 *r4;

    if (b != NULL)
    {
        b->unk0 = r5;
        b->unk4 = dat->unkC;
        b->unk8 = dat->unk10;
        b->unkC = dat->unk14;
    }
    dat->unk8++;
    dat->unkC += r5;
    r4 = dat->unk10;
    dat->unk10 += r5;
    r6 = 0;
    while (r5 != 0)
    {
        r5--;
        r6 += *r4++;
    }
    dat->unk14 += (u16)r6;
}

static u8 lzssHeader[32] ATTRIBUTE_ALIGN(32);

int init_ape_model_info(char *datname, char *labelname, char *sklname, char *infoname)
{
    DVDFileInfo file;
    void *compressed;
    u32 size;
    u32 totalSize;
    u32 compSize;
    u32 uncompSize;

    // Read label file
    if (!DVDOpen(labelname, &file))
        return 0;
    size = OSRoundUp32B(file.length);
    motLabel = OSAlloc(size);
    g_read_dvd_file(&file, motLabel, size, 0);
    DVDClose(&file);
    lbl_802F20AC = *motLabel;
    motLabel++;
    adjust_motlabel_pointers(motLabel);
    totalSize = size;

    // dat file
    if (!DVDOpen(datname, &file))
        return 0;
    if (g_read_dvd_file(&file, lzssHeader, 32, 0) < 0)
        OSPanic("motload.c", 90, "cannot dvd_read");
    compSize = OSRoundUp32B(__lwbrx(lzssHeader, 0));
    uncompSize = OSRoundUp32B(__lwbrx(lzssHeader, 4));
    if ((motDat = OSAlloc(uncompSize)) == NULL)
        OSPanic("motload.c", 94, "cannot OSAlloc\n");

    compressed = OSAlloc(compSize);
    if (compressed == NULL)
        OSPanic("motload.c", 95, "cannot OSAlooc\n");
    if (g_read_dvd_file(&file, compressed, compSize, 0) < 0)
        OSPanic("motload.c", 97, "cannot dvd_read");
    if (DVDClose(&file) != 1)
        OSPanic("motload.c", 98, "cannot DVDClose");
    lzs_decompress(compressed, motDat);
    OSFree(compressed);
    adjust_motdat_pointers(motDat);
    totalSize = totalSize + totalSize;

    // skeleton file
    if (!DVDOpen(sklname, &file))
        return 0;
    size = OSRoundUp32B(file.length);
    motSkeleton = OSAlloc(size);
    g_read_dvd_file(&file, motSkeleton, size, 0);
    DVDClose(&file);
    adjust_motskl_pointers(motSkeleton);
    totalSize += size;

    // info file
    if (!DVDOpen(infoname, &file))
        return 0;
    if (g_read_dvd_file(&file, lzssHeader, 32, 0) < 0)
        OSPanic("motload.c", 151, "cannot dvd_read");
    compSize = OSRoundUp32B(__lwbrx(lzssHeader, 0));
    uncompSize = OSRoundUp32B(__lwbrx(lzssHeader, 4));
    if ((motInfo = OSAlloc(uncompSize)) == NULL)
        OSPanic("motload.c", 155, "cannot OSAlloc\n");

    compressed = OSAlloc(compSize);
    if (compressed == NULL)
        OSPanic("motload.c", 156, "cannot OSAlooc\n");
    if (g_read_dvd_file(&file, compressed, compSize, 0) < 0)
        OSPanic("motload.c", 158, "cannot dvd_read");
    if (DVDClose(&file) != 1)
        OSPanic("motload.c", 159, "cannot DVDClose");
    lzs_decompress(compressed, motInfo);
    OSFree(compressed);
    adjust_motinfo_pointers(motInfo);
    totalSize += size;

    return totalSize;
}

void adjust_motdat_pointers(struct MotDat *a)
{
    int i;
    struct MotDat *temp = a;

    for (i = lbl_802F20AC; i >= 0; i--)
    {
        temp->unk4 = OFFSET_TO_PTR(temp->unk4, a);
        temp->unk8 = OFFSET_TO_PTR(temp->unk8, a);
        temp->unkC = OFFSET_TO_PTR(temp->unkC, a);
        temp->unk10 = OFFSET_TO_PTR(temp->unk10, a);
        temp->unk14 = OFFSET_TO_PTR(temp->unk14, a);
        temp++;
    }
}

void adjust_motlabel_pointers(u32 *a)
{
    int i;
    u32 *temp = a;

    for (i = lbl_802F20AC; i >= 0; i--)
    {
        *temp += (u32)a - 4;
        temp++;
    }
}

void adjust_motskl_pointers(struct MotSkeleton *a)
{
    struct Struct80034B50_child2 *r6;
    int j;
    int k;
    struct Struct80034B50_child *r4;
    struct Struct80116F18 *r4_;
    int i;

    a->unk0 = OFFSET_TO_PTR(a->unk0, a);
    a->unk8 = OFFSET_TO_PTR(a->unk8, a);
    for (i = 0, r4 = a->unk0; i < a->unk4; i++, r4++)
    {
        r4->unk0 = OFFSET_TO_PTR(r4->unk0, a);
        r4->unk4 = OFFSET_TO_PTR(r4->unk4, a);
        r4->unk8 = OFFSET_TO_PTR(r4->unk8, a);
        r4->unkC = OFFSET_TO_PTR(r4->unkC, a);
        r4->unk10 = OFFSET_TO_PTR(r4->unk10, a);
        r4->unk14 = OFFSET_TO_PTR(r4->unk14, a);
    }

    for (i = 0, r4_ = a->unk0->unk4; i < 4*7; i++, r4_++)
    {
        if (r4_->unk4 != NULL)
            r4_->unk4 = OFFSET_TO_PTR(r4_->unk4, a);
    }

    for (i = 0, r6 = a->unk8; i < a->unkC; i++, r6++)
    {
        r6->unk0 = OFFSET_TO_PTR(r6->unk0, a);
        for (j = 0; j < 3; j++)
        {
            struct Struct80034B50_child2_child *r8;

            r6->unk4[j] = OFFSET_TO_PTR(r6->unk4[j], a);
            for (k = 0, r8 = r6->unk4[j]; k < r6->unk10[j]; k++, r8++)
                r8->unk0 = OFFSET_TO_PTR(r8->unk0, a);
        }
    }
}

void adjust_motinfo_pointers(struct MotInfo *a)
{
    struct MotInfo *temp = a;
    int i;
    int j;

    for (i = 0; i < 32; i++)
    {
        for (j = 0; j < 16; j++)
            temp->unk30[j] = OFFSET_TO_PTR(temp->unk30[j], a);
        temp->unkB0 = OFFSET_TO_PTR(temp->unkB0, a);

        temp++;
    }
}

u16 func_80034F44(u16 index)
{
    return motDat[index - 1].unk0;
}
