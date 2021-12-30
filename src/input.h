
struct ControllerInfo
{
    PADStatus unk0[5];  // func_80025640 only matches (unrolled loops) if this is an array.
};

#define CONTROLLER_SOMETHING(idx, btn) \
    (controllerInfo[idx].unk0[4].button & (btn)) \
 || (lbl_801F3D50[idx][4] & btn) \
 || ( \
        ((controllerInfo[idx].unk0[0].button & (btn)) || (lbl_801F3D50[idx][0] & (btn))) \
        && (lbl_801F3D50[idx][0] & PAD_BUTTON_B) \
    )

extern struct ControllerInfo controllerInfo[4];
extern struct ControllerInfo lbl_801F3C60[4];
extern u16 lbl_801F3D50[][5];
//extern struct Struct801F3D88 lbl_801F3D88;
extern u16 lbl_801F3D88[6];
//extern struct Struct801F3D94 lbl_801F3D94;
extern u16 lbl_801F3D94[6];

void input_init(void);
void input_main(void);
void func_80025158(PADStatus *);
void func_800252E4(void);
void func_8002551C(void);
void func_80025640(void);
void handle_reset_input(PADStatus *);
void func_80025B1C(struct CoordsS8 *, s8 *);
void func_80025E5C(void *);
void func_80025E8C(void *);
