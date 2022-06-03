#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "game.h"
#include "info.h"
#include "input.h"
#include "mode.h"
#include "sprite.h"
#include "stage.h"
#include "textbox.h"

struct Struct802F1F98
{
    u8 unk0;
    u8 unk1;
    s32 unk4;
    u8 filler8[0x1C-0x8];  // unused filler?
};

u32 playPointsReceived;
s8 lbl_802F1FC0;
u32 lbl_802F1FBC;
u32 lbl_802F1FB8;
u32 lbl_802F1FB4;  // not used
int lbl_802F1FB0;
u32 lbl_802F1FAC;  // not used
u32 lbl_802F1FA8;  // not used
int lbl_802F1FA4;
u32 lbl_802F1FA0;
s32 lbl_802F1F9C;
struct Struct802F1F98 *lbl_802F1F98;

s16 lbl_801BA3D8[] =
{
    0x0015, 0x0016,
    0x0017, 0x0018,
    0x0032, 0x001A,
    0x001B, 0x001C,
    0x001D, 0x0064,
};
s16 lbl_801BA3EC[] =
{
    0x0016, 0x0017,
    0x0018, 0x0019,
    0x0033, 0x001B,
    0x001C, 0x001D,
    0x001E, 0x0065,
    0x0020, 0x0021,
    0x0022, 0x0023,
    0x0024, 0x0025,
    0x0026, 0x0027,
    0x0028, 0x00C9,
    0x002A, 0x002B,
    0x002C, 0x002D,
    0x002E, 0x002F,
    0x0030, 0x0031,
    0x0032, 0x012C,
};
s16 lbl_801BA428[] =
{
    0x0017, 0x0018,
    0x0019, 0x001A,
    0x0034, 0x001C,
    0x001D, 0x001E,
    0x001F, 0x0066,
    0x0021, 0x0022,
    0x0023, 0x0024,
    0x0025, 0x0026,
    0x0027, 0x0028,
    0x0029, 0x00CA,
    0x002B, 0x002C,
    0x002D, 0x002E,
    0x002F, 0x0030,
    0x0031, 0x0032,
    0x0033, 0x012E,
    0x0035, 0x0036,
    0x0037, 0x0038,
    0x0039, 0x003A,
    0x003B, 0x003C,
    0x003D, 0x0192,
    0x003F, 0x0040,
    0x0041, 0x0042,
    0x0043, 0x0044,
    0x0045, 0x0046,
    0x0047, 0x01F4,
};
s16 lbl_802F0B00[4] =
{
    0x0028, 0x0046,
    0x0083, 0x0000,
};
s16 lbl_801BA48C[] =
{
    0x0032, 0x0050,
    0x006E, 0x008C,
    0x015F, 0x0000,
};
s16 lbl_801BA498[] =
{
    0x004B, 0x005A,
    0x0069, 0x0078,
    0x0087, 0x0096,
    0x00A5, 0x00B4,
    0x00C3, 0x0259,
};
s16 lbl_801BA4AC[] =
{
    0x00FA, 0x0104,
    0x010E, 0x0118,
    0x0122, 0x012C,
    0x0136, 0x0140,
    0x014A, 0x02BC,
};

#pragma force_active on
s16 *lbl_801BA4C0[] =
{
    lbl_801BA3D8,
    lbl_801BA3EC,
    lbl_801BA428,
    lbl_802F0B00,
    lbl_801BA48C,
    lbl_801BA498,
    lbl_801BA4AC,
    lbl_801BA4AC,
    lbl_801BA4AC,
};
s16 lbl_801BA4E4[] =  // 0x10C
{
    0x0000, 0x0001,
    0x0001, 0x0002,
    0x0002, 0x0003,
    0x0003, 0x0004,
    0x0004, 0x0005,
    0x0005, 0x0006,
    0x0006, 0x0007,
    0x0007, 0x0008,
    0x0008, 0x0009,
    0x0009, 0x000A,
    0x000A, 0x000B,
    0x000B, 0x000C,
    0x000C, 0x000D,
    0x000D, 0x000E,
    0x000E, 0x000F,
    0x000F, 0x0010,
    0x0010, 0x0011,
    0x0011, 0x0012,
    0x0012, 0x0013,
    0x0013, 0x0014,
    0x0014, 0x0015,
    0x0015, 0x0016,
    0x0016, 0x0017,
    0x0017, 0x0018,
    0x0018, 0x0019,
    0x0019, 0x001A,
    0x001A, 0x001B,
    0x001B, 0x001C,
    0x001C, 0x001D,
    0x001D, 0x001E,
    0x001E, 0x001F,
    0x001F, 0x0020,
    0x0020, 0x0021,
    0x0021, 0x0022,
    0x0022, 0x0023,
};
#pragma force_active reset

struct Struct8027CC58_sub
{
    s32 unk0;
    s32 unk4;
};

struct Struct8027CC58
{
    struct Struct8027CC58_sub unk0[4];
    s16 unk20;
    s16 unk22;
};

struct Struct8027CC58 lbl_8027CC58[4][3];
FORCE_BSS_ORDER(lbl_8027CC58)

