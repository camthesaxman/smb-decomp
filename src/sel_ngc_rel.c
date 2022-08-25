#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "course.h"
#include "event.h"
#include "input.h"
#include "light.h"
#include "mode.h"
#include "pool.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "textbox.h"

void lbl_000030F4(void);
void lbl_000118E4(void);
void lbl_00002D00(void);
void lbl_00002EC0(void);
void lbl_00009868(struct Ape *, int);

void _prolog(void)
{
    func_80012510(lbl_000030F4, lbl_000118E4, NULL, NULL);
    switch (gameSubmode)
    {
    case SMD_SEL_NGC_MAIN:
        break;
    case SMD_SEL_NGC_INIT:
        lbl_00002D00();
        break;
    case SMD_SEL_NGC_REINIT:
        lbl_00002EC0();
        break;
    }
    gameSubmodeRequest = 0x20;
    puts("RELOCATION SEL_NGC LOADED");
}

void _epilog(void)
{
    event_finish_all();
    func_800249D4();
    puts("RELOCATION SEL_NGC PURGED");
}

void _unresolved(void)
{
    u32 i;
    u32 *sp;

    puts("\nError: A called an unlinked function.\n");
    puts("Address:      Back Chain    LR Save\n");

    i = 0;
    sp = (u32 *)OSGetStackPointer();
    while (sp != NULL && (u32)sp != 0xFFFFFFFF && i++ < 16)
    {
        printf("0x%08x:   0x%08x    0x%08x\n", (u32)sp, sp[0], sp[1]);
        sp = (u32 *)sp[0];
    }
    OSPanic("sel_ngc_rel.c", 85, "\n");
}

struct
{
    u8 filler0[4];
    u32 unk4;
    u8 filler8[0x18-0x8];
} lbl_10000000;
u32 lbl_10000018[9];
u32 lbl_1000003C_unk0;
s32 lbl_1000003C_unk4;
s32 lbl_1000003C_unk8[1];
struct
{
    //u32 unk0;
    //s32 unk4;  // 0x40
    //s32 unk8[1];  // 0x44
    u8 fillerC[0x84-0xC];
} lbl_1000003C;
struct
{
    u32 unk0;
    u8 filler4[0x744-0x4];
} lbl_100000C0;

void lbl_00000234(void)
{
    s32 i;

    (void)&lbl_10000000;

    modeCtrl.unk30 = 1;
    for (i = 0; i < 6; i++)
    {
        lbl_8027CE24[i].unk0 = 1;
        lbl_8027CE24[i].unk2 = 0;
        lbl_8027CE24[i].unk4 = 0;
    }

    u_isCompetitionModeCourse = 0;
    lbl_802F1FB0 = lbl_801EED50.unk0;
    lbl_802F1FAC = 0;
    for (i = 0; i < 9; i++)
        lbl_10000018[i] = 1;
    lbl_801EED98.unkC = 0;
}

static inline void play_menu_music(void)
{
    if (is_minigame_unlocked(GAMETYPE_MINI_BILLIARDS)
     && is_minigame_unlocked(GAMETYPE_MINI_BOWLING)
     && is_minigame_unlocked(GAMETYPE_MINI_GOLF))
        u_play_music(6, 0);
    else
        u_play_music(4, 0);
}

