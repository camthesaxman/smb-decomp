#include <dolphin.h>
#include <stdlib.h>
#include <string.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "gma.h"
#include "hud.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "pool.h"
#include "stage.h"
#include "stcoli.h"
#include "world.h"

void func_8004D194(struct Effect *);
void func_8004D198(struct Effect *);
void func_8004D19C(struct Effect *);
void func_8004D1A0(struct Effect *);
void func_8004D1A4(struct Effect *);
void func_8004D2C8(struct Effect *);
void func_8004D9AC(struct Effect *);
void func_8004DB40(struct Effect *);
void func_8004DB44(struct Effect *);
void func_8004DC28(struct Effect *);
void func_8004DD88(struct Effect *);
void func_8004DE18(struct Effect *);
void func_8004DE1C(struct Effect *);
void func_8004DF0C(struct Effect *);
void func_8004E384(struct Effect *);
void func_8004E6F0(struct Effect *);
void func_8004E6F4(struct Effect *);
void func_8004E6F8(struct Effect *);
void func_8004E748(struct Effect *);
void func_8004E7C8(struct Effect *);
void func_8004E7D4(struct Effect *);
void func_8004E804(struct Effect *);
void func_8004E96C(struct Effect *);
void func_8004EAB8(struct Effect *);
void func_8004EABC(struct Effect *);
void func_8004EB38(struct Effect *);
void func_8004EDD0(struct Effect *);
void func_8004EE54(struct Effect *);
void func_8004EE58(struct Effect *);
void func_8004EF10(struct Effect *);
void func_8004F17C(struct Effect *);
void func_8004F1E8(struct Effect *);
void func_8004F1EC(struct Effect *);
void func_8004F36C(struct Effect *);
void func_8004F3F4(struct Effect *);
void func_8004F56C(struct Effect *);
void func_8004F570(struct Effect *);
void func_8004F584(struct Effect *);
void func_8004F648(struct Effect *);
void func_8004F78C(struct Effect *);
void func_8004F790(struct Effect *);
void func_8004F820(struct Effect *);
void func_8004FB24(struct Effect *);
void func_8004FC80(struct Effect *);
void func_8004FC84(struct Effect *);
void func_8004FD14(struct Effect *);
void func_8004FDCC(struct Effect *);
void func_8004FEBC(struct Effect *);
void func_8004FEC0(struct Effect *);
void func_8004FFD0(struct Effect *);
void func_80050138(struct Effect *);
void func_80050280(struct Effect *);
void func_80050284(struct Effect *);
void func_800504B0(struct Effect *);
void func_800505E8(struct Effect *);
void func_800506F0(struct Effect *);
void func_800506F4(struct Effect *);
void func_80050708(struct Effect *);
void func_80050788(struct Effect *);
void func_80050880(struct Effect *);
void func_80050884(struct Effect *);
void func_80050890(struct Effect *);
void func_80050C38(struct Effect *);
void func_80050D98(struct Effect *);
void func_80050D9C(struct Effect *);
void func_80050E1C(struct Effect *);
void func_80050ED4(struct Effect *);
void func_80050FB0(struct Effect *);
void func_80050FB4(struct Effect *);
void func_800510EC(struct Effect *);
void func_800516DC(struct Effect *);
void func_80051B98(struct Effect *);
void func_80051B9C(struct Effect *);
void func_80051C1C(struct Effect *);
void func_80052014(struct Effect *);
void func_80052018(struct Effect *);
void func_8005201C(struct Effect *);
void func_80052034(struct Effect *);
void func_800522EC(struct Effect *);
void func_800523F0(struct Effect *);
void func_800523F4(struct Effect *);
void func_80052414(struct Effect *);
void func_80052918(struct Effect *);
void func_80052A0C(struct Effect *);
void func_80052A10(struct Effect *);
void func_80052A14(struct Effect *);
void func_80052A90(struct Effect *);
void func_80052B34(struct Effect *);
void func_80052B38(struct Effect *);
void func_80052BE0(struct Effect *);
void func_80052C98(struct Effect *);
void func_80052EBC(struct Effect *);
void func_80052EC0(struct Effect *);
void func_80052F50(struct Effect *);
void func_80053254(struct Effect *);
void func_800533F4(struct Effect *);
void func_800533F8(struct Effect *);
void func_80053488(struct Effect *);
void func_80053534(struct Effect *);
void func_80053644(struct Effect *);
void func_80053648(struct Effect *);
void func_800536D0(struct Effect *);
void func_80053968(struct Effect *);
void func_80053A4C(struct Effect *);
void func_80053A50(struct Effect *);
void func_80053C70(struct Effect *);
void func_80053D98(struct Effect *);
void func_80053F04(struct Effect *);
void func_80053F08(struct Effect *);
void func_80053F0C(struct Effect *);
void func_80053F10(struct Effect *);
void func_8005402C(struct Effect *);
void func_80054030(struct Effect *);
void func_80054158(struct Effect *);
void func_80054800(struct Effect *);
void func_800549A8(struct Effect *);
void func_800549AC(struct Effect *);
void func_80054A1C(struct Effect *);
void func_80054B84(struct Effect *);
void func_80054CD4(struct Effect *);
void func_80054CD8(struct Effect *);
void func_80054CDC(struct Effect *);
void func_80054CE0(struct Effect *);
void func_80054E00(struct Effect *);
void func_800573A4(struct Effect *);
void func_8005748C(struct Effect *);
void func_800578D0(struct Effect *);
void func_80057934(struct Effect *);
void func_80058CE0(struct Effect *);
void func_80058D44(struct Effect *);
void func_80059058(struct Effect *);
void func_80059554(struct Effect *);
void func_80059560(struct Effect *);
void func_800595DC(struct Effect *);
void func_800596C0(struct Effect *);
void func_80059764(struct Effect *);
void func_800AF1DC(struct Effect *);
void func_800AF1F8(struct Effect *);
void func_800AF2C8(struct Effect *);
void func_800AF3A4(struct Effect *);
void func_800AF3DC(struct Effect *);
void func_800AF478(struct Effect *);
void func_800AF62C(struct Effect *);
void func_800AF6D4(struct Effect *);
void func_800C09B8(struct Effect *);
void func_800C09D0(struct Effect *);
void func_800C0C1C(struct Effect *);
void func_800C0DBC(struct Effect *);

