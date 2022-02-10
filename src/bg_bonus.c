/**
 * bg_bonus.c - Code for the bonus stage background
 */
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "gxutil.h"
#include "mathutil.h"
#include "stage.h"

struct UnkBackground9C_alt_sub
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
    float unk10;
    float unk14;
    float unk18;
};

struct UnkBackground9C_alt
{
    s32 unk0;
    struct StageBgModel *unk4;
    void *unk8;
    struct GMAModelHeader *unkC;
    s32 unk10;
    struct UnkBackground9C_alt_sub unk14[2];
    u8 filler4C[0x714-0x4C];
    GXTexObj *unk714;
    u32 unk718;
    Mtx unk71C;
    Mtx unk74C;
    Mtx unk77C;
    Mtx unk7AC;
    Mtx unk7DC;
};

struct Struct80056684 lbl_801BA010[] =
{
    { 1, "BNS_SHOTSTAR" },
    { 0, "STARLIGHT_" },
    { 1, "BNS_LIGHTMAP" },
    { 1, "BNS_LIGHTMAP_A" },
    { 0, "STARPOINT" },
    { 3, NULL },
};

struct Struct80056684 lbl_801BA04C[] =
{
    { 1, "BNS_MAIN" },
    { 3, NULL },
};

void lbl_80061B58(void);
void lbl_80061BC4(struct Struct80061BC4 *a);
int lbl_80061EF0(int a, void **b);
int lbl_80061FA8(int, struct StageBgModel *);

void bg_bonus_init(void)
{
    struct UnkBackground9C_alt *r31 = (void *)backgroundInfo.unk9C;
    int i;
    struct UnkBackground9C_alt_sub *r30;

    bg_e3_init();
    backgroundInfo.ballEnvFunc = lbl_80061BC4;
    backgroundInfo.unk98 = lbl_80061B58;
    if (r31->unk0 == 0)
    {
        r31->unk10 = 0;
        func_80056684(lbl_801BA010, lbl_80061EF0);
        r31->unk0 = 1;
    }
    func_800567DC(
        decodedStageLzPtr->bgModels,
        decodedStageLzPtr->bgModelsCount,
        lbl_801BA04C,
        lbl_80061FA8);
    func_800567DC(
        decodedStageLzPtr->unk74,
        decodedStageLzPtr->unk70,
        lbl_801BA04C,
        lbl_80061FA8);
    r30 = r31->unk14;
    for (i = r31->unk10; i > 0; i--, r30++)
    {
        r30->unkC = rand() & 0x7FFF;
        r30->unkE = (((rand() / 32767.0f) * 0.5f + 1.0f) * 65536.0f) / 180.0f;
    }
}

void bg_bonus_main(void)
{
    struct UnkBackground9C_alt *r31 = (void *)backgroundInfo.unk9C;
    int i;
    struct UnkBackground9C_alt_sub *r29;
    Vec sp8;

    bg_e3_main();
    if (gamePauseStatus & 0xA)
        return;
    r29 = r31->unk14;
    for (i = r31->unk10; i > 0; i--, r29++)
    {
        float f2;
        r29->unkC += r29->unkE;
        f2 = (mathutil_sin(r29->unkC) + 1.0f) * 0.25f + 0.5f;
        r29->unk10 = f2 * 1.1f;
        r29->unk14 = f2 * 1.05f;
        r29->unk18 = f2;
        if (r29->unk10 > 1.0f)
            r29->unk10 = 1.0f;
        if (r29->unk14 > 1.0f)
            r29->unk14 = 1.0f;
    }

    mathutil_mtxA_from_identity();
    sp8.x = (2.0f / 3.0f);
    sp8.y = (2.0f / 3.0f);
    sp8.z = (2.0f / 3.0f);
    mathutil_mtxA_scale(&sp8);
    mathutil_mtxA_rotate_y(0x1000);
    mathutil_mtxA_rotate_x(0x4000);
    mathutil_mtxA_to_mtx(r31->unk71C);

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(0x1000);
    mathutil_mtxA_rotate_x(0x4000);
    mathutil_mtxA_to_mtx(r31->unk74C);

    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][0] = 0.0f;
    mathutilData->mtxA[1][1] = 0.0f;
    mathutilData->mtxA[1][2] = -0.5f;
    mathutilData->mtxA[1][3] = 0.5f;
    mathutilData->mtxA[2][2] = 0.0f;
    mathutilData->mtxA[2][3] = 1.0f;
    mathutil_mtxA_to_mtx(r31->unk77C);
}

