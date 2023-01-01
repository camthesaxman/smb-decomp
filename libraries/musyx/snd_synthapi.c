#include <musyx/musyx.h>
#include "musyx_priv.h"

bool sndFXCtrl(SND_VOICEID vid, u8 ctrl, u8 value)
{
    bool ret;

    hwDisableIrq();
    ret = synthFXSetCtrl(vid, ctrl, value);
    hwEnableIrq();
    return ret;
}

bool sndFXCtrl14(SND_VOICEID vid, u8 ctrl, u16 value)
{
    bool ret;

    hwDisableIrq();
    ret = synthFXSetCtrl14(vid, ctrl, value);
    hwEnableIrq();
    return ret;
}

bool sndFXKeyOff(SND_VOICEID vid)
{
    bool ret;

    hwDisableIrq();
    ret = synthSendKeyOff(vid);
    hwEnableIrq();
    return ret;
}

SND_VOICEID sndFXStartParaInfo(SND_FXID fid, u8 vol, u8 pan, u8 studio, SND_PARAMETER_INFO *paraInfo)
{
    u32 ret;
    u8 i;
    SND_PARAMETER *para;

    hwDisableIrq();
    ret = synthFXStart(fid, vol, pan, studio, synthITDDefault[studio][1]);
    if (ret != -1U)
    {
        para = paraInfo->paraArray;
        for (i = 0; i < paraInfo->numPara; i++)
        {
            if (para->ctrl < 0x40 || para->ctrl == 0x80 || para->ctrl == 0x84)
                synthFXSetCtrl14(ret, para->ctrl, para->paraData.value14);
            else
                synthFXSetCtrl(ret, para->ctrl, para->paraData.value7);
            para++;
        }
    }
    hwEnableIrq();
    return ret;
}

SND_VOICEID sndFXCheck(SND_VOICEID arg0)
{
    return vidGetInternalId(arg0) != -1U ? arg0 : -1;
}

void sndVolume(u8 volume, u16 time, u8 volgroup)
{
    hwDisableIrq();
    synthVolume(volume, time, volgroup, 0, -1);
    hwEnableIrq();
}

void sndMasterVolume(u8 volume, u16 time, u8 music, u8 fx)
{
    hwDisableIrq();
    if (music != 0)
        synthVolume(volume, time, 0x15, 0, -1);
    if (fx != 0)
        synthVolume(volume, time, 0x16, 0, -1);
    hwEnableIrq();
}

void sndOutputMode(SND_OUTPUTMODE output)
{
    switch (output) {
    case SND_OUTPUTMODE_MONO:
        lbl_802F261D = 1;
        synthFlags = 0;
        hwDisableHRTF();
        break;
    case SND_OUTPUTMODE_STEREO:
        lbl_802F261D = 0;
        synthFlags = 0;
        hwDisableHRTF();
        break;
    case SND_OUTPUTMODE_SURROUND:
        lbl_802F261D = 0;
        synthFlags = 1;
        hwDisableHRTF();
        break;
    }
}

void sndSetAuxProcessingCallbacks(u8 studio, 
                                  SND_AUX_CALLBACK auxA, void *userA, u8 midiA, SND_SEQID seqIDA, 
                                  SND_AUX_CALLBACK auxB, void *userB, u8 midiB, SND_SEQID seqIDB)
{
    hwDisableIrq();

    if (auxA != NULL)
    {
        synthAuxAMIDI[studio] = midiA;
        if (midiA != 0xFF)
        {
            synthAuxAMIDISet[studio] = seqGetPrivateId(seqIDA);
            synthAuxACallback[studio] = auxA;
            synthAuxAUser[studio] = userA;
        }
    }
    else
    {
        synthAuxACallback[studio] = NULL;
        synthAuxAMIDI[studio] = 0xFF;
    }

    if (auxB != NULL)
    {
        synthAuxBMIDI[studio] = midiB;
        if (midiB != 0xFF)
        {
            synthAuxBMIDISet[studio] = seqGetPrivateId(seqIDB);
            synthAuxBCallback[studio] = auxB;
            synthAuxBUser[studio] = userB;
        }
    }
    else
    {
        synthAuxBCallback[studio] = NULL;
        synthAuxBMIDI[studio] = 0xFF;
    }

    hwSetAUXProcessingCallbacks(studio, auxA, userA, auxB, userB);
    hwEnableIrq();
}

void synthActivateStudio(u8 studio, u32 arg1, u32 arg2)
{
    hwDisableIrq();
    synthAuxACallback[studio] = NULL;
    synthAuxBCallback[studio] = NULL;
    synthAuxAMIDI[studio] = 0xFF;
    synthAuxBMIDI[studio] = 0xFF;
    synthITDDefault[studio][1] = 0;
    synthITDDefault[studio][0] = 0;
    hwEnableIrq();
    hwActivateStudio(studio, arg1, arg2);
}

void synthDeactivateStudio(u8 studio)
{
    u32 i;

    for (i = 0; i < synthInfo.voices; ++i)
    {
        if (studio == synthVoice[i].studio)
        {
            if (synthVoice[i]._f4 != -1U)
                voiceKillSound(synthVoice[i].voiceId->pubId);
            else if (hwIsActive(i))
                hwOff(i);
        }
    }
    hwDisableIrq();
    synthAuxACallback[studio] = 0;
    synthAuxBCallback[studio] = 0;
    synthAuxAMIDI[studio] = 0xFF;
    synthAuxBMIDI[studio] = 0xFF;
    hwEnableIrq();
    hwDeactivateStudio(studio);
}

bool synthAddStudioInput(u8 studio, void *unk)
{
    return hwAddInput(studio, unk);
}

bool synthRemoveStudioInput(u8 studio, void *unk)
{
    return hwRemoveInput(studio, unk);
}