struct Effect lbl_802673C8[MAX_EFFECTS];

void u_give_points(int arg0, int arg1)
{
    int clearScore;
    int var_r8;
    u32 flags;
    int i;
    int floorScore;
    int i2;
    struct StageGoal *goal;
    struct Ball *ball;
    s8 *poolStatus;

    switch (arg0)
    {
    case 2:
    case 3:
        var_r8 = infoWork.unk22;
        floorScore = infoWork.unk1C * 100 / 60;
        goal = decodedStageLzPtr->animGroups[0].goals;
        flags = 0;
        for (i = 0; i < 3; i++, goal++)
        {
            if (i == infoWork.goalEntered)
                break;
        }

        if (goal->type == 'G')
        {
            flags |= 4;
            floorScore += 10000;
        }
        else if (goal->type == 'R')
        {
            flags |= 8;
            floorScore += 20000;
        }
        clearScore = floorScore;
        if (infoWork.unk22 != 1)
            flags |= 2;
        // time bonus
        if (infoWork.timerCurr > (infoWork.timerMax >> 1))
        {
            flags |= 1;
            var_r8 *= 2;
        }
        floorScore *= var_r8;
        if (arg0 == 3)
        {
            hud_show_goal_score_info(clearScore, floorScore, flags);
            return;
        }
        switch (modeCtrl.gameType)
        {
        case 1:
            ball = ballInfo;
            poolStatus = g_poolInfo.playerPool.statusList;
            for (i2 = 0; i2 < g_poolInfo.playerPool.count; i2++, ball++, poolStatus++)
            {
                if (*poolStatus != 0)
                {
                    switch (ball->rank)
                    {
                    case 1:
                        ball->unk7C += floorScore;
                        break;
                    case 2:
                        ball->unk7C += floorScore / 2;
                        break;
                    case 3:
                        ball->unk7C += floorScore / 3;
                        break;
                    }
                    if (ball->unk7C > 0x3B9AC9FF)
                        ball->unk7C = 0x3B9AC9FF;
                }
            }
            break;
        case 0:
            ball = &ballInfo[modeCtrl.currPlayer];
            ball->unk7C += floorScore;
            if (ball->unk7C > 0x3B9AC9FF)
                ball->unk7C = 0x3B9AC9FF;
            break;
        case 2:
            ball = currentBallStructPtr;
            ball->unk7C += floorScore;
            if (ball->unk7C > 0x3B9AC9FF)
                ball->unk7C = 0x3B9AC9FF;
            if (ball->unk7C > lbl_802F1CAC)
            {
                if (lbl_802F1CAC > 0)
                    lbl_802F1CA8 = 1;
                lbl_802F1CAC = ball->unk7C;
            }
            break;
        default:
            ball = currentBallStructPtr;
            ball->unk7C += floorScore;
            if (ball->unk7C > 0x3B9AC9FF)
                ball->unk7C = 0x3B9AC9FF;
            break;
        }
        break;
    default:
        ball = currentBallStructPtr;
        ball->unk7C += arg1;
        if (ball->unk7C > 0x3B9AC9FF)
            ball->unk7C = 0x3B9AC9FF;
        break;
    }
}