u32 lbl_8027CE08[4];
FORCE_BSS_ORDER(lbl_8027CE08)

struct
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
} lbl_8027CE18;  // 0x1C0
FORCE_BSS_ORDER(lbl_8027CE18)

extern u32 lbl_802F1FB8;

void func_80065C58(void)
{
    int i;
    int count;
    u8 unused[4];

    lbl_8027CE08[0] = 0;
    lbl_8027CE08[1] = 0;
    lbl_8027CE08[2] = 0;
    lbl_8027CE08[3] = 0;
    lbl_802F1FBC = 0;
    lbl_802F1FB8 = 0;

    count = 0;
    lbl_8027CE18.unk0 = 0;
    for (i = 0; i < 10; i++, count++)
        lbl_8027CE18.unk0 += lbl_801BA3D8[i] + lbl_801BA4E4[i];
    for (i = 0; i < 3; i++, count++)
        lbl_8027CE18.unk0 += lbl_802F0B00[i] + lbl_801BA4E4[count];

    count = 0;
    lbl_8027CE18.unk4 = 0;
    for (i = 0; i < 30; i++, count++)
        lbl_8027CE18.unk4 += lbl_801BA3EC[i] + lbl_801BA4E4[i];
    for (i = 0; i < 5; i++, count++)
        lbl_8027CE18.unk4 += lbl_801BA48C[i] + lbl_801BA4E4[count];

    count = 0;
    lbl_8027CE18.unk8 = 0;
    for (i = 0; i < 50; i++, count++)
        lbl_8027CE18.unk8 += lbl_801BA428[i] + lbl_801BA4E4[i];
    for (i = 0; i < 10; i++, count++)
        lbl_8027CE18.unk8 += lbl_801BA498[i] + lbl_801BA4E4[count];
    for (i = 0; i < 10; i++, count++)
        lbl_8027CE18.unk8 += lbl_801BA4AC[i] + lbl_801BA4E4[count];
}

extern u32 playPointsReceived;
extern s8 lbl_802F1FC0;
extern u32 lbl_802F1FBC;

void func_80066294(void)
{
    playPointsReceived = 0;
    lbl_802F1FC0 = 0;
    if (func_800676C0() != 0)
        lbl_802F1FBC = 0;
}

void func_800662D4(void)
{
    lbl_802F1FC0 = 0;
}

void func_800662E0(void)
{
    lbl_802F1FBC = MIN(lbl_802F1FBC + playPointsReceived, 9999);
    if (func_800676C0() != 0 && lbl_802F1FBC > lbl_802F1FB8)
        lbl_802F1FB8 = lbl_802F1FBC;
}

#pragma force_active on
void func_8006633C(void)
{
    lbl_802F1FBC -= 2500;
}
#pragma force_active reset

void func_8006634C(void)
{
    int temp_r4;
    int var_r4;

    if (u_is_minigame_unlocked(6) == 0 || u_is_minigame_unlocked(7) == 0 || u_is_minigame_unlocked(8) == 0)
        return;
    if (func_800676C0() == 0 && lbl_802F1FBC >= 0x9C4)
    {
        var_r4 = 0;
        while (lbl_802F1FBC >= 0x9C4)
        {
            func_8006633C();
            var_r4++;
        }
        temp_r4 = var_r4 + ((lbl_802F1C0D >> 4) & 7);
        if (temp_r4 >= 5)
        {
            lbl_802F1C0D |= 8;
            lbl_802F1C0D &= ~0x70;
            lbl_802F1C0D |= 0x50;
            lbl_802F1FBC = 0;
        }
        else
        {
            lbl_802F1C0D &= ~0x70;
            lbl_802F1C0D |= temp_r4 * 0x10;
        }
    }
}

u32 func_80066C78(struct Struct802F1F98 *);
u32 func_80066D44(struct Struct802F1F98 *);
u32 func_80066CD4(struct Struct802F1F98 *);
void func_80066D6C(struct Struct802F1F98 *);
void func_80066D78(struct Struct802F1F98 *);
void func_80066EC0(struct Struct802F1F98 *);

u32 (*lbl_801BA570[])(struct Struct802F1F98 *) =
{
    func_80066C78,
    func_80066D44,
    func_80066CD4,
    0,
};

void (*lbl_801BA580[])(struct Struct802F1F98 *) =
{
    func_80066D6C,
    func_80066D78,
    func_80066EC0,
    0,
};

struct Struct802F1F98 lbl_801BA590[] =
{
    { 2, 0,    1 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    2 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   71 },
    { 1, 0,    3 },
    { 2, 0,    3 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    4 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   91 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    5 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    6 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    7 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    8 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    9 },
    { 0, 0,    0 },
    { 1, 2,    0 },
    { 3, 0,    0 },
};

struct Struct802F1F98 lbl_801BA964[] =
{
    { 2, 0,   11 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   12 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   13 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   14 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   91 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   15 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   71 },
    { 1, 0,    4 },
    { 2, 0,   16 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   17 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   18 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   92 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   21 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   71 },
    { 1, 0,    3 },
    { 2, 0,   22 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   23 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   24 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   25 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   26 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   27 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   28 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   71 },
    { 1, 0,    2 },
    { 0, 0,    0 },
    { 0, 2,   82 },
    { 1, 0,    7 },
    { 2, 0,   29 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   93 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   31 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   32 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   33 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   34 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   35 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   71 },
    { 1, 0,    3 },
    { 2, 0,   36 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   37 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   38 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   39 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   40 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 2,    0 },
    { 3, 0,    0 },
};

