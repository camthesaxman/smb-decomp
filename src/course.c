#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "course.h"
#include "game.h"
#include "info.h"
#include "input.h"
#include "mode.h"
#include "sprite.h"
#include "stage.h"
#include "textbox.h"

// Super Monkey Ball levels are organized into 3 "difficulties", which are
// Beginner, Advanced, and Expert.
// These difficulties are further subdivided into "courses", which are a sequence
// of floors. Each difficulty consists of 2 or 3 courses. All three difficulties
// have a "main" course and an "extra" course. Expert has these two plus an
// additional "master" course.

u32 playPointsReceived;
s8 lbl_802F1FC0;
u32 totalPlayPoints;
u32 lbl_802F1FB8;
u32 lbl_802F1FB4;  // not used
int lbl_802F1FB0;
u32 lbl_802F1FAC;  // not used
u32 lbl_802F1FA8;  // not used
int u_isCompetitionModeCourse;
u32 lbl_802F1FA0;
s32 lbl_802F1F9C;

// Play points per floor in each course

static s16 beginnerMainPlayPoints[] =
{
    21, 22, 23, 24, 50, 26, 27, 28, 29, 100,
};

static s16 advancedMainPlayPoints[] =
{
    22, 23, 24, 25, 51, 27, 28, 29, 30, 101,
    32, 33, 34, 35, 36, 37, 38, 39, 40, 201,
    42, 43, 44, 45, 46, 47, 48, 49, 50, 300,
};

static s16 expertMainPlayPoints[] =
{
    23, 24, 25, 26, 52, 28, 29, 30, 31, 102,
    33, 34, 35, 36, 37, 38, 39, 40, 41, 202,
    43, 44, 45, 46, 47, 48, 49, 50, 51, 302,
    53, 54, 55, 56, 57, 58, 59, 60, 61, 402,
    63, 64, 65, 66, 67, 68, 69, 70, 71, 500,
};

static s16 beginnerExtraPlayPoints[3] =
{
    40, 70, 131,
};

static s16 advancedExtraPlayPoints[] =
{
    50, 80, 110, 140, 351,
};

static s16 expertExtraPlayPoints[] =
{
    75, 90, 105, 120, 135, 150, 165, 180, 195, 601,
};

static s16 masterPlayPoints[] =
{
    250, 260, 270, 280, 290, 300, 310, 320, 330, 700,
};

static s16 *coursePlayPointLists[] =
{
    beginnerMainPlayPoints,
    advancedMainPlayPoints,
    expertMainPlayPoints,
    beginnerExtraPlayPoints,
    advancedExtraPlayPoints,
    expertExtraPlayPoints,
    masterPlayPoints,
    masterPlayPoints,
    masterPlayPoints,
};

s16 u_unkPlayPointList[] =
{
    0x0000, 0x0001,
    0x0001, 0x0002,
    0x0002, 0x0003,
    0x0003, 0x0004,
    0x0004, 0x0005,
    0x0005, 0x0006,
    0x0006, 0x0007,
    0x0007, 0x0008,
    0x0008, 0x0009,
    0x0009, 0x000A,
    0x000A, 0x000B,
    0x000B, 0x000C,
    0x000C, 0x000D,
    0x000D, 0x000E,
    0x000E, 0x000F,
    0x000F, 0x0010,
    0x0010, 0x0011,
    0x0011, 0x0012,
    0x0012, 0x0013,
    0x0013, 0x0014,
    0x0014, 0x0015,
    0x0015, 0x0016,
    0x0016, 0x0017,
    0x0017, 0x0018,
    0x0018, 0x0019,
    0x0019, 0x001A,
    0x001A, 0x001B,
    0x001B, 0x001C,
    0x001C, 0x001D,
    0x001D, 0x001E,
    0x001E, 0x001F,
    0x001F, 0x0020,
    0x0020, 0x0021,
    0x0021, 0x0022,
    0x0022, 0x0023,
};

struct Struct8027CC58_sub
{
    s32 unk0;
    s32 unk4;
};

struct Struct8027CC58
{
    struct Struct8027CC58_sub unk0[4];
    s16 unk20;
    s16 unk22;
};

static struct Struct8027CC58 lbl_8027CC58[4][3];
static u32 lbl_8027CE08[4];
struct Struct8027CE18 lbl_8027CE18;

static int difficulty_to_course_id(int, u32);
static void func_80067508(int, int, u32);
static void func_800676E8(void);
static void func_80067808(void);
static void func_80067AD4(void);

void func_80065C58(void)
{
    int i;
    int count;
    u8 unused[4];

    lbl_8027CE08[0] = 0;
    lbl_8027CE08[1] = 0;
    lbl_8027CE08[2] = 0;
    lbl_8027CE08[3] = 0;
    totalPlayPoints = 0;
    lbl_802F1FB8 = 0;

    count = 0;
    lbl_8027CE18.unk0 = 0;
    for (i = 0; i < 10; i++, count++)
        lbl_8027CE18.unk0 += beginnerMainPlayPoints[i] + u_unkPlayPointList[i];
    for (i = 0; i < 3; i++, count++)
        lbl_8027CE18.unk0 += beginnerExtraPlayPoints[i] + u_unkPlayPointList[count];

    count = 0;
    lbl_8027CE18.unk4 = 0;
    for (i = 0; i < 30; i++, count++)
        lbl_8027CE18.unk4 += advancedMainPlayPoints[i] + u_unkPlayPointList[i];
    for (i = 0; i < 5; i++, count++)
        lbl_8027CE18.unk4 += advancedExtraPlayPoints[i] + u_unkPlayPointList[count];

    count = 0;
    lbl_8027CE18.unk8 = 0;
    for (i = 0; i < 50; i++, count++)
        lbl_8027CE18.unk8 += expertMainPlayPoints[i] + u_unkPlayPointList[i];
    for (i = 0; i < 10; i++, count++)
        lbl_8027CE18.unk8 += expertExtraPlayPoints[i] + u_unkPlayPointList[count];
    for (i = 0; i < 10; i++, count++)
        lbl_8027CE18.unk8 += masterPlayPoints[i] + u_unkPlayPointList[count];
}