void lbl_0000033C(void)
{
    int i;
    u8 unused[0x10];

    if (gamePauseStatus & 0xA)
        return;

    func_8002FFEC();
    event_start(EVENT_STAGE);
    event_start(EVENT_STOBJ);
    event_start(EVENT_ITEM);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_EFFECT);
    event_start(EVENT_BACKGROUND);
    light_init(0);
    camera_set_state(0x34);
    g_poolInfo.playerPool.statusList[0] = 2;
    g_poolInfo.playerPool.statusList[1] = 0;
    g_poolInfo.playerPool.statusList[2] = 0;
    g_poolInfo.playerPool.statusList[3] = 0;
    call_bitmap_load_group(4);
    lbl_0000A950();
    for (i = 0; i < 26; i++)
        lbl_0000EBD4(i);
    lbl_801EEDA8.unkBC = 0;
    lbl_801EEDA8.unkC0 = 0;
    func_800380A8(0, 0, lbl_00009868);
    func_800380A8(1, 1, lbl_00009868);
    func_800380A8(2, 2, lbl_00009868);
    func_800380A8(3, 3, lbl_00009868);
    lbl_801EEDA8.unk58[0] = 0;
    lbl_801EEDA8.unk58[1] = 0;
    lbl_801EEDA8.unk58[2] = 0;
    lbl_801EEDA8.unk58[3] = 0;
    lbl_1000003C_unk0 = ST_190_DUMMY;
    preload_stage_files(lbl_1000003C_unk0);
    // TODO: remove
    (void)lbl_1000003C_unk4;
    (void)lbl_1000003C_unk8;
    (void)lbl_1000003C;
    lbl_100000C0.unk0 = 1;
    if (modeCtrl.courseFlags & 0x10000)
    {
        switch (modeCtrl.gameType)
        {
        case 3:
            u_play_music(8, 0);
            break;
        case 4:
            u_play_music(0xA, 0);
            break;
        case 5:
            u_play_music(0xC, 0);
            break;
        default:
            play_menu_music();
            break;
        }
    }
    else
        play_menu_music();
    gameSubmodeRequest = SMD_SEL_NGC_MAIN;
}

#define IS_PRESSED(btn) \
          ((controllerInfo[0].unk0[4].button & btn) \
        || (controllerInfo[1].unk0[4].button & btn) \
        || (controllerInfo[2].unk0[4].button & btn) \
        || (controllerInfo[3].unk0[4].button & btn) \
        || (analogButtonInfo[0][4] & btn) \
        || (analogButtonInfo[1][4] & btn) \
        || (analogButtonInfo[2][4] & btn) \
        || (analogButtonInfo[3][4] & btn))

int lbl_000005D4(int arg0)
{
    int var_r6 = 0;

    switch (arg0)
    {
    case 0:
        var_r6 = (lbl_10000000.unk4 == 0 && IS_PRESSED(1))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[4].button & 1) || (analogButtonInfo[0][4] & 1)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[4].button & 1) || (analogButtonInfo[1][4] & 1)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[4].button & 1) || (analogButtonInfo[2][4] & 1)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[4].button & 1) || (analogButtonInfo[3][4] & 1))))
                 );
        break;
    case 1:
        var_r6 = (lbl_10000000.unk4 == 0 && IS_PRESSED(2))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[4].button & 2) || (analogButtonInfo[0][4] & 2)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[4].button & 2) || (analogButtonInfo[1][4] & 2)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[4].button & 2) || (analogButtonInfo[2][4] & 2)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[4].button & 2) || (analogButtonInfo[3][4] & 2))))
                 );
        break;
    case 2:
        var_r6 = (lbl_10000000.unk4 == 0 && IS_PRESSED(8))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[4].button & 8) || (analogButtonInfo[0][4] & 8)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[4].button & 8) || (analogButtonInfo[1][4] & 8)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[4].button & 8) || (analogButtonInfo[2][4] & 8)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[4].button & 8) || (analogButtonInfo[3][4] & 8))))
                 );
        break;
    case 3:
        var_r6 = (lbl_10000000.unk4 == 0 && IS_PRESSED(4))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[4].button & 4) || (analogButtonInfo[0][4] & 4)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[4].button & 4) || (analogButtonInfo[1][4] & 4)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[4].button & 4) || (analogButtonInfo[2][4] & 4)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[4].button & 4) || (analogButtonInfo[3][4] & 4))))
                 );
        break;
    case 4:
        var_r6 = (lbl_10000000.unk4 == 0 && ANY_CONTROLLER_PRESSED(0x40))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[2].button & 0x40)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[2].button & 0x40)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[2].button & 0x40)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[2].button & 0x40))))
                 );
        break;
    case 5:
        var_r6 = (lbl_10000000.unk4 == 0 && ANY_CONTROLLER_PRESSED(0x20))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[2].button & 0x20)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[2].button & 0x20)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[2].button & 0x20)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[2].button & 0x20))))
                 );
        break;
    case 6:
        var_r6 = (lbl_10000000.unk4 == 0 && ANY_CONTROLLER_PRESSED(0x100))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[2].button & 0x100)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[2].button & 0x100)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[2].button & 0x100)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[2].button & 0x100))))
                 );
        break;
    case 7:
        var_r6 = (lbl_10000000.unk4 == 0 && ANY_CONTROLLER_PRESSED(0x200))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[2].button & 0x200)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[2].button & 0x200)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[2].button & 0x200)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[2].button & 0x200))))
                 );
        break;
    case 8:
        var_r6 = (lbl_10000000.unk4 == 0 && ANY_CONTROLLER_PRESSED(0x400))
              || (lbl_10000000.unk4 != 0
                  && (((lbl_10000000.unk4 & 1) && ((controllerInfo[0].unk0[2].button & 0x400)))
                   || ((lbl_10000000.unk4 & 2) && ((controllerInfo[1].unk0[2].button & 0x400)))
                   || ((lbl_10000000.unk4 & 4) && ((controllerInfo[2].unk0[2].button & 0x400)))
                   || ((lbl_10000000.unk4 & 8) && ((controllerInfo[3].unk0[2].button & 0x400))))
                 );
        break;
    }
    return var_r6;
}

