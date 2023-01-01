#include <musyx/musyx.h>
#include "musyx_priv.h"

#include <dolphin.h>

static u8 salTimeOffset;
u8 salFrame;
u8 salAuxFrame;
u8 salNumVoices;
SND_HOOKS salHooks;

void hwSetTimeOffset(u8);
void hwSetSRCType(int arg0, u8 arg1);
void hwSetPolyPhaseFilter(int arg0, u8 arg1);
void hwSetITDMode(int arg0, u8 arg1);

void snd_handle_irq(void)
{
    u8 i, j;

    if (sndActive_2)
    {
        streamCorrectLoops();
        hwIRQEnterCritical();
        salCtrlDsp(salAiGetDest());
        hwIRQLeaveCritical();
        hwIRQEnterCritical();
        salHandleAuxProcessing();
        hwIRQLeaveCritical();
        hwIRQEnterCritical();
        salFrame ^= 1;
        salAuxFrame = (salAuxFrame + 1) % 3;
        for (i = 0; i < salNumVoices; i++)
        {
            for (j = 0; j < 5; j++)
                dspVoice[i].unk24[j] = 0;
        }
        hwIRQLeaveCritical();
        for (i = 0; i < 5; i++)
        {
            hwIRQEnterCritical();
            hwSetTimeOffset(i);
            seqHandle(0x100);
            synthHandle(0x100);
            hwIRQLeaveCritical();
        }
        hwIRQEnterCritical();
        s3dHandle();
        hwIRQLeaveCritical();
        hwIRQEnterCritical();
        streamHandle();
        hwIRQLeaveCritical();
    }
}

int hwInit(int *arg0, u32 arg1, int arg2)
{
    hwInitIrq();
    salFrame = 0;
    salAuxFrame = 0;
    salMessageCallback = NULL;
    if (salInitAi(snd_handle_irq, arg2, arg0) != 0
     && salInitDspCtrl(arg1, (arg2 & 1) != 0) != 0
     && salInitDsp(arg2) != 0)
    {
        hwEnableIrq();
        salStartAi();
        return 0;
    }
    return -1;
}

void hwSetTimeOffset(u8 arg0)
{
    salTimeOffset = arg0;
}

u8 hwGetTimeOffset(void)
{
    return salTimeOffset;
}

u32 hwIsActive(int arg0)
{
    return dspVoice[arg0].unkE8 != 0;
}

void hwSetMesgCallback(void *arg0)
{
    salMessageCallback = arg0;
}

void hwSetPriority(int arg0, int arg1)
{
    dspVoice[arg0].unk1C = arg1;
}

void hwInitSamplePlayback(int arg0, s16 arg1, struct DSPVoice_sub *arg2, u32 arg3, int arg4, int arg5, u32 arg6, u8 arg7)
{
    u8 var_r28;
    u32 var_r27;

    var_r27 = 0;
    for (var_r28 = 0; var_r28 <= salTimeOffset; var_r28++)
    {
        var_r27 |= dspVoice[arg0].unk24[var_r28] & 0x20;
        dspVoice[arg0].unk24[var_r28] = 0;
    }
    dspVoice[arg0].unk24[0] = var_r27;
    dspVoice[arg0].unk1C = arg4;
    dspVoice[arg0].unk18 = arg5;
    dspVoice[arg0].unkEC = 0;
    dspVoice[arg0].unk70 = arg1;
    dspVoice[arg0].unk74 = *arg2;
    if (arg3 != 0)
    {
        dspVoice[arg0].unkA4 = 0;
        dspVoice[arg0].unkB8 = 0;
        dspVoice[arg0].unkBC = 0;
        dspVoice[arg0].unkC0 = 0x7FFF;
        dspVoice[arg0].unkC4 = 0;
    }
    dspVoice[arg0].unkE4 = 0xFF;
    dspVoice[arg0].unkE5 = 0xFF;
    dspVoice[arg0].unkE6 = 0xFF;
    dspVoice[arg0].unkE7 = 0xFF;
    if (arg6 != 0)
    {
        hwSetSRCType(arg0, 0);
        hwSetPolyPhaseFilter(arg0, 1);
    }
    hwSetITDMode(arg0, arg7);
}

void hwRelease(int arg0)
{
    switch (dspVoice[arg0].unkA4)
    {
    case 0:
        dspVoice[arg0].unkC4 = 10;
        dspVoice[arg0].unk24[salTimeOffset] |= 0x40;
        return;
    case 1:
        dspVoice[arg0].unkC4 = 10;
        dspVoice[arg0].unk24[salTimeOffset] |= 0x40;
        return;
    }
}

