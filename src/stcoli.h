#ifndef _SRC_STCOLI_H_
#define _SRC_STCOLI_H_

#include <dolphin/mtx.h>
#include <dolphin/types.h>

#include "stage.h"
#include "types.h"

void collide_ball_with_stage(struct PhysicsBall *b, struct Stage *);
s16 *coligrid_lookup(struct StageAnimGroup *coliHeader, f32 x, f32 z);
void collide_ball_with_tri_face(struct PhysicsBall *physBall, struct StageColiTri *tri);
void collide_ball_with_tri_edges(struct PhysicsBall *physBall, struct StageColiTri *tri);
void collide_ball_with_tri_edge(struct PhysicsBall *physBall, Vec *localBallPos,
                                Vec *localBallPrevPos, struct ColiEdge *edge);
void collide_ball_with_tri_verts(struct PhysicsBall *physBall, struct StageColiTri *tri);
void collide_ball_with_tri_vert(struct PhysicsBall *, Point3d *, Point2d *);
void collide_ball_with_rect(struct PhysicsBall *physBall, struct ColiRect *rect);
void collide_ball_with_cylinder(struct PhysicsBall *, struct StageColiCylinder *cylinder);
void collide_ball_with_circle(struct PhysicsBall *ball, struct ColiCircle *circle);
void collide_ball_with_sphere(struct PhysicsBall *, struct StageColiSphere *sphere);
void collide_ball_with_cone(struct PhysicsBall *, struct StageColiCone *cone);
void collide_ball_with_plane(struct PhysicsBall *physBall, struct ColiPlane *coliHit);
u32 test_line_intersects_rect(Point3d *lineStart, Point3d *lineEnd, struct ColiRect *rect);
void collide_ball_with_jamabar(struct PhysicsBall *ball, struct Stobj *stobj);
int raycast_stage_down(Point3d *rayOrigin, struct RaycastHit *outHit, Vec *outVelAtPoint);
u32 raycast_tri(Point3d *rayOrigin, Vec *rayDir, struct StageColiTri *tri);
u32 raycast_cone(Point3d *rayOrigin, Point3d *rayDir, struct StageColiCone *cone,
                 Point3d *outHitPos, Vec *outHitNormal);
u32 raycast_sphere(Point3d *rayOrigin, Point3d *rayDir, struct StageColiSphere *sphere,
                   Point3d *outHitPos, Vec *outHitNormal);
u32 raycast_cylinder(Point3d *rayOrigin, Point3d *rayDir, struct StageColiCylinder *cylinder,
                     Point3d *outHitPos, Vec *outHitNormal);
void collide_ball_with_goal(struct PhysicsBall *ball, struct StageGoal *goal);
// ? stcoli_sub22();
// ? stcoli_sub23();
// ? stcoli_sub24();
void g_collide_ball_with_dynstageparts(struct PhysicsBall *,
                                       struct DynamicStagePart *dynStageParts);
void g_draw_stage_collision(void);
// ? stcoli_sub27();
// ? stcoli_sub28();
// ? stcoli_sub29();
void stcoli_sub30(struct PhysicsBall *src, struct PhysicsBall *dest);
void stcoli_sub31(struct PhysicsBall *src, struct PhysicsBall *dest);
void tf_physball_to_animgroup_space(struct PhysicsBall *physBall, int aniimGroupId);
// ? stcoli_sub33();
// ? stcoli_sub34();

#endif
