#include <float.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "gma.h"
#include "gxutil.h"
#include "hud.h"
#include "info.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "mot_ape.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "pool.h"
#include "recplay.h"
#include "sound.h"
#include "stage.h"
#include "stcoli.h"
#include "world.h"

#include "../data/common.gma.h"
#include "../data/common.nlobj.h"

struct Ball *currentBallStructPtr;
void (*minigameRelBallCallback)(struct Ball *);
void (*lbl_802F1F10)(void);
u32 lbl_802F1F0C;
u32 lbl_802F1F08;

float lbl_80205E20[4];
Mtx lbl_80205E30;
struct Ball ballInfo[8];
s32 lbl_80206B80[16];
s32 playerCharacterSelection[MAX_PLAYERS];
s32 lbl_80206BD0[4];
s32 lbl_80206BE0[4];

FORCE_BSS_ORDER(lbl_80205E20)
FORCE_BSS_ORDER(lbl_80205E30)
FORCE_BSS_ORDER(ballInfo)
FORCE_BSS_ORDER(lbl_80206B80)
FORCE_BSS_ORDER(playerCharacterSelection)
FORCE_BSS_ORDER(lbl_80206BD0)
FORCE_BSS_ORDER(lbl_80206BE0)

void func_8003699C(struct Ape *ape)
{
    struct Ball *ball = &ballInfo[ape->ballId];
    Quaternion quat;
    Vec sp48;
    Vec sp3C = {0.0f, 1.0f, 0.0f};
    float f1;

    ball->unkA8.w /= 0.65f;
    ball->unkA8.x *= 0.65f;
    ball->unkA8.y *= 0.65f;
    ball->unkA8.z *= 0.65f;

    mathutil_quat_normalize(&ball->unkA8);
    mathutil_mtxA_from_quat(&ball->unkA8);
    mathutil_mtxA_to_mtx(lbl_80205E30);
    mathutil_mtxA_from_quat(&ape->unk60);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_left(lbl_80205E30);
    mathutil_mtxA_normalize_basis();

    if (!(ball->flags & BALL_FLAG_05))
    {
        float f31 = mathutil_vec_len(&ball->vel);
        float f1 = mathutil_vec_len(&ball->unkB8);

        if (f31 > 0.032407406717538834f)
        {
            if (f1 * 100.0f < ball->unkC4)
                ball->flags |= BALL_FLAG_05;
            else if (f1 * 3.0f < ball->unkC4 && f31 * 1.5f < ball->unkF8)
                ball->flags |= BALL_FLAG_05;
        }
    }

    if (!(ape->flags & (1 << 17)) && ball->unkA8.w < 0.9941f)
        return;

    mathutil_mtxA_to_mtx(lbl_80205E30);

    sp48 = (Vec){0.0f, 1.0f, 0.0f};
    mathutil_mtxA_rigid_inv_tf_vec(&sp48, &sp48);

    f1 = 1.0f - mathutil_vec_dot_normalized(&sp48, &sp3C);
    if (!(ape->flags & (1 << 17)) && f1 > 0.01f)
    {
        Vec sp30 = {0.0f, 1.0f, 0.0f};
        if (f1 > 1.999f)
            sp48 = (Vec){1.0f, 0.0f, 0.0f};
        else
            mathutil_vec_cross_prod(&sp30, &sp48, &sp48);
        mathutil_quat_from_axis_angle(&quat, &sp48, 0x38E);
    }
    else
    {
        mathutil_quat_from_dirs(&quat, &(Vec){0.0f, 1.0f, 0.0f}, &sp48);
    }

    mathutil_quat_normalize(&quat);
    mathutil_mtxA_from_quat(&quat);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_left(lbl_80205E30);
}

float func_80036CAC(struct Ape *ape)
{
    struct Ball *ball = &ballInfo[ape->ballId];
    Vec sp4C;
    Vec sp40;
    Quaternion sp30;
    float var1;

    sp4C = ball->vel;
    sp4C.y = 0.0f;

    if (mathutil_vec_len(&sp4C) < 0.00027777777f)
        return 0.0f;

    mathutil_vec_normalize_len(&sp4C);
    mathutil_mtxA_rigid_inv_tf_vec(&sp4C, &sp4C);

    sp40 = (Vec){0.0f, 0.0f, 0.0f};

    var1 = sp4C.x;
    if (var1 > -0.992f)
    {
        float one = 1.0f;  // useless; needed to match
        Vec sp24 = {-1.0f, 0.0f, 0.0f};

        var1 = 1.0f - var1;
        if (var1 > 9.9999999392252903e-09f)
            mathutil_vec_cross_prod(&sp24, &sp4C, &sp40);
        else
        {
            sp40.x = 0.0f;
            sp40.y = 1.0f;
            sp40.z = 0.0f;
        }
        mathutil_quat_from_axis_angle(&sp30, &sp40, 0x2D8);
    }
    else
    {
        mathutil_quat_from_dirs(&sp30, &(Vec){-1.0f, 0.0f, 0.0f}, &sp4C);
    }

    mathutil_mtxA_push();
    mathutil_mtxA_from_quat(&sp30);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_to_mtx(lbl_80205E30);
    mathutil_mtxA_pop();
    mathutil_mtxA_mult_right(lbl_80205E30);
    return mathutil_vec_len(&ball->unkB8) * 1.5f;
}

void func_80036EB8(struct Ape *ape)
{
    struct Ball *ball = &ballInfo[ape->ballId];
    struct RaycastHit sp70;
    struct RaycastHit sp54;
    Vec sp48;
    Vec sp3C;
    Vec spC[] =
    {
        {0.3f,   0.0f, 0.0f},
        {-0.25f, 0.0f, 0.0f},
        {0.1f,   0.0f, -0.2f},
        {0.1f,   0.0f, 0.2f},
    };
    int r29;
    u32 i;

    mathutil_mtxA_push();
    sp48.x = 1.0f;
    sp48.y = 0.0f;
    sp48.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp48, &sp48);
    r29 = -mathutil_atan2(sp48.z, sp48.x) - 32768;
    raycast_stage_down(&ball->pos, &sp70, NULL);
    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_rotate_y(r29);
    ball->flags &= ~BALL_FLAG_01;

    for (i = 0; i < 4; i++)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_tf_point(&spC[i], &sp48);
        raycast_stage_down(&sp48, &sp54, NULL);
        mathutil_mtxA_pop();
        if (sp54.flags == 0 || sp54.pos.y < sp70.pos.y - 1.0)
        {
            ball->flags |= BALL_FLAG_01;
            sp3C.x = sp48.x;
            sp3C.y = ball->pos.y - 1.0;
            sp3C.z = sp48.z;
            ape->unk54 = i;
            func_800390C8(3, &sp3C, 0.5f);
            break;
        }
    }
    mathutil_mtxA_pop();
}

int func_80037098(struct Ape *ape, struct Ball *ball)
{
    int ret;
    int var1;
    float var2;

    if (infoWork.unk22 != 1)
        ret = 5;
    else
        ret = infoWork.timerCurr * 5 / infoWork.timerMax;

    ret *= 2;
    if (ape->unk24 != 5)
        return ret;

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_COMPETITION:
        var1 = ball->winStreak;
        var2 = var1 * 0.2f;
        if (var2 > 3.0f)
            var2 = 3.0f;
        break;
    default:
        var1 = 0;
        var2 = 0.0f;
        break;
    }

    if (!(ape->flags & (1 << 13)))
    {
        if (ape->unkC2 > var1 || (ape->flags & (1 << 14)))
        {
            ret++;
            ape->unk0->unk3C = 1.0f;
            ape->flags |= 0x5000;
        }
        else
            ape->unk0->unk3C = var2 + 1.0f;
    }
    else
    {
        ape->flags |= 0x1000;
        mathutil_mtxA_push();
        mathutil_mtxA_from_quat(&ape->unk60);
        mathutil_mtxA_rotate_y(DEGREES_TO_S16(12.0f * var2 + 20.0f));
        mathutil_mtxA_to_quat(&ape->unk60);
        mathutil_mtxA_pop();
        ret++;
    }
    return ret;
}

static inline int func_8003721C_inline(struct Ball *ball)
{
    int i;

    if (!(ball->flags & BALL_FLAG_GOAL))
        return 2;

    for (i = 0; i < g_poolInfo.playerPool.count; i++)
    {
        if (ball->rank - 1 == ballInfo[i].rank
         && (u16)__abs(ball->unk12A - ballInfo[i].unk12A) < 30)
            return 3;
    }

    return 2;
}

void u_choose_ape_anim(struct Ape *ape, float speed)
{
    struct Ball *ball = &ballInfo[ape->ballId];
    int r29;
    int r28 = 0;
    int r27 = 0;

    if (modeCtrl.gameType == GAMETYPE_MINI_GOLF)
        return;

    if (gameSubmode == SMD_GAME_RESULT_MAIN || gameSubmode == SMD_GAME_RESULT_MENU)
    {
        speed = ape->unk54++;
        if (ball->rank == 0)
        {
            r29 = 1;
            r27 = 3;
        }
        else if (ball->rank == 4)
        {
            r29 = 9;
            r28 = 1;
        }
        else
        {
            r28 = (ball->rank - 1) * 2;
            r29 = 5;
        }
    }
    else
    {
        if (ape->flags & (1 << 8))
        {
            r29 = 1;
            r27 = 6;
            u_switch_ape_character_lod_maybe(ape, 0);
        }
        else if (ape->flags & (1 << 11))
        {
            r29 = 2;
            r28 = 13;
        }
        else if (ape->flags & (1 << 18))
        {
            r29 = 2;
            r28 = 16;
        }
        else if (gameSubmode == SMD_GAME_EXTRA_WAIT)
        {
            r29 = 5;
            r28 = 12;
        }
        else if (ape->flags & (1 << 1))
            r29 = 3;
        else if ((ball->flags & (BALL_FLAG_GOAL|BALL_FLAG_13)) && !(infoWork.flags & INFO_FLAG_REPLAY))
        {
            r29 = 5;
            if (gameMode == MD_ADV && gameSubmode == SMD_ADV_INFO_MAIN)
                r28 = 4;
            else if (gameSubmode == SMD_GAME_NAMEENTRY_MAIN)
            {
                r29 = 2;
                r28 = 14;
            }
            else if (infoWork.flags & INFO_FLAG_BONUS_STAGE)
            {
                r29 = 2;
                r28 = 15;
                if ((float)ape->unk0->unk38 > ape->unk0->unk3C * 90.0f)
                    ape->flags |= 0x4000;
            }
            else
                r28 = func_80037098(ape, ball);
        }
        else if (ball->flags & BALL_FLAG_14)
        {
            r29 = 2;
            r28 = 12;
            ape->flags |= 0x1000;
            if (ape->flags & (1 << 13))
                ball->flags &= ~BALL_FLAG_14;
        }
        else if (ball->flags & BALL_FLAG_TIMEOVER)
        {
            r29 = 9;
            if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
                r28 = func_8003721C_inline(ball);
            else if (!(infoWork.flags & INFO_FLAG_BONUS_STAGE))
                r28 = (infoWork.currFloor & 1) + 2;
            else
                r28 = 0;
        }
        else if (ball->flags & BALL_FLAG_05)
        {
            r29 = 4;
            speed = mathutil_vec_len(&ball->vel);
            lbl_80205E20[ball->playerId] = speed;
        }
        else if (ball->flags & BALL_FLAG_01)
        {
            r28 = ape->unk54;
            r29 = 2;
        }
        else if (ape->flags & 1)
        {
            r29 = 1;
            speed = ape->unk54++;
            if (gameSubmode == SMD_ADV_INFO_MAIN)
            {
                int r3 = (modeCtrl.submodeTimer < 0x9D8 && modeCtrl.submodeTimer > 0x8AC);
                r27 = (r3 != 0) ? 2 : 1;
            }
        }
        else
            r29 = 0;
    }
    if (r29 != 1 || gameSubmode == SMD_GAME_READY_MAIN)
        ape->unk54 = 0;
    u_set_ape_anim(ape, r29, r28, r27, speed);
}

void func_8003765C(struct Ape *ape)
{
    struct Ball *ball = &ballInfo[ape->ballId];

    mathutil_mtxA_push();
    mathutil_mtxA_from_quat(&ape->unk60);
    mathutil_mtxA_tf_vec_xyz(&ape->unk3C, 0.0f, -0.12f, 0.0f);
    mathutil_mtxA_pop();

    ape->unk30 = ball->pos;
    ape->unk48 = (Vec){0.0f, 0.0f, 0.0f};
}

// needed here due to float constant ordering
static float get_0_05(void) {return 0.05f;}

