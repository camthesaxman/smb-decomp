#ifndef _SRC_INPUT_H_
#define _SRC_INPUT_H_

#include <dolphin/types.h>
#include <dolphin/pad.h>

struct ControllerInfo
{
    PADStatus unk0[5];  // func_80025640 only matches (unrolled loops) if this is an array.
};

/*
 * [0] = held buttons
 * [1] = prev held buttons
 * [2] = new buttons
 * [3] = released buttons
 * [4] = button repeats
 */

#define CONTROLLER_SOMETHING(idx, btn) \
( \
    (controllerInfo[idx].unk0[4].button & (btn)) \
 || (analogButtonInfo[idx][4] & btn) \
 || ( \
        ((controllerInfo[idx].unk0[0].button & (btn)) || (analogButtonInfo[idx][0] & (btn))) \
     && (analogButtonInfo[idx][0] & PAD_BUTTON_B) \
    ) \
)

extern struct ControllerInfo controllerInfo[4];
extern struct ControllerInfo lbl_801F3C60[4];
extern u16 analogButtonInfo[][5];
//extern struct Struct801F3D88 lbl_801F3D88;
extern u16 lbl_801F3D88[6];
//extern struct Struct801F3D94 lbl_801F3D94;
extern u16 lbl_801F3D94[6];

void input_init(void);
void input_main(void);
void func_80025158(PADStatus *);
void get_analog_presses(void);
void get_key_repeats(void);
void func_80025640(void);
void handle_reset_input(PADStatus *);
void func_80025B1C(struct CoordsS8 *, s8 *);
void func_80025E5C(void *);
void func_80025E8C(void *);

#endif