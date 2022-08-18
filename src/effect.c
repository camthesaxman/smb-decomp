#include <dolphin.h>
#include <stdlib.h>
#include <string.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "effect.h"
#include "gma.h"
#include "gxutil.h"
#include "hud.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "obj_collision.h"
#include "pool.h"
#include "stage.h"
#include "stcoli.h"
#include "world.h"

#include "../data/common.gma.h"
#include "../data/common.nlobj.h"

void effect_dummy_init(struct Effect *);
void effect_dummy_main(struct Effect *);
void effect_dummy_draw(struct Effect *);
void effect_dummy_destroy(struct Effect *);
void effect_paperfrag_init(struct Effect *);
void effect_paperfrag_main(struct Effect *);
void effect_paperfrag_draw(struct Effect *);
void effect_paperfrag_destroy(struct Effect *);
void effect_get_banana_init(struct Effect *);
void effect_get_banana_main(struct Effect *);
void effect_get_banana_draw(struct Effect *);
void effect_get_banana_destroy(struct Effect *);
void effect_coli_particle_init(struct Effect *);
void effect_coli_particle_main(struct Effect *);
void effect_coli_particle_draw(struct Effect *);
void effect_coli_particle_destroy(struct Effect *);
void effect_rotate_bg_init(struct Effect *);
void effect_rotate_bg_main(struct Effect *);
void effect_rotate_bg_draw(struct Effect *);
void effect_rotate_bg_destroy(struct Effect *);
void effect_raindrop_init(struct Effect *);
void effect_raindrop_main(struct Effect *);
void effect_raindrop_draw(struct Effect *);
void effect_raindrop_destroy(struct Effect *);
void effect_holding_banana_init(struct Effect *);
void effect_holding_banana_main(struct Effect *);
void effect_holding_banana_draw(struct Effect *);
void effect_holding_banana_destroy(struct Effect *);
void effect_bubble_init(struct Effect *);
void effect_bubble_main(struct Effect *);
void effect_bubble_draw(struct Effect *);
void effect_bubble_destroy(struct Effect *);
void effect_levitate_init(struct Effect *);
void effect_levitate_main(struct Effect *);
void effect_levitate_draw(struct Effect *);
void effect_levitate_destroy(struct Effect *);
void effect_twinkle_star_init(struct Effect *);
void effect_twinkle_star_main(struct Effect *);
void effect_twinkle_star_draw(struct Effect *);
void effect_twinkle_star_destroy(struct Effect *);
void effect_bonus_stg_star_init(struct Effect *);
void effect_bonus_stg_star_main(struct Effect *);
void effect_bonus_stg_star_draw(struct Effect *);
void effect_bonus_stg_star_destroy(struct Effect *);
void effect_bonus_stg_star_tail_init(struct Effect *);
void effect_bonus_stg_star_tail_main(struct Effect *);
void effect_bonus_stg_star_tail_draw(struct Effect *);
void effect_bonus_stg_star_tail_destroy(struct Effect *);
void effect_water_light_init(struct Effect *);
void effect_water_light_main(struct Effect *);
void effect_water_light_draw(struct Effect *);
void effect_water_light_destroy(struct Effect *);
void effect_raindrop_ripple_init(struct Effect *);
void effect_raindrop_ripple_main(struct Effect *);
void effect_raindrop_ripple_draw(struct Effect *);
void effect_raindrop_ripple_destroy(struct Effect *);
void effect_ball_glow_init(struct Effect *);
void effect_ball_glow_main(struct Effect *);
void effect_ball_glow_draw(struct Effect *);
void effect_ball_glow_destroy(struct Effect *);
void effect_exm_guide_light_init(struct Effect *);
void effect_exm_guide_light_main(struct Effect *);
void effect_exm_guide_light_draw(struct Effect *);
void effect_exm_guide_light_destroy(struct Effect *);
void effect_exm_guide_light_tail_init(struct Effect *);
void effect_exm_guide_light_tail_main(struct Effect *);
void effect_exm_guide_light_tail_draw(struct Effect *);
void effect_exm_guide_light_tail_destroy(struct Effect *);
void effect_colistar_particle_init(struct Effect *);
void effect_colistar_particle_main(struct Effect *);
void effect_colistar_particle_draw(struct Effect *);
void effect_colistar_particle_destroy(struct Effect *);
void effect_bgwat_bubble_base_init(struct Effect *);
void effect_bgwat_bubble_base_main(struct Effect *);
void effect_bgwat_bubble_base_draw(struct Effect *);
void effect_bgwat_bubble_base_destroy(struct Effect *);
void effect_bgwat_bubble_init(struct Effect *);
void effect_bgwat_bubble_main(struct Effect *);
void effect_bgwat_bubble_draw(struct Effect *);
void effect_bgwat_bubble_destroy(struct Effect *);
void effect_meteo_init(struct Effect *);
void effect_meteo_main(struct Effect *);
void effect_meteo_draw(struct Effect *);
void effect_meteo_destroy(struct Effect *);
void effect_meteo_fix_init(struct Effect *);
void effect_meteo_fix_main(struct Effect *);
void effect_meteo_fix_draw(struct Effect *);
void effect_meteo_fix_destroy(struct Effect *);
void effect_coliflash_init(struct Effect *);
void effect_coliflash_main(struct Effect *);
void effect_coliflash_draw(struct Effect *);
void effect_coliflash_destroy(struct Effect *);
void effect_bns_stg_star_init(struct Effect *);
void effect_bns_stg_star_main(struct Effect *);
void effect_bns_stg_star_draw(struct Effect *);
void effect_bns_stg_star_destroy(struct Effect *);
void effect_bns_stg_star_tail_init(struct Effect *);
void effect_bns_stg_star_tail_main(struct Effect *);
void effect_bns_stg_star_tail_draw(struct Effect *);
void effect_bns_stg_star_tail_destroy(struct Effect *);
void effect_bgmst_gen_cloud_init(struct Effect *);
void effect_bgmst_gen_cloud_main(struct Effect *);
void effect_bgmst_gen_cloud_draw(struct Effect *);
void effect_bgmst_gen_cloud_destroy(struct Effect *);
void effect_bgstm_rainripple_init(struct Effect *);
void effect_bgstm_rainripple_main(struct Effect *);
void effect_bgstm_rainripple_draw(struct Effect *);
void effect_bgstm_rainripple_destroy(struct Effect *);
void effect_bgmst_water_init(struct Effect *);
void effect_bgmst_water_main(struct Effect *);
void effect_bgmst_water_draw(struct Effect *);
void effect_bgmst_water_destroy(struct Effect *);
void effect_commendfrag_init(struct Effect *);
void effect_commendfrag_main(struct Effect *);
void effect_commendfrag_draw(struct Effect *);
void effect_commendfrag_destroy(struct Effect *);
void effect_banana_drop_init(struct Effect *);
void effect_banana_drop_main(struct Effect *);
void effect_banana_drop_draw(struct Effect *);
void effect_banana_drop_destroy(struct Effect *);
void effect_bgend_water_init(struct Effect *);
void effect_bgend_water_main(struct Effect *);
void effect_bgend_water_draw(struct Effect *);
void effect_bgend_water_destroy(struct Effect *);
void effect_bird_kite_init(struct Effect *);
void effect_bird_kite_main(struct Effect *);
void effect_bird_kite_draw(struct Effect *);
void effect_bird_kite_destroy(struct Effect *);
void effect_icewater_reflect_init(struct Effect *);
void effect_icewater_reflect_main(struct Effect *);
void effect_icewater_reflect_draw(struct Effect *);
void effect_icewater_reflect_destroy(struct Effect *);
void effect_icewater_particle_init(struct Effect *);
void effect_icewater_particle_main(struct Effect *);
void effect_icewater_particle_draw(struct Effect *);
void effect_icewater_particle_destroy(struct Effect *);
void effect_nameent_code_init(struct Effect *);
void effect_nameent_code_main(struct Effect *);
void effect_nameent_code_draw(struct Effect *);
void effect_nameent_code_destroy(struct Effect *);
void effect_get_nameent_code_init(struct Effect *);
void effect_get_nameent_code_main(struct Effect *);
void effect_get_nameent_code_draw(struct Effect *);
void effect_get_nameent_code_destroy(struct Effect *);
void effect_ending_ballfrag_init(struct Effect *);
void effect_ending_ballfrag_main(struct Effect *);
void effect_ending_ballfrag_draw(struct Effect *);
void effect_ending_ballfrag_destroy(struct Effect *);

struct Effect lbl_802673C8[MAX_EFFECTS];

void u_give_points(int arg0, int arg1)
{
    int clearScore;
    int var_r8;
    u32 flags;
    int i;
    int floorScore;
    int i2;
    struct StageGoal *goal;
    struct Ball *ball;
    s8 *poolStatus;

    switch (arg0)
    {
    case 2:
    case 3:
        var_r8 = infoWork.unk22;
        floorScore = infoWork.unk1C * 100 / 60;
        goal = decodedStageLzPtr->animGroups[0].goals;
        flags = 0;
        for (i = 0; i < 3; i++, goal++)
        {
            if (i == infoWork.goalEntered)
                break;
        }

        if (goal->type == 'G')
        {
            flags |= 4;
            floorScore += 10000;
        }
        else if (goal->type == 'R')
        {
            flags |= 8;
            floorScore += 20000;
        }
        clearScore = floorScore;
        if (infoWork.unk22 != 1)
            flags |= 2;
        // time bonus
        if (infoWork.timerCurr > (infoWork.timerMax >> 1))
        {
            flags |= 1;
            var_r8 *= 2;
        }
        floorScore *= var_r8;
        if (arg0 == 3)
        {
            hud_show_goal_score_info(clearScore, floorScore, flags);
            return;
        }
        switch (modeCtrl.gameType)
        {
        case 1:
            ball = ballInfo;
            poolStatus = g_poolInfo.playerPool.statusList;
            for (i2 = 0; i2 < g_poolInfo.playerPool.count; i2++, ball++, poolStatus++)
            {
                if (*poolStatus != 0)
                {
                    switch (ball->rank)
                    {
                    case 1:
                        ball->unk7C += floorScore;
                        break;
                    case 2:
                        ball->unk7C += floorScore / 2;
                        break;
                    case 3:
                        ball->unk7C += floorScore / 3;
                        break;
                    }
                    if (ball->unk7C > 0x3B9AC9FF)
                        ball->unk7C = 0x3B9AC9FF;
                }
            }
            break;
        case 0:
            ball = &ballInfo[modeCtrl.currPlayer];
            ball->unk7C += floorScore;
            if (ball->unk7C > 0x3B9AC9FF)
                ball->unk7C = 0x3B9AC9FF;
            break;
        case 2:
            ball = currentBallStructPtr;
            ball->unk7C += floorScore;
            if (ball->unk7C > 0x3B9AC9FF)
                ball->unk7C = 0x3B9AC9FF;
            if (ball->unk7C > lbl_802F1CAC)
            {
                if (lbl_802F1CAC > 0)
                    lbl_802F1CA8 = 1;
                lbl_802F1CAC = ball->unk7C;
            }
            break;
        default:
            ball = currentBallStructPtr;
            ball->unk7C += floorScore;
            if (ball->unk7C > 0x3B9AC9FF)
                ball->unk7C = 0x3B9AC9FF;
            break;
        }
        break;
    default:
        ball = currentBallStructPtr;
        ball->unk7C += arg1;
        if (ball->unk7C > 0x3B9AC9FF)
            ball->unk7C = 0x3B9AC9FF;
        break;
    }
}

s16 lbl_802F1F90;

void ev_effect_init(void)
{
    int i;
    struct Effect *effect;

    lbl_802F1F90 = 0;
    memset(&lbl_802673C8, 0, sizeof(lbl_802673C8));
    effect = lbl_802673C8;
    for (i = 0; i < MAX_EFFECTS; i++, effect++)
    {
        effect->unk0 = i;
        effect->unk2 = -1;
    }
    pool_reset(&g_poolInfo.effectPool);
}

#pragma force_active on
char *lbl_801B8D74[] =
{
    "ET_PAPERFRAG",
    "ET_GET_BANANA",
    "ET_COLI_PARTICLE",
    "ET_BIRD_KITE",
    "ET_ROTATE_BG",
    "ET_ICEWATER_REFLECT",
    "ET_ICEWATER_PARTICLE",
    "ET_RAINDROP",
    "ET_HOLDING_BANANA",
    "ET_BUBBLE",
    "ET_LEVITATE",
    "ET_TWINKLE_STAR",
    "ET_BONUS_STG_STAR",
    "ET_BONUS_STG_STAR_TAIL",
    "ET_WATER_LIGHT",
    "ET_RAINDROP_RIPPLE",
    "ET_BALL_GLOW",
    "ET_EXM_GUIDE_LIGHT",
    "ET_EXM_GUIDE_LIGHT_TAIL",
    "ET_COLISTAR_PARTICLE",
    "ET_BGWAT_BUBBLE_BASE",
    "ET_BGWAT_BUBBLE",
    "ET_METEO",
    "ET_METEO_FIX",
    "ET_FIGHT_REVIVAL",
    "ET_FIGHT_PANNEL",
    "ET_FIGHT_GET_BANANA",
    "ET_COLIFLASH",
    "ET_FIGHT_BOX_FRAG",
    "ET_FIGHT_HOLDING_PITEM",
    "ET_FIGHT_BALL_EFC",
    "ET_FIGHT_REVIVAL_PTC",
    "ET_BNS_STG_STAR",
    "ET_BNS_STG_STAR_TAIL",
    "ET_BGMST_GEN_CLOUD",
    "ET_BGSTM_RAINRIPPLE",
    "ET_NAMEENT_CODE",
    "ET_GET_NAMEENT_CODE",
    "ET_MR_BOMB",
    "ET_PILOT_BOMB",
    "ET_BGMST_WATER",
    "ET_MR_BOMB_LIGHT",
    "ET_FIGHT_COLIFLASH",
    "ET_FIGHT_COLIFLASH_PTC",
    "ET_MR_SPEED_STAR_LIGHT",
    "ET_COMMENDFRAG",
    "ET_ENDING_BALLFRAG",
    "ET_BANANA_DROP",
    "ET_BGEND_WATER",
};

#pragma force_active reset

void (*s_effectInitFuncs[])(struct Effect *) =
{
    effect_paperfrag_init,
    effect_get_banana_init,
    effect_coli_particle_init,
    effect_bird_kite_init,
    effect_rotate_bg_init,
    effect_icewater_reflect_init,
    effect_icewater_particle_init,
    effect_raindrop_init,
    effect_holding_banana_init,
    effect_bubble_init,
    effect_levitate_init,
    effect_twinkle_star_init,
    effect_bonus_stg_star_init,
    effect_bonus_stg_star_tail_init,
    effect_water_light_init,
    effect_raindrop_ripple_init,
    effect_ball_glow_init,
    effect_exm_guide_light_init,
    effect_exm_guide_light_tail_init,
    effect_colistar_particle_init,
    effect_bgwat_bubble_base_init,
    effect_bgwat_bubble_init,
    effect_meteo_init,
    effect_meteo_fix_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_coliflash_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_bns_stg_star_init,
    effect_bns_stg_star_tail_init,
    effect_bgmst_gen_cloud_init,
    effect_bgstm_rainripple_init,
    effect_nameent_code_init,
    effect_get_nameent_code_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_bgmst_water_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_dummy_init,
    effect_commendfrag_init,
    effect_ending_ballfrag_init,
    effect_banana_drop_init,
    effect_bgend_water_init,
    NULL,
};

