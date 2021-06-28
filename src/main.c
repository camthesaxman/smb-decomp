#include <dolphin.h>

#include "variables.h"
#include "functions.h"

void main(void)
{
    lbl_802F1B38 = 0;
    initialize();
    gm_init();
    func_80025EC0();
    window_init();
    event_init();
    func_800272E0();
    sound_init();
    func_8008D788();
    currentBallStructPtr = lbl_80205E60;
    currentWorldStructPtr = lbl_80206BF0;
    chkstatus_init();
    func_8008CF00(lbl_801ED920, 0x80);
    func_800487B4();
    camera_init();
    polydisp_init();
    func_80085B54(lbl_802F1B44, 0x10000);
    func_800855CC(0.0f, 0.0f, 400.0f, lbl_80292E70, 0x4000);
    func_80092498();
    func_800948F4();
    func_800248DC();
    init_ape_model_info("motdat.lz", "motlabel.bin", "motskl.bin", "motinfo.lz");
    func_8008AE98();
    func_800AD38C();
    func_80044794();
    loadingStageIdRequest = 1;
    lbl_802F1F40 = 1;
    func_80011E1C();
    func_80065C58();
    lbl_802F1B38++;
    srand(OSGetTime());

    while (1)
    {
        if (lbl_802F1D28)
            PERFEventStart(0);
            
        perf_init_timer(4);
        func_80026394();
        preproc_main();
        lbl_801F8DE0.unk0 = perf_stop_timer(4);
        
        func_800ACA40();
        
        perf_init_timer(4);
        sound_main();
        lbl_801F8DE0.unk4 = perf_stop_timer(4);
        
        perf_init_timer(4);
        input_main();
        lbl_801F8DE0.unk8 = perf_stop_timer(4);
        
        perf_init_timer(4);
        debug_main();
        lbl_801F8DE0.unkC = perf_stop_timer(4);
        
        perf_init_timer(4);
        load_main();
        lbl_801F8DE0.unk10 = perf_stop_timer(4);
        
        perf_init_timer(4);
        gm_main();
        lbl_801F8DE0.unk14 = perf_stop_timer(4);  
        
        if (lbl_802F1D28)
            PERFEventEnd(0);
            
        if (lbl_802F1D28)
            PERFEventStart(1);
        
        perf_init_timer(4);
        chkstatus_main();
        lbl_801F8DE0.unk18 = perf_stop_timer(4);
        
        perf_init_timer(4);
        event_main();
        lbl_801F8DE0.unk1C = perf_stop_timer(4);
        
        if (lbl_802F1D28)
            PERFEventEnd(1);
            
        if (lbl_802F1D28)
            PERFEventStart(2);
            
        perf_init_timer(4);
        polydisp_main();
        lbl_801F8DE0.unk20 = perf_stop_timer(4);
        
        perf_init_timer(4);
        bmpdisp_main();
        lbl_801F8DE0.unk24 = perf_stop_timer(4);
        
        perf_init_timer(4);
        window_main();
        lbl_801F8DE0.unk28 = perf_stop_timer(4);
        
        if (lbl_802F1D28)
            PERFEventEnd(2);

        perf_init_timer(4);
        epiproc_main();
        lbl_801F8DE0.unk2C = perf_stop_timer(4);
        
        perf_init_timer(4);
        syncwait_main();
        lbl_801F8DE0.unk30 = perf_stop_timer(4);
        
        perf_init_timer(4);
        shadowerase_main();
        lbl_801F8DE0.unk34 = perf_stop_timer(4);
        
        lbl_802F1B38++;
        if ((lbl_802F1EE0 & 0xA) == 0)
            lbl_802F1B34++;
    }
}

u8 unkData[] = {0, 0, 1, 1, 2, 3, 2, 3, 5, 4, 6, 0};
