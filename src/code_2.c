#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "nl2ngc.h"

float func_8008CDC0(float arg0, struct Struct80176434 *arg1)
{
    float temp_f10;
    float temp_f11;
    float temp_f12;
    float temp_f13;
    float ret;
    struct Struct80176434 *phi_r6;

    if (arg0 < arg1->unk0)
        return arg1->unk4;

    phi_r6 = arg1 + 1;
    while (arg0 > phi_r6->unk0)
    {
		if (phi_r6->unk0 == 0xFFFF)
		{
			phi_r6--;
			break;
		}
		phi_r6++;
	}

    temp_f10 = phi_r6->unk0 - phi_r6[-1].unk0;
    temp_f11 = (arg0 - phi_r6[-1].unk0) / temp_f10;
    temp_f12 = temp_f11 * temp_f11;
    temp_f13 = temp_f12 * temp_f11;
    ret = phi_r6[-1].unk4 * (2.0 * temp_f13 - 3.0 * temp_f12 + 1.0)
        + phi_r6->unk4 * (-2.0 * temp_f13 + 3.0 * temp_f12);
    ret += temp_f10 * (phi_r6[-1].unkC * (temp_f13 - 2.0 * temp_f12 + temp_f11) + phi_r6->unk8 * (temp_f13 - temp_f12));
    return ret;
}

static struct Struct8008CF00 *lbl_802F20B8;
static struct Struct8008CF00 *lbl_802F20BC;
static struct Struct8008CF00 *lbl_802F20C0;
static struct Struct8008CF00 *lbl_802F20C4;
static struct Struct8008CF00 *lbl_802B4E10[20];

void lbl_8008CEFC(struct Ape *a, int b) {}

void func_8008CF00(struct Struct8008CF00 *arg0, int arg1)
{
	u8 dummy[8];
	struct Struct8008CF00 *r8 = NULL;
	int i;

	lbl_802F20C0 = arg0;
	lbl_802F20C4 = arg0;
	for (i = 0; i < arg1; i++)
	{
		arg0[i].unk0 = NULL;
		arg0[i].unk4 = NULL;
		arg0[i].unk10 = 0;
		arg0[i].unk14 = 0;
		arg0[i].unk18 = i;
		arg0[i].unk1C = 0;
		arg0[i].next = r8;
		arg0[i].prev = &arg0[i + 1];
		r8 = &arg0[i];
	}
	for (i = 0; i < 16; i++)
	{
		lbl_802B4E10[i] = &arg0[i];
		arg0[i].unk0 = lbl_8008CEFC;
		arg0[i].prev = NULL;
		arg0[i].next = NULL;
	}
	lbl_802F20BC = arg0;
	lbl_802F20B8 = &arg0[i];
	arg0[i].next = NULL;
}

void func_8008D158(u32 arg0)
{
	int i;
	struct Struct8008CF00 *r28;
	struct Struct8008CF00 *r3;

	for (i = 0; i < 16; i++)
	{
		if (!(arg0 & (1 << i)))
		{
			r3 = lbl_802B4E10[i];
			while (r3 != NULL)
			{
				lbl_802F20C0 = r3;
				r28 = r3->prev;
				r3->unk0(r3->unk4, 0);
				r3 = r28;
			}
		}
	}
}

int func_8008D1DC(void (*func)(struct Ape *, int), struct Ape *arg1, int arg2)
{
    struct Struct8008CF00 *temp_r9 = lbl_802F20B8;

    lbl_802F20B8 = temp_r9->prev;
    lbl_802F20B8->next = NULL;
    temp_r9->prev = lbl_802B4E10[arg2]->prev;
    if (temp_r9->prev != NULL)
        temp_r9->prev->next = temp_r9;
    lbl_802B4E10[arg2]->prev = temp_r9;
    temp_r9->next = lbl_802B4E10[arg2];
    temp_r9->unk4 = arg1;
    temp_r9->unk0 = func;
    return temp_r9->unk18;
}

void func_8008D240(void)
{
    struct Struct8008CF00 *temp_r4 = lbl_802F20C0->next;
    struct Struct8008CF00 *temp_r3 = lbl_802F20C0->prev;

    if (temp_r4 != NULL)
        temp_r4->prev = temp_r3;
    if (temp_r3 != NULL)
        temp_r3->next = temp_r4;
    lbl_802F20C0->next = NULL;
    lbl_802F20C0->prev = lbl_802F20B8;
    if (lbl_802F20B8 != NULL)
        lbl_802F20B8->next = lbl_802F20C0;
    lbl_802F20B8 = lbl_802F20C0;
}

void func_8008D29C(int arg0)
{
    struct Struct8008CF00 *temp_r31 = lbl_802F20C0;
    struct Struct8008CF00 *temp_r5 = &lbl_802F20BC[arg0];
    struct Struct8008CF00 *temp_r3 = temp_r5->next;
    struct Struct8008CF00 *temp_r4 = temp_r5->prev;

    lbl_802F20C0 = temp_r5;
    if (temp_r3 != NULL)
        temp_r3->prev = temp_r4;
    if (temp_r4 != NULL)
        temp_r4->next = temp_r3;
    temp_r5->next = NULL;
    temp_r5->prev = lbl_802F20B8;
    if (lbl_802F20B8 != NULL)
        lbl_802F20B8->next = temp_r5;
    lbl_802F20B8 = temp_r5;
    temp_r5->unk0(temp_r5->unk4, 3);
    lbl_802F20C0 = temp_r31;
}

void func_8008D330(struct NlModel *arg0, u32 arg1, u32 arg2)
{
	struct NlMesh *r6 = (struct NlMesh *)arg0->meshStart;

	while ((u32)r6->flags != 0)
	{
		r6->flags &= arg1;
		r6->flags |= arg2;
		r6 = (struct NlMesh *)(r6->dispListStart + r6->dispListSize);
	}
}

void func_8008D36C(struct NlModel *arg0, u32 arg1, u32 arg2)
{
	struct NlMesh *r6 = (struct NlMesh *)arg0->meshStart;

	while ((u32)r6->flags != 0)
	{
		r6->unk4 &= arg1;
		r6->unk4 |= arg2;
		r6 = (struct NlMesh *)(r6->dispListStart + r6->dispListSize);
	}
}

void func_8008D3A8(struct NlModel *arg0, u32 arg1, u32 arg2)
{
	struct NlMesh *r6 = (struct NlMesh *)arg0->meshStart;

	while ((u32)r6->flags != 0)
	{
		r6->texFlags &= arg1;
		r6->texFlags |= arg2;
		r6 = (struct NlMesh *)(r6->dispListStart + r6->dispListSize);
	}
}
