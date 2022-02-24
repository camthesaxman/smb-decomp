#ifndef _SRC_TYPES_H_
#define _SRC_TYPES_H_

#include <dolphin/types.h>
#include <dolphin/GXStruct.h>
#include <dolphin/GXEnum.h>
#include <dolphin/GXFifo.h>
#include <dolphin/mtx.h>

// DIP switches
enum
{
    DIP_DEBUG        = 1 << 0,
    DIP_DISP         = 1 << 1,
    DIP_STCOLI       = 1 << 2,
    DIP_TRIANGLE     = 1 << 3,
    DIP_BALL_TGT     = 1 << 4,
    DIP_JOINT_OFF    = 1 << 5,
    DIP_APE_COLOR    = 1 << 6,
    DIP_TIME_STOP    = 1 << 7,
    DIP_KARAKUCHI    = 1 << 8,
    DIP_NAMEENTRY    = 1 << 9,
    DIP_SHADOW_TEST  = 1 << 10,
    DIP_FALL_DISP    = 1 << 11,
    DIP_TEST_CAM     = 1 << 12,
    DIP_NO_INTR      = 1 << 13,
    DIP_CAPTURE      = 1 << 14,
    DIP_OLD_BALL     = 1 << 15,
    DIP_NO_KARI      = 1 << 16,
    DIP_PLAY_STG_ALL = 1 << 17,
    DIP_PLAY_PNT_X10 = 1 << 18,
    DIP_SARU_0       = 1 << 19,
    DIP_SWITCH20     = 1 << 20,
    DIP_SWITCH21     = 1 << 21,
    DIP_SWITCH22     = 1 << 22,
    DIP_SWITCH23     = 1 << 23,
    DIP_SWITCH24     = 1 << 24,
    DIP_SWITCH25     = 1 << 25,
    DIP_SWITCH26     = 1 << 26,
    DIP_SWITCH27     = 1 << 27,
    DIP_SWITCH28     = 1 << 28,
    DIP_SWITCH29     = 1 << 29,
    DIP_SWITCH30     = 1 << 30,
    DIP_SWITCH31     = 1 << 31,
};

struct Color3f { float r, g, b; };

// avdisp.c
struct GMAMeshHeader;
struct GMAMaterial;
struct DrawMeshDeferredNode;
struct UnkStruct31;
struct UnkStruct32;

// GMAModelHeader.flags
enum
{
    GCMF_16BIT = 0x01,
    GCMF_STITCHING = 0x04,
    GCMF_SKIN = 0x08,
    GCMF_EFFECTIVE = 0x10,
};

// at GMAModelHeader + 0x40
struct GMAMaterial
{
    u32 flags;
    u16 unk4;
    s8 unk6;
    u8 unk7;
    GXTexObj *texObj;
    u8 fillerC[0x20-0xC];
};

struct GMAModelHeader
{
    /*0x00*/ u32 magic;  // "GCMF"
    /*0x04*/ u32 flags;
    /*0x08*/ Vec boundsCenter;
    /*0x14*/ float boundsRadius;
    /*0x18*/ u16 numMaterials;
    /*0x1A*/ u16 numLayer1Meshes;  // opaque count?
    /*0x1C*/ u16 numLayer2Meshes;  // transparent count?
    /*0x1E*/ u8 mtxCount;
    u8 filler1F[1];
    /*0x20*/ u32 headerSize;
    /*0x24*/ GXTexObj *texObjs;
    /*0x28*/ u8 mtxIndexes[8];
             u8 filler30[0x10];
    /*0x40*/ struct GMAMaterial materials[0];
};

// if GCMF_SKIN or GCMF_EFFECTIVE, then at headerSize + 0x20?
struct GMAMeshHeader
{
    /*0x00*/ u32 renderFlags;
    /*0x04*/ GXColor unk4;
    /*0x08*/ GXColor unk8;
             union
             {
                 u32 asU32;
                 GXColor asColor;
             } unkC;
    /*0x10*/ u8 filler10[1];
             u8 unk11;
    /*0x12*/ u8 unk12;
    /*0x13*/ u8 unk13;  // flags: bit 0 and 1 whether display lists are enabled, 0xC to skip something?
    /*0x14*/ u8 unk14;
    /*0x15*/ u8 filler15[0x16-0x15];
             u16 unk16;
             u8 filler18[0x1C-0x18];
    /*0x1C*/ u32 vtxFlags;  // vtxFlags
    /*0x20*/ u8 unk20[8];
    /*0x28*/ u32 dispListSizes[2];
    /*0x30*/ Vec unk30;
    u8 filler3C[4];
    u32 unk40;
    u8 filler44[0x60-0x44];
    u8 dispListData[0];
};  // size = 0x60

