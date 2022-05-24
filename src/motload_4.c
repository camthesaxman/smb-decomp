#include <stddef.h>
#include <dolphin.h>

#include "global.h"

const u32 lbl_802F3340[2] = {0x0104070A, 0x0D000000};
const u32 lbl_802F3348 = 0x02000000;
const u32 lbl_802F334C = 0x03000000;
const u32 lbl_802F3350 = 0x05000000;
const u32 lbl_802F3354 = 0x06000000;
const u32 lbl_802F3358 = 0x08000000;
const u32 lbl_802F335C = 0x09000000;
const u32 lbl_802F3360 = 0x0B000000;
const u32 lbl_802F3364 = 0x0C000000;
const u32 lbl_802F3368 = 0x0E000000;
const u32 lbl_802F336C = 0x0F000000;
const u32 lbl_802F3370 = 0x10000000;

#pragma force_active on
void func_80036000(struct Struct8003699C_child_sub *arg0, u16 arg1, u16 arg2)
{
    arg0->unkA = arg2;
    arg0->unk14 = 0.0f;
    arg0->unk28 = arg0->unk8;
    if (arg1 != 0)
    {
        arg0->unk8 = arg1;
        arg0->unkC = func_80034F44(arg1);
        func_800366F8(arg0);
    }
    else
		arg0->unk8 = arg1;
}
#pragma force_active reset

