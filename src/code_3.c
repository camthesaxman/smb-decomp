#include <stdlib.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "gma.h"
#include "light.h"
#include "mathutil.h"
#include "mot_ape.h"
#include "nl2ngc.h"

extern s8 lbl_802F2060;

void func_80086434(int arg0, struct GMAModel *arg1);
struct GMAShape *func_80086538(struct GMAShape *);

void func_80085C0C(int arg0)
{
    struct Color3f ambient;

    if (lbl_802F2060 == 0)
    {
        get_curr_light_group_ambient(&ambient);
        switch (arg0)
        {
        case 0:
            avdisp_set_ambient(ambient.r, ambient.g, ambient.b);
            return;
        case 1:
            nl2ngc_set_ambient(1.35f * ambient.r, 1.35f * ambient.g, 1.35f * ambient.b);
            break;
        }
    }
}

u8 lbl_802B2E70[0x900];
FORCE_BSS_ORDER(lbl_802B2E70)
s32 lbl_802B3770[0x10];  // 0x900
u32 lbl_802B37B0[0x10];

extern u32 lbl_801C6848[];
extern u32 lbl_801C6648[][16];

void func_80085C94(struct Ape *arg0)
{
    int var_r6;
    int r0;
    struct GMAModel *model;

    var_r6 = arg0->unk90 >> 1;
    r0 = var_r6 + (arg0->charaId << 1);
    if (arg0->flags & 0x8000)
    {
        int r4;

        if (!(gamePauseStatus & 0xA))
            lbl_802B3770[arg0->unk70]++;
        r4 = lbl_802B3770[arg0->unk70] % 45;
        var_r6 = r4;
        if (r4 == 44)
            arg0->flags &= 0xFFFF7FFF;
    }
    else
    {
        if (arg0->unk24 != 0)
            arg0->flags |= 0x8000;
        var_r6 = 0;
        lbl_802B3770[arg0->unk70] = 0;
    }
    model = charaGMAs[r0]->modelEntries[lbl_801C6848[var_r6]].model;
    avdisp_draw_model_unculled_sort_none(model);
}

void func_80085DB0(struct Ape *ape)
{
    if (!(gamePauseStatus & 0xA) && (ape->flags & 0x80))
    {
        lbl_802B37B0[ape->unk70]++;
        return;
    }
    if (!(advDemoInfo.flags & 0x100) && (rand() & 0xFF) > 0xFA)
        ape->flags |= 0x80;
}

void func_80085E44(struct Ape *arg0)
{
    s32 var_r8;
    int var_r7;
    struct GMAModel *model;
    int r0;

    r0 = (arg0->unk90 >> 1) + (arg0->charaId << 1);
    if (!(arg0->flags & 0x10000))
    {
        if (arg0->flags & 0x80)
        {
            int temp_r4 = lbl_802B37B0[arg0->unk70] % 64;
            var_r8 = temp_r4;
            if (temp_r4 > 15)
            {
                if (var_r8 > 60)
                    arg0->flags &= 0xFFFFFF7F;
                var_r8 = 0;
            }
        }
        else
        {
            if (advDemoInfo.flags & 0x100)
            {
                if (arg0->charaId == 2)
                    var_r7 = 0xB4;
                else
                    var_r7 = 0xF0;
                if (advDemoInfo.unk8 % var_r7 == arg0->charaId * 80)
                    arg0->flags |= 0x80;
            }
            lbl_802B37B0[arg0->unk70] = 0;
            var_r8 = 0;
        }
        model = charaGMAs[r0]->modelEntries[lbl_801C6648[((arg0->unk90 >> 1) * 4 + arg0->charaId)][var_r8]].model;
        avdisp_draw_model_unculled_sort_none(model);
    }
}

extern u16 lbl_801C68FC[];

static inline void func_80085F94_sub(struct GMAModel *temp_r31, int temp_r10)
{
    struct GMATevLayer *var_r7;
    int var_r6;
    u16 *arr;

    arr = lbl_801C68FC;
    var_r7 = temp_r31->tevLayers;
    for (var_r6 = 0; var_r6 < temp_r31->tevLayerCount; var_r6++)
    {
        if (arr[0] != (u16) var_r7->texIndex)
        {
            if (temp_r10 != 0)
            {
                var_r7->texObj = &lbl_802B47E0[2][arr[temp_r10]];
                var_r7->flags |= 0x10000;
            }
            else
            {
                var_r7->texObj = &temp_r31->texObjs[var_r6];
                var_r7->flags &= 0xFFFEFFFF;
            }
            var_r7->texObj = &lbl_802B47E0[2][arr[1]];
        }
        var_r7++;
    }
}

