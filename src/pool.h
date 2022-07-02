#ifndef _SRC_POOL_H_
#define _SRC_POOL_H_

struct PoolInfo_sub
{
    s32 capacity;  // maximum number of objects in pool
    s32 nextFree;  // index to begin search for free slots
    s32 count;  // current size of the pool
    s8 *statusList;  // status of each object in pool
};

struct PoolInfo
{
    struct PoolInfo_sub playerPool;
    struct PoolInfo_sub itemPool;
    struct PoolInfo_sub stobjPool;
    struct PoolInfo_sub spritePool;
    struct PoolInfo_sub effectPool;
    s8 playerBuf[MAX_PLAYERS];
    s8 itemBuf[MAX_ITEMS];
    s8 stobjBuf[MAX_STOBJS];
    s8 spriteBuf[MAX_SPRITES];
    s8 effectBuf[MAX_EFFECTS];
};

extern struct PoolInfo g_poolInfo;

void chkstatus_init(void);
void chkstatus_main(void);
// ? func_800308AC();
// ? func_80030914();
int pool_alloc(struct PoolInfo_sub *, u8);
void pool_reset(struct PoolInfo_sub *);

#endif
