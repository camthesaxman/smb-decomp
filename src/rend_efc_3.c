#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "mathutil.h"
#include "mode.h"

struct Struct800993A8_sub_child
{
    u8 filler0[0x14];
    float unk14;
};

struct Struct800993A8_sub
{
    s32 unk0;
    Vec unk4;
    Vec unk10;
    struct Struct800993A8_sub_child *unk1C;
    float unk20;
    float unk24;
    s16 unk28;
    s16 unk2A;
    float unk2C;
};  // size = 0x30

struct Struct800993A8
{
    u8 filler20[0x20];
    u32 unk20;
    void *unk24;
    u16 unk28;
    u16 unk2A;
    u8 filler2C[0x4C-0x2C];
    void *unk4C;
    Mtx unk50;
    u8 filler80[4];
    u8 unk84;
    u8 filler85[0x88-0x85];
    float unk88;
    s32 unk8C;
    struct Struct800993A8_sub unk90[256];
};

struct BGPilotWork
{
    u8 filler0[0x2C];
    s32 unk2C;
    struct Struct800993A8_sub_child *unk30[0x2C];
    void *unkE0;
};

void func_800993A8(struct Struct802BA1A0 *arg0)
{
    struct Struct800993A8 *temp_r3;
    size_t bufSize;

    arg0->unk8 = 3;
    temp_r3 = OSAllocFromHeap(stageHeap, 0x3090U);
    if (temp_r3 == NULL)
    {
        arg0->unk0 = 0;
        return;
    }
    memset(temp_r3, 0, 0x3090U);
    arg0->unk10 = (void *)temp_r3;
    temp_r3->unk20 = 4;
    temp_r3->unk28 = 0x280;
    temp_r3->unk2A = 0x1C0;
    temp_r3->unk24 = lbl_802F1B40;
    bufSize = GXGetTexBufferSize(0x100U, 0x100U, 3U, 0U, 0U);
    temp_r3->unk4C = OSAllocFromHeap(stageHeap, bufSize);
    if (temp_r3->unk4C == NULL)
    {
        OSFreeToHeap(stageHeap, temp_r3);
        arg0->unk0 = 0;
        return;
    }
    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(temp_r3->unk50);
    temp_r3->unk84 = 0x60;
    ((struct BGPilotWork *)backgroundInfo.work)->unkE0 = temp_r3;
}

void func_800994A8(struct Struct802BA1A0 *arg0)
{
    struct Struct800993A8 *temp_r3 = (void *)arg0->unk10;

    if (temp_r3 != NULL)
    {
        if (temp_r3->unk4C != NULL)
            OSFreeToHeap(stageHeap, temp_r3->unk4C);
        OSFreeToHeap(stageHeap, arg0->unk10);
    }
    if (backgroundInfo.bgId == BG_TYPE_PIL)
        ((struct BGPilotWork *)backgroundInfo.work)->unkE0 = NULL;
}

void func_80099518(struct Struct802BA1A0 *arg0)
{
    Vec sp18;
    Vec spC;
    f32 temp_f10;
    f32 var_f31;
    float f1;
    int i;
    struct Struct800993A8 *temp_r31;
    struct Struct800993A8_sub *var_r30;
    struct BGPilotWork *temp_r29;
    struct Ball *temp_r28;

    if (gamePauseStatus & 0xA)
        return;

    temp_r31 = (void *)arg0->unk10;
    temp_r29 = backgroundInfo.work;
    temp_r28 = &ballInfo[modeCtrl.currPlayer];

    mathutil_vec_len(&temp_r28->vel);  //! result not used

    sp18 = temp_r28->pos;
    spC = temp_r28->vel;
    f1 = mathutil_vec_len(&spC);
    temp_f10 = __fabs(sp18.y);
    sp18.x += 3.0f * (spC.x * temp_f10);
    sp18.z += 3.0f * (spC.z * temp_f10);
    var_f31 = (f1 * (4.0f / (1.0f + temp_f10)));
    var_f31 -= 0.1f;
    if (var_f31 > 0.0f)
    {
        temp_r31->unk88 += var_f31;
        if (temp_r31->unk88 > 1.0f)
        {
            temp_r31->unk88 = 0.0f;
            if (var_f31 > 0.5f)
                var_f31 = 0.5f;
            var_r30 = &temp_r31->unk90[temp_r31->unk8C--];
            if (temp_r31->unk8C < 0)
                temp_r31->unk8C = 0xFF;
            var_r30->unk0 = 60.0f * (0.5f + (rand() / 32767.0f) * var_f31 * 2.0f);
            var_r30->unk4.x = sp18.x;
            var_r30->unk4.y = 0.0f;
            var_r30->unk4.z = sp18.z;
            var_r30->unk10.x = 0.5f * spC.x;
            var_r30->unk10.y = 0.0f;
            var_r30->unk10.z = 0.5f * spC.z;
            var_r30->unk1C = temp_r29->unk30[(rand() & 0x7FFF) % temp_r29->unk2C];
            var_r30->unk20 = 1.0f / var_r30->unk1C->unk14;
            var_r30->unk24 = var_r30->unk20 * ((1.0f + (rand() / 32767.0f)) * var_f31 * 0.55f);
            var_r30->unk28 = rand() & 0x7FFF;
            var_r30->unk2A = 16384.0f * ((rand() / 32767.0f) - 0.5f);
            var_r30->unk2C = 0.2f;
        }
    }

    var_r30 = temp_r31->unk90;
    for (i = 0; i < 256; i++, var_r30++)
    {
        if (var_r30->unk0 != 0)
        {
            var_r30->unk10.x *= 0.92f;
            var_r30->unk10.y *= 0.92f;
            var_r30->unk10.z *= 0.92f;
            var_r30->unk4.x += var_r30->unk10.x;
            var_r30->unk4.y += var_r30->unk10.y;
            var_r30->unk4.z += var_r30->unk10.z;
            var_r30->unk2A -= var_r30->unk2A >> 7;
            var_r30->unk28 += var_r30->unk2A;
            var_r30->unk24 *= 0.99f;
            var_r30->unk20 += var_r30->unk24;
            var_r30->unk0--;
            if ((float)var_r30->unk0 < 60.0f)
                var_r30->unk2C *= (float)var_r30->unk0 / (float)(var_r30->unk0 + 1);
            else
                var_r30->unk2C += 0.3f * (1.0f - var_r30->unk2C);
        }
    }
}

