#include <dolphin.h>

#include "functions.h"
#include "variables.h"

void polydisp_init(void)
{
    func_8009AAB0();
}

static inline void show_loading_msg(void)
{
    const char throbber[] = {'-', '\\', '|', '/'};
    int chr;
    int asterisks;

    func_8002FC80(14, 15);
    chr = throbber[(lbl_802F1B34/2) % 4];
    func_800301AC("%c", chr);
    func_80030244("NOW LOADING");
    func_800301AC("%c", chr);
    func_8002FC80(15, 16);
    func_80030244("LEFT: ");
    asterisks = func_80092468();
    while (asterisks > 0)
    {
        func_80030244("*");
        asterisks--;
    }
}

void polydisp_main(void)
{
    struct Struct801EEC80 *unk = &lbl_801EEC80;

    if (gameMode == 1
     && (gameSubmode == 29 || gameSubmode == 30)
     && func_80092444() != 0)
        show_loading_msg();

    unk->unk10 &= ~0x11;
    if (func_8009D5D8() != 0)
        unk->unk10 |= 0x10;

    func_80021ECC();
    func_8009AB5C();

    if (eventInfo[12].state != EV_STATE_RUNNING)
        func_8000E134();

    func_8000DEE8();
    if (eventInfo[12].state != EV_STATE_RUNNING)
    {
        if (eventInfo[20].state == EV_STATE_RUNNING)
            func_80095398(1);
        func_8000B6F0();
        if (eventInfo[20].state == EV_STATE_RUNNING)
            func_80095398(2);
    }
    else
        func_800A5CA0();
    func_8000E180();
    if (eventInfo[8].state == 2)
        func_800AE408();
    if (modeCtrl.unk30 <= 1
     && eventInfo[12].state == EV_STATE_INACTIVE
     && eventInfo[14].state == EV_STATE_RUNNING)
        func_80084A40();
    if (lbl_802F2000 & 4)
        func_8000D5E4();
}
