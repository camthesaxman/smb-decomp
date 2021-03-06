#ifndef _DOLPHIN_GXSTRUCT_H_
#define _DOLPHIN_GXSTRUCT_H_

#include <dolphin/types.h>

#define VI_TVMODE(format, interlace)  (((format) << 2) + (interlace))

#define VI_INTERLACE     0
#define VI_NON_INTERLACE 1
#define VI_PROGRESSIVE   2

#define VI_NTSC      0
#define VI_PAL       1
#define VI_MPAL      2
#define VI_DEBUG     3
#define VI_DEBUG_PAL 4
#define VI_EURGB60   5

typedef enum
{
    VI_TVMODE_NTSC_INT      = VI_TVMODE(VI_NTSC,        VI_INTERLACE),
    VI_TVMODE_NTSC_DS       = VI_TVMODE(VI_NTSC,        VI_NON_INTERLACE),
    VI_TVMODE_NTSC_PROG     = VI_TVMODE(VI_NTSC,        VI_PROGRESSIVE),
    VI_TVMODE_PAL_INT       = VI_TVMODE(VI_PAL,         VI_INTERLACE),
    VI_TVMODE_PAL_DS        = VI_TVMODE(VI_PAL,         VI_NON_INTERLACE),
    VI_TVMODE_EURGB60_INT   = VI_TVMODE(VI_EURGB60,     VI_INTERLACE),
    VI_TVMODE_EURGB60_DS    = VI_TVMODE(VI_EURGB60,     VI_NON_INTERLACE),
    VI_TVMODE_MPAL_INT      = VI_TVMODE(VI_MPAL,        VI_INTERLACE),
    VI_TVMODE_MPAL_DS       = VI_TVMODE(VI_MPAL,        VI_NON_INTERLACE),
    VI_TVMODE_DEBUG_INT     = VI_TVMODE(VI_DEBUG,       VI_INTERLACE),
    VI_TVMODE_DEBUG_PAL_INT = VI_TVMODE(VI_DEBUG_PAL,   VI_INTERLACE),
    VI_TVMODE_DEBUG_PAL_DS  = VI_TVMODE(VI_DEBUG_PAL,   VI_NON_INTERLACE)
} VITVMode;

typedef enum
{
    VI_XFBMODE_SF = 0,
    VI_XFBMODE_DF
} VIXFBMode;

typedef struct
{
    /*0x00*/ VITVMode viTVmode;
    /*0x04*/ u16 fbWidth;
    /*0x06*/ u16 efbHeight;
    /*0x08*/ u16 xfbHeight;
    /*0x0A*/ u16 viXOrigin;
    /*0x0C*/ u16 viYOrigin;
    /*0x0E*/ u16 viWidth;
    /*0x10*/ u16 viHeight;
    /*0x14*/ VIXFBMode xFBmode;
    /*0x18*/ u8 field_rendering;
    u8 aa;
    u8 sample_pattern[12][2];
    u8 vfilter[7];
} GXRenderModeObj;

typedef struct
{
    u8 r;
    u8 g; 
    u8 b; 
    u8 a;
} GXColor;

typedef struct
{
    u32 dummy[8];
} GXTexObj;

typedef struct
{
    u32 dummy[16];
} GXLightObj;

#endif
