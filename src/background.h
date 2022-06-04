#ifndef _SRC_BG_H_
#define _SRC_BG_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>
#include <dolphin/GXStruct.h>

#include "types.h"
#include "gma.h"

/*               id                    fname        oldfname song backdropColor (RGBA)*/
#define BACKGROUND_LIST \
/*01*/ DEFINE_BG(BG_TYPE_BLUESKY_A,     NULL,        "bg_a",  -1, 0xFFFFFFFF) \
/*02*/ DEFINE_BG(BG_TYPE_NIGHT_B,       NULL,        "bg_b",  -1, 0x113967FF) \
/*03*/ DEFINE_BG(BG_TYPE_SUNSET_C,      NULL,        "bg_c",  -1, 0x383D6CFF) \
/*04*/ DEFINE_BG(BG_TYPE_WATER_C,       NULL,        "bg_d",  -1, 0x001A4DFF) \
/*05*/ DEFINE_BG(BG_TYPE_STORM_D,       NULL,        "bg_e",  -1, 0x8398EDFF) \
/*06*/ DEFINE_BG(BG_TYPE_ICE_E,         NULL,        "bg_f",  -1, 0x00000000) \
/*07*/ DEFINE_BG(BG_TYPE_SAND_G,        NULL,        "bg_g",  -1, 0x1D4AB500) \
/*08*/ DEFINE_BG(BG_TYPE_SPACE_H,       NULL,        "bg_h",  -1, 0x00000000) \
/*09*/ DEFINE_BG(BG_TYPE_CAVE_I,        NULL,        "bg_i",  -1, 0x00000000) \
/*10*/ DEFINE_BG(BG_TYPE_BONUS_J,       NULL,        "bg_j",  -1, 0x00000000) \
/*11*/ DEFINE_BG(BG_TYPE_EXTRAMASTER_J, NULL,        "bg_j",  -1, 0x00000000) \
/*12*/ DEFINE_BG(BG_TYPE_E3,            NULL,        NULL,    20, 0x00000000) \
/*13*/ DEFINE_BG(BG_TYPE_JUN,           "bg_jun",    NULL,    20, 0xFFFFFFFF) \
/*14*/ DEFINE_BG(BG_TYPE_WAT,           "bg_wat",    NULL,    22, 0x000000FF) \
/*15*/ DEFINE_BG(BG_TYPE_NIG,           "bg_nig",    NULL,    24, 0x000000FF) \
/*16*/ DEFINE_BG(BG_TYPE_SUN,           "bg_sun",    NULL,    26, 0x000000FF) \
/*17*/ DEFINE_BG(BG_TYPE_SPA,           "bg_spa",    NULL,    28, 0x000000FF) \
/*18*/ DEFINE_BG(BG_TYPE_SND,           "bg_snd",    NULL,    30, 0xD8BC77FF) \
/*19*/ DEFINE_BG(BG_TYPE_ICE2,          "bg_ice",    NULL,    32, 0x000000FF) \
/*20*/ DEFINE_BG(BG_TYPE_STM,           "bg_stm",    NULL,    34, 0x000000FF) \
/*21*/ DEFINE_BG(BG_TYPE_BNS,           "bg_bns",    NULL,    36, 0x000000FF) \
/*22*/ DEFINE_BG(BG_TYPE_PIL,           "bg_pil",    NULL,    -1, 0xFFFFFFFF) \
/*23*/ DEFINE_BG(BG_TYPE_BIL,           NULL,        NULL,    -1, 0xFFFFFFFF) \
/*24*/ DEFINE_BG(BG_TYPE_GOL,           "bg_gol",    NULL,    -1, 0xFFFFFFFF) \
/*25*/ DEFINE_BG(BG_TYPE_BOW,           "bg_bow",    NULL,    -1, 0xFFFFFFFF) \
/*26*/ DEFINE_BG(BG_TYPE_MST,           "bg_mst",    NULL,    38, 0xFFFFCDFF) \
/*27*/ DEFINE_BG(BG_TYPE_END,           "bg_ending", NULL,    -1, 0xFFFFFFFF)

enum
{
    BG_NULL = 0,
#define DEFINE_BG(id, fname, oldfname, song, backdropColor) id,
    BACKGROUND_LIST
#undef DEFINE_BG
};

struct BackgroundInfo  // size = 0xA8
{
    s16 bgId;
    float animTimer; // Current animation time in frames
    u32 unk8;
    GXColor backdropColor;
    u8 filler10[0x14-0x10];
    Vec unk14;
    Vec unk20;
    Vec unk2C;
    Vec unk38;
    u8 filler44[4];
    Mtx unk48;
    int (*unk78)();
    int (*unk7C)();
    struct NlModel *unk80;
    float unk84;
    u8 filler88[4];
    BallEnvFunc unk8C;
    void (*unk90)();
    /*0x94*/ BallEnvFunc ballEnvFunc;
    void (*unk98)(void);
    void *work;
    u32 unkA0;
    u32 unkA4;
};

