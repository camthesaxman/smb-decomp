#ifndef _STDLIB_H_
#define _STDLIB_H_

#if TARGET_PC
#if _MSC_VER
#include <../ucrt/stdlib.h>
#else
#include_next <stdlib.h>
#endif
#else

#include <stddef.h>
#include <wchar.h>

#define RAND_MAX 32767

void srand(unsigned int seed);
int rand(void);
void exit(int status);
size_t wcstombs(char *dest, const wchar_t *src, size_t max);

#endif

#endif
