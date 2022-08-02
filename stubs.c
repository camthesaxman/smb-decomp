#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <dolphin.h>

#include "src/types.h"
#include "src/mathutil.h"
#include "src/global.h"

#define puts(...)

s32 CARDCancel(CARDFileInfo *fileInfo){puts("CARDCancel is a stub");return 0;}
s32 CARDCheckAsync(s32 chan, CARDCallback callback){puts("CARDCheckAsync is a stub");return 0;}
s32 CARDClose(CARDFileInfo *fileInfo){puts("CARDClose is a stub");return 0;}
s32 CARDCreateAsync(s32 chan, char *fileName, u32 size, CARDFileInfo *fileInfo, CARDCallback callback){puts("CARDCreateAsync is a stub");return 0;}
s32 CARDDelete(s32 chan, char *fileName){puts("CARDDelete is a stub");return 0;}
s32 CARDDeleteAsync(s32 chan, char *fileName, CARDCallback callback){puts("CARDDeleteAsync is a stub");return 0;}
s32 CARDFastDeleteAsync(s32 chan, s32 fileNo, CARDCallback callback){puts("CARDFastDeleteAsync is a stub");return 0;}
s32 CARDFastOpen(s32 chan, s32 fileNo, CARDFileInfo *fileInfo){puts("CARDFastOpen is a stub");return 0;}
s32 CARDFreeBlocks(s32 chan, s32 *byteNotUsed, s32 *filesNotUsed){puts("CARDFreeBlocks is a stub");return 0;}
s32 CARDGetResultCode(s32 chan){puts("CARDGetResultCode is a stub");return 0;}
s32 CARDGetStatus(s32 chan, s32 fileNo, CARDStat *stat){puts("CARDGetStatus is a stub");return 0;}
void CARDInit(){puts("CARDInit is a stub");}
s32 CARDMount(s32 chan, void *workArea, CARDCallback detachCallback){puts("CARDMount is a stub");return 0;}
s32 CARDMountAsync(s32 chan, void *workArea, CARDCallback detachCallback,
                   CARDCallback attachCallback){puts("CARDMountAsync is a stub");return 0;}
s32 CARDOpen(s32 chan, char *fileName, CARDFileInfo *fileInfo){puts("CARDOpen is a stub");return 0;}
s32 CARDProbeEx(s32 chan, s32 *memSize, s32 *sectorSize){puts("CARDProbeEx is a stub");return 0;}
s32 CARDReadAsync(CARDFileInfo* fileInfo, void *addr, s32 length, s32 offset, CARDCallback callback){puts("CARDReadAsync is a stub");return 0;}
s32 CARDRename(s32 chan, char *oldName, char *newName){puts("CARDRename is a stub");return 0;}
s32 CARDRenameAsync(s32 chan, char *oldName, char *newName, CARDCallback callback){puts("CARDRenameAsync is a stub");return 0;}
s32 CARDSetStatusAsync(s32 chan, s32 fileNo, CARDStat *stat, CARDCallback callback){puts("CARDSetStatusAsync is a stub");return 0;}
s32 CARDUnmount(s32 chan){puts("CARDUnmount is a stub");return 0;}
s32 CARDWriteAsync(CARDFileInfo* fileInfo, void *addr, s32 length, s32 offset, CARDCallback callback){puts("CARDWriteAsync is a stub");return 0;}

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

