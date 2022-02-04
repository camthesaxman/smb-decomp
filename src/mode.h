// Game Modes
enum
{
    MD_ADV,
    MD_SEL,
    MD_GAME,
    MD_TEST,
    MD_MINI,
    MD_OPTION,
};

// Game Submodes
enum
{
    SMD_ADV_TOP,  // 0
    SMD_ADV_DEMO_INIT,
    SMD_ADV_DEMO_MAIN,  // Attract screen
    SMD_ADV_LOGO_INIT,  // AV logo
    SMD_ADV_LOGO_MAIN,
    SMD_ADV_WARNING_INIT,
    SMD_ADV_WARNING_MAIN,
    SMD_ADV_RATING_INIT,
    SMD_ADV_RATING_MAIN,
    SMD_ADV_START_INIT,
    SMD_ADV_START_MAIN,  // 10
    SMD_ADV_RANKING_INIT,
    SMD_ADV_RANKING_MAIN,
    SMD_ADV_INFO_INIT,
    SMD_ADV_INFO_MAIN,
    SMD_ADV_GAME_READY_INIT,
    SMD_ADV_GAME_READY_MAIN,
    SMD_ADV_GAME_PLAY_INIT,
    SMD_ADV_GAME_PLAY_MAIN,
    SMD_ADV_TITLE_INIT,
    SMD_ADV_TITLE_MAIN,  // 20
    SMD_ADV_TITLE_REINIT,
    SMD_ADV_DMY4,
    SMD_ADV_DMY5,
    SMD_ADV_DMY6,
    SMD_ADV_DMY7,
    SMD_ADV_DMY8,
    SMD_ADV_BOTTOM,
    SMD_SEL_TOP,
    SMD_SEL_STAGE_INIT,
    SMD_SEL_STAGE_MAIN,  // 30
    SMD_SEL_NGC_INIT,
    SMD_SEL_NGC_MAIN,
    SMD_SEL_NGC_REINIT,
    SMD_SEL_NGC_DEST,
    SMD_SEL_DMY1,
    SMD_SEL_DMY2,
    SMD_SEL_DMY3,
    SMD_SEL_DMY4,
    SMD_SEL_DMY5,
    SMD_SEL_DMY6,  // 40
    SMD_SEL_DMY7,
    SMD_SEL_DMY8,
    SMD_SEL_DMY9,
    SMD_SEL_DMYa,
    SMD_SEL_DMYb,
    SMD_SEL_BOTTOM,
    SMD_GAME_TOP,
    SMD_GAME_READY_INIT,
    SMD_GAME_READY_MAIN,
    SMD_GAME_PLAY_INIT,  // 50
    SMD_GAME_PLAY_MAIN,
    SMD_GAME_GOAL_INIT,
    SMD_GAME_GOAL_MAIN,
    SMD_GAME_GOAL_REPLAY_INIT,
    SMD_GAME_GOAL_REPLAY_MAIN,
    SMD_GAME_TIMEOVER_INIT,
    SMD_GAME_TIMEOVER_MAIN,
    SMD_GAME_RINGOUT_INIT,
    SMD_GAME_RINGOUT_MAIN,
    SMD_GAME_FIRST_INIT,  // 60
    SMD_GAME_OVER_INIT,
    SMD_GAME_OVER_MAIN,
    SMD_GAME_NAMEENTRY_INIT,
    SMD_GAME_NAMEENTRY_MAIN,
    SMD_GAME_CONTINUE_INIT,
    SMD_GAME_CONTINUE_MAIN,
    SMD_GAME_RESTART_INIT,
    SMD_GAME_NAMEENTRY_READY_INIT,
    SMD_GAME_NAMEENTRY_READY_MAIN,
    SMD_GAME_BONUS_CLEAR_INIT,  // 70
    SMD_GAME_BONUS_CLEAR_MAIN,
    SMD_GAME_ENDING_INIT,
    SMD_GAME_ENDING_MAIN,
    SMD_GAME_EXTRA_INIT,
    SMD_GAME_EXTRA_WAIT,
    SMD_GAME_RESULT_INIT,
    SMD_GAME_RESULT_MAIN,
    SMD_GAME_RESULT_MENU,
    SMD_GAME_INTR_SEL_INIT,
    SMD_GAME_INTR_SEL_MAIN,  // 80
    SMD_GAME_OVER_SAVE,
    SMD_GAME_OVER_DEST,
    SMD_GAME_ROLL_INIT,
    SMD_GAME_ROLL_MAIN,
    SMD_GAME_OVER_POINT_INIT,
    SMD_GAME_OVER_POINT_MAIN,
    SMD_GAME_DMY3,
    SMD_GAME_DMY4,
    SMD_GAME_DMY5,
    SMD_GAME_DMY6,  // 90
    SMD_GAME_DMY7,
    SMD_GAME_DMY8,
    SMD_GAME_BOTTOM,
    SMD_TEST_TOP,
    SMD_TEST_SELECT_INIT,
    SMD_TEST_SELECT_MAIN,
    SMD_TEST_INPUT_INIT,
    SMD_TEST_INPUT_MAIN,
    SMD_TEST_DIP_INIT,
    SMD_TEST_DIP_MAIN,  // 100
    SMD_TEST_SOUND_INIT,
    SMD_TEST_SOUND_MAIN,
    SMD_TEST_BLUR_INIT,
    SMD_TEST_BLUR_MAIN,
    SMD_TEST_SHADOW_INIT,
    SMD_TEST_SHADOW_MAIN,
    SMD_TEST_FOCUS_INIT,
    SMD_TEST_FOCUS_MAIN,
    SMD_TEST_INDIRECT_INIT,
    SMD_TEST_INDIRECT_MAIN,  // 110
    SMD_TEST_NLOBJPUT_INIT,
    SMD_TEST_NLOBJPUT_MAIN,
    SMD_TEST_BITMAP_INIT,
    SMD_TEST_BITMAP_MAIN,
    SMD_TEST_FONT_INIT,
    SMD_TEST_FONT_MAIN,
    SMD_TEST_REPLAY_INIT,
    SMD_TEST_REPLAY_MAIN,
    SMD_TEST_MOTION_INIT,
    SMD_TEST_MOTION_MAIN,  // 120
    SMD_TEST_ADVREPLAY_INIT,
    SMD_TEST_MODEL_INIT,
    SMD_TEST_MODEL_MAIN,
    SMD_TEST_NEWMODEL_INIT,
    SMD_TEST_NEWMODEL_MAIN,
    SMD_TEST_PATTERN_INIT,
    SMD_TEST_PATTERN_MAIN,
    SMD_TEST_ROMFONT_INIT,
    SMD_TEST_ROMFONT_MAIN,
    SMD_TEST_PREREND_INIT,  // 130
    SMD_TEST_PREREND_MAIN,
    SMD_TEST_PREVIEW_INIT,
    SMD_TEST_PREVIEW_MAIN,
    SMD_TEST_DMY2,
    SMD_TEST_DMY3,
    SMD_TEST_DMY4,
    SMD_TEST_DMY5,
    SMD_TEST_DMY6,
    SMD_TEST_DMY7,
    SMD_TEST_DMY8,  // 140
    SMD_TEST_DMY9,
    SMD_TEST_BOTTOM,
    SMD_MINI_TOP,
    SMD_MINI_SELECT_INIT,
    SMD_MINI_SELECT_MAIN,
    SMD_MINI_TEST0_INIT,
    SMD_MINI_TEST0_MAIN,
    SMD_MINI_FIGHT_INIT,
    SMD_MINI_FIGHT_MAIN,
    SMD_MINI_BOWLING_INIT,  // 150
    SMD_MINI_BOWLING_MAIN,
    SMD_MINI_RACE_INIT,
    SMD_MINI_RACE_MAIN,
    SMD_MINI_PILOT_INIT,
    SMD_MINI_PILOT_MAIN,
    SMD_MINI_BILLIARDS_INIT,
    SMD_MINI_BILLIARDS_MAIN,
    SMD_MINI_GOLF_INIT,
    SMD_MINI_GOLF_MAIN,
    SMD_MINI_REL_SAMPLE_INIT,  // 160
    SMD_MINI_REL_SAMPLE_MAIN,
    SMD_MINI_COMMEND_INIT,
    SMD_MINI_COMMEND_MAIN,
    SMD_MINI_RANKING_INIT,
    SMD_MINI_RANKING_MAIN,
    SMD_MINI_ENDING_INIT,
    SMD_MINI_ENDING_MAIN,
    SMD_MINI_DMY4,
    SMD_MINI_DMY5,
    SMD_MINI_DMY6,  // 170
    SMD_MINI_DMY7,
    SMD_MINI_BOTTOM,
    SMD_OPTION_TOP,
    SMD_OPTION_SELECT_INIT,
    SMD_OPTION_SELECT_MAIN,
    SMD_OPTION_SOUND_INIT,
    SMD_OPTION_SOUND_MAIN,
    SMD_OPTION_PAD_INIT,
    SMD_OPTION_PAD_MAIN,
    SMD_OPTION_MEMCARD_INIT,  // 180
    SMD_OPTION_MEMCARD_MAIN,
    SMD_OPTION_POINT_INIT,
    SMD_OPTION_POINT_MAIN,
    SMD_OPTION_RANKING_INIT,
    SMD_OPTION_RANKING_MAIN,
    SMD_OPTION_AUTOSAVE_INIT,
    SMD_OPTION_AUTOSAVE_MAIN,
    SMD_OPTION_REPLAY_INIT,
    SMD_OPTION_REPLAY_MAIN,
    SMD_OPTION_SEPARATE_INIT,  // 190
    SMD_OPTION_SEPARATE_MAIN,
    SMD_OPTION_REPLAY_PLAY_INIT,
    SMD_OPTION_REPLAY_PLAY_MAIN,
    SMD_OPTION_PAD_MENU_INIT,
    SMD_OPTION_PAD_MENU_MAIN,
    SMD_OPTION_PAD_VIB_INIT,
    SMD_OPTION_PAD_VIB_MAIN,
    SMD_OPTION_BOTTOM, 
};

