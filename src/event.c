#include <dolphin.h>

#include "functions.h"
#include "variables.h"

struct UnkStruct lbl_80173CC8[] =
{
    {0, "MEMCARD",       (void *)0x800A3DE8, (void *)0x800A4050, (void *)0x800A428C, 0},
    {0, "STAGE",         (void *)0x80043A74, (void *)0x80043B48, (void *)0x80044104, 0},
    {0, "WORLD",         (void *)0x80042BD4, (void *)0x80042C4C, (void *)0x80042E84, 0},
    {0, "BALL",          (void *)0x80037B84, (void *)0x80038150, (void *)0x800387BC, 0},
    {0, "STOBJ",         (void *)0x8006AE20, (void *)0x8006AF44, (void *)0x8006B108, 0},
    {0, "ITEM",          (void *)0x80068048, (void *)0x800681E4, (void *)0x800682E0, 0},
    {0, "RECPLAY",       (void *)0x80048C44, (void *)0x80048C6C, (void *)0x80048E40, 0},
    {0, "OBJ_COLLISION", (void *)0x8006A624, (void *)0x8006A628, (void *)0x8006A654, 0},
    {0, "NAME_ENTRY",    (void *)0x800AD3AC, (void *)0x800AD644, (void *)0x800AE3E4, 0},
    {0, "INFO",          (void *)0x80022F58, (void *)0x8002303C, (void *)0x80023AD4, 0},
    {0, "COURSE",        (void *)0x80066910, (void *)0x80066964, (void *)0x80066C74, 0},
    {0, "VIBRATION",     (void *)0x800B5EDC, (void *)0x800B5F20, (void *)0x800B6094, 0},
    {0, "VIEW",          (void *)0x800A5734, (void *)0x800A5860, (void *)0x800A5AEC, 0},
    {0, "EFFECT",        (void *)0x8004CADC, (void *)0x8004CBD0, (void *)0x8004CCD0, 0},
    {0, "MINIMAP",       (void *)0x80084264, (void *)0x8008433C, (void *)0x8008468C, 0},
    {0, "CAMERA",        (void *)0x800178FC, (void *)0x80017990, (void *)0x80017FC8, 0},
    {0, "SPRITE",        (void *)0x8006FED8, (void *)0x8006FF70, (void *)0x80070028, 0},
    {0, "MOUSE",         (void *)0x80094CD4, (void *)0x80094CF8, (void *)0x80095020, 0},
    {0, "SOUND",         (void *)0x800298D8, (void *)0x80029AC4, (void *)0x8002A044, 0},
    {0, "BACKGROUND",    (void *)0x80054E04, (void *)0x80054F1C, (void *)0x80054F88, 0},
    {0, "REND_EFC",      (void *)0x8009523C, (void *)0x8009526C, (void *)0x80095314, 0},
};

extern void perf_init_timer(int);
extern int perf_stop_timer(int);
extern void func_8008D158();

void ev_run_init(int);
void ev_run_dest(int);

#pragma opt_findoptimalunrollfactor off
#pragma opt_unroll_count 1
void event_init(void)
{
    int i;
    for (i = 0; i < 21; i++)
        lbl_80173CC8[i].unk0 = 0;
}