int lbl_00001910(void)
{
    int var_r3 = 0;
    int i;

    for (i = 0; i < 4; i++)
    {
        if (controllerInfo[i].unk0[0].err == 0)
            var_r3++;
    }
    return var_r3;
}

int lbl_00001968(void)
{
    int r3 = 0;

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_COMPETITION:
        lbl_801EEDA8.unk3C = lbl_00001910();
        if (modeCtrl.playerCount > lbl_801EEDA8.unk3C)
            modeCtrl.playerCount = lbl_801EEDA8.unk3C;
        if (modeCtrl.playerCount < lbl_801EEDA8.unk40)
            modeCtrl.playerCount = lbl_801EEDA8.unk40;
        if (lbl_801EEDA8.unk3C < 2)
            r3 = 1;
        break;
    case GAMETYPE_MINI_RACE:
    case GAMETYPE_MINI_FIGHT:
        lbl_801EEDA8.unk3C = lbl_00001910();
        if (modeCtrl.playerCount > lbl_801EEDA8.unk3C)
            modeCtrl.playerCount = lbl_801EEDA8.unk3C;
        if (modeCtrl.playerCount < lbl_801EEDA8.unk40)
            modeCtrl.playerCount = lbl_801EEDA8.unk40;
        break;
    default:
        if (modeCtrl.playerCount > lbl_801EEDA8.unk3C)
            modeCtrl.playerCount = lbl_801EEDA8.unk3C;
        if (modeCtrl.playerCount < lbl_801EEDA8.unk40)
            modeCtrl.playerCount = lbl_801EEDA8.unk40;
        break;
    }
    return r3;
}

int lbl_00001B38(void)
{
    u8 unused2[8];
    struct TextBox sp18;
    u8 unused[8];
    int var_r31 = 0;

    switch (modeCtrl.gameType)
    {
    case 1:
    case 4:
        if (lbl_801EEDA8.unk114 != lbl_00001910())
            var_r31 = 1;
        break;
    case 3:
        if (!(lbl_801EED88.unkC & 2) && lbl_801EEDA8.unk114 != lbl_00001910())
            var_r31 = 1;
        break;
    }
    if (var_r31 != 0)
    {
        if (lbl_801EEDA8.unk44 == 0)
        {
            memset(&sp18, 0, sizeof(sp18));
            sp18.x = 0x140;
            sp18.y = 0x118;
            sp18.numRows = 2;
            sp18.style = 0xE;
            textbox_set_properties(1, 1, &sp18);
            textbox_add_text(1, "b/c/0xff0000/a/Please do not insert or\nb/c/0xff0000/a/disconnect the controller(s).");
            lbl_801EEDA8.unk44 = 1;
            lbl_801EEDA8.unk48[0] = 0;
            lbl_801EEDA8.unk48[1] = 0;
            lbl_801EEDA8.unk48[2] = 0;
            lbl_801EEDA8.unk48[3] = 0;
        }
    }
    else if (lbl_801EEDA8.unk44 != 0)
    {
        textbox_set_properties(1, 0x14, NULL);
        lbl_801EEDA8.unk44 = 0;
    }
    return var_r31;
}

