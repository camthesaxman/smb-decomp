#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "course.h"
#include "input.h"
#include "info.h"
#include "item.h"
#include "mathutil.h"
#include "mode.h"
#include "name_entry.h"
#include "pool.h"
#include "recplay.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "stcoli.h"
#include "stobj.h"

s8 lbl_802F1CB0[8];
s32 lbl_802F1CAC;
s32 lbl_802F1CA8;

struct Struct801F3A58 infoWork;

static void func_80023AF4(void);

void func_80022F14(void)
{
    infoWork.unk8 = 0;
    infoWork.attempts = 1;
    infoWork.currFloor = 1;
    infoWork.livesLost = 0;
    infoWork.continuesUsed = 0;
    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
    {
        lbl_802F1CAC = 0;
        lbl_802F1CA8 = 0;
    }
}

u32 lbl_801F3A8C[4];                    FORCE_BSS_ORDER(lbl_801F3A8C)
struct Struct801F3A58 playerInfos[4];  FORCE_BSS_ORDER(playerInfos)

void ev_info_init(void)
{
    func_80023AF4();

    // Initialize timer
    infoWork.timerCurr = 60 * 60;
    if (modeCtrl.courseFlags & 1)
        infoWork.timerCurr = u_get_stage_time_limit();
    if (gameSubmode == SMD_ADV_INFO_INIT)
        infoWork.timerCurr = 90 * 60;
    if (gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT)
        infoWork.timerCurr = 60 * 60;
    infoWork.timerMax = infoWork.timerCurr;

    if (is_bonus_stage(currStageId))
        infoWork.flags |= INFO_FLAG_BONUS_STAGE;
    if (is_final_floor(modeCtrl.difficulty, infoWork.currFloor, modeCtrl.courseFlags) != 0)
        infoWork.flags |= INFO_FLAG_FINAL_FLOOR;
}