struct Struct802F1F98 lbl_801BB710[] =
{
    { 2, 0,   41 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   42 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   82 },
    { 1, 0,    3 },
    { 2, 0,   43 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   71 },
    { 1, 0,    2 },
    { 2, 0,   44 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   91 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   45 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   46 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   47 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   48 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   92 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   51 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   52 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   53 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   54 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   55 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   56 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   57 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   58 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   59 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   93 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   61 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   62 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   63 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   64 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   65 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   66 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   67 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   68 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   69 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   94 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   71 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   72 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   73 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   74 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   75 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   76 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   77 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   78 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   79 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   95 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   81 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   82 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   71 },
    { 1, 0,    2 },
    { 0, 0,    0 },
    { 0, 2,   82 },
    { 1, 0,    3 },
    { 2, 0,   83 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   84 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   85 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   86 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 0, 2,   66 },
    { 1, 0,    1 },
    { 0, 0,    0 },
    { 0, 2,   71 },
    { 1, 0,    2 },
    { 2, 0,   87 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   88 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   89 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,   90 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 2,    0 },
    { 3, 0,    0 },
};

struct Struct802F1F98 lbl_801BCD0C[] =
{
    { 2, 0,  101 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  102 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  103 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 2,    0 },
    { 3, 0,    0 },
};

struct Struct802F1F98 lbl_801BCE78[] =
{
    { 2, 0,  101 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  104 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  105 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  103 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  106 },
    { 0, 0,    0 },
    { 1, 2,    0 },
    { 3, 0,    0 },
};

struct Struct802F1F98 lbl_801BD08C[] =
{
    { 2, 0,  101 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  107 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  104 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  108 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  109 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  110 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  111 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  103 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  112 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  113 },
    { 2, 1, 1800 },
    { 0, 0,    0 },
    { 1, 2,    0 },
    { 3, 0,    0 },
};

struct Struct802F1F98 lbl_801BD508[] =
{
    { 2, 0,  121 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  122 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  123 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  124 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  125 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  126 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  127 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  128 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  129 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,  130 },
    { 0, 0,    0 },
    { 1, 2,    0 },
    { 3, 0,    0 },
};

struct Struct802F1F98 lbl_801BD86C[] =
{
    { 2, 0,    0 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    0 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    0 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    0 },
    { 0, 0,    0 },
    { 1, 0,    1 },
    { 2, 0,    0 },
    { 0, 0,    0 },
    { 1, 2,    0 },
    { 3, 0,    0 },
};

struct Struct802F1F98 *lbl_801BDA2C[] =
{
    lbl_801BA590,  // beginner
    lbl_801BA964,  // advanced
    lbl_801BB710,  // expert
    lbl_801BCD0C,  // beginner ex
    lbl_801BCE78,  // advanced ex
    lbl_801BD08C,  // expert ex
    lbl_801BD508,
    lbl_801BD508,
    lbl_801BD508,  // master
    lbl_801BD86C,
    lbl_801BD86C,
    lbl_801BD86C,
};

int u_get_max_continues(void);

