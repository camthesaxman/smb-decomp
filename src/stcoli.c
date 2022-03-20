
#include <math.h>
#include <stddef.h>

#include "global.h"
#include "mathutil.h"
#include "stage.h"
#include "stcoli.h"
#include "types.h"
#include "variables.h"

void collide_ball_with_stage(struct PhysicsBall *ball, struct Stage *stage)
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
        ball->itemgroupId = 0;
        collide_ball_with_tri_face(ball, &tri);
        collide_ball_with_tri_edges(ball, &tri);
        collide_ball_with_tri_verts(ball, &tri);
        return;
    }

    stageIg = stage->itemgroups;
    for (itemgroupId = 0; itemgroupId < stage->itemgroupCount; itemgroupId++, stageIg++)
    {
        if (itemgroupId != ball->itemgroupId)
            tf_physball_to_itemgroup_space(ball, itemgroupId);
        cellTris = coligrid_lookup(stageIg, ball->pos.x, ball->pos.z);
        if (cellTris != NULL)
        {
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_face(ball, &stageIg->triangles[*cellTriIdx]);
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_edges(ball, &stageIg->triangles[*cellTriIdx]);
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_verts(ball, &stageIg->triangles[*cellTriIdx]);
        }

        cone = stageIg->coliCones;
        for (i = stageIg->coliConeCount; i > 0; i--, cone++)
            collide_ball_with_cone(ball, cone);

        sphere = stageIg->coliSpheres;
        for (i = stageIg->coliSphereCount; i > 0; i--, sphere++)
            collide_ball_with_sphere(ball, sphere);

        cylinder = stageIg->coliCylinders;
        for (i = stageIg->coliCylinderCount; i > 0; i--, cylinder++)
            collide_ball_with_cylinder(ball, cylinder);

        goal = stageIg->goals;
        for (i = stageIg->goalCount; i > 0; i--, goal++)
            collide_ball_with_goal(ball, goal);
    }

    if (ball->itemgroupId != 0)
        tf_physball_to_itemgroup_space(ball, 0);
    if (dynamicStageParts != NULL)
        g_collide_ball_with_dynstageparts(ball, dynamicStageParts);
}

s16 *coligrid_lookup(struct StageItemgroup *stageIg, f32 x, f32 z)
{
    int cellX;
    int cellZ;

    if (stageIg->gridCellTris == NULL2)
        return NULL;

    cellX = mathutil_floor((x - stageIg->gridOriginX) / stageIg->gridStepX);
    cellZ = mathutil_floor((z - stageIg->gridOriginZ) / stageIg->gridStepZ);

    if (cellX < 0 || cellX >= stageIg->gridCellCountX)
        return NULL;
    if (cellZ < 0 || cellZ >= stageIg->gridCellCountZ)
        return NULL;
    return stageIg->gridCellTris[cellZ * stageIg->gridCellCountX + cellX];
}

static inline float dumb_dot(float x1, float y1, float x2, float y2)
{
    return x1 * x2 + y1 * y2;
}

void collide_ball_with_tri_face(struct PhysicsBall *ball, struct StageColiTri *tri)
{
    struct ColiPlane plane;
    float x;
    float y;
    float z;
    Point3d pos;
    Point3d prevPos;
    u8 unused[8];

    prevPos = ball->prevPos;
    pos = ball->pos;

    x = prevPos.x - tri->pos.x;
    y = prevPos.y - tri->pos.y;
    z = prevPos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z < 0.0)
        return;
    x = pos.x - tri->pos.x;
    y = pos.y - tri->pos.y;
    z = pos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z > ball->radius)
        return;

    mathutil_mtxA_from_translate(&tri->pos);
    mathutil_mtxA_rotate_y(tri->rot.y);
    mathutil_mtxA_rotate_x(tri->rot.x);
    mathutil_mtxA_rotate_z(tri->rot.z);
    mathutil_mtxA_rigid_inv_tf_point(&prevPos, &prevPos);
    mathutil_mtxA_rigid_inv_tf_point(&pos, &pos);

    if (!(((dumb_dot(0, 1, prevPos.x, prevPos.y) < -FLT_EPSILON) ||
           (((prevPos.x - tri->vert2.x) * tri->edge2Normal.x) +
                ((prevPos.y - tri->vert2.y) * tri->edge2Normal.y) <
            -FLT_EPSILON) ||
           (((prevPos.x - tri->vert3.x) * tri->edge3Normal.x) +
                ((prevPos.y - tri->vert3.y) * tri->edge3Normal.y) <
            -FLT_EPSILON)) &&
          ((dumb_dot(0, 1, pos.x, pos.y) < -FLT_EPSILON) ||
           (((pos.x - tri->vert2.x) * tri->edge2Normal.x) +
                ((pos.y - tri->vert2.y) * tri->edge2Normal.y) <
            -FLT_EPSILON) ||
           (((pos.x - tri->vert3.x) * tri->edge3Normal.x) +
                ((pos.y - tri->vert3.y) * tri->edge3Normal.y) <
            -FLT_EPSILON))))
    {
        plane.point = tri->pos;
        plane.normal = tri->normal;
        collide_ball_with_plane(ball, &plane);
    }
}