void func_80037718(/* struct Ape *unused */)
{
    Quaternion sp30;
    Vec sp24;

    mathutil_mtxA_to_mtx(lbl_80205E30);
    mathutil_mtxA_tf_vec_xyz(&sp24, -1.0f, 0.0f, 0.0f);
    if (sp24.y < 0.99f)
    {
        Vec sp18 = {0.0f, 1.0f, 0.0f};
        mathutil_vec_cross_prod(&sp24, &sp18, &sp24);
        mathutil_quat_from_axis_angle(&sp30, &sp24, 0x38E);
    }
    else
    {
        Vec spC = {0.0f, 1.0f, 0.0f};
        int unused;
        mathutil_quat_from_dirs(&sp30, &sp24, &spC);
    }
    mathutil_mtxA_from_quat(&sp30);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_right(lbl_80205E30);
}

void lbl_8003781C(struct Ape *ape, int b)
{
    struct Ball *r31;
    struct Ball *r29 = &ballInfo[ape->ballId];
    struct RaycastHit sp50;
    int r27;
    float speed;

    switch (b)
    {
    case 3:
        u_ape_free(ape);
        return;
    }

    if (gamePauseStatus & 0xA)
        return;

    raycast_stage_down(&r29->pos, &sp50, NULL);
    ape->flags &= -20;
    if (!(sp50.flags & 1) && r29->vel.y < -0.16203702986240387f)
        ape->flags |= 2;
    else if (mathutil_vec_len(&r29->unkB8) < 0.00027777777f)
        ape->flags |= 1;

    r27 = (r29->flags & BALL_FLAG_GOAL) != 0;
    r27 |= !(ape->flags & 3);
    func_8003699C(ape);
    if (r27)
    {
        speed = func_80036CAC(ape);
    }
    else
    {
        speed = 0.0f;
        mathutil_mtxA_from_quat(&ape->unk60);
        mathutil_mtxA_normalize_basis();
        if (ape->flags & (1 << 1))
            func_80037718(ape);
    }

    if (r29->flags & BALL_FLAG_05)
        speed = mathutil_vec_len(&r29->vel);

    func_80036EB8(ape);
    mathutil_mtxA_to_quat(&ape->unk60);
    u_choose_ape_anim(ape, speed);
    u_do_ape_anim(ape);
    if (!(ape->flags & (1 << 3)))
        func_8003765C(ape);
    func_8008C090(ape, &r29->unk104);
    r29->unk100 = 0;
    r29->unk110 = 0.0f;
}

void func_80037B1C() {}

void func_80037B20(void)
{
    struct Ball *ball = &ballInfo[0];
    struct Ball *ballBackup = currentBallStructPtr;
    s8 *r7 = g_poolInfo.playerPool.statusList;
    int i;

    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, r7++)
    {
        if (*r7 == 2)
        {
            currentBallStructPtr = ball;
            ball->ape->flags &= ~(1 << 14);
        }
    }
    currentBallStructPtr = ballBackup;
}

void ev_ball_init(void)
{
    int sp18[4];
    struct Ball *ball;
    s8 *r21;
    struct Ape *ape;
    s32 j;
    int i;

    for (j = 0; j < 16; j++)
        lbl_80206B80[j] = -1;

    ball = &ballInfo[0];
    r21 = g_poolInfo.playerPool.statusList;

    lbl_802F1F0C = 0;
    func_8008C4A0(1.0f);
    lbl_802F1F10 = NULL;
    func_8008BEF8(1);
    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_COMPETITION:
    case GAMETYPE_MINI_FIGHT:
        if (modeCtrl.playerCount > 2 && !(advDemoInfo.flags & (1 << 8)))
            func_8008BEF8(2);
        break;
    case GAMETYPE_MINI_RACE:
        if (modeCtrl.playerCount >= 2)
            func_8008BEF8(2);
        break;
    }

    for (i = 0; i < 4; i++)
        sp18[i] = 0;

    for (i = 0; i < 4; i++,  ball++, r21++)
    {
        if (*r21 == 0 || (modeCtrl.gameType != GAMETYPE_MINI_GOLF && *r21 == 4))
        {
            ball->unk0 = 0;
            ball->unk144 = NULL;
            ball->ape = NULL;
            continue;
        }

        currentBallStructPtr = ball;
        ball->playerId = i;
        u_ball_init_2(ball);
        ball->unk0 = 2;
        ball->state = 0;
        func_8004C754();
        func_8008BA24(1);
        ape = u_make_ape(playerCharacterSelection[i]);
        ball->ape = ape;
        ape->unk74 = 0;
        if (!(advDemoInfo.flags & (1 << 8)) && modeCtrl.unk30 > 1)
            ape->flags |= 0x100000;
        ball->unk14B = 0;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->startPos->yrot - 16384);
        ape->ballId = i;
        if (dipSwitches & DIP_APE_COLOR)
            ape->colorId = sp18[playerCharacterSelection[i]];
        else
            ape->colorId = i;
        if (advDemoInfo.flags & (1 << 8))
            ape->colorId = 0;
        ape->unk30 = decodedStageLzPtr->startPos->pos;
        mathutil_mtxA_to_quat(&ape->unk60);
        lbl_802F1F08 = 0;
        lbl_80205E20[i] = 0.0f;
        sp18[playerCharacterSelection[i]]++;
        switch (modeCtrl.gameType)
        {
        case GAMETYPE_MAIN_COMPETITION:
        case GAMETYPE_MINI_RACE:
        case GAMETYPE_MINI_FIGHT:
        case GAMETYPE_MINI_GOLF:
            break;
        default:
            if (!(advDemoInfo.flags & (1 << 8)))
                ape->unkC1 = ~(1 << i);
            break;
        }
        switch (modeCtrl.gameType)
        {
        case GAMETYPE_MINI_RACE:
        case GAMETYPE_MINI_FIGHT:
        case GAMETYPE_MINI_TARGET:
        case GAMETYPE_MINI_BOWLING:
            break;
        default:
            if (!(advDemoInfo.flags & (1 << 8)))
                lbl_80206B80[i] = func_8008D1DC(lbl_8003781C, ape, 5);
            break;
        }
        switch (modeCtrl.gameType)
        {
        case GAMETYPE_MAIN_COMPETITION:
        case GAMETYPE_MINI_FIGHT:
            if (advDemoInfo.flags & (1 << 8))
            {
                u_switch_ape_character_lod_maybe(ape, 0);
                lbl_802F1F0C |= 1 << (ape->charaId * 2);
            }
            else if (modeCtrl.playerCount > 2)
            {
                u_switch_ape_character_lod_maybe(ape, 2);
                lbl_802F1F0C |= 1 << (ape->charaId * 2 + 1);
            }
            else
            {
                u_switch_ape_character_lod_maybe(ape, 1);
                lbl_802F1F0C |= 1 << (ape->charaId * 2);
            }
            break;
        case GAMETYPE_MINI_RACE:
            switch (modeCtrl.playerCount)
            {
            case 1:
                u_switch_ape_character_lod_maybe(ape, 1);
                lbl_802F1F0C |= 1 << (ape->charaId * 2);
                break;
            case 2:
            case 3:
            case 4:
            default:
                u_switch_ape_character_lod_maybe(ape, 2);
                lbl_802F1F0C |= 1 << (ape->charaId * 2 + 1);
                break;
            }
            break;
        default:
            u_switch_ape_character_lod_maybe(ape, 0);
            lbl_802F1F0C |= 1 << (ape->charaId * 2);
            break;
        }
    }
    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_NORMAL:
    case GAMETYPE_MINI_TARGET:
    case GAMETYPE_MINI_BOWLING:
        currentBallStructPtr = &ballInfo[modeCtrl.currPlayer];
        break;
    default:
        currentBallStructPtr = &ballInfo[0];
        break;
    }
    func_8008BEF8(1);
}

struct Ape *func_800380A8(int a, int character, void (*c)(struct Ape *, int))
{
    struct Ape *ape = u_make_ape(character);

    ape->unk74 = 0;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(0x8000);
    lbl_80206B80[a] = func_8008D1DC(c, ape, 5);
    u_switch_ape_character_lod_maybe(ape, 0);
    mathutil_mtxA_to_quat(&ape->unk60);
    lbl_802F1F08 = 0;
    return ape;
}

struct BallPhysicsParams
{
    s16 oldModelId;
    float ballRadius;
    float unk8;  // gravity? acceleration?
    float restitution;  // controls bounciness
};

struct BallPhysicsParams ballPhysicsParams[] =
{
    {NLMODEL_common_BSKBALL,  0.5f, 0.009799992f, 0.5f},
    {NLMODEL_common_BALL_BLK, 0.5f,  0.02177776f, 0.1f},
};

s16 clearHemisphereOutsideParts[] = { CLEAR_HEMI_OUTSIDE, CLEAR_HEMI_OUTSIDE_L2, CLEAR_HEMI_OUTSIDE_L3 };
s16 clearHemisphereInsideParts[]  = { CLEAR_HEMI_INSIDE,  CLEAR_HEMI_INSIDE_L2,  CLEAR_HEMI_INSIDE_L3  };

/* Model IDs for ball parts for each color ball (3 LODs for each part)
 * Only the red, blue, yellow, and green ball colors are actually used
 * in the game.
 */
s16 coloredBallPartModelIDs[][9] =
{
        /*    LOD 1     */  /*      LOD 2      */  /*      LOD 3      */
    // red ball
    {
        RED_HEMI_INSIDE,    RED_HEMI_INSIDE_L2,    RED_HEMI_INSIDE_L3,
        RED_HEMI_OUTSIDE,   RED_HEMI_OUTSIDE_L2,   RED_HEMI_OUTSIDE_L3,
        SPHERE_EDGE_01_RED, SPHERE_EDGE_01_RED_L2, SPHERE_EDGE_01_RED_L3,
    },
    // blue ball
    {
        BLU_HEMI_INSIDE,    BLU_HEMI_INSIDE_L2,    BLU_HEMI_INSIDE_L3,
        BLU_HEMI_OUTSIDE,   BLU_HEMI_OUTSIDE_L2,   BLU_HEMI_OUTSIDE_L3,
        SPHERE_EDGE_07_BLU, SPHERE_EDGE_07_BLU_L2, SPHERE_EDGE_07_BLU_L3,
    },
    // yellow ball
    {
        YEL_HEMI_INSIDE,    YEL_HEMI_INSIDE_L2,    YEL_HEMI_INSIDE_L3,
        YEL_HEMI_OUTSIDE,   YEL_HEMI_OUTSIDE_L2,   YEL_HEMI_OUTSIDE_L3,
        SPHERE_EDGE_03_YEL, SPHERE_EDGE_03_YEL_L2, SPHERE_EDGE_03_YEL_L3,
    },
    // green ball
    {
        GRE_HEMI_INSIDE,    GRE_HEMI_INSIDE_L2,    GRE_HEMI_INSIDE_L3,
        GRE_HEMI_OUTSIDE,   GRE_HEMI_OUTSIDE_L2,   GRE_HEMI_OUTSIDE_L3,
        SPHERE_EDGE_05_GRE, SPHERE_EDGE_05_GRE_L2, SPHERE_EDGE_05_GRE_L3,
    },
    // purple ball
    {
        PUR_HEMI_INSIDE,    PUR_HEMI_INSIDE,       PUR_HEMI_INSIDE,
        PUR_HEMI_OUTSIDE,   PUR_HEMI_OUTSIDE,      PUR_HEMI_OUTSIDE,
        SPHERE_EDGE_09_PUR, SPHERE_EDGE_01_RED,    SPHERE_EDGE_01_RED,
    },
    // sky-blue ball
    {
        SKY_HEMI_INSIDE,    SKY_HEMI_INSIDE,       SKY_HEMI_INSIDE,
        SKY_HEMI_OUTSIDE,   SKY_HEMI_OUTSIDE,      SKY_HEMI_OUTSIDE,
        SPHERE_EDGE_06_SKY, SPHERE_EDGE_01_RED,    SPHERE_EDGE_01_RED,
    },
    // orange ball
    {
        ORA_HEMI_INSIDE,    ORA_HEMI_INSIDE,       ORA_HEMI_INSIDE,
        ORA_HEMI_OUTSIDE,   ORA_HEMI_OUTSIDE,      ORA_HEMI_OUTSIDE,
        SPHERE_EDGE_02_ORA, SPHERE_EDGE_01_RED,    SPHERE_EDGE_01_RED,
    },
    // bluish-purple ball
    {
        BPU_HEMI_INSIDE,    BPU_HEMI_INSIDE,       BPU_HEMI_INSIDE,
        BPU_HEMI_OUTSIDE,   BPU_HEMI_OUTSIDE,      BPU_HEMI_OUTSIDE,
        SPHERE_EDGE_08_BPU, SPHERE_EDGE_01_RED,    SPHERE_EDGE_01_RED,
    },
    // reddish-purple ball
    {
        RPU_HEMI_INSIDE,    RPU_HEMI_INSIDE,     RPU_HEMI_INSIDE,
        RPU_HEMI_OUTSIDE,   RPU_HEMI_OUTSIDE,    RPU_HEMI_OUTSIDE,
        SPHERE_EDGE_10_RPU, SPHERE_EDGE_01_RED,  SPHERE_EDGE_01_RED
    },
    // yellowish-green ball
    {
        YG_HEMI_INSIDE,     YG_HEMI_INSIDE,      YG_HEMI_INSIDE,
        YG_HEMI_OUTSIDE,    YG_HEMI_OUTSIDE,     YG_HEMI_OUTSIDE,
        SPHERE_EDGE_04_YG,  SPHERE_EDGE_01_RED,  SPHERE_EDGE_01_RED
    },
};