void ev_info_main(void)
{
    s8 *r23;
    int i;
    struct Ball *ballBackup;
    int r20;
    struct Ball *ball;
    struct ReplayHeader spC8;
    struct PhysicsBall sp6C;

    if (gamePauseStatus & 0xA)
        return;

    // handle goal
    ballBackup = currentBallStructPtr;
    ball = ballInfo;
    r23 = g_poolInfo.playerPool.statusList;
    r20 = 0;
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, r23++)
    {
        u32 goalId;
        s32 sp64;

        if (*r23 == 0 || *r23 == 4)
            continue;

        currentBallStructPtr = ball;
        if (!check_ball_entered_goal(ball, &goalId, &sp64))
            continue;
        infoWork.playerId = ball->playerId;
        switch (modeCtrl.gameType)
        {
        case GAMETYPE_MAIN_COMPETITION:
            if (ball->flags & BALL_FLAG_24)
            {
                get_replay_header(lbl_80250A68.unk0[ball->playerId], &spC8);
                if (!(spC8.flags & 1))
                    continue;
            }
            if (ball->flags & BALL_FLAG_24)
            {
                infoWork.flags &= ~(INFO_FLAG_REPLAY|INFO_FLAG_11);
                ball->flags |= BALL_FLAG_GOAL;
                ball->state = 5;
                ball->unk150 = ball->pos;
            }
            if (!(ball->flags & BALL_FLAG_GOAL) && !(infoWork.flags & INFO_FLAG_05))
            {
                func_8004923C(0x5A);
                infoWork.flags &= ~(INFO_FLAG_REPLAY|INFO_FLAG_11);
                r20++;
                ball->flags |= BALL_FLAG_GOAL;
                ball->state = 5;
                ball->unk150 = ball->pos;
                cameraInfo[i].state = 14;
                if (r20 == 1)
                    infoWork.unk2C++;
                if (!(infoWork.flags & INFO_FLAG_REPLAY) && !(infoWork.flags & INFO_FLAG_BONUS_STAGE))
                {
                    ball->rank = infoWork.unk2C;
                    if (ball->rank == 1)  // first place
                    {
                        ball->winStreak++;
                        ball->unk128 = 0;
                    }
                    else if (ball->rank == modeCtrl.playerCount)  // last place
                    {
                        ball->winStreak = 0;
                        ball->unk128++;
                    }
                    else
                    {
                        ball->winStreak = 0;
                        ball->unk128 = 0;
                    }
                    func_80023DB8(ball);
                    create_rank_icon(ball);
                }
                if (infoWork.unk2C == 1)
                    func_800245E4(ball, goalId, sp64);
                func_80049268(ball->playerId);
            }
            init_physball_from_ball(ball, &sp6C);
            if (sp64 != sp6C.animGroupId)
                tf_physball_to_anim_group_space(&sp6C, sp64);
            u_break_goal_tape(goalId, &sp6C);
            ball->unk12A = infoWork.timerCurr;
            func_80024860(ball);
            break;
        case GAMETYPE_MINI_FIGHT:
            break;
        default:
            if (ball->flags & BALL_FLAG_11)
                break;
            if (ball->flags & BALL_FLAG_24)
            {
                get_replay_header(lbl_80250A68.unk0[ball->playerId], &spC8);
                if (!(spC8.flags & 1))
                    break;
            }
            infoWork.flags &= ~(INFO_FLAG_REPLAY|INFO_FLAG_11);
            ball->flags |= BALL_FLAG_GOAL;
            ball->state = BALL_STATE_GOAL_INIT;
            if (!(infoWork.flags & INFO_FLAG_05))
            {
                u_time_over_all_competition_mode_balls();
                func_800245E4(ball, goalId, sp64);
                if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
                    func_800AEDDC();
            }
            func_80049268(ball->playerId);
            if (gameSubmode == SMD_ADV_GAME_PLAY_MAIN)
                infoWork.flags |= INFO_FLAG_GOAL;
            init_physball_from_ball(ball, &sp6C);
            if (sp64 != sp6C.animGroupId)
                tf_physball_to_anim_group_space(&sp6C, sp64);
            u_break_goal_tape(goalId, &sp6C);
            ball->unk12A = infoWork.timerCurr;
            func_80024860(ball);
            break;
        }
    }
    if (r20 > 1)
        infoWork.unk2C += r20 - 1;
    if (r20 > 0 && infoWork.unk2C >= modeCtrl.playerCount - 1)
        u_time_over_all_competition_mode_balls();
    currentBallStructPtr = ballBackup;

    infoWork.bananasLeft = 0;

    {
        struct Item *item = itemPool;
        s8 *r7 = g_poolInfo.itemPool.statusList;

        for (i = 0; i < g_poolInfo.itemPool.count; item++, i++, r7++)
        {
            if (*r7 != 0 && *r7 != 3 && item->type == 0 && (item->flags & (1 << 1)))
                infoWork.bananasLeft++;
        }
    }

    if ((infoWork.flags & INFO_FLAG_BONUS_STAGE)
     && !(infoWork.flags & INFO_FLAG_05)
     && infoWork.bananasLeft == 0)
    {
        infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_05|INFO_FLAG_BONUS_CLEAR;
        func_800493C4(ball->playerId);
        BALL_FOREACH( ball->flags |= BALL_FLAG_13; )
    }

    // Press X+Y in debug mode to instantly complete level
    if (!(infoWork.flags & INFO_FLAG_05)
     && !(infoWork.flags & INFO_FLAG_TIMER_PAUSED)
     && (dipSwitches & DIP_DEBUG)
     && ((infoWork.flags & INFO_FLAG_BONUS_STAGE) || decodedStageLzPtr->goals != NULL)
     && (g_currPlayerButtons[0] & PAD_BUTTON_X) && (g_currPlayerButtons[0] & PAD_BUTTON_Y))
    {
        struct StageGoal *goal;
        int goalId;

        if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
            infoWork.playerId = modeCtrl.currPlayer;
        else
            infoWork.playerId = 0;

        goalId = 0;
        goal = decodedStageLzPtr->animGroups[0].goals;
        for (i = 0; i < decodedStageLzPtr->animGroups[0].goalCount; i++, goal++)
        {
            if (goal->type == 'B')
            {
                goalId = i;
                break;
            }
        }
        // Holding up, right, or down selects the red, green, and blue goals, respectively
        if ((g_currPlayerButtons[0] & PAD_BUTTON_UP)
         || (g_currPlayerButtons[0] & PAD_BUTTON_RIGHT)
         || (g_currPlayerButtons[0] & PAD_BUTTON_DOWN))
        {
            // fake match
            goal = ((volatile struct StageAnimGroup *)&decodedStageLzPtr->animGroups[0])->goals;
            for (i = 0; i < decodedStageLzPtr->animGroups[0].goalCount; i++, goal++)
            {
                if ((g_currPlayerButtons[0] & PAD_BUTTON_UP) && goal->type == 'R')
                {
                    goalId = i;
                    break;
                }
                if ((g_currPlayerButtons[0] & PAD_BUTTON_RIGHT) && goal->type == 'G')
                {
                    goalId = i;
                    break;
                }
                if ((g_currPlayerButtons[0] & PAD_BUTTON_DOWN) && goal->type == 'B')
                {
                    goalId = i;
                    break;
                }
            }
        }
        infoWork.goalEntered = goalId;
        infoWork.unkE = 0;
        infoWork.unk10 = ball->vel;
        infoWork.unk1C = infoWork.timerCurr;
        if (!(infoWork.flags & INFO_FLAG_BONUS_STAGE) && (g_currPlayerButtons[0] & PAD_BUTTON_LEFT))
            infoWork.unk22 = 10;

        BALL_FOREACH(
            if (!(infoWork.flags & INFO_FLAG_BONUS_STAGE))
            {
                if (!(ball->flags & BALL_FLAG_GOAL))
                {
                    ball->flags |= BALL_FLAG_GOAL;
                    ball->state = 5;
                    ball->unk150 = ball->pos;
                }
            }
            else
                ball->flags |= BALL_FLAG_13;
        )

        u_time_over_all_competition_mode_balls();
        if (!(infoWork.flags & INFO_FLAG_BONUS_STAGE))
        {
            struct PhysicsBall sp8;

            init_physball_from_ball(&ballInfo[0], &sp8);
            u_break_goal_tape(infoWork.goalEntered, &sp8);
            ball->unk12A = infoWork.timerCurr;
            u_play_sound_0(0x16);
        }
    }

    if (!(infoWork.flags & INFO_FLAG_05) && !(advDemoInfo.flags & (1 << 8)))
    {
        r23 = g_poolInfo.playerPool.statusList;
        ball = ballInfo;
        for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, r23++)
        {
            if (*r23 == 0 || *r23 == 4)
                continue;
            if (ball->flags & BALL_FLAG_11)
                continue;
            if (func_800246F4(ball) == 0)
                continue;
            switch (modeCtrl.gameType)
            {
            case GAMETYPE_MAIN_COMPETITION:
                ball->state = 19;
                ball->flags |= BALL_FLAG_11;
                ball->unk150 = ball->pos;
                break;
            case GAMETYPE_MINI_FIGHT:
                ball->flags |= BALL_FLAG_11;
                break;
            default:
                infoWork.flags |= INFO_FLAG_FALLOUT|INFO_FLAG_TIMER_PAUSED;
                ball->flags |= BALL_FLAG_11;
                func_800492FC(ball->playerId);
                break;
            }
        }
    }

    if (!(infoWork.flags & INFO_FLAG_TIMER_PAUSED) && !(dipSwitches & DIP_TIME_STOP))
    {
        infoWork.unk8++;
        if (!(infoWork.flags & INFO_FLAG_11))
            infoWork.timerCurr--;
        
        // handle time over
        if (infoWork.timerCurr <= 0)
        {
            switch (modeCtrl.gameType)
            {
            case GAMETYPE_MAIN_COMPETITION:
                if (infoWork.unk2C > 0)
                {
                    u_time_over_all_competition_mode_balls();
                    infoWork.flags |= INFO_FLAG_13;
                    break;
                }
                infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_TIMEOVER;
                func_80049368(ball->playerId);
                if (!(infoWork.flags & INFO_FLAG_BONUS_STAGE))
                    BALL_FOREACH( ball->winStreak = 0; ball->unk128++; )
                BALL_FOREACH( ball->flags |= BALL_FLAG_TIMEOVER; )
                break;
            case 4:
                infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_TIMEOVER;
                break;
            default:
                {
                    struct Ball *ball;

                    ball = currentBallStructPtr;
                    infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_TIMEOVER;
                    func_80049368(ball->playerId);
                    ball->flags |= BALL_FLAG_TIMEOVER;
                }
                break;
            }
        }
    }

    BALL_FOREACH( func_8003CB88(ball); )
}