void collide_ball_with_tri_edges(struct PhysicsBall *ball, struct StageColiTri *tri)
{
    struct ColiEdge edge;
    u8 unused1[12];
    Point3d pos;
    Point3d prevPos;
    u8 unused2[20];
    float x;
    float y;
    float z;

    prevPos = ball->prevPos;
    pos = ball->pos;

    x = prevPos.x - tri->pos.x;
    y = prevPos.y - tri->pos.y;
    z = prevPos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z < 0.0)
        return;
    x = pos.x - tri->pos.x;
    y = pos.y - tri->pos.y;
    z = pos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z > ball->radius)
        return;

    mathutil_mtxA_from_translate(&tri->pos);
    mathutil_mtxA_rotate_y(tri->rot.y);
    mathutil_mtxA_rotate_x(tri->rot.x);
    mathutil_mtxA_rotate_z(tri->rot.z);
    mathutil_mtxA_rigid_inv_tf_point(&prevPos, &prevPos);
    mathutil_mtxA_rigid_inv_tf_point(&pos, &pos);

    x = 0;
    y = 1;
    if (((x * (pos.x) + y * (pos.y) < -ball->radius)) &&
        (x * (prevPos.x) + y * (prevPos.y) < -ball->radius))
        return;

    x = tri->edge2Normal.x;
    y = tri->edge2Normal.y;
    if (((x * (pos.x - tri->vert2.x) + y * (pos.y - tri->vert2.y) < -ball->radius)) &&
        (x * (prevPos.x - tri->vert2.x) + y * (prevPos.y - tri->vert2.y) < -ball->radius))
        return;

    x = tri->edge3Normal.x;
    y = tri->edge3Normal.y;
    if (((x * (pos.x - tri->vert3.x) + y * (pos.y - tri->vert3.y) < -ball->radius)) &&
        (x * (prevPos.x - tri->vert3.x) + y * (prevPos.y - tri->vert3.y) < -ball->radius))
        return;

    edge.start.x = 0;
    edge.start.y = 0;
    edge.end.x = tri->vert2.x;
    edge.end.y = tri->vert2.y;
    edge.normal.x = 0;
    edge.normal.y = 1;
    collide_ball_with_tri_edge(ball, &pos, &prevPos, &edge);

    edge.start.x = tri->vert2.x;
    edge.start.y = tri->vert2.y;
    edge.end.x = tri->vert3.x;
    edge.end.y = tri->vert3.y;
    edge.normal.x = tri->edge2Normal.x;
    edge.normal.y = tri->edge2Normal.y;
    collide_ball_with_tri_edge(ball, &pos, &prevPos, &edge);

    edge.start.x = tri->vert3.x;
    edge.start.y = tri->vert3.y;
    edge.end.x = 0;
    edge.end.y = 0;
    edge.normal.x = tri->edge3Normal.x;
    edge.normal.y = tri->edge3Normal.y;
    collide_ball_with_tri_edge(ball, &pos, &prevPos, &edge);
}

void collide_ball_with_tri_edge(struct PhysicsBall *ball, Point3d *ballPos_rt_tri,
                                Point3d *ballPrevPos_rt_tri, struct ColiEdge *edge)
{
    f32 tempp_f1_2;
    f32 tempp_f1_3;
    f32 phi_f1;
    f32 phi_f1_2;
    f32 someY;
    struct ColiPlane plane;
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
    if (__fabs(someY) > ball->radius)
    {
        mathutil_mtxA_pop();
        return;
    }
    phi_f1 = mathutil_sqrt((ball->radius * ball->radius) - (ballPos_rt_edge.y * ballPos_rt_edge.y));
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
        phi_f1_2 =
            ballPrevPos_rt_edge.x +
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
    tempp_f1_2 = mathutil_sum_of_sq_2(vec.y, vec.z);
    if (tempp_f1_2 <= FLT_EPSILON)
    {
        mathutil_mtxA_pop();
        return;
    }

    tempp_f1_3 = mathutil_rsqrt(tempp_f1_2);
    vec.y *= tempp_f1_3;
    vec.z *= tempp_f1_3;
    mathutil_mtxA_tf_vec(&vec, &plane.normal);

    mathutil_mtxA_get_translate_alt(&plane.point);

    mathutil_mtxA_pop();
    mathutil_mtxA_tf_vec(&plane.normal, &plane.normal);
    mathutil_mtxA_tf_point(&plane.point, &plane.point);
    collide_ball_with_plane(ball, &plane);
}

void collide_ball_with_tri_verts(struct PhysicsBall *ball, struct StageColiTri *tri)
{
    u8 unused1[16];
    Point3d pos;     // 0x34, 0x38, 0x3c
    Point3d prevPos; // 0x28, 0x2c, 0x30
    u8 unused2[4];
    Point2d vert; // 0x1c, 0x20

    float x;
    float y;
    float z;

    prevPos = ball->prevPos;
    x = prevPos.x - tri->pos.x;
    y = prevPos.y - tri->pos.y;
    z = prevPos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z < 0.0)
        return;

    pos = ball->pos;
    x = pos.x - tri->pos.x;
    y = pos.y - tri->pos.y;
    z = pos.z - tri->pos.z;
    if (x * tri->normal.x + y * tri->normal.y + z * tri->normal.z > ball->radius)
        return;

    mathutil_mtxA_from_translate(&tri->pos);
    mathutil_mtxA_rotate_y(tri->rot.y);
    mathutil_mtxA_rotate_x(tri->rot.x);
    mathutil_mtxA_rotate_z(tri->rot.z);
    mathutil_mtxA_rigid_inv_tf_point(&prevPos, &prevPos);
    mathutil_mtxA_rigid_inv_tf_point(&pos, &pos);

    vert.x = 0;
    vert.y = 0;
    collide_ball_with_tri_vert(ball, &pos, &vert);
    vert.x = tri->vert2.x;
    vert.y = tri->vert2.y;
    collide_ball_with_tri_vert(ball, &pos, &vert);
    vert.x = tri->vert3.x;
    vert.y = tri->vert3.y;
    collide_ball_with_tri_vert(ball, &pos, &vert);
}

void collide_ball_with_tri_vert(struct PhysicsBall *ball, Point3d *ballPos_rt_tri,
                                Point2d *vert_rt_tri)
{
    struct ColiPlane plane;
    Vec tmpVec;
    f32 distSq;
    f32 inverseDist;

    tmpVec.x = ballPos_rt_tri->x - vert_rt_tri->x;
    tmpVec.y = ballPos_rt_tri->y - vert_rt_tri->y;
    tmpVec.z = ballPos_rt_tri->z;
    distSq = mathutil_sum_of_sq_3(tmpVec.x, tmpVec.y, tmpVec.z);
    if (!(distSq > (ball->radius * ball->radius)) && !(distSq <= FLT_EPSILON))
    {
        inverseDist = mathutil_rsqrt(distSq);
        tmpVec.x *= inverseDist;
        tmpVec.y *= inverseDist;
        tmpVec.z *= inverseDist;
        mathutil_mtxA_tf_vec(&tmpVec, &plane.normal);

        tmpVec.x = vert_rt_tri->x;
        tmpVec.y = vert_rt_tri->y;
        tmpVec.z = 0;
        mathutil_mtxA_tf_point(&tmpVec, &plane.point);

        mathutil_mtxA_push();
        collide_ball_with_plane(ball, &plane);
        mathutil_mtxA_pop();
    }
}

