#include <math.h>
#include <stddef.h>

#include "global.h"
#include "ball.h"
#include "mathutil.h"
#include "nl2ngc.h"
#include "stage.h"
#include "stcoli.h"
#include "types.h"
#include "variables.h"

#include "../data/common.nlobj.h"

void collide_ball_with_stage(struct PhysicsBall *ball, struct Stage *stage)
{
    struct StageColiTri tri;
    struct StageAnimGroup *stageAg;
    int animGroupId;
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
        ball->animGroupId = 0;
        collide_ball_with_tri_face(ball, &tri);
        collide_ball_with_tri_edges(ball, &tri);
        collide_ball_with_tri_verts(ball, &tri);
        return;
    }

    stageAg = stage->animGroups;
    for (animGroupId = 0; animGroupId < stage->animGroupCount; animGroupId++, stageAg++)
    {
        if (animGroupId != ball->animGroupId)
            tf_physball_to_anim_group_space(ball, animGroupId);
        cellTris = coligrid_lookup(stageAg, ball->pos.x, ball->pos.z);
        if (cellTris != NULL)
        {
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_face(ball, &stageAg->triangles[*cellTriIdx]);
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_edges(ball, &stageAg->triangles[*cellTriIdx]);
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
                collide_ball_with_tri_verts(ball, &stageAg->triangles[*cellTriIdx]);
        }

        cone = stageAg->coliCones;
        for (i = stageAg->coliConeCount; i > 0; i--, cone++)
            collide_ball_with_cone(ball, cone);

        sphere = stageAg->coliSpheres;
        for (i = stageAg->coliSphereCount; i > 0; i--, sphere++)
            collide_ball_with_sphere(ball, sphere);

        cylinder = stageAg->coliCylinders;
        for (i = stageAg->coliCylinderCount; i > 0; i--, cylinder++)
            collide_ball_with_cylinder(ball, cylinder);

        goal = stageAg->goals;
        for (i = stageAg->goalCount; i > 0; i--, goal++)
            collide_ball_with_goal(ball, goal);
    }

    if (ball->animGroupId != 0)
        tf_physball_to_anim_group_space(ball, 0);
    if (dynamicStageParts != NULL)
        g_collide_ball_with_dynstageparts(ball, dynamicStageParts);
}

