#include <string.h>
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
            if (dipSwitches & (1<<(31-0x13)))
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

void func_80018128(int a, float b, float c, float d, float e)
{
    struct Camera *camera = &cameraInfo[a];

    camera->sub28.unk40 = b;
    camera->sub28.unk44 = c;
    camera->sub28.unk48 = d;
    camera->sub28.unk4C = e;
    if (d > 0.0f && e > 0.0f)
    {
        camera->sub28.unk34 = 1.33333333f * (d / e);
        if (e == 1.0f)
            camera->sub28.unk32 = 0x2AAA;
        else
        {
            float f1 = (0.5f + 0.5f * e) * mathutil_tan(0x1555);
            s16 r0 = mathutil_atan2(f1, 1.0f) * 2;
            camera->sub28.unk32 = r0;
            camera->sub28.unk30 = camera->sub28.unk32;
        }
    }
    if (lbl_802F1C40 == a)
        func_80018330(a);
}

float lbl_80176360[] = {0.0f, 0.0f, 1.0f, 1.0f};
float lbl_80176370[] = {0.0f, 0.0f, 1.0f, 0.5f, 0.0f, 0.5f, 1.0f, 0.5f};
float lbl_80176390[] = {0.0f, 0.0f, 1.0f, 0.5f, 0.0f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f};
float lbl_801763C0[] = {0.0f, 0.0f, 0.5f, 0.5f, 0.5f, 0.0f, 0.5f, 0.5f, 0.0f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f};
float *lbl_80176400[] = {lbl_80176360, lbl_80176370, lbl_80176390, lbl_801763C0};

void func_8001820C(int playerNum)
{
    int i;
    float *ptr;

    if (playerNum < 1 || playerNum > 4)
        OSPanic("camera.c", 598, "Ielligal player number");
    ptr = lbl_80176400[playerNum - 1];
    for (i = 0; i < 4; i++)
    {
        if (i >= playerNum)
            func_80018128(i, 0.0f, 0.0f, 0.0f, 0.0f);
        else
        {
            func_80018128(i, ptr[0], ptr[1], ptr[2], ptr[3]);
            ptr += 4;
        }
    }
}

void func_800182CC(void)
{
    int i;

    for (i = 0; i < 4; i++)
        func_80018128(i, 0.0f, 0.0f, 0.0f, 0.0f);
    func_80018128(0, 0.0f, 0.0f, 1.0f, 1.0f);
}

