#include <stdint.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "course.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "world.h"

static struct Struct80250B70
{
    s16 unk0;
    Vec unk4;
} lbl_80250B70;

static struct
{
    struct ReplayInfo unk0;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    s16 unk20;
    s16 unk22;
    Vec unk24;
    u32 unk30;
    u32 unk34;
    Vec unk38;
    u8 unk44[24][0xF00];
} lbl_80250B80;

struct
{
    s16 unk0;
    u16 unk2;
    u8 filler4[4];
} lbl_802F1F88 ATTRIBUTE_ALIGN(8);

int lbl_802F1F80;

void func_8004BC1C(int arg0, struct Struct800496BC *arg1);
void func_8004C180(int arg0, struct Struct8020AE40_sub2 *arg1);

void func_8004AFC0(void)
{
    lbl_80250B70.unk0 = 0;
}

void func_8004AFD0(void) {}

void func_8004AFD4(void) {}

void func_8004AFD8(void)
{
    struct Ball *temp_r29 = &ballInfo[modeCtrl.currPlayer];
    struct World *temp_r28 = &worldInfo[modeCtrl.currPlayer];
    s32 x;
    s32 y;
    s32 z;
    int var_r24_2;
    u32 temp;
    u32 temp_2;
    int temp_r4;
    int var;

    switch (lbl_80250B70.unk0)
    {
    case 1:
        break;
    default:
        return;
    }

    temp_r4 = lbl_80250B80.unk34;
    if (temp_r4 <= (u32)0xF00)
    {
        x = 16383.5f * (temp_r29->pos.x - lbl_80250B70.unk4.x);
        y = 16383.5f * (temp_r29->pos.y - lbl_80250B70.unk4.y);
        z = 16383.5f * (temp_r29->pos.z - lbl_80250B70.unk4.z);
        if (x < -0x7FFF)
            x = -0x7FFF;
        else if (x > 0x7FFF)
            x = 0x7FFF;
        if (y < -0x7FFF)
            y = -0x7FFF;
        else if (y > 0x7FFF)
            y = 0x7FFF;
        if (z < -0x7FFF)
            z = -0x7FFF;
        else if (z > 0x7FFF)
            z = 0x7FFF;

        lbl_80250B80.unk44[0][temp_r4] = x & 0xFF;
        x >>= 8;
        lbl_80250B80.unk44[1][temp_r4] = x & 0xFF;

        lbl_80250B80.unk44[2][temp_r4] = y & 0xFF;
        y >>= 8;
        lbl_80250B80.unk44[3][temp_r4] = y & 0xFF;

        lbl_80250B80.unk44[4][temp_r4] = z & 0xFF;
        z >>= 8;
        lbl_80250B80.unk44[5][temp_r4] = z & 0xFF;

        temp = (u16)temp_r29->unk28;
        lbl_80250B80.unk44[6][temp_r4] = temp & 0xFF;
        temp >>= 8;
        lbl_80250B80.unk44[7][temp_r4] = (temp) & 0xFF;

        temp = (u16)temp_r29->unk2A;
        lbl_80250B80.unk44[8][temp_r4] = temp & 0xFF;
        temp >>= 8;
        lbl_80250B80.unk44[9][temp_r4] = (temp) & 0xFF;

        temp = (u16)temp_r29->unk2C;
        lbl_80250B80.unk44[10][temp_r4] = temp & 0xFF;
        temp >>= 8;
        lbl_80250B80.unk44[11][temp_r4] = (temp) & 0xFF;

        lbl_80250B80.unk44[12][temp_r4] = 127.0f * temp_r29->unk114.x;
        lbl_80250B80.unk44[13][temp_r4] = 127.0f * temp_r29->unk114.y;
        lbl_80250B80.unk44[14][temp_r4] = 127.0f * temp_r29->unk114.z;

        var_r24_2 = (127.0f * temp_r29->unk130);
        !var_r24_2;
        if (var_r24_2 < -0x7F)
            var_r24_2 = -0x7F;
        else if (var_r24_2 > 0x7F)
            var_r24_2 = 0x7F;
        lbl_80250B80.unk44[15][temp_r4] = (s8)var_r24_2;

        temp_2 = temp_r29->flags;
        lbl_80250B80.unk44[16][temp_r4] = temp_2;
        temp_2 >>= 8;
        lbl_80250B80.unk44[17][temp_r4] = temp_2;
        temp_2 >>= 8;
        lbl_80250B80.unk44[18][temp_r4] = temp_2;
        temp_2 >>= 8;
        lbl_80250B80.unk44[19][temp_r4] = temp_2;

        temp_2 = (u16)temp_r28->xrot;
        lbl_80250B80.unk44[20][temp_r4] = temp_2;
        temp_2 >>= 8;
        lbl_80250B80.unk44[21][temp_r4] = temp_2;

        temp_2 = (u16)temp_r28->zrot;
        lbl_80250B80.unk44[22][temp_r4] = temp_2;
        temp_2 >>= 8;
        lbl_80250B80.unk44[23][temp_r4] = temp_2;

        var = ((lbl_80250B80.unk44[1][temp_r4] & 0xFF) << 8) | (lbl_80250B80.unk44[0][temp_r4] & 0xFF);
        lbl_80250B70.unk4.x += (0.00006103702f * (s16)var);
        var = ((lbl_80250B80.unk44[3][temp_r4] & 0xFF) << 8) | (lbl_80250B80.unk44[2][temp_r4] & 0xFF);
        lbl_80250B70.unk4.y += (0.00006103702f * (s16)var);
        var = ((lbl_80250B80.unk44[5][temp_r4] & 0xFF) << 8) | (lbl_80250B80.unk44[4][temp_r4] & 0xFF);
        lbl_80250B70.unk4.z += (0.00006103702f * (s16)var);

        lbl_80250B80.unk1A++;
        lbl_80250B80.unk22 = lbl_80206DEC.unk0;
        lbl_80250B80.unk34 = temp_r4 + 1;
    }
}

