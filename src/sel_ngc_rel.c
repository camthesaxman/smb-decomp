#include <stddef.h>
#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "course.h"
#include "event.h"
#include "light.h"
#include "mode.h"
#include "pool.h"
#include "sprite.h"
#include "stage.h"
#include "sound.h"

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

u8 lbl_10000000[0x18];
u32 lbl_10000018[9];
struct
{
    u32 unk0;
    u8 filler4[0x84-0x4];
} lbl_1000003C;
struct
{
    u32 unk0;
    u8 filler4[0x744-0x4];
} lbl_100000C0;

void lbl_00000234(void)
{
    s32 i;

    (void)lbl_10000000;

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
    lbl_801EEDA8.unk58 = 0;
    lbl_801EEDA8.unk5C = 0;
    lbl_801EEDA8.unk60 = 0;
    lbl_801EEDA8.unk64 = 0;
    lbl_1000003C.unk0 = ST_190_DUMMY;
    preload_stage_files(lbl_1000003C.unk0);
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
