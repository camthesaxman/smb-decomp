#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "camera.h"
#include "event.h"
#include "gxcache.h"
#include "gxutil.h"
#include "mathutil.h"

struct Struct802BA1A0_child
{
    void (*unk0)(struct Struct802BA1A0 *);
    void (*unk4)(struct Struct802BA1A0 *);
    void (*unk8)(struct Struct802BA1A0 *);
    void (*unkC)(int, struct Struct802BA1A0 *);
};

struct Struct802BA1A0 lbl_802BA1A0[4];

void ev_rend_efc_init(void)
{
    memset(lbl_802BA1A0, 0, sizeof(lbl_802BA1A0));
}

void ev_rend_efc_main(void)
{
    int i;
    struct Struct802BA1A0 *r29 = lbl_802BA1A0;

    for (i = 4; i > 0; i--, r29++)
    {
        if (r29->unk0 != 0)
        {
            struct Struct802BA1A0_child *r31 = r29->unk14;
            void (*r0)(struct Struct802BA1A0 *) = r31->unk8;

            if (r0 != NULL)
                r0(r29);
            if (r29->unk0 == 3)
            {
                if (r31->unk4 != NULL)
                    r31->unk4(r29);
                r29->unk0 = 0;
            }
        }
    }
}

void ev_rend_efc_dest(void)
{
    int i;
    struct Struct802BA1A0 *r29 = lbl_802BA1A0;

    for (i = 4; i > 0; i--, r29++)
    {
        if (r29->unk0 != 0)
        {
            void (*r0)(struct Struct802BA1A0 *) = r29->unk14->unk4;

            if (r0 != NULL)
                r0(r29);
            r29->unk0 = 0;
        }
    }
}

void func_80095398(int arg0)
{
    int i;
    struct Struct802BA1A0 *r29 = lbl_802BA1A0;
    u16 r31 = 1 << u_cameraId1;

    for (i = 4; i > 0; i--, r29++)
    {
        if (r29->unk0 != 0 && (r29->unk8 & arg0) && (r29->unk6 & r31))
        {
            void (*r0)(int, struct Struct802BA1A0 *) = r29->unk14->unkC;

            if (r0 != NULL)
                r0(arg0, r29);
        }
    }
}

struct Struct802BA1A0_child lbl_801D3CE8[] =
{
    { NULL,          NULL,          NULL,          NULL          },
    { func_8009557C, func_800955FC, func_8009562C, func_80095630 },
    { func_80095C6C, func_80095D3C, func_80095D90, func_80095D94 },
    { func_80096134, func_80096228, func_80096258, func_800963AC },
    { func_80096A30, func_80096B3C, func_80096BA8, func_80096BE0 },
    { func_800973A0, func_80097664, func_800976B8, func_800976BC },
    { func_8009826C, func_800983A0, func_8009840C, func_80098410 },
};

void func_8009544C(int arg0, int arg1, struct Struct802BA1A0 *arg2)
{
    struct Struct802BA1A0 *temp_r3;
    void (*temp_r0)(struct Struct802BA1A0 *);

    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
    {
        temp_r3 = &lbl_802BA1A0[arg0];
        if (temp_r3->unk0 != 0)
        {
            temp_r0 = temp_r3->unk14->unk4;
            if (temp_r0 != NULL)
                temp_r0(temp_r3);
            temp_r3->unk0 = 0;
        }
        memcpy(temp_r3, arg2, sizeof(*temp_r3));
        if (arg1 != 0)
            temp_r3->unk14 = &lbl_801D3CE8[arg1];
        if (temp_r3->unk14 == NULL)
        {
            temp_r3->unk0 = 0;
            return;
        }
        temp_r3->unk0 = 1;
        if (temp_r3->unk14->unk0 != NULL)
            temp_r3->unk14->unk0(temp_r3);
        if (temp_r3->unk0 == 3)
        {
            if (temp_r3->unk14->unk4 != NULL)
                temp_r3->unk14->unk4(temp_r3);
            temp_r3->unk0 = 0;
        }
    }
}

void func_8009557C(struct Struct802BA1A0 *arg0)
{
    struct Struct8009557C *temp_r3;

    arg0->unk8 = 8;
    temp_r3 = OSAlloc(sizeof(*temp_r3));
    if (temp_r3 == NULL)
    {
        arg0->unk10 = NULL;
        arg0->unk0 = 0;
        return;
    }
    arg0->unk10 = temp_r3;
    temp_r3->unk20 = lbl_802F1B40;
    GXInitTexObj(&temp_r3->unk0, temp_r3->unk20, 640, 448, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0);
}

