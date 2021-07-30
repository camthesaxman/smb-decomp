#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "game.h"

struct MinigameLink
{
    u32 unk0;
    u32 unk4;
};

char *gameModeRelNames[] = {
    "",
    "",
    "",
    "mkbe.test_mode.rel",
    "",
    "mkbe.option.rel"
};
void (*gameModeFuncs[])(void) = {
    func_8000E5A8,
    func_8001236C,
    func_8001260C,
    NULL,
    func_80093A14,
    NULL,
    NULL
};
void (*lbl_80172528 /*lbl_801724D0_58*/[]) = {
    func_8000A0B0, func_8000EE34, func_8000F670, func_8000E708,
    func_8000EC7C, func_8000E658, func_8000E6A0, func_8000E6BC,
    func_8000E6C0, func_80011BE8, func_80011CD0, func_80011238,
    func_80011278, func_80010560, func_8001077C, func_80010C0C,
    func_80010EA8, func_8001100C, func_80011120, func_80010020,
    func_80010284, func_80010114, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_80012524, func_80012574, func_80012524,
    func_80012574, func_80012524, func_800123F4, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_80012A7C, func_80012E6C, func_80012FD0, func_80013140,
    func_800133AC, func_800134E8, func_80013668, func_800139A8,
    func_800143C4, func_800145A8, func_80014728, func_800147B8,
    func_8001267C, func_800150D8, func_8001520C, func_80015948,
    func_80015A40, func_80013E08, func_80014048, func_800129B0,
    func_80015564, func_8001585C, func_80014D24, func_80014E78,
    func_80015BD0, func_80015C78, func_80015DA0, func_80015ED8,
    func_80016358, func_80016724, func_80016D30, func_80016E60,
    func_80016EF0, func_80015464, func_80015480, func_80015D04,
    func_80015D44, func_800152F8, func_80015374, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_80093BFC, func_80093C3C, func_80093DE8, func_80093E08,
    func_80093AB8, func_80093B24, func_80093AB8, func_80093B24,
    func_80093AB8, func_80093B24, func_80093AB8, func_80093B24,
    func_80093AB8, func_80093B24, func_80093AB8, func_80093B24,
    func_80093AB8, func_80093B24, func_8009B9FC, func_8009BAE4,
    func_800A752C, func_800A75B4, func_80093E48, func_80093EE0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, func_8000A0B0,
    func_8000A0B0, func_8000A0B0, func_8000A0B0, NULL,
};
void *gameModeNames[] = {
    "MD_ADV",
    "MD_SEL",
    "MD_GAME",
    "MD_TEST",
    "MD_MINI",
    "MD_OPTION",
     NULL,
};
char *gameSubmodeNames[] = {
    "SMD_ADV_TOP",
    "SMD_ADV_DEMO_INIT",
    "SMD_ADV_DEMO_MAIN",
    "SMD_ADV_LOGO_INIT",
    "SMD_ADV_LOGO_MAIN",
    "SMD_ADV_WARNING_INIT",
    "SMD_ADV_WARNING_MAIN",
    "SMD_ADV_RATING_INIT",
    "SMD_ADV_RATING_MAIN",
    "SMD_ADV_START_INIT",
    "SMD_ADV_START_MAIN",
    "SMD_ADV_RANKING_INIT",
    "SMD_ADV_RANKING_MAIN",
    "SMD_ADV_INFO_INIT",
    "SMD_ADV_INFO_MAIN",
    "SMD_ADV_GAME_READY_INIT",
    "SMD_ADV_GAME_READY_MAIN",
    "SMD_ADV_GAME_PLAY_INIT",
    "SMD_ADV_GAME_PLAY_MAIN",
    "SMD_ADV_TITLE_INIT",
    "SMD_ADV_TITLE_MAIN",
    "SMD_ADV_TITLE_REINIT",
    "SMD_ADV_DMY4",
    "SMD_ADV_DMY5",
    "SMD_ADV_DMY6",
    "SMD_ADV_DMY7",
    "SMD_ADV_DMY8",
    "SMD_ADV_BOTTOM",
    "SMD_SEL_TOP",
    "SMD_SEL_STAGE_INIT",
    "SMD_SEL_STAGE_MAIN",
    "SMD_SEL_NGC_INIT",
    "SMD_SEL_NGC_MAIN",
    "SMD_SEL_NGC_REINIT",
    "SMD_SEL_NGC_DEST",
    "SMD_SEL_DMY1",
    "SMD_SEL_DMY2",
    "SMD_SEL_DMY3",
    "SMD_SEL_DMY4",
    "SMD_SEL_DMY5",
    "SMD_SEL_DMY6",
    "SMD_SEL_DMY7",
    "SMD_SEL_DMY8",
    "SMD_SEL_DMY9",
    "SMD_SEL_DMYa",
    "SMD_SEL_DMYb",
    "SMD_SEL_BOTTOM",
    "SMD_GAME_TOP",
    "SMD_GAME_READY_INIT",
    "SMD_GAME_READY_MAIN",
    "SMD_GAME_PLAY_INIT",
    "SMD_GAME_PLAY_MAIN",
    "SMD_GAME_GOAL_INIT",
    "SMD_GAME_GOAL_MAIN",
    "SMD_GAME_GOAL_REPLAY_INIT",
    "SMD_GAME_GOAL_REPLAY_MAIN",
    "SMD_GAME_TIMEOVER_INIT",
    "SMD_GAME_TIMEOVER_MAIN",
    "SMD_GAME_RINGOUT_INIT",
    "SMD_GAME_RINGOUT_MAIN",
    "SMD_GAME_FIRST_INIT",
    "SMD_GAME_OVER_INIT",
    "SMD_GAME_OVER_MAIN",
    "SMD_GAME_NAMEENTRY_INIT",
    "SMD_GAME_NAMEENTRY_MAIN",
    "SMD_GAME_CONTINUE_INIT",
    "SMD_GAME_CONTINUE_MAIN",
    "SMD_GAME_RESTART_INIT",
    "SMD_GAME_NAMEENTRY_READY_INIT",
    "SMD_GAME_NAMEENTRY_READY_MAIN",
    "SMD_GAME_BONUS_CLEAR_INIT",
    "SMD_GAME_BONUS_CLEAR_MAIN",
    "SMD_GAME_ENDING_INIT",
    "SMD_GAME_ENDING_MAIN",
    "SMD_GAME_EXTRA_INIT",
    "SMD_GAME_EXTRA_WAIT",
    "SMD_GAME_RESULT_INIT",
    "SMD_GAME_RESULT_MAIN",
    "SMD_GAME_RESULT_MENU",
    "SMD_GAME_INTR_SEL_INIT",
    "SMD_GAME_INTR_SEL_MAIN",
    "SMD_GAME_OVER_SAVE",
    "SMD_GAME_OVER_DEST",
    "SMD_GAME_ROLL_INIT",
    "SMD_GAME_ROLL_MAIN",
    "SMD_GAME_OVER_POINT_INIT",
    "SMD_GAME_OVER_POINT_MAIN",
    "SMD_GAME_DMY3",
    "SMD_GAME_DMY4",
    "SMD_GAME_DMY5",
    "SMD_GAME_DMY6",
    "SMD_GAME_DMY7",
    "SMD_GAME_DMY8",
    "SMD_GAME_BOTTOM",
    "SMD_TEST_TOP",
    "SMD_TEST_SELECT_INIT",
    "SMD_TEST_SELECT_MAIN",
    "SMD_TEST_INPUT_INIT",
    "SMD_TEST_INPUT_MAIN",
    "SMD_TEST_DIP_INIT",
    "SMD_TEST_DIP_MAIN",
    "SMD_TEST_SOUND_INIT",
    "SMD_TEST_SOUND_MAIN",
    "SMD_TEST_BLUR_INIT",
    "SMD_TEST_BLUR_MAIN",
    "SMD_TEST_SHADOW_INIT",
    "SMD_TEST_SHADOW_MAIN",
    "SMD_TEST_FOCUS_INIT",
    "SMD_TEST_FOCUS_MAIN",
    "SMD_TEST_INDIRECT_INIT",
    "SMD_TEST_INDIRECT_MAIN",
    "SMD_TEST_NLOBJPUT_INIT",
    "SMD_TEST_NLOBJPUT_MAIN",
    "SMD_TEST_BITMAP_INIT",
    "SMD_TEST_BITMAP_MAIN",
    "SMD_TEST_FONT_INIT",
    "SMD_TEST_FONT_MAIN",
    "SMD_TEST_REPLAY_INIT",
    "SMD_TEST_REPLAY_MAIN",
    "SMD_TEST_MOTION_INIT",
    "SMD_TEST_MOTION_MAIN",
    "SMD_TEST_ADVREPLAY_INIT",
    "SMD_TEST_MODEL_INIT",
    "SMD_TEST_MODEL_MAIN",
    "SMD_TEST_NEWMODEL_INIT",
    "SMD_TEST_NEWMODEL_MAIN",
    "SMD_TEST_PATTERN_INIT",
    "SMD_TEST_PATTERN_MAIN",
    "SMD_TEST_ROMFONT_INIT",
    "SMD_TEST_ROMFONT_MAIN",
    "SMD_TEST_PREREND_INIT",
    "SMD_TEST_PREREND_MAIN",
    "SMD_TEST_PREVIEW_INIT",
    "SMD_TEST_PREVIEW_MAIN",
    "SMD_TEST_DMY2",
    "SMD_TEST_DMY3",
    "SMD_TEST_DMY4",
    "SMD_TEST_DMY5",
    "SMD_TEST_DMY6",
    "SMD_TEST_DMY7",
    "SMD_TEST_DMY8",
    "SMD_TEST_DMY9",
    "SMD_TEST_BOTTOM",
    "SMD_MINI_TOP",
    "SMD_MINI_SELECT_INIT",
    "SMD_MINI_SELECT_MAIN",
    "SMD_MINI_TEST0_INIT",
    "SMD_MINI_TEST0_MAIN",
    "SMD_MINI_FIGHT_INIT",
    "SMD_MINI_FIGHT_MAIN",
    "SMD_MINI_BOWLING_INIT",
    "SMD_MINI_BOWLING_MAIN",
    "SMD_MINI_RACE_INIT",
    "SMD_MINI_RACE_MAIN",
    "SMD_MINI_PILOT_INIT",
    "SMD_MINI_PILOT_MAIN",
    "SMD_MINI_BILLIARDS_INIT",
    "SMD_MINI_BILLIARDS_MAIN",
    "SMD_MINI_GOLF_INIT",
    "SMD_MINI_GOLF_MAIN",
    "SMD_MINI_REL_SAMPLE_INIT",
    "SMD_MINI_REL_SAMPLE_MAIN",
    "SMD_MINI_COMMEND_INIT",
    "SMD_MINI_COMMEND_MAIN",
    "SMD_MINI_RANKING_INIT",
    "SMD_MINI_RANKING_MAIN",
    "SMD_MINI_ENDING_INIT",
    "SMD_MINI_ENDING_MAIN",
    "SMD_MINI_DMY4",
    "SMD_MINI_DMY5",
    "SMD_MINI_DMY6",
    "SMD_MINI_DMY7",
    "SMD_MINI_BOTTOM",
    "SMD_OPTION_TOP",
    "SMD_OPTION_SELECT_INIT",
    "SMD_OPTION_SELECT_MAIN",
    "SMD_OPTION_SOUND_INIT",
    "SMD_OPTION_SOUND_MAIN",
    "SMD_OPTION_PAD_INIT",
    "SMD_OPTION_PAD_MAIN",
    "SMD_OPTION_MEMCARD_INIT",
    "SMD_OPTION_MEMCARD_MAIN",
    "SMD_OPTION_POINT_INIT",
    "SMD_OPTION_POINT_MAIN",
    "SMD_OPTION_RANKING_INIT",
    "SMD_OPTION_RANKING_MAIN",
    "SMD_OPTION_AUTOSAVE_INIT",
    "SMD_OPTION_AUTOSAVE_MAIN",
    "SMD_OPTION_REPLAY_INIT",
    "SMD_OPTION_REPLAY_MAIN",
    "SMD_OPTION_SEPARATE_INIT",
    "SMD_OPTION_SEPARATE_MAIN",
    "SMD_OPTION_REPLAY_PLAY_INIT",
    "SMD_OPTION_REPLAY_PLAY_MAIN",
    "SMD_OPTION_PAD_MENU_INIT",
    "SMD_OPTION_PAD_MENU_MAIN",
    "SMD_OPTION_PAD_VIB_INIT",
    "SMD_OPTION_PAD_VIB_MAIN",
    "SMD_OPTION_BOTTOM", NULL
};

