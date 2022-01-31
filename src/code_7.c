#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "nl2ngc.h"

struct TPL *lbl_802F1CCC;
struct GMA *commonGma;
struct TPL *decodedBgTpl;
struct GMA *decodedBgGma;
struct TPL *lbl_802F1CBC;
struct GMA *lbl_802F1CB8;

extern struct NaomiObj *lbl_802F1AF8;
extern struct TPL *lbl_802F1AE4;
extern struct NaomiObj *lbl_802F1AF4;
extern struct TPL *lbl_802F1AE0;

struct Struct80181A80
{
    char *unk0;
    char *unk4;
    char *unk8;
    char *unkC;
};

struct Struct80181A80 lbl_80181A80[] =
{
    { "init/minit_p.lz", "init/minit.lz", NULL,               NULL               },
    { NULL,              NULL,            "init/m_race.gma",  "init/m_race.tpl"  },
    { NULL,              NULL,            "init/m_fight.gma", "init/m_fight.tpl" },
    { NULL,              NULL,            "init/m_pilot.gma", "init/m_pilot.tpl" },
    { NULL,              NULL,            "init/m_bowl.gma",  "init/m_bowl.tpl"  },
    { NULL,              NULL,            "init/m_golf.gma",  "init/m_golf.tpl"  },
    { NULL,              NULL,            "init/m_bill.gma",  "init/m_bill.tpl"  },
    { NULL,              NULL,            "init/roll.gma",    "init/roll.tpl"    },
};

int func_800248DC(void)
{
    int r30 = load_nlobj(&naomiCommonObj, &naomiCommonTpl, "init/common_p.lz", "init/common.lz");

    DVDChangeDir("init");
    lbl_802F1CCC = load_tpl("common.tpl.lz");
    if (lbl_802F1CCC == NULL)
        r30 = FALSE;
    else
    {
        commonGma = load_gma("common.gma.lz", lbl_802F1CCC);
        if (commonGma == NULL)
            r30 = FALSE;
    }
    DVDChangeDir("/test");
    if (r30)
    {
        func_8008D36C(NLOBJ_MODEL(naomiCommonObj, 0x2B), 0xFBFFFFFF, 0x4000000);
        func_8008D36C(NLOBJ_MODEL(naomiCommonObj, 0x35), 0xFBFFFFFF, 0x4000000);
        func_8008D36C(NLOBJ_MODEL(naomiCommonObj, 0x3A), 0xFBFFFFFF, 0x4000000);
        func_8008D36C(NLOBJ_MODEL(naomiCommonObj, 0x3F), 0xFBFFFFFF, 0x4000000);
    }
    return r30;
}

void func_800249D4(void)
{
    free_nlobj(&lbl_802F1AF8, &lbl_802F1AE4);
}

#pragma force_active on

// unused strings?
char string_init_chara_p_lz[] = "init/chara_p.lz";
char string_init_chara_lz[] = "init/chara.lz";
char string_init_sel_p_lz[] = "init/sel_p.lz";
char string_init_sel_lz[] = "init/sel.lz";

int func_800249FC(int a)
{
    struct Struct80181A80 *r31;
    int r30 = 0;

    if (a < 0)
        a = 0;
    else if (a > 7)
        a = 7;
    r31 = &lbl_80181A80[a];
    func_80024AB4();
    if (r31->unkC != NULL)
        lbl_802F1CBC = load_tpl(r31->unkC);
    if (r31->unk8 != NULL)
        lbl_802F1CB8 = load_gma(r31->unk8, lbl_802F1CBC);
    if (r31->unk4 != NULL && r31->unk0 != NULL)
        r30 = load_nlobj(&lbl_802F1AF4, &lbl_802F1AE0, r31->unk0, r31->unk4);
    return r30;
}

#pragma force_active reset

void func_80024AB4(void)
{
    if (lbl_802F1CBC != NULL || lbl_802F1CB8 != NULL)
    {
        VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
        VIWaitForRetrace();
    }
    if (lbl_802F1CBC != NULL)
    {
        free_tpl(lbl_802F1CBC);
        lbl_802F1CBC = NULL;
    }
    if (lbl_802F1CB8 != NULL)
    {
        free_gma(lbl_802F1CB8);
        lbl_802F1CB8 = NULL;
    }
    free_nlobj(&lbl_802F1AF4, &lbl_802F1AE0);
}
