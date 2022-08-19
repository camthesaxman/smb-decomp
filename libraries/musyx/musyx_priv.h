#include <stddef.h>

extern SND_HOOKS salHooks;

extern struct
{
    u8 filler0[4];
    u32 unk4;
    u8 filler8[1];
} synthInfo;

bool ReverbHICreate(_SND_REVHI_WORK *rev, f32 coloration, f32 time, f32 mix, f32 damping, f32 preDelay, f32 crosstalk);
void ReverbHIFree(_SND_REVHI_WORK *rev);
void ReverbHICallback(void *, void *, void *, void *);

void *salMalloc(size_t len);
void salFree(void *addr);

void hwEnableIrq(void);
void hwDisableIrq(void);

extern u32 dspCmdList;
extern u16 dspCmdFirstSize;

int salBuildCommandList(int, int);
