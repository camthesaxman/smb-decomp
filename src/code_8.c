#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "sprite.h"

struct Struct80290180_sub
{
	s8 unk0;
	char unk1[0x15-0x1];
	s8 unk15;
	u8 filler16[0x82-0x16];
	s16 unk82;
};  // size = 0x84

struct Struct80290180
{
	struct Struct80290180_sub unk0[20];
};

struct Struct80290180 lbl_80290180[4];
FORCE_BSS_ORDER(lbl_80290180)

struct Struct80292B60 lbl_80292AC0[4];  // +0x2940
FORCE_BSS_ORDER(lbl_80292AC0)

struct Struct80292B60 lbl_80292B60[4];
FORCE_BSS_ORDER(lbl_80292B60)

void func_80073F74(int a, struct Struct80292B60 *b);

void func_80073E44(void)
{
	int i;
	struct Struct80292B60 *r29;
	struct Struct80292B60 *r28;

	r29 = lbl_80292B60;
	r28 = lbl_80292AC0;
	for (i = 0; i < 4; i++, r29++, r28++)
	{
		memset(r29, 0, sizeof(*r29));
		memset(r28, 0, sizeof(*r28));
		r29->unk0 = 0;
		r29->unk8 = 0;
		r29->unk1C = NULL;
		func_80075428(i);
	}
	lbl_802F200C = -1.0f;
	lbl_802F2008 = 0.0f;
}

void func_80073EF8(void)
{
	int i;
	struct Struct80292B60 *r30;

	r30 = lbl_80292B60;
	for (i = 0; i < 4; i++, r30++)
	{
		if (r30->unk0 != 0)
		{
			if (r30->unk1C != NULL)
				r30->unk1C(r30);
			func_80073F74(i, r30);
		}
	}
}

void func_80073F74(int a, struct Struct80292B60 *b)
{
	s32 i;
	struct Struct80290180_sub *r26;
    s8 r27;
    int j;
	float f30;

	switch (b->unk0)
	{
	case 1:
		b->unk8++;
		if (b->unk8 == b->unk4)
		{
			b->unk0 = 10;
			b->unk8 = 0;
			if (lbl_80292AC0[a].unk0 == 20)
			{
				b->unk0 = 20;
				lbl_80292AC0[a].unk0 = 0;
			}
		}
		if (b->unk14 == 0)
		{
			f30 = 0.0f;
			r27 = 0;
			r26 = &lbl_80290180[a].unk0[0];
			for (i = 0; i < 20; i++, r26++)
			{
				if (r26->unk0 == 0)
					break;
				if (b->unk15 == 1)
				{
					r27 = get_ascii_text_width(r26->unk1);
					f30 = get_jpn_text_width(0xB1, r26->unk1);
				}
				else
				{
					float f0;
					if (r27 < get_ascii_text_width(r26->unk1))
						r27 = get_ascii_text_width(r26->unk1);
					f0 = get_jpn_text_width(0xB1, r26->unk1);
					if (f30 < f0)
						f30 = f0;
				}
			}
			b->unk14 = r27;
			b->unk10 = f30;
		}
		break;
	case 3:
		b->unk0 = 1;
		b->unk8 = 0;
		break;
	case 10:
		b->unk8++;
		r26 = &lbl_80290180[a].unk0[0];
		j = 0;
		for (i = 0; i < 20; i++, r26++)
		{
			if (r26->unk0 != 0)
				j++;
		}
		if (j > b->unk15)
		{
			b->unk0 = 11;
			b->unk8 = 0;
		}
		break;
	case 11:
		b->unk8++;
		if (b->unk8 == 16)
		{
            s32 i;
			b->unk0 = 10;
			r26 = &lbl_80290180[a].unk0[0];
			for (i = 0; i < 19; i++, r26++)
				memcpy(r26, r26 + 1, sizeof(*r26));
			r26->unk0 = 0;
			r26->unk82 = 0;
		}
		break;
	case 20:
		b->unk8++;
		if (b->unk8 == b->unk4)
		{
			b->unk0 = 0;
			b->unk8 = 0;
			b->unk1C = 0;
			func_80075428(a);
		}
		break;
	case 21:
		b->unk8++;
		if (b->unk8 == b->unk4)
		{
            s32 i;

			for (i = 0; i < b->unk15; i++)
			{
				r26 = &lbl_80290180[a].unk0[0];
				for (j = 0; j < 19; j++, r26++)
					memcpy(r26, r26 + 1, sizeof(*r26));
				r26->unk0 = 0;
				r26->unk82 = 0;
			}
			memcpy(b, &lbl_80292AC0[a], sizeof(*b));
			b->unk0 = 1;
			b->unk8 = 0;
			lbl_80292AC0[a].unk0 = 0;
		}
		break;
	case 22:
		b->unk8++;
		if (b->unk8 == b->unk4)
		{
			b->unk0 = 2;
			b->unk8 = 0;
			func_80075428(a);
		}
		break;
	}

    r26 = &lbl_80290180[a].unk0[0];
	for (i = 0; i < 20; i++, r26++)
	{
		if (b->unk0 >= 10
		 && r26->unk0 != 0
		 && r26->unk0 == 2
		 && (b->unk0 == 10 || b->unk0 == 11))
		{
			if (i < b->unk15
			 && (i == 0 || lbl_80290180[a].unk0[i - 1].unk0 != 2))
				r26->unk82 += 2;
			if (r26->unk82 >= get_ascii_text_width(r26->unk1))
				r26->unk0 = 1;
		}
	}
}

/*
const float lbl_802F4B28 = -1f;
const float lbl_802F4B2C = 0f;
const double lbl_802F4B30 = 4503601774854144;
const double lbl_802F4B38 = 0.059999999776482585;
const float lbl_802F4B40 = 0.0099999997764825821f;
const double lbl_802F4B48 = 0.5;
const float lbl_802F4B50 = 2f;
const double lbl_802F4B58 = 1;
const double lbl_802F4B60 = 0.10000000000000001;
const double lbl_802F4B68 = 1.8;
const double lbl_802F4B70 = 2;
const float lbl_802F4B78 = 1f;
const float lbl_802F4B7C = 48f;
const double lbl_802F4B80 = 24;
const float lbl_802F4B88 = 24f;
const double lbl_802F4B90 = 0.050000000000000003;
const float lbl_802F4B98 = 15f;
const float lbl_802F4B9C = 0.5f;
const float lbl_802F4BA0 = 14f;
const float lbl_802F4BA4 = 10f;
const float lbl_802F4BA8 = 34f;
const double lbl_802F4BB0 = -1.5;
const double lbl_802F4BB8 = 0;
const double lbl_802F4BC0 = 0.14000000000000001;
const double lbl_802F4BC8 = 4503599627370496;
const float lbl_802F4BD0 = 12f;
const float lbl_802F4BD4 = 18f;
*/
