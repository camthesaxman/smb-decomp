#ifndef _DOLPHIN_DSP_H_
#define _DOLPHIN_DSP_H_

typedef struct DSPTaskInfo DSPTaskInfo;
typedef void (*DSPCallback)(void *task);
struct DSPTaskInfo
{                                   
    volatile u32 state;
    volatile u32 priority;                  
    volatile u32 flags;                     
    u16 *iram_mmem_addr;          
    u32 iram_length;             
    u32 iram_addr;                               
    u16 *dram_mmem_addr;          
    u32 dram_length;
    u32 dram_addr;
    u16 dsp_init_vector;
    u16 dsp_resume_vector;
    DSPCallback init_cb;          
    DSPCallback res_cb;           
    DSPCallback done_cb;          
    DSPCallback req_cb;                              
    DSPTaskInfo *next; 
    DSPTaskInfo *prev; 
    OSTime t_context;
    OSTime t_task;
};

#endif