enum
{
    LVLSET_BEGINNER,
    LVLSET_ADVANCED,
    LVLSET_EXPERT,  // or Master (also referred to as Extra 2 in some places)
};

enum
{
    // (1 << 2) = used a continue?
    LVLSET_FLAG_EXTRA = (1 << 3),
    LVLSET_FLAG_MASTER = (1 << 4),
};

enum
{
    GAMETYPE_MAIN_NORMAL,
    GAMETYPE_MAIN_COMPETITION,
    GAMETYPE_MAIN_PRACTICE,
    GAMETYPE_MINI_RACE,
    GAMETYPE_MINI_FIGHT,
    GAMETYPE_MINI_TARGET,
    GAMETYPE_MINI_BILLIARDS,
    GAMETYPE_MINI_BOWLING,
    GAMETYPE_MINI_GOLF,
};

struct ModeControl
{
    s32 unk0;
    s32 levelSet;
    u32 levelSetFlags;
    u8 fillerC[0x10-0xC];
    s32 unk10;
    u8 filler14[4];
    s32 unk18;
    s32 unk1C;
    /*0x20*/ s32 menuSel;
    /*0x24*/ int playerCount;
    /*0x28*/ s32 gameType;
    s32 unk2C;
    s32 unk30;
    u8 filler34[0x3C-0x34];
    s32 unk3C;
    s16 unk40;
    u8 unk42;
    u8 filler43[0x48-0x43];
};

extern struct ModeControl modeCtrl;
extern s16 gameMode;
extern s16 gameModeRequest;
extern s16 gameSubmode;
extern s16 gameSubmodeRequest;
extern void *modeStringPtr;
extern void *submodeStringPtr;
extern void (*lbl_802F1B70)(void);
extern void (*lbl_802F1B74)(void);
extern s32 lbl_802F1B78;
extern void (*lbl_802F1B7C)(void);
extern void (*lbl_802F1B80)(void);

void gm_init(void);
void gm_main(void);