int lbl_00001D58(void)
{
    int var_r31;
    struct Sprite *temp_r3;

    var_r31 = 0;
    temp_r3 = find_sprite_with_tag(0xA);
    if (temp_r3 != NULL)
        var_r31 = 1;
    if (temp_r3 == NULL)
    {
        if (lbl_000005D4(8) != 0)
        {
            u_play_sound_0(0x6E);
            call_bitmap_load_group(0xC);
            func_80081F30();
            var_r31 = 1;
        }
    }
    else if (lbl_000005D4(8) != 0 || lbl_000005D4(7) != 0)
    {
        u_play_sound_0(0x70);
        destroy_sprite_with_tag(0xA);
        call_bitmap_free_group(0xC);
        var_r31 = 1;
    }
    find_sprite_with_tag(0xA);
    return var_r31;
}

void lbl_00001E10(s32 *arg0, s32 arg1, s32 arg2, s32 arg3, int arg4, int arg5, int arg6)
{
    int sp24[3];
    int temp_r27;
    int unlocked;
    int i;
    int temp_r26;
    s32 var_r30;
    s32 var_r26_3;
    struct Sprite *sprite;

    sp24[0] = arg4;
    sp24[1] = arg5;
    sp24[2] = arg6;
    var_r30 = (arg3 == 0x48 || arg3 == 0x45 || arg3 == 0x4A) ? 1 : 2;
    if (arg3 == 0x32)
    {
        if (lbl_000005D4(1))
        {
            if (--(*arg0) < arg1)
                *arg0 = var_r30 + arg1;
            u_play_sound_0(0x6C);
        }
        if (lbl_000005D4(0))
        {
            if (++(*arg0) > var_r30 + arg1)
                *arg0 = arg1;
            u_play_sound_0(0x6C);
        }
    }
    else
    {
        if (lbl_000005D4(0))
        {
            if (--(*arg0) < arg1)
                *arg0 = var_r30 + arg1;
            u_play_sound_0(0x6C);
        }
        if (lbl_000005D4(1))
        {
            if (++(*arg0) > var_r30 + arg1)
                *arg0 = arg1;
            u_play_sound_0(0x6C);
        }
    }
    temp_r26 = (arg2 + *arg0) - arg1;
    sprite = find_sprite_with_tag(0x17);
    if (sprite != NULL)
        sprite->userVar = temp_r26;

    switch (arg3)
    {
    case 0x39:
        if (*arg0 == 2)
        {
            unlocked = 0;
            if (is_floor_visited(0, 1, 0) || is_floor_visited(1, 1, 0) || is_floor_visited(2, 1, 0))
                unlocked++;
            if (is_minigame_unlocked(GAMETYPE_MINI_BILLIARDS))
                unlocked++;
            if (is_minigame_unlocked(GAMETYPE_MINI_BOWLING))
                unlocked++;
            if (is_minigame_unlocked(GAMETYPE_MINI_GOLF))
                unlocked++;
            if (are_all_continues_unlocked())
                unlocked++;
            if (unlocked > 0)
            {
                sprite = find_sprite_with_tag(0x17);
                if (sprite != NULL)
                    sprite->userVar = unlocked + 0x13;
            }
            if (unlocked >= 0 && unlocked <= 3 && g_totalPlayPoints >= 2500)
            {
                sprite = find_sprite_with_tag(0x17);
                if (sprite != NULL)
                    sprite->userVar = 0x19;
            }
        }
        break;
    case 0x32:
        if (*arg0 == 0)
        {
            unlocked = 0;
            if (is_minigame_unlocked(GAMETYPE_MINI_BILLIARDS))
                unlocked++;
            if (is_minigame_unlocked(GAMETYPE_MINI_BOWLING))
                unlocked++;
            if (is_minigame_unlocked(GAMETYPE_MINI_GOLF))
                unlocked++;
            if (are_all_continues_unlocked())
                unlocked++;
            if (unlocked > 0)
            {
                sprite = find_sprite_with_tag(0x17);
                if (sprite != NULL)
                    sprite->userVar = unlocked + 5;
            }
        }
        else if (*arg0 == 1 && sp24[*arg0] != 0)
        {
            sprite = find_sprite_with_tag(0x17);
            if (sprite != NULL)
                sprite->userVar = 4;
        }
        else if (*arg0 == 2 && sp24[*arg0] != 0)
        {
            sprite = find_sprite_with_tag(0x17);
            if (sprite != NULL)
                sprite->userVar = 5;
        }
        break;
    case 0x3F:
        if (g_totalPlayPoints >= 2500)
        {
            for (i = 0; i <= var_r30; i++)
            {
                if (sp24[i] != 0)
                    sp24[i] = 2;
            }
            if (sp24[*arg0 - arg1] != 0)
            {
                sprite = find_sprite_with_tag(0x17);
                if (sprite != NULL)
                    sprite->userVar = 0x3D;
            }
        }
        else if (sp24[*arg0 - arg1] != 0)
        {
            sprite = find_sprite_with_tag(0x17);
            if (sprite != NULL)
                sprite->userVar = 0x3C;
        }
        break;
    }

    for (var_r26_3 = 0; var_r26_3 <= var_r30; var_r26_3++)
    {
        temp_r27 = arg3 + var_r26_3;
        sprite = find_sprite_with_tag(temp_r27);
        if (sprite != NULL)
        {
            if (*arg0 == arg1 + var_r26_3 && sp24[var_r26_3] == 2)
            {
                sprite->userVar = 0xB;
                lbl_801EEDA8.unk68 = temp_r27;
                lbl_801EEDA8.unk6C[var_r26_3] = -1;
            }
            else if (*arg0 == arg1 + var_r26_3 && sp24[var_r26_3] != 0)
            {
                sprite->userVar = 9;
                lbl_801EEDA8.unk68 = temp_r27;
                lbl_801EEDA8.unk6C[var_r26_3] = -1;
            }
            else if (*arg0 == arg1 + var_r26_3)
            {
                sprite->userVar = 1;
                lbl_801EEDA8.unk68 = temp_r27;
                lbl_801EEDA8.unk6C[var_r26_3] = -1;
            }
            else
            {
                if (sp24[var_r26_3] == 2)
                {
                    sprite->userVar = 0xA;
                    lbl_801EEDA8.unk6C[var_r26_3] = temp_r27;
                }
                else if (sp24[var_r26_3] != 0)
                {
                    sprite->userVar = 8;
                    lbl_801EEDA8.unk6C[var_r26_3] = temp_r27;
                }
                else
                {
                    sprite->userVar = 0;
                    lbl_801EEDA8.unk6C[var_r26_3] = temp_r27;
                }
            }
        }
    }
}

