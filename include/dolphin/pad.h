#ifndef _DOLPHIN_PAD_H_
#define _DOLPHIN_PAD_H_

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