struct GMAModelEntry
{
    struct GMAModelHeader *modelOffset;
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

struct TPLTextureHeader
{
    /*0x00*/ u32 format;
    /*0x04*/ u32 imageOffset;
    /*0x08*/ u16 width;
    /*0x0A*/ u16 height;
    /*0x0C*/ u16 unkC;
};  // size = 0x10

struct TPL
{
    /*0x00*/ u32 numTextures;
    /*0x04*/ struct TPLTextureHeader *texHeaders;
    /*0x08*/ u8 *fileData;  // raw file data
    /*0x0C*/ GXTexObj *texObjs;  // only used by bitmap.c? avdisp.c seems to think TPL struct is only 12 bytes.
};
// maybe bitmap.c has a different struct that "contains" TPL?

// load.c
struct ARAMBlock;

struct PerfInfo
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u32 unk18;
    u32 unk1C;
    u32 unk20;
    u32 unk24;
    u32 unk28;
    u32 unk2C;
    u32 unk30;
    u32 unk34;
};

struct ZMode
{
    /*0x00*/ GXBool compareEnable;
    /*0x04*/ GXCompare compareFunc;
    /*0x08*/ GXBool updateEnable;
    /*0x09*/ u8 lineWidth;
    /*0x0C*/ s32 texOffsets;
             u8 filler10[0x734-0x10];
};

struct GFXBufferInfo
{
    /*0x00*/ void *currFrameBuf;
    /*0x04*/ void *frameBufs[2];
    /*0x0C*/ u32 fbNum;
    /*0x10*/ GXFifoObj *fifos[2];
};

struct UnkStruct8005562C_child
{
    s32 unk0;
    s32 unk4;
    u32 unk8;
    void *unkC;
    u32 unk10;
    void *unk14;
    u32 unk18;
    void *unk1C;
    u32 unk20;
    void *unk24;
    u32 unk28;
    void *unk2C;
    u32 unk30;
    void *unk34;
    u32 unk38;
    void *unk3C;
    u32 unk40;
    void *unk44;
    u32 unk48;
    void *unk4C;
    u32 unk50;
    void *unk54;
    u32 unk58;
    void *unk5C;
};

struct UnkStruct8005562C_child2_child
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s8 unk12;
};

struct UnkStruct8005562C_child2_child2
{
    Vec unk0;
    s8 unkC;
};

struct UnkStruct8005562C_child2
{
    s32 unk0;
    struct UnkStruct8005562C_child2_child *unk4;
    s32 unk8;
    struct UnkStruct8005562C_child2_child2 *unkC;
};

struct StageBgModel;
struct Camera;
struct Sprite;
struct FontParams;
struct GMA;
struct TPL;
struct Ape;
struct Ball;

struct Struct80089CBC
{
    s32 unk0;
    s32 unk4;
    u32 unk8;
    u32 unkC;
    s32 unk10;
    s32 unk14;
    u8 filler18[0x20-0x18];
};  // size = 0x20

struct Struct802B39C0_B0_child
{
    u32 unk0;
    float unk4;
    s32 unk8;
    struct Struct80089CBC *unkC;
    float unk10;
    s32 unk14[3];
    s32 unk20;
};  // size = 0x24

struct Struct80034F5C_1_sub
{
    u8 unk0;
    u8 unk1;
    u16 *unk4;
    u8 *unk8;
    float *unkC;
};  // size = 0x10

struct Struct800341BC_5
{
    u8 filler0[0xC];
};

