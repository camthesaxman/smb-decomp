#ifndef _SRC_REND_EFC_H_
#define _SRC_REND_EFC_H_

enum
{
    REND_EFC_NULL         = 0,
    REND_EFC_BLUR         = 1,  // unused
    REND_EFC_MOTION_BLUR  = 2,  // unused
    REND_EFC_FOCUS        = 3,
    REND_EFC_KALEIDOSCOPE = 4,  // unused
    REND_EFC_FLAT_MIRROR  = 5,
    REND_EFC_WAVY_MIRROR  = 6,
};

struct RenderEffect
{
    s8 state;
    u8 filler1[5];
    u16 cameraMask;  // the bits here determine which cameras the effect is enabled for
    u32 enableFlags;
    u8 fillerC[4];
    void *work;  // pointer to another structure containing effect-specific data
    struct RenderEffectFuncs *funcs;
};  // size = 0x18

struct RenderEffectFuncs
{
    void (*init)(struct RenderEffect *);
    void (*destroy)(struct RenderEffect *);
    void (*main)(struct RenderEffect *);
    void (*draw)(int, struct RenderEffect *);
};

void ev_rend_efc_init(void);
void ev_rend_efc_main(void);
void ev_rend_efc_dest(void);
void rend_efc_draw();
void rend_efc_enable(int index, int type, struct RenderEffect *params);
void rend_efc_blur_init(struct RenderEffect *);
void rend_efc_blur_destroy(struct RenderEffect *);
void rend_efc_blur_main(struct RenderEffect *);
void rend_efc_blur_draw(int, struct RenderEffect *);
void rend_efc_motion_blur_init(struct RenderEffect *);
void rend_efc_motion_blur_destroy(struct RenderEffect *);
void rend_efc_motion_blur_main(struct RenderEffect *);
void rend_efc_motion_blur_draw(int, struct RenderEffect *);
void rend_efc_focus_init(struct RenderEffect *);
void rend_efc_focus_destroy(struct RenderEffect *);
void rend_efc_focus_main(struct RenderEffect *);
void rend_efc_focus_draw(int, struct RenderEffect *);
void rend_efc_kaleidoscope_init(struct RenderEffect *);
void rend_efc_kaleidoscope_destroy(struct RenderEffect *);
void rend_efc_kaleidoscope_main(struct RenderEffect *);
void rend_efc_kaleidoscope_draw(int, struct RenderEffect *);
void rend_efc_mirror_enable(void);
void rend_efc_flat_mirror_init(struct RenderEffect *);
void rend_efc_flat_mirror_destroy(struct RenderEffect *);
void rend_efc_flat_mirror_main(struct RenderEffect *);
void rend_efc_flat_mirror_draw(int, struct RenderEffect *);
// ? func_800976FC();
// ? func_80097E80();
void rend_efc_wavy_mirror_init(struct RenderEffect *);
void rend_efc_wavy_mirror_destroy(struct RenderEffect *);
void rend_efc_wavy_mirror_main(struct RenderEffect *);
void rend_efc_wavy_mirror_draw(int, struct RenderEffect *);
// ? func_80098484();
// ? func_80098B50();
// ? func_80098EB4();
// ? func_800993A8();
// ? func_800994A8();
// ? func_80099518();
// ? func_80099968();
// ? func_800999CC();
// ? func_8009A13C();
// ? func_8009A2A4();
// ? func_8009A6E0();

#endif
