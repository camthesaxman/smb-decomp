#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "course.h"
#include "event.h"
#include "info.h"
#include "input.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "pool.h"
#include "recplay.h"
#include "stage.h"
#include "world.h"

struct BuiltinReplay
{
    struct ReplayHeader header;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 goalEntered;
    s16 unk20;
    Vec unk24;
    s32 unk30;
    s16 unk34;
    s16 unk36;
    struct ReplayBallFrame ballFrames[720];
    struct ReplayWorldFrame worldFrames[720];
};

struct Struct8020AE20
{
    s16 unk0;
    s16 unk2;
};

static struct Struct8020AE20 lbl_8020AE20[8];
static struct BuiltinReplay s_builtinReplays[11];
static u32 s_dummyVar;
static s32 s_builtinReplayFilesCount;
static char **s_builtinReplayFileNames;
static s32 lbl_802F1F74;
static u32 s_totalSize = sizeof(s_builtinReplays);

static struct
{
    s32 replayId;
    u32 unk4;
} lbl_802F1F78;

void func_8004A820(void);
void func_8004A874(void);
void func_8004AA18(void);
float func_8004ABD8(void);
void func_8004ABE4(void);
void func_8004AC68(struct BuiltinReplay *);
void func_8004ACF0(struct BuiltinReplay *);
int func_8004AD78(struct BuiltinReplay *);
float func_8004ADC0(struct BuiltinReplay *);
int func_8004AEA0(void);
static int dummy_return_true(struct BuiltinReplay *);

void recplay_init(void)
{
    int i;
    int bufLen;
    char **pFileName;
    struct BuiltinReplay *replay;
    int temp_r3;
    int nItems;
    char *buffer;
    DVDFileInfo file;
    DVDDir dir;
    DVDDirEntry dirent;

    if (s_totalSize != 0)
    {
        DVDChangeDir("recdata");
        if (DVDOpen("recdata.bin", &file))
        {
            size_t size = MIN(file.length, sizeof(s_builtinReplays));
            u_read_dvd_file(&file, s_builtinReplays, OSRoundUp32B(size), 0);
            DVDClose(&file);
        }
        DVDChangeDir("/test");

        s_dummyVar = sizeof(struct BuiltinReplay);

        if (!(dipSwitches & DIP_DEBUG))
        {
            replay = s_builtinReplays;
            for (i = ARRAY_COUNT(s_builtinReplays); i > 0; i--, replay++)
            {
                if (!dummy_return_true(replay))
                    memset(replay, 0, sizeof(*replay));  // never happens
            }
        }

        temp_r3 = func_8004AEA0();
        if (temp_r3 >= 0)
        {
            replay = &s_builtinReplays[temp_r3];
            memcpy(&s_builtinReplays[6], replay, sizeof(s_builtinReplays[6]));
            memset(replay, 0, sizeof(*replay));
        }
        func_8004ABE4();

        lbl_8020AE20[0].unk0 = 0;
        lbl_8020AE20[0].unk2 = 0;
        lbl_8020AE20[1].unk0 = 0;
        lbl_8020AE20[1].unk2 = 0;
        lbl_8020AE20[2].unk0 = 0;
        lbl_8020AE20[2].unk2 = 0;
        lbl_8020AE20[3].unk0 = 0;
        lbl_8020AE20[3].unk2 = 0;

        if (DVDOpenDir("recdata", &dir) != 0)
        {
            // Scan for built-in replay files
            nItems = 0;
            bufLen = 0;
            while (DVDReadDir(&dir, &dirent) != 0)
            {
                if (!dirent.isDir)
                {
                    nItems++;
                    bufLen += strlen(dirent.name) + 1;
                }
            }
            s_builtinReplayFilesCount = nItems;
            buffer = OSAlloc(OSRoundUp32B(bufLen));
            s_builtinReplayFileNames = OSAlloc(OSRoundUp32B(nItems * sizeof(*s_builtinReplayFileNames)));

            // Get names of all built-in replay files
            dir.location = dir.entryNum + 1;
            pFileName = s_builtinReplayFileNames;
            while (DVDReadDir(&dir, &dirent) != 0)
            {
                if (!dirent.isDir)
                {
                    strcpy(buffer, dirent.name);
                    *pFileName++ = buffer;
                    buffer += strlen(dirent.name) + 1;
                }
            }
            DVDCloseDir(&dir);
        }
        func_8004AFC0();
    }
}

