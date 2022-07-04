#include <stdint.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "course.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "recplay.h"
#include "world.h"

#define MAX_REPLAY_FRAMES 3840

static struct Struct80250B70
{
    s16 unk0;
    Vec ballPos;
} lbl_80250B70;

static struct
{
    struct ReplayHeader header;
    s16 unk18;
    s16 unk1A;  // framesCount
    s16 unk1C;
    s16 goalEntered;
    s16 unk20;
    s16 unk22;
    Vec unk24;
    u32 unk30;
    u32 currFrameNum;
    Vec unk38;
    u8 data[24][MAX_REPLAY_FRAMES];
} s_replayData;

struct
{
    s16 unk0;
    u16 unk2;
    u8 filler4[4];
} lbl_802F1F88 ATTRIBUTE_ALIGN(8);

int lbl_802F1F80;

void u_deserialize_some_replay_data(int arg0, struct ReplayBallFrame *arg1);
void func_8004C180(int arg0, struct ReplayWorldFrame *arg1);

void func_8004AFC0(void)
{
    lbl_80250B70.unk0 = 0;
}

void dummy_8004AFD0(void) {}

void dummy_8004AFD4(void) {}

void u_serialize_some_replay_data(void)
{
    struct Ball *ball = &ballInfo[modeCtrl.currPlayer];
    struct World *world = &worldInfo[modeCtrl.currPlayer];
    s32 x, y, z;
    int var_r24_2;
    u32 temp;
    u32 temp_2;
    u32 frameNum;
    int var;

    switch (lbl_80250B70.unk0)
    {
    case 1:
        break;
    default:
        return;
    }

    frameNum = s_replayData.currFrameNum;
    if (frameNum <= MAX_REPLAY_FRAMES)
    {
        x = 16383.5f * (ball->pos.x - lbl_80250B70.ballPos.x);
        y = 16383.5f * (ball->pos.y - lbl_80250B70.ballPos.y);
        z = 16383.5f * (ball->pos.z - lbl_80250B70.ballPos.z);
        if (x < -32767)
            x = -32767;
        else if (x > 32767)
            x = 32767;
        if (y < -32767)
            y = -32767;
        else if (y > 32767)
            y = 32767;
        if (z < -32767)
            z = -32767;
        else if (z > 32767)
            z = 32767;

        s_replayData.data[0][frameNum] = x & 0xFF;
        x >>= 8;
        s_replayData.data[1][frameNum] = x & 0xFF;

        s_replayData.data[2][frameNum] = y & 0xFF;
        y >>= 8;
        s_replayData.data[3][frameNum] = y & 0xFF;

        s_replayData.data[4][frameNum] = z & 0xFF;
        z >>= 8;
        s_replayData.data[5][frameNum] = z & 0xFF;

        temp = (u16)ball->rotX;
        s_replayData.data[6][frameNum] = temp & 0xFF;
        temp >>= 8;
        s_replayData.data[7][frameNum] = temp & 0xFF;

        temp = (u16)ball->rotY;
        s_replayData.data[8][frameNum] = temp & 0xFF;
        temp >>= 8;
        s_replayData.data[9][frameNum] = temp & 0xFF;

        temp = (u16)ball->rotZ;
        s_replayData.data[10][frameNum] = temp & 0xFF;
        temp >>= 8;
        s_replayData.data[11][frameNum] = temp & 0xFF;

        s_replayData.data[12][frameNum] = 127.0f * ball->unk114.x;
        s_replayData.data[13][frameNum] = 127.0f * ball->unk114.y;
        s_replayData.data[14][frameNum] = 127.0f * ball->unk114.z;

        var_r24_2 = ball->unk130 * 127.0f;
        !var_r24_2;
        if (var_r24_2 < -127)
            var_r24_2 = -127;
        else if (var_r24_2 > 127)
            var_r24_2 = 127;
        s_replayData.data[15][frameNum] = (s8)var_r24_2;

        temp_2 = ball->flags;
        s_replayData.data[16][frameNum] = temp_2;
        temp_2 >>= 8;
        s_replayData.data[17][frameNum] = temp_2;
        temp_2 >>= 8;
        s_replayData.data[18][frameNum] = temp_2;
        temp_2 >>= 8;
        s_replayData.data[19][frameNum] = temp_2;

        temp_2 = (u16)world->xrot;
        s_replayData.data[20][frameNum] = temp_2;
        temp_2 >>= 8;
        s_replayData.data[21][frameNum] = temp_2;

        temp_2 = (u16)world->zrot;
        s_replayData.data[22][frameNum] = temp_2;
        temp_2 >>= 8;
        s_replayData.data[23][frameNum] = temp_2;

        var = (s_replayData.data[1][frameNum] << 8) | s_replayData.data[0][frameNum];
        lbl_80250B70.ballPos.x += (0.00006103702f * (s16)var);
        var = (s_replayData.data[3][frameNum] << 8) | s_replayData.data[2][frameNum];
        lbl_80250B70.ballPos.y += (0.00006103702f * (s16)var);
        var = (s_replayData.data[5][frameNum] << 8) | s_replayData.data[4][frameNum];
        lbl_80250B70.ballPos.z += (0.00006103702f * (s16)var);

        s_replayData.unk1A++;
        s_replayData.unk22 = lbl_80206DEC.unk0;
        s_replayData.currFrameNum = frameNum + 1;
    }
}