void func_80036064(struct Struct8003699C_child *arg0)
{
    float temp_f26;
    float temp_f2;
    float temp_f4;
    u16 temp_r3;
    int temp_r0;
    struct Struct8003699C_child_child *phi_r31;
    struct Struct8003699C_child_sub *phi_r30;
    struct Struct8003699C_child_sub *phi_r29;

    phi_r31 = arg0->unk81A4;
    if (phi_r31 != NULL)
    {
        temp_f26 = arg0->unk3A - (arg0->unk38 + arg0->unk40);
        if (arg0->unk0 & 4)
        {
            phi_r30 = &arg0->unk4114;
            phi_r29 = &arg0->unk84;
        }
        else
        {
            phi_r30 = &arg0->unk84;
            phi_r29 = &arg0->unk4114;
        }
        while (phi_r31->unk0 != 0)
        {
            if (arg0->unk38 < phi_r31->unk2)
				break;
			
			switch (phi_r31->unk0)
			{
			case 1:
				phi_r30->unk18 = phi_r31->unk8;
				temp_r3 = phi_r31->unk4;
				phi_r30->unkA = 0;
				phi_r30->unk14 = 0.0f;
				phi_r30->unk28 = phi_r30->unk8;
				if (temp_r3 != 0)
				{
					phi_r30->unk8 = temp_r3;
					phi_r30->unkC = func_80034F44(temp_r3);
					func_800366F8(phi_r30);
				}
				else
					phi_r30->unk8 = temp_r3;
				if ((phi_r30->unk18 & 1) && temp_f26 > 0.001f)
					phi_r30->unk10 = 1.0f;
				else
				{
					phi_r30->unk1C = 0.0f;
					phi_r30->unk20 = 0.0f;
					phi_r30->unk10 = 0.0f;
				}
				break;
			case 2:
				phi_r29->unk18 = phi_r31->unk8;
				temp_r3 = phi_r31->unk4;
				phi_r29->unkA = 0;
				phi_r29->unk14 = 0.0f;
				phi_r29->unk28 = phi_r29->unk8;
				if (temp_r3 != 0)
				{
					phi_r29->unk8 = temp_r3;
					phi_r29->unkC = func_80034F44(temp_r3);
					func_800366F8(phi_r29);
				}
				else
					phi_r29->unk8 = temp_r3;
				if ((phi_r29->unk18 & 1) && temp_f26 > 0.001f)
					phi_r29->unk10 = 1.0f;
				else
				{
					phi_r29->unk1C = 0.0f;
					phi_r29->unk20 = 0.0f;
					phi_r29->unk10 = 0.0f;
				}
				break;
			case 3:
				phi_r30->unk18 = phi_r31->unk8;
				temp_r3 = phi_r31->unk4;
				phi_r30->unkA = 0;
				phi_r30->unk14 = 0.0f;
				phi_r30->unk28 = phi_r30->unk8;
				if (temp_r3 != 0)
				{
					phi_r30->unk8 = temp_r3;
					phi_r30->unkC = func_80034F44(temp_r3);
					func_800366F8(phi_r30);
				}
				else
					phi_r30->unk8 = temp_r3;
				if ((phi_r30->unk18 & 1) && temp_f26 > 0.001f)
					phi_r30->unk10 = 1.0f;
				else
				{
					phi_r30->unk1C = 0.0f;
					phi_r30->unk20 = 0.0f;
					phi_r30->unk10 = 0.0f;
				}
				phi_r29->unk18 = phi_r31->unk8;
				temp_r3 = phi_r31->unk4;
				phi_r29->unkA = 0;
				phi_r29->unk14 = 0.0f;
				phi_r29->unk28 = phi_r29->unk8;
				if (temp_r3 != 0)
				{
					phi_r29->unk8 = temp_r3;
					phi_r29->unkC = func_80034F44(temp_r3);
					func_800366F8(phi_r29);
				}
				else
					phi_r29->unk8 = temp_r3;
				if ((phi_r29->unk18 & 1) && temp_f26 > 0.001f)
					phi_r29->unk10 = 1.0f;
				else
				{
					phi_r29->unk1C = 0.0f;
					phi_r29->unk20 = 0.0f;
					phi_r29->unk10 = 0.0f;
				}
				break;
			case 4:
				temp_r0 = phi_r31->unk4 - phi_r31->unk2;
				temp_f2 = phi_r31->unk8;
				phi_r30->unk24 = temp_r0;
				if (temp_r0 > 0)
				{
					phi_r30->unk1C += phi_r30->unk20;
					phi_r30->unk20 = (temp_f2 - phi_r30->unk1C) / (float)temp_r0;
					phi_r30->unk1C -= phi_r30->unk20;
				}
				else
				{
					phi_r30->unk1C = temp_f2;
					phi_r30->unk20 = 0.0f;
				}
				break;
			case 5:
				temp_r0 = phi_r31->unk4 - phi_r31->unk2;
				temp_f2 = phi_r31->unk8;
				phi_r29->unk24 = temp_r0;
				if (temp_r0 > 0)
				{
					phi_r29->unk1C += phi_r29->unk20;
					phi_r29->unk20 = (temp_f2 - phi_r29->unk1C) / (float)temp_r0;
					phi_r29->unk1C -= phi_r29->unk20;
				}
				else
				{
					phi_r29->unk1C = temp_f2;
					phi_r29->unk20 = 0.0f;
				}
				break;
			case 6:
				temp_r0 = phi_r31->unk4 - phi_r31->unk2;
				temp_f4 = phi_r31->unk8;
				phi_r29->unk24 = temp_r0;
				phi_r30->unk24 = temp_r0;
				if (temp_r0 > 0)
				{
					phi_r30->unk1C += phi_r30->unk20;
					phi_r29->unk1C += phi_r29->unk20;
					phi_r30->unk20 = (temp_f4 - phi_r30->unk1C) / (float)temp_r0;
					phi_r29->unk20 = (temp_f4 - phi_r29->unk1C) / (float)temp_r0;
					phi_r30->unk1C -= phi_r30->unk20;
					phi_r29->unk1C -= phi_r29->unk20;
				}
				else
				{
					phi_r29->unk1C = temp_f4;
					phi_r30->unk1C = temp_f4;
					phi_r29->unk20 = 0.0f;
					phi_r30->unk20 = 0.0f;
				}
				break;
			}
            phi_r31++;
        }
        arg0->unk81A4 = phi_r31;
    }
}
