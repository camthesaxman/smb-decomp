#include <string.h>
#include <dolphin.h>

#ifdef __MWERKS__

void __OSSystemCallVectorEnd(void);

asm void __OSSystemCallVectorStart(void)
{
	nofralloc
	mfspr r9, 0x3f0
	ori r10, r9, 8
	mtspr 0x3f0, r10
	isync
	sync
	mtspr 0x3f0, r9
	rfi
entry __OSSystemCallVectorEnd
	nop
}

void __OSInitSystemCall(void)
{
	void *buffer = (void *)0x80000C00;

	memcpy(buffer, __OSSystemCallVectorStart, (u8 *)__OSSystemCallVectorEnd - (u8 *)__OSSystemCallVectorStart);
	DCFlushRangeNoSync(buffer, 0x100);
	asm { sync }
	ICInvalidateRange(buffer, 0x100);
}

#endif
