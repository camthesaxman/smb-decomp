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
#include "mathutil.h"
#include "mode.h"
#include "pool.h"
#include "stage.h"
#include "world.h"

struct Struct8020AE40
{
    struct ReplayInfo unk0;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    s16 unk20;
    Vec unk24;
    s32 unk30;
    s16 unk34;
    s16 unk36;
    struct Struct800496BC unk38[720];
    struct Struct8020AE40_sub2 unk5A38[720];
};  // size = 0x6578

struct Struct8020AE20
{
    s16 unk0;
    s16 unk2;
};

u32 lbl_802F09E0 = 0x00045C28;

struct Struct8020AE20 lbl_8020AE20[8];
FORCE_BSS_ORDER(lbl_8020AE20)
struct Struct8020AE40 lbl_8020AE40[11];

extern u32 lbl_802F1F68;
extern s32 lbl_802F1F6C;
extern char **lbl_802F1F70;
extern s32 lbl_802F1F74;

extern struct
{
    s32 unk0;
    u32 unk4;
} lbl_802F1F78;

void func_8004A820(void);
void func_8004A874(void);
void func_8004AA18(void);
float func_8004ABD8(void);
void func_8004ABE4(void);
void func_8004AC68(struct Struct8020AE40 *);
void func_8004ACF0(struct Struct8020AE40 *);
int func_8004AD78(struct Struct8020AE40 *);
float func_8004ADC0(struct Struct8020AE40 *);
int func_8004AFB8(struct Struct8020AE40 *);

void func_800487B4(void)
{
    int i;
    int bufLen;
    char **var_r30_3;
    struct Struct8020AE40 *var_r29;
    int temp_r3;
    int nItems;
    char *buffer;
    DVDFileInfo file;
    DVDDir dir;
    DVDDirEntry dirent;

    if (lbl_802F09E0 != 0)
    {
        DVDChangeDir("recdata");
        if (DVDOpen("recdata.bin", &file))
        {
            size_t size = MIN(file.length, sizeof(lbl_8020AE40));
            u_read_dvd_file(&file, lbl_8020AE40, OSRoundUp32B(size), 0);
            DVDClose(&file);
        }
        DVDChangeDir("/test");
        lbl_802F1F68 = 0x6578;
        if (!(dipSwitches & 1))
        {
            var_r29 = lbl_8020AE40;
            for (i = 11; i > 0; i--, var_r29++)
            {
                if (func_8004AFB8(var_r29) == 0)
                    memset(var_r29, 0, sizeof(*var_r29));
            }
        }
        temp_r3 = func_8004AEA0();
        if (temp_r3 >= 0)
        {
            var_r29 = &lbl_8020AE40[temp_r3];
            memcpy(&lbl_8020AE40[6], var_r29, sizeof(lbl_8020AE40[6]));
            memset(var_r29, 0, sizeof(*var_r29));
        }
        func_8004ABE4();

        //for (i = 0; i < 8; i++)
        //    lbl_8020AE20[i] = 0;
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
            lbl_802F1F6C = nItems;
            buffer = OSAlloc(OSRoundUp32B(bufLen));
            lbl_802F1F70 = OSAlloc(OSRoundUp32B(nItems * sizeof(*lbl_802F1F70)));
            dir.location = dir.entryNum + 1;
            var_r30_3 = lbl_802F1F70;
            while (DVDReadDir(&dir, &dirent) != 0)
            {
                if (!dirent.isDir)
                {
                    strcpy(buffer, dirent.name);
                    *var_r30_3++ = buffer;
                    buffer += strlen(dirent.name) + 1;
                }
            }
            DVDCloseDir(&dir);
        }
        func_8004AFC0();
    }
}

