#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "camera.h"
#include "ball.h"
#include "effect.h"
#include "event.h"
#include "gxcache.h"
#include "gxutil.h"
#include "item.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "ord_tbl.h"
#include "rend_efc.h"
#include "stobj.h"
#include "stage.h"

struct Struct800993A8_sub
{
    s32 unk0;
    Vec unk4;
    Vec unk10;
    struct GMAModel *unk1C;
    float unk20;
    float unk24;
    s16 unk28;
    s16 unk2A;
    float unk2C;
};  // size = 0x30

struct Struct800993A8
{
    GXTexObj unk0;
    u32 unk20;
    void *unk24;
    u16 unk28;
    u16 unk2A;
    GXTexObj unk2C;
    void *unk4C;
    Mtx unk50;
    u8 filler80[4];
    u8 unk84;
    u8 filler85[0x88-0x85];
    float unk88;
    s32 unk8C;
    struct Struct800993A8_sub unk90[256];
};

struct BGPilotWork_child
{
    u8 filler0[0xC];
    Vec unkC;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    Vec unk20;
};

struct BGPilotWork
{
    u8 filler0[0x14];
    struct BGPilotWork_child *unk14;
    u8 filler18[0x20-0x18];
    GXTexObj *unk20;
    struct GMAModel *unk24;
    u8 filler28[4];
    s32 unk2C;
    struct GMAModel *unk30[0x2C];
    void *unkE0;
    u8 fillerE4[0x10C-0xE4];
    Mtx unk10C;
    u8 filler13C[0x164-0x13C];
    Mtx unk164;
    u8 filler194[0x1BC-0x194];
    Mtx unk1BC;
};

void func_800993A8(struct RenderEffect *rendEfc);
void func_800994A8(struct RenderEffect *rendEfc);
void func_80099518(struct RenderEffect *rendEfc);
void func_80099968(int arg0, struct RenderEffect *arg1);
void func_800999CC(int unused, struct RenderEffect *arg1);
void func_8009A13C(int arg0, struct RenderEffect *arg1);
void func_8009A2A4(struct RenderEffect *rendEfc);
void lbl_8009A31C(struct EnvMapSomething *arg0);
void func_8009A6E0(struct RenderEffect *rendEfc);

struct RenderEffectFuncs lbl_801D3D78 =
{
    func_800993A8,
    func_800994A8,
    func_80099518,
    func_80099968,
};

void func_800993A8(struct RenderEffect *rendEfc)
{
    struct Struct800993A8 *work;
    size_t bufSize;

    rendEfc->enableFlags = 3;
    work = OSAllocFromHeap(stageHeap, sizeof(*work));
    if (work == NULL)
    {
        rendEfc->state = 0;
        return;
    }
    memset(work, 0, sizeof(*work));
    rendEfc->work = work;
    work->unk20 = 4;
    work->unk28 = 0x280;
    work->unk2A = 0x1C0;
    work->unk24 = lbl_802F1B40;
    bufSize = GXGetTexBufferSize(256, 256, GX_TF_IA8, GX_FALSE, 0U);
    work->unk4C = OSAllocFromHeap(stageHeap, bufSize);
    if (work->unk4C == NULL)
    {
        OSFreeToHeap(stageHeap, work);
        rendEfc->state = 0;
        return;
    }
    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(work->unk50);
    work->unk84 = 0x60;
    ((struct BGPilotWork *)backgroundInfo.work)->unkE0 = work;
}

void func_800994A8(struct RenderEffect *rendEfc)
{
    struct Struct800993A8 *temp_r3 = (void *)rendEfc->work;

    if (temp_r3 != NULL)
    {
        if (temp_r3->unk4C != NULL)
            OSFreeToHeap(stageHeap, temp_r3->unk4C);
        OSFreeToHeap(stageHeap, rendEfc->work);
    }
    if (backgroundInfo.bgId == BG_TYPE_PIL)
        ((struct BGPilotWork *)backgroundInfo.work)->unkE0 = NULL;
}

