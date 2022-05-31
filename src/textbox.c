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

float lbl_802F200C;
float lbl_802F2008;

static void update_textbox(int id, struct TextBox *b);
static void clear_lines(int a);

void textbox_init(void)
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
        r29->timer = 0;
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
            update_textbox(i, tbox);
        }
    }
}

static void update_textbox(int id, struct TextBox *tbox)
{
    s32 i;
    struct TextBoxLine *line;
    s8 numColumns;
    int j;
    float f30;

    switch (tbox->state)
    {
    case 1:
        tbox->timer++;
        if (tbox->timer == tbox->timerMax)
        {
            tbox->state = 10;
            tbox->timer = 0;
            if (lbl_80292AC0[id].state == 20)
            {
                tbox->state = 20;
                lbl_80292AC0[id].state = 0;
            }
        }
        if (tbox->numColumns == 0)
        {
            f30 = 0.0f;
            numColumns = 0;
            line = textBoxLines[id];
            for (i = 0; i < 20; i++, line++)
            {
                if (line->unk0 == 0)
                    break;
                if (tbox->numRows == 1)
                {
                    numColumns = u_get_ascii_text_width(line->text);
                    f30 = u_get_jpn_text_width(FONT_JAP_24x24_2P, line->text);
                }
                else
                {
                    float f0;
                    if (numColumns < u_get_ascii_text_width(line->text))
                        numColumns = u_get_ascii_text_width(line->text);
                    f0 = u_get_jpn_text_width(FONT_JAP_24x24_2P, line->text);
                    if (f30 < f0)
                        f30 = f0;
                }
            }
            tbox->numColumns = numColumns;
            tbox->unk10 = f30;
        }
        break;
    case 3:
        tbox->state = 1;
        tbox->timer = 0;
        break;
    case 10:
        tbox->timer++;
        line = textBoxLines[id];
        j = 0;
        for (i = 0; i < 20; i++, line++)
        {
            if (line->unk0 != 0)
                j++;
        }
        if (j > tbox->numRows)
        {
            tbox->state = 11;
            tbox->timer = 0;
        }
        break;
    case 11:  // scrolling
        tbox->timer++;
        if (tbox->timer == 16)
        {
            s32 i;
            tbox->state = 10;
            // move lines up
            line = textBoxLines[id];
            for (i = 0; i < 19; i++, line++)
                memcpy(line, line + 1, sizeof(*line));
            line->unk0 = 0;
            line->unk82 = 0;
        }
        break;
    case 20:
        tbox->timer++;
        if (tbox->timer == tbox->timerMax)
        {
            tbox->state = 0;
            tbox->timer = 0;
            tbox->callback = NULL;
            clear_lines(id);
        }
        break;
    case 21:
        tbox->timer++;
        if (tbox->timer == tbox->timerMax)
        {
            s32 i;

            for (i = 0; i < tbox->numRows; i++)
            {
                line = textBoxLines[id];
                for (j = 0; j < 19; j++, line++)
                    memcpy(line, line + 1, sizeof(*line));
                line->unk0 = 0;
                line->unk82 = 0;
            }
            memcpy(tbox, &lbl_80292AC0[id], sizeof(*tbox));
            tbox->state = 1;
            tbox->timer = 0;
            lbl_80292AC0[id].state = 0;
        }
        break;
    case 22:
        tbox->timer++;
        if (tbox->timer == tbox->timerMax)
        {
            tbox->state = 2;
            tbox->timer = 0;
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
            if (i < tbox->numRows
             && (i == 0 || textBoxLines[id][i - 1].unk0 != 2))
                line->unk82 += 2;
            if (line->unk82 >= u_get_ascii_text_width(line->text))
                line->unk0 = 1;
        }
    }
}

void textbox_destroy_all(void)
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

static void calc_textbox_text_pos(struct TextBox *a, int *b, int *c);

