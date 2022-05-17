#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "mathutil.h"
#include "sprite.h"
#include "textbox.h"

struct TextBoxLine
{
    s8 unk0;
    char text[0x81];
    s16 unk82;
};

struct TextBoxLine textBoxLines[4][20];
FORCE_BSS_ORDER(textBoxLines)

struct TextBox lbl_80292AC0[4];
FORCE_BSS_ORDER(lbl_80292AC0)

struct TextBox textBoxes[4];
FORCE_BSS_ORDER(textBoxes)

static void func_80073F74(int id, struct TextBox *b);
static void clear_lines(int a);

void func_80073E44(void)
{
    int i;
    struct TextBox *r29;
    struct TextBox *r28;

    r29 = textBoxes;
    r28 = lbl_80292AC0;
    for (i = 0; i < 4; i++, r29++, r28++)
    {
        memset(r29, 0, sizeof(*r29));
        memset(r28, 0, sizeof(*r28));
        r29->state = 0;
        r29->unk8 = 0;
        r29->callback = NULL;
        clear_lines(i);
    }
    lbl_802F200C = -1.0f;
    lbl_802F2008 = 0.0f;
}

void textbox_main(void)
{
    int i;
    struct TextBox *tbox;

    tbox = textBoxes;
    for (i = 0; i < 4; i++, tbox++)
    {
        if (tbox->state != 0)
        {
            if (tbox->callback != NULL)
                tbox->callback(tbox);
            func_80073F74(i, tbox);
        }
    }
}

static void func_80073F74(int id, struct TextBox *tbox)
{
    s32 i;
    struct TextBoxLine *line;
    s8 r27;
    int j;
    float f30;

    switch (tbox->state)
    {
    case 1:
        tbox->unk8++;
        if (tbox->unk8 == tbox->unk4)
        {
            tbox->state = 10;
            tbox->unk8 = 0;
            if (lbl_80292AC0[id].state == 20)
            {
                tbox->state = 20;
                lbl_80292AC0[id].state = 0;
            }
        }
        if (tbox->unk14 == 0)
        {
            f30 = 0.0f;
            r27 = 0;
            line = textBoxLines[id];
            for (i = 0; i < 20; i++, line++)
            {
                if (line->unk0 == 0)
                    break;
                if (tbox->numLines == 1)
                {
                    r27 = get_ascii_text_width(line->text);
                    f30 = get_jpn_text_width(FONT_JAP_24x24_2P, line->text);
                }
                else
                {
                    float f0;
                    if (r27 < get_ascii_text_width(line->text))
                        r27 = get_ascii_text_width(line->text);
                    f0 = get_jpn_text_width(FONT_JAP_24x24_2P, line->text);
                    if (f30 < f0)
                        f30 = f0;
                }
            }
            tbox->unk14 = r27;
            tbox->unk10 = f30;
        }
        break;
    case 3:
        tbox->state = 1;
        tbox->unk8 = 0;
        break;
    case 10:
        tbox->unk8++;
        line = textBoxLines[id];
        j = 0;
        for (i = 0; i < 20; i++, line++)
        {
            if (line->unk0 != 0)
                j++;
        }
        if (j > tbox->numLines)
        {
            tbox->state = 11;
            tbox->unk8 = 0;
        }
        break;
    case 11:
        tbox->unk8++;
        if (tbox->unk8 == 16)
        {
            s32 i;
            tbox->state = 10;
            line = textBoxLines[id];
            for (i = 0; i < 19; i++, line++)
                memcpy(line, line + 1, sizeof(*line));
            line->unk0 = 0;
            line->unk82 = 0;
        }
        break;
    case 20:
        tbox->unk8++;
        if (tbox->unk8 == tbox->unk4)
        {
            tbox->state = 0;
            tbox->unk8 = 0;
            tbox->callback = NULL;
            clear_lines(id);
        }
        break;
    case 21:
        tbox->unk8++;
        if (tbox->unk8 == tbox->unk4)
        {
            s32 i;

            for (i = 0; i < tbox->numLines; i++)
            {
                line = textBoxLines[id];
                for (j = 0; j < 19; j++, line++)
                    memcpy(line, line + 1, sizeof(*line));
                line->unk0 = 0;
                line->unk82 = 0;
            }
            memcpy(tbox, &lbl_80292AC0[id], sizeof(*tbox));
            tbox->state = 1;
            tbox->unk8 = 0;
            lbl_80292AC0[id].state = 0;
        }
        break;
    case 22:
        tbox->unk8++;
        if (tbox->unk8 == tbox->unk4)
        {
            tbox->state = 2;
            tbox->unk8 = 0;
            clear_lines(id);
        }
        break;
    }

    line = textBoxLines[id];
    for (i = 0; i < 20; i++, line++)
    {
        if (tbox->state >= 10
         && line->unk0 != 0
         && line->unk0 == 2
         && (tbox->state == 10 || tbox->state == 11))
        {
            if (i < tbox->numLines
             && (i == 0 || textBoxLines[id][i - 1].unk0 != 2))
                line->unk82 += 2;
            if (line->unk82 >= get_ascii_text_width(line->text))
                line->unk0 = 1;
        }
    }
}

