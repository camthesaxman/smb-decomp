#ifndef _SRC_NL2NGC_H_
#define _SRC_NL2NGC_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>
#include <dolphin/GXStruct.h>

// NL == NaomiLib, the format for Naomi model archives (analogous to GMA)

// Type A: no normal, vertex material colors, always unlit
struct NlVtxTypeA
{
    /*0x00*/ float x, y, z;
    /*0x0C*/ u32 unkC;
    /*0x10*/ u32 color;
    /*0x14*/ u32 unk14;
    /*0x18*/ float s, t;
};

// Type B: has normal, no vertex material colors, can be lit or unlit
struct NlVtxTypeB
{
    /*0x00*/ float x, y, z;
    /*0x0C*/ float nx, ny, nz;
    /*0x18*/ float s, t;
};

struct NlDispList
{
    u32 flags;
    u32 faceCount;
    u8 vtxData[];  // array of NlVtxTypeB or NlVtxTypeA structs
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
    NL_MODEL_FLAG_VTX_TYPE_A = 1 << 1, // All meshes in model have vertices of type A (type B if unset)
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
    /*0x28*/ float ambientColorScale;
    /*0x2C*/ float materialColorA;
    /*0x30*/ float materialColorR;
    /*0x34*/ float materialColorG;
    /*0x38*/ float materialColorB;
    /*0x3C*/ u8 filler3C[0x4C-0x3C];
    /*0x4C*/ u32 dispListSize;
    /*0x50*/ u8 dispListStart[];  // display list immediately follows the Mesh struct
};

struct NlModel
{
    /*0x00*/ s32 u_valid;
    /*0x04*/ u32 flags;
    /*0x08*/ Vec boundSphereCenter;
    /*0x14*/ float boundSphereRadius;
    /*0x18*/ u8 meshStart[];  // meshes immediately follow the Model struct
};

struct NlModelHeader_child
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
    /*-0x04*/ struct NlModelHeader_child *unk4;
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
BOOL load_nlobj(struct NlObj **pobj, struct TPL **ptpl, char *modelName, char *texName);
BOOL free_nlobj(struct NlObj **pobj, struct TPL **ptpl);
void init_nl_model_textures(struct NlModel *model, struct TPL *tpl);
void nl2ngc_draw_model_sort_translucent(struct NlModel *);
void nl2ngc_draw_model_sort_none(struct NlModel *model);
void nl2ngc_draw_model_alpha_sort_all(struct NlModel *model, float alpha);
void nl2ngc_draw_model_alpha_sort_none(struct NlModel *model, float b);
void nl2ngc_draw_model_sort_translucent_alt(struct NlModel *a);
void nl2ngc_draw_model_sort_none_alt(struct NlModel *a);
void u_draw_nl_disp_list_type_b_1(struct NlDispList *dl, void *end);
void draw_nl_disp_list_type_a(struct NlDispList *dl, void *end);
void build_alpha_mesh_tev_material(struct NlMesh *);
void draw_nl_disp_list_type_a_alpha(struct NlDispList *dl, void *end);
void nl2ngc_draw_model_sort_translucent_alt2(struct NlModel *model);
void nl2ngc_draw_model_sort_none_alt2(struct NlModel *model);
void nl2ngc_draw_model_alpha_sort_all_alt(struct NlModel *model, float b);
void nl2ngc_set_light_mask(u32 lightMask);
void nl2ngc_set_ambient(float r, float g, float b);
void nl2ngc_enable_fog(int);
void nl2ngc_set_fog_params(u32 a, float b, float c);
void nl2ngc_set_fog_color(int r, int g, int b);
void nl2ngc_draw_opaque_model_meshes(struct NlModel *);
void nl2ngc_draw_translucent_model_meshes(struct NlModel *);
void nl2ngc_draw_all_model_meshes_alpha(struct NlModel *);
void u_nl2ngc_draw_model_with_mesh_func(struct NlModel *a, int (*func)());
void unk_empty(void);

#endif
