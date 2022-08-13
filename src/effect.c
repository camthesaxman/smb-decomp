#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "hud.h"
#include "info.h"
#include "mode.h"
#include "pool.h"
#include "stage.h"

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