void lbl_80066430(struct TextBox *tbox)
{
    if (tbox->unk19 == 0 && tbox->state == 20 && tbox->timer == tbox->timerMax - 1)
    {
        func_8006634C();
        return;
    }
    if (lbl_802F1FA0 == 0)
    {
        if (func_800676C0() != 0)
        {
            textbox_add_textf(1, "a/Play Point record for this time : ft/%4d", lbl_802F1FBC);
            textbox_add_textf(1, "a/Highest Play Point record c/0xffffff/a/timec/0x000000/ : ft/%4d", lbl_802F1FB8);
            lbl_802F1FA0++;
        }
        else if (playPointsReceived == 0)
        {
            textbox_add_text(1, "a/You didn't get any play points.");
            textbox_add_textf(1, "z9/a/You now have a total of %d Play Points.", lbl_802F1FBC);
            lbl_802F1FA0++;
        }
        else
        {
            textbox_add_textf(1, "a/You received %d Play Points.", playPointsReceived);
            textbox_add_textf(1, "z9/a/You now have a total of %d Play Points.", lbl_802F1FBC);
            lbl_802F1FA0++;
        }
        return;
    }
    if (func_800676C0() == 0 && lbl_802F1FBC >= 2500)
    {
        if (++lbl_802F1FA0 == 480)
        {
            if (tbox->unk19 == 0)
                lbl_802F1FA0 = 0;
        }
        else
        {
            if (tbox->unk18 == 0 && (u_unkInputArr1[2] & 0x100)
             && lbl_802F1FA0 > 60 && lbl_802F1FA0 < 180)
            {
                if (u_is_minigame_unlocked(6) == 0 || u_is_minigame_unlocked(7) == 0 || u_is_minigame_unlocked(8) == 0)
                    lbl_802F1FA0 = 180;
                else if (tbox->unk19 != 0)
                    lbl_802F1FA0 = 240;
                else
                    lbl_802F1FA0 = 180;
            }
            if (lbl_802F1FA0 == 240)
                tbox->unk18 = 1;
            if (lbl_802F1FA0 == 180)
            {
                if (u_is_minigame_unlocked(6) == 0 || u_is_minigame_unlocked(7) == 0 || u_is_minigame_unlocked(8) == 0)
                {
                    textbox_add_text(1, "b/c/0xff8000/a/b/You can unlock a Mini Game!");
                    textbox_add_text(1, "a/Unlock a Mini Game by selecting it!");
                    tbox->unk19 = 0;
                }
                else if (tbox->unk19 == 0)
                {
                    int var_r30;
                    if (tbox->unk17 == 0)
                    {
                        func_8002B5C8(0x16D);
                        tbox->unk17 = 1;
                    }
                    var_r30 = lbl_802F1FBC / 2500;
                    if (var_r30 + u_get_max_continues() > 9)
                    {
                        var_r30 = MIN(var_r30, 10 - u_get_max_continues());
                        textbox_add_text(1, "b/c/0xff8000/a/b/You can get unlimited continues!");
                        textbox_add_textf(1, "a/You have used %d Play Points.", var_r30 * 2500);
                    }
                    else
                    {
                        textbox_add_textf(1, "b/c/0xff8000/a/b/Your number of continues has been increased to %d !", var_r30 + u_get_max_continues());
                        textbox_add_textf(1, "a/You have used %d Play Points.", var_r30 * 2500);
                    }
                }
            }
        }
        return;
    }

    if (++lbl_802F1FA0 >= 60)
        tbox->unk18 = 1;
}

void func_8006677C(int arg0, s16 arg1, s16 arg2)
{
    struct TextBox tbox;

    memset(&tbox, 0, sizeof(tbox));
    tbox.style = 0xE;
    tbox.x = arg1;
    tbox.y = arg2;
    tbox.numColumns = 0;
    tbox.numRows = 2;
    tbox.unk17 = (u8) 0;
    tbox.unk18 = (u8) 0;
    tbox.unk19 = arg0;
    tbox.callback = (void*)lbl_80066430;
    lbl_802F1FA0 = (s32) 0;
    if (tbox.unk19 == 2)
    {
        lbl_802F1FA0 = 0xB3;
        tbox.unk19 = 0;
        tbox.numColumns = 0x18;
        tbox.unk10 = tbox.numColumns * 24;
    }
    textbox_set_properties(1, 1, &tbox);
}

int func_80066868(void)
{
    if (textBoxes[1].state == 0)
        return FALSE;
    if (textBoxes[1].unk18 == 0)
        return FALSE;
    return TRUE;
}

void func_800668A0(void)
{
    int var = u_course_num_to_course_index(modeCtrl.levelSet, modeCtrl.levelSetFlags);

    lbl_802F1F98 = lbl_801BDA2C[var];
    infoWork.unk2E = lbl_802F1F98->unk4;
    lbl_802F1F98++;
    func_800676E8();
}

void ev_course_init(void)
{
    lbl_802F1F9C = -1;
    func_80067808();
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL)
        func_80067508(modeCtrl.levelSet, infoWork.unk20, modeCtrl.levelSetFlags);
}

void ev_course_main(void)
{
    struct Struct802F1F98 *var_r29;
    int var_r28_2;
    int var_r4;
    u32 var_r28;
    u32 var_r4_2;

    if (gamePauseStatus & 0xA)
        return;
    var_r4 = -1;
    var_r28 = 0;
    for (var_r29 = lbl_802F1F98; var_r29->unk0 != 3; var_r29++)
    {
        if (var_r29->unk0 == 2 && var_r29->unk1 == 0)
            return;
        switch (var_r29->unk0)
        {
        case 0:
            if (var_r4 != 0)
                var_r28 = lbl_801BA570[var_r29->unk1](var_r29);
            else if (var_r28 != 0)
                var_r28 &= lbl_801BA570[var_r29->unk1](var_r29);
            break;
        case 1:
            if (var_r28 != 0)
                lbl_801BA580[var_r29->unk1](var_r29);
            break;
        }
        if (lbl_802F1F9C != -1)
        {
            var_r4_2 = FALSE;
            var_r28_2 = 0;
            if (infoWork.unk22 != 1)
                lbl_802F1F9C = infoWork.unk22;
            while (var_r29->unk0 != 3)
            {
                if (var_r29->unk0 == 2 && var_r29->unk1 == 0)
                {
                    var_r28_2++;
                    if (var_r28_2 == lbl_802F1F9C)
                    {
                        var_r4_2 = TRUE;
                        break;
                    }
                }
                var_r29++;
            }
            if (var_r4_2)
                lbl_802F1F98 = var_r29 + 1;
            else
            {
                func_80066EC0(var_r29);
                infoWork.unk20 += 10;
                lbl_802F1F9C = -1;
                return;
            }
            if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
            {
                lbl_802F1FC0++;
                if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_PNT_X10))
                {
                    playPointsReceived += lbl_801BA4C0[u_course_num_to_course_index(modeCtrl.levelSet, modeCtrl.levelSetFlags)][infoWork.unk20 - 1] * 10;
                    playPointsReceived += lbl_801BA4E4[lbl_802F1FC0 - 1] * 10;
                }
                else
                {
                    playPointsReceived += lbl_801BA4C0[u_course_num_to_course_index(modeCtrl.levelSet, modeCtrl.levelSetFlags)][infoWork.unk20 - 1];
                    playPointsReceived += lbl_801BA4E4[lbl_802F1FC0 - 1];
                }
            }
            infoWork.unk2E = var_r29->unk4;
            func_80067AD4();
            infoWork.unk22 = var_r28_2;
            infoWork.unk20 += infoWork.unk22;
            lbl_802F1F9C = -1;
            return;
        }
        var_r4 = var_r29->unk0;
    }
}

