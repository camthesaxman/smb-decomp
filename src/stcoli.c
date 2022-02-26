
#include <math.h>
#include <stddef.h>

#include "global.h"
#include "mathutil.h"
#include "stage.h"
#include "stcoli.h"
#include "types.h"

void g_collide_ball_with_stage(struct PhysicsBall *b, struct Stage *arg1)
{
    struct StageColiTri tri;
    struct StageItemgroup *collHdr;
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
        tri.vert1.x = 0.0f;
        tri.vert1.y = 0.0f;
        tri.vert1.z = 0.0f;
        tri.normal.x = 0.0f;
        tri.normal.y = 1.0f;
        tri.normal.z = 0.0f;
        tri.rotFromXY.x = -0x4000;
        tri.rotFromXY.y = 0;
        tri.rotFromXY.z = 0;
        tri.vert2Delta.x = 10.0f;
        tri.vert2Delta.y = 0.0f;
        tri.vert3Delta.x = 0.0f;
        tri.vert3Delta.y = 10.0f;
        tri.tangent.x = -0.7071f;
        tri.tangent.y = -0.7071f;
        tri.bitangent.x = 1.0f;
        tri.bitangent.y = 0.0f;
        b->itemgroupId = 0;
        g_collide_ball_with_tri_face(b, &tri);
        g_collide_ball_with_tri_edges(b, &tri);
        g_collide_ball_with_tri_verts(b, &tri);
        return;
    }

    collHdr = arg1->itemgroups;
    for (itemgroupId = 0; itemgroupId < arg1->itemgroupCount; itemgroupId++, collHdr++)
    {
        if (itemgroupId != b->itemgroupId)
            tf_physball_to_itemgroup_space(b, itemgroupId);
        cellTris = meshcoli_grid_lookup(collHdr, b->pos.x, b->pos.z);
        if (cellTris != NULL)
        {
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                g_collide_ball_with_tri_face(b, &collHdr->triangles[*cellTriIdx]);
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                g_collide_ball_with_tri_edges(b, &collHdr->triangles[*cellTriIdx]);
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                g_collide_ball_with_tri_verts(b, &collHdr->triangles[*cellTriIdx]);
        }

        cone = collHdr->coliCones;
        for (i = collHdr->coliConeCount; i > 0; i--, cone++)
            g_collide_ball_with_cone(b, cone);

        sphere = collHdr->coliSpheres;
        for (i = collHdr->coliSphereCount; i > 0; i--, sphere++)
            g_collide_ball_with_sphere(b, sphere);

        cylinder = collHdr->coliCylinders;
        for (i = collHdr->coliCylinderCount; i > 0; i--, cylinder++)
            g_collide_ball_with_cylinder(b, cylinder);

        goal = collHdr->goals;
        for (i = collHdr->goalCount; i > 0; i--, goal++)
            g_collide_ball_with_goal(b, goal);
    }

    if (b->itemgroupId != 0)
        tf_physball_to_itemgroup_space(b, 0);
    if (dynamicStageParts != NULL)
        g_collide_ball_with_dynstageparts(b, dynamicStageParts);
}

s16 *meshcoli_grid_lookup(struct StageItemgroup *coliHeader, f32 x, f32 z)
{
    int cellX;
    int cellZ;

    if (coliHeader->gridCells == NULL2)
        return NULL;

    cellX = mathutil_floor((x - coliHeader->gridOriginX) / coliHeader->gridStepX);
    cellZ = mathutil_floor((z - coliHeader->gridOriginZ) / coliHeader->gridStepZ);

    if (cellX < 0 || cellX >= coliHeader->gridDimX)
        return NULL;
    if (cellZ < 0 || cellZ >= coliHeader->gridDimZ)
        return NULL;
    return coliHeader->gridCells[cellZ * coliHeader->gridDimX + cellX];
}

static inline float dumb_dot(float x1, float y1, float x2, float y2)
{
    return x1 * x2 + y1 * y2;
}

