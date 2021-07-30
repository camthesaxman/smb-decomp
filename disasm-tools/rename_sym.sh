#!/bin/bash

shopt -s globstar

if [ "$#" -ne "2" ];
then
    echo "usage: $0 old_name new_name"
    exit 1
fi

#echo "Replace $1 with $2?"
#read
C_FILES="$(find src -name *.c) $(find src -name *.h)"
ASM_FILES="$(find asm -name *.s) $(find asm -name *.inc)"
grep -rl "$1" $ASM_FILES $C_FILES ldscript.lcf | xargs sed -i "s/\b$1\b/$2/g"
