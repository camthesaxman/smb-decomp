#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <dolphin/types.h>

#include "src/types.h"
#include "src/mathutil.h"

#define puts(...)

void CARDCancel(){puts("CARDCancel is a stub");}
void CARDCheckAsync(){puts("CARDCheckAsync is a stub");}
void CARDClose(){puts("CARDClose is a stub");}
void CARDCreateAsync(){puts("CARDCreateAsync is a stub");}
void CARDDelete(){puts("CARDDelete is a stub");}
void CARDDeleteAsync(){puts("CARDDeleteAsync is a stub");}
void CARDFastDeleteAsync(){puts("CARDFastDeleteAsync is a stub");}
void CARDFastOpen(){puts("CARDFastOpen is a stub");}
void CARDFreeBlocks(){puts("CARDFreeBlocks is a stub");}
void CARDGetResultCode(){puts("CARDGetResultCode is a stub");}
void CARDGetStatus(){puts("CARDGetStatus is a stub");}
void CARDInit(){puts("CARDInit is a stub");}
void CARDMount(){puts("CARDMount is a stub");}
void CARDMountAsync(){puts("CARDMountAsync is a stub");}
void CARDOpen(){puts("CARDOpen is a stub");}
void CARDProbeEx(){puts("CARDProbeEx is a stub");}
void CARDReadAsync(){puts("CARDReadAsync is a stub");}
void CARDRename(){puts("CARDRename is a stub");}
void CARDRenameAsync(){puts("CARDRenameAsync is a stub");}
void CARDSetStatusAsync(){puts("CARDSetStatusAsync is a stub");}
void CARDUnmount(){puts("CARDUnmount is a stub");}
void CARDWriteAsync(){puts("CARDWriteAsync is a stub");}

void C_VECNormalize(const VecPtr src, VecPtr unit)
{
    f32 mag = (src->x * src->x) + (src->y * src->y) + (src->z * src->z);
    mag = 1.0f / sqrtf(mag);
    unit->x = src->x * mag;
    unit->y = src->y * mag;
    unit->z = src->z * mag;
}

void C_VECCrossProduct(const VecPtr a, const VecPtr b, VecPtr out)
{
    Vec tmp;
    tmp.x = (a->y * b->z) - (a->z * b->y);
    tmp.y = (a->z * b->x) - (a->x * b->z);
    tmp.z = (a->x * b->y) - (a->y * b->x);
    out->x = tmp.x;
    out->y = tmp.y;
    out->z = tmp.z;
}

void C_MTXLookAt(Mtx m, Point3dPtr camPos, VecPtr camUp, Point3dPtr target)
{
    Vec vv0, vv1, vv2;
    vv0.x = camPos->x - target->x;
    vv0.y = camPos->y - target->y;
    vv0.z = camPos->z - target->z;
    C_VECNormalize(&vv0, &vv0);
    C_VECCrossProduct(camUp, &vv0, &vv1);
    C_VECNormalize(&vv1, &vv1);
    C_VECCrossProduct(&vv0, &vv1, &vv2);
    m[0][0] = vv1.x;
    m[0][1] = vv1.y;
    m[0][2] = vv1.z;
    m[0][3] = -(camPos->x * vv1.x + camPos->y * vv1.y + camPos->z * vv1.z);
    m[1][0] = vv2.x;
    m[1][1] = vv2.y;
    m[1][2] = vv2.z;
    m[1][3] = -(camPos->x * vv2.x + camPos->y * vv2.y + camPos->z * vv2.z);
    m[2][0] = vv0.x;
    m[2][1] = vv0.y;
    m[2][2] = vv0.z;
    m[2][3] = -(camPos->x * vv0.x + camPos->y * vv0.y + camPos->z * vv0.z);
}

