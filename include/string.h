#ifndef _STRING_H_
#define _STRING_H_

#include <stddef.h>

void *memset(void *dest, int ch, size_t count);
size_t strlen(const char *s);
int strncmp(const char *s1, const char *s2, size_t n);

#endif