void func_8004B334(void)
{
    func_8004B540();
}

void func_8004B354(void)
{
    struct Ball *ball;
    int practice;

    practice = modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE;
    ball = &ballInfo[modeCtrl.currPlayer];

    lbl_80250B70.ballPos = ball->pos;
    memset(&s_replayData, 0, sizeof(s_replayData));
    s_replayData.unk38 = ball->pos;
    s_replayData.unk30 = 0;
    s_replayData.currFrameNum = 0;
    s_replayData.unk18 = infoWork.timerCurr;
    s_replayData.unk1A = 0;
    s_replayData.header.flags = 0;
    s_replayData.header.stageId = currStageId;
    if (!practice)
    {
        s_replayData.header.difficulty = modeCtrl.difficulty;
        s_replayData.header.floorNum = infoWork.currFloor;
    }
    else
    {
        s_replayData.header.difficulty = lbl_8027CE24[0].unk2;
        s_replayData.header.floorNum = lbl_8027CE24[0].unk0;
    }
    s_replayData.header.character = playerCharacterSelection[ball->playerId];
    s_replayData.header.playerName[0] = 0;
    s_replayData.unk22 = lbl_80206DEC.unk0;
    if (infoWork.flags & INFO_FLAG_BONUS_STAGE)
        s_replayData.header.flags |= REPLAY_FLAG_BONUS_STAGE;
    if (!practice)
    {
        if (modeCtrl.courseFlags & COURSE_FLAG_EXTRA)
            s_replayData.header.flags |= REPLAY_FLAG_EXTRA;
        if (modeCtrl.courseFlags & COURSE_FLAG_MASTER)
            s_replayData.header.flags |= REPLAY_FLAG_MASTER;
    }
    else
    {
        if (lbl_8027CE24[0].unk4 & COURSE_FLAG_EXTRA)
            s_replayData.header.flags |= REPLAY_FLAG_EXTRA;
        if (lbl_8027CE24[0].unk4 & COURSE_FLAG_MASTER)
            s_replayData.header.flags |= REPLAY_FLAG_MASTER;
    }
    s_replayData.header.unk10 = -1;
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
        s_replayData.header.flags |= REPLAY_FLAG_WIN;
        s_replayData.unk1C = infoWork.unk1C;
        s_replayData.unk24 = infoWork.unk10;
        s_replayData.goalEntered = infoWork.goalEntered;
        s_replayData.unk20 = infoWork.unkE;
    }
}

void func_8004B5AC(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        s_replayData.header.flags |= REPLAY_FLAG_FALLOUT;
        s_replayData.header.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
        s_replayData.unk1C = infoWork.timerCurr;
    }
}

void func_8004B60C(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        s_replayData.header.flags |= REPLAY_FLAG_TIME_OVER;
        s_replayData.header.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
    }
}

void func_8004B65C(void)
{
    s_replayData.header.unk10 = ballInfo[modeCtrl.currPlayer].unk7C - lbl_802F1F80;
}

void func_8004B694(void)
{
    if (lbl_80250B70.unk0 == 1)
    {
        s_replayData.header.flags |= 0x80;
        s_replayData.unk1C = infoWork.timerCurr;
    }
}

void set_replay_player_name(char *name)
{
    strncpy(s_replayData.header.playerName, name, sizeof(s_replayData.header.playerName));
    s_replayData.header.playerName[3] = 0;
}

