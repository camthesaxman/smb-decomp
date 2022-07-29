
#ifdef DEBUG
#define debug_puts   puts
#define debug_printf printf
#else
#define debug_puts(...)   ((void)0)
#define debug_printf(...) ((void)0)
#endif

void print_render_stats(void);
