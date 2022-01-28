#include <stdint.h>
#include <string.h>

#include "mem_funcs.h"

int memcmp(const void *str1, const void *str2, size_t n)
{
    const unsigned char *s1 = (unsigned char *)str1 - 1;
    const unsigned char *s2 = (unsigned char *)str2 - 1;

    n++;
    while (--n != 0)
    {
        s1++;
        s2++;
        if (*s1 != *s2)
            return (*s1 < *s2) ? -1 : 1;
    }
    return 0;
}

void *memchr(const void *str, int c, size_t n)
{
    unsigned char chr = c;
    const unsigned char *s = (unsigned char *)str - 1;

    n++;
    while (--n != 0)
    {
        if (*++s == chr)
            return (void *)s;
    }
    return NULL;
}

void *memmove(void *dst, const void *src, size_t n)
{
    int reversed = (unsigned char *)dst > (unsigned char *)src;

    if (n >= 32)
    {
        if ((((uintptr_t)dst ^ (uintptr_t)src) & 3) != 0)
        {
            if (!reversed)
                __copy_longs_unaligned(dst, src, n);
            else
                __copy_longs_rev_unaligned(dst, src, n);
        }
        else
        {
            if (!reversed)
                __copy_longs_aligned(dst, src, n);
            else
                __copy_longs_rev_aligned(dst, src, n);
        }
        return dst;
    }
    else
    {
        const unsigned char *s;
        unsigned char *d;

        if (!reversed)
        {
            s = (unsigned char *)src - 1;
            d = (unsigned char *)dst - 1;
            n++;
            while (--n != 0)
                *++d = *++s;
        }
        else
        {
            s = (unsigned char *)src + n;
            d = (unsigned char *)dst + n;
            n++;
            while (--n != 0)
                *--d = *--s;
        }
        return dst;
    }
}