void collide_ball_with_rect(struct PhysicsBall *ball, struct ColiRect *rect)
{
    struct ColiPlane plane;
    Point3d pos;
    Point3d prevPos;
    Vec tmpVec;
    Vec pos_rt_rect;

    float ballEdgeDistSq;
    float invBallEdgeDist;
    float halfWidth;
    float halfHeight;

    prevPos = ball->prevPos;
    tmpVec.x = prevPos.x - rect->pos.x;
    tmpVec.y = prevPos.y - rect->pos.y;
    tmpVec.z = prevPos.z - rect->pos.z;
    if (tmpVec.x * rect->normal.x + tmpVec.y * rect->normal.y + tmpVec.z * rect->normal.z < 0.0)
        return;

    pos = ball->pos;
    tmpVec.x = pos.x - rect->pos.x;
    tmpVec.y = pos.y - rect->pos.y;
    tmpVec.z = pos.z - rect->pos.z;
    if (tmpVec.x * rect->normal.x + tmpVec.y * rect->normal.y + tmpVec.z * rect->normal.z >
        ball->radius)
        return;

    mathutil_mtxA_from_translate(&rect->pos);
    mathutil_mtxA_rotate_y(mathutil_atan2(rect->normal.x, rect->normal.z));
    mathutil_mtxA_rotate_x(-mathutil_atan2(
        rect->normal.y, mathutil_sqrt(mathutil_sum_of_sq_2(rect->normal.x, rect->normal.z))));
    mathutil_mtxA_rigid_inv_tf_point(&pos, &pos_rt_rect);

    halfWidth = 0.5 * rect->width;
    halfHeight = 0.5 * rect->height;

    if (pos_rt_rect.x < -halfWidth - ball->radius)
        return;
    if (pos_rt_rect.x > halfWidth + ball->radius)
        return;
    if (pos_rt_rect.y < -halfHeight - ball->radius)
        return;
    if (pos_rt_rect.y > halfHeight + ball->radius)
        return;

    if (pos_rt_rect.x < -halfWidth)
    {
        tmpVec.x = pos_rt_rect.x + halfWidth;
        tmpVec.z = pos_rt_rect.z;
        ballEdgeDistSq = mathutil_sum_of_sq_2(tmpVec.x, tmpVec.z);
        if (!(ballEdgeDistSq > (ball->radius * ball->radius)))
        {
            if (ballEdgeDistSq > FLT_EPSILON)
            {
                invBallEdgeDist = mathutil_rsqrt(ballEdgeDistSq);
                tmpVec.x *= invBallEdgeDist;
                tmpVec.y = 0;
                tmpVec.z *= invBallEdgeDist;
            }
            else
            {
                tmpVec.x = -1;
                tmpVec.y = 0;
                tmpVec.z = 0;
            }
            mathutil_mtxA_tf_vec(&tmpVec, &plane.normal);
            tmpVec.x = -halfWidth;
            tmpVec.y = 0;
            tmpVec.z = 0;
            mathutil_mtxA_tf_point(&tmpVec, &plane.point);
            collide_ball_with_plane(ball, &plane);
        }
    }
    else if (pos_rt_rect.x > halfWidth)
    {
        tmpVec.x = pos_rt_rect.x - halfWidth;
        tmpVec.z = pos_rt_rect.z;
        ballEdgeDistSq = mathutil_sum_of_sq_2(tmpVec.x, tmpVec.z);
        if (!(ballEdgeDistSq > (ball->radius * ball->radius)))
        {
            if (ballEdgeDistSq > FLT_EPSILON)
            {
                invBallEdgeDist = mathutil_rsqrt(ballEdgeDistSq);
                tmpVec.x *= invBallEdgeDist;
                tmpVec.y = 0;
                tmpVec.z *= invBallEdgeDist;
            }
            else
            {
                tmpVec.x = 1;
                tmpVec.y = 0;
                tmpVec.z = 0;
            }
            mathutil_mtxA_tf_vec(&tmpVec, &plane.normal);
            tmpVec.x = halfWidth;
            tmpVec.y = 0;
            tmpVec.z = 0;
            mathutil_mtxA_tf_point(&tmpVec, &plane.point);
            collide_ball_with_plane(ball, &plane);
        }
    }
    else if (pos_rt_rect.y < -halfHeight)
    {
        tmpVec.y = pos_rt_rect.y + halfHeight;
        tmpVec.z = pos_rt_rect.z;
        ballEdgeDistSq = mathutil_sum_of_sq_2(tmpVec.y, tmpVec.z);
        if (!(ballEdgeDistSq > (ball->radius * ball->radius)))
        {
            if (ballEdgeDistSq > FLT_EPSILON)
            {
                invBallEdgeDist = mathutil_rsqrt(ballEdgeDistSq);
                tmpVec.x = 0;
                tmpVec.y *= invBallEdgeDist;
                tmpVec.z *= invBallEdgeDist;
            }
            else
            {
                tmpVec.x = 0;
                tmpVec.y = -1;
                tmpVec.z = 0;
            }
            mathutil_mtxA_tf_vec(&tmpVec, &plane.normal);
            tmpVec.x = 0;
            tmpVec.y = -halfHeight;
            tmpVec.z = 0;
            mathutil_mtxA_tf_point(&tmpVec, &plane.point);
            collide_ball_with_plane(ball, &plane);
        }
    }
    else if (pos_rt_rect.y > halfHeight)
    {
        tmpVec.y = pos_rt_rect.y - halfHeight;
        tmpVec.z = pos_rt_rect.z;
        ballEdgeDistSq = mathutil_sum_of_sq_2(tmpVec.y, tmpVec.z);
        if (!(ballEdgeDistSq > (ball->radius * ball->radius)))
        {
            if (ballEdgeDistSq > FLT_EPSILON)
            {
                invBallEdgeDist = mathutil_rsqrt(ballEdgeDistSq);
                tmpVec.x = 0;
                tmpVec.y *= invBallEdgeDist;
                tmpVec.z *= invBallEdgeDist;
            }
            else
            {
                tmpVec.x = 0;
                tmpVec.y = 1;
                tmpVec.z = 0;
            }
            mathutil_mtxA_tf_vec(&tmpVec, &plane.normal);
            tmpVec.x = 0;
            tmpVec.y = halfHeight;
            tmpVec.z = 0;
            mathutil_mtxA_tf_point(&tmpVec, &plane.point);
            collide_ball_with_plane(ball, &plane);
        }
    }
    else if (pos_rt_rect.x < -halfWidth || pos_rt_rect.x > halfWidth)
        return;
    else if (pos_rt_rect.y < -halfHeight || pos_rt_rect.y > halfHeight)
        return;
    else
    {
        plane.point = rect->pos;
        plane.normal = rect->normal;
        collide_ball_with_plane(ball, &plane);
    }
}