struct MinigameLink lbl_802F021C = {0};
char *lbl_80173C5C[] = {
    "GAME START",
    "STAGE SELECT",
    "MINI MODE",
    "OPTION",
    "TEST MODE",
};

#ifdef NONMATCHING
void gm_init(void)
{
    gameMode = MD_ADV;
    gameSubmode = SMD_ADV_WARNING_INIT;
    gameModeRequest = -1;
    gameSubmodeRequest = -1;
    lbl_802F1B80 = 0;
    lbl_802F1B7C = 0;
    modeCtrl.unk8 = 0;
    modeCtrl.unk0 = 0;
    modeCtrl.unk42 = 0;
    modeCtrl.unk1C = 0;
    modeCtrl.unk20 = 0;
}
#else
asm void gm_init(void)
{
nofralloc
#define _SDA_BASE_ 0
/* 800094B8 000053D8  38 80 00 00 */	li r4, 0
/* 800094BC 000053DC  38 00 FF FF */	li r0, -1
/* 800094C0 000053E0  B0 8D 99 B2 */	sth r4, gameMode-_SDA_BASE_(r13)
/* 800094C4 000053E4  38 60 00 05 */	li r3, 5
/* 800094C8 000053E8  3C A0 80 1F */	lis r5, modeCtrl@ha
/* 800094CC 000053EC  B0 6D 99 AE */	sth r3, gameSubmode-_SDA_BASE_(r13)
/* 800094D0 000053F0  38 65 EC 20 */	addi r3, r5, modeCtrl@l
/* 800094D4 000053F4  B0 0D 99 B0 */	sth r0, gameModeRequest-_SDA_BASE_(r13)
/* 800094D8 000053F8  B0 0D 99 AC */	sth r0, gameSubmodeRequest-_SDA_BASE_(r13)
/* 800094DC 000053FC  90 8D 99 A0 */	stw r4, lbl_802F1B80-_SDA_BASE_(r13)
/* 800094E0 00005400  90 8D 99 9C */	stw r4, lbl_802F1B7C-_SDA_BASE_(r13)
/* 800094E4 00005404  90 83 00 08 */	stw r4, 8(r3)
/* 800094E8 00005408  90 83 00 00 */	stw r4, 0(r3)
/* 800094EC 0000540C  98 83 00 42 */	stb r4, 0x42(r3)
/* 800094F0 00005410  90 83 00 1C */	stw r4, 0x1c(r3)
/* 800094F4 00005414  90 83 00 20 */	stw r4, 0x20(r3)
/* 800094F8 00005418  4E 80 00 20 */	blr
}
#pragma peephole on
#endif