void func_80099518(struct RenderEffect *rendEfc)
{
    Vec sp18;
    Vec spC;
    float temp_f10;
    float var_f31;
    float f1;
    int i;
    struct Struct800993A8 *temp_r31;
    struct Struct800993A8_sub *var_r30;
    struct BGPilotWork *temp_r29;
    struct Ball *temp_r28;

    if (gamePauseStatus & 0xA)
        return;

    temp_r31 = (void *)rendEfc->work;
    temp_r29 = backgroundInfo.work;
    temp_r28 = &ballInfo[modeCtrl.currPlayer];

    mathutil_vec_len(&temp_r28->vel);  //! result not used

    sp18 = temp_r28->pos;
    spC = temp_r28->vel;
    f1 = mathutil_vec_len(&spC);
    temp_f10 = fabs(sp18.y);
    sp18.x += 3.0f * (spC.x * temp_f10);
    sp18.z += 3.0f * (spC.z * temp_f10);
    var_f31 = (f1 * (4.0f / (1.0f + temp_f10)));
    var_f31 -= 0.1f;
    if (var_f31 > 0.0f)
    {
        temp_r31->unk88 += var_f31;
        if (temp_r31->unk88 > 1.0f)
        {
            temp_r31->unk88 = 0.0f;
            if (var_f31 > 0.5f)
                var_f31 = 0.5f;
            var_r30 = &temp_r31->unk90[temp_r31->unk8C--];
            if (temp_r31->unk8C < 0)
                temp_r31->unk8C = 0xFF;
            var_r30->unk0 = 60.0f * (0.5f + RAND_FLOAT() * var_f31 * 2.0f);
            var_r30->unk4.x = sp18.x;
            var_r30->unk4.y = 0.0f;
            var_r30->unk4.z = sp18.z;
            var_r30->unk10.x = 0.5f * spC.x;
            var_r30->unk10.y = 0.0f;
            var_r30->unk10.z = 0.5f * spC.z;
            var_r30->unk1C = temp_r29->unk30[(rand() & 0x7FFF) % temp_r29->unk2C];
            var_r30->unk20 = 1.0f / var_r30->unk1C->boundSphereRadius;
            var_r30->unk24 = var_r30->unk20 * ((1.0f + RAND_FLOAT()) * var_f31 * 0.55f);
            var_r30->unk28 = rand() & 0x7FFF;
            var_r30->unk2A = 16384.0f * (RAND_FLOAT() - 0.5f);
            var_r30->unk2C = 0.2f;
        }
    }

    var_r30 = temp_r31->unk90;
    for (i = 0; i < 256; i++, var_r30++)
    {
        if (var_r30->unk0 != 0)
        {
            var_r30->unk10.x *= 0.92f;
            var_r30->unk10.y *= 0.92f;
            var_r30->unk10.z *= 0.92f;
            var_r30->unk4.x += var_r30->unk10.x;
            var_r30->unk4.y += var_r30->unk10.y;
            var_r30->unk4.z += var_r30->unk10.z;
            var_r30->unk2A -= var_r30->unk2A >> 7;
            var_r30->unk28 += var_r30->unk2A;
            var_r30->unk24 *= 0.99f;
            var_r30->unk20 += var_r30->unk24;
            var_r30->unk0--;
            if ((float)var_r30->unk0 < 60.0f)
                var_r30->unk2C *= (float)var_r30->unk0 / (float)(var_r30->unk0 + 1);
            else
                var_r30->unk2C += 0.3f * (1.0f - var_r30->unk2C);
        }
    }
}

void func_80099968(int arg0, struct RenderEffect *arg1)
{
    switch (arg0)
    {
    case 1:
        func_800999CC(arg0, arg1);
        func_8009A13C(arg0, arg1);
        break;
    case 2:
        break;
    }
}

