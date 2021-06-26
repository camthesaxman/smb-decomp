#include <dolphin.h>

#include "variables.h"

void init_vi(void)
{
    VIConfigure(lbl_802F1B30);
    VISetNextFrameBuffer((void *)lbl_802F1CA4[1]);
    lbl_802F1CA4[0] = lbl_802F1CA4[2];
    VIFlush();
    VIWaitForRetrace();
    // hmm... why do I need this cast?
    if (*(int *)&lbl_802F1B30->viTVmode & 1)
        VIWaitForRetrace();
}

void init_gx_2(void)
{
    Mtx44 mtx;
    GXColor clearColor = {0x00, 0x0A, 0x20, 0x00};
    
    C_MTXPerspective(mtx, 60.0f, 1.3333333f, 0.1f, 1000000.0f);
    GXSetProjection(mtx, GX_PERSPECTIVE);
    func_8009E588(0);
    func_8009E110(1, 4, 5, 0);
    GXSetAlphaCompare(GX_GREATER, 0, GX_AOP_AND, GX_GREATER, 0);
    GXSetCopyClear(clearColor, 0x00FFFFFF);
    GXSetDither(FALSE);
}
