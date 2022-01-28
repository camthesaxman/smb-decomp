u32 __OSGetDIConfig(void);
BOOL EXILock(int chan, int, int);
BOOL EXIUnlock(int chan);
BOOL EXISelect(int chan, int, int);
BOOL EXIDeselect(int chan);
BOOL EXIImm(int chan, u32 *, int, int, int);
BOOL EXIDma(int chan, void *buffer, s32 size, int, int);
BOOL EXISync(int chan);