extern s16 lbl_802F1F90;

void ev_effect_init(void)
{
    int i;
    struct Effect *effect;

    lbl_802F1F90 = 0;
    memset(&lbl_802673C8, 0, sizeof(lbl_802673C8));
    effect = lbl_802673C8;
    for (i = 0; i < MAX_EFFECTS; i++, effect++)
    {
        effect->unk0 = i;
        effect->unk2 = -1;
    }
    pool_reset(&g_poolInfo.effectPool);
}

#pragma force_active on
char *lbl_801B8D74[] =
{
    "ET_PAPERFRAG",
    "ET_GET_BANANA",
    "ET_COLI_PARTICLE",
    "ET_BIRD_KITE",
    "ET_ROTATE_BG",
    "ET_ICEWATER_REFLECT",
    "ET_ICEWATER_PARTICLE",
    "ET_RAINDROP",
    "ET_HOLDING_BANANA",
    "ET_BUBBLE",
    "ET_LEVITATE",
    "ET_TWINKLE_STAR",
    "ET_BONUS_STG_STAR",
    "ET_BONUS_STG_STAR_TAIL",
    "ET_WATER_LIGHT",
    "ET_RAINDROP_RIPPLE",
    "ET_BALL_GLOW",
    "ET_EXM_GUIDE_LIGHT",
    "ET_EXM_GUIDE_LIGHT_TAIL",
    "ET_COLISTAR_PARTICLE",
    "ET_BGWAT_BUBBLE_BASE",
    "ET_BGWAT_BUBBLE",
    "ET_METEO",
    "ET_METEO_FIX",
    "ET_FIGHT_REVIVAL",
    "ET_FIGHT_PANNEL",
    "ET_FIGHT_GET_BANANA",
    "ET_COLIFLASH",
    "ET_FIGHT_BOX_FRAG",
    "ET_FIGHT_HOLDING_PITEM",
    "ET_FIGHT_BALL_EFC",
    "ET_FIGHT_REVIVAL_PTC",
    "ET_BNS_STG_STAR",
    "ET_BNS_STG_STAR_TAIL",
    "ET_BGMST_GEN_CLOUD",
    "ET_BGSTM_RAINRIPPLE",
    "ET_NAMEENT_CODE",
    "ET_GET_NAMEENT_CODE",
    "ET_MR_BOMB",
    "ET_PILOT_BOMB",
    "ET_BGMST_WATER",
    "ET_MR_BOMB_LIGHT",
    "ET_FIGHT_COLIFLASH",
    "ET_FIGHT_COLIFLASH_PTC",
    "ET_MR_SPEED_STAR_LIGHT",
    "ET_COMMENDFRAG",
    "ET_ENDING_BALLFRAG",
    "ET_BANANA_DROP",
    "ET_BGEND_WATER",
};

