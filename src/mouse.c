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
// extern struct Sprite spriteInfo[];
// extern s8 lbl_802F1360[8];
extern s32 lbl_802F1EA8;

extern f64 lbl_802F5848; // = 0.1f

extern f64 lbl_802F5850;

// extern float lbl_802F5858;// = 0.01f
// extern float lbl_802F585C;// = 1.0f
// extern float lbl_802F5860;// = 0.0f

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
    s16 *ptr_posVertical;
    s16 _spriteIdx;
    s16 *_unk08;
    s16 *_unk06;
    s16 _posHorizontal;
    u16 _button;
    s16 *_unk0a;
    s16 _posVertical;
    s32 phi_r8;
    s8 *_statusList;
    s32 phi_r9;
    s32 i;
    s32 temp_r9;
    s16 *temp_r10;
    
    struct Sprite *_spriteInfo;
    struct Mouse *_lbl_802BA190;

    _lbl_802BA190 = &lbl_802BA190[0];
    if (
        (lbl_802F1EA8 == 0U)
        && ((dipSwitches & DIP_TEST_CAM) == 0)
    ) {
        _lbl_802BA190->unk04 = _lbl_802BA190->posHorizontal;
        ptr_posVertical = &_lbl_802BA190->posVertical;
        _unk06 = &_lbl_802BA190->unk06;
        _lbl_802BA190->unk06 = *ptr_posVertical;

        phi_r8 = 1;
        
        if (analogButtonInfo[0][0] & PAD_BUTTON_B) {
            // if press "B button"
            phi_r8 = 8;
        }
        _button = controllerInfo[0].unk0[4].button;
        if ((_button & 8) != 0) {
            *ptr_posVertical -= phi_r8;
        }
        if ((_button & 4) != 0) {
            *ptr_posVertical += phi_r8;
        }
        
        if ((_button & 1) != 0) {
            _lbl_802BA190->posHorizontal -= phi_r8;
        }
        if ((_button & 2) != 0) {
            _lbl_802BA190->posHorizontal += phi_r8;
        }
        
        _lbl_802BA190->posHorizontal = _lbl_802BA190->posHorizontal + (lbl_802F5848 * controllerInfo[0].unk0[0].stickX);
        *ptr_posVertical = *ptr_posVertical + lbl_802F5848 * -controllerInfo[0].unk0[0].stickY;

        // Horizontal Check
        if (_lbl_802BA190->posHorizontal < 0) {
            _lbl_802BA190->posHorizontal = 0;
        }
        if (_lbl_802BA190->posHorizontal > 0x270) {
            _lbl_802BA190->posHorizontal = 0x270;
        }

        // Vertical Check
        if (*ptr_posVertical < 0) {
            // 0x190
            *ptr_posVertical = 0;
        }
        if ((s16) *ptr_posVertical > 0x1D0) {
            *ptr_posVertical = 0x1D0;
        }

        _unk08 = &_lbl_802BA190->unk08;
        *_unk08 = _lbl_802BA190->posHorizontal - *_unk08;
        _unk0a = &_lbl_802BA190->unk0a;
        *_unk0a = *ptr_posVertical - *_unk06;
        
        if ( (controllerInfo[0].unk0[2].button & PAD_BUTTON_A) != 0 ) {
            // if press "A button"
            temp_r10 = &_lbl_802BA190->spriteIdx;
            
            if ( *temp_r10 >= 0 ) {
                *temp_r10 = -1;
            } else {
                *temp_r10 = -1;
                _spriteInfo = &spriteInfo[0];
                temp_r9 = spritePoolInfo.unk38;
                _statusList = spritePoolInfo.statusList;
                _posHorizontal = _lbl_802BA190->posHorizontal;
                _posVertical = *ptr_posVertical;

                if (temp_r9 > 0) {
                    phi_r9 = 0;
                    for (i = temp_r9; i != 0; i--) {
                        if (
                            _statusList
                            && _posHorizontal >= _spriteInfo->left
                            && _posHorizontal <= _spriteInfo->right
                            && _posVertical >= _spriteInfo->top
                            && _posVertical <= _spriteInfo->bottom
                        ) {
                            *temp_r10 = phi_r9;
                            break;
                        }
                        phi_r9++;
                        _spriteInfo++;
                        _statusList++;
                    }
                }
            }
        }

        _spriteIdx = _lbl_802BA190->spriteIdx;
        if (_spriteIdx >= 0) {
            _spriteInfo = &spriteInfo[0] + _spriteIdx;
            while(_spriteInfo->unk50 != NULL) {
                _spriteInfo = _spriteInfo->unk50;
            }
            _spriteInfo->x = _spriteInfo->x + *_unk08;
            _spriteInfo->y = _spriteInfo->y + *_unk0a;
        }
    }
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

// void ev_mouse_update(void)
// {
//     struct NaomiSpriteParams _naomiSprite;
//     struct Sprite *_spriteInfo;
//     struct Mouse *_mouse;

//     _mouse = &lbl_802BA190[0];
//     if (
//         (lbl_802F1EA8 == 0U)
//     && ((dipSwitches & DIP_TEST_CAM) == 0)
//     ) {
//         _naomiSprite.bmpId = 0x1;
//         _naomiSprite.x = _mouse->posHorizontal;
//         _naomiSprite.y = _mouse->posVertical;
//         _naomiSprite.z = lbl_802F5858;
//         _naomiSprite.scaleX = lbl_802F585C;
//         _naomiSprite.scaleY = lbl_802F585C;
//         _naomiSprite.u1 = lbl_802F5860;
//         _naomiSprite.v1 = lbl_802F5860;
//         _naomiSprite.u2 = lbl_802F585C;
//         _naomiSprite.v2 = lbl_802F585C;
//         _naomiSprite.rotation = 0x0;
//         _naomiSprite.opacity = lbl_802F585C;
//         _naomiSprite.unk30 = -1;
//         _naomiSprite.flags = 5;
//         _naomiSprite.mulColor = -1;
//         _naomiSprite.addColor = 0x0;
//         draw_naomi_sprite(&_naomiSprite);
//         if (_mouse->spriteIdx >= 0) {
//             _spriteInfo = &spriteInfo[_mouse->spriteIdx];
//             reset_text_draw_settings();
//             set_text_pos( (_spriteInfo->left - 8), (_spriteInfo->top - 8) );
//             g_draw_text( (char*)&lbl_802F1360[0] );
//             set_text_pos( (_spriteInfo->left - 8), _spriteInfo->bottom );
//             g_draw_text( (char*)&lbl_802F1360[0] );
//             set_text_pos( _spriteInfo->right, (_spriteInfo->top - 8) );
//             g_draw_text( (char*)&lbl_802F1360[0] );
//             set_text_pos( _spriteInfo->right, _spriteInfo->bottom );
//             g_draw_text( (char*)&lbl_802F1360[0] );
//         }
//     }
//     return;
// }