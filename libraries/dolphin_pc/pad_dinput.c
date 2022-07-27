#ifdef _WIN32

#include <stdio.h>
#define DIRECTINPUT_VERSION 0x0800
#include <dinput.h>
#include <dolphin.h>

static IDirectInput8 *dinput;

struct Gamepad
{
    IDirectInputDevice8 *device;
};

static struct Gamepad s_gamepads[4];
static int s_gamepadsCount = 0;

static BOOL CALLBACK enum_devices_callback(LPCDIDEVICEINSTANCE lpddi, LPVOID pvRef)
{
    IDirectInputDevice8 *device;

    if (s_gamepadsCount >= 4)
        return DIENUM_STOP;
    printf("found device %s\n", lpddi->tszProductName);
    IDirectInput8_CreateDevice(dinput, &lpddi->guidInstance, &device, NULL);
    IDirectInputDevice8_SetCooperativeLevel(device, GetActiveWindow(), DISCL_FOREGROUND|DISCL_NONEXCLUSIVE);
    IDirectInputDevice8_SetDataFormat(device, &c_dfDIJoystick);
    IDirectInputDevice8_Acquire(device);
    s_gamepads[s_gamepadsCount].device = device;
    s_gamepadsCount++;
    return DIENUM_CONTINUE;
}

BOOL PADInit(void)
{
    HINSTANCE hInstance;
    HRESULT result;

    puts("PADInit");
    hInstance = GetModuleHandle(NULL);
    result = DirectInput8Create(hInstance, DIRECTINPUT_VERSION, &IID_IDirectInput8A, (void **)&dinput, NULL);
    if (result != DI_OK)
    {
        printf("failed to initialize DirectInput: error %lu\n", result);
        return FALSE;
    }
    IDirectInput8_EnumDevices(dinput, DI8DEVCLASS_GAMECTRL,enum_devices_callback, 0, DIEDFL_ATTACHEDONLY);
    return TRUE;
}

u32 PADRead(PADStatus *status)
{
    int i;

    memset(status, 0, sizeof(*status) * PAD_MAX_CONTROLLERS);
    for (i = 0; i < s_gamepadsCount; i++)
    {
        DIJOYSTATE state;

        if (IDirectInputDevice8_GetDeviceState(s_gamepads[i].device, sizeof(state), &state) == DI_OK)
        {
            if (state.rgbButtons[0] & 0x80)
                status[i].button |= PAD_BUTTON_X;
            if (state.rgbButtons[1] & 0x80)
                status[i].button |= PAD_BUTTON_A;
            if (state.rgbButtons[2] & 0x80)
                status[i].button |= PAD_BUTTON_Y;
            if (state.rgbButtons[3] & 0x80)
                status[i].button |= PAD_BUTTON_B;
            if (state.rgbButtons[5] & 0x80)
                status[i].button |= PAD_TRIGGER_Z;
            if (state.rgbButtons[7] & 0x80)
                status[i].button |= PAD_BUTTON_START;
        }
    }
    return 0;
}

void PADSetAnalogMode(u32 mode)
{
    puts("PADSetAnalogMode is a stub");
}

#endif