void ev_course_dest(void) {}

u32 func_80066C78(struct Struct802F1F98 *unused)
{
    if ((infoWork.flags & INFO_FLAG_GOAL) || (infoWork.flags & INFO_FLAG_09))
        return 1;
    if (((infoWork.flags & INFO_FLAG_BONUS_STAGE) || modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
     && ((infoWork.flags & INFO_FLAG_TIMEOVER) || (infoWork.flags & INFO_FLAG_FALLOUT)))
        return 1;
    return 0;
}

u32 func_80066CD4(struct Struct802F1F98 *arg0)
{
    int i;
    struct StageGoal *goal = decodedStageLzPtr->animGroups[0].goals;

    for (i = 0; i < 3; i++, goal++)
    {
        if (i == infoWork.goalEntered)
            break;
    }
    if (goal->type == (s8)arg0->unk4)
        return 1;
    return 0;
}

u32 func_80066D44(struct Struct802F1F98 *arg0)
{
    if (infoWork.timerCurr >= arg0->unk4)
        return 1;
    else
        return 0;
}

void func_80066D6C(struct Struct802F1F98 *arg0)
{
    lbl_802F1F9C = arg0->unk4;
}

void func_80066D78(struct Struct802F1F98 *unused)
{
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
    {
        lbl_802F1FC0++;
        if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_PNT_X10))
        {
            playPointsReceived += lbl_801BA4C0[u_course_num_to_course_index(modeCtrl.levelSet, modeCtrl.levelSetFlags)][infoWork.unk20 - 1] * 10;
            playPointsReceived += lbl_801BA4E4[lbl_802F1FC0 - 1] * 10;
        }
        else
        {
            playPointsReceived += lbl_801BA4C0[u_course_num_to_course_index(modeCtrl.levelSet, modeCtrl.levelSetFlags)][infoWork.unk20 - 1];
            playPointsReceived += lbl_801BA4E4[lbl_802F1FC0 - 1];
        }
    }
    infoWork.unk2E = -1;
}

// duplicate of func_80066D78
void func_80066EC0(struct Struct802F1F98 *unused)
{
    if (modeCtrl.gameType == GAMETYPE_MAIN_NORMAL && modeCtrl.playerCount == 1)
    {
        lbl_802F1FC0++;
        if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_PNT_X10))
        {
            playPointsReceived += lbl_801BA4C0[u_course_num_to_course_index(modeCtrl.levelSet, modeCtrl.levelSetFlags)][infoWork.unk20 - 1] * 10;
            playPointsReceived += lbl_801BA4E4[lbl_802F1FC0 - 1] * 10;
        }
        else
        {
            playPointsReceived += lbl_801BA4C0[u_course_num_to_course_index(modeCtrl.levelSet, modeCtrl.levelSetFlags)][infoWork.unk20 - 1];
            playPointsReceived += lbl_801BA4E4[lbl_802F1FC0 - 1];
        }
    }
    infoWork.unk2E = -1;
}

struct Struct8027CE24
{
    s16 unk0;
    s16 unk2;
    u32 unk4;
};  // size = 8

struct Struct8027CE24 lbl_8027CE24[6];

int u_get_stage_time_limit(void)
{
    s32 temp_r3_2;
    s32 temp_r5;
    s32 var_r6;
    s32 var_r7;
    u8 temp_r0;
    struct Struct802F1F98 *var_r3;

    if (lbl_802F1FA4 != 0)
    {
        var_r7 = 0;
        var_r6 = 0;
        if (lbl_8027CE24[infoWork.unk20 - 1].unk4 & 8)
            var_r6 = 3;
        if (lbl_8027CE24[infoWork.unk20 - 1].unk4 & 0x10)
            var_r6 = 6;
        var_r3 = lbl_801BDA2C[var_r6 + lbl_8027CE24[infoWork.unk20 - 1].unk2];
        temp_r5 = lbl_8027CE24[infoWork.unk20 - 1].unk0;
        while (var_r3->unk0 != 3)
        {
            if (var_r3->unk0 == 2 && var_r3->unk1 == 0)
            {
                var_r7++;
                if (var_r7 == temp_r5)
                {
                    if (var_r3[1].unk0 != 2 || var_r3[1].unk1 != 1)
                        break;
                    return var_r3[1].unk4;
                }
            }
            var_r3++;
        }
        return 3600;
    }
    if (lbl_802F1F98->unk0 == 2 && lbl_802F1F98->unk1 == 1)
        return lbl_802F1F98->unk4;
    return 3600;
}

