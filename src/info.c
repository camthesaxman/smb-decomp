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
u32 lbl_802F1CAC;
u32 lbl_802F1CA8;

struct Struct801F3A58 infoWork;

void func_80022F14(void)
{
    infoWork.unk8 = 0;
    infoWork.unk1E = 1;
    infoWork.unk20 = 1;
    infoWork.unk28 = 0;
    infoWork.unk2A = 0;
    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
    {
        lbl_802F1CAC = 0;
        lbl_802F1CA8 = 0;
    }
}

u32 lbl_801F3A8C[4];                    FORCE_BSS_ORDER(lbl_801F3A8C)
struct Struct801F3A58 lbl_801F3A9C[4];  FORCE_BSS_ORDER(lbl_801F3A9C)

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

    if (func_800672D0(currStageId) != 0)
        infoWork.unk0 |= (1 << 6);
    if (func_80067264(modeCtrl.levelSet, infoWork.unk20, modeCtrl.levelSetFlags) != 0)
        infoWork.unk0 |= (1 << 12);
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
        if (!check_ball_in_goal(ball, &goalId, &sp64))
            continue;
        infoWork.unk30 = ball->unk2E;
        switch (modeCtrl.gameType)
        {
        case GAMETYPE_MAIN_COMPETITION:
            if (ball->flags & (1 << 24))
            {
                g_get_replay_info(lbl_80250A68.unk0[ball->unk2E], &spC8);
                if (!(spC8.flags & 1))
                    continue;
            }
            if (ball->flags & (1 << 24))
            {
                infoWork.unk0 &= -2065;
                ball->flags |= BALL_FLAG_GOAL;
                ball->state = 5;
                ball->unk150 = ball->pos;
            }
            if (!(ball->flags & BALL_FLAG_GOAL) && !(infoWork.unk0 & (1 << 5)))
            {
                func_8004923C(0x5A);
                infoWork.unk0 &= -2065;
                r20++;
                ball->flags |= BALL_FLAG_GOAL;
                ball->state = 5;
                ball->unk150 = ball->pos;
                cameraInfo[i].state = 14;
                if (r20 == 1)
                    infoWork.unk2C++;
                if (!(infoWork.unk0 & (1 << 4)) && !(infoWork.unk0 & (1 << 6)))
                {
                    ball->unk2F = infoWork.unk2C;
                    if (ball->unk2F == 1)
                    {
                        ball->unk126++;
                        ball->unk128 = 0;
                    }
                    else if (ball->unk2F == modeCtrl.playerCount)
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
                func_80049268(ball->unk2E);
            }
            func_8003CA98(ball, &sp6C);
            if (sp64 != sp6C.itemgroupId)
                tf_physball_to_itemgroup_space(&sp6C, sp64);
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
                g_get_replay_info(lbl_80250A68.unk0[ball->unk2E], &spC8);
                if (!(spC8.flags & 1))
                    break;
            }
            infoWork.unk0 &= -2065;
            ball->flags |= BALL_FLAG_GOAL;
            ball->state = BALL_STATE_GOAL_INIT;
            if (!(infoWork.unk0 & (1 << 5)))
            {
                g_time_over_all_competition_mode_balls();
                func_800245E4(ball, goalId, sp64);
                if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
                    func_800AEDDC();
            }
            func_80049268(ball->unk2E);
            if (gameSubmode == SMD_ADV_GAME_PLAY_MAIN)
                infoWork.unk0 |= INFO_FLAG_GOAL;
            func_8003CA98(ball, &sp6C);
            if (sp64 != sp6C.itemgroupId)
                tf_physball_to_itemgroup_space(&sp6C, sp64);
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
        struct Item *r4 = itemInfo;
        s8 *r7 = spritePoolInfo.unk1C;

        for (i = 0; i < spritePoolInfo.unk18; r4++, i++, r7++)
        {
            if (*r7 != 0 && *r7 != 3 && r4->type == 0 && (r4->unk8 & (1 << 1)))
                infoWork.unk24++;
        }
    }

    if ((infoWork.unk0 & (1 << 6))
     && !(infoWork.unk0 & (1 << 5))
     && infoWork.unk24 == 0)
    {
        struct Ball *r3;
        struct Ball *r4;
        s8 *r5;
        int i;

        infoWork.unk0 |= 0x228;
        func_800493C4(ball->unk2E);
        r4 = currentBallStructPtr;
        r5 = spritePoolInfo.unkC;
        r3 = ballInfo;
        for (i = 0; i < spritePoolInfo.unk8; i++, r3++, r5++)
        {
            if (*r5 == 2)
            {
                currentBallStructPtr = r3;
                r3->flags |= 0x2000;
            }
        }
        currentBallStructPtr = r4;
    }

    if (!(infoWork.unk0 & (1 << 5))
     && !(infoWork.unk0 & (1 << 3))
     && (dipSwitches & DIP_DEBUG)
     && ((infoWork.unk0 & (1 << 6)) || decodedStageLzPtr->goals != NULL)
     && (lbl_801F3D88[0] & (1 << 10))
     && (lbl_801F3D88[0] & (1 << 11)))
    {
        struct StageGoal *r7;
        int r9;

        if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
            infoWork.unk30 = modeCtrl.unk2C;
        else
            infoWork.unk30 = 0;

        r9 = 0;
        r7 = decodedStageLzPtr->itemgroups[0].goals;
        for (i = 0; i < decodedStageLzPtr->itemgroups[0].goalCount; i++, r7++)
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
            r7 = ((volatile struct StageItemgroup *)&decodedStageLzPtr->itemgroups[0])->goals;
            for (i = 0; i < decodedStageLzPtr->itemgroups[0].goalCount; i++, r7++)
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
        if (!(infoWork.unk0 & (1 << 6)) && (lbl_801F3D88[0] & 1))
            infoWork.unk22 = 10;

        {
            struct Ball *r4;
            struct Ball *r5;
            s8 *r6;
            int i;

            r5 = currentBallStructPtr;
            r6 = spritePoolInfo.unkC;
            r4 = ballInfo;
            for (i = 0; i < spritePoolInfo.unk8; i++, r4++, r6++)
            {
                if (*r6 != 2)
                    continue;
                currentBallStructPtr = r4;
                if (!(infoWork.unk0 & (1 << 6)))
                {
                    if (!(r4->flags & (1 << 12)))
                    {
                        r4->flags |= 0x1000;
                        r4->state = 5;
                        r4->unk150 = r4->pos;
                    }
                }
                else
                    r4->flags |= 0x2000;
            }
            currentBallStructPtr = r5;
        }

        g_time_over_all_competition_mode_balls();
        if (!(infoWork.unk0 & (1 << 6)))
        {
            struct PhysicsBall sp8;

            func_8003CA98(&ballInfo[0], &sp8);
            g_break_goal_tape(infoWork.unkC, &sp8);
            ball->unk12A = infoWork.timerCurr;
            g_play_sound(0x16);
        }
    }

    if (!(infoWork.unk0 & (1 << 5)) && !(advDemoInfo.flags & (1 << 8)))
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
                infoWork.unk0 |= 0xC;
                ball->flags |= 0x800;
                func_800492FC(ball->unk2E);
                break;
            }
        }
    }

    if (!(infoWork.unk0 & (1 << 3)) && !(dipSwitches & DIP_TIME_STOP))
    {
        infoWork.unk8++;
        if (!(infoWork.unk0 & (1 << 11)))
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
                    infoWork.unk0 |= 0x2000;
                    break;
                }
                infoWork.unk0 |= 8 | INFO_FLAG_TIMEOVER;
                func_80049368(ball->unk2E);
                if (!(infoWork.unk0 & (1 << 6)))
                {
                    struct Ball *ball = ballInfo;
                    struct Ball *ballBackup = currentBallStructPtr;
                    s8 *r7 = spritePoolInfo.unkC;
                    int i;

                    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r7++)
                    {
                        if (*r7 == 2)
                        {
                            currentBallStructPtr = ball;
                            ball->unk126 = 0;
                            ball->unk128++;
                        }
                    }
                    currentBallStructPtr = ballBackup;
                }

                {
                    struct Ball *ball;
                    struct Ball *ballBackup;
                    s8 *r5;
                    int i;

                    ballBackup = currentBallStructPtr;
                    r5 = spritePoolInfo.unkC;
                    ball = ballInfo;
                    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r5++)
                    {
                        if (*r5 == 2)
                        {
                            currentBallStructPtr = ball;
                            ball->flags |= BALL_FLAG_TIMEOVER;
                        }
                    }
                    currentBallStructPtr = ballBackup;
                }

                break;
            case 4:
                infoWork.unk0 |= INFO_FLAG_TIMEOVER | (1 << 3);
                break;
            default:
                {
                    struct Ball *ball;

                    ball = currentBallStructPtr;
                    infoWork.unk0 |= INFO_FLAG_TIMEOVER | (1 << 3);
                    func_80049368(ball->unk2E);
                    ball->flags |= BALL_FLAG_TIMEOVER;
                }
                break;
            }
        }
    }

    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *r22;
        int i;

        ballBackup = currentBallStructPtr;
        ball = ballInfo;
        r22 = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r22++)
        {
            if (*r22 == 2)
            {
                currentBallStructPtr = ball;
                func_8003CB88(ball);
            }
        }
        currentBallStructPtr = ballBackup;
    }
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
    int unk28 = infoWork.unk28;
    int unk2A = infoWork.unk2A;
    int unk2E = infoWork.unk2E;

    memset(&infoWork, 0, sizeof(infoWork));

    infoWork.unk8  = unk8;
    infoWork.unk1E = unk1E;
    infoWork.unk20 = unk20;
    infoWork.unk28 = unk28;
    infoWork.unk2A = unk2A;
    infoWork.unk2E = unk2E;
    infoWork.unk22 = 1;
    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
        lbl_802F1CA8 = 0;
}

