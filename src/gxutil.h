#ifndef _SRC_GXUTIL_H_
#define _SRC_GXUTIL_H_

#include <dolphin/mtx.h>
#include <dolphin/GXStruct.h>

struct PointWithColor
{
    Point3d pos;
    GXColor color;
};

void gxutil_begin_display_list(void *, u32);
u32 gxutil_end_display_list(void);
void gxutil_clear_vtx_attrs(void);
void gxutil_set_vtx_attrs(u32);
void gxutil_dummy(void);
void g_gxutil_upload_some_mtx(Mtx, int);
void g_init_bg_fog_params(void);
void func_8009AB5C(void);
// ? func_8009AC0C();
// ? func_8009AC44();
void func_8009AC8C(void);
void gxutil_set_line_width(int);
void g_gxutil_set_some_line_params(int a, int b, int c, int d);
void gxutil_draw_line(Vec *pos1, Vec *pos2, GXColor *c);
void gxutil_draw_line_strip(u16 numPoints, Point3d *points, GXColor *color);
void gxutil_draw_line_deferred(Point3d *start, Point3d *end, GXColor *c);
// ? gxutil_draw_line_multicolor_deferred();
void prepare_for_drawing_lines(void);

#endif
