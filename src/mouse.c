#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mouse.h"
#include "bitmap.h"
#include "sprite.h"
#include "input.h"

// sizeis all "short"
struct Mouse {
    s16 posHorizontal;
    s16 posVertical;
    s16 unk04;
    s16 unk06;
    s16 unk08;
    s16 unk0a;
    s16 spriteIdx;
};

extern struct Mouse lbl_802BA190[1];
extern struct Sprite spriteInfo[];
extern char lbl_802F1360[8];

extern float lbl_802F5858;// = 0.01f; 
extern float lbl_802F585C;// = 1.0f;
extern float lbl_802F5860;// = 0.0f;

void ev_mouse_init(void)
{
    struct Mouse *_mouse;
    _mouse = &lbl_802BA190[0];
    _mouse->posHorizontal = 0x140;
    _mouse->posVertical = 0xf0;
    _mouse->spriteIdx = -1;
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

void ev_mouse_update(void)
{
    struct NaomiSpriteParams _naomiSprite;
    struct Sprite *_spriteInfo;
    struct Mouse *_mouse;

    _mouse = &lbl_802BA190[0];
    if (
        (lbl_802F1EA8 == 0U)
    && ((dipSwitches & DIP_TEST_CAM) == 0)
    ) {
        _naomiSprite.bmpId = 0x1;
        _naomiSprite.x = _mouse->posHorizontal;
        _naomiSprite.y = _mouse->posVertical;
        _naomiSprite.z = lbl_802F5858;
        _naomiSprite.scaleX = lbl_802F585C;
        _naomiSprite.scaleY = lbl_802F585C;
        _naomiSprite.u1 = lbl_802F5860;
        _naomiSprite.v1 = lbl_802F5860;
        _naomiSprite.u2 = lbl_802F585C;
        _naomiSprite.v2 = lbl_802F585C;
        _naomiSprite.rotation = 0x0;
        _naomiSprite.opacity = lbl_802F585C;
        _naomiSprite.unk30 = -1;
        _naomiSprite.flags = 5;
        _naomiSprite.mulColor = -1;
        _naomiSprite.addColor = 0x0;
        draw_naomi_sprite(&_naomiSprite);
        if (_mouse->spriteIdx >= 0) {
            _spriteInfo = &spriteInfo[_mouse->spriteIdx];
            reset_text_draw_settings();
            set_text_pos( (_spriteInfo->left - 8), (_spriteInfo->top - 8) );
            g_draw_text( &lbl_802F1360[0] );
            set_text_pos( (_spriteInfo->left - 8), _spriteInfo->bottom );
            g_draw_text( &lbl_802F1360[0] );
            set_text_pos( _spriteInfo->right, (_spriteInfo->top - 8) );
            g_draw_text( &lbl_802F1360[0] );
            set_text_pos( _spriteInfo->right, _spriteInfo->bottom );
            g_draw_text( &lbl_802F1360[0] );
        }
    }
    return;
}