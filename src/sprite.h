#ifndef _SRC_SPRITE_H_
#define _SRC_SPRITE_H_

#include <dolphin/types.h>

enum FontID
{
    FONT_ASCII,  // 0x00
    FONT_ASC_8x16,
    FONT_ASC_12x12,
    FONT_DMY00,
    FONT_DMY01,
    FONT_DMY02,
    FONT_DMY03,
    FONT_DMY04,
    FONT_DMY05,
    FONT_ASC_72x64,
    FONT_DMY06,
    FONT_DMY07,
    FONT_DMY08,
    FONT_DMY09,
    FONT_DMY10,
    FONT_DMY11,
    FONT_DMY12,  // 0x10
    FONT_DMY13,
    FONT_DMY14,
    FONT_DMY15,
    FONT_DMY16,
    FONT_ICON_SD,  // for drawing rounded text boxes
    FONT_ICON_SD2,  // for drawing spiky text boxes
    FONT_DMY20,
    FONT_DMY21,
    FONT_DMY22,
    FONT_DMY23,
    FONT_NUM_26x31,
    FONT_ASC_30x31,
    FONT_ICON_TPL,
    FONT_ICON_MDE,
    FONT_ICON_RNK,
    FONT_RNK_32x32,  // 0x20
    FONT_RNK_NUM,
    FONT_MINI_RNK,
    FONT_SCORE_NUM,
    FONT_DMY_RNK0,
    FONT_DMY_RNK1,
    FONT_DMY_RNK2,
    FONT_DMY_RNK3,
    FONT_DMY_RNK4,
    FONT_DMY_RNK5,
    FONT_DMY_RNK6,
    FONT_DMY_RNK7,
    FONT_DMY_RNK8,
    FONT_DMY_RNK9,
    FONT_DMY_RNKa,
    FONT_DMY_RNKb,
    FONT_DMY_RNKc,  // 0x30
    FONT_DMY_RNKd,
    FONT_DMY_RNKe,
    FONT_DMY_RNKf,
    FONT_NUM_7x10,
    FONT_NUM_8x10,
    FONT_NUM_12x24,
    FONT_ICON_CRS,
    FONT_DMY40,
    FONT_DMY41,
    FONT_DMY42,
    FONT_DMY43,
    FONT_BWL_SCORE,
    FONT_DMY50,
    FONT_DMY51,
    FONT_DMY52,
    FONT_DMY53,  // 0x40
    FONT_DMY54,
    FONT_DMY55,
    FONT_DMY56,
    FONT_DMY57,
    FONT_RAC_ASC16x16,
    FONT_RAC_PLAYER,
    FONT_RAC_RANK,
    FONT_RAC_RAP_MARK_NUM,
    FONT_RAC_RAP_NUM,
    FONT_RAC_TIME_NUM,
    FONT_RAC_RAP_MARK_NUM_S,
    FONT_RAC_TIME_NUM_S,
    FONT_DMY60,
    FONT_DMY61,
    FONT_DMY62,
    FONT_DMY63,  // 0x50
    FONT_DMY64,
    FONT_TGT_PLAYER,
    FONT_TGT_MSCORE,
    FONT_TGT_SPEED,
    FONT_TGT_SCORE,
    FONT_TGT_ROUND,
    FONT_TGT_ALT,
    FONT_TGT_WIND,
    FONT_TGT_RESULT,
    FONT_DMY72,
    FONT_DMY73,
    FONT_DMY74,
    FONT_ICON_LV,
    FONT_NUM_22x22,
    FONT_ASC_16x16,
    FONT_ASC_16x16P,  // 0x60
    FONT_ASC_18x16,
    FONT_ASC_20x20,
    FONT_ASC_20x20P,
    FONT_ASC_32x32,
    FONT_NUM_12x19,
    FONT_NUM_24x37,
    FONT_DMY79,
    FONT_DMY7a,
    FONT_DMY7b,
    FONT_DMY7c,
    FONT_DMY7d,
    FONT_DMY7e,
    FONT_DMY7f,
    FONT_DMY80,
    FONT_DMY81,
    FONT_DMY82,  // 0x70
    FONT_DMY83,
    FONT_DMY84,
    FONT_DMY85,
    FONT_DMY86,
    FONT_DMY87,
    FONT_DMY88,
    FONT_DMY89,
    FONT_DMY8a,
    FONT_DMY8b,
    FONT_DMY8c,
    FONT_DMY8d,
    FONT_DMY8e,
    FONT_DMY8f,
    FONT_DMY90,
    FONT_DMY91,
    FONT_DMY92,  // 0x80
    FONT_DMY93,
    FONT_DMY94,
    FONT_DMY95,
    FONT_DMY96,
    FONT_DMY97,
    FONT_DMY98,
    FONT_DMY99,
    FONT_DMY9a,
    FONT_DMY9b,
    FONT_DMY9c,
    FONT_DMY9d,
    FONT_DMY9e,
    FONT_DMY9f,
    FONT_DMYa0,
    FONT_DMYa1,
    FONT_DMYa2,  // 0x90
    FONT_DMYa3,
    FONT_DMYa4,
    FONT_DMYa5,
    FONT_DMYa6,
    FONT_DMYa7,
    FONT_DMYa8,
    FONT_DMYa9,
    FONT_DMYaa,
    FONT_DMYab,
    FONT_DMYac,
    FONT_DMYad,
    FONT_DMYae,
    FONT_DMYaf,
    FONT_DMYb0,
    FONT_DMYb1,
    FONT_DMYb2,  // 0xA0
    FONT_DMYb3,
    FONT_DMYb4,
    FONT_DMYb5,
    FONT_DMYb6,
    FONT_DMYb7,
    FONT_DMYb8,
    FONT_DMYb9,
    FONT_DMYba,
    FONT_DMYbb,
    FONT_DMYbc,
    FONT_DMYbd,
    FONT_DMYbe,
    FONT_DMYbf,
    FONT_JAP_TAG,  // These "Japanese" fonts contain both ASCII and Japanese characters
    FONT_JAP_DMY,
    FONT_JAP_24x24_2,  // 0xB0
    FONT_JAP_24x24_2P,
    FONT_JAP_24x24_I,
    FONT_JAP_24x24_2Pg,
};