void gm_main(void)
{
    s16 r4;

    if (dipSwitches & 0x1)
        unkFunc80009C6C();
    else
        unkFunc80009F68();

    if ((modeCtrl.unk8 & (1 << 9))
     && gameModeRequest != -1 && gameModeRequest != gameMode)
    {
        minigame_unlink(&lbl_802F021C);
        modeCtrl.unk8 &= ~(1 << 9);
    }

    if (gameModeRequest != -1)
    {
        if (lbl_802F1B80 != NULL)
        {
            lbl_802F1B80();
            lbl_802F1B80 = NULL;
        }
        gameMode = gameModeRequest;
        r4 = gameMode;
        modeStringPtr = gameModeNames[gameMode];
        gameModeRequest = -1;
        if (r4 == MD_TEST || r4 == MD_OPTION)
            modeCtrl.unk8 |= 0x200;
    }

    if (gameSubmodeRequest != -1)
    {
        gameSubmode = gameSubmodeRequest;
        submodeStringPtr = gameSubmodeNames[gameSubmode];
        gameSubmodeRequest = -1;
    }

    if (modeCtrl.unk8 & (1 << 9))
    {
        if (lbl_802F021C.unk0 == 0)
        {
            event_clear();
            g_something_with_iteratively_freeing_memory();
            minigame_link(gameModeRelNames[gameMode], &lbl_802F021C);
        }
        if (lbl_802F1B74 != 0)
            lbl_802F1B74();
    }
    else
        gameModeFuncs[gameMode]();
}

