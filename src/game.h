#ifndef _SRC_GAME_H_
#define _SRC_GAME_H_

#include <dolphin/types.h>

void mode_game_func(void);
void submode_game_first_init_func(void);
void submode_game_restart_init_func(void);
void submode_game_ready_init_func(void);
void submode_game_ready_main_func(void);
void submode_game_play_init_func(void);
void submode_game_play_main_func(void);
void submode_game_goal_init_func(void);
void submode_game_goal_main_func(void);
void submode_game_goal_replay_init_func(void);
void submode_game_goal_replay_main_func(void);
void submode_game_continue_init_func(void);
void submode_game_continue_main_func(void);
void submode_game_timeover_init_func(void);
void submode_game_timeover_main_func(void);
void submode_game_ringout_init_func(void);
void submode_game_ringout_main_func(void);
void submode_game_bonus_clear_init_func(void);
void submode_game_bonus_clear_main_func(void);
void submode_game_over_init_func(void);
void submode_game_over_main_func(void);
void submode_game_over_point_init_func(void);
void submode_game_over_point_main_func(void);
void submode_game_over_save_func(void);
void submode_game_over_dest_func(void);
void submode_game_nameentry_ready_init_func(void);
void submode_game_nameentry_ready_main_func(void);
void submode_game_nameentry_init_func(void);
void submode_game_nameentry_main_func(void);
void submode_game_ending_init_func(void);
void submode_game_ending_main_func(void);
void submode_game_roll_init_func(void);
void submode_game_roll_main_func(void);
void submode_game_extra_init_func(void);
void submode_game_extra_wait_func(void);
void submode_game_result_init_func(void);
// ? func_800165C0();
void submode_game_result_main_func(void);
void submode_game_result_menu_func(void);
void submode_game_intr_sel_init_func(void);
void submode_game_intr_sel_main_func(void);
int g_get_next_stage_id(void);
int func_80017004(void);
u32 lose_life(void);
void func_80017140(void);
// ? get_next_player();
void g_init_player_data_1(void);
void g_init_player_data_2(void);
void func_80017708(int);
BOOL func_80017720(void);

#endif
