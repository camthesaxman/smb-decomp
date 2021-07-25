#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

void init_cache_ptrs(void)
{
    mathutilData->constZero = 0.0f;
    mathutilData->constOne = 1.0f;
    mathutilData->constOneHalf = 0.5f;
    mathutilData->constThreeHalves = 1.5f;
    mathutilData->unk1A8 = -1;
    mathutilData->unk1AC = 0;
    mathutilData->unk1AD = 1;
    mathutilData->unk1AE = 1;
    mathutilData->unk1AF = 0;
    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtxB();
    mathutilData->mtxStack = OSAllocFromHeap(__OSCurrHeap, 32 * sizeof(Mtx));
    mathutilData->mtxStackPtr = mathutilData->mtxStack + 32;
}
