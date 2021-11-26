#include <stddef.h>
#include <dolphin.h>

#include "global.h"
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
    func_8003FB48(&r31->unk4, &sp70, 0);
    mathutil_mtxA_from_translate(&r31->unk4);
    mathutil_mtxA_rotate_y(r29);
    r31->unk94 &= ~(1<<(31-0x1E));

    for (i = 0; i < 4; i++)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_tf_point(&spC[i], &sp48);
        func_8003FB48(&sp48, &sp54, 0);
        mathutil_mtxA_pop();
        if (sp54.unk0 == 0 || sp54.unk8 < sp70.unk8 - 1.0)
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

const float lbl_802F340C = 0.05f;  // probably from an inline function

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

    func_8003FB48(&r29->unk4, &sp50, 0);
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
    lbl_802F1F10 = 0;
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
*/
const float lbl_802F341C = 0.75f;
const double lbl_802F3420 = 0.5;
const double lbl_802F3428 = 0.25;
