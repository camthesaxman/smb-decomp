#ifndef _SRC_STAGE_H_
#define _SRC_STAGE_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>

#include "types.h"

#define STAGE_LIST \
    DEFINE_STAGE(ST_000_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_001_PLAIN,                  BG_TYPE_JUN) \
    DEFINE_STAGE(ST_002_DIAMOND,                BG_TYPE_JUN) \
    DEFINE_STAGE(ST_003_HAIRPIN,                BG_TYPE_JUN) \
    DEFINE_STAGE(ST_004_WIDE_BRIDGE,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_005_SLOPES,                 BG_TYPE_SUN) \
    DEFINE_STAGE(ST_006_STEPS,                  BG_TYPE_SUN) \
    DEFINE_STAGE(ST_007_BLOCKS,                 BG_TYPE_SUN) \
    DEFINE_STAGE(ST_008_JUMP_SINGLE,            BG_TYPE_SUN) \
    DEFINE_STAGE(ST_009_EXAM_A,                 BG_TYPE_SUN) \
    DEFINE_STAGE(ST_010_ARCADE_SPIRAL_HARD,     BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_011_BUMP,                   BG_TYPE_JUN) \
    DEFINE_STAGE(ST_012_WALKING,                BG_TYPE_JUN) \
    DEFINE_STAGE(ST_013_REPULSE,                BG_TYPE_JUN) \
    DEFINE_STAGE(ST_014_NARROW_BRIDGE,          BG_TYPE_JUN) \
    DEFINE_STAGE(ST_015_BREAK,                  BG_TYPE_SUN) \
    DEFINE_STAGE(ST_016_CURVES,                 BG_TYPE_SUN) \
    DEFINE_STAGE(ST_017_DOWNHILL,               BG_TYPE_SUN) \
    DEFINE_STAGE(ST_018_BLOCKS_SLIM,            BG_TYPE_SUN) \
    DEFINE_STAGE(ST_019_ARCADE_DIAMOND,         BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_020_ARCADE_TRACKS,          BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_021_CHOICE,                 BG_TYPE_NIG) \
    DEFINE_STAGE(ST_022_BOWL,                   BG_TYPE_NIG) \
    DEFINE_STAGE(ST_023_JUMPIES,                BG_TYPE_NIG) \
    DEFINE_STAGE(ST_024_STOPPERS,               BG_TYPE_NIG) \
    DEFINE_STAGE(ST_025_FLOOR_BENT,             BG_TYPE_NIG) \
    DEFINE_STAGE(ST_026_CONVEYER,               BG_TYPE_NIG) \
    DEFINE_STAGE(ST_027_EXAM_B,                 BG_TYPE_NIG) \
    DEFINE_STAGE(ST_028_CHASER,                 BG_TYPE_NIG) \
    DEFINE_STAGE(ST_029_JUMP_DOUBLE,            BG_TYPE_NIG) \
    DEFINE_STAGE(ST_030_ARCADE_BRIDGE_MASTER,   BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_031_MIDDLE_JAM,             BG_TYPE_WAT) \
    DEFINE_STAGE(ST_032_ANTLION,                BG_TYPE_WAT) \
    DEFINE_STAGE(ST_033_COLLAPSE,               BG_TYPE_WAT) \
    DEFINE_STAGE(ST_034_SWING_BAR,              BG_TYPE_WAT) \
    DEFINE_STAGE(ST_035_LABRYNITH,              BG_TYPE_WAT) \
    DEFINE_STAGE(ST_036_SPIRAL,                 BG_TYPE_WAT) \
    DEFINE_STAGE(ST_037_WAVY_JUMP,              BG_TYPE_WAT) \
    DEFINE_STAGE(ST_038_SPIKY,                  BG_TYPE_WAT) \
    DEFINE_STAGE(ST_039_UNREST,                 BG_TYPE_WAT) \
    DEFINE_STAGE(ST_040_POLAR,                  BG_TYPE_WAT) \
    DEFINE_STAGE(ST_041_RUIN,                   BG_TYPE_JUN) \
    DEFINE_STAGE(ST_042_BRANCH,                 BG_TYPE_JUN) \
    DEFINE_STAGE(ST_043_OVERTURN,               BG_TYPE_JUN) \
    DEFINE_STAGE(ST_044_EXCURSION,              BG_TYPE_JUN) \
    DEFINE_STAGE(ST_045_DODECAGON,              BG_TYPE_NIG) \
    DEFINE_STAGE(ST_046_EXAM_C,                 BG_TYPE_NIG) \
    DEFINE_STAGE(ST_047_SKELETON,               BG_TYPE_NIG) \
    DEFINE_STAGE(ST_048_TRACKS,                 BG_TYPE_NIG) \
    DEFINE_STAGE(ST_049_ARCADE_NARROW_BRIDGE,   BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_050_ARCADE_CURL_PIPE,       BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_051_DOWNHILL_HARD,          BG_TYPE_WAT) \
    DEFINE_STAGE(ST_052_GEARS,                  BG_TYPE_WAT) \
    DEFINE_STAGE(ST_053_DESTRUCTION,            BG_TYPE_WAT) \
    DEFINE_STAGE(ST_054_INVASION,               BG_TYPE_WAT) \
    DEFINE_STAGE(ST_055_DIVING,                 BG_TYPE_WAT) \
    DEFINE_STAGE(ST_056_FLOOR_SLANT,            BG_TYPE_WAT) \
    DEFINE_STAGE(ST_057_TRAM,                   BG_TYPE_WAT) \
    DEFINE_STAGE(ST_058_SWING_BAR_LONG,         BG_TYPE_WAT) \
    DEFINE_STAGE(ST_059_PAPERWORK,              BG_TYPE_WAT) \
    DEFINE_STAGE(ST_060_ARCADE_SANCTUARY,       BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_061_TWIN_ATTACKER,          BG_TYPE_SND) \
    DEFINE_STAGE(ST_062_SEGA_LOGO,              BG_TYPE_SND) \
    DEFINE_STAGE(ST_063_SNAKE,                  BG_TYPE_SND) \
    DEFINE_STAGE(ST_064_WIND,                   BG_TYPE_SND) \
    DEFINE_STAGE(ST_065_WINDY_SLIDE,            BG_TYPE_SND) \
    DEFINE_STAGE(ST_066_FALL_DOWN,              BG_TYPE_SND) \
    DEFINE_STAGE(ST_067_TWIN_CROSS,             BG_TYPE_SND) \
    DEFINE_STAGE(ST_068_SPIRAL_HARD,            BG_TYPE_SND) \
    DEFINE_STAGE(ST_069_CONVEYER_PARTS,         BG_TYPE_SND) \
    DEFINE_STAGE(ST_070_ARCADE_HITTER,          BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_071_GAPS,                   BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_072_CURVATURE,              BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_073_ANT_LION_SUPER,         BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_074_DRUM,                   BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_075_TWIST_AND_SPIN,         BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_076_SPEEDY_JAM,             BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_077_QUAKE,                  BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_078_CASSIOPEIA,             BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_079_PIRATES,                BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_080_ARCADE_AV_LOGO,         BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_081_BOWL_OPEN,              BG_TYPE_STM) \
    DEFINE_STAGE(ST_082_CHECKER,                BG_TYPE_STM) \
    DEFINE_STAGE(ST_083_CARPET,                 BG_TYPE_STM) \
    DEFINE_STAGE(ST_084_RIDGE,                  BG_TYPE_STM) \
    DEFINE_STAGE(ST_085_MIXER,                  BG_TYPE_STM) \
    DEFINE_STAGE(ST_086_RINGS,                  BG_TYPE_STM) \
    DEFINE_STAGE(ST_087_STAIRS,                 BG_TYPE_STM) \
    DEFINE_STAGE(ST_088_CLOVER,                 BG_TYPE_STM) \
    DEFINE_STAGE(ST_089_COFFEE_CUP,             BG_TYPE_STM) \
    DEFINE_STAGE(ST_090_METAMORPHASIS,          BG_TYPE_STM) \
    DEFINE_STAGE(ST_091_BONUS_BASIC,            BG_TYPE_BNS) \
    DEFINE_STAGE(ST_092_BONUS_WAVE,             BG_TYPE_BNS) \
    DEFINE_STAGE(ST_093_BONUS_GRID,             BG_TYPE_BNS) \
    DEFINE_STAGE(ST_094_BONUS_BUMPY,            BG_TYPE_BNS) \
    DEFINE_STAGE(ST_095_BONUS_HUNTING,          BG_TYPE_BNS) \
    DEFINE_STAGE(ST_096_ARCADE_SNAKE,           BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_097_ARCADE_GEARS,           BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_098_ARCADE_CONVEYER_PARTS,  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_099_JUNGLE_BG,              BG_TYPE_JUN) \
    DEFINE_STAGE(ST_100_ARCADE_POLAR_LARGE,     BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_101_BLUR_BRIDGE,            BG_TYPE_SPA) \
    DEFINE_STAGE(ST_102_HITTER,                 BG_TYPE_SPA) \
    DEFINE_STAGE(ST_103_AV_LOGO,                BG_TYPE_SPA) \
    DEFINE_STAGE(ST_104_HARD_HITTER,            BG_TYPE_SPA) \
    DEFINE_STAGE(ST_105_PUZZLE,                 BG_TYPE_SPA) \
    DEFINE_STAGE(ST_106_POLAR_LARGE,            BG_TYPE_SPA) \
    DEFINE_STAGE(ST_107_BREATHE,                BG_TYPE_SPA) \
    DEFINE_STAGE(ST_108_FERRIS_WHEEL,           BG_TYPE_SPA) \
    DEFINE_STAGE(ST_109_FACTORY,                BG_TYPE_SPA) \
    DEFINE_STAGE(ST_110_CURL_PIPE,              BG_TYPE_SPA) \
    DEFINE_STAGE(ST_111_MAGIC_HAND,             BG_TYPE_SPA) \
    DEFINE_STAGE(ST_112_SANCTUARY,              BG_TYPE_SPA) \
    DEFINE_STAGE(ST_113_DAA_LOO_MAA,            BG_TYPE_SPA) \
    DEFINE_STAGE(ST_114_UNUSED_RINGS_STAGE,     BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_115_ALTERNATE_EDGE_MASTER,  BG_TYPE_MST) \
    DEFINE_STAGE(ST_116_ALTERNATE_ROLL_MASTER,  BG_TYPE_MST) \
    DEFINE_STAGE(ST_117_ARCADE_CURVES,          BG_TYPE_MST) \
    DEFINE_STAGE(ST_118_ARCADE_JUMP_DOUBLE,     BG_TYPE_MST) \
    DEFINE_STAGE(ST_119_ARCADE_DOWNHILL_HARD,   BG_TYPE_MST) \
    DEFINE_STAGE(ST_120_ARCADE_DODECAGON,       BG_TYPE_MST) \
    DEFINE_STAGE(ST_121_WAVE_MASTER,            BG_TYPE_MST) \
    DEFINE_STAGE(ST_122_FAN_MASTER,             BG_TYPE_MST) \
    DEFINE_STAGE(ST_123_STAMINA_MASTER,         BG_TYPE_MST) \
    DEFINE_STAGE(ST_124_SPRING_MASTER,          BG_TYPE_MST) \
    DEFINE_STAGE(ST_125_DANCE_MASTER,           BG_TYPE_MST) \
    DEFINE_STAGE(ST_126_ROLL_MASTER,            BG_TYPE_MST) \
    DEFINE_STAGE(ST_127_EDGE_MASTER,            BG_TYPE_MST) \
    DEFINE_STAGE(ST_128_DODGE_MASTER,           BG_TYPE_MST) \
    DEFINE_STAGE(ST_129_BRIDGE_MASTER,          BG_TYPE_MST) \
    DEFINE_STAGE(ST_130_MONKEY_MASTER,          BG_TYPE_MST) \
    DEFINE_STAGE(ST_131_RACE_SPACE,             BG_TYPE_SPA) \
    DEFINE_STAGE(ST_132_RACE_UNUSED,            BG_TYPE_SND) \
    DEFINE_STAGE(ST_133_RACE_JUNGLE,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_134_RACE_ICE,               BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_135_RACE_DOWNTOWN,          BG_TYPE_NIG) \
    DEFINE_STAGE(ST_136_RACE_WATER,             BG_TYPE_WAT) \
    DEFINE_STAGE(ST_137_CHASER_DUPLICATE,       BG_TYPE_NIG) \
    DEFINE_STAGE(ST_138_RACE_DESERT,            BG_TYPE_SND) \
    DEFINE_STAGE(ST_139_EXAM_A_BROKEN,          BG_TYPE_SUN) \
    DEFINE_STAGE(ST_140_AV_LOGO_BROKEN,         BG_TYPE_SPA) \
    DEFINE_STAGE(ST_141_YELLOW_SQUARE,          BG_TYPE_SPA) \
    DEFINE_STAGE(ST_142_WATER_TEST,             BG_TYPE_WAT) \
    DEFINE_STAGE(ST_143_FIGHT_JUNGLE,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_144_FIGHT_ICE,              BG_TYPE_ICE2) \
    DEFINE_STAGE(ST_145_FIGHT_SPACE,            BG_TYPE_SPA) \
    DEFINE_STAGE(ST_146_DUMMY,                  BG_TYPE_SPA) \
    DEFINE_STAGE(ST_147_DUMMY,                  BG_TYPE_SPA) \
    DEFINE_STAGE(ST_148_DUMMY,                  BG_TYPE_SPA) \
    DEFINE_STAGE(ST_149_DUMMY,                  BG_TYPE_SPA) \
    DEFINE_STAGE(ST_150_TUTORIAL,               BG_TYPE_JUN) \
    DEFINE_STAGE(ST_151_TARGET_CIRCLES,         BG_TYPE_PIL) \
    DEFINE_STAGE(ST_152_TARGET_PYRAMIDS,        BG_TYPE_PIL) \
    DEFINE_STAGE(ST_153_TARGET_HEXAGONS,        BG_TYPE_PIL) \
    DEFINE_STAGE(ST_154_TARGET_UNUSEDS,         BG_TYPE_PIL) \
    DEFINE_STAGE(ST_155_MONKEY_TARGET_BG,       BG_TYPE_PIL) \
    DEFINE_STAGE(ST_156_DUMMY,                  BG_TYPE_PIL) \
    DEFINE_STAGE(ST_157_DUMMY,                  BG_TYPE_PIL) \
    DEFINE_STAGE(ST_158_DUMMY,                  BG_TYPE_PIL) \
    DEFINE_STAGE(ST_159_DUMMY,                  BG_TYPE_PIL) \
    DEFINE_STAGE(ST_160_DUMMY,                  BG_TYPE_PIL) \
    DEFINE_STAGE(ST_161_GOLF_HOLE_18,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_162_GOLF_HOLE_4,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_163_GOLF_HOLE_6,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_164_GOLF_HOLE_3,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_165_GOLF_HOLE_5,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_166_GOLF_HOLE_15,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_167_GOLF_HOLE_1,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_168_GOLF_HOLE_8,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_169_GOLF_HOLE_10,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_170_GOLF_HOLE_14,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_171_GOLF_HOLE_16,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_172_GOLF_HOLE_7,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_173_GOLF_HOLE_12,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_174_GOLF_HOLE_17,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_175_GOLF_HOLE_9,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_176_GOLF_HOLE_13,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_177_GOLF_HOLE_2,            BG_TYPE_JUN) \
    DEFINE_STAGE(ST_178_GOLF_HOLE_11,           BG_TYPE_JUN) \
    DEFINE_STAGE(ST_179_BOWLING,                BG_TYPE_BOW) \
    DEFINE_STAGE(ST_180_BILLIARDS,              BG_TYPE_BIL) \
    DEFINE_STAGE(ST_181_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_182_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_183_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_184_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_185_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_186_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_187_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_188_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_189_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_190_DUMMY,                  0x00) \
    DEFINE_STAGE(ST_191_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_192_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_193_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_194_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_195_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_196_DUMMY,                  BG_TYPE_BLUESKY_A) \
    DEFINE_STAGE(ST_197_BONUS_BG,               BG_TYPE_BNS) \
    DEFINE_STAGE(ST_198_ENDING_CUTSCENE_BG,     BG_TYPE_END) \
    DEFINE_STAGE(ST_199_DUMMY,                  BG_TYPE_JUN) \
    DEFINE_STAGE(ST_200_DUMMY,                  BG_TYPE_BLUESKY_A)

