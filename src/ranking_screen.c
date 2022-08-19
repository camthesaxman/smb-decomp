#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "gxcache.h"
#include "gxutil.h"
#include "mathutil.h"
#include "mode.h"
#include "ranking_screen.h"
#include "recplay.h"
#include "sprite.h"

static void ranking_screen_sprite_main(s8 *, struct Sprite *);
static void ranking_screen_sprite_draw(struct Sprite *);
static void rnk_title_sprite_main(s8 *, struct Sprite *);
static void lbl_80089070(s8 *, struct Sprite *);
static void lbl_800890B4(struct Sprite *);
static void func_800890D4(void);
static void func_8008923C(void);

struct RankingEntry
{
    float x;
    float unk4;
    s32 unk8;
    struct ScoreRecord *unkC;
    struct ScoreRecord *unk10;
};

static struct Color3f lbl_801C7948[] =
{
    {   0, 171,  40 },
    {   0,  86, 228 },
    { 255, 163,  36 },
    { 228,  13,  14 },
};

static struct Color3f lbl_801C7948_2[] =
{
    { 179, 230, 191 },
    { 179, 205, 247 },
    { 255, 228, 190 },
    { 247, 183, 183 },
};

struct Struct802B37F0_sub3
{
    s8 unk0;
    s16 unk2;
};

static struct Struct802B37F0_sub3 lbl_801C7948_3[] =
{
    { 0x30, 0x00EE },
    { 0x31, 0x00F6 },
    { 0x32, 0x00CC },
    { 0x33, 0x00D1 },
};

static s16 s_rankingBallBmpIds[] =
{
    BMP_RNK_rnk_ball_r,
    BMP_RNK_rnk_ball_a,
    BMP_RNK_rnk_ball_n,
    BMP_RNK_rnk_ball_k,
    BMP_RNK_rnk_ball_i,
    BMP_RNK_rnk_ball_n,
    BMP_RNK_rnk_ball_g,
};

struct Struct801C79C8
{
    float unk0;
    float unk4;
    float unused;
};

static struct Struct801C79C8 lbl_801C79C8[] =
{
    { 150, 64, 0 },
    { 207, 76, 0 },
    { 263, 64, 0 },
    { 319, 78, 0 },
    { 376, 64, 0 },
    { 433, 76, 0 },
    { 490, 64, 0 },
};

struct RankingLetterBall
{
    s16 bmpId;
    s16 rotation;
    s16 unk4;
    u8 filler6[2];
    float x;
    float unkC;
    float unk10;
    float unk14;
};

static struct
{
    s32 unk0;
    u32 unk4;
    s32 unk8;
    float unkC;
    float unk10;
    float unk14;
    u32 unk18;
    s32 unk1C;
    struct RankingLetterBall letterBalls[7];
    struct RankingEntry rankingEntries[5];
    s32 unk12C;
    s32 unk130;
    struct Color3f unk134;
    struct Color3f unk140;
    struct Color3f unk14C;
    struct Color3f unk158;
    struct Struct802B37F0_sub3 unk164;
    void *unk168;
} lbl_802B37F0;

// Draws the horizontal bars that appear at the top and bottom of the ranking screen
static void draw_title_bar(int x1, int y1, int x2, int y2, struct Color3f *arg4, int unused, float arg8)
{
    float r1, g1, b1;
    float r2, g2, b2;
    float r3, g3, b3;
    GXColor color1;
    GXColor color2;
    float z;

    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_CLR0));

    r1 = arg4->r;
    r2 = r1;
    if (r1 > 255.0f)
        r2 = 255.0f;

    g1 = arg4->g;
    g2 = g1;
    if (g1 > 255.0f)
        g2 = 255.0f;

    b1 = arg4->b;
    b2 = b1;
    if (b1 > 255.0f)
        b2 = 255.0f;

    color1.r = r2;
    color1.g = g2;
    color1.b = b2;

    r3 = r1 * 0.8;
    if (r3 > 255.0f)
        r3 = 255.0f;
    g3 = g1 * 0.7;
    if (g3 > 255.0f)
        g3 = 255.0f;
    b3 = b1 * 0.6;
    if (b3 > 255.0f)
        b3 = 255.0f;

    color2.r = r3;
    color2.g = g3;
    color2.b = b3;

    GXSetBlendMode_cached(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    {
        GXColor fogColor = {0};
        GXSetFog_cached(GX_FOG_NONE, 0.0f, 100.0f, 0.1f, 20000.0f, fogColor);
    }
    GXSetChanCtrl(GX_COLOR0A0, 0U, GX_SRC_VTX, GX_SRC_VTX, 0U, GX_DF_CLAMP, GX_AF_SPOT);
    GXSetCullMode_cached(GX_CULL_NONE);
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE0, GX_TEV_KASEL_1);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_RASC);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetNumTevStages_cached(1);
    GXSetNumChans(1);
    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    mathutil_mtxA_pop();
    z = -arg8;

    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3f32(x2, y1, z);
        GXColor4u8(color2.r, color2.g, color2.b, 255);
        GXPosition3f32(x1, y1, z);
        GXColor4u8(color1.r, color1.g, color1.b, 255);
        GXPosition3f32(x1, y2, z);
        GXColor4u8(color1.r, color1.g, color1.b, 255);
        GXPosition3f32(x2, y2, z);
        GXColor4u8(color2.r, color2.g, color2.b, 255);
    GXEnd();
}

