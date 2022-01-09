// #include <assert.h>
// #include <string.h>
#include <dolphin.h>

// sizeis all "short"
struct Struct802BA190
{
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
    s16 unkC;
};

extern struct Struct802BA190 lbl_802BA190[1];

void ev_mouse_init(void)
{
    struct Struct802BA190 *r4;
    r4 = &lbl_802BA190[0];

    r4->unk0 = 0x140;
    r4->unk2 = 0xf0;
    r4->unkC = -1;

    return;
}