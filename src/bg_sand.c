#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "event.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "ord_tbl.h"
#include "rend_efc.h"
#include "stage.h"

#pragma force_active on
struct BGModelSearch sandBgModelFind[] =
{
    { BG_MDL_CMP_FULL, "SND_KAGE_LOW_MAP_A" },
    { BG_MDL_CMP_FULL, "SND_STAGE_SAND_A" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_WATER_A_URA" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_WATER_B" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_WATER_B_URA" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_IND_A" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_GRAD_A" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_UP_TATE" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_UP_YOKO" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_DOWN_TATE" },
    { BG_MDL_CMP_FULL, "SND_FUNSUI_DOWN_YOKO" },
    { BG_MDL_CMP_END,  NULL },
};

struct BGModelSearch bonusBgObjFind[] =
{
    { BG_MDL_CMP_PREFIX, "SND_PIRAM_CLOUD" },
    { BG_MDL_CMP_PREFIX, "SND_FUNSUI_WATER" },
    { BG_MDL_CMP_END,    NULL },
};
#pragma force_active reset

void func_8005C3B8(struct RenderEffect *);
void func_8005C4D0(struct RenderEffect *);
void func_8005C540(struct RenderEffect *);
void func_8005C55C(int, struct RenderEffect *);

struct RenderEffectFuncs heatEffectFuncs =
{
    func_8005C3B8,
    func_8005C4D0,
    func_8005C540,
    func_8005C55C,
};

struct BGSandWork_sub_sub
{
    s32 unk0;
    float unk4;
    float unk8;
    s16 unkC;
    s16 unkE;
};  // size = 0x10

struct BGSandWork_sub
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
    float unk1C;
    float unk20;
    float unk24;
    float unk28;
    float unk2C;
    float unk30;
    struct BGSandWork_sub_sub unk34[6];
};  // size = 0x94

struct BGSandWork_child_child
{
    u8 filler0[8];
    Vec unk8;
};

struct BGSandWork_child
{
    u32 unk0;
    u8 filler4[4];
    struct BGSandWork_child_child *unk8;
    Vec unkC;
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
    Vec unk20;
};

struct Struct8005C3B8
{
    GXTexObj unk0;
    void *unk20;
    GXTexObj unk24;
    void *unk44;
    s32 unk48;
};  // size = 0x4C

struct BGSandWork
{
    s32 unk0;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
    Vec unk1C;
    Vec unk28;
    s32 unk34;
    struct Struct8005C3B8 *unk38;
    u8 filler3C[4];
    u32 unk40;
    struct BGSandWork_child *unk44[8];
    float unk64;
    float unk68;
    float unk6C;
    Vec unk70;
    u32 unk7C;
    struct BGSandWork_sub unk80[8];
    struct BGSandWork_child *unk520[14];
    s32 unk558;
    u8 filler55C[4];
    s32 unk560;
    u8 filler564[8];
};  // size = 0x56C

int lbl_8005E000(int, struct GMAModelEntry *);
int lbl_8005E0A8(int, struct StageBgObject *);

