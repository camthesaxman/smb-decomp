#!/usr/bin/env python3

import os
import re
import sys

addrs = set()

# get addresses
for fname in sys.argv[1:]:
    print('opening %s' % fname)
    with open(fname, 'rt') as f:
        for line in f.readlines():
            m = re.match(r'.*\.4byte\s+(0x80[0-9A-Fa-f]+)', line)
            if m:
                #print(line)
                addrs.add(int(m.groups()[0], 0))

labels = {}
currLabel = None
isFunc = False
alreadyGlobal = False

# add labels
for fname in sys.argv[1:]:
    print('labeling %s' % fname)
    fout = open(fname+'.new', 'wt')
    with open(fname, 'rt') as f:
        for line in f.readlines():
            m = re.match(r'/\* (80[0-9A-Fa-f]+) ', line)
            if m:
                a = int(m.groups()[0], 16)
                if a in addrs:
                    if currLabel:
                        l = currLabel
                        labels[a] = currLabel
                        #fout.write('.global %s\n%s:\n' % (l, l))
                        if not alreadyGlobal:
                            fout.write('.global %s\n' % l)
                    else:
                        if isFunc:
                            l = 'func_%08X' % a
                        else:
                            l = 'lbl_%08X' % a
                        labels[a] = l
                        fout.write('.global %s\n%s:\n' % (l, l))
                currLabel = None
                isFunc = False
                alreadyGlobal = False
            m = re.match(r'\s*([0-9A-Za-z_]*):', line)
            if m:
                #print(line)
                currLabel = m.groups()[0]
                fout.write(line)
                continue
            m = re.match(r'.*\sblr$', line)
            if m:
                isFunc = True
            m = re.match(r'\s*\.global', line)
            if m:
                alreadyGlobal = True
            fout.write(line)
    fout.close()
    os.rename(fname+'.new', fname)

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