void func_80074480(void)
{
    int i;
    struct TextBox *tbox;

    for (tbox = textBoxes, i = 0; i < 4; i++, tbox++)
        tbox->state = 0;
}

static void draw_textbox(int a, struct TextBox *b);

void textbox_draw_all(void)
{
    int i;
    struct TextBox *tbox;

    for (tbox = textBoxes, i = 0; i < 4; i++, tbox++)
    {
        if (tbox->state != 0)
            draw_textbox(i, tbox);
    }
}

static void func_80075498(struct TextBox *a, int *b, int *c);

static void draw_textbox(int a, struct TextBox *tbox)
{
    int sp24;
    int sp20;
    int sp1C;
    int sp18;
    float f29;
    float f30;
    float f23;
    float numLines;  // why is this a float?
    float f27;

    struct TextBoxLine *line;
    int i;
    int j;

    float f26;
    float f25;

    float f3;
    float f1;
    float f0;

    if (tbox->state == 0 || tbox->state == 2 || tbox->state == 3)
        return;
    if (tbox->unk14 == 0)
        return;

    func_80071A8C();
    g_set_font(tbox->style == TEXTBOX_STYLE_SPIKY ? FONT_ICON_SD2 : FONT_ICON_SD);
    func_80071B1C(a * 0.01f + 0.059999999776482585);
    g_set_text_fill_color(tbox->bgColor);
    f3 = (float)tbox->unk8 / (float)tbox->unk4;
    if (tbox->state == 1)
    {
        f29 = (f3 < 0.5) ? f3 * 2.0f : 1.0;
        f30 = (f3 < 0.5) ? 0.1 : (f3 - 0.5) * 1.8 + 0.1;
        f23 = (f3 < 0.5) ? f3 * 2.0f : 1.0;
    }
    else if (tbox->state >= 20 && f3 > 0.5)
    {
        f3 = (f3 - 0.5) * 2.0;
        f29 = (f3 < 0.5) ? 1.0 : f3 * 2.0f;
        f30 = (f3 < 0.5) ? (1.0 - f3) * 1.8 + 0.1 : 0.1;
        f23 = 1.0 - f3;
    }
    else
    {
        f29 = 1.0f;
        f30 = 1.0f;
        f23 = 1.0f;
    }
    func_80071B2C(f29, f30);
    func_80071B40(f23);
    func_80075498(tbox, &sp24, &sp20);
    sp24 += 0.5 * ((1.0 - f29) * (48.0f + tbox->unk10));
    sp20 += 0.5 * (24.0 * ((1.0 - f30) * tbox->numLines));
    if (tbox->style == 15)
    {
        sp24 += 12;
        sp20 += 12;
    }
    
    // draw frame
    numLines = tbox->numLines;
    f27 = tbox->unk14;
    g_set_text_pos(sp24 - 24, sp20 - 24);
    for (i = -1; i <= numLines; i++)
    {
        for (j = -1; j <= f27; j++)
        {
            f26 = f29;
            f25 = f30;
            if (tbox->style == 15 && (i == -1 || (float)i == numLines))
                f25 *= 0.5;
            if (tbox->style == 15 && (j == -1 || (float)j == f27))
                f26 *= 0.5;
            func_80071B2C(f26, f25);
            if (j == -1)
            {
                if (i == -1)
                    g_draw_text("\x01");
                else if ((float)i == numLines)
                    g_draw_text("\x0B");
                else
                    g_draw_text("\x06");
            }
            else if ((float)j == f27)
            {
                if (i == -1)
                    g_draw_text("\x03");
                else if ((float)i == numLines)
                    g_draw_text("\x0D");
                else
                    g_draw_text("\x08");

            }
            else if (tbox->style == TEXTBOX_STYLE_SPIKY && (i == -1 || (float)i == numLines))
            {
                float f1 = mathutil_floor(tbox->unk10 / 24.0f);
                if (j < f1)
                {
                    func_80071B2C((tbox->unk10 / f1 / 24.0f) * f26, f25);
                    if (i == -1)
                        g_draw_text("\x02");
                    else if ((float)i == numLines)
                        g_draw_text("\x0C");
                    else
                        g_draw_text("\x07");
                    func_80071B2C(f26, f25);
                }
            }
            else if (j == 0)
            {
                func_80071B2C(f26 * tbox->unk10 / 24.0f, f25);
                if (i == -1)
                    g_draw_text("\x02");
                else if ((float)i == numLines)
                    g_draw_text("\x0C");
                else
                    g_draw_text("\x07");
                func_80071B2C(f26, f25);
            }
        }
        g_draw_text("\n");
    }

    func_80071B1C(a * 0.01f + 0.05);
    if (tbox->state >= 20)
        f1 = 1.0f - tbox->unk8 / 15.0f;
    else if (tbox->state == 10)
        f1 = tbox->unk8 / 15.0f;
    else
        f1 = 0.0f;
    f0 = CLAMP(f1, 0.0f, 1.0f);
    func_80071B40(f0);
    
    // draw arrow
    switch (tbox->style)
    {
        float zero;
    case TEXTBOX_STYLE_TOP_LEFT:
        g_set_text_pos(sp24 - 24, sp20);
        g_draw_text("\x04");  // left arrow
        break;
    case TEXTBOX_STYLE_CENTER_LEFT:
        g_set_text_pos(sp24 - 24, sp20 + ((tbox->numLines - 1) * 24) * 0.5f);
        g_draw_text("\x04");  // left arrow
        break;
    case TEXTBOX_STYLE_BOTTOM_LEFT:
        g_set_text_pos(sp24 - 24, sp20 + (tbox->numLines - 1) * 24);
        g_draw_text("\x04");  // left arrow
        break;
    case TEXTBOX_STYLE_TOP_RIGHT:
        g_set_text_pos(sp24 + tbox->unk10, sp20);
        g_draw_text("\x05");  // right arrow
        break;
    case TEXTBOX_STYLE_CENTER_RIGHT:
        g_set_text_pos(sp24 + tbox->unk10, sp20 + ((tbox->numLines - 1) * 24) * 0.5f);
        g_draw_text("\x05");  // right arrow
        break;
    case TEXTBOX_STYLE_BOTTOM_RIGHT:
        g_set_text_pos(sp24 + tbox->unk10, sp20 + (tbox->numLines - 1) * 24);
        g_draw_text("\x05");  // right arrow
        break;
    case TEXTBOX_STYLE_LEFT_UP:
        zero = 0.0f;
        g_set_text_pos((sp24 + zero) + 14.0f, sp20 - 24);
        g_draw_text("\x10");  // up arrow
        break;
    case TEXTBOX_STYLE_CENTER_UP:
        g_set_text_pos(sp24 + tbox->unk10 * 0.5f - 10.0f, sp20 - 24);
        g_draw_text("\x10");  // up arrow
        break;
    case TEXTBOX_STYLE_RIGHT_UP:
        g_set_text_pos(sp24 + tbox->unk10 - 34.0f, sp20 - 24);
        g_draw_text("\x10");  // up arrow
        break;
    case TEXTBOX_STYLE_LEFT_DOWN:
        zero = 0.0f;
        g_set_text_pos((sp24 + zero) + 14.0f, sp20 + (tbox->numLines * 24));
        g_draw_text("\x15");  // down arrow
        break;
    case TEXTBOX_STYLE_CENTER_DOWN:
    case TEXTBOX_STYLE_SPIKY:
        g_set_text_pos(sp24 + tbox->unk10 * 0.5f - 10.0f, sp20 + (tbox->numLines * 24));
        g_draw_text("\x15");  // down arrow
        break;
    case TEXTBOX_STYLE_RIGHT_DOWN:
        g_set_text_pos(sp24 + tbox->unk10 - 34.0f, sp20 + (tbox->numLines * 24));
        g_draw_text("\x15");  // down arrow
        break;
    }
    func_80071B2C(f29, f30);
    if (tbox->state < 10)
    {
        func_80071A8C();
        return;
    }
    func_80071B50(0x220000);
    g_set_font(FONT_JAP_24x24_2P);
    func_80071B1C(a * 0.01f + 0.05);
    g_set_text_fill_color(0);
    if (tbox->state == 11)
        j = tbox->unk8 * -1.5;
    else
        j = 0;
    if (tbox->state >= 20)
    {
        float temp_f1_2 = tbox->unk4 * 0.5;
        f25 = (tbox->unk8 < temp_f1_2) ? 1.0f - tbox->unk8 * (1.0f / temp_f1_2) : 0.0;
    }
    else
        f25 = 1.0f;
    
    // draw text
    line = textBoxLines[a];
    for (i = 0; i < 20; i++, line++)
    {
        if (line->unk0 == 0)
            break;
        lbl_802F200C = line->unk82;
        lbl_802F2008 = get_ascii_text_width(line->text);
        if (tbox->state == 11)
        {
            if (i == 0)
                f25 = tbox->unk8 < 8 ? 1.0 - tbox->unk8 * 0.14 : 0.0;
            else
                f25 = 1.0f;
        }
        func_80071B40(f25);
        if (tbox->unk10 > 0.0)
        {
            float f0 = MIN(tbox->unk10 / get_jpn_text_width(FONT_JAP_24x24_2P, line->text), 1.0);
            func_80071B2C(f0, 1.0f);
        }
        else
            func_80071B2C(1.0f, 1.0f);
        func_80075498(tbox, &sp1C, &sp18);
        g_set_text_pos(sp1C, sp18 + i * 24 + j);
        g_draw_text(line->text);
    }
    lbl_802F200C = -1.0f;
    func_80071A8C();
}

