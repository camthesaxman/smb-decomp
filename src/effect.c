#include <dolphin.h>
#include <stdlib.h>
#include <string.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "effect.h"
#include "gma.h"
#include "gxutil.h"
#include "hud.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "pool.h"
#include "stage.h"
#include "stcoli.h"
#include "world.h"

#include "../data/common.gma.h"

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

extern s16 lbl_802F1F90;

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
    mathutil_mtxA_rotate_x((s32) effect->unk4C);
    mathutil_mtxA_rotate_z((s32) effect->unk50);
    mathutil_mtxA_tf_vec(&sp30, &sp30);

    temp_f3 = (sp30.x * sp24.x) + (sp30.y * sp24.y) + (sp30.z * sp24.z);
    temp_f2_3 = (1.1920929e-7f * effect->unk0) + (0.1 * (1.0 - __fabs(temp_f3)));
    sp18.x = effect->unk34.x - effect->unk64.x;
    sp18.y = effect->unk34.y - effect->unk64.y;
    sp18.z = effect->unk34.z - effect->unk64.z;
    temp_f4 = (sp24.x * sp18.x) + (sp24.y * sp18.y) + (sp24.z * sp18.z);
    if (temp_f4 < (temp_f2_3 + 0.05))
    {
        temp_f2 = temp_f2_3 + 0.05 - temp_f4;
        effect->unk34.x += temp_f2 * sp24.x;
        effect->unk34.y += temp_f2 * sp24.y;
        effect->unk34.z += temp_f2 * sp24.z;
        temp_f2 = ((effect->unk40.x * sp24.x) + (effect->unk40.y * sp24.y)) + (effect->unk40.z * sp24.z);
        if (temp_f2 < 0.0)
        {
            temp_f2 = -temp_f2;
            effect->unk40.x += temp_f2 * sp24.x;
            effect->unk40.y += temp_f2 * sp24.y;
            effect->unk40.z += temp_f2 * sp24.z;
            temp_f4 = __fabs(temp_f3) * (1.0 / 8.0);
            effect->unk40.x = effect->unk40.x;
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
    if (effect->unkC < 0xC)
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
    f32 temp_f31;
    f32 temp_f30;
    Vec *new_var;
    f32 temp_f1;
    f32 var_f1;
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
        avdisp_draw_model_unculled_sort_translucent(commonGma->modelEntries[0x5A].model);
        avdisp_set_z_mode(1, GX_LEQUAL, 1);
        u_reset_post_mult_color();
    }
}
