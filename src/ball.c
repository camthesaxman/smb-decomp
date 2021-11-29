#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "camera.h"
#include "game.h"
#include "mathutil.h"

//u8 ballInfo[0x10];
float ballInfo[4];
Mtx lbl_80205E30;  // ballInfo + 0x10
struct Ball lbl_80205E60[8];  // ballInfo + 0x40
s32 lbl_80206B80[16];  // ballInfo + 0xD60
s32 lbl_80206BC0[4];  // ballInfo + 0xDA0

FORCE_BSS_ORDER(ballInfo)
FORCE_BSS_ORDER(lbl_80205E30)
FORCE_BSS_ORDER(lbl_80205E60)
FORCE_BSS_ORDER(lbl_80206B80)
FORCE_BSS_ORDER(lbl_80206BC0)

void func_8003699C(struct Ball_child *a)
{
    struct Ball *ball = &lbl_80205E60[a->unkC0];
    Quaternion quat;
    Vec sp48;
    Vec sp3C = {0.0f, 1.0f, 0.0f};
    float f1;

    ball->unkA8.w /= 0.65f;
    ball->unkA8.x *= 0.65f;
    ball->unkA8.y *= 0.65f;
    ball->unkA8.z *= 0.65f;

    mathutil_quat_normalize(&ball->unkA8);
    mathutil_mtxA_from_quat(&ball->unkA8);
    mathutil_mtxA_to_mtx(lbl_80205E30);
    mathutil_mtxA_from_quat(&a->unk60);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_left(lbl_80205E30);
    mathutil_mtxA_normalize_basis();

    if (!(ball->unk94 & (1<<(31-0x1A))))
    {
        float f31 = mathutil_vec_mag(&ball->unk1C);
        float f1 = mathutil_vec_mag(&ball->unkB8);

        if (f31 > 0.032407406717538834f)
        {
            if (f1 * 100.0f < ball->unkC4)
                ball->unk94 |= 0x20;
            else if (f1 * 3.0f < ball->unkC4 && f31 * 1.5f < ball->unkF8)
                ball->unk94 |= 0x20;
        }
    }

    if (!(a->unk14 & (1<<(31-0xE))) && ball->unkA8.w < 0.9941f)
        return;

    mathutil_mtxA_to_mtx(lbl_80205E30);

    sp48 = (Vec){0.0f, 1.0f, 0.0f};
    mathutil_mtxA_rigid_inv_tf_vec(&sp48, &sp48);

    f1 = 1.0f - mathutil_vec_dot_normalized(&sp48, &sp3C);
    if (!(a->unk14 & (1<<(31-0xE))) && f1 > 0.01f)
    {
        Vec sp30 = {0.0f, 1.0f, 0.0f};
        if (f1 > 1.999f)
            sp48 = (Vec){1.0f, 0.0f, 0.0f};
        else
            mathutil_vec_cross_prod(&sp30, &sp48, &sp48);
        mathutil_quat_from_axis_angle(&quat, &sp48, 0x38E);
    }
    else
    {
        mathutil_quat_from_dirs(&quat, &(Vec){0.0f, 1.0f, 0.0f}, &sp48);
    }

    mathutil_quat_normalize(&quat);
    mathutil_mtxA_from_quat(&quat);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_left(lbl_80205E30);
}

float func_80036CAC(struct Ball_child *a)
{
    struct Ball *ball = &lbl_80205E60[a->unkC0];
    Vec sp4C;
    Vec sp40;
    Quaternion sp30;
    float var1;

    sp4C = ball->unk1C;
    sp4C.y = 0.0f;

    if (mathutil_vec_mag(&sp4C) < 0.00027777777f)
        return 0.0f;

    mathutil_vec_normalize_len(&sp4C);
    mathutil_mtxA_rigid_inv_tf_vec(&sp4C, &sp4C);

    sp40 = (Vec){0.0f, 0.0f, 0.0f};

    var1 = sp4C.x;
    if (var1 > -0.992f)
    {
        float one = 1.0f;  // useless; needed to match
        Vec sp24 = {-1.0f, 0.0f, 0.0f};

        var1 = 1.0f - var1;
        if (var1 > 9.9999999392252903e-09f)
            mathutil_vec_cross_prod(&sp24, &sp4C, &sp40);
        else
        {
            sp40.x = 0.0f;
            sp40.y = 1.0f;
            sp40.z = 0.0f;
        }
        mathutil_quat_from_axis_angle(&sp30, &sp40, 0x2D8);
    }
    else
    {
        mathutil_quat_from_dirs(&sp30, &(Vec){-1.0f, 0.0f, 0.0f}, &sp4C);
    }

    mathutil_mtxA_push();
    mathutil_mtxA_from_quat(&sp30);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_to_mtx(lbl_80205E30);
    mathutil_mtxA_pop();
    mathutil_mtxA_mult_right(lbl_80205E30);
    return mathutil_vec_mag(&ball->unkB8) * 1.5f;
}

void func_80036EB8(struct Ball_child *a)
{
    struct Ball *r31 = &lbl_80205E60[a->unkC0];
    struct Struct8003FB48 sp70;
    struct Struct8003FB48 sp54;
    Vec sp48;
    Vec sp3C;
    Vec spC[] =
    {
        {0.3f,   0.0f, 0.0f},
        {-0.25f, 0.0f, 0.0f},
        {0.1f,   0.0f, -0.2f},
        {0.1f,   0.0f, 0.2f},
    };
    int r29;
    u32 i;

    mathutil_mtxA_push();
    sp48.x = 1.0f;
    sp48.y = 0.0f;
    sp48.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp48, &sp48);
    r29 = -mathutil_atan2(sp48.z, sp48.x) - 32768;
    func_8003FB48(&r31->unk4, &sp70, NULL);
    mathutil_mtxA_from_translate(&r31->unk4);
    mathutil_mtxA_rotate_y(r29);
    r31->unk94 &= ~(1<<(31-0x1E));

    for (i = 0; i < 4; i++)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_tf_point(&spC[i], &sp48);
        func_8003FB48(&sp48, &sp54, NULL);
        mathutil_mtxA_pop();
        if (sp54.unk0 == 0 || sp54.unk4.y < sp70.unk4.y - 1.0)
        {
            r31->unk94 |= 2;
            sp3C.x = sp48.x;
            sp3C.y = r31->unk4.y - 1.0;
            sp3C.z = sp48.z;
            a->unk54 = i;
            func_800390C8(3, &sp3C, 0.5f);
            break;
        }
    }
    mathutil_mtxA_pop();
}

int func_80037098(struct Ball_child *a, struct Ball *ball)
{
    int ret;
    int var1;
    float var2;

    if (lbl_801F3A58.unk22 != 1)
        ret = 5;
    else
        ret = lbl_801F3A58.unk4 * 5 / lbl_801F3A58.unk6;

    ret *= 2;
    if (a->unk24 != 5)
        return ret;

    switch (modeCtrl.unk28)
    {
    case 1:
        var1 = ball->unk126;
        var2 = var1 * 0.2f;
        if (var2 > 3.0f)
            var2 = 3.0f;
        break;
    default:
        var1 = 0;
        var2 = 0.0f;
        break;
    }

    if (!(a->unk14 & (1<<(31-0x12))))
    {
        if (a->unkC2 > var1 || (a->unk14 & (1<<(31-0x11))))
        {
            ret++;
            a->unk0->unk3C = 1.0f;
            a->unk14 |= 0x5000;
        }
        else
            a->unk0->unk3C = var2 + 1.0f;
    }
    else
    {
        a->unk14 |= 0x1000;
        mathutil_mtxA_push();
        mathutil_mtxA_from_quat(&a->unk60);
        mathutil_mtxA_rotate_y(DEGREES_TO_S16(12.0f * var2 + 20.0f));
        mathutil_mtxA_to_quat(&a->unk60);
        mathutil_mtxA_pop();
        ret++;
    }
    return ret;
}

static inline int int_abs(int x)
{
    int temp = (x >> 31);
    return (temp ^ x) - temp;
}

static inline int func_8003721C_inline(struct Ball *ball)
{
    int i;

    if (!(ball->unk94 & (1<<(31-0x13))))
        return 2;

    for (i = 0; i < spritePoolInfo.unk8; i++)
    {
        if (ball->unk2F - 1 == lbl_80205E60[i].unk2F
         && (u16)int_abs(ball->unk12A - lbl_80205E60[i].unk12A) < 30)
            return 3;
    }

    return 2;
}