void hwBreak(int arg0)
{
    dspVoice[arg0].unk24[salTimeOffset] |= 0x20;
}

struct UnkStruct
{
    union
    {
        struct
        {
            u16 unk0;
            u16 unk2;
        } u1;
        u32 u2;
    } unk0;
    union
    {
        struct
        {
            u16 unk0;
            u16 unk2;
        } u1;
        u32 u2;
    } unk4;
    u16 unk8;
    u16 unkA;
};

void hwSetADSR(int arg0, struct UnkStruct *arg1, u8 arg2)
{
    switch (arg2)
    {
    case 0:
        dspVoice[arg0].unkA4 = 0;
        dspVoice[arg0].unkB8 = arg1->unk0.u1.unk0;
        dspVoice[arg0].unkBC = arg1->unk0.u1.unk2;
        dspVoice[arg0].unkC0 = MIN((u32)(arg1->unk4.u1.unk0 * 8), 0x7FFF);
        dspVoice[arg0].unkC4 = arg1->unk4.u1.unk2;
        break;
    case 1:
    case 2:
        dspVoice[arg0].unkA4 = 1;
        dspVoice[arg0].fillerC8[2] = 0;
        if (arg2 == 1)
        {
            dspVoice[arg0].unkB8 = adsrConvertTimeCents(arg1->unk0.u2);
            dspVoice[arg0].unkBC = adsrConvertTimeCents(arg1->unk4.u2);
            dspVoice[arg0].unkC0 = 0xC1 - dspScale2IndexTab[MIN((u32)(arg1->unk8 >> 2), 0x3FF)];
        }
        else
        {
            dspVoice[arg0].unkB8 = (u16)arg1->unk0.u2;
            dspVoice[arg0].unkBC = (u16)arg1->unk4.u2;
            dspVoice[arg0].unkC0 = arg1->unk8;
        }
        dspVoice[arg0].unkC4 = (u32) arg1->unkA;
        break;
    }
    dspVoice[arg0].unk24[0] |= 0x10;
}

void hwSetStreamLoopPS(int arg0, u8 arg1)
{
    dspVoice[arg0].unkA0 = arg1;
}

void hwStart(int arg0, int arg1)
{
    dspVoice[arg0].unkD4 = salTimeOffset;
    salActivateVoice(&dspVoice[arg0], arg1);
}

void hwKeyOff(int arg0)
{
    dspVoice[arg0].unk24[salTimeOffset] |= 0x40;
}

void hwSetPitch(int arg0, u16 arg1)
{
    struct DSPVoice *temp_r5 = &dspVoice[arg0];

    if (arg1 >= 0x4000U)
        arg1 = 0x3FFF;
    if (temp_r5->unkE4 == 0xFF || temp_r5->unk38[temp_r5->unkE4] != arg1 * 0x10)
    {
        temp_r5->unk38[salTimeOffset] = arg1 * 0x10;
        temp_r5->unk24[salTimeOffset] |= 8;
        temp_r5->unkE4 = salTimeOffset;
    }
}

static u16 dspSRCType[4] = { 0, 1, 2, 0 };
static u16 dspCoefSel[4] = { 0, 1, 2, 0 };

void hwSetSRCType(int arg0, u8 arg1)
{
    struct DSPVoice *temp_r3 = &dspVoice[arg0];

    temp_r3->unkCC = dspSRCType[arg1];
    temp_r3->unk24[0] |= 0x100;
}

void hwSetPolyPhaseFilter(int arg0, u8 arg1)
{
    struct DSPVoice *temp_r3 = &dspVoice[arg0];

    temp_r3->unkCE = dspCoefSel[arg1];
    temp_r3->unk24[0] |= 0x80;
}

void hwSetITDMode(int arg0, u8 arg1)
{
    if (arg1 == 0)
    {
        dspVoice[arg0].unkEC |= 0x80000000;
        dspVoice[arg0].unkD0 = 0x10;
        dspVoice[arg0].unkD2 = 0x10;
    }
    else
        dspVoice[arg0].unkEC &= 0x7FFFFFFF;
}