int lbl_00002358(int arg0, int arg1)
{
    int i;

    if (arg0 != 0)
    {
        int var_r5 = 0;

        for (i = 0; i < 4; i++)
        {
            if (lbl_801EEDA8.unk48[i] != 0)
                var_r5++;
        }
        if (arg1 == lbl_80206BD0[var_r5 - 1])
            return 1;
    }
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (lbl_801EEDA8.unk48[i] != 0 && arg1 == lbl_80206BD0[i])
                return 1;
        }
    }
    return 0;
}

int lbl_00002484(int arg0, int arg1, int arg2)
{
    lbl_801EEDA8.unk48[arg1] = 1;
    lbl_80206BD0[arg1] = arg0;
    lbl_802F1DFC = playerCharacterSelection[arg1];
    lbl_802F1DF8 = arg2;
    switch (playerCharacterSelection[arg1])
    {
    case 0:
        u_play_sound_0(0x0100004F);
        break;
    case 1:
        u_play_sound_0(0x01D8004F);
        break;
    case 2:
        u_play_sound_0(0x28004F);
        break;
    case 3:
        u_play_sound_0(0xFC004F);
        break;
    }
    u_play_sound_0(0x65);
    lbl_801EEDA8.unk58[playerCharacterSelection[arg1]] = 30;
    lbl_802F1C10.unk4[arg1] = (s8)playerCharacterSelection[arg1];
    return 1;
}