void g_collide_ball_with_tri_face(struct PhysicsBall *physBall, struct StageColiTri *tri)
{
    struct G_ColiHit coliHit;
    float x;
    float y;
    float z;
    Vec pos;
    Vec prevPos;

    // Only necessary for stack size/alignment,
    // can also be completely unused and swapped for float literals
    float upX;
    float upY;

    prevPos = physBall->prevPos;
    pos = physBall->pos;

    x = prevPos.x - tri->vert1.x;
    y = prevPos.y - tri->vert1.y;
    z = prevPos.z - tri->vert1.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z < 0.0)
        return;
    x = pos.x - tri->vert1.x;
    y = pos.y - tri->vert1.y;
    z = pos.z - tri->vert1.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z > physBall->radius)
        return;

    mathutil_mtxA_from_translate(&tri->vert1);
    mathutil_mtxA_rotate_y(tri->rotFromXY.y);
    mathutil_mtxA_rotate_x(tri->rotFromXY.x);
    mathutil_mtxA_rotate_z(tri->rotFromXY.z);
    mathutil_mtxA_rigid_inv_tf_point(&prevPos, &prevPos);
    mathutil_mtxA_rigid_inv_tf_point(&pos, &pos);

    upX = 0;
    upY = 1;

    if (!(((dumb_dot(upX, upY, prevPos.x, prevPos.y) < -FLT_EPSILON) ||
           (((prevPos.x - tri->vert2Delta.x) * tri->tangent.x) +
                ((prevPos.y - tri->vert2Delta.y) * tri->tangent.y) <
            -FLT_EPSILON) ||
           (((prevPos.x - tri->vert3Delta.x) * tri->bitangent.x) +
                ((prevPos.y - tri->vert3Delta.y) * tri->bitangent.y) <
            -FLT_EPSILON)) &&
          ((dumb_dot(upX, upY, pos.x, pos.y) < -FLT_EPSILON) ||
           (((pos.x - tri->vert2Delta.x) * tri->tangent.x) +
                ((pos.y - tri->vert2Delta.y) * tri->tangent.y) <
            -FLT_EPSILON) ||
           (((pos.x - tri->vert3Delta.x) * tri->bitangent.x) +
                ((pos.y - tri->vert3Delta.y) * tri->bitangent.y) <
            -FLT_EPSILON))))
    {
        coliHit.pos = tri->vert1;
        coliHit.normal = tri->normal;
        g_apply_coli_response(physBall, &coliHit);
    }
}

void g_collide_ball_with_tri_edges(struct PhysicsBall *physBall, struct StageColiTri *tri)
{
    struct ColiEdge edge;
    float unused1[3];
    Vec pos;
    Vec prevPos;
    float unused2[5];
    float x;
    float y;
    float z;

    prevPos = physBall->prevPos;
    pos = physBall->pos;

    x = prevPos.x - tri->vert1.x;
    y = prevPos.y - tri->vert1.y;
    z = prevPos.z - tri->vert1.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z < 0.0)
        return;
    x = pos.x - tri->vert1.x;
    y = pos.y - tri->vert1.y;
    z = pos.z - tri->vert1.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z > physBall->radius)
        return;

    mathutil_mtxA_from_translate(&tri->vert1);
    mathutil_mtxA_rotate_y(tri->rotFromXY.y);
    mathutil_mtxA_rotate_x(tri->rotFromXY.x);
    mathutil_mtxA_rotate_z(tri->rotFromXY.z);
    mathutil_mtxA_rigid_inv_tf_point(&prevPos, &prevPos);
    mathutil_mtxA_rigid_inv_tf_point(&pos, &pos);

    x = 0;
    y = 1;
    if (((x * (pos.x) + y * (pos.y) < -physBall->radius)) &&
        (x * (prevPos.x) + y * (prevPos.y) < -physBall->radius))
        return;

    x = tri->tangent.x;
    y = tri->tangent.y;
    if (((x * (pos.x - tri->vert2Delta.x) + y * (pos.y - tri->vert2Delta.y) < -physBall->radius)) &&
        (x * (prevPos.x - tri->vert2Delta.x) + y * (prevPos.y - tri->vert2Delta.y) <
         -physBall->radius))
        return;

    x = tri->bitangent.x;
    y = tri->bitangent.y;
    if (((x * (pos.x - tri->vert3Delta.x) + y * (pos.y - tri->vert3Delta.y) < -physBall->radius)) &&
        (x * (prevPos.x - tri->vert3Delta.x) + y * (prevPos.y - tri->vert3Delta.y) <
         -physBall->radius))
        return;

    edge.start.x = 0;
    edge.start.y = 0;
    edge.end.x = tri->vert2Delta.x;
    edge.end.y = tri->vert2Delta.y;
    edge.normal.x = 0;
    edge.normal.y = 1;
    stcoli_sub05(physBall, &pos, &prevPos, &edge);

    edge.start.x = tri->vert2Delta.x;
    edge.start.y = tri->vert2Delta.y;
    edge.end.x = tri->vert3Delta.x;
    edge.end.y = tri->vert3Delta.y;
    edge.normal.x = tri->tangent.x;
    edge.normal.y = tri->tangent.y;
    stcoli_sub05(physBall, &pos, &prevPos, &edge);

    edge.start.x = tri->vert3Delta.x;
    edge.start.y = tri->vert3Delta.y;
    edge.end.x = 0;
    edge.end.y = 0;
    edge.normal.x = tri->bitangent.x;
    edge.normal.y = tri->bitangent.y;
    stcoli_sub05(physBall, &pos, &prevPos, &edge);
}