void func_8004B334(void)
{
    func_8004B540();
}

void func_8004B354(void)
{
    struct Ball *temp_r29;
    int practice;

    practice = modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE;
    temp_r29 = &ballInfo[modeCtrl.currPlayer];

    lbl_80250B70.unk4 = temp_r29->pos;
    memset(&lbl_80250B80, 0, sizeof(lbl_80250B80));
    lbl_80250B80.unk38 = temp_r29->pos;
    lbl_80250B80.unk30 = 0;
    lbl_80250B80.unk34 = 0;
    lbl_80250B80.unk18 = infoWork.timerCurr;
    lbl_80250B80.unk1A = 0;
    lbl_80250B80.unk0.flags = 0;
    lbl_80250B80.unk0.stageId = currStageId;
    if (!practice)
    {
        lbl_80250B80.unk0.difficulty = modeCtrl.difficulty;
        lbl_80250B80.unk0.floorNum = infoWork.currFloor;
    }
    else
    {
        lbl_80250B80.unk0.difficulty = lbl_8027CE24[0].unk2;
        lbl_80250B80.unk0.floorNum = lbl_8027CE24[0].unk0;
    }
    lbl_80250B80.unk0.unk5 = playerCharacterSelection[temp_r29->playerId];
    lbl_80250B80.unk0.unk6[0] = 0;
    lbl_80250B80.unk22 = lbl_80206DEC.unk0;
    if (infoWork.flags & 0x40)
        lbl_80250B80.unk0.flags |= 8;
    if (!practice)
    {
        if (modeCtrl.courseFlags & 8)
            lbl_80250B80.unk0.flags |= 0x20;
        if (modeCtrl.courseFlags & 0x10)
            lbl_80250B80.unk0.flags |= 0x40;
    }
    else
    {
        if (lbl_8027CE24[0].unk4 & 8)
            lbl_80250B80.unk0.flags |= 0x20;
        if (lbl_8027CE24[0].unk4 & 0x10)
            lbl_80250B80.unk0.flags |= 0x40;
    }
    lbl_80250B80.unk0.unk10 = -1;
    lbl_80250B70.unk0 = 1;
}

