#ifndef _SRC_RECPLAY_H_
#define _SRC_RECPLAY_H_

struct ReplayHeader
{
    u16 flags;  // (1 << 5) = expert, (1 << 6) = master
    u8 stageId;
    u8 difficulty;  // 0 = beginner, 1 = advanced, 2 = expert
    u8 floorNum;
    u8 character;
    char playerName[4];  // player initials?
    float unkC;  // score?
    s32 unk10;
    u8 filler14[4];
};

enum
{
    REPLAY_FLAG_WIN         = 1 << 0,
    REPLAY_FLAG_FALLOUT     = 1 << 1,
    REPLAY_FLAG_TIME_OVER   = 1 << 2,
    REPLAY_FLAG_BONUS_STAGE = 1 << 3,
    REPLAY_FLAG_4           = 1 << 4,
    REPLAY_FLAG_EXTRA       = 1 << 5,
    REPLAY_FLAG_MASTER      = 1 << 6,
    REPLAY_FLAG_7           = 1 << 7,
    REPLAY_FLAG_15          = 1 << 15,
};

struct ReplayBallFrame
{
    Vec pos;  // ball position
    s16 rotX;
    s16 rotY;
    s16 rotZ;
    s16 unk12;
    s16 unk14;
    s16 unk16;
    u32 unk18;
    float unk1C;
};

struct ReplayWorldFrame
{
    s16 rotX;
    s16 rotZ;
};

void recplay_init(void);
void u_load_random_builtin_replay(void);
void func_80048BD4(void);
void ev_recplay_init(void);
void ev_recplay_main(void);
void ev_recplay_dest(void);
int func_80048E78(void);
void func_80048F20(void);
void func_80048F58(int, int);
void func_80048F74(void);
void func_80049158(void);
void func_8004923C(int);
void func_80049268(int);
void func_800492FC(int);
void func_80049368(int);
void func_800493C4(int);
// ? func_80049430();
void func_80049514(int);
float func_8004964C(int);
void func_800496BC(int, struct ReplayBallFrame *, float);
void func_80049C1C(int, struct ReplayWorldFrame *, float);
float func_80049E7C(int, float);
void get_replay_header(int, struct ReplayHeader *);
float func_80049F90(float, int);
// ? func_8004A820();
// ? func_8004A874();
// ? func_8004AA18();
// ? func_8004ABD8();
// ? func_8004ABE4();
// ? func_8004AC68();
// ? func_8004ACF0();
// ? func_8004AD78();
// ? func_8004ADC0();
// ? func_8004AEA0();
// ? dummy_return_true();

void func_8004AFC0(void);
void dummy_8004AFD0(void);
void dummy_8004AFD4(void);
void u_serialize_some_replay_data(void);
void func_8004B334(void);
void func_8004B354(void);
void func_8004B540(void);
void func_8004B550(void);
void func_8004B5AC(void);
void func_8004B60C(void);
void func_8004B65C(void);
void func_8004B694(void);
void set_replay_player_name(char *);
void func_8004B70C(void);
float func_8004B81C(void);
void func_8004B850(float, struct ReplayBallFrame *);
// ? u_deserialize_some_replay_data();
void func_8004BFCC(float, struct ReplayWorldFrame *);
// ? func_8004C180();
float func_8004C1D8(float);
float func_8004C254(float);
void func_8004C28C(struct ReplayHeader *);
// ? compress_rle();
// ? decompress_rle();
u32 u_calc_compressed_replay_size(void);
u32 compress_replay(void *);
int decompress_replay();
int func_8004C70C(void);
void func_8004C754(void);
void func_8004C780(void);
void func_8004C7A8(void);

#endif
