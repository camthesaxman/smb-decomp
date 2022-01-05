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
    /*0x04*/ void *xRotFrames;
    /*0x08*/ u32 yRotFramesCount;
    /*0x0C*/ void *yRotFrames;
    /*0x10*/ u32 zRotFramesCount;
    /*0x14*/ void *zRotFrames;
    /*0x18*/ u32 xTrnslFramesCount;
    /*0x1C*/ void *xTrnslFrames;
    /*0x20*/ u32 yTrnslFramesCount;
    /*0x24*/ void *yTrnslFrames;
    /*0x28*/ u32 zTrnslFramesCount;
    /*0x2C*/ void *zTrnslFrames;
};

struct DecodedStageLzPtr_child_child3
{
    u8 filler0[4];
    void *unk4;
    u8 filler8[4];
};  // size = 0xC

struct DecodedStageLzPtr_child_child4
{
    void *unk0;
    u8 filler4[4];
};  // size = 8

struct StageCollHdr
{
    Vec unk0;
    /*0x0C*/ s16 initXRot;
    /*0x0E*/ s16 initYRot;
    /*0x10*/ s16 initZRot;
    u16 unk12;
    /*0x14*/ struct StageAnimHdr *animHdr;
    /*0x18*/ char **modelNames;
    /*0x1C*/ void *triangles;
    /*0x20*/ void *collCells;
    u8 filler24[0x34-0x24];
    /*0x34*/ s32 cellsX;  // number of cells in x direction
    /*0x38*/ s32 cellsY;  // number of cells in y direction
    /*0x3C*/ s32 unk3C;
    Vec *unk40;
    u8 filler44[4];
    void *unk48;
    u8 filler4C[4];
    void *unk50;
    u8 filler54[4];
    void *unk58;
    u8 filler5C[4];
    void *unk60;
    u8 filler64[4];
    void *unk68;
    u8 filler6C[4];
    void *unk70;
    u8 filler74[4];
    void *unk78;
    s32 unk7C;
    struct DecodedStageLzPtr_child_child3 *unk80;
    u8 filler84[4];
    void *unk88;
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
    /*0x0C*/ s16 xrot;
    /*0x0E*/ s16 yrot;
    /*0x10*/ s16 zrot;
    u8 filler12[0x14-0x12];
};  // size = 0x14

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
    /*0x08*/ s32 collHdrsCount;
    /*0x0C*/ struct StageCollHdr *collHdrs;
    /*0x10*/ struct StageStartPos *startPos;
    /*0x14*/ float *pFallOutY;
    /*0x18*/ s32 goalsCount;
    /*0x1C*/ struct StageGoal *goals;
    u8 filler20[4];
    void *unk24;
    /*0x28*/ s32 bumpersCount;
    /*0x2C*/ void *bumpers;
    /*0x30*/ s32 jamabarsCount;
    /*0x34*/ void *jamabars;
    /*0x38*/ s32 bananasCount;
    /*0x3C*/ void *bananas;
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
// ? func_8004424C();
// ? g_animate_stage();
void func_80044794(void);
void func_8004482C(void);
// ? func_80044920();
void load_stage(int);
// ? unload_stage();
void preload_stage_files(int);
void load_stage_files(int stageId);
void func_80044E18(void);
void func_80045194(void);
// ? func_800455FC();
void func_800456A8(int stageId);
int func_800457B8();
int get_stage_background(int stageId);
int func_80045E4C(int stageId);
void func_80045E98(void);
// ? func_800463E8();
float func_80046884(struct Struct80209488 *);
void load_stagedef(int stageId);
void func_800472E8(void);
void adjust_stage_anim_ptrs(struct StageAnimHdr **, struct Stage *);
void func_800473C0(struct UnkStruct8005562C_child **, struct Stage *);
void func_800474D8(struct UnkStruct8005562C_child2 **, struct Stage *);
void stage_draw(void);
