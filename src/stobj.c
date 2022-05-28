#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "camera.h"
#include "mathutil.h"
#include "nl2ngc.h"
#include "stage.h"

#include "../data/common.gma.h"

struct StageObject lbl_80285AB0[128];

extern s16 lbl_802F1FF8;

void ev_stobj_init(void)
{
    int i;
    struct StageObject *ptr;

    lbl_802F1FF8 = 0;
    memset(lbl_80285AB0, 0, sizeof(lbl_80285AB0));
    ptr = lbl_80285AB0;
    for (i = 0; i < ARRAY_COUNT(lbl_80285AB0); i++, ptr++)
    {
        ptr->unk0 = i;
        ptr->unk2 = -1;
    }
    func_80030A50(spritePoolInfo.unk20);
    func_8006B594();
    func_8006B8E4(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
    func_8006B9E4(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
    func_8006C7BC(decodedStageLzPtr->animGroups, decodedStageLzPtr->animGroupCount);
}

#pragma force_active on
char *asdfasdf[] =
{
    "SOT_BUMPER",
    "SOT_JAMABAR",
    "SOT_GOALTAPE",
    "SOT_GOALBAG",
    "SOT_GOALBAG_EXMASTER",
    "SOT_MF_PNL_BUMPER",
    "SOT_MF_PNL_ELECTRAP",
    "SOT_MF_BULLET_TEST",
    "SOT_MF_BOX",
    "SOT_BUMPER_BGSPECIAL",
    "SOT_NAMEENT_BTN",
};
#pragma force_active reset

void (*lbl_801BE130[])(struct StageObject *) =
{
    func_8006BAB8,
    func_8006C40C,
    func_8006CA1C,
    sot_init_goalbag,
    func_8006F3A8,
    func_8006C7A4,
    func_8006C7A4,
    func_8006C7A4,
    func_8006C7A4,
    func_8006C144,
    func_800AF6D8,
    NULL,
};

void (*lbl_801BE160[])(struct StageObject *) =
{
    sot_main_bumper,
    func_8006C494,
    func_8006CEF4,
    sot_main_goalbag,
    func_8006F3C8,
    func_8006C7A8,
    func_8006C7A8,
    func_8006C7A8,
    func_8006C7A8,
    func_8006C1CC,
    func_800AF73C,
    NULL,
};

void (*lbl_801BE190[])(struct StageObject *) =
{
    sot_disp_bumper,
    func_8006C5F4,
    func_8006D724,
    sot_disp_goalbag,
    func_8006F3E8,
    func_8006C7AC,
    func_8006C7AC,
    func_8006C7AC,
    func_8006C7AC,
    func_8006C1EC,
    func_800AF85C,
    NULL,
};

void (*lbl_801BE1C0[])(struct StageObject *, struct PhysicsBall *) =
{
    sot_coli_bumper,
    func_8006C69C,
    func_8006DA04,
    sot_coli_goalbag,
    func_8006F408,
    func_8006C7B0,
    func_8006C7B0,
    func_8006C7B0,
    func_8006C7B0,
    func_8006C3E4,
    func_800AFA1C,
    NULL,
};

void (*lbl_801BE1F0[])(struct StageObject *) =
{
    func_8006C13C,
    func_8006C6C8,
    func_8006DD98,
    func_8006F3A0,
    func_8006F428,
    func_8006C7B4,
    func_8006C7B4,
    func_8006C7B4,
    func_8006C7B4,
    func_8006C404,
    func_800AFC14,
    NULL,
};

void (*lbl_801BE220[])(struct StageObject *) =
{
    func_8006C140,
    func_8006C6CC,
    func_8006DD9C,
    func_8006F3A4,
    func_8006F42C,
    func_8006C7B8,
    func_8006C7B8,
    func_8006C7B8,
    func_8006C7B8,
    func_8006C408,
    func_800AFC18,
    NULL,
};

#pragma force_active on

char string_STATUS___s_n_2[] = "STATUS: %s\n";
char wtfisthis2[] =
{
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x0A,
    0x00
};
char string_TYPE___s_n_2[] = "TYPE: %s\n";
char string_PART_ID___d_n[] = "PART ID: %d\n";
char string_POS__X__7_3f_n_2[] = "POS: X,%7.3f\n";
char string______Y__7_3f_n_2[] = "     Y,%7.3f\n";
char string______Z__7_3f_n_2[] = "     Z,%7.3f\n";
char string_SPD__X__7_3f_n_2[] = "SPD: X,%7.3f\n";
char string_ROT__X_0x_04X_n_2[] = "ROT: X,0x%04X\n";
char string______Y_0x_04X_n_2[] = "     Y,0x%04X\n";
char string______Z_0x_04X_n_2[] = "     Z,0x%04X\n";
char string_ROTSPD__X_0x_04X_n_2[] = "ROTSPD: X,0x%04X\n";
char string_________Y_0x_04X_n_2[] = "        Y,0x%04X\n";
char string_________Z_0x_04X_n_2[] = "        Z,0x%04X\n";
char string_COLI_RAD___7_3f_n_2[] = "COLI RAD: %7.3f\n";
char string_Flag__0x_08X_n_2[] = "Flag: 0x%08X\n";

#pragma force_active reset

void ev_stobj_main(void)
{
    int i;
    struct StageObject *phi_r28;
    s8 *phi_r27;

    if (gamePauseStatus & 0xA)
        return;

    phi_r27 = spritePoolInfo.unk2C;
    phi_r28 = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r27++, phi_r28++)
    {
        if (*phi_r27 != 0)
        {
            if (*phi_r27 == 3)
            {
                lbl_801BE1F0[phi_r28->unk4](phi_r28);
                *phi_r27 = 0;
            }
            else
            {
                phi_r28->unk7C = phi_r28->unk58;
                phi_r28->unk88 = phi_r28->unk70;
                phi_r28->unk8A = phi_r28->unk72;
                phi_r28->unk8C = phi_r28->unk74;
                lbl_801BE160[phi_r28->unk4](phi_r28);
                phi_r28->unk28 = phi_r28->unk1C;
                func_8006B518(phi_r28);
                if (phi_r28->unk8 & 8)
                {
                    Point3d sp8;

                    if (phi_r28->unkA0 != 0)
                    {
                        mathutil_mtxA_from_mtx(animGroups[phi_r28->unkA0].transform);
                        mathutil_mtxA_translate(&phi_r28->unk58);
                    }
                    else
                        mathutil_mtxA_from_translate(&phi_r28->unk58);
                    if (phi_r28->unk8 & 0x10)
                    {
                        mathutil_mtxA_rotate_y(phi_r28->unk72);
                        mathutil_mtxA_rotate_x(phi_r28->unk70);
                        mathutil_mtxA_rotate_z(phi_r28->unk74);
                    }
                    else
                    {
                        mathutil_mtxA_rotate_z(phi_r28->unk74);
                        mathutil_mtxA_rotate_y(phi_r28->unk72);
                        mathutil_mtxA_rotate_x(phi_r28->unk70);
                    }
                    mathutil_mtxA_tf_point(&phi_r28->unk90, &sp8);
                    func_800390C8(5, &sp8, phi_r28->unk9C);
                }
            }
        }
    }
}

void ev_stobj_dest(void)
{
    int i;
    struct StageObject *phi_r28;
    s8 *phi_r27;

    phi_r27 = spritePoolInfo.unk2C;
    phi_r28 = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r27++, phi_r28++)
    {
        if (*phi_r27 != 0)
        {
            lbl_801BE1F0[phi_r28->unk4](phi_r28);
            *phi_r27 = 0;
        }
    }
}

