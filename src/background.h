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

struct BackgroundInfo  // size = 0xA8
{
    s16 bgId;
    float unk4;
    u32 unk8;
    GXColor backdropColor;
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
    int (*unk78)();
    int (*unk7C)();
    u32 unk80;
    float unk84;
    u8 filler88[4];
    u32 unk8C;
    void (*unk90)();
    /*0x94*/ Func802F20EC ballEnvFunc;
    void (*unk98)();
    void *unk9C;
    u32 unkA0;
    u32 unkA4;
};

extern struct BackgroundInfo backgroundInfo;
// extern ? bgDrawFuncs;
// extern ? lbl_801B9658;
extern u8 stageBackgrounds[];

void ev_background_init(void);
void ev_background_main(void);
void ev_background_dest(void);
void func_80054FF0(void);
void background_draw(void);
void func_8005507C(void);
void preload_bg_files(int);
void load_bg_files(int bgId);
void func_800554A4(int);
void bg_e3_init(void);
void bg_e3_main(void);
void bg_e3_finish(void);
void bg_e3_draw(void);
void func_80055628(int);
void g_animate_background_parts(struct StageBgModel *, int, float);
void g_draw_bg_models();
void func_80055C6C(Mtx a, struct UnkStruct8005562C_child2 *b);
void bg_night_init(void);
void bg_night_main(void);
void bg_night_finish(void);
void bg_night_draw(void);
void func_8005601C(int);
void bg_ice2_init(void);
void bg_ice2_main(void);
void bg_ice2_finish(void);
void bg_ice2_draw(void);
void func_8005615C(int);
void bg_billiards_init(void);
void bg_billiards_main(void);
void bg_billiards_finish(void);
void bg_billiards_draw(void);
void func_8005638C(int);
void bg_golf_init(void);
void bg_golf_main(void);
void bg_golf_finish(void);
void bg_golf_draw(void);
void func_800564CC(int);
void bg_bowling_init(void);
void bg_bowling_main(void);
void bg_bowling_finish(void);
void bg_bowling_draw(void);
void func_8005660C(int);
int func_80056610(u32 **a, void *b);
// ? func_80056684();
// ? func_800567DC();
// ? func_80056934();
void func_800569B4(int);
void bg_old_bluesky_init(void);
void bg_old_bluesky_main(void);
void bg_old_bluesky_finish(void);
void bg_old_bluesky_draw(void);
void func_800573A0(int);
// ? func_800573A4();
// ? func_8005748C();
// ? func_800578D0();
// ? func_80057934();
void bg_old_cave_init(void);
void bg_old_cave_main(void);
void bg_old_cave_finish(void);
void bg_old_cave_draw(void);
void func_80057A98(int);
void bg_old_extramaster_init(void);
void bg_old_extramaster_main(void);
void bg_old_extramaster_finish(void);
void bg_old_extramaster_draw(void);
void func_8005828C(int);
void bg_old_night_init(void);
void bg_old_night_main(void);
void bg_old_night_finish(void);
void bg_old_night_draw(void);
void func_8005851C(int);
void bg_old_space_init(void);
void bg_old_space_main(void);
void bg_old_space_finish(void);
void bg_old_space_draw(void);
void func_80058728(int);
void bg_old_sunset_init(void);
void bg_old_sunset_main(void);
void bg_old_sunset_finish(void);
void bg_old_sunset_draw(void);
void func_800587F8(int);
void bg_old_bonus_init(void);
void bg_old_bonus_main(void);
void bg_old_bonus_finish(void);
void bg_old_bonus_draw(void);
void func_800589AC(int);
void bg_old_ice_init(void);
void bg_old_ice_main(void);
void bg_old_ice_finish(void);
void bg_old_ice_draw(void);
void func_80058CDC(int);
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
void func_800599F8(int);
void bg_old_storm_init(void);
void bg_old_storm_main(void);
void bg_old_storm_finish(void);
void bg_old_storm_draw(void);
void func_8005A178(int);
void bg_old_water_init(void);
void bg_old_water_main(void);
void bg_old_water_finish(void);
void bg_old_water_draw(void);
void func_8005AD7C(int);
int func_8005AD80();
int func_8005AE1C();
void bg_jungle_init(void);
void bg_jungle_main(void);
void bg_jungle_finish(void);
void bg_jungle_draw(void);
void func_8005B868(int);
void bg_sand_init(void);
void bg_sand_main(void);
void bg_sand_finish(void);
void bg_sand_draw(void);
void func_8005C3B4(int);
// ? func_8005C3B8();
// ? func_8005C4D0();
// ? func_8005C540();
// ? func_8005C55C();
void bg_water_init(void);
void bg_water_main(void);
void bg_water_finish(void);
void bg_water_draw(void);
void func_8005E910(int);
// ? func_8005ED80();
void bg_space_init(void);
void bg_space_main(void);
void bg_space_finish(void);
void bg_space_draw(void);
void func_800609A8(int);
void bg_sunset_init(void);
void bg_sunset_main(void);
void bg_sunset_finish(void);
void bg_sunset_draw(void);
void func_80061390(int);
void bg_bonus_init(void);
void bg_bonus_main(void);
void bg_bonus_finish(void);
void bg_bonus_draw(void);
void func_80061920(int);
void bg_storm_init(void);
void bg_storm_main(void);
void bg_storm_finish(void);
void bg_storm_draw(void);
void func_80062BD0(int);
void bg_master_init(void);
void bg_master_main(void);
void bg_master_finish(void);
void bg_master_draw(void);
void func_80063AD4(int);
void bg_pilot_init(void);
void bg_pilot_main(void);
void bg_pilot_finish(void);
void bg_pilot_draw(void);
void func_80064C2C(int);
void bg_end_init(void);
void bg_end_main(void);
void bg_end_finish(void);
void bg_end_draw(void);
