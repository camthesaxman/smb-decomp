#ifndef _DOLPHIN_OSCONTEXT_H_
#define _DOLPHIN_OSCONTEXT_H_

typedef struct OSContext
{
    u32 gpr[32];
    u32 cr;
    u32 lr;
    u32 ctr;
    u32 xer;
    f64 fpr[32];
    u32 fpscr_pad;
    u32 fpscr;
    u32 srr0;
    u32 srr1;
    u16 mode;
    u16 state;
    u32 gqr[8];
    f64 psf[32];
} OSContext;

u32 OSGetStackPointer(void);
void OSDumpContext(OSContext *context);

#endif
