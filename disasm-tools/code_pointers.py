#!/usr/bin/env python3

import os
import re
import sys

#addrs = set()
addrs = {
    0x800A3DE8, 0x800A4050, 0x800A428C,
    0x80043A74, 0x80043B48, 0x80044104,
    0x80042BD4, 0x80042C4C, 0x80042E84,
    0x80037B84, 0x80038150, 0x800387BC,
    0x8006AE20, 0x8006AF44, 0x8006B108,
    0x80068048, 0x800681E4, 0x800682E0,
    0x80048C44, 0x80048C6C, 0x80048E40,
    0x8006A624, 0x8006A628, 0x8006A654,
    0x800AD3AC, 0x800AD644, 0x800AE3E4,
    0x80022F58, 0x8002303C, 0x80023AD4,
    0x80066910, 0x80066964, 0x80066C74,
    0x800B5EDC, 0x800B5F20, 0x800B6094,
    0x800A5734, 0x800A5860, 0x800A5AEC,
    0x8004CADC, 0x8004CBD0, 0x8004CCD0,
    0x80084264, 0x8008433C, 0x8008468C,
    0x800178FC, 0x80017990, 0x80017FC8,
    0x8006FED8, 0x8006FF70, 0x80070028,
    0x80094CD4, 0x80094CF8, 0x80095020,
    0x800298D8, 0x80029AC4, 0x8002A044,
    0x80054E04, 0x80054F1C, 0x80054F88,
    0x8009523C, 0x8009526C, 0x80095314,
}

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