enum
{
    BG_MDL_CMP_PREFIX,
    BG_MDL_CMP_FULL,
    BG_MDL_CMP_SUFFIX,
    BG_MDL_CMP_END,
};

struct BGModelSearch
{
    u32 cmpType;
    char *name;
};

/* Jungle background */

struct BGJungleCloud
{
    struct StageBgModel *bgModel;
    Vec unk4;
    Vec unk10;
    Vec unk1C;
    Mtx unk28;
};

struct BGJungleWork
{
    u8 filler0[4];
    s32 cloudModelCount;
    struct BGJungleCloud cloudModels[4];
    s32 unk168;
};

/* Sunset background */

struct BGSunsetModel
{
    struct StageBgModel *bgModel;
    Vec texTranslation;
    Vec currTexVel;
    Vec desiredTexVel;
    Mtx texMtx;
};

struct BGSunsetWork
{
    u8 filler0[4];
    s32 bgModelsCount;
    struct BGSunsetModel bgModels[4];
    s32 mode; // 0 for most of stage duration, 1 during last 11s "hurry up" phase
};

/* Storm background */

struct BGStormWork_child
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
};

struct BGStormWork
{
    s32 unk0;
    struct GMAModel *rain00Model;
    struct GMAModel *rain01Model;
    struct GMAModel *rain02Model;
    Vec unk10;
    Vec unk1C;
    struct BGStormWork_child unk28[64];
};

/* Bonus background */

struct BGBonusStarpoint
{
    Vec u_pos;
    s16 unkC;
    s16 unkE;
    float red;
    float green;
    float blue;
};

struct BGBonusWork
{
    s32 unk0;
    struct StageBgModel *mainModel;
    struct GMAModel *shotstarModel;
    struct GMAModel *starlightModel;
    s32 starpointCount;
    struct BGBonusStarpoint starpoints[64];
    GXTexObj *lightmapTexObjs;
    GXTexObj *lightmapATexObjs;
    Mtx unk71C;
    Mtx unk74C;
    Mtx unk77C;
    Mtx unk7AC;
    Mtx unk7DC;
};

struct BGEndWork
{
    s32 unk0;
    struct GMAModel *unk4;
    struct GMAModel *unk8;
    GXTexObj *unkC;
    GXTexObj *unk10;
    void (*unk14)();
    void (*unk18)();
    Vec unk1C;
    float unk28;
    float unk2C;
    u8 filler30[4];
    float unk34;
    float unk38;
    float unk3C;
    Vec unk40;
    Vec unk4C;
    float unk58;
    float unk5C;
    u8 filler60[4];
    Mtx unk64;
};

struct BGWaterWork
{
    s32 unk0;
    u8 filler4[0x10-0x4];
    s16 unk10;
    s16 unk12;
    s16 unk14;
    s16 unk16;
    s16 unk18;
    s16 unk1A;
    u16 unk1C;
    u16 unk1E;
    float unk20;
    struct GMAModel *waterSurfaceMat;
    GXTexObj *causticTex;
    GXTexObj *waterSurfaceTestTex;
    GXTexObj *lightmapTex;
    GXTexObj *lightmapStageTex;
    GXTexObj *lightmapGradTex;
    Mtx unk3C;
    Mtx unk6C;
    Mtx unk9C;
    Mtx unkCC;
    Mtx unkFC;
    Mtx unk12C;
    Mtx unk15C;
    struct GMAModel *bubbleModel;
    struct StageBgModel *waterSurface;
};

typedef int (*Func800567DC)(int, struct StageBgModel *);

extern struct BackgroundInfo backgroundInfo;
// extern ? bgDrawFuncs;
// extern ? bgInteractFuncs;
extern u8 stageBackgrounds[];

