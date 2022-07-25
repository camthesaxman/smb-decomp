#pragma once

namespace PAD {
struct Status {
  uint16_t x0_buttons;
  int8_t x2_stickX;
  int8_t x3_stickY;
  int8_t x4_substickX;
  int8_t x5_substickY;
  uint8_t x6_triggerL;
  uint8_t x7_triggerR;
  uint8_t x8_analogA;
  uint8_t x9_analogB;
  int8_t xa_err;
};

enum BUTTON : uint16_t {
  BUTTON_LEFT = 0x0001,
  BUTTON_RIGHT = 0x0002,
  BUTTON_DOWN = 0x0004,
  BUTTON_UP = 0x0008,
  TRIGGER_Z = 0x0010,
  TRIGGER_R = 0x0020,
  TRIGGER_L = 0x0040,
  BUTTON_A = 0x0100,
  BUTTON_B = 0x0200,
  BUTTON_X = 0x0400,
  BUTTON_Y = 0x0800,
  BUTTON_START = 0x1000,
};

enum ERROR : int8_t {
  ERR_NONE = 0,
  ERR_NO_CONTROLLER = -1,
  ERR_NOT_READY = -2,
  ERR_TRANSFER = -3,
};

enum MOTOR : uint32_t {
  MOTOR_STOP = 0,
  MOTOR_RUMBLE = 1,
  MOTOR_STOP_HARD = 2,
};
enum CHAN : uint32_t {
  CHAN0_BIT = 0x80000000,
  CHAN1_BIT = 0x40000000,
  CHAN2_BIT = 0x20000000,
  CHAN3_BIT = 0x10000000,
};
} // namespace PAD

namespace SI {
constexpr uint32_t ERROR_UNKNOWN = 0x0040;
constexpr uint32_t ERROR_BUSY = 0x0080;
constexpr uint32_t ERROR_NO_RESPONSE = 0x0008;
constexpr uint32_t TYPE_GC = 0x08000000;
constexpr uint32_t GBA = 0x00040000;
constexpr uint32_t GC_STANDARD = 0x01000000;
constexpr uint32_t GC_WIRELESS = 0x80000000;
constexpr uint32_t WIRELESS_STATE = 0x02000000;
constexpr uint32_t WIRELESS_FIX_ID = 0x00100000;
constexpr uint32_t GC_CONTROLLER = (TYPE_GC | GC_STANDARD);
constexpr uint32_t GC_RECEIVER = (TYPE_GC | GC_WIRELESS);
constexpr uint32_t GC_WAVEBIRD = (TYPE_GC | GC_WIRELESS | GC_STANDARD | WIRELESS_STATE | WIRELESS_FIX_ID);
} // namespace SI

using PADSamplingCallback = void (*)(void);
constexpr bool PADButtonDown(bool lastButton, bool button) { return ((lastButton ^ button) & button) != 0; }
constexpr bool PADButtonUp(bool lastButton, bool button) { return ((lastButton ^ button) & lastButton) != 0; }
extern "C" {
void PADClamp(PAD::Status* status);
void PADClampCircle(PAD::Status* status);
void PADInit();
bool PADIsBarrel(int32_t chan);
uint32_t PADRead(PAD::Status* status);
bool PADRecalibrate(uint32_t mask);
bool PADReset(uint32_t mask);
void PADSetAnalogMode(uint32_t mode);
void PADSetSpec(int32_t spec);
void PADSetSamplingCallback(PADSamplingCallback callback);
void PADControlAllMotors(const uint32_t* commands);

uint32_t SIProbe(int32_t chan);
}

/* New API to facilitate controller interactions */
struct PADDeadZones {
  bool emulateTriggers = true;
  bool useDeadzones = true;
  uint16_t stickDeadZone = 8000;
  uint16_t substickDeadZone = 8000;
  uint16_t leftTriggerActivationZone = 31150;
  uint16_t rightTriggerActivationZone = 31150;
};

struct PADButtonMapping {
  uint32_t nativeButton;
  PAD::BUTTON padButton;
};

/* Returns the total number of controllers */
uint32_t PADCount();
/* Returns the controller name for the given index into the controller map */
const char* PADGetNameForControllerIndex(uint32_t idx);
void PADSetPortForIndex(uint32_t index, int32_t port);
int32_t PADGetIndexForPort(uint32_t port);
void PADGetVidPid(uint32_t port, uint32_t* vid, uint32_t* pid);
void PADClearPort(uint32_t port);
const char* PADGetName(uint32_t port);
void PADSetButtonMapping(uint32_t port, PADButtonMapping mapping);
void PADSetAllButtonMappings(uint32_t port, PADButtonMapping buttons[12]);
PADButtonMapping* PADGetButtonMappings(uint32_t port, uint32_t* buttonCount);
void PADSerializeMappings();
PADDeadZones* PADGetDeadZones(uint32_t port);
const char* PADGetButtonName(PAD::BUTTON);
const char* PADGetNativeButtonName(uint32_t button);
/* Returns any pressed native button */
int32_t PADGetNativeButtonPressed(uint32_t port);
void PADRestoreDefaultMapping(uint32_t port);
void PADBlockInput(bool block);
