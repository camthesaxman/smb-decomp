#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#define MATHUTIL_SIN_INT_PARAM
#include "global.h"
#include "background.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "preview.h"

extern u8 lbl_801B86E4[];
extern int previewLoaded;

struct Struct80206D00
{
    void *unk0;
    u8 filler4[4];
    void (*unk8)();
    void (*unkC)();
    void *unk10;
    u8 filler14[4];
} lbl_80206D00[5];

struct Preview stagePreview;  // 78

struct Struct80206DEC lbl_80206DEC;

struct Struct80206E48 lbl_80206E48[0x48];  // 148

FORCE_BSS_ORDER(lbl_80206D00)
FORCE_BSS_ORDER(stagePreview)
FORCE_BSS_ORDER(lbl_80206DEC)

char *lbl_801B86D8[] =
{
    "GOAL",
    "GOAL_G",
    "GOAL_R",
};

void lbl_800457FC();
void lbl_80045A00();
int lbl_80045B54();

void ev_stage_init(void)
{
    lbl_80206DEC.unk0 = 0;
    lbl_80206DEC.unk8 = NULL;
    lbl_80206DEC.unk1C = 0;
    func_8004482C();
    switch (currStageId)
    {
    case 101:
        find_blur_bridge_accordion();
    }

    previewLoaded = FALSE;
    if (gameMode == MD_GAME && gameSubmode != SMD_GAME_NAMEENTRY_READY_INIT)
    {
        if (modeCtrl.unk28 == 0 || modeCtrl.unk28 == 1)
        {
            int r5 = func_800673BC();
            if (r5 > 0 && r5 <= 200)
            {
                preview_create_with_alloc_img(
                    &stagePreview,
                    "preview/140x140.tpl",
                    r5 - 1,
                    140,
                    140,
                    GX_TF_RGB5A3);
                g_preview_wait_then_do_something(&stagePreview);
                previewLoaded = TRUE;
            }
        }
    }
}

void ev_stage_main(void)
{
    struct Struct80206E48 *r30;
    struct DecodedStageLzPtr_child *r29;
    float f31;
    float f30;
    float f3;
    int i;

    if (gamePauseStatus & 0xA)
        return;
    if (lbl_801F3A58.unk0 & (1 << (31-0x17)))
    {
        if (modeCtrl.unk0 > 0x78)
            lbl_80206DEC.unk4 = 0.0f;
        else
            lbl_80206DEC.unk4 = 0x78 - modeCtrl.unk0;
        lbl_80206DEC.unk0 = 0x77;
    }
    else if (lbl_801F3A58.unk0 & (1 << (31-0x1B)))
    {
        lbl_80206DEC.unk4 = func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]);
        lbl_80206DEC.unk0 = lbl_80206DEC.unk4;
    }
    else
        lbl_80206DEC.unk4 = lbl_80206DEC.unk0;
    f31 = lbl_80206DEC.unk4 / 60.0;
    f31 += decodedStageLzPtr->unk0;
    f3 = (float)(decodedStageLzPtr->unk4 - decodedStageLzPtr->unk0);
    f31 -= f3 * (float)mathutil_floor_to_int(f31 / f3);
    f31 += decodedStageLzPtr->unk0;
    f30 = f31;
    if (decodedStageLzPtr->unk78 != 0)
    {
        int i;
        for (i = 0; i < 3; i++)
        {
            float *r5 = &lbl_80206DEC.unk10[i];
            float f3 = *r5;
            if (lbl_80206DEC.unkC & (1 << i))
            {
                f3 += 1.0;
                if (f3 > 50.0)
                    f3 = 50.0f;
            }
            else
            {
                f3 -= 1.0;
                if (f3 < 0.0)
                    f3 = 0.0f;
            }
            *r5 = f3;
        }
    }
    r30 = lbl_80206E48;
    r29 = decodedStageLzPtr->unkC;
    for (i = 0; i < decodedStageLzPtr->unk8; i++, r30++, r29++)
    {
        int j;
        struct DecodedStageLzPtr_child_child *r27 = r29->unk14;

        if (r27 == NULL2)
            continue;
        if (decodedStageLzPtr->unk78 != 0)
        {
            f31 = f30;
            for (j = 0; j < 3; j++)
            {
                if (r29->unk12 & (1 << j))
                {
                    f31 = lbl_80206DEC.unk10[j];
                    break;
                }
            }
        }
        if (r27->unk4 != NULL2)
        {
            r30->unk1E = r30->unk18;
            r30->unk18 = DEGREES_TO_S16(func_80043918(r27->unk0, r27->unk4, f31));
        }
        if (r27->unkC != NULL2)
        {
            r30->unk20 = r30->unk1A;
            r30->unk1A = DEGREES_TO_S16(func_80043918(r27->unk8, r27->unkC, f31));
        }
        if (r27->unk14 != NULL2)
        {
            r30->unk22 = r30->unk1C;
            r30->unk1C = DEGREES_TO_S16(func_80043918(r27->unk10, r27->unk14, f31));
        }
        if (r27->unk1C != NULL2)
        {
            r30->unkC.x = r30->unk0.x - r29->unkB8.x;
            r30->unk0.x = func_80043918(r27->unk18, r27->unk1C, f31);
        }
        if (r27->unk24 != NULL2)
        {
            r30->unkC.y = r30->unk0.y - r29->unkB8.y;
            r30->unk0.y = func_80043918(r27->unk20, r27->unk24, f31);
        }
        if (r27->unk2C != NULL2)
        {
            r30->unkC.z = r30->unk0.z - r29->unkB8.z;
            r30->unk0.z = func_80043918(r27->unk28, r27->unk2C, f31);
        }
        mathutil_mtxA_from_translate(&r30->unk0);
        mathutil_mtxA_rotate_z(r30->unk1C);
        mathutil_mtxA_rotate_y(r30->unk1A);
        mathutil_mtxA_rotate_x(r30->unk18 - r29->unkC);
        mathutil_mtxA_rotate_y(-r29->unkE);
        mathutil_mtxA_rotate_z(-r29->unk10);
        mathutil_mtxA_translate_neg(&r29->unk0);
        mathutil_mtxA_to_mtx(r30->unk24);
        mathutil_mtxA_from_translate(&r30->unkC);
        mathutil_mtxA_rotate_z(r30->unk22);
        mathutil_mtxA_rotate_y(r30->unk20);
        mathutil_mtxA_rotate_x(r30->unk1E - r29->unkC);
        mathutil_mtxA_rotate_y(-r29->unkE);
        mathutil_mtxA_rotate_z(-r29->unk10);
        mathutil_mtxA_translate_neg(&r29->unk0);
        mathutil_mtxA_to_mtx(r30->unk54);
    }
    if (lbl_80206DEC.unk8 != NULL)
        lbl_80206DEC.unk8();
    if (lbl_802F1F44 != NULL)
    {
        struct Struct802F1F44 *r27 = lbl_802F1F44;
        while (r27->unk0 != NULL)
        {
            memcpy(r27->unk14, r27->unk4, *r27->unk4[-1]);
            func_80047E18(r27->unk14, r27->unk8, r27->unkC);
            r27++;
        }
    }
    if (!(lbl_80206DEC.unk1C & 1))
        lbl_80206DEC.unk0++;
}

