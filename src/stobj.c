#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "stage.h"
#include "world.h"

#include "../data/common.gma.h"

struct Stobj_ lbl_80285AB0[128];

extern s16 lbl_802F1FF8;

void ev_stobj_init(void)
{
    int i;
    struct Stobj_ *stobj;

    lbl_802F1FF8 = 0;
    memset(lbl_80285AB0, 0, sizeof(lbl_80285AB0));
    stobj = lbl_80285AB0;
    for (i = 0; i < ARRAY_COUNT(lbl_80285AB0); i++, stobj++)
    {
        stobj->unk0 = i;
        stobj->unk2 = -1;
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

void (*stobjInitFuncs[])(struct Stobj_ *) =
{
    stobj_bumper_init,
    stobj_jamabar_init,
    stobj_goaltape_init,
    stobj_goalbag_init,
    stobj_goalbag_exmaster_init,
    stobj_dummy_init,
    stobj_dummy_init,
    stobj_dummy_init,
    stobj_dummy_init,
    stobj_bumper_bgspecial_init,
    stobj_nameent_btn_init,
    NULL,
};

void (*stobjMainFuncs[])(struct Stobj_ *) =
{
    stobj_bumper_main,
    stobj_jamabar_main,
    stobj_goaltape_main,
    stobj_goalbag_main,
    stobj_goalbag_exmaster_main,
    stobj_dummy_main,
    stobj_dummy_main,
    stobj_dummy_main,
    stobj_dummy_main,
    stobj_bumper_bgspecial_main,
    stobj_nameent_btn_main,
    NULL,
};

void (*stobjDrawFuncs[])(struct Stobj_ *) =
{
    stobj_bumper_draw,
    stobj_jamabar_draw,
    stobj_goaltape_draw,
    stobj_goalbag_draw,
    stobj_goalbag_exmaster_draw,
    stobj_dummy_draw,
    stobj_dummy_draw,
    stobj_dummy_draw,
    stobj_dummy_draw,
    stobj_bumper_bgspecial_draw,
    stobj_nameent_btn_draw,
    NULL,
};

void (*stobjCollisionFuncs[])(struct Stobj_ *, struct PhysicsBall *) =
{
    stobj_bumper_coli,
    stobj_jamabar_coli,
    stobj_goaltape_coli,
    stobj_goalbag_coli,
    stobj_goalbag_exmaster_coli,
    stobj_dummy_coli,
    stobj_dummy_coli,
    stobj_dummy_coli,
    stobj_dummy_coli,
    stobj_bumper_bgspecial_coli,
    stobj_nameent_btn_coli,
    NULL,
};

void (*lbl_801BE1F0[])(struct Stobj_ *) =
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

void (*lbl_801BE220[])(struct Stobj_ *) =
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
char lbl_801BE25C[] =
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
    struct Stobj_ *stobj;
    s8 *phi_r27;

    if (gamePauseStatus & 0xA)
        return;

    phi_r27 = spritePoolInfo.unk2C;
    stobj = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r27++, stobj++)
    {
        if (*phi_r27 != 0)
        {
            if (*phi_r27 == 3)
            {
                lbl_801BE1F0[stobj->type](stobj);
                *phi_r27 = 0;
            }
            else
            {
                stobj->unk7C = stobj->unk58;
                stobj->unk88 = stobj->unk70;
                stobj->unk8A = stobj->unk72;
                stobj->unk8C = stobj->unk74;
                stobjMainFuncs[stobj->type](stobj);
                stobj->position_2 = stobj->position;
                func_8006B518(stobj);
                if (stobj->unk8 & 8)
                {
                    Point3d sp8;

                    if (stobj->unkA0 != 0)
                    {
                        mathutil_mtxA_from_mtx(animGroups[stobj->unkA0].transform);
                        mathutil_mtxA_translate(&stobj->unk58);
                    }
                    else
                        mathutil_mtxA_from_translate(&stobj->unk58);
                    if (stobj->unk8 & 0x10)
                    {
                        mathutil_mtxA_rotate_y(stobj->unk72);
                        mathutil_mtxA_rotate_x(stobj->unk70);
                        mathutil_mtxA_rotate_z(stobj->unk74);
                    }
                    else
                    {
                        mathutil_mtxA_rotate_z(stobj->unk74);
                        mathutil_mtxA_rotate_y(stobj->unk72);
                        mathutil_mtxA_rotate_x(stobj->unk70);
                    }
                    mathutil_mtxA_tf_point(&stobj->unk90, &sp8);
                    func_800390C8(5, &sp8, stobj->unk9C);
                }
            }
        }
    }
}

