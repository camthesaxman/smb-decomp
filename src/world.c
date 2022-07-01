/**
 * world.c - Controls stage tilting
 */
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "ball.h"
#include "camera.h"
#include "info.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"
#include "world.h"

struct World *currentWorldStructPtr;
struct World worldInfo[4];
Vec lbl_80206CF0;

struct Struct80176434 tutorialStickInputs[] =
{
    {    0,     0,    0,    0 },
    {  240,     0,    0,    0 },
    {  300,  -384,    0,    0 },
    {  480,  -384,    0,    0 },
    {  540,  -256,    0,    0 },
    {  720,  -256,    0,    0 },
    {  780,   -32,    0,    0 },
    {  960,   -32,    0,    0 },
    { 1020,    23,    0,    0 },
    { 1170,    23,    0,    0 },
    { 1200,     0,    0,    0 },
    { 2160,     0,    0,    0 },
    { 2220,  -208,    0,    0 },
    { 2700,  -208,    0,    0 },
    { 2940,     0,    0,    0 },
    { 3000,  -384,    0,    0 },
    { 3060,  -384,    0,    0 },
    { 3090, -2624,    0,    0 },
    { 3360, -2624,    0,    0 },
    { 3390,     0,    0,    0 },
    { 3795,     0,    0,    0 },
    { 3796, -2048,    0,    0 },
    { 3870, -2048,    0,    0 },
    { 3900,     0,    0,    0 },
    { 4380,     0,    0,    0 },
    {    0,     0,    0,    0 },
    {  540,     0,    0,    0 },
    {  660,  -448,    0,    0 },
    {  780,     0,    0,    0 },
    { 2160,     0,    0,    0 },
    { 2220,   -44,    0,    0 },
    { 2280,   -44,    0,    0 },
    { 2340,     0,    0,    0 },
    { 2940,     0,    0,    0 },
    { 3060,   864,    0,    0 },
    { 3098,     0,    0,    0 },
    { 3120,     0,    0,    0 },
    { 3180,   128,    0,    0 },
    { 3240,     0,    0,    0 },
    { 4380,     0,    0,    0 },
};

struct Struct80176434 lbl_801B8228[] =
{
    {    0,     0,    0,    0 },
    { 1305,     0,    0,    0 },
    { 1306, -2048,    0,    0 },
    { 1556, -1280,    0,    0 },
    { 1635, -1280,    0,    0 },
    { 1636,  1280,    0,    0 },
    { 1739,   256,    0,    0 },
    { 1740,     0,    0,    0 },
    { 2168,     0,    0,    0 },
    { 2168, -1536,    0,    0 },
    { 2333, -2560,    0,    0 },
    { 2902, -2560,    0,    0 },
};

struct Struct80176434 lbl_801B82E8[] =
{
    {    0,     0,    0,    0 },
    { 1305,     0,    0,    0 },
    { 1306,  -960,    0,    0 },
    { 1471,  -960,    0,    0 },
    { 1739,  1728,    0,    0 },
    { 1740,     0,    0,    0 },
    { 2168,     0,    0,    0 },
    { 2168,     0,    0,    0 },
    { 2902,     0,    0,    0 },
};

struct Struct80176434 lbl_801B8378[] =
{
    {    0,     0,    0,    0 },
    { 1739,     0,    0,    0 },
    { 1740,     0,    0,    0 },
    { 1794,     0,    0,    0 },
    { 1795,     0,    0,    0 },
    { 1850,     0,    0,    0 },
    { 1960,     0,    0,    0 },
    { 1953,     0,    0,    0 },
    { 2167,     0,    0,    0 },
    { 2168, -2048,    0,    0 },
    { 2902, -2048,    0,    0 },
};

struct Struct80176434 lbl_801B8428[] =
{
    {    0,     0,    0,    0 },
    { 1739,     0,    0,    0 },
    { 1740, -1536,    0,    0 },
    { 1795,  -256,    0,    0 },
    { 1953,     0,    0,    0 },
    { 2167,     0,    0,    0 },
    { 2168,     0,    0,    0 },
    { 2902,     0,    0,    0 },
};

