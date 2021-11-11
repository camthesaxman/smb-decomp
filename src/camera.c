#include <stdlib.h>
#include <string.h>
#include <math.h>

#include <dolphin.h>

#include "global.h"
#include "mathutil.h"
#include "game.h"

void camera_init(void)
{
    int i;
    struct Camera *camera;

    currentCameraStructPtr = &cameraInfo[0];
    lbl_802F1C40 = -1;
    lbl_802F1C34 = -1;

    for (i = 0, camera = &cameraInfo[0]; i < 5; i++, camera++)
    {
        camera->unk204 = i;
        camera->unk1E = 3;
        camera->unk208 = 3;
        camera->unk26 = 0;
        camera->sub28.unk28 = 0.0f;
        camera->sub28.unk2C = 0.0f;
        camera->sub28.unk30 = 0x2AAA;
        camera->sub28.unk32 = 0x2AAA;
        camera->sub28.unk34 = 1.33333333f;
        camera->sub28.unk40 = 0.0f;
        camera->sub28.unk44 = 0.0f;
        camera->sub28.unk48 = 1.0f;
        camera->sub28.unk4C = 1.0f;
    }
    func_80018330(0);
}

void ev_camera_init(void)
{
    int i;
    struct Camera *camera;

    for (i = 0, camera = &cameraInfo[0]; i < 4; i++, camera++)
    {
        camera->unk24 = 0;
        camera_clear(camera);
        camera->unk26 = 0;
        camera->sub28.unk28 = 0.0f;
        camera->sub28.unk2C = 0.0f;
        camera->sub28.unk30 = 0x2AAA;
    }
    func_80018330(0);
}

void (*lbl_80176200[])(struct Camera *, struct Ball *) =
{
    func_80019D74,
    func_80019EB0,
    func_8001A34C,
    func_8001A70C,
    func_8001A840,
    func_8001A96C,
    func_8001AC80,
    func_8001AC84,
    camera_sub_ringout_main,
    func_8001B13C,
    camera_sub_ready_init,
    camera_sub_ready_main,
    func_800193AC,
    camera_sub_13,
    func_8001B140,
    camera_sub_goal_main,
    func_8001B478,
    camera_sub_17,
    func_8001BDDC,
    func_8001C0C4,
    func_8001C368,
    func_8001C5FC,
    camera_sub_22_23_24,
    camera_sub_22_23_24,
    camera_sub_22_23_24,
    func_8001C7D8,
    camera_sub_26,
    func_80018DC8,
    func_80018E34,
    func_80018E38,
    func_80018E6C,
    func_8001CAB8,
    func_8001CBB0,
    func_8001CD4C,
    func_8001CF28,
    func_8001D32C,
    camera_sub_36,
    func_8001D708,
    func_80019CA4,
    func_8001D968,
    func_8001D96C,
    func_8001D970,
    camera_sub_42,
    func_80019284,
    func_8001DDF0,
    func_8001E0A8,
    func_8001E2E8,
    camera_sub_47,
    func_8001E924,
    camera_sub_49,
    func_8001F524,
    func_8001F560,
    func_800196E8,
    func_800197AC,
    func_80018FA4,
    func_80018FE4,
    func_8001F698,
    func_8001F864,
    func_80020A88,
    func_80020A88,
    func_80020A88,
    func_80020A88,
    func_8001A7A4,
    func_8001FAA4,
    func_80020A88,
    func_80020A88,
    func_8001FADC,
    func_80020A88,
    func_8001FB14,
    func_8001FBA8,
    func_8002049C,
    camera_sub_71,
    func_80020910,
    camera_sub_73,
    func_80020A88,
};

static inline float sum_of_sq(register float a, register float b)
{
#ifdef __MWERKS__
    asm
    {
        fmuls a, a, a
        fmadds a, b, b, a
    }
    return a;
#else
    return a * a + b * b;
#endif
}

void ev_camera_main(void)
{
    int i;
    struct Camera *camera;
    struct Ball *ball;
    s8 *r22;
    Vec sp8;

    if (dipSwitches & DIP_DEBUG)
    {
        if ((dipSwitches & DIP_TEST_CAM) && (lbl_801F3B70[0].unk18 & (1<<(31-0x14))))
            dipSwitches ^= DIP_NO_INTR;
        if ((lbl_801F3B70[0].unk0 & (1<<(31-0x16))) && (lbl_801F3B70[0].unk18 & (1<<(31-0x14))))
        {
            if (dipSwitches & DIP_TEST_CAM)
                dipSwitches &= ~DIP_TEST_CAM;
            else if (lbl_802F1EE0 & 1)
            {
                dipSwitches |= DIP_TEST_CAM;
                dipSwitches &= ~DIP_NO_INTR;
            }
        }
    }

    r22 = spritePoolInfo.unkC;
    for (i = 0, camera = &cameraInfo[0], ball = &lbl_80205E60[0]; i < 4; i++, camera++, ball++, r22++)
    {
        if ((*r22 != 0 && *r22 != 4)
         || (camera->unk24 & (1<<(31-0x1B)))
         || (camera->unk24 & (1<<(31-0x18))))
        {
            camera->unk24 &= ~1;
            if (dipSwitches & DIP_TEST_CAM)
                lbl_80176200[2](camera, ball);
            else
                lbl_80176200[camera->unk1E](camera, ball);
            mathutil_mtxA_from_translate(&ball->unk4);
            mathutil_mtxA_rotate_y(camera->unk1A);
            mathutil_mtxA_rigid_inv_tf_point(&camera->unk0, &camera->unkBC);
            mathutil_mtxA_rigid_inv_tf_point(&camera->unkC, &camera->unkC8);
            mathutil_mtx_copy(camera->unk144, camera->unk174);
            mathutil_mtx_copy(camera->unk1A4, camera->unk1D4);
            mathutil_mtxA_from_identity();
            mathutil_mtxA_rotate_z(-camera->unk1C);
            mathutil_mtxA_rotate_x(-camera->unk18);
            mathutil_mtxA_rotate_y(-camera->unk1A);
            mathutil_mtxA_translate_neg(&camera->unk0);
            if (!(camera->unk24 & (1<<(31-0x1D))))
            {
                mathutil_mtxA_to_mtx(camera->unk1A4);
                if (eventInfo[2].state == 2 && !(camera->unk24 & (1<<(31-0x1C))))
                {
                    mathutil_mtxA_translate(&ball->unk4);
                    mathutil_mtxA_rotate_x(lbl_80206BF0[i].unk0 * 0.6);
                    mathutil_mtxA_rotate_z(lbl_80206BF0[i].unk2 * 0.6);
                    mathutil_mtxA_translate_neg(&ball->unk4);
                }
                mathutil_mtxA_to_mtx(camera->unk144);
            }
            else
            {
                mathutil_mtxA_push();
                mathutil_mtxA_translate(&ball->unk4);
                mathutil_mtxA_rotate_z(-lbl_80206BF0[i].unk2 >> 1);
                mathutil_mtxA_rotate_x(-lbl_80206BF0[i].unk0 >> 1);
                mathutil_mtxA_translate_neg(&ball->unk4);
                mathutil_mtxA_to_mtx(camera->unk1A4);
                mathutil_mtxA_pop();
                mathutil_mtxA_translate(&ball->unk4);
                mathutil_mtxA_rotate_x(lbl_80206BF0[i].unk0 >> 1);
                mathutil_mtxA_rotate_z(lbl_80206BF0[i].unk2 >> 1);
                mathutil_mtxA_translate_neg(&ball->unk4);
                mathutil_mtxA_to_mtx(camera->unk144);
            }

            switch (camera->unk26)
            {
            case 1:
                camera->sub28.unk28 = 0.0f;
                camera->sub28.unk2C = 0.0f;
                break;
            case 2:
            case 3:
                if (camera->sub28.unk28 < 0.0)
                {
                    camera->sub28.unk28 += 0.0041666666666666666;
                    if (camera->sub28.unk28 > 0.0)
                        camera->sub28.unk28 = 0.0f;
                }
                else if (camera->sub28.unk28 > 0.0)
                {
                    camera->sub28.unk28 -= 0.0041666666666666666;
                    if (camera->sub28.unk28 < 0.0)
                        camera->sub28.unk28 = 0.0f;
                }
                if (camera->sub28.unk2C < 0.0)
                {
                    camera->sub28.unk2C += 0.0041666666666666666;
                    if (camera->sub28.unk2C > 0.0)
                        camera->sub28.unk2C = 0.0f;
                }
                else if (camera->sub28.unk2C > 0.0)
                {
                    camera->sub28.unk2C -= 0.0041666666666666666;
                    if (camera->sub28.unk2C < 0.0)
                        camera->sub28.unk2C = 0.0f;
                }
                break;
            case 4:
                camera->sub28.unk28 = 0.0f;
                camera->sub28.unk2C = -0.375f;
                break;
            case 0:
                camera->sub28.unk28 = 0.0f;
                camera->sub28.unk2C = 0.0f;
                break;
            case 5:
                camera->sub28.unk28 = 0.0f;
                camera->sub28.unk2C = 0.0f;
                if (lbl_802F1EE0 & 0xA)
                    break;
                mathutil_mtxA_from_mtx(camera->unk144);
                mathutil_mtxA_tf_point(&ball->unk4, &sp8);
                if (sp8.z > 0.0)
                    camera->sub28.unk30 = 0x5555;
                else
                {
                    float f1 = 2.0 * ball->unk68 + mathutil_sqrt(sum_of_sq(sp8.x, sp8.y));
                    s16 r0 = mathutil_atan2(f1, -sp8.z) * 2;
                    if (r0 > 0x5555)
                        r0 = 0x5555;
                    else if (r0 < 0x4FA)
                        r0 = 0x4FA;
                    camera->sub28.unk30 += (r0 - camera->sub28.unk30) >> 5;
                }
                break;
            case 6:
                switch (modeCtrl.unk4)
                {
                case 0:
                    if (camera->unk50 <= 0x474)
                    {
                        camera->sub28.unk28 = 0.0f;
                        camera->sub28.unk2C = 0.0f;
                    }
                    else
                    {
                        camera->sub28.unk28 = 0.0f;
                        camera->sub28.unk2C = 0.0f;
                    }
                    break;
                default:
                    if (camera->unk50 <= 0x474)
                    {
                        camera->sub28.unk28 = -0.3f;
                        camera->sub28.unk2C = 0.0f;
                    }
                    else
                    {
                        camera->sub28.unk28 = 0.0f;
                        camera->sub28.unk2C = 0.0f;
                    }
                }
                camera->sub28.unk30 = 0x1555;
                break;
            case 7:
                camera->sub28.unk28 = 0.0f;
                camera->sub28.unk2C = -0.54f;
                break;
            case 8:
                camera->sub28.unk28 = 0.0f;
                camera->sub28.unk2C = 0.0f;
                break;
            case 10:
                if (i == 0)
                    camera->sub28.unk30 = lbl_802F1C30;
                else
                    camera->sub28.unk30 = 0x1000;
                break;
            case 12:
                if (lbl_802F21E8 != 0)
                {
                    camera->sub28.unk28 = lbl_802F21EC;
                    camera->sub28.unk2C = lbl_802F21F0;
                    camera->sub28.unk30 = 182.044444f * lbl_802F16B8;
                }
                break;
            }
            camera->sub28.unk38 = mathutil_tan(camera->sub28.unk30 >> 1);
            camera->sub28.unk3C = 1.0 / camera->sub28.unk38;
            func_80018C58(camera);
        }
    }
    func_80018330(0);
}

void ev_camera_dest(void) {}

void func_80020AB8(Vec *, S16Vec *, float, float, float, float);

void func_80017FCC(void)
{
    u8 unused[0x10];
    Mtx sp1C;

    currentCameraStructPtr = &cameraInfo[0];
    lbl_802F1C40 = 4;
    lbl_802F1C34 = 4;
    mathutil_mtx_copy(cameraInfo[0].unk144, mathutilData->mtxB);
    mathutil_mtx_copy(mathutilData->mtxB, lbl_802F1B3C[2]);
    mathutil_mtx_copy(cameraInfo[0].unk174, lbl_802F1B3C[3]);
    mathutil_mtx_copy(cameraInfo[0].unk1A4, lbl_802F1B3C[0]);
    mathutil_mtx_copy(cameraInfo[0].unk1D4, lbl_802F1B3C[4]);
    C_MTXPerspective(sp1C, 59.996337f, 1.33333333f, 0.1f, 20000.0f);
    GXSetProjection(sp1C, 0);
    GXSetViewport(0.0f, 0.0f, currRenderMode->fbWidth, currRenderMode->xfbHeight, 0.0f, 1.0f);
    GXSetScissor(0, 0, currRenderMode->fbWidth, currRenderMode->xfbHeight);
    func_80020AB8(&(Vec){0.0f, 0.0f, 0.0f}, &(S16Vec){0, 0, 0}, 59.996337, 1.33333333, 0.0f, 0.0f);
}

void setup_camera_viewport(int cameraId, float left, float top, float width, float height)
{
    struct Camera *camera = &cameraInfo[cameraId];

    camera->sub28.unk40 = left;
    camera->sub28.unk44 = top;
    camera->sub28.unk48 = width;
    camera->sub28.unk4C = height;
    if (width > 0.0f && height > 0.0f)
    {
        camera->sub28.unk34 = 1.33333333f * (width / height);
        if (height == 1.0f)
            camera->sub28.unk32 = 0x2AAA;
        else
        {
            float f1 = (0.5f + 0.5f * height) * mathutil_tan(0x1555);
            s16 r0 = mathutil_atan2(f1, 1.0f) * 2;
            camera->sub28.unk32 = r0;
            camera->sub28.unk30 = camera->sub28.unk32;
        }
    }
    if (lbl_802F1C40 == cameraId)
        func_80018330(cameraId);
}

struct PlayerViewport
{
    float left;
    float top;
    float width;
    float height;
};

