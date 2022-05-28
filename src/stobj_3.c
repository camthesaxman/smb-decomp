#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"
#include "mode.h"
#include "stage.h"

struct Struct8028C0D8
{
    u32 unk0;
    u8 filler4[0x198-0x4];
};  // size = 0x198

struct Struct8028C0D8 lbl_8028C0D8[8];

struct Struct8028CD98
{
    u32 unk0;
    u8 filler4[0x10-0x4];
    struct StageGoal unk10;
    u8 filler24[4];
};  // size = 0x28

struct Struct8028CD98 lbl_8028CD98[8];

extern char lbl_801BE448[];

void func_8006C7BC(struct StageAnimGroup *arg0, int arg1)
{
    struct Stobj_ stobj;
    struct StageAnimGroup *stageAg;
    int i, j;
    int totalGoals = 0;
    struct StageGoal *goal;
    struct Struct8028C0D8 *var_r24;
    struct Struct8028CD98 *var_r24_2;
    Point3d sp10;

    memset(lbl_8028C0D8, 0, sizeof(lbl_8028C0D8));
    memset(&stobj, 0, sizeof(stobj));

    stobj.type = SOT_GOALTAPE;

    var_r24 = lbl_8028C0D8;
    stageAg = arg0;
    totalGoals = 0;
    for (i = 0; i < arg1; i++, stageAg++)
    {
        goal = stageAg->goals;
        for (j = 0; j < stageAg->goalCount; j++, goal++, var_r24++)
        {
            if (totalGoals >= 8)
            {
                g_debug_set_cursor_pos(16, 16);
                g_debug_printf(lbl_801BE448, 8);
                break;
            }
            stobj.unk58 = goal->pos;
            stobj.unk70 = goal->rotX;
            stobj.unk72 = goal->rotY;
            stobj.unk74 = goal->rotZ;
            stobj.unkA0 = i;
            var_r24->unk0 = 0;
            stobj.unkA4 = var_r24;
            func_8006B2C0(&stobj);
            totalGoals++;
        }
    }
    memset(lbl_8028CD98, 0, sizeof(lbl_8028CD98));
    memset(&stobj, 0, sizeof(stobj));

    if (modeCtrl.levelSetFlags & LVLSET_FLAG_MASTER)
        stobj.type = SOT_GOALBAG_EXMASTER;
    else
        stobj.type = SOT_GOALBAG;

    sp10.x = 0.0f;
    sp10.y = 2.8f;
    sp10.z = 0.0f;

    var_r24_2 = lbl_8028CD98;
    stageAg = arg0;
    totalGoals = 0;
    for (i = 0; i < arg1; i++, stageAg++)
    {
        goal = stageAg->goals;
        for (j = 0; j < stageAg->goalCount; j++, goal++, var_r24_2++)
        {
            if (totalGoals >= 8)
                break;
            mathutil_mtxA_from_translate(&goal->pos);
            mathutil_mtxA_rotate_z(goal->rotZ);
            mathutil_mtxA_rotate_y(goal->rotY);
            mathutil_mtxA_rotate_x(goal->rotX);
            mathutil_mtxA_tf_point(&sp10, &stobj.unkA8);
            stobj.unk70 = goal->rotX;
            stobj.unk72 = goal->rotY;
            stobj.unk74 = goal->rotZ;
            stobj.unkA0 = i;
            var_r24_2->unk0 = 0;
            var_r24_2->unk10 = *goal;
            stobj.unkA4 = var_r24_2;
            func_8006B2C0(&stobj);
            totalGoals++;
        }

    }

}
