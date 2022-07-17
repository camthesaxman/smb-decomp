#include <string.h>
#include <dolphin.h>

u32 PADRead(PADStatus *status)
{
    puts("PADRead is a stub");
    memset(status, 0, sizeof(*status) * PAD_MAX_CONTROLLERS);
    return 0;
}