#pragma force_active reset

void (*lbl_801B8E38[])(struct Effect *) =
{
    func_8004D1A4,
    func_8004DB44,
    func_8004DE1C,
    func_800573A4,
    func_8004E6F4,
    func_80058CE0,
    func_80059560,
    func_8004E7D4,
    func_8004EABC,
    func_8004EE58,
    func_8004F1EC,
    func_8004F570,
    func_8004F790,
    func_8004FC84,
    func_8004FEC0,
    func_80050284,
    func_800506F4,
    func_80050884,
    func_80050D9C,
    func_80050FB4,
    func_80051B9C,
    func_8005201C,
    func_800523F4,
    func_80052A10,
    func_8004D194,
    func_8004D194,
    func_8004D194,
    func_80052B38,
    func_8004D194,
    func_8004D194,
    func_8004D194,
    func_8004D194,
    func_80052EC0,
    func_800533F8,
    func_80053648,
    func_80053A50,
    func_800AF1DC,
    func_800AF3DC,
    func_8004D194,
    func_8004D194,
    func_80053F08,
    func_8004D194,
    func_8004D194,
    func_8004D194,
    func_8004D194,
    func_80054030,
    func_800C09B8,
    func_800549AC,
    func_80054CD8,
    NULL,
};

void (*lbl_801B8F00[])(struct Effect *) =
{
    func_8004D2C8,
    func_8004DC28,
    func_8004DF0C,
    func_8005748C,
    func_8004E6F8,
    func_80058D44,
    func_800595DC,
    func_8004E804,
    func_8004EB38,
    func_8004EF10,
    func_8004F36C,
    func_8004F584,
    func_8004F820,
    func_8004FD14,
    func_8004FFD0,
    func_800504B0,
    func_80050708,
    func_80050890,
    func_80050E1C,
    func_800510EC,
    func_80051C1C,
    func_80052034,
    func_80052414,
    func_80052A14,
    func_8004D198,
    func_8004D198,
    func_8004D198,
    func_80052BE0,
    func_8004D198,
    func_8004D198,
    func_8004D198,
    func_8004D198,
    func_80052F50,
    func_80053488,
    func_800536D0,
    func_80053C70,
    func_800AF1F8,
    func_800AF478,
    func_8004D198,
    func_8004D198,
    func_80053F0C,
    func_8004D198,
    func_8004D198,
    func_8004D198,
    func_8004D198,
    func_80054158,
    func_800C09D0,
    func_80054A1C,
    func_80054CDC,
    NULL,
};

void (*lbl_801B8FC8[])(struct Effect *) =
{
    func_8004D9AC,
    func_8004DD88,
    func_8004E384,
    func_800578D0,
    func_8004E748,
    func_80059058,
    func_800596C0,
    func_8004E96C,
    func_8004EDD0,
    func_8004F17C,
    func_8004F3F4,
    func_8004F648,
    func_8004FB24,
    func_8004FDCC,
    func_80050138,
    func_800505E8,
    func_80050788,
    func_80050C38,
    func_80050ED4,
    func_800516DC,
    func_80052014,
    func_800522EC,
    func_80052918,
    func_80052A90,
    func_8004D19C,
    func_8004D19C,
    func_8004D19C,
    func_80052C98,
    func_8004D19C,
    func_8004D19C,
    func_8004D19C,
    func_8004D19C,
    func_80053254,
    func_80053534,
    func_80053968,
    func_80053D98,
    func_800AF2C8,
    func_800AF62C,
    func_8004D19C,
    func_8004D19C,
    func_80053F10,
    func_8004D19C,
    func_8004D19C,
    func_8004D19C,
    func_8004D19C,
    func_80054800,
    func_800C0C1C,
    func_80054B84,
    func_80054CE0,
    NULL,
};

