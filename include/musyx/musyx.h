#ifndef _MUSYX_MUSYX_H_
#define _MUSYX_MUSYX_H_

#define SND_AUX_NUMPARAMETERS 4

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

void sndVolume(int, int, int);
void sndMasterVolume(int, int, int, int);

#endif
