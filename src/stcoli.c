
#include <math.h>
#include <stddef.h>

#include "global.h"
#include "mathutil.h"
#include "stage.h"
#include "stcoli.h"
#include "types.h"

void collide_ball_with_stage(struct PhysicsBall *b, struct Stage *stage)
{
    struct StageColiTri tri;
    struct StageItemgroup *stageIg;
    int itemgroupId;
    s16 *cellTris;
    s16 *cellTriIdx;

    struct StageColiCone *cone;
    struct StageColiSphere *sphere;
    struct StageColiCylinder *cylinder;
    struct StageGoal *goal;
    int i;

    if (dipSwitches & DIP_TRIANGLE)
    {
        tri.pos.x = 0.0f;
        tri.pos.y = 0.0f;
        tri.pos.z = 0.0f;
        tri.normal.x = 0.0f;
        tri.normal.y = 1.0f;
        tri.normal.z = 0.0f;
        tri.rot.x = -0x4000;
        tri.rot.y = 0;
        tri.rot.z = 0;
        tri.vert2.x = 10.0f;
        tri.vert2.y = 0.0f;
        tri.vert3.x = 0.0f;
        tri.vert3.y = 10.0f;
        tri.edge2Normal.x = -0.7071f;
        tri.edge2Normal.y = -0.7071f;
        tri.edge3Normal.x = 1.0f;
        tri.edge3Normal.y = 0.0f;
        b->itemgroupId = 0;
        collide_ball_with_tri_face(b, &tri);
        collide_ball_with_tri_edges(b, &tri);
        collide_ball_with_tri_verts(b, &tri);
        return;
    }

    stageIg = stage->itemgroups;
    for (itemgroupId = 0; itemgroupId < stage->itemgroupCount; itemgroupId++, stageIg++)
    {
        if (itemgroupId != b->itemgroupId)
            tf_physball_to_itemgroup_space(b, itemgroupId);
        cellTris = meshcoli_grid_lookup(stageIg, b->pos.x, b->pos.z);
        if (cellTris != NULL)
        {
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_face(b, &stageIg->triangles[*cellTriIdx]);
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_edges(b, &stageIg->triangles[*cellTriIdx]);
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_verts(b, &stageIg->triangles[*cellTriIdx]);
        }

        cone = stageIg->coliCones;
        for (i = stageIg->coliConeCount; i > 0; i--, cone++)
            g_collide_ball_with_cone(b, cone);

        sphere = stageIg->coliSpheres;
        for (i = stageIg->coliSphereCount; i > 0; i--, sphere++)
            g_collide_ball_with_sphere(b, sphere);

        cylinder = stageIg->coliCylinders;
        for (i = stageIg->coliCylinderCount; i > 0; i--, cylinder++)
            g_collide_ball_with_cylinder(b, cylinder);

        goal = stageIg->goals;
        for (i = stageIg->goalCount; i > 0; i--, goal++)
            g_collide_ball_with_goal(b, goal);
    }

    if (b->itemgroupId != 0)
        tf_physball_to_itemgroup_space(b, 0);
    if (dynamicStageParts != NULL)
        g_collide_ball_with_dynstageparts(b, dynamicStageParts);
}

s16 *meshcoli_grid_lookup(struct StageItemgroup *stageIg, f32 x, f32 z)
{
    int cellX;
    int cellZ;

    if (stageIg->gridCells == NULL2)
        return NULL;

    cellX = mathutil_floor((x - stageIg->gridOriginX) / stageIg->gridStepX);
    cellZ = mathutil_floor((z - stageIg->gridOriginZ) / stageIg->gridStepZ);

    if (cellX < 0 || cellX >= stageIg->gridDimX)
        return NULL;
    if (cellZ < 0 || cellZ >= stageIg->gridDimZ)
        return NULL;
    return stageIg->gridCells[cellZ * stageIg->gridDimX + cellX];
}

static inline float dumb_dot(float x1, float y1, float x2, float y2)
{
    return x1 * x2 + y1 * y2;
}

