#include <stddef.h>

#include "global.h"
#include "types.h"
#include "stage.h"
#include "stcoli.h"
#include "mathutil.h"

void g_handle_ball_stage_collision(struct PhysicsBall* b, struct Stage* arg1) {
    struct StageColiTri tri;
    struct StageCollHdr *collHdr;
    int itemgroupId;
    s16 *cellTris;
    s16 *cellTriIdx;

    struct StageColiCone *cone;
    struct StageColiSphere *sphere;
    struct StageColiCylinder *cylinder;
    struct StageGoal *goal;
    int i;

    if (dipSwitches & DIP_TRIANGLE) {
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
        stcoli_sub03(b, &tri);
        stcoli_sub04(b, &tri);
        stcoli_sub06(b, &tri);
        return;
    }

    collHdr = arg1->collHdrs;
    for (itemgroupId = 0; itemgroupId < arg1->collHdrsCount; itemgroupId++, collHdr++) {
        if (itemgroupId != b->itemgroupId) {
            tf_physball_to_itemgroup_space(b, itemgroupId);
        }
        cellTris = meshcoli_grid_lookup(collHdr, b->pos.x, b->pos.z);
        if (cellTris != NULL) {
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++) {
                stcoli_sub03(b, &collHdr->triangles[*cellTriIdx]);
            }
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++) {
                stcoli_sub04(b, &collHdr->triangles[*cellTriIdx]);
            }
            for (cellTriIdx = cellTris; *cellTriIdx >= 0; cellTriIdx++) {
                stcoli_sub06(b, &collHdr->triangles[*cellTriIdx]);
            }
        }

        cone = collHdr->coliCones;
        for (i = collHdr->coliConeCount; i > 0; i--, cone++) {
            stcoli_sub12(b, cone);
        }
        sphere = collHdr->coliSpheres;
        for (i = collHdr->coliSphereCount; i > 0; i--, sphere++) {
            stcoli_sub11(b, sphere);
        }
        cylinder = collHdr->coliCylinders;
        for (i = collHdr->coliCylinderCount; i > 0; i--, cylinder++) {
            stcoli_sub09(b, cylinder);
        }
        goal = collHdr->goals;
        for (i = collHdr->goalCount; i > 0; i--, goal++) {
            stcoli_sub21(b, goal);
        }
    }

    if (b->itemgroupId != 0) {
        tf_physball_to_itemgroup_space(b, 0);
    }
    if (dynamicStageParts != NULL) {
        stcoli_sub25(b, dynamicStageParts);
    }
}

s16 *meshcoli_grid_lookup(struct StageCollHdr* coliHeader, f32 x, f32 z) {
    int cellX;
    int cellZ;

    if (coliHeader->gridCells == NULL2) {
        return NULL;
    }

    cellX = mathutil_floor((x - coliHeader->gridOriginX) / coliHeader->gridStepX);
    cellZ = mathutil_floor((z - coliHeader->gridOriginZ) / coliHeader->gridStepZ);

    if (cellX < 0 || cellX >= coliHeader->gridDimX) {
        return NULL;
    }
    if (cellZ < 0 || cellZ >= coliHeader->gridDimZ) {
        return NULL;
    }
    return coliHeader->gridCells[cellZ * coliHeader->gridDimX + cellX];
}