int floor_num_to_stage_id(int courseId, int floorNum, int flags)
{
    int stageId;
    int var_r4;

    lbl_802F1F98 = lbl_801BDA2C[u_course_num_to_course_index(courseId, flags)];
    var_r4 = 1;
    while (var_r4 <= floorNum && lbl_802F1F98->unk0 != 3)
    {
        if (lbl_802F1F98->unk0 == 2 && lbl_802F1F98->unk1 == 0)
        {
            if (var_r4 == floorNum)
                break;
            var_r4++;
        }
        lbl_802F1F98++;
    }
    stageId = lbl_802F1F98->unk4;
    if (modeCtrl.gameType == GAMETYPE_MAIN_COMPETITION)
    {
        if (stageId == ST_126_ROLL_MASTER)
            stageId = ST_116_ALTERNATE_ROLL_MASTER;
        if (stageId == ST_127_EDGE_MASTER)
            stageId = ST_115_ALTERNATE_EDGE_MASTER;
    }
    lbl_802F1F98++;
    return stageId;
}

int u_course_num_to_course_index(int arg0, u32 flags)
{
    int index = 0;

    if (flags & LVLSET_FLAG_EXTRA)
        index = 3;
    if (flags & LVLSET_FLAG_MASTER)
        index = 6;
    if (lbl_802F1FA4 != 0)
        index = 9;
    index += arg0;
    return index;
}

static const int s_bonusStages[] =
{
    ST_091_BONUS_BASIC,
    ST_092_BONUS_WAVE,
    ST_093_BONUS_GRID,
    ST_094_BONUS_BUMPY,
    ST_095_BONUS_HUNTING,
    ST_134_RACE_ICE,  //! How is this a bonus stage?
    0,
};

static const int courseFloorCounts[] =
{
    10,  // beginner
    30,  // advanced
    50,  // expert
    3,   // beginner ex
    5,   // advanced ex
    10,  // expert ex
    10,
    10,
    10,  // master
    0,
    0,
    0,
    0,
};

#pragma force_active on
int get_last_level_num_of_set(int arg0, int arg1)
{
    if (lbl_802F1FA4 != 0)
        return lbl_802F1FB0;
    return courseFloorCounts[u_course_num_to_course_index(arg0, arg1)];
}
#pragma force_active reset

u32 func_80067264(int arg0, int arg1, int arg2)
{
    int r0 = get_last_level_num_of_set(arg0, arg2);

    if (arg1 == r0)
        return 1;
    else
        return 0;
}

u32 is_bonus_stage(int stageId)
{
    int isBonus = FALSE;
    const volatile int *id;

    for (id = s_bonusStages; *id != 0; id++)
    {
        if (*id == stageId)
        {
            isBonus = TRUE;
            break;
        }
    }
    return isBonus;
}

#pragma force_active on
void func_80067310(void)
{
    int i;

    for (i = 0; i < lbl_802F1FB0; i++)
    {
        lbl_801BD86C[i * 3].unk4 = floor_num_to_stage_id(lbl_8027CE24[i].unk2, lbl_8027CE24[i].unk0, lbl_8027CE24[i].unk4);
        lbl_801BD86C[i * 3 + 2].unk1 = 0;
    }
    lbl_801BD86C[(lbl_802F1FB0 - 1) * 3 + 2].unk1 = 2;
}
#pragma force_active reset

int func_800673BC(void)
{
    struct Struct802F1F98 *r3 = lbl_802F1F98;

    while (r3->unk0 != 3)
    {
        //! why the nested while loop?
        while (r3->unk0 != 3)
        {
            if (r3->unk0 == 2 && r3->unk1 == 0)
                return r3->unk4;
            r3++;
        }
    }
    return -1;
}

#pragma force_active on
int func_80067408(int arg0, int arg1, u32 arg2)
{
    int var_r7 = 0;

    if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_STG_ALL))
        return 1;

    if (arg2 & 0x10)
        var_r7 = 0x6E;
    else if (arg2 & 8)
    {
        switch (arg0)
        {
        case 0:
            var_r7 = 0x5A;
            break;
        case 1:
            var_r7 = 0x5F;
            break;
        case 2:
            var_r7 = 0x64;
            break;
        }
    }
    else
    {
        switch (arg0)
        {
        case 0:
            var_r7 = 0;
            break;
        case 1:
            var_r7 = 0xA;
            break;
        case 2:
            var_r7 = 0x28;
            break;
        }
    }
    var_r7 += arg1 - 1;
    if ((1 << (var_r7 % 32)) & lbl_8027CE08[var_r7 / 32])
        return 1;
    else
        return 0;
}
#pragma force_active reset

