#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "event.h"
#include "info.h"
#include "item.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"
#include "stcoli.h"

void func_8006AD3C(Vec *, Vec *, Vec *, float, float);
extern u32 func_8006AAEC(Point3d *, Point3d *, Point3d *, Point3d *, float,  float);
void do_object_collision(void);

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