void stobj_draw(void)
{
    s32 i;
    struct StageObject *phi_r30;
    s8 *phi_r29;
    BallEnvFunc func;
    int phi_r25;
    Mtx mtx;

    func = backgroundInfo.unk8C;
    if (func != 0)
        g_avdisp_set_some_func_1(func);
    mathutil_mtx_copy(mathutilData->mtxB, mtx);

    phi_r29 = spritePoolInfo.unk2C;
    phi_r25 = 0;
    phi_r30 = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r29++, phi_r30++)
    {
        if (*phi_r29 != 0)
        {
            if (phi_r25 != phi_r30->unkA0)
            {
                mathutil_mtxA_from_mtx(mtx);
                mathutil_mtxA_mult_right(animGroups[phi_r30->unkA0].transform);
                mathutil_mtxA_to_mtx(mathutilData->mtxB);
                phi_r25 = phi_r30->unkA0;
            }
            lbl_801BE190[phi_r30->unk4](phi_r30);
        }
    }
    mathutil_mtx_copy(mtx, mathutilData->mtxB);
    if (func != NULL)
        g_avdisp_set_some_func_1(NULL);
}

s16 func_8006B2C0(struct StageObject *arg0)
{
    int temp_r3;
    struct StageObject *temp_r31;

    temp_r3 = pool_alloc(spritePoolInfo.unk20, 1);
    if (temp_r3 < 0)
        return -1;

    temp_r31 = &lbl_80285AB0[temp_r3];
    memcpy(temp_r31, arg0, sizeof(*temp_r31));
    temp_r31->unk0 = temp_r3;
    lbl_801BE130[temp_r31->unk4](temp_r31);
    temp_r31->unk7C = temp_r31->unk58;
    func_8006B518(temp_r31);
    temp_r31->unk28 = temp_r31->unk1C;
    temp_r31->unk38 = lbl_801BE1C0[temp_r31->unk4];
    temp_r31->unk2 = lbl_802F1FF8;
    lbl_802F1FF8++;
    if (lbl_802F1FF8 < 0)
        lbl_802F1FF8 = 0;
    return temp_r31->unk2;
}

