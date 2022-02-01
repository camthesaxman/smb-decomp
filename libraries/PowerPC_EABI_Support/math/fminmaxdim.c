#include <math.h>
#include "fdlibm.h"

long __fpclassifyd(double x)
{
    int i = __HI(x);

    switch (i & 0x7FF00000)
    {
    case 0x7FF00000:
        if ((i & 0x000FFFFF) || (__LO(x) & 0xFFFFFFFF))
            return FP_NAN;
        else
            return FP_INFINITE;
        break;
    case 0:
        if ((i & 0x000FFFFF) || (__LO(x) & 0xFFFFFFFF))
            return FP_SUBNORMAL;
        else
            return FP_ZERO;
        break;
    }
    return FP_NORMAL;
}