void func_80066294(void)
{
    playPointsReceived = 0;
    lbl_802F1FC0 = 0;
    if (func_800676C0() != 0)
        totalPlayPoints = 0;
}

void func_800662D4(void)
{
    lbl_802F1FC0 = 0;
}

void func_800662E0(void)
{
    totalPlayPoints = MIN(totalPlayPoints + playPointsReceived, 9999);
    if (func_800676C0() != 0 && totalPlayPoints > lbl_802F1FB8)
        lbl_802F1FB8 = totalPlayPoints;
}

#pragma force_active on
void func_8006633C(void)
{
    totalPlayPoints -= 2500;
}
#pragma force_active reset

void func_8006634C(void)
{
    int temp_r4;
    int var_r4;

    if (!u_is_minigame_unlocked(6) || !u_is_minigame_unlocked(7) || !u_is_minigame_unlocked(8))
        return;
    if (func_800676C0() == 0 && totalPlayPoints >= 2500)
    {
        var_r4 = 0;
        while (totalPlayPoints >= 2500)
        {
            func_8006633C();
            var_r4++;
        }
        temp_r4 = var_r4 + ((lbl_802F1C0D >> 4) & 7);
        if (temp_r4 >= 5)
        {
            lbl_802F1C0D |= 8;
            lbl_802F1C0D &= ~0x70;
            lbl_802F1C0D |= 0x50;
            totalPlayPoints = 0;
        }
        else
        {
            lbl_802F1C0D &= ~0x70;
            lbl_802F1C0D |= temp_r4 * 0x10;
        }
    }
}

enum
{
    CMD_IF = 0,
    CMD_THEN = 1,
    CMD_FLOOR = 2,
    CMD_COURSE_END = 3,
};

enum  // CMD_IF conditions
{
    IF_FLOOR_CLEAR = 0,
    IF_GOAL_TYPE = 2,
};

enum  // CMD_THEN actions
{
    THEN_JUMP_FLOOR = 0,
};

enum  // CMD_FLOOR value types
{
    FLOOR_STAGE_ID = 0,
    FLOOR_TIME = 1,
};

struct CourseCommand
{
    u8 opcode;
    u8 type;
    s32 value;
    u8 filler8[0x1C-0x8];  // unused filler?
};

static u32 course_if_cleared_floor(struct CourseCommand *);
static u32 course_if_time_elapsed(struct CourseCommand *);
static u32 course_if_goal_type(struct CourseCommand *);
static void course_then_jump_floor(struct CourseCommand *);
static void course_sub_give_play_points(struct CourseCommand *);
static void course_sub_give_play_points_dupe(struct CourseCommand *);

static u32 (*courseIfFuncs[])(struct CourseCommand *) =
{
    course_if_cleared_floor,
    course_if_time_elapsed,
    course_if_goal_type,
    NULL,
};

static void (*courseThenFuncs[])(struct CourseCommand *) =
{
    course_then_jump_floor,
    course_sub_give_play_points,
    course_sub_give_play_points_dupe,
    NULL,
};

static struct CourseCommand s_beginnerMainScript[] =
{
    { CMD_FLOOR, FLOOR_STAGE_ID, ST_001_PLAIN },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_002_DIAMOND },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'B' },
    {    CMD_THEN, THEN_JUMP_FLOOR, 1 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'G' },
    {    CMD_THEN, THEN_JUMP_FLOOR, 3 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_003_HAIRPIN },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_004_WIDE_BRIDGE },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_091_BONUS_BASIC },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_005_SLOPES },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_006_STEPS },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_007_BLOCKS },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_008_JUMP_SINGLE },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_009_EXAM_A },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, 2, 0 },

    { CMD_COURSE_END },
};

static struct CourseCommand s_advancedMainScript[] =
{
    { CMD_FLOOR, FLOOR_STAGE_ID, ST_011_BUMP },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_012_WALKING },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_013_REPULSE },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_014_NARROW_BRIDGE },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_091_BONUS_BASIC },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_015_BREAK },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'B' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 1 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'G' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 4 },

    { CMD_FLOOR, FLOOR_STAGE_ID,   ST_016_CURVES },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_017_DOWNHILL },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID,   ST_018_BLOCKS_SLIM },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_092_BONUS_WAVE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_021_CHOICE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    {   CMD_IF, IF_FLOOR_CLEAR },
    {     CMD_IF, IF_GOAL_TYPE, 'B' },
    {       CMD_THEN, THEN_JUMP_FLOOR, 1 },
    {   CMD_IF, IF_FLOOR_CLEAR },
    {     CMD_IF, IF_GOAL_TYPE, 'G' },
    {       CMD_THEN, THEN_JUMP_FLOOR, 3 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_022_BOWL },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_023_JUMPIES },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_024_STOPPERS },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_025_FLOOR_BENT },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_026_CONVEYOR },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_027_EXAM_B },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_028_CHASER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'B' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 1 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'G' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 2 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'R' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 7 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_029_JUMP_DOUBLE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_093_BONUS_GRID },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_031_MIDDLE_JAM },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_032_ANTLION },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_033_COLLAPSE },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_034_SWING_BAR },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_035_LABYRINTH },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'B' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 1 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'G' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 3 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_036_SPIRAL },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_037_WAVY_JUMP },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_038_SPIKY },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_039_UNREST },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_040_POLAR },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, 2,    0 },

    { CMD_COURSE_END },
};