static void (*s_effectMainFuncs[])(struct Effect *) =
{
    effect_paperfrag_main,
    effect_get_banana_main,
    effect_coli_particle_main,
    effect_bird_kite_main,
    effect_rotate_bg_main,
    effect_icewater_reflect_main,
    effect_icewater_particle_main,
    effect_raindrop_main,
    effect_holding_banana_main,
    effect_bubble_main,
    effect_levitate_main,
    effect_twinkle_star_main,
    effect_bonus_stg_star_main,
    effect_bonus_stg_star_tail_main,
    effect_water_light_main,
    effect_raindrop_ripple_main,
    effect_ball_glow_main,
    effect_exm_guide_light_main,
    effect_exm_guide_light_tail_main,
    effect_colistar_particle_main,
    effect_bgwat_bubble_base_main,
    effect_bgwat_bubble_main,
    effect_meteo_main,
    effect_meteo_fix_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_coliflash_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_bns_stg_star_main,
    effect_bns_stg_star_tail_main,
    effect_bgmst_gen_cloud_main,
    effect_bgstm_rainripple_main,
    effect_nameent_code_main,
    effect_get_nameent_code_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_bgmst_water_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_dummy_main,
    effect_commendfrag_main,
    effect_ending_ballfrag_main,
    effect_banana_drop_main,
    effect_bgend_water_main,
    NULL,
};

static void (*s_effectDrawFuncs[])(struct Effect *) =
{
    effect_paperfrag_draw,
    effect_get_banana_draw,
    effect_coli_particle_draw,
    effect_bird_kite_draw,
    effect_rotate_bg_draw,
    effect_icewater_reflect_draw,
    effect_icewater_particle_draw,
    effect_raindrop_draw,
    effect_holding_banana_draw,
    effect_bubble_draw,
    effect_levitate_draw,
    effect_twinkle_star_draw,
    effect_bonus_stg_star_draw,
    effect_bonus_stg_star_tail_draw,
    effect_water_light_draw,
    effect_raindrop_ripple_draw,
    effect_ball_glow_draw,
    effect_exm_guide_light_draw,
    effect_exm_guide_light_tail_draw,
    effect_colistar_particle_draw,
    effect_bgwat_bubble_base_draw,
    effect_bgwat_bubble_draw,
    effect_meteo_draw,
    effect_meteo_fix_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_coliflash_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_bns_stg_star_draw,
    effect_bns_stg_star_tail_draw,
    effect_bgmst_gen_cloud_draw,
    effect_bgstm_rainripple_draw,
    effect_nameent_code_draw,
    effect_get_nameent_code_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_bgmst_water_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_dummy_draw,
    effect_commendfrag_draw,
    effect_ending_ballfrag_draw,
    effect_banana_drop_draw,
    effect_bgend_water_draw,
    NULL,
};

static void (*s_effectDestroyFuncs[])(struct Effect *) =
{
    effect_paperfrag_destroy,
    effect_get_banana_destroy,
    effect_coli_particle_destroy,
    effect_bird_kite_destroy,
    effect_rotate_bg_destroy,
    effect_icewater_reflect_destroy,
    effect_icewater_particle_destroy,
    effect_raindrop_destroy,
    effect_holding_banana_destroy,
    effect_bubble_destroy,
    effect_levitate_destroy,
    effect_twinkle_star_destroy,
    effect_bonus_stg_star_destroy,
    effect_bonus_stg_star_tail_destroy,
    effect_water_light_destroy,
    effect_raindrop_ripple_destroy,
    effect_ball_glow_destroy,
    effect_exm_guide_light_destroy,
    effect_exm_guide_light_tail_destroy,
    effect_colistar_particle_destroy,
    effect_bgwat_bubble_base_destroy,
    effect_bgwat_bubble_destroy,
    effect_meteo_destroy,
    effect_meteo_fix_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_coliflash_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_bns_stg_star_destroy,
    effect_bns_stg_star_tail_destroy,
    effect_bgmst_gen_cloud_destroy,
    effect_bgstm_rainripple_destroy,
    effect_nameent_code_destroy,
    effect_get_nameent_code_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_bgmst_water_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_dummy_destroy,
    effect_commendfrag_destroy,
    effect_ending_ballfrag_destroy,
    effect_banana_drop_destroy,
    effect_bgend_water_destroy,
    NULL,
};

struct EffectFuncs
{
    void (*init)(struct Effect *);
    void (*main)(struct Effect *);
    void (*draw)(struct Effect *);
    void (*destroy)(struct Effect *);
};

static struct EffectFuncs s_dummyEffectFuncs =
{
    effect_dummy_init,
    effect_dummy_main,
    effect_dummy_draw,
    effect_dummy_destroy,
};

void ev_effect_main(void)
{
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    if (gamePauseStatus & 0xA)
        return;
    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
    {
        if (*poolStatus != 0)
        {
            effect->unkC--;
            if (effect->unkC == 0 || *poolStatus == 3)
            {
                s_effectDestroyFuncs[effect->type](effect);
                *poolStatus = 0;
            }
            else
            {
                effect->unk58 = effect->unk34;
                s_effectMainFuncs[effect->type](effect);
            }
        }
    }
}

void ev_effect_dest(void)
{
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
    {
        if (*poolStatus != 0)
        {
            s_effectDestroyFuncs[effect->type](effect);
            *poolStatus = 0;
        }
    }
}

void effect_draw(void)
{
    u16 cameras;
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    switch (modeCtrl.gameType)
    {
    case 4:
    case 8:
        cameras = 0xFFFF;
        break;
    default:
        cameras = 1 << u_cameraId1;
        break;
    }

    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    if (!(currentCameraStructPtr->flags & 1))
    {
        for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
        {
            if (*poolStatus != 0 && (effect->unk16 & cameras) && !(effect->unk4 & 1))
                s_effectDrawFuncs[effect->type](effect);
        }
    }
    else
    {
        for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
        {
            if (*poolStatus != 0 && (effect->unk16 & cameras) && !(effect->unk4 & 1))
            {
                if (effect->unk4 & 0x10)
                {
                    s_effectDestroyFuncs[effect->type](effect);
                    *poolStatus = 0;
                }
                else
                {
                    if (effect->unk4 & 0xE)
                        effect->unk58 = effect->unk34;
                    s_effectDrawFuncs[effect->type](effect);
                }
            }
        }
    }
}

int spawn_effect(struct Effect *effect)
{
    int index;
    struct Effect *newEffect;

    index = pool_alloc(&g_poolInfo.effectPool, 1);
    if (index < 0)
        return -1;

    newEffect = &lbl_802673C8[index];
    memcpy(newEffect, effect, sizeof(*newEffect));
    newEffect->unk0 = index;
    s_effectInitFuncs[newEffect->type](newEffect);
    if (newEffect->unk16 == 0)
        newEffect->unk16 = 0xF;
    newEffect->unk2 = lbl_802F1F90;
    lbl_802F1F90++;
    if (lbl_802F1F90 < 0)
        lbl_802F1F90 = 0;
    return newEffect->unk2;
}

void func_8004CFF0(int arg0)
{
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
    {
        if (*poolStatus != 0 && effect->type == arg0)
        {
            *poolStatus = 3;
            effect->unk4 |= 1;
        }
    }
}

struct Effect *func_8004D054(int arg0)
{
    int i;
    struct Effect *effect;
    s8 *poolStatus;

    poolStatus = g_poolInfo.effectPool.statusList;
    effect = lbl_802673C8;
    for (i = g_poolInfo.effectPool.count; i > 0; i--, poolStatus++, effect++)
    {
        if (*poolStatus != 0 && effect->unk2 == arg0)
            break;
    }
    if (i == 0)
        return NULL;
    else
        return effect;
}

#pragma force_active on
void effect_replace_type_funcs(int type, struct EffectFuncs *newFuncs)
{
    struct EffectFuncs funcs;

    if (newFuncs == NULL)
        funcs = s_dummyEffectFuncs;
    else
    {
        funcs = *newFuncs;
        if (funcs.init == NULL)
            funcs.init = s_dummyEffectFuncs.init;
        if (funcs.main == NULL)
            funcs.main = s_dummyEffectFuncs.main;
        if (funcs.draw == NULL)
            funcs.draw = s_dummyEffectFuncs.draw;
        if (funcs.destroy == NULL)
            funcs.destroy = s_dummyEffectFuncs.destroy;
    }
    s_effectInitFuncs[type]    = funcs.init;
    s_effectMainFuncs[type]    = funcs.main;
    s_effectDrawFuncs[type]    = funcs.draw;
    s_effectDestroyFuncs[type] = funcs.destroy;
}
#pragma force_active reset

void effect_dummy_init(struct Effect *effect) {}

void effect_dummy_main(struct Effect *effect) {}

void effect_dummy_draw(struct Effect *effect) {}

void effect_dummy_destroy(struct Effect *effect) {}

u16 s_paperPieceModels[] =
{
    PAPER_PIECE_DEEPGREEN,
    PAPER_PIECE_GREEN,
    PAPER_PIECE_ORANGE,
    PAPER_PIECE_RED,
    PAPER_PIECE_YELLOW,
};

void effect_paperfrag_init(struct Effect *effect)
{
    if (effect->unkC == 0)
        effect->unkC = 210.0 + (60.0f * RAND_FLOAT());
    if (effect->model == NULL)
    {
        u16 modelIndex = s_paperPieceModels[(u32)(rand() & 0x7FFF) % ARRAY_COUNT(s_paperPieceModels)];
        effect->model = commonGma->modelEntries[modelIndex].model;
    }
    effect->unkA = 0;
    if (effect->unk24.x == 0.0f)
        effect->unk24.x = 0.5 + (0.5 * RAND_FLOAT());
}

void effect_paperfrag_main(struct Effect *effect)
{
    Vec sp58;
    struct RaycastHit sp3C;
    Vec sp30;
    Vec sp24;
    Vec sp18;
    Vec spC;
    float temp_f2;
    float temp_f3;
    float temp_f4;
    float temp_f2_3;
    s16 temp_r29;
    s16 temp_r31;
    struct World *world = currentWorldStructPtr;

    effect->unk40.x += 0.004 * world->unk10.x;
    effect->unk40.y += 0.004 * world->unk10.y;
    effect->unk40.z += 0.004 * world->unk10.z;
    mathutil_mtxA_from_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    sp58.x = 0.0f;
    sp58.y = 1.0f;
    sp58.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp58, &sp58);
    temp_f2 = -0.7 * mathutil_vec_dot_prod(&sp58, &effect->unk40);
    effect->unk40.x += sp58.x * temp_f2;
    effect->unk40.y += sp58.y * temp_f2;
    effect->unk40.z += sp58.z * temp_f2;
    effect->unk40.x *= 0.95;
    effect->unk40.y *= 0.95;
    effect->unk40.z *= 0.95;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    temp_f2 = 2560.0f / effect->unk24.x;
    effect->unk52 += (int)(temp_f2 * (effect->unk40.x + effect->unk40.y));
    effect->unk54 += (int)(temp_f2 * (effect->unk40.y + effect->unk40.z));
    effect->unk56 += (int)(temp_f2 * (effect->unk40.z + effect->unk40.x));
    effect->unk52 -= effect->unk52 >> 5;
    effect->unk54 -= effect->unk54 >> 5;
    effect->unk56 -= effect->unk56 >> 5;
    effect->unk4C += effect->unk52;
    effect->unk4E += effect->unk54;
    effect->unk50 += effect->unk56;

    if (!(effect->unkC & 0xF))
    {
        effect->unkA = 0;
        if ((u32)raycast_stage_down(&effect->unk34, &sp3C, &effect->unk7C) != 0
         && sp3C.pos.y > effect->unk34.y - 1.0)
        {
            effect->unkA = 1;
            effect->unk64.x = sp3C.pos.x;
            effect->unk64.y = sp3C.pos.y;
            effect->unk64.z = sp3C.pos.z;
            effect->unk70.x = sp3C.normal.x;
            effect->unk70.y = sp3C.normal.y;
            effect->unk70.z = sp3C.normal.z;
        }
    }

    switch (effect->unkA)
    {
    case 0:
        return;
    }

    sp24 = effect->unk70;
    sp30.x = 0.0f;
    sp30.y = 1.0f;
    sp30.z = 0.0f;
    mathutil_mtxA_from_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_tf_vec(&sp30, &sp30);

    temp_f3 = (sp30.x * sp24.x) + (sp30.y * sp24.y) + (sp30.z * sp24.z);
    temp_f2_3 = (1.1920929e-7f * effect->unk0) + (0.1 * (1.0 - __fabs(temp_f3)));
    sp18.x = effect->unk34.x - effect->unk64.x;
    sp18.y = effect->unk34.y - effect->unk64.y;
    sp18.z = effect->unk34.z - effect->unk64.z;
    temp_f4 = (sp24.x * sp18.x) + (sp24.y * sp18.y) + (sp24.z * sp18.z);
    if (temp_f4 < temp_f2_3 + 0.05)
    {
        temp_f2 = temp_f2_3 + 0.05 - temp_f4;
        effect->unk34.x += temp_f2 * sp24.x;
        effect->unk34.y += temp_f2 * sp24.y;
        effect->unk34.z += temp_f2 * sp24.z;
        temp_f2 = (effect->unk40.x * sp24.x) + (effect->unk40.y * sp24.y) + (effect->unk40.z * sp24.z);
        if (temp_f2 < 0.0)
        {
            temp_f2 = -temp_f2;
            effect->unk40.x += temp_f2 * sp24.x;
            effect->unk40.y += temp_f2 * sp24.y;
            effect->unk40.z += temp_f2 * sp24.z;
            temp_f4 = __fabs(temp_f3) * (1.0 / 8.0);
            effect->unk40.x = effect->unk40.x + (temp_f4 * (effect->unk7C.x - effect->unk40.x));
            effect->unk40.y = effect->unk40.y + (temp_f4 * (effect->unk7C.y - effect->unk40.y));
            effect->unk40.z = effect->unk40.z + (temp_f4 * (effect->unk7C.z - effect->unk40.z));
            temp_f2 = temp_f2 / 2.0;
            effect->unk40.x += temp_f2 * sp24.x;
            effect->unk40.y += temp_f2 * sp24.y;
            effect->unk40.z += temp_f2 * sp24.z;
        }
        spC = sp24;
        if (temp_f3 < 0.0)
        {
            spC.x = -spC.x;
            spC.y = -spC.y;
            spC.z = -spC.z;
        }
        sp30.x = (0.05 * spC.x) + (0.95 * sp30.x);
        sp30.y = (0.05 * spC.y) + (0.95 * sp30.y);
        sp30.z = (0.05 * spC.z) + (0.95 * sp30.z);
        mathutil_vec_normalize_len(&sp30);
        temp_r29 = effect->unk4C;
        temp_r31 = effect->unk50;
        mathutil_mtxA_from_rotate_y(-effect->unk4E);
        mathutil_mtxA_rotate_x(0);
        mathutil_mtxA_tf_vec(&sp30, &sp30);
        effect->unk4C = mathutil_atan2(sp30.z, sp30.y);
        effect->unk50 = -mathutil_atan2(sp30.x, mathutil_sqrt(mathutil_sum_of_sq_2(sp30.z, sp30.y)));
        effect->unk52 >>= 2;
        effect->unk52 += (effect->unk4C - temp_r29) >> 2;
        effect->unk54 -= effect->unk54 >> 4;
        effect->unk56 >>= 2;
        effect->unk56 += (effect->unk50 - temp_r31) >> 2;
    }
}

