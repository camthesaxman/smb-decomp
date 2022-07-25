#ifndef _SRC_ITEM_H_
#define _SRC_ITEM_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>
#include <dolphin/gx/GXStruct.h>

struct Item
{
    /*0x00*/ s16 id; // Index in item pool
    /*0x02*/ s16 unk2;
    /*0x04*/ s16 type;
    /*0x06*/ s16 subType; // Single vs. bunch for bananas
    /*0x08*/ u32 flags;
    /*0x0C*/ s16 unkC;
    /*0x0E*/ s16 state;
    /*0x10*/ s16 unk10;
    /*0x12*/ s16 unk12;
    /*0x14*/ float unk14;
    /*0x18*/ float unk18;
    /*0x1C*/ void *modelLODs;
    /*0x20*/ Point3d pos;
    /*0x2C*/ Vec vel;
    /*0x38*/ s16 rotX;
    /*0x3A*/ s16 rotY;
    /*0x3C*/ s16 rotZ;
    /*0x3E*/ s16 rotVelX;
    /*0x40*/ s16 rotVelY;
    /*0x42*/ s16 rotVelZ;
    /*0x44*/ Vec prevPos;
    /*0x50*/ s16 prevRotX;
    /*0x52*/ s16 prevRotY;
    /*0x54*/ s16 prevRotZ;
    /*0x56*/ u8 filler56[2];
    /*0x58*/ void (*unk58)(struct Item *, struct PhysicsBall *);
    /*0x5C*/ s8 animGroupId; // Index of anim group that this item is attached to
    /*0x5E*/ s16 unk5E;
    /*0x60*/ struct StageBanana *stageBanana; // Also used in pilot, maybe not specifically a banana
    /*0x64*/ s32 unk64;
    /*0x68*/ struct GMAModel *shadowModel;
    /*0x6C*/ S16Vec unk6C;
    /*0x74*/ float unk74;
    /*0x78*/ GXColor shadowColor;
    /*0x7C*/ Vec unk7C;
    /*0x88*/ float unk88;
};  // size = 0x8C

enum
{
    ITEM_FLAG_INVISIBLE = (1 << 0),
};

struct ItemFuncs
{
    void (*init)(struct Item *);
    void (*main)(struct Item *);
    void (*draw)(struct Item *);
    void (*collect)(struct Item *, struct PhysicsBall *);
    void (*destroy)(struct Item *);
    void (*unk14)(struct Item *);
    void (*debug)(struct Item *);
};

extern struct Item itemPool[256];

void ev_item_init(void);
void ev_item_main(void);
void ev_item_dest(void);
void item_draw();
// ? func_80068474();
void item_draw_shadows(void);
void func_800689B4(int);
void spawn_stage_banana_items(struct StageAnimGroup *, int);
void item_dummy_init(struct Item *);
void item_dummy_main(struct Item *);
void item_dummy_draw(struct Item *);
void item_dummy_collect(struct Item *, struct PhysicsBall *);
void item_dummy_destroy(struct Item *);
void func_80068C8C(struct Item *);
void item_dummy_debug(struct Item *);
void item_coin_init(struct Item *);
void item_coin_main(struct Item *);
void item_coin_draw(struct Item *);
void item_coin_collect(struct Item *, struct PhysicsBall *);
void item_coin_destroy(struct Item *);
void func_80069394(struct Item *);
void item_coin_debug(struct Item *);
struct GMAModel *get_lod(struct ModelLOD **a);
void item_pilot_init(struct Item *);
void item_pilot_main(struct Item *);
void item_pilot_draw(struct Item *);
void item_pilot_collect(struct Item *, struct PhysicsBall *);
void item_pilot_destroy(struct Item *);
void func_8006A564(struct Item *);
void item_pilot_debug(struct Item *);

#endif
