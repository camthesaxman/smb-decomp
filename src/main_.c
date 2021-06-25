typedef signed char s8;
typedef unsigned char u8;
typedef signed short int s16;
typedef unsigned short int u16;
typedef signed int s32;
typedef unsigned int u32;

struct Struct802F1B60
{
    u8 filler0[0x90];
    u32 unk90;
    u32 unk94;
    u8 filler98[0x198-0x98];
    float unk198;
    float unk19C;
    float unk1A0;
    float unk1A4;
    s32 unk1A8;
    u8 unk1AC;
    u8 unk1AD;
    u8 unk1AE;
    u8 unk1AF;
};

extern struct Struct802F1B60 *lbl_802F1B60;

extern float lbl_802F2830;
extern float lbl_802F2834;
extern float lbl_802F2838;
extern float lbl_802F283C;

void init_cache_ptrs(void)
{
    lbl_802F1B60->unk198 = 0.0f;
    lbl_802F1B60->unk19C = lbl_802F2834;
    lbl_802F1B60->unk1A0 = lbl_802F2838;
    lbl_802F1B60->unk1A4 = lbl_802F283C;
    lbl_802F1B60->unk1A8 = -1;
    lbl_802F1B60->unk1AC = 0;
    
}