void func_80067508(int arg0, int arg1, u32 arg2)
{
    int var_r7 = 0;

    if (arg2 & 0x10)
        var_r7 = 0x6E;
    else if (arg2 & 8)
    {
        switch (arg0)
        {
        case 0:
            var_r7 = 0x5A;
            break;
        case 1:
            var_r7 = 0x5F;
            break;
        case 2:
            var_r7 = 0x64;
            break;
        }
    }
    else
    {
        switch (arg0)
        {
        case 0:
            var_r7 = 0;
            break;
        case 1:
            var_r7 = 0xA;
            break;
        case 2:
            var_r7 = 0x28;
            break;
        }
    }
    var_r7 += arg1 - 1;
    lbl_8027CE08[var_r7 / 32] |= (1 << (var_r7 % 32));
}

int u_is_minigame_unlocked(int minigame)
{
    int isUnlocked = FALSE;

    if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_STG_ALL))
        return TRUE;

    switch (minigame)
    {
    case 6:
        if (lbl_802F1C0D & 1)
            isUnlocked = TRUE;
        break;
    case 7:
        if (lbl_802F1C0D & 2)
            isUnlocked = TRUE;
        break;
    case 8:
        if (lbl_802F1C0D & 4)
            isUnlocked = TRUE;
        break;
    }
    return isUnlocked;
}

int u_get_max_continues(void)
{
    return (lbl_802F1C0D >> 4) + 5;
}

int get_num_continues(void)
{
    if (func_800676C0() != 0)
        return 10;
    return u_get_max_continues() - infoWork.continuesUsed;
}

int func_800676C0(void)
{
    if ((dipSwitches & DIP_DEBUG) && (dipSwitches & DIP_PLAY_STG_ALL))
        return 1;
    return lbl_802F1C0D & 8;
}

void func_800676E8(void)
{
    int i, j;

    for (i = 0; i < 4; i++)
    {
        struct Struct8027CC58 *r4 = lbl_8027CC58[i];

        for (j = 0; j < 3; j++, r4++)
        {
            r4->unk0[0].unk0 = 0;
            r4->unk0[0].unk4 = -1;
            r4->unk0[1].unk0 = 0;
            r4->unk0[1].unk4 = -1;
            r4->unk0[2].unk0 = 0;
            r4->unk0[2].unk4 = -1;
            r4->unk0[3].unk0 = 0;
            r4->unk0[3].unk4 = -1;
            r4->unk20 = -1;
            r4->unk22 = -1;
        }
    }
}

static void inline1(void)
{
    int temp_r27_3;
    int var_r3_3;
    struct Struct8027CC58 *temp_r3_3;

    temp_r27_3 = modeCtrl.currPlayer;
    if (modeCtrl.gameType == 0)
        var_r3_3 = get_next_player();
    else
        var_r3_3 = temp_r27_3;
    temp_r3_3 = lbl_8027CC58[var_r3_3];
    if (temp_r27_3 == var_r3_3)
        infoWork.unk32 = lbl_8027CC58[temp_r27_3][0].unk0[1].unk4;
    else if (temp_r3_3->unk22 == -1)
        infoWork.unk32 = temp_r3_3->unk0[0].unk4;
    else
        infoWork.unk32 = temp_r3_3->unk0[temp_r3_3->unk22 + 1].unk4;
}

static inline void inline3(struct Struct8027CC58 *temp_r28)
{
    struct Struct802F1F98 *var_r8;
    int i;
    struct Struct8027CC58_sub *var_r6;
    int var_r5;
    int var_r4;
    struct Struct802F1F98 *var_r3_2;

    var_r6 = temp_r28->unk0;
    var_r8 = lbl_802F1F98;
    for (i = 0; i < 3 && var_r8->unk0 != 3; var_r8++)
    {
        if (var_r8->unk0 == 2 && var_r8->unk1 == 0)
            break;
        if (var_r8->unk0 == 1)
        {
            switch (var_r8->unk1)
            {
            case 0:
            default:

                var_r6[1].unk0 = (s32) (infoWork.unk20 + var_r8->unk4);
                var_r5 = var_r8->unk4;
                var_r3_2 = lbl_802F1F98;
                var_r4 = -1;
                while (var_r3_2->unk0 != 3)
                {
                    if (var_r3_2->unk0 == 2 && var_r3_2->unk1 == 0
                     && --var_r5 <= 0)
                    {
                        var_r4 = var_r3_2->unk4;
                        break;
                    }
                    var_r3_2++;
                }
                var_r6[1].unk4 = var_r4;
                break;
            case 1:
            case 2:
                var_r6[1].unk0 = -1;
                var_r6[1].unk4 = -1;
                break;
            }
            var_r6++;
            i++;
        }
    }
    temp_r28->unk20 = i;
    temp_r28->unk22 = -1;

}

