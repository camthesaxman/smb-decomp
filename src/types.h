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

struct Struct802F1B60
{
    Mtx unk0;
    u8 filler30[0x90-0x30];
    u8 *unk90;
    u8 *unk94;
    u8 filler98[0x198-0x98];
    float unk198;
    float unk19C;
    float unk1A0;
    float unk1A4;
    s32 unk1A8;
    u8 unk1AC;
    u8 unk1AD;
    u8 unk1AE;
    u8 unk1AF;
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
    s8 state;
    char *name;
    void (*start)(void);
    void (*main)(void);
    void (*finish)(void);
    u32 time;
};

struct Struct801EEC80
{
    u8 filler0[0x10];
    u32 unk10;
};
