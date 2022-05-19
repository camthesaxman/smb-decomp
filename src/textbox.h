#ifndef _SRC_TEXTBOX_H_
#define _SRC_TEXTBOX_H_

enum
{
    TEXTBOX_STYLE_TOP_LEFT     = 1,  // left-pointing arrow on top
    TEXTBOX_STYLE_CENTER_LEFT  = 2,  // left-pointing arrow in middle
    TEXTBOX_STYLE_BOTTOM_LEFT  = 3,  // left-pointing arrow on bottom

    TEXTBOX_STYLE_TOP_RIGHT    = 4,  // right-pointing arrow on top
    TEXTBOX_STYLE_CENTER_RIGHT = 5,  // right-pointing arrow in middle
    TEXTBOX_STYLE_BOTTOM_RIGHT = 6,  // right-pointing arrow on bottom

    TEXTBOX_STYLE_LEFT_UP      = 7,  // up-pointing arrow on left
    TEXTBOX_STYLE_CENTER_UP    = 8,  // up-pointing arrow in middle
    TEXTBOX_STYLE_RIGHT_UP     = 9,  // up-pointing arrow on right

    TEXTBOX_STYLE_LEFT_DOWN    = 10,  // down-pointing arrow on right
    TEXTBOX_STYLE_CENTER_DOWN  = 11,  // down-pointing arrow in middle
    TEXTBOX_STYLE_RIGHT_DOWN   = 12,  // down-pointing arrow on right

    TEXTBOX_STYLE_SPIKY        = 13,  // spiky with a down-pointing arrow in middle
};

struct TextBox
{
    /*0x00*/ s32 state;
    s32 unk4;
    u32 unk8;
    /*0x0C*/ s16 x;
    /*0x0E*/ s16 y;
    float unk10;
    s8 unk14;
    /*0x15*/ s8 numLines;
    /*0x16*/ s8 style;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 filler1A[2];
    /*0x1C*/ void (*callback)(struct TextBox *);
    /*0x20*/ s32 id;
    /*0x24*/ s32 bgColor;
};  // size = 0x28

extern struct TextBox textBoxes[4];

void func_80073E44(void);
void textbox_main(void);
void func_80074480(void);
void textbox_draw_all(void);
void g_create_textbox(int, int, struct TextBox *);
void g_set_textbox_text(int a, const char *b);

#endif
