#ifndef _SRC_NAME_ENTRY_H_
#define _SRC_NAME_ENTRY_H_

extern struct ScoreRecord lbl_802C67D4[4][5];

void name_entry_init(void);
void ev_name_entry_init(void);
void ev_name_entry_main(void);
void ev_name_entry_dest(void);
void draw_name_entry_hud(void);
int u_is_name_entry_finished(void);
void func_800AEAD0(void);
struct ScoreRecord *func_800AEC74(int, struct ScoreRecord *);
int func_800AECCC(int, struct ScoreRecord *);
void func_800AEDDC(void);
void func_800AEDE0(void);
void func_800AF164(void);
void effect_nameent_code_init(struct Effect *);
void effect_nameent_code_main(struct Effect *);
void effect_nameent_code_draw(struct Effect *);
void effect_nameent_code_destroy(struct Effect *);
void effect_get_nameent_code_init(struct Effect *);
void effect_get_nameent_code_main(struct Effect *);
void effect_get_nameent_code_draw(struct Effect *);
void effect_get_nameent_code_destroy(struct Effect *);
void stobj_nameent_btn_init(struct Stobj *);
void stobj_nameent_btn_main(struct Stobj *);
void stobj_nameent_btn_draw(struct Stobj *);
void stobj_nameent_btn_coli(struct Stobj *, struct PhysicsBall *);
void stobj_nameent_btn_destroy(struct Stobj *);
void stobj_nameent_btn_debug(struct Stobj *);
void func_800AFC1C(struct MemcardGameData *);
void func_800AFC4C(struct MemcardGameData *);

#endif