GXColor ballShadowColors[] =  // shadow colors
{
    {0x47, 0x5F, 0x5F, 0xFF},  // red ball
    {0x5F, 0x53, 0x47, 0xFF},  // blue ball
    {0x4D, 0x47, 0x5F, 0xFF},  // yellow ball
    {0x60, 0x48, 0x60, 0xFF},  // green ball
    {0x4D, 0x5F, 0x47, 0xFF},  // purple ball
    {0x5F, 0x4D, 0x47, 0xFF},  // sky-blue ball
    {0x47, 0x50, 0x5F, 0xFF},  // orange ball
    {0x59, 0x5F, 0x47, 0xFF},  // bluish-purple ball
    {0x47, 0x5F, 0x50, 0xFF},  // reddish-purple ball
    {0x59, 0x47, 0x5F, 0xFF},  // yellowish-green ball
};

void (*ballFuncs[])(struct Ball *) =
{
    ball_func_0,
    ball_func_1,
    ball_func_ready_main,
    ball_func_3,
    ball_func_4,
    ball_func_goal_init,
    ball_func_goal_main,
    ball_func_7,
    ball_func_replay_main,
    ball_func_7,
    ball_func_replay_main,
    ball_func_11,
    ball_func_12,
    ball_func_13,
    ball_func_14,
    ball_func_15,
    ball_func_16,
    ball_func_17,
    ball_func_18,
    ball_func_19,
    ball_func_20,
    ball_func_demo_init,
    ball_func_mini,
    ball_func_mini,
    ball_func_mini,
    ball_func_mini,
    ball_func_mini,
    ball_func_27,
    ball_func_28,
};

// hmm...
struct Color3f lbl_801B7CF8[] =  // + 0x180
{
    {1, 0, 0},
    {0.175f, 0.398f, 1},
    {0.986f, 1, 0.175f},
    {0.175f, 1, 0.342f},
    {3.643376007e-44, 2, 15},
    {0.1f, 5.605193857e-45, 2.802596929e-45},
    {2.942726775e-44, 2, 15},
    {0.1f, 7.006492322e-45, 4.203895393e-45},
    {3.783505854e-44, 1, 5},
    {0.05f, 0, 0},
    {3.082856622e-44, 1, 5},
    {0.05f, 0, 0},
    {3.363116314e-44, 3, 70},
    {0.05f, 8.407790786e-45, 0},
    {2.662467082e-44, 3, 70},
    {0.05f, 9.80908925e-45, 0},
    {3.222986468e-44, 2, 50},
    {0.05f, 0, 0},
    {2.522337236e-44, 2, 50},
    {0.05f, 0, 0},
    {7.006492322e-45, 8, 20},
    {0.28f, 1.261168618e-44, 0},
    {4.203895393e-45, 2, 20},
    {0.1f, 0, 0},
    {1.401298464e-44, 1, 40},
    {0.05f, 1.541428311e-44, 0},
    {1.121038771e-44, 2, 40},
    {0.05f, 1.681558157e-44, 0},
    {9.80908925e-45, 2, 20},
    {0.05f, 0, 0},
    {2.101947696e-44, 1, 40},
    {0.05f, 1.96181785e-44, 0},
    {1.821688004e-44, 2, 40},
    {0.05f, 2.101947696e-44, 0},
    {1.681558157e-44, 2, 20},
    {0.05f, 0, 0},
    {2.242077543e-44, 4, 80},
    {0.15f, 0, 0},
};

void ev_ball_main(void)
{
    Vec sp8;
    struct Ball *ball;
    s8 *r28;
    s8 *r3;
    int i;

    if (gamePauseStatus & 0xA)
        return;
    r28 = g_poolInfo.playerPool.statusList;
    ball = &ballInfo[0];
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, r28++)
    {
        if (*r28 == 0 || *r28 == 4)
            continue;

        currentBallStructPtr = ball;
        mathutil_mtx_copy(ball->unk30, ball->unkC8);
        ball->unk120 = ball->flags;
        ball->flags &= ~(BALL_FLAG_00|BALL_FLAG_02);
        func_8003CDB0(ball);
        func_800390C8(4, &ball->pos, 0.75f);
        ballFuncs[ball->state](ball);
        if (modeCtrl.gameType != GAMETYPE_MINI_RACE)
            func_80038528(ball);
    }

    r3 = g_poolInfo.playerPool.statusList;
    ball = &ballInfo[0];
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++)
    {
        if (r3[i] == 0 || r3[i] == 4)
            continue;
        ball->unk15C[0] = ball->unk15C[1] = ball->unk15C[2] = ball->unk15C[3] = 1.0f;
    }

    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        r28 = g_poolInfo.playerPool.statusList;
        ball = &ballInfo[0];
        for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++)
        {
            struct Ball *nextBall;
            int j;

            if (r28[i] == 0 || r28[i] == 4)
                continue;
            nextBall = ball + 1;
            for (j = i + 1; j < g_poolInfo.playerPool.count; j++, nextBall++)
            {
                float f29;
                float f2;
                float f1;

                if (r28[j] == 0 || r28[j] == 4)
                    continue;
                sp8.x = ball->pos.x - nextBall->pos.x;
                sp8.y = ball->pos.y - nextBall->pos.y;
                sp8.z = ball->pos.z - nextBall->pos.z;

                f2 = mathutil_sum_of_sq_3(sp8.x, sp8.y, sp8.z);
                f29 = ball->currRadius + nextBall->currRadius;
                if (f2 < (0.5 * f29) * (0.5 * f29))
                {
                    int k;

                    f1 = mathutil_sqrt(f2);
                    if (f1 < f29 * 0.25)
                        f1 = 0.0f;
                    else
                        f1 = (f1 - (f29 * 0.25)) / (f29 * 0.25);

                    for (k = 0; k < g_poolInfo.playerPool.count; k++)
                    {
                        if (j != k)
                        {
                            if (nextBall->unk15C[k] > f1)
                                nextBall->unk15C[k] = f1;
                        }
                        else
                        {
                            if (ball->unk15C[k] > f1)
                                ball->unk15C[k] = f1;
                        }
                    }
                }
            }
        }
    }

    if (lbl_802F1F10 != NULL)
        lbl_802F1F10();

    if (modeCtrl.gameType == GAMETYPE_MINI_RACE)
    {
        r28 = g_poolInfo.playerPool.statusList;
        ball = &ballInfo[0];
        for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, r28++)
        {
            if (*r28 == 0 || *r28 == 4)
                continue;
            currentBallStructPtr = ball;
            func_80038528(ball);
        }
    }

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_NORMAL:
    case GAMETYPE_MINI_TARGET:
    case GAMETYPE_MINI_BOWLING:
        currentBallStructPtr = &ballInfo[modeCtrl.currPlayer];
        break;
    default:
        currentBallStructPtr = &ballInfo[0];
        break;
    }
    func_8004C780();
}

#pragma force_active on
const Vec lbl_80117884 = {0.0f, 0.0f, 0.0f};
#pragma force_active off

void func_80038528(struct Ball *ball)
{
    Vec sp64;
    Vec sp58;
    Vec sp4C;
    Vec sp40;
    Vec sp34;
    Vec sp28;
    Vec sp1C;
    float f31;
    float f1;

    func_8003D3C4(ball);
    if (ball->flags & BALL_FLAG_02)
        func_8003C550(ball);

    mathutil_mtxA_from_mtx(ball->unk30);
    ball->unkC4 = mathutil_vec_len(&ball->unkB8);
    mathutil_mtxA_tf_vec_xyz(&sp58, 0.0f, 1.0f, 0.0f);
    mathutil_mtxA_tf_vec_xyz(&sp40, 1.0f, 0.0f, 0.0f);
    mathutil_mtxA_tf_vec_xyz(&sp28, 0.0f, 0.0f, 1.0f);
    sp1C.x = 0.0f;
    sp1C.y = -ball->currRadius;
    sp1C.z = 0.0f;
    mathutil_mtxA_rigid_inv_tf_vec(&sp1C, &sp1C);

    mathutil_mtxA_from_mtx(ball->unkC8);
    mathutil_mtxA_tf_vec(&sp1C, &ball->unkB8);
    ball->unkB8.y += ball->currRadius;
    mathutil_mtxA_tf_vec_xyz(&sp64, 0.0f, 1.0f, 0.0f);
    mathutil_mtxA_tf_vec_xyz(&sp4C, 1.0f, 0.0f, 0.0f);
    mathutil_mtxA_tf_vec_xyz(&sp34, 0.0f, 0.0f, 1.0f);

    f31 = mathutil_vec_dot_normalized(&sp64, &sp58);

    f1 = mathutil_vec_dot_normalized(&sp4C, &sp40);
    if (f31 > f1)
    {
        f31 = f1;
        sp64 = sp4C;
        sp58 = sp40;
    }
    f1 = mathutil_vec_dot_normalized(&sp34, &sp28);
    if (f31 > f1)
    {
        f31 = f1;
        sp64 = sp34;
        sp58 = sp28;
    }

    if (f31 > -0.9998f && f31 < 0.9998f)
        mathutil_quat_from_dirs(&ball->unkA8, &sp64, &sp58);
    else
        ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};

    func_8003CB88(ball);
    func_8003CCB0();
    if (modeCtrl.gameType != GAMETYPE_MINI_RACE)
        animate_ball_size_change(ball);
    func_8003CDC0(ball);
    if (ball->unk14E > 0)
        ball->unk14E--;
}

void ev_ball_dest(void)
{
    struct Ball *ball;
    int i;

    func_8004C7A8();
    for (i = 15; i >= 0; i--)
    {
        if (lbl_80206B80[i] != -1)
        {
            func_8008D29C(lbl_80206B80[i]);
            lbl_80206B80[i] = -1;
        }
    }

    ball = &ballInfo[0];
    for (i = 0; i < 4; i++, ball++)
        ball->unk0 = 0;
}

struct BallDrawNode
{
    struct OrdTblNode node;
    u32 unk8;
    u32 ballId;
};

void ball_draw_callback(struct BallDrawNode *);

void ball_draw(void)
{
    struct Ball *ball;
    s8 *r27;
    int i;
    int (*func)();
    BallEnvFunc envFunc;
    int unused;

    if (dipSwitches & DIP_OLD_BALL)
    {
        func = backgroundInfo.unk7C;
        if (gameMode == MD_GAME && modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION && modeCtrl.playerCount > 3)
            func = NULL;
    }

    r27 = g_poolInfo.playerPool.statusList;
    ball = &ballInfo[0];
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, r27++)
    {
        if (*r27 == 0 || *r27 == 4)
            continue;
        if (ball->flags & BALL_FLAG_INVISIBLE)
            continue;
        if ((lbl_801EEC90.unk0 & (1 << 2))
         && func_8000E4D0(&ball->pos) < 0.0f)
            continue;

        if (!(dipSwitches & DIP_OLD_BALL))  // draw new ball
        {
            struct BallDrawNode *node;
            struct OrdTblNode *entry;

            mathutil_mtxA_from_mtxB();
            entry = ord_tbl_get_entry_for_pos(&ball->pos);
            node = ord_tbl_alloc_node(sizeof(*node));
            node->node.drawFunc = (OrdTblDrawFunc)ball_draw_callback;
            node->unk8 = peek_light_group();
            node->ballId = i;
            ord_tbl_insert_node(entry, &node->node);
            continue;
        }

        // The following code is for drawing the old arcade ball

        func_8000E1A4(ball->unk15C[currentCameraStructPtr->unk204]);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_mult_right(ball->unk30);
        mathutil_mtxA_scale_s(ball->modelScale);
        nl2ngc_set_scale(ball->modelScale);

        if (dipSwitches & (DIP_STCOLI | DIP_TRIANGLE))
        {
            nl2ngc_draw_model_alpha_sort_all_alt(NLOBJ_MODEL(g_commonNlObj, ball->oldModelId), 0.3f);
        }
        else
        {
            nl2ngc_draw_model_sort_translucent_alt2(NLOBJ_MODEL(g_commonNlObj, ball->oldModelId));
        }

        if (func != NULL)
        {
            mathutil_mtxA_push();
            mathutil_mtxA_from_mtx(ball->unk30);
            if (func(NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_BSKBALL_FACE), lbl_802F1B4C) != 0)
            {
                mathutil_mtxA_pop();
                nl2ngc_draw_model_sort_none_alt(lbl_802F1B4C);
            }
            else
                mathutil_mtxA_pop();
        }

        envFunc = backgroundInfo.ballEnvFunc;
        if (envFunc != NULL)
        {
            u_avdisp_set_some_func_1(envFunc);
            u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            avdisp_draw_model_culled_sort_all(commonGma->modelEntries[ENV_ABSORBER].model);
            u_avdisp_set_some_func_1(NULL);
        }

        mathutil_mtxA_push();
        mathutil_mtxA_sq_from_identity();
        mathutil_mtxA_scale_s(ball->modelScale);
        nl2ngc_set_scale(ball->modelScale);
        nl2ngc_draw_model_sort_translucent_alt2(NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_BALL_EDGE));
        mathutil_mtxA_pop();

        u_reset_post_mult_color();
    }
}