void stcoli_sub05(struct PhysicsBall *physBall, Point3d *ballPos_rtTri, Point3d *ballPrevPos_rtTri,
                  struct ColiEdge *edge)
{
    f32 tempp_f1_2;
    f32 tempp_f1_3;
    f32 phi_f1;
    f32 phi_f1_2;
    f32 someY;
    struct G_ColiHit coliHit;
    Point3d ballPrevPos_rtEdge;
    Point3d ballPos_rtEdge;
    Point3d edgeEnd_rtEdge;
    Vec vec;

    mathutil_mtxA_push();
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate_xyz(edge->start.x, edge->start.y, 0);
    mathutil_mtxA_rotate_z(-mathutil_atan2(edge->normal.x, edge->normal.y));
    mathutil_mtxA_rigid_inv_tf_point(ballPrevPos_rtTri, &ballPrevPos_rtEdge);
    mathutil_mtxA_rigid_inv_tf_point(ballPos_rtTri, &ballPos_rtEdge);
    edgeEnd_rtEdge.x = edge->end.x;
    edgeEnd_rtEdge.y = edge->end.y;
    edgeEnd_rtEdge.z = 0;
    mathutil_mtxA_rigid_inv_tf_point(&edgeEnd_rtEdge, &edgeEnd_rtEdge);

    vec.y = ballPos_rtEdge.y - ballPrevPos_rtEdge.y;
    vec.z = ballPos_rtEdge.z - ballPrevPos_rtEdge.z;
    mathutil_mtxA_rotate_x(-mathutil_atan2(vec.y, vec.z) - 0x8000);
    mathutil_mtxA_rigid_inv_tf_point(ballPos_rtTri, &ballPos_rtEdge);
    mathutil_mtxA_rigid_inv_tf_point(ballPrevPos_rtTri, &ballPrevPos_rtEdge);

    // radius = physBall->radius;
    someY = ballPos_rtEdge.y;
    if (__fabs(someY) > physBall->radius)
    {
        mathutil_mtxA_pop();
        return;
    }
    phi_f1 = mathutil_sqrt((physBall->radius * physBall->radius) -
                           (ballPos_rtEdge.y * ballPos_rtEdge.y));
    if (__fabs(ballPos_rtEdge.z) > phi_f1)
    {
        mathutil_mtxA_pop();
        return;
    }
    if (ballPrevPos_rtEdge.z < 0.0)
        phi_f1 = -phi_f1;
    vec.x = 0;
    vec.y = someY;
    vec.z = phi_f1;
    if ((ballPrevPos_rtEdge.z > phi_f1) && (ballPos_rtEdge.z < phi_f1))
    {
        phi_f1_2 = ballPrevPos_rtEdge.x +
                   ((ballPos_rtEdge.x - ballPrevPos_rtEdge.x) *
                    ((phi_f1 - ballPrevPos_rtEdge.z) / (ballPos_rtEdge.z - ballPrevPos_rtEdge.z)));
    }
    else
        phi_f1_2 = ballPos_rtEdge.x;

    if ((phi_f1_2 < 0.0) || (phi_f1_2 > edgeEnd_rtEdge.x))
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

    mathutil_get_mtxA_translate_alt(&coliHit.pos);

    mathutil_mtxA_pop();
    mathutil_mtxA_tf_vec(&coliHit.normal, &coliHit.normal);
    mathutil_mtxA_tf_point(&coliHit.pos, &coliHit.pos);
    g_apply_coli_response(physBall, &coliHit);
}