struct FontParams
{
    /*0x00*/ s16 bmpId;
    /*0x02*/ u8 spaceWidth;
    /*0x03*/ u8 lineHeight;
    /*0x04*/ s32 firstChar;
    /*0x08*/ s32 lastChar;
    /*0x0C*/ s8 unkC;
    /*0x0D*/ s8 unkD;
    /*0x10*/ float unk10;
    /*0x14*/ float unk14;
    /*0x18*/ float unk18;
    /*0x1C*/ float unk1C;
    /*0x20*/ s8 unk20;
    /*0x21*/ s8 unk21;
    /*0x22*/ s8 unk22;
    /*0x23*/ s8 unk23;
};

enum
{
    SPRITE_TYPE_TEXT, 
    SPRITE_TYPE_BITMAP,
    SPRITE_TYPE_TILED_BITMAP,
};

enum
{
    SPRITE_FLAG_HFLIP = (1 << 19),  // 0x80000
    SPRITE_FLAG_VFLIP = (1 << 20),  // 0x100000
};

enum
{
    SPRITE_TAG_LOGO_PLUS = 3,
    SPRITE_TAG_PAUSE_MENU = 4,
    SPRITE_TAG_EIEIPU = 11,
    SPRITE_TAG_FINAL_FLOOR_BANNER = 14,  // also used for bonus stage banner?
    SPRITE_TAG_FLOOR_NAME_BANNER = 15,
    SPRITE_TAG_ADV_DEMO_BANANA_1 = 30,
    SPRITE_TAG_ADV_DEMO_BANANA_2 = 31,
    SPRITE_TAG_ADV_DEMO_BANANA_3 = 32,
};