void ev_stage_dest(void)
{
    if (previewLoaded)
        preview_free(&stagePreview);
}

struct GMAModelHeader *stage_find_model(struct GMA *gma, char *name)
{
    struct GMAModelEntry *entry;
    int numModels;

    if (gma == NULL2)
        return NULL;
    entry = gma->modelEntries;
    numModels = gma->numModels;
    while (numModels > 0)
    {
        if (strcmp(entry->name, name) == 0)
            return entry->modelOffset;
        numModels--;
        entry++;
    }
    return NULL;
}

void find_blur_bridge_accordion(void)
{
    blurBridgeAccordion = stage_find_model(decodedStageGmaPtr, "MOT_STAGE101_BLUR");
}

void func_8004424C(void)
{
    float f31;
    float f30;
    struct Struct80206E48 *r31;
    struct DecodedStageLzPtr_child *r30;
    int i;

    if (blurBridgeAccordion == NULL2)
        return;
    f31 = lbl_80206DEC.unk4 / 60.0;
    f31 += (float)decodedStageLzPtr->unk0;
    f30 = (float)(decodedStageLzPtr->unk4 - decodedStageLzPtr->unk0);
    f31 -= f30 * (float)mathutil_floor_to_int(f31 / f30);
    f31 += (float)decodedStageLzPtr->unk0;
    r31 = lbl_80206E48 + 1;
    r30 = decodedStageLzPtr->unkC + 1;
    for (i = 1; i < decodedStageLzPtr->unk8; i++, r31++, r30++)
    {
        if (r30->unk7C > 0 && r30->unk14 != NULL2)
        {
            u32 r28;
            Vec sp10;
            float f27 = r31->unk0.x;

            f30 = f27;
            if (r30->unk14->unk1C != NULL2)
                f30 = func_80043918(r30->unk14->unk18, r30->unk14->unk1C, f31 - 0.5);
            mathutil_mtxA_from_mtx(mathutilData->mtxB);
            if (f30 < f27)
            {
                sp10.x = 0.5 * (f30 + f27) - 1.0;
                f30 = f27 - f30;
                r28 = 0;
            }
            else
            {
                sp10.x = 1.0 + 0.5 * (f30 + f27);
                f30 = f30 - f27;
                r28 = 1;
            }
            sp10.y = r31->unk0.y;
            sp10.z = r31->unk0.z;
            mathutil_mtxA_translate(&sp10);
            if (r28)
                mathutil_mtxA_rotate_y(-0x8000);
            mathutil_mtxA_scale_xyz(0.5 * f30, 1.0f, 1.0f);
            GXLoadPosMtxImm(mathutilData->mtxA, 0);
            GXLoadNrmMtxImm(mathutilData->mtxA, 0);
            g_avdisp_maybe_draw_model_1(blurBridgeAccordion);
        }
    }
}

void func_800444A4(float a)
{
    float f31;
    float f30;
    float f3;
    struct Struct80206E48 *r31;
    struct DecodedStageLzPtr_child *r30;
    struct DecodedStageLzPtr_child_child *r29;
    int i;

    if (gamePauseStatus & 0xA)
        return;
    lbl_80206DEC.unk4 = a;
    lbl_80206DEC.unk0 = a;
    f31 = lbl_80206DEC.unk4 / 60.0;
    f31 += decodedStageLzPtr->unk0;
    f3 = (float)(decodedStageLzPtr->unk4 - decodedStageLzPtr->unk0);
    f31 -= f3 * (float)mathutil_floor_to_int(f31 / f3);;
    f31 += decodedStageLzPtr->unk0;
    r31 = lbl_80206E48;
    r30 = decodedStageLzPtr->unkC;
    for (i = 0; i < decodedStageLzPtr->unk8; i++, r31++, r30++)
    {
        r29 = r30->unk14;
        if (r29 != NULL2)
        {
            if (r29->unk4 != NULL2)
            {
                r31->unk1E = r31->unk18;
                r31->unk18 = DEGREES_TO_S16(func_80043918(r29->unk0, r29->unk4, f31));
            }
            if (r29->unkC != NULL2)
            {
                r31->unk20 = r31->unk1A;
                r31->unk1A = DEGREES_TO_S16(func_80043918(r29->unk8, r29->unkC, f31));
            }
            if (r29->unk14 != NULL2)
            {
                r31->unk22 = r31->unk1C;
                r31->unk1C = DEGREES_TO_S16(func_80043918(r29->unk10, r29->unk14, f31));
            }
            if (r29->unk1C != NULL2)
            {
                r31->unkC.x = r31->unk0.x;
                r31->unk0.x = func_80043918(r29->unk18, r29->unk1C, f31);
            }
            if (r29->unk24 != NULL2)
            {
                r31->unkC.y = r31->unk0.y;
                r31->unk0.y = func_80043918(r29->unk20, r29->unk24, f31);
            }
            if (r29->unk2C != NULL2)
            {
                r31->unkC.z = r31->unk0.z;
                r31->unk0.z = func_80043918(r29->unk28, r29->unk2C, f31);
            }
            mathutil_mtxA_from_translate(&r31->unk0);
            mathutil_mtxA_rotate_z(r31->unk1C);
            mathutil_mtxA_rotate_y(r31->unk1A);
            mathutil_mtxA_rotate_x(r31->unk18 - r30->unkC);
            mathutil_mtxA_rotate_y(-r30->unkE);
            mathutil_mtxA_rotate_z(-r30->unk10);
            mathutil_mtxA_translate_neg(&r30->unk0);
            mathutil_mtxA_to_mtx(r31->unk24);
            mathutil_mtx_copy(r31->unk54, r31->unk24);
        }
    }
}