void func_8004B540(void)
{
    lbl_80250B70.unk0 = 0;
}

void func_8004B550(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        lbl_80250B80.unk0.flags |= 1;
        lbl_80250B80.unk1C = infoWork.unk1C;
        lbl_80250B80.unk24 = infoWork.unk10;
        lbl_80250B80.unk1E = infoWork.goalEntered;
        lbl_80250B80.unk20 = infoWork.unkE;
    }
}

void func_8004B5AC(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        lbl_80250B80.unk0.flags |= 2;
        lbl_80250B80.unk0.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
        lbl_80250B80.unk1C = infoWork.timerCurr;
    }
}

void func_8004B60C(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        lbl_80250B80.unk0.flags |= 4;
        lbl_80250B80.unk0.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
    }
}

void func_8004B65C(void)
{
    lbl_80250B80.unk0.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
}

void func_8004B694(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        lbl_80250B80.unk0.flags |= 0x80;
        lbl_80250B80.unk1C = infoWork.timerCurr;
    }
}

void func_8004B6C8(char *arg0)
{
    strncpy(lbl_80250B80.unk0.unk6, arg0, sizeof(lbl_80250B80.unk0.unk6));
    lbl_80250B80.unk0.unk6[3] = 0;
}

void func_8004B70C(void)
{
    infoWork.timerMax = lbl_80250B80.unk18;
    infoWork.timerCurr = lbl_80250B80.unk18;
    infoWork.flags &= ~0x667;
    infoWork.currFloor = lbl_80250B80.unk0.floorNum;
    if (lbl_80250B80.unk0.flags & 1)
    {
        infoWork.flags |= 0x28;
        infoWork.timerCurr = lbl_80250B80.unk1C;
        infoWork.unk1C = lbl_80250B80.unk1C;
        infoWork.unk10 = lbl_80250B80.unk24;
        infoWork.goalEntered = lbl_80250B80.unk1E;
        infoWork.unkE = lbl_80250B80.unk20;
    }
    if (lbl_80250B80.unk0.flags & 8)
        infoWork.flags |= 0x40;
    playerCharacterSelection[lbl_80250A68.unk14] = lbl_80250B80.unk0.unk5;
    modeCtrl.difficulty = lbl_80250B80.unk0.difficulty;
    modeCtrl.courseFlags &= 0xFFFFFFE7;
    if (lbl_80250B80.unk0.flags & 0x20)
        modeCtrl.courseFlags |= 8;
    if (lbl_80250B80.unk0.flags & 0x40)
        modeCtrl.courseFlags |= 0x10;
}

float func_8004B81C(void)
{
    return lbl_80250B80.unk1A;
}

void func_8004B850(float arg0, struct Struct800496BC *arg1)
{
    struct Struct800496BC sp64;
    struct Struct800496BC sp44;
    struct Struct800496BC sp24;
    Vec sp18;
    float temp_f2;
    float temp_f31;
    float temp_f30;
    int temp_r29;
    struct Ball *temp_r5;
    u8 unused[4];

    temp_r5 = currentBallStructPtr;
    if (lbl_80250B80.unk1A == 0)
    {
        arg1->unk0 = temp_r5->pos;
        arg1->unkC = temp_r5->unk28;
        arg1->unkE = temp_r5->unk2A;
        arg1->unk10 = temp_r5->unk2C;
        return;
    }
    if (arg0 < 0.0f)
        arg0 = 0.0f;
    else if (lbl_80250B80.unk1A <= arg0)
        arg0 = lbl_80250B80.unk1A;

    temp_r29 = arg0;
    temp_f2 = temp_r29;
    temp_f31 = arg0 - temp_f2;
    temp_f30 = 1.0 - temp_f31;
    func_8004BC1C(temp_r29, &sp64);
    func_8004BC1C(temp_r29 + 1, &sp44);

    sp24.unk0.x = (sp64.unk0.x * temp_f30) + (sp44.unk0.x * temp_f31);
    sp24.unk0.y = (sp64.unk0.y * temp_f30) + (sp44.unk0.y * temp_f31);
    sp24.unk0.z = (sp64.unk0.z * temp_f30) + (sp44.unk0.z * temp_f31);
    sp24.unkC  = (sp64.unkC * temp_f30) + (sp44.unkC * temp_f31);
    sp24.unkE  = (sp64.unkE * temp_f30) + (sp44.unkE * temp_f31);
    sp24.unk10 = (sp64.unk10 * temp_f30) + (sp44.unk10 * temp_f31);
    sp18.x = (sp64.unk12 * temp_f30) + (sp44.unk12 * temp_f31);
    sp18.y = (sp64.unk14 * temp_f30) + (sp44.unk14 * temp_f31);
    sp18.z = (sp64.unk16 * temp_f30) + (sp44.unk16 * temp_f31);
    mathutil_vec_set_len(&sp18, &sp18, 32767.0f);
    sp24.unk12 = sp18.x;
    sp24.unk14 = sp18.y;
    sp24.unk16 = sp18.z;
    sp24.unk18 = sp64.unk18;
    sp24.unk1C = (sp64.unk1C * temp_f30) + (sp44.unk1C * temp_f31);
    *arg1 = sp24;
}