void func_800999CC(int arg0, struct RenderEffect *arg1)
{
    struct Camera cameraBackup;
    Vec sp11C;
    struct Struct800993A8 *temp_r30;
    struct Camera *camera;
    struct BGPilotWork_child *temp_r28;
    int r31;

    camera_apply_viewport(modeCtrl.currPlayer);
    temp_r30 = (void *)arg1->work;
    camera = currentCameraStructPtr;
    cameraBackup = *camera;  // save camera
    push_light_group();

    temp_r28 = ((struct BGPilotWork *)backgroundInfo.work)->unk14;

    mathutil_mtxA_from_translate(&temp_r28->unkC);
    mathutil_mtxA_rotate_z(temp_r28->unk1C);
    mathutil_mtxA_rotate_y(temp_r28->unk1A);
    mathutil_mtxA_rotate_x(temp_r28->unk18);
    mathutil_mtxA_scale(&temp_r28->unk20);
    mathutil_mtxA_to_mtx(temp_r30->unk50);
    mathutil_mtxA_mult_left(mathutilData->mtxB);
    mathutil_mtxA_rigid_inv_tf_tl(&sp11C);
    if (sp11C.y < 0.0f)
    {
        mathutil_mtxA_from_mtx(temp_r30->unk50);
        mathutil_mtxA_rotate_z(0x8000);
        mathutil_mtxA_to_mtx(temp_r30->unk50);
    }

    {
        Vec basisI = {1, 0, 0};
        Vec basisJ = {0, 1, 0};
        Vec basisK = {0, 0, 1};
        Point3d origin = {0, 0, 0};
        Mtx spB0;
        Mtx sp80;
        Mtx sp50;
        Mtx44 projMtx;

        mathutil_mtxA_from_translate(&camera->eye);
        mathutil_mtxA_rotate_y(camera->rotY);
        mathutil_mtxA_rotate_x(camera->rotX);
        mathutil_mtxA_rotate_z(camera->rotZ);
        mathutil_mtxA_mult_right(mathutilData->mtxB);
        mathutil_mtxA_to_mtx(sp50);
        mathutil_mtxA_mult_right(temp_r30->unk50);
        mathutil_mtxA_rigid_inv_tf_vec(&basisI, &basisI);
        mathutil_mtxA_rigid_inv_tf_vec(&basisJ, &basisJ);
        mathutil_mtxA_rigid_inv_tf_vec(&basisK, &basisK);
        mathutil_mtxA_rigid_inv_tf_point(&origin, &origin);
        basisI.y = -basisI.y;
        basisJ.y = -basisJ.y;
        basisK.y = -basisK.y;
        origin.y = -origin.y;
        mathutil_mtxA_tf_vec(&basisI, &basisI);
        mathutil_mtxA_tf_vec(&basisJ, &basisJ);
        mathutil_mtxA_tf_vec(&basisK, &basisK);
        mathutil_mtxA_tf_point(&origin, &origin);
        mathutilData->mtxA[0][0] = basisI.x;
        mathutilData->mtxA[1][0] = basisI.y;
        mathutilData->mtxA[2][0] = basisI.z;
        mathutilData->mtxA[0][1] = basisJ.x;
        mathutilData->mtxA[1][1] = basisJ.y;
        mathutilData->mtxA[2][1] = basisJ.z;
        mathutilData->mtxA[0][2] = basisK.x;
        mathutilData->mtxA[1][2] = basisK.y;
        mathutilData->mtxA[2][2] = basisK.z;
        mathutilData->mtxA[0][3] = origin.x;
        mathutilData->mtxA[1][3] = origin.y;
        mathutilData->mtxA[2][3] = origin.z;

        mathutil_mtxA_invert();
        mathutil_mtxA_to_mtx(sp80);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_scale_xyz(-1.0f, 1.0f, 1.0f);
        mathutil_mtxA_to_mtx(spB0);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_z(-camera->rotZ);
        mathutil_mtxA_rotate_x(-camera->rotX);
        mathutil_mtxA_rotate_y(-camera->rotY);
        mathutil_mtxA_translate_neg(&camera->eye);
        mathutil_mtxA_mult_right(sp80);
        mathutil_mtxA_mult_right(sp50);
        mathutil_mtxA_mult_left(spB0);
        mathutil_mtxA_to_mtx(camera->unk144);
        mathutil_mtxA_to_mtx(camera->unk174);
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_z(-camera->rotZ);
        mathutil_mtxA_rotate_x(-camera->rotX);
        mathutil_mtxA_rotate_y(-camera->rotY);
        mathutil_mtxA_translate_neg(&camera->eye);
        mathutil_mtxA_mult_right(sp80);
        mathutil_mtxA_translate(&camera->eye);
        mathutil_mtxA_rotate_y(camera->rotY);
        mathutil_mtxA_rotate_x(camera->rotX);
        mathutil_mtxA_rotate_z(camera->rotZ);
        mathutil_mtxA_mult_right(lbl_802F1B3C->matrices[0]);
        mathutil_mtxA_mult_left(spB0);
        mathutil_mtxA_to_mtx(camera->unk1A4);
        mathutil_mtxA_to_mtx(camera->unk1D4);
        camera_apply_viewport(u_cameraId1);
        MTXPerspective(projMtx, 0.005493164f * camera->sub28.fov, camera->sub28.aspect, 0.1f, 20000.0f);
        projMtx[0][2] -= projMtx[0][0] * camera->sub28.unk28 * camera->sub28.aspect * camera->sub28.unk38;
        projMtx[1][2] -= projMtx[1][1] * camera->sub28.unk2C * camera->sub28.unk38;
        GXSetProjection(projMtx, GX_PERSPECTIVE);
        GXSetViewport(0.0f, 0.0f, temp_r30->unk28, temp_r30->unk2A, 0.0f, 1.0f);
        GXSetScissor(0, 0, temp_r30->unk28, temp_r30->unk2A);
        mathutil_mtxA_from_mtxB();
        load_light_group_uncached(5);
        lbl_801EEC90.unk0 |= 4;
        mathutil_mtxA_from_mtx(temp_r30->unk50);
        mathutil_mtxA_get_translate_alt(&lbl_801EEC90.unk4);
        mathutil_mtxA_tf_vec_xyz(&lbl_801EEC90.unk10, 0.0f, 1.0f, 0.0f);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_tf_point(&lbl_801EEC90.unk4, &lbl_801EEC90.unk1C);
        mathutil_mtxA_tf_vec(&lbl_801EEC90.unk10, &lbl_801EEC90.unk28);
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
        mathutil_mtxA_rigid_invert();
        mathutil_mtxA_mult_right(mathutilData->mtxB);
        mathutil_mtxA_tf_point(&lbl_801EEC90.unk4, &lbl_801EEC90.unk34);
        mathutil_mtxA_tf_vec(&lbl_801EEC90.unk10, &lbl_801EEC90.unk40);
    }

    if (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
    {
        Vec sp10;

        mathutil_mtxA_from_mtx(temp_r30->unk50);
        mathutil_mtxA_rigid_inv_tf_point(&currentBallStructPtr->pos, &sp10);
        r31 = (sp10.y > 0.0);
        draw_monkey();
        if (eventInfo[EVENT_STAGE].state == EV_STATE_RUNNING || eventInfo[EVENT_STAGE].state == EV_STATE_SUSPENDED)
            stage_draw();
        if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
        {
            ord_tbl_set_depth_offset(400.0f);
            background_draw();
            ord_tbl_set_depth_offset(0.0f);
        }
        if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
            item_draw();
        if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
            stobj_draw();
        if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
            effect_draw();
        if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
            ball_draw();
        if (r31 && lbl_802F1FD4 != NULL)
            lbl_802F1FD4();
        ord_tbl_draw_nodes();
    }
    else
        func_800A5F28();
    lbl_801EEC90.unk0 &= 0xFFFFFFFB;
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    GXSetTexCopySrc(0, 0, temp_r30->unk28, temp_r30->unk2A);
    GXSetTexCopyDst(temp_r30->unk28, temp_r30->unk2A, temp_r30->unk20, 0);
    GXCopyTex(temp_r30->unk24, 1);
    GXInitTexObj(&temp_r30->unk0, temp_r30->unk24, temp_r30->unk28, temp_r30->unk2A, temp_r30->unk20, GX_CLAMP, GX_CLAMP, 0U);
    *camera = cameraBackup;  // restore camera
    camera_apply_viewport(modeCtrl.currPlayer);
    pop_light_group();
}

void func_8009A13C(int arg0, struct RenderEffect *arg1)
{
    struct Struct800993A8 *temp_r31 = (void *)arg1->work;
    u8 unused[8];

    func_8009AC0C(0);
    GXSetViewport(0.0f, 0.0f, 256.0f, 256.0f, 0.0f, 1.0f);
    GXSetScissor(0U, 0U, 0x100U, 0x100U);
    func_8009A2A4(arg1);
    func_8009A6E0(arg1);
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    GXSetTexCopySrc(0, 0, 0x100U, 0x100U);
    GXSetTexCopyDst(0x100U, 0x100U, GX_CTF_GB8, 0);
    GXCopyTex(temp_r31->unk4C, 1);
    GXInitTexObj(&temp_r31->unk2C, temp_r31->unk4C, 0x100U, 0x100U, GX_TF_IA8, GX_MIRROR, GX_MIRROR, 0U);
    GXInitTexObjLOD(&temp_r31->unk2C, GX_LINEAR, GX_LINEAR, 0.0f, 10.0f, 0.0f, 0U, 0U, GX_ANISO_1);
    func_8009AC44();
    camera_apply_viewport(modeCtrl.currPlayer);
}

void func_8009A2A4(struct RenderEffect *rendEfc)
{
    struct Struct800993A8 *temp_r31;
    struct BGPilotWork *temp_r30;
    void (*temp_r30_2)(struct EnvMapSomething *);

    temp_r31 = (void *)rendEfc->work;
    temp_r30 = (struct BGPilotWork *)backgroundInfo.work;
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_mult_right(temp_r31->unk50);
    GXLoadPosMtxImm(mathutilData->mtxA, 0U);
    temp_r30_2 = u_avdisp_set_some_func_1((void*)lbl_8009A31C);
    avdisp_draw_model_culled_sort_none(temp_r30->unk24);
    u_avdisp_set_some_func_1(temp_r30_2);
}

void lbl_8009A31C(struct EnvMapSomething *arg0)
{
    struct BGPilotWork *temp_r31;
    struct Struct80061BC4_sub sp10;
    u8 unused[4];

    temp_r31 = (struct BGPilotWork *)backgroundInfo.work;
    sp10 = arg0->unkC;
    GXLoadTexObj_cached(temp_r31->unk20, sp10.u_texMapId);
    GXLoadTexMtxImm(temp_r31->unk10C, sp10.unk8, GX_MTX2x4);
    GXSetTexCoordGen(sp10.unk4, GX_TG_MTX2x4, GX_TG_POS, sp10.unk8);
    GXSetTevSwapMode_cached(sp10.unk0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevOrder_cached(sp10.unk0, sp10.unk4, sp10.u_texMapId, GX_COLOR_NULL);
    GXSetTevColorIn_cached(sp10.unk0, GX_CC_ZERO, GX_CC_TEXC, GX_CC_CPREV, GX_CC_ZERO);
    GXSetTevColorOp_cached(sp10.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(sp10.unk0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_APREV);
    GXSetTevAlphaOp_cached(sp10.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevDirect(sp10.unk0);
    sp10.unk0 += 1;
    sp10.unk4 += 1;
    sp10.unk8 += 3;
    GXLoadTexMtxImm(temp_r31->unk164, sp10.unk8, GX_MTX2x4);
    GXSetTexCoordGen(sp10.unk4, GX_TG_MTX2x4, GX_TG_POS, sp10.unk8);
    GXSetTevSwapMode_cached(sp10.unk0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevOrder_cached(sp10.unk0, sp10.unk4, sp10.u_texMapId, GX_COLOR_NULL);
    GXSetTevColorIn_cached(sp10.unk0, GX_CC_ZERO, GX_CC_TEXC, GX_CC_CPREV, GX_CC_ZERO);
    GXSetTevColorOp_cached(sp10.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(sp10.unk0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_APREV);
    GXSetTevAlphaOp_cached(sp10.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevDirect(sp10.unk0);
    sp10.unk0 += 1;
    sp10.unk4 += 1;
    sp10.unk8 += 3;
    GXLoadTexMtxImm(temp_r31->unk1BC, sp10.unk8, GX_MTX2x4);
    GXSetTexCoordGen(sp10.unk4, GX_TG_MTX2x4, GX_TG_POS, sp10.unk8);
    GXSetTevSwapMode_cached(sp10.unk0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevOrder_cached(sp10.unk0, sp10.unk4, sp10.u_texMapId, GX_COLOR_NULL);
    GXSetTevColorIn_cached(sp10.unk0, GX_CC_ZERO, GX_CC_TEXC, GX_CC_CPREV, GX_CC_ZERO);
    GXSetTevColorOp_cached(sp10.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(sp10.unk0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_APREV);
    GXSetTevAlphaOp_cached(sp10.unk0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevDirect(sp10.unk0);
    sp10.unk0 += 1;
    sp10.unk4 += 1;
    sp10.unk8 += 3;
    sp10.u_texMapId += 1;
    arg0->unkC = sp10;
}

void func_8009A6E0(struct RenderEffect *rendEfc)
{
    struct Struct800993A8 *temp_r31;
    int i;
    struct Struct800993A8_sub *var_r30;

    temp_r31 = (void *)rendEfc->work;
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_mult_right(temp_r31->unk50);
    avdisp_set_z_mode(1U, GX_ALWAYS, 0U);

    var_r30 = temp_r31->unk90;
    for (i = 256; i > 0; i--, var_r30++)
    {
        if (var_r30->unk0 != 0)
        {
            float temp_f1;

            mathutil_mtxA_push();
            mathutil_mtxA_translate(&var_r30->unk4);
            mathutil_mtxA_rotate_x(-0x4000);
            mathutil_mtxA_rotate_z(var_r30->unk28);
            mathutil_mtxA_scale_s(var_r30->unk20);
            GXLoadPosMtxImm(mathutilData->mtxA, 0U);
            avdisp_set_bound_sphere_scale(var_r30->unk20);
            temp_f1 = 0.8f * var_r30->unk2C;
            avdisp_set_post_mult_color(temp_f1, temp_f1, temp_f1, temp_f1);
            avdisp_draw_model_culled_sort_none(var_r30->unk1C);
            mathutil_mtxA_pop();
        }
    }
    u_reset_post_mult_color();
    avdisp_set_z_mode(1U, GX_LEQUAL, 1U);
}