void effect_paperfrag_draw(struct Effect *effect)
{
    float temp_f30;
    float var_f31;
    float new_var;

    if (lbl_801EEC90.unk0 & 4)
    {
        temp_f30 = 0.1 * effect->unk24.x;
        var_f31 = temp_f30 + func_8000E4D0(&effect->unk34);
        if (var_f31 <= 0.0f)
            return;
        if (var_f31 > temp_f30)
            var_f31 = 1.0f;
        else
            var_f31 *= (1.0f / temp_f30);
    }
    else
        var_f31 = 1.0f;

    mathutil_mtxA_from_mtxB_translate(&effect->unk34);
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);

    new_var = (120.0f * currentCameraStructPtr->sub28.vp.height) * (0.11f * effect->unk24.x) * currentCameraStructPtr->sub28.unk3C;
    var_f31 *= 2.0f * (new_var + mathutilData->mtxA[2][3]);
    if (var_f31 < 0.0)
        return;
    if (var_f31 > 1.0)
        var_f31 = 1.0f;
    mathutil_mtxA_scale_s(effect->unk24.x);
    avdisp_set_bound_sphere_scale(effect->unk24.x);
    if (effect->unkC < 12)
        var_f31 *= 0.083333336f * effect->unkC;
    if (var_f31 < 1.0)
    {
        avdisp_set_alpha(var_f31);
        avdisp_draw_model_culled_sort_all(effect->model);
    }
    else
    {
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        avdisp_draw_model_culled_sort_translucent(effect->model);
    }
}

void effect_paperfrag_destroy(struct Effect *effect) {}

void effect_get_banana_init(struct Effect *effect)
{
    effect->unkC = 60.0 * (0.25 + (0.125 * RAND_FLOAT()));
    effect->unk16 = 1 << effect->unk14;
    mathutil_mtxA_from_mtx(cameraInfo[effect->unk14].unk144);
    mathutil_mtxA_tf_point(&effect->unk34, &effect->unk34);
    mathutil_mtxA_tf_vec(&effect->unk40, &effect->unk40);
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_to_euler_yxz(&effect->unk4E, &effect->unk4C, &effect->unk50);
}

void effect_get_banana_main(struct Effect *effect)
{
    float temp_f0;
    float temp_f7;
    float new_var;
    Vec v;
    struct Camera *camera = &cameraInfo[effect->unk14];

    temp_f7 = 2.0f * camera->sub28.unk38;
    v.x = temp_f0 = (0.7333333333333333 - camera->sub28.unk28) * temp_f7;
    v.y = (0.9 - camera->sub28.unk2C) * temp_f7;
    v.z = -2.0f;
    new_var = (0.05333333333333334 * temp_f7) / effect->model->boundSphereRadius;

    temp_f0 = 1.0 / ((float) effect->unkC);
    effect->unk40.x = temp_f0 * (v.x - effect->unk34.x);
    effect->unk40.y = temp_f0 * (v.y - effect->unk34.y);
    effect->unk40.z = temp_f0 * (v.z - effect->unk34.z);

    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;

    effect->unk24.x += temp_f0 * (new_var - effect->unk24.x);
    effect->unk24.y = effect->unk24.x;
    effect->unk24.z = effect->unk24.x;

    effect->unk54 -= effect->unk54 >> 7;
    effect->unk4C += effect->unk52;
    effect->unk4E += effect->unk54;
    effect->unk50 += effect->unk56;
}

void effect_get_banana_draw(struct Effect *effect)
{
    if (!(lbl_801EEC90.unk0 & 4))
    {
        mathutil_mtxA_from_translate(&effect->unk34);
        mathutil_mtxA_rotate_y(effect->unk4E);
        mathutil_mtxA_rotate_x(effect->unk4C);
        mathutil_mtxA_rotate_z(effect->unk50);
        mathutil_mtxA_scale_xyz(effect->unk24.x, effect->unk24.y, effect->unk24.z);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        avdisp_set_bound_sphere_scale(effect->unk24.x);
        avdisp_draw_model_culled_sort_none(effect->model);
    }
}

void effect_get_banana_destroy(struct Effect *effect) {}

void effect_coli_particle_init(struct Effect *effect)
{
    effect->unk4 |= 2;
    effect->unkA = 0;
    effect->unkC = 15.0 + (45.0 * RAND_FLOAT());
    effect->unk10 = 0;
    effect->unk24.x = 1.0f;
    if (effect->unk18 == 0.0f && effect->unk1C == 0.0f && effect->unk20 == 0.0f)
    {
        effect->unk18 = 0.9f;
        effect->unk1C = 0.8f;
        effect->unk20 = 0.4f;
    }
    effect->unk16 = 1 << effect->unk14;
    effect->unk10 = 0;
}

void effect_coli_particle_main(struct Effect *effect)
{
    struct RaycastHit sp24;
    Vec sp18;
    Vec spC;
    float temp_f0_2;
    float temp_f2_4;
    float temp_f31;
    struct World *world = currentWorldStructPtr;

    effect->unk40.x += 0.008f * world->unk10.x;
    effect->unk40.y += 0.008f * world->unk10.y;
    effect->unk40.z += 0.008f * world->unk10.z;
    effect->unk40.x *= 0.992f;
    effect->unk40.y *= 0.992f;
    effect->unk40.z *= 0.992f;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    if (!(effect->unkC & 0xF))
    {
        effect->unkA = 0;
        if (raycast_stage_down(&effect->unk34, &sp24, &effect->unk7C) != 0U
         && sp24.pos.y > effect->unk34.y - 0.5)
        {
            effect->unkA = 1;
            effect->unk64.x = sp24.pos.x;
            effect->unk64.y = sp24.pos.y;
            effect->unk64.z = sp24.pos.z;
            effect->unk70.x = sp24.normal.x;
            effect->unk70.y = sp24.normal.y;
            effect->unk70.z = sp24.normal.z;
        }
    }
    if (effect->unkC < 24)
    {
        effect->unk18 *= 0.96;
        effect->unk1C *= 0.87;
        effect->unk20 *= 0.86;
        effect->unk24.x = (float)effect->unkC / 24.0;
    }

    switch (effect->unkA)
    {
    case 0:
        if (effect->unkA8 > 0.0)
        {
            effect->unkA8 -= 0.125;
            if (effect->unkA8 < 0.0)
                effect->unkA8 = 0.0f;
        }
        return;
    case 1:
        sp18 = effect->unk70;
        spC.x = effect->unk34.x - effect->unk64.x;
        spC.y = effect->unk34.y - effect->unk64.y;
        spC.z = effect->unk34.z - effect->unk64.z;
        temp_f31 = mathutil_vec_dot_prod(&sp18, &spC);
        effect->unkA8 += 0.25 * (temp_f31 - effect->unkA8);
        effect->unk88.x = effect->unk34.x - ((temp_f31 - 0.02) * sp18.x);
        effect->unk88.y = effect->unk34.y - ((temp_f31 - 0.02) * sp18.y);
        effect->unk88.z = effect->unk34.z - ((temp_f31 - 0.02) * sp18.z);
        mathutil_vec_to_euler_xy(&sp18, &effect->unkA0, &effect->unkA2);
        effect->unkA0 += 0x8000;
        if (temp_f31 < 0.025)
        {
            temp_f0_2 = 0.025 - temp_f31;
            effect->unk34.x += temp_f0_2 * sp18.x;
            effect->unk34.y += temp_f0_2 * sp18.y;
            effect->unk34.z += temp_f0_2 * sp18.z;
            temp_f2_4 = mathutil_vec_dot_prod(&effect->unk40, &sp18);
            if (temp_f2_4 < 0.0)
            {
                temp_f0_2 = temp_f2_4;
                temp_f0_2 *= -1.0;
                effect->unk40.x += temp_f0_2 * sp18.x;
                effect->unk40.y += temp_f0_2 * sp18.y;
                effect->unk40.z += temp_f0_2 * sp18.z;
                effect->unk40.x += 0.03 * (effect->unk7C.x - effect->unk40.x);
                effect->unk40.y += 0.03 * (effect->unk7C.y - effect->unk40.y);
                effect->unk40.z += 0.03 * (effect->unk7C.z - effect->unk40.z);
                temp_f0_2 *= 0.9;
                effect->unk40.x += temp_f0_2 * sp18.x;
                effect->unk40.y += temp_f0_2 * sp18.y;
                effect->unk40.z += temp_f0_2 * sp18.z;
            }
        }
        break;
    }
}

void effect_coli_particle_draw(struct Effect *effect)
{
    float temp_f31;
    float temp_f30;
    Vec *new_var;
    float temp_f1;
    float var_f1;
    Vec sp38;
    struct PointWithColor sp28;
    struct PointWithColor sp18;
    Vec spC;

    if ((lbl_801EEC90.unk0 & 4) && func_8000E4D0(&effect->unk34) < 0.0f)
        return;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[3]);
    mathutil_mtxA_tf_point(&effect->unk58, &sp38);
    mathutil_mtxA_from_mtxB();
    if (effect->unk10 == 0)
    {
        effect->unk10 = 1;
        return;
    }
    mathutil_mtxA_tf_point(&effect->unk34, &sp18.pos);
    new_var = &sp18.pos;
    sp28.pos.x = (1.5 * sp38.x) - (0.5 * new_var->x);
    sp28.pos.y = (1.5 * sp38.y) - (0.5 * new_var->y);
    sp28.pos.z = (1.5 * sp38.z) - (0.5 * new_var->z);
    mathutil_mtxA_from_identity();
    temp_f1 = 0.5f * mathutil_vec_distance(&sp18.pos, &sp28.pos);
    spC.x = (sp18.pos.x + sp28.pos.y) * 0.5f;
    spC.y = (sp18.pos.y + sp28.pos.y) * 0.5f;
    spC.z = (sp18.pos.z + sp28.pos.z) * 0.5f;
    if (test_sphere_in_frustum(&spC, temp_f1) != 0)
    {
        sp18.color.r = 255.0f * effect->unk18;
        sp18.color.g = 255.0f * effect->unk1C;
        sp18.color.b = 255.0f * effect->unk20;
        sp18.color.a = 255;
        sp28.color.r = 96.0f * effect->unk18;
        sp28.color.g = 88.0f * effect->unk1C;
        sp28.color.b = 8.0f * effect->unk20;
        sp28.color.a = 255;
        if (new_var->z < -3.0)
            var_f1 = 1.5f;
        else if (new_var->z > 0.0)
            var_f1 = 4.5f;
        else
            var_f1 = 1.5 + (3.0 + new_var->z);
        gxutil_set_line_width(6.0f * var_f1);
        gxutil_set_line_blend_params(GX_BM_BLEND, GX_BL_ONE, GX_BL_ONE, GX_LO_CLEAR);
        gxutil_draw_line_multicolor_deferred(&sp18, &sp28);
    }
    if (effect->unkA8 > 0.0 && effect->unkA8 < 0.5)
    {
        temp_f30 = 0.5 / (1.0 + (2.0 * effect->unkA8));
        temp_f31 = (0.25 - (0.5 * effect->unkA8)) * effect->unk24.x;
        mathutil_mtxA_from_mtxB_translate(&effect->unk88);
        mathutil_mtxA_rotate_y(effect->unkA2);
        mathutil_mtxA_rotate_x(effect->unkA0);
        mathutil_mtxA_scale_s(temp_f31);
        avdisp_set_z_mode(1, GX_LEQUAL, 0);
        avdisp_set_bound_sphere_scale(temp_f31);
        avdisp_set_post_mult_color(effect->unk18 * temp_f30, effect->unk1C * temp_f30, effect->unk20 * temp_f30, 1.0f);
        avdisp_draw_model_unculled_sort_translucent(commonGma->modelEntries[circle_white].model);
        avdisp_set_z_mode(1, GX_LEQUAL, 1);
        u_reset_post_mult_color();
    }
}

void effect_coli_particle_destroy(struct Effect *effect) {}

void effect_rotate_bg_init(struct Effect *effect) {}

void effect_rotate_bg_main(struct Effect *effect)
{
    struct Ball *ball = currentBallStructPtr;

    if (gameSubmode != MD_GAME || !(ball->flags & 8))
    {
        effect->unk4C += effect->unk52;
        effect->unk4E += effect->unk54;
        effect->unk50 += effect->unk56;
    }
}

void effect_rotate_bg_draw(struct Effect *effect)
{
    if (effect->model != NULL)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
        mathutil_mtxA_translate(&effect->unk34);
        mathutil_mtxA_rotate_y(effect->unkA2);
        mathutil_mtxA_rotate_x(effect->unkA0);
        mathutil_mtxA_rotate_z(effect->unkA4);
        mathutil_mtxA_rotate_y(effect->unk4E);
        mathutil_mtxA_rotate_x(effect->unk4C);
        mathutil_mtxA_rotate_z(effect->unk50);
        nl2ngc_draw_model_sort_translucent_alt2((struct NlModel *)effect->model);
    }
}

void effect_rotate_bg_destroy(struct Effect *effect)
{
    effect->model = NULL;
}

void effect_raindrop_init(struct Effect *effect)
{
    effect->unk4 |= 0x14;
    effect->unkC = 0x1E;
    effect->unkA = 0;
    effect->unk10 = 0xF;
    effect->unkA8 = 0.0f;
}

void effect_raindrop_main(struct Effect *effect)
{
    switch (effect->unkA)
    {
    case 0:
        effect->unkA8 += 0.2 * (1.0 - effect->unkA8);
        effect->unk10--;
        if (effect->unk10 < 0)
            effect->unkA = 1;
        break;
    case 1:
        effect->unkA8 += 0.2 * (1.0 - effect->unkA8);
        if (effect->unkC < 7 || effect->unk94.z > -0.1f)
            effect->unkA = 2;
        break;
    default:
        effect->unkA8 -= 0.13333333333333333;
        if (effect->unkA8 < 0.0)
        {
            effect->unkA8 = 0.0f;
            g_poolInfo.effectPool.statusList[effect->unk0] = 3;
        }
        break;
    }
    effect->unk40.y -= 0.016;
    effect->unk40.x *= 0.992;
    effect->unk40.y *= 0.992;
    effect->unk40.z *= 0.992;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
}

void effect_raindrop_draw(struct Effect *effect)
{
    Vec lineEnd;
    Vec lineStart;
    Vec spC;
    u32 color;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[4]);
    mathutil_mtxA_tf_point(&effect->unk58, &spC);
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_tf_point(&effect->unk34, &lineStart);
    lineEnd.x = (1.5 * spC.x) - (0.5 * lineStart.x);
    lineEnd.y = (1.5 * spC.y) - (0.5 * lineStart.y);
    lineEnd.z = (1.5 * spC.z) - (0.5 * lineStart.z);
    color = RGBA((u32)(255.0 * (effect->unk18 * effect->unkA8)),
                 (u32)(255.0 * (effect->unk1C * effect->unkA8)),
                 (u32)(255.0 * (effect->unk20 * effect->unkA8)),
                 (u32)(192.0 * effect->unkA8));
    mathutil_mtxA_from_identity();
    nl2ngc_set_line_blend_params(1, 1);
    nl2ngc_draw_line_deferred(&lineStart, &lineEnd, color);
}

