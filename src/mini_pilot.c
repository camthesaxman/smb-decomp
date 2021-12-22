#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"

// .rodata

const u32 lbl_0000BE80[] =  // unknown type
{
    0x003A003B,
    0x003F0053,
    0x00540055,
    0x00560057,
    0x02000201,
    0x02020203,
    0x02040205,
    0x02060207,
    0x02080209,
    0x020A020B,
    0x020C020D,
    0x020E0000,
};

void lbl_000001F8(void);
void lbl_000003B4(void);
void lbl_0000044C(void);
void lbl_0000047C(void);
void lbl_000004E0(void);
void lbl_00000648(void);
void lbl_0000066C(void);
void lbl_00000698(void);
void lbl_0000101C();
void lbl_000011CC();
void lbl_00001538();
void lbl_000015D8();
void lbl_0000178C();
void lbl_00001B08();
void lbl_00001BB4();
void lbl_000023BC();
void lbl_00002408();
void lbl_00001CE4();
void lbl_00001DE0();
void lbl_000024D0();
void lbl_0000253C();
void lbl_000026BC();
void lbl_00002890();
void lbl_00002A2C();
void lbl_00002AE8();
void lbl_00002C18();
void lbl_00002D24();
void lbl_00002E04();
void lbl_00002E94();
void lbl_00002EB4();
void lbl_00002FF4();
void lbl_00003298();
void lbl_00003374();
void lbl_000035B8();
void lbl_00003860();
void lbl_000038D4();
void lbl_00003AD0();
void lbl_00004FA8();
void lbl_00005008();
void lbl_00005044();
void lbl_0000509C();
void lbl_00004024();
void lbl_00003B6C(void);
void lbl_00004F68(void);
void lbl_00006DFC(void);

// .data

s16 lbl_0000C740[] =
{
    0x97,
    0x98,
    0x99,
    0x00
};

void (*lbl_0000C748[])() =
{
    lbl_0000101C,
    lbl_000011CC,
    lbl_00001538,
    lbl_000015D8,
    lbl_0000178C,
    lbl_00001B08,
    lbl_00001BB4,
    lbl_000023BC,
    lbl_00002408,
    lbl_00001CE4,
    lbl_00001DE0,
    lbl_000024D0,
    lbl_0000253C,
    lbl_000026BC,
    lbl_00002890,
    lbl_00002A2C,
    lbl_00002AE8,
    lbl_00002C18,
    lbl_00002D24,
    lbl_00002E04,
    lbl_00002E94,
    lbl_00002EB4,
    lbl_00002FF4,
    lbl_00003298,
    lbl_00003374,
    lbl_000035B8,
    lbl_00003860,
    lbl_000038D4,
    lbl_00003AD0,
};

void (*lbl_0000C7BC[])() =
{
    lbl_00004FA8,
    lbl_00005008,
    lbl_00005044,
    lbl_0000509C,
};

// . bss (unknown types)

u8 lbl_10000000[4];         
//u8 lbl_10000004[0x14];
u8 lbl_10000004[4];         
u32 lbl_10000008[4];        
u8 lbl_10000018[6];         
u16 lbl_1000001E;           
//u8 lbl_10000020[0x14];
u8 lbl_10000020[0xC];       
u32 lbl_1000002C;           
u32 lbl_10000030;           
u16 lbl_10000034;           
u16 lbl_10000036;           
void *lbl_10000038;         
void *lbl_1000003C;         
s16 lbl_10000040;           
u16 pad_10000042;           
u32 lbl_10000044[4];        
s16 lbl_10000054[4];        
s16 lbl_1000005C[4];        
u16 lbl_10000064;           
u16 lbl_10000066;           
u8 lbl_10000068[0xC];       
u32 lbl_10000074;           
u8 lbl_10000078[0xF];       
u8 lbl_10000087;            
u16 lbl_10000088;           
u16 lbl_1000008A;           
u32 lbl_1000008C;           
u8 lbl_10000090[8];         
u8 lbl_10000098[0x10];      
u8 lbl_100000A8[8];         
u8 lbl_100000B0[8];         
u8 lbl_100000B8[0xC];       