void u_load_random_builtin_replay(void)
{
    struct BuiltinReplay *temp_r30;
    int temp_r3_3;
    u32 temp_r28;
    int var_r29;
    struct BuiltinReplay *var_r28;
    struct BuiltinReplay *temp_r3_2;
    u32 fileSize;
    DVDFileInfo file;
    int i;

    if (s_builtinReplayFileNames == NULL || s_builtinReplayFilesCount == 0)
        return;

    var_r29 = (rand() & 0x7FFF) % 6 + 1;
    DVDChangeDir("recdata");
    if (DVDOpen(s_builtinReplayFileNames[(rand() & 0x7FFF) % s_builtinReplayFilesCount], &file))
    {
        fileSize = MIN(file.length, var_r29 * sizeof(struct BuiltinReplay));
        fileSize = OSRoundUp32B(fileSize);
        temp_r3_2 = OSAllocFromHeap(__OSCurrHeap, fileSize);
        if (temp_r3_2 != NULL)
        {
            u_read_dvd_file(&file, temp_r3_2, fileSize, 0);
            var_r28 = temp_r3_2;

            for (; var_r29 > 0; var_r29--, var_r28++)
            {
                if (var_r28->header.unkC != 0.0 && var_r28->header.stageId != 0)
                {
                    temp_r30 = &s_builtinReplays[func_80048E78()];
                    func_8004ACF0(temp_r30);
                    memcpy(temp_r30, var_r28, sizeof(*temp_r30));
                    func_8004AC68(temp_r30);
                }
            }
            OSFree(temp_r3_2);
            temp_r3_3 = func_8004AEA0();
            if (temp_r3_3 >= 0)
            {
                temp_r30 = &s_builtinReplays[temp_r3_3];
                memcpy(&s_builtinReplays[6], temp_r30, sizeof(s_builtinReplays[6]));
                memset(temp_r30, 0, sizeof(*temp_r30));
            }
        }

        DVDClose(&file);

    }

    DVDChangeDir("/test");
    temp_r30 = s_builtinReplays;
    for (i = 11; i > 0; i--, temp_r30++)
        temp_r30->header.unkC *= 0.92f;
}

void func_80048BD4(void)
{
    int i;
    struct BuiltinReplay *replay;

    replay = s_builtinReplays;
    for (i = 11; i > 0; i--, replay++)
    {
        if (replay->header.flags & 0x8000)
            replay->header.flags &= ~0x8000;
        if (!(dipSwitches & DIP_DEBUG))
            replay->header.unkC *= 0.92f;
    }
    dummy_8004AFD0();
}

void ev_recplay_init(void)
{
    lbl_802F1F74 = 0;
    dummy_8004AFD4();
}

void ev_recplay_main(void)
{
    struct Ball *ball;
    int i;
    struct Struct8020AE20 *var_r28;

    if (gamePauseStatus & 0xA)
        return;

    if (lbl_802F1F74 > 0)
    {
        lbl_802F1F74--;
        if (lbl_802F1F74 == 0)
            func_80049158();
    }

    var_r28 = lbl_8020AE20;
    ball = ballInfo;
    for (i = 4; i > 0; i--, var_r28++, ball++)
    {
        modeCtrl.gameType;  // needed to match

        if ((s16)(int)var_r28->unk2 != 0)
        {
            struct BuiltinReplay *replay;
            int var_r6;
            struct ReplayBallFrame *temp_r5;
            struct ReplayWorldFrame *temp_r7;

            replay = &s_builtinReplays[var_r28->unk0];
            var_r6 = replay->unk34;

            temp_r5 = &replay->ballFrames[var_r6];
            temp_r5->pos = ball->pos;
            temp_r5->rotX = ball->rotX;
            temp_r5->rotY = ball->rotY;
            temp_r5->rotZ = ball->rotZ;
            temp_r5->unk12 = (32767.0f * ball->unk114.x);
            temp_r5->unk14 = (32767.0f * ball->unk114.y);
            temp_r5->unk16 = (32767.0f * ball->unk114.z);
            temp_r5->unk18 = ball->flags;
            temp_r5->unk1C = ball->unk130;

            temp_r7 = &replay->worldFrames[var_r6];
            temp_r7->rotX = currentWorldStructPtr->xrot;
            temp_r7->rotZ = currentWorldStructPtr->zrot;

            replay->unk1A++;
            replay->unk30 = lbl_80206DEC.unk0;
            if (++var_r6 > 0x2CF)
                var_r6 -= 0x2D0;
            replay->unk34 = var_r6;
            if (replay->unk36 < 0x2D0)
                replay->unk36++;
            func_8004AA18();
        }
    }
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL
     || modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
        u_serialize_some_replay_data();
}

void ev_recplay_dest(void)
{
    if (lbl_802F1F74 > 0)
    {
        func_80049158();
        lbl_802F1F74 = 0;
    }
    func_8004B334();
}

int func_80048E78(void)
{
    float var_f29;
    int var_r31;
    struct BuiltinReplay *replay;
    int var_r29;

    replay = s_builtinReplays;
    var_r29 = 0;
    var_f29 = replay->header.unkC;
    for (var_r31 = 6; var_r31 > 0; var_r31--, replay++)
    {
        float temp_f30 = replay->header.unkC;

        if (temp_f30 == 0.0)
        {
            var_r29 = 6 - var_r31;
            break;
        }
        else
        {
            float temp_f0 = temp_f30 * func_8004ADC0(replay);

            if (temp_f0 < var_f29)
            {
                var_r29 = 6 - var_r31;
                var_f29 = temp_f0;
            }
        }
    }
    return var_r29;
}

