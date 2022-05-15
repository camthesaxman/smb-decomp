#!/usr/bin/env python
#
# dumps arrays of structs

import re
import sys
import struct

#startLabel = sys.argv[2]
startLabel = 'lbl_801C206C'  # starting label
#endLabel = 'lbl_0000CA5C'    # ending label
structFmt = '>hxxffBxxx'
GXColorFmt = '{%i, %i, %i, %i}'
cFmt = '{ %i, %3.8g, %3.8g, %i },'
dumping = False

def print_struct(data):
    print('    ' + (cFmt % data))

def read_label(line):
    m = re.match(r'glabel\s+(\w+)', line)
    if m:
        return m.groups()[0]
    m = re.match(r'(\w+):', line)
    if m:
        return m.groups()[0]
    return None

def read_data(line):
    # .4byte
    m = re.match(r'\s*\.4byte\s+(\w+)', line)
    if m:
        try:
            value = int(m.groups()[0], 0)
        except ValueError:
            value = 0xDEADBEEF
        return bytearray(
            [(value >> 24) & 0xFF,
            (value >> 16) & 0xFF,
            (value >> 8) & 0xFF,
            (value >> 0) & 0xFF])
    m = re.match(r'\s*\.byte\s+(\w+),\s*(\w+),\s*(\w+),\s*(\w+)', line)
    if m:
        return bytearray(
            [int(m.groups()[0], 0),
            int(m.groups()[1], 0),
            int(m.groups()[2], 0),
            int(m.groups()[3], 0)])
    return bytearray()

data = bytearray()

structSize = struct.calcsize(structFmt)
print('size = %i bytes' % structSize)

with open(sys.argv[1], 'r') as f:
    for line in f.readlines():
        if dumping:
            #if read_label(line) == endLabel:
            if read_label(line):
                break
            data += read_data(line)
        else:
            if read_label(line) == startLabel:
                dumping = True
                print('dumping')
                continue

#print(str(len(data)))
print('struct ? %s[] =\n{' % startLabel)
while len(data) >= structSize:
    print_struct(struct.unpack(structFmt, data[0:structSize]))
    data = data[structSize:]
print('};')