struct Struct80034F5C_1  // Joint object?
{
    u32 unk0;
    struct Struct800341BC_5 unk4;
    struct Struct800341BC_5 unk10;
    Mtx unk1C;
    u32 unk4C;
    u8 *unk50;
    struct Struct80034F5C_1_sub unk54[6];
    u8 fillerB4[0x168-0xB4];
    Mtx unk168;
    u8 filler198[0x1A0-0x198];
    s32 unk1A0;
    Vec unk1A4;
    Quaternion unk1B0;
    Point3d unk1C0;
    Point3d unk1CC;
    Mtx unk1D8;
    Mtx unk208;
};  // size = 0x238

struct Struct8003699C_child
{
    u32 unk0;
    u8 filler4[0x28-0x4];
    u16 unk28;
    u16 unk2A;
    u16 unk2C;
    s16 unk2E;
    u8 filler30[2];
    u16 unk32;
    u16 unk34;
    u16 unk36;
    u16 unk38;
    u16 unk3A;
    float unk3C;
    float unk40;
    u8 filler44[0x54-0x44];
    Mtx unk54;
    u8 filler84[0x4114-0x84];
    u8 filler4114[0x81A8-0x4114];
    struct Struct80034F5C_1 unk81A8[29];
};

struct Ape_child
{
    float unk0;
    s32 unk4;
    u32 unk8;
    u32 unkC;
    s32 unk10;
    s32 unk14;
    float unk18;
    u32 unk1C;
};  // size = 0x20

struct Ape
{
    struct Struct8003699C_child *unk0;
    struct Struct8003699C_child *unk4;
    float unk8;
    float unkC;
    /*0x010*/ s32 charaId;
    u32 unk14;
    s32 unk18;
    struct Ape_child *unk1C;
    struct Ape_child *unk20;
    s32 unk24;
    s32 unk28;
    void *unk2C;
    Vec unk30;  // position?
    Vec unk3C;
    Vec unk48;
    s32 unk54;
    float unk58;  // model scale?
    u32 unk5C;
    Quaternion unk60;  // orientation?
    u32 unk70;
    u32 unk74;
    u8 filler78[0x90-0x78];
    s32 unk90;
    u32 unk94;
    struct Struct802B39C0_B0_child *unk98;
    u32 unk9C;
    Vec unkA0;
    float unkAC;
    u32 unkB0;
    /*0x0B4*/ int colorId;
    void *unkB8;
    void *unkBC;
    s8 unkC0;
    u8 unkC1;
    s16 unkC2;
};  // size = 0xC4

struct SpritePoolInfo
{
             u8 filler0[8];
             s32 unk8;
             s8 *unkC;
             u8 unk10[0x18-0x10];
             s32 unk18;
             s8 *unk1C;
             u8 filler20[0x30-0x20];
             u8 unk30[4];
             u32 unk34;
             s32 unk38;
    /*0x3C*/ s8 *statusList;
};

struct Struct80176434
{
    u32 unk0;
    float unk4;
    float unk8;
    float unkC;
};  // size=0x10

struct MovableStagePart
{
    Vec unk0;
    Vec unkC;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    s16 unk20;
    s16 unk22;
    Mtx unk24;
    Mtx unk54;
};  // size = 0x84

struct ReplayInfo
{
    u16 flags;  // (1 << 5) = expert, (1 << 6) = master
    u8 stageId;
    u8 difficulty;  // 0 = beginner, 1 = advanced, 2 = expert
    u8 floorNum;
    u8 unk5;
    u8 filler6[0x10-6];
    u32 unk10;
    u8 filler14[4];
};

struct Struct8003FB48
{
    u32 unk0;
    Vec unk4;
    Vec unk10;
};

typedef u32 (*Func802F20F0)();
typedef void (*CameraCallback)(struct Camera *, struct Ball *);
typedef void (*BallCallback)(struct Ball *);

struct NaomiModel;
struct NaomiObj;

struct Struct80092B98
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    Vec unk10;
    float unk1C;
    Vec unk20;
    s16 unk2C;
    u16 unk2E;
    float unk30;
    float unk34;
    GXColor unk38;
    void *unk3C;
};  // size = 0x40

struct Struct8009492C
{
    Vec unk0;
    S16Vec unkC;
    Vec unk14;
    float unk20;
    float unk24;
    struct GMAModelHeader *unk28;
    GXColor unk2C;
    u8 filler30[0x38-0x30];
};