void (*lbl_801B9090[])(struct Effect *) =
{
    func_8004DB40,
    func_8004DE18,
    func_8004E6F0,
    func_80057934,
    func_8004E7C8,
    func_80059554,
    func_80059764,
    func_8004EAB8,
    func_8004EE54,
    func_8004F1E8,
    func_8004F56C,
    func_8004F78C,
    func_8004FC80,
    func_8004FEBC,
    func_80050280,
    func_800506F0,
    func_80050880,
    func_80050D98,
    func_80050FB0,
    func_80051B98,
    func_80052018,
    func_800523F0,
    func_80052A0C,
    func_80052B34,
    func_8004D1A0,
    func_8004D1A0,
    func_8004D1A0,
    func_80052EBC,
    func_8004D1A0,
    func_8004D1A0,
    func_8004D1A0,
    func_8004D1A0,
    func_800533F4,
    func_80053644,
    func_80053A4C,
    func_80053F04,
    func_800AF3A4,
    func_800AF6D4,
    func_8004D1A0,
    func_8004D1A0,
    func_8005402C,
    func_8004D1A0,
    func_8004D1A0,
    func_8004D1A0,
    func_8004D1A0,
    func_800549A8,
    func_800C0DBC,
    func_80054CD4,
    func_80054E00,
    NULL,
};

struct EffectFuncs
{
    void (*unk0)(struct Effect *);
    void (*unk4)(struct Effect *);
    void (*unk8)(struct Effect *);
    void (*unkC)(struct Effect *);
};

struct EffectFuncs lbl_801B9158 =
{
    func_8004D194,
    func_8004D198,
    func_8004D19C,
    func_8004D1A0,
};

void ev_effect_main(void)
{
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    if (gamePauseStatus & 0xA)
        return;
    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
    {
        if (*poolStatus != 0)
        {
            effect->unkC--;
            if (effect->unkC == 0 || *poolStatus == 3)
            {
                lbl_801B9090[effect->unk8](effect);
                *poolStatus = 0;
            }
            else
            {
                effect->unk58 = effect->unk34;
                lbl_801B8F00[effect->unk8](effect);
            }
        }
    }
}

void ev_effect_dest(void)
{
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
    {
        if (*poolStatus != 0)
        {
            lbl_801B9090[effect->unk8](effect);
            *poolStatus = 0;
        }
    }
}

void effect_draw(void)
{
    u16 cameras;
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    switch (modeCtrl.gameType)
    {
    case 4:
    case 8:
        cameras = 0xFFFF;
        break;
    default:
        cameras = 1 << u_cameraId1;
        break;
    }

    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    if (!(currentCameraStructPtr->flags & 1))
    {
        for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
        {
            if (*poolStatus != 0 && (effect->unk16 & cameras) && !(effect->unk4 & 1))
                lbl_801B8FC8[effect->unk8](effect);
        }
    }
    else
    {
        for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
        {
            if (*poolStatus != 0 && (effect->unk16 & cameras) && !(effect->unk4 & 1))
            {
                if (effect->unk4 & 0x10)
                {
                    lbl_801B9090[effect->unk8](effect);
                    *poolStatus = 0;
                }
                else
                {
                    if (effect->unk4 & 0xE)
                        effect->unk58 = effect->unk34;
                    lbl_801B8FC8[effect->unk8](effect);
                }
            }
        }
    }
}

int spawn_effect(struct Effect *effect)
{
    int index;
    struct Effect *newEffect;

    index = pool_alloc(&g_poolInfo.effectPool, 1);
    if (index < 0)
        return -1;

    newEffect = &lbl_802673C8[index];
    memcpy(newEffect, effect, sizeof(*newEffect));
    newEffect->unk0 = index;
    lbl_801B8E38[newEffect->unk8](newEffect);
    if (newEffect->unk16 == 0)
        newEffect->unk16 = 0xF;
    newEffect->unk2 = lbl_802F1F90;
    lbl_802F1F90++;
    if (lbl_802F1F90 < 0)
        lbl_802F1F90 = 0;
    return newEffect->unk2;
}

void func_8004CFF0(int arg0)
{
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
    {
        if (*poolStatus != 0 && effect->unk8 == arg0)
        {
            *poolStatus = 3;
            effect->unk4 |= 1;
        }
    }
}