FORCE_BSS_ORDER(lbl_10000000)
FORCE_BSS_ORDER(lbl_10000004)
FORCE_BSS_ORDER(lbl_10000008)
FORCE_BSS_ORDER(lbl_10000018)
FORCE_BSS_ORDER(lbl_1000001E)
FORCE_BSS_ORDER(lbl_10000020)
FORCE_BSS_ORDER(lbl_1000002C)
FORCE_BSS_ORDER(lbl_10000030)
FORCE_BSS_ORDER(lbl_10000034)
FORCE_BSS_ORDER(lbl_10000036)
FORCE_BSS_ORDER(lbl_10000038)
FORCE_BSS_ORDER(lbl_1000003C)
FORCE_BSS_ORDER(lbl_10000040)
FORCE_BSS_ORDER(pad_10000042)
FORCE_BSS_ORDER(lbl_10000044)
FORCE_BSS_ORDER(lbl_10000054)
FORCE_BSS_ORDER(lbl_1000005C)
FORCE_BSS_ORDER(lbl_10000064)
FORCE_BSS_ORDER(lbl_10000066)
FORCE_BSS_ORDER(lbl_10000068)
FORCE_BSS_ORDER(lbl_10000074)
FORCE_BSS_ORDER(lbl_10000078)
FORCE_BSS_ORDER(lbl_10000087)
FORCE_BSS_ORDER(lbl_10000088)
FORCE_BSS_ORDER(lbl_1000008A)
FORCE_BSS_ORDER(lbl_1000008C)
FORCE_BSS_ORDER(lbl_10000090)
FORCE_BSS_ORDER(lbl_10000098)
FORCE_BSS_ORDER(lbl_100000A8)
FORCE_BSS_ORDER(lbl_100000B0)
FORCE_BSS_ORDER(lbl_100000B8)

extern u32 lbl_802F1FD0;
extern void (*lbl_802F1FD4)();

void _prolog(void)
{
    func_80093A84(
        lbl_0000044C,
        lbl_00003B6C,
        lbl_00004F68,
        lbl_00006DFC);
    puts("RELOCATION MINI_PILOT LOADED");
    lbl_000001F8();
}

void _epilog(void)
{
    lbl_000003B4();
    puts("RELOCATION MINI_PILOT PURGED");
}

void _unresolved(void)
{
    u32 i;
    u32 *sp;

    puts("\nError: A called an unlinked function.\n");
    puts("Address:      Back Chain    LR Save\n");

    i = 0;
    sp = (u32 *)OSGetStackPointer();
    while (sp != NULL && (u32)sp != 0xFFFFFFFF && i++ < 16)
    {
        printf("0x%08x:   0x%08x    0x%08x\n", (u32)sp, sp[0], sp[1]);
        sp = (u32 *)sp[0];
    }
    OSPanic("mini_pilot.c", 0x120, "\n");
}

const float lbl_0000BEB0 = 0.0f;
const float lbl_0000BEB4 = 1.0f;

void lbl_000001F8(void)
{
    int i;  // r30
    OSHeapHandle r30;
    struct Ball *r6;
    struct Ball *r7;
    s8 *r8;
    int j;  // r9

    event_clear();
    g_something_with_iteratively_freeing_memory();
    func_800249D4();
    unload_stage();
    func_80029228(14);
    r30 = OSSetCurrentHeap(memHeap2);
    bitmap_load_group(BMP_TGT);
    OSSetCurrentHeap(r30);
    func_800171E0();
    lbl_00000648();
    
    lbl_802F1FD4 = lbl_00004024;
    for (i = 0; i < 4; i++)
        setup_camera_viewport(i, lbl_0000BEB0, lbl_0000BEB0, lbl_0000BEB4, lbl_0000BEB4);
    lbl_802F1FF4 = -1;
    lbl_802F1FF6 = 0;
    lbl_000004E0();
    camera_set_state(0x43);
    
    r7 = currentBallStructPtr;
    r6 = &ballInfo[0];
    r8 = spritePoolInfo.unkC;
    for (j = 0; j < spritePoolInfo.unk8; j++, r6++, r8++)
    {
        if (*r8 == 2)
        {
            currentBallStructPtr = r6;
            r6->state = 1;
        }
    }
    currentBallStructPtr = r7;

    func_800732DC(0x100, 0, 30);
    func_8002CF38(50, 0);
    gameSubmodeRequest = 0x9B;
    lbl_10000038 = OSAllocFromHeap(memHeap2, 0xA00C);
    lbl_1000003C = OSAllocFromHeap(memHeap2, 0x1400C);
    lbl_0000AF68(lbl_10000038, 0x400);
    lbl_0000AF68(lbl_1000003C, 0x800);
}

