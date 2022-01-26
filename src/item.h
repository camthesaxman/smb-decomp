struct Item
{
    s16 id;
    s16 unk2;
    s16 type;
    s16 unk6;
    u32 unk8;
    s16 unkC;
    s16 state;
    s16 unk10;
    s16 unk12;
    float unk14;
    float unk18;
    void *unk1C;
    Vec unk20;  // position?
    Vec unk2C;
    s16 xrot;
    s16 yrot;
    s16 zrot;
    s16 unk3E;
    s16 unk40;
    s16 unk42;
    Vec unk44;
    s16 unk50;
    s16 unk52;
    s16 unk54;
    u8 filler56[2];
    void (*unk58)(struct Item *, struct Struct800690DC *);
    s8 unk5C;
    u8 filler5D[1];
    s16 unk5E;
    struct StageCollHdr_child3 *unk60;
    s32 unk64;
    struct GMAModelHeader *shadowModel;
    S16Vec unk6C;
    float unk74;
    GXColor shadowColor;
    Vec unk7C;
    float unk88;
};  // size = 0x8C

struct ItemFuncs
{
    void (*init)(struct Item *);
    void (*main)(struct Item *);
    void (*draw)(struct Item *);
    void (*collect)(struct Item *, struct Struct800690DC *);
    void (*destroy)(struct Item *);
    void (*unk14)(struct Item *);
    void (*debug)(struct Item *);
};

extern struct Item itemInfo[256];

void ev_item_init(void);
void ev_item_main(void);
void ev_item_dest(void);
void item_draw();
// ? func_80068474();
void func_800685C4(void);
// ? func_800689B4();
void func_80068A68(struct StageCollHdr *, int);
void item_dummy_init(struct Item *);
void item_dummy_main(struct Item *);
void item_dummy_draw(struct Item *);
void item_dummy_collect(struct Item *, struct Struct800690DC *);
void item_dummy_destroy(struct Item *);
void func_80068C8C(struct Item *);
void item_dummy_debug(struct Item *);
void item_coin_init(struct Item *);
void item_coin_main(struct Item *);
void item_coin_draw(struct Item *);
void item_coin_collect(struct Item *, struct Struct800690DC *);
void item_coin_destroy(struct Item *);
void func_80069394(struct Item *);
void item_coin_debug(struct Item *);
struct GMAModelHeader *find_item_model(struct ModelLOD **a);
void item_pilot_init(struct Item *);
void item_pilot_main(struct Item *);
void item_pilot_draw(struct Item *);
void item_pilot_collect(struct Item *, struct Struct800690DC *);
void item_pilot_destroy(struct Item *);
void func_8006A564(struct Item *);
void item_pilot_debug(struct Item *);