void collide_ball_with_cylinder(struct PhysicsBall *ball, struct StageColiCylinder *cylinder)
{
    struct ColiPlane plane;
    Vec tmpVec;
    Point3d sp4C;
    Point3d rayOrigin_rt_tri_sp40;
    struct ColiCircle topCircle;
    struct ColiCircle bottomCircle;

    f32 temp_f0_3;
    f32 temp_f0_4;
    f32 temp_f1_4;
    f32 temp_f2_2;
    f32 ballCylDistSq;

    tmpVec.x = ball->pos.x - cylinder->pos.x;
    tmpVec.y = ball->pos.y - cylinder->pos.y;
    tmpVec.z = ball->pos.z - cylinder->pos.z;
    ballCylDistSq = mathutil_sum_of_sq_3(tmpVec.x, tmpVec.y, tmpVec.z);
    temp_f0_3 =
        ball->radius + mathutil_sqrt(mathutil_sum_of_sq_2(cylinder->radius, cylinder->height));
    if (ballCylDistSq > (temp_f0_3 * temp_f0_3))
        return;
    mathutil_mtxA_from_translate(&cylinder->pos);
    mathutil_mtxA_rotate_z(cylinder->rot.z);
    mathutil_mtxA_rotate_y(cylinder->rot.y);
    mathutil_mtxA_rotate_x(cylinder->rot.x);
    mathutil_mtxA_rigid_inv_tf_point(&ball->pos, &sp4C);
    mathutil_mtxA_rigid_inv_tf_point(&ball->prevPos, &rayOrigin_rt_tri_sp40);
    temp_f2_2 = mathutil_sum_of_sq_2(sp4C.x, sp4C.z);
    temp_f0_4 = cylinder->radius + ball->radius;
    if (temp_f2_2 > (temp_f0_4 * temp_f0_4))
        return;
    if (temp_f2_2 < FLT_EPSILON)
        return;

    if (rayOrigin_rt_tri_sp40.y < (0.5 * -cylinder->height))
    {
        topCircle.pos.x = 0.0f;
        topCircle.pos.y = (0.5 * -cylinder->height);
        topCircle.pos.z = 0.0f;
        mathutil_mtxA_tf_point(&topCircle.pos, &topCircle.pos);
        topCircle.radius = cylinder->radius;
        topCircle.rot.x = cylinder->rot.x - 0x8000;
        topCircle.rot.y = cylinder->rot.y;
        topCircle.rot.z = cylinder->rot.z;
        collide_ball_with_circle(ball, &topCircle);
        return;
    }
    if (rayOrigin_rt_tri_sp40.y > (0.5 * cylinder->height))
    {
        bottomCircle.pos.x = 0.0f;
        bottomCircle.pos.y = (0.5 * cylinder->height);
        bottomCircle.pos.z = 0.0f;
        mathutil_mtxA_tf_point(&bottomCircle.pos, &bottomCircle.pos);
        bottomCircle.radius = cylinder->radius;
        bottomCircle.rot.x = cylinder->rot.x;
        bottomCircle.rot.y = cylinder->rot.y;
        bottomCircle.rot.z = cylinder->rot.z;
        collide_ball_with_circle(ball, &bottomCircle);
        return;
    }

    temp_f1_4 = mathutil_rsqrt(temp_f2_2);
    plane.normal.x = sp4C.x * temp_f1_4;
    plane.normal.y = 0.0f;
    plane.normal.z = sp4C.z * temp_f1_4;
    plane.point.x = plane.normal.x * cylinder->radius;
    plane.point.y = sp4C.y + (plane.normal.y * cylinder->radius);
    plane.point.z = plane.normal.z * cylinder->radius;
    mathutil_mtxA_tf_vec(&plane.normal, &plane.normal);
    mathutil_mtxA_tf_point(&plane.point, &plane.point);
    collide_ball_with_plane(ball, &plane);
}

void collide_ball_with_circle(struct PhysicsBall *ball, struct ColiCircle *circle)
{
    struct ColiPlane plane;
    Point3d ballPos_rt_circle;
    Vec tmpVec;

    f32 radiusSum;
    f32 temp_f0_4;
    f32 temp_f1_2;
    f32 temp_f1_5;
    f32 temp_f1_6;
    f32 distSq;

    tmpVec.x = ball->pos.x - circle->pos.x;
    tmpVec.y = ball->pos.y - circle->pos.y;
    tmpVec.z = ball->pos.z - circle->pos.z;
    distSq = mathutil_sum_of_sq_3(tmpVec.x, tmpVec.y, tmpVec.z);
    radiusSum = ball->radius + circle->radius;
    if (distSq > radiusSum * radiusSum)
        return;

    mathutil_mtxA_from_translate(&circle->pos);
    mathutil_mtxA_rotate_z(circle->rot.z);
    mathutil_mtxA_rotate_y(circle->rot.y);
    mathutil_mtxA_rotate_x(circle->rot.x);
    mathutil_mtxA_rigid_inv_tf_point(&ball->pos, &ballPos_rt_circle);
    temp_f1_2 = mathutil_sum_of_sq_2(ballPos_rt_circle.x, ballPos_rt_circle.z);
    if (temp_f1_2 < (circle->radius * circle->radius))
    {
        mathutil_mtxA_get_translate_alt(&plane.point);
        plane.normal.x = 0.0f;
        plane.normal.y = 1.0f;
        plane.normal.z = 0.0f;
        mathutil_mtxA_tf_vec(&plane.normal, &plane.normal);
        collide_ball_with_plane(ball, &plane);
        return;
    }

    radiusSum = ball->radius + circle->radius;
    if ((temp_f1_2 < (radiusSum * radiusSum)) && (temp_f1_2 > FLT_EPSILON))
    {
        temp_f0_4 = circle->radius * mathutil_rsqrt(temp_f1_2);
        plane.point.x = ballPos_rt_circle.x * temp_f0_4;
        plane.point.y = 0.0f;
        plane.point.z = ballPos_rt_circle.z * temp_f0_4;
        tmpVec.x = ballPos_rt_circle.x - plane.point.x;
        tmpVec.y = ballPos_rt_circle.y - plane.point.y;
        tmpVec.z = ballPos_rt_circle.z - plane.point.z;

        temp_f1_5 = mathutil_sum_of_sq_3(tmpVec.x, tmpVec.y, tmpVec.z);
        if (temp_f1_5 > FLT_EPSILON)
        {
            temp_f1_6 = mathutil_rsqrt(temp_f1_5);
            plane.normal.x = tmpVec.x * temp_f1_6;
            plane.normal.y = tmpVec.y * temp_f1_6;
            plane.normal.z = tmpVec.z * temp_f1_6;
            mathutil_mtxA_tf_point(&plane.point, &plane.point);
            mathutil_mtxA_tf_vec(&plane.normal, &plane.normal);
            collide_ball_with_plane(ball, &plane);
        }
    }
}