static struct CourseCommand s_expertMainScript[] =
{
    { CMD_FLOOR, FLOOR_STAGE_ID, ST_041_RUIN },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_042_BRANCH },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'B' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 1 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'R' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 3 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_043_OVERTURN },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'B' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 1 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'G' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 2 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_044_EXCURSION },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_091_BONUS_BASIC },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_045_DODECAGON },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_046_EXAM_C },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_047_SKELETON },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_048_TRACKS },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_092_BONUS_WAVE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_051_DOWNHILL_HARD },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_052_GEARS },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_053_DESTRUCTION },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_054_INVASION },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_055_DIVING },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_056_FLOOR_SLANT },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_057_TRAM },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_058_SWING_BAR_LONG },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_059_PAPERWORK },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_093_BONUS_GRID },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_061_TWIN_ATTACKER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_062_SEGA_LOGO },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_063_SNAKE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_064_WIND },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_065_WINDY_SLIDE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_066_FALL_DOWN },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_067_TWIN_CROSS },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_068_SPIRAL_HARD },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_069_CONVEYOR_PARTS },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_094_BONUS_BUMPY },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_071_GAPS },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_072_CURVATURE },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_073_ANT_LION_SUPER },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_074_DRUM },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_075_TWIST_AND_SPIN },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_076_SPEEDY_JAM },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_077_QUAKE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_078_CASSIOPEIA },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_079_PIRATES },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_095_BONUS_HUNTING },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_081_BOWL_OPEN },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_082_CHECKER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'B' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 1 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'G' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 2 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'R' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 3 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_083_CARPET },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_084_RIDGE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_085_MIXER },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_086_RINGS },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'B' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 1 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_IF, IF_GOAL_TYPE, 'G' },
    {     CMD_THEN, THEN_JUMP_FLOOR, 2 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_087_STAIRS },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_088_CLOVER },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_089_COFFEE_CUP },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_090_METAMORPHASIS },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, 2,    0 },

    { CMD_COURSE_END },
};

static struct CourseCommand s_beginnerExtraScript[] =
{
    { CMD_FLOOR, FLOOR_STAGE_ID, ST_101_BLUR_BRIDGE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_102_HITTER },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_103_AV_LOGO },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, 2,    0 },

    { CMD_COURSE_END },
};

static struct CourseCommand s_advancedExtraScript[] =
{
    { CMD_FLOOR, FLOOR_STAGE_ID, ST_101_BLUR_BRIDGE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_104_HARD_HITTER },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_105_PUZZLE },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_103_AV_LOGO },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_106_POLAR_LARGE },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, 2,    0 },

    { CMD_COURSE_END },
};

static struct CourseCommand s_expertExtraScript[] =
{
    { CMD_FLOOR, FLOOR_STAGE_ID, ST_101_BLUR_BRIDGE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_107_BREATHE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_104_HARD_HITTER },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_108_FERRIS_WHEEL },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_109_FACTORY },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_110_CURL_PIPE },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_111_MAGIC_HAND },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_103_AV_LOGO },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_112_SANCTUARY },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_113_DAA_LOO_MAA },
    { CMD_FLOOR, FLOOR_TIME,     1800 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, 2,    0 },

    { CMD_COURSE_END },
};

static struct CourseCommand s_masterScript[] =
{
    { CMD_FLOOR, FLOOR_STAGE_ID, ST_121_WAVE_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_122_FAN_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_123_STAMINA_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_124_SPRING_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_125_DANCE_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_126_ROLL_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_127_EDGE_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_128_DODGE_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_129_BRIDGE_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, ST_130_MONKEY_MASTER },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, 2,    0 },

    { CMD_COURSE_END },
};

static struct CourseCommand lbl_801BD86C[] =
{
    { CMD_FLOOR, FLOOR_STAGE_ID, 0 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, 0 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, 0 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, 0 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, THEN_JUMP_FLOOR, 1 },

    { CMD_FLOOR, FLOOR_STAGE_ID, 0 },
    { CMD_IF, IF_FLOOR_CLEAR },
    {   CMD_THEN, 2,    0 },

    { CMD_COURSE_END },
};

static struct CourseCommand *s_courseScripts[] =
{
    s_beginnerMainScript,
    s_advancedMainScript,
    s_expertMainScript,
    s_beginnerExtraScript,
    s_advancedExtraScript,
    s_expertExtraScript,
    s_masterScript,
    s_masterScript,
    s_masterScript,
    lbl_801BD86C,
    lbl_801BD86C,
    lbl_801BD86C,
};

struct CourseCommand *courseScriptPtr;

int u_get_max_continues(void);

