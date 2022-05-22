#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "camera.h"
#include "event.h"
#include "mathutil.h"
#include "stcoli.h"
#include "gma.h"

static struct BGModelSearch stormModelFind[] =
{
    { BG_MDL_CMP_FULL, "STM_RAIN00" },
    { BG_MDL_CMP_FULL, "STM_RAIN01" },
    { BG_MDL_CMP_FULL, "STM_RAIN02" },
    { BG_MDL_CMP_END,  NULL },
};

static int storm_model_find_proc(int, struct GMAModelEntry *);

void bg_storm_init(void)
{
    struct BGStormWork *work = backgroundInfo.work;
    int i;
    struct BGStormWork_child *r28;

    bg_e3_init();
    if (work->unk0 == 0)
        g_search_bg_models(stormModelFind, storm_model_find_proc);
    work->unk10.x = ((rand() / 32767.0f) - 0.5f) * 6.0f;
    work->unk10.y = ((rand() / 32767.0f) - 0.5f) * 9.0f;
    work->unk10.z = ((rand() / 32767.0f) - 0.5f) * 6.0f;
    work->unk1C.x = ((rand() / 32767.0f) - 0.5f) * 0.1f;
    work->unk1C.y = -0.25f;
    work->unk1C.z = ((rand() / 32767.0f) - 0.5f) * 0.1f;
    r28 = work->unk28;
    for (i = ARRAY_COUNT(work->unk28); i > 0; i--, r28++)
    {
        r28->unk0 = ((rand() / 32767.0f) - 0.5f) * 6.0f;
        r28->unk4 = ((rand() / 32767.0f) - 0.5f) * 9.0f;
        r28->unk8 = ((rand() / 32767.0f) - 0.5f) * 6.0f;
        r28->unkC = (((rand() / 32767.0f) * 0.5f) + 1.0f) * 0.01f;
    }
}

void bg_storm_main(void)
{
    struct BGStormWork *work;
    Vec spDC;
    Vec spD0;
    struct RaycastHit spB4;
    struct Struct8003C550 sp8;
    int i;
    struct Camera *camera;

    if ((gamePauseStatus & 0xA) && eventInfo[EVENT_VIEW].state != EV_STATE_RUNNING)
        return;

    work = backgroundInfo.work;
    bg_e3_main();

    spDC = work->unk10;

    spDC.x += work->unk1C.x;
    spDC.y += work->unk1C.y;
    spDC.z += work->unk1C.z;

    while (spDC.x < -3.0f)
        spDC.x += 6.0f;
    while (spDC.x > 3.0f)
        spDC.x -= 6.0f;

    while (spDC.y < -4.5f)
        spDC.y += 9.0f;
    while (spDC.y > 4.5f)
        spDC.y -= 9.0f;

    while (spDC.z < -3.0f)
        spDC.z += 6.0f;
    while (spDC.z > 3.0f)
        spDC.z -= 6.0f;

    work->unk10 = spDC;

    memset(&sp8, 0, sizeof(sp8));
    sp8.unk8 = 35;
    if (lbl_801EEC90.unk0 & 1)
    {
        spD0.x = (rand() / 32767.0f) - 0.5f;
        spD0.y = 0.0f;
        spD0.z = (rand() / 32767.0f) - 0.5f;
        mathutil_vec_set_len(&spD0, &sp8.unk34, ((rand() / 32767.0f) + 0.1f) * 3.6000001430511475f);
        sp8.unk70.y = 1.0f;
        mathutil_vec_to_euler_xy(&spB4.normal, &sp8.unk4C, &sp8.unk4E);
        sp8.unk50 = rand() & 0x7FFF;
        sp8.unk30 = work->rain02Model;
        g_spawn_effect_object(&sp8);
        return;
    }
    camera = cameraInfo;
    for (i = 0; i < 4; i++, camera++)
    {
        if (cameraInfo[i].sub28.vp.width > 0.0f && cameraInfo[i].sub28.vp.height > 0.0f)
        {
            spD0.x = (rand() / 32767.0f) - 0.5f;
            spD0.y = 0.0f;
            spD0.z = (rand() / 32767.0f) - 0.5f;
            mathutil_vec_set_len(&spD0, &spD0, ((rand() / 32767.0f) + 0.1f) * 3.6000001430511475f);
            spD0.x += camera->lookAt.x;
            spD0.y += camera->lookAt.y + 10.0f;
            spD0.z += camera->lookAt.z;
            if ((u32)raycast_stage_down(&spD0, &spB4, &sp8.unk7C) != 0)
            {
                sp8.unk34 = spB4.pos;
                sp8.unk70 = spB4.normal;
                mathutil_vec_to_euler_xy(&spB4.normal, &sp8.unk4C, &sp8.unk4E);
                sp8.unk50 = rand() & 0x7FFF;
                sp8.unk30 = work->rain02Model;
                g_spawn_effect_object(&sp8);
            }
        }
    }
}

void bg_storm_finish(void) {}

Vec lbl_801BA0A4[] =
{
    {  0,  0,  0 },
    {  6,  0,  0 },
    { -6,  0,  0 },
    {  0,  9,  0 },
    {  0, -9,  0 },
    {  0,  0,  6 },
    {  0,  0, -6 },
};