void collide_ball_with_sphere(struct PhysicsBall *ball, struct StageColiSphere *sphere)
{
    struct ColiPlane plane;
    Vec sp10_vec1;

    f32 radiusSum;
    f32 invDist;
    f32 distSq;

    sp10_vec1.x = ball->pos.x - sphere->pos.x;
    sp10_vec1.y = ball->pos.y - sphere->pos.y;
    sp10_vec1.z = ball->pos.z - sphere->pos.z;
    distSq = mathutil_sum_of_sq_3(sp10_vec1.x, sp10_vec1.y, sp10_vec1.z);
    radiusSum = sphere->radius + ball->radius;
    if (distSq > (radiusSum * radiusSum))
        return;
    if (distSq <= FLT_EPSILON)
        return;

    invDist = mathutil_rsqrt(distSq);
    sp10_vec1.x *= invDist;
    sp10_vec1.y *= invDist;
    sp10_vec1.z *= invDist;
    plane.point.x = sphere->pos.x + (sp10_vec1.x * sphere->radius);
    plane.point.y = sphere->pos.y + (sp10_vec1.y * sphere->radius);
    plane.point.z = sphere->pos.z + (sp10_vec1.z * sphere->radius);
    plane.normal.x = sp10_vec1.x;
    plane.normal.y = sp10_vec1.y;
    plane.normal.z = sp10_vec1.z;
    collide_ball_with_plane(ball, &plane);
}

void collide_ball_with_cone(struct PhysicsBall *ball, struct StageColiCone *cone)
{
    struct ColiPlane plane;
    Vec tmpVec;
    Point3d ballPos_rt_cone;

    f32 cullingRadius;
    f32 cylCullRadius;
    f32 temp_f1_3;
    f32 temp_f1_4;
    f32 maxConeScale;
    f32 dist2dSq;
    f32 distSq;
    f32 temp2;

    tmpVec.x = ball->pos.x - cone->pos.x;
    tmpVec.y = ball->pos.y - cone->pos.y;
    tmpVec.z = ball->pos.z - cone->pos.z;

    distSq = mathutil_sum_of_sq_3(tmpVec.x, tmpVec.y, tmpVec.z);

    maxConeScale = (cone->scale.x > cone->scale.y) ? cone->scale.x : cone->scale.y;

    cullingRadius = maxConeScale + ball->radius;
    if (distSq > (cullingRadius * cullingRadius))
        return;

    mathutil_mtxA_from_translate(&cone->pos);
    mathutil_mtxA_rotate_z((s32)cone->rot.z);
    mathutil_mtxA_rotate_y((s32)cone->rot.y);
    mathutil_mtxA_rotate_x((s32)cone->rot.x);
    mathutil_mtxA_rigid_inv_tf_point(&ball->pos, &ballPos_rt_cone);
    if (ballPos_rt_cone.y < -ball->radius)
        return;
    if (ballPos_rt_cone.y > (cone->scale.y + ball->radius))
        return;

    dist2dSq = mathutil_sum_of_sq_2(ballPos_rt_cone.x, ballPos_rt_cone.z);
    cylCullRadius = cone->scale.x + ball->radius;
    if (dist2dSq > cylCullRadius * cylCullRadius)
        return;

    mathutil_mtxA_translate_xyz(0.0f, cone->scale.y, 0.0f);
    mathutil_mtxA_rotate_y(-mathutil_atan2(ballPos_rt_cone.z, ballPos_rt_cone.x));
    mathutil_mtxA_rotate_z(-mathutil_atan2(cone->scale.y, cone->scale.x));
    mathutil_mtxA_rigid_inv_tf_point(&ball->pos, &tmpVec);

    if (tmpVec.x < 0.0)
    {
        mathutil_mtxA_get_translate_alt(&plane.point);
        temp_f1_3 = mathutil_sum_of_sq_3(tmpVec.x, tmpVec.y, tmpVec.z);
        if (temp_f1_3 <= FLT_EPSILON)
            return;
        temp_f1_4 = (1.0 / mathutil_sqrt(temp_f1_3));
        tmpVec.x *= temp_f1_4;
        tmpVec.y *= temp_f1_4;
        tmpVec.z *= temp_f1_4;
        mathutil_mtxA_tf_vec(&tmpVec, &plane.normal);
        collide_ball_with_plane(ball, &plane);
    }
    else
    {
        temp2 = mathutil_sqrt(mathutil_sum_of_sq_2(cone->scale.x, cone->scale.y));
        if (tmpVec.x > (ball->radius + temp2))
            return;
        mathutil_mtxA_get_translate_alt(&plane.point);
        tmpVec.x = 0.0f;
        tmpVec.y = 1.0f;
        tmpVec.z = 0.0f;
        mathutil_mtxA_tf_vec(&tmpVec, &plane.normal);
        collide_ball_with_plane(ball, &plane);
    }
}