s16 *coligrid_lookup(struct StageAnimGroup *stageAg, f32 x, f32 z)
{
    int cellX;
    int cellZ;

    if (stageAg->gridCellTris == NULL2)
        return NULL;

    cellX = mathutil_floor((x - stageAg->gridOriginX) / stageAg->gridStepX);
    cellZ = mathutil_floor((z - stageAg->gridOriginZ) / stageAg->gridStepZ);

    if (cellX < 0 || cellX >= stageAg->gridCellCountX)
        return NULL;
    if (cellZ < 0 || cellZ >= stageAg->gridCellCountZ)
        return NULL;
    return stageAg->gridCellTris[cellZ * stageAg->gridCellCountX + cellX];
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
            ball->hardestColiAnimGroupId = ball->animGroupId;
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
    u8 dummy[4];
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

    struct AnimGroupInfo *animGroupInfo;
    struct StageColiTri *tri;
    struct StageAnimGroup *stageAg;
    s16 *cellTris;
    s16 *cellTriIdx;

    struct StageColiCone *cone;
    s32 coneCtr;
    struct StageColiSphere *sphere;
    s32 sphereCtr;
    struct StageColiCylinder *cylinder;
    s32 cylinderCtr;

    s32 animGroupId;
    s32 hitAnimGroupId;

    outHit->flags = 0;
    animGroupId = 0;
    animGroupInfo = animGroups;
    stageAg = decodedStageLzPtr->animGroups;
    hitAnimGroupId = 0;

    for (animGroupId = 0; animGroupId < decodedStageLzPtr->animGroupCount;
         animGroupId++, animGroupInfo++, stageAg++)
    {
        rayOrigin_rt_ig.x = rayOrigin->x;
        rayOrigin_rt_ig.y = rayOrigin->y;
        rayOrigin_rt_ig.z = rayOrigin->z;
        rayDir_rt_ig.x = 0.0f;
        rayDir_rt_ig.y = -1.0f;
        rayDir_rt_ig.z = 0.0f;
        if (animGroupId > 0)
        {
            mathutil_mtxA_from_mtx(animGroupInfo->transform);
            mathutil_mtxA_rigid_inv_tf_point(&rayOrigin_rt_ig, &rayOrigin_rt_ig);
            mathutil_mtxA_rigid_inv_tf_vec(&rayDir_rt_ig, &rayDir_rt_ig);
        }

        cellTris = coligrid_lookup(stageAg, rayOrigin_rt_ig.x, rayOrigin_rt_ig.z);
        if (cellTris != NULL2)
        {
            cellTriIdx = cellTris;
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++)
            {
                hitPos.x = rayOrigin_rt_ig.x;
                hitPos.y = rayOrigin_rt_ig.y;
                hitPos.z = rayOrigin_rt_ig.z;
                tri = &stageAg->triangles[*cellTriIdx];
                if (raycast_tri(&hitPos, &rayDir_rt_ig, tri))
                {
                    mathutil_mtxA_from_mtx(animGroupInfo->transform);
                    mathutil_mtxA_tf_point(&hitPos, &hitPos);
                    if (((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y))
                    {
                        outHit->flags = tri->flags | COLI_FLAG_OCCURRED;
                        outHit->pos.x = hitPos.x;
                        outHit->pos.y = hitPos.y;
                        outHit->pos.z = hitPos.z;
                        mathutil_mtxA_tf_vec(&tri->normal, &outHit->normal);
                        hitAnimGroupId = animGroupId;
                    }
                }
            }
        }
        cone = stageAg->coliCones;
        for (coneCtr = stageAg->coliConeCount; coneCtr > 0; coneCtr--, cone++)
        {
            if (raycast_cone(&rayOrigin_rt_ig, &rayDir_rt_ig, cone, &hitPos, &coneHitNormal))
            {
                mathutil_mtxA_from_mtx(animGroupInfo->transform);
                mathutil_mtxA_tf_point(&hitPos, &hitPos);
                if ((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y)
                {
                    outHit->flags = cone->flags | COLI_FLAG_OCCURRED;
                    outHit->pos.x = hitPos.x;
                    outHit->pos.y = hitPos.y;
                    outHit->pos.z = hitPos.z;
                    mathutil_mtxA_tf_vec(&coneHitNormal, &outHit->normal);
                    hitAnimGroupId = animGroupId;
                }
            }
        }
        sphere = stageAg->coliSpheres;
        for (sphereCtr = stageAg->coliSphereCount; sphereCtr > 0; sphereCtr--, sphere++)
        {
            if ((raycast_sphere(&rayOrigin_rt_ig, &rayDir_rt_ig, sphere, &hitPos,
                                &sphereHitNormal)))
            {
                mathutil_mtxA_from_mtx(animGroupInfo->transform);
                mathutil_mtxA_tf_point(&hitPos, &hitPos);
                if ((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y)
                {
                    outHit->flags = sphere->flags | COLI_FLAG_OCCURRED;
                    outHit->pos.x = hitPos.x;
                    outHit->pos.y = hitPos.y;
                    outHit->pos.z = hitPos.z;
                    mathutil_mtxA_tf_vec(&sphereHitNormal, &outHit->normal);
                    hitAnimGroupId = animGroupId;
                }
            }
        }
        cylinder = stageAg->coliCylinders;
        for (cylinderCtr = stageAg->coliCylinderCount; cylinderCtr > 0; cylinderCtr--, cylinder++)
        {
            if (raycast_cylinder(&rayOrigin_rt_ig, &rayDir_rt_ig, cylinder, &hitPos,
                                 &cylinderHitNormal))
            {
                mathutil_mtxA_from_mtx(animGroupInfo->transform);
                mathutil_mtxA_tf_point(&hitPos, &hitPos);
                if ((outHit->flags & COLI_FLAG_OCCURRED) == 0 || hitPos.y > outHit->pos.y)
                {
                    outHit->flags = cylinder->flags | COLI_FLAG_OCCURRED;
                    outHit->pos.x = hitPos.x;
                    outHit->pos.y = hitPos.y;
                    outHit->pos.z = hitPos.z;
                    mathutil_mtxA_tf_vec(&cylinderHitNormal, &outHit->normal);
                    hitAnimGroupId = animGroupId;
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
                hitAnimGroupId = 0;
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
        if ((outHit->flags & COLI_FLAG_OCCURRED) && (hitAnimGroupId > 0))
        {
            currHitPos.x = outHit->pos.x;
            currHitPos.y = outHit->pos.y;
            currHitPos.z = outHit->pos.z;
            animGroupInfo = &animGroups[hitAnimGroupId];
            mathutil_mtxA_from_mtx(animGroupInfo->transform);
            mathutil_mtxA_rigid_inv_tf_point(&currHitPos, &hitPos);
            mathutil_mtxA_from_mtx(animGroupInfo->prevTransform);
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

u32 raycast_cone(Point3d* rayOrigin, Point3d* rayDir, struct StageColiCone* cone, Point3d* outHitPos, Point3d* outHitNormal)
{
    Point3d rayOrigin_rt_cone_sp34;
    Vec sp28;
    Point3d rayDir_rt_cone_sp1c;
    float yRadiusRatio;
    float temp_f1_7;
    float temp_f31;
    float temp_f30;
    float temp_f29;
    float temp_f7;

    mathutil_mtxA_from_translate(&cone->pos);
    mathutil_mtxA_rotate_z(cone->rot.z);
    mathutil_mtxA_rotate_y(cone->rot.y);
    mathutil_mtxA_rotate_x(cone->rot.x);
    mathutil_mtxA_translate_xyz(0.0f, cone->scale.y, 0.0f);
    mathutil_mtxA_rigid_inv_tf_point(rayOrigin, &rayOrigin_rt_cone_sp34);
    mathutil_mtxA_rigid_inv_tf_vec(rayDir, &rayDir_rt_cone_sp1c);

    yRadiusRatio = cone->scale.x / cone->scale.y;

    temp_f31 = rayDir_rt_cone_sp1c.x * rayDir_rt_cone_sp1c.x
             + rayDir_rt_cone_sp1c.z * rayDir_rt_cone_sp1c.z
             - (yRadiusRatio * yRadiusRatio * (rayDir_rt_cone_sp1c.y * rayDir_rt_cone_sp1c.y));

    if (__fabs(temp_f31) < FLT_EPSILON)
        return FALSE;

    temp_f30 = ((rayDir_rt_cone_sp1c.x * rayOrigin_rt_cone_sp34.x)
            + (rayDir_rt_cone_sp1c.z * rayOrigin_rt_cone_sp34.z))
            - (rayOrigin_rt_cone_sp34.y * (rayDir_rt_cone_sp1c.y * (yRadiusRatio * yRadiusRatio)));
    temp_f29 = (temp_f30 * temp_f30) -
        (temp_f31 * (((rayOrigin_rt_cone_sp34.x * rayOrigin_rt_cone_sp34.x)
        + (rayOrigin_rt_cone_sp34.z * rayOrigin_rt_cone_sp34.z))
        - ((yRadiusRatio * yRadiusRatio)
         * (rayOrigin_rt_cone_sp34.y * rayOrigin_rt_cone_sp34.y))));
    if (temp_f29 < FLT_EPSILON)
        return FALSE;

    temp_f7 = -(temp_f30 + mathutil_sqrt((f64) temp_f29)) / temp_f31;
    sp28.x = rayDir_rt_cone_sp1c.x * temp_f7 + rayOrigin_rt_cone_sp34.x;
    sp28.y = rayDir_rt_cone_sp1c.y * temp_f7 + rayOrigin_rt_cone_sp34.y;
    sp28.z = rayDir_rt_cone_sp1c.z * temp_f7 + rayOrigin_rt_cone_sp34.z;

    if (((sp28.y > 0.0) || (sp28.y < -cone->scale.y)))
    {
        temp_f7 = -(temp_f30 - mathutil_sqrt((f64) temp_f29)) / temp_f31;
        sp28.x = rayDir_rt_cone_sp1c.x * temp_f7 + rayOrigin_rt_cone_sp34.x;
        sp28.y = rayDir_rt_cone_sp1c.y * temp_f7 + rayOrigin_rt_cone_sp34.y;
        sp28.z = rayDir_rt_cone_sp1c.z * temp_f7 + rayOrigin_rt_cone_sp34.z;
        if (sp28.y > 0.0 || sp28.y < -cone->scale.y)
            return FALSE;
    }

    mathutil_mtxA_tf_point((Point3d* ) &sp28, outHitPos);
    rayDir_rt_cone_sp1c.x = sp28.x;
    rayDir_rt_cone_sp1c.z = sp28.z;
    temp_f29 = mathutil_sum_of_sq_2(rayDir_rt_cone_sp1c.x, rayDir_rt_cone_sp1c.z);
    if (temp_f29 > FLT_EPSILON)
    {
        rayDir_rt_cone_sp1c.y = (cone->scale.x * mathutil_sqrt(temp_f29)) / cone->scale.y;
        temp_f29 += (rayDir_rt_cone_sp1c.y * rayDir_rt_cone_sp1c.y);
        temp_f1_7 = mathutil_rsqrt(temp_f29);
        rayDir_rt_cone_sp1c.x *= temp_f1_7;
        rayDir_rt_cone_sp1c.y *= temp_f1_7;
        rayDir_rt_cone_sp1c.z *= temp_f1_7;
        mathutil_mtxA_tf_vec(&rayDir_rt_cone_sp1c, outHitNormal);
    }
    else
    {
        rayDir_rt_cone_sp1c.x = 0.0f;
        rayDir_rt_cone_sp1c.y = 1.0f;
        rayDir_rt_cone_sp1c.z = 0.0f;
        mathutil_mtxA_tf_vec(&rayDir_rt_cone_sp1c, outHitNormal);
    }
    return TRUE;
}

u32 raycast_sphere(Point3d *rayOrigin, Vec *rayDir, struct StageColiSphere *sphere,
                   Point3d *outHitPos, Vec *outHitNormal)
{
    Vec delta_sp28;
    Vec rayDir_sp1c;
    f32 dot;
    f32 temp_f1;
    f32 temp_f2;
    f32 temp_f2_2;
    f32 temp_f31;

    rayDir_sp1c.x = rayDir->x;
    rayDir_sp1c.y = rayDir->y;
    rayDir_sp1c.z = rayDir->z;
    delta_sp28.x = rayOrigin->x - sphere->pos.x;
    delta_sp28.y = rayOrigin->y - sphere->pos.y;
    delta_sp28.z = rayOrigin->z - sphere->pos.z;
    // temp_f31 = (rayDir_sp1c.z * rayDir_sp1c.z) + ((rayDir_sp1c.y * rayDir_sp1c.y) +
    // (rayDir_sp1c.x * rayDir_sp1c.x));
    temp_f31 = mathutil_sum_of_sq_3(rayDir_sp1c.x, rayDir_sp1c.y, rayDir_sp1c.z);
    if (temp_f31 < FLT_EPSILON)
    {
        return 0U;
    }
    dot = (rayDir_sp1c.z * delta_sp28.z) +
          ((rayDir_sp1c.x * delta_sp28.x) + (rayDir_sp1c.y * delta_sp28.y));
    // temp_f2 = ((delta_sp28.z * delta_sp28.z) + ((delta_sp28.y * delta_sp28.y) + (delta_sp28.x *
    // delta_sp28.x))) - (sphere->radius * sphere->radius);
    temp_f2 = mathutil_sum_of_sq_3(delta_sp28.x, delta_sp28.y, delta_sp28.z) -
              sphere->radius * sphere->radius;
    temp_f1 = (dot * dot) - (temp_f31 * temp_f2);
    if (temp_f1 < FLT_EPSILON)
    {
        return 0U;
    }
    if (temp_f2 < 0.0f)
    {
        return 0U;
    }
    if (dot > 0.0f)
    {
        return 0U;
    }
    temp_f2_2 = -(dot + mathutil_sqrt((f64)temp_f1)) / temp_f31;
    outHitPos->x = rayOrigin->x + (rayDir_sp1c.x * temp_f2_2);
    outHitPos->y = rayOrigin->y + (rayDir_sp1c.y * temp_f2_2);
    outHitPos->z = rayOrigin->z + (rayDir_sp1c.z * temp_f2_2);
    outHitNormal->x = (outHitPos->x - sphere->pos.x) / sphere->radius;
    outHitNormal->y = (outHitPos->y - sphere->pos.y) / sphere->radius;
    outHitNormal->z = (outHitPos->z - sphere->pos.z) / sphere->radius;
    return 1U;
}

// OK on decomp.me: https://decomp.me/scratch/FcfFZ
u32 raycast_cylinder(Point3d *rayOrigin, Point3d *rayDir, struct StageColiCylinder *cylinder,
                     Point3d *outHitPos, Point3d *outHitNormal)
{
    Vec vec_sp34;
    Point3d sp28;
    Point3d sp1C;
    // f32 cylinder->radius;
    // f32 0.0f;
    // f32 temp_f0_3;
    // f32 FLT_EPSILON;
    // f32 temp_f0_5;
    // f32 cylinder->radius;
    // f32 temp_f0_7;
    // f32 cylinder->radius;
    f32 temp_f1;
    // f32 0.0f;
    // f32 0.0f;
    f32 temp_f2;
    f32 temp_f30;
    f32 temp_f31;
    // f32 temp_f3;
    // f32 sp28.x;
    // f32 FLT_EPSILON;
    f32 halfHeight;
    f32 negHalfHeight;
    // f32 sp1C.x;
    f32 temp_f7;
    // f32 temp_f7;
    // f32 temp_f7;

    mathutil_mtxA_from_translate(&cylinder->pos);
    mathutil_mtxA_rotate_z((s32)cylinder->rot.z);
    mathutil_mtxA_rotate_y((s32)cylinder->rot.y);
    mathutil_mtxA_rotate_x((s32)cylinder->rot.x);
    mathutil_mtxA_rigid_inv_tf_point(rayOrigin, &sp28);
    mathutil_mtxA_rigid_inv_tf_vec(rayDir, &sp1C);
    // sp1C.x = sp1C.x;
    // FLT_EPSILON = FLT_EPSILON;
    temp_f31 = (sp1C.x * sp1C.x) + (sp1C.z * sp1C.z);
    if (!(temp_f31 < FLT_EPSILON))
    {
        // sp28.x = sp28.x;
        // cylinder->radius = cylinder->radius;
        temp_f30 = (sp1C.x * sp28.x) + (sp1C.z * sp28.z);
        temp_f2 = ((sp28.x * sp28.x) + (sp28.z * sp28.z)) - (cylinder->radius * cylinder->radius);
        temp_f1 = (temp_f30 * temp_f30) - (temp_f31 * temp_f2);
        if (temp_f1 < FLT_EPSILON)
        {
            return 0U;
        }
        // 0.0f = 0.0f;
        if (!(temp_f2 < 0.0f))
        {
            if (temp_f30 > 0.0f)
            {
                return 0U;
            }
            temp_f7 = -(temp_f30 + mathutil_sqrt((f64)temp_f1)) / temp_f31;
            // temp_f3 = ;
            // temp_f0_3 = ;
            vec_sp34.x = sp28.x + (sp1C.x * temp_f7);
            vec_sp34.y = sp28.y + (sp1C.y * temp_f7);
            vec_sp34.z = sp28.z + (sp1C.z * temp_f7);
            if (!(__fabs(vec_sp34.y) > (0.5 * cylinder->height)))
            {
                mathutil_mtxA_tf_point((Point3d *)&vec_sp34.x, outHitPos);
                outHitNormal->x = vec_sp34.x / cylinder->radius;
                outHitNormal->y = 0.0f;
                outHitNormal->z = vec_sp34.z / cylinder->radius;
                mathutil_mtxA_tf_vec(outHitNormal, outHitNormal);
                return 1U;
            }
        }
    }

    // FLT_EPSILON = FLT_EPSILON;
    if (sp1C.y < FLT_EPSILON)
    {
        halfHeight = 0.5 * cylinder->height;
        temp_f7 = (halfHeight - sp28.y) / sp1C.y;
        // temp_f0_5 = ;
        vec_sp34.x = sp28.x + (sp1C.x * temp_f7);
        vec_sp34.y = halfHeight;
        vec_sp34.z = sp28.z + (sp1C.z * temp_f7);
        // cylinder->radius = cylinder->radius;
        if ((mathutil_sum_of_sq_2(vec_sp34.x, vec_sp34.z)) > (cylinder->radius * cylinder->radius))
        {
            return 0U;
        }
        mathutil_mtxA_tf_point((Point3d *)&vec_sp34.x, outHitPos);
        // 0.0f = 0.0f;
        outHitNormal->x = 0.0f;
        outHitNormal->y = 1.0f;
        outHitNormal->z = 0.0f;
        mathutil_mtxA_tf_vec(outHitNormal, outHitNormal);
        return 1U;
    }
    if (sp1C.y > FLT_EPSILON)
    {
        negHalfHeight = 0.5 * -cylinder->height;
        temp_f7 = (negHalfHeight - sp28.y) / sp1C.y;
        // temp_f0_7 = ;
        vec_sp34.x = sp28.x + (sp1C.x * temp_f7);
        vec_sp34.y = negHalfHeight;
        vec_sp34.z = sp28.z + (sp1C.z * temp_f7);
        // cylinder->radius = cylinder->radius;
        if ((mathutil_sum_of_sq_2(vec_sp34.x, vec_sp34.z)) > (cylinder->radius * cylinder->radius))
        {
            return 0U;
        }
        mathutil_mtxA_tf_point((Point3d *)&vec_sp34.x, outHitPos);
        // 0.0f = 0.0f;
        outHitNormal->x = 0.0f;
        outHitNormal->y = 1.0f;
        outHitNormal->z = 0.0f;
        mathutil_mtxA_tf_vec(outHitNormal, outHitNormal);
        return 1U;
    }
    return 0U;
}

struct ColiSub24
{
    Point3d unk0;
    float unkC;
    float unk10;
    s16 unk14;
    s16 unk16;
    s16 unk18;
};

void stcoli_sub23(struct PhysicsBall *, struct ColiSub24 *);
void stcoli_sub24(struct PhysicsBall *, struct ColiSub24 *);

void collide_ball_with_goal(struct PhysicsBall *ball, struct StageGoal *goal)
{
    struct StageColiCylinder cylinder;
    Point3d objPos;
    struct ColiSub24 sp2C;
    struct ColiSub24 sp10;
    float radius;
    struct NaomiModel *temp_r3;

    mathutil_mtxA_from_translate(&goal->pos);
    mathutil_mtxA_rotate_z(goal->rotZ);
    mathutil_mtxA_rotate_y(goal->rotY);
    mathutil_mtxA_rotate_x(goal->rotX);
    temp_r3 = NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_GOAL_01);
    radius = temp_r3->boundSphereRadius;
    mathutil_mtxA_tf_point(&temp_r3->boundSphereCenter, &objPos);

    if (mathutil_vec_distance(&objPos, &ball->pos) > radius)
        return;

    mathutil_mtxA_push();
    objPos.x = 0.0f;
    objPos.y = 3.2f;
    objPos.z = 0.0f;
    mathutil_mtxA_tf_point(&objPos, &sp2C.unk0);
    sp2C.unkC = 2.25f;
    sp2C.unk10 = 0.1f;
    sp2C.unk14 = goal->rotX;
    sp2C.unk16 = goal->rotY;
    sp2C.unk18 = goal->rotZ;
    stcoli_sub23(ball, &sp2C);
    mathutil_mtxA_pop();

    mathutil_mtxA_push();
    objPos.x = 0.0f;
    objPos.y = 3.2f;
    objPos.z = 0.0f;
    mathutil_mtxA_tf_point(&objPos, &sp10.unk0);
    sp10.unkC = 2.25f;
    sp10.unk10 = 0.1f;
    sp10.unk14 = goal->rotX;
    sp10.unk16 = goal->rotY;
    sp10.unk18 = goal->rotZ;
    stcoli_sub24(ball, &sp10);
    mathutil_mtxA_pop();

    mathutil_mtxA_push();
    objPos.x = 1.1f;
    objPos.y = 0.75f;
    objPos.z = 0.0f;
    mathutil_mtxA_tf_point(&objPos, &cylinder.pos);
    cylinder.rot.x = goal->rotX;
    cylinder.rot.y = goal->rotY;
    cylinder.rot.z = goal->rotZ;
    cylinder.radius = 0.2f;
    cylinder.height = 1.5f;
    collide_ball_with_cylinder(ball, &cylinder);
    mathutil_mtxA_pop();

    mathutil_mtxA_push();
    objPos.x = -1.1f;
    objPos.y = 0.75f;
    objPos.z = 0.0f;
    mathutil_mtxA_tf_point(&objPos, &cylinder.pos);
    cylinder.rot.x = goal->rotX;
    cylinder.rot.y = goal->rotY;
    cylinder.rot.z = goal->rotZ;
    cylinder.radius = 0.2f;
    cylinder.height = 1.5f;
    collide_ball_with_cylinder(ball, &cylinder);
    mathutil_mtxA_pop();
}

void stcoli_sub22(struct PhysicsBall *arg0, struct ColiSub24 *arg1)
{
    Vec sp4C;
    Vec sp40;
    Point3d sp34;
    Point3d sp28;
    struct ColiPlane sp10;
    float temp_f31 = arg1->unkC + arg1->unk10 + arg0->radius;
    float temp_f30 = arg1->unkC - arg1->unk10 - arg0->radius;
    float temp_f1 = mathutil_vec_distance(&arg0->pos, &arg1->unk0);

    if (temp_f1 > temp_f31 || temp_f1 < temp_f30)
        return;

    mathutil_mtxA_from_translate(&arg1->unk0);
    mathutil_mtxA_rotate_z(arg1->unk18);
    mathutil_mtxA_rotate_y(arg1->unk16);
    mathutil_mtxA_rotate_x(arg1->unk14);
    mathutil_mtxA_rigid_inv_tf_point(&arg0->pos, &sp34);
    mathutil_mtxA_rigid_inv_tf_point(&arg0->prevPos, &sp28);

    sp40.x = sp34.x + sp28.x;
    sp40.y = sp34.y + sp28.y;
    sp40.z = 0.0f;
    mathutil_vec_set_len(&sp40, &sp40, arg1->unkC);
    if (func_8006A9B8(&sp28, &sp34, &sp40, &sp40, arg0->radius, arg1->unk10) != 0U)
    {
        sp4C.x = sp28.x - sp40.x;
        sp4C.y = sp28.y - sp40.y;
        sp4C.z = sp28.z - sp40.z;
        mathutil_vec_normalize_len(&sp4C);
        mathutil_mtxA_tf_vec(&sp4C, &sp10.normal);

        temp_f31 = arg1->unk10;
        sp40.x += sp4C.x * temp_f31;
        sp40.y += sp4C.y * temp_f31;
        sp40.z += sp4C.z * temp_f31;
        mathutil_mtxA_tf_point(&sp40, &sp10.point);

        collide_ball_with_plane(arg0, &sp10);
    }
}

void stcoli_sub23(struct PhysicsBall *arg0, struct ColiSub24 *arg1)
{
    Vec sp1C;
    Vec sp10;

    sp1C.x = 0.0f;
    sp1C.y = -1.0f;
    sp1C.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp1C, &sp1C);

    sp10.x = arg0->pos.x - arg1->unk0.x;
    sp10.y = arg0->pos.y - arg1->unk0.y;
    sp10.z = arg0->pos.z - arg1->unk0.z;
    mathutil_vec_normalize_len(&sp10);

    if (!(mathutil_vec_dot_prod(&sp1C, &sp10) > 0.7732404444))
        stcoli_sub22(arg0, arg1);
}

void stcoli_sub24(struct PhysicsBall *arg0, struct ColiSub24 *arg1)
{
    Vec sp4C;
    Vec sp40;
    Point3d sp34;
    Point3d sp28;
    struct ColiPlane sp10;
    float temp_f0;
    float temp_f1;
    float temp_f1_2;
    float temp_f31 = arg1->unkC + arg1->unk10 + arg0->radius;

    if (mathutil_vec_distance(&arg0->pos, &arg1->unk0) > temp_f31)
        return;

    mathutil_mtxA_from_translate(&arg1->unk0);
    mathutil_mtxA_rotate_z(arg1->unk18);
    mathutil_mtxA_rotate_y(arg1->unk16);
    mathutil_mtxA_rotate_x(arg1->unk14);
    mathutil_mtxA_rigid_inv_tf_point(&arg0->pos, &sp34);
    mathutil_mtxA_rigid_inv_tf_point(&arg0->prevPos, &sp28);
    sp40.x = (sp34.x + sp28.x) * 0.5;
    sp40.y = (sp34.y + sp28.y) * 0.5;
    sp40.z = 0.0f;
    if (sp40.y < -0.5f)
        sp40.y = -0.5f;
    temp_f1 = mathutil_sqrt(mathutil_sum_of_sq_2(sp40.x, sp40.y));
    temp_f0 = arg1->unkC;
    if (temp_f1 > temp_f0)
    {
        temp_f1_2 = temp_f0 / temp_f1;
        sp40.x *= temp_f1_2;
        sp40.y *= temp_f1_2;
        sp40.z *= temp_f1_2;
    }
    if (func_8006A9B8(&sp28, &sp34, &sp40, &sp40, arg0->radius, arg1->unk10) != 0U)
    {
        sp4C.x = sp28.x - sp40.x;
        sp4C.y = sp28.y - sp40.y;
        sp4C.z = sp28.z - sp40.z;
        mathutil_vec_normalize_len(&sp4C);
        mathutil_mtxA_tf_vec(&sp4C, &sp10.normal);

        temp_f31 = arg1->unk10;
        sp40.x += sp4C.x * temp_f31;
        sp40.y += sp4C.y * temp_f31;
        sp40.z += sp4C.z * temp_f31;
        mathutil_mtxA_tf_point(&sp40, &sp10.point);

        collide_ball_with_plane(arg0, &sp10);
    }
}

struct UnkStruct
{
    Point3d unk0;
    s32 unkC;
};

void stcoli_sub27(struct DynamicStagePart *dynStageParts);
void stcoli_sub28(struct StageColiTri *tri);
void stcoli_sub29(struct StageColiTri *tri, Point3d *arg1, Point3d *arg2, Point3d *arg3);

void g_collide_ball_with_dynstageparts(struct PhysicsBall *ball, struct DynamicStagePart *dynStageParts)
{
    u32 (*raycastDown)(Point3d *, Point3d *, Vec *) = dynStageParts[0].raycastDownFunc;
    struct StageColiTri *tri;
    struct UnkStruct *r27;
    struct UnkStruct *r5;
    struct UnkStruct *r26;
    struct UnkStruct *r25;
    float f29 = (double)mathutil_floor(ball->pos.x - 1.0);
    float f28 = (double)mathutil_floor(ball->pos.z - 1.0);
    int j;
    int i;
    struct StageColiTri triangles[32];
    struct UnkStruct sp20[16];

    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 4; j++)
        {
            r27 = &sp20[i * 4 + j];
            r27->unk0.x = f29 + (double)j;
            r27->unk0.y = 0.0f;
            r27->unk0.z = f28 + (double)i;
            r27->unkC = raycastDown(&r27->unk0, &r27->unk0, NULL);
        }
    }

    tri = triangles;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 3; j++)
        {
            r27 = &sp20[(i+0) * 4 + j+0];
            r5  = &sp20[(i+1) * 4 + j+0];
            r26 = &sp20[(i+1) * 4 + j+1];
            r25 = &sp20[(i+0) * 4 + j+1];
            if (r27->unkC != 0 && r5->unkC != 0 && r26->unkC != 0)
                stcoli_sub29(tri, &r27->unk0, &r5->unk0, &r26->unk0);
            else
                tri->flags = 0xFFFF;
            tri++;
            if (r27->unkC != 0 && r26->unkC != 0 && r25->unkC != 0)
                stcoli_sub29(tri, &r27->unk0, &r26->unk0, &r25->unk0);
            else
                tri->flags = 0xFFFF;
            tri++;
        }
    }

    tri = triangles;
    for (i = 3; i > 0; i--)
    {
        for (j = 3; j > 0; j--)
        {
            if (tri->flags == 0)
                collide_ball_with_tri_face(ball, tri);
            tri++;
            if (tri->flags == 0)
                collide_ball_with_tri_face(ball, tri);
            tri++;
        }
    }

    tri = triangles;
    for (i = 3; i > 0; i--)
    {
        for (j = 3; j > 0; j--)
        {
            if (tri->flags == 0)
                collide_ball_with_tri_edges(ball, tri);
            tri++;
            if (tri->flags == 0)
                collide_ball_with_tri_edges(ball, tri);
            tri++;
        }
    }

    tri = triangles;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 3; j++)
        {
            if (tri->flags == 0)
                collide_ball_with_tri_verts(ball, tri);
            tri++;
            if (tri->flags == 0)
                collide_ball_with_tri_verts(ball, tri);
            tri++;
        }
    }
}

