#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "sprite.h"
#include "mouse.h"

// sizeis all "short"
struct Struct802BA190
{
    s16 posHorizontal;
    s16 posVertical;
    s16 unk04;
    s16 unk06;
    s16 unk08;
    s16 unk0a;
    s16 spriteIdx;
};

extern struct Struct802BA190 lbl_802BA190[1];
extern struct Sprite spriteInfo[];

void ev_mouse_init(void)
{
    struct Struct802BA190 *_lbl_802BA190;
    _lbl_802BA190 = &lbl_802BA190[0];
    _lbl_802BA190->posHorizontal = 0x140;
    _lbl_802BA190->posVertical = 0xf0;
    _lbl_802BA190->spriteIdx = -1;
    return;
}

#ifdef NONMATCHING
void ev_mouse_main(void)
{
    return;
}
#else
asm void ev_mouse_main(void)
{
    nofralloc
#include "../asm/nonmatchings/ev_mouse_main.s"
}
#pragma peephole on
#endif

void ev_mouse_dest(void){
    return;
}

void func_80095024(void)
{
    struct NaomiSpriteParams _naomiSprite;
    struct Sprite *_spriteInfo;
    struct Struct802BA190 *_lbl_802BA190;

    _lbl_802BA190 = &lbl_802BA190[0];
    if (
        (lbl_802F1EA8 == 0U)
    && ((dipSwitches & DIP_TEST_CAM) == 0)
    ) {
        _naomiSprite.bmpId = 0x1;
        _naomiSprite.x = _lbl_802BA190->posHorizontal;
        _naomiSprite.y = _lbl_802BA190->posVertical;
        _naomiSprite.z = 0.01;
        _naomiSprite.zoomX = 1.0;
        _naomiSprite.zoomY = 1.0;
        _naomiSprite.u1 = 0.0;
        _naomiSprite.v1 = 0.0;
        _naomiSprite.u2 = 1.0;
        _naomiSprite.v2 = 1.0;
        _naomiSprite.rotation = 0x0;
        _naomiSprite.alpha = 1.0;
        _naomiSprite.unk30 = -1;
        _naomiSprite.flags = 5;
        _naomiSprite.color1 = -1;
        _naomiSprite.color2 = 0x0;
        draw_naomi_sprite(&_naomiSprite);
        if ((s16) _lbl_802BA190->spriteIdx >= 0) {
            _spriteInfo = &spriteInfo[_lbl_802BA190->spriteIdx];
            func_80071A8C();
            g_set_text_pos( (f32) (_spriteInfo->left - 8), (f32)(_spriteInfo->top - 8) );
            g_draw_text( "+" );
            g_set_text_pos( (f32) (_spriteInfo->left - 8), (f32)(_spriteInfo->bottom) );
            g_draw_text( "+" );
            g_set_text_pos( (f32) _spriteInfo->right, (f32)(_spriteInfo->top - 8) );
            g_draw_text( "+" );
            g_set_text_pos( (f32) _spriteInfo->right, (f32)(_spriteInfo->bottom) );
            g_draw_text( "+" );
        }
    }
    return;
}