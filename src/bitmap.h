enum BitmapGroupID
{
    BMP_COM,
    BMP_ADV,
    BMP_END,
    BMP_RNK,
    BMP_SEL,
    BMP_NML,
    BMP_BWL,
    BMP_RAC,
    BMP_BIL,
    BMP_FGT,
    BMP_GLF,
    BMP_TGT,
    BMP_HOW,
    BMP_CMD,
    BMP_ALL,
};

enum Alignment
{
    ALIGN_LT,
    ALIGN_LC,
    ALIGN_LB,
    ALIGN_CT,
    ALIGN_CC,
    ALIGN_CB,
    ALIGN_RT,
    ALIGN_RC,
    ALIGN_RB,
    ALIGN_PIC,
};

struct Bitmap
{
    /*0x00*/ float x;
    /*0x04*/ float y;
    /*0x08*/ float unk8;
    /*0x0C*/ float unkC;
    /*0x10*/ s16 imageId;
    /*0x12*/ s16 rotation;
    /*0x14*/ u8 unk14;
    /*0x15*/ u8 r;
    /*0x16*/ u8 g;
    /*0x17*/ u8 b;
    /*0x18*/ u8 a;
};

struct BitmapGroup
{
    /*0x00*/ int isLoaded;
    /*0x04*/ char *filename;
    /*0x08*/ char *name;
    /*0x0C*/ u32 unkC;
    /*0x10*/ struct TPL *tpl;
    /*0x14*/ OSHeapHandle heap;
};

extern s32 g_bmpUnkCountOfSomething;
extern s32 lbl_802F1D04;
extern struct TPL *g_unkBitmapTPL;

extern struct BitmapGroup bitmapGroups[];
extern char **bitmapNames[];

void bitmap_init(void);
struct TPL *bitmap_load_tpl(char *filename);
void bitmap_load_group(enum BitmapGroupID grpId);
void bitmap_free_group(enum BitmapGroupID grpId);
int bitmap_is_group_loaded(enum BitmapGroupID grpId);
void bitmap_free_tpl(struct TPL *tpl);
void func_80026378(int a);
void func_80026394(void);
void func_800263A4(void);
void bitmap_main(void);
// ? func_8002687C();
// ? bitmap_draw();
// ? bitmap_draw_normal_char();
// ? bitmap_draw_char();
void bitmap_draw_string(void);
void func_8002704C(void);