void func_8004BC1C(int arg0, struct Struct800496BC *arg1)
{
    struct Struct800496BC sp10;
    u8 *var_r9;
    u8 *var_r10;
    u8 *var_r11;
    u8 *var_r12;
    u8 *var_r31;
    u8 *var_r30;
    int i;

    arg0 = lbl_80250B80.unk1A - 1 - arg0;
    if (arg0 < 0)
        arg0 = 0;
    sp10.unk0 = lbl_80250B80.unk38;
    var_r9 = lbl_80250B80.unk44[0];
    var_r10 = lbl_80250B80.unk44[2];
    var_r11 = lbl_80250B80.unk44[4];
    var_r12 = lbl_80250B80.unk44[1];
    var_r31 = lbl_80250B80.unk44[3];
    var_r30 = lbl_80250B80.unk44[5];
    for (i = arg0 + 1; i > 0 ; i--)
    {
        sp10.unk0.x += 0.00006103702f * (s16)((*var_r12 << 8) | *var_r9);
        var_r12++;
        var_r9++;

        sp10.unk0.y += 0.00006103702f * (s16)((*var_r31 << 8) | *var_r10);
        var_r31++;
        var_r10++;

        sp10.unk0.z += 0.00006103702f * (s16)((*var_r30 << 8) | *var_r11);
        var_r30++;
        var_r11++;
    }

    sp10.unkC = lbl_80250B80.unk44[6][arg0] | (lbl_80250B80.unk44[7][arg0] << 8);
    sp10.unkE = lbl_80250B80.unk44[8][arg0] | (lbl_80250B80.unk44[9][arg0] << 8);
    sp10.unk10 = lbl_80250B80.unk44[10][arg0] | (lbl_80250B80.unk44[11][arg0] << 8);
    sp10.unk12 = (s8)lbl_80250B80.unk44[12][arg0] << 8;
    sp10.unk14 = (s8)lbl_80250B80.unk44[13][arg0] << 8;
    sp10.unk16 = (s8)lbl_80250B80.unk44[14][arg0] << 8;
    sp10.unk18 = (lbl_80250B80.unk44[19][arg0] << 24)
               | (lbl_80250B80.unk44[18][arg0] << 16)
               | (lbl_80250B80.unk44[17][arg0] << 8)
               | lbl_80250B80.unk44[16][arg0];
    sp10.unk1C = 0.007874016f * (f32) (s8) lbl_80250B80.unk44[15][arg0];

    *arg1 = sp10;
}