void C_MTXScale(Mtx m, f32 xS, f32 yS, f32 zS){*(volatile int*)0 = 0;puts("C_MTXScale is a stub");}
void DCFlushRange(void *addr, u32 nBytes){puts("DCFlushRange is a stub");}
void DCInvalidateRange(void *addr, u32 nBytes){puts("DCInvalidateRange is a stub");}
void DCStoreRange(void *addr, u32 nBytes){puts("DCStoreRange is a stub");}
s32 DVDCancel(DVDCommandBlock *block){puts("DVDCancel is a stub");return 0;}
void DVDReadAbsAsyncForBS(void *a, struct bb2struct *b, int c, int d, void (*e)()){puts("DVDReadAbsAsyncForBS is a stub");}
void DVDReadDiskID(void *a, DVDDiskID *b, void (*c)()){puts("DVDReadDiskID is a stub");}
void DVDReset(){puts("DVDReset is a stub");}
BOOL EXIDeselect(int chan){puts("EXIDeselect is a stub");return FALSE;}
BOOL EXIDma(int chan, void *buffer, s32 size, int d, int e){puts("EXIDma is a stub");return FALSE;}
BOOL EXIImm(int chan, u32 *b, int c, int d, int e){puts("EXIImm is a stub");return FALSE;}
BOOL EXILock(int chan, int b, int c){puts("EXILock is a stub");return FALSE;}
BOOL EXISelect(int chan, int b, int c){puts("EXISelect is a stub");return FALSE;}
BOOL EXISync(int chan){puts("EXISync is a stub");return FALSE;}
BOOL EXIUnlock(int chan){puts("EXIUnlock is a stub");return FALSE;}
void LCEnable(){puts("LCEnable is a stub");}
void OSClearContext(OSContext *context){puts("OSClearContext is a stub");}
BOOL OSDisableInterrupts(){puts("OSDisableInterrupts is a stub");return FALSE;}
void OSDumpContext(OSContext *context){puts("OSDumpContext is a stub");}
OSThread* OSGetCurrentThread(){puts("OSGetCurrentThread is a stub");return 0;}
u16 OSGetFontEncode(){puts("OSGetFontEncode is a stub");return 0;}
char * OSGetFontTexture(char *string, void **image, s32 *x, s32 *y, s32 *width){puts("OSGetFontTexture is a stub");return 0;}
char * OSGetFontWidth(char *string, s32 *width){puts("OSGetFontWidth is a stub");return 0;}
BOOL OSGetResetButtonState(){puts("OSGetResetButtonState is a stub");return FALSE;}
u32 OSGetStackPointer(){puts("OSGetStackPointer is a stub");return 0;}
BOOL OSInitFont(OSFontHeader *fontData){puts("OSInitFont is a stub");return FALSE;}
BOOL OSLink(OSModuleInfo *newModule, void *bss){puts("OSLink is a stub");return FALSE;}
void OSLoadContext(OSContext *context){puts("OSLoadContext is a stub");}
void OSResetSystem(int reset, u32 resetCode, BOOL forceMenu){puts("OSResetSystem is a stub");}
BOOL OSRestoreInterrupts(BOOL level){puts("OSRestoreInterrupts is a stub");return FALSE;}
s32 OSResumeThread(OSThread* thread){puts("OSResumeThread is a stub");return 0;}
void OSSetCurrentContext(OSContext *context){puts("OSSetCurrentContext is a stub");}
void OSSetStringTable(void *a){puts("OSSetStringTable is a stub");}
s32 OSSuspendThread(OSThread* thread){puts("OSSuspendThread is a stub");return 0;}
void OSTicksToCalendarTime(OSTime ticks, OSCalendarTime *td){puts("OSTicksToCalendarTime is a stub");}
BOOL OSUnlink(OSModuleInfo *oldModule){puts("OSUnlink is a stub");return FALSE;}
void OSWakeupThread(OSThreadQueue *queue){puts("OSWakeupThread is a stub");}
void PERFDumpScreen(){puts("PERFDumpScreen is a stub");}
void PERFEndFrame(){puts("PERFEndFrame is a stub");}
void PERFEventEnd(PERFId id){puts("PERFEventEnd is a stub");}
void PERFEventStart(PERFId id){puts("PERFEventStart is a stub");}
u32 PERFInit(u32 numSamples, u32 numFramesHistory, u32 numTypes,
              PERFAllocator allocator, PERFDeallocator deallocator, PERFDrawCallback initDraw){puts("PERFInit is a stub");return 0;}
