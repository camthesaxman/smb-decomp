enum
{
    EV_STATE_INACTIVE = 0,
    EV_STATE_RUNNING = 2,
    EV_STATE_SUSPENDED = 4
};

// avdisp.c
struct GMAModelHeader;
struct GMAMeshHeader;
struct GMAMaterial;
struct TPL;
struct UnkStruct17;
struct UnkStruct30;
struct UnkStruct31;
struct UnkStruct32;

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

struct Struct801723C0
{
    u32 *unk0;
    u32 unk4;
    u32 *unk8;
    u32 unkC;
    u32 *unk10;
    u32 unk14;
    u32 *unk18;
    u32 unk1C;
};

struct ModeControl
{
    u32 unk0;
    u8 filler4[4];
    u32 unk8;
    u8 fillerC[0x1C-0xC];
    u32 unk1C;
    s32 unk20;
    u8 filler24[0x28-0x24];
    s32 unk28;
    u8 filler2C[4];
    s32 unk30;
    u8 filler34[0x42-0x34];
    u8 unk42;
};

struct Event
{
    /*0x00*/ s8 state;
    /*0x04*/ char *name;
    /*0x08*/ void (*start)(void);
    /*0x0C*/ void (*main)(void);
    /*0x14*/ void (*finish)(void);
    /*0x18*/ u32 time;
};

struct Struct801EEC80
{
    u8 filler0[0x10];
    u32 unk10;
};

struct UnkStruct8005562C_child
{
    s32 unk0;
    s32 unk4;
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
    u32 unk38;
    u32 unk3C;
    u32 unk40;
    u32 unk44;
    u32 unk48;
    u32 unk4C;
    u32 unk50;
    
    u32 unk58;
    u32 unk5C;
};

struct GMAModelHeader
{
    u8 filler0[4];
    u32 flags;
    Vec unk8;
    float unk14;
    /*0x18*/ u16 numMaterials;
    /*0x1A*/ u16 numLayer1Meshes;
    /*0x1C*/ u16 numLayer2Meshes;
    u8 unk1E;
    u8 filler1F[1];
    u32 headerSize;
    GXTexObj *texObjs;
    u8 unk28[10];
};

struct GMAModelEntry
{
    struct GMAModelHeader *modelOffset;  // pointer to GMAModelHeader
    char *name;
};

struct UnkStruct1
{
    u32 unk0;
    char *unk4;
};

struct GMA
{
    u32 numModels;
    u8 *modelsBase;
    struct GMAModelEntry *modelEntries;
    char *namesBase;
    u8 filler10[0x20-0x10];
    struct UnkStruct1 unk20;
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

struct Camera
{
    u8 filler0[0x1A];
    s16 unk1A;
};

struct Sprite;
struct FontParams;
struct GMA;
struct TPL;

typedef void (*Func802F20EC)();
