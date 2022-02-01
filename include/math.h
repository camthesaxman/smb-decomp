#ifndef _MATH_H_
#define _MATH_H_

// stop gcc from complaining
#ifndef __MWERKS__
extern int __abs(int);
extern float __fabs(float);
#endif

#define NAN       (0.0f / 0.0f)
#define HUGE_VALF (1.0f / 0.0f)
#define INFINITY  (1.0f / 0.0f)

#define FLT_EPSILON 1.1920928955078125e-07f

double fabs(double x);
double sin(double x);
double cos(double x);

float sinf(float x);
float acosf(float x);

double ldexp(double x, int exp);

inline int abs(int n) { return(__abs(n)); }

double scalbn(double x, int n);

double copysign(double x, double y);

double floor (double x);

double fabs(double x);

#ifdef __MWERKS__
#pragma cplusplus on
#endif

long __fpclassifyf(float x);
long __fpclassifyd(double x);

#define FP_NAN       1
#define FP_INFINITE  2
#define FP_ZERO      3
#define FP_NORMAL    4
#define FP_SUBNORMAL 5

#define fpclassify(x) (sizeof(x) == sizeof(float) ? __fpclassifyf((float)(x)) : __fpclassifyd((double)(x)))
#define isfinite(x) ((fpclassify(x) > FP_INFINITE))

#ifdef __MWERKS__
#pragma cplusplus reset
#endif

#endif