int check_ball_in_goal(struct Ball *ball, u32 *goalIdPtr, s32 *c)
{
    struct PhysicsBall sp3C;
    struct StageItemgroup *r27;
    int goalId;
    int i;

    func_8003CA98(ball, &sp3C);
    r27 = decodedStageLzPtr->itemgroups;
    goalId = 0;
    for (i = 0; i < decodedStageLzPtr->itemgroupCount; i++, r27++)
    {
        if (r27->goalCount > 0)
        {
            struct StageGoal *r24;
            int j;

            if (i != sp3C.itemgroupId)
                tf_physball_to_itemgroup_space(&sp3C, i);
            r24 = r27->goals;
            for (j = 0; j < r27->goalCount; j++, r24++)
            {
                struct Struct8003F890 sp14;

                mathutil_mtxA_from_translate(&r24->pos);
                mathutil_mtxA_rotate_z(r24->rotZ);
                mathutil_mtxA_rotate_y(r24->rotY);
                mathutil_mtxA_rotate_x(r24->rotX);
                sp14.unk0.x = 0.0f;
                sp14.unk0.y = 1.0f;
                sp14.unk0.z = 0.0f;
                mathutil_mtxA_tf_point(&sp14.unk0, &sp14.unk0);
                sp14.unkC = r24->rotX;
                sp14.unkE = r24->rotY;
                sp14.unk10 = r24->rotZ;
                sp14.unk20 = 2.0f;
                sp14.unk24 = 2.0f;
                if (test_line_intersects_rect(&sp3C.pos, &sp3C.prevPos, &sp14) != 0)
                {
                    *goalIdPtr = goalId;
                    *c = i;
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
    if (infoWork.unk0 & (1 << 6))
        infoWork.unk0 |= 0x628;
    else
        infoWork.unk0 |= (1 << 5) | (1 << 3) | INFO_FLAG_GOAL;

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        struct Ball *ball;
        struct Ball *ballBackup;
        s8 *r8;
        int i;

        ballBackup = currentBallStructPtr;
        r8 = spritePoolInfo.unkC;
        ball = ballInfo;
        for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r8++)
        {
            if (*r8 != 2)
                continue;
            currentBallStructPtr = ball;
            if (!(ball->flags & BALL_FLAG_GOAL))
            {
                ball->flags |= 0x500;
                ball->unk126 = 0;
                ball->unk128++;
                ball->flags |= BALL_FLAG_TIMEOVER;
            }
        }
        currentBallStructPtr = ballBackup;
    }
}

void func_80023DB8(struct Ball *ball)
{
    int r5;

    if (ball->unk2F < 1 || ball->unk2F > 3)
        return;

    r5 = lbl_802F1CB0[ball->unk2F];
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

void lbl_80023E0C(int dummy, struct Sprite *sprite)
{
    struct Ball *ball = &ballInfo[sprite->unk48];

    sprite->unk6C += (1.0f - sprite->unk6C) * 0.1;
    if (sprite->bmpId >= 100)
        sprintf(sprite->text, "BONUS  +%3d", ball->unk138);
    else if (sprite->bmpId >= 10)
        sprintf(sprite->text, "BONUS  +%2d", ball->unk138);
    else
        sprintf(sprite->text, "BONUS  +%1d", ball->unk138);
}

void lbl_80023EBC(int dummy, struct Sprite *sprite)
{
    sprite->unk6C += (1.0f - sprite->unk6C) * 0.1;
}

void lbl_80023EE0(int dummy, struct Sprite *sprite)
{
    if (sprite->unk10 > 0)
        sprite->unk10--;
    if (sprite->unk10 == 0)
    {
        if ((rand() / 32767.0f) < 0.01)
            sprite->unk10 = 45;
    }
    sprite->unk6C += (1.0f - sprite->unk6C) * 0.1;
    sprite->unk70 = mathutil_sin(sprite->unk10 * 0x2B8) * 255.0f;
    sprite->unk71 = sprite->unk70;
    sprite->unk72 = sprite->unk70;
}

void rank_icon_main(int dummy, struct Sprite *sprite)
{
    sprite->unk10++;
    if (sprite->unk10 <= 15)
    {
        sprite->unk40 = 1.0 + 0.2f * (15.0f - sprite->unk10);
        sprite->unk44 = sprite->unk40;
        sprite->unk6C = sprite->unk10 * 0.066666;
    }
    if (sprite->unk10 > 60 && sprite->unk10 < 0x69)
        sprite->centerY -= 1.0f;
    if (sprite->unk48 != 0 && sprite->unk10 == 0x78)
    {
        struct Ball *ball = &ballInfo[sprite->bmpId];
        struct Viewport *vp = &cameraInfo[ball->unk2E].sub28.vp;
        struct Sprite *r28 = create_sprite();
        struct Sprite *r5;

        if (r28 != NULL)
        {
            r28->centerX = (vp->left + vp->width * 0.5) * 640.0;
            r28->centerY = (vp->top + vp->height * 0.5) * 480.0;
            r28->fontId = 0xB0;
            r28->textAlign = ALIGN_CC;
            r28->unk48 = ball->unk2E;
            r28->unkC = 0xFF;
            r28->unkD = 0xFF;
            r28->unkE = 0;
            r28->unk6C = 0.0f;
            r28->bmpId = ball->unk138;
            r28->mainFunc = lbl_80023E0C;
            sprintf(r28->text, "BONUS  +000", ball->unk138);  //! bad format
            r5 = create_linked_sprite(r28);
            if (r5 != NULL)
            {
                r5->type = 1;
                r5->centerX = -140.0f;
                if (ball->unk138 < 10)
                    r5->centerX += 48.0f;
                else if (ball->unk138 < 100)
                    r5->centerX += 24.0f;
                r5->centerY = -2.0f;
                r5->bmpId = BITMAP_ID(BMP_COM, BMP_COM_banana_01);
                r5->textAlign = ALIGN_CC;
                r5->unk40 = 0.3f;
                r5->unk44 = 0.3f;
                r5->unk6C = 0.0f;
                r5->mainFunc = lbl_80023EBC;
                sprintf(r5->text, "bonus banana.pic");
            }
        }
        if ((modeCtrl.levelSetFlags & (1 << 11)) && ball->unk126 > 1)
        {
            struct Sprite *r11 = create_sprite();

            if (r11 != NULL)
            {
                r11->centerX = (vp->left + vp->width * 0.5) * 640.0 + 130.0;
                r11->centerY = (vp->top + vp->height * 0.5) * 480.0 + 21.0;
                r11->fontId = 0x63;
                r11->textAlign = ALIGN_CC;
                r11->unkC = 0xFF;
                r11->unkD = 0xC0;
                r11->unkE = 0;
                r11->unk6C = 0.0f;
                r11->unk40 = 0.45f;
                r11->unk44 = 0.7f;
                r11->unk10 = 0x2D;
                r11->mainFunc = lbl_80023EE0;
                sprintf(r11->text, "STRAIGHT\n VICTORIES X %d", ball->unk126);
            }
        }
    }
}

void lbl_80024324(struct Sprite *sprite)
{
    struct NaomiSpriteParams params;
    struct Struct801818D0 *r6;
    struct TPLTextureHeader *tex;

    params.bmpId = BITMAP_ID(BMP_NML, BMP_NML_game_rank);
    params.rotation = sprite->unk68;
    params.alpha = sprite->unk6C;
    params.unk30 = -1;
    params.flags = (sprite->unk74 & ~0xF) | 0xA;
    params.unk38 = ((int)(sprite->unk6C * 255.0f) << 24)
                 | (sprite->unkC << 16)
                 | (sprite->unkD << 8)
                 | (sprite->unkE << 0);
    params.unk3C = (sprite->unk70 << 16)
                 | (sprite->unk71 << 8)
                 | (sprite->unk72 << 0);
    r6 = &rankTexOffsets[sprite->unk48];
    tex = &bitmapGroups[(params.bmpId >> 8) & 0xFF].tpl->texHeaders[params.bmpId & 0xFF];
    params.x = sprite->centerX;
    params.y = sprite->centerY;
    params.z = sprite->unk4C;
    params.u1 = r6->u1 / tex->width;
    params.v1 = r6->v1 / tex->height;
    params.u2 = params.u1 + r6->u2 / tex->width;
    params.v2 = params.v1 + r6->v2 / tex->height;
    params.zoomX = (params.u2 - params.u1) * sprite->unk40;
    params.zoomY = (params.v2 - params.v1) * sprite->unk44;
    draw_naomi_sprite(&params);
}

void create_rank_icon(struct Ball *ball)
{
    struct Viewport *vp;
    struct Sprite *rankIcon;

    if (ball->unk2F == 0)
        return;
    vp = &cameraInfo[ball->unk2E].sub28.vp;
    rankIcon = create_sprite();
    if (rankIcon == NULL)
        return;
    rankIcon->centerX = (vp->left + vp->width * 0.5) * 640.0;
    rankIcon->centerY = (vp->top + vp->height * 0.5) * 480.0;
    rankIcon->type = 1;
    rankIcon->textAlign = ALIGN_CC;
    rankIcon->unk48 = ball->unk2F;
    rankIcon->bmpId = ball->unk2E;
    rankIcon->unk10 = 0;
    rankIcon->mainFunc = rank_icon_main;
    rankIcon->unk38 = lbl_80024324;
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
        struct ItemgroupInfo *r29 = &movableStageParts[c];
        struct StageGoal *goal = &decodedStageLzPtr->goals[goalId];
        Vec sp20;
        Vec sp14;

        mathutil_mtxA_from_mtx(r29->unk54);
        mathutil_mtxA_tf_point(&goal->pos, &sp14);
        mathutil_mtxA_from_mtx(r29->unk24);
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
    struct StageItemgroup *r30;
    int i;

    if (ball->pos.y < *decodedStageLzPtr->pFallOutY)
        return 1;
    func_8003CA98(ball, &sp18);
    r30 = decodedStageLzPtr->itemgroups;
    for (i = 0; i < decodedStageLzPtr->itemgroupCount; i++, r30++)
    {
        struct StageCollHdr_child2 *r28;
        int j;

        if (i != sp18.itemgroupId)
            tf_physball_to_itemgroup_space(&sp18, i);
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
    lbl_802F1DFC = ball->ape->unk10;
    lbl_802F1DF8 = ball->unk2E;
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
