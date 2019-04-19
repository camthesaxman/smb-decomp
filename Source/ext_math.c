#include "ext_math.h"

//Initialize PS Quantization values
void ExtMath_Init() {
	OSInitFastCast();
}

//Stuff with square roots
float ExtMath_PolyInvSqrt(float x,float b) {
	//TODO: not 100% sure if this is correct, but I'm fairly certain.
	x = __frsqrte(x);
	for(int i=0; i<3; i++) {
		float e = x*x;
		e = (3f*b)-(b*x*e);
		x *= e;
	}
	return x;
}
float ExtMath_Sqrt(float x) {
	//TODO: There appears to be extra error-handling stuff in this function,
	//figure out how it works, and implement.
	return x*ExtMath_PolyInvSqrt(x,gxCalc.cnstHalf);
}
float ExtMath_InvSqrt(float x) {
	//TODO: There's some extra error-handling stuff in this function,
	//figure out how it works, and implement.
	return ExtMath_PolyInvSqrt(x,gxCalc.cnstHalf);
}
void ExtMath_SqrtPtr(float x,float * result) {
	//TODO: There's some extra error-handling stuff in this function,
	//figure out how it works, and implement.
	*result = ExtMath_PolyInvSqrt(x,gxCalc.cnstHalf);
}

//Trig functions, utilizing the special 16-bit angle format
//as seen in stage LZ files
float ExtMath_Sin(short a) {
	int idx = a&0x3FFF;
	if(idx&0x4000) {idx = 0x4000-idx;}
	float y = sin_lut[idx];
	return (idx&0x8000)?-y:y;
}
void ExtMath_SinCosArr(short a,float * result) {
	//TODO: FINISH
}
void ExtMath_SinCosPtrs(short a,float * rs,float * rc) {
	//TODO: FINISH
}
float ExtMath_Tan(short a) {
	int idx = a&0x3FFF;
	if(idx&0x4000 == 0) {return tan_lut[idx];}
	return -tan_lut[0x4000-idx];
}
short ExtMath_Atan2(float y,float x) {
	//TODO: FINISH
}
short ExtMath_UnknownFunc80007300(float x) {
	//TODO: FINISH
}
short ExtMath_UnknownFunc80007424(float x) {
	//TODO: FINISH
}

//Matrix stuff (there's a lot here :O)