static void course_end_textbox_callback(struct TextBox *tbox)
{
    if (tbox->unk19 == 0 && tbox->state == 20 && tbox->timer == tbox->timerMax - 1)
    {
        func_8006634C();
        return;
    }
    if (lbl_802F1FA0 == 0)
    {
        if (func_800676C0() != 0)
        {
            textbox_add_textf(1, "a/Play Point record for this time : ft/%4d", totalPlayPoints);
            textbox_add_textf(1, "a/Highest Play Point record c/0xffffff/a/timec/0x000000/ : ft/%4d", lbl_802F1FB8);
            lbl_802F1FA0++;
        }
        else if (playPointsReceived == 0)
        {
            textbox_add_text(1, "a/You didn't get any play points.");
            textbox_add_textf(1, "z9/a/You now have a total of %d Play Points.", totalPlayPoints);
            lbl_802F1FA0++;
        }
        else
        {
            textbox_add_textf(1, "a/You received %d Play Points.", playPointsReceived);
            textbox_add_textf(1, "z9/a/You now have a total of %d Play Points.", totalPlayPoints);
            lbl_802F1FA0++;
        }
        return;
    }
    if (func_800676C0() == 0 && totalPlayPoints >= 2500)
    {
        if (++lbl_802F1FA0 == 480)
        {
            if (tbox->unk19 == 0)
                lbl_802F1FA0 = 0;
        }
        else
        {
            if (tbox->unk18 == 0 && (u_unkInputArr1[2] & 0x100)
             && lbl_802F1FA0 > 60 && lbl_802F1FA0 < 180)
            {
                if (u_is_minigame_unlocked(6) == 0 || u_is_minigame_unlocked(7) == 0 || u_is_minigame_unlocked(8) == 0)
                    lbl_802F1FA0 = 180;
                else if (tbox->unk19 != 0)
                    lbl_802F1FA0 = 240;
                else
                    lbl_802F1FA0 = 180;
            }
            if (lbl_802F1FA0 == 240)
                tbox->unk18 = 1;
            if (lbl_802F1FA0 == 180)
            {
                if (u_is_minigame_unlocked(6) == 0 || u_is_minigame_unlocked(7) == 0 || u_is_minigame_unlocked(8) == 0)
                {
                    textbox_add_text(1, "b/c/0xff8000/a/b/You can unlock a Mini Game!");
                    textbox_add_text(1, "a/Unlock a Mini Game by selecting it!");
                    tbox->unk19 = 0;
                }
                else if (tbox->unk19 == 0)
                {
                    int var_r30;
                    if (tbox->unk17 == 0)
                    {
                        func_8002B5C8(0x16D);
                        tbox->unk17 = 1;
                    }
                    var_r30 = totalPlayPoints / 2500;
                    if (var_r30 + u_get_max_continues() > 9)
                    {
                        var_r30 = MIN(var_r30, 10 - u_get_max_continues());
                        textbox_add_text(1, "b/c/0xff8000/a/b/You can get unlimited continues!");
                        textbox_add_textf(1, "a/You have used %d Play Points.", var_r30 * 2500);
                    }
                    else
                    {
                        textbox_add_textf(1, "b/c/0xff8000/a/b/Your number of continues has been increased to %d !", var_r30 + u_get_max_continues());
                        textbox_add_textf(1, "a/You have used %d Play Points.", var_r30 * 2500);
                    }
                }
            }
        }
        return;
    }

    if (++lbl_802F1FA0 >= 60)
        tbox->unk18 = 1;
}

void show_course_end_textbox(int arg0, s16 x, s16 y)
{
    struct TextBox tbox;

    memset(&tbox, 0, sizeof(tbox));
    tbox.style = 14;
    tbox.x = x;
    tbox.y = y;
    tbox.numColumns = 0;
    tbox.numRows = 2;
    tbox.unk17 = 0;
    tbox.unk18 = 0;
    tbox.unk19 = arg0;
    tbox.callback = course_end_textbox_callback;
    lbl_802F1FA0 = 0;
    if (tbox.unk19 == 2)
    {
        lbl_802F1FA0 = 0xB3;
        tbox.unk19 = 0;
        tbox.numColumns = 0x18;
        tbox.unk10 = tbox.numColumns * 24;
    }
    textbox_set_properties(1, 1, &tbox);
}

int func_80066868(void)
{
    if (textBoxes[1].state == 0)
        return FALSE;
    if (textBoxes[1].unk18 == 0)
        return FALSE;
    return TRUE;
}

void func_800668A0(void)
{
    int var = difficulty_to_course_id(modeCtrl.difficulty, modeCtrl.courseFlags);

    courseScriptPtr = s_courseScripts[var];
    infoWork.unk2E = courseScriptPtr->value;
    courseScriptPtr++;
    func_800676E8();
}

void ev_course_init(void)
{
    lbl_802F1F9C = -1;
    func_80067808();
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
        func_80067508(modeCtrl.difficulty, infoWork.unk20, modeCtrl.courseFlags);
}