// Define stage IDs
enum
{
#define DEFINE_STAGE(id, bg) id,
STAGE_LIST
#undef DEFINE_STAGE
};

struct StageColiTri
{
    Point3d pos; // Position of vertex 1 in itemgroup space
    Vec normal;  // Triangle normal in itemgroup space
    S16Vec rot;  // Rotation to bring from triangle -> itemgroup space
    u16 flags;

    // Vertex 1 in triangle space is (0, 0)
    Point2d vert2;       // Vertex 2 in triangle space
    Point2d vert3;       // Vertex 3 in triangle space
    // Edge 1 normal in triangle space is (0, 1)
    Vec2d edge2Normal; // Normal of edge from vertex 2 -> vertex 3, in triangle space
    Vec2d edge3Normal; // Normal of edge from vertex 3 -> vertex 1, in triangle space
};

struct StageColiCone
{
    Point3d pos;
    S16Vec rot;
    u16 flags;
    Vec scale;
};

struct StageColiSphere
{
    Point3d pos;
    float radius;
    u16 flags;
};

struct StageColiCylinder
{
    Point3d pos;
    float radius;
    float height;
    S16Vec rot;
    u16 flags;
};

struct ColiRect
{
    Point3d pos;
    S16Vec rot;
    Vec normal;
    float width;
    float height;
};

