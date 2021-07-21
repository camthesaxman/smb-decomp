#!/usr/bin/awk -f
# List all functions in the .text section, excluding ones that start with lbl_

BEGIN { inTextSection = 0 }

/^.* section layout/ {
    inTextSection = ($1 == ".text");
}

inTextSection && /(entry of \.text)/ { 
    if (!match($4, /^lbl_/))
        print("// ? "$4"();");
}

inTextSection && $4=="4" {
    print("// ? "$5"();");
}
