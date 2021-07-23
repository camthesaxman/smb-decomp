#define ARRAY_COUNT(arr) ((int)(sizeof(arr)/sizeof(arr[0])))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))

// .bss variables seem to be ordered in the file based on their usage.
// This macro generates a dummy function that forces the order and will be
// stripped by the linker.
#define FORCE_BSS_ORDER(var) void *force_##var(){return &var;}

// paired-single registers
#define qr0 0
#define qr1 1
#define qr2 2
#define qr3 3

// GQR registers used for conversion
#define GQR_F32 0
#define GQR_U8  2
#define GQR_U16 3
#define GQR_S8  4
#define GQR_S16 5

#include "types.h"
#include "functions.h"
#include "variables.h"
