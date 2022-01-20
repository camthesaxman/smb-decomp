#include <stddef.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "camera.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"

struct StageViewInfo
{
    Vec unk0;
    Vec unkC;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    float unk20;
    float unk24;
    Vec unk28;
    float unk34;
    s16 unk38;
    s16 unk3A;
    s16 unk3C;
    s16 unk3E;
    u8 filler40[4];
    struct MovableStagePart *unk44;
    u8 filler48[4];
};  // size = 0x4C

extern struct StageViewInfo *stageViewInfo;

void ev_view_init(void)
{
    stageViewInfo = OSAlloc(sizeof(*stageViewInfo));
    if (stageViewInfo == NULL)
        OSPanic("view.c", 0x72, "cannot OSAlloc\n");
    memset(stageViewInfo, 0, sizeof(*stageViewInfo));
    func_800A7020(&stageViewInfo->unk28);
    stageViewInfo->unk20 = stageViewInfo->unk34 * 1.1313;
    stageViewInfo->unk24 = 0.75f;
    stageViewInfo->unk38 = -5632;
    stageViewInfo->unk3A = 0;
    if (movableStagePartCount > 0)
    {
        stageViewInfo->unk44 = OSAlloc(72 * sizeof(*stageViewInfo->unk44));
        if (stageViewInfo->unk44 == NULL)
            OSPanic("view.c", 0x7E, "cannot OSAlloc\n");
        memcpy(stageViewInfo->unk44, movableStageParts, 72 * sizeof(*stageViewInfo->unk44));
    }
    if (modeCtrl.unk28 == 1)
        camera_setup_singleplayer_viewport();
    func_800A6200();
    func_800A66E4();
    func_800A60AC();
}

void ev_view_main(void)
{
    Vec sp8;
    s8 cstickY, cstickX;

    func_800A6318();
    func_800A66FC();
    stageViewInfo->unk3A += controllerInfo[lbl_801EEC68.unk14].unk0[0].stickX * 5;
    stageViewInfo->unk24 -= controllerInfo[lbl_801EEC68.unk14].unk0[0].stickY * 0.0003;
    if (stageViewInfo->unk24 > 1.0)
        stageViewInfo->unk24 = 1.0f;
    else if (stageViewInfo->unk24 < 0.5)
        stageViewInfo->unk24 = 0.5f;
    cstickY = controllerInfo[lbl_801EEC68.unk14].unk0[0].substickY;
    cstickX = controllerInfo[lbl_801EEC68.unk14].unk0[0].substickX;
    stageViewInfo->unk3C += (cstickY * 64 - stageViewInfo->unk3C) >> 5;
    stageViewInfo->unk3E += (-cstickX * 0xC0 - stageViewInfo->unk3E) >> 5;
    mathutil_mtxA_from_translate(&stageViewInfo->unk28);
    mathutil_mtxA_rotate_y(stageViewInfo->unk3A);
    mathutil_mtxA_rotate_x(stageViewInfo->unk38);
    mathutil_mtxA_translate_xyz(0.0f, 0.0f, stageViewInfo->unk20 * stageViewInfo->unk24);
    mathutil_mtxA_rotate_x(-stageViewInfo->unk38);
    mathutil_mtxA_rotate_y(stageViewInfo->unk3E);
    mathutil_mtxA_rotate_x(stageViewInfo->unk38);
    mathutil_mtxA_rotate_x(stageViewInfo->unk3C);
    mathutil_mtxA_tf_point_xyz(&stageViewInfo->unk0, 0.0f, 0.0f, 0.0f);  // why?
    mathutil_mtxA_tf_point_xyz(&stageViewInfo->unkC, 0.0f, 0.0f, -10.0f);

    sp8.x = stageViewInfo->unkC.x - stageViewInfo->unk0.x;
    sp8.y = stageViewInfo->unkC.y - stageViewInfo->unk0.y;
    sp8.z = stageViewInfo->unkC.z - stageViewInfo->unk0.z;
    stageViewInfo->unk1A = mathutil_atan2(sp8.x, sp8.z) - 32768;
    stageViewInfo->unk18 = mathutil_atan2(sp8.y, mathutil_sqrt(mathutil_sum_of_sq(sp8.x, sp8.z)));
    stageViewInfo->unk1C = 0;
    stageViewInfo->unk1E++;
    unpausedFrameCounter++;
}

void ev_view_dest(void)
{
    func_800A66CC();
    func_800A671C();
    func_800A61DC();
    if (stageViewInfo != NULL)
    {
        if (stageViewInfo->unk44 != NULL)
        {
            memcpy(movableStageParts, stageViewInfo->unk44, 72 * sizeof(*stageViewInfo->unk44));
            OSFree(stageViewInfo->unk44);
        }
        OSFree(stageViewInfo);
        stageViewInfo = NULL;
    }
    if (modeCtrl.unk28 == 1)
    {
        if (modeCtrl.unk28 == 1 && modeCtrl.playerCount == 3)
        {
            switch (modeCtrl.unk42)
            {
            default:
            case 0:
                camera_setup_splitscreen_viewports(3);
                break;
            case 1:
                setup_camera_viewport(0, 0.0f, 0.5f, 0.5f, 0.5f);
                setup_camera_viewport(1, 0.0f, 0.0f, 1.0f, 0.5f);
                setup_camera_viewport(2, 0.5f, 0.5f, 0.5f, 0.5f);
                setup_camera_viewport(3, 0.0f, 0.0f, 0.0f, 0.0f);
                break;
            case 2:
                setup_camera_viewport(0, 0.0f, 0.0f, 0.5f, 0.5f);
                setup_camera_viewport(1, 0.5f, 0.0f, 0.5f, 0.5f);
                setup_camera_viewport(2, 0.0f, 0.5f, 1.0f, 0.5f);
                setup_camera_viewport(3, 0.0f, 0.0f, 0.0f, 0.0f);
                break;
            case 3:
                camera_setup_splitscreen_viewports(4);
                break;
            }
        }
        else
            camera_setup_splitscreen_viewports(modeCtrl.playerCount);
    }
}

/*
const double lbl_802F5B80 = 1.1313;
const float lbl_802F5B88 = 0.75f;
const double lbl_802F5B90 = 0.00029999999999999997;
const double lbl_802F5B98 = 1;
const float lbl_802F5BA0 = 1f;
const double lbl_802F5BA8 = 0.5;
const float lbl_802F5BB0 = 0.5f;
const float lbl_802F5BB4 = 0f;
const float lbl_802F5BB8 = -10f;
const double lbl_802F5BC0 = 4503601774854144;
*/
