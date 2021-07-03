#include <dolphin.h>

#include "functions.h"
#include "variables.h"

void func_8000B6F0(void);

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

extern void (*lbl_802F1B70)(void);

void func_8000B6F0(void)
{
    func_80085620();
    func_800226F4();
    switch (gameMode)
    {
    default:
        func_8000D220();
        break;
    case 0:
        func_8000B8AC();
        break;
    case 1:
        func_8000E0FC();
        func_8000D220();
        func_800125A4();
        break;
    case 2:
        switch (gameSubmode - 61)
        {
        default:
        case 2:
        case 3:
        case 6:
        case 8:
        case 9:
        case 10:
        case 20:
        case 21:
            func_8000C5A4();
            break;
        case 15:
        case 16:
        case 17:
            func_8000D018();
            break;
        case 11:
        case 12:
            func_800B64B0();
            func_8000D220();
            break;
        case 22:
        case 23:
            func_80093E28();
            break;
        case 4:
        case 5:
            func_8000CA9C();
            func_8000D220();
            break;
        case 13:
        case 14:
            func_8000CF94();
            func_8000D220();
            break;
        case 0:
        case 1:
        case 7:
            switch (modeCtrl.unk28)
            {
            case 1:
                func_8000C5A4();
                break;
            default:
                if (modeCtrl.unk8 & (1 << 5))
                    func_8000C5A4();
                break;
            }
            break;
        case 18:
        case 19:
        case 24:
        case 25:
            break;
        }
        break;
    case 3:
        func_8000E0FC();
        if (lbl_802F1B70 != NULL)
            lbl_802F1B70();
        func_8000D220();
        break;
    case 4:
        switch (gameSubmode)
        {
        case 0x92:
        case 0x93:
            func_80093E28();
            break;
        case 0xA2:
        case 0xA3:
            func_8009BEF8();
            break;
        case 0xA7:
            func_80094028();
            break;
        default:
            func_80093B54();
            break;
        case 0x90:
        case 0x91:
            break;
        }
        func_8000D220();
        break;
    case 5:
        if (lbl_802F1B70 != NULL)
            lbl_802F1B70();
        func_8000D220();
        break;
    }
    func_800188D4();
    func_800858CC();
}
