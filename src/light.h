#ifndef _SRC_LIGHT_H_
#define _SRC_LIGHT_H_

#include <dolphin/types.h>

// Definition of a single light. Referred to by light groups
struct Light
{
    s8 valid;   // 1 if valid, -1 for end of list
    s8 q_id;    // ID (a sort of category)?
    s16 q_inst; // Instance of ID?
    s8 type;
    s16 spotFn;
    u8 stageId;
    float red;
    float green;
    float blue;

    // Pose in world space
    Point3d pos;
    s16 rotX;
    s16 rotY;
    s16 rotZ; // Doesn't appear to be used
    Vec dir;

    // Attentuation params (may be used differently depending on light type)
    float refDist;
    float k0;
    float k1;
    float k2;
    float spotCutoff; // Angle cutoff for spot light
};

enum
{
    LIGHT_GROUP_DEFAULT,
    LIGHT_GROUP_SINGLE,
    LIGHT_GROUP_SINGLE_UNIT,
    LIGHT_GROUP_DEF_MINIMAP,
    LIGHT_GROUP_DEF_GMAT,
    LIGHT_GROUP_DEF_MIR,

    // Bg models can specify a custom light group in this list
    LIGHT_GROUP_BG_0,
    LIGHT_GROUP_BG_1,
    LIGHT_GROUP_BG_2,
    LIGHT_GROUP_BG_3,
    LIGHT_GROUP_BG_4,
    LIGHT_GROUP_BG_5,
    LIGHT_GROUP_BG_6,
    LIGHT_GROUP_BG_7,
    LIGHT_GROUP_BG_8,
    LIGHT_GROUP_BG_9,
    LIGHT_GROUP_BG_a,
    LIGHT_GROUP_BG_b,
    LIGHT_GROUP_BG_c,
    LIGHT_GROUP_BG_d,
    LIGHT_GROUP_BG_e,
    LIGHT_GROUP_BG_f,
};

extern s32 s_lightPoolSize;
extern s32 q_someLGIdx;
extern s8 s_lightGroupStackPos;
extern float q_minimap_light_ref_dist_scale;
extern s32 s_q_lightPerfTimer;
extern s32 s_numLightObjsLoaded;
extern s32 lbl_802F1C60;
extern s32 lbl_802F1C64;
extern s32 lbl_802F1C68;
extern s32 s_q_lightGroupsInitialized;
extern s32 lightingStageId;
extern s32 lbl_802F1C80;
extern s32 lbl_802F1C84;
extern s32 q_printLight;
extern s32 lbl_802F1C8C;
extern s32 q_lightToPrint;

void light_init();
void light_main();
BOOL add_light_to_pool(struct Light *a);
void load_light_group_uncached(int);
int peek_light_group(void);
void load_light_group_cached();
void push_light_group(void);
void pop_light_group(void);
void q_reset_light_group_stack(int a);
// ? q_set_some_minimap_light_param();
void set_bg_ambient(float, float, float);
void set_render_ambient(float r, float g, float b);
// ? get_curr_light_group_ambient();
// ? apply_curr_light_group_ambient();
void q_draw_naomi_ball(void);
void q_smth_with_lights_smd_continue(int stageId);
void q_smth_with_lights_smd_extra(int stageId);

#endif
