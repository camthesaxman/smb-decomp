#ifndef _DOLPHIN_HIO_H_

BOOL HIOWriteMailbox(u32 word);
BOOL HIORead(u32 addr, void *buffer, s32 size);
BOOL HIOWrite(u32 addr, void *buffer, s32 size);

#endif
