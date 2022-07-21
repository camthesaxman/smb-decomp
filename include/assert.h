#ifndef _ASSERT_H_
#define _ASSERT_H_

#if TARGET_PC
#if _MSC_VER
#include <../ucrt/assert.h>
#else
#include_next <assert.h>
#endif
#else

#ifndef __cplusplus

#if __STDC_VERSION__ >= 201112L
// The C11 way
#define static_assert(cond, msg) _Static_assert(cond, #msg)
#else
// The old, hacky way
#define static_assert(cond, msg) typedef char static_assertion_##msg[(cond)?1:-1]
#endif

#endif

#endif

#endif
