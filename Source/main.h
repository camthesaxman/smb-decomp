#ifndef _MAIN_H_
#define _MAIN_H_

//Includes
//!!Insert DOLPHIN SDK or DEVKITPRO includes here!!
#include <stdio.h>
#include <stdbool.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>

#include "ext_math.h"
#include "perf_man.h"

//Structures
typedef struct {
	Mtx primaryMtx;
	Mtx secondaryMtx;
	//unknown stuff... eventually...
	Mtx * matrixStackEnd;		//offset of 0x90
	Mtx * matrixStack;
	//even more stuff... eventually...
	float cnstZero;		//offset of 0x198
	float cnstOne;
	float cnstHalf;
	float cnstThreeHalves;
	char cnstPSHelper[4];
	//TODO: FINISH (currently not aligned properly)
} gx_calc_t;
typedef struct {
	int unk0;
	void * fbufPtr;
	int unk2;
	int unk3;
	GXFifoObj * gxFifoBase;
	int unk5;
} gx_info_t;

//Variables
OSHeapHandle heapHandles[5];
int heapSizes[5];
int realArenaPtrs[4];
gx_calc_t gxCalc;
gx_info_t gxInfo;

GXRenderModeObj *renderMode,*renderModeAdjusted;

int arenaHi,arenaHi2;
bool extraMem;

//int unkPtrToL2_000;		^gxCalc^
//int unkPtrToL2_1B0;		^gxInfo^
int unkPtrToL2_1C8;		//TODO: figure out what this does
int unkPtrToL2_2D8;		//TODO: figure out what this does

#endif