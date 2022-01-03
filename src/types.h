// Event states
enum
{
    EV_STATE_INACTIVE = 0,
    EV_STATE_RUNNING = 2,
    EV_STATE_SUSPENDED = 4
};

// Event IDs
enum
{
    EVENT_MEMCARD,  // 0
    EVENT_STAGE,
    EVENT_WORLD,
    EVENT_BALL,
    EVENT_STOBJ,
    EVENT_ITEM,  // 5
    EVENT_RECPLAY,
    EVENT_OBJ_COLLISION,
    EVENT_NAME_ENTRY,
    EVENT_INFO,
    EVENT_COURSE,  // 10
    EVENT_VIBRATION,
    EVENT_VIEW,
    EVENT_EFFECT,
    EVENT_MINIMAP,
    EVENT_CAMERA,  // 15
    EVENT_SPRITE,
    EVENT_MOUSE,
    EVENT_SOUND,
    EVENT_BACKGROUND,
    EVENT_REND_EFC,  // 20
};

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
struct UnkStruct17;
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
    /*0x08*/ Vec boundingSphereCenter;
    /*0x14*/ float boundingSphereRadius;
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
    u8 unk30[0x40-0x30];
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
    /*0x0C*/ u32 texOffsets;
};

struct ModeControl
{
    s32 unk0;
    s32 unk4;
    u32 unk8;
    u8 fillerC[0x10-0xC];
    s32 unk10;
    u8 filler14[0x1C-0x14];
    s32 unk1C;
    s32 unk20;
    /*0x24*/ int playerCount;
    s32 unk28;
    s32 unk2C;
    s32 unk30;
    u8 filler34[0x40-0x34];
    s16 unk40;
    u8 unk42;
    u8 filler43[0x48-0x43];
};

struct Event
{
    /*0x00*/ s8 state;
    /*0x04*/ char *name;
    /*0x08*/ void (*start)(void);
    /*0x0C*/ void (*main)(void);
    /*0x10*/ void (*finish)(void);
    /*0x14*/ u32 time;
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

struct UnkStruct8005562C  // decodedStageLzPtr->unk6C
{
    u32 unk0;
    char *unk4;
    struct GMAModelHeader *unk8;
    Vec unkC;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    Vec unk20;
    float unk2C;
    struct UnkStruct8005562C_child *unk30;
    struct UnkStruct8005562C_child2 *unk34;
};

struct Camera;

struct Sprite;
struct FontParams;
struct GMA;
struct TPL;

typedef void (*Func802F20EC)();

struct Ball_child;
struct Ball;

struct World
{
    s16 unk0;
    s16 unk2;
    u8 filler4[0x1C-0x4];
    float unk1C;
    u16 unk20;
    u8 filler22[0x40-0x22];
};  // size = 0x40

struct SpritePoolInfo
{
             u8 filler0[8];
             s32 unk8;
             s8 *unkC;
             u8 filler10[0x30-0x10];
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

struct Struct80206E48
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
};

struct MaybeReplayInfo
{
    u16 flags;  // (1 << 5) = expert, (1 << 6) = master
    u8 unk2;
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

struct UnkStruct17
{
    u8 filler0[4];
    void (*unk4)(struct UnkStruct17 *);
    void *unk8;
    Mtx unkC;
    void *unk3C;
    struct GMAMeshHeader *unk40;
    u32 unk44;
    u32 unk48;
    float unk4C;
    Func802F20EC unk50;
    Func802F20F0 unk54;
    u8 unk58;
    u8 unk59;
    u32 unk5C;
    u8 unk60;
    u8 unk61;
    u8 unk62;
    Mtx *unk64;
    GXColor unk68;
    GXColor unk6C;
    u32 unk70;
};

struct NaomiModel;
struct NaomiObj;

// like UnkStruct17, but with a different fields starting at 0x3C.
// possibly has a union?
struct UnkStruct18
{
    u8 filler0[4];
    void (*unk4)(struct UnkStruct18 *);
    struct NaomiModel *model;
    Mtx unkC;
    struct Color3f unk3C;
    u32 unk48;
    struct Color3f unk4C;
    u32 unk58;
};

struct UnkStruct19
{
    u8 filler0[4];
    void (*unk4)(struct UnkStruct19 *);
    struct NaomiModel *model;
    Mtx unkC;
    struct Color3f unk3C;
    float unk48;
    u32 unk4C;
    struct Color3f unk50;
    u32 unk5C;
};

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
    float unk14;
    float unk18;
    float unk1C;
    float unk20;
    float unk24;
    struct GMAModelHeader *unk28;
    GXColor unk2C;
    u8 filler30[0x38-0x30];
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

struct Struct80206DEC
{
    s32 unk0;
    float unk4;
    void (*unk8)(void);
    u32 unkC;
    float unk10[3];
    u32 unk1C;
    u8 filler20[0x5C-0x20];
};

struct DecodedStageLzPtr_child_child
{
    u32 unk0;
    void *unk4;
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
};

struct DecodedStageLzPtr_child_child2
{
    char *unk0;
};

struct DecodedStageLzPtr_child
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    u16 unk12;
    struct DecodedStageLzPtr_child_child *unk14;
    struct DecodedStageLzPtr_child_child2 *unk18;
    u8 filler1C[0x3C-0x1C];
    s32 unk3C;
    Vec *unk40;
    u8 filler44[0x7C-0x44];
    s32 unk7C;
    u8 filler80[0xB8-0x80];
    Vec unkB8;
};  // size = 0xC4

struct DecodedStageLzPtr_child2
{
    u32 unk0;
    u32 unk4;
    float unk8;
};

struct DecodedStageLzPtr_child3
{
    Vec unk0;  // starting position for stage?
    u8 fillerC[0xE - 0xC];
    s16 unkE;
};

struct DecodedStageLzPtr_child4
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    u8 filler12[0x14-0x12];
};  // size = 0x14