void ev_info_dest(void)
{
    func_80023AF4();
}

static void func_80023AF4(void)
{
    int unk8 = infoWork.unk8;
    int attempts = infoWork.attempts;
    int currFloor = infoWork.currFloor;
    int livesLost = infoWork.livesLost;
    int continuesUsed = infoWork.continuesUsed;
    int u_currStageId = infoWork.u_currStageId;

    memset(&infoWork, 0, sizeof(infoWork));

    infoWork.unk8  = unk8;
    infoWork.attempts = attempts;
    infoWork.currFloor = currFloor;
    infoWork.livesLost = livesLost;
    infoWork.continuesUsed = continuesUsed;
    infoWork.u_currStageId = u_currStageId;
    infoWork.unk22 = 1;
    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
        lbl_802F1CA8 = 0;
}

BOOL check_ball_entered_goal(struct Ball *ball, u32 *outGoalId, s32 *outGoalAnimGroupId)
{
    struct PhysicsBall physBall;
    struct StageAnimGroup *stageAg;
    int goalId;
    int animGroupId;

    init_physball_from_ball(ball, &physBall);
    stageAg = decodedStageLzPtr->animGroups;
    goalId = 0;
    for (animGroupId = 0; animGroupId < decodedStageLzPtr->animGroupCount; animGroupId++, stageAg++)
    {
        if (stageAg->goalCount > 0)
        {
            struct StageGoal *goal;
            int agGoalIdx;

            if (animGroupId != physBall.animGroupId)
                tf_physball_to_anim_group_space(&physBall, animGroupId);
            goal = stageAg->goals;
            for (agGoalIdx = 0; agGoalIdx < stageAg->goalCount; agGoalIdx++, goal++)
            {
                struct ColiRect goalTrigger;

                mathutil_mtxA_from_translate(&goal->pos);
                mathutil_mtxA_rotate_z(goal->rotZ);
                mathutil_mtxA_rotate_y(goal->rotY);
                mathutil_mtxA_rotate_x(goal->rotX);
                goalTrigger.pos.x = 0.0f;
                goalTrigger.pos.y = 1.0f;
                goalTrigger.pos.z = 0.0f;
                mathutil_mtxA_tf_point(&goalTrigger.pos, &goalTrigger.pos);
                goalTrigger.rot.x = goal->rotX;
                goalTrigger.rot.y = goal->rotY;
                goalTrigger.rot.z = goal->rotZ;
                goalTrigger.width = 2.0f;
                goalTrigger.height = 2.0f;
                if (test_line_intersects_rect(&physBall.pos, &physBall.prevPos, &goalTrigger))
                {
                    *outGoalId = goalId;
                    *outGoalAnimGroupId = animGroupId;
                    return TRUE;
                }
                goalId++;
            }
        }
    }
    return FALSE;
}

