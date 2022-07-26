#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

#ifdef TARGET_PC
#include "byteswap.h"
#endif

struct MotDat *motDat;

struct Struct800341BC_4
{
    u32 unk0;
    u8 *unk4;
};

void u_reset_channels_in_joints(struct AnimJoint *b);
void u_load_channels_from_dat_into_joints(struct MotDat *dat, struct AnimJoint *b);
void u_read_channel_from_dat(struct MotDat *a, struct MotionChannel *b);

void u_create_joints_from_skeleton(struct AnimJoint *joint, struct MotSkeletonEntry1 *skel, u16 c)
{
    struct AnimJoint *jointArr = joint;
    const u32 *flags;
    Vec *r29;
    Vec *r28;
    struct ChildJointList *childList;
    struct MotRotation *rotation;
    int jointIdx;

    r29 = skel->unkC;
    r28 = skel->unk10;
    childList = skel->childLists;
    rotation = skel->rotations;
    flags = u_jointFlagLists[c];
    mathutil_mtxA_from_identity();
    joint->parentIdx = -1;

    jointIdx = 0;
    while (1)
    {
        u8 i;

        joint->flags = *flags;
        mathutil_mtxA_to_mtx(joint->rotateMtx);
        mathutil_mtxA_to_mtx(joint->transformMtx);
        if (joint->flags & (1 << 6))
        {
            mathutil_mtxA_push();
            mathutil_mtxA_rotate_z(RADIANS_TO_S16(rotation->rotZ));
            mathutil_mtxA_rotate_y(RADIANS_TO_S16(rotation->rotY));
            mathutil_mtxA_rotate_x(RADIANS_TO_S16(rotation->rotX));
            mathutil_mtxA_to_mtx(joint->unk1C);
            rotation++;
            mathutil_mtxA_pop();
        }
        joint->childCount = childList->count;
        joint->childIndexes = childList->children;
        for (i = 0; i < joint->childCount; i++)
            jointArr[joint->childIndexes[i]].parentIdx = (u8)jointIdx;
        if (joint->flags & (1 << 1))
        {
            joint->unk4 = *r29++;
            joint->unk10 = *r28++;
        }

        flags++;
        if (*flags == 0)
            break;
        joint++;
        childList++;
        jointIdx++;
    }
    joint++;
    joint->flags = *flags;
}

void u_load_new_anim_into_joints(struct AnimJoint *joints, u16 animIdx)
{
    struct MotDat dat;

    u_reset_channels_in_joints(joints);
    dat = motDat[animIdx - 1];
    u_load_channels_from_dat_into_joints(&dat, joints);
}

void u_reset_channels_in_joints(struct AnimJoint *joint)
{
    while (joint->flags != 0)
    {
        struct MotionChannel *chan = joint->channels;
        u8 i;

        for (i = 6; i != 0; i--, chan++)
        {
            chan->currKeyframe = 0;
            chan->keyframeCount = 0;
        }
        joint++;
    }
}

// Loads channels for an array of joints
void u_load_channels_from_dat_into_joints(struct MotDat *dat, struct AnimJoint *joint)
{
    struct MotDatJoint *jointInfo = dat->jointInfo;
    int jointIdx;

    for (jointIdx = 0; joint->flags != 0; jointIdx++, joint++)
    {
        if (jointInfo->jointIdx == (u8)jointIdx)
        {
            u32 chanFlags = jointInfo->chanFlags;

            if (chanFlags & (1 << 8))
                u_read_channel_from_dat(dat, &joint->channels[0]);
            if (chanFlags & (1 << 7))
                u_read_channel_from_dat(dat, &joint->channels[1]);
            if (chanFlags & (1 << 6))
                u_read_channel_from_dat(dat, &joint->channels[2]);
            if (chanFlags & (1 << 5))
                u_read_channel_from_dat(dat, &joint->channels[3]);
            if (chanFlags & (1 << 4))
                u_read_channel_from_dat(dat, &joint->channels[4]);
            if (chanFlags & (1 << 3))
                u_read_channel_from_dat(dat, &joint->channels[5]);
            if (chanFlags & (1 << 2))
                u_read_channel_from_dat(dat, NULL);
            if (chanFlags & (1 << 1))
                u_read_channel_from_dat(dat, NULL);
            if (chanFlags & (1 << 0))
                u_read_channel_from_dat(dat, NULL);
            jointInfo++;
        }
    }
}

// Reads a channel from motDat
void u_read_channel_from_dat(struct MotDat *dat, struct MotionChannel *chan)
{
    u8 keyframeCount = *dat->keyframeCounts;
    int totalValues;
    u8 *valueCounts;

    if (chan != NULL)
    {
        chan->keyframeCount = keyframeCount;
        chan->times = dat->times;
        chan->valueCounts = dat->valueCounts;
        chan->values = dat->values;
    }

    // advance pointers to next channel
    dat->keyframeCounts++;
    dat->times += keyframeCount;
    valueCounts = dat->valueCounts;
    dat->valueCounts += keyframeCount;
    // advance 'values' pointer to next keyframe
    totalValues = 0;
    while (keyframeCount != 0)
    {
        keyframeCount--;
        totalValues += *valueCounts++;
    }
    dat->values += (u16)totalValues;
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
    byteswap_motskeleton(motSkeleton);
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
        temp->jointInfo = OFFSET_TO_PTR(temp->jointInfo, a);
        temp->keyframeCounts = OFFSET_TO_PTR(temp->keyframeCounts, a);
        temp->times = OFFSET_TO_PTR(temp->times, a);
        temp->valueCounts = OFFSET_TO_PTR(temp->valueCounts, a);
        temp->values = OFFSET_TO_PTR(temp->values, a);
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

void adjust_motskl_pointers(struct MotSkeleton *fileData)
{
    struct MotSkeletonEntry2 *r6;
    int j;
    int k;
    struct MotSkeletonEntry1 *skel;
    struct ChildJointList *childList;
    int i;

    fileData->unk0 = OFFSET_TO_PTR(fileData->unk0, fileData);
    fileData->unk8 = OFFSET_TO_PTR(fileData->unk8, fileData);
    for (i = 0, skel = fileData->unk0; i < fileData->unk4; i++, skel++)
    {
        skel->unk0       = OFFSET_TO_PTR(skel->unk0, fileData);
        skel->childLists = OFFSET_TO_PTR(skel->childLists, fileData);
        skel->rotations  = OFFSET_TO_PTR(skel->rotations, fileData);
        skel->unkC       = OFFSET_TO_PTR(skel->unkC, fileData);
        skel->unk10      = OFFSET_TO_PTR(skel->unk10, fileData);
        skel->name       = OFFSET_TO_PTR(skel->name, fileData);
    }

    childList = fileData->unk0->childLists;
    for (i = 0; i < 28; i++, childList++)
    {
        if (childList->children != NULL)
            childList->children = OFFSET_TO_PTR(childList->children, fileData);
    }

    for (i = 0, r6 = fileData->unk8; i < fileData->unkC; i++, r6++)
    {
        r6->unk0 = OFFSET_TO_PTR(r6->unk0, fileData);
        for (j = 0; j < 3; j++)
        {
            struct Struct80034B50_child2_child *r8;

            r6->unk4[j] = OFFSET_TO_PTR(r6->unk4[j], fileData);
            for (k = 0, r8 = r6->unk4[j]; k < r6->unk10[j]; k++, r8++)
                r8->unk0 = OFFSET_TO_PTR(r8->unk0, fileData);
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

u16 u_get_motdat_unk0(u16 index)
{
    return motDat[index - 1].unk0;
}
