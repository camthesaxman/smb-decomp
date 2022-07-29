#ifndef _SRC_BYTESWAP_H_
#define _SRC_BYTESWAP_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include "gma.h"
#include "mot_ape.h"
#include "stage.h"
#include "nl2ngc.h"

    void byteswap_stage(struct Stage *stage);
    void byteswap_motskeleton(struct MotSkeleton *stage);
    void byteswap_nlobj(struct NlObj *obj);
    void byteswap_gma(struct GMA* gma);

#ifdef __cplusplus
}
#endif

#endif
