#include <dolphin.h>

#include "global.h"
#include "event.h"
#include "input.h"

void func_800308AC(void);
void func_80030914(struct PoolInfo_sub *, int);
void func_8003099C(void);

#pragma force_active on
char *dipSwitchNames[] =
{
    "DIP_DEBUG",
    "DIP_DISP",
    "DIP_STCOLI",
    "DIP_TRIANGLE",
    "DIP_BALL_TGT",
    "DIP_JOINT_OFF",
    "DIP_APE_COLOR",
    "DIP_TIME_STOP",
    "DIP_KARAKUCHI",
    "DIP_NAMEENTRY",
    "DIP_SHADOW_TEST",
    "DIP_FALL_DISP",
    "DIP_TEST_CAM",
    "DIP_NO_INTR",
    "DIP_CAPTURE",
    "DIP_OLD_BALL",
    "DIP_NO_KARI",
    "DIP_PLAY_STG_ALL",
    "DIP_PLAY_PNT_x10",
    "DIP_SARU_0",
    "DIP_SWITCH20",
    "DIP_SWITCH21",
    "DIP_SWITCH22",
    "DIP_SWITCH23",
    "DIP_SWITCH24",
    "DIP_SWITCH25",
    "DIP_SWITCH26",
    "DIP_SWITCH27",
    "DIP_SWITCH28",
    "DIP_SWITCH29",
    "DIP_SWITCH30",
    "DIP_SWITCH31",
};
#pragma force_active reset

void debug_main(void)
{
    u32 temp_r0;
    u32 temp_r3;
    u32 temp_r3_2;
    u32 temp_r4;
    u32 temp_r4_2;

    if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_DISP))
        gamePauseStatus |= 4;
    else
        gamePauseStatus &= ~4;
    if ((dipSwitches & DIP_DEBUG))
    {
        if (!(gamePauseStatus & 1))
        {
            if ((analogButtonInfo[0][0] & PAD_BUTTON_B) && (controllerInfo[0].unk0[2].button & PAD_BUTTON_START))
                gamePauseStatus |= 3;
        }
        else if (!(analogButtonInfo[0][0] & PAD_BUTTON_A) && (controllerInfo[0].unk0[2].button & PAD_BUTTON_START))
            gamePauseStatus &= ~3;
        else if (controllerInfo[0].unk0[2].button & PAD_TRIGGER_Z)
            gamePauseStatus &= ~2;
        else
            gamePauseStatus |= 2;
    }
    else
        gamePauseStatus &= ~3;

    if (gamePauseStatus & 1)
        lbl_802F1ED8 = 8;
    else if (lbl_802F1ED8 != 0)
        lbl_802F1ED8--;

    if (gamePauseStatus & 1)
    {
        u_debug_set_cursor_pos(43, 0);
        u_debug_print("DEBUG MODE");
    }

    if (dipSwitches & DIP_DEBUG)
    {
        if ((controllerInfo[0].unk0[0].button & PAD_BUTTON_B)
         && (controllerInfo[0].unk0[2].button & PAD_BUTTON_X))
        {
            if (eventInfo[EVENT_MOUSE].state != EV_STATE_RUNNING)
            {
                if (gamePauseStatus & 0xA)
                    event_start(EVENT_MOUSE);
            }
            else
                event_finish(EVENT_MOUSE);
        }
    }
    else if (eventInfo[EVENT_MOUSE].state != EV_STATE_INACTIVE)
        event_finish(EVENT_MOUSE);
}

char *lbl_801B7948[] =
{
    "STAT_NULL",
    "STAT_INIT",
    "STAT_NORMAL",
    "STAT_DEST",
    "STAT_FREEZE",
    "STAT_INIT_FIRST",
    "STAT_GOAL_INIT",
    "STAT_GOAL",
    "STAT_RINGOUT_INIT",
    "STAT_RINGOUT",
    "STAT_MINI_MODE_0_INIT",
    "STAT_MINI_MODE_0",
};

struct PoolInfo g_poolInfo;

void chkstatus_init(void)
{
    g_poolInfo.unk0.unk0 = 4;
    g_poolInfo.unk0.unkC = g_poolInfo.unk50;

    g_poolInfo.unk10.unk0 = 0x100;
    g_poolInfo.unk10.unkC = g_poolInfo.unk54;

    g_poolInfo.unk20.unk0 = 0x80;
    g_poolInfo.unk20.unkC = g_poolInfo.unk154;

    g_poolInfo.unk30.unk0 = 0x40;
    g_poolInfo.unk30.unkC = g_poolInfo.unk1D4;

    g_poolInfo.unk40.unk0 = 0x200;
    g_poolInfo.unk40.unkC = g_poolInfo.unk214;

    func_80030A50(&g_poolInfo.unk0);
    func_80030A50(&g_poolInfo.unk10);
    func_80030A50(&g_poolInfo.unk20);
    func_80030A50(&g_poolInfo.unk30);
    func_80030A50(&g_poolInfo.unk40);
}

void chkstatus_main(void)
{
    func_800308AC();
    func_8003099C();
}

void func_800308AC(void)
{
    func_80030914(&g_poolInfo.unk0, -1);
    func_80030914(&g_poolInfo.unk10, EVENT_ITEM);
    func_80030914(&g_poolInfo.unk20, EVENT_STOBJ);
    func_80030914(&g_poolInfo.unk30, EVENT_SPRITE);
    func_80030914(&g_poolInfo.unk40, EVENT_EFFECT);
}

void func_80030914(struct PoolInfo_sub *arg0, int eventId)
{
    int i;
    int var_r4;
    int var_r6;
    int var_r7;
    s8 *var_r8;

    var_r8 = arg0->unkC;
    var_r6 = -1;
    var_r7 = 0;
    if (eventId == -1 || eventInfo[eventId].state != EV_STATE_INACTIVE)
    {
        var_r4 = 0;
        for (i = arg0->unk0; i > 0; i--)
        {
            if (*var_r8 != 0)
                var_r7 = var_r4 + 1;
            else if (var_r6 == -1)
                var_r6 = var_r4;
            var_r4++;
            var_r8++;
        }
    }
    if (var_r6 == -1)
        var_r6 = 0;
    arg0->unk4 = var_r6;
    arg0->unk8 = var_r7;
}

void func_8003099C(void)
{
    if (gamePauseStatus & 0xA)
        return;
    else
        return;
}

int pool_alloc(struct PoolInfo_sub *arg0, u8 arg1)
{
    int i;
    s8 *ptr;

    ptr = arg0->unkC + arg0->unk4;
    for (i = arg0->unk4; i < arg0->unk0; i++, ptr++)
    {
        if (*ptr == 0)
        {
            if (i + 1 > arg0->unk8)
                arg0->unk8 = i + 1;
            arg0->unk4 = i + 1;
            *ptr = arg1;
            return i;
        }
    }

    ptr = arg0->unkC;
    for (i = 0; i < arg0->unk4; i++, ptr++)
    {
        if (*ptr == 0)
        {
            arg0->unk4 = i + 1;
            *ptr = arg1;
            return i;
        }
    }

    return -1;
}

void func_80030A50(struct PoolInfo_sub *arg0)
{
    int i;
    s8 *ptr;

    ptr = arg0->unkC;
    for (i = arg0->unk0; i > 0; i--, ptr++)
        *ptr = 0;
    arg0->unk4 = 0;
    arg0->unk8 = 0;
}