void func_8004BFCC(float arg8, struct Struct8020AE40_sub2 *arg0)
{
    struct Struct8020AE40_sub2 sp20;
    struct Struct8020AE40_sub2 sp1C;
    struct Struct8020AE40_sub2 sp18;
    float temp_f2;
    float temp_f31;
    float temp_f30;
    s32 temp_r29;
    struct World *temp_r5;
    u8 unused[4];

    temp_r5 = currentWorldStructPtr;
    if (lbl_80250B80.unk1A == 0)
    {
        arg0->unk0 = temp_r5->xrot;
        arg0->unk2 = temp_r5->zrot;
        return;
    }
    if (arg8 < 0.0f)
        arg8 = 0.0f;
    else if (lbl_80250B80.unk1A <= arg8)
        arg8 = lbl_80250B80.unk1A;

    temp_r29 = arg8;
    temp_f2 = temp_r29;
    temp_f31 = arg8 - temp_f2;
    temp_f30 = 1.0 - temp_f31;
    func_8004C180(temp_r29, &sp20);
    func_8004C180(temp_r29 + 1, &sp1C);
    sp18.unk0 = (sp20.unk0 * temp_f30) + (sp1C.unk0 * temp_f31);
    sp18.unk2 = (sp20.unk2 * temp_f30) + (sp1C.unk2 * temp_f31);
    *arg0 = sp18;
}

void func_8004C180(int arg0, struct Struct8020AE40_sub2 *arg1)
{
    struct Struct8020AE40_sub2 sp10;

    arg0 = lbl_80250B80.unk1A - 1 - arg0;
    if (arg0 < 0)
        arg0 = 0;
    sp10.unk0 = lbl_80250B80.unk44[20][arg0] | (lbl_80250B80.unk44[21][arg0] << 8);
    sp10.unk2 = lbl_80250B80.unk44[22][arg0] | (lbl_80250B80.unk44[23][arg0] << 8);
    *arg1 = sp10;
}

float func_8004C1D8(float arg0)
{
    float var_f1;
    s16 temp_r0;

    var_f1 = arg0 + (lbl_80250B80.unk18 - lbl_80250B80.unk1A);
    if (lbl_80250B80.unk0.flags & 1)
    {
        if (var_f1 < lbl_80250B80.unk1C)
            var_f1 = lbl_80250B80.unk1C;
    }
    return var_f1;
}

float func_8004C254(float arg0)
{
    return lbl_80250B80.unk22 - arg0;
}

void func_8004C28C(struct ReplayInfo *arg0)
{
    *arg0 = lbl_80250B80.unk0;
}

#pragma force_active on
int func_8004C2C8(void)
{
    return lbl_80250B80.unk1C;
}
#pragma force_active reset

struct Struct8004C2D8
{
    u16 unk0;
    u16 unk2;
    u32 unk4;
};

u32 func_8004C2D8(u8 *arg0, u8 *arg1, u32 arg2)
{
    u32 r5;
    u8 r6;
    u8 *r7;
    u8 *r8;
    int r9;
    int r10;
    int i;
    u32 r31;

    r31 = 8;
    r6 = arg0[0];
    r7 = arg1 + 8;
    if (arg1 != NULL)
        r7[1] = r6;
    r5 = 1;
    if (r6 == arg0[1])
        r9 = 1;
    else
        r9 = 0;
    r10 = 0;
    r8 = arg0 + 1;
    for (i = arg2 - 1; i > 0; i--, r8++)
    {
        if (r9)
        {
            if (*r8 == r6 && r5 < 0x7F)
            {
                r5++;
                continue;
            }
            if (arg1 != NULL)
                *r7 = r5 | 0x80;
            r31 += 2;
            r7 += 2;
            if (r31 >= arg2)
            {
                r10 = 1;
                break;
            }
            r6 = *r8;
            if (arg1 != 0)
                r7[1] = r6;
            r5 = 1;
            if (r6 != r8[1])
                r9 = 0;
        }
        else if (*r8 == r6 || r5 == 0x7F)
        {
            if (arg1 != NULL)
                *r7 = r5;
            r31 = r5 + r31;
            r31++;
#ifdef NONMATCHING
            r7 += r5;
#else
            r7 = (u8 *)r5 + (uintptr_t)r7;
#endif
            r7++;
            if (r31 >= arg2)
            {
                r10 = 1;
                break;
            }
            r6 = *r8;
            if (arg1 != NULL)
                r7[1] = r6;
            r5 = 1;
            if (r6 == r8[1])
                r9 = 1;
        }
        else
        {
            r5++;
            if (r31 + (r5 + 1) >= arg2)
            {
                r10 = 1;
                break;
            }
            r6 = *r8;
            if (arg1 != NULL)
                r7[r5] = *r8;
        }
    }

    if (r10 == 0)
    {
        if (r9 != 0)
        {
            if (arg1 != NULL)
                *r7 = r5 | 0x80;
            r31 += 2;
            if (r31 >= arg2)
                r10 = 1;
        }
        else
        {
            if (arg1 != NULL)
                *r7 = r5;
            r31 = r5 + r31;
            r31++;
            if (r31 >= arg2)
                r10 = 1;
        }
    }

    if (r10 == 0)
    {
        struct Struct8004C2D8 sp1C;

        sp1C.unk0 = 0;
        sp1C.unk2 = 0;
        sp1C.unk4 = arg2;
        if (arg1 != NULL)
            memcpy(arg1, &sp1C, sizeof(sp1C));
    }
    else
    {
        struct Struct8004C2D8 sp14;

        sp14.unk0 = 0;
        sp14.unk2 = 1;
        r31 = arg2 + 8;
        sp14.unk4 = arg2;
        if (arg1 != NULL)
        {
            memcpy(arg1, &sp14, sizeof(sp14));
            memcpy(arg1 + sizeof(sp14), arg0, arg2);
        }
    }
    return r31;
}

