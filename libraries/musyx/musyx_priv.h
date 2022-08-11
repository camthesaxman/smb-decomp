extern SND_HOOKS salHooks;

bool ReverbHICreate(_SND_REVHI_WORK *rev, f32 coloration, f32 time, f32 mix, f32 damping, f32 preDelay, f32 crosstalk);
void ReverbHIFree(_SND_REVHI_WORK *rev);
void ReverbHICallback(void *, void *, void *, void *);
