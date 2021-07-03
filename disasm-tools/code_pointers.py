#!/usr/bin/env python3

import os
import re
import sys

#addrs = set()
addrs = {
    0x8000E5A8,
    0x8001236C, 0x8001260C,           0x80093A14,
    0x8000A0B0, 0x8000EE34, 0x8000F670, 0x8000E708,
    0x8000EC7C, 0x8000E658, 0x8000E6A0, 0x8000E6BC,
    0x8000E6C0, 0x80011BE8, 0x80011CD0, 0x80011238,
    0x80011278, 0x80010560, 0x8001077C, 0x80010C0C,
    0x80010EA8, 0x8001100C, 0x80011120, 0x80010020,
    0x80010284, 0x80010114, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x80012524, 0x80012574, 0x80012524,
    0x80012574, 0x80012524, 0x800123F4, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x80012A7C, 0x80012E6C, 0x80012FD0, 0x80013140,
    0x800133AC, 0x800134E8, 0x80013668, 0x800139A8,
    0x800143C4, 0x800145A8, 0x80014728, 0x800147B8,
    0x8001267C, 0x800150D8, 0x8001520C, 0x80015948,
    0x80015A40, 0x80013E08, 0x80014048, 0x800129B0,
    0x80015564, 0x8001585C, 0x80014D24, 0x80014E78,
    0x80015BD0, 0x80015C78, 0x80015DA0, 0x80015ED8,
    0x80016358, 0x80016724, 0x80016D30, 0x80016E60,
    0x80016EF0, 0x80015464, 0x80015480, 0x80015D04,
    0x80015D44, 0x800152F8, 0x80015374, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x80093BFC, 0x80093C3C, 0x80093DE8, 0x80093E08,
    0x80093AB8, 0x80093B24, 0x80093AB8, 0x80093B24,
    0x80093AB8, 0x80093B24, 0x80093AB8, 0x80093B24,
    0x80093AB8, 0x80093B24, 0x80093AB8, 0x80093B24,
    0x80093AB8, 0x80093B24, 0x8009B9FC, 0x8009BAE4,
    0x800A752C, 0x800A75B4, 0x80093E48, 0x80093EE0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x8000A0B0,
    0x8000A0B0, 0x8000A0B0, 0x8000A0B0, 0x00000000,
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