void u_time_over_all_competition_mode_balls(void)
{
    if (infoWork.flags & INFO_FLAG_BONUS_STAGE)
        infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_05|INFO_FLAG_BONUS_CLEAR|INFO_FLAG_10;
    else
        infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_05|INFO_FLAG_GOAL;

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        BALL_FOREACH(
            if (!(ball->flags & BALL_FLAG_GOAL))
            {
                ball->flags |= (BALL_FLAG_08|BALL_FLAG_10);
                ball->winStreak = 0;
                ball->unk128++;
                ball->flags |= BALL_FLAG_TIMEOVER;
            }
        )
    }
}

void func_80023DB8(struct Ball *ball)
{
    int r5;

    if (ball->rank < 1 || ball->rank > 3)
        return;

    r5 = lbl_802F1CB0[ball->rank];
    if ((modeCtrl.courseFlags & (1 << 11)) && ball->winStreak > 0)
        r5 *= ball->winStreak;
    ball->unk138 = r5;
}

struct Struct801818D0
{
    float u1;
    float v1;
    float u2;
    float v2;
};

static struct Struct801818D0 rankTexOffsets[4] =
{
    {   0,  0, 160, 48 },
    {   0,  0, 160, 48 },
    {   0, 48, 128, 48 },
    { 160,  0,  88, 48 },
};

static void bonus_count_sprite_main(s8 *dummy, struct Sprite *sprite)
{
    struct Ball *ball = &ballInfo[sprite->userVar];

    sprite->opacity += (1.0f - sprite->opacity) * 0.1;
    if (sprite->bmpId >= 100)
        sprintf(sprite->text, "BONUS  +%3d", ball->unk138);
    else if (sprite->bmpId >= 10)
        sprintf(sprite->text, "BONUS  +%2d", ball->unk138);
    else
        sprintf(sprite->text, "BONUS  +%1d", ball->unk138);
}

static void bonus_banana_sprite_main(s8 *dummy, struct Sprite *sprite)
{
    sprite->opacity += (1.0f - sprite->opacity) * 0.1;
}

