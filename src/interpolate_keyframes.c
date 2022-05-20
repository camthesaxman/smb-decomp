#include <dolphin.h>

#include "global.h"

float interpolate_keyframes(int count, struct Keyframe *frames, float time)
{
    struct Keyframe *curr;
    struct Keyframe *next;
    int i;
    float dt;  // time between start of current frame and start of next frame
    float t;  // interpolation factor
    float t2;  // t * t
    float t3;  // t * t * t

    if (count < 2 || time <= frames[0].timeSeconds)
        return frames[0].value;
    if (time >= frames[count - 1].timeSeconds)
        return frames[count - 1].value;

    next = &frames[1];
    for (i = 1; i < count-1; i++, next++)
    {
        if (next->timeSeconds > time)
            break;
    }
    curr = next - 1;

    switch (curr->easeType)
    {
    case 0:  // step
        return curr->value;
    case 1:  // linear
        dt = next->timeSeconds - curr->timeSeconds;
        t = (time - curr->timeSeconds) / dt;
        return curr->value * (1.0 - t) + next->value * t;
    default:  // ???
        dt = next->timeSeconds - curr->timeSeconds;
        t = (time - curr->timeSeconds) / dt;
        t2 = t * t;
        t3 = t2 * t;
        return  (float) (curr->value * (1.0 + (2.0 * t3 - 3.0 * t2)) + next->value * (-2.0 * t3 + 3.0 * t2))
             + dt * ((curr->tangentOut * (t + (t3 - 2.0 * t2))) + next->tangentIn * (t3 - t2));
    }
}
