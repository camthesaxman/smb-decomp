#include <dolphin.h>

#include "variables.h"
#include "functions.h"

void init_cache_ptrs(void)
{
    lbl_802F1B60->unk198 = 0.0f;
    lbl_802F1B60->unk19C = 1.0f;
    lbl_802F1B60->unk1A0 = 0.5f;
    lbl_802F1B60->unk1A4 = 1.5f;
    lbl_802F1B60->unk1A8 = -1;
    lbl_802F1B60->unk1AC = 0;
    lbl_802F1B60->unk1AD = 1;
    lbl_802F1B60->unk1AE = 1;
    lbl_802F1B60->unk1AF = 0;
    mathutil_set_a_mtx_identity();
    mathutil_set_b_mtx_a_mtx();
    lbl_802F1B60->unk90 = OSAllocFromHeap(__OSCurrHeap, 0x600);
    lbl_802F1B60->unk94 = lbl_802F1B60->unk90 + 0x600;
}