void ev_background_init(void);
void ev_background_main(void);
void ev_background_dest(void);
void func_80054FF0(void);
void background_draw(void);
void func_8005507C(void);
void preload_bg_files(int);
void load_bg_files(int bgId);
void background_interact(int);
void bg_e3_init(void);
void bg_e3_main(void);
void bg_e3_finish(void);
void bg_e3_draw(void);
void bg_e3_interact(int);
void animate_bg_models(struct StageBgModel *bgModels, int bgModelCount, float timeSeconds);
void draw_bg_models();
void draw_bg_flipbooks(Mtx a, struct StageFlipbookAnims *b);
void bg_night_init(void);
void bg_night_main(void);
void bg_night_finish(void);
void bg_night_draw(void);
void bg_night_interact(int);
void bg_ice2_init(void);
void bg_ice2_main(void);
void bg_ice2_finish(void);
void bg_ice2_draw(void);
void bg_ice2_interact(int);
void bg_billiards_init(void);
void bg_billiards_main(void);
void bg_billiards_finish(void);
void bg_billiards_draw(void);
void bg_billiards_interact(int);
void bg_golf_init(void);
void bg_golf_main(void);
void bg_golf_finish(void);
void bg_golf_draw(void);
void bg_golf_interact(int);
void bg_bowling_init(void);
void bg_bowling_main(void);
void bg_bowling_finish(void);
void bg_bowling_draw(void);
void bg_bowling_interact(int);
int func_80056610(u32 **a, void *b);
void u_search_bg_models(struct BGModelSearch *a, int (*func)(int, struct GMAModelEntry *));
void u_search_bg_models_from_list(struct StageBgModel *r28, int r30_, struct BGModelSearch *a, Func800567DC b);
void func_80056934(void);
void func_800569B4(int);
void bg_old_bluesky_init(void);
void bg_old_bluesky_main(void);
void bg_old_bluesky_finish(void);
void bg_old_bluesky_draw(void);
void bg_old_bluesky_interact(int);
// ? func_800573A4();
// ? func_8005748C();
// ? func_800578D0();
// ? func_80057934();
void bg_old_cave_init(void);
void bg_old_cave_main(void);
void bg_old_cave_finish(void);
void bg_old_cave_draw(void);
void bg_old_cave_interact(int);
void bg_old_extramaster_init(void);
void bg_old_extramaster_main(void);
void bg_old_extramaster_finish(void);
void bg_old_extramaster_draw(void);
void bg_old_extramaster_interact(int);
void bg_old_night_init(void);
void bg_old_night_main(void);
void bg_old_night_finish(void);
void bg_old_night_draw(void);
void bg_old_night_interact(int);
void bg_old_space_init(void);
void bg_old_space_main(void);
void bg_old_space_finish(void);
void bg_old_space_draw(void);
void bg_old_space_interact(int);
void bg_old_sunset_init(void);
void bg_old_sunset_main(void);
void bg_old_sunset_finish(void);
void bg_old_sunset_draw(void);
void bg_old_sunset_interact(int);
void bg_old_bonus_init(void);
void bg_old_bonus_main(void);
void bg_old_bonus_finish(void);
void bg_old_bonus_draw(void);
void bg_old_bonus_interact(int);
void bg_old_ice_init(void);
void bg_old_ice_main(void);
void bg_old_ice_finish(void);
void bg_old_ice_draw(void);
void bg_old_ice_interact(int);
// ? func_80058CE0();
// ? func_80058D44();
// ? func_80059058();
// ? func_80059554();
// ? func_80059560();
// ? func_800595DC();
// ? func_800596C0();
// ? func_80059764();
void bg_old_sand_init(void);
void bg_old_sand_main(void);
void bg_old_sand_finish(void);
void bg_old_sand_draw(void);
void bg_old_sand_interact(int);
void bg_old_storm_init(void);
void bg_old_storm_main(void);
void bg_old_storm_finish(void);
void bg_old_storm_draw(void);
void bg_old_storm_interact(int);
void bg_old_water_init(void);
void bg_old_water_main(void);
void bg_old_water_finish(void);
void bg_old_water_draw(void);
void bg_old_water_interact(int);
int func_8005AD80();
int func_8005AE1C();
void bg_jungle_init(void);
void bg_jungle_main(void);
void bg_jungle_finish(void);
void bg_jungle_draw(void);
void bg_jungle_interact(int);
void bg_sand_init(void);
void bg_sand_main(void);
void bg_sand_finish(void);
void bg_sand_draw(void);
void bg_sand_interact(int);
// ? func_8005C3B8();
// ? func_8005C4D0();
// ? func_8005C540();
// ? func_8005C55C();
void bg_water_init(void);
void bg_water_main(void);
void bg_water_finish(void);
void bg_water_draw(void);
void bg_water_interact(int);
// ? func_8005ED80();
void bg_space_init(void);
void bg_space_main(void);
void bg_space_finish(void);
void bg_space_draw(void);
void bg_space_interact(int);
void bg_sunset_init(void);
void bg_sunset_main(void);
void bg_sunset_finish(void);
void bg_sunset_draw(void);
void bg_sunset_interact(int);
void bg_bonus_init(void);
void bg_bonus_main(void);
void bg_bonus_finish(void);
void bg_bonus_draw(void);
void bg_bonus_interact(int);
void bg_storm_init(void);
void bg_storm_main(void);
void bg_storm_finish(void);
void bg_storm_draw(void);
void bg_storm_interact(int);
void bg_master_init(void);
void bg_master_main(void);
void bg_master_finish(void);
void bg_master_draw(void);
void bg_master_interact(int);
void bg_pilot_init(void);
void bg_pilot_main(void);
void bg_pilot_finish(void);
void bg_pilot_draw(void);
void bg_pilot_interact(int);
void bg_end_init(void);
void bg_end_main(void);
void bg_end_finish(void);
void bg_end_draw(void);
void bg_end_interact(int);

#endif
