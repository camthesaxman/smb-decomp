struct Struct801F3A58
{
    u32 unk0;
    s16 timerCurr;  // current clock time (in 60ths of a second)
    s16 timerMax;  // maximum clock time (in 60ths of a second)
    u32 unk8;
    s16 unkC;
    s16 unkE;
    Vec unk10;
    s16 unk1C;
    s16 unk1E;
    s16 unk20;
    s16 unk22;
    s32 unk24;
    s16 unk28;
    s16 unk2A;
    s16 unk2C;
    s16 unk2E;
    s16 unk30;
    u8 filler32[2];
};

extern struct Struct801F3A58 lbl_801F3A58;
// extern ? lbl_801F3A8C;
// extern ? lbl_801F3A9C;

// ? func_80022F14();
void ev_info_init(void);
void ev_info_main(void);
void ev_info_dest(void);
void func_80023AF4(void);
int func_80023B9C(struct Ball *, u32 *, s32 *);
void func_80023CF4(void);
void func_80023DB8(struct Ball *);
void func_800244E8(struct Ball *);
void func_800245E4(struct Ball *, int, int);
int func_800246F4(struct Ball *);
void func_80024860(struct Ball *);