static void update_ranking_screen(void)
{
    int i;
    struct RankingEntry *entry;
    struct RankingLetterBall *letterBall;

    if (!(gamePauseStatus & 0xA))
    {
        switch (lbl_802B37F0.unk4)
        {
        case 1:
            if (lbl_802B37F0.unk12C == 0)
            {
                if (lbl_802B37F0.unk18 & 1)
                    lbl_802B37F0.unk4 = 3;
                else
                {
                    lbl_802B37F0.unk4 = 2;
                    lbl_802B37F0.unk8 = 0x5A;
                }
                lbl_802B37F0.unk134.r = 512.0f;
                lbl_802B37F0.unk134.g = 512.0f;
                lbl_802B37F0.unk134.b = 512.0f;
            }
            else
                lbl_802B37F0.unk4 = 3;
            lbl_802B37F0.unk130 = 0x280;
            break;
        case 2:
            lbl_802B37F0.unk8--;
            if (lbl_802B37F0.unk8 < 0)
                lbl_802B37F0.unk4 = 3;
            break;
        case 3:
            if (lbl_802B37F0.unk1C != 0)
                lbl_802B37F0.unk4 = 5;
            else
            {
                lbl_802B37F0.unk4 = 4;
                lbl_802B37F0.unk8 = 0;
                lbl_802B37F0.unk1C = 1;
                letterBall = lbl_802B37F0.letterBalls;
                for (i = 7; i > 0; i--, letterBall++)
                {
                    letterBall->rotation = rand() & 0x7FFF;
                    letterBall->unk4 = ((rand() & 0x3FFF) - 0x1FFF);
                    letterBall->unkC = -32.0 + -128.0 * RAND_FLOAT();
                    letterBall->unk14 = 16.0 * RAND_FLOAT();
                }
            }
            lbl_802B37F0.unk10 = 1.0f;
            break;
        case 4:
            lbl_802B37F0.unk8--;
            if (lbl_802B37F0.unk8 < 0)
                lbl_802B37F0.unk4 = 5;
            break;
        case 5:
            lbl_802B37F0.unk4 = 7;
            entry = lbl_802B37F0.rankingEntries;
            for (i = 0; i < 5; i++, entry++)
            {
                if (entry->x == 640.0f)
                {
                    entry->unk8 = i * 12;
                    entry->unk4 = 0.0f;
                }
            }
            break;
        case 8:
            lbl_802B37F0.unk4 = 0;
            lbl_802B37F0.unk130 = 0;
            lbl_802B37F0.unk10 = 0.0f;
            func_80088A10();
            break;
        }
        if (lbl_802B37F0.unk1C != 0)
        {
            struct RankingLetterBall *letterBall;

            letterBall = lbl_802B37F0.letterBalls;
            for (i = 7; i > 0; i--, letterBall++)
            {
                letterBall->unk14 += 0.512;
                letterBall->unkC += letterBall->unk14;
                letterBall->unk4 -= letterBall->unk4 >> 5;
                letterBall->rotation += letterBall->unk4;
                if (letterBall->unkC > letterBall->unk10)
                {
                    letterBall->unkC = letterBall->unk10;
                    if (letterBall->unk14 > 0.0)
                        letterBall->unk14 *= -0.15 * (3.0 - mathutil_sin(letterBall->rotation + 0x4000));
                    if (letterBall->rotation > -16 && letterBall->rotation < 16)
                    {
                        if (letterBall->rotation < 0)
                            letterBall->rotation++;
                        else if (letterBall->rotation > 0)
                            letterBall->rotation--;
                    }
                    else
                        letterBall->rotation -= letterBall->rotation >> 4;
                    letterBall->unk4 >>= 2;
                    letterBall->unk4 -= letterBall->rotation >> 4;
                }
            }
        }

        if (lbl_802B37F0.unkC > lbl_802B37F0.unk10)
        {
            lbl_802B37F0.unkC -= 0.03333333333333333;
            if (lbl_802B37F0.unkC < lbl_802B37F0.unk10)
                lbl_802B37F0.unkC = lbl_802B37F0.unk10;
        }
        else if (lbl_802B37F0.unkC < lbl_802B37F0.unk10)
        {
            lbl_802B37F0.unkC += 0.03333333333333333;
            if (lbl_802B37F0.unkC > lbl_802B37F0.unk10)
                lbl_802B37F0.unkC = lbl_802B37F0.unk10;
        }

        entry = lbl_802B37F0.rankingEntries;
        for (i = 0; i < 5; i++, entry++)
        {
            if (entry->unkC != NULL)
            {
                if (entry->unk8 > 0)
                    entry->unk8--;
                else
                {
                    if (entry->unk10 != NULL)
                        entry->unk4 = -562.0f;
                    if (entry->x > entry->unk4)
                    {
                        entry->x -= 21.333333333333332;
                        if (entry->x < entry->unk4)
                            entry->x = entry->unk4;
                    }
                    else if (entry->x < entry->unk4)
                    {
                        entry->x += 21.333333333333332;
                        if (entry->x > entry->unk4)
                            entry->x = entry->unk4;
                    }
                    if (entry->x == -562.0f)
                    {
                        entry->x = 640.0f;
                        entry->unk4 = 0.0f;
                        entry->unkC = entry->unk10;
                        entry->unk10 = 0;
                        entry->unk8 = 0;
                    }
                }
            }
        }
        if (lbl_802B37F0.unk12C < lbl_802B37F0.unk130)
        {
            lbl_802B37F0.unk12C += 0x15;
            if (lbl_802B37F0.unk12C > lbl_802B37F0.unk130)
                lbl_802B37F0.unk12C = lbl_802B37F0.unk130;
        }
        else if (lbl_802B37F0.unk12C > lbl_802B37F0.unk130)
        {
            lbl_802B37F0.unk12C -= 0x15;
            if (lbl_802B37F0.unk12C < lbl_802B37F0.unk130)
                lbl_802B37F0.unk12C = lbl_802B37F0.unk130;
        }
        lbl_802B37F0.unk134.r += (lbl_802B37F0.unk140.r - lbl_802B37F0.unk134.r) * 0.045;
        lbl_802B37F0.unk134.g += (lbl_802B37F0.unk140.g - lbl_802B37F0.unk134.g) * 0.045;
        lbl_802B37F0.unk134.b += (lbl_802B37F0.unk140.b - lbl_802B37F0.unk134.b) * 0.045;
        lbl_802B37F0.unk14C.r += (lbl_802B37F0.unk158.r - lbl_802B37F0.unk14C.r) * 0.045;
        lbl_802B37F0.unk14C.g += (lbl_802B37F0.unk158.g - lbl_802B37F0.unk14C.g) * 0.045;
        lbl_802B37F0.unk14C.b += (lbl_802B37F0.unk158.b - lbl_802B37F0.unk14C.b) * 0.045;
        if (lbl_802B37F0.unk12C == 0 && lbl_802B37F0.unk10 == lbl_802B37F0.unkC && func_80088AF4() != 0)
            func_800885EC();
    }
}

