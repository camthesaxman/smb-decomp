#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "event.h"
#include "info.h"
#include "input.h"
#include "mode.h"
#include "sprite.h"

struct Struct801EEC68 lbl_801EEC68;

const s8 lbl_802F28B0[8] = { 3, 4, 6, 4, 4, 0, 0 };

s8 lbl_802F1BA1;
s8 lbl_802F1BA0;
OSHeapHandle lbl_802F1B9C;
s32 lbl_802F1B98;

void unkFunc8000A26C(struct Sprite *a)
{
    int i;

    gamePauseStatus |= 8;
    lbl_801EEC68.unk14 = 0;
    for (i = 0; i < 4; i++)
    {
        if (controllerInfo[i].unk0[0].err == 0
         && (controllerInfo[i].unk0[2].button & PAD_BUTTON_START))
        {
            lbl_801EEC68.unk14 = i;
            break;
        }
    }

    lbl_802F1BA0 = 0;
    lbl_802F1BA1 = 30;
    lbl_801EEC68.unk15 = 0;
    if (modeCtrl.unk40 == 1)
    {
        for (i = 0; i < modeCtrl.playerCount; i++)
        {
            if (lbl_801EEC68.unk14 == lbl_80206BD0[i])
            {
                lbl_801EEC68.unk15 = i;
                break;
            }
        }
    }
    else
    {
        if (modeCtrl.gameType == GAMETYPE_MINI_BILLIARDS)
        {
            if (modeCtrl.playerCount == 1)
                lbl_801EEC68.unk15 = 0;
            else if (lbl_801EEC68.unk16 == -1)
                lbl_801EEC68.unk15 = 0;
            else
                lbl_801EEC68.unk15 = (lbl_801EEC68.unk14 == lbl_80206BD0[lbl_802F1C32]) ? lbl_802F1C32 : 1 - lbl_802F1C32;
        }
        else
            lbl_801EEC68.unk15 = modeCtrl.unk2C;
    }

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_NORMAL:
        lbl_801EEC68.unk10 = 1;
        break;
    case GAMETYPE_MAIN_COMPETITION:
        lbl_801EEC68.unk10 = 1;
        break;
    case GAMETYPE_MAIN_PRACTICE:
        lbl_801EEC68.unk10 = 2;
        break;
    case GAMETYPE_MINI_RACE:
        if (lbl_801EED88.unk8 & (1<<(31-0x1B)))
            lbl_801EEC68.unk10 = 3;
        else if (!(lbl_801EED88.unk8 & (1<<(31-0x1C)))
         && modeCtrl.playerCount == 1)
            lbl_801EEC68.unk10 = 3;
        else
            lbl_801EEC68.unk10 = 0;
        break;
    case GAMETYPE_MINI_BILLIARDS:
        if (lbl_801EEC68.unk16 == lbl_801EEC68.unk14)
            lbl_801EEC68.unk10 = 4;
        else
            lbl_801EEC68.unk10 = 0;
        break;
    default:
        lbl_801EEC68.unk10 = 0;
        break;
    }

    lbl_801EEC68.unk4 &= ~1;
    lbl_801EEC68.unk8 = 0;
    lbl_801EEC68.unkC = lbl_802F28B0[lbl_801EEC68.unk10];
    lbl_801EEC68.unk0 = 0;
    lbl_802F1B98 = -1;
    if (a == NULL)
    {
        func_80075D74();
        find_sprite_with_tag(4);
    }
    else
        a->unk48 = 1;
    func_8002B5C8(0x70);
    func_8002CF38(50, 10);
}

