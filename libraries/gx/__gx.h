extern volatile u16 *__cpReg;
extern volatile u32 *__piReg;

struct GX
{
    u8 filler0[0x2];
    u16 unk2;
    u8 filler4[4];
    u32 unk8;
    u8 fillerC[0x4EC-0xC];
    u8 unk4EC;
    u8 unk4ED;
    u8 filler4EE[0x4F0-0x4EE];
    u32 unk4F0;
};  // size = 0x4F4

extern struct GX *gx;

void __GXSetDirtyState(void);
void __GXSaveCPUFifoAux(void *);
void __GXSendFlushPrim(void);
