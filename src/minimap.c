#include <stdlib.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "event.h"
#include "gxcache.h"
#include "gxutil.h"
#include "item.h"
#include "light.h"
#include "mathutil.h"
#include "minimap.h"
#include "mode.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "sprite.h"
#include "stage.h"
#include "stobj.h"
#include "world.h"

#include "../data/common.nlobj.h"

struct Struct801C5758
{
    u32 unk0;
    s32 unk4;
    s16 unk8;
    u16 unkA;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
    s32 unk1C;
    float unk20;
    Vec unk24;
    s16 unk30;
    s16 unk32;
    s16 unk34;
    s16 unk36;
    s16 unk38;
    u16 unk3A;
    float unk3C;
    float unk40;
    float unk44;
    float unk48;
};

static struct Struct801C5758 lbl_801C5758 =
{
    0xFFFFFFFF,
    0,
    0, 0,
    1.0f,
    -0.8666666746139526f,
    -0.17499999701976776f,
    0.23333333432674408f,
    0,
    0.26499998569488525f,
    { 0.0f, 0.0f, 0.0f },
    0x0280, 0x01C0,
    0, 0,
    0, 0,
    0.0f,
    0.0f,
    0.0f,
    0.0f,
};

void ev_minimap_init(void)
{
    func_8008D36C(NLOBJ_MODEL(g_commonNlObj, 11), 0x1BFFFFFF, 0x24000000);
    func_8008D36C(NLOBJ_MODEL(g_commonNlObj, 12), 0x1FFFFFFF, 0xE0000000);
    func_8008D330(NLOBJ_MODEL(g_commonNlObj, 13), 0xF8FFFFFF, 0x02000000);
    func_8008D36C(NLOBJ_MODEL(g_commonNlObj, 13), 0x1FFFFFFF, 0xE0000000);
    func_8008D3A8(NLOBJ_MODEL(g_commonNlObj, 13), 0x90EFFFFF, 0x08000000);
    if (gameSubmode == SMD_ADV_INFO_INIT)
    {
        lbl_801C5758.unk32 = 0x1A8;
        lbl_801C5758.unk10 = -0.76666665077209473f;
    }
    else
    {
        lbl_801C5758.unk32 = 0x1C0;
        lbl_801C5758.unk10 = -0.86666667461395264f;
    }
}

static struct
{
    Vec unk0;
    float unkC;
    u8 filler10[0x120];
} lbl_80292D30;

