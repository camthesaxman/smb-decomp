#ifndef _DOLPHIN_DTK_H_
#define _DOLPHIN_DTK_H_

typedef void (*DTKCallback)(u32 eventMask);
typedef void (*DTKFlushCallback)(void);

typedef struct DTKTrack
{
	/*0x00*/ struct DTKTrack *prev;
    /*0x04*/ struct DTKTrack *next;
    /*0x08*/ char *fileName;
    /*0x0C*/ u32 eventMask;
    /*0x10*/ DTKCallback callback;
    /*0x14*/ DVDFileInfo dvdFileInfo;
} DTKTrack;

void DTKInit(void);
u32 DTKQueueTrack(char *fileName, DTKTrack *track, u32 eventMask, DTKCallback callback);
u32 DTKRemoveTrack(DTKTrack *track);
void DTKSetRepeatMode(u32 repeat);
void DTKSetVolume(int left, int right);

#endif
