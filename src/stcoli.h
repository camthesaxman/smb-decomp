#ifndef _SRC_STCOLI_H_
#define _SRC_STCOLI_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>

#include "stage.h"
#include "types.h"
void g_handle_ball_stage_collision(struct PhysicsBall *b, struct Stage *);
s16 *meshcoli_grid_lookup(struct StageCollHdr *coliHeader, float x, float z);
void stcoli_sub03(struct PhysicsBall *physBall, struct StageColiTri *tri);
// ? stcoli_sub04();
// ? stcoli_sub05();
// ? stcoli_sub06();
// ? stcoli_sub07();
// ? stcoli_sub08();
// ? stcoli_sub09();
// ? stcoli_sub10();
// ? stcoli_sub11();
// ? stcoli_sub12();
// ? stcoli_sub13();
u32 test_line_intersects_rect(Vec *, Vec *, struct Struct8003F890 *);
// ? stcoli_sub15();
int stcoli_sub16(Vec *, struct Struct8003FB48 *, Vec *);
// ? stcoli_sub17();
// ? stcoli_sub18();
// ? stcoli_sub19();
// ? stcoli_sub20();
// ? stcoli_sub21();
// ? stcoli_sub22();
// ? stcoli_sub23();
// ? stcoli_sub24();
// ? stcoli_sub25();
void g_draw_stage_collision(void);
// ? stcoli_sub27();
// ? stcoli_sub28();
// ? stcoli_sub29();
// ? stcoli_sub30();
// ? stcoli_sub31();
void tf_physball_to_itemgroup_space(struct PhysicsBall *physBall, int itemgroupId);
// ? stcoli_sub33();
// ? stcoli_sub34();

#endif