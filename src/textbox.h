#ifndef _SRC_TEXTBOX_H_
#define _SRC_TEXTBOX_H_

struct TextBox
{
    s32 unk0;
    s32 unk4;
    u32 unk8;
    s16 unkC;
    s16 unkE;
    float unk10;
    s8 unk14;
    s8 numLines;
    s8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 filler1A[2];
    void (*unk1C)(struct TextBox *);
    s32 unk20;
    s32 unk24;
};  // size = 0x28

extern struct TextBox textBoxes[4];

void func_80073E44(void);
void textbox_main(void);
// ? func_80073F74();
void func_80074480(void);
void textbox_draw_all(void);
void draw_textbox(int a, struct TextBox *b);
void clear_lines(int a);
void func_80075498(struct TextBox *a, int *b, int *c);
void g_create_textbox(int, int, struct TextBox *);
// ? add_textbox_line();
void g_set_textbox_text(int a, const char *b);
// ? func_80075CD4();

#endif
