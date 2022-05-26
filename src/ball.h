#ifndef _SRC_BALL_H_
#define _SRC_BALL_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>

enum
{
    BALL_FLAG_00 = 1 << 0,
    BALL_FLAG_01 = 1 << 1,
    BALL_FLAG_02 = 1 << 2,
    BALL_FLAG_03 = 1 << 3,
    BALL_FLAG_INVISIBLE = 1 << 4,
    BALL_FLAG_05 = 1 << 5,
    BALL_FLAG_06 = 1 << 6,
    BALL_FLAG_07 = 1 << 7,
    BALL_FLAG_08 = 1 << 8,
    BALL_FLAG_09 = 1 << 9,
    BALL_FLAG_10 = 1 << 10,
    BALL_FLAG_11 = 1 << 11,
    BALL_FLAG_GOAL = 1 << 12,  // monkey dances and cannot move horizontally
    BALL_FLAG_13 = 1 << 13,
    BALL_FLAG_14 = 1 << 14,
    BALL_FLAG_TIMEOVER = 1 << 15,  // monkey does a sad animation
    BALL_FLAG_16 = 1 << 16,
    BALL_FLAG_17 = 1 << 17,
    BALL_FLAG_18 = 1 << 18,
    BALL_FLAG_19 = 1 << 19,
    BALL_FLAG_20 = 1 << 20,
    BALL_FLAG_21 = 1 << 21,
    BALL_FLAG_22 = 1 << 22,
    BALL_FLAG_23 = 1 << 23,
    BALL_FLAG_24 = 1 << 24,
    BALL_FLAG_25 = 1 << 25,
    BALL_FLAG_26 = 1 << 26,
    BALL_FLAG_27 = 1 << 27,
    BALL_FLAG_28 = 1 << 28,
    BALL_FLAG_29 = 1 << 29,
    BALL_FLAG_30 = 1 << 30,
    BALL_FLAG_31 = 1 << 31,
};

enum
{
    BALL_STATE_GOAL_INIT = 5,  // ball slows to a stop after entering the goal
    BALL_STATE_GOAL_MAIN = 6,
};

struct Ball_child
{
    u8 filler0[0x14];
    u32 unk14;
    u8 filler18[0x1CE - 0x18];
    s16 unk1CE;
};

struct Ball
{
    u8 unk0;
    s8 unk1;
    /*0x02*/ s8 lives;
    /*0x03*/ s8 state;
    /*0x04*/ Vec pos;
    /*0x10*/ Vec prevPos;
    /*0x1C*/ Vec vel;
    s16 unk28;
    s16 unk2A;
    s16 unk2C;
    /*0x2E*/ s8 playerId;
    /*0x2F*/ s8 rank;  // rank in competition mode
    Mtx unk30;
    s16 unk60;
    s16 unk62;
    s16 unk64;
    /*0x66*/ s16 oldModelId;  // id of Naomi model
    /*0x68*/ float currRadius;
    float accel;
    /*0x70*/ float restitution;
    /*0x74*/ float modelScale;
    /*0x78*/ s32 bananas;
    s32 unk7C;
    s32 unk80;
    Vec unk84;
    s16 unk90;
    s16 unk92;
    /*0x94*/ u32 flags;
    Quaternion unk98;
    Quaternion unkA8;
    Vec unkB8;
    float unkC4;
    Mtx unkC8;
    float unkF8;
    /*0xFC*/ struct Ape *ape;
    u32 unk100;
    Vec unk104;
    float unk110;
    Vec unk114;
    u32 unk120;
    s16 unk124;
    /*0x126*/ s16 winStreak;  // number of consecutive competition mode wins
    s16 unk128;
    s16 unk12A;
    u8 filler12C[0x130-0x12C];
    float unk130;
    u32 unk134;
    s32 unk138;
    s32 unk13C;
    /*0x140*/ float targetRadius;  // radius that the ball grows/shrinks to?
    struct Ball_child *unk144;  // guessing this is the same type as unkFC?
    u8 unk148;
    u8 filler14A[0x14A - 0x149];
    /*0x14A*/ u8 colorId;
    u8 unk14B;
    u8 filler14C[2];
    s16 unk14E;
    Vec unk150;  // positiom ball entered goal?
    float unk15C[4];
    u8 filler16C[0x1A4-0x16C];
};