struct Struct80176434 lbl_801B84A8[] =
{
    {    0,     0,    0,    0 },
    { 1739,     0,    0,    0 },
    { 1740,     0,    0,    0 },
    { 1953,     0,    0,    0 },
    { 2167,     0,    0,    0 },
    { 2168, -2048,    0,    0 },
    { 2902, -2048,    0,    0 },
};

struct Struct80176434 lbl_801B8518[] =
{
    {    0,     0,    0,    0 },
    { 1739,     0,    0,    0 },
    { 1740, -1536,    0,    0 },
    { 1795,  -128,    0,    0 },
    { 1953,     0,    0,    0 },
    { 2167,     0,    0,    0 },
    { 2168,     0,    0,    0 },
    { 2902,     0,    0,    0 },
};

struct Struct80176434 lbl_801B8598[] =
{
    {    0,     0,    0,    0 },
    { 1953,     0,    0,    0 },
    { 1954,     0,    0,    0 },
    { 2009,     0,    0,    0 },
    { 2167,     0,    0,    0 },
    { 2168, -3072,    0,    0 },
    { 2333, -1536,    0,    0 },
    { 2902, -1536,    0,    0 },
};

struct Struct80176434 lbl_801B8618[] =
{
    {    0,     0,    0,    0 },
    { 1953,     0,    0,    0 },
    { 1954, -3072,    0,    0 },
    { 2009, -3072,    0,    0 },
    { 2167, -3072,    0,    0 },
    { 2168,     0,    0,    0 },
    { 2902,     0,    0,    0 },
};

void *lbl_801B8688[] =
{
    lbl_801B8228,
    lbl_801B8378,
    lbl_801B84A8,
    lbl_801B8598,
    lbl_801B82E8,
    lbl_801B8428,
    lbl_801B8518,
    lbl_801B8618,
};

void ev_world_init(void)
{
    struct World *world;
    int i;

    world = worldInfo;
    for (i = 0; i < 4; i++, world++)
    {
        world_clear(world);
        world->playerId = i;
    }
    lbl_80206CF0.x = 0.0f;
    lbl_80206CF0.y = -1.0f;
    lbl_80206CF0.z = 0.0f;
}

void ev_world_main(void)
{
    struct World *world = worldInfo;
    s8 *unk = g_poolInfo.unk0.unkC;
    int i;
    Vec sp8;

    for (i = 0; i < g_poolInfo.unk0.unk8; i++, world++, unk++)
    {
        if (*unk == 0 || *unk == 4)
            continue;
        world->playerId = i;
        switch (world->state)
        {
        case WORLD_STATE_INPUT_INIT:
            world_sub_input_init(world);
            break;
        case WORLD_STATE_INPUT_MAIN:
            world_sub_input_main(world);
            break;
        case 6:
            world_sub_6(world);
            // fall through
        case 7:
            world_sub_7(world);
            break;
        case 8:
            world_sub_8(world);
            // fall through
        case 9:
            world_sub_9(world);
            break;
        case 10:
            world_sub_10(world);
            // fall through
        case 11:
            world_sub_11(world);
            break;
        }
        if (world->unk20 > 0)
            world->unk20--;
    }

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_COMPETITION:
    case GAMETYPE_MINI_RACE:
    case GAMETYPE_MINI_FIGHT:
        sp8.x = 0.0f;
        sp8.y = 0.0f;
        sp8.z = 0.0f;
        unk = g_poolInfo.unk0.unkC;
        world = worldInfo;
        for (i = g_poolInfo.unk0.unk8; i > 0; i--, world++, unk++)
        {
            if (*unk == 0 || *unk == 4)
                continue;
            sp8.x += world->unk10.x;
            sp8.y += world->unk10.y;
            sp8.z += world->unk10.z;
        }
        if (sp8.x != 0.0f || sp8.y != 0.0f || sp8.z != 0.0f)
        {
            lbl_80206CF0 = sp8;
            mathutil_vec_normalize_len(&lbl_80206CF0);
        }
        else
        {
            lbl_80206CF0.x = 0.0f;
            lbl_80206CF0.y = 0.0f;
            lbl_80206CF0.z = 0.0f;
        }
        break;
    default:
        lbl_80206CF0 = worldInfo[modeCtrl.currPlayer].unk10;
        break;
    }
}