void ev_stobj_dest(void)
{
    int i;
    struct Stobj_ *stobj;
    s8 *phi_r27;

    phi_r27 = spritePoolInfo.unk2C;
    stobj = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r27++, stobj++)
    {
        if (*phi_r27 != 0)
        {
            lbl_801BE1F0[stobj->type](stobj);
            *phi_r27 = 0;
        }
    }
}

void stobj_draw(void)
{
    s32 i;
    struct Stobj_ *stobj;
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
    stobj = lbl_80285AB0;
    for (i = spritePoolInfo.unk28; i > 0; i--, phi_r29++, stobj++)
    {
        if (*phi_r29 != 0)
        {
            if (phi_r25 != stobj->unkA0)
            {
                mathutil_mtxA_from_mtx(mtx);
                mathutil_mtxA_mult_right(animGroups[stobj->unkA0].transform);
                mathutil_mtxA_to_mtx(mathutilData->mtxB);
                phi_r25 = stobj->unkA0;
            }
            stobjDrawFuncs[stobj->type](stobj);
        }
    }
    mathutil_mtx_copy(mtx, mathutilData->mtxB);
    if (func != NULL)
        g_avdisp_set_some_func_1(NULL);
}

s16 func_8006B2C0(struct Stobj_ *arg0)
{
    int temp_r3;
    struct Stobj_ *temp_r31;

    temp_r3 = pool_alloc(spritePoolInfo.unk20, 1);
    if (temp_r3 < 0)
        return -1;

    temp_r31 = &lbl_80285AB0[temp_r3];
    memcpy(temp_r31, arg0, sizeof(*temp_r31));
    temp_r31->unk0 = temp_r3;
    stobjInitFuncs[temp_r31->type](temp_r31);
    temp_r31->unk7C = temp_r31->unk58;
    func_8006B518(temp_r31);
    temp_r31->position_2 = temp_r31->position;
    temp_r31->unk38 = stobjCollisionFuncs[temp_r31->type];
    temp_r31->unk2 = lbl_802F1FF8;
    lbl_802F1FF8++;
    if (lbl_802F1FF8 < 0)
        lbl_802F1FF8 = 0;
    return temp_r31->unk2;
}

struct StobjFuncs
{
    void (*unk0)(struct Stobj_ *);
    void (*unk4)(struct Stobj_ *);
    void (*unk8)(struct Stobj_ *);
    void (*unkC)(struct Stobj_ *, struct PhysicsBall *);
    void (*unk10)(struct Stobj_ *);
    void (*unk14)(struct Stobj_ *);
};

struct StobjFuncs lbl_801BE364 =
{
    stobj_dummy_init,
    stobj_dummy_main,
    stobj_dummy_draw,
    stobj_dummy_coli,
    func_8006C7B4,
    func_8006C7B8,
};

#pragma force_active on
void func_8006B3E8(s32 arg0, struct StobjFuncs *arg1)
{
    struct StobjFuncs sp10;

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

    stobjInitFuncs[arg0] = sp10.unk0;
    stobjMainFuncs[arg0] = sp10.unk4;
    stobjDrawFuncs[arg0] = sp10.unk8;
    stobjCollisionFuncs[arg0] = sp10.unkC;
    lbl_801BE1F0[arg0] = sp10.unk10;
    lbl_801BE220[arg0] = sp10.unk14;
}
#pragma force_active reset

