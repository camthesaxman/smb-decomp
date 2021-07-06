#ifndef _DOLPHIN_GXTEV_H_
#define _DOLPHIN_GXTEV_H_

void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1);
void GXSetNumTevStages(u8 nStages);
void GXSetTevOp(GXTevStageID id, GXTevMode mode);
void GXSetTevOrder(GXTevStageID stage,  GXTexCoordID coord, GXTexMapID map,
    GXChannelID color);

#endif
