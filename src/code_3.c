#include <stdlib.h>
#include <dolphin.h>

#include "global.h"
#include "adv.h"
#include "gma.h"
#include "gxutil.h"
#include "light.h"
#include "mathutil.h"
#include "mot_ape.h"
#include "nl2ngc.h"

extern s8 lbl_802F2060;

u8 lbl_802B2E70[0x900];
FORCE_BSS_ORDER(lbl_802B2E70)
s32 lbl_802B3770[0x10];
u32 lbl_802B37B0[0x10];

static void draw_aiai_hair(struct Ape *, struct ApeFacePart *, struct Struct802B39C0_B0_child *);
static void draw_eye(struct Ape *, struct ApeFacePart *, struct Struct802B39C0_B0_child *);
static void draw_baby_hand(struct Ape *, struct ApeFacePart *, struct Struct802B39C0_B0_child *);
static void draw_left_hand(struct Ape *, struct ApeFacePart *, struct Struct802B39C0_B0_child *);
static void draw_right_hand(struct Ape *, struct ApeFacePart *, struct Struct802B39C0_B0_child *);
static void func_80086434(int arg0, struct GMAModel *arg1);
static struct GMAShape *func_80086538(struct GMAShape *);
static void draw_baby_head(struct Ape *ape, struct ApeFacePart *arg1, struct Struct802B39C0_B0_child *unused2);
static void draw_head(struct Ape *, struct ApeFacePart *, struct Struct802B39C0_B0_child *);
static void draw_ear(struct Ape *ape, struct ApeFacePart *arg1, struct Struct802B39C0_B0_child *arg2);

static GXColor lbl_801C57E0[] =
{
    {128,   0,   0,   2},
    {  0,   0,   0,  20},
    {  0,   0,   0,  15},
    {  0,   0,   0,   0},
    {127, 255, 255, 255},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
};

static GXColor lbl_801C5800[] =
{
    {128,   0,   0,   3},
    {  0,   0,   0,  20},
    {  0,   0,   0,  15},
    {  0,   0,   0,   0},
    {127, 255, 255, 255},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
};

static GXColor lbl_801C5820[] =
{
    {128,   0,   0,   7},
    {  0,   0,   0,   2},
    {  0,   0,   0,  10},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,   4},
    {255, 255, 255, 246},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,   6},
    {  0,   0,   0,  10},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,   8},
    {255, 255, 255, 246},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,  10},
    {  0,   0,   0,  10},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,  12},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
    {127, 255, 255, 255},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
};

static GXColor lbl_801C5890[] =
{
    {128,   0,   0,   7},
    {  0,   0,   0,   2},
    {255, 255, 255, 246},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,   4},
    {  0,   0,   0,  10},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,   6},
    {255, 255, 255, 246},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,   8},
    {  0,   0,   0,  10},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,  10},
    {255, 255, 255, 246},
    {  0,   0,   0,   0},
    {128,   0,   0,   7},
    {  0,   0,   0,  12},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
    {127, 255, 255, 255},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
    {  0,   0,   0,   0},
};

#pragma force_active on
GXColor *lbl_801C5900[] =
{
    lbl_801C57E0,
    lbl_801C5800,
    lbl_801C5820,
    lbl_801C5890,
};
#pragma force_active reset

struct Struct80086794
{
    s32 unk0;
    float unk4;
};

static struct Struct80089A04 lbl_801C5A90[] =
{
    {
        "MDL_APE",
        {
            "obj_H_APE_KUBI",
            "obj_M_APE_KUBI",
            "obj_L_APE_KUBI",
            "obj_S_APE_KUBI",
        },
        5,
    },
    {
        "MDL_APE",
        {
            "obj_H_APE_TE_L",
            "obj_M_APE_MT_L",
            "obj_L_APE_MT_L",
            "obj_S_APE_MT_L",
        },
        10,
    },
    {
        "MDL_APE",
        {
            "obj_H_APE_TE_R",
            "obj_M_APE_MT_R",
            "obj_L_APE_MT_R",
            "obj_S_APE_MT_R",
        },
        15,
    },
    {
        "MDL_APE",
        {
            "obj_H_APE_KUBI_EAR_L",
            "obj_M_APE_KUBI_EAR_L",
            "obj_L_APE_KUBI_EAR_L",
            "obj_S_APE_KUBI_EAR_L",
        },
        5,
    },
    {
        "MDL_APE",
        {
            "obj_H_APE_KUBI_EAR_R",
            "obj_M_APE_KUBI_EAR_R",
            "obj_L_APE_KUBI_EAR_R",
            "obj_S_APE_KUBI_EAR_R",
        },
        5,
    },
};

static struct Struct80089A04 lbl_801C5D30[] =
{
    {
        "MDL_GAL",
        {
            "obj_H_GAL_KUBI",
            "obj_M_GAL_KUBI",
            "obj_L_GAL_KUBI",
            "obj_S_GAL_KUBI",
        },
        5,
    },
    {
        "MDL_GAL",
        {
            "obj_M_GAL_MT_L",
            "obj_M_GAL_MT_L",
            "obj_L_GAL_MT_L",
            "obj_S_GAL_MT_L",
        },
        10,
    },
    {
        "MDL_GAL",
        {
            "obj_M_GAL_MT_R",
            "obj_M_GAL_MT_R",
            "obj_L_GAL_MT_R",
            "obj_S_GAL_MT_R",
        },
        15,
    },
    {
        "MDL_GAL",
        {
            "obj_H_GAL_KUBI_EAR_L",
            "obj_M_GAL_KUBI_EAR_L",
            "obj_L_GAL_KUBI_EAR_L",
            "obj_S_GAL_KUBI_EAR_L",
        },
        5,
    },
    {
        "MDL_GAL",
        {
            "obj_H_GAL_KUBI_EAR_R",
            "obj_M_GAL_KUBI_EAR_R",
            "obj_L_GAL_KUBI_EAR_R",
            "obj_S_GAL_KUBI_EAR_R",
        },
        5,
    },
};

static struct Struct80089A04 lbl_801C5FD0[] =
{
    {
        "MDL_KID",
        {
            "obj_H_KID_KUBI",
            "obj_M_KID_KUBI",
            "obj_L_KID_KUBI",
            "obj_S_KID_KUBI",
        },
        5,
    },
    {
        "MDL_KID",
        {
            "obj_M_KID_MT_L",
            "obj_M_KID_MT_L",
            "obj_L_KID_MT_L",
            "obj_S_KID_MT_L",
        },
        10,
    },
    {
        "MDL_KID",
        {
            "obj_M_KID_MT_R",
            "obj_M_KID_MT_R",
            "obj_L_KID_MT_R",
            "obj_S_KID_MT_R",
        },
        15,
    },
    {
        "MDL_KID",
        {
            "obj_H_KID_KUBI_EAR_L",
            "obj_M_KID_KUBI_EAR_L",
            "obj_L_KID_KUBI_EAR_L",
            "obj_S_KID_KUBI_EAR_L",
        },
        5,
    },
    {
        "MDL_KID",
        {
            "obj_H_KID_KUBI_EAR_R",
            "obj_M_KID_KUBI_EAR_R",
            "obj_L_KID_KUBI_EAR_R",
            "obj_S_KID_KUBI_EAR_R",
        },
        5,
    },
};

