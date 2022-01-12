struct Struct8003699C_child
{
    u8 filler0[0x38];
    u16 unk38;
    u8 filler3A[2];
    float unk3C;
};

struct Ball_child
{
    struct Struct8003699C_child *unk0;
    u8 filler4[0x10-4];
    s32 unk10;
    u32 unk14;
    u8 filler18[0x24-0x18];
    s32 unk24;
    u8 filler28[0x30-0x28];
    Vec unk30;
    Vec unk3C;
    Vec unk48;
    s32 unk54;
    float unk58;
    u8 filler5C[0x60-0x5C];
    Quaternion unk60;
    u8 filler70[0x74-0x70];
    u32 unk74;
    u8 filler78[0xA0-0x78];
    Vec unkA0;
    float unkAC;
    u8 fillerB0[4];
    u32 unkB4;
    u8 fillerB8[0xC0-0xB8];
    s8 unkC0;
    u8 unkC1;
    s16 unkC2;
    u8 fillerC4[0x1CE - 0xC4];
    s16 unk1CE;  // used in the Ball.unk144 one
};

enum
{
    BALL_FLAG_00 = 1 << 0,
    BALL_FLAG_01 = 1 << 1,
    BALL_FLAG_02 = 1 << 2,
    BALL_FLAG_03 = 1 << 3,
    BALL_FLAG_04 = 1 << 4,
    BALL_FLAG_05 = 1 << 5,
    BALL_FLAG_06 = 1 << 6,
    BALL_FLAG_07 = 1 << 7,
    BALL_FLAG_08 = 1 << 8,
    BALL_FLAG_09 = 1 << 9,
    BALL_FLAG_10 = 1 << 10,
    BALL_FLAG_11 = 1 << 11,
    BALL_FLAG_12 = 1 << 12,
    BALL_FLAG_13 = 1 << 13,
    BALL_FLAG_14 = 1 << 14,
    BALL_FLAG_15 = 1 << 15,
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
    s8 unk2E;  // playerId?
    s8 unk2F;
    Mtx unk30;
    s16 unk60;
    s16 unk62;
    s16 unk64;
    s16 oldModelId;  // id of Naomi model
    /*0x68*/ float currRadius;
    float unk6C;
    /*0x70*/ float restitution;
    /*0x74*/ float modelScale;
    /*0x78*/ s32 bananas;
    u32 unk7C;
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
    struct Ball_child *unkFC;
    u32 unk100;
    Vec unk104;
    float unk110;
    Vec unk114;
    u32 unk120;
    s16 unk124;
    s16 unk126;
    s16 unk128;
    s16 unk12A;
    u8 filler12C[0x130-0x12C];
    float unk130;
    u32 unk134;
    u8 filler138[4];
    s32 unk13C;
    /*0x140*/ float targetRadius;  // radius that the ball grows/shrinks to?
    struct Ball_child *unk144;  // guessing this is the same type as unkFC?
    u8 filler148[0x14A - 0x148];
    /*0x14A*/ u8 colorId;
    u8 unk14B;
    u8 filler14C[2];
    s16 unk14E;
    Vec unk150;
    float unk15C[4];
    u8 filler16C[0x1A4-0x16C];
};

// extern ? lbl_80205E20;
// extern ? lbl_80205E30;
extern struct Ball ballInfo[];
// extern ? lbl_80206B80;
extern s32 lbl_80206BC0[4];
extern s32 lbl_80206BD0[];

void func_8003699C(struct Ball_child *a);
float func_80036CAC(struct Ball_child *a);
void func_80036EB8(struct Ball_child *a);
// ? func_80037098();
void func_8003721C(struct Ball_child *a, float b);
void func_8003765C(struct Ball_child *a);
void func_80037718();
// ? func_80037B1C();
// ? func_80037B20();
void ev_ball_init(void);
// ? func_800380A8();
void ev_ball_main(void);
void func_80038528(struct Ball *);
void ev_ball_dest(void);
void func_80038840(void);
void func_80038AB4(void);
void func_80038DF4(void);
// ? give_bananas();
void func_800390C8(int, Vec *, float);
// ? func_80039410();
void func_800394C4(struct Ball *);
void ball_func_0(struct Ball *);
void ball_func_1(struct Ball *);
void ball_func_ready_main(struct Ball *);
void ball_func_3(struct Ball *);
void ball_func_4(struct Ball *);
void ball_func_5(struct Ball *);
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
void ball_func_21(struct Ball *);
void ball_func_mini(struct Ball *);
void ball_func_27(struct Ball *);
void ball_func_28(struct Ball *);
void handle_ball_linear_kinematics(struct Ball *, struct Struct80039974 *, int);
void handle_ball_linear_kinematics_ignore_collision(struct Ball *, struct Struct80039974 *, int);
void update_ball_ape_transform(struct Ball *, struct Struct80039974 *, int);
// ? func_8003BBF4();
// ? func_8003BD68();
void handle_ball_rotational_kinematics(struct Ball *, struct Struct80039974 *, int);
void func_8003C38C(struct Ball *);
void func_8003C4A0(struct Ball *, int);
void func_8003C550(struct Ball *);
void func_8003CA98(struct Ball *, struct Struct80039974 *b);
void func_8003CB3C(struct Ball *, struct Struct80039974 *b);
void func_8003CB88(struct Ball *);
void func_8003CCB0(void);
void func_8003CDB0(struct Ball *);
void func_8003CDC0(struct Ball *);
void func_8003D3C4(struct Ball *);
void animate_ball_size_change(struct Ball *);
// ? g_ball_draw();
