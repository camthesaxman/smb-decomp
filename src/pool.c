#include <dolphin.h>

#include "global.h"
#include "event.h"
#include "input.h"
#include "pool.h"

static void func_800308AC(void);
static void func_80030914(struct PoolInfo_sub *, int);
static void dummy_func(void);

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
    g_poolInfo.playerPool.capacity = ARRAY_COUNT(g_poolInfo.playerBuf);
    g_poolInfo.playerPool.statusList = g_poolInfo.playerBuf;

    g_poolInfo.itemPool.capacity = ARRAY_COUNT(g_poolInfo.itemBuf);
    g_poolInfo.itemPool.statusList = g_poolInfo.itemBuf;

    g_poolInfo.stobjPool.capacity = ARRAY_COUNT(g_poolInfo.stobjBuf);
    g_poolInfo.stobjPool.statusList = g_poolInfo.stobjBuf;

    g_poolInfo.spritePool.capacity = ARRAY_COUNT(g_poolInfo.spriteBuf);
    g_poolInfo.spritePool.statusList = g_poolInfo.spriteBuf;

    g_poolInfo.effectPool.capacity = ARRAY_COUNT(g_poolInfo.effectBuf);
    g_poolInfo.effectPool.statusList = g_poolInfo.effectBuf;

    pool_reset(&g_poolInfo.playerPool);
    pool_reset(&g_poolInfo.itemPool);
    pool_reset(&g_poolInfo.stobjPool);
    pool_reset(&g_poolInfo.spritePool);
    pool_reset(&g_poolInfo.effectPool);
}

void chkstatus_main(void)
{
    func_800308AC();
    dummy_func();
}

static void func_800308AC(void)
{
    func_80030914(&g_poolInfo.playerPool, -1);
    func_80030914(&g_poolInfo.itemPool, EVENT_ITEM);
    func_80030914(&g_poolInfo.stobjPool, EVENT_STOBJ);
    func_80030914(&g_poolInfo.spritePool, EVENT_SPRITE);
    func_80030914(&g_poolInfo.effectPool, EVENT_EFFECT);
}

static void func_80030914(struct PoolInfo_sub *pool, int eventId)
{
    int i;
    int firstFree;
    int end;
    s8 *status;

    status = pool->statusList;
    firstFree = -1;
    end = 0;
    if (eventId == -1 || eventInfo[eventId].state != EV_STATE_INACTIVE)
    {
        for (i = 0; i < pool->capacity; i++, status++)
        {
            if (*status != 0)
                end = i + 1;
            else if (firstFree == -1)
                firstFree = i;
        }
    }
    if (firstFree == -1)
        firstFree = 0;
    pool->nextFree = firstFree;
    pool->count = end;
}

static void dummy_func(void)
{
    if (gamePauseStatus & 0xA)
        return;
    else
        return;
}

int pool_alloc(struct PoolInfo_sub *pool, u8 arg1)
{
    int i;
    s8 *ptr;

    ptr = pool->statusList + pool->nextFree;
    for (i = pool->nextFree; i < pool->capacity; i++, ptr++)
    {
        if (*ptr == 0)
        {
            if (i + 1 > pool->count)
                pool->count = i + 1;
            pool->nextFree = i + 1;
            *ptr = arg1;
            return i;
        }
    }

    ptr = pool->statusList;
    for (i = 0; i < pool->nextFree; i++, ptr++)
    {
        if (*ptr == 0)
        {
            pool->nextFree = i + 1;
            *ptr = arg1;
            return i;
        }
    }

    return -1;
}

void pool_reset(struct PoolInfo_sub *pool)
{
    int i;
    s8 *ptr;

    ptr = pool->statusList;
    for (i = pool->capacity; i > 0; i--, ptr++)
        *ptr = 0;
    pool->nextFree = 0;
    pool->count = 0;
}