void func_800955FC(struct Struct802BA1A0 *arg0)
{
    if (arg0->unk10 != NULL)
        OSFree(arg0->unk10);
}

void func_8009562C(struct Struct802BA1A0 *arg0) {}

void func_80095630(int arg0, struct Struct802BA1A0 *arg1)
{
    u16 left;
    u16 top;
    u16 width;
    u16 height;
    struct Struct8009557C *temp_r29;
    float temp_f31;
    float temp_f31_2;
    float temp_f30;
    float temp_f30_2;
    float temp_f29;
    float temp_f28;
    float temp_f4;
    float temp_f5;
    u8 unused[8];

    temp_r29 = arg1->unk10;

    temp_f5 = currRenderMode->fbWidth;
    temp_f4 = currRenderMode->xfbHeight;
    left = temp_f5 * currentCameraStructPtr->sub28.vp.left;
    top = temp_f4 * currentCameraStructPtr->sub28.vp.top;
    width = temp_f5 * currentCameraStructPtr->sub28.vp.width;
    height = temp_f4 * currentCameraStructPtr->sub28.vp.height;

    left = left & ~1;
    top = top & ~1;
    width = (width + 1) & ~1;
    height = (height + 1) & ~1;

    GXSetTexCopySrc(left, top, width, height);
    GXSetTexCopyDst(width, height, 4, 0);
    GXCopyTex(temp_r29->unk20, 0);
    GXInitTexObj(&temp_r29->unk0, temp_r29->unk20, width, height, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0U);
    GXSetNumChans(0);
    GXLoadTexObj_cached(&temp_r29->unk0, GX_TEXMAP0);

    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 30);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetTevKColorSel_cached(GX_TEVSTAGE0, GX_TEV_KCSEL_1_2);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_ZERO);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 0U, GX_TEVPREV);

    GXSetTexCoordGen(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, 33);
    GXSetTevOrder_cached(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE1);
    GXSetTevKColorSel_cached(GX_TEVSTAGE1, GX_TEV_KCSEL_1_2);
    GXSetTevColorIn_cached(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_CPREV);
    GXSetTevColorOp_cached(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 0U, GX_TEVPREV);

    GXSetTexCoordGen(GX_TEXCOORD2, GX_TG_MTX2x4, GX_TG_TEX0, 36);
    GXSetTevOrder_cached(GX_TEVSTAGE2, GX_TEXCOORD2, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE2);
    GXSetTevKColorSel_cached(GX_TEVSTAGE2, GX_TEV_KCSEL_1_2);
    GXSetTevColorIn_cached(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_CPREV);
    GXSetTevColorOp_cached(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 0U, GX_TEVPREV);

    GXSetTexCoordGen(GX_TEXCOORD3, GX_TG_MTX2x4, GX_TG_TEX0, 39);
    GXSetTevOrder_cached(GX_TEVSTAGE3, GX_TEXCOORD3, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE3, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE3);
    GXSetTevKColorSel_cached(GX_TEVSTAGE3, GX_TEV_KCSEL_1_2);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE3, GX_TEV_KASEL_3_4);
    GXSetTevColorIn_cached(GX_TEVSTAGE3, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_CPREV);
    GXSetTevColorOp_cached(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_DIVIDE_2, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE3, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);

    GXSetNumTevStages_cached(4);
    GXSetNumTexGens(4);
    GXSetNumIndStages(0);
    GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZMode_cached(0, GX_ALWAYS, 0);
    GXSetCullMode_cached(GX_CULL_BACK);
    func_8009AC8C();
    temp_f31 = 3.0f / width;
    temp_f30 = 3.0f / height;
    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][3] = temp_f31;
    mathutilData->mtxA[1][3] = 0.0f;
    GXLoadTexMtxImm(mathutilData->mtxA, 30, GX_MTX2x4);
    mathutilData->mtxA[0][3] = -temp_f31;
    mathutilData->mtxA[1][3] = 0.0f;
    GXLoadTexMtxImm(mathutilData->mtxA, 33, GX_MTX2x4);
    mathutilData->mtxA[0][3] = 0.0f;
    mathutilData->mtxA[1][3] = temp_f30;
    GXLoadTexMtxImm(mathutilData->mtxA, 36, GX_MTX2x4);
    mathutilData->mtxA[0][3] = 0.0f;
    mathutilData->mtxA[1][3] = -temp_f30;
    GXLoadTexMtxImm(mathutilData->mtxA, 39, GX_MTX2x4);
    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_TEX0));
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);

    temp_f31_2 = currentCameraStructPtr->sub28.unk38;
    temp_f30_2 = temp_f31_2 * currentCameraStructPtr->sub28.aspect;
    temp_f29 = temp_f30_2 * currentCameraStructPtr->sub28.unk28;
    temp_f28 = temp_f31_2 * currentCameraStructPtr->sub28.unk2C;
    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
    GXPosition3f32(-temp_f30_2 - temp_f29, temp_f31_2 - temp_f28, -1.0f);
    GXTexCoord2f32(0.0f, 0.0f);
    GXPosition3f32(temp_f30_2 - temp_f29, temp_f31_2 - temp_f28, -1.0f);
    GXTexCoord2f32(1.0f, 0.0f);
    GXPosition3f32(temp_f30_2 - temp_f29, -temp_f31_2 - temp_f28, -1.0f);
    GXTexCoord2f32(1.0f, 1.0f);
    GXPosition3f32(-temp_f30_2 - temp_f29, -temp_f31_2 - temp_f28, -1.0f);
    GXTexCoord2f32(0.0f, 1.0f);
    GXEnd();

    GXSetZMode_cached(1, GX_LEQUAL, 1);
}