void lbl_0000259C(void)
{
    if (!(lbl_802F1FB4->unk4 & 8))
    {
        if (is_floor_visited(2, 1, 16))
            lbl_802F1FB4->unk4 |= 0x18;
        else if (is_floor_visited(0, 1, 8U) || is_floor_visited(1, 1, 8U) || is_floor_visited(2, 1, 8U))
            lbl_802F1FB4->unk4 |= 8;
    }
    else
    {
        if (lbl_802F1FB4->unk4 & 0x10)
        {
            lbl_802F1FB4->unk4 &= 0xFFFFFFEF;
            lbl_802F1FB4->unk2 = 2;
        }
        else if (lbl_802F1FB4->unk4 & 8)
            lbl_802F1FB4->unk4 &= 0xFFFFFFF7;
    }
}

void lbl_0000269C(void)
{
    if (!(lbl_802F1FB4->unk4 & 8))
    {
        if (is_floor_visited(0, 1, 8U) || is_floor_visited(1, 1, 8U) || is_floor_visited(2, 1, 8U))
            lbl_802F1FB4->unk4 |= 8;
    }
    else if (!(lbl_802F1FB4->unk4 & 0x10))
    {
        if (is_floor_visited(2, 1, 16))
            lbl_802F1FB4->unk4 |= 0x10;
        else
        {
            lbl_802F1FB4->unk4 &= 0xFFFFFFE7;
            lbl_802F1FB4->unk2 = 0;
        }
    }
    else if (lbl_802F1FB4->unk4 & 0x10)
    {
        lbl_802F1FB4->unk4 &= 0xFFFFFFE7;
        lbl_802F1FB4->unk2 = 0;
    }
}

int lbl_000027AC(void)
{
    int var_r4;

    u_play_sound_0(0x6C);
    if (lbl_802F1FB4->unk4 & 0x10)
        lbl_0000259C();
    else if (--lbl_802F1FB4->unk2 < 0)
    {
        lbl_802F1FB4->unk2 = 2;
        lbl_0000259C();
    }
    var_r4 = lbl_802F1FB4->unk2;
    if (lbl_802F1FB4->unk4 & 8)
        var_r4 += 3;
    if (lbl_802F1FB4->unk4 & 0x10)
        var_r4 += 3;
    lbl_802F1FB4->unk0 = lbl_10000018[var_r4];
    if (lbl_802F1FA8 != 0 && is_floor_visited(lbl_802F1FB4->unk2, lbl_802F1FB4->unk0, lbl_802F1FB4->unk4) == 0)
    {
        lbl_802F1FA8 = 0;
        return 0;
    }
    return 1;
}

int lbl_000028A8(void)
{
    int var_r4;

    u_play_sound_0(0x6C);
    if (lbl_802F1FB4->unk4 & 0x10)
        lbl_0000269C();
    else if (++lbl_802F1FB4->unk2 > 2)
    {
        lbl_802F1FB4->unk2 = 0;
        lbl_0000269C();
    }
    var_r4 = lbl_802F1FB4->unk2;
    if (lbl_802F1FB4->unk4 & 8)
        var_r4 += 3;
    if (lbl_802F1FB4->unk4 & 0x10)
        var_r4 += 3;
    lbl_802F1FB4->unk0 = lbl_10000018[var_r4];
    if (lbl_802F1FA8 != 0 && is_floor_visited(lbl_802F1FB4->unk2, lbl_802F1FB4->unk0, lbl_802F1FB4->unk4) == 0)
    {
        lbl_802F1FA8 = 0;
        return 0;
    }
    return 1;
}