void func_8003721C(struct Ball_child *a, float b)
{
    struct Ball *ball = &lbl_80205E60[a->unkC0];
    float f31 = b;
    int r29;
    int r28 = 0;
    int r27 = 0;

    if (modeCtrl.unk28 == 8)
        return;

    if (gameSubmode == SMD_GAME_RESULT_MAIN || gameSubmode == SMD_GAME_RESULT_MENU)
    {
        f31 = a->unk54++;
        if (ball->unk2F == 0)
        {
            r29 = 1;
            r27 = 3;
        }
        else if (ball->unk2F == 4)
        {
            r29 = 9;
            r28 = 1;
        }
        else
        {
            r28 = (ball->unk2F - 1) * 2;
            r29 = 5;
        }
    }
    else
    {
        if (a->unk14 & (1<<(31-0x17)))
        {
            r29 = 1;
            r27 = 6;
            func_8008BF00(a, 0);
        }
        else if (a->unk14 & (1<<(31-0x14)))
        {
            r29 = 2;
            r28 = 13;
        }
        else if (a->unk14 & (1<<(31-0xD)))
        {
            r29 = 2;
            r28 = 16;
        }
        else if (gameSubmode == SMD_GAME_EXTRA_WAIT)
        {
            r29 = 5;
            r28 = 12;
        }
        else if (a->unk14 & (1<<(31-0x1E)))
            r29 = 3;
        else if ((ball->unk94 & (3<<(31-0x13))) && !(lbl_801F3A58.unk0 & (1<<(31-0x1B))))
        {
            r29 = 5;
            if (gameMode == MD_ADV && gameSubmode == SMD_ADV_INFO_MAIN)
                r28 = 4;
            else if (gameSubmode == SMD_GAME_NAMEENTRY_MAIN)
            {
                r29 = 2;
                r28 = 14;
            }
            else if (lbl_801F3A58.unk0 & (1<<(31-0x19)))
            {
                r29 = 2;
                r28 = 15;
                if ((float)a->unk0->unk38 > a->unk0->unk3C * 90.0f)
                    a->unk14 |= 0x4000;
            }
            else
                r28 = func_80037098(a, ball);
        }
        else if (ball->unk94 & (1<<(31-0x11)))
        {
            r29 = 2;
            r28 = 12;
            a->unk14 |= 0x1000;
            if (a->unk14 & (1<<(31-0x12)))
                ball->unk94 &= ~(1<<(31-0x11));
        }
        else if (ball->unk94 & (1<<(31-0x10)))
        {
            r29 = 9;
            if (modeCtrl.unk28 == 1)
                r28 = func_8003721C_inline(ball);
            else if (!(lbl_801F3A58.unk0 & (1<<(31-0x19))))
                r28 = (lbl_801F3A58.unk20 & 1) + 2;
            else
                r28 = 0;
        }
        else if (ball->unk94 & (1<<(31-0x1A)))
        {
            r29 = 4;
            f31 = mathutil_vec_mag(&ball->unk1C);
            ballInfo[ball->unk2E] = f31;
        }
        else if (ball->unk94 & (1<<(31-0x1E)))
        {
            r28 = a->unk54;
            r29 = 2;
        }
        else if (a->unk14 & 1)
        {
            r29 = 1;
            f31 = a->unk54++;
            if (gameSubmode == SMD_ADV_INFO_MAIN)
            {
                int r3 = (modeCtrl.unk0 < 0x9D8 && modeCtrl.unk0 > 0x8AC);
                r27 = (r3 != 0) ? 2 : 1;
            }
        }
        else
            r29 = 0;
    }
    if (r29 != 1 || gameSubmode == SMD_GAME_READY_MAIN)
        a->unk54 = 0;
    func_8008BBD4(a, r29, r28, r27, f31);
}

void func_8003765C(struct Ball_child *a)
{
    struct Ball *ball = &lbl_80205E60[a->unkC0];

    mathutil_mtxA_push();
    mathutil_mtxA_from_quat(&a->unk60);
    mathutil_mtxA_tf_vec_xyz(&a->unk3C, 0.0f, -0.12f, 0.0f);
    mathutil_mtxA_pop();

    a->unk30 = ball->unk4;
    a->unk48 = (Vec){0.0f, 0.0f, 0.0f};
}

// needed here due to float constant ordering
static float get_0_05(void) {return 0.05f;}

void func_80037718(void)
{
    Quaternion sp30;
    Vec sp24;

    mathutil_mtxA_to_mtx(lbl_80205E30);
    mathutil_mtxA_tf_vec_xyz(&sp24, -1.0f, 0.0f, 0.0f);
    if (sp24.y < 0.99f)
    {
        Vec sp18 = {0.0f, 1.0f, 0.0f};
        mathutil_vec_cross_prod(&sp24, &sp18, &sp24);
        mathutil_quat_from_axis_angle(&sp30, &sp24, 0x38E);
    }
    else
    {
        Vec spC = {0.0f, 1.0f, 0.0f};
        int unused;
        mathutil_quat_from_dirs(&sp30, &sp24, &spC);
    }
    mathutil_mtxA_from_quat(&sp30);
    mathutil_mtxA_normalize_basis();
    mathutil_mtxA_mult_right(lbl_80205E30);
}

// Matching, but I can't include it here for now due to inlining shenanigans with mathutil_vec_cross_prod
#ifdef NONMATCHING
void lbl_8003781C(struct Ball_child *a, int b)
{
    struct Ball *r31;
    struct Ball *r29 = &lbl_80205E60[a->unkC0];
    struct Struct8003FB48 sp50;
    //Vec sp44;
    //Vec sp38;
    //Vec sp2C;
    //Quaternion sp1C;
    int r27;
    float f31;

    switch (b)
    {
    case 3:
        func_8008B2D4(a);
        return;
    }
    //lbl_80037870
    if (lbl_802F1EE0 & 0xA)
        return;

    func_8003FB48(&r29->unk4, &sp50, NULL);
    a->unk14 &= -20;
    if (!(sp50.unk0 & 1) && r29->unk1C.y < -0.16203702986240387f)
    {
        a->unk14 |= 2;
    }
    else if (mathutil_vec_mag(&r29->unkB8) < 0.00027777777f)
    {
        a->unk14 |= 1;
    }
    //lbl_80037900
    //r27 = (r29->unk94 & (1<<(31-0x13))) != a->unk14;
    r27 = (r29->unk94 & (1<<(31-0x13))) != 0;
    r27 |= !(a->unk14 & 3);
    func_8003699C(a);
    if (r27)
    {
        f31 = func_80036CAC(a);
    }
    //lbl_80037948
    else
    {
        f31 = 0.0f;
        mathutil_mtxA_from_quat(&a->unk60);
        mathutil_mtxA_normalize_basis();
        if (a->unk14 & (1<<(31-0x1E)))
        {
            func_80037718();  // inlined
        }
    }
    //lbl_80037A08
    if (r29->unk94 & (1<<(31-0x1A)))
        f31 = mathutil_vec_mag(&r29->unk1C);
    //lbl_80037A38
    func_80036EB8(a);
    mathutil_mtxA_to_quat(&a->unk60);
    func_8003721C(a, f31);
    func_8008C4A8(a);
    if (!(a->unk14 & (1<<(31-0x1C))))
    {
        func_8003765C(a);  // inlined
    }
    //lbl_80037AE8
    func_8008C090(a, &r29->unk104);
    r29->unk100 = 0;
    r29->unk110 = 0.0f;
}
#else
extern const u8 lbl_801177D0[];
void func_8003DA7C();
#define _SDA2_BASE_ 0x802FA800
#define lbl_802F3408 0x802F3408
#define lbl_802F3410 0x802F3410
const float lbl_802F3418 = -0.16203702986240387f;
asm void lbl_8003781C(struct Ball_child *a, int b)
{
    nofralloc
#include "../asm/nonmatchings/lbl_8003781C.s"
}
#undef lbl_802F3410
#undef lbl_802F3408
#pragma peephole on
#endif

void func_80037B1C() {}

void func_80037B20(void)
{
    struct Ball *r5 = &lbl_80205E60[0];
    struct Ball *r6 = currentBallStructPtr;
    s8 *r7 = spritePoolInfo.unkC;
    int i;

    for (i = 0; i < spritePoolInfo.unk8; i++, r5++, r7++)
    {
        if (*r7 == 2)
        {
            currentBallStructPtr = r5;
            r5->unkFC->unk14 &= ~(1<<(31-0x11));
        }
    }
    currentBallStructPtr = r6;
}

