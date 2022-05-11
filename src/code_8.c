#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "mathutil.h"
#include "sprite.h"

struct Struct80290180_sub
{
    s8 unk0;
    char text[20];
    s8 unk15;
    u8 filler16[0x82-0x16];
    s16 unk82;
};  // size = 0x84

struct Struct80290180_sub lbl_80290180[4][20];
FORCE_BSS_ORDER(lbl_80290180)

struct Struct80292B60 lbl_80292AC0[4];  // +0x2940
FORCE_BSS_ORDER(lbl_80292AC0)

struct Struct80292B60 lbl_80292B60[4];  // +0x29E0
FORCE_BSS_ORDER(lbl_80292B60)

void func_80073F74(int a, struct Struct80292B60 *b);

void func_80073E44(void)
{
    int i;
    struct Struct80292B60 *r29;
    struct Struct80292B60 *r28;

    r29 = lbl_80292B60;
    r28 = lbl_80292AC0;
    for (i = 0; i < 4; i++, r29++, r28++)
    {
        memset(r29, 0, sizeof(*r29));
        memset(r28, 0, sizeof(*r28));
        r29->unk0 = 0;
        r29->unk8 = 0;
        r29->unk1C = NULL;
        func_80075428(i);
    }
    lbl_802F200C = -1.0f;
    lbl_802F2008 = 0.0f;
}

void func_80073EF8(void)
{
    int i;
    struct Struct80292B60 *r30;

    r30 = lbl_80292B60;
    for (i = 0; i < 4; i++, r30++)
    {
        if (r30->unk0 != 0)
        {
            if (r30->unk1C != NULL)
                r30->unk1C(r30);
            func_80073F74(i, r30);
        }
    }
}

void func_80073F74(int a, struct Struct80292B60 *b)
{
    s32 i;
    struct Struct80290180_sub *r26;
    s8 r27;
    int j;
    float f30;

    switch (b->unk0)
    {
    case 1:
        b->unk8++;
        if (b->unk8 == b->unk4)
        {
            b->unk0 = 10;
            b->unk8 = 0;
            if (lbl_80292AC0[a].unk0 == 20)
            {
                b->unk0 = 20;
                lbl_80292AC0[a].unk0 = 0;
            }
        }
        if (b->unk14 == 0)
        {
            f30 = 0.0f;
            r27 = 0;
            r26 = lbl_80290180[a];
            for (i = 0; i < 20; i++, r26++)
            {
                if (r26->unk0 == 0)
                    break;
                if (b->unk15 == 1)
                {
                    r27 = get_ascii_text_width(r26->text);
                    f30 = get_jpn_text_width(FONT_JAP_24x24_2P, r26->text);
                }
                else
                {
                    float f0;
                    if (r27 < get_ascii_text_width(r26->text))
                        r27 = get_ascii_text_width(r26->text);
                    f0 = get_jpn_text_width(FONT_JAP_24x24_2P, r26->text);
                    if (f30 < f0)
                        f30 = f0;
                }
            }
            b->unk14 = r27;
            b->unk10 = f30;
        }
        break;
    case 3:
        b->unk0 = 1;
        b->unk8 = 0;
        break;
    case 10:
        b->unk8++;
        r26 = lbl_80290180[a];
        j = 0;
        for (i = 0; i < 20; i++, r26++)
        {
            if (r26->unk0 != 0)
                j++;
        }
        if (j > b->unk15)
        {
            b->unk0 = 11;
            b->unk8 = 0;
        }
        break;
    case 11:
        b->unk8++;
        if (b->unk8 == 16)
        {
            s32 i;
            b->unk0 = 10;
            r26 = lbl_80290180[a];
            for (i = 0; i < 19; i++, r26++)
                memcpy(r26, r26 + 1, sizeof(*r26));
            r26->unk0 = 0;
            r26->unk82 = 0;
        }
        break;
    case 20:
        b->unk8++;
        if (b->unk8 == b->unk4)
        {
            b->unk0 = 0;
            b->unk8 = 0;
            b->unk1C = 0;
            func_80075428(a);
        }
        break;
    case 21:
        b->unk8++;
        if (b->unk8 == b->unk4)
        {
            s32 i;

            for (i = 0; i < b->unk15; i++)
            {
                r26 = lbl_80290180[a];
                for (j = 0; j < 19; j++, r26++)
                    memcpy(r26, r26 + 1, sizeof(*r26));
                r26->unk0 = 0;
                r26->unk82 = 0;
            }
            memcpy(b, &lbl_80292AC0[a], sizeof(*b));
            b->unk0 = 1;
            b->unk8 = 0;
            lbl_80292AC0[a].unk0 = 0;
        }
        break;
    case 22:
        b->unk8++;
        if (b->unk8 == b->unk4)
        {
            b->unk0 = 2;
            b->unk8 = 0;
            func_80075428(a);
        }
        break;
    }

    r26 = lbl_80290180[a];
    for (i = 0; i < 20; i++, r26++)
    {
        if (b->unk0 >= 10
         && r26->unk0 != 0
         && r26->unk0 == 2
         && (b->unk0 == 10 || b->unk0 == 11))
        {
            if (i < b->unk15
             && (i == 0 || lbl_80290180[a][i - 1].unk0 != 2))
                r26->unk82 += 2;
            if (r26->unk82 >= get_ascii_text_width(r26->text))
                r26->unk0 = 1;
        }
    }
}