/*
This function is responsible for placing the ball back on the outside of the surface it collided
with, as well as applying friction and bounce restitution to the ball's translational velocity. The
ball's rotation, on the other hand, is not affected here - it's a visual effect which does not
affect physics.

All other ball-stage collision functions ultimately call this one at least once. For example, if the
ball collided with a triangle face, coliPlane->point would be one of the triangle's vertices and
coliPlane->normal would be the triangle's normal. If the ball collided with the circular edge of a
cylinder, coliPlane->point would be the nearest point on the circular edge to the ball's center, and
coliPlane->normal would be the direction from the circular edge's point to the ball's center.
*/
void collide_ball_with_plane(struct PhysicsBall *ball, struct ColiPlane *coliPlane)
{
    Vec ballVel;
    Vec coliNormal;
    Point3d ballPos;
    u32 isHardestColi;
    float planeDeltaX;
    float planeDeltaY;
    float planeDeltaZ;
    float planeDist;
    float penetrationDist;
    float normalSpeed;
    float parallelVelX;
    float parallelVelY;
    float parallelVelZ;
    float adjustedBallSpeed;

    // Compute the ball center's distance from the collision plane
    ballPos = ball->pos;
    planeDeltaX = ballPos.x - coliPlane->point.x;
    planeDeltaY = ballPos.y - coliPlane->point.y;
    planeDeltaZ = ballPos.z - coliPlane->point.z;
    planeDist = planeDeltaX * coliPlane->normal.x + planeDeltaY * coliPlane->normal.y +
                planeDeltaZ * coliPlane->normal.z;

    // If the ball is too far in front of the plane to be touching it, don't count a collision
    if (planeDist > ball->radius)
        return;

    // The ball can collide with more than one surface during a frame. Keep track of which of these
    // collisions is the "hardest" so that visual collision effects can be applied based on it.

    // If the ball hasn't collided with any surface yet this frame, this collision is the hardest
    // one. Note that isHardestColi == 0 is "true" and -1 is "false" for some reason
    isHardestColi = -1;
    if (!(ball->flags & COLI_FLAG_OCCURRED))
        isHardestColi = 0;

    // Plane the ball back on top of / outside the collision surface
    penetrationDist = ball->radius - planeDist;
    ballPos.x += coliPlane->normal.x * penetrationDist;
    ballPos.y += coliPlane->normal.y * penetrationDist;
    ballPos.z += coliPlane->normal.z * penetrationDist;

    // Record the ball's new position
    ball->pos = ballPos;

    // Compute the component of the ball's velocity which is parallel to the collision normal,
    // a.k.a. its "normal velocity". The dot product of the ball's velocity with the collision
    // normal a.k.a. the "normal speed" will be negative when a collision actually occurred.
    coliNormal = coliPlane->normal;
    ballVel.x = ball->vel.x;
    ballVel.y = ball->vel.y;
    ballVel.z = ball->vel.z;
    normalSpeed =
        (coliNormal.x * ballVel.x) + (coliNormal.y * ballVel.y) + (coliNormal.z * ballVel.z);

    // If the ball's velocity points into the surface and our bounce restitution is greater than
    // zero, a collision actually occurred
    if ((normalSpeed < 0.0) && (ball->restitution > FLT_EPSILON))
    {
        // If this collision is harder than the current hardest collision, record this collision as
        // the hardest one. A collision is "harder" if the ball's normal speed is greater in
        // magnitude.
        if (normalSpeed < ball->hardestColiSpeed)
        {
            ball->hardestColiSpeed = normalSpeed;
            ball->hardestColiItemgroupId = ball->itemgroupId;
            isHardestColi = 0; // true
        }

        /*
        Apply friction to the ball.

        The friction constant (ball->friction) is simply the fraction of the ball's velocity
        _parallel to the surface_ that is lost per collision. The ball's normal velocity is
        unaffected by friction.
        */

        // Compute the ball's parallel velocity
        parallelVelX = ballVel.x - (coliNormal.x * normalSpeed);
        parallelVelY = ballVel.y - (coliNormal.y * normalSpeed);
        parallelVelZ = ballVel.z - (coliNormal.z * normalSpeed);
        // Subtract a portion of the parallel velocity from the ball's overall velocity
        ballVel.x -= parallelVelX * ball->friction;
        ballVel.y -= parallelVelY * ball->friction;
        ballVel.z -= parallelVelZ * ball->friction;

        /*
        Apply bounce restitution to the ball.

        The restitution constant (ball->restitution) is the fraction of the ball's normal velocity
        which is retained after a collision. Before this proportional restitution is applied
        however, a constant velocity loss is first applied. This prevents the ball from
        bouncing tiny amounts when its normal velocity is small.

        The constant velocity loss has a magnitude of 5 * ball->gravityAccel. This is the speed that
        the ball would have if it fell from rest for five frames.
        */

        // If the ball's normal velocity is already smaller than the constant normal velocity
        // loss...
        if (normalSpeed >= (-5.0 * ball->gravityAccel))
        {
            // Set the ball's normal velocity to zero
            ballVel.x -= coliNormal.x * normalSpeed;
            ballVel.y -= coliNormal.y * normalSpeed;
            ballVel.z -= coliNormal.z * normalSpeed;
        }
        else
        {
            // This is the ball's speed after applying the constant speed loss (negated)
            adjustedBallSpeed = normalSpeed + 5.0 * ball->gravityAccel;

            // Apply the constant normal velocity loss to the ball's velocity
            ballVel.x -= coliNormal.x * (-5.0 * ball->gravityAccel);
            ballVel.y -= coliNormal.y * (-5.0 * ball->gravityAccel);
            ballVel.z -= coliNormal.z * (-5.0 * ball->gravityAccel);

            // Scale the ball's remaining normal velocity by the restitution, pointing it
            // in the opposite direction it was before the collision. The negations make this a
            // little confusing to see. The 1.0 added to ball->restitution essentially brings the
            // ball's normal velocity back to zero.
            ballVel.x -= (1.0 + ball->restitution) * (coliNormal.x * adjustedBallSpeed);
            ballVel.y -= (1.0 + ball->restitution) * (coliNormal.y * adjustedBallSpeed);
            ballVel.z -= (1.0 + ball->restitution) * (coliNormal.z * adjustedBallSpeed);
        }

        // Record the ball's new velocity
        ball->vel.x = ballVel.x;
        ball->vel.y = ballVel.y;
        ball->vel.z = ballVel.z;
    }

    // If this collision was the hardest one, also record the collision plane (used for drawing
    // visual collision effects)
    if (isHardestColi == 0)
        ball->hardestColiPlane = *coliPlane;

    // Mark that a collision occurred on this frame
    ball->flags |= COLI_FLAG_OCCURRED;
}

u32 test_line_intersects_rect(Vec *lineStart, Vec *lineEnd, struct ColiRect *rect)
{
    Vec start;
    Vec end;
    Vec planePoint;
    float halfWidth;
    float halfHeight;
    u32 intersects;

    start = *lineStart;
    end = *lineEnd;

    // Transform line into rectangle local space
    mathutil_mtxA_from_translate(&rect->pos);
    mathutil_mtxA_rotate_z(rect->rot.z);
    mathutil_mtxA_rotate_y(rect->rot.y);
    mathutil_mtxA_rotate_x(rect->rot.x);
    mathutil_mtxA_rigid_inv_tf_point(&start, &start);
    mathutil_mtxA_rigid_inv_tf_point(&end, &end);

    // Test if line crosses plane
    if ((end.z < 0.0 && start.z < 0.0) || (end.z > 0.0 && start.z > 0.0))
        intersects = FALSE;
    else
    {
        planePoint.x = start.x - end.x;
        planePoint.y = start.y - end.y;
        planePoint.z = start.z - end.z;

        if (planePoint.z > FLT_EPSILON)
        {
            planePoint.x = end.x - planePoint.x * (end.z / planePoint.z);
            planePoint.y = end.y - planePoint.y * (end.z / planePoint.z);
        }
        else
        {
            planePoint.x = end.x;
            planePoint.y = end.y;
        }

        halfWidth = 0.5 * rect->width;
        halfHeight = 0.5 * rect->height;
        if (planePoint.x < -halfWidth || planePoint.x > halfWidth)
            intersects = FALSE;
        else if (planePoint.y < -halfHeight || planePoint.y > halfHeight)
            intersects = FALSE;
        else
            intersects = TRUE;
    }
    return intersects;
}