void func_8004B70C(void)
{
    infoWork.timerMax = s_replayData.unk18;
    infoWork.timerCurr = s_replayData.unk18;
    infoWork.flags &= ~0x667;
    infoWork.currFloor = s_replayData.header.floorNum;
    if (s_replayData.header.flags & REPLAY_FLAG_WIN)
    {
        infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_05;
        infoWork.timerCurr = s_replayData.unk1C;
        infoWork.unk1C = s_replayData.unk1C;
        infoWork.unk10 = s_replayData.unk24;
        infoWork.goalEntered = s_replayData.goalEntered;
        infoWork.unkE = s_replayData.unk20;
    }
    if (s_replayData.header.flags & REPLAY_FLAG_BONUS_STAGE)
        infoWork.flags |= INFO_FLAG_BONUS_STAGE;
    playerCharacterSelection[lbl_80250A68.unk14] = s_replayData.header.character;
    modeCtrl.difficulty = s_replayData.header.difficulty;
    modeCtrl.courseFlags &= ~(COURSE_FLAG_EXTRA|COURSE_FLAG_MASTER);
    if (s_replayData.header.flags & REPLAY_FLAG_EXTRA)
        modeCtrl.courseFlags |= COURSE_FLAG_EXTRA;
    if (s_replayData.header.flags & REPLAY_FLAG_MASTER)
        modeCtrl.courseFlags |= COURSE_FLAG_MASTER;
}

float func_8004B81C(void)
{
    return s_replayData.unk1A;
}

