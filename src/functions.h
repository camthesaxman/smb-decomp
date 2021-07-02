#define ARRAY_COUNT(arr) ((int)(sizeof(arr)/sizeof(arr[0])))

extern void mathutil_set_a_mtx_identity(void);
extern void mathutil_set_b_mtx_a_mtx(void);

extern int printf(const char *, ...);

extern int func_800ACBBC();

void initialize(void);
void init_gx(void);
void init_tv(void);
void init_vi(void);
void init_gx_2(void);
void init_dvd(void);
void init_heap(void);
void init_rel(void);
void init_cache(void);

extern void func_800855CC(float, float, float, void *, int);

void srand (unsigned int seed);

void init_cache_ptrs(void);

extern void func_800301AC(const char *, ...);

extern void perf_init_timer(int);
extern int perf_stop_timer(int);
extern void func_8008D158();