void g_draw_stage_collision(void)
{
    Mtx sp24;
    Vec sp18;
    struct Ball *ball;
    struct AnimGroupInfo *phi_r29;
    struct StageAnimGroup *stageAg;
    int animGroupId;
    s16 *cellTris;
    struct StageColiCone *cone;
    int phi_r25;
    struct StageColiSphere *sphere;
    int phi_r26_3;
    struct StageColiCylinder *cylinder;
    int phi_r26_4;

    ball = currentBallStructPtr;
    mathutil_mtx_copy(mathutilData->mtxB, sp24);

    phi_r29 = animGroups;
    stageAg = decodedStageLzPtr->animGroups;
    for (animGroupId = 0; animGroupId < decodedStageLzPtr->animGroupCount; animGroupId++, phi_r29++, stageAg++)
    {
        if (animGroupId > 0)
        {
            mathutil_mtxA_from_mtx(sp24);
            mathutil_mtxA_mult_right(phi_r29->transform);
            mathutil_mtxA_to_mtx(mathutilData->mtxB);
        }
        sp18.x = ball->pos.x;
        sp18.y = ball->pos.y;
        sp18.z = ball->pos.z;
        if (animGroupId > 0)
        {
            mathutil_mtxA_from_mtx(phi_r29->transform);
            mathutil_mtxA_rigid_inv_tf_point(&sp18, &sp18);
        }
        cellTris = coligrid_lookup(stageAg, sp18.x, sp18.z);
        if (cellTris != NULL2)
        {
            while (*cellTris >= 0)
            {
                stcoli_sub28(&stageAg->triangles[*cellTris]);
                cellTris++;
            }
        }

        cone = stageAg->coliCones;
        for (phi_r25 = stageAg->coliConeCount; phi_r25 > 0; phi_r25--, cone++)
        {
            float scale;

            mathutil_mtxA_from_mtx(mathutilData->mtxB);
            mathutil_mtxA_translate(&cone->pos);
            mathutil_mtxA_rotate_z(cone->rot.z);
            mathutil_mtxA_rotate_y(cone->rot.y);
            mathutil_mtxA_rotate_x(cone->rot.x);
            mathutil_mtxA_scale(&cone->scale);
            scale = MAX(cone->scale.x, cone->scale.y);
            scale = MAX(scale, cone->scale.z);
            g_nl2ngc_set_scale(scale);
            nl2ngc_draw_model_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_COLI_CONE));
        }

        sphere = stageAg->coliSpheres;
        for (phi_r26_3 = stageAg->coliSphereCount; phi_r26_3 > 0; phi_r26_3--, sphere++)
        {
            mathutil_mtxA_from_mtx(mathutilData->mtxB);
            mathutil_mtxA_translate(&sphere->pos);
            mathutil_mtxA_scale_xyz(sphere->radius, sphere->radius, sphere->radius);
            g_nl2ngc_set_scale(sphere->radius);
            nl2ngc_draw_model_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_COLI_SPHERE));
        }

        cylinder = stageAg->coliCylinders;
        for (phi_r26_4 = stageAg->coliCylinderCount; phi_r26_4 > 0; phi_r26_4--, cylinder++)
        {
            mathutil_mtxA_from_mtx(mathutilData->mtxB);
            mathutil_mtxA_translate(&cylinder->pos);
            mathutil_mtxA_rotate_z(cylinder->rot.z);
            mathutil_mtxA_rotate_y(cylinder->rot.y);
            mathutil_mtxA_rotate_x(cylinder->rot.x);
            mathutil_mtxA_scale_xyz(cylinder->radius, cylinder->height, cylinder->radius);
            g_nl2ngc_set_scale(MAX(cylinder->radius, cylinder->height));
            nl2ngc_draw_model_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_COLI_CYLIN));
        }
    }
    mathutil_mtx_copy(sp24, mathutilData->mtxB);
    if (dynamicStageParts != NULL)
        stcoli_sub27(dynamicStageParts);
}

