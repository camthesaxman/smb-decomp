#include <dolphin.h>

#include "global.h"
#include "mode.h"

extern u32 lbl_802F1CAC;
extern u32 lbl_802F1CA8;

struct Struct801F3A58 lbl_801F3A58;

void func_80022F14(void)
{
    lbl_801F3A58.unk8 = 0;
    lbl_801F3A58.unk1E = 1;
    lbl_801F3A58.unk20 = 1;
    lbl_801F3A58.unk28 = 0;
    lbl_801F3A58.unk2A = 0;
    if (modeCtrl.unk28 == 2)
    {
        lbl_802F1CAC = 0;
        lbl_802F1CA8 = 0;
    }
}

void ev_info_init(void)
{
    func_80023AF4();
    lbl_801F3A58.timerCurr = 60 * 60;
    if (modeCtrl.levelSetFlags & 1)
        lbl_801F3A58.timerCurr = func_80067008();
    if (gameSubmode == SMD_ADV_INFO_INIT)
        lbl_801F3A58.timerCurr = 90 * 60;
    if (gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT)
        lbl_801F3A58.timerCurr = 60 * 60;
    lbl_801F3A58.timerMax = lbl_801F3A58.timerCurr;
    if (func_800672D0(currStageId) != 0)
        lbl_801F3A58.unk0 |= (1 << 6);
    if (func_80067264(modeCtrl.levelSet, lbl_801F3A58.unk20, modeCtrl.levelSetFlags) != 0)
        lbl_801F3A58.unk0 |= (1 << 12);
}