void func_80048F20(void)
{
    struct Struct8020AE20 *ptr;
    int i;

    func_80049158();
    ptr = lbl_8020AE20;
    for (i = 0; i < 4; i++, ptr++)
        ptr->unk0 = -1;
}

void func_80048F58(int arg0, int arg1)
{
    lbl_8020AE20[arg0].unk0 = arg1;
}

void func_80048F74(void)
{
    int i;
    struct BuiltinReplay *replay;
    struct Struct8020AE20 *var_r19;
    int isPractice = (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE);

    var_r19 = lbl_8020AE20;
    for (i = 4; i > 0; i--, var_r19++)
    {
        if (var_r19->unk0 >= 0)
        {
            replay = &s_builtinReplays[var_r19->unk0];
            if (replay->header.floorNum != 0)
                func_8004ACF0(replay);
            replay->unk34 = 0;
            replay->unk36 = 0;
            replay->unk18 = infoWork.timerCurr;
            replay->unk1A = 0;
            replay->header.flags = 0x8000;
            replay->header.stageId = currStageId;
            if (!isPractice)
            {
                replay->header.difficulty = modeCtrl.difficulty;
                replay->header.floorNum = infoWork.currFloor;
            }
            else
            {
                replay->header.difficulty = lbl_8027CE24[0].unk2;
                replay->header.floorNum = lbl_8027CE24[0].unk0;
            }
            replay->header.character = playerCharacterSelection[4 - i];
            replay->header.playerName[0] = 0;
            replay->unk30 = lbl_80206DEC.unk0;
            if (infoWork.flags & INFO_FLAG_BONUS_STAGE)
                replay->header.flags |= REPLAY_FLAG_BONUS_STAGE;
            if (!isPractice)
            {
                if (modeCtrl.courseFlags & COURSE_FLAG_EXTRA)
                    replay->header.flags |= REPLAY_FLAG_EXTRA;
                if (modeCtrl.courseFlags & COURSE_FLAG_MASTER)
                    replay->header.flags |= REPLAY_FLAG_MASTER;
            }
            else
            {
                if (lbl_8027CE24[0].unk4 & COURSE_FLAG_EXTRA)
                    replay->header.flags |= REPLAY_FLAG_EXTRA;
                if (lbl_8027CE24[0].unk4 & COURSE_FLAG_MASTER)
                    replay->header.flags |= REPLAY_FLAG_MASTER;
            }
            func_8004AC68(replay);
            var_r19->unk2 = 1;
            func_8004A820();
        }
    }
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL
     || modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
        func_8004B354();
}

void func_80049158(void)
{
    int var_r29;
    struct Struct8020AE20 *var_r28;
    struct BuiltinReplay *replay;

    lbl_802F1F74 = 0;
    var_r28 = lbl_8020AE20;
    for (var_r29 = 4; var_r29 > 0; var_r29--, var_r28++)
    {
        if (var_r28->unk0 >= 0)
        {
            if (var_r28->unk2 == 1)
            {
                replay = &s_builtinReplays[var_r28->unk0];
                if (replay->unk1A < 720)
                    replay->header.flags |= REPLAY_FLAG_4;
                else
                    replay->header.flags &= ~REPLAY_FLAG_4;
                func_8004A874();
                replay->header.unkC = func_8004ABD8();
            }
            var_r28->unk2 = 0;
        }
    }

    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL
     || modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE)
        func_8004B540();
}

void func_8004923C(int arg0)
{
    lbl_802F1F74 = arg0;
    if (arg0 == 0)
        func_80049158();
}

void func_80049268(int arg0)
{
    struct Struct8020AE20 *temp_r3;
    struct BuiltinReplay *replay;

    temp_r3 = &lbl_8020AE20[arg0];
    if (temp_r3->unk2 == 1)
    {
        replay = &s_builtinReplays[temp_r3->unk0];
        replay->header.flags |= REPLAY_FLAG_WIN;
        replay->unk1C = infoWork.unk1C;
        replay->unk24 = infoWork.unk10;
        replay->goalEntered = infoWork.goalEntered;
        replay->unk20 = infoWork.unkE;
        func_8004B550();
    }
}

void func_800492FC(int arg0)
{
    struct Struct8020AE20 *temp_r3;
    struct BuiltinReplay *replay;

    temp_r3 = &lbl_8020AE20[arg0];
    if (temp_r3->unk2 == 1)
    {
        replay = &s_builtinReplays[temp_r3->unk0];
        replay->header.flags |= REPLAY_FLAG_FALLOUT;
        replay->unk1C = infoWork.timerCurr;
        func_8004B5AC();
    }
}

void func_80049368(int arg0)
{
    struct Struct8020AE20 *temp_r3;
    struct BuiltinReplay *replay;

    temp_r3 = &lbl_8020AE20[arg0];
    if (temp_r3->unk2 == 1)
    {
        replay = &s_builtinReplays[temp_r3->unk0];
        replay->header.flags |= REPLAY_FLAG_TIME_OVER;
        func_8004B60C();
    }
}