#ifdef NONMATCHING
// https://decomp.me/scratch/7I9K0
void bg_storm_draw(void)
{
    struct BGStormWork *work = backgroundInfo.work;
    Vec sp7C;
    Vec sp70;
    Vec sp64;
    int i;  // r28
    int j;  // r27
    struct BGStormWork_child *r30;
    Vec *r26;
    struct GMAModel *r25;
    float f25;
    float f24;

    bg_e3_draw();
    if (lbl_801EEC90.unk0 & (1 << 2))
        return;
    mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
    mathutil_mtxA_rigid_inv_tf_tl(&sp7C);
    sp70 = work->unk10;
    sp70.x += (mathutil_ceil((sp7C.x - sp70.x) * 0.1666666716337204f) - 0.5f) * 6.0f;
    sp70.y += (mathutil_ceil((sp7C.y - sp70.y) * 0.1111111119389534f) - 0.5f) * 9.0f;
    sp70.z += (mathutil_ceil((sp7C.z - sp70.z) * 0.1666666716337204f) - 0.5f) * 6.0f;
    sp64 = work->unk1C;
    r25 = work->rain00Model;
    r30 = work->unk28;
    for (i = ARRAY_COUNT(work->unk28); i > 0; i--, r30++)
    {
        Vec sp58;
        Vec sp4C;
        Vec sp40;
        Vec sp34;
        Vec sp28;
        S16Vec sp20;

        f24 = r30->unkC;
        sp58.x = sp70.x + r30->unk0;
        sp58.y = sp70.y + r30->unk4;
        sp58.z = sp70.z + r30->unk8;
        r26 = lbl_801BA0A4;
        for (j = 7; j > 0; j--, r26++)
        {
            float alpha;

            mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
            mathutil_mtxA_tf_vec(r26, &sp28);
            if (sp28.z > 0.0f)
                continue;
            sp4C.x = sp58.x + r26->x;
            sp4C.y = sp58.y + r26->y;
            sp4C.z = sp58.z + r26->z;
            f25 = mathutil_vec_distance(&sp4C, &sp7C);
            if (f25 > 6.0f)
                continue;
            mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[4]);
            mathutil_mtxA_tf_point_xyz(&sp34, sp4C.x - sp64.x, sp4C.y - sp64.y, sp4C.z - sp64.z);
            mathutil_mtxA_from_mtx(lbl_802F1B3C->matrices[0]);
            mathutil_mtxA_tf_point(&sp4C, &sp40);
            if (sp40.z > 0.0f && sp34.z > 0.0f)
                continue;
            //lbl_800629B4
            sp28.x = sp40.x - sp34.x;
            sp28.y = sp40.y - sp34.y;
            sp28.z = sp40.z - sp34.z;

            sp34.x += sp28.x * -0.5f;
            sp34.y += sp28.y * -0.5f;
            sp34.z += sp28.z * -0.5f;
            sp28.z = 0.0f;
            if (sp28.x != 0.0f || sp28.y != 0.0f)
                mathutil_vec_set_len(&sp28, &sp28, f24);
            else
                sp28.y = f24;
            //lbl_80062A50
            sp40.x += sp28.x;
            sp34.x -= sp28.x;
            sp40.y += sp28.y;
            sp34.y -= sp28.y;
            mathutil_ray_to_euler(&sp40, &sp34, &sp20);
            sp20.x -= 16384;
            sp28.x = (sp40.x + sp34.x) * 0.5f;
            sp28.y = (sp40.y + sp34.y) * 0.5f;
            sp28.z = (sp40.z + sp34.z) * 0.5f;
            mathutil_mtxA_from_translate(&sp28);
            mathutil_mtxA_rotate_y(sp20.y);
            mathutil_mtxA_rotate_x(sp20.x);
            mathutil_mtxA_rigid_inv_tf_tl(&sp28);
            mathutil_mtxA_rotate_y(0x4000 - mathutil_atan2(sp28.z, sp28.x));
            mathutil_mtxA_scale_xyz(f24, mathutil_vec_distance(&sp40, &sp34), f24);
            if (f25 < 1.0f)
                alpha = f25;
            else
                alpha = 1.0f - 0.2f * (f25 - 1.0f);
            avdisp_set_alpha(alpha);
            avdisp_draw_model_culled_sort_translucent(r25);
        }
    }
}
#else
const float lbl_802F44D4 = 0.1666666716337204f;
const float lbl_802F44D8 = 0.1111111119389534f;
const float lbl_802F44DC = -0.5f;
const float lbl_802F44E0 = 0.20000000298023224f;
asm void bg_storm_draw(void)
{
    nofralloc
#include "../asm/nonmatchings/bg_storm_draw.s"
}
#pragma peephole on
#endif

void bg_storm_interact(int a) {}

static int storm_model_find_proc(int index, struct GMAModelEntry *entry)
{
    struct BGStormWork *work = backgroundInfo.work;

    switch (index)
    {
    case 0:  // STM_RAIN00
        work->rain00Model = entry->model;
        break;
    case 1:  // STM_RAIN01
        work->rain01Model = entry->model;
        break;
    case 2:  // STM_RAIN02
        work->rain02Model = entry->model;
        break;
    }
    return 1;
}