void ev_ball_init(void)
{
    int sp18[4];
    struct Ball *ball;
    s8 *r21;
    struct Ball_child *r20;
    s32 j;
    int i;

    for (j = 0; j < 16; j++)
        lbl_80206B80[j] = -1;

    ball = &lbl_80205E60[0];
    r21 = spritePoolInfo.unkC;

    lbl_802F1F0C = 0;
    func_8008C4A0(1.0f);
    lbl_802F1F10 = NULL;
    func_8008BEF8(1);
    switch (modeCtrl.unk28)
    {
    case 1:
    case 4:
        if (modeCtrl.unk24 > 2 && !(lbl_801EED2C.unk4 & (1<<(31-0x17))))
            func_8008BEF8(2);
        break;
    case 3:
        if (modeCtrl.unk24 >= 2)
            func_8008BEF8(2);
        break;
    }

    for (i = 0; i < 4; i++)
        sp18[i] = 0;

    for (i = 0; i < 4; i++,  ball++, r21++)
    {
        if (*r21 == 0 || (modeCtrl.unk28 != 8 && *r21 == 4))
        {
            ball->unk0 = 0;
            ball->unk144 = 0;
            ball->unkFC = NULL;
            continue;
        }

        currentBallStructPtr = ball;
        ball->unk2E = i;
        func_800394C4(ball);
        ball->unk0 = 2;
        ball->unk3 = 0;
        func_8004C754();
        func_8008BA24(1);
        r20 = func_8008B838(lbl_80206BC0[i]);
        ball->unkFC = r20;
        r20->unk74 = 0;
        if (!(lbl_801EED2C.unk4 & (1<<(31-0x17))) && modeCtrl.unk30 > 1)
            r20->unk14 |= 0x100000;
        ball->unk14B = 0;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->unk10->unkE - 16384);
        r20->unkC0 = i;
        if (dipSwitches & (1<<(31-0x19)))
            r20->unkB4 = sp18[lbl_80206BC0[i]];
        else
            r20->unkB4 = i;
        if (lbl_801EED2C.unk4 & (1<<(31-0x17)))
            r20->unkB4 = 0;
        r20->unk30 = decodedStageLzPtr->unk10->unk0;
        mathutil_mtxA_to_quat(&r20->unk60);
        lbl_802F1F08 = 0;
        ballInfo[i] = 0.0f;
        sp18[lbl_80206BC0[i]]++;
        switch (modeCtrl.unk28)
        {
        case 1:
        case 3:
        case 4:
        case 8:
            break;
        default:
            if (!(lbl_801EED2C.unk4 & (1<<(31-0x17))))
                r20->unkC1 = ~(1 << i);
            break;
        }
        switch (modeCtrl.unk28)
        {
        case 3:
        case 4:
        case 5:
        case 7:
            break;
        default:
            if (!(lbl_801EED2C.unk4 & (1<<(31-0x17))))
                lbl_80206B80[i] = func_8008D1DC(lbl_8003781C, r20, 5);
            break;
        }
        switch (modeCtrl.unk28)
        {
        case 1:
        case 4:
            if (lbl_801EED2C.unk4 & (1<<(31-0x17)))
            {
                func_8008BF00(r20, 0);
                lbl_802F1F0C |= 1 << (r20->unk10 * 2);
            }
            else if (modeCtrl.unk24 > 2)
            {
                func_8008BF00(r20, 2);
                lbl_802F1F0C |= 1 << (r20->unk10 * 2 + 1);
            }
            else
            {
                func_8008BF00(r20, 1);
                lbl_802F1F0C |= 1 << (r20->unk10 * 2);
            }
            break;
        case 3:
            switch (modeCtrl.unk24)
            {
            case 1:
                func_8008BF00(r20, 1);
                lbl_802F1F0C |= 1 << (r20->unk10 * 2);
                break;
            case 3:  // useless; needed to match
            case 2:
            default:
                func_8008BF00(r20, 2);
                lbl_802F1F0C |= 1 << (r20->unk10 * 2 + 1);
                break;
            }
            break;
        default:
            func_8008BF00(r20, 0);
            lbl_802F1F0C |= 1 << (r20->unk10 * 2);
            break;
        }
    }
    switch (modeCtrl.unk28)
    {
    case 0:
    case 5:
    case 7:
        currentBallStructPtr = &lbl_80205E60[modeCtrl.unk2C];
        break;
    default:
        currentBallStructPtr = &lbl_80205E60[0];
        break;
    }
    func_8008BEF8(1);
}

struct Ball_child *func_800380A8(int a, int b, void (*c)(struct Ball_child *, int))
{
    struct Ball_child *r30 = func_8008B838(b);

    r30->unk74 = 0;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(0x8000);
    lbl_80206B80[a] = func_8008D1DC(c, r30, 5);
    func_8008BF00(r30, 0);
    mathutil_mtxA_to_quat(&r30->unk60);
    lbl_802F1F08 = 0;
    return r30;
}

struct Struct801B7B78
{
    s16 unk0;
    float unk4;
    float unk8;
    float unkC;
};

struct Struct801B7B78 lbl_801B7B78[] =
{
    {0, 0.5f, 0.009799992f, 0.5f},
    {6, 0.5f, 0.02177776f, 0.1f},
};

// not really sure what type this is. first element is 32-bit, though
u32 lbl_801B7B98[][2] =  // + 0x20
{
    {0x0012005D, 0x005E0000},
};

// probably part of the above array?
u32 lbl_801B7BA0[][2] =  // + 0x28
{
    {0x00110065, 0x00660000},
};

s16 lbl_801B7BA8[][9] =  // + 0x30
{
    {0x31, 0xB6, 0xB7, 0x32, 0xB8, 0x5F, 0x39, 0xB9, 0x60},
    {0x02, 0xB2, 0xB3, 0x03, 0xB4, 0xB5, 0x3F, 0xBB, 0xBC},
    {0x45, 0xBD, 0xBE, 0x46, 0x62, 0xBF, 0x3B, 0x61, 0xBA},
    {0x15, 0x67, 0x68, 0x16, 0x69, 0x6A, 0x3D, 0x6B, 0x6C},
    {0x2E, 0x2E, 0x2E, 0x2F, 0x2F, 0x2F, 0x41, 0x39, 0x39},
    {0x36, 0x36, 0x36, 0x37, 0x37, 0x37, 0x3E, 0x39, 0x39},
    {0x27, 0x27, 0x27, 0x28, 0x28, 0x28, 0x3A, 0x39, 0x39},
    {0x05, 0x05, 0x05, 0x06, 0x06, 0x06, 0x40, 0x39, 0x39},
    {0x33, 0x33, 0x33, 0x34, 0x34, 0x34, 0x42, 0x39, 0x39},
    {0x47, 0x47, 0x47, 0x48, 0x48, 0x48, 0x3C, 0x39, 0x39},
};

GXColor lbl_801B7C5C[] =  // + 0xE4
{
    {0x47, 0x5F, 0x5F, 0xFF},
    {0x5F, 0x53, 0x47, 0xFF},
    {0x4D, 0x47, 0x5F, 0xFF},
    {0x60, 0x48, 0x60, 0xFF},
    {0x4D, 0x5F, 0x47, 0xFF},
    {0x5F, 0x4D, 0x47, 0xFF},
    {0x47, 0x50, 0x5F, 0xFF},
    {0x59, 0x5F, 0x47, 0xFF},
    {0x47, 0x5F, 0x50, 0xFF},
    {0x59, 0x47, 0x5F, 0xFF},
};

void (*lbl_801B7C84[])(struct Ball *) =
{
    func_800395B8,
    func_800395DC,
    ball_sub_ready_main,
    func_80039794,
    func_80039974,
    func_800399D4,
    ball_sub_goal_main,
    func_80039B68,
    ball_sub_replay_main,
    func_80039B68,
    ball_sub_replay_main,
    func_80039FB0,
    func_8003A180,
    func_8003A184,
    func_8003A354,
    func_8003A358,
    func_8003A734,
    func_8003A654,
    func_8003A908,
    func_8003AA6C,
    func_8003AB08,
    ball_sub_21,
    func_8003B0C4,
    func_8003B0C4,
    func_8003B0C4,
    func_8003B0C4,
    func_8003B0C4,
    func_8003B0F4,
    func_8003B268,
};

struct Color3f
{
    float r, g, b;
};