static void draw_textbox(int a, struct TextBox *tbox)
{
    int sp24;
    int sp20;
    int textX;
    int textY;
    float f29;
    float f30;
    float f23;
    float numRows;  // why is this a float?
    float numColumns;  // why is this a float

    struct TextBoxLine *line;
    int row;
    int col;

    float f26;
    float f25;

    float f3;
    float f1;
    float f0;
    int scrollOffset;
    float opacity;

    if (tbox->state == 0 || tbox->state == 2 || tbox->state == 3)
        return;
    if (tbox->numColumns == 0)
        return;

    reset_text_draw_settings();
    set_text_font(tbox->style == TEXTBOX_STYLE_SPIKY ? FONT_ICON_SD2 : FONT_ICON_SD);
    func_80071B1C(a * 0.01f + 0.059999999776482585);
    set_text_mul_color(tbox->bgColor);
    f3 = (float)tbox->timer / (float)tbox->timerMax;
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
    set_text_scale(f29, f30);
    set_text_opacity(f23);
    calc_textbox_text_pos(tbox, &sp24, &sp20);
    sp24 += 0.5 * ((1.0 - f29) * (48.0f + tbox->unk10));
    sp20 += 0.5 * (24.0 * ((1.0 - f30) * tbox->numRows));
    if (tbox->style == TEXTBOX_STYLE_THIN_BORDER)
    {
        sp24 += 12;
        sp20 += 12;
    }
    
    // draw frame
    numRows = tbox->numRows;
    numColumns = tbox->numColumns;
    set_text_pos(sp24 - 24, sp20 - 24);
    for (row = -1; row <= numRows; row++)
    {
        for (col = -1; col <= numColumns; col++)
        {
            f26 = f29;
            f25 = f30;
            if (tbox->style == TEXTBOX_STYLE_THIN_BORDER && (row == -1 || row == numRows))
                f25 *= 0.5;
            if (tbox->style == TEXTBOX_STYLE_THIN_BORDER && (col == -1 || col == numColumns))
                f26 *= 0.5;
            set_text_scale(f26, f25);

            if (col == -1)  // left border
            {
                if (row == -1)
                    u_draw_text("\x01");  // draw top left corner
                else if (row == numRows)
                    u_draw_text("\x0B");  // draw bottom left corner
                else
                    u_draw_text("\x06");  // draw left border
            }
            else if (col == numColumns)  // right border
            {
                if (row == -1)
                    u_draw_text("\x03");  // draw top right corner
                else if (row == numRows)
                    u_draw_text("\x0D");  // draw bottom right corner
                else
                    u_draw_text("\x08");  // draw right border

            }
            else if (tbox->style == TEXTBOX_STYLE_SPIKY
             && (row == -1 || row == numRows))
            {
                float f1 = mathutil_floor(tbox->unk10 / 24.0f);
                if (col < f1)
                {
                    set_text_scale((tbox->unk10 / f1 / 24.0f) * f26, f25);
                    if (row == -1)
                        u_draw_text("\x02");  // draw top border
                    else if (row == numRows)
                        u_draw_text("\x0C");  // draw bottom border
                    else
                        u_draw_text("\x07");  // draw inside background
                    set_text_scale(f26, f25);
                }
            }
            else if (col == 0)
            {
                set_text_scale(f26 * tbox->unk10 / 24.0f, f25);
                if (row == -1)
                    u_draw_text("\x02");  // draw top border
                else if (row == numRows)
                    u_draw_text("\x0C");  // draw bottom border
                else
                    u_draw_text("\x07");  // draw inside background
                set_text_scale(f26, f25);
            }
        }
        u_draw_text("\n");
    }

    func_80071B1C(a * 0.01f + 0.05);
    if (tbox->state >= 20)
        f1 = 1.0f - tbox->timer / 15.0f;
    else if (tbox->state == 10)
        f1 = tbox->timer / 15.0f;
    else
        f1 = 0.0f;
    f0 = CLAMP(f1, 0.0f, 1.0f);
    set_text_opacity(f0);
    
    // draw arrow
    switch (tbox->style)
    {
        float zero;
    case TEXTBOX_STYLE_TOP_LEFT:
        set_text_pos(sp24 - 24, sp20);
        u_draw_text("\x04");  // left arrow
        break;
    case TEXTBOX_STYLE_CENTER_LEFT:
        set_text_pos(sp24 - 24, sp20 + ((tbox->numRows - 1) * 24) * 0.5f);
        u_draw_text("\x04");  // left arrow
        break;
    case TEXTBOX_STYLE_BOTTOM_LEFT:
        set_text_pos(sp24 - 24, sp20 + (tbox->numRows - 1) * 24);
        u_draw_text("\x04");  // left arrow
        break;
    case TEXTBOX_STYLE_TOP_RIGHT:
        set_text_pos(sp24 + tbox->unk10, sp20);
        u_draw_text("\x05");  // right arrow
        break;
    case TEXTBOX_STYLE_CENTER_RIGHT:
        set_text_pos(sp24 + tbox->unk10, sp20 + ((tbox->numRows - 1) * 24) * 0.5f);
        u_draw_text("\x05");  // right arrow
        break;
    case TEXTBOX_STYLE_BOTTOM_RIGHT:
        set_text_pos(sp24 + tbox->unk10, sp20 + (tbox->numRows - 1) * 24);
        u_draw_text("\x05");  // right arrow
        break;
    case TEXTBOX_STYLE_LEFT_UP:
        zero = 0.0f;
        set_text_pos((sp24 + zero) + 14.0f, sp20 - 24);
        u_draw_text("\x10");  // up arrow
        break;
    case TEXTBOX_STYLE_CENTER_UP:
        set_text_pos(sp24 + tbox->unk10 * 0.5f - 10.0f, sp20 - 24);
        u_draw_text("\x10");  // up arrow
        break;
    case TEXTBOX_STYLE_RIGHT_UP:
        set_text_pos(sp24 + tbox->unk10 - 34.0f, sp20 - 24);
        u_draw_text("\x10");  // up arrow
        break;
    case TEXTBOX_STYLE_LEFT_DOWN:
        zero = 0.0f;
        set_text_pos((sp24 + zero) + 14.0f, sp20 + (tbox->numRows * 24));
        u_draw_text("\x15");  // down arrow
        break;
    case TEXTBOX_STYLE_CENTER_DOWN:
    case TEXTBOX_STYLE_SPIKY:
        set_text_pos(sp24 + tbox->unk10 * 0.5f - 10.0f, sp20 + (tbox->numRows * 24));
        u_draw_text("\x15");  // down arrow
        break;
    case TEXTBOX_STYLE_RIGHT_DOWN:
        set_text_pos(sp24 + tbox->unk10 - 34.0f, sp20 + (tbox->numRows * 24));
        u_draw_text("\x15");  // down arrow
        break;
    }

    set_text_scale(f29, f30);
    if (tbox->state < 10)
    {
        reset_text_draw_settings();
        return;
    }
    func_80071B50(0x220000);
    set_text_font(FONT_JAP_24x24_2P);
    func_80071B1C(a * 0.01f + 0.05);
    set_text_mul_color(0);
    if (tbox->state == 11)
        scrollOffset = tbox->timer * -1.5;
    else
        scrollOffset = 0;
    if (tbox->state >= 20)
    {
        float temp_f1_2 = tbox->timerMax * 0.5;
        opacity = (tbox->timer < temp_f1_2) ? 1.0f - tbox->timer * (1.0f / temp_f1_2) : 0.0;
    }
    else
        opacity = 1.0f;
    
    // draw text
    line = textBoxLines[a];
    for (row = 0; row < 20; row++, line++)
    {
        if (line->unk0 == 0)
            break;
        lbl_802F200C = line->unk82;
        lbl_802F2008 = u_get_ascii_text_width(line->text);
        if (tbox->state == 11)  // scrolling
        {
            if (row == 0)
                opacity = tbox->timer < 8 ? 1.0 - tbox->timer * 0.14 : 0.0;
            else
                opacity = 1.0f;
        }
        set_text_opacity(opacity);
        if (tbox->unk10 > 0.0)
        {
            float f0 = MIN(tbox->unk10 / u_get_jpn_text_width(FONT_JAP_24x24_2P, line->text), 1.0);
            set_text_scale(f0, 1.0f);
        }
        else
            set_text_scale(1.0f, 1.0f);
        calc_textbox_text_pos(tbox, &textX, &textY);
        set_text_pos(textX, textY + row * 24 + scrollOffset);
        u_draw_text(line->text);
    }
    lbl_802F200C = -1.0f;
    reset_text_draw_settings();
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

static void calc_textbox_text_pos(struct TextBox *tbox, int *x, int *y)
{
    float f4 = tbox->unk10;
    float f1 = (tbox->numRows - 1) * 24.0f;

    switch (tbox->style)
    {
    default:
        *x = tbox->x - f4 * 0.5f;
        *y = tbox->y - tbox->numRows * 12.0f;
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

void textbox_set_properties(int id, int state, struct TextBox *template)
{
    int bgColor;
    int style;
    int x;
    int y;
    struct TextBox *tbox = &textBoxes[id];

    if (state == 20 && tbox->state >= 20)
    {
        tbox->state = 20;
        return;
    }
    if (state == 20 && tbox->state != 1 && tbox->state < 10)
        return;
    if (template == NULL)
        template = tbox;

    tbox->timerMax = 30;
    tbox->timer = 0;
    style = (template->style == 0) ? tbox->style : template->style;
    x = (template->x == 0) ? tbox->x : template->x;
    y = (template->y == 0) ? tbox->y : template->y;
    bgColor = (template->bgColor == 0) ? RGBA(255, 255, 255, 0) : template->bgColor;
    if (state == 1 || state == 2)
    {
        clear_lines(id);
        tbox->id = id;
        tbox->state = state;
        tbox->x = x;
        tbox->y = y;
        tbox->numColumns = template->numColumns;
        tbox->unk10 = tbox->numColumns * 24;
        tbox->numRows = template->numRows;
        tbox->style = template->style;
        tbox->bgColor = bgColor;
        tbox->unk17 = template->unk17;
        tbox->unk18 = template->unk18;
        tbox->unk19 = template->unk19;
        tbox->callback = template->callback;
        return;
    }

    if (state == 21)
    {
        if (tbox->state < 10)
        {
            tbox->state = 3;
            tbox->x = x;
            tbox->y = y;
            tbox->numColumns = template->numColumns;
            tbox->unk10 = tbox->numColumns * 24;
            tbox->numRows = template->numRows;
            tbox->style = style;
            tbox->bgColor = bgColor;
            return;
        }
        tbox->state = state;
        memcpy(&lbl_80292AC0[id], tbox, sizeof(lbl_80292AC0[id]));
        lbl_80292AC0[id].x = x;
        lbl_80292AC0[id].y = y;
        lbl_80292AC0[id].numColumns = template->numColumns;
        lbl_80292AC0[id].numRows = template->numRows;
        lbl_80292AC0[id].style = style;
        lbl_80292AC0[id].bgColor = bgColor;
        return;
    }

    tbox->state = state;
}

static void add_textbox_line(int id, const char *str)
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
            if (i == tbox->numRows && tbox->state == 10)
            {
                tbox->state = 11;
                tbox->timer = 0;
            }
            break;
        }
    }
}

void textbox_set_text(int id, const char *str)
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
    if (newLines + 1 > lbl_80292AC0[id].numRows)
        lbl_80292AC0[id].numRows = newLines + 1;
}

void textbox_set_textf(int id, const char *fmt, ...)
{
    va_list args;
    char buffer[0x200];

    va_start(args, fmt);
    vsprintf(buffer, fmt, args);
    va_end(args);
    textbox_set_text(id, buffer);
}
