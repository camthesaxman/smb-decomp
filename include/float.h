#ifndef _FLOAT_H_
#define _FLOAT_H_

#if TARGET_PC
#if _MSC_VER
#include <../ucrt/float.h>
#else
#include_next <float.h>
#endif
#else

#define FLT_EPSILON 1.1920928955078125e-07f

#endif

#endif
