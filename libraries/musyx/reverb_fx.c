#include <musyx/musyx.h>
#include "musyx_priv.h"

void sndAuxCallbackReverbHI(u8 reason, SND_AUX_INFO *info, void *user)
{
    switch (reason)
    {
    case SND_AUX_REASON_BUFFERUPDATE:
        if (((SND_AUX_REVERBHI*)user)->tempDisableFX == 0)
        {
            ReverbHICallback(info->data.bufferUpdate.left, 
                             info->data.bufferUpdate.right, 
                             info->data.bufferUpdate.surround, user);
        }
    case SND_AUX_REASON_PARAMETERUPDATE:
        break;
    default:
        //ASSERT_MSG(FALSE);
        break;
    }
}

bool sndAuxCallbackPrepareReverbHI(SND_AUX_REVERBHI *rev)
{
    rev->tempDisableFX = 0;
    return ReverbHICreate(&rev->rv, rev->coloration, rev->time, rev->mix, rev->damping, rev->preDelay, rev->crosstalk);
}

/*
bool sndAuxCallbackShutdownReverbHI(SND_AUX_REVERBHI *rev)
{
    ReverbHIFree(&rev->rv);
    return TRUE;
}
*/