struct PlayerViewport onePlayerViewports[] =
{
    {0.0f, 0.0f, 1.0f, 1.0f},  // whole screen
};
struct PlayerViewport twoPlayerViewports[] =
{
    {0.0f, 0.0f, 1.0f, 0.5f},  // top half
    {0.0f, 0.5f, 1.0f, 0.5f},  // bottom half
};
struct PlayerViewport threePlayerViewports[] =
{
    {0.0f, 0.0f, 1.0f, 0.5f},  // top half
    {0.0f, 0.5f, 0.5f, 0.5f},  // bottom left quadrant
    {0.5f, 0.5f, 0.5f, 0.5f},  // bottom right quadrant
};
struct PlayerViewport fourPlayerViewports[] =
{
    {0.0f, 0.0f, 0.5f, 0.5f},  // top left quadrant
    {0.5f, 0.0f, 0.5f, 0.5f},  // top right quadrant
    {0.0f, 0.5f, 0.5f, 0.5f},  // bottom left quadrant
    {0.5f, 0.5f, 0.5f, 0.5f},  // bottom right quadrant
};
struct PlayerViewport *splitscreenViewports[] =
{
    onePlayerViewports,
    twoPlayerViewports,
    threePlayerViewports,
    fourPlayerViewports
};

void camera_setup_splitscreen_viewports(int playerCount)
{
    int i;
    struct PlayerViewport *vp;

    if (playerCount < 1 || playerCount > 4)
        OSPanic("camera.c", 598, "Ielligal player number");
    vp = splitscreenViewports[playerCount - 1];
    for (i = 0; i < 4; i++)
    {
        if (i >= playerCount)
            setup_camera_viewport(i, 0.0f, 0.0f, 0.0f, 0.0f);
        else
        {
            setup_camera_viewport(i, vp->left, vp->top, vp->width, vp->height);
            vp++;
        }
    }
}

void camera_setup_singleplayer_viewport(void)
{
    int i;

    for (i = 0; i < 4; i++)
        setup_camera_viewport(i, 0.0f, 0.0f, 0.0f, 0.0f);
    setup_camera_viewport(0, 0.0f, 0.0f, 1.0f, 1.0f);
}

void func_80018330(int cameraId)
{
    u8 unused[0x10];
    struct Camera *camera = &cameraInfo[cameraId];
    Mtx projMtx;

    lbl_802F1C40 = cameraId;
    lbl_802F1C34 = cameraId;
    currentCameraStructPtr = camera;
    mathutil_mtx_copy(camera->unk144, mathutilData->mtxB);
    mathutil_mtx_copy(mathutilData->mtxB, lbl_802F1B3C[2]);
    mathutil_mtx_copy(camera->unk174, lbl_802F1B3C[3]);
    mathutil_mtx_copy(camera->unk1A4, lbl_802F1B3C[0]);
    mathutil_mtx_copy(camera->unk1D4, lbl_802F1B3C[4]);
    mathutil_mtx_copy(lbl_802F1B3C[0], lbl_802F1B3C[1]);
    lbl_802F1B3C[1][0][3] = 0.0f;
    lbl_802F1B3C[1][1][3] = -camera->unk0.y;
    lbl_802F1B3C[1][2][3] = 0.0f;
    if (gameMode == MD_MINI && gameSubmode == SMD_MINI_BILLIARDS_MAIN && cameraId == 0)
    {
        C_MTXPerspective(
            projMtx,
            camera->sub28.unk30 * (360.0f / 65536.0f),
            camera->sub28.unk34,
            0.17320509254932404f / camera->sub28.unk38,
            20000.0f);
    }
    else
    {
        C_MTXPerspective(
            projMtx,
            camera->sub28.unk30 * (360.0f / 65536.0f),
            camera->sub28.unk34,
            0.1f,
            20000.0f);
    }
    projMtx[0][2] -= projMtx[0][0] * camera->sub28.unk28 * camera->sub28.unk34 * camera->sub28.unk38;
    projMtx[1][2] -= projMtx[1][1] * camera->sub28.unk2C * camera->sub28.unk38;
    GXSetProjection(projMtx, 0);
    if (camera->sub28.unk48 > 0.0f && camera->sub28.unk4C > 0.0f)
    {
        float fbW = currRenderMode->fbWidth;
        float fbH = currRenderMode->xfbHeight;
        float left   = fbW * camera->sub28.unk40;
        float top    = fbH * camera->sub28.unk44;
        float width  = fbW * camera->sub28.unk48;
        float height = fbH * camera->sub28.unk4C;
        GXSetViewport(left, top, width, height, 0.0f, 1.0f);
        GXSetScissor(left, top, width, height);
    }
    func_80020AB8(
        &camera->unk0,
        &(S16Vec){camera->unk18, camera->unk1A, camera->unk1C},
        camera->sub28.unk30 * (360.0f / 65536.0f),
        camera->sub28.unk34,
        camera->sub28.unk28,
        camera->sub28.unk2C);
}

void func_80018648(int a)
{
    if (lbl_802F1C40 != a || lbl_802F1C34 != a)
        func_80018330(a);
}

// almost identical to func_80018330
void func_80018680(int cameraId)
{
    u8 unused[0x10];
    struct Camera *camera = &cameraInfo[cameraId];
    Mtx projMtx;

    lbl_802F1C40 = cameraId;
    currentCameraStructPtr = camera;
    mathutil_mtx_copy(camera->unk144, mathutilData->mtxB);
    mathutil_mtx_copy(mathutilData->mtxB, lbl_802F1B3C[2]);
    mathutil_mtx_copy(camera->unk174, lbl_802F1B3C[3]);
    mathutil_mtx_copy(camera->unk1A4, lbl_802F1B3C[0]);
    mathutil_mtx_copy(camera->unk1D4, lbl_802F1B3C[4]);
    mathutil_mtx_copy(lbl_802F1B3C[0], lbl_802F1B3C[1]);
    lbl_802F1B3C[1][0][3] = 0.0f;
    lbl_802F1B3C[1][1][3] = -camera->unk0.y;
    lbl_802F1B3C[1][2][3] = 0.0f;
    if (gameMode == MD_MINI && gameSubmode == SMD_MINI_BILLIARDS_MAIN && cameraId == 0)
    {
        C_MTXPerspective(
            projMtx,
            camera->sub28.unk30 * (360.0f / 65536.0f),
            camera->sub28.unk34,
            0.17320509254932404f / camera->sub28.unk38,
            20000.0f);
    }
    else
    {
        C_MTXPerspective(
            projMtx,
            camera->sub28.unk30 * (360.0f / 65536.0f),
            camera->sub28.unk34,
            0.1f,
            20000.0f);
    }
    projMtx[0][2] -= projMtx[0][0] * camera->sub28.unk28 * camera->sub28.unk34 * camera->sub28.unk38;
    projMtx[1][2] -= projMtx[1][1] * camera->sub28.unk2C * camera->sub28.unk38;
    GXSetProjection(projMtx, 0);
    func_80020AB8(
        &camera->unk0,
        &(S16Vec){camera->unk18, camera->unk1A, camera->unk1C},
        camera->sub28.unk30 * (360.0f / 65536.0f),
        camera->sub28.unk34,
        camera->sub28.unk28,
        camera->sub28.unk2C);
}

void func_800188A8(int cameraId)
{
    if (lbl_802F1C40 != cameraId)
        func_80018680(cameraId);
}

void func_800188D4(void)
{
    u8 unused[0x10];
    struct Camera *camera = &cameraInfo[0];
    Mtx projMtx;

    C_MTXPerspective(
        projMtx,
        camera->sub28.unk30 * (360.0f / 65536.0f),
        camera->sub28.unk34,
        0.1f,
        20000.0f);
    projMtx[0][2] -= projMtx[0][0] * camera->sub28.unk28 * camera->sub28.unk34 * camera->sub28.unk38;
    projMtx[1][2] -= projMtx[1][1] * camera->sub28.unk2C * camera->sub28.unk38;
    GXSetProjection(projMtx, 0);
}

void func_8001898C(int cameraId, int b, Vec *c)
{
    struct Camera *camera = &cameraInfo[cameraId];

    camera->unkEC = 1;
    camera->unk100 += c->x;
    camera->unk104 += c->y;
    camera->unk108 += c->z;
    if (b < 0 || camera->unkF0 < 0)
        camera->unkF0 = -1;
    else if (camera->unkF0 < b)
        camera->unkF0 = b;
}

void camera_set_state(int state)
{
    int i;
    struct Camera *camera;

    for (i = 0, camera = &cameraInfo[0]; i < 4; i++, camera++)
    {
        if (!(camera->unk24 & (1<<(31-0x1A))))
        {
            camera->unk1E = state;
            camera->unk1F = 0;
        }
    }
}

void camera_set_or_clear_flags(int flags, int set)
{
    int i;
    struct Camera *camera = &cameraInfo[0];

    if (set)
    {
        for (i = 0; i < 4; i++, camera++)
            camera->unk24 |= flags;
    }
    else
    {
        for (i = 0; i < 4; i++, camera++)
            camera->unk24 &= ~flags;
    }
}

// matches except for a few instruction swaps
#ifdef NONMATCHING
void camera_clear(struct Camera *camera)
{
    struct Camera backup;
    u32 unused;
    struct Camera *r3;

    // TODO: try permuting the order of these assignments
    backup.unk204 = camera->unk204;
    backup.unk24 = camera->unk24 & 0x50;
    backup.unk1E = camera->unk1E;
    backup.unk26 = camera->unk26;
    backup.sub28 = camera->sub28;
    backup.unk1F = camera->unk1F;
    memset(camera, 0, sizeof(*camera));
    camera->unk204 = backup.unk204;
    camera->unk1E = backup.unk1E;
    camera->unk24 |= backup.unk24 | 1;
    camera->unk26 = backup.unk26;
    camera->sub28 = backup.sub28;
    camera->unk1F = backup.unk1F;

    camera->unk0.z = 10.0f;
    camera->sub28.unk30 = camera->sub28.unk32;
    camera->unk20 = 1.0f;

    r3 = &cameraInfo[camera->unk204];
    r3->unkEC = 0;
    r3->unkF0 = 0;
    r3->unkF4.x = 0.0f;
    r3->unkF4.y = 0.0f;
    r3->unkF4.z = 0.0f;
    r3->unk100 = 0.0f;
    r3->unk104 = 0.0f;
    r3->unk108 = 0.0f;
}
#else
asm void camera_clear(struct Camera *camera)
{
    nofralloc
#include "../asm/nonmatchings/camera_clear.s"
}
#endif
#pragma peephole on

void func_80018C58(struct Camera *camera)
{
    if (camera->unkEC != 0)
    {
        camera->unk100 -= 0.75 * camera->unkF4.x;
        camera->unk104 -= 0.75 * camera->unkF4.y;
        camera->unk108 -= 0.75 * camera->unkF4.z;

        camera->unk100 *= 0.85;
        camera->unk104 *= 0.85;
        camera->unk108 *= 0.85;

        camera->unkF4.x += camera->unk100;
        camera->unkF4.y += camera->unk104;
        camera->unkF4.z += camera->unk108;

        mathutil_mtxA_from_mtx(camera->unk144);
        mathutil_mtxA_translate(&camera->unkF4);
        mathutil_mtxA_to_mtx(camera->unk144);

        mathutil_mtxA_from_mtx(camera->unk1A4);
        mathutil_mtxA_translate(&camera->unkF4);
        mathutil_mtxA_to_mtx(camera->unk1A4);

        if (camera->unkF0 > 0)
        {
            camera->unkF0--;
            if (camera->unkF0 == 0)
            {
                struct Camera *r3 = &cameraInfo[camera->unk204];
                r3->unkEC = 0;
                r3->unkF0 = 0;
                r3->unkF4.x = 0.0f;
                r3->unkF4.y = 0.0f;
                r3->unkF4.z = 0.0f;
                r3->unk100 = 0.0f;
                r3->unk104 = 0.0f;
                r3->unk108 = 0.0f;
            }
        }
    }
}

void func_80018DC8(struct Camera *camera, struct Ball *ball)
{
    camera_clear(camera);

    camera->unk0.x = 0.0f;
    camera->unk0.y = 0.0f;
    camera->unk0.z = 280.0f;

    camera->unkC.x = 0.0f;
    camera->unkC.y = 0.0f;
    camera->unkC.z = 0.0f;

    camera->sub28.unk30 = 0xB6;
    camera->unk18 = 0;
    camera->unk1A = 0;
    camera->unk1C = 0;
    camera->unk1E = 28;
}

void func_80018E34(struct Camera *camera, struct Ball *ball) {}

void func_80018E38(struct Camera *camera, struct Ball *ball)
{
    camera_clear(camera);
    camera->unk1E = 30;
}