void func_80018330(int a)
{
    u8 unused[0x10];
    struct Camera *camera = &cameraInfo[a];
    Mtx projMtx;

    lbl_802F1C40 = a;
    lbl_802F1C34 = a;
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
    if (gameMode == MD_MINI && gameSubmode == SMD_MINI_BILLIARDS_MAIN && a == 0)
    {
        C_MTXPerspective(
            projMtx,
            0.0054931640625f * camera->sub28.unk30,
            camera->sub28.unk34,
            0.17320509254932404f / camera->sub28.unk38,
            20000.0f);
    }
    else
    {
        C_MTXPerspective(
            projMtx,
            0.0054931640625f * camera->sub28.unk30,
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
        0.0054931640625f * camera->sub28.unk30,
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
void func_80018680(int a)
{
    u8 unused[0x10];
    struct Camera *camera = &cameraInfo[a];
    Mtx projMtx;

    lbl_802F1C40 = a;
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
    if (gameMode == MD_MINI && gameSubmode == SMD_MINI_BILLIARDS_MAIN && a == 0)
    {
        C_MTXPerspective(
            projMtx,
            0.0054931640625f * camera->sub28.unk30,
            camera->sub28.unk34,
            0.17320509254932404f / camera->sub28.unk38,
            20000.0f);
    }
    else
    {
        C_MTXPerspective(
            projMtx,
            0.0054931640625f * camera->sub28.unk30,
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
        0.0054931640625f * camera->sub28.unk30,
        camera->sub28.unk34,
        camera->sub28.unk28,
        camera->sub28.unk2C);
}

void func_800188A8(int a)
{
    if (lbl_802F1C40 != a)
        func_80018680(a);
}

void func_800188D4(void)
{
    u8 unused[0x10];
    struct Camera *camera = &cameraInfo[0];
    Mtx projMtx;

    C_MTXPerspective(
        projMtx,
        0.0054931640625f * camera->sub28.unk30,
        camera->sub28.unk34,
        0.1f,
        20000.0f);
    projMtx[0][2] -= projMtx[0][0] * camera->sub28.unk28 * camera->sub28.unk34 * camera->sub28.unk38;
    projMtx[1][2] -= projMtx[1][1] * camera->sub28.unk2C * camera->sub28.unk38;
    GXSetProjection(projMtx, 0);
}

void func_8001898C(int a, int b, Vec *c)
{
    struct Camera *camera = &cameraInfo[a];

    camera->unkEC = 1;
    camera->unk100 += c->x;
    camera->unk104 += c->y;
    camera->unk108 += c->z;
    if (b < 0 || camera->unkF0 < 0)
        camera->unkF0 = -1;
    else if (camera->unkF0 < b)
        camera->unkF0 = b;
}

void func_80018A04(int a)
{
    int i;
    struct Camera *camera;

    for (i = 0, camera = &cameraInfo[0]; i < 4; i++, camera++)
    {
        if (!(camera->unk24 & (1<<(31-0x1A))))
        {
            camera->unk1E = a;
            camera->unk1F = 0;
        }
    }
}

void func_80018A74(int a, int b)
{
    int i;
    struct Camera *camera = &cameraInfo[0];

    if (b)
    {
        for (i = 0; i < 4; i++, camera++)
            camera->unk24 |= a;
    }
    else
    {
        for (i = 0; i < 4; i++, camera++)
            camera->unk24 &= ~a;
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
    {0, -15.413999557495117f, 0.0f, 0.0f},
    {0xA5, -14.75100040435791f, 0.0f, 0.0f},
    // TODO: rest of entries
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
        float f30;
        float f7;
        float f5;
        Vec sp10;

        if (camera->unk50 > 0)
        {
            camera->unk50--;
            if (lbl_801F3A58.unk1E == 1 && (lbl_801F3D88.unk0 & (1<<(31-0x17))) && modeCtrl.unk0 > 0x78)
                camera->unk50--;
        }

        f7 = camera->unk50;
        f5 = camera->unk52;
        f7 = f7 / f5;
        f30 = (3.0 + -2.0 * f7) * (f7 * f7);

        camera->unkC.x = camera->unk74.x * (1.0 - f30) + camera->unk54.x * f30;
        camera->unkC.y = camera->unk74.y * (1.0 - f30) + camera->unk54.y * f30;
        camera->unkC.z = camera->unk74.z * (1.0 - f30) + camera->unk54.z * f30;

        camera->unk18 = (double)camera->unk68 + (s16)(camera->unk88 - camera->unk68) * (1.0 - f30);
        camera->unk1A = (double)camera->unk6C + (camera->unk8C - camera->unk6C) * (1.0 - f30);
        camera->unk1C = (double)camera->unk70 + (s16)(camera->unk90 - camera->unk70) * (1.0 - f30);

        mathutil_mtxA_from_translate(&camera->unkC);
        mathutil_mtxA_rotate_y(camera->unk1A);

        sp10.x = 0.0f;
        sp10.y = (1.0 - f30) + camera->unk64 * f30;
        sp10.z = (1.0 - f30) * 3.0 + camera->unk60 * f30;
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

extern struct Struct80177214 lbl_80177214[];

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

//const float lbl_802F2D18 = 42.0f;
//const double lbl_802F2D20 = 3;
//const double lbl_802F2D28 = -2;
//const double lbl_802F2D30 = 31.25;
//const float lbl_802F2D38 = 31.25;
//const float lbl_802F2D3C = 1.1920928955078125e-07;
//const double lbl_802F2D40 = 0.1;
//const double lbl_802F2D48 = 5;
//const double lbl_802F2D50 = 9;
//const double lbl_802F2D58 = 170;
//const double lbl_802F2D60 = 74;
//const double lbl_802F2D68 = 0.09;

//const double lbl_802F2D70 = 0.3;
//const double lbl_802F2D78 = 0.97;
//const double lbl_802F2D80 = 0.955;
const double lbl_802F2D88 = 0.25;