static struct Struct80089A04 lbl_801C6270[] =
{
    {
        "MDL_GOR",
        {
            "obj_H_GOR_KUBI",
            "obj_M_GOR_KUBI",
            "obj_L_GOR_KUBI",
            "obj_S_GOR_KUBI",
        },
        5,
    },
    {
        "MDL_GOR",
        {
            "obj_M_GOR_MT_L",
            "obj_M_GOR_MT_L",
            "obj_L_GOR_MT_L",
            "obj_S_GOR_MT_L",
        },
        10,
    },
    {
        "MDL_GOR",
        {
            "obj_M_GOR_MT_R",
            "obj_M_GOR_MT_R",
            "obj_L_GOR_MT_R",
            "obj_S_GOR_MT_R",
        },
        15,
    },
    {
        "MDL_GOR",
        {
            "obj_H_GOR_KUBI_EAR_L",
            "obj_M_GOR_KUBI_EAR_L",
            "obj_L_GOR_KUBI_EAR_L",
            "obj_S_GOR_KUBI_EAR_L",
        },
        5,
    },
    {
        "MDL_GOR",
        {
            "obj_H_GOR_KUBI_EAR_R",
            "obj_M_GOR_KUBI_EAR_R",
            "obj_L_GOR_KUBI_EAR_R",
            "obj_S_GOR_KUBI_EAR_R",
        },
        5,
    },
};

struct Struct80089A04 *lbl_801C63B0[] =
{
    lbl_801C5A90,
    lbl_801C5D30,
    lbl_801C5FD0,
    lbl_801C6270,
};

s32 lbl_801C63C0[] = { 5, 5, 5, 5 };

#pragma force_active on
char *lbl_801C6420[] =
{
    "Smile Face",
    "Angry Face",
    "Left Hand Open",
    "Right Hand Open",
    "Afraid Face",
    "Dissut",
    "Open Mouth",
    NULL,
};

char *lbl_801C6470[] =
{
    "Face",
    "Hand Left",
    "Hand Right",
    "Ear Left",
    "Ear Right",
};
#pragma force_active reset

#pragma force_active on
u32 asdf[] =
{
    0,
    0xFFFFFFFF,
    0,
    0x00000001,
    0x00000002,
    0,
    0x00000004,
    0x00000005,
    0,
    0x00000007,
    0x00000008,
    0,
    0x0000000A,
    0x0000000B,
    0,
    0x0000000D,
    0x0000000E,
    0,
    0,
    0,
    0,
    0,
    0x40E00000,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0xC0400000,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0xC0A00000,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0x428C0000,
    0,
    0,
    0x42C80000,
    0,
    0,
    0x42F00000,
    0,
    0,
    0x428C0000,
    0,
    0,
    0x42C80000,
    0,
    0,
    0x42F00000,
    0,
    0,
    0x428C0000,
    0,
    0,
    0x42C80000,
    0,
    0,
    0x42F00000,
    0,
    0,
    0x428C0000,
    0,
    0,
    0x42C80000,
    0,
    0,
    0x42F00000,
    0,
    0,
    0,
    0,
    0,
    0x42C80000,
    0,
    0,
    0x42C80000,
    0,
};
#pragma force_active reset

static u32 lbl_801C6648[][16] =
{
    { 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08, 0x07, 0x06 },
    { 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08, 0x07, 0x06 },
    { 0x0E, 0x06, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x06, 0x0E },
    { 0x02, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x02 },
    { 0x12, 0x03, 0x09, 0x0A, 0x0B, 0x0C, 0x10, 0x11, 0x11, 0x10, 0x0C, 0x0B, 0x0A, 0x09, 0x03, 0x12 },
    { 0x10, 0x03, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0E, 0x0E, 0x0C, 0x0B, 0x0A, 0x09, 0x08, 0x03, 0x10 },
    { 0x10, 0x03, 0x06, 0x07, 0x08, 0x09, 0x0C, 0x0E, 0x0E, 0x0C, 0x09, 0x08, 0x07, 0x06, 0x03, 0x10 },
    { 0x03, 0x0B, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x17, 0x16, 0x15, 0x14, 0x13, 0x12, 0x0B, 0x03 },
};

static u32 lbl_801C6848[] =
{
    0x0F,
    0x10,
    0x11,
    0x12,
    0x13,
    0x14,
    0x15,
    0x16,
    0x17,
    0x18,
    0x19,
    0x1A,
    0x1B,
    0x1C,
    0x1D,
    0x1E,
    0x1F,
    0x20,
    0x21,
    0x22,
    0x23,
    0x24,
    0x25,
    0x26,
    0x27,
    0x28,
    0x29,
    0x2A,
    0x2B,
    0x2C,
    0x2D,
    0x2E,
    0x2F,
    0x30,
    0x31,
    0x32,
    0x33,
    0x34,
    0x35,
    0x36,
    0x37,
    0x38,
    0x39,
    0x3A,
    0x3B,
};

u16 lbl_801C68FC[] = { 3, 17, 19, 18 };
static s16 lbl_801C6904[] = { 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, -1 };

static GXColor lbl_801C692C[] =
{
    {255, 243, 220, 255},
    {170, 194, 237, 255},
    {255, 233, 127, 255},
    {178, 225, 157, 255},
};

static u32 lbl_801C693C[] =
{
    0x112,
    0x7A,
    0x5E,
    0xA1,
    0x46,
    0x37,
    0x46,
    0x23,
};

extern u8 lbl_80130AEC[];
extern u8 lbl_8013FBD4[];
extern u8 lbl_8015D1DC[];
extern u8 lbl_80153A54[];
extern u8 lbl_80162D44[];
extern u8 lbl_80169884[];
extern u8 lbl_8016FCDC[];
extern u8 lbl_8016DD94[];
extern u8 lbl_8012C234[];
extern u8 lbl_8013EB94[];
extern u8 lbl_8014D184[];
extern u8 lbl_80161684[];
extern u8 lbl_80168C54[];
extern u8 lbl_8016CEF4[];
extern u8 lbl_8012346C[];
extern u8 lbl_8013B65C[];
extern u8 lbl_8015A11C[];
extern u8 lbl_80146F9C[];
extern u8 lbl_801649B4[];
extern u8 lbl_801683CC[];
extern u8 lbl_8016F454[];
extern u8 lbl_8016BF84[];
extern u8 lbl_80118D0C[];
extern u8 lbl_80137A3C[];
extern u8 lbl_80157BBC[];
extern u8 lbl_80142D64[];
extern u8 lbl_8015F80C[];
extern u8 lbl_8016682C[];
extern u8 lbl_8016EBCC[];
extern u8 lbl_8016AEDC[];