void func_80067808(void)
{
    int temp_r27_2;
    struct Struct8027CC58 *temp_r28;
    int i;
    struct Struct8027CC58 *var_r25;
    u8 unused[0x18];

    temp_r27_2 = modeCtrl.currPlayer;
    if (modeCtrl.gameType == 0)
        get_next_player();  // return value not used

    if (infoWork.unk20 == lbl_8027CC58[temp_r27_2][0].unk0[0].unk0)
    {
        inline1();
        return;
    }

    temp_r28 = lbl_8027CC58[temp_r27_2];

    for (i = 1, var_r25 = &temp_r28[1]; i >= 0; i--, var_r25--)
    {
        if (var_r25->unk0[0].unk0 != 0)
            memcpy(&var_r25[1], var_r25, sizeof(var_r25[1]));
    }


    temp_r28->unk0[0].unk0 = infoWork.unk20;
    temp_r28->unk0[0].unk4 = currStageId;
    temp_r28->unk0[1].unk0 = 0;
    temp_r28->unk0[1].unk4 = -1;
    temp_r28->unk0[2].unk0 = 0;
    temp_r28->unk0[2].unk4 = -1;
    temp_r28->unk0[3].unk0 = 0;
    temp_r28->unk0[3].unk4 = -1;

    inline3(temp_r28);

    inline1();
}

void func_80067AD4(void)
{
    struct Struct8027CC58 *temp_r8 = lbl_8027CC58[modeCtrl.currPlayer];
    int i;

    for (i = 0; i < 3; i++)
    {
        int var = temp_r8->unk0[i+1].unk4;

        if (var == infoWork.unk2E || infoWork.unk2E == -1)
        {
            temp_r8->unk22 = i;
            if (infoWork.unk2E == -1)
                temp_r8->unk0[temp_r8->unk22 + 1].unk4 = -1;
            break;
        }
    }

    inline1();
}

void lbl_80067C20(struct Sprite *sprite)
{
    struct Struct8027CC58_sub *var_r31;
    int var_r0;
    int var_r4;
    int j;
    int i;
    struct Struct8027CC58 *var_r27;
    int x;
    int y;

    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    set_text_scale(sprite->scaleX, sprite->scaleY);
    x = sprite->x;
    y = sprite->y;

    var_r27 = &lbl_8027CC58[modeCtrl.currPlayer][2];
    for (i = 2; i >= 0; i--, var_r27--)
    {
        if (var_r27->unk0[0].unk0 != 0)
        {
            if (i == 0)
                set_text_mul_color(RGBA(0, 255, 0, 0));
            set_text_pos(x, y);
            func_80072AC0("%d(%03d)", var_r27->unk0[0].unk0, var_r27->unk0[0].unk4);
            if (i == 0)
                set_text_mul_color(RGBA(255, 255, 255, 0));
            var_r0 = var_r27->unk0[0].unk0;
            var_r4 = 6;
            while (var_r0 != 0)
            {
                var_r0 /= 10;
                if (var_r0 > 0)
                    var_r4++;
            }

            for (j = 0; j < 3; j++)
            {
                var_r31 = var_r27->unk0 + j;
                if (i > 0 && j > 0)
                    break;
                if (var_r31[1].unk0 == 0)
                    break;

                set_text_pos(
                    x + sprite->scaleX * (var_r4 * 8),
                    y + sprite->scaleY * (j * 8));
                if (i > 0)
                    u_draw_text("\x16>");
                else if ((var_r27->unk20 > 1) && (j == 0))
                    u_draw_text("\x13>");
                else if ((var_r27->unk20 > 1) && (j == (s32) (var_r27->unk20 - 1)))
                    u_draw_text("\x1A>");
                else if (var_r27->unk20 > 1)
                    u_draw_text("\x11>");
                else
                    u_draw_text("\x16>");

                if (i > 0)
                    break;

                if (var_r31[1].unk0 == infoWork.unk20 && unpausedFrameCounter % 60 < 45)
                    set_text_mul_color(RGBA(0, 255, 0, 0));
                set_text_pos(
                    x + sprite->scaleX * (var_r4 * 8) + sprite->scaleX * 16.0f,
                    y + sprite->scaleY * (j * 8));
                if (var_r31[1].unk4 == -1)
                    u_draw_text("CLEAR");
                else if (var_r31[1].unk4 == -1)  //! typo?
                    u_draw_text("END");
                else
                    func_80072AC0("%d(%03d)", var_r31[1].unk0, var_r31[1].unk4);
                set_text_mul_color(RGBA(255, 255, 255, 0));
            }
            x += sprite->scaleX * (var_r4 * 8) + sprite->scaleX * 16.0f;
        }
    }
}

void func_80067FD0(struct MemcardGameData *data)
{
    data->unk5844.unk90 = lbl_8027CE08[0];
    data->unk5844.unk94 = lbl_8027CE08[1];
    data->unk5844.unk98 = lbl_8027CE08[2];
    data->unk5844.unk9C = lbl_8027CE08[3];
    data->unk5844.unk2C0 = lbl_802F1FBC;
    data->unk5844.unk2C4 = lbl_802F1FB8;
}

void func_8006800C(struct MemcardGameData *data)
{
    lbl_8027CE08[0] = data->unk5844.unk90;
    lbl_8027CE08[1] = data->unk5844.unk94;
    lbl_8027CE08[2] = data->unk5844.unk98;
    lbl_8027CE08[3] = data->unk5844.unk9C;
    lbl_802F1FBC = data->unk5844.unk2C0;
    lbl_802F1FB8 = data->unk5844.unk2C4;
}