void stcoli_sub27(struct DynamicStagePart *dynStageParts)
{
    u32 (*raycastDown)(Point3d *, Point3d *, Vec *) = dynStageParts[0].raycastDownFunc;
    struct UnkStruct *r27;
    struct UnkStruct *r5;
    struct UnkStruct *r26;
    struct UnkStruct *r25;
    float f29 = (double)mathutil_floor(currentBallStructPtr->pos.x - 1.0);
    float f28 = (double)mathutil_floor(currentBallStructPtr->pos.z - 1.0);
    int j;
    int i;
    struct StageColiTri triangle;
    struct UnkStruct sp20[16];

    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 4; j++)
        {
            r27 = &sp20[i * 4 + j];
            r27->unk0.x = f29 + (double)j;
            r27->unk0.y = 0.0f;
            r27->unk0.z = f28 + (double)i;
            r27->unkC = raycastDown(&r27->unk0, &r27->unk0, NULL);
        }
    }

    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 3; j++)
        {
            r27 = &sp20[(i+0) * 4 + j+0];
            r5  = &sp20[(i+1) * 4 + j+0];
            r26 = &sp20[(i+1) * 4 + j+1];
            r25 = &sp20[(i+0) * 4 + j+1];
            if (r27->unkC != 0 && r5->unkC != 0 && r26->unkC != 0)
            {
                stcoli_sub29(&triangle, &r27->unk0, &r5->unk0, &r26->unk0);
                stcoli_sub28(&triangle);
            }
            if (r27->unkC != 0 && r26->unkC != 0 && r25->unkC != 0)
            {
                stcoli_sub29(&triangle, &r27->unk0, &r26->unk0, &r25->unk0);
                stcoli_sub28(&triangle);
            }
        }
    }
}