struct
{
    u8 unk0[4];
    GXTexObj unk4;
} lbl_801B7EC0 = {{1, 0, 0, 0}};

void u_ball_shadow_something_1(void)
{
    struct Struct80092B98 sp18;
    Vec spC;
    int unused;
    GXTexObj *tex1;
    int r29;
    struct Ball *ball;
    s8 *r26;
    int i;

    r29 = advDemoInfo.flags & (1 << 8);
    if (r29 != 0 && (advDemoInfo.flags & (1 << 11)))
    {
        u_ball_shadow_something_2();
        return;
    }

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MINI_FIGHT:
        if (backgroundInfo.bgId == BG_TYPE_SPA || backgroundInfo.bgId == BG_TYPE_ICE2)
        {
            if (modeCtrl.playerCount > 3)
            {
                u_ball_shadow_something_2();
                return;
            }
        }
        break;
    case GAMETYPE_MINI_TARGET:
        return;
    default:
        if (modeCtrl.unk30 > 2)
        {
            u_ball_shadow_something_2();
            return;
        }
        break;
    }

    mathutil_mtxA_from_rotate_y(s_bgLightInfo.infLightRotY);
    mathutil_mtxA_rotate_x(s_bgLightInfo.infLightRotX);
    spC.x = 0.0f;
    spC.y = 0.0f;
    spC.z = -15.0f;
    mathutil_mtxA_tf_vec(&spC, &spC);

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_COMPETITION:
        sp18.unk2C = 2;
        sp18.unk30 = 0.1f;
        sp18.unk34 = 0.2f;
        break;
    default:
        sp18.unk2C = 0x22;
        sp18.unk30 = 0.025f;
        sp18.unk34 = get_0_05();  // 0.05f;
        break;
    }

    sp18.unk20.x = 0.0f;
    sp18.unk20.y = 1.0f;
    sp18.unk20.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp18.unk20, &sp18.unk20);

    tex1 = &commonGma->modelEntries[circle_white].model->texObjs[0];
    GXInitTexObj(&lbl_801B7EC0.unk4,
        GXGetTexObjData(tex1),
        GXGetTexObjWidth(tex1),
        GXGetTexObjHeight(tex1),
        GXGetTexObjFmt(tex1),
        0,
        0,
        GXGetTexObjMipMap(tex1));
    GXInitTexObjLOD(&lbl_801B7EC0.unk4, 1, 1, 0.0f, 0.0f, 0.0f, 0, 0, 0);

    sp18.unk3C = &lbl_801B7EC0;

    r26 = g_poolInfo.playerPool.statusList;
    ball = &ballInfo[0];
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, r26++)
    {
        if (*r26 == 0 || *r26 == 4)
            continue;
        if (ball->flags & BALL_FLAG_INVISIBLE)
            continue;
        sp18.unk38 = ballShadowColors[ball->colorId];
        sp18.unk0 = spC.x + ball->pos.x;
        sp18.unk4 = spC.y + ball->pos.y;
        sp18.unk8 = spC.z + ball->pos.z;
        sp18.unkC = 5.0f;
        sp18.unk10 = ball->pos;
        sp18.unk1C = ball->currRadius * 1.4f;
        if (r29 != 0)
            sp18.unk2E = 0xFFFF;
        else
        {
            switch (modeCtrl.gameType)
            {
            case GAMETYPE_MINI_FIGHT:
            case GAMETYPE_MINI_GOLF:
                sp18.unk2E = 0xFFFF;
                break;
            default:
                sp18.unk2E = 1 << ball->playerId;
                break;
            }
        }
        u_init_shadow_stuff_probably(&sp18);
    }
}

void u_ball_shadow_something_2(void)
{
    struct Struct8009492C sp30;
    struct RaycastHit hit;
    Vec sp8;
    struct Ball *ball;
    s8 *r25;
    int i;

    sp30.unk20 = 0.025f;
    sp30.unk24 = 0.05f;
    sp30.unk28 = commonGma->modelEntries[polyshadow01].model;

    ball = &ballInfo[0];
    r25 = g_poolInfo.playerPool.statusList;
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, r25++)
    {
        float f2;

        if (*r25 == 0 || *r25 == 4)
            continue;
        if (ball->flags & BALL_FLAG_INVISIBLE)
            continue;
        if (raycast_stage_down(&ball->pos, &hit, &sp8) == 0)
            continue;
        f2 = 1.0 - (ball->pos.y - hit.pos.y) * 0.2;
        if (f2 < 0.0f)
            continue;

        sp30.unk2C = ballShadowColors[ball->colorId];
        sp30.unk2C.r *= f2;
        sp30.unk2C.g *= f2;
        sp30.unk2C.b *= f2;

        sp30.unk14.x = ball->currRadius * (1.0f + 2.0f * (1.0f - f2));
        sp30.unk14.y = sp30.unk14.x;
        sp30.unk14.z = sp30.unk14.x;

        mathutil_vec_to_euler(&hit.normal, &sp30.unkC);
        sp30.unkC.z = ball->rotZ;
        sp30.unk0 = hit.pos;
        func_8009492C(&sp30);
    }
}

void give_bananas(int bananas)
{
    struct Ball *ball = currentBallStructPtr;

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_NORMAL:
        ball->bananas += bananas;
        if (ball->bananas >= 100)
        {
            ball->lives++;
            ball->bananas -= 100;
            hud_show_1up_banner(0x78);
            u_play_sound_0(0x2852);  // play 1-up sound?
        }
        break;
    case GAMETYPE_MAIN_COMPETITION:
    case GAMETYPE_MAIN_PRACTICE:
        ball->bananas += bananas;
        if (ball->bananas > 999)
            ball->bananas = 999;
        break;
    default:
        ball->bananas += bananas;
        break;
    }
}

void func_800390C8(int a, Vec *sphereCenter, float c)
{
    Vec sp50;
    Vec sp44;
    Mtx sp14;
    int i;
    struct Ball *ball;
    s8 *r29;
    int r28;

    ball = &ballInfo[0];
    r28 = currentBallStructPtr->playerId;
    r29 = g_poolInfo.playerPool.statusList;
    lbl_802F1F0C = 0;

    for (i = 0; i < 4; i++, ball++, r29++)
    {
        float f1;

        if (*r29 == 0)
            continue;
        if (a == 4 && r28 == i)
            continue;

        sp50.x = sphereCenter->x - ball->pos.x;
        sp50.y = sphereCenter->y - ball->pos.y;
        sp50.z = sphereCenter->z - ball->pos.z;
        f1 = mathutil_vec_normalize_len(&sp50);
        if (f1 > FLT_EPSILON)
            c /= f1;

        if (ball->unk110 > c)
            break;

        if (ball->flags & BALL_FLAG_00)
        {
            sp44.x = -ball->unk114.x;
            sp44.y = -ball->unk114.y;
            sp44.z = -ball->unk114.z;
        }
        else
        {
            sp44.x = ball->vel.x;
            sp44.y = ball->vel.y;
            sp44.z = ball->vel.z;
            if (sp44.y == 0.0)
                sp44.y = FLT_EPSILON;
            mathutil_vec_normalize_len(&sp44);
        }

        c *= (mathutil_vec_dot_prod(&sp44, &sp50) + 0.5) * 0.75;
        if (ball->unk110 > c)
            break;

        if (ball->ape != NULL)
            mathutil_mtxA_from_quat(&ball->ape->unk60);

        mathutil_mtxA_to_mtx(sp14);
        sp44.x = -sp14[0][0];
        sp44.y = -sp14[1][0];
        sp44.z = -sp14[2][0];

        c *= mathutil_vec_dot_prod(&sp44, &sp50) + 0.5;
        if (ball->unk110 < c)
        {
            ball->unk100 = a;
            ball->unk104 = *sphereCenter;
            ball->unk110 = c;
        }
    }
}

#pragma force_active on

// struct Ball?
struct Struct80039320
{
    u8 filler0[0x20];
    float unk20;
};

void unref_func_80039320(struct Ball *ball, struct Struct80039320 *b, int c)
{
    float f1;

    if (ball->flags & BALL_FLAG_18)
    {
        if (ball->unk13C < c)
            ball->unk13C = c;
        return;
    }

    ball->flags &= ~(BALL_FLAG_17|BALL_FLAG_18);
    ball->flags |= BALL_FLAG_18;
    ball->unk13C = c;

    f1 = ball->currRadius * 0.25f;
    if (b != NULL)
        b->unk20 += f1;
    else
        ball->vel.y += f1;
}

void unref_func_8003938C(struct Ball *ball, struct Struct80039320 *b, int c)
{
    float f1;

    if (ball->flags & BALL_FLAG_17)
    {
        if (ball->unk13C < c)
            ball->unk13C = c;
        return;
    }

    ball->flags &= ~(BALL_FLAG_17|BALL_FLAG_18);
    ball->flags |= BALL_FLAG_17;
    ball->unk13C = c;

    f1 = ball->currRadius * 0.125f;
    if (b != NULL)
        b->unk20 += f1;
    else
        ball->vel.y += f1;
}

void unref_func_800393F8(struct Ball *ball)
{
    ball->flags &= ~(BALL_FLAG_17|BALL_FLAG_18);
    ball->unk13C = 0;
}

#pragma force_active off

void u_ball_init_1(struct Ball *ball)
{
    struct Ball backup;

    backup.ape = ball->ape;
    backup.playerId = ball->playerId;

    memset(ball, 0, sizeof(*ball));

    switch (modeCtrl.gameType)
    {
    default:
        if (dipSwitches & DIP_SARU_0)
            ball->lives = 0;
        else
            ball->lives = 3;
        break;
    case GAMETYPE_MAIN_COMPETITION:
    case GAMETYPE_MAIN_PRACTICE:
        ball->lives = 2;
        break;
    }

    ball->bananas = 0;
    ball->unk134 = 0;
    ball->unk7C = 0;
    ball->ape = backup.ape;
    ball->playerId = backup.playerId;
    ball->winStreak = 0;
    ball->unk128 = 0;
}

void u_ball_init_2(struct Ball *ball)
{
    struct Ball backup;

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MAIN_PRACTICE:
        ball->bananas = 0;
        ball->unk7C = 0;
        break;
    case GAMETYPE_MAIN_COMPETITION:
        if (ball->flags & BALL_FLAG_23)
        {
            ball->bananas = ball->unk134;
            ball->flags &= ~BALL_FLAG_23;
        }
        ball->unk134 = ball->bananas;
        break;
    }

    backup.playerId = ball->playerId;
    backup.lives = ball->lives;
    backup.bananas = ball->bananas;
    backup.unk134 = ball->unk134;
    backup.unk7C = ball->unk7C;
    backup.ape = ball->ape;
    backup.winStreak = ball->winStreak;
    backup.unk128 = ball->unk128;

    memset(ball, 0, sizeof(*ball));

    ball->playerId = backup.playerId;
    ball->lives = backup.lives;
    ball->bananas = backup.bananas;
    ball->unk134 = backup.unk134;
    ball->unk7C = backup.unk7C;
    ball->ape = backup.ape;
    ball->winStreak = backup.winStreak;
    ball->unk128 = backup.unk128;

    func_8003C4A0(ball, 0);

    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_mtx(ball->unkC8);
}

void ball_func_0(struct Ball *ball)
{
    ball->vel.x = 0.0f;
    ball->vel.y = 0.0f;
    ball->vel.z = 0.0f;

    ball->unk60 = 0;
    ball->unk62 = 0;
    ball->unk64 = 0;
}

void ball_func_1(struct Ball *ball)
{
    u_ball_init_1(ball);
    ball_func_ready_main(ball);
}

