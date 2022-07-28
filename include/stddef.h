#ifndef _STDDEF_H_
#define _STDDEF_H_

#if TARGET_PC
#if _MSC_VER
#include <../ucrt/stddef.h>
#else
#include_next <stddef.h>
#endif
#else

#define offsetof(type, member)	((size_t) &(((type *) 0)->member))

typedef unsigned int size_t;

#ifndef NULL
#define NULL 0L
#endif

#endif

#endif
