#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "gxcache.h"
#include "input.h"
#include "mathutil.h"
#include "preview.h"
#include "sound.h"
#include "sprite.h"

static s32 lbl_802F21F8;
static s32 lbl_802F21FC;
static volatile s32 s_readResult;
static u32 lbl_802F2204;

struct Struct801D6744
{
    char *text;
    s32 unused;
};

struct Struct801D6894
{
    struct Struct801D6744 *lines;
    s32 count;
};

enum
{
    MSG_COVER_OPEN,
    MSG_NO_DISK,
    MSG_WRONG_DISK,
    MSG_READ_ERROR,
    MSG_FATAL_ERROR,
};

static struct Struct801D6744 s_errMsgCoverOpen[] =
{
    {"a/Please close the Disc Cover.", 0},
};

static struct Struct801D6744 s_errMsgNoDisk[] =
{
    {"a/Please insert", 0},
    {"a/the Super Monkey Ball Game Disc.", 0},
};

static struct Struct801D6744 s_errMsgWrongDisk[] =
{
    {"a/Please insert", 0},
    {"a/the Super Monkey Ball Game Disc.", 0},
};

static struct Struct801D6744 s_errMsgReadError[] =
{
    {"a/Could not read Game Disc.", 0},
    {"", 0},
    {"a/Please see the Instruction Booklet for details.", 0},
};

static struct Struct801D6744 s_errMsgFatalError[] =
{
    {"a/An error has occurred.", 0},
    {"", 0},
    {"a/Press the POWER Button to turn off", 0},
    {"a/the Nintendo GameCube tm.", 0},
    {"", 0},
    {"a/Follow the instructions in the Instruction Booklet.", 0},
};

static struct Struct801D6894 s_errMessages[] =
{
    {s_errMsgCoverOpen,  ARRAY_COUNT(s_errMsgCoverOpen)},
    {s_errMsgNoDisk,     ARRAY_COUNT(s_errMsgNoDisk)},
    {s_errMsgWrongDisk,  ARRAY_COUNT(s_errMsgWrongDisk)},
    {s_errMsgReadError,  ARRAY_COUNT(s_errMsgReadError)},
    {s_errMsgFatalError, ARRAY_COUNT(s_errMsgFatalError)},
};

// Same messages as above, but without the "a/" prefix (for use with DEMO font)

static struct Struct801D6744 s_errMsgCoverOpenDemoFont[] =
{
    {"Please close the Disc Cover.", 0},
};

static struct Struct801D6744 s_errMsgNoDiskDemoFont[] =
{
    {"Please insert", 0},
    {"the Super Monkey Ball Game Disc.", 0},
};

static struct Struct801D6744 s_errMsgWrongDiskDemoFont[] =
{
    {"Please insert", 0},
    {"the Super Monkey Ball Game Disc.", 0},
};

static struct Struct801D6744 s_errMsgReadErrorDemoFont[] =
{
    {"Could not read Game Disc.", 0},
    {"", 0},
    {"Please see the Instruction Booklet for details.", 0},
};

static struct Struct801D6744 s_errMsgFatalErrorDemoFont[] =
{
    {"An error has occurred.", 0},
    {"", 0},
    {"Press the POWER Button to turn off", 0},
    {"the Nintendo GameCube tm.", 0},
    {"", 0},
    {"Follow the instructions in the Instruction Booklet.", 0},
};

static struct Struct801D6894 s_errMessagesDemoFont[] =
{
    {s_errMsgCoverOpenDemoFont,  ARRAY_COUNT(s_errMsgCoverOpenDemoFont)},
    {s_errMsgNoDiskDemoFont,     ARRAY_COUNT(s_errMsgNoDiskDemoFont)},
    {s_errMsgWrongDiskDemoFont,  ARRAY_COUNT(s_errMsgWrongDiskDemoFont)},
    {s_errMsgReadErrorDemoFont,  ARRAY_COUNT(s_errMsgReadErrorDemoFont)},
    {s_errMsgFatalErrorDemoFont, ARRAY_COUNT(s_errMsgFatalErrorDemoFont)},
};