void func_800493C4(int arg0)
{
    struct Struct8020AE20 *temp_r3;
    struct BuiltinReplay *replay;

    temp_r3 = &lbl_8020AE20[arg0];
    if (temp_r3->unk2 == 1)
    {
        replay = &s_builtinReplays[temp_r3->unk0];
        replay->header.flags |= REPLAY_FLAG_7;
        replay->unk1C = infoWork.timerCurr;
        func_8004B694();
    }
}

void func_80049430(char *playerName)
{
    int hasSymbol;
    volatile char *symbols;
    char *p;
    int i;
    struct BuiltinReplay *replay;

    hasSymbol = 0;
    for (p = playerName; *p != 0; p++)
    {
        for (symbols = "#$%@^"; *symbols != 0; symbols++)
        {
            if (*symbols == *p)
            {
                hasSymbol = 1;
                playerName = "";
                break;
            }
        }

        if (hasSymbol)
            break;
    }

    replay = s_builtinReplays;
    for (i = 11; i > 0; i--, replay++)
    {
        if (replay->header.flags & REPLAY_FLAG_15)
        {
            strncpy(replay->header.playerName, playerName, 4);
            replay->header.playerName[3] = 0;
        }
    }
    set_replay_player_name(playerName);
}

void func_80049514(int replayId)
{
    struct BuiltinReplay *replay;

    if (replayId == 11)
    {
        func_8004B70C();
        return;
    }
    replay = &s_builtinReplays[replayId];
    infoWork.timerMax = replay->unk18;
    infoWork.timerCurr = replay->unk18;
    infoWork.flags &= ~(INFO_FLAG_GOAL|INFO_FLAG_TIMEOVER|INFO_FLAG_FALLOUT|INFO_FLAG_05|INFO_FLAG_BONUS_STAGE|INFO_FLAG_BONUS_CLEAR|INFO_FLAG_10);
    infoWork.currFloor = replay->header.floorNum;
    if (replay->header.flags & REPLAY_FLAG_WIN)
    {
        infoWork.flags |= INFO_FLAG_TIMER_PAUSED|INFO_FLAG_05;
        infoWork.timerCurr = replay->unk1C;
        infoWork.unk1C = replay->unk1C;
        infoWork.unk10 = replay->unk24;
        infoWork.goalEntered = replay->goalEntered;
        infoWork.unkE = replay->unk20;
    }
    if (replay->header.flags & REPLAY_FLAG_BONUS_STAGE)
        infoWork.flags |= INFO_FLAG_BONUS_STAGE;
    playerCharacterSelection[0] = replay->header.character;
    modeCtrl.difficulty = replay->header.difficulty;
    modeCtrl.courseFlags &= ~(COURSE_FLAG_EXTRA|COURSE_FLAG_MASTER);
    if (replay->header.flags & REPLAY_FLAG_EXTRA)
        modeCtrl.courseFlags |= COURSE_FLAG_EXTRA;
    if (replay->header.flags & REPLAY_FLAG_MASTER)
        modeCtrl.courseFlags |= COURSE_FLAG_MASTER;
}

float func_8004964C(int replayId)
{
    struct BuiltinReplay *replay;

    if (replayId == 11)
        return func_8004B81C();
    replay = &s_builtinReplays[replayId];
    return ((int)replay->unk36 != 0) ? replay->unk36 - 1 : 0;
}