void stcoli_sub28(struct StageColiTri *tri)
{
    Point3d sp3C;
    Mtx mtx;
    float f0, f1;

    mathutil_mtxA_from_translate(&tri->pos);
    mathutil_mtxA_rotate_y(tri->rot.y);
    mathutil_mtxA_rotate_x(tri->rot.x);
    mathutil_mtxA_rotate_z(tri->rot.z);
    mathutil_mtxA_to_mtx(mtx);
    sp3C.x = tri->vert2.x;
    sp3C.y = tri->vert2.y;
    sp3C.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp3C, &sp3C);
    mtx[0][0] = sp3C.x;
    mtx[1][0] = sp3C.y;
    mtx[2][0] = sp3C.z;
    sp3C.x = tri->vert3.x;
    sp3C.y = tri->vert3.y;
    sp3C.z = 0.0f;
    mathutil_mtxA_tf_vec(&sp3C, &sp3C);
    mtx[0][1] = sp3C.x;
    mtx[1][1] = sp3C.y;
    mtx[2][1] = sp3C.z;
    mathutil_mtxA_from_mtx(mathutilData->mtxB);
    mathutil_mtxA_mult_right(mtx);
    f0 = mathutil_sum_of_sq_2(tri->vert2.x, tri->vert2.y);
    f1 = mathutil_sum_of_sq_2(tri->vert3.x, tri->vert3.y);
    if (f0 > f1)
        f1 = f0;
    g_nl2ngc_set_scale(f1);
    nl2ngc_draw_model_sorted(NLOBJ_MODEL(naomiCommonObj, NLMODEL_common_TRIANGLE_XY));
}