struct Stage
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    struct DecodedStageLzPtr_child *unkC;
    struct DecodedStageLzPtr_child3 *unk10;
    u8 filler14[0x18-0x14];
    s32 unk18;
    struct DecodedStageLzPtr_child4 *unk1C;
    u8 filler20[0x58-0x20];
    s32 unk58;
    struct DecodedStageLzPtr_child2 *unk5C;
    u8 filler60[8];
    s32 unk68;
    struct UnkStruct8005562C *unk6C;
    s32 unk70;
    struct UnkStruct8005562C *unk74;
    u32 unk78;
};

struct Struct8003C550
{
    u8 filler0[8];
    s16 unk8;
    u8 fillerA[0x14-0xA];
    s16 unk14;
    u8 filler16[0x34-0x16];
    Vec unk34;
    Vec unk40;
    u8 filler4C[0x88-0x4C];
    Vec unk88;
    u8 filler94[0xA8-0x94];
    float unkA8;
};

struct Struct80038840
{
    u8 filler0[4];
    void (*unk4)(struct Struct80038840 *);
    u32 unk8;
    u32 unkC;
};

// motload

struct Struct80034938
{
    u16 unk0;
    u8 filler2[2];
    void *unk4;
    void *unk8;
    void *unkC;
    void *unk10;
    void *unk14;
};

struct Struct80034B50_child_child
{
    u32 unk0;
    void *unk4;
};

struct Struct80034B50_child
{
    void *unk0;
    struct Struct80034B50_child_child *unk4;
    void *unk8;
    void *unkC;
    void *unk10;
    void *unk14;
};

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

struct Struct80034B50
{
    struct Struct80034B50_child *unk0;
    u32 unk4;
    struct Struct80034B50_child2 *unk8;
    u32 unkC;
};

struct Struct80034D88
{
    u8 filler0[0x30];
    void *unk30[16];
    u8 filler70[0xB0-0x70];
    void *unkB0;
};