void ball_func_ready_main(struct Ball *ball)
{
    u_ball_init_2(ball);

    ball->pos.x = decodedStageLzPtr->startPos->pos.x;
    ball->pos.y = decodedStageLzPtr->startPos->pos.y + ((ball->accel * 24.0) * 24.0) * 0.5;
    ball->pos.z = decodedStageLzPtr->startPos->pos.z;

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->flags |= BALL_FLAG_INVISIBLE;
    ball->ape->flags |= 0x20;
    ball->state = 0;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
}

void ball_func_3(struct Ball *ball)
{
    float f2;
    float zero;
    float f4;

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    f4 = modeCtrl.submodeTimer;
    f2 = (decodedStageLzPtr->startPos->pos.y - ball->pos.y) / f4;

    ball->vel.x = (zero = 0.0f);  // fake match
    ball->vel.y = (ball->accel * f4) * 0.5 + f2;
    ball->vel.z = zero;

    ball->rotX = 0x2000;
    ball->rotY = decodedStageLzPtr->startPos->yrot - 16384;
    ball->rotZ = 0;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_rotate_y(ball->rotY);
    mathutil_mtxA_rotate_x(ball->rotX);
    mathutil_mtxA_rotate_z(ball->rotZ);
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_mtx(ball->unkC8);

    ball->flags &= ~BALL_FLAG_INVISIBLE;
    ball->flags |= BALL_FLAG_14;
    if (ball->ape != NULL)
        ball->ape->flags &= ~(1 << 5);
    u_play_sound_0(0x1E);
    ball->state = 4;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unk98 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    mathutil_mtxA_to_quat(&ball->unkA8);
}

void ball_func_4(struct Ball *ball)
{
    struct PhysicsBall physBall;

    handle_ball_linear_kinematics(ball, &physBall, 0);
    handle_ball_rotational_kinematics(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    ball->unk80++;
}

void ball_func_goal_init(struct Ball *ball)
{
    ball->state = BALL_STATE_GOAL_MAIN;
    ball->flags |= (BALL_FLAG_08|BALL_FLAG_10);
    if (ball->flags & (BALL_FLAG_GOAL|BALL_FLAG_13))
        ball->flags |= BALL_FLAG_06;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball_func_goal_main(ball);
}

void ball_func_goal_main(struct Ball *ball)
{
    struct PhysicsBall physBall;

    if (!(ball->flags & BALL_FLAG_09)
     && (ball->ape->flags & (1 << 14)))
    {
        ball->flags &= ~(BALL_FLAG_08|BALL_FLAG_10);
        ball->flags |= BALL_FLAG_09;
        u_play_sound_0(0x126);
    }

    handle_ball_linear_kinematics(ball, &physBall, 1);
    handle_ball_rotational_kinematics(ball, &physBall, 1);
    update_ball_ape_transform(ball, &physBall, 1);
    ball->unk80++;
}

void ball_func_7(struct Ball *ball)
{
    struct ReplayBallFrame sp3C;
    Vec sp30;

    ball->unk80 = 0;
    ball->state = 10;
    ball->flags &= ~(BALL_FLAG_08|BALL_FLAG_09|BALL_FLAG_10);
    ball->flags &= ~BALL_FLAG_INVISIBLE;
    if (ball->ape != NULL)
        ball->ape->flags &= ~(1 << 5);
    func_800496BC(lbl_80250A68.unk0[ball->playerId], &sp3C, lbl_80250A68.unk10);
    ball->pos.x = sp3C.pos.x;
    ball->pos.y = sp3C.pos.y;
    ball->pos.z = sp3C.pos.z;
    ball->ape->unk30 = ball->pos;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball->ape->unk60 = ball->unk98;
    ball_func_replay_main(ball);
    sp30.x = ball->vel.x;
    sp30.y = 0.0f;
    sp30.z = ball->vel.z;
    if (sp30.x == 0.0 && sp30.z == 0.0)
    {
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->startPos->yrot);
        sp30.x = 0.0f;
        sp30.y = 0.0f;
        sp30.z = -1.0f;
        mathutil_mtxA_tf_vec(&sp30, &sp30);
    }
    func_8008C408(ball->ape, &sp30);
    mathutil_mtx_copy(ball->unk30, ball->unkC8);
}

void ball_func_replay_main(struct Ball *ball)
{
    struct ReplayBallFrame spC;

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    if (ball->playerId == lbl_80250A68.unk14)
        lbl_80250A68.unk10 -= 1.0f;

    func_800496BC(lbl_80250A68.unk0[ball->playerId], &spC, lbl_80250A68.unk10);

    ball->pos.x = spC.pos.x;
    ball->pos.y = spC.pos.y;
    ball->pos.z = spC.pos.z;

    ball->vel.x = ball->pos.x - ball->prevPos.x;
    ball->vel.y = ball->pos.y - ball->prevPos.y;
    ball->vel.z = ball->pos.z - ball->prevPos.z;

    ball->unk60 = spC.rotX - ball->rotX;
    ball->unk62 = spC.rotY - ball->rotY;
    ball->unk64 = spC.rotZ - ball->rotZ;

    ball->rotX = spC.rotX;
    ball->rotY = spC.rotY;
    ball->rotZ = spC.rotZ;

    ball->unk114.x = spC.unk12 * 3.0518509475997192e-05;
    ball->unk114.y = spC.unk14 * 3.0518509475997192e-05;
    ball->unk114.z = spC.unk16 * 3.0518509475997192e-05;

    ball->flags = spC.unk18 | BALL_FLAG_24;
    ball->unk130 = spC.unk1C;

    if (lbl_80250A68.unk10 <= 0.0 || !(infoWork.flags & INFO_FLAG_REPLAY))
        ball->state = 4;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_rotate_y(ball->rotY);
    mathutil_mtxA_rotate_x(ball->rotX);
    mathutil_mtxA_rotate_z(ball->rotZ);
    mathutil_mtxA_to_mtx(ball->unk30);
    ball->unk80++;
}

void ball_func_11(struct Ball *ball)
{
    u_ball_init_2(ball);

    ball->pos.x = decodedStageLzPtr->startPos->pos.x;
    ball->pos.y = decodedStageLzPtr->startPos->pos.y;
    ball->pos.z = decodedStageLzPtr->startPos->pos.z;

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->ape->unk30 = ball->pos;
    ball->ape->unk48.x = 0.0f;
    ball->ape->unk48.y = 0.0f;
    ball->ape->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball->ape->unk60 = ball->unk98;
    ball->rotY = s_bgLightInfo.infLightRotY + 0x2000;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(ball->rotY - 16384);
    mathutil_mtxA_to_quat(&ball->ape->unk60);
    ball->state = 12;
}

void ball_func_12(struct Ball *ball) {}

void ball_func_13(struct Ball *ball)
{
    u_ball_init_2(ball);

    ball->pos.x = decodedStageLzPtr->startPos->pos.x;
    ball->pos.y = decodedStageLzPtr->startPos->pos.y + 10.0;
    ball->pos.z = decodedStageLzPtr->startPos->pos.z;

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->ape->unk30 = ball->pos;
    ball->ape->unk48.x = 0.0f;
    ball->ape->unk48.y = 0.0f;
    ball->ape->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball->ape->unk60 = ball->unk98;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(decodedStageLzPtr->startPos->yrot - 16384);
    mathutil_mtxA_to_quat(&ball->ape->unk60);
    ball->state = 14;
}

void ball_func_14(struct Ball *ball) {}

#undef PI
#define PI 3.14159265

void ball_func_15(struct Ball *ball)
{
    Vec sp28;

    u_ball_init_2(ball);

    ball->pos.x = decodedStageLzPtr->startPos->pos.x;
    ball->pos.y = decodedStageLzPtr->startPos->pos.y + 10.0;
    ball->pos.z = decodedStageLzPtr->startPos->pos.z;

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->vel.x = 0.0f;
    ball->vel.y = 0.0f;
    ball->vel.z = 0.0f;

    sp28.x = (RAND_FLOAT() - 0.5) * 0.5;
    sp28.y = (RAND_FLOAT() - 0.5) * 0.5;
    sp28.z = (RAND_FLOAT() - 0.5) * 0.5;

    if (ball->currRadius > FLT_EPSILON && mathutil_vec_len(&sp28) != 0.0f)
    {
        float f1 = mathutil_vec_normalize_len(&sp28);

        mathutil_quat_from_axis_angle(
            &ball->unk98,
            &sp28,
            (f1 * 2.0f) / (ball->currRadius * ball->currRadius * PI) * 10430.3779296875);
    }

    ball->flags |= BALL_FLAG_06;
    ball->state = 4;
    ball->ape->unk30 = ball->pos;
    ball->ape->unk48.x = 0.0f;
    ball->ape->unk48.y = 0.0f;
    ball->ape->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball->ape->unk60 = ball->unk98;
}

void ball_func_17(struct Ball *ball)
{
    Vec sp68;
    struct PhysicsBall physBall;

    mathutil_mtxA_from_mtx(mathutilData->mtxB);
    mathutil_mtxA_rigid_inv_tf_tl(&sp68);
    sp68.x -= ball->pos.x;
    sp68.y = 0.0f;
    sp68.z -= ball->pos.z;
    mathutil_vec_set_len(&sp68, &sp68, 0.00064f);

    ball->vel.x += sp68.x;
    ball->vel.y += sp68.y;
    ball->vel.z += sp68.z;

    handle_ball_linear_kinematics(ball, &physBall, 0);
    handle_ball_rotational_kinematics(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    ball->unk80++;
}

void ball_func_16(struct Ball *ball)
{
    u_ball_init_2(ball);

    if (modeCtrl.submodeTimer == 0x111C)
    {
        ball->pos.x = decodedStageLzPtr->startPos->pos.x;
        ball->pos.y = decodedStageLzPtr->startPos->pos.y;
        ball->pos.z = decodedStageLzPtr->startPos->pos.z;
    }
    else
    {
        ball->pos.x = 14.5f;
        ball->pos.y = 2.5f;
        ball->pos.z = -13.5f;
    }

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->ape->unk30 = ball->pos;
    ball->ape->unk48.x = 0.0f;
    ball->ape->unk48.y = 0.0f;
    ball->ape->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;

    if (modeCtrl.submodeTimer != 0x111C)
    {
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->startPos->yrot + 0x4000);
        mathutil_mtxA_to_quat(&ball->ape->unk60);
    }
}

void ball_func_18(struct Ball *ball)
{
    u_ball_init_2(ball);

    ball->pos.y = ball->prevPos.y = ball->currRadius;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->rotX = 0x2000;
    ball->rotY = 0;
    ball->rotZ = 0;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_rotate_y(ball->rotY);
    mathutil_mtxA_rotate_x(ball->rotX);
    mathutil_mtxA_rotate_z(ball->rotZ);
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_mtx(ball->unkC8);

    ball->state = 0;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unk98 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->ape->unk60 = ball->unk98;

    mathutil_mtxA_to_quat(&ball->unkA8);
}

void ball_func_19(struct Ball *ball)
{
    ball->unk124 = 60;
    worldInfo[ball->playerId].unk20 = 0x5A;
    cameraInfo[ball->playerId].state = 4;
    u_play_sound_0(ball->lives == 1 ? 0x51 : 0x1D);
    u_play_sound_0(0x15);
    ball->state = 20;
}