struct ColiCircle
{
    Point3d pos;
    float radius;
    S16Vec rot;
};

struct StageBgModel
{
    u32 unk0;
    /*0x04*/ char *name;
    /*0x08*/ struct GMAModelHeader *model;
    /*0x0C*/ Point3d pos;
    /*0x18*/ s16 xrot;
    /*0x1A*/ s16 yrot;
    /*0x1C*/ s16 zrot;
    /*0x20*/ Vec scale;
    float unk2C;
    struct UnkStruct8005562C_child *unk30;
    struct UnkStruct8005562C_child2 *unk34;
};

struct StageAnimHdr
{
    /*0x00*/ u32 xRotFramesCount;
    /*0x04*/ struct AnimKeyframe *xRotFrames;
    /*0x08*/ u32 yRotFramesCount;
    /*0x0C*/ struct AnimKeyframe *yRotFrames;
    /*0x10*/ u32 zRotFramesCount;
    /*0x14*/ struct AnimKeyframe *zRotFrames;
    /*0x18*/ u32 xTrnslFramesCount;
    /*0x1C*/ struct AnimKeyframe *xTrnslFrames;
    /*0x20*/ u32 yTrnslFramesCount;
    /*0x24*/ struct AnimKeyframe *yTrnslFrames;
    /*0x28*/ u32 zTrnslFramesCount;
    /*0x2C*/ struct AnimKeyframe *zTrnslFrames;
};