void stcoli_sub29(struct StageColiTri *tri, Point3d *arg1, Point3d *arg2, Point3d *arg3)
{
    float temp_f1;
    float temp_f31;
    float temp_f30;
    Point3d sp3C;
    Point3d sp30;
    Point3d sp24;
    Point3d sp18;

    sp24.x = arg2->x - arg1->x;
    sp24.y = arg2->y - arg1->y;
    sp24.z = arg2->z - arg1->z;
    sp18.x = arg3->x - arg1->x;
    sp18.y = arg3->y - arg1->y;
    sp18.z = arg3->z - arg1->z;

    mathutil_vec_cross_prod(&sp24, &sp18, &sp3C);
    tri->pos = *arg1;
    tri->rot.y = mathutil_atan2(sp3C.x, sp3C.z);
    tri->rot.x = -mathutil_atan2(sp3C.y, mathutil_sqrt(sp3C.x * sp3C.x + sp3C.z * sp3C.z));
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(tri->rot.y);
    mathutil_mtxA_rotate_x(tri->rot.x);
    mathutil_mtxA_rigid_inv_tf_vec(&sp24, &sp30);
    tri->rot.z = mathutil_atan2(sp30.y, sp30.x);
    mathutil_mtxA_rotate_z(tri->rot.z);
    mathutil_mtxA_rigid_inv_tf_point(&sp24, &sp24);
    mathutil_mtxA_rigid_inv_tf_point(&sp18, &sp18);
    tri->normal.x = 0.0f;
    tri->normal.y = 0.0f;
    tri->normal.z = 1.0f;
    mathutil_mtxA_tf_vec(&tri->normal, &tri->normal);
    tri->vert2.x = sp24.x;
    tri->vert2.y = sp24.y;
    tri->vert3.x = sp18.x;
    tri->vert3.y = sp18.y;
    temp_f31 = -(sp18.y - sp24.y);
    temp_f30 = sp18.x - sp24.x;
    temp_f1 = (temp_f31 * temp_f31) + (temp_f30 * temp_f30);
    if (temp_f1 <= 1.1920929e-7f)
    {
        func_8003026C(2, "edge length is too short\n");
        return;
    }
    temp_f1 = mathutil_rsqrt(temp_f1);
    tri->edge2Normal.x = temp_f31 * temp_f1;
    tri->edge2Normal.y = temp_f30 * temp_f1;
    temp_f31 = (double)sp18.y;
    temp_f30 = (double)-sp18.x;
    temp_f1 = (temp_f31 * temp_f31) + (temp_f30 * temp_f30);
    if (temp_f1 <= 1.1920929e-7f)
    {
        func_8003026C(2, "edge length is too short\n");
        return;
    }
    temp_f1 = mathutil_rsqrt(temp_f1);
    tri->edge3Normal.x = temp_f31 * temp_f1;
    tri->edge3Normal.y = temp_f30 * temp_f1;
    tri->flags = 0;
}

void stcoli_sub30(struct PhysicsBall *src, struct PhysicsBall *dest)
{
    mathutil_mtxA_tf_point(&src->pos, &dest->pos);
    mathutil_mtxA_tf_point(&src->prevPos, &dest->prevPos);
    mathutil_mtxA_tf_vec(&src->vel, &dest->vel);
}

void stcoli_sub31(struct PhysicsBall *src, struct PhysicsBall *dest)
{
    mathutil_mtxA_rigid_inv_tf_point(&src->pos, &dest->pos);
    mathutil_mtxA_rigid_inv_tf_point(&src->prevPos, &dest->prevPos);
    mathutil_mtxA_rigid_inv_tf_vec(&src->vel, &dest->vel);
}