/*
extern struct
{
    u16 unk0;
} lbl_801F3D50;

extern struct
{
    u16 unk0;
    u8 filler2[0x8-2];
    u16 unk8;
    u8 fillerA[0x30-0xA];
    u16 unk18;
    u16 unk30;
} lbl_801F3B70;

extern u32 lbl_802F1ED8;
extern u8 lbl_802F0248[];
extern u8 lbl_802F0244[];
extern u8 lbl_802F0240[];
extern u8 lbl_802F023C[];
extern u8 lbl_802F0238[];
extern u8 lbl_802F0230[];
extern u8 lbl_802F0234[];
*/

// pls help...
#if 0
//r8 = lbl_801F3D50
//r7 = lbl_801F3B70
void unkFunc80009684(void)
{
    /*
    if (!(lbl_801F3D50.unk0 & (1 << 10))
     && !(lbl_801F3D50.unk0 & (1 << 9))
     && lbl_802F1ED8 == 0)
    {
        if
        (
            (lbl_801F3B70.unk30 & (1 << 3)) || (lbl_801F3D50.unk8 & (1 << 3))
            ||
            (
                //800096F4
                ((lbl_801F3B70.unk0 & (1 << 3)) && modeCtrl != 0) || 
            )
        )
        {
            //?lbl_8000980C
        }
    }
    //lbl_80009B14
    */
    #define DAT_801f3d50 lbl_801F3D50.unk0
    #define DAT_801f3d58 lbl_801F3D50.unk8
    #define DAT_801f3d5a lbl_801F3D50.unkA
    #define DAT_801f3d64 lbl_801F3D50.unk14
    #define DAT_801f3d6c lbl_801F3D50.unk1C
    #define DAT_801f3b70 lbl_801F3B70.unk0
    #define DAT_801f3b88 lbl_801F3B70.unk18
    int iVar1 = 0;  // r5
    if ((DAT_801f3d50 & 0x100) == 0 && (DAT_801f3d50 & 0x200) == 0 && DAT_802f1ed8 == 0)
    {
        if
        (((((DAT_801f3ba0 & 8) != 0) || ((DAT_801f3d58 & 8) != 0))
                ||
                (
                    ((((DAT_801f3b70 & 8) != 0 || ((DAT_801f3d50 & 8) != 0)) && ((DAT_801f3d50 & 0x200) != 0)
                ) || ((/*puVar2 = &DAT_801f3b70,*/ (DAT_801f3bdc & 8) != 0 || ((DAT_801f3d62 & 8) != 0)))))
            )
         || ((((((DAT_801f3bac & 8) != 0 || ((DAT_801f3d5a & 8) != 0)) &&
               ((DAT_801f3d5a & 0x200) != 0)) ||
              (((/*puVar2 = &DAT_801f3b70,*/ (DAT_801f3c18 & 8) != 0 || ((DAT_801f3d6c & 8) != 0)) ||
               (((((DAT_801f3be8 & 8) != 0 || ((DAT_801f3d64 & 8) != 0)) &&
                 ((DAT_801f3d64 & 0x200) != 0)) ||
                ((/*puVar2 = &DAT_801f3b70,*/ (DAT_801f3c54 & 8) != 0 ||
                 (/*in_r7 = (undefined4 *)&DAT_801f3d50,*/ (DAT_801f3d76 & 8) != 0)))))))) ||
             ((((DAT_801f3c24 & 8) != 0 || (/*in_r6 = DAT_801f3d6e & 8,*/ (DAT_801f3d6e & 8) != 0)) &&
              (/*in_r6 = DAT_801f3d6e & 0x200,*/ (DAT_801f3d6e & 0x200) != 0)))))
        ) {
        //in_r7 = &DAT_801eec40;
        //in_r6 = DAT_801eec40 - 1;
        //DAT_801eec40 = in_r6;
        modeCtrl.unk20--;
        if (modeCtrl.unk20 < 0) {
          modeCtrl.unk20 = 4;
        }
        //lbl_80009828
      }
      if (((((((DAT_801f3ba0 & 4) != 0) || ((DAT_801f3d58 & 4) != 0)) ||
            (((((DAT_801f3b70 & 4) != 0 || ((DAT_801f3d50 & 4) != 0)) &&
              ((DAT_801f3d50 & 0x200) != 0)) ||
             ((((DAT_801f3bdc & 4) != 0 || ((DAT_801f3d62 & 4) != 0)) ||
              ((((DAT_801f3bac & 4) != 0 || ((DAT_801f3d5a & 4) != 0)) &&
               ((DAT_801f3d5a & 0x200) != 0)))))))) ||
           ((((DAT_801f3c18 & 4) != 0 || ((DAT_801f3d6c & 4) != 0)) ||
            (((((DAT_801f3be8 & 4) != 0 || ((DAT_801f3d64 & 4) != 0)) &&
              ((DAT_801f3d64 & 0x200) != 0)) ||
             (((DAT_801f3c54 & 4) != 0 || ((DAT_801f3d76 & 4) != 0)))))))) ||
          ((((DAT_801f3c24 & 4) != 0 || ((DAT_801f3d6e & 4) != 0)) && ((DAT_801f3d6e & 0x200) != 0))
          )))
      {
              //lbl_80009964
            modeCtrl.unk20++;
            if (modeCtrl.unk20 == 5)
                modeCtrl.unk20 = 0;
      }
      //lbl_80009984
      if (((DAT_801f3b88 & 0x1000) != 0) || ((DAT_801f3b88 & 0x100) != 0)) {
        iVar1 = 1;
      }
      if (((DAT_801f3bc4 & 0x1000) != 0) || ((DAT_801f3bc4 & 0x100) != 0)) {
        iVar1 = 1;
      }
      if (((DAT_801f3c00 & 0x1000) != 0) || ((DAT_801f3c00 & 0x100) != 0)) {
        iVar1 = 1;
      }
      if (((DAT_801f3c3c & 0x1000) != 0) || ((DAT_801f3c3c & 0x100) != 0)) {
        iVar1 = 1;
      }
      if (iVar1 != 0) {
        DAT_801eec3c = 0;
        if (DAT_801eec40 == 2) {
          FUN_8009245c();
          gameModeRequest = 4;
          gameSubmodeRequest = 0x90;
        }
        else {
          if ((int)DAT_801eec40 < 2) {
            if (DAT_801eec40 == 0) {
              FUN_8009245c();
              DAT_801eec28 = DAT_801eec28 | 3;
              gameSubmodeRequest = 9;
            }
            else {
              if (-1 < (int)DAT_801eec40) {
                FUN_8009245c();
                DAT_801eec28 = DAT_801eec28 | 2;
                gameSubmodeRequest = 9;
              }
            }
          }
          else {
            if (DAT_801eec40 == 4) {
              FUN_8009245c();
              gameModeRequest = 3;
              gameSubmodeRequest = 0x5f;
            }
            else {
              if ((int)DAT_801eec40 < 4) {
                FUN_8009245c();
                DAT_801eec28 = DAT_801eec28 | 0x40002;
                gameSubmodeRequest = 9;
              }
            }
          }
        }
        return 1;
      }
      if (((((DAT_801f3b88 & 0x200) != 0) || ((DAT_801f3bc4 & 0x200) != 0)) ||
          ((DAT_801f3c00 & 0x200) != 0)) || ((DAT_801f3c3c & 0x200) != 0)) {
        DAT_801eec3c = 0;
      }
    }
    //lbl_80009B14
}
#endif
