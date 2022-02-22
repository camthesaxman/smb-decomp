#ifndef _SRC_ORD_TBL_H_
#define _SRC_ORD_TBL_H_

#include <dolphin/types.h>
#include <dolphin/mtx.h>

typedef void (*OrdTblDrawFunc)(struct OrdTblNode *);

struct OrdTblNode
{
    struct OrdTblNode *next;
    OrdTblDrawFunc drawFunc;
};

void ord_tbl_init(float depthOffset, float minDepth, float maxDepth, void *buffer, int maxEntries);
void ord_tbl_reset(void);
void ord_tbl_set_depth_offset(float offset);
void ord_tbl_add_depth_offset(float offset);
struct OrdTblNode *ord_tbl_get_entry_for_pos(Point3d *pos);
struct OrdTblNode *ord_tbl_get_entry_for_pos_offset_index(Point3d *pos, int indexOffset);
void ord_tbl_draw_nodes(void);
void ord_tbl_init_buffer(void *addr, u32 size);
void ord_tbl_insert_node(struct OrdTblNode *tblEntry, struct OrdTblNode *newNode);
void *ord_tbl_alloc_node(u32 size);

#endif
