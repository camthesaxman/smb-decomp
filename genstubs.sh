#!/bin/sh
echo '#include <stdio.h>' > stubs.c
make -f Makefile_pc 2>&1 | sed -ne "/undefined reference/{s/^.*\`\([^']*\)'.*/void \1(){puts(\"\1 is a stub\");}/g;p}" | sort -u > stubs.c

