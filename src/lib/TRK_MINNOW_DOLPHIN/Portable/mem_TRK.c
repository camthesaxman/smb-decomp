#include <stddef.h>

__declspec(section ".init") void *TRK_memcpy(void *dst, const void *src, size_t n);
__declspec(section ".init") void *TRK_memset(void *dst, int val, size_t n);

void *TRK_memcpy(void *dst, const void *src, size_t n)
{
    const unsigned char *s = (const unsigned char *)src - 1;
    unsigned char *d = (unsigned char *)dst - 1;

    n++;
    while (--n != 0)
        *++d = *++s;
    return dst;
}

#ifdef NONMATCHING  // very minor scheduling difference at the beginning
void TRK_fill_mem(void * dst, int val, size_t n)
{
	unsigned long			v = (unsigned char) val;
	unsigned long			i;
	
	((unsigned char *) dst) = ((unsigned char *) dst) - 1;
	
	if (n >= 32)
	{
		i = (~ (unsigned long) dst) & 3;

		if (i) {
			n -= i;
			
			do {
				*++(((unsigned char *) dst)) = v;
			} while (--i);
		}
	
		if (v)
			v |= v << 24 | v << 16 | v <<  8;
		
		((unsigned long *) dst) = ((unsigned long *) (((unsigned char *) dst) + 1)) - 1;
		
		i = n >> 5;
		
		if (i) {
			do {
				*++((unsigned long *) dst) = v;
				*++((unsigned long *) dst) = v;
				*++((unsigned long *) dst) = v;
				*++((unsigned long *) dst) = v;
				*++((unsigned long *) dst) = v;
				*++((unsigned long *) dst) = v;
				*++((unsigned long *) dst) = v;
				*++((unsigned long *) dst) = v;
			} while (--i);
		}
		
		i = (n & 31) >> 2;
		
		if (i) {
			do {
				*++((unsigned long *) dst) = v;
			} while (--i);
		}
		
		((unsigned char *) dst) = ((unsigned char *) (((unsigned long *) dst) + 1)) - 1;
		
		n &= 3;
	}
	
	if (n)
		do {
			*++((unsigned char *) dst) = v;
		} while (--n);
	
	return;
}
#else
asm void TRK_fill_mem(void * dst, int val, size_t n)
{
    nofralloc
#include "../asm/nonmatchings/TRK_fill_mem.s"
}
#pragma peephole on
#endif

#ifdef NONMATCHING  // stack and scheduling differences
void *TRK_memset(void *dst, int val, size_t n)
{
	TRK_fill_mem(dst, val, n);
	
	return(dst);
}
#else
asm void *TRK_memset(void *dst, int val, size_t n)
{
    nofralloc
#include "../asm/nonmatchings/TRK_memset.s"
}
#endif