struct Struct80176434 lbl_80176434[] =
{
    {   0,  -15.414, 0, 0},
    { 165,  -14.751, 0, 0},
    { 330,  -14.751, 0, 0},
    { 433,  -14.751, 0, 0},
    { 434,     -0.2, 0, 0},
    { 651,   -2.825, 0, 0},
    { 652, -453.165, 0, 0},
    { 869, -453.165, 0, 0},
    { 870,    2.567, 0, 0},
    {1087,    2.567, 0, 0},
    {1088,        0, 0, 0},
    {1198,        0, 0, 0},
    {1228,    9.071, 0, 0},
    {1305,    9.071, 0, 0},
    {1306,        0, 0, 0},
    {2902,        0, 0, 0},
    {   0,  -58.546, 0, 0},
    { 165,  -58.744, 0, 0},
    { 330,  -58.744, 0, 0},
    { 433,  -58.744, 0, 0},
    { 434,    -0.02, 0, 0},
    { 651,    0.963, 0, 0},
    { 652,  -46.452, 0, 0},
    { 869,  -46.425, 0, 0},
    { 870,    1.229, 0, 0},
    {1087,    1.229, 0, 0},
    {1088,        0, 0, 0},
    {1198,        0, 0, 0},
    {1228,    0.498, 0, 0},
    {1305,    0.498, 0, 0},
    {1306,        0, 0, 0},
    {2902,        0, 0, 0},
    {   0,  -45.335, 0, 0},
    { 165,  -44.541, 0, 0},
    { 330,  -44.541, 0, 0},
    { 434,  -44.541, 0, 0},
    { 434,   - 0.78, 0, 0},
    { 651,     -4.9, 0, 0},
    { 652, -237.234, 0, 0},
    { 869, -237.234, 0, 0},
    { 870,   -2.444, 0, 0},
    {1087,   -2.444, 0, 0},
    {1088,        0, 0, 0},
    {1198,        0, 0, 0},
    {1228,    8.702, 0, 0},
    {1305,    8.702, 0, 0},
    {1306,        1, 0, 0},
    {2902,        1, 0, 0},
    {   0,  -40.265, 0, 0},
    { 165,  -20.647, 0, 0},
    { 330,  -20.647, 0, 0},
    { 434,  -21.243, 0, 0},
    { 434,      0.2, 0, 0},
    { 651,     0.23, 0, 0},
    { 652, -438.964, 0, 0},
    { 869, -438.964, 0, 0},
    { 870,   -3.049, 0, 0},
    {1087,   -3.049, 0, 0},
    {1088,  -80.677, 0, 0},
    {1198,    71.51, 0, 0},
    {1228,   73.012, 0, 0},
    {1305,   73.012, 0, 0},
    {1306,        0, 0, 0},
    {2902,        0, 0, 0},
    {   0,  -51.904, 0, 0},
    { 165,  -51.302, 0, 0},
    { 330,  -51.302, 0, 0},
    { 434,  -20.305, 0, 0},
    { 434,      0.5, 0, 0},
    { 651,    1.678, 0, 0},
    { 652,  -47.321, 0, 0},
    { 869,  -47.321, 0, 0},
    { 870,    1.102, 0, 0},
    {1087,    1.102, 0, 0},
    {1088,   19.309, 0, 0},
    {1198,    0.792, 0, 0},
    {1228,    0.545, 0, 0},
    {1305,    0.545, 0, 0},
    {1306,        0, 0, 0},
    {2902,        0, 0, 0},
    {   0,  -30.959, 0, 0},
    { 165,  -11.428, 0, 0},
    { 330,  -11.428, 0, 0},
    { 434,  -31.099, 0, 0},
    { 434,     0.57, 0, 0},
    { 651,   -0.039, 0, 0},
    { 652, -216.187, 0, 0},
    { 869, -216.187, 0, 0},
    { 870,   -1.408, 0, 0},
    {1087,   -1.408, 0, 0},
    {1088,  145.504, 0, 0},
    {1198,    85.81, 0, 0},
    {1228,  100.036, 0, 0},
    {1305,  100.036, 0, 0},
    {1306,        0, 0, 0},
    {2902,        0, 0, 0},
    {   0,        0, 0, 0},
    {1306,     0.74, 0, 0},
    {1525,     1.12, 0, 0},
    {1526,    -0.76, 0, 0},
    {1636,    -0.76, 0, 0},
    {1739,    -1.06, 0, 0},
    {1740,    -4.35, 0, 0},
    {1849,    -2.92, 0, 0},
    {1850,     1.65, 0, 0},
    {1953,     0.82, 0, 0},
    {1954,    7.474, 0, 0},
    {2063,     9.12, 0, 0},
    {2064,    -0.85, 0, 0},
    {2167,    -0.85, 0, 0},
    {2168,     -4.1, 0, 0},
    {2277,    -3.47, 0, 0},
    {2278,     0.73, 0, 0},
    {2497,     5.43, 0, 0},
    {2498,        0, 0, 0},
    {2602,        0, 0, 0},
    {2902,        0, 0, 0},
    {   0,        0, 0, 0},
    {1306,     -0.4, 0, 0},
    {1525,     0.15, 0, 0},
    {1526,     0.17, 0, 0},
    {1636,     0.17, 0, 0},
    {1739,     0.17, 0, 0},
    {1740,   -1.777, 0, 0},
    {1849,    -1.87, 0, 0},
    {1850,     0.06, 0, 0},
    {1953,     0.05, 0, 0},
    {1954,     0.29, 0, 0},
    {2063,     0.59, 0, 0},
    {2064,        0, 0, 0},
    {2167,        0, 0, 0},
    {2168,     0.19, 0, 0},
    {2277,    -0.01, 0, 0},
    {2278,    -0.24, 0, 0},
    {2497,     1.14, 0, 0},
    {2498,    -42.5, 0, 0},
    {2602,   -42.43, 0, 0},
    {2902,   -42.43, 0, 0},
    {   0,        1, 0, 0},
    {1306,    -0.24, 0, 0},
    {1525,    -0.51, 0, 0},
    {1526,     1.13, 0, 0},
    {1636,     1.13, 0, 0},
    {1739,      0.5, 0, 0},
    {1740,       -5, 0, 0},
    {1849,     -4.8, 0, 0},
    {1850,     0.51, 0, 0},
    {1953,        0, 0, 0},
    {1954,     0.22, 0, 0},
    {2063,     2.54, 0, 0},
    {2064,     0.78, 0, 0},
    {2167,     0.78, 0, 0},
    {2168,     -0.2, 0, 0},
    {2277,    -0.93, 0, 0},
    {2278,     -1.9, 0, 0},
    {2497,     -0.9, 0, 0},
    {2498,   124.31, 0, 0},
    {2602,   115.56, 0, 0},
    {2902,   115.56, 0, 0},
    {   0,        0, 0, 0},
    {1306,    -0.02, 0, 0},
    {1525,    0.012, 0, 0},
    {1526,      0.3, 0, 0},
    {1636,      0.3, 0, 0},
    {1739,     1.22, 0, 0},
    {1740,      1.4, 0, 0},
    {1849,       -1, 0, 0},
    {1850,    -4.18, 0, 0},
    {1953,    -4.06, 0, 0},
    {1954,      6.5, 0, 0},
    {2063,     6.44, 0, 0},
    {2064,     1.85, 0, 0},
    {2167,     1.85, 0, 0},
    {2168,     -1.4, 0, 0},
    {2277,    -0.89, 0, 0},
    {2278,     -4.9, 0, 0},
    {2497,    -1.26, 0, 0},
    {2498,        0, 0, 0},
    {2602,        0, 0, 0},
    {2902,        0, 0, 0},
    {   0,        0, 0, 0},
    {1306,     0.19, 0, 0},
    {1525,        0, 0, 0},
    {1526,    -0.08, 0, 0},
    {1636,    -0.08, 0, 0},
    {1739,        0, 0, 0},
    {1740,       -2, 0, 0},
    {1849,       -3, 0, 0},
    {1850,    -0.05, 0, 0},
    {1953,    -0.05, 0, 0},
    {1954,      0.5, 0, 0},
    {2063,     0.34, 0, 0},
    {2064,     -0.1, 0, 0},
    {2167,     -0.1, 0, 0},
    {2168,     1.22, 0, 0},
    {2277,    -0.03, 0, 0},
    {2278,    -0.06, 0, 0},
    {2497,    -1.81, 0, 0},
    {2498,   -41.96, 0, 0},
    {2602,   -40.38, 0, 0},
    {2902,   -40.38, 0, 0},
    {   0,        0, 0, 0},
    {1306,    -0.06, 0, 0},
    {1525,    -0.06, 0, 0},
    {1526,    -1.28, 0, 0},
    {1636,    -1.28, 0, 0},
    {1739,    -0.68, 0, 0},
    {1740,      8.1, 0, 0},
    {1849,      8.6, 0, 0},
    {1850,     0.72, 0, 0},
    {1953,     1.09, 0, 0},
    {1954,      2.7, 0, 0},
    {2063,     3.95, 0, 0},
    {2064,     -1.3, 0, 0},
    {2167,     -1.3, 0, 0},
    {2168,    -3.37, 0, 0},
    {2277,    -0.01, 0, 0},
    {2278,     5.44, 0, 0},
    {2497,     3.33, 0, 0},
    {2498,   116.31, 0, 0},
    {2602,   107.49, 0, 0},
    {2902,   107.49, 0, 0},
};

void func_80018E6C(struct Camera *camera, struct Ball *ball)
{
    float f31 = lbl_801EED2C.unk8;
    Vec sp10;

    camera->unk0.x = func_8008CDC0(f31, &lbl_80176434[0]);
    camera->unk0.y = func_8008CDC0(f31, &lbl_80176434[0x10]);
    camera->unk0.z = func_8008CDC0(f31, &lbl_80176434[0x20]);

    camera->unkC.x = func_8008CDC0(f31, &lbl_80176434[0x30]);
    camera->unkC.y = func_8008CDC0(f31, &lbl_80176434[0x40]);
    camera->unkC.z = func_8008CDC0(f31, &lbl_80176434[0x50]);

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
}

void func_80018FA4(struct Camera *camera, struct Ball *ball)
{
    camera_clear(camera);
    camera->unk24 |= 8;
    camera->unk1E = 0x37;
}

void func_80018FE4(struct Camera *camera, struct Ball *ball)
{
    float f31 = lbl_801EED2C.unk8;
    Vec sp10;

    if ((f31 >= 1740.0f && f31 < 1850.0f)
     || (f31 >= 1954.0f && f31 < 2064.0f)
     || (f31 >= 2498.0f && f31 < 2902.0f))
    {
        camera->unk0.x = func_8008CDC0(f31, &lbl_80176434[0x60]);
        camera->unk0.y = func_8008CDC0(f31, &lbl_80176434[0x75]);
        camera->unk0.z = func_8008CDC0(f31, &lbl_80176434[0x8A]);

        camera->unkC.x = func_8008CDC0(f31, &lbl_80176434[0x9F]);
        camera->unkC.y = func_8008CDC0(f31, &lbl_80176434[0xB4]);
        camera->unkC.z = func_8008CDC0(f31, &lbl_80176434[0xC9]);
    }
    else
    {
        camera->unk0.x = lbl_80205E60[lbl_801EED2C.unkC].unkFC->unk30.x + func_8008CDC0(f31, &lbl_80176434[0x60]);
        camera->unk0.y = lbl_80205E60[lbl_801EED2C.unkC].unkFC->unk30.y + func_8008CDC0(f31, &lbl_80176434[0x75]);
        camera->unk0.z = lbl_80205E60[lbl_801EED2C.unkC].unkFC->unk30.z + func_8008CDC0(f31, &lbl_80176434[0x8A]);

        camera->unkC.x = lbl_80205E60[lbl_801EED2C.unkC].unkFC->unk30.x + func_8008CDC0(f31, &lbl_80176434[0x9F]);
        camera->unkC.y = lbl_80205E60[lbl_801EED2C.unkC].unkFC->unk30.y + func_8008CDC0(f31, &lbl_80176434[0xB4]);
        camera->unkC.z = lbl_80205E60[lbl_801EED2C.unkC].unkFC->unk30.z + func_8008CDC0(f31, &lbl_80176434[0xC9]);
    }

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;

}

void func_80019284(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    camera_clear(camera);

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y + 0.5;
    camera->unkC.z = ball->unk4.z;

    mathutil_mtxA_from_translate(&camera->unkC);
    mathutil_mtxA_rotate_y(0);
    sp10.x = 0.0f;
    sp10.y = 1.0f;
    sp10.z = 3.0f;
    mathutil_mtxA_tf_point(&sp10, &camera->unk0);

    sp10.x = 0.0f;
    sp10.y = 0.0f;
    sp10.z = 3.0f;
    mathutil_mtxA_tf_point(&sp10, &camera->unkAC);

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
    camera->unk1E = 1;
}

void func_800193AC(struct Camera *camera, struct Ball *ball)
{
    camera_clear(camera);
    camera->unk8C = 0x80;
    camera->unk6C = 0;
    camera->unk80 = 0.0f;
    camera_sub_13(camera, ball);
    camera->unk1E = 13;
}

void camera_sub_13(struct Camera *camera, struct Ball *ball)
{
    Quaternion sp1C;
    Vec sp10;
    int r10;
    int i;

    if (!(lbl_802F1EE0 & 0xA) || camera->unk1E != 13)
    {
        func_80019CDC(&sp1C);
        camera->unkC.x = sp1C.x;
        camera->unkC.y = sp1C.y;
        camera->unkC.z = sp1C.z;
        if (camera->unk50 > 0)
        {
            for (i = 0; i < modeCtrl.unk24; i++)
            {
                r10 = lbl_80206BD0[i];
                if (camera->unk80 > -0.3 && (lbl_801F3D50[r10][0] & (1<<(31-0x18))))
                    camera->unk80 -= 0.01;
                if (camera->unk80 < 0.2 && (lbl_801F3D50[r10][0] & (1<<(31-0x19))))
                    camera->unk80 += 0.01;
            }
        }

        sp10.x = 0.0f;
        if (gameSubmode == SMD_GAME_RESULT_INIT
         || gameSubmode == SMD_GAME_RESULT_MAIN
         || gameSubmode == SMD_GAME_RESULT_MENU)
            sp10.y = sp1C.w * (camera->unk80 + 0.4);
        else
            sp10.y = sp1C.w * (camera->unk80 + 0.8);
        sp10.z = sp1C.w * (camera->unk80 + 0.8);

        for (i = 0; i < modeCtrl.unk24; i++)
        {
            r10 = lbl_80206BD0[i];
            if (camera->unk8C < 256 && (lbl_801F3D50[r10][0] & (1<<(31-0x1A))))
                camera->unk8C += 8;
            if (camera->unk8C > -256 && (lbl_801F3D50[r10][0] & (1<<(31-0x1B))))
                camera->unk8C -= 8;
        }
        if (camera->unk50 > 0)
            camera->unk6C += camera->unk8C;
        mathutil_mtxA_from_translate(&camera->unkC);
        mathutil_mtxA_rotate_y(camera->unk6C);
        mathutil_mtxA_tf_point(&sp10, &camera->unk0);

        sp10.x = camera->unkC.x - camera->unk0.x;
        sp10.y = camera->unkC.y - camera->unk0.y;
        sp10.z = camera->unkC.z - camera->unk0.z;

        camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
        camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
        camera->unk1C = 0;

        if (camera->unk50 < 0x3C)
            camera->unk50++;
    }
}

void func_800196E8(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    camera_clear(camera);

    camera->unk0.x = 0.0f;
    camera->unk0.y = 0.0f;
    camera->unk0.z = 42.0f;

    camera->unkC.x = 0.0f;
    camera->unkC.y = 0.0f;
    camera->unkC.z = 0.0f;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;

    camera->unk1E = 0x35;
}

void func_800197AC(struct Camera *camera, struct Ball *ball) {}

