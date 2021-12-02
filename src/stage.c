#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"
#include "mode.h"
#include "preview.h"

extern u8 lbl_801B86E4[];
extern int lbl_802F1F28;

//u8 lbl_80206D00[0x78];
struct Struct80206D00
{
    void *unk0;
    u8 filler4[4];
    void *unk8;
    void *unkC;
    void *unk10;
    u8 filler14[4];
} lbl_80206D00[5];

struct Preview stagePreview;  // 78

/*
struct
{
    //u8 filler0[0x74];
    s32 unk74;  // EC
    float unk78;  // F0
    void (*unk7C)(void);  // F4
    u32 unk80;  // F8
    float unk84[3];  // FC
    //u8 filler88[0x90-0x88];
    u32 unk90;  // 108
    u8 filler94[0x5C-(0x94-0x74)];
} lbl_80206DEC;
*/
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

void ev_stage_init(void)
{
    lbl_80206DEC.unk0 = 0;
    lbl_80206DEC.unk8 = NULL;
    lbl_80206DEC.unk1C = 0;
    func_8004482C();
    switch (currStageId)
    {
    case 101:
        find_blur_part();
    }
    lbl_802F1F28 = 0;
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
                lbl_802F1F28 = 1;
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

    if (lbl_802F1EE0 & 0xA)
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
            r30->unk18 = 182.044448852539f * func_80043918(r27->unk0, r27->unk4, f31);
        }
        if (r27->unkC != NULL2)
        {
            r30->unk20 = r30->unk1A;
            r30->unk1A = 182.044448852539f * func_80043918(r27->unk8, r27->unkC, f31);
        }
        if (r27->unk14 != NULL2)
        {
            r30->unk22 = r30->unk1C;
            r30->unk1C = 182.044448852539f * func_80043918(r27->unk10, r27->unk14, f31);
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
    if (lbl_802F1F28)
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

void find_blur_part(void)
{
    lbl_802F1F2C = stage_find_model(decodedStageGmaPtr, "MOT_STAGE101_BLUR");
}

void func_8004424C(void)
{
    float f31;
    float f30;
    struct Struct80206E48 *r31;
    struct DecodedStageLzPtr_child *r30;
    int i;

    if (lbl_802F1F2C == NULL2)
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
            func_8008E438(lbl_802F1F2C);
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

    if (lbl_802F1EE0 & 0xA)
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
                r31->unk18 = 182.044448852539f * func_80043918(r29->unk0, r29->unk4, f31);
            }
            if (r29->unkC != NULL2)
            {
                r31->unk20 = r31->unk1A;
                r31->unk1A = 182.044448852539f * func_80043918(r29->unk8, r29->unkC, f31);
            }
            if (r29->unk14 != NULL2)
            {
                r31->unk22 = r31->unk1C;
                r31->unk1C = 182.044448852539f * func_80043918(r29->unk10, r29->unk14, f31);
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

extern u8 lbl_800457FC[];
extern u8 lbl_80045A00[];
extern u8 lbl_80045B54[];

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
        OSHeapHandle oldHeap = OSSetCurrentHeap(lbl_802F1B24);

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
        func_80030E20(&lbl_802F1B00, &lbl_802F1AEC);
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
        if (lbl_802F1EE0 & (1 << (31-0x1D)))
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
        OSHeapHandle oldHeap = OSSetCurrentHeap(lbl_802F1B24);

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
        func_80030E20(&lbl_802F1B00, &lbl_802F1AEC);
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

    func_80055164(func_80045E4C());
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
        oldHeap = OSSetCurrentHeap(lbl_802F1B24);
        func_80046A00(stageId);
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
            load_nlobj(&lbl_802F1B00, &lbl_802F1AEC, gmaName, tplName);
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

u32 lbl_80209368[0x48];
u32 lbl_80209488[0x48];
u32 lbl_802095A8[0x110];
struct Struct802099E8 lbl_802099E8[0x48];
struct Struct802099E8 lbl_80209D48[0x80];
struct
{
    void *unk0;
    u32 unk4;
} lbl_8020A348[0x108];

FORCE_BSS_ORDER(lbl_80209368)
FORCE_BSS_ORDER(lbl_80209488)
FORCE_BSS_ORDER(lbl_802095A8)
FORCE_BSS_ORDER(lbl_802099E8)
FORCE_BSS_ORDER(lbl_80209D48)
FORCE_BSS_ORDER(lbl_8020A348)

/*
struct Struct801B8794
{
    
};
*/

/*
struct Struct802F1B04
{
    void *unk14;  // pointer to some struct
    u32 unkB8;
    u32 unkC0;
};

extern struct Struct802F1B04 *lbl_802F1B04;
*/

void **lbl_801B8794[] = {(void **)&lbl_802F1B00, (void **)&lbl_802F1B04, NULL};

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

/*
extern u32 lbl_802F1F4C;
extern u32 lbl_802F1F50;

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
