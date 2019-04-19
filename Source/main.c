#include "main.h"

//Main function
int main(int argc, char ** argv) {
	Initialize();
	GameMode_Init();
	//TODO: FINISH
}

//Other functions (for initialization)
void Initialize() {
	OSInit();
	EnableCache();
	DVDInit();
	VIInit();
	CARDInit();
	InitPad();
	ExtMath_Init();
	InitDVDDir();
	InitTV();
	InitHeap();
	InitVI();
	InitGX();
	InitGXPart2();
	InitResetSomeFlag();
	InitWaitVBlank();
	InitLoadingGCT();
	InitREL();
}

void InitGX() {
	gxInfo.gxFifoBase = GXInit(OSAlloc(16),16);
	gxInfo.unk5 = 0x801EEBA0;
	void * fifoBase = OSAlloc(16);
	GXInitFifoBase(gxInfo.unk5,fifoBase,16);
	GXInitFifoPtrs(gxInfo.unk5,fifoBase,fifoBase);
	GXSetViewport(0f,0f,(float)rmode->fbWidth,(float)rmode->xfbHeight,0f,1f);
	GXSetScissor(0,0,rmode->fbWidth,rmode->efbHeight);
	GXSetDispCopySrc(0,0,rmode->fbWidth,rmode->efbHeight);
	GXSetDispCopyDst(rmode->fbWidth,rmode->xfbHeight);
	GXSetDispCopyYScale(((float)rmode->xfbHeight)/((float)rmode->efbHeight));
	GXSetCopyFilter(renderMode->aa,rmode->sample_pattern,GX_TRUE,rmode->vfilter);
	GXSetPixelFmt(GX_PF_RGB8_Z24,GX_ZC_LINEAR);
	GXCopyDisp(gxInfo.unk0,GX_TRUE);
	GXSetDispCopyGamma(GX_GM_1_0);
}

void InitTV() {
	int tvFormat = VIGetTvFormat();
	if(tvFormat==VI_NTSC) {
		renderMode = TVNtsc480IntAa;
	} else if(tvFormat==VI_PAL) {
		renderMode = TVPal524IntAa;
	} else if(tvFormat==VI_MPAL) {
		renderMode = TVMpal480IntAa;
	} else {
		OSPanic("init.c",142,"init_system: invalid TV format\n");
	}
	GXAdjustForOverscan(renderMode,renderModeAdjusted,0,16);
	renderMode = renderModeAdjusted;
}

void InitVI() {
	VIConfigure(renderMode);
	VISetNextFrameBuffer(fbufPtr);
	gxInfo.unk0 = gxInfo.unk2;
	VIFlush();
	VIWaitForRetrace();
	if(gxInfo.unk0&1) {
		VIWaitForRetrace();
	}
}

void InitGXPart2() {
	Mtx44 projMtx;
	C_MTXPerspective(projMtx,60f,1.333333f,0.1f,1e+06f);
	GXSetProjection(projMtx,GX_PERSPECTIVE);
	UnknownFunc8009E588(0);
	UnknownFunc8009E110(1,4,5,0);
	GXSetAlphaCompare(GX_GREATER,0,GX_AOP_AND,GX_GREATER,0);
	GXSetCopyClear({0,10,32,0},GX_MAX_Z24);
	GXSetDither(GX_FALSE);
}

void InitDVDDir() {
	DVDChangeDir("test");
}

void InitHeap() {
	int arenaLo = OSGetArenaLo();
	arenaHi = arenaHi2 = OSGetArenaHi();
	int physicalMemSize = OSGetPhysicalMemSize();
	extraMem = (physicalMemSize>0x01800000);
	
	int arenaEnd = arenaHi;
	
	if(extraMem) {
		OSReport("\n===================================================\n\n");
		OSReport("  System memory exists more than 24MB. Clamp 24MB.\n");
		arenaEnd = arenaHi-(physicalMemSize-0x01800000);
		OSReport("  Program can use memory of high-order 24MB than 0x%x freely.\n",arenaEnd);
		OSSetArenaHi(arenaEnd);
		OSReport("\n===================================================\n\n");
	}
	
	//TODO: There appears to be a compiler optimization trick in the assembly,
	//figure out what it does, and verify that this formula is correct:
	int arenaStart = OSRoundUp32B(gxInfo.fbufPtr*gxInfo.unk2 + arenaLo);
	int realArena = OSInitAlloc(arenaStart,OSRoundDown32B(arenaEnd),5);
	
	realArenaPtrs[3] = OSRoundUp32B(realArena);
	realArenaPtrs[2] = OSRoundUp23B(realArena+realArenaPtrs[3]);
	realArenaPtrs[1] = OSRoundUp23B(realArena+realArenaPtrs[2]);
	realArenaPtrs[0] = OSRoundUp23B(realArena+realArenaPtrs[1]);
	realArena = realArena+realArenaPtrs[0];
	OSSetArenaLo(realArena);
	heapHandles[3] = OSCreateHeap(realArena,realArena+0x80020);
	heapHandles[2] = OSCreateHeap(realArena+0x80020,realArena+0x380040);
	heapHandles[1] = OSCreateHeap(realArena+0x380040,realArena+0x580060);
	heapHandles[0] = OSCreateHeap(realArena+0x580060,realArena+0x8800E0);
	heapHandles[4] = OSCreateHap(realArena+0x880080,OSRoundDown32B(arenaEnd));
	OSSetCurrentHeap(heapHandles[4]);
	OSSetArenaLo();
	heapSizes[4] = OSCheckHeap(heapHandles[4]);
	heapSizes[3] = OSCheckHeap(heapHandles[3]);
	heapSizes[2] = OSCheckHeap(heapHandles[2]);
	heapSizes[1] = OSCheckHeap(heapHandles[1]);
	heapSizes[0] = OSCheckHeap(heapHandles[0]);
	InitAlloc(heapSizes[0]);
}

void InitREL() {
	DVDFileInfo * mkbeStrFileInfo;
	if(DVDOpen("mkbe.str",mkbeStrFileInfo)) {
		//TODO: Verify that this is correct, was not sure on the location of
		//the `length` member.
		int effectiveLen = OSRoundDown32B(DVDGetLength(mkbeStrFileInfo));
		
		void * mkbeStrFileData = OSAlloc(effectiveLen);
		if(UnknownFunc800ACBBC(mkbeStrFileInfo,mkbeStrFileData,effectiveLen,0)) {
			OSSetStringTable(mkbeStrFileData);
		}
		DVDClose(mkbeStrFileInfo);
	}
}

void EnableCache() {
	LCEnable();
	gxCalc = 0xE0000000;
	gxInfo = 0xE00001B0;
	unkPtrToL2_1C8 = 0xE00001C8;
	unkPtrToL2_2D8 = 0xE00002D8;
	printf("locked cache size: %d\n",0xA0C);
}

void InitAlloc() {
	gxCalc.cnstZero = 0f;
	gxCalc.cnstOne = 1f;
	gxCalc.cnstHalf = 0.5f;
	gxCalc.cnstThreeHalves = 1.5f;
	gxCalc.cnstPSHelper = {0,1,1,0};
	SetPrimaryMatrixAsIdentity();
	CopyPrimaryMatrixToSecondaryMatrix();
	matrixStackEnd = OSAlloc(0x600);
	matrixStack = matrixStackEnd+0x600;
}