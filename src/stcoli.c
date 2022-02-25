
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
    struct Struct8003DE2C_Stcoli coliHit;
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