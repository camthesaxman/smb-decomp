#ifndef _SRC_OBJ_COLLISION_H_
#define _SRC_OBJ_COLLISION_H_

void ev_obj_collision_init(void);
void ev_obj_collision_main(void);
void ev_obj_collision_dest(void);
u32 func_8006A9B8(Point3d *, Point3d *, Point3d *, Point3d *, float, float);
extern u32 func_8006AAEC(Point3d *, Point3d *, Point3d *, Point3d *, float,  float);
void func_8006AD3C(Vec *, Vec *, Vec *, float, float);

#endif
