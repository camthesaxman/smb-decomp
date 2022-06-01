#ifndef _SRC_NL2NGC_H_
#define _SRC_NL2NGC_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>
#include <dolphin/GXStruct.h>

// NL == NaomiLib, the format for Naomi model archives (analogous to GMA)

struct NlVtxWithNormal
{
    /*0x00*/ float x, y, z;
    /*0x0C*/ float nx, ny, nz;
    /*0x18*/ float s, t;
};

struct NlVtxWithColor
{
    /*0x00*/ float x, y, z;
    /*0x0C*/ u32 unkC;
    /*0x10*/ u32 color;
    /*0x14*/ u32 unk14;
    /*0x18*/ float s, t;
};

struct NlDispList
{
    u32 flags;
    u32 faceCount;
    u8 vtxData[];  // array of NLVtxWithNormal or NLVtxWithColor structs
};

enum
{
    // 13-14 are min/mag filter: if either set it's near for all, else linear
    NL_TEX_FLAG_T_CLAMP = 1 << 15,
    NL_TEX_FLAG_S_CLAMP = 1 << 16,
    NL_TEX_FLAG_T_MIRROR = 1 << 17,
    NL_TEX_FLAG_S_MIRROR = 1 << 18,
};

enum
{
    NL_DLIST_FLAG_QUADS = 1 << 2,
    NL_DLIST_FLAG_TRIANGLES = 1 << 3,
    NL_DLIST_FLAG_TRIANGLESTRIP = 1 << 4,
};

enum
{
    NL_MODEL_FLAG_TRANSLUCENT = 1 << 8, // Model has at least 1 translucent mesh
    NL_MODEL_FLAG_OPAQUE = 1 << 9, // Model has at least 1 opaque mesh
};

enum
{
    // Non-negative model types also exist, these are treated as lit with constant material color
    NL_MODEL_TYPE_UNLIT_CONST_MAT_COLOR = -1,
    NL_MODEL_TYPE_LIT_CONST_MAT_COLOR = -2, // Ignored
    NL_MODEL_TYPE_UNLIT_VERT_MAT_COLOR = -3,
    // No lit + vertex material color type
};

struct NlMesh
{
    /*0x00*/ s32 flags;
    /*0x04*/ u32 unk4;
    /*0x08*/ u32 texFlags;
    /*0x0C*/ GXTexObj *texObj;
    /*0x10*/ u32 unk10;
    /*0x14*/ u8 filler14[0x20-0x14];
    /*0x20*/ s32 tplTexIdx;
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

struct NlModel
{
    /*0x00*/ s32 unk0;
    /*0x04*/ u32 flags;
    /*0x08*/ Vec boundSphereCenter;
    /*0x14*/ float boundSphereRadius;
    /*0x18*/ u8 meshStart[];  // meshes immediately follow the Model struct
};

struct NlModelHeader_chil
{
    u32 modelSize;
};

struct NlModelHeader_child2
{
    u8 filler0[4];
    char name[];
};

// immediately before the NlModel struct
// use the NLMODEL_HEADER macro to access it.
struct NlModelHeader
{
    /*-0x08*/ struct NlModelHeader_child2 *unk0;
    /*-0x04*/ struct NlModelHeader_chil *unk4;
};

#define NLMODEL_HEADER(model) ((struct NlModelHeader *)((u8 *)(model) - 8))

struct NlObj_UnkChild_Child
{
    u32 unk0;
    u32 unk4;
};

struct NlObj_UnkChild
{
    u8 filler0[4];
    struct NlObj_UnkChild_Child *childStructs;
};

// NaomiLib model container analogous to GMA
struct NlObj
{
    struct NlObj_UnkChild **unk0;  // points to an array of UnkStruct ptrs
                                      // doesn't seem to be actually used for anything
    struct NlModel *models[];  // array of pointers to the models
};

#define NLOBJ_MODEL(obj, index) (((struct NlModel **)obj->models)[index])

// ? func_80030AF8();
// ? nl2ngc_draw_line_deferred();
void nl2ngc_set_scale(float);
void nl2ngc_set_material_color(float r, float g, float b);
BOOL load_naomi_archive(struct NlObj **pobj, struct TPL **ptpl, char *modelName, char *texName);
BOOL free_naomi_archive(struct NlObj **pobj, struct TPL **ptpl);
void init_naomi_model_textures(struct NlModel *model, struct TPL *tpl);
void u_nl2ngc_draw_model_sort_translucent(struct NlModel *);
void nl2ngc_draw_model_unsorted(struct NlModel *model);
void nl2ngc_draw_model_alpha_sorted(struct NlModel *model, float alpha);
void nl2ngc_draw_model_alpha_unsorted(struct NlModel *model, float b);
void u_nl2ngc_draw_model_sort_translucent_alt(struct NlModel *a);
void nl2ngc_draw_model_unsorted_alt(struct NlModel *a);
void u_draw_naomi_disp_list_pos_nrm_tex(struct NlDispList *dl, void *end);
void u_draw_naomi_disp_list_pos_color_tex_1(struct NlDispList *dl, void *end);
void build_tev_material_2(struct NlMesh *);
void u_draw_naomi_disp_list_pos_color_tex_2(struct NlDispList *dl, void *end);
void u_call_draw_naomi_model_and_do_other_stuff(struct NlModel *model);
void u_dupe_of_call_draw_naomi_model_1(struct NlModel *model);
void u_call_draw_model_with_alpha_deferred(struct NlModel *model, float b);
void nl2ngc_set_light_mask(u32 lightMask);
void nl2ngc_set_ambient(float r, float g, float b);
void func_80033B50(int);
void func_80033B58(u32 a, float b, float c);
void u_nl2ngc_set_some_other_color(int r, int g, int b);
void u_draw_model_opaque_meshes(struct NlModel *);
void u_draw_naomi_model_4(struct NlModel *);
void u_draw_naomi_model_5(struct NlModel *);
void u_draw_naomi_model_with_mesh_func(struct NlModel *a, int (*func)());
void func_800341B8(void);

#endif