static void draw_ranking_screen(void)
{
    struct NaomiSpriteParams params;
    u8 unused[0x88];
    int var_r30;
    int var_r22;
    int y;
    int x;
    int var_r29;
    struct RankingEntry *entry;
    struct ScoreRecord *record;
    struct RankingLetterBall *letterBall;

    if (lbl_802B37F0.unk1C != 0)
    {
        params.z = 1.02f;
        params.opacity = lbl_802B37F0.unkC;
        params.unk30 = 2;
        params.flags = 0xA;
        params.mulColor = RGBA(255, 255, 255, 0);
        params.addColor = 0;
        params.scaleX = 1.0f;
        params.scaleY = 1.0f;
        params.u1 = 0.0f;
        params.v1 = 0.0f;
        params.u2 = 1.0f;
        params.v2 = 1.0f;

        // draw the balls that spell out "RANKING"
        letterBall = lbl_802B37F0.letterBalls;
        for (var_r22 = 7; var_r22 > 0; var_r22--, letterBall++)
        {
            params.bmpId = letterBall->bmpId;
            params.rotation = letterBall->rotation;
            params.x = (int)letterBall->x;
            params.y = (int)(letterBall->unkC + lbl_802B37F0.unk14);
            draw_naomi_sprite(&params);
        }
    }

    y = 60.0f + lbl_802B37F0.unk14;
    params.bmpId = BMP_RNK_rnk_lines;
    params.z = 1.03f;
    params.rotation = 0;
    params.opacity = lbl_802B37F0.unkC;
    params.unk30 = 2;
    params.flags = 5;
    params.mulColor = RGBA(255, 255, 255, 0);
    params.addColor = 0;

    params.x = 26.0f;
    params.y = y;
    params.scaleX = 1.0f;
    params.scaleY = 0.26171875f;
    params.u1 = 0.0f;
    params.v1 = 0.26171875f;
    params.u2 = 1.0f;
    params.v2 = 0.5234375f;
    draw_naomi_sprite(&params);

    params.x = 282.0f;
    params.y = y;
    params.scaleX = 0.296875f;
    params.scaleY = 0.26171875f;
    params.u1 = 0.0f;
    params.v1 = 0.5234375f;
    params.u2 = 0.296875f;
    params.v2 = 0.78515625f;
    draw_naomi_sprite(&params);

    params.x = 358.0f;
    params.y = y;
    params.scaleX = 1.0f;
    params.scaleY = 0.26171875f;
    params.u1 = 0.0f;
    params.v1 = 0.0f;
    params.u2 = 1.0f;
    params.v2 = 0.26171875f;
    draw_naomi_sprite(&params);

    reset_text_draw_settings();
    set_text_font(FONT_ICON_TPL);
    func_80071B1C(1.03f);
    set_text_opacity(lbl_802B37F0.unkC);
    set_text_pos(65.0f, 136.0f + lbl_802B37F0.unk14);
    u_draw_char(0x30);
    set_text_pos(180.0f, 136.0f + lbl_802B37F0.unk14);
    u_draw_char(0x31);
    set_text_pos(289.0f, 136.0f + lbl_802B37F0.unk14);
    u_draw_char(0x32);
    set_text_pos(460.0f, 136.0f + lbl_802B37F0.unk14);
    u_draw_char(0x33);
    set_text_opacity(1.0f);

    params.bmpId = BMP_RNK_rnk_lines;
    params.z = 1.03f;
    params.rotation = 0;
    params.opacity = 1.0f;
    params.unk30 = 2;
    params.flags = 5;
    params.mulColor = RGBA(255, 255, 255, 0);
    params.addColor = 0;

    // Draw score list
    var_r29 = 160.0f + lbl_802B37F0.unk14;
    entry = lbl_802B37F0.rankingEntries;
    for (var_r30 = 0; var_r30 < 5; var_r30++, var_r29 += 46, entry++)
    {
        record = entry->unkC;
        if (record != NULL)
        {
            x = entry->x;

            // rank
            set_text_font(FONT_ICON_RNK);
            set_text_pos(x + 65, var_r29);
            u_draw_char('1' + var_r30);

            // initials
            set_text_font(FONT_ASC_30x31);
            set_text_pos(x + 172, var_r29);
            u_draw_text(record->initials);

            // floor
            draw_ranking_floor_num(var_r30, x, var_r29, record);

            // score number
            set_text_font(FONT_NUM_26x31);
            set_text_pos(x + 396, var_r29);
            func_80072AC0("%07d", record->score);

            // line start
            params.x = x + 39;
            params.y = var_r29 + 32;
            params.scaleX = 1.0f;
            params.scaleY = 0.0234375f;
            params.u1 = 0.0f;
            params.v1 = 0.9765625f;
            params.u2 = 1.0f;
            params.v2 = 1.0f;
            draw_naomi_sprite(&params);

            // line middle
            params.x += 256.0f;
            params.scaleX = 0.1953125f;
            params.u1 = 0.0f;
            params.v1 = 0.9296875f;
            params.u2 = 0.1953125f;
            params.v2 = 0.953125f;
            draw_naomi_sprite(&params);

            // line end
            params.x += 50.0f;
            params.scaleX = 1.0f;
            params.u1 = 0.0f;
            params.v1 = 0.953125f;
            params.u2 = 1.0f;
            params.v2 = 0.9765625f;
            draw_naomi_sprite(&params);
        }
    }

    draw_title_bar(0, 448, lbl_802B37F0.unk12C, 480, &lbl_802B37F0.unk134, 0, 1.02f);
    draw_title_bar(640 - lbl_802B37F0.unk12C, 0, 640, 32, &lbl_802B37F0.unk134, 0, 1.02f);
    draw_title_bar(0, 448, lbl_802B37F0.unk12C, 450, &lbl_802B37F0.unk14C, 0, 1.01f);
    draw_title_bar(640 - lbl_802B37F0.unk12C, 30, 640, 32, &lbl_802B37F0.unk14C, 0, 1.01f);

    bitmap_init_tev();

    params.z = 1.005f;
    params.rotation = 0;
    params.opacity = 1.0f;
    params.scaleX = 0.9609375f;
    params.scaleY = 0.06640625f;
    params.u1 = 0.0f;
    params.v1 = ((18.0f * (lbl_802B37F0.unk164.unk0 - 48)) + 0.5f) / 256.0f;
    params.u2 = 0.9609375f;
    params.v2 = params.v1 + 0.06640625f;
    params.unk30 = 2;
    params.flags = 5;
    params.mulColor = RGBA(255, 255, 255, 0);
    params.addColor = 0;
    params.bmpId = BMP_RNK_rnk_obiword;
    params.x = 0x298 - lbl_802B37F0.unk12C;
    params.y = 7.0f;
    draw_naomi_sprite(&params);
    params.x = -24 - lbl_802B37F0.unk164.unk2 + lbl_802B37F0.unk12C;
    params.y = 455.0f;
    draw_naomi_sprite(&params);
}