void effect_raindrop_destroy(struct Effect *effect) {}

void effect_holding_banana_init(struct Effect *effect)
{
    struct Ball *ball = currentBallStructPtr;

    effect->unk10 = 30;
    effect->unk88.x = effect->unk34.x - ball->pos.x;
    effect->unk88.y = effect->unk34.y - ball->pos.y;
    effect->unk88.z = effect->unk34.z - ball->pos.z;
    effect->unk94.x = 0.5 * effect->unk24.x;
    effect->unk94.y = 0.5 * effect->unk24.y;
    effect->unk94.z = 0.5 * effect->unk24.z;
    effect->unkA2 = 0x1000;
}

void effect_holding_banana_main(struct Effect *effect)
{
    struct Ball *ball = &ballInfo[effect->unk14];
    int new_var;
    float temp;

    effect->unk10--;
    new_var = effect->unk10;
    if (new_var == 0)
    {
        struct Effect newEffect;

        memcpy(&newEffect, effect, sizeof(newEffect));
        switch (modeCtrl.gameType)
        {
        case 4:  newEffect.type = ET_FIGHT_GET_BANANA; break;
        default: newEffect.type = ET_GET_BANANA;       break;
        }
        newEffect.unkC = 0;
        newEffect.unk14 = effect->unk14;
        newEffect.unk16 = effect->unk16;
        spawn_effect(&newEffect);
        effect->unkC = 1;
    }
    else
    {
        temp = 0.75 + (0.5 * ((float)(30.0 - new_var) / 30.0f));
        effect->unk88.x *= 0.8;
        effect->unk88.y += 0.2 * (temp - effect->unk88.y);
        effect->unk88.z *= 0.8;
        effect->unk34.x = ball->pos.x + effect->unk88.x;
        effect->unk34.y = ball->pos.y + effect->unk88.y;
        effect->unk34.z = ball->pos.z + effect->unk88.z;
        effect->unk54 += (effect->unkA2 - effect->unk54) >> 3;
        effect->unk4E += effect->unk54;
        effect->unk24.x += 0.2 * (effect->unk94.x - effect->unk24.x);
        effect->unk24.y += 0.2 * (effect->unk94.y - effect->unk24.y);
        effect->unk24.z += 0.2 * (effect->unk94.z - effect->unk24.z);
    }
}

void effect_holding_banana_draw(struct Effect *effect)
{
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_scale_xyz(effect->unk24.x, effect->unk24.y, effect->unk24.z);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    avdisp_set_bound_sphere_scale(effect->unk24.x);
    avdisp_draw_model_culled_sort_none(effect->model);
}

void effect_holding_banana_destroy(struct Effect *effect) {}

void effect_bubble_init(struct Effect *effect)
{
    effect->unkC = 60.0 * (1.0 + RAND_FLOAT());
    effect->unkA8 = 0.0f;
    effect->unk24.z = 0.5 + (0.5 * RAND_FLOAT());
}

void effect_bubble_main(struct Effect *effect)
{
    Vec spC;
    float temp_f2;

    effect->unk40.y += 0.012;
    mathutil_mtxA_from_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    spC.x = 0.0f;
    spC.y = 1.0f;
    spC.z = 0.0f;
    mathutil_mtxA_tf_vec(&spC, &spC);
    temp_f2 = -0.15 * mathutil_vec_dot_prod(&spC, &effect->unk40);
    effect->unk40.x += temp_f2 * spC.x;
    effect->unk40.y += temp_f2 * spC.y;
    effect->unk40.z += temp_f2 * spC.z;
    effect->unk40.x *= 0.98;
    effect->unk40.y *= 0.98;
    effect->unk40.z *= 0.98;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    effect->unk4C += 16384.0f * effect->unk40.x;
    effect->unk4E += 16384.0f * effect->unk40.y + (1024.0f * (effect->unk40.x + effect->unk40.z));
    effect->unk50 += 16384.0f * (effect->unk40.z + effect->unk40.y);
    if (effect->unkC < 15.0)
        effect->unkA8 *= 0.9;
    else
        effect->unkA8 += 0.15 * (1.0 - effect->unkA8);
}

void effect_bubble_draw(struct Effect *effect)
{
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_sq_from_identity();
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_scale_xyz(effect->unk24.z, effect->unk24.z, 1.0f);
    nl2ngc_set_scale(effect->unk24.z);
    nl2ngc_draw_model_alpha_sort_all_alt((struct NlModel *)effect->model, effect->unkA8);
}

void effect_bubble_destroy(struct Effect *effect) {}

void effect_levitate_init(struct Effect *effect)
{
    struct RaycastHit spC;

    effect->unkC = 60;
    effect->unk34.x += 0.75 * (RAND_FLOAT() - 0.5);
    effect->unk34.y += 0.75 * (RAND_FLOAT() - 0.5);
    effect->unk34.z += 0.75 * (RAND_FLOAT() - 0.5);
    if (raycast_stage_down(&effect->unk34, &spC, NULL) != 0U)
        effect->unk64.y = spC.pos.y;
    else
        effect->unk64.y = effect->unk34.y - 100.0;
    effect->unk40.y = 0.0040833335f;
    effect->unk16 = 1 << effect->unk14;
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
        effect->unk24.x = 0.45f;
    else
        effect->unk24.x = 0.25f;
}

void effect_levitate_main(struct Effect *effect)
{
    effect->unk40.y -= 0.0008166666666666666;
    effect->unk34.y += effect->unk40.y;
    if (effect->unk34.y < effect->unk64.y + (0.5 * effect->unk24.x))
    {
        effect->unk34.y = effect->unk64.y + (0.5 * effect->unk24.x);
        if (effect->unk24.x > 0.05)
            effect->unk24.x -= 0.05;
        else
            g_poolInfo.effectPool.statusList[effect->unk0] = 3;
    }
}

void effect_levitate_draw(struct Effect *effect)
{
    Vec spC;
    float scale;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_get_translate_alt(&spC);
    mathutil_mtxA_sq_from_identity();
    if (spC.z >= -1.1920929e-7f)
        return;
    if (effect->unkC < 10)
        scale = (float)effect->unkC / 10.0;
    else
        scale = 1.0f;
    scale *= effect->unk24.x;
    if (spC.z > -1.443375673 * currentCameraStructPtr->sub28.unk3C)
        scale *= spC.z / (-1.443375673 * currentCameraStructPtr->sub28.unk3C);
    else if (spC.z < -5.773502692 * currentCameraStructPtr->sub28.unk3C)
        scale *= spC.z / (-5.773502692 * currentCameraStructPtr->sub28.unk3C);
    mathutil_mtxA_scale_xyz(scale, scale, scale);
    nl2ngc_set_scale(scale);
    if (effect->unkC < 56)
        nl2ngc_draw_model_sort_translucent_alt2(g_commonNlObj->models[NLMODEL_common_CROSS_LIGHT]);
    else
        nl2ngc_draw_model_alpha_sort_all(g_commonNlObj->models[NLMODEL_common_CROSS_LIGHT], (float)(60 - effect->unkC) / 4.0);
}

void effect_levitate_destroy(struct Effect *effect) {}

void effect_twinkle_star_init(struct Effect *effect)
{
    effect->unk88.x = 1.0f;
    effect->unk88.y = 1.0f;
    effect->unk88.z = 1.0f;
}

void effect_twinkle_star_main(struct Effect *effect)
{
    float temp_f1;

    effect->unk10++;
    temp_f1 = 0.5 + (0.25 * (1.0 + mathutil_sin(effect->unk10 << 9)));
    effect->unk88.x = temp_f1 * 1.10;
    effect->unk88.y = temp_f1 * 1.05;
    effect->unk88.z = temp_f1;
    if (effect->unk88.x > 1.0)
        effect->unk88.x = 1.0f;
    if (effect->unk88.y > 1.0)
        effect->unk88.y = 1.0f;
    effect->unk18 = effect->unk88.x;
    effect->unk1C = effect->unk88.y;
    effect->unk20 = effect->unk88.z;
}

void effect_twinkle_star_draw(struct Effect *effect)
{
    Vec spC;
    float len;
    float temp_f1_2;
    float scale;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_get_translate_alt(&spC);
    if (spC.z > -0.1f)
        return;
    mathutil_mtxA_sq_from_identity();
    len = mathutil_vec_len(&spC);
    temp_f1_2 = (len - 26.0) / len;
    spC.x *= temp_f1_2;
    spC.y *= temp_f1_2;
    spC.z *= temp_f1_2;
    mathutil_mtxA_set_translate(&spC);
    scale = 0.5 * (effect->unk88.x + effect->unk88.y + effect->unk88.z);
    mathutil_mtxA_scale_xyz(scale, scale, scale);
    nl2ngc_set_scale(scale);
    nl2ngc_set_material_color(effect->unk18, effect->unk1C, effect->unk20);
    nl2ngc_draw_model_sort_translucent_alt2((struct NlModel *)effect->model);
    u_reset_post_mult_color();
}

void effect_twinkle_star_destroy(struct Effect *effect) {}

void effect_bonus_stg_star_init(struct Effect *effect)
{
    effect->unkC = 60.0 * (0.75 + (0.5 * RAND_FLOAT()));
    effect->unk16 = 1 << effect->unk14;
    effect->unkA8 = 1.0f;
}

void effect_bonus_stg_star_main(struct Effect *effect)
{
    effect->unk40.y += -0.016;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    effect->unk50 = effect->unk50 + 0x400;
    if (effect->unkA8 > 0.5 && !(effect->unkC & 1))
    {
        Vec rnd;
        struct Effect spC;

        memset(&spC, 0, sizeof(spC));
        spC.type = ET_BONUS_STG_STAR_TAIL;
        spC.unk34 = effect->unk34;
        spC.unk14 = effect->unk14;
        rnd.x = 2.0 * (RAND_FLOAT() - 0.5);
        rnd.y = 2.0 * (RAND_FLOAT() - 0.5);
        rnd.z = 2.0 * (RAND_FLOAT() - 0.5);
        spC.unk40.x = (0.25 * effect->unk40.x) + rnd.x;
        spC.unk40.y = (0.25 * effect->unk40.y) + rnd.y;
        spC.unk40.z = (0.25 * effect->unk40.z) + rnd.z;
        spC.unk24.x = (effect->unkA8 * (0.25 + (0.25 * RAND_FLOAT())));
        spawn_effect(&spC);
    }
    if (effect->unkC < 15.0)
        effect->unkA8 = (float)effect->unkC / 15.0;
}

void effect_bonus_stg_star_draw(struct Effect *effect)
{
    Vec spC;
    float len;
    float temp_f1_2;
    float scale;
    float temp_f1_3;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_get_translate_alt(&spC);
    if (spC.z > -0.1f)
        return;
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    nl2ngc_draw_model_alpha_sort_all_alt(g_bgNlObj->models[0x26], effect->unkA8);
    len = mathutil_vec_len(&spC);
    temp_f1_2 = (len - 26.0) / len;
    spC.x *= temp_f1_2;
    spC.y *= temp_f1_2;
    spC.z *= temp_f1_2;
    mathutil_mtxA_from_translate(&spC);
    scale = 0.5 + (0.5 * effect->unkA8);
    mathutil_mtxA_scale_xyz(scale, scale, scale);
    nl2ngc_set_scale(scale);
    temp_f1_3 = 0.75 * effect->unkA8;
    nl2ngc_set_material_color(temp_f1_3, temp_f1_3, temp_f1_3);
    nl2ngc_draw_model_sort_translucent_alt2(g_bgNlObj->models[1]);
    u_reset_post_mult_color();
}

void effect_bonus_stg_star_destroy(struct Effect *effect) {}

void effect_bonus_stg_star_tail_init(struct Effect *effect)
{
    effect->unkC = 60.0 * (0.5 + (0.25 * RAND_FLOAT()));
    effect->unk16 = 1 << effect->unk14;
    effect->unkA8 = 1.0f;
}

void effect_bonus_stg_star_tail_main(struct Effect *effect)
{
    effect->unk40.x *= 0.99;
    effect->unk40.y *= 0.99;
    effect->unk40.z *= 0.99;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    if (effect->unkC < 15.0)
        effect->unkA8 = (float)effect->unkC / 15.0;
}

void effect_bonus_stg_star_tail_draw(struct Effect *effect)
{
    Vec spC;
    float scale;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_sq_from_identity();
    scale = 52.68 * (effect->unk24.x * effect->unkA8);
    mathutil_mtxA_scale_xyz(scale, scale, scale);
    nl2ngc_set_scale(scale);
    mathutil_mtxA_get_translate_alt(&spC);
    mathutil_mtxA_rotate_z((s16)((325.0 * spC.x) + (655.0 * spC.y)));
    nl2ngc_set_material_color(1.0f, 1.0f, 1.0f);
    nl2ngc_draw_model_sort_translucent_alt2(g_commonNlObj->models[NLMODEL_common_CROSS_LIGHT]);
    u_reset_post_mult_color();
}

void effect_bonus_stg_star_tail_destroy(struct Effect *effect) {}

void effect_water_light_init(struct Effect *effect)
{
    effect->unkC = 30.0 + (60.0 * RAND_FLOAT());
    effect->unk4C = rand() & 0x7FFF;
    effect->unk52 = (rand() & 0xFFF) - 0x800;
    effect->unk24.x = 0.0f;
    effect->unk24.z = 0.2 + (0.8 * RAND_FLOAT());
    effect->unk24.y = RAND_FLOAT();
    effect->unk18 = 0.0f;
    effect->unk1C = 0.0f;
    effect->unk20 = 0.0f;
}

void effect_water_light_main(struct Effect *effect)
{
    float temp;
    float temp_f1;

    effect->unk4C += effect->unk52;
    temp = effect->unk24.z * (1.0 + (0.2 * mathutil_sin(effect->unk4C)));
    effect->unk24.x += 0.10 * (temp - effect->unk24.x);
    effect->unk24.y += 0.05 * (1.0 - effect->unk24.y);
    if (effect->unkC < 30)
    {
        effect->unk24.z *= 0.99;
        temp_f1 = (float)(effect->unkC - 1) / (float)effect->unkC;
        effect->unk18 *= temp_f1;
        effect->unk1C *= temp_f1;
        effect->unk20 *= temp_f1;
    }
    else
    {
        effect->unk18 += 0.20 * (1.0 - effect->unk18);
        effect->unk1C += 0.21 * (1.0 - effect->unk1C);
        effect->unk20 += 0.22 * (1.0 - effect->unk20);
    }
}

void effect_water_light_draw(struct Effect *effect)
{
    Vec sp18;
    Vec spC;
    float temp_f31;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[1]);
    mathutil_mtxA_translate(&effect->unk34);
    spC.x = 0.0f;
    spC.y = -1.0f;
    spC.z = 0.0f;
    mathutil_mtxA_tf_vec(&spC, &spC);
    mathutil_mtxA_get_translate_alt(&sp18);
    mathutil_vec_normalize_len(&sp18);
    if (sp18.z > 0.0)
        return;
    temp_f31 = (0.2 + (0.8 * spC.z)) * -sp18.z;
    if (temp_f31 < 0.0)
        return;
    sp18.x = 0.0f;
    sp18.y = 0.0f;
    sp18.z *= 0.75;
    mathutil_mtxA_rigid_inv_tf_point(&sp18, &sp18);
    mathutil_mtxA_rotate_y(mathutil_atan2(sp18.x, sp18.z));
    nl2ngc_set_material_color(effect->unk18, effect->unk1C, effect->unk20);
    mathutil_mtxA_scale_xyz(effect->unk24.x * temp_f31, effect->unk24.y, 1.0f);
    nl2ngc_draw_model_sort_translucent_alt2(g_bgNlObj->models[5]);
    u_reset_post_mult_color();
}