void func_800496BC(int replayId, struct ReplayBallFrame *arg1, float arg2)
{
    float temp_f30;
    float temp_f31;
    float var_f1;
    int temp_r3;
    int temp_r5;
    s32 var_r3;
    s32 var_r3_2;
    s32 var_r6;
    struct Ball *ball;
    struct BuiltinReplay *replay;
    struct ReplayBallFrame sp64;
    struct ReplayBallFrame sp44;
    struct ReplayBallFrame sp24;
    Point3d sp18;
    u8 unused[4];

    ball = currentBallStructPtr;
    if (replayId == 11)
    {
        func_8004B850(arg2, arg1);
        return;
    }
    replay = &s_builtinReplays[replayId];
    if ((s16)(int)replay->unk36 == 0)
    {
        arg1->pos = ball->pos;
        arg1->rotX = ball->rotX;
        arg1->rotY = ball->rotY;
        arg1->rotZ = ball->rotZ;
        return;
    }
    if (arg2 < 0.0)
    {
        var_r3 = replay->unk34 - 1;
        if (var_r3 < 0)
            var_r3 += 720;
        *arg1 = replay->ballFrames[var_r3];
        return;
    }
    if (replayId == 11)
        var_f1 = func_8004B81C();
    else
        var_f1 = ((s16)replay->unk36 != 0) ? replay->unk36 - 1 : 0;
    if (var_f1 <= arg2)
    {
        int var_r4 = replay->unk34 - replay->unk36;
        while (var_r4 < 0)
            var_r4 += 720;
        *arg1 = replay->ballFrames[var_r4];
        return;
    }

    temp_r5 = arg2;

    temp_f31 = arg2 - temp_r5;
    temp_f30 = 1.0 - temp_f31;

    var_r3_2 = replay->unk34 - 1 - temp_r5;
    if (var_r3_2 < 0)
        var_r3_2 += 720;
    var_r6 = var_r3_2 - 1;
    if (var_r6 < 0)
        var_r6 += 720;

    sp64 = replay->ballFrames[var_r3_2];
    sp44 = replay->ballFrames[var_r6];

    sp24.pos.x = (sp64.pos.x * temp_f30) + (sp44.pos.x * temp_f31);
    sp24.pos.y = (sp64.pos.y * temp_f30) + (sp44.pos.y * temp_f31);
    sp24.pos.z = (sp64.pos.z * temp_f30) + (sp44.pos.z * temp_f31);

    sp24.rotX = sp64.rotX * temp_f30 + sp44.rotX * temp_f31;
    sp24.rotY = sp64.rotY * temp_f30 + sp44.rotY * temp_f31;
    sp24.rotZ = sp64.rotZ * temp_f30 + sp44.rotZ * temp_f31;

    sp18.x = sp64.unk12 * temp_f30 + sp44.unk12 * temp_f31;
    sp18.y = sp64.unk14 * temp_f30 + sp44.unk14 * temp_f31;
    sp18.z = sp64.unk16 * temp_f30 + sp44.unk16 * temp_f31;
    mathutil_vec_set_len(&sp18, &sp18, 32767.0f);

    sp24.unk12 = sp18.x;
    sp24.unk14 = sp18.y;
    sp24.unk16 = sp18.z;
    sp24.unk18 = sp64.unk18;
    sp24.unk1C = sp64.unk1C * temp_f30 + sp44.unk1C * temp_f31;
    *arg1 = sp24;
}

void func_80049C1C(int replayId, struct ReplayWorldFrame *arg1, float arg2)
{
    struct ReplayWorldFrame sp20;
    struct ReplayWorldFrame sp1C;
    struct ReplayWorldFrame sp18;
    float temp_f5;
    float temp_f6;
    float var_f1;
    int temp_r5;
    s32 var_r3;
    s32 var_r3_2;
    s32 var_r5;
    struct BuiltinReplay *replay;
    struct World *world;
    u8 unused[4];

    world = currentWorldStructPtr;
    if (replayId == 11)
    {
        func_8004BFCC(arg2, arg1);
        return;
    }
    replay = &s_builtinReplays[replayId];
    if ((s16)(int)replay->unk36 == 0)
    {
        arg1->rotX = (s16) world->xrot;
        arg1->rotZ = (s16) world->zrot;
        return;
    }
    if (arg2 < 0.0)
    {
        var_r3 = replay->unk34 - 1;
        if (var_r3 < 0)
            var_r3 += 720;
        *arg1 = replay->worldFrames[var_r3];
        return;
    }
    if (replayId == 11)
        var_f1 = func_8004B81C();
    else
        var_f1 = ((s16)replay->unk36 != 0) ? replay->unk36 - 1 : 0;
    if (var_f1 <= arg2)
    {
        int var_r4 = replay->unk34 - replay->unk36;
        while (var_r4 < 0)
            var_r4 += 720;
        *arg1 = replay->worldFrames[var_r4];
        return;
    }

    temp_r5 = arg2;
    temp_f5 = arg2 - temp_r5;
    temp_f6 = 1.0 - temp_f5;

    var_r3_2 = replay->unk34 - 1 - temp_r5;
    if (var_r3_2 < 0)
        var_r3_2 += 720;
    var_r5 = var_r3_2 - 1;
    if (var_r5 < 0)
        var_r5 += 720;

    sp20 = replay->worldFrames[var_r3_2];
    sp1C = replay->worldFrames[var_r5];

    sp18.rotX = sp20.rotX * temp_f6 + sp1C.rotX * temp_f5;
    sp18.rotZ = sp20.rotZ * temp_f6 + sp1C.rotZ * temp_f5;
    *arg1 = sp18;
}

float func_80049E7C(int replayId, float arg1)
{
    float var_f1;
    struct BuiltinReplay *replay;

    if (replayId == 11)
        return func_8004C1D8(arg1);
    replay = &s_builtinReplays[replayId];
    var_f1 = arg1 + (float)(replay->unk18 - replay->unk1A);
    if (replay->header.flags & REPLAY_FLAG_WIN)
    {
        if (var_f1 < replay->unk1C)
            var_f1 = replay->unk1C;
    }
    return var_f1;
}

void get_replay_header(int replayId, struct ReplayHeader *header)
{
    struct BuiltinReplay *replay;

    if (replayId == 11)
    {
        func_8004C28C(header);
        return;
    }
    replay = &s_builtinReplays[replayId];
    *header = replay->header;
}

float func_80049F90(float arg0, int replayId)
{
    struct BuiltinReplay *replay;

    if (replayId == 11)
        return func_8004C254(arg0);
    replay = &s_builtinReplays[replayId];
    return replay->unk30 - arg0;
}

