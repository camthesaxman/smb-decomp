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

extern void ev_memcard_init(void);
extern void ev_memcard_main(void);
extern void ev_memcard_dest(void);
extern void ev_stage_init(void);
extern void ev_stage_main(void);
extern void ev_stage_dest(void);
extern void ev_world_init(void);
extern void ev_world_main(void);
extern void ev_world_dest(void);
extern void ev_ball_init(void);
extern void ev_ball_main(void);
extern void ev_ball_dest(void);
extern void ev_stobj_init(void);
extern void ev_stobj_main(void);
extern void ev_stobj_dest(void);
extern void ev_item_init(void);
extern void ev_item_main(void);
extern void ev_item_dest(void);
extern void ev_recplay_init(void);
extern void ev_recplay_main(void);
extern void ev_recplay_dest(void);
extern void ev_obj_collision_init(void);
extern void ev_obj_collision_main(void);
extern void ev_obj_collision_dest(void);
extern void ev_name_entry_init(void);
extern void ev_name_entry_main(void);
extern void ev_name_entry_dest(void);
extern void ev_info_init(void);
extern void ev_info_main(void);
extern void ev_info_dest(void);
extern void ev_course_init(void);
extern void ev_course_main(void);
extern void ev_course_dest(void);
extern void ev_vibration_init(void);
extern void ev_vibration_main(void);
extern void ev_vibration_dest(void);
extern void ev_view_init(void);
extern void ev_view_main(void);
extern void ev_view_dest(void);
extern void ev_effect_init(void);
extern void ev_effect_main(void);
extern void ev_effect_dest(void);
extern void ev_minimap_init(void);
extern void ev_minimap_main(void);
extern void ev_minimap_dest(void);
extern void ev_camera_init(void);
extern void ev_camera_main(void);
extern void ev_camera_dest(void);
extern void ev_sprite_init(void);
extern void ev_sprite_main(void);
extern void ev_sprite_dest(void);
extern void ev_mouse_init(void);
extern void ev_mouse_main(void);
extern void ev_mouse_dest(void);
extern void ev_sound_init(void);
extern void ev_sound_main(void);
extern void ev_sound_dest(void);
extern void ev_background_init(void);
extern void ev_background_main(void);
extern void ev_background_dest(void);
extern void ev_rend_efc_init(void);
extern void ev_rend_efc_main(void);
extern void ev_rend_efc_dest(void);