void func_80085F94(struct Ape *ape, s16 *arg1)
{
    u8 unused2[8];
    struct Color3f sp18;
    u8 unused[8];
    struct GMAModel *temp_r31;

    temp_r31 = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[*arg1].model;
    if (lbl_802F2060 == 0)
    {
        get_curr_light_group_ambient(&sp18);
        avdisp_set_ambient(sp18.r, sp18.g, sp18.b);
    }
    func_80085F94_sub(temp_r31, ape->colorId);
    avdisp_draw_model_unculled_sort_none(temp_r31);
    if (lbl_802F2060 == 0)
        apply_curr_light_group_ambient();
}

extern s16 lbl_801C6904[];

void func_800860E4(struct Ape *ape, s16 *arg1)
{
    u8 unused[0x10];
    struct GMAModel *temp_r30 = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[*arg1].model;
    struct Struct8003699C_child_sub *temp_r29 = &ape->unk0->unk4114;
    struct JointBoneThing *joints = temp_r29->unk38;
    s16 *var_r4;
    Mtx **var_r5;

    if (((gamePauseStatus & 0xA) == 0) && ((ape->flags & 8) == 0))
    {
        mathutil_mtxA_push();
        func_80036510(temp_r29);
        mathutil_mtxA_pop();
    }

    var_r4 = lbl_801C6904;
    var_r5 = u_animTransformMatrices;
    while (*var_r4 != -1)
    {
        *var_r5 = &joints[*var_r4].transformMtx;
        var_r4++;
        var_r5++;
    }

    if (ape->charaId == 2)
        func_80086434(ape->colorId, temp_r30);
    avdisp_draw_model_unculled_sort_none(temp_r30);
}

void func_800861EC(struct Ape *ape, s16 *arg1)
{
    u8 unused[0x10];
    struct GMAModel *temp_r30 = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[*arg1].model;
    struct Struct8003699C_child_sub *temp_r29 = &ape->unk0->unk84;
    struct JointBoneThing *joints = temp_r29->unk38;
    s16 *var_r4;
    Mtx **var_r5;

    if (((gamePauseStatus & 0xA) == 0) && ((ape->flags & 8) == 0))
    {
        mathutil_mtxA_push();
        func_80036510(temp_r29);
        mathutil_mtxA_pop();
    }

    var_r4 = lbl_801C6904;
    var_r5 = u_animTransformMatrices;
    while (*var_r4 != -1)
    {
        *var_r5 = &joints[*var_r4].transformMtx;
        var_r4++;
        var_r5++;
    }

    if (ape->charaId == 2)
        func_80086434(ape->colorId, temp_r30);
    avdisp_draw_model_unculled_sort_none(temp_r30);
}

struct GMAShape *func_800862F4(struct GMAModel *model)
{
    int temp_r4;
    struct GMAShape *shape;
    u8 *ptr;
    int i;

    temp_r4 = model->opaqueShapeCount;
    shape = (struct GMAShape *)((u8 *)model + model->headerSize);
    while (temp_r4 > 0)
    {
        if (shape->tevLayerCount == 0)
            return shape;
        ptr = shape->dispLists;
        for (i = 0; i < 2; i++)
        {
            if (shape->dispListFlags & (1 << i))
                ptr += shape->dispListSizes[i];
        }
        if ((shape->dispListFlags & 0xC) != 0)
        {
            struct GMAExtraDispLists *extra = (void *)ptr;

            ptr += 0x20;
            ptr += extra->dispListSizes[0];
            ptr += extra->dispListSizes[1];
        }
        shape = (struct GMAShape *)ptr;
        temp_r4--;
    }
    return NULL;
}

struct GMAShape *func_8008638C(struct GMAModel *model)
{
    int temp_r4;
    struct GMAShape *shape;
    u8 *ptr;
    int i;
    int r7 = 0;

    temp_r4 = model->opaqueShapeCount;
    shape = (struct GMAShape *)((u8 *)model + model->headerSize);
    while (temp_r4 > 0)
    {
        if (shape->tevLayerCount == 0)
        {
            if (r7)
                return shape;
            r7 = 1;
        }
        ptr = shape->dispLists;
        for (i = 0; i < 2; i++)
        {
            if (shape->dispListFlags & (1 << i))
                ptr += shape->dispListSizes[i];
        }
        if ((shape->dispListFlags & 0xC) != 0)
        {
            struct GMAExtraDispLists *extra = (void *)ptr;

            ptr += 0x20;
            ptr += extra->dispListSizes[0];
            ptr += extra->dispListSizes[1];
        }
        shape = (struct GMAShape *)ptr;
        temp_r4--;
    }
    return NULL;
}

extern GXColor lbl_801C692C[];