#pragma force_active on
void func_80049FF0(void)
{
    if (gamePauseStatus & 0xA)
        return;

    func_8002FFEC();
    gameSubmodeRequest = SMD_TEST_REPLAY_MAIN;
    event_finish_all();
    func_80044920();
    load_stage(loadingStageIdRequest);
    event_start(EVENT_STAGE);
    event_start(EVENT_WORLD);
    event_start(EVENT_BALL);
    event_start(EVENT_STOBJ);
    event_start(EVENT_INFO);
    event_start(EVENT_ITEM);
    event_start(EVENT_OBJ_COLLISION);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_EFFECT);
    event_start(EVENT_REND_EFC);
    event_start(EVENT_BACKGROUND);
    lbl_80250A68.unk14 = 0;
    lbl_802F1F78.replayId = lbl_80250A68.unk0[lbl_80250A68.unk14];
    lbl_802F1F78.unk4 = 0;
}
#pragma force_active reset

struct Struct80250A68 lbl_80250A68;

static float func_8004A0C8_sub(int a)
{
    if (a == 11)
        return func_8004B81C();
    else
    {
        struct BuiltinReplay *replay = &s_builtinReplays[a];
        return ((s16)replay->unk36 != 0) ? replay->unk36 - 1 : 0;
    }
}

#pragma force_active on
void func_8004A0C8(void)
{
    struct Ball *currBall = currentBallStructPtr;
    struct BuiltinReplay *replay;
    int temp_r0_2;
    struct ReplayHeader header;
    u8 unused[0xC];

    if (gamePauseStatus & 0xA)
        return;

    func_8002FFEC();
    if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_LEFT)
     || ((controllerInfo[0].unk0[0].button & PAD_BUTTON_LEFT) && (controllerInfo[0].unk0[0].button & PAD_TRIGGER_R)))
    {
        if (lbl_802F1F78.replayId > 0)
            lbl_802F1F78.replayId--;
    }
    if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_RIGHT)
     || ((controllerInfo[0].unk0[0].button & PAD_BUTTON_RIGHT) && (controllerInfo[0].unk0[0].button & PAD_TRIGGER_R)))
    {
        if (lbl_802F1F78.replayId < 11)
            lbl_802F1F78.replayId++;
    }

    if (lbl_802F1F78.replayId < 11)
        replay = &s_builtinReplays[lbl_802F1F78.replayId];
    else
        replay = NULL;

    temp_r0_2 = lbl_802F1F78.replayId;
    if (temp_r0_2 == 11)
        func_8004C28C(&header);
    else
        header = s_builtinReplays[temp_r0_2].header;

    u_debug_set_cursor_pos(8, 8);
    u_debug_printf(" REPLAY TEST\n\n");
    if (lbl_802F1F78.replayId != 11)
        u_debug_printf("     ID: %03d\n", lbl_802F1F78.replayId);
    else
    {
        u_debug_set_text_color(1);
        u_debug_printf("     Record for Save\n");
        u_debug_set_text_color(0);
    }

    if (func_8004A0C8_sub(lbl_802F1F78.replayId) == 0.0f)
    {
        u_debug_set_text_color(1);
        u_debug_printf("       :NO DATA\n");
        u_debug_set_text_color(0);
    }
    else
    {
        u_debug_printf("  STAGE: %03d(Lib No.%03d)\n", header.floorNum, header.stageId);
        u_debug_printf(" COURSE: %3d\n", header.difficulty);
        if (controllerInfo[0].unk0[0].button & PAD_BUTTON_Y)
        {
            u_debug_printf("  MONKY: %3d\n", header.character);
            u_debug_printf("   NAME: %s\n", header.playerName);
            u_debug_printf("  GRADE: %f\n", header.unkC);
            if (replay != NULL)
            {
                u_debug_printf("\n");
                u_debug_printf("Same Kind Data Count : %d\n", func_8004AD78(replay));
                u_debug_printf("Adjust Coeff : %f\n", func_8004ADC0(replay));
            }
        }
    }
    if (currBall->state == 4)
        infoWork.flags &= ~(INFO_FLAG_REPLAY|INFO_FLAG_11);

    switch (lbl_802F1F78.unk4)
    {
    case 0:
        if (func_8004A0C8_sub(lbl_802F1F78.replayId) > 0.0)
        {
            if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_A)
             && !(controllerInfo[0].unk0[2].button & PAD_BUTTON_B))
            {
                float var_f1_4;
                int temp_r0_7;

                lbl_80250A68.unk0[lbl_80250A68.unk14] = lbl_802F1F78.replayId;
                currStageId = header.stageId;
                modeCtrl.difficulty = header.difficulty;
                event_finish(EVENT_EFFECT);
                func_80049514(lbl_80250A68.unk0[lbl_80250A68.unk14]);
                infoWork.flags |= INFO_FLAG_REPLAY;
                load_stage(currStageId);
                event_finish(EVENT_STAGE);
                event_finish(EVENT_STOBJ);
                event_finish(EVENT_ITEM);
                event_finish(EVENT_EFFECT);
                event_finish(EVENT_REND_EFC);
                event_finish(EVENT_BACKGROUND);
                event_finish(EVENT_BALL);
                event_start(EVENT_STAGE);
                event_start(EVENT_STOBJ);
                event_start(EVENT_ITEM);
                event_start(EVENT_EFFECT);
                event_start(EVENT_REND_EFC);
                event_start(EVENT_BACKGROUND);
                event_start(EVENT_BALL);
                BALL_FOREACH( ball->state = 9; )
                WORLD_FOREACH( world->state = 6; )
                camera_set_state(0x2C);
                lbl_80250A68.unk10 = func_8004A0C8_sub(lbl_80250A68.unk0[lbl_80250A68.unk14]);
                var_f1_4 = lbl_80250A68.unk10;
                temp_r0_7 = lbl_80250A68.unk0[lbl_80250A68.unk14];
                if (temp_r0_7 == 11)
                    var_f1_4 = func_8004C254(lbl_80250A68.unk10);
                else
                    var_f1_4 = s_builtinReplays[temp_r0_7].unk30 - var_f1_4;
                animate_anim_groups(var_f1_4);
            }
        }
        if (replay != NULL)
        {
            if ((controllerInfo[0].unk0[0].button & PAD_BUTTON_A)
             && (controllerInfo[0].unk0[0].button & PAD_TRIGGER_L))
            {
                BALL_FOREACH( ball->state = 0; )
                WORLD_FOREACH( world->state = 4; )
                if (header.floorNum != 0)
                    func_8004ACF0(replay);
                memset(replay, 0, sizeof(*replay));
            }
        }
        if ((controllerInfo[0].unk0[0].button & PAD_BUTTON_B)
         && (controllerInfo[0].unk0[0].button & PAD_TRIGGER_L))
        {
            lbl_802F1F78.unk4 = 1;
            modeCtrl.submodeTimer = 0;
            return;
        }
        break;
    case 1:
        u_debug_set_cursor_pos(32, 30);
        switch (modeCtrl.submodeTimer)
        {
        case 0:
        case 1:
            u_debug_printf("Converting to C Source format.");
            break;
        case 3:
        case 4:
            u_debug_printf("Please Type [save_recplay] in DDD\n");
            u_debug_printf(" to Make File recplay_data.h.\n");
            break;
        case 5:
            lbl_802F1F78.unk4 = 0;
            break;
        }
        modeCtrl.submodeTimer++;
        break;
    }
}