int func_8004C548(u8 *arg0, u8 *arg1, u32 arg2)
{
    struct Struct8004C2D8 sp14;
    u32 var_r3;
    int var_r5;
    u8 *var_r4;
    u8 *var_r6;
    u8 temp_r0;

    memcpy(&sp14, arg0, 8);
    if (sp14.unk0 != 0)
        return 0;
    if (sp14.unk4 > arg2)
        return 0;
    if (sp14.unk2 & 1)
    {
        memcpy(arg1, arg0 + 8, sp14.unk4);
        return 1;
    }

    var_r4 = arg1;
    var_r6 = arg0 + 8;
    var_r5 = sp14.unk4;
    while (var_r5 != 0)
    {
        temp_r0 = *var_r6 & 0x80;
        var_r3 = *var_r6 & 0x7F;
        var_r6++;
        if (temp_r0)
        {
            temp_r0 = *var_r6;
            while (var_r3 != 0 && var_r5 > 0)
            {
                *var_r4 = temp_r0;
                var_r3--;
                var_r4++;
                var_r5--;
            }
            var_r6++;
        }
        else
        {
            while (var_r3 != 0 && var_r5 > 0)
            {
                *var_r4 = *var_r6;
                var_r3--;
                var_r4++;
                var_r5--;
                var_r6++;
            }
        }
    }
    return 1;
}

u32 func_8004C668(void)
{
    return func_8004C2D8((void *)&lbl_80250B80, NULL, sizeof(lbl_80250B80));
}

u32 func_8004C69C(void *arg0)
{
    if (arg0 == NULL)
        return 0;
    return func_8004C2D8((void *)&lbl_80250B80, arg0, sizeof(lbl_80250B80));
}

int func_8004C6DC(void *arg0)
{
    return func_8004C548(arg0, (void *)&lbl_80250B80, sizeof(lbl_80250B80));
}

int func_8004C70C_sub(void)
{
    return (lbl_80250B70.unk0 == 0 && lbl_80250B80.unk1A != 0);
}

int func_8004C70C(void)
{
    return (func_8004C70C_sub() && lbl_80250B80.unk0.unk10 >= 0);
}

void func_8004C754(void)
{
    memset(&lbl_802F1F88, 0, sizeof(lbl_802F1F88));
}

void func_8004C780(void)
{
    lbl_802F1F88.unk0--;
    if (lbl_802F1F88.unk0 <= 0)
        lbl_802F1F88.unk2 = 0;
}

void func_8004C7A8(void)
{
    memset(&lbl_802F1F88, 0, sizeof(lbl_802F1F88));
}
