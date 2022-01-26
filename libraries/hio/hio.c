#include <dolphin.h>

#include "../os/__os.h"

static s32 Chan = -1;

BOOL HIOReadMailbox(u32 *word)
{
    u32 var;
    BOOL failed;

    if (Chan == -1 || __OSGetDIConfig() == 0xFF)
        return FALSE;
    if (EXILock(Chan, 0, 0) == 0)
        return FALSE;
    if (EXISelect(Chan, 0, 4) == 0)
    {
        EXIUnlock(Chan);
        return FALSE;
    }

    var = 0x60000000;
    failed  = !EXIImm(Chan, &var, 2, 1, 0);
    failed |= !EXISync(Chan);
    failed |= !EXIImm(Chan, word, 4, 0, 0);
    failed |= !EXISync(Chan);
    failed |= !EXIDeselect(Chan);
    EXIUnlock(Chan);

    return !failed;
}

BOOL HIOWriteMailbox(u32 word)
{
    u32 var;
    BOOL failed;

    if (Chan == -1 || __OSGetDIConfig() == 0xFF)
        return FALSE;
    if (EXILock(Chan, 0, 0) == 0)
        return FALSE;
    if (EXISelect(Chan, 0, 4) == 0)
    {
        EXIUnlock(Chan);
        return FALSE;
    }

    var = (word & 0x1FFFFFFF) | 0xC0000000;
    failed  = !EXIImm(Chan, &var, 4, 1, 0);
    failed |= !EXISync(Chan);
    failed |= !EXIDeselect(Chan);
    EXIUnlock(Chan);

    return !failed;
}

BOOL HIORead(u32 addr, void *buffer, s32 size)
{
    u32 var;
    BOOL failed;

    if (Chan == -1 || __OSGetDIConfig() == 0xFF)
        return FALSE;
    if (EXILock(Chan, 0, 0) == 0)
        return FALSE;
    if (EXISelect(Chan, 0, 4) == 0)
    {
        EXIUnlock(Chan);
        return FALSE;
    }

    var = ((addr << 8) & 0x1FFFC00) | 0x20000000;
    failed  = !EXIImm(Chan, &var, 4, 1, 0);
    failed |= !EXISync(Chan);
    failed |= !EXIDma(Chan, buffer, size, 0, 0);
    failed |= !EXISync(Chan);
    failed |= !EXIDeselect(Chan);
    EXIUnlock(Chan);

    return !failed;
}

BOOL HIOWrite(u32 addr, void *buffer, s32 size)
{
    u32 var;
    BOOL failed;

    if (Chan == -1 || __OSGetDIConfig() == 0xFF)
        return FALSE;
    if (EXILock(Chan, 0, 0) == 0)
        return FALSE;
    if (EXISelect(Chan, 0, 4) == 0)
    {
        EXIUnlock(Chan);
        return FALSE;
    }

    var = ((addr << 8) & 0x1FFFC00) | 0xA0000000;
    failed  = !EXIImm(Chan, &var, 4, 1, 0);
    failed |= !EXISync(Chan);
    failed |= !EXIDma(Chan, buffer, size, 1, 0);
    failed |= !EXISync(Chan);
    failed |= !EXIDeselect(Chan);
    EXIUnlock(Chan);

    return !failed;
}