struct StageObjectFuncs
{
    void (*unk0)(struct StageObject *);
    void (*unk4)(struct StageObject *);
    void (*unk8)(struct StageObject *);
    void (*unkC)(struct StageObject *, struct PhysicsBall *);
    void (*unk10)(struct StageObject *);
    void (*unk14)(struct StageObject *);
};

struct StageObjectFuncs lbl_801BE364 =
{
    func_8006C7A4,
    func_8006C7A8,
    func_8006C7AC,
    func_8006C7B0,
    func_8006C7B4,
    func_8006C7B8,
};

#pragma force_active on
void func_8006B3E8(s32 arg0, struct StageObjectFuncs *arg1)
{
    struct StageObjectFuncs sp10;

    if (arg1 == NULL)
        sp10 = lbl_801BE364;
    else
    {
        sp10 = *arg1;
        if (sp10.unk0 == NULL)
            sp10.unk0 = lbl_801BE364.unk0;
        if (sp10.unk4 == NULL)
            sp10.unk4 = lbl_801BE364.unk4;
        if (sp10.unk8 == NULL)
            sp10.unk8 = lbl_801BE364.unk8;
        if (sp10.unkC == NULL)
            sp10.unkC = lbl_801BE364.unkC;
        if (sp10.unk10 == NULL)
            sp10.unk10 = lbl_801BE364.unk10;
        if (sp10.unk14 == NULL)
            sp10.unk14 = lbl_801BE364.unk14;
    }

    lbl_801BE130[arg0] = sp10.unk0;
    lbl_801BE160[arg0] = sp10.unk4;
    lbl_801BE190[arg0] = sp10.unk8;
    lbl_801BE1C0[arg0] = sp10.unkC;
    lbl_801BE1F0[arg0] = sp10.unk10;
    lbl_801BE220[arg0] = sp10.unk14;
}
#pragma force_active reset

void func_8006B518(struct StageObject *arg0)
{
    mathutil_mtxA_from_translate(&arg0->unk58);
    if (arg0->unk8 & 0x10)
    {
        mathutil_mtxA_rotate_y(arg0->unk72);
        mathutil_mtxA_rotate_x(arg0->unk70);
        mathutil_mtxA_rotate_z(arg0->unk74);
    }
    else
    {
        mathutil_mtxA_rotate_z(arg0->unk74);
        mathutil_mtxA_rotate_y(arg0->unk72);
        mathutil_mtxA_rotate_x(arg0->unk70);
    }
    mathutil_mtxA_tf_point(&arg0->unk10, &arg0->unk1C);
}

char lbl_802F0B40[2] = "\n";

struct Struct8028C0B0 lbl_8028C0B0;

struct GMA **lbl_801BE37C[] = { &decodedStageGmaPtr, &decodedBgGma, NULL };

static inline void func_8006B594_inline(void)
{
    struct GMAModel **r7;
    struct GMAModel **r6;
    struct GMAModel **r8;
    int r4;
    int r3;
    int i;
    int j;

    r6 = r8 = lbl_8028C0B0.unk14;
    for (i = 0, r7 = r6; i < 4; i++, r7++)
    {
        if (*r7 == NULL)
        {
            r8 = r7;
            for (j = i; j < 3; j++, r8++)
                r8[0] = r8[1];
            *r8 = NULL;
        }
    }

    r4 = 0;

    for (r3 = 4; r3 > 0 && *r6 != NULL; r3--, r6++)
        r4++;
    lbl_8028C0B0.unk10 = r4;
}

