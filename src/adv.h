struct AdvLogoInfo
{
    Vec pos;
    s16 xrot;
    s16 zrot;
    s32 unk10;
    s32 unk14;
    s32 unk18[4];
};

struct AdvDemoInfo
{
    u8 filler0[4];
    u32 flags;
    s32 unk8;
    s32 unkC;
};

struct Struct801EED3C
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    float unkC;
    u8 filler10[4];
};

extern u32 introBackdropColor;
extern u32 advSubmode;
extern s32 lbl_802F1BC4;
extern s16 lbl_802F1BBC[4];
extern s16 lbl_802F1BB4[4];
extern s32 lbl_802F1BB0;
extern s32 lbl_802F1BA8;
extern struct AdvLogoInfo advLogoInfo;
extern struct AdvDemoInfo advDemoInfo;
extern struct Struct801EED3C lbl_801EED3C;

void mode_adv_func(void);
void submode_adv_warning_init_func(void);
void submode_adv_warning_main_func(void);
void submode_adv_rating_init_func(void);
void submode_adv_rating_main_func(void);
void submode_adv_logo_init_func(void);
void submode_adv_logo_main_func(void);
void submode_adv_demo_init_func(void);
void submode_adv_demo_main_func(void);
void submode_adv_title_init_func(void);
void submode_adv_title_reinit_func(void);
void submode_adv_title_main_func(void);
void submode_adv_info_init_func(void);
void submode_adv_info_main_func(void);
void submode_adv_game_ready_init_func(void);
void submode_adv_game_ready_main_func(void);
void submode_adv_game_play_init_func(void);
void submode_adv_game_play_main_func(void);
void submode_adv_ranking_init_func(void);
void submode_adv_ranking_main_func(void);
void submode_adv_start_init_func(void);
void submode_adv_start_main_func(void);
