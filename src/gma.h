#ifndef _SRC_GMA_H_
#define _SRC_GMA_H_

#include <dolphin/gx/GXEnum.h>
#include <dolphin/gx/GXStruct.h>
#include <dolphin/mtx.h>
#include <dolphin/types.h>

enum
{
    // A TEV layer is one of five types. If none of the "TYPE" flags are set it's the first type:
    // standard diffuse lighting (light * texture dotted with normals etc.)

    // "Specular" light layer pointing in view direction?
    // Used in Water and Master at least
    GMA_TEV_LAYER_FLAG_TYPE_VIEW_SPECULAR = 1 << 0,

    GMA_TEV_LAYER_FLAG_TYPE3 = 1 << 1, // Unused/ignored?

    // Bits 2-3 for S wrap mode
    // Bits 4-5 for T wrap mode
    GMA_TEV_LAYER_FLAG_DO_EDGE_LOD = 1 << 6,
    // Bits 7-10 for max LOD
    GMA_TEV_LAYER_FLAG_MAGFILT_NEAR = 1 << 11,

    // Alpha blend layer. Passes color through unchanged, multiplies alpha by lookup from alpha
    // texture
    GMA_TEV_LAYER_FLAG_TYPE_ALPHA_BLEND = 1 << 13,

    // "Specular" light layer pointing in fixed direction?
    // Used for specular highlight on party ball and monkey ball
    GMA_TEV_LAYER_FLAG_TYPE_WORLD_SPECULAR = 1 << 15,

    GMA_TEV_LAYER_FLAG_UNK16 = 1 << 16,
};

// A TEV layer describes how to set up one or more consecutive TEV stages. Each layer is fed an
// "input" color/alpha argument - the first layer gets RASC/RASA (unless both lighting and vertex
// colors are disabled, then it gets TEVREG0), and subsequent layers get TEVPREV.
struct GMATevLayer
{
    /*0x00*/ u32 flags;
    /*0x04*/ u16 texIndex;
    /*0x06*/ s8 lodBias;
    /*0x07*/ u8 maxAniso;
    /*0x08*/ GXTexObj *texObj;
    u8 fillerC[0x20 - 0xC];
}; // GMAModel.flags

// GMAModel flags. STITCHING, SKIN, and EFFECTIVE are mutually exclusive but 16BIT may be
// interspersed in there. No flags or only 16BIT can also be set (most models are this way).
enum
{
    // Uses VAT with compressed 16-bit vert pos/norm/texcoord instead of floats
    GCMF_16BIT = 0x01,
    // Skinned meshes with one bone per vertex (what GX hardware supports). Uses tristrips
    GCMF_STITCHING = 0x04,
    // Linear blend skin meshes (>=1 bone per vertex) to be computed on CPU? Uses indexed meshes
    GCMF_SKIN = 0x08,
    // Meshes where each vertex is explicitly positioned by CPU each frame?  Uses indexed meshes
    GCMF_EFFECTIVE = 0x10,
};

struct GMAModel
{
    /*0x00*/ u32 magic; // "GCMF"
    /*0x04*/ u32 flags;
    /*0x08*/ Vec boundSphereCenter;
    /*0x14*/ float boundSphereRadius;
    /*0x18*/ u16 tevLayerCount;
    /*0x1A*/ u16 opaqueShapeCount;
    /*0x1C*/ u16 translucentShapeCount;
    /*0x1E*/ u8 mtxCount;
    u8 filler1F[1];
    /*0x20*/ u32 headerSize;
    /*0x24*/ GXTexObj *texObjs;
    /*0x28*/ u8 mtxIndexes[8];
    u8 filler30[0x10];
    /*0x40*/ struct GMATevLayer tevLayers[0]; // Shapes reference at most three from here
};

enum
{
    GMA_SHAPE_FLAG_UNLIT = 1 << 0,
    GMA_SHAPE_FLAG_DOUBLE_SIDED = 1 << 1, // Draw front and back sides of tris/quads
    GMA_SHAPE_FLAG_NO_FOG = 1 << 2,
    GMA_SHAPE_FLAG_CUSTOM_MAT_AMB_COLOR = 1 << 3, // Use material/ambient colors in shape in mat/amb color registers
    GMA_SHAPE_FLAG_CUSTOM_BLEND_SRC = 1 << 5,
    GMA_SHAPE_FLAG_CUSTOM_BLEND_DST = 1 << 6,
    GMA_SHAPE_FLAG_SIMPLE_MATERIAL = 1 << 7, // Only 1 tev stage that spits out color/alpha input
                                             // directly
    GMA_SHAPE_FLAG_VERT_COLORS = 1 << 8,
};

enum
{
    GMA_SHAPE_HAS_DLIST0 = 1 << 0, // Display list 0 present, cull front faces by default
    GMA_SHAPE_HAS_DLIST1 = 1 << 1, // Display list 1 present, cull back faces by default
    // Extra display lists (always both present or neither?)
    GMA_SHAPE_HAS_DLIST2 = 1 << 2, // Display list 2 present, cull front faces
    GMA_SHAPE_HAS_DLIST3 = 1 << 3, // Display list 3 present, cull back faces
};

// Two extra display lists which may be included in a shape. Follows directly after first two disp
// lists if present.
struct GMAExtraDispLists
{
    u8 mtxIndices[8];
    u32 dispListSizes[2];
    u8 filler10[0x20-0x10];
    u8 dlists[];
};

// if GCMF_SKIN or GCMF_EFFECTIVE, then at headerSize + 0x20?
struct GMAShape
{
    /*0x00*/ u32 flags;
    /*0x04*/ GXColor materialColor;
    /*0x08*/ GXColor ambientColor;
    union {
        u32 asU32;
        GXColor asColor;
    } specularColor;
    /*0x10*/ u8 filler10[1];
    /*0x11*/ u8 alpha;
    /*0x12*/ u8 tevLayerCount;
    /*0x13*/ u8 dispListFlags;
    /*0x14*/ u8 unk14;
    /*0x15*/ u8 filler15[0x16 - 0x15];
    /*0x16*/ u16 tevLayerIdxs[3];   // Up to 3 indices into model's tev layer list. -1 means end of list
    /*0x1C*/ u32 vtxAttrs; // One bit for each GXAttr vertex attribute
    /*0x20*/ u8 mtxIndices[8];
    /*0x28*/ u32 dispListSizes[2];
    /*0x30*/ Point3d origin; // Reference point for depth sorting
    u8 filler3C[4];
    /*0x40*/ u32 blendFactors; // 0xF bitmask for src blend factor, 0xF0 for dst blend factor
    u8 filler44[0x60 - 0x44];
    /*0x60*/ u8 dispLists[0]; // Start of display lists
};
// size = 0x60

struct GMAModelEntry
{
    struct GMAModel *model;
    char *name;
};

struct GMA
{
    /*0x00*/ u32 numModels;
    /*0x04*/ u8 *modelsBase;
    /*0x08*/ struct GMAModelEntry *modelEntries;
    /*0x0C*/ char *namesBase;
    /*0x10*/ u8 filler10[0x20 - 0x10];
    /*0x20*/ u8 fileData[0]; // raw file data
};
// size = 0x20

#endif