void bg_sand_init(void)
{
    struct BGSandWork *work = backgroundInfo.work;
    Vec sp20;
    struct RenderEffect sp8;
    float temp_f0;
    float temp_f0_2;
    int var_r29;
    int var_r28;
    struct BGSandWork_sub *var_r27;
    struct BGSandWork_sub_sub *var_r26;

    bg_default_init();
    if (work->unk0 == 0)
    {
        find_background_gma_models(sandBgModelFind, lbl_8005E000);
        work->unk0 = 1;
    }
    work->unk40 = 0;
    work->unk7C = 0;
    find_background_objects(
        decodedStageLzPtr->bgObjects,
        decodedStageLzPtr->bgObjectCount,
        bonusBgObjFind,
        lbl_8005E0A8);
    find_background_objects(
        decodedStageLzPtr->fgObjects,
        decodedStageLzPtr->fgObjectCount,
        bonusBgObjFind,
        lbl_8005E0A8);
    if (modeCtrl.unk30 < 2)
    {
        memset(&sp8, 0, sizeof(sp8));
        sp8.cameraMask = 0xFFFF;
        sp8.funcs = &heatEffectFuncs;
        rend_efc_enable(0, 0, &sp8);
    }
    work->unk4 = 6.0f + ((rand() / 32767.0f) - 0.5f);
    work->unk8 = 4.0f + ((rand() / 32767.0f) - 0.5f);
    work->unkC = 1.0f;
    work->unk10 = 0.0f;
    work->unk14 = 0.0f;
    work->unk18 = 0.0f;
    work->unk1C.x = (rand() / 32767.0f) - 0.5f;
    work->unk1C.y = 1.0f;
    work->unk1C.z = (rand() / 32767.0f) - 0.5f;
    mathutil_vec_set_len(&work->unk1C, &work->unk1C, 0.02f + (0.01f * ((rand() / 32767.0f) - 0.5f)));
    mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
    mathutil_mtxA_tf_vec_xyz(&work->unk28, 0.0f, 0.45f + (0.1f * (rand() / 32767.0f)), 0.0f);
    temp_f0 = work->unk4 / 6.0f;
    work->unk28.x *= temp_f0 * temp_f0;
    temp_f0_2 = work->unk8 / 4.0f;
    work->unk28.y *= temp_f0_2 * temp_f0_2;
    work->unk64 = (rand() / 32767.0f);
    work->unk68 = (rand() / 32767.0f);
    work->unk6C = (rand() / 32767.0f);
    sp20.x = 0.0016666667f;
    sp20.y = 0.0f;
    sp20.z = 0.0f;
    mathutil_mtxA_from_rotate_z(rand() & 0x7FFF);
    mathutil_mtxA_tf_vec(&sp20, &work->unk70);

    var_r27 = work->unk80;
    for (var_r29 = work->unk7C; var_r29 > 0; var_r29--, var_r27++)
    {
        var_r27->unkC =  0.008333334f * (0.5f - (rand() / 32767.0f));
        var_r27->unk10 = 0.008333334f * (1.0f + (0.1f * (rand() / 32767.0f)));
        var_r27->unk14 = 0.0f;
        var_r27->unk24 = 0.010000001f * (0.5f - (rand() / 32767.0f));
        var_r27->unk28 = 0.010000001f * (1.0f + (0.1f * (rand() / 32767.0f)));
        var_r27->unk2C = 0.0f;
        var_r27->unk30 = 0.7f + (0.2f * (rand() / 32767.0f));
        var_r26 = var_r27->unk34;
        for (var_r28 = 6; var_r28 > 0; var_r28--, var_r26++)
        {
            if (var_r28 < 3)
                var_r26->unk0 = work->unk558;
            else
                var_r26->unk0 = work->unk560;
            var_r26->unk4 = (rand() / 32767.0f);
            var_r26->unk8 = var_r27->unk28 * (rand() / 32767.0f);
            var_r26->unkC = (rand() & 0x7FFF);
            var_r26->unkE = (rand() & 0x7F) - 0x40;
        }
    }
}

void bg_sand_main(void)
{
    struct BGSandWork *work = backgroundInfo.work;
    int var_r30;
    int var_r29;
    struct BGSandWork_sub *var_r28;
    struct BGSandWork_sub_sub *var_r27;

    bg_default_main();
    if ((gamePauseStatus & 0xA) && (eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING))
        return;

    work->unk1C.y += 0.001f * (0.03f - work->unk1C.y);
    work->unk10 += work->unk1C.x;
    work->unk14 += work->unk1C.y;
    work->unk18 += work->unk1C.z;
    work->unk64 += work->unk70.x;
    work->unk68 += work->unk70.y;

    var_r28 = work->unk80;
    for (var_r30 = work->unk7C; var_r30 > 0; var_r30--, var_r28++)
    {
        float temp_f29;
        float temp_f28;

        var_r28->unk0 += var_r28->unkC;
        var_r28->unk4 += var_r28->unk10;
        var_r28->unk8 += var_r28->unk14;
        var_r28->unk18 += var_r28->unk24;
        var_r28->unk1C += var_r28->unk28;
        var_r28->unk20 += var_r28->unk2C;
        temp_f28 = __fabs(var_r28->unk28);
        temp_f29 = 3.0f * temp_f28;

        var_r27 = var_r28->unk34;
        for (var_r29 = 6; var_r29 > 0; var_r29--, var_r27++)
        {
            var_r27->unk8 += 0.05f * (temp_f28 - var_r27->unk8);
            var_r27->unk4 += var_r27->unk8;
            var_r27->unkE -= var_r27->unkE >> 5;
            var_r27->unkC += var_r27->unkE;
            if (var_r27->unk4 > 1.0f)
            {
                while (var_r27->unk4 > 1.0f)
                    var_r27->unk4 -= 1.0f;
                var_r27->unk8 = temp_f29 * (rand() / 32767.0f);
                var_r27->unkC = rand() & 0x7FFF;
                var_r27->unkE = (rand() & 0x3FF) - 0x200;
            }
        }
    }
}

void bg_sand_finish(void) {}

struct MyDrawNode
{
    struct OrdTblNode node;
    s32 unk8;
    void *unkC;
    Mtx unk10;
};

struct MyDrawNode2
{
    struct OrdTblNode node;
    s32 unk8;
    s32 unkC;
};

void lbl_8005CB90(struct OrdTblNode *);
void lbl_8005CC4C(struct OrdTblNode *);

