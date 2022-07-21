#ifndef _ERRNO_H_
#define _ERRNO_H_

#if TARGET_PC
#if _MSC_VER
#include <../ucrt/errno.h>
#else
#include_next <errno.h>
#endif
#else

//

#endif

#endif
