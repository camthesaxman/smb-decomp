#ifndef _STDDEF_H_
#define _STDDEF_H_

#define STATIC_ASSERT(cond, msg) typedef char static_assertion_##msg[(cond)?1:-1]

#define offsetof(type, member)	((size_t) &(((type *) 0)->member))

typedef unsigned long size_t;

#endif
