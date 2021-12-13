#include <dolphin.h>

#include "global.h"

int decompress_lz(u8 *src, void *dest)
{
    u8 unused[0x18];
    u8 ringBuf[4096];
    u32 offset;
    s32 j;
    int i;
    u32 bufPos;  // position in ringBuf
    u8 *srcp;  // src read pointer
    u8 *destp;  // dest write pointer
    u32 flags;
    u32 srcSize;
    u32 destSize;

    srcSize = __lwbrx(src, 0);
    destSize = __lwbrx(src, 4);
    if (srcSize == 0 || destSize == 0)
        return 0;

    srcp = (u8 *)src + 8;
    destp = dest;

    for (j = 0; j < 4078; j++)
        ringBuf[j] = 0;

    bufPos = 4078;
    flags = 0;
    while (1)
    {
        flags >>= 1;

        if (!(flags & 0x100))
        {
            u8 byte = *srcp;

            if (srcp - src >= srcSize)
                break;
            flags = byte | 0xFF00;
            srcp++;
        }
        if (flags & 1)
        {
            u8 byte = *srcp;

            if (srcp - src >= srcSize)
                break;
            *destp = byte;
            ringBuf[bufPos++] = byte;
            bufPos %= 4096;
            srcp++;
            destp++;
        }
        else
        {
            int length;
            u32 r8;

            offset = srcp[0];
            if (srcp - src >= srcSize)
                break;
            r8 = srcp[1];
            if (srcp + 1 - src >= srcSize)
                break;
            srcp += 2;

            length = (r8 & 0xF) + 2;
            offset |= (r8 & 0xF0) << 4;

            for (i = 0; i <= length; i++)
            {
                u8 byte = ringBuf[(offset + i) % 4096];

                *destp = byte;
                ringBuf[bufPos++] = byte;
                bufPos %= 4096;
                destp++;
            }

        }
    }

    return destSize;
}
