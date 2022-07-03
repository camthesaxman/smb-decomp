#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "course.h"
#include "info.h"
#include "mode.h"
#include "world.h"

struct Struct80250B70
{
    s16 unk0;
    Vec unk4;
} lbl_80250B70;

struct
{
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    char unk6[4];
    u8 fillerA[0x10-0xA];
    s32 unk10;
    u8 filler14[4];
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    s16 unk20;
    s16 unk22;
    Vec unk24;
    u32 unk30;
    u32 unk34;  // 0x44
    Vec unk38;
    u8 unk44[0x18][0xF00];
} lbl_80250B80;  // size = 0x16844

void func_8004B540(void);

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
    lbl_80250B80.unk0 = 0;
    lbl_80250B80.unk2 = currStageId;
    if (!practice)
    {
        lbl_80250B80.unk3 = modeCtrl.difficulty;
        lbl_80250B80.unk4 = infoWork.currFloor;
    }
    else
    {
        lbl_80250B80.unk3 = lbl_8027CE24[0].unk2;
        lbl_80250B80.unk4 = lbl_8027CE24[0].unk0;
    }
    lbl_80250B80.unk5 = playerCharacterSelection[temp_r29->playerId];
    lbl_80250B80.unk6[0] = 0;
    lbl_80250B80.unk22 = lbl_80206DEC.unk0;
    if (infoWork.flags & 0x40)
        lbl_80250B80.unk0 |= 8;
    if (!practice)
    {
        if (modeCtrl.courseFlags & 8)
            lbl_80250B80.unk0 |= 0x20;
        if (modeCtrl.courseFlags & 0x10)
            lbl_80250B80.unk0 |= 0x40;
    }
    else
    {
        if (lbl_8027CE24[0].unk4 & 8)
            lbl_80250B80.unk0 |= 0x20;
        if (lbl_8027CE24[0].unk4 & 0x10)
            lbl_80250B80.unk0 |= 0x40;
    }
    lbl_80250B80.unk10 = -1;
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
        lbl_80250B80.unk0 |= 1;
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
        lbl_80250B80.unk0 |= 2;
        lbl_80250B80.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
        lbl_80250B80.unk1C = infoWork.timerCurr;
    }
}

void func_8004B60C(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        lbl_80250B80.unk0 |= 4;
        lbl_80250B80.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
    }
}

void func_8004B65C(void)
{
    lbl_80250B80.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
}

void func_8004B694(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        lbl_80250B80.unk0 |= 0x80;
        lbl_80250B80.unk1C = infoWork.timerCurr;
    }
}

void func_8004B6C8(char *arg0)
{
    strncpy(lbl_80250B80.unk6, arg0, sizeof(lbl_80250B80.unk6));
    lbl_80250B80.unk6[3] = 0;
}

void func_8004B70C(void)
{
    infoWork.timerMax = lbl_80250B80.unk18;
    infoWork.timerCurr = lbl_80250B80.unk18;
    infoWork.flags &= ~0x667;
    infoWork.currFloor = lbl_80250B80.unk4;
    if (lbl_80250B80.unk0 & 1)
    {
        infoWork.flags |= 0x28;
        infoWork.timerCurr = lbl_80250B80.unk1C;
        infoWork.unk1C = lbl_80250B80.unk1C;
        infoWork.unk10 = lbl_80250B80.unk24;
        infoWork.goalEntered = lbl_80250B80.unk1E;
        infoWork.unkE = lbl_80250B80.unk20;
    }
    if (lbl_80250B80.unk0 & 8)
        infoWork.flags |= 0x40;
    playerCharacterSelection[lbl_80250A68.unk14] = lbl_80250B80.unk5;
    modeCtrl.difficulty = lbl_80250B80.unk3;
    modeCtrl.courseFlags &= 0xFFFFFFE7;
    if (lbl_80250B80.unk0 & 0x20)
        modeCtrl.courseFlags |= 8;
    if (lbl_80250B80.unk0 & 0x40)
        modeCtrl.courseFlags |= 0x10;
}

float func_8004B81C(void)
{
    return lbl_80250B80.unk1A;
}