void bg_bonus_finish(void) {}

void bg_bonus_draw(void)
{
    struct UnkBackground9C_alt *r30 = (void *)backgroundInfo.unk9C;
    int i;
    Vec sp14;
    Vec sp8;
    struct UnkBackground9C_alt_sub *r28;
    struct GMAModelHeader *r27_;
    struct StageBgModel *r27;

    bg_e3_draw();
    r27 = r30->unk4;
    sp8 = r27->scale;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_translate(&r27->pos);
    mathutil_mtxA_rotate_z(r27->zrot);
    mathutil_mtxA_rotate_y(r27->yrot);
    mathutil_mtxA_rotate_x(r27->xrot);
    mathutil_mtxA_scale(&sp8);
    avdisp_set_z_mode(1, 3, 0);
    r27_ = r30->unkC;
    for (i = r30->unk10, r28 = r30->unk14; i > 0; i--, r28++)
    {
        float f30 = (r28->unk10 + r28->unk14 + r28->unk18) * 0.75f;

        if (lbl_801EEC90.unk0 & (1 << 2))
        {
            sp14.x = r28->unk0.x * sp8.x;
            sp14.y = r28->unk0.y * sp8.y;
            sp14.z = r28->unk0.z * sp8.z;
            if (func_8000E53C(&sp14) < -(r27_->boundsRadius * f30))
                continue;
        }
        mathutil_mtxA_push();
        mathutil_mtxA_translate(&r28->unk0);
        mathutil_mtxA_sq_from_identity();
        mathutil_get_mtxA_translate_alt(&sp14);
        if (sp14.z < -30.0f)
        {
            float f3 = (26.0f + sp14.z) / sp14.z;

            sp14.x *= f3;
            sp14.y *= f3;
            sp14.z *= f3;
            mathutil_set_mtxA_translate(&sp14);
            f30 *= f3;
            mathutil_mtxA_scale_s(f30);
            g_avdisp_set_some_color_1(r28->unk10, r28->unk14, r28->unk18, 1.0f);
            g_avdisp_maybe_draw_model_1(r27_);
            func_8000E3BC();
        }
        mathutil_mtxA_pop();
    }
    avdisp_set_z_mode(1, 3, 1);
}

void func_80061920(int a)
{
    struct Struct8003C550 sp18;
    Vec spC;
    float f31;

    switch (a)
    {
    case 0:
    case 1:
        memset(&sp18, 0, sizeof(sp18));
        sp18.unk8 = 32;
        sp18.unk14 = currentBallStructPtr->unk2E;
        mathutil_mtxA_from_mtx(cameraInfo[sp18.unk14].unk1A4);
        spC.z = -120.0f + (rand() / 32767.0f) * -225.0f;
        spC.x = spC.z * -(8.0f / 3.0f) * currentCameraStructPtr->sub28.unk38 * ((rand() / 32767.0f) - 0.5f);
        spC.y = spC.z * -1.1f * currentCameraStructPtr->sub28.unk38;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &sp18.unk34);
        f31 = -spC.z * (1.0f / 300.0f);
        sp18.unk40.x = (1.0f + (rand() / 32767.0f)) * f31;
        sp18.unk40.y = (-3.0f + (rand() / 32767.0f) * -1.0f) * f31;
        sp18.unk40.z = (1.0f + (rand() / 32767.0f)) * f31;
        spC.x = 0.0f;
        spC.y = 0.0f;
        spC.z = 0.0f;
        mathutil_mtxA_rigid_inv_tf_point(&spC, &spC);
        mathutil_ray_to_euler_xy(&spC, &sp18.unk34, &sp18.unk4C, &sp18.unk4E);
        sp18.unk50 = rand() & 0x7FFF;
        g_create_pickup_item(&sp18);
        break;
    }
}