// hmm...
struct Color3f lbl_801B7CF8[] =  // + 0x180
{
    {1, 0, 0},
    {0.175f, 0.398f, 1},
    {0.986f, 1, 0.175f},
    {0.175f, 1, 0.342f},
    {3.643376007e-44, 2, 15},
    {0.1f, 5.605193857e-45, 2.802596929e-45},
    {2.942726775e-44, 2, 15},
    {0.1f, 7.006492322e-45, 4.203895393e-45},
    {3.783505854e-44, 1, 5},
    {0.05f, 0, 0},
    {3.082856622e-44, 1, 5},
    {0.05f, 0, 0},
    {3.363116314e-44, 3, 70},
    {0.05f, 8.407790786e-45, 0},
    {2.662467082e-44, 3, 70},
    {0.05f, 9.80908925e-45, 0},
    {3.222986468e-44, 2, 50},
    {0.05f, 0, 0},
    {2.522337236e-44, 2, 50},
    {0.05f, 0, 0},
    {7.006492322e-45, 8, 20},
    {0.28f, 1.261168618e-44, 0},
    {4.203895393e-45, 2, 20},
    {0.1f, 0, 0},
    {1.401298464e-44, 1, 40},
    {0.05f, 1.541428311e-44, 0},
    {1.121038771e-44, 2, 40},
    {0.05f, 1.681558157e-44, 0},
    {9.80908925e-45, 2, 20},
    {0.05f, 0, 0},
    {2.101947696e-44, 1, 40},
    {0.05f, 1.96181785e-44, 0},
    {1.821688004e-44, 2, 40},
    {0.05f, 2.101947696e-44, 0},
    {1.681558157e-44, 2, 20},
    {0.05f, 0, 0},
    {2.242077543e-44, 4, 80},
    {0.15f, 0, 0},
};

u8 lbl_801B7EC0[] = {1, 0, 0, 0};  // + 0x348
GXTexObj lbl_801B7EC4 = {0};  // + 0x34C

static inline float sq_mag(register Vec *vec)
{
#ifdef __MWERKS__
    register float x, z, y;

    z = vec->z;
    y = vec->y;
    x = vec->x;

    asm
    {
        fmuls x, x, x
        fmadds x, y, y, x
        fmadds x, z, z, x
    }
    return x;
#else
    return vec->x * vec->x + vec->y * vec->y + vec->z * vec->z;
#endif
}

void ev_ball_main(void)
{
    Vec sp8;
    struct Ball *r29;
    s8 *r28;
    s8 *r3;
    int i;

    if (lbl_802F1EE0 & 0xA)
        return;
    r28 = spritePoolInfo.unkC;
    r29 = &lbl_80205E60[0];
    for (i = 0; i < spritePoolInfo.unk8; i++, r29++, r28++)
    {
        if (*r28 == 0 || *r28 == 4)
            continue;
        currentBallStructPtr = r29;
        mathutil_mtx_copy(r29->unk30, r29->unkC8);
        r29->unk120 = r29->unk94;
        r29->unk94 &= -6;
        func_8003CDB0(r29);
        func_800390C8(4, &r29->unk4, 0.75f);
        lbl_801B7C84[r29->unk3](r29);
        if (modeCtrl.unk28 != 3)
            func_80038528(r29);
    }

    r3 = spritePoolInfo.unkC;
    r29 = &lbl_80205E60[0];
    for (i = 0; i < spritePoolInfo.unk8; i++, r29++)
    {
        if (r3[i] == 0 || r3[i] == 4)
            continue;
        r29->unk15C[0] = r29->unk15C[1] = r29->unk15C[2] = r29->unk15C[3] = 1.0f;
    }

    if (modeCtrl.unk28 == 1)
    {
        r28 = spritePoolInfo.unkC;
        r29 = &lbl_80205E60[0];
        for (i = 0; i < spritePoolInfo.unk8; i++, r29++)
        {
            struct Ball *r24;
            int j;

            if (r28[i] == 0 || r28[i] == 4)
                continue;
            r24 = r29 + 1;
            for (j = i + 1; j < spritePoolInfo.unk8; j++, r24++)
            {
                float f29;
                float f2;
                float f1;

                if (r28[j] == 0 || r28[j] == 4)
                    continue;
                sp8.x = r29->unk4.x - r24->unk4.x;
                sp8.y = r29->unk4.y - r24->unk4.y;
                sp8.z = r29->unk4.z - r24->unk4.z;

                f2 = sq_mag(&sp8);
                f29 = r29->unk68 + r24->unk68;
                if (f2 < (0.5 * f29) * (0.5 * f29))
                {
                    int k;

                    f1 = mathutil_sqrt(f2);
                    if (f1 < f29 * 0.25)
                        f1 = 0.0f;
                    else
                        f1 = (f1 - (f29 * 0.25)) / (f29 * 0.25);

                    for (k = 0; k < spritePoolInfo.unk8; k++)
                    {
                        if (j != k)
                        {
                            if (r24->unk15C[k] > f1)
                                r24->unk15C[k] = f1;
                        }
                        else
                        {
                            if (r29->unk15C[k] > f1)
                                r29->unk15C[k] = f1;
                        }
                    }
                }
            }
        }
    }

    if (lbl_802F1F10 != NULL)
        lbl_802F1F10();

    if (modeCtrl.unk28 == 3)
    {
        r28 = spritePoolInfo.unkC;
        r29 = &lbl_80205E60[0];
        for (i = 0; i < spritePoolInfo.unk8; i++, r29++, r28++)
        {
            if (*r28 == 0 || *r28 == 4)
                continue;
            currentBallStructPtr = r29;
            func_80038528(r29);
        }
    }

    switch (modeCtrl.unk28)
    {
    case 0:
    case 5:
    case 7:
        currentBallStructPtr = &lbl_80205E60[modeCtrl.unk2C];
        break;
    default:
        currentBallStructPtr = &lbl_80205E60[0];
        break;
    }
    func_8004C780();
}

#pragma force_active on
const Vec lbl_80117884 = {0.0f, 0.0f, 0.0f};
#pragma force_active off

void func_80038528(struct Ball *ball)
{
    Vec sp64;
    Vec sp58;
    Vec sp4C;
    Vec sp40;
    Vec sp34;
    Vec sp28;
    Vec sp1C;
    float f31;
    float f1;

    func_8003D3C4();
    if (ball->unk94 & (1<<(31-0x1D)))
        func_8003C550(ball);

    mathutil_mtxA_from_mtx(ball->unk30);
    ball->unkC4 = mathutil_vec_mag(&ball->unkB8);
    mathutil_mtxA_tf_vec_xyz(&sp58, 0.0f, 1.0f, 0.0f);
    mathutil_mtxA_tf_vec_xyz(&sp40, 1.0f, 0.0f, 0.0f);
    mathutil_mtxA_tf_vec_xyz(&sp28, 0.0f, 0.0f, 1.0f);
    sp1C.x = 0.0f;
    sp1C.y = -ball->unk68;
    sp1C.z = 0.0f;
    mathutil_mtxA_rigid_inv_tf_vec(&sp1C, &sp1C);

    mathutil_mtxA_from_mtx(ball->unkC8);
    mathutil_mtxA_tf_vec(&sp1C, &ball->unkB8);
    ball->unkB8.y += ball->unk68;
    mathutil_mtxA_tf_vec_xyz(&sp64, 0.0f, 1.0f, 0.0f);
    mathutil_mtxA_tf_vec_xyz(&sp4C, 1.0f, 0.0f, 0.0f);
    mathutil_mtxA_tf_vec_xyz(&sp34, 0.0f, 0.0f, 1.0f);

    f31 = mathutil_vec_dot_normalized(&sp64, &sp58);

    f1 = mathutil_vec_dot_normalized(&sp4C, &sp40);
    if (f31 > f1)
    {
        f31 = f1;
        sp64 = sp4C;
        sp58 = sp40;
    }
    f1 = mathutil_vec_dot_normalized(&sp34, &sp28);
    if (f31 > f1)
    {
        f31 = f1;
        sp64 = sp34;
        sp58 = sp28;
    }

    if (f31 > -0.9998f && f31 < 0.9998f)
        mathutil_quat_from_dirs(&ball->unkA8, &sp64, &sp58);
    else
        ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};

    func_8003CB88(ball);
    func_8003CCB0();
    if (modeCtrl.unk28 != 3)
        func_8003D6A4(ball);
    func_8003CDC0(ball);
    if (ball->unk14E > 0)
        ball->unk14E--;
}

void ev_ball_dest(void)
{
    struct Ball *ball;
    int i;

    func_8004C7A8();
    for (i = 15; i >= 0; i--)
    {
        if (lbl_80206B80[i] != -1)
        {
            func_8008D29C(lbl_80206B80[i]);
            lbl_80206B80[i] = -1;
        }
    }

    ball = &lbl_80205E60[0];
    for (i = 0; i < 4; i++, ball++)
        ball->unk0 = 0;
}