struct DecodedStageLzPtr_child_child3
{
    u8 filler0[4];
    void *unk4;
    u8 filler8[4];
}; // size = 0xC

struct DecodedStageLzPtr_child_child4
{
    void *unk0;
    u8 filler4[4];
};  // size = 8

struct StageCollHdr_child2
{
    Vec unk0;  // position?
    Vec unkC;  // scale?
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    u8 padding[2];
};  // size = 0x20

struct StageBanana
{
    Vec pos;
    s32 type;  // 0 for single, 1 for bunch
};

struct StageBumper
{
    Point3d pos;
    s16 rotX;
    s16 rotY;
    s16 rotZ;
};

struct StageJamabar
{
    Vec pos;
    s16 rotX;
    s16 rotY;
    s16 rotZ;
};

struct StageItemgroup
{
    Point3d initPos;
    S16Vec initRot;
    u16 unk12;

    /*0x14*/ struct StageAnimHdr *animHdr;
    /*0x18*/ char **modelNames;
    /*0x1C*/ struct StageColiTri *triangles;

    /*0x20*/ s16 **gridCellTris;
    /*0x24*/ f32 gridOriginX;
    /*0x28*/ f32 gridOriginZ;
    /*0x2C*/ f32 gridStepX;
    /*0x30*/ f32 gridStepZ;
    /*0x34*/ s32 gridCellCountX;  // Number of cells in X direction
    /*0x38*/ s32 gridCellCountZ;  // Number of cells in Z direction

