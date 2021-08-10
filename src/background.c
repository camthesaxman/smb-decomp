#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"

#pragma force_active on

struct Struct801B9178  // size = 0xA8
{
    s16 unk0;
    float unk4;
    u32 unk8;
    u32 unkC;
    u8 filler10[0x14-0x10];
    Vec unk14;
    Vec unk20;
    float unk2C;
    float unk30;
    float unk34;
    float unk38;
    float unk3C;
    float unk40;
    u8 filler44[4];
    Mtx unk48;
    void (*unk78)(void);
    void (*unk7C)(void);
    u32 unk80;
    float unk84;
    u8 filler88[4];
    u32 unk8C;
    u32 unk90;
    u32 unk94;
    void (*unk98)();
    void *unk9C;
    u32 unkA0;
    u32 unkA4;
} lbl_801B9178 =
{
    0,
    8421504.0,
    0x80,
    0x80000000,
};

// What is this?
u32 lbl_801B9178_A8[] =
{
    0,
    -1,
    0x113967FF,
    0x383D6CFF,
    0x001A4DFF,
    0x8398EDFF,
    0,
    0x1D4AB500,
    0,
    0,
    0,
    0,
    0,
    -1,
    0xFF,
    0xFF,
    0xFF,
    0xFF,
    0xD8BC77FF,
    0xFF,
    0xFF,
    0xFF,
    -1,
    -1,
    -1,
    -1,
    0xFFFFCDFF,
    -1,
};

// lbl_801B9178 + 0x29C
char *lbl_801B9414[] =
{
    "NULL",
    "BG_TYPE_BLUESKY_A",
    "BG_TYPE_NIGHT_B",
    "BG_TYPE_SUNSET_C",
    "BG_TYPE_WATER_C",
    "BG_TYPE_STORM_D",
    "BG_TYPE_ICE_E",
    "BG_TYPE_SAND_G",
    "BG_TYPE_SPACE_H",
    "BG_TYPE_CAVE_I",
    "BG_TYPE_BONUS_J",
    "BG_TYPE_EXTRAMASTER_J",
    "BG_TYPE_E3",
    "BG_TYPE_JUN",
    "BG_TYPE_WAT",
    "BG_TYPE_NIG",
    "BG_TYPE_SUN",
    "BG_TYPE_SPA",
    "BG_TYPE_SND",
    "BG_TYPE_ICE2",
    "BG_TYPE_STM",
    "BG_TYPE_BNS",
    "BG_TYPE_PIL",
    "BG_TYPE_BIL",
    "BG_TYPE_GOL",
    "BG_TYPE_BOW",
    "BG_TYPE_MST",
    "BG_TYPE_END",
    NULL,
};

// lbl_801B9178 + 0x310
void (*lbl_801B9488[])(void) =
{
    NULL,
    func_800569C4,
    func_800584C0,
    func_8005879C,
    func_8005A17C,
    func_80059A9C,
    func_80058BF0,
    func_80059770,
    func_80058520,
    func_80057A3C,
    func_800587FC,
    func_80057A9C,
    bg_init_e3,
    func_8005B1D8,
    func_8005E138,
    func_80055EE0,
    func_80060DDC,
    func_8005F9B0,
    func_8005B8BC,
    func_80056020,
    func_80061FCC,
    func_800613EC,
    func_80063F98,
    func_80056160,
    func_80056390,
    func_800564D0,
    func_80062C2C,
    func_800651C4,
    NULL,
};

// 384
void (*lbl_801B94FC[])(void) =
{
    NULL,
    func_80057358,
    func_800584E0,
    func_800587BC,
    func_8005A508,
    func_80059CA0,
    func_80058CA0,
    func_80059878,
    func_800585E4,
    func_80057A5C,
    func_80058968,
    func_80058070,
    bg_main_e3,
    func_8005B3CC,
    func_8005E540,
    func_80055EE4,
    func_80060FAC,
    func_800603DC,
    func_8005BE10,
    func_80056024,
    func_8006225C,
    func_80061564,
    func_8006463C,
    func_80056254,
    func_80056394,
    func_800564D4,
    func_800631B0,
    func_8006540C,
    NULL,
};

// 3F8
void (*lbl_801B9570[])(void) =
{
    NULL,
    func_8005735C,
    func_800584E4,
    func_800587C0,
    func_8005ACC0,
    func_8005A134,
    func_80058CA4,
    func_80059920,
    func_800586B8,
    func_80057A60,
    func_80058974,
    func_80058254,
    func_80055554,
    func_8005B5DC,
    func_8005E854,
    func_80055F48,
    func_8006118C,
    func_80060894,
    func_8005C06C,
    func_80056088,
    func_800626BC,
    func_80061700,
    func_800646F0,
    func_800562B8,
    func_800563F8,
    func_80056538,
    func_8006378C,
    func_800654CC,
    NULL,
};

