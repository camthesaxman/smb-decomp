#!/bin/sh

# Generates a context file for use with decomp.me

src_file="$1"

if [ -z "$WINE" ]
then
    WINE=wine
fi

if [ "${2:-}" = "-c" ]; then
    def=-DC_ONLY
fi

"$WINE" mwcc_compiler/1.1/mwcceppc.exe -EP -i src -I- -i include "$def" "$src_file"

