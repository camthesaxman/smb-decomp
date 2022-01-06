typedef void (*OrdTblDrawFunc)(struct OrdTblNode *);

struct OrdTblNode
{
    struct OrdTblNode *next;
    OrdTblDrawFunc drawFunc;
};

void g_ord_tbl_init_list_stuff(float, float, float, void *, int);
void ord_tbl_reset_list(void);
void g_ord_tbl_set_some_float(float);
void g_ord_tbl_add_some_float(float);
struct OrdTblNode *g_ord_tbl_get_list_head_1(Vec *a);
struct OrdTblNode *g_ord_tbl_get_list_head_2(Vec *a, int b);
void ord_tbl_draw_nodes(void);
void ord_tbl_init_buffer(void *addr, u32 size);
void ord_tbl_insert_node(struct OrdTblNode *list, struct OrdTblNode *node);
void *ord_tbl_alloc_node(u32 size);
