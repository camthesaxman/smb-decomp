#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "mathutil.h"
#include "sprite.h"

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

void func_80073F74(int id, struct TextBox *b);

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
        r29->unk0 = 0;
        r29->unk8 = 0;
        r29->unk1C = NULL;
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
        if (tbox->unk0 != 0)
        {
            if (tbox->unk1C != NULL)
                tbox->unk1C(tbox);
            func_80073F74(i, tbox);
        }
    }
}

void func_80073F74(int id, struct TextBox *tbox)
{
    s32 i;
    struct TextBoxLine *line;
    s8 r27;
    int j;
    float f30;

    switch (tbox->unk0)
    {
    case 1:
        tbox->unk8++;
        if (tbox->unk8 == tbox->unk4)
        {
            tbox->unk0 = 10;
            tbox->unk8 = 0;
            if (lbl_80292AC0[id].unk0 == 20)
            {
                tbox->unk0 = 20;
                lbl_80292AC0[id].unk0 = 0;
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
        tbox->unk0 = 1;
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
            tbox->unk0 = 11;
            tbox->unk8 = 0;
        }
        break;
    case 11:
        tbox->unk8++;
        if (tbox->unk8 == 16)
        {
            s32 i;
            tbox->unk0 = 10;
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
            tbox->unk0 = 0;
            tbox->unk8 = 0;
            tbox->unk1C = 0;
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
            tbox->unk0 = 1;
            tbox->unk8 = 0;
            lbl_80292AC0[id].unk0 = 0;
        }
        break;
    case 22:
        tbox->unk8++;
        if (tbox->unk8 == tbox->unk4)
        {
            tbox->unk0 = 2;
            tbox->unk8 = 0;
            clear_lines(id);
        }
        break;
    }

    line = textBoxLines[id];
    for (i = 0; i < 20; i++, line++)
    {
        if (tbox->unk0 >= 10
         && line->unk0 != 0
         && line->unk0 == 2
         && (tbox->unk0 == 10 || tbox->unk0 == 11))
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
        tbox->unk0 = 0;
}

void textbox_draw_all(void)
{
    int i;
    struct TextBox *tbox;

    for (tbox = textBoxes, i = 0; i < 4; i++, tbox++)
    {
        if (tbox->unk0 != 0)
            draw_textbox(i, tbox);
    }
}

void draw_textbox(int a, struct TextBox *tbox)
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
    int r30;
    int r29;

    float f26;
    float f25;

    float f3;
    float f1;
    float f0;

    if (tbox->unk0 == 0 || tbox->unk0 == 2 || tbox->unk0 == 3)
        return;
    if (tbox->unk14 == 0)
        return;

    func_80071A8C();
    g_set_font(tbox->unk16 == 13 ? FONT_ICON_SD2 : FONT_ICON_SD);
    func_80071B1C(a * 0.01f + 0.059999999776482585);
    func_80071AE4(tbox->unk24);
    f3 = (float)tbox->unk8 / (float)tbox->unk4;
    if (tbox->unk0 == 1)
    {
        f29 = (f3 < 0.5) ? f3 * 2.0f : 1.0;
        f30 = (f3 < 0.5) ? 0.1 : (f3 - 0.5) * 1.8 + 0.1;
        f23 = (f3 < 0.5) ? f3 * 2.0f : 1.0;
    }
    else if (tbox->unk0 >= 20 && f3 > 0.5)
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
    if (tbox->unk16 == 15)
    {
        sp24 += 12;
        sp20 += 12;
    }
    numLines = tbox->numLines;
    f27 = tbox->unk14;
    g_set_text_pos(sp24 - 24, sp20 - 24);
    for (r30 = -1; r30 <= numLines; r30++)
    {
        for (r29 = -1; r29 <= f27; r29++)
        {
            f26 = f29;
            f25 = f30;
            if (tbox->unk16 == 15 && (r30 == -1 || (float)r30 == numLines))
                f25 *= 0.5;
            if (tbox->unk16 == 15 && (r29 == -1 || (float)r29 == f27))
                f26 *= 0.5;
            func_80071B2C(f26, f25);
            if (r29 == -1)
            {
                if (r30 == -1)
                    g_draw_text("\x01");
                else if ((float)r30 == numLines)
                    g_draw_text("\x0B");
                else
                    g_draw_text("\x06");
            }
            else if ((float)r29 == f27)
            {
                if (r30 == -1)
                    g_draw_text("\x03");
                else if ((float)r30 == numLines)
                    g_draw_text("\x0D");
                else
                    g_draw_text("\x08");

            }
            else if (tbox->unk16 == 13 && (r30 == -1 || (float)r30 == numLines))
            {
                float f1 = mathutil_floor(tbox->unk10 / 24.0f);
                if (r29 < f1)
                {
                    func_80071B2C((tbox->unk10 / f1 / 24.0f) * f26, f25);
                    if (r30 == -1)
                        g_draw_text("\x02");
                    else if ((float)r30 == numLines)
                        g_draw_text("\x0C");
                    else
                        g_draw_text("\x07");
                    func_80071B2C(f26, f25);
                }
            }
            else if (r29 == 0)
            {
                func_80071B2C(f26 * tbox->unk10 / 24.0f, f25);
                if (r30 == -1)
                    g_draw_text("\x02");
                else if ((float)r30 == numLines)
                    g_draw_text("\x0C");
                else
                    g_draw_text("\x07");
                func_80071B2C(f26, f25);
            }
        }
        g_draw_text("\n");
    }
    func_80071B1C(a * 0.01f + 0.05);
    if (tbox->unk0 >= 20)
        f1 = 1.0f - tbox->unk8 / 15.0f;
    else if (tbox->unk0 == 10)
        f1 = tbox->unk8 / 15.0f;
    else
        f1 = 0.0f;
    f0 = CLAMP(f1, 0.0f, 1.0f);
    func_80071B40(f0);
    switch (tbox->unk16)
    {
        float zero;
    case 1:
        g_set_text_pos(sp24 - 24, sp20);
        g_draw_text("\x04");
        break;
    case 2:
        g_set_text_pos(sp24 - 24, sp20 + 0.5f * ((tbox->numLines - 1) * 24));
        g_draw_text("\x04");
        break;
    case 3:
        g_set_text_pos(sp24 - 24, sp20 + (tbox->numLines - 1) * 24);
        g_draw_text("\x04");
        break;
    case 4:
        g_set_text_pos(sp24 + tbox->unk10, sp20);
        g_draw_text("\x05");
        break;
    case 5:
        g_set_text_pos(sp24 + tbox->unk10, sp20 + 0.5f * ((tbox->numLines - 1) * 24));
        g_draw_text("\x05");
        break;
    case 6:
        g_set_text_pos(sp24 + tbox->unk10, sp20 + (tbox->numLines - 1) * 24);
        g_draw_text("\x05");
        break;
    case 7:
        zero = 0.0f;
        g_set_text_pos((sp24 + zero) + 14.0f, sp20 - 24);
        g_draw_text("\x10");
        break;
    case 8:
        g_set_text_pos(sp24 + tbox->unk10 * 0.5f - 10.0f, sp20 - 24);
        g_draw_text("\x10");
        break;
    case 9:
        g_set_text_pos(sp24 + tbox->unk10 - 34.0f, sp20 - 24);
        g_draw_text("\x10");
        break;
    case 10:
        zero = 0.0f;
        g_set_text_pos((sp24 + zero) + 14.0f, sp20 + (tbox->numLines * 24));
        g_draw_text("\x15");
        break;
    case 11:
    case 13:
        g_set_text_pos(sp24 + tbox->unk10 * 0.5f - 10.0f, sp20 + (tbox->numLines * 24));
        g_draw_text("\x15");
        break;
    case 12:
        g_set_text_pos(sp24 + tbox->unk10 - 34.0f, sp20 + (tbox->numLines * 24));
        g_draw_text("\x15");
        break;
    }
    func_80071B2C(f29, f30);
    if (tbox->unk0 < 10)
    {
        func_80071A8C();
        return;
    }
    func_80071B50(0x220000);
    g_set_font(FONT_JAP_24x24_2P);
    func_80071B1C(a * 0.01f + 0.05);
    func_80071AE4(0);
    if (tbox->unk0 == 11)
        r29 = tbox->unk8 * -1.5;
    else
        r29 = 0;
    if (tbox->unk0 >= 20)
    {
        float temp_f1_2 = tbox->unk4 * 0.5;
        f25 = (tbox->unk8 < temp_f1_2) ? 1.0f - tbox->unk8 * (1.0f / temp_f1_2) : 0.0;
    }
    else
        f25 = 1.0f;
    line = textBoxLines[a];
    for (r30 = 0; r30 < 20; r30++, line++)
    {
        if (line->unk0 == 0)
            break;
        lbl_802F200C = line->unk82;
        lbl_802F2008 = get_ascii_text_width(line->text);
        if (tbox->unk0 == 11)
        {
            if (r30 == 0)
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
        g_set_text_pos(sp1C, sp18 + r30 * 24 + r29);
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

void func_80075498(struct TextBox *tbox, int *b, int *c)
{
    float f4 = tbox->unk10;
    float f1 = (tbox->numLines - 1) * 24.0f;

    switch (tbox->unk16)
    {
    default:
        *b = tbox->unkC - f4 * 0.5f;
        *c = tbox->unkE - tbox->numLines * 12.0f;
        break;
    case 1:
        *b = tbox->unkC + 18;
        *c = tbox->unkE - 12;
        break;
    case 2:
        *b = tbox->unkC + 18;
        *c = tbox->unkE - 12 - f1 * 0.5;
        break;
    case 3:
        *b = tbox->unkC + 18;
        *c = tbox->unkE - 12 - f1;
        break;
    case 4:
        *b = tbox->unkC - f4 - 18.0f;
        *c = tbox->unkE - 12;
        break;
    case 5:
        *b = tbox->unkC - f4 - 18.0f;
        *c = tbox->unkE - 12 - f1 * 0.5f;
        break;
    case 6:
        *b = tbox->unkC - f4 - 18.0f;
        *c = tbox->unkE - 12 - f1;
        break;
    case 7:
        *b = tbox->unkC - 24;
        *c = tbox->unkE + 18;
        break;
    case 8:
        *b = tbox->unkC - f4 * 0.5;
        *c = tbox->unkE + 18;
        break;
    case 9:
        *b = tbox->unkC - f4 + 24.0f;
        *c = tbox->unkE + 18;
        break;
    case 10:
        *b = tbox->unkC - 24;
        *c = tbox->unkE - 42 - f1;
        break;
    case 11:
    case 13:
        *b = tbox->unkC - f4 * 0.5;
        *c = tbox->unkE - 42 - f1;
        break;
    case 12:
        *b = tbox->unkC - f4 + 24.0f;
        *c = tbox->unkE - 42 - f1;
        break;
    }
}

void g_create_textbox(int id, int b, struct TextBox *c)
{
    int r30;
    int r28;
    int r27;
    int r26;
    struct TextBox *tbox = &textBoxes[id];

    if (b == 20 && tbox->unk0 >= 20)
    {
        tbox->unk0 = 20;
        return;
    }
    if (b == 20 && tbox->unk0 != 1 && tbox->unk0 < 10)
        return;
    if (c == NULL)
        c = tbox;

    tbox->unk4 = 30;
    tbox->unk8 = 0;
    r28 = (c->unk16 == 0) ? tbox->unk16 : c->unk16;
    r27 = (c->unkC == 0) ? tbox->unkC : c->unkC;
    r26 = (c->unkE == 0) ? tbox->unkE : c->unkE;
    r30 = (c->unk24 == 0) ? 0xFFFFFF : c->unk24;
    if (b == 1 || b == 2)
    {
        clear_lines(id);
        tbox->unk20 = id;
        tbox->unk0 = b;
        tbox->unkC = r27;
        tbox->unkE = r26;
        tbox->unk14 = c->unk14;
        tbox->unk10 = tbox->unk14 * 24;
        tbox->numLines = c->numLines;
        tbox->unk16 = c->unk16;
        tbox->unk24 = r30;
        tbox->unk17 = c->unk17;
        tbox->unk18 = c->unk18;
        tbox->unk19 = c->unk19;
        tbox->unk1C = c->unk1C;
        return;
    }

    if (b == 21)
    {
        if (tbox->unk0 < 10)
        {
            tbox->unk0 = 3;
            tbox->unkC = r27;
            tbox->unkE = r26;
            tbox->unk14 = c->unk14;
            tbox->unk10 = tbox->unk14 * 24;
            tbox->numLines = c->numLines;
            tbox->unk16 = r28;
            tbox->unk24 = r30;
            return;
        }
        tbox->unk0 = b;
        memcpy(&lbl_80292AC0[id], tbox, sizeof(lbl_80292AC0[id]));
        lbl_80292AC0[id].unkC = r27;
        lbl_80292AC0[id].unkE = r26;
        lbl_80292AC0[id].unk14 = c->unk14;
        lbl_80292AC0[id].numLines = c->numLines;
        lbl_80292AC0[id].unk16 = r28;
        lbl_80292AC0[id].unk24 = r30;
        return;
    }

    tbox->unk0 = b;
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
            if (i == tbox->numLines && tbox->unk0 == 10)
            {
                tbox->unk0 = 11;
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

void func_80075CD4(int id, const char *fmt, ...)
{
    va_list args;
    char buffer[0x200];

    va_start(args, fmt);
    vsprintf(buffer, fmt, args);
    va_end(args);
    g_set_textbox_text(id, buffer);
}
