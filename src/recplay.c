#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "mode.h"
#include "world.h"

struct Struct8020AE40_sub
{
    Vec unk0;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
    s16 unk14;
    s16 unk16;
    u32 unk18;
    float unk1C;
};

struct Struct8020AE40_sub2
{
    s16 unk0;
    s16 unk2;
};

struct Struct8020AE40
{
    u16 unk0;
    u8 unk2;
    u8 filler3[0xC-0x3];
    float unkC;
    u8 filler10[0x1A-0x10];
    s16 unk1A;
    u8 filler1C[0x30-0x1C];
    s32 unk30;
    s16 unk34;
    s16 unk36;
    struct Struct8020AE40_sub unk38[1];
    u8 filler58[0x5A38-0x58];
    struct Struct8020AE40_sub2 unk5A38[1];
    u8 filler5A3C[0x6578-0x5A3C];
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
                if (var_r28->unkC != 0.0 && var_r28->unk2 != 0)
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
        temp_r30->unkC *= 0.92f;

}

void func_80048BD4(void)
{
    int i;
    struct Struct8020AE40 *var_r5;

    var_r5 = lbl_8020AE40;
    for (i = 11; i > 0; i--, var_r5++)
    {
        if (var_r5->unk0 & 0x8000)
            var_r5->unk0 &= 0xFFFF7FFF;
        if (!(dipSwitches & DIP_DEBUG))
            var_r5->unkC *= 0.92f;
    }
    func_8004AFD0();
}

void ev_recplay_init(void)
{
    lbl_802F1F74 = 0;
    func_8004AFD4();
}

/*
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
            struct Struct8020AE40_sub *temp_r5;
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
*/