void func_80074480(void)
{
    int i;
    struct Struct80292B60 *ptr;

    for (ptr = lbl_80292B60, i = 0; i < 4; i++, ptr++)
        ptr->unk0 = 0;
}

void func_8007449C(void)
{
    int i;
    struct Struct80292B60 *ptr;

    for (ptr = lbl_80292B60, i = 0; i < 4; i++, ptr++)
    {
        if (ptr->unk0 != 0)
            func_80074500(i, ptr);
    }
}

void func_80074500(int a, struct Struct80292B60 *b)
{
    int sp24;
    int sp20;
    int sp1C;
    int sp18;
    float f29;
    float f30;
    float f23;
    float f31;
    float f27;

    struct Struct80290180_sub *r31;
    int r30;
    int r29;

    float f26;
    float f25;

    float f3;
    float f1;
    float f0;

    if (b->unk0 == 0 || b->unk0 == 2 || b->unk0 == 3)
        return;
    if (b->unk14 == 0)
        return;

    func_80071A8C();
    g_set_font(b->unk16 == 13 ? FONT_ICON_SD2 : FONT_ICON_SD);
    func_80071B1C(a * 0.01f + 0.059999999776482585);
    func_80071AE4(b->unk24);
    f3 = (float)b->unk8 / (float)b->unk4;
    if (b->unk0 == 1)
    {
        f29 = (f3 < 0.5) ? f3 * 2.0f : 1.0;
        f30 = (f3 < 0.5) ? 0.1 : (f3 - 0.5) * 1.8 + 0.1;
        f23 = (f3 < 0.5) ? f3 * 2.0f : 1.0;
    }
    else if (b->unk0 >= 20 && f3 > 0.5)
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
    func_80075498(b, &sp24, &sp20);
    sp24 += 0.5 * ((1.0 - f29) * (48.0f + b->unk10));
    sp20 += 0.5 * (24.0 * ((1.0 - f30) * b->unk15));
    if (b->unk16 == 15)
    {
        sp24 += 12;
        sp20 += 12;
    }
    f31 = b->unk15;
    f27 = b->unk14;
    g_set_text_pos(sp24 - 24, sp20 - 24);
    for (r30 = -1; r30 <= f31; r30++)
    {
        for (r29 = -1; r29 <= f27; r29++)
        {
            f26 = f29;
            f25 = f30;
            if (b->unk16 == 15 && (r30 == -1 || (float)r30 == f31))
                f25 *= 0.5;
            if (b->unk16 == 15 && (r29 == -1 || (float)r29 == f27))
                f26 *= 0.5;
            func_80071B2C(f26, f25);
            if (r29 == -1)
            {
                if (r30 == -1)
                    g_draw_text("\x01");
                else if ((float)r30 == f31)
                    g_draw_text("\x0B");
                else
                    g_draw_text("\x06");
            }
            else if ((float)r29 == f27)
            {
                if (r30 == -1)
                    g_draw_text("\x03");
                else if ((float)r30 == f31)
                    g_draw_text("\x0D");
                else
                    g_draw_text("\x08");

            }
            else if (b->unk16 == 13 && (r30 == -1 || (float)r30 == f31))
            {
                float f1 = mathutil_floor(b->unk10 / 24.0f);
                if (r29 < f1)
                {
                    func_80071B2C((b->unk10 / f1 / 24.0f) * f26, f25);
                    if (r30 == -1)
                        g_draw_text("\x02");
                    else if ((float)r30 == f31)
                        g_draw_text("\x0C");
                    else
                        g_draw_text("\x07");
                    func_80071B2C(f26, f25);
                }
            }
            else if (r29 == 0)
            {
                func_80071B2C(f26 * b->unk10 / 24.0f, f25);
                if (r30 == -1)
                    g_draw_text("\x02");
                else if ((float)r30 == f31)
                    g_draw_text("\x0C");
                else
                    g_draw_text("\x07");
                func_80071B2C(f26, f25);
            }
        }
        g_draw_text("\n");
    }
    func_80071B1C(a * 0.01f + 0.05);
    if (b->unk0 >= 20)
        f1 = 1.0f - b->unk8 / 15.0f;
    else if (b->unk0 == 10)
        f1 = b->unk8 / 15.0f;
    else
        f1 = 0.0f;
    f0 = CLAMP(f1, 0.0f, 1.0f);
    func_80071B40(f0);
    switch (b->unk16)
    {
        float zero;
    case 1:
        g_set_text_pos(sp24 - 24, sp20);
        g_draw_text("\x04");
        break;
    case 2:
        g_set_text_pos(sp24 - 24, sp20 + 0.5f * ((b->unk15 - 1) * 24));
        g_draw_text("\x04");
        break;
    case 3:
        g_set_text_pos(sp24 - 24, sp20 + (b->unk15 - 1) * 24);
        g_draw_text("\x04");
        break;
    case 4:
        g_set_text_pos(sp24 + b->unk10, sp20);
        g_draw_text("\x05");
        break;
    case 5:
        g_set_text_pos(sp24 + b->unk10, sp20 + 0.5f * ((b->unk15 - 1) * 24));
        g_draw_text("\x05");
        break;
    case 6:
        g_set_text_pos(sp24 + b->unk10, sp20 + (b->unk15 - 1) * 24);
        g_draw_text("\x05");
        break;
    case 7:
        zero = 0.0f;
        g_set_text_pos((sp24 + zero) + 14.0f, sp20 - 24);
        g_draw_text("\x10");
        break;
    case 8:
        g_set_text_pos(sp24 + b->unk10 * 0.5f - 10.0f, sp20 - 24);
        g_draw_text("\x10");
        break;
    case 9:
        g_set_text_pos(sp24 + b->unk10 - 34.0f, sp20 - 24);
        g_draw_text("\x10");
        break;
    case 10:
        zero = 0.0f;
        g_set_text_pos((sp24 + zero) + 14.0f, sp20 + (b->unk15 * 24));
        g_draw_text("\x15");
        break;
    case 11:
    case 13:
        g_set_text_pos(sp24 + b->unk10 * 0.5f - 10.0f, sp20 + (b->unk15 * 24));
        g_draw_text("\x15");
        break;
    case 12:
        g_set_text_pos(sp24 + b->unk10 - 34.0f, sp20 + (b->unk15 * 24));
        g_draw_text("\x15");
        break;
    }
    func_80071B2C(f29, f30);
    if (b->unk0 < 10)
    {
        func_80071A8C();
        return;
    }
    func_80071B50(0x220000);
    g_set_font(FONT_JAP_24x24_2P);
    func_80071B1C(a * 0.01f + 0.05);
    func_80071AE4(0);
    if (b->unk0 == 11)
        r29 = b->unk8 * -1.5;
    else
        r29 = 0;
    if (b->unk0 >= 20)
    {
        float temp_f1_2 = b->unk4 * 0.5;
        f25 = (b->unk8 < temp_f1_2) ? 1.0f - b->unk8 * (1.0f / temp_f1_2) : 0.0;
    }
    else
        f25 = 1.0f;
    r31 = lbl_80290180[a];
    for (r30 = 0; r30 < 20; r30++, r31++)
    {
        if (r31->unk0 == 0)
            break;
        lbl_802F200C = r31->unk82;
        lbl_802F2008 = get_ascii_text_width(r31->text);
        if (b->unk0 == 11)
        {
            if (r30 == 0)
                f25 = b->unk8 < 8 ? 1.0 - b->unk8 * 0.14 : 0.0;
            else
                f25 = 1.0f;
        }
        func_80071B40(f25);
        if (b->unk10 > 0.0)
        {
            float f0 = MIN(b->unk10 / get_jpn_text_width(FONT_JAP_24x24_2P, r31->text), 1.0);
            func_80071B2C(f0, 1.0f);
        }
        else
            func_80071B2C(1.0f, 1.0f);
        func_80075498(b, &sp1C, &sp18);
        g_set_text_pos(sp1C, sp18 + r30 * 24 + r29);
        g_draw_text(r31->text);
    }
    lbl_802F200C = -1.0f;
    func_80071A8C();
}