//extern u8 lbl_800457FC[];
//extern u8 lbl_80045A00[];
//extern u8 lbl_80045B54[];

void func_80044794(void)
{
    struct Struct80206D00 *r6;
    struct
    {
        u8 filler0[0x5C];
        s8 unk5C;
        u8 filler65[0xC9-0x5D];
    } sp8;

    memset(&sp8, 0, sizeof(sp8));
    r6 = &lbl_80206D00[sp8.unk5C];
    r6->unk0 = "SHAPE_STAGE134";
    r6->unk8 = lbl_800457FC;
    r6->unkC = lbl_80045A00;
    r6->unk10 = lbl_80045B54;
    sp8.unk5C++;
    lbl_80206D00[sp8.unk5C].unk0 = NULL;
}

void func_8004482C(void)
{
    struct Struct80206E48* r31;
    struct DecodedStageLzPtr_child *r30;
    int i;

    r31 = lbl_80206E48;
    r30 = decodedStageLzPtr->unkC;
    for (i = 0; i < 0x48; i++, r31++, r30++)
    {
        r31->unk0.x = r30->unk0.x;
        r31->unk0.y = r30->unk0.y;
        r31->unk0.z = r30->unk0.z;
        r31->unkC.x = r30->unk0.x - r30->unkB8.x;
        r31->unkC.y = r30->unk0.y - r30->unkB8.y;
        r31->unkC.z = r30->unk0.z - r30->unkB8.z;
        r31->unk18 = r30->unkC;
        r31->unk1A = r30->unkE;
        r31->unk1C = r30->unk10;
        r31->unk1E = r30->unkC;
        r31->unk20 = r30->unkE;
        r31->unk22 = r30->unk10;
        mathutil_mtxA_from_identity();
        mathutil_mtxA_to_mtx(r31->unk24);
        mathutil_mtxA_translate_neg(&r30->unkB8);
        mathutil_mtxA_to_mtx(r31->unk54);
    }
}

void func_80044920(void) {}

void load_stage(int stageId)
{
    s8 stageEvState = eventInfo[EVENT_STAGE].state;
    s8 bgEvState = eventInfo[EVENT_BACKGROUND].state;
    int newBG = FALSE;

    if (stageEvState != EV_STATE_INACTIVE)
        ev_run_dest(EVENT_STAGE);
    if (bgEvState != EV_STATE_INACTIVE)
        ev_run_dest(EVENT_BACKGROUND);
    if (lbl_802F0998 != stageId)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(memHeap2);

        if (decodedStageTplPtr != NULL || decodedStageGmaPtr != NULL)
        {
            VISetNextFrameBuffer(lbl_802F1CA4[0]);
            VIWaitForRetrace();
        }
        if (decodedStageTplPtr != NULL)
        {
            free_tpl(decodedStageTplPtr);
            decodedStageTplPtr = NULL;
        }
        if (decodedStageGmaPtr != NULL)
        {
            free_gma(decodedStageGmaPtr);
            decodedStageGmaPtr = NULL;
        }
        free_nlobj(&naomiStageObj, &naomiStageTpl);
        func_800472E8();

        OSSetCurrentHeap(oldHeap);
    }
    if (backgroundInfo.bgId != get_stage_background(stageId))
    {
        func_8005507C();
        newBG = TRUE;
    }
    load_stage_files(stageId);
    load_bg_files(get_stage_background(stageId));
    if (lbl_802F0998 != stageId || newBG)
    {
        lbl_802F1F48 = decodedStageLzPtr->unk8 < 0x48 ? decodedStageLzPtr->unk8 : 0x48;
        if (gamePauseStatus & (1 << (31-0x1D)))
            printf("========== st%03d ============\n", stageId);
        func_80044E18();
        func_80045194();
        func_80084794(lbl_80209368);
        func_800456A8(stageId);
        func_80045E98();
        lbl_802F0998 = stageId;
    }
    func_80021DB4(stageId);
    func_8009AAB0();
    currStageId = stageId;
    if (stageEvState != EV_STATE_INACTIVE)
        ev_run_init(EVENT_STAGE);
    if (bgEvState != EV_STATE_INACTIVE)
        ev_run_init(EVENT_BACKGROUND);
}

void unload_stage(void)
{
    if (lbl_802F0998 != -1)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(memHeap2);

        if (decodedStageTplPtr != NULL || decodedStageGmaPtr != NULL)
        {
            VISetNextFrameBuffer(lbl_802F1CA4[0]);
            VIWaitForRetrace();
        }
        if (decodedStageTplPtr != NULL)
        {
            free_tpl(decodedStageTplPtr);
            decodedStageTplPtr = NULL;
        }
        if (decodedStageGmaPtr != NULL)
        {
            free_gma(decodedStageGmaPtr);
            decodedStageGmaPtr = NULL;
        }
        free_nlobj(&naomiStageObj, &naomiStageTpl);
        func_800472E8();

        OSSetCurrentHeap(oldHeap);

        lbl_802F0998 = -1;
    }
    func_8005507C();
}

u8 arcadeStages[] =
{
    10, 19, 20, 30, 49, 50, 60, 70, 80, 92, 96, 97, 98, 99, 100, 114, 115, 116,
    117, 118, 119, 120,
    0xFF,
};

static inline int is_arcade_stage(int stageId)
{
    u8 *pStageId = arcadeStages;
    while (*pStageId != 0xFF)
    {
        if (*pStageId == stageId)
            return TRUE;
        pStageId++;
    }
    return FALSE;
}

void preload_stage_files(int stageId)
{
    char stageDir[0x100];
    char gmaName[0x100];
    char tplName[0x100];
    char stageLzName[0x100];

    func_80055164(func_80045E4C(stageId));
    sprintf(stageDir, "st%03d", stageId);
    DVDChangeDir(stageDir);
    sprintf(stageLzName, "STAGE%03d.lz", stageId);
    file_preload(stageLzName);
    sprintf(gmaName, "st%03d.gma", stageId);
    sprintf(tplName, "st%03d.tpl", stageId);
    if (stageId != 190)
    {
        file_preload(gmaName);
        file_preload(tplName);
    }
    if (is_arcade_stage(stageId))
    {
        sprintf(gmaName, "st%03d_p.lz", stageId);
        sprintf(tplName, "st%03d.lz", stageId);
        file_preload(gmaName);
        file_preload(tplName);
    }
    DVDChangeDir("/test");
}