void func_8006B594(void)
{
    int i;
    int numModels;
    struct GMA ***gmaIter;
    struct GMAModelEntry *entry;
    int found;
    struct GMA *gma;

    memset(&lbl_8028C0B0, 0, sizeof(lbl_8028C0B0));
    switch (backgroundInfo.bgId)
    {
    case 21:
    case 10:
        lbl_8028C0B0.unk0[0] = 0.095f;
        lbl_8028C0B0.unk0[1] = 0.0565f;
        lbl_8028C0B0.unk0[2] = 0.00565f;
        lbl_8028C0B0.unk0[3] = 0.00056f;
        break;
    case 20:
        lbl_8028C0B0.unk0[0] = 0.103f;
        lbl_8028C0B0.unk0[1] = 0.085f;
        lbl_8028C0B0.unk0[2] = 0.0085f;
        lbl_8028C0B0.unk0[3] = 0.00085f;
        break;
    case 19:
        lbl_8028C0B0.unk0[0] = 0.028f;
        lbl_8028C0B0.unk0[1] = 0.0075f;
        lbl_8028C0B0.unk0[2] = 0.00075f;
        lbl_8028C0B0.unk0[3] = 0.000075f;
        break;
    default:
        lbl_8028C0B0.unk0[0] = 0.075f;
        lbl_8028C0B0.unk0[1] = 0.0075f;
        lbl_8028C0B0.unk0[2] = 0.00075f;
        lbl_8028C0B0.unk0[3] = 0.000075f;
        break;
    }

    found = FALSE;
    for (gmaIter = lbl_801BE37C; *gmaIter != NULL; gmaIter++)
    {
        gma = **gmaIter;
        if (gma != NULL)
        {
            for (i = 0; i < 4; i++)
            {
                if (lbl_8028C0B0.unk14[i] == 0)
                {
                    char name[32];

                    sprintf(name, "BUMPER_L%d", i + 1);
                    entry = gma->modelEntries;
                    numModels = gma->numModels;
                    while (numModels > 0)
                    {
                        if (strcmp(entry->name + 4, name) == 0)
                        {
                            lbl_8028C0B0.unk14[i] = entry->modelOffset;
                            found = TRUE;
                        }
                        numModels--;
                        entry++;
                    }
                }
            }
        }
    }

    if (found)
    {
        func_8006B594_inline();
    }
    else
    {
        lbl_8028C0B0.unk14[0] = commonGma->modelEntries[mb_bumper].modelOffset;
        lbl_8028C0B0.unk14[1] = commonGma->modelEntries[mb_bumper_low].modelOffset;
        lbl_8028C0B0.unk10 = 2;
    }

    memset(&lbl_802F1FFC, 0, sizeof(lbl_802F1FFC));  //! why not just set it to NULL?

    found = FALSE;
    for (gmaIter = lbl_801BE37C; *gmaIter != NULL; gmaIter++)
    {
        gma = **gmaIter;
        if (gma != NULL)
        {
            entry = gma->modelEntries;
            numModels = gma->numModels;
            while (numModels > 0)
            {
                if (strcmp(entry->name + 4, "JAMABAR") == 0)
                {
                    lbl_802F1FFC = entry->modelOffset;
                    found = TRUE;
                    break;
                }
                numModels--;
                entry++;
            }
            if (found)
                break;
        }
    }
    if (!found)
        lbl_802F1FFC = commonGma->modelEntries[mb_jamabar].modelOffset;
}

void func_8006B8E4(struct StageAnimGroup *arg0, int arg1)
{
    struct StageObject sp10;
    int i, j;

    memset(&sp10, 0, sizeof(sp10));
    switch (backgroundInfo.bgId)
    {
    case BG_TYPE_JUN:
    case BG_TYPE_STM:
        sp10.unk4 = 9;
        break;
    default:
        sp10.unk4 = 0;
        break;
    }

    for (i = 0; i < arg1; i++, arg0++)
    {
        struct StageBumper *bumper = arg0->bumpers;

        for (j = 0; j < arg0->bumperCount; j++, bumper++)
        {
            sp10.unk58 = bumper->pos;
            sp10.unk70 = bumper->rotX;
            sp10.unk72 = bumper->rotY;
            sp10.unk74 = bumper->rotZ;
            sp10.unk3C = bumper->unk14;
            sp10.unkA0 = i;
            func_8006B2C0(&sp10);
        }
    }
}

void func_8006B9E4(struct StageAnimGroup *arg0, int arg1)
{
    struct StageObject sp10;
    int i, j;

    memset(&sp10, 0, sizeof(sp10));
    sp10.unk4 = 1;

    for (i = 0; i < arg1; i++, arg0++)
    {
        struct StageJamabar *jamabar = arg0->jamabars;

        for (j = 0; j < arg0->jamabarCount; j++, jamabar++)
        {
            sp10.unkA8 = jamabar->pos;
            sp10.unk70 = jamabar->rotX;
            sp10.unk72 = jamabar->rotY;
            sp10.unk74 = jamabar->rotZ;
            sp10.unk3C = jamabar->unk14;
            sp10.unkA0 = i;
            func_8006B2C0(&sp10);
        }
    }
}

