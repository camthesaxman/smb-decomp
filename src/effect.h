#ifndef _SRC_EFFECT_H_
#define _SRC_EFFECT_H_

enum
{
    ET_PAPERFRAG,  // 0
    ET_GET_BANANA,
    ET_COLI_PARTICLE,
    ET_BIRD_KITE,
    ET_ROTATE_BG,
    ET_ICEWATER_REFLECT,
    ET_ICEWATER_PARTICLE,
    ET_RAINDROP,
    ET_HOLDING_BANANA,
    ET_BUBBLE,
    ET_LEVITATE,
    ET_TWINKLE_STAR,
    ET_BONUS_STG_STAR,
    ET_BONUS_STG_STAR_TAIL,
    ET_WATER_LIGHT,
    ET_RAINDROP_RIPPLE,
    ET_BALL_GLOW,  // 0x10
    ET_EXM_GUIDE_LIGHT,
    ET_EXM_GUIDE_LIGHT_TAIL,
    ET_COLISTAR_PARTICLE,
    ET_BGWAT_BUBBLE_BASE,
    ET_BGWAT_BUBBLE,
    ET_METEO,
    ET_METEO_FIX,
    ET_FIGHT_REVIVAL,
    ET_FIGHT_PANNEL,
    ET_FIGHT_GET_BANANA,
    ET_COLIFLASH,
    ET_FIGHT_BOX_FRAG,
    ET_FIGHT_HOLDING_PITEM,
    ET_FIGHT_BALL_EFC,
    ET_FIGHT_REVIVAL_PTC,
    ET_BNS_STG_STAR,  // 0x20
    ET_BNS_STG_STAR_TAIL,
    ET_BGMST_GEN_CLOUD,
    ET_BGSTM_RAINRIPPLE,
    ET_NAMEENT_CODE,
    ET_GET_NAMEENT_CODE,
    ET_MR_BOMB,
    ET_PILOT_BOMB,
    ET_BGMST_WATER,
    ET_MR_BOMB_LIGHT,
    ET_FIGHT_COLIFLASH,
    ET_FIGHT_COLIFLASH_PTC,
    ET_MR_SPEED_STAR_LIGHT,
    ET_COMMENDFRAG,
    ET_ENDING_BALLFRAG,
    ET_BANANA_DROP,
    ET_BGEND_WATER,  // 0x30
};

struct Effect
{
    s16 unk0;
    s16 unk2;
    u32 unk4;
    s16 type;
    s16 unkA;
    s32 unkC;
    s32 unk10;
    s16 unk14;
    u16 unk16;
    float unk18;
    float unk1C;
    float unk20;
    Vec unk24;
    struct GMAModel *model;
    Vec unk34;
    Vec unk40;
    s16 unk4C;
    s16 unk4E;
    s16 unk50;
    s16 unk52;
    s16 unk54;
    s16 unk56;
    Vec unk58;
    Vec unk64;
    Vec unk70;
    Vec unk7C;
    Vec unk88;
    Vec unk94;
    s16 unkA0;
    s16 unkA2;
    s16 unkA4;
    float unkA8;
};

void u_give_points(int, int);
void ev_effect_init(void);
void ev_effect_main(void);
void ev_effect_dest(void);
void effect_draw(void);
int spawn_effect(struct Effect *);

#endif