struct Struct80038840
{
    u8 filler0[4];
    void (*unk4)(struct Struct80038840 *);
    u32 unk8;
    u32 unkC;
};

extern void lbl_8003D928(struct Struct80038840 *);

void func_80038840(void)
{
    struct Ball *r28;
    s8 *r27;
    int i;
    int (*func)();
    struct Struct80038840 *r23;
    int r22;
    Func802F20EC bgfunc;
    int unused;

#ifdef NONMATCHING
    func = NULL;  //! func may used uninitialized.
#endif

    if (dipSwitches & DIP_OLD_BALL)
    {
        func = backgroundInfo.unk7C;
        if (gameMode == MD_GAME && modeCtrl.unk28 == 1 && modeCtrl.unk24 > 3)
            func = NULL;
    }

    r27 = spritePoolInfo.unkC;
    r28 = &lbl_80205E60[0];
    for (i = 0; i < spritePoolInfo.unk8; i++, r28++, r27++)
    {
        if (*r27 == 0 || *r27 == 4)
            continue;
        if (r28->unk94 & (1<<(31-0x1B)))
            continue;
        if ((lbl_801EEC90.unk0 & (1<<(31-0x1D)))
         && func_8000E4D0(&r28->unk4) < 0.0f)
            continue;
        if (!(dipSwitches & DIP_OLD_BALL))
        {
            mathutil_mtxA_from_mtxB();
            r22 = func_80085698(&r28->unk4);
            r23 = (void *)func_80085B88(16);
            r23->unk4 = lbl_8003D928;
            r23->unk8 = func_800223D0();
            r23->unkC = i;
            func_80085B78(r22, r23);
            continue;
        }

        func_8000E1A4(r28->unk15C[currentCameraStructPtr->unk204]);
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_mult_right(r28->unk30);
        mathutil_mtxA_scale_s(r28->unk74);
        func_80030BA8(r28->unk74);

        if (dipSwitches & (DIP_STCOLI | DIP_TRIANGLE))
        {
            u32 *var = &lbl_802F1B04[r28->unk66];
            //func_80033B14(lbl_802F1B04_->unk4[r28->unk66], 0.3f);
            func_80033B14(var[1], 0.3f);
        }
        else
        {
            u32 *var = &lbl_802F1B04[r28->unk66];
            //func_80033AD4(lbl_802F1B04_->unk4[r28->unk66]);
            func_80033AD4(var[1]);
        }

        if (func != NULL)
        {
            mathutil_mtxA_push();
            mathutil_mtxA_from_mtx(r28->unk30);
            //if (r25(lbl_802F1B04->unkE0, lbl_802F1B4C) != 0)
            if (func(lbl_802F1B04[0x38], lbl_802F1B4C) != 0)
            {
                mathutil_mtxA_pop();
                func_80031784(lbl_802F1B4C);
            }
            else
                mathutil_mtxA_pop();
        }

        bgfunc = backgroundInfo.unk94;
        if (bgfunc != NULL)
        {
            g_avdisp_set_some_func_1(bgfunc);
            func_8009AA24(mathutilData->mtxA, 0);
            func_8008E500(lbl_802F1CC8->modelEntries[0x14].modelOffset);
            g_avdisp_set_some_func_1(NULL);
        }

        mathutil_mtxA_push();
        mathutil_mtxA_sq_from_identity();
        mathutil_mtxA_scale_s(r28->unk74);
        func_80030BA8(r28->unk74);
        //func_80033AD4(lbl_802F1B04->unkA0);
        func_80033AD4(lbl_802F1B04[0x28]);
        mathutil_mtxA_pop();

        func_8000E3BC();
    }
}

void func_80038AB4(void)
{
    struct Struct80092B98 sp18;
    Vec spC;
    int unused;
    GXTexObj *tex1;
    GXTexObj *tex2;
    int r29;
    struct Ball *ball;
    s8 *r26;
    int i;

    r29 = lbl_801EED2C.unk4 & (1<<(31-0x17));
    if (r29 != 0 && (lbl_801EED2C.unk4 & (1<<(31-0x14))))
    {
        func_80038DF4();
        return;
    }

    switch (modeCtrl.unk28)
    {
    case 4:
        if (backgroundInfo.bgId == BG_TYPE_SPA || backgroundInfo.bgId == BG_TYPE_ICE2)
        {
            if (modeCtrl.unk24 > 3)
            {
                func_80038DF4();
                return;
            }
        }
        break;
    case 5:
        return;
    default:
        if (modeCtrl.unk30 > 2)
        {
            func_80038DF4();
            return;
        }
        break;
    }

    mathutil_mtxA_from_rotate_y(lbl_801F0614.unk42);
    mathutil_mtxA_rotate_x(lbl_801F0614.unk40);
    spC.x = 0.0f;
    spC.y = 0.0f;
    spC.z = -15.0f;
    mathutil_mtxA_tf_vec(&spC, &spC);

    switch (modeCtrl.unk28)
    {
    case 1:
        sp18.unk2C = 2;
        sp18.unk30 = 0.1f;
        sp18.unk34 = 0.2f;
        break;
    default:
        sp18.unk2C = 0x22;
        sp18.unk30 = 0.025f;
        sp18.unk34 = get_0_05();  // 0.05f;
        break;
    }

    sp18.unk20.x = 0.0f;
    sp18.unk20.y = 1.0f;
    sp18.unk20.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp18.unk20, &sp18.unk20);

    tex1 = lbl_802F1CC8->modelEntries[0x5A].modelOffset->texObjs;
    GXInitTexObj((tex2 = &lbl_801B7EC4),
        GXGetTexObjData(tex1),
        GXGetTexObjWidth(tex1),
        GXGetTexObjHeight(tex1),
        GXGetTexObjFmt(tex1),
        0,
        0,
        GXGetTexObjMipMap(tex1));
    GXInitTexObjLOD(tex2, 1, 1, 0.0f, 0.0f, 0.0f, 0, 0, 0);

    sp18.unk3C = lbl_801B7EC0;

    r26 = spritePoolInfo.unkC;
    ball = &lbl_80205E60[0];
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, r26++)
    {
        if (*r26 == 0 || *r26 == 4)
            continue;
        if (ball->unk94 & (1<<(31-0x1B)))
            continue;
        sp18.unk38 = lbl_801B7C5C[ball->unk14A];
        sp18.unk0 = spC.x + ball->unk4.x;
        sp18.unk4 = spC.y + ball->unk4.y;
        sp18.unk8 = spC.z + ball->unk4.z;
        sp18.unkC = 5.0f;
        sp18.unk10 = ball->unk4;
        sp18.unk1C = ball->unk68 * 1.4f;
        if (r29 != 0)
            sp18.unk2E = 0xFFFF;
        else
        {
            switch (modeCtrl.unk28)
            {
            case 4:
            case 8:
                sp18.unk2E = 0xFFFF;
                break;
            default:
                sp18.unk2E = 1 << ball->unk2E;
                break;
            }
        }
        func_80092B98(&sp18);
    }
}

void func_80038DF4(void)
{
    struct Struct8009492C sp30;
    struct Struct8003FB48 sp14;
    Vec sp8;
    struct Ball *r26;
    s8 *r25;
    int i;

    sp30.unk20 = 0.025f;
    sp30.unk24 = 0.05f;
    sp30.unk28 = lbl_802F1CC8->modelEntries[0x4E].modelOffset;

    r26 = &lbl_80205E60[0];
    r25 = spritePoolInfo.unkC;
    for (i = 0; i < spritePoolInfo.unk8; i++, r26++, r25++)
    {
        float f2;

        if (*r25 == 0 || *r25 == 4)
            continue;
        if (r26->unk94 & (1<<(31-0x1B)))
            continue;
        if (func_8003FB48(&r26->unk4, &sp14, &sp8) == 0)
            continue;
        f2 = 1.0 - (r26->unk4.y - sp14.unk4.y) * 0.2;
        if (f2 < 0.0f)
            continue;

        sp30.unk2C = lbl_801B7C5C[r26->unk14A];
        sp30.unk2C.r *= f2;
        sp30.unk2C.g *= f2;
        sp30.unk2C.b *= f2;

        sp30.unk14 = r26->unk68 * (1.0f + 2.0f * (1.0f - f2));
        sp30.unk18 = sp30.unk14;
        sp30.unk1C = sp30.unk14;

        mathutil_vec_to_euler(&sp14.unk10, &sp30.unkC);
        sp30.unkC.z = r26->unk2C;
        sp30.unk0 = sp14.unk4;
        func_8009492C(&sp30);
    }
}

