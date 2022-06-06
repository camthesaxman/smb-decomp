extern volatile u16 *__cpReg;
extern volatile u32 *__piReg;

struct GX
{
    u16 unk0;
    u16 unk2;
    u32 unk4;
    u32 unk8;
    u8 fillerC[0x7C-0xC];
    u32 unk7C;
    u8 filler80[0xB8-0x80];
    u32 unkB8[GX_MAX_TEXCOORD];
    u8 fillerD8[0x204-0xD8];
    u32 unk204;
    u8 filler208[0x4EC-0x208];
    u8 unk4EC;
    u8 unk4ED;
    u8 filler4EE[0x4F0-0x4EE];
    u32 unk4F0;
};  // size = 0x4F4

extern struct GX *gx;

#define GX_WRITE_U8(ub)	    \
    GXWGFifo.u8 = (u8)(ub)

#define GX_WRITE_U16(us)   \
   GXWGFifo.u16 = (u16)(us)

#define GX_WRITE_U32(ui)   \
   GXWGFifo.u32 = (u32)(ui)

#define GX_WRITE_F32(f)	 	\
   GXWGFifo.f32 = (f32)(f);

void __GXSetDirtyState(void);
void __GXSaveCPUFifoAux(void *);
void __GXSendFlushPrim(void);
void __GXSetSUTexSize(void);
void __GXUpdateBPMask(void);
void __GXSetVCD(void);
void __GXSetVAT(void);