// 46C
void (*lbl_801B95E4[])(void) =
{
    NULL,
    func_80057360,
    func_800584E8,
    func_800587C4,
    func_8005ACC4,
    func_8005A138,
    func_80058CA8,
    func_80059924,
    func_800586BC,
    func_80057A64,
    func_80058978,
    func_80058258,
    bg_disp_e3,
    func_8005B5E0,
    func_8005E858,
    func_80055F4C,
    func_80061190,
    func_80060898,
    func_8005C070,
    func_8005608C,
    func_800626C0,
    func_80061704,
    func_800646F4,
    func_800562BC,
    func_800563FC,
    func_8005653C,
    func_80063790,
    func_800654D0,
    NULL,
};

// 4E0
void (*lbl_801B9658[])(int) =
{
    NULL,
    func_800573A0,
    func_8005851C,
    func_800587F8,
    func_8005AD7C,
    func_8005A178,
    func_80058CDC,
    func_800599F8,
    func_80058728,
    func_80057A98,
    func_800589AC,
    func_8005828C,
    func_80055628,
    func_8005B868,
    func_8005E910,
    func_8005601C,
    func_80061390,
    func_800609A8,
    func_8005C3B4,
    func_8005615C,
    func_80062BD0,
    func_80061920,
    func_80064C2C,
    func_8005638C,
    func_800564CC,
    func_8005660C,
    func_80063AD4,
    func_800654F0,
    NULL,
};