void ev_world_dest(void)
{
    WORLD_FOREACH(
        memset(world, 0, sizeof(*world));
        world->unk10.y = -1.0f;
        world->unk1C = 1.0f;
    )
    lbl_80206CF0.x = 0.0f;
    lbl_80206CF0.y = -1.0f;
    lbl_80206CF0.z = 0.0f;
}

void world_clear(struct World *world)
{
    memset(world, 0, sizeof(*world));
    world->unk10.y = -1.0f;
    world->unk1C = 1.0f;
}

void world_sub_input_init(struct World *world)
{
    world_clear(world);
    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MINI_FIGHT:
        world->maxTilt = 34.5f;
        break;
    default:
        world->maxTilt = 23.0f;
        break;
    }
    world->state = WORLD_STATE_INPUT_MAIN;
}

void world_sub_input_main(struct World *world)
{
    int inpXRot;
    int inpYRot;
    Vec spC;

    if (gamePauseStatus & 0xA)
        return;

    if (gameMode == MD_ADV && !(advDemoInfo.flags & (1 << 8)) && gameSubmode != SMD_ADV_INFO_MAIN)
        return;

    if (gameSubmode == SMD_ADV_INFO_MAIN)
    {
        float f31 = 4380 - modeCtrl.submodeTimer;

        world->xrotPrev = world->xrot;
        world->zrotPrev = world->zrot;
        inpXRot = advTutorialInfo.stickXRot = func_8008CDC0(f31, &tutorialStickInputs[0]);
        inpYRot = advTutorialInfo.stickZRot = func_8008CDC0(f31, &tutorialStickInputs[0x19]);

        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(cameraInfo[world->playerId].rotY);
        mathutil_mtxA_rotate_x(inpXRot);
        mathutil_mtxA_rotate_z(inpYRot);
        spC.x = 0.0f;
        spC.y = 1.0f;
        spC.z = 0.0f;
        mathutil_mtxA_tf_vec(&spC, &spC);
        inpXRot = (s16)mathutil_atan2(spC.z, spC.y);
        inpYRot = -(s16)mathutil_atan2(spC.x, mathutil_sqrt(mathutil_sum_of_sq_2(spC.z, spC.y)));
    }
    else
    {
        if (advDemoInfo.flags & (1 << 8))
        {
            float t = advDemoInfo.unk8;

            world->xrotPrev = world->xrot;
            world->zrotPrev = world->zrot;
            inpXRot = advTutorialInfo.stickXRot = func_8008CDC0(t, lbl_801B8688[world->playerId]);
            inpYRot = advTutorialInfo.stickZRot = func_8008CDC0(t, lbl_801B8688[world->playerId + 4]);
        }
        else if ((ballInfo[world->playerId].flags & (1 << 12))
         || world->unk20 > 0
         || (ballInfo[world->playerId].state == 23 && ballInfo[world->playerId].unk148 == 2))
        {
            inpXRot = 0;
            inpYRot = 0;
        }
        else  // normal controller input
        {
            float stickX;
            float stickY;

            world->xrotPrev = world->xrot;
            world->zrotPrev = world->zrot;
            stickX = controllerInfo[lbl_80206BD0[world->playerId]].unk0[0].stickX / 60.0;
            stickY = -(float)controllerInfo[lbl_80206BD0[world->playerId]].unk0[0].stickY / 60.0;

            if (stickX < -1.0)
                stickX = -1.0f;
            else if (stickX > 1.0)
                stickX = 1.0f;

            if (stickY < -1.0)
                stickY = -1.0f;
            else if (stickY > 1.0)
                stickY = 1.0f;

            inpXRot = stickY * DEGREES_TO_S16(world->maxTilt);
            inpYRot = -stickX * DEGREES_TO_S16(world->maxTilt);

            mathutil_mtxA_from_identity();
            mathutil_mtxA_rotate_y(cameraInfo[world->playerId].rotY);
            mathutil_mtxA_rotate_x(inpXRot);
            mathutil_mtxA_rotate_z(inpYRot);
            spC.x = 0.0f;
            spC.y = 1.0f;
            spC.z = 0.0f;
            mathutil_mtxA_tf_vec(&spC, &spC);
            inpXRot = mathutil_atan2(spC.z, spC.y);
            inpYRot = -mathutil_atan2(spC.x, mathutil_sqrt(mathutil_sum_of_sq_2(spC.z, spC.y)));
        }
    }

    // smooth input
    inpXRot = (s16)(inpXRot - world->xrot);
    inpYRot = (s16)(inpYRot - world->zrot);
    world->xrot += inpXRot * 0.2;
    world->zrot += inpYRot * 0.2;

    if (gameSubmode == SMD_MINI_TEST0_MAIN)
    {
        world->xrot = 0;
        world->zrot *= 0.8;
    }
    if (gameSubmode == SMD_MINI_GOLF_MAIN)
    {
        world->xrot = 0;
        world->zrot = 0;
    }
    spC.x = 0.0f;
    spC.y = -1.0f;
    spC.z = 0.0f;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_x(world->xrot);
    mathutil_mtxA_rotate_z(world->zrot);
    mathutil_mtxA_rigid_inv_tf_vec(&spC, &world->unk10);
}

