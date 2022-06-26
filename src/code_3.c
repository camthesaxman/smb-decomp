#include <stdlib.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "gma.h"
#include "light.h"
#include "mot_ape.h"
#include "nl2ngc.h"

extern s8 lbl_802F2060;

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
            if ((advDemoInfo.flags & 0x100) != 0)
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