void ev_minimap_main(void)
{
    struct Ball *r4 = currentBallStructPtr;
    float f1;
    float f3;
    Vec sp8;

    if (gamePauseStatus & 0xA)
        return;
    if (lbl_801C5758.unk4 == 0)
        return;

    switch (lbl_801C5758.unk4)
    {
    case 1:
        lbl_801C5758.unk34 -= 6;
        lbl_801C5758.unk38 -= 71;
        if (lbl_801C5758.unk34 < 0)
        {
            lbl_801C5758.unk4 = 0;
            lbl_801C5758.unk34 = 0;
        }
        break;
    case 2:
        lbl_801C5758.unk38 -= lbl_801C5758.unk38 >> 4;
        break;
    case 3:
        lbl_801C5758.unk34 += 8;
        lbl_801C5758.unk38 += 33;
        if (lbl_801C5758.unk34 > 0x140)
        {
            lbl_801C5758.unk4 = 2;
            lbl_801C5758.unk34 = 0x140;
        }
        break;
    }

    lbl_801C5758.unk8 = lbl_801C5758.unk34 * 0x3000 / 0x140 + 0x1000;
    lbl_801C5758.unk36 += lbl_801C5758.unk38;
    f1 = lbl_80292D30.unkC;
    switch (lbl_801C5758.unk1C)
    {
    case 0:
        if (f1 > 18.0)
            f3 = 0.14722222089767456f;
        else
            f3 = 2.6500000000000004 / f1;
        sp8 = r4->pos;
        lbl_801C5758.unk40 = 0.0f;
        lbl_801C5758.unk48 = 0.6f;
        break;
    case 1:
        f3 = 1.3250000000000002 / f1;
        sp8 = lbl_80292D30.unk0;
        sp8.y = r4->pos.y;
        lbl_801C5758.unk40 = 1.0f;
        lbl_801C5758.unk48 = 0.0f;
        break;
    case 2:
    default:
        if (f1 > 18.0)
            f3 = 0.29444444179534912f;
        else
            f3 = 5.3000000000000007 / f1;
        sp8 = r4->pos;
        lbl_801C5758.unk40 = 0.0f;
        lbl_801C5758.unk48 = 0.6f;
        break;
    }

    lbl_801C5758.unk20 += (f3 - lbl_801C5758.unk20) * 0.1;
    lbl_801C5758.unk24.x += (sp8.x - lbl_801C5758.unk24.x) * 0.1;
    lbl_801C5758.unk24.y += (sp8.y - lbl_801C5758.unk24.y) * 0.1;
    lbl_801C5758.unk24.z += (sp8.z - lbl_801C5758.unk24.z) * 0.1;

    if (lbl_801C5758.unk3C < lbl_801C5758.unk40)
    {
        lbl_801C5758.unk3C += 0.066666666666666666;
        if (lbl_801C5758.unk3C > lbl_801C5758.unk40)
            lbl_801C5758.unk3C = lbl_801C5758.unk40;
    }
    else if (lbl_801C5758.unk3C > lbl_801C5758.unk40)
    {
        lbl_801C5758.unk3C -= 0.033333333333333333;
        if (lbl_801C5758.unk3C < lbl_801C5758.unk40)
            lbl_801C5758.unk3C = lbl_801C5758.unk40;
    }

    if (lbl_801C5758.unk44 < lbl_801C5758.unk48)
    {
        lbl_801C5758.unk44 += 0.066666666666666666;
        if (lbl_801C5758.unk44 > lbl_801C5758.unk48)
            lbl_801C5758.unk44 = lbl_801C5758.unk48;
    }
    else if (lbl_801C5758.unk44 > lbl_801C5758.unk48)
    {
        lbl_801C5758.unk44 -= 0.033333333333333333;
        if (lbl_801C5758.unk44 < lbl_801C5758.unk48)
            lbl_801C5758.unk44 = lbl_801C5758.unk48;
    }
}

void ev_minimap_dest(void)
{
    lbl_801C5758.unk4 = 0;
    lbl_801C5758.unk34 = 0;
    lbl_801C5758.unk38 = 0;
    lbl_801C5758.unk3C = 0.0f;
}

void func_800846B0(int a)
{
    switch (a)
    {
    case 0:
        lbl_801C5758.unk34 = 0;
        lbl_801C5758.unk3C = 0.0f;
        break;
    case 2:
        lbl_801C5758.unk34 = 0x140;
        break;
    case 3:
        if (lbl_801C5758.unk34 == 0)
            lbl_801C5758.unk38 = (rand() & 0x3FF) + 0x200;
        break;
    case 4:
        a = lbl_801C5758.unk4;
        lbl_801C5758.unk34 = 0;
        lbl_801C5758.unk3C = 0.0f;
        lbl_801C5758.unk1C = 0;
        lbl_801C5758.unk20 = 0.26499998569488525f;
        break;
    }

    if (lbl_801C5758.unk4 == 0)
    {
        lbl_801C5758.unk24.x = 0.0f;
        lbl_801C5758.unk24.y = 0.0f;
        lbl_801C5758.unk24.z = 0.0f;
    }
    lbl_801C5758.unk4 = a;
}

void func_80084794(void *unused)
{
    func_800463E8(&lbl_80292D30.unk0, &lbl_80292D30.unkC);
}

void minimap_change_size(void)
{
    if (lbl_801C5758.unk4 != 0)
    {
        lbl_801C5758.unk1C++;
        if (lbl_801C5758.unk1C > 2)
            lbl_801C5758.unk1C = 0;
    }
}

struct Struct800847FC
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
};

