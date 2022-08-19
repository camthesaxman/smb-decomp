/* @(#)s_fabs.c 1.3 95/01/18 */
/*
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunSoft, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice 
 * is preserved.
 * ====================================================
 */
/*
 * fabs(x) returns the absolute value of x.
 */
#include "fdlibm.h"
#undef fabs

#ifdef __STDC__
	double fabs(double x)
#else
	double fabs(x)
	double x;
#endif
{
#ifdef __MWERKS__
    return __fabs(x);
#else
    return (x >= 0.0) ? x : -x;
#endif
}