void effect_water_light_destroy(struct Effect *effect) {}

void effect_raindrop_ripple_init(struct Effect *effect)
{
    float temp;
    float temp_f3;
    float temp_f5;

    effect->unkC = 15.0 + (30.0 * RAND_FLOAT());
    effect->unkA8 = 1.0f;
    effect->unk24.x = 0.0f;
    effect->unk24.y = 0.016666666666666666 * (1.0 + RAND_FLOAT());
    effect->unk40.x = effect->unk7C.x;
    effect->unk40.y = effect->unk7C.y;
    effect->unk40.z = effect->unk7C.z;
    temp_f5 = -(-0.008 * effect->unk70.y);
    effect->unk94.x = temp_f5 * effect->unk70.x;
    effect->unk94.y = temp_f5 * effect->unk70.y + -0.008;
    effect->unk94.z = temp_f5 * effect->unk70.z;
    temp_f5 = (effect->unk70.x * effect->unk7C.x) + (effect->unk70.y * effect->unk7C.y) + (effect->unk70.z * effect->unk7C.z);
    temp_f5 = __fabs(temp_f5);
    temp_f3 = 1.0 - (5.0 * temp_f5);
    effect->unkC *= temp_f3;
    temp_f3 = 1.0 / (1.0 + (3.0 * mathutil_vec_len(&effect->unk7C)));
    effect->unkC *= temp_f3;
    effect->unk24.y *= temp_f3;
    if (effect->unkC < 6.0)
        effect->unkC = 6;
}

void effect_raindrop_ripple_main(struct Effect *effect)
{
    effect->unk40.x += effect->unk94.x;
    effect->unk40.y += effect->unk94.y;
    effect->unk40.z += effect->unk94.z;
    effect->unk40.x += 0.1 * (effect->unk7C.x - effect->unk40.x);
    effect->unk40.y += 0.1 * (effect->unk7C.y - effect->unk40.y);
    effect->unk40.z += 0.1 * (effect->unk7C.z - effect->unk40.z);
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    effect->unk24.y *= 0.96;
    effect->unk24.x += effect->unk24.y;
    if (effect->unkC < 15)
        effect->unkA8 *= (float)effect->unkC / (float)(effect->unkC + 1);
}

void effect_raindrop_ripple_draw(struct Effect *effect)
{
    Vec sp18;
    float var_f31;

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_get_translate_alt(&sp18);
    var_f31 = 0.5 * (6.0 + sp18.z);
    if (var_f31 < 0.0)
        return;
    if (var_f31 > 1.0)
        var_f31 = 1.0f;
    var_f31 = var_f31 * effect->unkA8;
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_rotate_x(-0x4000);
    mathutil_mtxA_scale_xyz(effect->unk24.x, effect->unk24.x, effect->unk24.x);
    nl2ngc_set_scale(effect->unk24.x);
    nl2ngc_set_material_color(s_bgLightInfo.unk14 * var_f31, s_bgLightInfo.unk18 * var_f31, s_bgLightInfo.unk1C * var_f31);
    nl2ngc_draw_model_sort_translucent_alt2((struct NlModel *)effect->model);
    u_reset_post_mult_color();
}

void effect_raindrop_ripple_destroy(struct Effect *effect) {}

void effect_ball_glow_init(struct Effect *effect)
{
    effect->unk18 = 0.0f;
    effect->unk1C = 0.0f;
    effect->unk20 = 0.0f;
}

void effect_ball_glow_main(struct Effect *effect)
{
    if (!(currentBallStructPtr->flags & 0x10))
    {
        effect->unk18 += 0.10 * (1.0 - effect->unk18);
        effect->unk1C += 0.12 * (1.0 - effect->unk1C);
        effect->unk20 += 0.15 * (1.0 - effect->unk20);
    }
    else
    {
        effect->unk18 = 0.0f;
        effect->unk1C = 0.0f;
        effect->unk20 = 0.0f;
    }
}

void effect_ball_glow_draw(struct Effect *effect)
{
    struct Ball *ball = currentBallStructPtr;
    Vec spC;
    float scale;

    if (!(ball->flags & 0x10))
    {
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_mult_right(ball->unk30);
        mathutil_mtxA_get_translate_alt(&spC);
        if (spC.z < -0.1500000014901161)
        {
            scale = -0.1500000014901161 / spC.z;
            spC.x *= scale;
            spC.y *= scale;
            spC.z = -0.15f;
            mathutil_mtxA_from_translate(&spC);
            scale = 4.0 * scale * ball->currRadius;
            mathutil_mtxA_scale_xyz(scale, scale, scale);
            nl2ngc_set_scale(scale);
            nl2ngc_set_material_color(1.0f, 1.0f, 1.0f);
            nl2ngc_draw_model_sort_translucent_alt2(g_commonNlObj->models[NLMODEL_common_circle_white]);
            u_reset_post_mult_color();
        }
    }
}

void effect_ball_glow_destroy(struct Effect *effect) {}

void effect_exm_guide_light_init(struct Effect *effect)
{
    effect->unkA8 = 0.0f;
}

void effect_exm_guide_light_main(struct Effect *effect)
{
    Vec spC4;
    Vec spB8;
    struct Effect spC;
    float temp_f1;
    struct Ball *temp_r29;

    temp_r29 = currentBallStructPtr;
    spC4 = effect->unk34;
    mathutil_mtxA_from_mtx(animGroups[effect->unk10].transform);
    mathutil_mtxA_translate(&effect->unk88);
    mathutil_mtxA_get_translate_alt2(&effect->unk34);
    effect->unk40.x = effect->unk34.x - spC4.x;
    effect->unk40.y = effect->unk34.y - spC4.y;
    effect->unk40.z = effect->unk34.z - spC4.z;
    temp_f1 = mathutil_vec_distance(&temp_r29->pos, &effect->unk34);
    if (temp_f1 < 1.0)
        effect->unkA8 += 0.25 * (1.0 - effect->unkA8);
    else if (effect->unkA8 > 0.0)
    {
        effect->unkA8 -= 0.008333333333333333;
        if (effect->unkA8 < 0.0)
            effect->unkA8 = 0.0f;
    }

    if (effect->unkA8 > 0.25
     && (unpausedFrameCounter + effect->unk0) % 2 == 0)
    {
        memset(&spC, 0, sizeof(spC));
        spC.type = ET_EXM_GUIDE_LIGHT_TAIL;
        spC.unk34 = effect->unk34;
        spB8.x = 0.01 * (RAND_FLOAT() - 0.5);
        spB8.y = 0.01 * (RAND_FLOAT() - 0.5);
        spB8.z = 0.01 * (RAND_FLOAT() - 0.5);
        spC.unk40.x = (0.25 * effect->unk40.x) + spB8.x;
        spC.unk40.y = (0.25 * effect->unk40.y) + spB8.y;
        spC.unk40.z = (0.25 * effect->unk40.z) + spB8.z;
        spC.unk24.x = 0.125 * effect->unkA8;
        spawn_effect(&spC);
    }
    if (effect->unkA8 > 0.0)
        func_800390C8(5, &effect->unk34, effect->unkA8 * (temp_f1 * temp_f1));
}

void effect_exm_guide_light_draw(struct Effect *effect)
{
    Vec spC;
    float scale;

    if (effect->unkA8 != 0.0)
    {
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate(&effect->unk34);
        mathutil_mtxA_sq_from_identity();
        mathutil_mtxA_get_translate_alt(&spC);
        nl2ngc_set_material_color(1.0f, 1.0f, 1.0f);
        scale = 0.038461538461538464 * (0.35 * effect->unkA8);
        mathutil_mtxA_scale_xyz(scale, scale, scale);
        nl2ngc_set_scale(scale);
        nl2ngc_draw_model_sort_translucent_alt2(g_bgNlObj->models[1]);
        nl2ngc_set_material_color(effect->unkA8, effect->unkA8, effect->unkA8);
        if (spC.z < -0.1500000014901161)
        {
            scale = -0.1500000014901161 / spC.z;
            spC.x *= scale;
            spC.y *= scale;
            spC.z = -0.15f;
            mathutil_mtxA_from_translate(&spC);
            scale = scale * (0.1875 + (0.5625 * effect->unkA8));
            mathutil_mtxA_scale_xyz(scale, scale, scale);
            nl2ngc_set_scale(scale);
            nl2ngc_draw_model_sort_translucent_alt2(g_commonNlObj->models[NLMODEL_common_circle_white]);
        }
        u_reset_post_mult_color();
    }
}

void effect_exm_guide_light_destroy(struct Effect *effect) {}

void effect_exm_guide_light_tail_init(struct Effect *effect)
{
    effect->unkC = 60.0 * (0.5 + (0.25 * RAND_FLOAT()));
    effect->unkA8 = 1.0f;
}

void effect_exm_guide_light_tail_main(struct Effect *effect)
{
    effect->unk40.x *= 0.99;
    effect->unk40.y *= 0.99;
    effect->unk40.z *= 0.99;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    if (effect->unkC < 15.0)
        effect->unkA8 = (float)effect->unkC / 15.0;
}

void effect_exm_guide_light_tail_draw(struct Effect *effect)
{
    Vec spC;
    float temp_f31;

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_sq_from_identity();
    temp_f31 = effect->unk24.x * effect->unkA8;
    mathutil_mtxA_scale_xyz(temp_f31, temp_f31, temp_f31);
    nl2ngc_set_scale(temp_f31);
    mathutil_mtxA_get_translate_alt(&spC);
    mathutil_mtxA_rotate_z((s16)((32500.0 * spC.x) + (65500.0 * spC.y)));
    nl2ngc_set_material_color(1.0f, 1.0f, 1.0f);
    nl2ngc_draw_model_sort_translucent_alt2(g_commonNlObj->models[NLMODEL_common_CROSS_LIGHT]);
    u_reset_post_mult_color();
}

void effect_exm_guide_light_tail_destroy(struct Effect *effect) {}

void effect_colistar_particle_init(struct Effect *effect)
{
    effect->unk4 |= 2;
    effect->unkA = 0;
    effect->unkC = 15.0 + (45.0 * RAND_FLOAT());
    effect->unk10 = 0;
    effect->unk16 = 1 << effect->unk14;
    effect->model = commonGma->modelEntries[CRASH_STAR].model;
    effect->unk4C = 0;
    effect->unkA8 = 0.0f;
    effect->unk58 = effect->unk34;
    effect->unk24.x = 0.0f;
    if (effect->unk24.y == 0.0)
        effect->unk24.y = 0.015f;
    else
        effect->unk24.y *= 0.015f;
    effect->unk4C = 0;
    effect->unk4E = rand() & 0x7FFF;
    effect->unk50 = rand() & 0x7FFF;
    effect->unk52 = 0;
    effect->unk54 = (rand() & 0xFFF) + 0x1000;
    effect->unk56 = 0;
}

void effect_colistar_particle_main(struct Effect *effect)
{
    struct RaycastHit sp24;
    Vec sp18;
    Vec spC;
    float temp_f0_2;
    float temp_f2_6;
    float temp_f31;
    struct World *world = &currentWorldStructPtr[effect->unk14];

    effect->unk40.x += 0.004f * world->unk10.x;
    effect->unk40.y += 0.004f * world->unk10.y;
    effect->unk40.z += 0.004f * world->unk10.z;
    effect->unk40.x *= 0.985f;
    effect->unk40.y *= 0.985f;
    effect->unk40.z *= 0.985f;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    effect->unk52 -= effect->unk52 >> 2;
    effect->unk54 -= effect->unk54 >> 5;
    effect->unk56 -= effect->unk56 >> 3;
    effect->unk4C += effect->unk52;
    effect->unk4E += effect->unk54;
    effect->unk50 += effect->unk56;
    if (!(effect->unkC & 7))
    {
        effect->unkA = 0;
        if (raycast_stage_down(&effect->unk34, &sp24, &effect->unk7C) != 0U
         && sp24.pos.y > effect->unk34.y - 0.6)
        {
            effect->unkA = 1;
            effect->unk64.x = sp24.pos.x;
            effect->unk64.y = sp24.pos.y;
            effect->unk64.z = sp24.pos.z;
            effect->unk70.x = sp24.normal.x;
            effect->unk70.y = sp24.normal.y;
            effect->unk70.z = sp24.normal.z;
        }
    }

    if (effect->unkC < 24)
    {
        float temp_f2 = (float)effect->unkC;
        effect->unk24.x *= temp_f2 / (1.0f + temp_f2);
    }
    else
        effect->unk24.x += 0.3312f * (effect->unk24.y - effect->unk24.x);

    switch (effect->unkA)
    {
    case 0:
        if (effect->unkA8 > 0.0)
        {
            effect->unkA8 -= 0.0625;
            if (effect->unkA8 < 0.0)
                effect->unkA8 = 0.0f;
        }
        break;
    case 1:
        sp18 = effect->unk70;
        spC.x = effect->unk34.x - effect->unk64.x;
        spC.y = effect->unk34.y - effect->unk64.y;
        spC.z = effect->unk34.z - effect->unk64.z;
        temp_f31 = mathutil_vec_dot_prod(&sp18, &spC);
        effect->unkA8 += 0.25 * (temp_f31 - effect->unkA8);
        effect->unk88.x = effect->unk34.x - ((temp_f31 - 0.02) * sp18.x);
        effect->unk88.y = effect->unk34.y - ((temp_f31 - 0.02) * sp18.y);
        effect->unk88.z = effect->unk34.z - ((temp_f31 - 0.02) * sp18.z);
        mathutil_vec_to_euler_xy(&sp18, &effect->unkA0, &effect->unkA2);
        effect->unkA0 += 0x8000;
        temp_f0_2 = 8.090365f * effect->unk24.x;
        if (temp_f31 < temp_f0_2)
        {
            temp_f31 = temp_f0_2 - temp_f31;
            effect->unk34.x += temp_f31 * sp18.x;
            effect->unk34.y += temp_f31 * sp18.y;
            effect->unk34.z += temp_f31 * sp18.z;
            temp_f2_6 = mathutil_vec_dot_prod(&effect->unk40, &sp18);
            if (temp_f2_6 < 0.0)
            {
                temp_f31 = temp_f2_6;
                temp_f31 *= -1.0;
                effect->unk40.x += temp_f31 * sp18.x;
                effect->unk40.y += temp_f31 * sp18.y;
                effect->unk40.z += temp_f31 * sp18.z;
                effect->unk40.x += 0.029999971f * (effect->unk7C.x - effect->unk40.x);
                effect->unk40.y += 0.029999971f * (effect->unk7C.y - effect->unk40.y);
                effect->unk40.z += 0.029999971f * (effect->unk7C.z - effect->unk40.z);
                effect->unk52 += 131072.0f * (temp_f31 * (RAND_FLOAT() - 0.5f));
                effect->unk54 += 524288.0f * (temp_f31 * (RAND_FLOAT() - 0.5f));
                effect->unk56 += 131072.0f * (temp_f31 * (RAND_FLOAT() - 0.5f));
                effect->unk40.x += temp_f31 * sp18.x;
                effect->unk40.y += temp_f31 * sp18.y;
                effect->unk40.z += temp_f31 * sp18.z;
            }
        }
        break;
    }
}

