typedef struct DestructorChain
{
    struct DestructorChain *next;
    void *destructor;
    void *object;
} DestructorChain;

#ifdef __cplusplus
extern "C" {
#endif

void __unregister_fragment(int fragmentID);
int __register_fragment(struct __eti_init_info *info, char *TOC);

#ifdef __cplusplus
}
#endif