struct Struct8003F890
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    u8 filler12[0x20-0x12];
    float unk20;
    float unk24;
};

struct Struct80039974
{
    u32 unk0;
    Vec unk4;
    Vec unk10;
    Vec unk1C;
    float unk28;
    float unk2C;
    float unk30;
    float unk34;
    Vec unk38;
    Vec unk44;
    s32 unk50;
    float unk54;
    s32 unk58;
};

struct Struct800496BC
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
    s16 unk14;
    s16 unk16;
    u32 unk18;
    float unk1C;
};  // size = 0x20

typedef void (*Struct80206DEC_Func)(void);

struct Struct80206DEC
{
    s32 unk0;
    float unk4;
    Struct80206DEC_Func unk8;
    u32 unkC;
    float unk10[3];
    u32 unk1C;
    u8 filler20[0x5C-0x20];
};

struct Stage;

struct Struct8003C550
{
    u8 filler0[8];
    s16 unk8;
    u8 fillerA[0x10-0xA];
    s32 unk10;
    s16 unk14;
    u16 unk16;
    u8 filler18[0x24-0x18];
    Vec unk24;
    struct GMAModelHeader *unk30;
    Vec unk34;
    Vec unk40;
    s16 unk4C;
    s16 unk4E;
    s16 unk50;
    u8 filler52[0x70-0x52];
    /*
    float unk74;
    u8 filler78[4];
    */
    Vec unk70;
    Vec unk7C;
    Vec unk88;
    u8 filler94[0xA8-0x94];
    float unkA8;
};

// motload

struct MotDat_child
{
    u8 unk0;
};

struct MotDat_child2
{
    u8 unk0;
    u16 unk2;
};  // size = 0x4

struct MotDat
{
    u16 unk0;
    u8 filler2[2];
    struct MotDat_child2 *unk4;  // could be u8*?
    struct MotDat_child *unk8;
    u16 *unkC;  // could be u16*?
    u8 *unk10;
    float *unk14;
};  // size = 0x18

struct Struct80034B50_child_child
{
    u32 unk0;
    void *unk4;
};

struct Struct80034B50_child  // Struct80034B50_child
{
    void *unk0;
    struct Struct80034B50_child_child *unk4;
    void *unk8;
    struct Struct800341BC_5 *unkC;
    struct Struct800341BC_5 *unk10;
    void *unk14;
};  // size = 0x18

struct Struct80034B50_child2_child
{
    void *unk0;
    u8 filler4[0x18-0x4];
};

struct Struct80034B50_child2
{
    void *unk0;
    struct Struct80034B50_child2_child *unk4[3];
    s32 unk10[3];
};

struct MotSkeleton
{
    struct Struct80034B50_child *unk0;
    u32 unk4;
    struct Struct80034B50_child2 *unk8;
    u32 unkC;
};

struct MotInfo
{
    char unk0[0x18];
    char unk18[0x30-0x18];
    u8 * unk30[16];
    u32 unk70[16];
    u8 *unkB0;
};  // size = 0xB4

struct Struct80034F5C_2
{
    u16 filler0;
    u16 unk2;
};  // size = 4

struct Struct80034F5C_3
{
    u16 filler0;
    u16 unk2;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
};  // size = 0x1C

struct CoordsS8
{
    s8 x;
    s8 y;
};

struct Struct8020A348_child
{
    u32 unk0;
    struct GMAModelHeader *unk4;  // GMAModelHeader
    float unk8;
};  // size = 0xC

struct Struct8020A348
{
    struct Struct8020A348_child *unk0;
    s32 unk4;
};

struct StageSelection
{
    s32 levelSet;
    s32 levelNum;
};

struct NaomiSpriteParams
{
    /*0x00*/ s32 bmpId;
    /*0x04*/ float x;
    /*0x08*/ float y;
    /*0x0C*/ float z;
    /*0x10*/ float zoomX;
    /*0x14*/ float zoomY;
    /*0x18*/ float u1;
    /*0x1C*/ float v1;
    /*0x20*/ float u2;
    /*0x24*/ float v2;
    /*0x28*/ u32 rotation;
    /*0x2C*/ float alpha;
    s32 unk30;
    /*0x34*/ u32 flags;
    u32 unk38;
    u32 unk3C;
    u8 filler40[0x50-0x40];
};