void camera_sub_ready_init(struct Camera *camera, struct Ball *ball)
{
    Quaternion sp1C;
    Vec sp10;

    camera_clear(camera);
    func_80019CDC(&sp1C);
    camera->unk54.x = sp1C.x;
    camera->unk54.y = sp1C.y;
    camera->unk54.z = sp1C.z;
    camera->unk60 = sp1C.w * 0.8;
    camera->unk64 = sp1C.w * 0.8;
    mathutil_mtxA_from_translate(&camera->unk54);
    mathutil_mtxA_rotate_y(decodedStageLzPtr->unk10->unkE);
    sp10.x = 0.0f;
    sp10.y = camera->unk64;
    sp10.z = camera->unk60;
    mathutil_mtxA_tf_point(&sp10, &sp10);
    sp10.x = camera->unk54.x - sp10.x;
    sp10.y = camera->unk54.y - sp10.y;
    sp10.z = camera->unk54.z - sp10.z;
    camera->unk6C = (s16)(mathutil_atan2(sp10.x, sp10.z) - 32768);
    camera->unk68 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk70 = 0;
    camera->unk74.x = decodedStageLzPtr->unk10->unk0;
    camera->unk74.y = decodedStageLzPtr->unk10->unk4 + 0.5;
    camera->unk74.z = decodedStageLzPtr->unk10->unk8;
    mathutil_mtxA_from_translate(&camera->unk74);
    mathutil_mtxA_rotate_y(decodedStageLzPtr->unk10->unkE);
    sp10.x = 0.0f;
    sp10.y = 1.0f;
    sp10.z = 3.0f;
    mathutil_mtxA_tf_point(&sp10, &sp10);
    sp10.x = camera->unk74.x - sp10.x;
    sp10.y = camera->unk74.y - sp10.y;
    sp10.z = camera->unk74.z - sp10.z;
    camera->unk8C = (s16)(mathutil_atan2(sp10.x, sp10.z) - 32768) + 0x10000;
    camera->unk88 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk90 = 0;
    camera->unk24 |= 1;
    camera->unk50 = 0x5A;
    camera->unk52 = 0x5A;
    camera->unk26 = 1;
    camera_sub_ready_main(camera, ball);
    camera->unk1E = 11;
}

void camera_sub_ready_main(struct Camera *camera, struct Ball *ball)
{
    if (!(lbl_802F1EE0 & 0xA) || camera->unk1E != 11)
    {
        float t;
        float f7;
        Vec sp10;

        if (camera->unk50 > 0)
        {
            camera->unk50--;
            if (lbl_801F3A58.unk1E == 1 && (lbl_801F3D88.unk0 & (1<<(31-0x17))) && modeCtrl.unk0 > 0x78)
                camera->unk50--;
        }

        f7 = (float)camera->unk50 / (float)camera->unk52;
        t = (3.0 + -2.0 * f7) * (f7 * f7);

        camera->unkC.x = camera->unk74.x * (1.0 - t) + camera->unk54.x * t;
        camera->unkC.y = camera->unk74.y * (1.0 - t) + camera->unk54.y * t;
        camera->unkC.z = camera->unk74.z * (1.0 - t) + camera->unk54.z * t;

        camera->unk18 = (double)camera->unk68 + (s16)(camera->unk88 - camera->unk68) * (1.0 - t);
        camera->unk1A = (double)camera->unk6C + (camera->unk8C - camera->unk6C) * (1.0 - t);
        camera->unk1C = (double)camera->unk70 + (s16)(camera->unk90 - camera->unk70) * (1.0 - t);

        mathutil_mtxA_from_translate(&camera->unkC);
        mathutil_mtxA_rotate_y(camera->unk1A);

        sp10.x = 0.0f;
        sp10.y = (1.0 - t) + camera->unk64 * t;
        sp10.z = (1.0 - t) * 3.0 + camera->unk60 * t;
        mathutil_mtxA_tf_point(&sp10, &camera->unk0);
    }
}

void func_80019CA4(struct Camera *camera, struct Ball *ball)
{
    camera_sub_ready_init(camera, ball);
    camera->unk50 = 0x15E;
    camera->unk52 = 0x15E;
}

struct Struct80177214
{
    s32 stageId;
    Quaternion quat;
};  // size = 0x14

struct Struct80177214 lbl_80177214[] =
{
    {4,   {0, 0, 0,    50}},
    {14,  {0, 0, 0,    50}},
    {144, {0, 0, 0, 31.25}},
    {0,   {0, 0, 0,     0}},
};

void func_80019CDC(Quaternion *quat)
{
    struct Struct80177214 *ptr = &lbl_80177214[0];

    while (ptr->stageId > 0)
    {
        if (ptr->stageId == currStageId)
        {
            *quat = ptr->quat;
            return;
        }
        ptr++;
    }
    *quat = lbl_8020ADD4;
    if (quat->w < 31.25)
        quat->w = 31.25f;
}

void func_80019D74(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    camera_clear(camera);
    camera->unk26 = 0;
    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y + 0.5;
    camera->unkC.z = ball->unk4.z;
    mathutil_mtxA_from_translate(&camera->unkC);
    mathutil_mtxA_rotate_y(decodedStageLzPtr->unk10->unkE);
    sp10.x = 0.0f;
    sp10.y = 1.0f;
    sp10.z = 3.0f;
    mathutil_mtxA_tf_point(&sp10, &camera->unk0);
    sp10.x = 0.0f;
    sp10.y = 0.0f;
    sp10.z = 3.0f;
    mathutil_mtxA_tf_point(&sp10, &camera->unkAC);

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
    camera->unk1E = 1;
}

static inline float sum_of_3_sq(register float a, register float b, register float c)
{
#ifdef __MWERKS__
    asm
    {
        fmuls a, a, a
        fmadds a, b, b, a
        fmadds a, c, c, a
    }
    return a;
#else
    return a * a + b * b + c * c;
#endif
}

#ifdef NONMATCHING  // register swaps
void func_80019EB0(struct Camera *camera, struct Ball *ball)
{
    s16 r31;
    s16 r30;
    s16 r29;
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    float f1;
    int r4;
    int r3;

    if (lbl_802F1EE0 & 0xA)
        return;

    sp1C.x = camera->unk0.x;
    sp1C.y = camera->unk0.y;
    sp1C.z = camera->unk0.z;

    sp10.x = camera->unkC.x;
    sp10.y = camera->unkC.y;
    sp10.z = camera->unkC.z;

    sp28.x = camera->unkAC.x - camera->unkC.x;
    sp28.y = camera->unkAC.y - camera->unkC.y;
    sp28.z = camera->unkAC.z - camera->unkC.z;

    f1 = sum_of_3_sq(sp28.x, sp28.y, sp28.z);
    if (f1 > 1.1920928955078125e-07f)
    {
        f1 = mathutil_rsqrt(f1);
        sp28.x *= f1;
        sp28.y *= f1;
        sp28.z *= f1;
    }
    else
    {
        sp28.x = 1.0f;
        sp28.y = 0.0f;
        sp28.z = 0.0f;
    }
    //lbl_80019FA4

    sp28.x = sp28.x * 0.75 + camera->unkC.x;
    sp28.y = sp28.y * 0.75 + camera->unkC.y;
    sp28.z = sp28.z * 0.75 + camera->unkC.z;

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y + 0.5;
    camera->unkC.z = ball->unk4.z;

    sp28.x = camera->unkC.x - sp28.x;
    sp28.y = camera->unkC.y - sp28.y;
    sp28.z = camera->unkC.z - sp28.z;

    if (ball->unk80 < 0x3C)
        r31 = 0;
    else
        r31 = mathutil_atan2(sp28.y, mathutil_sqrt(sum_of_sq(sp28.x, sp28.z)));

    r30 = mathutil_atan2(sp28.x, sp28.z) - 32768;
    r3 = (s16)(r30 - camera->unk1A);
    if (r3 < -512)
        r4 = -512;
    else if (r3 > 512)
        r4 = 512;
    else
        r4 = r3;

    r30 = camera->unk1A + r4;
    if (!(camera->unk24 & (1<<(31-0x1E))) && !(ball->unk94 & (1<<(31-0x13))))
    {
        r3 = (s16)(ball->unk92 - r30);
        if (r3 > 0x800)
            r3 -= 0x800;
        else if (r3 < -0x800)
            r3 += 0x800;
        else
            r3 = 0;
        //lbl_8001A10C
        r3 >>= 7;
        r4 = camera->unk10C;
        if (r3 == 0)
            r4 = 0;
        //lbl_8001A120
        else if ((r4 < 0 && r3 > 0) || (r4 > 0 && r3 < 0))
            r4 = 0;
        //lbl_8001A148
        else if (r3 < 0)
        {
            if (r3 < r4 - 4)
                r4 -= 4;
            else
                r4 = r3;
        }
        //lbl_8001A16C
        else
        {
            if (r3 > r4 + 4)
                r4 += 4;
            else
                r4 = r3;
        }
        //lbl_8001A184
        r30 += r4;
        r3 = (s16)(r30 - camera->unk1A);
        if (r3 < -768)
            r3 = -768;
        else if (r3 > 768)
            r3 = 768;
        //lbl_8001A1B0
        r30 = camera->unk1A + r3;
    }
    //lbl_8001A1B8
    if (r31 < -6144)
        r31 = -6144;
    else if (r31 > 6144)
        r31 = 6144;
    //lbl_8001A1D8

    r29 = camera->unkB8 + 0.2 * (r31 - camera->unkB8);
    camera->unkB8 = r29;

    mathutil_mtxA_from_translate(&camera->unkC);
    mathutil_mtxA_rotate_y(r30);
    mathutil_mtxA_rotate_x(r29);
    sp28.x = 0.0f;
    sp28.y = 0.0f;
    sp28.z = 3.0f;
    mathutil_mtxA_tf_point(&sp28, &camera->unkAC);
    camera->unk10C = r30 - camera->unk1A;
    camera->unk1A = r30;
    camera->unk18 = r29 + 0x10000 - 3328;
    mathutil_mtxA_from_translate(&camera->unkC);
    mathutil_mtxA_rotate_y(camera->unk1A);
    mathutil_mtxA_rotate_x(camera->unk18);
    sp28.x = 0.0f;
    sp28.y = 0.0f;
    sp28.z = mathutil_sqrt(sum_of_sq(3.0f, 1.0f));
    mathutil_mtxA_tf_point(&sp28, &camera->unk0);

    camera->unk94.x = camera->unk0.x - sp1C.x;
    camera->unk94.y = camera->unk0.y - sp1C.y;
    camera->unk94.z = camera->unk0.z - sp1C.z;

    camera->unkA0.x = camera->unkC.x - sp10.x;
    camera->unkA0.y = camera->unkC.y - sp10.y;
    camera->unkA0.z = camera->unkC.z - sp10.z;
}
#else
asm void func_80019EB0(struct Camera *camera, struct Ball *ball)
{
    nofralloc
#include "../asm/nonmatchings/func_80019EB0.s"
}
#endif
#pragma peephole on

void func_8001A34C(struct Camera *camera, struct Ball *ball)
{
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    float f0;
    float f1;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    f0 = 0.1 * mathutil_sqrt(sum_of_3_sq(sp10.x, sp10.y, sp10.z)) / 5.0;
    f0 *= 1.0 + 9.0 * lbl_801F3B70[0].unk6 / 170.0;

    sp28.x = 0.0f;
    sp1C.x = 0.0f;
    sp28.y = 0.0f;
    sp1C.y = 0.0f;
    sp28.z = 0.0f;
    sp1C.z = 0.0f;

    sp28.x = f0 * lbl_801F3B70[0].unk2 / 74.0;
    if (lbl_801F3D50[0][0] & (1<<(31-0x16)))
        sp28.y = f0 * lbl_801F3B70[0].unk3 / 74.0;
    else
        sp28.z = -f0 * lbl_801F3B70[0].unk3 / 74.0;

    sp1C.x = f0 * lbl_801F3B70[0].unk4 / 74.0;
    if (lbl_801F3D50[0][0] & (1<<(31-0x16)))
        sp1C.y = f0 * lbl_801F3B70[0].unk5 / 74.0;
    else
        sp1C.z = -f0 * lbl_801F3B70[0].unk5 / 74.0;

    mathutil_mtxA_from_translate(&camera->unk0);
    mathutil_mtxA_rotate_y(camera->unk1A);
    mathutil_mtxA_rotate_x(camera->unk18);
    mathutil_mtxA_rotate_z(camera->unk1C);
    mathutil_mtxA_tf_point(&sp28, &camera->unk0);
    mathutil_mtxA_rigid_inv_tf_point(&camera->unkC, &sp10);

    sp10.x += sp1C.x;
    sp10.y += sp1C.y;
    sp10.z += sp1C.z;
    mathutil_mtxA_tf_point(&sp10, &camera->unkC);

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    f1 = sum_of_3_sq(sp10.x, sp10.y, sp10.z);
    if (f1 < 0.09)
    {
        float f2 = 0.3 / mathutil_sqrt(f1);
        camera->unkC.x = camera->unk0.x + sp10.x * f2;
        camera->unkC.y = camera->unk0.y + sp10.y * f2;
        camera->unkC.z = camera->unk0.z + sp10.z * f2;
    }

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
}

void func_8001A70C(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
}

void func_8001A7A4(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = currentCameraStructPtr->unk1C;
}

void func_8001A840(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    camera->unk26 = 2;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera->unk94.x *= 0.97;
    camera->unk94.y *= 0.955;
    camera->unk94.z *= 0.97;

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y;
    camera->unkC.z = ball->unk4.z;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
}

extern void func_800496BC(u32, Vec *, float);

static inline float vec_mag(register Vec *v)
{
    register float x, y, z;
#ifdef __MWERKS__
    asm
    {
        lfs x, v->x
        lfs y, v->y
        lfs z, v->z
        fmuls x, x, x
        fmadds x, y, y, x
        fmadds x, z, z, x
    }
    return mathutil_sqrt(x);
#else
    return mathutil_sqrt(v->x * v->x + v->y * v->y + v->z * v->z);
#endif
}

