#ifndef _WCHAR_H_
#define _WCHAR_H_

#if TARGET_PC
#if _MSC_VER
#include <../ucrt/wchar.h>
#else
#include_next <wchar.h>
#endif
#else

#include <stdio.h>

typedef unsigned short wchar_t;

int fwide(FILE *stream, int mode);

#endif

#endif
