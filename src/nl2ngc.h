struct NaomiVtxWithNormal
{
    /*0x00*/ float x, y, z;
    /*0x0C*/ float nx, ny, nz;
    /*0x18*/ float s, t;
};

struct NaomiVtxWithColor
{
    /*0x00*/ float x, y, z;
    /*0x0C*/ u8 fillerC[4];
    /*0x10*/ u32 color;
    /*0x14*/ u8 filler14[4];
    /*0x18*/ float s, t;
};

struct NaomiDispList
{
    u32 unk0;
    u32 vtxCount;
    u8 vtxData[0];  // array of NaomiVtxWithNormal or NaomiVtxWithColor structs
};

struct NaomiMesh
{
    s32 unk0;
    u32 unk4;
    u32 unk8;
    GXTexObj *texObj;
    u32 unk10;
    u8 filler14[0x20-0x14];
    s32 unk20;
    s32 unk24;
    float unk28;
    float unk2C;
    float unk30;
    float unk34;
    float unk38;
    u8 filler3C[0x4C-0x3C];
    u32 dispListSize;
    u8 dispListStart[0];  // display list immediately follows the Mesh struct
};

struct NaomiModel
{
    /*0x00*/ s32 unk0;
    /*0x04*/ u32 flags;
    /*0x08*/ Vec unk8;
    /*0x14*/ float unk14;
    /*0x18*/ u8 meshStart[0];  // meshes immediately follow the Model struct
};

struct NaomiObj
{
    u8 filler0[4];
    struct NaomiModel *modelPtrs[0];
};

// ? func_80030AF8();
// ? func_80030B68();
void func_80030BA8(float);
// ? func_80030BB8();
BOOL load_nlobj(struct NaomiObj **pobj, struct TPL **ptpl, char *modelName, char *texName);
BOOL free_nlobj();
BOOL func_80030E90(void *);
void func_80030F88();
void g_init_naomi_texture(struct NaomiModel *a, struct TPL *b);
void func_80031210(struct NaomiModel *);
// ? g_draw_naomi_model_1();
// ? func_800314B8();
// ? g_draw_naomi_model_2();
void func_80031764(struct NaomiModel *a);
void g_call_draw_naomi_model_1(struct NaomiModel *a);
void func_800317A4(void);
void func_80031A58(struct NaomiMesh *);
void g_draw_naomi_disp_list_pos_nrm_tex(struct NaomiDispList *dl, void *end);
void g_draw_naomi_disp_list_pos_color_tex_1(struct NaomiDispList *dl, void *end);
void func_80032A80(void);
void func_80032D44(struct NaomiMesh *);
void g_draw_naomi_disp_list_pos_color_tex_2(struct NaomiDispList *dl, void *end);
void func_80033AD4(struct NaomiModel *model);
void g_dupe_of_call_draw_naomi_model_1(struct NaomiModel *model);
void func_80033B14(struct NaomiModel *model, float b);
// ? func_80033B34();
// ? func_80033B3C();
// ? func_80033B50();
// ? func_80033B58();
// ? func_80033B68();
void g_draw_naomi_model_3(struct NaomiModel *);
void g_draw_naomi_model_4(struct NaomiModel *);
void g_draw_naomi_model_5(struct NaomiModel *);
void g_draw_naomi_model_6(struct NaomiModel *a, int (*func)());
void func_800341B8(void);