#ifdef NONMATCHING
void event_main(void)
{
    int i;  // r30
    
    func_8008D158(0x00FFFFEF);
    for (i = 0; i < 21; i++)
    {
        perf_init_timer(5);
        switch (lbl_80173CC8[i].unk0)
        {
        case 1:
            ev_run_init(i);
        case 2:
            lbl_80173CC8[i].unkC();
            break;
        case 3:
            ev_run_dest(i);
            break;
        }
        lbl_80173CC8[i].unk14 = perf_stop_timer(5);
    }
    func_8008D158(0x00FFFFDF);
}
#else
asm void event_main(void)
{
    nofralloc
/* 8000B264 00007184  7C 08 02 A6 */	mflr r0
/* 8000B268 00007188  3C 60 01 00 */	lis r3, 0x00FFFFEF@ha
/* 8000B26C 0000718C  90 01 00 04 */	stw r0, 4(r1)
/* 8000B270 00007190  38 63 FF EF */	addi r3, r3, 0x00FFFFEF@l
/* 8000B274 00007194  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8000B278 00007198  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8000B27C 0000719C  93 C1 00 08 */	stw r30, 8(r1)
/* 8000B280 000071A0  48 08 1E D9 */	bl func_8008D158
/* 8000B284 000071A4  3C 60 80 17 */	lis r3, lbl_80173CC8@ha
/* 8000B288 000071A8  38 03 3C C8 */	addi r0, r3, lbl_80173CC8@l
/* 8000B28C 000071AC  7C 1F 03 78 */	mr r31, r0
/* 8000B290 000071B0  3B C0 00 00 */	li r30, 0
lbl_8000B294:
/* 8000B294 000071B4  38 60 00 05 */	li r3, 5
/* 8000B298 000071B8  48 01 BE 11 */	bl perf_init_timer
/* 8000B29C 000071BC  88 1F 00 00 */	lbz r0, 0(r31)
/* 8000B2A0 000071C0  7C 00 07 74 */	extsb r0, r0
/* 8000B2A4 000071C4  2C 00 00 02 */	cmpwi r0, 2
/* 8000B2A8 000071C8  41 82 00 28 */	beq lbl_8000B2D0
/* 8000B2AC 000071CC  40 80 00 10 */	bge lbl_8000B2BC
/* 8000B2B0 000071D0  2C 00 00 01 */	cmpwi r0, 1
/* 8000B2B4 000071D4  40 80 00 14 */	bge lbl_8000B2C8
/* 8000B2B8 000071D8  48 00 00 30 */	b lbl_8000B2E8
lbl_8000B2BC:
/* 8000B2BC 000071DC  2C 00 00 04 */	cmpwi r0, 4
/* 8000B2C0 000071E0  40 80 00 28 */	bge lbl_8000B2E8
/* 8000B2C4 000071E4  48 00 00 1C */	b lbl_8000B2E0
lbl_8000B2C8:  // case 1
/* 8000B2C8 000071E8  7F C3 F3 78 */	mr r3, r30
/* 8000B2CC 000071EC  48 00 00 5D */	bl ev_run_init
lbl_8000B2D0:  // case 2
/* 8000B2D0 000071F0  81 9F 00 0C */	lwz r12, 0xc(r31)
/* 8000B2D4 000071F4  7D 88 03 A6 */	mtlr r12
/* 8000B2D8 000071F8  4E 80 00 21 */	blrl
/* 8000B2DC 000071FC  48 00 00 0C */	b lbl_8000B2E8
lbl_8000B2E0:  // case 3
/* 8000B2E0 00007200  7F C3 F3 78 */	mr r3, r30
/* 8000B2E4 00007204  48 00 00 B1 */	bl ev_run_dest
lbl_8000B2E8:  // end
/* 8000B2E8 00007208  38 60 00 05 */	li r3, 5
/* 8000B2EC 0000720C  48 01 BD FD */	bl perf_stop_timer
/* 8000B2F0 00007210  3B DE 00 01 */	addi r30, r30, 1
/* 8000B2F4 00007214  90 7F 00 14 */	stw r3, 0x14(r31)
/* 8000B2F8 00007218  2C 1E 00 15 */	cmpwi r30, 0x15
/* 8000B2FC 0000721C  3B FF 00 18 */	addi r31, r31, 0x18
/* 8000B300 00007220  41 80 FF 94 */	blt lbl_8000B294
/* 8000B304 00007224  3C 60 01 00 */	lis r3, 0x00FFFFDF@ha
/* 8000B308 00007228  38 63 FF DF */	addi r3, r3, 0x00FFFFDF@l
/* 8000B30C 0000722C  48 08 1E 4D */	bl func_8008D158
/* 8000B310 00007230  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8000B314 00007234  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8000B318 00007238  83 C1 00 08 */	lwz r30, 8(r1)
/* 8000B31C 0000723C  7C 08 03 A6 */	mtlr r0
/* 8000B320 00007240  38 21 00 10 */	addi r1, r1, 0x10
/* 8000B324 00007244  4E 80 00 20 */	blr
}
#pragma peephole on
#endif

void ev_run_init(int a)
{
    if (lbl_80173CC8[a].unk0 != 0)
        ev_run_dest(a);
    lbl_80173CC8[a].unk8();
    lbl_80173CC8[a].unk0 = 2;
}

void ev_run_dest(int a)
{
    if (lbl_80173CC8[a].unk0 != 0)
    {
        lbl_80173CC8[a].unk10();
        lbl_80173CC8[a].unk0 = 0;
    }
}

void ev_suspend(int a)
{
    lbl_80173CC8[a].unk0 = 4;
}

void ev_restart(int a)
{
    if (lbl_80173CC8[a].unk0 == 4)
        lbl_80173CC8[a].unk0 = 2;
    else
        printf("ev_restart: event %s is not suspended\n", lbl_80173CC8[a].unk4);
}

void event_clear(void)
{
    struct UnkStruct *s = lbl_80173CC8;
    int i;

    for (i = 0; i < 21; i++, s++)
    {
        if (s->unk0 != 0 && lbl_80173CC8[i].unk0 != 0)
        {
            lbl_80173CC8[i].unk10();
            lbl_80173CC8[i].unk0 = 0;
        }
    }
}

void polydisp_init(void)
{
    func_8009AAB0();
}