void func_8001A96C(struct Camera *camera, struct Ball *ball)
{
    Vec sp30;
    u8 unused[20];
    Vec sp10;
    Vec *r29;
    float f31;
    float f3;
    float f1;
    float f3_;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera_clear(camera);

    camera->unk1E = 8;
    camera->unk26 = 2;
    camera->unk24 |= 4;

    sp30.x = 3.0f;
    sp30.y = 3.0f;
    sp30.z = 3.0f;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(rand() & ((1<<(32-0x11))-1));
    mathutil_mtxA_tf_vec(&sp30, &sp30);

    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp10,
        (0.75 + 0.25 * (rand() / 32767.0f)) * lbl_80250A68.unk10);

    camera->unk0.x = sp10.x + sp30.x;
    camera->unk0.y = sp10.y + sp30.y;
    camera->unk0.z = sp10.z + sp30.z;

    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp10, 0.0f);

    r29 = &sp30;

    sp30.x = camera->unk0.x - sp10.x;
    sp30.y = camera->unk0.y - sp10.y;
    sp30.z = camera->unk0.z - sp10.z;

    f1 = 1.0f / vec_mag(&sp30);
    f3_ = sp30.y;
    if (f1 * f3_ > 0.96592582630000001)
    {
        sp30.y = 0.0f;
        mathutil_vec_set_len(r29, r29, 0.25881904509999998 * f3_);
        camera->unk0.x = sp10.x + sp30.x;
        camera->unk0.z = sp10.z + sp30.z;
    }

    camera->unk94.x *= 0.25;
    camera->unk94.y *= 0.25;
    camera->unk94.z *= 0.25;

    f31 = (lbl_80250A68.unk10 < 60.0f) ? lbl_80250A68.unk10 : 60.0f;

    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp10, lbl_80250A68.unk10 - f31);

    f3 = 1.0 / f31;

    camera->unk94.x += f3 * (sp10.x - ball->unk4.x);
    camera->unk94.y += f3 * (sp10.y - ball->unk4.y);
    camera->unk94.z += f3 * (sp10.z - ball->unk4.z);

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y;
    camera->unkC.z = ball->unk4.z;

    camera->unk24 |= 1;

    camera_sub_ringout_main(camera, ball);
}

void func_8001AC80(struct Camera *camera, struct Ball *ball) {}

void func_8001AC84(struct Camera *camera, struct Ball *ball)
{
    Vec sp50;
    u8 unused2[20];
    Vec sp30;
    u8 unused[20];
    Vec sp10;
    Vec *r29;
    float f31;
    float f1;
    float f3_;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera_clear(camera);

    camera->unk1E = 8;
    camera->unk26 = 2;
    camera->unk24 |= 4;

    sp50.x = 1.0f;
    sp50.y = 1.0f;
    sp50.z = 1.0f;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(rand() & ((1<<(32-0x11))-1));
    mathutil_mtxA_tf_vec(&sp50, &sp50);

    f31 = (0.25 * (rand() / 32767.0f)) * lbl_80250A68.unk10;

    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp30, f31);

    camera->unk0.x = sp30.x + sp50.x;
    camera->unk0.y = sp30.y + sp50.y;
    camera->unk0.z = sp30.z + sp50.z;

    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp30, 0.0f);

    r29 = &sp50;

    sp50.x = camera->unk0.x - sp30.x;
    sp50.y = camera->unk0.y - sp30.y;
    sp50.z = camera->unk0.z - sp30.z;

    f1 = 1.0f / vec_mag(&sp50);
    f3_ = sp50.y;
    if (f1 * f3_ > 0.96592582630000001)
    {
        sp50.y = 0.0f;
        mathutil_vec_set_len(r29, r29, 0.25881904509999998 * f3_);
        camera->unk0.x = sp30.x + sp50.x;
        camera->unk0.z = sp30.z + sp50.z;
    }

    camera->unk94.x *= 0.1;
    camera->unk94.y *= 0.1;
    camera->unk94.z *= 0.1;

    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp30, f31);
    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp10, 1.0 + f31);

    camera->unk94.x -= 0.6 * (sp30.x - sp10.x);
    camera->unk94.y -= 0.6 * (sp30.y - sp10.y);
    camera->unk94.z -= 0.6 * (sp30.z - sp10.z);

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y;
    camera->unkC.z = ball->unk4.z;

    camera->unk24 |= 1;

    camera_sub_ringout_main(camera, ball);
}

void camera_sub_ringout_main(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera->unk94.x *= 0.97;
    camera->unk94.y *= 0.955;
    camera->unk94.z *= 0.97;

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    sp10.x = ball->unk4.x - camera->unkC.x;
    sp10.y = ball->unk4.y - camera->unkC.y;
    sp10.z = ball->unk4.z - camera->unkC.z;

    camera->unkA0.x = 0.15 * sp10.x;
    camera->unkA0.y = 0.15 * sp10.y;
    camera->unkA0.z = 0.15 * sp10.z;

    camera->unkC.x += camera->unkA0.x;
    camera->unkC.y += camera->unkA0.y;
    camera->unkC.z += camera->unkA0.z;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
}

void func_8001B13C(struct Camera *camera, struct Ball *ball) {}

void func_8001B140(struct Camera *camera, struct Ball *ball)
{
    camera->unk1E = 15;
    camera->unk26 = 3;
    camera_sub_goal_main(camera, ball);
}

static inline float vec_dot_prod(register Vec *a, register Vec *b)
{
    register float x1, y1, z1, x2, y2, z2;
    register float result;
#ifdef __MWERKS__
    asm
    {
        lfs x1, a->x
        lfs x2, b->x
        lfs y1, a->y
        lfs y2, b->y
        lfs z1, a->z
        lfs z2, b->z
        fmuls result, x1, x2
        fmadds result, y1, y2, result
        fmadds result, z1, z2, result
    }
    return result;
#else
    return a->x * b->x + a->y * b->y + a->z * b->z;
#endif
}

void camera_sub_goal_main(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;
    float f31;
    float f2;
    float f1;

    if (lbl_802F1EE0 & 0xA)
        return;

    sp10.x = ball->unk4.x - camera->unk0.x;
    sp10.y = 0.0f;
    sp10.z = ball->unk4.z - camera->unk0.z;

    f31 = vec_dot_prod(&sp10, &camera->unk94);
    mathutil_vec_normalize_len(&sp10);

    camera->unk94.y *= 0.97;
    f2 = -0.01 * f31;
    camera->unk94.x += f2 * sp10.x;
    camera->unk94.z += f2 * sp10.z;
    if (f2 < 0.0)
    {
        f2 *= 0.5;
        camera->unk94.x += f2 * sp10.z;
        camera->unk94.z += f2 * sp10.x;
    }

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    camera->unkA0.x = 0.3 * (ball->unk4.x - camera->unkC.x);
    camera->unkA0.y = 0.3 * (ball->unk4.y - camera->unkC.y);
    camera->unkA0.z = 0.3 * (ball->unk4.z - camera->unkC.z);

    camera->unkC.x += camera->unkA0.x;
    camera->unkC.y += camera->unkA0.y;
    camera->unkC.z += camera->unkA0.z;

    sp10.x = camera->unk0.x - camera->unkC.x;
    sp10.y = 0.0f;
    sp10.z = camera->unk0.z - camera->unkC.z;

    f1 = mathutil_sqrt(sum_of_sq(sp10.x, sp10.z));
    if (f1 > 1.1920928955078125e-07f)
    {
        float f3 = (f1 + 0.08 * (2.0 - f1)) / f1;

        camera->unk0.x = sp10.x * f3 + camera->unkC.x;
        camera->unk0.z = sp10.z * f3 + camera->unkC.z;
        if (!(ball->unk94 & (1<<(31-0x16))))
        {
            sp10.y = camera->unkC.y - camera->unk0.y;
            camera->unk0.y += 0.01 * sp10.y;
        }
    }

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
}

static inline float vec_sq_mag(register Vec *v)
{
    register float x, y, z;
#ifdef __MWERKS__
    asm
    {
        lfs x, v->x
        lfs y, v->y
        lfs z, v->z
        fmuls x, x, x
        fmadds x, y, y, x
        fmadds x, z, z, x
    }
    return x;
#else
    return v->x * v->x + v->y * v->y + v->z * v->z;
#endif
}

static inline float vec_distance(register Vec *a, register Vec *b)
{
#ifdef __MWERKS__
    register float x1, y1, z1, x2, y2, z2;
    register float result;
    asm
    {
        lfs x1, a->x
        lfs x2, b->x
        lfs y1, a->y
        lfs y2, b->y
        lfs z1, a->z
        lfs z2, b->z
        fsubs x1, x1, x2
        fsubs y1, y1, y2
        fsubs z1, z1, z2
        fmuls result, x1, x1
        fmadds result, y1, y1, result
        fmadds result, z1, z1, result
    }
    return mathutil_sqrt(result);
#else
    float result = (a->x - b->x) * (a->x - b->x)
                 + (a->y - b->y) * (a->y - b->y)
                 + (a->z - b->z) * (a->z - b->z);
    return mathutil_sqrt(result);
#endif
}

void func_8001B478(struct Camera *camera, struct Ball *ball)
{
    struct DecodedStageLzPtr_child4 sp6C;
    Vec sp60;
    Vec sp54;
    u8 filler[0x14];
    Vec sp34;
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    float f31;
    struct DecodedStageLzPtr_child4 *r29;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera_clear(camera);

    camera->unk26 = 4;
    camera->unk24 |= 4;

    if ((lbl_801F3B70[lbl_80206BD0[ball->unk2E]].unk0 & (1<<(31-0x17)))
     && (lbl_801F3D88.unk0 & (1<<(31-0x17))))
    {
        camera->unk1E = 0x30;
        lbl_80176200[camera->unk1E](camera, ball);
        return;
    }

    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp34, 0.0f);
    sp6C = decodedStageLzPtr->unk1C[lbl_801F3A58.unkC];
    if (lbl_801F3A58.unkE > 0)
    {
        mathutil_mtxA_from_mtx(lbl_80206E48[lbl_801F3A58.unkE].unk24);
        mathutil_mtxA_tf_point(&sp6C.unk0, &sp6C.unk0);
    }
    if (vec_distance(&sp6C.unk0, &ball->unk4) < 16.0)
    {
        camera->unk1E = 0x11;
        mathutil_mtxA_from_translate(&sp6C.unk0);
        mathutil_mtxA_rotate_z(sp6C.unk10);
        mathutil_mtxA_rotate_y(sp6C.unkE);
        mathutil_mtxA_rotate_x(sp6C.unkC);
        f31 = vec_mag(&lbl_801F3A58.unk10);
        if (vec_distance(&sp6C.unk0, &sp34) > 2.5 && (rand() & 3) && sp34.y > sp6C.unk0.y)
        {
            double zero;

            camera->unk94.x *= 0.02;
            camera->unk94.y *= 0.02;
            camera->unk94.z *= 0.02;

            sp28.x = 0.0f;
            sp28.y = 2.0f;
            sp28.z = 0.0f;
            mathutil_mtxA_tf_point(&sp28, &sp28);

            sp60.x = sp34.x - sp28.x;
            sp60.y = sp34.y - sp28.y;
            sp60.z = sp34.z - sp28.z;

            zero = 0.0;
            if (__fabs(sp60.y) != zero)
            {
                float f1 = 0.35 / __fabs(sp60.y);
                float f2;
                Vec *r3 = &sp60;
                sp60.x *= f1;
                sp60.y *= f1;
                sp60.z *= f1;
                f2 = vec_sq_mag(&sp60);
                if (f2 < 1.0)
                    mathutil_vec_set_len(r3, r3, 1.0f);
                else if (f2 > 4.0)
                    mathutil_vec_set_len(r3, r3, 2.0f);
            }
            else
                mathutil_vec_set_len(&sp60, &sp60, 1.0 + rand() / 32767.0f);

            camera->unk0.x = sp34.x + sp60.x;
            camera->unk0.y = sp34.y + sp60.y;
            camera->unk0.z = sp34.z + sp60.z;
        }
        else
        {
            if (f31 > 0.25 && (rand() & 3))
            {
                camera->unk1E = 20;
                camera->unk54.x = 2.0 + (rand() / 32767.0f);
                camera->unk54.y = 1.0 + 5.0 * (rand() / 32767.0f);
                camera->unk54.z = 4.0 * ((rand() / 32767.0f) - 0.5);
                if (rand() & 1)
                    camera->unk54.x = -camera->unk54.x;
                camera->unk60 = camera->unk54.y + 0.5 * (0.5 + (rand() / 32767.0f));
                r29 = &decodedStageLzPtr->unk1C[lbl_801F3A58.unkC];
                mathutil_mtxA_from_mtx(lbl_80206E48[lbl_801F3A58.unkE].unk24);
                mathutil_mtxA_translate(&r29->unk0);
                mathutil_mtxA_rotate_z(r29->unk10);
                mathutil_mtxA_rotate_y(r29->unkE);
                mathutil_mtxA_rotate_x(r29->unkC);
                mathutil_mtxA_tf_point(&camera->unk54, &sp10);
                sp1C.x = sp10.x - ball->unk4.x;
                sp1C.y = sp10.y - ball->unk4.y;
                sp1C.z = sp10.z - ball->unk4.z;
                mathutil_vec_set_len(&sp1C, &sp1C, camera->unk60);
                camera->unk0.x = sp10.x + sp1C.x;
                camera->unk0.y = sp10.y + sp1C.y;
                camera->unk0.z = sp10.z + sp1C.z;
            }
            else
            {
                camera->unk94.x *= 0.02;
                camera->unk94.y = 0.0f;
                camera->unk94.z *= 0.02;
                sp60.x = 9.0 * (f31 * ((rand() / 32767.0f) - 0.5));
                sp60.y = 2.5f;
                sp60.z = 5.0f;
                mathutil_mtxA_rigid_inv_tf_vec(&lbl_801F3A58.unk10, &sp54);
                if (sp54.z > 0.0)
                    sp60.z = -sp60.z;
                mathutil_mtxA_tf_point(&sp60, &camera->unk0);
                if (lbl_801F3A58.unkE > 0)
                    camera->unk1E = 0x13;
            }
        }
    }
    else
    {
        camera->unk1E = 0x12;
        sp60.x = ball->unk4.x - sp6C.unk0.x;
        sp60.y = ball->unk4.y - sp6C.unk0.y;
        sp60.z = ball->unk4.z - sp6C.unk0.z;
        if (sp60.x == 0.0 && sp60.y == 0.0 && sp60.z == 0.0)
            sp60.z = 1.0f;
        mathutil_vec_set_len(&sp60, &sp60, 1.0f);
        camera->unk0.x = ball->unk4.x + sp60.x;
        camera->unk0.y = ball->unk4.y + sp60.y;
        camera->unk0.z = ball->unk4.z + sp60.z;
    }
    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y;
    camera->unkC.z = ball->unk4.z;
    camera->unk24 |= 1;
    camera_sub_17(camera, ball);
}