struct Effect *func_8004D054(int arg0)
{
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
    {
        if (*poolStatus != 0 && effect->unk2 == arg0)
            break;
    }
    if (i == 0)
        return NULL;
    else
        return effect;
}

#pragma force_active on
void func_8004D0BC(int arg0, struct EffectFuncs *funcs)
{
    struct EffectFuncs sp10;

    if (funcs == NULL)
        sp10 = lbl_801B9158;
    else
    {
        sp10 = *funcs;
        if (sp10.unk0 == NULL)
            sp10.unk0 = lbl_801B9158.unk0;
        if (sp10.unk4 == NULL)
            sp10.unk4 = lbl_801B9158.unk4;
        if (sp10.unk8 == NULL)
            sp10.unk8 = lbl_801B9158.unk8;
        if (sp10.unkC == NULL)
            sp10.unkC = lbl_801B9158.unkC;
    }
    lbl_801B8E38[arg0] = sp10.unk0;
    lbl_801B8F00[arg0] = sp10.unk4;
    lbl_801B8FC8[arg0] = sp10.unk8;
    lbl_801B9090[arg0] = sp10.unkC;
}
#pragma force_active reset

void func_8004D194(struct Effect *effect) {}

void func_8004D198(struct Effect *effect) {}

void func_8004D19C(struct Effect *effect) {}

void func_8004D1A0(struct Effect *effect) {}

extern u16 lbl_801B9168[];

void func_8004D1A4(struct Effect *effect)
{
    if (effect->unkC == 0)
        effect->unkC = 210.0 + (60.0f * RAND_FLOAT());
    if (effect->unk30 == NULL)
        effect->unk30 = commonGma->modelEntries[lbl_801B9168[(u32)(rand() & 0x7FFF) % 5]].model;
    effect->unkA = 0;
    if (effect->unk24.x == 0.0f)
        effect->unk24.x = 0.5 + (0.5 * RAND_FLOAT());
}

