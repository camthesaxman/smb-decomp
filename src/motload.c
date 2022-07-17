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

void u_clear_mot_transforms(struct JointBoneThing *b);
void u_load_mot_transforms(struct MotDat *dat, struct JointBoneThing *b);
void u_read_transform_list_from_dat(struct MotDat *a, struct MotionTransform *b);

void func_800341BC(struct JointBoneThing *a, struct MotSkeletonEntry1 *skel, u16 c)
{
    struct JointBoneThing *r31 = a;
    const u32 *flags;
    Vec *r29;
    Vec *r28;
    struct Struct80116F18 *r27;
    struct MotRotation *rotation;
    int r25;

    r29 = skel->unkC;
    r28 = skel->unk10;
    r27 = skel->unk4;
    rotation = skel->rotations;
    flags = lbl_80114F68[c];
    mathutil_mtxA_from_identity();
    a->unk1A0 = -1;

    r25 = 0;
    while (1)
    {
        u8 i;

        a->flags = *flags;
        mathutil_mtxA_to_mtx(a->rotateMtx);
        mathutil_mtxA_to_mtx(a->transformMtx);
        if (a->flags & (1 << 6))
        {
            mathutil_mtxA_push();
            mathutil_mtxA_rotate_z(RADIANS_TO_S16(rotation->rotZ));
            mathutil_mtxA_rotate_y(RADIANS_TO_S16(rotation->rotY));
            mathutil_mtxA_rotate_x(RADIANS_TO_S16(rotation->rotX));
            mathutil_mtxA_to_mtx(a->unk1C);
            rotation++;
            mathutil_mtxA_pop();
        }
        a->unk4C = r27->length;
        a->unk50 = r27->unk4;
        for (i = 0; i < a->unk4C; i++)
            r31[a->unk50[i]].unk1A0 = (u8)r25;
        if (a->flags & (1 << 1))
        {
            a->unk4 = *r29++;
            a->unk10 = *r28++;
        }

        flags++;
        if (*flags == 0)
            break;
        a++;
        r27++;
        r25++;
    }
    a++;
    a->flags = *flags;
}

void func_80034360(struct JointBoneThing *a, u16 b)
{
    struct MotDat dat;

    u_clear_mot_transforms(a);
    dat = motDat[b - 1];
    u_load_mot_transforms(&dat, a);
}

void u_clear_mot_transforms(struct JointBoneThing *b)
{
    while (b->flags != 0)
    {
        struct MotionTransform *r5 = b->transforms;
        u8 i;

        for (i = 6; i != 0; i--, r5++)
        {
            r5->unk1 = 0;
            r5->unk0 = 0;
        }
        b++;
    }
}

void u_load_mot_transforms(struct MotDat *dat, struct JointBoneThing *b)
{
    struct MotDat_child2 *r30 = dat->unk4;
    int i;

    for (i = 0; b->flags != 0; i++, b++)
    {
        if (r30->unk0 == (u8)i)
        {
            u32 r31 = r30->unk2;

            if (r31 & (1 << 8))
                u_read_transform_list_from_dat(dat, &b->transforms[0]);
            if (r31 & (1 << 7))
                u_read_transform_list_from_dat(dat, &b->transforms[1]);
            if (r31 & (1 << 6))
                u_read_transform_list_from_dat(dat, &b->transforms[2]);
            if (r31 & (1 << 5))
                u_read_transform_list_from_dat(dat, &b->transforms[3]);
            if (r31 & (1 << 4))
                u_read_transform_list_from_dat(dat, &b->transforms[4]);
            if (r31 & (1 << 3))
                u_read_transform_list_from_dat(dat, &b->transforms[5]);
            if (r31 & (1 << 2))
                u_read_transform_list_from_dat(dat, NULL);
            if (r31 & (1 << 1))
                u_read_transform_list_from_dat(dat, NULL);
            if (r31 & (1 << 0))
                u_read_transform_list_from_dat(dat, NULL);
            r30++;
        }
    }
}

