#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "camera.h"
#include "event.h"

struct Struct802BA1A0_child
{
    void (*unk0)(struct Struct802BA1A0 *);
    void (*unk4)(struct Struct802BA1A0 *);
    void (*unk8)(struct Struct802BA1A0 *);
    void (*unkC)(int, struct Struct802BA1A0 *);
};

struct Struct802BA1A0 lbl_802BA1A0[4];

void ev_rend_efc_init(void)
{
    memset(lbl_802BA1A0, 0, sizeof(lbl_802BA1A0));
}

void ev_rend_efc_main(void)
{
    int i;
    struct Struct802BA1A0 *r29 = lbl_802BA1A0;

    for (i = 4; i > 0; i--, r29++)
    {
        if (r29->unk0 != 0)
        {
            struct Struct802BA1A0_child *r31 = r29->unk14;
            void (*r0)(struct Struct802BA1A0 *) = r31->unk8;

            if (r0 != NULL)
                r0(r29);
            if (r29->unk0 == 3)
            {
                if (r31->unk4 != NULL)
                    r31->unk4(r29);
                r29->unk0 = 0;
            }
        }
    }
}

void ev_rend_efc_dest(void)
{
    int i;
    struct Struct802BA1A0 *r29 = lbl_802BA1A0;

    for (i = 4; i > 0; i--, r29++)
    {
        if (r29->unk0 != 0)
        {
            void (*r0)(struct Struct802BA1A0 *) = r29->unk14->unk4;

            if (r0 != NULL)
                r0(r29);
            r29->unk0 = 0;
        }
    }
}

void func_80095398(int arg0)
{
    int i;
    struct Struct802BA1A0 *r29 = lbl_802BA1A0;
    u16 r31 = 1 << u_cameraId1;

    for (i = 4; i > 0; i--, r29++)
    {
        if (r29->unk0 != 0 && (r29->unk8 & arg0) && (r29->unk6 & r31))
        {
            void (*r0)(int, struct Struct802BA1A0 *) = r29->unk14->unkC;

            if (r0 != NULL)
                r0(arg0, r29);
        }
    }
}

struct Struct802BA1A0_child lbl_801D3CE8[] =
{
    { NULL,          NULL,          NULL,          NULL          },
    { func_8009557C, func_800955FC, func_8009562C, func_80095630 },
    { func_80095C6C, func_80095D3C, func_80095D90, func_80095D94 },
    { func_80096134, func_80096228, func_80096258, func_800963AC },
    { func_80096A30, func_80096B3C, func_80096BA8, func_80096BE0 },
    { func_800973A0, func_80097664, func_800976B8, func_800976BC },
    { func_8009826C, func_800983A0, func_8009840C, func_80098410 },
};

void func_8009544C(int arg0, int arg1, struct Struct802BA1A0 *arg2)
{
    struct Struct802BA1A0 *temp_r3;
    void (*temp_r0)(struct Struct802BA1A0 *);

    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
    {
        temp_r3 = &lbl_802BA1A0[arg0];
        if (temp_r3->unk0 != 0)
        {
            temp_r0 = temp_r3->unk14->unk4;
            if (temp_r0 != NULL)
                temp_r0(temp_r3);
            temp_r3->unk0 = 0;
        }
        memcpy(temp_r3, arg2, sizeof(*temp_r3));
        if (arg1 != 0)
            temp_r3->unk14 = &lbl_801D3CE8[arg1];
        if (temp_r3->unk14 == NULL)
        {
            temp_r3->unk0 = 0;
            return;
        }
        temp_r3->unk0 = 1;
        if (temp_r3->unk14->unk0 != NULL)
            temp_r3->unk14->unk0(temp_r3);
        if (temp_r3->unk0 == 3)
        {
            if (temp_r3->unk14->unk4 != NULL)
                temp_r3->unk14->unk4(temp_r3);
            temp_r3->unk0 = 0;
        }
    }
}

void func_8009557C(struct Struct802BA1A0 *arg0)
{
    struct Struct8009557C *temp_r3;

    arg0->unk8 = 8;
    temp_r3 = OSAlloc(sizeof(*temp_r3));
    if (temp_r3 == NULL)
    {
        arg0->unk10 = NULL;
        arg0->unk0 = 0;
    }
    else
    {
        arg0->unk10 = temp_r3;
        temp_r3->unk20 = lbl_802F1B40;
        GXInitTexObj(&temp_r3->unk0, temp_r3->unk20, 640, 448, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, 0U);
    }
}

void func_800955FC(struct Struct802BA1A0 *arg0)
{
    if (arg0->unk10 != NULL)
        OSFree(arg0->unk10);
}

void func_8009562C(struct Struct802BA1A0 *arg0) {}
