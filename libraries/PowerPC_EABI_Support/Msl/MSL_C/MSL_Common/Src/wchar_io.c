#include <wchar.h>

int fwide(FILE *stream, int mode)
{
    if (stream->unk4b7 == 0)
        return 0;
    switch (stream->unk4b10)
    {
    case 0:
        if (mode > 0)
            stream->unk4b10 = 2;
        else if (mode < 0)
            stream->unk4b10 = 1;
        return mode;
    case 2:
        return 1;
    case 1:
        return -1;
    }
}
