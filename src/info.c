#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "ball.h"
#include "camera.h"
#include "input.h"
#include "item.h"
#include "mode.h"
#include "stage.h"

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

void ev_info_main(void)
{
    s8 *r23;
    int i;
    struct Ball *r21;
    int r20;
    struct Ball *ball;
    struct ReplayInfo spC8;
    struct Struct80039974 sp6C;

    if (gamePauseStatus & 0xA)
        return;

    r21 = currentBallStructPtr;
    ball = ballInfo;
    r23 = spritePoolInfo.unkC;
    r20 = 0;
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r23++)
    {
        u32 sp68;
        s32 sp64;

        if (*r23 == 0 || *r23 == 4)
            continue;

        currentBallStructPtr = ball;
        if (func_80023B9C(ball, &sp68, &sp64) == 0)
            continue;
        lbl_801F3A58.unk30 = ball->unk2E;
        switch (modeCtrl.unk28)
        {
        case 1:
            if (ball->flags & (1 << 24))
            {
                g_get_replay_info(lbl_80250A68.unk0[ball->unk2E], &spC8);
                if (!(spC8.flags & 1))
                    continue;
            }
            if (ball->flags & (1 << 24))
            {
                lbl_801F3A58.unk0 &= -2065;
                ball->flags |= 0x1000;
                ball->state = 5;
                ball->unk150 = ball->pos;
            }
            if (!(ball->flags & (1 << 12)) && !(lbl_801F3A58.unk0 & (1 << 5)))
            {
                func_8004923C(0x5A);
                lbl_801F3A58.unk0 &= -2065;
                r20++;
                ball->flags |= 0x1000;
                ball->state = 5;
                ball->unk150 = ball->pos;
                cameraInfo[i].state = 14;
                if (r20 == 1)
                    lbl_801F3A58.unk2C++;
                if (!(lbl_801F3A58.unk0 & (1 << 4)) && !(lbl_801F3A58.unk0 & (1 << 6)))
                {
                    ball->unk2F = lbl_801F3A58.unk2C;
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
                    func_800244E8(ball);
                }
                if (lbl_801F3A58.unk2C == 1)
                    func_800245E4(ball, sp68, sp64);
                func_80049268(ball->unk2E);
            }
            func_8003CA98(ball, &sp6C);
            if (sp64 != sp6C.unk58)
                func_80042000(&sp6C, sp64);
            func_8006F430(sp68, &sp6C);
            ball->unk12A = lbl_801F3A58.timerCurr;
            func_80024860(ball);
            break;
        case 4:
            break;
        default:
            if (ball->flags & (1 << 11))
                break;
            if (ball->flags & (1 << 24))
            {
                g_get_replay_info(lbl_80250A68.unk0[ball->unk2E], &spC8);
                if (!(spC8.flags & 1))
                    break;
            }
            lbl_801F3A58.unk0 &= -2065;
            ball->flags |= 0x1000;
            ball->state = 5;
            if (!(lbl_801F3A58.unk0 & (1 << 5)))
            {
                func_80023CF4();
                func_800245E4(ball, sp68, sp64);
                if (modeCtrl.unk28 == 0)
                    func_800AEDDC();
            }
            func_80049268(ball->unk2E);
            if (gameSubmode == 18)
                lbl_801F3A58.unk0 |= 1;
            func_8003CA98(ball, &sp6C);
            if (sp64 != sp6C.unk58)
                func_80042000(&sp6C, sp64);
            func_8006F430(sp68, &sp6C);
            ball->unk12A = lbl_801F3A58.timerCurr;
            func_80024860(ball);
            break;
        }
    }
    if (r20 > 1)
        lbl_801F3A58.unk2C += r20 - 1;
    if (r20 > 0 && lbl_801F3A58.unk2C >= modeCtrl.playerCount - 1)
        func_80023CF4();
    currentBallStructPtr = r21;

    lbl_801F3A58.unk24 = 0;

    {
        struct Item *r4 = itemInfo;
        s8 *r7 = spritePoolInfo.unk1C;

        for (i = 0; i < spritePoolInfo.unk18; r4++, i++, r7++)
        {
            if (*r7 != 0 && *r7 != 3 && r4->type == 0 && (r4->unk8 & (1 << 1)))
                lbl_801F3A58.unk24++;
        }
    }

    if ((lbl_801F3A58.unk0 & (1 << 6))
     && !(lbl_801F3A58.unk0 & (1 << 5))
     && lbl_801F3A58.unk24 == 0)
    {
        struct Ball *r3;
        struct Ball *r4;
        s8 *r5;
        int i;

        lbl_801F3A58.unk0 |= 0x228;
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

    if (!(lbl_801F3A58.unk0 & (1 << 5))
     && !(lbl_801F3A58.unk0 & (1 << 3))
     && (dipSwitches & DIP_DEBUG)
     && ((lbl_801F3A58.unk0 & (1 << 6)) || decodedStageLzPtr->goals != NULL)
     && (lbl_801F3D88[0] & (1 << 10))
     && (lbl_801F3D88[0] & (1 << 11)))
    {
        struct StageCollHdr_child *r7;
        int r9;

        if (modeCtrl.unk28 == 0)
            lbl_801F3A58.unk30 = modeCtrl.unk2C;
        else
            lbl_801F3A58.unk30 = 0;

        r9 = 0;
        r7 = decodedStageLzPtr->collHdrs[0].unk40;
        for (i = 0; i < decodedStageLzPtr->collHdrs[0].unk3C; i++, r7++)
        {
            if (r7->unk12 == 0x42)
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
            r7 = ((volatile struct StageCollHdr *)&decodedStageLzPtr->collHdrs[0])->unk40;
            for (i = 0; i < decodedStageLzPtr->collHdrs[0].unk3C; i++, r7++)
            {
                if ((lbl_801F3D88[0] & (1 << 3)) && r7->unk12 == 'R')
                {
                    r9 = i;
                    break;
                }
                if ((lbl_801F3D88[0] & (1 << 1)) && r7->unk12 == 'G')
                {
                    r9 = i;
                    break;
                }
                if ((lbl_801F3D88[0] & (1 << 2)) && r7->unk12 == 'B')
                {
                    r9 = i;
                    break;
                }
            }
        }
        lbl_801F3A58.unkC = r9;
        lbl_801F3A58.unkE = 0;
        lbl_801F3A58.unk10 = ball->vel;
        lbl_801F3A58.unk1C = lbl_801F3A58.timerCurr;
        if (!(lbl_801F3A58.unk0 & (1 << 6)) && (lbl_801F3D88[0] & 1))
            lbl_801F3A58.unk22 = 10;

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
                if (!(lbl_801F3A58.unk0 & (1 << 6)))
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

        func_80023CF4();
        if (!(lbl_801F3A58.unk0 & (1 << 6)))
        {
            struct Struct80039974 sp8;

            func_8003CA98(&ballInfo[0], &sp8);
            func_8006F430(lbl_801F3A58.unkC, &sp8);
            ball->unk12A = lbl_801F3A58.timerCurr;
            g_play_sound(0x16);
        }
    }

    if (!(lbl_801F3A58.unk0 & (1 << 5))
     && !(advDemoInfo.flags & (1 << 8)))
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
            switch (modeCtrl.unk28)
            {
            case 1:
                ball->state = 19;
                ball->flags |= 0x800;
                ball->unk150 = ball->pos;
                break;
            case 4:
                ball->flags |= 0x800;
                break;
            default:
                lbl_801F3A58.unk0 |= 0xC;
                ball->flags |= 0x800;
                func_800492FC(ball->unk2E);
                break;
            }
        }
    }

    if (!(lbl_801F3A58.unk0 & (1 << 3)) && !(dipSwitches & (1 << 7)))
    {
        lbl_801F3A58.unk8++;
        if (!(lbl_801F3A58.unk0 & (1 << 11)))
            lbl_801F3A58.timerCurr--;
        if (lbl_801F3A58.timerCurr <= 0)
        {
            switch (modeCtrl.unk28)
            {
            case 1:
                if (lbl_801F3A58.unk2C > 0)
                {
                    func_80023CF4();
                    lbl_801F3A58.unk0 |= 0x2000;
                    break;
                }
                lbl_801F3A58.unk0 |= 0xA;
                func_80049368(ball->unk2E);
                if (!(lbl_801F3A58.unk0 & (1 << 6)))
                {
                    struct Ball *r5 = ballInfo;
                    struct Ball *r6 = currentBallStructPtr;
                    s8 *r7 = spritePoolInfo.unkC;
                    int i;

                    for (i = 0; i < spritePoolInfo.unk8; i++, r5++, r7++)
                    {
                        if (*r7 == 2)
                        {
                            currentBallStructPtr = r5;
                            r5->unk126 = 0;
                            r5->unk128++;
                        }
                    }
                    currentBallStructPtr = r6;
                }

                {
                    struct Ball *r3;
                    struct Ball *r4;
                    s8 *r5;
                    int i;

                    r4 = currentBallStructPtr;
                    r5 = spritePoolInfo.unkC;
                    r3 = ballInfo;
                    for (i = 0; i < spritePoolInfo.unk8; i++, r3++, r5++)
                    {
                        if (*r5 == 2)
                        {
                            currentBallStructPtr = r3;
                            r3->flags |= 0x8000;
                        }
                    }
                    currentBallStructPtr = r4;
                }

                break;
            case 4:
                lbl_801F3A58.unk0 |= 0xA;
                break;
            default:
                {
                    struct Ball *r20;

                    r20 = currentBallStructPtr;
                    lbl_801F3A58.unk0 |= 0xA;
                    func_80049368(r20->unk2E);
                    r20->flags |= 0x8000;
                }
                break;
            }
        }
    }

    {
        struct Ball *r20;
        struct Ball *r21;
        s8 *r22;
        int i;

        r21 = currentBallStructPtr;
        r20 = ballInfo;
        r22 = spritePoolInfo.unkC;
        for (i = 0; i < spritePoolInfo.unk8; i++, r20++, r22++)
        {
            if (*r22 == 2)
            {
                currentBallStructPtr = r20;
                func_8003CB88(r20);
            }
        }
        currentBallStructPtr = r21;
    }
}
