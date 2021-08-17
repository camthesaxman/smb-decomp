#define ARRAY_COUNT(arr) ((int)(sizeof(arr)/sizeof(arr[0])))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))

// .bss variables seem to be ordered in the file based on their usage.
// This macro generates a dummy function that forces the order and will be
// stripped by the linker.
#define FORCE_BSS_ORDER(var) void *force_##var(){return &var;}

// Possibly a different NULL definition caused by including dolphin.h before stddef.h
#define NULL2 ((void *)0)

#include "types.h"
#include "functions.h"
#include "variables.h"
