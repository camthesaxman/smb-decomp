#ifndef _SRC_STCOLI_H_
#define _SRC_STCOLI_H_

#include <dolphin/mtx.h>
#include <dolphin/types.h>

#include "stage.h"
#include "types.h"

void g_collide_ball_with_stage(struct PhysicsBall *b, struct Stage *);
s16 *meshcoli_grid_lookup(struct StageItemgroup *coliHeader, f32 x, f32 z);
void g_collide_ball_with_tri_face(struct PhysicsBall *physBall, struct StageColiTri *tri);
void g_collide_ball_with_tri_edges(struct PhysicsBall *physBall, struct StageColiTri *tri);
void stcoli_sub05(struct PhysicsBall *physBall, Vec *localBallPos, Vec *localBallPrevPos,
                  struct ColiEdge *edge);
void g_collide_ball_with_tri_verts(struct PhysicsBall *physBall, struct StageColiTri *tri);
// ? stcoli_sub07();
// ? stcoli_sub08();
void g_collide_ball_with_cylinder(struct PhysicsBall *, struct StageColiCylinder *cylinder);
// ? stcoli_sub10();
void g_collide_ball_with_sphere(struct PhysicsBall *, struct StageColiSphere *sphere);
void g_collide_ball_with_cone(struct PhysicsBall *, struct StageColiCone *cone);
void g_apply_coli_response(struct PhysicsBall *physBall, struct G_ColiHit *coliHit);
u32 test_line_intersects_rect(Vec *, Vec *, struct Struct8003F890 *);
// ? stcoli_sub15();
int stcoli_sub16(Vec *, struct Struct8003FB48 *, Vec *);
// ? stcoli_sub17();
// ? stcoli_sub18();
// ? stcoli_sub19();
// ? stcoli_sub20();
void g_collide_ball_with_goal(struct PhysicsBall *, struct StageGoal *goal);
// ? stcoli_sub22();
// ? stcoli_sub23();
// ? stcoli_sub24();
void g_collide_ball_with_dynstageparts(struct PhysicsBall *,
                                       struct DynamicStagePart *dynStageParts);
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