struct Struct80034F5C_1_sub_child3
{
    float unk0;
    float unk4;
    float unk8;
};

struct Struct80034F5C_1_sub
{
    u8 unk0;
    u8 unk1;
    u8 filler2[2];
    u16 *unk4;
    u8 *unk8;
    float *unkC;
};

struct Struct80034F5C_1
{
    u32 unk0;
    u8 filler4[0x54-0x4];
    // huh
    union
    {
        struct Struct80034F5C_1_sub structs[6];
        //struct Struct80034F5C_1_sub unk84[3];
        //Mtx mtx;  // maybe not?
    } unk54;
    u8 fillerB4[0x168-0xB4];
    Mtx unk168;
    u8 filler198[0x1C0-0x198];
    Point3d unk1C0;
    Point3d unk1CC;
    Mtx unk1D8;
    u8 filler208[0x238-0x208];
};

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

struct Struct800355B8  // maybe the same as Struct80034F5C_1?
{
    u32 unk0;
    u8 filler4[0x2E - 0x4];
    s16 unk2E;
    u8 filler30[2];
    u16 unk32;
    u8 filler34[2];
    u16 unk36;
    u16 unk38;
    u16 unk3A;
    u8 filler3C[0x40-0x3C];
    float unk40;
    u8 filler44[0x54-0x44];
    Mtx unk54;
};

struct CoordsS8
{
    s8 x;
    s8 y;
};

// sprite

struct Sprite
{
    /*0x00*/ s8 type;  // type 0 = text, 1 = ???, 2 = ???
    /*0x01*/ u8 fontId;  // fontId
             s8 unk2;
    /*0x03*/ s8 textAlign;
    /*0x04*/ float centerX;
    /*0x08*/ float centerY;
             u8 unkC;
             u8 unkD;
             u8 unkE;
             s8 unkF;
             s16 unk10;
             u8 filler12[0x30-0x12];
    /*0x30*/ void (*destFunc)();
    /*0x34*/ void (*mainFunc)();
             void (*unk38)(struct Sprite *);
             u16 unk3C;
             u8 filler3E[0x40-0x3E];
             float unk40;
             float unk44;
             u32 unk48;
             float unk4C;
             struct Sprite *unk50;
             struct Sprite *unk54;
             s32 unk58;
             s32 unk5C;
             s32 unk60;
             s32 unk64;
             u8 filler68[0x6C-0x68];
             float unk6C;
             u8 filler70[4];
             u32 unk74;
             u32 unk78;
             float unk7C;
             float unk80;
             float unk84;
             float unk88;
    /*0x8C*/ char text[0xBC-0x8C];  // text
};

struct FontParams
{
    /*0x00*/ s16 unk0;
    /*0x02*/ u8 spaceWidth;
    /*0x03*/ u8 lineHeight;
    /*0x04*/ s32 unk4;
    /*0x08*/ u32 unk8;
    /*0x0C*/ s8 unkC;
    /*0x0D*/ s8 unkD;
    /*0x10*/ float unk10;
    /*0x14*/ float unk14;
    /*0x18*/ float unk18;
    /*0x1C*/ float unk1C;
    /*0x20*/ u8 unk20;
    /*0x21*/ u8 unk21;
    /*0x22*/ u8 unk22;
    /*0x23*/ s8 unk23;
};

struct Struct801F3DC0
{
    u8 filler0[0x50];
};

struct Struct802F1BE0
{
    s32 unk0;
    s32 unk4;
};

struct Struct802F1F44
{
    void *unk0;
    u32 **unk4;
    u32 unk8;
    u32 unkC;
    u8 filler10[0x14-0x10];
    void *unk14;
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
    u32 unk4C;  // 5C
    u8 filler50[4];
    u32 unk54;
    u32 unk58;
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

struct Struct802BA200
{
    s8 unk0;
    u8 filler1[3];
    float unk4;
    float unk8;
    u8 r, g, b;
    s8 unkF;
};