void clear_lines(int id)
{
    int i;
    struct TextBoxLine *line = textBoxLines[id];

    for (i = 0; i < 20; i++, line++)
    {
        line->unk0 = 0;
        line->unk82 = 0;
        strcpy(line->text, "");
    }
}

static void func_80075498(struct TextBox *tbox, int *x, int *y)
{
    float f4 = tbox->unk10;
    float f1 = (tbox->numLines - 1) * 24.0f;

    switch (tbox->style)
    {
    default:
        *x = tbox->x - f4 * 0.5f;
        *y = tbox->y - tbox->numLines * 12.0f;
        break;
    case TEXTBOX_STYLE_TOP_LEFT:
        *x = tbox->x + 18;
        *y = tbox->y - 12;
        break;
    case TEXTBOX_STYLE_CENTER_LEFT:
        *x = tbox->x + 18;
        *y = tbox->y - 12 - f1 * 0.5;
        break;
    case TEXTBOX_STYLE_BOTTOM_LEFT:
        *x = tbox->x + 18;
        *y = tbox->y - 12 - f1;
        break;
    case TEXTBOX_STYLE_TOP_RIGHT:
        *x = tbox->x - f4 - 18.0f;
        *y = tbox->y - 12;
        break;
    case TEXTBOX_STYLE_CENTER_RIGHT:
        *x = tbox->x - f4 - 18.0f;
        *y = tbox->y - 12 - f1 * 0.5f;
        break;
    case TEXTBOX_STYLE_BOTTOM_RIGHT:
        *x = tbox->x - f4 - 18.0f;
        *y = tbox->y - 12 - f1;
        break;
    case TEXTBOX_STYLE_LEFT_UP:
        *x = tbox->x - 24;
        *y = tbox->y + 18;
        break;
    case TEXTBOX_STYLE_CENTER_UP:
        *x = tbox->x - f4 * 0.5;
        *y = tbox->y + 18;
        break;
    case TEXTBOX_STYLE_RIGHT_UP:
        *x = tbox->x - f4 + 24.0f;
        *y = tbox->y + 18;
        break;
    case TEXTBOX_STYLE_LEFT_DOWN:
        *x = tbox->x - 24;
        *y = tbox->y - 42 - f1;
        break;
    case TEXTBOX_STYLE_CENTER_DOWN:
    case TEXTBOX_STYLE_SPIKY:
        *x = tbox->x - f4 * 0.5;
        *y = tbox->y - 42 - f1;
        break;
    case TEXTBOX_STYLE_RIGHT_DOWN:
        *x = tbox->x - f4 + 24.0f;
        *y = tbox->y - 42 - f1;
        break;
    }
}