void PERFPostDraw(){puts("PERFPostDraw is a stub");}
void PERFPreDraw(){puts("PERFPreDraw is a stub");}
void PERFSetDrawBWBarKey(BOOL tf){puts("PERFSetDrawBWBarKey is a stub");}
void PERFSetEvent(PERFId id, char *name, PerfType type){puts("PERFSetEvent is a stub");}
void PERFStartAutoSampling(f32 msInterval){puts("PERFStartAutoSampling is a stub");}
void PERFStartFrame(){puts("PERFStartFrame is a stub");}
void PERFStopAutoSampling(){puts("PERFStopAutoSampling is a stub");}
void PPCHalt(){puts("PPCHalt is a stub");}
void PSMTXIdentity(Mtx m){puts("PSMTXIdentity is a stub");}
void SoundChoID(int a, int b){puts("SoundChoID is a stub");}
void SoundPan(int a, int b, int c){puts("SoundPan is a stub");}
void SoundPitch(u16 a, int b){puts("SoundPitch is a stub");}
void SoundRevID(int a, int b){puts("SoundRevID is a stub");}
void VIConfigure(GXRenderModeObj *rm){puts("VIConfigure is a stub");}
u32 VIGetNextField(){puts("VIGetNextField is a stub");return 0;}
void VISetBlack(BOOL black){puts("VISetBlack is a stub");}
void VISetNextFrameBuffer(void *fb){puts("VISetNextFrameBuffer is a stub");}
void VIWaitForRetrace(){puts("VIWaitForRetrace is a stub");}
s32 __CARDFormatRegionAsync(int a, int b){puts("__CARDFormatRegionAsync is a stub");return 0;}
void __GXSetSUTexSize(){puts("__GXSetSUTexSize is a stub");}
void __GXSetVAT(){puts("__GXSetVAT is a stub");}
void __GXSetVCD(){puts("__GXSetVCD is a stub");}
void __GXUpdateBPMask(){puts("__GXUpdateBPMask is a stub");}
u32 __OSGetDIConfig(){puts("__OSGetDIConfig is a stub");return 0;}
__OSInterruptHandler __OSSetInterruptHandler(__OSInterrupt interrupt, __OSInterruptHandler handler){puts("__OSSetInterruptHandler is a stub");return 0;}
OSInterruptMask __OSUnmaskInterrupts(OSInterruptMask mask){puts("__OSUnmaskInterrupts is a stub");return 0;}
volatile u16 *__cpReg;
volatile u32 *__piReg;
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
void func_80029788(void){puts("func_80029788 is a stub");}
void func_8002B5C8(int a){puts("func_8002B5C8 is a stub");}
int func_8002B610(int a){puts("func_8002B610 is a stub");return 0;}
void func_8002BFCC(int a, int b){puts("func_8002BFCC is a stub");}
void func_8002CA5C(int a, s8 b, s8 c){puts("func_8002CA5C is a stub");}
void func_8002DB10(struct MemcardGameData *a){puts("func_8002DB10 is a stub");}
void func_8002DB24(struct MemcardGameData *a){puts("func_8002DB24 is a stub");}
void func_8002DB38(void){puts("func_8002DB38 is a stub");}
void func_8002DBC4(void){puts("func_8002DBC4 is a stub");}
void func_8002F0E4(void){puts("func_8002F0E4 is a stub");}
void func_8002FCC0(int a, char *b, ...){puts("func_8002FCC0 is a stub");}
void func_8002FD68(int a, const char *b){puts("func_8002FD68 is a stub");}
void func_8002FFEC(void){puts("func_8002FFEC is a stub");}
void func_8003026C(int a, char *b, ...){puts("func_8003026C is a stub");}
void func_8004CFF0(int a){puts("func_8004CFF0 is a stub");}
int func_8005AD80(){puts("func_8005AD80 is a stub");return 0;}
int func_8005AE1C(struct NlModel *a, struct NlModel *b){puts("func_8005AE1C is a stub");}
void func_80081F30(void){puts("func_80081F30 is a stub");}
void func_80082024(int a, struct Sprite *b){puts("func_80082024 is a stub");}
void func_800846B0(int a){puts("func_800846B0 is a stub");}
void func_80084794(void *a){puts("func_80084794 is a stub");}
void func_800924CC(void){puts("func_800924CC is a stub");}
int  func_80092D34(void){puts("func_80092D34 is a stub");return 0;}
void func_80092F90(void *a){puts("func_80092F90 is a stub");}
void func_80093B84(void){puts("func_80093B84 is a stub");}
void func_80093E28(void){puts("func_80093E28 is a stub");}
void func_80094028(void){puts("func_80094028 is a stub");}
void func_800940B8(void){puts("func_800940B8 is a stub");}
void func_800940E0(void){puts("func_800940E0 is a stub");}
void func_800946BC(Vec *a){puts("func_800946BC is a stub");}
void func_800946DC(int a, int b){puts("func_800946DC is a stub");}
void func_80094748(float a){puts("func_80094748 is a stub");}
void func_80094750(int a){puts("func_80094750 is a stub");}
void func_800947B0(void){puts("func_800947B0 is a stub");}
int func_800947F8(void){puts("func_800947F8 is a stub");return 0;}
void func_80094840(void){puts("func_80094840 is a stub");}
void *func_80094870(){puts("func_80094870 is a stub");return 0;}
void func_800948D0(void *a){puts("func_800948D0 is a stub");}
void func_800948F4(void){puts("func_800948F4 is a stub");}
void func_80094914(void){puts("func_80094914 is a stub");}
void func_8009492C(struct Struct8009492C *a){puts("func_8009492C is a stub");}
void func_80094A34(void){puts("func_80094A34 is a stub");}
void func_8009BEF8(void){puts("func_8009BEF8 is a stub");}
int func_8009D5D8(void){puts("func_8009D5D8 is a stub");return 0;}
int func_8009D7CC(void){puts("func_8009D7CC is a stub");return 0;}
int func_8009D7E8(void){puts("func_8009D7E8 is a stub");return 0;}
void func_8009D7FC(int a, Vec *b){puts("func_8009D7FC is a stub");}
void func_8009D98C(Vec *a){puts("func_8009D98C is a stub");}
void func_8009DB6C(Mtx m){puts("func_8009DB6C is a stub");}
void func_800AD180(){puts("func_800AD180 is a stub");}
void func_800AD38C(){puts("func_800AD38C is a stub");}
void func_800AE408(){puts("func_800AE408 is a stub");}
void func_800AEAD0(){puts("func_800AEAD0 is a stub");}
void *func_800AEC74(int a, int b){puts("func_800AEC74 is a stub");return 0;}
int func_800AECCC(int a, void *b){puts("func_800AECCC is a stub");return 0;}
void func_800AEDDC(){puts("func_800AEDDC is a stub");}
void func_800AEDE0(){puts("func_800AEDE0 is a stub");}
void func_800AF164(){puts("func_800AF164 is a stub");}
void func_800AFC1C(struct MemcardGameData *a){puts("func_800AFC1C is a stub");}
void func_800AFC4C(struct MemcardGameData *a){puts("func_800AFC4C is a stub");}
void func_800B60F4(int a, int b, int c){puts("func_800B60F4 is a stub");}
void func_800B6224(u8 a){puts("func_800B6224 is a stub");}
u8 func_800B622C(){puts("func_800B622C is a stub");return 0;}
void func_800B6234(){puts("func_800B6234 is a stub");}
int func_800B62FC(){puts("func_800B62FC is a stub");return 0;}
void func_800B6430(){puts("func_800B6430 is a stub");}
void func_800B64B0(){puts("func_800B64B0 is a stub");}
u32 gamePauseStatus;
struct GX *gx;
struct GXCache *gxCache;
u8 lbl_801147D8[] = {
    0x00, 0x01, 0x02, 0x03,
    0x04, 0x05, 0x0B, 0x0C,
    0x0D, 0x0E, 0x0F, 0x06,
    0x07, 0x08, 0x09, 0x0A,
    0x10, 0x11, 0x17, 0x18,
    0x19, 0x1A, 0x1B, 0x12,
    0x13, 0x14, 0x15, 0x16,
};
u8 lbl_801147F4[] = {
     0x00, 0x01, 0x02, 0x03,
     0x04, 0x05, 0x06, 0x07,
     0x08, 0x09, 0x0A, 0x0B,
     0x0C, 0x0D, 0x0E, 0x0F,
     0x10, 0x00, 0x00, 0x00,
};
u32 lbl_80118AC8[] = {0x45, 0x46, 0x47, 0x48};  // ...
u8 lbl_80118D0C[] = {0}; // TODO
u8 lbl_8012346C[] = {0}; // TODO
u8 lbl_8012C234[] = {0}; // TODO
u8 lbl_80130AEC[] = {0}; // TODO
u8 lbl_80137A3C[] = {0}; // TODO
u8 lbl_8013B65C[] = {0}; // TODO
u8 lbl_8013EB94[] = {0}; // TODO
u8 lbl_8013FBD4[] = {0}; // TODO
u8 lbl_80142D64[] = {0}; // TODO
u8 lbl_80146F9C[] = {0}; // TODO
u8 lbl_8014D184[] = {0}; // TODO
u8 lbl_80153A54[] = {0}; // TODO
u8 lbl_80157BBC[] = {0}; // TODO
u8 lbl_8015A11C[] = {0}; // TODO
u8 lbl_8015D1DC[] = {0}; // TODO
u8 lbl_8015F80C[] = {0}; // TODO
u8 lbl_80161684[] = {0}; // TODO
u8 lbl_80162D44[] = {0}; // TODO
u8 lbl_801649B4[] = {0}; // TODO
u8 lbl_8016682C[] = {0}; // TODO
u8 lbl_801683CC[] = {0}; // TODO
u8 lbl_80168C54[] = {0}; // TODO
u8 lbl_80169884[] = {0}; // TODO
u8 lbl_8016AEDC[] = {0}; // TODO
u8 lbl_8016BF84[] = {0}; // TODO
u8 lbl_8016CEF4[] = {0}; // TODO
u8 lbl_8016DD94[] = {0}; // TODO
u8 lbl_8016EBCC[] = {0}; // TODO
u8 lbl_8016F454[] = {0}; // TODO
u8 lbl_8016FCDC[] = {0}; // TODO
u8 lbl_801D5A20[0x1FC] = {0}; // TODO
struct lbl_802014E0_Struct lbl_802014E0;
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
s8 lbl_802F2060;
u32 lbl_802F2150;
void *lbl_802F2154;
s32 lbl_802F21E8;
float lbl_802F21EC;
float lbl_802F21F0 = 0;
u32 lbl_802F22C8 = 0;
s16 mathutil_atan(float angle)
{
    return atanf(angle) * 65536.0f / (2.0f * PI);
}
s16 mathutil_atan2(double a, float b)
{
    return atan2f(a, b) * 65536.0f / (2.0f * PI);
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
void monkey_sprite_draw(struct Sprite *a){puts("monkey_sprite_draw is a stub");}
void shadowerase_main(){puts("shadowerase_main is a stub");}
void sound_init(){puts("sound_init is a stub");}
void sound_main(){puts("sound_main is a stub");}
void spawn_effect(struct Effect *a){puts("spawn_effect is a stub");}
void stobj_nameent_btn_coli(struct Stobj *a, struct PhysicsBall *b){puts("stobj_nameent_btn_coli is a stub");}
void stobj_nameent_btn_debug(struct Stobj *a){puts("stobj_nameent_btn_debug is a stub");}
void stobj_nameent_btn_destroy(struct Stobj *a){puts("stobj_nameent_btn_destroy is a stub");}
void stobj_nameent_btn_draw(struct Stobj *a){puts("stobj_nameent_btn_draw is a stub");}
void stobj_nameent_btn_init(struct Stobj *a){puts("stobj_nameent_btn_init is a stub");}
void stobj_nameent_btn_main(struct Stobj *a){puts("stobj_nameent_btn_main is a stub");}
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
void u_debug_print(const char *a){puts("u_debug_print is a stub");}
void u_debug_printf(const char *a, ...){puts("u_debug_printf is a stub");}
void u_debug_set_cursor_pos(int a, int b){puts("u_debug_set_cursor_pos is a stub");}
void u_debug_set_text_color(int a){puts("u_debug_set_text_color is a stub");}
void u_draw_ball_shadow(){puts("u_draw_ball_shadow is a stub");}
int u_get_monkey_bitmap_id(int a, int b, int c){puts("u_get_monkey_bitmap_id is a stub");return 0xF;}
void u_get_replay_info(){puts("u_get_replay_info is a stub");}
void u_give_points(int a, int b){puts("u_give_points is a stub");}
void u_init_shadow_stuff_probably(struct Struct80092B98 *a){puts("u_init_shadow_stuff_probably is a stub");}
int u_is_name_entry_finished(){puts("u_is_name_entry_finished is a stub");return 0;}
void u_minigame_draw(){puts("u_minigame_draw is a stub");}
void u_play_music(int a, int b){puts("u_play_music is a stub");}
void u_play_sound(int a){puts("u_play_sound is a stub");}
void u_something_with_lens_flare_1(int a){puts("u_something_with_lens_flare_1 is a stub");}
void u_something_with_lens_flare_2(int a){puts("u_something_with_lens_flare_2 is a stub");}
void window_init(){puts("window_init is a stub");}
void window_main(){puts("window_main is a stub");}
