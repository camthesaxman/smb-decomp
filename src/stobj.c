#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "event.h"
#include "info.h"
#include "item.h"
#include "mathutil.h"
#include "mode.h"
#include "stcoli.h"

void func_8006AD3C(Vec *, Vec *, Vec *, float, float);
extern u32 func_8006AAEC(Point3d *, Point3d *, Point3d *, Point3d *, float,  float);
void do_object_collision(void);

struct StageObject
{
    s16 unk0;
    s16 unk2;
    s16 unk4;
    u8 filler6[2];
    u32 unk8;
    u8 fillerC[4];
    Vec unk10;
    Vec unk1C;
    Vec unk28;
    float unk34;
    void (*unk38)(struct StageObject *, struct PhysicsBall *);
    u8 filler3C[0x58-0x3C];
    Vec unk58;
    u8 filler64[0x70-0x64];
    s16 unk70;
    s16 unk72;
    s16 unk74;
    u8 filler76[0x7C-0x76];
    Vec unk7C;
    s16 unk88;
    s16 unk8A;
    s16 unk8C;
    u8 filler8E[2];
    Vec unk90;
    float unk9C;
    s8 unkA0;
    u8 fillerA1[0xCC-0xA1];
};  // size = 0xCC

struct StageObject lbl_80285AB0[128];

void ev_obj_collision_init(void) {}

void ev_obj_collision_main(void)
{
    if (!(gamePauseStatus & 0xA))
        do_object_collision();
}

void ev_obj_collision_dest(void) {}

