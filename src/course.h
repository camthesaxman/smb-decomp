#ifndef _SRC_COURSE_H_
#define _SRC_COURSE_H_

struct MemcardGameData;
struct Sprite;

struct Struct8027CE18
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
};

extern struct Struct8027CE18 lbl_8027CE18;

void func_80065C58(void);
void func_80066294(void);
void func_800662D4(void);
void func_800662E0(void);
void func_8006634C(void);
void show_course_end_textbox(int, s16, s16);
int func_80066868(void);
void func_800668A0(void);
void ev_course_init(void);
void ev_course_main(void);
void ev_course_dest(void);
int u_get_stage_time_limit(void);
int floor_to_stage_id(int, int, int);
int course_floor_count(int, int);
u32 is_final_floor();
u32 is_bonus_stage(int stageId);
int func_800673BC(void);
int u_is_minigame_unlocked(int);
int u_get_max_continues(void);
int get_num_continues(void);
int func_800676C0(void);
void lbl_80067C20(struct Sprite *sprite);
void func_80067FD0(struct MemcardGameData *data);
void func_8006800C(struct MemcardGameData *data);

#endif
