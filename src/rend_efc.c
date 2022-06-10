#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "camera.h"
#include "input.h"
#include "event.h"
#include "gxcache.h"
#include "gxutil.h"
#include "mathutil.h"
#include "rend_efc.h"

static struct RenderEffect s_renderEffects[4];

static struct RenderEffectFuncs s_renderEffectFuncs[] =
{
    { NULL,                       NULL,                          NULL,                       NULL                       },
    { rend_efc_blur_init,         rend_efc_blur_destroy,         rend_efc_blur_main,         rend_efc_blur_draw         },
    { rend_efc_motion_blur_init,  rend_efc_motion_blur_destroy,  rend_efc_motion_blur_main,  rend_efc_motion_blur_draw  },
    { rend_efc_focus_init,        rend_efc_focus_destroy,        rend_efc_focus_main,        rend_efc_focus_draw        },
    { rend_efc_kaleidoscope_init, rend_efc_kaleidoscope_destroy, rend_efc_kaleidoscope_main, rend_efc_kaleidoscope_draw },
    { rend_efc_flat_mirror_init,  rend_efc_flat_mirror_destroy,  rend_efc_flat_mirror_main,  rend_efc_flat_mirror_draw  },
    { rend_efc_wavy_mirror_init,  rend_efc_wavy_mirror_destroy,  rend_efc_wavy_mirror_main,  rend_efc_wavy_mirror_draw  },
};

void ev_rend_efc_init(void)
{
    memset(s_renderEffects, 0, sizeof(s_renderEffects));
}

void ev_rend_efc_main(void)
{
    int i;
    struct RenderEffect *rendEfc = s_renderEffects;

    for (i = 4; i > 0; i--, rendEfc++)
    {
        if (rendEfc->state != 0)
        {
            struct RenderEffectFuncs *funcs = rendEfc->funcs;
            void (*main)(struct RenderEffect *) = funcs->main;

            if (main != NULL)
                main(rendEfc);
            if (rendEfc->state == 3)
            {
                if (funcs->destroy != NULL)
                    funcs->destroy(rendEfc);
                rendEfc->state = 0;
            }
        }
    }
}

void ev_rend_efc_dest(void)
{
    int i;
    struct RenderEffect *rendEfc = s_renderEffects;

    for (i = 4; i > 0; i--, rendEfc++)
    {
        if (rendEfc->state != 0)
        {
            void (*destroy)(struct RenderEffect *) = rendEfc->funcs->destroy;

            if (destroy != NULL)
                destroy(rendEfc);
            rendEfc->state = 0;
        }
    }
}

void rend_efc_draw(int enableFlags)
{
    int i;
    struct RenderEffect *rendEfc = s_renderEffects;
    u16 cameraMask = 1 << u_cameraId1;

    for (i = 4; i > 0; i--, rendEfc++)
    {
        if (rendEfc->state != 0 && (rendEfc->enableFlags & enableFlags) && (rendEfc->cameraMask & cameraMask))
        {
            void (*draw)(int, struct RenderEffect *) = rendEfc->funcs->draw;

            if (draw != NULL)
                draw(enableFlags, rendEfc);
        }
    }
}

void rend_efc_enable(int index, int type, struct RenderEffect *params)
{
    struct RenderEffect *rendEfc;

    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
    {
        rendEfc = &s_renderEffects[index];
        if (rendEfc->state != 0)
        {
            void (*destroy)(struct RenderEffect *) = rendEfc->funcs->destroy;
            if (destroy != NULL)
                destroy(rendEfc);
            rendEfc->state = 0;
        }
        memcpy(rendEfc, params, sizeof(*rendEfc));
        if (type != 0)
            rendEfc->funcs = &s_renderEffectFuncs[type];
        if (rendEfc->funcs == NULL)
        {
            rendEfc->state = 0;
            return;
        }
        rendEfc->state = 1;
        if (rendEfc->funcs->init != NULL)
            rendEfc->funcs->init(rendEfc);
        if (rendEfc->state == 3)
        {
            if (rendEfc->funcs->destroy != NULL)
                rendEfc->funcs->destroy(rendEfc);
            rendEfc->state = 0;
        }
    }
}

