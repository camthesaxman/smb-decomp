#!/usr/bin/awk -f
# List all variables in the .bss, .sbss, .data, and .sdata, .sdata2, and .rodata sections, 

BEGIN { inSection = 0 }

/^.* section layout/ {
    inSection = $1 == ".bss" \
             || $1 == ".sbss" \
             || $1 == ".data" \
             || $1 == ".sdata" \
             || $1 == ".rodata" \
             || $1 == ".sdata2";
    if (inSection)
        print("\n// "$1" section");
}

inSection && /(entry of .*)/ {
    if (match($4, /^[A-Za-z_]/))
        print("// extern ? "$4";");
}

inSection && match($6, /.*\.o/) {
    if (match($5, /^[A-Za-z_]/))
        print("// extern ? "$5";");
}