void func_8006BAB8(struct StageObject *arg0)
{
    arg0->unkC = 0;
    arg0->unk8 |= 0xA;
    arg0->unk54 = lbl_8028C0B0.unk14[0];
    arg0->unk34 = 0.75f * arg0->unk54->boundSphereRadius;
    arg0->unk10 = arg0->unk54->boundSphereCenter;
    arg0->unk48 = 1.0f;
    arg0->unk4C = 1.0f;
    arg0->unk50 = 1.0f;
    arg0->unk76 = 0;
    arg0->unk9C = 0.75f;
    arg0->unk90 = arg0->unk10;
}

void sot_main_bumper(struct StageObject *arg0)
{
    switch (arg0->unkC)
    {
    case 0:
        arg0->unk78 += (0x100 - arg0->unk78) >> 6;
        if (arg0->unk48 > 1.0)
        {
            arg0->unk48 -= 0.06666666666666667;
            if (arg0->unk48 < 1.0)
                arg0->unk48 = 1.0f;
            arg0->unk50 = arg0->unk48;
        }
        break;
    case 1:
        arg0->unkC = 2;
        arg0->unkE = 7;
        // fall through
    case 2:
        arg0->unkE--;
        if (arg0->unkE < 0)
            arg0->unkC = 0;
        arg0->unk78 += 0x100;
        arg0->unk48 += 0.5 * (2.0 - arg0->unk48);
        arg0->unk50 = arg0->unk48;
        break;
    }
    arg0->unk76 += arg0->unk78;
}

void sot_disp_bumper(struct StageObject *arg0)
{
    Vec sp18;
    Vec spC;
    struct GMAModel *model;
    float radius;

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&arg0->unk58);
    mathutil_mtxA_rotate_z(arg0->unk74);
    mathutil_mtxA_rotate_y(arg0->unk72);
    mathutil_mtxA_rotate_x(arg0->unk70);
    mathutil_mtxA_rotate_y(arg0->unk76);
    spC.x = arg0->unk48 * arg0->unk3C.x;
    spC.y = arg0->unk3C.y;
    spC.z = arg0->unk50 * arg0->unk3C.z;
    mathutil_mtxA_scale_xyz(spC.x, spC.y, spC.z);
    mathutil_mtxA_get_translate_alt(&sp18);
    if (sp18.z > 0.0)
        return;

    model = arg0->unk54;
    radius = model->boundSphereRadius;
    if (g_test_scaled_sphere_in_frustum(&model->boundSphereCenter, radius, spC.x) != 0)
    {
        float temp_f1;
        int temp_r0;
        struct GMAModel **phi_r5;
        float *phi_r6;

        GXLoadPosMtxImm(mathutilData->mtxA, 0);
        GXLoadNrmMtxImm(mathutilData->mtxA, 0);

        temp_f1 = -((radius * currentCameraStructPtr->sub28.unk3C * currentCameraStructPtr->sub28.vp.height) / sp18.z);
        phi_r6 = lbl_8028C0B0.unk0;
        phi_r5 = lbl_8028C0B0.unk14;
        for (temp_r0 = lbl_8028C0B0.unk10 - 1; temp_r0 > 0; temp_r0--, phi_r5++, phi_r6++)
        {
            if (temp_f1 > *phi_r6)
                break;
        }
        model = *phi_r5;
        if (temp_f1 > 0.03f)
            avdisp_draw_model_unculled_sort_translucent(model);
        else
        {
            BallEnvFunc temp_r31 = g_avdisp_set_some_func_1(NULL);
            avdisp_draw_model_unculled_sort_translucent(model);
            g_avdisp_set_some_func_1(temp_r31);
        }
    }
    if (arg0->unk48 > 1.0f)
    {
        float temp_f31_2;
        float phi_f30;

        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate_xyz(arg0->unk58.x, 0.05f + arg0->unk58.y, arg0->unk58.z);
        mathutil_mtxA_rotate_z(arg0->unk74);
        mathutil_mtxA_rotate_y(arg0->unk72);
        mathutil_mtxA_rotate_x(arg0->unk70 - 0x4000);
        temp_f31_2 = 2.0f * spC.x;
        phi_f30 = 2.0f * (spC.x - 1.0f);
        if (phi_f30 > 1.0f)
            phi_f30 = 1.0f;
        mathutil_mtxA_scale_s(temp_f31_2);
        g_nl2ngc_set_scale(temp_f31_2);
        func_80030BB8(phi_f30, phi_f30, phi_f30);
        nl2ngc_draw_model_unsorted(naomiCommonObj->modelPtrs[0x2B]);
        func_8000E3BC();
    }
}
