// .bss variables seem to be ordered in the file based on their usage.
// This macro generates a dummy function that forces the order and will be
// stripped by the linker.
#define FORCE_BSS_ORDER(var) void *force_##var(){return &var;}

extern GXRenderModeObj *currRenderMode;
extern void **lbl_802F1CA4;
extern OSHeapHandle __OSCurrHeap;

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

extern struct PerfInfo perfInfo;

extern u32 lbl_802F1EE0;
extern u32 lbl_802F1B34;

extern u32 lbl_802F1B44;
extern u32 lbl_802F1B38;

extern u32 perfEnabled;

extern u16 loadingStageIdRequest;
extern u16 lbl_802F1F40;

extern GXRenderModeObj lbl_801E8E98;
extern GXRenderModeObj lbl_801E8F10;
extern GXRenderModeObj lbl_801E8ED4;
extern GXRenderModeObj lbl_801EEB60;

extern void *currentBallStructPtr;
extern void *currentWorldStructPtr;
extern u8 lbl_80205E60[];
extern u8 lbl_80206BF0[];

extern u8 lbl_801EEBA0[];
extern u8 lbl_801ED920[];
extern u8 lbl_80292E70[];

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

extern struct Struct802F1B60 *lbl_802F1B60;
extern void *lbl_802F1B3C;
extern void *lbl_802F21A0;
extern void *lbl_802F1B50;
extern void *lbl_802F1B54;
extern BOOL lbl_802F1B58;

extern OSHeapHandle lbl_802F1B28;
extern OSHeapHandle lbl_802F1B24;
extern OSHeapHandle lbl_802F1B20;
extern OSHeapHandle lbl_802F1B1C;
extern OSHeapHandle lbl_802F1B2C;



extern long lbl_802F1B18;
extern long lbl_802F1B14;
extern long lbl_802F1B10;
extern long lbl_802F1B0C;
extern long lbl_802F1B08;

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
extern struct Struct801723C0 lbl_801723C0;

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
extern struct ModeControl modeCtrl;

enum
{
    EV_STATE_INACTIVE = 0,
    EV_STATE_RUNNING = 2,
    EV_STATE_SUSPENDED = 4
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
extern struct Event eventInfo[];

struct Struct801EEC80
{
    u8 filler0[0x10];
    u32 unk10;
};
extern struct Struct801EEC80 lbl_801EEC80;

extern u32 lbl_802F2000;

extern s16 gameMode;
extern s16 gameSubmode;

extern u32 lbl_802F1BC8;