void func_80075428(int a)
{
    int i;
    struct Struct80290180_sub *r29 = lbl_80290180[a];

    for (i = 0; i < 20; i++, r29++)
    {
        r29->unk0 = 0;
        r29->unk82 = 0;
        strcpy(r29->text, "");
    }
}

void func_80075498(struct Struct80292B60 *a, int *b, int *c)
{
    float f4 = a->unk10;
    float f1 = (a->unk15 - 1) * 24.0f;

    switch (a->unk16)
    {
    default:
        *b = a->unkC - f4 * 0.5f;
        *c = a->unkE - a->unk15 * 12.0f;
        break;
    case 1:
        *b = a->unkC + 18;
        *c = a->unkE - 12;
        break;
    case 2:
        *b = a->unkC + 18;
        *c = a->unkE - 12 - f1 * 0.5;
        break;
    case 3:
        *b = a->unkC + 18;
        *c = a->unkE - 12 - f1;
        break;
    case 4:
        *b = a->unkC - f4 - 18.0f;
        *c = a->unkE - 12;
        break;
    case 5:
        *b = a->unkC - f4 - 18.0f;
        *c = a->unkE - 12 - f1 * 0.5f;
        break;
    case 6:
        *b = a->unkC - f4 - 18.0f;
        *c = a->unkE - 12 - f1;
        break;
    case 7:
        *b = a->unkC - 24;
        *c = a->unkE + 18;
        break;
    case 8:
        *b = a->unkC - f4 * 0.5;
        *c = a->unkE + 18;
        break;
    case 9:
        *b = a->unkC - f4 + 24.0f;
        *c = a->unkE + 18;
        break;
    case 10:
        *b = a->unkC - 24;
        *c = a->unkE - 42 - f1;
        break;
    case 11:
    case 13:
        *b = a->unkC - f4 * 0.5;
        *c = a->unkE - 42 - f1;
        break;
    case 12:
        *b = a->unkC - f4 + 24.0f;
        *c = a->unkE - 42 - f1;
        break;
    }
}

