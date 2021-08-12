#include <string.h>
#include <dolphin.h>

#include "global.h"

void input_init(void)
{
    if (lbl_802F1CD2 == 0)
    {
        PADInit();
        PADSetAnalogMode(3);
        lbl_802F1CD2++;
    }
    memset(&lbl_801F3B70, 0, 0xF0);
    lbl_802F1CD0 = 0;
    lbl_802F1CD1 = 0;
}

// TODO: another monster function
/*
void input_main(void)
{
    int i;  // r29
    PADStatus padStatus;  // sp + 0x10
    func_80025158(&padStatus);
    func_800259F8(&padStatus);
    i = 0;
    
    //for (i = 0; i < 4; i++)
    {
        
    }
}
*/

/*
void func_800259F8()
{
    int r31;

    if (lbl_802F1CD1 == 1 && OSGetResetButtonState() == 0)
    {
        lbl_802F1CD0 = 0xFF;
        r31 = 2;
    }
    else
        r31 = 1;
    
    if (OSGetResetButtonState() != 0)
        lbl_802F1CD1 = 1;
    
}
*/