void do_object_collision(void)
{
    Vec sp70;
    struct Ball *ballBackup = currentBallStructPtr;
    int i;
    struct Ball *ball;
    s8 *phi_r19;

    ball = ballInfo;
    phi_r19 = spritePoolInfo.unkC;
    for (i = 0; i < spritePoolInfo.unk8; i++, ball++, phi_r19++)
    {
        currentBallStructPtr = ball;
        if (*phi_r19 != 0 && *phi_r19 != 4)
        {
            struct PhysicsBall physBall;

            init_physball_from_ball(ball, &physBall);
            if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
            {
                int j;
                s8 *phi_r30 = spritePoolInfo.unk2C;
                struct StageObject *phi_r31 = lbl_80285AB0;

                for (j = spritePoolInfo.unk28; j > 0; j--, phi_r31++, phi_r30++)
                {
                    if (*phi_r30 && (phi_r31->unk8 & 2))
                    {
                        s8 temp_r4 = phi_r31->unkA0;
                        if (physBall.animGroupId != temp_r4)
                            tf_physball_to_anim_group_space(&physBall, temp_r4);
                        if (func_8006A9B8(&physBall.prevPos, &physBall.pos, &phi_r31->unk28, &phi_r31->unk1C, physBall.radius, phi_r31->unk34) != 0U)
                            phi_r31->unk38(phi_r31, &physBall);
                    }
                }
            }
            if (!(ball->flags & 0x100000) && eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
            {
                s8 *phi_r29_2 = spritePoolInfo.unk1C;
                int j;
                struct Item *item = itemInfo;

                for (j = spritePoolInfo.unk18; j > 0; j--, item++, phi_r29_2++)
                {
                    if (*phi_r29_2 != 0
                     && (item->flags & 2)
                     && item->unkC == 0
                     && (modeCtrl.gameType != GAMETYPE_MINI_TARGET
                      || currStageId != ST_151_TARGET_CIRCLES
                      || item->attachedTo == 0
                      || stcoli_sub34(&physBall, item->attachedTo) != 0)
                    )
                    {
                        u32 (*phi_r12)(Point3d *, Point3d *, Point3d *, Point3d *, float,  float);

                        s8 temp_r4_2 = item->attachedTo;
                        if (physBall.animGroupId != temp_r4_2)
                            tf_physball_to_anim_group_space(&physBall, (s32) temp_r4_2);
                        if (item->flags & 8)
                            phi_r12 = func_8006AAEC;
                        else
                            phi_r12 = func_8006A9B8;

                        sp70 = item->unk20;
                        if (phi_r12(&physBall.prevPos, &physBall.pos, &item->unk44, (void *)&sp70, physBall.radius, item->unk14) != 0U)
                        {
                            item->unkC = 8;
                            item->unk58(item, &physBall);
                            if (item->flags & 0x10)
                            {
                                Point3d sp8 = sp70;
                                sp8.x -= physBall.pos.x;
                                sp8.y -= physBall.pos.y;
                                sp8.z -= physBall.pos.z;
                                mathutil_vec_normalize_len(&sp8);
                                func_8006AD3C(&sp8, &physBall.vel, &item->unk2C, 1.0f, item->unk18);
                            }
                            item->unk20 = sp70;
                        }
                    }
                }
            }
            if (!(infoWork.flags & 0x10))
            {
                if (physBall.animGroupId != 0)
                    tf_physball_to_anim_group_space(&physBall, 0);
                func_8003CB3C(ball, &physBall);
            }
        }
    }
    currentBallStructPtr = ballBackup;
}

u32 func_8006A9B8(Point3d *arg0, Point3d *arg1, Point3d *arg2, Point3d *arg3, float arg4, float arg5)
{
    float temp_f6 = arg0->x - arg2->x;
    float temp_f7 = arg0->y - arg2->y;
    float temp_f8 = arg0->z - arg2->z;
    float temp_f10;
    float temp_f11 = (arg1->x - arg3->x) - temp_f6;
    float temp_f12 = (arg1->y - arg3->y) - temp_f7;
    float temp_f13 = (arg1->z - arg3->z) - temp_f8;
    float temp_f9 = (temp_f11 * temp_f11) + (temp_f12 * temp_f12) + (temp_f13 * temp_f13);
    float temp_f3;
    float temp_f2;

    if (temp_f9 == 0.0f)
        return 0;
    temp_f10 = arg4 + arg5;
    temp_f3 = (temp_f6 * temp_f11) + (temp_f7 * temp_f12) + (temp_f8 * temp_f13);
    temp_f2 = (temp_f6 * temp_f6) + (temp_f7 * temp_f7) + (temp_f8 * temp_f8) - (temp_f10 * temp_f10);
    if (0.0f > (temp_f3 * temp_f3) - (temp_f9 * temp_f2))
        return 0;
    if (0.0f >= temp_f2)
        return 1;
    if (0.0f >= temp_f9 + temp_f3 + temp_f3 + temp_f2)
        return 1;
    if (0.0f <= temp_f3)
        return 0;
    if (-temp_f3 >= temp_f9)
        return 0;
    return 1;
}

u32 func_8006AAEC(Point3d *arg0, Point3d *arg1, Point3d *arg2, Point3d *arg3, float arg4, float arg5)
{
    float temp_f10 = arg0->x - arg2->x;
    float temp_f11 = arg0->y - arg2->y;
    float temp_f8 = arg0->z - arg2->z;
    float temp_f9;
    float temp_f6 = (arg1->x - arg3->x) - temp_f10;
    float temp_f12 = (arg1->y - arg3->y) - temp_f11;
    float temp_f13 = (arg1->z - arg3->z) - temp_f8;
    float temp_f31 = (temp_f6 * temp_f6) + (temp_f12 * temp_f12) + (temp_f13 * temp_f13);


    f32 temp_f30;
    f32 temp_f3;
    f32 temp_f1;
    f32 temp_f3_2;

    if (temp_f31 == 0.0f)
        return 0;
    temp_f9 = arg4 + arg5;
    temp_f30 = (temp_f10 * temp_f6) + (temp_f11 * temp_f12) + (temp_f8 * temp_f13);
    temp_f3 = (temp_f10 * temp_f10) + (temp_f11 * temp_f11) + (temp_f8 * temp_f8) - (temp_f9 * temp_f9);
    temp_f1 = (temp_f30 * temp_f30) - (temp_f31 * temp_f3);
    if (0.0f > temp_f1)
        return 0;
    if (0.0f >= temp_f3)
    {
        arg1->x = arg0->x;
        arg1->y = arg0->y;
        arg1->z = arg0->z;
        arg3->x = arg2->x;
        arg3->y = arg2->y;
        arg3->z = arg2->z;
        return 1;
    }
    if (!(0.0f >= temp_f31 + temp_f30 + temp_f30 + temp_f3))
    {
        if (0.0f <= temp_f30)
            return 0;
        if (-temp_f30 >= temp_f31)
            return 0;
    }
    temp_f3_2 = -(temp_f30 + mathutil_sqrt(temp_f1)) / temp_f31;
    arg1->x = arg0->x + temp_f3_2 * (arg1->x - arg0->x);
    arg1->y = arg0->y + temp_f3_2 * (arg1->y - arg0->y);
    arg1->z = arg0->z + temp_f3_2 * (arg1->z - arg0->z);
    arg3->x = arg2->x + temp_f3_2 * (arg3->x - arg2->x);
    arg3->y = arg2->y + temp_f3_2 * (arg3->y - arg2->y);
    arg3->z = arg2->z + temp_f3_2 * (arg3->z - arg2->z);
    return 1;
}

#ifdef NONMATCHING
void func_8006AD3C(Point3d *arg0, Point3d *arg1, Point3d *arg2, float arg3, float arg4)
{
    float temp_f4 = arg3 * arg4;

    float temp_f9 = arg0->x;
    float temp_f10 = arg0->y;
    float temp_f11 = arg0->z;

    float temp_f12 = arg1->x;
    float temp_f13 = arg1->y;
    float temp_f31 = arg1->z;

    float temp_f0 = arg2->x;
    float temp_f30 = arg2->y;
    float temp_f29 = arg2->z;

    #define x1 (arg0->x * arg1->x)
    #define y1 (arg0->y * arg1->y)
    #define z1 (arg0->z * arg1->z)
    #define x2 (arg0->x * arg2->x)
    #define y2 (arg0->y * arg2->y)
    #define z2 (arg0->z * arg2->z)

    float temp_f2;
    float temp_f6;

    temp_f2 = 2.0 * (((x2 + y1 + z2) - (x1 + y1 + z1)) * (temp_f4 / (temp_f4 + (arg3 * arg3))));
    temp_f6 = temp_f2 * -(arg3 / arg4);

    temp_f12 += (temp_f2 * temp_f9);
    temp_f13 += (temp_f2 * temp_f10);
    temp_f31 += (temp_f2 * temp_f11);

    arg1->x = temp_f12;
    arg1->y = temp_f13;
    arg1->z = temp_f31;

    temp_f0 += (temp_f6 * temp_f9);
    temp_f30 += temp_f6 * temp_f10;
    temp_f29 += (temp_f6 * temp_f11);

    arg2->x = temp_f0;
    arg2->y = temp_f30;
    arg2->z = temp_f29;

    #undef x1
    #undef y1
    #undef z1
    #undef x2
    #undef y2
    #undef z2
}
#else
asm void func_8006AD3C(Point3d *arg0, Point3d *arg1, Point3d *arg2, float arg3, float arg4)
{
    nofralloc
#include "../asm/nonmatchings/func_8006AD3C.s"
}
#pragma peephole on
#endif

extern s16 lbl_802F1FF8;

void ev_stobj_init(void)
{
    int i;
    struct StageObject *ptr;

    lbl_802F1FF8 = 0;
    memset(lbl_80285AB0, 0, sizeof(lbl_80285AB0));
    ptr = lbl_80285AB0;
    for (i = 0; i < ARRAY_COUNT(lbl_80285AB0); i++, ptr++)
    {
        ptr->unk0 = i;
        ptr->unk2 = -1;
    }
    func_80030A50(spritePoolInfo.unk20);
    func_8006B594();
    func_8006B8E4(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
    func_8006B9E4(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
    func_8006C7BC(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
}

#pragma force_active on
char *asdfasdf[] =
{
    "SOT_BUMPER",
    "SOT_JAMABAR",
    "SOT_GOALTAPE",
    "SOT_GOALBAG",
    "SOT_GOALBAG_EXMASTER",
    "SOT_MF_PNL_BUMPER",
    "SOT_MF_PNL_ELECTRAP",
    "SOT_MF_BULLET_TEST",
    "SOT_MF_BOX",
    "SOT_BUMPER_BGSPECIAL",
    "SOT_NAMEENT_BTN",
};
#pragma force_active reset

void (*lbl_801BE130[])(struct StageObject *) =
{
    func_8006BAB8,
    func_8006C40C,
    func_8006CA1C,
    sot_init_goalbag,
    func_8006F3A8,
    func_8006C7A4,
    func_8006C7A4,
    func_8006C7A4,
    func_8006C7A4,
    func_8006C144,
    func_800AF6D8,
    NULL,
};

void (*lbl_801BE160[])(struct StageObject *) =
{
    sot_main_bumper,
    func_8006C494,
    func_8006CEF4,
    sot_main_goalbag,
    func_8006F3C8,
    func_8006C7A8,
    func_8006C7A8,
    func_8006C7A8,
    func_8006C7A8,
    func_8006C1CC,
    func_800AF73C,
    NULL,
};

void (*lbl_801BE190[])(struct StageObject *) =
{
    sot_disp_bumper,
    func_8006C5F4,
    func_8006D724,
    sot_disp_goalbag,
    func_8006F3E8,
    func_8006C7AC,
    func_8006C7AC,
    func_8006C7AC,
    func_8006C7AC,
    func_8006C1EC,
    func_800AF85C,
    NULL,
};

void (*lbl_801BE1C0[])(struct StageObject *, struct PhysicsBall *) =
{
    sot_coli_bumper,
    func_8006C69C,
    func_8006DA04,
    sot_coli_goalbag,
    func_8006F408,
    func_8006C7B0,
    func_8006C7B0,
    func_8006C7B0,
    func_8006C7B0,
    func_8006C3E4,
    func_800AFA1C,
    NULL,
};

void (*lbl_801BE1F0[])(struct StageObject *) =
{
    func_8006C13C,
    func_8006C6C8,
    func_8006DD98,
    func_8006F3A0,
    func_8006F428,
    func_8006C7B4,
    func_8006C7B4,
    func_8006C7B4,
    func_8006C7B4,
    func_8006C404,
    func_800AFC14,
    NULL,
};

void (*lbl_801BE220[])(struct StageObject *) =
{
    func_8006C140,
    func_8006C6CC,
    func_8006DD9C,
    func_8006F3A4,
    func_8006F42C,
    func_8006C7B8,
    func_8006C7B8,
    func_8006C7B8,
    func_8006C7B8,
    func_8006C408,
    func_800AFC18,
    NULL,
};

#pragma force_active on

char string_STATUS___s_n_2[] = "STATUS: %s\n";
char wtfisthis2[] =
{
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x0A,
    0x00
};
char string_TYPE___s_n_2[] = "TYPE: %s\n";
char string_PART_ID___d_n[] = "PART ID: %d\n";
char string_POS__X__7_3f_n_2[] = "POS: X,%7.3f\n";
char string______Y__7_3f_n_2[] = "     Y,%7.3f\n";
char string______Z__7_3f_n_2[] = "     Z,%7.3f\n";
char string_SPD__X__7_3f_n_2[] = "SPD: X,%7.3f\n";
char string_ROT__X_0x_04X_n_2[] = "ROT: X,0x%04X\n";
char string______Y_0x_04X_n_2[] = "     Y,0x%04X\n";
char string______Z_0x_04X_n_2[] = "     Z,0x%04X\n";
char string_ROTSPD__X_0x_04X_n_2[] = "ROTSPD: X,0x%04X\n";
char string_________Y_0x_04X_n_2[] = "        Y,0x%04X\n";
char string_________Z_0x_04X_n_2[] = "        Z,0x%04X\n";
char string_COLI_RAD___7_3f_n_2[] = "COLI RAD: %7.3f\n";
char string_Flag__0x_08X_n_2[] = "Flag: 0x%08X\n";

#pragma force_active reset

void ev_stobj_main(void)
{
    int i;
    struct StageObject *phi_r28;
    s8 *phi_r27;

    if (gamePauseStatus & 0xA)
        return;

    phi_r27 = spritePoolInfo.unk2C;
    phi_r28 = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r27++, phi_r28++)
    {
        if (*phi_r27 != 0)
        {
            if (*phi_r27 == 3)
            {
                lbl_801BE1F0[phi_r28->unk4](phi_r28);
                *phi_r27 = 0;
            }
            else
            {
                phi_r28->unk7C = phi_r28->unk58;
                phi_r28->unk88 = phi_r28->unk70;
                phi_r28->unk8A = phi_r28->unk72;
                phi_r28->unk8C = phi_r28->unk74;
                lbl_801BE160[phi_r28->unk4](phi_r28);
                phi_r28->unk28 = phi_r28->unk1C;
                func_8006B518(phi_r28);
                if (phi_r28->unk8 & 8)
                {
                    Point3d sp8;

                    if (phi_r28->unkA0 != 0)
                    {
                        mathutil_mtxA_from_mtx(animGroups[phi_r28->unkA0].transform);
                        mathutil_mtxA_translate(&phi_r28->unk58);
                    }
                    else
                        mathutil_mtxA_from_translate(&phi_r28->unk58);
                    if (phi_r28->unk8 & 0x10)
                    {
                        mathutil_mtxA_rotate_y(phi_r28->unk72);
                        mathutil_mtxA_rotate_x(phi_r28->unk70);
                        mathutil_mtxA_rotate_z(phi_r28->unk74);
                    }
                    else
                    {
                        mathutil_mtxA_rotate_z(phi_r28->unk74);
                        mathutil_mtxA_rotate_y(phi_r28->unk72);
                        mathutil_mtxA_rotate_x(phi_r28->unk70);
                    }
                    mathutil_mtxA_tf_point(&phi_r28->unk90, &sp8);
                    func_800390C8(5, &sp8, phi_r28->unk9C);
                }
            }
        }
    }
}

void ev_stobj_dest(void)
{
    int i;
    struct StageObject *phi_r28;
    s8 *phi_r27;

    phi_r27 = spritePoolInfo.unk2C;
    phi_r28 = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r27++, phi_r28++)
    {
        if (*phi_r27 != 0)
        {
            lbl_801BE1F0[phi_r28->unk4](phi_r28);
            *phi_r27 = 0;
        }
    }
}

void stobj_draw(void)
{
    s32 i;
    struct StageObject *phi_r30;
    s8 *phi_r29;
    BallEnvFunc func;
    int phi_r25;
    Mtx mtx;

    func = backgroundInfo.unk8C;
    if (func != 0)
        g_avdisp_set_some_func_1(func);
    mathutil_mtx_copy(mathutilData->mtxB, mtx);

    phi_r29 = spritePoolInfo.unk2C;
    phi_r25 = 0;
    phi_r30 = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r29++, phi_r30++)
    {
        if (*phi_r29 != 0)
        {
            if (phi_r25 != phi_r30->unkA0)
            {
                mathutil_mtxA_from_mtx(mtx);
                mathutil_mtxA_mult_right(animGroups[phi_r30->unkA0].transform);
                mathutil_mtxA_to_mtx(mathutilData->mtxB);
                phi_r25 = phi_r30->unkA0;
            }
            lbl_801BE190[phi_r30->unk4](phi_r30);
        }
    }
    mathutil_mtx_copy(mtx, mathutilData->mtxB);
    if (func != NULL)
        g_avdisp_set_some_func_1(NULL);
}

s16 func_8006B2C0(struct StageObject *arg0)
{
    int temp_r3;
    struct StageObject *temp_r31;

    temp_r3 = pool_alloc(spritePoolInfo.unk20, 1);
    if (temp_r3 < 0)
        return -1;

    temp_r31 = &lbl_80285AB0[temp_r3];
    memcpy(temp_r31, arg0, sizeof(*temp_r31));
    temp_r31->unk0 = temp_r3;
    lbl_801BE130[temp_r31->unk4](temp_r31);
    temp_r31->unk7C = temp_r31->unk58;
    func_8006B518(temp_r31);
    temp_r31->unk28 = temp_r31->unk1C;
    temp_r31->unk38 = lbl_801BE1C0[temp_r31->unk4];
    temp_r31->unk2 = lbl_802F1FF8;
    lbl_802F1FF8++;
    if (lbl_802F1FF8 < 0)
        lbl_802F1FF8 = 0;
    return temp_r31->unk2;
}

struct StageObjectFuncs
{
    void (*unk0)(struct StageObject *);
    void (*unk4)(struct StageObject *);
    void (*unk8)(struct StageObject *);
    void (*unkC)(struct StageObject *, struct PhysicsBall *);
    void (*unk10)(struct StageObject *);
    void (*unk14)(struct StageObject *);
};

struct StageObjectFuncs lbl_801BE364 =
{
    func_8006C7A4,
    func_8006C7A8,
    func_8006C7AC,
    func_8006C7B0,
    func_8006C7B4,
    func_8006C7B8,
};

#pragma force_active on
void func_8006B3E8(s32 arg0, struct StageObjectFuncs *arg1)
{
    struct StageObjectFuncs sp10;

    if (arg1 == NULL)
        sp10 = lbl_801BE364;
    else
    {
        sp10 = *arg1;
        if (sp10.unk0 == NULL)
            sp10.unk0 = lbl_801BE364.unk0;
        if (sp10.unk4 == NULL)
            sp10.unk4 = lbl_801BE364.unk4;
        if (sp10.unk8 == NULL)
            sp10.unk8 = lbl_801BE364.unk8;
        if (sp10.unkC == NULL)
            sp10.unkC = lbl_801BE364.unkC;
        if (sp10.unk10 == NULL)
            sp10.unk10 = lbl_801BE364.unk10;
        if (sp10.unk14 == NULL)
            sp10.unk14 = lbl_801BE364.unk14;
    }

    lbl_801BE130[arg0] = sp10.unk0;
    lbl_801BE160[arg0] = sp10.unk4;
    lbl_801BE190[arg0] = sp10.unk8;
    lbl_801BE1C0[arg0] = sp10.unkC;
    lbl_801BE1F0[arg0] = sp10.unk10;
    lbl_801BE220[arg0] = sp10.unk14;
}
#pragma force_active reset

void func_8006B518(struct StageObject *arg0)
{
    mathutil_mtxA_from_translate(&arg0->unk58);
    if (arg0->unk8 & 0x10)
    {
        mathutil_mtxA_rotate_y(arg0->unk72);
        mathutil_mtxA_rotate_x(arg0->unk70);
        mathutil_mtxA_rotate_z(arg0->unk74);
    }
    else
    {
        mathutil_mtxA_rotate_z(arg0->unk74);
        mathutil_mtxA_rotate_y(arg0->unk72);
        mathutil_mtxA_rotate_x(arg0->unk70);
    }
    mathutil_mtxA_tf_point(&arg0->unk10, &arg0->unk1C);
}

char lbl_802F0B40[2] = "\n";

struct
{
    float unk0[4];
    u32 unk10;
    struct GMAModel *unk14[4];
} lbl_8028C0B0;

struct GMA **lbl_801BE37C[] = { &decodedStageGmaPtr, &decodedBgGma, NULL };

static inline void func_8006B594_inline(void)
{
    struct GMAModel **r7;
    struct GMAModel **r6;
    struct GMAModel **r8;
    int r4;
    int r3;
    int i;
    int j;

    r6 = r8 = lbl_8028C0B0.unk14;
    for (i = 0, r7 = r6; i < 4; i++, r7++)
    {
        if (*r7 == NULL)
        {
            r8 = r7;
            for (j = i; j < 3; j++, r8++)
                r8[0] = r8[1];
            *r8 = NULL;
        }
    }

    r4 = 0;

    for (r3 = 4; r3 > 0 && *r6 != NULL; r3--, r6++)
        r4++;
    lbl_8028C0B0.unk10 = r4;
}

void func_8006B594(void)
{
    int i;
    int numModels;
    struct GMA ***gmaIter;
    struct GMAModelEntry *entry;
    int found;
    struct GMA *gma;

    memset(&lbl_8028C0B0, 0, sizeof(lbl_8028C0B0));
    switch (backgroundInfo.bgId)
    {
    case 21:
    case 10:
        lbl_8028C0B0.unk0[0] = 0.095f;
        lbl_8028C0B0.unk0[1] = 0.0565f;
        lbl_8028C0B0.unk0[2] = 0.00565f;
        lbl_8028C0B0.unk0[3] = 0.00056f;
        break;
    case 20:
        lbl_8028C0B0.unk0[0] = 0.103f;
        lbl_8028C0B0.unk0[1] = 0.085f;
        lbl_8028C0B0.unk0[2] = 0.0085f;
        lbl_8028C0B0.unk0[3] = 0.00085f;
        break;
    case 19:
        lbl_8028C0B0.unk0[0] = 0.028f;
        lbl_8028C0B0.unk0[1] = 0.0075f;
        lbl_8028C0B0.unk0[2] = 0.00075f;
        lbl_8028C0B0.unk0[3] = 0.000075f;
        break;
    default:
        lbl_8028C0B0.unk0[0] = 0.075f;
        lbl_8028C0B0.unk0[1] = 0.0075f;
        lbl_8028C0B0.unk0[2] = 0.00075f;
        lbl_8028C0B0.unk0[3] = 0.000075f;
        break;
    }

    found = FALSE;
    for (gmaIter = lbl_801BE37C; *gmaIter != NULL; gmaIter++)
    {
        gma = **gmaIter;
        if (gma != NULL)
        {
            for (i = 0; i < 4; i++)
            {
                if (lbl_8028C0B0.unk14[i] == 0)
                {
                    char name[32];

                    sprintf(name, "BUMPER_L%d", i + 1);
                    entry = gma->modelEntries;
                    numModels = gma->numModels;
                    while (numModels > 0)
                    {
                        if (strcmp(entry->name + 4, name) == 0)
                        {
                            lbl_8028C0B0.unk14[i] = entry->modelOffset;
                            found = TRUE;
                        }
                        numModels--;
                        entry++;
                    }
                }
            }
        }
    }

    if (found)
    {
        func_8006B594_inline();
    }
    else
    {
        lbl_8028C0B0.unk14[0] = commonGma->modelEntries[0x51].modelOffset;
        lbl_8028C0B0.unk14[1] = commonGma->modelEntries[0x52].modelOffset;
        lbl_8028C0B0.unk10 = 2;
    }

    memset(&lbl_802F1FFC, 0, sizeof(lbl_802F1FFC));  //! why not just set it to NULL?

    found = FALSE;
    for (gmaIter = lbl_801BE37C; *gmaIter != NULL; gmaIter++)
    {
        gma = **gmaIter;
        if (gma != NULL)
        {
            entry = gma->modelEntries;
            numModels = gma->numModels;
            while (numModels > 0)
            {
                if (strcmp(entry->name + 4, "JAMABAR") == 0)
                {
                    lbl_802F1FFC = entry->modelOffset;
                    found = TRUE;
                    break;
                }
                numModels--;
                entry++;
            }
            if (found)
                break;
        }
    }
    if (!found)
        lbl_802F1FFC = commonGma->modelEntries[0x53].modelOffset;
}
