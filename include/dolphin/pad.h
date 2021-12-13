#ifndef _DOLPHIN_PAD_H_
#define _DOLPHIN_PAD_H_

#define PAD_MAX_CONTROLLERS     4

#define PAD_BUTTON_LEFT  (1 << 0)   // 0x0001
#define PAD_BUTTON_RIGHT (1 << 1)   // 0x0002
#define PAD_BUTTON_DOWN  (1 << 2)   // 0x0004
#define PAD_BUTTON_UP    (1 << 3)   // 0x0008
#define PAD_TRIGGER_Z    (1 << 4)   // 0x0010
#define PAD_TRIGGER_R    (1 << 5)   // 0x0020
#define PAD_TRIGGER_L    (1 << 6)   // 0x0040
#define PAD_BUTTON_A     (1 << 8)   // 0x0100
#define PAD_BUTTON_B     (1 << 9)   // 0x0200
#define PAD_BUTTON_X     (1 << 10)  // 0x0400
#define PAD_BUTTON_Y     (1 << 11)  // 0x0800
#define PAD_BUTTON_MENU  (1 << 12)  // 0x1000
#define PAD_BUTTON_START (1 << 12)  // 0x1000

typedef struct PADStatus
{
    /*0x00*/ u16 button;
    /*0x02*/ s8 stickX;
    /*0x03*/ s8 stickY;
    /*0x04*/ s8 substickX;
    /*0x05*/ s8 substickY;
    /*0x06*/ u8 triggerLeft;
    /*0x07*/ u8 triggerRight;
    /*0x08*/ u8 analogA;
    /*0x09*/ u8 analogB;
    /*0x0A*/ s8 err;
} PADStatus;

BOOL PADInit(void);
u32  PADRead(PADStatus *status);
BOOL PADRecalibrate(u32 mask);
BOOL PADReset(u32 mask);
void PADSetAnalogMode(u32 mode);

#endif