const u16 lbl_80171CC0[128] =
{
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    2,
    2,
    2,
    2,
    3,
    3,
    3,
    3,
    3,
    4,
    4,
    4,
    4,
    5,
    5,
    5,
    6,
    6,
    6,
    7,
    7,
    7,
    8,
    8,
    8,
    9,
    9,
    9,
    0xA,
    0xA,
    0xA,
    0xB,
    0xB,
    0xC,
    0xC,
    0xC,
    0xD,
    0xD,
    0xD,
    0xE,
    0xE,
    0xF,
    0xF,
    0xF,
    0x10,
    0x10,
    0x11,
    0x11,
    0x11,
    0x12,
    0x12,
    0x13,
    0x13,
    0x13,
    0x14,
    0x14,
    0x14,
    0x15,
    0x15,
    0x16,
    0x16,
    0x16,
    0x17,
    0x17,
    0x17,
    0x18,
    0x18,
    0x18,
    0x19,
    0x19,
    0x19,
    0x1A,
    0x1A,
    0x1A,
    0x1B,
    0x1B,
    0x1B,
    0x1C,
    0x1C,
    0x1C,
    0x1C,
    0x1D,
    0x1D,
    0x1D,
    0x1D,
    0x1D,
    0x1E,
    0x1E,
    0x1E,
    0x1E,
    0x1E,
    0x1F,
    0x1F,
    0x1F,
    0x1F,
    0x1F,
    0x1F,
    0x1F,
    0x20,
    0x20,
    0x20,
    0x20,
    0x20,
    0x20,
    0x20,
    0x20,
    0x20,
    0x20,
    0x20,
};

void hwSetVolume(int arg0, u8 arg1, u32 arg2, int arg3, float arg8, float arg9, float argA)
{
    SND_FVECTOR sp24[3];
    u16 temp_r4;
    u16 temp_r5;
    u16 temp_r6;
    struct DSPVoice *temp_r31 = &dspVoice[arg0];

    if (arg8 >= 1.0f)
        arg8 = 1.0f;
    if (arg9 >= 1.0f)
        arg9 = 1.0f;
    if (argA >= 1.0f)
        argA = 1.0f;
    salCalcVolume(arg1,
                  sp24,
                  arg2,
                  arg3,
                  (temp_r31->unkEC & 0x80000000) != 0,
                  dspStudio[temp_r31->unkEA].unk54 == 1,
                  arg8,
                  arg9,
                  argA);

    temp_r4 = 32767.0f * sp24[0].x;
    temp_r5 = 32767.0f * sp24[0].y;
    temp_r6 = 32767.0f * sp24[0].z;
    if (temp_r31->unkE5 == 0xFF
     || temp_r31->unk4C != temp_r4
     || temp_r31->unk4E != temp_r5
     || temp_r31->unk50 != temp_r6)
    {
        temp_r31->unk4C = temp_r4;
        temp_r31->unk4E = temp_r5;
        temp_r31->unk50 = temp_r6;
        temp_r31->unk24[0] |= 1;
        temp_r31->unkE5 = 0;
    }

    temp_r4 = 32767.0f * sp24[1].x;
    temp_r5 = 32767.0f * sp24[1].y;
    temp_r6 = 32767.0f * sp24[1].z;
    if (temp_r31->unkE6 == 0xFF
     || temp_r31->unk52 != temp_r4
     || temp_r31->unk54 != temp_r5
     || temp_r31->unk56 != temp_r6)
    {
        temp_r31->unk52 = temp_r4;
        temp_r31->unk54 = temp_r5;
        temp_r31->unk56 = temp_r6;
        temp_r31->unk24[0] |= 2;
        temp_r31->unkE6 = 0;
    }

    temp_r4 = 32767.0f * sp24[2].x;
    temp_r5 = 32767.0f * sp24[2].y;
    temp_r6 = 32767.0f * sp24[2].z;
    if (temp_r31->unkE7 == 0xFF
     || temp_r31->unk58 != temp_r4
     || temp_r31->unk5A != temp_r5
     || temp_r31->unk5C != temp_r6)
    {
        temp_r31->unk58 = temp_r4;
        temp_r31->unk5A = temp_r5;
        temp_r31->unk5C = temp_r6;
        temp_r31->unk24[0] |= 4;
        temp_r31->unkE7 = 0;
    }

    if (temp_r31->unkEC & 0x80000000)
    {
        temp_r31->unkD0 = lbl_80171CC0[(u8)(arg2 >> 16)];
        temp_r31->unkD2 = 0x20 - lbl_80171CC0[(u8)(arg2 >> 16)];
        temp_r31->unk24[0] |= 0x200;
    }
}