static struct ColiRect jamabarColiRects[] = {
    {
        {0, 0.5, 1.75},
        {0, 0, 0},
        {0, 0, 1},
        1,
        1,
    },
    {
        {-0.5, 0.5, 0},
        {0, DEGREES_TO_S16(-90), 0},
        {-1, 0, 0},
        3.5,
        1,
    },
    {
        {0, 0.5, -1.75},
        {0, DEGREES_TO_S16(180), 0},
        {0, 0, -1},
        1,
        1,
    },
    {
        {0.5, 0.5, 0},
        {0, DEGREES_TO_S16(90), 0},
        {1, 0, 0},
        3.5,
        1,
    },
};

void collide_ball_with_jamabar(struct PhysicsBall *ball, struct Stobj *stobj)
{
    Point3d ballPos;
    float temp_f1;
    float temp_f2;
    float hitItemgroupInfo;
    struct ColiRect *coliRect;
    s32 i;

    mathutil_mtxA_from_translate(&stobj->g_some_pos);
    mathutil_mtxA_rotate_x(stobj->rot.x);
    mathutil_mtxA_rotate_y(stobj->rot.y);
    mathutil_mtxA_rotate_z(stobj->rot.z);
    stcoli_sub31(ball, ball);
    ballPos = ball->pos;

    coliRect = jamabarColiRects;
    for (i = 0; i < 4; i++, coliRect++)
        collide_ball_with_rect(ball, coliRect);

    temp_f1 = 0.75 * (ball->pos.z - ballPos.z);
    stobj->g_local_pos.z -= temp_f1;
    ball->pos.z += temp_f1;
    temp_f2 = stobj->g_local_vel.z;
    if ((temp_f1 * temp_f2) > 0.0)
    {
        stobj->g_local_vel.z *= 0.5;
        ball->vel.z = ball->vel.z + (2.5 * (temp_f2 - stobj->g_local_vel.z));
    }
    mathutil_mtxA_from_translate(&stobj->g_some_pos);
    mathutil_mtxA_rotate_x(stobj->rot.x);
    mathutil_mtxA_rotate_y(stobj->rot.y);
    mathutil_mtxA_rotate_z(stobj->rot.z);
    stcoli_sub30(ball, ball);
}

