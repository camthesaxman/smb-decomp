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
    GXBool compareEnable;
    GXCompare compareFunc;
    GXBool updateEnable;
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

struct Sprite;
struct FontParams;