void hwOff(int arg0)
{
    salDeactivateVoice(&dspVoice[arg0]);
}

void hwSetAUXProcessingCallbacks(u8 studio, SND_AUX_CALLBACK auxA, void *userA, SND_AUX_CALLBACK auxB, void *userB)
{
    struct DSPStudio *myStudio = &dspStudio[studio];

    myStudio->unkAC = auxA;
    myStudio->unkB4 = userA;
    myStudio->unkB0 = auxB;
    myStudio->unkB8 = userB;
}

void hwActivateStudio(u8 studio, u32 arg1, u32 arg2)
{
    salActivateStudio(studio, arg1, arg2);
}

void hwDeactivateStudio(u8 studio)
{
    salDeactivateStudio(studio);
}

bool hwAddInput(u8 arg0, void *arg1)
{
    return salAddStudioInput(&dspStudio[arg0], arg1);
}

bool hwRemoveInput(u8 arg0, void *arg1)
{
    return salRemoveStudioInput(&dspStudio[arg0], arg1);
}

int hwGetPos(int arg0)
{
    int r3;
    u32 r4;

    if (dspVoice[arg0].unkE8 != 2)
        return 0;
    switch (dspVoice[arg0].unk74.unk1C)
    {
    case 0:
    case 1:
    case 4:
    case 5:
        r3 = ((dspVoice[arg0].unk20 - dspVoice[arg0].unk74.unk4 * 2) >> 4) * 14;
        r4 = dspVoice[arg0].unk20 & 0xF;
        if (r4 < 2)
            return r3;
        r3 = r4 + r3;
        return r3 - 2;
    case 3:
        return dspVoice[arg0].unk20 - dspVoice[arg0].unk74.unk4;
    case 2:
        return dspVoice[arg0].unk20 - (dspVoice[arg0].unk74.unk4 >> 1);
    }
}

void hwFlushStream(u8 *arg0, int arg1, int arg2, u8 arg3)
{
    u32 dummy;
    u32 temp_r31;
    u8 *temp_r30;
    s32 temp_r29;
    s32 temp_r28;

    temp_r31 = aramGetStreamBufferAddress(arg3, &dummy);
    arg2 += arg1 & 0x1F;
    temp_r28 = OSRoundDown32B(arg1);
    temp_r29 = OSRoundUp32B(arg2);
    temp_r30 = arg0 + temp_r28;
    DCStoreRange(temp_r30, temp_r29);
    aramUploadData(temp_r30, temp_r31 + temp_r28, temp_r29, 1);
}

void hwInitStream(u32 arg0)
{
    aramAllocateStreamBuffer(arg0);
}

void hwExitStream(u8 arg0)
{
    aramFreeStreamBuffer(arg0);
}

u32 hwGetStreamPlayBuffer(u8 arg0)
{
    return aramGetStreamBufferAddress(arg0, NULL);
}

void *hwTransAddr(void *arg0)
{
    return arg0;
}

u32 hwFrq2Pitch(u32 arg0)
{
    return (4096.0f * arg0) / synthInfo.freq;
}

void hwInitSampleMem(int arg0, int arg1)
{
    aramInit(arg1);
}

struct UnkStruct2
{
    u8 filler0[4];
    u32 unk4;
};

void hwSaveSample(struct UnkStruct2 **arg0, void **arg1)
{
    u32 r0 = (*arg0)->unk4 >> 24;
    u32 r4 = (*arg0)->unk4 & 0xFFFFFF;

    switch (r0)
    {
    case 0:
    case 1:
    case 4:
    case 5:
        r4 = ((r4 + 13) / 14) * 8;
        break;
    case 2:
        r4 *= 2;
        break;
    }
    *arg1 = aramStoreData(*arg1, r4);
}

void hwRemoveSample(struct UnkStruct2 *arg0, u32 arg1)
{
    u32 r0 = arg0->unk4 >> 24;
    u32 r4 = arg0->unk4 & 0xFFFFFF;

    switch (r0)
    {
    case 0:
    case 1:
    case 4:
    case 5:
        r4 = ((r4 + 13) / 14) * 8;
        break;
    case 2:
        r4 *= 2;
        break;
    }
    aramRemoveData(arg1, r4);
}

void hwSyncSampleMem(void)
{
    aramSyncTransferQueue();
}

void hwFrameDone(void) {}

void sndSetHooks(SND_HOOKS *hooks)
{
    salHooks = *hooks;
}

void hwDisableHRTF(void)
{
    dspHRTFOn = 0;
}