struct RenderEffectBlur
{
    GXTexObj texObj;
    void *imageBuf;
};

void rend_efc_blur_init(struct RenderEffect *rendEfc)
{
    struct RenderEffectBlur *work;

    rendEfc->enableFlags = 8;
    work = OSAlloc(sizeof(*work));
    if (work == NULL)
    {
        rendEfc->work = NULL;
        rendEfc->state = 0;
        return;
    }
    rendEfc->work = work;
    work->imageBuf = lbl_802F1B40;
    GXInitTexObj(&work->texObj, work->imageBuf, 640, 448, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0);
}

void rend_efc_blur_destroy(struct RenderEffect *rendEfc)
{
    if (rendEfc->work != NULL)
        OSFree(rendEfc->work);
}

void rend_efc_blur_main(struct RenderEffect *rendEfc) {}

void rend_efc_blur_draw(int arg0, struct RenderEffect *rendEfc)
{
    float fbWidth;
    float fbHeight;
    u16 left;
    u16 top;
    u16 width;
    u16 height;
    struct RenderEffectBlur *work;
    float temp_f31;
    float temp_f31_2;
    float temp_f30;
    float temp_f30_2;
    float temp_f29;
    float temp_f28;
    u8 unused[8];

    work = rendEfc->work;

    fbWidth  = currRenderMode->fbWidth;
    fbHeight = currRenderMode->xfbHeight;
    left   = fbWidth * currentCameraStructPtr->sub28.vp.left;
    top    = fbHeight * currentCameraStructPtr->sub28.vp.top;
    width  = fbWidth * currentCameraStructPtr->sub28.vp.width;
    height = fbHeight * currentCameraStructPtr->sub28.vp.height;
    left   = left & ~1;
    top    = top & ~1;
    width  = (width + 1) & ~1;
    height = (height + 1) & ~1;

    GXSetTexCopySrc(left, top, width, height);
    GXSetTexCopyDst(width, height, 4, 0);
    GXCopyTex(work->imageBuf, 0);
    GXInitTexObj(&work->texObj, work->imageBuf, width, height, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0U);
    GXSetNumChans(0);
    GXLoadTexObj_cached(&work->texObj, GX_TEXMAP0);

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

void rend_efc_motion_blur_init(struct RenderEffect *rendEfc)
{
    struct RenderEffectBlur *work;
    u32 bufSize;

    rendEfc->enableFlags = 2;
    work = OSAlloc(sizeof(*work));
    if (work == NULL)
    {
        rendEfc->state = 0;
        rendEfc->work = NULL;
        return;
    }
    rendEfc->work = work;
    bufSize = GXGetTexBufferSize(640, 448, GX_TF_RGBA8, GX_FALSE, 0);
    work->imageBuf = OSAlloc(bufSize);
    if (work->imageBuf == NULL)
    {
        OSFree(work);
        rendEfc->state = 0;
        return;
    }
    GXInitTexObj(&work->texObj, work->imageBuf, 640, 448, GX_TF_RGBA8, GX_CLAMP, GX_CLAMP, 0);
}

void rend_efc_motion_blur_destroy(struct RenderEffect *rendEfc)
{
    if (rendEfc->work != NULL)
    {
        if (((struct RenderEffectBlur *)rendEfc->work)->imageBuf != NULL)
            OSFree(((struct RenderEffectBlur *)rendEfc->work)->imageBuf);
        OSFree(rendEfc->work);
    }
}

void rend_efc_motion_blur_main(struct RenderEffect *rendEfc) {}

void rend_efc_motion_blur_draw(int arg0, struct RenderEffect *rendEfc)
{
    GXColor color;
    Mtx44 sp18;
    u8 unused[4];
    struct RenderEffectBlur *work;
    float temp_f30;
    float temp_f31;

    work = rendEfc->work;
    MTXPerspective(sp18, 59.996338f, 1.3333334f, 0.1f, 20000.0f);
    GXSetProjection(sp18, GX_PERSPECTIVE);
    GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
    GXSetScissor(0, 0, currRenderMode->fbWidth, currRenderMode->xfbHeight);
    GXSetNumChans(0);
    GXLoadTexObj_cached(&work->texObj, GX_TEXMAP0);
    color.a = 192;
    GXSetTevKColor_cached(GX_KCOLOR0, color);
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
    GXCopyTex(work->imageBuf, 0);
    GXInitTexObj(&work->texObj, work->imageBuf, currRenderMode->fbWidth, currRenderMode->xfbHeight, GX_TF_RGBA8, GX_CLAMP, GX_CLAMP, 0U);
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

struct RenderEffectFocus
{
    GXTexObj unk0;
    void *unk20;
    struct Struct8009557C_alt_sub unk24[4];
};

void func_80096134_inline(struct RenderEffectFocus *ptr)
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

void rend_efc_focus_init(struct RenderEffect *rendEfc)
{
    struct RenderEffectFocus *work;

    rendEfc->enableFlags = 8;
    work = OSAlloc(sizeof(*work));
    if (work == NULL)
    {
        rendEfc->state = 0;
        rendEfc->work = NULL;
        return;
    }
    rendEfc->work = work;
    work->unk20 = lbl_802F1B40;
    GXInitTexObj(&work->unk0, work->unk20, 640, 448, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0);
    func_80096134_inline(work);
}

void rend_efc_focus_destroy(struct RenderEffect *rendEfc)
{
    if (rendEfc->work != NULL)
        OSFree(rendEfc->work);
}

void rend_efc_focus_main(struct RenderEffect *rendEfc)
{
    int i;
    struct Struct8009557C_alt_sub *r30;
    struct Camera *camera;
    struct RenderEffectFocus *work = rendEfc->work;

    camera = cameraInfo;
    r30 = work->unk24;
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

void rend_efc_focus_draw(int arg0, struct RenderEffect *rendEfc)
{
    float temp_f31;
    float temp_f31_2;
    float temp_f30;
    float temp_f30_2;
    float temp_f29;
    float temp_f28;
    float var_f31;
    struct RenderEffectFocus *work;
    float fbWidth;
    float fbHeight;
    u16 left;
    u16 top;
    u16 width;
    u16 height;
    u8 unused[8];

    if ((gamePauseStatus & 0xA))
        return;

    work = (void *)rendEfc->work;

    if (currentCameraStructPtr->unk26 != 5)
        return;
    var_f31 = work->unk24[u_cameraId1].unkC;
    if (var_f31 <= 0.0f)
        return;

    if (var_f31 > 5.0f)
        var_f31 = 5.0f;

    fbWidth  = currRenderMode->fbWidth;
    fbHeight = currRenderMode->xfbHeight;
    left   = fbWidth * currentCameraStructPtr->sub28.vp.left;
    top    = fbHeight * currentCameraStructPtr->sub28.vp.top;
    width  = fbWidth * currentCameraStructPtr->sub28.vp.width;
    height = fbHeight * currentCameraStructPtr->sub28.vp.height;
    left   = left & ~1;
    top    = top & ~1;
    width  = (width + 1) & ~1;
    height = (height + 1) & ~1;

    GXSetTexCopySrc(left, top, width, height);
    GXSetTexCopyDst(width, height, 4, 0);
    GXCopyTex(work->unk20, 0);
    GXInitTexObj(&work->unk0, work->unk20, width, height, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0U);
    GXSetNumChans(0);
    GXLoadTexObj_cached(&work->unk0, GX_TEXMAP0);
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

struct RenderEffectKaleidoscope
{
    s32 unk0;
    GXTexObj unk4;
    GXTexObj unk24;
    void *unk44;
    void *unk48;
};

void rend_efc_kaleidoscope_init(struct RenderEffect *rendEfc)
{
    struct RenderEffectKaleidoscope *work;
    size_t bufSize;

    rendEfc->enableFlags = 2;
    work = OSAlloc(sizeof(*work));
    if (work == NULL)
    {
        rendEfc->state = 0;
        rendEfc->work = NULL;
        return;
    }
    rendEfc->work = work;
    work->unk0 = 0;
    bufSize = GXGetTexBufferSize(640, 448, GX_TF_RGB5A3, GX_FALSE, 0);
    work->unk44 = OSAlloc(bufSize);
    if (work->unk44 == NULL)
    {
        OSFree(work);
        rendEfc->state = 0;
        return;
    }
    bufSize = GXGetTexBufferSize(640, 448, GX_TF_I8, GX_FALSE, 0);
    work->unk48 = OSAlloc(bufSize);
    if (work->unk48 == NULL)
    {
        OSFree(work->unk44);
        OSFree(work);
        rendEfc->state = 0;
    }
}

void rend_efc_kaleidoscope_destroy(struct RenderEffect *rendEfc)
{
    struct RenderEffectKaleidoscope *work = (void *)rendEfc->work;

    if (work != NULL)
    {
        if (work->unk44 != NULL)
            OSFree(work->unk44);
        if (((struct RenderEffectKaleidoscope *)rendEfc->work)->unk48 != NULL)
            OSFree(((struct RenderEffectKaleidoscope *)rendEfc->work)->unk48);
        OSFree(rendEfc->work);
    }
}

void rend_efc_kaleidoscope_main(struct RenderEffect *rendEfc)
{
    struct RenderEffectKaleidoscope *work = (void *)rendEfc->work;

    if (controllerInfo[0].unk0[2].button & PAD_BUTTON_A)
    {
        if (++work->unk0 >= 3)
            work->unk0 = 0;
    }
}

void rend_efc_kaleidoscope_draw(int arg0, struct RenderEffect *rendEfc)
{
    GXColor color;
    Mtx44 mtx;
    u8 unused[4];
    struct RenderEffectKaleidoscope *work = (void *)rendEfc->work;
    float temp_f30;
    float temp_f31;

    MTXPerspective(mtx, 59.996338f, 1.3333334f, 0.1f, 20000.0f);
    GXSetProjection(mtx, GX_PERSPECTIVE);
    GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
    GXSetScissor(0U, 0U, currRenderMode->fbWidth, currRenderMode->xfbHeight);
    GXSetNumChans(0U);
    switch (work->unk0)
    {
    case 0:
        GXSetTexCopySrc(192, 112, 256, 256);
        GXSetTexCopyDst(256, 256, 5, 0);
        GXCopyTex(work->unk44, 0);
        GXInitTexObj(&work->unk4, work->unk44, 256, 256, GX_TF_RGB5A3, GX_REPEAT, GX_REPEAT, 0U);
        break;
    case 1:
        GXSetTexCopySrc(192, 112, 256, 256);
        GXSetTexCopyDst(256, 256, 5, 0);
        GXCopyTex(work->unk44, 0);
        GXInitTexObj(&work->unk4, work->unk44, 256, 256, GX_TF_RGB5A3, GX_MIRROR, GX_MIRROR, 0U);
        break;
    case 2:
        GXSetTexCopySrc(0, 0, currRenderMode->fbWidth, currRenderMode->xfbHeight);
        GXSetTexCopyDst(currRenderMode->fbWidth, currRenderMode->xfbHeight, 5, 0);
        GXCopyTex(work->unk44, 0);
        GXInitTexObj(&work->unk4, work->unk44, currRenderMode->fbWidth, currRenderMode->xfbHeight, GX_TF_RGB5A3, GX_CLAMP, GX_CLAMP, 0U);
        GXSetTexCopySrc(0, 0, currRenderMode->fbWidth, currRenderMode->xfbHeight);
        GXSetTexCopyDst(currRenderMode->fbWidth, currRenderMode->xfbHeight, 1, 0);
        GXCopyTex(work->unk48, 0);
        GXInitTexObj(&work->unk24, work->unk48, currRenderMode->fbWidth, currRenderMode->xfbHeight, GX_TF_I8, GX_CLAMP, GX_CLAMP, 0U);
        break;
    }
    switch (work->unk0)
    {
    case 0:
    case 1:
        GXLoadTexObj_cached(&work->unk4, GX_TEXMAP0);
        break;
    case 2:
        GXLoadTexObj_cached(&work->unk24, GX_TEXMAP0);
        break;
    }
    color.a = 0xFF;
    GXSetTevKColor_cached(GX_KCOLOR0, color);
    GXSetTevKAlphaSel_cached(GX_TEVSTAGE0, GX_TEV_KASEL_K0_A);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 0x3CU);
    GXSetTevOrder_cached(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
    GXSetTevSwapMode_cached(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevDirect(GX_TEVSTAGE0);
    GXSetTevColorIn_cached(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevColorOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 0U, GX_TEVPREV);
    GXSetTevAlphaIn_cached(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_KONST);
    GXSetTevAlphaOp_cached(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, 1U, GX_TEVPREV);
    GXSetNumTevStages_cached(1U);
    GXSetNumTexGens(1U);
    GXSetNumIndStages(0U);
    GXSetBlendMode_cached(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZMode_cached(0, GX_ALWAYS, 0);
    GXSetCullMode_cached(GX_CULL_BACK);
    func_8009AC8C();
    gxutil_set_vtx_attrs((1 << GX_VA_POS) | (1 << GX_VA_TEX0));
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    temp_f30 = mathutil_tan(0x1555U);
    temp_f31 = 1.3333334f * temp_f30;
    switch (work->unk0)
    {
    case 0:
        GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3f32(-temp_f31, temp_f30, -1.0f);
        GXTexCoord2f32(0.0f, 0.0f);
        GXPosition3f32(temp_f31, temp_f30, -1.0f);
        GXTexCoord2f32(4.0f, 0.0f);
        GXPosition3f32(temp_f31, -temp_f30, -1.0f);
        GXTexCoord2f32(4.0f, 3.0f);
        GXPosition3f32(-temp_f31, -temp_f30, -1.0f);
        GXTexCoord2f32(0.0f, 3.0f);
        GXEnd();
        break;
    case 1:
        GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3f32(-temp_f31, temp_f30, -1.0f);
        GXTexCoord2f32(0.0f, 0.0f);
        GXPosition3f32(temp_f31, temp_f30, -1.0f);
        GXTexCoord2f32(4.0f, 0.0f);
        GXPosition3f32(temp_f31, -temp_f30, -1.0f);
        GXTexCoord2f32(4.0f, 4.0f);
        GXPosition3f32(-temp_f31, -temp_f30, -1.0f);
        GXTexCoord2f32(0.0f, 4.0f);
        GXEnd();
        break;
    case 2:
        GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3f32(-temp_f31, temp_f30, -1.0f);
        GXTexCoord2f32(0.0f, 0.0f);
        GXPosition3f32(temp_f31, temp_f30, -1.0f);
        GXTexCoord2f32(1.0f, 0.0f);
        GXPosition3f32(temp_f31, -temp_f30, -1.0f);
        GXTexCoord2f32(1.0f, 1.0f);
        GXPosition3f32(-temp_f31, -temp_f30, -1.0f);
        GXTexCoord2f32(0.0f, 1.0f);
        GXEnd();

        GXLoadTexObj_cached(&work->unk4, GX_TEXMAP0);

        GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3f32(0.1 + -temp_f31, temp_f30 - 0.075, -1.0f);
        GXTexCoord2f32(0.0f, 0.0f);
        GXPosition3f32(temp_f31 - 0.1, temp_f30 - 0.075, -1.0f);
        GXTexCoord2f32(1.0f, 0.0f);
        GXPosition3f32(temp_f31 - 0.1, 0.075 + -temp_f30, -1.0f);
        GXTexCoord2f32(1.0f, 1.0f);
        GXPosition3f32(0.1 + -temp_f31, 0.075 + -temp_f30, -1.0f);
        GXTexCoord2f32(0.0f, 1.0f);
        GXEnd();
        break;
    }
    GXSetZMode_cached(1U, GX_LEQUAL, 1U);
    camera_apply_viewport(u_cameraId1);
}