// 554
void (*lbl_801B96CC[])(void) =
{
    NULL,
    NULL,
    NULL,
    NULL,
    func_8005AD80,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

// 5C8
void (*lbl_801B9740[])(void) =
{
    NULL,
    NULL,
    NULL,
    NULL,
    func_8005AE1C,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    func_80056610,
    func_80056610,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

extern u32 lbl_802F1B38;
extern u32 lbl_802F1EE0;
extern OSHeapHandle lbl_802F1B20;
extern struct TPL *decodedBgTpl;
extern struct GMA *decodedBgGma;
extern u32 lbl_802F1AFC;
extern u32 lbl_802F1AE8;
extern struct
{
    u32 unk0;
    u8 filler4[9-4];
} lbl_801EEC90;
extern Mtx *lbl_802F1B3C;

extern struct
{
    u8 filler0[0x68];
    u32 unk68;
    u32 unk6C;
    u32 unk70;
    u32 unk74;
} *decodedStageLzPtr;

void ev_background_init(void)
{
    s16 r29 = lbl_801B9178.unk0;
    void *r27 = lbl_801B9178.unk9C;
    u32 r26 = lbl_801B9178.unkA0;

    memset(&lbl_801B9178, 0, sizeof(lbl_801B9178));

    lbl_801B9178.unk0 = r29;
    lbl_801B9178.unk9C = r27;
    lbl_801B9178.unkA0 = r26;

    lbl_801B9178.unk4 = 0.0f;
    lbl_801B9178.unk8 = 0;

    lbl_801B9178.unkC = lbl_801B9178_A8[lbl_801B9178.unk0];
    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(lbl_801B9178.unk48);
    lbl_801B9178.unk78 = lbl_801B96CC[lbl_801B9178.unk0];
    lbl_801B9178.unk7C = lbl_801B9740[lbl_801B9178.unk0];
    lbl_801B9178.unk8C = 0;
    lbl_801B9178.unk90 = 0;
    lbl_801B9178.unk94 = 0;
    if (lbl_801B9178.unk0 > 0)
    {
        int temp = rand();
        srand(lbl_801B9178.unkA0);
        lbl_801B9178.unkA4 = rand();
        lbl_801B9488[lbl_801B9178.unk0]();
        lbl_801B9178.unkA0 = lbl_802F1B38 + rand();
        srand(temp);
    }
}

void ev_background_main(void)
{
    if ((lbl_802F1EE0 & 0xA) == 0)
    {
        lbl_801B9178.unk4 += 1.0f;
        lbl_801B9178.unkA4++;
    }
    if (lbl_801B9178.unk0 > 0)
        lbl_801B94FC[lbl_801B9178.unk0]();
}

void ev_background_dest(void)
{
    if (lbl_801B9178.unk0 > 0)
        lbl_801B9570[lbl_801B9178.unk0]();
    lbl_801B9178.unk98 = NULL;
    lbl_801B9178.unk78 = 0;
    lbl_801B9178.unk7C = 0;
    lbl_801B9178.unk8C = 0;
    lbl_801B9178.unk90 = 0;
    lbl_801B9178.unk94 = 0;
}

void func_80054FF0(void)
{
    if (lbl_801B9178.unk98 != NULL)
        lbl_801B9178.unk98();
}

void func_80055028(void)
{
    if (!(dipSwitches & (1 << (31-0x1D))) && lbl_801B9178.unk0 > 0)
        lbl_801B95E4[lbl_801B9178.unk0]();
}

void func_8005507C(void)
{
    if (lbl_801B9178.unk0 > 0)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(lbl_802F1B20);

        if (lbl_801B9178.unk9C != NULL)
        {
            OSFree(lbl_801B9178.unk9C);
            lbl_801B9178.unk9C = NULL;
        }
        if (decodedBgTpl != NULL || decodedBgGma != NULL)
        {
            VISetNextFrameBuffer(lbl_802F1CA4[0]);
            VIWaitForRetrace();
        }
        if (decodedBgTpl != NULL)
        {
            free_tpl(decodedBgTpl);
            decodedBgTpl = NULL;
        }
        if (decodedBgGma != NULL)
        {
            free_gma(decodedBgGma);
            decodedBgGma = NULL;
        }
        func_80030E20(&lbl_802F1AFC, &lbl_802F1AE8);

        OSSetCurrentHeap(oldHeap);
        lbl_801B9178.unk0 = -1;
    }
}

// 648
char *lbl_801B97C0[] =
{
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    "bg_jun",
    "bg_wat",
    "bg_nig",
    "bg_sun",
    "bg_spa",
    "bg_snd",
    "bg_ice",
    "bg_stm",
    "bg_bns",
    "bg_pil",
    NULL,
    "bg_gol",
    "bg_bow",
    "bg_mst",
    "bg_ending",
    NULL,
};

// 6BC
char *lbl_801B9834[] =
{
    NULL,
    "bg_a",
    "bg_b",
    "bg_c",
    "bg_d",
    "bg_e",
    "bg_f",
    "bg_g",
    "bg_h",
    "bg_i",
    "bg_j",
    "bg_j",
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

void func_80055164(int bgId)
{
    char bgDir[64];
    char gmaFileName[64];
    char tplFileName[64];
    char *bgName;

    if (lbl_801B9178.unk0 != bgId)
    {
        bgName = lbl_801B97C0[bgId];
        if (bgName != NULL)
        {
            strcpy(bgDir, "bg/");
            DVDChangeDir(bgDir);
            sprintf(gmaFileName, "%s.gma", bgName);
            sprintf(tplFileName, "%s.tpl", bgName);
            file_preload(gmaFileName);
            file_preload(tplFileName);
            DVDChangeDir("/test");
        }
        bgName = lbl_801B9834[bgId];
        if (bgName != NULL)
        {
            strcpy(bgDir, "bg/");
            DVDChangeDir(bgDir);
            sprintf(gmaFileName, "%s_p.lz", bgName);
            sprintf(tplFileName, "%s.lz", bgName);
            file_preload(gmaFileName);
            file_preload(tplFileName);
            DVDChangeDir("/test");
        }
    }
}

u32 lbl_801B98A8[] =
{
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
    0x16C,
    0x194,
    0,
    0x16C,
    0xAC,
    0x56C,
    0,
    0x428,
    0x80C,
    0x1EC,
    0,
    0,
    0,
    0xB90,
    0x94,
    0,
};

u8 lbl_801B991C[] =
{
    0x01, 0x0D, 0x0D, 0x0D,
    0x0D, 0x10, 0x10, 0x10,
    0x10, 0x10, 0x01, 0x0D,
    0x0D, 0x0D, 0x0D, 0x10,
    0x10, 0x10, 0x10, 0x01,
    0x01, 0x0F, 0x0F, 0x0F,
    0x0F, 0x0F, 0x0F, 0x0F,
    0x0F, 0x0F, 0x01, 0x0E,
    0x0E, 0x0E, 0x0E, 0x0E,
    0x0E, 0x0E, 0x0E, 0x0E,
    0x0E, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0F, 0x0F, 0x0F,
    0x0F, 0x01, 0x01, 0x0E,
    0x0E, 0x0E, 0x0E, 0x0E,
    0x0E, 0x0E, 0x0E, 0x0E,
    0x01, 0x12, 0x12, 0x12,
    0x12, 0x12, 0x12, 0x12,
    0x12, 0x12, 0x01, 0x13,
    0x13, 0x13, 0x13, 0x13,
    0x13, 0x13, 0x13, 0x13,
    0x01, 0x14, 0x14, 0x14,
    0x14, 0x14, 0x14, 0x14,
    0x14, 0x14, 0x14, 0x15,
    0x15, 0x15, 0x15, 0x15,
    0x01, 0x01, 0x01, 0x0D,
    0x01, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x01, 0x1A,
    0x1A, 0x1A, 0x1A, 0x1A,
    0x1A, 0x1A, 0x1A, 0x1A,
    0x1A, 0x1A, 0x1A, 0x1A,
    0x1A, 0x1A, 0x1A, 0x11,
    0x12, 0x0D, 0x13, 0x0F,
    0x0E, 0x0F, 0x12, 0x10,
    0x11, 0x11, 0x0E, 0x0D,
    0x13, 0x11, 0x11, 0x11,
    0x11, 0x11, 0x0D, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x16, 0x16, 0x16,
    0x16, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x19,
    0x17, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x00, 0x01,
    0x01, 0x01, 0x01, 0x01,
    0x01, 0x15, 0x1B, 0x0D,
    0x01, 0x00, 0x00, 0x00,
};

void load_bg_files(int bgId)
{
    char bgDir[64];
    char gmaFileName[64];
    char tplFileName[64];
    char *bgName;

    if (lbl_801B9178.unk0 != bgId)
    {
        OSHeapHandle oldHeap = OSSetCurrentHeap(lbl_802F1B20);

        if (lbl_801B9178.unk0 > 0)
        {
            if (lbl_801B9178.unk9C != NULL)
            {
                OSFree(lbl_801B9178.unk9C);
                lbl_801B9178.unk9C = NULL;
            }
            if (decodedBgTpl != NULL || decodedBgGma != NULL)
            {
                VISetNextFrameBuffer(lbl_802F1CA4[0]);
                VIWaitForRetrace();
            }
            if (decodedBgTpl != NULL)
            {
                free_tpl(decodedBgTpl);
                decodedBgTpl = NULL;
            }
            if (decodedBgGma != NULL)
            {
                free_gma(decodedBgGma);
                decodedBgGma = NULL;
            }
            func_80030E20(&lbl_802F1AFC, &lbl_802F1AE8);
        }
        if (bgId > 0)
        {
            bgName = lbl_801B97C0[bgId];
            if (bgName != NULL)
            {
                strcpy(bgDir, "bg/");
                DVDChangeDir(bgDir);
                sprintf(gmaFileName, "%s.gma", bgName);
                sprintf(tplFileName, "%s.tpl", bgName);
                decodedBgTpl = load_tpl(tplFileName);
                decodedBgGma = load_gma(gmaFileName, decodedBgTpl);
                DVDChangeDir("/test");
            }
            bgName = lbl_801B9834[bgId];
            if (bgName != NULL)
            {
                strcpy(bgDir, "bg/");
                DVDChangeDir(bgDir);
                sprintf(gmaFileName, "%s_p.lz", bgName);
                sprintf(tplFileName, "%s.lz", bgName);
                load_nlobj(&lbl_802F1AFC, &lbl_802F1AE8, gmaFileName, tplFileName);
                DVDChangeDir("/test");
            }
            if (lbl_801B98A8[bgId] != 0)
            {
                lbl_801B9178.unk9C = OSAlloc(lbl_801B98A8[bgId]);
                if (lbl_801B9178.unk9C == NULL)
                    OSPanic("background.c", 0x30B, "cannot OSAlloc\n");
                memset(lbl_801B9178.unk9C, 0, lbl_801B98A8[bgId]);
            }
        }
        OSSetCurrentHeap(oldHeap);
        lbl_801B9178.unk0 = bgId;
        func_80021DB4(stageId);
    }
}

void func_800554A4(int a)
{
    if (lbl_801B9178.unk0 > 0)
        lbl_801B9658[lbl_801B9178.unk0](a);
}

void bg_init_e3(void) {}

void bg_main_e3(void)
{
    float var = lbl_801B9178.unk4 / 60.0;

    func_8005562C(decodedStageLzPtr->unk6C, decodedStageLzPtr->unk68, var);
    func_8005562C(decodedStageLzPtr->unk74, decodedStageLzPtr->unk70, var);
}

void func_80055554(void) {}

void bg_disp_e3(void)
{
    func_800224CC();
    if ((decodedStageLzPtr->unk6C != 0 || decodedStageLzPtr->unk74 != 0)
     && (lbl_801EEC90.unk0 & 1))
        func_8008E428(0.5f, 0.5f, 0.5f);
    if (decodedStageLzPtr->unk6C != 0)
    {
        mathutil_mtxA_from_mtx(*lbl_802F1B3C);
        func_80022274(4);
    }
    func_80055A18(lbl_802F1B3C, decodedStageLzPtr->unk6C, decodedStageLzPtr->unk68);
    if (decodedStageLzPtr->unk74 != 0)
    {
        mathutil_mtxA_from_mtx(mathutilData->mtxB);
        func_80022274(0);
    }
    func_80055A18(mathutilData->mtxB, decodedStageLzPtr->unk74, decodedStageLzPtr->unk70);
    func_80022530();
}

void func_80055628(int a) {}
