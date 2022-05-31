#include <stdio.h>
#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "event.h"
#include "info.h"
#include "item.h"
#include "obj_collision.h"
#include "perf.h"
#include "sprite.h"
#include "stage.h"
#include "stobj.h"
#include "world.h"

struct Event eventInfo[] =
{
    {0, "MEMCARD",       ev_memcard_init,       ev_memcard_main,       ev_memcard_dest,       0},
    {0, "STAGE",         ev_stage_init,         ev_stage_main,         ev_stage_dest,         0},
    {0, "WORLD",         ev_world_init,         ev_world_main,         ev_world_dest,         0},
    {0, "BALL",          ev_ball_init,          ev_ball_main,          ev_ball_dest,          0},
    {0, "STOBJ",         ev_stobj_init,         ev_stobj_main,         ev_stobj_dest,         0},
    {0, "ITEM",          ev_item_init,          ev_item_main,          ev_item_dest,          0},
    {0, "RECPLAY",       ev_recplay_init,       ev_recplay_main,       ev_recplay_dest,       0},
    {0, "OBJ_COLLISION", ev_obj_collision_init, ev_obj_collision_main, ev_obj_collision_dest, 0},
    {0, "NAME_ENTRY",    ev_name_entry_init,    ev_name_entry_main,    ev_name_entry_dest,    0},
    {0, "INFO",          ev_info_init,          ev_info_main,          ev_info_dest,          0},
    {0, "COURSE",        ev_course_init,        ev_course_main,        ev_course_dest,        0},
    {0, "VIBRATION",     ev_vibration_init,     ev_vibration_main,     ev_vibration_dest,     0},
    {0, "VIEW",          ev_view_init,          ev_view_main,          ev_view_dest,          0},
    {0, "EFFECT",        ev_effect_init,        ev_effect_main,        ev_effect_dest,        0},
    {0, "MINIMAP",       ev_minimap_init,       ev_minimap_main,       ev_minimap_dest,       0},
    {0, "CAMERA",        ev_camera_init,        ev_camera_main,        ev_camera_dest,        0},
    {0, "SPRITE",        ev_sprite_init,        ev_sprite_main,        ev_sprite_dest,        0},
    {0, "MOUSE",         ev_mouse_init,         ev_mouse_main,         ev_mouse_dest,         0},
    {0, "SOUND",         ev_sound_init,         ev_sound_main,         ev_sound_dest,         0},
    {0, "BACKGROUND",    ev_background_init,    ev_background_main,    ev_background_dest,    0},
    {0, "REND_EFC",      ev_rend_efc_init,      ev_rend_efc_main,      ev_rend_efc_dest,      0},
};

#pragma opt_unroll_count 1
#pragma force_active on

void event_init(void)
{
    int i;
    for (i = 0; i < ARRAY_COUNT(eventInfo); i++)
        eventInfo[i].state = EV_STATE_INACTIVE;
}

void event_main(void)
{
    struct Event *event;
    int i;
    
    func_8008D158(0x00FFFFEF);
    for (i = 0, event = eventInfo; i < ARRAY_COUNT(eventInfo); i++, event++)
    {
        perf_start_timer(5);
        switch (event->state)
        {
        case 1:
            event_start(i);
        case EV_STATE_RUNNING:
            event->main();
            break;
        case 3:
            event_finish(i);
            break;
        }
        event->time = perf_stop_timer(5);
    }
    func_8008D158(0x00FFFFDF);
}

void event_start(int id)
{
    if (eventInfo[id].state != EV_STATE_INACTIVE)
        event_finish(id);
    eventInfo[id].start();
    eventInfo[id].state = EV_STATE_RUNNING;
}

void event_finish(int id)
{
    if (eventInfo[id].state != EV_STATE_INACTIVE)
    {
        eventInfo[id].finish();
        eventInfo[id].state = EV_STATE_INACTIVE;
    }
}

void event_suspend(int id)
{
    eventInfo[id].state = EV_STATE_SUSPENDED;
}

void event_resume(int id)
{
    if (eventInfo[id].state == EV_STATE_SUSPENDED)
        eventInfo[id].state = EV_STATE_RUNNING;
    else
        printf("ev_restart: event %s is not suspended\n", eventInfo[id].name);
}

void event_finish_all(void)
{
    struct Event *ev = eventInfo;
    int i;

    for (i = 0; i < ARRAY_COUNT(eventInfo); i++, ev++)
    {
        if (ev->state != EV_STATE_INACTIVE)
            event_finish(i);
    }
}
