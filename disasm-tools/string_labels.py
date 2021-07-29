#!/usr/bin/env python3

import os
import re
import sys

labelCounts = {}

hasLabel = False

def label_for_string(s):
    # replace any invalid char with underscore
    return "string_" + re.sub(r'[^A-Za-z0-9_]', '_', s)

def extract_string(line):
    m = re.search(r'"([^"]*)"', line)
    return m.groups()[0]

# add labels
for fname in sys.argv[1:]:
    print('labeling %s' % fname)
    fout = open(fname+'.new', 'wt')
    with open(fname, 'rt') as f:
        for line in f.readlines():
            if re.match(r'.*\.asciz', line) and not hasLabel:
                # add label
                label = label_for_string(extract_string(line))
                if label in labelCounts:
                    labelCounts[label] += 1
                    label = '%s_%i' % (label, labelCounts[label])
                else:
                    labelCounts[label] = 1
                fout.write('glabel %s\n' % label)
                hasLabel = False
            elif re.match(r'^[^\s]', line):
                hasLabel = True
            else:
                hasLabel = False
            fout.write(line)
    fout.close()
    os.rename(fname+'.new', fname)

# replace pointers
#for fname in sys.argv[1:]:
#    print('killing pointers in %s' % fname)
#    fout = open(fname+'.new', 'wt')
#    with open(fname, 'rt') as f:
#        for line in f.readlines():
#            m = re.match(r'.*\.4byte\s+(0x80[0-9A-Fa-f]+)', line)
#            if m:
#                a = int(m.groups()[0], 16)
#                if a in labels:
#                    line = line.replace(m.groups()[0], labels[a])
#            fout.write(line)
#    fout.close()
#    os.rename(fname+'.new', fname)