extern int lbl_802F099C;

void load_stage_files(int stageId)
{
    char stageDir[0x100];
    char gmaName[0x100];
    char tplName[0x100];

    if (lbl_802F0998 != stageId)
    {
        OSHeapHandle oldHeap;

        lbl_802F099C = stageId;
        sprintf(stageDir, "st%03d", stageId);
        DVDChangeDir(stageDir);
        oldHeap = OSSetCurrentHeap(memHeap2);
        load_stagedef(stageId);
        if (stageId != 190)
        {
            sprintf(gmaName, "st%03d.gma", stageId);
            sprintf(tplName, "st%03d.tpl", stageId);
            decodedStageTplPtr = load_tpl(tplName);
            decodedStageGmaPtr = load_gma(gmaName, decodedStageTplPtr);
        }
        if (is_arcade_stage(stageId))
        {
            sprintf(gmaName, "st%03d_p.lz", stageId);
            sprintf(tplName, "st%03d.lz", stageId);
            load_nlobj(&naomiStageObj, &naomiStageTpl, gmaName, tplName);
        }
        OSSetCurrentHeap(oldHeap);
        DVDChangeDir("/test");
    }
}

struct Struct802099E8
{
    void *unk0;
    void *unk4;
    u32 unk8;
};

struct Struct80209488
{
    s32 unk0;
    u8 filler4[4];
    Vec unk8;
    /*
    float unk8;  // Vec
    float unkC;
    float unk10;
    */
    float unk14;
};

u32 lbl_80209368[0x48];
struct Struct80209488 *lbl_80209488[0x48];
u32 lbl_802095A8[0x110];
struct Struct802099E8 lbl_802099E8[0x48];
struct Struct802099E8 lbl_80209D48[0x80];

struct Struct8020A348_child
{
    u32 unk0;
    struct Struct80209488 *unk4;
    u8 filler8[4];
};  // size = 0xC

struct Struct8020A348
{
    struct Struct8020A348_child *unk0;
    s32 unk4;
};

struct Struct8020A348 lbl_8020A348[0x108];  //0x3648
struct Struct8020A348 lbl_8020AB88[0x48];  // 0x3E88
u8 lbl_8020ADC8[0xC];
Quaternion lbl_8020ADD4;

FORCE_BSS_ORDER(lbl_80209368)
FORCE_BSS_ORDER(lbl_80209488)
FORCE_BSS_ORDER(lbl_802095A8)
FORCE_BSS_ORDER(lbl_802099E8)
FORCE_BSS_ORDER(lbl_80209D48)
FORCE_BSS_ORDER(lbl_8020A348)
FORCE_BSS_ORDER(lbl_8020AB88)
FORCE_BSS_ORDER(lbl_8020ADC8)
FORCE_BSS_ORDER(lbl_8020ADD4)

struct NaomiObj **lbl_801B8794[] = {(struct NaomiObj **)&naomiStageObj, (struct NaomiObj **)&naomiCommonObj, NULL};

struct Struct80044E18
{
    u8 filler0[4];
    char **unk4[];
};

struct Struct80044E18_2  // r17_
{
    u32 unk0;
    u32 unk4;
    float unk8;
};

extern u32 lbl_802F1F4C;
extern u32 lbl_802F1F50;
extern char lbl_802F09C8;

#ifdef NONMATCHING
/*
void func_80044E18(void)
{
    char sp10[0xFC];
    u32 **r31;
    int j;  // r31
    int k;  // r23
    struct DecodedStageLzPtr_child *r22;
    int i;  // r20
    struct DecodedStageLzPtr_child2 *r18;
    u32 *r17 = lbl_80209488;
    struct Struct80044E18_2 *r17_;
    u32 *r30 = lbl_80209368;
    int r30_;
    u32 *r29 = lbl_802095A8;
    int r19 = 0;
    struct DecodedStageLzPtr_child *r5;
    int r4;

    lbl_802F1F50 = 0;
    r22 = decodedStageLzPtr->unkC;
    for (i = 0; i < lbl_802F1F48; i++, r22++)
    {
        struct DecodedStageLzPtr_child_child2 *r21;
        char *r4;

        lbl_802099E8[i].unk0 = r22;
        lbl_802099E8[i].unk4 = r30;
        lbl_802099E8[i].unk8 = 0;
        r21 = r22->unk18;
        while (r21->unk0 != NULL)
        {
            u32 **r18 = NULL;

            strncpy(sp10, r21->unk0, 0xFC);
            strncat(sp10, "_MAP", 0x100);
            r31 = NULL;
            for (j = 0; lbl_801B8794[j] != NULL; j++)
            {
                struct Struct80044E18 *r3 = *lbl_801B8794[j];
                if (r3 != NULL)
                {
                    for (k = 0; r3->unk4[k] != 0; k++)
                    {
                        if (strcmp(r21->unk0, r3->unk4[k][-2] + 4) == 0)
                        {
                            r18 = (void *)r3->unk4[k];
                            break;  //to lbl_80044F00
                        }
                        //lbl_80044EEC
                    }
                }
                //lbl_80044F00
                //addi r24, r24, 4
            }
            //80044F10
            //lbl_80044F18 loop
            for (j = 0; lbl_801B8794[j] != NULL; j++)
            {
                struct Struct80044E18 *r3 = *lbl_801B8794[j];
                if (r3 != NULL)
                {
                    for (k = 0; r3->unk4[k] != 0; k++)
                    {
                        if (strcmp(r21->unk0, r3->unk4[k][-2] + 4) == 0)
                        {
                            r31 = (void *)r3->unk4[k];
                            break;  //to lbl_80044F70
                        }
                    }
                }
                //lbl_80044F70
            }
            if (r31 == NULL)
                r31 = r18;
            //lbl_80044F8C
            if (r31 != NULL)
            {
                *r30++ = (u32)r31;
                if (r31 != r18)
                    *r29++ = (u32)r31;
            }
            //lbl_80044FAC
            if (r18 != NULL)
            {
                *r17++ = (u32)r18;
                //r17->unk0 = (u32)r18;
                //r17 = (void *)((u8 *)r17 + 4);
                r19++;
                *r29++ = (u32)r18;
                lbl_802F1F50 = (u32)*r18[-1];
                lbl_802099E8[i].unk8++;
                if (r19 >= 0x47)
                    break;
            }
        }
        //lbl_80045000
    }
    //80045018
    *r17 = 0;
    *r30 = 0;
    r17_ = (void *)lbl_80209D48;
    r30_ = decodedStageLzPtr->unk58 < 0x80 ? decodedStageLzPtr->unk58 : 0x80;
    lbl_802F1F4C = 0;
    // i : r26
    r18 = decodedStageLzPtr->unk5C;
    for (i = 0; i < r30_; i++)
    {
        int r19;
        //lbl_80045050
        r31 = NULL;
        r19 = 0;
        for (j = 0; lbl_801B8794[j] != NULL; j++)
        {
            struct Struct80044E18 *r3 = *lbl_801B8794[j];
            if (r3 != NULL)
            {
                for (k = 0; r3->unk4[k] != NULL; k++)
                {
                    int asdf = func_800457B8(r18->unk4 + 4, r3->unk4[k][-2]);
                    if (asdf > r19)
                    {
                        r19 = asdf;
                        r31 = (void *)r3->unk4[k];
                    }
                }
            }
        }
        //800450C0
        r17_->unk0 = r18->unk0;
        r17_->unk8 = r18->unk8;
        if (r31 != 0)
        {
            r17_->unk4 = (u32)r31;
            *r29++ = (u32)r31;
            if ((r17_->unk0 & 3) == 1)
                lbl_802F1F4C += *r31[-1];
        }
        //lbl_8004510C
        else
            r17_->unk4 = 0;
    }
    //80045128
    // i = r6?
    r4 = 0;
    i = 0;
    r5 = decodedStageLzPtr->unkC;
    //for (i = 0; i < lbl_802F1F48; i++)
    while (i < lbl_802F1F48)
    {
        lbl_8020A348[i].unk0 = &lbl_80209D48[r4];
        lbl_8020A348[i].unk4 = r5->unk7C;
        r4 += r5->unk7C;
        i++;
        r5++;
    }
    *r29 = 0;
}
*/
#else
asm void func_80044E18(void)
{
    nofralloc
#include "../asm/nonmatchings/func_80044E18.s"
}
#pragma peephole on
#endif

