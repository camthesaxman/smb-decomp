#ifndef _DOLPHIN_DVD_H_
#define _DOLPHIN_DVD_H_

typedef struct DVDDiskID DVDDiskID;
struct DVDDiskID
{
    char gameName[4];
    char company[2];
    u8 diskNumber;
    u8 gameVersion;
    u8 streaming;
    u8 streamingBufSize;
    u8 padding[22];
};

typedef struct DVDCommandBlock DVDCommandBlock;
typedef void (*DVDCBCallback)(s32, DVDCommandBlock *);
struct DVDCommandBlock
{
    DVDCommandBlock *next;
    DVDCommandBlock *prev;
    u32 command;
    s32 state;
    u32 offset;
    u32 length;
    void *addr;
    u32 currTransferSize;
    u32 transferredSize;
    DVDDiskID *id;
    DVDCBCallback callback;
    void *userData;
};

typedef struct DVDFileInfo  DVDFileInfo;
typedef void (*DVDCallback)(s32, DVDFileInfo *);
struct DVDFileInfo
{
	DVDCommandBlock cb;
    u32 startAddr;
    u32 length;
    DVDCallback callback;
};

void DVDInit(void);
BOOL DVDOpen(char *, DVDFileInfo *);
BOOL DVDClose(DVDFileInfo *);
BOOL DVDChangeDir(char *);

#endif