struct Sprite
{
    /*0x00*/ s8 type;
    /*0x01*/ u8 fontId;
             s8 unk2;
    /*0x03*/ s8 textAlign;
    /*0x04*/ float x;  // position of sprite (0-640) from left edge of screen
    /*0x08*/ float y;  // position of sprite (0-480) from top edge of screen
    /*0x0C*/ u8 mulR;
    /*0x0D*/ u8 mulG;
    /*0x0E*/ u8 mulB;
    /*0x0F*/ s8 tag;
    /*0x10*/ s16 counter;  // general purpose frame counter
             u8 filler12[0x30-0x12];
    /*0x30*/ void (*destFunc)(struct Sprite *);  // callback which runs when the sprite is destroyed
    /*0x34*/ void (*mainFunc)(s8 *, struct Sprite *);  // callback which runs once per frame
             void (*drawFunc)(struct Sprite *);  // callback to override the default drawing of a sprite
    /*0x3C*/ u16 bmpId;
             u8 filler3E[0x40-0x3E];
    /*0x40*/ float scaleX;
    /*0x44*/ float scaleY;
    /*0x48*/ s32 userVar;  // multi-purpose variable for use by callbacks
             float unk4C;
             struct Sprite *unk50;
    /*0x54*/ struct Sprite *next;
             // actual bounds of the sprite (computed from alignment and other info)
    /*0x58*/ s32 left;
    /*0x5C*/ s32 top;
    /*0x60*/ s32 right;
    /*0x64*/ s32 bottom;
             s16 rotation;  // counterclockwise rotation in units of 1/65536 turn
             u8 filler6A[2];
    /*0x6C*/ float opacity;
    /*0x70*/ u8 addR;
    /*0x71*/ u8 addG;
    /*0x72*/ u8 addB;
             u8 filler73[1];
    /*0x74*/ u32 flags;
             u32 unk78;
             float unk7C;
             float unk80;
             float unk84;
             float unk88;
    /*0x8C*/ char text[48];
};  // size = 0xBC

struct ScreenFadeInfo
{
    s32 type;
    u32 color;
    s32 timer;
    s32 timerMax;
};

extern struct Sprite spriteInfo[64];
extern struct ScreenFadeInfo screenFadeInfo;
extern struct FontParams fontInfo[];

void ev_sprite_init(void);
void ev_sprite_main(void);
void ev_sprite_dest(void);
void func_800700D8(int a);
void func_800702C8(struct Sprite *sprite);
void g_something_with_sprites(struct Sprite *a);
void call_bitmap_load_group(int a);
void call_bitmap_free_group(int a);
void free_all_bitmap_groups_except_com(void);
struct Sprite *create_sprite(void);
struct Sprite *create_linked_sprite(struct Sprite *a);
void destroy_sprite_with_tag(int a);
void destroy_all_sprites(void);
struct Sprite *find_sprite_with_tag(int a);
void calc_sprite_bounds(struct Sprite *, s32 *, s32 *, s32 *, s32 *);
int get_char_width(char *a, int b, struct FontParams *c);
float g_get_char_ratio(char *a, int b);
// ? parse_char_sequence();
void reset_text_draw_settings(void);
void set_text_font(int fontId);
void set_text_mul_color(u32 color);
void set_text_add_color(u32 color);
void func_80071B1C(float);
void set_text_scale(float scaleX, float scaleY);
void set_text_opacity(float opacity);
void func_80071B50();
void set_text_pos(float x, float y);
void g_draw_char(char chr);
void g_draw_text(char *str);
float g_get_text_width(char *str);
void func_80072AC0(char *str, ...);
void g_draw_text_sprite(struct Sprite *a);
void draw_bitmap_sprite(struct Sprite *a);
// ? func_80072DA8();
float g_get_ascii_text_width(char *str);
int g_get_jpn_text_width(int fontId, char *str);
void g_draw_screen_fade_mask(void);

#define FADE_IN   0  // fades in from specified color
#define FADE_OUT  1  // fades out to specified color
#define FADE_UNK2 2 
#define FADE_ABOVE_SPRITES (1 << 8)  // fades everything on screen
void start_screen_fade(s32, u32, int);

// ? add_naomi_sprite();
int draw_naomi_sprite(struct NaomiSpriteParams *);
// ? func_80073E00();

#endif
