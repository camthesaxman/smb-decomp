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

// Backgrounds
enum
{
    BG_TYPE_BLUESKY_A = 1,
    BG_TYPE_NIGHT_B,
    BG_TYPE_SUNSET_C,
    BG_TYPE_WATER_C,
    BG_TYPE_STORM_D,  // 5
    BG_TYPE_ICE_E,
    BG_TYPE_SAND_G,
    BG_TYPE_SPACE_H,
    BG_TYPE_CAVE_I,
    BG_TYPE_BONUS_J,  // 10
    BG_TYPE_EXTRAMASTER_J,
    BG_TYPE_E3,
    BG_TYPE_JUN,
    BG_TYPE_WAT,
    BG_TYPE_NIG,  // 15
    BG_TYPE_SUN,
    BG_TYPE_SPA,
    BG_TYPE_SND,
    BG_TYPE_ICE2,
    BG_TYPE_STM,  // 20
    BG_TYPE_BNS,
    BG_TYPE_PIL,
    BG_TYPE_BIL,
    BG_TYPE_GOL,
    BG_TYPE_BOW,  // 25
    BG_TYPE_MST,
    BG_TYPE_END,
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
    s32 unk0;
    s32 unk4;
    u32 unk8;
    u8 fillerC[0x10-0xC];
    s32 unk10;
    u8 filler14[0x1C-0x14];
    u32 unk1C;
    s32 unk20;
    int unk24;
    s32 unk28;
    s32 unk2C;
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

struct GMAModelHeader
{
    u8 filler0[4];
    /*0x04*/ u32 flags;
    Vec unk8;
    float unk14;
    /*0x18*/ u16 numMaterials;
    /*0x1A*/ u16 numLayer1Meshes;
    /*0x1C*/ u16 numLayer2Meshes;
    u8 unk1E;
    u8 filler1F[1];
    /*0x20*/ u32 headerSize;
    /*0x24*/ GXTexObj *texObjs;
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

struct Camera;

struct Sprite;
struct FontParams;
struct GMA;
struct TPL;

typedef void (*Func802F20EC)();

struct Struct8003699C_child
{
    u8 filler0[0x38];
    u16 unk38;
    u8 filler3A[2];
    float unk3C;
};

struct Ball_child
{
    struct Struct8003699C_child *unk0;
    u8 filler4[0x10-4];
    s32 unk10;
    u32 unk14;
    u8 filler18[0x24-0x18];
    s32 unk24;
    u8 filler28[0x30-0x28];
    Vec unk30;
    Vec unk3C;
    Vec unk48;
    s32 unk54;
    u8 filler58[0x60-0x58];
    Quaternion unk60;
    u8 filler70[0x74-0x70];
    u32 unk74;
    u8 filler78[0xB4-0x78];
    u32 unkB4;
    u8 fillerB8[0xC0-0xB8];
    s8 unkC0;
    u8 unkC1;
    s16 unkC2;
    u8 fillerC4[0x1CE - 0xC4];
    s16 unk1CE;  // used in the Ball.unk144 one
};

struct Ball
{
    u8 unk0;
    s8 unk1;
    s8 unk2;  // lives
    s8 unk3;
    Vec unk4;  // position
    Vec unk10;
    Vec unk1C;
    s16 unk28;
    s16 unk2A;
    s16 unk2C;
    s8 unk2E;
    s8 unk2F;
    Mtx unk30;
    s16 unk60;
    s16 unk62;
    s16 unk64;
    s16 unk66;
    float unk68;
    float unk6C;
    float unk70;
    float unk74;
    s32 unk78;  // bananas
    u32 unk7C;
    s32 unk80;
    Vec unk84;
    s16 unk90;
    s16 unk92;
    u32 unk94;
    Quaternion unk98;
    Quaternion unkA8;
    Vec unkB8;
    float unkC4;
    Mtx unkC8;
    float unkF8;
    struct Ball_child *unkFC;
    u32 unk100;
    Vec unk104;
    float unk110;
    Vec unk114;
    u32 unk120;
    s16 unk124;
    s16 unk126;
    s16 unk128;
    s16 unk12A;
    u8 filler12C[0x130-0x12C];
    float unk130;
    u32 unk134;
    u8 filler138[4];
    s32 unk13C;
    float unk140;
    struct Ball_child *unk144;  // guessing this is the same type as unkFC?
    u8 filler148[0x14A - 0x148];
    u8 unk14A;
    u8 unk14B;
    u8 filler14C[2];
    s16 unk14E;
    Vec unk150;
    float unk15C[4];
    u8 filler16C[0x1A4-0x16C];
};

struct BackgroundInfo  // size = 0xA8
{
    s16 bgId;
    float unk4;
    u32 unk8;
    u32 unkC;
    u8 filler10[0x14-0x10];
    Vec unk14;
    Vec unk20;
    float unk2C;
    float unk30;
    float unk34;
    float unk38;
    float unk3C;
    float unk40;
    u8 filler44[4];
    Mtx unk48;
    void (*unk78)(void);
    int (*unk7C)();
    u32 unk80;
    float unk84;
    u8 filler88[4];
    u32 unk8C;
    void (*unk90)();
    Func802F20EC unk94;
    void (*unk98)();
    void *unk9C;
    u32 unkA0;
    u32 unkA4;
};

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
    u8 filler1C[0x7C-0x1C];
    s32 unk7C;
    u8 filler80[0xB8-0x80];
    Vec unkB8;
};

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
