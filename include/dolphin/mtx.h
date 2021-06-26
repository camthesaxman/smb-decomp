#ifndef _DOLPHIN_MTX_H_
#define _DOLPHIN_MTX_H_

typedef f32 Mtx44[4][4];

void C_MTXPerspective(Mtx44 m, f32 fovY, f32 aspect, f32 n, f32 f);

#endif