void func_8006B518(struct Stobj_ *stobj)
{
    mathutil_mtxA_from_translate(&stobj->unk58);
    if (stobj->unk8 & 0x10)
    {
        mathutil_mtxA_rotate_y(stobj->unk72);
        mathutil_mtxA_rotate_x(stobj->unk70);
        mathutil_mtxA_rotate_z(stobj->unk74);
    }
    else
    {
        mathutil_mtxA_rotate_z(stobj->unk74);
        mathutil_mtxA_rotate_y(stobj->unk72);
        mathutil_mtxA_rotate_x(stobj->unk70);
    }
    mathutil_mtxA_tf_point(&stobj->g_model_origin, &stobj->position);
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
    struct Stobj_ stobj;
    int i, j;

    memset(&stobj, 0, sizeof(stobj));
    switch (backgroundInfo.bgId)
    {
    case BG_TYPE_JUN:
    case BG_TYPE_STM:
        stobj.type = SOT_BUMPER_BGSPECIAL;
        break;
    default:
        stobj.type = SOT_BUMPER;
        break;
    }

    for (i = 0; i < arg1; i++, arg0++)
    {
        struct StageBumper *bumper = arg0->bumpers;

        for (j = 0; j < arg0->bumperCount; j++, bumper++)
        {
            stobj.unk58 = bumper->pos;
            stobj.unk70 = bumper->rotX;
            stobj.unk72 = bumper->rotY;
            stobj.unk74 = bumper->rotZ;
            stobj.unk3C = bumper->unk14;
            stobj.unkA0 = i;
            func_8006B2C0(&stobj);
        }
    }
}

void func_8006B9E4(struct StageAnimGroup *arg0, int arg1)
{
    struct Stobj_ stobj;
    int i, j;

    memset(&stobj, 0, sizeof(stobj));
    stobj.type = SOT_JAMABAR;

    for (i = 0; i < arg1; i++, arg0++)
    {
        struct StageJamabar *jamabar = arg0->jamabars;

        for (j = 0; j < arg0->jamabarCount; j++, jamabar++)
        {
            stobj.unkA8 = jamabar->pos;
            stobj.unk70 = jamabar->rotX;
            stobj.unk72 = jamabar->rotY;
            stobj.unk74 = jamabar->rotZ;
            stobj.unk3C = jamabar->unk14;
            stobj.unkA0 = i;
            func_8006B2C0(&stobj);
        }
    }
}

void stobj_bumper_init(struct Stobj_ *stobj)
{
    stobj->unkC = 0;
    stobj->unk8 |= 0xA;
    stobj->model = lbl_8028C0B0.unk14[0];
    stobj->unk34 = 0.75f * stobj->model->boundSphereRadius;
    stobj->g_model_origin = stobj->model->boundSphereCenter;
    stobj->unk48 = 1.0f;
    stobj->unk4C = 1.0f;
    stobj->unk50 = 1.0f;
    stobj->unk76 = 0;
    stobj->unk9C = 0.75f;
    stobj->unk90 = stobj->g_model_origin;
}

void stobj_bumper_main(struct Stobj_ *stobj)
{
    switch (stobj->unkC)
    {
    case 0:
        stobj->unk78 += (0x100 - stobj->unk78) >> 6;
        if (stobj->unk48 > 1.0)
        {
            stobj->unk48 -= 0.06666666666666667;
            if (stobj->unk48 < 1.0)
                stobj->unk48 = 1.0f;
            stobj->unk50 = stobj->unk48;
        }
        break;
    case 1:
        stobj->unkC = 2;
        stobj->unkE = 7;
        // fall through
    case 2:
        stobj->unkE--;
        if (stobj->unkE < 0)
            stobj->unkC = 0;
        stobj->unk78 += 0x100;
        stobj->unk48 += 0.5 * (2.0 - stobj->unk48);
        stobj->unk50 = stobj->unk48;
        break;
    }
    stobj->unk76 += stobj->unk78;
}