void draw_ranking_floor_num(int rank, int startX, int startY, struct ScoreRecord *record)
{
    struct NaomiSpriteParams params;
    char text[8];
    double x = (float)startX;
    float  y = (float)startY;
    float temp_f29;
    s32 r, g, b;
    u8 unused[4];
    int len;
    s16 var;

    params.z = 1.03f;
    params.rotation = 0;
    params.opacity = 1.0f;
    params.unk30 = 2;
    params.flags = 0x20005;
    params.mulColor = RGBA(255, 255, 255, 0);
    params.addColor = 0;

    switch (record->unkD)
    {
    case 0:
        set_text_font(FONT_NUM_26x31);
        if (record->floorNum == 0xFF)
        {
            set_text_pos(302.0 + x, y);
            u_draw_text("--");
            return;
        }
        sprintf(text, "%d", record->floorNum);
        len = strlen(text);
        set_text_pos(328.0 + x - len * 13.0, y);
        u_draw_text(text);
        break;
    case 1:
        set_text_font(FONT_NUM_26x31);
        sprintf(text, "%d", record->floorNum);
        set_text_pos(32.0 + (x = 328.0 + x - 29.0), y);
        u_draw_text(text);
        params.bmpId = BMP_RNK_rnk_ex_icon;
        params.x = x;
        params.y = y;
        params.scaleX = 0.96875f;
        params.scaleY = 0.96875f;
        params.u1 = 0.0f;
        params.v1 = 0.0f;
        params.u2 = 0.96875f;
        params.v2 = 0.96875f;
        draw_naomi_sprite(&params);
        break;
    default:
        func_80073E00(BMP_RNK_rnk_ex2_icon, 1, 1);
        x = 328.0 + x;
        params.bmpId = BMP_RNK_rnk_ex2_icon;
        params.x = x - 47.0;
        params.y = y;
        params.scaleX = 0.7265625f;
        params.scaleY = 0.96875f;
        params.u1 = 0.0f;
        params.v1 = 0.0f;
        params.u2 = params.u1 + 0.7265625;
        params.v2 = 0.96875f;
        var = ((unpausedFrameCounter << 10) + rank);
        temp_f29 = 384.0 * (mathutil_sin(var) - 0.5);
        if (temp_f29 > 0.0)
        {
            if (temp_f29 < 128.0f)
                set_text_opacity(1.0f - (0.0078125f * temp_f29));
            else
                set_text_opacity(0.0f);
            r = (int)temp_f29 - 0;
            g = (int)temp_f29 - 24;
            b = (int)temp_f29 - 64;
            if (r < 0)
                r = 0;
            else if (r > 255)
                r = 255;
            if (g < 0)
                g = 0;
            else if (g > 255)
                g = 255;
            if (b < 0)
                b = 0;
            else if (b > 255)
                b = 255;
            params.addColor = RGBA(r, g, b, 0);
        }
        draw_naomi_sprite(&params);
        sprintf(text, "%d", record->floorNum);
        len = strlen(text);
        set_text_pos(x - len * 13.0, y);
        func_80071B1C(0.09f);
        u_draw_text(text);
        set_text_opacity(1.0f);
        break;
    }
}