void camera_sub_17(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera->unk94.x *= 0.98;
    camera->unk94.y *= 0.98;
    camera->unk94.z *= 0.98;

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    sp10.x = ball->unk4.x - camera->unkC.x;
    sp10.y = ball->unk4.y - camera->unkC.y;
    sp10.z = ball->unk4.z - camera->unkC.z;

    camera->unkA0.x = sp10.x * 0.15;
    camera->unkA0.y = sp10.y * 0.15;
    camera->unkA0.z = sp10.z * 0.15;

    camera->unkC.x += camera->unkA0.x;
    camera->unkC.y += camera->unkA0.y;
    camera->unkC.z += camera->unkA0.z;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
}

void func_8001BDDC(struct Camera *camera, struct Ball *ball)
{
    Vec sp1C;
    Vec sp10;
    struct DecodedStageLzPtr_child4 *r5;

    if (lbl_802F1EE0 & 0xA)
        return;

    r5 = &decodedStageLzPtr->unk1C[lbl_801F3A58.unkC];
    sp1C = r5->unk0;

    if (lbl_801F3A58.unkE > 0)
    {
        mathutil_mtxA_from_mtx(lbl_80206E48[lbl_801F3A58.unkE].unk24);
        mathutil_mtxA_tf_point(&sp1C, &sp1C);
    }

    sp1C.x = ball->unk4.x - sp1C.x;
    sp1C.y = ball->unk4.y - sp1C.y;
    sp1C.z = ball->unk4.z - sp1C.z;
    if (mathutil_vec_normalize_len(&sp1C) < 12.0)
        camera->unk1E = 16;

    sp10.x = (ball->unk1C.x * 4.0) + (ball->unk4.x + sp1C.x * 2.0);
    sp10.y = (ball->unk1C.y * 4.0) + (ball->unk4.y + sp1C.y * 2.0) + 2.0;
    sp10.z = (ball->unk1C.z * 4.0) + (ball->unk4.z + sp1C.z * 2.0);

    camera->unk94.x = 0.04 * (sp10.x - camera->unk0.x);
    camera->unk94.y = 0.04 * (sp10.y - camera->unk0.y);
    camera->unk94.z = 0.04 * (sp10.z - camera->unk0.z);

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    sp1C.x = ball->unk4.x - camera->unkC.x;
    sp1C.y = ball->unk4.y - camera->unkC.y;
    sp1C.z = ball->unk4.z - camera->unkC.z;

    camera->unkA0.x = sp1C.x * 0.15;
    camera->unkA0.y = sp1C.y * 0.15;
    camera->unkA0.z = sp1C.z * 0.15;

    camera->unkC.x += camera->unkA0.x;
    camera->unkC.y += camera->unkA0.y;
    camera->unkC.z += camera->unkA0.z;

    sp1C.x = camera->unkC.x - camera->unk0.x;
    sp1C.y = camera->unkC.y - camera->unk0.y;
    sp1C.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp1C.x, sp1C.z) - 32768;
    camera->unk18 = mathutil_atan2(sp1C.y, mathutil_sqrt(sum_of_sq(sp1C.x, sp1C.z)));
    camera->unk1C = 0;
}

void func_8001C0C4(struct Camera *camera, struct Ball *ball)
{
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    struct DecodedStageLzPtr_child4 *r5;

    if (lbl_802F1EE0 & 0xA)
        return;

    r5 = &decodedStageLzPtr->unk1C[lbl_801F3A58.unkC];
    sp10 = r5->unk0;

    if (lbl_801F3A58.unkE > 0)
    {
        mathutil_mtxA_from_mtx(lbl_80206E48[lbl_801F3A58.unkE].unk24);
        mathutil_mtxA_tf_point(&sp10, &sp10);
    }

    sp28.x = lbl_801F3A58.unk10.x;
    sp28.y = lbl_801F3A58.unk10.y * 0.05;
    sp28.z = lbl_801F3A58.unk10.z;
    mathutil_vec_set_len(&sp28, &sp28, -4.0f);

    sp28.y += 2.5;
    sp1C.x = sp10.x + sp28.x;
    sp1C.y = sp10.y + sp28.y;
    sp1C.z = sp10.z + sp28.z;

    camera->unk94.x = 0.04 * (sp1C.x - camera->unk0.x);
    camera->unk94.y = 0.04 * (sp1C.y - camera->unk0.y);
    camera->unk94.z = 0.04 * (sp1C.z - camera->unk0.z);

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    sp28.x = ball->unk4.x - camera->unkC.x;
    sp28.y = ball->unk4.y - camera->unkC.y;
    sp28.z = ball->unk4.z - camera->unkC.z;

    camera->unkA0.x = sp28.x * 0.15;
    camera->unkA0.y = sp28.y * 0.15;
    camera->unkA0.z = sp28.z * 0.15;

    camera->unkC.x += camera->unkA0.x;
    camera->unkC.y += camera->unkA0.y;
    camera->unkC.z += camera->unkA0.z;

    sp28.x = camera->unkC.x - camera->unk0.x;
    sp28.y = camera->unkC.y - camera->unk0.y;
    sp28.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp28.x, sp28.z) - 32768;
    camera->unk18 = mathutil_atan2(sp28.y, mathutil_sqrt(sum_of_sq(sp28.x, sp28.z)));
    camera->unk1C = 0;
}

void func_8001C368(struct Camera *camera, struct Ball *ball)
{
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    struct DecodedStageLzPtr_child4 *r30;

    if (lbl_802F1EE0 & 0xA)
        return;

    r30 = &decodedStageLzPtr->unk1C[lbl_801F3A58.unkC];
    mathutil_mtxA_from_mtx(lbl_80206E48[lbl_801F3A58.unkE].unk24);
    mathutil_mtxA_translate(&r30->unk0);
    mathutil_mtxA_rotate_z(r30->unk10);
    mathutil_mtxA_rotate_y(r30->unkE);
    mathutil_mtxA_rotate_x(r30->unkC);
    mathutil_mtxA_tf_point(&camera->unk54, &sp10);

    sp28.x = sp10.x - ball->unk4.x;
    sp28.y = 0.0f;
    sp28.z = sp10.z - ball->unk4.z;
    mathutil_vec_set_len(&sp28, &sp28, camera->unk60);

    sp1C.x = sp10.x + sp28.x;
    sp1C.y = sp10.y + sp28.y;
    sp1C.z = sp10.z + sp28.z;

    camera->unk94.x = 0.02 * (sp1C.x - camera->unk0.x);
    camera->unk94.y = 0.02 * (sp1C.y - camera->unk0.y);
    camera->unk94.z = 0.02 * (sp1C.z - camera->unk0.z);

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    sp28.x = ball->unk4.x - camera->unkC.x;
    sp28.y = ball->unk4.y - camera->unkC.y;
    sp28.z = ball->unk4.z - camera->unkC.z;

    camera->unkA0.x = sp28.x * 0.15;
    camera->unkA0.y = sp28.y * 0.15;
    camera->unkA0.z = sp28.z * 0.15;

    camera->unkC.x += camera->unkA0.x;
    camera->unkC.y += camera->unkA0.y;
    camera->unkC.z += camera->unkA0.z;

    sp28.x = camera->unkC.x - camera->unk0.x;
    sp28.y = camera->unkC.y - camera->unk0.y;
    sp28.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp28.x, sp28.z) - 32768;
    camera->unk18 = mathutil_atan2(sp28.y, mathutil_sqrt(sum_of_sq(sp28.x, sp28.z)));
    camera->unk1C = 0;
}

void func_8001C5FC(struct Camera *camera, struct Ball *ball)
{
    camera->unk1E = 22;
    camera_sub_22_23_24(camera, ball);
}

void camera_sub_22_23_24(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera->unk94.x *= 0.92;
    camera->unk94.y *= 0.92;
    camera->unk94.z *= 0.92;

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    sp10.x = ball->unk4.x - camera->unkC.x;
    sp10.y = ball->unk4.y - camera->unkC.y;
    sp10.z = ball->unk4.z - camera->unkC.z;

    camera->unkA0.x = (sp10.x - camera->unkA0.x) * 0.1;
    camera->unkA0.y = (sp10.y - camera->unkA0.y) * 0.1;
    camera->unkA0.z = (sp10.z - camera->unkA0.z) * 0.1;

    camera->unkC.x += camera->unkA0.x;
    camera->unkC.y += camera->unkA0.y;
    camera->unkC.z += camera->unkA0.z;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;
}

void func_8001C7D8(struct Camera *camera, struct Ball *ball)
{
    camera_clear(camera);
    camera_sub_26(camera, ball);
    camera->unk50 = 0;
    camera->unk26 = 7;
    camera->unk1E = 26;
}

void camera_sub_26(struct Camera *camera, struct Ball *ball)
{
    Vec sp28;
    Vec sp1C;
    Vec sp10;

    if ((lbl_802F1EE0 & 0xA) && camera->unk1E == 26)
        return;

    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_rotate_y(ball->unk92);

    sp1C.x = 0.0f;
    sp1C.y = -0.3f;
    sp1C.z = -1.4 - (camera->unk50 * 0.01);

    sp10.x = 0.0f;
    sp10.y = -0.4f;
    sp10.z = -(camera->unk50 * 0.01);

    if (camera->unk1E == 26)
    {
        if ((modeCtrl.unk8 & (1<<(31-0x1D))) && modeCtrl.unk10 == 1)
        {
            sp1C.z = -5.0f;
            sp10.z = -3.6f;
        }

        mathutil_mtxA_tf_point(&sp1C, &sp1C);
        mathutil_mtxA_tf_point(&sp10, &sp10);

        camera->unk0.x += (sp1C.x - camera->unk0.x) * 0.1;
        camera->unk0.y += (sp1C.y - camera->unk0.y) * 0.1;
        camera->unk0.z += (sp1C.z - camera->unk0.z) * 0.1;

        camera->unkC.x += (sp10.x - camera->unkC.x) * 0.1;
        camera->unkC.y += (sp10.y - camera->unkC.y) * 0.1;
        camera->unkC.z += (sp10.z - camera->unkC.z) * 0.1;
    }
    else
    {
        mathutil_mtxA_tf_point(&sp1C, &camera->unk0);
        mathutil_mtxA_tf_point(&sp10, &camera->unkC);
    }

    sp28.x = camera->unkC.x - camera->unk0.x;
    sp28.y = camera->unkC.y - camera->unk0.y;
    sp28.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp28.x, sp28.z) - 32768;
    camera->unk18 = mathutil_atan2(sp28.y, mathutil_sqrt(sum_of_sq(sp28.x, sp28.z)));
    camera->unk1C = 0;

    if (++camera->unk50 > 0x293)
        camera->unk50 = 0x293;
}

void func_8001CAB8(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;

    camera_clear(camera);

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y;
    camera->unkC.z = ball->unk4.z;

    camera->unk0.x = decodedStageLzPtr->unk10->unk8;
    camera->unk0.y = decodedStageLzPtr->unk10->unk4;
    camera->unk0.z = decodedStageLzPtr->unk10->unk0;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;

    camera->unk1E = 32;
}

void func_8001CBB0(struct Camera *camera, struct Ball *ball)
{
    Vec sp28;
    Vec sp1C;
    Vec sp10;

    if (lbl_802F1EE0 & 0xA)
        return;

    sp1C = camera->unk0;  // unused
    sp10 = camera->unkC;

    camera->unkC.x += (ball->unk4.x - camera->unkC.x) * 0.25;
    camera->unkC.y += (ball->unk4.y - camera->unkC.y) * 0.25;
    camera->unkC.z += (ball->unk4.z - camera->unkC.z) * 0.25;

    camera->unk94.x = 0.0f;
    camera->unk94.y = 0.0f;
    camera->unk94.z = 0.0f;

    camera->unk0.x = decodedStageLzPtr->unk10->unk8;
    camera->unk0.y = decodedStageLzPtr->unk10->unk4;
    camera->unk0.z = decodedStageLzPtr->unk10->unk0;

    sp28.x = camera->unkC.x - camera->unk0.x;
    sp28.y = camera->unkC.y - camera->unk0.y;
    sp28.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp28.x, sp28.z) - 32768;
    camera->unk18 = mathutil_atan2(sp28.y, mathutil_sqrt(sum_of_sq(sp28.x, sp28.z)));
    camera->unk1C = 0;

    camera->unkA0.x = camera->unkC.x - sp10.x;
    camera->unkA0.y = camera->unkC.y - sp10.y;
    camera->unkA0.z = camera->unkC.z - sp10.z;
}

void func_8001CD4C(struct Camera *camera, struct Ball *ball)
{
    Vec sp10;
    int r31;
    float f1;

    camera_clear(camera);

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y + 0.5;
    camera->unkC.z = ball->unk4.z;

    r31 = ((modeCtrl.unk0 - 30) << 9);
    if (r31 < 0)
        r31 = 0;
    if (r31 < 0x2000)
        f1 = 3.0f;
    else
        f1 = 3.0 + (float)(r31 - 8192) * -3.4877232142857141e-05;

    sp10.x = -ball->unk4.x;
    sp10.y = 0.0f;
    sp10.z = -ball->unk4.z;
    mathutil_vec_set_len(&sp10, &sp10, f1);
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(r31);
    mathutil_mtxA_tf_vec(&sp10, &sp10);

    camera->unk0.x = sp10.x + ball->unk4.x;
    camera->unk0.y = ball->unk4.y + 2.0 + (float)r31 * -3.0517578125e-05;
    camera->unk0.z = sp10.z + ball->unk4.z;

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;

    camera->unk1E = 34;
}

