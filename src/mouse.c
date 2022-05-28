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

struct Mouse mouse;
extern s8 lbl_802F1360[8];
extern s32 lbl_802F1EA8;

extern float lbl_802F5848; // = 0.1

extern float lbl_802F5858;// = 0.01f
extern float lbl_802F585C;// = 1.0f
extern float lbl_802F5860;// = 0.0f

# define HORIZONTAL_DEFAULT 0x140;
# define VERTICAL_DEFAULT 0xf0;
void ev_mouse_init(void)
{
    mouse.posHorizontal = HORIZONTAL_DEFAULT;
    mouse.posVertical = VERTICAL_DEFAULT;
    mouse.spriteIdx = -1;
    return;
}

# define HORIZONTAL_MIN 0x00
# define HORIZONTAL_MAX 0x270
# define VERTICAL_MIN 0x00
# define VERTICAL_MAX 0x1D0

void ev_mouse_main(void)
{
    s8 *_statusList;
    s16 _spriteIdx;
    int phi_r8;
    s32 phi_r9;
    u16 _button;

    int i;
    
    
    struct Sprite *_spriteInfo;
    if (
        (lbl_802F1EA8 == 0U)
        && ((dipSwitches & DIP_TEST_CAM) == 0)
    ) {
        mouse.unk04 = mouse.posHorizontal;
        mouse.unk06 = mouse.posVertical;

        phi_r8 = 1;
        if (analogButtonInfo[0][0] & PAD_BUTTON_B) {
            // if press "B button"
            phi_r8 = 8;
        }
        _button = controllerInfo[0].unk0[4].button;
        if ((_button & PAD_BUTTON_UP) != 0) {
            // press D-pad up
            mouse.posVertical -= phi_r8;
        }
        if ((_button & PAD_BUTTON_DOWN) != 0) {
            // press D-pad down
            mouse.posVertical += phi_r8;
        }
        
        if ((_button & PAD_BUTTON_LEFT) != 0) {
            // press D-pad left
            mouse.posHorizontal -= phi_r8;
        }
        if ((_button & PAD_BUTTON_RIGHT) != 0) {
            // press D-pad right
            mouse.posHorizontal += phi_r8;
        }
        
        mouse.posHorizontal += (controllerInfo[0].unk0[0].stickX * lbl_802F5848);
        mouse.posVertical += (-controllerInfo[0].unk0[0].stickY * lbl_802F5848);

        // Horizontal Check
        if (mouse.posHorizontal < HORIZONTAL_MIN) {
            mouse.posHorizontal = HORIZONTAL_MIN;
        }
        if (mouse.posHorizontal > HORIZONTAL_MAX) {
            mouse.posHorizontal = HORIZONTAL_MAX;
        }

        // Vertical Check
        if (mouse.posVertical < VERTICAL_MIN) {
            mouse.posVertical = VERTICAL_MIN;
        }
        if (mouse.posVertical > VERTICAL_MAX) {
            mouse.posVertical = VERTICAL_MAX;
        }

        
        // 0x1b4
        mouse.unk08 = mouse.posHorizontal - mouse.unk04;
        // 0x1d0
        mouse.unk0a = mouse.posVertical - mouse.unk06;

        if ( (controllerInfo[0].unk0[2].button & PAD_BUTTON_A) != 0 ) {
            // if press "A button"
            
            if ( mouse.spriteIdx >= 0 ) {
                mouse.spriteIdx = -1;
            } else {
                mouse.spriteIdx = -1;
                _spriteInfo = &spriteInfo[0];
                _statusList = spritePoolInfo.statusList;

                phi_r9 = 0;
                for (i = spritePoolInfo.unk38; i > 0; i--) {
                    if (
                        *_statusList != 0
                        && mouse.posHorizontal >= _spriteInfo->left
                        && mouse.posHorizontal <= _spriteInfo->right
                        && mouse.posVertical >= _spriteInfo->top
                        && mouse.posVertical <= _spriteInfo->bottom
                    ) {
                        mouse.spriteIdx = phi_r9;
                        break;
                    }
                    phi_r9++;
                    _spriteInfo++;
                    _statusList++;
                }
            }
        }
        
        _spriteIdx = mouse.spriteIdx;
        if (_spriteIdx >= 0) {
            _spriteInfo = &spriteInfo[_spriteIdx];
            while(_spriteInfo->unk50 != NULL) {
                _spriteInfo = _spriteInfo->unk50;
            }

            _spriteInfo->x = _spriteInfo->x + mouse.unk08;
            _spriteInfo->y = _spriteInfo->y + mouse.unk0a;
        }
    }
    return;
}

void ev_mouse_dest(void){
    return;
}

void ev_mouse_update(void)
{
    struct NaomiSpriteParams _naomiSprite;
    struct Sprite *_spriteInfo;

    if (
        (lbl_802F1EA8 == 0U)
    && ((dipSwitches & DIP_TEST_CAM) == 0)
    ) {
        _naomiSprite.bmpId = 0x1;
        _naomiSprite.x = mouse.posHorizontal;
        _naomiSprite.y = mouse.posVertical;
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
        if (mouse.spriteIdx >= 0) {
            _spriteInfo = &spriteInfo[mouse.spriteIdx];
            reset_text_draw_settings();
            set_text_pos( (_spriteInfo->left - 8), (_spriteInfo->top - 8) );
            g_draw_text( (char*)&lbl_802F1360[0] );
            set_text_pos( (_spriteInfo->left - 8), _spriteInfo->bottom );
            g_draw_text( (char*)&lbl_802F1360[0] );
            set_text_pos( _spriteInfo->right, (_spriteInfo->top - 8) );
            g_draw_text( (char*)&lbl_802F1360[0] );
            set_text_pos( _spriteInfo->right, _spriteInfo->bottom );
            g_draw_text( (char*)&lbl_802F1360[0] );
        }
    }
    return;
}