#ifndef _DOLPHIN_MTX_H_
#define _DOLPHIN_MTX_H_

typedef struct
{
	f32 x, y, z;
} Vec, *VecPtr, Point3d, *Point3dPtr;

typedef f32 Mtx[3][4];
typedef f32 Mtx44[4][4];

void C_MTXOrtho( Mtx44 m, f32 t, f32 b, f32 l, f32 r, f32 n, f32 f);
void C_MTXPerspective(Mtx44 m, f32 fovY, f32 aspect, f32 n, f32 f);
void C_MTXScale(Mtx m, f32 xS, f32 yS, f32 zS);
void C_MTXLookAt(Mtx m, Point3dPtr camPos, VecPtr camUp, Point3dPtr target);

void PSMTXIdentity(Mtx m);

#define MTXLookAt C_MTXLookAt

#endif