void func_8001CF28(struct Camera *camera, struct Ball *ball)
{
    Vec sp34;
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    int r28;
    float f31;
    float f30;

    if (lbl_802F1EE0 & 0xA)
        return;

    sp1C = camera->unk0;  // unused
    sp10 = camera->unkC;

    camera->unkC.x += (ball->unk4.x - camera->unkC.x) * 0.5;
    camera->unkC.y += (ball->unk4.y + 0.5 - camera->unkC.y) * 0.5;
    camera->unkC.z += (ball->unk4.z - camera->unkC.z) * 0.5;

    r28 = ((modeCtrl.unk0 - 30) << 9);
    if (r28 < 0)
        r28 = 0;
    if (r28 < 0x2000)
        f30 = 3.0f;
    else
        f30 = 3.0 + (float)(r28 - 8192) * -3.4877232142857141e-05;

    sp34.x = -ball->unk4.x;
    sp34.y = 0.0f;
    sp34.z = -ball->unk4.z;
    f31 = vec_mag(&sp34);
    mathutil_vec_set_len(&sp34, &sp34, f30);

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(r28);
    mathutil_mtxA_tf_vec(&sp34, &sp34);

    sp28.x = sp34.x + ball->unk4.x;
    sp28.y = ball->unk4.y + 2.0 * (f31 / 10.0) + (float)r28 * -3.0517578125e-05;
    sp28.z = sp34.z + ball->unk4.z;

    if (modeCtrl.unk0 > 15)
    {
        camera->unk94.x += ((sp28.x - camera->unk0.x) * 0.15 - camera->unk94.x) * 0.4;
        camera->unk94.y += ((sp28.y - camera->unk0.y) * 0.15 - camera->unk94.y) * 0.4;
        camera->unk94.z += ((sp28.z - camera->unk0.z) * 0.15 - camera->unk94.z) * 0.4;
    }
    else
    {
        camera->unk94.x += ((sp28.x - camera->unk0.x) * 0.3 - camera->unk94.x) * 0.8;
        camera->unk94.y += ((sp28.y - camera->unk0.y) * 0.3 - camera->unk94.y) * 0.8;
        camera->unk94.z += ((sp28.z - camera->unk0.z) * 0.3 - camera->unk94.z) * 0.8;
    }

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    sp34.x = camera->unkC.x - camera->unk0.x;
    sp34.y = camera->unkC.y - camera->unk0.y;
    sp34.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp34.x, sp34.z) - 32768;
    camera->unk18 = mathutil_atan2(sp34.y, mathutil_sqrt(sum_of_sq(sp34.x, sp34.z)));
    camera->unk1C = 0;

    camera->unkA0.x = camera->unkC.x - sp10.x;
    camera->unkA0.y = camera->unkC.y - sp10.y;
    camera->unkA0.z = camera->unkC.z - sp10.z;
}

void func_8001D32C(struct Camera *camera, struct Ball *ball)
{
    camera->unk1E = 36;
    camera_sub_36(camera, ball);
}

// maybe some kind of dot product that's partially optimized out?
static inline float weird_inline_stuff(register float x1, register float x2, register float z1, register float y1, register float y2, register float z2)
{
#ifdef __MWERKS__
    asm
    {
        fmuls x1, x1, x2
        fmadds x1, y1, y2, x1
        fmadds x1, z1, z2, x1
    }
    return x1;
#else
    return x1 * x2 + y1 * y2 + z1 * z2;
#endif
}

void camera_sub_36(struct Camera *camera, struct Ball *ball)
{
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    float f1;
    float f31;
    float f30;

    if (lbl_802F1EE0 & 0xA)
        return;

    sp1C = camera->unk0;
    sp10 = camera->unkC;

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y + 0.5;
    camera->unkC.z = ball->unk4.z;

    sp28.x = -ball->unk4.x;
    sp28.y = 0.0f;
    sp28.z = -ball->unk4.z;

    f31 = vec_mag(&sp28);
    mathutil_vec_set_len(&sp28, &sp28, 3.0f);

    sp28.x += ball->unk4.x;
    sp28.z += ball->unk4.z;
    sp28.x += (camera->unk0.x - sp28.x) * 0.95;
    sp28.z += (camera->unk0.z - sp28.z) * 0.95;
    sp28.x -= ball->unk4.x;
    sp28.z -= ball->unk4.z;
    mathutil_vec_set_len(&sp28, &sp28, 3.0f);

    sp28.y = ball->unk4.y + (f31 / 10.0) * 2.0;
    camera->unk0.x = sp28.x + ball->unk4.x;
    camera->unk0.y += (sp28.y - camera->unk0.y) * 0.1;
    camera->unk0.z = sp28.z + ball->unk4.z;

    f1 = camera->unk0.x * camera->unk0.x + camera->unk0.z * camera->unk0.z;
    f31 = weird_inline_stuff(ball->unk4.x, camera->unk0.x, ball->unk4.z, 0.0f, 0.0f, camera->unk0.z);

    if (f1 < 4.0f || f31 < 0.0f)
    {
        f30 = mathutil_sqrt(f1);
        sp28.x = ball->unk4.x * 0.2f + sp1C.x;
        sp28.y = 0.0f;
        sp28.z = ball->unk4.z * 0.2f + sp1C.z;
        if (f30 < 1.0f || f31 < 0.0f)
        {
            mathutil_vec_set_len(&sp28, &sp28, 1.0f);
            camera->unk0.x = sp28.x;
            camera->unk0.z = sp28.z;
        }
        else
        {
            float f2;
            mathutil_vec_set_len(&sp28, &sp28, 1.0f);
            f2 = 2.0f;
            f2 -= f30;
            camera->unk0.x += (sp28.x - camera->unk0.x) * f2;
            camera->unk0.z += (sp28.z - camera->unk0.z) * f2;
        }
    }

    sp28.x = camera->unkC.x - camera->unk0.x;
    sp28.y = camera->unkC.y - camera->unk0.y;
    sp28.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp28.x, sp28.z) - 32768;
    camera->unk18 = mathutil_atan2(sp28.y, mathutil_sqrt(sum_of_sq(sp28.x, sp28.z)));
    camera->unk1C = 0;

    camera->unk94.x = camera->unk0.x - sp1C.x;
    camera->unk94.y = camera->unk0.y - sp1C.y;
    camera->unk94.z = camera->unk0.z - sp1C.z;

    camera->unkA0.x = camera->unkC.x - sp10.x;
    camera->unkA0.y = camera->unkC.y - sp10.y;
    camera->unkA0.z = camera->unkC.z - sp10.z;
}

void func_8001D708(struct Camera *camera, struct Ball *ball)
{
    Vec sp28;
    Vec sp1C;
    Vec sp10;

    if (lbl_802F1EE0 & 0xA)
        return;

    sp1C = camera->unk0;
    sp10 = camera->unkC;

    camera->unkC.x = ball->unk4.x;
    camera->unkC.y = ball->unk4.y + 0.5;
    camera->unkC.z = ball->unk4.z;

    sp28.x = -decodedStageLzPtr->unk1C->unk0.x;
    sp28.y = 0.0f;
    sp28.z = -decodedStageLzPtr->unk1C->unk0.z;
    mathutil_vec_set_len(&sp28, &sp28, 3.0f);

    sp28.x += ball->unk4.x;
    sp28.z += ball->unk4.z;
    sp28.x += (camera->unk0.x - sp28.x) * 0.95;
    sp28.z += (camera->unk0.z - sp28.z) * 0.95;
    sp28.x -= ball->unk4.x;
    sp28.z -= ball->unk4.z;
    mathutil_vec_set_len(&sp28, &sp28, 3.0f);

    camera->unk0.x = sp28.x + ball->unk4.x;
    camera->unk0.y = ball->unk4.y + 2.0;
    camera->unk0.z = sp28.z + ball->unk4.z;

    sp28.x = camera->unkC.x - camera->unk0.x;
    sp28.y = camera->unkC.y - camera->unk0.y;
    sp28.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp28.x, sp28.z) - 32768;
    camera->unk18 = mathutil_atan2(sp28.y, mathutil_sqrt(sum_of_sq(sp28.x, sp28.z)));
    camera->unk1C = 0;

    camera->unk94.x = camera->unk0.x - sp1C.x;
    camera->unk94.y = camera->unk0.y - sp1C.y;
    camera->unk94.z = camera->unk0.z - sp1C.z;

    camera->unkA0.x = camera->unkC.x - sp10.x;
    camera->unkA0.y = camera->unkC.y - sp10.y;
    camera->unkA0.z = camera->unkC.z - sp10.z;
}

void func_8001D968(struct Camera *camera, struct Ball *ball) {}

void func_8001D96C(struct Camera *camera, struct Ball *ball) {}

void func_8001D970(struct Camera *camera, struct Ball *ball)
{
    camera_clear(camera);
    camera->unk50 = 0;
    camera->unk26 = 6;
    camera_sub_42(camera, ball);
    camera->unk1E = 42;
}

Vec lbl_80177264[] =
{
    {0,  2.3,  -4},
    {0,  0.4,  -4},
    {0,  0.4,  -3},
    {0,  0.4,   0},
    {0,    4,  -2},
    {0, -150, 580},
};

struct Struct802F1C28
{
    u8 filler0[0x30];
    float unk30;
    float unk34;
    float unk38;
};

extern struct Struct802F1C28 *lbl_802F1C28;

void camera_sub_42(struct Camera *camera, struct Ball *ball)
{
    Vec sp1C;
    Vec sp10;
    struct Struct802F1C28 *r5 = lbl_802F1C28;

    if ((lbl_802F1EE0 & 0xA) && camera->unk1E == 42)
        return;

    if (camera->unk50 < 0x1E0)
    {
        Vec *r3 = &lbl_80177264[0];
        Vec *r4 = &lbl_80177264[1];
        float val = camera->unk50 / 480.0f;

        val = (3.0 + -2.0 * val) * (val * val);

        camera->unk0.x = r3->x * (1.0 - val) + r4->x * val;
        camera->unk0.y = r3->y * (1.0 - val) + r4->y * val;
        camera->unk0.z = r3->z * (1.0 - val) + r4->z * val;

        camera->unkC.x = r5->unk30;
        camera->unkC.y = r5->unk34 + 0.4 + camera->unk0.y - 0.4;
        camera->unkC.z = r5->unk38;
    }
    else if (camera->unk50 < 0x258)
    {
        camera->unk0.x = lbl_80177264[1].x;
        camera->unk0.y = lbl_80177264[1].y;
        camera->unk0.z = lbl_80177264[1].z;

        camera->unkC.x = r5->unk30;
        camera->unkC.y = r5->unk34 + 0.4;
        camera->unkC.z = r5->unk38;
    }
    else if (camera->unk50 < 0x474)
    {

        Vec *r4 = &lbl_80177264[2];
        float val = (float)(camera->unk50 - 600) / 540.0f;
        int r30;

        val = (3.0 + -2.0 * val) * (val * val);

        camera->unk0.x = r4->x;
        camera->unk0.y = r4->y;
        camera->unk0.z = r4->z;

        camera->unkC.x = r5->unk30;
        camera->unkC.y = r5->unk34 + 0.4;
        camera->unkC.z = r5->unk38;

        sp1C.x = camera->unk0.x - camera->unkC.x;
        sp1C.y = camera->unk0.y - camera->unkC.y;
        sp1C.z = camera->unk0.z - camera->unkC.z;

        r30 = -8192.0 * (1.0 - val) + 8192.0f * val;
        mathutil_mtxA_from_translate(&camera->unkC);
        mathutil_mtxA_rotate_y(r30);
        mathutil_mtxA_tf_point(&sp1C, &camera->unk0);
    }
    else if (camera->unk50 < 0x4B0)
    {
        camera->unk0.x = lbl_80177264[4].x;
        camera->unk0.y = lbl_80177264[4].y;
        camera->unk0.z = lbl_80177264[4].z;

        camera->unkC.x = r5->unk30;
        camera->unkC.y = r5->unk34 + 0.4;
        camera->unkC.z = r5->unk38;
    }
    else
    {
        float val = (float)(camera->unk50 - 1200) / 165.0f;

        val = CLAMP(val, 0.0, 1.0);
        val = -2.0 * val * val * val + 3.0 * val * val;

        camera->unk0.x = lbl_80177264[4].x;
        camera->unk0.y = lbl_80177264[4].y;
        camera->unk0.z = lbl_80177264[4].z - val * 2.6;

        camera->unkC.x = r5->unk30;
        camera->unkC.y = 0.4 + val * 15.0;
        camera->unkC.z = r5->unk38;
    }

    sp10.x = camera->unkC.x - camera->unk0.x;
    sp10.y = camera->unkC.y - camera->unk0.y;
    sp10.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp10.x, sp10.z) - 32768;
    camera->unk18 = mathutil_atan2(sp10.y, mathutil_sqrt(sum_of_sq(sp10.x, sp10.z)));
    camera->unk1C = 0;

    if (lbl_801F3D88.unk0 & (1<<(31-0x17)))
        camera->unk50 += 2;
    else
        camera->unk50 += 1;
}

struct Struct801EFB94
{
    s32 unk0;
    s32 unk4;
    struct Struct8009F7F0 unk8;
};

extern struct Struct801EFB94 lbl_801EFB94[];

static inline int func_8001DDF0_inline(int a, int b)
{
    int temp = a / b;
    return temp * b;
}

void func_8001DDF0(struct Camera *camera, struct Ball *ball)
{
    u32 sp50[32];
    u8 unused2[0x14];
    Vec sp30;
    u8 unused[0x14];
    Vec sp10;
    int r31;
    struct Struct801EFB94 *r30;
    float f31;
    int r4;
    int r5;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera_clear(camera);

    camera->unk50 = 0;
    r30 = &lbl_801EFB94[camera->unk204];
    f31 = func_8004964C(lbl_80250A68.unk0[ball->unk2E]);
    g_get_replay_info(lbl_80250A68.unk0[ball->unk2E], &r30->unk8);

    r31 = 0;
    sp50[r31] = 5;
    r31++;
    if ((r30->unk8.flags & 1) && lbl_80250A68.unk10 > f31 - 240.0f)
    {
        sp50[r31] = 16;
        r31++;
    }
    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp10, lbl_80250A68.unk10);
    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp30, 0.0f);
    if (vec_distance(&sp10, &sp30) < 16.0)
    {
        sp50[r31] = 7;
        r31++;
    }
    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp30, lbl_80250A68.unk10 - 60.0);
    if (vec_distance(&sp10, &sp30) > 1.0 && lbl_80250A68.unk10 > 240.0)
    {
        sp50[r31] = 46;
        r31++;
    }
    sp50[r31] = 48;
    r31++;

    r4 = (rand() & 0x7FFF);
    r5 = r4 - func_8001DDF0_inline(r4, r31);
    r4 = sp50[r5];
    if (r4 == r30->unk4)
    {
        r5++;
        r5 -= func_8001DDF0_inline(r5, r31);
        r4 = sp50[r5];
    }
    r30->unk4 = r4;
    camera->unk1E = r4;
    lbl_80176200[r4](camera, ball);
    r30->unk0 = camera->unk1E;
    camera->unk1E = 0x2D;
}