void give_bananas(int bananas)
{
    struct Ball *ball = currentBallStructPtr;

    switch (modeCtrl.unk28)
    {
    case 0:
        ball->unk78 += bananas;
        if (ball->unk78 >= 100)
        {
            ball->unk2++;
            ball->unk78 -= 100;
            func_8007DEC8(0x78);
            func_8002B5A4(0x2852);  // play 1-up sound?
        }
        break;
    case 1:
    case 2:
        ball->unk78 += bananas;
        if (ball->unk78 > 999)
            ball->unk78 = 999;
        break;
    default:
        ball->unk78 += bananas;
        break;
    }
}

static inline float vec_dot_prod(register Vec *a, register Vec *b)
{
#ifdef __MWERKS__
    register float x1, y1, z1, x2, y2, z2;
    asm
    {
        lfs x1, a->x
        lfs x2, b->x
        lfs y1, a->y
        lfs y2, b->y
        lfs z1, a->z
        lfs z2, b->z
        fmuls x2, x1, x2
        fmadds x2, y1, y2, x2
        fmadds x2, z1, z2, x2
    }
    return x2;
#else
    return a->x * b->x + a->y * b->y + a->z * b->z;
#endif
}

void func_800390C8(int a, Vec *b, float c)
{
    Vec sp50;
    Vec sp44;
    Mtx sp14;
    int i;
    struct Ball *r30;
    s8 *r29;
    int r28;

    r30 = &lbl_80205E60[0];
    r28 = currentBallStructPtr->unk2E;
    r29 = spritePoolInfo.unkC;
    lbl_802F1F0C = 0;

    for (i = 0; i < 4; i++, r30++, r29++)
    {
        float f1;

        if (*r29 == 0)
            continue;
        if (a == 4 && r28 == i)
            continue;

        sp50.x = b->x - r30->unk4.x;
        sp50.y = b->y - r30->unk4.y;
        sp50.z = b->z - r30->unk4.z;
        f1 = mathutil_vec_normalize_len(&sp50);
        if (f1 > 1.1920928955078125e-07f)
            c /= f1;

        if (r30->unk110 > c)
            break;

        if (r30->unk94 & 1)
        {
            sp44.x = -r30->unk114.x;
            sp44.y = -r30->unk114.y;
            sp44.z = -r30->unk114.z;
        }
        else
        {
            sp44.x = r30->unk1C.x;
            sp44.y = r30->unk1C.y;
            sp44.z = r30->unk1C.z;
            if (sp44.y == 0.0)
                sp44.y = 1.1920928955078125e-07f;
            mathutil_vec_normalize_len(&sp44);
        }

        c *= (vec_dot_prod(&sp44, &sp50) + 0.5) * 0.75;
        if (r30->unk110 > c)
            break;

        if (r30->unkFC != NULL)
            mathutil_mtxA_from_quat(&r30->unkFC->unk60);

        mathutil_mtxA_to_mtx(sp14);
        sp44.x = -sp14[0][0];
        sp44.y = -sp14[1][0];
        sp44.z = -sp14[2][0];

        c *= vec_dot_prod(&sp44, &sp50) + 0.5;
        if (r30->unk110 < c)
        {
            r30->unk100 = a;
            r30->unk104 = *b;
            r30->unk110 = c;
        }
    }
}

#pragma force_active on

// struct Ball?
struct Struct80039320
{
    u8 filler0[0x20];
    float unk20;
};

void unref_func_80039320(struct Ball *ball, struct Struct80039320 *b, int c)
{
    float f1;

    if (ball->unk94 & (1<<(31-0xD)))
    {
        if (ball->unk13C < c)
            ball->unk13C = c;
        return;
    }

    ball->unk94 &= ~(3<<(31-0xE));
    ball->unk94 |= 0x40000;
    ball->unk13C = c;

    f1 = ball->unk68 * 0.25f;
    if (b != NULL)
        b->unk20 += f1;
    else
        ball->unk1C.y += f1;
}

void unref_func_8003938C(struct Ball *ball, struct Struct80039320 *b, int c)
{
    float f1;

    if (ball->unk94 & (1<<(31-0xE)))
    {
        if (ball->unk13C < c)
            ball->unk13C = c;
        return;
    }

    ball->unk94 &= ~(3<<(31-0xE));
    ball->unk94 |= 0x20000;
    ball->unk13C = c;

    f1 = ball->unk68 * 0.125f;
    if (b != NULL)
        b->unk20 += f1;
    else
        ball->unk1C.y += f1;
}

void unref_func_800393F8(struct Ball *ball)
{
    ball->unk94 &= ~(3<<(31-0xE));
    ball->unk13C = 0;
}

#pragma force_active off

void func_80039410(struct Ball *ball)
{
    struct Ball backup;

    backup.unkFC = ball->unkFC;
    backup.unk2E = ball->unk2E;

    memset(ball, 0, sizeof(*ball));

    switch (modeCtrl.unk28)
    {
    default:
        if (dipSwitches & DIP_SARU_0)
            ball->unk2 = 0;
        else
            ball->unk2 = 3;
        break;
    case 1:
    case 2:
        ball->unk2 = 2;
        break;
    }

    ball->unk78 = 0;
    ball->unk134 = 0;
    ball->unk7C = 0;
    ball->unkFC = backup.unkFC;
    ball->unk2E = backup.unk2E;
    ball->unk126 = 0;
    ball->unk128 = 0;
}

void func_800394C4(struct Ball *ball)
{
    struct Ball backup;

    switch (modeCtrl.unk28)
    {
    case 2:
        ball->unk78 = 0;
        ball->unk7C = 0;
        break;
    case 1:
        if (ball->unk94 & (1<<(31-8)))
        {
            ball->unk78 = ball->unk134;
            ball->unk94 &= ~(1<<(31-8));
        }
        ball->unk134 = ball->unk78;
        break;
    }
    //lbl_80039534

    backup.unk2E = ball->unk2E;
    backup.unk2 = ball->unk2;
    backup.unk78 = ball->unk78;
    backup.unk134 = ball->unk134;
    backup.unk7C = ball->unk7C;
    backup.unkFC = ball->unkFC;
    backup.unk126 = ball->unk126;
    backup.unk128 = ball->unk128;

    memset(ball, 0, sizeof(*ball));

    ball->unk2E = backup.unk2E;
    ball->unk2 = backup.unk2;
    ball->unk78 = backup.unk78;
    ball->unk134 = backup.unk134;
    ball->unk7C = backup.unk7C;
    ball->unkFC = backup.unkFC;
    ball->unk126 = backup.unk126;
    ball->unk128 = backup.unk128;

    func_8003C4A0(ball, 0);

    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_mtx(ball->unkC8);
}

void func_800395B8(struct Ball *ball)
{
    ball->unk1C.x = 0.0f;
    ball->unk1C.y = 0.0f;
    ball->unk1C.z = 0.0f;

    ball->unk60 = 0;
    ball->unk62 = 0;
    ball->unk64 = 0;
}

void func_800395DC(struct Ball *ball)
{
    func_80039410(ball);
    ball_sub_ready_main(ball);
}

void ball_sub_ready_main(struct Ball *ball)
{
    func_800394C4(ball);

    ball->unk4.x = decodedStageLzPtr->unk10->unk0.x;
    ball->unk4.y = decodedStageLzPtr->unk10->unk0.y + ((ball->unk6C * 24.0) * 24.0) * 0.5;
    ball->unk4.z = decodedStageLzPtr->unk10->unk0.z;

    ball->unk10.x = ball->unk4.x;
    ball->unk10.y = ball->unk4.y;
    ball->unk10.z = ball->unk4.z;

    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->unk94 |= 0x10;
    ball->unkFC->unk14 |= 0x20;
    ball->unk3 = 0;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkFC->unk14 &= ~(1<<(31-0x11));
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
}

