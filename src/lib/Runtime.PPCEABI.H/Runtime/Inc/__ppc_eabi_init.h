__declspec(section ".init") void __init_hardware(void);
void __init_user(void);
__declspec(section ".init") void __flush_cache(void *address, unsigned int size);