int raycast_stage_down(Point3d *rayOrigin, struct RaycastHit *outHit, Vec *outVelAtPoint)
{
    Point3d rayOrigin_rt_ig;
    Point3d hitPos;
    Vec rayDir_rt_ig;
    Vec coneHitNormal;
    Vec sphereHitNormal;
    Point3d cylinderHitNormal;
    Vec dynStagePartHitNormal;
    Point3d currHitPos;
    Point3d prevHitPos;

    struct ItemgroupInfo *itemgroupInfo;
    struct StageColiTri *tri;
    struct StageItemgroup *stageIg;
    s16 *cellTris;
    s16 *cellTriIdx;

    struct StageColiCone *cone;
    s32 coneCtr;
    struct StageColiSphere *sphere;
    s32 sphereCtr;
    struct StageColiCylinder *cylinder;
    s32 cylinderCtr;

    s32 itemgroupId;
    s32 hitItemgroupId;

    outHit->flags = 0;
    itemgroupId = 0;
    itemgroupInfo = itemgroups;
    stageIg = decodedStageLzPtr->itemgroups;
    hitItemgroupId = 0;

    for (itemgroupId = 0; itemgroupId < decodedStageLzPtr->itemgroupCount;
         itemgroupId++, itemgroupInfo++, stageIg++)
    {
        rayOrigin_rt_ig.x = rayOrigin->x;
        rayOrigin_rt_ig.y = rayOrigin->y;
        rayOrigin_rt_ig.z = rayOrigin->z;
        rayDir_rt_ig.x = 0.0f;
        rayDir_rt_ig.y = -1.0f;
        rayDir_rt_ig.z = 0.0f;
        if (itemgroupId > 0)
        {
            mathutil_mtxA_from_mtx(itemgroupInfo->transform);
            mathutil_mtxA_rigid_inv_tf_point(&rayOrigin_rt_ig, &rayOrigin_rt_ig);
            mathutil_mtxA_rigid_inv_tf_vec(&rayDir_rt_ig, &rayDir_rt_ig);
        }

        cellTris = coligrid_lookup(stageIg, rayOrigin_rt_ig.x, rayOrigin_rt_ig.z);
        if (cellTris != NULL2)
        {
            cellTriIdx = cellTris;
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
            {
                hitPos.x = rayOrigin_rt_ig.x;
                hitPos.y = rayOrigin_rt_ig.y;
                hitPos.z = rayOrigin_rt_ig.z;
                tri = &stageIg->triangles[*cellTriIdx];
                if (raycast_tri(&hitPos, &rayDir_rt_ig, tri))
                {
                    mathutil_mtxA_from_mtx(itemgroupInfo->transform);
                    mathutil_mtxA_tf_point(&hitPos, &hitPos);
                    if (((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y))
                    {
                        outHit->flags = tri->flags | COLI_FLAG_OCCURRED;
                        outHit->pos.x = hitPos.x;
                        outHit->pos.y = hitPos.y;
                        outHit->pos.z = hitPos.z;
                        mathutil_mtxA_tf_vec(&tri->normal, &outHit->normal);
                        hitItemgroupId = itemgroupId;
                    }
                }
            }
        }
        cone = stageIg->coliCones;
        for (coneCtr = stageIg->coliConeCount; coneCtr > 0; coneCtr--, cone++)
        {
            if (raycast_cone(&rayOrigin_rt_ig, &rayDir_rt_ig, cone, &hitPos, &coneHitNormal))
            {
                mathutil_mtxA_from_mtx(itemgroupInfo->transform);
                mathutil_mtxA_tf_point(&hitPos, &hitPos);
                if ((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y)
                {
                    outHit->flags = cone->flags | COLI_FLAG_OCCURRED;
                    outHit->pos.x = hitPos.x;
                    outHit->pos.y = hitPos.y;
                    outHit->pos.z = hitPos.z;
                    mathutil_mtxA_tf_vec(&coneHitNormal, &outHit->normal);
                    hitItemgroupId = itemgroupId;
                }
            }
        }
        sphere = stageIg->coliSpheres;
        for (sphereCtr = stageIg->coliSphereCount; sphereCtr > 0; sphereCtr--, sphere++)
        {
            if ((raycast_sphere(&rayOrigin_rt_ig, &rayDir_rt_ig, sphere, &hitPos,
                                &sphereHitNormal)))
            {
                mathutil_mtxA_from_mtx(itemgroupInfo->transform);
                mathutil_mtxA_tf_point(&hitPos, &hitPos);
                if ((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y)
                {
                    outHit->flags = sphere->flags | COLI_FLAG_OCCURRED;
                    outHit->pos.x = hitPos.x;
                    outHit->pos.y = hitPos.y;
                    outHit->pos.z = hitPos.z;
                    mathutil_mtxA_tf_vec(&sphereHitNormal, &outHit->normal);
                    hitItemgroupId = itemgroupId;
                }
            }
        }
        cylinder = stageIg->coliCylinders;
        for (cylinderCtr = stageIg->coliCylinderCount; cylinderCtr > 0; cylinderCtr--, cylinder++)
        {
            if (raycast_cylinder(&rayOrigin_rt_ig, &rayDir_rt_ig, cylinder, &hitPos,
                                 &cylinderHitNormal))
            {
                mathutil_mtxA_from_mtx(itemgroupInfo->transform);
                mathutil_mtxA_tf_point(&hitPos, &hitPos);
                if ((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y)
                {
                    outHit->flags = cylinder->flags | COLI_FLAG_OCCURRED;
                    outHit->pos.x = hitPos.x;
                    outHit->pos.y = hitPos.y;
                    outHit->pos.z = hitPos.z;
                    mathutil_mtxA_tf_vec(&cylinderHitNormal, &outHit->normal);
                    hitItemgroupId = itemgroupId;
                }
            }
        }
    }

    if (dynamicStageParts)
    {
        hitPos.x = rayOrigin_rt_ig.x;
        hitPos.y = rayOrigin_rt_ig.y;
        hitPos.z = rayOrigin_rt_ig.z;
        if (dynamicStageParts[0].raycastDownFunc(&hitPos, &hitPos, &dynStagePartHitNormal))
        {
            if ((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y)
            {
                hitItemgroupId = 0;
                outHit->flags = COLI_FLAG_OCCURRED;
                outHit->pos.x = hitPos.x;
                outHit->pos.y = hitPos.y;
                outHit->pos.z = hitPos.z;
                outHit->normal.x = dynStagePartHitNormal.x;
                outHit->normal.y = dynStagePartHitNormal.y;
                outHit->normal.z = dynStagePartHitNormal.z;
            }
        }
    }

    if (outVelAtPoint)
    {
        if ((outHit->flags & COLI_FLAG_OCCURRED) && (hitItemgroupId > 0))
        {
            currHitPos.x = outHit->pos.x;
            currHitPos.y = outHit->pos.y;
            currHitPos.z = outHit->pos.z;
            itemgroupInfo = &itemgroups[hitItemgroupId];
            mathutil_mtxA_from_mtx(itemgroupInfo->transform);
            mathutil_mtxA_rigid_inv_tf_point(&currHitPos, &hitPos);
            mathutil_mtxA_from_mtx(itemgroupInfo->prevTransform);
            mathutil_mtxA_tf_point(&hitPos, &prevHitPos);
            outVelAtPoint->x = currHitPos.x - prevHitPos.x;
            outVelAtPoint->y = currHitPos.y - prevHitPos.y;
            outVelAtPoint->z = currHitPos.z - prevHitPos.z;
        }
        else
        {
            outVelAtPoint->x = 0;
            outVelAtPoint->y = 0;
            outVelAtPoint->z = 0;
        }
    }

    return (outHit->flags & COLI_FLAG_OCCURRED) != 0;
}

u32 raycast_tri(Point3d *rayOrigin, Point3d *rayDir, struct StageColiTri *tri)
{
    u8 unused1[8];
    Point3d rayOrigin_rt_tri;
    Vec rayDir_rt_tri;
    u8 unused2[8];

    f32 scale;

    float x;
    float y;
    float z;

    // If ray origin is not in front of triangle, no hit
    x = rayOrigin->x - tri->pos.x;
    y = rayOrigin->y - tri->pos.y;
    z = rayOrigin->z - tri->pos.z;
    if ((((x * tri->normal.x) + (y * tri->normal.y)) + (z * tri->normal.z)) < 0.0)
        return 0U;

    // If ray direction is not towards triangle, no hit
    if (((rayDir->z * tri->normal.z) +
         ((rayDir->x * tri->normal.x) + (rayDir->y * tri->normal.y))) > 0.0)
        return 0U;

    // Transform ray origin and direction into triangle space
    mathutil_mtxA_from_translate(&tri->pos);
    mathutil_mtxA_rotate_y(tri->rot.y);
    mathutil_mtxA_rotate_x(tri->rot.x);
    mathutil_mtxA_rotate_z(tri->rot.z);
    mathutil_mtxA_rigid_inv_tf_point(rayOrigin, &rayOrigin_rt_tri);
    mathutil_mtxA_rigid_inv_tf_vec(rayDir, &rayDir_rt_tri);

    // If ray is nearly parallel to plane, no hit
    if (__fabs(rayDir_rt_tri.z) <= FLT_EPSILON)
        return 0U;

    // Find the ray-plane intersection point
    scale = -rayOrigin_rt_tri.z / rayDir_rt_tri.z;
    rayOrigin_rt_tri.x += rayDir_rt_tri.x * scale;
    rayOrigin_rt_tri.y += rayDir_rt_tri.y * scale;
    rayOrigin_rt_tri.z = 0.0f;

    // Check if ray-plane point is on the innner side of each triangle edge
    if (dumb_dot(0, 1, rayOrigin_rt_tri.x, rayOrigin_rt_tri.y) < -0.01)
        return 0U;
    if (((tri->edge2Normal.x * (rayOrigin_rt_tri.x - tri->vert2.x)) +
         (tri->edge2Normal.y * (rayOrigin_rt_tri.y - tri->vert2.y))) < -0.01)
        return 0U;
    if (((tri->edge3Normal.x * (rayOrigin_rt_tri.x - tri->vert3.x)) +
         (tri->edge3Normal.y * (rayOrigin_rt_tri.y - tri->vert3.y))) < -0.01)
        return 0U;

    mathutil_mtxA_tf_point(&rayOrigin_rt_tri, rayOrigin);
    return 1U;
}