void func_800885EC(void)
{
    int i;
    float new_var;
    struct RankingLetterBall *letterBall;
    struct Struct801C79C8 *var2;
    s16 *var3;

    lbl_802B37F0.unk0 = 0;
    lbl_802B37F0.unk4 = 0;
    lbl_802B37F0.unk1C = 0;

#ifdef NONMATCHING
    letterBall = lbl_802B37F0.letterBalls;
    for (i = 0; i < 7; i++, letterBall++)
    {
        letterBall->bmpId = s_rankingBallBmpIds[i];
        letterBall->x     = lbl_801C79C8[i].unk0;
        letterBall->unk10 = lbl_801C79C8[i].unk4;
    }
#else
    var2 = lbl_801C79C8;
    letterBall = lbl_802B37F0.letterBalls;
    var3 = s_rankingBallBmpIds;
    if ((&lbl_802B37F0) && (&lbl_802B37F0))
    {
    }
    for (i = 0; i < 7; i++, letterBall++)
    {
        var2 = &lbl_801C79C8[i];
        letterBall->bmpId = var3[i];
        letterBall->x     = var2->unk0;
        letterBall->unk10 = (new_var = var2->unk4);
        !var2;
    }
#endif

    lbl_802B37F0.unkC = 0.0f;
    lbl_802B37F0.unk10 = 0.0f;
    lbl_802B37F0.unk12C = 0;
    lbl_802B37F0.unk130 = 0;
}

