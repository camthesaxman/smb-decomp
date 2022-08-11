#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "nl2ngc.h"

#include "../data/common.nlobj.h"

struct GfxFileInfo
{
    char *nlObjName;
    char *nlTplName;
    char *gmaName;
    char *tplName;
};

struct GfxFileInfo minigameGfxFiles[] =
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

struct TPL *commonTpl;
struct GMA *commonGma;
struct TPL *decodedBgTpl;
struct GMA *decodedBgGma;
struct TPL *minigameTpl;
struct GMA *minigameGma;

int load_common_graphics(void)
{
    int success = load_nlobj(&g_commonNlObj, &g_commonNlTpl, "init/common_p.lz", "init/common.lz");

    DVDChangeDir("init");
    commonTpl = load_tpl("common.tpl.lz");
    if (commonTpl == NULL)
        success = FALSE;
    else
    {
        commonGma = load_gma("common.gma.lz", commonTpl);
        if (commonGma == NULL)
            success = FALSE;
    }
    DVDChangeDir("/test");
    if (success)
    {
        func_8008D36C(NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_circle_white), 0xFBFFFFFF, 0x4000000);
        func_8008D36C(NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_CROSS_LIGHT), 0xFBFFFFFF, 0x4000000);
        func_8008D36C(NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_SPOT_LIGHT), 0xFBFFFFFF, 0x4000000);
        func_8008D36C(NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_SPOT_LIGHT_MULTI), 0xFBFFFFFF, 0x4000000);
    }
    return success;
}

void func_800249D4(void)
{
    free_nlobj(&lbl_802F1AF8, &lbl_802F1AE4);
}

#pragma force_active on
int u_load_minigame_graphics(int index)
{
    struct GfxFileInfo *gfx;
    int success = FALSE;

    if (index < 0)
        index = 0;
    else if (index > ARRAY_COUNT(minigameGfxFiles) - 1)
        index = ARRAY_COUNT(minigameGfxFiles) - 1;
    gfx = &minigameGfxFiles[index];
    u_free_minigame_graphics();
    if (gfx->tplName != NULL)
        minigameTpl = load_tpl(gfx->tplName);
    if (gfx->gmaName != NULL)
        minigameGma = load_gma(gfx->gmaName, minigameTpl);
    if (gfx->nlTplName != NULL && gfx->nlObjName != NULL)
        success = load_nlobj(&g_minigameNlObj, &g_minigameNlTpl, gfx->nlObjName, gfx->nlTplName);
    return success;
}
#pragma force_active reset

void u_free_minigame_graphics(void)
{
    if (minigameTpl != NULL || minigameGma != NULL)
    {
        VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
        VIWaitForRetrace();
    }
    if (minigameTpl != NULL)
    {
        free_tpl(minigameTpl);
        minigameTpl = NULL;
    }
    if (minigameGma != NULL)
    {
        free_gma(minigameGma);
        minigameGma = NULL;
    }
    free_nlobj(&g_minigameNlObj, &g_minigameNlTpl);
}

#pragma force_active on
// unused strings?
char string_init_chara_p_lz[] = "init/chara_p.lz";
char string_init_chara_lz[] = "init/chara.lz";
char string_init_sel_p_lz[] = "init/sel_p.lz";
char string_init_sel_lz[] = "init/sel.lz";
#pragma force_active reset
