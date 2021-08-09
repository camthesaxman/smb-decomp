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

double fabs(double x);
double sin(double x);
double cos(double x);

float sinf(float x);
float acosf(float x);

inline int	abs (int n) { return(__abs(n)); }

#endif