static struct GMAShape *func_80086434_sub1(struct GMAModel *model)
{
    int i;
    struct GMAShape *shape;

    shape = (struct GMAShape *)((u8 *)model + model->headerSize);
    for (i = 0; i < model->opaqueShapeCount; i++)
    {
        if (shape->tevLayerCount == 0)
            return shape;
        shape = func_80086538(shape);
    }
    return NULL;
}

static struct GMAShape *func_80086434_sub2(struct GMAModel *model)
{
    int i;
    int var_r30_2;
    struct GMAShape *shape;

    var_r30_2 = 0;
    shape = (struct GMAShape *)((u8 *)model + model->headerSize);
    for (i = 0; i < model->opaqueShapeCount; i++)
    {
        if (shape->tevLayerCount == 0)
        {
            if (var_r30_2)
                return shape;
            var_r30_2 = 1;
        }
        shape = func_80086538(shape);
    }
    return NULL;
}

void func_80086434(int colorId, struct GMAModel *model)
{
    register struct GMAShape *shape;

    if ((shape = func_80086434_sub1(model)) == NULL)
        return;
    shape->materialColor = lbl_801C692C[colorId];
    shape->ambientColor = lbl_801C692C[colorId];

    if ((shape = func_80086434_sub2(model)) == NULL)
        return;
    shape->materialColor = lbl_801C692C[colorId];
    shape->ambientColor = lbl_801C692C[colorId];
}

struct GMAShape *func_80086538(struct GMAShape *shape)
{
    int i;
    u8 *ptr = shape->dispLists;

    for (i = 0; i < 2; i++)
    {
        if (shape->dispListFlags & (1 << i))
            ptr += shape->dispListSizes[i];
    }
    if ((shape->dispListFlags & 0xC) != 0)
    {
        struct GMAExtraDispLists *extra = (void *)ptr;

        ptr += 0x20;
        ptr += extra->dispListSizes[0];
        ptr += extra->dispListSizes[1];
    }
    return (struct GMAShape *)ptr;
}

void func_800865A4(struct Ape *ape, s16 *arg1)
{
    u8 unused2[8];
    struct Color3f sp14;
    u8 unused[4];
    s32 colorId;
    struct GMAModel *temp_r30;
    struct GMAShape *shape;

    temp_r30 = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[*arg1].model;
    if (lbl_802F2060 == 0)
    {
        get_curr_light_group_ambient(&sp14);
        avdisp_set_ambient(sp14.r, sp14.g, sp14.b);
    }
    colorId = ape->colorId;
    shape = func_800862F4(temp_r30);
    if (shape != NULL)
    {
        shape->materialColor = lbl_801C692C[colorId];
        shape->ambientColor = lbl_801C692C[colorId];
        shape = func_8008638C(temp_r30);
        if (shape != NULL)
        {
            shape->materialColor = lbl_801C692C[colorId];
            shape->ambientColor = lbl_801C692C[colorId];
        }
    }
    avdisp_draw_model_unculled_sort_none(temp_r30);
    if (lbl_802F2060 == 0)
        apply_curr_light_group_ambient();
}

struct Struct8008669C_sub
{
    Vec unk0;
    Vec unkC;
};

struct Struct8008669C
{
    Vec unk0;
    Vec unkC;
    struct Struct8008669C_sub unk18[3];
    s16 unk60[4];
};  // size = 0x68

void func_8008669C(u32 *arg0, struct Struct8008669C *arg1, int arg2, float arg8)
{
    int i;
    int j;
    u32 *temp_r21;
    Vec sp2C;
    Vec sp20;
    u32 r29, r28, r27;
    u32 x, y, z;

    for (i = 0; i < arg2; i++)
    {
        mathutil_scale_ray(&arg1[i].unk0, &arg1[i].unkC, &sp2C, arg8);
        r29 = *(u32 *)&sp2C.x | 1;
        r28 = *(u32 *)&sp2C.y;
        r27 = *(u32 *)&sp2C.z;
        for (j = 0; j < 3; j++)
        {
            s16 r0;

            if (arg1[i].unk60[j] == -1)
                break;
            r0 = arg1[i].unk60[j] >> 2;
            temp_r21 = &arg0[r0];
            temp_r21[0] = r29;
            temp_r21[1] = r28;
            temp_r21[2] = r27;
            mathutil_scale_ray(&arg1[i].unk18[j].unk0, &arg1[i].unk18[j].unkC, &sp20, arg8);
            x = *(u32 *)&sp20.x | 1;
            y = *(u32 *)&sp20.y;
            z = *(u32 *)&sp20.z;
            temp_r21[3] = x;
            temp_r21[4] = y;
            temp_r21[5] = z;
        }
    }
}