void func_80095C6C(struct Struct802BA1A0 *arg0)
{
    struct Struct8009557C *temp_r3;
    u32 bufSize;

    arg0->unk8 = 2;
    temp_r3 = OSAlloc(sizeof(*temp_r3));
    if (temp_r3 == NULL)
    {
        arg0->unk0 = 0;
        arg0->unk10 = NULL;
        return;
    }
    arg0->unk10 = temp_r3;
    bufSize = GXGetTexBufferSize(640, 448, 6, 0, 0);
    temp_r3->unk20 = OSAlloc(bufSize);
    if (temp_r3->unk20 == NULL)
    {
        OSFree(temp_r3);
        arg0->unk0 = 0;
        return;
    }
    GXInitTexObj(&temp_r3->unk0, temp_r3->unk20, 640, 448, GX_TF_RGBA8, GX_CLAMP, GX_CLAMP, 0);
}

void func_80095D3C(struct Struct802BA1A0 *arg0)
{
    if (arg0->unk10 != NULL)
    {
        if (arg0->unk10->unk20 != NULL)
            OSFree(arg0->unk10->unk20);
        OSFree(arg0->unk10);
    }
}

void func_80095D90(struct Struct802BA1A0 *arg0) {}

void func_80095D94(int arg0, struct Struct802BA1A0 *arg1)
{
    GXColor sp10;
    Mtx44 sp18;
    u8 unused[4];
    struct Struct8009557C *temp_r31;
    float temp_f30;
    float temp_f31;

    temp_r31 = arg1->unk10;
    C_MTXPerspective(sp18, 59.996338f, 1.3333334f, 0.1f, 20000.0f);
    GXSetProjection(sp18, GX_PERSPECTIVE);
    GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
    GXSetScissor(0, 0, currRenderMode->fbWidth, currRenderMode->xfbHeight);
    GXSetNumChans(0);
    GXLoadTexObj_cached(&temp_r31->unk0, GX_TEXMAP0);
    sp10.a = 192;
    GXSetTevKColor_cached(GX_KCOLOR0, sp10);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE0, GX_TEV_KASEL_K0_A);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 60);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetNumTevStages_cached(1);
    GXSetNumTexGens(1);
    GXSetNumIndStages(0);
    GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZMode_cached(0, GX_ALWAYS, 0);
    GXSetCullMode_cached(GX_CULL_BACK);
    func_8009AC8C();
    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_TEX0));
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0U);
    temp_f31 = mathutil_tan(0x1555U);
    temp_f30 = 1.3333334f * temp_f31;

    GXBegin(GX_QUADS, GX_VTXFMT0, 4U);
    GXPosition3f32(-temp_f30, temp_f31, -1.0f);
    GXTexCoord2f32(0.0f, 0.0f);
    GXPosition3f32(temp_f30, temp_f31, -1.0f);
    GXTexCoord2f32(1.0f, 0.0f);
    GXPosition3f32(temp_f30, -temp_f31, -1.0f);
    GXTexCoord2f32(1.0f, 1.0f);
    GXPosition3f32(-temp_f30, -temp_f31, -1.0f);
    GXTexCoord2f32(0.0f, 1.0f);
    GXEnd();

    GXSetTexCopySrc(0, 0, currRenderMode->fbWidth, currRenderMode->xfbHeight);
    GXSetTexCopyDst(currRenderMode->fbWidth, currRenderMode->xfbHeight, 6, 0);
    GXCopyTex(temp_r31->unk20, 0);
    GXInitTexObj(&temp_r31->unk0, temp_r31->unk20, currRenderMode->fbWidth, currRenderMode->xfbHeight, GX_TF_RGBA8, GX_CLAMP, GX_CLAMP, 0U);
    GXSetZMode_cached(1, GX_LEQUAL, 1);
    camera_apply_viewport(u_cameraId1);
}

