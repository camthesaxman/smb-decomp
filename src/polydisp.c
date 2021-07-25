#include <dolphin.h>

#include "global.h"

#include "game.h"

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

    if (gameMode == MD_SEL
     && (gameSubmode == SMD_SEL_STAGE_INIT || gameSubmode == SMD_SEL_STAGE_MAIN)
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

void func_8000B6F0(void)
{
    func_80085620();
    func_800226F4();
    switch (gameMode)
    {
    default:
        func_8000D220();
        break;
    case MD_ADV:
        func_8000B8AC();
        break;
    case MD_SEL:
        func_8000E0FC();
        func_8000D220();
        func_800125A4();
        break;
    case MD_GAME:
        switch (gameSubmode)
        {
        default:
        case SMD_GAME_NAMEENTRY_INIT:
        case SMD_GAME_NAMEENTRY_MAIN:
        case SMD_GAME_RESTART_INIT:
        case SMD_GAME_NAMEENTRY_READY_MAIN:
        case SMD_GAME_BONUS_CLEAR_INIT:
        case SMD_GAME_BONUS_CLEAR_MAIN:
        case SMD_GAME_OVER_SAVE:
        case SMD_GAME_OVER_DEST:
            func_8000C5A4();
            break;
        case SMD_GAME_RESULT_INIT:
        case SMD_GAME_RESULT_MAIN:
        case SMD_GAME_RESULT_MENU:
            func_8000D018();
            break;
        case SMD_GAME_ENDING_INIT:
        case SMD_GAME_ENDING_MAIN:
            func_800B64B0();
            func_8000D220();
            break;
        case SMD_GAME_ROLL_INIT:
        case SMD_GAME_ROLL_MAIN:
            func_80093E28();
            break;
        case SMD_GAME_CONTINUE_INIT:
        case SMD_GAME_CONTINUE_MAIN:
            func_8000CA9C();
            func_8000D220();
            break;
        case SMD_GAME_EXTRA_INIT:
        case SMD_GAME_EXTRA_WAIT:
            func_8000CF94();
            func_8000D220();
            break;
        case SMD_GAME_OVER_INIT:
        case SMD_GAME_OVER_MAIN:
        case SMD_GAME_NAMEENTRY_READY_INIT:
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
        case SMD_GAME_INTR_SEL_INIT:
        case SMD_GAME_INTR_SEL_MAIN:
        case SMD_GAME_OVER_POINT_INIT:
        case SMD_GAME_OVER_POINT_MAIN:
            break;
        }
        break;
    case MD_TEST:
        func_8000E0FC();
        if (lbl_802F1B70 != NULL)
            lbl_802F1B70();
        func_8000D220();
        break;
    case MD_MINI:
        switch (gameSubmode)
        {
        case SMD_MINI_TEST0_INIT:
        case SMD_MINI_TEST0_MAIN:
            func_80093E28();
            break;
        case SMD_MINI_COMMEND_INIT:
        case SMD_MINI_COMMEND_MAIN:
            func_8009BEF8();
            break;
        case SMD_MINI_ENDING_MAIN:
            func_80094028();
            break;
        default:
            func_80093B54();
            break;
        case SMD_MINI_SELECT_INIT:
        case SMD_MINI_SELECT_MAIN:
            break;
        }
        func_8000D220();
        break;
    case MD_OPTION:
        if (lbl_802F1B70 != NULL)
            lbl_802F1B70();
        func_8000D220();
        break;
    }
    func_800188D4();
    func_800858CC();
}

void func_8000B8AC(void)
{
    switch (lbl_802F1BC8)
    {
    case 4:
        func_8000B918();
        func_8000D220();
        break;
    case 2:
        func_8000B96C();
        break;
    case 14:
        func_8000C5A4();
        func_8000BCA4();
        break;
    case 11:
    case 12:
    case 15:
    case 16:
    case 17:
    case 18:
        func_8000C5A4();
        func_800858CC();
        func_8000C388();
        break;
    }
}

/*
extern s16 lbl_801EED04[];

u8 lbl_802F1B04[0xB4];
u32 lbl_802F1BB8;

void func_8000B918(void)
{
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(lbl_801EED04);
    mathutil_mtxA_rotate_x(lbl_801EED04[6]);
    mathutil_mtxA_rotate_z(lbl_801EED04[7]);
    func_80033AD4(lbl_802F1BB8);
}
*/
