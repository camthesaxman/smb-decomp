#include <stddef.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "game.h"
#include "mathutil.h"

extern u8 lbl_801B86E4[];
extern int lbl_802F1F28;

u8 lbl_80206D00[0x78];
u8 lbl_80206D78[0x74];  // 78
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

struct Struct80206E48
{
    Vec unk0;
    Vec unkC;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    s16 unk1E;
    s16 unk20;
    s16 unk22;
    Mtx unk24;
    Mtx unk54;
} lbl_80206E48[0x48];  // 148

FORCE_BSS_ORDER(lbl_80206D00)
FORCE_BSS_ORDER(lbl_80206D78)
FORCE_BSS_ORDER(lbl_80206DEC)

char *lbl_801B86D8[] =
{
    "GOAL",
    "GOAL_G",
    "GOAL_R",
};

void ev_stage_init(void)
{
    lbl_80206DEC.unk74 = 0;
    lbl_80206DEC.unk7C = 0;
    lbl_80206DEC.unk90 = 0;
    func_8004482C();
    switch (stageId)
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
                g_create_stage_preview_texture(
                    lbl_80206D78,
                    "preview/140x140.tpl",
                    r5 - 1,
                    140,
                    140,
                    5);
                func_800AD070(lbl_80206D78);
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
    float f1;
    int i;

    if (lbl_802F1EE0 & 0xA)
        return;
    if (lbl_801F3A58.unk0 & (1 << (31-0x17)))
    {
        if (modeCtrl.unk0 > 0x78)
            lbl_80206DEC.unk78 = 0.0f;
        else
            lbl_80206DEC.unk78 = 0x78 - modeCtrl.unk0;
        lbl_80206DEC.unk74 = 0x77;
    }
    else if (lbl_801F3A58.unk0 & (1 << (31-0x1B)))
    {
        lbl_80206DEC.unk78 = func_80049F90(lbl_80250A68.unk10, lbl_80250A68.unk0[lbl_80250A68.unk14]);
        lbl_80206DEC.unk74 = lbl_80206DEC.unk78;
    }
    else
        lbl_80206DEC.unk78 = lbl_80206DEC.unk74;
    f31 = lbl_80206DEC.unk78 / 60.0;
    f31 += decodedStageLzPtr->unk0;
    f3 = (float)(decodedStageLzPtr->unk4 - decodedStageLzPtr->unk0);
    f1 = f3 * (float)mathutil_floor_to_int(f31 / f3);
    f31 -= f1;
    f31 += decodedStageLzPtr->unk0;
    f30 = f31;
    if (decodedStageLzPtr->unk78 != 0)
    {
        int i;
        for (i = 0; i < 3; i++)
        {
            float *r5 = &lbl_80206DEC.unk84[i];
            float f3 = *r5;
            if (lbl_80206DEC.unk80 & (1 << i))
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
                    f31 = lbl_80206DEC.unk84[j];
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
            r30->unkC.x = r30->unk0.x - r29->unkB8;
            r30->unk0.x = func_80043918(r27->unk18, r27->unk1C, f31);
        }
        if (r27->unk24 != NULL2)
        {
            r30->unkC.y = r30->unk0.y - r29->unkBC;
            r30->unk0.y = func_80043918(r27->unk20, r27->unk24, f31);
        }
        if (r27->unk2C != NULL2)
        {
            r30->unkC.z = r30->unk0.z - r29->unkC0;
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
    if (lbl_80206DEC.unk7C != NULL)
        lbl_80206DEC.unk7C();
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
    if (!(lbl_80206DEC.unk90 & 1))
        lbl_80206DEC.unk74++;
}

void ev_stage_dest(void)
{
    if (lbl_802F1F28)
        func_800AD0F8(lbl_80206D78);
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

#pragma fp_contract off

void func_8004424C(void)
{
    float f31;
    float f30;
    struct Struct80206E48 *r31;
    struct DecodedStageLzPtr_child *r30;
    int i;

    if (lbl_802F1F2C == NULL2)
        return;
    f31 = lbl_80206DEC.unk78 / 60.0;
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