void ball_func_20(struct Ball *ball)
{
    struct PhysicsBall physBall;
    Vec spC;

    handle_ball_linear_kinematics(ball, &physBall, 0);
    handle_ball_rotational_kinematics(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    ball->unk80++;

    if (--ball->unk124 > 0)
        return;

    ball->pos.x = ball->prevPos.x = decodedStageLzPtr->startPos->pos.x;
    ball->pos.y = ball->prevPos.y = decodedStageLzPtr->startPos->pos.y + ((ball->accel * 24.0) * 24.0) * 0.5;
    ball->pos.z = ball->prevPos.z = decodedStageLzPtr->startPos->pos.z;

    ball->vel.x = 0.0f;
    ball->vel.y = 0.0f;
    ball->vel.z = 0.0f;

    ball->unk80 = 0;

    ball->unk98.w = 1.0f;
    ball->unk98.x = 0.0f;
    ball->unk98.y = 0.0f;
    ball->unk98.z = 0.0f;

    ball->unk14E = 30;
    worldInfo[ball->playerId].unk20 = 30;

    spC.x = -mathutil_sin(decodedStageLzPtr->startPos->yrot);
    spC.y = 0.0f;
    spC.z = -mathutil_cos(decodedStageLzPtr->startPos->yrot);
    func_8008C408(ball->ape, &spC);

    cameraInfo[ball->playerId].state = 0;

    ball->flags &= ~BALL_FLAG_11;
    ball->state = 4;
}

void lbl_8000F790(struct Ape *, int);

void ball_func_demo_init(struct Ball *ball)
{
    u_ball_init_2(ball);

    ball->colorId = 3;

    if (!(advDemoInfo.flags & (1 << 6)))
        lbl_80206B80[ball->playerId] = func_8008D1DC(lbl_8000F790, ball->ape, 5);

    ball->pos.x = decodedStageLzPtr->startPos->pos.x;
    ball->pos.y = decodedStageLzPtr->startPos->pos.y;
    ball->pos.z = decodedStageLzPtr->startPos->pos.z;

    if (currStageId == ST_013_REPULSE && ball->ape->charaId == 0)
    {
        ball->pos.x = 0.0f;
        ball->pos.y = 0.5f;
        ball->pos.z = 20.0f;
    }
    else if (currStageId == ST_009_EXAM_A && ball->ape->charaId == 2)
    {
        ball->pos.x = -5.6f;
        ball->pos.y = -2.0f;
        ball->pos.z = -1.6f;
    }
    else if (currStageId == ST_009_EXAM_A)
    {
        ball->pos.x = -5.4f;
        ball->pos.y = -2.0f;
        ball->pos.z = -3.1f;
    }
    else if (currStageId == ST_021_CHOICE && ball->ape->charaId == 3)
    {
        ball->pos.x = 0.0f;
        ball->pos.y = 0.51f;
        ball->pos.z = 3.0f;
    }
    else if (currStageId == ST_095_BONUS_HUNTING && ball->ape->charaId == 0)
    {
        ball->pos.x = -1.0f;
        ball->pos.y = -42.49f;
        ball->pos.z = 156.0f;
    }
    else if (currStageId == ST_095_BONUS_HUNTING && ball->ape->charaId == 1)
    {
        ball->pos.x = 1.0f;
        ball->pos.y = -42.49f;
        ball->pos.z = 158.0f;
    }
    else if (currStageId == ST_095_BONUS_HUNTING && ball->ape->charaId == 2)
    {
        ball->pos.x = -3.0f;
        ball->pos.y = -42.49f;
        ball->pos.z = 157.0f;
    }
    else if (currStageId == ST_095_BONUS_HUNTING && ball->ape->charaId == 3)
    {
        ball->pos.x = 3.0f;
        ball->pos.y = -42.49f;
        ball->pos.z = 159.0f;
    }

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->ape->unk30 = ball->pos;
    ball->ape->unk48.x = 0.0f;
    ball->ape->unk48.y = 0.0f;
    ball->ape->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->ape->flags &= ~(1 << 14);
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;

    if (currStageId == ST_009_EXAM_A && ball->ape->charaId == 2)
    {
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->startPos->yrot + 0x10000 - 0x8000);
        mathutil_mtxA_to_quat(&ball->ape->unk60);
    }
    else if (currStageId == ST_009_EXAM_A && ball->ape->charaId == 1)
    {
        // same exact thing as the above
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->startPos->yrot + 0x10000 - 0x8000);
        mathutil_mtxA_to_quat(&ball->ape->unk60);
    }
    else if (currStageId == ST_028_CHASER && ball->ape->charaId == 0)
    {
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->startPos->yrot);
        mathutil_mtxA_to_quat(&ball->ape->unk60);
    }

    ball->state = 4;
}

void ball_func_mini(struct Ball *ball)
{
    if (minigameRelBallCallback != NULL)
        minigameRelBallCallback(ball);
}

static void func_8003B0F4_inline(struct Ball *ball)
{
    struct PhysicsBall physBall;

    handle_ball_linear_kinematics(ball, &physBall, 1);
    handle_ball_rotational_kinematics(ball, &physBall, 1);
    update_ball_ape_transform(ball, &physBall, 1);
    ball->unk80++;
}

void ball_func_27(struct Ball *ball)
{
    ball->state = 28;
    ball->flags |= (BALL_FLAG_08|BALL_FLAG_10);
    if (ball->flags & (BALL_FLAG_GOAL|BALL_FLAG_13))
        ball->flags |= BALL_FLAG_06;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;

    if (!(ball->flags & BALL_FLAG_09) && (ball->ape->flags & (1 << 14)))
    {
        ball->flags &= ~(BALL_FLAG_08|BALL_FLAG_10);
        ball->flags |= BALL_FLAG_09;
        u_play_sound_0(0x126);
    }

    func_8003B0F4_inline(ball);
}

void ball_func_28(struct Ball *ball)
{
    struct PhysicsBall physBall;

    if (!(ball->flags & BALL_FLAG_09) && (ball->ape->flags & (1 << 14)))
    {
        ball->flags &= ~(BALL_FLAG_08|BALL_FLAG_10);
        ball->flags |= BALL_FLAG_09;
        u_play_sound_0(0x126);
    }

    handle_ball_linear_kinematics_ignore_collision(ball, &physBall, 1);
    handle_ball_rotational_kinematics(ball, &physBall, 1);
    update_ball_ape_transform(ball, &physBall, 1);
    ball->unk80++;
}

void handle_ball_linear_kinematics(struct Ball *ball, struct PhysicsBall *physBall, int c)
{
    Vec stageUp;  // up vector with stage tilt. doesn't seem to be used for anything
    Vec accel;  // acceleration due to gravity

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    ball->unkF8 = mathutil_vec_len(&ball->vel);
    ball->flags &= ~BALL_FLAG_05;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_x(worldInfo[ball->playerId].xrot);
    mathutil_mtxA_rotate_z(worldInfo[ball->playerId].zrot);
    stageUp.x = 0.0f;
    stageUp.y = 1.0f;
    stageUp.z = 0.0f;
    mathutil_mtxA_tf_vec(&stageUp, &stageUp);

    accel.x = 0.0f;
    accel.y = -ball->accel;
    accel.z = 0.0f;
    if (ball->flags & BALL_FLAG_09)
        accel.y = -accel.y;
    else if (ball->flags & BALL_FLAG_08)
        accel.y = 0.0f;

    if (!(ball->flags & BALL_FLAG_16)
     && gameSubmode != SMD_ADV_INFO_MAIN
     && c == 0
     && (ball->unk120 & 1))
    {
        Vec vel = ball->vel;
        float f1 = mathutil_sum_of_sq_2(vel.x, vel.z);

        if (f1 > FLT_EPSILON)
        {
            f1 = 1.0 / mathutil_sqrt(f1);
            vel.x *= f1;
            vel.z *= f1;
            f1 = -mathutil_sin(cameraInfo[ball->playerId].rotY) * vel.x
               + -mathutil_cos(cameraInfo[ball->playerId].rotY) * vel.z;
            if (f1 < 0.0)
            {
                f1 = -f1 * -0.65 + 1.0;
                accel.x *= f1;
                accel.y *= f1;
                accel.z *= f1;
            }
        }
    }

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_x(worldInfo[ball->playerId].xrot);
    mathutil_mtxA_rotate_z(worldInfo[ball->playerId].zrot);
    mathutil_mtxA_rigid_inv_tf_vec(&accel, &accel);

    ball->vel.x += accel.x;
    ball->vel.y += accel.y;
    ball->vel.z += accel.z;

    ball->pos.x += ball->vel.x;
    ball->pos.y += ball->vel.y;
    ball->pos.z += ball->vel.z;

    init_physball_from_ball(ball, physBall);
    collide_ball_with_stage(physBall, decodedStageLzPtr);
    func_8003CB3C(ball, physBall);

    if (physBall->flags & 1)
    {
        if (physBall->hardestColiAnimGroupId == 0)
        {
            ball->unk114.x = -physBall->hardestColiPlane.normal.x;
            ball->unk114.y = -physBall->hardestColiPlane.normal.y;
            ball->unk114.z = -physBall->hardestColiPlane.normal.z;
        }
        else
        {
            mathutil_mtxA_from_mtx(animGroups[physBall->hardestColiAnimGroupId].transform);
            mathutil_mtxA_tf_vec(&physBall->hardestColiPlane.normal, &ball->unk114);
            ball->unk114.x = -ball->unk114.x;
            ball->unk114.y = -ball->unk114.y;
            ball->unk114.z = -ball->unk114.z;
        }
    }
}

void handle_ball_linear_kinematics_ignore_collision(struct Ball *ball, struct PhysicsBall *physBall, int c)
{
    Vec stageUp;  // up vector with stage tilt. doesn't seem to be used for anything
    Vec accel;  // acceleration due to gravity

    ball->prevPos.x = ball->pos.x;
    ball->prevPos.y = ball->pos.y;
    ball->prevPos.z = ball->pos.z;

    ball->unkF8 = mathutil_vec_len(&ball->vel);
    ball->flags &= ~BALL_FLAG_05;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_x(worldInfo[ball->playerId].xrot);
    mathutil_mtxA_rotate_z(worldInfo[ball->playerId].zrot);
    stageUp.x = 0.0f;
    stageUp.y = 1.0f;
    stageUp.z = 0.0f;
    mathutil_mtxA_tf_vec(&stageUp, &stageUp);

    accel.x = 0.0f;
    accel.y = -ball->accel;
    accel.z = 0.0f;
    if (ball->flags & BALL_FLAG_09)
        accel.y = -accel.y;
    else if (ball->flags & BALL_FLAG_08)
        accel.y = 0.0f;

    if (!(ball->flags & BALL_FLAG_16)
     && gameSubmode != SMD_ADV_INFO_MAIN
     && c == 0
     && (ball->unk120 & 1))
    {
        Vec vel = ball->vel;
        float f1 = mathutil_sum_of_sq_2(vel.x, vel.z);

        if (f1 > FLT_EPSILON)
        {
            f1 = 1.0 / mathutil_sqrt(f1);
            vel.x *= f1;
            vel.z *= f1;
            f1 = -mathutil_sin(cameraInfo[ball->playerId].rotY) * vel.x
               + -mathutil_cos(cameraInfo[ball->playerId].rotY) * vel.z;
            if (f1 < 0.0)
            {
                f1 = -f1 * -0.65 + 1.0;
                accel.x *= f1;
                accel.y *= f1;
                accel.z *= f1;
            }
        }
    }

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_x(worldInfo[ball->playerId].xrot);
    mathutil_mtxA_rotate_z(worldInfo[ball->playerId].zrot);
    mathutil_mtxA_rigid_inv_tf_vec(&accel, &accel);

    ball->vel.x += accel.x;
    ball->vel.y += accel.y;
    ball->vel.z += accel.z;

    ball->pos.x += ball->vel.x;
    ball->pos.y += ball->vel.y;
    ball->pos.z += ball->vel.z;
}

void update_ball_ape_transform(struct Ball *ball, struct PhysicsBall *physBall, int c)
{
    mathutil_mtxA_from_quat(&ball->unk98);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_left(ball->unk30);
    mathutil_mtxA_set_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_euler_yxz(&ball->rotY, &ball->rotX, &ball->rotZ);

    if (c == 0)
        func_8003C38C(ball);

    ball->unk130 = physBall->hardestColiSpeed;
    if ((ball->flags & BALL_FLAG_00) && physBall->hardestColiSpeed < -0.11f)
        ball->flags |= BALL_FLAG_02;
    if (physBall->hardestColiSpeed < -0.15f)
        ball->flags |= BALL_FLAG_05;

    if ((ball->flags & BALL_FLAG_00) && physBall->hardestColiSpeed < -0.054999999701976776)
    {
        int r4 = (modeCtrl.gameType != GAMETYPE_MINI_FIGHT && lbl_80206DEC.unk0 < 0xF0);

        if (r4)
            ball->flags |= BALL_FLAG_27;
        else if (physBall->hardestColiSpeed < -0.18699999898672104)
            ball->flags |= BALL_FLAG_28;
        else if (physBall->hardestColiSpeed < -0.14299999922513962)
            ball->flags |= BALL_FLAG_29;
        else if (physBall->hardestColiSpeed < -0.098999999463558197)
            ball->flags |= BALL_FLAG_30;
        else
            ball->flags |= BALL_FLAG_31;
    }

    if (ball->unk130 < -0.11f && !(ball->flags & BALL_FLAG_25))
    {
        int r4 = 1;

        if (modeCtrl.gameType == GAMETYPE_MINI_RACE && ball->unk144 != NULL && (ball->unk144->unk14 & (1 << 5)))
            r4 = 0;

        if (r4)
            func_800B60F4(lbl_80206BD0[ball->playerId], 1, (0.2f - ball->unk130) * 60.0f);
    }
}