extern u32 lbl_802F1F34;
extern char lbl_802F09D0[4];

#ifndef NONMATCHING
asm void func_80045194(void)
{
    nofralloc
#include "../asm/nonmatchings/func_80045194.s"
}
#pragma peephole on
#endif

struct Struct801B87A0_child_child
{
    u32 unk0;
    char *unk4;
    //u8 filler4[4];
};

struct Struct801B87A0_child
{
    s32 unk0;
    u8 filler4[4];
    struct GMAModelEntry *unk8;
};

struct Struct801B87A0
{
    struct GMA *unk0;
};

struct GMA **lbl_801B87A0[3] = {&decodedStageGmaPtr, &decodedBgGma, NULL};

inline struct GMAModelHeader *find_model_in_gma_list(struct GMA ***list, char *name)
{
    struct GMAModelHeader *model = NULL;
    int i;

    while (*list != NULL)
    {
        if (**list != NULL)
        {
            for (i = 0; i < (int)(**list)->numModels; i++)
            {
                if (strcmp(name, (**list)->modelEntries[i].name) == 0)
                    model = (**list)->modelEntries[i].modelOffset;
            }
        }
        list++;
    }
    return model;
}

struct GMAModelHeader *func_800455FC(char *name)
{
    return find_model_in_gma_list(lbl_801B87A0, name);
}

struct Struct802F0990
{
    s32 unk0;
    void *unk4;
};

extern struct Struct802F0990 lbl_802F0990[1];  // huh?

struct NaomiModelHeader_child
{
    u32 unk0;
};

struct NaomiModelHeader
{
    s8 *unk0;
    struct NaomiModelHeader_child *unk4;
};

int func_800457B8(s8 *, s8 *);

#define HEADER_OF(model) ((struct NaomiModelHeader *)((u8 *)model - 8))

void func_800456A8(int stageId)
{
    int r5;
    struct Struct802F0990 *r6;
    struct Struct802F1F44 *r28;
    int i;
    u8 *r31;

    r6 = &lbl_802F0990[0];
    r5 = 1;
    r31 = (u8 *)lbl_802F1B4C + 0x10000;
    if (lbl_802F0990[0].unk0 != stageId)
    {
        r5 = 0;
        r6++;
    }
    if (r5 <= 0)
    {
        lbl_802F1F44 = NULL;
        return;
    }
    lbl_802F1F44 = r6->unk4;
    r28 = lbl_802F1F44;
    while (r28->unk0 != NULL)
    {
        int r27;
        struct NaomiModel *r26;
        struct NaomiObj ***r25;

        r26 = NULL;
        r27 = 0;
        r25 = &lbl_801B8794[0];
        while (*r25 != NULL)
        {
            struct NaomiObj *nobj = **r25;
            if (nobj != NULL)
            {
                struct NaomiModel **modelPtrs = nobj->modelPtrs;
                for (i = 0; modelPtrs[i] != NULL; i++)
                {
                    int var = func_800457B8(r28->unk0, HEADER_OF(modelPtrs[i])->unk0 + 4);
                    if (var > r27)
                    {
                        r27 = var;
                        r26 = modelPtrs[i];
                    }
                }
                r28->unk4 = (void *)r26;
                if (r26 != NULL)
                {
                    r31 -= HEADER_OF(r26)->unk4->unk0;
                    r28->unk14 = r31;
                }
            }
            r25++;
        }
        r28++;
    }
}

int func_800457B8(s8 *a, s8 *b)
{
    int i = 0;
    while (*a == *b)
    {
        i++;
        if (*a == 0 || *b == 0)
            break;
        a++;
        b++;
    }
    return i;
}

struct Struct800457FC
{
    Vec unk0;
    Vec unkC;
    u8 filler18[8];
};