void func_800489F8(void)
{
    struct Struct8020AE40 *temp_r30;
    int temp_r3_3;
    u32 temp_r28;
    int var_r29;
    struct Struct8020AE40 *var_r28;
    struct Struct8020AE40 *temp_r3_2;
    u32 var_r3;
    DVDFileInfo file;
    int i;

    if (lbl_802F1F70 == NULL || lbl_802F1F6C == 0)
        return;

    var_r29 = (rand() & 0x7FFF) % 6 + 1;
    DVDChangeDir("recdata");
    if (DVDOpen(lbl_802F1F70[(rand() & 0x7FFF) % lbl_802F1F6C], &file))
    {
        var_r3 = MIN(file.length, var_r29 * sizeof(struct Struct8020AE40));
        var_r3 = OSRoundUp32B(var_r3);
        temp_r3_2 = OSAllocFromHeap(__OSCurrHeap, var_r3);
        if (temp_r3_2 != NULL)
        {
            u_read_dvd_file(&file, temp_r3_2, var_r3, 0);
            var_r28 = temp_r3_2;

            for (; var_r29 > 0; var_r29--, var_r28++)
            {
                if (var_r28->unk0.unkC != 0.0 && var_r28->unk0.stageId != 0)
                {
                    temp_r30 = &lbl_8020AE40[func_80048E78()];
                    func_8004ACF0(temp_r30);
                    memcpy(temp_r30, var_r28, sizeof(*temp_r30));
                    func_8004AC68(temp_r30);
                }
            }
            OSFree(temp_r3_2);
            temp_r3_3 = func_8004AEA0();
            if (temp_r3_3 >= 0)
            {
                temp_r30 = &lbl_8020AE40[temp_r3_3];
                memcpy(&lbl_8020AE40[6], temp_r30, sizeof(lbl_8020AE40[6]));
                memset(temp_r30, 0, sizeof(*temp_r30));
            }
        }

        DVDClose(&file);

    }

    DVDChangeDir("/test");
    temp_r30 = lbl_8020AE40;
    for (i = 11; i > 0; i--, temp_r30++)
        temp_r30->unk0.unkC *= 0.92f;

}

void func_80048BD4(void)
{
    int i;
    struct Struct8020AE40 *var_r5;

    var_r5 = lbl_8020AE40;
    for (i = 11; i > 0; i--, var_r5++)
    {
        if (var_r5->unk0.flags & 0x8000)
            var_r5->unk0.flags &= 0xFFFF7FFF;
        if (!(dipSwitches & DIP_DEBUG))
            var_r5->unk0.unkC *= 0.92f;
    }
    func_8004AFD0();
}

void ev_recplay_init(void)
{
    lbl_802F1F74 = 0;
    func_8004AFD4();
}