struct NaomiVtxWithNormal;
struct NaomiVtxWithColor;

// Part of the stage whose vertices are manipulated by functions
struct DynamicStagePart
{
    void *modelName;
    struct NaomiModel *origModel;  // original model
    void (*posNrmTexFunc)(struct NaomiVtxWithNormal *);
    void (*posColorTexFunc)(struct NaomiVtxWithColor *);
    int (*unusedFunc)();
    struct NaomiModel *tempModel;  // modified copy of the model
};

struct Struct801EEC80
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
};

struct Struct801EEC90
{
    u32 unk0;
    Vec unk4;
    Vec unk10;
    Vec unk1C;
    Vec unk28;
    Vec unk34;
    Vec unk40;
    s32 unk4C;  // 5C
    u8 filler50[4];
    u32 unk54;
    s32 unk58;
    float unk5C;
    float unk60;
    u8 filler64[4];
};

struct Struct802F1B4C
{
    u32 unk6C;
};

struct Struct801EEC68
{
    s32 unk0;
    u32 unk4;
    s32 unk8;
    s32 unkC;
    s32 unk10;
    s8 unk14;
    s8 unk15;
    s16 unk16;
};

struct FogInfo
{
    s8 unk0;
    u8 filler1[3];
    float unk4;
    float unk8;
    u8 r, g, b;
    s8 unkF;
};

struct Struct80209488;

struct OrdTblNode;

struct Struct802F1B3C
{
    Mtx matrices[5];
    struct OrdTblNode *entries;
    s32 maxEntries;
    float depthOffset;
    float minDepth;
    float maxDepth;
    struct OrdTblNode *lastEntry;  // the last node in 'entries'
    struct OrdTblNode *firstEntry;  // the first node in 'entries'
    float depthRange;
};

struct Sphere
{
    Point3d pos;
    float radius;
};

struct Preview;
struct NaomiDispList;

struct Struct80075900
{
    u8 filler0[0xC];
    u16 unkC;
    u16 unkE;
    u8 filler10[4];
    s8 unk14;
    s8 unk15;
    s8 unk16;
    u8 filler17[0x1C-0x17];
    void (*unk1C)();
    u8 filler20[0x28-0x20];
};

struct Struct8009544C
{
    u8 filler0[0x6];
    u16 unk6;
    u8 filler8[0x18-0x8];
};  // size = 0x18

struct Struct8000F030
{
    u8 filler0[0xC];
    u16 unkC;
    u16 unkE;
    u8 filler10[0x20-0x10];
    s32 unk20;
};

struct Struct801EED88
{
    u8 unk0;
    u8 unk1[6];
    u32 unk8;
    u32 unkC;
};  // size = 0x10