static void win_streak_sprite_main(s8 *dummy, struct Sprite *sprite)
{
    if (sprite->counter > 0)
        sprite->counter--;
    if (sprite->counter == 0)
    {
        if (RAND_FLOAT() < 0.01)
            sprite->counter = 45;
    }
    sprite->opacity += (1.0f - sprite->opacity) * 0.1;
    sprite->addR = mathutil_sin(sprite->counter * 0x2B8) * 255.0f;
    sprite->addG = sprite->addR;
    sprite->addB = sprite->addR;
}

void rank_icon_sprite_main(s8 *dummy, struct Sprite *sprite)
{
    sprite->counter++;
    if (sprite->counter <= 15)
    {
        sprite->scaleX = 1.0 + 0.2f * (15.0f - sprite->counter);
        sprite->scaleY = sprite->scaleX;
        sprite->opacity = sprite->counter * 0.066666;
    }
    if (sprite->counter > 60 && sprite->counter < 0x69)
        sprite->y -= 1.0f;
    if (sprite->userVar != 0 && sprite->counter == 0x78)
    {
        struct Ball *ball = &ballInfo[sprite->bmpId];
        struct Viewport *vp = &cameraInfo[ball->playerId].sub28.vp;
        struct Sprite *countSprite = create_sprite();
        struct Sprite *bananaSprite;

        if (countSprite != NULL)
        {
            countSprite->x = (vp->left + vp->width * 0.5) * 640.0;
            countSprite->y = (vp->top + vp->height * 0.5) * 480.0;
            countSprite->fontId = FONT_JAP_24x24_2;
            countSprite->textAlign = ALIGN_CC;
            countSprite->userVar = ball->playerId;
            countSprite->mulR = 255;
            countSprite->mulG = 255;
            countSprite->mulB = 0;
            countSprite->opacity = 0.0f;
            countSprite->bmpId = ball->unk138;  //! Huh? This is a text sprite
            countSprite->mainFunc = bonus_count_sprite_main;
            sprintf(countSprite->text, "BONUS  +000", ball->unk138);  //! bad format
            bananaSprite = create_linked_sprite(countSprite);
            if (bananaSprite != NULL)
            {
                bananaSprite->type = SPRITE_TYPE_BITMAP;
                bananaSprite->x = -140.0f;
                if (ball->unk138 < 10)
                    bananaSprite->x += 48.0f;
                else if (ball->unk138 < 100)
                    bananaSprite->x += 24.0f;
                bananaSprite->y = -2.0f;
                bananaSprite->bmpId = BMP_COM_banana_01;
                bananaSprite->textAlign = ALIGN_CC;
                bananaSprite->scaleX = 0.3f;
                bananaSprite->scaleY = 0.3f;
                bananaSprite->opacity = 0.0f;
                bananaSprite->mainFunc = bonus_banana_sprite_main;
                sprintf(bananaSprite->text, "bonus banana.pic");
            }
        }
        if ((modeCtrl.courseFlags & (1 << 11)) && ball->winStreak > 1)
        {
            struct Sprite *sprite = create_sprite();

            if (sprite != NULL)
            {
                sprite->x = (vp->left + vp->width * 0.5) * 640.0 + 130.0;
                sprite->y = (vp->top + vp->height * 0.5) * 480.0 + 21.0;
                sprite->fontId = FONT_ASC_20x20P;
                sprite->textAlign = ALIGN_CC;
                sprite->mulR = 255;
                sprite->mulG = 192;
                sprite->mulB = 0;
                sprite->opacity = 0.0f;
                sprite->scaleX = 0.45f;
                sprite->scaleY = 0.7f;
                sprite->counter = 45;
                sprite->mainFunc = win_streak_sprite_main;
                sprintf(sprite->text, "STRAIGHT\n VICTORIES X %d", ball->winStreak);
            }
        }
    }
}

