#ifndef _MUSYX_MUSYX_H_
#define _MUSYX_MUSYX_H_

#include <dolphin/types.h>

typedef int bool;

#define SND_AUX_NUMPARAMETERS 4

#define SND_AUX_REASON_BUFFERUPDATE 0
#define SND_AUX_REASON_PARAMETERUPDATE 1

typedef u32 SND_SEQID;
typedef u32 SND_VOICEID;
typedef u16 SND_FXID;

typedef enum
{
    SND_OUTPUTMODE_MONO = 0,
    SND_OUTPUTMODE_STEREO,
    SND_OUTPUTMODE_SURROUND,
} SND_OUTPUTMODE;

typedef struct SND_AUX_INFO
{
    union SND_AUX_DATA
    {
        struct SND_AUX_BUFFERUPDATE
        {
            s32 *left;
            s32 *right;
            s32 *surround;
        } bufferUpdate;
        struct SND_AUX_PARAMETERUPDATE
        {
            u16 para[SND_AUX_NUMPARAMETERS];
        } parameterUpdate;
    } data;
} SND_AUX_INFO;

typedef struct SND_HOOKS
{
    void *(*malloc)(u32 addr);
    void (*free)(void *addr);
} SND_HOOKS;

void sndSetHooks(SND_HOOKS *hooks);

typedef struct SND_FVECTOR
{
    f32 x;
    f32 y;
    f32 z;
} SND_FVECTOR;

typedef struct SND_FMATRIX
{
    f32 m[3][3];
    f32 t[3];
} SND_FMATRIX;

typedef struct _SND_REVHI_DELAYLINE
{
    /*0x00*/ s32 inPoint;
    /*0x04*/ s32 outPoint;
    /*0x08*/ s32 length;
    /*0x0C*/ f32 *inputs;
    /*0x10*/ f32 lastOutput;
} _SND_REVHI_DELAYLINE;

typedef struct _SND_REVHI_WORK
{
    /*0x000*/ _SND_REVHI_DELAYLINE AP[9];
    /*0x0B4*/ _SND_REVHI_DELAYLINE C[9];
    /*0x168*/ f32 allPassCoeff;
    /*0x16C*/ f32 combCoef[9];
    /*0x190*/ f32 lpLastout[3];
    /*0x19C*/ f32 level;
    /*0x1A0*/ f32 damping;
    /*0x1A4*/ s32 preDelayTime;
    /*0x1A8*/ f32 crosstalk;
    /*0x1AC*/ f32 *preDelayLine[3];
    /*0x1B8*/ f32 *preDelayPtr[3];
} _SND_REVHI_WORK;

typedef struct SND_AUX_REVERBHI
{
    /*0x000*/ _SND_REVHI_WORK rv;
    /*0x1C4*/ u8 tempDisableFX;
    /*0x1C8*/ f32 coloration;
    /*0x1CC*/ f32 mix;
    /*0x1D0*/ f32 time;
    /*0x1D4*/ f32 damping;
    /*0x1D8*/ f32 preDelay;
    /*0x1DC*/ f32 crosstalk;
} SND_AUX_REVERBHI;

void sndVolume(u8 volume, u16 time, u8 volgroup);
void sndMasterVolume(u8 volume, u16 time, u8 music, u8 fx);

typedef struct SND_PARAMETER
{
    u8 ctrl;
    union
    {
        u8 value7;
        u16 value14;
    } paraData;
} SND_PARAMETER;

typedef struct SND_PARAMETER_INFO
{
    u8 numPara;
    SND_PARAMETER *paraArray;
} SND_PARAMETER_INFO;

SND_VOICEID sndFXStartParaInfo(SND_FXID fid, u8 vol, u8 pan, u8 studio, SND_PARAMETER_INFO *paraInfo);
int sndFXCtrl(SND_VOICEID vid, u8 ctrl, u8 value);
int sndFXCtrl14(SND_VOICEID vid, u8 ctrl, u16 value);

void sndAuxCallbackReverbHI(u8 reason, SND_AUX_INFO *info, void *user);
bool sndAuxCallbackPrepareReverbHI(SND_AUX_REVERBHI *rev);
bool sndAuxCallbackShutdownReverbHI(SND_AUX_REVERBHI *rev);

typedef void (*SND_AUX_CALLBACK)(u8 reason, SND_AUX_INFO *info, void *user);

void sndAuxCallbackChorus(u8 reason, SND_AUX_INFO *info, void *user);
void sndAuxCallbackPrepareChorus();
void sndOutputMode();
void sndActive();
int sndPushGroup();
void sndPopGroup(void);
SND_VOICEID sndFXCheck(SND_VOICEID arg0);
bool sndFXKeyOff(SND_VOICEID vid);
void sndStreamFree();
int sndStreamAllocEx();
void sndSetAuxProcessingCallbacks(u8 studio, 
                                  SND_AUX_CALLBACK auxA, void *userA, u8 midiA, SND_SEQID seqIDA,
                                  SND_AUX_CALLBACK auxB, void *userB, u8 midiB, SND_SEQID seqIDB);

#endif
