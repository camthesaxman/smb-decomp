#ifndef _SRC_STOBJ_H_
#define _SRC_STOBJ_H_

// Stage object (stobj) type
enum
{
    SOT_BUMPER,
    SOT_JAMABAR,
    SOT_GOALTAPE,
    SOT_GOALBAG,
    SOT_GOALBAG_EXMASTER,
    SOT_MF_PNL_BUMPER,
    SOT_MF_PNL_ELECTRAP,
    SOT_MF_BULLET_TEST,
    SOT_MF_BOX,
    SOT_BUMPER_BGSPECIAL,
    SOT_NAMEENT_BTN,
};

struct Stobj
{
    /*0x00*/ s16 id;  // index into stobjInfo array
    s16 unk2;  // some other id?
    /*0x04*/ s16 type;
    u8 filler6[2];
    u32 unk8;
    /*0x0C*/ s16 state;
    /*0x0E*/ s16 counter;
    /*0x10*/ Vec u_model_origin;
    /*0x1C*/ Vec position;
    /*0x28*/ Vec position_2;
    /*0x34*/ float boundSphereRadius;
    /*0x38*/ void (*coliFunc)(struct Stobj *, struct PhysicsBall *);
    Vec unk3C;  // unknown type
    float unk48;
    float unk4C;
    float unk50;
    /*0x54*/ struct GMAModel *model;  // sometimes also a NaomiModel
    /*0x58*/ Vec u_some_pos;  // position within anim group?
    Vec unk64;
    /*0x70*/ s16 rotX;
    /*0x72*/ s16 rotY;
    /*0x74*/ s16 rotZ;
    s16 unk76;
    s16 unk78;
    u8 filler7A[0x7C-0x7A];
    Vec unk7C;
    s16 unk88;
    s16 unk8A;
    s16 unk8C;
    u8 filler8E[2];
    Vec unk90;  // yet another position?
    float unk9C;
    /*0xA0*/ s8 animGroupId;
    /*0xA4*/ void *extraData;  // pointer to a GoalTape or GoalBag struct
    Vec unkA8;
    /*0xB4*/ Vec u_local_pos;  // OFS
    /*0xC0*/ Vec u_local_vel;  // OFS SPD
};  // size = 0xCC

struct Struct8028C0B0
{
    float unk0[4];
    u32 unk10;
    struct GMAModel *unk14[4];
};

extern struct Stobj stobjInfo[128];
extern struct Struct8028C0B0 lbl_8028C0B0;

void ev_stobj_init(void);
void ev_stobj_main(void);
void ev_stobj_dest(void);
void stobj_draw(void);
s16 spawn_stobj(struct Stobj *);

void u_spawn_goal_stobjs(struct StageAnimGroup *, int);
void stobj_goaltape_init(struct Stobj *);
void stobj_goaltape_main(struct Stobj *);
void stobj_goaltape_draw(struct Stobj *);
void stobj_goaltape_coli(struct Stobj *, struct PhysicsBall *);
void stobj_goaltape_destroy(struct Stobj *);
void stobj_goaltape_debug(struct Stobj *);
void stobj_goalbag_init(struct Stobj *);
void stobj_goalbag_main(struct Stobj *);
void stobj_goalbag_draw(struct Stobj *);
void stobj_goalbag_coli(struct Stobj *, struct PhysicsBall *);
void stobj_goalbag_destroy(struct Stobj *);
void stobj_goalbag_debug(struct Stobj *);
void stobj_goalbag_exmaster_init(struct Stobj *);
void stobj_goalbag_exmaster_main(struct Stobj *);
void stobj_goalbag_exmaster_draw(struct Stobj *);
void stobj_goalbag_exmaster_coli(struct Stobj *, struct PhysicsBall *);
void stobj_goalbag_exmaster_destroy(struct Stobj *);
void stobj_goalbag_exmaster_debug(struct Stobj *);
void u_break_goal_tape(int, struct PhysicsBall *);
void func_8006F5F0(int);

#endif
