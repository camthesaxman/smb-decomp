#ifndef _SRC_INFO_H_
#define _SRC_INFO_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>

enum
{
    INFO_FLAG_GOAL     = (1 << 0),
    INFO_FLAG_TIMEOVER = (1 << 1),
    INFO_FLAG_FALLOUT  = (1 << 2),
};

struct Struct801F3A58
{
    u32 unk0;
    s16 timerCurr;  // current clock time (in 60ths of a second)
    s16 timerMax;  // maximum clock time (in 60ths of a second)
    u32 unk8;
    s16 unkC;
    s16 unkE;
    Vec unk10;
    s16 unk1C;
    s16 unk1E;
    s16 unk20;
    s16 unk22;
    s32 unk24;
    s16 unk28;  // lives lost?
    s16 unk2A;  // continues used?
    s16 unk2C;
    s16 unk2E;
    s16 unk30;
    s16 unk32;
};

extern struct Struct801F3A58 infoWork;
extern u32 lbl_801F3A8C[4];
extern struct Struct801F3A58 lbl_801F3A9C[4];

void func_80022F14(void);
void ev_info_init(void);
void ev_info_main(void);
void ev_info_dest(void);
void func_80023AF4(void);
int check_ball_in_goal(struct Ball *, u32 *, s32 *);
void g_time_over_all_competition_mode_balls(void);
void func_80023DB8(struct Ball *);
void create_rank_icon(struct Ball *);
void func_800245E4(struct Ball *, int, int);
int func_800246F4(struct Ball *);
void func_80024860(struct Ball *);

#endif