float  force_lbl_802F5E78() { return 0.0f; }
float  force_lbl_802F5E7C() { return 480.0f; }
float  force_lbl_802F5E80() { return 640.0f; }
float  force_lbl_802F5E84() { return 20000.f; }
float  force_lbl_802F5E88() { return 0.0080000003799796104f; }
float  force_lbl_802F5E8C() { return 0.80000001192092896f; }
float  force_lbl_802F5E90() { return 1.0f; }
double force_lbl_802F5E98() { return 320.0; }
double force_lbl_802F5EA0() { return 0.5; }
double force_lbl_802F5EA8() { return 240.0; }
double force_lbl_802F5EB0() { return 12.0; }
double force_lbl_802F5EB8() { return 24.0; }

#ifdef NONMATCHING
static void func_800AC718_sub(void)
{
    Mtx44 spC;
    mathutil_mtxA_from_identity();
    GXLoadPosMtxImm(mathutilData->mtxA, 0U);
    C_MTXOrtho(spC, 0.0f, 480.0f, 0.0f, 640.0f, 0.0f, 20000.0f);
    GXSetProjection(spC, GX_ORTHOGRAPHIC);
}

static void show_dvd_err_msg(int msgId)
{
    GXColor sp4C = { 0, 0, 0, 255 };
    s32 temp_r29_2;

    GXSetCopyClear(sp4C, 0xFFFFFF);
    if (msgId >= 0)
    {
        if (bitmap_is_group_loaded(BMP_COM))
        {
            int i;
            struct Struct801D6894 *errMsg;

            bitmap_init_tev();
            func_800AC718_sub();
            lbl_802F21FC = lbl_802F1D04;
            lbl_802F1D04 = 4;
            reset_text_draw_settings();
            set_text_font(FONT_JAP_24x24_2Pg);
            func_80071B1C(0.008f);
            func_80071B50(0x200000);
            set_text_scale(0.8f, 1.0f);

            errMsg = &s_errMessages[msgId];
            for (i = 0; i < errMsg->count; i++)
            {
                float x = (320.0 - (0.5 * u_get_text_width(errMsg->lines[i].text)));
                float y = ((240.0 - (12.0 * errMsg->count)) + (24.0 * i));
                set_text_pos(x, y);
                func_80072AC0(errMsg->lines[i].text);
            }
            lbl_802F1D04 = lbl_802F21FC;
        }
        else
        {
            struct Struct801D6894 *errMsg;
            int i;

            if (lbl_802F21F8 == 0)
            {
                temp_r29_2 = OSSetCurrentHeap(mainHeap);
                DEMOInitROMFont();
                DEMOSetROMFontSize(0x16, -1);
                OSSetCurrentHeap(temp_r29_2);
                lbl_802F21F8 = 1;
            }
            DEMOInitCaption(2, 0x280, 0x1C0);

            errMsg = &s_errMessagesDemoFont[msgId];
            for (i = 0; i < errMsg->count; i++)
            {
                float x = (320.0 - (0.5 * DEMOGetRFTextWidth(errMsg->lines[i].text)));
                float y = ((240.0 - (12.0 * errMsg->count)) + (24.0 * i));
                DEMORFPrintf(x, y, 1, errMsg->lines[i].text);
            }
        }
    }
    gpwait_main();
    syncwait_main();
    globalFrameCounter += 1;
    beginframe_main();
    func_8002DB38();
}
#else
extern const GXColor lbl_802F5EC8;
static asm void show_dvd_err_msg(int msgId)
{
    nofralloc
#include "../asm/nonmatchings/show_dvd_err_msg.s"
}
const GXColor lbl_802F5EC8 = { 0, 0, 0, 255 };
#pragma peephole on
#endif

