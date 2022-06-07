#include <stdlib.h>

size_t wcstombs(char *dest, const wchar_t *src, size_t max)
{
    char c;
    size_t n;

    for (n = 0; n < max; n++)
    {
        c = *src++;
        *dest++ = c;
        if (c == 0)
            break;
    }
    return n;
}