void init_ranking_screen(int difficulty)
{
    int temp_r31;
    struct Sprite *sprite;
    struct ScoreRecord *record;
    struct RankingEntry *entry;
    int i;
    int var;

    temp_r31 = !lbl_802B37F0.unk0;
    if (lbl_802B37F0.unk0 == 0)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->mainFunc = ranking_screen_sprite_main;
            sprite->drawFunc = ranking_screen_sprite_draw;
            strcpy(sprite->text, "RANKING");
        }
    }
    lbl_802B37F0.unk0 = 1;
    lbl_802B37F0.unk4 = 1;
    lbl_802B37F0.unk140 = lbl_801C7948[difficulty];
    lbl_802B37F0.unk158 = lbl_801C7948_2[difficulty];
    lbl_802B37F0.unk164 = lbl_801C7948_3[difficulty];
    switch (gameMode)
    {
    case 5:
        lbl_802B37F0.unk14 = 32.0f;
        lbl_802B37F0.unk18 = 1;
        break;
    default:
        lbl_802B37F0.unk14 = 0.0f;
        lbl_802B37F0.unk18 = 0;
        break;
    }
    lbl_802B37F0.unk168 = func_800AEC74(difficulty, 0);

    var = 0;
    entry = lbl_802B37F0.rankingEntries;
    record = lbl_802B37F0.unk168;
    for (i = 0; i < 5; i++, entry++, record++)
    {
        entry->unk8 = var;
        if (temp_r31 != 0)
        {
            entry->unkC = record;
            entry->unk10 = 0;
            entry->unk4 = 640.0f;
            entry->x = entry->unk4;
        }
        else if (entry->unkC != NULL)
            entry->unk10 = record;
        else
            entry->unkC = record;
        var += 12;
    }
}

void func_8008897C(int arg0)
{
    if (lbl_802B37F0.unk0 != 0)
    {
        if (arg0 != 0)
            lbl_802B37F0.unk0 = 0;
        else
            lbl_802B37F0.unk4 = 8;
    }
}

static void ranking_screen_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    update_ranking_screen();
    if (lbl_802B37F0.unk0 == 0)
        *arg0 = 0;
}