void ev_course_main(void)
{
    struct CourseCommand *cmd;
    int var_r28_2;
    int prevOpcode;
    u32 condResult;
    u32 var_r4_2;

    if (gamePauseStatus & 0xA)
        return;
    prevOpcode = -1;
    condResult = 0;
    for (cmd = courseScriptPtr; cmd->opcode != CMD_COURSE_END; cmd++)
    {
        // Stop processing commands if we've reached the next floor's commands
        if (cmd->opcode == CMD_FLOOR && cmd->type == FLOOR_STAGE_ID)
            return;

        // Handle conditional script logic
        switch (cmd->opcode)
        {
        case CMD_IF:
            if (prevOpcode != CMD_IF)
                condResult = courseIfFuncs[cmd->type](cmd);
            else if (condResult != 0)  // nest conditionals by logically ANDing the result with the previous
                condResult &= courseIfFuncs[cmd->type](cmd);
            break;
        case CMD_THEN:
            if (condResult)  // if previous condition was nonzero, execute the result
                courseThenFuncs[cmd->type](cmd);
            break;
        }

        if (lbl_802F1F9C != -1)
        {
            var_r4_2 = FALSE;
            var_r28_2 = 0;
            if (infoWork.unk22 != 1)
                lbl_802F1F9C = infoWork.unk22;
            while (cmd->opcode != CMD_COURSE_END)
            {
                if (cmd->opcode == CMD_FLOOR && cmd->type == FLOOR_STAGE_ID)
                {
                    var_r28_2++;
                    if (var_r28_2 == lbl_802F1F9C)
                    {
                        var_r4_2 = TRUE;
                        break;
                    }
                }
                cmd++;
            }
            if (var_r4_2)
                courseScriptPtr = cmd + 1;
            else
            {
                course_sub_give_play_points_dupe(cmd);
                infoWork.unk20 += 10;
                lbl_802F1F9C = -1;
                return;
            }
            if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
            {
                lbl_802F1FC0++;
                if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_PNT_X10))
                {
                    playPointsReceived += coursePlayPointLists[difficulty_to_course_id(modeCtrl.difficulty, modeCtrl.courseFlags)][infoWork.unk20 - 1] * 10;
                    playPointsReceived += u_unkPlayPointList[lbl_802F1FC0 - 1] * 10;
                }
                else
                {
                    playPointsReceived += coursePlayPointLists[difficulty_to_course_id(modeCtrl.difficulty, modeCtrl.courseFlags)][infoWork.unk20 - 1];
                    playPointsReceived += u_unkPlayPointList[lbl_802F1FC0 - 1];
                }
            }
            infoWork.unk2E = cmd->value;
            func_80067AD4();
            infoWork.unk22 = var_r28_2;
            infoWork.unk20 += infoWork.unk22;
            lbl_802F1F9C = -1;
            return;
        }
        prevOpcode = cmd->opcode;
    }
}

void ev_course_dest(void) {}

static u32 course_if_cleared_floor(struct CourseCommand *cmd)
{
    if ((infoWork.flags & INFO_FLAG_GOAL) || (infoWork.flags & INFO_FLAG_09))
        return TRUE;
    // In bonus stages or competition mode, falling out or timing over counts as completing the stage
    if (((infoWork.flags & INFO_FLAG_BONUS_STAGE) || modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
     && ((infoWork.flags & INFO_FLAG_TIMEOVER) || (infoWork.flags & INFO_FLAG_FALLOUT)))
        return TRUE;
    return FALSE;
}

static u32 course_if_goal_type(struct CourseCommand *cmd)
{
    int i;
    struct StageGoal *goal = decodedStageLzPtr->animGroups[0].goals;

    for (i = 0; i < 3; i++, goal++)
    {
        if (i == infoWork.goalEntered)
            break;
    }
    if (goal->type == (s8)cmd->value)
        return TRUE;
    else
        return FALSE;
}

static u32 course_if_time_elapsed(struct CourseCommand *cmd)
{
    if (infoWork.timerCurr >= cmd->value)
        return 1;
    else
        return 0;
}

static void course_then_jump_floor(struct CourseCommand *cmd)
{
    lbl_802F1F9C = cmd->value;
}

static void course_sub_give_play_points(struct CourseCommand *unused)
{
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
    {
        lbl_802F1FC0++;
        if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_PNT_X10))
        {
            playPointsReceived += coursePlayPointLists[difficulty_to_course_id(modeCtrl.difficulty, modeCtrl.courseFlags)][infoWork.unk20 - 1] * 10;
            playPointsReceived += u_unkPlayPointList[lbl_802F1FC0 - 1] * 10;
        }
        else
        {
            playPointsReceived += coursePlayPointLists[difficulty_to_course_id(modeCtrl.difficulty, modeCtrl.courseFlags)][infoWork.unk20 - 1];
            playPointsReceived += u_unkPlayPointList[lbl_802F1FC0 - 1];
        }
    }
    infoWork.unk2E = -1;
}

// duplicate of course_sub_give_play_points
static void course_sub_give_play_points_dupe(struct CourseCommand *unused)
{
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
    {
        lbl_802F1FC0++;
        if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_PNT_X10))
        {
            playPointsReceived += coursePlayPointLists[difficulty_to_course_id(modeCtrl.difficulty, modeCtrl.courseFlags)][infoWork.unk20 - 1] * 10;
            playPointsReceived += u_unkPlayPointList[lbl_802F1FC0 - 1] * 10;
        }
        else
        {
            playPointsReceived += coursePlayPointLists[difficulty_to_course_id(modeCtrl.difficulty, modeCtrl.courseFlags)][infoWork.unk20 - 1];
            playPointsReceived += u_unkPlayPointList[lbl_802F1FC0 - 1];
        }
    }
    infoWork.unk2E = -1;
}

struct Struct8027CE24
{
    s16 unk0;
    s16 unk2;
    u32 unk4;
};  // size = 8

struct Struct8027CE24 lbl_8027CE24[6];