void u_read_transform_list_from_dat(struct MotDat *dat, struct MotionTransform *transform)
{
    u8 r5 = dat->unk8->unk0;
    int r6;
    u8 *r4;

    if (transform != NULL)
    {
        transform->unk0 = r5;
        transform->unk4 = dat->unkC;
        transform->numComponents = dat->unk10;
        transform->values = dat->unk14;
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

#ifdef TARGET_PC
static void byteswap_motlabel(u8 *data)
{
    u32 count;
    u32 i;

    bswap32(data);
    count = read_u32_le(data);
    data += 4;
    for (i = 0; i < count; i++)
    {
        bswap32(data);
        data += 4;
    }
}

static void byteswap_motskl(u8 *data)
{
    u8 *ptr, *ptr2;
    u32 i, j;

    // TODO: child structs

    bswap32(data + 0x0);
    bswap32(data + 0x4);
    bswap32(data + 0x8);
    bswap32(data + 0xC);

    ptr = data + read_u32_le(data + 0x0);
    for (i = read_u32_le(data + 0x4); i > 0; i--)
    {
        bswap32(ptr + 0x00);
        bswap32(ptr + 0x04);
        bswap32(ptr + 0x08);
        bswap32(ptr + 0x0C);
        bswap32(ptr + 0x10);
        bswap32(ptr + 0x14);
        ptr += 0x18;
    }

    ptr = data + read_u32_le(data + 0x8);
    for (i = read_u32_le(data + 0xC); i > 0; i--)
    {
        bswap32(ptr + 0x00);
        bswap32(ptr + 0x04);
        bswap32(ptr + 0x08);
        bswap32(ptr + 0x0C);
        bswap32(ptr + 0x10);
        bswap32(ptr + 0x14);
        bswap32(ptr + 0x18);

        ptr += 0x1C;
    }
}
#endif

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
    u_read_dvd_file(&file, motLabel, size, 0);
    DVDClose(&file);
#ifdef TARGET_PC
    byteswap_motlabel((u8 *)motLabel);
#endif
    u_motAnimCount = *motLabel;
    motLabel++;
    adjust_motlabel_pointers(motLabel);
    totalSize = size;

    // dat file
    if (!DVDOpen(datname, &file))
        return 0;
    if (u_read_dvd_file(&file, lzssHeader, 32, 0) < 0)
        OSPanic("motload.c", 90, "cannot dvd_read");
    compSize = OSRoundUp32B(__lwbrx(lzssHeader, 0));
    uncompSize = OSRoundUp32B(__lwbrx(lzssHeader, 4));
    if ((motDat = OSAlloc(uncompSize)) == NULL)
        OSPanic("motload.c", 94, "cannot OSAlloc\n");

    compressed = OSAlloc(compSize);
    if (compressed == NULL)
        OSPanic("motload.c", 95, "cannot OSAlooc\n");
    if (u_read_dvd_file(&file, compressed, compSize, 0) < 0)
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
    u_read_dvd_file(&file, motSkeleton, size, 0);
    DVDClose(&file);
#ifdef TARGET_PC
    byteswap_motskl((u8 *)motSkeleton);
#endif
    adjust_motskl_pointers(motSkeleton);
    totalSize += size;

    // info file
    if (!DVDOpen(infoname, &file))
        return 0;
    if (u_read_dvd_file(&file, lzssHeader, 32, 0) < 0)
        OSPanic("motload.c", 151, "cannot dvd_read");
    compSize = OSRoundUp32B(__lwbrx(lzssHeader, 0));
    uncompSize = OSRoundUp32B(__lwbrx(lzssHeader, 4));
    if ((motInfo = OSAlloc(uncompSize)) == NULL)
        OSPanic("motload.c", 155, "cannot OSAlloc\n");

    compressed = OSAlloc(compSize);
    if (compressed == NULL)
        OSPanic("motload.c", 156, "cannot OSAlooc\n");
    if (u_read_dvd_file(&file, compressed, compSize, 0) < 0)
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

    for (i = u_motAnimCount; i >= 0; i--)
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

    for (i = u_motAnimCount; i >= 0; i--)
    {
        *temp += (u32)a - 4;
        temp++;
    }
}

void adjust_motskl_pointers(struct MotSkeleton *skel)
{
    struct MotSkeletonEntry2 *r6;
    int j;
    int k;
    struct MotSkeletonEntry1 *r4;
    struct Struct80116F18 *r4_;
    int i;

    skel->unk0 = OFFSET_TO_PTR(skel->unk0, skel);
    skel->unk8 = OFFSET_TO_PTR(skel->unk8, skel);
    for (i = 0, r4 = skel->unk0; i < skel->unk4; i++, r4++)
    {
        r4->unk0 = OFFSET_TO_PTR(r4->unk0, skel);
        r4->unk4 = OFFSET_TO_PTR(r4->unk4, skel);
        r4->rotations = OFFSET_TO_PTR(r4->rotations, skel);
        r4->unkC = OFFSET_TO_PTR(r4->unkC, skel);
        r4->unk10 = OFFSET_TO_PTR(r4->unk10, skel);
        r4->name = OFFSET_TO_PTR(r4->name, skel);
    }

    for (i = 0, r4_ = skel->unk0->unk4; i < 4*7; i++, r4_++)
    {
        if (r4_->unk4 != NULL)
            r4_->unk4 = OFFSET_TO_PTR(r4_->unk4, skel);
    }

    for (i = 0, r6 = skel->unk8; i < skel->unkC; i++, r6++)
    {
        r6->unk0 = OFFSET_TO_PTR(r6->unk0, skel);
        for (j = 0; j < 3; j++)
        {
            struct Struct80034B50_child2_child *r8;

            r6->unk4[j] = OFFSET_TO_PTR(r6->unk4[j], skel);
            for (k = 0, r8 = r6->unk4[j]; k < r6->unk10[j]; k++, r8++)
                r8->unk0 = OFFSET_TO_PTR(r8->unk0, skel);
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