void g_create_textbox(int a, int b, struct Struct80292B60 *c)
{
    int r30;
    int r28;
    int r27;
    int r26;
    struct Struct80292B60 *r25 = &lbl_80292B60[a];

    if (b == 20 && r25->unk0 >= 20)
    {
        r25->unk0 = 20;
        return;
    }
    if (b == 20 && r25->unk0 != 1 && r25->unk0 < 10)
        return;
    if (c == NULL)
        c = r25;

    r25->unk4 = 30;
    r25->unk8 = 0;
    r28 = (c->unk16 == 0) ? r25->unk16 : c->unk16;
    r27 = (c->unkC == 0) ? r25->unkC : c->unkC;
    r26 = (c->unkE == 0) ? r25->unkE : c->unkE;
    r30 = (c->unk24 == 0) ? 0xFFFFFF : c->unk24;
    if (b == 1 || b == 2)
    {
        func_80075428(a);
        r25->unk20 = a;
        r25->unk0 = b;
        r25->unkC = r27;
        r25->unkE = r26;
        r25->unk14 = c->unk14;
        r25->unk10 = r25->unk14 * 24;
        r25->unk15 = c->unk15;
        r25->unk16 = c->unk16;
        r25->unk24 = r30;
        r25->unk17 = c->unk17;
        r25->unk18 = c->unk18;
        r25->unk19 = c->unk19;
        r25->unk1C = c->unk1C;
        return;
    }

    if (b == 21)
    {
        if (r25->unk0 < 10)
        {
            r25->unk0 = 3;
            r25->unkC = r27;
            r25->unkE = r26;
            r25->unk14 = c->unk14;
            r25->unk10 = r25->unk14 * 24;
            r25->unk15 = c->unk15;
            r25->unk16 = r28;
            r25->unk24 = r30;
            return;
        }
        r25->unk0 = b;
        memcpy(&lbl_80292AC0[a], r25, sizeof(lbl_80292AC0[a]));
        lbl_80292AC0[a].unkC = r27;
        lbl_80292AC0[a].unkE = r26;
        lbl_80292AC0[a].unk14 = c->unk14;
        lbl_80292AC0[a].unk15 = c->unk15;
        lbl_80292AC0[a].unk16 = r28;
        lbl_80292AC0[a].unk24 = r30;
        return;
    }

    r25->unk0 = b;
}