void g_create_textbox(int id, int b, struct TextBox *template)
{
    int bgColor;
    int style;
    int x;
    int y;
    struct TextBox *tbox = &textBoxes[id];

    if (b == 20 && tbox->state >= 20)
    {
        tbox->state = 20;
        return;
    }
    if (b == 20 && tbox->state != 1 && tbox->state < 10)
        return;
    if (template == NULL)
        template = tbox;

    tbox->unk4 = 30;
    tbox->unk8 = 0;
    style = (template->style == 0) ? tbox->style : template->style;
    x = (template->x == 0) ? tbox->x : template->x;
    y = (template->y == 0) ? tbox->y : template->y;
    bgColor = (template->bgColor == 0) ? RGBA(255, 255, 255, 0) : template->bgColor;
    if (b == 1 || b == 2)
    {
        clear_lines(id);
        tbox->id = id;
        tbox->state = b;
        tbox->x = x;
        tbox->y = y;
        tbox->unk14 = template->unk14;
        tbox->unk10 = tbox->unk14 * 24;
        tbox->numLines = template->numLines;
        tbox->style = template->style;
        tbox->bgColor = bgColor;
        tbox->unk17 = template->unk17;
        tbox->unk18 = template->unk18;
        tbox->unk19 = template->unk19;
        tbox->callback = template->callback;
        return;
    }

    if (b == 21)
    {
        if (tbox->state < 10)
        {
            tbox->state = 3;
            tbox->x = x;
            tbox->y = y;
            tbox->unk14 = template->unk14;
            tbox->unk10 = tbox->unk14 * 24;
            tbox->numLines = template->numLines;
            tbox->style = style;
            tbox->bgColor = bgColor;
            return;
        }
        tbox->state = b;
        memcpy(&lbl_80292AC0[id], tbox, sizeof(lbl_80292AC0[id]));
        lbl_80292AC0[id].x = x;
        lbl_80292AC0[id].y = y;
        lbl_80292AC0[id].unk14 = template->unk14;
        lbl_80292AC0[id].numLines = template->numLines;
        lbl_80292AC0[id].style = style;
        lbl_80292AC0[id].bgColor = bgColor;
        return;
    }

    tbox->state = b;
}