    /*0x3C*/ s32 goalCount;
    struct StageGoal *goals;
    u8 filler44[4];
    void *unk48;
    s32 bumperCount;
    struct StageBumper *bumpers;
    s32 jamabarCount;
    struct StageJamabar *jamabars;
    s32 bananaCount;
    struct StageBanana *bananas;
    s32 coliConeCount;
    struct StageColiCone *coliCones;
    s32 coliSphereCount;
    struct StageColiSphere *coliSpheres;
    s32 coliCylinderCount;
    struct StageColiCylinder *coliCylinders;
    s32 unk7C;
    struct DecodedStageLzPtr_child_child3 *unk80;
    s32 unk84;
    struct StageCollHdr_child2 *unk88;
    s32 unk8C;
    struct DecodedStageLzPtr_child_child4 *unk90;
    u8 filler94[0xB8-0x94];
    Vec unkB8;
};  // size = 0xC4

struct StageModel
{
    u32 unk0;
    u32 nameOffset;
    float unk8;
};

struct StageStartPos
{
    /*0x00*/ Point3d pos;
    /*0x0C*/ s16 xrot;
    /*0x0E*/ s16 yrot;
    /*0x10*/ s16 zrot;
    /*0x12*/ u8 padding[2];
};

struct StageGoal
{
    /*0x00*/ Point3d pos;
    /*0x0C*/ s16 rotX;
    /*0x0E*/ s16 rotY;
    /*0x10*/ s16 rotZ;
    char type;  // 'B', 'G', or 'R' for blue, green, or red goal
};