void lbl_000003B4(void)
{
    event_clear();
    OSFreeToHeap(memHeap2, lbl_1000003C);
    OSFreeToHeap(memHeap2, lbl_10000038);
    if (lbl_802F1FD0 & (1<<(31-0x1D)))
    {
        func_8009CC34();
        lbl_802F1FD0 &= ~(1<<(31-0x1D));
    }
    lbl_0000066C();
    bitmap_free_group(BMP_TGT);
    func_80029788();
    lbl_802F1FD0 = 0;
}

void lbl_0000044C(void)
{
    if (!(lbl_802F1EE0 & 0xA))
        lbl_0000047C();
}

void lbl_0000047C(void)
{
    if (lbl_802F1FF4 != -1)
    {
        lbl_802F1FF6 = lbl_802F1FF4;
        lbl_802F1FF4 = -1;
    }
    lbl_0000C748[lbl_802F1FF6]();
}

extern u16 lbl_802F1FE4[];
extern u16 lbl_802F1FEC;
extern u32 lbl_80285A58[];
extern u16 lbl_80285A68[][3];
extern u16 lbl_80285A80[][6];  // struct or array? dunno


extern struct
{
    s8 unk0;
    u8 filler1[3];
    u32 unk4;
} lbl_802F1BFC;

// non-matching
// TODO: figure out types
void lbl_000004E0(void)
{
    u16 *r12;
    int i;  // r30
    int j;

    lbl_10000040 = 0;
    r12 = (u16 *)lbl_80285A80;
    lbl_802F1FD0 = lbl_802F1BFC.unk4;
    for (i = 0; i < 2*2; i++)
    {
        lbl_10000044[i] = 0;
        lbl_10000008[i] = 0;
        lbl_80285A58[i] = 0;  // r6
        lbl_802F1FE4[i] = 0;  // r9
        lbl_10000054[i] = i;
        lbl_1000005C[i] = i;
        
        //for (j = 0; j < 6; j++)
        //    lbl_80285A80[i][j] = 0;  // r12
        for (j = 0; j < 6; j++)
            r12[j] = 0;
        
        for (j = 0; j < 3; j++)
            lbl_80285A68[i][0] = 0;  // r31
        //lbl_80285A68[i][1] = 0;
        //lbl_80285A68[i][2] = 0;
        r12 += 6;
    }
    lbl_802F1FEC = 0;
    
    lbl_1000002C = -1;
    lbl_10000030 = -1;
    lbl_10000064 = lbl_802F1BFC.unk0;
    lbl_10000066 = 1;
    lbl_00000698();
}

/*
void lbl_000004E0(void)
{
    int i;  // r30

    lbl_10000040 = 0;
    lbl_802F1FD0 = lbl_802F1BFC.unk4;
    for (i = 0; i < 2*2; i++)
    {
        lbl_10000044[i] = 0;
        lbl_10000008[i] = 0;
        lbl_80285A58[i] = 0;  // r6
        lbl_802F1FE4[i] = 0;  // r9
        lbl_10000054[i] = 2;
        lbl_1000005C[i] = 2;
        
        lbl_80285A80[i][0] = 0;  // r12
        lbl_80285A80[i][1] = 0;  // r12
        lbl_80285A80[i][2] = 0;  // r12
        lbl_80285A80[i][3] = 0;  // r12
        lbl_80285A80[i][4] = 0;  // r12
        lbl_80285A80[i][5] = 0;  // r12
        
        lbl_80285A68[i][0] = 0;
        lbl_80285A68[i][1] = 0;
        lbl_80285A68[i][2] = 0;
    }
    
    lbl_1000002C = -1;
    lbl_10000030 = -1;
    lbl_10000064 = lbl_802F1BFC.unk0;
    lbl_10000066 = 1;
    lbl_00000698();
}
*/

void lbl_00000648(void)
{
    func_800249FC(3);
}

void lbl_0000066C(void)
{
    func_80024AB4();
    lbl_802F1FD4 = 0;
}

extern struct
{
    u8 filler0[0xF];
    u8 unkF;
} lbl_802BA200;

extern struct
{
    u32 unk0;
    u32 unk4;
} lbl_801EEC68;