void effect_colistar_particle_draw(struct Effect *effect)
{
    Vec sp30;
    Vec sp24;
    Vec sp18;
    Vec spC;
    float temp_f31;
    float temp_f30;
    float scale;
    float temp_f10;
    float temp_f1;
    struct GMAModel *model = effect->model;
    s16 temp_r29;
    s16 var_r28;

    if ((lbl_801EEC90.unk0 & 4)
     && func_8000E4D0(&effect->unk34) < -(model->boundSphereRadius * effect->unk24.x))
        return;

    mathutil_mtxA_from_mtxB_translate(&effect->unk34);
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);

    mathutil_mtxA_push();
    mathutil_mtxA_scale_s(effect->unk24.x);
    avdisp_set_bound_sphere_scale(effect->unk24.x);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    avdisp_draw_model_culled_sort_translucent(model);
    mathutil_mtxA_pop();

    mathutil_mtxA_get_translate_alt(&sp30);
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[3]);
    mathutil_mtxA_tf_point(&effect->unk58, &sp18);

    if (sp30.z < -0.1f && sp18.z < -0.1f
     && effect->unk24.x > (effect->unk24.y * 0.1f))
    {
        sp24 = sp30;

        temp_r29 = 24576.0f * ((sp30.x + sp30.y) / sp30.z);
        scale = 0.6f * (0.5f + (effect->unk24.x * (0.5f / effect->unk24.y)));
        if (scale > 1.0f)
            scale = 1.0f;

        model = commonGma->modelEntries[CRASH_FLASH].model;
        temp_f10 = (0.1f + sp30.z) / sp30.z;
        temp_f30 = 0.4f * effect->unk24.x * temp_f10;
        temp_f31 = temp_f30 * (model->boundSphereRadius);

        temp_f10 = (0.1f + sp30.z) / sp24.z;
        sp24.x *= temp_f10;
        sp24.y *= temp_f10;
        sp24.z = 0.1f + sp30.z;

        temp_f10 = (0.1f + sp18.z) / sp18.z;
        sp18.x *= temp_f10;
        sp18.y *= temp_f10;
        sp18.z = 0.1f + sp18.z;

        sp30.x = sp24.x - sp18.x;
        sp30.y = sp24.y - sp18.y;
        sp30.z = 0.0f;

        if (sp30.x == 0.0f && sp30.y == 0.0f)
        {
            var_r28 = 0;
            spC.x = temp_f30;
            spC.y = temp_f30;
            spC.z = temp_f30;
        }
        else
        {
            mathutil_vec_set_len(&sp30, &sp30, temp_f31);
            sp24.x += sp30.x;
            sp24.y += sp30.y;
            sp18.x -= sp30.x;
            sp18.y -= sp30.y;
            var_r28 = mathutil_atan2(sp30.y, sp30.x);
            temp_f1 = (0.5f * mathutil_vec_distance(&sp24, &sp18)) / temp_f31;
            spC.x = temp_f30 * temp_f1;
            spC.y = temp_f30 / temp_f1;
            spC.z = temp_f30;
        }

        mathutil_mtxA_from_translate_xyz(0.5f * (sp24.x + sp18.x), 0.5f * (sp24.y + sp18.y), sp24.z);
        mathutil_mtxA_rotate_z(var_r28);
        mathutil_mtxA_scale(&spC);
        mathutil_mtxA_rotate_z(temp_r29 - var_r28);
        avdisp_set_bound_sphere_scale(spC.x);
        avdisp_set_z_mode(1, GX_LEQUAL, 0);
        avdisp_set_post_mult_color(scale, scale, scale, 1.0f);
        avdisp_draw_model_culled_sort_translucent(model);
        u_reset_post_mult_color();
        avdisp_set_z_mode(1, GX_LEQUAL, 1);
    }

    if (effect->unkA8 > 0.0f && effect->unkA8 < 0.6f)
    {
        temp_f30 = effect->unk24.x * (1.0f / effect->unk24.y);
        scale = (0.6f - effect->unkA8) * temp_f30;
        mathutil_mtxA_from_mtxB_translate(&effect->unk88);
        mathutil_mtxA_rotate_y(effect->unkA2);
        mathutil_mtxA_rotate_x(effect->unkA0);
        mathutil_mtxA_scale_s(scale);
        temp_f30 *= 1.0f - (0.083333336f * effect->unkA8);
        if (temp_f30 > 1.0f)
            avdisp_set_post_mult_color(0.71999997f, 0.63f, 0.54f, 1.0f);
        else
            avdisp_set_post_mult_color(0.71999997f * temp_f30, 0.63f * temp_f30, 0.54f * temp_f30, 1.0f);
        avdisp_set_z_mode(1, GX_LEQUAL, 0);
        avdisp_set_bound_sphere_scale(scale);
        avdisp_draw_model_unculled_sort_translucent(commonGma->modelEntries[circle_white].model);
        avdisp_set_z_mode(1, GX_LEQUAL, 1);
        u_reset_post_mult_color();
    }
}

void effect_colistar_particle_destroy(struct Effect *effect) {}

void effect_bgwat_bubble_base_init(struct Effect *effect)
{
    struct StageBgObject *bgObj;
    struct GMAModel *model;

    effect->unk4 = effect->unk4 | 1;
    effect->unk10 = 0;
    bgObj = (struct StageBgObject *)effect->model;
    model = bgObj->model;
    mathutil_mtxA_from_translate(&bgObj->pos);
    mathutil_mtxA_rotate_z(bgObj->rotZ);
    mathutil_mtxA_rotate_y(bgObj->rotY);
    mathutil_mtxA_rotate_x(bgObj->rotX);
    mathutil_mtxA_tf_point(&model->boundSphereCenter, &effect->unk34);
}

void effect_bgwat_bubble_base_main(struct Effect *effect)
{
    struct StageBgObject *bgObj = (struct StageBgObject *)effect->model;
    struct GMAModel *model = bgObj->model;
    struct Effect sp18;
    Vec spC;

    mathutil_mtxA_from_translate(&bgObj->pos);
    mathutil_mtxA_rotate_z(bgObj->rotZ);
    mathutil_mtxA_rotate_y(bgObj->rotY);
    mathutil_mtxA_rotate_x(bgObj->rotX);
    mathutil_mtxA_scale(&bgObj->scale);
    mathutil_mtxA_tf_point(&model->boundSphereCenter, &effect->unk34);
    effect->unk40.x = effect->unk34.x - effect->unk58.x;
    effect->unk40.y = effect->unk34.y - effect->unk58.y;
    effect->unk40.z = effect->unk34.z - effect->unk58.z;
    effect->unk10 += 1;
    if (!(effect->unk10 & 0xF))
    {
        float radius = model->boundSphereRadius;

        memset(&sp18, 0, sizeof(sp18));
        sp18.type = ET_BGWAT_BUBBLE;
        sp18.model = ((struct BGWaterWork *)backgroundInfo.work)->bubbleModel;
        spC.x = RAND_FLOAT() - 0.5f;
        spC.y = RAND_FLOAT() - 0.5f;
        spC.z = 0.0f;
        mathutil_vec_set_len(&spC, &spC, radius * RAND_FLOAT());
        mathutil_mtxA_tf_vec(&spC, &spC);
        sp18.unk34 = effect->unk34;
        sp18.unk34.x += spC.x;
        sp18.unk34.y += spC.y;
        sp18.unk34.z += spC.z;
        sp18.unk40.x = -2.5f * (effect->unk40.x * (1.0f + RAND_FLOAT()));
        sp18.unk40.y = -2.5f * (effect->unk40.y * (1.0f + RAND_FLOAT()));
        sp18.unk40.z = -2.5f * (effect->unk40.z * (1.0f + RAND_FLOAT()));
        sp18.unk24.x = radius * bgObj->scale.x * (1.0f + RAND_FLOAT());
        sp18.unk4C = rand() & 0x7FFF;
        sp18.unk4E = rand() & 0x7FFF;
        sp18.unk50 = rand() & 0x7FFF;
        sp18.unkC = 60.0 * (1.0 + (2.0 * RAND_FLOAT()));
        spawn_effect(&sp18);
    }
}

void effect_bgwat_bubble_base_draw(struct Effect *effect) {}

void effect_bgwat_bubble_base_destroy(struct Effect *effect) {}

void effect_bgwat_bubble_init(struct Effect *effect)
{
    effect->unkA8 = 0.0f;
    effect->unk24.z = effect->unk24.x;
    effect->unk24.x = 0.0f;
}

void effect_bgwat_bubble_main(struct Effect *effect)
{
    Vec spC;
    float temp_f2;
    float temp_f8;

    effect->unk40.y += 0.012;
    mathutil_mtxA_from_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    spC.x = 0.0f;
    spC.y = 1.0f;
    spC.z = 0.0f;
    mathutil_mtxA_tf_vec(&spC, &spC);
    temp_f2 = -0.15 * mathutil_vec_dot_prod(&spC, &effect->unk40);
    effect->unk40.x += temp_f2 * spC.x;
    effect->unk40.y += temp_f2 * spC.y;
    effect->unk40.z += temp_f2 * spC.z;
    effect->unk40.x *= 0.98;
    effect->unk40.y *= 0.98;
    effect->unk40.z *= 0.98;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    temp_f8 = 1.0 / (0.25 * effect->unk24.x);
    effect->unk4C += 16384.0f * (effect->unk40.x * temp_f8);
    effect->unk4E += 16384.0f * (effect->unk40.y * temp_f8) + (1024.0f * (temp_f8 * (effect->unk40.x + effect->unk40.z)));
    effect->unk50 += 16384.0f * (temp_f8 * (effect->unk40.z + effect->unk40.y));
    if (effect->unkC < 15.0)
    {
        effect->unkA8 *= 0.9;
        effect->unk24.x *= 0.99f;
    }
    else
    {
        effect->unkA8 += 0.25 * (1.0 - effect->unkA8);
        effect->unk24.x += 0.1f * (effect->unk24.z - effect->unk24.x);
    }
}

void effect_bgwat_bubble_draw(struct Effect *effect)
{
    struct GMAModel *model;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_sq_from_identity();
    mathutil_mtxA_rotate_z((s16)((2048.0f * mathutil_sin(effect->unk50)) - 1024.0f));
    mathutil_mtxA_scale_xyz(effect->unk24.x, effect->unk24.x, 1.0f);
    model = effect->model;
    if (test_scaled_sphere_in_frustum(&model->boundSphereCenter, model->boundSphereRadius, effect->unk24.x) != 0)
    {
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        avdisp_set_z_mode(1, GX_LEQUAL, 0);
        avdisp_set_bound_sphere_scale(effect->unk24.x);
        if (effect->unkA8 < 1.0f)
        {
            avdisp_set_alpha(effect->unkA8);
            avdisp_draw_model_unculled_sort_all(model);
        }
        else
            avdisp_draw_model_unculled_sort_translucent(model);
        avdisp_set_z_mode(1, GX_LEQUAL, 1);
    }
}

void effect_bgwat_bubble_destroy(struct Effect *effect) {}

void effect_meteo_init(struct Effect *effect)
{
    effect->unkA = 0;
    effect->unk10 = 0x12C;
    effect->unk88.x = effect->unk24.x * effect->unk24.x;
}

void effect_meteo_main(struct Effect *effect)
{
    float temp_f31 = 9.5f * effect->unk24.x;
    float temp_f1 = ((struct BGSpaceWork *)backgroundInfo.work)->coreScale;
    float temp_f0_2 = mathutil_vec_sq_len(&effect->unk34);
    float temp_f31_2;
    float temp_f30;
    float temp_f4;
    Vec sp24;
    Vec sp18;
    Vec spC;

    switch (effect->unkA)
    {
    case 0:
        effect->unk10 -= 1;
        if (effect->unk10 < 0)
            effect->unkA = 2;
        if (temp_f0_2 < 90000.0f * effect->unk88.x)
            effect->unkA = 1;
        if (effect->unkA8 < 1.0f)
            effect->unkA8 += 0.011111111f;
        break;
    case 1:
        if (temp_f0_2 > 90000.0f * effect->unk88.x)
            effect->unkA = 2;
        if (effect->unkA8 < 1.0f)
            effect->unkA8 += 0.011111111f;
        break;
    case 2:
        if (temp_f0_2 < 90000.0f * effect->unk88.x)
            effect->unkA = 1;
        effect->unkA8 -= 0.011111111f;
        if (effect->unkA8 < 0.0f)
        {
            effect->unkA8 = 0.0f;
            g_poolInfo.effectPool.statusList[effect->unk0] = 3;
        }
        break;
    }
    effect->unk40.x += 0.005f * (effect->unk94.x - effect->unk40.x);
    effect->unk40.y += 0.005f * (effect->unk94.y - effect->unk40.y);
    effect->unk40.z += 0.005f * (effect->unk94.z - effect->unk40.z);
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    effect->unk52 -= effect->unk52 >> 6;
    effect->unk54 -= effect->unk54 >> 6;
    effect->unk56 -= effect->unk56 >> 6;
    effect->unk4C += effect->unkA0 + effect->unk52;
    effect->unk4E += effect->unkA2 + effect->unk54;
    effect->unk50 += effect->unkA4 + effect->unk56;
    if (effect->unk34.y < temp_f31 + 10.0f)
    {
        float temp_f2_2 = 20.0f + temp_f31 + temp_f1;
        if (temp_f0_2 < temp_f2_2 * temp_f2_2)
        {
            sp24 = effect->unk58;
            mathutil_vec_set_len(&sp24, &sp24, temp_f1);
            if (sp24.y > -10.0f)
                sp24.y = -10.0f;
            if (func_8006AAEC(&effect->unk58, &effect->unk34, &sp24, &sp24, temp_f31, 20.0f) != 0U)
            {
                sp18.x = effect->unk34.x - sp24.x;
                sp18.y = effect->unk34.y - sp24.y;
                sp18.z = effect->unk34.z - sp24.z;
                mathutil_vec_normalize_len(&sp18);
                spC = effect->unk40;
                temp_f31_2 = mathutil_vec_dot_prod(&spC, &sp18);
                if (temp_f31_2 < 0.0f)
                {
                    temp_f30 = (4096.0f * temp_f31_2) / effect->unk24.x;
                    effect->unk52 += (int)(temp_f30 * (RAND_FLOAT() - 0.5f));
                    effect->unk54 += (int)(temp_f30 * (RAND_FLOAT() - 0.5f));
                    effect->unk56 += (int)(temp_f30 * (RAND_FLOAT() - 0.5f));
                    temp_f4 = temp_f31_2;
                    temp_f4 *= -2.0f;
                    spC.x += temp_f4 * sp18.x;
                    spC.y += temp_f4 * sp18.y;
                    spC.z += temp_f4 * sp18.z;
                    effect->unk40 = spC;
                }
                effect->unk34.x += effect->unk40.x;
                effect->unk34.y += effect->unk40.y;
                effect->unk34.z += effect->unk40.z;
            }
        }
    }
}