void stobj_bumper_draw(struct Stobj_ *stobj)
{
    Vec sp18;
    Vec spC;
    struct GMAModel *model;
    float radius;

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&stobj->unk58);
    mathutil_mtxA_rotate_z(stobj->unk74);
    mathutil_mtxA_rotate_y(stobj->unk72);
    mathutil_mtxA_rotate_x(stobj->unk70);
    mathutil_mtxA_rotate_y(stobj->unk76);
    spC.x = stobj->unk48 * stobj->unk3C.x;
    spC.y = stobj->unk3C.y;
    spC.z = stobj->unk50 * stobj->unk3C.z;
    mathutil_mtxA_scale_xyz(spC.x, spC.y, spC.z);
    mathutil_mtxA_get_translate_alt(&sp18);
    if (sp18.z > 0.0)
        return;

    model = stobj->model;
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
    if (stobj->unk48 > 1.0f)
    {
        float temp_f31_2;
        float phi_f30;

        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate_xyz(stobj->unk58.x, 0.05f + stobj->unk58.y, stobj->unk58.z);
        mathutil_mtxA_rotate_z(stobj->unk74);
        mathutil_mtxA_rotate_y(stobj->unk72);
        mathutil_mtxA_rotate_x(stobj->unk70 - 0x4000);
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

void stobj_bumper_coli(struct Stobj_ *stobj, struct PhysicsBall *arg1)
{
    Vec sp30;
    Vec sp24;
    float temp_f1;
    float temp_f2;
    struct Ball *temp_r31;
    int phi_r4;

    temp_r31 = currentBallStructPtr;
    stobj->unkC = 1;
    sp30 = stobj->position;
    func_8006AAEC(&arg1->prevPos, &arg1->pos, &stobj->position_2, &sp30, arg1->radius, stobj->model->boundSphereRadius);
    sp24 = arg1->pos;
    sp24.x -= stobj->position.x;
    sp24.y -= stobj->position.y;
    sp24.z -= stobj->position.z;
    mathutil_vec_normalize_len(&sp24);
    temp_f2 = -1.5 * (sp24.x * arg1->vel.x + sp24.y * arg1->vel.y + sp24.z * arg1->vel.z);
    if (temp_f2 > 0.0)
    {
        arg1->vel.x += temp_f2 * sp24.x;
        arg1->vel.y += temp_f2 * sp24.y;
        arg1->vel.z += temp_f2 * sp24.z;
    }
    arg1->vel.x += 0.05 * sp24.x;
    arg1->vel.y += 0.05 * sp24.y;
    arg1->vel.z += 0.05 * sp24.z;
    temp_f1 = stobj->unk34 + arg1->radius + 0.01;
    sp24.x *= temp_f1;
    sp24.y *= temp_f1;
    sp24.z *= temp_f1;
    arg1->pos.x = stobj->position.x + sp24.x;
    arg1->pos.y = stobj->position.y + sp24.y;
    arg1->pos.z = stobj->position.z + sp24.z;
    g_play_sound(0x5011);
    temp_r31->flags |= 0x20;

    {
        s16 sp14[] =
        {
            0x005A, 0x005B,
            0x005C, 0x005D,
            0x005E, 0x005F,
            0x0060, 0x0061,
        };
        u8 dummy[4];

        lbl_802F1DFC = temp_r31->ape->charaId;
        g_play_sound(sp14[unpausedFrameCounter & 7]);
        phi_r4 = 1;
        if (modeCtrl.gameType == GAMETYPE_MINI_RACE)
        {
            if (temp_r31->unk144 != NULL && (temp_r31->unk144->unk14 & 0x20))
                phi_r4 = 0;
        }
        if (phi_r4 != 0)
            func_800B60F4(lbl_80206BD0[temp_r31->playerId], 1, 0x1E);
    }
}

void func_8006C13C(struct Stobj_ *stobj) {}

void func_8006C140(struct Stobj_ *stobj) {}

void stobj_bumper_bgspecial_init(struct Stobj_ *arg0)
{
    arg0->unkC = 0;
    arg0->unk8 |= 0xA;
    arg0->model = lbl_8028C0B0.unk14[0];
    arg0->unk34 = 0.75f * arg0->model->boundSphereRadius;
    arg0->g_model_origin = arg0->model->boundSphereCenter;
    arg0->unk48 = 1.0f;
    arg0->unk4C = 1.0f;
    arg0->unk50 = 1.0f;
    arg0->unk76 = 0;
    arg0->unk9C = 0.75f;
    arg0->unk90 = arg0->g_model_origin;
}

void stobj_bumper_bgspecial_main(struct Stobj_ *stobj)
{
    stobj_bumper_main(stobj);
}

s16 lbl_801BE394[] =
{
    0x0008, 0x0009,
    0x000A, 0x000B,
    0x000C, 0x000D,
    0x000E, 0x000F,
    0x0010, 0x0011,
    0x0012, 0x0013,
    0x0014, 0x0015,
    0x0016, 0x0017,
    0x0018, 0x0019,
    0x001A, 0x001B,
    0x001C, 0x001D,
    0x001E, 0x001F,
    0x0020, 0x0021,
    0x0022, 0x0023,
    0x0024, 0x0025,
    0x0026, 0x0027,
};

void stobj_bumper_bgspecial_draw(struct Stobj_ *arg0)
{
    Vec spC;
    f32 temp_f31;
    f32 temp_f31_2;
    f32 var_f1;
    struct GMAModel *temp_r30;
    int modelId;

    stobj_bumper_draw(arg0);
    switch (backgroundInfo.bgId) 
    {
    case BG_TYPE_JUN:
        if (arg0->unk48 > 1.0f)
        {
            var_f1 = 1.1f * (arg0->unk48 - 1.0f);
            temp_r30 = decodedBgGma->modelEntries[0x19].modelOffset;
            if (var_f1 > 1.0f)
                var_f1 = 1.0f;
            temp_f31 = arg0->model->boundSphereRadius + arg0->model->boundSphereRadius * mathutil_sin(16384.0f * var_f1);
            mathutil_mtxA_from_mtxB_translate(&arg0->unk58);
            mathutil_mtxA_rotate_z(arg0->unk74);
            mathutil_mtxA_rotate_y(arg0->unk72);
            mathutil_mtxA_rotate_x(arg0->unk70);
            mathutil_mtxA_rotate_y(arg0->unk0 << 11);
            mathutil_mtxA_translate_xyz(0.0f, temp_f31, 0.0f);
            GXLoadPosMtxImm(mathutilData->mtxA, 0);
            GXLoadNrmMtxImm(mathutilData->mtxA, 0);
            avdisp_draw_model_culled_sort_translucent(temp_r30);
        }
        break;
    case BG_TYPE_STM:
        modelId = lbl_801BE394[unpausedFrameCounter & 0x1F];
        temp_r30 = decodedBgGma->modelEntries[modelId].modelOffset;
        mathutil_mtxA_from_mtxB_translate(&arg0->unk58);
        mathutil_mtxA_get_translate_alt(&spC);
        temp_f31_2 = spC.z + (8.0f * currentCameraStructPtr->sub28.unk3C * currentCameraStructPtr->sub28.vp.height);
        if (temp_f31_2 > 0.0f)
        {
            temp_f31_2 *= 0.5f;
            mathutil_mtxA_rigid_inv_tf_tl(&spC);
            mathutil_mtxA_rotate_y(mathutil_atan2(spC.x, spC.z));
            mathutil_mtxA_scale_xyz(0.025f * arg0->unk48, 0.035f, 1.0f);
            if (temp_f31_2 < 1.0f)
                avdisp_set_alpha(temp_f31_2);
            avdisp_set_bound_sphere_scale(0.035f);
            avdisp_draw_model_culled_sort_all(temp_r30);
        }
        break;
    }
}

void stobj_bumper_bgspecial_coli(struct Stobj_ *stobj, struct PhysicsBall *arg1)
{
    stobj_bumper_coli(stobj, arg1);
}

void func_8006C404(struct Stobj_ *stobj) {}
void func_8006C408(struct Stobj_ *stobj) {}

void stobj_jamabar_init(struct Stobj_ *arg0)
{
    arg0->unkC = 0;
    arg0->unk8 |= 0xA;
    arg0->model = lbl_802F1FFC;
    arg0->unk34 = arg0->model->boundSphereRadius * arg0->unk3C.x;
    arg0->g_model_origin = arg0->model->boundSphereCenter;
    arg0->unk58 = arg0->unkA8;
    arg0->unk90.x = 0.0f;
    arg0->unk90.y = 0.5f;
    arg0->unk90.z = 1.75f;
    arg0->unk9C = 1.0f;
}

void stobj_jamabar_main(struct Stobj_ *arg0)
{
    Vec spC;

    mathutil_mtxA_from_translate(&arg0->unkA8);
    mathutil_mtxA_rotate_z((s32) arg0->unk74);
    mathutil_mtxA_rotate_y((s32) arg0->unk72);
    mathutil_mtxA_rotate_x((s32) arg0->unk70);
    mathutil_mtxA_push();
    mathutil_mtxA_mult_left(animGroups[arg0->unkA0].transform);
    mathutil_mtxA_rigid_inv_tf_vec(&lbl_80206CF0, &spC);
    mathutil_mtxA_pop();
    spC.z *= 0.016;
    arg0->unkC0.z += spC.z;
    arg0->unkC0.z *= 0.97;
    arg0->unkB4.z += arg0->unkC0.z;
    if (arg0->unkB4.z < -2.5)
    {
        arg0->unkB4.z = -2.5f;
        if (arg0->unkC0.z < 0.0)
            arg0->unkC0.z = -arg0->unkC0.z;
    }
    else if (arg0->unkB4.z > 0.0)
    {
        arg0->unkB4.z = 0.0f;
        if (arg0->unkC0.z > 0.0)
            arg0->unkC0.z = -arg0->unkC0.z;
    }
    mathutil_mtxA_tf_point(&arg0->unkB4, &arg0->unk58);
    arg0->unk64.x = arg0->unk58.x - arg0->unk7C.x;
    arg0->unk64.y = arg0->unk58.y - arg0->unk7C.y;
    arg0->unk64.z = arg0->unk58.z - arg0->unk7C.z;
}

void stobj_jamabar_draw(struct Stobj_ *arg0)
{
    Vec spC;

    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&arg0->unk58);
    mathutil_mtxA_rotate_z(arg0->unk74);
    mathutil_mtxA_rotate_y(arg0->unk72);
    mathutil_mtxA_rotate_x(arg0->unk70);
    spC = arg0->unk3C;
    mathutil_mtxA_scale_xyz(spC.x, spC.y, spC.z);
    avdisp_set_bound_sphere_scale(spC.z);
    GXLoadPosMtxImm(mathutilData->mtxA, 0);
    GXLoadNrmMtxImm(mathutilData->mtxA, 0);
    avdisp_draw_model_culled_sort_translucent(arg0->model);
}