void C_MTXScale(Mtx m, f32 xS, f32 yS, f32 zS){*(int*)0 = 0;puts("C_MTXScale is a stub");}
void DCFlushRange(){puts("DCFlushRange is a stub");}
void DCInvalidateRange(){puts("DCInvalidateRange is a stub");}
void DCStoreRange(){puts("DCStoreRange is a stub");}
void DVDCancel(){puts("DVDCancel is a stub");}
void DVDReadAbsAsyncForBS(){puts("DVDReadAbsAsyncForBS is a stub");}
void DVDReadDiskID(){puts("DVDReadDiskID is a stub");}
void DVDReset(){puts("DVDReset is a stub");}
void EXIDeselect(){puts("EXIDeselect is a stub");}
void EXIDma(){puts("EXIDma is a stub");}
void EXIImm(){puts("EXIImm is a stub");}
void EXILock(){puts("EXILock is a stub");}
void EXISelect(){puts("EXISelect is a stub");}
void EXISync(){puts("EXISync is a stub");}
void EXIUnlock(){puts("EXIUnlock is a stub");}
//void GXCopyDisp(){puts("GXCopyDisp is a stub");}
//void GXCopyTex(){puts("GXCopyTex is a stub");}
//void GXDrawSphere(){puts("GXDrawSphere is a stub");}
//void GXFlush(){puts("GXFlush is a stub");}
//void GXGetTexObjMipMap(){puts("GXGetTexObjMipMap is a stub");}
//void GXInitTexObjLOD(){puts("GXInitTexObjLOD is a stub");}
//void GXInitTexObjWrapMode(){puts("GXInitTexObjWrapMode is a stub");}
//void GXInvalidateTexAll(){puts("GXInvalidateTexAll is a stub");}
//void GXMpal480IntDf(){puts("GXMpal480IntDf is a stub");}
//void GXPal528IntDf(){puts("GXPal528IntDf is a stub");}
//void GXSetAlphaUpdate(){puts("GXSetAlphaUpdate is a stub");}
//void GXSetColorUpdate(){puts("GXSetColorUpdate is a stub");}
//void GXSetCopyFilter(){puts("GXSetCopyFilter is a stub");}
//void GXSetDispCopyDst(){puts("GXSetDispCopyDst is a stub");}
//void GXSetDispCopyGamma(){puts("GXSetDispCopyGamma is a stub");}
//void GXSetDispCopySrc(){puts("GXSetDispCopySrc is a stub");}
//void GXSetDispCopyYScale(){puts("GXSetDispCopyYScale is a stub");}
//void GXSetDither(){puts("GXSetDither is a stub");}
//void GXSetFog(){puts("GXSetFog is a stub");}
//void GXSetIndTexMtx(){puts("GXSetIndTexMtx is a stub");}
//void GXSetIndTexOrder(){puts("GXSetIndTexOrder is a stub");}
//void GXSetNumIndStages(){puts("GXSetNumIndStages is a stub");}
//void GXSetNumTexGens(){puts("GXSetNumTexGens is a stub");}
//void GXSetPixelFmt(){puts("GXSetPixelFmt is a stub");}
//void GXSetTevDirect(){puts("GXSetTevDirect is a stub");}
//void GXSetTevIndirect(){puts("GXSetTevIndirect is a stub");}
//void GXSetTexCoordGen2(){puts("GXSetTexCoordGen2 is a stub");}
//void GXSetTexCopyDst(){puts("GXSetTexCopyDst is a stub");}
//void GXSetTexCopySrc(){puts("GXSetTexCopySrc is a stub");}
//void GXSetZCompLoc(){puts("GXSetZCompLoc is a stub");}
void LCEnable(){puts("LCEnable is a stub");}
void OSClearContext(){puts("OSClearContext is a stub");}
void OSDisableInterrupts(){puts("OSDisableInterrupts is a stub");}
void OSDumpContext(){puts("OSDumpContext is a stub");}
void OSGetCurrentThread(){puts("OSGetCurrentThread is a stub");}
void OSGetFontEncode(){puts("OSGetFontEncode is a stub");}
void OSGetFontTexture(){puts("OSGetFontTexture is a stub");}
void OSGetFontWidth(){puts("OSGetFontWidth is a stub");}
void OSGetResetButtonState(){puts("OSGetResetButtonState is a stub");}
void OSGetStackPointer(){puts("OSGetStackPointer is a stub");}
void OSInitFont(){puts("OSInitFont is a stub");}
void OSLink(){puts("OSLink is a stub");}
void OSLoadContext(){puts("OSLoadContext is a stub");}
void OSResetSystem(){puts("OSResetSystem is a stub");}
void OSRestoreInterrupts(){puts("OSRestoreInterrupts is a stub");}
void OSResumeThread(){puts("OSResumeThread is a stub");}
void OSSetCurrentContext(){puts("OSSetCurrentContext is a stub");}
void OSSetStringTable(){puts("OSSetStringTable is a stub");}
void OSSuspendThread(){puts("OSSuspendThread is a stub");}
void OSTicksToCalendarTime(){puts("OSTicksToCalendarTime is a stub");}
void OSUnlink(){puts("OSUnlink is a stub");}
void OSWakeupThread(){puts("OSWakeupThread is a stub");}
//void PADRecalibrate(){puts("PADRecalibrate is a stub");}
//void PADReset(){puts("PADReset is a stub");}
//void PADSetAnalogMode(){puts("PADSetAnalogMode is a stub");}
void PERFDumpScreen(){puts("PERFDumpScreen is a stub");}
void PERFEndFrame(){puts("PERFEndFrame is a stub");}
void PERFEventEnd(){puts("PERFEventEnd is a stub");}
void PERFEventStart(){puts("PERFEventStart is a stub");}
void PERFInit(){puts("PERFInit is a stub");}
void PERFPostDraw(){puts("PERFPostDraw is a stub");}
void PERFPreDraw(){puts("PERFPreDraw is a stub");}
void PERFSetDrawBWBarKey(){puts("PERFSetDrawBWBarKey is a stub");}
void PERFSetEvent(){puts("PERFSetEvent is a stub");}
void PERFStartAutoSampling(){puts("PERFStartAutoSampling is a stub");}
void PERFStartFrame(){puts("PERFStartFrame is a stub");}
void PERFStopAutoSampling(){puts("PERFStopAutoSampling is a stub");}
void PPCHalt(){puts("PPCHalt is a stub");}
void PSMTXIdentity(Mtx m){puts("PSMTXIdentity is a stub");}
void SoundChoID(){puts("SoundChoID is a stub");}
void SoundPan(){puts("SoundPan is a stub");}
void SoundPitch(){puts("SoundPitch is a stub");}
void SoundRevID(){puts("SoundRevID is a stub");}
void VIConfigure(){puts("VIConfigure is a stub");}
void VIGetNextField(){puts("VIGetNextField is a stub");}
void VISetBlack(){puts("VISetBlack is a stub");}
void VISetNextFrameBuffer(){puts("VISetNextFrameBuffer is a stub");}
void VIWaitForRetrace(){puts("VIWaitForRetrace is a stub");}
void __CARDFormatRegionAsync(){puts("__CARDFormatRegionAsync is a stub");}
void __GXSetSUTexSize(){puts("__GXSetSUTexSize is a stub");}
void __GXSetVAT(){puts("__GXSetVAT is a stub");}
void __GXSetVCD(){puts("__GXSetVCD is a stub");}
void __GXUpdateBPMask(){puts("__GXUpdateBPMask is a stub");}
void __OSGetDIConfig(){puts("__OSGetDIConfig is a stub");}
void __OSSetInterruptHandler(){puts("__OSSetInterruptHandler is a stub");}
void __OSUnmaskInterrupts(){puts("__OSUnmaskInterrupts is a stub");}
void __cpReg(){puts("__cpReg is a stub");}
void __piReg(){puts("__piReg is a stub");}
void __sync(){puts("__sync is a stub");}
void bg_master_draw(){puts("bg_master_draw is a stub");}
void bg_master_finish(){puts("bg_master_finish is a stub");}
void bg_master_init(){puts("bg_master_init is a stub");}
void bg_master_interact(){puts("bg_master_interact is a stub");}
void bg_master_main(){puts("bg_master_main is a stub");}
void bg_old_bluesky_draw(){puts("bg_old_bluesky_draw is a stub");}
void bg_old_bluesky_finish(){puts("bg_old_bluesky_finish is a stub");}
void bg_old_bluesky_init(){puts("bg_old_bluesky_init is a stub");}
void bg_old_bluesky_interact(){puts("bg_old_bluesky_interact is a stub");}
void bg_old_bluesky_main(){puts("bg_old_bluesky_main is a stub");}
void bg_old_extramaster_draw(){puts("bg_old_extramaster_draw is a stub");}
void bg_old_extramaster_finish(){puts("bg_old_extramaster_finish is a stub");}
void bg_old_extramaster_init(){puts("bg_old_extramaster_init is a stub");}
void bg_old_extramaster_interact(){puts("bg_old_extramaster_interact is a stub");}
void bg_old_extramaster_main(){puts("bg_old_extramaster_main is a stub");}
void bg_old_ice_draw(){puts("bg_old_ice_draw is a stub");}
void bg_old_ice_finish(){puts("bg_old_ice_finish is a stub");}
void bg_old_ice_init(){puts("bg_old_ice_init is a stub");}
void bg_old_ice_interact(){puts("bg_old_ice_interact is a stub");}
void bg_old_ice_main(){puts("bg_old_ice_main is a stub");}
void bg_old_water_draw(){puts("bg_old_water_draw is a stub");}
void bg_old_water_finish(){puts("bg_old_water_finish is a stub");}
void bg_old_water_init(){puts("bg_old_water_init is a stub");}
void bg_old_water_interact(){puts("bg_old_water_interact is a stub");}
void bg_old_water_main(){puts("bg_old_water_main is a stub");}
void bg_pilot_draw(){puts("bg_pilot_draw is a stub");}
void bg_pilot_finish(){puts("bg_pilot_finish is a stub");}
void bg_pilot_init(){puts("bg_pilot_init is a stub");}
void bg_pilot_interact(){puts("bg_pilot_interact is a stub");}
void bg_pilot_main(){puts("bg_pilot_main is a stub");}
void credits_finish(){puts("credits_finish is a stub");}
void credits_init(){puts("credits_init is a stub");}
void credits_main(){puts("credits_main is a stub");}
u32 dipSwitches;
void effect_draw(){puts("effect_draw is a stub");}
void ev_effect_dest(){puts("ev_effect_dest is a stub");}
void ev_effect_init(){puts("ev_effect_init is a stub");}
void ev_effect_main(){puts("ev_effect_main is a stub");}
void ev_minimap_dest(){puts("ev_minimap_dest is a stub");}
void ev_minimap_init(){puts("ev_minimap_init is a stub");}
void ev_minimap_main(){puts("ev_minimap_main is a stub");}
void ev_name_entry_dest(){puts("ev_name_entry_dest is a stub");}
void ev_name_entry_init(){puts("ev_name_entry_init is a stub");}
void ev_name_entry_main(){puts("ev_name_entry_main is a stub");}
void ev_sound_dest(){puts("ev_sound_dest is a stub");}
void ev_sound_init(){puts("ev_sound_init is a stub");}
void ev_sound_main(){puts("ev_sound_main is a stub");}
void ev_vibration_dest(){puts("ev_vibration_dest is a stub");}
void ev_vibration_init(){puts("ev_vibration_init is a stub");}
void ev_vibration_main(){puts("ev_vibration_main is a stub");}
void func_80029788(){puts("func_80029788 is a stub");}
void func_8002B5C8(){puts("func_8002B5C8 is a stub");}
void func_8002B610(){puts("func_8002B610 is a stub");}
void func_8002BFCC(){puts("func_8002BFCC is a stub");}
void func_8002CA5C(){puts("func_8002CA5C is a stub");}
void func_8002DB10(){puts("func_8002DB10 is a stub");}
void func_8002DB24(){puts("func_8002DB24 is a stub");}
void func_8002DB38(){puts("func_8002DB38 is a stub");}
void func_8002DBC4(){puts("func_8002DBC4 is a stub");}
void func_8002F0E4(){puts("func_8002F0E4 is a stub");}
void func_8002FCC0(){puts("func_8002FCC0 is a stub");}
void func_8002FD68(){puts("func_8002FD68 is a stub");}
void func_8002FFEC(){puts("func_8002FFEC is a stub");}
void func_8003026C(){puts("func_8003026C is a stub");}
void func_80030A50(){puts("func_80030A50 is a stub");}
void func_800487B4(){puts("func_800487B4 is a stub");}
void func_800489F8(){puts("func_800489F8 is a stub");}
void func_8004C668(){puts("func_8004C668 is a stub");}
void func_8004C69C(){puts("func_8004C69C is a stub");}
void func_8004C6DC(){puts("func_8004C6DC is a stub");}
void func_8004CFF0(){puts("func_8004CFF0 is a stub");}
void func_8005AD80(){puts("func_8005AD80 is a stub");}
void func_8005AE1C(){puts("func_8005AE1C is a stub");}
void func_80081F30(){puts("func_80081F30 is a stub");}
void func_80082024(){puts("func_80082024 is a stub");}
void func_800846B0(){puts("func_800846B0 is a stub");}
void func_80084794(){puts("func_80084794 is a stub");}
void func_800924CC(){puts("func_800924CC is a stub");}
void func_80092D34(){puts("func_80092D34 is a stub");}
void func_80092F90(){puts("func_80092F90 is a stub");}
void func_80093B84(){puts("func_80093B84 is a stub");}
void func_80093E28(){puts("func_80093E28 is a stub");}
void func_80094028(){puts("func_80094028 is a stub");}
void func_800940B8(){puts("func_800940B8 is a stub");}
void func_800940E0(){puts("func_800940E0 is a stub");}
void func_800946BC(){puts("func_800946BC is a stub");}
void func_800946DC(){puts("func_800946DC is a stub");}
void func_80094748(){puts("func_80094748 is a stub");}
void func_80094750(){puts("func_80094750 is a stub");}
void func_800947B0(){puts("func_800947B0 is a stub");}
void func_800947F8(){puts("func_800947F8 is a stub");}
void func_80094840(){puts("func_80094840 is a stub");}
void func_80094870(){puts("func_80094870 is a stub");}
void func_800948D0(){puts("func_800948D0 is a stub");}
void func_800948F4(){puts("func_800948F4 is a stub");}
void func_80094914(){puts("func_80094914 is a stub");}
void func_8009492C(){puts("func_8009492C is a stub");}
void func_80094A34(){puts("func_80094A34 is a stub");}
void func_8009BEF8(){puts("func_8009BEF8 is a stub");}
int func_8009D5D8(){puts("func_8009D5D8 is a stub");return 0;}
void func_8009D7CC(){puts("func_8009D7CC is a stub");}
void func_8009D7E8(){puts("func_8009D7E8 is a stub");}
void func_8009D7FC(){puts("func_8009D7FC is a stub");}
void func_8009D98C(){puts("func_8009D98C is a stub");}
void func_8009DB6C(){puts("func_8009DB6C is a stub");}
void func_800AD180(){puts("func_800AD180 is a stub");}
void func_800AD38C(){puts("func_800AD38C is a stub");}
void func_800AE408(){puts("func_800AE408 is a stub");}
void func_800AEAD0(){puts("func_800AEAD0 is a stub");}
void func_800AEC74(){puts("func_800AEC74 is a stub");}
void func_800AECCC(){puts("func_800AECCC is a stub");}
void func_800AEDDC(){puts("func_800AEDDC is a stub");}
void func_800AEDE0(){puts("func_800AEDE0 is a stub");}
void func_800AF164(){puts("func_800AF164 is a stub");}
void func_800AFC1C(){puts("func_800AFC1C is a stub");}
void func_800AFC4C(){puts("func_800AFC4C is a stub");}
void func_800B60F4(){puts("func_800B60F4 is a stub");}
void func_800B6224(){puts("func_800B6224 is a stub");}
void func_800B622C(){puts("func_800B622C is a stub");}
void func_800B6234(){puts("func_800B6234 is a stub");}
void func_800B62FC(){puts("func_800B62FC is a stub");}
void func_800B6430(){puts("func_800B6430 is a stub");}
void func_800B64B0(){puts("func_800B64B0 is a stub");}
u32 gamePauseStatus;
void gx(){puts("gx is a stub");}
void *gxCache;
void lbl_801147D8(){puts("lbl_801147D8 is a stub");}
void lbl_801147F4(){puts("lbl_801147F4 is a stub");}
u32 lbl_80118AC8[] = {0x45, 0x46, 0x47, 0x48};  // ...
void lbl_80118D0C(){puts("lbl_80118D0C is a stub");}
void lbl_8012346C(){puts("lbl_8012346C is a stub");}
void lbl_8012C234(){puts("lbl_8012C234 is a stub");}
void lbl_80130AEC(){puts("lbl_80130AEC is a stub");}
void lbl_80137A3C(){puts("lbl_80137A3C is a stub");}
void lbl_8013B65C(){puts("lbl_8013B65C is a stub");}
void lbl_8013EB94(){puts("lbl_8013EB94 is a stub");}
void lbl_8013FBD4(){puts("lbl_8013FBD4 is a stub");}
void lbl_80142D64(){puts("lbl_80142D64 is a stub");}
void lbl_80146F9C(){puts("lbl_80146F9C is a stub");}
void lbl_8014D184(){puts("lbl_8014D184 is a stub");}
void lbl_80153A54(){puts("lbl_80153A54 is a stub");}
void lbl_80157BBC(){puts("lbl_80157BBC is a stub");}
void lbl_8015A11C(){puts("lbl_8015A11C is a stub");}
void lbl_8015D1DC(){puts("lbl_8015D1DC is a stub");}
void lbl_8015F80C(){puts("lbl_8015F80C is a stub");}
void lbl_80161684(){puts("lbl_80161684 is a stub");}
void lbl_80162D44(){puts("lbl_80162D44 is a stub");}
void lbl_801649B4(){puts("lbl_801649B4 is a stub");}
void lbl_8016682C(){puts("lbl_8016682C is a stub");}
void lbl_801683CC(){puts("lbl_801683CC is a stub");}
void lbl_80168C54(){puts("lbl_80168C54 is a stub");}
void lbl_80169884(){puts("lbl_80169884 is a stub");}
void lbl_8016AEDC(){puts("lbl_8016AEDC is a stub");}
void lbl_8016BF84(){puts("lbl_8016BF84 is a stub");}
void lbl_8016CEF4(){puts("lbl_8016CEF4 is a stub");}
void lbl_8016DD94(){puts("lbl_8016DD94 is a stub");}
void lbl_8016EBCC(){puts("lbl_8016EBCC is a stub");}
void lbl_8016F454(){puts("lbl_8016F454 is a stub");}
void lbl_8016FCDC(){puts("lbl_8016FCDC is a stub");}
void lbl_801D5A20(){puts("lbl_801D5A20 is a stub");}
struct
{
    s32 unk0;
    u32 unk4;
    u8 filler8[1];
} lbl_802014E0;
struct
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u8 fillerC[0x14-0xC];
    u32 unk14;
} lbl_80292D18;
struct Struct802C67D4 lbl_802C67D4[4];
float lbl_802F16B8;
u32 lbl_802F1DF8;
s32 lbl_802F1DFC;
s32 lbl_802F1EA8;
s32 lbl_802F1EB0;
s32 lbl_802F1EB4;
float lbl_802F1EC4;
float lbl_802F1EC8;
float lbl_802F1ECC;
u16 lbl_802F1ED0;
u16 lbl_802F1ED2;
u32 lbl_802F1ED8;
void lbl_802F2060(){puts("lbl_802F2060 is a stub");}
u32 lbl_802F2150;
void *lbl_802F2154;
void lbl_802F21E8(){puts("lbl_802F21E8 is a stub");}
void lbl_802F21EC(){puts("lbl_802F21EC is a stub");}
void lbl_802F21F0(){puts("lbl_802F21F0 is a stub");}
void lbl_802F22C8(){puts("lbl_802F22C8 is a stub");}
s16 mathutil_atan(float angle)
{
    return atanf(angle) * 65536.0f / (2.0f * M_PI);
}
s16 mathutil_atan2(double a, float b)
{
    return atan2f(a, b) * 65536.0f / (2.0f * M_PI);
}
void mathutil_init(){puts("mathutil_init is a stub");}
void mathutil_mtxA_invert(){puts("mathutil_mtxA_invert is a stub");}
void mathutil_mtxA_rigid_invert(){puts("mathutil_mtxA_rigid_invert is a stub");}
void mathutil_sin_cos_v(int a, float b[2])
{
    b[0] = mathutil_sin(a);
    b[1] = mathutil_cos(a);
}
void minimap_change_size(){puts("minimap_change_size is a stub");}
void minimap_draw(){puts("minimap_draw is a stub");}
void mode_mini_func(){puts("mode_mini_func is a stub");}
void monkey_sprite_draw(){puts("monkey_sprite_draw is a stub");}
void shadowerase_main(){puts("shadowerase_main is a stub");}
void sound_init(){puts("sound_init is a stub");}
void sound_main(){puts("sound_main is a stub");}
void spawn_effect(){puts("spawn_effect is a stub");}
void stobj_nameent_btn_coli(){puts("stobj_nameent_btn_coli is a stub");}
void stobj_nameent_btn_debug(){puts("stobj_nameent_btn_debug is a stub");}
void stobj_nameent_btn_destroy(){puts("stobj_nameent_btn_destroy is a stub");}
void stobj_nameent_btn_draw(){puts("stobj_nameent_btn_draw is a stub");}
void stobj_nameent_btn_init(){puts("stobj_nameent_btn_init is a stub");}
void stobj_nameent_btn_main(){puts("stobj_nameent_btn_main is a stub");}
void submode_mini_commend_init_func(){puts("submode_mini_commend_init_func is a stub");}
void submode_mini_commend_main_func(){puts("submode_mini_commend_main_func is a stub");}
void submode_mini_ending_init_func(){puts("submode_mini_ending_init_func is a stub");}
void submode_mini_ending_main_func(){puts("submode_mini_ending_main_func is a stub");}
void submode_mini_game_init_func(){puts("submode_mini_game_init_func is a stub");}
void submode_mini_game_main_func(){puts("submode_mini_game_main_func is a stub");}
void submode_mini_ranking_init_func(){puts("submode_mini_ranking_init_func is a stub");}
void submode_mini_ranking_main_func(){puts("submode_mini_ranking_main_func is a stub");}
void submode_mini_select_init_func(){puts("submode_mini_select_init_func is a stub");}
void submode_mini_select_main_func(){puts("submode_mini_select_main_func is a stub");}
void submode_mini_test0_init_func(){puts("submode_mini_test0_init_func is a stub");}
void submode_mini_test0_main_func(){puts("submode_mini_test0_main_func is a stub");}
void u_debug_print(){puts("u_debug_print is a stub");}
void u_debug_printf(){puts("u_debug_printf is a stub");}
void u_debug_set_cursor_pos(){puts("u_debug_set_cursor_pos is a stub");}
void u_debug_set_text_color(){puts("u_debug_set_text_color is a stub");}
void u_draw_ball_shadow(){puts("u_draw_ball_shadow is a stub");}
void u_get_monkey_bitmap_id(){puts("u_get_monkey_bitmap_id is a stub");}
void u_get_replay_info(){puts("u_get_replay_info is a stub");}
void u_give_points(){puts("u_give_points is a stub");}
void u_init_shadow_stuff_probably(){puts("u_init_shadow_stuff_probably is a stub");}
void u_is_name_entry_finished(){puts("u_is_name_entry_finished is a stub");}
void u_minigame_draw(){puts("u_minigame_draw is a stub");}
void u_play_music(){puts("u_play_music is a stub");}
void u_play_sound(){puts("u_play_sound is a stub");}
void u_something_with_lens_flare_1(){puts("u_something_with_lens_flare_1 is a stub");}
void u_something_with_lens_flare_2(){puts("u_something_with_lens_flare_2 is a stub");}
void window_init(){puts("window_init is a stub");}
void window_main(){puts("window_main is a stub");}