void collide_ball_with_tri_face(struct PhysicsBall *physBall, struct StageColiTri *tri)
{
    struct G_ColiHit coliHit;
    float x;
    float y;
    float z;
    Point3d pos;
    Point3d prevPos;

    // Only necessary for stack size/alignment,
    // can also be completely unused and swapped for float literals
    float upX;
    float upY;

    prevPos = physBall->prevPos;
    pos = physBall->pos;

    x = prevPos.x - tri->pos.x;
    y = prevPos.y - tri->pos.y;
    z = prevPos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z < 0.0)
        return;
    x = pos.x - tri->pos.x;
    y = pos.y - tri->pos.y;
    z = pos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z > physBall->radius)
        return;

    mathutil_mtxA_from_translate(&tri->pos);
    mathutil_mtxA_rotate_y(tri->rot.y);
    mathutil_mtxA_rotate_x(tri->rot.x);
    mathutil_mtxA_rotate_z(tri->rot.z);
    mathutil_mtxA_rigid_inv_tf_point(&prevPos, &prevPos);
    mathutil_mtxA_rigid_inv_tf_point(&pos, &pos);

    upX = 0;
    upY = 1;

    if (!(((dumb_dot(upX, upY, prevPos.x, prevPos.y) < -FLT_EPSILON) ||
           (((prevPos.x - tri->vert2.x) * tri->edge2Normal.x) +
                ((prevPos.y - tri->vert2.y) * tri->edge2Normal.y) <
            -FLT_EPSILON) ||
           (((prevPos.x - tri->vert3.x) * tri->edge3Normal.x) +
                ((prevPos.y - tri->vert3.y) * tri->edge3Normal.y) <
            -FLT_EPSILON)) &&
          ((dumb_dot(upX, upY, pos.x, pos.y) < -FLT_EPSILON) ||
           (((pos.x - tri->vert2.x) * tri->edge2Normal.x) +
                ((pos.y - tri->vert2.y) * tri->edge2Normal.y) <
            -FLT_EPSILON) ||
           (((pos.x - tri->vert3.x) * tri->edge3Normal.x) +
                ((pos.y - tri->vert3.y) * tri->edge3Normal.y) <
            -FLT_EPSILON))))
    {
        coliHit.pos = tri->pos;
        coliHit.normal = tri->normal;
        g_apply_coli_response(physBall, &coliHit);
    }
}

void collide_ball_with_tri_edges(struct PhysicsBall *physBall, struct StageColiTri *tri)
{
    struct ColiEdge edge;
    float unused1[3];
    Point3d pos;
    Point3d prevPos;
    float unused2[5];
    float x;
    float y;
    float z;

    prevPos = physBall->prevPos;
    pos = physBall->pos;

    x = prevPos.x - tri->pos.x;
    y = prevPos.y - tri->pos.y;
    z = prevPos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z < 0.0)
        return;
    x = pos.x - tri->pos.x;
    y = pos.y - tri->pos.y;
    z = pos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z > physBall->radius)
        return;

    mathutil_mtxA_from_translate(&tri->pos);
    mathutil_mtxA_rotate_y(tri->rot.y);
    mathutil_mtxA_rotate_x(tri->rot.x);
    mathutil_mtxA_rotate_z(tri->rot.z);
    mathutil_mtxA_rigid_inv_tf_point(&prevPos, &prevPos);
    mathutil_mtxA_rigid_inv_tf_point(&pos, &pos);

    x = 0;
    y = 1;
    if (((x * (pos.x) + y * (pos.y) < -physBall->radius)) &&
        (x * (prevPos.x) + y * (prevPos.y) < -physBall->radius))
        return;

    x = tri->edge2Normal.x;
    y = tri->edge2Normal.y;
    if (((x * (pos.x - tri->vert2.x) + y * (pos.y - tri->vert2.y) < -physBall->radius)) &&
        (x * (prevPos.x - tri->vert2.x) + y * (prevPos.y - tri->vert2.y) <
         -physBall->radius))
        return;

    x = tri->edge3Normal.x;
    y = tri->edge3Normal.y;
    if (((x * (pos.x - tri->vert3.x) + y * (pos.y - tri->vert3.y) < -physBall->radius)) &&
        (x * (prevPos.x - tri->vert3.x) + y * (prevPos.y - tri->vert3.y) <
         -physBall->radius))
        return;

    edge.start.x = 0;
    edge.start.y = 0;
    edge.end.x = tri->vert2.x;
    edge.end.y = tri->vert2.y;
    edge.normal.x = 0;
    edge.normal.y = 1;
    collide_ball_with_tri_edge(physBall, &pos, &prevPos, &edge);

    edge.start.x = tri->vert2.x;
    edge.start.y = tri->vert2.y;
    edge.end.x = tri->vert3.x;
    edge.end.y = tri->vert3.y;
    edge.normal.x = tri->edge2Normal.x;
    edge.normal.y = tri->edge2Normal.y;
    collide_ball_with_tri_edge(physBall, &pos, &prevPos, &edge);

    edge.start.x = tri->vert3.x;
    edge.start.y = tri->vert3.y;
    edge.end.x = 0;
    edge.end.y = 0;
    edge.normal.x = tri->edge3Normal.x;
    edge.normal.y = tri->edge3Normal.y;
    collide_ball_with_tri_edge(physBall, &pos, &prevPos, &edge);
}

