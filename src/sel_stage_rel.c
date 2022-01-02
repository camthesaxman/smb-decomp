#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"

static int lbl_0000185D;

static void lbl_0x000001C0(void);
static void lbl_00000330(void);

void _prolog(void)
{
    func_80012510(lbl_00000330, lbl_00000C9C, NULL, NULL);
    lbl_0x000001C0();
    gameSubmodeRequest = SMD_SEL_STAGE_MAIN;
}

void _epilog(void) {}

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
    OSPanic("sel_stage_rel.c", 71, "\n");
}

static void lbl_0x000001C0(void)
{
    if (lbl_802F1EE0 & 0xA)
        return;

    modeCtrl.unk0 = 0;
    modeCtrl.playerCount = 1;
    modeCtrl.unk30 = 1;
    modeCtrl.unk28 = 0;
    modeCtrl.unk40 = 0;
    spritePoolInfo.unkC[0] = 2;
    spritePoolInfo.unkC[1] = 0;
    spritePoolInfo.unkC[2] = 0;
    spritePoolInfo.unkC[3] = 0;
    modeCtrl.unk2C = 0;

    func_8002FFEC();
    event_clear();
    g_something_with_iteratively_freeing_memory();
    func_800569B4(loadingStageIdRequest);
    load_stage(loadingStageIdRequest);
    call_something_with_bmp_bmp_com(5);
    preload_stage_files(loadingStageIdRequest);
    lbl_0000185D = loadingStageIdRequest;

    ev_run_init(EVENT_STAGE);
    ev_run_init(EVENT_CAMERA);
    ev_run_init(EVENT_SPRITE);
    ev_run_init(EVENT_SOUND);
    ev_run_init(EVENT_EFFECT);
    ev_run_init(EVENT_ITEM);
    ev_run_init(EVENT_STOBJ);
    ev_run_init(EVENT_BACKGROUND);
    ev_run_init(EVENT_REND_EFC);

    func_800972CC();
    camera_set_state(12);
    lbl_802F1FA4 = 0;
    func_800123DC();
    lbl_0x00000A24();
    lbl_0x00000C90();
    func_800668A0();
    loadingStageId = lbl_801F3A58.unk2E;
    func_800732DC(0, 0, 30);
    gameSubmodeRequest = 30;
}

static void lbl_00000330(void)
{
    int r3;

    if (lbl_802F1EE0 & 0xA)
        return;

    if (CONTROLLER_SOMETHING(0, PAD_BUTTON_UP))
    {
        if (--lbl_802F1BE0.unk0 < 0)
            lbl_802F1BE0.unk0 = 7;
    }
    else if (CONTROLLER_SOMETHING(0, PAD_BUTTON_DOWN))
    {
        if (++lbl_802F1BE0.unk0 >= 8)
           lbl_802F1BE0.unk0 = 0;
    }

    switch (lbl_802F1BE0.unk0)
    {
    case 0:
        modeCtrl.unk8 &= ~(1 << 0);
        modeCtrl.unk8 &= ~8;
        modeCtrl.unk8 &= ~0x10;
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_LEFT))
        {
            if (--loadingStageIdRequest < 1)
                loadingStageIdRequest = 1;
        }
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_RIGHT))
        {
            if (++loadingStageIdRequest > 200)
                loadingStageIdRequest = 200;
        }
        break;
    case 1:
        modeCtrl.unk4 = 0;
        modeCtrl.unk8 |=  (1 << 0);
        modeCtrl.unk8 &= ~(1 << 3);
        modeCtrl.unk8 &= ~(1 << 4);
        break;
    case 2:
        modeCtrl.unk4 = 1;
        modeCtrl.unk8 |=  (1 << 0);
        modeCtrl.unk8 &= ~(1 << 3);
        modeCtrl.unk8 &= ~(1 << 4);
        break;
    case 3:
        modeCtrl.unk4 = 2;
        modeCtrl.unk8 |=  (1 << 0);
        modeCtrl.unk8 &= ~(1 << 3);
        modeCtrl.unk8 &= ~(1 << 4);
        break;
    case 4:
        modeCtrl.unk4 = 0;
        modeCtrl.unk8 |=  (1 << 0);
        modeCtrl.unk8 |=  (1 << 3);
        modeCtrl.unk8 &= ~(1 << 4);
        break;
    case 5:
        modeCtrl.unk4 = 1;
        modeCtrl.unk8 |=  (1 << 0);
        modeCtrl.unk8 |=  (1 << 3);
        modeCtrl.unk8 &= ~(1 << 4);
        break;
    case 6:
        modeCtrl.unk4 = 2;
        modeCtrl.unk8 |=  (1 << 0);
        modeCtrl.unk8 |=  (1 << 3);
        modeCtrl.unk8 &= ~(1 << 4);
        break;
    case 7:
        modeCtrl.unk4 = 2;
        modeCtrl.unk8 |= (1 << 0);
        modeCtrl.unk8 |= (1 << 3);
        modeCtrl.unk8 |= (1 << 4);
        break;
    }
    if (lbl_802F1BE0.unk0 != 0)
    {
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_LEFT))
            lbl_802F1BE0.unk4--;
        if (CONTROLLER_SOMETHING(0, PAD_BUTTON_RIGHT))
            lbl_802F1BE0.unk4++;

        if (lbl_802F1BE0.unk4 < 1)
            r3 = 1;
        else
        {
            if (lbl_802F1BE0.unk4 > func_8006720C(modeCtrl.unk4, modeCtrl.unk8))
                r3 = func_8006720C(modeCtrl.unk4, modeCtrl.unk8);
            else
                r3 = lbl_802F1BE0.unk4;
        }
        lbl_802F1BE0.unk4 = r3;
        loadingStageIdRequest = func_80067100(modeCtrl.unk4, lbl_802F1BE0.unk4, modeCtrl.unk8);
    }
    if (lbl_0000185D != loadingStageIdRequest)
    {
        lbl_0x00000C94();
        func_8009245C();
        preload_stage_files(loadingStageIdRequest);
        lbl_0000185D = loadingStageIdRequest;
    }
    lbl_801F3A58.unk2E = loadingStageIdRequest;
    loadingStageId = loadingStageIdRequest;
    if (lbl_0000185D != currStageId && func_80092444() == 0)
    {
        ev_run_dest(EVENT_EFFECT);
        ev_run_dest(EVENT_ITEM);
        ev_run_dest(EVENT_STOBJ);
        ev_run_dest(EVENT_REND_EFC);
        func_800569B4(lbl_0000185D);
        load_stage(lbl_0000185D);
        ev_run_init(EVENT_EFFECT);
        ev_run_init(EVENT_ITEM);
        ev_run_init(EVENT_STOBJ);
        ev_run_init(EVENT_BACKGROUND);
        ev_run_init(EVENT_REND_EFC);
        camera_set_state(12);
        func_800972CC();
    }

    if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_A)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_B)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_X)
     || (controllerInfo[0].unk0[2].button & PAD_BUTTON_Y))
    {
        if (controllerInfo[0].unk0[0].button & PAD_BUTTON_Y)
            lbl_80206BC0[0] = 3;
        else if (controllerInfo[0].unk0[0].button & PAD_BUTTON_X)
            lbl_80206BC0[0] = 2;
        else if (controllerInfo[0].unk0[0].button & PAD_BUTTON_B)
            lbl_80206BC0[0] = 1;
        else
            lbl_80206BC0[0] = 0;
        lbl_0x00000C98();
        gameModeRequest = MD_GAME;
        gameSubmodeRequest = SMD_GAME_FIRST_INIT;
    }
}