void func_800ACA40(void)
{
    u8 unused[0x20];
    OSHeapHandle heap;
    int status;
    int tries = 0;
    int msgId = -1;

    do
    {
        if (tries > 0)
        {
            PADStatus pad;

            func_80025158(&pad);
            handle_reset_input(&pad);
            ev_vibration_dest();
        }
        status = DVDGetDriveStatus();
        switch (status)
        {
        case DVD_STATE_NO_DISK:
            msgId = MSG_NO_DISK;
            break;
        case DVD_STATE_COVER_OPEN:
            msgId = MSG_COVER_OPEN;
            break;
        case DVD_STATE_WRONG_DISK:
            msgId = MSG_WRONG_DISK;
            break;
        case DVD_STATE_RETRY:
            msgId = MSG_READ_ERROR;
            break;
        case DVD_STATE_FATAL_ERROR:
        case DVD_STATE_END:
        case DVD_STATE_BUSY:
            msgId = -1;
            break;
        }
        if (msgId >= 0)
            show_dvd_err_msg(msgId);
        if (tries < 60)
            tries++;
    } while (status != DVD_STATE_END && status != DVD_STATE_BUSY && status != DVD_STATE_FATAL_ERROR);
    if (status == -1)
    {
        input_main();
        while (1)
            show_dvd_err_msg(MSG_FATAL_ERROR);
    }

    if (tries > 1)
        lbl_802F2204 |= 1;
    else
        lbl_802F2204 &= ~1;
    if (lbl_802F2204 & 1)
        func_8002DBC4();
    if (lbl_802F21F8 != 0)
    {
        heap = OSSetCurrentHeap(mainHeap);
        func_800A5704();
        OSSetCurrentHeap(heap);
        gxcache_init();
        lbl_802F21F8 = 0;
    }
}

static void read_callback(s32 result, DVDFileInfo *file)
{
    if (result < 0)
        s_readResult = result;
    else
        s_readResult = 0;
}

int u_read_dvd_file(DVDFileInfo *file, void *arg1, u32 arg2, int arg3)
{
    u8 unused[0x20];
    OSHeapHandle heap;
    BOOL r30 = FALSE;

    s_readResult = 1;
    DVDReadAsyncPrio(file, arg1, arg2, arg3, read_callback, 2);
    do
    {
        if (r30 != 0)
        {
            PADStatus pad;

            func_80025158(&pad);
            handle_reset_input(&pad);
            ev_vibration_dest();
        }
        switch (DVDGetDriveStatus())
        {
        case DVD_STATE_COVER_OPEN:
            show_dvd_err_msg(MSG_COVER_OPEN);
            break;
        case DVD_STATE_NO_DISK:
            show_dvd_err_msg(MSG_NO_DISK);
            break;
        case DVD_STATE_WRONG_DISK:
            show_dvd_err_msg(MSG_WRONG_DISK);
            break;
        case DVD_STATE_RETRY:
            show_dvd_err_msg(MSG_READ_ERROR);
            break;
        case DVD_STATE_FATAL_ERROR:
            show_dvd_err_msg(MSG_FATAL_ERROR);
            break;
        }
        r30 = 1;
    } while (s_readResult == 1);

    if (s_readResult < 0)  // error
    {
        while (1)
        {
            input_main();
            show_dvd_err_msg(MSG_FATAL_ERROR);
        }
    }
    else if (lbl_802F21F8 != 0)
    {
        heap = OSSetCurrentHeap(mainHeap);
        func_800A5704();
        OSSetCurrentHeap(heap);
        gxcache_init();
        lbl_802F21F8 = 0;
    }
    return file->length;
}

void init_loading_gct(void)
{
    struct Preview preview;
    Mtx44 mtx;
    int i;

    preview_create(&preview, "loading.gct", 0, 640, 480, GX_TF_CMPR);
    u_preview_wait_then_do_something(&preview);
    for (i = 0; i < 5; i++)
    {
        beginframe_main();
        mathutil_mtxA_from_identity();
        GXLoadPosMtxImm(mathutilData->mtxA, 0U);
        C_MTXOrtho(mtx, 0.0f, 480.0f, 0.0f, 640.0f, 0.0f, 20000.0f);
        GXSetProjection(mtx, GX_ORTHOGRAPHIC);
        bitmap_init_tev();
        preview_draw(&preview, -1, 0, 0.0f, 0.0f, 0.5f, 640.0f, 480.0f);
        gpwait_main();
        syncwait_main();
    }
    preview_free(&preview);
    beginframe_main();
    gpwait_main();
    syncwait_main();
}
