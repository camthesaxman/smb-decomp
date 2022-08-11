#ifndef _MUSYX_SEQ_H_
#define _MUSYX_SEQ_H_

#include <musyx/musyx.h>

extern u16 seqMIDIPriority[8][16];

void sndSeqStop(s32 unk);
void sndSeqSpeed(s32 unk1, s32 unk2);
void sndSeqContinue(s32 unk);
void sndSeqMute(s32 unk1, s32 unk2, s32 unk3);
void sndSeqVolume(s32 unk1, s32 unk2, s32 unk3, s32 unk4);
u16 seqGetMIDIPriority(s32 unk1, s32 unk2);

void hwEnableIrq(void);
void hwDisableIrq(void);

void seqStop(s32);
void seqSpeed(s32, s32);
void seqContinue(s32);
void seqMute(s32, s32, s32);
void seqVolume(s32, s32, s32, s32);

#endif
