#include <dolphin.h>
#include <stddef.h>
#include <string.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "mathutil.h"
#include "mode.h"
#include "sprite.h"
#include "stage.h"
#include "stobj.h"

u8 lbl_802C6220[0xF4];
FORCE_BSS_ORDER(lbl_802C6220)

struct GMAModel *lbl_802C6314[0x30];  // 0xF4
FORCE_BSS_ORDER(lbl_802C6314)

struct Struct802C63D4
{
    u8 filler0[8];
    float unk8[3];
};  // size = 0x14

struct Struct802C63D4 lbl_802C63D4[0x30];  // 0x1B4
FORCE_BSS_ORDER(lbl_802C63D4)

struct
{
    s32 unk0;  // 0x574
    u8 filler4[4];
    s32 unk8;  // 0x57C
    u8 unkC[4];  // 0x580
    u32 unk10;  // 0x584
    u32 unk14;  // 0x588
    float unk18;  // 0x58C
    float unk1C;  // 0x590
    float unk20;
    float unk24;
    float unk28;  // 0x59C
    float unk2C;
    float unk30;
    float unk34;
    float unk38;
    float unk3C;
} lbl_802C6794;
FORCE_BSS_ORDER(lbl_802C6794)


struct Struct802C67D4 lbl_802C67D4[4];  // 0x5B4
FORCE_BSS_ORDER(lbl_802C67D4)

void func_800AD38C(void)
{
    func_800AEBA8();
}

u32 lbl_801D6B58[] =
{
    0x00002041,
    0x42434445,
    0x46474849,
    0x4A4B4C4D,
    0x4E4F5051,
    0x52535455,
    0x56575859,
    0x5A21262D,
    0x2E3F4039,
    0x38373635,
    0x34333231,
    0x30080000,
};

char *lbl_801D6C70[] =
{
    NULL,
    NULL,
    "FONT_ARROW_R",
    "FONT_A",
    "FONT_B",
    "FONT_C",
    "FONT_D",
    "FONT_E",
    "FONT_F",
    "FONT_G",
    "FONT_H",
    "FONT_I",
    "FONT_J",
    "FONT_K",
    "FONT_L",
    "FONT_M",
    "FONT_N",
    "FONT_O",
    "FONT_P",
    "FONT_Q",
    "FONT_R",
    "FONT_S",
    "FONT_T",
    "FONT_U",
    "FONT_V",
    "FONT_W",
    "FONT_X",
    "FONT_Y",
    "FONT_Z",
    "FONT_EXCLAM",
    "FONT_AMPERSAND",
    "FONT_MINUS",
    "FONT_PERIOD",
    "FONT_QUESTION",
    "FONT_ATMARK",
    "FONT_NINE",
    "FONT_EIGHT",
    "FONT_SEVEN",
    "FONT_SIX",
    "FONT_FIVE",
    "FONT_FOUR",
    "FONT_THREE",
    "FONT_TWO",
    "FONT_ONE",
    "FONT_ZERO",
    "FONT_ARROW_L",
    NULL,
    NULL,
};

char *lbl_801D6D30[] =
{
    "SEX",
    "XXX",
    "XX ",
    "XX",
    " XX",
    "X X",
};

extern u32 lbl_802F2208;

void ev_name_entry_init(void)
{
    struct GMAModel **modelIter;
    char **nameIter;
    struct GMAModel *buttonModel;
    int i2;
    int i = 0;
    struct Struct802C63D4 *var_r24;
    struct Stobj spC;
    s8 j;

    lbl_802C6794.unk0 = 1;
    lbl_802C6794.unk8 = -2;
    memset(lbl_802C6794.unkC, 0, 4);
    lbl_802F2208 = 0;
    buttonModel = find_stage_or_bg_model("BUTTON");

    nameIter = lbl_801D6C70;
    modelIter = lbl_802C6314;
    for (i = 48; i > 0; i--, nameIter++, modelIter++)
    {
        if (*nameIter == NULL)
            *modelIter = NULL;
        else
            *modelIter = find_stage_or_bg_model(*nameIter);
    }

    for (i = 0; i < 48; i++)
    {
        for (j = 0; j < 3; j++)
            lbl_802C63D4[i].unk8[j] = 0.25f;
    }

    memset(&spC, 0, sizeof(spC));
    spC.type = 10;
    spC.model = buttonModel;

    modelIter = lbl_802C6314;
    var_r24 = lbl_802C63D4;
    for (i2 = 0; i2 < 48; i2++, var_r24++, modelIter++)
    {
        if (*modelIter != 0)
        {
            spC.model = buttonModel;
            i = (s16)((-65536.0f * (0.5f + i2)) / 48.0f);
            spC.rotY = i;
            spC.u_some_pos.x = 0.0f;
            spC.u_some_pos.y = 0.0f;
            spC.u_some_pos.z = -17.5f;
            mathutil_mtxA_from_identity();
            mathutil_mtxA_rotate_y(i);
            mathutil_mtxA_tf_vec(&spC.u_some_pos, &spC.u_some_pos);
            spC.extraData = var_r24;
            spawn_stobj(&spC);
        }
    }

    call_bitmap_load_group(3);
    lbl_802C6794.unk10 = func_800AECCC(modeCtrl.difficulty, &lbl_802C67D4[modeCtrl.currPlayer]);
    lbl_802C6794.unk14 = 0;
    lbl_802C6794.unk18 = 640.0f;
    lbl_802C6794.unk1C = 60.0f;
    lbl_802C6794.unk20 = lbl_802C6794.unk18;
    lbl_802C6794.unk24 = lbl_802C6794.unk1C;
    lbl_802C6794.unk28 = 36.0f;
    lbl_802C6794.unk2C = lbl_802C6794.unk28;
    lbl_802C6794.unk30 = 280.0f;
    lbl_802C6794.unk34 = lbl_802C6794.unk30;
    lbl_802C6794.unk38 = 0.0f;
    lbl_802C6794.unk3C = 0.0f;
}