void unkFunc8000A580(struct Sprite *a)
{
    s8 r3 = lbl_801EEC68.unk8;

    if (lbl_802F1BA0 > 0)
        lbl_802F1BA0--;
    if (CONTROLLER_SOMETHING(lbl_801EEC68.unk14, PAD_BUTTON_UP) && lbl_802F1BA0 == 0)
    {
        if (--lbl_801EEC68.unk8 < 0)
            lbl_801EEC68.unk8 = lbl_801EEC68.unkC - 1;
        lbl_802F1BA0 = 10;
    }
    else if (CONTROLLER_SOMETHING(lbl_801EEC68.unk14, PAD_BUTTON_DOWN) && lbl_802F1BA0 == 0)
    {
        if (++lbl_801EEC68.unk8 > lbl_801EEC68.unkC - 1)
            lbl_801EEC68.unk8 = 0;
        lbl_802F1BA0 = 10;
    }
    if (r3 != lbl_801EEC68.unk8)
        func_8002B5C8(0x6F);
    if (lbl_801EEC68.unk10 == 4 && lbl_801EEC68.unk8 == 1)
    {
        if (CONTROLLER_SOMETHING(lbl_801EEC68.unk14, PAD_BUTTON_LEFT)
         || CONTROLLER_SOMETHING(lbl_801EEC68.unk14, PAD_BUTTON_RIGHT))
        {
            lbl_801EEC68.unk4 |= 0x10;
            func_8002B5C8(0x169);
        }
    }
    if ((controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_A)
     || (controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_B)
     || (controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_START))
    {
        lbl_801EEC68.unk4 |= 1;
        func_8002B5C8(0x6E);
        lbl_801EEC68.unk0 = 2;
        if ((controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_B)
         || (controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_START))
            lbl_801EEC68.unk8 = 0;
        switch (lbl_801EEC68.unk10)
        {
        case 2:
            if (lbl_801EEC68.unk8 == lbl_801EEC68.unkC - 2)
            {
                lbl_801EEC68.unk0 = 60;
                if (a != NULL)
                    a->unk48 = 2;
                screenFadeInfo.unk4 = 0xFFFFFF;
                func_8002CF38(59, 2);
            }
            break;
        }
        if (lbl_801EEC68.unkC >= 2 && lbl_801EEC68.unk8 == lbl_801EEC68.unkC - 1)
        {
            lbl_801EEC68.unk0 = 60;
            if (a != NULL)
                a->unk48 = 3;
            func_8002CF38(60, 2);
        }
    }
}

void unkFunc8000A924(struct Sprite *a)
{
    lbl_802F1B98 = 4;
    if (a != NULL)
        a->unk48 = 6;
    if (modeCtrl.gameType == GAMETYPE_MINI_TARGET || modeCtrl.gameType == GAMETYPE_MINI_GOLF)
        lbl_802F1B9C = OSSetCurrentHeap(memHeap4);
    if (gameMode == MD_MINI && modeCtrl.gameType == GAMETYPE_MINI_GOLF)
    {
        OSHeapHandle r30 = OSSetCurrentHeap(memHeap2);
        call_bitmap_load_group(BMP_HOW);
        OSSetCurrentHeap(r30);
    }
    else
        call_bitmap_load_group(BMP_HOW);
    if (modeCtrl.gameType == GAMETYPE_MINI_TARGET || modeCtrl.gameType == GAMETYPE_MINI_GOLF)
        OSSetCurrentHeap(lbl_802F1B9C);
    func_80081F30();
    gamePauseStatus |= 8;
}

void unkFunc8000AA00(struct Sprite *a)
{
    struct Ball *ball;
    struct Ball *r5;
    s8 *r6;
    int i;

    gamePauseStatus &= ~(1<<(31-0x1C));
    switch (lbl_801EEC68.unk10)
    {
    case 0:
        switch (lbl_801EEC68.unk8)
        {
        case 0:
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            func_8002CF38(100, 10);
            if (modeCtrl.gameType == GAMETYPE_MINI_BILLIARDS)
                lbl_801EEC68.unk4 |= 0x20;
            break;
        case 1:
            unkFunc8000A924(a);
            break;
        case 2:
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        }
        break;
    case 1:
        switch (lbl_801EEC68.unk8)
        {
        case 0:
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            func_8002CF38(100, 10);
            break;
        case 1:
            if (lbl_801EEC68.unk4 & (1<<(31-0x1D)))
            {
                lbl_802F1B98 = 3;
                gamePauseStatus |= 8;
                func_8009F49C(5);
                event_start(EVENT_MEMCARD);
            }
            else
            {
                lbl_802F1B98 = 2;
                gamePauseStatus |= 8;
                event_start(EVENT_VIEW);
                if (a != NULL)
                    a->unk78 |= 1;
            }
            break;
        case 2:
            unkFunc8000A924(a);
            break;
        case 3:
            if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
            {
                lbl_802F1B98 = 5;
                gameSubmodeRequest = SMD_GAME_INTR_SEL_INIT;
            }
            else
            {
                lbl_802F1B98 = 1;
                func_80012434(-1);
            }
            break;
        }
        break;
    case 2:
        switch (lbl_801EEC68.unk8)
        {
        case 0:
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            func_8002CF38(100, 10);
            break;
        case 1:
            infoWork.unk1E++;
            r5 = currentBallStructPtr;
            ball = &ballInfo[0];
            r6 = spritePoolInfo.unkC;
            for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r6++)
            {
                if (*r6 == 2)
                {
                    currentBallStructPtr = ball;
                    ball->flags |= 0x800000;
                }
            }
            currentBallStructPtr = r5;
            gameSubmodeRequest = SMD_GAME_READY_INIT;
            func_8002CF38(100, 10);
            break;
        case 2:
            if (lbl_801EEC68.unk4 & (1<<(31-0x1D)))
            {
                lbl_802F1B98 = 3;
                gamePauseStatus |= 8;
                func_8009F49C(5);
                event_start(EVENT_MEMCARD);
            }
            else
            {
                lbl_802F1B98 = 2;
                gamePauseStatus |= 8;
                event_start(EVENT_VIEW);
                if (a != NULL)
                    a->unk78 |= 1;
            }
            break;
        case 3:
            unkFunc8000A924(a);
            break;
        case 4:
            modeCtrl.levelSetFlags |= 0x8000;
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        case 5:
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        }
        break;
    case 3:
        switch (lbl_801EEC68.unk8)
        {
        case 0:
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            func_8002CF38(100, 10);
            break;
        case 1:
            destroy_sprite_with_tag(4);
            modeCtrl.levelSetFlags |= 0x4000;
            func_8002CF38(100, 10);
            break;
        case 2:
            unkFunc8000A924(a);
            break;
        case 3:
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        }
        break;
    case 4:
        switch (lbl_801EEC68.unk8)
        {
        case 0:
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            func_8002CF38(100, 10);
            lbl_801EEC68.unk4 |= 0x20;
            break;
        case 1:
            lbl_802F1B98 = 0;
            destroy_sprite_with_tag(4);
            func_8002CF38(100, 10);
            lbl_801EEC68.unk4 |= 0x20;
            break;
        case 2:
            unkFunc8000A924(a);
            break;
        case 3:
            lbl_802F1B98 = 1;
            func_80012434(-1);
            break;
        }
        break;
    }
}