void stobj_jamabar_coli(struct Stobj_ *stobj, struct PhysicsBall *arg1)
{
    collide_ball_with_jamabar(arg1, stobj);
}

void func_8006C6C8(struct Stobj_ *stobj) {}

char string_OFS__X__7_3f_n[] = "OFS: X,%7.3f\n";
char string_OFS_SPD__X__7_3f_n[] = "OFS SPD: X,%7.3f\n";
char string__________Y__7_3f_n[] = "         Y,%7.3f\n";
char string__________Z__7_3f_n[] = "         Z,%7.3f\n";

void func_8006C6CC(struct Stobj_ *arg0)
{
    func_8002FCC0(2, lbl_801BE25C);
    func_8002FCC0(2, string_OFS__X__7_3f_n, arg0->unkB4.x);
    func_8002FCC0(2, string______Y__7_3f_n_2, arg0->unkB4.y);
    func_8002FCC0(2, string______Z__7_3f_n_2, arg0->unkB4.z);
    func_8002FD68(2, lbl_802F0B40);
    func_8002FCC0(2, string_OFS_SPD__X__7_3f_n, arg0->unkC0.x);
    func_8002FCC0(2, string__________Y__7_3f_n, arg0->unkC0.y);
    func_8002FCC0(2, string__________Z__7_3f_n, arg0->unkC0.z);
    func_8002FD68(2, lbl_802F0B40);
}

void stobj_dummy_init(struct Stobj_ *stobj) {}

void stobj_dummy_main(struct Stobj_ *stobj) {}

void stobj_dummy_draw(struct Stobj_ *stobj) {}

void stobj_dummy_coli(struct Stobj_ *stobj, struct PhysicsBall *arg1) {}

void func_8006C7B4(struct Stobj_ *stobj) {}

void func_8006C7B8(struct Stobj_ *stobj) {}