void func_80039794(struct Ball *ball)
{
    float f2;
    float zero;
    float f4;

    ball->unk10.x = ball->unk4.x;
    ball->unk10.y = ball->unk4.y;
    ball->unk10.z = ball->unk4.z;

    f4 = modeCtrl.unk0;
    f2 = (decodedStageLzPtr->unk10->unk0.y - ball->unk4.y) / f4;

    ball->unk1C.x = (zero = 0.0f);  // fake match
    ball->unk1C.y = (ball->unk6C * f4) * 0.5 + f2;
    ball->unk1C.z = zero;

    ball->unk28 = 0x2000;
    ball->unk2A = decodedStageLzPtr->unk10->unkE - 16384;
    ball->unk2C = 0;

    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_rotate_y(ball->unk2A);
    mathutil_mtxA_rotate_x(ball->unk28);
    mathutil_mtxA_rotate_z(ball->unk2C);
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_mtx(ball->unkC8);

    ball->unk94 &= ~(1<<(31-0x1B));
    ball->unk94 |= 0x4000;
    if (ball->unkFC != NULL)
        ball->unkFC->unk14 &= ~(1<<(31-0x1A));
    func_8002B5A4(0x1E);
    ball->unk3 = 4;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkFC->unk14 &= ~(1<<(31-0x11));
    ball->unk98 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    mathutil_mtxA_to_quat(&ball->unkA8);
}

void func_80039974(struct Ball *ball)
{
    struct Struct80039974 spC;

    handle_ball_linear_kinematics(ball, &spC, 0);
    handle_ball_rotational_kinematics(ball, &spC, 0);
    update_ball_ape_transform(ball, &spC, 0);
    ball->unk80++;
}

void func_800399D4(struct Ball *ball)
{
    ball->unk3 = 6;
    ball->unk94 |= 0x500;
    if (ball->unk94 & (3<<(31-0x13)))
        ball->unk94 |= 0x40;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball_sub_goal_main(ball);
}

void ball_sub_goal_main(struct Ball *ball)
{
    struct Struct80039974 spC;

    if (!(ball->unk94 & (1<<(31-0x16)))
     && (ball->unkFC->unk14 & (1<<(31-0x11))))
    {
        ball->unk94 &= -1281;
        ball->unk94 |= 0x200;
        func_8002B5A4(0x126);
    }

    handle_ball_linear_kinematics(ball, &spC, 1);
    handle_ball_rotational_kinematics(ball, &spC, 1);
    update_ball_ape_transform(ball, &spC, 1);
    ball->unk80++;
}

void func_80039B68(struct Ball *ball)
{
    struct Struct800496BC sp3C;
    Vec sp30;

    ball->unk80 = 0;
    ball->unk3 = 10;
    ball->unk94 &= ~(7<<(31-0x17));
    ball->unk94 &= ~(1<<(31-0x1B));
    if (ball->unkFC != NULL)
        ball->unkFC->unk14 &= ~(1<<(31-0x1A));
    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &sp3C, lbl_80250A68.unk10);
    ball->unk4.x = sp3C.unk0.x;
    ball->unk4.y = sp3C.unk0.y;
    ball->unk4.z = sp3C.unk0.z;
    ball->unkFC->unk30 = ball->unk4;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkFC->unk14 &= ~(1<<(31-0x11));
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball->unkFC->unk60 = ball->unk98;
    ball_sub_replay_main(ball);
    sp30.x = ball->unk1C.x;
    sp30.y = 0.0f;
    sp30.z = ball->unk1C.z;
    if (sp30.x == 0.0 && sp30.z == 0.0)
    {
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->unk10->unkE);
        sp30.x = 0.0f;
        sp30.y = 0.0f;
        sp30.z = -1.0f;
        mathutil_mtxA_tf_vec(&sp30, &sp30);
    }
    func_8008C408(ball->unkFC, &sp30);
    mathutil_mtx_copy(ball->unk30, ball->unkC8);
}

void ball_sub_replay_main(struct Ball *ball)
{
    struct Struct800496BC spC;

    ball->unk10.x = ball->unk4.x;
    ball->unk10.y = ball->unk4.y;
    ball->unk10.z = ball->unk4.z;

    if (ball->unk2E == lbl_80250A68.unk14)
        lbl_80250A68.unk10 -= 1.0f;

    func_800496BC(lbl_80250A68.unk0[ball->unk2E], &spC, lbl_80250A68.unk10);

    ball->unk4.x = spC.unk0.x;
    ball->unk4.y = spC.unk0.y;
    ball->unk4.z = spC.unk0.z;

    ball->unk1C.x = ball->unk4.x - ball->unk10.x;
    ball->unk1C.y = ball->unk4.y - ball->unk10.y;
    ball->unk1C.z = ball->unk4.z - ball->unk10.z;

    ball->unk60 = spC.unkC - ball->unk28;
    ball->unk62 = spC.unkE - ball->unk2A;
    ball->unk64 = spC.unk10 - ball->unk2C;

    ball->unk28 = spC.unkC;
    ball->unk2A = spC.unkE;
    ball->unk2C = spC.unk10;

    ball->unk114.x = spC.unk12 * 3.0518509475997192e-05;
    ball->unk114.y = spC.unk14 * 3.0518509475997192e-05;
    ball->unk114.z = spC.unk16 * 3.0518509475997192e-05;

    ball->unk94 = spC.unk18 | 0x1000000;
    ball->unk130 = spC.unk1C;

    if (lbl_80250A68.unk10 <= 0.0 || !(lbl_801F3A58.unk0 & (1<<(31-0x1B))))
        ball->unk3 = 4;

    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_rotate_y(ball->unk2A);
    mathutil_mtxA_rotate_x(ball->unk28);
    mathutil_mtxA_rotate_z(ball->unk2C);
    mathutil_mtxA_to_mtx(ball->unk30);
    ball->unk80++;
}

void func_80039FB0(struct Ball *ball)
{
    func_800394C4(ball);

    ball->unk4.x = decodedStageLzPtr->unk10->unk0.x;
    ball->unk4.y = decodedStageLzPtr->unk10->unk0.y;
    ball->unk4.z = decodedStageLzPtr->unk10->unk0.z;

    ball->unk10.x = ball->unk4.x;
    ball->unk10.y = ball->unk4.y;
    ball->unk10.z = ball->unk4.z;

    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->unkFC->unk30 = ball->unk4;
    ball->unkFC->unk48.x = 0.0f;
    ball->unkFC->unk48.y = 0.0f;
    ball->unkFC->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkFC->unk14 &= ~(1<<(31-0x11));
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball->unkFC->unk60 = ball->unk98;
    ball->unk2A = lbl_801F0614.unk42 + 0x2000;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(ball->unk2A - 16384);
    mathutil_mtxA_to_quat(&ball->unkFC->unk60);
    ball->unk3 = 12;
}

void func_8003A180(struct Ball *ball) {}

void func_8003A184(struct Ball *ball)
{
    func_800394C4(ball);

    ball->unk4.x = decodedStageLzPtr->unk10->unk0.x;
    ball->unk4.y = decodedStageLzPtr->unk10->unk0.y + 10.0;
    ball->unk4.z = decodedStageLzPtr->unk10->unk0.z;

    ball->unk10.x = ball->unk4.x;
    ball->unk10.y = ball->unk4.y;
    ball->unk10.z = ball->unk4.z;

    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->unkFC->unk30 = ball->unk4;
    ball->unkFC->unk48.x = 0.0f;
    ball->unkFC->unk48.y = 0.0f;
    ball->unkFC->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkFC->unk14 &= ~(1<<(31-0x11));
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball->unkFC->unk60 = ball->unk98;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(decodedStageLzPtr->unk10->unkE - 16384);
    mathutil_mtxA_to_quat(&ball->unkFC->unk60);
    ball->unk3 = 14;
}

void func_8003A354(struct Ball *ball) {}

#define PI 3.14159265

void func_8003A358(struct Ball *ball)
{
    Vec sp28;

    func_800394C4(ball);

    ball->unk4.x = decodedStageLzPtr->unk10->unk0.x;
    ball->unk4.y = decodedStageLzPtr->unk10->unk0.y + 10.0;
    ball->unk4.z = decodedStageLzPtr->unk10->unk0.z;

    ball->unk10.x = ball->unk4.x;
    ball->unk10.y = ball->unk4.y;
    ball->unk10.z = ball->unk4.z;

    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->unk1C.x = 0.0f;
    ball->unk1C.y = 0.0f;
    ball->unk1C.z = 0.0f;

    sp28.x = ((rand() / 32767.0f) - 0.5) * 0.5;
    sp28.y = ((rand() / 32767.0f) - 0.5) * 0.5;
    sp28.z = ((rand() / 32767.0f) - 0.5) * 0.5;

    if (ball->unk68 > 1.1920928955078125e-07f && mathutil_vec_mag(&sp28) != 0.0f)
    {
        float f1 = mathutil_vec_normalize_len(&sp28);

        mathutil_quat_from_axis_angle(
            &ball->unk98,
            &sp28,
            (f1 * 2.0f) / (ball->unk68 * ball->unk68 * PI) * 10430.3779296875);
    }

    ball->unk94 |= 0x40;
    ball->unk3 = 4;
    ball->unkFC->unk30 = ball->unk4;
    ball->unkFC->unk48.x = 0.0f;
    ball->unkFC->unk48.y = 0.0f;
    ball->unkFC->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkFC->unk14 &= ~(1<<(31-0x11));
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    ball->unkFC->unk60 = ball->unk98;
}