void lbl_800457FC(struct Struct800457FC *a)
{
    struct Struct800457FC sp18 = *a;
    float f1;
    float f31;
    float f2;
    int angle;
    Vec spC;

    f1 = mathutil_sqrt(sp18.unk0.x * sp18.unk0.x + sp18.unk0.z * sp18.unk0.z);
    f31 = 0.5 + -0.030833333333333333 * f1;
    f2 = -1092.0f;
    f2 *= (lbl_80206DEC.unk4 - 30.0f);
    angle = 16384.0 * f1;
    angle = f2 + angle;
    if (angle > 0)
        return;
    spC.x = sp18.unk0.x;
    spC.y = 0.0f;
    spC.z = sp18.unk0.z;
    sp18.unk0.y += mathutil_sin(angle) * f31;
    mathutil_vec_set_len(&spC, &spC, -(mathutil_cos(angle) * f31));
    if (angle > -16384)
    {
        float f0 = angle * -6.103515625e-05f;
        spC.x *= f0;
        spC.z *= f0;
    }
    sp18.unkC.x += spC.x;
    sp18.unkC.z += spC.z;
    mathutil_vec_normalize_len(&sp18.unkC);
    *a = sp18;
}

void lbl_80045A00(struct Struct800457FC *a)
{
    struct Struct800457FC spC = *a;
    float f1;
    float f31;
    float f2;
    int angle;

    f1 = mathutil_sqrt(spC.unk0.x * spC.unk0.x + spC.unk0.z * spC.unk0.z);
    f31 = 0.5 + -0.030833333333333333 * f1;
    f2 = -1092.0f;
    f2 *= (lbl_80206DEC.unk4 - 30.0f);
    angle = 16384.0 * f1;
    angle = f2 + angle;
    if (angle > 0)
        return;
    spC.unk0.y += mathutil_sin(angle) * f31;
    *a = spC;
}

struct Struct80045B54_1
{
    Vec unk0;
};

#define lbl_802F3760 0.5
#define lbl_802F3770 -0.030833333333333333
#define lbl_802F3778 -1092.0f
#define lbl_802F377C 30.0f
#define lbl_802F3780 16384.0

static inline float sum_of_3_sq(register float a, register float b, register float c)
{
#ifdef __MWERKS__
    asm
    {
        fmuls a, a, a
        fmadds a, b, b, a
        fmadds a, c, c, a
    }
    return a;
#else
    return a * a + b * b + c * c;
#endif
}

int lbl_80045B54(Vec *a, Vec *b, Vec *c)
{
    float f1;
    float f31;
    float f2;
    int r3;
    int angle;
    Vec sp14;

    if (a->x < -10.01 || a->x > 10.01)
        return 0;
    if (a->z < -10.01 || a->z > 10.01)
        return 0;

    f1 = mathutil_sqrt(a->x * a->x + a->z * a->z);
    f31 = 0.5 + -0.030833333333333333 * f1;
    f2 = -1092.0f;
    f2 *= (lbl_80206DEC.unk4 - 30.0f);
    r3 = 16384.0 * f1;
    angle = f2 + r3;
    if (angle > 0)
    {
        b->x = a->x;
        b->y = 0.0f;
        b->z = a->z;
        if (c != NULL)
        {
            c->x = 0.0f;
            c->y = 1.0f;
            c->z = 0.0f;
        }
        return 1;
    }
    b->x = a->x;
    b->y = mathutil_sin(angle) * f31;
    b->z = a->z;
    if (c != NULL)
    {
        float f2;

        c->x = 0.0f;
        c->y = 1.0f;
        c->z = 0.0f;
        sp14.x = a->x;
        sp14.z = a->z;
        f1 = mathutil_sum_of_sq(sp14.x, sp14.z);
        if (f1 <= 1.19209289550781e-07f)
            return 1;
        f2 = -(mathutil_cos(angle) * f31) * mathutil_rsqrt(f1);
        sp14.x *= f2;
        sp14.z *= f2;
        sp14.y = 1.0f;
        f1 = sum_of_3_sq(sp14.x, sp14.y, sp14.z);
        if (f1 <= 1.19209289550781e-07f)
            return 1;
        f2 = mathutil_rsqrt(f1);
        sp14.x *= f2;
        sp14.y *= f2;
        sp14.z *= f2;
        c->x = sp14.x;
        c->y = sp14.y;
        c->z = sp14.z;
    }
    return 1;
}

int get_stage_background(int stageId)
{
    int bg;

    if (gameSubmode == SMD_GAME_ENDING_INIT)
    {
        switch (modeCtrl.unk4)
        {
        case 0:
            bg = 1;
            break;
        case 1:
            bg = 3;
            break;
        case 2:
        default:
            bg = 2;
            break;
        }
    }
    else
        bg = stageBackgrounds[stageId];

    if (bg < 0)
        bg = 0;
    else if (bg > 27)
        bg = 27;
    return bg;
}

int func_80045E4C(int stageId)
{
    int bg;
    int backup = lbl_801F3A58.unk20;

    lbl_801F3A58.unk20++;
    bg = get_stage_background(stageId);
    lbl_801F3A58.unk20 = backup;
    return bg;
}