void add_textbox_line(int id, const char *str)
{
    int i;
    struct TextBoxLine *line;
    struct TextBox *tbox;

    tbox = &textBoxes[id];
    line = textBoxLines[id];
    for (i = 0; i < 20; i++, line++)
    {
        if (line->unk0 == 0)
        {
            line->unk0 = 2;
            strcpy(line->text, str);
            line->unk82 = 0;
            if (i == tbox->numLines && tbox->state == 10)
            {
                tbox->state = 11;
                tbox->unk8 = 0;
            }
            break;
        }
    }
}

void g_set_textbox_text(int id, const char *str)
{
    char buffer[0x200];
    int length = 0;
    int newLines = 0;
    
    while (*str != 0)
    {
        if (*str == '\n')
        {
            buffer[length] = 0;
            add_textbox_line(id, buffer);
            length = 0;
            newLines++;
        }
        else
        {
            buffer[length] = *str;
            length++;
        }
        str++;
    }
    buffer[length] = 0;
    add_textbox_line(id, buffer);
    if (newLines + 1 > lbl_80292AC0[id].numLines)
        lbl_80292AC0[id].numLines = newLines + 1;
}

void g_set_textbox_textf(int id, const char *fmt, ...)
{
    va_list args;
    char buffer[0x200];

    va_start(args, fmt);
    vsprintf(buffer, fmt, args);
    va_end(args);
    g_set_textbox_text(id, buffer);
}
