#include <dolphin.h>

#include "global.h"
#include "input.h"

u8 lbl_80201928[0x7AC];  FORCE_BSS_ORDER(lbl_80201928)
u8 lbl_802020D4[0x7AC];  FORCE_BSS_ORDER(lbl_802020D4)
u8 lbl_80202880[0xF58];  FORCE_BSS_ORDER(lbl_80202880)
u8 lbl_802037D8[0x7AC];  FORCE_BSS_ORDER(lbl_802037D8)
u8 lbl_80203F84[0x1704];  FORCE_BSS_ORDER(lbl_80203F84)

struct Struct80205688
{
    u32 unk0;
    u8 filler4[0x20-4];
    s32 unk20;
    u8 filler24[0x2C-0x24];
};

struct
{
    u32 unk0[16];
    struct Struct80205688 unk40[1];  // 0x3DA0
    u8 filler6C[0x300-0x6C];
} lbl_80205688;  // 0x3D60
FORCE_BSS_ORDER(lbl_80205688)

extern int lbl_802F1E08;  // s32 vs int actually matters here
extern s32 lbl_802F1EA8;

static void func_8002DD5C_inline(void)
{
    u32 *r6 = &lbl_80205688.unk0[lbl_802F1E08];
    u32 r4 = *r6;
    int i;

    for (i = lbl_802F1E08; i > 0; i--, r6--)
        *r6 = *(r6 - 1);
    lbl_80205688.unk0[0] = r4;
    lbl_802F1E08 = 0;
}

void func_8002DD5C(void)
{
    if (lbl_802F1E08 == 0)
    {
        u32 *r3 = lbl_80205688.unk0;
        u32 r4 = *r3;
        int i;

        for (i = 0; i < 15 && *(r3 + 1) != 0; i++, r3++)
            *r3 = *(r3 + 1);
        *r3 = r4;
        lbl_802F1E08 = i;
    }
    else
    {
        func_8002DD5C_inline();
    }
}

void func_8002DE38(void)
{
    int r6;
    int i;  // r7

    for (i = 0; i < 16; i++)
    {
        r6 = ((lbl_802F1E08 - i) + 16) % 16;
        if (lbl_80205688.unk0[r6] != 0)
        {
            lbl_802F1E08 = r6;
            lbl_802F1EA8 = 1;
            break;
        }
    }
    if (i >= 16)
    {
        lbl_802F1E08 = 0;
        lbl_802F1EA8 = 0;
    }
}

