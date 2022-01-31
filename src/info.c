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

s8 lbl_802F1CB0[8];
u32 lbl_802F1CAC;
u32 lbl_802F1CA8;

struct Struct801F3A58 lbl_801F3A58;

void func_80022F14(void)
{
    lbl_801F3A58.unk8 = 0;
    lbl_801F3A58.unk1E = 1;
    lbl_801F3A58.unk20 = 1;
    lbl_801F3A58.unk28 = 0;
    lbl_801F3A58.unk2A = 0;
    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
    {
        lbl_802F1CAC = 0;
        lbl_802F1CA8 = 0;
    }
}

// unknown types
u8 lbl_801F3A8C[0x10];  FORCE_BSS_ORDER(lbl_801F3A8C)
u8 lbl_801F3A9C[0xD4];  FORCE_BSS_ORDER(lbl_801F3A9C)

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
        case GAMETYPE_MINI_FIGHT:
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
                if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
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

        if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
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
            switch (modeCtrl.gameType)
            {
            case GAMETYPE_MAIN_COMPETITION:
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

void ev_info_dest(void)
{
    func_80023AF4();
}

void func_80023AF4(void)
{
    int unk8 = lbl_801F3A58.unk8;
    int unk1E = lbl_801F3A58.unk1E;
    int unk20 = lbl_801F3A58.unk20;
    int unk28 = lbl_801F3A58.unk28;
    int unk2A = lbl_801F3A58.unk2A;
    int unk2E = lbl_801F3A58.unk2E;

    memset(&lbl_801F3A58, 0, sizeof(lbl_801F3A58));

    lbl_801F3A58.unk8  = unk8;
    lbl_801F3A58.unk1E = unk1E;
    lbl_801F3A58.unk20 = unk20;
    lbl_801F3A58.unk28 = unk28;
    lbl_801F3A58.unk2A = unk2A;
    lbl_801F3A58.unk2E = unk2E;
    lbl_801F3A58.unk22 = 1;
    if (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
        lbl_802F1CA8 = 0;
}

int func_80023B9C(struct Ball *ball, u32 *b, s32 *c)
{
    struct Struct80039974 sp3C;
    struct StageCollHdr *r27;
    int r26;
    int i;

    func_8003CA98(ball, &sp3C);
    r27 = decodedStageLzPtr->collHdrs;
    r26 = 0;
    for (i = 0; i < decodedStageLzPtr->collHdrsCount; i++, r27++)
    {
        if (r27->unk3C > 0)
        {
            struct StageCollHdr_child *r24;
            int j;

            if (i != sp3C.unk58)
                func_80042000(&sp3C, i);
            r24 = r27->unk40;
            for (j = 0; j < r27->unk3C; j++, r24++)
            {
                struct Struct8003F890 sp14;

                mathutil_mtxA_from_translate(&r24->unk0);
                mathutil_mtxA_rotate_z(r24->unk10);
                mathutil_mtxA_rotate_y(r24->unkE);
                mathutil_mtxA_rotate_x(r24->unkC);
                sp14.unk0.x = 0.0f;
                sp14.unk0.y = 1.0f;
                sp14.unk0.z = 0.0f;
                mathutil_mtxA_tf_point(&sp14.unk0, &sp14.unk0);
                sp14.unkC = r24->unkC;
                sp14.unkE = r24->unkE;
                sp14.unk10 = r24->unk10;
                sp14.unk20 = 2.0f;
                sp14.unk24 = 2.0f;
                if (func_8003F890(&sp3C.unk4, &sp3C.unk10, &sp14) != 0)
                {
                    *b = r26;
                    *c = i;
                    return 1;
                }
                r26++;
            }
        }
    }
    return 0;
}

void func_80023CF4(void)
{
    if (lbl_801F3A58.unk0 & (1 << 6))
        lbl_801F3A58.unk0 |= 0x628;
    else
        lbl_801F3A58.unk0 |= 0x29;

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        struct Ball *r6;
        struct Ball *r7;
        s8 *r8;
        int i;

        r7 = currentBallStructPtr;
        r8 = spritePoolInfo.unkC;
        r6 = ballInfo;
        for (i = 0; i < spritePoolInfo.unk8; i++, r6++, r8++)
        {
            if (*r8 != 2)
                continue;
            currentBallStructPtr = r6;
            if (!(r6->flags & (1 << 12)))
            {
                r6->flags |= 0x500;
                r6->unk126 = 0;
                r6->unk128++;
                r6->flags |= 0x8000;
            }
        }
        currentBallStructPtr = r7;
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
    float unk0;
    float unk4;
    float unk8;
    float unkC;
};

struct Struct801818D0 lbl_801818D0[4] =
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

void lbl_80023FB8(int dummy, struct Sprite *sprite)
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
            r28->textAlign = 4;
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
                r5->bmpId = 12;
                r5->textAlign = 4;
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
                r11->textAlign = 4;
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

    params.bmpId = 0x502;
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
    r6 = &lbl_801818D0[sprite->unk48];
    tex = &bitmapGroups[(params.bmpId >> 8) & 0xFF].tpl->texHeaders[params.bmpId & 0xFF];
    params.x = sprite->centerX;
    params.y = sprite->centerY;
    params.z = sprite->unk4C;
    params.u1 = r6->unk0 / tex->width;
    params.v1 = r6->unk4 / tex->height;
    params.u2 = params.u1 + r6->unk8 / tex->width;
    params.v2 = params.v1 + r6->unkC / tex->height;
    params.zoomX = (params.u2 - params.u1) * sprite->unk40;
    params.zoomY = (params.v2 - params.v1) * sprite->unk44;
    draw_naomi_sprite(&params);
}

void func_800244E8(struct Ball *ball)
{
    struct Viewport *vp;
    struct Sprite *r9;

    if (ball->unk2F == 0)
        return;
    vp = &cameraInfo[ball->unk2E].sub28.vp;
    r9 = create_sprite();
    if (r9 == NULL)
        return;
    r9->centerX = (vp->left + vp->width * 0.5) * 640.0;
    r9->centerY = (vp->top + vp->height * 0.5) * 480.0;
    r9->type = 1;
    r9->textAlign = 4;
    r9->unk48 = ball->unk2F;
    r9->bmpId = ball->unk2E;
    r9->unk10 = 0;
    r9->mainFunc = lbl_80023FB8;
    r9->unk38 = lbl_80024324;
    strcpy(r9->text, "ranking");
}

void func_800245E4(struct Ball *ball, int goalId, int c)
{
    lbl_801F3A58.unkC = goalId;
    lbl_801F3A58.unkE = c;
    lbl_801F3A58.unk10 = ball->vel;
    lbl_801F3A58.unk1C = lbl_801F3A58.timerCurr;
    if (c > 0)
    {
        struct MovableStagePart *r29 = &movableStageParts[c];
        struct StageGoal *goal = &decodedStageLzPtr->goals[goalId];
        Vec sp20;
        Vec sp14;

        mathutil_mtxA_from_mtx(r29->unk54);
        mathutil_mtxA_tf_point(&goal->pos, &sp14);
        mathutil_mtxA_from_mtx(r29->unk24);
        mathutil_mtxA_tf_point(&goal->pos, &sp20);

        lbl_801F3A58.unk10.x += sp14.x - sp20.x;
        lbl_801F3A58.unk10.y += sp14.y - sp20.y;
        lbl_801F3A58.unk10.z += sp14.z - sp20.z;
    }
}

int func_800246F4(struct Ball *ball)
{
    struct Struct80039974 sp18;
    struct StageCollHdr *r30;
    int i;

    if (ball->pos.y < *decodedStageLzPtr->pFallOutY)
        return 1;
    func_8003CA98(ball, &sp18);
    r30 = decodedStageLzPtr->collHdrs;
    for (i = 0; i < decodedStageLzPtr->collHdrsCount; i++, r30++)
    {
        struct StageCollHdr_child2 *r28;
        int j;

        if (i != sp18.unk58)
            func_80042000(&sp18, i);
        r28 = r30->unk88;
        for (j = 0; j < r30->unk84; j++, r28++)
        {
            Vec spC;

            mathutil_mtxA_from_translate(&r28->unk0);
            mathutil_mtxA_rotate_z(r28->unk1C);
            mathutil_mtxA_rotate_y(r28->unk1A);
            mathutil_mtxA_rotate_x(r28->unk18);
            mathutil_mtxA_rigid_inv_tf_point(&sp18.unk4, &spC);
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
    lbl_802F1DFC = ball->unkFC->unk10;
    lbl_802F1DF8 = ball->unk2E;
    if (lbl_801F3A58.timerCurr > (lbl_801F3A58.timerMax >> 1))
    {
        if (lbl_801F3A58.unk22 != 1)
            g_play_sound(0x2859);
        else
            g_play_sound(0x2858);
    }
    else
        g_play_sound(0x281B);
}