void effect_meteo_draw(struct Effect *effect)
{
    struct GMAModel *temp_r31 = effect->model;

    if ((lbl_801EEC90.unk0 & 4) && func_8000E53C(&effect->unk34) < -(temp_r31->boundSphereRadius * effect->unk24.x))
        return;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_scale_s(effect->unk24.x);
    if (test_scaled_sphere_in_frustum(&temp_r31->boundSphereCenter, temp_r31->boundSphereRadius, effect->unk24.x))
    {
        avdisp_set_bound_sphere_scale(effect->unk24.x);
        if (effect->unkA8 < 1.0f)
        {
            avdisp_set_alpha(effect->unkA8);
            avdisp_draw_model_unculled_sort_all(temp_r31);
        }
        else
        {
            GXLoadPosMtxImm(mathutilData->mtxA, 0);
            GXLoadNrmMtxImm(mathutilData->mtxA, 0);
            avdisp_draw_model_unculled_sort_translucent(temp_r31);
        }
    }
}

void effect_meteo_destroy(struct Effect *effect) {}

void effect_meteo_fix_init(struct Effect *effect) {}

void effect_meteo_fix_main(struct Effect *effect)
{
    effect->unk52 -= effect->unk52 >> 6;
    effect->unk54 -= effect->unk54 >> 6;
    effect->unk56 -= effect->unk56 >> 6;
    effect->unk4C += effect->unkA0 + effect->unk52;
    effect->unk4E += effect->unkA2 + effect->unk54;
    effect->unk50 += effect->unkA4 + effect->unk56;
}

void effect_meteo_fix_draw(struct Effect *effect)
{
    struct GMAModel *temp_r31;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_scale_s(effect->unk24.x);
    temp_r31 = effect->model;
    if (test_scaled_sphere_in_frustum(&temp_r31->boundSphereCenter, temp_r31->boundSphereRadius, effect->unk24.x) != 0)
    {
        avdisp_set_bound_sphere_scale(effect->unk24.x);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        avdisp_draw_model_unculled_sort_translucent(temp_r31);
    }
}

void effect_meteo_fix_destroy(struct Effect *effect) {}

void effect_coliflash_init(struct Effect *effect)
{
    float temp_f1;

    effect->unkC = 12;
    temp_f1 = mathutil_sqrt((float)__fabs(10.0f * effect->unkA8));
    effect->unk24.x = 0.25f * temp_f1;
    effect->unk24.y = temp_f1;
    effect->unk18 = 1.0f;
    effect->unk16 = 1 << effect->unk14;
    switch (backgroundInfo.bgId)
    {
    case BG_TYPE_SUN:
        effect->model = commonGma->modelEntries[circle_white2_half].model;
        break;
    default:
        effect->model = commonGma->modelEntries[circle_white2].model;
        break;
    }
}

void effect_coliflash_main(struct Effect *effect)
{
    mathutil_vec_to_euler_xy(&effect->unk88, &effect->unk4C, &effect->unk4E);
    effect->unk4C += 0x8000;
    effect->unk24.x += 0.1f * (effect->unk24.y - effect->unk24.x);
    if (effect->unkC < 7.5f)
    {
        float temp_f2 = effect->unkC;
        temp_f2 = (temp_f2 - 1.0f) / temp_f2;
        effect->unk18 *= temp_f2;
    }
}

void effect_coliflash_draw(struct Effect *effect)
{
    Vec sp18;
    Vec spC;
    float temp_f31;
    float temp_f28;
    float temp_f30;
    float var_f29;
    float temp_f3;

    mathutil_mtxA_from_mtxB_translate(&effect->unk34);
    mathutil_mtxA_get_translate_alt(&spC);
    temp_f31 = mathutil_vec_len(&spC);
    if (spC.z > -0.1f)
        return;
    var_f29 = effect->unk18;
    if (temp_f31 > 16.0f)
    {
        if (temp_f31 > 24.0f)
            return;
        var_f29 *= 0.125f * (24.0f - temp_f31);
        if (var_f29 < 0.003921569f)
            return;
    }
    mathutil_mtxA_tf_vec(&effect->unk88, &sp18);
    temp_f28 = mathutil_vec_dot_normalized_safe(&sp18, &spC);
    if (temp_f28 > 0.0f)
        return;
    avdisp_set_z_mode(1U, GX_GEQUAL, 0U);
    if (var_f29 != 1.0f)
        avdisp_set_post_mult_color(var_f29, var_f29, var_f29, 1.0f);
    temp_f30 = 2.0f * effect->unk24.x;
    temp_f3 = (temp_f31 + temp_f30) / temp_f31;
    sp18.x = spC.x * temp_f3;
    sp18.y = spC.y * temp_f3;
    sp18.z = spC.z * temp_f3;
    temp_f30 = temp_f30 * temp_f3;
    mathutil_mtxA_set_translate(&sp18);
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_scale_s(temp_f30);
    avdisp_set_bound_sphere_scale(temp_f30);
    avdisp_draw_model_culled_sort_all(effect->model);
    temp_f30 *= 0.6f;
    mathutil_mtxA_sq_from_identity();
    mathutil_mtxA_scale_s(temp_f30);
    if (temp_f28 > -0.2f)
    {
        var_f29 *= -5.0f * temp_f28;
        avdisp_set_post_mult_color(var_f29, var_f29, var_f29, 1.0f);
    }
    avdisp_set_bound_sphere_scale(temp_f30);
    avdisp_draw_model_culled_sort_all(effect->model);
    avdisp_set_z_mode(1, GX_LEQUAL, 1);
    if (var_f29 != 1.0f)
        u_reset_post_mult_color();

    !temp_f30;  // needed to match
}

void effect_coliflash_destroy(struct Effect *effect) {}

void effect_bns_stg_star_init(struct Effect *effect)
{
    effect->unkC = 60.0 * (0.75 + (0.5 * RAND_FLOAT()));
    effect->unk16 = 1 << effect->unk14;
    effect->unkA8 = 1.0f;
}

void effect_bns_stg_star_main(struct Effect *effect)
{
    Vec rnd;
    struct Effect spC;

    effect->unk40.y += -0.016;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    effect->unk50 = effect->unk50 + 0x400;
    if (effect->unkA8 > 0.5 && (u32)effect->unkC % 2 == 0)
    {
        memset(&spC, 0, sizeof(spC));
        spC.type = ET_BNS_STG_STAR_TAIL;
        spC.unk34 = effect->unk34;
        spC.unk14 = effect->unk14;
        rnd.x = 2.0 * (RAND_FLOAT() - 0.5);
        rnd.y = 2.0 * (RAND_FLOAT() - 0.5);
        rnd.z = 2.0 * (RAND_FLOAT() - 0.5);
        spC.unk40.x = (0.25 * effect->unk40.x) + rnd.x;
        spC.unk40.y = (0.25 * effect->unk40.y) + rnd.y;
        spC.unk40.z = (0.25 * effect->unk40.z) + rnd.z;
        spC.unk24.x = effect->unkA8 * (0.25 + (0.25 * RAND_FLOAT()));
        spawn_effect(&spC);
    }
    if (effect->unkC < 15.0)
        effect->unkA8 = (float)effect->unkC / 15.0;
}

void effect_bns_stg_star_draw(struct Effect *effect)
{
    Vec spC;
    float temp_f1;
    float temp_f1_2;
    float scale;
    struct BGBonusWork *bgWork = backgroundInfo.work;
    struct GMAModel *shotstarModel = bgWork->shotstarModel;
    struct GMAModel *starlightModel = bgWork->starlightModel;

    if ((lbl_801EEC90.unk0 & 4) && func_8000E53C(&effect->unk34) < -shotstarModel->boundSphereRadius)
        return;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_get_translate_alt(&spC);
    if (spC.z > -0.1f)
        return;
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    avdisp_set_alpha(effect->unkA8);
    avdisp_draw_model_culled_sort_all(shotstarModel);
    if (spC.z < -30.0f)
    {
        temp_f1 = (26.0 + spC.z) / spC.z;
        spC.x *= temp_f1;
        spC.y *= temp_f1;
        spC.z *= temp_f1;
        mathutil_mtxA_from_translate(&spC);
        scale = 0.5 + (0.5 * effect->unkA8);
        mathutil_mtxA_scale_xyz(scale, scale, scale);
        avdisp_set_bound_sphere_scale(scale);
        temp_f1_2 = 0.75f * effect->unkA8;
        avdisp_set_post_mult_color(temp_f1_2, temp_f1_2, temp_f1_2, 1.0f);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        avdisp_draw_model_unculled_sort_translucent(starlightModel);
        u_reset_post_mult_color();
    }
}

void effect_bns_stg_star_destroy(struct Effect *effect) {}

void effect_bns_stg_star_tail_init(struct Effect *effect)
{
    effect->unkC = 60.0 * (0.5 + (0.25 * RAND_FLOAT()));
    effect->unk16 = 1 << effect->unk14;
    effect->unkA8 = 1.0f;
}

void effect_bns_stg_star_tail_main(struct Effect *effect)
{
    effect->unk40.x *= 0.99f;
    effect->unk40.y *= 0.99f;
    effect->unk40.z *= 0.99f;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    if (effect->unkC < 15.0)
        effect->unkA8 = (float)effect->unkC / 15.0;
}

void effect_bns_stg_star_tail_draw(struct Effect *effect)
{
    Vec spC;
    struct NlModel *model = g_commonNlObj->models[NLMODEL_common_CROSS_LIGHT];
    float scale = 52.68 * (effect->unk24.x * effect->unkA8);

    if ((lbl_801EEC90.unk0 & 4) && func_8000E53C(&model->boundSphereCenter) < -(model->boundSphereRadius * scale))
        return;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_sq_from_identity();
    mathutil_mtxA_scale_xyz(scale, scale, scale);
    nl2ngc_set_scale(scale);
    mathutil_mtxA_get_translate_alt(&spC);
    mathutil_mtxA_rotate_z((s16)((325.0 * spC.x) + (655.0 * spC.y)));
    nl2ngc_draw_model_sort_translucent(model);
}

void effect_bns_stg_star_tail_destroy(struct Effect *effect) {}

void effect_bgmst_gen_cloud_init(struct Effect *effect)
{
    effect->unkC = 120.0f * (1.0f + (0.5f * RAND_FLOAT()));
    effect->unkA8 = 0.0f;
    effect->unkA = 0;
}

void effect_bgmst_gen_cloud_main(struct Effect *effect)
{
    float temp_f31 = 0.5f * (effect->model->boundSphereRadius * effect->unk24.x);
    float var_f2;

    switch (effect->unkA)
    {
    case 0:
        if (mathutil_unk(effect->unk64.x, effect->unk64.z, effect->unk34.x, effect->unk34.z) > effect->unk88.x + temp_f31)
            effect->unkA = 1;
        effect->unk40.x *= 0.996f;
        effect->unk40.y *= 0.996f;
        effect->unk40.z *= 0.996f;
        break;
    case 1:
        effect->unk24.x *= 1.005;
        effect->unk40.x *= 0.98f;
        effect->unk40.y *= 0.99f;
        effect->unk40.z *= 0.98f;
        break;
    }
    effect->unk40.y += -0.08f;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    if (effect->unkA == 0)
    {
        if (effect->unk34.y < effect->unk64.y)
        {
            effect->unk34.y = effect->unk64.y;
            if (effect->unk40.y < 0.0f)
                effect->unk40.y *= -0.5f;
        }
    }
    var_f2 = (384.0f + (768.0f * mathutil_vec_len(&effect->unk40))) / temp_f31;
    if (effect->unk0 & 1)
        var_f2 *= -1.0f;
    effect->unk56 += 0.1f * (var_f2 - effect->unk56);
    effect->unk50 += effect->unk56;
    if (effect->unkC < 30.0f)
    {
        effect->unkA8 = effect->unkC / 30.0f;
        effect->unk24.x *= 1.03f;
    }
    else
        effect->unkA8 += 0.15f * (1.0f - effect->unkA8);
}

void effect_bgmst_gen_cloud_draw(struct Effect *effect)
{
    struct GMAModel *model;
    float scale;

    if (lbl_801EEC90.unk0 & 4)
        return;
    if (effect->unkA8 <= 0.0f)
        return;

    model = effect->model;
    scale = effect->unk24.x;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_sq_from_identity();
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_scale_s(scale);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    avdisp_set_z_mode(1, GX_LEQUAL, 0);
    avdisp_set_bound_sphere_scale(scale);
    if (effect->unkA8 < 1.0f)
    {
        avdisp_set_alpha(effect->unkA8);
        avdisp_draw_model_culled_sort_all(model);
    }
    else
        avdisp_draw_model_culled_sort_translucent(model);
    avdisp_set_z_mode(1, GX_LEQUAL, 1);
}

void effect_bgmst_gen_cloud_destroy(struct Effect *effect) {}

void effect_bgstm_rainripple_init(struct Effect *effect)
{
    float temp_f3;
    float temp_f5;

    effect->unkC = 15.0f + (30.0f * RAND_FLOAT());
    effect->unkA8 = 1.0f;
    effect->unk24.x = 0.0f;
    effect->unk24.y = 0.016666668f * (1.0f + RAND_FLOAT());
    effect->unk40.x = effect->unk7C.x;
    effect->unk40.y = effect->unk7C.y;
    effect->unk40.z = effect->unk7C.z;
    temp_f5 = -(-0.008 * effect->unk70.y);
    effect->unk94.x = temp_f5 * effect->unk70.x;
    effect->unk94.y = temp_f5 * effect->unk70.y + -0.008;
    effect->unk94.z = temp_f5 * effect->unk70.z;
    temp_f5 = effect->unk70.x * effect->unk7C.x + effect->unk70.y * effect->unk7C.y + effect->unk70.z * effect->unk7C.z;
    temp_f5 = __fabs(temp_f5);
    temp_f3 = 1.0f - (5.0f * temp_f5);
    effect->unkC *= temp_f3;
    temp_f3 = 1.0f / (1.0f + (3.0f * mathutil_vec_len(&effect->unk7C)));
    effect->unkC *= temp_f3;
    effect->unk24.y *= temp_f3;
    if (effect->unkC < 6.0f)
        effect->unkC = 6;
}

void effect_bgstm_rainripple_main(struct Effect *effect)
{
    effect->unk40.x += effect->unk94.x;
    effect->unk40.y += effect->unk94.y;
    effect->unk40.z += effect->unk94.z;
    effect->unk40.x += 0.1f * (effect->unk7C.x - effect->unk40.x);
    effect->unk40.y += 0.1f * (effect->unk7C.y - effect->unk40.y);
    effect->unk40.z += 0.1f * (effect->unk7C.z - effect->unk40.z);
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    effect->unk24.y *= 0.96f;
    effect->unk24.x += effect->unk24.y;
    if (effect->unkC < 15)
        effect->unkA8 *= (float)effect->unkC / (float)(effect->unkC + 1);
}

void effect_bgstm_rainripple_draw(struct Effect *effect)
{
    Vec spC;
    float var_f31;
    float temp_f30;

    if (!(lbl_801EEC90.unk0 & 4))
    {
        mathutil_mtxA_from_mtxB_translate(&effect->unk34);
        mathutil_mtxA_get_translate_alt(&spC);
        var_f31 = 0.5 * (6.0f + spC.z);
        if (var_f31 < 0.0f)
            return;
        if (var_f31 > 1.0f)
            var_f31 = 1.0f;
        var_f31 *= effect->unkA8;
        temp_f30 = (0.1f + spC.z) / spC.z;
        spC.x *= temp_f30;
        spC.y *= temp_f30;
        spC.z *= temp_f30;
        mathutil_mtxA_set_translate(&spC);
        mathutil_mtxA_rotate_y(effect->unk4E);
        mathutil_mtxA_rotate_x(effect->unk4C);
        mathutil_mtxA_rotate_z(effect->unk50);
        mathutil_mtxA_rotate_x(-0x4000);
        mathutil_mtxA_scale_s(effect->unk24.x * temp_f30);
        avdisp_set_bound_sphere_scale(effect->unk24.x * temp_f30);
        avdisp_set_z_mode(1, GX_LEQUAL, 0);
        avdisp_set_alpha(var_f31);
        avdisp_draw_model_culled_sort_translucent(effect->model);
        avdisp_set_z_mode(1, GX_LEQUAL, 1);
    }
}