void func_8004D2C8(struct Effect *effect)
{
    Vec sp58;
    struct RaycastHit sp3C;
    Vec sp30;
    Vec sp24;
    Vec sp18;
    Vec spC;
    float temp_f2;
    float temp_f3;
    float temp_f4;
    float temp_f2_3;
    s16 temp_r29;
    s16 temp_r31;
    struct World *world = currentWorldStructPtr;

    effect->unk40.x += 0.004 * world->unk10.x;
    effect->unk40.y += 0.004 * world->unk10.y;
    effect->unk40.z += 0.004 * world->unk10.z;
    mathutil_mtxA_from_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    sp58.x = 0.0f;
    sp58.y = 1.0f;
    sp58.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp58, &sp58);
    temp_f2 = -0.7 * mathutil_vec_dot_prod(&sp58, &effect->unk40);
    effect->unk40.x += sp58.x * temp_f2;
    effect->unk40.y += sp58.y * temp_f2;
    effect->unk40.z += sp58.z * temp_f2;
    effect->unk40.x *= 0.95;
    effect->unk40.y *= 0.95;
    effect->unk40.z *= 0.95;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    temp_f2 = 2560.0f / effect->unk24.x;
    effect->unk52 += (int)(temp_f2 * (effect->unk40.x + effect->unk40.y));
    effect->unk54 += (int)(temp_f2 * (effect->unk40.y + effect->unk40.z));
    effect->unk56 += (int)(temp_f2 * (effect->unk40.z + effect->unk40.x));
    effect->unk52 -= effect->unk52 >> 5;
    effect->unk54 -= effect->unk54 >> 5;
    effect->unk56 -= effect->unk56 >> 5;
    effect->unk4C += effect->unk52;
    effect->unk4E += effect->unk54;
    effect->unk50 += effect->unk56;

    if (!(effect->unkC & 0xF))
    {
        effect->unkA = 0;
        if ((u32)raycast_stage_down(&effect->unk34, &sp3C, &effect->unk7C) != 0
         && sp3C.pos.y > effect->unk34.y - 1.0)
        {
            effect->unkA = 1;
            effect->unk64.x = sp3C.pos.x;
            effect->unk64.y = sp3C.pos.y;
            effect->unk64.z = sp3C.pos.z;
            effect->unk70.x = sp3C.normal.x;
            effect->unk70.y = sp3C.normal.y;
            effect->unk70.z = sp3C.normal.z;
        }
    }

    switch (effect->unkA)
    {
    case 0:
        return;
    }

    sp24 = effect->unk70;
    sp30.x = 0.0f;
    sp30.y = 1.0f;
    sp30.z = 0.0f;
    mathutil_mtxA_from_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x((s32) effect->unk4C);
    mathutil_mtxA_rotate_z((s32) effect->unk50);
    mathutil_mtxA_tf_vec(&sp30, &sp30);

    temp_f3 = (sp30.x * sp24.x) + (sp30.y * sp24.y) + (sp30.z * sp24.z);
    temp_f2_3 = (1.1920929e-7f * effect->unk0) + (0.1 * (1.0 - __fabs(temp_f3)));
    sp18.x = effect->unk34.x - effect->unk64.x;
    sp18.y = effect->unk34.y - effect->unk64.y;
    sp18.z = effect->unk34.z - effect->unk64.z;
    temp_f4 = (sp24.x * sp18.x) + (sp24.y * sp18.y) + (sp24.z * sp18.z);
    if (temp_f4 < (temp_f2_3 + 0.05))
    {
        temp_f2 = temp_f2_3 + 0.05 - temp_f4;
        effect->unk34.x += temp_f2 * sp24.x;
        effect->unk34.y += temp_f2 * sp24.y;
        effect->unk34.z += temp_f2 * sp24.z;
        temp_f2 = ((effect->unk40.x * sp24.x) + (effect->unk40.y * sp24.y)) + (effect->unk40.z * sp24.z);
        if (temp_f2 < 0.0)
        {
            temp_f2 = -temp_f2;
            effect->unk40.x += temp_f2 * sp24.x;
            effect->unk40.y += temp_f2 * sp24.y;
            effect->unk40.z += temp_f2 * sp24.z;
            temp_f4 = __fabs(temp_f3) * (1.0 / 8.0);
            effect->unk40.x = effect->unk40.x;
            effect->unk40.x = effect->unk40.x + (temp_f4 * (effect->unk7C.x - effect->unk40.x));
            effect->unk40.y = effect->unk40.y + (temp_f4 * (effect->unk7C.y - effect->unk40.y));
            effect->unk40.z = effect->unk40.z + (temp_f4 * (effect->unk7C.z - effect->unk40.z));
            temp_f2 = temp_f2 / 2.0;
            effect->unk40.x += temp_f2 * sp24.x;
            effect->unk40.y += temp_f2 * sp24.y;
            effect->unk40.z += temp_f2 * sp24.z;
        }
        spC = sp24;
        if (temp_f3 < 0.0)
        {
            spC.x = -spC.x;
            spC.y = -spC.y;
            spC.z = -spC.z;
        }
        sp30.x = (0.05 * spC.x) + (0.95 * sp30.x);
        sp30.y = (0.05 * spC.y) + (0.95 * sp30.y);
        sp30.z = (0.05 * spC.z) + (0.95 * sp30.z);
        mathutil_vec_normalize_len(&sp30);
        temp_r29 = effect->unk4C;
        temp_r31 = effect->unk50;
        mathutil_mtxA_from_rotate_y(-effect->unk4E);
        mathutil_mtxA_rotate_x(0);
        mathutil_mtxA_tf_vec(&sp30, &sp30);
        effect->unk4C = mathutil_atan2(sp30.z, sp30.y);
        effect->unk50 = -mathutil_atan2(sp30.x, mathutil_sqrt(mathutil_sum_of_sq_2(sp30.z, sp30.y)));
        effect->unk52 >>= 2;
        effect->unk52 += (effect->unk4C - temp_r29) >> 2;
        effect->unk54 -= effect->unk54 >> 4;
        effect->unk56 >>= 2;
        effect->unk56 += (effect->unk50 - temp_r31) >> 2;
    }
}