void func_8003A654(struct Ball *ball)
{
    Vec sp68;
    struct Struct80039974 spC;

    mathutil_mtxA_from_mtx(mathutilData->mtxB);
    mathutil_mtxA_rigid_inv_tf_tl(&sp68);
    sp68.x -= ball->unk4.x;
    sp68.y = 0.0f;
    sp68.z -= ball->unk4.z;
    mathutil_vec_set_len(&sp68, &sp68, 0.00064f);

    ball->unk1C.x += sp68.x;
    ball->unk1C.y += sp68.y;
    ball->unk1C.z += sp68.z;

    handle_ball_linear_kinematics(ball, &spC, 0);
    handle_ball_rotational_kinematics(ball, &spC, 0);
    update_ball_ape_transform(ball, &spC, 0);
    ball->unk80++;
}

void func_8003A734(struct Ball *ball)
{
    func_800394C4(ball);
    
    if (modeCtrl.unk0 == 0x111C)
    {
        ball->unk4.x = decodedStageLzPtr->unk10->unk0.x;
        ball->unk4.y = decodedStageLzPtr->unk10->unk0.y;
        ball->unk4.z = decodedStageLzPtr->unk10->unk0.z;
    }
    else
    {
        ball->unk4.x = 14.5f;
        ball->unk4.y = 2.5f;
        ball->unk4.z = -13.5f;
    }

    ball->unk10.x = ball->unk4.x;
    ball->unk10.y = ball->unk4.y;
    ball->unk10.z = ball->unk4.z;

    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->unkFC->unk30 = ball->unk4;
    ball->unkFC->unk48.x = 0.0f;
    ball->unkFC->unk48.y = 0.0f;
    ball->unkFC->unk48.z = 0.0f;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkFC->unk14 &= ~(1<<(31-0x11));
    ball->unkA8 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unk98 = ball->unkA8;
    
    if (modeCtrl.unk0 != 0x111C)
    {
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(decodedStageLzPtr->unk10->unkE + 0x4000);
        mathutil_mtxA_to_quat(&ball->unkFC->unk60);
    }
}

void func_8003A908(struct Ball *ball)
{
    func_800394C4(ball);
    
    ball->unk4.y = ball->unk10.y = ball->unk68;
    
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&ball->unk4);
    mathutil_mtxA_to_mtx(ball->unk30);
    
    ball->unk28 = 0x2000;
    ball->unk2A = 0;
    ball->unk2C = 0;
    
    mathutil_mtxA_from_translate(&ball->unk4);
    mathutil_mtxA_rotate_y(ball->unk2A);
    mathutil_mtxA_rotate_x(ball->unk28);
    mathutil_mtxA_rotate_z(ball->unk2C);
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_mtx(ball->unkC8);
    
    ball->unk3 = 0;
    ball->unkC4 = 0.0f;
    ball->unkF8 = 0.0f;
    ball->unkB8 = (Vec){0.0f, 0.0f, 0.0f};
    ball->unkFC->unk14 &= ~(1<<(31-0x11));
    ball->unk98 = (Quaternion){0.0f, 0.0f, 0.0f, 1.0f};
    ball->unkFC->unk60 = ball->unk98;
    
    mathutil_mtxA_to_quat(&ball->unkA8);
}

void func_8003AA6C(struct Ball *ball)
{
    ball->unk124 = 60;
    lbl_80206BF0[ball->unk2E].unk20 = 0x5A;
    cameraInfo[ball->unk2E].state = 4;
    func_8002B5A4(ball->unk2 == 1 ? 0x51 : 0x1D);
    func_8002B5A4(0x15);
    ball->unk3 = 20;
}

void func_8003AB08(struct Ball *ball)
{
    struct Struct80039974 sp18;
    Vec spC;

    handle_ball_linear_kinematics(ball, &sp18, 0);
    handle_ball_rotational_kinematics(ball, &sp18, 0);
    update_ball_ape_transform(ball, &sp18, 0);
    ball->unk80++;

    if (--ball->unk124 > 0)
        return;
    
    ball->unk4.x = ball->unk10.x = decodedStageLzPtr->unk10->unk0.x;
    ball->unk4.y = ball->unk10.y = decodedStageLzPtr->unk10->unk0.y + ((ball->unk6C * 24.0) * 24.0) * 0.5;
    ball->unk4.z = ball->unk10.z = decodedStageLzPtr->unk10->unk0.z;
    
    ball->unk1C.x = 0.0f;
    ball->unk1C.y = 0.0f;
    ball->unk1C.z = 0.0f;
    
    ball->unk80 = 0;
    
    ball->unk98.w = 1.0f;
    ball->unk98.x = 0.0f;
    ball->unk98.y = 0.0f;
    ball->unk98.z = 0.0f;
    
    ball->unk14E = 30;
    lbl_80206BF0[ball->unk2E].unk20 = 30;
    
    spC.x = -mathutil_sin(decodedStageLzPtr->unk10->unkE);
    spC.y = 0.0f;
    spC.z = -mathutil_sin(decodedStageLzPtr->unk10->unkE + 0x4000);
    func_8008C408(ball->unkFC, &spC);
    
    cameraInfo[ball->unk2E].state = 0;
    
    ball->unk94 &= ~(1<<(31-0x14));
    ball->unk3 = 4;
}

/*
const float lbl_802F3398 = 0.65f;
const float lbl_802F339C = 0.032407406717538834f;
const float lbl_802F33A0 = 100.0f;
const float lbl_802F33A4 = 3.0f;
const float lbl_802F33A8 = 1.5f;
const float lbl_802F33AC = 0.9941f;
const float lbl_802F33B0 = 1.0f;
const float lbl_802F33B4 = 0.01f;
const float lbl_802F33B8 = 1.999f;
const float lbl_802F33BC = 0.0f;
const float lbl_802F33C0 = 0.00027777777f;
const float lbl_802F33C4 = -0.992f;
const float lbl_802F33C8 = 9.9999999392252903e-09f;
const double lbl_802F33D0 = 1.0;
const float lbl_802F33D8 = 0.5f;
const float lbl_802F33DC = 0.2f;
const float lbl_802F33E0 = 182.04444885253906f;  // DEGREES_TO_S16
const float lbl_802F33E4 = 20.0f;
const float lbl_802F33E8 = 12.0f;
const double lbl_802F33F0 = 4503601774854144;
const float lbl_802F33F8 = 90.0f;
const double lbl_802F3400 = 4503599627370496;
const float lbl_802F3408 = -0.12f;
const float lbl_802F340C = 0.05f;
const float lbl_802F3410 = -1.0f;
const float lbl_802F3414 = 0.99f;
const float lbl_802F341C = 0.75f;
const double lbl_802F3420 = 0.5;
const double lbl_802F3428 = 0.25;
const float lbl_802F3430 = -0.9998f;
const float lbl_802F3434 = 0.9998f;
const float lbl_802F3438 = 0.3f;
const float lbl_802F343C = -15.0f;
const float lbl_802F3440 = 0.1f;
const float lbl_802F3444 = 0.025f;
const float lbl_802F3448 = 5.0f;
const float lbl_802F344C = 1.4f;
const double lbl_802F3450 = 0.2;
const float lbl_802F3458 = 2.0f;
const float lbl_802F345C = 1.1920928955078125e-07f;
const double lbl_802F3460 = 0.0;
const double lbl_802F3468 = 0.75;
const float lbl_802F3470 = 0.25f;
const float lbl_802F3474 = 0.125f;
const double lbl_802F3478 = 24.0;
const double lbl_802F3480 = 3.0518509475997192e-05;
const double lbl_802F3488 = 10.0;
const float lbl_802F3490 = 32767.0f;
const double lbl_802F3498 = 10430.3779296875;
const double lbl_802F34A0 = 3.1415926500000002;
*/
const float lbl_802F34A8 = 0.00064f;
const float lbl_802F34AC = 14.5f;
const float lbl_802F34B0 = 2.5f;
const float lbl_802F34B4 = -13.5f;
const float lbl_802F34B8 = -5.5999999046325684f;
const float lbl_802F34BC = -2.0f;
