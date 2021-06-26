#ifndef _DOLPHIN_GXENUM_H_
#define _DOLPHIN_GXENUM_H_

typedef u8 GXBool;

typedef enum
{
    GX_PERSPECTIVE,
    GX_ORTHOGRAPHIC,
} GXProjectionType;

typedef enum
{
    GX_NEVER,
    GX_LESS,
    GX_EQUAL,
    GX_LEQUAL,
    GX_GREATER,
    GX_NEQUAL,
    GX_GEQUAL,
    GX_ALWAYS,
} GXCompare;

typedef enum
{
    GX_AOP_AND,
    GX_AOP_OR,
    GX_AOP_XOR,
    GX_AOP_XNOR,
    GX_MAX_ALPHAOP,
} GXAlphaOp;

#endif