/*
struct UnkStruct1
{
    u32 unk0;
    u8 filler4[0xC-0x4];
    u32 unk10;
    u8 filler14[4];
};

struct Struct8002E284
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s32 unkC;
    struct UnkStruct1 *unk10;
    
    s32 unk1C;
    
    u32 unk24;
    u32 unk28;
};

extern s32 lbl_802F1E40;
extern s32 lbl_802F1E44;

u8 lbl_80201928[0x3D60];

void func_8002E284(struct Struct8002E284 *a)
{
    struct UnkStruct1 *r3;

    if ((analogButtonInfo[0][4] & (1<<(31-0x18)))
     || ((analogButtonInfo[0][0] & (1<<(31-0x18))) && (analogButtonInfo[0][0] & (1<<(31-0x16)))))
    {
        a->unkC--;
        a->unkC = MAX(a->unkC, 3);
        //to lbl_8002E338
    }
    //lbl_8002E2F4
    else if ((analogButtonInfo[0][4] & (1<<(31-0x19)))
     || ((analogButtonInfo[0][0] & (1<<(31-0x19))) && (analogButtonInfo[0][0] & (1<<(31-0x16)))))
    {
        //lbl_8002E30C
        a->unkC++;
        a->unkC = a->unkC < (0x25 - a->unk4) ? a->unkC : 0x25 - a->unk4;
    }
    //lbl_8002E338
    if ((analogButtonInfo[0][4] & (1<<(31-0x1B)))
     || ((analogButtonInfo[0][0] & (1<<(31-0x1B))) && (analogButtonInfo[0][0] & (1<<(31-0x16)))))
    {
        //lbl_8002E35C
        a->unk8--;
        a->unk8 = MAX(a->unk8, 3);
    }
    //lbl_8002E384
    else if ((analogButtonInfo[0][4] & (1<<(31-0x1A)))
     || ((analogButtonInfo[0][0] & (1<<(31-0x1A))) && (analogButtonInfo[0][0] & (1<<(31-0x16)))))
    {
        a->unk8++;
        a->unk8 = a->unk8 < (0x35 - a->unk0) ? a->unk8 : 0x35 - a->unk0;
    }
    //lbl_8002E3C8
    if ((analogButtonInfo[0][4] & (1<<(31-0x1C)))
     || ((analogButtonInfo[0][0] & (1<<(31-0x1C))) && (analogButtonInfo[0][0] & (1<<(31-0x16)))))
    {
        int r6 = (a->unk4 - 1) > 0 ? a->unk4 - 1 : 0;
        a->unk28 += (a->unk4 - r6) * 12;
        a->unk4 = r6;
    }
    //lbl_8002E420
    else if ((analogButtonInfo[0][4] & (1<<(31-0x1D)))
     || ((analogButtonInfo[0][0] & (1<<(31-0x1D))) && (analogButtonInfo[0][0] & (1<<(31-0x16)))))
    {
        //lbl_8002E438
        int r6 = a->unk4 + 1 < 0x25 - a->unkC ? a->unk4 + 1 : 0x25 - a->unkC;
        a->unk28 += (a->unk4 - r6) * 12;
        a->unk4 = r6;
    }
    //lbl_8002E470
    if ((analogButtonInfo[0][4] & (1<<(31-0x1F)))
     || ((analogButtonInfo[0][0] & (1<<(31-0x1F))) && (analogButtonInfo[0][0] & (1<<(31-0x16)))))
    {
        //lbl_8002E494
        int r5 = MAX(a->unk0 - 1, 0); 
        a->unk24 += (a->unk0 - r5) * 12;
        a->unk0 = r5;
    }
    //lbl_8002E4C8
    else if ((analogButtonInfo[0][4] & (1<<(31-0x1E)))
     || ((analogButtonInfo[0][0] & (1<<(31-0x1E))) && (analogButtonInfo[0][0] & (1<<(31-0x16)))))
    {
        //lbl_8002E4E0
        int r5 = MIN(a->unk0 + 1, 0x35 - a->unk8);
        a->unk24 += (a->unk0 - r5) * 12;
        a->unk0 = r5;
    }
    //lbl_8002E518
    
    if (lbl_802F1E40 != 0)
    {
        int r5 = a->unk1C;
        int r6 = r5;
        do  // lbl_8002E52C
        {
            struct UnkStruct1 *r4 = a->unk10;
            while ((r4->unk0 & 0xFF) != 0x1F)
            {
                r6++;
                r4++;
            }
            //lbl_8002E554
            if (r6 == 0)
                break;
            if (r6 == r5)
                break;  
        } while ((a->unk10[r6].unk0 & 0xFF) > 12);
        //lbl_8002E57C
        a->unk1C = r6;
    }
    //lbl_8002E584
    else if (lbl_802F1E44 != 0)
    {
        int r6 = a->unk1C;
        int r7 = r6;
        struct UnkStruct1 *r5 = &a->unk10[r7];
        struct UnkStruct1 *r3 = r5;
        do
        {
            r5++;
            r3++;
            r7++;
            if ((r5->unk0 & 0xFF) == 0x1F)
            {
                r7 = 0;
                break;
            }
            //lbl_8002E5C8
            if (r7 == r6)
                break;
        } while ((r3->unk0 & 0xFF) > 12);
        //lbl_8002E5E0
        a->unk1C = r7;
    }
    //lbl_8002E5E4
    r3 = &a->unk10[a->unk1C];
    switch (r3->unk0)
    {
    case 0:
        if ((controllerInfo[0].unk0[4].button & (1<<(31-0x17)))
         && (r3->unk10 != 0)
        {
            lbl_802F1EA8 = 1;
            
        }
        break;
    }
}
*/