void func_8003BBF4(struct PhysicsBall *physBall, Vec *b)
{
    struct Ball *ball = currentBallStructPtr;
    struct AnimGroupInfo *animGroup = &animGroups[physBall->hardestColiAnimGroupId];
    Vec sp44;
    Vec sp38;
    Vec sp2C;
    Vec sp20;
    Vec sp14;
    Vec *ptr;
    int unused;

    mathutil_mtxA_from_mtx(animGroup->transform);
    mathutil_mtxA_tf_point(&physBall->hardestColiPlane.point, &sp38);
    ptr = &sp44;
    mathutil_mtxA_tf_vec(&physBall->hardestColiPlane.normal, ptr);

    sp14.x = sp38.x - ball->pos.x;
    sp14.y = sp38.y - ball->pos.y;
    sp14.z = sp38.z - ball->pos.z;

    sp2C.x = ball->pos.x + sp14.x * sp44.x;
    sp2C.y = ball->pos.y + sp14.y * sp44.y;
    sp2C.z = ball->pos.z + sp14.z * sp44.z;

    mathutil_mtxA_rigid_inv_tf_point(&sp2C, &sp14);

    mathutil_mtxA_from_mtx(animGroup->prevTransform);
    mathutil_mtxA_tf_point(&sp14, &sp20);

    sp14.x = sp2C.x - sp20.x;
    sp14.y = sp2C.y - sp20.y;
    sp14.z = sp2C.z - sp20.z;

    b->x -= sp14.x;
    b->y -= sp14.y;
    b->z -= sp14.z;
}

void func_8003BD68(struct PhysicsBall *physBall, Vec *b, Vec *c)
{
    struct Ball *ball = currentBallStructPtr;
    float f2 = mathutil_vec_dot_prod(b, &physBall->hardestColiPlane.normal);
    Vec sp44;
    Vec sp38;
    Vec sp2C;
    Vec sp20;
    Vec sp14;
    float f4;

    sp2C.x = f2 * physBall->hardestColiPlane.normal.x;
    sp2C.y = f2 * physBall->hardestColiPlane.normal.y;
    sp2C.z = f2 * physBall->hardestColiPlane.normal.z;

    sp38.x = sp2C.x + (b->x - sp2C.x) * 0.92;
    sp38.y = sp2C.y + (b->y - sp2C.y) * 0.92;
    sp38.z = sp2C.z + (b->z - sp2C.z) * 0.92;

    sp44.x = sp38.x - b->x;
    sp44.y = sp38.y - b->y;
    sp44.z = sp38.z - b->z;

    ball->vel.x += sp44.x;
    ball->vel.y += sp44.y;
    ball->vel.z += sp44.z;

    sp14.x = sp44.x * -50.0;
    sp14.y = sp44.y * -50.0;
    sp14.z = sp44.z * -50.0;

    mathutil_mtxA_rigid_inv_tf_vec(&sp14, &sp14);
    mathutil_vec_cross_prod(c, &sp14, &sp20);

    f4 = 0.0f;
    if (ball->currRadius > FLT_EPSILON)
        f4 = (32768.0 / 3.141592) / (ball->currRadius * ball->currRadius);

    ball->unk60 = (sp20.x * f4 - ball->unk60) * 0.15 + (float)ball->unk60;
    ball->unk62 = (sp20.y * f4 - ball->unk62) * 0.15 + (float)ball->unk62;
    ball->unk64 = (sp20.z * f4 - ball->unk64) * 0.15 + (float)ball->unk64;
}

void handle_ball_rotational_kinematics(struct Ball *ball, struct PhysicsBall *physBall, int c)
{
    int r3 = 0;
    Vec sp44;
    Vec sp38;
    Vec sp2C;
    Vec sp20;
    Vec sp14;
    float f2;
    float f1;

    if (c != 0)
    {
        if (physBall->hardestColiSpeed < 0.0)
            r3 = 1;
    }
    else
    {
        if (physBall->flags & 1)
            r3 = 1;
    }

    if (r3)
    {
        sp20.x = ball->pos.x - ball->prevPos.x;
        sp20.y = ball->pos.y - ball->prevPos.y;
        sp20.z = ball->pos.z - ball->prevPos.z;
        if (c == 0 && physBall->hardestColiAnimGroupId > 0)
            func_8003BBF4(physBall, &sp20);

        mathutil_mtxA_from_mtx(animGroups[physBall->hardestColiAnimGroupId].transform);
        mathutil_mtxA_tf_vec(&physBall->hardestColiPlane.normal, &sp14);
        sp38.x = -sp14.x * ball->currRadius;
        sp38.y = -sp14.y * ball->currRadius;
        sp38.z = -sp14.z * ball->currRadius;

        mathutil_mtxA_from_rotate_y(ball->rotY);
        mathutil_mtxA_rotate_x(ball->rotX);
        mathutil_mtxA_rotate_z(ball->rotZ);
        mathutil_mtxA_rigid_inv_tf_vec(&sp38, &sp38);

        sp44.x = -sp20.x;
        sp44.y = -sp20.y;
        sp44.z = -sp20.z;
        mathutil_mtxA_rigid_inv_tf_vec(&sp44, &sp44);
        mathutil_vec_cross_prod(&sp38, &sp44, &sp2C);

        f2 = 0.0f;
        if (ball->currRadius > FLT_EPSILON)
            f2 = (32768.0 / 3.141592) / (ball->currRadius * ball->currRadius);
        ball->unk60 = sp2C.x * f2;
        ball->unk62 = sp2C.y * f2;
        ball->unk64 = sp2C.z * f2;

        if (ball->flags & BALL_FLAG_10)
            func_8003BD68(physBall, &sp20, &sp38);

        if (ball->currRadius > FLT_EPSILON)
        {
            f1 = mathutil_vec_len(&sp2C);
            if (f1 != 0.0f)
            {
                f1 = mathutil_vec_normalize_len(&sp2C);
                mathutil_quat_from_axis_angle(
                    &ball->unk98,
                    &sp2C,
                    (f1 * 2.0f) / (ball->currRadius * ball->currRadius * PI) * 10430.3779296875);
            }
        }
    }
    else if (ball->flags & BALL_FLAG_10)
    {
        ball->vel.x *= 0.95;
        ball->vel.y *= 0.95;
        ball->vel.z *= 0.95;

        if (ball->unk98.w > 0.99971997737884521f)
        {
            ball->unk98.w = 1.0f;
            ball->unk98.x = ball->unk98.y = ball->unk98.z = 0.0f;
        }
        else
        {
            ball->unk98.w /= 0.95f;
            ball->unk98.x *= 0.95f;
            ball->unk98.y *= 0.95f;
            ball->unk98.z *= 0.95f;
        }
    }
}

void func_8003C38C(struct Ball *ball)
{
    Vec spC;
    float f1;

    spC.x = ball->unk84.x - ball->pos.x;
    spC.z = ball->unk84.z - ball->pos.z;

    f1 = mathutil_sum_of_sq_2(spC.x, spC.z);
    if (f1 > FLT_EPSILON)
    {
        f1 = 1.0 / mathutil_sqrt(f1);
        spC.x *= f1;
        spC.z *= f1;
    }
    else
    {
        spC.x = 1.0f;
        spC.z = 0.0f;
    }

    ball->unk84.x = spC.x * 0.5 + ball->pos.x;
    ball->unk84.y = ball->pos.y - ball->currRadius;
    ball->unk84.z = spC.z * 0.5 + ball->pos.z;

    spC.x = ball->unk84.x - ball->pos.x;
    spC.z = ball->unk84.z - ball->pos.z;
    ball->unk90 = mathutil_atan2(spC.x, spC.z);
}

void func_8003C4A0(struct Ball *ball, int b)
{
    struct BallPhysicsParams *physParams = &ballPhysicsParams[b];

    ball->oldModelId = physParams->oldModelId;
    ball->currRadius = physParams->ballRadius;
    ball->targetRadius = physParams->ballRadius;
    ball->modelScale = 1.0f;
    ball->accel = physParams->unk8 * worldInfo[ball->playerId].unk1C;
    ball->restitution = physParams->restitution;
    ball->unk1 = b;

    if (modeCtrl.playerCount > 1)
        ball->colorId = ball->playerId;
    else
        ball->colorId = 3;

    if (advDemoInfo.flags & (1 << 8))
        ball->colorId = 3;
}

void func_8003C550(struct Ball *ball)
{
    struct Effect sp30;
    Vec sp24;
    Vec sp18;
    Vec spC;
    int r31;
    int r30;
    float f25;
    float f0;

    sp24.x = -ball->unk114.x;
    sp24.y = -ball->unk114.y;
    sp24.z = -ball->unk114.z;

    sp18.x = ball->vel.x * 0.5f;
    sp18.y = ball->vel.y * 0.5f;
    sp18.z = ball->vel.z * 0.5f;

    spC.x = ball->pos.x + ball->unk114.x * ball->currRadius;
    spC.y = ball->pos.y + ball->unk114.y * ball->currRadius;
    spC.z = ball->pos.z + ball->unk114.z * ball->currRadius;

    f0 = -mathutil_vec_dot_prod(&sp24, &sp18);
    sp18.x += f0 * sp24.x;
    sp18.y += f0 * sp24.y;
    sp18.z += f0 * sp24.z;

    r30 = __fabs(ball->unk130 / 0.0165f);
    if (r30 > 32)
        r30 = 32;

    f25 = __fabs(ball->unk130 / 0.32999999821186066) + 1.0;

    memset(&sp30, 0, sizeof(sp30));

    sp30.unk14 = ball->playerId;
    sp30.unk8 = 0x1B;
    sp30.unk34 = spC;
    sp30.unk88 = sp24;
    sp30.unkA8 = ball->unk130;
    spawn_effect(&sp30);

    memset(&sp30, 0, sizeof(sp30));

    sp30.unk14 = ball->playerId;
    sp30.unk8 = 0x13;
    sp30.unk34 = spC;

    for (r31 = r30 >> 1; r31 > 0; r31--)
    {
        sp30.unk40.x = sp18.x + f25 * (RAND_FLOAT() * 0.05 - 0.025);
        sp30.unk40.y = sp18.y + f25 * (RAND_FLOAT() * 0.05 - 0.025);
        sp30.unk40.z = sp18.z + f25 * (RAND_FLOAT() * 0.05 - 0.025);

        f0 = f25 * (RAND_FLOAT() * 0.055f + 0.015f);
        sp30.unk40.x += f0 * sp24.x;
        sp30.unk40.y += f0 * sp24.y;
        sp30.unk40.z += f0 * sp24.z;

        spawn_effect(&sp30);
    }
    r30 -= r30 >> 1;

    memset(&sp30, 0, sizeof(sp30));

    sp30.unk14 = ball->playerId;
    sp18.x *= 0.5f;
    sp18.y *= 0.5f;
    sp18.z *= 0.5f;
    sp30.unk8 = 2;
    sp30.unk34 = spC;

    for (r31 = r30; r31 > 0; r31--)
    {
        sp30.unk40.x = sp18.x + f25 * (RAND_FLOAT() * 0.05 - 0.025);
        sp30.unk40.y = sp18.y + f25 * (RAND_FLOAT() * 0.05 - 0.025);
        sp30.unk40.z = sp18.z + f25 * (RAND_FLOAT() * 0.05 - 0.025);

        f0 = f25 * (RAND_FLOAT() * 0.05f + 0.06f);
        sp30.unk40.x += f0 * sp24.x;
        sp30.unk40.y += f0 * sp24.y;
        sp30.unk40.z += f0 * sp24.z;

        spawn_effect(&sp30);
    }
}

void init_physball_from_ball(struct Ball *ball, struct PhysicsBall *physBall)
{
    physBall->flags = 0;

    physBall->pos.x = ball->pos.x;
    physBall->pos.y = ball->pos.y;
    physBall->pos.z = ball->pos.z;

    physBall->prevPos.x = ball->prevPos.x;
    physBall->prevPos.y = ball->prevPos.y;
    physBall->prevPos.z = ball->prevPos.z;

    physBall->vel.x = ball->vel.x;
    physBall->vel.y = ball->vel.y;
    physBall->vel.z = ball->vel.z;

    physBall->radius = ball->currRadius;
    physBall->gravityAccel = ball->accel;
    physBall->restitution = ball->restitution;
    physBall->hardestColiSpeed = 0.0f;
    physBall->animGroupId = 0;
    physBall->hardestColiAnimGroupId = 0;

    if (modeCtrl.gameType != GAMETYPE_MINI_TARGET)
        physBall->friction = 0.01f;
    else
        physBall->friction = 0.005f;
}

void func_8003CB3C(struct Ball *ball, struct PhysicsBall *physBall)
{
    if (physBall->flags & 1)
        ball->flags |= BALL_FLAG_00;

    ball->pos.x = physBall->pos.x;
    ball->pos.y = physBall->pos.y;
    ball->pos.z = physBall->pos.z;

    ball->vel.x = physBall->vel.x;
    ball->vel.y = physBall->vel.y;
    ball->vel.z = physBall->vel.z;
}