void world_sub_6(struct World *world)
{
    world->state = 7;
}

void world_sub_7(struct World *world)
{
    s16 var1;
    s16 var2;
    Vec sp10;
    s16 spC[2];

    if (gamePauseStatus & 0xA)
        return;

    func_80049C1C(lbl_80250A68.unk0[world->playerId], spC, lbl_80250A68.unk10);
    var1 = -world->xrot;
    var2 = -world->zrot;
    world->xrot += var1 >> 2;
    world->zrot += var2 >> 2;
    sp10.x = 0.0f;
    sp10.y = -1.0f;
    sp10.z = 0.0f;
    if (infoWork.flags & INFO_FLAG_REPLAY)
    {
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_x(spC[0]);
        mathutil_mtxA_rotate_z(spC[1]);
        mathutil_mtxA_rigid_inv_tf_vec(&sp10, &world->unk10);
    }
    else
        world->unk10 = sp10;
}

void world_sub_8(struct World *world)
{
    world->state = 9;
}

void world_sub_9(struct World *world)
{
    s16 var1;
    s16 var2;
    s16 spC[2];
    Vec sp10;

    if (gamePauseStatus & 0xA)
        return;

    func_80049C1C(lbl_80250A68.unk0[world->playerId], spC, lbl_80250A68.unk10);
    var1 = spC[0] - world->xrot;
    var2 = spC[1] - world->zrot;
    world->xrot += var1 >> 2;
    world->zrot += var2 >> 2;
    sp10.x = 0.0f;
    sp10.y = -1.0f;
    sp10.z = 0.0f;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_x(world->xrot);
    mathutil_mtxA_rotate_z(world->zrot);
    mathutil_mtxA_rigid_inv_tf_vec(&sp10, &world->unk10);
}

void world_sub_10(struct World *world)
{
    world->state = 11;
}

void world_sub_11(struct World *world)
{
    float f1;
    Vec spC;
    int var;

    if (gamePauseStatus & 0xA)
        return;

    f1 = controllerInfo[lbl_80206BD0[world->playerId]].unk0[0].stickX / 60.0;
    if (f1 < -1.0)
        f1 = -1.0f;
    else if (f1 > 1.0)
        f1 = 1.0f;
    var = -f1 * 4096;
    var = (s16)(var - world->zrot);
    world->zrot += var * 0.2;
    world->zrot *= 0.8;
    spC.x = 0.0f;
    spC.y = -1.0f;
    spC.z = 0.0f;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_z(world->zrot);
    mathutil_mtxA_rotate_x(world->xrot);
    mathutil_mtxA_rigid_inv_tf_vec(&spC, &world->unk10);
}
