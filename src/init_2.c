#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

struct MathutilData *mathutilData;

void init_cache_ptrs(void)
{
    mathutilData->constZeroF = 0.0f;
    mathutilData->constOneF = 1.0f;
    mathutilData->constOneHalfF = 0.5f;
    mathutilData->constThreeHalvesF = 1.5f;
    mathutilData->unk1A8 = -1;
    mathutilData->constZeroOne[0] = 0;
    mathutilData->constZeroOne[1] = 1;
    mathutilData->constOneZero[0] = 1;
    mathutilData->constOneZero[1] = 0;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtxB();
    mathutilData->mtxStack = OSAllocFromHeap(__OSCurrHeap, 32 * sizeof(Mtx));
    mathutilData->mtxStackPtr = mathutilData->mtxStack + 32;
}