void lbl_80061B58(void)
{
    struct UnkBackground9C_alt *r31 = (void *)backgroundInfo.unk9C;
    Mtx sp8;

    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_invert();
    mathutil_mtxA_to_mtx(sp8);
    mathutil_mtxA_mult_left(r31->unk71C);
    mathutil_mtxA_to_mtx(r31->unk7AC);
    mathutil_mtxA_from_mtx(sp8);
    mathutil_mtxA_mult_left(r31->unk74C);
    mathutil_mtxA_to_mtx(r31->unk7DC);
}

void lbl_80061BC4(struct Struct80061BC4 *a)
{
    struct UnkBackground9C_alt *r31 = (void *)backgroundInfo.unk9C;
    struct Struct80061BC4_sub spC = a->unkC;

    func_8009E110(1, 1, 1, 0);
    func_8009AC8C();
    func_8009F430(r31->unk714, spC.unkC);
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(r31->unk7AC);
    GXLoadTexMtxImm(mathutilData->mtxA, spC.unk8, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXSetTexCoordGen(spC.unk4, GX_TG_MTX2x4, GX_TG_POS, spC.unk8);
    GXSetTevDirect(spC.unk0);
    func_8009EFF4(spC.unk0, spC.unk4, spC.unkC, 0xFF);
    func_8009E618(spC.unk0, 15, 15, 15, 8);
    func_8009E800(spC.unk0, 0, 0, 0, 1, 2);
    func_8009E70C(spC.unk0, 7, 7, 7, 6);
    func_8009E918(spC.unk0, 0, 0, 0, 1, 0);
    spC.unk0++;
    spC.unk4++;
    spC.unk8 += 3;
    spC.unkC++;
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(r31->unk7DC);
    mathutil_set_mtxA_translate_xyz(0.0f, 0.0f, 0.0f);
    GXLoadTexMtxImm(mathutilData->mtxA, spC.unk8, GX_MTX3x4);
    mathutil_mtxA_pop();
    GXLoadTexMtxImm(r31->unk77C, spC.unk14, GX_MTX3x4);
    func_8009F430(r31->unk718, spC.unkC);
    GXSetTexCoordGen2(spC.unk4, GX_TG_MTX3x4, GX_TG_NRM, spC.unk8, GX_TRUE, spC.unk14);
    GXSetTevDirect(spC.unk0);
    func_8009EFF4(spC.unk0, spC.unk4, spC.unkC, 0xFF);
    func_8009E618(spC.unk0, 15, 8, 4, 15);
    func_8009E800(spC.unk0, 0, 0, 0, 1, 0);
    func_8009E70C(spC.unk0, 7, 7, 7, 0);
    func_8009E918(spC.unk0, 0, 0, 0, 1, 0);
    spC.unk0++;
    spC.unk4++;
    spC.unk8 += 3;
    spC.unk14 += 3;
    spC.unkC++;
    a->unkC = spC;
}

struct Struct80061EF0
{
    u8 filler0[0x24];
    void *unk24;
};

struct Struct80061EF0_2
{
    u8 filler0[0x8];
    Vec unk8;
};

// TODO: figure out types
int lbl_80061EF0(int a, void **b)
{
    struct UnkBackground9C_alt *r7 = (void *)backgroundInfo.unk9C;

    switch (a)
    {
    case 0:
        r7->unk8 = *b;
        break;
    case 1:
        r7->unkC = *b;
        break;
    case 2:
        r7->unk714 = ((struct Struct80061EF0 *)*b)->unk24;
        break;
    case 3:
        r7->unk718 = (u32)((struct Struct80061EF0 *)*b)->unk24;
        break;
    case 4:
        if (r7->unk10 < 64)
        {
            struct UnkBackground9C_alt_sub *r4 = &r7->unk14[r7->unk10];

            r4->unk0 = ((struct Struct80061EF0_2 *)*b)->unk8;
            r7->unk10++;
        }
        break;
    }
    return 1;
}

int lbl_80061FA8(int a, struct StageBgModel *b)
{
    struct UnkBackground9C_alt *r3 = (void *)backgroundInfo.unk9C;

    switch (a)
    {
    case 0:
        r3->unk4 = (void *)b;
        break;
    }
    return 1;
}