static void rank_icon_sprite_draw(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    struct Struct801818D0 *r6;
    struct TPLTextureHeader *tex;

    params.bmpId = BMP_NML_game_rank;
    params.rotation = sprite->rotation;
    params.opacity = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->flags & ~0xF) | 0xA;
    params.mulColor = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (u8)(sprite->opacity * 255.0f));
    params.addColor = RGBA(sprite->addR, sprite->addG, sprite->addB, 0);
    r6 = &rankTexOffsets[sprite->userVar];
    tex = &bitmapGroups[(params.bmpId >> 8) & 0xFF].tpl->texHeaders[params.bmpId & 0xFF];
    params.x = sprite->x;
    params.y = sprite->y;
    params.z = sprite->unk4C;
    params.u1 = r6->u1 / tex->width;
    params.v1 = r6->v1 / tex->height;
    params.u2 = params.u1 + r6->u2 / tex->width;
    params.v2 = params.v1 + r6->v2 / tex->height;
    params.scaleX = (params.u2 - params.u1) * sprite->scaleX;
    params.scaleY = (params.v2 - params.v1) * sprite->scaleY;
    draw_naomi_sprite(&params);
}

void create_rank_icon(struct Ball *ball)
{
    struct Viewport *vp;
    struct Sprite *rankIcon;

    if (ball->rank == 0)
        return;
    vp = &cameraInfo[ball->playerId].sub28.vp;
    rankIcon = create_sprite();
    if (rankIcon == NULL)
        return;
    rankIcon->x = (vp->left + vp->width * 0.5) * 640.0;
    rankIcon->y = (vp->top + vp->height * 0.5) * 480.0;
    rankIcon->type = 1;
    rankIcon->textAlign = ALIGN_CC;
    rankIcon->userVar = ball->rank;
    rankIcon->bmpId = ball->playerId;
    rankIcon->counter = 0;
    rankIcon->mainFunc = rank_icon_sprite_main;
    rankIcon->drawFunc = rank_icon_sprite_draw;
    strcpy(rankIcon->text, "ranking");
}

void func_800245E4(struct Ball *ball, int goalId, int c)
{
    infoWork.goalEntered = goalId;
    infoWork.unkE = c;
    infoWork.unk10 = ball->vel;
    infoWork.unk1C = infoWork.timerCurr;
    if (c > 0)
    {
        struct AnimGroupInfo *r29 = &animGroups[c];
        struct StageGoal *goal = &decodedStageLzPtr->goals[goalId];
        Vec sp20;
        Vec sp14;

        mathutil_mtxA_from_mtx(r29->prevTransform);
        mathutil_mtxA_tf_point(&goal->pos, &sp14);
        mathutil_mtxA_from_mtx(r29->transform);
        mathutil_mtxA_tf_point(&goal->pos, &sp20);

        infoWork.unk10.x += sp14.x - sp20.x;
        infoWork.unk10.y += sp14.y - sp20.y;
        infoWork.unk10.z += sp14.z - sp20.z;
    }
}

#pragma force_active on
int func_800246F4(struct Ball *ball)
{
    struct PhysicsBall sp18;
    struct StageAnimGroup *r30;
    int i;

    if (ball->pos.y < *decodedStageLzPtr->pFallOutY)
        return 1;
    init_physball_from_ball(ball, &sp18);
    r30 = decodedStageLzPtr->animGroups;
    for (i = 0; i < decodedStageLzPtr->animGroupCount; i++, r30++)
    {
        struct StageCollHdr_child2 *r28;
        int j;

        if (i != sp18.animGroupId)
            tf_physball_to_anim_group_space(&sp18, i);
        r28 = r30->unk88;
        for (j = 0; j < r30->unk84; j++, r28++)
        {
            Vec spC;

            mathutil_mtxA_from_translate(&r28->unk0);
            mathutil_mtxA_rotate_z(r28->unk1C);
            mathutil_mtxA_rotate_y(r28->unk1A);
            mathutil_mtxA_rotate_x(r28->unk18);
            mathutil_mtxA_rigid_inv_tf_point(&sp18.pos, &spC);
            spC.x /= r28->unkC.x;
            spC.y /= r28->unkC.y;
            spC.z /= r28->unkC.z;
            if (spC.x < -0.5 || spC.x > 0.5)
                continue;
            if (spC.y < -0.5 || spC.y > 0.5)
                continue;
            if (spC.z < -0.5 || spC.z > 0.5)
                continue;
            return 1;
        }
    }
    return 0;
}

// for time bonus?
void func_80024860(struct Ball *ball)
{
    lbl_802F1DFC = ball->ape->charaId;
    lbl_802F1DF8 = ball->playerId;
    if (infoWork.timerCurr > (infoWork.timerMax >> 1))
    {
        if (infoWork.unk22 != 1)
            u_play_sound_0(0x2859);
        else
            u_play_sound_0(0x2858);
    }
    else
        u_play_sound_0(0x281B);
}