void effect_bgstm_rainripple_destroy(struct Effect *effect) {}

void effect_bgmst_water_init(struct Effect *effect) {}

void effect_bgmst_water_main(struct Effect *effect) {}

void effect_bgmst_water_draw(struct Effect *effect)
{
    struct StageBgObject *bgObj = (struct StageBgObject *)effect->model;
    struct BGMasterWork *bgWork = backgroundInfo.work;
    BallEnvFunc func;
    u32 var_r3;

    if (lbl_801EEC90.unk0 & 1)
        var_r3 = 1 << 4;
    else if (modeCtrl.gameType == 1)
        var_r3 = 1 << (modeCtrl.unk30 - 1);
    else
        var_r3 = 1 << 0;
    if (bgObj->flags & var_r3)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        mathutil_mtxA_translate(&bgObj->pos);
        mathutil_mtxA_rotate_z(bgObj->rotZ);
        mathutil_mtxA_rotate_y(bgObj->rotY);
        mathutil_mtxA_rotate_x(bgObj->rotX);
        mathutil_mtxA_scale(&bgObj->scale);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        mathutil_mtxA_to_mtx(bgWork->unkB60);
        mathutil_mtxA_translate_xyz(0.0f, -20.0f, 0.0f);
        mathutil_mtxA_scale_xyz(1.0f, 0.0f, 1.0f);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        func = u_avdisp_set_some_func_1(bgWork->unkB14);
        avdisp_draw_model_culled_sort_none(bgWork->unkB0C);
        u_avdisp_set_some_func_1(func);
    }
}

void effect_bgmst_water_destroy(struct Effect *effect) {}

void effect_commendfrag_init(struct Effect *effect)
{
    if (effect->unkC == 0)
        effect->unkC = 210.0 + (60.0f * RAND_FLOAT());
    if (effect->model == NULL)
    {
        u16 modelIndex = s_paperPieceModels[(u32)(rand() & 0x7FFF) % ARRAY_COUNT(s_paperPieceModels)];
        effect->model = commonGma->modelEntries[modelIndex].model;
    }
    effect->unkA = 0;
    if (effect->unk24.x == 0.0f)
        effect->unk24.x = 0.2 + (0.3 * RAND_FLOAT());
}

void effect_commendfrag_main(struct Effect *effect)
{
    Vec sp58;
    struct Struct8009DBB0 sp3C;
    Vec sp30;
    Vec sp24;
    Vec sp18;
    Vec spC;
    float temp_f2;
    float temp_f3;
    float temp_f4;
    float temp_f2_3;
    s16 temp_r29;
    s16 temp_r31;

    effect->unk40.y += -0.004;
    mathutil_mtxA_from_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    sp58.x = 0.0f;
    sp58.y = 1.0f;
    sp58.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp58, &sp58);
    temp_f2 = -0.7 * mathutil_vec_dot_prod(&sp58, &effect->unk40);
    effect->unk40.x += sp58.x * temp_f2;
    effect->unk40.y += sp58.y * temp_f2;
    effect->unk40.z += sp58.z * temp_f2;
    effect->unk40.x *= 0.95;
    effect->unk40.y *= 0.95;
    effect->unk40.z *= 0.95;
    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    temp_f2 = 2560.0f / effect->unk24.x;
    effect->unk52 += (int)(temp_f2 * (effect->unk40.x + effect->unk40.y));
    effect->unk54 += (int)(temp_f2 * (effect->unk40.y + effect->unk40.z));
    effect->unk56 += (int)(temp_f2 * (effect->unk40.z + effect->unk40.x));
    effect->unk52 -= effect->unk52 >> 5;
    effect->unk54 -= effect->unk54 >> 5;
    effect->unk56 -= effect->unk56 >> 5;
    effect->unk4C += effect->unk52;
    effect->unk4E += effect->unk54;
    effect->unk50 += effect->unk56;

    if (!(effect->unkC & 0xF))
    {
        effect->unkA = 0;
        if (func_8009DBB0(&effect->unk34, &sp3C, &effect->unk7C) != 0
         && sp3C.unk4.y > effect->unk34.y - 1.0)
        {
            effect->unkA = 1;
            effect->unk64.x = sp3C.unk4.x;
            effect->unk64.y = sp3C.unk4.y;
            effect->unk64.z = sp3C.unk4.z;
            effect->unk70.x = sp3C.unk10.x;
            effect->unk70.y = sp3C.unk10.y;
            effect->unk70.z = sp3C.unk10.z;
        }
    }

    switch (effect->unkA)
    {
    case 0:
        return;
    }

    sp24 = effect->unk70;
    sp30.x = 0.0f;
    sp30.y = 1.0f;
    sp30.z = 0.0f;
    mathutil_mtxA_from_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    mathutil_mtxA_tf_vec(&sp30, &sp30);

    temp_f3 = (sp30.x * sp24.x) + (sp30.y * sp24.y) + (sp30.z * sp24.z);
    temp_f2_3 = (1.1920929e-7f * effect->unk0) + (0.1 * (1.0 - __fabs(temp_f3)));
    sp18.x = effect->unk34.x - effect->unk64.x;
    sp18.y = effect->unk34.y - effect->unk64.y;
    sp18.z = effect->unk34.z - effect->unk64.z;
    temp_f4 = (sp24.x * sp18.x) + (sp24.y * sp18.y) + (sp24.z * sp18.z);
    if (temp_f4 < temp_f2_3 + 0.01)
    {
        temp_f2 = temp_f2_3 + 0.01 - temp_f4;
        effect->unk34.x += temp_f2 * sp24.x;
        effect->unk34.y += temp_f2 * sp24.y;
        effect->unk34.z += temp_f2 * sp24.z;

        temp_f2 = (effect->unk40.x * sp24.x) + (effect->unk40.y * sp24.y) + (effect->unk40.z * sp24.z);
        if (temp_f2 < 0.0)
        {
            temp_f2 = -temp_f2;
            effect->unk40.x += temp_f2 * sp24.x;
            effect->unk40.y += temp_f2 * sp24.y;
            effect->unk40.z += temp_f2 * sp24.z;
            temp_f4 = __fabs(temp_f3) * (1.0 / 8.0);
            effect->unk40.x += (temp_f4 * (effect->unk7C.x - effect->unk40.x));
            effect->unk40.y += (temp_f4 * (effect->unk7C.y - effect->unk40.y));
            effect->unk40.z += (temp_f4 * (effect->unk7C.z - effect->unk40.z));
            temp_f2 = temp_f2 / 2.0;
            effect->unk40.x += temp_f2 * sp24.x;
            effect->unk40.y += temp_f2 * sp24.y;
            effect->unk40.z += temp_f2 * sp24.z;
        }
        spC = sp24;
        if (temp_f3 < 0.0)
        {
            spC.x = -spC.x;
            spC.y = -spC.y;
            spC.z = -spC.z;
        }
        sp30.x = (0.05 * spC.x) + (0.95 * sp30.x);
        sp30.y = (0.05 * spC.y) + (0.95 * sp30.y);
        sp30.z = (0.05 * spC.z) + (0.95 * sp30.z);
        mathutil_vec_normalize_len(&sp30);
        temp_r29 = effect->unk4C;
        temp_r31 = effect->unk50;
        mathutil_mtxA_from_rotate_y(-effect->unk4E);
        mathutil_mtxA_rotate_x(0);
        mathutil_mtxA_tf_vec(&sp30, &sp30);
        effect->unk4C = mathutil_atan2(sp30.z, sp30.y);
        effect->unk50 = -mathutil_atan2(sp30.x, mathutil_sqrt(mathutil_sum_of_sq_2(sp30.z, sp30.y)));
        effect->unk52 >>= 2;
        effect->unk52 += (effect->unk4C - temp_r29) >> 2;
        effect->unk54 -= effect->unk54 >> 4;
        effect->unk56 >>= 2;
        effect->unk56 += (effect->unk50 - temp_r31) >> 2;
    }
}

void effect_commendfrag_draw(struct Effect *effect)
{
    Mtx sp10;
    float temp_f30;
    float var_f31;
    float new_var;

    if (lbl_801EEC90.unk0 & 4)
    {
        temp_f30 = 0.1 * effect->unk24.x;
        var_f31 = temp_f30 + func_8000E4D0(&effect->unk34);
        if (var_f31 <= 0.0f)
            return;
        if (var_f31 > temp_f30)
            var_f31 = 1.0f;
        else
            var_f31 *= (1.0f / temp_f30);
    }
    else
        var_f31 = 1.0f;

    mathutil_mtxA_from_mtxB();
    func_8009DB6C(sp10);
    mathutil_mtxA_mult_right(sp10);
    mathutil_mtxA_translate(&effect->unk34);
    mathutil_mtxA_rotate_y(effect->unk4E);
    mathutil_mtxA_rotate_x(effect->unk4C);
    mathutil_mtxA_rotate_z(effect->unk50);
    new_var = (120.0f * currentCameraStructPtr->sub28.vp.height) * (0.11f * effect->unk24.x) * currentCameraStructPtr->sub28.unk3C;
    var_f31 *= 2.0f * (new_var + mathutilData->mtxA[2][3]);
    if (var_f31 < 0.0)
        return;
    if (var_f31 > 1.0)
        var_f31 = 1.0f;
    mathutil_mtxA_scale_s(effect->unk24.x);
    avdisp_set_bound_sphere_scale(effect->unk24.x);
    if (effect->unkC < 12)
        var_f31 *= 0.083333336f * effect->unkC;
    if (var_f31 < 1.0)
    {
        avdisp_set_alpha(var_f31);
        avdisp_draw_model_culled_sort_all(effect->model);
    }
    else
    {
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        avdisp_draw_model_culled_sort_translucent(effect->model);
    }
}

void effect_commendfrag_destroy(struct Effect *effect) {}

void effect_banana_drop_init(struct Effect *effect)
{
    effect->unk4 |= 2;
    effect->unkC = 80;
    effect->unk16 = 1 << effect->unk14;
    effect->unk34.x = 0.0f;
    effect->unk34.y = -0.2f;
    effect->unk34.z = 0.0f;
    effect->unk40.x = 0.0f;
    effect->unk40.y = 0.15f;
    effect->unk40.z = -0.05f;
    effect->unk4C = 0;
    effect->unk4E = 0;
    effect->unk50 = 0;
    effect->unk52 = 0;
    effect->unk54 = 0;
    effect->unk56 = 0;
    effect->unkA = 0;
}

void effect_banana_drop_main(struct Effect *effect)
{
    Vec spC;

    effect->unk34.x += effect->unk40.x;
    effect->unk34.y += effect->unk40.y;
    effect->unk34.z += effect->unk40.z;
    effect->unk40.y -= 0.0098;
    mathutil_mtxA_from_translate((Vec *)effect->model);
    mathutil_mtxA_rotate_y(effect->unkA2 + (effect->unk10 * 0x1999));
    mathutil_mtxA_tf_point(&effect->unk34, &spC);
    if (spC.x < -10.0 || spC.x > 10.0)
        effect->unkA |= 2;
    if (!(effect->unkA & 1) && (effect->unk34.y < -0.25))
    {
        if (effect->unkA & 2)
            effect->unkA |= 1;
        else
        {
            effect->unk34.y = -0.25f;
            effect->unk40.y *= -0.6;
            effect->unk52 = (s16)(int)((rand() >> 4) & 0x7FF);
            effect->unk54 = (s16)(int)((rand() >> 5) & 0x3FF);
            effect->unk56 = (s16)(int)((rand() >> 5) & 0x3FF);
        }
    }
    effect->unk4C += effect->unk52;
    effect->unk4E += effect->unk54;
    effect->unk50 += effect->unk56;
}

void effect_banana_drop_draw(struct Effect *effect)
{
    if (effect->unkC >= 30 || !(unpausedFrameCounter & 2))
    {
        mathutil_mtxA_from_mtxB_translate((Vec *)effect->model);
        mathutil_mtxA_rotate_y(effect->unkA2 + (effect->unk10 * 0x1999));
        mathutil_mtxA_translate(&effect->unk34);
        mathutil_mtxA_sq_from_identity();
        mathutil_mtxA_rotate_y(effect->unk4E);
        mathutil_mtxA_rotate_x(effect->unk4C);
        mathutil_mtxA_rotate_z(effect->unk50);
        mathutil_mtxA_scale_s(0.65f);
        u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
        avdisp_draw_model_culled_sort_translucent(commonGma->modelEntries[0x23].model);
        if (!(effect->unkA & 3))
        {
            avdisp_set_z_mode(1, GX_LEQUAL, 0);
            avdisp_set_post_mult_color(0.3f, 0.3f, 0.3f, 0.3f);
            mathutil_mtxA_from_mtxB_translate((Vec *)effect->model);
            mathutil_mtxA_rotate_y(effect->unkA2 + (effect->unk10 * 0x1999));
            mathutil_mtxA_translate_xyz(effect->unk34.x, -0.45f, effect->unk34.z);
            mathutil_mtxA_rotate_x(0x4000);
            mathutil_mtxA_scale_s(0.25f);
            u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
            avdisp_draw_model_culled_sort_none(commonGma->modelEntries[0x4E].model);
            avdisp_set_post_mult_color(1.0f, 1.0f, 1.0f, 1.0f);
            avdisp_set_z_mode(1, GX_LEQUAL, 1);
        }
    }
}

void effect_banana_drop_destroy(struct Effect *effect) {}

void effect_bgend_water_init(struct Effect *effect) {}

void effect_bgend_water_main(struct Effect *effect) {}

void effect_bgend_water_draw(struct Effect *effect)
{
    struct StageBgObject *bgObj = (struct StageBgObject *)effect->model;
    struct BGEndWork *bgWork = backgroundInfo.work;
    BallEnvFunc func;
    u32 var_r3;

    if (lbl_801EEC90.unk0 & 1)
        var_r3 = 1 << 4;
    else if (modeCtrl.gameType == 1)
        var_r3 = 1 << (modeCtrl.unk30 - 1);
    else
        var_r3 = 1 << 0;
    if (bgObj->flags & var_r3)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        mathutil_mtxA_translate(&bgObj->pos);
        mathutil_mtxA_rotate_z(bgObj->rotZ);
        mathutil_mtxA_rotate_y(bgObj->rotY);
        mathutil_mtxA_rotate_x(bgObj->rotX);
        mathutil_mtxA_scale(&bgObj->scale);
        func = u_avdisp_set_some_func_1(bgWork->unk18);
        mathutil_mtxA_push();
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);
        mathutil_mtxA_to_mtx(bgWork->unk64);
        mathutil_mtxA_translate_xyz(0.0f, -20.0f, 0.0f);
        mathutil_mtxA_scale_xyz(1.0f, 0.0f, 1.0f);
        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        avdisp_draw_model_culled_sort_none(bgWork->waterModel);
        mathutil_mtxA_pop();
        u_avdisp_set_some_func_1(func);
    }
}

void effect_bgend_water_destroy(struct Effect *effect) {}
