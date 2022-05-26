#ifndef _SRC_NL2NGC_H_
#define _SRC_NL2NGC_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>
#include <dolphin/GXStruct.h>

struct NaomiVtxWithNormal
{
    /*0x00*/ float x, y, z;
    /*0x0C*/ float nx, ny, nz;
    /*0x18*/ float s, t;
};

struct NaomiVtxWithColor
{
    /*0x00*/ float x, y, z;
    /*0x0C*/ u32 unkC;
    /*0x10*/ u32 color;
    /*0x14*/ u32 unk14;
    /*0x18*/ float s, t;
};

struct NaomiDispList
{
    u32 unk0;
    u32 faceCount;
    u8 vtxData[];  // array of NaomiVtxWithNormal or NaomiVtxWithColor structs
};

struct NaomiMesh
{
    /*0x00*/ s32 unk0;
    /*0x04*/ u32 unk4;
    /*0x08*/ u32 unk8;
    /*0x0C*/ GXTexObj *texObj;
    /*0x10*/ u32 unk10;
    /*0x14*/ u8 filler14[0x20-0x14];
    /*0x20*/ s32 unk20;
    /*0x24*/ s32 type;
    /*0x28*/ float unk28;
    /*0x2C*/ float unk2C;
    /*0x30*/ float unk30;
    /*0x34*/ float unk34;
    /*0x38*/ float unk38;
    /*0x3C*/ u8 filler3C[0x4C-0x3C];
    /*0x4C*/ u32 dispListSize;
    /*0x50*/ u8 dispListStart[];  // display list immediately follows the Mesh struct
};

struct NaomiModel
{
    /*0x00*/ s32 unk0;
    /*0x04*/ u32 flags;
    /*0x08*/ Vec boundSphereCenter;
    /*0x14*/ float boundSphereRadius;
    /*0x18*/ u8 meshStart[];  // meshes immediately follow the Model struct
};

struct NaomiModelHeader_child
{
    u32 modelSize;
};

struct NaomiModelHeader_child2
{
    u8 filler0[4];
    char name[];
};

// immediately before the NaomiModel struct
// use the NLMODEL_HEADER macro to access it.
struct NaomiModelHeader
{
    /*-0x08*/ struct NaomiModelHeader_child2 *unk0;
    /*-0x04*/ struct NaomiModelHeader_child *unk4;
};

#define NLMODEL_HEADER(model) ((struct NaomiModelHeader *)((u8 *)(model) - 8))

struct NaomiObj_UnkChild_Child
{
    u32 unk0;
    u32 unk4;
};

struct NaomiObj_UnkChild
{
    u8 filler0[4];
    struct NaomiObj_UnkChild_Child *childStructs;
};

struct NaomiObj
{
    struct NaomiObj_UnkChild **unk0;  // points to an array of UnkStruct ptrs
                                      // doesn't seem to be actually used for anything
    struct NaomiModel *modelPtrs[];  // array of pointers to the models
};

#define NLOBJ_MODEL(obj, index) (((struct NaomiModel **)obj->modelPtrs)[index])

// ? func_80030AF8();
// ? nl2ngc_draw_line_deferred();
void g_nl2ngc_set_scale(float);
void func_80030BB8(float r, float g, float b);
BOOL load_nlobj(struct NaomiObj **pobj, struct TPL **ptpl, char *modelName, char *texName);
BOOL free_nlobj(struct NaomiObj **pobj, struct TPL **ptpl);
void g_init_naomi_model_textures(struct NaomiModel *model, struct TPL *tpl);
void nl2ngc_draw_model_sorted(struct NaomiModel *);
void nl2ngc_draw_model_unsorted(struct NaomiModel *model);
void nl2ngc_draw_model_alpha_sorted(struct NaomiModel *model, float alpha);
void nl2ngc_draw_model_alpha_unsorted(struct NaomiModel *model, float b);
void func_80031764(struct NaomiModel *a);
void g_call_draw_naomi_model_1(struct NaomiModel *a);
void g_draw_naomi_disp_list_pos_nrm_tex(struct NaomiDispList *dl, void *end);
void g_draw_naomi_disp_list_pos_color_tex_1(struct NaomiDispList *dl, void *end);
void do_some_stuff_with_mesh_colors_2(struct NaomiMesh *);
void g_draw_naomi_disp_list_pos_color_tex_2(struct NaomiDispList *dl, void *end);
void g_call_draw_naomi_model_and_do_other_stuff(struct NaomiModel *model);
void g_dupe_of_call_draw_naomi_model_1(struct NaomiModel *model);
void g_call_draw_model_with_alpha_deferred(struct NaomiModel *model, float b);
void nl2ngc_set_light_mask(u32 lightMask);
void nl2ngc_set_ambient(float r, float g, float b);
void func_80033B50(int);
void func_80033B58(u32 a, float b, float c);
void g_nl2ngc_set_some_other_color(int r, int g, int b);
void g_draw_naomi_model_3(struct NaomiModel *);
void g_draw_naomi_model_4(struct NaomiModel *);
void g_draw_naomi_model_5(struct NaomiModel *);
void g_draw_naomi_model_with_mesh_func(struct NaomiModel *a, int (*func)());
void func_800341B8(void);

#endif
