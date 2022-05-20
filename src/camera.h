#ifndef _SRC_CAMERA_H_
#define _SRC_CAMERA_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>

enum
{
    CAMERA_STATE_LEVEL_MAIN       = 1,  // main game in level
    CAMERA_STATE_TEST             = 2,
    CAMERA_STATE_IDLE             = 3,
    CAMERA_STATE_FALLOUT_REPLAY   = 8,
    CAMERA_STATE_READY_INIT       = 10,
    CAMERA_STATE_READY_MAIN       = 11,  // level fly-in
    CAMERA_STATE_GOAL_MAIN        = 15,  // immediately after breaking the goal tape
    CAMERA_STATE_GOAL_REPLAY      = 17,
    CAMERA_STATE_TIME_OVER        = 22,
    CAMERA_STATE_CONTINUE         = 26,
    CAMERA_STATE_AV_INTRO         = 28,  // for AV ball intro (stationary)
    CAMERA_STATE_ATTRACT_CUTSCENE = 30,  // used in the first part of the attract screen
    CAMERA_STATE_DEMO             = 45,  // a sort-of zoomed out overhead view used in the attract screen replay demos
    CAMERA_STATE_EXTRA_CUTSCENE   = 51,
    CAMERA_STATE_ATTRACT_LEVEL    = 55,  // used in the second part of the attract screen when the monkeys are in levels
    CAMERA_STATE_MINI_FIGHT       = 59,
    CAMERA_STATE_MINI_RACE        = 60,
    CAMERA_STATE_MINI_BOWLING     = 61,
    CAMERA_STATE_CREDITS          = 63,
    CAMERA_STATE_MINI_GOLF        = 64,
    CAMERA_STATE_MINI_BILLIARDS   = 65,
    CAMERA_STATE_MINI_PILOT       = 67,
    CAMERA_STATE_RANK_IN          = 71,    
    CAMERA_STATE_END_CUTSCENE     = 74,
};

struct Viewport
{
    float left;    // screen position (0.0-1.0) of viewport left edge
    float top;     // screen position (0.0-1.0) of viewport top edge
    float width;   // width (0.0-1.0) of viewport as a portion of screen width
    float height;  // height (0.0-1.0) of viewport as a portion of screen height
};

struct Camera_sub
{
    // Offsets here are relative to the enclosing Camera struct.
    float unk28;
    float unk2C;
    /*0x30*/ s16 fov;
    s16 unk32;
    /*0x34*/ float aspect;  // aspect ratio (width / height)
    float unk38;
    float unk3C;
    /*0x40*/ struct Viewport vp;
};

struct Camera
{
    /*0x00*/ Vec eye;  // position of the eye of the camera
    /*0x0C*/ Vec lookAt;  // position of the point that the camera is facing
    /*0x18*/ s16 rotX;  // rotation about X axis (pitch)
    /*0x1A*/ s16 rotY;  // rotation about Y axis (yaw)
    /*0x1C*/ s16 rotZ;  // rotation about Z axis (roll)
    /*0x1E*/ s8 state;
    u8 unk1F;
    float unk20;
    /*0x24*/ s16 flags;
    s8 unk26;
    u8 filler27[0x28-0x27];
    struct Camera_sub sub28;  // viewport info?
    /*0x50*/ s16 timerCurr;
    /*0x52*/ s16 timerMax;
    Vec unk54;  // lookAt start for level fly-in?
    float unk60;
    float unk64;
    s32 unk68;
    s32 unk6C;
    s32 unk70;
    Vec unk74;  // lookAt end for level fly-in?
    float unk80;
    u8 filler84[0x88-0x84];
    s32 unk88;
    s32 unk8C;
    s32 unk90;
    Vec eyeVel;
    Vec lookAtVel;
    Vec unkAC;
    s16 unkB8;
    u8 fillerBA[2];
    Vec unkBC;
    Vec unkC8;
    u8 fillerD4[0xEC-0xD4];
    u32 unkEC;
    s32 unkF0;
    Vec unkF4;
    float unk100;
    float unk104;
    float unk108;
    s16 unk10C;
    s16 unk10E;
    s16 unk110;
    u8 filler112[0x114-0x112];
    Vec unk114;
    u8 filler120[0x12C-0x120];
    Vec unk12C;
    Vec unk138;
    Mtx unk144;
    Mtx unk174;
    Mtx unk1A4;
    Mtx unk1D4;
    u32 unk204;
    u8 unk208;
    u8 filler20C[0x284-0x20C];
};  // size=0x284

extern s16 lbl_802F1C30;
//extern s8 lbl_802F1C32;
extern s32 g_cameraId2;
extern void (*minigameRelCameraCallback)(struct Camera *, struct Ball *);
extern struct Camera *currentCameraStructPtr;
extern s32 g_cameraId1;

extern struct Camera cameraInfo[5];
// extern ? lbl_801EFB94;