void bg_sand_draw(void)
{
    struct BGSandWork *work = backgroundInfo.work;
    struct BGSandWork_child *temp_r28;
    struct OrdTblNode *temp_r25;
    u32 var_r30;
    struct BGSandWork_child **var_r27;
    struct MyDrawNode *temp_r24;
    struct MyDrawNode2 *temp_r24_2;
    int i;

    if (lbl_801EEC90.unk0 & 0x11)
        var_r30 = 0x10;
    else if (gameMode == 2 || gameMode == 4)
        var_r30 = 1 << (modeCtrl.unk30 - 1);
    else
        var_r30 = 1;

    var_r27 = work->unk44;
    for (i = work->unk40; i > 0; i--, var_r27++)
        (*var_r27)->unk0 &= 0xFFFEFFFF;

    var_r27 = work->unk520;
    for (i = work->unk7C; i > 0; i--, var_r27++)
        (*var_r27)->unk0 &= 0xFFFEFFFF;

    bg_default_draw();
    if (work->unk40 != 0)
    {
        var_r27 = work->unk44;
        for (i = work->unk40; i > 0; i--, var_r27++)
        {
            temp_r28 = *var_r27;
            if (temp_r28->unk0 & var_r30)
            {
                mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
                mathutil_mtxA_translate(&temp_r28->unkC);
                mathutil_mtxA_rotate_z(temp_r28->unk1C);
                mathutil_mtxA_rotate_y(temp_r28->unk1A);
                mathutil_mtxA_rotate_x(temp_r28->unk18);
                mathutil_mtxA_scale(&temp_r28->unk20);
                temp_r25 = ord_tbl_get_entry_for_pos(&temp_r28->unk8->unk8);
                temp_r24 = ord_tbl_alloc_node(sizeof(*temp_r24));
                temp_r24->node.drawFunc = lbl_8005CB90;
                temp_r24->unk8 = peek_light_group();
                temp_r24->unkC = temp_r28;
                mathutil_mtxA_to_mtx(temp_r24->unk10);
                ord_tbl_insert_node(temp_r25, (void *)temp_r24);
            }

        }
    }

    if (work->unk7C != 0)
    {
        mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);

        var_r27 = work->unk520;
        for (i = 0; i < work->unk7C; i++, var_r27++)
        {
            temp_r28 = *var_r27;
            if (temp_r28->unk0 & var_r30)
            {
                temp_r25 = ord_tbl_get_entry_for_pos(&temp_r28->unkC);
                temp_r24_2 = ord_tbl_alloc_node(sizeof(*temp_r24_2));
                temp_r24_2->node.drawFunc = &lbl_8005CC4C;
                temp_r24_2->unk8 = peek_light_group();
                temp_r24_2->unkC = i;
                ord_tbl_insert_node(temp_r25, (void *)temp_r24_2);
            }
        }
    }
}

void bg_sand_interact(int arg0) {}

extern void *lbl_802F1B40;

void func_8005C3B8(struct RenderEffect *rendEfc)
{
    struct Struct8005C3B8 *temp_r3;
    size_t texSize;

    rendEfc->enableFlags = 8;
    temp_r3 = OSAllocFromHeap(stageHeap, 0x4CU);
    if (temp_r3 == NULL)
    {
        rendEfc->state = 0;
        return;
    }
    rendEfc->work = temp_r3;
    temp_r3->unk20 = lbl_802F1B40;
    GXInitTexObj(&temp_r3->unk0, temp_r3->unk20, 640, 448, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0U);
    texSize = GXGetTexBufferSize(640, 448, 1U, 0U, 0U);
    temp_r3->unk44 = OSAllocFromHeap(stageHeap, texSize);
    if (temp_r3->unk44 == NULL)
    {
        OSFreeToHeap(stageHeap, temp_r3);
        rendEfc->state = 0;
        return;
    }
    GXInitTexObj(&temp_r3->unk24, temp_r3->unk44, 640, 448, GX_TF_I8, GX_CLAMP, GX_CLAMP, 0U);
    temp_r3->unk48 = ((struct BGSandWork *)backgroundInfo.work)->unk34;
    ((struct BGSandWork *)backgroundInfo.work)->unk38 = temp_r3;
}

void func_8005C4D0(struct RenderEffect *arg0)
{
    struct Struct8005C3B8 *temp_r3;

    temp_r3 = arg0->work;
    if (temp_r3 != NULL)
    {
        if (temp_r3->unk44 != NULL)
            OSFreeToHeap(stageHeap, temp_r3->unk44);
        OSFreeToHeap(stageHeap, arg0->work);
    }
    if (backgroundInfo.bgId == BG_TYPE_SND)
        ((struct BGSandWork *)backgroundInfo.work)->unk38 = NULL;
}

void func_8005C540(struct RenderEffect *arg0)
{
    if (backgroundInfo.bgId != BG_TYPE_SND)
        arg0->state = 3;
}