struct MemcardGameData_sub
{
    /*0x5844*/ u8 filler0[0x44-0x00];
    /*0x5888*/ u8 unk44;
    /*0x5889*/ u8 unk45;
    /*0x588A*/ u8 unk46;
    /*0x588B*/ u8 unk47;
    /*0x588C*/ u8 unk48;
    /*0x588D*/ u8 unk49;
    /*0x588E*/ u8 unk4A;
    /*0x588F*/ u8 unk4B;
    /*0x5890*/ u8 filler4C[2];
    /*0x5892*/ u8 unk4E;
    /*0x5893*/ u8 unk4F;
    /*0x5894*/ u8 unk50;
    /*0x5895*/ u8 unk51;
    /*0x5896*/ u8 unk52;
    /*0x5897*/ u8 unk53;
    /*0x5898*/ u8 unk54;
    /*0x5899*/ u8 unk55;
    /*0x589A*/ u8 filler56[2];
    /*0x589C*/ s16 unk58;
    /*0x589E*/ s16 unk5A;
    /*0x58A0*/ s16 unk5C;
    /*0x58A2*/ s16 unk5E;
    /*0x58A4*/ s16 unk60;
    /*0x58A6*/ s16 unk62;
    /*0x58A8*/ s16 unk64;
    /*0x58AA*/ s16 unk66;
    /*0x58AC*/ s16 unk68;
    /*0x58AE*/ s16 unk6A;
    /*0x58B0*/ u8 filler6C[4];
    /*0x58B4*/ u32 unk70;
    /*0x58B8*/ u32 unk74;
    /*0x58BC*/ u32 unk78;
    /*0x58C0*/ u32 unk7C;
    /*0x58C4*/ u32 unk80;
    /*0x58C8*/ u32 unk84;
    /*0x58CC*/ s16 unk88;
    /*0x58CE*/ s16 unk8A;
    /*0x58D0*/ u32 unk8C;
    /*0x58D4*/ u8 filler90[0xA0-0x90];
    /*0x58E4*/ u32 unkA0;
    /*0x58E8*/ u8 unkA4[6];
    /*0x58EE*/ u8 unkAA;
    /*0x58EF*/ s8 unkAB;
    /*0x58F0*/ u8 unkAC;
    /*0x58F1*/ u8 unkAD;
    /*0x58F2*/ u8 unkAE;
    /*0x58F3*/ s8 unkAF;
    /*0x58F4*/ u8 unkB0[0x1FC];  // size = 0x1FC
    /*0x5AF0*/ u32 unk2AC;
    /*0x5AF4*/ u8 unk2B0;
    /*0x5AF5*/ u8 unk2B1;
    /*0x5AF6*/ u8 unk2B2;
    /*0x5AF7*/ u8 unk2B3;
    /*0x5AF8*/ u8 unk2B4;
    /*0x5AF9*/ u8 unk2B5;
    /*0x5AFA*/ u8 unk2B6;
    /*0x5AFB*/ s8 unk2B7;
    /*0x5AFC*/ u32 unk2B8;
    /*0x5B00*/ s8 unk2BC;
    /*0x5B01*/ u8 unk2BD;
    /*0x5B02*/ u8 filler2BE[1];
    /*0x5B03*/ u8 unk2BF;
    /*0x5B04*/ u8 filler2C0[0x3BC-0x2C0];
    /*0x5C00*/ u32 unk3BC;
};  // size = 0x3C0

struct MemcardGameData
{
    /*0x0000*/ u16 crc;
    /*0x0002*/ u16 version;
    /*0x0004*/ u8 bannerAndIcon[0x5800];
    /*0x5804*/ char comment[32];
    /*0x5824*/ char title[32];
    /*0x5844*/ struct MemcardGameData_sub unk5844;
};

struct AnimKeyframe
{
    s32 unk0;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
};

struct StageCollHdr;
struct StageCollHdr_child3;

struct Struct800690DC
{
    u8 filler0[0x1C];
    Vec unk1C;
    u8 filler28[0x30-0x28];
    float unk30;
    u8 filler34[0x58-0x34];
    s32 unk58;
};

struct Item;

struct ModelLOD
{
    s32 modelId;
    float distance;
};

struct Struct80290170
{
    s32 unk0;
    u32 unk4;
    s32 unk8;
    s32 unkC;
};

struct Struct802C67D4
{
    u8 filler0[4];
    u32 unk4;
    u8 filler8[0x50-0x8];
};

struct Struct80089A04_1_child_sub
{
    char *unk0;
    u8 filler4[0x20-0x4];
};  // size = 0x20

struct ApeFacePart
{
    u8 filler0[0x14];
    struct Struct80089A04_1_child_sub unk14[2];
};

struct ApeGfxFileInfo
{
    char *basename;  // base name of the file (without suffix)
    struct ApeFacePart *facePartInfo[4];  // face part info per LOD?
    /*0x14*/ s16 partCounts[4];  // counts?
    s16 unk1C[2];
    u8 filler20[4];
};  // size = 0x24

struct Struct80061BC4_sub
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u8 filler10[4];
    u32 unk14;
    u8 filler18[0x2C-0x18];
};

struct Struct80061BC4
{
    u8 filler0[0xC];
    struct Struct80061BC4_sub unkC;
};

typedef void (*BallEnvFunc)(struct Struct80061BC4 *);

#endif