int u_get_stage_time_limit(void)
{
    s32 temp_r3_2;
    s32 temp_r5;
    s32 var_r6;
    s32 floorCnt;
    u8 temp_r0;
    struct CourseCommand *var_r3;

    if (u_isCompetitionModeCourse != 0)
    {
        floorCnt = 0;
        var_r6 = 0;
        if (lbl_8027CE24[infoWork.unk20 - 1].unk4 & 8)
            var_r6 = 3;
        if (lbl_8027CE24[infoWork.unk20 - 1].unk4 & 0x10)
            var_r6 = 6;
        var_r3 = s_courseScripts[var_r6 + lbl_8027CE24[infoWork.unk20 - 1].unk2];
        temp_r5 = lbl_8027CE24[infoWork.unk20 - 1].unk0;
        while (var_r3->opcode != CMD_COURSE_END)
        {
            if (var_r3->opcode == CMD_FLOOR && var_r3->type == FLOOR_STAGE_ID)
            {
                floorCnt++;
                if (floorCnt == temp_r5)
                {
                    if (var_r3[1].opcode == CMD_FLOOR && var_r3[1].type == FLOOR_TIME)
                        return var_r3[1].value;
                    break;
                }
            }
            var_r3++;
        }
        return 60 * 60;
    }
    if (courseScriptPtr->opcode == CMD_FLOOR && courseScriptPtr->type == FLOOR_TIME)
        return courseScriptPtr->value;
    return 60 * 60;
}

int floor_num_to_stage_id(int courseId, int floorNum, int flags)
{
    int stageId;
    int floorCnt;

    courseScriptPtr = &s_courseScripts[difficulty_to_course_id(courseId, flags)][0];

    // get the nth command with unk0=2 and unk1=0?
    floorCnt = 1;
    while (floorCnt <= floorNum && courseScriptPtr->opcode != CMD_COURSE_END)
    {
        if (courseScriptPtr->opcode == CMD_FLOOR && courseScriptPtr->type == FLOOR_STAGE_ID)
        {
            if (floorCnt == floorNum)
                break;
            floorCnt++;
        }
        courseScriptPtr++;
    }

    stageId = courseScriptPtr->value;
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        if (stageId == ST_126_ROLL_MASTER)
            stageId = ST_116_ALTERNATE_ROLL_MASTER;
        if (stageId == ST_127_EDGE_MASTER)
            stageId = ST_115_ALTERNATE_EDGE_MASTER;
    }
    courseScriptPtr++;
    return stageId;
}

int difficulty_to_course_id(int difficulty, u32 flags)
{
    int index = 0;

    if (flags & COURSE_FLAG_EXTRA)
        index = 3;
    if (flags & COURSE_FLAG_MASTER)
        index = 6;
    if (u_isCompetitionModeCourse != 0)
        index = 9;
    index += difficulty;
    return index;
}

static const int s_bonusStages[] =
{
    ST_091_BONUS_BASIC,
    ST_092_BONUS_WAVE,
    ST_093_BONUS_GRID,
    ST_094_BONUS_BUMPY,
    ST_095_BONUS_HUNTING,
    ST_134_RACE_ICE,  //! How is this a bonus stage?
    0,
};

static const int s_courseFloorCounts[] =
{
    10,  // beginner
    30,  // advanced
    50,  // expert
    3,   // beginner ex
    5,   // advanced ex
    10,  // expert ex
    10,
    10,
    10,  // master
    0,
    0,
    0,
    0,
};

#pragma force_active on
int course_floor_count(int difficulty, int flags)
{
    if (u_isCompetitionModeCourse != 0)
        return lbl_802F1FB0;
    return s_courseFloorCounts[difficulty_to_course_id(difficulty, flags)];
}
#pragma force_active reset

u32 is_final_floor(int difficulty, int floorNum, int flags)
{
    int final = course_floor_count(difficulty, flags);

    if (floorNum == final)
        return TRUE;
    else
        return FALSE;
}

u32 is_bonus_stage(int stageId)
{
    int isBonus = FALSE;
    const volatile int *id;

    for (id = s_bonusStages; *id != 0; id++)
    {
        if (*id == stageId)
        {
            isBonus = TRUE;
            break;
        }
    }
    return isBonus;
}

#pragma force_active on
void func_80067310(void)
{
    int i;

    for (i = 0; i < lbl_802F1FB0; i++)
    {
        lbl_801BD86C[i * 3].value = floor_num_to_stage_id(lbl_8027CE24[i].unk2, lbl_8027CE24[i].unk0, lbl_8027CE24[i].unk4);
        lbl_801BD86C[i * 3 + 2].type = FLOOR_STAGE_ID;
    }
    lbl_801BD86C[(lbl_802F1FB0 - 1) * 3 + 2].type = 2;
}
#pragma force_active reset

int func_800673BC(void)
{
    struct CourseCommand *r3 = courseScriptPtr;

    while (r3->opcode != CMD_COURSE_END)
    {
        //! why the nested while loop?
        while (r3->opcode != CMD_COURSE_END)
        {
            if (r3->opcode == CMD_FLOOR && r3->type == FLOOR_STAGE_ID)
                return r3->value;
            r3++;
        }
    }
    return -1;
}