void func_8003CB88(struct Ball *ball)
{
    Vec spC;
    int r31;
    int r30;
    float f1;
    float f3;
    s16 var;

    mathutil_mtxA_from_quat(&ball->ape->unk60);
    spC.x = -1.0f;
    spC.y = 0.0f;
    spC.z = 0.0f;
    mathutil_mtxA_tf_vec(&spC, &spC);

    r31 = mathutil_atan2(spC.x, spC.z) - 32768;
    r30 = mathutil_atan2(ball->vel.x, ball->vel.z) - 32768;

    f1 = mathutil_sqrt(mathutil_sum_of_sq_2(ball->vel.x, ball->vel.z));
    if (f1 < 0.23148148148148145)
        f3 = 0.0f;
    else if (f1 < 0.37037037037037035)
        f3 = (f1 - 0.23148148148148145) / 0.1388888888888889;
    else
        f3 = 1.0f;

    var = r30 - r31;

    ball->unk92 = r31 + var * f3;
}

void func_8003CCB0(void)
{
    struct Ball *ball = currentBallStructPtr;
    int bvar;

    if (modeCtrl.gameType == GAMETYPE_MINI_RACE
     && ball->unk144 != NULL
     && (ball->unk144->unk14 & (1 << 5)))
        return;
    if (!(ball->flags & BALL_FLAG_06))
        return;

    if (modeCtrl.gameType != GAMETYPE_MAIN_COMPETITION)
        bvar = ((ball->flags & BALL_FLAG_09) || (ball->unk80 & 1));
    else if (ball->flags & BALL_FLAG_09)
        bvar = ball->unk80 & 1;
    else
        bvar = (ball->unk80 & 3) == 1;

    if (bvar)
    {
        struct Effect sp8;

        memset(&sp8, 0, sizeof(sp8));
        sp8.unk8 = 10;
        sp8.unk14 = ball->playerId;
        sp8.unk34 = ball->pos;
        spawn_effect(&sp8);
    }
}

void func_8003CDB0(struct Ball *ball)
{
    ball->flags &= ~(BALL_FLAG_27|BALL_FLAG_28|BALL_FLAG_29|BALL_FLAG_30|BALL_FLAG_31);
}

static const s16 lbl_801179D4[] = { 0x3A, 0x3B, 0x3F, 0x53, 0x54, 0x55, 0x56, 0x57 };

static inline void func_8003CDC0_sub(struct Ball *ball)
{
    if (ball->ape->unk24 == 2)
        lbl_80206BE0[ball->playerId]++;
    else
        lbl_80206BE0[ball->playerId] = 0;

    if ((lbl_80206BE0[ball->playerId] % 30) == 1)
        u_play_sound_0(lbl_801179D4[(rand() >> 12) & 7]);
}

void func_8003CDC0(struct Ball *ball)
{
    if (advDemoInfo.flags & (1 << 8))
        return;

    switch (modeCtrl.gameType)
    {
    case GAMETYPE_MINI_FIGHT:
        if (!(ball->flags & BALL_FLAG_21) && ball->unk80 > 0x78)
            func_8003CDC0_sub(ball);
        break;
    case GAMETYPE_MINI_BOWLING:
        func_8003CDC0_sub(ball);
        break;
    case GAMETYPE_MINI_GOLF:
        break;
    default:
        if (lbl_80206DEC.unk0 > 0xF0
         && gameSubmode != SMD_GAME_CONTINUE_INIT
         && gameSubmode != SMD_GAME_CONTINUE_MAIN
         && gameSubmode != SMD_GAME_OVER_INIT
         && gameSubmode != SMD_GAME_OVER_MAIN
         && gameSubmode != SMD_GAME_OVER_SAVE
         && gameSubmode != SMD_GAME_OVER_DEST)
        {
            if ((!(infoWork.flags & INFO_FLAG_05) && !(infoWork.flags & INFO_FLAG_TIMER_PAUSED))
             || (infoWork.flags & INFO_FLAG_REPLAY))
            {
                if (!(ball->flags & BALL_FLAG_08) && !(ball->flags & BALL_FLAG_09))
                    func_8003CDC0_sub(ball);
            }
        }
        break;
    }

    if (ball->state != 6
     && lbl_80206DEC.unk0 > 0xF0
     && ball->ape->unk24 == 4
     && ball->ape->unk0->unk38 == 2)
    {
        float f1 = (lbl_80205E20[ball->playerId] * 216000.0) / 1000.0;
        if (f1 >= 35.0f)
            u_play_sound_0(0x1A);
        else if (f1 >= 20.0f)
            u_play_sound_0(0x18);
        else
            u_play_sound_0(0x17);
    }
    if (ball->flags & BALL_FLAG_27)
        u_play_sound_0(0x69);
    else if (ball->flags & BALL_FLAG_28)
        u_play_sound_0(0x2F);
    else if (ball->flags & BALL_FLAG_29)
        u_play_sound_0(0x14);
    else if (ball->flags & BALL_FLAG_30)
        u_play_sound_0(0x13);
    else if (ball->flags & BALL_FLAG_31)
        u_play_sound_0(0x12);

    if (gameSubmode == SMD_GAME_ROLL_MAIN)
        return;

    if (modeCtrl.gameType == GAMETYPE_MINI_RACE)
    {
        struct Ball_child *unk = ball->unk144;
        s8 r31 = 0;
        s8 r28 = 0;
        float f2 = mathutil_vec_len(&ball->vel) * 216000.0 / 1000.0;

        if (unk->unk1CE > 3 && f2 > 10.0)
        {
            float f4 = (f2 - 10.0f) / 130.0f;

            r31 = MIN(f4 * 127.0f, 127.0f);
            r28 = MIN(f4 * 127.0f * 10.0f, 80.0f) * 0.85f;
        }
        if ((unpausedFrameCounter & 7) == 0 || r31 == 0)
            func_8002CA5C(ball->playerId, r31, r28);
    }
    else if (modeCtrl.gameType != GAMETYPE_MINI_BOWLING)
    {
        s8 r4;
        s8 r5;
        float f4 = mathutil_vec_len(&ball->vel) * 216000.0 / 1000.0;

        if ((ball->flags & BALL_FLAG_00) && f4 > 10.0)
        {
            r4 = MIN((f4 - 10.0) * 1.5, 127.0);
            r5 = MIN((f4 - 10.0) * 15.0, 80.0) * 0.85000002384185791;
        }
        else
        {
            r4 = 0;
            r5 = 0;
        }
        if ((unpausedFrameCounter & 7) == 0 || r4 == 0)
            func_8002CA5C(ball->playerId, r4, r5);
    }
}

void func_8003D3C4(struct Ball *ball)
{
    float f26;

    if (!(ball->flags & BALL_FLAG_00))
        return;
    if (modeCtrl.gameType == GAMETYPE_MINI_RACE && ball->unk144 != NULL && ball->unk144->unk14 & (1 << 5))
        return;

    f26 = mathutil_vec_len(&ball->vel);
    f26 *= 5.0;
    if (f26 > 1.5f)
    {
        Vec spC4;
        struct Effect sp18;
        Vec spC;
        float f2;
        int r29;

        spC.x = -ball->unk114.x;
        spC.y = -ball->unk114.y;
        spC.z = -ball->unk114.z;

        memset(&sp18, 0, sizeof(sp18));

        sp18.unk8 = 2;
        sp18.unk14 = ball->playerId;

        sp18.unk34.x = ball->pos.x + ball->unk114.x * ball->currRadius;
        sp18.unk34.y = ball->pos.y + ball->unk114.y * ball->currRadius;
        sp18.unk34.z = ball->pos.z + ball->unk114.z * ball->currRadius;

        if (!(infoWork.flags & INFO_FLAG_REPLAY) || (infoWork.flags & INFO_FLAG_11))
            f2 = 0.85f;
        else
            f2 = 0.1f;

        spC4.x = ball->vel.x * f2;
        spC4.y = ball->vel.y * f2;
        spC4.z = ball->vel.z * f2;

        for (r29 = f26; r29 > 0; r29--)
        {
            float f25 = RAND_FLOAT() * f26 * 0.1;

            sp18.unk40.x = (spC.x + (RAND_FLOAT() * 1.5 - 0.75)) * f25 + spC4.x;
            sp18.unk40.y = (spC.y + (RAND_FLOAT() * 1.5 - 0.75)) * f25 + spC4.y;
            sp18.unk40.z = (spC.z + (RAND_FLOAT() * 1.5 - 0.75)) * f25 + spC4.z;

            spawn_effect(&sp18);
        }
    }
}

void animate_ball_size_change(struct Ball *ball)
{
    if (!(ball->flags & (BALL_FLAG_17|BALL_FLAG_18)))
    {
        if (ball->currRadius != ball->targetRadius)
        {
            ball->currRadius += (ball->targetRadius - ball->currRadius) * 0.2f;
            ball->modelScale = ball->currRadius / ball->targetRadius;
        }
    }
    else
    {
        ball->unk13C--;
        if (ball->unk13C < 0)
            ball->flags &= ~(BALL_FLAG_17|BALL_FLAG_18);
        else if (ball->flags & BALL_FLAG_17)
            ball->currRadius += ((ball->targetRadius * 0.5f) - ball->currRadius) * 0.3f;
        else
            ball->currRadius += ((ball->targetRadius * 2.0f) - ball->currRadius) * 0.3f;
        ball->modelScale = ball->currRadius / ball->targetRadius;
    }

    if (ball->ape != NULL)
        ball->ape->modelScale = ball->modelScale;
}

void draw_ball_hemispheres(struct Ball *ball, int unused)
{
    struct GMAModelEntry *entries = commonGma->modelEntries;
    s16 *coloredParts = coloredBallPartModelIDs[ball->colorId];
    Point3d pos;
    u8 unused2[8];
    float f31;  // distance from camera, maybe?
    int lod;  // level of detail?

    mathutil_mtxA_push();
    mathutil_mtxA_from_mtx(currentCameraStructPtr->unk144);
    mathutil_mtxA_tf_point(&ball->pos, &pos);
    f31 = -0.25f / (currentCameraStructPtr->sub28.unk38 * pos.z);
    mathutil_mtxA_pop();

    func_8000E1A4(ball->unk15C[currentCameraStructPtr->unk204] * 0.5 + 0.5);
    avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_DISABLE);

    lod = 0;
    if (modeCtrl.unk30 > 1 && f31 < 0.173f)
    {
        lod = 1;
        if (f31 < 0.102f)
            lod = 2;
    }

    // Draw inside of clear hemisphere
    avdisp_set_bound_sphere_scale(ball->modelScale);
    avdisp_draw_model_unculled_sort_none(entries[clearHemisphereInsideParts[lod]].model);

    // Draw inside of colored hemisphere
    avdisp_set_bound_sphere_scale(ball->modelScale);
    avdisp_draw_model_unculled_sort_none(entries[coloredParts[0 + lod]].model);

    // Draw edge ring between ball halves
    avdisp_set_bound_sphere_scale(ball->modelScale);
    avdisp_draw_model_unculled_sort_none(entries[coloredParts[6 + lod]].model);

    avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);

    // Draw outside of clear hemisphere
    avdisp_draw_model_unculled_sort_none(entries[clearHemisphereOutsideParts[lod]].model);

    // Draw outside of colored hemisphere
    avdisp_set_bound_sphere_scale(ball->modelScale);
    avdisp_draw_model_unculled_sort_none(entries[coloredParts[3 + lod]].model);

    u_reset_post_mult_color();
    avdisp_set_z_mode(GX_ENABLE, GX_LEQUAL, GX_ENABLE);
}

void ball_draw_callback(struct BallDrawNode *node)
{
    struct Ball *ball = &ballInfo[node->ballId];
    int (*r30)() = backgroundInfo.unk7C;
    BallEnvFunc envFunc;

    if (gameMode == MD_GAME && modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION && modeCtrl.playerCount > 3)
        r30 = NULL;

    load_light_group_cached(node->unk8);
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_mult_right(ball->unk30);
    mathutil_mtxA_scale_s(ball->modelScale);
    u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);

    draw_ball_hemispheres(ball, node->ballId);

    if (r30 != NULL)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_from_mtx(ball->unk30);
        if (r30(NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_BSKBALL_FACE), lbl_802F1B4C) != 0)
        {
            mathutil_mtxA_pop();
            mathutil_mtxA_push();
            mathutil_mtxA_scale_s(1.01f);
            nl2ngc_draw_model_sort_none_alt(lbl_802F1B4C);
            mathutil_mtxA_pop();
        }
        else
            mathutil_mtxA_pop();
    }

    envFunc = backgroundInfo.ballEnvFunc;
    if (envFunc != NULL)
    {
        u_avdisp_set_some_func_1(envFunc);
        u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
        avdisp_draw_model_culled_sort_none(commonGma->modelEntries[ENV_ABSORBER].model);
        u_avdisp_set_some_func_1(NULL);
    }
}
