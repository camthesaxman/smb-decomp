#ifdef __linux__

#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <libevdev/libevdev.h>
#include <dolphin.h>

struct Gamepad
{
    int fd;
    struct libevdev *dev;
};

static struct Gamepad s_gamepads[4];
static int s_gamepadsCount = 0;
static struct PADStatus s_padStatus[4];

// Determines if the device looks like a gamepad
static int is_gamepad(struct libevdev *dev)
{
    return libevdev_has_event_type(dev, EV_ABS)
        && libevdev_has_event_code(dev, EV_KEY, BTN_GAMEPAD);
}

static void scan_gamepads(void)
{
    char devicePath[28];
    int i;
    struct libevdev *dev = NULL;
    int fd;

    for (i = 0; i < INT_MAX; i++)
    {
        sprintf(devicePath, "/dev/input/event%i", i);
        fd = open(devicePath, O_RDONLY);
        if (fd < 0)
            break;
        if (libevdev_new_from_fd(fd, &dev) == 0 && is_gamepad(dev))
        {
            struct Gamepad *gamepad = &s_gamepads[s_gamepadsCount++];

            printf("found gamepad at %s\n", devicePath);
            gamepad->fd = fd;
            gamepad->dev = dev;
            if (s_gamepadsCount >= 4)
                break;
        }
        else
        {
            free(dev);
            close(fd);
        }
    }
}

BOOL PADInit(void)
{
    //puts("PADInit");
    memset(s_padStatus, 0, sizeof(s_padStatus));
    scan_gamepads();
}

u32 PADRead(PADStatus *status)
{
    int i;

    //puts("PADRead");
    for (i = 0; i < s_gamepadsCount; i++)
    {
        struct Gamepad *gamepad = &s_gamepads[i];

        if (libevdev_has_event_pending(gamepad->dev))
        {
            struct input_event ev;

            if (libevdev_next_event(gamepad->dev, LIBEVDEV_READ_FLAG_NORMAL, &ev) < 0)
                continue;
            if (ev.type == EV_KEY)
            {
                u16 mask;
                switch (ev.code)
                {
                case BTN_A:     mask = PAD_BUTTON_A;     break;
                case BTN_B:     mask = PAD_BUTTON_B;     break;
                case BTN_X:     mask = PAD_BUTTON_X;     break;
                case BTN_Y:     mask = PAD_BUTTON_Y;     break;
                case BTN_Z:     mask = PAD_TRIGGER_Z;    break;
                case BTN_START: mask = PAD_BUTTON_START; break;
                default:
                    continue;
                }
                if (ev.value == 1)
                    s_padStatus[i].button |= mask;
                else
                    s_padStatus[i].button &= ~mask;
            }
        }
    }
    memcpy(status, s_padStatus, sizeof(s_padStatus));
    return 0;
}

void PADSetAnalogMode(u32 mode)
{
    puts("PADSetAnalogMode is a stub");
}

#endif  // __linux__