#pragma force_active on
int func_80067408(int arg0, int arg1, u32 arg2)
{
    int var_r7 = 0;

    if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_STG_ALL))
        return 1;

    if (arg2 & 0x10)
        var_r7 = 0x6E;
    else if (arg2 & 8)
    {
        switch (arg0)
        {
        case 0:
            var_r7 = 0x5A;
            break;
        case 1:
            var_r7 = 0x5F;
            break;
        case 2:
            var_r7 = 0x64;
            break;
        }
    }
    else
    {
        switch (arg0)
        {
        case 0:
            var_r7 = 0;
            break;
        case 1:
            var_r7 = 0xA;
            break;
        case 2:
            var_r7 = 0x28;
            break;
        }
    }
    var_r7 += arg1 - 1;
    if ((1 << (var_r7 % 32)) & lbl_8027CE08[var_r7 / 32])
        return 1;
    else
        return 0;
}
#pragma force_active reset

static void func_80067508(int arg0, int arg1, u32 arg2)
{
    int var_r7 = 0;

    if (arg2 & 0x10)
        var_r7 = 0x6E;
    else if (arg2 & 8)
    {
        switch (arg0)
        {
        case 0:
            var_r7 = 0x5A;
            break;
        case 1:
            var_r7 = 0x5F;
            break;
        case 2:
            var_r7 = 0x64;
            break;
        }
    }
    else
    {
        switch (arg0)
        {
        case 0:
            var_r7 = 0;
            break;
        case 1:
            var_r7 = 0xA;
            break;
        case 2:
            var_r7 = 0x28;
            break;
        }
    }
    var_r7 += arg1 - 1;
    lbl_8027CE08[var_r7 / 32] |= (1 << (var_r7 % 32));
}

int u_is_minigame_unlocked(int minigame)
{
    int isUnlocked = FALSE;

    if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_STG_ALL))
        return TRUE;

    switch (minigame)
    {
    case 6:
        if (lbl_802F1C0D & 1)
            isUnlocked = TRUE;
        break;
    case 7:
        if (lbl_802F1C0D & 2)
            isUnlocked = TRUE;
        break;
    case 8:
        if (lbl_802F1C0D & 4)
            isUnlocked = TRUE;
        break;
    }
    return isUnlocked;
}

int u_get_max_continues(void)
{
    return (lbl_802F1C0D >> 4) + 5;
}

int get_num_continues(void)
{
    if (func_800676C0() != 0)
        return 10;
    return u_get_max_continues() - infoWork.continuesUsed;
}

int func_800676C0(void)
{
    if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_STG_ALL))
        return 1;
    return lbl_802F1C0D & 8;
}

static void func_800676E8(void)
{
    int i, j;

    for (i = 0; i < 4; i++)
    {
        struct Struct8027CC58 *r4 = lbl_8027CC58[i];

        for (j = 0; j < 3; j++, r4++)
        {
            r4->unk0[0].unk0 = 0;
            r4->unk0[0].unk4 = -1;
            r4->unk0[1].unk0 = 0;
            r4->unk0[1].unk4 = -1;
            r4->unk0[2].unk0 = 0;
            r4->unk0[2].unk4 = -1;
            r4->unk0[3].unk0 = 0;
            r4->unk0[3].unk4 = -1;
            r4->unk20 = -1;
            r4->unk22 = -1;
        }
    }
}

static void inline1(void)
{
    int temp_r27_3;
    int var_r3_3;
    struct Struct8027CC58 *temp_r3_3;

    temp_r27_3 = modeCtrl.currPlayer;
    if (modeCtrl.gameType == 0)
        var_r3_3 = get_next_player();
    else
        var_r3_3 = temp_r27_3;
    temp_r3_3 = lbl_8027CC58[var_r3_3];
    if (temp_r27_3 == var_r3_3)
        infoWork.unk32 = lbl_8027CC58[temp_r27_3][0].unk0[1].unk4;
    else if (temp_r3_3->unk22 == -1)
        infoWork.unk32 = temp_r3_3->unk0[0].unk4;
    else
        infoWork.unk32 = temp_r3_3->unk0[temp_r3_3->unk22 + 1].unk4;
}

static inline void inline3(struct Struct8027CC58 *temp_r28)
{
    struct CourseCommand *var_r8;
    int i;
    struct Struct8027CC58_sub *var_r6;
    int var_r5;
    int var_r4;
    struct CourseCommand *var_r3_2;

    var_r6 = temp_r28->unk0;
    var_r8 = courseScriptPtr;
    for (i = 0; i < 3 && var_r8->opcode != CMD_COURSE_END; var_r8++)
    {
        if (var_r8->opcode == CMD_FLOOR && var_r8->type == FLOOR_STAGE_ID)
            break;
        if (var_r8->opcode == CMD_THEN)
        {
            switch (var_r8->type)
            {
            case 0:
            default:

                var_r6[1].unk0 = infoWork.unk20 + var_r8->value;
                var_r5 = var_r8->value;
                var_r3_2 = courseScriptPtr;
                var_r4 = -1;
                while (var_r3_2->opcode != CMD_COURSE_END)
                {
                    if (var_r3_2->opcode == CMD_FLOOR && var_r3_2->type == FLOOR_STAGE_ID
                     && --var_r5 <= 0)
                    {
                        var_r4 = var_r3_2->value;
                        break;
                    }
                    var_r3_2++;
                }
                var_r6[1].unk4 = var_r4;
                break;
            case 1:
            case 2:
                var_r6[1].unk0 = -1;
                var_r6[1].unk4 = -1;
                break;
            }
            var_r6++;
            i++;
        }
    }
    temp_r28->unk20 = i;
    temp_r28->unk22 = -1;

}