void lbl_000029A8(void)
{
    event_finish(EVENT_STAGE);
    event_finish(EVENT_STOBJ);
    event_finish(EVENT_ITEM);
    event_finish(EVENT_EFFECT);
    event_finish(EVENT_BACKGROUND);
    func_800569B4(lbl_1000003C_unk0);
    load_stage(lbl_1000003C_unk0);
    event_start(EVENT_STAGE);
    event_start(EVENT_STOBJ);
    event_start(EVENT_ITEM);
    event_start(EVENT_EFFECT);
    event_start(EVENT_BACKGROUND);
    if (lbl_801EEDA8.unk0 > 0x14
     || lbl_801EEDA8.unk4 == 0x1A
     || lbl_801EEDA8.unk4 == 0x1B
     || lbl_801EEDA8.unk4 == 0x20
     || lbl_801EEDA8.unk4 == 0x21
     || lbl_801EEDA8.unk4 == 0x25
     || lbl_801EEDA8.unk4 == 0x26
     || lbl_801EEDA8.unk4 == 0x33
     || lbl_801EEDA8.unk4 == 0x36)
    {
        camera_set_state(12);
        light_init(currStageId);
        return;
    }
    light_init(0);
}

void lbl_00002AA4(s32 arg0)
{
    if (lbl_801EEDA8.unkF4 <= arg0 - 2)
    {
        if (lbl_000005D4(2))
        {
            if (--lbl_801EEDA8.unkF4 < 0)
                lbl_801EEDA8.unkF4 = arg0 - 2;
        }
        if (lbl_000005D4(3))
        {
            if (++lbl_801EEDA8.unkF4 > arg0 - 2)
                lbl_801EEDA8.unkF4 = 0;
        }
    }
    else
    {
        if (lbl_000005D4(2))
        {
            if (--lbl_801EEDA8.unkF4 < arg0 - 1)
                lbl_801EEDA8.unkF4 = arg0;
        }
        if (lbl_000005D4(3))
        {
            if (++lbl_801EEDA8.unkF4 > arg0)
                lbl_801EEDA8.unkF4 = arg0 - 1;
        }
    }
    if ((lbl_000005D4(2) || lbl_000005D4(3))
     && (lbl_1000003C_unk4 == 1 || arg0 > 2))
    {
        u_play_sound_0(0x6C);
    }
    if (lbl_1000003C_unk4 == 1)
    {
        if (lbl_000005D4(6) && lbl_801EEDA8.unkF4 == arg0 - 1)
        {
            lbl_801EEDA8.unk108 = 1;
            lbl_1000003C_unk8[lbl_1000003C_unk4] = lbl_801EEDA8.unkF4;
            lbl_1000003C_unk4 ^= 1;
            lbl_801EEDA8.unkF4 = lbl_1000003C_unk8[lbl_1000003C_unk4];
            u_play_sound_0(0x65);
        }
    }
    else if (lbl_000005D4(6) || lbl_000005D4(7))
    {
        lbl_801EEDA8.unk108 = 0;
        lbl_1000003C_unk8[lbl_1000003C_unk4] = lbl_801EEDA8.unkF4;
        lbl_1000003C_unk4 ^= 1;
        lbl_801EEDA8.unkF4 = lbl_1000003C_unk8[lbl_1000003C_unk4];
        lbl_801EEDA8.unkF4++;
        u_play_sound_0(lbl_000005D4(6) != 0 ? 0x6A : 0x66);
    }
}

// to prevent inlining of lbl_00001910
static inline int lbl_00001910_noinline(void)
{
    return lbl_00001910();
}