static void *lbl_801C695C[] =
{
    lbl_80130AEC,
    lbl_8013FBD4,
    lbl_8015D1DC,
    lbl_80153A54,
    lbl_80162D44,
    lbl_80169884,
    lbl_8016FCDC,
    lbl_8016DD94,
};

static u32 lbl_801C697C[] =
{
    0x00000001,
    0x00000003,
    0x00000004,
    0x00000011,
    0x0000001E,
    0x00000023,
    0x00000027,
    0x00000016,
};

static u32 lbl_801C699C[] =
{
    0x000000B3,
    0x00000028,
    0xFFFFFFFF,
    0x00000102,
    0x00000038,
    0x0000001E,
    0xFFFFFFFF,
    0x00000024,
};

static void *lbl_801C69BC[] =
{
    lbl_8012C234,
    lbl_8013EB94,
    NULL,
    lbl_8014D184,
    lbl_80161684,
    lbl_80168C54,
    NULL,
    lbl_8016CEF4,
};

static u32 lbl_801C69DC[] =
{
    0,
    0x00000002,
    0xFFFFFFFF,
    0x00000010,
    0x0000001D,
    0x00000022,
    0xFFFFFFFF,
    0x00000015,
};

u32 lbl_801C69FC[] =
{
    0x0000015D,
    0x00000083,
    0x00000078,
    0x000000F1,
    0x0000004B,
    0x00000015,
    0x00000015,
    0x00000026,
};

void *lbl_801C6A1C[] =
{
    lbl_8012346C,
    lbl_8013B65C,
    lbl_8015A11C,
    lbl_80146F9C,
    lbl_801649B4,
    lbl_801683CC,
    lbl_8016F454,
    lbl_8016BF84,
};

u32 lbl_801C6A3C[] =
{
    0x00000008,
    0x0000000A,
    0x0000000C,
    0x0000000F,
    0x0000001C,
    0x00000021,
    0x00000026,
    0x00000014,
};

u32 lbl_801C6A5C[] =
{
    0x0000019C,
    0x00000094,
    0x0000005C,
    0x000000A3,
    0x0000004B,
    0x00000044,
    0x00000015,
    0x00000029,
};

void *lbl_801C6A7C[] =
{
    lbl_80118D0C,
    lbl_80137A3C,
    lbl_80157BBC,
    lbl_80142D64,
    lbl_8015F80C,
    lbl_8016682C,
    lbl_8016EBCC,
    lbl_8016AEDC,
};

u32 lbl_801C6A9C[] =
{
    0x00000007,
    0x00000009,
    0x0000000B,
    0x0000000D,
    0x0000001A,
    0x0000001F,
    0x00000024,
    0x00000012,
};

u32 lbl_801C6ABC[] =
{
    14,
    6,
    0,
    1,
    2,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
};

u32 lbl_801C6AFC[] =
{
    6,
    6,
    8,
    9,
    10,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
};

u32 lbl_801C6B3C[] =
{
    2,
    10,
    11,
    12,
    16,
    17,
    18,
    18,
    19,
    19,
    19,
    19,
    19,
    19,
    19,
    19,
};

u32 *lbl_801C6B7C[] =
{
    NULL,
    lbl_801C6AFC,
    lbl_801C6ABC,
    lbl_801C6B3C,
};

