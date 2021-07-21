#define ARRAY_COUNT(arr) ((int)(sizeof(arr)/sizeof(arr[0])))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

// .bss variables seem to be ordered in the file based on their usage.
// This macro generates a dummy function that forces the order and will be
// stripped by the linker.
#define FORCE_BSS_ORDER(var) void *force_##var(){return &var;}

// paired-single registers
#define qr0 0
#define qr1 1
#define qr2 2
#define qr3 3

#include "types.h"
#include "functions.h"
#include "variables.h"
