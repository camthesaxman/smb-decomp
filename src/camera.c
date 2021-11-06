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

void func_80018C58(register struct Camera *camera)
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
