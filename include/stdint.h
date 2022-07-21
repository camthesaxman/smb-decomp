#ifndef _STDINT_H_
#define _STDINT_H_

#if TARGET_PC
#if _MSC_VER
#include <../../14.32.31326/include/stdint.h>
#else
#include_next <stdint.h>
#endif
#else

typedef unsigned long int uintptr_t;

#endif

#endif
