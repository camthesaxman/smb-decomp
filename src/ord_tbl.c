#include <stddef.h>
#include <dolphin.h>

#include "global.h"
#include "mathutil.h"
#include "ord_tbl.h"

struct
{
    u8 *currPtr;
    u8 *initPtr;
    u32 initSize;
    u32 currSize;
} ordTblAllocInfo;

static void clear_list(struct OrdTblNode *list, int count, u32 c);
static void draw_nodes(struct OrdTblNode *a);
static void reset_alloc_info(void);

void g_ord_tbl_init_list_stuff(float a, float b, float c, void *buffer, int maxEntries)
{
    lbl_802F1B3C->entries = buffer;
    lbl_802F1B3C->maxEntries = maxEntries;
    lbl_802F1B3C->unkF8 = a;
    lbl_802F1B3C->unkFC = b;
    lbl_802F1B3C->unk100 = c;
    lbl_802F1B3C->unk10C = c - b;
    ord_tbl_reset_list();
}

void ord_tbl_reset_list(void)
{
    clear_list(lbl_802F1B3C->entries, lbl_802F1B3C->maxEntries, 1);
    lbl_802F1B3C->lastEntry = &lbl_802F1B3C->entries[lbl_802F1B3C->maxEntries - 1];
    lbl_802F1B3C->firstEntry = lbl_802F1B3C->entries;
}

void g_ord_tbl_set_some_float(float a)
{
    lbl_802F1B3C->unkF8 = a;
}

void g_ord_tbl_add_some_float(float a)
{
    lbl_802F1B3C->unkF8 += a;
}

struct OrdTblNode *g_ord_tbl_get_list_head_1(Vec *a)
{
    Vec sp10;
    float f31;
    float f3;
    int index;
    struct OrdTblNode *ret;

    mathutil_mtxA_tf_point(a, &sp10);
    f31 = lbl_802F1B3C->unkFC;
    sp10.z = -sp10.z;
    if (sp10.z < f31)
        sp10.z = f31;
    f3 = mathutil_vec_mag(&sp10) + lbl_802F1B3C->unkF8 - f31;
    if (f3 < 0.0f)
        index = 0;
    else
    {
        index = lbl_802F1B3C->maxEntries * f3 / (f3 + lbl_802F1B3C->unk10C);
        if (index >= lbl_802F1B3C->maxEntries)
            index = lbl_802F1B3C->maxEntries - 1;
    }
    ret = &lbl_802F1B3C->entries[index];
    if (lbl_802F1B3C->lastEntry > ret)
        lbl_802F1B3C->lastEntry = ret;
    if (lbl_802F1B3C->firstEntry < ret)
        lbl_802F1B3C->firstEntry = ret;
    return ret;
}

struct OrdTblNode *g_ord_tbl_get_list_head_2(Vec *a, int b)
{
    Vec sp10;
    float f31;
    float f3;
    int index;
    struct OrdTblNode *ret;

    mathutil_mtxA_tf_point(a, &sp10);
    f31 = lbl_802F1B3C->unkFC;
    sp10.z = -sp10.z;
    if (sp10.z < f31)
        sp10.z = f31;
    f3 = mathutil_vec_mag(&sp10) + lbl_802F1B3C->unkF8 - f31;
    if (f3 < 0.0f)
        index = 0;
    else
    {
        index = lbl_802F1B3C->maxEntries * f3 / (f3 + lbl_802F1B3C->unk10C);
        index = b + index;
        if (index < 0)
            index = 0;
        else if (index >= lbl_802F1B3C->maxEntries)
            index = lbl_802F1B3C->maxEntries - 1;
    }
    ret = &lbl_802F1B3C->entries[index];
    if (lbl_802F1B3C->lastEntry > ret)
        lbl_802F1B3C->lastEntry = ret;
    if (lbl_802F1B3C->firstEntry < ret)
        lbl_802F1B3C->firstEntry = ret;
    return ret;
}

void ord_tbl_draw_nodes(void)
{
    if (lbl_802F1B3C->firstEntry >= lbl_802F1B3C->lastEntry)
    {
        if (lbl_802F1B3C->lastEntry > lbl_802F1B3C->entries)
            lbl_802F1B3C->lastEntry[-1].next = NULL;
        draw_nodes(lbl_802F1B3C->firstEntry);
    }
    ord_tbl_reset_list();
}

static void clear_list(struct OrdTblNode *list, int count, u32 c)
{
    int i;
    struct OrdTblNode *node;

    if (c == 0)
    {
        node = list;
        for (i = count - 1; i > 0; i--)
        {
            node->next = node + 1;
            node->drawFunc = NULL;
            node++;
        }
        node->next = NULL;
        node->drawFunc = NULL;
    }
    else
    {
        node = &list[count - 1];
        for (i = count - 1; i > 0; i--)
        {
            node->next = node - 1;
            node->drawFunc = NULL;
            node--;
        }
        node->next = NULL;
        node->drawFunc = NULL;
    }
    reset_alloc_info();
}

static void draw_nodes(struct OrdTblNode *node)
{
    while (node != NULL)
    {
        if (node->drawFunc != NULL)
            node->drawFunc(node);
        node = node->next;
    }
}

/* Resets the ptr and size to that initially set by ord_tbl_init_buffer */
static void reset_alloc_info(void)
{
    ordTblAllocInfo.currPtr = ordTblAllocInfo.initPtr;
    ordTblAllocInfo.currSize = ordTblAllocInfo.initSize;
}

void ord_tbl_init_buffer(void *addr, u32 size)
{
    ordTblAllocInfo.initPtr = addr;
    ordTblAllocInfo.initSize = size;
    reset_alloc_info();
}

void ord_tbl_insert_node(struct OrdTblNode *head, struct OrdTblNode *toInsert)
{
    toInsert->next = head->next;
    head->next = toInsert;
}

void *ord_tbl_alloc_node(u32 size)
{
    void *ptr;

    if (ordTblAllocInfo.currSize < size)
        OSPanic("ord_tbl.c", 328, "Ordering Primitive Over!!");
    ptr = ordTblAllocInfo.currPtr;
    ordTblAllocInfo.currPtr += size;
    ordTblAllocInfo.currSize -= size;
    return ptr;
}