static void func_800847FC(struct Struct800847FC *a)
{
    float f31 = a->unk0;
    float f30 = a->unk4;
    float f29 = a->unk8;
    float f28 = a->unkC;
    float f27 = a->unk10;

    gxutil_set_vtx_attrs(1 << GX_VA_POS);
    GXSetBlendMode_cached(1, 0, 1, 0);
    GXSetZMode_cached(1, 7, 1);
    {
        GXColor color = {0, 0, 0, 0};
        GXSetFog_cached(0, 0.0f, 100.0f, 0.1f, 20000.0f, color);
    }
    GXSetCullMode_cached(0);
    GXSetTevDirect(0);
    GXSetTevOrder_cached(0, 0xFF, 0xFF, 0xFF);
    GXSetTevKAlphaSel_cached(0, 0);
    GXSetTevColorIn_cached(0, 15, 15, 15, 15);
    GXSetTevColorOp_cached(0, 0, 0, 0, 1, 0);
    GXSetTevAlphaIn_cached(0, 7, 7, 7, 6);
    GXSetTevAlphaOp_cached(0, 0, 0, 3, 1, 0);
    GXSetNumTevStages_cached(1);
    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    mathutil_mtxA_pop();
    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
    GXPosition3f32(f29, f30, f27);
    GXPosition3f32(f31, f30, f27);
    GXPosition3f32(f31, f28, f27);
    GXPosition3f32(f29, f28, f27);
    GXSetZMode_cached(1, 3, 1);
}

static u32 s_speechBubbleColors[] =
{
    RGBA(255, 255, 255, 0),
    RGBA(255, 255, 255, 0),
    RGBA(255, 224, 128, 0),
    RGBA(255, 255, 255, 0),
};

