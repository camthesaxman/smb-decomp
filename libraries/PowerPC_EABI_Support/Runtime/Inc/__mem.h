#ifndef ___mem_
#define ___mem_

#include <stddef.h>

__declspec(section ".init") void * memset(void * dst, int val, size_t n);
__declspec(section ".init") void __fill_mem(void * dst, int val, size_t n);
__declspec(section ".init") void *memcpy(void *dst, const void *src, size_t n);

#endif