void collide_ball_with_tri_edge(struct PhysicsBall *physBall, Point3d *ballPos_rt_tri, Point3d *ballPrevPos_rt_tri,
                  struct ColiEdge *edge)
{
    f32 tempp_f1_2;
    f32 tempp_f1_3;
    f32 phi_f1;
    f32 phi_f1_2;
    f32 someY;
    struct G_ColiHit coliHit;
    Point3d ballPrevPos_rt_edge;
    Point3d ballPos_rt_edge;
    Point3d edgeEnd_rt_edge;
    Vec vec;

    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate_xyz(edge->start.x, edge->start.y, 0);
    mathutil_mtxA_rotate_z(-mathutil_atan2(edge->normal.x, edge->normal.y));
    mathutil_mtxA_rigid_inv_tf_point(ballPrevPos_rt_tri, &ballPrevPos_rt_edge);
    mathutil_mtxA_rigid_inv_tf_point(ballPos_rt_tri, &ballPos_rt_edge);
    edgeEnd_rt_edge.x = edge->end.x;
    edgeEnd_rt_edge.y = edge->end.y;
    edgeEnd_rt_edge.z = 0;
    mathutil_mtxA_rigid_inv_tf_point(&edgeEnd_rt_edge, &edgeEnd_rt_edge);

    vec.y = ballPos_rt_edge.y - ballPrevPos_rt_edge.y;
    vec.z = ballPos_rt_edge.z - ballPrevPos_rt_edge.z;
    mathutil_mtxA_rotate_x(-mathutil_atan2(vec.y, vec.z) - 0x8000);
    mathutil_mtxA_rigid_inv_tf_point(ballPos_rt_tri, &ballPos_rt_edge);
    mathutil_mtxA_rigid_inv_tf_point(ballPrevPos_rt_tri, &ballPrevPos_rt_edge);

    // radius = physBall->radius;
    someY = ballPos_rt_edge.y;
    if (__fabs(someY) > physBall->radius)
    {
        mathutil_mtxA_pop();
        return;
    }
    phi_f1 = mathutil_sqrt((physBall->radius * physBall->radius) -
                           (ballPos_rt_edge.y * ballPos_rt_edge.y));
    if (__fabs(ballPos_rt_edge.z) > phi_f1)
    {
        mathutil_mtxA_pop();
        return;
    }
    if (ballPrevPos_rt_edge.z < 0.0)
        phi_f1 = -phi_f1;
    vec.x = 0;
    vec.y = someY;
    vec.z = phi_f1;
    if ((ballPrevPos_rt_edge.z > phi_f1) && (ballPos_rt_edge.z < phi_f1))
    {
        phi_f1_2 = ballPrevPos_rt_edge.x +
                   ((ballPos_rt_edge.x - ballPrevPos_rt_edge.x) *
                    ((phi_f1 - ballPrevPos_rt_edge.z) / (ballPos_rt_edge.z - ballPrevPos_rt_edge.z)));
    }
    else
        phi_f1_2 = ballPos_rt_edge.x;

    if ((phi_f1_2 < 0.0) || (phi_f1_2 > edgeEnd_rt_edge.x))
    {
        mathutil_mtxA_pop();
        return;
    }
    tempp_f1_2 = mathutil_sum_of_sq(vec.y, vec.z);
    if (tempp_f1_2 <= FLT_EPSILON)
    {
        mathutil_mtxA_pop();
        return;
    }

    tempp_f1_3 = mathutil_rsqrt(tempp_f1_2);
    vec.y *= tempp_f1_3;
    vec.z *= tempp_f1_3;
    mathutil_mtxA_tf_vec(&vec, &coliHit.normal);

    mathutil_mtxA_get_translate_alt(&coliHit.pos);

    mathutil_mtxA_pop();
    mathutil_mtxA_tf_vec(&coliHit.normal, &coliHit.normal);
    mathutil_mtxA_tf_point(&coliHit.pos, &coliHit.pos);
    g_apply_coli_response(physBall, &coliHit);
}