void minimap_draw(void)
{
    float temp_f31;
    float var_f30;
    float temp_f29;
    float temp_f28;
    float scale;
    struct Ball *ball;
    struct World *world;
    int temp_r27;
    int var_r26;
    int temp_r25;
    int var_r24;
    int temp_r23;
    int temp_r22;
    int temp_r6;
    float new_var;
    float new_var4;
    Mtx sp124;
    Mtx44 spE4;
    Mtx44 spA4;
    struct Struct800847FC sp90;
    Vec sp84;
    struct NaomiSpriteParams params;
    Vec sp28;
    Vec sp1C;
    struct Struct800847FC sp8;

    ball = currentBallStructPtr;
    world = currentWorldStructPtr;
    if (lbl_801C5758.unk34 != 0)
    {
        func_8009AC0C(0);
        switch (gameMode)
        {
        case 2:
            switch (modeCtrl.gameType)
            {
            case 0:
                func_800188A8(modeCtrl.currPlayer);
                break;
            default:
                func_800188A8(0);
                break;
            }
            break;
        default:
            func_800188A8(0);
            break;
        }

        temp_r6 = lbl_801C5758.unk34;
        temp_r6 == 0.0f;
        temp_r27 = lbl_801C5758.unk30 - (temp_r6 >> 1);
        temp_r25 = lbl_801C5758.unk32 - (temp_r6 >> 1);
        var_r26 = temp_r27 + temp_r6;
        var_r24 = temp_r25 + temp_r6;
        if (var_r26 > 640)
            var_r26 = 640;
        if (var_r24 > 480)
            var_r24 = 480;
        temp_r23 = temp_r25 * currRenderMode->xfbHeight / 480;
        temp_r22 = var_r24 * currRenderMode->xfbHeight / 480;
        C_MTXPerspective(spA4, 60.0f, 1.3333334f, 0.1f, 20000.0f);
        GXSetProjection(spA4, GX_PERSPECTIVE);
        GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
        GXSetScissor(0, 0, currRenderMode->fbWidth, currRenderMode->xfbHeight);
        new_var4 = 0.00024056263f;
        sp90.unk0 = (temp_r27 - 320) * new_var4;
        sp90.unk4 = (240 - (temp_r25 - 1)) * new_var4;
        sp90.unk8 = (var_r26 - 320) * new_var4;
        sp90.unkC = (240 - var_r24) * new_var4;
        sp90.unk10 = -0.1f;
        func_800847FC(&sp90);
        mathutil_mtx_copy(mathutilData->mtxB, sp124);
        C_MTXPerspective(spE4, 60.0f, 1.3333334f, 0.1f, 20000.0f);
        spE4[0][2] += -0.57735026f * (1.3333334f * (spE4[0][0] * lbl_801C5758.unkC));
        spE4[1][2] += -0.57735026f * (spE4[1][1] * lbl_801C5758.unk10);
        GXSetProjection(spE4, GX_PERSPECTIVE);
        push_light_group();
        mathutil_mtxA_from_mtxB();
        load_light_group_uncached(1);
        nl2ngc_set_material_color(1.0f, 1.0f, 1.0f);

        scale = (415.0 * lbl_801C5758.unk34) / 320.0;
        mathutil_mtxA_from_translate_xyz(0.0f, 0.0f, -1000.0f);
        mathutil_mtxA_rotate_z(lbl_801C5758.unk36);
        mathutil_mtxA_scale_xyz(scale, scale, scale);
        nl2ngc_set_scale(scale);
        nl2ngc_draw_model_sort_none_alt2(g_commonNlObj->models[NLMODEL_common_mmapbase]);

        scale = (0.46200000062584873 * lbl_801C5758.unk34) / 320.0;
        mathutil_mtxA_from_translate_xyz(0.0f, 0.0f, -1.1f);
        mathutil_mtxA_rotate_z(lbl_801C5758.unk36);
        mathutil_mtxA_scale_xyz(scale, scale, scale);
        nl2ngc_set_scale(scale);
        nl2ngc_draw_model_sort_none_alt2(g_commonNlObj->models[NLMODEL_common_mmapring]);

        GXSetViewport(temp_r27, temp_r23, (float)var_r26 - (float)temp_r27, (float)temp_r22 - (float)temp_r23, 0.0f, 1.0f);
        GXSetScissor(temp_r27, temp_r23, var_r26 - temp_r27, temp_r22 - temp_r23);

        new_var = 0.057735026f;
        !&lbl_801C5758.unk10;  // needed to match
        temp_f29 = lbl_801C5758.unkC + lbl_801C5758.unk14;
        temp_f28 = lbl_801C5758.unk10 + lbl_801C5758.unk18;
        C_MTXFrustum(
            spE4,
            new_var * (((240.0f - temp_r25) / 240.0f) - temp_f28),
            new_var * (((240.0f - var_r24) / 240.0f) - temp_f28),
            new_var * (1.3333334f * (((temp_r27 - 320.0f) / 320.0f) - temp_f29)),
            new_var * (1.3333334f * (((var_r26 - 320.0f) / 320.0f) - temp_f29)),
            0.1f,
            20000.0f);
        GXSetProjection(spE4, GX_PERSPECTIVE);

        scale = lbl_801C5758.unk20;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_x(lbl_801C5758.unk8);
        mathutil_mtxA_rotate_y(-currentCameraStructPtr->rotY);
        if (eventInfo[EVENT_WORLD].state == EV_STATE_RUNNING)
        {
            mathutil_mtxA_rotate_x(world->xrot);
            mathutil_mtxA_rotate_z(world->zrot);
        }
        sp84.x = 0.0f;
        sp84.y = 0.0f;
        sp84.z = -10.0f;
        mathutil_mtxA_set_translate(&sp84);
        mathutil_mtxA_scale_xyz(scale, scale, scale);
        sp84 = lbl_801C5758.unk24;
        mathutil_mtxA_translate_neg(&sp84);
        mathutil_mtxA_to_mtx(mathutilData->mtxB);
        mathutil_mtxA_scale_s(lbl_801C5758.unk44 / scale);
        mathutil_mtxA_to_mtx(lbl_802F1B3C->matrices[2]);
        mathutil_mtxA_from_mtxB();

        var_f30 = 0.0f;
        if ((lbl_801C5758.unk34 - 160) / 160.0f > 0.0f)
            var_f30 = (lbl_801C5758.unk34 - 160) / 160.0f;

        params.unk30 = 2;
        params.addColor = 0;
        params.u1 = 0.0f;
        params.v1 = 0.0f;
        params.u2 = 1.0f;
        params.v2 = 1.0f;
        u_math_unk16(&ball->pos, &sp28, 0.57735026f);

        temp_f31 = lbl_801C5758.unk3C;
        if (temp_f31 > 0.0)
        {
            sp28.z = -2.0f;
            sp1C.x = -sp28.y - (0.5 * sp28.x);
            sp1C.y = sp28.x - (0.5 * sp28.y);
            sp1C.z = 0.0f;
            params.rotation = mathutil_atan2(sp1C.y, (4.0 / 3.0) * sp1C.x) + 0x4000;
            if (sp1C.x == 0.0 && sp1C.y == 0.0)
                sp1C.y = 1.0f;
            mathutil_vec_set_len(&sp1C, &sp1C, 0.1125 * temp_f31);
            sp28.x += sp1C.x;
            sp28.y += sp1C.y;
            params.bmpId = BMP_NML_fukidashi;
            params.mulColor = s_speechBubbleColors[playerCharacterSelection[modeCtrl.currPlayer]];
            params.opacity = 0.75 * var_f30;
            params.x = 320.0 + (320.0 * (sp28.x + temp_f29));
            params.y = 240.0 + (-240.0 * (sp28.y + temp_f28));
            params.z = -sp28.z;
            params.scaleX = temp_f31;
            params.scaleY = temp_f31;
            params.flags = 0x2000A;
            draw_naomi_sprite(&params);

            mathutil_vec_set_len(&sp1C, &sp1C, 0.025 * temp_f31);
            sp28.x = sp28.x + sp1C.x;
            sp28.y += sp1C.y;
            mathutil_mtxA_translate(&ball->pos);
            mathutil_mtxA_scale_xyz(1.25 * temp_f31, 1.25 * temp_f31, 1.25 * temp_f31);
            nl2ngc_set_scale(1.25 * scale * temp_f31);
            nl2ngc_draw_model_sort_translucent(g_commonNlObj->models[NLMODEL_common_BALL_BLK]);
        }

        params.bmpId = u_get_monkey_bitmap_id(0, 0, playerCharacterSelection[modeCtrl.currPlayer]);
        params.mulColor = 0xFFFFFFFF;
        params.opacity = (double)var_f30;
        params.x = 320.0 + (320.0 * (sp28.x + temp_f29));
        params.y = 240.0 + (-240.0 * (sp28.y + temp_f28));
        params.z = -sp28.z - 0.5;
        params.rotation = 0;
        params.scaleX = 0.28846154f;
        params.scaleY = 0.1875f;
        params.flags = 0x100A;
        draw_naomi_sprite(&params);

        u_set_some_minimap_light_param(lbl_801C5758.unk20);
        mathutil_mtxA_from_mtxB();
        load_light_group_uncached(3);
        if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING
         || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
            stage_draw();
        if (lbl_801C5758.unk44 > 0.0f && eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
            item_draw();
        if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
            stobj_draw();
        if (lbl_801C5758.unk34 == 320)
        {
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate(&ball->pos);
            mathutil_mtxA_sq_from_identity();
            mathutil_mtxA_rotate_z((unpausedFrameCounter << 8) + (unpausedFrameCounter << 7));
            mathutil_mtxA_translate_xyz(0.0f, 0.0f, 0.5 * ball->modelScale * scale);
            mathutil_mtxA_scale_xyz(
                2.0 * (ball->modelScale * scale),
                2.0 * (ball->modelScale * scale),
                2.0 * (ball->modelScale * scale));
            nl2ngc_set_scale(2.0 * (ball->modelScale * scale));
            nl2ngc_draw_model_sort_translucent_alt(g_commonNlObj->models[NLMODEL_common_hideball_mark]);
        }
        ord_tbl_draw_nodes();
        GXSetProjection(spA4, GX_PERSPECTIVE);
        GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
        GXSetScissor(0, 0, currRenderMode->fbWidth, currRenderMode->xfbHeight);
        u_reset_post_mult_color();
        new_var4 = 48.11012f;
        sp8.unk0 = (temp_r27 - 320) * new_var4;
        sp8.unk4 = (240 - (temp_r25 - 1)) * new_var4;
        sp8.unk8 = (var_r26 - 320) * new_var4;
        sp8.unkC = (240 - var_r24) * new_var4;
        sp8.unk10 = -19999.0f;
        func_800847FC(&sp8);
        func_80017FCC();
        u_set_some_minimap_light_param(1.0f);
        pop_light_group();
        func_8009AC44();
    }
}
