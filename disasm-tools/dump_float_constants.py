#!/usr/bin/env python

import re
import struct
import sys

labelTypes = {}

currLabel = None
currType = None
readBytes = None

in_sdata2 = False

def decode_float(b):
    return struct.unpack('>f', bytearray(b))[0]

def decode_double(b):
    return struct.unpack('>d', bytearray(b))[0]

def u32_to_bytearray(val):
    b = [(val>>24)&0xFF, (val>>16)&0xFF, (val>>8)&0xFF, (val>>0)&0xFF]
    return bytearray(b)

def read_byte_directive(line):
    m = re.match(r'^\s*\.byte\s+([^,]+),\s*([^,]+),\s*([^,]+),\s*([^\s]+)', line)
    if m:
        g = m.groups()
        b = [int(g[0],0), int(g[1],0), int(g[2],0), int(g[3],0)]
        return bytearray(b)
    m = re.match(r'^\s*\.4byte\s+([^,]+)', line)
    if m:
        return u32_to_bytearray(int(m.groups()[0], 0))
    printf('can\'t parse "%s"' % line)
    assert(0)

def handle_text_section_line(line):
    global in_sdata2
    m = re.match(r'.*\s+lf(d|s)\s+\w+,\s+(\w+)-_SDA2_BASE_', line)
    if m:
        labelTypes[m.groups()[1]] = m.groups()[0]
    elif re.match(r'\s*\.section\s+\.sdata2', line):
        in_sdata2 = True

def handle_sdata2_section_line(line):
    global currLabel
    global currType
    global readBytes
    if currLabel:
        if re.match(r'\s*(\.byte|\.4byte)', line):
            readBytes += read_byte_directive(line)
            if (currType == 's' and len(readBytes) == 4) or (currType == 'd' and len(readBytes) == 8):
#                print('float' if currType == 's' else 'double')
                if currType == 'd':
                    print('const double %s = %.17g;' % (currLabel, decode_double(readBytes)))
                else:
                    print('const float %s = %.17gf;' % (currLabel, decode_float(readBytes)))
                readBytes = []
                currLabel = None
                currType = None
    else:
        m = re.match(r'\s*(\w+):', line)
        if m:
            lbl = m.groups()[0]
            if lbl not in labelTypes:
                print("don't know about %s" % lbl)
                exit()
#            print('label %s' % lbl)
            currLabel = lbl
            currType = labelTypes[lbl]
            readBytes = []
            
with open(sys.argv[1], 'rt') as f:
    for line in f.readlines():
        #print('sdata2? ' + str(in_sdata2))
        if in_sdata2:
            handle_sdata2_section_line(line)
        else:
            handle_text_section_line(line)