struct Struct8009557C_alt_sub
{
    s32 unk0;
    float unk4;
    float unk8;
    float unkC;
};

struct Struct8009557C_alt
{
    GXTexObj unk0;
    void *unk20;
    struct Struct8009557C_alt_sub unk24[4];
};

void func_80096134_inline(struct Struct8009557C_alt *ptr)
{
    int i;
    struct Camera *camera = cameraInfo;
    for (i = 0; i < 4; i++, camera++)
    {
        ptr->unk24[i].unk0 = camera->sub28.fov;
        ptr->unk24[i].unk4 = 1.0f;
        ptr->unk24[i].unk8 = 0.0f;
        ptr->unk24[i].unkC = 0.0f;
        !camera;  // needed to match
    }
}

void func_80096134(struct Struct802BA1A0 *arg0)
{
    struct Struct8009557C_alt *temp_r3;

    arg0->unk8 = 8;
    temp_r3 = OSAlloc(sizeof(*temp_r3));
    if (temp_r3 == NULL)
    {
        arg0->unk0 = 0;
        arg0->unk10 = NULL;
        return;
    }
    arg0->unk10 = (void *)temp_r3;
    temp_r3->unk20 = lbl_802F1B40;
    GXInitTexObj(&temp_r3->unk0, temp_r3->unk20, 640, 448, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0);
    func_80096134_inline(temp_r3);
}

void func_80096228(struct Struct802BA1A0 *arg0)
{
    if (arg0->unk10 != NULL)
        OSFree(arg0->unk10);
}

void func_80096258(struct Struct802BA1A0 *arg0)
{
    int i;
    struct Struct8009557C_alt_sub *r30;
    struct Camera *camera;
    struct Struct8009557C_alt *ptr = (struct Struct8009557C_alt *)arg0->unk10;

    camera = cameraInfo;
    r30 = ptr->unk24;
    for (i = 4; i > 0; i--, camera++, r30++)
    {
        int fov = camera->sub28.fov;
        float f1;
        float f3;

        r30->unkC = 512.0 * __fabs(mathutil_tan(r30->unk0 >> 1) - mathutil_tan(fov >> 1));
        r30->unk0 = fov;
        f1 = mathutil_vec_distance(&camera->eye, &camera->lookAt);
        f3 = r30->unk4 - f1;
        r30->unkC += 64.0 * __fabs(r30->unk8 - f3);
        r30->unk4 = f1;
        r30->unk8 += (f3 - r30->unk8) * 0.2f;
        r30->unkC -= 0.25f;
    }
}