static void func_80067808(void)
{
    int temp_r27_2;
    struct Struct8027CC58 *temp_r28;
    int i;
    struct Struct8027CC58 *var_r25;
    u8 unused[0x18];

    temp_r27_2 = modeCtrl.currPlayer;
    if (modeCtrl.gameType == 0)
        get_next_player();  // return value not used

    if (infoWork.unk20 == lbl_8027CC58[temp_r27_2][0].unk0[0].unk0)
    {
        inline1();
        return;
    }

    temp_r28 = lbl_8027CC58[temp_r27_2];

    for (i = 1, var_r25 = &temp_r28[1]; i >= 0; i--, var_r25--)
    {
        if (var_r25->unk0[0].unk0 != 0)
            memcpy(&var_r25[1], var_r25, sizeof(var_r25[1]));
    }


    temp_r28->unk0[0].unk0 = infoWork.unk20;
    temp_r28->unk0[0].unk4 = currStageId;
    temp_r28->unk0[1].unk0 = 0;
    temp_r28->unk0[1].unk4 = -1;
    temp_r28->unk0[2].unk0 = 0;
    temp_r28->unk0[2].unk4 = -1;
    temp_r28->unk0[3].unk0 = 0;
    temp_r28->unk0[3].unk4 = -1;

    inline3(temp_r28);

    inline1();
}

void func_80067AD4(void)
{
    struct Struct8027CC58 *temp_r8 = lbl_8027CC58[modeCtrl.currPlayer];
    int i;

    for (i = 0; i < 3; i++)
    {
        int var = temp_r8->unk0[i+1].unk4;

        if (var == infoWork.unk2E || infoWork.unk2E == -1)
        {
            temp_r8->unk22 = i;
            if (infoWork.unk2E == -1)
                temp_r8->unk0[temp_r8->unk22 + 1].unk4 = -1;
            break;
        }
    }

    inline1();
}

void lbl_80067C20(struct Sprite *sprite)
{
    struct Struct8027CC58_sub *var_r31;
    int var_r0;
    int var_r4;
    int j;
    int i;
    struct Struct8027CC58 *var_r27;
    int x;
    int y;

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    set_text_scale(sprite->scaleX, sprite->scaleY);
    x = sprite->x;
    y = sprite->y;

    var_r27 = &lbl_8027CC58[modeCtrl.currPlayer][2];
    for (i = 2; i >= 0; i--, var_r27--)
    {
        if (var_r27->unk0[0].unk0 != 0)
        {
            if (i == 0)
                set_text_mul_color(RGBA(0, 255, 0, 0));
            set_text_pos(x, y);
            func_80072AC0("%d(%03d)", var_r27->unk0[0].unk0, var_r27->unk0[0].unk4);
            if (i == 0)
                set_text_mul_color(RGBA(255, 255, 255, 0));
            var_r0 = var_r27->unk0[0].unk0;
            var_r4 = 6;
            while (var_r0 != 0)
            {
                var_r0 /= 10;
                if (var_r0 > 0)
                    var_r4++;
            }

            for (j = 0; j < 3; j++)
            {
                var_r31 = var_r27->unk0 + j;
                if (i > 0 && j > 0)
                    break;
                if (var_r31[1].unk0 == 0)
                    break;

                set_text_pos(
                    x + sprite->scaleX * (var_r4 * 8),
                    y + sprite->scaleY * (j * 8));
                if (i > 0)
                    u_draw_text("\x16>");
                else if ((var_r27->unk20 > 1) && (j == 0))
                    u_draw_text("\x13>");
                else if ((var_r27->unk20 > 1) && (j == (s32) (var_r27->unk20 - 1)))
                    u_draw_text("\x1A>");
                else if (var_r27->unk20 > 1)
                    u_draw_text("\x11>");
                else
                    u_draw_text("\x16>");

                if (i > 0)
                    break;

                if (var_r31[1].unk0 == infoWork.unk20 && unpausedFrameCounter % 60 < 45)
                    set_text_mul_color(RGBA(0, 255, 0, 0));
                set_text_pos(
                    x + sprite->scaleX * (var_r4 * 8) + sprite->scaleX * 16.0f,
                    y + sprite->scaleY * (j * 8));
                if (var_r31[1].unk4 == -1)
                    u_draw_text("CLEAR");
                else if (var_r31[1].unk4 == -1)  //! typo?
                    u_draw_text("END");
                else
                    func_80072AC0("%d(%03d)", var_r31[1].unk0, var_r31[1].unk4);
                set_text_mul_color(RGBA(255, 255, 255, 0));
            }
            x += sprite->scaleX * (var_r4 * 8) + sprite->scaleX * 16.0f;
        }
    }
}

void func_80067FD0(struct MemcardGameData *data)
{
    data->unk5844.unk90 = lbl_8027CE08[0];
    data->unk5844.unk94 = lbl_8027CE08[1];
    data->unk5844.unk98 = lbl_8027CE08[2];
    data->unk5844.unk9C = lbl_8027CE08[3];
    data->unk5844.unk2C0 = totalPlayPoints;
    data->unk5844.unk2C4 = lbl_802F1FB8;
}

void func_8006800C(struct MemcardGameData *data)
{
    lbl_8027CE08[0] = data->unk5844.unk90;
    lbl_8027CE08[1] = data->unk5844.unk94;
    lbl_8027CE08[2] = data->unk5844.unk98;
    lbl_8027CE08[3] = data->unk5844.unk9C;
    totalPlayPoints = data->unk5844.unk2C0;
    lbl_802F1FB8 = data->unk5844.unk2C4;
}