static void ranking_screen_sprite_draw(struct Sprite *sprite)
{
    draw_ranking_screen();
}

void func_80088A10(void)
{
    struct RankingEntry *entry;
    int i;
    int var;

    var = 0;
    entry = lbl_802B37F0.rankingEntries;
    for (i = 0; i < 5; i++, entry++)
    {
        entry->unk4 = -562.0f;
        entry->unk10 = 0;
        if (entry->x == 0.0f && entry->unk8 == 0)
            entry->unk8 = var;
        var += 12;
    }
}

int func_80088AF4(void)
{
    struct RankingEntry *entry;
    int i;
    int var = TRUE;

    entry = lbl_802B37F0.rankingEntries;
    for (i = 0; i < 5; i++, entry++)
    {
        if (entry->unkC != NULL
         && entry->unk4 != entry->x
         && entry->unk8 <= 0)
        {
            var = FALSE;
            break;
        }
    }
    if (!var)
        return FALSE;
    else
        return TRUE;
}

int func_80088C18(void)
{
    return lbl_802B37F0.unk12C;
}

// Shows the Super Monkey Ball logo during the ranking phase of the title screen
void show_rank_title_logo(void)
{
    struct Sprite *sprite;

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->type = 1;
        sprite->tag = 3;
        sprite->x = 8.0f;
        sprite->y = 8.0f;
        sprite->mulR = 0xFF;
        sprite->mulG = 0xFF;
        sprite->mulB = 0xFF;
        sprite->textAlign = 0;
        sprite->bmpId = BMP_RNK_rnk_monkeyball_logo;
        sprite->unk4C = 0.26f;
        sprite->mainFunc = rnk_title_sprite_main;
        strcpy(sprite->text, "RNK TITILE");
    }
}

static struct
{
    s32 unk0;
    u32 unk4;
    float unk8;
    float unkC;
    float unk10;
    float unk14;
    s16 unk18;
    u8 filler1A[2];
    struct ReplayHeader unk1C;
    u32 unk34;
    u32 unk38;
    char floorName[0x64-0x3C];
} lbl_802B395C;

static void rnk_title_sprite_main(s8 *arg0, struct Sprite *sprite)
{
    float temp_f4 = lbl_802B37F0.unk12C;

    if (128.0 + sprite->x > 640.0 - temp_f4)
    {
        sprite->x = 640.0 - temp_f4 - 128.0;
        sprite->rotation += 0x400;
    }
    if (temp_f4 >= 640.0)
        *arg0 = 0;
}

static void func_80088D44(void)
{
    int len;

    lbl_802B395C.unk34 = 0xFFFFFF;
    lbl_802B395C.unk38 = 0;
    if (lbl_802B395C.unk1C.flags & 0x20)
    {
        lbl_802B395C.unk34 = 0xFFFF00;
        lbl_802B395C.unk38 = 0x404040;
    }
    if (lbl_802B395C.unk1C.flags & 0x40)
        sprintf(lbl_802B395C.floorName, "MASTER %d", lbl_802B395C.unk1C.floorNum);
    else if (lbl_802B395C.unk1C.flags & 0x20)
        sprintf(lbl_802B395C.floorName, "EXTRA %d", lbl_802B395C.unk1C.floorNum);
    else
        sprintf(lbl_802B395C.floorName, "FLOOR %d", lbl_802B395C.unk1C.floorNum);
    lbl_802B395C.unk14 = 40.0 + (float)strlen(lbl_802B395C.floorName) * 20.0;
    len = strlen(lbl_802B395C.floorName) * 20;
    lbl_802B395C.unk14 = 40.0 + (float)len;
}

void func_80088E90(void)
{
    lbl_802B395C.unk0 = 0;
    lbl_802B395C.unk4 = 1;
    lbl_802B395C.unk18 = lbl_80250A68.unk0[lbl_80250A68.unk14];
    get_replay_header(lbl_802B395C.unk18, &lbl_802B395C.unk1C);
    func_80088D44();
    lbl_802B395C.unk8 = -lbl_802B395C.unk14;
    lbl_802B395C.unkC = 0.0f;
    lbl_802B395C.unk10 = lbl_802B395C.unk8;
}