void unkFunc8000AECC(struct Sprite *a)
{
    struct Sprite *sprite;

    switch (lbl_802F1B98)
    {
    case 2:
        if ((controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_A)
         || (controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_B)
         || (controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_START))
        {
            event_finish(EVENT_VIEW);
            func_8002B5C8(0x70);
            lbl_801EEC68.unk4 &= ~1;
            if (a != NULL)
                a->unk78 &= ~1;
            lbl_802F1B98 = -1;
        }
        break;
    case 3:
        if (eventInfo[EVENT_MEMCARD].state != EV_STATE_RUNNING)
        {
            func_8002B5C8(0x70);
            lbl_801EEC68.unk4 &= ~1;
            lbl_802F1B98 = -1;
        }
        break;
    case 4:
        sprite = find_sprite_with_tag(10);
        if (sprite != NULL)
            func_80082024(0, sprite);
        if ((controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_A)
         || (controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_B)
         || (controllerInfo[lbl_801EEC68.unk14].unk0[2].button & PAD_BUTTON_START))
        {
            func_8002B5C8(0x70);
            lbl_801EEC68.unk4 &= ~1;
            destroy_sprite_with_tag(10);
            if (modeCtrl.gameType == GAMETYPE_MINI_TARGET || modeCtrl.gameType == GAMETYPE_MINI_GOLF)
                lbl_802F1B9C = OSSetCurrentHeap(memHeap4);
            call_bitmap_free_group(12);
            if (modeCtrl.gameType == GAMETYPE_MINI_TARGET || modeCtrl.gameType == GAMETYPE_MINI_GOLF)
                OSSetCurrentHeap(lbl_802F1B9C);
            if (a != NULL)
                a->unk48 = 1;
            lbl_802F1B98 = -1;
        }
        break;
    }
}

void unkFunc8000B09C(void)
{
    struct Sprite *sprite = find_sprite_with_tag(4);

    if ((modeCtrl.gameType == GAMETYPE_MAIN_NORMAL || modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
     && !(infoWork.unk0 & (1<<(31-0x17)))
     && ((infoWork.unk0 & (1<<(31-0x1A))) || (infoWork.unk0 & (1<<(31-0x19))) || (infoWork.unk0 & (1<<(31-0x1B))))
     && func_8004C70C() != 0)
        lbl_801EEC68.unk4 |= 4;
    else
        lbl_801EEC68.unk4 &= ~4;

    if (lbl_802F1BA1 > 0)
        lbl_802F1BA1--;
    if (unkFunc8000A0F4())
        unkFunc8000A26C(sprite);
    else
    {
        if (gamePauseStatus & (1<<(31-0x1C)))
        {
            if (!(lbl_801EEC68.unk4 & 1))
                unkFunc8000A580(sprite);
            if (lbl_801EEC68.unkC >= 2
             && lbl_801EEC68.unk8 == lbl_801EEC68.unkC - 1
             && lbl_801EEC68.unk0 == 0x28
             && sprite != NULL)
                sprite->unk48 = 5;
            if (lbl_801EEC68.unk0 > 0)
            {
                if (--lbl_801EEC68.unk0 == 0)
                    unkFunc8000AA00(sprite);
            }
            else
                unkFunc8000AECC(sprite);
            if (!(dipSwitches & DIP_DEBUG) || !(gamePauseStatus & (1<<(31-0x1E))))
            {
                if (sprite != NULL)
                    func_80075E1C(0, sprite);
            }
        }
    }
}
