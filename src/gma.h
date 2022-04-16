#ifndef _SRC_GMA_H_
#define _SRC_GMA_H_

#include <dolphin/types.h>
#include <dolphin/GXStruct.h>
#include <dolphin/GXEnum.h>
#include <dolphin/mtx.h>

enum
{
    GMA_TEV_STAGE_FLAG_UNK0 = 1 << 0,
    GMA_TEV_STAGE_FLAG_UNK1 = 1 << 1,
    // Bits 2-3 for S wrap mode
    // Bits 4-5 for T wrap mode
    GMA_TEV_STAGE_FLAG_UNK6 = 1 << 6,
    // Bits 7-10 for max LOD
    GMA_TEV_STAGE_FLAG_UNK11 = 1 << 11,
    GMA_TEV_STAGE_FLAG_UNK13 = 1 << 13,
    GMA_TEV_STAGE_FLAG_UNK15 = 1 << 15,
    GMA_TEV_STAGE_FLAG_UNK16 = 1 << 16,
};

// at GMAModel + 0x40
struct GMATevStageDesc
{
    u32 flags;
    u16 unk4;
    s8 lodBias;
    u8 maxAniso;
    GXTexObj *texObj;
    u8 fillerC[0x20-0xC];
};// GMAModel.flags

enum
{
    GCMF_16BIT = 0x01,
    GCMF_STITCHING = 0x04,
    GCMF_SKIN = 0x08,
    GCMF_EFFECTIVE = 0x10,
};

struct GMAModel
{
    /*0x00*/ u32 magic;  // "GCMF"
    /*0x04*/ u32 flags;
    /*0x08*/ Vec boundSphereCenter;
    /*0x14*/ float boundSphereRadius;
    /*0x18*/ u16 tevStageDescCount;
    /*0x1A*/ u16 opaqueShapeCount;
    /*0x1C*/ u16 translucentShapeCount;
    /*0x1E*/ u8 mtxCount;
    u8 filler1F[1];
    /*0x20*/ u32 headerSize;
    /*0x24*/ GXTexObj *texObjs;
    /*0x28*/ u8 mtxIndexes[8];
             u8 filler30[0x10];
    /*0x40*/ struct GMATevStageDesc tevStageDescs[0];
};

enum
{
    GMA_SHAPE_FLAG_UNLIT = 1 << 0,
    GMA_SHAPE_FLAG_DOUBLE_SIDED = 1 << 1, // Draw front and back sides of tris/quads
    GMA_SHAPE_FLAG_NO_FOG = 1 << 2,
    GMA_SHAPE_FLAG_UNK3 = 1 << 3,
    GMA_SHAPE_FLAG_CUSTOM_BLEND_SRC = 1 << 5,
    GMA_SHAPE_FLAG_CUSTOM_BLEND_DST = 1 << 6,
    GMA_SHAPE_FLAG_SIMPLE_MATERIAL = 1 << 7, // Only 1 tev stage that spits out color/alpha input D directly
    GMA_SHAPE_FLAG_VERT_COLORS = 1 << 8,
};

enum
{
    GMA_SHAPE_DLIST_FLAG_DLIST0= 1 << 0, // Display list 0 present, cull front faces by default
    GMA_SHAPE_DLIST_FLAG_DLIST1= 1 << 1, // Display list 1 present, cull back faces by default
    // Extra display lists (always both present or neither?)
    GMA_SHAPE_DLIST_FLAG_DLIST2 = 1 << 2, // Display list 2 present, cull front faces
    GMA_SHAPE_DLIST_FLAG_DLIST3 = 1 << 3, // Display list 3 present, cull back faces
};

// if GCMF_SKIN or GCMF_EFFECTIVE, then at headerSize + 0x20?
struct GMAShape
{
    /*0x00*/ u32 flags;
    /*0x04*/ GXColor g_color1;
    /*0x08*/ GXColor g_color2;
             union
             {
                 u32 asU32;
                 GXColor asColor;
             } g_color3;
    /*0x10*/ u8 filler10[1];
             u8 g_alpha;
    /*0x12*/ u8 tevStageCount;
    /*0x13*/ u8 dispListFlags;
    /*0x14*/ u8 unk14;
    /*0x15*/ u8 filler15[0x16-0x15];
             u16 tevStageDescIdxs[3]; // Up to 3 indices into model's tev stage desc list. -1 means end of list
    /*0x1C*/ u32 vtxAttrs; // One bit for each GXAttr vertex attribute
    /*0x20*/ u8 mtxIndices[8];
    /*0x28*/ u32 dispListSizes[2];
    /*0x30*/ Point3d origin; // Reference point for depth sorting
    u8 filler3C[4];
    u32 blendFactors; // 0xF bitmask is src blend factor, 0xF0 is dst blend factor
    u8 filler44[0x60-0x44];
    u8 dispLists[0]; // Start of display lists 
};  // size = 0x60

struct GMAModelEntry
{
    struct GMAModel *modelOffset;
    char *name;
};

struct GMA
{
    /*0x00*/ u32 numModels;
    /*0x04*/ u8 *modelsBase;
    /*0x08*/ struct GMAModelEntry *modelEntries;
    /*0x0C*/ char *namesBase;
    /*0x10*/ u8 filler10[0x20-0x10];
    /*0x20*/ u8 fileData[0];  // raw file data
};  // size = 0x20

#endif