struct DecodedStageLzPtr_child5_child
{
    u8 filler0[4];
    void *unk4;
    u8 filler8[4];
    void *unkC;
    u8 filler10[4];
    void *unk14;
};  // size = 0x18

struct DecodedStageLzPtr_child5
{
    u8 filler0[4];
    void *unk4;
    u8 filler8[4];
    void *unkC;
    u8 filler10[4];
    void *unk14;
    s32 unk18;
    struct DecodedStageLzPtr_child5_child *unk1C;
    u8 filler20[4];
    void *unk24;
    u8 filler28[4];
    void *unk2C;
    u8 filler30[4];
    void *unk34;
    u8 filler38[4];
    void *unk3C;
    u8 filler40[4];
    void *unk44;
    u8 filler48[4];
    void *unk4C;
    u8 filler50[4];
    void *unk54;
    u8 filler58[4];
    void *unk5C;
    u8 filler60[4];
    void *unk64;
};

struct DecodedStageLzPtr_child6
{
    u8 filler0[0xC];
    struct StageAnimHdr *unkC;
    struct StageAnimHdr *unk10;
};

struct Stage
{
    s32 unk0;
    s32 unk4;
    /*0x08*/ s32 itemgroupCount;
    /*0x0C*/ struct StageItemgroup *itemgroups;
    /*0x10*/ struct StageStartPos *startPos;
    /*0x14*/ float *pFallOutY;
    /*0x18*/ s32 goalsCount;
    /*0x1C*/ struct StageGoal *goals;
    u8 filler20[4];
    void *unk24;
    /*0x28*/ s32 bumperCount;
    /*0x2C*/ struct StageBumper *bumpers;
    /*0x30*/ s32 jamabarCount;
    /*0x34*/ struct StageJamabar *jamabars;
    /*0x38*/ s32 bananaCount;
    /*0x3C*/ struct StageBanana *bananas;
    u8 filler40[4];
    void *unk44;
    u8 filler48[0x54-0x48];
    void *unk54;
    /*0x58*/ s32 lvlModelsCount;
    /*0x5C*/ struct StageModel *lvlModels;
    u8 filler60[4];
    void *unk64;
    /*0x68*/ s32 bgModelsCount;
    /*0x6C*/ struct StageBgModel *bgModels;
    s32 unk70;
    struct StageBgModel *unk74;
    struct DecodedStageLzPtr_child5 *unk78;
    s32 unk7C;
    /*0x80*/ s32 reflObjsCount;
    /*0x84*/ void *reflObjs;
    struct DecodedStageLzPtr_child6 *unk88;
    u8 filler8C[4];
    void *unk90;
};

void ev_stage_init(void);
void ev_stage_main(void);
void ev_stage_dest(void);
// ? stage_find_model();
void find_blur_bridge_accordion(void);
void draw_blur_bridge_accordions(void);
void g_animate_stage(float);
void g_initialize_stage_dyn_part_info(void);
void func_8004482C(void);
void func_80044920(void);
void load_stage(int);
void unload_stage(void);
void preload_stage_files(int);
void load_stage_files(int stageId);
void func_80044E18(void);
void func_80045194(void);
// ? find_stage_or_bg_model();
void g_initialize_stuff_for_dynamic_stage_parts(int stageId);
int string_match_len();
int get_stage_background(int stageId);
int get_stage_background_2(int stageId);
void compute_stage_bounding_sphere(void);
// ? func_800463E8();
float func_80046884(struct NaomiModel *);
void load_stagedef(int stageId);
void func_800472E8(void);
void adjust_stage_anim_ptrs(struct StageAnimHdr **, struct Stage *);
void func_800473C0(struct UnkStruct8005562C_child **, struct Stage *);
void func_800474D8(struct UnkStruct8005562C_child2 **, struct Stage *);
void stage_draw(void);

#endif