void func_80045E98(void)
{
    Vec sp20;
    Vec sp14;
    Vec sp8;
    unsigned int r4 = FALSE;

    if (decodedStageLzPtr->unk5C == NULL2)
    {
        struct Struct80209488 **r3 = lbl_80209488;

        while (*r3 != NULL)
        {
            struct Struct80209488 *r5 = *r3;

            if (r5 != NULL2 && r5->unk0 >= 0)
            {
                if (!r4)
                {
                    r4 = TRUE;
                    sp20.x = r5->unk8.x - r5->unk14;
                    sp20.y = r5->unk8.y - r5->unk14;
                    sp20.z = r5->unk8.z - r5->unk14;

                    sp14.x = r5->unk8.x + r5->unk14;
                    sp14.y = r5->unk8.y + r5->unk14;
                    sp14.z = r5->unk8.z + r5->unk14;
                }
                else
                {
                    if (r5->unk8.x - r5->unk14 < sp20.x)
                        sp20.x = r5->unk8.x - r5->unk14;
                    if (r5->unk8.y - r5->unk14 < sp20.y)
                        sp20.y = r5->unk8.y - r5->unk14;
                    if (r5->unk8.z - r5->unk14 < sp20.z)
                        sp20.z = r5->unk8.z - r5->unk14;

                    if (r5->unk8.x + r5->unk14 > sp14.x)
                        sp14.x = r5->unk8.x + r5->unk14;
                    if (r5->unk8.y + r5->unk14 > sp14.y)
                        sp14.y = r5->unk8.y + r5->unk14;
                    if (r5->unk8.z + r5->unk14 > sp14.z)
                        sp14.z = r5->unk8.z + r5->unk14;
                }
            }
            r3++;
        }
    }
    else if (decodedStageGmaPtr == NULL2)
    {
        struct Struct8020A348 *r3 = lbl_8020A348;
        int i;

        for (i = 0; i < lbl_802F1F48; i++, r3++)
        {
            struct Struct8020A348_child *r5 = r3->unk0;
            int r6;
            for (r6 = 0; r6 < r3->unk4; r6++, r5++)
            {
                struct Struct80209488 *r7 = r5->unk4;

                if (r7 != NULL2 && r7->unk0 >= 0)
                {
                    if (!r4)
                    {
                        r4 = TRUE;
                        sp20.x = r7->unk8.x - r7->unk14;
                        sp20.y = r7->unk8.y - r7->unk14;
                        sp20.z = r7->unk8.z - r7->unk14;

                        sp14.x = r7->unk8.x + r7->unk14;
                        sp14.y = r7->unk8.y + r7->unk14;
                        sp14.z = r7->unk8.z + r7->unk14;
                    }
                    else
                    {
                        if (r7->unk8.x - r7->unk14 < sp20.x)
                            sp20.x = r7->unk8.x - r7->unk14;
                        if (r7->unk8.y - r7->unk14 < sp20.y)
                            sp20.y = r7->unk8.y - r7->unk14;
                        if (r7->unk8.z - r7->unk14 < sp20.z)
                            sp20.z = r7->unk8.z - r7->unk14;

                        if (r7->unk8.x + r7->unk14 > sp14.x)
                            sp14.x = r7->unk8.x + r7->unk14;
                        if (r7->unk8.y + r7->unk14 > sp14.y)
                            sp14.y = r7->unk8.y + r7->unk14;
                        if (r7->unk8.z + r7->unk14 > sp14.z)
                            sp14.z = r7->unk8.z + r7->unk14;
                    }
                }
            }
        }
    }
    else
    {
        struct Struct8020A348 *r3 = lbl_8020AB88;
        int i;

        for (i = 0; i < lbl_802F1F48; i++, r3++)
        {
            struct Struct8020A348_child *r5 = r3->unk0;
            int r6;

            for (r6 = 0; r6 < r3->unk4; r6++, r5++)
            {
                struct Struct80209488 *r7 = r5->unk4;

                if (r7 != NULL2)
                {
                    if (!r4)
                    {
                        r4 = TRUE;
                        sp20.x = r7->unk8.x - r7->unk14;
                        sp20.y = r7->unk8.y - r7->unk14;
                        sp20.z = r7->unk8.z - r7->unk14;

                        sp14.x = r7->unk8.x + r7->unk14;
                        sp14.y = r7->unk8.y + r7->unk14;
                        sp14.z = r7->unk8.z + r7->unk14;
                    }
                    else
                    {
                        if (r7->unk8.x - r7->unk14 < sp20.x)
                            sp20.x = r7->unk8.x - r7->unk14;
                        if (r7->unk8.y - r7->unk14 < sp20.y)
                            sp20.y = r7->unk8.y - r7->unk14;
                        if (r7->unk8.z - r7->unk14 < sp20.z)
                            sp20.z = r7->unk8.z - r7->unk14;

                        if (r7->unk8.x + r7->unk14 > sp14.x)
                            sp14.x = r7->unk8.x + r7->unk14;
                        if (r7->unk8.y + r7->unk14 > sp14.y)
                            sp14.y = r7->unk8.y + r7->unk14;
                        if (r7->unk8.z + r7->unk14 > sp14.z)
                            sp14.z = r7->unk8.z + r7->unk14;
                    }
                }
            }
        }
    }

    if (r4)
    {
        lbl_8020ADD4.x = (sp14.x + sp20.x) * 0.5;
        lbl_8020ADD4.y = (sp14.y + sp20.y) * 0.5;
        lbl_8020ADD4.z = (sp14.z + sp20.z) * 0.5;

        sp8.x = (sp14.x - sp20.x) * 0.5;
        sp8.y = (sp14.y - sp20.y) * 0.5;
        sp8.z = (sp14.z - sp20.z) * 0.5;
        lbl_8020ADD4.w = mathutil_sqrt(sum_of_3_sq(sp8.x, sp8.y, sp8.z));//mathutil_vec_mag(&sp8);
    }
    else
    {
        lbl_8020ADD4.x = 0.0f;
        lbl_8020ADD4.y = 0.0f;
        lbl_8020ADD4.z = 0.0f;
        lbl_8020ADD4.w = 50.0f;
    }
}

extern const float lbl_802F37A4;
extern const float lbl_802F37A8;