void func_8004B850(float arg0, struct ReplayBallFrame *arg1)
{
    struct ReplayBallFrame sp64;
    struct ReplayBallFrame sp44;
    struct ReplayBallFrame sp24;
    Vec sp18;
    float temp_f2;
    float temp_f31;
    float temp_f30;
    int temp_r29;
    struct Ball *ball;
    u8 unused[4];

    ball = currentBallStructPtr;
    if (s_replayData.unk1A == 0)
    {
        arg1->pos = ball->pos;
        arg1->rotX = ball->rotX;
        arg1->rotY = ball->rotY;
        arg1->rotZ = ball->rotZ;
        return;
    }
    if (arg0 < 0.0f)
        arg0 = 0.0f;
    else if (s_replayData.unk1A <= arg0)
        arg0 = s_replayData.unk1A;

    temp_r29 = arg0;
    temp_f2 = temp_r29;
    temp_f31 = arg0 - temp_f2;
    temp_f30 = 1.0 - temp_f31;
    u_deserialize_some_replay_data(temp_r29, &sp64);
    u_deserialize_some_replay_data(temp_r29 + 1, &sp44);

    sp24.pos.x = (sp64.pos.x * temp_f30) + (sp44.pos.x * temp_f31);
    sp24.pos.y = (sp64.pos.y * temp_f30) + (sp44.pos.y * temp_f31);
    sp24.pos.z = (sp64.pos.z * temp_f30) + (sp44.pos.z * temp_f31);
    sp24.rotX = (sp64.rotX * temp_f30) + (sp44.rotX * temp_f31);
    sp24.rotY = (sp64.rotY * temp_f30) + (sp44.rotY * temp_f31);
    sp24.rotZ = (sp64.rotZ * temp_f30) + (sp44.rotZ * temp_f31);
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

void u_deserialize_some_replay_data(int arg0, struct ReplayBallFrame *arg1)
{
    struct ReplayBallFrame sp10;
    u8 *var_r9;
    u8 *var_r10;
    u8 *var_r11;
    u8 *var_r12;
    u8 *var_r31;
    u8 *var_r30;
    int i;

    arg0 = s_replayData.unk1A - 1 - arg0;
    if (arg0 < 0)
        arg0 = 0;
    sp10.pos = s_replayData.unk38;
    var_r9 = s_replayData.data[0];
    var_r10 = s_replayData.data[2];
    var_r11 = s_replayData.data[4];
    var_r12 = s_replayData.data[1];
    var_r31 = s_replayData.data[3];
    var_r30 = s_replayData.data[5];
    for (i = arg0 + 1; i > 0 ; i--)
    {
        sp10.pos.x += 0.00006103702f * (s16)((*var_r12 << 8) | *var_r9);
        var_r12++;
        var_r9++;

        sp10.pos.y += 0.00006103702f * (s16)((*var_r31 << 8) | *var_r10);
        var_r31++;
        var_r10++;

        sp10.pos.z += 0.00006103702f * (s16)((*var_r30 << 8) | *var_r11);
        var_r30++;
        var_r11++;
    }

    sp10.rotX = s_replayData.data[6][arg0] | (s_replayData.data[7][arg0] << 8);
    sp10.rotY = s_replayData.data[8][arg0] | (s_replayData.data[9][arg0] << 8);
    sp10.rotZ = s_replayData.data[10][arg0] | (s_replayData.data[11][arg0] << 8);
    sp10.unk12 = (s8)s_replayData.data[12][arg0] << 8;
    sp10.unk14 = (s8)s_replayData.data[13][arg0] << 8;
    sp10.unk16 = (s8)s_replayData.data[14][arg0] << 8;
    sp10.unk18 = (s_replayData.data[19][arg0] << 24)
               | (s_replayData.data[18][arg0] << 16)
               | (s_replayData.data[17][arg0] << 8)
               | s_replayData.data[16][arg0];
    sp10.unk1C = 0.007874016f * (f32) (s8) s_replayData.data[15][arg0];

    *arg1 = sp10;
}

void func_8004BFCC(float arg8, struct ReplayWorldFrame *arg0)
{
    struct ReplayWorldFrame sp20;
    struct ReplayWorldFrame sp1C;
    struct ReplayWorldFrame sp18;
    float temp_f2;
    float temp_f31;
    float temp_f30;
    s32 temp_r29;
    struct World *world;
    u8 unused[4];

    world = currentWorldStructPtr;
    if (s_replayData.unk1A == 0)
    {
        arg0->rotX = world->xrot;
        arg0->rotZ = world->zrot;
        return;
    }
    if (arg8 < 0.0f)
        arg8 = 0.0f;
    else if (s_replayData.unk1A <= arg8)
        arg8 = s_replayData.unk1A;

    temp_r29 = arg8;
    temp_f2 = temp_r29;
    temp_f31 = arg8 - temp_f2;
    temp_f30 = 1.0 - temp_f31;
    func_8004C180(temp_r29, &sp20);
    func_8004C180(temp_r29 + 1, &sp1C);
    sp18.rotX = (sp20.rotX * temp_f30) + (sp1C.rotX * temp_f31);
    sp18.rotZ = (sp20.rotZ * temp_f30) + (sp1C.rotZ * temp_f31);
    *arg0 = sp18;
}

void func_8004C180(int arg0, struct ReplayWorldFrame *arg1)
{
    struct ReplayWorldFrame sp10;

    arg0 = s_replayData.unk1A - 1 - arg0;
    if (arg0 < 0)
        arg0 = 0;
    sp10.rotX = s_replayData.data[20][arg0] | (s_replayData.data[21][arg0] << 8);
    sp10.rotZ = s_replayData.data[22][arg0] | (s_replayData.data[23][arg0] << 8);
    *arg1 = sp10;
}

float func_8004C1D8(float arg0)
{
    float var_f1;
    s16 temp_r0;

    var_f1 = arg0 + (s_replayData.unk18 - s_replayData.unk1A);
    if (s_replayData.header.flags & REPLAY_FLAG_WIN)
    {
        if (var_f1 < s_replayData.unk1C)
            var_f1 = s_replayData.unk1C;
    }
    return var_f1;
}

float func_8004C254(float arg0)
{
    return s_replayData.unk22 - arg0;
}

void func_8004C28C(struct ReplayHeader *header)
{
    *header = s_replayData.header;
}

#pragma force_active on
int func_8004C2C8(void)
{
    return s_replayData.unk1C;
}
#pragma force_active reset

struct RLEHeader
{
    u16 unk0;
    u16 flags;
    u32 size;
};

#define NO_COMPRESSION 1

static u32 compress_rle(u8 *src, u8 *dest, u32 srcSize)
{
    u32 r5;
    u8 r6;
    u8 *destp;
    u8 *srcp;
    int r9;
    int tooLarge;  // true if the compressed size is larger than the uncompressed size
    int i;
    u32 destPos;

    // skip over header
    destPos = sizeof(struct RLEHeader);
    destp = dest + sizeof(struct RLEHeader);

    r6 = src[0];
    if (dest != NULL)
        destp[1] = r6;
    r5 = 1;
    if (r6 == src[1])
        r9 = 1;
    else
        r9 = 0;
    tooLarge = FALSE;
    srcp = src + 1;
    for (i = srcSize - 1; i > 0; i--, srcp++)
    {
        if (r9)
        {
            if (*srcp == r6 && r5 < 0x7F)
            {
                r5++;
                continue;
            }
            if (dest != NULL)
                *destp = r5 | 0x80;
            destPos += 2;
            destp += 2;
            if (destPos >= srcSize)
            {
                tooLarge = TRUE;
                break;
            }
            r6 = *srcp;
            if (dest != 0)
                destp[1] = r6;
            r5 = 1;
            if (r6 != srcp[1])
                r9 = 0;
        }
        else if (*srcp == r6 || r5 == 0x7F)
        {
            if (dest != NULL)
                *destp = r5;
            destPos = r5 + destPos;
            destPos++;
#ifdef NONMATCHING
            destp += r5;
#else
            destp = (u8 *)r5 + (uintptr_t)destp;
#endif
            destp++;
            if (destPos >= srcSize)
            {
                tooLarge = TRUE;
                break;
            }
            r6 = *srcp;
            if (dest != NULL)
                destp[1] = r6;
            r5 = 1;
            if (r6 == srcp[1])
                r9 = 1;
        }
        else
        {
            r5++;
            if (destPos + (r5 + 1) >= srcSize)
            {
                tooLarge = TRUE;
                break;
            }
            r6 = *srcp;
            if (dest != NULL)
                destp[r5] = *srcp;
        }
    }

    if (!tooLarge)
    {
        if (r9 != 0)
        {
            if (dest != NULL)
                *destp = r5 | 0x80;
            destPos += 2;
            if (destPos >= srcSize)
                tooLarge = 1;
        }
        else
        {
            if (dest != NULL)
                *destp = r5;
            destPos = r5 + destPos;
            destPos++;
            if (destPos >= srcSize)
                tooLarge = 1;
        }
    }

    if (!tooLarge)
    {
        struct RLEHeader header;

        header.unk0 = 0;
        header.flags = 0;
        header.size = srcSize;
        if (dest != NULL)
            memcpy(dest, &header, sizeof(header));
    }
    else
    {
        struct RLEHeader header;

        header.unk0 = 0;
        header.flags = NO_COMPRESSION;
        destPos = srcSize + sizeof(struct RLEHeader);
        header.size = srcSize;
        if (dest != NULL)
        {
            memcpy(dest, &header, sizeof(header));
            memcpy(dest + sizeof(header), src, srcSize);
        }
    }
    return destPos;
}

static int decompress_rle(u8 *src, u8 *dest, u32 destSize)
{
    struct RLEHeader header;
    u32 var_r3;
    int var_r5;
    u8 *destp;
    u8 *srcp;
    u8 temp_r0;

    memcpy(&header, src, sizeof(header));
    if (header.unk0 != 0)
        return FALSE;
    if (header.size > destSize)
        return FALSE;
    if (header.flags & NO_COMPRESSION)
    {
        memcpy(dest, src + sizeof(struct RLEHeader), header.size);
        return TRUE;
    }

    destp = dest;
    srcp = src + sizeof(struct RLEHeader);
    var_r5 = header.size;
    while (var_r5 != 0)
    {
        temp_r0 = *srcp & 0x80;
        var_r3 = *srcp & 0x7F;
        srcp++;
        if (temp_r0)
        {
            // fill
            temp_r0 = *srcp;
            while (var_r3 != 0 && var_r5 > 0)
            {
                *destp = temp_r0;
                var_r3--;
                destp++;
                var_r5--;
            }
            srcp++;
        }
        else
        {
            // copy
            while (var_r3 != 0 && var_r5 > 0)
            {
                *destp = *srcp;
                var_r3--;
                destp++;
                var_r5--;
                srcp++;
            }
        }
    }
    return TRUE;
}

u32 u_calc_compressed_replay_size(void)
{
    return compress_rle((void *)&s_replayData, NULL, sizeof(s_replayData));
}

u32 compress_replay(void *dest)
{
    if (dest == NULL)
        return 0;
    return compress_rle((void *)&s_replayData, dest, sizeof(s_replayData));
}

int decompress_replay(void *arg0)
{
    return decompress_rle(arg0, (void *)&s_replayData, sizeof(s_replayData));
}

int func_8004C70C_sub(void)
{
    return (lbl_80250B70.unk0 == 0 && s_replayData.unk1A != 0);
}

int func_8004C70C(void)
{
    return (func_8004C70C_sub() && s_replayData.header.unk10 >= 0);
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