void lbl_00000698(void)
{
    int i;

    event_clear();
    lbl_802F1FD0 &= 0x18;
    lbl_801EEC68.unk4 |= 2;
    lbl_802BA200.unkF = 0;
    load_stage(lbl_0000C740[lbl_10000040]);
    if (lbl_10000040 + 1 >= 3)
        preload_stage_files(lbl_0000C740[0]);
    else
        preload_stage_files(lbl_0000C740[lbl_10000040 + 1]);
    for (i = 0; i < 4; i++)
    {
        lbl_10000008[i] = lbl_10000044[i];
        lbl_80285A58[i] = 0;
        
        lbl_10000054[i] = lbl_1000005C[i];
        
    }
    lbl_10000036 = 0;
    lbl_802F1FF4 = 1;
}

struct StructC88C
{
    Vec unk0;
    s16 unkC;
};

struct StructC88C lbl_0000C88C[] =
{
    {{  5.8,    54,   286},  0},
    {{ -5.8,    54,   286},  0},
    {{    0,  46.9,   286},  2},
    {{    0,    50,    70},  2},
    {{    0,    70,   145},  2},
    {{    0,    80,   200},  2},
    {{  -15,  62.2, 304.9},  2},
    {{   15,  62.2, 304.9},  2},
    {{    0,     0,     0}, -1},
};

struct StructC88C lbl_0000C91C[] =
{
    {{    0,    50,  -330},  2},
    {{    0,    37,  -385},  2},
    {{    0,    43,  -505},  2},
    {{    0,    35,  -596},  2},
    {{  -78,    30,  -293},  2},
    {{   78,    30,  -293},  2},
    {{  -80,    30,  -575},  2},
    {{   80,    30,  -575},  2},
    {{  -26,    18,  -625},  2},
    {{   26,    18,  -625},  2},
    {{    0,     0,     0}, -1},
};

struct StructC88C lbl_0000C9CC[] =
{
    {{ -100,    60,    75},  2},
    {{  100,    60,    75},  2},
    {{ -172,    60,   -65},  2},
    {{  172,    60,   -65},  2},
    {{ -234,    35,  -489},  2},
    {{  234,    35,  -489},  2},
    {{ -150,    30,  -544},  2},
    {{  150,    30,  -544},  2},
    {{    0,     0,     0}, -1},
};

struct StructC88C lbl_0000CA5C[] =
{
    {{  -185,    58,     46},  2},
    {{   185,    58,     46},  2},
    {{  -338,    55,   -135},  2},
    {{   338,    55,   -135},  2},
    {{  -356,    40,   -395},  2},
    {{   356,    40,   -395},  2},
    {{  -271,    50,   -450},  2},
    {{   271,    50,   -450},  2},
    {{-181.5,    47,   -506},  2},
    {{ 181.5,    47,   -506},  2},
    {{     0,     0,      0}, -1},
};

struct StructC88C *lbl_0000CB0C[] =
{
    lbl_0000C91C,
    lbl_0000C9CC,
    lbl_0000CA5C,
};

struct Struct7B88
{
    u8 unkC[4];
    u16 unk10;
    s16 unk12;
    u8 filler14[0x2C-0x14];
    struct StructC88C unk2C;
    u8 filler3C[0x68-0x3C];
    u8 unk68;
    u8 filler6D[0x9C-0x6D];
};

void lbl_000007B8(void)
{
    struct Struct7B88 spC;
    struct StructC88C *r30;
    int i;
    
    memset(&spC, 0, sizeof(spC));
    spC.unk10 = 5;

    for (i = 0; lbl_0000C88C[i].unkC != -1; i++)
    {
        spC.unk2C.unk0 = lbl_0000C88C[i].unk0;
        spC.unk12 = lbl_0000C88C[i].unkC;
        spC.unk68 = 0;
        func_80068474(&spC);
    }

    r30 = lbl_0000CB0C[lbl_10000040];
    for (i = 0; r30[i].unkC != -1; i++)
    {
        spC.unk2C.unk0 = r30[i].unk0;
        spC.unk12 = r30[i].unkC;
        spC.unk68 = 0;
        func_80068474(&spC);
    }

    lbl_00000BFC();
}

void lbl_000008AC(void)
{
    struct Struct7B88 spC;
    int i;
    
    memset(&spC, 0, sizeof(spC));
    spC.unk10 = 5;
    spC.unk12 = 4;
    spC.unk68 = 0;
    
}