void func_8004A800(void)
{
    draw_normal_game_scene();
}
#pragma force_active reset

struct
{
    float unk0;
    Vec unk4;
    Vec unk10;
    s32 unk1C;
} lbl_80250A80;

void func_8004A820(void)
{
    lbl_80250A80.unk0 = 0.0f;
    lbl_80250A80.unk4 = currentBallStructPtr->pos;
    lbl_80250A80.unk10 = currentBallStructPtr->vel;
    lbl_80250A80.unk1C = 0;
}

void func_8004A874(void)
{
    float temp_f7;
    float f1;
    float var_f0;
    struct BuiltinReplay *replay;

    replay = &s_builtinReplays[lbl_8020AE20[0].unk0];
    temp_f7 = (float)lbl_80250A80.unk1C / (float)replay->unk1A;
    f1 = replay->unk1A + 1;
    var_f0 = lbl_80250A80.unk0;
    var_f0 *= 1.0 / f1;
    if (replay->header.flags & REPLAY_FLAG_WIN)
    {
        var_f0 *= 2.0;
        var_f0 *= 1.0 + (float)(replay->unk18 - replay->unk1C) / (float)replay->unk18;
        if (replay->header.flags & 0x10)
            var_f0 *= 1.0 + (replay->unk1A - 360.0) / 720.0;
        var_f0 *= 1.0 + 0.5 * (1.0 - temp_f7);
        var_f0 *= 1.0 + 0.25 * (0.02 * replay->header.floorNum);
    }
    if (replay->header.flags & REPLAY_FLAG_FALLOUT)
    {
        var_f0 *= 0.25;
        var_f0 *= temp_f7;
    }
    if (replay->header.flags & REPLAY_FLAG_TIME_OVER)
        var_f0 *= 0.1;
    lbl_80250A80.unk0 = var_f0;
}