struct ApeFacePart lbl_801C6BA4[] =
{
    {
        60,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_H_APE_KUBI",
    },
    {
        6,
        5,
        {  0,   0,   0},
        draw_eye,
        "H_APE_EYE",
    },
    {
        14,
        5,
        {  0,   0,   0},
        draw_aiai_hair,
        "H_APE_HAIR",
    },
    {
        62,
        10,
        {  0,   0,   0},
        draw_left_hand,
        "obj_H_APE_TE_L",
    },
    {
        65,
        15,
        {  0,   0,   0},
        draw_right_hand,
        "obj_H_APE_TE_R",
    },
    {
        2,
        5,
        {-0.029999999, 0.12, 0.1},
        draw_ear,
        "obj_H_APE_KUBI_EAR_L",
    },
    {
        4,
        5,
        {-0.029999999, -0.12, 0.1},
        draw_ear,
        "obj_H_APE_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C6C9C[] =
{
    {
        60,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_M_APE_KUBI",
    },
    {
        6,
        5,
        {  0,   0,   0},
        draw_eye,
        "M_APE_EYE",
    },
    {
        14,
        5,
        {  0,   0,   0},
        draw_aiai_hair,
        "M_APE_HAIR",
    },
    {
        62,
        10,
        {  0,   0,   0},
        draw_left_hand,
        "obj_M_APE_MT_L",
    },
    {
        65,
        15,
        {  0,   0,   0},
        draw_right_hand,
        "obj_M_APE_MT_R",
    },
    {
        3,
        5,
        {-0.029999999, 0.12, 0.1},
        draw_ear,
        "obj_M_APE_KUBI_EAR_L",
    },
    {
        5,
        5,
        {-0.029999999, -0.12, 0.1},
        draw_ear,
        "obj_M_APE_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C6D88[] =
{
    {
        19,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_L_APE_KUBI",
    },
    {
        18,
        5,
        {  0,   0,   0},
        draw_eye,
        "L_APE_EYE",
    },
    {
        20,
        10,
        {  0,   0,   0},
        NULL,
        "obj_L_APE_MT_L",
    },
    {
        22,
        15,
        {  0,   0,   0},
        NULL,
        "obj_L_APE_MT_R",
    },
    {
        1,
        5,
        {-0.029999999, 0.12, 0.1},
        draw_ear,
        "obj_L_APE_KUBI_EAR_L",
    },
    {
        2,
        5,
        {-0.029999999, -0.12, 0.1},
        draw_ear,
        "obj_L_APE_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C6E48[] =
{
    {
        7,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_S_APE_KUBI",
    },
    {
        13,
        10,
        {  0,   0,   0},
        NULL,
        "obj_S_APE_MT_L",
    },
    {
        15,
        15,
        {  0,   0,   0},
        NULL,
        "obj_S_APE_MT_R",
    },
    {
        5,
        5,
        {-0.029999999, 0.12, 0.1},
        draw_ear,
        "obj_S_APE_KUBI_EAR_L",
    },
    {
        6,
        5,
        {-0.029999999, -0.12, 0.1},
        draw_ear,
        "obj_S_APE_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C6EF4[] =
{
    {
        15,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_H_GAL_KUBI",
    },
    {
        6,
        5,
        {  0,   0,   0},
        draw_eye,
        "H_GAL_EYE",
    },
    {
        17,
        10,
        {  0,   0,   0},
        draw_left_hand,
        "obj_M_GAL_MT_L",
    },
    {
        20,
        15,
        {  0,   0,   0},
        draw_right_hand,
        "obj_M_GAL_MT_R",
    },
    {
        16,
        5,
        {-0.029999999, 0.12, 0.1},
        draw_ear,
        "obj_H_GAL_KUBI_EAR_L",
    },
    {
        18,
        5,
        {-0.029999999, -0.12, 0.1},
        draw_ear,
        "obj_H_GAL_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C6FC0[] =
{
    {
        15,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_M_GAL_KUBI",
    },
    {
        6,
        5,
        {  0,   0,   0},
        draw_eye,
        "M_GAL_EYE",
    },
    {
        17,
        10,
        {  0,   0,   0},
        draw_left_hand,
        "obj_M_GAL_MT_L",
    },
    {
        20,
        15,
        {  0,   0,   0},
        draw_right_hand,
        "obj_M_GAL_MT_R",
    },
    {
        4,
        5,
        {-0.029999999, 0.12, 0.1},
        draw_ear,
        "obj_M_GAL_KUBI_EAR_L",
    },
    {
        5,
        5,
        {-0.029999999, -0.12, 0.1},
        draw_ear,
        "obj_M_GAL_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C708C[] =
{
    {
        18,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_L_GAL_KUBI",
    },
    {
        16,
        5,
        {  0,   0,   0},
        draw_eye,
        "L_GAL_EYE",
    },
    {
        19,
        10,
        {  0,   0,   0},
        NULL,
        "obj_L_GAL_MT_L",
    },
    {
        22,
        15,
        {  0,   0,   0},
        NULL,
        "obj_L_GAL_MT_R",
    },
    {
        1,
        5,
        {-0.029999999, 0.12, 0.1},
        draw_ear,
        "obj_L_GAL_KUBI_EAR_L",
    },
    {
        2,
        5,
        {-0.029999999, -0.12, 0.1},
        draw_ear,
        "obj_L_GAL_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C714C[] =
{
    {
        7,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_S_GAL_KUBI",
    },
    {
        13,
        10,
        {  0,   0,   0},
        NULL,
        "obj_S_GAL_MT_L",
    },
    {
        15,
        15,
        {  0,   0,   0},
        NULL,
        "obj_S_GAL_MT_R",
    },
    {
        5,
        5,
        {-0.029999999, 0.12, 0.1},
        draw_ear,
        "obj_S_GAL_KUBI_EAR_L",
    },
    {
        6,
        5,
        {-0.029999999, -0.12, 0.1},
        draw_ear,
        "obj_S_GAL_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C71F8[] =
{
    {
        15,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_H_KID_KUBI",
    },
    {
        14,
        5,
        {  0,   0,   0},
        draw_eye,
        "H_KID_EYE",
    },
    {
        17,
        10,
        {  0,   0,   0},
        draw_left_hand,
        "obj_M_KID_MT_L",
    },
    {
        20,
        15,
        {  0,   0,   0},
        draw_right_hand,
        "obj_M_KID_MT_R",
    },
    {
        10,
        5,
        {-0.0020000001, 0.090000004, 0.078000002},
        draw_ear,
        "obj_H_KID_KUBI_EAR_L",
    },
    {
        12,
        5,
        {-0.0020000001, -0.090000004, 0.078000002},
        draw_ear,
        "obj_H_KID_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C72C4[] =
{
    {
        15,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_M_KID_KUBI",
    },
    {
        14,
        5,
        {  0,   0,   0},
        draw_eye,
        "M_KID_EYE",
    },
    {
        17,
        10,
        {  0,   0,   0},
        draw_left_hand,
        "obj_M_KID_MT_L",
    },
    {
        20,
        15,
        {  0,   0,   0},
        draw_right_hand,
        "obj_M_KID_MT_R",
    },
    {
        11,
        5,
        {-0.0020000001, 0.090000004, 0.078000002},
        draw_ear,
        "obj_M_KID_KUBI_EAR_L",
    },
    {
        13,
        5,
        {-0.0020000001, -0.090000004, 0.078000002},
        draw_ear,
        "obj_M_KID_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C73A0[] =
{
    {
        19,
        5,
        {  0,   0,   0},
        draw_baby_head,
        "obj_L_KID_KUBI",
    },
    {
        26,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_L_KID_FACE",
    },
    {
        16,
        5,
        {  0,   0,   0},
        draw_eye,
        "L_KID_EYE",
    },
    {
        20,
        10,
        {  0,   0,   0},
        draw_baby_hand,
        "obj_L_KID_MT_L",
    },
    {
        23,
        15,
        {  0,   0,   0},
        draw_baby_hand,
        "obj_L_KID_MT_R",
    },
    {
        1,
        5,
        {-0.0020000001, 0.090000004, 0.078000002},
        draw_ear,
        "obj_L_KID_KUBI_EAR_L",
    },
    {
        2,
        5,
        {-0.0020000001, -0.090000004, 0.078000002},
        draw_ear,
        "obj_L_KID_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C7480[] =
{
    {
        11,
        5,
        {  0,   0,   0},
        NULL,
        "obj_S_KID_KUBI",
    },
    {
        13,
        10,
        {  0,   0,   0},
        NULL,
        "obj_S_KID_MT_L",
    },
    {
        15,
        15,
        {  0,   0,   0},
        NULL,
        "obj_S_KID_MT_R",
    },
    {
        5,
        5,
        {-0.0020000001, 0.090000004, 0.078000002},
        draw_ear,
        "obj_S_KID_KUBI_EAR_L",
    },
    {
        10,
        5,
        {-0.0020000001, -0.090000004, 0.078000002},
        draw_ear,
        "obj_S_KID_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C752C[] =
{
    {
        5,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_H_GOR_KUBI",
    },
    {
        2,
        5,
        {  0,   0,   0},
        draw_eye,
        "H_GOR_EYE",
    },
    {
        6,
        10,
        {  0,   0,   0},
        draw_left_hand,
        "obj_M_GOR_MT_L",
    },
    {
        7,
        15,
        {  0,   0,   0},
        draw_right_hand,
        "obj_M_GOR_MT_R",
    },
    {
        0,
        5,
        {  0, 0.19, 0.15000001},
        draw_ear,
        "obj_H_GOR_KUBI_EAR_L",
    },
    {
        1,
        5,
        {  0, -0.19, 0.15000001},
        draw_ear,
        "obj_H_GOR_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C75F8[] =
{
    {
        5,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_M_GOR_KUBI",
    },
    {
        2,
        5,
        {  0,   0,   0},
        draw_eye,
        "M_GOR_EYE",
    },
    {
        6,
        10,
        {  0,   0,   0},
        draw_left_hand,
        "obj_M_GOR_MT_L",
    },
    {
        7,
        15,
        {  0,   0,   0},
        draw_right_hand,
        "obj_M_GOR_MT_R",
    },
    {
        25,
        5,
        {  0, 0.19, 0.15000001},
        draw_ear,
        "obj_M_GOR_KUBI_EAR_L",
    },
    {
        26,
        5,
        {  0, -0.19, 0.15000001},
        draw_ear,
        "obj_M_GOR_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C76C4[] =
{
    {
        4,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_L_GOR_KUBI",
    },
    {
        3,
        5,
        {  0,   0,   0},
        draw_eye,
        "L_GOR_EYE",
    },
    {
        7,
        10,
        {  0,   0,   0},
        NULL,
        "obj_L_GOR_MT_L",
    },
    {
        9,
        15,
        {  0,   0,   0},
        NULL,
        "obj_L_GOR_MT_R",
    },
    {
        1,
        5,
        {  0, 0.19, 0.15000001},
        draw_ear,
        "obj_L_GOR_KUBI_EAR_L",
    },
    {
        2,
        5,
        {  0, -0.19, 0.15000001},
        draw_ear,
        "obj_L_GOR_KUBI_EAR_R",
    },
};

struct ApeFacePart lbl_801C7784[] =
{
    {
        17,
        5,
        {  0,   0,   0},
        draw_head,
        "obj_S_GOR_KUBI",
    },
    {
        24,
        10,
        {  0,   0,   0},
        NULL,
        "obj_S_GOR_MT_L",
    },
    {
        26,
        15,
        {  0,   0,   0},
        NULL,
        "obj_S_GOR_MT_R",
    },
    {
        6,
        5,
        {  0, 0.19, 0.15000001},
        draw_ear,
        "obj_S_GOR_KUBI_EAR_L",
    },
    {
        16,
        5,
        {  0, -0.19, 0.15000001},
        draw_ear,
        "obj_S_GOR_KUBI_EAR_R",
    },
};

struct ApeGfxFileInfo apeGfxFileInfo[] =
{
    {
        "boy_h",
        {lbl_801C6BA4,              lbl_801C6C9C,              NULL, NULL},
        {ARRAY_COUNT(lbl_801C6BA4), ARRAY_COUNT(lbl_801C6C9C), 0,    0},
        {1, 0},
    },
    {
        "boy_l",
        {lbl_801C6D88,              lbl_801C6E48,              NULL, NULL},
        {ARRAY_COUNT(lbl_801C6D88), ARRAY_COUNT(lbl_801C6E48), 0,    0},
        {0, 4},
    },
    {
        "gal_h",
        {lbl_801C6EF4,              lbl_801C6FC0,              NULL, NULL},
        {ARRAY_COUNT(lbl_801C6EF4), ARRAY_COUNT(lbl_801C6FC0), 0,    0},
        {3, 2},
    },
    {
        "gal_l",
        {lbl_801C708C,              lbl_801C714C,              NULL, NULL},
        {ARRAY_COUNT(lbl_801C708C), ARRAY_COUNT(lbl_801C714C), 0,    0},
        {0, 4},
    },
    {
        "kid_h",
        {lbl_801C71F8,              lbl_801C72C4,              NULL, NULL},
        {ARRAY_COUNT(lbl_801C71F8), ARRAY_COUNT(lbl_801C72C4), 0,    0},
        {9, 8},
    },
    {
        "kid_l",
        {lbl_801C73A0,              lbl_801C7480,              NULL, NULL},
        {ARRAY_COUNT(lbl_801C73A0), ARRAY_COUNT(lbl_801C7480), 0,    0},
        {0, 4},
    },
    {
        "gor_h",
        {lbl_801C752C,              lbl_801C75F8,              NULL, NULL},
        {ARRAY_COUNT(lbl_801C752C), ARRAY_COUNT(lbl_801C75F8), 0,    0},
        {4, 24},
    },
    {
        "gor_l",
        {lbl_801C76C4,              lbl_801C7784,              NULL, NULL},
        {ARRAY_COUNT(lbl_801C76C4), ARRAY_COUNT(lbl_801C7784), 0,    0},
        {0, 5},
    },
};

void func_80085C0C(int arg0)
{
    struct Color3f ambient;

    if (lbl_802F2060 == 0)
    {
        get_curr_light_group_ambient(&ambient);
        switch (arg0)
        {
        case 0:
            avdisp_set_ambient(ambient.r, ambient.g, ambient.b);
            return;
        case 1:
            nl2ngc_set_ambient(1.35f * ambient.r, 1.35f * ambient.g, 1.35f * ambient.b);
            break;
        }
    }
}

static void draw_aiai_hair(struct Ape *ape, struct ApeFacePart *unused1, struct Struct802B39C0_B0_child *unused2)
{
    int var_r6;
    int r0;
    struct GMAModel *model;

    var_r6 = ape->unk90 >> 1;
    r0 = var_r6 + (ape->charaId << 1);
    if (ape->flags & 0x8000)
    {
        int r4;

        if (!(gamePauseStatus & 0xA))
            lbl_802B3770[ape->unk70]++;
        r4 = lbl_802B3770[ape->unk70] % 45;
        var_r6 = r4;
        if (r4 == 44)
            ape->flags &= 0xFFFF7FFF;
    }
    else
    {
        if (ape->unk24 != 0)
            ape->flags |= 0x8000;
        var_r6 = 0;
        lbl_802B3770[ape->unk70] = 0;
    }
    model = charaGMAs[r0]->modelEntries[lbl_801C6848[var_r6]].model;
    avdisp_draw_model_unculled_sort_none(model);
}

void func_80085DB0(struct Ape *ape)
{
    if (!(gamePauseStatus & 0xA) && (ape->flags & 0x80))
    {
        lbl_802B37B0[ape->unk70]++;
        return;
    }
    if (!(advDemoInfo.flags & 0x100) && (rand() & 0xFF) > 0xFA)
        ape->flags |= 0x80;
}

static void draw_eye(struct Ape *ape, struct ApeFacePart *unused1, struct Struct802B39C0_B0_child *unused2)
{
    s32 var_r8;
    int var_r7;
    struct GMAModel *model;
    int r0;

    r0 = (ape->unk90 >> 1) + (ape->charaId << 1);
    if (!(ape->flags & 0x10000))
    {
        if (ape->flags & 0x80)
        {
            int temp_r4 = lbl_802B37B0[ape->unk70] % 64;
            var_r8 = temp_r4;
            if (temp_r4 > 15)
            {
                if (var_r8 > 60)
                    ape->flags &= 0xFFFFFF7F;
                var_r8 = 0;
            }
        }
        else
        {
            if (advDemoInfo.flags & 0x100)
            {
                if (ape->charaId == 2)
                    var_r7 = 0xB4;
                else
                    var_r7 = 0xF0;
                if (advDemoInfo.unk8 % var_r7 == ape->charaId * 80)
                    ape->flags |= 0x80;
            }
            lbl_802B37B0[ape->unk70] = 0;
            var_r8 = 0;
        }
        model = charaGMAs[r0]->modelEntries[lbl_801C6648[((ape->unk90 >> 1) * 4 + ape->charaId)][var_r8]].model;
        avdisp_draw_model_unculled_sort_none(model);
    }
}

static inline void func_80085F94_sub(struct GMAModel *temp_r31, int temp_r10)
{
    struct GMATevLayer *var_r7;
    int var_r6;
    u16 *arr;

    arr = lbl_801C68FC;
    var_r7 = temp_r31->tevLayers;
    for (var_r6 = 0; var_r6 < temp_r31->tevLayerCount; var_r6++)
    {
        if (arr[0] != (u16) var_r7->texIndex)
        {
            if (temp_r10 != 0)
            {
                var_r7->texObj = &lbl_802B47E0[2][arr[temp_r10]];
                var_r7->flags |= 0x10000;
            }
            else
            {
                var_r7->texObj = &temp_r31->texObjs[var_r6];
                var_r7->flags &= 0xFFFEFFFF;
            }
            var_r7->texObj = &lbl_802B47E0[2][arr[1]];
        }
        var_r7++;
    }
}

static void draw_baby_hand(struct Ape *ape, struct ApeFacePart *arg1, struct Struct802B39C0_B0_child *unused2)
{
    u8 unused3[8];
    struct Color3f sp18;
    u8 unused4[4];
    struct GMAModel *temp_r31;

    temp_r31 = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[arg1->modelId].model;
    if (lbl_802F2060 == 0)
    {
        get_curr_light_group_ambient(&sp18);
        avdisp_set_ambient(sp18.r, sp18.g, sp18.b);
    }
    func_80085F94_sub(temp_r31, ape->colorId);
    avdisp_draw_model_unculled_sort_none(temp_r31);
    if (lbl_802F2060 == 0)
        apply_curr_light_group_ambient();
}

static void draw_left_hand(struct Ape *ape, struct ApeFacePart *arg1, struct Struct802B39C0_B0_child *unused2)
{
    u8 unused[8];
    struct GMAModel *model = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[arg1->modelId].model;
    struct Struct8003699C_child_sub *temp_r29 = &ape->unk0->unk4114;
    struct JointBoneThing *joints = temp_r29->unk38;
    s16 *var_r4;
    Mtx **var_r5;

    if (!(gamePauseStatus & 0xA) && !(ape->flags & 8))
    {
        mathutil_mtxA_push();
        func_80036510(temp_r29);
        mathutil_mtxA_pop();
    }

    var_r4 = lbl_801C6904;
    var_r5 = u_animTransformMatrices;
    while (*var_r4 != -1)
    {
        *var_r5 = &joints[*var_r4].transformMtx;
        var_r4++;
        var_r5++;
    }

    if (ape->charaId == 2)
        func_80086434(ape->colorId, model);
    avdisp_draw_model_unculled_sort_none(model);
}

static void draw_right_hand(struct Ape *ape, struct ApeFacePart *arg1, struct Struct802B39C0_B0_child *unused2)
{
    u8 unused[8];
    struct GMAModel *model = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[arg1->modelId].model;
    struct Struct8003699C_child_sub *temp_r29 = &ape->unk0->unk84;
    struct JointBoneThing *joints = temp_r29->unk38;
    s16 *var_r4;
    Mtx **var_r5;

    if (!(gamePauseStatus & 0xA) && !(ape->flags & 8))
    {
        mathutil_mtxA_push();
        func_80036510(temp_r29);
        mathutil_mtxA_pop();
    }

    var_r4 = lbl_801C6904;
    var_r5 = u_animTransformMatrices;
    while (*var_r4 != -1)
    {
        *var_r5 = &joints[*var_r4].transformMtx;
        var_r4++;
        var_r5++;
    }

    if (ape->charaId == 2)
        func_80086434(ape->colorId, model);
    avdisp_draw_model_unculled_sort_none(model);
}

static struct GMAShape *func_800862F4(struct GMAModel *model)
{
    int temp_r4;
    struct GMAShape *shape;
    u8 *ptr;
    int i;

    temp_r4 = model->opaqueShapeCount;
    shape = (struct GMAShape *)((u8 *)model + model->headerSize);
    while (temp_r4 > 0)
    {
        if (shape->tevLayerCount == 0)
            return shape;
        ptr = shape->dispLists;
        for (i = 0; i < 2; i++)
        {
            if (shape->dispListFlags & (1 << i))
                ptr += shape->dispListSizes[i];
        }
        if ((shape->dispListFlags & 0xC) != 0)
        {
            struct GMAExtraDispLists *extra = (void *)ptr;

            ptr += 0x20;
            ptr += extra->dispListSizes[0];
            ptr += extra->dispListSizes[1];
        }
        shape = (struct GMAShape *)ptr;
        temp_r4--;
    }
    return NULL;
}

static struct GMAShape *func_8008638C(struct GMAModel *model)
{
    int temp_r4;
    struct GMAShape *shape;
    u8 *ptr;
    int i;
    int r7 = 0;

    temp_r4 = model->opaqueShapeCount;
    shape = (struct GMAShape *)((u8 *)model + model->headerSize);
    while (temp_r4 > 0)
    {
        if (shape->tevLayerCount == 0)
        {
            if (r7)
                return shape;
            r7 = 1;
        }
        ptr = shape->dispLists;
        for (i = 0; i < 2; i++)
        {
            if (shape->dispListFlags & (1 << i))
                ptr += shape->dispListSizes[i];
        }
        if ((shape->dispListFlags & 0xC) != 0)
        {
            struct GMAExtraDispLists *extra = (void *)ptr;

            ptr += 0x20;
            ptr += extra->dispListSizes[0];
            ptr += extra->dispListSizes[1];
        }
        shape = (struct GMAShape *)ptr;
        temp_r4--;
    }
    return NULL;
}

static struct GMAShape *func_80086434_sub1(struct GMAModel *model)
{
    int i;
    struct GMAShape *shape;

    shape = (struct GMAShape *)((u8 *)model + model->headerSize);
    for (i = 0; i < model->opaqueShapeCount; i++)
    {
        if (shape->tevLayerCount == 0)
            return shape;
        shape = func_80086538(shape);
    }
    return NULL;
}

static struct GMAShape *func_80086434_sub2(struct GMAModel *model)
{
    int i;
    int var_r30_2;
    struct GMAShape *shape;

    var_r30_2 = 0;
    shape = (struct GMAShape *)((u8 *)model + model->headerSize);
    for (i = 0; i < model->opaqueShapeCount; i++)
    {
        if (shape->tevLayerCount == 0)
        {
            if (var_r30_2)
                return shape;
            var_r30_2 = 1;
        }
        shape = func_80086538(shape);
    }
    return NULL;
}

static void func_80086434(int colorId, struct GMAModel *model)
{
    struct GMAShape *shape;

    if ((shape = func_80086434_sub1(model)) == NULL)
        return;
    shape->materialColor = lbl_801C692C[colorId];
    shape->ambientColor = lbl_801C692C[colorId];

    if ((shape = func_80086434_sub2(model)) == NULL)
        return;
    shape->materialColor = lbl_801C692C[colorId];
    shape->ambientColor = lbl_801C692C[colorId];
}

static void func_800865A4_sub(int colorId, struct GMAModel *model)
{
    struct GMAShape *shape;

    if ((shape = func_800862F4(model)) == NULL)
        return;
    shape->materialColor = lbl_801C692C[colorId];
    shape->ambientColor = lbl_801C692C[colorId];

    if ((shape = func_8008638C(model)) == NULL)
        return;
    shape->materialColor = lbl_801C692C[colorId];
    shape->ambientColor = lbl_801C692C[colorId];
}

static struct GMAShape *func_80086538(struct GMAShape *shape)
{
    int i;
    u8 *ptr = shape->dispLists;

    for (i = 0; i < 2; i++)
    {
        if (shape->dispListFlags & (1 << i))
            ptr += shape->dispListSizes[i];
    }
    if ((shape->dispListFlags & 0xC) != 0)
    {
        struct GMAExtraDispLists *extra = (void *)ptr;

        ptr += 0x20;
        ptr += extra->dispListSizes[0];
        ptr += extra->dispListSizes[1];
    }
    return (struct GMAShape *)ptr;
}

static void draw_baby_head(struct Ape *ape, struct ApeFacePart *arg1, struct Struct802B39C0_B0_child *unused2)
{
    u8 unused3[8];
    struct Color3f sp14;
    struct GMAModel *model;

    model = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[arg1->modelId].model;
    if (lbl_802F2060 == 0)
    {
        get_curr_light_group_ambient(&sp14);
        avdisp_set_ambient(sp14.r, sp14.g, sp14.b);
    }
    func_800865A4_sub(ape->colorId, model);
    avdisp_draw_model_unculled_sort_none(model);
    if (lbl_802F2060 == 0)
        apply_curr_light_group_ambient();
}

struct Struct8008669C_sub
{
    Vec unk0;
    Vec unkC;
};

struct Struct8008669C
{
    Vec unk0;
    Vec unkC;
    struct Struct8008669C_sub unk18[3];
    s16 unk60[4];
};

static void func_8008669C(u32 *arg0, struct Struct8008669C *arg1, int arg2, float arg8)
{
    int i;
    int j;
    u32 *temp_r21;
    Vec sp2C;
    Vec sp20;
    u32 r29, r28, r27;
    u32 x, y, z;

    for (i = 0; i < arg2; i++)
    {
        mathutil_scale_ray(&arg1[i].unk0, &arg1[i].unkC, &sp2C, arg8);
        r29 = *(u32 *)&sp2C.x | 1;
        r28 = *(u32 *)&sp2C.y;
        r27 = *(u32 *)&sp2C.z;
        for (j = 0; j < 3; j++)
        {
            s16 r0;

            if (arg1[i].unk60[j] == -1)
                break;
            r0 = arg1[i].unk60[j] >> 2;
            temp_r21 = &arg0[r0];
            temp_r21[0] = r29;
            temp_r21[1] = r28;
            temp_r21[2] = r27;
            mathutil_scale_ray(&arg1[i].unk18[j].unk0, &arg1[i].unk18[j].unkC, &sp20, arg8);
            x = *(u32 *)&sp20.x | 1;
            y = *(u32 *)&sp20.y;
            z = *(u32 *)&sp20.z;
            temp_r21[3] = x;
            temp_r21[4] = y;
            temp_r21[5] = z;
        }
    }
}

float  force_lbl_802F54A4() { return 182.04444885253906f; };
float  force_lbl_802F54A8() { return 0.0f; }
float  force_lbl_802F54AC() { return 0.0625f; }
double force_lbl_802F54B0() { return 4503601774854144.0; }
float  force_lbl_802F54B8() { return 1.0f; }
float  force_lbl_802F54BC() { return 255.0f; }
double force_lbl_802F54C0() { return 4503599627370496.0; }
float  force_lbl_802F54C8() { return 0.1f; }

static void func_80086794_sub2(int temp_r27, struct Ape *ape)
{
    u32 *temp_r28_4 = lbl_801C6B7C[ape->charaId];

    if (temp_r28_4 != NULL)
    {
        lbl_802B37B0[ape->unk70] = 0;
        ape->flags |= 0x10000;
        func_80085C0C(0);
        avdisp_draw_model_unculled_sort_none(charaGMAs[ape->charaId << 1]->modelEntries[temp_r28_4[temp_r27]].model);
        if (lbl_802F2060 == 0)
            apply_curr_light_group_ambient();
    }
}

static void draw_head(struct Ape *ape, struct ApeFacePart *arg1, struct Struct802B39C0_B0_child *arg2)
{
    struct NlModel *nlModel;
    struct GMAModel *gmaModel;
    int var_r29;
    int var_r28;
    int temp_r27_3;
    int temp_r0;
    void *r4;
    int r5;
    float one = 1.0f;
    float f0;
    struct Color3f sp30;
    struct Color3f sp24;
    u8 unused[4];
    struct Color3f sp14;

    var_r28 = 0;
    var_r29 = ape->charaId;
    ape->flags &= 0xFFFEFFFF;
    if (arg2 != NULL && arg2->unk4 != 0.0f)
    {
        if (ape->unk90 >= 2)
            var_r29 += 4;
        switch (arg2->unk0)
        {
        case 0:
            if (var_r29 == 1 || var_r29 == 3)
                var_r28 = 1;
            // fall through
        case 6:
            if (var_r29 == 2)
            {
                gmaModel = charaGMAs[(ape->unk90 >> 1) + (var_r29 << 1)]->modelEntries[arg1->modelId].model;
                if (lbl_802F2060 == 0)
                {
                    get_curr_light_group_ambient(&sp30);
                    avdisp_set_ambient(sp30.r, sp30.g, sp30.b);
                }
                func_800865A4_sub(ape->colorId, gmaModel);
                avdisp_draw_model_unculled_sort_none(gmaModel);
                func_80086794_sub2(arg2->unk4, ape);
                if (lbl_802F2060 == 0)
                    apply_curr_light_group_ambient();
                return;
            }
            temp_r0 = lbl_801C69DC[var_r29];
            if (temp_r0 == -1)
                goto block_50;
            r5 = lbl_801C699C[var_r29];
            r4 = lbl_801C69BC[var_r29];
            nlModel = apeFaceObj->models[temp_r0];
            break;
        case 5:
            temp_r0 = lbl_801C6A9C[var_r29];
            if (temp_r0 == -1)
                goto block_50;
            r5 = lbl_801C6A5C[var_r29];
            r4 = lbl_801C6A7C[var_r29];
            nlModel = apeFaceObj->models[temp_r0];
            break;
        case 1:
            temp_r0 = lbl_801C6A3C[var_r29];
            if (temp_r0 == -1)
                goto block_50;
            r5 = lbl_801C69FC[var_r29];
            r4 = lbl_801C6A1C[var_r29];
            nlModel = apeFaceObj->models[temp_r0];
            break;
        default:
            temp_r0 = lbl_801C697C[var_r29];
            if (temp_r0 == -1)
                goto block_50;
            r5 = lbl_801C693C[var_r29];
            r4 = lbl_801C695C[var_r29];
            nlModel = apeFaceObj->models[temp_r0];
            break;
        }
        f0 = arg2->unk4;
        f0 *= 0.0625f;
        func_8008669C((void *)nlModel, r4, r5, 1.0f - f0 * one);
        mathutil_mtxA_push();
        mathutil_mtxA_scale_s(0.1f);
        if (lbl_802F2060 == 0)
        {
            get_curr_light_group_ambient(&sp24);
            nl2ngc_set_ambient(1.35f * sp24.r, 1.35f * sp24.g, 1.35f * sp24.b);
        }
        if (var_r29 == 2 && ape->unk90 < 2)
        {
            struct NlMesh_sub *sub;
            struct NlMesh *var_r5;
            GXColor *temp_r6;

            var_r5 = (struct NlMesh *)nlModel->meshStart;
            temp_r6 = &lbl_801C692C[ape->colorId];
            while (var_r5->flags != 0)
            {
                if ((s32) var_r5->tplTexIdx == -1)
                {
                    sub = &var_r5->sub2C;
                    if (sub->materialColorA >= 1.0f)
                    {
                        sub->materialColorR = (temp_r6->r / 255.0f);
                        sub->materialColorG = (temp_r6->g / 255.0f);
                        sub->materialColorB = (temp_r6->b / 255.0f);
                    }
                }
                var_r5 = (struct NlMesh *)((u8 *)var_r5->dispListStart + var_r5->dispListSize);
            }
        }
        nl2ngc_draw_model_sort_translucent(nlModel);
        mathutil_mtxA_pop();
        u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
        if (var_r28 != 0)
            func_80086794_sub2(arg2->unk4, ape);
        if (lbl_802F2060 == 0)
            apply_curr_light_group_ambient();
        return;
    }

block_50:
    temp_r27_3 = (ape->unk90 >> 1) + (ape->charaId << 1);
    gmaModel = charaGMAs[temp_r27_3]->modelEntries[arg1->modelId].model;
    if (lbl_802F2060 == 0)
    {
        get_curr_light_group_ambient(&sp14);
        avdisp_set_ambient(sp14.r, sp14.g, sp14.b);
    }
    if (temp_r27_3 == 4)
        func_800865A4_sub(ape->colorId, gmaModel);
    avdisp_draw_model_unculled_sort_none(gmaModel);
    if (lbl_802F2060 == 0)
        apply_curr_light_group_ambient();
}

#pragma force_active on
void func_80086D20(struct Ape *ape, int arg1, int arg2)
{
    int temp_r0;
    int temp_r29;
    struct NlModel *nlModel;
    void *r4;
    int r5;

    temp_r29 = ape->charaId;
    switch (arg1)
    {
    case 0:
    case 6:
        if (temp_r29 == 2)
        {
            avdisp_draw_model_unculled_sort_none(charaGMAs[temp_r29 << 1]->modelEntries[15].model);
            func_80086794_sub2(arg2, ape);
        }
        temp_r0 = lbl_801C69DC[temp_r29];
        if (temp_r0 == -1)
            return;
        r5 = lbl_801C699C[temp_r29];
        r4 = lbl_801C69BC[temp_r29];
        nlModel = apeFaceObj->models[temp_r0];
        break;
    case 1:
        temp_r0 = lbl_801C6A3C[temp_r29];
        if (temp_r0 == -1)
            return;
        r5 = lbl_801C69FC[temp_r29];
        r4 = lbl_801C6A1C[temp_r29];
        nlModel = apeFaceObj->models[temp_r0];
        break;
    case 5:
        temp_r0 = lbl_801C6A9C[temp_r29];
        if (temp_r0 == -1)
            return;
        r5 = lbl_801C6A5C[temp_r29];
        r4 = lbl_801C6A7C[temp_r29];
        nlModel = apeFaceObj->models[temp_r0];
        break;
    default:
        temp_r0 = lbl_801C697C[temp_r29];
        if (temp_r0 == -1)
            return;
        r5 = lbl_801C693C[temp_r29];
        r4 = lbl_801C695C[temp_r29];
        nlModel = apeFaceObj->models[temp_r0];
        break;
    }

    func_8008669C((void *)nlModel, r4, r5, 1.0f - (arg2 / 16.0f));
    mathutil_mtxA_scale_s(0.1f);
    nl2ngc_draw_model_sort_translucent(nlModel);
}
#pragma force_active reset

static void draw_ear(struct Ape *ape, struct ApeFacePart *arg1, struct Struct802B39C0_B0_child *arg2)
{
    u8 unused[8];
    struct Color3f sp14;
    struct GMAModel *model;

    model = charaGMAs[(ape->unk90 >> 1) + (ape->charaId << 1)]->modelEntries[arg1->modelId].model;
    if (lbl_802F2060 == 0)
    {
        get_curr_light_group_ambient(&sp14);
        avdisp_set_ambient(sp14.r, sp14.g, sp14.b);
    }
    if ((ape->unk24 == 1 && ape->unk9C != 5) || ape->unk24 == 0)
    {
        if (((unpausedFrameCounter << 12) & 0x30000) == 0)
        {
            float var_f1 = mathutil_sin(unpausedFrameCounter << 12);
            if (arg1->unk4.y < 0.0f)
                var_f1 = -var_f1;
            mathutil_mtxA_rotate_z(DEGREES_TO_S16(10.0f * var_f1));
        }
    }
    else if (arg2 != NULL)
        mathutil_mtxA_rotate_z(DEGREES_TO_S16(arg2->unk4));
    u_gxutil_upload_some_mtx(mathutilData->mtxA, 0);
    if (ape->charaId == 2)
        func_800865A4_sub(ape->colorId, model);
    avdisp_draw_model_unculled_sort_none(model);
    if (lbl_802F2060 == 0)
        apply_curr_light_group_ambient();
}
