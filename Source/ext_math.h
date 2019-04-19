#ifndef _EXTMATH_H_
#define _EXTMATH_H_

//Includes
#include "trig_lut.h"

//Functions
void ExtMath_Init();
float ExtMath_PolyInvSqrt(float x,float b);
//EMPTY FUNCTION WAS HERE
float ExtMath_Sqrt(float x);
float ExtMath_InvSqrt(float x);
void ExtMath_SqrtPtr(float x,float * result);
float ExtMath_Sin(short a);
void ExtMath_SinCosArr(short a,float * result);
void ExtMath_SinCosPtrs(short a,float * rs,float * rc);
float ExtMath_Tan(short a);
short ExtMath_Atan2(float y,float x);
short ExtMath_UnknownFunc80007300(float x);
short ExtMath_UnknownFunc80007424(float x);
float ExtMath_VectorCos(Vec * va,Vec * vb);
float ExtMath_SetMtxAsIdentity(Mtx * m);
void ExtMath_SetAMtxAsIdentity();
void ExtMath_SetAMtxAsIdentity3x3();
void ExtMath_SetAMtxTranslationVec(Vec * t);
void ExtMath_SetAMtxTranslationFlt(float x,float y,float z);
void ExtMath_SetAMtxRotationX(short a);
void ExtMath_SetAMtxRotationY(short a);
void ExtMath_SetAMtxRotationZ(short a);
void ExtMath_ScaleBMtxToAMtx(Vec * s);
void ExtMath_NormalizeAMtxColsFromRows();
void ExtMath_PushAMtx();
void ExtMath_PopAMtx();
void ExtMath_GetAMtx(Mtx * m);
void ExtMath_SetAMtx(Mtx * m);
void ExtMath_GetStackMtx(Mtx * m);
void ExtMath_PopMtx();
//EMPTY FUNCTION WAS HERE
void ExtMath_GetAMtx3x3(Mtx * m);
void ExtMath_SetAMtx3x3(Mtx * m);
void ExtMath_CopyBMtxToAMtx();
void ExtMath_CopyAMtxToBMtx();
void ExtMath_CopyMtx(Mtx * m1,Mtx * m2);

#endif