#ifdef NONMATCHING
void func_8004AA18(void)
{
    Vec sp2C;
    Vec sp20;
    Vec sp14;
    Vec sp8;
    float f1;
    float var_f31 = 0.0f;
    float temp_f30;
    float temp_f1_3;
    struct Ball *ball;

    ball = currentBallStructPtr;
    sp2C = ball->pos;
    sp20.x = ball->pos.x - lbl_80250A80.unk4.x;
    sp20.y = ball->pos.y - lbl_80250A80.unk4.y;
    sp20.z = ball->pos.z - lbl_80250A80.unk4.z;
    sp14 = sp20;
    temp_f30 = mathutil_vec_len(&sp14);
    sp8 = lbl_80250A80.unk10;
    f1 = mathutil_vec_len(&sp8);
    var_f31 += 2.0 * (temp_f30 - f1);
    temp_f1_3 = sp14.x * sp8.x + sp14.y * sp8.y + sp14.z * sp8.z;
    !temp_f1_3;
    if (temp_f1_3 > 1.1920929e-7f)
        var_f31 += mathutil_sqrt(temp_f1_3) * 1.0;
    if (ball->flags & 1)
        lbl_80250A80.unk1C++;
    lbl_80250A80.unk0 += var_f31;
    lbl_80250A80.unk4 = sp2C;
    lbl_80250A80.unk10 = sp20;
}
#else
asm void func_8004AA18(void)
{
    nofralloc
#include "../asm/nonmatchings/func_8004AA18.s"
}
#pragma peephole on
#endif

float func_8004ABD8(void)
{
    return lbl_80250A80.unk0;
}

s8 lbl_80250AA0[3][61];
s8 lbl_80250B58[3][7];

void func_8004ABE4(void)
{
    s32 i;
    struct BuiltinReplay *replay;

    memset(lbl_80250AA0, 0, sizeof(lbl_80250AA0));
    memset(&lbl_80250B58, 0, sizeof(lbl_80250B58));

    replay = s_builtinReplays;
    for (i = ARRAY_COUNT(s_builtinReplays); i > 0; i--, replay++)
    {
        if (replay->header.floorNum != 0)
            func_8004AC68(replay);
    }
}

void func_8004AC68(struct BuiltinReplay *replay)
{
    s8 *temp_r6 = lbl_80250AA0[replay->header.difficulty];
    int var_r8 = replay->header.floorNum - 1;

    if (replay->header.flags & REPLAY_FLAG_MASTER)
        var_r8 += 60;
    else if (replay->header.flags & REPLAY_FLAG_EXTRA)
        var_r8 += 50;
    temp_r6[var_r8]++;
    lbl_80250B58[replay->header.difficulty][var_r8 / 10]++;
}

void func_8004ACF0(struct BuiltinReplay *replay)
{
    s8 *temp_r6 = lbl_80250AA0[replay->header.difficulty];
    int var_r8 = replay->header.floorNum - 1;

    if (replay->header.flags & REPLAY_FLAG_MASTER)
        var_r8 += 60;
    else if (replay->header.flags & REPLAY_FLAG_EXTRA)
        var_r8 += 50;
    temp_r6[var_r8]--;
    lbl_80250B58[replay->header.difficulty][var_r8 / 10]--;
}

int func_8004AD78(struct BuiltinReplay *replay)
{
    s8 *temp_r6 = lbl_80250AA0[replay->header.difficulty];
    int var_r8 = replay->header.floorNum - 1;

    if (replay->header.flags & REPLAY_FLAG_MASTER)
        var_r8 += 60;
    else if (replay->header.flags & REPLAY_FLAG_EXTRA)
        var_r8 += 50;
    return temp_r6[var_r8];
}

float func_8004ADC0(struct BuiltinReplay *replay)
{
    s8 *temp_r6 = lbl_80250AA0[replay->header.difficulty];
    s8 *ptr = lbl_80250B58[replay->header.difficulty];
    int var_r8 = replay->header.floorNum - 1;
    float f1;

    if (replay->header.flags & REPLAY_FLAG_MASTER)
        var_r8 += 60;
    else if (replay->header.flags & REPLAY_FLAG_EXTRA)
        var_r8 += 50;
    f1 = temp_r6[var_r8] + 0.2 * ptr[var_r8 / 10];
    if (f1 > 0.0)
        return 1.0 / f1;
    else
        return 1.0f;
}

int func_8004AEA0(void)
{
    struct BuiltinReplay *replay;
    int i;
    int var_r3 = -1;
    float var_f1 = -1.0f;

    replay = s_builtinReplays;
    for (i = 6; i > 0; i--, replay++)
    {
        if ((replay->header.flags & REPLAY_FLAG_WIN) && (replay->header.flags & 0x10)
         && replay->header.unkC > var_f1)
        {
            var_r3 = 6 - i;
            var_f1 = replay->header.unkC;
        }
    }
    return var_r3;
}

static int dummy_return_true(struct BuiltinReplay *unused)
{
    return TRUE;
}

static u32 lbl_801B89A0[] =
{
    0x0002136E,
    0x00076675,
    0x00096776,
    0,
};

static u32 lbl_801B89B0[] =
{
    0x00086877,
    0x00094E78,
    0x000B1B79,
    0x000C697A,
    0x000E6B7B,
    0x00136D7C,
    0x0017707D,
    0x0018717E,
    0x001A5F7F,
    0,
};

static u32 lbl_802F0A04[] =
{
    0,
};

#pragma force_active on
void *lbl_801B89D8[] = { lbl_801B89A0, lbl_801B89B0, lbl_802F0A04, NULL };
#pragma force_active reset