void lbl_00002D00(void)
{
    s32 i;
    int temp_r3;

    if (!(gamePauseStatus & 0xA))
    {
        func_800569B4(ST_190_DUMMY);
        load_stage(ST_190_DUMMY);
        modeCtrl.submodeTimer = 0;
        modeCtrl.courseFlags = 0;
        modeCtrl.difficulty = 0;
        lbl_801EEDA8.unk0 = 7;
        lbl_801EEDA8.unk4 = -1;
        lbl_801EEDA8.unk8 = 0;
        lbl_801EEDA8.unkC = -1;
        lbl_801EEDA8.unkE = 0;
        lbl_801EEDA8.unk10[lbl_801EEDA8.unkE] = lbl_801EEDA8.unk0;
        lbl_801EEDA8.unk68 = -1;
        for (i = 0; i < 10; i++)
        {
            lbl_801EEDA8.unk6C[i] = -1;
            lbl_801EEDA8.unk94[i] = -1;
        }
        lbl_801EEDA8.unk110 = 0;
        temp_r3 = lbl_00001910_noinline();
        lbl_801EEDA8.unk40 = 1;
        lbl_801EEDA8.unk3C = temp_r3;
        modeCtrl.playerCount = lbl_801EEDA8.unk3C;
        playerCharacterSelection[0] = lbl_802F1C10.unk4[0];
        playerCharacterSelection[1] = lbl_802F1C10.unk4[1];
        playerCharacterSelection[2] = lbl_802F1C10.unk4[2];
        playerCharacterSelection[3] = lbl_802F1C10.unk4[3];
        for (i = 0; i < 4; i++)
            lbl_801EEDA8.unk48[i] = 0;
        lbl_801EEDA8.unk44 = 0;
        lbl_00000234();
        lbl_0000033C();
        func_800123DC();
        start_screen_fade(0x100, 0U, 0x1E);
    }
}

void lbl_00002EC0(void)
{
    struct Sprite *sprite;
    s32 i;

    if (gamePauseStatus & 0xA)
        return;

    modeCtrl.submodeTimer = 0;
    if (modeCtrl.courseFlags & 0x8000)
    {
        lbl_801EEDA8.unkC = -1;
        lbl_801EEDA8.unkE--;
        lbl_801EEDA8.unk0 = lbl_801EEDA8.unk10[lbl_801EEDA8.unkE];
        start_screen_fade(0x100, 0U, 0x1E);
    }
    else if (modeCtrl.courseFlags & 0x10000)
    {
        lbl_801EEDA8.unkC = -1;
        lbl_801EEDA8.unkE--;
        lbl_801EEDA8.unk0 = 4;
    }
    else if (modeCtrl.courseFlags & 0x80000)
    {
        lbl_801EEDA8.unkC = -1;
        lbl_801EEDA8.unkE = 1;
        lbl_00000234();
        lbl_801EEDA8.unk0 = 4;
    }
    else
    {
        lbl_801EEDA8.unkC = -1;
        lbl_801EEDA8.unkE = 1;
        lbl_00000234();
        lbl_801EEDA8.unk0 = 4;
        start_screen_fade(0x102, 0U, 1);
    }
    lbl_801EEDA8.unk4 = -1;
    lbl_801EEDA8.unk8 = 0;
    lbl_801EEDA8.unk68 = -1;
    for (i = 0; i < 10; i++)
        lbl_801EEDA8.unk6C[i] = -1;
    lbl_801EEDA8.unk110 = 0;
    for (i = 0; i < 4; i++)
        lbl_801EEDA8.unk48[i] = 0;
    lbl_801EEDA8.unk44 = 0;
    lbl_0000033C();
    modeCtrl.courseFlags = 0;
    camera_setup_singleplayer_viewport();
    for (i = 0; i < lbl_801EEDA8.unkE; i++)
    {
        if (lbl_801EEDA8.unk94[i] == -1)
            break;
        sprite = find_sprite_with_tag(lbl_801EEDA8.unk94[i]);
        if (sprite != NULL)
        {
            sprite->userVar = 7;
            sprite->textAlign = i;
        }
    }
    func_800123DC();
}