void func_80075B5C(int a, const char *b)
{
    int i;
    struct Struct80290180_sub *r30;
    struct Struct80292B60 *r29;

    r29 = &lbl_80292B60[a];
    r30 = lbl_80290180[a];
    for (i = 0; i < 20; i++, r30++)
    {
        if (r30->unk0 == 0)
        {
            r30->unk0 = 2;
            strcpy(r30->text, b);
            r30->unk82 = 0;
            if (i == r29->unk15 && r29->unk0 == 10)
            {
                r29->unk0 = 11;
                r29->unk8 = 0;
            }
            break;
        }
    }
}

void g_set_textbox_text(int a, const char *b)
{
    char buffer[0x200];
    int length = 0;
    int lines = 0;
    
    while (*b != 0)
    {
        if (*b == '\n')
        {
            buffer[length] = 0;
            func_80075B5C(a, buffer);
            length = 0;
            lines++;
        }
        else
        {
            buffer[length] = *b;
            length++;
        }
        b++;
    }
    buffer[length] = 0;
    func_80075B5C(a, buffer);
    if (lines + 1 > lbl_80292AC0[a].unk15)
        lbl_80292AC0[a].unk15 = lines + 1;
}

void func_80075CD4(int a, const char *fmt, ...)
{
    va_list args;
    char buffer[0x200];

    va_start(args, fmt);
    vsprintf(buffer, fmt, args);
    va_end(args);
    g_set_textbox_text(a, buffer);
}

void lbl_80075D70(void) {}
