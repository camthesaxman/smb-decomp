#ifndef _SRC_SOUND_H_
#define _SRC_SOUND_H_

struct Struct80110400
{
    char *unk0;
    u32 unk4;
    s32 unk8;
    u32 unkC;
    char *unk10;
};

extern const struct Struct80110400 lbl_80110400[];

struct Struct8011057C
{
    s32 unk0;
    char *unk4;
    s8 unk8;
    s16 unkA;
    s16 unkC;
};

extern const struct Struct8011057C lbl_8011057C[];

extern s32 lbl_802F1E00;
extern s32 lbl_802F1DFC;
extern int lbl_802F1DF8;
extern u8 lbl_802F1DF5;
extern u8 lbl_802F1DF4;
extern u32 lbl_802F1DF0;
extern u32 lbl_802F1DEC;
extern u32 lbl_802F1DE8;
extern u32 lbl_802F1DE4;
extern const char *lbl_802F1DE0;
extern const char *lbl_802F1DDC;
extern u8 lbl_802F1DD9;
extern u8 lbl_802F1DD8;
extern s32 lbl_802F1DD4;
extern u32 lbl_802F1DD0;
extern s32 lbl_802F1DCC;

struct Struct802014E0
{
    s32 unk0;
    u32 unk4;
    u8 filler8[4];
    u8 unkC;
    u8 fillerD[0x10-0xD];
    s32 unk10;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
};

extern struct Struct802014E0 lbl_802014E0;
extern s8 lbl_80201500[0x428];

void sound_init(void);
void sound_main(void);
void SoundGroupLoad(int arg0);
void func_80029788(void);
void ev_sound_init(void);
void ev_sound_main(void);
void ev_sound_dest(void);
int SoundReq(u32 arg0);
int SoundReqDirect(u32 arg0);
void u_play_sound_0(int arg0);
void u_play_sound_1(int arg0);
int u_play_sound_2(int arg0);
int u_play_sound_1_dupe(int arg0);
int func_8002B634(int arg0, Vec *arg1, s8 *arg2, s8 *arg3);
void func_8002BFCC(u32 arg0, u32 arg1);
void SoundOff(u16 arg0);
void SoundVol(u16 arg0, u8 arg1);
void SoundPan(u16 arg0, u8 arg1, u8 arg2);
void SoundPitch(u16 arg0, u16 arg1);
void SoundDop(u16 arg0, u16 arg1);
void SoundRev(u16 arg0, u8 arg1);
void SoundCho(u16 arg0, u8 arg1);
void SoundOffID(int arg0_);
void SoundRevID(int arg0_, u8 arg1);
void SoundChoID(int arg0_, u8 arg1);
void func_8002CA38(s8 arg0, s8 arg1);
void func_8002CA5C(u32 arg0, u8 arg1, s8 arg2);
void func_8002CEAC(void);
void func_8002CEB0(void);
void func_8002CEB4(void);
void u_play_music(u32 arg0, s8 arg1);
void SoundStreamStart(void);
void func_8002DA18(void);
void func_8002DAB0(u32 mode);
void func_8002DB10(struct MemcardGameData *arg0);
void func_8002DB24(struct MemcardGameData *arg0);
void func_8002DB38(void);
void func_8002DBC4(void);

#endif