void camera_init(void);
void ev_camera_init(void);
void ev_camera_main(void);
void ev_camera_dest(void);
void func_80017FCC(void);
void setup_camera_viewport(int cameraId, float left, float top, float width, float height);
void camera_setup_splitscreen_viewports(int playerCount);
void camera_setup_singleplayer_viewport(void);
void camera_apply_viewport(int);
void g_call_camera_apply_viewport();
// ? camera_apply_viewport_2();
// ? func_800188A8();
void func_800188D4(void);
void func_8001898C(int cameraId, int b, Vec *c);
void camera_set_state(int state);
void camera_set_or_clear_flags(int flags, int set);
void camera_clear(struct Camera *camera);
void func_80018C58(struct Camera *camera);
void camera_func_27(struct Camera *camera, struct Ball *ball);
void camera_func_av_intro(struct Camera *camera, struct Ball *ball);
void camera_func_29(struct Camera *camera, struct Ball *ball);
void camera_func_attract_cutscene(struct Camera *camera, struct Ball *ball);
void camera_func_54(struct Camera *camera, struct Ball *ball);
void camera_func_attract_level(struct Camera *camera, struct Ball *ball);
void camera_func_43(struct Camera *camera, struct Ball *ball);
void camera_func_12(struct Camera *camera, struct Ball *ball);
void camera_func_13(struct Camera *camera, struct Ball *ball);
void camera_func_52(struct Camera *camera, struct Ball *ball);
void camera_func_53(struct Camera *camera, struct Ball *ball);
void camera_func_ready_init(struct Camera *camera, struct Ball *ball);
void camera_func_ready_main(struct Camera *camera, struct Ball *ball);
void camera_func_38(struct Camera *camera, struct Ball *ball);
void get_curr_stage_fly_in_position(struct Sphere *);
void camera_func_0(struct Camera *camera, struct Ball *ball);
void camera_func_level_main(struct Camera *camera, struct Ball *ball);
void camera_func_test(struct Camera *camera, struct Ball *ball);
void camera_func_idle(struct Camera *camera, struct Ball *ball);
void camera_func_62(struct Camera *camera, struct Ball *ball);
void camera_func_4(struct Camera *camera, struct Ball *ball);
void camera_func_5(struct Camera *camera, struct Ball *ball);
void camera_func_6(struct Camera *camera, struct Ball *ball);
void camera_func_7(struct Camera *camera, struct Ball *ball);
void camera_func_fallout_replay(struct Camera *camera, struct Ball *ball);
void camera_func_9(struct Camera *camera, struct Ball *ball);
void camera_func_14(struct Camera *camera, struct Ball *ball);
void camera_func_goal_main(struct Camera *camera, struct Ball *ball);
void camera_func_16(struct Camera *camera, struct Ball *ball);
void camera_func_goal_replay(struct Camera *camera, struct Ball *ball);
void camera_func_18(struct Camera *camera, struct Ball *ball);
void camera_func_19(struct Camera *camera, struct Ball *ball);
void camera_func_20(struct Camera *camera, struct Ball *ball);
void camera_func_21(struct Camera *camera, struct Ball *ball);
void camera_func_22_23_24(struct Camera *camera, struct Ball *ball);
void camera_func_25(struct Camera *camera, struct Ball *ball);
void camera_func_26(struct Camera *camera, struct Ball *ball);
void camera_func_31(struct Camera *camera, struct Ball *ball);
void camera_func_32(struct Camera *camera, struct Ball *ball);
void camera_func_33(struct Camera *camera, struct Ball *ball);
void camera_func_34(struct Camera *camera, struct Ball *ball);
void camera_func_35(struct Camera *camera, struct Ball *ball);
void camera_func_36(struct Camera *camera, struct Ball *ball);
void camera_func_37(struct Camera *camera, struct Ball *ball);
void camera_func_39(struct Camera *camera, struct Ball *ball);
void camera_func_40(struct Camera *camera, struct Ball *ball);
void camera_func_41(struct Camera *camera, struct Ball *ball);
void camera_func_42(struct Camera *camera, struct Ball *ball);
void camera_func_44(struct Camera *camera, struct Ball *ball);
void camera_func_demo(struct Camera *camera, struct Ball *ball);
void camera_func_46(struct Camera *camera, struct Ball *ball);
void camera_func_47(struct Camera *camera, struct Ball *ball);
void camera_func_48(struct Camera *camera, struct Ball *ball);
void camera_func_49(struct Camera *camera, struct Ball *ball);
void camera_func_50(struct Camera *camera, struct Ball *ball);
void camera_func_51(struct Camera *camera, struct Ball *ball);
void camera_func_56(struct Camera *camera, struct Ball *ball);
void camera_func_57(struct Camera *camera, struct Ball *ball);
void camera_func_63(struct Camera *camera, struct Ball *ball);
void camera_func_66(struct Camera *camera, struct Ball *ball);
void camera_func_68(struct Camera *camera, struct Ball *ball);
void camera_func_69(struct Camera *camera, struct Ball *ball);
void func_8001FF2C(struct Camera *, struct Ball *, Vec *, Vec *, s16 *, s16 *, s16 *, int);
void func_80020334(struct Camera *, struct Ball *, Vec *, Vec *, s16 *, s16 *, s16 *);
void camera_func_70(struct Camera *camera, struct Ball *ball);
void camera_func_71(struct Camera *camera, struct Ball *ball);
void camera_func_72(struct Camera *camera, struct Ball *ball);
void camera_func_73(struct Camera *camera, struct Ball *ball);
void camera_func_mini(struct Camera *camera, struct Ball *ball);

#endif