void func_8001E0A8(struct Camera *camera, struct Ball *ball)
{
    u8 unused[0x10];
    Vec sp10;
    struct Struct801EFB94 *r31;
    u32 bvar;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera->unk50++;
    r31 = &lbl_801EFB94[camera->unk204];
    lbl_80176200[r31->unk0](camera, ball);
    if (camera->unk1E != 0x2D)
    {
        r31->unk0 = camera->unk1E;
        camera->unk1E = 0x2D;
        camera->unk50 = 0;
    }

    bvar = 0;
    switch (r31->unk0 - 8)
    {
    case 39:
        if (!(camera->unk50 & 0x1F))
        {
            func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp10, lbl_80250A68.unk10 - 60.0);
            if (vec_distance(&ball->unk4, &sp10) < 0.5)
                bvar = 1;
        }
        // fall through
    case 0:
    case 9:
        if (camera->unk50 > 0x78 && !(camera->unk50 & 0x3F))
        {
            if (vec_distance(&ball->unk4, &camera->unk0) > 16.0)
                bvar = 1;
        }
        if (camera->unk50 > 0x168)
            bvar = 1;
        break;
    case 41:
        if (camera->unk50 > 0xF0 && !(camera->unk50 & 0x1F) && (rand() & 1))
            bvar = 1;
        break;
    case 1:
    case 10:
    case 12:
        if (camera->unk50 > 0x78 && !(camera->unk50 & 0x1F) && (rand() & 1))
            bvar = 1;
        break;
    }
    if (bvar && ball->unk3 == 10)
        camera->unk1E = 0x2C;
}

void func_8001E2E8(struct Camera *camera, struct Ball *ball)
{
    u8 unused[0x10];
    Vec sp10;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera_clear(camera);
    camera->unk26 = 0;
    camera->unk24 |= 4;
    if (lbl_80250A68.unk10 > 180.0)
        camera->unk60 = lbl_80250A68.unk10 - ((rand() / 32767.0f) * 1.5 + 0.5) * 60.0;
    else
        camera->unk60 = lbl_80250A68.unk10 * ((rand() / 32767.0f) * 0.5 + 0.5);
    camera->unk64 = (rand() / 32767.0f) * 2.0 + 0.3;
    camera->unk80 = camera->unk60 * ((rand() / 32767.0f) * 0.5 + 0.2);
    camera->unk80 = (camera->unk80 - camera->unk60) / lbl_80250A68.unk10;
    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp10, camera->unk60);
    camera->unk54 = sp10;
    camera->unk0 = sp10;
    camera->unk74.x = 0.0f;
    camera->unk74.y = 0.0f;
    camera->unk74.z = 0.0f;
    camera->unkC = ball->unk4;
    camera->unk1E = 0x2F;
    camera_sub_47(camera, ball);
}

void camera_sub_47(struct Camera *camera, struct Ball *ball)
{
    Vec sp3C;
    Vec sp30;
    u8 unused[0x14];
    Vec sp10;
    float f1;
    float f31;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera->unk60 += camera->unk80;
    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp10, camera->unk60);
    f1 = vec_distance(&ball->unk4, &camera->unk0);
    f31 = 2.0 - f1 * 0.125;
    if (f31 < 0.0)
        f31 = 0.0f;
    sp30.x = ball->unk1C.z;
    sp30.y = 0.0f;
    sp30.z = ball->unk1C.x;

    sp3C.x = camera->unk0.x - ball->unk4.x;
    sp3C.y = 0.0f;
    sp3C.z = camera->unk0.z - ball->unk4.z;
    mathutil_vec_normalize_len(&sp30);
    mathutil_vec_normalize_len(&sp3C);

    if (sp30.x * sp3C.x + sp30.z * sp3C.z < -0.1)
    {
        sp30.x = -sp30.x;
        sp30.z = -sp30.z;
    }
    //lbl_8001E680
    if (sp30.x == 0.0 && sp30.z == 0.0)
    {
        sp30.x = sp3C.x;
        sp30.z = sp3C.z;
    }
    //lbl_8001E6AC
    mathutil_vec_set_len(&sp30, &sp30, camera->unk64 * 2.0 * f31);
    camera->unk74.x += (sp30.x - camera->unk74.x) * 0.05;
    camera->unk74.z += (sp30.z - camera->unk74.z) * 0.05;
    camera->unk54.x = sp10.x;
    camera->unk54.y = sp10.y;
    camera->unk54.z = sp10.z;

    camera->unk94.x = (sp10.x + camera->unk74.x - camera->unk0.x) * 0.1;
    camera->unk94.y = (sp10.y + camera->unk64 - camera->unk0.y) * 0.1;
    camera->unk94.z = (sp10.z + camera->unk74.z - camera->unk0.z) * 0.1;

    camera->unk0.x += camera->unk94.x;
    camera->unk0.y += camera->unk94.y;
    camera->unk0.z += camera->unk94.z;

    sp3C.x = (ball->unk4.x + 6.0 * ball->unk1C.x) - camera->unkC.x;
    sp3C.y = (ball->unk4.y + 6.0 * ball->unk1C.y) - camera->unkC.y;
    sp3C.z = (ball->unk4.z + 6.0 * ball->unk1C.z) - camera->unkC.z;

    camera->unkA0.x = sp3C.x * 0.1;
    camera->unkA0.y = sp3C.y * 0.1;
    camera->unkA0.z = sp3C.z * 0.1;

    camera->unkC.x += camera->unkA0.x;
    camera->unkC.y += camera->unkA0.y;
    camera->unkC.z += camera->unkA0.z;

    sp3C.x = camera->unkC.x - camera->unk0.x;
    sp3C.y = camera->unkC.y - camera->unk0.y;
    sp3C.z = camera->unkC.z - camera->unk0.z;

    camera->unk1A = mathutil_atan2(sp3C.x, sp3C.z) - 32768;
    camera->unk18 = mathutil_atan2(sp3C.y, mathutil_sqrt(sum_of_sq(sp3C.x, sp3C.z)));
    camera->unk1C = 0;

    if (lbl_80250A68.unk10 < 60.0f)
        camera->unk1E = 14;
}

void func_8001E924(struct Camera *camera, struct Ball *ball)
{
    Vec sp58;
    Vec sp4C;
    struct Struct8009F7F0 sp34;
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    float f31;

    if (lbl_802F1EE0 & 0xA)
        return;

    camera_clear(camera);
    camera->unk24 |= 4;
    g_get_replay_info(lbl_80250A68.unk0[ball->unk2E], &sp34);

    if (!(sp34.flags & 1)
     || lbl_801F3A58.unkC >= decodedStageLzPtr->unk18
     || lbl_801F3A58.unkE >= decodedStageLzPtr->unk8)
    {
        camera->unk10E = 0;
        camera->unk110 = -1;

        sp58.x = (rand() / 32767.0f) - 0.5;
        sp58.y = 0.25f;
        sp58.z = (rand() / 32767.0f) - 0.5;
        mathutil_vec_set_len(&sp58, &sp58, (rand() / 32767.0f) * 20.0 + 20.0);
    }
    else
    {
        camera->unk10E = lbl_801F3A58.unkE;
        camera->unk110 = lbl_801F3A58.unkC;

        sp58 = decodedStageLzPtr->unk1C[camera->unk110].unk0;
        mathutil_mtxA_from_mtx(lbl_80206E48[camera->unk10E].unk24);
        mathutil_mtxA_rigid_inv_tf_point(&ball->unk4, &sp28);

        f31 = vec_distance(&sp58, &sp28);
        if (f31 > 60.0)
            f31 = 60.0f;
        else if (f31 < 20.0)
            f31 = 20.0f;

        sp4C.x = (rand() / 32767.0f) - 0.5;
        sp4C.y = 9.9999997473787516e-05f;
        sp4C.z = (rand() / 32767.0f) - 0.5;
        mathutil_vec_set_len(&sp4C, &sp4C, f31);

        sp4C.y = f31 * ((rand() / 32767.0f) * 0.5 + 0.5);
        if (camera->unk10E != 0)
        {
            sp58.x = sp4C.x;
            sp58.y = sp4C.y;
            sp58.z = sp4C.z;
        }
        else
        {
            sp58.x = sp4C.x + (sp58.x + sp28.x) * 0.5 - sp58.x;
            sp58.y = sp4C.y + (sp58.y + sp28.y) * 0.5 - sp58.y;
            sp58.z = sp4C.z + (sp58.z + sp28.z) * 0.5 - sp58.z;
        }
    }
    camera->unk114 = sp58;

    mathutil_mtxA_from_mtx(lbl_80206E48[camera->unk10E].unk24);
    if (camera->unk110 >= 0)
    {
        mathutil_mtxA_translate(&decodedStageLzPtr->unk1C[camera->unk110].unk0);
        mathutil_mtxA_sq_from_identity();
    }
    f31 = (float)camera->sub28.unk32 * ((rand() / 32767.0f) + 0.1f);
    mathutil_mtxA_rotate_y((s16)(f31 * ((rand() / 32767.0f) - 0.5f)));
    mathutil_mtxA_rotate_x((s16)(f31 * ((rand() / 32767.0f) - 0.5f)));
    mathutil_mtxA_rigid_inv_tf_point(&ball->unk4, &camera->unk12C);
    mathutil_mtxA_rigid_inv_tf_vec(&ball->unk1C, &camera->unk138);

    mathutil_mtxA_from_mtx(lbl_80206E48[camera->unk10E].unk24);
    if (camera->unk110 >= 0)
    {
        mathutil_mtxA_translate(&decodedStageLzPtr->unk1C[camera->unk110].unk0);
        mathutil_mtxA_sq_from_identity();
    }
    mathutil_mtxA_tf_point(&camera->unk114, &camera->unk0);
    mathutil_mtxA_tf_point(&camera->unk12C, &camera->unkC);

    camera->unk6C = ((rand() / 32767.0f) + 0.5f) * 15.0f;
    sp4C = camera->unk114;

    mathutil_mtxA_from_mtx(lbl_80206E48[camera->unk10E].unk24);
    if (camera->unk110 >= 0)
    {
        mathutil_mtxA_translate(&decodedStageLzPtr->unk1C[camera->unk110].unk0);
        mathutil_mtxA_sq_from_identity();
    }
    mathutil_mtxA_tf_point(&sp4C, &sp1C);

    mathutil_mtxA_from_mtx(lbl_80206E48[camera->unk10E].unk54);
    if (camera->unk110 >= 0)
    {
        mathutil_mtxA_translate(&decodedStageLzPtr->unk1C[camera->unk110].unk0);
        mathutil_mtxA_sq_from_identity();
    }
    mathutil_mtxA_tf_point(&sp4C, &sp10);

    sp4C.x = sp1C.x - sp10.x;
    sp4C.y = sp1C.y - sp10.y;
    sp4C.z = sp1C.z - sp10.z;

    camera->unk94 = sp4C;
    camera->unk54 = sp4C;
    camera->unk68 = 1;
    camera->unk1E = 49;
    camera->unk26 = 5;
    camera->sub28.unk30 = f31;
    camera_sub_49(camera, ball);
}

/*
const double lbl_802F2C30 = 0.0;
const double lbl_802F2C48 = 2.0;
const float lbl_802F2C50 = -0.3;
const double lbl_802F2C60 = 1.0;
const float lbl_802F2D18 = 42.0f;
const double lbl_802F2D20 = 3;
const double lbl_802F2D28 = -2;
const double lbl_802F2D30 = 31.25;
const float lbl_802F2D38 = 31.25;
const float lbl_802F2D3C = 1.1920928955078125e-07;
const double lbl_802F2D40 = 0.1;
const double lbl_802F2D48 = 5;
const double lbl_802F2D50 = 9;
const double lbl_802F2D58 = 170;
const double lbl_802F2D60 = 74;
const double lbl_802F2D68 = 0.09;
const double lbl_802F2D70 = 0.3;
const double lbl_802F2D78 = 0.97;
const double lbl_802F2D80 = 0.955;
const double lbl_802F2D88 = 0.25;
const float lbl_802F2D90 = 32767.0f;
const double lbl_802F2D98 = 0.96592582630000001;
const double lbl_802F2DA0 = 0.25881904509999998;
const float lbl_802F2DA8 = 60.0f;
const double lbl_802F2DB0 = 0.14999999999999999;
const double lbl_802F2DB8 = -0.01;
const double lbl_802F2DC0 = 0.08;
const double lbl_802F2DC8 = 16.0;
const double lbl_802F2DD0 = 2.5;
const double lbl_802F2DD8 = 0.02;
const float lbl_802F2DE0 = 2.0f;
const double lbl_802F2DE8 = 0.35;
const double lbl_802F2DF0 = 4.0;
const float lbl_802F2DF8 = 2.5f;
const float lbl_802F2DFC = 5.0f;
const double lbl_802F2E00 = 0.98;
const double lbl_802F2E08 = 12.0;
const double lbl_802F2E10 = 0.04;
const double lbl_802F2E18 = 0.05;
const float lbl_802F2E20 = -4.0f;
const double lbl_802F2E28 = 0.92;
const double lbl_802F2E30 = -1.4;
const float lbl_802F2E38 = -0.4f;
const float lbl_802F2E3C = -5.0f;
const float lbl_802F2E40 = -3.6f;
const double lbl_802F2E48 = -3.4877232142857141e-05;
const double lbl_802F2E50 = -3.0517578125e-05;
const double lbl_802F2E58 = 10.0;
const double lbl_802F2E60 = 0.95;
const float lbl_802F2E68 = 4.0f;
const float lbl_802F2E6C = 0.2f;
const float lbl_802F2E70 = 480.0f;
const float lbl_802F2E74 = 540.0f;
const double lbl_802F2E78 = -8192.0;
const float lbl_802F2E80 = 8192.0f;
const float lbl_802F2E84 = 165.0f;
const double lbl_802F2E88 = 2.6;
const double lbl_802F2E90 = 15.0;
const float lbl_802F2E98 = 240.0f;
const double lbl_802F2EA0 = 60.0;
const double lbl_802F2EA8 = 240.0;
const double lbl_802F2EB0 = 180.0;
const double lbl_802F2EB8 = 1.5;
const double lbl_802F2EC0 = 0.125;
const double lbl_802F2EC8 = -0.1;
const double lbl_802F2ED0 = 6.0;
const float lbl_802F2ED8 = 0.25f;
const double lbl_802F2EE0 = 20.0;
const float lbl_802F2EE8 = 20.0f;
const float lbl_802F2EEC = 9.9999997473787516e-05f;
const float lbl_802F2EF0 = 15.0f;
*/
const float lbl_802F2EF4 = 0.4f;
