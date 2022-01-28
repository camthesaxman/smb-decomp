#ifndef _DOLPHIN_HIO_H_

BOOL HIOReadMailbox(u32 *word);
BOOL HIOWriteMailbox(u32 word);
BOOL HIORead(u32 addr, void *buffer, s32 size);
BOOL HIOWrite(u32 addr, void *buffer, s32 size);

#endif
