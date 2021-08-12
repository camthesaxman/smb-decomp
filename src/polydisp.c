#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "game.h"
#include "mathutil.h"

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

    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
        func_8000E134();

    func_8000DEE8();
    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
    {
        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(1);
        func_8000B6F0();
        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(2);
    }
    else
        func_800A5CA0();
    func_8000E180();
    if (eventInfo[EVENT_NAME_ENTRY].state == EV_STATE_RUNNING)
        func_800AE408();
    if (modeCtrl.unk30 <= 1
     && eventInfo[EVENT_VIEW].state == EV_STATE_INACTIVE
     && eventInfo[EVENT_MINIMAP].state == EV_STATE_RUNNING)
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

extern struct
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
} lbl_801EED04;

extern struct
{
    u8 filler0[4];
    u32 unk4;
    s32 unk8;
} lbl_801EED2C;

//extern u8 lbl_802F1B04[0xB4];
extern u32 *lbl_802F1B04;
extern u32 lbl_802F1BB8;

extern float lbl_80173FD0[];

struct Struct802F1CC8_child
{
    u8 filler0[0x270];
    u32 unk270;
};

extern struct Struct802F1CC8
{
    u8 filler0[8];
    struct Struct802F1CC8_child *unk8;
} *lbl_802F1CC8;

extern struct Struct80173FA8
{
    u32 unk0;
    s16 unk4;
    s16 unk6;
    Vec unk8;
} lbl_80173FA8[];

void func_80085678(float);

void func_8000B918(void)
{
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&lbl_801EED04.unk0);
    mathutil_mtxA_rotate_x(lbl_801EED04.unkC);
    mathutil_mtxA_rotate_z(lbl_801EED04.unkE);
    func_80033AD4(lbl_802F1B04[0x2D]);
}

void func_8000B96C(void)
{
    func_80092D3C();
    func_80054FF0();
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(4);
    if (!(lbl_801EED2C.unk4 & (1 << (31-0x1B)))
     && !(lbl_801EED2C.unk4 & (1 << (31-0x1D))))
    {
        int i;
        for (i = 0; i < 3; i++)
        {
            float f30;
            if (lbl_80205E60[i].unkFC->unk14 & (1 << (31-0x1A)))
                continue;
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate_xyz(
                lbl_80205E60[i].unkFC->unk30.x,
                lbl_80205E60[i].unkFC->unk30.y - 0.45,
                lbl_80205E60[i].unkFC->unk30.z);
            f30 = lbl_80173FD0[lbl_80205E60[i].unkFC->unk10];
            mathutil_mtxA_scale_s(f30);
            mathutil_mtxA_rotate_x(0x4000);
            func_8008F714(0.38f, 0.39f, 0.4f, 1.0f);
            func_8008E420(f30);
            func_8008E500(lbl_802F1CC8->unk8->unk270);
        }
        func_8000E3BC();
    }
    if (lbl_801EED2C.unk4 & 1)
    {
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate_xyz(
            lbl_80205E60[0].unkFC->unk30.x,
            lbl_80205E60[0].unkFC->unk30.y - 0.25,
            lbl_80205E60[0].unkFC->unk30.z);
        if (lbl_801EED2C.unk8 >= 0x440 && lbl_801EED2C.unk8 < 0x51A)
            mathutil_mtxA_translate_xyz(-0.24f, 0.0f, 0.0f);
        func_80033AD4(lbl_802F1B04[0x37]);
    }
    if (lbl_801EED2C.unk4 & (1 << (31-0x15)))
    {
        struct Struct80173FA8 *r27 = lbl_80173FA8;
        int i;
        for (i = 0; i < 2; i++, r27++)
        {
            u32 *var;
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate(&lbl_80205E60[0].unkFC->unk30);
            mathutil_mtxA_translate(&r27->unk8);
            mathutil_mtxA_rotate_y(r27->unk6);
            mathutil_mtxA_rotate_x(r27->unk4);
            var = &lbl_802F1B04[r27->unk0];
            func_80033AD4(var[1]);
        }
    }
    if (!(lbl_801EED2C.unk4 & (1 << (31-0x1B))))
    {
        if (lbl_801EED2C.unk4 & (1 << (31-0x1E)))
            func_80047530();
        if (lbl_801EED2C.unk4 & (1 << (31-0x14)))
            func_80094A34();

        func_80085678(400.0f);
        func_80055028();
        func_80085678(0.0f);

        if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
            func_80095398(16);

        if ((lbl_801EED2C.unk4 & (1 << (31-0x1A)))
         && !(lbl_801EED2C.unk4 & (1 << (31-0x13)))
         && eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
            func_80068370();

        if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING
         || (lbl_801EED2C.unk4 & (1 << (31-0x1C))))
            func_8006B198();

        if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
            func_8004CD60();

        if (lbl_801EED2C.unk4 & (1 << (31-0x1D)))
            func_80038840();
    }
    func_8000E0FC();
    if (lbl_801B9178.unk0 == 13 || lbl_801B9178.unk0 == 17)
        func_800945DC(0);
    func_8000D220();
    func_800858CC();
    if (lbl_801B9178.unk0 == 13 || lbl_801B9178.unk0 == 17)
        func_80094488(0);
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(8);
    func_80017FCC();
}

const float lbl_802F28EC = 1.33333337307f;