#ifdef NONMATCHING
// https://decomp.me/scratch/KDeDa
void func_800463E8(Vec *a, float *b)
{
    u8 unused[24];
    Vec v;
    Vec sp40;
    Vec sp34;
    Vec sp28;
    Vec sp1C;
    Vec sp10;
    float result;
    float f28 = 0.0f;
    float f30 = 0.0f;
    float f29 = 0.0f;
    float f27 = 0.0f;
    float f31 = 0.0f;
    float f26 = 0.0f;

    if (decodedStageGmaPtr != NULL)
    {
        struct Struct80206E48 *iter1 = lbl_80206E48;
        struct Struct8020A348 *iter2 = lbl_8020AB88;
        int j;
        int i;

        for (i = 0; i < lbl_802F1F48; i++, iter2++, iter1++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(iter1->unk24);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->unk0 & 3) == 1 && iter3->unk4 != NULL)
                {
                    float f;
                    struct Struct80209488 *r28 = iter3->unk4;

                    mathutil_mtxA_tf_point(&r28->unk8, &sp34);
                    f = r28->unk14;
                    v.x = sp34.x - f;
                    v.y = sp34.y - f;
                    v.z = sp34.z - f;
                    if (f28 > v.x)
                        f28 = v.x;
                    if (f30 > v.y)
                        f30 = v.y;
                    if (f29 > v.z)
                        f29 = v.z;

                    v.x = sp34.x + f;
                    v.y = sp34.y + f;
                    v.z = sp34.z + f;
                    if (f27 < v.x)
                        f27 = v.x;
                    if (f31 < v.y)
                        f31 = v.y;
                    if (f26 < v.z)
                        f26 = v.z;
                }
            }
        }
        sp40.x = (f28 + f27) * lbl_802F37A4;
        sp40.y = (f30 + f31) * lbl_802F37A4;
        sp40.z = (f29 + f26) * lbl_802F37A4;

        result = 0.0f;
        iter1 = lbl_80206E48;
        iter2 = lbl_8020AB88;
        for (i = 0; i < lbl_802F1F48; i++, iter2++, iter1++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(iter1->unk24);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->unk0 & 3) == 1)
                {
                    float f28;
                    float f0;
                    struct Struct80209488 *r28 = iter3->unk4;

                    if (iter3->unk4 == NULL)
                        continue;
                    mathutil_mtxA_tf_point(&r28->unk8, &sp28);
                    f28 = r28->unk14;
                    f0 = f28 + mathutil_sqrt((sp40.x - sp28.x) * (sp40.x - sp28.x) + (sp40.z - sp28.z) * (sp40.z - sp28.z));
                    if (result < f0)
                        result = f0;
                }
            }
        }
        result *= lbl_802F37A8;

        *a = sp40;
        *b = result;
    }
    else if (decodedStageLzPtr != NULL && decodedStageLzPtr->unk5C != NULL)
    {
        struct Struct80206E48 *iter1 = lbl_80206E48;
        struct Struct8020A348 *iter2 = lbl_8020A348;
        int j;
        int i;

        for (i = 0; i < lbl_802F1F48; i++, iter2++, iter1++)
        {
            struct Struct8020A348_child *iter3;
            mathutil_mtxA_from_mtx(iter1->unk24);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->unk0 & 3) == 1 && iter3->unk4 != NULL)
                {
                    float f;
                    struct Struct80209488 *r28 = iter3->unk4;

                    mathutil_mtxA_tf_point(&r28->unk8, &sp1C);
                    f = r28->unk14;
                    v.x = sp1C.x - f;
                    v.y = sp1C.y - f;
                    v.z = sp1C.z - f;
                    if (f28 > v.x)
                        f28 = v.x;
                    if (f30 > v.y)
                        f30 = v.y;
                    if (f29 > v.z)
                        f29 = v.z;

                    v.x = sp1C.x + f;
                    v.y = sp1C.y + f;
                    v.z = sp1C.z + f;
                    if (f27 < v.x)
                        f27 = v.x;
                    if (f31 < v.y)
                        f31 = v.y;
                    if (f26 < v.z)
                        f26 = v.z;
                }
            }
        }
        sp40.x = (f28 + f27) * lbl_802F37A4;
        sp40.y = (f30 + f31) * lbl_802F37A4;
        sp40.z = (f29 + f26) * lbl_802F37A4;

        result = 0.0f;
        iter1 = lbl_80206E48;
        iter2 = lbl_8020A348;
        for (i = 0; i < lbl_802F1F48; i++, iter2++, iter1++)
        {
            struct Struct8020A348_child *iter3;

            mathutil_mtxA_from_mtx(iter1->unk24);
            iter3 = iter2->unk0;
            for (j = 0; j < iter2->unk4; j++, iter3++)
            {
                if ((iter3->unk0 & 3) == 1)
                {
                    float f31;
                    float f0;
                    struct Struct80209488 *r24 = iter3->unk4;

                    if (iter3->unk4 == NULL)
                        continue;
                    mathutil_mtxA_tf_point(&r24->unk8, &sp10);
                    f31 = func_80046884(r24);
                    f0 = f31 + mathutil_sqrt((sp40.x - sp10.x) * (sp40.x - sp10.x) + (sp40.z - sp10.z) * (sp40.z - sp10.z));
                    if (result < f0)
                        result = f0;
                }
            }
        }

        *a = sp40;
        *b = result;
    }
    else
    {
        a->x = 0.0f;
        a->y = 0.0f;
        a->z = 0.0f;
        *b = 50.0f;
    }
}
#else
asm void func_800463E8(Vec *a, float *b)
{
    nofralloc
#include "../asm/nonmatchings/func_800463E8.s"
}
#pragma peephole on
#endif

struct
{
    Vec unk0;
    float unkC;
    float unk10;
    u8 filler14[0x3C-0x14];
} lbl_8020ADE4;

extern void lbl_800468F0();
extern void lbl_80046978();

float func_80046884(struct Struct80209488 *a)
{
    lbl_8020ADE4.unk0 = a->unk8;
    lbl_8020ADE4.unkC = 0.0f;
    lbl_8020ADE4.unk10 = 0.0f;
    func_80047E18(a, lbl_800468F0, lbl_80046978);
    return lbl_8020ADE4.unk10;
}

static inline float vec_sq_mag(register Vec *v)
{
    register float x, y, z;
#ifdef __MWERKS__
    asm
    {
        lfs x, v->x
        lfs y, v->y
        lfs z, v->z
        fmuls x, x, x
        fmadds x, y, y, x
        fmadds x, z, z, x
    }
    return x;
#else
    return v->x * v->x + v->y * v->y + v->z * v->z;
#endif
}

void lbl_800468F0(Vec *a)
{
    Vec spC;
    float f1;

    spC.x = a->x - lbl_8020ADE4.unk0.x;
    spC.z = a->z - lbl_8020ADE4.unk0.z;
    spC.y = 0.0f;
    f1 = vec_sq_mag(&spC);
    if (f1 < lbl_8020ADE4.unkC)
        return;
    lbl_8020ADE4.unkC = f1;
    lbl_8020ADE4.unk10 = mathutil_sqrt(f1);
}

void lbl_80046978(Vec *a)  // duplicate of lbl_800468F0
{
    Vec spC;
    float f1;

    spC.x = a->x - lbl_8020ADE4.unk0.x;
    spC.z = a->z - lbl_8020ADE4.unk0.z;
    spC.y = 0.0f;
    f1 = vec_sq_mag(&spC);
    if (f1 < lbl_8020ADE4.unkC)
        return;
    lbl_8020ADE4.unkC = f1;
    lbl_8020ADE4.unk10 = mathutil_sqrt(f1);
}

/*
const double lbl_802F3770 = -0.030833333333333333;
const float lbl_802F3778 = -1092.0f;
const float lbl_802F377C = 30.0f;
const double lbl_802F3780 = 16384.0;
const float lbl_802F3788 = -6.103515625e-05f;
*/
