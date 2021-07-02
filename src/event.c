#include <dolphin.h>

#include "functions.h"
#include "variables.h"

struct Event eventInfo[] =
{
    {0, "MEMCARD",       (void *)0x800A3DE8, (void *)0x800A4050, (void *)0x800A428C, 0},
    {0, "STAGE",         (void *)0x80043A74, (void *)0x80043B48, (void *)0x80044104, 0},
    {0, "WORLD",         (void *)0x80042BD4, (void *)0x80042C4C, (void *)0x80042E84, 0},
    {0, "BALL",          (void *)0x80037B84, (void *)0x80038150, (void *)0x800387BC, 0},
    {0, "STOBJ",         (void *)0x8006AE20, (void *)0x8006AF44, (void *)0x8006B108, 0},
    {0, "ITEM",          (void *)0x80068048, (void *)0x800681E4, (void *)0x800682E0, 0},
    {0, "RECPLAY",       (void *)0x80048C44, (void *)0x80048C6C, (void *)0x80048E40, 0},
    {0, "OBJ_COLLISION", (void *)0x8006A624, (void *)0x8006A628, (void *)0x8006A654, 0},
    {0, "NAME_ENTRY",    (void *)0x800AD3AC, (void *)0x800AD644, (void *)0x800AE3E4, 0},
    {0, "INFO",          (void *)0x80022F58, (void *)0x8002303C, (void *)0x80023AD4, 0},
    {0, "COURSE",        (void *)0x80066910, (void *)0x80066964, (void *)0x80066C74, 0},
    {0, "VIBRATION",     (void *)0x800B5EDC, (void *)0x800B5F20, (void *)0x800B6094, 0},
    {0, "VIEW",          (void *)0x800A5734, (void *)0x800A5860, (void *)0x800A5AEC, 0},
    {0, "EFFECT",        (void *)0x8004CADC, (void *)0x8004CBD0, (void *)0x8004CCD0, 0},
    {0, "MINIMAP",       (void *)0x80084264, (void *)0x8008433C, (void *)0x8008468C, 0},
    {0, "CAMERA",        (void *)0x800178FC, (void *)0x80017990, (void *)0x80017FC8, 0},
    {0, "SPRITE",        (void *)0x8006FED8, (void *)0x8006FF70, (void *)0x80070028, 0},
    {0, "MOUSE",         (void *)0x80094CD4, (void *)0x80094CF8, (void *)0x80095020, 0},
    {0, "SOUND",         (void *)0x800298D8, (void *)0x80029AC4, (void *)0x8002A044, 0},
    {0, "BACKGROUND",    (void *)0x80054E04, (void *)0x80054F1C, (void *)0x80054F88, 0},
    {0, "REND_EFC",      (void *)0x8009523C, (void *)0x8009526C, (void *)0x80095314, 0},
};

void ev_run_init(int);
void ev_run_dest(int);

#pragma opt_findoptimalunrollfactor off
#pragma opt_unroll_count 1
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
    for (i = 0, event = eventInfo; i < 21; i++, event++)
    {
        perf_init_timer(5);
        switch (event->state)
        {
        case 1:
            ev_run_init(i);
        case 2:
            event->main();
            break;
        case 3:
            ev_run_dest(i);
            break;
        }
        event->time = perf_stop_timer(5);
    }
    func_8008D158(0x00FFFFDF);
}

void ev_run_init(int id)
{
    if (eventInfo[id].state != EV_STATE_INACTIVE)
        ev_run_dest(id);
    eventInfo[id].start();
    eventInfo[id].state = EV_STATE_RUNNING;
}

void ev_run_dest(int id)
{
    if (eventInfo[id].state != EV_STATE_INACTIVE)
    {
        eventInfo[id].finish();
        eventInfo[id].state = EV_STATE_INACTIVE;
    }
}

void ev_suspend(int id)
{
    eventInfo[id].state = EV_STATE_SUSPENDED;
}

void ev_restart(int id)
{
    if (eventInfo[id].state == EV_STATE_SUSPENDED)
        eventInfo[id].state = EV_STATE_RUNNING;
    else
        printf("ev_restart: event %s is not suspended\n", eventInfo[id].name);
}

void event_clear(void)
{
    struct Event *ev = eventInfo;
    int i;

    for (i = 0; i < ARRAY_COUNT(eventInfo); i++, ev++)
    {
        if (ev->state != EV_STATE_INACTIVE && eventInfo[i].state != EV_STATE_INACTIVE)
        {
            eventInfo[i].finish();
            eventInfo[i].state = EV_STATE_INACTIVE;
        }
    }
}