#ifdef NONMATCHING
void ev_recplay_main(void)
{
    struct Ball *var_r30;
    int var_r29;
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
    var_r30 = ballInfo;
    for (var_r29 = 4; var_r29 > 0; var_r29--, var_r28++, var_r30++)
    {
        if ((s16)(int)var_r28->unk2 != 0)
        {
            struct Struct8020AE40 *temp_r3_2;
            int var_r6;
            struct Struct800496BC *temp_r5;
            struct Struct8020AE40_sub2 *temp_r7;

            temp_r3_2 = &lbl_8020AE40[var_r28->unk0];
            var_r6 = temp_r3_2->unk34;

            temp_r5 = &temp_r3_2->unk38[var_r6];
            temp_r5->unk0 = var_r30->pos;
            temp_r5->unkC = var_r30->unk28;
            temp_r5->unkE = var_r30->unk2A;
            temp_r5->unk10 = var_r30->unk2C;
            temp_r5->unk12 = (32767.0f * var_r30->unk114.x);
            temp_r5->unk14 = (32767.0f * var_r30->unk114.y);
            temp_r5->unk16 = (32767.0f * var_r30->unk114.z);
            temp_r5->unk18 = var_r30->flags;
            temp_r5->unk1C = var_r30->unk130;

            temp_r7 = &temp_r3_2->unk5A38[var_r6];
            temp_r7->unk0 = currentWorldStructPtr->xrot;
            temp_r7->unk2 = currentWorldStructPtr->zrot;

            temp_r3_2->unk1A++;
            temp_r3_2->unk30 = lbl_80206DEC.unk0;
            if (++var_r6 > 0x2CF)
                var_r6 -= 0x2D0;
            temp_r3_2->unk34 = var_r6;
            if (temp_r3_2->unk36 < 0x2D0)
                temp_r3_2->unk36++;
            func_8004AA18();
        }
    }
    if (modeCtrl.gameType == 0 || modeCtrl.gameType == 2)
        func_8004AFD8();
}
#else
asm void ev_recplay_main(void)
{
    nofralloc
#include "../asm/nonmatchings/ev_recplay_main.s"
}
#pragma peephole on
#endif

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
    struct Struct8020AE40 *var_r30;
    int var_r29;

    var_r30 = lbl_8020AE40;
    var_r29 = 0;
    var_f29 = lbl_8020AE40[0].unk0.unkC;
    for (var_r31 = 6; var_r31 > 0; var_r31--, var_r30++)
    {
        float temp_f30 = var_r30->unk0.unkC;

        if (temp_f30 == 0.0)
        {
            var_r29 = 6 - var_r31;
            break;
        }
        else
        {
            float temp_f0 = temp_f30 * func_8004ADC0(var_r30);

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
    struct Struct8020AE40 *temp_r3_2;
    struct Struct8020AE20 *var_r19;
    int isPractice = (modeCtrl.gameType == GAMETYPE_MAIN_PRACTICE);

    var_r19 = lbl_8020AE20;
    for (i = 4; i > 0; i--, var_r19++)
    {
        if (var_r19->unk0 >= 0)
        {
            temp_r3_2 = &lbl_8020AE40[var_r19->unk0];
            if (temp_r3_2->unk0.floorNum != 0)
                func_8004ACF0(temp_r3_2);
            temp_r3_2->unk34 = 0;
            temp_r3_2->unk36 = 0;
            temp_r3_2->unk18 = infoWork.timerCurr;
            temp_r3_2->unk1A = 0;
            temp_r3_2->unk0.flags = 0x8000;
            temp_r3_2->unk0.stageId = currStageId;
            if (!isPractice)
            {
                temp_r3_2->unk0.difficulty = modeCtrl.difficulty;
                temp_r3_2->unk0.floorNum = infoWork.currFloor;
            }
            else
            {
                temp_r3_2->unk0.difficulty = lbl_8027CE24[0].unk2;
                temp_r3_2->unk0.floorNum = lbl_8027CE24[0].unk0;
            }
            temp_r3_2->unk0.unk5 = playerCharacterSelection[4 - i];
            temp_r3_2->unk0.unk6[0] = 0;
            temp_r3_2->unk30 = lbl_80206DEC.unk0;
            if (infoWork.flags & 0x40)
                temp_r3_2->unk0.flags |= 8;
            if (!isPractice)
            {
                if (modeCtrl.courseFlags & 8)
                    temp_r3_2->unk0.flags |= 0x20;
                if (modeCtrl.courseFlags & 0x10)
                    temp_r3_2->unk0.flags |= 0x40;
            }
            else
            {
                if (lbl_8027CE24[0].unk4 & 8)
                    temp_r3_2->unk0.flags |= 0x20;
                if (lbl_8027CE24[0].unk4 & 0x10)
                    temp_r3_2->unk0.flags |= 0x40;
            }
            func_8004AC68(temp_r3_2);
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
    struct Struct8020AE40 *temp_r30;

    lbl_802F1F74 = 0;
    var_r28 = lbl_8020AE20;
    for (var_r29 = 4; var_r29 > 0; var_r29--, var_r28++)
    {
        if (var_r28->unk0 >= 0)
        {
            if (var_r28->unk2 == 1)
            {
                temp_r30 = &lbl_8020AE40[var_r28->unk0];
                if (temp_r30->unk1A < 0x2D0)
                    temp_r30->unk0.flags |= 0x10;
                else
                    temp_r30->unk0.flags &= ~0x10;
                func_8004A874();
                temp_r30->unk0.unkC = func_8004ABD8();
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
    struct Struct8020AE40 *temp_r5;

    temp_r3 = &lbl_8020AE20[arg0];
    if (temp_r3->unk2 == 1)
    {
        temp_r5 = &lbl_8020AE40[temp_r3->unk0];
        temp_r5->unk0.flags |= 1;
        temp_r5->unk1C = infoWork.unk1C;
        temp_r5->unk24 = infoWork.unk10;
        temp_r5->unk1E = infoWork.goalEntered;
        temp_r5->unk20 = infoWork.unkE;
        func_8004B550();
    }
}

void func_800492FC(int arg0)
{
    struct Struct8020AE20 *temp_r3;
    struct Struct8020AE40 *temp_r5;

    temp_r3 = &lbl_8020AE20[arg0];
    if (temp_r3->unk2 == 1)
    {
        temp_r5 = &lbl_8020AE40[temp_r3->unk0];
        temp_r5->unk0.flags |= 2;
        temp_r5->unk1C = infoWork.timerCurr;
        func_8004B5AC();
    }
}

void func_80049368(int arg0)
{
    struct Struct8020AE20 *temp_r3;
    struct Struct8020AE40 *temp_r5;

    temp_r3 = &lbl_8020AE20[arg0];
    if (temp_r3->unk2 == 1)
    {
        temp_r5 = &lbl_8020AE40[temp_r3->unk0];
        temp_r5->unk0.flags |= 4;
        func_8004B60C();
    }
}

void func_800493C4(int arg0)
{
    struct Struct8020AE20 *temp_r3;
    struct Struct8020AE40 *temp_r5;

    temp_r3 = &lbl_8020AE20[arg0];
    if (temp_r3->unk2 == 1)
    {
        temp_r5 = &lbl_8020AE40[temp_r3->unk0];
        temp_r5->unk0.flags |= 0x80;
        temp_r5->unk1C = infoWork.timerCurr;
        func_8004B694();
    }
}

void func_80049430(char *arg0)
{
    int var_r4;
    volatile char *var_r5;
    char *var_r6;
    int i;
    struct Struct8020AE40 *var_r29;

    var_r4 = 0;
    for (var_r6 = arg0; *var_r6 != 0; var_r6++)
    {
        for (var_r5 = "#$%@^"; *var_r5 != 0; var_r5++)
        {
            if (*var_r5 == *var_r6)
            {
                var_r4 = 1;
                arg0 = "";
                break;
            }
        }

        if (var_r4)
            break;
    }

    var_r29 = lbl_8020AE40;
    for (i = 11; i > 0; i--, var_r29++)
    {
        if (var_r29->unk0.flags & 0x8000)
        {
            strncpy(var_r29->unk0.unk6, arg0, 4);
            var_r29->unk0.unk6[3] = 0;
        }
    }
    func_8004B6C8(arg0);
}

void func_80049514(int arg0)
{
    struct Struct8020AE40 *temp_r3;

    if (arg0 == 11)
    {
        func_8004B70C();
        return;
    }
    temp_r3 = &lbl_8020AE40[arg0];
    infoWork.timerMax = temp_r3->unk18;
    infoWork.timerCurr = temp_r3->unk18;
    infoWork.flags &= ~0x667;
    infoWork.currFloor = temp_r3->unk0.floorNum;
    if (temp_r3->unk0.flags & 1)
    {
        infoWork.flags |= 0x28;
        infoWork.timerCurr = temp_r3->unk1C;
        infoWork.unk1C = temp_r3->unk1C;
        infoWork.unk10 = temp_r3->unk24;
        infoWork.goalEntered = temp_r3->unk1E;
        infoWork.unkE = temp_r3->unk20;
    }
    if (temp_r3->unk0.flags & 8)
        infoWork.flags |= 0x40;
    playerCharacterSelection[0] = temp_r3->unk0.unk5;
    modeCtrl.difficulty = temp_r3->unk0.difficulty;
    modeCtrl.courseFlags &= ~0x18;
    if (temp_r3->unk0.flags & 0x20)
        modeCtrl.courseFlags |= 8;
    if (temp_r3->unk0.flags & 0x40)
        modeCtrl.courseFlags |= 0x10;
}

float func_8004964C(int arg0)
{
    struct Struct8020AE40 *temp_r4;

    if (arg0 == 11)
        return func_8004B81C();
    temp_r4 = &lbl_8020AE40[arg0];
    return ((int)temp_r4->unk36 != 0) ? temp_r4->unk36 - 1 : 0;
}

void func_800496BC(int arg0, struct Struct800496BC *arg1, float arg2)
{
    float temp_f30;
    float temp_f31;
    float var_f1;
    int temp_r3;
    int temp_r5;
    s32 var_r3;
    s32 var_r3_2;
    s32 var_r6;
    struct Ball *temp_r6;
    struct Struct8020AE40 *temp_r31;
    struct Struct800496BC sp64;
    struct Struct800496BC sp44;
    struct Struct800496BC sp24;
    Point3d sp18;
    u8 unused[4];

    temp_r6 = currentBallStructPtr;
    if (arg0 == 11)
    {
        func_8004B850(arg2, arg1);
        return;
    }
    temp_r31 = &lbl_8020AE40[arg0];
    if ((s16)(int)temp_r31->unk36 == 0)
    {
        arg1->unk0 = temp_r6->pos;
        arg1->unkC = temp_r6->unk28;
        arg1->unkE = temp_r6->unk2A;
        arg1->unk10 = temp_r6->unk2C;
        return;
    }
    if (arg2 < 0.0)
    {
        var_r3 = temp_r31->unk34 - 1;
        if (var_r3 < 0)
            var_r3 += 720;
        *arg1 = temp_r31->unk38[var_r3];
        return;
    }
    if (arg0 == 11)
        var_f1 = func_8004B81C();
    else
        var_f1 = ((s16)temp_r31->unk36 != 0) ? temp_r31->unk36 - 1 : 0;
    if (var_f1 <= arg2)
    {
        int var_r4 = temp_r31->unk34 - temp_r31->unk36;
        while (var_r4 < 0)
            var_r4 += 720;
        *arg1 = temp_r31->unk38[var_r4];
        return;
    }

    temp_r5 = arg2;

    temp_f31 = arg2 - temp_r5;
    temp_f30 = 1.0 - temp_f31;

    var_r3_2 = temp_r31->unk34 - 1 - temp_r5;
    if (var_r3_2 < 0)
        var_r3_2 += 720;
    var_r6 = var_r3_2 - 1;
    if (var_r6 < 0)
        var_r6 += 720;

    sp64 = temp_r31->unk38[var_r3_2];
    sp44 = temp_r31->unk38[var_r6];

    sp24.unk0.x = (sp64.unk0.x * temp_f30) + (sp44.unk0.x * temp_f31);
    sp24.unk0.y = (sp64.unk0.y * temp_f30) + (sp44.unk0.y * temp_f31);
    sp24.unk0.z = (sp64.unk0.z * temp_f30) + (sp44.unk0.z * temp_f31);

    sp24.unkC = sp64.unkC * temp_f30 + sp44.unkC * temp_f31;
    sp24.unkE = sp64.unkE * temp_f30 + sp44.unkE * temp_f31;
    sp24.unk10 = sp64.unk10 * temp_f30 + sp44.unk10 * temp_f31;

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

void func_80049C1C(int arg0, struct Struct8020AE40_sub2 *arg1, float arg2)
{
    struct Struct8020AE40_sub2 sp20;
    struct Struct8020AE40_sub2 sp1C;
    struct Struct8020AE40_sub2 sp18;
    float temp_f5;
    float temp_f6;
    float var_f1;
    int temp_r5;
    s32 var_r3;
    s32 var_r3_2;
    s32 var_r5;
    struct Struct8020AE40 *temp_r31;
    struct World *temp_r6;
    u8 unused[4];

    temp_r6 = currentWorldStructPtr;
    if (arg0 == 11)
    {
        func_8004BFCC(arg2, arg1);
        return;
    }
    temp_r31 = &lbl_8020AE40[arg0];
    if ((s16)(int)temp_r31->unk36 == 0)
    {
        arg1->unk0 = (s16) temp_r6->xrot;
        arg1->unk2 = (s16) temp_r6->zrot;
        return;
    }
    if (arg2 < 0.0)
    {
        var_r3 = temp_r31->unk34 - 1;
        if (var_r3 < 0)
            var_r3 += 720;
        *arg1 = temp_r31->unk5A38[var_r3];
        return;
    }
    if (arg0 == 11)
        var_f1 = func_8004B81C();
    else
        var_f1 = ((s16)temp_r31->unk36 != 0) ? temp_r31->unk36 - 1 : 0;
    if (var_f1 <= arg2)
    {
        int var_r4 = temp_r31->unk34 - temp_r31->unk36;
        while (var_r4 < 0)
            var_r4 += 720;
        *arg1 = temp_r31->unk5A38[var_r4];
        return;
    }
    temp_r5 = arg2;

    temp_f5 = arg2 - temp_r5;
    temp_f6 = 1.0 - temp_f5;

    var_r3_2 = temp_r31->unk34 - 1 - temp_r5;
    if (var_r3_2 < 0)
        var_r3_2 += 720;
    var_r5 = var_r3_2 - 1;
    if (var_r5 < 0)
        var_r5 += 720;

    sp20 = temp_r31->unk5A38[var_r3_2];
    sp1C = temp_r31->unk5A38[var_r5];

    sp18.unk0 = sp20.unk0 * temp_f6 + sp1C.unk0 * temp_f5;
    sp18.unk2 = sp20.unk2 * temp_f6 + sp1C.unk2 * temp_f5;
    *arg1 = sp18;
}

float func_80049E7C(int arg0, float arg1)
{
    float var_f1;
    struct Struct8020AE40 *temp_r6;

    if (arg0 == 11)
        return func_8004C1D8(arg1);
    temp_r6 = &lbl_8020AE40[arg0];
    var_f1 = arg1 + (float)(temp_r6->unk18 - temp_r6->unk1A);
    if (temp_r6->unk0.flags & 1)
    {
        if (var_f1 < temp_r6->unk1C)
            var_f1 = temp_r6->unk1C;
    }
    return var_f1;
}

void u_get_replay_info(int arg0, struct ReplayInfo *arg1)
{
    struct Struct8020AE40 *temp_r5;

    if (arg0 == 11)
    {
        func_8004C28C(arg1);
        return;
    }
    temp_r5 = &lbl_8020AE40[arg0];
    *arg1 = temp_r5->unk0;
}

float func_80049F90(float arg0, int arg1)
{
    struct Struct8020AE40 *temp_r5;

    if (arg1 == 11)
        return func_8004C254(arg0);
    temp_r5 = &lbl_8020AE40[arg1];
    return temp_r5->unk30 - arg0;
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
    lbl_802F1F78.unk0 = lbl_80250A68.unk0[lbl_80250A68.unk14];
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
        struct Struct8020AE40 *temp_r31 = &lbl_8020AE40[a];
        return ((s16)temp_r31->unk36 != 0) ? temp_r31->unk36 - 1 : 0;
    }
}

#pragma force_active on
void func_8004A0C8(void)
{
    struct Ball *currBall = currentBallStructPtr;
    struct Struct8020AE40 *var_r27;
    int temp_r0_2;
    struct ReplayInfo sp14;
    u8 unused[0xC];

    if (gamePauseStatus & 0xA)
        return;

    func_8002FFEC();
    if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_LEFT)
     || ((controllerInfo[0].unk0[0].button & PAD_BUTTON_LEFT) && (controllerInfo[0].unk0[0].button & PAD_TRIGGER_R)))
    {
        if (lbl_802F1F78.unk0 > 0)
            lbl_802F1F78.unk0--;
    }
    if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_RIGHT)
     || ((controllerInfo[0].unk0[0].button & PAD_BUTTON_RIGHT) && (controllerInfo[0].unk0[0].button & PAD_TRIGGER_R)))
    {
        if (lbl_802F1F78.unk0 < 11)
            lbl_802F1F78.unk0++;
    }

    if (lbl_802F1F78.unk0 < 11)
        var_r27 = &lbl_8020AE40[lbl_802F1F78.unk0];
    else
        var_r27 = NULL;

    temp_r0_2 = lbl_802F1F78.unk0;
    if (temp_r0_2 == 11)
        func_8004C28C(&sp14);
    else
        sp14 = lbl_8020AE40[temp_r0_2].unk0;

    u_debug_set_cursor_pos(8, 8);
    u_debug_printf(" REPLAY TEST\n\n");
    if (lbl_802F1F78.unk0 != 11)
        u_debug_printf("     ID: %03d\n", lbl_802F1F78.unk0);
    else
    {
        u_debug_set_text_color(1);
        u_debug_printf("     Record for Save\n");
        u_debug_set_text_color(0);
    }

    if (func_8004A0C8_sub(lbl_802F1F78.unk0) == 0.0f)
    {
        u_debug_set_text_color(1);
        u_debug_printf("       :NO DATA\n");
        u_debug_set_text_color(0);
    }
    else
    {
        u_debug_printf("  STAGE: %03d(Lib No.%03d)\n", sp14.floorNum, sp14.stageId);
        u_debug_printf(" COURSE: %3d\n", sp14.difficulty);
        if (controllerInfo[0].unk0[0].button & PAD_BUTTON_Y)
        {
            u_debug_printf("  MONKY: %3d\n", sp14.unk5);
            u_debug_printf("   NAME: %s\n", sp14.unk6);
            u_debug_printf("  GRADE: %f\n", sp14.unkC);
            if (var_r27 != NULL)
            {
                u_debug_printf("\n");
                u_debug_printf("Same Kind Data Count : %d\n", func_8004AD78(var_r27));
                u_debug_printf("Adjust Coeff : %f\n", func_8004ADC0(var_r27));
            }
        }
    }
    if (currBall->state == 4)
        infoWork.flags &= ~0x810;

    switch (lbl_802F1F78.unk4)
    {
    case 0:
        if (func_8004A0C8_sub(lbl_802F1F78.unk0) > 0.0)
        {
            if ((controllerInfo[0].unk0[2].button & PAD_BUTTON_A)
             && !(controllerInfo[0].unk0[2].button & PAD_BUTTON_B))
            {
                float var_f1_4;
                int temp_r0_7;

                lbl_80250A68.unk0[lbl_80250A68.unk14] = lbl_802F1F78.unk0;
                currStageId = sp14.stageId;
                modeCtrl.difficulty = sp14.difficulty;
                event_finish(EVENT_EFFECT);
                func_80049514(lbl_80250A68.unk0[lbl_80250A68.unk14]);
                infoWork.flags |= 0x10;
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
                    var_f1_4 = lbl_8020AE40[temp_r0_7].unk30 - var_f1_4;
                animate_anim_groups(var_f1_4);
            }
        }
        if (var_r27 != NULL)
        {
            if ((controllerInfo[0].unk0[0].button & PAD_BUTTON_A)
             && (controllerInfo[0].unk0[0].button & PAD_TRIGGER_L))
            {
                BALL_FOREACH( ball->state = 0; )
                WORLD_FOREACH( world->state = 4; )
                if (sp14.floorNum != 0)
                    func_8004ACF0(var_r27);
                memset(var_r27, 0, sizeof(*var_r27));
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
} lbl_80250A80;  // 0x45C60

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
    struct Struct8020AE40 *temp_r9_2;

    temp_r9_2 = &lbl_8020AE40[lbl_8020AE20[0].unk0];
    temp_f7 = (float)lbl_80250A80.unk1C / (float)temp_r9_2->unk1A;
    f1 = temp_r9_2->unk1A + 1;
    var_f0 = lbl_80250A80.unk0;
    var_f0 *= 1.0 / f1;
    if (temp_r9_2->unk0.flags & 1)
    {
        var_f0 *= 2.0;
        var_f0 *= 1.0 + (float)(temp_r9_2->unk18 - temp_r9_2->unk1C) / (float)temp_r9_2->unk18;
        if (temp_r9_2->unk0.flags & 0x10)
            var_f0 *= 1.0 + (temp_r9_2->unk1A - 360.0) / 720.0;
        var_f0 *= 1.0 + 0.5 * (1.0 - temp_f7);
        var_f0 *= 1.0 + 0.25 * (0.02 * temp_r9_2->unk0.floorNum);
    }
    if (temp_r9_2->unk0.flags & 2)
    {
        var_f0 *= 0.25;
        var_f0 *= temp_f7;
    }
    if (temp_r9_2->unk0.flags & 4)
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
    s32 var_r31;
    struct Struct8020AE40 *var_r30;

    memset(lbl_80250AA0, 0, sizeof(lbl_80250AA0));
    memset(&lbl_80250B58, 0, sizeof(lbl_80250B58));

    var_r30 = lbl_8020AE40;
    for (var_r31 = 11; var_r31 > 0; var_r31--, var_r30++)
    {
        if (var_r30->unk0.floorNum != 0)
            func_8004AC68(var_r30);
    }
}

void func_8004AC68(struct Struct8020AE40 *arg0)
{
    s8 *temp_r6 = lbl_80250AA0[arg0->unk0.difficulty];
    int var_r8 = arg0->unk0.floorNum - 1;

    if (arg0->unk0.flags & 0x40)
        var_r8 += 60;
    else if (arg0->unk0.flags & 0x20)
        var_r8 += 50;
    temp_r6[var_r8]++;
    lbl_80250B58[arg0->unk0.difficulty][var_r8 / 10]++;
}

void func_8004ACF0(struct Struct8020AE40 *arg0)
{
    s8 *temp_r6 = lbl_80250AA0[arg0->unk0.difficulty];
    int var_r8 = arg0->unk0.floorNum - 1;

    if (arg0->unk0.flags & 0x40)
        var_r8 += 60;
    else if (arg0->unk0.flags & 0x20)
        var_r8 += 50;
    temp_r6[var_r8]--;
    lbl_80250B58[arg0->unk0.difficulty][var_r8 / 10]--;
}

int func_8004AD78(struct Struct8020AE40 *arg0)
{
    s8 *temp_r6 = lbl_80250AA0[arg0->unk0.difficulty];
    int var_r8 = arg0->unk0.floorNum - 1;

    if (arg0->unk0.flags & 0x40)
        var_r8 += 60;
    else if (arg0->unk0.flags & 0x20)
        var_r8 += 50;
    return temp_r6[var_r8];
}

float func_8004ADC0(struct Struct8020AE40 *arg0)
{
    s8 *temp_r6 = lbl_80250AA0[arg0->unk0.difficulty];
    s8 *ptr = lbl_80250B58[arg0->unk0.difficulty];
    int var_r8 = arg0->unk0.floorNum - 1;
    float f1;

    if (arg0->unk0.flags & 0x40)
        var_r8 += 60;
    else if (arg0->unk0.flags & 0x20)
        var_r8 += 50;
    f1 = temp_r6[var_r8] + 0.2 * ptr[var_r8 / 10];
    if (f1 > 0.0)
        return 1.0 / f1;
    else
        return 1.0f;
}

int func_8004AEA0(void)
{
    struct Struct8020AE40 *temp_r4;
    int i;
    int var_r3 = -1;
    float var_f1 = -1.0f;

    temp_r4 = lbl_8020AE40;
    for (i = 6; i > 0; i--, temp_r4++)
    {
        if ((temp_r4->unk0.flags & 1) && (temp_r4->unk0.flags & 0x10)
         && temp_r4->unk0.unkC > var_f1)
        {
            var_r3 = 6 - i;
            var_f1 = temp_r4->unk0.unkC;
        }
    }
    return var_r3;
}

int func_8004AFB8(struct Struct8020AE40 *unused)
{
    return 1;
}