// runs 'code' for each active ball
#define BALL_FOREACH(code) \
    { \
        struct Ball *ball; \
        struct Ball *ballBackup_; \
        s8 *unk_; \
        int i_; \
        ballBackup_ = currentBallStructPtr; \
        ball = ballInfo; \
        unk_ = spritePoolInfo.unkC; \
        for (i_ = 0; i_ < spritePoolInfo.unk8; i_++, ball++, unk_++) \
        { \
            if (*unk_ == 2) \
            { \
                currentBallStructPtr = ball; \
                { code } \
            } \
        } \
        currentBallStructPtr = ballBackup_; \
    }

// extern ? lbl_80205E20;
// extern ? lbl_80205E30;
extern struct Ball ballInfo[];
// extern ? lbl_80206B80;
extern s32 playerCharacterSelection[4];
extern s32 lbl_80206BD0[];

void func_8003699C(struct Ape *a);
float func_80036CAC(struct Ape *a);
void func_80036EB8(struct Ape *a);
// ? func_80037098();
void g_choose_ape_anim(struct Ape *a, float b);
void func_8003765C(struct Ape *a);
void func_80037718();
// ? func_80037B1C();
void func_80037B20(void);
void ev_ball_init(void);
// ? func_800380A8();
void ev_ball_main(void);
void func_80038528(struct Ball *);
void ev_ball_dest(void);
void ball_draw(void);
void g_ball_shadow_something_1(void);
void g_ball_shadow_something_2(void);
void give_bananas(int bananas);
void func_800390C8(int, Vec *, float);
// ? g_ball_init_1();
void g_ball_init_2(struct Ball *);
void ball_func_0(struct Ball *);
void ball_func_1(struct Ball *);
void ball_func_ready_main(struct Ball *);
void ball_func_3(struct Ball *);
void ball_func_4(struct Ball *);
void ball_func_goal_init(struct Ball *);
void ball_func_goal_main(struct Ball *);
void ball_func_7(struct Ball *);
void ball_func_replay_main(struct Ball *);
void ball_func_11(struct Ball *);
void ball_func_12(struct Ball *);
void ball_func_13(struct Ball *);
void ball_func_14(struct Ball *);
void ball_func_15(struct Ball *);
void ball_func_17(struct Ball *);
void ball_func_16(struct Ball *);
void ball_func_18(struct Ball *);
void ball_func_19(struct Ball *);
void ball_func_20(struct Ball *);
void ball_func_demo_init(struct Ball *);
void ball_func_mini(struct Ball *);
void ball_func_27(struct Ball *);
void ball_func_28(struct Ball *);
void handle_ball_linear_kinematics(struct Ball *, struct PhysicsBall *, int);
void handle_ball_linear_kinematics_ignore_collision(struct Ball *, struct PhysicsBall *, int);
void update_ball_ape_transform(struct Ball *, struct PhysicsBall *, int);
// ? func_8003BBF4();
// ? func_8003BD68();
void handle_ball_rotational_kinematics(struct Ball *, struct PhysicsBall *, int);
void func_8003C38C(struct Ball *);
void func_8003C4A0(struct Ball *, int);
void func_8003C550(struct Ball *);
void init_physball_from_ball(struct Ball *, struct PhysicsBall *b);
void func_8003CB3C(struct Ball *, struct PhysicsBall *b);
void func_8003CB88(struct Ball *);
void func_8003CCB0(void);
void func_8003CDB0(struct Ball *);
void func_8003CDC0(struct Ball *);
void func_8003D3C4(struct Ball *);
void animate_ball_size_change(struct Ball *);
// ? draw_ball_hemispheres();

#endif
