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
    u8 fillerC[0x1C-0xC];
    u32 unk1C;
    s32 unk20;
    s32 unk24;
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

struct Camera_sub
{
    float unk28;
    float unk2C;
    s16 unk30;  // fov
    u16 unk32;
    float unk34;
    float unk38;
    float unk3C;
    float unk40;  // left
    float unk44;  // top
    float unk48;  // width
    float unk4C;  // height
};

struct Camera
{
    Vec unk0;  // eye
    Vec unkC;  // lookAt
    s16 unk18;  // pitch
    s16 unk1A;  // yaw
    s16 unk1C;  // roll
    s8 unk1E;  // state
    u8 unk1F;
    float unk20;
    s16 unk24;  // flags
    s8 unk26;
    u8 filler27[0x28-0x27];
    struct Camera_sub sub28;  // viewport info?
    s16 unk50;
    s16 unk52;
    Vec unk54;  // lookAt start for level fly-in?
    float unk60;
    float unk64;
    s32 unk68;
    s32 unk6C;
    s32 unk70;
    Vec unk74;  // lookAt end for level fly-in?
    float unk80;
    u8 filler84[0x88-0x84];
    s32 unk88;
    s32 unk8C;
    s32 unk90;
    Vec unk94;
    Vec unkA0;
    Vec unkAC;
    s16 unkB8;
    u8 fillerBA[2];
    Vec unkBC;
    Vec unkC8;
    u8 fillerD4[0xEC-0xD4];
    u32 unkEC;
    s32 unkF0;
    Vec unkF4;
    float unk100;
    float unk104;
    float unk108;
    s16 unk10C;
    u8 filler10E[0x144-0x10E];
    Mtx unk144;
    Mtx unk174;
    Mtx unk1A4;
    Mtx unk1D4;
    u32 unk204;
    u8 unk208;
    u8 filler20C[0x284-0x20C];
    
};  // size=0x284

//STATIC_ASSERT(offsetof(struct Camera,unk144)==0x144, no);

struct Sprite;
struct FontParams;
struct GMA;
struct TPL;

typedef void (*Func802F20EC)();

struct Ball_child
{
    u8 filler0[0x10];
    u32 unk10;
    u32 unk14;
    u8 filler18[0x30-0x18];
    Vec unk30;
};

struct Ball
{
    u8 filler0[0x4];
    Vec unk4;
    u8 filler10[0x2E - 0x10];
    s8 unk2E;
    u8 filler2F[0x68-0x2F];
    float unk68;
    u8 filler6C[0x80-0x6C];
    s32 unk80;
    u8 filler84[0x92-0x84];
    s16 unk92;
    u32 unk94;
    u8 filler98[0xFC-0x98];
    struct Ball_child *unkFC;
    u8 filler100[0x1A4-0x100];
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
    u32 unk94;
    void (*unk98)();
    void *unk9C;
    u32 unkA0;
    u32 unkA4;
};

struct World
{
    s16 unk0;
    s16 unk2;
    u8 filler4[0x40-0x4];
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
