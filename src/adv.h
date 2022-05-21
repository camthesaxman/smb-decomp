#ifndef _SRC_ADV_H_
#define _SRC_ADV_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>

struct AdvLogoInfo
{
    Vec pos;
    s16 xrot;
    s16 zrot;
    s32 rollTimer;
    s32 timer;
    s32 unk18[4];
};

enum
{
    ADV_FLAG_SHOW_BLIMP = (1 << 0),
    ADV_FLAG_SHOW_STAGE = (1 << 1),
    ADV_FLAG_SHOW_BALLS = (1 << 2),
};

struct AdvDemoInfo
{
    u8 filler0[4];
    u32 flags;
    s32 unk8;
    s32 unkC;
};

struct AdvTutorialInfo
{
    s32 stickXRot;
    s32 stickZRot;
    s32 state;
    float transitionValue;  // value from 0 to 1. The A button is on top when it is 0,
                 // and the analog stick is on top when it is 1.
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
extern struct AdvTutorialInfo advTutorialInfo;

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

#endif
