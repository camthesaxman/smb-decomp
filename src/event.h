#ifndef _SRC_EVENT_H_
#define _SRC_EVENT_H_

#include <dolphin/types.h>

// Event states
enum
{
    EV_STATE_INACTIVE = 0,
    EV_STATE_RUNNING = 2,
    EV_STATE_SUSPENDED = 4
};

// Event IDs
enum
{
    EVENT_MEMCARD,  // 0
    EVENT_STAGE,
    EVENT_WORLD,
    EVENT_BALL,
    EVENT_STOBJ,
    EVENT_ITEM,  // 5
    EVENT_RECPLAY,
    EVENT_OBJ_COLLISION,
    EVENT_NAME_ENTRY,
    EVENT_INFO,
    EVENT_COURSE,  // 10
    EVENT_VIBRATION,
    EVENT_VIEW,
    EVENT_EFFECT,
    EVENT_MINIMAP,
    EVENT_CAMERA,  // 15
    EVENT_SPRITE,
    EVENT_MOUSE,
    EVENT_SOUND,
    EVENT_BACKGROUND,
    EVENT_REND_EFC,  // 20
};

struct Event
{
    /*0x00*/ s8 state;
    /*0x04*/ char *name;
    /*0x08*/ void (*start)(void);
    /*0x0C*/ void (*main)(void);
    /*0x10*/ void (*finish)(void);
    /*0x14*/ u32 time;
};

extern struct Event eventInfo[];

void event_init(void);
void event_main(void);
void event_start(int);
void event_finish(int);
void event_suspend(int);
void event_resume(int);
void event_finish_all(void);

#endif