#include <dolphin.h>

#include "functions.h"
#include "variables.h"

extern s16 gameMode;
extern s16 gameSubmode;

extern void func_800301AC(const char *, ...);

//u8 foo[0x10];
//u32 lbl_801EEC90_;
struct Struct801EEC80
{
    u8 filler0[0x10];
    u32 unk10;
};
extern struct Struct801EEC80 lbl_801EEC80;

extern u32 lbl_802F2000;

static inline void show_loading_msg(void)
{
    const char throbber[] = {'-', '\\', '|', '/'};  //lbl_802F28B8
    int chr;
    int asterisks;

    func_8002FC80(14, 15);
    chr = throbber[(lbl_802F1B34/2) % 4];
    func_800301AC("%c", chr);
    func_80030244("NOW LOADING" /*lbl_80173EE8*/);
    func_800301AC("%c" /*lbl_802F02D0*/, chr);
    func_8002FC80(15, 16);
    func_80030244("LEFT: " /*lbl_802F02D4*/);
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

    if (lbl_80173CC8[12].unk0 != 2)
        func_8000E134();

    func_8000DEE8();
    if (lbl_80173CC8[12].unk0 != 2)
    {
        if (lbl_80173CC8[20].unk0 == 2)
            func_80095398(1);
        func_8000B6F0();
        if (lbl_80173CC8[20].unk0 == 2)
            func_80095398(2);
    }
    else
        func_800A5CA0();
    func_8000E180();
    if (lbl_80173CC8[8].unk0 == 2)
        func_800AE408();
    if (modeCtrl.unk30 <= 1 && lbl_80173CC8[12].unk0 == 0 && lbl_80173CC8[14].unk0 == 2)
        func_80084A40();
    if (lbl_802F2000 & 4)
        func_8000D5E4();
}
