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

inline int	abs (int n) { return(__abs(n)); }

double scalbn(double x, int n);

#ifdef __MWERKS__
#pragma cplusplus on
inline double scalbn(double x, int n) {return ldexp(x,n);}
inline double fabs(double x) { return __fabs(x); }
#pragma cplusplus reset
#endif

#endif
