#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "event.h"
#include "input.h"
#include "item.h"
#include "mathutil.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "stage.h"

void sel_stage_draw(void)
{
    struct StageItemgroup *r27;
    int i;

    func_80054FF0();
    stage_draw();
    mathutil_mtxA_from_mtxB();
    mathutil_mtxA_translate(&decodedStageLzPtr->startPos->pos);
    mathutil_mtxA_rotate_y(unpausedFrameCounter << 9);
    mathutil_mtxA_scale_xyz(0.6f, 0.6f, 0.6f);
    g_nl2ngc_set_scale(0.6f);
    g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 10));
    
    for (i = 0, r27 = decodedStageLzPtr->itemgroups; i < decodedStageLzPtr->itemgroupCount; i++, r27++)
    {
        Vec *r25 = &r27->goals->pos;
        int j;
        for (j = 0; j < r27->goalCount; j++)
        {
            mathutil_mtxA_from_mtxB();
            mathutil_mtxA_translate(r25);
            mathutil_mtxA_translate_xyz(0.0f, 2.0f, 0.0f);
            mathutil_mtxA_rotate_y(unpausedFrameCounter << 9);
            g_draw_naomi_model_and_do_other_stuff(NLOBJ_MODEL(naomiCommonObj, 7));
        }
    }

    if (controllerInfo[0].unk0[0].button & PAD_BUTTON_Y)
        return;

    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
    {
        ord_tbl_set_depth_offset(400.0f);
        background_draw();
        ord_tbl_set_depth_offset(0.0f);
    }
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        func_80095398(16);
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
        item_draw();
    if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
        stobj_draw();
    if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
        effect_draw();
}
