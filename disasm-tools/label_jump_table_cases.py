#!/usr/bin/env python3

import os
import re
import sys

# args
fname = sys.argv[1]
jumpTable = sys.argv[2]

cases = {}

# get jump table targets
readingJumpTable = False
index = 0
with open(fname, 'rt') as f:
    for line in f.readlines():
        # strip comment
        commentStart = line.find('#')
        if commentStart != -1:
            line = line[:commentStart]
        #print(line)
        if readingJumpTable:
            m = re.match(r'.*\.4byte\s+([^ ]+)', line)
            if m:
                # record indexes of case label in bitmask
                label = m.groups()[0]
                if label in cases:
                    cases[label] |= 1 << index
                else:
                    cases[label] = 1 << index
                index += 1
            elif ":" in line:
                # next label. stop.
                break
        else:
            # look for label
            m = re.match(r'\s*(.*):', line)
            if m and m.groups()[0] == jumpTable:
                readingJumpTable = True

def bits_to_str(bits):
    string = ''
    i = 0
    while bits != 0:
        if bits & 1:
            string += ' %i' % i
        i += 1
        bits >>= 1
    return string

# add case label comments
fout = open(fname+'.new', 'wt')
with open(fname, 'rt') as f:
    for line in f.readlines():
        m = re.match(r'\s*(.*):', line)
        if m:
            label = m.groups()[0]
            if label in cases:
                #line += '  ;# case ' + bits_to_str(cases[label])
                line = line.rstrip() + '  ;# case ' + bits_to_str(cases[label]) + '\n'
        fout.write(line)
fout.close()
os.rename(fname+'.new', fname)
