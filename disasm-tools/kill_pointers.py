#!/usr/bin/env python3

import os
import re
import sys

labels = {}

# get addresses from map file
with open('supermonkeyball.map', 'rt') as f:
    for line in f.readlines():
        if "(entry of ." in line:
            m = re.match(r'\s+(\w+)\s+(\w+)\s+(\w+)\s+(\w+)', line)
            if m:
                g = m.groups()
                addr = int(g[2], 16)
                label = g[3]
                labels[addr] = label
                #print('label: %s, addr: %s' % (label, addr))

# replace pointers
for fname in sys.argv[1:]:
    print('killing pointers in %s' % fname)
    fout = open(fname+'.new', 'wt')
    with open(fname, 'rt') as f:
        for line in f.readlines():
            m = re.match(r'.*\.4byte\s+(0x80[0-9A-Fa-f]+)', line)
            if m:
                a = int(m.groups()[0], 16)
                if a in labels:
                    line = line.replace(m.groups()[0], labels[a])
            fout.write(line)
    fout.close()
    os.rename(fname+'.new', fname)