void func_80088F18(void)
{
    s32 temp_r31;
    struct Sprite *sprite;

    temp_r31 = !lbl_802B395C.unk0;
    if (lbl_802B395C.unk0 == 0)
    {
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->mainFunc = lbl_80089070;
            sprite->drawFunc = lbl_800890B4;
            strcpy(sprite->text, "RANKING");
        }
    }
    lbl_802B395C.unk0 = 1;
    lbl_802B395C.unk4 = 1;
    if (temp_r31 != 0)
    {
        lbl_802B395C.unk18 = lbl_80250A68.unk0[lbl_80250A68.unk14];
        get_replay_header(lbl_802B395C.unk18, &lbl_802B395C.unk1C);
        func_80088D44();
    }
}

void func_80088FD4(int arg0)
{
    if (arg0 != 0)
        func_80088E90();
    else
        lbl_802B395C.unk4 = 4;
}

static void lbl_80089070(s8 *arg0, struct Sprite *sprite)
{
    func_800890D4();
    if (lbl_802B395C.unk0 == 0)
        *arg0 = 0;
}

static void lbl_800890B4(struct Sprite *sprite)
{
    func_8008923C();
}

static void func_800890D4(void)
{
    float temp_f1;

    switch (lbl_802B395C.unk4)
    {
    case 1:
        lbl_802B395C.unk4 = 2;
        lbl_802B395C.unk10 = 8.0f;
        break;
    case 2:
        if (lbl_802B395C.unk18 != lbl_80250A68.unk0[lbl_80250A68.unk14])
        {
            lbl_802B395C.unk4 = 3;
            lbl_802B395C.unk10 = -lbl_802B395C.unk14;
        }
        break;
    case 3:
        if (lbl_802B395C.unk8 == lbl_802B395C.unk10)
        {
            lbl_802B395C.unk4 = 1;
            lbl_802B395C.unk18 = lbl_80250A68.unk0[lbl_80250A68.unk14];
            get_replay_header(lbl_802B395C.unk18, &lbl_802B395C.unk1C);
            func_80088D44();
        }
        break;
    case 4:
        lbl_802B395C.unk4 = 0;
        lbl_802B395C.unk10 = -lbl_802B395C.unk14;
        break;
    }
    temp_f1 = lbl_802B395C.unk10;
    if (lbl_802B395C.unk8 > temp_f1)
    {
        lbl_802B395C.unk8 -= 10.666666666666666;
        if (lbl_802B395C.unk8 < temp_f1)
            lbl_802B395C.unk8 = temp_f1;
    }
    else if (lbl_802B395C.unk8 < temp_f1)
    {
        lbl_802B395C.unk8 += 10.666666666666666;
        if (lbl_802B395C.unk8 > temp_f1)
            lbl_802B395C.unk8 = temp_f1;
    }
}

static void func_8008923C(void)
{
    float var_f31 = lbl_802B395C.unk8;
    float y = 8.0f;
    float var_f29;

    if (var_f31 + lbl_802B395C.unk14 > 640.0 - lbl_802B37F0.unk12C)
        var_f31 = (float)(640.0 - lbl_802B37F0.unk12C) - lbl_802B395C.unk14;
    var_f29 = 4.0f + var_f31;
    if (!(lbl_802B395C.unk1C.flags & 0x40))
    {
        reset_text_draw_settings();
        set_text_font(FONT_ICON_LV);
        set_text_scale(0.5f, 0.5f);
        set_text_pos(var_f31, y + 4.0f);
        u_draw_char(lbl_802B395C.unk1C.difficulty + 0x34);
        var_f29 = 40.0f + var_f31;
    }
    set_text_font(FONT_ASC_20x20);
    set_text_scale(1.0f, 1.0f);
    set_text_mul_color(lbl_802B395C.unk34);
    set_text_add_color(lbl_802B395C.unk38);
    set_text_pos(var_f29, y);
    u_draw_text(lbl_802B395C.floorName);
    y += 20.0f;
    reset_text_draw_settings();
    set_text_font(FONT_ASC_8x16);
    set_text_pos(40.0f + var_f31, y);
    if (lbl_802B395C.unk1C.playerName[0] != 0)
    {
        set_text_mul_color(RGBA(255, 128, 0, 0));
        set_text_add_color(RGBA(64, 48, 48, 0));
        func_80072AC0("%s", lbl_802B395C.unk1C.playerName);
        set_text_mul_color(RGBA(255, 255, 255, 0));
        set_text_add_color(RGBA(0, 0, 0, 0));
        u_draw_text("'S ");
    }
    func_80072AC0("REPLAY");
}
