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
#include "input.h"
#include "info.h"
#include "item.h"
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"
#include "stage.h"
#include "stcoli.h"

s8 lbl_802F1CB0[8];
s32 lbl_802F1CAC;
s32 lbl_802F1CA8;

struct Struct801F3A58 infoWork;

void func_80022F14(void)
{
    infoWork.unk8 = 0;
    infoWork.unk1E = 1;
    infoWork.unk20 = 1;
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
    if (modeCtrl.levelSetFlags & 1)
        infoWork.timerCurr = g_get_stage_time_limit();
    if (gameSubmode == SMD_ADV_INFO_INIT)
        infoWork.timerCurr = 90 * 60;
    if (gameSubmode == SMD_GAME_NAMEENTRY_READY_INIT)
        infoWork.timerCurr = 60 * 60;
    infoWork.timerMax = infoWork.timerCurr;

    if (is_bonus_stage(currStageId))
        infoWork.flags |= INFO_FLAG_BONUS_STAGE;
    if (func_80067264(modeCtrl.levelSet, infoWork.unk20, modeCtrl.levelSetFlags) != 0)
        infoWork.flags |= (1 << 12);
}

void ev_info_main(void)
{
    s8 *r23;
    int i;
    struct Ball *ballBackup;
    int r20;
    struct Ball *ball;
    struct ReplayInfo spC8;
    struct PhysicsBall sp6C;

    if (gamePauseStatus & 0xA)
        return;

    // handle goal
    ballBackup = currentBallStructPtr;
    ball = ballInfo;
    r23 = spritePoolInfo.unkC;
    r20 = 0;
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r23++)
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
            if (ball->flags & (1 << 24))
            {
                g_get_replay_info(lbl_80250A68.unk0[ball->playerId], &spC8);
                if (!(spC8.flags & 1))
                    continue;
            }
            if (ball->flags & (1 << 24))
            {
                infoWork.flags &= -2065;
                ball->flags |= BALL_FLAG_GOAL;
                ball->state = 5;
                ball->unk150 = ball->pos;
            }
            if (!(ball->flags & BALL_FLAG_GOAL) && !(infoWork.flags & (1 << 5)))
            {
                func_8004923C(0x5A);
                infoWork.flags &= -2065;
                r20++;
                ball->flags |= BALL_FLAG_GOAL;
                ball->state = 5;
                ball->unk150 = ball->pos;
                cameraInfo[i].state = 14;
                if (r20 == 1)
                    infoWork.unk2C++;
                if (!(infoWork.flags & (1 << 4)) && !(infoWork.flags & (1 << 6)))
                {
                    ball->rank = infoWork.unk2C;
                    if (ball->rank == 1)
                    {
                        ball->unk126++;
                        ball->unk128 = 0;
                    }
                    else if (ball->rank == modeCtrl.playerCount)
                    {
                        ball->unk126 = 0;
                        ball->unk128++;
                    }
                    else
                    {
                        ball->unk126 = 0;
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
            g_break_goal_tape(goalId, &sp6C);
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
                g_get_replay_info(lbl_80250A68.unk0[ball->playerId], &spC8);
                if (!(spC8.flags & 1))
                    break;
            }
            infoWork.flags &= -2065;
            ball->flags |= BALL_FLAG_GOAL;
            ball->state = BALL_STATE_GOAL_INIT;
            if (!(infoWork.flags & (1 << 5)))
            {
                g_time_over_all_competition_mode_balls();
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
            g_break_goal_tape(goalId, &sp6C);
            ball->unk12A = infoWork.timerCurr;
            func_80024860(ball);
            break;
        }
    }
    if (r20 > 1)
        infoWork.unk2C += r20 - 1;
    if (r20 > 0 && infoWork.unk2C >= modeCtrl.playerCount - 1)
        g_time_over_all_competition_mode_balls();
    currentBallStructPtr = ballBackup;

    infoWork.unk24 = 0;

    {
        struct Item *item = itemInfo;
        s8 *r7 = spritePoolInfo.unk1C;

        for (i = 0; i < spritePoolInfo.unk18; item++, i++, r7++)
        {
            if (*r7 != 0 && *r7 != 3 && item->type == 0 && (item->flags & (1 << 1)))
                infoWork.unk24++;
        }
    }

    if ((infoWork.flags & (1 << 6))
     && !(infoWork.flags & (1 << 5))
     && infoWork.unk24 == 0)
    {
        infoWork.flags |= 0x228;
        func_800493C4(ball->playerId);
        BALL_FOREACH( ball->flags |= 0x2000; )
    }

    if (!(infoWork.flags & (1 << 5))
     && !(infoWork.flags & (1 << 3))
     && (dipSwitches & DIP_DEBUG)
     && ((infoWork.flags & (1 << 6)) || decodedStageLzPtr->goals != NULL)
     && (lbl_801F3D88[0] & (1 << 10))
     && (lbl_801F3D88[0] & (1 << 11)))
    {
        struct StageGoal *r7;
        int r9;

        if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
            infoWork.playerId = modeCtrl.currPlayer;
        else
            infoWork.playerId = 0;

        r9 = 0;
        r7 = decodedStageLzPtr->animGroups[0].goals;
        for (i = 0; i < decodedStageLzPtr->animGroups[0].goalCount; i++, r7++)
        {
            if (r7->type == 0x42)
            {
                r9 = i;
                break;
            }
        }
        if ((lbl_801F3D88[0] & (1 << 3))
         || (lbl_801F3D88[0] & (1 << 1))
         || (lbl_801F3D88[0] & (1 << 2)))
        {
            // fake match
            r7 = ((volatile struct StageAnimGroup *)&decodedStageLzPtr->animGroups[0])->goals;
            for (i = 0; i < decodedStageLzPtr->animGroups[0].goalCount; i++, r7++)
            {
                if ((lbl_801F3D88[0] & (1 << 3)) && r7->type == 'R')
                {
                    r9 = i;
                    break;
                }
                if ((lbl_801F3D88[0] & (1 << 1)) && r7->type == 'G')
                {
                    r9 = i;
                    break;
                }
                if ((lbl_801F3D88[0] & (1 << 2)) && r7->type == 'B')
                {
                    r9 = i;
                    break;
                }
            }
        }
        infoWork.unkC = r9;
        infoWork.unkE = 0;
        infoWork.unk10 = ball->vel;
        infoWork.unk1C = infoWork.timerCurr;
        if (!(infoWork.flags & (1 << 6)) && (lbl_801F3D88[0] & 1))
            infoWork.unk22 = 10;

        BALL_FOREACH(
            if (!(infoWork.flags & (1 << 6)))
            {
                if (!(ball->flags & (1 << 12)))
                {
                    ball->flags |= 0x1000;
                    ball->state = 5;
                    ball->unk150 = ball->pos;
                }
            }
            else
                ball->flags |= 0x2000;
        )

        g_time_over_all_competition_mode_balls();
        if (!(infoWork.flags & (1 << 6)))
        {
            struct PhysicsBall sp8;

            init_physball_from_ball(&ballInfo[0], &sp8);
            g_break_goal_tape(infoWork.unkC, &sp8);
            ball->unk12A = infoWork.timerCurr;
            g_play_sound(0x16);
        }
    }

    if (!(infoWork.flags & (1 << 5)) && !(advDemoInfo.flags & (1 << 8)))
    {
        r23 = spritePoolInfo.unkC;
        ball = ballInfo;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r23++)
        {
            if (*r23 == 0 || *r23 == 4)
                continue;
            if (ball->flags & (1 << 11))
                continue;
            if (func_800246F4(ball) == 0)
                continue;
            switch (modeCtrl.gameType)
            {
            case GAMETYPE_MAIN_COMPETITION:
                ball->state = 19;
                ball->flags |= 0x800;
                ball->unk150 = ball->pos;
                break;
            case GAMETYPE_MINI_FIGHT:
                ball->flags |= 0x800;
                break;
            default:
                infoWork.flags |= 0xC;
                ball->flags |= 0x800;
                func_800492FC(ball->playerId);
                break;
            }
        }
    }

    if (!(infoWork.flags & (1 << 3)) && !(dipSwitches & DIP_TIME_STOP))
    {
        infoWork.unk8++;
        if (!(infoWork.flags & (1 << 11)))
            infoWork.timerCurr--;
        
        // handle time over
        if (infoWork.timerCurr <= 0)
        {
            switch (modeCtrl.gameType)
            {
            case GAMETYPE_MAIN_COMPETITION:
                if (infoWork.unk2C > 0)
                {
                    g_time_over_all_competition_mode_balls();
                    infoWork.flags |= 0x2000;
                    break;
                }
                infoWork.flags |= 8 | INFO_FLAG_TIMEOVER;
                func_80049368(ball->playerId);
                if (!(infoWork.flags & (1 << 6)))
                    BALL_FOREACH( ball->unk126 = 0; ball->unk128++; )
                BALL_FOREACH( ball->flags |= BALL_FLAG_TIMEOVER; )
                break;
            case 4:
                infoWork.flags |= INFO_FLAG_TIMEOVER | (1 << 3);
                break;
            default:
                {
                    struct Ball *ball;

                    ball = currentBallStructPtr;
                    infoWork.flags |= INFO_FLAG_TIMEOVER | (1 << 3);
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

void func_80023AF4(void)
{
    int unk8 = infoWork.unk8;
    int unk1E = infoWork.unk1E;
    int unk20 = infoWork.unk20;
    int livesLost = infoWork.livesLost;
    int continuesUsed = infoWork.continuesUsed;
    int unk2E = infoWork.unk2E;

    memset(&infoWork, 0, sizeof(infoWork));

    infoWork.unk8  = unk8;
    infoWork.unk1E = unk1E;
    infoWork.unk20 = unk20;
    infoWork.livesLost = livesLost;
    infoWork.continuesUsed = continuesUsed;
    infoWork.unk2E = unk2E;
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

void g_time_over_all_competition_mode_balls(void)
{
    if (infoWork.flags & (1 << 6))
        infoWork.flags |= 0x628;
    else
        infoWork.flags |= (1 << 5) | (1 << 3) | INFO_FLAG_GOAL;

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        BALL_FOREACH(
            if (!(ball->flags & BALL_FLAG_GOAL))
            {
                ball->flags |= 0x500;
                ball->unk126 = 0;
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
    if ((modeCtrl.levelSetFlags & (1 << 11)) && ball->unk126 > 0)
        r5 *= ball->unk126;
    ball->unk138 = r5;
}

struct Struct801818D0
{
    float u1;
    float v1;
    float u2;
    float v2;
};

struct Struct801818D0 rankTexOffsets[4] =
{
    {   0,  0, 160, 48 },
    {   0,  0, 160, 48 },
    {   0, 48, 128, 48 },
    { 160,  0,  88, 48 },
};

void lbl_80023E0C(s8 *dummy, struct Sprite *sprite)
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

void lbl_80023EBC(s8 *dummy, struct Sprite *sprite)
{
    sprite->opacity += (1.0f - sprite->opacity) * 0.1;
}

void lbl_80023EE0(s8 *dummy, struct Sprite *sprite)
{
    if (sprite->counter > 0)
        sprite->counter--;
    if (sprite->counter == 0)
    {
        if ((rand() / 32767.0f) < 0.01)
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
        struct Sprite *r28 = create_sprite();
        struct Sprite *r5;

        if (r28 != NULL)
        {
            r28->x = (vp->left + vp->width * 0.5) * 640.0;
            r28->y = (vp->top + vp->height * 0.5) * 480.0;
            r28->fontId = FONT_JAP_24x24_2;
            r28->textAlign = ALIGN_CC;
            r28->userVar = ball->playerId;
            r28->mulR = 255;
            r28->mulG = 255;
            r28->mulB = 0;
            r28->opacity = 0.0f;
            r28->bmpId = ball->unk138;
            r28->mainFunc = lbl_80023E0C;
            sprintf(r28->text, "BONUS  +000", ball->unk138);  //! bad format
            r5 = create_linked_sprite(r28);
            if (r5 != NULL)
            {
                r5->type = 1;
                r5->x = -140.0f;
                if (ball->unk138 < 10)
                    r5->x += 48.0f;
                else if (ball->unk138 < 100)
                    r5->x += 24.0f;
                r5->y = -2.0f;
                r5->bmpId = BMP_COM_banana_01;
                r5->textAlign = ALIGN_CC;
                r5->scaleX = 0.3f;
                r5->scaleY = 0.3f;
                r5->opacity = 0.0f;
                r5->mainFunc = lbl_80023EBC;
                sprintf(r5->text, "bonus banana.pic");
            }
        }
        if ((modeCtrl.levelSetFlags & (1 << 11)) && ball->unk126 > 1)
        {
            struct Sprite *r11 = create_sprite();

            if (r11 != NULL)
            {
                r11->x = (vp->left + vp->width * 0.5) * 640.0 + 130.0;
                r11->y = (vp->top + vp->height * 0.5) * 480.0 + 21.0;
                r11->fontId = FONT_ASC_20x20P;
                r11->textAlign = ALIGN_CC;
                r11->mulR = 255;
                r11->mulG = 192;
                r11->mulB = 0;
                r11->opacity = 0.0f;
                r11->scaleX = 0.45f;
                r11->scaleY = 0.7f;
                r11->counter = 45;
                r11->mainFunc = lbl_80023EE0;
                sprintf(r11->text, "STRAIGHT\n VICTORIES X %d", ball->unk126);
            }
        }
    }
}

void rank_icon_sprite_draw(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    struct Struct801818D0 *r6;
    struct TPLTextureHeader *tex;

    params.bmpId = BMP_NML_game_rank;
    params.rotation = sprite->rotation;
    params.opacity = sprite->opacity;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & ~0xF) | 0xA;
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
    infoWork.unkC = goalId;
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
            g_play_sound(0x2859);
        else
            g_play_sound(0x2858);
    }
    else
        g_play_sound(0x281B);
}