void func_800963AC(int arg0, struct Struct802BA1A0 *arg1)
{
    float temp_f31;
    float temp_f31_2;
    float temp_f30;
    float temp_f30_2;
    float temp_f29;
    float temp_f28;
    float temp_f4;
    float temp_f6;
    float var_f31;
    struct Struct8009557C_alt *temp_r29;
    u16 left;
    u16 top;
    u16 width;
    u16 height;
    u8 unused[8];

    if ((gamePauseStatus & 0xA))
        return;

    temp_r29 = (void *)arg1->unk10;

    if (currentCameraStructPtr->unk26 != 5)
        return;
    var_f31 = temp_r29->unk24[u_cameraId1].unkC;
    if (var_f31 <= 0.0f)
        return;

    if (var_f31 > 5.0f)
        var_f31 = 5.0f;

    temp_f6 = currRenderMode->fbWidth;
    temp_f4 = currRenderMode->xfbHeight;
    left = temp_f6 * currentCameraStructPtr->sub28.vp.left;
    top = temp_f4 * currentCameraStructPtr->sub28.vp.top;
    width = temp_f6 * currentCameraStructPtr->sub28.vp.width;
    height = temp_f4 * currentCameraStructPtr->sub28.vp.height;
    left = left & ~1;
    top = top & ~1;
    width = (width + 1) & ~1;
    height = (height + 1) & ~1;

    GXSetTexCopySrc(left, top, width, height);
    GXSetTexCopyDst(width, height, 4, 0);
    GXCopyTex(temp_r29->unk20, 0);
    GXInitTexObj(&temp_r29->unk0, temp_r29->unk20, width, height, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0U);
    GXSetNumChans(0);
    GXLoadTexObj_cached(&temp_r29->unk0, GX_TEXMAP0);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 0x1E);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetTevKColorSel_cached(GX_TEVSTAGE0, GX_TEV_KCSEL_1_2);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_ZERO);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 0U, GX_TEVPREV);
    GXSetTexCoordGen(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, 0x21);
    GXSetTevOrder_cached(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE1);
    GXSetTevKColorSel_cached(GX_TEVSTAGE1, GX_TEV_KCSEL_1_2);
    GXSetTevColorIn_cached(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_CPREV);
    GXSetTevColorOp_cached(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 0U, GX_TEVPREV);
    GXSetTexCoordGen(GX_TEXCOORD2, GX_TG_MTX2x4, GX_TG_TEX0, 0x24);
    GXSetTevOrder_cached(GX_TEVSTAGE2, GX_TEXCOORD2, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE2);
    GXSetTevKColorSel_cached(GX_TEVSTAGE2, GX_TEV_KCSEL_1_2);
    GXSetTevColorIn_cached(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_CPREV);
    GXSetTevColorOp_cached(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 0U, GX_TEVPREV);
    GXSetTexCoordGen(GX_TEXCOORD3, GX_TG_MTX2x4, GX_TG_TEX0, 0x27);
    GXSetTevOrder_cached(GX_TEVSTAGE3, GX_TEXCOORD3, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevSwapMode_cached(GX_TEVSTAGE3, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE3);
    GXSetTevKColorSel_cached(GX_TEVSTAGE3, GX_TEV_KCSEL_1_2);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE3, GX_TEV_KASEL_3_4);
    GXSetTevColorIn_cached(GX_TEVSTAGE3, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_CPREV);
    GXSetTevColorOp_cached(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_DIVIDE_2, 1U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE3, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetNumTevStages_cached(4);
    GXSetNumTexGens(4);
    GXSetNumIndStages(0);
    GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZMode_cached(0, GX_ALWAYS, 0);
    GXSetCullMode_cached(GX_CULL_BACK);
    func_8009AC8C();
    temp_f30 = var_f31 / width;
    temp_f31 = var_f31 / height;
    mathutil_mtxA_from_identity();
    mathutilData->mtxA[0][3] = temp_f30;
    mathutilData->mtxA[1][3] = 0.0f;
    GXLoadTexMtxImm(mathutilData->mtxA, 30, GX_MTX2x4);
    mathutilData->mtxA[0][3] = -temp_f30;
    mathutilData->mtxA[1][3] = 0.0f;
    GXLoadTexMtxImm(mathutilData->mtxA, 33, GX_MTX2x4);
    mathutilData->mtxA[0][3] = 0.0f;
    mathutilData->mtxA[1][3] = temp_f31;
    GXLoadTexMtxImm(mathutilData->mtxA, 36, GX_MTX2x4);
    mathutilData->mtxA[0][3] = 0.0f;
    mathutilData->mtxA[1][3] = -temp_f31;
    GXLoadTexMtxImm(mathutilData->mtxA, 39, GX_MTX2x4);
    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_TEX0));
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);

    temp_f31_2 = currentCameraStructPtr->sub28.unk38;
    temp_f30_2 = temp_f31_2 * currentCameraStructPtr->sub28.aspect;
    temp_f29 = temp_f30_2 * currentCameraStructPtr->sub28.unk28;
    temp_f28 = temp_f31_2 * currentCameraStructPtr->sub28.unk2C;
    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
    GXPosition3f32(-temp_f30_2 - temp_f29, temp_f31_2 - temp_f28, -1.0f);
    GXTexCoord2f32(0.0f, 0.0f);
    GXPosition3f32(temp_f30_2 - temp_f29, temp_f31_2 - temp_f28, -1.0f);
    GXTexCoord2f32(1.0f, 0.0f);
    GXPosition3f32(temp_f30_2 - temp_f29, -temp_f31_2 - temp_f28, -1.0f);
    GXTexCoord2f32(1.0f, 1.0f);
    GXPosition3f32(-temp_f30_2 - temp_f29, -temp_f31_2 - temp_f28, -1.0f);
    GXTexCoord2f32(0.0f, 1.0f);
    GXEnd();

    GXSetZMode_cached(1, GX_LEQUAL, 1);
}
